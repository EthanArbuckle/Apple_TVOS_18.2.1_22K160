@interface _NSNoChangeToken
+ (BOOL)supportsSecureCoding;
+ (id)allocWithZone:(_NSZone *)a3;
+ (void)initialize;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (_NSNoChangeToken)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)retainCount;
@end

@implementation _NSNoChangeToken

+ (void)initialize
{
  if (!_NSNoChangeSingleton)
  {
    id v3 = NSAllocateObject((Class)a1, 0LL, 0LL);
    _NSNoChangeSingleton = (uint64_t)v3;
    if (v3)
    {
      v4.receiver = v3;
      v4.super_class = (Class)&OBJC_CLASS____NSNoChangeToken;
      objc_msgSendSuper2(&v4, sel_init);
    }
  }

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)_NSNoChangeSingleton;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (id)description
{
  return @"~~[[NO CHANGE]]~~";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSNoChangeToken)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSNoChangeToken;
  return -[_NSNoChangeToken init](&v4, sel_init, a3);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (unint64_t)hash
{
  return _NSNoChangeSingleton;
}

@end