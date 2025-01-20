@interface RBSProcessExtensionPointPredicate
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessExtensionPointPredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4 = a3;
  [v4 identity];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 isExtension];

  if (v6)
  {
    v7 = -[RBSProcessStringPredicate identifier](self, "identifier");
    [v4 bundle];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 extensionPointIdentifier];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    char v10 = [v7 isEqualToString:v9];
  }

  else
  {
    char v10 = 0;
  }

  return v10;
}

@end