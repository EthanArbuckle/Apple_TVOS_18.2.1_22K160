@interface __NSOrderedSetM
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)containsObject:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countForObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3;
- (void)_mutate;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setObject:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation __NSOrderedSetM

- (unint64_t)count
{
  return CFBasicHashGetCount((uint64_t)self->storage.set);
}

- (unint64_t)indexOfObject:(id)a3
{
  v8[4] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    p_storage = &self->storage;
    if (p_storage->set)
    {
      CFBasicHashFindBucket((uint64_t)p_storage->set, (unint64_t)a3, v8);
      if (v8[3]) {
        return -[NSArray indexOfObjectIdenticalTo:](p_storage->array, "indexOfObjectIdenticalTo:", v8[2]);
      }
      else {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }

  return result;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v22[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  p_storage = &self->storage;
  unint64_t Count = CFBasicHashGetCount((uint64_t)p_storage->set);
  if (Count > a3) {
    return -[NSArray objectAtIndex:](p_storage->array, "objectAtIndex:", a3);
  }
  if (Count)
  {
    unint64_t v13 = Count;
    uint64_t v9 = _os_log_pack_size();
    v11 = (char *)v22 - ((MEMORY[0x1895F8858](v9, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    double v16 = __os_log_helper_1_2_3_8_32_8_0_8_0(v15, (uint64_t)"_oset_objectAtIndex", a3, --v13);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v16,  "_oset_objectAtIndex",  a3,  v13);
  }

  else
  {
    uint64_t v9 = _os_log_pack_size();
    v11 = (char *)v22 - ((MEMORY[0x1895F8858](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "_oset_objectAtIndex";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = a3;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty ordered set",  "_oset_objectAtIndex",  a3);
  }

  v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v11,  v9);
  objc_exception_throw(v17);
  -[__NSOrderedSetM insertObject:atIndex:](v18, v19, v20, v21);
  return result;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  v30[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSOrderedSetM insertObject:atIndex:].cold.1();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSOrderedSet_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }

  if (a3)
  {
    p_storage = &self->storage;
    unint64_t Count = CFBasicHashGetCount((uint64_t)self->storage.set);
    uint64_t v12 = (void *)Count;
    if ((a4 & 0x8000000000000000LL) == 0 && Count >= a4)
    {
      return;
    }
  }

  else
  {
    a4 = _os_log_pack_size();
    uint64_t v12 = v30;
    uint64_t v14 = (char *)v30 - ((MEMORY[0x1895F8858](a4, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[__NSOrderedSetM insertObject:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[__NSOrderedSetM insertObject:atIndex:]");
    double v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v14,  a4);
    objc_exception_throw(v16);
  }

  uint64_t v18 = _os_log_pack_size();
  if (v12)
  {
    v23 = (char *)v30 - ((MEMORY[0x1895F8858](v18, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v24 = _os_log_pack_fill();
    uint64_t v25 = (uint64_t)v12 - 1;
    double v26 = __os_log_helper_1_2_3_8_32_8_0_8_0(v24, (uint64_t)"-[__NSOrderedSetM insertObject:atIndex:]", a4, v25);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v26,  "-[__NSOrderedSetM insertObject:atIndex:]",  a4,  v25);
    uint64_t v21 = _CFAutoreleasePoolAddObject();
    v22 = v23;
  }

  else
  {
    SEL v19 = (char *)v30 - ((MEMORY[0x1895F8858](v18, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136315394;
    *(void *)(v20 + 4) = "-[__NSOrderedSetM insertObject:atIndex:]";
    *(_WORD *)(v20 + 12) = 2048;
    *(void *)(v20 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty ordered set",  "-[__NSOrderedSetM insertObject:atIndex:]",  a4);
    uint64_t v21 = _CFAutoreleasePoolAddObject();
    v22 = v19;
  }

  objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  v21,  0LL,  v22,  v18));
  -[__NSOrderedSetM removeObjectAtIndex:](v27, v28, v29);
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  v21[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  uint64_t v6 = atomic_load((unint64_t *)&self->cow);
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v6);
    if (!*(_WORD *)(v6 + 6)) {
      -[__NSOrderedSetM removeObjectAtIndex:].cold.1();
    }
    if (*(_WORD *)(v6 + 6) != 1 || *(_WORD *)(v6 + 4) != 0)
    {
      --*(_WORD *)(v6 + 6);
      _cow_mutate_slow((uint64_t)self, v6, (uint64_t)__NSOrderedSet_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v6);
  }

  p_storage = &self->storage;
  unint64_t Count = CFBasicHashGetCount((uint64_t)p_storage->set);
  if ((a3 & 0x8000000000000000LL) != 0 || Count <= a3)
  {
    if (Count)
    {
      unint64_t v14 = Count;
      uint64_t v10 = _os_log_pack_size();
      uint64_t v12 = (char *)v21 - ((MEMORY[0x1895F8858](v10, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = _os_log_pack_fill();
      double v17 = __os_log_helper_1_2_3_8_32_8_0_8_0(v16, (uint64_t)"-[__NSOrderedSetM removeObjectAtIndex:]", a3, --v14);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v17,  "-[__NSOrderedSetM removeObjectAtIndex:]",  a3,  v14);
    }

    else
    {
      uint64_t v10 = _os_log_pack_size();
      uint64_t v12 = (char *)v21 - ((MEMORY[0x1895F8858](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v13 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v13 = 136315394;
      *(void *)(v13 + 4) = "-[__NSOrderedSetM removeObjectAtIndex:]";
      *(_WORD *)(v13 + 12) = 2048;
      *(void *)(v13 + 14) = a3;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty ordered set",  "-[__NSOrderedSetM removeObjectAtIndex:]",  a3);
    }

    uint64_t v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v10);
    objc_exception_throw(v18);
    -[__NSOrderedSetM removeAllObjects](v19, v20);
  }

  else
  {
    CFBasicHashRemoveValue( (uint64_t)p_storage->set,  (unint64_t)-[NSArray objectAtIndex:](p_storage->array, "objectAtIndex:", a3));
    -[NSMutableArray removeObjectAtIndex:](p_storage->array, "removeObjectAtIndex:", a3);
  }

- (void)removeAllObjects
{
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  v32[4] = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSOrderedSetM replaceObjectAtIndex:withObject:].cold.1();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSOrderedSet_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }

  if (!a4)
  {
    a3 = _os_log_pack_size();
    uint64_t v12 = &v31;
    uint64_t v16 = (char *)&v32[-1] - ((MEMORY[0x1895F8858](a3, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]");
    uint64_t v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v16,  a3);
    objc_exception_throw(v18);
    goto LABEL_20;
  }

  p_storage = &self->storage;
  unint64_t Count = CFBasicHashGetCount((uint64_t)self->storage.set);
  uint64_t v12 = (uint64_t *)Count;
  if ((a3 & 0x8000000000000000LL) != 0 || Count <= a3)
  {
LABEL_20:
    uint64_t v20 = _os_log_pack_size();
    if (v12)
    {
      uint64_t v25 = (char *)&v32[-1] - ((MEMORY[0x1895F8858](v20, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v26 = _os_log_pack_fill();
      uint64_t v27 = (uint64_t)v12 - 1;
      double v28 = __os_log_helper_1_2_3_8_32_8_0_8_0( v26,  (uint64_t)"-[__NSOrderedSetM replaceObjectAtIndex:withObject:]",  a3,  v27);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v28,  "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]",  a3,  v27);
      uint64_t v23 = _CFAutoreleasePoolAddObject();
      uint64_t v24 = v25;
    }

    else
    {
      uint64_t v21 = (char *)&v32[-1] - ((MEMORY[0x1895F8858](v20, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v22 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v22 = 136315394;
      *(void *)(v22 + 4) = "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]";
      *(_WORD *)(v22 + 12) = 2048;
      *(void *)(v22 + 14) = a3;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty ordered set",  "-[__NSOrderedSetM replaceObjectAtIndex:withObject:]",  a3);
      uint64_t v23 = _CFAutoreleasePoolAddObject();
      uint64_t v24 = v21;
    }

    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  v23,  0LL,  v24,  v20));
    -[__NSOrderedSetM _mutate](v29, v30);
    return;
  }

  id v13 = -[NSArray objectAtIndex:](p_storage->array, "objectAtIndex:", a3);
  unint64_t v14 = (unint64_t)v13;
  if (v13 != a4 && [v13 isEqual:a4]
    || (CFBasicHashFindBucket((uint64_t)p_storage->set, (unint64_t)a4, v32), !v32[3]))
  {
    CFBasicHashRemoveValue((uint64_t)p_storage->set, v14);
    CFBasicHashAddValue((uint64_t)p_storage->set, (unint64_t)a4, (uint64_t)a4);
    -[NSMutableArray replaceObjectAtIndex:withObject:](p_storage->array, "replaceObjectAtIndex:withObject:", a3, a4);
  }

- (void)_mutate
{
  array = self->storage.array;
  -[NSMutableArray _mutate](array, "_mutate");
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(array, v2, __CFTSANTagMutableOrderedSet);
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (BOOL)containsObject:(id)a3
{
  v7[4] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  BOOL result = 0;
  if (a3)
  {
    if (self->storage.set)
    {
      CFBasicHashFindBucket((uint64_t)self->storage.set, (unint64_t)a3, v7);
      return v7[3] != 0;
    }
  }

  return result;
}

- (unint64_t)countForObject:(id)a3
{
  v7[4] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  unint64_t result = 0LL;
  if (a3)
  {
    if (self->storage.set)
    {
      CFBasicHashFindBucket((uint64_t)self->storage.set, (unint64_t)a3, v7);
      return v7[3] != 0;
    }
  }

  return result;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v13[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = _os_log_pack_size();
    uint64_t v10 = (char *)v13 - ((MEMORY[0x1895F8858](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315138;
    *(void *)(v11 + 4) = "_oset_enumerateObjectsWithOptionsUsingBlock";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "_oset_enumerateObjectsWithOptionsUsingBlock");
    uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v10,  v8);
    objc_exception_throw(v12);
  }

  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  -[NSArray enumerateObjectsWithOptions:usingBlock:]( self->storage.array,  "enumerateObjectsWithOptions:usingBlock:",  a3,  a4);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v32[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  p_storage = &self->storage;
  unint64_t Count = CFBasicHashGetCount((uint64_t)p_storage->set);
  if ((location & 0x8000000000000000LL) == 0 && (length & 0x8000000000000000LL) == 0 && Count >= location + length)
  {
    if (!a3 && length)
    {
      uint64_t v16 = _os_log_pack_size();
      uint64_t v18 = (char *)v32 - ((MEMORY[0x1895F8858](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v19 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v19 = 136315394;
      *(void *)(v19 + 4) = "_oset_getObjectsRange";
      *(_WORD *)(v19 + 12) = 2048;
      *(void *)(v19 + 14) = length;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "_oset_getObjectsRange",  length);
    }

    else
    {
      if (!(length >> 61))
      {
        -[NSArray getObjects:range:](p_storage->array, "getObjects:range:", a3, location, length);
        return;
      }

      uint64_t v16 = _os_log_pack_size();
      uint64_t v18 = (char *)v32 - ((MEMORY[0x1895F8858](v16, v20) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v21 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v21 = 136315394;
      *(void *)(v21 + 4) = "_oset_getObjectsRange";
      *(_WORD *)(v21 + 12) = 2048;
      *(void *)(v21 + 14) = length;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "_oset_getObjectsRange",  length);
    }

    uint64_t v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v18,  v16);
    objc_exception_throw(v22);
  }

  if (Count)
  {
    unint64_t v23 = Count;
    uint64_t v11 = _os_log_pack_size();
    id v13 = (char *)v32 - ((MEMORY[0x1895F8858](v11, v24) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v25 = _os_log_pack_fill();
    double v26 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v25, (uint64_t)"_oset_getObjectsRange", location, length, --v23);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v26,  "_oset_getObjectsRange",  location,  length,  v23);
  }

  else
  {
    uint64_t v11 = _os_log_pack_size();
    id v13 = (char *)v32 - ((MEMORY[0x1895F8858](v11, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    double v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v14, (uint64_t)"_oset_getObjectsRange", location, length);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v15,  "_oset_getObjectsRange",  location,  length);
  }

  uint64_t v27 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v13,  v11);
  objc_exception_throw(v27);
  -[__NSOrderedSetM setObject:atIndex:](v28, v29, v30, v31);
}

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  v33[4] = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableOrderedSet);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSOrderedSetM setObject:atIndex:].cold.1();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSOrderedSet_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }

  if (!a3)
  {
    a4 = _os_log_pack_size();
    uint64_t v12 = &v32;
    uint64_t v16 = (char *)&v33[-1] - ((MEMORY[0x1895F8858](a4, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[__NSOrderedSetM setObject:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[__NSOrderedSetM setObject:atIndex:]");
    uint64_t v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v16,  a4);
    objc_exception_throw(v18);
    goto LABEL_24;
  }

  p_storage = &self->storage;
  unint64_t Count = CFBasicHashGetCount((uint64_t)self->storage.set);
  uint64_t v12 = (uint64_t *)Count;
  if ((a4 & 0x8000000000000000LL) != 0 || Count < a4)
  {
LABEL_24:
    uint64_t v20 = _os_log_pack_size();
    if (v12)
    {
      uint64_t v25 = (char *)&v33[-1] - ((MEMORY[0x1895F8858](v20, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v26 = _os_log_pack_fill();
      uint64_t v27 = (uint64_t)v12 - 1;
      double v28 = __os_log_helper_1_2_3_8_32_8_0_8_0(v26, (uint64_t)"-[__NSOrderedSetM setObject:atIndex:]", a4, v27);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v28,  "-[__NSOrderedSetM setObject:atIndex:]",  a4,  v27);
      uint64_t v23 = _CFAutoreleasePoolAddObject();
      uint64_t v24 = v25;
    }

    else
    {
      uint64_t v21 = (char *)&v33[-1] - ((MEMORY[0x1895F8858](v20, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v22 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v22 = 136315394;
      *(void *)(v22 + 4) = "-[__NSOrderedSetM setObject:atIndex:]";
      *(_WORD *)(v22 + 12) = 2048;
      *(void *)(v22 + 14) = a4;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty ordered set",  "-[__NSOrderedSetM setObject:atIndex:]",  a4);
      uint64_t v23 = _CFAutoreleasePoolAddObject();
      uint64_t v24 = v21;
    }

    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  v23,  0LL,  v24,  v20));
    +[__NSOrderedSetM allocWithZone:](v29, v30, v31);
    return;
  }

  if (Count == a4)
  {
  }

  else
  {
    id v13 = -[NSArray objectAtIndex:](p_storage->array, "objectAtIndex:", a4);
    unint64_t v14 = (unint64_t)v13;
    if (v13 != a3 && [v13 isEqual:a3]
      || (CFBasicHashFindBucket((uint64_t)p_storage->set, (unint64_t)a3, v33), !v33[3]))
    {
      CFBasicHashRemoveValue((uint64_t)p_storage->set, v14);
      CFBasicHashAddValue((uint64_t)p_storage->set, (unint64_t)a3, (uint64_t)a3);
      -[NSMutableArray replaceObjectAtIndex:withObject:](p_storage->array, "replaceObjectAtIndex:withObject:", a4, a3);
    }
  }

- (id)copy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    uint64_t v6 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
    }

    __clrex();
    free(v6);
  }

- (id)copyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v7 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
    }

    __clrex();
    free(v7);
  }

- (id)mutableCopy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    uint64_t v6 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
    }

    __clrex();
    free(v6);
  }

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableOrderedSet);
  }
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v7 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
    }

    __clrex();
    free(v7);
  }

- (void)dealloc
{
}

- (void)insertObject:atIndex:.cold.1()
{
}

- (void)removeObjectAtIndex:.cold.1()
{
}

- (void)replaceObjectAtIndex:withObject:.cold.1()
{
}

- (void)setObject:atIndex:.cold.1()
{
}

@end