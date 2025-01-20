@interface NSString
+ (id)hexStringWithData:(id)a3;
- (id)initHexStringWithData:(id)a3;
@end

@implementation NSString

+ (id)hexStringWithData:(id)a3
{
  id v3 = a3;
  id v4 = -[NSString initHexStringWithData:](objc_alloc(&OBJC_CLASS___NSString), "initHexStringWithData:", v3);

  return v4;
}

- (id)initHexStringWithData:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && (id v6 = [v4 length],
        v7 = (unsigned __int8 *)[v5 bytes],
        uint64_t v8 = 2LL * (void)v6,
        (v9 = (char *)malloc(2LL * (void)v6)) != 0LL))
  {
    if (v6)
    {
      v10 = v9 + 1;
      do
      {
        unsigned int v12 = *v7++;
        unsigned int v11 = v12;
        if (v12 <= 0x9F) {
          char v13 = 48;
        }
        else {
          char v13 = 55;
        }
        *(v10 - 1) = v13 + (v11 >> 4);
        unsigned int v14 = v11 & 0xF;
        if (v14 <= 9) {
          char v15 = 48;
        }
        else {
          char v15 = 55;
        }
        _BYTE *v10 = v15 + v14;
        v10 += 2;
        id v6 = (char *)v6 - 1;
      }

      while (v6);
    }

    self =  -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( self,  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v9,  v8,  1LL,  1LL);
    v16 = self;
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

@end