@interface RBSProcessBundleIdentifierPredicate
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessBundleIdentifierPredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4 = a3;
  v5 = -[RBSProcessStringPredicate identifier](self, "identifier");
  [v4 identity];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 embeddedApplicationIdentifier];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    char v8 = [v5 isEqualToString:v7];
  }

  else
  {
    [v4 bundle];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 identifier];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v5 isEqualToString:v10];
  }

  return v8;
}

@end