@interface SecKeychainRestoreSyncable
@end

@implementation SecKeychainRestoreSyncable

uint64_t ___SecKeychainRestoreSyncable_block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = ___SecKeychainRestoreSyncable_block_invoke_2;
  v3[3] = &__block_descriptor_tmp_21_8999;
  __int128 v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t result = SecOSStatusWith((uint64_t)v3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t ___SecKeychainRestoreSyncable_block_invoke_2(void *a1, CFTypeRef *a2)
{
  if (gSecurityd)
  {
    v2 = *(uint64_t (**)(void, void, void, CFTypeRef *))(gSecurityd + 128);
    if (v2) {
      return v2(a1[4], a1[5], a1[6], a2);
    }
  }

  uint64_t v4 = a1[6];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 0x40000000LL;
  v5[2] = __dict_data_data_to_error_request_block_invoke;
  v5[3] = &__block_descriptor_tmp_40_9000;
  __int128 v6 = *((_OWORD *)a1 + 2);
  uint64_t v7 = v4;
  return securityd_send_sync_and_do(0xCu, a2, (uint64_t)v5, 0LL);
}

@end