@interface SAHACommandCompleted
- (int64_t)resultCallbackCode;
@end

@implementation SAHACommandCompleted

- (int64_t)resultCallbackCode
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SAHACommandCompleted commandOutcome](self, "commandOutcome"));
  unsigned int v3 = [v2 isEqualToString:SAHACommandOutcomeCOMMAND_SUCCESSValue];

  return v3 - 1LL;
}

@end