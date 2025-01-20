@interface NSHSTSStorage
@end

@implementation NSHSTSStorage

_NSHSTSStorage *__39___NSHSTSStorage_sharedPersistentStore__block_invoke()
{
  result = objc_alloc(&OBJC_CLASS____NSHSTSStorage);
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)&OBJC_CLASS____NSHSTSStorage;
    result = (_NSHSTSStorage *)objc_msgSendSuper2(&v3, sel_init);
    uint64_t v1 = (uint64_t)result;
    if (result)
    {
      v2 = (const void *)(HSTSPolicy::getDefaultPolicy(void)::sHSTSPolicy - 16);
      *(void *)(v1 + 8) = HSTSPolicy::getDefaultPolicy(void)::sHSTSPolicy - 16;
      result = (_NSHSTSStorage *)CFRetain(v2);
    }
  }

  else
  {
    uint64_t v1 = 0LL;
  }

  +[_NSHSTSStorage sharedPersistentStore]::store = v1;
  return result;
}

@end