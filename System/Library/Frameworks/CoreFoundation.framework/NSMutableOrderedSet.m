@interface NSMutableOrderedSet
+ (NSMutableOrderedSet)orderedSetWithCapacity:(NSUInteger)numItems;
- (Class)classForCoder;
- (NSMutableOrderedSet)initWithCapacity:(NSUInteger)numItems;
- (NSMutableOrderedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (void)addObject:(id)object;
- (void)addObjects:(id *)objects count:(NSUInteger)count;
- (void)addObjectsFromArray:(NSArray *)array;
- (void)addObjectsFromArray:(id)a3 range:(_NSRange)a4;
- (void)addObjectsFromOrderedSet:(id)a3;
- (void)addObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4;
- (void)addObjectsFromSet:(id)a3;
- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
- (void)insertObject:(id)object atIndex:(NSUInteger)idx;
- (void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;
- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)insertObjectsFromArray:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjectsFromArray:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5;
- (void)insertObjectsFromOrderedSet:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5;
- (void)insertObjectsFromSet:(id)a3 atIndex:(unint64_t)a4;
- (void)intersectOrderedSet:(NSOrderedSet *)other;
- (void)intersectSet:(NSSet *)other;
- (void)minusOrderedSet:(NSOrderedSet *)other;
- (void)minusSet:(NSSet *)other;
- (void)moveObjectsAtIndexes:(NSIndexSet *)indexes toIndex:(NSUInteger)idx;
- (void)removeAllObjects;
- (void)removeFirstObject;
- (void)removeLastObject;
- (void)removeObject:(id)a3 inRange:(_NSRange)a4;
- (void)removeObject:(id)object;
- (void)removeObjectAtIndex:(NSUInteger)idx;
- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes;
- (void)removeObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (void)removeObjectsInArray:(NSArray *)array;
- (void)removeObjectsInArray:(id)a3 range:(_NSRange)a4;
- (void)removeObjectsInOrderedSet:(id)a3;
- (void)removeObjectsInOrderedSet:(id)a3 range:(_NSRange)a4;
- (void)removeObjectsInRange:(NSRange)range;
- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4;
- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4 range:(_NSRange)a5;
- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4;
- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4 range:(_NSRange)a5;
- (void)removeObjectsInRange:(_NSRange)a3 inSet:(id)a4;
- (void)removeObjectsInSet:(id)a3;
- (void)removeObjectsPassingTest:(id)a3;
- (void)removeObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)replaceObject:(id)a3;
- (void)replaceObject:(id)a3 inRange:(_NSRange)a4;
- (void)replaceObjectAtIndex:(NSUInteger)idx withObject:(id)object;
- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects;
- (void)replaceObjectsInRange:(NSRange)range withObjects:(id *)objects count:(NSUInteger)count;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromArray:(id)a4;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromArray:(id)a4 range:(_NSRange)a5;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4 range:(_NSRange)a5;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromSet:(id)a4;
- (void)setArray:(id)a3;
- (void)setObject:(id)a3;
- (void)setObject:(id)obj atIndex:(NSUInteger)idx;
- (void)setOrderedSet:(id)a3;
- (void)setSet:(id)a3;
- (void)sortRange:(NSRange)range options:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
- (void)sortUsingComparator:(NSComparator)cmptr;
- (void)sortWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
- (void)unionOrderedSet:(NSOrderedSet *)other;
- (void)unionSet:(NSSet *)other;
@end

@implementation NSMutableOrderedSet

- (void)addObject:(id)object
{
  v9[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (object) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSMutableOrderedSet addObject:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableOrderedSet addObject:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
    objc_exception_throw(v8);
  }

  if (!object) {
    goto LABEL_5;
  }
LABEL_3:
  -[NSMutableOrderedSet insertObject:atIndex:]( self,  "insertObject:atIndex:",  object,  -[NSOrderedSet count](self, "count"));
}

- (void)addObjects:(id *)objects count:(NSUInteger)count
{
  v16[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (objects) {
      goto LABEL_4;
    }
  }

  else if (objects)
  {
    goto LABEL_4;
  }

  if (count)
  {
LABEL_13:
    uint64_t v11 = _os_log_pack_size();
    v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[NSMutableOrderedSet addObjects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = count;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSMutableOrderedSet addObjects:count:]",  count);
    goto LABEL_15;
  }

- (void)addObjectsFromArray:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  uint64_t location = a4.location;
  v23[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t location = _os_log_pack_size();
    NSUInteger length = (NSUInteger)v23 - ((location + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSMutableOrderedSet addObjectsFromArray:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableOrderedSet addObjectsFromArray:range:]");
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  length,  location);
    objc_exception_throw(v15);
LABEL_13:
    unint64_t v16 = v9;
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v17,  (uint64_t)"-[NSMutableOrderedSet addObjectsFromArray:range:]",  location,  length,  --v16);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v18,  "-[NSMutableOrderedSet addObjectsFromArray:range:]",  location,  length,  v16);
    goto LABEL_14;
  }

- (void)addObjectsFromArray:(NSArray *)array
{
  v14[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!array) {
      goto LABEL_4;
    }
  }

  else if (!array)
  {
LABEL_4:
    -[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]( self,  "insertObjectsFromArray:range:atIndex:",  array,  0LL,  -[NSArray count](array, "count"),  -[NSOrderedSet count](self, "count"));
    return;
  }

  uint64_t v6 = _os_log_pack_size();
  uint64_t v8 = (char *)v14 - ((MEMORY[0x1895F8858](v6, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v9 = 136315138;
  *(void *)(v9 + 4) = "-[NSMutableOrderedSet addObjectsFromArray:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableOrderedSet addObjectsFromArray:]");
  uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v8,  v6);
  objc_exception_throw(v10);
  -[NSMutableOrderedSet addObjectsFromOrderedSet:range:](v11, v12, v13, v15);
}

- (void)addObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  uint64_t location = a4.location;
  v23[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t location = _os_log_pack_size();
    NSUInteger length = (NSUInteger)v23 - ((location + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]");
    _NSRange v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  length,  location);
    objc_exception_throw(v15);
LABEL_13:
    unint64_t v16 = v9;
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v17,  (uint64_t)"-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]",  location,  length,  --v16);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v18,  "-[NSMutableOrderedSet addObjectsFromOrderedSet:range:]",  location,  length,  v16);
    goto LABEL_14;
  }

- (void)addObjectsFromOrderedSet:(id)a3
{
  v14[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
LABEL_4:
    -[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]( self,  "insertObjectsFromOrderedSet:range:atIndex:",  a3,  0,  [a3 count],  -[NSOrderedSet count](self, "count"));
    return;
  }

  uint64_t v6 = _os_log_pack_size();
  uint64_t v8 = (char *)v14 - ((MEMORY[0x1895F8858](v6, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v9 = 136315138;
  *(void *)(v9 + 4) = "-[NSMutableOrderedSet addObjectsFromOrderedSet:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableOrderedSet addObjectsFromOrderedSet:]");
  uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v8,  v6);
  objc_exception_throw(v10);
  -[NSMutableOrderedSet addObjectsFromSet:](v11, v12, v13);
}

- (void)addObjectsFromSet:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
LABEL_4:
    -[NSMutableOrderedSet insertObjectsFromSet:atIndex:]( self,  "insertObjectsFromSet:atIndex:",  a3,  -[NSOrderedSet count](self, "count"));
    return;
  }

  uint64_t v6 = _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v7 = 136315138;
  *(void *)(v7 + 4) = "-[NSMutableOrderedSet addObjectsFromSet:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableOrderedSet addObjectsFromSet:]");
  uint64_t v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
  objc_exception_throw(v8);
  -[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:](v9, v10, v11, v12);
}

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2
{
  v34[1] = *(id *)MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v8 = -[NSOrderedSet count](self, "count");
  if ((idx1 & 0x8000000000000000LL) != 0 || v8 <= idx1)
  {
    if (v8)
    {
      NSUInteger v20 = v8;
      uint64_t v14 = _os_log_pack_size();
      _NSRange v15 = (char *)v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_3_8_32_8_0_8_0( v21,  (uint64_t)"-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]",  idx1,  --v20);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v22,  "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]",  idx1,  v20);
    }

    else
    {
      uint64_t v14 = _os_log_pack_size();
      _NSRange v15 = (char *)v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v16 = 136315394;
      *(void *)(v16 + 4) = "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v16 + 12) = 2048;
      *(void *)(v16 + 14) = idx1;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty ordered set",  "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]",  idx1);
    }

    uint64_t v23 = _CFAutoreleasePoolAddObject();
    v24 = v15;
    uint64_t v25 = v14;
    goto LABEL_22;
  }

  NSUInteger v9 = -[NSOrderedSet count](self, "count");
  if ((idx2 & 0x8000000000000000LL) != 0 || v9 <= idx2)
  {
    if (v9)
    {
      NSUInteger v26 = v9;
      uint64_t v17 = _os_log_pack_size();
      double v18 = (char *)v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v27 = _os_log_pack_fill();
      double v28 = __os_log_helper_1_2_3_8_32_8_0_8_0( v27,  (uint64_t)"-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]",  idx2,  --v26);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v28,  "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]",  idx2,  v26);
    }

    else
    {
      uint64_t v17 = _os_log_pack_size();
      double v18 = (char *)v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v19 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v19 = 136315394;
      *(void *)(v19 + 4) = "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v19 + 12) = 2048;
      *(void *)(v19 + 14) = idx2;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty ordered set",  "-[NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:]",  idx2);
    }

    uint64_t v23 = _CFAutoreleasePoolAddObject();
    v24 = v18;
    uint64_t v25 = v17;
LABEL_22:
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  v23,  0LL,  v24,  v25));
    -[NSMutableOrderedSet insertObjects:count:atIndex:](v29, v30, v31, v32, v33);
    return;
  }

  if (idx1 != idx2)
  {
    if (idx2 <= idx1) {
      NSUInteger v10 = idx1;
    }
    else {
      NSUInteger v10 = idx2;
    }
    if (idx2 >= idx1) {
      idx2 = idx1;
    }
    id v11 = -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", idx2);
    v34[0] = -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", v10);
    id v12 = v11;
    id v13 = v34[0];
    -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v10);
    -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", idx2, v34[0]);
    -[NSMutableOrderedSet insertObject:atIndex:](self, "insertObject:atIndex:", v11, v10);
  }

- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  v32[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (a3) {
      goto LABEL_4;
    }
  }

  else if (a3)
  {
    goto LABEL_4;
  }

  if (a4)
  {
LABEL_18:
    a5 = _os_log_pack_size();
    uint64_t v17 = (char *)v32 - ((a5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "-[NSMutableOrderedSet insertObjects:count:atIndex:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSMutableOrderedSet insertObjects:count:atIndex:]",  a4);
LABEL_20:
    NSUInteger v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v17,  a5);
    objc_exception_throw(v20);
    goto LABEL_21;
  }

- (void)insertObjectsFromArray:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v45[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v32 = _os_log_pack_size();
    v34 = (char *)v45 - ((MEMORY[0x1895F8858](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v35 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v35 = 136315138;
    *(void *)(v35 + 4) = "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableOrderedSet insertObjectsFromArray:range:atIndex:]");
    v36 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v34,  v32);
    objc_exception_throw(v36);
LABEL_29:
    __break(1u);
    return;
  }

- (void)insertObjectsFromArray:(id)a3 atIndex:(unint64_t)a4
{
  v33[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v24 = _os_log_pack_size();
    uint64_t v26 = (char *)v33 - ((MEMORY[0x1895F8858](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136315138;
    *(void *)(v27 + 4) = "-[NSMutableOrderedSet insertObjectsFromArray:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableOrderedSet insertObjectsFromArray:atIndex:]");
    uint64_t v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v26,  v24);
    objc_exception_throw(v28);
LABEL_21:
    __break(1u);
    return;
  }

- (void)insertObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v45[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v32 = _os_log_pack_size();
    v34 = (char *)v45 - ((MEMORY[0x1895F8858](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v35 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v35 = 136315138;
    *(void *)(v35 + 4) = "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableOrderedSet insertObjectsFromOrderedSet:range:atIndex:]");
    v36 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v34,  v32);
    objc_exception_throw(v36);
LABEL_29:
    __break(1u);
    return;
  }

- (void)insertObjectsFromOrderedSet:(id)a3 atIndex:(unint64_t)a4
{
  v33[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v24 = _os_log_pack_size();
    uint64_t v26 = (char *)v33 - ((MEMORY[0x1895F8858](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136315138;
    *(void *)(v27 + 4) = "-[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableOrderedSet insertObjectsFromOrderedSet:atIndex:]");
    uint64_t v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v26,  v24);
    objc_exception_throw(v28);
LABEL_21:
    __break(1u);
    return;
  }

- (void)insertObjectsFromSet:(id)a3 atIndex:(unint64_t)a4
{
  v33[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v24 = _os_log_pack_size();
    uint64_t v26 = (char *)v33 - ((MEMORY[0x1895F8858](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136315138;
    *(void *)(v27 + 4) = "-[NSMutableOrderedSet insertObjectsFromSet:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableOrderedSet insertObjectsFromSet:atIndex:]");
    uint64_t v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v26,  v24);
    objc_exception_throw(v28);
LABEL_21:
    __break(1u);
    return;
  }

- (void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
{
  v50[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (!objects) {
      goto LABEL_4;
    }
  }

  else if (!objects)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSArray((uint64_t)objects) & 1) == 0)
  {
    uint64_t v45 = _os_log_pack_size();
    v47 = (char *)v50 - ((MEMORY[0x1895F8858](v45, v46) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v48 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v48 = 136315138;
    *(void *)(v48 + 4) = "-[NSMutableOrderedSet insertObjects:atIndexes:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableOrderedSet insertObjects:atIndexes:]");
    v49 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v47,  v45);
    objc_exception_throw(v49);
    goto LABEL_33;
  }

- (void)intersectOrderedSet:(NSOrderedSet *)other
{
  unint64_t v4 = v3;
  uint64_t v36 = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other) {
      goto LABEL_4;
    }
  }

  else if (!other)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v20 = _os_log_pack_size();
    unint64_t v4 = &v29;
    CFStringRef v22 = (char *)&v29 - ((MEMORY[0x1895F8858](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315138;
    *(void *)(v23 + 4) = "-[NSMutableOrderedSet intersectOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableOrderedSet intersectOrderedSet:]");
    uint64_t v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v22,  v20);
    objc_exception_throw(v24);
    __break(1u);
    goto LABEL_28;
  }

- (void)intersectSet:(NSSet *)other
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other) {
      goto LABEL_4;
    }
  }

  else if (!other)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v20 = _os_log_pack_size();
    CFStringRef v22 = (char *)&v25 - ((MEMORY[0x1895F8858](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315138;
    *(void *)(v23 + 4) = "-[NSMutableOrderedSet intersectSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableOrderedSet intersectSet:]");
    uint64_t v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v22,  v20);
    objc_exception_throw(v24);
    __break(1u);
    return;
  }

- (void)moveObjectsAtIndexes:(NSIndexSet *)indexes toIndex:(NSUInteger)idx
{
  v50[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (indexes) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v23 = _os_log_pack_size();
    uint64_t v25 = (char *)v50 - ((MEMORY[0x1895F8858](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v26 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v26 = 136315138;
    *(void *)(v26 + 4) = "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]");
    uint64_t v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v25,  v23);
    objc_exception_throw(v27);
LABEL_30:
    __break(1u);
    return;
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  if (!indexes) {
    goto LABEL_17;
  }
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v28 = _os_log_pack_size();
    __int128 v30 = (char *)v50 - ((MEMORY[0x1895F8858](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136315138;
    *(void *)(v31 + 4) = "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]");
    uint64_t v32 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v30,  v28);
    objc_exception_throw(v32);
    goto LABEL_30;
  }

  NSUInteger v8 = -[NSOrderedSet count](self, "count");
  uint64_t v9 = [0 count];
  NSUInteger v10 = -[NSIndexSet lastIndex](indexes, "lastIndex");
  if ((v10 & 0x8000000000000000LL) != 0)
  {
    uint64_t v33 = v10;
    NSUInteger v11 = v9 + v8;
LABEL_21:
    uint64_t v34 = _os_log_pack_size();
    uint64_t v36 = (char *)v50 - ((MEMORY[0x1895F8858](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v37 = _os_log_pack_fill();
    if (v11)
    {
      double v39 = __os_log_helper_1_2_3_8_32_8_0_8_0( v37,  (uint64_t)"-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]",  v33,  v11 - 1);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu in index set beyond bounds [0 .. %lu]",  v39,  "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]",  v33,  v11 - 1);
    }

    else
    {
      *(_DWORD *)uint64_t v37 = 136315394;
      *(void *)(v37 + 4) = "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]";
      *(_WORD *)(v37 + 12) = 2048;
      *(void *)(v37 + 14) = v33;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu in index set beyond bounds for empty ordered set",  "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]",  v33);
    }

    uint64_t v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v36,  v34);
    objc_exception_throw(v38);
    goto LABEL_30;
  }

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v11 = v9 + v8;
    if (v11 <= v10)
    {
      uint64_t v33 = v10;
      goto LABEL_21;
    }
  }

  NSUInteger v12 = -[NSOrderedSet count](self, "count");
  NSUInteger v13 = -[NSIndexSet countOfIndexesInRange:](indexes, "countOfIndexesInRange:", 0LL, idx);
  NSUInteger v14 = v12 - v13;
  if ((idx & 0x8000000000000000LL) != 0 || v14 < idx)
  {
    if (v12 == v13)
    {
      uint64_t v40 = _os_log_pack_size();
      double v42 = (char *)v50 - ((MEMORY[0x1895F8858](v40, v41) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v43 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v43 = 136315394;
      *(void *)(v43 + 4) = "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]";
      *(_WORD *)(v43 + 12) = 2048;
      *(void *)(v43 + 14) = idx;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty ordered set",  "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]",  idx);
    }

    else
    {
      uint64_t v40 = _os_log_pack_size();
      double v42 = (char *)v50 - ((MEMORY[0x1895F8858](v40, v47) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v48 = _os_log_pack_fill();
      double v49 = __os_log_helper_1_2_3_8_32_8_0_8_0( v48,  (uint64_t)"-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]",  idx,  v14 - 1);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v49,  "-[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:]",  idx,  v14 - 1);
    }

    double v44 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v42,  v40);
    objc_exception_throw(v44);
    goto LABEL_30;
  }

  uint64_t v15 = -[NSOrderedSet objectsAtIndexes:](self, "objectsAtIndexes:", indexes);
  -[NSMutableOrderedSet removeObjectsAtIndexes:](self, "removeObjectsAtIndexes:", indexes);
  unint64_t v16 = -[NSArray count](v15, "count");
  unint64_t v18 = v16;
  if (v16 >> 60)
  {
    CFStringRef v45 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v16);
    uint64_t v46 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v45,  0LL);
    CFRelease(v45);
    objc_exception_throw(v46);
  }

  if (v16 <= 1) {
    unint64_t v16 = 1LL;
  }
  unint64_t v19 = MEMORY[0x1895F8858](v16, v17);
  uint64_t v21 = (char *)v50 - v20;
  if (v18 >= 0x101)
  {
    uint64_t v21 = (char *)_CFCreateArrayStorage(v19, 0, v50);
    CFStringRef v22 = v21;
  }

  else
  {
    CFStringRef v22 = 0LL;
  }

  -[NSArray getObjects:range:](v15, "getObjects:range:", v21, 0LL, v18);
  -[NSMutableOrderedSet insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", v21, v18, idx);
  free(v22);
}

- (void)minusOrderedSet:(NSOrderedSet *)other
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other) {
      goto LABEL_4;
    }
  }

  else if (!other)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSMutableOrderedSet minusOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableOrderedSet minusOrderedSet:]");
    uint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v19[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v13);
    objc_exception_throw(v15);
    -[NSMutableOrderedSet minusSet:](v16, v17, v18);
    return;
  }

- (void)minusSet:(NSSet *)other
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other) {
      goto LABEL_4;
    }
  }

  else if (!other)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSMutableOrderedSet minusSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableOrderedSet minusSet:]");
    uint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v18[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v13);
    objc_exception_throw(v15);
    -[NSMutableOrderedSet removeAllObjects](v16, v17);
    return;
  }

- (void)removeAllObjects
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v4 = -[NSOrderedSet count](self, "count");
  if (v4)
  {
    NSUInteger v5 = v4 - 1;
    do
      -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v5--);
    while (v5 != -1LL);
  }

- (void)removeFirstObject
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  if (-[NSOrderedSet count](self, "count")) {
    -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", 0LL);
  }
}

- (void)removeLastObject
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v4 = -[NSOrderedSet count](self, "count");
  if (v4) {
    -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v4 - 1);
  }
}

- (void)removeObjectsInRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v19[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v7 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v7 < location + length)
  {
    if (v7)
    {
      NSUInteger v12 = v7;
      uint64_t v8 = _os_log_pack_size();
      uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v13,  (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:]",  location,  length,  --v12);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v14,  "-[NSMutableOrderedSet removeObjectsInRange:]",  location,  length,  v12);
    }

    else
    {
      uint64_t v8 = _os_log_pack_size();
      uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v10 = _os_log_pack_fill();
      double v11 = __os_log_helper_1_2_3_8_32_8_0_8_0( v10,  (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v11,  "-[NSMutableOrderedSet removeObjectsInRange:]",  location,  length);
    }

    uint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v8);
    objc_exception_throw(v15);
    -[NSMutableOrderedSet removeObject:inRange:](v16, v17, v18, v20);
  }

  else
  {
    for (; length; --length)
      -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", location);
  }

- (void)removeObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v22[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v9 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v9 < location + length)
  {
    if (v9)
    {
      NSUInteger v15 = v9;
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v16,  (uint64_t)"-[NSMutableOrderedSet removeObject:inRange:]",  location,  length,  --v15);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v17,  "-[NSMutableOrderedSet removeObject:inRange:]",  location,  length,  v15);
    }

    else
    {
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0( v13,  (uint64_t)"-[NSMutableOrderedSet removeObject:inRange:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v14,  "-[NSMutableOrderedSet removeObject:inRange:]",  location,  length);
    }

    id v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
    objc_exception_throw(v18);
    -[NSMutableOrderedSet removeObject:](v19, v20, v21);
  }

  else
  {
    unint64_t v10 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, location, length);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
      -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v10);
    }
  }

- (void)removeObject:(id)object
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v6 = -[NSOrderedSet indexOfObject:](self, "indexOfObject:", object);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v6);
  }
}

- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes
{
  v30[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (indexes) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v14 = _os_log_pack_size();
    NSUInteger v7 = v30;
    NSUInteger v15 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSMutableOrderedSet removeObjectsAtIndexes:]");
LABEL_14:
    id v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v15,  v14);
    objc_exception_throw(v18);
    goto LABEL_15;
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  if (!indexes) {
    goto LABEL_12;
  }
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    NSUInteger v7 = v30;
    NSUInteger v15 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSMutableOrderedSet removeObjectsAtIndexes:]");
    goto LABEL_14;
  }

  NSUInteger v7 = -[NSOrderedSet count](self, "count");
  uint64_t v3 = [0 count];
  NSUInteger v8 = -[NSIndexSet lastIndex](indexes, "lastIndex");
  if ((v8 & 0x8000000000000000LL) != 0)
  {
LABEL_15:
    uint64_t v19 = v8;
    NSUInteger v9 = (char *)v7 + v3;
    goto LABEL_17;
  }

  if (v8 == 0x7FFFFFFFFFFFFFFFLL || (NSUInteger v9 = (char *)v7 + v3, (unint64_t)v9 > v8))
  {
    uint64_t v10 = -[NSIndexSet rangeCount](indexes, "rangeCount");
    if (v10)
    {
      uint64_t v11 = v10 - 1;
      do
      {
        uint64_t v12 = -[NSIndexSet rangeAtIndex:](indexes, "rangeAtIndex:", v11);
        -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", v12, v13);
        --v11;
      }

      while (v11 != -1);
    }

    return;
  }

  uint64_t v19 = v8;
LABEL_17:
  if (v9)
  {
    uint64_t v20 = _os_log_pack_size();
    id v21 = (char *)v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v23 = _os_log_pack_fill();
    uint64_t v24 = (uint64_t)(v9 - 1);
    double v25 = __os_log_helper_1_2_3_8_32_8_0_8_0(v23, (uint64_t)"-[NSMutableOrderedSet removeObjectsAtIndexes:]", v19, v24);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu in index set beyond bounds [0 .. %lu]",  v25,  "-[NSMutableOrderedSet removeObjectsAtIndexes:]",  v19,  v24);
  }

  else
  {
    uint64_t v20 = _os_log_pack_size();
    id v21 = (char *)v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315394;
    *(void *)(v22 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:]";
    *(_WORD *)(v22 + 12) = 2048;
    *(void *)(v22 + 14) = v19;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu in index set beyond bounds for empty ordered set",  "-[NSMutableOrderedSet removeObjectsAtIndexes:]",  v19);
  }

  uint64_t v26 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v21,  v20);
  objc_exception_throw(v26);
  -[NSMutableOrderedSet removeObjectsInRange:inArray:range:](v27, v28, v31, v29, v32);
}

- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  v38[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v12 = -[NSOrderedSet count](self, "count");
  if ((v10 & 0x8000000000000000LL) != 0 || (v9 & 0x8000000000000000LL) != 0 || v12 < v10 + v9)
  {
    if (!v12)
    {
      uint64_t v15 = _os_log_pack_size();
      uint64_t v16 = (char *)v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_3_8_32_8_0_8_0( v17,  (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]",  v10,  v9);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v18,  "-[NSMutableOrderedSet removeObjectsInRange:inArray:range:]",  v10,  v9);
LABEL_22:
      uint64_t v29 = _CFAutoreleasePoolAddObject();
      __int128 v30 = v16;
      uint64_t v31 = v15;
LABEL_25:
      objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  v29,  0LL,  v30,  v31));
      -[NSMutableOrderedSet removeObjectsInRange:inArray:](v35, v36, v39, v37);
      return;
    }

- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4
{
  NSUInteger length = a3.length;
  uint64_t location = a3.location;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v9 = -[NSOrderedSet count](self, "count");
  NSUInteger v10 = v9;
  if (location < 0 || (length & 0x8000000000000000LL) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      uint64_t v16 = _os_log_pack_size();
      uint64_t v17 = &v29[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
      uint64_t v18 = _os_log_pack_fill();
      double v19 = __os_log_helper_1_2_3_8_32_8_0_8_0( v18,  (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inArray:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v19,  "-[NSMutableOrderedSet removeObjectsInRange:inArray:]",  location,  length);
LABEL_22:
      double v25 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v17,  v16);
      objc_exception_throw(v25);
      -[NSMutableOrderedSet removeObjectsInArray:range:](v26, v27, v28, v35);
      return;
    }

- (void)removeObjectsInArray:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  uint64_t location = a4.location;
  v24[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t location = _os_log_pack_size();
    NSUInteger length = (NSUInteger)v24 - ((location + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSMutableOrderedSet removeObjectsInArray:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableOrderedSet removeObjectsInArray:range:]");
    uint64_t v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  length,  location);
    objc_exception_throw(v16);
    goto LABEL_17;
  }

- (void)removeObjectsInArray:(NSArray *)array
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!array) {
      goto LABEL_4;
    }
  }

  else if (!array)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSArray((uint64_t)array) & 1) == 0)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSMutableOrderedSet removeObjectsInArray:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableOrderedSet removeObjectsInArray:]");
    uint64_t v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v17[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v11);
    objc_exception_throw(v13);
    -[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:](v14, v15, v23, v16, v24);
    return;
  }

- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  v48[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v12 = -[NSOrderedSet count](self, "count");
  NSUInteger v13 = v12;
  if ((v10 & 0x8000000000000000LL) != 0 || (v9 & 0x8000000000000000LL) != 0 || v12 < v10 + v9)
  {
    if (v12)
    {
      uint64_t v23 = _os_log_pack_size();
      double v25 = (char *)v48 - ((MEMORY[0x1895F8858](v23, v42) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v43 = _os_log_pack_fill();
      double v44 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v43,  (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]",  v10,  v9,  v13 - 1);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v44,  "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]",  v10,  v9,  v13 - 1);
    }

    else
    {
      uint64_t v23 = _os_log_pack_size();
      double v25 = (char *)v48 - ((MEMORY[0x1895F8858](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v26 = _os_log_pack_fill();
      double v27 = __os_log_helper_1_2_3_8_32_8_0_8_0( v26,  (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]",  v10,  v9);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v27,  "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]",  v10,  v9);
    }

    id v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v25,  v23);
    objc_exception_throw(v28);
    goto LABEL_33;
  }

  if (a4 && (_NSIsNSOrderedSet((uint64_t)a4) & 1) == 0)
  {
    uint64_t v37 = _os_log_pack_size();
    _NSRange v39 = (char *)v48 - ((MEMORY[0x1895F8858](v37, v38) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v40 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v40 = 136315138;
    *(void *)(v40 + 4) = "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]");
    uint64_t v41 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v39,  v37);
    objc_exception_throw(v41);
LABEL_33:
    __break(1u);
    return;
  }

  unint64_t v14 = [a4 count];
  unint64_t v16 = v14;
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v14 < location + length)
  {
    if (v14)
    {
      uint64_t v29 = _os_log_pack_size();
      __int128 v31 = (char *)v48 - ((MEMORY[0x1895F8858](v29, v45) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v46 = _os_log_pack_fill();
      double v47 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v46,  (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]",  location,  length,  v16 - 1);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v47,  "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]",  location,  length,  v16 - 1);
    }

    else
    {
      uint64_t v29 = _os_log_pack_size();
      __int128 v31 = (char *)v48 - ((MEMORY[0x1895F8858](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v32 = _os_log_pack_fill();
      double v33 = __os_log_helper_1_2_3_8_32_8_0_8_0( v32,  (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v33,  "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]",  location,  length);
    }

    uint64_t v34 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v31,  v29);
    objc_exception_throw(v34);
    goto LABEL_33;
  }

  if (length >> 60)
  {
    CFStringRef v35 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  length);
    SEL v36 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v35,  0LL);
    CFRelease(v35);
    objc_exception_throw(v36);
  }

  if (length <= 1) {
    uint64_t v17 = 1LL;
  }
  else {
    uint64_t v17 = length;
  }
  unint64_t v18 = MEMORY[0x1895F8858](v17, v15);
  __int128 v20 = (size_t *)((char *)v48 - v19);
  if (length >= 0x101)
  {
    __int128 v20 = _CFCreateArrayStorage(v18, 0, v48);
    __int128 v21 = v20;
  }

  else
  {
    __int128 v21 = 0LL;
  }

  objc_msgSend(a4, "getObjects:range:", v20, location, length);
  for (; length; --length)
  {
    unint64_t v22 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", *v20, v10, v9);
    if (v22 != 0x7FFFFFFFFFFFFFFFLL) {
      -[NSMutableOrderedSet removeObjectAtIndex:](self, "removeObjectAtIndex:", v22);
    }
    ++v20;
  }

  free(v21);
}

- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4
{
  NSUInteger length = a3.length;
  uint64_t location = a3.location;
  v26[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v9 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000LL) == 0 && (length & 0x8000000000000000LL) == 0 && v9 >= location + length)
  {
    if (!a4 || (_NSIsNSOrderedSet((uint64_t)a4) & 1) != 0)
    {
      -[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]( self,  "removeObjectsInRange:inOrderedSet:range:",  location,  length,  a4,  0,  [a4 count]);
      return;
    }

    uint64_t location = _os_log_pack_size();
    NSUInteger length = (NSUInteger)v26 - ((MEMORY[0x1895F8858](location, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]");
    uint64_t v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  length,  location);
    objc_exception_throw(v17);
    goto LABEL_12;
  }

  if (v9)
  {
LABEL_12:
    NSUInteger v18 = v9;
    uint64_t v10 = _os_log_pack_size();
    NSUInteger v12 = (char *)v26 - ((MEMORY[0x1895F8858](v10, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v20 = _os_log_pack_fill();
    double v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v20,  (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]",  location,  length,  --v18);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v21,  "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]",  location,  length,  v18);
    goto LABEL_13;
  }

  uint64_t v10 = _os_log_pack_size();
  NSUInteger v12 = (char *)v26 - ((MEMORY[0x1895F8858](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = _os_log_pack_fill();
  double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0( v13,  (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]",  location,  length);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v14,  "-[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:]",  location,  length);
LABEL_13:
  unint64_t v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v10);
  objc_exception_throw(v22);
  -[NSMutableOrderedSet removeObjectsInOrderedSet:range:](v23, v24, v25, v27);
}

- (void)removeObjectsInOrderedSet:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  uint64_t location = a4.location;
  v26[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t location = _os_log_pack_size();
    NSUInteger length = (NSUInteger)v26 - ((MEMORY[0x1895F8858](location, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]");
    uint64_t v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  length,  location);
    objc_exception_throw(v17);
LABEL_13:
    unint64_t v18 = v9;
    uint64_t v10 = _os_log_pack_size();
    NSUInteger v12 = (char *)v26 - ((MEMORY[0x1895F8858](v10, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v20 = _os_log_pack_fill();
    double v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v20,  (uint64_t)"-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]",  location,  length,  --v18);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v21,  "-[NSMutableOrderedSet removeObjectsInOrderedSet:range:]",  location,  length,  v18);
    goto LABEL_14;
  }

- (void)removeObjectsInOrderedSet:(id)a3
{
  v14[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
LABEL_4:
    -[NSMutableOrderedSet removeObjectsInRange:inOrderedSet:range:]( self,  "removeObjectsInRange:inOrderedSet:range:",  0,  -[NSOrderedSet count](self, "count"),  a3,  0,  [a3 count]);
    return;
  }

  uint64_t v6 = _os_log_pack_size();
  uint64_t v8 = (char *)v14 - ((MEMORY[0x1895F8858](v6, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v9 = 136315138;
  *(void *)(v9 + 4) = "-[NSMutableOrderedSet removeObjectsInOrderedSet:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableOrderedSet removeObjectsInOrderedSet:]");
  uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v8,  v6);
  objc_exception_throw(v10);
  -[NSMutableOrderedSet removeObjectsInRange:inSet:](v11, v12, v15, v13);
}

- (void)removeObjectsInRange:(_NSRange)a3 inSet:(id)a4
{
  NSUInteger length = a3.length;
  uint64_t location = a3.location;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v9 = -[NSOrderedSet count](self, "count");
  NSUInteger v10 = v9;
  if (location < 0 || (length & 0x8000000000000000LL) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      uint64_t v16 = _os_log_pack_size();
      uint64_t v17 = &v29[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
      uint64_t v18 = _os_log_pack_fill();
      double v19 = __os_log_helper_1_2_3_8_32_8_0_8_0( v18,  (uint64_t)"-[NSMutableOrderedSet removeObjectsInRange:inSet:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v19,  "-[NSMutableOrderedSet removeObjectsInRange:inSet:]",  location,  length);
LABEL_22:
      id v25 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v17,  v16);
      objc_exception_throw(v25);
      -[NSMutableOrderedSet removeObjectsInSet:](v26, v27, v28);
      return;
    }

- (void)removeObjectsInSet:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSMutableOrderedSet removeObjectsInSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableOrderedSet removeObjectsInSet:]");
    uint64_t v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v11);
    objc_exception_throw(v13);
    -[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:](v14, v15, v16, v17, v18);
    return;
  }

- (void)removeObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  v24[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v18 = _os_log_pack_size();
    double v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]");
    goto LABEL_15;
  }

  __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
  if (!a3) {
    goto LABEL_12;
  }
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v18 = _os_log_pack_size();
    double v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315138;
    *(void *)(v21 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]");
    goto LABEL_15;
  }

  if (!a5)
  {
    uint64_t v18 = _os_log_pack_size();
    double v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)(v22 + 4) = "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSMutableOrderedSet removeObjectsAtIndexes:options:passingTest:]");
LABEL_15:
    __int128 v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v19,  v18);
    objc_exception_throw(v23);
  }

  unint64_t v11 = a4 & 0xAFFFFFFFFFFFFFFELL;
  if ((a4 & 2) == 0) {
    unint64_t v11 = a4;
  }
  uint64_t v12 = v11 | 0x5000000000000000LL;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)a5, v11 | 0x5000000000000000LL, a3);
  id IndexesPassingTest = __NSOrderedSetGetIndexesPassingTest(self, (uint64_t)a5, v12, a3);
  uint64_t v14 = [IndexesPassingTest rangeCount];
  if (v14)
  {
    uint64_t v15 = v14 - 1;
    do
    {
      uint64_t v16 = [IndexesPassingTest rangeAtIndex:v15];
      -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", v16, v17);
      --v15;
    }

    while (v15 != -1);
  }

- (void)removeObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v19[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v16 = _os_log_pack_size();
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableOrderedSet removeObjectsWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSMutableOrderedSet removeObjectsWithOptions:passingTest:]");
    uint64_t v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v16);
    objc_exception_throw(v18);
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  if (!a4) {
    goto LABEL_10;
  }
LABEL_3:
  unint64_t v9 = a3 & 0xBFFFFFFFFFFFFFFELL;
  if ((a3 & 2) == 0) {
    unint64_t v9 = a3;
  }
  uint64_t v10 = v9 | 0x4000000000000000LL;
  __NSOrderedSetParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4, v9 | 0x4000000000000000LL, 0LL);
  id IndexesPassingTest = __NSOrderedSetGetIndexesPassingTest(self, (uint64_t)a4, v10, 0LL);
  uint64_t v12 = [IndexesPassingTest rangeCount];
  if (v12)
  {
    uint64_t v13 = v12 - 1;
    do
    {
      uint64_t v14 = [IndexesPassingTest rangeAtIndex:v13];
      -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", v14, v15);
      --v13;
    }

    while (v13 != -1);
  }

- (void)removeObjectsPassingTest:(id)a3
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSMutableOrderedSet removeObjectsPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSMutableOrderedSet removeObjectsPassingTest:]");
    uint64_t v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
    objc_exception_throw(v8);
  }

  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  -[NSMutableOrderedSet removeObjectsWithOptions:passingTest:](self, "removeObjectsWithOptions:passingTest:", 0LL, a3);
}

- (void)replaceObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  uint64_t location = a4.location;
  v24[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (a3) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t location = _os_log_pack_size();
    NSUInteger length = (NSUInteger)v24 - ((location + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableOrderedSet replaceObject:inRange:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableOrderedSet replaceObject:inRange:]");
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  length,  location);
    objc_exception_throw(v12);
    goto LABEL_10;
  }

  if (!a3) {
    goto LABEL_9;
  }
LABEL_3:
  NSUInteger v9 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000LL) == 0 && (length & 0x8000000000000000LL) == 0 && v9 >= location + length)
  {
    unint64_t v10 = -[NSOrderedSet indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, location, length);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
      -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v10, a3);
    }
    return;
  }

- (void)replaceObject:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSMutableOrderedSet replaceObject:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableOrderedSet replaceObject:]");
    NSUInteger v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  if (!a3) {
    goto LABEL_6;
  }
LABEL_3:
  NSUInteger v6 = -[NSOrderedSet indexOfObject:](self, "indexOfObject:", a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v6, a3);
  }
}

- (void)replaceObjectsInRange:(NSRange)range withObjects:(id *)objects count:(NSUInteger)count
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v37[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
  }
  NSUInteger v11 = -[NSOrderedSet count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v11 < location + length)
  {
LABEL_20:
    if (v11)
    {
      NSUInteger v28 = v11;
      uint64_t v19 = _os_log_pack_size();
      uint64_t v20 = (char *)v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v29 = _os_log_pack_fill();
      double v30 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v29,  (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]",  location,  length,  --v28);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v30,  "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]",  location,  length,  v28);
    }

    else
    {
      uint64_t v19 = _os_log_pack_size();
      uint64_t v20 = (char *)v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_3_8_32_8_0_8_0( v21,  (uint64_t)"-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v22,  "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]",  location,  length,  v36);
    }

    __int128 v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v20,  v19);
    objc_exception_throw(v31);
    -[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:](v32, v33, v34, v35);
    return;
  }

  if (!objects && count)
  {
    uint64_t v23 = _os_log_pack_size();
    uint64_t v24 = (char *)v37 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v25 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v25 = 136315394;
    *(void *)(v25 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v25 + 12) = 2048;
    *(void *)(v25 + 14) = count;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]",  count);
    goto LABEL_24;
  }

  if (count >> 61)
  {
    uint64_t v23 = _os_log_pack_size();
    uint64_t v24 = (char *)v37 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v26 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v26 = 136315394;
    *(void *)(v26 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v26 + 12) = 2048;
    *(void *)(v26 + 14) = count;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]",  count);
LABEL_24:
    SEL v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v24,  v23);
    objc_exception_throw(v27);
  }

  if (count)
  {
    uint64_t v12 = 0LL;
    do
    {
      if (!objects[v12])
      {
        uint64_t v16 = _os_log_pack_size();
        NSUInteger length = (NSUInteger)v37;
        NSUInteger location = (NSUInteger)v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v17 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v17 = 136315394;
        *(void *)(v17 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]";
        *(_WORD *)(v17 + 12) = 2048;
        *(void *)(v17 + 14) = v12;
        CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: attempt to insert nil object from objects[%lu]",  "-[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]",  v12);
        uint64_t v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  location,  v16);
        objc_exception_throw(v18);
        goto LABEL_20;
      }

      ++v12;
    }

    while (count != v12);
    uint64_t v13 = 0LL;
    do
      id v14 = objects[v13++];
    while (count != v13);
    -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", location, length);
    -[NSMutableOrderedSet insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", objects, count, location);
    do
    {
      uint64_t v15 = *objects++;

      --count;
    }

    while (count);
  }

  else
  {
    -[NSMutableOrderedSet removeObjectsInRange:](self, "removeObjectsInRange:", location, length);
    -[NSMutableOrderedSet insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", objects, 0LL, location);
  }

- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects
{
  v52[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!objects) {
      goto LABEL_4;
    }
  }

  else if (!objects)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSArray((uint64_t)objects) & 1) == 0)
  {
    uint64_t v47 = _os_log_pack_size();
    double v49 = (char *)v52 - ((MEMORY[0x1895F8858](v47, v48) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v50 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v50 = 136315138;
    *(void *)(v50 + 4) = "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableOrderedSet replaceObjectsAtIndexes:withObjects:]");
    v51 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v49,  v47);
    objc_exception_throw(v51);
    goto LABEL_35;
  }

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromArray:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  v47[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (!a4) {
      goto LABEL_4;
    }
  }

  else if (!a4)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    uint64_t v34 = _os_log_pack_size();
    uint64_t v36 = (char *)v47 - ((MEMORY[0x1895F8858](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v37 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v37 = 136315138;
    *(void *)(v37 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:range:]");
    uint64_t v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v36,  v34);
    objc_exception_throw(v38);
LABEL_30:
    __break(1u);
    return;
  }

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromArray:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v35[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a4) {
      goto LABEL_4;
    }
  }

  else if (!a4)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSArray((uint64_t)a4) & 1) == 0)
  {
    uint64_t v26 = _os_log_pack_size();
    uint64_t v28 = (char *)v35 - ((MEMORY[0x1895F8858](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136315138;
    *(void *)(v29 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromArray:]");
    double v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v28,  v26);
    objc_exception_throw(v30);
LABEL_22:
    __break(1u);
    return;
  }

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  v47[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (!a4) {
      goto LABEL_4;
    }
  }

  else if (!a4)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSOrderedSet((uint64_t)a4) & 1) == 0)
  {
    uint64_t v34 = _os_log_pack_size();
    uint64_t v36 = (char *)v47 - ((MEMORY[0x1895F8858](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v37 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v37 = 136315138;
    *(void *)(v37 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:range:]");
    uint64_t v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v36,  v34);
    objc_exception_throw(v38);
LABEL_30:
    __break(1u);
    return;
  }

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v35[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a4) {
      goto LABEL_4;
    }
  }

  else if (!a4)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSOrderedSet((uint64_t)a4) & 1) == 0)
  {
    uint64_t v26 = _os_log_pack_size();
    uint64_t v28 = (char *)v35 - ((MEMORY[0x1895F8858](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136315138;
    *(void *)(v29 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromOrderedSet:]");
    double v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v28,  v26);
    objc_exception_throw(v30);
LABEL_22:
    __break(1u);
    return;
  }

- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromSet:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v35[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (!a4) {
      goto LABEL_4;
    }
  }

  else if (!a4)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSSet((uint64_t)a4) & 1) == 0)
  {
    uint64_t v26 = _os_log_pack_size();
    uint64_t v28 = (char *)v35 - ((MEMORY[0x1895F8858](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136315138;
    *(void *)(v29 + 4) = "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableOrderedSet replaceObjectsInRange:withObjectsFromSet:]");
    double v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v28,  v26);
    objc_exception_throw(v30);
LABEL_22:
    __break(1u);
    return;
  }

- (void)setArray:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
LABEL_4:
    -[NSMutableOrderedSet removeAllObjects](self, "removeAllObjects");
    -[NSMutableOrderedSet insertObjectsFromArray:atIndex:](self, "insertObjectsFromArray:atIndex:", a3, 0LL);
    return;
  }

  uint64_t v6 = _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v7 = 136315138;
  *(void *)(v7 + 4) = "-[NSMutableOrderedSet setArray:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableOrderedSet setArray:]");
  NSUInteger v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
  objc_exception_throw(v8);
  -[NSMutableOrderedSet setObject:atIndex:](v9, v10, v11, v12);
}

- (void)setObject:(id)obj atIndex:(NSUInteger)idx
{
  v22[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (obj) {
      goto LABEL_3;
    }
LABEL_9:
    idx = _os_log_pack_size();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315138;
    *(void *)(v9 + 4) = "-[NSMutableOrderedSet setObject:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableOrderedSet setObject:atIndex:]");
    SEL v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v22 - ((idx + 15) & 0xFFFFFFFFFFFFFFF0LL),  idx);
    objc_exception_throw(v10);
    goto LABEL_10;
  }

  if (!obj) {
    goto LABEL_9;
  }
LABEL_3:
  NSUInteger v8 = -[NSOrderedSet count](self, "count");
  if ((idx & 0x8000000000000000LL) == 0 && v8 >= idx)
  {
    if (-[NSOrderedSet count](self, "count") == idx) {
      -[NSMutableOrderedSet insertObject:atIndex:](self, "insertObject:atIndex:", obj, idx);
    }
    else {
      -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", idx, obj);
    }
    return;
  }

- (void)setObject:(id)a3
{
  v11[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315138;
    *(void *)(v9 + 4) = "-[NSMutableOrderedSet setObject:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableOrderedSet setObject:]");
    SEL v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v8);
    objc_exception_throw(v10);
  }

  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  NSUInteger v6 = -[NSOrderedSet indexOfObject:](self, "indexOfObject:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    id v7 = 0LL;
  }
  else {
    id v7 = -[NSOrderedSet objectAtIndex:](self, "objectAtIndex:", v6);
  }
  if (v7 != a3) {
    -[NSMutableOrderedSet replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v6, a3);
  }
}

- (void)setOrderedSet:(id)a3
{
  v12[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSMutableOrderedSet setOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableOrderedSet setOrderedSet:]");
    uint64_t v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
    objc_exception_throw(v8);
    -[NSMutableOrderedSet setSet:](v9, v10, v11);
    return;
  }

- (void)setSet:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
LABEL_4:
    -[NSMutableOrderedSet removeAllObjects](self, "removeAllObjects");
    -[NSMutableOrderedSet insertObjectsFromSet:atIndex:](self, "insertObjectsFromSet:atIndex:", a3, 0LL);
    return;
  }

  uint64_t v6 = _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v7 = 136315138;
  *(void *)(v7 + 4) = "-[NSMutableOrderedSet setSet:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableOrderedSet setSet:]");
  uint64_t v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
  objc_exception_throw(v8);
  -[NSMutableOrderedSet sortedArrayFromRange:options:usingComparator:](v9, v10, v14, v11, v12);
}

- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSMutableOrderedSet;
  return (id)objc_msgSend( -[NSOrderedSet sortedArrayFromRange:options:usingComparator:]( &v6,  sel_sortedArrayFromRange_options_usingComparator_,  a3.location,  a3.length,  a4,  a5),  "copy");
}

- (void)sortRange:(NSRange)range options:(NSSortOptions)opts usingComparator:(NSComparator)cmptr
{
  char v7 = opts;
  unint64_t length = range.length;
  NSUInteger location = range.location;
  v48[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableOrderedSet);
    if (cmptr) {
      goto LABEL_3;
    }
LABEL_28:
    unint64_t length = _os_log_pack_size();
    uint64_t v29 = (char *)&v45 - ((MEMORY[0x1895F8858](length, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSMutableOrderedSet sortRange:options:usingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSMutableOrderedSet sortRange:options:usingComparator:]");
    uint64_t v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v29,  length);
    objc_exception_throw(v31);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }

  if (!cmptr) {
    goto LABEL_28;
  }
LABEL_3:
  NSUInteger v11 = -[NSOrderedSet count](self, "count");
  NSUInteger v13 = v11;
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v11 < location + length)
  {
    if (v11)
    {
      uint64_t v32 = _os_log_pack_size();
      double v34 = (char *)&v45 - ((MEMORY[0x1895F8858](v32, v38) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v39 = _os_log_pack_fill();
      double v40 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v39,  (uint64_t)"-[NSMutableOrderedSet sortRange:options:usingComparator:]",  location,  length,  v13 - 1);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v40,  "-[NSMutableOrderedSet sortRange:options:usingComparator:]",  location,  length,  v13 - 1);
    }

    else
    {
      uint64_t v32 = _os_log_pack_size();
      double v34 = (char *)&v45 - ((MEMORY[0x1895F8858](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v35 = _os_log_pack_fill();
      double v36 = __os_log_helper_1_2_3_8_32_8_0_8_0( v35,  (uint64_t)"-[NSMutableOrderedSet sortRange:options:usingComparator:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v36,  "-[NSMutableOrderedSet sortRange:options:usingComparator:]",  location,  length);
    }

    uint64_t v37 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v34,  v32);
    objc_exception_throw(v37);
    goto LABEL_33;
  }

  if (length < 2) {
    return;
  }
  if (length >> 60)
  {
LABEL_34:
    CFStringRef v41 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  length);
    double v42 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v41,  0LL);
    CFRelease(v41);
    objc_exception_throw(v42);
    uint64_t v44 = v43;
    free(v45);
    _Unwind_Resume(v44);
  }

  if (length >= 0x101) {
    uint64_t v14 = 1LL;
  }
  else {
    uint64_t v14 = length;
  }
  uint64_t v15 = 8 * v14;
  MEMORY[0x1895F8858](v11, v12);
  uint64_t v17 = (char *)&v45 - v16;
  if (length >= 0x101)
  {
    uint64_t v17 = (char *)_CFCreateArrayStorage(length, 0, v48);
    uint64_t v45 = v17;
  }

  else
  {
    uint64_t v45 = 0LL;
  }

  uint64_t v18 = -[NSOrderedSet getObjects:range:](self, "getObjects:range:", v17, location, length, v45);
  MEMORY[0x1895F8858](v18, v19);
  NSUInteger v21 = (char *)&v45 - v20;
  double v22 = (char *)&v45 - v20;
  if (length > 0x1000) {
    double v22 = (char *)malloc(8 * length);
  }
  v47[0] = MEMORY[0x1895F87A8];
  v47[1] = 3221225472LL;
  size_t v47[2] = __57__NSMutableOrderedSet_sortRange_options_usingComparator___block_invoke;
  v47[3] = &unk_189996258;
  v47[4] = cmptr;
  v47[5] = v17;
  CFSortIndexes((uint64_t)v22, length, v7, (uint64_t)v47);
  MEMORY[0x1895F8858](v23, v24);
  if (length >= 0x101) {
    uint64_t v25 = (char *)_CFCreateArrayStorage(length, 0, &v46);
  }
  else {
    uint64_t v25 = 0LL;
  }
  uint64_t v26 = 0LL;
  if (length >= 0x101) {
    uint64_t v27 = v25;
  }
  else {
    uint64_t v27 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  }
  do
  {
    *(void *)&v27[8 * v26] = *(void *)&v17[8 * *(void *)&v22[8 * v26]];
    ++v26;
  }

  while (length != v26);
  -[NSMutableOrderedSet replaceObjectsInRange:withObjects:count:]( self,  "replaceObjectsInRange:withObjects:count:",  location,  length);
  if (v21 != v22) {
    free(v22);
  }
  free(v25);
  free(v45);
}

uint64_t __57__NSMutableOrderedSet_sortRange_options_usingComparator___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(*(void *)(a1 + 40) + 8 * a2),  *(void *)(*(void *)(a1 + 40) + 8 * a3));
}

- (void)sortWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr
{
  v14[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (cmptr) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v9 = _os_log_pack_size();
    NSUInteger v11 = (char *)v14 - ((MEMORY[0x1895F8858](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSMutableOrderedSet sortWithOptions:usingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSMutableOrderedSet sortWithOptions:usingComparator:]");
    NSUInteger v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v11,  v9);
    objc_exception_throw(v13);
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  if (!cmptr) {
    goto LABEL_6;
  }
LABEL_3:
  NSUInteger v8 = -[NSOrderedSet count](self, "count");
  if (v8 >= 2) {
    -[NSMutableOrderedSet sortRange:options:usingComparator:]( self,  "sortRange:options:usingComparator:",  0LL,  v8,  opts,  cmptr);
  }
}

- (void)sortUsingComparator:(NSComparator)cmptr
{
  v12[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (cmptr) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v7 = _os_log_pack_size();
    uint64_t v9 = (char *)v12 - ((MEMORY[0x1895F8858](v7, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[NSMutableOrderedSet sortUsingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSMutableOrderedSet sortUsingComparator:]");
    NSUInteger v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v7);
    objc_exception_throw(v11);
  }

  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  if (!cmptr) {
    goto LABEL_6;
  }
LABEL_3:
  NSUInteger v6 = -[NSOrderedSet count](self, "count");
  if (v6 >= 2) {
    -[NSMutableOrderedSet sortRange:options:usingComparator:]( self,  "sortRange:options:usingComparator:",  0LL,  v6,  0LL,  cmptr);
  }
}

- (void)unionOrderedSet:(NSOrderedSet *)other
{
  v22[1] = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other) {
      goto LABEL_4;
    }
  }

  else if (!other)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSOrderedSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v17 = _os_log_pack_size();
    uint64_t v19 = (char *)v22 - ((MEMORY[0x1895F8858](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSMutableOrderedSet unionOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableOrderedSet unionOrderedSet:]");
    NSUInteger v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v19,  v17);
    objc_exception_throw(v21);
    __break(1u);
    return;
  }

- (void)unionSet:(NSSet *)other
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  -[NSMutableOrderedSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
    if (!other) {
      goto LABEL_4;
    }
  }

  else if (!other)
  {
    goto LABEL_4;
  }

  if ((_NSIsNSSet((uint64_t)other) & 1) == 0)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSMutableOrderedSet unionSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableOrderedSet unionSet:]");
    CFStringRef v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v19[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v13);
    objc_exception_throw(v15);
    +[NSMutableOrderedSet orderedSetWithCapacity:](v16, v17, v18);
    return;
  }

+ (NSMutableOrderedSet)orderedSetWithCapacity:(NSUInteger)numItems
{
  return (NSMutableOrderedSet *)(id)[objc_alloc((Class)a1) initWithCapacity:numItems];
}

- (NSMutableOrderedSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  v16[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4)
  {
LABEL_10:
    uint64_t v11 = _os_log_pack_size();
    unint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[NSMutableOrderedSet initWithObjects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = v4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSMutableOrderedSet initWithObjects:count:]",  v4);
    goto LABEL_12;
  }

  if (a4 >> 61)
  {
    uint64_t v11 = _os_log_pack_size();
    unint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[NSMutableOrderedSet initWithObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = v4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSMutableOrderedSet initWithObjects:count:]",  v4);
LABEL_12:
    CFStringRef v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
    objc_exception_throw(v15);
  }

  if (a4)
  {
    uint64_t v6 = 0LL;
    while (a3[v6])
    {
      if (a4 == ++v6) {
        goto LABEL_8;
      }
    }

    unint64_t v4 = _os_log_pack_size();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v9 + 4) = "-[NSMutableOrderedSet initWithObjects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = v6;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: attempt to insert nil object from objects[%lu]",  "-[NSMutableOrderedSet initWithObjects:count:]",  v6);
    uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v4);
    objc_exception_throw(v10);
    goto LABEL_10;
  }

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (void)insertObject:(id)object atIndex:(NSUInteger)idx
{
}

- (void)removeObjectAtIndex:(NSUInteger)idx
{
}

- (void)replaceObjectAtIndex:(NSUInteger)idx withObject:(id)object
{
}

- (NSMutableOrderedSet)initWithCapacity:(NSUInteger)numItems
{
  return 0LL;
}

@end