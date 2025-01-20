@interface LSBundleProxy(RBLSExtension)
- (id)_rb_extensionPointIdentifier;
@end

@implementation LSBundleProxy(RBLSExtension)

- (id)_rb_extensionPointIdentifier
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [a1 extensionPoint];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 identifier];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

@end