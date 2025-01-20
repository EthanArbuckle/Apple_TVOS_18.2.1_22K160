@interface NSString(PrintUtils)
+ (id)stringWithDescString:()PrintUtils;
@end

@implementation NSString(PrintUtils)

+ (id)stringWithDescString:()PrintUtils
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = v3;
    if (*(_BYTE *)([v6 UTF8String] + v5 - 1) == 10) {
      objc_msgSend(v6, "deleteCharactersInRange:");
    }
  }

  [NSString stringWithString:v3];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end