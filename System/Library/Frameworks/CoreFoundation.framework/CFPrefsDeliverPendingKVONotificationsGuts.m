@interface CFPrefsDeliverPendingKVONotificationsGuts
@end

@implementation CFPrefsDeliverPendingKVONotificationsGuts

void ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke(uint64_t a1, uint64_t a2, const __CFArray *a3)
{
  context[5] = *MEMORY[0x1895F89C0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v5 = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFIndex Count = CFArrayGetCount(a3);
  if (Count < 1)
  {
    v12 = 0LL;
  }

  else
  {
    CFIndex v7 = Count;
    CFIndex v8 = 0LL;
    uint64_t v9 = MEMORY[0x1895F87A8];
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a3, v8);
      v12 = (void *)ValueAtIndex[1];
      v11 = (const __CFDictionary *)ValueAtIndex[2];
      v13 = (const __CFDictionary *)ValueAtIndex[3];
      if (v11)
      {
        context[0] = v9;
        context[1] = 3221225472LL;
        context[2] = ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke_2;
        context[3] = &__block_descriptor_40_e25_v24__0____CFString__8_v16l;
        context[4] = Mutable;
        CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)applyBlockApplier, context);
      }

      if (v13)
      {
        v15[0] = v9;
        v15[1] = 3221225472LL;
        v15[2] = ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke_3;
        v15[3] = &__block_descriptor_48_e25_v24__0____CFString__8_v16l;
        v15[4] = Mutable;
        v15[5] = v5;
        CFDictionaryApplyFunction(v13, (CFDictionaryApplierFunction)applyBlockApplier, v15);
      }

      ++v8;
    }

    while (v7 != v8);
  }

  v14 = (void *)MEMORY[0x186E03CAC]();
  [v12 _notifyObserversOfChangeFromValuesForKeys:Mutable toValuesForKeys:v5];
  objc_autoreleasePoolPop(v14);
  CFRelease(Mutable);
  CFRelease(v5);
}

void ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke_2(uint64_t a1, const void *a2, const void *a3)
{
}

void ___CFPrefsDeliverPendingKVONotificationsGuts_block_invoke_3(uint64_t a1, const void *a2, const void *a3)
{
}

@end