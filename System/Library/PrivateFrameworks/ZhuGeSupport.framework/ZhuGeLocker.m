@interface ZhuGeLocker
- (ZhuGeCache)keysCacheForCopyValue;
- (void)initData;
- (void)logHandler;
- (void)setKeysCacheForCopyValue:(id)a3;
- (void)setLogHandler:(void *)a3;
@end

@implementation ZhuGeLocker

- (void)initData
{
  v3 = -[ZhuGeCache initWithName:andCapacity:andCacheType:]( objc_alloc(&OBJC_CLASS___ZhuGeCache),  "initWithName:andCapacity:andCacheType:",  @"ZCV",  &unk_18A0D87B8,  0LL);
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

- (ZhuGeCache)keysCacheForCopyValue
{
  return (ZhuGeCache *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setKeysCacheForCopyValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end