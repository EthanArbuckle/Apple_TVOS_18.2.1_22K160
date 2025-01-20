@interface __NSDictionaryI
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (double)_clumpingFactor;
- (double)_clumpingInterestingThreshold;
- (id)_cfMutableCopy;
- (id)keyEnumerator;
- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)keysOfEntriesWithOptions:(unint64_t)a3 passingTest:(id)a4;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__apply:(void *)a3 context:(void *)a4;
- (void)dealloc;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
@end

@implementation __NSDictionaryI

- (unint64_t)count
{
  return *(void *)self->_used & 0x1FFFFFFFFFFFFFFLL;
}

- (id)objectForKey:(id)a3
{
  unsigned int v3 = self->_used[7];
  if (v3 < 4) {
    return 0LL;
  }
  unint64_t v6 = *(void *)((char *)__NSDictionarySizes + ((2 * v3) & 0x1F8LL));
  v7 = (char *)self + 16;
  unint64_t v8 = [a3 hash] % v6;
  uint64_t v9 = v6 <= 1 ? 1LL : v6;
  uint64_t v10 = 2 * v8;
  id v11 = *(id *)&v7[16 * v8];
  if (!v11 || v11 == a3)
  {
    BOOL v14 = 1;
  }

  else
  {
    unint64_t v13 = 1LL;
    BOOL v14 = 1;
    do
    {
      if ([v11 isEqual:a3]) {
        break;
      }
      BOOL v14 = v13 < v6;
      if (v9 == v13) {
        break;
      }
      unint64_t v15 = v8 + 1;
      unint64_t v16 = v8 + 1 >= v6 ? v6 : 0LL;
      unint64_t v8 = v15 - v16;
      uint64_t v10 = 2 * (v15 - v16);
      id v11 = *(id *)&v7[16 * (v15 - v16)];
      ++v13;
    }

    while (v11 && v11 != a3);
  }

  unint64_t v18 = 2 * v6;
  if (v14) {
    unint64_t v18 = v10;
  }
  if (v18 >= 2 * v6) {
    return 0LL;
  }
  else {
    return *(id *)&self->_used[((8 * v18) | 8) + 8];
  }
}

- (id)keyEnumerator
{
  return (id)[objc_allocWithZone((Class)__NSFastEnumerationEnumerator) initWithObject:self];
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  v16[1] = *MEMORY[0x1895F89C0];
  unint64_t v5 = a5 >> 61;
  if (a3 && v5 || a4 && v5)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[__NSDictionaryI getObjects:andKeys:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSDictionaryI getObjects:andKeys:count:]",  a5);
    unint64_t v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v13);
    objc_exception_throw(v15);
  }

  unint64_t v6 = *(void *)self->_used & 0x1FFFFFFFFFFFFFFLL;
  if (v6 >= a5) {
    unint64_t v6 = a5;
  }
  unint64_t v7 = 2LL * *(void *)((char *)__NSDictionarySizes + ((2 * self->_used[7]) & 0x1F8LL));
  if (v7) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    unint64_t v9 = 0LL;
    uint64_t v10 = (char *)self + 16;
    do
    {
      id v11 = *(void **)&v10[8 * v9];
      if (v11)
      {
        if (a4) {
          *a4++ = v11;
        }
        if (a3) {
          *a3++ = *(id *)&v10[8 * v9 + 8];
        }
        --v6;
      }

      v9 += 2LL;
    }

    while (v9 < v7 && v6);
  }

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  if (a3)
  {
    unint64_t v4 = 2LL * *(void *)((char *)__NSDictionarySizes + ((2 * self->_used[7]) & 0x1F8LL));
    if (v4)
    {
      unint64_t v7 = 0LL;
      BOOL v8 = (char *)self + 16;
      do
      {
        uint64_t v9 = *(void *)&v8[8 * v7];
        if (v9) {
          ((void (*)(uint64_t, void, void *))a3)(v9, *(void *)&v8[8 * v7 + 8], a4);
        }
        v7 += 2LL;
      }

      while (v7 < v4);
    }
  }

  else
  {
    uint64_t v10 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: function pointer is NULL",  v10);
    id v11 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v11);
    -[__NSDictionaryI countByEnumeratingWithState:objects:count:](v12, v13, v14, v15, v16);
  }

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v18[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5)
  {
    uint64_t v12 = _os_log_pack_size();
    SEL v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[__NSDictionaryI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSDictionaryI countByEnumeratingWithState:objects:count:]",  a5);
    goto LABEL_18;
  }

  if (a5 >> 61)
  {
    uint64_t v12 = _os_log_pack_size();
    SEL v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[__NSDictionaryI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSDictionaryI countByEnumeratingWithState:objects:count:]",  a5);
LABEL_18:
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v13,  v12);
    objc_exception_throw(v17);
  }

  unint64_t v6 = *(void *)((char *)__NSDictionarySizes + ((2 * self->_used[7]) & 0x1F8LL));
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_0;
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
    uint64_t v10 = *(void **)&v9[16 * var0++];
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

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v16[6] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v10 = _os_log_pack_size();
    uint64_t v12 = &v15[-((MEMORY[0x1895F8858](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315138;
    *(void *)(v13 + 4) = "-[__NSDictionaryI enumerateKeysAndObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[__NSDictionaryI enumerateKeysAndObjectsWithOptions:usingBlock:]");
    uint64_t v14 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v10);
    objc_exception_throw(v14);
  }

  unsigned int v6 = self->_used[7];
  size_t v7 = *(void *)((char *)__NSDictionarySizes + ((2 * v6) & 0x1F8LL));
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  void v16[2] = __65____NSDictionaryI_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke;
  v16[3] = &unk_189996300;
  v16[4] = self;
  v16[5] = a4;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v7, (uint64_t)v16) & 1) == 0)
  {
    v15[7] = 0;
    if (v6 >= 4)
    {
      size_t v8 = 0LL;
      do
      {
        if (*(void *)&self->_used[16 * v8 + 8])
        {
          uint64_t v9 = (void *)_CFAutoreleasePoolPush();
          __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v9);
        }

        ++v8;
      }

      while (v8 < v7);
    }
  }

- (id)keyOfEntryWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  unsigned int v6 = self->_used[7];
  size_t v7 = *(void *)((char *)__NSDictionarySizes + ((2 * v6) & 0x1F8LL));
  uint64_t v17 = 0LL;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  void v16[2] = __53____NSDictionaryI_keyOfEntryWithOptions_passingTest___block_invoke;
  v16[3] = &unk_189996328;
  v16[4] = self;
  v16[5] = a4;
  v16[6] = &v17;
  if (__NSCollectionHandleConcurrentEnumerationIfSpecified(a3, 0, v7, (uint64_t)v16))
  {
    size_t v8 = (void *)atomic_load((unint64_t *)v18 + 3);
  }

  else
  {
    char v15 = 0;
    if (v6 >= 4)
    {
      size_t v8 = 0LL;
      if (v7 <= 1) {
        uint64_t v9 = 1LL;
      }
      else {
        uint64_t v9 = v7;
      }
      list = self->_list;
      do
      {
        uint64_t v11 = *(list - 1);
        if (v11)
        {
          id v12 = *list;
          uint64_t v13 = (void *)_CFAutoreleasePoolPush();
          if ((*((unsigned int (**)(id, void *, id, char *))a4 + 2))(a4, v11, v12, &v15))
          {
            char v15 = 1;
            size_t v8 = v11;
          }

          _CFAutoreleasePoolPop(v13);
          if (v15) {
            break;
          }
        }

        list += 2;
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
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v16 = _os_log_pack_size();
    unint64_t v18 = (char *)&v21 - ((MEMORY[0x1895F8858](v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v19 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v19 = 136315138;
    *(void *)(v19 + 4) = "-[__NSDictionaryI keysOfEntriesWithOptions:passingTest:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: predicate cannot be nil",  "-[__NSDictionaryI keysOfEntriesWithOptions:passingTest:]");
    uint64_t v20 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v18,  v16);
    objc_exception_throw(v20);
  }

  char v5 = a3;
  unsigned int v7 = self->_used[7];
  size_t v8 = *(void *)((char *)__NSDictionarySizes + ((2 * v7) & 0x1F8LL));
  uint64_t v9 = +[NSSet set](&OBJC_CLASS___NSMutableSet, "set");
  int v24 = 0;
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __56____NSDictionaryI_keysOfEntriesWithOptions_passingTest___block_invoke;
  v23[3] = &unk_189996350;
  v23[6] = a4;
  v23[7] = &v24;
  v23[4] = self;
  v23[5] = v9;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v5, 0, v8, (uint64_t)v23) & 1) == 0)
  {
    char v22 = 0;
    if (v7 >= 4)
    {
      size_t v10 = 0LL;
      uint64_t v11 = (char *)self + 16;
      do
      {
        uint64_t v12 = *(void *)&v11[16 * v10];
        if (v12)
        {
          uint64_t v13 = *(void *)&v11[(16 * v10) | 8];
          uint64_t v14 = (void *)_CFAutoreleasePoolPush();
          _CFAutoreleasePoolPop(v14);
          if (v22) {
            break;
          }
        }

        ++v10;
      }

      while (v10 < v8);
    }

    return +[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v9);
  }

  return v9;
}

- (id)objectForKeyedSubscript:(id)a3
{
  unsigned int v3 = self->_used[7];
  if (v3 < 4) {
    return 0LL;
  }
  unint64_t v6 = *(void *)((char *)__NSDictionarySizes + ((2 * v3) & 0x1F8LL));
  unsigned int v7 = (char *)self + 16;
  unint64_t v8 = [a3 hash] % v6;
  uint64_t v9 = v6 <= 1 ? 1LL : v6;
  uint64_t v10 = 2 * v8;
  id v11 = *(id *)&v7[16 * v8];
  if (!v11 || v11 == a3)
  {
    BOOL v14 = 1;
  }

  else
  {
    unint64_t v13 = 1LL;
    BOOL v14 = 1;
    do
    {
      if ([v11 isEqual:a3]) {
        break;
      }
      BOOL v14 = v13 < v6;
      if (v9 == v13) {
        break;
      }
      unint64_t v15 = v8 + 1;
      unint64_t v16 = v8 + 1 >= v6 ? v6 : 0LL;
      unint64_t v8 = v15 - v16;
      uint64_t v10 = 2 * (v15 - v16);
      id v11 = *(id *)&v7[16 * (v15 - v16)];
      ++v13;
    }

    while (v11 && v11 != a3);
  }

  unint64_t v18 = 2 * v6;
  if (v14) {
    unint64_t v18 = v10;
  }
  if (v18 >= 2 * v6) {
    return 0LL;
  }
  else {
    return *(id *)&self->_used[((8 * v18) | 8) + 8];
  }
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  unsigned int v3 = self->_used[7];
  uint64_t v4 = __NSDictionarySizes[v3 >> 2];
  self->_used[7] = v3 & 3;
  *(void *)self->_used &= 0xFE00000000000000LL;
  uint64_t v5 = 2 * v4;
  if (2 * v4)
  {
    unint64_t v6 = (id *)((char *)self + 16);
    do
    {
      ++v6;
      --v5;
    }

    while (v5);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS_____NSDictionaryI;
  -[__NSDictionaryI dealloc](&v7, sel_dealloc);
}

- (id)_cfMutableCopy
{
  id result = (id)_NSDictionaryI_mutableCopyWithZone(self, (uint64_t)a2);
  *((void *)result + 2) = *((void *)result + 2) & 0xFFFFFFFF7FFFFFFFLL | ((((unint64_t)self->_used[7] >> 1) & 1) << 31);
  return result;
}

- (double)_clumpingFactor
{
  v24[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)self->_used;
  if ((v3 & 0x1FFFFFFFFFFFFFELL) != 0) {
    uint64_t v4 = v3 & 0x1FFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v4 = 1LL;
  }
  unint64_t v5 = MEMORY[0x1895F8858](v4, a2);
  uint64_t v8 = (char *)v24 - v7;
  if (v6 >= 0x101)
  {
    uint64_t v8 = (char *)_CFCreateArrayStorage(v5, 0, v24);
    unint64_t v6 = *(void *)self->_used & 0x1FFFFFFFFFFFFFFLL;
    uint64_t v9 = v8;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  -[__NSDictionaryI getObjects:andKeys:count:](self, "getObjects:andKeys:count:", 0LL, v8, v6);
  size_t v10 = *(void *)self->_used & 0x1FFFFFFFFFFFFFFLL;
  double v11 = 0.0;
  if (v10 >= 2)
  {
    unint64_t v12 = *(void *)((char *)__NSDictionarySizes + ((2 * self->_used[7]) & 0x1F8LL));
    uint64_t v13 = 8 * v10;
    BOOL v14 = (uint64_t *)malloc(8 * v10 + 8);
    unint64_t v15 = 0LL;
    do
    {
      v14[v15 / 8] = [*(id *)&v8[v15] hash] % v12;
      v15 += 8LL;
    }

    while (v13 != v15);
    qsort(v14, v10, 8uLL, (int (__cdecl *)(const void *, const void *))_compare_clumpiness);
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

- (double)_clumpingInterestingThreshold
{
  double v2 = (double)*(unint64_t *)((char *)&__NSDictionarySizes + ((2 * self->_used[7]) & 0x1F8LL));
  return 1.0
       - ((double)(*(void *)self->_used & 0x1FFFFFFFFFFFFFFLL) + (double)(*(void *)self->_used & 0x1FFFFFFFFFFFFFFLL))
       / v2
       + (double)(*(void *)self->_used & 0x1FFFFFFFFFFFFFFLL)
       * (double)(*(void *)self->_used & 0x1FFFFFFFFFFFFFFLL)
       / v2
       / v2;
}

@end