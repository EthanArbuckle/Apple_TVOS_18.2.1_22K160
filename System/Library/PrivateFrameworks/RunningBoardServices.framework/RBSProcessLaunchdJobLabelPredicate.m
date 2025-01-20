@interface RBSProcessLaunchdJobLabelPredicate
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessLaunchdJobLabelPredicate

- (BOOL)matchesProcess:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 hasConsistentLaunchdJob];
  v6 = -[RBSProcessStringPredicate identifier](self, "identifier");
  if (v5) {
    [v4 consistentLaunchdJobLabel];
  }
  else {
    [v4 applicationJobLabel];
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v6 isEqualToString:v7];

  return v8;
}

@end