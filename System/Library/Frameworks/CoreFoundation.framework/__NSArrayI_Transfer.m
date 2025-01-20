@interface __NSArrayI_Transfer
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation __NSArrayI_Transfer

- (unint64_t)count
{
  return self->_used;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v14[1] = *MEMORY[0x1895F89C0];
  unint64_t used = self->_used;
  if (used > a3) {
    return self->_list[a3];
  }
  uint64_t v6 = _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  if (used)
  {
    uint64_t v8 = used - 1;
    double v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSArrayI_Transfer objectAtIndex:]", a3, v8);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v9,  "-[__NSArrayI_Transfer objectAtIndex:]",  a3,  v8);
  }

  else
  {
    *(_DWORD *)uint64_t v7 = 136315394;
    *(void *)(v7 + 4) = "-[__NSArrayI_Transfer objectAtIndex:]";
    *(_WORD *)(v7 + 12) = 2048;
    *(void *)(v7 + 14) = a3;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSArrayI_Transfer objectAtIndex:]",  a3);
  }

  v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
  objc_exception_throw(v10);
  -[__NSArrayI_Transfer getObjects:range:](v11, v12, v13, v15);
  return result;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  v30[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4.length)
  {
    NSUInteger length = a4.length;
    uint64_t v10 = _os_log_pack_size();
    unint64_t used = v30;
    v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[__NSArrayI_Transfer getObjects:range:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = length;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSArrayI_Transfer getObjects:range:]",  length);
LABEL_15:
    _NSRange v15 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v11,  v10);
    objc_exception_throw(v15);
    goto LABEL_16;
  }

  if (a4.length >> 61)
  {
    NSUInteger v13 = a4.length;
    uint64_t v10 = _os_log_pack_size();
    unint64_t used = v30;
    v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[__NSArrayI_Transfer getObjects:range:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = v13;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSArrayI_Transfer getObjects:range:]",  v13);
    goto LABEL_15;
  }

  unint64_t used = (void *)self->_used;
  if ((a4.location & 0x8000000000000000LL) != 0 || (unint64_t)used < a4.location + a4.length)
  {
LABEL_16:
    NSUInteger location = a4.location;
    NSUInteger v17 = a4.length;
    if (used)
    {
      uint64_t v18 = _os_log_pack_size();
      v19 = (char *)v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v22 = _os_log_pack_fill();
      uint64_t v23 = (uint64_t)used - 1;
      double v24 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v22,  (uint64_t)"-[__NSArrayI_Transfer getObjects:range:]",  location,  v17,  v23);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v24,  "-[__NSArrayI_Transfer getObjects:range:]",  location,  v17,  v23);
    }

    else
    {
      uint64_t v18 = _os_log_pack_size();
      v19 = (char *)v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v20 = _os_log_pack_fill();
      double v21 = __os_log_helper_1_2_3_8_32_8_0_8_0(v20, (uint64_t)"-[__NSArrayI_Transfer getObjects:range:]", location, v17);
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty array",  v21,  "-[__NSArrayI_Transfer getObjects:range:]",  location,  v17,  v29);
    }

    v25 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v19,  v18);
    objc_exception_throw(v25);
    +[__NSArrayI_Transfer automaticallyNotifiesObserversForKey:](v26, v27, v28);
    return;
  }

  v5 = &self->_list[a4.location];
  if (a4.length > 4)
  {
    memmove(a3, v5, 8 * a4.length);
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
        uint64_t v6 = *v5++;
        *a3++ = v6;
LABEL_9:
        uint64_t v7 = *v5++;
        *a3++ = v7;
LABEL_10:
        uint64_t v8 = *v5++;
        *a3++ = v8;
LABEL_11:
        *a3 = *v5;
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
    double v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136315394;
    *(void *)(v10 + 4) = "-[__NSArrayI_Transfer countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v10 + 12) = 2048;
    *(void *)(v10 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSArrayI_Transfer countByEnumeratingWithState:objects:count:]",  a5);
    goto LABEL_10;
  }

  if (a5 >> 61)
  {
    uint64_t v8 = _os_log_pack_size();
    double v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v12 + 4) = "-[__NSArrayI_Transfer countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v12 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSArrayI_Transfer countByEnumeratingWithState:objects:count:]",  a5);
LABEL_10:
    NSUInteger v13 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v9,  v8);
    objc_exception_throw(v13);
  }

  if (a3->var0) {
    return 0LL;
  }
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_37;
  list = self->_list;
  a3->var0 = -1LL;
  a3->var1 = list;
  return self->_used;
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v18[6] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    uint64_t v12 = _os_log_pack_size();
    uint64_t v14 = (char *)&v18[-1] - ((MEMORY[0x1895F8858](v12, v13) + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136315138;
    *(void *)(v15 + 4) = "-[__NSArrayI_Transfer enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[__NSArrayI_Transfer enumerateObjectsWithOptions:usingBlock:]");
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v14,  v12);
    objc_exception_throw(v16);
  }

  char v5 = a3;
  size_t used = self->_used;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __62____NSArrayI_Transfer_enumerateObjectsWithOptions_usingBlock___block_invoke;
  v18[3] = &unk_18972DAF0;
  v18[4] = self;
  v18[5] = a4;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v5, 1, used, (uint64_t)v18) & 1) == 0)
  {
    if ((v5 & 2) != 0)
    {
      HIBYTE(v17) = 0;
      for (unint64_t i = self->_used - 1; i != -1LL; --i)
      {
        v11 = (void *)_CFAutoreleasePoolPush();
        __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v11);
      }
    }

    else
    {
      HIBYTE(v17) = 0;
      if (self->_used)
      {
        unint64_t v8 = 0LL;
        do
        {
          double v9 = (void *)_CFAutoreleasePoolPush();
          __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v9);
          ++v8;
        }

        while (v8 < self->_used);
      }
    }
  }

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  v14[1] = *MEMORY[0x1895F89C0];
  unint64_t used = self->_used;
  if (used > a3) {
    return self->_list[a3];
  }
  uint64_t v6 = _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  if (used)
  {
    uint64_t v8 = used - 1;
    double v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSArrayI_Transfer objectAtIndexedSubscript:]", a3, v8);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v9,  "-[__NSArrayI_Transfer objectAtIndexedSubscript:]",  a3,  v8);
  }

  else
  {
    *(_DWORD *)uint64_t v7 = 136315394;
    *(void *)(v7 + 4) = "-[__NSArrayI_Transfer objectAtIndexedSubscript:]";
    *(_WORD *)(v7 + 12) = 2048;
    *(void *)(v7 + 14) = a3;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty array",  "-[__NSArrayI_Transfer objectAtIndexedSubscript:]",  a3);
  }

  uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
  objc_exception_throw(v10);
  return +[__NSArrayI_Transfer allocWithZone:](v11, v12, v13);
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  list = self->_list;
  unint64_t used = self->_used;
  if (used)
  {
    do
    {
      ++list;
      --used;
    }

    while (used);
    list = self->_list;
  }

  free(list);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSArrayI_Transfer;
  -[__NSArrayI_Transfer dealloc](&v5, sel_dealloc);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)__NSArrayM_new(self->_list, self->_used, 0);
}

@end