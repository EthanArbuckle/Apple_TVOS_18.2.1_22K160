@interface NSOrderedSet
+ (BOOL)supportsSecureCoding;
+ (NSOrderedSet)allocWithZone:(_NSZone *)a3;
+ (NSOrderedSet)orderedSet;
+ (NSOrderedSet)orderedSetWithArray:(NSArray *)array;
+ (NSOrderedSet)orderedSetWithArray:(NSArray *)array range:(NSRange)range copyItems:(BOOL)flag;
+ (NSOrderedSet)orderedSetWithArray:(id)a3 copyItems:(BOOL)a4;
+ (NSOrderedSet)orderedSetWithArray:(id)a3 range:(_NSRange)a4;
+ (NSOrderedSet)orderedSetWithObject:(id)object;
+ (NSOrderedSet)orderedSetWithObjects:(id *)objects count:(NSUInteger)cnt;
+ (NSOrderedSet)orderedSetWithObjects:(id)firstObj;
+ (NSOrderedSet)orderedSetWithOrderedSet:(NSOrderedSet *)set;
+ (NSOrderedSet)orderedSetWithOrderedSet:(NSOrderedSet *)set range:(NSRange)range copyItems:(BOOL)flag;
+ (NSOrderedSet)orderedSetWithOrderedSet:(id)a3 copyItems:(BOOL)a4;
+ (NSOrderedSet)orderedSetWithOrderedSet:(id)a3 range:(_NSRange)a4;
+ (NSOrderedSet)orderedSetWithSet:(NSSet *)set;
+ (NSOrderedSet)orderedSetWithSet:(NSSet *)set copyItems:(BOOL)flag;
+ (id)newOrderedSetWithObjects:(const void *)a3 count:(unint64_t)a4;
- (BOOL)containsObject:(id)a3 inRange:(_NSRange)a4;
- (BOOL)containsObject:(id)object;
- (BOOL)intersectsOrderedSet:(NSOrderedSet *)other;
- (BOOL)intersectsSet:(NSSet *)set;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOrderedSet:(NSOrderedSet *)other;
- (BOOL)isNSOrderedSet__;
- (BOOL)isSubsetOfOrderedSet:(NSOrderedSet *)other;
- (BOOL)isSubsetOfSet:(NSSet *)set;
- (NSArray)array;
- (NSArray)objectsAtIndexes:(NSIndexSet *)indexes;
- (NSArray)sortedArrayUsingComparator:(NSComparator)cmptr;
- (NSArray)sortedArrayWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
- (NSEnumerator)objectEnumerator;
- (NSEnumerator)reverseObjectEnumerator;
- (NSIndexSet)indexesOfObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSIndexSet)indexesOfObjectsPassingTest:(void *)predicate;
- (NSIndexSet)indexesOfObjectsWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSOrderedSet)initWithArray:(NSArray *)array;
- (NSOrderedSet)initWithArray:(NSArray *)set copyItems:(BOOL)flag;
- (NSOrderedSet)initWithArray:(NSArray *)set range:(NSRange)range copyItems:(BOOL)flag;
- (NSOrderedSet)initWithArray:(id)a3 range:(_NSRange)a4;
- (NSOrderedSet)initWithCoder:(NSCoder *)aDecoder;
- (NSOrderedSet)initWithObject:(id)object;
- (NSOrderedSet)initWithObjects:(id *)objects count:(NSUInteger)cnt;
- (NSOrderedSet)initWithObjects:(id)firstObj;
- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set;
- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set copyItems:(BOOL)flag;
- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set range:(NSRange)range copyItems:(BOOL)flag;
- (NSOrderedSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4;
- (NSOrderedSet)initWithSet:(NSSet *)set;
- (NSOrderedSet)initWithSet:(NSSet *)set copyItems:(BOOL)flag;
- (NSOrderedSet)reversedOrderedSet;
- (NSSet)set;
- (NSString)description;
- (NSString)descriptionWithLocale:(id)locale;
- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
- (NSUInteger)count;
- (NSUInteger)indexOfObject:(id)object;
- (NSUInteger)indexOfObject:(id)object inSortedRange:(NSRange)range options:(NSBinarySearchingOptions)opts usingComparator:(NSComparator)cmp;
- (NSUInteger)indexOfObjectAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSUInteger)indexOfObjectPassingTest:(void *)predicate;
- (NSUInteger)indexOfObjectWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (id)allObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstObject;
- (id)lastObject;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(NSUInteger)idx;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;
- (id)objectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)objectPassingTest:(id)a3;
- (id)objectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)objectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (id)objectsPassingTest:(id)a3;
- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)countForObject:(id)a3;
- (unint64_t)countForObject:(id)a3 inRange:(_NSRange)a4;
- (unint64_t)hash;
- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4;
- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)enumerateObjectsUsingBlock:(void *)block;
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)objects range:(NSRange)range;
@end

@implementation NSOrderedSet

- (BOOL)isNSOrderedSet__
{
  return 1;
}

- (id)allObjects
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  unint64_t v4 = -[NSOrderedSet count](self, "count");
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
  -[NSOrderedSet getObjects:range:](self, "getObjects:range:", v6, 0LL, v5);
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

- (BOOL)containsObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v22[1] = *MEMORY[0x1895F89C0];
  NSUInteger v9 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v15 = v9;
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v16,  (uint64_t)"-[NSOrderedSet containsObject:inRange:]",  location,  length,  --v15);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v17,  "-[NSOrderedSet containsObject:inRange:]",  location,  length,  v15);
    }

    else
    {
      uint64_t v11 = _os_log_pack_size();
      CFStringRef v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0( v13,  (uint64_t)"-[NSOrderedSet containsObject:inRange:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v14,  "-[NSOrderedSet containsObject:inRange:]",  location,  length);
    }

    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
    objc_exception_throw(v18);
    return -[NSOrderedSet containsObject:](v19, v20, v21);
  }

  else
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
    }
    return -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, location, length) != 0x7FFFFFFFFFFFFFFFLL;
  }

- (BOOL)containsObject:(id)object
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  return -[NSOrderedSet indexOfObject:](self, "indexOfObject:", object) != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v6 = a5;
  v22[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5)
  {
    uint64_t v15 = _os_log_pack_size();
    double v17 = (char *)v22 - ((MEMORY[0x1895F8858](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "-[NSOrderedSet countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = v6;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSOrderedSet countByEnumeratingWithState:objects:count:]",  v6);
    goto LABEL_21;
  }

  if (a5 >> 61)
  {
    uint64_t v15 = _os_log_pack_size();
    double v17 = (char *)v22 - ((MEMORY[0x1895F8858](v15, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315394;
    *(void *)(v20 + 4) = "-[NSOrderedSet countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v20 + 12) = 2048;
    *(void *)(v20 + 14) = v6;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSOrderedSet countByEnumeratingWithState:objects:count:]",  v6);
LABEL_21:
    id v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v17,  v15);
    objc_exception_throw(v21);
  }

  unint64_t var0 = a3->var0;
  if (a3->var0 == -1LL) {
    return 0LL;
  }
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
    unint64_t var0 = a3->var0;
  }

  var3 = a3->var3;
  if (var0)
  {
    NSUInteger v12 = *var3;
  }

  else
  {
    a3->var2 = var3;
    NSUInteger v12 = -[NSOrderedSet count](self, "count");
    a3->var3[0] = v12;
    unint64_t var0 = a3->var0;
  }

  a3->var1 = a4;
  if (v12 - var0 < v6) {
    unint64_t v6 = v12 - var0;
  }
  if (v6)
  {
    -[NSOrderedSet getObjects:range:](self, "getObjects:range:", a4);
    unint64_t var0 = a3->var0;
  }

  unint64_t v13 = var0 + v6;
  if (v12 <= var0 + v6) {
    unint64_t v13 = -1LL;
  }
  a3->unint64_t var0 = v13;
  return v6;
}

- (unint64_t)countForObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v22[1] = *MEMORY[0x1895F89C0];
  NSUInteger v9 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v15 = v9;
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v16,  (uint64_t)"-[NSOrderedSet countForObject:inRange:]",  location,  length,  --v15);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v17,  "-[NSOrderedSet countForObject:inRange:]",  location,  length,  v15);
    }

    else
    {
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0( v13,  (uint64_t)"-[NSOrderedSet countForObject:inRange:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v14,  "-[NSOrderedSet countForObject:inRange:]",  location,  length);
    }

    uint64_t v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
    objc_exception_throw(v18);
    return -[NSOrderedSet countForObject:](v19, v20, v21);
  }

  else
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
    }
    return -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, location, length) != 0x7FFFFFFFFFFFFFFFLL;
  }

- (unint64_t)countForObject:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  return -[NSOrderedSet indexOfObject:](self, "indexOfObject:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  v19[1] = *MEMORY[0x1895F89C0];
  if (!s)
  {
    uint64_t v13 = _os_log_pack_size();
    double v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]");
    goto LABEL_12;
  }

  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    double v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]");
    goto LABEL_12;
  }

  if (!block)
  {
    uint64_t v13 = _os_log_pack_size();
    double v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:]");
LABEL_12:
    uint64_t v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v14,  v13);
    objc_exception_throw(v18);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSEnumerationOptions v11 = opts & 0xEFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v11 = opts;
  }
  uint64_t v12 = v11 | 0x1000000000000000LL;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, v11 | 0x1000000000000000LL, s);
  __NSOrderedSetEnumerate(self, (uint64_t)block, v12, s);
}

- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (!block)
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSOrderedSet enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[NSOrderedSet enumerateObjectsWithOptions:usingBlock:]");
    NSEnumerationOptions v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v9);
    objc_exception_throw(v11);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  if ((opts & 2) != 0) {
    opts &= ~1uLL;
  }
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)block, opts, 0LL);
  __NSOrderedSetEnumerate(self, (uint64_t)block, opts, 0LL);
}

- (void)enumerateObjectsUsingBlock:(void *)block
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (!block)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSOrderedSet enumerateObjectsUsingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[NSOrderedSet enumerateObjectsUsingBlock:]");
    unint64_t v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
    objc_exception_throw(v8);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  -[NSOrderedSet enumerateObjectsWithOptions:usingBlock:](self, "enumerateObjectsWithOptions:usingBlock:", 0LL, block);
}

- (id)firstObject
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  id result = -[NSOrderedSet count](self, "count");
  if (result) {
    return -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", 0LL);
  }
  return result;
}

- (void)getObjects:(id *)objects range:(NSRange)range
{
  NSUInteger length = range.length;
  uint64_t location = range.location;
  uint64_t v7 = objects;
  v26[1] = *MEMORY[0x1895F89C0];
  if (!objects && range.length)
  {
    uint64_t location = _os_log_pack_size();
    uint64_t v10 = (char *)v26 - ((location + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315394;
    *(void *)(v11 + 4) = "-[NSOrderedSet getObjects:range:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v11 + 14) = length;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSOrderedSet getObjects:range:]",  length);
LABEL_14:
    uint64_t v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v10,  location);
    objc_exception_throw(v13);
    goto LABEL_15;
  }

  if (range.length >> 61)
  {
    uint64_t location = _os_log_pack_size();
    uint64_t v10 = (char *)v26 - ((location + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[NSOrderedSet getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = length;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSOrderedSet getObjects:range:]",  length);
    goto LABEL_14;
  }

  NSUInteger v9 = -[NSOrderedSet count](self, "count");
  if (location < 0 || v9 < location + length)
  {
LABEL_15:
    if (v9)
    {
      NSUInteger v18 = v9;
      uint64_t v14 = _os_log_pack_size();
      uint64_t v15 = (char *)v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v19 = _os_log_pack_fill();
      double v20 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v19,  (uint64_t)"-[NSOrderedSet getObjects:range:]",  location,  length,  --v18);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v20,  "-[NSOrderedSet getObjects:range:]",  location,  length,  v18);
    }

    else
    {
      uint64_t v14 = _os_log_pack_size();
      uint64_t v15 = (char *)v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[NSOrderedSet getObjects:range:]", location, length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v17,  "-[NSOrderedSet getObjects:range:]",  location,  length,  v25);
    }

    id v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v15,  v14);
    objc_exception_throw(v21);
    -[NSOrderedSet getObjects:](v22, v23, v24);
    return;
  }

  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!length) {
      return;
    }
  }

  else if (!length)
  {
    return;
  }

  do
  {
    *v7++ = -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", location++);
    --length;
  }

  while (length);
}

- (void)getObjects:(id *)a3
{
  v16[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v6 = -[NSOrderedSet count](self, "count");
  if (!a3 && v6)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = _os_log_pack_size();
    uint64_t v10 = (char *)v16 - ((MEMORY[0x1895F8858](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315394;
    *(void *)(v11 + 4) = "-[NSOrderedSet getObjects:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v11 + 14) = v7;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSOrderedSet getObjects:]",  v7);
    goto LABEL_9;
  }

  if (v6 >> 61)
  {
    NSUInteger v12 = v6;
    uint64_t v8 = _os_log_pack_size();
    uint64_t v10 = (char *)v16 - ((MEMORY[0x1895F8858](v8, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[NSOrderedSet getObjects:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = v12;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSOrderedSet getObjects:]",  v12);
LABEL_9:
    uint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v10,  v8);
    objc_exception_throw(v15);
  }

  -[NSOrderedSet getObjects:range:](self, "getObjects:range:", a3, 0LL, v6);
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v25[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v9 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v16 = v9;
      uint64_t v12 = _os_log_pack_size();
      uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v17,  (uint64_t)"-[NSOrderedSet indexOfObject:inRange:]",  location,  length,  --v16);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v18,  "-[NSOrderedSet indexOfObject:inRange:]",  location,  length,  v16);
    }

    else
    {
      uint64_t v12 = _os_log_pack_size();
      uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v14 = _os_log_pack_fill();
      double v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v14, (uint64_t)"-[NSOrderedSet indexOfObject:inRange:]", location, length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v15,  "-[NSOrderedSet indexOfObject:inRange:]",  location,  length);
    }

    uint64_t v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v13,  v12);
    objc_exception_throw(v19);
    return -[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:](v20, v21, v22, v26, v23, v24);
  }

  else
  {
    unint64_t result = -[NSOrderedSet indexOfObject:](self, "indexOfObject:", a3);
    if (result - location >= length) {
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = result;
    }
    if (result != 0x7FFFFFFFFFFFFFFFLL) {
      return v11;
    }
  }

  return result;
}

- (NSUInteger)indexOfObject:(id)object inSortedRange:(NSRange)range options:(NSBinarySearchingOptions)opts usingComparator:(NSComparator)cmp
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  if (!object)
  {
    uint64_t v38 = _os_log_pack_size();
    v39 = (char *)&v54 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v40 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v40 = 136315138;
    *(void *)(v40 + 4) = "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]");
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
    *(void *)(v41 + 4) = "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSOrderedSet indexOfObject:inSortedRange:options:usingComparator:]");
    goto LABEL_58;
  }

  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSUInteger v7 = a2;
  NSUInteger v6 = (objc_class *)self;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v8, __CFTSANTagMutableOrderedSet);
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
          uint64_t v18 = (*((uint64_t (**)(NSComparator, uint64_t, id))cmp + 2))( cmp,  -[objc_class objectAtIndex:](v6, "objectAtIndex:", v15 - 1),  object);
          if (v18 < 0)
          {
            NSUInteger v17 = 0x7FFFFFFFFFFFFFFFLL;
          }

          else if (v18 | opts & 0x100)
          {
            uint64_t v19 = (*((uint64_t (**)(NSComparator, id, uint64_t))cmp + 2))( cmp,  object,  -[objc_class objectAtIndex:](v6, "objectAtIndex:", location));
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
                    uint64_t v21 = (*((uint64_t (**)(NSComparator, uint64_t, id))cmp + 2))( cmp,  -[objc_class objectAtIndex:](v6, "objectAtIndex:", location + (v24 >> 1)),  object);
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
    *(void *)(v16 + 4) = "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }

  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    NSUInteger v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }

  if (!predicate)
  {
    uint64_t v14 = _os_log_pack_size();
    NSUInteger v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]");
LABEL_12:
    uint64_t v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v15,  v14);
    objc_exception_throw(v19);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSEnumerationOptions v11 = opts & 0xCFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v11 = opts;
  }
  uint64_t v12 = v11 | 0x3000000000000000LL;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v11 | 0x3000000000000000LL, s);
  return __NSOrderedSetGetIndexPassingTest(self, (uint64_t)predicate, v12, s);
}

- (NSUInteger)indexOfObjectWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  v15[1] = *MEMORY[0x1895F89C0];
  if (!predicate)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSOrderedSet indexOfObjectWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSOrderedSet indexOfObjectWithOptions:passingTest:]");
    uint64_t v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v12);
    objc_exception_throw(v14);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSEnumerationOptions v9 = opts & 0xDFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x2000000000000000LL;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x2000000000000000LL, 0LL);
  return __NSOrderedSetGetIndexPassingTest(self, (uint64_t)predicate, v10, 0LL);
}

- (NSUInteger)indexOfObjectPassingTest:(void *)predicate
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!predicate)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSOrderedSet indexOfObjectPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSOrderedSet indexOfObjectPassingTest:]");
    NSEnumerationOptions v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  return -[NSOrderedSet indexOfObjectWithOptions:passingTest:]( self,  "indexOfObjectWithOptions:passingTest:",  0LL,  predicate);
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
    *(void *)(v16 + 4) = "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }

  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    NSUInteger v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }

  if (!predicate)
  {
    uint64_t v14 = _os_log_pack_size();
    NSUInteger v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]");
LABEL_12:
    uint64_t v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v15,  v14);
    objc_exception_throw(v19);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSEnumerationOptions v11 = opts & 0xAFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v11 = opts;
  }
  uint64_t v12 = v11 | 0x5000000000000000LL;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v11 | 0x5000000000000000LL, s);
  return (NSIndexSet *)__NSOrderedSetGetIndexesPassingTest(self, (uint64_t)predicate, v12, s);
}

- (NSIndexSet)indexesOfObjectsWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  v15[1] = *MEMORY[0x1895F89C0];
  if (!predicate)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSOrderedSet indexesOfObjectsWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSOrderedSet indexesOfObjectsWithOptions:passingTest:]");
    uint64_t v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v12);
    objc_exception_throw(v14);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSEnumerationOptions v9 = opts & 0xBFFFFFFFFFFFFFFELL;
  if ((opts & 2) == 0) {
    NSEnumerationOptions v9 = opts;
  }
  uint64_t v10 = v9 | 0x4000000000000000LL;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)predicate, v9 | 0x4000000000000000LL, 0LL);
  return (NSIndexSet *)__NSOrderedSetGetIndexesPassingTest(self, (uint64_t)predicate, v10, 0LL);
}

- (NSIndexSet)indexesOfObjectsPassingTest:(void *)predicate
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!predicate)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSOrderedSet indexesOfObjectsPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSOrderedSet indexesOfObjectsPassingTest:]");
    NSEnumerationOptions v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  return -[NSOrderedSet indexesOfObjectsWithOptions:passingTest:]( self,  "indexesOfObjectsWithOptions:passingTest:",  0LL,  predicate);
}

- (BOOL)intersectsOrderedSet:(NSOrderedSet *)other
{
  uint64_t v4 = other;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (other && (_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSOrderedSet intersectsOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSOrderedSet intersectsOrderedSet:]");
    uint64_t v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v21[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v14);
    objc_exception_throw(v16);
    LOBYTE(v10) = -[NSOrderedSet intersectsSet:](v17, v18, v19);
  }

  else
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
    }
    NSUInteger v6 = -[NSOrderedSet count](self, "count");
    unint64_t v7 = -[NSOrderedSet count](v4, "count");
    BOOL v8 = v6 >= v7;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    if (v6 >= v7) {
      NSEnumerationOptions v9 = v4;
    }
    else {
      NSEnumerationOptions v9 = self;
    }
    if (v8) {
      uint64_t v4 = self;
    }
    __int128 v24 = 0uLL;
    __int128 v25 = 0uLL;
    uint64_t v10 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      while (2)
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          if (-[NSOrderedSet containsObject:](v4, "containsObject:", *(void *)(*((void *)&v22 + 1) + 8 * v13)))
          {
            LOBYTE(v10) = 1;
            return v10;
          }

          ++v13;
        }

        while (v11 != v13);
        uint64_t v10 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
        uint64_t v11 = v10;
        if (v10) {
          continue;
        }
        break;
      }
    }
  }

  return v10;
}

- (BOOL)intersectsSet:(NSSet *)set
{
  uint64_t v4 = (NSOrderedSet *)set;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (set && (_NSIsNSSet((uint64_t)set) & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSOrderedSet intersectsSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSOrderedSet intersectsSet:]");
    uint64_t v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v21[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v14);
    objc_exception_throw(v16);
    LOBYTE(v10) = -[NSOrderedSet isSubsetOfOrderedSet:](v17, v18, v19);
  }

  else
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
    }
    NSUInteger v6 = -[NSOrderedSet count](self, "count");
    unint64_t v7 = -[NSOrderedSet count](v4, "count");
    BOOL v8 = v6 >= v7;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    if (v6 >= v7) {
      NSEnumerationOptions v9 = v4;
    }
    else {
      NSEnumerationOptions v9 = self;
    }
    if (v8) {
      uint64_t v4 = self;
    }
    __int128 v24 = 0uLL;
    __int128 v25 = 0uLL;
    uint64_t v10 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      while (2)
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          if (-[NSOrderedSet containsObject:](v4, "containsObject:", *(void *)(*((void *)&v22 + 1) + 8 * v13)))
          {
            LOBYTE(v10) = 1;
            return v10;
          }

          ++v13;
        }

        while (v11 != v13);
        uint64_t v10 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
        uint64_t v11 = v10;
        if (v10) {
          continue;
        }
        break;
      }
    }
  }

  return v10;
}

- (BOOL)isSubsetOfOrderedSet:(NSOrderedSet *)other
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (other && (_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSOrderedSet isSubsetOfOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSOrderedSet isSubsetOfOrderedSet:]");
    uint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v19[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v13);
    objc_exception_throw(v15);
    return -[NSOrderedSet isSubsetOfSet:](v16, v17, v18);
  }

  else
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
    }
    unint64_t v6 = -[NSOrderedSet count](self, "count");
    if (v6 <= -[NSOrderedSet count](other, "count"))
    {
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      unint64_t v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
      if (v8)
      {
        unint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(self);
            }
            if (!-[NSOrderedSet countForObject:](other, "countForObject:", *(void *)(*((void *)&v20 + 1) + 8 * i)))
            {
              BOOL v12 = 0;
              return other && v12;
            }
          }

          unint64_t v9 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
          if (v9) {
            continue;
          }
          break;
        }
      }

      BOOL v12 = 1;
      return other && v12;
    }

    else
    {
      return 0;
    }
  }

- (BOOL)isSubsetOfSet:(NSSet *)set
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (set && (_NSIsNSSet((uint64_t)set) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSOrderedSet isSubsetOfSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSOrderedSet isSubsetOfSet:]");
    uint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v18[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v13);
    objc_exception_throw(v15);
    return -[NSOrderedSet lastObject](v16, v17);
  }

  else
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
    }
    unint64_t v6 = -[NSOrderedSet count](self, "count");
    if (v6 <= -[NSSet count](set, "count"))
    {
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      unint64_t v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v19,  v18,  16LL);
      if (v8)
      {
        unint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(self);
            }
            if (!-[NSSet countForObject:](set, "countForObject:", *(void *)(*((void *)&v19 + 1) + 8 * i)))
            {
              BOOL v12 = 0;
              return set && v12;
            }
          }

          unint64_t v9 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v19,  v18,  16LL);
          if (v9) {
            continue;
          }
          break;
        }
      }

      BOOL v12 = 1;
      return set && v12;
    }

    else
    {
      return 0;
    }
  }

- (id)lastObject
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  id result = -[NSOrderedSet count](self, "count");
  if (result) {
    return -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", (char *)result - 1);
  }
  return result;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  return -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", idx);
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
    *(void *)(v14 + 4) = "-[NSOrderedSet objectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSOrderedSet objectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }

  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSOrderedSet objectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSOrderedSet objectAtIndexes:options:passingTest:]");
    goto LABEL_12;
  }

  if (!a5)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSOrderedSet objectAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSOrderedSet objectAtIndexes:options:passingTest:]");
LABEL_12:
    SEL v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v13,  v12);
    objc_exception_throw(v17);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v10 = -[NSOrderedSet indexOfObjectAtIndexes:options:passingTest:]( self,  "indexOfObjectAtIndexes:options:passingTest:",  a3,  a4,  a5);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  else {
    return -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", v10);
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
    *(void *)(v11 + 4) = "-[NSOrderedSet objectWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSOrderedSet objectWithOptions:passingTest:]");
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v10);
    objc_exception_throw(v12);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v8 = -[NSOrderedSet indexOfObjectWithOptions:passingTest:](self, "indexOfObjectWithOptions:passingTest:", a3, a4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0LL;
  }
  else {
    return -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", v8);
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
    *(void *)(v8 + 4) = "-[NSOrderedSet objectPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSOrderedSet objectPassingTest:]");
    unint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  return -[NSOrderedSet objectWithOptions:passingTest:](self, "objectWithOptions:passingTest:", 0LL, a3);
}

- (NSArray)objectsAtIndexes:(NSIndexSet *)indexes
{
  v40[1] = *MEMORY[0x1895F89C0];
  if (!indexes)
  {
    uint64_t v23 = _os_log_pack_size();
    uint64_t v9 = (uint64_t)v40 - ((MEMORY[0x1895F8858](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v25 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v25 = 136315138;
    *(void *)(v25 + 4) = "-[NSOrderedSet objectsAtIndexes:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSOrderedSet objectsAtIndexes:]");
    uint64_t v26 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v23);
    objc_exception_throw(v26);
LABEL_30:
    __break(1u);
LABEL_31:
    CFStringRef v38 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v9);
    v39 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v38,  0LL);
    CFRelease(v38);
    objc_exception_throw(v39);
  }

  if ((_NSIsNSIndexSet() & 1) == 0) {
    goto LABEL_23;
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
LABEL_23:
    uint64_t v27 = _os_log_pack_size();
    uint64_t v9 = (uint64_t)v40 - ((MEMORY[0x1895F8858](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136315138;
    *(void *)(v29 + 4) = "-[NSOrderedSet objectsAtIndexes:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSOrderedSet objectsAtIndexes:]");
    NSUInteger v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v27);
    objc_exception_throw(v30);
    goto LABEL_30;
  }

  NSUInteger v6 = -[NSOrderedSet count](self, "count");
  uint64_t v7 = [0 count];
  NSUInteger v8 = -[NSIndexSet lastIndex](indexes, "lastIndex");
  uint64_t v9 = v8;
  if ((v8 & 0x8000000000000000LL) != 0)
  {
    NSUInteger v10 = v7 + v6;
    goto LABEL_26;
  }

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v10 = v7 + v6;
    if (v10 <= v8)
    {
LABEL_26:
      uint64_t v31 = _os_log_pack_size();
      v33 = (char *)v40 - ((MEMORY[0x1895F8858](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v34 = _os_log_pack_fill();
      if (v10)
      {
        uint64_t v36 = v10 - 1;
        double v37 = __os_log_helper_1_2_3_8_32_8_0_8_0(v34, (uint64_t)"-[NSOrderedSet objectsAtIndexes:]", v9, v36);
        CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu in index set beyond bounds [0 .. %lu]",  v37,  "-[NSOrderedSet objectsAtIndexes:]",  v9,  v36);
      }

      else
      {
        *(_DWORD *)uint64_t v34 = 136315394;
        *(void *)(v34 + 4) = "-[NSOrderedSet objectsAtIndexes:]";
        *(_WORD *)(v34 + 12) = 2048;
        *(void *)(v34 + 14) = v9;
        CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu in index set beyond bounds for empty ordered set",  "-[NSOrderedSet objectsAtIndexes:]",  v9);
      }

      v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v33,  v31);
      objc_exception_throw(v35);
      goto LABEL_30;
    }
  }

  unint64_t v11 = -[NSIndexSet count](indexes, "count");
  uint64_t v9 = v11;
  if (v11 >> 60) {
    goto LABEL_31;
  }
  if (v11 <= 1) {
    unint64_t v11 = 1LL;
  }
  uint64_t v12 = (id *)_CFCreateArrayStorage(v11, 0, v40);
  unint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  while (v13 < -[NSIndexSet rangeCount](indexes, "rangeCount"))
  {
    uint64_t v15 = -[NSIndexSet rangeAtIndex:](indexes, "rangeAtIndex:", v13);
    uint64_t v17 = v16;
    -[NSOrderedSet getObjects:range:](self, "getObjects:range:", &v12[v14], v15, v16);
    v14 += v17;
    ++v13;
  }

  if (v12)
  {
    if (v9 >= 1)
    {
      SEL v18 = v12;
      uint64_t v19 = v9;
      do
      {
        id v20 = *v18++;
        --v19;
      }

      while (v19);
    }

    __int128 v21 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v12,  v9,  v9);
  }

  else
  {
    __int128 v21 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", 0LL, v9);
  }

  return v21;
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
    *(void *)(v13 + 4) = "-[NSOrderedSet objectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSOrderedSet objectsAtIndexes:options:passingTest:]");
    goto LABEL_10;
  }

  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSOrderedSet objectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSOrderedSet objectsAtIndexes:options:passingTest:]");
    goto LABEL_10;
  }

  if (!a5)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSOrderedSet objectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSOrderedSet objectsAtIndexes:options:passingTest:]");
LABEL_10:
    uint64_t v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
    objc_exception_throw(v16);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  return +[NSOrderedSet orderedSetWithArray:]( &OBJC_CLASS___NSOrderedSet,  "orderedSetWithArray:",  -[NSOrderedSet objectsAtIndexes:]( self,  "objectsAtIndexes:",  -[NSOrderedSet indexesOfObjectsAtIndexes:options:passingTest:]( self,  "indexesOfObjectsAtIndexes:options:passingTest:",  a3,  a4,  a5)));
}

- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v12[1] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSOrderedSet objectsWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSOrderedSet objectsWithOptions:passingTest:]");
    uint64_t v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v9);
    objc_exception_throw(v11);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  return +[NSOrderedSet orderedSetWithArray:]( &OBJC_CLASS___NSOrderedSet,  "orderedSetWithArray:",  -[NSOrderedSet objectsAtIndexes:]( self,  "objectsAtIndexes:",  -[NSOrderedSet indexesOfObjectsWithOptions:passingTest:]( self,  "indexesOfObjectsWithOptions:passingTest:",  a3,  a4)));
}

- (id)objectsPassingTest:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSOrderedSet objectsPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSOrderedSet objectsPassingTest:]");
    uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  return -[NSOrderedSet objectsWithOptions:passingTest:](self, "objectsWithOptions:passingTest:", 0LL, a3);
}

- (NSEnumerator)objectEnumerator
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  return (NSEnumerator *) -[__NSFastEnumerationEnumerator initWithObject:]( objc_alloc(&OBJC_CLASS_____NSFastEnumerationEnumerator),  "initWithObject:",  self);
}

- (NSEnumerator)reverseObjectEnumerator
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  return (NSEnumerator *) -[__NSOrderedSetReverseEnumerator initWithObject:]( objc_alloc(&OBJC_CLASS_____NSOrderedSetReverseEnumerator),  "initWithObject:",  self);
}

- (NSOrderedSet)reversedOrderedSet
{
  return (NSOrderedSet *) -[__NSOrderedSetReversed initWithOrderedSet:]( objc_alloc(&OBJC_CLASS_____NSOrderedSetReversed),  "initWithOrderedSet:",  self);
}

- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  v48[1] = *MEMORY[0x1895F89C0];
  if (!a5)
  {
    unint64_t length = _os_log_pack_size();
    uint64_t v31 = (char *)&v46[-1] - ((MEMORY[0x1895F8858](length, v30) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v32 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v32 = 136315138;
    *(void *)(v32 + 4) = "-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]");
    v33 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v31,  length);
    objc_exception_throw(v33);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }

  char v8 = a4;
  unint64_t length = a3.length;
  NSUInteger location = a3.location;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v6, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v12 = -[NSOrderedSet count](self, "count");
  if (!length || (uint64_t v5 = (char *)v12) == 0LL)
  {
    uint64_t v14 = (NSOrderedSet *)&OBJC_CLASS___NSArray;
    return -[NSOrderedSet array](v14, "array");
  }

  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v12 < location + length)
  {
    uint64_t v34 = _os_log_pack_size();
    uint64_t v36 = (char *)&v46[-1] - ((MEMORY[0x1895F8858](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v37 = _os_log_pack_fill();
    uint64_t v38 = (uint64_t)(v5 - 1);
    uint64_t v5 = "-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]";
    double v39 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v37,  (uint64_t)"-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]",  location,  length,  v38);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v39,  "-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]",  location,  length,  v38);
    uint64_t v40 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v36,  v34);
    objc_exception_throw(v40);
    goto LABEL_31;
  }

  if (v12 == 1)
  {
    uint64_t v14 = self;
    return -[NSOrderedSet array](v14, "array");
  }

  if (length == 1) {
    return +[NSArray arrayWithObject:]( &OBJC_CLASS___NSArray,  "arrayWithObject:",  -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", location));
  }
  if (length >> 60)
  {
LABEL_32:
    CFStringRef v41 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  length);
    v42 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v41,  0LL);
    CFRelease(v41);
    objc_exception_throw(v42);
    v44 = v43;
    free(v5);
    free(v42);
    _Unwind_Resume(v44);
  }

  MEMORY[0x1895F8858](v12, v13);
  uint64_t v17 = (char *)&v46[-1] - v16;
  if (length >= 0x101)
  {
    uint64_t v17 = (char *)_CFCreateArrayStorage(length, 0, v48);
    SEL v18 = v17;
  }

  else
  {
    SEL v18 = 0LL;
  }

  uint64_t v19 = (id *)_CFCreateArrayStorage(length, 0, &v47);
  uint64_t v20 = -[NSOrderedSet getObjects:range:](self, "getObjects:range:", v17, location, length);
  MEMORY[0x1895F8858](v20, v21);
  uint64_t v23 = (char *)&v46[-1] - v22;
  uint64_t v24 = (char *)&v46[-1] - v22;
  if (length > 0x1000) {
    uint64_t v24 = (char *)malloc(8 * length);
  }
  v46[0] = MEMORY[0x1895F87A8];
  v46[1] = 3221225472LL;
  v46[2] = __61__NSOrderedSet_sortedArrayFromRange_options_usingComparator___block_invoke;
  v46[3] = &unk_189996258;
  v46[4] = a5;
  v46[5] = v17;
  CFSortIndexes((uint64_t)v24, length, v8, (uint64_t)v46);
  for (uint64_t i = 0LL; i != length; ++i)
    v19[i] = *(id *)&v17[8 * *(void *)&v24[8 * i]];
  if (v23 != v24) {
    free(v24);
  }
  if ((uint64_t)length >= 1)
  {
    uint64_t v26 = v19;
    unint64_t v27 = length;
    do
    {
      id v28 = *v26++;
      --v27;
    }

    while (v27);
  }

  id v29 =  -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v19,  length,  length);
  free(v18);
  return v29;
}

uint64_t __61__NSOrderedSet_sortedArrayFromRange_options_usingComparator___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
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
    *(void *)(v12 + 4) = "-[NSOrderedSet sortedArrayWithOptions:usingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSOrderedSet sortedArrayWithOptions:usingComparator:]");
    uint64_t v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v11,  v9);
    objc_exception_throw(v13);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  return (NSArray *)-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]( self,  "sortedArrayFromRange:options:usingComparator:",  0LL,  -[NSOrderedSet count](self, "count"),  opts,  cmptr);
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
    *(void *)(v10 + 4) = "-[NSOrderedSet sortedArrayUsingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSOrderedSet sortedArrayUsingComparator:]");
    uint64_t v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v7);
    objc_exception_throw(v11);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  return (NSArray *)-[NSOrderedSet sortedArrayFromRange:options:usingComparator:]( self,  "sortedArrayFromRange:options:usingComparator:",  0LL,  -[NSOrderedSet count](self, "count"),  0LL,  cmptr);
}

- (NSArray)array
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  return (NSArray *) -[__NSOrderedSetArrayProxy initWithOrderedSet:]( objc_alloc(&OBJC_CLASS_____NSOrderedSetArrayProxy),  "initWithOrderedSet:",  self);
}

- (NSSet)set
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  return (NSSet *) -[__NSOrderedSetSetProxy initWithOrderedSet:]( objc_alloc(&OBJC_CLASS_____NSOrderedSetSetProxy),  "initWithOrderedSet:",  self);
}

- (NSString)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
  id v32 = locale;
  v33[1] = *MEMORY[0x1895F89C0];
  if (level >= 0x64) {
    NSUInteger v5 = 100LL;
  }
  else {
    NSUInteger v5 = level;
  }
  NSUInteger v6 = -[NSOrderedSet count](self, "count");
  unint64_t v8 = v6;
  if (v6 >> 60)
  {
    CFStringRef v25 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v6);
    uint64_t v26 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v25,  0LL);
    CFRelease(v25);
    objc_exception_throw(v26);
  }

  if (v6 <= 1) {
    NSUInteger v6 = 1LL;
  }
  unint64_t v9 = MEMORY[0x1895F8858](v6, v7);
  uint64_t v11 = (uint64_t *)((char *)&v27 - v10);
  if (v8 >= 0x101)
  {
    uint64_t v11 = (uint64_t *)_CFCreateArrayStorage(v9, 0, v33);
    uint64_t v12 = v11;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  -[NSOrderedSet getObjects:range:](self, "getObjects:range:", v11, 0LL, v8);
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL);
  CFAllocatorRef v29 = (CFAllocatorRef)&__kCFAllocatorSystemDefault;
  uint64_t v30 = v12;
  id v28 = (void *)MEMORY[0x186E03CAC]();
  if (v8)
  {
    uint64_t v31 = sel_descriptionWithLocale_;
    uint64_t v14 = v11;
    unint64_t v15 = v8;
    do
    {
      uint64_t v16 = (void *)*v14;
      if (_NSIsNSString(*v14))
      {
        uint64_t v17 = [v16 _stringRepresentation];
      }

      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v17 = [v16 descriptionWithLocale:v32 indent:v5 + 1];
      }

      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v17 = [v16 descriptionWithLocale:v32];
      }

      else
      {
        uint64_t v17 = [v16 description];
      }

      if (v17) {
        SEL v18 = (const __CFString *)v17;
      }
      else {
        SEL v18 = @"(null)";
      }
      *v14++ = (uint64_t)v18;
      --v15;
    }

    while (v15);
  }

  uint64_t v19 = v30;
  for (CFMutableStringRef i = CFStringCreateMutable(v29, 0LL); v5; --v5)
    CFStringAppend(i, @"    ");
  CFStringAppend(Mutable, i);
  CFStringAppend(Mutable, @"{(\n");
  unint64_t v21 = 0LL;
  while (v8 != v21)
  {
    CFStringAppend(Mutable, i);
    CFStringAppend(Mutable, @"    ");
    CFStringAppend(Mutable, (CFStringRef)v11[v21++]);
    if (v21 >= v8) {
      uint64_t v22 = @"\n";
    }
    else {
      uint64_t v22 = @",\n";
    }
    CFStringAppend(Mutable, v22);
  }

  CFStringAppend(Mutable, i);
  CFStringAppend(Mutable, @"}"));
  CFRelease(i);
  objc_autoreleasePoolPop(v28);
  uint64_t v23 = Mutable;
  free(v19);
  return v23;
}

- (NSString)descriptionWithLocale:(id)locale
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  return -[NSOrderedSet descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", locale, 0LL);
}

- (NSString)description
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  return -[NSOrderedSet descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", 0LL, 0LL);
}

- (unint64_t)hash
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  return -[NSOrderedSet count](self, "count");
}

- (BOOL)isEqualToOrderedSet:(NSOrderedSet *)other
{
  uint64_t v4 = MEMORY[0x1895F8858](self, a2);
  NSUInteger v6 = (void *)v5;
  uint64_t v7 = (void *)v4;
  v26[256] = *MEMORY[0x1895F89C0];
  if (v5 && (_NSIsNSOrderedSet(v5) & 1) == 0)
  {
    uint64_t v15 = _os_log_pack_size();
    uint64_t v17 = &v25[-((MEMORY[0x1895F8858](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSOrderedSet isEqualToOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSOrderedSet isEqualToOrderedSet:]");
    uint64_t v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v17,  v15);
    objc_exception_throw(v19);
    LOBYTE(v8) = -[NSOrderedSet isEqual:](v20, v21, v22);
  }

  else
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(v7, v3, __CFTSANTagMutableOrderedSet);
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
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }

  else if (a3)
  {
    int v6 = _NSIsNSOrderedSet((uint64_t)a3);
    if (v6) {
      LOBYTE(v6) = -[NSOrderedSet isEqualToOrderedSet:](self, "isEqualToOrderedSet:", a3);
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (NSOrderedSet)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSOrderedSet == a1) {
    return (NSOrderedSet *)__NSOrderedSetImmutablePlaceholder();
  }
  if (&OBJC_CLASS___NSMutableOrderedSet == a1) {
    return (NSOrderedSet *)__NSOrderedSetMutablePlaceholder();
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSOrderedSet;
  return (NSOrderedSet *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

+ (id)newOrderedSetWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4) {
    goto LABEL_15;
  }
  if (a4 >> 61)
  {
    uint64_t v9 = _os_log_pack_size();
    unint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "+[NSOrderedSet newOrderedSetWithObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "+[NSOrderedSet newOrderedSetWithObjects:count:]",  a4);
    goto LABEL_14;
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
    *(void *)(v11 + 4) = "+[NSOrderedSet newOrderedSetWithObjects:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v11 + 14) = v8;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: attempt to insert nil object from objects[%lu]",  "+[NSOrderedSet newOrderedSetWithObjects:count:]",  v8);
    while (1)
    {
LABEL_14:
      uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v10,  v9);
      objc_exception_throw(v12);
LABEL_15:
      unint64_t v13 = a4;
      uint64_t v9 = _os_log_pack_size();
      unint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v14 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v14 = 136315394;
      *(void *)(v14 + 4) = "+[NSOrderedSet newOrderedSetWithObjects:count:]";
      *(_WORD *)(v14 + 12) = 2048;
      *(void *)(v14 + 14) = v13;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "+[NSOrderedSet newOrderedSetWithObjects:count:]",  v13);
    }
  }

- (NSOrderedSet)initWithArray:(NSArray *)set range:(NSRange)range copyItems:(BOOL)flag
{
  BOOL v5 = flag;
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v39[1] = *MEMORY[0x1895F89C0];
  if (set && (_NSIsNSArray((uint64_t)set) & 1) == 0)
  {
    uint64_t v30 = _os_log_pack_size();
    id v32 = (char *)v39 - ((MEMORY[0x1895F8858](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v33 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v33 = 136315138;
    *(void *)(v33 + 4) = "-[NSOrderedSet initWithArray:range:copyItems:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSOrderedSet initWithArray:range:copyItems:]");
    uint64_t v34 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v32,  v30);
    objc_exception_throw(v34);
LABEL_27:
    __break(1u);
    return result;
  }

  NSUInteger v10 = -[NSArray count](set, "count");
  NSUInteger v12 = v10;
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v10 < location + length)
  {
    if (v10)
    {
      uint64_t v22 = _os_log_pack_size();
      uint64_t v24 = (char *)v39 - ((MEMORY[0x1895F8858](v22, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v36 = _os_log_pack_fill();
      uint64_t v37 = v12 - 1;
      double v38 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v36,  (uint64_t)"-[NSOrderedSet initWithArray:range:copyItems:]",  location,  length,  v37);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v38,  "-[NSOrderedSet initWithArray:range:copyItems:]",  location,  length,  v37);
    }

    else
    {
      uint64_t v22 = _os_log_pack_size();
      uint64_t v24 = (char *)v39 - ((MEMORY[0x1895F8858](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v25 = _os_log_pack_fill();
      double v26 = __os_log_helper_1_2_3_8_32_8_0_8_0( v25,  (uint64_t)"-[NSOrderedSet initWithArray:range:copyItems:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v26,  "-[NSOrderedSet initWithArray:range:copyItems:]",  location,  length);
    }

    uint64_t v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v24,  v22);
    objc_exception_throw(v27);
    goto LABEL_27;
  }

  if (length >> 60)
  {
    CFStringRef v28 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  length);
    CFAllocatorRef v29 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v28,  0LL);
    CFRelease(v28);
    objc_exception_throw(v29);
  }

  if (length <= 1) {
    uint64_t v13 = 1LL;
  }
  else {
    uint64_t v13 = length;
  }
  unint64_t v14 = MEMORY[0x1895F8858](v13, v11);
  uint64_t v16 = (id *)((char *)v39 - v15);
  if (length >= 0x101)
  {
    uint64_t v16 = (id *)_CFCreateArrayStorage(v14, 0, v39);
    uint64_t v17 = v16;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  -[NSArray getObjects:range:](set, "getObjects:range:", v16, location, length);
  if (!length) {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v18 = v16;
    NSUInteger v19 = length;
    do
    {
      id *v18 = (id)[*v18 copyWithZone:0];
      ++v18;
      --v19;
    }

    while (v19);
  }

  uint64_t v20 = -[NSOrderedSet initWithObjects:count:](self, "initWithObjects:count:", v16, length);
  if (v5)
  {
    do
    {

      --length;
    }

    while (length);
  }

  free(v17);
  return v20;
}

- (NSOrderedSet)initWithArray:(id)a3 range:(_NSRange)a4
{
  return -[NSOrderedSet initWithArray:range:copyItems:]( self,  "initWithArray:range:copyItems:",  a3,  a4.location,  a4.length,  0LL);
}

- (NSOrderedSet)initWithArray:(NSArray *)set copyItems:(BOOL)flag
{
  return -[NSOrderedSet initWithArray:range:copyItems:]( self,  "initWithArray:range:copyItems:",  set,  0LL,  -[NSArray count](set, "count"),  flag);
}

- (NSOrderedSet)initWithArray:(NSArray *)array
{
  return -[NSOrderedSet initWithArray:range:copyItems:]( self,  "initWithArray:range:copyItems:",  array,  0LL,  -[NSArray count](array, "count"),  0LL);
}

- (NSOrderedSet)initWithObject:(id)object
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = object;
  return -[NSOrderedSet initWithObjects:count:](self, "initWithObjects:count:", v4, 1LL);
}

- (NSOrderedSet)initWithObjects:(id)firstObj
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  unint64_t v5 = 0LL;
  if (!firstObj) {
    goto LABEL_5;
  }
  va_copy(v20, va);
  do
  {
    int v6 = v20;
    v20 += 8;
    ++v5;
  }

  while (*v6);
  if (!(v5 >> 60))
  {
LABEL_5:
    if (v5 <= 1) {
      uint64_t v7 = 1LL;
    }
    else {
      uint64_t v7 = v5;
    }
    unint64_t v8 = MEMORY[0x1895F8858](v7, a2);
    NSUInteger v10 = (uint64_t *)((char *)&v18 - v9);
    if (v5 >= 0x101)
    {
      NSUInteger v10 = _CFCreateArrayStorage(v8, 0, &v19);
      va_copy(v20, va);
      void *v10 = firstObj;
      uint64_t v11 = v10;
    }

    else
    {
      uint64_t v11 = 0LL;
      if (!v5) {
        goto LABEL_15;
      }
      va_copy(v20, va);
      void *v10 = firstObj;
      if (v5 == 1) {
        goto LABEL_15;
      }
    }

    for (uint64_t i = 1LL; i != v5; ++i)
    {
      uint64_t v13 = v20;
      v20 += 8;
      v10[i] = *v13;
    }

- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set range:(NSRange)range copyItems:(BOOL)flag
{
  BOOL v5 = flag;
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v39[1] = *MEMORY[0x1895F89C0];
  if (set && (_NSIsNSOrderedSet((uint64_t)set) & 1) == 0)
  {
    uint64_t v30 = _os_log_pack_size();
    id v32 = (char *)v39 - ((MEMORY[0x1895F8858](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v33 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v33 = 136315138;
    *(void *)(v33 + 4) = "-[NSOrderedSet initWithOrderedSet:range:copyItems:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSOrderedSet initWithOrderedSet:range:copyItems:]");
    uint64_t v34 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v32,  v30);
    objc_exception_throw(v34);
LABEL_27:
    __break(1u);
    return result;
  }

  NSUInteger v10 = -[NSOrderedSet count](set, "count");
  NSUInteger v12 = v10;
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v10 < location + length)
  {
    if (v10)
    {
      uint64_t v22 = _os_log_pack_size();
      uint64_t v24 = (char *)v39 - ((MEMORY[0x1895F8858](v22, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v36 = _os_log_pack_fill();
      uint64_t v37 = v12 - 1;
      double v38 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v36,  (uint64_t)"-[NSOrderedSet initWithOrderedSet:range:copyItems:]",  location,  length,  v37);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v38,  "-[NSOrderedSet initWithOrderedSet:range:copyItems:]",  location,  length,  v37);
    }

    else
    {
      uint64_t v22 = _os_log_pack_size();
      uint64_t v24 = (char *)v39 - ((MEMORY[0x1895F8858](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v25 = _os_log_pack_fill();
      double v26 = __os_log_helper_1_2_3_8_32_8_0_8_0( v25,  (uint64_t)"-[NSOrderedSet initWithOrderedSet:range:copyItems:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v26,  "-[NSOrderedSet initWithOrderedSet:range:copyItems:]",  location,  length);
    }

    uint64_t v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v24,  v22);
    objc_exception_throw(v27);
    goto LABEL_27;
  }

  if (length >> 60)
  {
    CFStringRef v28 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  length);
    CFAllocatorRef v29 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v28,  0LL);
    CFRelease(v28);
    objc_exception_throw(v29);
  }

  if (length <= 1) {
    uint64_t v13 = 1LL;
  }
  else {
    uint64_t v13 = length;
  }
  unint64_t v14 = MEMORY[0x1895F8858](v13, v11);
  CFStringRef v16 = (id *)((char *)v39 - v15);
  if (length >= 0x101)
  {
    CFStringRef v16 = (id *)_CFCreateArrayStorage(v14, 0, v39);
    uint64_t v17 = v16;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  -[NSOrderedSet getObjects:range:](set, "getObjects:range:", v16, location, length);
  if (!length) {
    BOOL v5 = 0;
  }
  if (v5)
  {
    uint64_t v18 = v16;
    NSUInteger v19 = length;
    do
    {
      id *v18 = (id)[*v18 copyWithZone:0];
      ++v18;
      --v19;
    }

    while (v19);
  }

  va_list v20 = -[NSOrderedSet initWithObjects:count:](self, "initWithObjects:count:", v16, length);
  if (v5)
  {
    do
    {

      --length;
    }

    while (length);
  }

  free(v17);
  return v20;
}

- (NSOrderedSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return -[NSOrderedSet initWithOrderedSet:range:copyItems:]( self,  "initWithOrderedSet:range:copyItems:",  a3,  a4.location,  a4.length,  0LL);
}

- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set copyItems:(BOOL)flag
{
  return -[NSOrderedSet initWithOrderedSet:range:copyItems:]( self,  "initWithOrderedSet:range:copyItems:",  set,  0LL,  -[NSOrderedSet count](set, "count"),  flag);
}

- (NSOrderedSet)initWithOrderedSet:(NSOrderedSet *)set
{
  return -[NSOrderedSet initWithOrderedSet:range:copyItems:]( self,  "initWithOrderedSet:range:copyItems:",  set,  0LL,  -[NSOrderedSet count](set, "count"),  0LL);
}

- (NSOrderedSet)initWithSet:(NSSet *)set copyItems:(BOOL)flag
{
  BOOL v4 = flag;
  v25[1] = *MEMORY[0x1895F89C0];
  if (set && (_NSIsNSSet((uint64_t)set) & 1) == 0)
  {
    uint64_t v20 = _os_log_pack_size();
    uint64_t v22 = (char *)v25 - ((MEMORY[0x1895F8858](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315138;
    *(void *)(v23 + 4) = "-[NSOrderedSet initWithSet:copyItems:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSOrderedSet initWithSet:copyItems:]");
    uint64_t v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v22,  v20);
    objc_exception_throw(v24);
    __break(1u);
  }

  else
  {
    NSUInteger v7 = -[NSSet count](set, "count");
    unint64_t v9 = v7;
    if (v7 >> 60)
    {
      CFStringRef v18 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v7);
      NSUInteger v19 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v18,  0LL);
      CFRelease(v18);
      objc_exception_throw(v19);
    }

    if (v7 <= 1) {
      NSUInteger v7 = 1LL;
    }
    unint64_t v10 = MEMORY[0x1895F8858](v7, v8);
    NSUInteger v12 = (id *)((char *)v25 - v11);
    if (v9 >= 0x101)
    {
      NSUInteger v12 = (id *)_CFCreateArrayStorage(v10, 0, v25);
      uint64_t v13 = v12;
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    -[NSSet getObjects:count:](set, "getObjects:count:", v12, v9);
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

    CFStringRef v16 = -[NSOrderedSet initWithObjects:count:](self, "initWithObjects:count:", v12, v9);
    if (v4)
    {
      do
      {

        --v9;
      }

      while (v9);
    }

    free(v13);
    return v16;
  }

  return result;
}

- (NSOrderedSet)initWithSet:(NSSet *)set
{
  return -[NSOrderedSet initWithSet:copyItems:](self, "initWithSet:copyItems:", set, 0LL);
}

+ (NSOrderedSet)orderedSetWithObjects:(id *)objects count:(NSUInteger)cnt
{
  return (NSOrderedSet *)(id)[objc_alloc((Class)a1) initWithObjects:objects count:cnt];
}

+ (NSOrderedSet)orderedSetWithObject:(id)object
{
  return (NSOrderedSet *)(id)__createOrderedSet(objc_alloc((Class)a1), (uint64_t)object);
}

+ (NSOrderedSet)orderedSet
{
  return (NSOrderedSet *)(id)[objc_alloc((Class)a1) initWithObjects:0 count:0];
}

+ (NSOrderedSet)orderedSetWithObjects:(id)firstObj
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  unint64_t v5 = 0LL;
  if (!firstObj) {
    goto LABEL_5;
  }
  va_copy(v20, va);
  do
  {
    int v6 = v20;
    v20 += 8;
    ++v5;
  }

  while (*v6);
  if (!(v5 >> 60))
  {
LABEL_5:
    if (v5 <= 1) {
      uint64_t v7 = 1LL;
    }
    else {
      uint64_t v7 = v5;
    }
    unint64_t v8 = MEMORY[0x1895F8858](v7, a2);
    unint64_t v10 = (uint64_t *)((char *)&v18 - v9);
    if (v5 >= 0x101)
    {
      unint64_t v10 = _CFCreateArrayStorage(v8, 0, &v19);
      va_copy(v20, va);
      void *v10 = firstObj;
      uint64_t v11 = v10;
    }

    else
    {
      uint64_t v11 = 0LL;
      if (!v5) {
        goto LABEL_15;
      }
      va_copy(v20, va);
      void *v10 = firstObj;
      if (v5 == 1) {
        goto LABEL_15;
      }
    }

    for (uint64_t i = 1LL; i != v5; ++i)
    {
      uint64_t v13 = v20;
      v20 += 8;
      v10[i] = *v13;
    }

+ (NSOrderedSet)orderedSetWithArray:(NSArray *)array range:(NSRange)range copyItems:(BOOL)flag
{
  return (NSOrderedSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithArray:range:copyItems:",  array,  range.location,  range.length,  flag);
}

+ (NSOrderedSet)orderedSetWithArray:(id)a3 range:(_NSRange)a4
{
  return (NSOrderedSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithArray:range:copyItems:",  a3,  a4.location,  a4.length,  0);
}

+ (NSOrderedSet)orderedSetWithArray:(id)a3 copyItems:(BOOL)a4
{
  return (NSOrderedSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithArray:range:copyItems:",  a3,  0,  objc_msgSend(a3, "count"),  a4);
}

+ (NSOrderedSet)orderedSetWithArray:(NSArray *)array
{
  return (NSOrderedSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithArray:range:copyItems:",  array,  0,  -[NSArray count](array, "count"),  0);
}

+ (NSOrderedSet)orderedSetWithOrderedSet:(NSOrderedSet *)set range:(NSRange)range copyItems:(BOOL)flag
{
  return (NSOrderedSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithOrderedSet:range:copyItems:",  set,  range.location,  range.length,  flag);
}

+ (NSOrderedSet)orderedSetWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return (NSOrderedSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithOrderedSet:range:copyItems:",  a3,  a4.location,  a4.length,  0);
}

+ (NSOrderedSet)orderedSetWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  return (NSOrderedSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithOrderedSet:range:copyItems:",  a3,  0,  objc_msgSend(a3, "count"),  a4);
}

+ (NSOrderedSet)orderedSetWithOrderedSet:(NSOrderedSet *)set
{
  return (NSOrderedSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithOrderedSet:range:copyItems:",  set,  0,  -[NSOrderedSet count](set, "count"),  0);
}

+ (NSOrderedSet)orderedSetWithSet:(NSSet *)set copyItems:(BOOL)flag
{
  return (NSOrderedSet *)(id)[objc_alloc((Class)a1) initWithSet:set copyItems:flag];
}

+ (NSOrderedSet)orderedSetWithSet:(NSSet *)set
{
  return (NSOrderedSet *)(id)[objc_alloc((Class)a1) initWithSet:set copyItems:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  return -[NSOrderedSet initWithOrderedSet:range:copyItems:]( +[NSOrderedSet allocWithZone:](&OBJC_CLASS___NSOrderedSet, "allocWithZone:", a3),  "initWithOrderedSet:range:copyItems:",  self,  0LL,  -[NSOrderedSet count](self, "count"),  0LL);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  return -[NSOrderedSet initWithOrderedSet:range:copyItems:]( +[NSOrderedSet allocWithZone:](&OBJC_CLASS___NSMutableOrderedSet, "allocWithZone:", a3),  "initWithOrderedSet:range:copyItems:",  self,  0LL,  -[NSOrderedSet count](self, "count"),  0LL);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSOrderedSet)initWithCoder:(NSCoder *)aDecoder
{
  return 0LL;
}

- (NSUInteger)count
{
  uint64_t v2 = __CFLookUpClass("NSOrderedSet");
  OUTLINED_FUNCTION_0_30(v2);
  OUTLINED_FUNCTION_1_20();
  return result;
}

- (NSUInteger)indexOfObject:(id)object
{
  uint64_t v3 = __CFLookUpClass("NSOrderedSet");
  OUTLINED_FUNCTION_0_30(v3);
  OUTLINED_FUNCTION_1_20();
  return result;
}

- (id)objectAtIndex:(NSUInteger)idx
{
  uint64_t v3 = __CFLookUpClass("NSOrderedSet");
  OUTLINED_FUNCTION_0_30(v3);
  OUTLINED_FUNCTION_1_20();
  return result;
}

- (NSOrderedSet)initWithObjects:(id *)objects count:(NSUInteger)cnt
{
  BOOL v4 = __CFLookUpClass("NSOrderedSet");
  OUTLINED_FUNCTION_0_30(v4);
  OUTLINED_FUNCTION_1_20();
  return result;
}

@end