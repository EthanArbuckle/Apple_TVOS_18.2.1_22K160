@interface NSFileManager(ThreeBars)
+ (const)defaultsDomain;
+ (id)userCacheDirectoryPath;
+ (id)wifiCacheDirectoryPath;
@end

@implementation NSFileManager(ThreeBars)

+ (const)defaultsDomain
{
  return @"com.apple.wifid";
}

+ (id)userCacheDirectoryPath
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v0 count])
  {
    [v0 firstObject];
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v1 = 0LL;
  }

  return v1;
}

+ (id)wifiCacheDirectoryPath
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x1896078A8] defaultsDomain];
    [v1 stringByAppendingPathComponent:v2];
    id v3 = (id)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896078A8] defaultManager];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v2) = [v4 fileExistsAtPath:v3];

    if ((v2 & 1) != 0
      || ([MEMORY[0x1896078A8] defaultManager],
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = 0LL,
          int v6 = [v5 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v9],  v7 = v9,  v5,  v1 = 0,  v6)
      && !v7)
    {
      id v3 = v3;
      v1 = v3;
    }
  }

  else
  {
    id v3 = 0LL;
  }

  return v1;
}

@end