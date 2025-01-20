@interface NSMutableData(SecRandom)
+ (id)dataWithRandomBytes:()SecRandom;
@end

@implementation NSMutableData(SecRandom)

+ (id)dataWithRandomBytes:()SecRandom
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const __SecRandom *)*MEMORY[0x18960BE08];
  size_t v5 = [v3 length];
  id v6 = v3;
  else {
    id v7 = v6;
  }

  return v7;
}

@end