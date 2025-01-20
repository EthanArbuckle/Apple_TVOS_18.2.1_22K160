@interface CFNGetAutoRcvBufMax
@end

@implementation CFNGetAutoRcvBufMax

uint64_t ____CFNGetAutoRcvBufMax_block_invoke()
{
  size_t v3 = 8LL;
  unint64_t v4 = 0LL;
  uint64_t result = sysctlbyname("hw.memsize", &v4, &v3, 0LL, 0LL);
  if ((_DWORD)result) {
    BOOL v1 = 0;
  }
  else {
    BOOL v1 = v3 == 8;
  }
  if (v1)
  {
    uint64_t v2 = 0x200000LL;
    if (v4 > 0xC0000000) {
      uint64_t v2 = 0x400000LL;
    }
    __CFNGetAutoRcvBufMax::value = v2;
  }

  return result;
}

@end