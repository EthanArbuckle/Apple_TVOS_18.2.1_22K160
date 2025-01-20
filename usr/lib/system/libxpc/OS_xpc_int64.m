@interface OS_xpc_int64
- (BOOL)allowsWeakReference;
- (BOOL)retainWeakReference;
- (OS_xpc_int64)retain;
- (unint64_t)retainCount;
- (void)release;
@end

@implementation OS_xpc_int64

- (OS_xpc_int64)retain
{
  return self;
}

- (void)release
{
}

- (BOOL)retainWeakReference
{
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___OS_xpc_int64;
  return -[OS_object retainWeakReference](&v5, sel_retainWeakReference);
}

- (BOOL)allowsWeakReference
{
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___OS_xpc_int64;
  return -[OS_object allowsWeakReference](&v5, sel_allowsWeakReference);
}

- (unint64_t)retainCount
{
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___OS_xpc_int64;
  return -[OS_object retainCount](&v5, sel_retainCount);
}

@end