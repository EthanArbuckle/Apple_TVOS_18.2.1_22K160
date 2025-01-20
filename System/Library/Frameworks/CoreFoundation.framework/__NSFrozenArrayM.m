@interface __NSFrozenArrayM
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObjectIdenticalTo:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation __NSFrozenArrayM

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unint64_t)count
{
  return self->storage.state.var0.used;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v18[1] = *MEMORY[0x1895F89C0];
  unint64_t used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000LL) != 0 || used <= a3)
  {
    uint64_t v8 = _os_log_pack_size();
    v10 = (char *)v18 - ((MEMORY[0x1895F8858](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      uint64_t v12 = used - 1;
      double v13 = __os_log_helper_1_2_3_8_32_8_0_8_0(v11, (uint64_t)"-[__NSFrozenArrayM objectAtIndex:]", a3, v12);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v13,  "-[__NSFrozenArrayM objectAtIndex:]",  a3,  v12);
    }

    else
    {
      *(_DWORD *)uint64_t v11 = 136315394;
      *(void *)(v11 + 4) = "-[__NSFrozenArrayM objectAtIndex:]";
      *(_WORD *)(v11 + 12) = 2048;
      *(void *)(v11 + 14) = a3;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSFrozenArrayM objectAtIndex:]",  a3);
    }

    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v10,  v8);
    objc_exception_throw(v14);
    return -[__NSFrozenArrayM objectAtIndexedSubscript:](v15, v16, v17);
  }

  else
  {
    unsigned int size = self->storage.size;
    unsigned int v5 = self->storage.var0 + a3;
    if (size > v5) {
      unsigned int size = 0;
    }
    return self->storage.list[v5 - size];
  }

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  v20[1] = *MEMORY[0x1895F89C0];
  unint64_t used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000LL) != 0 || used <= a3)
  {
    uint64_t v8 = _os_log_pack_size();
    v10 = (char *)v20 - ((MEMORY[0x1895F8858](v8, v9) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      uint64_t v12 = used - 1;
      double v13 = __os_log_helper_1_2_3_8_32_8_0_8_0(v11, (uint64_t)"-[__NSFrozenArrayM objectAtIndexedSubscript:]", a3, v12);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v13,  "-[__NSFrozenArrayM objectAtIndexedSubscript:]",  a3,  v12);
    }

    else
    {
      *(_DWORD *)uint64_t v11 = 136315394;
      *(void *)(v11 + 4) = "-[__NSFrozenArrayM objectAtIndexedSubscript:]";
      *(_WORD *)(v11 + 12) = 2048;
      *(void *)(v11 + 14) = a3;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSFrozenArrayM objectAtIndexedSubscript:]",  a3);
    }

    v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v10,  v8);
    objc_exception_throw(v14);
    return (id)-[__NSFrozenArrayM countByEnumeratingWithState:objects:count:](v15, v16, v17, v18, v19);
  }

  else
  {
    unsigned int size = self->storage.size;
    unsigned int v5 = self->storage.var0 + a3;
    if (size > v5) {
      unsigned int size = 0;
    }
    return self->storage.list[v5 - size];
  }

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
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
    a3->var2 = (unint64_t *)&_deque_countByEnumeratingWithStateObjectsCount_const_mu;
    unint64_t result = p_storage->state.var0.used;
    uint64_t v8 = p_storage->list;
    uint64_t var0 = p_storage->var0;
    unsigned int size = p_storage->size;
    a3->var1 = (id *)&v8[var0];
    BOOL v11 = (int)var0 + (int)result >= size;
    unint64_t v12 = (_DWORD)var0 + (_DWORD)result - size;
    if ((_DWORD)v12 != 0 && v11)
    {
      a3->uint64_t var0 = v12;
      result -= v12;
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
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v13 = _os_log_pack_size();
    v15 = (char *)&v18 - ((MEMORY[0x1895F8858](v13, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[__NSFrozenArrayM enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[__NSFrozenArrayM enumerateObjectsWithOptions:usingBlock:]");
    unint64_t v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v15,  v13);
    objc_exception_throw(v17);
  }

  char v5 = a3;
  p_storage = &self->storage;
  unsigned int size = self->storage.size;
  size_t used = self->storage.state.var0.used;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  void v20[2] = ___deque_enumerateObjectsWithOptionsBlock_block_invoke;
  v20[3] = &unk_189995860;
  unsigned int v21 = size;
  v20[4] = a4;
  v20[5] = &self->storage;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v5, 1, used, (uint64_t)v20) & 1) == 0)
  {
    if ((v5 & 2) != 0)
    {
      char v19 = 0;
      uint64_t v11 = p_storage->state.var0.used;
      while (v11)
      {
        --v11;
        unint64_t v12 = (void *)_CFAutoreleasePoolPush();
        __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v12);
      }
    }

    else
    {
      char v19 = 0;
      if (p_storage->state.var0.used)
      {
        unint64_t v9 = 0LL;
        do
        {
          v10 = (void *)_CFAutoreleasePoolPush();
          __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v10);
          ++v9;
        }

        while (v9 < p_storage->state.var0.used);
      }
    }
  }

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  char v5 = a3;
  v47[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4.length)
  {
    uint64_t v25 = _os_log_pack_size();
    NSUInteger used = (NSUInteger)v47;
    v27 = (char *)v47 - ((MEMORY[0x1895F8858](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v28 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v28 = 136315394;
    *(void *)(v28 + 4) = "-[__NSFrozenArrayM getObjects:range:]";
    *(_WORD *)(v28 + 12) = 2048;
    *(void *)(v28 + 14) = length;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSFrozenArrayM getObjects:range:]",  length);
LABEL_35:
    v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v27,  v25);
    objc_exception_throw(v31);
    goto LABEL_36;
  }

  if (a4.length >> 61)
  {
    uint64_t v25 = _os_log_pack_size();
    NSUInteger used = (NSUInteger)v47;
    v27 = (char *)v47 - ((MEMORY[0x1895F8858](v25, v29) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136315394;
    *(void *)(v30 + 4) = "-[__NSFrozenArrayM getObjects:range:]";
    *(_WORD *)(v30 + 12) = 2048;
    *(void *)(v30 + 14) = length;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSFrozenArrayM getObjects:range:]",  length);
    goto LABEL_35;
  }

  p_storage = &self->storage;
  NSUInteger used = self->storage.state.var0.used;
  if ((a4.location & 0x8000000000000000LL) != 0 || a4.location + a4.length > used)
  {
LABEL_36:
    NSUInteger location = a4.location;
    if ((_DWORD)used)
    {
      uint64_t v33 = _os_log_pack_size();
      v35 = (char *)v47 - ((MEMORY[0x1895F8858](v33, v38) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v39 = _os_log_pack_fill();
      uint64_t v40 = used - 1;
      double v41 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v39,  (uint64_t)"-[__NSFrozenArrayM getObjects:range:]",  location,  length,  v40);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v41,  "-[__NSFrozenArrayM getObjects:range:]",  location,  length,  v40);
    }

    else
    {
      uint64_t v33 = _os_log_pack_size();
      v35 = (char *)v47 - ((MEMORY[0x1895F8858](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v36 = _os_log_pack_fill();
      double v37 = __os_log_helper_1_2_3_8_32_8_0_8_0(v36, (uint64_t)"-[__NSFrozenArrayM getObjects:range:]", location, length);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v37,  "-[__NSFrozenArrayM getObjects:range:]",  location,  length,  v46);
    }

    v42 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v35,  v33);
    objc_exception_throw(v42);
    -[__NSFrozenArrayM indexOfObjectIdenticalTo:](v43, v44, v45);
    return;
  }

  if (a3 && a4.length)
  {
    list = p_storage->list;
    uint64_t size = self->storage.size;
    unint64_t v10 = (unint64_t)&p_storage->list[size];
    uint64_t v11 = &self->storage.list[self->storage.var0] + a4.location;
    uint64_t v12 = -size;
    else {
      uint64_t v13 = 0LL;
    }
    uint64_t v14 = (void **)&v11[v13];
    switch(a4.length)
    {
      case 1uLL:
        goto LABEL_31;
      case 2uLL:
        goto LABEL_27;
      case 3uLL:
        goto LABEL_23;
      case 4uLL:
        goto LABEL_19;
      default:
        else {
          uint64_t v15 = (uint64_t)(v10 - (void)v14) >> 3;
        }
        if ((_DWORD)v15) {
          memmove(a3, v14, 8LL * v15);
        }
        if ((_DWORD)length != (_DWORD)v15) {
          memmove(&v5[v15], list, 8LL * (length - v15));
        }
LABEL_19:
        unint64_t v17 = *v14;
        uint64_t v16 = v14 + 1;
        *v5++ = v17;
        else {
          uint64_t v18 = 0LL;
        }
        uint64_t v14 = (void **)&v16[v18];
LABEL_23:
        v20 = *v14;
        char v19 = v14 + 1;
        *v5++ = v20;
        else {
          uint64_t v21 = 0LL;
        }
        uint64_t v14 = (void **)&v19[v21];
LABEL_27:
        v23 = *v14;
        uint64_t v22 = v14 + 1;
        *v5++ = v23;
        else {
          uint64_t v24 = 0LL;
        }
        uint64_t v14 = (void **)&v22[v24];
LABEL_31:
        *char v5 = *v14;
        break;
    }
  }

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  list = self->storage.list;
  unsigned int used = self->storage.state.var0.used;
  uint64_t var0 = self->storage.var0;
  unsigned int v6 = self->storage.size - var0;
  if (used >= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = used;
  }
  if ((_DWORD)v7)
  {
    unint64_t result = 0LL;
    unint64_t v9 = &list[var0];
    while (v9[result] != a3)
    {
      if (v7 == ++result) {
        goto LABEL_8;
      }
    }
  }

  else
  {
LABEL_8:
    if (used <= v6)
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }

    else
    {
      while (*list != a3)
      {
        LODWORD(v7) = v7 + 1;
        ++list;
        if (used == (_DWORD)v7) {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }

      return v7;
    }
  }

  return result;
}

- (void)dealloc
{
}

- (id)mutableCopy
{
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    char v5 = _cow_create((uint64_t)self, 0);
    while (!__ldaxr(p_cow))
    {
    }

    __clrex();
    free(v5);
  }

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    unsigned int v6 = _cow_create((uint64_t)self, 0);
    while (!__ldaxr(p_cow))
    {
    }

    __clrex();
    free(v6);
  }

@end