@interface NSDictionary
+ (BOOL)supportsSecureCoding;
+ (NSDictionary)allocWithZone:(_NSZone *)a3;
+ (NSDictionary)dictionary;
+ (NSDictionary)dictionaryWithDictionary:(NSDictionary *)dict;
+ (NSDictionary)dictionaryWithDictionary:(id)a3 copyItems:(BOOL)a4;
+ (NSDictionary)dictionaryWithObject:(id)object forKey:(id)key;
+ (NSDictionary)dictionaryWithObjects:(NSArray *)objects forKeys:(NSArray *)keys;
+ (NSDictionary)dictionaryWithObjects:(id *)objects forKeys:(id *)keys count:(NSUInteger)cnt;
+ (NSDictionary)dictionaryWithObjectsAndKeys:(id)firstObject;
+ (id)newDictionaryWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
+ (id)sharedKeySetForKeys:(NSArray *)keys;
- (BOOL)__getValue:(id *)a3 forKey:(id)a4;
- (BOOL)containsKey:(id)a3;
- (BOOL)containsObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDictionary:(NSDictionary *)otherDictionary;
- (BOOL)isNSDictionary__;
- (NSArray)allKeys;
- (NSArray)allKeysForObject:(id)anObject;
- (NSArray)allValues;
- (NSArray)keysSortedByValueUsingComparator:(NSComparator)cmptr;
- (NSArray)keysSortedByValueUsingSelector:(SEL)comparator;
- (NSArray)keysSortedByValueWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
- (NSArray)objectsForKeys:(NSArray *)keys notFoundMarker:(id)marker;
- (NSDictionary)initWithCoder:(NSCoder *)aDecoder;
- (NSDictionary)initWithDictionary:(NSDictionary *)otherDictionary;
- (NSDictionary)initWithDictionary:(NSDictionary *)otherDictionary copyItems:(BOOL)flag;
- (NSDictionary)initWithObject:(id)a3 forKey:(id)a4;
- (NSDictionary)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys;
- (NSDictionary)initWithObjects:(id *)objects forKeys:(id *)keys count:(NSUInteger)cnt;
- (NSDictionary)initWithObjectsAndKeys:(id)firstObject;
- (NSEnumerator)keyEnumerator;
- (NSEnumerator)objectEnumerator;
- (NSSet)keysOfEntriesPassingTest:(void *)predicate;
- (NSSet)keysOfEntriesWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSString)description;
- (NSString)descriptionWithLocale:(id)locale;
- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
- (NSUInteger)count;
- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)buffer count:(NSUInteger)len;
- (id)_cfMutableCopy;
- (id)allObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invertedDictionary;
- (id)keyOfEntryPassingTest:(id)a3;
- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)aKey;
- (id)objectForKeyedSubscript:(id)key;
- (unint64_t)_cfTypeID;
- (unint64_t)countForKey:(id)a3;
- (unint64_t)countForObject:(id)a3;
- (unint64_t)hash;
- (void)__apply:(void *)a3 context:(void *)a4;
- (void)enumerateKeysAndObjectsUsingBlock:(void *)block;
- (void)enumerateKeysAndObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)getKeys:(id *)a3;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)objects andKeys:(id *)keys;
- (void)getObjects:(id *)objects andKeys:(id *)keys count:(NSUInteger)count;
@end

@implementation NSDictionary

- (unint64_t)_cfTypeID
{
  return 18LL;
}

- (BOOL)isNSDictionary__
{
  return 1;
}

- (NSArray)allKeysForObject:(id)anObject
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  NSUInteger v6 = -[NSDictionary count](self, "count");
  if (v6 >> 60)
  {
    CFStringRef v25 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v6);
    v26 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v25,  0LL);
    CFRelease(v25);
    objc_exception_throw(v26);
  }

  if (v6 <= 1) {
    NSUInteger v6 = 1LL;
  }
  unint64_t v8 = MEMORY[0x1895F8858](v6, v7);
  v10 = (char *)&v27 - v9;
  if (v11 >= 0x101)
  {
    v10 = (char *)_CFCreateArrayStorage(v8, 0, &v28);
    v12 = (id *)v10;
  }

  else
  {
    v12 = 0LL;
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  NSUInteger v13 = -[NSDictionary countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v30,  v29,  16LL);
  v14 = v10;
  if (v13)
  {
    uint64_t v15 = *(void *)v31;
    v14 = v10;
    do
    {
      for (uint64_t i = 0LL; i != v13; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(self);
        }
        uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v18 = -[NSDictionary objectForKey:](self, "objectForKey:", v17);
        if (v18 == anObject || [anObject isEqual:v18])
        {
          *(void *)v14 = v17;
          v14 += 8;
        }
      }

      NSUInteger v13 = -[NSDictionary countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v30,  v29,  16LL);
    }

    while (v13);
  }

  uint64_t v19 = (v14 - v10) >> 3;
  if (v12)
  {
    if (v14 - v10 >= 1)
    {
      if (v19 <= 1) {
        uint64_t v20 = 1LL;
      }
      else {
        uint64_t v20 = (v14 - v10) >> 3;
      }
      v21 = v12;
      do
      {
        id v22 = *v21++;
        --v20;
      }

      while (v20);
    }

    v23 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v12,  v19,  v19);
  }

  else
  {
    v23 = -[NSArray initWithObjects:count:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:count:",  v10,  (v14 - v10) >> 3);
  }

  return v23;
}

- (NSArray)allKeys
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  unint64_t v4 = -[NSDictionary count](self, "count");
  unint64_t v5 = v4;
  if (v4 >> 60)
  {
    CFStringRef v12 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v4);
    NSUInteger v13 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v12,  0LL);
    CFRelease(v12);
    objc_exception_throw(v13);
  }

  if (v4 <= 1) {
    unint64_t v4 = 1LL;
  }
  NSUInteger v6 = (id *)_CFCreateArrayStorage(v4, 0, v14);
  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0LL, v6, v5);
  if (v6)
  {
    if (v5)
    {
      uint64_t v7 = v6;
      unint64_t v8 = v5;
      do
      {
        id v9 = *v7++;
        --v8;
      }

      while (v8);
    }

    v10 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v6,  v5,  v5);
  }

  else
  {
    v10 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", 0LL, v5);
  }

  return v10;
}

- (id)allObjects
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  unint64_t v4 = -[NSDictionary count](self, "count");
  unint64_t v5 = v4;
  if (v4 >> 60)
  {
    CFStringRef v12 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v4);
    NSUInteger v13 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v12,  0LL);
    CFRelease(v12);
    objc_exception_throw(v13);
  }

  if (v4 <= 1) {
    unint64_t v4 = 1LL;
  }
  NSUInteger v6 = (id *)_CFCreateArrayStorage(v4, 0, v14);
  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", v6, 0LL, v5);
  if (v6)
  {
    if (v5)
    {
      uint64_t v7 = v6;
      unint64_t v8 = v5;
      do
      {
        id v9 = *v7++;
        --v8;
      }

      while (v8);
    }

    v10 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v6,  v5,  v5);
  }

  else
  {
    v10 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", 0LL, v5);
  }

  return v10;
}

- (NSArray)allValues
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  unint64_t v4 = -[NSDictionary count](self, "count");
  unint64_t v5 = v4;
  if (v4 >> 60)
  {
    CFStringRef v12 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v4);
    NSUInteger v13 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v12,  0LL);
    CFRelease(v12);
    objc_exception_throw(v13);
  }

  if (v4 <= 1) {
    unint64_t v4 = 1LL;
  }
  NSUInteger v6 = (id *)_CFCreateArrayStorage(v4, 0, v14);
  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", v6, 0LL, v5);
  if (v6)
  {
    if (v5)
    {
      uint64_t v7 = v6;
      unint64_t v8 = v5;
      do
      {
        id v9 = *v7++;
        --v8;
      }

      while (v8);
    }

    v10 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v6,  v5,  v5);
  }

  else
  {
    v10 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", 0LL, v5);
  }

  return v10;
}

- (BOOL)containsKey:(id)a3
{
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
    if (a3) {
      return -[NSDictionary objectForKey:](self, "objectForKey:", a3) != 0;
    }
  }

  else if (a3)
  {
    return -[NSDictionary objectForKey:](self, "objectForKey:", a3) != 0;
  }

  return 0;
}

- (BOOL)containsObject:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  NSUInteger v6 = -[NSDictionary countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
  if (v6)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(self);
        }
        id v10 = -[NSDictionary objectForKey:](self, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i));
        if (v10 == a3 || ([a3 isEqual:v10] & 1) != 0)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
      }

      NSUInteger v7 = -[NSDictionary countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
      LOBYTE(v6) = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }

  return v6;
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)buffer count:(NSUInteger)len
{
  v24[1] = *MEMORY[0x1895F89C0];
  if (!buffer && len)
  {
    uint64_t v19 = _os_log_pack_size();
    uint64_t v20 = (char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315394;
    *(void *)(v21 + 4) = "-[NSDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v21 + 12) = 2048;
    *(void *)(v21 + 14) = len;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSDictionary countByEnumeratingWithState:objects:count:]",  len);
    goto LABEL_28;
  }

  if (len >> 61)
  {
    uint64_t v19 = _os_log_pack_size();
    uint64_t v20 = (char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315394;
    *(void *)(v22 + 4) = "-[NSDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v22 + 12) = 2048;
    *(void *)(v22 + 14) = len;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSDictionary countByEnumeratingWithState:objects:count:]",  len);
LABEL_28:
    v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v20,  v19);
    objc_exception_throw(v23);
  }

  unint64_t v10 = state->state;
  if (state->state == -1LL) {
    return 0LL;
  }
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
    unint64_t v10 = state->state;
    if (state->state) {
      goto LABEL_7;
    }
    goto LABEL_9;
  }

  if (!v10)
  {
LABEL_9:
    state->mutationsPtr = state->extra;
    state->extra[0] = -[NSDictionary count](self, "count");
    CFStringRef v12 = -[NSDictionary keyEnumerator](self, "keyEnumerator");
    state->extra[1] = (unint64_t)v12;
    if (v12)
    {
      unint64_t v11 = v12;
      unint64_t v10 = state->state;
      goto LABEL_11;
    }

    return 0LL;
  }

- (unint64_t)countForKey:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  return -[NSDictionary objectForKey:](self, "objectForKey:", a3) != 0;
}

- (unint64_t)countForObject:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  NSUInteger v6 = -[NSDictionary countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
  if (!v6) {
    return 0LL;
  }
  NSUInteger v7 = v6;
  unint64_t v8 = 0LL;
  uint64_t v9 = *(void *)v15;
  do
  {
    for (uint64_t i = 0LL; i != v7; ++i)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(self);
      }
      id v11 = -[NSDictionary objectForKey:](self, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i));
    }

    NSUInteger v7 = -[NSDictionary countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
  }

  while (v7);
  return v8;
}

- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
  id v60 = locale;
  v70[1] = *MEMORY[0x1895F89C0];
  if (level >= 0x64) {
    NSUInteger v4 = 100LL;
  }
  else {
    NSUInteger v4 = level;
  }
  v61 = self;
  NSUInteger v5 = -[NSDictionary count](self, "count");
  unint64_t v7 = v5;
  if (v5 >> 60)
  {
    CFStringRef v51 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v5);
    v52 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v51,  0LL);
    CFRelease(v51);
    objc_exception_throw(v52);
  }

  NSUInteger v58 = v4;
  if (v5 <= 1) {
    unint64_t v8 = 1LL;
  }
  else {
    unint64_t v8 = v5;
  }
  uint64_t v9 = MEMORY[0x1895F8858](v5, v6);
  CFStringRef v12 = (CFStringRef *)((char *)&v54 - v11);
  if (v7 > 0x100)
  {
    CFStringRef v12 = (CFStringRef *)_CFCreateArrayStorage(v8, 0, v70);
    __int128 v15 = (CFStringRef *)_CFCreateArrayStorage(v8, 0, &v69);
    MEMORY[0x1895F8858](v15, v20);
    uint64_t v18 = (char *)&v53;
    uint64_t v19 = (char *)_CFCreateArrayStorage(v8, 0, v66);
    v56 = v15;
    v57 = v12;
  }

  else
  {
    uint64_t v13 = MEMORY[0x1895F8858](v9, v10);
    __int128 v15 = (CFStringRef *)((char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    MEMORY[0x1895F8858](v13, v16);
    uint64_t v18 = (char *)&v54 - v17;
    v56 = 0LL;
    v57 = 0LL;
    uint64_t v19 = 0LL;
  }

  if (v7 >= 0x101) {
    uint64_t v18 = v19;
  }
  uint64_t v21 = -[NSDictionary getObjects:andKeys:count:](v61, "getObjects:andKeys:count:", 0LL, v18, v7);
  if (v7)
  {
    for (uint64_t i = 0LL; i != v7; ++i)
    {
      if (_NSIsNSString(*(void *)&v18[8 * i]))
      {
        uint64_t v24 = objc_opt_respondsToSelector();
        if ((v24 & 1) != 0) {
          continue;
        }
      }

      memmove(v12, v18, 8 * v7);
      goto LABEL_28;
    }

    MEMORY[0x1895F8858](v24, v25);
    uint64_t v27 = (char *)&v54 - v26;
    if (v7 <= 0x1000) {
      goto LABEL_22;
    }
    size_t v28 = (char *)malloc(8 * v7);
  }

  else
  {
    MEMORY[0x1895F8858](v21, v22);
    uint64_t v27 = (char *)&v54 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
LABEL_22:
    size_t v28 = v27;
  }

  v68[0] = MEMORY[0x1895F87A8];
  v68[1] = 3221225472LL;
  v68[2] = __45__NSDictionary_descriptionWithLocale_indent___block_invoke;
  v68[3] = &__block_descriptor_40_e11_q24__0q8q16l;
  v68[4] = v18;
  CFSortIndexes((uint64_t)v28, v7, 0, (uint64_t)v68);
  if (v7)
  {
    __int128 v30 = (uint64_t *)v28;
    __int128 v31 = v12;
    unint64_t v32 = v7;
    do
    {
      uint64_t v33 = *v30++;
      *v31++ = *(CFStringRef *)&v18[8 * v33];
      --v32;
    }

    while (v32);
  }

  if (v27 != v28) {
    free(v28);
  }
LABEL_28:
  free(v19);
  v66[0] = 0LL;
  v66[1] = (size_t)v66;
  v66[2] = 0x2020000000LL;
  int v67 = -1;
  v62[0] = MEMORY[0x1895F87A8];
  v62[1] = 3221225472LL;
  v63 = __45__NSDictionary_descriptionWithLocale_indent___block_invoke_2;
  v64 = &unk_1899EABA8;
  v65 = v66;
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL);
  CFAllocatorRef v55 = (CFAllocatorRef)&__kCFAllocatorSystemDefault;
  v54 = (void *)MEMORY[0x186E03CAC]();
  if (v7)
  {
    NSUInteger v59 = v58 + 1;
    v35 = v12;
    v36 = v15;
    unint64_t v37 = v7;
    do
    {
      v38 = (__CFString *)*v35;
      id v39 = -[NSDictionary objectForKey:](v61, "objectForKey:", *v35, v54, v55, v56, v57);
      if (_NSIsNSString((uint64_t)v38))
      {
        uint64_t v40 = -[__CFString _stringRepresentation](v38, "_stringRepresentation");
      }

      else if ((_NSIsNSDictionary((uint64_t)v38) & 1) != 0 || _NSIsNSArray((uint64_t)v38))
      {
        uint64_t v40 = -[__CFString descriptionWithLocale:indent:](v38, "descriptionWithLocale:indent:", v60, v59);
      }

      else if (_NSIsNSData((uint64_t)v38))
      {
        uint64_t v40 = -[__CFString description](v38, "description");
      }

      else
      {
        uint64_t v45 = -[__CFString description](v38, "description");
        uint64_t v40 = v63((uint64_t)v62, (void *)v45);
      }

      v41 = (const __CFString *)v40;
      if (_NSIsNSString((uint64_t)v39))
      {
        uint64_t v42 = [v39 _stringRepresentation];
      }

      else if ((_NSIsNSDictionary((uint64_t)v39) & 1) != 0 || _NSIsNSArray((uint64_t)v39))
      {
        uint64_t v42 = [v39 descriptionWithLocale:v60 indent:v59];
      }

      else if (_NSIsNSData((uint64_t)v39))
      {
        uint64_t v42 = [v39 description];
      }

      else
      {
        uint64_t v46 = [v39 description];
        uint64_t v42 = v63((uint64_t)v62, (void *)v46);
      }

      if (v41) {
        v43 = v41;
      }
      else {
        v43 = @"(null)";
      }
      *v35++ = v43;
      if (v42) {
        v44 = (const __CFString *)v42;
      }
      else {
        v44 = @"(null)";
      }
      *v36++ = v44;
      --v37;
    }

    while (v37);
  }

  CFMutableStringRef v47 = CFStringCreateMutable(v55, 0LL);
  for (NSUInteger j = v58; j; --j)
    CFStringAppend(v47, @"    ");
  CFStringAppend(Mutable, v47);
  CFStringAppend(Mutable, @"{\n");
  for (; v7; --v7)
  {
    CFStringAppend(Mutable, v47);
    CFStringAppend(Mutable, @"    ");
    CFStringAppend(Mutable, *v12);
    CFStringAppend(Mutable, @" = ");
    CFStringAppend(Mutable, *v15);
    CFStringAppend(Mutable, @";\n");
    ++v15;
    ++v12;
  }

  CFStringAppend(Mutable, v47);
  CFStringAppend(Mutable, @"}");
  CFRelease(v47);
  objc_autoreleasePoolPop(v54);
  v49 = Mutable;
  _Block_object_dispose(v66, 8);
  free(v56);
  free(v57);
  return v49;
}

uint64_t __45__NSDictionary_descriptionWithLocale_indent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 8 * a2) compare:*(void *)(*(void *)(a1 + 32) + 8 * a3)];
}

uint64_t __45__NSDictionary_descriptionWithLocale_indent___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == -1) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_lookUpClass("NSString") != 0LL;
  }
  else {
    return (uint64_t)a2;
  }
}

- (NSString)descriptionWithLocale:(id)locale
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  return -[NSDictionary descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", locale, 0LL);
}

- (NSString)description
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  return -[NSDictionary descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", 0LL, 0LL);
}

- (void)enumerateKeysAndObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (!block)
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[NSDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]");
    uint64_t v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v9);
    objc_exception_throw(v11);
  }

  char v6 = opts;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  __NSDictionaryParameterCheckIterate((objc_class *)self, a2, (uint64_t)block);
  __NSDictionaryEnumerate(self, v6 & 0xFD, (uint64_t)block);
}

- (void)enumerateKeysAndObjectsUsingBlock:(void *)block
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (!block)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSDictionary enumerateKeysAndObjectsUsingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[NSDictionary enumerateKeysAndObjectsUsingBlock:]");
    unint64_t v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
    objc_exception_throw(v8);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  -[NSDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]( self,  "enumerateKeysAndObjectsWithOptions:usingBlock:",  0LL,  block);
}

- (void)getObjects:(id *)objects andKeys:(id *)keys count:(NSUInteger)count
{
  NSUInteger v6 = count;
  uint64_t v7 = keys;
  unint64_t v8 = objects;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  NSUInteger v10 = count >> 61;
  if (objects && v10 || keys && v10)
  {
    uint64_t v16 = _os_log_pack_size();
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315394;
    *(void *)(v17 + 4) = "-[NSDictionary getObjects:andKeys:count:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(void *)(v17 + 14) = v6;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSDictionary getObjects:andKeys:count:]",  v6);
    uint64_t v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v19[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v16);
    objc_exception_throw(v18);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
  }
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  NSUInteger v11 = -[NSDictionary countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
  if (v11)
  {
    NSUInteger v12 = v11;
    uint64_t v13 = *(void *)v21;
LABEL_9:
    uint64_t v14 = 0LL;
    while (1)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(self);
      }
      if (v6 == v14) {
        break;
      }
      __int128 v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
      if (v7) {
        *v7++ = v15;
      }
      if (v8) {
        *v8++ = -[NSDictionary objectForKey:](self, "objectForKey:", v15);
      }
      if (v12 == ++v14)
      {
        NSUInteger v12 = -[NSDictionary countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
        v6 -= v14;
        if (v12) {
          goto LABEL_9;
        }
        return;
      }
    }
  }

- (void)getObjects:(id *)objects andKeys:(id *)keys
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  NSUInteger v8 = -[NSDictionary count](self, "count");
  NSUInteger v9 = v8 >> 61;
  if (objects && v9 || keys && v9)
  {
    NSUInteger v10 = v8;
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[NSDictionary getObjects:andKeys:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = v10;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSDictionary getObjects:andKeys:]",  v10);
    uint64_t v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v11);
    objc_exception_throw(v13);
  }

  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", objects, keys, v8);
}

- (void)getKeys:(id *)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  NSUInteger v6 = -[NSDictionary count](self, "count");
  if (a3 && v6 >> 61)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v9 + 4) = "-[NSDictionary getKeys:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = v7;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSDictionary getKeys:]",  v7);
    NSUInteger v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v8);
    objc_exception_throw(v10);
  }

  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0LL, a3, v6);
}

- (void)getObjects:(id *)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  NSUInteger v6 = -[NSDictionary count](self, "count");
  if (a3 && v6 >> 61)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v9 + 4) = "-[NSDictionary getObjects:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = v7;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSDictionary getObjects:]",  v7);
    NSUInteger v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v8);
    objc_exception_throw(v10);
  }

  -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", a3, 0LL, v6);
}

- (unint64_t)hash
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  return -[NSDictionary count](self, "count");
}

- (id)invertedDictionary
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  return +[NSDictionary dictionaryWithObjects:forKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:",  -[NSDictionary allKeys](self, "allKeys"),  -[NSDictionary allObjects](self, "allObjects"));
}

- (BOOL)isEqualToDictionary:(NSDictionary *)otherDictionary
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (otherDictionary && (_NSIsNSDictionary((uint64_t)otherDictionary) & 1) == 0)
  {
    uint64_t v16 = _os_log_pack_size();
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSDictionary isEqualToDictionary:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: dictionary argument is not an NSDictionary",  "-[NSDictionary isEqualToDictionary:]");
    uint64_t v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v23[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v16);
    objc_exception_throw(v18);
    LOBYTE(v6) = -[NSDictionary isEqual:](v19, v20, v21);
  }

  else
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
    }
    LOBYTE(v6) = otherDictionary == self;
    if (otherDictionary != self && otherDictionary)
    {
      NSUInteger v7 = -[NSDictionary count](self, "count");
      if (-[NSDictionary count](otherDictionary, "count") == v7)
      {
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        __int128 v24 = 0u;
        __int128 v25 = 0u;
        NSUInteger v8 = -[NSDictionary countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v24,  v23,  16LL);
        if (!v8)
        {
          LOBYTE(v6) = 1;
          return v6;
        }

        NSUInteger v9 = v8;
        uint64_t v10 = *(void *)v25;
LABEL_10:
        uint64_t v11 = 0LL;
        while (1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(self);
          }
          uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * v11);
          id v13 = -[NSDictionary objectForKey:](otherDictionary, "objectForKey:", v12);
          id v14 = -[NSDictionary objectForKey:](self, "objectForKey:", v12);
          if (v13 && v14 == 0LL) {
            break;
          }
          if (v14)
          {
            if (!v13) {
              break;
            }
            int v6 = [v14 isEqual:v13];
            if (!v6) {
              return v6;
            }
          }

          if (v9 == ++v11)
          {
            NSUInteger v9 = -[NSDictionary countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v24,  v23,  16LL);
            LOBYTE(v6) = 1;
            if (v9) {
              goto LABEL_10;
            }
            return v6;
          }
        }
      }

      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }

  else if (a3)
  {
    int v6 = _NSIsNSDictionary((uint64_t)a3);
    if (v6) {
      LOBYTE(v6) = -[NSDictionary isEqualToDictionary:](self, "isEqualToDictionary:", a3);
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSDictionary keyOfEntryWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSDictionary keyOfEntryWithOptions:passingTest:]");
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v10);
    objc_exception_throw(v12);
  }

  char v6 = a3;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  __NSDictionaryParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4);
  v14[0] = 0LL;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __50__NSDictionary_keyOfEntryWithOptions_passingTest___block_invoke;
  v13[3] = &unk_1899EB2F8;
  v13[4] = a4;
  v13[5] = v14;
  __NSDictionaryEnumerate(self, v6 & 0xFD, (uint64_t)v13);
  return (id)v14[0];
}

uint64_t __50__NSDictionary_keyOfEntryWithOptions_passingTest___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  char v8 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  if ((_DWORD)result)
  {
    **(void **)(a1 + 40) = a2;
    *a4 = 1;
  }

  if (v8) {
    *a4 = 1;
  }
  return result;
}

- (id)keyOfEntryPassingTest:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSDictionary keyOfEntryPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSDictionary keyOfEntryPassingTest:]");
    uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  return -[NSDictionary keyOfEntryWithOptions:passingTest:](self, "keyOfEntryWithOptions:passingTest:", 0LL, a3);
}

- (NSSet)keysOfEntriesWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!predicate)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSDictionary keysOfEntriesWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSDictionary keysOfEntriesWithOptions:passingTest:]");
    id v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v11);
    objc_exception_throw(v13);
  }

  char v6 = opts;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  __NSDictionaryParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate);
  uint64_t v9 = +[NSSet set](&OBJC_CLASS___NSMutableSet, "set");
  uint64_t v19 = 0LL;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v16 = 0u;
  uint64_t v15 = 850045857LL;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  void v14[2] = __53__NSDictionary_keysOfEntriesWithOptions_passingTest___block_invoke;
  v14[3] = &unk_18999C118;
  v14[5] = predicate;
  v14[6] = &v15;
  v14[4] = v9;
  __NSDictionaryEnumerate(self, v6 & 0xFD, (uint64_t)v14);
  return +[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v9);
}

uint64_t __53__NSDictionary_keysOfEntriesWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if ((_DWORD)result)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 48));
    [*(id *)(a1 + 32) addObject:a2];
    return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 48));
  }

  return result;
}

- (NSSet)keysOfEntriesPassingTest:(void *)predicate
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!predicate)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSDictionary keysOfEntriesPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSDictionary keysOfEntriesPassingTest:]");
    uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  return -[NSDictionary keysOfEntriesWithOptions:passingTest:]( self,  "keysOfEntriesWithOptions:passingTest:",  0LL,  predicate);
}

- (NSArray)keysSortedByValueWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr
{
  v47[1] = *MEMORY[0x1895F89C0];
  if (!cmptr)
  {
    uint64_t v32 = _os_log_pack_size();
    uint64_t v34 = (char *)&v42 - ((MEMORY[0x1895F8858](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v35 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v35 = 136315138;
    *(void *)(v35 + 4) = "-[NSDictionary keysSortedByValueWithOptions:usingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSDictionary keysSortedByValueWithOptions:usingComparator:]");
    v36 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v34,  v32);
    objc_exception_throw(v36);
    __break(1u);
  }

  char v6 = opts;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  NSUInteger v8 = -[NSDictionary count](self, "count");
  if (!v8) {
    return +[NSArray array](&OBJC_CLASS___NSArray, "array");
  }
  unint64_t v10 = v8;
  if (v8 >> 60)
  {
    CFStringRef v37 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v8);
    v38 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v37,  0LL);
    CFRelease(v37);
    objc_exception_throw(v38);
    uint64_t v40 = v39;
    free(v43);
    _Unwind_Resume(v40);
  }

  uint64_t v11 = MEMORY[0x1895F8858](v8, v9);
  id v14 = (char *)&v42 - v13;
  if (v10 > 0x100)
  {
    id v14 = (char *)_CFCreateArrayStorage(v10, 0, v47);
    MEMORY[0x1895F8858](v14, v19);
    __int128 v16 = (char *)&v41;
    v43 = v14;
    __int128 v17 = (char *)_CFCreateArrayStorage(v10, 0, &v46);
  }

  else
  {
    MEMORY[0x1895F8858](v11, v12);
    __int128 v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v43 = 0LL;
    __int128 v17 = 0LL;
  }

  if (v10 >= 0x101) {
    uint64_t v20 = v17;
  }
  else {
    uint64_t v20 = v16;
  }
  id v21 = (id *)_CFCreateArrayStorage(v10, 0, &v45);
  uint64_t v22 = -[NSDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", v20, v14, v10);
  MEMORY[0x1895F8858](v22, v23);
  __int128 v25 = (char *)&v42 - v24;
  __int128 v26 = (char *)&v42 - v24;
  if (v10 > 0x1000) {
    __int128 v26 = (char *)malloc(8 * v10);
  }
  v44[0] = MEMORY[0x1895F87A8];
  v44[1] = 3221225472LL;
  v44[2] = __61__NSDictionary_keysSortedByValueWithOptions_usingComparator___block_invoke;
  v44[3] = &unk_189996258;
  v44[4] = cmptr;
  v44[5] = v20;
  CFSortIndexes((uint64_t)v26, v10, v6, (uint64_t)v44);
  for (uint64_t i = 0LL; i != v10; ++i)
    v21[i] = *(id *)&v14[8 * *(void *)&v26[8 * i]];
  if (v25 != v26) {
    free(v26);
  }
  if ((uint64_t)v10 >= 1)
  {
    uint64_t v28 = v21;
    unint64_t v29 = v10;
    do
    {
      id v30 = *v28++;
      --v29;
    }

    while (v29);
  }

  __int128 v31 = (NSArray *) -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v21,  v10,  v10);
  free(v17);
  free(v43);
  return v31;
}

uint64_t __61__NSDictionary_keysSortedByValueWithOptions_usingComparator___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(*(void *)(a1 + 40) + 8 * a2),  *(void *)(*(void *)(a1 + 40) + 8 * a3));
}

- (NSArray)keysSortedByValueUsingComparator:(NSComparator)cmptr
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!cmptr)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSDictionary keysSortedByValueUsingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSDictionary keysSortedByValueUsingComparator:]");
    uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  return -[NSDictionary keysSortedByValueWithOptions:usingComparator:]( self,  "keysSortedByValueWithOptions:usingComparator:",  0LL,  cmptr);
}

- (NSArray)keysSortedByValueUsingSelector:(SEL)comparator
{
  v7[5] = *MEMORY[0x1895F89C0];
  if (!comparator) {
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __47__NSDictionary_keysSortedByValueUsingSelector___block_invoke;
  v7[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v7[4] = comparator;
  return -[NSDictionary keysSortedByValueWithOptions:usingComparator:]( self,  "keysSortedByValueWithOptions:usingComparator:",  0LL,  v7);
}

id __47__NSDictionary_keysSortedByValueUsingSelector___block_invoke(uint64_t a1, id a2)
{
  return [a2 *(SEL *)(a1 + 32)];
}

- (NSEnumerator)objectEnumerator
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  return (NSEnumerator *) -[__NSFastEnumerationEnumerator initWithObject:]( objc_alloc(&OBJC_CLASS_____NSDictionaryObjectEnumerator),  "initWithObject:",  self);
}

- (id)objectForKeyedSubscript:(id)key
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  return -[NSDictionary objectForKey:](self, "objectForKey:", key);
}

- (NSArray)objectsForKeys:(NSArray *)keys notFoundMarker:(id)marker
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  if (!marker)
  {
    uint64_t v27 = _os_log_pack_size();
    unint64_t v29 = (char *)&v34 - ((MEMORY[0x1895F8858](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSDictionary objectsForKeys:notFoundMarker:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: marker cannot be nil",  "-[NSDictionary objectsForKeys:notFoundMarker:]");
    __int128 v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v29,  v27);
    objc_exception_throw(v31);
    __break(1u);
LABEL_31:
    CFStringRef v32 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v10);
    uint64_t v33 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v32,  0LL);
    CFRelease(v32);
    objc_exception_throw(v33);
  }

  NSUInteger v8 = -[NSArray count](keys, "count");
  NSUInteger v10 = v8;
  if (v8 >> 60) {
    goto LABEL_31;
  }
  if (v8 <= 1) {
    NSUInteger v8 = 1LL;
  }
  unint64_t v11 = MEMORY[0x1895F8858](v8, v9);
  uint64_t v13 = (char *)&v34 - v12;
  if (v14 >= 0x101)
  {
    uint64_t v13 = (char *)_CFCreateArrayStorage(v11, 0, &v35);
    uint64_t v15 = (id *)v13;
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  unint64_t v16 = -[NSArray countByEnumeratingWithState:objects:count:]( keys,  "countByEnumeratingWithState:objects:count:",  &v37,  v36,  16LL);
  __int128 v17 = v13;
  if (v16)
  {
    uint64_t v18 = *(void *)v38;
    __int128 v17 = v13;
    do
    {
      for (uint64_t i = 0LL; i != v16; ++i)
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(keys);
        }
        id v20 = -[NSDictionary objectForKey:](self, "objectForKey:", *(void *)(*((void *)&v37 + 1) + 8 * i));
        if (v20) {
          id v21 = v20;
        }
        else {
          id v21 = marker;
        }
        *(void *)__int128 v17 = v21;
        v17 += 8;
      }

      unint64_t v16 = -[NSArray countByEnumeratingWithState:objects:count:]( keys,  "countByEnumeratingWithState:objects:count:",  &v37,  v36,  16LL);
    }

    while (v16);
  }

  if (v15)
  {
    if (v17 - v13 >= 1)
    {
      if ((v17 - v13) >> 3 <= 1) {
        uint64_t v22 = 1LL;
      }
      else {
        uint64_t v22 = (v17 - v13) >> 3;
      }
      uint64_t v23 = v15;
      do
      {
        id v24 = *v23++;
        --v22;
      }

      while (v22);
    }

    __int128 v25 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v15,  (v17 - v13) >> 3,  (v17 - v13) >> 3);
  }

  else
  {
    __int128 v25 = -[NSArray initWithObjects:count:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:count:",  v13,  (v17 - v13) >> 3);
  }

  return v25;
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  v6[6] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v4 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: function pointer is NULL",  v4);
    uint64_t v5 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v5);
  }

  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __32__NSDictionary___apply_context___block_invoke;
  v6[3] = &__block_descriptor_48_e15_v32__0_8_16_B24l;
  v6[4] = a3;
  v6[5] = a4;
  -[NSDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]( self,  "enumerateKeysAndObjectsWithOptions:usingBlock:",  0LL,  v6);
}

uint64_t __32__NSDictionary___apply_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

- (BOOL)__getValue:(id *)a3 forKey:(id)a4
{
  id v5 = -[NSDictionary objectForKey:](self, "objectForKey:", a4);
  if (a3 && v5) {
    *a3 = v5;
  }
  return v5 != 0LL;
}

+ (NSDictionary)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSDictionary == a1) {
    return (NSDictionary *)__NSDictionaryImmutablePlaceholder();
  }
  if (&OBJC_CLASS___NSMutableDictionary == a1) {
    return (NSDictionary *)__NSDictionaryMutablePlaceholder();
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSDictionary;
  return (NSDictionary *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSDictionary)initWithDictionary:(NSDictionary *)otherDictionary copyItems:(BOOL)flag
{
  BOOL v4 = flag;
  v35[1] = *MEMORY[0x1895F89C0];
  if (otherDictionary && (_NSIsNSDictionary((uint64_t)otherDictionary) & 1) == 0)
  {
    uint64_t v27 = _os_log_pack_size();
    unint64_t v29 = (char *)&v33 - ((MEMORY[0x1895F8858](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSDictionary initWithDictionary:copyItems:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: dictionary argument is not an NSDictionary",  "-[NSDictionary initWithDictionary:copyItems:]");
    __int128 v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v29,  v27);
    objc_exception_throw(v31);
    __break(1u);
  }

  else
  {
    NSUInteger v7 = -[NSDictionary count](otherDictionary, "count");
    unint64_t v9 = v7;
    if (v7 >> 60)
    {
      CFStringRef v25 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v7);
      __int128 v26 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v25,  0LL);
      CFRelease(v25);
      objc_exception_throw(v26);
    }

    if (v7 <= 1) {
      unint64_t v10 = 1LL;
    }
    else {
      unint64_t v10 = v7;
    }
    uint64_t v11 = MEMORY[0x1895F8858](v7, v8);
    unint64_t v14 = (id *)((char *)&v33 - v13);
    if (v9 > 0x100)
    {
      __int128 v17 = (id *)_CFCreateArrayStorage(v10, 0, v35);
      MEMORY[0x1895F8858](v17, v19);
      unint64_t v16 = (id *)&v32;
      uint64_t v18 = (id *)_CFCreateArrayStorage(v10, 0, &v34);
      unint64_t v14 = v17;
    }

    else
    {
      MEMORY[0x1895F8858](v11, v12);
      unint64_t v16 = (id *)((char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      __int128 v17 = 0LL;
      uint64_t v18 = 0LL;
    }

    if (v9 >= 0x101) {
      unint64_t v16 = v18;
    }
    -[NSDictionary getObjects:andKeys:count:](otherDictionary, "getObjects:andKeys:count:", v16, v14, v9);
    if (!v9) {
      BOOL v4 = 0;
    }
    if (v4)
    {
      id v20 = v14;
      id v21 = v16;
      unint64_t v22 = v9;
      do
      {
        *id v20 = (id)[*v20 copyWithZone:0];
        id *v21 = (id)[*v21 copyWithZone:0];
        ++v21;
        ++v20;
        --v22;
      }

      while (v22);
    }

    uint64_t v23 = -[NSDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", v16, v14, v9);
    if (v4)
    {
      do
      {

        ++v14;
        --v9;
      }

      while (v9);
    }

    free(v18);
    free(v17);
    return v23;
  }

  return result;
}

- (NSDictionary)initWithDictionary:(NSDictionary *)otherDictionary
{
  return -[NSDictionary initWithDictionary:copyItems:](self, "initWithDictionary:copyItems:", otherDictionary, 0LL);
}

- (NSDictionary)initWithObject:(id)a3 forKey:(id)a4
{
  v6[1] = *MEMORY[0x1895F89C0];
  id v5 = a4;
  v6[0] = a3;
  return -[NSDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", v6, &v5, 1LL);
}

- (NSDictionary)initWithObjectsAndKeys:(id)firstObject
{
  uint64_t v34 = va_arg(va1, void);
  v33[1] = *MEMORY[0x1895F89C0];
  v33[0] = (uint64_t)firstObject;
  char v6 = (__objc2_class *)objc_opt_class();
  if (!firstObject)
  {
    if (v6 != &OBJC_CLASS___NSDictionary)
    {
      unint64_t v10 = 0LL;
LABEL_10:
      if (v10 <= 1) {
        unint64_t v14 = 1LL;
      }
      else {
        unint64_t v14 = v10;
      }
      uint64_t v15 = MEMORY[0x1895F8858](v6, v7);
      if (v10 >= 0x101)
      {
        id v20 = _CFCreateArrayStorage(v14, 0, &v31);
        id v21 = (id *)_CFCreateArrayStorage(v14, 0, &v30);
        va_copy(v32, va);
        id *v21 = firstObject;
        unint64_t v22 = v32;
        v32 += 8;
        *id v20 = *v22;
        __int128 v17 = v20;
        uint64_t v19 = v21;
      }

      else
      {
        MEMORY[0x1895F8858](v15, v16);
        uint64_t v19 = (id *)((char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL));
        if (!v10)
        {
          id v21 = 0LL;
          id v20 = 0LL;
LABEL_24:
          __int128 v26 = -[NSDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:");
          free(v21);
          free(v20);
          return v26;
        }

        id v20 = 0LL;
        id v21 = 0LL;
        *uint64_t v19 = firstObject;
        va_copy(v32, va1);
        *__int128 v17 = v34;
        if (v10 == 1) {
          goto LABEL_24;
        }
      }

      for (uint64_t i = 1LL; i != v10; ++i)
      {
        id v24 = v32;
        v32 += 8;
        v19[i] = (id)*v24;
        CFStringRef v25 = v32;
        v32 += 8;
        v17[i] = *v25;
      }

      goto LABEL_24;
    }

    return (NSDictionary *)&__NSDictionary0__struct;
  }

  unint64_t v8 = 0LL;
  va_copy(v32, va);
  do
  {
    unint64_t v9 = v32;
    v32 += 8;
    ++v8;
  }

  while (*v9);
  if ((v8 & 1) != 0)
  {
    uint64_t v27 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: second object of each pair must be non-nil.  Or, did you forget to nil-terminate your parameter list?",  v27);
    uint64_t v28 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v28);
    goto LABEL_27;
  }

  unint64_t v10 = v8 >> 1;
  if (v6 == &OBJC_CLASS___NSDictionary)
  {

    va_copy(v32, va);
    return (NSDictionary *)__NSDictionaryI_new(v33, 0LL, (uint64_t *)va, v10, 1LL);
  }

  if (!(v8 >> 61)) {
    goto LABEL_10;
  }
  CFStringRef v11 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v8 >> 1);
  uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v11,  0LL);
  CFRelease(v11);
  objc_exception_throw(v12);
LABEL_27:
  __break(1u);
  return result;
}

- (NSDictionary)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys
{
  v42[1] = *MEMORY[0x1895F89C0];
  if (objects && (_NSIsNSArray((uint64_t)objects) & 1) == 0)
  {
    uint64_t v29 = _os_log_pack_size();
    size_t v31 = (char *)&v40 - ((MEMORY[0x1895F8858](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v32 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v32 = 136315138;
    *(void *)(v32 + 4) = "-[NSDictionary initWithObjects:forKeys:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: objects argument is not an NSArray",  "-[NSDictionary initWithObjects:forKeys:]");
    uint64_t v33 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v31,  v29);
    objc_exception_throw(v33);
LABEL_22:
    __break(1u);
    return result;
  }

  if (keys && (_NSIsNSArray((uint64_t)keys) & 1) == 0)
  {
    uint64_t v34 = _os_log_pack_size();
    v36 = (char *)&v40 - ((MEMORY[0x1895F8858](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v37 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v37 = 136315138;
    *(void *)(v37 + 4) = "-[NSDictionary initWithObjects:forKeys:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: keys argument is not an NSArray",  "-[NSDictionary initWithObjects:forKeys:]");
    __int128 v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v36,  v34);
    objc_exception_throw(v38);
    goto LABEL_22;
  }

  NSUInteger v8 = -[NSArray count](objects, "count");
  NSUInteger v9 = -[NSArray count](keys, "count");
  if (v8 != v9)
  {
    uint64_t v10 = _CFThrowFormattedException( (uint64_t)@"NSInvalidArgumentException",  @"*** %s: count of objects (%lu) differs from count of keys (%lu)",  "-[NSDictionary initWithObjects:forKeys:]",  v8,  v9);
    goto LABEL_18;
  }

  NSUInteger v8 = -[NSArray count](keys, "count");
  uint64_t v10 = -[NSArray count](objects, "count");
  if (v8 != v10)
  {
LABEL_18:
    uint64_t v24 = v10;
    uint64_t v25 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: number of objects (%lu) not equal to number of keys (%lu)",  v25,  v24,  v8);
    __int128 v26 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v26);
LABEL_19:
    CFStringRef v27 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v8);
    uint64_t v28 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v27,  0LL);
    CFRelease(v27);
    objc_exception_throw(v28);
  }

  if (v8 >> 60) {
    goto LABEL_19;
  }
  if (v8 <= 1) {
    unint64_t v12 = 1LL;
  }
  else {
    unint64_t v12 = v8;
  }
  uint64_t v13 = MEMORY[0x1895F8858](v10, v11);
  uint64_t v16 = (char *)&v40 - v15;
  if (v8 > 0x100)
  {
    uint64_t v19 = (char *)_CFCreateArrayStorage(v12, 0, v42);
    MEMORY[0x1895F8858](v19, v21);
    uint64_t v18 = (char *)&v39;
    id v20 = (char *)_CFCreateArrayStorage(v12, 0, &v41);
    uint64_t v16 = v19;
  }

  else
  {
    MEMORY[0x1895F8858](v13, v14);
    uint64_t v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v19 = 0LL;
    id v20 = 0LL;
  }

  if (v8 >= 0x101) {
    uint64_t v18 = v20;
  }
  -[NSArray getObjects:range:](keys, "getObjects:range:", v16, 0LL, v8);
  -[NSArray getObjects:range:](objects, "getObjects:range:", v18, 0LL, v8);
  unint64_t v22 = -[NSDictionary initWithObjects:forKeys:count:](self, "initWithObjects:forKeys:count:", v18, v16, v8);
  free(v20);
  free(v19);
  return v22;
}

+ (NSDictionary)dictionary
{
  return (NSDictionary *)(id)[objc_alloc((Class)a1) initWithObjects:0 forKeys:0 count:0];
}

+ (NSDictionary)dictionaryWithObject:(id)object forKey:(id)key
{
  return (NSDictionary *)(id)__createDictionary(objc_alloc((Class)a1), (uint64_t)object, (uint64_t)key);
}

+ (NSDictionary)dictionaryWithObjects:(id *)objects forKeys:(id *)keys count:(NSUInteger)cnt
{
  return (NSDictionary *)(id)[objc_alloc((Class)a1) initWithObjects:objects forKeys:keys count:cnt];
}

+ (NSDictionary)dictionaryWithObjectsAndKeys:(id)firstObject
{
  uint64_t v33 = va_arg(va1, void);
  v32[1] = *MEMORY[0x1895F89C0];
  v32[0] = (uint64_t)firstObject;
  if (!firstObject)
  {
    if (&OBJC_CLASS___NSDictionary == a1) {
      return (NSDictionary *)&__NSDictionary0__struct;
    }
    unint64_t v7 = 0LL;
    goto LABEL_10;
  }

  unint64_t v5 = 0LL;
  va_copy(v31, va);
  do
  {
    char v6 = v31;
    v31 += 8;
    ++v5;
  }

  while (*v6);
  if ((v5 & 1) != 0)
  {
    uint64_t v26 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: second object of each pair must be non-nil.  Or, did you forget to nil-terminate your parameter list?",  v26);
    CFStringRef v27 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v27);
    goto LABEL_28;
  }

  unint64_t v7 = v5 >> 1;
  if (&OBJC_CLASS___NSDictionary == a1)
  {
    va_copy(v31, va);
    uint64_t v24 = (NSDictionary *)__NSDictionaryI_new(v32, 0LL, (uint64_t *)va, v5 >> 1, 1LL);
LABEL_25:
    uint64_t v25 = v24;
    return v24;
  }

  if (!(v5 >> 61))
  {
LABEL_10:
    if (v7 <= 1) {
      unint64_t v11 = 1LL;
    }
    else {
      unint64_t v11 = v7;
    }
    uint64_t v12 = MEMORY[0x1895F8858](a1, a2);
    uint64_t v15 = (uint64_t *)((char *)&v28 - v14);
    if (v7 >= 0x101)
    {
      uint64_t v18 = _CFCreateArrayStorage(v11, 0, &v30);
      uint64_t v19 = (id *)_CFCreateArrayStorage(v11, 0, &v29);
      va_copy(v31, va);
      *uint64_t v19 = firstObject;
      id v20 = v31;
      v31 += 8;
      *uint64_t v18 = *v20;
      uint64_t v15 = v18;
      uint64_t v17 = v19;
    }

    else
    {
      MEMORY[0x1895F8858](v12, v13);
      uint64_t v17 = (id *)((char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      if (!v7)
      {
        uint64_t v19 = 0LL;
        uint64_t v18 = 0LL;
LABEL_24:
        uint64_t v24 = (NSDictionary *)[objc_alloc((Class)a1) initWithObjects:v17 forKeys:v15 count:v7];
        free(v19);
        free(v18);
        goto LABEL_25;
      }

      uint64_t v18 = 0LL;
      uint64_t v19 = 0LL;
      *uint64_t v17 = firstObject;
      va_copy(v31, va1);
      *uint64_t v15 = v33;
      if (v7 == 1) {
        goto LABEL_24;
      }
    }

    for (uint64_t i = 1LL; i != v7; ++i)
    {
      unint64_t v22 = v31;
      v31 += 8;
      v17[i] = (id)*v22;
      uint64_t v23 = v31;
      v31 += 8;
      v15[i] = *v23;
    }

    goto LABEL_24;
  }

  CFStringRef v8 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v5 >> 1);
  NSUInteger v9 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v8,  0LL);
  CFRelease(v8);
  objc_exception_throw(v9);
LABEL_28:
  __break(1u);
  return result;
}

+ (NSDictionary)dictionaryWithObjects:(NSArray *)objects forKeys:(NSArray *)keys
{
  return (NSDictionary *)(id)[objc_alloc((Class)a1) initWithObjects:objects forKeys:keys];
}

+ (id)newDictionaryWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v18[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a5) {
    goto LABEL_23;
  }
  if (a5 >> 61)
  {
    uint64_t v10 = _os_log_pack_size();
    unint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "+[NSDictionary newDictionaryWithObjects:forKeys:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "+[NSDictionary newDictionaryWithObjects:forKeys:count:]",  a5);
    goto LABEL_22;
  }

  if (a5)
  {
    for (uint64_t i = 0LL; i != a5; ++i)
    {
      if (!a3[i]) {
        goto LABEL_21;
      }
    }

    if (!a4)
    {
      unint64_t v14 = a5;
      uint64_t v10 = _os_log_pack_size();
      unint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      goto LABEL_26;
    }

    uint64_t i = 0LL;
    while (a4[i])
    {
      if (a5 == ++i) {
        goto LABEL_12;
      }
    }

+ (NSDictionary)dictionaryWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  return (NSDictionary *)(id)[objc_alloc((Class)a1) initWithDictionary:a3 copyItems:a4];
}

+ (NSDictionary)dictionaryWithDictionary:(NSDictionary *)dict
{
  return (NSDictionary *)(id)[objc_alloc((Class)a1) initWithDictionary:dict copyItems:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t ShouldCopy = __NSCollectionsShouldCopy();
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  return -[NSDictionary initWithDictionary:copyItems:]( +[NSDictionary allocWithZone:](&OBJC_CLASS___NSDictionary, "allocWithZone:", a3),  "initWithDictionary:copyItems:",  self,  ShouldCopy);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  return -[NSDictionary initWithDictionary:copyItems:]( +[NSDictionary allocWithZone:](&OBJC_CLASS___NSMutableDictionary, "allocWithZone:", a3),  "initWithDictionary:copyItems:",  self,  0LL);
}

- (id)_cfMutableCopy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  return (id)[objc_allocWithZone((Class)NSMutableDictionary) initWithDictionary:self copyItems:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)initWithCoder:(NSCoder *)aDecoder
{
  return 0LL;
}

+ (id)sharedKeySetForKeys:(NSArray *)keys
{
  if (keys)
  {
    uint64_t v12 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: keys must be a kind of NSArray",  v12);
  }

  else
  {
    uint64_t v11 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, @"%@: keys cannot be nil", v11);
  }

  unint64_t v7 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
  objc_exception_throw(v7);
  return +[NSMutableDictionary dictionaryWithSharedKeySet:](v8, v9, v10);
}

- (NSUInteger)count
{
  uint64_t v2 = __CFLookUpClass("NSDictionary");
  OUTLINED_FUNCTION_0_17(v2);
  OUTLINED_FUNCTION_1_11();
  return result;
}

- (id)objectForKey:(id)aKey
{
  uint64_t v3 = __CFLookUpClass("NSDictionary");
  OUTLINED_FUNCTION_0_17(v3);
  OUTLINED_FUNCTION_1_11();
  return result;
}

- (NSEnumerator)keyEnumerator
{
  uint64_t v2 = __CFLookUpClass("NSDictionary");
  OUTLINED_FUNCTION_0_17(v2);
  OUTLINED_FUNCTION_1_11();
  return result;
}

- (NSDictionary)initWithObjects:(id *)objects forKeys:(id *)keys count:(NSUInteger)cnt
{
  unint64_t v5 = __CFLookUpClass("NSDictionary");
  OUTLINED_FUNCTION_0_17(v5);
  OUTLINED_FUNCTION_1_11();
  return result;
}

@end