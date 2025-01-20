@interface __NSCFSet
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)member:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (uint64_t)removeAllObjects;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addObject:(id)a3;
- (void)getObjects:(id *)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
@end

@implementation __NSCFSet

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0LL;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  if (_CFExecutableLinkedOnOrAfter(6uLL))
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS_____NSCFSet;
    return -[NSSet isEqual:](&v7, sel_isEqual_, a3);
  }

  else
  {
    return a3 && _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
  }

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0LL;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (id)description
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  double Callbacks = __CFSetGetCallbacks((uint64_t)self, (uint64_t)v8);
  if (v9 != CFCopyDescription && v9 != 0LL) {
    return (id)(id)CFCopyDescription(self);
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS_____NSCFSet;
  return -[NSSet description](&v7, sel_description, Callbacks);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (id)copyWithZone:(_NSZone *)a3
{
  theSet = self;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
    self = theSet;
  }

  else {
    return theSet;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  return CFSetCreateMutableCopy(0LL, 0LL, (CFSetRef)self);
}

- (unint64_t)count
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  return CFSetGetCount((CFSetRef)self);
}

- (id)member:(id)a3
{
  v7[1] = *(const void **)MEMORY[0x1895F89C0];
  if (!a3) {
    return 0LL;
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  if (CFSetGetValueIfPresent((CFSetRef)self, a3, v7)) {
    return (id)v7[0];
  }
  else {
    return 0LL;
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableSet);
  }
  return _CFSetFastEnumeration((__objc2_class **)self, (uint64_t *)a3, (uint64_t)a4, a5);
}

- (id)objectEnumerator
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  return (id)[objc_allocWithZone((Class)__NSFastEnumerationEnumerator) initWithObject:self];
}

- (void)addObject:(id)a3
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
  }
  if (_CFSetIsMutable((uint64_t)self))
  {
    objc_super v7 = (objc_class *)self;
    if (a3)
    {
      CFSetAddValue((CFMutableSetRef)self, a3);
      return;
    }
  }

  else
  {
    objc_super v7 = (objc_class *)-[__NSCFSet addObject:].cold.2((objc_class *)self, a2);
  }

  uint64_t v8 = (__NSCFSet *)-[__NSCFSet addObject:].cold.1(v7, a2);
  -[__NSCFSet removeObject:](v8, v9, v10);
}

- (void)removeObject:(id)a3
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableSet);
  }
  if (_CFSetIsMutable((uint64_t)self))
  {
    objc_super v7 = (objc_class *)self;
    if (a3)
    {
      CFSetRemoveValue((CFMutableSetRef)self, a3);
      return;
    }
  }

  else
  {
    objc_super v7 = (objc_class *)-[__NSCFSet removeObject:].cold.2((objc_class *)self, a2);
  }

  uint64_t v8 = (__NSCFSet *)-[__NSCFSet removeObject:].cold.1(v7, a2);
  -[__NSCFSet removeAllObjects](v8, v9);
}

- (void)removeAllObjects
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableSet);
  }
  if (_CFSetIsMutable((uint64_t)self))
  {
    CFSetRemoveAllValues((CFMutableSetRef)self);
  }

  else
  {
    uint64_t v5 = (__NSCFSet *)-[__NSCFSet removeAllObjects].cold.1((objc_class *)self, a2);
    -[__NSCFSet getObjects:](v5, v6, v7);
  }

- (void)getObjects:(id *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  CFIndex Count = CFSetGetCount((CFSetRef)self);
  if (a3)
  {
    if (Count) {
      CFSetGetValues((CFSetRef)self, (const void **)a3);
    }
  }

- (uint64_t)addObject:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_0_35(v4, @"%@: attempt to insert nil");
  return -[__NSCFSet addObject:].cold.2(v2);
}

- (uint64_t)addObject:(objc_class *)a1 .cold.2(objc_class *a1, const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_0_35(v4, @"%@: mutating method sent to immutable object");
  return -[__NSCFSet removeObject:].cold.1(v2);
}

- (uint64_t)removeObject:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_0_35(v4, @"%@: attempt to remove nil");
  return -[__NSCFSet removeObject:].cold.2(v2);
}

- (uint64_t)removeObject:(objc_class *)a1 .cold.2(objc_class *a1, const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_0_35(v4, @"%@: mutating method sent to immutable object");
  return -[__NSCFSet removeAllObjects].cold.1(v2);
}

- (uint64_t)removeAllObjects
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_0_35(v4, @"%@: mutating method sent to immutable object");
  return __CFPREFERENCES_HAS_DETECTED_THIS_APP_TRYING_TO_STORE_TOO_MUCH_DATA__(v2);
}

@end