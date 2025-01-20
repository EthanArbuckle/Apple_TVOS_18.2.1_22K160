@interface RBSProcessBeforeTranslocationBundlePathPredicate
- (BOOL)matchesProcess:(id)a3;
- (RBSProcessBeforeTranslocationBundlePathPredicate)init;
- (RBSProcessBeforeTranslocationBundlePathPredicate)initWithIdentifier:(id)a3;
@end

@implementation RBSProcessBeforeTranslocationBundlePathPredicate

- (RBSProcessBeforeTranslocationBundlePathPredicate)initWithIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RBSProcessBeforeTranslocationBundlePathPredicate;
  result = -[RBSProcessStringPredicate initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (RBSProcessBeforeTranslocationBundlePathPredicate)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBSProcessBeforeTranslocationBundlePathPredicate;
  result = -[RBSProcessBeforeTranslocationBundlePathPredicate init](&v3, sel_init);
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BOOL)matchesProcess:(id)a3
{
  id v4 = a3;
  v5 = -[RBSProcessBeforeTranslocationBundlePathPredicate beforeTranslocationBundlePath]( self,  "beforeTranslocationBundlePath");
  [v4 beforeTranslocationBundlePath];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (void).cxx_destruct
{
}

@end