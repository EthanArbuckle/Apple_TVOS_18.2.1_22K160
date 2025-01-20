@interface NSArray
+ (BOOL)supportsSecureCoding;
+ (NSArray)allocWithZone:(_NSZone *)a3;
+ (NSArray)array;
+ (NSArray)arrayWithArray:(NSArray *)array;
+ (NSArray)arrayWithArray:(id)a3 copyItems:(BOOL)a4;
+ (NSArray)arrayWithArray:(id)a3 range:(_NSRange)a4;
+ (NSArray)arrayWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
+ (NSArray)arrayWithObject:(id)anObject;
+ (NSArray)arrayWithObjects:(id *)objects count:(NSUInteger)cnt;
+ (NSArray)arrayWithObjects:(id)firstObj;
+ (NSArray)arrayWithOrderedSet:(id)a3;
+ (NSArray)arrayWithOrderedSet:(id)a3 copyItems:(BOOL)a4;
+ (NSArray)arrayWithOrderedSet:(id)a3 range:(_NSRange)a4;
+ (NSArray)arrayWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
+ (NSArray)arrayWithSet:(id)a3;
+ (NSArray)arrayWithSet:(id)a3 copyItems:(BOOL)a4;
+ (id)newArrayWithObjects:(const void *)a3 count:(unint64_t)a4;
- (BOOL)containsObject:(id)a3 inRange:(_NSRange)a4;
- (BOOL)containsObject:(id)anObject;
- (BOOL)containsObjectIdenticalTo:(id)a3;
- (BOOL)containsObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToArray:(NSArray *)otherArray;
- (BOOL)isNSArray__;
- (NSArray)arrayByAddingObject:(id)anObject;
- (NSArray)arrayByAddingObjectsFromArray:(NSArray *)otherArray;
- (NSArray)initWithArray:(NSArray *)array;
- (NSArray)initWithArray:(NSArray *)array copyItems:(BOOL)flag;
- (NSArray)initWithArray:(id)a3 range:(_NSRange)a4;
- (NSArray)initWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
- (NSArray)initWithCoder:(NSCoder *)aDecoder;
- (NSArray)initWithObject:(id)a3;
- (NSArray)initWithObjects:(id *)objects count:(NSUInteger)cnt;
- (NSArray)initWithObjects:(id)firstObj;
- (NSArray)initWithOrderedSet:(id)a3;
- (NSArray)initWithOrderedSet:(id)a3 copyItems:(BOOL)a4;
- (NSArray)initWithOrderedSet:(id)a3 range:(_NSRange)a4;
- (NSArray)initWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
- (NSArray)initWithSet:(id)a3;
- (NSArray)initWithSet:(id)a3 copyItems:(BOOL)a4;
- (NSArray)objectsAtIndexes:(NSIndexSet *)indexes;
- (NSArray)sortedArrayUsingComparator:(NSComparator)cmptr;
- (NSArray)sortedArrayUsingFunction:(NSInteger (__cdecl *)comparator context:;
- (NSArray)sortedArrayUsingSelector:(SEL)comparator;
- (NSArray)sortedArrayWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
- (NSArray)subarrayWithRange:(NSRange)range;
- (NSEnumerator)objectEnumerator;
- (NSEnumerator)reverseObjectEnumerator;
- (NSIndexSet)indexesOfObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSIndexSet)indexesOfObjectsPassingTest:(void *)predicate;
- (NSIndexSet)indexesOfObjectsWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSString)componentsJoinedByString:(NSString *)separator;
- (NSString)description;
- (NSString)descriptionWithLocale:(id)locale;
- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
- (NSUInteger)count;
- (NSUInteger)indexOfObject:(id)anObject;
- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range;
- (NSUInteger)indexOfObject:(id)obj inSortedRange:(NSRange)r options:(NSBinarySearchingOptions)opts usingComparator:(NSComparator)cmp;
- (NSUInteger)indexOfObjectAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject;
- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject inRange:(NSRange)range;
- (NSUInteger)indexOfObjectPassingTest:(void *)predicate;
- (NSUInteger)indexOfObjectWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (id)_initByAdoptingBuffer:(id *)a3 count:(unint64_t)a4 size:(unint64_t)a5;
- (id)allObjects;
- (id)arrayByApplyingSelector:(SEL)a3;
- (id)arrayByExcludingObjectsInArray:(id)a3;
- (id)arrayByExcludingToObjectsInArray:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstObject;
- (id)firstObjectCommonWithArray:(NSArray *)otherArray;
- (id)indexesOfObject:(id)a3;
- (id)indexesOfObject:(id)a3 inRange:(_NSRange)a4;
- (id)indexesOfObjectIdenticalTo:(id)a3;
- (id)indexesOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4;
- (id)lastObject;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (id)objectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)objectPassingTest:(id)a3;
- (id)objectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)objectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)objectsPassingTest:(id)a3;
- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)reversedArray;
- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (unint64_t)_cfTypeID;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)countForObject:(id)a3;
- (unint64_t)countForObject:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)hash;
- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)enumerateObjectsUsingBlock:(void *)block;
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)getObjects:(id *)objects;
- (void)getObjects:(id *)objects range:(NSRange)range;
- (void)makeObjectsPerformSelector:(SEL)aSelector;
- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument;
@end

@implementation NSArray

- (unint64_t)_cfTypeID
{
  return 19LL;
}

- (BOOL)isNSArray__
{
  return 1;
}

- (id)allObjects
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  unint64_t v4 = -[NSArray count](self, "count");
  unint64_t v5 = v4;
  if (v4 >> 60)
  {
    CFStringRef v12 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v4);
    v13 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v12,  0LL);
    CFRelease(v12);
    objc_exception_throw(v13);
  }

  if (v4 <= 1) {
    unint64_t v4 = 1LL;
  }
  v6 = (id *)_CFCreateArrayStorage(v4, 0, v14);
  -[NSArray getObjects:range:](self, "getObjects:range:", v6, 0LL, v5);
  if (v6)
  {
    if (v5)
    {
      v7 = v6;
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

- (NSString)componentsJoinedByString:(NSString *)separator
{
  unint64_t v4 = (const __CFString *)separator;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (separator && (_NSIsNSString((uint64_t)separator) & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSArray componentsJoinedByString:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: string argument is not an NSString",  "-[NSArray componentsJoinedByString:]");
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v20[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v14);
    objc_exception_throw(v16);
    return (NSString *)-[NSArray containsObject:inRange:](v17, v18, v19, v26);
  }

  else
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
    }
    if (!v4) {
      unint64_t v4 = &stru_1899EF170;
    }
    unint64_t v6 = -[NSArray count](self, "count");
    Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL);
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    unint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v21,  v20,  16LL);
    if (v8)
    {
      unint64_t v9 = v8;
      uint64_t v10 = 0LL;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(self);
          }
          CFStringAppend(Mutable, (CFStringRef)[*(id *)(*((void *)&v21 + 1) + 8 * i) description]);
          if (v10 + 1 + i < v6) {
            CFStringAppend(Mutable, v4);
          }
        }

        v10 += v9;
        unint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v21,  v20,  16LL);
      }

      while (v9);
    }

    return (NSString *)Mutable;
  }

- (BOOL)containsObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v26[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v19 = v9;
      uint64_t v15 = _os_log_pack_size();
      v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v20 = _os_log_pack_fill();
      double v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v20,  (uint64_t)"-[NSArray containsObject:inRange:]",  location,  length,  --v19);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v21,  "-[NSArray containsObject:inRange:]",  location,  length,  v19);
    }

    else
    {
      uint64_t v15 = _os_log_pack_size();
      v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[NSArray containsObject:inRange:]", location, length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v18,  "-[NSArray containsObject:inRange:]",  location,  length);
    }

    __int128 v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v16,  v15);
    objc_exception_throw(v22);
    return -[NSArray containsObject:](v23, v24, v25);
  }

  else
  {
    if (length)
    {
      id v10 = -[NSArray objectAtIndex:](self, "objectAtIndex:", location);
      if (v10 == a3)
      {
        return 1;
      }

      else
      {
        id v11 = v10;
        unint64_t v12 = 1LL;
        BOOL v13 = 1;
        do
        {
          BOOL v13 = v12 < length;
          if (length == v12) {
            break;
          }
          id v11 = -[NSArray objectAtIndex:](self, "objectAtIndex:", location + v12++);
        }

        while (v11 != a3);
      }
    }

    else
    {
      return 0;
    }

    return v13;
  }

- (BOOL)containsObject:(id)anObject
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  unint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(self);
        }
        if (*(id *)(*((void *)&v12 + 1) + 8 * i) == anObject || (objc_msgSend(anObject, "isEqual:") & 1) != 0)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
      }

      unint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
      LOBYTE(v6) = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }

  return v6;
}

- (BOOL)containsObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v25[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v18 = v9;
      uint64_t v14 = _os_log_pack_size();
      __int128 v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v19 = _os_log_pack_fill();
      double v20 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v19,  (uint64_t)"-[NSArray containsObjectIdenticalTo:inRange:]",  location,  length,  --v18);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v20,  "-[NSArray containsObjectIdenticalTo:inRange:]",  location,  length,  v18);
    }

    else
    {
      uint64_t v14 = _os_log_pack_size();
      __int128 v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_3_8_32_8_0_8_0( v16,  (uint64_t)"-[NSArray containsObjectIdenticalTo:inRange:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v17,  "-[NSArray containsObjectIdenticalTo:inRange:]",  location,  length);
    }

    double v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v15,  v14);
    objc_exception_throw(v21);
    return -[NSArray containsObjectIdenticalTo:](v22, v23, v24);
  }

  else if (length)
  {
    if (-[NSArray objectAtIndex:](self, "objectAtIndex:", location) == a3)
    {
      return 1;
    }

    else
    {
      uint64_t v10 = 1LL;
      do
      {
        NSUInteger v11 = v10;
        if (length == v10) {
          break;
        }
        id v12 = -[NSArray objectAtIndex:](self, "objectAtIndex:", location + v10);
        uint64_t v10 = v11 + 1;
      }

      while (v12 != a3);
      return v11 < length;
    }
  }

  else
  {
    return 0;
  }

- (BOOL)containsObjectIdenticalTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  unint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(self);
        }
        if (*(id *)(*((void *)&v12 + 1) + 8 * v9) == a3)
        {
          LOBYTE(v6) = 1;
          return v6;
        }

        ++v9;
      }

      while (v7 != v9);
      unint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v12,  v11,  16LL);
      unint64_t v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }

  return v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v6 = a5;
  v21[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v16 = (char *)v21 - ((MEMORY[0x1895F8858](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315394;
    *(void *)(v17 + 4) = "-[NSArray countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(void *)(v17 + 14) = v6;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSArray countByEnumeratingWithState:objects:count:]",  v6);
    goto LABEL_21;
  }

  if (a5 >> 61)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v16 = (char *)v21 - ((MEMORY[0x1895F8858](v14, v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "-[NSArray countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = v6;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSArray countByEnumeratingWithState:objects:count:]",  v6);
LABEL_21:
    double v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v16,  v14);
    objc_exception_throw(v20);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  unint64_t var0 = a3->var0;
  if (a3->var0 == -1LL) {
    return 0LL;
  }
  if (var0)
  {
    NSUInteger v11 = a3->var3[0];
  }

  else
  {
    a3->var2 = a3->var3;
    NSUInteger v11 = -[NSArray count](self, "count");
    a3->var3[0] = v11;
    unint64_t var0 = a3->var0;
  }

  a3->var1 = a4;
  if (v11 - var0 < v6) {
    unint64_t v6 = v11 - var0;
  }
  if (v6)
  {
    -[NSArray getObjects:range:](self, "getObjects:range:", a4);
    unint64_t var0 = a3->var0;
  }

  unint64_t v12 = var0 + v6;
  if (v11 <= var0 + v6) {
    unint64_t v12 = -1LL;
  }
  a3->unint64_t var0 = v12;
  return v6;
}

- (unint64_t)countForObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v25[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = -[NSArray count](self, "count");
  NSUInteger v10 = v9;
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v9 < location + length)
  {
    if (v9)
    {
      uint64_t v14 = _os_log_pack_size();
      uint64_t v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v18 = _os_log_pack_fill();
      uint64_t v19 = v10 - 1;
      double v20 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v18,  (uint64_t)"-[NSArray countForObject:inRange:]",  location,  length,  v19);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v20,  "-[NSArray countForObject:inRange:]",  location,  length,  v19);
    }

    else
    {
      uint64_t v14 = _os_log_pack_size();
      uint64_t v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[NSArray countForObject:inRange:]", location, length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v17,  "-[NSArray countForObject:inRange:]",  location,  length);
    }

    double v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v15,  v14);
    objc_exception_throw(v21);
    return -[NSArray countForObject:](v22, v23, v24);
  }

  else
  {
    for (unint64_t i = 0LL; length; --length)
    {
      id v12 = -[NSArray objectAtIndex:](self, "objectAtIndex:", location);
      ++location;
    }

    return i;
  }

- (unint64_t)countForObject:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
  if (!v6) {
    return 0LL;
  }
  unint64_t v7 = v6;
  unint64_t v8 = 0LL;
  uint64_t v9 = *(void *)v14;
  do
  {
    for (uint64_t i = 0LL; i != v7; ++i)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(self);
      }
    }

    unint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
  }

  while (v7);
  return v8;
}

- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
  v38[1] = *MEMORY[0x1895F89C0];
  if (level >= 0x64) {
    NSUInteger v6 = 100LL;
  }
  else {
    NSUInteger v6 = level;
  }
  NSUInteger v7 = -[NSArray count](self, "count");
  unint64_t v9 = v7;
  if (v7 >> 60)
  {
    CFStringRef v27 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v7);
    v28 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v27,  0LL);
    CFRelease(v27);
    objc_exception_throw(v28);
  }

  if (v7 <= 1) {
    NSUInteger v7 = 1LL;
  }
  unint64_t v10 = MEMORY[0x1895F8858](v7, v8);
  id v12 = (uint64_t *)((char *)&v29 - v11);
  if (v9 >= 0x101)
  {
    id v12 = (uint64_t *)_CFCreateArrayStorage(v10, 0, v38);
    __int128 v13 = v12;
  }

  else
  {
    __int128 v13 = 0LL;
  }

  -[NSArray getObjects:range:](self, "getObjects:range:", v12, 0LL, v9);
  v36[0] = 0LL;
  v36[1] = v36;
  v36[2] = 0x2020000000LL;
  int v37 = -1;
  v32[0] = MEMORY[0x1895F87A8];
  v32[1] = 3221225472LL;
  v33 = __40__NSArray_descriptionWithLocale_indent___block_invoke;
  v34 = &unk_1899EABA8;
  v35 = v36;
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL);
  CFAllocatorRef v30 = (CFAllocatorRef)&__kCFAllocatorSystemDefault;
  v31 = v13;
  v29 = (void *)MEMORY[0x186E03CAC]();
  if (v9)
  {
    __int128 v15 = v12;
    unint64_t v16 = v9;
    do
    {
      uint64_t v17 = (void *)*v15;
      if (_NSIsNSString(*v15))
      {
        uint64_t v18 = [v17 _stringRepresentation];
      }

      else if ((_NSIsNSDictionary((uint64_t)v17) & 1) != 0 || _NSIsNSArray((uint64_t)v17))
      {
        uint64_t v18 = objc_msgSend(v17, "descriptionWithLocale:indent:", locale, v6 + 1, v29);
      }

      else if (_NSIsNSData((uint64_t)v17))
      {
        uint64_t v18 = [v17 description];
      }

      else
      {
        uint64_t v20 = objc_msgSend(v17, "description", v29);
        uint64_t v18 = v33((uint64_t)v32, (void *)v20);
      }

      if (v18) {
        uint64_t v19 = (const __CFString *)v18;
      }
      else {
        uint64_t v19 = @"(null)";
      }
      *v15++ = (uint64_t)v19;
      --v16;
    }

    while (v16);
  }

  double v21 = v31;
  for (CFMutableStringRef i = CFStringCreateMutable(v30, 0LL); v6; --v6)
    CFStringAppend(i, @"    ");
  CFStringAppend(Mutable, i);
  CFStringAppend(Mutable, @"(\n");
  unint64_t v23 = 0LL;
  while (v9 != v23)
  {
    CFStringAppend(Mutable, i);
    CFStringAppend(Mutable, @"    ");
    CFStringAppend(Mutable, (CFStringRef)v12[v23++]);
    if (v23 >= v9) {
      id v24 = @"\n";
    }
    else {
      id v24 = @",\n";
    }
    CFStringAppend(Mutable, v24);
  }

  CFStringAppend(Mutable, i);
  CFStringAppend(Mutable, @""));
  CFRelease(i);
  objc_autoreleasePoolPop(v29);
  id v25 = Mutable;
  _Block_object_dispose(v36, 8);
  free(v21);
  return v25;
}

uint64_t __40__NSArray_descriptionWithLocale_indent___block_invoke(uint64_t a1, void *a2)
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
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  return -[NSArray descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", locale, 0LL);
}

- (NSString)description
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  return -[NSArray descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", 0LL, 0LL);
}

- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  v19[1] = *MEMORY[0x1895F89C0];
  if (!s)
  {
    uint64_t v13 = _os_log_pack_size();
    __int128 v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]");
    goto LABEL_12;
  }

  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    __int128 v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]");
    goto LABEL_12;
  }

  if (!block)
  {
    uint64_t v13 = _os_log_pack_size();
    __int128 v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[NSArray enumerateObjectsAtIndexes:options:usingBlock:]");
LABEL_12:
    uint64_t v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v14,  v13);
    objc_exception_throw(v18);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSEnumerationOptions v11 = opts & 0xEFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v11 = opts;
  }
  uint64_t v12 = v11 | 0x1000000000000000LL;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v11 | 0x1000000000000000LL, s);
  __NSArrayEnumerate(self, (uint64_t)block, v12, s);
}

- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (!block)
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSArray enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[NSArray enumerateObjectsWithOptions:usingBlock:]");
    NSEnumerationOptions v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v9);
    objc_exception_throw(v11);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  if ((opts & 2) != 0) {
    opts &= ~1uLL;
  }
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, opts, 0LL);
  __NSArrayEnumerate(self, (uint64_t)block, opts, 0LL);
}

- (void)enumerateObjectsUsingBlock:(void *)block
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (!block)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSArray enumerateObjectsUsingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[NSArray enumerateObjectsUsingBlock:]");
    uint64_t v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
    objc_exception_throw(v8);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  -[NSArray enumerateObjectsWithOptions:usingBlock:](self, "enumerateObjectsWithOptions:usingBlock:", 0LL, block);
}

- (id)firstObject
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  id result = -[NSArray count](self, "count");
  if (result) {
    return -[NSArray objectAtIndex:](self, "objectAtIndex:", 0LL);
  }
  return result;
}

- (id)firstObjectCommonWithArray:(NSArray *)otherArray
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
    if (!otherArray) {
      goto LABEL_4;
    }
  }

  else if (!otherArray)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSArray((uint64_t)otherArray) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSArray firstObjectCommonWithArray:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSArray firstObjectCommonWithArray:]");
    uint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v19[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v13);
    objc_exception_throw(v15);
    -[NSArray getObjects:range:](v16, v17, v18, v25);
    return result;
  }

- (void)getObjects:(id *)objects range:(NSRange)range
{
  NSUInteger length = range.length;
  uint64_t location = range.location;
  unint64_t v7 = objects;
  v26[1] = *MEMORY[0x1895F89C0];
  if (!objects && range.length)
  {
    uint64_t location = _os_log_pack_size();
    uint64_t v10 = (char *)v26 - ((location + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315394;
    *(void *)(v11 + 4) = "-[NSArray getObjects:range:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v11 + 14) = length;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSArray getObjects:range:]",  length);
LABEL_13:
    uint64_t v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v10,  location);
    objc_exception_throw(v13);
    goto LABEL_14;
  }

  if (range.length >> 61)
  {
    uint64_t location = _os_log_pack_size();
    uint64_t v10 = (char *)v26 - ((location + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[NSArray getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = length;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSArray getObjects:range:]",  length);
    goto LABEL_13;
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) == 0 && v9 >= location + length)
  {
    for (; length; --length)
      *v7++ = -[NSArray objectAtIndex:](self, "objectAtIndex:", location++);
    return;
  }

- (void)getObjects:(id *)objects
{
  v16[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v6 = -[NSArray count](self, "count");
  if (!objects && v6)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = _os_log_pack_size();
    uint64_t v10 = (char *)v16 - ((MEMORY[0x1895F8858](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315394;
    *(void *)(v11 + 4) = "-[NSArray getObjects:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v11 + 14) = v7;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSArray getObjects:]",  v7);
    goto LABEL_9;
  }

  if (v6 >> 61)
  {
    NSUInteger v12 = v6;
    uint64_t v8 = _os_log_pack_size();
    uint64_t v10 = (char *)v16 - ((MEMORY[0x1895F8858](v8, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[NSArray getObjects:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = v12;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSArray getObjects:]",  v12);
LABEL_9:
    uint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v10,  v8);
    objc_exception_throw(v15);
  }

  -[NSArray getObjects:range:](self, "getObjects:range:", objects, 0LL, -[NSArray count](self, "count"));
}

- (unint64_t)hash
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  return -[NSArray count](self, "count");
}

- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v26[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = -[NSArray count](self, "count");
  NSUInteger v10 = v9;
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v9 < location + length)
  {
    if (v9)
    {
      uint64_t v15 = _os_log_pack_size();
      uint64_t v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v19 = _os_log_pack_fill();
      uint64_t v20 = v10 - 1;
      double v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v19,  (uint64_t)"-[NSArray indexOfObject:inRange:]",  location,  length,  v20);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v21,  "-[NSArray indexOfObject:inRange:]",  location,  length,  v20);
    }

    else
    {
      uint64_t v15 = _os_log_pack_size();
      uint64_t v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_3_8_32_8_0_8_0(v17, (uint64_t)"-[NSArray indexOfObject:inRange:]", location, length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v18,  "-[NSArray indexOfObject:inRange:]",  location,  length);
    }

    __int128 v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v16,  v15);
    objc_exception_throw(v22);
    return -[NSArray indexOfObject:](v23, v24, v25);
  }

  else
  {
    if (!length) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v11 = 0LL;
    for (NSUInteger i = location; ; ++i)
    {
      id v13 = -[NSArray objectAtIndex:](self, "objectAtIndex:", i);
      if (v13 == anObject) {
        break;
      }
      ++v11;
      if (!--length) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }

    return v11 + location;
  }

- (NSUInteger)indexOfObject:(id)anObject
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  unint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = v6;
  uint64_t v8 = 0LL;
  uint64_t v9 = *(void *)v15;
  while (2)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = v8 + v7;
    do
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(self);
      }
      if (*(id *)(*((void *)&v14 + 1) + 8 * v10) == anObject || (objc_msgSend(anObject, "isEqual:") & 1) != 0) {
        return v8 + v10;
      }
      ++v10;
    }

    while (v7 != v10);
    unint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
    NSUInteger result = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v8 = v11;
    if (v7) {
      continue;
    }
    break;
  }

  return result;
}

- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject inRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v22[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v15 = v9;
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v16,  (uint64_t)"-[NSArray indexOfObjectIdenticalTo:inRange:]",  location,  length,  --v15);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v17,  "-[NSArray indexOfObjectIdenticalTo:inRange:]",  location,  length,  v15);
    }

    else
    {
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0( v13,  (uint64_t)"-[NSArray indexOfObjectIdenticalTo:inRange:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v14,  "-[NSArray indexOfObjectIdenticalTo:inRange:]",  location,  length);
    }

    uint64_t v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
    objc_exception_throw(v18);
    return -[NSArray indexOfObjectIdenticalTo:](v19, v20, v21);
  }

  else
  {
    if (!length) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    while (-[NSArray objectAtIndex:](self, "objectAtIndex:", location) != anObject)
    {
      ++location;
      if (!--length) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }

    return location;
  }

- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  unint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0LL;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(self);
        }
        if (*(id *)(*((void *)&v14 + 1) + 8 * v10) == anObject) {
          return v8 + v10;
        }
        ++v10;
      }

      while (v7 != v10);
      unint64_t v7 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)indexesOfObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v22[5] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v16 = v9;
      uint64_t v12 = _os_log_pack_size();
      uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v17,  (uint64_t)"-[NSArray indexesOfObject:inRange:]",  location,  length,  --v16);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v18,  "-[NSArray indexesOfObject:inRange:]",  location,  length,  v16);
    }

    else
    {
      uint64_t v12 = _os_log_pack_size();
      uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v14 = _os_log_pack_fill();
      double v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v14, (uint64_t)"-[NSArray indexesOfObject:inRange:]", location, length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v15,  "-[NSArray indexesOfObject:inRange:]",  location,  length);
    }

    uint64_t v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v13,  v12);
    objc_exception_throw(v19);
    return (id)__35__NSArray_indexesOfObject_inRange___block_invoke(v20, v21);
  }

  else
  {
    uint64_t v10 = -[objc_class indexSetWithIndexesInRange:]( __CFLookUpClass("NSIndexSet"),  "indexSetWithIndexesInRange:",  location,  length);
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    void v22[2] = __35__NSArray_indexesOfObject_inRange___block_invoke;
    v22[3] = &unk_1899EABD0;
    v22[4] = a3;
    return -[NSArray indexesOfObjectsAtIndexes:options:passingTest:]( self,  "indexesOfObjectsAtIndexes:options:passingTest:",  v10,  0LL,  v22);
  }

uint64_t __35__NSArray_indexesOfObject_inRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 == a2) {
    return 1LL;
  }
  else {
    return [v2 isEqual:a2];
  }
}

- (id)indexesOfObject:(id)a3
{
  v7[5] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __27__NSArray_indexesOfObject___block_invoke;
  v7[3] = &unk_1899EABD0;
  v7[4] = a3;
  return -[NSArray indexesOfObjectsWithOptions:passingTest:](self, "indexesOfObjectsWithOptions:passingTest:", 0LL, v7);
}

uint64_t __27__NSArray_indexesOfObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 == a2) {
    return 1LL;
  }
  else {
    return [v2 isEqual:a2];
  }
}

- (id)indexesOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v22[5] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v16 = v9;
      uint64_t v12 = _os_log_pack_size();
      uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v17,  (uint64_t)"-[NSArray indexesOfObjectIdenticalTo:inRange:]",  location,  length,  --v16);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v18,  "-[NSArray indexesOfObjectIdenticalTo:inRange:]",  location,  length,  v16);
    }

    else
    {
      uint64_t v12 = _os_log_pack_size();
      uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v14 = _os_log_pack_fill();
      double v15 = __os_log_helper_1_2_3_8_32_8_0_8_0( v14,  (uint64_t)"-[NSArray indexesOfObjectIdenticalTo:inRange:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v15,  "-[NSArray indexesOfObjectIdenticalTo:inRange:]",  location,  length);
    }

    uint64_t v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v13,  v12);
    objc_exception_throw(v19);
    return (id)__46__NSArray_indexesOfObjectIdenticalTo_inRange___block_invoke(v20, v21);
  }

  else
  {
    uint64_t v10 = -[objc_class indexSetWithIndexesInRange:]( __CFLookUpClass("NSIndexSet"),  "indexSetWithIndexesInRange:",  location,  length);
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    void v22[2] = __46__NSArray_indexesOfObjectIdenticalTo_inRange___block_invoke;
    v22[3] = &unk_1899EABD0;
    v22[4] = a3;
    return -[NSArray indexesOfObjectsAtIndexes:options:passingTest:]( self,  "indexesOfObjectsAtIndexes:options:passingTest:",  v10,  0LL,  v22);
  }

BOOL __46__NSArray_indexesOfObjectIdenticalTo_inRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

- (id)indexesOfObjectIdenticalTo:(id)a3
{
  v7[5] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __38__NSArray_indexesOfObjectIdenticalTo___block_invoke;
  v7[3] = &unk_1899EABD0;
  v7[4] = a3;
  return -[NSArray indexesOfObjectsWithOptions:passingTest:](self, "indexesOfObjectsWithOptions:passingTest:", 0LL, v7);
}

BOOL __38__NSArray_indexesOfObjectIdenticalTo___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

- (NSUInteger)indexOfObject:(id)obj inSortedRange:(NSRange)r options:(NSBinarySearchingOptions)opts usingComparator:(NSComparator)cmp
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  if (!obj)
  {
    uint64_t v38 = _os_log_pack_size();
    v39 = (char *)&v54 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v40 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v40 = 136315138;
    *(void *)(v40 + 4) = "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]");
LABEL_58:
    v42 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v39,  v38);
    objc_exception_throw(v42);
    goto LABEL_59;
  }

  if (!cmp)
  {
    uint64_t v38 = _os_log_pack_size();
    v39 = (char *)&v54 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v41 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v41 = 136315138;
    *(void *)(v41 + 4) = "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSArray indexOfObject:inSortedRange:options:usingComparator:]");
    goto LABEL_58;
  }

  NSUInteger length = r.length;
  NSUInteger location = r.location;
  unint64_t v7 = a2;
  unint64_t v6 = (objc_class *)self;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v8, __CFTSANTagMutableArray);
  }
  unint64_t v14 = -[objc_class count](v6, "count");
  if ((location & 0x8000000000000000LL) == 0 && (length & 0x8000000000000000LL) == 0)
  {
    NSUInteger v15 = location + length;
    if (v14 >= location + length)
    {
      NSBinarySearchingOptions v16 = opts & 0x300;
      if (v16 != 768)
      {
        if (length)
        {
          NSBinarySearchingOptions v56 = opts & 0x200;
          if (length < 0x101) {
            goto LABEL_15;
          }
          NSUInteger v17 = v15 - 1;
          uint64_t v18 = (*((uint64_t (**)(NSComparator, uint64_t, id))cmp + 2))( cmp,  -[objc_class objectAtIndex:](v6, "objectAtIndex:", v15 - 1),  obj);
          if (v18 < 0)
          {
            NSUInteger v17 = 0x7FFFFFFFFFFFFFFFLL;
          }

          else if (v18 | opts & 0x100)
          {
            uint64_t v19 = (*((uint64_t (**)(NSComparator, id, uint64_t))cmp + 2))( cmp,  obj,  -[objc_class objectAtIndex:](v6, "objectAtIndex:", location));
            if (v19 < 0)
            {
              NSUInteger v32 = 0x7FFFFFFFFFFFFFFFLL;
            }

            else
            {
              if (v19 | v56)
              {
LABEL_15:
                NSBinarySearchingOptions v55 = opts;
                char v20 = flsl(length);
                uint64_t v21 = 0LL;
                char v22 = 0;
                uint64_t v23 = 2 << v20;
                do
                {
                  if (v23 >= 0) {
                    uint64_t v24 = v23;
                  }
                  else {
                    uint64_t v24 = v23 + 1;
                  }
                  NSUInteger v25 = location + (v24 >> 1);
                  if (v25 < v15)
                  {
                    uint64_t v21 = (*((uint64_t (**)(NSComparator, uint64_t, id))cmp + 2))( cmp,  -[objc_class objectAtIndex:](v6, "objectAtIndex:", location + (v24 >> 1)),  obj);
                    if (!(v21 | v16)) {
                      return v25;
                    }
                    if (v21) {
                      BOOL v26 = 1;
                    }
                    else {
                      BOOL v26 = v56 == 0;
                    }
                    v22 |= v21 == 0;
                    BOOL v27 = !v26 || v21 <= -1;
                    if (v27) {
                      location += v24 >> 1;
                    }
                  }

                  BOOL v27 = v23 <= 1;
                  uint64_t v23 = v24 >> 1;
                }

                while (!v27);
                LODWORD(v28) = v56 != 0;
                if (v21) {
                  LODWORD(v28) = 0;
                }
                if (v21 < 0) {
                  uint64_t v28 = 1LL;
                }
                else {
                  uint64_t v28 = v28;
                }
                NSUInteger v29 = location + v28;
                NSUInteger v30 = location + ((unint64_t)v21 >> 63);
                if ((v22 & 1) == 0) {
                  NSUInteger v30 = 0x7FFFFFFFFFFFFFFFLL;
                }
                if ((v55 & 0x400) != 0) {
                  return v29;
                }
                else {
                  return v30;
                }
              }

              NSUInteger v32 = location;
            }

            BOOL v31 = (opts & 0x400) == 0;
            goto LABEL_43;
          }

          if ((opts & 0x400) != 0) {
            return location + length;
          }
          else {
            return v17;
          }
        }

        BOOL v31 = (opts & 0x400) == 0;
        NSUInteger v32 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_43:
        if (v31) {
          return v32;
        }
        else {
          return location;
        }
      }

- (NSUInteger)indexOfObjectAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (!s)
  {
    uint64_t v14 = _os_log_pack_size();
    NSUInteger v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSArray indexOfObjectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSArray indexOfObjectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }

  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    NSUInteger v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSArray indexOfObjectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSArray indexOfObjectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }

  if (!predicate)
  {
    uint64_t v14 = _os_log_pack_size();
    NSUInteger v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSArray indexOfObjectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSArray indexOfObjectAtIndexes:options:passingTest:]");
LABEL_12:
    uint64_t v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v15,  v14);
    objc_exception_throw(v19);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSEnumerationOptions v11 = opts & 0xCFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v11 = opts;
  }
  uint64_t v12 = v11 | 0x3000000000000000LL;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v11 | 0x3000000000000000LL, s);
  return __NSArrayGetIndexPassingTest(self, (uint64_t)predicate, v12, s);
}

- (NSUInteger)indexOfObjectWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  v15[1] = *MEMORY[0x1895F89C0];
  if (!predicate)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSArray indexOfObjectWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSArray indexOfObjectWithOptions:passingTest:]");
    uint64_t v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v12);
    objc_exception_throw(v14);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSEnumerationOptions v9 = opts & 0xDFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x2000000000000000LL;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x2000000000000000LL, 0LL);
  return __NSArrayGetIndexPassingTest(self, (uint64_t)predicate, v10, 0LL);
}

- (NSUInteger)indexOfObjectPassingTest:(void *)predicate
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!predicate)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSArray indexOfObjectPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSArray indexOfObjectPassingTest:]");
    NSEnumerationOptions v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  return -[NSArray indexOfObjectWithOptions:passingTest:](self, "indexOfObjectWithOptions:passingTest:", 0LL, predicate);
}

- (NSIndexSet)indexesOfObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (!s)
  {
    uint64_t v14 = _os_log_pack_size();
    NSUInteger v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }

  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    NSUInteger v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }

  if (!predicate)
  {
    uint64_t v14 = _os_log_pack_size();
    NSUInteger v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSArray indexesOfObjectsAtIndexes:options:passingTest:]");
LABEL_12:
    uint64_t v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v15,  v14);
    objc_exception_throw(v19);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSEnumerationOptions v11 = opts & 0xAFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v11 = opts;
  }
  uint64_t v12 = v11 | 0x5000000000000000LL;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v11 | 0x5000000000000000LL, s);
  return (NSIndexSet *)__NSArrayGetIndexesPassingTest(self, (uint64_t)predicate, v12, s);
}

- (NSIndexSet)indexesOfObjectsWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  v15[1] = *MEMORY[0x1895F89C0];
  if (!predicate)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSArray indexesOfObjectsWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSArray indexesOfObjectsWithOptions:passingTest:]");
    uint64_t v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v12);
    objc_exception_throw(v14);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSEnumerationOptions v9 = opts & 0xBFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x4000000000000000LL;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x4000000000000000LL, 0LL);
  return (NSIndexSet *)__NSArrayGetIndexesPassingTest(self, (uint64_t)predicate, v10, 0LL);
}

- (NSIndexSet)indexesOfObjectsPassingTest:(void *)predicate
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!predicate)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSArray indexesOfObjectsPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSArray indexesOfObjectsPassingTest:]");
    NSEnumerationOptions v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  return -[NSArray indexesOfObjectsWithOptions:passingTest:]( self,  "indexesOfObjectsWithOptions:passingTest:",  0LL,  predicate);
}

- (BOOL)isEqualToArray:(NSArray *)otherArray
{
  uint64_t v4 = MEMORY[0x1895F8858](self, a2);
  unint64_t v6 = (void *)v5;
  uint64_t v7 = (void *)v4;
  v26[256] = *MEMORY[0x1895F89C0];
  if (v5 && (_NSIsNSArray(v5) & 1) == 0)
  {
    uint64_t v15 = _os_log_pack_size();
    uint64_t v17 = &v25[-((MEMORY[0x1895F8858](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSArray isEqualToArray:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSArray isEqualToArray:]");
    uint64_t v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v17,  v15);
    objc_exception_throw(v19);
    LOBYTE(v8) = -[NSArray isEqual:](v20, v21, v22);
  }

  else
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(v7, v3, __CFTSANTagMutableArray);
    }
    LOBYTE(v8) = v6 == v7;
    if (v6 != v7 && v6)
    {
      unint64_t v9 = [v7 count];
      if ([v6 count] == v9)
      {
        if (v9)
        {
          unint64_t v10 = 0LL;
          if (v9 >= 0x100) {
            uint64_t v11 = 256LL;
          }
          else {
            uint64_t v11 = v9;
          }
          while (1)
          {
            objc_msgSend(v7, "getObjects:range:", v26, v10, v11);
            objc_msgSend(v6, "getObjects:range:", v25, v10, v11);
            if (v11) {
              break;
            }
LABEL_17:
            v10 += v11;
            if (v9 < v10 + v11) {
              uint64_t v11 = v9 - v10;
            }
            if (v9 <= v10) {
              goto LABEL_20;
            }
          }

          uint64_t v12 = (id *)v25;
          uint64_t v13 = (id *)v26;
          uint64_t v14 = v11;
          while (1)
          {
            if (*v13 != *v12)
            {
              int v8 = objc_msgSend(*v13, "isEqual:");
              if (!v8) {
                break;
              }
            }

            ++v12;
            ++v13;
            if (!--v14) {
              goto LABEL_17;
            }
          }
        }

        else
        {
LABEL_20:
          LOBYTE(v8) = 1;
        }
      }

      else
      {
        LOBYTE(v8) = 0;
      }
    }
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }

  else if (a3)
  {
    int v6 = _NSIsNSArray((uint64_t)a3);
    if (v6) {
      LOBYTE(v6) = -[NSArray isEqualToArray:](self, "isEqualToArray:", a3);
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)lastObject
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  id result = -[NSArray count](self, "count");
  if (result) {
    return -[NSArray objectAtIndex:](self, "objectAtIndex:", (char *)result - 1);
  }
  return result;
}

- (void)makeObjectsPerformSelector:(SEL)aSelector
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!aSelector) {
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v6 = -[NSArray count](self, "count");
  if (v6 > 0x80)
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    unint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v18,  v17,  16LL);
    if (v14)
    {
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(self);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) performSelector:aSelector];
        }

        unint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v18,  v17,  16LL);
      }

      while (v14);
    }
  }

  else
  {
    NSUInteger v8 = v6;
    uint64_t v9 = MEMORY[0x1895F8858](v6, v7);
    uint64_t v11 = (void **)&v17[-v10];
    if (v9)
    {
      uint64_t v12 = 0LL;
      do
      {
        v11[v12] = -[NSArray objectAtIndex:](self, "objectAtIndex:", v12);
        ++v12;
      }

      while (v8 != v12);
      for (; v8; --v8)
      {
        uint64_t v13 = *v11++;
        [v13 performSelector:aSelector];
      }
    }
  }

- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!aSelector) {
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v8 = -[NSArray count](self, "count");
  if (v8 > 0x80)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    unint64_t v16 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
    if (v16)
    {
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(self);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * i) performSelector:aSelector withObject:argument];
        }

        unint64_t v16 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
      }

      while (v16);
    }
  }

  else
  {
    NSUInteger v10 = v8;
    uint64_t v11 = MEMORY[0x1895F8858](v8, v9);
    uint64_t v13 = (void **)&v19[-v12];
    if (v11)
    {
      uint64_t v14 = 0LL;
      do
      {
        v13[v14] = -[NSArray objectAtIndex:](self, "objectAtIndex:", v14);
        ++v14;
      }

      while (v10 != v14);
      for (; v10; --v10)
      {
        uint64_t v15 = *v13++;
        [v15 performSelector:aSelector withObject:argument];
      }
    }
  }

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  return -[NSArray objectAtIndex:](self, "objectAtIndex:", idx);
}

- (NSArray)objectsAtIndexes:(NSIndexSet *)indexes
{
  v38[1] = *MEMORY[0x1895F89C0];
  if (!indexes)
  {
    uint64_t v9 = _os_log_pack_size();
    __int128 v20 = (char *)&v36[-1] - ((MEMORY[0x1895F8858](v9, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315138;
    *(void *)(v21 + 4) = "-[NSArray objectsAtIndexes:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSArray objectsAtIndexes:]");
    __int128 v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v20,  v9);
    objc_exception_throw(v22);
LABEL_27:
    __break(1u);
LABEL_28:
    CFStringRef v33 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v9);
    uint64_t v34 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v33,  0LL);
    CFRelease(v33);
    objc_exception_throw(v34);
  }

  if ((_NSIsNSIndexSet() & 1) == 0) {
    goto LABEL_20;
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
LABEL_20:
    uint64_t v9 = _os_log_pack_size();
    uint64_t v24 = (char *)&v36[-1] - ((MEMORY[0x1895F8858](v9, v23) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v25 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v25 = 136315138;
    *(void *)(v25 + 4) = "-[NSArray objectsAtIndexes:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSArray objectsAtIndexes:]");
    BOOL v26 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v24,  v9);
    objc_exception_throw(v26);
    goto LABEL_27;
  }

  NSUInteger v6 = -[NSArray count](self, "count");
  uint64_t v7 = [0 count];
  NSUInteger v8 = -[NSIndexSet lastIndex](indexes, "lastIndex");
  uint64_t v9 = v8;
  if ((v8 & 0x8000000000000000LL) != 0)
  {
    NSUInteger v10 = v7 + v6;
    goto LABEL_23;
  }

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v10 = v7 + v6;
    if (v10 <= v8)
    {
LABEL_23:
      uint64_t v27 = _os_log_pack_size();
      NSUInteger v29 = (char *)&v36[-1] - ((MEMORY[0x1895F8858](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v30 = _os_log_pack_fill();
      if (v10)
      {
        double v32 = __os_log_helper_1_2_3_8_32_8_0_8_0(v30, (uint64_t)"-[NSArray objectsAtIndexes:]", v9, v10 - 1);
        CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu in index set beyond bounds [0 .. %lu]",  v32,  "-[NSArray objectsAtIndexes:]",  v9,  v10 - 1);
      }

      else
      {
        *(_DWORD *)uint64_t v30 = 136315394;
        *(void *)(v30 + 4) = "-[NSArray objectsAtIndexes:]";
        *(_WORD *)(v30 + 12) = 2048;
        *(void *)(v30 + 14) = v9;
        CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu in index set beyond bounds for empty array",  "-[NSArray objectsAtIndexes:]",  v9);
      }

      BOOL v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v29,  v27);
      objc_exception_throw(v31);
      goto LABEL_27;
    }
  }

  unint64_t v11 = -[NSIndexSet count](indexes, "count");
  uint64_t v9 = v11;
  if (v11 >> 60) {
    goto LABEL_28;
  }
  if (v11 <= 1) {
    unint64_t v11 = 1LL;
  }
  uint64_t v12 = (id *)_CFCreateArrayStorage(v11, 0, v38);
  v37[0] = 0LL;
  v37[1] = v37;
  v37[2] = 0x2020000000LL;
  v37[3] = 0LL;
  v36[0] = MEMORY[0x1895F87A8];
  v36[1] = 3221225472LL;
  v36[2] = __28__NSArray_objectsAtIndexes___block_invoke;
  void v36[3] = &unk_1899EABF8;
  v36[5] = v37;
  v36[6] = v12;
  v36[4] = self;
  -[NSIndexSet __forwardEnumerateRanges:](indexes, "__forwardEnumerateRanges:", v36);
  if (v12)
  {
    if (v9)
    {
      uint64_t v13 = v12;
      uint64_t v14 = v9;
      do
      {
        id v15 = *v13++;
        --v14;
      }

      while (v14);
    }

    unint64_t v16 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v12,  v9,  v9);
  }

  else
  {
    unint64_t v16 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", 0LL, v9);
  }

  uint64_t v17 = v16;
  _Block_object_dispose(v37, 8);
  return v17;
}

uint64_t __28__NSArray_objectsAtIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = objc_msgSend( *(id *)(a1 + 32),  "getObjects:range:",  *(void *)(a1 + 48) + 8 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24),  a2,  a3);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += a3;
  return result;
}

- (id)objectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  v18[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSArray objectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSArray objectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }

  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSArray objectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSArray objectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }

  if (!a5)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSArray objectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSArray objectAtIndexes:options:passingTest:]");
LABEL_12:
    uint64_t v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v13,  v12);
    objc_exception_throw(v17);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSUInteger v10 = -[NSArray indexOfObjectAtIndexes:options:passingTest:]( self,  "indexOfObjectAtIndexes:options:passingTest:",  a3,  a4,  a5);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  else {
    return -[NSArray objectAtIndex:](self, "objectAtIndex:", v10);
  }
}

- (id)objectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v13[1] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSArray objectWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSArray objectWithOptions:passingTest:]");
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v10);
    objc_exception_throw(v12);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v8 = -[NSArray indexOfObjectWithOptions:passingTest:](self, "indexOfObjectWithOptions:passingTest:", a3, a4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  else {
    return -[NSArray objectAtIndex:](self, "objectAtIndex:", v8);
  }
}

- (id)objectPassingTest:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSArray objectPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSArray objectPassingTest:]");
    uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  return -[NSArray objectWithOptions:passingTest:](self, "objectWithOptions:passingTest:", 0LL, a3);
}

- (id)objectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSArray objectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSArray objectsAtIndexes:options:passingTest:]");
    goto LABEL_10;
  }

  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSArray objectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSArray objectsAtIndexes:options:passingTest:]");
    goto LABEL_10;
  }

  if (!a5)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSArray objectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSArray objectsAtIndexes:options:passingTest:]");
LABEL_10:
    uint64_t v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
    objc_exception_throw(v16);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  return -[NSArray objectsAtIndexes:]( self,  "objectsAtIndexes:",  -[NSArray indexesOfObjectsAtIndexes:options:passingTest:]( self,  "indexesOfObjectsAtIndexes:options:passingTest:",  a3,  a4,  a5));
}

- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSArray objectsWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSArray objectsWithOptions:passingTest:]");
    uint64_t v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v9);
    objc_exception_throw(v11);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  return -[NSArray objectsAtIndexes:]( self,  "objectsAtIndexes:",  -[NSArray indexesOfObjectsWithOptions:passingTest:](self, "indexesOfObjectsWithOptions:passingTest:", a3, a4));
}

- (id)objectsPassingTest:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSArray objectsPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSArray objectsPassingTest:]");
    uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  return -[NSArray objectsWithOptions:passingTest:](self, "objectsWithOptions:passingTest:", 0LL, a3);
}

- (NSEnumerator)objectEnumerator
{
  return (NSEnumerator *) -[__NSFastEnumerationEnumerator initWithObject:]( objc_alloc(&OBJC_CLASS_____NSFastEnumerationEnumerator),  "initWithObject:",  self);
}

- (NSEnumerator)reverseObjectEnumerator
{
  return (NSEnumerator *) -[__NSArrayReverseEnumerator initWithObject:]( objc_alloc(&OBJC_CLASS_____NSArrayReverseEnumerator),  "initWithObject:",  self);
}

- (id)reversedArray
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  return -[__NSArrayReversed initWithArray:](objc_alloc(&OBJC_CLASS_____NSArrayReversed), "initWithArray:", self);
}

- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  v47[1] = *MEMORY[0x1895F89C0];
  if (!a5)
  {
    unint64_t length = _os_log_pack_size();
    uint64_t v30 = (char *)&v45[-1] - ((MEMORY[0x1895F8858](length, v29) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136315138;
    *(void *)(v31 + 4) = "-[NSArray sortedArrayFromRange:options:usingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSArray sortedArrayFromRange:options:usingComparator:]");
    double v32 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v30,  length);
    objc_exception_throw(v32);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }

  char v8 = a4;
  unint64_t length = a3.length;
  NSUInteger location = a3.location;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v6, __CFTSANTagMutableArray);
  }
  NSUInteger v12 = -[NSArray count](self, "count");
  if (!length) {
    return +[NSArray array](&OBJC_CLASS___NSArray, "array");
  }
  uint64_t v5 = (char *)v12;
  if (!v12) {
    return +[NSArray array](&OBJC_CLASS___NSArray, "array");
  }
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v12 < location + length)
  {
    uint64_t v33 = _os_log_pack_size();
    v35 = (char *)&v45[-1] - ((MEMORY[0x1895F8858](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v36 = _os_log_pack_fill();
    uint64_t v37 = (uint64_t)(v5 - 1);
    uint64_t v5 = "-[NSArray sortedArrayFromRange:options:usingComparator:]";
    double v38 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v36,  (uint64_t)"-[NSArray sortedArrayFromRange:options:usingComparator:]",  location,  length,  v37);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v38,  "-[NSArray sortedArrayFromRange:options:usingComparator:]",  location,  length,  v37);
    v39 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v35,  v33);
    objc_exception_throw(v39);
    goto LABEL_30;
  }

  if (v12 == 1) {
    return self;
  }
  if (length == 1) {
    return +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  -[NSArray objectAtIndex:](self, "objectAtIndex:", location));
  }
  if (length >> 60)
  {
LABEL_31:
    CFStringRef v40 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  length);
    uint64_t v41 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v40,  0LL);
    CFRelease(v40);
    objc_exception_throw(v41);
    uint64_t v43 = v42;
    free(v5);
    free(v41);
    _Unwind_Resume(v43);
  }

  MEMORY[0x1895F8858](v12, v13);
  uint64_t v16 = (char *)&v45[-1] - v15;
  if (length >= 0x101)
  {
    uint64_t v16 = (char *)_CFCreateArrayStorage(length, 0, v47);
    uint64_t v17 = v16;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  __int128 v18 = (id *)_CFCreateArrayStorage(length, 0, &v46);
  uint64_t v19 = -[NSArray getObjects:range:](self, "getObjects:range:", v16, location, length);
  MEMORY[0x1895F8858](v19, v20);
  __int128 v22 = (char *)&v45[-1] - v21;
  uint64_t v23 = (char *)&v45[-1] - v21;
  if (length > 0x1000) {
    uint64_t v23 = (char *)malloc(8 * length);
  }
  v45[0] = MEMORY[0x1895F87A8];
  v45[1] = 3221225472LL;
  v45[2] = __56__NSArray_sortedArrayFromRange_options_usingComparator___block_invoke;
  v45[3] = &unk_189996258;
  v45[4] = a5;
  v45[5] = v16;
  CFSortIndexes((uint64_t)v23, length, v8, (uint64_t)v45);
  for (uint64_t i = 0LL; i != length; ++i)
    v18[i] = *(id *)&v16[8 * *(void *)&v23[8 * i]];
  if (v22 != v23) {
    free(v23);
  }
  if ((uint64_t)length >= 1)
  {
    uint64_t v25 = v18;
    unint64_t v26 = length;
    do
    {
      id v27 = *v25++;
      --v26;
    }

    while (v26);
  }

  id v28 =  -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v18,  length,  length);
  free(v17);
  return v28;
}

uint64_t __56__NSArray_sortedArrayFromRange_options_usingComparator___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(*(void *)(a1 + 40) + 8 * a2),  *(void *)(*(void *)(a1 + 40) + 8 * a3));
}

- (NSArray)sortedArrayWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (!cmptr)
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v11 = (char *)v14 - ((MEMORY[0x1895F8858](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSArray sortedArrayWithOptions:usingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSArray sortedArrayWithOptions:usingComparator:]");
    uint64_t v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v11,  v9);
    objc_exception_throw(v13);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  return (NSArray *)-[NSArray sortedArrayFromRange:options:usingComparator:]( self,  "sortedArrayFromRange:options:usingComparator:",  0LL,  -[NSArray count](self, "count"),  opts,  cmptr);
}

- (NSArray)sortedArrayUsingComparator:(NSComparator)cmptr
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (!cmptr)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v9 = (char *)v12 - ((MEMORY[0x1895F8858](v7, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSArray sortedArrayUsingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSArray sortedArrayUsingComparator:]");
    uint64_t v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v7);
    objc_exception_throw(v11);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  return (NSArray *)-[NSArray sortedArrayFromRange:options:usingComparator:]( self,  "sortedArrayFromRange:options:usingComparator:",  0LL,  -[NSArray count](self, "count"),  0LL,  cmptr);
}

- (NSArray)sortedArrayUsingFunction:(NSInteger (__cdecl *)comparator context:
{
  v10[6] = *MEMORY[0x1895F89C0];
  if (!comparator)
  {
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: function pointer cannot be NULL",  context,  "-[NSArray sortedArrayUsingFunction:context:]");
    uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  void v10[2] = __44__NSArray_sortedArrayUsingFunction_context___block_invoke;
  v10[3] = &__block_descriptor_48_e11_q24__0_8_16l;
  v10[4] = comparator;
  v10[5] = context;
  return -[NSArray sortedArrayWithOptions:usingComparator:](self, "sortedArrayWithOptions:usingComparator:", 0LL, v10);
}

uint64_t __44__NSArray_sortedArrayUsingFunction_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

- (NSArray)sortedArrayUsingSelector:(SEL)comparator
{
  v7[5] = *MEMORY[0x1895F89C0];
  if (!comparator) {
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__NSArray_sortedArrayUsingSelector___block_invoke;
  v7[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v7[4] = comparator;
  return -[NSArray sortedArrayWithOptions:usingComparator:](self, "sortedArrayWithOptions:usingComparator:", 0LL, v7);
}

id __36__NSArray_sortedArrayUsingSelector___block_invoke(uint64_t a1, id a2)
{
  return [a2 *(SEL *)(a1 + 32)];
}

- (NSArray)subarrayWithRange:(NSRange)range
{
  unint64_t length = range.length;
  NSUInteger location = range.location;
  v26[1] = *MEMORY[0x1895F89C0];
  NSUInteger v7 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v7 < location + length)
  {
    if (!v7)
    {
      uint64_t v13 = _os_log_pack_size();
      uint64_t v15 = (char *)v26 - ((MEMORY[0x1895F8858](v13, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[NSArray subarrayWithRange:]", location, length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v17,  "-[NSArray subarrayWithRange:]",  location,  length);
      __int128 v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v15,  v13);
      objc_exception_throw(v18);
LABEL_19:
      __break(1u);
      return result;
    }

+ (NSArray)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSArray == a1) {
    return (NSArray *)__NSArrayImmutablePlaceholder();
  }
  if (&OBJC_CLASS___NSMutableArray == a1) {
    return (NSArray *)__NSArrayMutablePlaceholder();
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSArray;
  return (NSArray *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSArray)initWithArray:(NSArray *)array
{
  return -[NSArray initWithArray:range:copyItems:]( self,  "initWithArray:range:copyItems:",  array,  0LL,  -[NSArray count](array, "count"),  0LL);
}

- (NSArray)initWithArray:(NSArray *)array copyItems:(BOOL)flag
{
  return -[NSArray initWithArray:range:copyItems:]( self,  "initWithArray:range:copyItems:",  array,  0LL,  -[NSArray count](array, "count"),  flag);
}

- (NSArray)initWithArray:(id)a3 range:(_NSRange)a4
{
  return -[NSArray initWithArray:range:copyItems:]( self,  "initWithArray:range:copyItems:",  a3,  a4.location,  a4.length,  0LL);
}

- (NSArray)initWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v43[1] = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v34 = _os_log_pack_size();
    uint64_t v36 = (char *)v43 - ((MEMORY[0x1895F8858](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v37 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v37 = 136315138;
    *(void *)(v37 + 4) = "-[NSArray initWithArray:range:copyItems:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSArray initWithArray:range:copyItems:]");
    double v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v36,  v34);
    objc_exception_throw(v38);
LABEL_35:
    __break(1u);
    return result;
  }

  unint64_t v10 = [a3 count];
  unint64_t v12 = v10;
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v10 < location + length)
  {
    if (v10)
    {
      uint64_t v26 = _os_log_pack_size();
      id v28 = (char *)v43 - ((MEMORY[0x1895F8858](v26, v39) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v40 = _os_log_pack_fill();
      uint64_t v41 = v12 - 1;
      double v42 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v40,  (uint64_t)"-[NSArray initWithArray:range:copyItems:]",  location,  length,  v41);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v42,  "-[NSArray initWithArray:range:copyItems:]",  location,  length,  v41);
    }

    else
    {
      uint64_t v26 = _os_log_pack_size();
      id v28 = (char *)v43 - ((MEMORY[0x1895F8858](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v29 = _os_log_pack_fill();
      double v30 = __os_log_helper_1_2_3_8_32_8_0_8_0( v29,  (uint64_t)"-[NSArray initWithArray:range:copyItems:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v30,  "-[NSArray initWithArray:range:copyItems:]",  location,  length);
    }

    uint64_t v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v28,  v26);
    objc_exception_throw(v31);
    goto LABEL_35;
  }

  if (length >> 60)
  {
    CFStringRef v32 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  length);
    uint64_t v33 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v32,  0LL);
    CFRelease(v32);
    objc_exception_throw(v33);
  }

  if (length <= 1) {
    uint64_t v13 = 1LL;
  }
  else {
    uint64_t v13 = length;
  }
  unint64_t v14 = MEMORY[0x1895F8858](v13, v11);
  uint64_t v16 = (id *)((char *)v43 - v15);
  if (length >= 0x101)
  {
    uint64_t v16 = (id *)_CFCreateArrayStorage(v14, 0, v43);
    double v17 = v16;
  }

  else
  {
    double v17 = 0LL;
  }

  objc_msgSend(a3, "getObjects:range:", v16, location, length);
  if (!length) {
    BOOL v5 = 0;
  }
  if (v5)
  {
    __int128 v18 = v16;
    NSUInteger v19 = length;
    do
    {
      *__int128 v18 = (id)[*v18 copyWithZone:0];
      ++v18;
      --v19;
    }

    while (v19);
  }

  if (v17)
  {
    if (length)
    {
      NSUInteger v20 = length;
      uint64_t v21 = v17;
      do
      {
        ++v21;
        --v20;
      }

      while (v20);
    }

    uint64_t v23 = -[NSArray _initByAdoptingBuffer:count:size:](self, "_initByAdoptingBuffer:count:size:", v17, length, length);
  }

  else
  {
    uint64_t v23 = -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v16, length);
  }

  double v24 = v23;
  if (v5)
  {
    do
    {

      --length;
    }

    while (length);
  }

  return v24;
}

- (NSArray)initWithObject:(id)a3
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = a3;
  return -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v4, 1LL);
}

- (NSArray)initWithObjects:(id)firstObj
{
  v21[1] = *(id *)MEMORY[0x1895F89C0];
  v21[0] = firstObj;
  BOOL v5 = __NSArrayImmutablePlaceholder();
  if (!firstObj) {
    goto LABEL_7;
  }
  unint64_t v7 = 0LL;
  va_copy(v20, va);
  do
  {
    uint64_t v8 = v20;
    v20 += 8;
    ++v7;
  }

  while (*v8);
  if (v5 == (__objc2_class **)self)
  {
    va_copy(v20, va);
    return (NSArray *)__NSArrayI_new(v21, (uint64_t *)va, v7, 0);
  }

  if (v7 >> 60)
  {
    self = (NSArray *)CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v7);
    uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  self,  0LL);
    CFRelease(self);
    objc_exception_throw(v9);
    __break(1u);
LABEL_7:
    if (v5 == (__objc2_class **)self) {
      return (NSArray *)&__NSArray0__struct;
    }
    unint64_t v7 = 0LL;
  }

  if (v7 <= 1) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = v7;
  }
  unint64_t v11 = MEMORY[0x1895F8858](v10, v6);
  uint64_t v13 = (size_t *)((char *)&v19 - v12);
  if (v7 >= 0x101)
  {
    uint64_t v13 = _CFCreateArrayStorage(v11, 0, &v19);
    va_copy(v20, va);
    void *v13 = firstObj;
    unint64_t v14 = v13;
  }

  else
  {
    unint64_t v14 = 0LL;
    if (!v7) {
      goto LABEL_19;
    }
    va_copy(v20, va);
    void *v13 = firstObj;
    if (v7 == 1) {
      goto LABEL_19;
    }
  }

  for (uint64_t i = 1LL; i != v7; ++i)
  {
    uint64_t v16 = v20;
    v20 += 8;
    v13[i] = *v16;
  }

- (NSArray)initWithSet:(id)a3 copyItems:(BOOL)a4
{
  BOOL v4 = a4;
  v29[1] = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v24 = _os_log_pack_size();
    uint64_t v26 = (char *)v29 - ((MEMORY[0x1895F8858](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136315138;
    *(void *)(v27 + 4) = "-[NSArray initWithSet:copyItems:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSArray initWithSet:copyItems:]");
    id v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v26,  v24);
    objc_exception_throw(v28);
    __break(1u);
  }

  else
  {
    unint64_t v7 = [a3 count];
    unint64_t v9 = v7;
    if (v7 >> 60)
    {
      CFStringRef v22 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v7);
      uint64_t v23 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v22,  0LL);
      CFRelease(v22);
      objc_exception_throw(v23);
    }

    if (v7 <= 1) {
      unint64_t v7 = 1LL;
    }
    unint64_t v10 = MEMORY[0x1895F8858](v7, v8);
    uint64_t v12 = (id *)((char *)v29 - v11);
    if (v9 >= 0x101)
    {
      uint64_t v12 = (id *)_CFCreateArrayStorage(v10, 0, v29);
      uint64_t v13 = v12;
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    [a3 getObjects:v12 count:v9];
    if (!v9) {
      BOOL v4 = 0;
    }
    if (v4)
    {
      unint64_t v14 = v12;
      unint64_t v15 = v9;
      do
      {
        *unint64_t v14 = (id)[*v14 copyWithZone:0];
        ++v14;
        --v15;
      }

      while (v15);
    }

    if (v13)
    {
      if (v9)
      {
        unint64_t v16 = v9;
        double v17 = v13;
        do
        {
          ++v17;
          --v16;
        }

        while (v16);
      }

      size_t v19 = -[NSArray _initByAdoptingBuffer:count:size:](self, "_initByAdoptingBuffer:count:size:", v13, v9, v9);
    }

    else
    {
      size_t v19 = -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v12, v9);
    }

    va_list v20 = v19;
    if (v4)
    {
      do
      {

        --v9;
      }

      while (v9);
    }

    return v20;
  }

  return result;
}

- (NSArray)initWithSet:(id)a3
{
  return -[NSArray initWithSet:copyItems:](self, "initWithSet:copyItems:", a3, 0LL);
}

- (NSArray)initWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v43[1] = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v34 = _os_log_pack_size();
    uint64_t v36 = (char *)v43 - ((MEMORY[0x1895F8858](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v37 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v37 = 136315138;
    *(void *)(v37 + 4) = "-[NSArray initWithOrderedSet:range:copyItems:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSArray initWithOrderedSet:range:copyItems:]");
    double v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v36,  v34);
    objc_exception_throw(v38);
LABEL_35:
    __break(1u);
    return result;
  }

  unint64_t v10 = [a3 count];
  unint64_t v12 = v10;
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v10 < location + length)
  {
    if (v10)
    {
      uint64_t v26 = _os_log_pack_size();
      id v28 = (char *)v43 - ((MEMORY[0x1895F8858](v26, v39) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v40 = _os_log_pack_fill();
      uint64_t v41 = v12 - 1;
      double v42 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v40,  (uint64_t)"-[NSArray initWithOrderedSet:range:copyItems:]",  location,  length,  v41);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v42,  "-[NSArray initWithOrderedSet:range:copyItems:]",  location,  length,  v41);
    }

    else
    {
      uint64_t v26 = _os_log_pack_size();
      id v28 = (char *)v43 - ((MEMORY[0x1895F8858](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v29 = _os_log_pack_fill();
      double v30 = __os_log_helper_1_2_3_8_32_8_0_8_0( v29,  (uint64_t)"-[NSArray initWithOrderedSet:range:copyItems:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v30,  "-[NSArray initWithOrderedSet:range:copyItems:]",  location,  length);
    }

    uint64_t v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v28,  v26);
    objc_exception_throw(v31);
    goto LABEL_35;
  }

  if (length >> 60)
  {
    CFStringRef v32 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  length);
    uint64_t v33 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v32,  0LL);
    CFRelease(v32);
    objc_exception_throw(v33);
  }

  if (length <= 1) {
    uint64_t v13 = 1LL;
  }
  else {
    uint64_t v13 = length;
  }
  unint64_t v14 = MEMORY[0x1895F8858](v13, v11);
  unint64_t v16 = (id *)((char *)v43 - v15);
  if (length >= 0x101)
  {
    unint64_t v16 = (id *)_CFCreateArrayStorage(v14, 0, v43);
    double v17 = v16;
  }

  else
  {
    double v17 = 0LL;
  }

  objc_msgSend(a3, "getObjects:range:", v16, location, length);
  if (!length) {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v18 = v16;
    NSUInteger v19 = length;
    do
    {
      *id v18 = (id)[*v18 copyWithZone:0];
      ++v18;
      --v19;
    }

    while (v19);
  }

  if (v17)
  {
    if (length)
    {
      NSUInteger v20 = length;
      uint64_t v21 = v17;
      do
      {
        ++v21;
        --v20;
      }

      while (v20);
    }

    uint64_t v23 = -[NSArray _initByAdoptingBuffer:count:size:](self, "_initByAdoptingBuffer:count:size:", v17, length, length);
  }

  else
  {
    uint64_t v23 = -[NSArray initWithObjects:count:](self, "initWithObjects:count:", v16, length);
  }

  uint64_t v24 = v23;
  if (v5)
  {
    do
    {

      --length;
    }

    while (length);
  }

  return v24;
}

- (NSArray)initWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return -[NSArray initWithOrderedSet:range:copyItems:]( self,  "initWithOrderedSet:range:copyItems:",  a3,  a4.location,  a4.length,  0LL);
}

- (NSArray)initWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  return -[NSArray initWithOrderedSet:range:copyItems:]( self,  "initWithOrderedSet:range:copyItems:",  a3,  0,  [a3 count],  a4);
}

- (NSArray)initWithOrderedSet:(id)a3
{
  return -[NSArray initWithOrderedSet:range:copyItems:]( self,  "initWithOrderedSet:range:copyItems:",  a3,  0,  [a3 count],  0);
}

- (id)_initByAdoptingBuffer:(id *)a3 count:(unint64_t)a4 size:(unint64_t)a5
{
  unint64_t v5 = a4;
  unint64_t v7 = -[NSArray initWithObjects:count:](self, "initWithObjects:count:", a3, a4, a5);
  if (v5)
  {
    uint64_t v8 = a3;
    do
    {
      unint64_t v9 = *v8++;

      --v5;
    }

    while (v5);
  }

  free(a3);
  return v7;
}

+ (NSArray)arrayWithObject:(id)anObject
{
  return (NSArray *)(id)__createArray(objc_alloc((Class)a1), (uint64_t)anObject);
}

+ (NSArray)arrayWithObjects:(id *)objects count:(NSUInteger)cnt
{
  return (NSArray *)(id)[objc_alloc((Class)a1) initWithObjects:objects count:cnt];
}

+ (NSArray)array
{
  return (NSArray *)(id)[objc_alloc((Class)a1) initWithObjects:0 count:0];
}

+ (id)newArrayWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4) {
    goto LABEL_19;
  }
  if (a4 >> 61)
  {
    uint64_t v9 = _os_log_pack_size();
    unint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "+[NSArray newArrayWithObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "+[NSArray newArrayWithObjects:count:]",  a4);
    goto LABEL_18;
  }

  if (a4)
  {
    uint64_t v5 = 0LL;
    while (a3[v5])
    {
      if (a4 == ++v5) {
        goto LABEL_8;
      }
    }

    uint64_t v8 = v5;
    uint64_t v9 = _os_log_pack_size();
    unint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315394;
    *(void *)(v11 + 4) = "+[NSArray newArrayWithObjects:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v11 + 14) = v8;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: attempt to insert nil object from objects[%lu]",  "+[NSArray newArrayWithObjects:count:]",  v8);
    while (1)
    {
LABEL_18:
      unint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v10,  v9);
      objc_exception_throw(v12);
LABEL_19:
      unint64_t v13 = a4;
      uint64_t v9 = _os_log_pack_size();
      unint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v14 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v14 = 136315394;
      *(void *)(v14 + 4) = "+[NSArray newArrayWithObjects:count:]";
      *(_WORD *)(v14 + 12) = 2048;
      *(void *)(v14 + 14) = v13;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "+[NSArray newArrayWithObjects:count:]",  v13);
    }
  }

+ (NSArray)arrayWithObjects:(id)firstObj
{
  BOOL v4 = (NSException *)a1;
  v21[1] = *(id *)MEMORY[0x1895F89C0];
  v21[0] = firstObj;
  uint64_t v5 = &OBJC_CLASS_____NSPlaceholderArray;
  if (!firstObj) {
    goto LABEL_7;
  }
  unint64_t v6 = 0LL;
  va_copy(v20, va);
  do
  {
    unint64_t v7 = v20;
    v20 += 8;
    ++v6;
  }

  while (*v7);
  if (&OBJC_CLASS_____NSPlaceholderArray == a1)
  {
    va_copy(v20, va);
    uint64_t v16 = (NSArray *)__NSArrayI_new(v21, (uint64_t *)va, v6, 0);
    goto LABEL_21;
  }

  if (v6 >> 60)
  {
    CFStringRef v8 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v6);
    BOOL v4 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v8,  0LL);
    CFRelease(v8);
    objc_exception_throw(v4);
    __break(1u);
LABEL_7:
    if (v5 == (__objc2_class *)v4) {
      return (NSArray *)&__NSArray0__struct;
    }
    unint64_t v6 = 0LL;
  }

  if (v6 <= 1) {
    uint64_t v9 = 1LL;
  }
  else {
    uint64_t v9 = v6;
  }
  unint64_t v10 = MEMORY[0x1895F8858](v9, a2);
  unint64_t v12 = (size_t *)((char *)&v19 - v11);
  if (v6 >= 0x101)
  {
    unint64_t v12 = _CFCreateArrayStorage(v10, 0, &v19);
    va_copy(v20, va);
    *unint64_t v12 = firstObj;
    unint64_t v13 = v12;
  }

  else
  {
    unint64_t v13 = 0LL;
    if (!v6) {
      goto LABEL_19;
    }
    va_copy(v20, va);
    *unint64_t v12 = firstObj;
    if (v6 == 1) {
      goto LABEL_19;
    }
  }

  for (uint64_t i = 1LL; i != v6; ++i)
  {
    uint64_t v15 = v20;
    v20 += 8;
    v12[i] = *v15;
  }

+ (NSArray)arrayWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  return (NSArray *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithArray:range:copyItems:",  a3,  a4.location,  a4.length,  a5);
}

+ (NSArray)arrayWithArray:(id)a3 range:(_NSRange)a4
{
  return (NSArray *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithArray:range:copyItems:",  a3,  a4.location,  a4.length,  0);
}

+ (NSArray)arrayWithArray:(id)a3 copyItems:(BOOL)a4
{
  return (NSArray *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithArray:range:copyItems:",  a3,  0,  objc_msgSend(a3, "count"),  a4);
}

+ (NSArray)arrayWithArray:(NSArray *)array
{
  return (NSArray *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithArray:range:copyItems:",  array,  0,  -[NSArray count](array, "count"),  0);
}

+ (NSArray)arrayWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  return (NSArray *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithOrderedSet:range:copyItems:",  a3,  a4.location,  a4.length,  a5);
}

+ (NSArray)arrayWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return (NSArray *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithOrderedSet:range:copyItems:",  a3,  a4.location,  a4.length,  0);
}

+ (NSArray)arrayWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  return (NSArray *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithOrderedSet:range:copyItems:",  a3,  0,  objc_msgSend(a3, "count"),  a4);
}

+ (NSArray)arrayWithOrderedSet:(id)a3
{
  return (NSArray *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithOrderedSet:range:copyItems:",  a3,  0,  objc_msgSend(a3, "count"),  0);
}

+ (NSArray)arrayWithSet:(id)a3 copyItems:(BOOL)a4
{
  return (NSArray *)(id)[objc_alloc((Class)a1) initWithSet:a3 copyItems:a4];
}

+ (NSArray)arrayWithSet:(id)a3
{
  return (NSArray *)(id)[objc_alloc((Class)a1) initWithSet:a3 copyItems:0];
}

- (NSArray)arrayByAddingObject:(id)anObject
{
  v21[1] = *MEMORY[0x1895F89C0];
  if (!anObject)
  {
    uint64_t v15 = _os_log_pack_size();
    unint64_t v7 = (char *)v21 - ((MEMORY[0x1895F8858](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSArray arrayByAddingObject:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSArray arrayByAddingObject:]");
    id v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v7,  v15);
    objc_exception_throw(v18);
    __break(1u);
    goto LABEL_13;
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v6 = -[NSArray count](self, "count");
  unint64_t v7 = (char *)(v6 + 1);
  if ((v6 + 1) >> 60)
  {
LABEL_13:
    CFStringRef v19 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v7);
    va_list v20 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v19,  0LL);
    CFRelease(v19);
    objc_exception_throw(v20);
  }

  unint64_t v8 = v6;
  else {
    unint64_t v9 = v6 + 1;
  }
  unint64_t v10 = (id *)_CFCreateArrayStorage(v9, 0, v21);
  -[NSArray getObjects:range:](self, "getObjects:range:", v10, 0LL, v8);
  v10[v8] = anObject;
  if (v8 <= 0x7FFFFFFFFFFFFFFELL)
  {
    uint64_t v11 = v10;
    unint64_t v12 = v7;
    do
    {
      id v13 = *v11++;
      --v12;
    }

    while (v12);
  }

  return (NSArray *) -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v10,  v7,  v7);
}

- (NSArray)arrayByAddingObjectsFromArray:(NSArray *)otherArray
{
  v26[1] = *MEMORY[0x1895F89C0];
  if (otherArray && (_NSIsNSArray((uint64_t)otherArray) & 1) == 0)
  {
    unint64_t v9 = _os_log_pack_size();
    CFStringRef v19 = (char *)v26 - ((MEMORY[0x1895F8858](v9, v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSArray arrayByAddingObjectsFromArray:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSArray arrayByAddingObjectsFromArray:]");
    uint64_t v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v19,  v9);
    objc_exception_throw(v21);
    __break(1u);
    goto LABEL_21;
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v6 = -[NSArray count](otherArray, "count");
  if (!v6) {
    return self;
  }
  NSUInteger v7 = v6;
  NSUInteger v8 = -[NSArray count](self, "count");
  unint64_t v9 = v8 + v7;
  if ((v8 + v7) >> 60)
  {
LABEL_21:
    CFStringRef v22 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v9);
    uint64_t v23 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v22,  0LL);
    CFRelease(v22);
    objc_exception_throw(v23);
    uint64_t v25 = v24;
    free(0LL);
    _Unwind_Resume(v25);
  }

  NSUInteger v10 = v8;
  if (v9 <= 1) {
    unint64_t v11 = 1LL;
  }
  else {
    unint64_t v11 = v8 + v7;
  }
  unint64_t v12 = (id *)_CFCreateArrayStorage(v11, 0, v26);
  if (v10) {
    -[NSArray getObjects:range:](self, "getObjects:range:", v12, 0LL, v10);
  }
  -[NSArray getObjects:range:](otherArray, "getObjects:range:", &v12[v10], 0LL, v7);
  if (v12)
  {
    if (v9)
    {
      id v13 = v12;
      unint64_t v14 = v9;
      do
      {
        id v15 = *v13++;
        --v14;
      }

      while (v14);
    }

    uint64_t v16 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v12,  v9,  v9);
  }

  else
  {
    uint64_t v16 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", 0LL, v9);
  }

  return v16;
}

- (id)arrayByApplyingSelector:(SEL)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (!a3) {
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v6 = -[NSArray count](self, "count");
  if (v6 >> 60)
  {
    CFStringRef v22 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v6);
    uint64_t v23 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v22,  0LL);
    CFRelease(v22);
    objc_exception_throw(v23);
  }

  if (v6 <= 1) {
    NSUInteger v6 = 1LL;
  }
  unint64_t v8 = MEMORY[0x1895F8858](v6, v7);
  NSUInteger v10 = (char *)&v24 - v9;
  if (v11 >= 0x101)
  {
    NSUInteger v10 = (char *)_CFCreateArrayStorage(v8, 0, &v25);
    unint64_t v12 = v10;
  }

  else
  {
    unint64_t v12 = 0LL;
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v13 = 0LL;
  unint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v27,  v26,  16LL);
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(self);
        }
        uint64_t v17 = [*(id *)(*((void *)&v27 + 1) + 8 * i) performSelector:a3];
        if (v17) {
          *(void *)&v10[8 * v13++] = v17;
        }
      }

      unint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v27,  v26,  16LL);
    }

    while (v14);
    if (v12)
    {
      if (v13 >= 1)
      {
        for (uint64_t j = 0LL; j != v13; ++j)
          id v19 = *(id *)&v12[8 * j];
      }

      goto LABEL_26;
    }

- (id)arrayByExcludingObjectsInArray:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (!a3 || (_NSIsNSArray((uint64_t)a3) & 1) != 0)
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
    }
    NSUInteger v6 = -[NSArray count](self, "count");
    if (v6 >> 60)
    {
      CFStringRef v23 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v6);
      uint64_t v24 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v23,  0LL);
      CFRelease(v23);
      objc_exception_throw(v24);
    }

    if (v6 <= 1) {
      NSUInteger v6 = 1LL;
    }
    unint64_t v8 = MEMORY[0x1895F8858](v6, v7);
    NSUInteger v10 = (char *)&v30 - v9;
    if (v11 >= 0x101)
    {
      NSUInteger v10 = (char *)_CFCreateArrayStorage(v8, 0, &v31);
      unint64_t v12 = v10;
    }

    else
    {
      unint64_t v12 = 0LL;
    }

    uint64_t v13 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", a3);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    uint64_t v14 = 0LL;
    unint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v33,  v32,  16LL);
    if (v15)
    {
      uint64_t v16 = *(void *)v34;
      do
      {
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(self);
          }
          uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          if (!-[NSSet containsObject:](v13, "containsObject:", v18)) {
            *(void *)&v10[8 * v14++] = v18;
          }
        }

        unint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v33,  v32,  16LL);
      }

      while (v15);
      if (v12)
      {
        if (v14 >= 1)
        {
          for (uint64_t j = 0LL; j != v14; ++j)
            id v20 = *(id *)&v12[8 * j];
        }

        goto LABEL_26;
      }
    }

    else if (v12)
    {
LABEL_26:
      uint64_t v21 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v12,  v14,  v14);
      return v21;
    }

    uint64_t v21 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", v10, v14);
    return v21;
  }

  uint64_t v25 = _os_log_pack_size();
  __int128 v27 = (char *)&v30 - ((MEMORY[0x1895F8858](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v28 = 136315138;
  *(void *)(v28 + 4) = "-[NSArray arrayByExcludingObjectsInArray:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSArray arrayByExcludingObjectsInArray:]");
  __int128 v29 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v27,  v25);
  objc_exception_throw(v29);
  __break(1u);
  return result;
}

- (id)arrayByExcludingToObjectsInArray:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  if (!a3 || (_NSIsNSArray((uint64_t)a3) & 1) != 0)
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
    }
    NSUInteger v6 = -[NSArray count](self, "count");
    if (v6 >> 60)
    {
      CFStringRef v23 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v6);
      uint64_t v24 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v23,  0LL);
      CFRelease(v23);
      objc_exception_throw(v24);
    }

    if (v6 <= 1) {
      NSUInteger v6 = 1LL;
    }
    unint64_t v8 = MEMORY[0x1895F8858](v6, v7);
    NSUInteger v10 = (char *)&v30 - v9;
    if (v11 >= 0x101)
    {
      NSUInteger v10 = (char *)_CFCreateArrayStorage(v8, 0, &v31);
      unint64_t v12 = v10;
    }

    else
    {
      unint64_t v12 = 0LL;
    }

    uint64_t v13 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", a3);
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    uint64_t v14 = 0LL;
    unint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v33,  v32,  16LL);
    if (v15)
    {
      uint64_t v16 = *(void *)v34;
      do
      {
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(self);
          }
          uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          if (-[NSSet containsObject:](v13, "containsObject:", v18)) {
            *(void *)&v10[8 * v14++] = v18;
          }
        }

        unint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v33,  v32,  16LL);
      }

      while (v15);
      if (v12)
      {
        if (v14 >= 1)
        {
          for (uint64_t j = 0LL; j != v14; ++j)
            id v20 = *(id *)&v12[8 * j];
        }

        goto LABEL_26;
      }
    }

    else if (v12)
    {
LABEL_26:
      uint64_t v21 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v12,  v14,  v14);
      return v21;
    }

    uint64_t v21 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", v10, v14);
    return v21;
  }

  uint64_t v25 = _os_log_pack_size();
  __int128 v27 = (char *)&v30 - ((MEMORY[0x1895F8858](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v28 = 136315138;
  *(void *)(v28 + 4) = "-[NSArray arrayByExcludingToObjectsInArray:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSArray arrayByExcludingToObjectsInArray:]");
  __int128 v29 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v27,  v25);
  objc_exception_throw(v29);
  __break(1u);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  return -[NSArray initWithArray:range:copyItems:]( +[NSArray allocWithZone:](&OBJC_CLASS___NSArray, "allocWithZone:", a3),  "initWithArray:range:copyItems:",  self,  0LL,  -[NSArray count](self, "count"),  __NSCollectionsShouldCopy());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  return -[NSArray initWithArray:range:copyItems:]( +[NSArray allocWithZone:](&OBJC_CLASS___NSMutableArray, "allocWithZone:", a3),  "initWithArray:range:copyItems:",  self,  0LL,  -[NSArray count](self, "count"),  0LL);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)initWithCoder:(NSCoder *)aDecoder
{
  return 0LL;
}

- (NSUInteger)count
{
  uint64_t v2 = __CFLookUpClass("NSArray");
  OUTLINED_FUNCTION_0_14(v2);
  OUTLINED_FUNCTION_1_9();
  return result;
}

- (id)objectAtIndex:(NSUInteger)index
{
  uint64_t v3 = __CFLookUpClass("NSArray");
  OUTLINED_FUNCTION_0_14(v3);
  OUTLINED_FUNCTION_1_9();
  return result;
}

- (NSArray)initWithObjects:(id *)objects count:(NSUInteger)cnt
{
  BOOL v4 = __CFLookUpClass("NSArray");
  OUTLINED_FUNCTION_0_14(v4);
  OUTLINED_FUNCTION_1_9();
  return result;
}

@end