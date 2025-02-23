@interface NSDictionaryI
@end

@implementation NSDictionaryI

void *__65____NSDictionaryI_enumerateKeysAndObjectsWithOptions_usingBlock___block_invoke( void *result,  uint64_t a2)
{
  if (*(void *)(result[4] + 16LL + 16 * a2))
  {
    v2 = result;
    v3 = (void *)_CFAutoreleasePoolPush();
    __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__(v2[5]);
    return _CFAutoreleasePoolPop(v3);
  }

  return result;
}

void *__53____NSDictionaryI_keyOfEntryWithOptions_passingTest___block_invoke( void *result,  uint64_t a2,  _BYTE *a3)
{
  unint64_t v3 = *(void *)(result[4] + 16LL + 16 * a2);
  if (v3)
  {
    v5 = result;
    v6 = (void *)_CFAutoreleasePoolPush();
    if ((*(unsigned int (**)(void))(v5[5] + 16LL))())
    {
      atomic_store(v3, (unint64_t *)(*(void *)(v5[6] + 8LL) + 24LL));
      *a3 = 1;
    }

    return _CFAutoreleasePoolPop(v6);
  }

  return result;
}

void *__56____NSDictionaryI_keysOfEntriesWithOptions_passingTest___block_invoke( void *result,  uint64_t a2)
{
  uint64_t v2 = *(void *)(result[4] + 16LL + 16 * a2);
  if (v2)
  {
    unint64_t v3 = result;
    v4 = (void *)_CFAutoreleasePoolPush();
    if ((*(unsigned int (**)(void))(v3[6] + 16LL))())
    {
      os_unfair_lock_lock((os_unfair_lock_t)v3[7]);
      [(id)v3[5] addObject:v2];
      os_unfair_lock_unlock((os_unfair_lock_t)v3[7]);
    }

    return _CFAutoreleasePoolPop(v4);
  }

  return result;
}

void ____NSDictionaryI_new_block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1[5];
  unint64_t v5 = a1[6];
  unint64_t v7 = [(id)a2 hash];
  if (v5)
  {
    unint64_t v8 = v7 % v5;
    uint64_t v9 = 2 * (v7 % v5);
    v10 = *(void **)(v6 + 16 * (v7 % v5));
    if (v10) {
      BOOL v11 = v10 == (void *)a2;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      BOOL v13 = 1;
    }

    else
    {
      unint64_t v12 = 1LL;
      BOOL v13 = 1;
      do
      {
        if ([v10 isEqual:a2]) {
          break;
        }
        BOOL v13 = v12 < v5;
        if (v5 == v12) {
          break;
        }
        unint64_t v14 = v8 + 1;
        unint64_t v15 = v8 + 1 >= v5 ? v5 : 0LL;
        unint64_t v8 = v14 - v15;
        uint64_t v9 = 2 * (v14 - v15);
        v10 = *(void **)(v6 + 16 * (v14 - v15));
        ++v12;
      }

      while (v10 && v10 != (void *)a2);
    }

    if (v13) {
      unint64_t v5 = v9;
    }
    else {
      v5 *= 2LL;
    }
  }

  uint64_t v17 = a1[5];
  v18 = (uint64_t *)(v17 + 8 * v5);
  if (*v18)
  {
    *(void *)(a1[4] + 8LL) = *(void *)(a1[4] + 8LL) & 0xFE00000000000000LL | (*(void *)(a1[4] + 8LL) - 1LL) & 0x1FFFFFFFFFFFFFFLL;
    uint64_t v19 = a1[7];
    if ((v19 & 8) != 0)
    {

      uint64_t v19 = a1[7];
    }

    if ((v19 & 4) != 0) {

    }
    return;
  }

  uint64_t v20 = a1[7];
  if ((v20 & 8) == 0)
  {
    if ((v20 & 1) != 0)
    {
      *(void *)(a1[5] + 8 * v5) = [(id)a2 copyWithZone:0];
      if (!*(void *)(a1[5] + 8 * v5))
      {
        CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"NSDictionary: -copyWithZone: for key %@ returned nil",  0LL);
        v23 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
        objc_exception_throw(v23);
        -[__NSDictionaryI dealloc](v24, v25);
        return;
      }

      goto LABEL_33;
    }

    if (a2 >= 1)
    {
      id v21 = (id)a2;
      uint64_t v17 = a1[5];
    }

    v18 = (uint64_t *)(v17 + 8 * v5);
  }

  uint64_t *v18 = a2;
LABEL_33:
  *(void *)(a1[5] + 8 * v5 + 8) = a3;
  if (a3 >= 1 && (a1[7] & 4) == 0) {
    id v22 = (id)a3;
  }
}

@end