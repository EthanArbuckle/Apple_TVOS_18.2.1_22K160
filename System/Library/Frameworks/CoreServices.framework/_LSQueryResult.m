@interface _LSQueryResult
+ (BOOL)supportsSecureCoding;
- (_LSQueryResult)init;
- (id)_init;
@end

@implementation _LSQueryResult

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____LSQueryResult;
  return -[_LSQueryResult init](&v3, sel_init);
}

- (_LSQueryResult)init
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end