@interface SecKeychainBackupSyncable
@end

@implementation SecKeychainBackupSyncable

BOOL ___SecKeychainBackupSyncable_block_invoke(uint64_t a1, CFTypeRef *a2)
{
  if (gSecurityd && (v3 = *(uint64_t (**)(void, void, void, CFTypeRef *))(gSecurityd + 120)) != 0LL)
  {
    uint64_t v4 = v3(*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), a2);
  }

  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v11 = 0LL;
    v12 = &v11;
    uint64_t v13 = 0x2000000000LL;
    uint64_t v14 = 0LL;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = __data_data_dict_to_dict_error_request_block_invoke;
    v8[3] = &__block_descriptor_tmp_38_8995;
    __int128 v9 = *(_OWORD *)(a1 + 40);
    uint64_t v10 = v5;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 0x40000000LL;
    v7[2] = __data_data_dict_to_dict_error_request_block_invoke_2;
    v7[3] = &unk_189670C50;
    v7[4] = &v11;
    securityd_send_sync_and_do(0xBu, a2, (uint64_t)v8, (uint64_t)v7);
    uint64_t v4 = v12[3];
    _Block_object_dispose(&v11, 8);
  }

  **(void **)(a1 + 32) = v4;
  return **(void **)(a1 + 32) != 0LL;
}

@end