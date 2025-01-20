@interface AppleDeviceQueryLockerSupport
- (AppleDeviceQueryCacheSupport)keysCacheForCopyValue;
- (void)initData;
- (void)logHandler;
- (void)setKeysCacheForCopyValue:(id)a3;
- (void)setLogHandler:(void *)a3;
@end

@implementation AppleDeviceQueryLockerSupport

- (void)initData
{
  v3 = -[AppleDeviceQueryCacheSupport initWithName:andCapacity:andCacheType:]( objc_alloc(&OBJC_CLASS___AppleDeviceQueryCacheSupport),  "initWithName:andCapacity:andCacheType:",  @"ZCV",  &unk_18A34EDD0,  0LL);
  keysCacheForCopyValue = self->_keysCacheForCopyValue;
  self->_keysCacheForCopyValue = v3;
}

- (void)logHandler
{
  return self->_logHandler;
}

- (void)setLogHandler:(void *)a3
{
  self->_logHandler = a3;
}

- (AppleDeviceQueryCacheSupport)keysCacheForCopyValue
{
  return (AppleDeviceQueryCacheSupport *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setKeysCacheForCopyValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end