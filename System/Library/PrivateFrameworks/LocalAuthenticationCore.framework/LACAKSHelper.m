@interface LACAKSHelper
+ (BOOL)isOnenessAssertionActive;
+ (void)isOnenessAssertionActive;
@end

@implementation LACAKSHelper

+ (BOOL)isOnenessAssertionActive
{
  int extended_device_state = aks_get_extended_device_state();
  if (extended_device_state)
  {
    int v3 = extended_device_state;
    LACLogABM();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[LACAKSHelper isOnenessAssertionActive].cold.1(v3, v4);
    }

    LOBYTE(v5) = 0;
  }

  else
  {
    return (v7 >> 4) & 1;
  }

  return v5;
}

+ (void)isOnenessAssertionActive
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_189219000,  a2,  OS_LOG_TYPE_ERROR,  "AKS get device state returned non-zero result: %d",  (uint8_t *)v2,  8u);
}

@end