@interface NSData
- (id)hexString;
@end

@implementation NSData

- (id)hexString
{
  NSUInteger v3 = -[NSData length](self, "length");
  v4 = (char *)malloc(2 * v3);
  if (v4)
  {
    v5 = v4;
    if (v3)
    {
      uint64_t v6 = 0LL;
      v7 = v4 + 1;
      do
      {
        v8 = self;
        unsigned int v9 = *((unsigned __int8 *)-[NSData bytes](v8, "bytes") + v6);
        if (v9 <= 0x9F) {
          char v10 = 48;
        }
        else {
          char v10 = 55;
        }
        *(v7 - 1) = v10 + (v9 >> 4);
        unsigned int v11 = *((_BYTE *)-[NSData bytes](v8, "bytes") + v6) & 0xF;
        if (v11 <= 9) {
          char v12 = 48;
        }
        else {
          char v12 = 55;
        }
        _BYTE *v7 = v12 + v11;
        v7 += 2;
        ++v6;
      }

      while (v3 != v6);
    }

    v13 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  v5,  2 * v3,  1LL);
    free(v5);
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

@end