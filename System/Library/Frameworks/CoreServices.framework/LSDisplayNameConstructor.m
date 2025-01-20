@interface LSDisplayNameConstructor
@end

@implementation LSDisplayNameConstructor

void __123___LSDisplayNameConstructor_ConstructForAnyFile__displayNameConstructorsWithContextIfNeeded_bundle_bundleClass_node_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v5 length])
  {
    uint64_t v6 = [v9 isEqual:@"LSDefaultLocalizedValue"];
    if (*(void *)(a1 + 32) && *(_BYTE *)(a1 + 80))
    {
      uint64_t v7 = [(id)objc_opt_class() concatenateBaseName:v5 andExtension:*(void *)(a1 + 32)];

      id v5 = (id)v7;
    }

    v8 = (void *)[objc_alloc(*(Class *)(a1 + 56)) initWithContextIfNeeded:*(void *)(a1 + 64) node:*(void *)(a1 + 48) isDirectory:*(unsigned __int8 *)(a1 + 81) bundleClass:*(void *)(a1 + 72) desiredDisplayName:v5 treatAsFSName:v6];
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v9];
  }
}

void __83___LSDisplayNameConstructor_Private__initContentBitsWithDisplayName_treatAsFSName___block_invoke( uint64_t a1,  CFStringInlineBuffer *buffer,  uint64_t a3)
{
  if (a3)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = 64LL;
    uint64_t v9 = MEMORY[0x1895F8770];
    while (1)
    {
      uint64_t v10 = (unint64_t)v7 >= 4 ? 4LL : v7;
      if ((v7 & 0x8000000000000000LL) == 0)
      {
        CFIndex length = buffer->rangeToBuffer.length;
        if (length > v7) {
          break;
        }
      }

      if ((*(_BYTE *)(v9 + 62) & 4) == 0)
      {
        UniChar v13 = 0;
LABEL_29:
        _LSDNCGetForbiddenCharacters(0);
        v22 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
      }

void __62___LSDisplayNameConstructor_Private__cleanSecondaryExtension___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v1 = objc_alloc_init(MEMORY[0x189607930]);
  objc_msgSend(v1, "addCharactersInRange:", 0, 1);
  unint64_t v2 = 0x189607000uLL;
  [MEMORY[0x189607810] controlCharacterSet];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 formUnionWithCharacterSet:v3];

  [MEMORY[0x189607810] whitespaceCharacterSet];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 formUnionWithCharacterSet:v4];

  [MEMORY[0x189607810] newlineCharacterSet];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 formUnionWithCharacterSet:v5];

  id v6 = v1;
  if (uset_openPattern())
  {
    Mutable = CFCharacterSetCreateMutable(0LL);
    if (Mutable)
    {
      int ItemCount = uset_getItemCount();
      uint64_t v9 = (const __CFAllocator *)*MEMORY[0x189604DD0];
      if (ItemCount >= 1)
      {
        int v10 = 0;
        contentsDeallocator = (const __CFAllocator *)*MEMORY[0x189604DC8];
        do
        {
          int Item = uset_getItem();
          if (Item <= 0)
          {
            v23.location = v20;
            v23.CFIndex length = v19 - v20 + 1;
            CFCharacterSetAddCharactersInRange(Mutable, v23);
          }

          else
          {
            v12 = CFStringCreateWithCharactersNoCopy(v9, v21, Item, contentsDeallocator);
            CFCharacterSetAddCharactersInString(Mutable, v12);
            CFRelease(v12);
          }

          ++v10;
        }

        while (ItemCount != v10);
      }

      CFCharacterSetRef Copy = CFCharacterSetCreateCopy(v9, Mutable);
      unint64_t v2 = 0x189607000LL;
      CFCharacterSetRef v14 = Copy;
      CFRelease(Mutable);
    }

    else
    {
      CFCharacterSetRef v14 = 0LL;
    }

    [v6 formUnionWithCharacterSet:v14];
    uset_close();
  }

  [*(id *)(v2 + 2064) illegalCharacterSet];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 formUnionWithCharacterSet:v15];

  uint64_t v16 = [v6 copy];
  uint64_t v17 = (void *)-[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::nonExtensionCharacters;
  -[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::nonExtensionCharacters = v16;
}

void __62___LSDisplayNameConstructor_Private__cleanSecondaryExtension___block_invoke_2( uint64_t a1,  CFStringInlineBuffer *a2,  uint64_t a3)
{
  uint64_t v6 = objc_msgSend(MEMORY[0x189607940], "stringWithCapacity:");
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (a3)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = 64LL;
    do
    {
      else {
        uint64_t v12 = v10;
      }
      if (v10 < 0 || (CFIndex v13 = a2->rangeToBuffer.length, v13 <= v10))
      {
        UniChar v15 = 0;
      }

      else
      {
        directUniCharBuffer = a2->directUniCharBuffer;
        if (directUniCharBuffer)
        {
          UniChar v15 = directUniCharBuffer[v10 + a2->rangeToBuffer.location];
        }

        else
        {
          directCStringBuffer = a2->directCStringBuffer;
          if (directCStringBuffer)
          {
            UniChar v15 = directCStringBuffer[a2->rangeToBuffer.location + v10];
          }

          else
          {
            if (a2->bufferedRangeEnd <= v10 || (CFIndex bufferedRangeStart = a2->bufferedRangeStart, bufferedRangeStart > v10))
            {
              uint64_t v18 = -v12;
              uint64_t v19 = v12 + v9;
              uint64_t v20 = v11 - v12;
              CFIndex v21 = v10 + v18;
              CFIndex length = v21 + 64;
              if (v21 + 64 >= v13) {
                CFIndex length = a2->rangeToBuffer.length;
              }
              a2->CFIndex bufferedRangeStart = v21;
              a2->bufferedRangeEnd = length;
              if (v13 >= v20) {
                CFIndex v13 = v20;
              }
              v24.CFIndex length = v13 + v19;
              v24.location = v21 + a2->rangeToBuffer.location;
              CFStringGetCharacters(a2->theString, v24, a2->buffer);
              CFIndex bufferedRangeStart = a2->bufferedRangeStart;
            }

            UniChar v15 = a2->buffer[v10 - bufferedRangeStart];
          }
        }
      }

      UniChar v23 = v15;
      if ((_LSDNCCharacterSetContainsCharacterFromInlineBuffer( (NSCharacterSet *)-[_LSDisplayNameConstructor(Private) cleanSecondaryExtension:]::nonExtensionCharacters,  v15,  a2,  v10) & 1) == 0) {
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendCharacters:&v23 length:1];
      }
      ++v10;
      --v9;
      ++v11;
    }

    while (a3 != v10);
  }

uint64_t __55___LSDisplayNameConstructor_RTL__isStringNaturallyRTL___block_invoke(uint64_t a1)
{
  uint64_t result = ubidi_getBaseDirection();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = (_DWORD)result == 1;
  return result;
}

@end