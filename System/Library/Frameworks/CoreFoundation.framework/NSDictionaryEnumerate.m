@interface NSDictionaryEnumerate
@end

@implementation NSDictionaryEnumerate

void *____NSDictionaryEnumerate_block_invoke(void *result)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(result[7] + 8LL) + 24LL));
  if ((v1 & 1) == 0)
  {
    v2 = result;
    v3 = (char *)&v10 - ((8LL * result[8] + 15) & 0xFFFFFFFFFFFFFFF0LL);
    v4 = (void *)_CFAutoreleasePoolPush();
    pthread_mutex_lock((pthread_mutex_t *)v2[9]);
    if (v2[8])
    {
      unint64_t v5 = 0LL;
      do
      {
        uint64_t v6 = [(id)v2[4] nextObject];
        *(void *)&v3[8 * v5] = v6;
        if (!v6) {
          break;
        }
        ++v5;
      }

      while (v5 < v2[8]);
    }

    pthread_mutex_unlock((pthread_mutex_t *)v2[9]);
    if (v2[8])
    {
      for (unint64_t i = 0LL; i < v2[8]; ++i)
      {
        uint64_t v8 = *(void *)&v3[8 * i];
        if (!v8) {
          break;
        }
        HIBYTE(v10) = 0;
        uint64_t v9 = v2[6];
        [(id)v2[5] objectForKey:v8];
        __NSDICTIONARY_IS_CALLING_OUT_TO_A_BLOCK__(v9);
        if (HIBYTE(v10))
        {
          atomic_store(1u, (unsigned __int8 *)(*(void *)(v2[7] + 8LL) + 24LL));
          return _CFAutoreleasePoolPop(v4);
        }
      }
    }

    return _CFAutoreleasePoolPop(v4);
  }

  return result;
}

uint64_t ____NSDictionaryEnumerate_block_invoke_2(uint64_t a1)
{
  return 1LL;
}

@end