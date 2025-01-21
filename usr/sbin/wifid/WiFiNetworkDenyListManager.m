@interface WiFiNetworkDenyListManager
- (BOOL)isUserModeInteractive;
- (BOOL)retrieveBatteryInfo:(BOOL *)a3 batteryLevel:(unsigned int *)a4;
- (CWFNetworkDenyList)networkDenyList;
- (NSString)ifName;
- (WiFiNetworkDenyListManager)initWithArgs:(__WiFiDeviceManager *)a3 interfaceName:(id)a4;
- (__WiFiDeviceManager)deviceMgr;
- (void)dealloc;
- (void)denyListDidUpdate;
- (void)setDeviceMgr:(__WiFiDeviceManager *)a3;
- (void)setIfName:(id)a3;
- (void)setNetworkDenyList:(id)a3;
@end

@implementation WiFiNetworkDenyListManager

- (WiFiNetworkDenyListManager)initWithArgs:(__WiFiDeviceManager *)a3 interfaceName:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___WiFiNetworkDenyListManager;
  v6 = -[WiFiNetworkDenyListManager init](&v11, "init");
  if (!v6)
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s Failed to allocate",  "-[WiFiNetworkDenyListManager initWithArgs:interfaceName:]");
    }
    goto LABEL_9;
  }

  v7 = -[CWFNetworkDenyList initWithDenyListDeviceProfile:]( objc_alloc(&OBJC_CLASS___CWFNetworkDenyList),  "initWithDenyListDeviceProfile:",  1LL);
  if (!v7)
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s deviceManager is nil",  "-[WiFiNetworkDenyListManager initWithArgs:interfaceName:]");
    }
LABEL_9:
    objc_autoreleasePoolPop(v10);

    return 0LL;
  }

  v8 = v7;
  -[WiFiNetworkDenyListManager setDeviceMgr:](v6, "setDeviceMgr:", a3);
  -[WiFiNetworkDenyListManager setIfName:](v6, "setIfName:", a4);
  -[CWFNetworkDenyList setEnabled:](v8, "setEnabled:", 1LL);
  -[WiFiNetworkDenyListManager setNetworkDenyList:](v6, "setNetworkDenyList:", v8);

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiNetworkDenyListManager;
  -[WiFiNetworkDenyListManager dealloc](&v3, "dealloc");
}

- (BOOL)retrieveBatteryInfo:(BOOL *)a3 batteryLevel:(unsigned int *)a4
{
  unsigned __int8 v12 = 0;
  unsigned int v11 = 0;
  if (!a3 || !a4)
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s Batterylevel:%p. externalPowerSupply:%p",  "-[WiFiNetworkDenyListManager retrieveBatteryInfo:batteryLevel:]",  a4,  a3);
    }
    goto LABEL_11;
  }

  int v6 = sub_1000F0268((uint64_t)self->_deviceMgr, (uint64_t)&v12, (uint64_t)&v11);
  v7 = objc_autoreleasePoolPush();
  if (!v6)
  {
    if (qword_100219F60) {
      objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  4,  "%s Callbacks not available ",  "-[WiFiNetworkDenyListManager retrieveBatteryInfo:batteryLevel:]",  v9,  v10);
    }
LABEL_11:
    objc_autoreleasePoolPop(v7);
    return 0;
  }

  if (qword_100219F60) {
    objc_msgSend( (id)qword_100219F60,  "WFLog:message:",  3,  "%s BatteryInfo. batterylevel:%u. externalPowerSupply:%u",  "-[WiFiNetworkDenyListManager retrieveBatteryInfo:batteryLevel:]",  v11,  v12);
  }
  objc_autoreleasePoolPop(v7);
  *a3 = v12 != 0;
  *a4 = v11;
  return 1;
}

- (BOOL)isUserModeInteractive
{
  return sub_1000F02A4((uint64_t)self->_deviceMgr);
}

- (void)denyListDidUpdate
{
}

- (CWFNetworkDenyList)networkDenyList
{
  return (CWFNetworkDenyList *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setNetworkDenyList:(id)a3
{
}

- (__WiFiDeviceManager)deviceMgr
{
  return self->_deviceMgr;
}

- (void)setDeviceMgr:(__WiFiDeviceManager *)a3
{
  self->_deviceMgr = a3;
}

- (NSString)ifName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setIfName:(id)a3
{
}

@end