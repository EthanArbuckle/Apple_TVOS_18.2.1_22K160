@interface CFPrefsIsConnectionPlatformBinary
@end

@implementation CFPrefsIsConnectionPlatformBinary

uint64_t ___CFPrefsIsConnectionPlatformBinary_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int v3 = *(unsigned __int8 *)(a2 + 53);
  if (v3 == 255)
  {
    xpc_connection_get_audit_token();
    xpc_connection_get_pid(*(xpc_connection_t *)(v2 + 32));
    result = csops_audittoken();
    if (!(_DWORD)result) {
      *(_BYTE *)(*(void *)(*(void *)(v2 + 40) + 8LL) + 24LL) = 0;
    }
    *(_BYTE *)(a2 + 53) = *(_BYTE *)(*(void *)(*(void *)(v2 + 40) + 8LL) + 24LL);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = v3 != 0;
  }

  return result;
}

@end