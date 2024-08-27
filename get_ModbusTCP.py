
import os
import time
import pickle
import socket
import struct
import subprocess

from pymodbus.version import version
from pymodbus.server.asynchronous import StartTcpServer
from pymodbus.server.asynchronous import StartUdpServer
from pymodbus.server.asynchronous import StartSerialServer

from pymodbus.device import ModbusDeviceIdentification
from pymodbus.datastore import ModbusSequentialDataBlock
from pymodbus.datastore import ModbusSlaveContext, ModbusServerContext
from pymodbus.transaction import (ModbusRtuFramer,
                                  ModbusAsciiFramer,
                                  ModbusBinaryFramer)


from struct import unpack
from binascii import unhexlify
from pymodbus.constants import Endian
from pymodbus.payload import BinaryPayloadBuilder
from pymodbus.client.sync import ModbusTcpClient
from pymodbus.client.sync import ModbusSerialClient

debug = 1

# Read a holding register value from server
#    serv = IP
#    adr = adress 
#    uni = server unit 1, 2...
#    iah, ibh, ich = bushings voltage
#    side = HV or LV
def readHoldingFromServer(serv_ip, adr, uni):
    try:
        MBServ = ModbusTcpClient(host=serv_ip, port=502)
        MBServ.connect()
        # Address, count, slave address
        slave = MBServ.read_holding_registers(adr, 1, unit=uni) 
        MBServ.close()
    except Exception:
        # If we get an error reading from server, return error value
        return -1
    
    err = 0
    try:
        res = slave.registers[0]
        err = 1        
    except Exception:
        err = -1
    
    if err == 1:
        return res
    else:
        return -1  

# Error flags
errMODULES = 0

# Error counters
errMODULEScounter = 0

# Define lists
COILS = []
MODULES = []

# Create empty lists space in memory
for i in range(64+1):
    COILS.append(0)
for i in range(40+1):
    MODULES.append(0)



hardserverIP = '192.168.43.10'



'''
# Set relays state to OFF, in modbus server 8, from address 30                
builder = BinaryPayloadBuilder(byteorder=Endian.Big)
builder.add_16bit_uint(1)
builder.add_16bit_uint(1)
builder.add_16bit_uint(1)
builder.add_16bit_uint(1)
builder.add_16bit_uint(1)
builder.add_16bit_uint(1)
builder.add_16bit_uint(1)
builder.add_16bit_uint(1)
relayDataPacket1 = builder.build()            
try:
    MBServ = ModbusTcpClient(host=hardserverIP, port=502)
    MBServ.connect()
    res = MBServ.write_registers(30, relayDataPacket1, skip_encode = True, unit = 8)
    time.sleep(0.1)
    MBServ.close()
    if (debug == 1):
        print('RELAYS OK.')            
except Exception:
    if (debug == 1):
        print('RELAYS ERR.')
    pass
'''

try:
    while True:
        
        try:
            MBServ = ModbusTcpClient(host=hardserverIP, port=502)
            MBServ.connect()
            # Read data from MODULES
            digital_MODULES = MBServ.read_coils(0, 64, unit=2)
            time.sleep(0.1)
            COILS[0] = digital_MODULES.bits[0]
            MBServ.close()
            if (debug == 1):
                print('MODULE CO OK.')            
        except Exception:
            if (debug == 1):
                print('MODULE CO ERR.')
            pass


        try:
            MBServ = ModbusTcpClient(host=hardserverIP, port=502)
            MBServ.connect()
            # Read data from MODULES
            analog_MODULES = MBServ.read_holding_registers(0, 40, unit=2)   # address, count, slave address
            time.sleep(0.1)
            MODULES[0] = analog_MODULES.registers[0]
            MBServ.close()
            if (debug == 1):
                print('MODULE HR OK.')            
        except Exception:
            if (debug == 1):
                print('MODULE HR ERR.')
            pass

        if debug == 1:
            print('#####################################################')

        # Try to read stored registers, display if debug is active

        # and trigger error if there are no stored registers
        try:
            for i in range(60):
                COILS[i] = digital_MODULES.bits[i]
            for i in range(40):
                MODULES[i] = analog_MODULES.registers[i]
            errMODULES = 0
            if debug == 1:
                print('======== MODULES ok')
                print('CO: ', end=' ')
                for i in range(64):
                    if COILS[i] == True:
                        print(1, end=' ')
                    else:
                        print(0, end=' ')
                print('+')
                print('HR: ', end=' ')
                for i in range(40):
                    print(MODULES[i], end=' ')
                print('+')
        except Exception:
            pass

        if debug == 1:
            print('#####################################################')



        time.sleep(0.5)
except KeyboardInterrupt:
    exit(1)

'''
        # Try to read stored registers, display if debug is active
        # and trigger error if there are no stored registers
        try:
            for i in range(60):
                COILS[i] = digital_MODULES.bits[i]
            for i in range(40):
                MODULES[i] = analog_MODULES.registers[i]
            errMODULES = 0
            if debug == 1:
                print('======== MODULES ok')
                print('CO: ', end=' ')
                for i in range(64):
                    if COILS[i] == True:
                        print(1, end=' ')
                    else:
                        print(0, end=' ')
                print('+')
                print('HR: ', end=' ')
                for i in range(40):
                    print(MODULES[i], end=' ')
                print('+')
        except Exception:
            errMODULES = 1
            errMODULEScounter = errMODULEScounter + 1
            pass

            
        if debug == 1:
            print('############## RESET ERROR COUNTERS #################')

        # Reset error counter if we get a good reading
        if errMODULES == 0:
            errMODULEScounter = 0


        if debug == 1:
            print('############ INCREMENT ERROR COUNTERS ###############')

        errThreshold = 3
        
        # If MODULES not answering errThreshold times in a row, then load error values
        if errMODULEScounter > errThreshold:
            loadErrorValuesMODULES()
            if debug == 1:
                print('========  MODULES error')


        if debug == 1:
            print('######### TEST ERROR COUNTERS FOR OVERFLOW ##########')

        # Don't let error counters go to infinit
        if errMODULEScounter > 20:
            errMODULEScounter = 16


        # Set relays state in modbus server 8, from address 30                
        builder = BinaryPayloadBuilder(byteorder=Endian.Big)
        builder.add_16bit_uint(k1)
        builder.add_16bit_uint(k2)
        builder.add_16bit_uint(k3)
        builder.add_16bit_uint(k4)
        builder.add_16bit_uint(k5)
        builder.add_16bit_uint(k6)
        builder.add_16bit_uint(k7)
        builder.add_16bit_uint(k8)
        relayDataPacket1 = builder.build()            
        try:
            MBServ = ModbusTcpClient(host=hardserverIP, port=502)
            MBServ.connect()
            res = MBServ.write_registers(30, relayDataPacket1, skip_encode = True, unit = 8)
            time.sleep(0.1)
            MBServ.close()
            if (debug == 1):
                print('RELAYS OK.')            
        except Exception:
            if (debug == 1):
                print('RELAYS ERR.')
            pass

 
        time.sleep(1)
except KeyboardInterrupt:
    tcpclient.close()
    
'''


