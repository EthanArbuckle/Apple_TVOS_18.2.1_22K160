@interface __NSArrayM
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)allObjects;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3;
- (void)_mutate;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)removeAllObjects;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsInRange:(_NSRange)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5;
- (void)setObject:(id)a3 atIndex:(unint64_t)a4;
- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4;
@end

@implementation __NSArrayM

- (unint64_t)count
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  return self->storage.state.var0.used;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  unint64_t used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000LL) != 0 || used <= a3)
  {
    uint64_t v10 = _os_log_pack_size();
    v12 = (char *)v20 - ((MEMORY[0x1895F8858](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      uint64_t v14 = used - 1;
      double v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[__NSArrayM objectAtIndex:]", a3, v14);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v15,  "-[__NSArrayM objectAtIndex:]",  a3,  v14);
    }

    else
    {
      *(_DWORD *)uint64_t v13 = 136315394;
      *(void *)(v13 + 4) = "-[__NSArrayM objectAtIndex:]";
      *(_WORD *)(v13 + 12) = 2048;
      *(void *)(v13 + 14) = a3;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSArrayM objectAtIndex:]",  a3);
    }

    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v10);
    objc_exception_throw(v16);
    -[__NSArrayM getObjects:range:](v17, v18, v19, v21);
  }

  else
  {
    unsigned int size = self->storage.size;
    unsigned int v8 = self->storage.var0 + a3;
    if (size > v8) {
      unsigned int size = 0;
    }
    return self->storage.list[v8 - size];
  }

  return result;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v45[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  }
  p_storage = &self->storage;
  NSUInteger used = self->storage.state.var0.used;
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || location + length > used)
  {
    uint64_t v28 = _os_log_pack_size();
    v30 = (char *)v45 - ((MEMORY[0x1895F8858](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v31 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      uint64_t v40 = used - 1;
      double v41 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v31,  (uint64_t)"-[__NSArrayM getObjects:range:]",  location,  length,  v40);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v41,  "-[__NSArrayM getObjects:range:]",  location,  length,  v40);
    }

    else
    {
      double v32 = __os_log_helper_1_2_3_8_32_8_0_8_0(v31, (uint64_t)"-[__NSArrayM getObjects:range:]", location, length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v32,  "-[__NSArrayM getObjects:range:]",  location,  length);
    }

    v42 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v30,  v28);
    objc_exception_throw(v42);
    -[__NSArrayM allObjects](v43, v44);
    return;
  }

  if (!a3 && length)
  {
    uint64_t v33 = _os_log_pack_size();
    v35 = (char *)v45 - ((MEMORY[0x1895F8858](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v36 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v36 = 136315394;
    *(void *)(v36 + 4) = "-[__NSArrayM getObjects:range:]";
    *(_WORD *)(v36 + 12) = 2048;
    *(void *)(v36 + 14) = length;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSArrayM getObjects:range:]",  length);
    goto LABEL_40;
  }

  if (length >> 61)
  {
    uint64_t v33 = _os_log_pack_size();
    v35 = (char *)v45 - ((MEMORY[0x1895F8858](v33, v37) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v38 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v38 = 136315394;
    *(void *)(v38 + 4) = "-[__NSArrayM getObjects:range:]";
    *(_WORD *)(v38 + 12) = 2048;
    *(void *)(v38 + 14) = length;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSArrayM getObjects:range:]",  length);
LABEL_40:
    v39 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v35,  v33);
    objc_exception_throw(v39);
  }

  if (a3 && length)
  {
    list = p_storage->list;
    uint64_t size = p_storage->size;
    unint64_t v13 = (unint64_t)&p_storage->list[size];
    unint64_t v14 = (unint64_t)(&p_storage->list[p_storage->var0] + location);
    uint64_t v15 = -size;
    if (v13 <= v14) {
      uint64_t v16 = -size;
    }
    else {
      uint64_t v16 = 0LL;
    }
    v17 = (void **)(v14 + 8 * v16);
    switch(length)
    {
      case 1uLL:
        goto LABEL_34;
      case 2uLL:
        goto LABEL_30;
      case 3uLL:
        goto LABEL_26;
      case 4uLL:
        goto LABEL_22;
      default:
        else {
          uint64_t v18 = (uint64_t)(v13 - (void)v17) >> 3;
        }
        if ((_DWORD)v18) {
          memmove(a3, v17, 8LL * v18);
        }
        if ((_DWORD)length != (_DWORD)v18) {
          memmove(&a3[v18], list, 8LL * (length - v18));
        }
LABEL_22:
        v20 = *v17;
        v19 = v17 + 1;
        *a3++ = v20;
        else {
          uint64_t v21 = 0LL;
        }
        v17 = &v19[v21];
LABEL_26:
        v23 = *v17;
        v22 = v17 + 1;
        *a3++ = v23;
        else {
          uint64_t v24 = 0LL;
        }
        v17 = &v22[v24];
LABEL_30:
        v26 = *v17;
        v25 = v17 + 1;
        *a3++ = v26;
        else {
          uint64_t v27 = 0LL;
        }
        v17 = &v25[v27];
LABEL_34:
        *a3 = *v17;
        break;
    }
  }

- (id)allObjects
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  return (id)__NSArrayM_copy((uint64_t)self);
}

- (void)_mutate
{
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
    if (a3) {
      goto LABEL_3;
    }
LABEL_72:
    uint64_t v55 = _os_log_pack_size();
    v57 = (char *)&v66 - ((MEMORY[0x1895F8858](v55, v56) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v58 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v58 = 136315138;
    *(void *)(v58 + 4) = "-[__NSArrayM insertObject:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[__NSArrayM insertObject:atIndex:]");
    v59 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v57,  v55);
    objc_exception_throw(v59);
    goto LABEL_73;
  }

  if (!a3) {
    goto LABEL_72;
  }
LABEL_3:
  p_storage = &self->storage;
  unint64_t used = self->storage.state.var0.used;
  if ((a4 & 0x8000000000000000LL) != 0 || used < a4)
  {
LABEL_73:
    uint64_t v60 = _os_log_pack_size();
    v62 = (char *)&v66 - ((MEMORY[0x1895F8858](v60, v61) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v63 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      double v64 = __os_log_helper_1_2_3_8_32_8_0_8_0(v63, (uint64_t)"-[__NSArrayM insertObject:atIndex:]", a4, used - 1);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v64,  "-[__NSArrayM insertObject:atIndex:]",  a4,  used - 1);
    }

    else
    {
      *(_DWORD *)uint64_t v63 = 136315394;
      *(void *)(v63 + 4) = "-[__NSArrayM insertObject:atIndex:]";
      *(_WORD *)(v63 + 12) = 2048;
      *(void *)(v63 + 14) = a4;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSArrayM insertObject:atIndex:]",  a4);
    }

    v65 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v62,  v60);
    objc_exception_throw(v65);
    goto LABEL_78;
  }

  uint64_t v10 = atomic_load((unint64_t *)&self->cow);
  unsigned int muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D) {
    unsigned int v12 = muts + 1;
  }
  else {
    unsigned int v12 = 0;
  }
  if (v10)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v10);
    if (!*(_WORD *)(v10 + 6)) {
      -[__NSArrayM insertObject:atIndex:].cold.2();
    }
    if (*(_WORD *)(v10 + 6) != 1 || *(_WORD *)(v10 + 4) != 0)
    {
      --*(_WORD *)(v10 + 6);
      _cow_mutate_slow((uint64_t)self, v10, (uint64_t)__NSArray_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v10);
  }

  v66 = (offset *)a3;
  self->storage.state.var0.unsigned int muts = v12;
  size_t size = self->storage.size;
  unsigned int v15 = used + 1;
  if (size < (int)used + 1)
  {
    list = p_storage->list;
    double v17 = (double)used * 1.625;
    size_t v18 = malloc_good_size(8LL * v17);
    v19 = (offset **)malloc(v18);
    if (v19)
    {
      v20 = v19;
      uint64_t var0 = p_storage->var0;
      else {
        unsigned int v22 = size - var0;
      }
      memmove(v19, &list[var0], 8LL * v22);
      memmove(&v20[v22], list, 8LL * (used - v22));
      bzero(&v20[used], v18 - 8 * used);
      free(list);
      p_storage->list = v20;
      size_t size = v18 >> 3;
      p_storage->uint64_t var0 = 0;
      p_storage->size_t size = v18 >> 3;
      goto LABEL_24;
    }

- (void)removeObjectAtIndex:(unint64_t)a3
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }
  -[__NSArrayM removeObjectsInRange:](self, "removeObjectsInRange:", a3, 1LL);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  v33[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  unint64_t used = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  unsigned int muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D) {
    unsigned int v11 = muts + 1;
  }
  else {
    unsigned int v11 = 0;
  }
  if (used)
  {
    os_unfair_lock_lock((os_unfair_lock_t)used);
    if (!*(_WORD *)(used + 6)) {
      -[__NSArrayM replaceObjectAtIndex:withObject:].cold.1();
    }
    if (*(_WORD *)(used + 6) != 1 || *(_WORD *)(used + 4) != 0)
    {
      --*(_WORD *)(used + 6);
      _cow_mutate_slow((uint64_t)self, used, (uint64_t)__NSArray_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)used);
  }

  self->storage.state.var0.unsigned int muts = v11;
  if (!a4)
  {
    a3 = _os_log_pack_size();
    v20 = (char *)v33 - ((MEMORY[0x1895F8858](a3, v19) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136315138;
    *(void *)(v21 + 4) = "-[__NSArrayM replaceObjectAtIndex:withObject:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[__NSArrayM replaceObjectAtIndex:withObject:]");
    unsigned int v22 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v20,  a3);
    objc_exception_throw(v22);
    goto LABEL_26;
  }

  unint64_t used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000LL) != 0 || used <= a3)
  {
LABEL_26:
    uint64_t v23 = _os_log_pack_size();
    v25 = (char *)v33 - ((MEMORY[0x1895F8858](v23, v24) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v26 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      uint64_t v27 = used - 1;
      double v28 = __os_log_helper_1_2_3_8_32_8_0_8_0(v26, (uint64_t)"-[__NSArrayM replaceObjectAtIndex:withObject:]", a3, v27);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v28,  "-[__NSArrayM replaceObjectAtIndex:withObject:]",  a3,  v27);
    }

    else
    {
      *(_DWORD *)uint64_t v26 = 136315394;
      *(void *)(v26 + 4) = "-[__NSArrayM replaceObjectAtIndex:withObject:]";
      *(_WORD *)(v26 + 12) = 2048;
      *(void *)(v26 + 14) = a3;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSArrayM replaceObjectAtIndex:withObject:]",  a3);
    }

    uint64_t v29 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v25,  v23);
    objc_exception_throw(v29);
    -[__NSArrayM addObject:](v30, v31, v32);
    return;
  }

  unsigned int size = self->storage.size;
  unsigned int v14 = self->storage.var0 + a3;
  if (size > v14) {
    unsigned int size = 0;
  }
  uint64_t v15 = v14 - size;
  list = p_storage->list;
  uint64_t v17 = (uint64_t)p_storage->list[v15];
  if ((id)v17 != a4)
  {
    if (((unint64_t)a4 & 0x8000000000000000LL) == 0)
    {
      id v18 = a4;
      list = p_storage->list;
    }

    list[v15] = (offset *)a4;
    if (v17 >= 1) {
  }
    }

- (void)addObject:(id)a3
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }
  -[__NSArrayM insertObject:atIndex:](self, "insertObject:atIndex:", a3, self->storage.state.var0.used);
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
  atomic_load((unint64_t *)&self->cow);
  unint64_t result = a3->var0;
  if (a3->var0 == -1LL) {
    return 0LL;
  }
  p_storage = &self->storage;
  if (result)
  {
    list = (id *)p_storage->list;
    a3->uint64_t var0 = -1LL;
    a3->var1 = list;
  }

  else
  {
    a3->var2 = &self->storage.state.mutations;
    unint64_t result = self->storage.state.var0.used;
    uint64_t v10 = p_storage->list;
    uint64_t var0 = self->storage.var0;
    unsigned int size = self->storage.size;
    a3->var1 = (id *)&v10[var0];
    BOOL v13 = (int)var0 + (int)result >= size;
    unint64_t v14 = (_DWORD)var0 + (_DWORD)result - size;
    if ((_DWORD)v14 != 0 && v13)
    {
      a3->uint64_t var0 = v14;
      result -= v14;
    }

    else
    {
      a3->uint64_t var0 = -1LL;
    }
  }

  return result;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v6 = a3;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (!__cf_tsanReadFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_14:
    uint64_t v14 = _os_log_pack_size();
    uint64_t v16 = (char *)&v19 - ((MEMORY[0x1895F8858](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315138;
    *(void *)(v17 + 4) = "-[__NSArrayM enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[__NSArrayM enumerateObjectsWithOptions:usingBlock:]");
    id v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v16,  v14);
    objc_exception_throw(v18);
  }

  __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  if (!a4) {
    goto LABEL_14;
  }
LABEL_3:
  unsigned int size = self->storage.size;
  size_t used = self->storage.state.var0.used;
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = ___deque_enumerateObjectsWithOptionsBlock_block_invoke;
  v21[3] = &unk_189995860;
  unsigned int v22 = size;
  v21[4] = a4;
  v21[5] = &self->storage;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v6, 1, used, (uint64_t)v21) & 1) == 0)
  {
    if ((v6 & 2) != 0)
    {
      char v20 = 0;
      uint64_t v12 = self->storage.state.var0.used;
      while (v12)
      {
        --v12;
        BOOL v13 = (void *)_CFAutoreleasePoolPush();
        __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v13);
      }
    }

    else
    {
      char v20 = 0;
      if (self->storage.state.var0.used)
      {
        unint64_t v10 = 0LL;
        do
        {
          unsigned int v11 = (void *)_CFAutoreleasePoolPush();
          __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v11);
          ++v10;
        }

        while (v10 < self->storage.state.var0.used);
      }
    }
  }

- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4
{
  v40[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  unsigned int muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D) {
    unsigned int v11 = muts + 1;
  }
  else {
    unsigned int v11 = 0;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:].cold.1();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSArray_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }

  self->storage.state.var0.unsigned int muts = v11;
  unint64_t used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000LL) != 0 || used <= a3)
  {
    uint64_t v22 = _os_log_pack_size();
    uint64_t v24 = (char *)v40 - ((MEMORY[0x1895F8858](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v25 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      uint64_t v35 = used - 1;
      double v36 = __os_log_helper_1_2_3_8_32_8_0_8_0( v25,  (uint64_t)"-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]",  a3,  v35);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v36,  "-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]",  a3,  v35);
    }

    else
    {
      *(_DWORD *)uint64_t v25 = 136315394;
      *(void *)(v25 + 4) = "-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v25 + 12) = 2048;
      *(void *)(v25 + 14) = a3;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]",  a3);
    }

    uint64_t v32 = _CFAutoreleasePoolAddObject();
    uint64_t v33 = v24;
    uint64_t v34 = v22;
    goto LABEL_32;
  }

  if ((a4 & 0x8000000000000000LL) != 0 || used <= a4)
  {
    uint64_t v26 = _os_log_pack_size();
    double v28 = (char *)v40 - ((MEMORY[0x1895F8858](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v29 = _os_log_pack_fill();
    uint64_t v30 = used - 1;
    double v31 = __os_log_helper_1_2_3_8_32_8_0_8_0( v29,  (uint64_t)"-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]",  a4,  v30);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v31,  "-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]",  a4,  v30);
    uint64_t v32 = _CFAutoreleasePoolAddObject();
    uint64_t v33 = v28;
    uint64_t v34 = v26;
LABEL_32:
    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  v32,  0LL,  v33,  v34));
    -[__NSArrayM indexOfObjectIdenticalTo:](v37, v38, v39);
    return;
  }

  if (a3 != a4)
  {
    unsigned int var0 = self->storage.var0;
    unsigned int size = self->storage.size;
    else {
      unsigned int v16 = 0;
    }
    int v17 = var0 + a3 - v16;
    list = p_storage->list;
    unsigned int v19 = var0 + a4;
    if (size > v19) {
      unsigned int size = 0;
    }
    unsigned int v20 = v19 - size;
    uint64_t v21 = list[v20];
    list[v20] = p_storage->list[v17];
    list[v17] = v21;
  }

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  list = self->storage.list;
  unsigned int used = self->storage.state.var0.used;
  uint64_t var0 = self->storage.var0;
  unsigned int v9 = self->storage.size - var0;
  if (used >= v9) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = used;
  }
  if ((_DWORD)v10)
  {
    unint64_t result = 0LL;
    uint64_t v12 = &list[var0];
    while (v12[result] != a3)
    {
      if (v10 == ++result) {
        goto LABEL_10;
      }
    }
  }

  else
  {
LABEL_10:
    if (used <= v9)
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }

    else
    {
      LODWORD(v13) = used - v10;
      else {
        uint64_t v13 = v13;
      }
      while (*list != a3)
      {
        ++v10;
        ++list;
        if (!--v13) {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }

      return v10;
    }
  }

  return result;
}

- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v160 = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  }
  uint64_t v10 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  unsigned int muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D) {
    unsigned int v13 = muts + 1;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v10)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v10);
    if (!*(_WORD *)(v10 + 6)) {
      -[__NSArrayM insertObjects:count:atIndex:].cold.2();
    }
    if (*(_WORD *)(v10 + 6) != 1 || *(_WORD *)(v10 + 4) != 0)
    {
      --*(_WORD *)(v10 + 6);
      _cow_mutate_slow((uint64_t)self, v10, (uint64_t)__NSArray_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v10);
  }

  self->storage.state.var0.unsigned int muts = v13;
  if (!a3 && a4) {
    goto LABEL_179;
  }
  if (a4 >> 61)
  {
    uint64_t v144 = _os_log_pack_size();
    v146 = (char *)&v153 - ((MEMORY[0x1895F8858](v144, v148) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v149 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v149 = 136315394;
    *(void *)(v149 + 4) = "-[__NSArrayM insertObjects:count:atIndex:]";
    *(_WORD *)(v149 + 12) = 2048;
    *(void *)(v149 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSArrayM insertObjects:count:atIndex:]",  a4);
LABEL_181:
    v150 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v146,  v144);
    objc_exception_throw(v150);
  }

  if (!a4)
  {
    unint64_t used = self->storage.state.var0.used;
    if ((a5 & 0x8000000000000000LL) == 0 && used >= a5) {
      return;
    }
    goto LABEL_40;
  }

  uint64_t v15 = 0LL;
  do
  {
    if (!a3[v15])
    {
      uint64_t v140 = _os_log_pack_size();
      a4 = (unint64_t)&v153 - ((MEMORY[0x1895F8858](v140, v141) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v142 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v142 = 136315394;
      *(void *)(v142 + 4) = "-[__NSArrayM insertObjects:count:atIndex:]";
      *(_WORD *)(v142 + 12) = 2048;
      *(void *)(v142 + 14) = v15;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: attempt to insert nil object from objects[%lu]",  "-[__NSArrayM insertObjects:count:atIndex:]",  v15);
      v143 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  a4,  v140);
      objc_exception_throw(v143);
LABEL_179:
      uint64_t v144 = _os_log_pack_size();
      v146 = (char *)&v153 - ((MEMORY[0x1895F8858](v144, v145) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v147 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v147 = 136315394;
      *(void *)(v147 + 4) = "-[__NSArrayM insertObjects:count:atIndex:]";
      *(_WORD *)(v147 + 12) = 2048;
      *(void *)(v147 + 14) = a4;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSArrayM insertObjects:count:atIndex:]",  a4);
      goto LABEL_181;
    }

    ++v15;
  }

  while (a4 != v15);
  unint64_t used = p_storage->state.var0.used;
  if ((a5 & 0x8000000000000000LL) != 0 || used < a5)
  {
LABEL_40:
    uint64_t v40 = _os_log_pack_size();
    unint64_t v42 = (char *)&v153 - ((MEMORY[0x1895F8858](v40, v41) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v43 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      double v151 = __os_log_helper_1_2_3_8_32_8_0_8_0( v43,  (uint64_t)"-[__NSArrayM insertObjects:count:atIndex:]",  a5,  used - 1);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v151,  "-[__NSArrayM insertObjects:count:atIndex:]",  a5,  used - 1);
    }

    else
    {
      *(_DWORD *)uint64_t v43 = 136315394;
      *(void *)(v43 + 4) = "-[__NSArrayM insertObjects:count:atIndex:]";
      *(_WORD *)(v43 + 12) = 2048;
      *(void *)(v43 + 14) = a5;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSArrayM insertObjects:count:atIndex:]",  a5);
    }

    v152 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v42,  v40);
    objc_exception_throw(v152);
    goto LABEL_185;
  }

  uint64_t v17 = 0LL;
  do
  {
    unint64_t v18 = (unint64_t)a3[v17];
    if ((v18 & 0x8000000000000000LL) == 0) {
      id v19 = (id)v18;
    }
    ++v17;
  }

  while (a4 != v17);
  int64_t size = p_storage->size;
  uint64_t v21 = (used + a4);
  if (size < v21)
  {
    list = p_storage->list;
    unint64_t v23 = (unint64_t)((double)used * 1.61803399);
    size_t v24 = malloc_good_size(8LL * v23);
    if (!HIDWORD(v24))
    {
      size_t v25 = v24;
      uint64_t v26 = (offset **)malloc(v24);
      uint64_t v27 = v26;
      if (list)
      {
        v158 = p_storage;
        if (a5 && v26)
        {
          double v28 = p_storage;
          uint64_t v29 = p_storage->list;
          p_uint64_t var0 = &v28->var0;
          uint64_t var0 = v28->var0;
          uint64_t v30 = p_var0[1];
          uint64_t v33 = &v29[v30];
          uint64_t v34 = &v29[var0];
          uint64_t v35 = -v30;
          else {
            uint64_t v36 = 0LL;
          }
          unint64_t v37 = a5;
          SEL v38 = &v34[v36];
          unint64_t v157 = v37;
          id v39 = v26;
          switch(v37)
          {
            case 1uLL:
              goto LABEL_152;
            case 2uLL:
              goto LABEL_148;
            case 3uLL:
              goto LABEL_144;
            case 4uLL:
              goto LABEL_140;
            default:
              if (v33 - v38 >= v157) {
                uint64_t v104 = v157;
              }
              else {
                uint64_t v104 = v33 - v38;
              }
              uint64_t v105 = v104;
              if ((_DWORD)v104)
              {
                uint64_t v159 = v35;
                uint64_t v154 = v104;
                uint64_t v155 = v104;
                memmove(v26, v38, 8LL * v104);
                LODWORD(v104) = v154;
                uint64_t v105 = v155;
                uint64_t v35 = v159;
              }

              if ((_DWORD)v157 != (_DWORD)v104)
              {
                v106 = v29;
                uint64_t v107 = v35;
                memmove(&v27[v105], v106, 8LL * (v157 - v104));
                uint64_t v35 = v107;
              }

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  v19[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  unint64_t used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000LL) != 0 || used <= a3)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v12 = (char *)v19 - ((MEMORY[0x1895F8858](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      uint64_t v14 = used - 1;
      double v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[__NSArrayM objectAtIndexedSubscript:]", a3, v14);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v15,  "-[__NSArrayM objectAtIndexedSubscript:]",  a3,  v14);
    }

    else
    {
      *(_DWORD *)uint64_t v13 = 136315394;
      *(void *)(v13 + 4) = "-[__NSArrayM objectAtIndexedSubscript:]";
      *(_WORD *)(v13 + 12) = 2048;
      *(void *)(v13 + 14) = a3;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSArrayM objectAtIndexedSubscript:]",  a3);
    }

    unsigned int v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v10);
    objc_exception_throw(v16);
    -[__NSArrayM removeAllObjects](v17, v18);
  }

  else
  {
    unsigned int size = self->storage.size;
    unsigned int v8 = self->storage.var0 + a3;
    if (size > v8) {
      unsigned int size = 0;
    }
    return self->storage.list[v8 - size];
  }

  return result;
}

- (void)removeAllObjects
{
}

- (void)removeLastObject
{
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableArray);
  }
  unint64_t v4 = -[__NSArrayM count](self, "count");
  if (_CFExecutableLinkedOnOrAfter(7uLL))
  {
    if (!v4) {
      return;
    }
    unint64_t v5 = v4 - 1;
  }

  else if (v4)
  {
    unint64_t v5 = v4 - 1;
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  -[__NSArrayM removeObjectAtIndex:](self, "removeObjectAtIndex:", v5);
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  int64_t length = a3.length;
  int64_t location = a3.location;
  uint64_t v135 = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  }
  uint64_t v7 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  unsigned int muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D) {
    unsigned int v10 = muts + 1;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v7)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v7);
    if (!*(_WORD *)(v7 + 6)) {
      goto LABEL_160;
    }
    if (*(_WORD *)(v7 + 6) != 1 || *(_WORD *)(v7 + 4) != 0)
    {
      --*(_WORD *)(v7 + 6);
      _cow_mutate_slow((uint64_t)self, v7, (uint64_t)__NSArray_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v7);
  }

  self->storage.state.var0.unsigned int muts = v10;
  unint64_t v12 = -[__NSArrayM count](self, "count");
  unint64_t v13 = v12;
  if (location < 0 || length < 0 || (int64_t v14 = location + length, v12 < location + length))
  {
    if (v12)
    {
      uint64_t v118 = _os_log_pack_size();
      uint64_t v126 = (char *)&v130 - ((MEMORY[0x1895F8858](v118, v125) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v127 = _os_log_pack_fill();
      uint64_t v128 = v13 - 1;
      double v129 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v127,  (uint64_t)"-[__NSArrayM removeObjectsInRange:]",  location,  length,  v128);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v129,  "-[__NSArrayM removeObjectsInRange:]",  location,  length,  v128);
      uint64_t v123 = _CFAutoreleasePoolAddObject();
      unint64_t v124 = v126;
    }

    else
    {
      uint64_t v118 = _os_log_pack_size();
      v120 = (char *)&v130 - ((MEMORY[0x1895F8858](v118, v119) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v121 = _os_log_pack_fill();
      double v122 = __os_log_helper_1_2_3_8_32_8_0_8_0(v121, (uint64_t)"-[__NSArrayM removeObjectsInRange:]", location, length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v122,  "-[__NSArrayM removeObjectsInRange:]",  location,  length);
      uint64_t v123 = _CFAutoreleasePoolAddObject();
      unint64_t v124 = v120;
    }

    objc_exception_throw( +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  v123,  0LL,  v124,  v118));
LABEL_160:
    -[__NSArrayM removeObjectsInRange:].cold.2();
  }

  if (length)
  {
    list = (id *)p_storage->list;
    uint64_t size = p_storage->size;
    unint64_t v17 = (unint64_t)&p_storage->list[size];
    unint64_t v18 = (unint64_t)(&p_storage->list[p_storage->var0] + location);
    if (v17 <= v18) {
      uint64_t v19 = -size;
    }
    else {
      uint64_t v19 = 0LL;
    }
    unsigned int v20 = (id *)(v18 + 8 * v19);
    else {
      uint64_t v21 = (uint64_t)(v17 - (void)v20) >> 3;
    }
    uint64_t v22 = v21;
    if ((_DWORD)v21)
    {
      do
      {
        ++v20;
        --v22;
      }

      while (v22);
    }

    uint64_t v23 = (length - v21);
    if ((_DWORD)length != (_DWORD)v21)
    {
      do
      {
        ++list;
        --v23;
      }

      while (v23);
    }

    unsigned int v24 = p_storage->size;
    uint64_t used = p_storage->state.var0.used;
    uint64_t v26 = (used - length);
    uint64_t v133 = v26;
    v134 = p_storage;
    size_t v27 = 8LL * v26;
    size_t v28 = malloc_good_size(v27);
    if (HIDWORD(v28)) {
      -[__NSArrayM removeObjectsInRange:].cold.1();
    }
    size_t v29 = v28;
    uint64_t v30 = (offset **)malloc(v28);
    if (!v30)
    {
LABEL_41:
      uint64_t v40 = used - v14;
      if (location >= (unint64_t)(used - v14))
      {
        if (v40)
        {
          uint64_t var0 = v134->var0;
          int64_t v62 = v134->size;
          unint64_t v63 = v134->list;
          if (length < 1)
          {
            if (v40 >= 1)
            {
              uint64_t v72 = v63 + 1;
              uint64_t v73 = used + var0 - 1;
              unint64_t v74 = v73 - length;
              else {
                unint64_t v75 = v134->size;
              }
              uint64_t v76 = (uint64_t)&v63[v62 + 1];
              do
              {
                unint64_t v77 = ((v74 & ~((uint64_t)v74 >> 63)) - (v74 + (v74 >> 63))) / v75;
                int64_t v78 = v73
                    + v62
                    + v62
                    * (((v73 & ~(v73 >> 63)) - (v73 + ((unint64_t)v73 >> 63))) / v75
                     + ((unint64_t)v73 >> 63));
                do
                  v78 -= v62;
                while (v78 >= v62);
                unint64_t v79 = v74 + (v77 + (v74 >> 63)) * v62;
                unint64_t v80 = v62 + v62 * ((v74 >> 63) + v77);
                int64_t v81 = v74 + v80;
                uint64_t v82 = v76 + 8 * v79;
                do
                {
                  v81 -= v62;
                  v80 -= v62;
                  v82 -= 8 * v62;
                }

                while ((uint64_t)(v74 + v80) >= v62);
                else {
                  int64_t v83 = v78;
                }
                if (v40 >= v83 + 1) {
                  uint64_t v84 = v83 + 1;
                }
                else {
                  uint64_t v84 = v40;
                }
                if (v78 < v81) {
                  int64_t v81 = v78;
                }
                if (v40 >= v81 + 1) {
                  uint64_t v85 = v81 + 1;
                }
                else {
                  uint64_t v85 = v40;
                }
                memmove((void *)(v82 - 8 * v85), &v72[v78] - v84, 8 * v84);
                v73 -= v84;
                v74 -= v84;
                BOOL v57 = v40 <= v84;
                v40 -= v84;
              }

              while (!v57);
            }
          }

          else if (v40 >= 1)
          {
            uint64_t v64 = location + var0;
            uint64_t v65 = v14 + var0;
            else {
              unint64_t v66 = v134->size;
            }
            do
            {
              int64_t v67 = v65
                  + v62
                  + v62
                  * (((v65 & ~(v65 >> 63)) - (v65 + ((unint64_t)v65 >> 63))) / v66 + ((unint64_t)v65 >> 63));
              do
                v67 -= v62;
              while (v67 >= v62);
              int64_t v68 = v64
                  + v62
                  + v62
              do
                v68 -= v62;
              while (v68 >= v62);
              if (v68 <= v67) {
                int64_t v69 = v67;
              }
              else {
                int64_t v69 = v68;
              }
              uint64_t v70 = v62 - v69;
              if (v40 >= v70) {
                uint64_t v71 = v70;
              }
              else {
                uint64_t v71 = v40;
              }
              memmove(&v63[v68], &v63[v67], 8 * v71);
              v65 += v71;
              v64 += v71;
              BOOL v57 = v40 <= v71;
              v40 -= v71;
            }

            while (!v57);
          }
        }
      }

      else
      {
        uint64_t v41 = p_storage->var0;
        if (location > 0)
        {
          LODWORD(v132) = v24;
          int64_t v42 = p_storage->size;
          uint64_t v43 = (uint64_t)(p_storage->list + 1);
          uint64_t v44 = location + v41 - 1;
          unint64_t v45 = v44 + length;
          else {
            unint64_t v46 = p_storage->size;
          }
          uint64_t v47 = (uint64_t)&p_storage->list[v42 + 1];
          do
          {
            unint64_t v48 = ((v45 & ~((uint64_t)v45 >> 63)) - (v45 + (v45 >> 63))) / v46;
            int64_t v49 = v44
                + v42
                + v42
                * (((v44 & ~(v44 >> 63)) - (v44 + ((unint64_t)v44 >> 63))) / v46 + ((unint64_t)v44 >> 63));
            do
              v49 -= v42;
            while (v49 >= v42);
            unint64_t v50 = v45 + (v48 + (v45 >> 63)) * v42;
            unint64_t v51 = v42 + v42 * ((v45 >> 63) + v48);
            int64_t v52 = v45 + v51;
            uint64_t v53 = v47 + 8 * v50;
            do
            {
              v52 -= v42;
              v51 -= v42;
              v53 -= 8 * v42;
            }

            while ((uint64_t)(v45 + v51) >= v42);
            else {
              int64_t v54 = v49;
            }
            if (location >= v54 + 1) {
              int64_t v55 = v54 + 1;
            }
            else {
              int64_t v55 = location;
            }
            if (v49 < v52) {
              int64_t v52 = v49;
            }
            if (location >= v52 + 1) {
              int64_t v56 = v52 + 1;
            }
            else {
              int64_t v56 = location;
            }
            memmove((void *)(v53 - 8 * v56), (const void *)(v43 - 8 * v55 + 8 * v49), 8 * v55);
            v44 -= v55;
            v45 -= v55;
            BOOL v57 = location <= v55;
            location -= v55;
          }

          while (!v57);
          p_storage = v134;
          LODWORD(v41) = v134->var0;
          unsigned int v24 = v132;
        }

        unsigned int v58 = v41 + length;
        p_storage->uint64_t var0 = v58;
        BOOL v59 = v58 >= v24;
        unsigned int v60 = v58 - v24;
        if (v59) {
          v134->uint64_t var0 = v60;
        }
      }

      v134->state.var0.uint64_t used = v133;
    }

    else
    {
      double v31 = v30;
      uint64_t v132 = 8LL * v26;
      if (location)
      {
        uint64_t v32 = p_storage->list;
        uint64_t v34 = p_storage->var0;
        uint64_t v33 = p_storage->size;
        unint64_t v35 = (unint64_t)&p_storage->list[v33];
        uint64_t v36 = -v33;
        else {
          uint64_t v37 = 0LL;
        }
        SEL v38 = &p_storage->list[v34] + v37;
        id v39 = v30;
        switch(location)
        {
          case 1LL:
            goto LABEL_129;
          case 2LL:
            goto LABEL_125;
          case 3LL:
            goto LABEL_121;
          case 4LL:
            goto LABEL_117;
          default:
            unint64_t v86 = (uint64_t)(v35 - (void)v38) >> 3;
            if (v86 >= location) {
              unint64_t v86 = location;
            }
            uint64_t v87 = v86;
            if ((_DWORD)v86)
            {
              unint64_t v131 = v86;
              memmove(v30, v38, 8LL * v86);
              LODWORD(v86) = v131;
            }

            unsigned int v88 = location - v86;
            if (v88) {
              memmove(&v31[v87], v32, 8LL * v88);
            }
LABEL_117:
            int64_t v90 = *v38;
            int64_t v89 = v38 + 1;
            *double v31 = v90;
            id v39 = v31 + 1;
            else {
              uint64_t v91 = 0LL;
            }
            SEL v38 = (offset **)&v89[v91];
LABEL_121:
            uint64_t v93 = *v38;
            int64_t v92 = v38 + 1;
            *v39++ = v93;
            else {
              uint64_t v94 = 0LL;
            }
            SEL v38 = (offset **)&v92[v94];
LABEL_125:
            uint64_t v96 = *v38;
            v95 = v38 + 1;
            *v39++ = v96;
            else {
              uint64_t v97 = 0LL;
            }
            SEL v38 = (offset **)&v95[v97];
LABEL_129:
            NSException *v39 = *v38;
            uint64_t v26 = v133;
            p_storage = v134;
            size_t v27 = v132;
            break;
        }
      }

      unint64_t v98 = used - v14;
      if (v98)
      {
        unint64_t v99 = &v31[location];
        uint64_t v100 = p_storage->list;
        uint64_t v101 = p_storage->size;
        unint64_t v102 = (unint64_t)&p_storage->list[v101];
        unint64_t v103 = (unint64_t)(&p_storage->list[p_storage->var0] + v14);
        uint64_t v104 = -v101;
        if (v102 <= v103) {
          uint64_t v105 = -v101;
        }
        else {
          uint64_t v105 = 0LL;
        }
        v106 = (uint64_t *)(v103 + 8 * v105);
        switch(v98)
        {
          case 1uLL:
            goto LABEL_154;
          case 2uLL:
            goto LABEL_150;
          case 3uLL:
            goto LABEL_146;
          case 4uLL:
            goto LABEL_142;
          default:
            else {
              uint64_t v107 = (uint64_t)(v102 - (void)v106) >> 3;
            }
            if ((_DWORD)v107) {
              memmove(v99, v106, 8LL * v107);
            }
            if ((_DWORD)v98 != (_DWORD)v107) {
              memmove(&v99[v107], v100, 8LL * (v98 - v107));
            }
LABEL_142:
            v109 = (offset *)*v106;
            v108 = v106 + 1;
            *v99++ = v109;
            else {
              uint64_t v110 = 0LL;
            }
            v106 = &v108[v110];
LABEL_146:
            v112 = (offset *)*v106;
            v111 = v106 + 1;
            *v99++ = v112;
            else {
              uint64_t v113 = 0LL;
            }
            v106 = &v111[v113];
LABEL_150:
            v115 = (offset *)*v106;
            v114 = v106 + 1;
            *v99++ = v115;
            else {
              uint64_t v116 = 0LL;
            }
            v106 = &v114[v116];
LABEL_154:
            *unint64_t v99 = (offset *)*v106;
            uint64_t v26 = v133;
            p_storage = v134;
            size_t v27 = v132;
            break;
        }
      }

      bzero(&v31[v26], v29 - v27);
      unint64_t v117 = p_storage->list;
      p_storage->list = v31;
      p_storage->uint64_t var0 = 0;
      p_storage->uint64_t size = v29 >> 3;
      p_storage->state.var0.uint64_t used = v26;
      free(v117);
    }
  }

- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v47[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  }
  unint64_t v11 = -[__NSArrayM count](self, "count");
  if ((location & 0x8000000000000000LL) != 0 || (length & 0x8000000000000000LL) != 0 || v11 < location + length)
  {
LABEL_33:
    if (v11)
    {
      unint64_t v37 = v11;
      uint64_t v25 = _os_log_pack_size();
      size_t v27 = (char *)v47 - ((MEMORY[0x1895F8858](v25, v38) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v39 = _os_log_pack_fill();
      double v40 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v39,  (uint64_t)"-[__NSArrayM replaceObjectsInRange:withObjects:count:]",  location,  length,  --v37);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v40,  "-[__NSArrayM replaceObjectsInRange:withObjects:count:]",  location,  length,  v37);
    }

    else
    {
      uint64_t v25 = _os_log_pack_size();
      size_t v27 = (char *)v47 - ((MEMORY[0x1895F8858](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v28 = _os_log_pack_fill();
      double v29 = __os_log_helper_1_2_3_8_32_8_0_8_0( v28,  (uint64_t)"-[__NSArrayM replaceObjectsInRange:withObjects:count:]",  location,  length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v29,  "-[__NSArrayM replaceObjectsInRange:withObjects:count:]",  location,  length,  v46);
    }

    uint64_t v41 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v27,  v25);
    objc_exception_throw(v41);
    -[__NSArrayM setObject:atIndex:](v42, v43, v44, v45);
    return;
  }

  if (!a4 && a5)
  {
    uint64_t v30 = _os_log_pack_size();
    uint64_t v32 = (char *)v47 - ((MEMORY[0x1895F8858](v30, v31) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v33 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v33 = 136315394;
    *(void *)(v33 + 4) = "-[__NSArrayM replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v33 + 12) = 2048;
    *(void *)(v33 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSArrayM replaceObjectsInRange:withObjects:count:]",  a5);
    goto LABEL_37;
  }

  if (a5 >> 61)
  {
    uint64_t v30 = _os_log_pack_size();
    uint64_t v32 = (char *)v47 - ((MEMORY[0x1895F8858](v30, v34) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v35 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v35 = 136315394;
    *(void *)(v35 + 4) = "-[__NSArrayM replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v35 + 12) = 2048;
    *(void *)(v35 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSArrayM replaceObjectsInRange:withObjects:count:]",  a5);
LABEL_37:
    uint64_t v36 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v32,  v30);
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
        *(void *)(v23 + 4) = "-[__NSArrayM replaceObjectsInRange:withObjects:count:]";
        *(_WORD *)(v23 + 12) = 2048;
        *(void *)(v23 + 14) = v12;
        CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: attempt to insert nil object from objects[%lu]",  "-[__NSArrayM replaceObjectsInRange:withObjects:count:]",  v12);
        unsigned int v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  location,  v21);
        objc_exception_throw(v24);
        goto LABEL_33;
      }

      ++v12;
    }

    while (a5 != v12);
    unint64_t v13 = a5;
    int64_t v14 = a4;
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
    unint64_t v18 = a4;
    unint64_t v19 = v16;
    do
    {
      uint64_t v20 = (uint64_t)*v18++;
      -[__NSArrayM replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v17++, v20);
      --v19;
    }

    while (v19);
  }

  if (length > a5)
  {
    -[__NSArrayM removeObjectsInRange:](self, "removeObjectsInRange:", v16 + location, length - v16);
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

  -[__NSArrayM insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", &a4[v16], a5 - v16, v16 + location);
  do
  {
LABEL_28:
    ++a4;
    --a5;
  }

  while (a5);
}

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  v42[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  unsigned int muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D) {
    unint64_t used = muts + 1;
  }
  else {
    unint64_t used = 0LL;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSArrayM setObject:atIndex:].cold.2();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSArray_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }

  self->storage.state.var0.unsigned int muts = used;
  if (!a3)
  {
    uint64_t v32 = _os_log_pack_size();
    a4 = (unint64_t)v42 - ((MEMORY[0x1895F8858](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v34 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v34 = 136315138;
    *(void *)(v34 + 4) = "-[__NSArrayM setObject:atIndex:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[__NSArrayM setObject:atIndex:]");
    uint64_t v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  a4,  v32);
    objc_exception_throw(v35);
    goto LABEL_40;
  }

  unint64_t used = self->storage.state.var0.used;
  if ((a4 & 0x8000000000000000LL) != 0 || used < a4)
  {
LABEL_40:
    uint64_t v36 = _os_log_pack_size();
    uint64_t v38 = (char *)v42 - ((MEMORY[0x1895F8858](v36, v37) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v39 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      double v40 = __os_log_helper_1_2_3_8_32_8_0_8_0(v39, (uint64_t)"-[__NSArrayM setObject:atIndex:]", a4, used - 1);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v40,  "-[__NSArrayM setObject:atIndex:]",  a4,  used - 1);
    }

    else
    {
      *(_DWORD *)uint64_t v39 = 136315394;
      *(void *)(v39 + 4) = "-[__NSArrayM setObject:atIndex:]";
      *(_WORD *)(v39 + 12) = 2048;
      *(void *)(v39 + 14) = a4;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSArrayM setObject:atIndex:]",  a4);
    }

    uint64_t v41 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v38,  v36);
    objc_exception_throw(v41);
    goto LABEL_45;
  }

  if ((_DWORD)used == (_DWORD)a4)
  {
    LODWORD(v13) = self->storage.size;
    unsigned int v14 = used + 1;
    if (v13 >= (int)used + 1)
    {
LABEL_26:
      unsigned int var0 = p_storage->var0;
      ++p_storage->state.var0.used;
      unsigned int v23 = var0 + used;
      else {
        int v24 = 0;
      }
      p_storage->list[v23 - v24] = (offset *)a3;
      return;
    }

    list = p_storage->list;
    double v16 = (double)used * 1.625;
    size_t v17 = malloc_good_size(8LL * v16);
    unint64_t v18 = (offset **)malloc(v17);
    if (v18)
    {
      unint64_t v19 = v18;
      uint64_t v20 = p_storage->var0;
      else {
        unsigned int v21 = v13 - v20;
      }
      memmove(v18, &list[v20], 8LL * v21);
      memmove(&v19[v21], list, 8LL * (used - v21));
      bzero(&v19[used], v17 - 8 * used);
      free(list);
      p_storage->list = v19;
      size_t v13 = v17 >> 3;
      p_storage->unsigned int var0 = 0;
      p_storage->unsigned int size = v17 >> 3;
      goto LABEL_26;
    }

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  v42[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  unsigned int muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D) {
    unint64_t used = muts + 1;
  }
  else {
    unint64_t used = 0LL;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSArrayM setObject:atIndexedSubscript:].cold.2();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSArray_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }

  self->storage.state.var0.unsigned int muts = used;
  if (!a3)
  {
    uint64_t v32 = _os_log_pack_size();
    a4 = (unint64_t)v42 - ((MEMORY[0x1895F8858](v32, v33) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v34 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v34 = 136315138;
    *(void *)(v34 + 4) = "-[__NSArrayM setObject:atIndexedSubscript:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil",  "-[__NSArrayM setObject:atIndexedSubscript:]");
    uint64_t v35 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  a4,  v32);
    objc_exception_throw(v35);
    goto LABEL_40;
  }

  unint64_t used = self->storage.state.var0.used;
  if ((a4 & 0x8000000000000000LL) != 0 || used < a4)
  {
LABEL_40:
    uint64_t v36 = _os_log_pack_size();
    uint64_t v38 = (char *)v42 - ((MEMORY[0x1895F8858](v36, v37) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v39 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      double v40 = __os_log_helper_1_2_3_8_32_8_0_8_0( v39,  (uint64_t)"-[__NSArrayM setObject:atIndexedSubscript:]",  a4,  used - 1);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v40,  "-[__NSArrayM setObject:atIndexedSubscript:]",  a4,  used - 1);
    }

    else
    {
      *(_DWORD *)uint64_t v39 = 136315394;
      *(void *)(v39 + 4) = "-[__NSArrayM setObject:atIndexedSubscript:]";
      *(_WORD *)(v39 + 12) = 2048;
      *(void *)(v39 + 14) = a4;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSArrayM setObject:atIndexedSubscript:]",  a4);
    }

    uint64_t v41 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v38,  v36);
    objc_exception_throw(v41);
    goto LABEL_45;
  }

  if ((_DWORD)used == (_DWORD)a4)
  {
    LODWORD(v13) = self->storage.size;
    unsigned int v14 = used + 1;
    if (v13 >= (int)used + 1)
    {
LABEL_26:
      unsigned int var0 = p_storage->var0;
      ++p_storage->state.var0.used;
      unsigned int v23 = var0 + used;
      else {
        int v24 = 0;
      }
      p_storage->list[v23 - v24] = (offset *)a3;
      return;
    }

    list = p_storage->list;
    double v16 = (double)used * 1.625;
    size_t v17 = malloc_good_size(8LL * v16);
    unint64_t v18 = (offset **)malloc(v17);
    if (v18)
    {
      unint64_t v19 = v18;
      uint64_t v20 = p_storage->var0;
      else {
        unsigned int v21 = v13 - v20;
      }
      memmove(v18, &list[v20], 8LL * v21);
      memmove(&v19[v21], list, 8LL * (used - v21));
      bzero(&v19[used], v17 - 8 * used);
      free(list);
      p_storage->list = v19;
      size_t v13 = v17 >> 3;
      p_storage->unsigned int var0 = 0;
      p_storage->unsigned int size = v17 >> 3;
      goto LABEL_26;
    }

- (void)dealloc
{
}

- (id)copy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  return (id)__NSArrayM_copy((uint64_t)self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  return (id)__NSArrayM_copy((uint64_t)self);
}

- (id)mutableCopy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  }
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    char v6 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
    }

    __clrex();
    free(v6);
  }

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  }
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    uint64_t v7 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
    }

    __clrex();
    free(v7);
  }

- (void)insertObject:atIndex:.cold.1()
{
  qword_18C539A70 = (uint64_t)"failure to grow array";
  __break(1u);
}

- (void)insertObject:atIndex:.cold.2()
{
}

- (void)replaceObjectAtIndex:withObject:.cold.1()
{
}

- (void)exchangeObjectAtIndex:withObjectAtIndex:.cold.1()
{
}

- (void)insertObjects:count:atIndex:.cold.1()
{
  qword_18C539A70 = (uint64_t)"size unreasonably big";
  __break(1u);
}

- (void)insertObjects:count:atIndex:.cold.2()
{
}

- (void)removeObjectsInRange:.cold.1()
{
  qword_18C539A70 = (uint64_t)"size unreasonably big";
  __break(1u);
}

- (void)removeObjectsInRange:.cold.2()
{
}

- (void)setObject:atIndex:.cold.1()
{
  qword_18C539A70 = (uint64_t)"failure to grow array";
  __break(1u);
}

- (void)setObject:atIndex:.cold.2()
{
}

- (void)setObject:atIndexedSubscript:.cold.1()
{
  qword_18C539A70 = (uint64_t)"failure to grow array";
  __break(1u);
}

- (void)setObject:atIndexedSubscript:.cold.2()
{
}

@end