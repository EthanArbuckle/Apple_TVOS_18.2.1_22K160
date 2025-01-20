@interface NSString(CacheManagementAdditions)
+ (id)stringWithFileSystemRepresentation:()CacheManagementAdditions length:;
+ (uint64_t)stringWithFileSystemRepresentation:()CacheManagementAdditions;
@end

@implementation NSString(CacheManagementAdditions)

+ (id)stringWithFileSystemRepresentation:()CacheManagementAdditions length:
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringWithFileSystemRepresentation:a3 length:a4];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)stringWithFileSystemRepresentation:()CacheManagementAdditions
{
  return [NSString stringWithFileSystemRepresentation:__s length:strlen(__s)];
}

@end