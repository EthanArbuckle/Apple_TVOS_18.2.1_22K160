@interface RBSProcessHostIdentifierPredicate
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessHostIdentifierPredicate

- (BOOL)matchesProcess:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 isXPCService])
  {
    [v4 hostIdentifier];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      int v7 = objc_msgSend(v5, "rbs_pid");
      BOOL v8 = v7 == -[RBSProcessIdentifier rbs_pid](self->super._identifier, "rbs_pid");
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end