@interface SecKeychainSyncUpdateMessage
@end

@implementation SecKeychainSyncUpdateMessage

CFTypeRef ___SecKeychainSyncUpdateMessage_block_invoke(void *a1)
{
  if (gSecurityd && (v2 = *(uint64_t (**)(void, void))(gSecurityd + 504)) != 0LL)
  {
    CFTypeRef result = (CFTypeRef)v2(a1[5], a1[6]);
  }

  else
  {
    uint64_t v4 = a1[5];
    v5 = (CFTypeRef *)a1[6];
    CFTypeRef cf = 0LL;
    v11[1] = 3221225472LL;
    v11[2] = __cftype_to_BOOL_cftype_error_request_block_invoke;
    v11[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
    v11[4] = v4;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __cftype_to_BOOL_cftype_error_request_block_invoke_2;
    v10[3] = &__block_descriptor_40_e48_B24__0__NSObject_OS_xpc_object__8_____CFError_16l;
    v10[4] = &cf;
    v11[0] = MEMORY[0x1895F87A8];
    int v6 = securityd_send_sync_and_do(0x12u, v5, (uint64_t)v11, (uint64_t)v10);
    CFTypeRef result = cf;
    if (v6)
    {
      if (!cf || (v7 = CFGetTypeID(cf), TypeID = CFArrayGetTypeID(), CFTypeRef result = cf, v7 != TypeID))
      {
        SecError(-4, (__CFString **)v5, @"Unexpected nonarray returned: %@", result);
        CFTypeRef result = cf;
        if (cf)
        {
          CFTypeRef cf = 0LL;
          CFRelease(result);
          CFTypeRef result = cf;
        }
      }
    }
  }

  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = result;
  return result;
}

@end