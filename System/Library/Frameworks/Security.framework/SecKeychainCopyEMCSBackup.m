@interface SecKeychainCopyEMCSBackup
@end

@implementation SecKeychainCopyEMCSBackup

uint64_t ___SecKeychainCopyEMCSBackup_block_invoke(uint64_t a1)
{
  if (gSecurityd && (v2 = *(uint64_t (**)(uint64_t, void, void, uint64_t, void))(gSecurityd + 56)) != 0LL)
  {
    uint64_t v3 = SecSecurityClientGet();
    uint64_t result = v2(v3, *(void *)(a1 + 40), 0LL, 1LL, 0LL);
  }

  else
  {
    SecSecurityClientGet();
    uint64_t result = client_data_data_BOOL_to_data_error_request(*(void *)(a1 + 40), 0LL, 1);
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

@end