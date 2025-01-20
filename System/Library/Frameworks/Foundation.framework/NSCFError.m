@interface NSCFError
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)allowsWeakReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)retainWeakReference;
- (Class)classForCoder;
- (NSCFError)initWithCoder:(id)a3;
- (id)userInfo;
@end

@implementation NSCFError

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual() != 0;
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (NSCFError)initWithCoder:(id)a3
{
  return (NSCFError *)-[NSError initWithCoder:](objc_alloc(&OBJC_CLASS___NSError), "initWithCoder:", a3);
}

- (id)userInfo
{
  return CFErrorCopyUserInfo((CFErrorRef)self);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

@end