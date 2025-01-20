@interface NSObserver
@end

@implementation NSObserver

CFMutableSetRef __35____NSObserver_observerWithCenter___block_invoke()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  memset(&v1, 0, sizeof(v1));
  *(_OWORD *)&v1.retain = *(_OWORD *)(MEMORY[0x189605258] + 8LL);
  CFMutableSetRef result = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DD0], 0LL, &v1);
  qword_18C4964E8 = (uint64_t)result;
  return result;
}

@end