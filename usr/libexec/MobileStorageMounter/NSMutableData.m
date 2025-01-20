@interface NSMutableData
+ (NSMutableData)dataWithHexString:(id)a3;
- (id)initDataWithHexString:(id)a3;
@end

@implementation NSMutableData

+ (NSMutableData)dataWithHexString:(id)a3
{
  id v3 = a3;
  id v4 = -[NSMutableData initDataWithHexString:](objc_alloc(&OBJC_CLASS___NSMutableData), "initDataWithHexString:", v3);

  return (NSMutableData *)v4;
}

- (id)initDataWithHexString:(id)a3
{
  id v4 = a3;
  __int16 v17 = 0;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet alphanumericCharacterSet](&OBJC_CLASS___NSCharacterSet, "alphanumericCharacterSet"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByTrimmingCharactersInSet:v5]);

    if ([v6 isEqualToString:&stru_10002F6C8])
    {
      else {
        v7 = (NSString *)[v4 copy];
      }
      v9 = v7;
      self = -[NSMutableData init](self, "init");
      if (self)
      {
        if ((int)-[NSString length](v9, "length") >= 2)
        {
          uint64_t v10 = 0LL;
          uint64_t v11 = 1LL;
          do
          {
            __str[0] = -[NSString characterAtIndex:](v9, "characterAtIndex:", v11 - 1);
            __str[1] = -[NSString characterAtIndex:](v9, "characterAtIndex:", v11);
            HIBYTE(v17) = strtol(__str, 0LL, 16);
            -[NSMutableData appendBytes:length:](self, "appendBytes:length:", (char *)&v17 + 1, 1LL);
            ++v10;
            int v12 = -[NSString length](v9, "length");
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

        v8 = self;
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

  v14 = v8;

  return v14;
}

@end