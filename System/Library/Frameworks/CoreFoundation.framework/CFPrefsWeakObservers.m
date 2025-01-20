@interface CFPrefsWeakObservers
@end

@implementation CFPrefsWeakObservers

uint64_t __46____CFPrefsWeakObservers_mutableCopyWithZone___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3)
{
  if (a3) {
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  }
  return result;
}

uint64_t __36____CFPrefsWeakObservers_addObject___block_invoke( uint64_t result,  int a2,  CFTypeRef cf2,  _BYTE *a4)
{
  if (cf2)
  {
    uint64_t v5 = result;
    result = CFEqual(*(CFTypeRef *)(result + 32), cf2);
    if ((_DWORD)result)
    {
      *a4 = 1;
      *(_BYTE *)(*(void *)(*(void *)(v5 + 40) + 8LL) + 24LL) = 1;
    }
  }

  return result;
}

uint64_t __39____CFPrefsWeakObservers_removeObject___block_invoke( uint64_t result,  id *a2,  CFTypeRef cf2,  _BYTE *a4)
{
  if (cf2)
  {
    uint64_t v6 = result;
    result = CFEqual(*(CFTypeRef *)(result + 32), cf2);
    if ((_DWORD)result)
    {
      result = (uint64_t)objc_storeWeak(a2, 0LL);
      *a4 = 1;
      *(_BYTE *)(*(void *)(*(void *)(v6 + 40) + 8LL) + 24LL) = 1;
    }
  }

  return result;
}

void *__46____CFPrefsWeakObservers_borrowObjects_count___block_invoke( void *result,  uint64_t a2,  void *a3,  _BYTE *a4)
{
  if (*(void *)(*(void *)(result[4] + 8LL) + 24LL) >= result[5])
  {
    *a4 = 1;
  }

  else if (a3)
  {
    v4 = result;
    result = a3;
    *(void *)(v4[6] + 8LL * (*(void *)(*(void *)(v4[4] + 8LL) + 24LL))++) = result;
  }

  return result;
}

void __42____CFPrefsWeakObservers_debugDescription__block_invoke( uint64_t a1,  uint64_t a2,  const __CFString *a3)
{
  v3 = *(__CFString **)(a1 + 32);
  v4 = @"_";
  if (a3) {
    v4 = a3;
  }
  CFStringAppendFormat(v3, 0LL, @"%@", v4);
}

@end