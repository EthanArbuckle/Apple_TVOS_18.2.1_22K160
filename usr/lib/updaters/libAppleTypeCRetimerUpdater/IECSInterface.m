@interface IECSInterface
@end

@implementation IECSInterface

void __44__IECSInterface_GoldRestore2_sharedInstance__block_invoke(uint64_t a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v6 = v1;
    uint64_t v3 = [v1 count];
    v2 = v6;
    if (v3)
    {
      uint64_t v4 = [v6 objectAtIndexedSubscript:0];
      v5 = (void *)sharedInstance_sharedInstance;
      sharedInstance_sharedInstance = v4;

      [(id)sharedInstance_sharedInstance setLocatedObjects:v6];
      v2 = v6;
    }
  }
}

@end