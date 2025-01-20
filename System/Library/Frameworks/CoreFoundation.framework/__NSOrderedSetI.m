@interface __NSOrderedSetI
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexOfObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 range:(_NSRange)a4;
@end

@implementation __NSOrderedSetI

- (unint64_t)count
{
  return *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
}

- (unint64_t)indexOfObject:(id)a3
{
  if (a3)
  {
    unint64_t v4 = self->_used[7];
    if (v4 >= 4)
    {
      unint64_t v6 = v4 >> 2;
      int v7 = self->_used[6];
      int v8 = *(unsigned __int16 *)&self->_used[4];
      unint64_t v9 = __NSOrderedSetSizes[v4 >> 2];
      uint64_t v10 = *(unsigned int *)self->_used;
      int v11 = self->_used[7] & 3;
      unint64_t v12 = [a3 hash];
      if ((_DWORD)v6 != 63 && v11 != 3)
      {
        v16 = (char *)self + 16;
        v17 = &self->_used[((8 * v10) | ((unint64_t)(v8 | (v7 << 16)) << 35)) + 8];
        unint64_t v18 = v12 % v9;
        if (v9 <= 1) {
          uint64_t v19 = 1LL;
        }
        else {
          uint64_t v19 = v9;
        }
        do
        {
          if (v11 == 1)
          {
            uint64_t v20 = *(unsigned __int16 *)&v17[2 * v18];
          }

          else if (v11)
          {
            uint64_t v20 = *(unsigned int *)&v17[4 * v18];
          }

          else
          {
            uint64_t v20 = v17[v18];
          }

          if (!v20) {
            break;
          }
          unint64_t v14 = v20 - 1;
          id v21 = *(id *)&v16[8 * v20 - 8];
          if (v21 == a3 || ([v21 isEqual:a3] & 1) != 0) {
            return v14;
          }
          unint64_t v22 = v18 + 1 >= v9 ? v9 : 0LL;
          unint64_t v18 = v18 + 1 - v22;
          --v19;
        }

        while (v19);
      }
    }
  }

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v15[1] = *MEMORY[0x1895F89C0];
  unint64_t v3 = *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
  if (v3 > a3) {
    return *(id *)&self->_used[8 * a3 + 8];
  }
  uint64_t v6 = _os_log_pack_size();
  uint64_t v7 = _os_log_pack_fill();
  if (v3)
  {
    uint64_t v8 = v3 - 1;
    double v9 = __os_log_helper_1_2_3_8_32_8_0_8_0(v7, (uint64_t)"-[__NSOrderedSetI objectAtIndex:]", a3, v8);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds [0 .. %lu]",  v9,  "-[__NSOrderedSetI objectAtIndex:]",  a3,  v8);
  }

  else
  {
    *(_DWORD *)uint64_t v7 = 136315394;
    *(void *)(v7 + 4) = "-[__NSOrderedSetI objectAtIndex:]";
    *(_WORD *)(v7 + 12) = 2048;
    *(void *)(v7 + 14) = a3;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: index %lu beyond bounds for empty ordered set",  "-[__NSOrderedSetI objectAtIndex:]",  a3);
  }

  uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v6);
  objc_exception_throw(v10);
  __os_log_helper_1_2_3_8_32_8_0_8_0(v11, v12, v13, v14);
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v27[1] = *MEMORY[0x1895F89C0];
  unint64_t v8 = -[__NSOrderedSetI count](self, "count");
  if ((location & 0x8000000000000000LL) == 0 && (length & 0x8000000000000000LL) == 0 && v8 >= location + length)
  {
    if (!a3 && length)
    {
      uint64_t v13 = _os_log_pack_size();
      uint64_t v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v15 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v15 = 136315394;
      *(void *)(v15 + 4) = "-[__NSOrderedSetI getObjects:range:]";
      *(_WORD *)(v15 + 12) = 2048;
      *(void *)(v15 + 14) = length;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSOrderedSetI getObjects:range:]",  length);
    }

    else
    {
      if (!(length >> 61))
      {
        memmove(a3, &self->_used[8 * location + 8], 8 * length);
        return;
      }

      uint64_t v13 = _os_log_pack_size();
      uint64_t v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v16 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v16 = 136315394;
      *(void *)(v16 + 4) = "-[__NSOrderedSetI getObjects:range:]";
      *(_WORD *)(v16 + 12) = 2048;
      *(void *)(v16 + 14) = length;
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSOrderedSetI getObjects:range:]",  length);
    }

    v17 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v14,  v13);
    objc_exception_throw(v17);
  }

  if (v8)
  {
    unint64_t v18 = v8;
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v19 = _os_log_pack_fill();
    double v20 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0( v19,  (uint64_t)"-[__NSOrderedSetI getObjects:range:]",  location,  length,  --v18);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]",  v20,  "-[__NSOrderedSetI getObjects:range:]",  location,  length,  v18);
  }

  else
  {
    uint64_t v9 = _os_log_pack_size();
    uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    double v12 = __os_log_helper_1_2_3_8_32_8_0_8_0(v11, (uint64_t)"-[__NSOrderedSetI getObjects:range:]", location, length);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: range {%lu, %lu} extends beyond bounds for empty ordered set",  v12,  "-[__NSOrderedSetI getObjects:range:]",  location,  length);
  }

  id v21 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSRangeException",  _CFAutoreleasePoolAddObject(),  0LL,  v10,  v9);
  objc_exception_throw(v21);
  __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v22, v23, v24, v25, v26);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v13[1] = *MEMORY[0x1895F89C0];
  if (!a4 && a5)
  {
    uint64_t v7 = _os_log_pack_size();
    unint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v9 + 4) = "-[__NSOrderedSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v9 + 12) = 2048;
    *(void *)(v9 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: pointer to objects array is NULL but length is %lu",  "-[__NSOrderedSetI countByEnumeratingWithState:objects:count:]",  a5);
    goto LABEL_10;
  }

  if (a5 >> 61)
  {
    uint64_t v7 = _os_log_pack_size();
    unint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v11 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v11 = 136315394;
    *(void *)(v11 + 4) = "-[__NSOrderedSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v11 + 12) = 2048;
    *(void *)(v11 + 14) = a5;
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: count (%lu) of objects array is ridiculous",  "-[__NSOrderedSetI countByEnumeratingWithState:objects:count:]",  a5);
LABEL_10:
    double v12 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v8,  v7);
    objc_exception_throw(v12);
  }

  if (a3->var0) {
    return 0LL;
  }
  a3->var0 = -1LL;
  a3->var1 = (id *)((char *)self + 16);
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu;
  return *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
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
    *(void *)(v15 + 4) = "-[__NSOrderedSetI enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"*** %s: block cannot be nil",  "-[__NSOrderedSetI enumerateObjectsWithOptions:usingBlock:]");
    uint64_t v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:osLogPack:size:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL,  v14,  v12);
    objc_exception_throw(v16);
  }

  char v5 = a3;
  size_t v7 = *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __58____NSOrderedSetI_enumerateObjectsWithOptions_usingBlock___block_invoke;
  v18[3] = &unk_18972DAF0;
  v18[4] = self;
  v18[5] = a4;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v5, 1, v7, (uint64_t)v18) & 1) == 0)
  {
    if ((v5 & 2) != 0)
    {
      HIBYTE(v17) = 0;
      {
        uint64_t v11 = (void *)_CFAutoreleasePoolPush();
        __NSORDEREDSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v11);
      }
    }

    else
    {
      HIBYTE(v17) = 0;
      if (*(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32))
      {
        unint64_t v8 = 0LL;
        do
        {
          uint64_t v9 = (void *)_CFAutoreleasePoolPush();
          __NSORDEREDSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v9);
          ++v8;
        }

        while (v8 < (*(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32)));
      }
    }
  }

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  used = self->_used;
  unint64_t v4 = *(unsigned int *)self->_used | ((unint64_t)(*(unsigned __int16 *)&self->_used[4] | (self->_used[6] << 16)) << 32);
  if (v4)
  {
    for (unint64_t i = 0LL; i < v4; ++i)
    {
      uint64_t v6 = *(void *)&self->_used[8 * i + 8];
      if (v6 >= 1)
      {

        unint64_t v4 = *(unsigned int *)used | ((unint64_t)(*((unsigned __int16 *)used + 2) | (used[6] << 16)) << 32);
      }
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS_____NSOrderedSetI;
  -[__NSOrderedSetI dealloc](&v7, sel_dealloc);
}

@end