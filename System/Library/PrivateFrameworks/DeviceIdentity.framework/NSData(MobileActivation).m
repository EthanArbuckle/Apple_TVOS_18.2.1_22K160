@interface NSData(MobileActivation)
- (id)hexString;
@end

@implementation NSData(MobileActivation)

- (id)hexString
{
  uint64_t v2 = [a1 length];
  v3 = (char *)malloc(2 * v2);
  if (v3)
  {
    v4 = v3;
    if (v2)
    {
      uint64_t v5 = 0LL;
      v6 = v3 + 1;
      do
      {
        id v7 = a1;
        unsigned int v8 = *(unsigned __int8 *)([v7 bytes] + v5);
        if (v8 <= 0x9F) {
          char v9 = 48;
        }
        else {
          char v9 = 55;
        }
        *(v6 - 1) = v9 + (v8 >> 4);
        unsigned int v10 = *(_BYTE *)([v7 bytes] + v5) & 0xF;
        if (v10 <= 9) {
          char v11 = 48;
        }
        else {
          char v11 = 55;
        }
        _BYTE *v6 = v11 + v10;
        v6 += 2;
        ++v5;
      }

      while (v2 != v5);
    }

    v12 = (void *)[objc_alloc(NSString) initWithBytes:v4 length:2 * v2 encoding:1];
    free(v4);
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

@end