@interface NSData
+ (id)oct_dataWithHexString:(id)a3;
@end

@implementation NSData

+ (id)oct_dataWithHexString:(id)a3
{
  id v4 = a3;
  __str[2] = 0;
  v5 = malloc((unint64_t)[v4 length] >> 1);
  if ([v4 length])
  {
    unint64_t v6 = 0LL;
    v7 = v5;
    do
    {
      unsigned __int8 v8 = [v4 characterAtIndex:v6];
      unsigned __int8 v9 = [v4 characterAtIndex:v6 + 1];
      __str[0] = v8;
      __str[1] = v9;
      v12 = 0LL;
      *v7++ = strtoul(__str, &v12, 16);
      v6 += 2LL;
    }

    while (v6 < (unint64_t)[v4 length]);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( a1,  "dataWithBytesNoCopy:length:freeWhenDone:",  v5,  (unint64_t)objc_msgSend(v4, "length") >> 1,  1));

  return v10;
}

@end