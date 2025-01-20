@interface CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded
@end

@implementation CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded

void ___CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!*(_BYTE *)(a2 + 54))
  {
    v6 = (void **)(a1 + 32);
    xpc_object_t EntitlementForMessageWithLockedContext = _CFPrefsGetEntitlementForMessageWithLockedContext( *(void **)(a1 + 32),  "com.apple.private.defaults-impersonate",  a2);
    if (!EntitlementForMessageWithLockedContext
      || (v8 = EntitlementForMessageWithLockedContext,
          object_getClass(EntitlementForMessageWithLockedContext) != (Class)MEMORY[0x1895F9228])
      || !xpc_BOOL_get_value(v8))
    {
      if (_CFPrefsMessageSenderIsSandboxedWithLockedClientContext(*v6, a2)) {
        return;
      }
      memset(buffer, 0, 256);
      v9 = *v6;
      size_t length = 0LL;
      data = xpc_dictionary_get_data(v9, "CFPreferencesAuditToken", &length);
      if (data && length == 32)
      {
        __int128 v11 = data[1];
        buffer[16] = *data;
        __int128 v18 = v11;
      }

      else
      {
        if (!xpc_dictionary_get_remote_connection(v9))
        {
          value = xpc_dictionary_get_value(v9, "connection");
        }

        xpc_connection_get_audit_token();
      }

      proc_name(SDWORD1(v18), buffer, 0x100u);
      v15 = (os_log_s *)_CFPrefsDaemonLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        ___CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded_block_invoke_cold_1( (uint64_t)buffer,  (void **)(a1 + 32),  v15);
      }
    }
  }

  xpc_dictionary_set_data( *(xpc_object_t *)(a1 + 32),  "CFPreferencesAuditToken",  *(const void **)(a1 + 40),  *(void *)(a1 + 48));
  if (!*(_BYTE *)(a2 + 54))
  {
    v4 = *(void **)(a2 + 32);
    if (v4)
    {
      *(void *)(a2 + 32) = 0LL;
      xpc_release(v4);
    }

    v5 = *(const void **)(a2 + 40);
    if (v5)
    {
      *(void *)(a2 + 40) = 0LL;
      CFRelease(v5);
    }

    *(_BYTE *)(a2 + 54) = 1;
  }

void ___CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded_block_invoke_cold_1( uint64_t a1,  void **a2,  os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v5 = _CFPrefsPIDForMessage(*a2);
  int v6 = 136446466;
  uint64_t v7 = a1;
  __int16 v8 = 1026;
  int v9 = v5;
  _os_log_fault_impl( &dword_180A4C000,  a3,  OS_LOG_TYPE_FAULT,  "Allowing process impersonation by process %{public}s (%{public}d) despite not having the com.apple.private.defaults- impersonate entitlement due to it not being sandboxed. Please add com.apple.private.defaults-impersonate instead, th is will stop working in the future.",  (uint8_t *)&v6,  0x12u);
}

void ___CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded_block_invoke_cold_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  OUTLINED_FUNCTION_0_32( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

@end