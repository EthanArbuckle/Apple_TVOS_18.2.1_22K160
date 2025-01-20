@interface __NSFrozenSetM
- (BOOL)containsObject:(id)a3;
- (double)clumpingFactor;
- (double)clumpingInterestingThreshold;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)countForObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 count:(unint64_t)a4;
@end

@implementation __NSFrozenSetM

- (unint64_t)count
{
  return *((_DWORD *)&self->storage.var0.var0 + 1) & 0x3FFFFFF;
}

- (id)member:(id)a3
{
  p_storage = &self->storage;
  unint64_t v4 = *((unsigned int *)&self->storage.var0.var0 + 1);
  unint64_t v6 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v4 >> 23) & 0x1F8));
  objs = p_storage->objs;
  unint64_t v8 = [a3 hash] % v6;
  uint64_t v9 = v6 <= 1 ? 1LL : v6;
  unint64_t v10 = v6;
  while (1)
  {
    v11 = objs[v8];
    if (!v11) {
      break;
    }
    if (v11 == (state *)&___NSSetM_DeletedMarker)
    {
      if (v10 == v6) {
        unint64_t v10 = v8;
      }
    }

    else if (v11 == a3 || (-[state isEqual:](v11, "isEqual:", a3) & 1) != 0)
    {
      unint64_t v10 = v8;
      goto LABEL_21;
    }

    if (v8 + 1 >= v6) {
      unint64_t v12 = v6;
    }
    else {
      unint64_t v12 = 0LL;
    }
    unint64_t v8 = v8 + 1 - v12;
    if (!--v9) {
      goto LABEL_21;
    }
  }

  if (v10 == v6) {
    unint64_t v10 = v8;
  }
LABEL_21:
  if (v10 >= v6) {
    return 0LL;
  }
  if ((_UNKNOWN *)p_storage->objs[v10] == &___NSSetM_DeletedMarker) {
    return 0LL;
  }
  return p_storage->objs[v10];
}

- (BOOL)containsObject:(id)a3
{
  p_storage = &self->storage;
  unint64_t v4 = *((unsigned int *)&self->storage.var0.var0 + 1);
  unint64_t v6 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v4 >> 23) & 0x1F8));
  objs = p_storage->objs;
  unint64_t v8 = [a3 hash] % v6;
  uint64_t v9 = v6 <= 1 ? 1LL : v6;
  unint64_t v10 = v6;
  while (1)
  {
    v11 = objs[v8];
    if (!v11) {
      break;
    }
    if (v11 == (state *)&___NSSetM_DeletedMarker)
    {
      if (v10 == v6) {
        unint64_t v10 = v8;
      }
    }

    else if (v11 == a3 || (-[state isEqual:](v11, "isEqual:", a3) & 1) != 0)
    {
      unint64_t v10 = v8;
      goto LABEL_21;
    }

    if (v8 + 1 >= v6) {
      unint64_t v12 = v6;
    }
    else {
      unint64_t v12 = 0LL;
    }
    unint64_t v8 = v8 + 1 - v12;
    if (!--v9) {
      goto LABEL_21;
    }
  }

  if (v10 == v6) {
    unint64_t v10 = v8;
  }
LABEL_21:
  if (v10 >= v6) {
    return 0;
  }
  v13 = p_storage->objs[v10];
  return v13 != (state *)&___NSSetM_DeletedMarker && v13 != 0LL;
}

- (unint64_t)countForObject:(id)a3
{
  p_storage = &self->storage;
  unint64_t v4 = *((unsigned int *)&self->storage.var0.var0 + 1);
  unint64_t v6 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v4 >> 23) & 0x1F8));
  objs = p_storage->objs;
  unint64_t v8 = [a3 hash] % v6;
  uint64_t v9 = v6 <= 1 ? 1LL : v6;
  unint64_t v10 = v6;
  while (1)
  {
    v11 = objs[v8];
    if (!v11) {
      break;
    }
    if (v11 == (state *)&___NSSetM_DeletedMarker)
    {
      if (v10 == v6) {
        unint64_t v10 = v8;
      }
    }

    else if (v11 == a3 || (-[state isEqual:](v11, "isEqual:", a3) & 1) != 0)
    {
      unint64_t v10 = v8;
      goto LABEL_21;
    }

    if (v8 + 1 >= v6) {
      unint64_t v12 = v6;
    }
    else {
      unint64_t v12 = 0LL;
    }
    unint64_t v8 = v8 + 1 - v12;
    if (!--v9) {
      goto LABEL_21;
    }
  }

  if (v10 == v6) {
    unint64_t v10 = v8;
  }
LABEL_21:
  if (v10 >= v6) {
    return 0LL;
  }
  v13 = p_storage->objs[v10];
  return v13 != (state *)&___NSSetM_DeletedMarker && v13 != 0LL;
}

- (id)objectEnumerator
{
  if (__cf_tsanReadFunction) {
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableSet);
  }
  return (id)[objc_allocWithZone((Class)__NSFastEnumerationEnumerator) initWithObject:self];
}

- (double)clumpingFactor
{
  v24[1] = *MEMORY[0x1895F89C0];
  int v3 = *((_DWORD *)&self->storage.var0.var0 + 1);
  size_t v4 = v3 & 0x3FFFFFF;
  if ((v3 & 0x3FFFFFF) != 0) {
    uint64_t v5 = v3 & 0x3FFFFFF;
  }
  else {
    uint64_t v5 = 1LL;
  }
  unint64_t v6 = MEMORY[0x1895F8858](v5, a2);
  unint64_t v8 = (char *)v24 - v7;
  unint64_t v10 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v9 >> 23) & 0x1F8));
  if (v4 >= 0x101)
  {
    unint64_t v8 = (char *)_CFCreateArrayStorage(v6, 0, v24);
    v11 = v8;
  }

  else
  {
    v11 = 0LL;
  }

  -[__NSFrozenSetM getObjects:count:](self, "getObjects:count:", v8, v4);
  double v12 = 0.0;
  if (v4 >= 2)
  {
    uint64_t v13 = 8 * v4;
    v14 = (uint64_t *)malloc(8 * v4 + 8);
    unint64_t v15 = 0LL;
    do
    {
      v14[v15 / 8] = [*(id *)&v8[v15] hash] % v10;
      v15 += 8LL;
    }

    while (v13 != v15);
    qsort(v14, v4, 8uLL, (int (__cdecl *)(const void *, const void *))_compare_clumpiness_1);
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
    double v12 = v19
        * (double)v4
        * (double)v4
        / ((double)v10
  }

  free(v11);
  return v12;
}

- (double)clumpingInterestingThreshold
{
  unint64_t v2 = *((unsigned int *)&self->storage.var0.var0 + 1);
  double v3 = (double)*(unsigned int *)((char *)&__NSSetSizes_0 + ((v2 >> 23) & 0x1F8));
  return 1.0
       - ((double)(v2 & 0x3FFFFFF) + (double)(v2 & 0x3FFFFFF)) / v3
       + (double)(v2 & 0x3FFFFFF) * (double)(v2 & 0x3FFFFFF) / v3 / v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5)
  {
    uint64_t v12 = _os_log_pack_size();
    v14 = (char *)v20 - ((MEMORY[0x1895F8858](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[__NSFrozenSetM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSFrozenSetM countByEnumeratingWithState:objects:count:]",  a5);
    goto LABEL_20;
  }

  if (a5 >> 61)
  {
    uint64_t v12 = _os_log_pack_size();
    v14 = (char *)v20 - ((MEMORY[0x1895F8858](v12, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "-[__NSFrozenSetM countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSFrozenSetM countByEnumeratingWithState:objects:count:]",  a5);
LABEL_20:
    double v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v14,  v12);
    objc_exception_throw(v19);
  }

  p_storage = &self->storage;
  unint64_t var0 = a3->var0;
  unint64_t v7 = *(unsigned int *)((char *)__NSSetSizes_0
                       + (((unint64_t)*((unsigned int *)&self->storage.var0.var0 + 1) >> 23) & 0x1F8));
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&mset_countByEnumeratingWithStateObjectsCount_const_mu;
  }
  if (var0 >= v7) {
    return 0LL;
  }
  a3->var1 = a4;
  unint64_t result = 0LL;
  if (a5)
  {
    do
    {
      unint64_t v9 = p_storage->objs[var0];
      if (v9) {
        BOOL v10 = v9 == (state *)&___NSSetM_DeletedMarker;
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10) {
        a4[result++] = v9;
      }
      ++var0;
    }

    while (var0 < v7 && result < a5);
  }

  a3->unint64_t var0 = var0;
  return result;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v17[6] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v13 = &v16[-((MEMORY[0x1895F8858](v11, v12) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = "-[__NSFrozenSetM enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[__NSFrozenSetM enumerateObjectsWithOptions:usingBlock:]");
    uint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v13,  v11);
    objc_exception_throw(v15);
  }

  size_t v5 = *(unsigned int *)((char *)__NSSetSizes_0
                       + (((unint64_t)*((unsigned int *)&self->storage.var0.var0 + 1) >> 23) & 0x1F8));
  objs = self->storage.objs;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __mset_enumerateObjectsWithOptionsUsingBlock_block_invoke;
  v17[3] = &unk_1899EB5C0;
  v17[4] = a4;
  v17[5] = objs;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v5, (uint64_t)v17) & 1) == 0)
  {
    v16[7] = 0;
    if (v5)
    {
      for (size_t i = 0LL; i < v5; ++i)
      {
        unint64_t v8 = objs[i];
        if (v8) {
          BOOL v9 = v8 == (state *)&___NSSetM_DeletedMarker;
        }
        else {
          BOOL v9 = 1;
        }
        if (!v9)
        {
          BOOL v10 = (void *)_CFAutoreleasePoolPush();
          __NSSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v10);
        }
      }
    }
  }

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  v20[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v14 = (char *)v20 - ((MEMORY[0x1895F8858](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "mset_getObjectsCount";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "mset_getObjectsCount",  a4);
    goto LABEL_21;
  }

  if (a4 >> 61)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v14 = (char *)v20 - ((MEMORY[0x1895F8858](v12, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v18 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v18 = 136315394;
    *(void *)(v18 + 4) = "mset_getObjectsCount";
    *(_WORD *)(v18 + 12) = 2048;
    *(void *)(v18 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "mset_getObjectsCount",  a4);
LABEL_21:
    double v19 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v14,  v12);
    objc_exception_throw(v19);
  }

  unint64_t v4 = *((unsigned int *)&self->storage.var0.var0 + 1);
  int v5 = v4 & 0x3FFFFFF;
  if ((v4 & 0x3FFFFFF) >= a4) {
    int v5 = a4;
  }
  if (v5) {
    BOOL v6 = v4 >> 26 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    unint64_t v7 = 0LL;
    unint64_t v8 = *(unsigned int *)((char *)__NSSetSizes_0 + ((v4 >> 23) & 0x1F8));
    do
    {
      BOOL v9 = self->storage.objs[v7];
      if (v9) {
        BOOL v10 = v9 == (state *)&___NSSetM_DeletedMarker;
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10)
      {
        *a3++ = v9;
        --v5;
      }

      if (!v5) {
        break;
      }
      ++v7;
    }

    while (v7 < v8);
  }

- (void)dealloc
{
}

@end