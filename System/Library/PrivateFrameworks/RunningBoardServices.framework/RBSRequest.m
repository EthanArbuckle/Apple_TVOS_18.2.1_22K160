@interface RBSRequest
+ (BOOL)supportsRBSXPCSecureCoding;
- (RBSRequest)init;
- (id)_init;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSRequest

- (RBSRequest)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBSRequest.m" lineNumber:23 description:@"-init is not allowed on RBSRequest"];

  return 0LL;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBSRequest;
  return -[RBSRequest init](&v3, sel_init);
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

@end