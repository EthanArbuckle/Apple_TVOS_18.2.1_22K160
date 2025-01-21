@interface WiFiTrafficEngManager
- (WFTrafficEngManager)trafficEng;
- (WiFiTrafficEngManager)initWithArgs:(__WiFiLQAMgr *)a3;
- (__CFDictionary)retrieveCurrentLinkHealth;
- (__CFDictionary)retrieveEventDetails;
- (__WiFiDeviceManager)deviceMgr;
- (__WiFiLQAMgr)lqaMgr;
- (void)dealloc;
- (void)discoveryIndication;
- (void)handleCriticalAppEvent:(id)a3;
- (void)setDeviceMgr:(__WiFiDeviceManager *)a3;
- (void)setLqaMgr:(__WiFiLQAMgr *)a3;
- (void)setTrafficEng:(id)a3;
@end

@implementation WiFiTrafficEngManager

- (WiFiTrafficEngManager)initWithArgs:(__WiFiLQAMgr *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___WiFiTrafficEngManager;
  v4 = -[WiFiTrafficEngManager init](&v9, "init");
  if (!v4)
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s Failed to allocate" message:4 "-[WiFiTrafficEngManager initWithArgs:]"];
    }
    goto LABEL_9;
  }

  v5 = -[WFTrafficEngManager initWithTrafficEngDelegate:]( objc_alloc(&OBJC_CLASS___WFTrafficEngManager),  "initWithTrafficEngDelegate:",  v4);
  if (!v5)
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_100219F60) {
      [qword_100219F60 WFLog:@"%s lqaMgr is nil" message:4 "-[WiFiTrafficEngManager initWithArgs:]"];
    }
LABEL_9:
    objc_autoreleasePoolPop(v8);

    return 0LL;
  }

  v6 = v5;
  -[WiFiTrafficEngManager setLqaMgr:](v4, "setLqaMgr:", a3);
  -[WiFiTrafficEngManager setTrafficEng:](v4, "setTrafficEng:", v6);

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiTrafficEngManager;
  -[WiFiTrafficEngManager dealloc](&v3, "dealloc");
}

- (__CFDictionary)retrieveCurrentLinkHealth
{
  return sub_10001FFA4((const UInt8 *)-[WiFiTrafficEngManager lqaMgr](self, "lqaMgr"));
}

- (void)handleCriticalAppEvent:(id)a3
{
}

- (void)discoveryIndication
{
  v2 = -[WiFiTrafficEngManager lqaMgr](self, "lqaMgr");
  nullsub_1(v2, v3, v4);
}

- (__CFDictionary)retrieveEventDetails
{
  return sub_1000204A4((uint64_t *)-[WiFiTrafficEngManager lqaMgr](self, "lqaMgr"));
}

- (WFTrafficEngManager)trafficEng
{
  return (WFTrafficEngManager *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTrafficEng:(id)a3
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

- (__WiFiLQAMgr)lqaMgr
{
  return self->_lqaMgr;
}

- (void)setLqaMgr:(__WiFiLQAMgr *)a3
{
  self->_lqaMgr = a3;
}

@end