@interface NSDictionary(NSDictionary)
+ (id)dictionaryWithContentsOfFile:()NSDictionary;
+ (id)dictionaryWithContentsOfURL:()NSDictionary;
+ (id)dictionaryWithContentsOfURL:()NSDictionary error:;
+ (id)newWithContentsOf:()NSDictionary immutable:;
+ (id)newWithContentsOf:()NSDictionary immutable:error:;
+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (uint64_t)supportsSecureCoding;
- (id)descriptionInStringsFileFormat;
- (id)initWithContentsOfURL:()NSDictionary error:;
- (uint64_t)_stringToWrite;
- (uint64_t)classForCoder;
- (uint64_t)initWithCoder:()NSDictionary;
- (uint64_t)initWithContentsOfFile:()NSDictionary;
- (uint64_t)initWithContentsOfURL:()NSDictionary;
- (uint64_t)writeToFile:()NSDictionary atomically:;
- (uint64_t)writeToURL:()NSDictionary atomically:;
- (uint64_t)writeToURL:()NSDictionary error:;
- (void)encodeWithCoder:()NSDictionary;
@end

@implementation NSDictionary(NSDictionary)

- (uint64_t)initWithCoder:()NSDictionary
{
  v48[1] = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v13 = [a3 decodeValueOfObjCType:"i" at:&v44 size:4];
    uint64_t v14 = v44;
    if (v44 >> 29)
    {
      objc_msgSend( a3,  "__failWithExceptionName:errorCode:format:",  @"NSArchiverArchiveInconsistency",  4864,  @"%@: array is too large to decode",  _NSMethodExceptionProem(a1, a2));
      return 0LL;
    }

    uint64_t v15 = MEMORY[0x1895F8858](v13);
    v17 = (objc_class *)((char *)&v42 - v16);
    if (v14 >= 0x101)
    {
      v17 = (objc_class *)_CFCreateArrayStorage();
      v19 = (char *)_CFCreateArrayStorage();
      v20 = v19;
      v21 = v17;
    }

    else
    {
      MEMORY[0x1895F8858](v15);
      v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFF0LL);
      v20 = 0LL;
      v21 = 0LL;
      if (!(_DWORD)v14)
      {
LABEL_18:
        v24 = -[objc_class initWithObjects:forKeys:count:](a1, "initWithObjects:forKeys:count:", v19, v17, v14);
        uint64_t v25 = 8 * v14;
        v26 = v19 - 8;
        v27 = (char *)&v17[-1];
        while (v25)
        {

          v28 = *(void **)&v26[v25];
          v25 -= 8LL;
        }

        free(v20);
        free(v21);
        return (uint64_t)v24;
      }
    }

    v43 = v21;
    uint64_t v22 = 0LL;
    uint64_t v23 = v14;
    do
    {
      [a3 decodeValueOfObjCType:"@" at:&v17[v22] size:8];
      [a3 decodeValueOfObjCType:"@" at:&v19[v22 * 8] size:8];
      ++v22;
      --v23;
    }

    while (v23);
    v21 = v43;
    goto LABEL_18;
  }

  if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
    && [a3 containsValueForKey:@"NS.objects"])
  {
    uint64_t v6 = [a3 _decodeArrayOfObjectsForKey:@"NS.objects"];
    if (v6)
    {
      v7 = (void *)v6;
      uint64_t v8 = [a3 _decodeArrayOfObjectsForKey:@"NS.keys"];
      if (v8)
      {
        v9 = (void *)v8;
        uint64_t v10 = [v7 count];
        uint64_t v11 = [v9 count];
        if (v10 == v11) {
          return (uint64_t)-[objc_class initWithObjects:forKeys:](a1, "initWithObjects:forKeys:", v7, v9);
        }
        v47 = @"NSLocalizedDescription";
        v48[0] = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"counts dont match between objects (%lu) and keys (%lu)",  v10,  v11);
        objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1)));
        return 0LL;
      }
    }

    a1 = 0LL;
  }

  id v29 = NSAllocateObjectArray(0x40uLL);
  if (!v29) {
    return 0LL;
  }
  v30 = v29;
  id v31 = NSAllocateObjectArray(0x40uLL);
  if (!v31)
  {
    free(v30);
    return 0LL;
  }

  v32 = v31;
  v42 = a2;
  v43 = a1;
  unint64_t v33 = 0LL;
  unint64_t v34 = 64LL;
  while (1)
  {
    if (v34 > v33) {
      goto LABEL_30;
    }
    v34 *= 2LL;
    NSReallocateObjectArray(v30, v34);
    v36 = v35;
    NSReallocateObjectArray(v32, v34);
    v38 = v37;
    if (!v36 || !v37) {
      break;
    }
    v30 = v36;
    v32 = v37;
LABEL_30:
    v39 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"NS.key.%ld", v33);
    if (!objc_msgSend(a3, "containsValueForKey:", v39, v42))
    {
      v24 = -[objc_class initWithObjects:forKeys:count:](v43, "initWithObjects:forKeys:count:", v32, v30, v33);
      goto LABEL_41;
    }

    v40 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"NS.object.%ld", v33);
    *((void *)v30 + v33) = [a3 decodeObjectForKey:v39];
    uint64_t v41 = [a3 decodeObjectForKey:v40];
    *((void *)v32 + v33) = v41;
    if (!*((void *)v30 + v33) || !v41) {
      goto LABEL_40;
    }
    ++v33;
  }

  free(v36);
  free(v38);
  v45 = @"NSLocalizedDescription";
  v46 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: dictionary is too large to unarchive (%qd)",  _NSMethodExceptionProem(v43, v42),  v34);
  objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1)));
LABEL_40:
  v24 = 0LL;
LABEL_41:
  free(v30);
  free(v32);
  return (uint64_t)v24;
}

+ (uint64_t)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1LL;
}

+ (uint64_t)supportsSecureCoding
{
  return 1LL;
}

- (void)encodeWithCoder:()NSDictionary
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v5, *MEMORY[0x189604A18]);
  }
  if ([a3 allowsKeyedCoding])
  {
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
    {
      unint64_t v8 = [a1 count];
      uint64_t v9 = v8;
      if (v8 >> 60)
      {
        CFStringRef v30 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v8);
        id v31 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48] reason:v30 userInfo:0];
        CFRelease(v30);
        objc_exception_throw(v31);
        unint64_t v33 = v32;
        free(v3);
        free(v4);
        _Unwind_Resume(v33);
      }

      uint64_t v10 = _CFCreateArrayStorage();
      uint64_t v11 = _CFCreateArrayStorage();
      [a1 getObjects:v11 andKeys:v10 count:v9];
      if (v10)
      {
        if (v9)
        {
          v12 = (id *)v10;
          uint64_t v13 = v9;
          do
          {
            id v14 = *v12++;
            --v13;
          }

          while (v13);
        }

        uint64_t v15 = [objc_alloc(MEMORY[0x189603F18]) _initByAdoptingBuffer:v10 count:v9 size:v9];
      }

      else
      {
        uint64_t v15 = [objc_alloc(MEMORY[0x189603F18]) initWithObjects:0 count:v9];
      }

      v19 = (void *)v15;
      [a3 _encodeArrayOfObjects:v15 forKey:@"NS.keys"];

      if (v11)
      {
        if (v9 >= 1)
        {
          v20 = (id *)v11;
          uint64_t v21 = v9;
          do
          {
            id v22 = *v20++;
            --v21;
          }

          while (v21);
        }

        uint64_t v23 = [objc_alloc(MEMORY[0x189603F18]) _initByAdoptingBuffer:v11 count:v9 size:v9];
      }

      else
      {
        uint64_t v23 = [objc_alloc(MEMORY[0x189603F18]) initWithObjects:0 count:v9];
      }

      v24 = (void *)v23;
      [a3 _encodeArrayOfObjects:v23 forKey:@"NS.objects"];
    }

    else
    {
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      uint64_t v25 = [a1 countByEnumeratingWithState:&v36 objects:v35 count:16];
      if (v25)
      {
        uint64_t v26 = 0LL;
        uint64_t v27 = *(void *)v37;
        do
        {
          for (uint64_t i = 0LL; i != v25; ++i)
          {
            if (*(void *)v37 != v27) {
              objc_enumerationMutation(a1);
            }
            uint64_t v29 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            [a3 encodeObject:v29, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"NS.key.%ld", v26 + i) forKey];
            [a3 encodeObject:objc_msgSend(a1, "objectForKey:", v29), +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"NS.object.%ld", v26 + i) forKey];
          }

          uint64_t v25 = [a1 countByEnumeratingWithState:&v36 objects:v35 count:16];
          v26 += i;
        }

        while (v25);
      }
    }
  }

  else
  {
    int v34 = [a1 count];
    [a3 encodeValueOfObjCType:"i" at:&v34];
    uint64_t v16 = (void *)[a1 keyEnumerator];
    for (uint64_t j = [v16 nextObject]; ; uint64_t j = objc_msgSend(v16, "nextObject"))
    {
      uint64_t v18 = j;
      if (!j) {
        break;
      }
      [a3 encodeBycopyObject:j];
      objc_msgSend(a3, "encodeBycopyObject:", objc_msgSend(a1, "objectForKey:", v18));
    }
  }

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

- (id)descriptionInStringsFileFormat
{
  id v2 = (id)[objc_allocWithZone((Class)NSMutableString) init];
  v3 = (void *)[a1 keyEnumerator];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    do
    {
      uint64_t v6 = (void *)[a1 objectForKey:v5];
      else {
        uint64_t v7 = [v6 description];
      }
      uint64_t v8 = v7;
      objc_msgSend( v2,  "replaceCharactersInRange:withString:",  objc_msgSend(v2, "length"),  0,  objc_msgSend(v5, "quotedStringRepresentation"));
      objc_msgSend(v2, "replaceCharactersInRange:withString:", objc_msgSend(v2, "length"), 0, @" = ");
      [v2 appendString:v8];
      objc_msgSend(v2, "replaceCharactersInRange:withString:", objc_msgSend(v2, "length"), 0, @";\n");
      uint64_t v5 = (void *)[v3 nextObject];
    }

    while (v5);
  }

  return v2;
}

- (uint64_t)_stringToWrite
{
  v1 = (void *)[a1 descriptionWithLocale:0 indent:0];
  if ([v1 hasSuffix:@"\n"]) {
    return (uint64_t)v1;
  }
  else {
    return [v1 stringByAppendingString:@"\n"];
  }
}

- (uint64_t)writeToFile:()NSDictionary atomically:
{
  if (*MEMORY[0x189604A70]) {
    ((void (*)(void *, uint64_t, void))*MEMORY[0x189604A70])(a1, v4, *MEMORY[0x189604A18]);
  }
  uint64_t v8 = (void *)MEMORY[0x186E1FF60]();
  if (_NSIsPList((uint64_t)a1, 1, (void *)[MEMORY[0x189603FE0] set]) == 4)
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

- (uint64_t)writeToURL:()NSDictionary atomically:
{
  v13[1] = *(id *)MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A70])
  {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x189604A70])(a1, v4, *MEMORY[0x189604A18]);
    if (!a3) {
      return 0LL;
    }
  }

  else if (!a3)
  {
    return 0LL;
  }

  v13[0] = 0LL;
  uint64_t v8 = (void *)MEMORY[0x186E1FF60]();
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

- (uint64_t)writeToURL:()NSDictionary error:
{
  v14[1] = *(id *)MEMORY[0x1895F89C0];
  if (*MEMORY[0x189604A70]) {
    ((void (*)(uint64_t, uint64_t, void))*MEMORY[0x189604A70])(a1, v4, *MEMORY[0x189604A18]);
  }
  v14[0] = 0LL;
  uint64_t v8 = (void *)MEMORY[0x186E1FF60]();
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

+ (id)dictionaryWithContentsOfFile:()NSDictionary
{
  return (id)[objc_allocWithZone(a1) initWithContentsOfFile:a3];
}

+ (id)dictionaryWithContentsOfURL:()NSDictionary
{
  return (id)[objc_allocWithZone(a1) initWithContentsOfURL:a3];
}

+ (id)dictionaryWithContentsOfURL:()NSDictionary error:
{
  return (id)[objc_allocWithZone(a1) initWithContentsOfURL:a3 error:a4];
}

+ (id)newWithContentsOf:()NSDictionary immutable:
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v13 = 0LL;
  if (!a3) {
    return 0LL;
  }
  int v6 = _NSIsNSString();
  id v7 = objc_allocWithZone(MEMORY[0x189603F48]);
  uint64_t v8 = v6
     ? [v7 initWithContentsOfFile:a3 options:0 error:&v13]
     : [v7 initWithContentsOfURL:a3 options:0 error:&v13];
  uint64_t v9 = (void *)v8;
  if (!v8) {
    return 0LL;
  }
  id v10 =  +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v8,  a4 ^ 1u,  0LL,  &v13);

  if ((_NSIsNSDictionary() & 1) == 0)
  {

    id v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ did not contain a top-level dictionary value",  a3);
    id v14 = @"NSDebugDescription";
    v15[0] = v11;
    id v13 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  259,  [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1]);

    return 0LL;
  }

  return v10;
}

+ (id)newWithContentsOf:()NSDictionary immutable:error:
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
    id v11 = (void *)v10;
    if (v10)
    {
      id v12 =  +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v10,  a4 ^ 1u,  0LL,  &v15);

      if ((_NSIsNSDictionary() & 1) != 0) {
        goto LABEL_9;
      }

      id v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ did not contain a top-level dictionary value",  a3);
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

- (uint64_t)initWithContentsOfFile:()NSDictionary
{
  uint64_t v4 = [MEMORY[0x189603F68] newWithContentsOf:a3 immutable:1];

  return v4;
}

- (uint64_t)initWithContentsOfURL:()NSDictionary
{
  uint64_t v4 = [MEMORY[0x189603F68] newWithContentsOf:a3 immutable:1];

  return v4;
}

- (id)initWithContentsOfURL:()NSDictionary error:
{
  v16[1] = *MEMORY[0x1895F89C0];
  id v14 = 0LL;
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

      if ((_NSIsNSDictionary() & 1) != 0) {
        goto LABEL_9;
      }

      id v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ did not contain a top-level dictionary value",  a3);
      uint64_t v15 = @"NSDebugDescription";
      v16[0] = v12;
      id v14 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  259,  [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1]);
    }
  }

  id v11 = 0LL;
LABEL_9:
  if (a4) {
    *a4 = v14;
  }

  return v11;
}

@end