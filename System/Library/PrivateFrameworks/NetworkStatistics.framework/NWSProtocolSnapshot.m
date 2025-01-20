@interface NWSProtocolSnapshot
+ (void)initialize;
- (BOOL)countsIncludeHeaderOverhead;
- (BOOL)interfaceAWDL;
- (BOOL)interfaceCellular;
- (BOOL)interfaceCellularViaFallback;
- (BOOL)interfaceCellularViaPreferredFallback;
- (BOOL)interfaceCompanionLink;
- (BOOL)interfaceExpensive;
- (BOOL)interfaceLoopback;
- (BOOL)interfaceUnknown;
- (BOOL)interfaceWifi;
- (BOOL)interfaceWired;
- (NSData)localAddress;
- (NSData)remoteAddress;
- (NSDate)flowStartTimestamp;
- (NSString)euuid;
- (NSString)fuuid;
- (NSString)processName;
- (NSString)uuid;
- (NSString)vuuid;
- (double)_intervalWithContinuousTime:(unint64_t)a3;
- (double)_referenceIntervalWithContinuousTime:(unint64_t)a3;
- (double)flowDuration;
- (id)_createNSUUIDForBytes:(unsigned __int8)a3[16];
- (id)_dateWithContinuousTime:(unint64_t)a3;
- (int)epid;
- (int)processID;
- (unint64_t)eupid;
- (unint64_t)eventFlags;
- (unint64_t)flowStartContinuousTime;
- (unint64_t)networkActivityMapPart1;
- (unint64_t)networkActivityMapPart2;
- (unint64_t)networkActivityMapStartTime;
- (unint64_t)uniqueProcessID;
- (unsigned)interfaceIndex;
- (unsigned)receiveBufferSize;
- (unsigned)receiveBufferUsed;
- (unsigned)trafficClass;
@end

@implementation NWSProtocolSnapshot

- (id)_createNSUUIDForBytes:(unsigned __int8)a3[16]
{
  if (uuid_is_null(a3)) {
    v4 = 0LL;
  }
  else {
    v4 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3];
  }
  return v4;
}

- (double)_intervalWithContinuousTime:(unint64_t)a3
{
  LODWORD(v3) = timebase_info;
  LODWORD(v4) = *(_DWORD *)algn_18C4D7E1C;
  return (double)a3 * (double)v3 / (double)v4 / 1000000000.0;
}

- (double)_referenceIntervalWithContinuousTime:(unint64_t)a3
{
  int v5 = 9;
  do
  {
    uint64_t v6 = mach_continuous_time();
    [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
    double v8 = v7;
    uint64_t v9 = mach_continuous_time() - v6;
    -[NWSProtocolSnapshot _intervalWithContinuousTime:](self, "_intervalWithContinuousTime:", v9);
  }

  while (v10 * 1000000.0 >= 50.0 && v5-- != 0);
  uint64_t v12 = v6 + (v9 >> 1);
  if (v12 <= a3)
  {
    -[NWSProtocolSnapshot _intervalWithContinuousTime:](self, "_intervalWithContinuousTime:", a3 - v12);
    return v8 + v15;
  }

  else
  {
    -[NWSProtocolSnapshot _intervalWithContinuousTime:](self, "_intervalWithContinuousTime:", v12 - a3);
    return v8 - v13;
  }

- (id)_dateWithContinuousTime:(unint64_t)a3
{
  unint64_t v3 = (void *)MEMORY[0x189603F50];
  -[NWSProtocolSnapshot _referenceIntervalWithContinuousTime:](self, "_referenceIntervalWithContinuousTime:", a3);
  return (id)objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
}

+ (void)initialize
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_187FF5000, a2, OS_LOG_TYPE_ERROR, "mach_timebase_info failed %d", (uint8_t *)v2, 8u);
}

- (NSDate)flowStartTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 192LL, 1);
}

- (double)flowDuration
{
  return self->_flowDuration;
}

- (unint64_t)flowStartContinuousTime
{
  return self->_flowStartContinuousTime;
}

- (unsigned)interfaceIndex
{
  return self->_interfaceIndex;
}

- (unsigned)receiveBufferSize
{
  return self->_receiveBufferSize;
}

- (unsigned)receiveBufferUsed
{
  return self->_receiveBufferUsed;
}

- (unsigned)trafficClass
{
  return self->_trafficClass;
}

- (unint64_t)uniqueProcessID
{
  return self->_uniqueProcessID;
}

- (int)processID
{
  return self->_processID;
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 224LL, 1);
}

- (unint64_t)eupid
{
  return self->_eupid;
}

- (int)epid
{
  return self->_epid;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 240LL, 1);
}

- (NSString)euuid
{
  return (NSString *)objc_getProperty(self, a2, 248LL, 1);
}

- (NSString)fuuid
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (NSString)vuuid
{
  return (NSString *)objc_getProperty(self, a2, 264LL, 1);
}

- (NSData)localAddress
{
  return (NSData *)objc_getProperty(self, a2, 272LL, 1);
}

- (NSData)remoteAddress
{
  return (NSData *)objc_getProperty(self, a2, 280LL, 1);
}

- (BOOL)interfaceUnknown
{
  return self->_interfaceUnknown;
}

- (BOOL)interfaceLoopback
{
  return self->_interfaceLoopback;
}

- (BOOL)interfaceCellular
{
  return self->_interfaceCellular;
}

- (BOOL)interfaceCellularViaFallback
{
  return self->_interfaceCellularViaFallback;
}

- (BOOL)interfaceCellularViaPreferredFallback
{
  return self->_interfaceCellularViaPreferredFallback;
}

- (BOOL)interfaceWifi
{
  return self->_interfaceWifi;
}

- (BOOL)interfaceWired
{
  return self->_interfaceWired;
}

- (BOOL)interfaceAWDL
{
  return self->_interfaceAWDL;
}

- (BOOL)interfaceExpensive
{
  return self->_interfaceExpensive;
}

- (BOOL)interfaceCompanionLink
{
  return self->_interfaceCompanionLink;
}

- (BOOL)countsIncludeHeaderOverhead
{
  return self->_countsIncludeHeaderOverhead;
}

- (unint64_t)networkActivityMapStartTime
{
  return self->_networkActivityMapStartTime;
}

- (unint64_t)networkActivityMapPart1
{
  return self->_networkActivityMapPart1;
}

- (unint64_t)networkActivityMapPart2
{
  return self->_networkActivityMapPart2;
}

- (unint64_t)eventFlags
{
  return self->_eventFlags;
}

- (void).cxx_destruct
{
}

@end