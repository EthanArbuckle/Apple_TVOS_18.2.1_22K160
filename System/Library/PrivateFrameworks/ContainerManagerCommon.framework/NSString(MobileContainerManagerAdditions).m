@interface NSString(MobileContainerManagerAdditions)
+ (id)stringWithFileSystemRepresentation:()MobileContainerManagerAdditions length:;
+ (uint64_t)stringWithFileSystemRepresentation:()MobileContainerManagerAdditions;
- (uint64_t)containsDotDotPathComponents;
@end

@implementation NSString(MobileContainerManagerAdditions)

- (uint64_t)containsDotDotPathComponents
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  [a1 pathComponents];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * v5) isEqualToString:@".."])
        {
          uint64_t v6 = 1LL;
          goto LABEL_11;
        }

        ++v5;
      }

      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v8 count:16];
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

+ (id)stringWithFileSystemRepresentation:()MobileContainerManagerAdditions length:
{
  return (id)[objc_alloc(NSString) initWithBytes:a3 length:a4 encoding:_NSDefaultFileSystemEncoding()];
}

+ (uint64_t)stringWithFileSystemRepresentation:()MobileContainerManagerAdditions
{
  return [NSString stringWithFileSystemRepresentation:__s length:strlen(__s)];
}

@end