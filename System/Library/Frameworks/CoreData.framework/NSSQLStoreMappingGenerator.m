@interface NSSQLStoreMappingGenerator
+ (NSSQLStoreMappingGenerator)defaultMappingGenerator;
- (CFStringRef)newGeneratedPropertyName:(uint64_t)a1;
- (NSSQLStoreMappingGenerator)init;
- (uint64_t)generateTableName:(int)a3 isAncillary:;
- (uint64_t)uniqueNameWithBase:(uint64_t)a1;
- (void)dealloc;
@end

@implementation NSSQLStoreMappingGenerator

+ (NSSQLStoreMappingGenerator)defaultMappingGenerator
{
  result = (NSSQLStoreMappingGenerator *)_NSSQLDefaultMappingGenerator;
  if (!_NSSQLDefaultMappingGenerator)
  {
    result = objc_alloc_init(&OBJC_CLASS___NSSQLStoreMappingGenerator);
    _NSSQLDefaultMappingGenerator = (uint64_t)result;
  }

  return result;
}

- (NSSQLStoreMappingGenerator)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSSQLStoreMappingGenerator;
  v2 = -[NSSQLStoreMappingGenerator init](&v4, sel_init);
  if (v2) {
    v2->_names = (NSMutableDictionary *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLStoreMappingGenerator;
  -[NSSQLStoreMappingGenerator dealloc](&v3, sel_dealloc);
}

- (uint64_t)uniqueNameWithBase:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  v2 = a2;
  if ([a2 length])
  {
    int v4 = [v2 characterAtIndex:0];
    int v5 = v4 << 24;
    if (v4 << 24 < 0)
    {
      goto LABEL_5;
    }

    if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * (char)v4 + 60) & 0x100) == 0) {
LABEL_5:
    }
      v2 = (void *)[NSString stringWithFormat:@"%c%@", (unsigned __int16)((__int16)((v5 >> 24) - 48) % 26 + 65), objc_msgSend(v2, "substringFromIndex:", 1)];
  }

- (CFStringRef)newGeneratedPropertyName:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    objc_super v3 = (void *)[a2 name];
    uint64_t v4 = [v3 length];
    unint64_t v5 = v4 + 1;
    if ((unint64_t)(v4 + 1) >= 0x201) {
      return (CFStringRef)(id)-[NSSQLStoreMappingGenerator uniqueNameWithBase:]( a1,  (void *)objc_msgSend( @"Z",  "stringByAppendingString:",  objc_msgSend(v3, "uppercaseString")));
    }
    uint64_t v7 = v4;
    UniChar chars = 90;
    [v3 getCharacters:v22];
    *(_WORD *)&v22[2 * v5 - 2] = 0;
    if (v5 >= 2)
    {
      uint64_t v8 = v22;
      uint64_t v9 = v7;
      do
      {
        *uint64_t v8 = __toupper((unsigned __int16)*v8);
        ++v8;
        --v9;
      }

      while (v9);
    }

    if (!v5) {
      goto LABEL_11;
    }
    int v10 = chars << 24;
    if (v10 < 0)
    {
    }

    else if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * (char)chars + 60) & 0x100) != 0)
    {
LABEL_11:
      v11 = (__CFString *)CFStringCreateWithCharacters(0LL, &chars, v5);
      v12 = _PFStackAllocatorCreate(v23, 1024LL);
      v13 = (void *)[*(id *)(a1 + 8) objectForKey:v11];
      if (v13)
      {
        int v14 = [v13 unsignedIntValue];
        CFMutableStringRef v15 = 0LL;
        v16 = (const __CFAllocator *)*MEMORY[0x189604DC8];
        uint64_t v17 = (v14 + 1);
        do
        {
          if (v24)
          {
            if (v15) {
              CFRelease(v15);
            }
          }

          else
          {
            v23[1] = v23[0];
          }

          CFMutableStringRef v15 = CFStringCreateMutableWithExternalCharactersNoCopy(v12, &chars, v5, 512LL, v16);
          int valuePtr = v17;
          CFStringAppendFormat(v15, 0LL, @"%d", v17);
          uint64_t v17 = (v17 + 1);
        }

        while ([*(id *)(a1 + 8) objectForKey:v15]);
        CFStringRef Copy = CFStringCreateCopy(0LL, v15);
      }

      else
      {
        int valuePtr = 0;
        CFStringRef Copy = v11;
        CFMutableStringRef v15 = 0LL;
      }

      CFNumberRef v19 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
      [*(id *)(a1 + 8) setObject:v19 forKey:v11];

      if (v15)
      {
        if (v24) {
          CFRelease(v15);
        }
      }

      return Copy;
    }

    __memmove_chk();
    UniChar chars = (HIBYTE(v10)
                            - 48
                            - 26
                            * ((unsigned __int16)((v10 >> 24) - 48) / 0x1Au
    unint64_t v5 = v7 + 2;
    *(_WORD *)(v22 + 2 * v7 + 2) = 0;
    goto LABEL_11;
  }

  return 0LL;
}

- (uint64_t)generateTableName:(int)a3 isAncillary:
{
  if (result)
  {
    do
    {
      uint64_t v4 = a2;
      a2 = (void *)[a2 superentity];
    }

    while (a2);
    if (a3) {
      unint64_t v5 = @"A";
    }
    else {
      unint64_t v5 = @"Z";
    }
    return [objc_alloc(NSString) initWithFormat:@"%@%@", v5, objc_msgSend((id)objc_msgSend(v4, "name"), "uppercaseString")];
  }

  return result;
}

@end