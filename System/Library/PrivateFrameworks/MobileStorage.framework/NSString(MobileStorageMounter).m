@interface NSString(MobileStorageMounter)
+ (id)hexStringWithData:()MobileStorageMounter;
- (id)initHexStringWithData:()MobileStorageMounter;
@end

@implementation NSString(MobileStorageMounter)

+ (id)hexStringWithData:()MobileStorageMounter
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initHexStringWithData:v4];

  return v5;
}

- (id)initHexStringWithData:()MobileStorageMounter
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && (uint64_t v6 = [v4 length],
        v7 = (unsigned __int8 *)[v5 bytes],
        uint64_t v8 = 2 * v6,
        (v9 = (char *)malloc(2 * v6)) != 0LL))
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
        --v6;
      }

      while (v6);
    }

    a1 = (id)[a1 initWithBytesNoCopy:v9 length:v8 encoding:1 freeWhenDone:1];
    id v16 = a1;
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

@end