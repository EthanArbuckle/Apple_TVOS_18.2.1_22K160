@interface MCMDataContainer
+ (int64_t)typeContainerClass;
- (BOOL)wipeAllMyContainerContent:(id *)a3;
@end

@implementation MCMDataContainer

+ (int64_t)typeContainerClass
{
  return 0LL;
}

- (BOOL)wipeAllMyContainerContent:(id *)a3
{
  uint64_t v4 = container_delete_all_container_content();
  if (v4 == 1)
  {
    id v5 = 0LL;
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:@"MCMErrorDomain" code:v4 userInfo:0];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (a3 && v5)
    {
      id v5 = v5;
      *a3 = v5;
    }
  }

  return v4 == 1;
}

@end