@interface _CFPrefsPendingKVONotification
- (id)oldValues;
- (id)source;
- (id)values;
- (void)dealloc;
- (void)setOldValues:(void *)a1;
- (void)setSource:(void *)a1;
- (void)setValues:(void *)a1;
@end

@implementation _CFPrefsPendingKVONotification

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____CFPrefsPendingKVONotification;
  -[_CFPrefsPendingKVONotification dealloc](&v3, sel_dealloc);
}

- (id)source
{
  if (result) {
    return objc_getProperty(result, a2, 8LL, 1);
  }
  return result;
}

- (void)setSource:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 8LL);
  }
}

- (id)oldValues
{
  if (result) {
    return objc_getProperty(result, a2, 16LL, 1);
  }
  return result;
}

- (void)setOldValues:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 16LL);
  }
}

- (id)values
{
  if (result) {
    return objc_getProperty(result, a2, 24LL, 1);
  }
  return result;
}

- (void)setValues:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 24LL);
  }
}

@end