@interface RBSProcessExecPathStartsWithPredicate
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessExecPathStartsWithPredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4 = a3;
  [v4 executablePath];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || ([v4 bundle],
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        [v6 executablePath],
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5))
  {
    v7 = -[RBSProcessStringPredicate identifier](self, "identifier");
    char v8 = [v5 hasPrefix:v7];
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

@end