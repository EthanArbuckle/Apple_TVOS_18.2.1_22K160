@interface NSSet(NSSet)
+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (uint64_t)supportsSecureCoding;
- (uint64_t)classForCoder;
- (uint64_t)initWithCoder:()NSSet;
- (void)encodeWithCoder:()NSSet;
@end

@implementation NSSet(NSSet)

- (void)encodeWithCoder:()NSSet
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v4, *MEMORY[0x189604A28]);
  }
  if ([a3 allowsKeyedCoding])
  {
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
    {
      unint64_t v7 = [a1 count];
      unint64_t v8 = v7;
      if (v7 >> 60)
      {
        CFStringRef v21 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v7);
        v22 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v21 userInfo:0];
        CFRelease(v21);
        objc_exception_throw(v22);
        v24 = v23;
        free(v3);
        _Unwind_Resume(v24);
      }

      uint64_t v9 = _CFCreateArrayStorage();
      [a1 getObjects:v9];
      if (v9)
      {
        if (v8)
        {
          v10 = (id *)v9;
          unint64_t v11 = v8;
          do
          {
            id v12 = *v10++;
            --v11;
          }

          while (v11);
        }

        uint64_t v13 = [objc_alloc(MEMORY[0x189603F18]) _initByAdoptingBuffer:v9 count:v8 size:v8];
      }

      else
      {
        uint64_t v13 = [objc_alloc(MEMORY[0x189603F18]) initWithObjects:0 count:v8];
      }

      v16 = (void *)v13;
      [a3 _encodeArrayOfObjects:v13 forKey:@"NS.objects"];
    }

    else
    {
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      uint64_t v17 = [a1 countByEnumeratingWithState:&v27 objects:v26 count:16];
      if (v17)
      {
        uint64_t v18 = 0LL;
        uint64_t v19 = *(void *)v28;
        do
        {
          for (uint64_t i = 0LL; i != v17; ++i)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(a1);
            }
            [a3 encodeObject:*(void *)(*((void *)&v27 + 1) + 8 * i), +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"NS.object.%ld", v18 + i) forKey];
          }

          uint64_t v17 = [a1 countByEnumeratingWithState:&v27 objects:v26 count:16];
          v18 += i;
        }

        while (v17);
      }
    }
  }

  else
  {
    int v25 = [a1 count];
    [a3 encodeValueOfObjCType:"I" at:&v25];
    v14 = (void *)[a1 objectEnumerator];
    for (uint64_t j = [v14 nextObject]; j; uint64_t j = objc_msgSend(v14, "nextObject"))
      [a3 encodeBycopyObject:j];
  }

+ (uint64_t)supportsSecureCoding
{
  return 1LL;
}

- (uint64_t)initWithCoder:()NSSet
{
  v29[1] = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    [a3 decodeValueOfObjCType:"I" at:&v27 size:4];
    uint64_t v8 = v27;
    if (v27) {
      uint64_t v9 = v27;
    }
    else {
      uint64_t v9 = 1LL;
    }
    *(void *)&double v10 = MEMORY[0x1895F8858](v9).n128_u64[0];
    id v12 = (char *)&v26 - v11;
    if (v8 >= 0x101)
    {
      uint64_t v13 = (char *)_CFCreateArrayStorage();
      id v12 = v13;
    }

    else
    {
      uint64_t v13 = 0LL;
      if (!(_DWORD)v8)
      {
LABEL_16:
        uint64_t v16 = -[objc_class initWithObjects:count:](a1, "initWithObjects:count:", v12, v8, v10);
        for (uint64_t i = 8 * v8; i; i -= 8LL)
        {
          uint64_t v18 = *(void **)&v12[i - 8];
        }

        free(v13);
        return v16;
      }
    }

    v14 = v12;
    uint64_t v15 = v8;
    do
    {
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "@", v14, 8, v10);
      v14 += 8;
      --v15;
    }

    while (v15);
    goto LABEL_16;
  }

  if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
    && [a3 containsValueForKey:@"NS.objects"])
  {
    uint64_t v6 = [a3 _decodeArrayOfObjectsForKey:@"NS.objects"];
    if (v6) {
      return (uint64_t)-[objc_class initWithArray:](a1, "initWithArray:", v6);
    }
    a1 = 0LL;
  }

  id v19 = NSAllocateObjectArray(0x80uLL);
  if (!v19) {
    return 0LL;
  }
  v20 = v19;
  unint64_t v21 = 0LL;
  unint64_t v22 = 128LL;
  while (1)
  {
    if (v22 > v21) {
      goto LABEL_26;
    }
    v22 *= 2LL;
    NSReallocateObjectArray(v20, v22);
    if (!v23) {
      break;
    }
    v20 = v23;
LABEL_26:
    v24 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"NS.object.%ld", v21);
    if (![a3 containsValueForKey:v24])
    {
      uint64_t v16 = -[objc_class initWithObjects:count:](a1, "initWithObjects:count:", v20, v21);
LABEL_31:
      free(v20);
      return v16;
    }

    uint64_t v25 = [a3 decodeObjectForKey:v24];
    *((void *)v20 + v21) = v25;
    if (!v25)
    {
      uint64_t v16 = 0LL;
      goto LABEL_31;
    }

    ++v21;
  }

  free(v20);
  __int128 v28 = @"NSLocalizedDescription";
  v29[0] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: set is too large to unarchive (%qd)",  _NSMethodExceptionProem(a1, a2),  v22);
  objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1)));
  return 0LL;
}

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1LL;
}

@end