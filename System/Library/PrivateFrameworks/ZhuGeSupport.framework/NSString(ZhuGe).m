@interface NSString(ZhuGe)
+ (__CFString)stringFromData:()ZhuGe;
+ (__CFString)visibleStringFromData:()ZhuGe;
+ (id)hexStringFromData:()ZhuGe;
+ (id)macAddressStringFromData:()ZhuGe;
+ (id)macAddressStringFromSysconfigDataSixByte:()ZhuGe;
+ (uint64_t)isDataConvertibleToVisibleString:()ZhuGe;
- (id)ccccValue;
- (id)stringByLeftTrimmingCharacter:()ZhuGe;
- (id)stringByRemovingCharactersInString:()ZhuGe;
- (id)stringByRightTrimmingCharacter:()ZhuGe;
- (id)stringByTrimmingCharactersInString:()ZhuGe;
@end

@implementation NSString(ZhuGe)

+ (uint64_t)isDataConvertibleToVisibleString:()ZhuGe
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = [v5 bytes];
    uint64_t v7 = [v5 length];
    while (v7)
    {
      uint64_t v8 = v7 - 1;
      if (*(unsigned __int8 *)(v6 - 1 + v7--))
      {
        uint64_t v10 = 0LL;
        unint64_t v11 = v8 + 1;
        while (*(char *)(v6 + v10) >= 8)
        {
          int v12 = *(unsigned __int8 *)(v6 + v10);
          if (++v10 >= v11)
          {
            uint64_t v14 = 1LL;
            goto LABEL_15;
          }
        }

        break;
      }
    }
  }

  uint64_t v14 = 0LL;
LABEL_15:

  return v14;
}

+ (__CFString)stringFromData:()ZhuGe
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 length])
    {
      else {
        [a1 hexStringFromData:v5];
      }
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v6 = &stru_18A317680;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

+ (__CFString)visibleStringFromData:()ZhuGe
{
  id v3 = a3;
  id v4 = v3;
  char v8 = 0;
  if (v3)
  {
    if ([v3 length])
    {
      objc_msgSend(v4, "getBytes:range:", &v8, objc_msgSend(v4, "length") - 1, 1);
      if (v8)
      {
        uint64_t v5 = [objc_alloc(NSString) initWithData:v4 encoding:4];
      }

      else
      {
        uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v4, "bytes"));
      }

      uint64_t v6 = (__CFString *)v5;
    }

    else
    {
      uint64_t v6 = &stru_18A317680;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

+ (id)hexStringFromData:()ZhuGe
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x189607940]);
    uint64_t v5 = [v3 length];
    uint64_t v6 = [v3 bytes];
    if (v5)
    {
      uint64_t v7 = (unsigned __int8 *)v6;
      do
      {
        unsigned int v8 = *v7++;
        objc_msgSend(v4, "appendFormat:", @"%02x", v8);
        --v5;
      }

      while (v5);
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)macAddressStringFromData:()ZhuGe
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x189607940]);
    uint64_t v5 = [v3 length];
    uint64_t v6 = [v3 bytes];
    if (v5)
    {
      uint64_t v7 = (unsigned __int8 *)v6;
      do
      {
        unsigned int v8 = *v7++;
        objc_msgSend(v4, "appendFormat:", @"%02x", v8);
        if (v5 != 1) {
          [v4 appendFormat:@":"];
        }
        --v5;
      }

      while (v5);
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)macAddressStringFromSysconfigDataSixByte:()ZhuGe
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x189607940]);
    else {
      uint64_t v5 = 6LL;
    }
    uint64_t v6 = [v3 bytes];
    if (v5)
    {
      uint64_t v7 = (unsigned __int8 *)v6;
      do
      {
        unsigned int v8 = *v7++;
        objc_msgSend(v4, "appendFormat:", @"%02x", v8);
        if (v5 != 1) {
          [v4 appendFormat:@":"];
        }
        --v5;
      }

      while (v5);
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (id)stringByRemovingCharactersInString:()ZhuGe
{
  id v4 = a3;
  id v5 = a1;
  if (v4 && [v4 length])
  {
    unint64_t v6 = 0LL;
    do
    {
      objc_msgSend(v4, "substringWithRange:", v6, 1);
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 stringByReplacingOccurrencesOfString:v7 withString:&stru_18A317680];
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();

      ++v6;
      id v5 = v8;
    }

    while ([v4 length] > v6);
  }

  else
  {
    unsigned int v8 = v5;
  }

  return v8;
}

- (id)stringByTrimmingCharactersInString:()ZhuGe
{
  id v4 = a1;
  if (a3)
  {
    [MEMORY[0x189607810] characterSetWithCharactersInString:a3];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];

    id v4 = (id)v6;
  }

  return v4;
}

- (id)stringByLeftTrimmingCharacter:()ZhuGe
{
  id v4 = (const char *)[a1 UTF8String];
  size_t v5 = strlen(v4);
  size_t v6 = 0LL;
  if (v5)
  {
    while (v4[v6] == a3)
    {
      if (v5 == ++v6)
      {
        size_t v6 = v5;
        return (id)[objc_alloc(NSString) initWithBytes:&v4[v6] length:v5 - v6 encoding:4];
      }
    }
  }

  return (id)[objc_alloc(NSString) initWithBytes:&v4[v6] length:v5 - v6 encoding:4];
}

- (id)stringByRightTrimmingCharacter:()ZhuGe
{
  int v3 = a3;
  id v4 = (const char *)[a1 UTF8String];
  size_t v5 = strlen(v4);
  do
  {
    size_t v6 = v5;
    if (!v5) {
      break;
    }
    --v5;
  }

  while (v4[v6 - 1] == v3);
  return (id)[objc_alloc(NSString) initWithBytes:v4 length:v6 encoding:4];
}

- (id)ccccValue
{
  if ([a1 length] == 4)
  {
    v2 = (unsigned int *)[a1 cStringUsingEncoding:1];
    [MEMORY[0x189607968] numberWithUnsignedInt:bswap32(*v2)];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v3 = 0LL;
  }

  return v3;
}

@end