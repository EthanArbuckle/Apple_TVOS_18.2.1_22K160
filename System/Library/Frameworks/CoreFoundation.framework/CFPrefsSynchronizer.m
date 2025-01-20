@interface CFPrefsSynchronizer
@end

@implementation CFPrefsSynchronizer

_CFPrefsSynchronizer *__38___CFPrefsSynchronizer_sharedInstance__block_invoke()
{
  result = objc_alloc_init(&OBJC_CLASS____CFPrefsSynchronizer);
  sharedInstance_shared = (uint64_t)result;
  return result;
}

void __28___CFPrefsSynchronizer_init__block_invoke()
{
  v0 = (const __CFSet *)+[_CFPrefsSynchronizer sharedInstance]();
  -[_CFPrefsSynchronizer synchronize](v0);
}

@end