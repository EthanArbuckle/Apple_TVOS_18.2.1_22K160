@interface __NSSetI
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
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

@implementation __NSSetI

- (unint64_t)count
{
  return *(void *)self->_used & 0x3FFFFFFFFFFFFFFLL;
}

- (id)member:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v3 = &v16;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3052000000LL;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  uint64_t v21 = 0LL;
  unsigned int v4 = self->_used[7];
  if (v4 < 4) {
    goto LABEL_17;
  }
  unint64_t v6 = *(void *)((char *)__NSSetSizes + ((2 * v4) & 0x1F8LL));
  v7 = (char *)self + 16;
  unint64_t v8 = [a3 hash] % v6;
  uint64_t v9 = v6 <= 1 ? 1LL : v6;
  while (1)
  {
    id v10 = *(id *)&v7[8 * v8];
    BOOL v11 = !v10 || v10 == a3;
    if (v11 || ([v10 isEqual:a3] & 1) != 0) {
      break;
    }
    if (v8 + 1 >= v6) {
      unint64_t v12 = v6;
    }
    else {
      unint64_t v12 = 0LL;
    }
    unint64_t v8 = v8 + 1 - v12;
    if (!--v9)
    {
      v3 = v17;
      goto LABEL_17;
    }
  }

  v3 = v17;
  if (v8 >= v6)
  {
LABEL_17:
    v13 = (void **)(v3 + 5);
  }

  else
  {
    v17[5] = *(void *)&v7[8 * v8];
    v13 = (void **)(v3 + 5);
  }

  v14 = *v13;
  _Block_object_dispose(&v16, 8);
  return v14;
}

- (id)objectEnumerator
{
  return (id)[objc_allocWithZone((Class)__NSFastEnumerationEnumerator) initWithObject:self];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (double)clumpingFactor
{
  v24[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)self->_used;
  if ((v3 & 0x3FFFFFFFFFFFFFELL) != 0) {
    uint64_t v4 = v3 & 0x3FFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v4 = 1LL;
  }
  unint64_t v5 = MEMORY[0x1895F8858](v4, a2);
  unint64_t v8 = (char *)v24 - v7;
  if (v6 >= 0x101)
  {
    unint64_t v8 = (char *)_CFCreateArrayStorage(v5, 0, v24);
    unint64_t v6 = *(void *)self->_used & 0x3FFFFFFFFFFFFFFLL;
    uint64_t v9 = v8;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  -[__NSSetI getObjects:count:](self, "getObjects:count:", v8, v6);
  size_t v10 = *(void *)self->_used & 0x3FFFFFFFFFFFFFFLL;
  double v11 = 0.0;
  if (v10 >= 2)
  {
    unint64_t v12 = *(void *)((char *)__NSSetSizes + ((2 * self->_used[7]) & 0x1F8LL));
    uint64_t v13 = 8 * v10;
    v14 = (uint64_t *)malloc(8 * v10 + 8);
    unint64_t v15 = 0LL;
    do
    {
      v14[v15 / 8] = [*(id *)&v8[v15] hash] % v12;
      v15 += 8LL;
    }

    while (v13 != v15);
    qsort(v14, v10, 8uLL, (int (__cdecl *)(const void *, const void *))_compare_clumpiness_0);
    unint64_t v16 = 0LL;
    uint64_t v17 = *v14;
    v14[v10] = *v14 + v12;
    double v18 = (double)v12 / (double)v10;
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
    double v11 = v19 * (double)v10 * (double)v10 / ((double)v12 * (double)v12) / ((double)v10 + -1.0);
  }

  free(v9);
  return v11;
}

- (double)clumpingInterestingThreshold
{
  double v2 = (double)*(unint64_t *)((char *)&__NSSetSizes + ((2 * self->_used[7]) & 0x1F8LL));
  return 1.0
       - ((double)(*(void *)self->_used & 0x3FFFFFFFFFFFFFFLL) + (double)(*(void *)self->_used & 0x3FFFFFFFFFFFFFFLL))
       / v2
       + (double)(*(void *)self->_used & 0x3FFFFFFFFFFFFFFLL)
       * (double)(*(void *)self->_used & 0x3FFFFFFFFFFFFFFLL)
       / v2
       / v2;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v18[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[__NSSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSSetI countByEnumeratingWithState:objects:count:]",  a5);
    goto LABEL_18;
  }

  if (a5 >> 61)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[__NSSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSSetI countByEnumeratingWithState:objects:count:]",  a5);
LABEL_18:
    uint64_t v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v13,  v12);
    objc_exception_throw(v17);
  }

  unint64_t v6 = *(void *)((char *)__NSSetSizes + ((2 * self->_used[7]) & 0x1F8LL));
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_3;
  }
  if (v6 <= var0) {
    return 0LL;
  }
  a3->var1 = a4;
  if (!a5) {
    return 0LL;
  }
  unint64_t result = 0LL;
  uint64_t v9 = (char *)self + 16;
  do
  {
    size_t v10 = *(void **)&v9[8 * var0++];
    a3->unint64_t var0 = var0;
    if (v10)
    {
      a4[result++] = v10;
      unint64_t var0 = a3->var0;
    }
  }

  while (var0 < v6 && result < a5);
  return result;
}

- (BOOL)containsObject:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v3 = &v16;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  unsigned int v4 = self->_used[7];
  if (v4 < 4) {
    goto LABEL_17;
  }
  unint64_t v6 = *(void *)((char *)__NSSetSizes + ((2 * v4) & 0x1F8LL));
  uint64_t v7 = (char *)self + 16;
  unint64_t v8 = [a3 hash] % v6;
  uint64_t v9 = v6 <= 1 ? 1LL : v6;
  while (1)
  {
    id v10 = *(id *)&v7[8 * v8];
    BOOL v11 = !v10 || v10 == a3;
    if (v11 || ([v10 isEqual:a3] & 1) != 0) {
      break;
    }
    if (v8 + 1 >= v6) {
      unint64_t v12 = v6;
    }
    else {
      unint64_t v12 = 0LL;
    }
    unint64_t v8 = v8 + 1 - v12;
    if (!--v9)
    {
      uint64_t v3 = v17;
      goto LABEL_17;
    }
  }

  uint64_t v3 = v17;
  if (v8 >= v6)
  {
LABEL_17:
    uint64_t v13 = (char *)(v3 + 3);
  }

  else
  {
    *((_BYTE *)v17 + 24) = *(void *)&v7[8 * v8] != 0LL;
    uint64_t v13 = (char *)(v3 + 3);
  }

  char v14 = *v13;
  _Block_object_dispose(&v16, 8);
  return v14;
}

- (unint64_t)countForObject:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v3 = &v16;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  unsigned int v4 = self->_used[7];
  if (v4 < 4) {
    goto LABEL_17;
  }
  unint64_t v6 = *(void *)((char *)__NSSetSizes + ((2 * v4) & 0x1F8LL));
  uint64_t v7 = (char *)self + 16;
  unint64_t v8 = [a3 hash] % v6;
  uint64_t v9 = v6 <= 1 ? 1LL : v6;
  while (1)
  {
    id v10 = *(id *)&v7[8 * v8];
    BOOL v11 = !v10 || v10 == a3;
    if (v11 || ([v10 isEqual:a3] & 1) != 0) {
      break;
    }
    if (v8 + 1 >= v6) {
      unint64_t v12 = v6;
    }
    else {
      unint64_t v12 = 0LL;
    }
    unint64_t v8 = v8 + 1 - v12;
    if (!--v9)
    {
      uint64_t v3 = v17;
      goto LABEL_17;
    }
  }

  uint64_t v3 = v17;
  if (v8 >= v6)
  {
LABEL_17:
    uint64_t v13 = (unint64_t *)(v3 + 3);
  }

  else
  {
    v17[3] = *(void *)&v7[8 * v8] != 0LL;
    uint64_t v13 = (unint64_t *)(v3 + 3);
  }

  unint64_t v14 = *v13;
  _Block_object_dispose(&v16, 8);
  return v14;
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  v17[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4)
  {
    uint64_t v11 = _os_log_pack_size();
    unint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[__NSSetI getObjects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSSetI getObjects:count:]",  a4);
    goto LABEL_18;
  }

  if (a4 >> 61)
  {
    uint64_t v11 = _os_log_pack_size();
    unint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[__NSSetI getObjects:count:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = a4;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSSetI getObjects:count:]",  a4);
LABEL_18:
    uint64_t v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
    objc_exception_throw(v16);
  }

  unsigned int v4 = self->_used[7];
  unint64_t v5 = *(void *)self->_used & 0x3FFFFFFFFFFFFFFLL;
  if (v5 >= a4) {
    unint64_t v5 = a4;
  }
  if (v4 >= 4 && v5 != 0)
  {
    unint64_t v7 = 0LL;
    unint64_t v8 = *(void *)((char *)__NSSetSizes + ((2 * v4) & 0x1F8LL));
    do
    {
      uint64_t v9 = *(void **)&self->_used[8 * v7 + 8];
      if (v9)
      {
        *a3++ = v9;
        --v5;
      }

      ++v7;
    }

    while (v7 < v8 && v5);
  }

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[__NSSetI enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[__NSSetI enumerateObjectsWithOptions:usingBlock:]");
    uint64_t v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)block - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v11);
    objc_exception_throw(v13);
  }

  char v5 = a3;
  unsigned int v7 = self->_used[7];
  size_t v8 = *(void *)((char *)__NSSetSizes + ((2 * v7) & 0x1F8LL));
  if ((a3 & 1) != 0 && __CFActiveProcessorCount() < 2) {
    char v5 = 0;
  }
  if ((v5 & 1) != 0)
  {
    v15[0] = 0LL;
    v15[1] = v15;
    v15[2] = 0x2020000000LL;
    char v16 = 0;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __51____NSSetI_enumerateObjectsWithOptions_usingBlock___block_invoke;
    block[3] = &unk_18999C0C8;
    block[5] = a4;
    block[6] = v15;
    block[4] = self;
    dispatch_apply(v8, 0LL, block);
    _Block_object_dispose(v15, 8);
  }

  else
  {
    LOBYTE(v15[0]) = 0;
    if (v7 >= 4)
    {
      size_t v9 = 0LL;
      do
      {
        if (*(void *)&self->_used[8 * v9 + 8])
        {
          id v10 = (void *)_CFAutoreleasePoolPush();
          __NSSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v10);
        }

        ++v9;
      }

      while (v9 < v8);
    }
  }

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if ((__NSSetI *)__NSSet0__ == self) {
    __break(1u);
  }
  unsigned int v3 = self->_used[7];
  unint64_t v4 = *(void *)((char *)__NSSetSizes + ((2 * v3) & 0x1F8LL));
  self->_used[7] = v3 & 3;
  *(void *)self->_used &= 0xFC00000000000000LL;
  if (v3 >= 4)
  {
    char v5 = (id *)((char *)self + 16);
    if (v4 <= 1) {
      uint64_t v6 = 1LL;
    }
    else {
      uint64_t v6 = v4;
    }
    do
    {
      ++v5;
      --v6;
    }

    while (v6);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS_____NSSetI;
  -[__NSSetI dealloc](&v7, sel_dealloc);
}

@end