@interface NSSharedKeyDictionary
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (id)sharedKeyDictionaryWithKeySet:(id)a3;
- (Class)classForCoder;
- (NSSharedKeyDictionary)initWithCoder:(id)a3;
- (NSSharedKeyDictionary)initWithKeySet:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyEnumerator;
- (id)keySet;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObservationInfo:(void *)a3;
@end

@implementation NSSharedKeyDictionary

- (unint64_t)count
{
  unint64_t count = self->_count;
  sideDic = self->_sideDic;
  if (sideDic) {
    sideDic = -[NSDictionary count](sideDic, "count");
  }
  return (unint64_t)sideDic + count;
}

- (id)objectForKey:(id)a3
{
  if (a3
    && (keyMap = self->_keyMap) != 0LL
    && (uint64_t v6 = ((uint64_t (*)(NSSharedKeySet *, char *, id))self->_ifkIMP)(keyMap, sel_indexForKey_, a3),
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    return self->_values[v6];
  }

  else
  {
    return -[NSDictionary objectForKey:](self->_sideDic, "objectForKey:", a3);
  }

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  v21[1] = *MEMORY[0x1895F89C0];
  unint64_t v9 = a5 >> 61;
  if (a3 && v9 || a4 && v9)
  {
    uint64_t v18 = _os_log_pack_size();
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "-[NSSharedKeyDictionary getObjects:andKeys:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSSharedKeyDictionary getObjects:andKeys:count:]",  a5);
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v18);
    objc_exception_throw(v20);
  }

  sideDic = self->_sideDic;
  if (sideDic)
  {
    unint64_t v11 = -[NSDictionary count](sideDic, "count");
    sideDic = self->_sideDic;
  }

  else
  {
    unint64_t v11 = 0LL;
  }

  if (v11 >= a5) {
    unint64_t v12 = a5;
  }
  else {
    unint64_t v12 = v11;
  }
  -[NSDictionary getObjects:andKeys:count:](sideDic, "getObjects:andKeys:count:", a3, a4, v12);
  unint64_t v13 = a5 - v12;
  if (a5 != v12)
  {
    unint64_t v14 = -[NSSharedKeySet count](self->_keyMap, "count");
    if (v14)
    {
      if (a4) {
        v15 = &a4[v12];
      }
      else {
        v15 = 0LL;
      }
      if (a3) {
        v16 = &a3[v12];
      }
      else {
        v16 = 0LL;
      }
      unint64_t v17 = v14 - 1;
      do
      {
        if (self->_values[v17])
        {
          if (v15) {
            *v15++ = -[NSSharedKeySet keyAtIndex:](self->_keyMap, "keyAtIndex:", v17);
          }
          if (v16) {
            *v16++ = self->_values[v17];
          }
          if (!--v13) {
            break;
          }
        }

        --v17;
      }

      while (v17 != -1LL);
    }
  }

- (id)keyEnumerator
{
  v17[1] = *MEMORY[0x1895F89C0];
  unint64_t count = self->_count;
  sideDic = self->_sideDic;
  if (sideDic) {
    sideDic = -[NSDictionary count](sideDic, "count");
  }
  unint64_t v5 = (unint64_t)sideDic + count;
  if (v5 >> 60)
  {
    CFStringRef v15 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v5);
    v16 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v15,  0LL);
    CFRelease(v15);
    objc_exception_throw(v16);
  }

  if (v5 <= 1) {
    unint64_t v6 = 1LL;
  }
  else {
    unint64_t v6 = v5;
  }
  v7 = (id *)_CFCreateArrayStorage(v6, 0, v17);
  -[NSSharedKeyDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0LL, v7, v5);
  if (v7)
  {
    if (v5)
    {
      v8 = v7;
      unint64_t v9 = v5;
      do
      {
        id v10 = *v8++;
        --v9;
      }

      while (v9);
    }

    unint64_t v11 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v7,  v5,  v5);
  }

  else
  {
    unint64_t v11 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", 0LL, v5);
  }

  unint64_t v12 = v11;
  unint64_t v13 = -[NSArray objectEnumerator](v11, "objectEnumerator");

  return v13;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v5 = a5;
  v37[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5)
  {
    uint64_t v23 = _os_log_pack_size();
    v25 = (char *)v37 - ((MEMORY[0x1895F8858](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v26 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v26 = 136315394;
    *(void *)(v26 + 4) = "-[NSSharedKeyDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v26 + 12) = 2048;
    *(void *)(v26 + 14) = v5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[NSSharedKeyDictionary countByEnumeratingWithState:objects:count:]",  v5);
    v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v25,  v23);
    objc_exception_throw(v27);
    goto LABEL_26;
  }

  if (a5 >> 61)
  {
    uint64_t v28 = _os_log_pack_size();
    v30 = (char *)v37 - ((MEMORY[0x1895F8858](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136315394;
    *(void *)(v31 + 4) = "-[NSSharedKeyDictionary countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v31 + 12) = 2048;
    *(void *)(v31 + 14) = v5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[NSSharedKeyDictionary countByEnumeratingWithState:objects:count:]",  v5);
    v32 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v30,  v28);
    objc_exception_throw(v32);
LABEL_26:
    __break(1u);
  }

  unint64_t var0 = a3->var0;
  if (!a3->var0)
  {
    a3->var2 = &self->_mutations;
    unint64_t count = self->_count;
    sideDic = self->_sideDic;
    if (sideDic)
    {
      sideDic = -[NSDictionary count](sideDic, "count");
      unint64_t v12 = a3->var0;
    }

    else
    {
      unint64_t v12 = 0LL;
    }

    unint64_t v13 = (unint64_t)sideDic + count;
    a3->var3[0] = v13;
    if (v13 <= v12)
    {
      unint64_t v5 = 0LL;
      unint64_t v18 = -1LL;
LABEL_22:
      a3->unint64_t var0 = v18;
      return v5;
    }

    if (v13 >> 60)
    {
      CFStringRef v33 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v13);
      v34 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v33,  0LL);
      CFRelease(v33);
      objc_exception_throw(v34);
      v36 = v35;
      free(0LL);
      _Unwind_Resume(v36);
    }

    unint64_t v14 = (id *)_CFCreateArrayStorage(v13, 0, v37);
    -[NSSharedKeyDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0LL, v14, v13);
    if (v14)
    {
      uint64_t v15 = 0LL;
      do
        id v16 = v14[v15++];
      while (v13 != v15);
      unint64_t v17 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v14,  v13,  v13);
    }

    else
    {
      unint64_t v17 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", 0LL, v13);
    }

    a3->var3[1] = (unint64_t)v17;
    unint64_t var0 = a3->var0;
  }

  unint64_t v19 = a3->var3[0];
  BOOL v20 = v19 > var0;
  unint64_t v21 = v19 - var0;
  if (v20)
  {
    if (v21 < v5) {
      unint64_t v5 = v21;
    }
    objc_msgSend((id)a3->var3[1], "getObjects:range:", a4);
    a3->var1 = a4;
    unint64_t v18 = a3->var0 + v5;
    goto LABEL_22;
  }

  return 0LL;
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v11 = _os_log_pack_size();
    unint64_t v13 = &v16[-((MEMORY[0x1895F8858](v11, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSSharedKeyDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[NSSharedKeyDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]");
    uint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v13,  v11);
    objc_exception_throw(v15);
    __break(1u);
  }

  size_t v7 = -[NSSharedKeySet count](self->_keyMap, "count");
  uint64_t v18 = 0LL;
  unint64_t v19 = (unsigned __int8 *)&v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  size_t v17[2] = __71__NSSharedKeyDictionary_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke;
  v17[3] = &unk_189996328;
  v17[4] = self;
  v17[5] = a4;
  v17[6] = &v18;
  if (!__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v7, (uint64_t)v17))
  {
    v16[15] = 0;
    if (v7)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (self->_values[i])
        {
          id v10 = (void *)_CFAutoreleasePoolPush();
          -[NSSharedKeySet keyAtIndex:](self->_keyMap, "keyAtIndex:", i);
          __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v10);
        }
      }
    }

    goto LABEL_10;
  }

  unsigned __int8 v8 = atomic_load(v19 + 24);
  if ((v8 & 1) == 0) {
LABEL_10:
  }
    -[NSDictionary enumerateKeysAndObjectsWithOptions:usingBlock:]( self->_sideDic,  "enumerateKeysAndObjectsWithOptions:usingBlock:",  a3,  a4);
  _Block_object_dispose(&v18, 8);
}

void *__71__NSSharedKeyDictionary_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke( void *result,  uint64_t a2)
{
  if (*(void *)(*(void *)(result[4] + 24LL) + 8 * a2))
  {
    v3 = result;
    v4 = (void *)_CFAutoreleasePoolPush();
    uint64_t v5 = v3[5];
    [*(id *)(v3[4] + 8) keyAtIndex:a2];
    __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__(v5);
    return _CFAutoreleasePoolPop(v4);
  }

  return result;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  v21[1] = *MEMORY[0x1895F89C0];
  ++self->_mutations;
  if (!a4)
  {
    uint64_t v4 = _os_log_pack_size();
    unint64_t v13 = (char *)v21 - ((MEMORY[0x1895F8858](v4, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[NSSharedKeyDictionary setObject:forKey:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: key cannot be nil",  "-[NSSharedKeyDictionary setObject:forKey:]");
    uint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v13,  v4);
    objc_exception_throw(v15);
LABEL_23:
    uint64_t v16 = _os_log_pack_size();
    uint64_t v18 = (char *)v21 - ((MEMORY[0x1895F8858](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "-[NSSharedKeyDictionary setObject:forKey:]";
    *(_WORD *)(v19 + 12) = 2112;
    *(void *)(v19 + 14) = v4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil (key: %@)",  "-[NSSharedKeyDictionary setObject:forKey:]",  v4);
    uint64_t v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v18,  v16);
    objc_exception_throw(v20);
  }

  uint64_t v4 = (uint64_t)a4;
  if (!a3) {
    goto LABEL_23;
  }
  keyMap = self->_keyMap;
  if (keyMap) {
    uint64_t v8 = ((uint64_t (*)(NSSharedKeySet *, char *, id))self->_ifkIMP)(keyMap, sel_indexForKey_, a4);
  }
  else {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_doKVO) {
    -[NSSharedKeyDictionary willChangeValueForKey:](self, "willChangeValueForKey:", v4);
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    sideDic = self->_sideDic;
    if (!sideDic)
    {
      sideDic = (NSMutableDictionary *)objc_opt_new();
      self->_sideDic = sideDic;
    }

    -[NSMutableDictionary setObject:forKey:](sideDic, "setObject:forKey:", a3, v4);
  }

  else
  {
    uint64_t v10 = (uint64_t)self->_values[v8];
    if ((id)v10 != a3)
    {
      if (v10)
      {
        self->_values[v8] = a3;
        if (v10 >= 1) {
      }
        }

      else
      {
        ++self->_count;
        self->_values[v8] = a3;
      }
    }
  }

  if (self->_doKVO) {
    -[NSSharedKeyDictionary didChangeValueForKey:](self, "didChangeValueForKey:", v4);
  }
}

- (void)removeObjectForKey:(id)a3
{
  v15[1] = *MEMORY[0x1895F89C0];
  ++self->_mutations;
  if (!a3)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v12 = (char *)v15 - ((MEMORY[0x1895F8858](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[NSSharedKeyDictionary removeObjectForKey:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: key cannot be nil",  "-[NSSharedKeyDictionary removeObjectForKey:]");
    uint64_t v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v10);
    objc_exception_throw(v14);
  }

  keyMap = self->_keyMap;
  if (keyMap) {
    uint64_t v6 = ((uint64_t (*)(NSSharedKeySet *, char *, id))self->_ifkIMP)(keyMap, sel_indexForKey_, a3);
  }
  else {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (self->_doKVO) {
    -[NSSharedKeyDictionary willChangeValueForKey:](self, "willChangeValueForKey:", a3);
  }
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    sideDic = self->_sideDic;
    if (sideDic) {
      -[NSMutableDictionary removeObjectForKey:](sideDic, "removeObjectForKey:", a3);
    }
  }

  else
  {
    values = self->_values;
    unint64_t v9 = (unint64_t)values[v6];
    values[v6] = 0LL;
    if (v9)
    {
      --self->_count;
      if ((v9 & 0x8000000000000000LL) == 0) {
    }
      }
  }

  if (self->_doKVO) {
    -[NSSharedKeyDictionary didChangeValueForKey:](self, "didChangeValueForKey:", a3);
  }
}

- (id)keySet
{
  return self->_keyMap;
}

- (NSSharedKeyDictionary)initWithKeySet:(id)a3
{
  if (!a3) {
    return self;
  }
  self->_keyMap = (NSSharedKeySet *)a3;
  self->_ifkIMP = (void *)[a3 methodForSelector:sel_indexForKey_];
  size_t v7 = (id *)calloc(-[NSSharedKeySet count](self->_keyMap, "count"), 8uLL);
  self->_values = v7;
  if (v7) {
    return self;
  }
  uint64_t v9 = __CFExceptionProem((objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: unable to unarchive - memory failure",  v9);
  uint64_t v10 = _CFAutoreleasePoolAddObject();

  objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSMallocException",  v10,  0LL));
  return (NSSharedKeyDictionary *)+[NSSharedKeyDictionary sharedKeyDictionaryWithKeySet:](v11, v12, v13);
}

+ (id)sharedKeyDictionaryWithKeySet:(id)a3
{
  return (id)[objc_alloc((Class)a1) initWithKeySet:a3];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  values = self->_values;
  if (values)
  {
    unint64_t v4 = -[NSSharedKeySet count](self->_keyMap, "count");
    if (v4)
    {
      unint64_t v5 = v4;
      do
      {
        ++values;
        --v5;
      }

      while (v5);
    }

    free(self->_values);
  }

  keyMap = self->_keyMap;
  sideDic = self->_sideDic;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSSharedKeyDictionary;
  -[NSSharedKeyDictionary dealloc](&v8, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3),  "initWithKeySet:",  self->_keyMap);
  v5[2] = self->_count;
  unint64_t v6 = -[NSSharedKeySet count](self->_keyMap, "count");
  if (v6)
  {
    unint64_t v7 = v6 - 1;
    do
    {
      uint64_t v8 = (uint64_t)self->_values[v7];
      if (v8 >= 1)
      {
        id v9 = (id)v8;
        uint64_t v8 = (uint64_t)self->_values[v7];
      }

      *(void *)(v5[3] + 8 * v7--) = v8;
    }

    while (v7 != -1LL);
  }

  v5[5] = -[NSDictionary mutableCopyWithZone:](self->_sideDic, "mutableCopyWithZone:", a3);
  return v5;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v16 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: this object can only be encoded by a keyed coder",  v16);
    uint64_t v17 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v17);
  }

  [a3 encodeObject:self->_keyMap forKey:@"NS.skkeyset"];
  [a3 encodeObject:self->_sideDic forKey:@"NS.sideDic"];
  [a3 encodeInt64:self->_count forKey:@"NS.count"];
  if (self->_count)
  {
    unint64_t v6 = +[NSArray array](&OBJC_CLASS___NSMutableArray, "array");
    unint64_t v7 = +[NSArray array](&OBJC_CLASS___NSMutableArray, "array");
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    keyMap = self->_keyMap;
    uint64_t v9 = -[NSSharedKeySet countByEnumeratingWithState:objects:count:]( keyMap,  "countByEnumeratingWithState:objects:count:",  &v19,  v18,  16LL);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(keyMap);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v14 = -[NSSharedKeyDictionary objectForKey:](self, "objectForKey:", v13);
          if (v14)
          {
            id v15 = v14;
            -[NSArray addObject:](v6, "addObject:", v13);
            -[NSArray addObject:](v7, "addObject:", v15);
          }
        }

        uint64_t v10 = -[NSSharedKeySet countByEnumeratingWithState:objects:count:]( keyMap,  "countByEnumeratingWithState:objects:count:",  &v19,  v18,  16LL);
      }

      while (v10);
    }

    [a3 encodeObject:v6 forKey:@"NS.keys"];
    [a3 encodeObject:v7 forKey:@"NS.values"];
  }

- (NSSharedKeyDictionary)initWithCoder:(id)a3
{
  uint64_t v93 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v15 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: this object can only be decoded by a keyed coder",  v15);
    uint64_t v16 = _CFAutoreleasePoolAddObject();

    [a3 failWithError:__archiveIsCorrupt(v16)];
    return 0LL;
  }

  uint64_t v6 = objc_opt_class();
  objc_getClass("NSKeyedUnarchiver");
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v91 = 0LL;
  uint64_t v92 = 0LL;
  if ((isKindOfClass & 1) != 0) {
    id v8 = a3;
  }
  else {
    id v8 = 0LL;
  }
  uint64_t v89 = 0LL;
  id v90 = v8;
  id v87 = v8;
  uint64_t v88 = 0LL;
  uint64_t v9 = [a3 decodeObjectOfClass:v6 forKey:@"NS.skkeyset"];
  uint64_t v10 = v9;
  uint64_t v91 = v9;
  unint64_t v83 = 8LL;
  self->_keyMap = (NSSharedKeySet *)v9;
  if (v9 >= 1) {
    id v11 = (id)v9;
  }
  uint64_t v12 = objc_opt_class();
  if (v12 == v6)
  {
    Class v18 = (&self->super.super.super.isa)[v83 / 8];
    if (v18)
    {
      self->_ifkIMP = (void *)-[objc_class methodForSelector:](v18, "methodForSelector:", sel_indexForKey_);
      __int128 v19 = (id *)calloc(-[objc_class count]((&self->super.super.super.isa)[v83 / 8], "count"), 8uLL);
      self->_values = v19;
      if (!v19)
      {
        uint64_t v31 = __CFExceptionProem((objc_class *)self, a2);
        CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: unable to unarchive - memory failure",  v31);
        uint64_t v14 = _CFAutoreleasePoolAddObject();
        if ([a3 decodingFailurePolicy] == 1) {

        }
        goto LABEL_10;
      }

      if ((isKindOfClass & 1) != 0)
      {
        uint64_t v20 = objc_opt_new();
        uint64_t v92 = v20;
        if (!v20)
        {
          uint64_t v38 = __CFExceptionProem((objc_class *)self, a2);
          CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: unable to unarchive - memory failure",  v38);
          uint64_t v14 = _CFAutoreleasePoolAddObject();
          if ([a3 decodingFailurePolicy] == 1) {

          }
          goto LABEL_10;
        }

        if (v10) {
          [a3 replaceObject:v10 withObject:v20];
        }
      }
    }

    Class v21 = objc_lookUpClass("NSArray");
    objc_lookUpClass("NSDictionary");
    Class v22 = objc_lookUpClass("NSMutableDictionary");
    Class v23 = objc_lookUpClass("NSString");
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __39__NSSharedKeyDictionary_initWithCoder___block_invoke;
    block[3] = &unk_18999B4C8;
    block[4] = v23;
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, block);
    }
    uint64_t v24 = (void *)[a3 allowedClasses];
    v25 = (void *)[v24 setByAddingObjectsFromSet:initWithCoder__oPlistClasses];
    uint64_t sideDic = objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v25, "setByAddingObject:", v22),  @"NS.sideDic");
    uint64_t v27 = sideDic;
    uint64_t v88 = sideDic;
    self->_uint64_t sideDic = (NSMutableDictionary *)sideDic;
    if (sideDic >= 1)
    {
      id v28 = (id)sideDic;
      uint64_t sideDic = (uint64_t)self->_sideDic;
    }

    if (sideDic)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v32 = __CFExceptionProem((objc_class *)self, a2);
        CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: invalid archive (must be mutable)",  v32);
        uint64_t v30 = _CFAutoreleasePoolAddObject();
        if ([a3 decodingFailurePolicy] == 1) {

        }
        goto LABEL_53;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v29 = __CFExceptionProem((objc_class *)self, a2);
        CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: invalid archive (invalid dictionary)",  v29);
        uint64_t v30 = _CFAutoreleasePoolAddObject();
        if ([a3 decodingFailurePolicy] == 1) {

        }
LABEL_53:
        [a3 failWithError:__archiveIsCorrupt(v30)];
        goto LABEL_11;
      }

      if ((isKindOfClass & 1) != 0)
      {
        uint64_t v33 = objc_opt_new();
        uint64_t v89 = v33;
        if (!v33)
        {
          uint64_t v42 = __CFExceptionProem((objc_class *)self, a2);
          CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: unable to unarchive - memory failure",  v42);
          uint64_t v30 = _CFAutoreleasePoolAddObject();
          if ([a3 decodingFailurePolicy] == 1) {

          }
          goto LABEL_53;
        }

        if (v27) {
          [a3 replaceObject:v27 withObject:v33];
        }
      }

      uint64_t v34 = -[NSDictionary count](self->_sideDic, "count");
      unint64_t v36 = v34;
      if (v34 >= 1)
      {
        if ((unint64_t)v34 >= 0x1000001)
        {
          uint64_t v37 = __CFExceptionProem((objc_class *)self, a2);
          CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: unreasonably sized collection",  v37);
          uint64_t v30 = _CFAutoreleasePoolAddObject();
          if ([a3 decodingFailurePolicy] == 1) {

          }
          goto LABEL_53;
        }

        v82 = &v77;
        MEMORY[0x1895F8858](v34, v35);
        v40 = (char *)&v77 - v39;
        if (v36 >= 0x101) {
          v41 = (char *)_CFCreateArrayStorage(v36, 0, &v85);
        }
        else {
          v41 = 0LL;
        }
        if (v36 >= 0x101) {
          v40 = v41;
        }
        -[NSDictionary getObjects:andKeys:count:](self->_sideDic, "getObjects:andKeys:count:", 0LL, v40, v36);
        while ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0)
        {
          v40 += 8;
          if (!--v36)
          {
            free(v41);
            goto LABEL_62;
          }
        }

        uint64_t v63 = objc_opt_class();
        CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"unexpected recursive keys (%@)",  v63);
        uint64_t v64 = _CFAutoreleasePoolAddObject();
        if ([a3 decodingFailurePolicy] == 1) {

        }
        [a3 failWithError:__archiveIsCorrupt(v64)];
        v65 = v41;
LABEL_89:
        free(v65);
        self = 0LL;
        goto LABEL_12;
      }
    }

id __39__NSSharedKeyDictionary_initWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  Class v2 = objc_lookUpClass("NSNumber");
  Class v3 = objc_lookUpClass("NSDate");
  Class v4 = objc_lookUpClass("NSURL");
  initWithCoder__oPlistClasses = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v1,  v2,  v3,  v4,  objc_lookUpClass("NSData"),  0LL);
  return (id)initWithCoder__oPlistClasses;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (void)setObservationInfo:(void *)a3
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  self->_doKVO = a3 != 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSharedKeyDictionary;
  -[NSSharedKeyDictionary setObservationInfo:](&v3, sel_setObservationInfo_);
}

@end