@interface NSMutableData(MobileStorageMounter)
+ (id)dataWithHexString:()MobileStorageMounter;
- (id)initDataWithHexString:()MobileStorageMounter;
@end

@implementation NSMutableData(MobileStorageMounter)

+ (id)dataWithHexString:()MobileStorageMounter
{
  v3 = (objc_class *)MEMORY[0x189603FB8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initDataWithHexString:v4];

  return v5;
}

- (id)initDataWithHexString:()MobileStorageMounter
{
  id v4 = a3;
  __int16 v17 = 0;
  if (v4)
  {
    [MEMORY[0x189607810] alphanumericCharacterSet];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringByTrimmingCharactersInSet:v5];
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v6 isEqualToString:&stru_18A214FC8])
    {
      if ([v4 length]) {
        uint64_t v7 = [objc_alloc(NSString) initWithFormat:@"0%@", v4];
      }
      else {
        uint64_t v7 = [v4 copy];
      }
      v9 = (void *)v7;
      a1 = (id)[a1 init];
      if (a1)
      {
        if ((int)[v9 length] >= 2)
        {
          uint64_t v10 = 0LL;
          uint64_t v11 = 1LL;
          do
          {
            __str[0] = [v9 characterAtIndex:v11 - 1];
            __str[1] = [v9 characterAtIndex:v11];
            HIBYTE(v17) = strtol(__str, 0LL, 16);
            [a1 appendBytes:(char *)&v17 + 1 length:1];
            ++v10;
            int v12 = [v9 length];
            if (v12 >= 0) {
              int v13 = v12;
            }
            else {
              int v13 = v12 + 1;
            }
            v11 += 2LL;
          }

          while (v10 < v13 >> 1);
        }

        v8 = a1;
      }

      else
      {
        v8 = 0LL;
      }
    }

    else
    {
      v8 = 0LL;
      v9 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
    v9 = 0LL;
    v6 = 0LL;
  }

  id v14 = v8;

  return v14;
}

@end