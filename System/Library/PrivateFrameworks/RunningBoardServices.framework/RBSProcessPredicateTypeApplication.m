@interface RBSProcessPredicateTypeApplication
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessPredicateTypeApplication

- (BOOL)matchesProcess:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isApplication];

  return v4;
}

@end