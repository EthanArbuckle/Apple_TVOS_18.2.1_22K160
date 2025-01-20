@interface __NSCFDictionary
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (uint64_t)removeAllObjects;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObservationInfo:(void *)a3;
@end

@implementation __NSCFDictionary

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0LL;
}

- (unint64_t)count
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  return CFDictionaryGetCount((CFDictionaryRef)self);
}

- (id)objectForKey:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  return (id)CFDictionaryGetValue((CFDictionaryRef)self, a3);
}

- (id)keyEnumerator
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  return (id)[objc_allocWithZone((Class)__NSFastEnumerationEnumerator) initWithObject:self];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }

  __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  if (!a4)
  {
LABEL_7:
    _NSDictionaryRaiseInsertNilKeyException((objc_class *)self, a2);
LABEL_8:
    -[__NSCFDictionary setObject:forKey:].cold.1((objc_class *)self, a2);
    goto LABEL_9;
  }

- (void)removeObjectForKey:(id)a3
{
  if (_CFDictionaryIsMutable((uint64_t)self))
  {
    if (__cf_tsanWriteFunction) {
      __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
    }
    v7 = (objc_class *)self;
    if (a3)
    {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)self, a3);
      return;
    }
  }

  else
  {
    v7 = (objc_class *)-[__NSCFDictionary removeObjectForKey:].cold.1((objc_class *)self, a2);
  }

  v8 = (void *)_NSDictionaryRaiseRemoveNilKeyException(v7, a2);
  +[__NSCFDictionary automaticallyNotifiesObserversForKey:](v8, v9, v10);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)setObservationInfo:(void *)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  _CFDictionarySetKVOBit((uint64_t)self, a3 != 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSCFDictionary;
  -[__NSCFDictionary setObservationInfo:](&v5, sel_setObservationInfo_, a3);
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  if (_CFExecutableLinkedOnOrAfter(6uLL))
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS_____NSCFDictionary;
    return -[NSDictionary isEqual:](&v7, sel_isEqual_, a3);
  }

  else
  {
    return a3 && _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
  }

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
  }
  return _CFDictionaryFastEnumeration((__objc2_class **)self, (uint64_t *)a3, (uint64_t)a4, a5);
}

- (void)removeAllObjects
{
  if (_CFDictionaryIsMutable((uint64_t)self))
  {
    if (__cf_tsanWriteFunction) {
      __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableDictionary);
    }
    CFDictionaryRemoveAllValues((CFMutableDictionaryRef)self);
  }

  else
  {
    uint64_t v5 = (__NSCFDictionary *)-[__NSCFDictionary removeAllObjects].cold.1((objc_class *)self, a2);
    -[__NSCFDictionary copyWithZone:](v5, v6, v7);
  }

- (id)copyWithZone:(_NSZone *)a3
{
  theDict = self;
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
    self = theDict;
  }

  else {
    return theDict;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  return CFDictionaryCreateMutableCopy(0LL, 0LL, (CFDictionaryRef)self);
}

- (id)description
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  __CFDictionaryGetKeyCallbacks((uint64_t)self, (uint64_t)v10);
  uint64_t v4 = v11;
  __CFDictionaryGetValueCallbacks((uint64_t)self, v8);
  if (v4) {
    BOOL v5 = v4 == CFCopyDescription;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 || v9 && v9 != CFCopyDescription) {
    return (id)(id)CFCopyDescription(self);
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS_____NSCFDictionary;
  return -[NSDictionary description](&v7, sel_description);
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0LL;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (uint64_t)setObject:(objc_class *)a1 forKey:(const char *)a2 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_0_5(v4, @"%@: mutating method sent to immutable object");
  return -[__NSCFDictionary removeObjectForKey:].cold.1(v2);
}

- (uint64_t)removeObjectForKey:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_0_5(v4, @"%@: mutating method sent to immutable object");
  return -[__NSCFDictionary removeAllObjects].cold.1(v2);
}

- (uint64_t)removeAllObjects
{
  uint64_t v4 = __CFExceptionProem(a1, a2);
  uint64_t v2 = OUTLINED_FUNCTION_0_5(v4, @"%@: mutating method sent to immutable object");
  return _CFMachPortCreateWithPort4_cold_1(v2);
}

@end