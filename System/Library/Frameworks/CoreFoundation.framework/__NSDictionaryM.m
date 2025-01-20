@interface __NSDictionaryM
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (double)_clumpingFactor;
- (double)_clumpingInterestingThreshold;
- (id)_cfMutableCopy;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
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
- (void)__setObject:(id)a3 forKey:(id)a4;
- (void)_mutate;
- (void)dealloc;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
- (void)removeAllObjects;
- (void)removeEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setObservationInfo:(void *)a3;
@end

@implementation __NSDictionaryM

- (unint64_t)count
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  return self->storage.var0.var1.other & 0x1FFFFFF;
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  v25[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
  }
  unint64_t v10 = a5 >> 61;
  if (a3 && v10 || a4 && v10)
  {
    uint64_t v20 = _os_log_pack_size();
    v22 = (char *)v25 - ((MEMORY[0x1895F8858](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v23 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v23 = 136315394;
    *(void *)(v23 + 4) = "-[__NSDictionaryM getObjects:andKeys:count:]";
    *(_WORD *)(v23 + 12) = 2048;
    *(void *)(v23 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSDictionaryM getObjects:andKeys:count:]",  a5);
    v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v22,  v20);
    objc_exception_throw(v24);
  }

  unint64_t mutations = self->storage.var0.var0.mutations;
  unint64_t v12 = mutations >> 58;
  unint64_t v13 = HIDWORD(mutations) & 0x1FFFFFF;
  if (v13 >= a5) {
    unint64_t v13 = a5;
  }
  if (v12) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    unint64_t v15 = 0LL;
    unint64_t v16 = LODWORD(__NSDictionarySizes_0[v12]);
    buffer = self->storage.buffer;
    do
    {
      v18 = buffer[v15];
      if (v18) {
        BOOL v19 = v18 == (state *)&___NSDictionaryM_DeletedMarker;
      }
      else {
        BOOL v19 = 1;
      }
      if (!v19)
      {
        if (a4) {
          *a4++ = v18;
        }
        if (a3) {
          *a3++ = *(&buffer[v16] + v15);
        }
        --v13;
      }

      ++v15;
    }

    while (v15 < v16 && v13);
  }

- (id)keyEnumerator
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
  }
  return (id)[objc_allocWithZone((Class)__NSFastEnumerationEnumerator) initWithObject:self];
}

- (id)objectForKey:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  p_storage = &self->storage;
  unint64_t mutations = self->storage.var0.var0.mutations;
  if (!(mutations >> 58)) {
    return 0LL;
  }
  unint64_t v8 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  buffer = p_storage->buffer;
  unint64_t v10 = [a3 hash] % v8;
  uint64_t v11 = v8 <= 1 ? 1LL : v8;
  unint64_t v12 = v8;
  while (1)
  {
    unint64_t v13 = buffer[v10];
    if (!v13) {
      break;
    }
    if (v13 == (state *)&___NSDictionaryM_DeletedMarker)
    {
      if (v12 == v8) {
        unint64_t v12 = v10;
      }
    }

    else if (v13 == a3 || (-[state isEqual:](v13, "isEqual:", a3) & 1) != 0)
    {
      unint64_t v12 = v10;
      goto LABEL_23;
    }

    if (v10 + 1 >= v8) {
      unint64_t v14 = v8;
    }
    else {
      unint64_t v14 = 0LL;
    }
    unint64_t v10 = v10 + 1 - v14;
    if (!--v11) {
      goto LABEL_23;
    }
  }

  if (v12 == v8) {
    unint64_t v12 = v10;
  }
LABEL_23:
  if (v12 < v8) {
    return *(&buffer[v8] + v12);
  }
  else {
    return 0LL;
  }
}

- (void)removeObjectForKey:(id)a3
{
  v15[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  uint64_t v6 = atomic_load((unint64_t *)&self->cow);
  unint64_t mutations = self->storage.var0.var0.mutations;
  else {
    uint64_t v8 = 0LL;
  }
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v6);
    if (!*(_WORD *)(v6 + 6)) {
      -[__NSDictionaryM removeObjectForKey:].cold.1();
    }
    if (*(_WORD *)(v6 + 6) != 1 || *(_WORD *)(v6 + 4) != 0)
    {
      --*(_WORD *)(v6 + 6);
      _cow_mutate_slow((uint64_t)self, v6, (uint64_t)__NSDictionary_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v6);
    unint64_t mutations = self->storage.var0.var0.mutations;
  }

  self->storage.var0.var0.unint64_t mutations = mutations & 0xFFFFFFFF80000000LL | v8;
  if (!a3)
  {
    uint64_t v10 = _os_log_pack_size();
    unint64_t v12 = (char *)v15 - ((MEMORY[0x1895F8858](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[__NSDictionaryM removeObjectForKey:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: key cannot be nil",  "-[__NSDictionaryM removeObjectForKey:]");
    unint64_t v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v10);
    objc_exception_throw(v14);
  }

  mdict_removeObjectForKey((uint64_t *)self, a3);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v5 = a4;
  v44 = (unint64_t *)self;
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_61:
    uint64_t v5 = (void *)_os_log_pack_size();
    v34 = (char *)&v42 - ((MEMORY[0x1895F8858](v5, v33) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v35 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v35 = 136315138;
    *(void *)(v35 + 4) = "-[__NSDictionaryM setObject:forKey:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: key cannot be nil",  "-[__NSDictionaryM setObject:forKey:]");
    v36 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v34,  v5);
    objc_exception_throw(v36);
LABEL_62:
    uint64_t v37 = _os_log_pack_size();
    v39 = (char *)&v42 - ((MEMORY[0x1895F8858](v37, v38) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v40 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v40 = 136315394;
    *(void *)(v40 + 4) = "-[__NSDictionaryM setObject:forKey:]";
    *(_WORD *)(v40 + 12) = 2112;
    *(void *)(v40 + 14) = v5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil (key: %@)",  "-[__NSDictionaryM setObject:forKey:]",  v5);
    v41 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v39,  v37);
    objc_exception_throw(v41);
  }

  __cf_tsanWriteFunction(v44, v4, __CFTSANTagMutableDictionary);
  if (!v5) {
    goto LABEL_61;
  }
LABEL_3:
  if (!a3) {
    goto LABEL_62;
  }
  v7 = v44;
  uint64_t v8 = atomic_load(v44 + 3);
  v9 = (uint64_t *)(v7 + 1);
  unint64_t v10 = v7[2];
  else {
    uint64_t v11 = 0LL;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSDictionaryM setObject:forKey:].cold.1();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)v44, v8, (uint64_t)__NSDictionary_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v8);
    unint64_t v10 = v9[1];
  }

  v9[1] = v10 & 0xFFFFFFFF80000000LL | v11;
  unint64_t v13 = v10 >> 58;
  if (v10 >> 58)
  {
    LODWORD(v14) = __NSDictionarySizes_0[v13];
    goto LABEL_17;
  }

  v9[1] = v10 & 0x3FFFFFF80000000LL | v11 & 0x3FFFFFFFFFFFFFFLL | 0x400000000000000LL;
  v32 = calloc(1uLL, 0x30uLL);
  if (!v32)
  {
    __break(1u);
    return;
  }

  uint64_t *v9 = (uint64_t)v32;
  LODWORD(v13) = 1;
  LODWORD(v14) = 3;
  if (((unint64_t)a3 & 0x8000000000000000LL) == 0) {
LABEL_17:
  }
    id v15 = a3;
LABEL_18:
  uint64_t v16 = v9[1];
  id v42 = a3;
  uint64_t v43 = v16;
  while (1)
  {
    uint64_t v17 = *v9;
    unint64_t v18 = v14;
    unint64_t v19 = objc_msgSend(v5, "hash", v42);
    unint64_t v20 = 0LL;
    if ((_DWORD)v14)
    {
      unint64_t v21 = v19 % v14;
      uint64_t v22 = v14;
      unint64_t v14 = v14;
      while (1)
      {
        uint64_t v23 = *(void **)(v17 + 8 * v21);
        if (!v23) {
          break;
        }
        if (v23 == &___NSDictionaryM_DeletedMarker)
        {
          ++v20;
          if (v14 == v18) {
            unint64_t v14 = v21;
          }
        }

        else if (v23 == v5 || ([v23 isEqual:v5] & 1) != 0)
        {
          unint64_t v14 = v21;
          goto LABEL_37;
        }

        if (v21 + 1 >= v18) {
          unint64_t v24 = v18;
        }
        else {
          unint64_t v24 = 0LL;
        }
        unint64_t v21 = v21 + 1 - v24;
        if (!--v22) {
          goto LABEL_37;
        }
      }

      if (v14 == v18) {
        unint64_t v14 = v21;
      }
    }

    else
    {
      unint64_t v14 = 0LL;
    }

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  v44 = (unint64_t *)self;
  uint64_t v45 = *MEMORY[0x1895F89C0];
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_66:
    uint64_t v35 = _os_log_pack_size();
    uint64_t v37 = (char *)&v40 - ((MEMORY[0x1895F8858](v35, v36) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v38 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v38 = 136315138;
    *(void *)(v38 + 4) = "-[__NSDictionaryM setObject:forKeyedSubscript:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: key cannot be nil",  "-[__NSDictionaryM setObject:forKeyedSubscript:]");
    v39 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v37,  v35);
    objc_exception_throw(v39);
  }

  __cf_tsanWriteFunction(v44, v4, __CFTSANTagMutableDictionary);
  if (!a4) {
    goto LABEL_66;
  }
LABEL_3:
  v7 = v44;
  uint64_t v8 = atomic_load(v44 + 3);
  v9 = (uint64_t *)(v7 + 1);
  unint64_t v10 = v7[2];
  else {
    uint64_t v11 = 0LL;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSDictionaryM setObject:forKeyedSubscript:].cold.1();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)v44, v8, (uint64_t)__NSDictionary_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v8);
    unint64_t v10 = v9[1];
  }

  v9[1] = v10 & 0xFFFFFFFF80000000LL | v11;
  if (!a3)
  {
    mdict_removeObjectForKey((uint64_t *)v44, a4);
    return;
  }

  unint64_t v13 = v10 >> 58;
  if (v10 >> 58)
  {
    LODWORD(v14) = __NSDictionarySizes_0[v13];
  }

  else
  {
    v9[1] = v10 & 0x3FFFFFF80000000LL | v11 & 0x3FFFFFFFFFFFFFFLL | 0x400000000000000LL;
    id v15 = calloc(1uLL, 0x30uLL);
    if (!v15)
    {
      __break(1u);
      return;
    }

    uint64_t *v9 = (uint64_t)v15;
    LODWORD(v13) = 1;
    LODWORD(v14) = 3;
  }

  unint64_t v41 = v10;
  uint64_t v17 = v9[1];
  id v42 = a3;
  uint64_t v43 = v17;
  while (1)
  {
    uint64_t v18 = *v9;
    unint64_t v19 = v14;
    unint64_t v20 = [a4 hash];
    unint64_t v21 = 0LL;
    if ((_DWORD)v14)
    {
      unint64_t v22 = v20 % v14;
      uint64_t v23 = v14;
      unint64_t v14 = v14;
      while (1)
      {
        id v24 = *(id *)(v18 + 8 * v22);
        if (!v24) {
          break;
        }
        if (v24 == &___NSDictionaryM_DeletedMarker)
        {
          ++v21;
          if (v14 == v19) {
            unint64_t v14 = v22;
          }
        }

        else if (v24 == a4 || ([v24 isEqual:a4] & 1) != 0)
        {
          unint64_t v14 = v22;
          goto LABEL_41;
        }

        if (v22 + 1 >= v19) {
          unint64_t v25 = v19;
        }
        else {
          unint64_t v25 = 0LL;
        }
        unint64_t v22 = v22 + 1 - v25;
        if (!--v23) {
          goto LABEL_41;
        }
      }

      if (v14 == v19) {
        unint64_t v14 = v22;
      }
    }

    else
    {
      unint64_t v14 = 0LL;
    }

- (void)__setObject:(id)a3 forKey:(id)a4
{
  uint64_t v79 = *MEMORY[0x1895F89C0];
  v78 = (unint64_t *)self;
  -[__NSDictionaryM _mutate](self, "_mutate");
  if (!__cf_tsanWriteFunction)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_115:
    a4 = (id)_os_log_pack_size();
    v64 = (char *)&v74 - ((MEMORY[0x1895F8858](a4, v63) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v65 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v65 = 136315138;
    *(void *)(v65 + 4) = "-[__NSDictionaryM __setObject:forKey:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: key cannot be nil",  "-[__NSDictionaryM __setObject:forKey:]");
    v66 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v64,  a4);
    objc_exception_throw(v66);
LABEL_116:
    uint64_t v67 = _os_log_pack_size();
    v69 = (char *)&v74 - ((MEMORY[0x1895F8858](v67, v68) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v70 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v70 = 136315394;
    *(void *)(v70 + 4) = "-[__NSDictionaryM __setObject:forKey:]";
    *(_WORD *)(v70 + 12) = 2112;
    *(void *)(v70 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: object cannot be nil (key: %@)",  "-[__NSDictionaryM __setObject:forKey:]",  a4);
    v71 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v69,  v67);
    objc_exception_throw(v71);
  }

  __cf_tsanWriteFunction(v78, v4, __CFTSANTagMutableDictionary);
  if (!a4) {
    goto LABEL_115;
  }
LABEL_3:
  if (!a3) {
    goto LABEL_116;
  }
  v7 = v78;
  uint64_t v8 = atomic_load(v78 + 3);
  v9 = (uint64_t *)(v7 + 1);
  unint64_t v10 = v7[2];
  else {
    uint64_t v11 = 0LL;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSDictionaryM __setObject:forKey:].cold.1();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)v78, v8, (uint64_t)__NSDictionary_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v8);
    unint64_t v10 = v9[1];
  }

  unint64_t v13 = v10 & 0xFFFFFFFF80000000LL | v11;
  v9[1] = v13;
  id v76 = a3;
  if ((v10 & 0x80000000) == 0) {
    goto LABEL_18;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    unint64_t v13 = v9[1];
LABEL_18:
    unint64_t v20 = v13 >> 58;
    if (v13 >> 58)
    {
      unsigned int v21 = __NSDictionarySizes_0[v20];
      goto LABEL_22;
    }

    v9[1] = v13 & 0x3FFFFFFFFFFFFFFLL | 0x400000000000000LL;
    unint64_t v22 = calloc(1uLL, 0x30uLL);
    if (v22)
    {
      uint64_t *v9 = (uint64_t)v22;
      LODWORD(v20) = 1;
      unsigned int v21 = 3;
LABEL_22:
      unint64_t v75 = v13;
      uint64_t v77 = v9[1];
      while (1)
      {
        uint64_t v24 = *v9;
        unint64_t v25 = [a4 hash];
        unint64_t v26 = 0LL;
        if (v21)
        {
          unint64_t v27 = v25 % v21;
          uint64_t v28 = v21;
          unint64_t v29 = v21;
          while (1)
          {
            id v30 = *(id *)(v24 + 8 * v27);
            if (!v30) {
              break;
            }
            if (v30 == &___NSDictionaryM_DeletedMarker)
            {
              ++v26;
              if (v29 == v21) {
                unint64_t v29 = v27;
              }
            }

            else if (v30 == a4 || ([v30 isEqual:a4] & 1) != 0)
            {
              unint64_t v29 = v27;
              goto LABEL_43;
            }

            if (v27 + 1 >= v21) {
              uint64_t v31 = v21;
            }
            else {
              uint64_t v31 = 0LL;
            }
            unint64_t v27 = v27 + 1 - v31;
            if (!--v28) {
              goto LABEL_43;
            }
          }

          if (v29 == v21) {
            unint64_t v29 = v27;
          }
        }

        else
        {
          unint64_t v29 = 0LL;
        }

- (void)_mutate
{
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)setObservationInfo:(void *)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  uint64_t v6 = atomic_load((unint64_t *)&self->cow);
  unint64_t mutations = self->storage.var0.var0.mutations;
  unint64_t v8 = mutations;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v6);
    if (!*(_WORD *)(v6 + 6)) {
      -[__NSDictionaryM setObservationInfo:].cold.1();
    }
    if (*(_WORD *)(v6 + 6) != 1 || *(_WORD *)(v6 + 4) != 0)
    {
      --*(_WORD *)(v6 + 6);
      _cow_mutate_slow((uint64_t)self, v6, (uint64_t)__NSDictionary_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v6);
    unint64_t v8 = self->storage.var0.var0.mutations;
  }

  else {
    uint64_t v10 = 0LL;
  }
  self->storage.var0.var0.unint64_t mutations = v10 | ((unint64_t)(a3 != 0LL) << 57) | v8 & 0xFDFFFFFF80000000LL;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS_____NSDictionaryM;
  -[__NSDictionaryM setObservationInfo:](&v11, sel_setObservationInfo_, a3);
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
    objc_super v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v11);
    -[__NSDictionaryM countByEnumeratingWithState:objects:count:](v12, v13, v14, v15, v16);
  }

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v23[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableDictionary);
    if (a4) {
      goto LABEL_4;
    }
  }

  else if (a4)
  {
    goto LABEL_4;
  }

  if (a5)
  {
    uint64_t v16 = _os_log_pack_size();
    uint64_t v18 = (char *)v23 - ((MEMORY[0x1895F8858](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315394;
    *(void *)(v19 + 4) = "-[__NSDictionaryM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v19 + 12) = 2048;
    *(void *)(v19 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSDictionaryM countByEnumeratingWithState:objects:count:]",  a5);
    goto LABEL_23;
  }

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v6 = a3;
  v21[7] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
    if (a4) {
      goto LABEL_3;
    }
LABEL_14:
    uint64_t v15 = _os_log_pack_size();
    uint64_t v17 = &v20[-((MEMORY[0x1895F8858](v15, v16) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315138;
    *(void *)(v18 + 4) = "-[__NSDictionaryM enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[__NSDictionaryM enumerateKeysAndObjectsWithOptions:usingBlock:]");
    uint64_t v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v17,  v15);
    objc_exception_throw(v19);
  }

  if (!a4) {
    goto LABEL_14;
  }
LABEL_3:
  buffer = self->storage.buffer;
  unint64_t mutations = self->storage.var0.var0.mutations;
  size_t v10 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __mdict_enumerateKeysAndObjectsWithOptionsUsingBlock_block_invoke;
  v21[3] = &unk_1899EEAB0;
  v21[4] = a4;
  v21[5] = buffer;
  v21[6] = &buffer[v10];
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v6, 0, v10, (uint64_t)v21) & 1) == 0)
  {
    v20[15] = 0;
    if (mutations >> 58)
    {
      size_t v11 = 0LL;
      do
      {
        uint64_t v12 = buffer[v11];
        if (v12) {
          BOOL v13 = v12 == (state *)&___NSDictionaryM_DeletedMarker;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          uint64_t v14 = (void *)_CFAutoreleasePoolPush();
          __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v14);
        }

        ++v11;
      }

      while (v11 < v10);
    }
  }

- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  char v6 = a3;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  buffer = self->storage.buffer;
  unint64_t mutations = self->storage.var0.var0.mutations;
  size_t v10 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  uint64_t v23 = 0LL;
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __mdict_keyOfEntryWithOptionsPassingTest_block_invoke;
  v19[3] = &unk_1899EEAD8;
  v19[6] = buffer;
  v19[7] = &buffer[v10];
  v19[4] = a4;
  v19[5] = &v20;
  if (__NSCollectionHandleConcurrentEnumerationIfSpecified(v6, 0, v10, (uint64_t)v19))
  {
    size_t v11 = (state *)atomic_load((unint64_t *)v21 + 3);
  }

  else
  {
    char v18 = 0;
    size_t v11 = 0LL;
    if (mutations >> 58)
    {
      if (v10 <= 1) {
        uint64_t v12 = 1LL;
      }
      else {
        uint64_t v12 = v10;
      }
      do
      {
        BOOL v13 = *buffer;
        if (*buffer) {
          BOOL v14 = v13 == (state *)&___NSDictionaryM_DeletedMarker;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14)
        {
          uint64_t v15 = buffer[v10];
          uint64_t v16 = (void *)_CFAutoreleasePoolPush();
          if ((*((unsigned int (**)(id, state *, state *, char *))a4 + 2))(a4, v13, v15, &v18))
          {
            char v18 = 1;
            size_t v11 = v13;
          }

          _CFAutoreleasePoolPop(v16);
          if (v18) {
            break;
          }
        }

        ++buffer;
        --v12;
      }

      while (v12);
    }
  }

  _Block_object_dispose(&v20, 8);
  return v11;
}

- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  char v6 = a3;
  v12[1] = *MEMORY[0x1895F89C0];
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableDictionary);
    if (a4) {
      return mdict_keysOfEntriesWithOptionsPassingTest((uint64_t *)&self->storage, v6, (uint64_t)a4);
    }
LABEL_5:
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = "-[__NSDictionaryM keysOfEntriesWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[__NSDictionaryM keysOfEntriesWithOptions:passingTest:]");
    size_t v11 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v9);
    objc_exception_throw(v11);
  }

  if (!a4) {
    goto LABEL_5;
  }
  return mdict_keysOfEntriesWithOptionsPassingTest((uint64_t *)&self->storage, v6, (uint64_t)a4);
}

- (id)objectForKeyedSubscript:(id)a3
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
  }
  p_storage = &self->storage;
  unint64_t mutations = self->storage.var0.var0.mutations;
  if (!(mutations >> 58)) {
    return 0LL;
  }
  unint64_t v8 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  buffer = p_storage->buffer;
  unint64_t v10 = [a3 hash] % v8;
  uint64_t v11 = v8 <= 1 ? 1LL : v8;
  unint64_t v12 = v8;
  while (1)
  {
    BOOL v13 = buffer[v10];
    if (!v13) {
      break;
    }
    if (v13 == (state *)&___NSDictionaryM_DeletedMarker)
    {
      if (v12 == v8) {
        unint64_t v12 = v10;
      }
    }

    else if (v13 == a3 || (-[state isEqual:](v13, "isEqual:", a3) & 1) != 0)
    {
      unint64_t v12 = v10;
      goto LABEL_23;
    }

    if (v10 + 1 >= v8) {
      unint64_t v14 = v8;
    }
    else {
      unint64_t v14 = 0LL;
    }
    unint64_t v10 = v10 + 1 - v14;
    if (!--v11) {
      goto LABEL_23;
    }
  }

  if (v12 == v8) {
    unint64_t v12 = v10;
  }
LABEL_23:
  if (v12 < v8) {
    return *(&buffer[v8] + v12);
  }
  else {
    return 0LL;
  }
}

- (void)removeEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (__cf_tsanWriteFunction) {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableDictionary);
  }
  uint64_t v8 = atomic_load((unint64_t *)&self->cow);
  unint64_t mutations = self->storage.var0.var0.mutations;
  else {
    uint64_t v10 = 0LL;
  }
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6)) {
      -[__NSDictionaryM removeEntriesWithOptions:passingTest:].cold.1();
    }
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSDictionary_cowCallbacks);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)v8);
    unint64_t mutations = self->storage.var0.var0.mutations;
  }

  self->storage.var0.var0.unint64_t mutations = mutations & 0xFFFFFFFF80000000LL | v10;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v12 = -[__NSDictionaryM keysOfEntriesWithOptions:passingTest:](self, "keysOfEntriesWithOptions:passingTest:", a3, a4);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        -[__NSDictionaryM removeObjectForKey:](self, "removeObjectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * i));
      }

      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }

    while (v14);
  }

- (void)removeAllObjects
{
}

- (void)dealloc
{
}

- (id)copy
{
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
    }
  }

  if (!-[__NSDictionaryM count](self, "count")) {
    return &__NSDictionary0__struct;
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

- (id)copyWithZone:(_NSZone *)a3
{
  if (__cf_tsanReadFunction)
  {
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
    if (__cf_tsanReadFunction) {
      __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
    }
  }

  if (!-[__NSDictionaryM count](self, "count", a3)) {
    return &__NSDictionary0__struct;
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
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableDictionary);
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
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableDictionary);
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

- (id)_cfMutableCopy
{
  id result = -[__NSDictionaryM mutableCopyWithZone:](self, "mutableCopyWithZone:", 0LL);
  *((void *)result + 2) = *((void *)result + 2) & 0xFFFFFFFF7FFFFFFFLL | (((self->storage.var0.var0.mutations >> 31) & 1) << 31);
  return result;
}

- (double)_clumpingFactor
{
  v24[1] = *MEMORY[0x1895F89C0];
  unint64_t mutations = self->storage.var0.var0.mutations;
  size_t v4 = HIDWORD(mutations) & 0x1FFFFFF;
  if ((mutations & 0x1FFFFFE00000000LL) != 0) {
    uint64_t v5 = HIDWORD(mutations) & 0x1FFFFFF;
  }
  else {
    uint64_t v5 = 1LL;
  }
  unint64_t v6 = MEMORY[0x1895F8858](v5, a2);
  uint64_t v8 = (char *)v24 - v7;
  unint64_t v10 = *(unsigned int *)((char *)__NSDictionarySizes_0 + ((v9 >> 55) & 0x1F8));
  if (v4 >= 0x101)
  {
    uint64_t v8 = (char *)_CFCreateArrayStorage(v6, 0, v24);
    uint64_t v11 = v8;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  -[__NSDictionaryM getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0LL, v8, v4);
  double v12 = 0.0;
  if (v4 >= 2)
  {
    uint64_t v13 = 8 * v4;
    uint64_t v14 = (uint64_t *)malloc(8 * v4 + 8);
    unint64_t v15 = 0LL;
    do
    {
      v14[v15 / 8] = [*(id *)&v8[v15] hash] % v10;
      v15 += 8LL;
    }

    while (v13 != v15);
    qsort(v14, v4, 8uLL, (int (__cdecl *)(const void *, const void *))_compare_clumpiness_2);
    unint64_t v16 = 0LL;
    uint64_t v17 = *v14;
    v14[v4] = *v14 + v10;
    double v18 = (double)v10 / (double)v4;
    double v19 = 0.0;
    do
    {
      uint64_t v20 = v14[v16 / 8 + 1];
      unint64_t v21 = v20 - v17;
      else {
        double v22 = v18 - (double)v21;
      }
      double v19 = v19 + v22 * v22;
      v16 += 8LL;
      uint64_t v17 = v20;
    }

    while (v13 != v16);
    free(v14);
    double v12 = v19 * (double)v4 * (double)v4 / ((double)v10 * (double)v10) / ((double)v4 + -1.0);
  }

  free(v11);
  return v12;
}

- (double)_clumpingInterestingThreshold
{
  unint64_t mutations = self->storage.var0.var0.mutations;
  double v3 = (double)*(unsigned int *)((char *)&__NSDictionarySizes_0 + ((mutations >> 55) & 0x1F8));
  return 1.0
       - ((double)(HIDWORD(mutations) & 0x1FFFFFF) + (double)(HIDWORD(mutations) & 0x1FFFFFF)) / v3
       + (double)(HIDWORD(mutations) & 0x1FFFFFF) * (double)(HIDWORD(mutations) & 0x1FFFFFF) / v3 / v3;
}

- (void)removeObjectForKey:.cold.1()
{
}

- (void)setObject:forKey:.cold.1()
{
}

- (void)setObject:forKeyedSubscript:.cold.1()
{
}

- (void)__setObject:forKey:.cold.1()
{
}

- (void)setObservationInfo:.cold.1()
{
}

- (void)removeEntriesWithOptions:passingTest:.cold.1()
{
}

@end