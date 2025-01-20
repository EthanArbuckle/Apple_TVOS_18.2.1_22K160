@interface PolicyRequest
+ (BOOL)supportsSecureCoding;
- (PolicyRequest)init;
- (PolicyRequest)initWithCoder:(id)a3;
@end

@implementation PolicyRequest

- (PolicyRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PolicyRequest;
  return -[PolicyRequest init](&v3, "init");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PolicyRequest)initWithCoder:(id)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___PolicyRequest);

  return v4;
}

@end