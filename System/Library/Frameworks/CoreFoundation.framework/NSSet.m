@interface NSSet
+ (BOOL)supportsSecureCoding;
+ (NSSet)allocWithZone:(_NSZone *)a3;
+ (NSSet)set;
+ (NSSet)setWithArray:(NSArray *)array;
+ (NSSet)setWithArray:(id)a3 copyItems:(BOOL)a4;
+ (NSSet)setWithArray:(id)a3 range:(_NSRange)a4;
+ (NSSet)setWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
+ (NSSet)setWithObject:(id)object;
+ (NSSet)setWithObjects:(id *)objects count:(NSUInteger)cnt;
+ (NSSet)setWithObjects:(id)firstObj;
+ (NSSet)setWithOrderedSet:(id)a3;
+ (NSSet)setWithOrderedSet:(id)a3 copyItems:(BOOL)a4;
+ (NSSet)setWithOrderedSet:(id)a3 range:(_NSRange)a4;
+ (NSSet)setWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
+ (NSSet)setWithSet:(NSSet *)set;
+ (NSSet)setWithSet:(id)a3 copyItems:(BOOL)a4;
+ (id)newSetWithObjects:(const void *)a3 count:(unint64_t)a4;
- (BOOL)__getValue:(id *)a3 forObj:(id)a4;
- (BOOL)containsObject:(id)anObject;
- (BOOL)intersectsOrderedSet:(id)a3;
- (BOOL)intersectsSet:(NSSet *)otherSet;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSet:(NSSet *)otherSet;
- (BOOL)isNSSet__;
- (BOOL)isSubsetOfOrderedSet:(id)a3;
- (BOOL)isSubsetOfSet:(NSSet *)otherSet;
- (NSArray)allObjects;
- (NSEnumerator)objectEnumerator;
- (NSSet)initWithArray:(NSArray *)array;
- (NSSet)initWithArray:(id)a3 copyItems:(BOOL)a4;
- (NSSet)initWithArray:(id)a3 range:(_NSRange)a4;
- (NSSet)initWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
- (NSSet)initWithCoder:(NSCoder *)aDecoder;
- (NSSet)initWithObject:(id)a3;
- (NSSet)initWithObjects:(id *)objects count:(NSUInteger)cnt;
- (NSSet)initWithObjects:(id)firstObj;
- (NSSet)initWithOrderedSet:(id)a3;
- (NSSet)initWithOrderedSet:(id)a3 copyItems:(BOOL)a4;
- (NSSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4;
- (NSSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5;
- (NSSet)initWithSet:(NSSet *)set;
- (NSSet)initWithSet:(NSSet *)set copyItems:(BOOL)flag;
- (NSSet)objectsPassingTest:(void *)predicate;
- (NSSet)objectsWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate;
- (NSSet)setByAddingObject:(id)anObject;
- (NSSet)setByAddingObjectsFromArray:(NSArray *)other;
- (NSSet)setByAddingObjectsFromSet:(NSSet *)other;
- (NSString)description;
- (NSString)descriptionWithLocale:(id)locale;
- (NSUInteger)count;
- (id)anyObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4;
- (id)member:(id)object;
- (id)members:(id)a3 notFoundMarker:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectPassingTest:(id)a3;
- (id)objectWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)sortedArrayUsingComparator:(id)a3;
- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)countForObject:(id)a3;
- (unint64_t)hash;
- (void)__applyValues:(void *)a3 context:(void *)a4;
- (void)enumerateObjectsUsingBlock:(void *)block;
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block;
- (void)getObjects:(id *)a3;
- (void)getObjects:(id *)a3 count:(unint64_t)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)makeObjectsPerformSelector:(SEL)aSelector;
- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument;
@end

@implementation NSSet

- (BOOL)isNSSet__
{
  return 1;
}

- (NSArray)allObjects
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  unint64_t v4 = -[NSSet count](self, "count");
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
  -[NSSet getObjects:count:](self, "getObjects:count:", v6, v5);
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

- (id)anyObject
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  memset(v6, 0, sizeof(v6));
  id result = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  v6,  &v5,  16LL);
  if (result) {
    return (id)**((void **)&v6[0] + 1);
  }
  return result;
}

- (BOOL)containsObject:(id)anObject
{
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
    if (anObject) {
      return -[NSSet member:](self, "member:", anObject) != 0;
    }
  }

  else if (anObject)
  {
    return -[NSSet member:](self, "member:", anObject) != 0;
  }

  return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v24[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5)
  {
    uint64_t v19 = _os_log_pack_size();
    v20 = (char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315394;
    *(void *)(v21 + 4) = "-[NSSet countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v21 + 12) = 2048;
    *(void *)(v21 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSSet countByEnumeratingWithState:objects:count:]",  a5);
    goto LABEL_28;
  }

  if (a5 >> 61)
  {
    uint64_t v19 = _os_log_pack_size();
    v20 = (char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136315394;
    *(void *)(v22 + 4) = "-[NSSet countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v22 + 12) = 2048;
    *(void *)(v22 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSSet countByEnumeratingWithState:objects:count:]",  a5);
LABEL_28:
    v23 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v20,  v19);
    objc_exception_throw(v23);
  }

  unint64_t var0 = a3->var0;
  if (a3->var0 == -1LL) {
    return 0LL;
  }
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableSet);
    unint64_t var0 = a3->var0;
    if (a3->var0) {
      goto LABEL_7;
    }
    goto LABEL_9;
  }

  if (!var0)
  {
LABEL_9:
    a3->var2 = a3->var3;
    a3->var3[0] = -[NSSet count](self, "count");
    CFStringRef v12 = -[NSSet objectEnumerator](self, "objectEnumerator");
    a3->var3[1] = (unint64_t)v12;
    if (v12)
    {
      v11 = v12;
      unint64_t var0 = a3->var0;
      goto LABEL_11;
    }

    return 0LL;
  }

- (unint64_t)countForObject:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  return -[NSSet member:](self, "member:", a3) != 0;
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  id v32 = a3;
  v33[1] = *MEMORY[0x1895F89C0];
  if (a4 >= 0x64) {
    unint64_t v5 = 100LL;
  }
  else {
    unint64_t v5 = a4;
  }
  NSUInteger v6 = -[NSSet count](self, "count");
  unint64_t v8 = v6;
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
  unint64_t v9 = MEMORY[0x1895F8858](v6, v7);
  v11 = (uint64_t *)((char *)&v27 - v10);
  if (v8 >= 0x101)
  {
    v11 = (uint64_t *)_CFCreateArrayStorage(v9, 0, v33);
    CFStringRef v12 = v11;
  }

  else
  {
    CFStringRef v12 = 0LL;
  }

  -[NSSet getObjects:count:](self, "getObjects:count:", v11, v8);
  Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL);
  CFAllocatorRef v29 = (CFAllocatorRef)&__kCFAllocatorSystemDefault;
  v30 = v12;
  v28 = (void *)MEMORY[0x186E03CAC]();
  if (v8)
  {
    v31 = sel_descriptionWithLocale_;
    unint64_t v14 = v11;
    unint64_t v15 = v8;
    do
    {
      id v16 = (void *)*v14;
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
        v18 = (const __CFString *)v17;
      }
      else {
        v18 = @"(null)";
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
  v23 = Mutable;
  free(v19);
  return v23;
}

- (NSString)descriptionWithLocale:(id)locale
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  return (NSString *)-[NSSet descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", locale, 0LL);
}

- (NSString)description
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  return (NSString *)-[NSSet descriptionWithLocale:indent:](self, "descriptionWithLocale:indent:", 0LL, 0LL);
}

- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void *)block
{
  v13[1] = *MEMORY[0x1895F89C0];
  if (!block)
  {
    uint64_t v8 = _os_log_pack_size();
    uint64_t v10 = (char *)v13 - ((MEMORY[0x1895F8858](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "-[NSSet enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[NSSet enumerateObjectsWithOptions:usingBlock:]");
    CFStringRef v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v10,  v8);
    objc_exception_throw(v12);
  }

  char v6 = opts;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  }
  __NSSetEnumerate(self, v6 & 0xFD, (uint64_t)block);
}

- (void)enumerateObjectsUsingBlock:(void *)block
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (!block)
  {
    uint64_t v6 = _os_log_pack_size();
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "-[NSSet enumerateObjectsUsingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[NSSet enumerateObjectsUsingBlock:]");
    uint64_t v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
    objc_exception_throw(v8);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  -[NSSet enumerateObjectsWithOptions:usingBlock:](self, "enumerateObjectsWithOptions:usingBlock:", 0LL, block);
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  unint64_t v5 = a4;
  uint64_t v6 = a3;
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!a3 && a4)
  {
    uint64_t v12 = _os_log_pack_size();
    unint64_t v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[NSSet getObjects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = v5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSSet getObjects:count:]",  v5);
    goto LABEL_17;
  }

  if (a4 >> 61)
  {
    uint64_t v12 = _os_log_pack_size();
    unint64_t v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[NSSet getObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = v5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSSet getObjects:count:]",  v5);
LABEL_17:
    id v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v13,  v12);
    objc_exception_throw(v16);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  unint64_t v8 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v18,  v17,  16LL);
  if (v8)
  {
    unint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
LABEL_8:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(self);
      }
      if (v5 == v11) {
        break;
      }
      *v6++ = *(id *)(*((void *)&v18 + 1) + 8 * v11);
      if (v9 == ++v11)
      {
        unint64_t v9 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v18,  v17,  16LL);
        v5 -= v11;
        if (v9) {
          goto LABEL_8;
        }
        return;
      }
    }
  }

- (void)getObjects:(id *)a3
{
  v14[1] = *MEMORY[0x1895F89C0];
  NSUInteger v6 = -[NSSet count](self, "count");
  if (!a3 && v6)
  {
    NSUInteger v7 = v6;
    uint64_t v8 = _os_log_pack_size();
    unint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315394;
    *(void *)(v10 + 4) = "-[NSSet getObjects:]";
    *(_WORD *)(v10 + 12) = 2048;
    *(void *)(v10 + 14) = v7;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSSet getObjects:]",  v7);
    goto LABEL_9;
  }

  if (v6 >> 61)
  {
    NSUInteger v11 = v6;
    uint64_t v8 = _os_log_pack_size();
    unint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[NSSet getObjects:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = v11;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSSet getObjects:]",  v11);
LABEL_9:
    unint64_t v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v8);
    objc_exception_throw(v13);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  -[NSSet getObjects:count:](self, "getObjects:count:", a3, -[NSSet count](self, "count"));
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  CFLog( 3LL,  (uint64_t)@"*** ERROR: this process has called an NSArray-taking method, such as initWithArray:, and passed in an NSSet object.  This is being worked-around for now, but will soon cause you grief.",  (uint64_t)a3,  a4.location,  a4.length,  v4,  v5,  v6,  v14);
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v7, __CFTSANTagMutableSet);
  }
  NSUInteger v11 = -[NSSet count](self, "count");
  if (v11)
  {
    NSUInteger v12 = v11;
    unint64_t v13 = malloc(16 * v11);
    -[NSSet getObjects:count:](self, "getObjects:count:", v13, v12);
    memmove(a3, v13, 8 * length);
  }

- (unint64_t)hash
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  return -[NSSet count](self, "count");
}

- (BOOL)intersectsOrderedSet:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v14 = _os_log_pack_size();
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[NSSet intersectsOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSSet intersectsOrderedSet:]");
    id v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v21[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v14);
    objc_exception_throw(v16);
    LOBYTE(v10) = -[NSSet intersectsSet:](v17, v18, v19);
  }

  else
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
    }
    NSUInteger v6 = -[NSSet count](self, "count");
    unint64_t v7 = -[NSSet count](v4, "count");
    BOOL v8 = v6 >= v7;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    if (v6 >= v7) {
      unint64_t v9 = v4;
    }
    else {
      unint64_t v9 = self;
    }
    if (v8) {
      uint64_t v4 = self;
    }
    __int128 v24 = 0uLL;
    __int128 v25 = 0uLL;
    uint64_t v10 = -[NSSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
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
          if (-[NSSet containsObject:](v4, "containsObject:", *(void *)(*((void *)&v22 + 1) + 8 * v13)))
          {
            LOBYTE(v10) = 1;
            return v10;
          }

          ++v13;
        }

        while (v11 != v13);
        uint64_t v10 = -[NSSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
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

- (BOOL)intersectsSet:(NSSet *)otherSet
{
  uint64_t v4 = otherSet;
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (!otherSet) {
    goto LABEL_16;
  }
  if ((_NSIsNSSet((uint64_t)otherSet) & 1) == 0
    && !_CFExecutableLinkedOnOrAfter(7uLL)
    && !_CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
    {
      uint64_t v7 = __CFExceptionProem((objc_class *)self, a2);
      CFLog( 3LL,  (uint64_t)@"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s",  v8,  v9,  v10,  v11,  v12,  v13,  v7);
    }

    uint64_t v14 = (void *)objc_opt_new();
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    uint64_t v15 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v42,  v41,  16LL);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v43;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v43 != v17) {
            objc_enumerationMutation(v4);
          }
          [v14 addObject:*(void *)(*((void *)&v42 + 1) + 8 * i)];
        }

        uint64_t v16 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v42,  v41,  16LL);
      }

      while (v16);
    }

    uint64_t v4 = v14;
    if (!v4) {
      goto LABEL_16;
    }
  }

  if ((_NSIsNSSet((uint64_t)v4) & 1) == 0)
  {
    uint64_t v27 = _os_log_pack_size();
    CFAllocatorRef v29 = &v36[-((MEMORY[0x1895F8858](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSSet intersectsSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSSet intersectsSet:]");
    v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v29,  v27);
    objc_exception_throw(v31);
    LOBYTE(v23) = -[NSSet isEqualToSet:](v32, v33, v34);
  }

  else
  {
LABEL_16:
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
    }
    NSUInteger v19 = -[NSSet count](self, "count");
    unint64_t v20 = -[NSSet count](v4, "count");
    BOOL v21 = v19 >= v20;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    if (v19 >= v20) {
      __int128 v22 = v4;
    }
    else {
      __int128 v22 = self;
    }
    if (!v21) {
      self = v4;
    }
    __int128 v39 = 0uLL;
    __int128 v40 = 0uLL;
    uint64_t v23 = -[NSSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v37,  v36,  16LL);
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v38;
      while (2)
      {
        uint64_t v26 = 0LL;
        do
        {
          if (*(void *)v38 != v25) {
            objc_enumerationMutation(v22);
          }
          if (-[NSSet containsObject:](self, "containsObject:", *(void *)(*((void *)&v37 + 1) + 8 * v26)))
          {
            LOBYTE(v23) = 1;
            return v23;
          }

          ++v26;
        }

        while (v24 != v26);
        uint64_t v23 = -[NSSet countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v37,  v36,  16LL);
        uint64_t v24 = v23;
        if (v23) {
          continue;
        }
        break;
      }
    }
  }

  return v23;
}

- (BOOL)isEqualToSet:(NSSet *)otherSet
{
  uint64_t v4 = otherSet;
  uint64_t v47 = *MEMORY[0x1895F89C0];
  if (!otherSet) {
    goto LABEL_17;
  }
  if ((_NSIsNSSet((uint64_t)otherSet) & 1) != 0
    || _CFExecutableLinkedOnOrAfter(7uLL)
    || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    goto LABEL_15;
  }

  if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
  {
    uint64_t v7 = __CFExceptionProem((objc_class *)self, a2);
    CFLog( 3LL,  (uint64_t)@"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s",  v8,  v9,  v10,  v11,  v12,  v13,  v7);
  }

  uint64_t v14 = (void *)objc_opt_new();
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  uint64_t v15 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v43,  v42,  16LL);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v44;
    do
    {
      for (uint64_t i = 0LL; i != v16; ++i)
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(v4);
        }
        [v14 addObject:*(void *)(*((void *)&v43 + 1) + 8 * i)];
      }

      uint64_t v16 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v43,  v42,  16LL);
    }

    while (v16);
  }

  uint64_t v4 = v14;
  if (v4)
  {
LABEL_15:
    if ((_NSIsNSSet((uint64_t)v4) & 1) == 0)
    {
      uint64_t v29 = _os_log_pack_size();
      v31 = &v37[-((MEMORY[0x1895F8858](v29, v30) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
      uint64_t v32 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v32 = 136315138;
      *(void *)(v32 + 4) = "-[NSSet isEqualToSet:]";
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSSet isEqualToSet:]");
      SEL v33 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v31,  v29);
      objc_exception_throw(v33);
      return -[NSSet isEqual:](v34, v35, v36);
    }

    char v19 = 0;
  }

  else
  {
LABEL_17:
    char v19 = 1;
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  BOOL result = v4 == self;
  if (v4 == self) {
    char v21 = 1;
  }
  else {
    char v21 = v19;
  }
  if ((v21 & 1) == 0)
  {
    NSUInteger v22 = -[NSSet count](self, "count");
    if (-[NSSet count](v4, "count") == v22)
    {
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      unint64_t v23 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v38,  v37,  16LL);
      if (!v23) {
        return 1;
      }
      unint64_t v24 = v23;
      uint64_t v25 = *(void *)v39;
LABEL_27:
      uint64_t v26 = 0LL;
      while (1)
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(self);
        }
        uint64_t v27 = *(void *)(*((void *)&v38 + 1) + 8 * v26);
        uint64_t v28 = -[NSSet countForObject:](v4, "countForObject:", v27);
        if (v28 != -[NSSet countForObject:](self, "countForObject:", v27)) {
          break;
        }
        if (v24 == ++v26)
        {
          unint64_t v24 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v38,  v37,  16LL);
          BOOL result = 1;
          if (v24) {
            goto LABEL_27;
          }
          return result;
        }
      }
    }

    return 0;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }

  else if (a3)
  {
    int v6 = _NSIsNSSet((uint64_t)a3);
    if (v6) {
      LOBYTE(v6) = -[NSSet isEqualToSet:](self, "isEqualToSet:", a3);
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isSubsetOfOrderedSet:(id)a3
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v15 = _os_log_pack_size();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[NSSet isSubsetOfOrderedSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSSet isSubsetOfOrderedSet:]");
    uint64_t v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  &v21[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  v15);
    objc_exception_throw(v17);
    return -[NSSet isSubsetOfSet:](v18, v19, v20);
  }

  else
  {
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
    }
    unint64_t v6 = -[NSSet count](self, "count");
    if (v6 <= [a3 count])
    {
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      unint64_t v8 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
      if (v8)
      {
        unint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(self);
            }
            uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            unint64_t v13 = [a3 countForObject:v12];
            if (v13 < -[NSSet countForObject:](self, "countForObject:", v12))
            {
              BOOL v14 = 0;
              return a3 && v14;
            }
          }

          unint64_t v9 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v22,  v21,  16LL);
          if (v9) {
            continue;
          }
          break;
        }
      }

      BOOL v14 = 1;
      return a3 && v14;
    }

    else
    {
      return 0;
    }
  }

- (BOOL)isSubsetOfSet:(NSSet *)otherSet
{
  uint64_t v4 = otherSet;
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (!otherSet) {
    goto LABEL_16;
  }
  if ((_NSIsNSSet((uint64_t)otherSet) & 1) == 0
    && !_CFExecutableLinkedOnOrAfter(7uLL)
    && !_CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
    {
      uint64_t v7 = __CFExceptionProem((objc_class *)self, a2);
      CFLog( 3LL,  (uint64_t)@"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s",  v8,  v9,  v10,  v11,  v12,  v13,  v7);
    }

    BOOL v14 = (void *)objc_opt_new();
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    uint64_t v15 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v41,  v40,  16LL);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v42;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(v4);
          }
          [v14 addObject:*(void *)(*((void *)&v41 + 1) + 8 * i)];
        }

        uint64_t v16 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v41,  v40,  16LL);
      }

      while (v16);
    }

    uint64_t v4 = v14;
    if (!v4) {
      goto LABEL_16;
    }
  }

  if ((_NSIsNSSet((uint64_t)v4) & 1) == 0)
  {
    uint64_t v27 = _os_log_pack_size();
    uint64_t v29 = &v35[-((MEMORY[0x1895F8858](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSSet isSubsetOfSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSSet isSubsetOfSet:]");
    v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v29,  v27);
    objc_exception_throw(v31);
    -[NSSet makeObjectsPerformSelector:](v32, v33, v34);
  }

  else
  {
LABEL_16:
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
    }
    unint64_t v19 = -[NSSet count](self, "count");
    if (v19 > -[NSSet count](v4, "count")) {
      return 0;
    }
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    unint64_t v21 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v36,  v35,  16LL);
    if (v21)
    {
      unint64_t v22 = v21;
      uint64_t v23 = *(void *)v37;
LABEL_22:
      uint64_t v24 = 0LL;
      while (1)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(self);
        }
        uint64_t v25 = *(void *)(*((void *)&v36 + 1) + 8 * v24);
        unint64_t v26 = -[NSSet countForObject:](v4, "countForObject:", v25);
        if (v26 < -[NSSet countForObject:](self, "countForObject:", v25)) {
          return 0;
        }
        if (v22 == ++v24)
        {
          unint64_t v22 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v36,  v35,  16LL);
          if (v22) {
            goto LABEL_22;
          }
          return v4 != 0LL;
        }
      }
    }

    return v4 != 0LL;
  }

  return result;
}

- (void)makeObjectsPerformSelector:(SEL)aSelector
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!aSelector) {
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  unint64_t v6 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(self);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) performSelector:aSelector];
      }

      unint64_t v7 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
    }

    while (v7);
  }

- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!aSelector) {
    -[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:");
  }
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  }
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unint64_t v8 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
  if (v8)
  {
    unint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(self);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) performSelector:aSelector withObject:argument];
      }

      unint64_t v9 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
    }

    while (v9);
  }

- (id)members:(id)a3 notFoundMarker:(id)a4
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v27 = _os_log_pack_size();
    uint64_t v29 = (char *)&v34 - ((MEMORY[0x1895F8858](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSSet members:notFoundMarker:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: marker cannot be nil",  "-[NSSet members:notFoundMarker:]");
    v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v29,  v27);
    objc_exception_throw(v31);
    __break(1u);
LABEL_31:
    CFStringRef v32 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v10);
    SEL v33 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v32,  0LL);
    CFRelease(v32);
    objc_exception_throw(v33);
  }

  unint64_t v8 = [a3 count];
  unint64_t v10 = v8;
  if (v8 >> 60) {
    goto LABEL_31;
  }
  if (v8 <= 1) {
    unint64_t v8 = 1LL;
  }
  unint64_t v11 = MEMORY[0x1895F8858](v8, v9);
  __int128 v13 = (char *)&v34 - v12;
  if (v14 >= 0x101)
  {
    __int128 v13 = (char *)_CFCreateArrayStorage(v11, 0, &v35);
    __int128 v15 = (id *)v13;
  }

  else
  {
    __int128 v15 = 0LL;
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  }
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  uint64_t v16 = [a3 countByEnumeratingWithState:&v37 objects:v36 count:16];
  uint64_t v17 = v13;
  if (v16)
  {
    uint64_t v18 = *(void *)v38;
    uint64_t v17 = v13;
    do
    {
      for (uint64_t i = 0LL; i != v16; ++i)
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(a3);
        }
        id v20 = -[NSSet member:](self, "member:", *(void *)(*((void *)&v37 + 1) + 8 * i));
        if (v20) {
          id v21 = v20;
        }
        else {
          id v21 = a4;
        }
        *(void *)uint64_t v17 = v21;
        v17 += 8;
      }

      uint64_t v16 = [a3 countByEnumeratingWithState:&v37 objects:v36 count:16];
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

    uint64_t v25 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v15,  (v17 - v13) >> 3,  (v17 - v13) >> 3);
  }

  else
  {
    uint64_t v25 = -[NSArray initWithObjects:count:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:count:",  v13,  (v17 - v13) >> 3);
  }

  return v25;
}

- (id)objectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v16[1] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v9 = _os_log_pack_size();
    unint64_t v11 = (char *)v14 - ((MEMORY[0x1895F8858](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[NSSet objectWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSSet objectWithOptions:passingTest:]");
    __int128 v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v11,  v9);
    objc_exception_throw(v13);
  }

  char v6 = a3;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  }
  v16[0] = 0LL;
  char v15 = 0;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  void v14[2] = __39__NSSet_objectWithOptions_passingTest___block_invoke;
  v14[3] = &unk_1899EB568;
  v14[4] = a4;
  v14[5] = &v15;
  v14[6] = v16;
  __NSSetEnumerate(self, v6 & 0xFD, (uint64_t)v14);
  return (id)v16[0];
}

uint64_t __39__NSSet_objectWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
  if ((_DWORD)result)
  {
    **(void **)(a1 + 48) = a2;
    *a3 = 1;
  }

  if (**(_BYTE **)(a1 + 40)) {
    *a3 = 1;
  }
  return result;
}

- (id)objectPassingTest:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSSet objectPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSSet objectPassingTest:]");
    uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  return -[NSSet objectWithOptions:passingTest:](self, "objectWithOptions:passingTest:", 0LL, a3);
}

- (NSSet)objectsWithOptions:(NSEnumerationOptions)opts passingTest:(void *)predicate
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!predicate)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v12 = (char *)v15 - ((MEMORY[0x1895F8858](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSSet objectsWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSSet objectsWithOptions:passingTest:]");
    unint64_t v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v10);
    objc_exception_throw(v14);
  }

  char v6 = opts;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableSet);
  }
  uint64_t v8 = +[NSSet set](&OBJC_CLASS___NSMutableSet, "set");
  uint64_t v20 = 0LL;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v17 = 0u;
  uint64_t v16 = 850045857LL;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __40__NSSet_objectsWithOptions_passingTest___block_invoke;
  v15[3] = &unk_18972DB18;
  v15[5] = predicate;
  v15[6] = &v16;
  v15[4] = v8;
  __NSSetEnumerate(self, v6 & 0xFD, (uint64_t)v15);
  return +[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v8);
}

uint64_t __40__NSSet_objectsWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2)
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

- (NSSet)objectsPassingTest:(void *)predicate
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!predicate)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSSet objectsPassingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[NSSet objectsPassingTest:]");
    uint64_t v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  return -[NSSet objectsWithOptions:passingTest:](self, "objectsWithOptions:passingTest:", 0LL, predicate);
}

- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  v39[1] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v27 = _os_log_pack_size();
    uint64_t v29 = (char *)&v37[-1] - ((MEMORY[0x1895F8858](v27, v28) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315138;
    *(void *)(v30 + 4) = "-[NSSet sortedArrayWithOptions:usingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSSet sortedArrayWithOptions:usingComparator:]");
    v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v29,  v27);
    objc_exception_throw(v31);
    __break(1u);
  }

  char v7 = a3;
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableSet);
  }
  NSUInteger v9 = -[NSSet count](self, "count");
  if (!v9) {
    return +[NSArray array](&OBJC_CLASS___NSArray, "array");
  }
  unint64_t v11 = v9;
  if (v9 >> 60)
  {
    CFStringRef v32 = (__CFString *)CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v9);
    SEL v33 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v32,  0LL);
    CFRelease(v32);
    objc_exception_throw(v33);
    size_t v35 = v34;
    free(v4);
    free(v32);
    _Unwind_Resume(v35);
  }

  MEMORY[0x1895F8858](v9, v10);
  uint64_t v13 = (char *)&v37[-1] - v12;
  if (v11 >= 0x101)
  {
    uint64_t v13 = (char *)_CFCreateArrayStorage(v11, 0, v39);
    unint64_t v14 = v13;
  }

  else
  {
    unint64_t v14 = 0LL;
  }

  uint64_t v16 = (id *)_CFCreateArrayStorage(v11, 0, &v38);
  uint64_t v17 = -[NSSet getObjects:count:](self, "getObjects:count:", v13, v11);
  MEMORY[0x1895F8858](v17, v18);
  uint64_t v20 = (char *)&v37[-1] - v19;
  uint64_t v21 = (char *)&v37[-1] - v19;
  if (v11 > 0x1000) {
    uint64_t v21 = (char *)malloc(8 * v11);
  }
  v37[0] = MEMORY[0x1895F87A8];
  v37[1] = 3221225472LL;
  v37[2] = __48__NSSet_sortedArrayWithOptions_usingComparator___block_invoke;
  v37[3] = &unk_189996258;
  v37[4] = a4;
  v37[5] = v13;
  CFSortIndexes((uint64_t)v21, v11, v7, (uint64_t)v37);
  for (uint64_t i = 0LL; i != v11; ++i)
    v16[i] = *(id *)&v13[8 * *(void *)&v21[8 * i]];
  if (v20 != v21) {
    free(v21);
  }
  if ((uint64_t)v11 >= 1)
  {
    uint64_t v23 = v16;
    unint64_t v24 = v11;
    do
    {
      id v25 = *v23++;
      --v24;
    }

    while (v24);
  }

  id v26 =  -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v16,  v11,  v11);
  free(v14);
  return v26;
}

uint64_t __48__NSSet_sortedArrayWithOptions_usingComparator___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(*(void *)(a1 + 40) + 8 * a2),  *(void *)(*(void *)(a1 + 40) + 8 * a3));
}

- (id)sortedArrayUsingComparator:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v7 = _os_log_pack_size();
    uint64_t v8 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v8 = 136315138;
    *(void *)(v8 + 4) = "-[NSSet sortedArrayUsingComparator:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: comparator cannot be nil",  "-[NSSet sortedArrayUsingComparator:]");
    NSUInteger v9 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v7);
    objc_exception_throw(v9);
  }

  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  return -[NSSet sortedArrayWithOptions:usingComparator:](self, "sortedArrayWithOptions:usingComparator:", 0LL, a3);
}

- (void)__applyValues:(void *)a3 context:(void *)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v11 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: function pointer is NULL",  v11);
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v12);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  unint64_t v7 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
  if (v7)
  {
    unint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(self);
        }
        ((void (*)(void, void *))a3)(*(void *)(*((void *)&v14 + 1) + 8 * i), a4);
      }

      unint64_t v8 = -[NSSet countByEnumeratingWithState:objects:count:]( self,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
    }

    while (v8);
  }

- (BOOL)__getValue:(id *)a3 forObj:(id)a4
{
  id v5 = -[NSSet member:](self, "member:", a4);
  if (a3 && v5) {
    *a3 = v5;
  }
  return v5 != 0LL;
}

+ (NSSet)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSSet == a1) {
    return (NSSet *)__NSSetImmutablePlaceholder();
  }
  if (&OBJC_CLASS___NSMutableSet == a1) {
    return (NSSet *)__NSSetMutablePlaceholder();
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSet;
  return (NSSet *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSSet)initWithObject:(id)a3
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = a3;
  return -[NSSet initWithObjects:count:](self, "initWithObjects:count:", v4, 1LL);
}

- (NSSet)initWithObjects:(id)firstObj
{
  objc_super v4 = self;
  v22[1] = *MEMORY[0x1895F89C0];
  v22[0] = (uint64_t)firstObj;
  Class = (__objc2_class *)object_getClass(self);
  unint64_t v7 = &OBJC_CLASS___NSSet;
  if (!firstObj) {
    goto LABEL_7;
  }
  unint64_t v8 = 0LL;
  va_copy(v20, va);
  do
  {
    uint64_t v9 = v20;
    v20 += 8;
    ++v8;
  }

  while (*v9);
  if (Class == &OBJC_CLASS___NSSet)
  {
    va_copy(v21, va);
    return (NSSet *)__NSSetI_new(v22, (uint64_t *)va, v8, 0);
  }

  if (v8 >> 60)
  {
    objc_super v4 = (void *)CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v8);
    uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v4,  0LL);
    CFRelease(v4);
    objc_exception_throw(v10);
    __break(1u);
LABEL_7:
    if (Class == v7) {
      return (NSSet *)__NSSet0__;
    }
    unint64_t v8 = 0LL;
  }

  if (v8 <= 1) {
    uint64_t v11 = 1LL;
  }
  else {
    uint64_t v11 = v8;
  }
  unint64_t v12 = MEMORY[0x1895F8858](v11, v6);
  __int128 v14 = (va_list *)((char *)&v20 - v13);
  if (v8 >= 0x101)
  {
    __int128 v14 = _CFCreateArrayStorage(v12, 0, (size_t *)&v20);
    va_copy(v21, va);
    *__int128 v14 = firstObj;
    __int128 v15 = v14;
  }

  else
  {
    __int128 v15 = 0LL;
    if (!v8) {
      goto LABEL_19;
    }
    va_copy(v21, va);
    *__int128 v14 = firstObj;
    if (v8 == 1) {
      goto LABEL_19;
    }
  }

  for (uint64_t i = 1LL; i != v8; ++i)
  {
    __int128 v17 = v21;
    v21 += 8;
    v14[i] = *v17;
  }

- (NSSet)initWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v39[1] = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v30 = _os_log_pack_size();
    CFStringRef v32 = (char *)v39 - ((MEMORY[0x1895F8858](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v33 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v33 = 136315138;
    *(void *)(v33 + 4) = "-[NSSet initWithArray:range:copyItems:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSSet initWithArray:range:copyItems:]");
    uint64_t v34 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v32,  v30);
    objc_exception_throw(v34);
LABEL_27:
    __break(1u);
    return result;
  }

  unint64_t v10 = [a3 count];
  unint64_t v12 = v10;
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v10 < location + length)
  {
    if (v10)
    {
      uint64_t v22 = _os_log_pack_size();
      unint64_t v24 = (char *)v39 - ((MEMORY[0x1895F8858](v22, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v36 = _os_log_pack_fill();
      uint64_t v37 = v12 - 1;
      double v38 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v36,  (uint64_t)"-[NSSet initWithArray:range:copyItems:]",  location,  length,  v37);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v38,  "-[NSSet initWithArray:range:copyItems:]",  location,  length,  v37);
    }

    else
    {
      uint64_t v22 = _os_log_pack_size();
      unint64_t v24 = (char *)v39 - ((MEMORY[0x1895F8858](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v25 = _os_log_pack_fill();
      double v26 = __os_log_helper_1_2_3_8_32_8_0_8_0( v25,  (uint64_t)"-[NSSet initWithArray:range:copyItems:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty set",  v26,  "-[NSSet initWithArray:range:copyItems:]",  location,  length);
    }

    uint64_t v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v24,  v22);
    objc_exception_throw(v27);
    goto LABEL_27;
  }

  if (length >> 60)
  {
    CFStringRef v28 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  length);
    uint64_t v29 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v28,  0LL);
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
  __int128 v16 = (id *)((char *)v39 - v15);
  if (length >= 0x101)
  {
    __int128 v16 = (id *)_CFCreateArrayStorage(v14, 0, v39);
    __int128 v17 = v16;
  }

  else
  {
    __int128 v17 = 0LL;
  }

  objc_msgSend(a3, "getObjects:range:", v16, location, length);
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

  va_list v20 = -[NSSet initWithObjects:count:](self, "initWithObjects:count:", v16, length);
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

- (NSSet)initWithArray:(id)a3 range:(_NSRange)a4
{
  return -[NSSet initWithArray:range:copyItems:]( self,  "initWithArray:range:copyItems:",  a3,  a4.location,  a4.length,  0LL);
}

- (NSSet)initWithArray:(id)a3 copyItems:(BOOL)a4
{
  return -[NSSet initWithArray:range:copyItems:]( self,  "initWithArray:range:copyItems:",  a3,  0,  [a3 count],  a4);
}

- (NSSet)initWithArray:(NSArray *)array
{
  return -[NSSet initWithArray:range:copyItems:]( self,  "initWithArray:range:copyItems:",  array,  0LL,  -[NSArray count](array, "count"),  0LL);
}

- (NSSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v39[1] = *MEMORY[0x1895F89C0];
  if (a3 && (_NSIsNSOrderedSet((uint64_t)a3) & 1) == 0)
  {
    uint64_t v30 = _os_log_pack_size();
    CFStringRef v32 = (char *)v39 - ((MEMORY[0x1895F8858](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v33 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v33 = 136315138;
    *(void *)(v33 + 4) = "-[NSSet initWithOrderedSet:range:copyItems:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: ordered set argument is not an NSOrderedSet",  "-[NSSet initWithOrderedSet:range:copyItems:]");
    uint64_t v34 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v32,  v30);
    objc_exception_throw(v34);
LABEL_27:
    __break(1u);
    return result;
  }

  unint64_t v10 = [a3 count];
  unint64_t v12 = v10;
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v10 < location + length)
  {
    if (v10)
    {
      uint64_t v22 = _os_log_pack_size();
      unint64_t v24 = (char *)v39 - ((MEMORY[0x1895F8858](v22, v35) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v36 = _os_log_pack_fill();
      uint64_t v37 = v12 - 1;
      double v38 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v36,  (uint64_t)"-[NSSet initWithOrderedSet:range:copyItems:]",  location,  length,  v37);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v38,  "-[NSSet initWithOrderedSet:range:copyItems:]",  location,  length,  v37);
    }

    else
    {
      uint64_t v22 = _os_log_pack_size();
      unint64_t v24 = (char *)v39 - ((MEMORY[0x1895F8858](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v25 = _os_log_pack_fill();
      double v26 = __os_log_helper_1_2_3_8_32_8_0_8_0( v25,  (uint64_t)"-[NSSet initWithOrderedSet:range:copyItems:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty set",  v26,  "-[NSSet initWithOrderedSet:range:copyItems:]",  location,  length);
    }

    uint64_t v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v24,  v22);
    objc_exception_throw(v27);
    goto LABEL_27;
  }

  if (length >> 60)
  {
    CFStringRef v28 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  length);
    uint64_t v29 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v28,  0LL);
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
  __int128 v16 = (id *)((char *)v39 - v15);
  if (length >= 0x101)
  {
    __int128 v16 = (id *)_CFCreateArrayStorage(v14, 0, v39);
    __int128 v17 = v16;
  }

  else
  {
    __int128 v17 = 0LL;
  }

  objc_msgSend(a3, "getObjects:range:", v16, location, length);
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

  va_list v20 = -[NSSet initWithObjects:count:](self, "initWithObjects:count:", v16, length);
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

- (NSSet)initWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return -[NSSet initWithOrderedSet:range:copyItems:]( self,  "initWithOrderedSet:range:copyItems:",  a3,  a4.location,  a4.length,  0LL);
}

- (NSSet)initWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  return -[NSSet initWithOrderedSet:range:copyItems:]( self,  "initWithOrderedSet:range:copyItems:",  a3,  0,  [a3 count],  a4);
}

- (NSSet)initWithOrderedSet:(id)a3
{
  return -[NSSet initWithOrderedSet:range:copyItems:]( self,  "initWithOrderedSet:range:copyItems:",  a3,  0,  [a3 count],  0);
}

- (NSSet)initWithSet:(NSSet *)set copyItems:(BOOL)flag
{
  BOOL v4 = flag;
  BOOL v5 = set;
  uint64_t v42 = *MEMORY[0x1895F89C0];
  if (set)
  {
    if ((_NSIsNSSet((uint64_t)set) & 1) != 0
      || _CFExecutableLinkedOnOrAfter(7uLL)
      || _CFExecutableLinkedOnOrAfter(0x3F2uLL))
    {
      goto LABEL_15;
    }

    if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
    {
      uint64_t v8 = __CFExceptionProem((objc_class *)self, a2);
      CFLog( 3LL,  (uint64_t)@"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s",  v9,  v10,  v11,  v12,  v13,  v14,  v8);
    }

    uint64_t v15 = (void *)objc_opt_new();
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    uint64_t v16 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v38,  v37,  16LL);
    if (v16)
    {
      uint64_t v17 = *(void *)v39;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v5);
          }
          [v15 addObject:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        }

        uint64_t v16 = -[NSSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v38,  v37,  16LL);
      }

      while (v16);
    }

    BOOL v5 = v15;
    if (v5)
    {
LABEL_15:
      if ((_NSIsNSSet((uint64_t)v5) & 1) == 0)
      {
        uint64_t v32 = _os_log_pack_size();
        uint64_t v34 = (char *)v37 - ((MEMORY[0x1895F8858](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v35 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v35 = 136315138;
        *(void *)(v35 + 4) = "-[NSSet initWithSet:copyItems:]";
        CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSSet initWithSet:copyItems:]");
        uint64_t v36 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v34,  v32);
        objc_exception_throw(v36);
        goto LABEL_32;
      }
    }
  }

  unint64_t v19 = -[NSSet count](v5, "count");
  unint64_t v21 = v19;
  if (v19 >> 60)
  {
    CFStringRef v30 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v19);
    uint64_t v31 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v30,  0LL);
    CFRelease(v30);
    objc_exception_throw(v31);
LABEL_32:
    __break(1u);
    return result;
  }

  if (v19 <= 1) {
    unint64_t v19 = 1LL;
  }
  unint64_t v22 = MEMORY[0x1895F8858](v19, v20);
  unint64_t v24 = (id *)((char *)v37 - v23);
  if (v21 >= 0x101)
  {
    unint64_t v24 = (id *)_CFCreateArrayStorage(v22, 0, v37);
    uint64_t v25 = v24;
  }

  else
  {
    uint64_t v25 = 0LL;
  }

  -[NSSet getObjects:count:](v5, "getObjects:count:", v24, v21);
  if (!v21) {
    BOOL v4 = 0;
  }
  if (v4)
  {
    double v26 = v24;
    unint64_t v27 = v21;
    do
    {
      id *v26 = (id)[*v26 copyWithZone:0];
      ++v26;
      --v27;
    }

    while (v27);
  }

  CFStringRef v28 = -[NSSet initWithObjects:count:](self, "initWithObjects:count:", v24, v21);
  if (v4)
  {
    do
    {

      --v21;
    }

    while (v21);
  }

  free(v25);
  return v28;
}

- (NSSet)initWithSet:(NSSet *)set
{
  return -[NSSet initWithSet:copyItems:](self, "initWithSet:copyItems:", set, 0LL);
}

+ (NSSet)setWithObjects:(id *)objects count:(NSUInteger)cnt
{
  return (NSSet *)(id)[objc_alloc((Class)a1) initWithObjects:objects count:cnt];
}

+ (NSSet)setWithObject:(id)object
{
  return (NSSet *)(id)__createSet(objc_alloc((Class)a1), (uint64_t)object);
}

+ (NSSet)set
{
  return (NSSet *)(id)[objc_alloc((Class)a1) initWithObjects:0 count:0];
}

+ (id)newSetWithObjects:(const void *)a3 count:(unint64_t)a4
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4) {
    goto LABEL_19;
  }
  if (a4 >> 61)
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "+[NSSet newSetWithObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "+[NSSet newSetWithObjects:count:]",  a4);
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
    uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315394;
    *(void *)(v11 + 4) = "+[NSSet newSetWithObjects:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v11 + 14) = v8;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: attempt to insert nil object from objects[%lu]",  "+[NSSet newSetWithObjects:count:]",  v8);
    while (1)
    {
LABEL_18:
      uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v10,  v9);
      objc_exception_throw(v12);
LABEL_19:
      unint64_t v13 = a4;
      uint64_t v9 = _os_log_pack_size();
      uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v14 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v14 = 136315394;
      *(void *)(v14 + 4) = "+[NSSet newSetWithObjects:count:]";
      *(_WORD *)(v14 + 12) = 2048;
      *(void *)(v14 + 14) = v13;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "+[NSSet newSetWithObjects:count:]",  v13);
    }
  }

+ (NSSet)setWithObjects:(id)firstObj
{
  BOOL v4 = (objc_class *)a1;
  v20[1] = *MEMORY[0x1895F89C0];
  v20[0] = (uint64_t)firstObj;
  uint64_t v5 = &OBJC_CLASS___NSSet;
  if (firstObj)
  {
    unint64_t v6 = 0LL;
    va_copy(v18, va);
    do
    {
      unint64_t v7 = v18;
      v18 += 8;
      ++v6;
    }

    while (*v7);
    if (&OBJC_CLASS___NSSet == a1)
    {
      va_copy(v19, va);
      uint64_t v16 = (void *)__NSSetI_new(v20, (uint64_t *)va, v6, 0);
      return (NSSet *)v16;
    }

    if (!(v6 >> 60))
    {
LABEL_9:
      if (v6 <= 1) {
        uint64_t v9 = 1LL;
      }
      else {
        uint64_t v9 = v6;
      }
      unint64_t v10 = MEMORY[0x1895F8858](v9, a2);
      uint64_t v12 = (va_list *)((char *)&v18 - v11);
      if (v6 >= 0x101)
      {
        uint64_t v12 = _CFCreateArrayStorage(v10, 0, (size_t *)&v18);
        va_copy(v19, va);
        *uint64_t v12 = firstObj;
        unint64_t v13 = v12;
      }

      else
      {
        unint64_t v13 = 0LL;
        if (!v6) {
          goto LABEL_19;
        }
        va_copy(v19, va);
        *uint64_t v12 = firstObj;
        if (v6 == 1) {
          goto LABEL_19;
        }
      }

      for (uint64_t i = 1LL; i != v6; ++i)
      {
        uint64_t v15 = v19;
        v19 += 8;
        v12[i] = *v15;
      }

+ (NSSet)setWithArray:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  return (NSSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithArray:range:copyItems:",  a3,  a4.location,  a4.length,  a5);
}

+ (NSSet)setWithArray:(id)a3 range:(_NSRange)a4
{
  return (NSSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithArray:range:copyItems:",  a3,  a4.location,  a4.length,  0);
}

+ (NSSet)setWithArray:(id)a3 copyItems:(BOOL)a4
{
  return (NSSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithArray:range:copyItems:",  a3,  0,  objc_msgSend(a3, "count"),  a4);
}

+ (NSSet)setWithArray:(NSArray *)array
{
  return (NSSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithArray:range:copyItems:",  array,  0,  -[NSArray count](array, "count"),  0);
}

+ (NSSet)setWithOrderedSet:(id)a3 range:(_NSRange)a4 copyItems:(BOOL)a5
{
  return (NSSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithOrderedSet:range:copyItems:",  a3,  a4.location,  a4.length,  a5);
}

+ (NSSet)setWithOrderedSet:(id)a3 range:(_NSRange)a4
{
  return (NSSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithOrderedSet:range:copyItems:",  a3,  a4.location,  a4.length,  0);
}

+ (NSSet)setWithOrderedSet:(id)a3 copyItems:(BOOL)a4
{
  return (NSSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithOrderedSet:range:copyItems:",  a3,  0,  objc_msgSend(a3, "count"),  a4);
}

+ (NSSet)setWithOrderedSet:(id)a3
{
  return (NSSet *)(id)objc_msgSend( objc_alloc((Class)a1),  "initWithOrderedSet:range:copyItems:",  a3,  0,  objc_msgSend(a3, "count"),  0);
}

+ (NSSet)setWithSet:(id)a3 copyItems:(BOOL)a4
{
  return (NSSet *)(id)[objc_alloc((Class)a1) initWithSet:a3 copyItems:a4];
}

+ (NSSet)setWithSet:(NSSet *)set
{
  return (NSSet *)(id)[objc_alloc((Class)a1) initWithSet:set copyItems:0];
}

- (NSSet)setByAddingObject:(id)anObject
{
  v26[1] = *MEMORY[0x1895F89C0];
  if (!anObject)
  {
    uint64_t v17 = _os_log_pack_size();
    va_list v19 = (char *)v26 - ((MEMORY[0x1895F8858](v17, v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSSet setByAddingObject:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[NSSet setByAddingObject:]");
    unint64_t v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v19,  v17);
    objc_exception_throw(v21);
    __break(1u);
  }

  if (-[NSSet containsObject:](self, "containsObject:")) {
    return self;
  }
  NSUInteger v7 = -[NSSet count](self, "count");
  unint64_t v9 = v7 + 1;
  if ((v7 + 1) >> 60)
  {
    CFStringRef v22 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v7 + 1);
    uint64_t v23 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v22,  0LL);
    CFRelease(v22);
    objc_exception_throw(v23);
    uint64_t v25 = v24;
    free(v3);
    _Unwind_Resume(v25);
  }

  NSUInteger v10 = v7;
  if (v9 <= 1) {
    uint64_t v11 = 1LL;
  }
  else {
    uint64_t v11 = v7 + 1;
  }
  unint64_t v12 = MEMORY[0x1895F8858](v11, v8);
  uint64_t v14 = (char *)v26 - v13;
  if (v9 >= 0x101)
  {
    uint64_t v14 = (char *)_CFCreateArrayStorage(v12, 0, v26);
    uint64_t v15 = v14;
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  -[NSSet getObjects:count:](self, "getObjects:count:", v14, v10);
  *(void *)&v14[8 * v10] = anObject;
  uint64_t v16 = +[NSSet setWithObjects:count:](&OBJC_CLASS___NSSet, "setWithObjects:count:", v14, v9);
  free(v15);
  return v16;
}

- (NSSet)setByAddingObjectsFromArray:(NSArray *)other
{
  v25[1] = *MEMORY[0x1895F89C0];
  if (other && (_NSIsNSArray((uint64_t)other) & 1) == 0)
  {
    uint64_t v18 = _os_log_pack_size();
    unint64_t v9 = (char *)v25 - ((MEMORY[0x1895F8858](v18, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)(v20 + 4) = "-[NSSet setByAddingObjectsFromArray:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: array argument is not an NSArray",  "-[NSSet setByAddingObjectsFromArray:]");
    unint64_t v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v18);
    objc_exception_throw(v21);
    __break(1u);
    goto LABEL_16;
  }

  NSUInteger v5 = -[NSArray count](other, "count");
  if (!v5) {
    return self;
  }
  NSUInteger v6 = v5;
  NSUInteger v7 = -[NSSet count](self, "count");
  unint64_t v9 = (char *)(v7 + v6);
  if ((v7 + v6) >> 60)
  {
LABEL_16:
    CFStringRef v22 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v9);
    uint64_t v23 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v22,  0LL);
    CFRelease(v22);
    objc_exception_throw(v23);
    _Unwind_Resume(v24);
  }

  NSUInteger v10 = v7;
  else {
    uint64_t v11 = v7 + v6;
  }
  unint64_t v12 = MEMORY[0x1895F8858](v11, v8);
  uint64_t v14 = (char *)v25 - v13;
  if ((unint64_t)v9 < 0x101)
  {
    uint64_t v15 = 0LL;
    if (!v10) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  uint64_t v14 = (char *)_CFCreateArrayStorage(v12, 0, v25);
  uint64_t v15 = v14;
  if (v10) {
LABEL_13:
  }
    -[NSSet getObjects:count:](self, "getObjects:count:", v14, v10);
LABEL_14:
  -[NSArray getObjects:range:](other, "getObjects:range:", &v14[8 * v10], 0LL, v6);
  uint64_t v17 = +[NSSet setWithObjects:count:](&OBJC_CLASS___NSSet, "setWithObjects:count:", v14, v9);
  free(v15);
  return v17;
}

- (NSSet)setByAddingObjectsFromSet:(NSSet *)other
{
  uint64_t v3 = other;
  uint64_t v41 = *MEMORY[0x1895F89C0];
  if (!other) {
    goto LABEL_16;
  }
  if ((_NSIsNSSet((uint64_t)other) & 1) == 0
    && !_CFExecutableLinkedOnOrAfter(7uLL)
    && !_CFExecutableLinkedOnOrAfter(0x3F2uLL))
  {
    if ((unint64_t)++__checkForAndForgiveClientSin_cnt_0 <= 0x64)
    {
      uint64_t v6 = __CFExceptionProem((objc_class *)self, a2);
      CFLog( 3LL,  (uint64_t)@"%@: This app appears to be calling this method with a non-set parameter.  Please wait while the system corrects this....  %s",  v7,  v8,  v9,  v10,  v11,  v12,  v6);
    }

    uint64_t v13 = (void *)objc_opt_new();
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    uint64_t v14 = -[NSSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v37,  v36,  16LL);
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

        uint64_t v14 = -[NSSet countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v37,  v36,  16LL);
      }

      while (v14);
    }

    uint64_t v3 = v13;
    if (!v3) {
      goto LABEL_16;
    }
  }

  if ((_NSIsNSSet((uint64_t)v3) & 1) == 0)
  {
    uint64_t v31 = _os_log_pack_size();
    uint64_t v33 = (char *)v36 - ((MEMORY[0x1895F8858](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v34 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v34 = 136315138;
    *(void *)(v34 + 4) = "-[NSSet setByAddingObjectsFromSet:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: set argument is not an NSSet",  "-[NSSet setByAddingObjectsFromSet:]");
    uint64_t v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v33,  v31);
    objc_exception_throw(v35);
  }

  else
  {
LABEL_16:
    uint64_t v17 = -[NSSet count](v3, "count");
    if (!v17) {
      return self;
    }
    NSUInteger v18 = -[NSSet count](self, "count");
    NSUInteger v20 = v18;
    unint64_t v21 = v18 + v17;
    if (!((v18 + v17) >> 60))
    {
      if (v21 <= 1) {
        uint64_t v22 = 1LL;
      }
      else {
        uint64_t v22 = v18 + v17;
      }
      unint64_t v23 = MEMORY[0x1895F8858](v22, v19);
      uint64_t v25 = (char *)v36 - v24;
      if (v21 >= 0x101)
      {
        uint64_t v25 = (char *)_CFCreateArrayStorage(v23, 0, v36);
        double v26 = v25;
        if (!v20)
        {
LABEL_27:
          -[NSSet getObjects:count:](v3, "getObjects:count:", &v25[8 * v20], v17);
          unint64_t v27 = +[NSSet setWithObjects:count:](&OBJC_CLASS___NSSet, "setWithObjects:count:", v25, v21);
          free(v26);
          return v27;
        }
      }

      else
      {
        double v26 = 0LL;
        if (!v20) {
          goto LABEL_27;
        }
      }

      -[NSSet getObjects:count:](self, "getObjects:count:", v25, v20);
      goto LABEL_27;
    }

    CFStringRef v29 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v18 + v17);
    CFStringRef v30 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v29,  0LL);
    CFRelease(v29);
    objc_exception_throw(v30);
  }

  __break(1u);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t ShouldCopy = __NSCollectionsShouldCopy();
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  return -[NSSet initWithSet:copyItems:]( +[NSSet allocWithZone:](&OBJC_CLASS___NSSet, "allocWithZone:", a3),  "initWithSet:copyItems:",  self,  ShouldCopy);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableSet);
  }
  return -[NSSet initWithSet:copyItems:]( +[NSSet allocWithZone:](&OBJC_CLASS___NSMutableSet, "allocWithZone:", a3),  "initWithSet:copyItems:",  self,  0LL);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSet)initWithCoder:(NSCoder *)aDecoder
{
  return 0LL;
}

- (NSUInteger)count
{
  uint64_t v2 = __CFLookUpClass("NSSet");
  OUTLINED_FUNCTION_0_22(v2);
  OUTLINED_FUNCTION_1_14();
  return result;
}

- (id)member:(id)object
{
  uint64_t v3 = __CFLookUpClass("NSSet");
  OUTLINED_FUNCTION_0_22(v3);
  OUTLINED_FUNCTION_1_14();
  return result;
}

- (NSEnumerator)objectEnumerator
{
  uint64_t v2 = __CFLookUpClass("NSSet");
  OUTLINED_FUNCTION_0_22(v2);
  OUTLINED_FUNCTION_1_14();
  return result;
}

- (NSSet)initWithObjects:(id *)objects count:(NSUInteger)cnt
{
  BOOL v4 = __CFLookUpClass("NSSet");
  OUTLINED_FUNCTION_0_22(v4);
  OUTLINED_FUNCTION_1_14();
  return result;
}

@end