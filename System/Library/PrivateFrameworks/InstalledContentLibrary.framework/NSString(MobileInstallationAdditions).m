@interface NSString(MobileInstallationAdditions)
+ (id)stringWithFileSystemRepresentation:()MobileInstallationAdditions length:;
+ (uint64_t)stringWithFileSystemRepresentation:()MobileInstallationAdditions;
- (uint64_t)containsDotDotPathComponents;
@end

@implementation NSString(MobileInstallationAdditions)

+ (id)stringWithFileSystemRepresentation:()MobileInstallationAdditions length:
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringWithFileSystemRepresentation:a3 length:a4];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)stringWithFileSystemRepresentation:()MobileInstallationAdditions
{
  return [NSString stringWithFileSystemRepresentation:__s length:strlen(__s)];
}

- (uint64_t)containsDotDotPathComponents
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  [a1 pathComponents];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v5), "isEqualToString:", @"..", (void)v8))
        {
          uint64_t v6 = 1LL;
          goto LABEL_11;
        }

        ++v5;
      }

      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  uint64_t v6 = 0LL;
LABEL_11:

  return v6;
}

@end