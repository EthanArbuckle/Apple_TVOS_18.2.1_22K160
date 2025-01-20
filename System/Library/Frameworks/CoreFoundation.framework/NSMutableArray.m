@interface NSMutableArray
+ (NSMutableArray)arrayWithCapacity:(NSUInteger)numItems;
- (NSMutableArray)initWithCapacity:(NSUInteger)numItems;
- (NSMutableArray)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)arrayByAddingObjectsFromArray:(id)a3;
- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (void)addObject:(id)anObject;
- (void)addObjects:(const void *)a3 count:(unint64_t)a4;
- (void)addObjectsFromArray:(NSArray *)otherArray;
- (void)addObjectsFromArray:(id)a3 range:(_NSRange)a4;
- (void)addObjectsFromOrderedSet:(id)a3;
- (void)addObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4;
- (void)addObjectsFromSet:(id)a3;
- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;
- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)insertObjectsFromArray:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjectsFromArray:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5;
- (void)insertObjectsFromOrderedSet:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5;
- (void)insertObjectsFromSet:(id)a3 atIndex:(unint64_t)a4;
- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeFirstObject;
- (void)removeLastObject;
- (void)removeObject:(id)anObject;
- (void)removeObject:(id)anObject inRange:(NSRange)range;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeObjectIdenticalTo:(id)anObject;
- (void)removeObjectIdenticalTo:(id)anObject inRange:(NSRange)range;
- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes;
- (void)removeObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5;
- (void)removeObjectsInArray:(NSArray *)otherArray;
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
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects;
- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray;
- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray range:(NSRange)otherRange;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromOrderedSet:(id)a4 range:(_NSRange)a5;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjectsFromSet:(id)a4;
- (void)setArray:(NSArray *)otherArray;
- (void)setObject:(id)a3 atIndex:(unint64_t)a4;
- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;
- (void)setOrderedSet:(id)a3;
- (void)setSet:(id)a3;
- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (void)sortUsingComparator:(NSComparator)cmptr;
- (void)sortUsingFunction:(NSInteger (__cdecl *)compare context:;
- (void)sortUsingFunction:(void *)a3 context:(void *)a4 range:(_NSRange)a5;
- (void)sortUsingSelector:(SEL)comparator;
- (void)sortWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr;
@end

@implementation NSMutableArray

- (void)addObject:(id)anObject
{
  v9[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (anObject) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSMutableArray addObject:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableArray addObject:]");
    v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
    objc_exception_throw(v8);
  }

  if (!anObject) {
    goto LABEL_5;
  }
LABEL_3:
  -[NSMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", anObject, -[NSArray count](self, "count"));
}

- (void)addObjects:(const void *)a3 count:(unint64_t)a4
{
  v16[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
LABEL_13:
    uint64_t v11 = _os_log_pack_size();
    v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[NSMutableArray addObjects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSMutableArray addObjects:count:]",  a4);
    goto LABEL_15;
  }

- (void)addObjectsFromArray:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  uint64_t location = a4.location;
  v23[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(void *)(v14 + 4) = "-[NSMutableArray addObjectsFromArray:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableArray addObjectsFromArray:range:]");
    v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  length,  location);
    objc_exception_throw(v15);
LABEL_13:
    unint64_t v16 = v9;
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v17,  (uint64_t)"-[NSMutableArray addObjectsFromArray:range:]",  location,  length,  --v16);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v18,  "-[NSMutableArray addObjectsFromArray:range:]",  location,  length,  v16);
    goto LABEL_14;
  }

- (void)addObjectsFromArray:(NSArray *)otherArray
{
  uint64_t v4 = otherArray;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (otherArray)
  {
    if ((_NSIsNSArray((uint64_t)otherArray) & 1) == 0)
    {
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableArray addObjectsFromArray:]");
      uint64_t v6 = _CFAutoreleasePoolAddObject();
      CFLog(3LL, (uint64_t)@"%@", v7, v8, v9, v10, v11, v12, v6);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        double v13 = +[NSArray array](&OBJC_CLASS___NSMutableArray, "array");
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v27,  v26,  16LL);
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v28;
          do
          {
            for (uint64_t i = 0LL; i != v15; ++i)
            {
              if (*(void *)v28 != v16) {
                objc_enumerationMutation(v4);
              }
              -[NSArray addObject:](v13, "addObject:", *(void *)(*((void *)&v27 + 1) + 8 * i));
            }

            uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v27,  v26,  16LL);
          }

          while (v15);
        }

        uint64_t v4 = v13;
      }
    }
  }

  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!v4) {
      goto LABEL_15;
    }
  }

  else if (!v4)
  {
LABEL_15:
    -[NSMutableArray insertObjectsFromArray:range:atIndex:]( self,  "insertObjectsFromArray:range:atIndex:",  v4,  0LL,  -[NSArray count](v4, "count"),  -[NSArray count](self, "count"));
    return;
  }

  uint64_t v18 = _os_log_pack_size();
  v20 = &v26[-((MEMORY[0x1895F8858](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v21 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v21 = 136315138;
  *(void *)(v21 + 4) = "-[NSMutableArray addObjectsFromArray:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableArray addObjectsFromArray:]");
  v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v20,  v18);
  objc_exception_throw(v22);
  -[NSMutableArray addObjectsFromOrderedSet:range:](v23, v24, v25, v32);
}

- (void)addObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  uint64_t location = a4.location;
  v23[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(void *)(v14 + 4) = "-[NSMutableArray addObjectsFromOrderedSet:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableArray addObjectsFromOrderedSet:range:]");
    uint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  length,  location);
    objc_exception_throw(v15);
LABEL_13:
    unint64_t v16 = v9;
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    double v18 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v17,  (uint64_t)"-[NSMutableArray addObjectsFromOrderedSet:range:]",  location,  length,  --v16);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v18,  "-[NSMutableArray addObjectsFromOrderedSet:range:]",  location,  length,  v16);
    goto LABEL_14;
  }

- (void)addObjectsFromOrderedSet:(id)a3
{
  v14[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
LABEL_4:
    -[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]( self,  "insertObjectsFromOrderedSet:range:atIndex:",  a3,  0,  [a3 count],  -[NSArray count](self, "count"));
    return;
  }

  uint64_t v6 = _os_log_pack_size();
  uint64_t v8 = (char *)v14 - ((MEMORY[0x1895F8858](v6, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v9 = 136315138;
  *(void *)(v9 + 4) = "-[NSMutableArray addObjectsFromOrderedSet:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableArray addObjectsFromOrderedSet:]");
  uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v8,  v6);
  objc_exception_throw(v10);
  -[NSMutableArray addObjectsFromSet:](v11, v12, v13);
}

- (void)addObjectsFromSet:(id)a3
{
  v13[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
LABEL_4:
    -[NSMutableArray insertObjectsFromSet:atIndex:]( self,  "insertObjectsFromSet:atIndex:",  a3,  -[NSArray count](self, "count"));
    return;
  }

  uint64_t v6 = _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v7 = 136315138;
  *(void *)(v7 + 4) = "-[NSMutableArray addObjectsFromSet:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableArray addObjectsFromSet:]");
  uint64_t v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
  objc_exception_throw(v8);
  -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](v9, v10, v11, v12);
}

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2
{
  v33[1] = *(id *)MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v8 = -[NSArray count](self, "count");
  if ((idx1 & 0x8000000000000000LL) != 0 || v8 <= idx1)
  {
    if (v8)
    {
      NSUInteger v19 = v8;
      uint64_t v13 = _os_log_pack_size();
      uint64_t v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v20 = _os_log_pack_fill();
      double v21 = __os_log_helper_1_2_3_8_32_8_0_8_0( v20,  (uint64_t)"-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]",  idx1,  --v19);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v21,  "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]",  idx1,  v19);
    }

    else
    {
      uint64_t v13 = _os_log_pack_size();
      uint64_t v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v15 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v15 = 136315394;
      *(void *)(v15 + 4) = "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v15 + 12) = 2048;
      *(void *)(v15 + 14) = idx1;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]",  idx1);
    }

    uint64_t v22 = _CFAutoreleasePoolAddObject();
    v23 = v14;
    uint64_t v24 = v13;
    goto LABEL_22;
  }

  NSUInteger v9 = -[NSArray count](self, "count");
  if ((idx2 & 0x8000000000000000LL) != 0 || v9 <= idx2)
  {
    if (v9)
    {
      NSUInteger v25 = v9;
      uint64_t v16 = _os_log_pack_size();
      uint64_t v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v26 = _os_log_pack_fill();
      double v27 = __os_log_helper_1_2_3_8_32_8_0_8_0( v26,  (uint64_t)"-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]",  idx2,  --v25);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v27,  "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]",  idx2,  v25);
    }

    else
    {
      uint64_t v16 = _os_log_pack_size();
      uint64_t v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v18 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v18 = 136315394;
      *(void *)(v18 + 4) = "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v18 + 12) = 2048;
      *(void *)(v18 + 14) = idx2;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:]",  idx2);
    }

    uint64_t v22 = _CFAutoreleasePoolAddObject();
    v23 = v17;
    uint64_t v24 = v16;
LABEL_22:
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  v22,  0LL,  v23,  v24));
    -[NSMutableArray insertObjects:count:atIndex:](v28, v29, v30, v31, v32);
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
    v33[0] = -[NSArray objectAtIndex:](self, "objectAtIndex:", idx2);
    id v11 = -[NSArray objectAtIndex:](self, "objectAtIndex:", v10);
    id v12 = v33[0];
    -[NSMutableArray replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", idx2, v11);
    -[NSMutableArray replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v10, v33[0]);
  }

- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  v31[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
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
LABEL_17:
    a5 = _os_log_pack_size();
    uint64_t v16 = (char *)v31 - ((a5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315394;
    *(void *)(v17 + 4) = "-[NSMutableArray insertObjects:count:atIndex:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(void *)(v17 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSMutableArray insertObjects:count:atIndex:]",  a4);
LABEL_19:
    NSUInteger v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v16,  a5);
    objc_exception_throw(v19);
    goto LABEL_20;
  }

- (void)insertObjectsFromArray:(id)a3 range:(_NSRange)a4 atIndex:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v45[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
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
    *(void *)(v35 + 4) = "-[NSMutableArray insertObjectsFromArray:range:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableArray insertObjectsFromArray:range:atIndex:]");
    v36 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v34,  v32);
    objc_exception_throw(v36);
LABEL_29:
    __break(1u);
    return;
  }

- (void)insertObjectsFromArray:(id)a3 atIndex:(unint64_t)a4
{
  v33[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(void *)(v27 + 4) = "-[NSMutableArray insertObjectsFromArray:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableArray insertObjectsFromArray:atIndex:]");
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
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
    *(void *)(v35 + 4) = "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableArray insertObjectsFromOrderedSet:range:atIndex:]");
    v36 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v34,  v32);
    objc_exception_throw(v36);
LABEL_29:
    __break(1u);
    return;
  }

- (void)insertObjectsFromOrderedSet:(id)a3 atIndex:(unint64_t)a4
{
  v33[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(void *)(v27 + 4) = "-[NSMutableArray insertObjectsFromOrderedSet:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableArray insertObjectsFromOrderedSet:atIndex:]");
    uint64_t v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v26,  v24);
    objc_exception_throw(v28);
LABEL_21:
    __break(1u);
    return;
  }

- (void)insertObjectsFromSet:(id)a3 atIndex:(unint64_t)a4
{
  v33[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(void *)(v27 + 4) = "-[NSMutableArray insertObjectsFromSet:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableArray insertObjectsFromSet:atIndex:]");
    uint64_t v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v26,  v24);
    objc_exception_throw(v28);
LABEL_21:
    __break(1u);
    return;
  }

- (void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes
{
  v50[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
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
    *(void *)(v48 + 4) = "-[NSMutableArray insertObjects:atIndexes:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableArray insertObjects:atIndexes:]");
    v49 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v47,  v45);
    objc_exception_throw(v49);
    goto LABEL_33;
  }

- (void)moveObjectsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  v50[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v23 = _os_log_pack_size();
    uint64_t v25 = (char *)v50 - ((MEMORY[0x1895F8858](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v26 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v26 = 136315138;
    *(void *)(v26 + 4) = "-[NSMutableArray moveObjectsAtIndexes:toIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSMutableArray moveObjectsAtIndexes:toIndex:]");
    uint64_t v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v25,  v23);
    objc_exception_throw(v27);
LABEL_30:
    __break(1u);
    return;
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!a3) {
    goto LABEL_17;
  }
LABEL_3:
  if ((_NSIsNSIndexSet() & 1) == 0)
  {
    uint64_t v28 = _os_log_pack_size();
    uint64_t v30 = (char *)v50 - ((MEMORY[0x1895F8858](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136315138;
    *(void *)(v31 + 4) = "-[NSMutableArray moveObjectsAtIndexes:toIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSMutableArray moveObjectsAtIndexes:toIndex:]");
    uint64_t v32 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v30,  v28);
    objc_exception_throw(v32);
    goto LABEL_30;
  }

  NSUInteger v8 = -[NSArray count](self, "count");
  uint64_t v9 = [0 count];
  unint64_t v10 = [a3 lastIndex];
  if ((v10 & 0x8000000000000000LL) != 0)
  {
    uint64_t v33 = v10;
    unint64_t v11 = v9 + v8;
LABEL_21:
    uint64_t v34 = _os_log_pack_size();
    uint64_t v36 = (char *)v50 - ((MEMORY[0x1895F8858](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v37 = _os_log_pack_fill();
    if (v11)
    {
      double v39 = __os_log_helper_1_2_3_8_32_8_0_8_0( v37,  (uint64_t)"-[NSMutableArray moveObjectsAtIndexes:toIndex:]",  v33,  v11 - 1);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu in index set beyond bounds [0 .. %lu]",  v39,  "-[NSMutableArray moveObjectsAtIndexes:toIndex:]",  v33,  v11 - 1);
    }

    else
    {
      *(_DWORD *)uint64_t v37 = 136315394;
      *(void *)(v37 + 4) = "-[NSMutableArray moveObjectsAtIndexes:toIndex:]";
      *(_WORD *)(v37 + 12) = 2048;
      *(void *)(v37 + 14) = v33;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu in index set beyond bounds for empty array",  "-[NSMutableArray moveObjectsAtIndexes:toIndex:]",  v33);
    }

    uint64_t v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v36,  v34);
    objc_exception_throw(v38);
    goto LABEL_30;
  }

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v11 = v9 + v8;
    if (v11 <= v10)
    {
      uint64_t v33 = v10;
      goto LABEL_21;
    }
  }

  NSUInteger v12 = -[NSArray count](self, "count");
  uint64_t v13 = objc_msgSend(a3, "countOfIndexesInRange:", 0, a4);
  unint64_t v14 = v12 - v13;
  if ((a4 & 0x8000000000000000LL) != 0 || v14 < a4)
  {
    if (v12 == v13)
    {
      uint64_t v40 = _os_log_pack_size();
      double v42 = (char *)v50 - ((MEMORY[0x1895F8858](v40, v41) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v43 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v43 = 136315394;
      *(void *)(v43 + 4) = "-[NSMutableArray moveObjectsAtIndexes:toIndex:]";
      *(_WORD *)(v43 + 12) = 2048;
      *(void *)(v43 + 14) = a4;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[NSMutableArray moveObjectsAtIndexes:toIndex:]",  a4);
    }

    else
    {
      uint64_t v40 = _os_log_pack_size();
      double v42 = (char *)v50 - ((MEMORY[0x1895F8858](v40, v47) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v48 = _os_log_pack_fill();
      double v49 = __os_log_helper_1_2_3_8_32_8_0_8_0( v48,  (uint64_t)"-[NSMutableArray moveObjectsAtIndexes:toIndex:]",  a4,  v14 - 1);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v49,  "-[NSMutableArray moveObjectsAtIndexes:toIndex:]",  a4,  v14 - 1);
    }

    double v44 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v42,  v40);
    objc_exception_throw(v44);
    goto LABEL_30;
  }

  NSUInteger v15 = -[NSArray objectsAtIndexes:](self, "objectsAtIndexes:", a3);
  -[NSMutableArray removeObjectsAtIndexes:](self, "removeObjectsAtIndexes:", a3);
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
  -[NSMutableArray insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", v21, v18, a4);
  free(v22);
}

- (void)removeAllObjects
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableArray);
  }
  NSUInteger v4 = -[NSArray count](self, "count");
  if (v4)
  {
    NSUInteger v5 = v4 - 1;
    do
      -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v5--);
    while (v5 != -1LL);
  }

- (void)removeFirstObject
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableArray);
  }
  if (-[NSArray count](self, "count")) {
    -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", 0LL);
  }
}

- (void)removeLastObject
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableArray);
  }
  NSUInteger v4 = -[NSArray count](self, "count");
  if (_CFExecutableLinkedOnOrAfter(7uLL))
  {
    if (!v4) {
      return;
    }
    goto LABEL_5;
  }

  if (v4) {
    NSUInteger v5 = v4 - 1;
  }
  else {
    NSUInteger v5 = 0LL;
  }
  -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v5);
  if (v4) {
LABEL_5:
  }
    -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v4 - 1);
}

- (void)removeObjectsInRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v19[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v7 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v7 < location + length)
  {
    if (v7)
    {
      NSUInteger v12 = v7;
      uint64_t v8 = _os_log_pack_size();
      uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v13,  (uint64_t)"-[NSMutableArray removeObjectsInRange:]",  location,  length,  --v12);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v14,  "-[NSMutableArray removeObjectsInRange:]",  location,  length,  v12);
    }

    else
    {
      uint64_t v8 = _os_log_pack_size();
      uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v10 = _os_log_pack_fill();
      double v11 = __os_log_helper_1_2_3_8_32_8_0_8_0( v10,  (uint64_t)"-[NSMutableArray removeObjectsInRange:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v11,  "-[NSMutableArray removeObjectsInRange:]",  location,  length);
    }

    NSUInteger v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v8);
    objc_exception_throw(v15);
    -[NSMutableArray removeObject:inRange:](v16, v17, v18, v20);
  }

  else
  {
    for (; length; --length)
      -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", location);
  }

- (void)removeObject:(id)anObject inRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v22[0] = anObject;
  v22[1] = *(id *)MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v8 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v8 < location + length)
  {
    if (v8)
    {
      NSUInteger v15 = v8;
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v16,  (uint64_t)"-[NSMutableArray removeObject:inRange:]",  location,  length,  --v15);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v17,  "-[NSMutableArray removeObject:inRange:]",  location,  length,  v15);
    }

    else
    {
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0( v13,  (uint64_t)"-[NSMutableArray removeObject:inRange:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v14,  "-[NSMutableArray removeObject:inRange:]",  location,  length);
    }

    id v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
    objc_exception_throw(v18);
    -[NSMutableArray removeObject:](v19, v20, v21);
  }

  else
  {
    id v9 = v22[0];
    if (length)
    {
      NSUInteger v10 = location - 1;
      do
      {
        if (-[NSArray objectAtIndex:](self, "objectAtIndex:", v10 + length) == v22[0]
          || objc_msgSend(v22[0], "isEqual:"))
        {
          -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v10 + length);
        }

        --length;
      }

      while (length);
    }
  }

- (void)removeObject:(id)anObject
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v5 = -[NSArray count](self, "count");
  id v6 = anObject;
  if (v5)
  {
    NSUInteger v7 = v5 - 1;
    do
    {
      if (-[NSArray objectAtIndex:](self, "objectAtIndex:", v7) == anObject
        || objc_msgSend(anObject, "isEqual:"))
      {
        -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v7);
      }

      --v7;
    }

    while (v7 != -1LL);
  }
}

- (void)removeObjectIdenticalTo:(id)anObject inRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v22[0] = anObject;
  v22[1] = *(id *)MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v8 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v8 < location + length)
  {
    if (v8)
    {
      NSUInteger v15 = v8;
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v16,  (uint64_t)"-[NSMutableArray removeObjectIdenticalTo:inRange:]",  location,  length,  --v15);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v17,  "-[NSMutableArray removeObjectIdenticalTo:inRange:]",  location,  length,  v15);
    }

    else
    {
      uint64_t v11 = _os_log_pack_size();
      NSUInteger v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0( v13,  (uint64_t)"-[NSMutableArray removeObjectIdenticalTo:inRange:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v14,  "-[NSMutableArray removeObjectIdenticalTo:inRange:]",  location,  length);
    }

    id v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
    objc_exception_throw(v18);
    -[NSMutableArray removeObjectIdenticalTo:](v19, v20, v21);
  }

  else
  {
    id v9 = v22[0];
    if (length)
    {
      NSUInteger v10 = location - 1;
      do
      {
        if (-[NSArray objectAtIndex:](self, "objectAtIndex:", v10 + length) == v22[0]) {
          -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v10 + length);
        }
        --length;
      }

      while (length);
    }
  }

- (void)removeObjectIdenticalTo:(id)anObject
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }
  NSUInteger v5 = -[NSArray count](self, "count");
  id v6 = anObject;
  if (v5)
  {
    NSUInteger v7 = v5 - 1;
    do
    {
      if (-[NSArray objectAtIndex:](self, "objectAtIndex:", v7) == anObject) {
        -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v7);
      }
      --v7;
    }

    while (v7 != -1LL);
  }
}

- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes
{
  v30[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
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
    *(void *)(v16 + 4) = "-[NSMutableArray removeObjectsAtIndexes:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSMutableArray removeObjectsAtIndexes:]");
LABEL_14:
    id v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v15,  v14);
    objc_exception_throw(v18);
    goto LABEL_15;
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(void *)(v17 + 4) = "-[NSMutableArray removeObjectsAtIndexes:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSMutableArray removeObjectsAtIndexes:]");
    goto LABEL_14;
  }

  NSUInteger v7 = -[NSArray count](self, "count");
  uint64_t v3 = [0 count];
  NSUInteger v8 = -[NSIndexSet lastIndex](indexes, "lastIndex");
  if ((v8 & 0x8000000000000000LL) != 0)
  {
LABEL_15:
    uint64_t v19 = v8;
    id v9 = (char *)v7 + v3;
    goto LABEL_17;
  }

  if (v8 == 0x7FFFFFFFFFFFFFFFLL || (id v9 = (char *)v7 + v3, (unint64_t)v9 > v8))
  {
    uint64_t v10 = -[NSIndexSet rangeCount](indexes, "rangeCount");
    if (v10)
    {
      uint64_t v11 = v10 - 1;
      do
      {
        uint64_t v12 = -[NSIndexSet rangeAtIndex:](indexes, "rangeAtIndex:", v11);
        -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v12, v13);
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
    double v25 = __os_log_helper_1_2_3_8_32_8_0_8_0(v23, (uint64_t)"-[NSMutableArray removeObjectsAtIndexes:]", v19, v24);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu in index set beyond bounds [0 .. %lu]",  v25,  "-[NSMutableArray removeObjectsAtIndexes:]",  v19,  v24);
  }

  else
  {
    uint64_t v20 = _os_log_pack_size();
    id v21 = (char *)v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315394;
    *(void *)(v22 + 4) = "-[NSMutableArray removeObjectsAtIndexes:]";
    *(_WORD *)(v22 + 12) = 2048;
    *(void *)(v22 + 14) = v19;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu in index set beyond bounds for empty array",  "-[NSMutableArray removeObjectsAtIndexes:]",  v19);
  }

  uint64_t v26 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v21,  v20);
  objc_exception_throw(v26);
  -[NSMutableArray removeObjectsInRange:inArray:range:](v27, v28, v31, v29, v32);
}

- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a3.length;
  uint64_t v10 = a3.location;
  v40[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSUInteger v12 = -[NSArray count](self, "count");
  NSUInteger v13 = v12;
  if (v10 < 0 || (v9 & 0x8000000000000000LL) != 0 || v12 < v10 + v9)
  {
    if (!v12)
    {
      uint64_t v20 = _os_log_pack_size();
      id v21 = (char *)v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v22 = _os_log_pack_fill();
      double v23 = __os_log_helper_1_2_3_8_32_8_0_8_0( v22,  (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:range:]",  v10,  v9);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v23,  "-[NSMutableArray removeObjectsInRange:inArray:range:]",  v10,  v9);
LABEL_23:
      uint64_t v32 = _CFAutoreleasePoolAddObject();
      uint64_t v33 = v21;
      uint64_t v34 = v20;
LABEL_26:
      objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  v32,  0LL,  v33,  v34));
      -[NSMutableArray removeObjectsInRange:inArray:](v37, v38, v41, v39);
      return;
    }

- (void)removeObjectsInRange:(_NSRange)a3 inArray:(id)a4
{
  NSUInteger length = a3.length;
  uint64_t location = a3.location;
  v26[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) == 0 && (length & 0x8000000000000000LL) == 0 && v9 >= location + length)
  {
    if (!a4 || (_NSIsNSArray((uint64_t)a4) & 1) != 0)
    {
      -[NSMutableArray removeObjectsInRange:inArray:range:]( self,  "removeObjectsInRange:inArray:range:",  location,  length,  a4,  0,  [a4 count]);
      return;
    }

    uint64_t location = _os_log_pack_size();
    NSUInteger length = (NSUInteger)v26 - ((MEMORY[0x1895F8858](location, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSMutableArray removeObjectsInRange:inArray:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableArray removeObjectsInRange:inArray:]");
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
    double v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v20,  (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:]",  location,  length,  --v18);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v21,  "-[NSMutableArray removeObjectsInRange:inArray:]",  location,  length,  v18);
    goto LABEL_13;
  }

  uint64_t v10 = _os_log_pack_size();
  NSUInteger v12 = (char *)v26 - ((MEMORY[0x1895F8858](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = _os_log_pack_fill();
  double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0( v13,  (uint64_t)"-[NSMutableArray removeObjectsInRange:inArray:]",  location,  length);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v14,  "-[NSMutableArray removeObjectsInRange:inArray:]",  location,  length);
LABEL_13:
  uint64_t v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v10);
  objc_exception_throw(v22);
  -[NSMutableArray removeObjectsInArray:range:](v23, v24, v25, v27);
}

- (void)removeObjectsInArray:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  uint64_t location = a4.location;
  v26[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    NSUInteger length = (NSUInteger)v26 - ((MEMORY[0x1895F8858](location, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSMutableArray removeObjectsInArray:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableArray removeObjectsInArray:range:]");
    uint64_t v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  length,  location);
    objc_exception_throw(v17);
LABEL_13:
    unint64_t v18 = v9;
    uint64_t v10 = _os_log_pack_size();
    NSUInteger v12 = (char *)v26 - ((MEMORY[0x1895F8858](v10, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v20 = _os_log_pack_fill();
    double v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v20,  (uint64_t)"-[NSMutableArray removeObjectsInArray:range:]",  location,  length,  --v18);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v21,  "-[NSMutableArray removeObjectsInArray:range:]",  location,  length,  v18);
    goto LABEL_14;
  }

- (void)removeObjectsInArray:(NSArray *)otherArray
{
  v14[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!otherArray) {
      goto LABEL_4;
    }
  }

  else if (!otherArray)
  {
LABEL_4:
    -[NSMutableArray removeObjectsInRange:inArray:range:]( self,  "removeObjectsInRange:inArray:range:",  0LL,  -[NSArray count](self, "count"),  otherArray,  0LL,  -[NSArray count](otherArray, "count"));
    return;
  }

  uint64_t v6 = _os_log_pack_size();
  NSUInteger v8 = (char *)v14 - ((MEMORY[0x1895F8858](v6, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v9 = 136315138;
  *(void *)(v9 + 4) = "-[NSMutableArray removeObjectsInArray:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableArray removeObjectsInArray:]");
  uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v8,  v6);
  objc_exception_throw(v10);
  -[NSMutableArray removeObjectsInRange:inOrderedSet:range:](v11, v12, v15, v13, v16);
}

- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  v38[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSUInteger v12 = -[NSArray count](self, "count");
  if ((v10 & 0x8000000000000000LL) != 0 || (v9 & 0x8000000000000000LL) != 0 || v12 < v10 + v9)
  {
    if (!v12)
    {
      uint64_t v15 = _os_log_pack_size();
      _NSRange v16 = (char *)v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v17 = _os_log_pack_fill();
      double v18 = __os_log_helper_1_2_3_8_32_8_0_8_0( v17,  (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]",  v10,  v9);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v18,  "-[NSMutableArray removeObjectsInRange:inOrderedSet:range:]",  v10,  v9);
LABEL_23:
      uint64_t v29 = _CFAutoreleasePoolAddObject();
      uint64_t v30 = v16;
      uint64_t v31 = v15;
LABEL_26:
      objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  v29,  0LL,  v30,  v31));
      -[NSMutableArray removeObjectsInRange:inOrderedSet:](v35, v36, v39, v37);
      return;
    }

- (void)removeObjectsInRange:(_NSRange)a3 inOrderedSet:(id)a4
{
  NSUInteger length = a3.length;
  uint64_t location = a3.location;
  v26[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) == 0 && (length & 0x8000000000000000LL) == 0 && v9 >= location + length)
  {
    if (!a4 || (_NSIsNSOrderedSet((uint64_t)a4) & 1) != 0)
    {
      -[NSMutableArray removeObjectsInRange:inOrderedSet:range:]( self,  "removeObjectsInRange:inOrderedSet:range:",  location,  length,  a4,  0,  [a4 count]);
      return;
    }

    uint64_t location = _os_log_pack_size();
    NSUInteger length = (NSUInteger)v26 - ((MEMORY[0x1895F8858](location, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSMutableArray removeObjectsInRange:inOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableArray removeObjectsInRange:inOrderedSet:]");
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
    double v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v20,  (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:]",  location,  length,  --v18);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v21,  "-[NSMutableArray removeObjectsInRange:inOrderedSet:]",  location,  length,  v18);
    goto LABEL_13;
  }

  uint64_t v10 = _os_log_pack_size();
  NSUInteger v12 = (char *)v26 - ((MEMORY[0x1895F8858](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = _os_log_pack_fill();
  double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0( v13,  (uint64_t)"-[NSMutableArray removeObjectsInRange:inOrderedSet:]",  location,  length);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v14,  "-[NSMutableArray removeObjectsInRange:inOrderedSet:]",  location,  length);
LABEL_13:
  double v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v10);
  objc_exception_throw(v22);
  -[NSMutableArray removeObjectsInOrderedSet:range:](v23, v24, v25, v27);
}

- (void)removeObjectsInOrderedSet:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  uint64_t location = a4.location;
  v26[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(void *)(v16 + 4) = "-[NSMutableArray removeObjectsInOrderedSet:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableArray removeObjectsInOrderedSet:range:]");
    uint64_t v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  length,  location);
    objc_exception_throw(v17);
LABEL_13:
    unint64_t v18 = v9;
    uint64_t v10 = _os_log_pack_size();
    NSUInteger v12 = (char *)v26 - ((MEMORY[0x1895F8858](v10, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v20 = _os_log_pack_fill();
    double v21 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v20,  (uint64_t)"-[NSMutableArray removeObjectsInOrderedSet:range:]",  location,  length,  --v18);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v21,  "-[NSMutableArray removeObjectsInOrderedSet:range:]",  location,  length,  v18);
    goto LABEL_14;
  }

- (void)removeObjectsInOrderedSet:(id)a3
{
  v14[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
LABEL_4:
    -[NSMutableArray removeObjectsInRange:inOrderedSet:range:]( self,  "removeObjectsInRange:inOrderedSet:range:",  0,  -[NSArray count](self, "count"),  a3,  0,  [a3 count]);
    return;
  }

  uint64_t v6 = _os_log_pack_size();
  NSUInteger v8 = (char *)v14 - ((MEMORY[0x1895F8858](v6, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v9 = 136315138;
  *(void *)(v9 + 4) = "-[NSMutableArray removeObjectsInOrderedSet:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableArray removeObjectsInOrderedSet:]");
  uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v8,  v6);
  objc_exception_throw(v10);
  -[NSMutableArray removeObjectsInRange:inSet:](v11, v12, v15, v13);
}

- (void)removeObjectsInRange:(_NSRange)a3 inSet:(id)a4
{
  NSUInteger length = a3.length;
  uint64_t location = a3.location;
  v24[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  NSUInteger v9 = -[NSArray count](self, "count");
  if (location < 0 || (length & 0x8000000000000000LL) != 0 || v9 < location + length)
  {
    if (!v9)
    {
      uint64_t v11 = _os_log_pack_size();
      SEL v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v13 = _os_log_pack_fill();
      double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0( v13,  (uint64_t)"-[NSMutableArray removeObjectsInRange:inSet:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v14,  "-[NSMutableArray removeObjectsInRange:inSet:]",  location,  length);
LABEL_18:
      uint64_t v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
      objc_exception_throw(v20);
      -[NSMutableArray removeObjectsInSet:](v21, v22, v23);
      return;
    }

- (void)removeObjectsInSet:(id)a3
{
  v16[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (!a3) {
      goto LABEL_4;
    }
  }

  else if (!a3)
  {
LABEL_4:
    -[NSMutableArray removeObjectsInRange:inSet:]( self,  "removeObjectsInRange:inSet:",  0LL,  -[NSArray count](self, "count"),  a3);
    return;
  }

  uint64_t v6 = _os_log_pack_size();
  NSUInteger v8 = (char *)v16 - ((MEMORY[0x1895F8858](v6, v7) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v9 = 136315138;
  *(void *)(v9 + 4) = "-[NSMutableArray removeObjectsInSet:]";
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableArray removeObjectsInSet:]");
  NSUInteger v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v8,  v6);
  objc_exception_throw(v10);
  -[NSMutableArray removeObjectsAtIndexes:options:passingTest:](v11, v12, v13, v14, v15);
}

- (void)removeObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  v24[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
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
    *(void *)(v20 + 4) = "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set cannot be nil",  "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]");
    goto LABEL_15;
  }

  __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
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
    *(void *)(v21 + 4) = "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index set argument is not an NSIndexSet",  "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]");
    goto LABEL_15;
  }

  if (!a5)
  {
    uint64_t v18 = _os_log_pack_size();
    double v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)(v22 + 4) = "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSMutableArray removeObjectsAtIndexes:options:passingTest:]");
LABEL_15:
    id v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v19,  v18);
    objc_exception_throw(v23);
  }

  unint64_t v11 = a4 & 0xAFFFFFFFFFFFFFFELL;
  if ((a4 & 2) == 0) {
    unint64_t v11 = a4;
  }
  uint64_t v12 = v11 | 0x5000000000000000LL;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)a5, v11 | 0x5000000000000000LL, a3);
  id IndexesPassingTest = __NSArrayGetIndexesPassingTest(self, (uint64_t)a5, v12, a3);
  uint64_t v14 = [IndexesPassingTest rangeCount];
  if (v14)
  {
    uint64_t v15 = v14 - 1;
    do
    {
      uint64_t v16 = [IndexesPassingTest rangeAtIndex:v15];
      -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v16, v17);
      --v15;
    }

    while (v15 != -1);
  }

- (void)removeObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v19[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v16 = _os_log_pack_size();
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableArray removeObjectsWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSMutableArray removeObjectsWithOptions:passingTest:]");
    uint64_t v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v16);
    objc_exception_throw(v18);
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!a4) {
    goto LABEL_10;
  }
LABEL_3:
  unint64_t v9 = a3 & 0xBFFFFFFFFFFFFFFELL;
  if ((a3 & 2) == 0) {
    unint64_t v9 = a3;
  }
  uint64_t v10 = v9 | 0x4000000000000000LL;
  __NSArrayParameterCheckIterate((objc_class *)self, a2, (uint64_t)a4, v9 | 0x4000000000000000LL, 0LL);
  id IndexesPassingTest = __NSArrayGetIndexesPassingTest(self, (uint64_t)a4, v10, 0LL);
  uint64_t v12 = [IndexesPassingTest rangeCount];
  if (v12)
  {
    uint64_t v13 = v12 - 1;
    do
    {
      uint64_t v14 = [IndexesPassingTest rangeAtIndex:v13];
      -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v14, v15);
      --v13;
    }

    while (v13 != -1);
  }

- (void)removeObjectsPassingTest:(id)a3
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v3 = _os_log_pack_size();
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v4 + 4) = "-[NSMutableArray removeObjectsPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSMutableArray removeObjectsPassingTest:]");
    uint64_t v5 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v3);
    objc_exception_throw(v5);
  }

  -[NSMutableArray removeObjectsWithOptions:passingTest:](self, "removeObjectsWithOptions:passingTest:", 0LL, a3);
}

- (void)replaceObject:(id)a3 inRange:(_NSRange)a4
{
  uint64_t length = a4.length;
  NSUInteger location = a4.location;
  v24[0] = a3;
  v24[1] = *(id *)MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  if (!v24[0])
  {
    uint64_t length = _os_log_pack_size();
    NSUInteger location = (NSUInteger)v24 - ((length + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableArray replaceObject:inRange:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableArray replaceObject:inRange:]");
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  location,  length);
    objc_exception_throw(v12);
    goto LABEL_15;
  }

  NSUInteger v8 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || length < 0 || v8 < location + length)
  {
LABEL_15:
    if (v8)
    {
      NSUInteger v17 = v8;
      uint64_t v13 = _os_log_pack_size();
      uint64_t v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v18 = _os_log_pack_fill();
      double v19 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v18,  (uint64_t)"-[NSMutableArray replaceObject:inRange:]",  location,  length,  --v17);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v19,  "-[NSMutableArray replaceObject:inRange:]",  location,  length,  v17);
    }

    else
    {
      uint64_t v13 = _os_log_pack_size();
      uint64_t v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v15 = _os_log_pack_fill();
      double v16 = __os_log_helper_1_2_3_8_32_8_0_8_0( v15,  (uint64_t)"-[NSMutableArray replaceObject:inRange:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v16,  "-[NSMutableArray replaceObject:inRange:]",  location,  length);
    }

    uint64_t v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v14,  v13);
    objc_exception_throw(v20);
    -[NSMutableArray replaceObject:](v21, v22, v23);
    return;
  }

  id v9 = v24[0];
  if (length)
  {
    NSUInteger v10 = location - 1;
    do
    {
      if (-[NSArray objectAtIndex:](self, "objectAtIndex:", v10 + length) != v24[0])
      {
        if (objc_msgSend(v24[0], "isEqual:")) {
          -[NSMutableArray replaceObjectAtIndex:withObject:]( self,  "replaceObjectAtIndex:withObject:",  v10 + length,  v24[0]);
        }
      }

      --length;
    }

    while (length);
  }
}

- (void)replaceObject:(id)a3
{
  v11[0] = a3;
  v11[1] = *(id *)MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }
  if (!v11[0])
  {
    uint64_t v8 = _os_log_pack_size();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315138;
    *(void *)(v9 + 4) = "-[NSMutableArray replaceObject:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableArray replaceObject:]");
    NSUInteger v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v8);
    objc_exception_throw(v10);
  }

  NSUInteger v5 = -[NSArray count](self, "count");
  id v6 = v11[0];
  if (v5)
  {
    NSUInteger v7 = v5 - 1;
    do
    {
      if (-[NSArray objectAtIndex:](self, "objectAtIndex:", v7) != v11[0]
        && objc_msgSend(v11[0], "isEqual:"))
      {
        -[NSMutableArray replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v7, v11[0]);
      }

      --v7;
    }

    while (v7 != -1LL);
  }
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v47[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  }
  NSUInteger v11 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v11 < location + length)
  {
LABEL_33:
    if (v11)
    {
      NSUInteger v37 = v11;
      uint64_t v25 = _os_log_pack_size();
      _NSRange v27 = (char *)v47 - ((MEMORY[0x1895F8858](v25, v38) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v39 = _os_log_pack_fill();
      double v40 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v39,  (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjects:count:]",  location,  length,  --v37);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v40,  "-[NSMutableArray replaceObjectsInRange:withObjects:count:]",  location,  length,  v37);
    }

    else
    {
      uint64_t v25 = _os_log_pack_size();
      _NSRange v27 = (char *)v47 - ((MEMORY[0x1895F8858](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v28 = _os_log_pack_fill();
      double v29 = __os_log_helper_1_2_3_8_32_8_0_8_0( v28,  (uint64_t)"-[NSMutableArray replaceObjectsInRange:withObjects:count:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v29,  "-[NSMutableArray replaceObjectsInRange:withObjects:count:]",  location,  length,  v46);
    }

    _NSRange v41 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v27,  v25);
    objc_exception_throw(v41);
    -[NSMutableArray replaceObjectsAtIndexes:withObjects:](v42, v43, v44, v45);
    return;
  }

  if (!a4 && a5)
  {
    uint64_t v30 = _os_log_pack_size();
    unint64_t v32 = (char *)v47 - ((MEMORY[0x1895F8858](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v33 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v33 = 136315394;
    *(void *)(v33 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v33 + 12) = 2048;
    *(void *)(v33 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSMutableArray replaceObjectsInRange:withObjects:count:]",  a5);
    goto LABEL_37;
  }

  if (a5 >> 61)
  {
    uint64_t v30 = _os_log_pack_size();
    unint64_t v32 = (char *)v47 - ((MEMORY[0x1895F8858](v30, v34) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v35 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v35 = 136315394;
    *(void *)(v35 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v35 + 12) = 2048;
    *(void *)(v35 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSMutableArray replaceObjectsInRange:withObjects:count:]",  a5);
LABEL_37:
    SEL v36 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v32,  v30);
    objc_exception_throw(v36);
  }

  if (a5)
  {
    uint64_t v12 = 0LL;
    do
    {
      if (!a4[v12])
      {
        uint64_t v21 = _os_log_pack_size();
        NSUInteger length = (NSUInteger)v47;
        NSUInteger location = (NSUInteger)v47 - ((MEMORY[0x1895F8858](v21, v22) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v23 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v23 = 136315394;
        *(void *)(v23 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjects:count:]";
        *(_WORD *)(v23 + 12) = 2048;
        *(void *)(v23 + 14) = v12;
        CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: attempt to insert nil object from objects[%lu]",  "-[NSMutableArray replaceObjectsInRange:withObjects:count:]",  v12);
        SEL v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  location,  v21);
        objc_exception_throw(v24);
        goto LABEL_33;
      }

      ++v12;
    }

    while (a5 != v12);
    unint64_t v13 = a5;
    uint64_t v14 = a4;
    do
    {
      ++v14;
      --v13;
    }

    while (v13);
  }

  if (length >= a5) {
    unint64_t v16 = a5;
  }
  else {
    unint64_t v16 = length;
  }
  if (v16)
  {
    NSUInteger v17 = location;
    uint64_t v18 = a4;
    unint64_t v19 = v16;
    do
    {
      uint64_t v20 = (uint64_t)*v18++;
      -[NSMutableArray replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v17++, v20);
      --v19;
    }

    while (v19);
  }

  if (length > a5)
  {
    -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", v16 + location, length - v16);
    goto LABEL_27;
  }

  if (length >= a5)
  {
LABEL_27:
    if (!a5) {
      return;
    }
    goto LABEL_28;
  }

  -[NSMutableArray insertObjects:count:atIndex:]( self,  "insertObjects:count:atIndex:",  &a4[v16],  a5 - v16,  v16 + location);
  do
  {
LABEL_28:
    ++a4;
    --a5;
  }

  while (a5);
}

- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects
{
  v50[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
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
    uint64_t v47 = (char *)v50 - ((MEMORY[0x1895F8858](v45, v46) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v48 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v48 = 136315138;
    *(void *)(v48 + 4) = "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableArray replaceObjectsAtIndexes:withObjects:]");
    double v49 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v47,  v45);
    objc_exception_throw(v49);
    goto LABEL_33;
  }

- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray range:(NSRange)otherRange
{
  NSUInteger length = otherRange.length;
  NSUInteger location = otherRange.location;
  NSUInteger v9 = range.length;
  NSUInteger v10 = range.location;
  v47[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
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
    uint64_t v34 = _os_log_pack_size();
    uint64_t v36 = (char *)v47 - ((MEMORY[0x1895F8858](v34, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v37 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v37 = 136315138;
    *(void *)(v37 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:range:]");
    uint64_t v38 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v36,  v34);
    objc_exception_throw(v38);
LABEL_30:
    __break(1u);
    return;
  }

- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  v35[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    uint64_t v26 = _os_log_pack_size();
    uint64_t v28 = (char *)v35 - ((MEMORY[0x1895F8858](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v29 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v29 = 136315138;
    *(void *)(v29 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableArray replaceObjectsInRange:withObjectsFromArray:]");
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
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
    *(void *)(v37 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:range:]");
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(void *)(v29 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableArray replaceObjectsInRange:withObjectsFromOrderedSet:]");
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
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
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
    *(void *)(v29 + 4) = "-[NSMutableArray replaceObjectsInRange:withObjectsFromSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableArray replaceObjectsInRange:withObjectsFromSet:]");
    double v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v28,  v26);
    objc_exception_throw(v30);
LABEL_22:
    __break(1u);
    return;
  }

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  v22[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (a3) {
      goto LABEL_3;
    }
LABEL_9:
    a4 = _os_log_pack_size();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315138;
    *(void *)(v9 + 4) = "-[NSMutableArray setObject:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableArray setObject:atIndex:]");
    NSUInteger v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v22 - ((a4 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a4);
    objc_exception_throw(v10);
    goto LABEL_10;
  }

  if (!a3) {
    goto LABEL_9;
  }
LABEL_3:
  unint64_t v8 = -[NSArray count](self, "count");
  if ((a4 & 0x8000000000000000LL) == 0 && v8 >= a4)
  {
    if (-[NSArray count](self, "count") == a4) {
      -[NSMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", a3, a4);
    }
    else {
      -[NSMutableArray replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", a4, a3);
    }
    return;
  }

- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idx
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  -[NSMutableArray setObject:atIndex:](self, "setObject:atIndex:", obj, idx);
}

- (void)setArray:(NSArray *)otherArray
{
  v22[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
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
    uint64_t v14 = _os_log_pack_size();
    uint64_t v9 = v22;
    double v16 = (char *)v22 - ((MEMORY[0x1895F8858](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableArray setArray:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableArray setArray:]");
    uint64_t v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v16,  v14);
    objc_exception_throw(v18);
    __break(1u);
    goto LABEL_16;
  }

- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSMutableArray;
  return (id)objc_msgSend( -[NSArray sortedArrayFromRange:options:usingComparator:]( &v6,  sel_sortedArrayFromRange_options_usingComparator_,  a3.location,  a3.length,  a4,  a5),  "copy");
}

- (void)setOrderedSet:(id)a3
{
  v21[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
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
    uint64_t v16 = _os_log_pack_size();
    uint64_t v18 = (char *)v21 - ((MEMORY[0x1895F8858](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = "-[NSMutableArray setOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableArray setOrderedSet:]");
    id v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v18,  v16);
    objc_exception_throw(v20);
    __break(1u);
    return;
  }

- (void)setSet:(id)a3
{
  v21[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
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
    uint64_t v16 = _os_log_pack_size();
    uint64_t v18 = (char *)v21 - ((MEMORY[0x1895F8858](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = "-[NSMutableArray setSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableArray setSet:]");
    id v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v18,  v16);
    objc_exception_throw(v20);
    __break(1u);
    return;
  }

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  char v7 = a4;
  unint64_t length = a3.length;
  NSUInteger location = a3.location;
  v48[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
    if (a5) {
      goto LABEL_3;
    }
LABEL_28:
    unint64_t length = _os_log_pack_size();
    uint64_t v29 = (char *)&v45 - ((MEMORY[0x1895F8858](length, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSMutableArray sortRange:options:usingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSMutableArray sortRange:options:usingComparator:]");
    uint64_t v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v29,  length);
    objc_exception_throw(v31);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }

  if (!a5) {
    goto LABEL_28;
  }
LABEL_3:
  NSUInteger v11 = -[NSArray count](self, "count");
  NSUInteger v13 = v11;
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v11 < location + length)
  {
    if (v11)
    {
      uint64_t v32 = _os_log_pack_size();
      double v34 = (char *)&v45 - ((MEMORY[0x1895F8858](v32, v38) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v39 = _os_log_pack_fill();
      double v40 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v39,  (uint64_t)"-[NSMutableArray sortRange:options:usingComparator:]",  location,  length,  v13 - 1);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v40,  "-[NSMutableArray sortRange:options:usingComparator:]",  location,  length,  v13 - 1);
    }

    else
    {
      uint64_t v32 = _os_log_pack_size();
      double v34 = (char *)&v45 - ((MEMORY[0x1895F8858](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v35 = _os_log_pack_fill();
      double v36 = __os_log_helper_1_2_3_8_32_8_0_8_0( v35,  (uint64_t)"-[NSMutableArray sortRange:options:usingComparator:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v36,  "-[NSMutableArray sortRange:options:usingComparator:]",  location,  length);
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

  uint64_t v18 = -[NSArray getObjects:range:](self, "getObjects:range:", v17, location, length, v45);
  MEMORY[0x1895F8858](v18, v19);
  NSUInteger v21 = (char *)&v45 - v20;
  double v22 = (char *)&v45 - v20;
  if (length > 0x1000) {
    double v22 = (char *)malloc(8 * length);
  }
  v47[0] = MEMORY[0x1895F87A8];
  v47[1] = 3221225472LL;
  size_t v47[2] = __52__NSMutableArray_sortRange_options_usingComparator___block_invoke;
  v47[3] = &unk_189996258;
  v47[4] = a5;
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
  -[NSMutableArray replaceObjectsInRange:withObjects:count:]( self,  "replaceObjectsInRange:withObjects:count:",  location,  length);
  if (v21 != v22) {
    free(v22);
  }
  free(v25);
  free(v45);
}

uint64_t __52__NSMutableArray_sortRange_options_usingComparator___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(*(void *)(a1 + 40) + 8 * a2),  *(void *)(*(void *)(a1 + 40) + 8 * a3));
}

- (void)sortWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptr
{
  v14[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
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
    *(void *)(v12 + 4) = "-[NSMutableArray sortWithOptions:usingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSMutableArray sortWithOptions:usingComparator:]");
    NSUInteger v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v11,  v9);
    objc_exception_throw(v13);
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!cmptr) {
    goto LABEL_6;
  }
LABEL_3:
  NSUInteger v8 = -[NSArray count](self, "count");
  if (v8 >= 2) {
    -[NSMutableArray sortRange:options:usingComparator:]( self,  "sortRange:options:usingComparator:",  0LL,  v8,  opts,  cmptr);
  }
}

- (void)sortUsingComparator:(NSComparator)cmptr
{
  v12[1] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
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
    *(void *)(v10 + 4) = "-[NSMutableArray sortUsingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSMutableArray sortUsingComparator:]");
    NSUInteger v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v7);
    objc_exception_throw(v11);
  }

  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  if (!cmptr) {
    goto LABEL_6;
  }
LABEL_3:
  NSUInteger v6 = -[NSArray count](self, "count");
  if (v6 >= 2) {
    -[NSMutableArray sortRange:options:usingComparator:]( self,  "sortRange:options:usingComparator:",  0LL,  v6,  0LL,  cmptr);
  }
}

- (void)sortUsingFunction:(NSInteger (__cdecl *)compare context:
{
  v9[6] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (compare) {
      goto LABEL_3;
    }
LABEL_5:
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: function pointer cannot be NULL",  "-[NSMutableArray sortUsingFunction:context:]");
    uint64_t v8 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v8);
  }

  if (!compare) {
    goto LABEL_5;
  }
LABEL_3:
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  void v9[2] = __44__NSMutableArray_sortUsingFunction_context___block_invoke;
  v9[3] = &__block_descriptor_48_e11_q24__0_8_16l;
  v9[4] = compare;
  v9[5] = context;
  -[NSMutableArray sortWithOptions:usingComparator:](self, "sortWithOptions:usingComparator:", 0LL, v9);
}

uint64_t __44__NSMutableArray_sortUsingFunction_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

- (void)sortUsingFunction:(void *)a3 context:(void *)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v25[6] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
    if (a3) {
      goto LABEL_3;
    }
LABEL_10:
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: function pointer cannot be NULL",  "-[NSMutableArray sortUsingFunction:context:range:]");
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v12);
    goto LABEL_11;
  }

  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  NSUInteger v11 = -[NSArray count](self, "count");
  if ((location & 0x8000000000000000LL) == 0 && (length & 0x8000000000000000LL) == 0 && v11 >= location + length)
  {
    if (length != 1)
    {
      v25[0] = MEMORY[0x1895F87A8];
      v25[1] = 3221225472LL;
      v25[2] = __50__NSMutableArray_sortUsingFunction_context_range___block_invoke;
      v25[3] = &__block_descriptor_48_e11_q24__0_8_16l;
      v25[4] = a3;
      v25[5] = a4;
      -[NSMutableArray sortRange:options:usingComparator:]( self,  "sortRange:options:usingComparator:",  location,  length,  0LL,  v25);
    }

    return;
  }

uint64_t __50__NSMutableArray_sortUsingFunction_context_range___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 32))(a2, a3, *(void *)(a1 + 40));
}

- (void)sortUsingSelector:(SEL)comparator
{
  v6[5] = *MEMORY[0x1895F89C0];
  -[NSMutableArray _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    if (comparator) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (!comparator) {
LABEL_3:
  }
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", 0LL);
LABEL_4:
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  void v6[2] = __36__NSMutableArray_sortUsingSelector___block_invoke;
  v6[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v6[4] = comparator;
  -[NSMutableArray sortWithOptions:usingComparator:](self, "sortWithOptions:usingComparator:", 0LL, v6);
}

id __36__NSMutableArray_sortUsingSelector___block_invoke(uint64_t a1, id a2)
{
  return [a2 *(SEL *)(a1 + 32)];
}

- (NSMutableArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  v16[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4)
  {
LABEL_10:
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[NSMutableArray initWithObjects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = v4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSMutableArray initWithObjects:count:]",  v4);
    goto LABEL_12;
  }

  if (a4 >> 61)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[NSMutableArray initWithObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = v4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSMutableArray initWithObjects:count:]",  v4);
LABEL_12:
    uint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
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
    *(void *)(v9 + 4) = "-[NSMutableArray initWithObjects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = v6;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: attempt to insert nil object from objects[%lu]",  "-[NSMutableArray initWithObjects:count:]",  v6);
    uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v4);
    objc_exception_throw(v10);
    goto LABEL_10;
  }

- (id)arrayByAddingObjectsFromArray:(id)a3
{
  v24[1] = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v19 = _os_log_pack_size();
    uint64_t v21 = (char *)v24 - ((MEMORY[0x1895F8858](v19, v20) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)(v22 + 4) = "-[NSMutableArray arrayByAddingObjectsFromArray:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableArray arrayByAddingObjectsFromArray:]");
    uint64_t v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v21,  v19);
    objc_exception_throw(v23);
    __break(1u);
  }

  else
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
    }
    uint64_t v6 = [a3 count];
    NSUInteger v7 = -[NSArray count](self, "count");
    unint64_t v8 = v7 + v6;
    if ((v7 + v6) >> 60)
    {
      CFStringRef v17 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v7 + v6);
      uint64_t v18 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v17,  0LL);
      CFRelease(v17);
      objc_exception_throw(v18);
    }

    NSUInteger v9 = v7;
    if (v8 <= 1) {
      unint64_t v10 = 1LL;
    }
    else {
      unint64_t v10 = v7 + v6;
    }
    uint64_t v11 = (id *)_CFCreateArrayStorage(v10, 0, v24);
    if (v9) {
      -[NSArray getObjects:range:](self, "getObjects:range:", v11, 0LL, v9);
    }
    if (v6) {
      objc_msgSend(a3, "getObjects:range:", &v11[v9], 0, v6);
    }
    if (v11)
    {
      if (v8)
      {
        uint64_t v12 = v11;
        unint64_t v13 = v8;
        do
        {
          id v14 = *v12++;
          --v13;
        }

        while (v13);
      }

      uint64_t v15 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v11,  v8,  v8);
    }

    else
    {
      uint64_t v15 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", 0LL, v8);
    }

    return v15;
  }

  return result;
}

+ (NSMutableArray)arrayWithCapacity:(NSUInteger)numItems
{
  return (NSMutableArray *)(id)[objc_alloc((Class)a1) initWithCapacity:numItems];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
}

- (NSMutableArray)initWithCapacity:(NSUInteger)numItems
{
  return 0LL;
}

@end