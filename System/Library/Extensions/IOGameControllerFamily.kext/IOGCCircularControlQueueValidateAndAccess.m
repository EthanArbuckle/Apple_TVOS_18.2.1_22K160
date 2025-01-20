@interface IOGCCircularControlQueueValidateAndAccess
@end

@implementation IOGCCircularControlQueueValidateAndAccess

uint64_t ___IOGCCircularControlQueueValidateAndAccess_block_invoke( uint64_t a1,  unint64_t a2,  uint64_t a3)
{
  uint64_t v3 = 3758097112LL;
  unint64_t v4 = *(unsigned int *)(a1 + 64);
  unint64_t v5 = *(void *)(a1 + 40);
  if (a2 + (v4 >> 1) <= v5) {
    return 3758097127LL;
  }
  if (v5 + (v4 >> 1) <= a2) {
    return 3758097128LL;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(unsigned int *)(a1 + 68);
  v8 = (void *)(v6 + v7 * (a2 % v4) + 72);
  if (*v8 == *(void *)(a1 + 48))
  {
    char v9 = atomic_load((unint64_t *)(v6 + v7 * (a2 % v4) + 80));
    if (v8[3 * (v9 & 1) + 3] == *(void *)(a1 + 56) && v8[3 * (v9 & 1) + 4] == a2) {
      return (*(uint64_t (**)(uint64_t, unint64_t, void))(a3 + 16))( a3,  (unint64_t)v8 + (v9 & 1) * (unint64_t)*(unsigned int *)(a1 + 76) + 64,  *(unsigned int *)(a1 + 80));
    }
  }

  else
  {
    v11 = _gc_log_debug();
    _os_log_internal( &dword_0,  v11,  OS_LOG_TYPE_DEBUG,  "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n",  "entry->sentinel == queueGuard",  (const char *)&unk_6BF,  "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircular ControlQueueMemory.c",  306,  0LL);
    return 3758097105LL;
  }

  return v3;
}

@end