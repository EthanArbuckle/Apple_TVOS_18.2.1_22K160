@interface NSString
+ (id)base64StringFromData:(id)a3 length:(int)a4;
- (id)base64String;
@end

@implementation NSString

- (id)base64String
{
  v3 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  self,  0LL);
  id v4 = objc_msgSend((id)objc_opt_class(self), "base64StringFromData:length:", v3, -[NSData length](v3, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

+ (id)base64StringFromData:(id)a3 length:(int)a4
{
  id v4 = a3;
  id v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithCapacity:]( &OBJC_CLASS___NSMutableString,  "stringWithCapacity:",  v5));
    v8 = [v4 bytes];
    if (v6 >= 1)
    {
      id v28 = v4;
      uint64_t v9 = 0LL;
      v10 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
      p_ivars = &MobileAssetKeyManager__metaData.ivars;
      v12 = @"%c";
      uint64_t v13 = v6;
      do
      {
        for (uint64_t i = 0LL; i != 3; ++i)
        {
          else {
            char v15 = v8[i];
          }
          *(&v32 + i) = v15;
        }

        v31[0] = v32 >> 2;
        v31[1] = (v33 >> 4) & 0xCF | (16 * (v32 & 3));
        v31[2] = (v34 >> 6) & 0xC3 | (4 * (v33 & 0xF));
        v31[3] = v34 & 0x3F;
        if (v13 == 2) {
          unsigned int v16 = 3;
        }
        else {
          unsigned int v16 = 4;
        }
        unint64_t v29 = v13 - 1;
        v30 = v8;
        if (v13 == 1) {
          uint64_t v17 = 2LL;
        }
        else {
          uint64_t v17 = v16;
        }
        v18 = v31;
        uint64_t v19 = v17;
        do
        {
          int v20 = *v18++;
          uint64_t v21 = objc_claimAutoreleasedReturnValue(-[__objc2_ivar_list stringWithFormat:](p_ivars[137], "stringWithFormat:", v12, v10[v20]));
          v22 = v12;
          v23 = p_ivars;
          v24 = v10;
          v25 = (void *)v21;
          -[__CFString appendString:](v7, "appendString:", v21);

          v10 = v24;
          p_ivars = v23;
          v12 = v22;
          --v19;
        }

        while (v19);
        if (v29 <= 1)
        {
          do
          {
            -[__CFString appendString:](v7, "appendString:", @"=");
            unsigned int v26 = (unsigned __int16)v17;
            LODWORD(v17) = v17 + 1;
          }

          while (v26 < 3);
        }

        v9 += 3LL;
        uint64_t v13 = v6 - v9;
        v8 = v30 + 3;
      }

      while (v6 - v9 > 0);
      id v4 = v28;
    }
  }

  else
  {
    v7 = &stru_355768;
  }

  return v7;
}

@end