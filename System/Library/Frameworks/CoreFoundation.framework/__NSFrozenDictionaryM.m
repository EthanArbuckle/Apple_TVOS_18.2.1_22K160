@interface __NSFrozenDictionaryM
- (id)keyEnumerator;
- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__apply:(void *)a3 context:(void *)a4;
- (void)dealloc;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
@end

@implementation __NSFrozenDictionaryM

- (unint64_t)count
{
  return self->storage.var0.var1.other & 0x1FFFFFF;
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  v21[1] = *MEMORY[0x1895F89C0];
  unint64_t v5 = a5 >> 61;
  if (a3 && v5 || a4 && v5)
  {
    uint64_t v16 = _os_log_pack_size();
    v18 = (char *)v21 - ((MEMORY[0x1895F8858](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "-[__NSFrozenDictionaryM getObjects:andKeys:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSFrozenDictionaryM getObjects:andKeys:count:]",  a5);
    v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v18,  v16);
    objc_exception_throw(v20);
  }

  unint64_t mutations = self->storage.var0.var0.mutations;
  unint64_t v7 = mutations >> 58;
  unint64_t v8 = HIDWORD(mutations) & 0x1FFFFFF;
  if (v8 >= a5) {
    unint64_t v8 = a5;
  }
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    unint64_t v10 = 0LL;
    unint64_t v11 = LODWORD(__NSDictionarySizes_0[v7]);
    buffer = self->storage.buffer;
    do
    {
      v13 = buffer[v10];
      if (v13) {
        BOOL v14 = v13 == (state *)&___NSDictionaryM_DeletedMarker;
      }
      else {
        BOOL v14 = 1;
      }
      if (!v14)
      {
        if (a4) {
          *a4++ = v13;
        }
        if (a3) {
          *a3++ = *(&buffer[v11] + v10);
        }
        --v8;
      }

      ++v10;
    }

    while (v10 < v11 && v8);
  }

- (id)keyEnumerator
{
  return (id)[objc_allocWithZone((Class)__NSFastEnumerationEnumerator) initWithObject:self];
}

- (id)objectForKey:(id)a3
{
  unint64_t mutations = self->storage.var0.var0.mutations;
  if (!(mutations >> 58)) {
    return 0LL;
  }
  unint64_t v5 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  buffer = self->storage.buffer;
  unint64_t v7 = [a3 hash] % v5;
  uint64_t v8 = v5 <= 1 ? 1LL : v5;
  unint64_t v9 = v5;
  while (1)
  {
    unint64_t v10 = buffer[v7];
    if (!v10) {
      break;
    }
    if (v10 == (state *)&___NSDictionaryM_DeletedMarker)
    {
      if (v9 == v5) {
        unint64_t v9 = v7;
      }
    }

    else if (v10 == a3 || (-[state isEqual:](v10, "isEqual:", a3) & 1) != 0)
    {
      unint64_t v9 = v7;
      goto LABEL_21;
    }

    if (v7 + 1 >= v5) {
      unint64_t v11 = v5;
    }
    else {
      unint64_t v11 = 0LL;
    }
    unint64_t v7 = v7 + 1 - v11;
    if (!--v8) {
      goto LABEL_21;
    }
  }

  if (v9 == v5) {
    unint64_t v9 = v7;
  }
LABEL_21:
  if (v9 < v5) {
    return *(&buffer[v5] + v9);
  }
  else {
    return 0LL;
  }
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  if (a3)
  {
    unint64_t v4 = self->storage.var0.var0.mutations >> 58;
    if (v4)
    {
      unint64_t v6 = v4;
      buffer = self->storage.buffer;
      if (LODWORD(__NSDictionarySizes_0[v6]) <= 1uLL) {
        uint64_t v8 = 1LL;
      }
      else {
        uint64_t v8 = LODWORD(__NSDictionarySizes_0[v6]);
      }
      do
      {
        if (*buffer) {
          BOOL v9 = *buffer == (state *)&___NSDictionaryM_DeletedMarker;
        }
        else {
          BOOL v9 = 1;
        }
        if (!v9) {
          ((void (*)(void))a3)();
        }
        ++buffer;
        --v8;
      }

      while (v8);
    }
  }

  else
  {
    uint64_t v10 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: function pointer is NULL",  v10);
    unint64_t v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v11);
    -[__NSFrozenDictionaryM countByEnumeratingWithState:objects:count:](v12, v13, v14, v15, v16);
  }

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5)
  {
    uint64_t v12 = _os_log_pack_size();
    BOOL v14 = (char *)v20 - ((MEMORY[0x1895F8858](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[__NSFrozenDictionaryM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSFrozenDictionaryM countByEnumeratingWithState:objects:count:]",  a5);
    goto LABEL_20;
  }

  if (a5 >> 61)
  {
    uint64_t v12 = _os_log_pack_size();
    BOOL v14 = (char *)v20 - ((MEMORY[0x1895F8858](v12, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "-[__NSFrozenDictionaryM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSFrozenDictionaryM countByEnumeratingWithState:objects:count:]",  a5);
LABEL_20:
    uint64_t v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v14,  v12);
    objc_exception_throw(v19);
  }

  unint64_t var0 = a3->var0;
  unint64_t v6 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((self->storage.var0.var0.mutations >> 55) & 0x1F8));
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&mdict_countByEnumeratingWithStateObjectsCount_const_mu;
  }
  if (var0 >= v6) {
    return 0LL;
  }
  buffer = self->storage.buffer;
  a3->var1 = a4;
  unint64_t result = 0LL;
  if (a5)
  {
    do
    {
      BOOL v9 = buffer[var0];
      if (v9) {
        BOOL v10 = v9 == (state *)&___NSDictionaryM_DeletedMarker;
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10) {
        a4[result++] = v9;
      }
      ++var0;
    }

    while (var0 < v6 && result < a5);
  }

  a3->unint64_t var0 = var0;
  return result;
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v18[7] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v12 = _os_log_pack_size();
    BOOL v14 = &v17[-((MEMORY[0x1895F8858](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[__NSFrozenDictionaryM enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[__NSFrozenDictionaryM enumerateKeysAndObjectsWithOptions:usingBlock:]");
    unint64_t v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v14,  v12);
    objc_exception_throw(v16);
  }

  buffer = self->storage.buffer;
  unint64_t mutations = self->storage.var0.var0.mutations;
  size_t v7 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __mdict_enumerateKeysAndObjectsWithOptionsUsingBlock_block_invoke;
  v18[3] = &unk_1899EEAB0;
  v18[4] = a4;
  v18[5] = buffer;
  v18[6] = &buffer[v7];
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v7, (uint64_t)v18) & 1) == 0)
  {
    v17[15] = 0;
    if (mutations >> 58)
    {
      size_t v8 = 0LL;
      do
      {
        BOOL v9 = buffer[v8];
        if (v9) {
          BOOL v10 = v9 == (state *)&___NSDictionaryM_DeletedMarker;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10)
        {
          unint64_t v11 = (void *)_CFAutoreleasePoolPush();
          __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v11);
        }

        ++v8;
      }

      while (v8 < v7);
    }
  }

- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  buffer = self->storage.buffer;
  unint64_t mutations = self->storage.var0.var0.mutations;
  size_t v7 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __mdict_keyOfEntryWithOptionsPassingTest_block_invoke;
  v16[3] = &unk_1899EEAD8;
  v16[6] = buffer;
  v16[7] = &buffer[v7];
  v16[4] = a4;
  v16[5] = &v17;
  if (__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v7, (uint64_t)v16))
  {
    size_t v8 = (state *)atomic_load((unint64_t *)v18 + 3);
  }

  else
  {
    char v15 = 0;
    if (mutations >> 58)
    {
      size_t v8 = 0LL;
      if (v7 <= 1) {
        uint64_t v9 = 1LL;
      }
      else {
        uint64_t v9 = v7;
      }
      do
      {
        BOOL v10 = *buffer;
        if (*buffer) {
          BOOL v11 = v10 == (state *)&___NSDictionaryM_DeletedMarker;
        }
        else {
          BOOL v11 = 1;
        }
        if (!v11)
        {
          uint64_t v12 = buffer[v7];
          uint64_t v13 = (void *)_CFAutoreleasePoolPush();
          if ((*((unsigned int (**)(id, state *, state *, char *))a4 + 2))(a4, v10, v12, &v15))
          {
            char v15 = 1;
            size_t v8 = v10;
          }

          _CFAutoreleasePoolPop(v13);
          if (v15) {
            break;
          }
        }

        ++buffer;
        --v9;
      }

      while (v9);
    }

    else
    {
      size_t v8 = 0LL;
    }
  }

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v5 = _os_log_pack_size();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136315138;
    *(void *)(v6 + 4) = "-[__NSFrozenDictionaryM keysOfEntriesWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[__NSFrozenDictionaryM keysOfEntriesWithOptions:passingTest:]");
    size_t v7 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v5);
    objc_exception_throw(v7);
  }

  return mdict_keysOfEntriesWithOptionsPassingTest((uint64_t *)&self->storage, a3, (uint64_t)a4);
}

- (id)objectForKeyedSubscript:(id)a3
{
  unint64_t mutations = self->storage.var0.var0.mutations;
  if (!(mutations >> 58)) {
    return 0LL;
  }
  unint64_t v5 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  buffer = self->storage.buffer;
  unint64_t v7 = [a3 hash] % v5;
  uint64_t v8 = v5 <= 1 ? 1LL : v5;
  unint64_t v9 = v5;
  while (1)
  {
    BOOL v10 = buffer[v7];
    if (!v10) {
      break;
    }
    if (v10 == (state *)&___NSDictionaryM_DeletedMarker)
    {
      if (v9 == v5) {
        unint64_t v9 = v7;
      }
    }

    else if (v10 == a3 || (-[state isEqual:](v10, "isEqual:", a3) & 1) != 0)
    {
      unint64_t v9 = v7;
      goto LABEL_21;
    }

    if (v7 + 1 >= v5) {
      unint64_t v11 = v5;
    }
    else {
      unint64_t v11 = 0LL;
    }
    unint64_t v7 = v7 + 1 - v11;
    if (!--v8) {
      goto LABEL_21;
    }
  }

  if (v9 == v5) {
    unint64_t v9 = v7;
  }
LABEL_21:
  if (v9 < v5) {
    return *(&buffer[v5] + v9);
  }
  else {
    return 0LL;
  }
}

- (void)dealloc
{
}

- (id)mutableCopy
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    uint64_t v6 = _cow_create((uint64_t)self, 0);
    while (!__ldaxr(p_cow))
    {
    }

    __clrex();
    free(v6);
  }

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    unint64_t v7 = _cow_create((uint64_t)self, 0);
    while (!__ldaxr(p_cow))
    {
    }

    __clrex();
    free(v7);
  }

@end