@interface __NSCFError
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (__NSCFError)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)userInfo;
@end

@implementation __NSCFError

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0LL;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0LL;
}

- (__NSCFError)initWithCoder:(id)a3
{
  return (__NSCFError *)[objc_alloc(objc_lookUpClass("NSError")) initWithCoder:a3];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)userInfo
{
  return CFErrorCopyUserInfo((CFErrorRef)self);
}

- (Class)classForCoder
{
  return objc_lookUpClass("NSError");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[objc_class initWithDomain:code:userInfo:]( -[objc_class allocWithZone:](objc_lookUpClass("NSError"), "allocWithZone:", a3),  "initWithDomain:code:userInfo:",  -[__NSCFError domain](self, "domain"),  -[__NSCFError code](self, "code"),  -[__NSCFError userInfo](self, "userInfo"));
}

@end