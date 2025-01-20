@interface __NSFrozenOrderedSetM
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)containsObject:(id)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countForObject:(id)a3;
- (unint64_t)indexOfObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation __NSFrozenOrderedSetM

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unint64_t)count
{
  return CFBasicHashGetCount((uint64_t)self->storage.set);
}

- (unint64_t)indexOfObject:(id)a3
{
  v7[4] = *MEMORY[0x1895F89C0];
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    p_storage = &self->storage;
    set = self->storage.set;
    if (set)
    {
      CFBasicHashFindBucket((uint64_t)set, (unint64_t)a3, v7);
      if (v7[3]) {
        return -[NSArray indexOfObjectIdenticalTo:](p_storage->array, "indexOfObjectIdenticalTo:", v7[2]);
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
  v19[1] = *MEMORY[0x1895F89C0];
  p_storage = &self->storage;
  unint64_t Count = CFBasicHashGetCount((uint64_t)self->storage.set);
  if (Count > a3) {
    return -[NSArray objectAtIndex:](p_storage->array, "objectAtIndex:", a3);
  }
  if (Count)
  {
    unint64_t v11 = Count;
    uint64_t v7 = _os_log_pack_size();
    v9 = (char *)v19 - ((MEMORY[0x1895F8858](v7, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    double v14 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"_oset_objectAtIndex", a3, --v11);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v14,  "_oset_objectAtIndex",  a3,  v11);
  }

  else
  {
    uint64_t v7 = _os_log_pack_size();
    v9 = (char *)v19 - ((MEMORY[0x1895F8858](v7, v8) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315394;
    *(void *)(v10 + 4) = "_oset_objectAtIndex";
    *(_WORD *)(v10 + 12) = 2048;
    *(void *)(v10 + 14) = a3;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty ordered set",  "_oset_objectAtIndex",  a3);
  }

  v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v7);
  objc_exception_throw(v15);
  return (id)-[__NSFrozenOrderedSetM containsObject:](v16, v17, v18);
}

- (BOOL)containsObject:(id)a3
{
  BOOL result = 0;
  v6[4] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    set = self->storage.set;
    if (set)
    {
      CFBasicHashFindBucket((uint64_t)set, (unint64_t)a3, v6);
      return v6[3] != 0;
    }
  }

  return result;
}

- (unint64_t)countForObject:(id)a3
{
  unint64_t result = 0LL;
  v6[4] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    set = self->storage.set;
    if (set)
    {
      CFBasicHashFindBucket((uint64_t)set, (unint64_t)a3, v6);
      return v6[3] != 0;
    }
  }

  return result;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v9[1] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v4 = _os_log_pack_size();
    v6 = (char *)v9 - ((MEMORY[0x1895F8858](v4, v5) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v7 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = "_oset_enumerateObjectsWithOptionsUsingBlock";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "_oset_enumerateObjectsWithOptionsUsingBlock");
    uint64_t v8 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v6,  v4);
    objc_exception_throw(v8);
  }

  -[NSArray enumerateObjectsWithOptions:usingBlock:](self->storage.array, "enumerateObjectsWithOptions:usingBlock:", a3);
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v29[1] = *MEMORY[0x1895F89C0];
  p_storage = &self->storage;
  unint64_t Count = CFBasicHashGetCount((uint64_t)self->storage.set);
  if ((location & 0x8000000000000000LL) == 0 && (length & 0x8000000000000000LL) == 0 && Count >= location + length)
  {
    if (!a3 && length)
    {
      uint64_t v14 = _os_log_pack_size();
      v16 = (char *)v29 - ((MEMORY[0x1895F8858](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v17 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v17 = 136315394;
      *(void *)(v17 + 4) = "_oset_getObjectsRange";
      *(_WORD *)(v17 + 12) = 2048;
      *(void *)(v17 + 14) = length;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "_oset_getObjectsRange",  length);
    }

    else
    {
      if (!(length >> 61))
      {
        -[NSArray getObjects:range:](p_storage->array, "getObjects:range:", a3, location, length);
        return;
      }

      uint64_t v14 = _os_log_pack_size();
      v16 = (char *)v29 - ((MEMORY[0x1895F8858](v14, v18) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v19 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v19 = 136315394;
      *(void *)(v19 + 4) = "_oset_getObjectsRange";
      *(_WORD *)(v19 + 12) = 2048;
      *(void *)(v19 + 14) = length;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "_oset_getObjectsRange",  length);
    }

    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v16,  v14);
    objc_exception_throw(v20);
  }

  if (Count)
  {
    unint64_t v21 = Count;
    uint64_t v9 = _os_log_pack_size();
    unint64_t v11 = (char *)v29 - ((MEMORY[0x1895F8858](v9, v22) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v23 = _os_log_pack_fill();
    double v24 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v23, (uint64_t)"_oset_getObjectsRange", location, length, --v21);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v24,  "_oset_getObjectsRange",  location,  length,  v21);
  }

  else
  {
    uint64_t v9 = _os_log_pack_size();
    unint64_t v11 = (char *)v29 - ((MEMORY[0x1895F8858](v9, v10) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill();
    double v13 = __os_log_helper_1_2_3_8_32_8_0_8_0(v12, (uint64_t)"_oset_getObjectsRange", location, length);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v13,  "_oset_getObjectsRange",  location,  length);
  }

  v25 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v11,  v9);
  objc_exception_throw(v25);
  +[__NSFrozenOrderedSetM allocWithZone:](v26, v27, v28);
}

- (void)dealloc
{
}

- (id)mutableCopy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableOrderedSet);
  }
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v6 = _cow_create((uint64_t)self, 0);
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
    uint64_t v7 = _cow_create((uint64_t)self, 0);
    while (!__ldaxr(p_cow))
    {
    }

    __clrex();
    free(v7);
  }

@end