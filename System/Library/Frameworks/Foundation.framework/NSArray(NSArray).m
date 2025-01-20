@interface NSArray(NSArray)
+ (id)arrayWithContentsOfFile:()NSArray;
+ (id)arrayWithContentsOfURL:()NSArray;
+ (id)arrayWithContentsOfURL:()NSArray error:;
+ (id)newWithContentsOf:()NSArray immutable:;
+ (id)newWithContentsOf:()NSArray immutable:error:;
+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded;
- (id)debugDescription;
- (id)initWithContentsOfURL:()NSArray error:;
- (id)sortedArrayUsingSelector:()NSArray hint:;
- (uint64_t)_stringToWrite;
- (uint64_t)classForCoder;
- (uint64_t)encodeWithCoder:()NSArray;
- (uint64_t)initWithCoder:()NSArray;
- (uint64_t)initWithContentsOfFile:()NSArray;
- (uint64_t)initWithContentsOfURL:()NSArray;
- (uint64_t)sortedArrayHint;
- (uint64_t)sortedArrayUsingFunction:()NSArray context:hint:;
- (uint64_t)writeToFile:()NSArray atomically:;
- (uint64_t)writeToURL:()NSArray atomically:;
- (uint64_t)writeToURL:()NSArray error:;
@end

@implementation NSArray(NSArray)

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1LL;
}

- (uint64_t)initWithCoder:()NSArray
{
  v28[1] = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    [a3 decodeValueOfObjCType:"i" at:&v26 size:4];
    uint64_t v8 = v26;
    if (v26) {
      uint64_t v9 = v26;
    }
    else {
      uint64_t v9 = 1LL;
    }
    MEMORY[0x1895F8858](v9);
    v11 = (char *)&v25 - v10;
    if (v8 >= 0x101)
    {
      v12 = (char *)_CFCreateArrayStorage();
      v11 = v12;
    }

    else
    {
      v12 = 0LL;
      if (!(_DWORD)v8)
      {
LABEL_16:
        uint64_t v15 = -[objc_class initWithObjects:count:](a1, "initWithObjects:count:", v11, v8);
        for (uint64_t i = 8 * v8; i; i -= 8LL)
        {
          v17 = *(void **)&v11[i - 8];
        }

        free(v12);
        return v15;
      }
    }

    v13 = v11;
    uint64_t v14 = v8;
    do
    {
      [a3 decodeValueOfObjCType:"@" at:v13 size:8];
      v13 += 8;
      --v14;
    }

    while (v14);
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

  id v18 = NSAllocateObjectArray(0x80uLL);
  if (!v18) {
    return 0LL;
  }
  v19 = v18;
  unint64_t v20 = 0LL;
  unint64_t v21 = 128LL;
  while (1)
  {
    if (v21 > v20) {
      goto LABEL_26;
    }
    v21 *= 2LL;
    NSReallocateObjectArray(v19, v21);
    if (!v22) {
      break;
    }
    v19 = v22;
LABEL_26:
    v23 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"NS.object.%ld", v20);
    if (![a3 containsValueForKey:v23])
    {
      uint64_t v15 = -[objc_class initWithObjects:count:](a1, "initWithObjects:count:", v19, v20);
      goto LABEL_33;
    }

    uint64_t v24 = [a3 decodeObjectForKey:v23];
    *((void *)v19 + v20) = v24;
    if (!v24) {
      goto LABEL_32;
    }
    ++v20;
  }

  v27 = @"NSLocalizedDescription";
  v28[0] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: array is too large to unarchive (%qd)",  _NSMethodExceptionProem(a1, a2),  v21);
  objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1)));
LABEL_32:
  uint64_t v15 = 0LL;
LABEL_33:
  free(v19);
  return v15;
}

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

- (id)debugDescription
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v1, *MEMORY[0x189604A08]);
  }
  v3 = (void *)[objc_allocWithZone((Class)NSMutableString) init];
  objc_msgSend(v3, "appendFormat:", @"<%@ %p>(\n"), objc_opt_class(), a1;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v4 = [a1 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a1);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        if ((v6 & 1) != 0) {
          [v3 appendString:@",\n"];
        }
        objc_msgSend(v3, "appendString:", objc_msgSend(v9, "debugDescription"));
        ++v8;
        char v6 = 1;
      }

      while (v5 != v8);
      uint64_t v5 = [a1 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }

    while (v5);
  }

  [v3 appendString:@"\n\n"]);
  return v3;
}

- (uint64_t)encodeWithCoder:()NSArray
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A70]) {
    ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x189604A70])(a1, v3, *MEMORY[0x189604A08]);
  }
  if ([a3 allowsKeyedCoding])
  {
    Class = (__objc2_class *)object_getClass(a3);
    if (Class == &OBJC_CLASS___NSKeyedArchiver) {
      return [a3 _encodeArrayOfObjects:a1 forKey:@"NS.objects"];
    }
    uint64_t v8 = (objc_class *)Class;
    if (Class == &OBJC_CLASS___NSXPCEncoder) {
      return [a3 _encodeArrayOfObjects:a1 forKey:@"NS.objects"];
    }
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __36__NSArray_NSArray__encodeWithCoder___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = sel_encodeObject_forKey_;
    if (qword_18C496538 != -1) {
      dispatch_once(&qword_18C496538, block);
    }
    IMP MethodImplementation = class_getMethodImplementation(v8, sel_encodeObject_forKey_);
    if (MethodImplementation == (IMP)_MergedGlobals_89 || MethodImplementation == (IMP)qword_18C496530)
    {
      return [a3 _encodeArrayOfObjects:a1 forKey:@"NS.objects"];
    }

    else
    {
LABEL_12:
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      uint64_t result = -[objc_class countByEnumeratingWithState:objects:count:]( a1,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
      if (result)
      {
        uint64_t v11 = result;
        uint64_t v12 = 0LL;
        uint64_t v13 = *(void *)v23;
        do
        {
          uint64_t v14 = 0LL;
          do
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(a1);
            }
            [a3 encodeObject:*(void *)(*((void *)&v22 + 1) + 8 * v14), +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"NS.object.%ld", v12 + v14) forKey];
            ++v14;
          }

          while (v11 != v14);
          uint64_t result = -[objc_class countByEnumeratingWithState:objects:count:]( a1,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
          uint64_t v11 = result;
          v12 += v14;
        }

        while (result);
      }
    }
  }

  else
  {
    unint64_t v15 = -[objc_class count](a1, "count");
    if (v15 >> 29)
    {
      return objc_msgSend( a3,  "__failWithExceptionName:errorCode:format:",  @"NSArchiverArchiveInconsistency",  4864,  @"%@: array count (%lu) makes array too large to fit in non-keyed archive",  _NSMethodExceptionProem(a1, a2),  v15);
    }

    else
    {
      int v20 = v15;
      [a3 encodeValueOfObjCType:"i" at:&v20];
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      uint64_t result = -[objc_class countByEnumeratingWithState:objects:count:]( a1,  "countByEnumeratingWithState:objects:count:",  &v27,  v26,  16LL);
      if (result)
      {
        uint64_t v16 = result;
        uint64_t v17 = *(void *)v28;
        do
        {
          uint64_t v18 = 0LL;
          do
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(a1);
            }
            [a3 encodeBycopyObject:*(void *)(*((void *)&v27 + 1) + 8 * v18++)];
          }

          while (v16 != v18);
          uint64_t result = -[objc_class countByEnumeratingWithState:objects:count:]( a1,  "countByEnumeratingWithState:objects:count:",  &v27,  v26,  16LL);
          uint64_t v16 = result;
        }

        while (result);
      }
    }
  }

  return result;
}

- (uint64_t)sortedArrayHint
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  size_t v2 = 4 * [a1 count];
  uint64_t v3 = malloc(v2);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v4 = [a1 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = v3;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(a1);
        }
        *v7++ = [*(id *)(*((void *)&v11 + 1) + 8 * v8++) hash];
      }

      while (v5 != v8);
      uint64_t v5 = [a1 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }

    while (v5);
  }

  return [MEMORY[0x189603F48] dataWithBytesNoCopy:v3 length:v2 freeWhenDone:1];
}

- (uint64_t)sortedArrayUsingFunction:()NSArray context:hint:
{
  if (!a3)
  {
    v35 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: compare function pointer is NULL", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v35);
  }

  if (*MEMORY[0x189604A70]) {
    ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x189604A70])(a1, v5, *MEMORY[0x189604A08]);
  }
  unint64_t v8 = [a5 length];
  unint64_t v9 = v8 >> 2;
  uint64_t v10 = -[objc_class count](a1, "count");
  __int128 v11 = (char *)NSAllocateObjectArray(2 * v10 + (v8 >> 2));
  bzero(v11, v8 & 0xFFFFFFFFFFFFFFFCLL);
  -[objc_class getObjects:range:](a1, "getObjects:range:", &v11[8 * (v8 >> 2)], 0LL, v10);
  size_t v12 = (v8 & 0xFFFFFFFFFFFFFFFCLL) + 13;
  __int128 v13 = calloc(v12, 0x10uLL);
  __int128 v14 = (unsigned int *)[a5 bytes];
  if (v8 >= 4)
  {
    uint64_t v15 = 0LL;
    if (v9 <= 1) {
      uint64_t v16 = 1LL;
    }
    else {
      uint64_t v16 = v8 >> 2;
    }
    do
    {
      unsigned int v18 = *v14++;
      uint64_t v17 = v18;
      uint64_t v19 = -8LL;
      size_t v20 = v18;
      while (1)
      {
        size_t v21 = v20 % v12;
        if (!v13[2 * v21]) {
          break;
        }
        size_t v20 = v21 + 5;
        BOOL v22 = __CFADD__(v19++, 1LL);
        if (v22)
        {
          ++v15;
          goto LABEL_14;
        }
      }

      v13[2 * v21] = ++v15;
      *(void *)((char *)v13 + ((16 * v21) | 8)) = v17;
LABEL_14:
      ;
    }

    while (v15 != v16);
  }

  if (v10)
  {
    for (uint64_t i = 0LL; i != v10; ++i)
    {
      __int128 v24 = *(void **)&v11[8 * i + 8 * v9];
      uint64_t v25 = [v24 hash];
      uint64_t v26 = -8LL;
      unint64_t v27 = v25;
      while (1)
      {
        size_t v28 = v27 % v12;
        uint64_t v29 = v13[2 * v28];
        if (v29)
        {
        }

        unint64_t v27 = v28 + 5;
        BOOL v22 = __CFADD__(v26++, 1LL);
        if (v22) {
          goto LABEL_25;
        }
      }

      if (!*(void *)&v11[8 * v29 - 8])
      {
        *(void *)&v11[8 * v29 - 8] = v24;
        *(void *)&v11[8 * i + 8 * v9] = 0LL;
      }

- (id)sortedArrayUsingSelector:()NSArray hint:
{
  if (a3)
  {
    if (*MEMORY[0x189604A70]) {
      ((void (*)(objc_class *, uint64_t, void))*MEMORY[0x189604A70])(a1, v4, *MEMORY[0x189604A08]);
    }
    return (id)-[objc_class sortedArrayUsingFunction:context:hint:]( a1,  "sortedArrayUsingFunction:context:hint:",  _NSUseParamAsSortSelector,  a3,  a4);
  }

  else
  {
    unint64_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: compare selector is 0", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    return _NSUseParamAsSortSelector(v10, v11, v12);
  }

+ (id)arrayWithContentsOfFile:()NSArray
{
  return (id)[objc_allocWithZone(a1) initWithContentsOfFile:a3];
}

+ (id)arrayWithContentsOfURL:()NSArray
{
  return (id)[objc_allocWithZone(a1) initWithContentsOfURL:a3];
}

+ (id)arrayWithContentsOfURL:()NSArray error:
{
  return (id)[objc_allocWithZone(a1) initWithContentsOfURL:a3 error:a4];
}

+ (id)newWithContentsOf:()NSArray immutable:
{
  v15[1] = *MEMORY[0x1895F89C0];
  __int128 v13 = 0LL;
  if (!a3) {
    return 0LL;
  }
  int v6 = _NSIsNSString();
  id v7 = objc_allocWithZone(MEMORY[0x189603F48]);
  uint64_t v8 = v6
     ? [v7 initWithContentsOfFile:a3 options:0 error:&v13]
     : [v7 initWithContentsOfURL:a3 options:0 error:&v13];
  unint64_t v9 = (void *)v8;
  if (!v8) {
    return 0LL;
  }
  id v10 =  +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v8,  a4 ^ 1u,  0LL,  &v13);

  if ((_NSIsNSArray() & 1) == 0)
  {

    uint64_t v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ did not contain a top-level array value",  a3);
    __int128 v14 = @"NSDebugDescription";
    v15[0] = v11;
    __int128 v13 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  259,  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1]);

    return 0LL;
  }

  return v10;
}

+ (id)newWithContentsOf:()NSArray immutable:error:
{
  v17[1] = *MEMORY[0x1895F89C0];
  uint64_t v15 = 0LL;
  if (a3)
  {
    int v8 = _NSIsNSString();
    id v9 = objc_allocWithZone(MEMORY[0x189603F48]);
    uint64_t v10 = v8
        ? [v9 initWithContentsOfFile:a3 options:0 error:&v15]
        : [v9 initWithContentsOfURL:a3 options:0 error:&v15];
    uint64_t v11 = (void *)v10;
    if (v10)
    {
      id v12 =  +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v10,  a4 ^ 1u,  0LL,  &v15);

      if ((_NSIsNSArray() & 1) != 0) {
        goto LABEL_9;
      }

      __int128 v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ did not contain a top-level array value",  a3);
      uint64_t v16 = @"NSDebugDescription";
      v17[0] = v13;
      uint64_t v15 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  259,  [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:1]);
    }
  }

  id v12 = 0LL;
LABEL_9:
  if (a5) {
    *a5 = v15;
  }
  return v12;
}

- (uint64_t)initWithContentsOfFile:()NSArray
{
  uint64_t v4 = [MEMORY[0x189603F18] newWithContentsOf:a3 immutable:1];

  return v4;
}

- (uint64_t)initWithContentsOfURL:()NSArray
{
  uint64_t v4 = [MEMORY[0x189603F18] newWithContentsOf:a3 immutable:1];

  return v4;
}

- (id)initWithContentsOfURL:()NSArray error:
{
  v16[1] = *MEMORY[0x1895F89C0];
  __int128 v14 = 0LL;
  if (a3)
  {
    int v7 = _NSIsNSString();
    id v8 = objc_allocWithZone(MEMORY[0x189603F48]);
    uint64_t v9 = v7
       ? [v8 initWithContentsOfFile:a3 options:0 error:&v14]
       : [v8 initWithContentsOfURL:a3 options:0 error:&v14];
    uint64_t v10 = (void *)v9;
    if (v9)
    {
      id v11 =  +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v9,  0LL,  0LL,  &v14);

      if ((_NSIsNSArray() & 1) != 0) {
        goto LABEL_9;
      }

      id v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ did not contain a top-level array value",  a3);
      uint64_t v15 = @"NSDebugDescription";
      v16[0] = v12;
      __int128 v14 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  259,  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1]);
    }
  }

  id v11 = 0LL;
LABEL_9:
  if (a4) {
    *a4 = v14;
  }

  return v11;
}

- (uint64_t)_stringToWrite
{
  uint64_t v1 = (void *)[a1 descriptionWithLocale:0 indent:0];
  if ([v1 hasSuffix:@"\n"]) {
    return (uint64_t)v1;
  }
  else {
    return [v1 stringByAppendingString:@"\n"];
  }
}

- (uint64_t)writeToFile:()NSArray atomically:
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v4, *MEMORY[0x189604A08]);
  }
  id v8 = (void *)MEMORY[0x186E1FF60]();
  if (_NSIsPList((uint64_t)a1, 1, (void *)[MEMORY[0x189603FE0] set]) == 3)
  {
    if ((dyld_program_sdk_at_least() & 1) != 0
      || !objc_msgSend( (id)objc_msgSend(MEMORY[0x189604038], "standardUserDefaults"),  "BOOLForKey:",  @"NSWriteOldStylePropertyLists"))
    {
      uint64_t v9 = -[NSData writeToFile:atomically:]( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a1,  100LL,  0LL,  0LL),  "writeToFile:atomically:",  a3,  a4);
    }

    else
    {
      uint64_t v9 = objc_msgSend( (id)objc_msgSend(a1, "_stringToWrite"),  "writeToFile:atomically:encoding:error:",  a3,  a4,  +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding"),  0);
    }

    uint64_t v10 = v9;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  objc_autoreleasePoolPop(v8);
  return v10;
}

- (uint64_t)writeToURL:()NSArray atomically:
{
  v13[1] = *(id *)MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A70])
  {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x189604A70])(a1, v4, *MEMORY[0x189604A08]);
    if (!a3) {
      return 0LL;
    }
  }

  else if (!a3)
  {
    return 0LL;
  }

  v13[0] = 0LL;
  id v8 = (void *)MEMORY[0x186E1FF60]();
  uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a1,  100LL,  0LL,  v13);
  if (v9 && -[NSData writeToURL:options:error:](v9, "writeToURL:options:error:", a3, a4, v13))
  {
    objc_autoreleasePoolPop(v8);
    return 1LL;
  }

  id v11 = v13[0];
  objc_autoreleasePoolPop(v8);
  id v12 = v13[0];
  return 0LL;
}

- (uint64_t)writeToURL:()NSArray error:
{
  v14[1] = *(id *)MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A70]) {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x189604A70])(a1, v4, *MEMORY[0x189604A08]);
  }
  v14[0] = 0LL;
  id v8 = (void *)MEMORY[0x186E1FF60]();
  uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a1,  100LL,  0LL,  v14);
  if (v9 && -[NSData writeToURL:options:error:](v9, "writeToURL:options:error:", a3, 1LL, v14))
  {
    objc_autoreleasePoolPop(v8);
    return 1LL;
  }

  else
  {
    id v11 = v14[0];
    objc_autoreleasePoolPop(v8);
    id v12 = v14[0];
    if (a4) {
      *a4 = v14[0];
    }
    id v13 = v12;
    return 0LL;
  }

@end