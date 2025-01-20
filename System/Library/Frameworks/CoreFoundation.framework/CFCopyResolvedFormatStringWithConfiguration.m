@interface CFCopyResolvedFormatStringWithConfiguration
@end

@implementation CFCopyResolvedFormatStringWithConfiguration

const void *___CFCopyResolvedFormatStringWithConfiguration_block_invoke( uint64_t a1,  CFDictionaryRef theDict,  UniChar a3)
{
  v12[1] = *(const void **)MEMORY[0x1895F89C0];
  CFIndex Count = CFDictionaryGetCount(theDict);
  v7 = (const void **)((char *)v12 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0LL));
  v8 = v7;
  CFDictionaryGetKeysAndValues(theDict, v12, v7);
  if (Count < 1) {
    return CFDictionaryGetValue(theDict, @"default");
  }
  while (1)
  {
    v9 = *v7;
    if (CFStringCompare((CFStringRef)*v7, @"default", 0LL))
    {
      Value = (const __CFCharacterSet *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), v9);
      if (CFCharacterSetIsCharacterMember(Value, a3)) {
        break;
      }
    }

    ++v8;
    ++v7;
    if (!--Count) {
      return CFDictionaryGetValue(theDict, @"default");
    }
  }

  return *v8;
}

Class ___CFCopyResolvedFormatStringWithConfiguration_block_invoke_2()
{
  __NSPersonNameComponentsClass = (uint64_t)objc_lookUpClass("NSPersonNameComponents");
  Class result = objc_lookUpClass("NSPersonNameComponentsFormatter");
  __NSPersonNameComponentsFormatterClass = (uint64_t)result;
  return result;
}

id ___CFCopyResolvedFormatStringWithConfiguration_block_invoke_3()
{
  id result = objc_alloc_init((Class)__NSPersonNameComponentsFormatterClass);
  _CFCopyResolvedFormatStringWithConfiguration_formatter = (uint64_t)result;
  return result;
}

@end