@interface __NSArrayI
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)nothingAtIndex:(unint64_t)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation __NSArrayI

- (unint64_t)count
{
  return self->storage.used;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t used = self->storage.used;
  if (used <= a3) {
    __boundsFail(a3, used);
  }
  return self->storage.list[a3];
}

- (id)nothingAtIndex:(unint64_t)a3
{
  return 0LL;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  v31[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4.length)
  {
    NSUInteger length = a4.length;
    uint64_t v11 = _os_log_pack_size();
    unint64_t used = v31;
    v12 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[__NSArrayI getObjects:range:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = length;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSArrayI getObjects:range:]",  length);
LABEL_15:
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v12,  v11);
    objc_exception_throw(v16);
    goto LABEL_16;
  }

  if (a4.length >> 61)
  {
    NSUInteger v14 = a4.length;
    uint64_t v11 = _os_log_pack_size();
    unint64_t used = v31;
    v12 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315394;
    *(void *)(v15 + 4) = "-[__NSArrayI getObjects:range:]";
    *(_WORD *)(v15 + 12) = 2048;
    *(void *)(v15 + 14) = v14;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSArrayI getObjects:range:]",  v14);
    goto LABEL_15;
  }

  p_storage = &self->storage;
  unint64_t used = (void *)self->storage.used;
  if ((a4.location & 0x8000000000000000LL) != 0 || (unint64_t)used < a4.location + a4.length)
  {
LABEL_16:
    NSUInteger location = a4.location;
    NSUInteger v18 = a4.length;
    if (used)
    {
      uint64_t v19 = _os_log_pack_size();
      v20 = (char *)v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v23 = _os_log_pack_fill();
      uint64_t v24 = (uint64_t)used - 1;
      double v25 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v23, (uint64_t)"-[__NSArrayI getObjects:range:]", location, v18, v24);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v25,  "-[__NSArrayI getObjects:range:]",  location,  v18,  v24);
    }

    else
    {
      uint64_t v19 = _os_log_pack_size();
      v20 = (char *)v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v21 = _os_log_pack_fill();
      double v22 = __os_log_helper_1_2_3_8_32_8_0_8_0(v21, (uint64_t)"-[__NSArrayI getObjects:range:]", location, v18);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v22,  "-[__NSArrayI getObjects:range:]",  location,  v18,  v30);
    }

    v26 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v20,  v19);
    objc_exception_throw(v26);
    +[__NSArrayI automaticallyNotifiesObserversForKey:](v27, v28, v29);
    return;
  }

  v6 = &p_storage->list[a4.location];
  if (a4.length > 4)
  {
    memmove(a3, v6, 8 * a4.length);
  }

  else
  {
    switch(a4.length)
    {
      case 1uLL:
        goto LABEL_11;
      case 2uLL:
        goto LABEL_10;
      case 3uLL:
        goto LABEL_9;
      case 4uLL:
        v7 = *v6;
        v6 = &p_storage->list[a4.location + 1];
        *a3++ = v7;
LABEL_9:
        v8 = *v6++;
        *a3++ = v8;
LABEL_10:
        v9 = *v6++;
        *a3++ = v9;
LABEL_11:
        *a3 = *v6;
        break;
      default:
        return;
    }
  }

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v14[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5)
  {
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315394;
    *(void *)(v10 + 4) = "-[__NSArrayI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v10 + 12) = 2048;
    *(void *)(v10 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSArrayI countByEnumeratingWithState:objects:count:]",  a5);
    goto LABEL_10;
  }

  if (a5 >> 61)
  {
    uint64_t v8 = _os_log_pack_size();
    v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[__NSArrayI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSArrayI countByEnumeratingWithState:objects:count:]",  a5);
LABEL_10:
    uint64_t v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v8);
    objc_exception_throw(v13);
  }

  if (a3->var0) {
    return 0LL;
  }
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_6;
  list = self->storage.list;
  unint64_t result = self->storage.used;
  a3->var0 = -1LL;
  a3->var1 = list;
  return result;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v19[6] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v13 = _os_log_pack_size();
    uint64_t v15 = (char *)&v19[-1] - ((MEMORY[0x1895F8858](v13, v14) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = "-[__NSArrayI enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[__NSArrayI enumerateObjectsWithOptions:usingBlock:]");
    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v15,  v13);
    objc_exception_throw(v17);
  }

  char v5 = a3;
  p_storage = &self->storage;
  size_t used = self->storage.used;
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __53____NSArrayI_enumerateObjectsWithOptions_usingBlock___block_invoke;
  v19[3] = &unk_18972DAF0;
  v19[4] = self;
  v19[5] = a4;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v5, 1, used, (uint64_t)v19) & 1) == 0)
  {
    if ((v5 & 2) != 0)
    {
      HIBYTE(v18) = 0;
      for (unint64_t i = p_storage->used; i; unint64_t i = v11)
      {
        unint64_t v11 = i - 1;
        uint64_t v12 = (void *)_CFAutoreleasePoolPush();
        __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v12);
      }
    }

    else
    {
      HIBYTE(v18) = 0;
      if (p_storage->used)
      {
        unint64_t v8 = 0LL;
        do
        {
          v9 = (void *)_CFAutoreleasePoolPush();
          __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v9);
          ++v8;
        }

        while (v8 < p_storage->used);
      }
    }
  }

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  v14[1] = *MEMORY[0x1895F89C0];
  unint64_t used = self->storage.used;
  if (used > a3) {
    return self->storage.list[a3];
  }
  uint64_t v6 = _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  if (used)
  {
    uint64_t v8 = used - 1;
    double v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSArrayI objectAtIndexedSubscript:]", a3, v8);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v9,  "-[__NSArrayI objectAtIndexedSubscript:]",  a3,  v8);
  }

  else
  {
    *(_DWORD *)uint64_t v7 = 136315394;
    *(void *)(v7 + 4) = "-[__NSArrayI objectAtIndexedSubscript:]";
    *(_WORD *)(v7 + 12) = 2048;
    *(void *)(v7 + 14) = a3;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSArrayI objectAtIndexedSubscript:]",  a3);
  }

  uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
  objc_exception_throw(v10);
  return +[__NSArrayI allocWithZone:](v11, v12, v13);
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  list = self->storage.list;
  for (unint64_t i = self->storage.used; i; --i)
  {
    ++list;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSArrayI;
  -[__NSArrayI dealloc](&v5, sel_dealloc);
}

- (id)mutableCopy
{
  return (id)__NSArrayM_new(self->storage.list, self->storage.used, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)__NSArrayM_new(self->storage.list, self->storage.used, 0);
}

@end