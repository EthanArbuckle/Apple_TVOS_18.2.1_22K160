@interface NSMutableSet
+ (NSMutableSet)setWithCapacity:(NSUInteger)numItems;
- (NSMutableSet)initWithCapacity:(NSUInteger)numItems;
- (NSMutableSet)initWithObjects:(const void *)a3 count:(unint64_t)a4;
- (id)setByAddingObjectsFromArray:(id)a3;
- (id)setByAddingObjectsFromSet:(id)a3;
- (void)addObject:(id)object;
- (void)addObjects:(const void *)a3 count:(unint64_t)a4;
- (void)addObjectsFromArray:(NSArray *)array;
- (void)addObjectsFromArray:(id)a3 range:(_NSRange)a4;
- (void)addObjectsFromOrderedSet:(id)a3;
- (void)addObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4;
- (void)addObjectsFromSet:(id)a3;
- (void)intersectOrderedSet:(id)a3;
- (void)intersectSet:(NSSet *)otherSet;
- (void)minusOrderedSet:(id)a3;
- (void)minusSet:(NSSet *)otherSet;
- (void)removeAllObjects;
- (void)removeObject:(id)object;
- (void)removeObjectsInArray:(id)a3;
- (void)removeObjectsInArray:(id)a3 range:(_NSRange)a4;
- (void)removeObjectsInOrderedSet:(id)a3;
- (void)removeObjectsInOrderedSet:(id)a3 range:(_NSRange)a4;
- (void)removeObjectsInSet:(id)a3;
- (void)removeObjectsPassingTest:(id)a3;
- (void)removeObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)replaceObject:(id)a3;
- (void)setArray:(id)a3;
- (void)setObject:(id)a3;
- (void)setOrderedSet:(id)a3;
- (void)setSet:(NSSet *)otherSet;
- (void)unionOrderedSet:(id)a3;
- (void)unionSet:(NSSet *)otherSet;
@end

@implementation NSMutableSet

- (void)addObjects:(const void *)a3 count:(unint64_t)a4
{
  v17[1] = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
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
LABEL_14:
    uint64_t v12 = _os_log_pack_size();
    v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[NSMutableSet addObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSMutableSet addObjects:count:]",  a4);
    goto LABEL_16;
  }

- (void)addObjectsFromArray:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v33[1] = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
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
    v26 = (char *)v33 - ((MEMORY[0x1895F8858](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136315138;
    *(void *)(v27 + 4) = "-[NSMutableSet addObjectsFromArray:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableSet addObjectsFromArray:range:]");
    v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v26,  v24);
    objc_exception_throw(v28);
LABEL_23:
    __break(1u);
    return;
  }

- (void)addObjectsFromArray:(NSArray *)array
{
  uint64_t v4 = array;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (array)
  {
    objc_lookUpClass("NSArray");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableSet addObjectsFromArray:]");
      uint64_t v6 = _CFAutoreleasePoolAddObject();
      CFLog(3LL, (uint64_t)@"%@", v7, v8, v9, v10, v11, v12, v6);
      objc_lookUpClass("NSSet");
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        uint64_t v4 = -[NSArray allObjects](v4, "allObjects");
      }
    }
  }

  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!v4) {
      goto LABEL_8;
    }
  }

  else if (!v4)
  {
    goto LABEL_8;
  }

  if ((_NSIsNSArray((uint64_t)v4) & 1) == 0)
  {
    uint64_t v17 = _os_log_pack_size();
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[NSMutableSet addObjectsFromArray:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableSet addObjectsFromArray:]");
    uint64_t v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v23[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v17);
    objc_exception_throw(v19);
    -[NSMutableSet addObjectsFromOrderedSet:range:](v20, v21, v22, v29);
    return;
  }

- (void)addObjectsFromOrderedSet:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v33[1] = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
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
    __int128 v26 = (char *)v33 - ((MEMORY[0x1895F8858](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136315138;
    *(void *)(v27 + 4) = "-[NSMutableSet addObjectsFromOrderedSet:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableSet addObjectsFromOrderedSet:range:]");
    uint64_t v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v26,  v24);
    objc_exception_throw(v28);
LABEL_23:
    __break(1u);
    return;
  }

- (void)addObjectsFromOrderedSet:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
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
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableSet addObjectsFromOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableSet addObjectsFromOrderedSet:]");
    unint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v10);
    objc_exception_throw(v12);
    -[NSMutableSet addObjectsFromSet:](v13, v14, v15);
    return;
  }

- (void)addObjectsFromSet:(id)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_17;
    }
  }

  else if (!a3)
  {
    goto LABEL_17;
  }

  if ((_NSIsNSSet((uint64_t)a3) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }

  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    uint64_t v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog( 3LL,  (uint64_t)@"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s",  v8,  v9,  v10,  v11,  v12,  v13,  v7);
  }

  SEL v14 = (void *)objc_opt_new();
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  uint64_t v15 = [a3 countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v38;
    do
    {
      for (uint64_t i = 0LL; i != v16; ++i)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(a3);
        }
        [v14 addObject:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      }

      uint64_t v16 = [a3 countByEnumeratingWithState:&v37 objects:v36 count:16];
    }

    while (v16);
  }

  a3 = v14;
  if (a3)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
    {
      uint64_t v23 = _os_log_pack_size();
      uint64_t v25 = &v31[-((MEMORY[0x1895F8858](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
      uint64_t v26 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v26 = 136315138;
      *(void *)(v26 + 4) = "-[NSMutableSet addObjectsFromSet:]";
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableSet addObjectsFromSet:]");
      uint64_t v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v25,  v23);
      objc_exception_throw(v27);
      -[NSMutableSet intersectOrderedSet:](v28, v29, v30);
      return;
    }
  }

- (void)intersectOrderedSet:(id)a3
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
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
    uint64_t v26 = (char *)&v32 - ((MEMORY[0x1895F8858](v24, v25) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v27 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v27 = 136315138;
    *(void *)(v27 + 4) = "-[NSMutableSet intersectOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableSet intersectOrderedSet:]");
    uint64_t v28 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v26,  v24);
    objc_exception_throw(v28);
LABEL_36:
    __break(1u);
    return;
  }

- (void)intersectSet:(NSSet *)otherSet
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!otherSet) {
      goto LABEL_17;
    }
  }

  else if (!otherSet)
  {
    goto LABEL_17;
  }

  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }

  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    uint64_t v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog( 3LL,  (uint64_t)@"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s",  v8,  v9,  v10,  v11,  v12,  v13,  v7);
  }

  uint64_t v14 = (void *)objc_opt_new();
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  unint64_t v15 = -[NSSet countByEnumeratingWithState:objects:count:]( otherSet,  "countByEnumeratingWithState:objects:count:",  &v55,  v54,  16LL);
  if (v15)
  {
    uint64_t v16 = *(void *)v56;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v56 != v16) {
          objc_enumerationMutation(otherSet);
        }
        [v14 addObject:*(void *)(*((void *)&v55 + 1) + 8 * i)];
      }

      unint64_t v15 = -[NSSet countByEnumeratingWithState:objects:count:]( otherSet,  "countByEnumeratingWithState:objects:count:",  &v55,  v54,  16LL);
    }

    while (v15);
  }

  otherSet = v14;
  if (otherSet)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) == 0)
    {
      uint64_t v35 = _os_log_pack_size();
      __int128 v37 = (char *)&v42 - ((MEMORY[0x1895F8858](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v38 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v38 = 136315138;
      *(void *)(v38 + 4) = "-[NSMutableSet intersectSet:]";
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableSet intersectSet:]");
      __int128 v39 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v37,  v35);
      objc_exception_throw(v39);
LABEL_50:
      __break(1u);
      return;
    }
  }

- (void)minusOrderedSet:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
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
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSMutableSet minusOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableSet minusOrderedSet:]");
    unint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v19[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v13);
    objc_exception_throw(v15);
    -[NSMutableSet minusSet:](v16, v17, v18);
    return;
  }

- (void)minusSet:(NSSet *)otherSet
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!otherSet) {
      goto LABEL_17;
    }
  }

  else if (!otherSet)
  {
    goto LABEL_17;
  }

  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }

  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    uint64_t v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog( 3LL,  (uint64_t)@"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s",  v8,  v9,  v10,  v11,  v12,  v13,  v7);
  }

  uint64_t v14 = (void *)objc_opt_new();
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  unint64_t v15 = -[NSSet countByEnumeratingWithState:objects:count:]( otherSet,  "countByEnumeratingWithState:objects:count:",  &v39,  v38,  16LL);
  if (v15)
  {
    unint64_t v16 = v15;
    uint64_t v17 = *(void *)v40;
    do
    {
      for (uint64_t i = 0LL; i != v16; ++i)
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(otherSet);
        }
        [v14 addObject:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }

      unint64_t v16 = -[NSSet countByEnumeratingWithState:objects:count:]( otherSet,  "countByEnumeratingWithState:objects:count:",  &v39,  v38,  16LL);
    }

    while (v16);
  }

  otherSet = v14;
  if (otherSet)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) == 0)
    {
      uint64_t v26 = _os_log_pack_size();
      uint64_t v28 = &v33[-((MEMORY[0x1895F8858](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
      uint64_t v29 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v29 = 136315138;
      *(void *)(v29 + 4) = "-[NSMutableSet minusSet:]";
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableSet minusSet:]");
      id v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v28,  v26);
      objc_exception_throw(v30);
      -[NSMutableSet removeAllObjects](v31, v32);
      return;
    }
  }

- (void)removeAllObjects
{
  v15[1] = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableSet);
  }
  NSUInteger v4 = -[NSSet count](self, "count");
  unint64_t v6 = v4;
  if (v4 >> 60)
  {
    CFStringRef v13 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v4);
    uint64_t v14 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v13,  0LL);
    CFRelease(v13);
    objc_exception_throw(v14);
  }

  if (v4 <= 1) {
    NSUInteger v4 = 1LL;
  }
  unint64_t v7 = MEMORY[0x1895F8858](v4, v5);
  uint64_t v9 = (char *)v15 - v8;
  if (v6 >= 0x101)
  {
    uint64_t v9 = (char *)_CFCreateArrayStorage(v7, 0, v15);
    uint64_t v10 = v9;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  -[NSSet getObjects:count:](self, "getObjects:count:", v9, v6);
  if (v6)
  {
    for (uint64_t i = 0LL; i != v6; ++i)
    {
      unint64_t v12 = -[NSSet countForObject:](self, "countForObject:", *(void *)&v9[8 * i]) + 1;
      while (--v12)
        -[NSMutableSet removeObject:](self, "removeObject:", *(void *)&v9[8 * i]);
    }
  }

  free(v10);
}

- (void)removeObjectsInArray:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  uint64_t location = a4.location;
  v23[1] = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
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
    *(void *)(v14 + 4) = "-[NSMutableSet removeObjectsInArray:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableSet removeObjectsInArray:range:]");
    unint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  length,  location);
    objc_exception_throw(v15);
    goto LABEL_15;
  }

- (void)removeObjectsInArray:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
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
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableSet removeObjectsInArray:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableSet removeObjectsInArray:]");
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v10);
    objc_exception_throw(v12);
    -[NSMutableSet removeObjectsInOrderedSet:range:](v13, v14, v15, v22);
    return;
  }

- (void)removeObjectsInOrderedSet:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  uint64_t location = a4.location;
  v23[1] = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
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
    *(void *)(v14 + 4) = "-[NSMutableSet removeObjectsInOrderedSet:range:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableSet removeObjectsInOrderedSet:range:]");
    id v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  length,  location);
    objc_exception_throw(v15);
    goto LABEL_15;
  }

- (void)removeObjectsInOrderedSet:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
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
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableSet removeObjectsInOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableSet removeObjectsInOrderedSet:]");
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v10);
    objc_exception_throw(v12);
    -[NSMutableSet removeObjectsInSet:](v13, v14, v15);
    return;
  }

- (void)removeObjectsInSet:(id)a3
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!a3) {
      goto LABEL_17;
    }
  }

  else if (!a3)
  {
    goto LABEL_17;
  }

  if ((_NSIsNSSet((uint64_t)a3) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }

  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    uint64_t v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog( 3LL,  (uint64_t)@"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s",  v8,  v9,  v10,  v11,  v12,  v13,  v7);
  }

  SEL v14 = (void *)objc_opt_new();
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  uint64_t v15 = [a3 countByEnumeratingWithState:&v38 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v39;
    do
    {
      for (uint64_t i = 0LL; i != v16; ++i)
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(a3);
        }
        [v14 addObject:*(void *)(*((void *)&v38 + 1) + 8 * i)];
      }

      uint64_t v16 = [a3 countByEnumeratingWithState:&v38 objects:v37 count:16];
    }

    while (v16);
  }

  a3 = v14;
  if (a3)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)a3) & 1) == 0)
    {
      uint64_t v23 = _os_log_pack_size();
      unint64_t v25 = &v32[-((MEMORY[0x1895F8858](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
      uint64_t v26 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v26 = 136315138;
      *(void *)(v26 + 4) = "-[NSMutableSet removeObjectsInSet:]";
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableSet removeObjectsInSet:]");
      uint64_t v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v25,  v23);
      objc_exception_throw(v27);
      -[NSMutableSet removeObjectsWithOptions:passingTest:](v28, v29, v30, v31);
      return;
    }
  }

- (void)removeObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  char v6 = a3;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v14 = _os_log_pack_size();
    uint64_t v16 = (char *)&v20[-1] - ((MEMORY[0x1895F8858](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[NSMutableSet removeObjectsWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSMutableSet removeObjectsWithOptions:passingTest:]");
    __int128 v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v16,  v14);
    objc_exception_throw(v18);
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableSet);
  if (!a4) {
    goto LABEL_12;
  }
LABEL_3:
  char v8 = v6 & 0xFD;
  uint64_t v9 = +[NSSet set](&OBJC_CLASS___NSMutableSet, "set");
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v27 = 0u;
  uint64_t v30 = 0LL;
  uint64_t v26 = 850045857LL;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __53__NSMutableSet_removeObjectsWithOptions_passingTest___block_invoke;
  v20[3] = &unk_18972DB18;
  v20[5] = a4;
  v20[6] = &v26;
  v20[4] = v9;
  __NSSetEnumerate(self, v8, (uint64_t)v20);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v10 = -[NSSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        -[NSMutableSet removeObject:](self, "removeObject:", *(void *)(*((void *)&v22 + 1) + 8 * i));
      }

      uint64_t v11 = -[NSSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
    }

    while (v11);
  }

uint64_t __53__NSMutableSet_removeObjectsWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2)
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

- (void)removeObjectsPassingTest:(id)a3
{
  v6[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v3 = _os_log_pack_size();
    uint64_t v4 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v4 + 4) = "-[NSMutableSet removeObjectsPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSMutableSet removeObjectsPassingTest:]");
    uint64_t v5 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v3);
    objc_exception_throw(v5);
  }

  -[NSMutableSet removeObjectsWithOptions:passingTest:](self, "removeObjectsWithOptions:passingTest:", 0LL, a3);
}

- (void)replaceObject:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSMutableSet replaceObject:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableSet replaceObject:]");
    uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
  if (!a3) {
    goto LABEL_8;
  }
LABEL_3:
  id v6 = -[NSSet member:](self, "member:", a3);
  if (v6 != a3)
  {
    if (v6)
    {
      -[NSMutableSet removeObject:](self, "removeObject:", v6);
      -[NSMutableSet addObject:](self, "addObject:", a3);
    }
  }

- (void)setObject:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSMutableSet setObject:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSMutableSet setObject:]");
    uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
  if (!a3) {
    goto LABEL_9;
  }
LABEL_3:
  id v6 = -[NSSet member:](self, "member:", a3);
  if (v6 != a3)
  {
    if (v6) {
      -[NSMutableSet removeObject:](self, "removeObject:", v6);
    }
    -[NSMutableSet addObject:](self, "addObject:", a3);
  }

- (void)setArray:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
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
    uint64_t v10 = _os_log_pack_size();
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSMutableSet setArray:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableSet setArray:]");
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v10);
    objc_exception_throw(v12);
    -[NSMutableSet setOrderedSet:](v13, v14, v15);
    return;
  }

- (void)setOrderedSet:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
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
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSMutableSet setOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableSet setOrderedSet:]");
    id v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v19[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v13);
    objc_exception_throw(v15);
    -[NSMutableSet setSet:](v16, v17, v18);
    return;
  }

- (void)setSet:(NSSet *)otherSet
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!otherSet) {
      goto LABEL_17;
    }
  }

  else if (!otherSet)
  {
    goto LABEL_17;
  }

  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }

  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    uint64_t v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog( 3LL,  (uint64_t)@"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s",  v8,  v9,  v10,  v11,  v12,  v13,  v7);
  }

  uint64_t v14 = (void *)objc_opt_new();
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  unint64_t v15 = -[NSSet countByEnumeratingWithState:objects:count:]( otherSet,  "countByEnumeratingWithState:objects:count:",  &v40,  v39,  16LL);
  if (v15)
  {
    unint64_t v16 = v15;
    uint64_t v17 = *(void *)v41;
    do
    {
      for (uint64_t i = 0LL; i != v16; ++i)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(otherSet);
        }
        [v14 addObject:*(void *)(*((void *)&v40 + 1) + 8 * i)];
      }

      unint64_t v16 = -[NSSet countByEnumeratingWithState:objects:count:]( otherSet,  "countByEnumeratingWithState:objects:count:",  &v40,  v39,  16LL);
    }

    while (v16);
  }

  otherSet = v14;
  if (otherSet)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) == 0)
    {
      uint64_t v26 = _os_log_pack_size();
      __int128 v28 = &v34[-((MEMORY[0x1895F8858](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
      uint64_t v29 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v29 = 136315138;
      *(void *)(v29 + 4) = "-[NSMutableSet setSet:]";
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableSet setSet:]");
      uint64_t v30 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v28,  v26);
      objc_exception_throw(v30);
      -[NSMutableSet unionOrderedSet:](v31, v32, v33);
      return;
    }
  }

- (void)unionOrderedSet:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
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
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSMutableSet unionOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSMutableSet unionOrderedSet:]");
    unint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v19[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v13);
    objc_exception_throw(v15);
    -[NSMutableSet unionSet:](v16, v17, v18);
    return;
  }

- (void)unionSet:(NSSet *)otherSet
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  -[NSMutableSet _mutate](self, "_mutate");
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
    if (!otherSet) {
      goto LABEL_17;
    }
  }

  else if (!otherSet)
  {
    goto LABEL_17;
  }

  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_16;
  }

  if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
  {
    uint64_t v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog( 3LL,  (uint64_t)@"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s",  v8,  v9,  v10,  v11,  v12,  v13,  v7);
  }

  uint64_t v14 = (void *)objc_opt_new();
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  unint64_t v15 = -[NSSet countByEnumeratingWithState:objects:count:]( otherSet,  "countByEnumeratingWithState:objects:count:",  &v35,  v34,  16LL);
  if (v15)
  {
    uint64_t v16 = *(void *)v36;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(otherSet);
        }
        [v14 addObject:*(void *)(*((void *)&v35 + 1) + 8 * i)];
      }

      unint64_t v15 = -[NSSet countByEnumeratingWithState:objects:count:]( otherSet,  "countByEnumeratingWithState:objects:count:",  &v35,  v34,  16LL);
    }

    while (v15);
  }

  otherSet = v14;
  if (otherSet)
  {
LABEL_16:
    if ((_NSIsNSSet((uint64_t)otherSet) & 1) == 0)
    {
      uint64_t v29 = _os_log_pack_size();
      uint64_t v31 = (char *)v34 - ((MEMORY[0x1895F8858](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v32 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v32 = 136315138;
      *(void *)(v32 + 4) = "-[NSMutableSet unionSet:]";
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableSet unionSet:]");
      id v33 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v31,  v29);
      objc_exception_throw(v33);
      goto LABEL_34;
    }
  }

- (NSMutableSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  v17[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4) {
    goto LABEL_13;
  }
  if (a4 >> 61)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[NSMutableSet initWithObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = v4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSMutableSet initWithObjects:count:]",  v4);
LABEL_15:
    uint64_t v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v13,  v12);
    objc_exception_throw(v16);
  }

  if (!a4) {
    return -[NSMutableSet initWithCapacity:](self, "initWithCapacity:", 0LL);
  }
  for (uint64_t i = 0LL; i != a4; ++i)
  {
    if (!a3[i])
    {
      unint64_t v4 = _os_log_pack_size();
      uint64_t v10 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v10 = 136315394;
      *(void *)(v10 + 4) = "-[NSMutableSet initWithObjects:count:]";
      *(_WORD *)(v10 + 12) = 2048;
      *(void *)(v10 + 14) = i;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: attempt to insert nil object from objects[%lu]",  "-[NSMutableSet initWithObjects:count:]",  i);
      uint64_t v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v4);
      objc_exception_throw(v11);
LABEL_13:
      uint64_t v12 = _os_log_pack_size();
      uint64_t v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v14 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v14 = 136315394;
      *(void *)(v14 + 4) = "-[NSMutableSet initWithObjects:count:]";
      *(_WORD *)(v14 + 12) = 2048;
      *(void *)(v14 + 14) = v4;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSMutableSet initWithObjects:count:]",  v4);
      goto LABEL_15;
    }
  }

  for (uint64_t j = -[NSMutableSet initWithCapacity:](self, "initWithCapacity:", a4); v4; --v4)
  {
    uint64_t v8 = (uint64_t)*v5++;
    -[NSMutableSet addObject:](j, "addObject:", v8);
  }

  return j;
}

- (id)setByAddingObjectsFromArray:(id)a3
{
  v24[1] = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v19 = _os_log_pack_size();
    unint64_t v21 = (char *)v24 - ((MEMORY[0x1895F8858](v19, v20) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)(v22 + 4) = "-[NSMutableSet setByAddingObjectsFromArray:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSMutableSet setByAddingObjectsFromArray:]");
    __int128 v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v21,  v19);
    objc_exception_throw(v23);
    __break(1u);
    return result;
  }

  uint64_t v5 = [a3 count];
  NSUInteger v6 = -[NSSet count](self, "count");
  unint64_t v8 = v6 + v5;
  if ((v6 + v5) >> 60)
  {
    CFStringRef v17 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v6 + v5);
    NSUInteger v18 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v17,  0LL);
    CFRelease(v17);
    objc_exception_throw(v18);
  }

  NSUInteger v9 = v6;
  if (v8 <= 1) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = v6 + v5;
  }
  unint64_t v11 = MEMORY[0x1895F8858](v10, v7);
  uint64_t v13 = (char *)v24 - v12;
  if (v8 < 0x101)
  {
    uint64_t v14 = 0LL;
    if (!v9) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  uint64_t v13 = (char *)_CFCreateArrayStorage(v11, 0, v24);
  uint64_t v14 = v13;
  if (v9) {
LABEL_11:
  }
    -[NSSet getObjects:count:](self, "getObjects:count:", v13, v9);
LABEL_12:
  if (v5) {
    objc_msgSend(a3, "getObjects:range:", &v13[8 * v9], 0, v5);
  }
  uint64_t v15 = +[NSSet setWithObjects:count:](&OBJC_CLASS___NSSet, "setWithObjects:count:", v13, v8);
  free(v14);
  return v15;
}

- (id)setByAddingObjectsFromSet:(id)a3
{
  id v3 = a3;
  uint64_t v41 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if ((_NSIsNSSet((uint64_t)a3) & 1) != 0
      || _CFExecutableLinkedOnOrAfter(7uLL)
      || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
    {
      goto LABEL_15;
    }

    if ((unint64_t)++__checkForAndForgiveClientSin_cnt <= 0x64)
    {
      uint64_t v6 = __CFExceptionProem((objc_class *)self, a2);
      CFLog( 3LL,  (uint64_t)@"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s",  v7,  v8,  v9,  v10,  v11,  v12,  v6);
    }

    uint64_t v13 = (void *)objc_opt_new();
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    uint64_t v14 = [v3 countByEnumeratingWithState:&v37 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v38;
      do
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v3);
          }
          [v13 addObject:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        }

        uint64_t v14 = [v3 countByEnumeratingWithState:&v37 objects:v36 count:16];
      }

      while (v14);
    }

    id v3 = v13;
    if (v3)
    {
LABEL_15:
      if ((_NSIsNSSet((uint64_t)v3) & 1) == 0)
      {
        uint64_t v31 = _os_log_pack_size();
        id v33 = (char *)v36 - ((MEMORY[0x1895F8858](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v34 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v34 = 136315138;
        *(void *)(v34 + 4) = "-[NSMutableSet setByAddingObjectsFromSet:]";
        CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSMutableSet setByAddingObjectsFromSet:]");
        __int128 v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v33,  v31);
        objc_exception_throw(v35);
        goto LABEL_30;
      }
    }
  }

  uint64_t v17 = [v3 count];
  NSUInteger v18 = -[NSSet count](self, "count");
  NSUInteger v20 = v18;
  unint64_t v21 = v18 + v17;
  if ((v18 + v17) >> 60)
  {
    CFStringRef v29 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v18 + v17);
    uint64_t v30 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v29,  0LL);
    CFRelease(v29);
    objc_exception_throw(v30);
LABEL_30:
    __break(1u);
    return result;
  }

  if (v21 <= 1) {
    uint64_t v22 = 1LL;
  }
  else {
    uint64_t v22 = v18 + v17;
  }
  unint64_t v23 = MEMORY[0x1895F8858](v22, v19);
  unint64_t v25 = (char *)v36 - v24;
  if (v21 < 0x101)
  {
    unint64_t v26 = 0LL;
    if (!v20) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }

  unint64_t v25 = (char *)_CFCreateArrayStorage(v23, 0, v36);
  unint64_t v26 = v25;
  if (v20) {
LABEL_24:
  }
    -[NSSet getObjects:count:](self, "getObjects:count:", v25, v20);
LABEL_25:
  if (v17) {
    [v3 getObjects:&v25[8 * v20] count:v17];
  }
  CFStringRef v27 = +[NSSet setWithObjects:count:](&OBJC_CLASS___NSSet, "setWithObjects:count:", v25, v21);
  free(v26);
  return v27;
}

+ (NSMutableSet)setWithCapacity:(NSUInteger)numItems
{
  return (NSMutableSet *)(id)[objc_alloc((Class)a1) initWithCapacity:numItems];
}

- (void)addObject:(id)object
{
  unint64_t v4 = __CFLookUpClass("NSMutableSet");
  OUTLINED_FUNCTION_0(v4, (uint64_t)self);
}

- (void)removeObject:(id)object
{
  unint64_t v4 = __CFLookUpClass("NSMutableSet");
  OUTLINED_FUNCTION_0(v4, (uint64_t)self);
}

- (NSMutableSet)initWithCapacity:(NSUInteger)numItems
{
  unint64_t v4 = __CFLookUpClass("NSMutableSet");
  __CFRequireConcreteImplementation(v4, (uint64_t)self);
  return 0LL;
}

@end