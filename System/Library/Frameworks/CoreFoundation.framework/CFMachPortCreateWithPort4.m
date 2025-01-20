@interface CFMachPortCreateWithPort4
@end

@implementation CFMachPortCreateWithPort4

void ___CFMachPortCreateWithPort4_block_invoke(uint64_t a1)
{
}

void ___CFMachPortCreateWithPort4_block_invoke_2(uint64_t a1)
{
  block[6] = *MEMORY[0x1895F89C0];
  _cfmp_source_record_deadness(0, *(_DWORD *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)&__CFAllMachPortsLock);
  if (__CFAllMachPorts)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)__CFAllMachPorts);
    if (Count >= 1)
    {
      CFIndex v2 = Count;
      CFIndex v3 = 0LL;
      uint64_t v4 = MEMORY[0x1895F87A8];
      v5 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)__CFAllMachPorts, v3);
        if (ValueAtIndex)
        {
          v7 = ValueAtIndex;
          if (!__CFMachPortCheck(ValueAtIndex[5]) || CFGetRetainCount(v7) == 1)
          {
            if (!v7[4])
            {
              os_unfair_lock_lock((os_unfair_lock_t)v7 + 24);
              if (v7[4])
              {
                os_unfair_lock_unlock((os_unfair_lock_t)v7 + 24);
              }

              else
              {
                v7[4] = 1;
                __dmb(0xBu);
                v8 = (dispatch_source_s *)*((void *)v7 + 3);
                if (v8)
                {
                  dispatch_source_cancel(v8);
                  *((void *)v7 + 3) = 0LL;
                }

                uint64_t v9 = *((void *)v7 + 5);
                *((void *)v7 + 5) = 0LL;
                CFRetain(v7);
                os_unfair_lock_unlock((os_unfair_lock_t)v7 + 24);
                block[0] = v4;
                block[1] = 3221225472LL;
                block[2] = ____CFMachPortChecker_block_invoke;
                block[3] = &__block_descriptor_48_e5_v8__0l;
                block[4] = v7;
                block[5] = v9;
                dispatch_async(v5, block);
              }
            }

            CFArrayRemoveValueAtIndex((CFMutableArrayRef)__CFAllMachPorts, v3--);
            --v2;
          }
        }

        ++v3;
      }

      while (v3 < v2);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&__CFAllMachPortsLock);
}

@end