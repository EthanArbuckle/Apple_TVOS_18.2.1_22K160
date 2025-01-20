@interface CFPrefsMessageSenderIsSandboxed
@end

@implementation CFPrefsMessageSenderIsSandboxed

uint64_t ___CFPrefsMessageSenderIsSandboxed_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  int v3 = *(unsigned __int8 *)(a2 + 52);
  if (v3 == 255)
  {
    v5 = *(void **)(result + 32);
    size_t length = 0LL;
    data = (__int128 *)xpc_dictionary_get_data(v5, "CFPreferencesAuditToken", &length);
    if (data && length == 32)
    {
      __int128 v7 = data[1];
      __int128 v13 = *data;
      __int128 v14 = v7;
    }

    else
    {
      if (!xpc_dictionary_get_remote_connection(v5))
      {
        value = xpc_dictionary_get_value(v5, "connection");
      }

      xpc_connection_get_audit_token();
    }

    result = sandbox_check_by_audit_token();
    BOOL v8 = (_DWORD)result != 0;
    *(_BYTE *)(a2 + 52) = (_DWORD)result != 0;
  }

  else
  {
    BOOL v8 = v3 == 1;
  }

  *(_BYTE *)(*(void *)(*(void *)(v2 + 40) + 8LL) + 24LL) = v8;
  return result;
}

BOOL ___CFPrefsMessageSenderIsSandboxed_block_invoke_0(uint64_t a1, uint64_t a2)
{
  BOOL result = _CFPrefsMessageSenderIsSandboxedWithLockedClientContext(*(void **)(a1 + 32), a2);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

void ___CFPrefsMessageSenderIsSandboxed_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2_15( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

@end