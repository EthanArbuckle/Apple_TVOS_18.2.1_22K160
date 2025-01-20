@interface __NSCFArray
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
@end

@implementation __NSCFArray

- (unint64_t)count
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  return _CFNonObjCArrayGetCount((uint64_t)self);
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  char v9 = 0;
  id result = (id)_CFArrayCheckAndGetValueAtIndex((unint64_t *)self, a3, &v9);
  if (v9)
  {
    uint64_t Count = _CFNonObjCArrayGetCount((uint64_t)self);
    _NSArrayRaiseBoundException((uint64_t)self, a2, a3, Count);
  }

  return result;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  char v9 = 0;
  id result = (id)_CFArrayCheckAndGetValueAtIndex((unint64_t *)self, a3, &v9);
  if (v9)
  {
    uint64_t Count = _CFNonObjCArrayGetCount((uint64_t)self);
    _NSArrayRaiseBoundException((uint64_t)self, a2, a3, Count);
  }

  return result;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  unint64_t Count = _CFNonObjCArrayGetCount((uint64_t)self);
  unint64_t v11 = location + length;
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || Count < v11)
  {
    v12 = (void *)_NSArrayRaiseBoundException((uint64_t)self, a2, v11 - 1, Count);
    +[__NSCFArray automaticallyNotifiesObserversForKey:](v12, v13, v14);
  }

  else if (length)
  {
    v15.NSUInteger location = location;
    v15.NSUInteger length = length;
    CFArrayGetValues((CFArrayRef)self, v15, (const void **)a3);
  }

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  }
  return _CFArrayFastEnumeration((unint64_t *)self, a3);
}

- (void)addObject:(id)a3
{
}

- (void)removeLastObject
{
  uint64_t Count = _CFNonObjCArrayGetCount((uint64_t)self);
  if (_CFExecutableLinkedOnOrAfter(7uLL))
  {
    if (!Count) {
      return;
    }
    uint64_t v4 = Count - 1;
  }

  else if (Count)
  {
    uint64_t v4 = Count - 1;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  -[__NSCFArray removeObjectAtIndex:](self, "removeObjectAtIndex:", v4);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  v9[1] = *MEMORY[0x1895F89C0];
  v9[0] = a3;
  if (!__cf_tsanWriteFunction)
  {
    if (a3) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!a3)
  {
LABEL_7:
    _NSArrayRaiseInsertNilException((uint64_t)self, a2);
LABEL_8:
    -[__NSCFArray insertObject:atIndex:].cold.2((objc_class *)self, a2);
LABEL_9:
    -[__NSCFArray insertObject:atIndex:].cold.1((uint64_t)self, a2, a4);
  }

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  if (!a4)
  {
LABEL_7:
    _NSArrayRaiseInsertNilException((uint64_t)self, a2);
LABEL_8:
    -[__NSCFArray replaceObjectAtIndex:withObject:].cold.1((objc_class *)self, a2);
    goto LABEL_9;
  }

- (void)removeObjectAtIndex:(unint64_t)a3
{
  if (_CFArrayIsMutable((uint64_t)self))
  {
    if (__cf_tsanWriteFunction) {
      __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
    }
    if (_CFNonObjCArrayGetCount((uint64_t)self) > a3)
    {
      _CFArrayReplaceValues((unint64_t)self, a3, 1LL, 0LL, 0LL);
      return;
    }
  }

  else
  {
    -[__NSCFArray removeObjectAtIndex:].cold.1((objc_class *)self, a2);
  }

  uint64_t Count = _CFNonObjCArrayGetCount((uint64_t)self);
  v8 = (__NSCFArray *)_NSArrayRaiseBoundException((uint64_t)self, a2, a3, Count);
  -[__NSCFArray classForCoder](v8, v9);
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0LL;
}

- (BOOL)isEqual:(id)a3
{
  if (!__cf_tsanReadFunction)
  {
    if (a3) {
      return self == a3 || _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
    }
    return 0;
  }

  __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  if (!a3) {
    return 0;
  }
  return self == a3 || _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
}

- (id)description
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  copyDescription = __CFArrayGetCallBacks((uint64_t)self)->copyDescription;
  if (copyDescription != CFCopyDescription && copyDescription != 0LL) {
    return (id)(id)CFCopyDescription(self);
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS_____NSCFArray;
  return -[NSArray description](&v7, sel_description);
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0LL;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  theArray = self;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
    self = theArray;
  }

  else {
    return theArray;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  return CFArrayCreateMutableCopy(0LL, 0LL, (CFArrayRef)self);
}

- (uint64_t)insertObject:(unint64_t)a3 atIndex:.cold.1(uint64_t a1, const char *a2, unint64_t a3)
{
  uint64_t Count = _CFNonObjCArrayGetCount(a1);
  uint64_t v7 = _NSArrayRaiseBoundException(a1, a2, a3, Count + 1);
  return -[__NSCFArray insertObject:atIndex:].cold.2(v7);
}

- (uint64_t)insertObject:(objc_class *)a1 atIndex:(const char *)a2 .cold.2(objc_class *a1, const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_3_3(v4, @"%@: mutating method sent to immutable object");
  return -[__NSCFArray replaceObjectAtIndex:withObject:].cold.1(v2);
}

- (uint64_t)replaceObjectAtIndex:(objc_class *)a1 withObject:(const char *)a2 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_3_3(v4, @"%@: mutating method sent to immutable object");
  return -[__NSCFArray removeObjectAtIndex:].cold.1(v2);
}

- (void)removeObjectAtIndex:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_3_3(v4, @"%@: mutating method sent to immutable object");
  _CFCopyHomeDirURLForUser_cold_1(v2, v3);
}

@end