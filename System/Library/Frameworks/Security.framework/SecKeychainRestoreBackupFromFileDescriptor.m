@interface SecKeychainRestoreBackupFromFileDescriptor
@end

@implementation SecKeychainRestoreBackupFromFileDescriptor

uint64_t ___SecKeychainRestoreBackupFromFileDescriptor_block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 0x40000000LL;
  v4[2] = ___SecKeychainRestoreBackupFromFileDescriptor_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_7_8975;
  int v6 = *(_DWORD *)(a1 + 64);
  __int128 v5 = *(_OWORD *)(a1 + 48);
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = ___SecKeychainRestoreBackupFromFileDescriptor_block_invoke_3;
  v3[3] = &unk_1896708E0;
  v1 = *(CFTypeRef **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  return securityd_send_sync_and_do(0xAu, v1, (uint64_t)v4, (uint64_t)v3);
}

BOOL ___SecKeychainRestoreBackupFromFileDescriptor_block_invoke_2( uint64_t a1,  xpc_object_t xdict,  __CFString **a3)
{
  BOOL result = SecXPCDictionarySetData(xdict, "keybag", *(CFDataRef *)(a1 + 32), a3);
  if (result)
  {
    v7 = *(const __CFData **)(a1 + 40);
    return !v7 || SecXPCDictionarySetData(xdict, "password", v7, a3);
  }

  return result;
}

BOOL ___SecKeychainRestoreBackupFromFileDescriptor_block_invoke_3(uint64_t a1, xpc_object_t xdict)
{
  BOOL result = xpc_dictionary_get_BOOL(xdict, "status");
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

@end