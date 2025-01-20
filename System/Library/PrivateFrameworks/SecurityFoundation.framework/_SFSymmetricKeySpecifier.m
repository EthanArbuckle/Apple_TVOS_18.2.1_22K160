@interface _SFSymmetricKeySpecifier
- (int64_t)keyLengthInBytes;
@end

@implementation _SFSymmetricKeySpecifier

- (int64_t)keyLengthInBytes
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2, self, @"SFKey.m", 223, @"%@ key specifiers are not yet supported", v6 object file lineNumber description];

  return 0LL;
}

- (void).cxx_destruct
{
}

@end