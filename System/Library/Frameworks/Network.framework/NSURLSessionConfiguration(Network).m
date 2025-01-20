@interface NSURLSessionConfiguration(Network)
- (id)proxyConfigurations;
@end

@implementation NSURLSessionConfiguration(Network)

- (id)proxyConfigurations
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    [a1 _proxyConfigurations];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v3 = (void *)MEMORY[0x189604A58];
  }

  return v3;
}

@end