@interface NSProxy(MCMRedaction)
- (__CFString)redactedDescription;
@end

@implementation NSProxy(MCMRedaction)

- (__CFString)redactedDescription
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v1 redactedDescription];
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v2 = @"<~~~>";
  }

  return v2;
}

@end