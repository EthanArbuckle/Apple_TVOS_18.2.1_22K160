@interface CFPrefsGetSuiteContainer
@end

@implementation CFPrefsGetSuiteContainer

void ___CFPrefsGetSuiteContainer_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  Mutable = *(const __CFDictionary **)(a2 + 16);
  if (Mutable)
  {
    Value = (const __CFURL *)CFDictionaryGetValue(Mutable, *(const void **)(a1 + 48));
    if (Value)
    {
      if (Value != (const __CFURL *)&__kCFNull)
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = CFURLGetFileSystemRepresentation( Value,  1u,  *(UInt8 **)(a1 + 56),  *(void *)(a1 + 64)) != 0;
        return;
      }

      goto LABEL_12;
    }
  }

  _CFPrefsGetEntitlementForMessageWithLockedContext(*(void **)(a1 + 32), 0LL, a2);
  v6 = *(const void **)(a2 + 40);
  if (!v6 || (v7 = (const __CFArray *)CFRetain(v6)) == 0LL)
  {
LABEL_12:
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    return;
  }

  v8 = v7;
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    *(void *)(a2 + 16) = Mutable;
  }

  int v9 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v10 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = ___CFPrefsGetSuiteContainer_block_invoke_2;
  v15[3] = &unk_1899EDFC0;
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  v15[4] = *(void *)(a1 + 32);
  v15[5] = v11;
  __int128 v16 = *(_OWORD *)(a1 + 48);
  uint64_t v17 = v12;
  v18 = Mutable;
  if (!(void)v16) {
    ___CFPrefsGetSuiteContainer_block_invoke_cold_1();
  }
  if (v9)
  {
    BOOL v13 = 0;
  }

  else
  {
    uint64_t v20 = 0LL;
    v21 = &v20;
    uint64_t v22 = 0x2020000000LL;
    uint64_t v23 = 0LL;
    CFIndex Count = CFArrayGetCount(v8);
    v19[0] = v10;
    v19[1] = 3221225472LL;
    v19[2] = ___CFPrefsIfClientIsInSecurityApplicationGroup_block_invoke;
    v19[3] = &unk_1899ECEC8;
    v19[4] = &v20;
    v19[5] = v16;
    CFArrayApply((uint64_t)v8, 0LL, Count, (uint64_t)v19);
    if (v21[3]) {
      BOOL v13 = ___CFPrefsGetSuiteContainer_block_invoke_2((uint64_t)v15);
    }
    else {
      BOOL v13 = 0;
    }
    _Block_object_dispose(&v20, 8);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v13;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    CFDictionarySetValue(Mutable, *(const void **)(a1 + 48), &__kCFNull);
  }
  CFRelease(v8);
}

BOOL ___CFPrefsGetSuiteContainer_block_invoke_2(uint64_t a1)
{
  v3 = *(const __CFString **)(a1 + 40);
  v2 = *(const void **)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  remote_connection = xpc_dictionary_get_remote_connection(v4);
  if (!remote_connection)
  {
    value = (_xpc_connection_s *)xpc_dictionary_get_value(v4, "connection");
    if (!value
      || (remote_connection = value,
          value = (_xpc_connection_s *)object_getClass(value),
          value != (_xpc_connection_s *)MEMORY[0x1895F9238]))
    {
      ___CFPrefsGetSuiteContainer_block_invoke_2_cold_1((uint64_t)value, v7, v8);
    }
  }

  xpc_connection_get_euid(remote_connection);
  int v9 = _CFCreateContainerURLForSecurityApplicationIdentifierGroupIdentifierAndUser(v3, v2);
  if (!v9) {
    return 0LL;
  }
  uint64_t v10 = v9;
  int v11 = CFURLGetFileSystemRepresentation(v9, 1u, *(UInt8 **)(a1 + 56), *(void *)(a1 + 64));
  BOOL v12 = v11 != 0;
  if (v11) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 72), *(const void **)(a1 + 48), v10);
  }
  CFRelease(v10);
  return v12;
}

void ___CFPrefsGetSuiteContainer_block_invoke_cold_1()
{
}

void ___CFPrefsGetSuiteContainer_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_32( "_CFPrefsConnectionForMessage",  "CFXPreferences_Internal.h",  a3,  "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

@end