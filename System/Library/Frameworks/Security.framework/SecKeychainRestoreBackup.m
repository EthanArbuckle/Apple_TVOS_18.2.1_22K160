@interface SecKeychainRestoreBackup
@end

@implementation SecKeychainRestoreBackup

uint64_t ___SecKeychainRestoreBackup_block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = ___SecKeychainRestoreBackup_block_invoke_2;
  v3[3] = &__block_descriptor_tmp_14_8983;
  __int128 v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t result = SecOSStatusWith((uint64_t)v3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t ___SecKeychainRestoreBackup_block_invoke_2(void *a1, CFTypeRef *a2)
{
  if (gSecurityd && *(void *)(gSecurityd + 64))
  {
    uint64_t v4 = a1[4];
    v8 = *(uint64_t (**)(uint64_t, uint64_t, void, void, CFTypeRef *))(gSecurityd + 64);
    uint64_t v5 = SecSecurityClientGet();
    return v8(v4, v5, a1[5], a1[6], a2);
  }

  else
  {
    uint64_t v7 = a1[4];
    SecSecurityClientGet();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 0x40000000LL;
    v9[2] = __data_client_data_data_to_error_request_block_invoke;
    v9[3] = &__block_descriptor_tmp_35_8985;
    v9[4] = v7;
    __int128 v10 = *(_OWORD *)(a1 + 5);
    return securityd_send_sync_and_do(0xAu, a2, (uint64_t)v9, 0LL);
  }

@end