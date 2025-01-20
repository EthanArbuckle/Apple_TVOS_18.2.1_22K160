@interface IXPromisedInMemoryDictionarySeed
+ (BOOL)supportsSecureCoding;
- (IXPromisedInMemoryDictionarySeed)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IXPromisedInMemoryDictionarySeed

- (IXPromisedInMemoryDictionarySeed)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IXPromisedInMemoryDictionarySeed;
  return -[IXOwnedDataPromiseSeed initWithCoder:](&v4, "initWithCoder:", a3);
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IXPromisedInMemoryDictionarySeed;
  -[IXOwnedDataPromiseSeed encodeWithCoder:](&v3, "encodeWithCoder:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IXPromisedInMemoryDictionarySeed;
  return -[IXOwnedDataPromiseSeed copyWithZone:](&v4, "copyWithZone:", a3);
}

@end