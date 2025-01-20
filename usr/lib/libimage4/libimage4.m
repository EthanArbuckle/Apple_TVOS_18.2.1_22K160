uint64_t _boot_ephemeral_enforceable(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t name;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  v4 = *(void *)(a2 + 16);
  result = odometer_policy_get_chip_property(a1, v4);
  if (!result)
  {
    v25 = *(void *)a2;
    name = chip_get_name(*(void *)(a2 + 16));
    v24 = 1LL;
    expert_log(v25, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v27, v28, v29, v30, v31, name);
    return v24;
  }

  if (*(void *)(v4 + 208))
  {
    if (manifest_get_restore_info(*(void *)(a2 + 8), v6, v7, v8, v9, v10, v11, v12))
    {
      v17 = *(void *)a2;
      v42 = chip_get_name(*(void *)(a2 + 16));
      v23 = "odometer[%s:%s]: boot object has restore info";
    }

    else if (*(_WORD *)(a2 + 960))
    {
      if (*(_WORD *)(a2 + 864))
      {
        v32 = odometer_enforce_property( (uint64_t *)a2,  a1,  *(void *)(v4 + 208),  (unsigned __int8 *)(a2 + 760),  v13,  v14,  v15,  v16);
        v17 = *(void *)a2;
        v33 = chip_get_name(*(void *)(a2 + 16));
        if (!v32)
        {
          expert_log(v17, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v18, v19, v20, v21, v22, v33);
          return 0LL;
        }

        v42 = v33;
        v23 = "odometer[%s:%s]: switch constraint not satisfied";
      }

      else
      {
        v17 = *(void *)a2;
        v42 = chip_get_name(*(void *)(a2 + 16));
        v23 = "odometer[%s:%s]: no manifest constraint for policy selection";
      }
    }

    else
    {
      v17 = *(void *)a2;
      v42 = chip_get_name(*(void *)(a2 + 16));
      v23 = "odometer[%s:%s]: manifest has no constraint for policy";
    }

    v24 = 1LL;
    expert_log(v17, 1uLL, (uint64_t)v23, v18, v19, v20, v21, v22, v42);
    return v24;
  }

  if (v4 < v4 + 264)
  {
    v34 = chip_get_name(v4);
    __panic_npx("panic: illegal chip configuration: %s", v35, v36, v37, v38, v39, v40, v41, v34);
  }

  __break(0x5519u);
  return result;
}

uint64_t _boot_ephemeral_enforce(uint64_t a1, uint64_t a2)
{
  v62[3] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)a2;
  uint64_t chip_property = odometer_policy_get_chip_property(a1, *(void *)(a2 + 16));
  if (!*(_WORD *)(a2 + 960)) {
    __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v59);
  }
  uint64_t v13 = chip_property;
  v14 = *(void **)(a2 + 16);
  uint64_t v15 = *(unsigned int *)(a2 + 872);
  memset(v62, 0, 24);
  memset(v61, 0, sizeof(v61));
  memset(v60, 0, sizeof(v60));
  uint64_t live_nonce = odometer_query_live_nonce(a2, a1, v15, v62, v9, v10, v11, v12);
  if ((_DWORD)live_nonce)
  {
    uint64_t v17 = live_nonce;
    uint64_t v18 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v18, 0LL, (uint64_t)"odometer[%s:%s]: failed to query nonce: %d", v20, v21, v22, v23, v24, name);
  }

  else
  {
    uint64_t v32 = expert_entangle_nonce(v4, (uint64_t)v14, v15, (uint64_t)v62, (uint64_t)v61);
    if ((_DWORD)v32)
    {
      uint64_t v17 = v32;
      uint64_t v33 = *(void *)a2;
      uint64_t v34 = chip_get_name(*(void *)(a2 + 16));
      expert_log(v33, 0LL, (uint64_t)"odometer[%s:%s]: failed to entangle nonce: %d", v35, v36, v37, v38, v39, v34);
    }

    else
    {
      odometer_compute_nonce_hash(v4, v14, (uint64_t)v61, (uint64_t)v60);
      if (!property_constrain_digest(v13, v4, a2 + 880, (unint64_t)v60, v40, v41, v42, v43))
      {
        uint64_t v52 = *(void *)a2;
        uint64_t v53 = chip_get_name(*(void *)(a2 + 16));
        expert_log(v52, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is current", v54, v55, v56, v57, v58, v53);
        return 0LL;
      }

      uint64_t v17 = *(unsigned int *)(a1 + 24);
      uint64_t v44 = *(void *)a2;
      uint64_t v45 = chip_get_name(*(void *)(a2 + 16));
      expert_log(v44, 0LL, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v46, v47, v48, v49, v50, v45);
    }
  }

  return v17;
}

void __panic_npx( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  uint64_t v11 = &a9;
  vsnprintf(__str, 0x800uLL, a1, &a9);
  _os_crash();
  __break(1u);
}

unint64_t darwin_read_iokit_node(io_registry_entry_t a1, const char *a2, void *a3, size_t *a4)
{
  unint64_t v7 = *a4;
  uint64_t v8 = CFStringCreateWithCString(0LL, a2, 0x8000100u);
  if (!v8) {
    return 12LL;
  }
  uint64_t v9 = v8;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a1, v8, 0LL, 0);
  if (!CFProperty)
  {
    uint64_t v14 = 2LL;
LABEL_10:
    CFRelease(v9);
    return v14;
  }

  uint64_t v11 = CFProperty;
  CFTypeID v12 = CFGetTypeID(CFProperty);
  if (v12 != CFDataGetTypeID())
  {
    uint64_t v14 = 96LL;
    goto LABEL_9;
  }

  unint64_t Length = CFDataGetLength(v11);
  if (HIDWORD(Length))
  {
    uint64_t v14 = 34LL;
LABEL_9:
    CFRelease(v11);
    goto LABEL_10;
  }

  size_t v16 = Length;
  if (v7 < Length)
  {
    uint64_t v14 = 84LL;
    goto LABEL_9;
  }

  unint64_t result = (unint64_t)CFDataGetBytePtr(v11);
  if (result <= result + v7 && v16 <= *a4)
  {
    unint64_t result = (unint64_t)memcpy(a3, (const void *)result, v16);
    if (v16 <= *a4)
    {
      uint64_t v14 = 0LL;
      *a4 = v16;
      goto LABEL_9;
    }
  }

  __break(0x5519u);
  return result;
}

unint64_t darwin_read_iokit_BOOL(io_registry_entry_t a1, const char *a2, BOOL *a3)
{
  char v4 = (char)a2;
  int v15 = 0;
  size_t v14 = 4LL;
  unint64_t result = darwin_read_iokit_node(a1, a2, &v15, &v14);
  BOOL v13 = 0;
  if ((_DWORD)result != 2)
  {
    if ((_DWORD)result) {
      __panic_npx("panic: failed to read property: %s: %d", v6, v7, v8, v9, v10, v11, v12, v4);
    }
    BOOL v13 = v15 != 0;
  }

  *a3 = v13;
  return result;
}

unint64_t darwin_read_iokit_u32(io_registry_entry_t a1, const char *a2, _DWORD *a3)
{
  char v4 = (char)a2;
  int v15 = 0;
  size_t v14 = 4LL;
  unint64_t result = darwin_read_iokit_node(a1, a2, &v15, &v14);
  int v13 = 0;
  if ((_DWORD)result != 2)
  {
    if ((_DWORD)result) {
      __panic_npx("panic: failed to read property: %s: %d", v6, v7, v8, v9, v10, v11, v12, v4);
    }
    int v13 = v15;
  }

  *a3 = v13;
  return result;
}

unint64_t darwin_read_iokit_u64(io_registry_entry_t a1, const char *a2, void *a3)
{
  char v4 = (char)a2;
  size_t v14 = 8LL;
  uint64_t v15 = 0LL;
  unint64_t result = darwin_read_iokit_node(a1, a2, &v15, &v14);
  uint64_t v13 = 0LL;
  if ((_DWORD)result != 2)
  {
    if ((_DWORD)result) {
      __panic_npx("panic: failed to read property: %s: %d", v6, v7, v8, v9, v10, v11, v12, v4);
    }
    uint64_t v13 = v15;
  }

  *a3 = v13;
  return result;
}

size_t darwin_read_iokit_cstr(io_registry_entry_t a1, const char *a2, char *a3)
{
  char v4 = (char)a2;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  *(_OWORD *)__source = 0u;
  __int128 v15 = 0u;
  size_t v13 = 64LL;
  size_t result = darwin_read_iokit_node(a1, a2, __source, &v13);
  if ((_DWORD)result == 2)
  {
    *a3 = 0;
  }

  else
  {
    if ((_DWORD)result) {
      __panic_npx("panic: failed to read property: %s: %d", v6, v7, v8, v9, v10, v11, v12, v4);
    }
    return strlcpy(a3, __source, 0x40uLL);
  }

  return result;
}

uint64_t _null_enforceable(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t name = chip_get_name(a2[2]);
  expert_log(v2, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v4, v5, v6, v7, v8, name);
  return 0LL;
}

uint64_t _null_enforce(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

void _prepare(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(*(void *)a3 + 24LL);
  uint64_t v5 = *(void *)(v4 + 8);
  memset(v14, 0, sizeof(v14));
  size_t __n = 0LL;
  memset(v13, 0, sizeof(v13));
  uint64_t nonce_digest = image4_environment_callout_query_nonce_digest(v4, (uint64_t)v14, (uint64_t)&__n);
  if ((_DWORD)nonce_digest)
  {
    if ((_DWORD)nonce_digest != 45) {
      expert_log(v5, 0LL, (uint64_t)"failed to get nonce digest from callback: %d", v7, v8, v9, v10, v11, nonce_digest);
    }
  }

  else if (__n > 0x40)
  {
    __break(0x5519u);
  }

  else
  {
    digest_init((uint64_t)v13, v14, __n, v7, v8, v9, v10, v11);
    odometer_prepare_nonce_hash(a2, (uint64_t)v13);
  }
}

uint64_t _get_constraint_mask()
{
  return 0LL;
}

uint64_t _extract_payload()
{
  return 0LL;
}

uint64_t _chain_future_enforceable(uint64_t a1, uint64_t a2)
{
  if (odometer_policy_get_chip_property(a1, *(void *)(a2 + 16)))
  {
    int v3 = *(unsigned __int16 *)(a2 + 528);
    uint64_t v4 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    if (v3)
    {
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, name);
      return 0LL;
    }

    else
    {
      uint64_t v11 = 1LL;
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: no caller-supplied boot manifest hash", v6, v7, v8, v9, v10, name);
    }
  }

  else
  {
    uint64_t v12 = *(void *)a2;
    uint64_t v13 = chip_get_name(*(void *)(a2 + 16));
    uint64_t v11 = 1LL;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, v13);
  }

  return v11;
}

uint64_t _chain_future_enforce(uint64_t a1, uint64_t a2)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unint64_t v6 = *(void *)(a2 + 16);
  uint64_t chip_property = odometer_policy_get_chip_property(a1, v6);
  memset(v44, 0, sizeof(v44));
  if (!*(_WORD *)(a2 + 528)) {
    __panic_npx("panic: optional not set", v8, v9, v10, v11, v12, v13, v14, v43);
  }
  uint64_t v15 = chip_property;
  manifest_measure(v5, v6, (uint64_t)v44);
  if (property_constrain_digest(v15, v4, (unint64_t)v44, a2 + 448, v16, v17, v18, v19))
  {
    uint64_t v20 = *(unsigned int *)(a1 + 24);
    uint64_t v21 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v21, 0LL, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v23, v24, v25, v26, v27, name);
  }

  else
  {
    uint64_t v35 = *(void *)a2;
    uint64_t v36 = chip_get_name(*(void *)(a2 + 16));
    expert_log( v35,  1uLL,  (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain",  v37,  v38,  v39,  v40,  v41,  v36);
    return 0LL;
  }

  return v20;
}

char *property_get_from_identifier(char *result)
{
  v1 = &property_get_from_identifier_p_map[(void)result];
  if (v1 < &_property_stng && v1 >= property_get_from_identifier_p_map) {
    return *v1;
  }
  __break(0x5519u);
  return result;
}

uint64_t image4_environment_resolve(uint64_t a1)
{
  return image4_coprocessor_select(*(void *)(a1 + 16), 0LL, a1);
}

unint64_t image4_environment_get_secure_boot( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v18 = 0LL;
  unint64_t result = *(void *)(a1 + 40);
  if (result >= 5) {
    __panic_npx("panic: invalid secure boot level: actual = %llu, expected <= %llu", a2, a3, a4, a5, a6, a7, a8, result);
  }
  if (result == 4)
  {
    int secure_boot = expert_get_secure_boot(*(void *)(a1 + 8), (uint64_t)&v18);
    if (secure_boot) {
      __panic_npx("panic: failed to get secure boot level: %d", v11, v12, v13, v14, v15, v16, v17, secure_boot);
    }
    return v18;
  }

  return result;
}

unint64_t image4_environment_get_nonce_domain(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  unsigned int v13 = 0;
  unint64_t result = *(unsigned int *)(a1 + 48);
  if ((_DWORD)result == -1)
  {
    unint64_t result = image4_coprocessor_select(*(void *)(a1 + 16), 0LL, a1);
    if (!result) {
      __panic_npx("panic: could not resolve chip for environment", v4, v5, v6, v7, v8, v9, v10, v12);
    }
    uint64_t v11 = *(void *)(result + 200);
    if (v11)
    {
      if (result >= result + 264)
      {
        __break(0x5519u);
      }

      else if (expert_query_property_uint32(v2, result, v11, &v13))
      {
        return 0xFFFFFFFFLL;
      }

      else
      {
        return v13;
      }
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t image4_environment_callout_query_boot_nonce(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 56);
  else {
    return 45LL;
  }
}

uint64_t image4_environment_callout_query_nonce_digest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 56);
  else {
    return 45LL;
  }
}

uint64_t _image4_environment_init( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 == 0xFFFF) {
    __panic_npx("panic: null coprocessor handle", a2, 0xFFFFLL, a4, a5, a6, a7, a8, v12);
  }
  if (a3 >= 0xC) {
    __panic_npx("panic: invalid coprocessor handle: actual = %llu, expected < %u", a2, a3, a4, a5, a6, a7, a8, a3);
  }
  if ((_DWORD)a4) {
    __panic_npx("panic: unsupported struct version: actual = %hu, expected <= %u", a2, a3, a4, a5, a6, a7, a8, a4);
  }
  *(void *)(a1 + 64) = 0LL;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 8) = generic_expert_current();
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = 4LL;
  *(_DWORD *)(a1 + 48) = -1;
  *(void *)(a1 + 24) = a3;
  return a1;
}

uint64_t image4_environment_new(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = generic_expert_current();
  uint64_t result = _expert_alloc_type(v4, (uint64_t)&_image4_type_environment);
  if (result)
  {
    uint64_t result = _image4_environment_init(result, a1, a2, 0LL, v6, v7, v8, v9);
    *(void *)(result + 32) = &_image4_type_environment;
  }

  return result;
}

uint64_t image4_environment_set_secure_boot( uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 > 3) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"secure_boot");
  }
  *(void *)(result + 40) = a2;
  return result;
}

uint64_t image4_environment_set_nonce_domain(uint64_t result, int a2)
{
  *(_DWORD *)(result + 48) = a2;
  return result;
}

uint64_t image4_environment_set_callbacks(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 56) = a2;
  *(void *)(result + 64) = a3;
  return result;
}

uint64_t image4_environment_identify(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  uint64_t v2 = generic_expert_current();
  __int128 v30 = xmmword_18A3B0818;
  uint64_t v31 = -1LL;
  uint64_t v3 = image4_coprocessor_select(*(void *)(a1 + 16), 0LL, a1);
  if (!v3) {
    __panic_npx("panic: could not resolve chip for environment", v4, v5, v6, v7, v8, v9, v10, v28);
  }
  uint64_t v11 = v3;
  uint64_t result = (uint64_t)property_iterator_next((uint64_t)&v30, v4, v5, v6, v7, v8, v9, v10);
  if (result)
  {
    uint64_t v13 = result;
    memset(v29, 170, sizeof(v29));
    do
    {
      uint64_t v32 = 0LL;
      __int128 v35 = v29[3];
      __int128 v36 = v29[2];
      __int128 v37 = v29[1];
      __int128 v38 = v29[0];
      *(_OWORD *)__s = xmmword_1894E6350;
      __int128 v34 = xmmword_1894E6360;
      unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t constraint = chip_get_constraint(v11, v13, 0LL);
      uint64_t v22 = image4_identifier_init(&v32, constraint);
      if (constraint != *(void *)(v11 + 200) || *(_DWORD *)(a1 + 48) == -1)
      {
        switch(**(void **)(constraint + 40))
        {
          case 0LL:
            goto LABEL_27;
          case 1LL:
            goto LABEL_27;
          case 2LL:
            goto LABEL_27;
          case 3LL:
            goto LABEL_27;
          case 4LL:
            goto LABEL_27;
          default:
            __panic_npx( "panic: version property iterated during identification: p = %s, fourcc = %s",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  *(void *)constraint);
        }
      }

      *(_DWORD *)__s = *(_DWORD *)(a1 + 48);
LABEL_15:
      uint64_t v23 = *(void **)(a1 + 56);
      if (v23)
      {
        switch(**(void **)(*v22 + 40LL))
        {
          case 0LL:
            uint64_t v24 = (void (*)(uint64_t, void *, void, void))v23[3];
            if (v24) {
              v24(a1, v22, __s[0], *(void *)(a1 + 64));
            }
            break;
          case 1LL:
            uint64_t v25 = (void (*)(uint64_t, void *, uint64_t, void))v23[4];
            if (!v25) {
              break;
            }
            uint64_t v26 = *(unsigned int *)__s;
            goto LABEL_23;
          case 2LL:
            uint64_t v25 = (void (*)(uint64_t, void *, uint64_t, void))v23[4];
            if (!v25) {
              break;
            }
            uint64_t v26 = *(void *)__s;
LABEL_23:
            v25(a1, v22, v26, *(void *)(a1 + 64));
            break;
          case 4LL:
            uint64_t v27 = (void (*)(uint64_t, void *, char *, uint64_t, void))v23[5];
            if (!v27) {
              break;
            }
            uint64_t result = strlen(__s);
            if (result < 1)
            {
              __break(0x5519u);
              return result;
            }

            v27(a1, v22, __s, v37 + 1, *(void *)(a1 + 64));
            break;
          default:
            __panic_npx( "panic: unreachable case: %s = 0x%llx",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  (char)"id4->id_p->p_type->pt_switchable");
        }
      }

LABEL_27:
      uint64_t result = (uint64_t)property_iterator_next((uint64_t)&v30, v15, v16, v17, v18, v19, v20, v21);
      uint64_t v13 = result;
    }

    while (result);
  }

  return result;
}

  uint64_t v56 = type_get_size((uint64_t)&_image4_type_odometer);
  v64 = MEMORY[0x1895F8858](v56, v57, v58, v59, v60, v61, v62, v63);
  uint64_t v54 = (char *)&v112 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v64 >= 0x3D1) {
    v65 = v64 - 976;
  }
  else {
    v65 = 0LL;
  }
  memset(v54 + 976, 170, v65);
  bzero(v54, 0x3D0uLL);
  uint64_t v55 = "stack";
LABEL_31:
  expert_log(*a1, 1uLL, (uint64_t)"odometer allocated on %s", v49, v50, v51, v52, v53, (uint64_t)v55);
  odometer_init((uint64_t)v54, *a1, (uint64_t)a1, a2);
  v67 = v66;
  v116 = v66;
  v75 = odometer_prepare(v66, v68, v69, v70, v71, v72, v73, v74);
  if ((_DWORD)v75)
  {
    v83 = v75;
    expert_log(*a1, 0LL, (uint64_t)"failed to prepare anti-replay: %d", v78, v79, v80, v81, v82, v75);
    v84 = v83;
    goto LABEL_44;
  }

  if (v9 && *(void *)(v9 + 32))
  {
    expert_log(*a1, 2uLL, (uint64_t)"calling out to manifest prepare function", v78, v79, v80, v81, v82, v112);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 32))(a1, v67, a1[2]);
  }

  *((void *)v26 + 5) = v114;
  v86 = *a1;
  if (*a5 != _manifest_validate_property && *a5 != _manifest_audit_property) {
    __panic_npx("panic: unreachable", v76, v77, v78, v79, v80, v81, v82, v112);
  }
  chip_get_name(a2);
  expert_log( v86,  1uLL,  (uint64_t)"performing trust evaluation: type = %s %s, chip = %s, chip type = 0x%llx, chip expert = %s, payload = %s",  v87,  v88,  v89,  v90,  v91,  (uint64_t)v10);
  if (((unsigned int (*)(uint64_t *, void *, char *))v117)(a1, v114, v26))
  {
    v97 = v118;
    expert_log(*a1, 0LL, (uint64_t)"trust evaluation failed: %d", v92, v93, v94, v95, v96, v118);
LABEL_43:
    v84 = v97;
    goto LABEL_44;
  }

  v97 = odometer_enforce((unint64_t)v116);
  v103 = *a1;
  if ((_DWORD)v97)
  {
    expert_log(v103, 0LL, (uint64_t)"manifest replay denied: %d", v98, v99, v100, v101, v102, v97);
    goto LABEL_43;
  }

  expert_log(v103, 2uLL, (uint64_t)"trust evaluation succeeded; manifest is live", v98, v99, v100, v101, v102, v112);
  v84 = 0LL;
LABEL_44:
  _expert_dealloc_type(v8, (uint64_t)&_image4_type_decode_context, &v112);
  _expert_dealloc_type(v8, (uint64_t)&_image4_type_odometer, &v113);
  return v84;
}

uint64_t image4_environment_get_digest_info(uint64_t a1)
{
  uint64_t v1 = image4_coprocessor_select(*(void *)(a1 + 16), 0LL, a1);
  if (!v1) {
    __panic_npx("panic: could not resolve chip for environment", v2, v3, v4, v5, v6, v7, v8, vars0);
  }
  return (*(uint64_t (**)(void))(v1 + 48))();
}

uint64_t *image4_environment_destroy(uint64_t *result)
{
  if (*result) {
    return (uint64_t *)_expert_dealloc_type(*(void *)(*result + 8), *(void *)(*result + 32), result);
  }
  return result;
}

uint64_t _BootPolicyClosureComputeDigest( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(unint64_t ***)(*(void *)(a5 + 32) + 16LL);
  if (*v9 > a4) {
    __panic_npx_0((uint64_t)v9, a2, a1, a4, a5, a6, a7, a8, a4);
  }
  ccdigest();
  return 0LL;
}

uint64_t _BootPolicyClosureVerifyChain()
{
  return 0LL;
}

uint64_t _BootPolicyClosureVerifySignature()
{
  return 0LL;
}

uint64_t _BootPolicyClosureEvaluateCertificateProperties()
{
  return 0LL;
}

void __panic_npx_0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  uint64_t v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: digest buffer overflow: actual = %lu, expected >= %lu", &a9);
  _os_crash();
  __break(1u);
}

uint64_t _BootPolicyClosureComputeDigest_0( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(unint64_t ***)(*(void *)(a5 + 32) + 16LL);
  if (*v9 > a4) {
    __panic_npx_0((uint64_t)v9, a2, a1, a4, a5, a6, a7, a8, a4);
  }
  ccdigest();
  return 0LL;
}

uint64_t _BootPolicyClosureVerifyChain_0()
{
  return 0LL;
}

uint64_t _BootPolicyClosureVerifySignature_0()
{
  return 0LL;
}

uint64_t _BootPolicyClosureEvaluateCertificateProperties_0()
{
  return 0LL;
}

void _prepare_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v29[2] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(*(void *)a3 + 24LL);
  uint64_t v5 = *(void *)(v4 + 8);
  v29[0] = 0LL;
  v29[1] = 0LL;
  size_t v24 = 0LL;
  size_t __n = 0LL;
  memset(v28, 0, sizeof(v28));
  memset(v27, 0, sizeof(v27));
  memset(v26, 0, sizeof(v26));
  uint64_t boot_nonce = image4_environment_callout_query_boot_nonce(v4, (uint64_t)v29, (uint64_t)&__n);
  if (!(_DWORD)boot_nonce)
  {
    if (__n <= 0x10)
    {
      nonce_init(v28, v29, __n, v7, v8, v9, v10, v11);
      odometer_prepare_nonce(a2, v28, v18, v19, v20, v21, v22, v23);
      return;
    }

    goto LABEL_12;
  }

  if ((_DWORD)boot_nonce != 45)
  {
    expert_log(v5, 0LL, (uint64_t)"failed to get boot nonce from callback: %d", v7, v8, v9, v10, v11, boot_nonce);
    return;
  }

  uint64_t nonce_digest = image4_environment_callout_query_nonce_digest(v4, (uint64_t)v27, (uint64_t)&v24);
  if ((_DWORD)nonce_digest != 45)
  {
    if (!(_DWORD)nonce_digest)
    {
      if (v24 <= 0x40)
      {
        digest_init((uint64_t)v26, v27, v24, v13, v14, v15, v16, v17);
        odometer_prepare_nonce_hash(a2, (uint64_t)v26);
        return;
      }

LABEL_12:
      __break(0x5519u);
      return;
    }

    expert_log(v5, 0LL, (uint64_t)"failed to get nonce digest from callback: %d", v13, v14, v15, v16, v17, nonce_digest);
  }

  expert_log(a1, 2uLL, (uint64_t)"queried property: %s => 0x%x", v15, v16, v17, v18, v19, a3 + 28);
LABEL_13:
  uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, unsigned __int8 *))(a3 + 88);
  memset(v45, 0, sizeof(v45));
  uint64_t v44 = 0u;
  char v43 = 0u;
  qmemcpy(__str, "n/a", sizeof(__str));
  uint64_t v41 = v40;
  else {
    __int128 v30 = v29;
  }
  if ((_DWORD)v20 != 2)
  {
    if ((_DWORD)v20) {
      goto LABEL_22;
    }
    __int128 v30 = *(uint64_t (**)(uint64_t, uint64_t, unsigned __int8 *))(a3 + 96);
    snprintf(__str, 0x40uLL, "0x%x", v40);
  }

  if (v30)
  {
    uint64_t v31 = v30(a3, a2, &v41);
    if ((_DWORD)v31)
    {
      __int128 v37 = v31;
      expert_log(a1, 1uLL, (uint64_t)"transform not applied: p = %s, kind = %s: %d", v32, v33, v34, v35, v36, a3 + 28);
      uint64_t v20 = v37;
      goto LABEL_23;
    }

    expert_log( a1,  2uLL,  (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => 0x%x], error = [%d => %d]",  v32,  v33,  v34,  v35,  v36,  a3 + 28);
    __int128 v38 = v41;
LABEL_27:
    uint64_t v20 = 0LL;
    *a4 = v38;
    return v20;
  }

  expert_log(a1, 2uLL, (uint64_t)"queried property: %s => 0x%x", v15, v16, v17, v18, v19, a3 + 28);
LABEL_13:
  uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, int *))(a3 + 88);
  memset(v45, 0, sizeof(v45));
  uint64_t v44 = 0u;
  char v43 = 0u;
  qmemcpy(__str, "n/a", sizeof(__str));
  uint64_t v41 = v40;
  else {
    __int128 v30 = v29;
  }
  if ((_DWORD)v20 != 2)
  {
    if ((_DWORD)v20) {
      goto LABEL_22;
    }
    __int128 v30 = *(uint64_t (**)(uint64_t, uint64_t, int *))(a3 + 96);
    snprintf(__str, 0x40uLL, "0x%x", v40);
  }

  if (v30)
  {
    uint64_t v31 = v30(a3, a2, &v41);
    if ((_DWORD)v31)
    {
      __int128 v37 = v31;
      expert_log(a1, 1uLL, (uint64_t)"transform not applied: p = %s, kind = %s: %d", v32, v33, v34, v35, v36, a3 + 28);
      uint64_t v20 = v37;
      goto LABEL_23;
    }

    expert_log( a1,  2uLL,  (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => 0x%x], error = [%d => %d]",  v32,  v33,  v34,  v35,  v36,  a3 + 28);
    __int128 v38 = v41;
LABEL_27:
    uint64_t v20 = 0LL;
    *a4 = v38;
    return v20;
  }

  expert_log(a1, 2uLL, (uint64_t)"queried property: %s => 0x%llx", v15, v16, v17, v18, v19, a3 + 28);
LABEL_13:
  uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a3 + 88);
  memset(v45, 0, sizeof(v45));
  uint64_t v44 = 0u;
  char v43 = 0u;
  qmemcpy(__str, "n/a", sizeof(__str));
  uint64_t v41 = v40;
  else {
    __int128 v30 = v29;
  }
  if ((_DWORD)v20 != 2)
  {
    if ((_DWORD)v20) {
      goto LABEL_22;
    }
    __int128 v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a3 + 96);
    snprintf(__str, 0x40uLL, "0x%llx", v40);
  }

  if (v30)
  {
    uint64_t v31 = v30(a3, a2, &v41);
    if ((_DWORD)v31)
    {
      __int128 v37 = v31;
      expert_log(a1, 1uLL, (uint64_t)"transform not applied: p = %s, kind = %s: %d", v32, v33, v34, v35, v36, a3 + 28);
      uint64_t v20 = v37;
      goto LABEL_23;
    }

    expert_log( a1,  2uLL,  (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => 0x%llx], error = [%d => %d]",  v32,  v33,  v34,  v35,  v36,  a3 + 28);
    __int128 v38 = v41;
LABEL_27:
    uint64_t v20 = 0LL;
    *a4 = v38;
    return v20;
  }

    __break(0x5519u);
    return result;
  }

  if (v8 >= v23) {
    goto LABEL_12;
  }
  uint64_t result = _manifest_impose_property(v8, result, v9, a2, v7);
  if ((_DWORD)result)
  {
    *(_DWORD *)(v7 + 64) = result;
    expert_log( *v8,  0LL,  (uint64_t)"object property failed to impose on environment: %d",  v24,  v25,  v26,  v27,  v28,  result);
    return 3LL;
  }

      __break(0x5519u);
      return;
    }

    expert_log(v5, 0LL, (uint64_t)"failed to get nonce digest from callback: %d", v13, v14, v15, v16, v17, nonce_digest);
  }

        *(_OWORD *)v81 = *v30;
        uint64_t v31 = v16;
        uint64_t v32 = DERImg4DecodeProperty(v16, v84, (uint64_t)&v75);
        if ((_DWORD)v32)
        {
          v67 = v32;
          _auerr(v8, v32, "DERImg4DecodeProperty: %d", v33, v34, v35, v36, v37, v32);
          return v67;
        }

        if (*((void *)&v77 + 1) != 0x2000000000000011LL)
        {
          _auerr( v8,  0LL,  "unexpected certificate dictionary type: actual = 0x%llx, expected = 0x%llx",  v33,  v34,  v35,  v36,  v37,  SBYTE8(v77));
          return 2LL;
        }

        __int128 v38 = DERDecodeSeqContentInit((unint64_t *)&v76 + 1, v74);
        if ((_DWORD)v38)
        {
          v67 = (uint64_t)v38;
          _auerr(v8, (uint64_t)v38, "DERDecodeSeqContentInit: %d", v39, v40, v41, v42, v43, (char)v38);
          return v67;
        }

        while (1)
        {
          uint64_t v44 = DERDecodeSeqNext(v74, (unint64_t *)&v78);
          if (v44)
          {
            uint64_t v16 = v31;
            if (v44 != 1) {
              __panic_npx("panic: bogus exit from enforcement loop: pdr = %d", v45, v46, v47, v48, v49, v50, v51, v44);
            }
            goto LABEL_7;
          }

          memset(v70, 0, sizeof(v70));
          fourcc_init((uint64_t)&v82, v78);
          uint64_t v52 = DERImg4DecodeProperty(&v79, v78, (uint64_t)v72);
          if ((_DWORD)v52) {
            goto LABEL_33;
          }
          uint64_t v58 = *((void *)&v73 + 1) == 0xA000000000000001LL;
          DERImg4DecodeContentFindItemWithTag(v81, v78, &__s2);
          if (v64 != v58) {
            break;
          }
          if (*((void *)&v73 + 1) <= 4uLL && ((1LL << SBYTE8(v73)) & 0x16) != 0)
          {
            uint64_t v52 = DERImg4DecodeProperty(&__s2, v78, (uint64_t)v70);
            if ((_DWORD)v52)
            {
LABEL_33:
              v67 = v52;
              _auerr(v8, v52, "DERImg4DecodeProperty: %s: %d", v53, v54, v55, v56, v57, (char)&v82 + 4);
              return v67;
            }

            else {
              aupost(v8, (uint64_t)&v82, 1LL, (uint64_t)v72, (uint64_t)v70, v55, v56, v57);
            }
          }

          else
          {
            if ((unint64_t)(*((void *)&v73 + 1) + 0x6000000000000000LL) >= 2)
            {
              _auerr( v8,  0LL,  "unexpected certificate property type: tag = %s, type = 0x%llx",  v59,  v60,  v61,  v62,  v63,  (char)&v82 + 4);
              return 2LL;
            }

            v65 = v8;
            v66 = 0LL;
LABEL_27:
            aupost(v65, (uint64_t)&v82, v66, (uint64_t)v72, 0LL, v61, v62, v63);
          }
        }

        v65 = v8;
        v66 = 1LL;
        goto LABEL_27;
      case 0xE00000006D616E78LL:
        _auerr(v8, 0LL, "manx section constraints not implemented", v25, v26, v27, v28, v29, v69);
        return 4LL;
    }
  }

  _auerr(v8, 0LL, "unexpected section tag: %s", v25, v26, v27, v28, v29, (char)&v82 + 4);
  return 2LL;
}

  __break(0x5519u);
  return result;
}

  uint64_t v11 = v14 - 0x5555555555555556LL;
  if (v14 > v14 - 0x5555555555555556LL || v11 > v13) {
    goto LABEL_30;
  }
  if (v11 == v13)
  {
    if (a3)
    {
      *a3 = 0LL;
      a3[1] = 0LL;
    }
  }

  else if (a3)
  {
    *a3 = v11;
    a3[1] = v13 - v11;
  }

  if (v13 > v15 || v14 > v13) {
    goto LABEL_30;
  }
  *a4 = 0LL;
  a4[1] = 0LL;
  if (v13 == v15) {
    return 0LL;
  }
  else {
    return 655365LL;
  }
}

    __break(0x5519u);
  }

  return result;
}

void *_get_constraint_mask_0()
{
  return &_sign_constraints;
}

uint64_t _extract_payload_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  int v7 = *(unsigned __int16 *)(a3 + 528);
  memset(&v12[3], 0, 32);
  if (v7) {
    unint64_t v8 = a3 + 528;
  }
  else {
    unint64_t v8 = 0LL;
  }
  memset(&v12[1], 0, 32);
  if (v7) {
    uint64_t v9 = a3 + 72;
  }
  else {
    uint64_t v9 = 0LL;
  }
  v12[0] = 0uLL;
  uint64_t v10 = manifest_measure(a3, a2, (uint64_t)v12);
  *a5 = *(void *)(*(uint64_t (**)(uint64_t))(a2 + 48))(v10);
  if (v9 + 456 > v8) {
    __break(0x5519u);
  }
  return v9 + 328;
}

void *nonce_init( void *a1, const void *a2, size_t __n, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (__n >= 0x11) {
    __panic_npx("panic: nonce too large: actual = %lu, expected <= %ld", (uint64_t)a2, __n, a4, a5, a6, a7, a8, __n);
  }
  memcpy(a1, a2, __n);
  a1[2] = __n;
  return a1;
}

void *nonce_init_copy( void *result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = a2[2];
  if (v8 < 0x11) {
    return nonce_init(result, a2, v8, a4, a5, a6, a7, a8);
  }
  __break(0x5519u);
  return result;
}

uint64_t nonce_compare(void *a1, void *a2)
{
  size_t v2 = a1[2];
  if (v2 == a2[2]) {
    return memcmp(a1, a2, v2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t nonce_compare_buff(void *a1, const void *a2, size_t a3)
{
  if (a1[2] == a3) {
    return memcmp(a1, a2, a3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void *nonce_copy_out( void *__src, void *__dst, size_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9 = *a3;
  size_t v10 = __src[2];
  if (v9 < v10) {
LABEL_6:
  }
    __panic_npx( "panic: nonce length overflow: actual = %lu, expected >= %lu",  (uint64_t)__dst,  v10,  a4,  a5,  a6,  a7,  a8,  v9);
  if (v10 > 0x10 || (result = memcpy(__dst, __src, v10), size_t v9 = __src[2], v9 > *a3))
  {
    __break(0x5519u);
    goto LABEL_6;
  }

  *a3 = v9;
  return result;
}

void *nonce_init_uint64(void *result, unint64_t a2)
{
  *uint64_t result = bswap64(a2);
  result[2] = 8LL;
  return result;
}

unint64_t nonce_get_uint64( unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[2] >= 9) {
    __panic_npx( "panic: nonce cannot fit into 64-bit integer: actual = %lu, expected <= %lu",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a1[2]);
  }
  return bswap64(*a1);
}

uint64_t nonce_print_cstr( uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  strcpy(v21, "0123456789abcdef");
  size_t v8 = (unint64_t *)(result + 16);
  unint64_t v9 = *(void *)(result + 16);
  if (v9 > 0x21) {
LABEL_30:
  }
    __panic_npx("panic: bogus nonce length: actual = %lu, expected <= %lu", a2, a3, a4, a5, a6, a7, a8, v9);
  *(void *)a2 = 0LL;
  *(void *)(a2 + 8) = 0LL;
  if (!*v8) {
    goto LABEL_27;
  }
  unint64_t v9 = 0LL;
  unint64_t v10 = a2 + 33;
  uint64_t v11 = (_BYTE *)a2;
  do
  {
    unint64_t v12 = *(unsigned __int8 *)(result + v9);
    uint64_t v13 = (char *)((unint64_t)v21 | (v12 >> 4));
    if (v13 >= &v21[17] || v13 < v21) {
      goto LABEL_29;
    }
    *uint64_t v11 = *v13;
    uint64_t v15 = v11 + 1;
    uint64_t v16 = (char *)((unint64_t)v21 | v12 & 0xF);
    BOOL v17 = v16 >= &v21[17] || v16 < v21;
    BOOL v18 = v17 || (unint64_t)v15 >= v10;
    BOOL v19 = !v18 && (unint64_t)v15 >= a2;
    if (!v19
      || ((*v15 = *v16, uint64_t v11 = v15 + 1, (unint64_t)v11 < v10) ? (v20 = (unint64_t)v11 >= a2) : (v20 = 0),
          !v20))
    {
LABEL_29:
      __break(0x5519u);
      goto LABEL_30;
    }

    *uint64_t v11 = 0;
    ++v9;
  }

  while (v9 < *v8);
  if (!*v8) {
LABEL_27:
  }
    strcpy((char *)a2, "null");
  return result;
}

unint64_t sprintdgst_npx( unint64_t result, unsigned __int8 *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  strcpy(v20, "0123456789abcdef");
  if (a3 > 0x40) {
    goto LABEL_28;
  }
  *(_BYTE *)(result + 128) = 0;
  *(_OWORD *)(result + 96) = 0u;
  *(_OWORD *)(result + 112) = 0u;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 80) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)uint64_t result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  if (a3)
  {
    unint64_t v8 = result + 129;
    unint64_t v9 = (_BYTE *)result;
    while (1)
    {
      unsigned int v11 = *a2++;
      char v10 = v11;
      unint64_t v12 = (char *)((unint64_t)v20 | ((unint64_t)v11 >> 4));
      if (v12 >= &v20[17] || v12 < v20) {
        break;
      }
      *unint64_t v9 = *v12;
      uint64_t v14 = v9 + 1;
      uint64_t v15 = (char *)((unint64_t)v20 | v10 & 0xF);
      BOOL v16 = v15 >= &v20[17] || v15 < v20;
      BOOL v17 = v16 || (unint64_t)v14 >= v8;
      char *v14 = *v15;
      unint64_t v9 = v14 + 1;
      *unint64_t v9 = 0;
      if (!--a3) {
        return result;
      }
    }

    __break(0x5519u);
LABEL_28:
    __panic_npx_1(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a3);
  }

  strcpy((char *)result, "null");
  return result;
}

void __panic_npx_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  char v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: bogus digest length: %lu", &a9);
  _os_crash();
  __break(1u);
}

uint64_t _chain_pivot_enforceable(uint64_t a1, uint64_t a2)
{
  if (odometer_policy_get_chip_property(a1, *(void *)(a2 + 16)))
  {
    int v3 = *(unsigned __int16 *)(a2 + 432);
    uint64_t v4 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    if (v3)
    {
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, name);
      return 0LL;
    }

    else
    {
      uint64_t v11 = 1LL;
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: manifest has no pivot constraint", v6, v7, v8, v9, v10, name);
    }
  }

  else
  {
    uint64_t v12 = *(void *)a2;
    uint64_t v13 = chip_get_name(*(void *)(a2 + 16));
    uint64_t v11 = 1LL;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, v13);
  }

  return v11;
}

uint64_t _chain_pivot_enforce(uint64_t a1, unint64_t a2)
{
  uint64_t chip_property = odometer_policy_get_chip_property(a1, *(void *)(a2 + 16));
  if (*(_WORD *)(a2 + 432)) {
    uint64_t v9 = (unsigned __int8 *)(a2 + 328);
  }
  else {
    uint64_t v9 = 0LL;
  }
  uint64_t v10 = odometer_enforce_property((uint64_t *)a2, a1, chip_property, v9, v5, v6, v7, v8);
  if (!(_DWORD)v10) {
    goto LABEL_13;
  }
  uint64_t v17 = v10;
  if ((_DWORD)v10 == 2)
  {
    if (!odometer_check_fuse( a2,  (uint64_t)&_odometer_cylinder_production_status,  v11,  v12,  v13,  v14,  v15,  v16))
    {
      size_t v24 = "odometer[%s:%s]: development silicon; not enforcing policy";
      goto LABEL_12;
    }

    if (odometer_check_fuse(a2, (uint64_t)&_odometer_cylinder_internal_use, v18, v19, v20, v21, v22, v23))
    {
      size_t v24 = "odometer[%s:%s]: internal unit; not enforcing policy";
LABEL_12:
      uint64_t v40 = *(void *)a2;
      uint64_t name = chip_get_name(*(void *)(a2 + 16));
      expert_log(v40, 1uLL, (uint64_t)v24, v42, v43, v44, v45, v46, name);
LABEL_13:
      uint64_t v47 = *(void *)a2;
      uint64_t v48 = chip_get_name(*(void *)(a2 + 16));
      expert_log( v47,  1uLL,  (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain",  v49,  v50,  v51,  v52,  v53,  v48);
      return 0LL;
    }
  }

  uint64_t v25 = *(void *)a2;
  uint64_t v26 = chip_get_name(*(void *)(a2 + 16));
  uint64_t v32 = expert_log( v25,  0LL,  (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d",  v27,  v28,  v29,  v30,  v31,  v26);
  return v17;
}

void __panic_npx_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  uint64_t v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: error not set to valid posix code: %d", &a9);
  _os_crash();
  __break(1u);
}

uint64_t __handle_absence(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 0;
  return 0LL;
}

uint64_t expert_map( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[1] <= 0x11FuLL) {
    __panic_npx( "panic: insufficient memory for expert: actual = %lu, expected >= %lu",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a1[1]);
  }
  return *a1;
}

uint64_t _expert_assert( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(result + 8) != (_DWORD)a2) {
    __panic_npx("panic: unexpected expert: op = %s, actual = %s, expected = %s", a2, a3, a4, a5, a6, a7, a8, a3);
  }
  return result;
}

char *expert_log_level_cstr_lower( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >= 4) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"lvl");
  }
  return off_18A3B14F8[a1];
}

char *expert_log_level_cstr_upper( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >= 4) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"lvl");
  }
  return off_18A3B1518[a1];
}

uint64_t expert_init(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t expert_boot(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))();
}

uint64_t _expert_alloc_type(uint64_t a1, uint64_t a2)
{
  if (!type_get_size(a2)) {
    __panic_npx("panic: type not available", v4, v5, v6, v7, v8, v9, v10, v13);
  }
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 64);
  if (v11) {
    return v11(a1, a2);
  }
  else {
    return 0LL;
  }
}

uint64_t expert_runtime_entry(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 240))();
}

uint64_t _expert_dealloc_type(uint64_t result, uint64_t a2, uint64_t *a3)
{
  if (a2)
  {
    uint64_t v4 = *a3;
    uint64_t v5 = *(uint64_t (**)(void))(result + 72);
    if (v5) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6) {
      uint64_t result = v5();
    }
  }

  *a3 = 0LL;
  return result;
}

uint64_t expert_alloc_data(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 80);
  if (v4) {
    return v4(a1, a2);
  }
  else {
    return 0LL;
  }
}

uint64_t expert_dealloc_data(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  uint64_t v5 = *(uint64_t (**)(void))(result + 88);
  if (v5) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t result = v5();
    *a3 = 0LL;
  }

  return result;
}

uint64_t expert_dump(uint64_t a1)
{
  uint64_t v137 = *MEMORY[0x1895F89C0];
  __int128 v113 = xmmword_18A3B14C8;
  uint64_t v114 = -1LL;
  unint64_t v112 = 0LL;
  __int128 __str = xmmword_1894E63BD;
  __int128 v124 = *(_OWORD *)algn_1894E63CD;
  (*(void (**)(void))(a1 + 240))();
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  if ((*(unsigned int (**)(uint64_t, unint64_t *))(a1 + 120))(a1, &v112))
  {
    unint64_t v112 = 3LL;
  }

  else
  {
    uint64_t v9 = v112;
    if (v112 >= 3)
    {
      if (v112 != 3)
      {
        v111 = "sb";
        goto LABEL_41;
      }

      uint64_t v9 = 3LL;
    }

    snprintf((char *)&__str, 0x20uLL, "0x%llx", v9);
  }

  unsigned int v10 = bswap32(*(_DWORD *)(a1 + 8));
  BYTE4(__str) = 0;
  LODWORD(__str) = v10;
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v4, v5, v6, v7, v8, (uint64_t)&unk_1894F071F);
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v11, v12, v13, v14, v15, (uint64_t)&unk_1894F071F);
  expert_log(a1, 1uLL, (uint64_t)"%s %-36s : 0x%x", v16, v17, v18, v19, v20, (uint64_t)"  🔥🌸 ");
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : 0x%llx", v21, v22, v23, v24, v25, (uint64_t)&unk_1894F071F);
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : 0x%llx", v26, v27, v28, v29, v30, (uint64_t)&unk_1894F071F);
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : 0x%llx", v31, v32, v33, v34, v35, (uint64_t)&unk_1894F071F);
  unint64_t v36 = v112;
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  uint64_t v37 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 128))(a1, v36);
  chip_get_name(v37);
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v38, v39, v40, v41, v42, (uint64_t)&unk_1894F071F);
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  uint64_t v48 = *(uint64_t (**)(uint64_t))(a1 + 104);
  if (v48 && (unint64_t)v48(a1) >= 7
    || (expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v43, v44, v45, v46, v47, (uint64_t)&unk_1894F071F),
        (*(void (**)(uint64_t))(a1 + 240))(a1),
        (uint64_t v51 = *(uint64_t (**)(uint64_t))(a1 + 112)) != 0LL)
    && (unint64_t)v51(a1) >= 7)
  {
    __panic_npx("panic: unreachable case: %s = 0x%llx", v49, v50, v43, v44, v45, v46, v47, (char)"lvl");
  }

  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v43, v44, v45, v46, v47, (uint64_t)&unk_1894F071F);
  char v59 = property_iterator_next((uint64_t)&v113, v52, v53, v54, v55, v56, v57, v58);
  if (v59)
  {
    v60 = v59;
    while (1)
    {
      __int128 v135 = 0u;
      memset(v136, 0, sizeof(v136));
      __int128 v133 = 0u;
      __int128 v134 = 0u;
      __int128 v131 = 0u;
      __int128 v132 = 0u;
      __int128 v130 = 0u;
      qmemcpy(__dst, "n/a", sizeof(__dst));
      LOBYTE(v127[0]) = 0;
      LODWORD(v128[0]) = 0;
      *(void *)v125 = 0LL;
      memset(v122, 0, sizeof(v122));
      uint64_t v121 = 0x3E800000000LL;
      __int128 v119 = 0u;
      __int128 v120 = 0u;
      __int128 v117 = 0u;
      __int128 v118 = 0u;
      *(_OWORD *)__source = 0u;
      __int128 v116 = 0u;
      v61 = v60 + 104;
      switch(**((void **)v60 + 5))
      {
        case 0LL:
          if (v60 >= v61) {
            goto LABEL_39;
          }
          goto LABEL_30;
        case 1LL:
          if (v60 >= v61) {
            goto LABEL_39;
          }
          if (!expert_query_property_uint32(a1, v37, (uint64_t)v60, v128)) {
LABEL_23:
          }
            snprintf(__dst, 0x81uLL, "%#x");
          goto LABEL_30;
        case 2LL:
          if (v60 >= v61) {
            goto LABEL_39;
          }
          goto LABEL_30;
        case 3LL:
          if (v60 >= v61) {
            goto LABEL_39;
          }
          goto LABEL_30;
        case 4LL:
          if (v60 >= v61)
          {
LABEL_39:
            __break(0x5519u);
LABEL_40:
            v111 = "pi->p_type->pt_switchable";
LABEL_41:
            __panic_npx("panic: unreachable case: %s = 0x%llx", v2, v3, v4, v5, v6, v7, v8, (char)v111);
          }

LABEL_30:
          expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v62, v63, v64, v65, v66, (uint64_t)(v60 + 28));
          v60 = property_iterator_next((uint64_t)&v113, v68, v69, v70, v71, v72, v73, v74);
          if (!v60) {
            goto LABEL_31;
          }
          break;
        default:
          goto LABEL_40;
      }
    }
  }

                      __break(0x5519u);
                      goto LABEL_31;
                    }

    __break(0x5519u);
    goto LABEL_31;
  }

LABEL_31:
  memset(v128, 0, sizeof(v128));
  memset(v127, 0, sizeof(v127));
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  *(_OWORD *)__source = 0u;
  *(void *)((char *)v122 + 11) = 0LL;
  BYTE4(v122[0]) = 0;
  *(_WORD *)((char *)v122 + 5) = 0;
  *(_DWORD *)((char *)v122 + 7) = 0;
  *(void *)((char *)&v122[1] + 9) = 0LL;
  *(void *)((char *)&v122[1] + 3) = 0LL;
  strcpy((char *)v122, "n/a");
  *(void *)&v125[11] = 0LL;
  v125[4] = 0;
  *(_WORD *)&v125[5] = 0;
  *(_DWORD *)&v125[7] = 0;
  *(void *)((char *)v126 + 6) = 0LL;
  v126[0] = 0LL;
  strcpy(v125, "n/a");
  memset(v136, 0, sizeof(v136));
  __int128 v135 = 0u;
  __int128 v134 = 0u;
  __int128 v133 = 0u;
  __int128 v132 = 0u;
  __int128 v131 = 0u;
  __int128 v130 = 0u;
  qmemcpy(__dst, "n/a", sizeof(__dst));
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  if (!(*(unsigned int (**)(uint64_t, void, void, void *))(a1 + 144))(a1, 0LL, 0LL, v128))
  {
    nonce_print_cstr((uint64_t)v128, (unint64_t)v122, v75, v76, v77, v78, v79, v80);
    (*(void (**)(uint64_t))(a1 + 240))(a1);
    if (!(*(unsigned int (**)(uint64_t, void, void, void *, void *))(a1 + 152))( a1,  0LL,  0LL,  v128,  v127))
    {
      nonce_print_cstr((uint64_t)v127, (unint64_t)v125, v81, v76, v77, v78, v79, v80);
      (*(void (**)(uint64_t))(a1 + 240))(a1);
      v82 = (void *)(*(uint64_t (**)(uint64_t, void))(a1 + 128))(a1, 0LL);
      odometer_compute_nonce_hash(a1, v82, (uint64_t)v127, (uint64_t)__source);
      digest_print_cstr((unint64_t)__source, (unint64_t)__dst, v83, v84, v85, v86, v87, v88);
    }
  }

  expert_log(a1, 2uLL, (uint64_t)"%6s  %-36s : %s", v76, v77, v78, v79, v80, (uint64_t)&unk_1894F071F);
  expert_log(a1, 2uLL, (uint64_t)"%6s  %-36s : %s", v89, v90, v91, v92, v93, (uint64_t)&unk_1894F071F);
  expert_log(a1, 2uLL, (uint64_t)"%6s  %-36s : %s", v94, v95, v96, v97, v98, (uint64_t)&unk_1894F071F);
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  __int128 v116 = 0u;
  __int128 v117 = 0u;
  *(_OWORD *)__source = 0u;
  memset(v136, 0, sizeof(v136));
  __int128 v135 = 0u;
  __int128 v134 = 0u;
  __int128 v133 = 0u;
  __int128 v132 = 0u;
  __int128 v131 = 0u;
  __int128 v130 = 0u;
  qmemcpy(__dst, "n/a", sizeof(__dst));
  uint64_t result = expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v100, v101, v102, v103, v104, (uint64_t)&unk_1894F071F);
  if (*(void *)(a1 + 56))
  {
    expert_log(a1, 1uLL, (uint64_t)"%s %-36s", v106, v107, v108, v109, v110, (uint64_t)&unk_1894F071F);
    return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 56))(a1, 1LL);
  }

  return result;
}

            uint64_t v33 = *(void *)a1;
            uint64_t v39 = *v24;
            uint64_t v32 = "posted property: container = %s, type = %x, p = %s";
            goto LABEL_32;
          }

          goto LABEL_26;
        }

        break;
      default:
        goto LABEL_36;
    }

    __break(0x5519u);
LABEL_36:
    __panic_npx("panic: unreachable case: %s = 0x%llx", v25, v26, v27, v28, v29, v30, v31, (char)"asn1type");
  }

  return expert_log(*(void *)a1, 2uLL, (uint64_t)"no callbacks present", a4, (uint64_t)a5, a6, a7, a8, a9);
}

    __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v49);
  }

  uint64_t v18 = v17 + 64;
  if (!*(_WORD *)(v17 + 64)) {
    goto LABEL_31;
  }
  uint64_t v19 = (uint64_t *)(v17 + 24);
LABEL_12:
  uint64_t result = expert_runtime_boot(expert);
  if ((_DWORD)result)
  {
    uint64_t v49 = result;
    uint64_t v14 = "failed to boot expert for chip selection: %d";
    uint64_t v15 = expert;
    uint64_t v16 = 3LL;
    goto LABEL_14;
  }

  if ((unint64_t)v19 >= v18
    || (unint64_t)(v19 + 5) > v18
    || (result = *v19, uint64_t v23 = v19[1], *v19 > (unint64_t)(*v19 + v23)))
  {
    __break(0x5519u);
    return result;
  }

  Img4DecodeInitAsManifest(result, v23, (uint64_t)v53);
  if ((_DWORD)v24)
  {
    uint64_t v49 = v24;
    uint64_t v14 = "Img4DecodeInitAsManifest: %d";
    goto LABEL_5;
  }

  if (!a3) {
    return 0LL;
  }
  while (1)
  {
    uint64_t v22 = *a2;
    uint64_t v51 = xmmword_18A3B31D8;
    uint64_t v52 = 0LL;
    uint64_t v25 = *(void *)(v22 + 32);
    uint64_t name = chip_get_name(v22);
    expert_log(expert, 1uLL, (uint64_t)"trying chip: %s", v27, v28, v29, v30, v31, name);
    if (!v25)
    {
      uint64_t v50 = chip_get_name(v22);
      expert_log(expert, 0LL, (uint64_t)"chip has no static decode implementation: %s", v38, v39, v40, v41, v42, v50);
      goto LABEL_28;
    }

    Img4DecodePerformManifestTrustEvaluationWithCallbacks((uint64_t)v53, (uint64_t)&v51, v25, 0LL);
    if (!(_DWORD)v32) {
      break;
    }
    expert_log( expert,  1uLL,  (uint64_t)"Img4DecodePerformManifestTrustEvaluationWithCallbacks: %d",  v33,  v34,  v35,  v36,  v37,  v32);
LABEL_28:
    uint64_t v22 = 0LL;
    ++a2;
    if (!--a3) {
      return v22;
    }
  }

  uint64_t v43 = chip_get_name(v22);
  expert_log(expert, 2uLL, (uint64_t)"manifest matches chip: %s", v44, v45, v46, v47, v48, v43);
  return v22;
}

                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

                            __break(0x5513u);
                            return result;
                          }

                          if (ccec_verify()) {
LABEL_24:
                          }
                            HIBYTE(v24) = 0;
                        }

                        return HIBYTE(v24) != 0;
                      }

uint64_t expert_get_secure_boot(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 120))(a1, a2);
}

uint64_t expert_log( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 >= 3)
  {
    if (a2 != 3) {
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"level");
    }
  }

  else
  {
    (*(void (**)(uint64_t))(a1 + 240))(a1);
  }

  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t *))(a1 + 48))(a1, a2, a3, &a9);
}

uint64_t expert_query_chip(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 128))(a1, a2);
}

uint64_t expert_get_exception_level(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(a1 + 104);
  if (v2) {
    return v2(a1);
  }
  else {
    return 0LL;
  }
}

uint64_t expert_get_unprivileged_limit(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(a1 + 112);
  if (v2) {
    return v2(a1);
  }
  else {
    return 6LL;
  }
}

uint64_t expert_query_property_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  unsigned __int8 v40 = 0;
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  unint64_t v8 = chip_select_property_expert(a2, (void *)a3, a1);
  expert_log( a1,  2uLL,  (uint64_t)"selected property expert: property = %s, selected = %s, base = %s",  v9,  v10,  v11,  v12,  v13,  a3 + 28);
  if (v8 >= v8 + 288) {
    __break(0x5519u);
  }
  uint64_t v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, unsigned __int8 *))(v8 + 200))(v8, a2, a3, &v40);
  uint64_t v20 = v14;
  if ((int)v14 > 18)
  {
    if ((_DWORD)v14 != 45 && (_DWORD)v14 != 19) {
      goto LABEL_5;
    }
LABEL_11:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
    goto LABEL_12;
  }

  if ((_DWORD)v14)
  {
    if ((_DWORD)v14 != 2)
    {
LABEL_5:
      expert_log(a1, 0LL, (uint64_t)"failed to query property: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
      goto LABEL_13;
    }

    goto LABEL_11;
  }

LABEL_22:
  if (!(_DWORD)v20)
  {
    unsigned __int8 v38 = v40;
    goto LABEL_27;
  }

  if (!(_DWORD)v20)
  {
    unsigned __int8 v38 = v40;
    goto LABEL_27;
  }

  if (!(_DWORD)v20)
  {
    unsigned __int8 v38 = v40;
    goto LABEL_27;
  }

LABEL_23:
  return v20;
}

  return v20;
}

  return v20;
}

  __break(0x5519u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t expert_query_property_uint32(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  int v40 = 0;
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  unint64_t v8 = chip_select_property_expert(a2, (void *)a3, a1);
  expert_log( a1,  2uLL,  (uint64_t)"selected property expert: property = %s, selected = %s, base = %s",  v9,  v10,  v11,  v12,  v13,  a3 + 28);
  if (v8 >= v8 + 288) {
    __break(0x5519u);
  }
  uint64_t v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, int *))(v8 + 208))(v8, a2, a3, &v40);
  uint64_t v20 = v14;
  if ((int)v14 > 18)
  {
    if ((_DWORD)v14 != 45 && (_DWORD)v14 != 19) {
      goto LABEL_5;
    }
LABEL_11:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
    goto LABEL_12;
  }

  if ((_DWORD)v14)
  {
    if ((_DWORD)v14 != 2)
    {
LABEL_5:
      expert_log(a1, 0LL, (uint64_t)"failed to query property: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
      goto LABEL_13;
    }

    goto LABEL_11;
  }

uint64_t expert_query_property_uint64(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  uint64_t v40 = 0LL;
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  unint64_t v8 = chip_select_property_expert(a2, (void *)a3, a1);
  expert_log( a1,  2uLL,  (uint64_t)"selected property expert: property = %s, selected = %s, base = %s",  v9,  v10,  v11,  v12,  v13,  a3 + 28);
  if (v8 >= v8 + 288) {
    __break(0x5519u);
  }
  uint64_t v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t *))(v8 + 216))(v8, a2, a3, &v40);
  uint64_t v20 = v14;
  if ((int)v14 > 18)
  {
    if ((_DWORD)v14 != 45 && (_DWORD)v14 != 19) {
      goto LABEL_5;
    }
LABEL_11:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
    goto LABEL_12;
  }

  if ((_DWORD)v14)
  {
    if ((_DWORD)v14 != 2)
    {
LABEL_5:
      expert_log(a1, 0LL, (uint64_t)"failed to query property: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
      goto LABEL_13;
    }

    goto LABEL_11;
  }

uint64_t expert_query_property_digest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  memset(v48, 0, sizeof(v48));
  char v47 = 0;
  memset(v46, 0, sizeof(v46));
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  unint64_t v8 = chip_select_property_expert(a2, (void *)a3, a1);
  expert_log( a1,  2uLL,  (uint64_t)"selected property expert: property = %s, selected = %s, base = %s",  v9,  v10,  v11,  v12,  v13,  a3 + 28);
  if (v8 >= v8 + 288) {
    __break(0x5519u);
  }
  uint64_t v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, _OWORD *))(v8 + 224))(v8, a2, a3, v48);
  uint64_t v21 = v14;
  if ((int)v14 > 18)
  {
    if ((_DWORD)v14 != 45 && (_DWORD)v14 != 19) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  if (!(_DWORD)v14)
  {
LABEL_9:
    digest_print_cstr((unint64_t)v48, (unint64_t)v46, v15, v16, v17, v18, v19, v20);
    expert_log(a1, 2uLL, (uint64_t)"queried property: %s => %s", v22, v23, v24, v25, v26, a3 + 28);
    goto LABEL_11;
  }

  if ((_DWORD)v14 == 2)
  {
LABEL_8:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v16, v17, v18, v19, v20, *(void *)a3);
    goto LABEL_9;
  }

LABEL_10:
  expert_log(a1, 0LL, (uint64_t)"failed to query property: %s: %d", v16, v17, v18, v19, v20, *(void *)a3);
LABEL_11:
  memset(v59, 0, sizeof(v59));
  __int128 v58 = 0u;
  __int128 v57 = 0u;
  __int128 v56 = 0u;
  __int128 v55 = 0u;
  __int128 v54 = 0u;
  __int128 v53 = 0u;
  qmemcpy(v52, "n/a", sizeof(v52));
  char v50 = 0;
  memset(v49, 0, sizeof(v49));
  if ((_DWORD)v21 == 2)
  {
    memset(v51, 0, sizeof(v51));
    digest_print_cstr((unint64_t)v48, (unint64_t)v49, v28, v29, v30, v31, v32, v33);
    expert_log( a1,  2uLL,  (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => %s], error = [%d => %d]",  v34,  v35,  v36,  v37,  v38,  a3 + 28);
    digest_copy((uint64_t)v48, (uint64_t)v51, v39, v40, v41, v42, v43, v44);
LABEL_18:
    digest_copy(a4, (uint64_t)v48, v28, v29, v30, v31, v32, v33);
    return 0LL;
  }

  if (!(_DWORD)v21) {
    goto LABEL_18;
  }
  return v21;
}

  expert_log(a1, 0LL, (uint64_t)"failed to query property: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
LABEL_11:
  memset(v40, 0, sizeof(v40));
  uint64_t v39 = 0u;
  uint64_t v38 = 0u;
  uint64_t v37 = 0u;
  uint64_t v36 = 0u;
  uint64_t v35 = 0u;
  uint64_t v34 = 0u;
  qmemcpy(v33, "n/a", sizeof(v33));
  if ((_DWORD)v20 == 2)
  {
    uint64_t v32 = 0x3E800000000LL;
    memset(v31, 0, sizeof(v31));
    expert_log( a1,  2uLL,  (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => %s], error = [%d => %d]",  v23,  v24,  v25,  v26,  v27,  a3 + 28);
    version_copy((uint64_t)v29, v31);
LABEL_18:
    version_copy(a4, v29);
    return 0LL;
  }

  if (!(_DWORD)v20) {
    goto LABEL_18;
  }
  return v20;
}

  uint64_t v20 = *(void *)(a8 + 24);
  uint64_t v21 = 0x80000000LL;
  if (v20) {
    uint64_t v21 = *(void *)(a8 + 24);
  }
  *(void *)&uint64_t v31 = 0LL;
  *((void *)&v31 + 1) = v21;
  *((void *)&v32 + 1) = v38;
  *(void *)&uint64_t v33 = &v38[2];
  *((void *)&v33 + 1) = v37;
  *(void *)&uint64_t v32 = 0xAAAAAAAA01000000LL;
  *(void *)&uint64_t v34 = &null_octet;
  uint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v22 = (__int128 *)((unint64_t)&X509PolicyBAAUser & (v20 << 21 >> 63));
  if ((v20 & 0x800000) != 0) {
    uint64_t v22 = (__int128 *)&X509PolicyBAASystem;
  }
  if ((v20 & 0x40000800000LL) != 0) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = &v31;
  }
  uint64_t v24 = CTEvaluateCertsForPolicy(v14, a2, 0, 0, &v27, &v28, 0LL, 0LL, 0LL, &v29, v23);
  if (v24)
  {
    *(_DWORD *)(a8 + 32) = v24;
    return 0xFFFFFFFFLL;
  }

  else
  {
    if (a5 && a6)
    {
      uint64_t v25 = v30;
      *a5 = v29;
      *a6 = v25;
    }

    uint64_t result = 0LL;
    if (a3)
    {
      if (a4)
      {
        uint64_t result = 0LL;
        uint64_t v26 = v28;
        *a3 = v27;
        *a4 = v26;
      }
    }
  }

  return result;
}

  uint64_t v5 = 0LL;
  do
  {
    uint64_t v6 = *v3++;
    uint64_t v5 = v6 | (v5 << 8);
    --v2;
  }

  while (v2);
  uint64_t result = 0LL;
  *a2 = v5;
  return result;
}

uint64_t expert_query_property_version(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  uint64_t v30 = 0x3E800000000LL;
  memset(v29, 0, sizeof(v29));
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  unint64_t v8 = chip_select_property_expert(a2, (void *)a3, a1);
  expert_log( a1,  2uLL,  (uint64_t)"selected property expert: property = %s, selected = %s, base = %s",  v9,  v10,  v11,  v12,  v13,  a3 + 28);
  if (v8 >= v8 + 288) {
    __break(0x5519u);
  }
  uint64_t v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, __int128 *))(v8 + 232))(v8, a2, a3, v29);
  uint64_t v20 = v14;
  if ((int)v14 > 18)
  {
    if ((_DWORD)v14 != 45 && (_DWORD)v14 != 19) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  if (!(_DWORD)v14)
  {
LABEL_9:
    expert_log(a1, 2uLL, (uint64_t)"queried property: %s => %s", v15, v16, v17, v18, v19, a3 + 28);
    goto LABEL_11;
  }

  if ((_DWORD)v14 == 2)
  {
LABEL_8:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v15, v16, v17, v18, v19, *(void *)a3);
    goto LABEL_9;
  }

uint64_t expert_get_digest_info(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2)
  {
    (*(void (**)(uint64_t))(a1 + 240))(a1);
    a2 = (*(uint64_t (**)(uint64_t, void))(a1 + 128))(a1, 0LL);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 96))(a1, a2, a3);
}

uint64_t expert_query_chip_boot(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 136))(a1, a2);
}

uint64_t expert_query_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 144))(a1, a2, a3, a4);
}

uint64_t expert_entangle_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 152))(a1, a2, a3, a4, a5);
}

uint64_t expert_read_boot_manifest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 160))(a1, a2, a3, a4);
}

uint64_t expert_query_trust_store(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 168))(a1, a2, a3, a4, a5);
}

uint64_t expert_read_storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 248))(a1);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 176))(a1, a2, a3, a4);
  }
  return result;
}

uint64_t expert_runtime_boot(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 248))(a1);
}

uint64_t expert_write_storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 248))(a1);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 184))(a1, a2, a3, a4);
  }
  return result;
}

uint64_t expert_sync_storage(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 248))(a1);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 192))(a1, a2);
  }
  return result;
}

uint64_t _expert_query_resolve_debug(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v5 = result;
    uint64_t result = chip_expert(a2);
    if (result)
    {
      chip_get_name(a2);
      return expert_log( v5,  2uLL,  (uint64_t)"querying property with chip expert resolution: p = %s, chip = %s, chip type = 0x%llx, chip exper t authority >= 0x%llx",  v6,  v7,  v8,  v9,  v10,  a3 + 28);
    }
  }

  return result;
}

uint64_t expert_boot_once(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 248))();
}

uint64_t expert_read_random(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 256))(a1, a2, a3);
}

uint64_t expert_syscall(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!*(void *)(a1 + 264)) {
    return 78LL;
  }
  (*(void (**)(void))(a1 + 240))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 264))( a1,  a2,  a3,  a4,  a5,  a6);
}

uint64_t expert_lock(uint64_t a1)
{
  return a1;
}

unint64_t expert_unlock(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result)
  {
    if (result >= result + 288)
    {
      __break(0x5519u);
    }

    else
    {
      unint64_t result = (*(uint64_t (**)(void))(result + 280))();
      *a1 = 0LL;
    }
  }

  return result;
}

uint64_t expert_get_boot_nonce_hash(uint64_t a1, uint64_t a2)
{
  v6[3] = *MEMORY[0x1895F89C0];
  memset(v6, 0, 24);
  memset(v5, 0, sizeof(v5));
  (*(void (**)(void))(a1 + 240))();
  uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void *))(a1 + 144))(a1, 0LL, 0LL, v6);
  if (!(_DWORD)result)
  {
    (*(void (**)(uint64_t))(a1 + 240))(a1);
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void *, void *))(a1 + 152))(a1, 0LL, 0LL, v6, v5);
    if (!(_DWORD)result)
    {
      odometer_compute_nonce_hash(a1, 0LL, (uint64_t)v5, a2);
      return 0LL;
    }
  }

  return result;
}

BOOL expert_compute_data_only(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(a1 + 104);
  if (v2) {
    unint64_t v3 = v2(a1);
  }
  else {
    unint64_t v3 = 0LL;
  }
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(a1 + 112);
  if (v4) {
    unint64_t v5 = v4(a1);
  }
  else {
    unint64_t v5 = 6LL;
  }
  return v3 < v5;
}

uint64_t expert_compute_udid(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = 0LL;
  unint64_t v15 = 0LL;
  uint64_t result = expert_query_property_uint32(a1, a2, (uint64_t)&_property_CHIP, (_DWORD *)&v14 + 1);
  if ((_DWORD)result || (uint64_t result = expert_query_property_uint64(a1, a2, (uint64_t)&_property_ECID, &v15), (_DWORD)result))
  {
  }

  else
  {
    LODWORD(v14) = 0;
    HIDWORD(v14) = bswap32(HIDWORD(v14));
    unint64_t v15 = bswap64(v15);
    digest_init(a3, &v14, 0x10uLL, v9, v10, v11, v12, v13);
    return 0LL;
  }

  return result;
}

uint64_t expert_compute_eieiou(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v6 = 0LL;
  int v7 = 0;
  while (1)
  {
    uint64_t v8 = expert_compute_eieiou_ps[v6];
    unsigned __int8 v18 = 0;
    uint64_t result = expert_query_property_BOOL(a1, a2, (uint64_t)v8, &v18);
    v7 += v18;
    if (++v6 == 3)
    {
      uint64_t result = 0LL;
      *a3 = v7;
      return result;
    }
  }

  return result;
}

uint64_t expert_compute_eieiou_BOOL(uint64_t a1, uint64_t a2, BOOL *a3)
{
  int v12 = 0;
  uint64_t result = expert_compute_eieiou(a1, a2, &v12);
  if ((_DWORD)result)
  {
  }

  else
  {
    *a3 = v12 != 0;
  }

  return result;
}

uint64_t _expert_post_process_unconstrain_BOOL(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 0;
  return 0LL;
}

uint64_t _expert_post_process_unconstrain_uint32(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
  return 0LL;
}

uint64_t _expert_post_process_unconstrain_uint64(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = 0LL;
  return 0LL;
}

uint64_t _boot_precomp_enforceable(uint64_t a1, uint64_t a2)
{
  if (!odometer_policy_get_chip_property(a1, *(void *)(a2 + 16)))
  {
    uint64_t v12 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    uint64_t v11 = 1LL;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, name);
    return v11;
  }

  if (!*(_WORD *)(a2 + 144))
  {
    uint64_t v4 = *(void *)a2;
    uint64_t v21 = chip_get_name(*(void *)(a2 + 16));
    uint64_t v19 = "odometer[%s:%s]: manifest has no constraint for policy";
LABEL_8:
    uint64_t v11 = 1LL;
    expert_log(v4, 1uLL, (uint64_t)v19, v6, v7, v8, v9, v10, v21);
    return v11;
  }

  int v3 = *(unsigned __int16 *)(a2 + 232);
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = chip_get_name(*(void *)(a2 + 16));
  if (!v3)
  {
    uint64_t v21 = v5;
    uint64_t v19 = "odometer[%s:%s]: no caller-supplied nonce hash";
    goto LABEL_8;
  }

  expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, v5);
  return 0LL;
}

uint64_t _boot_precomp_enforce(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t chip_property = odometer_policy_get_chip_property(a1, *(void *)(a2 + 16));
  if (*(_WORD *)(a2 + 232)) {
    unint64_t v10 = a2 + 152;
  }
  else {
    unint64_t v10 = 0LL;
  }
  if (*(_WORD *)(a2 + 144)) {
    unint64_t v11 = a2 + 64;
  }
  else {
    unint64_t v11 = 0LL;
  }
  if (property_constrain_digest(chip_property, v4, v11, v10, v6, v7, v8, v9))
  {
    uint64_t v12 = *(unsigned int *)(a1 + 24);
    uint64_t v13 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    uint64_t v20 = expert_log(v13, 0LL, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v15, v16, v17, v18, v19, name);
  }

  else
  {
    uint64_t v28 = *(void *)a2;
    uint64_t v29 = chip_get_name(*(void *)(a2 + 16));
    expert_log(v28, 1uLL, (uint64_t)"odometer[%s]: manifest is current", v30, v31, v32, v33, v34, v29);
    return 0LL;
  }

  return v12;
}

uint64_t _boot_sideload_enforceable(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 16);
  if (odometer_policy_get_chip_property(a1, v3))
  {
    if (*(void *)(v3 + 160))
    {
      if (v3 && v3 >= v3 + 264) {
        __break(0x5519u);
      }
      char name = chip_get_name(v3);
      __panic_npx( "panic: illegal chip definition: anti-reply and sideload policies defined: %s",  v22,  v23,  v24,  v25,  v26,  v27,  v28,  name);
    }

    int v4 = *(unsigned __int16 *)(a2 + 144);
    uint64_t v5 = *(void *)a2;
    uint64_t v6 = chip_get_name(*(void *)(a2 + 16));
    if (v4)
    {
      expert_log(v5, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v7, v8, v9, v10, v11, v6);
      return 0LL;
    }

    else
    {
      uint64_t v12 = 1LL;
      expert_log(v5, 1uLL, (uint64_t)"odometer[%s:%s]: manifest has no constraint for policy", v7, v8, v9, v10, v11, v6);
    }
  }

  else
  {
    uint64_t v13 = *(void *)a2;
    uint64_t v14 = chip_get_name(*(void *)(a2 + 16));
    uint64_t v12 = 1LL;
    expert_log(v13, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v15, v16, v17, v18, v19, v14);
  }

  return v12;
}

uint64_t _boot_sideload_enforce(uint64_t a1, uint64_t a2)
{
  v68[13] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)a2;
  uint64_t chip_property = odometer_policy_get_chip_property(a1, *(void *)(a2 + 16));
  if (!*(_WORD *)(a2 + 144)) {
    __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v67);
  }
  uint64_t v13 = chip_property;
  if (*(_WORD *)(a2 + 232))
  {
    uint64_t v14 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v14, 1uLL, (uint64_t)"odometer[%s:%s]: using caller-provided nonce hash", v16, v17, v18, v19, v20, name);
    if (property_constrain_digest(v13, v4, a2 + 64, a2 + 152, v21, v22, v23, v24))
    {
      uint64_t v25 = *(unsigned int *)(a1 + 24);
      uint64_t v26 = *(void *)a2;
      uint64_t v27 = chip_get_name(*(void *)(a2 + 16));
      expert_log(v26, 0LL, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v28, v29, v30, v31, v32, v27);
      goto LABEL_7;
    }

LABEL_9:
    uint64_t v59 = *(void *)a2;
    uint64_t v60 = chip_get_name(*(void *)(a2 + 16));
    expert_log(v59, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is current", v61, v62, v63, v64, v65, v60);
    return 0LL;
  }

  *(_OWORD *)uint64_t v68 = xmmword_1894E6480;
  memset(&v68[2], 170, 88);
  digest_copy((uint64_t)v68, a2 + 64, v7, v8, v9, v10, v11, v12);
  uint64_t v40 = *(void *)a2;
  uint64_t v41 = chip_get_name(*(void *)(a2 + 16));
  expert_log(v40, 1uLL, (uint64_t)"odometer[%s:%s]: enforcing nonce hash directly", v42, v43, v44, v45, v46, v41);
  uint64_t v51 = odometer_enforce_property((uint64_t *)a2, a1, v13, (unsigned __int8 *)v68, v47, v48, v49, v50);
  if (!(_DWORD)v51) {
    goto LABEL_9;
  }
  uint64_t v25 = v51;
  uint64_t v52 = *(void *)a2;
  uint64_t v53 = chip_get_name(*(void *)(a2 + 16));
  expert_log(v52, 0LL, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v54, v55, v56, v57, v58, v53);
LABEL_7:
  return v25;
}

  if (v8 >= v23) {
    goto LABEL_12;
  }
  manifest_property_callback(v8, a3, a1, a2, v25, v26, v27, v28, v34);
  return 0LL;
}

uint64_t image4_trust_evaluate_leaf( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 744)) {
LABEL_23:
  }
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v36);
  unint64_t v11 = *(void *)(a1 + 24);
  unint64_t v10 = *(void *)(a1 + 32);
  uint64_t v12 = (uint64_t *)(a1 + 752);
  int v13 = *(unsigned __int16 *)(a1 + 1320);
  if (*(_WORD *)(a1 + 1320)) {
    uint64_t v14 = a1 + 752;
  }
  else {
    uint64_t v14 = 0LL;
  }
  v38[0] = xmmword_18A3B1DE8;
  v38[1] = *(_OWORD *)&off_18A3B1DF8;
  v38[2] = xmmword_18A3B1E08;
  uint64_t v39 = 0LL;
  v37[0] = a1;
  v37[1] = a3;
  expert_log( a2,  2uLL,  (uint64_t)"performing leaf trust evaluation: coprocessor = %s, handle = %llx, evaluation type = %s",  a4,  a5,  a6,  a7,  a8,  **(void **)(v11 + 16));
  if (v11 && v11 >= v11 + 72)
  {
LABEL_22:
    __break(0x5519u);
    goto LABEL_23;
  }

  uint64_t v15 = image4_environment_resolve(v11);
  if (!v15)
  {
    uint64_t v33 = 45LL;
    expert_log( a2,  0LL,  (uint64_t)"environment not supported: coprocessor = %s, handle = %llx: %d",  a4,  a5,  a6,  a7,  a8,  **(void **)(v11 + 16));
    return v33;
  }

  uint64_t v16 = v15;
  if (!v13 || (uint64_t v17 = payload_parse(v12), !(_DWORD)v17))
  {
LABEL_13:
    if (v10 < v10 + 48)
    {
      image4_trust_evaluation_prepare_manifest_callbacks(v10, (uint64_t)v38);
      manifest_set_callbacks(a1 + 152, (uint64_t)v37, (uint64_t)v38);
      unint64_t v19 = manifest_parse(a1 + 152);
      if ((_DWORD)v19)
      {
        unint64_t v25 = v19;
        expert_log(a2, 0LL, (uint64_t)"failed to parse manifest: %d", v20, v21, v22, v23, v24, v19);
        uint64_t v33 = v25;
      }

      else
      {
        uint64_t v34 = img4_runtime_alloc(v10);
        uint64_t v33 = manifest_impose((uint64_t *)(a1 + 152), v16, v14, v34);
        if (!(_DWORD)v33)
        {
          _image4_trust_post_properties(a1, v26, v27, v28, v29, v30, v31, v32);
          return v33;
        }
      }

      goto LABEL_20;
    }

    goto LABEL_22;
  }

  uint64_t v18 = v17;
  if ((_DWORD)v17 == 92 || (_DWORD)v17 == 33)
  {
    expert_log(a2, 1uLL, (uint64_t)"treating payload as non-Image4 wrapped", a4, a5, a6, a7, a8, v36);
    goto LABEL_13;
  }

  expert_log(a2, 0LL, (uint64_t)"failed to parse payload: %d", a4, a5, a6, a7, a8, v17);
  uint64_t v33 = v18;
LABEL_20:
  return v33;
}

uint64_t _image4_trust_property_callback_BOOL( uint64_t *a1, unsigned int *a2, uint64_t a3, char a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _image4_trust_find_record(*a5, a3, 1LL, *a2, (uint64_t)a5, a6, a7, a8);
  if (!result) {
    return expert_log(*a1, 2uLL, (uint64_t)"no BOOLean record for tag: %s", v12, v13, v14, v15, v16, (uint64_t)(a2 + 1));
  }
  **(_BYTE **)(result + 24) = a4;
  uint64_t v17 = *(void **)(result + 40);
  if (v17) {
    *uint64_t v17 = *(void *)(result + 24);
  }
  return result;
}

uint64_t _image4_trust_property_callback_integer( uint64_t *a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _image4_trust_find_record(*a5, a3, 2LL, *a2, (uint64_t)a5, a6, a7, a8);
  if (!result) {
    return expert_log(*a1, 2uLL, (uint64_t)"no integer record for tag: %s", v12, v13, v14, v15, v16, (uint64_t)(a2 + 1));
  }
  **(void **)(result + 24) = a4;
  uint64_t v17 = *(void **)(result + 40);
  if (v17) {
    *uint64_t v17 = *(void *)(result + 24);
  }
  return result;
}

uint64_t _image4_trust_property_callback_data( uint64_t *a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _image4_trust_find_record(*a6, a3, 4LL, *a2, a5, (uint64_t)a6, a7, a8);
  if (!result) {
    return expert_log(*a1, 2uLL, (uint64_t)"no data record for tag: %s", v13, v14, v15, v16, v17, (uint64_t)(a2 + 1));
  }
  if (a4 && !a5)
  {
    __break(0x5519u);
  }

  else
  {
    **(void **)(result + 24) = a4;
    **(void **)(result + 32) = a5;
  }

  return result;
}

void _image4_trust_violation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((*(_BYTE *)(*(void *)a4 + 8LL) & 1) != 0)
  {
    char name = chip_get_name(a2);
    __panic_npx( "panic: critical trust evaluation failure: chip = %s, p = %s, payload = %s",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  name);
  }

uint64_t _image4_trust_post_properties( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = 0LL;
  uint64_t v27 = a1 + 152;
  v30[1] = *MEMORY[0x1895F89C0];
  unint64_t v10 = a1 + 1912;
  v30[0] = 0x500000004LL;
  char v11 = 1;
  do
  {
    if (!*(_WORD *)(a1 + 744)) {
      __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v24);
    }
    char v26 = v11;
    uint64_t v12 = *((unsigned int *)v30 + v9);
    uint64_t v13 = *(void *)(a1 + 16);
    expert_log(v13, 2uLL, (uint64_t)"posting properties for container: 0x%x", a4, a5, a6, a7, a8, (int)v12);
    if (v12 >= 6) {
LABEL_16:
    }
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"p_where");
    uint64_t v14 = qword_1894E6520[(int)v12];
    Img4DecodeGetQueryForContainer(v12, a2, a3, a4, a5, a6, a7, a8);
    for (uint64_t i = 0LL; i != 576; i += 48LL)
    {
      uint64_t v16 = a1 + i;
      if (a1 + i + 1384 > v10)
      {
        __break(0x5519u);
LABEL_15:
        __panic_npx("panic: unsupported container for posting", a2, a3, a4, a5, a6, a7, a8, v24);
      }

      uint64_t v17 = *(unsigned int *)(v16 + 1336);
      unsigned int v18 = *(_DWORD *)(v16 + 1352);
      int v29 = 0;
      uint64_t v28 = 0LL;
      uint64_t result = fourcc_init((uint64_t)&v28, v18);
      if (*(void *)(v16 + 1344) == v14)
      {
        uint64_t v20 = 0LL;
        switch((int)v12)
        {
          case 0:
          case 1:
          case 2:
          case 3:
            goto LABEL_15;
          case 4:
            goto LABEL_10;
          case 5:
            if (!*(_WORD *)(a1 + 1320)) {
              continue;
            }
            uint64_t v20 = *(void *)(a1 + 856);
LABEL_10:
            expert_log( v13,  2uLL,  (uint64_t)"posting property callback: container = %x, type = %x, tag = %s",  a4,  a5,  a6,  a7,  a8,  (int)v12);
            uint64_t result = manifest_post_property_callback(v27, v12, v20, v17, (unsigned int *)&v28, v21, v22, v23, v25);
            break;
          case 6:
            continue;
          default:
            goto LABEL_16;
        }
      }
    }

    char v11 = 0;
    uint64_t v9 = 1LL;
  }

  while ((v26 & 1) != 0);
  return result;
}

uint64_t image4_trust_evaluate_audit( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 744)) {
LABEL_22:
  }
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v40);
  unint64_t v11 = *(void *)(a1 + 24);
  unint64_t v10 = *(void *)(a1 + 32);
  uint64_t v12 = (uint64_t *)(a1 + 752);
  int v13 = *(unsigned __int16 *)(a1 + 1320);
  if (*(_WORD *)(a1 + 1320)) {
    uint64_t v14 = a1 + 752;
  }
  else {
    uint64_t v14 = 0LL;
  }
  v42[0] = xmmword_18A3B1DB0;
  v42[1] = *(_OWORD *)&off_18A3B1DC0;
  v42[2] = xmmword_18A3B1DD0;
  uint64_t v43 = _image4_trust_audit;
  v41[0] = a1;
  v41[1] = a3;
  expert_log( a2,  2uLL,  (uint64_t)"performing audit trust evaluation: coprocessor = %s, handle = %llx, secure boot level = %llx, evaluation type = %s",  a4,  a5,  a6,  a7,  a8,  **(void **)(v11 + 16));
  if (v11 && v11 >= v11 + 72)
  {
LABEL_21:
    __break(0x5519u);
    goto LABEL_22;
  }

  uint64_t v15 = image4_environment_resolve(v11);
  if (!v15)
  {
    uint64_t v33 = 45LL;
    expert_log( a2,  0LL,  (uint64_t)"environment not supported: coprocessor = %s, handle = %llx: %d",  a4,  a5,  a6,  a7,  a8,  **(void **)(v11 + 16));
    return v33;
  }

  uint64_t v16 = v15;
  if (!v13 || (uint64_t v17 = payload_parse(v12), !(_DWORD)v17))
  {
LABEL_12:
    if (v10 < v10 + 48)
    {
      image4_trust_evaluation_prepare_manifest_callbacks(v10, (uint64_t)v42);
      manifest_set_callbacks(a1 + 152, (uint64_t)v41, (uint64_t)v42);
      unint64_t v19 = manifest_parse(a1 + 152);
      if ((_DWORD)v19)
      {
        unint64_t v25 = v19;
        expert_log(a2, 0LL, (uint64_t)"failed to parse manifest: %d", v20, v21, v22, v23, v24, v19);
        uint64_t v33 = v25;
      }

      else
      {
        uint64_t v33 = manifest_audit((uint64_t *)(a1 + 152), v16, v14);
        if (!(_DWORD)v33)
        {
          _image4_trust_post_properties(a1, v26, v27, v28, v29, v30, v31, v32);
          expert_log(a2, 1uLL, (uint64_t)"forcing failure after audit completion: %d", v34, v35, v36, v37, v38, 0LL);
          return 35LL;
        }
      }

      goto LABEL_19;
    }

    goto LABEL_21;
  }

  uint64_t v18 = v17;
  if ((_DWORD)v17 == 92)
  {
    expert_log(a2, 1uLL, (uint64_t)"treating payload as non-Image4 wrapped", a4, a5, a6, a7, a8, v40);
    goto LABEL_12;
  }

  expert_log(a2, 0LL, (uint64_t)"failed to parse payload: %d", a4, a5, a6, a7, a8, v17);
  uint64_t v33 = v18;
LABEL_19:
  return v33;
}

uint64_t _image4_trust_override_decode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return image4_auditor_interpose_decode(*(void *)(*(void *)a3 + 48LL), a2);
}

uint64_t _image4_trust_audit( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return image4_auditor_post(*(void *)(*(void *)a6 + 48LL), a2, a3, a4, a5, a6, a7, a8);
}

uint64_t image4_trust_evaluate_boot( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 744)) {
LABEL_13:
  }
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v47);
  unint64_t v11 = *(void *)(a1 + 24);
  unint64_t v10 = *(void *)(a1 + 32);
  v49[0] = xmmword_18A3B1DE8;
  v49[1] = *(_OWORD *)&off_18A3B1DF8;
  v49[2] = xmmword_18A3B1E08;
  uint64_t v50 = 0LL;
  v48[0] = a1;
  v48[1] = a3;
  expert_log( a2,  2uLL,  (uint64_t)"performing boot trust evaluation: coprocessor = %s, type = %s",  a4,  a5,  a6,  a7,  a8,  **(void **)(v11 + 16));
  if (v11 && v11 >= v11 + 72) {
    goto LABEL_12;
  }
  uint64_t v12 = image4_environment_resolve(v11);
  if (!v12)
  {
    uint64_t v26 = 45LL;
    expert_log( a2,  0LL,  (uint64_t)"booter environment not supported: %s: %d",  a4,  a5,  a6,  a7,  a8,  **(void **)(v11 + 16));
    return v26;
  }

  if (v10 >= v10 + 48)
  {
LABEL_12:
    __break(0x5519u);
    goto LABEL_13;
  }

  uint64_t v13 = v12;
  image4_trust_evaluation_prepare_manifest_callbacks(v10, (uint64_t)v49);
  manifest_set_callbacks(a1 + 152, (uint64_t)v48, (uint64_t)v49);
  uint64_t v26 = boot_expert_boot_manifest(a2, v13, (uint64_t *)(a1 + 152), v14, v15, v16, v17, v18);
  if ((_DWORD)v26)
  {
    uint64_t name = chip_get_name(v13);
    expert_log(a2, 0LL, (uint64_t)"manifest boot failed: %s: %d", v28, v29, v30, v31, v32, name);
  }

  else
  {
    _image4_trust_post_properties(a1, v19, v20, v21, v22, v23, v24, v25);
    uint64_t v40 = chip_get_name(v13);
    expert_log(a2, 1uLL, (uint64_t)"manifest boot succeeded: %s", v41, v42, v43, v44, v45, v40);
    expert_dump(a2);
  }

  return v26;
}

uint64_t image4_trust_evaluate_normalize( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 744)) {
LABEL_18:
  }
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v43);
  unint64_t v11 = *(void *)(a1 + 24);
  unint64_t v10 = *(void *)(a1 + 32);
  v49[0] = xmmword_18A3B1DE8;
  v49[1] = *(_OWORD *)&off_18A3B1DF8;
  v49[2] = xmmword_18A3B1E08;
  uint64_t v50 = 0LL;
  v48[0] = a1;
  v48[1] = a3;
  memset(v47, 0, sizeof(v47));
  uint64_t v46 = 0LL;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  expert_log( a2,  2uLL,  (uint64_t)"performing normalization trust evaluation: coprocessor = %s, handle = %llx, evaluation type = %s",  a4,  a5,  a6,  a7,  a8,  **(void **)(v11 + 16));
  if (v11 && v11 >= v11 + 72) {
    goto LABEL_17;
  }
  uint64_t v12 = image4_environment_resolve(v11);
  if (!v12)
  {
    uint64_t v20 = 45LL;
    expert_log( a2,  0LL,  (uint64_t)"environment not supported: coprocessor = %s, handle = %llx: %d",  a4,  a5,  a6,  a7,  a8,  **(void **)(v11 + 16));
LABEL_9:
    uint64_t v51 = &v44;
    buff_destroy(&v51);
    return v20;
  }

  if (v10 >= v10 + 48)
  {
LABEL_17:
    __break(0x5519u);
    goto LABEL_18;
  }

  uint64_t v13 = v12;
  image4_trust_evaluation_prepare_manifest_callbacks(v10, (uint64_t)v49);
  manifest_set_callbacks(a1 + 152, (uint64_t)v48, (uint64_t)v49);
  unint64_t v14 = manifest_parse(a1 + 152);
  if ((_DWORD)v14)
  {
    uint64_t v20 = v14;
    expert_log(a2, 0LL, (uint64_t)"failed to parse manifest: %d", v15, v16, v17, v18, v19, v14);
    goto LABEL_12;
  }

  uint64_t v21 = (void *)closure_init((uint64_t)v47, (void *)(a1 + 152), v13);
  _closure_set_unique_tags(v21, (uint64_t)"HCNBOPECDICEDIDUhcncylpenonsfunsnvrs", 9LL);
  uint64_t v27 = closure_compute((uint64_t)v21, &v44, 0LL, v22, v23, v24, v25, v26);
  if (!(_DWORD)v27)
  {
    if (*(_DWORD *)(a2 + 8) == 1651470196) {
      boot_expert_boot_closure(a2, (uint64_t)v21, (uint64_t)&v44);
    }
    uint64_t v20 = 0LL;
    *(void *)(a1 + 728) = v46;
    __int128 v42 = v45;
    *(_OWORD *)(a1 + 696) = v44;
    *(_OWORD *)(a1 + 712) = v42;
    *(_WORD *)(a1 + 736) = 1;
    *(void *)&__int128 v45 = &_buff_destructor_null;
    goto LABEL_9;
  }

  uint64_t v33 = v27;
  expert_log(a2, 0LL, (uint64_t)"failed to compute closure: %d", v28, v29, v30, v31, v32, v27);
  uint64_t v20 = v33;
LABEL_12:
  uint64_t v51 = &v44;
  buff_destroy(&v51);
  return v20;
}

void image4_trust_new_buff(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3 = *a3;
  uint64_t v4 = a3[1];
  if (v3 > v3 + v4) {
    __break(0x5519u);
  }
  else {
    image4_trust_new(a1, a2, v3, v4, 0LL);
  }
}

void image4_trust_new(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10 = (_WORD *)_expert_alloc_type(*(void *)(a1 + 8), (uint64_t)&_image4_type_trust);
  if (v10)
  {
    _image4_trust_init(v10, a1, a2, a3, a4, a5, 1LL, v11);
    *(void *)(v12 + 40) = &_image4_type_trust;
  }

uint64_t image4_trust_set_auditor(uint64_t result, uint64_t a2)
{
  *(void *)(result + 48) = a2;
  return result;
}

void _image4_trust_init( _WORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8 = a7;
  uint64_t v9 = *(void *)(a2 + 8);
  uint64_t v23 = 0LL;
  memset(v22, 0, sizeof(v22));
  bzero(a1, 0x788uLL);
  *a1 = v8;
  *((void *)a1 + 1) = a6;
  *((void *)a1 + 2) = v9;
  *((void *)a1 + 3) = a2;
  *((void *)a1 + 4) = a3;
  *((void *)a1 + 7) = 0LL;
  if (a1 + 964 < a1)
  {
    __break(0x5519u);
  }

  else
  {
    _image4_trust_add_link((uint64_t)a1, (uint64_t)a1, v16, v17, v18, v19, v20, v21);
    inited = buff_init_wrap(v22, a4, a5);
    manifest_init((uint64_t)(a1 + 76), v9, &inited);
    a1[372] = 1;
  }

uint64_t _image4_trust_add_link( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = result + 144;
  unint64_t v9 = *(void *)(result + 144);
  if (v9 > 4) {
LABEL_9:
  }
    __panic_npx("panic: trust chain length exceeded: %lu", a2, a3, a4, a5, a6, a7, a8, 5);
  unint64_t v10 = (void *)(result + 64 + 16 * v9);
  *(void *)(result + 144) = v9 + 1;
  BOOL v11 = result + 64 > (unint64_t)v10 || (unint64_t)(v10 + 2) > v8;
  if (v11 || (*unint64_t v10 = *(void *)(result + 56), v10[1] = a2, (unint64_t)v10 >= v8))
  {
    __break(0x5519u);
    goto LABEL_9;
  }

  *(void *)(result + 56) = v10;
  return result;
}

uint64_t image4_trust_set_payload(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  int v13 = 0;
  uint64_t v12 = 0LL;
  uint64_t v10 = 0LL;
  memset(v9, 0, sizeof(v9));
  fourcc_init((uint64_t)&v12, a2);
  inited = buff_init_wrap(v9, a3, a4);
  uint64_t result = payload_init(a1 + 752, v7, (unsigned int *)&v12, &inited);
  *(_WORD *)(a1 + 1320) = 1;
  return result;
}

uint64_t image4_trust_set_booter( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = *(void **)(a1 + 32);
  if (v8[1] != *(void *)(a2 + 32)) {
    __panic_npx("panic: trust chaining not supported for evaluation: %s", a2, a3, a4, a5, a6, a7, a8, *v8);
  }
  return _image4_trust_add_link(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t image4_trust_set_result_buffer( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)result) {
    __panic_npx( "panic: operation not supported on this structure version: actual = %hu, expected >= %hu",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  0);
  }
  *(void *)(result + 1912) = a2;
  *(void *)(result + 1920) = a3;
  return result;
}

uint64_t image4_trust_record_property_BOOL( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _image4_trust_init_next_record(a1, a2, 1LL, a3, a5, a6, a7, a8);
  *(void *)(result + 24) = a4;
  *(void *)(result + 40) = a5;
  return result;
}

uint64_t _image4_trust_init_next_record( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = *(void *)(a1 + 1328);
  if (v8 > 0xB) {
LABEL_9:
  }
    __panic_npx("panic: no more property record slots", a2, a3, a4, a5, a6, a7, a8, vars0);
  unint64_t v9 = a1 + 1912;
  uint64_t v10 = (_DWORD *)(a1 + 1336 + 48 * v8);
  BOOL v11 = a1 + 1336 > (unint64_t)v10 || (unint64_t)(v10 + 12) > v9;
  if (v11
    || (uint64_t v12 = a1 + 1336 + 48 * v8,
        *(void *)(v12 + 8) = a2,
        *uint64_t v10 = a3,
        *(_DWORD *)(v12 + 16) = a4,
        *(void *)(a1 + 1328) = v8 + 1,
        (unint64_t)v10 >= v9))
  {
    __break(0x5519u);
    goto LABEL_9;
  }

  return a1 + 1336 + 48 * v8;
}

uint64_t image4_trust_record_property_integer( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _image4_trust_init_next_record(a1, a2, 2LL, a3, a5, a6, a7, a8);
  *(void *)(result + 24) = a4;
  *(void *)(result + 40) = a5;
  return result;
}

void *image4_trust_record_property_data( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = (void *)_image4_trust_init_next_record(a1, a2, 4LL, a3, a5, a6, a7, a8);
  result[3] = a4;
  result[4] = a5;
  result[5] = 0LL;
  return result;
}

void *image4_trust_evaluate( uint64_t a1, uint64_t a2, void (*a3)(uint64_t, const void *, size_t, uint64_t, uint64_t))
{
  uint64_t v7 = *(void **)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  bzero(&v70, 0xE70uLL);
  uint64_t v69 = v7;
  v42[0] = "boot";
  v42[1] = 0xAAAAAAAA626F6F74LL;
  v42[2] = &v69;
  _OWORD v42[3] = &v69;
  v42[4] = _boot_expert_init;
  v42[5] = _boot_expert_boot;
  v42[6] = _boot_expert_logv;
  v42[7] = _boot_expert_dump;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = _boot_expert_get_digest_info;
  uint64_t v46 = 0LL;
  uint64_t v47 = 0LL;
  uint64_t v48 = _boot_expert_get_secure_boot;
  uint64_t v49 = _boot_expert_query_chip;
  uint64_t v50 = _boot_expert_query_chip_boot;
  uint64_t v51 = _boot_expert_query_nonce;
  uint64_t v52 = _boot_expert_entangle_nonce;
  uint64_t v53 = _boot_expert_read_boot_manifest;
  uint64_t v54 = _boot_expert_query_trust_store;
  uint64_t v55 = _boot_expert_read_storage;
  uint64_t v56 = _boot_expert_write_storage;
  uint64_t v57 = _boot_expert_sync_storage;
  uint64_t v58 = _boot_expert_query_property_BOOL;
  uint64_t v59 = _boot_expert_query_property_uint32;
  uint64_t v60 = _boot_expert_query_property_uint64;
  uint64_t v61 = _boot_expert_query_property_digest;
  uint64_t v62 = _boot_expert_query_property_version;
  uint64_t v63 = _boot_expert_init_once;
  uint64_t v64 = _boot_expert_boot_once;
  uint64_t v65 = _boot_expert_read_random;
  uint64_t v66 = _boot_expert_syscall;
  char v67 = _boot_expert_lock;
  uint64_t v68 = _boot_expert_unlock;
  uint64_t v15 = image4_environment_resolve(v6);
  if (v15)
  {
    if (*(void *)(a1 + 144) > 1uLL) {
      uint64_t v7 = v42;
    }
    uint64_t v16 = *(void **)(a1 + 56);
    if (v16)
    {
      uint64_t v17 = 1LL;
      while (1)
      {
        unint64_t v18 = v16[1];
        uint64_t v19 = *(void *)(v18 + 32);
        if (v7 == v42)
        {
          if (!*(_WORD *)(v18 + 744)) {
            goto LABEL_38;
          }
          int v20 = *(unsigned __int16 *)(v18 + 1320);
          *(void *)(v18 + 152) = v42;
          if (v20) {
            *(void *)(v18 + 752) = v42;
          }
        }

        if (v18 >= v18 + 1928) {
          goto LABEL_37;
        }
        uint64_t v21 = (*(uint64_t (**)(void))(v19 + 40))();
        if ((_DWORD)v21) {
          break;
        }
        uint64_t v16 = (void *)*v16;
        ++v17;
        if (!v16)
        {
          uint64_t v22 = 0LL;
          goto LABEL_17;
        }
      }

      uint64_t v22 = v21;
      expert_log( (uint64_t)v7,  0LL,  (uint64_t)"trust evaluation failed: coprocessor = %s, sequence number = %lu, chain length = %lu: %d",  v10,  v11,  v12,  v13,  v14,  **(void **)(v6 + 16));
    }

    else
    {
      uint64_t v22 = 0xFFFFFFFFLL;
    }
  }

  else
  {
    uint64_t v22 = 45LL;
    expert_log( (uint64_t)v7,  0LL,  (uint64_t)"environment not supported: coprocessor = %s, handle = %llx: %d",  v10,  v11,  v12,  v13,  v14,  **(void **)(v6 + 16));
  }

LABEL_17:
  unint64_t v23 = *(void *)(a1 + 32);
  if (*(_WORD *)(a1 + 744)) {
    uint64_t v24 = a1 + 152;
  }
  else {
    uint64_t v24 = 0LL;
  }
  int v25 = *(unsigned __int16 *)(a1 + 1320);
  uint64_t v71 = 0LL;
  v72[0] = 0LL;
  if ((_DWORD)v22)
  {
    uint64_t v26 = 0LL;
    size_t v27 = 0LL;
    uint64_t v28 = v22;
    goto LABEL_35;
  }

  if (v25) {
    uint64_t v29 = a1 + 752;
  }
  else {
    uint64_t v29 = 0LL;
  }
  unint64_t v30 = image4_trust_evaluation_get_result(v23, v15, v24, v29, (uint64_t *)v72);
  size_t v27 = v72[0];
  if (v30 > v30 + v72[0]) {
    goto LABEL_37;
  }
  uint64_t v26 = (const void *)v30;
  uint64_t v31 = v24 + 544;
  if (!*(_WORD *)(v24 + 584)) {
    uint64_t v31 = 0LL;
  }
  uint64_t v71 = v31;
  *(_WORD *)(v24 + 584) = 0;
  if (!v30 || (uint64_t v32 = *(void **)(a1 + 1912)) == 0LL)
  {
    uint64_t v28 = 0LL;
    goto LABEL_35;
  }

  if (*(void *)(a1 + 1920) < v27)
  {
    uint64_t v26 = 0LL;
    size_t v27 = 0LL;
    uint64_t v28 = 7LL;
    goto LABEL_35;
  }

  memcpy(v32, v26, v27);
  if (v27 > *(void *)(a1 + 1920))
  {
LABEL_37:
    __break(0x5519u);
LABEL_38:
    __panic_npx("panic: optional not set", v8, v9, v10, v11, v12, v13, v14, v41);
  }

  uint64_t v28 = 0LL;
  uint64_t v26 = *(const void **)(a1 + 1912);
LABEL_35:
  a3(a1, v26, v27, v28, a2);
  uint64_t result = buff_destroy(&v71);
  return result;
}

        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }

  return result;
}

uint64_t *image4_trust_destroy( uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *result;
  if (*result)
  {
    if (!*(_WORD *)(v8 + 744)) {
      __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v12);
    }
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(v8 + 16);
    unint64_t v11 = v8 + 752;
    if (!*(_WORD *)(v8 + 1320)) {
      unint64_t v11 = 0LL;
    }
    unint64_t v12 = v11;
    uint64_t v13 = v8 + 152;
    manifest_destroy(&v13, a2, a3, a4, a5, a6, a7, a8);
    payload_destroy(&v12);
    return (uint64_t *)_expert_dealloc_type(v10, *(void *)(v8 + 40), v9);
  }

  return result;
}

uint64_t _image4_trust_find_record( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 1LL;
  switch((int)a2)
  {
    case 0:
      goto LABEL_5;
    case 1:
      uint64_t v9 = 2LL;
      goto LABEL_5;
    case 2:
    case 3:
      return v8;
    case 4:
      uint64_t v9 = 3LL;
      goto LABEL_5;
    case 5:
      uint64_t v9 = 4LL;
LABEL_5:
      uint64_t v10 = 0LL;
      break;
    default:
      goto LABEL_15;
  }

  while (1)
  {
    uint64_t v11 = a1 + v10;
    if (a1 + v10 + 1384 > (unint64_t)(a1 + 1912))
    {
      __break(0x5519u);
LABEL_15:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"p_where");
    }

    if (*(_DWORD *)(v11 + 1352) == (_DWORD)a4
      && *(void *)(a1 + v10 + 1344) == v9
      && *(_DWORD *)(v11 + 1336) == (_DWORD)a3)
    {
      break;
    }

    v10 += 48LL;
    if (v10 == 576) {
      return 0LL;
    }
  }

  return a1 + v10 + 1336;
}

void *image4_identifier_init(void *result, uint64_t a2)
{
  *uint64_t result = a2;
  return result;
}

uint64_t image4_identifier_get_constraint( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = **(void **)(*(void *)a1 + 48LL);
  if (v8 >= 9) {
    __panic_npx_3(a1, a2, a3, a4, a5, a6, a7, a8, (char)"id4->id_p->p_constraint->pc_code");
  }
  return qword_1894E6550[v8];
}

void __panic_npx_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  uint64_t v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: unreachable case: %s = 0x%llx", &a9);
  _os_crash();
  __break(1u);
}

uint64_t image4_identifier_get_constraint_cstr(uint64_t a1)
{
  return *(void *)(*(void *)(*(void *)a1 + 48LL) + 8LL);
}

uint64_t image4_identifier_get_fourcc(uint64_t a1)
{
  return *(unsigned int *)(*(void *)a1 + 24LL);
}

uint64_t image4_identifier_get_fourcc_cstr(void *a1)
{
  return *a1 + 28LL;
}

char **dylib_expert()
{
  return &__del0;
}

uint64_t dylib_expert_get_kmod_connect( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return *(unsigned int *)(*(void *)(a1 + 16) + 28LL);
}

size_t _darwin_el0_init(uint64_t a1)
{
  uint64_t v84 = *MEMORY[0x1895F89C0];
  unint64_t v2 = *(void *)(a1 + 24);
  memcpy(__dst, "IODeviceTree:/chosen", sizeof(__dst));
  memcpy(path, "IODeviceTree:/product", sizeof(path));
  memcpy(v81, "IODeviceTree:/chosen/manifest-properties", sizeof(v81));
  memcpy(v80, "IODeviceTree:/chosen/asmb", sizeof(v80));
  size_t v76 = 64LL;
  size_t v77 = 64LL;
  memset(v79, 0, sizeof(v79));
  v78[0] = 0LL;
  v78[1] = 0LL;
  *(void *)unint64_t v2 = os_log_create("com.apple.security.libimage4", "darwin-user");
  io_registry_entry_t v3 = IORegistryEntryFromPath(0, __dst);
  *(_DWORD *)(v2 + 12) = v3;
  if (!v3) {
LABEL_34:
  }
    __panic_npx("panic: failed to get chosen node", v4, v5, v6, v7, v8, v9, v10, v75);
  io_registry_entry_t v11 = IORegistryEntryFromPath(0, path);
  *(_DWORD *)(v2 + 16) = v11;
  if (!v11) {
    __panic_npx("panic: failed to get product node", v12, v13, v14, v15, v16, v17, v18, v75);
  }
  io_registry_entry_t v19 = IORegistryEntryFromPath(0, v81);
  *(_DWORD *)(v2 + 20) = v19;
  if (!v19) {
    __panic_npx("panic: failed to get manifest properties", v20, v21, v22, v23, v24, v25, v26, v75);
  }
  io_registry_entry_t v27 = IORegistryEntryFromPath(0, v80);
  *(_DWORD *)(v2 + 24) = v27;
  if (!v27) {
    expert_log(a1, 3uLL, (uint64_t)"no asmb", v28, v29, v30, v31, v32, v75);
  }
  unint64_t v33 = v2 + 304;
  uint64_t v34 = IOServiceMatching("AppleImage4");
  io_service_t MatchingService = IOServiceGetMatchingService(0, v34);
  if (MatchingService)
  {
    if (v2 >= v33)
    {
LABEL_33:
      __break(0x5519u);
      goto LABEL_34;
    }

    uint64_t v36 = IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, (io_connect_t *)(v2 + 28));
    if ((_DWORD)v36)
    {
      expert_log(a1, 3uLL, (uint64_t)"IOServiceOpen: %d", v6, v7, v8, v9, v10, v36);
      goto LABEL_13;
    }

    uint64_t v37 = "IOServiceOpen: success";
  }

  else
  {
    uint64_t v37 = "IOServiceGetMatchingService failed";
  }

  expert_log(a1, 3uLL, (uint64_t)v37, v6, v7, v8, v9, v10, v75);
LABEL_13:
  if (v2 >= v33) {
    goto LABEL_33;
  }
  int v38 = *__error();
  if (v38 != 2)
  {
    if (v38)
    {
      uint64_t v39 = __error();
      expert_log(a1, 3uLL, (uint64_t)"sysctlbyname[kern.osreleasetype]: %d", v40, v41, v42, v43, v44, *v39);
    }

    else
    {
      *(_WORD *)(v2 + 208) = 1;
    }
  }

  if ((sysctlbyname("kern.bootsessionuuid", v79, &v76, 0LL, 0LL) & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v45 = *__error();
  if (v45 != 2)
  {
    if (v45)
    {
      uint64_t v51 = __error();
      expert_log( a1,  3uLL,  (uint64_t)"sysctlbyname[kern.bootsessionuuid]: %d",  v52,  v53,  v54,  v55,  v56,  *v51);
    }

    else
    {
      if (darwin_uuid_parse(v79, (unsigned __int8 *)v78))
      {
        expert_log( a1,  3uLL,  (uint64_t)"failed to parse boot session uuid: %s: %d",  v46,  v47,  v48,  v49,  v50,  (uint64_t)v79);
        return dylib_expert_state_init(v2 + 32);
      }

      digest_init(v2 + 216, v78, 0x10uLL, v46, v47, v48, v49, v50);
      *(_WORD *)(v2 + 296) = 1;
    }
  }

  uint64_t v57 = getenv("IMAGE4_LOG_FD");
  if (v57)
  {
    uint64_t v58 = v57;
    *__error() = 0;
    uint64_t v59 = strtol(v58, 0LL, 0);
    if (*__error()) {
      __panic_npx("panic: invalid log file descriptor", v60, v61, v62, v63, v64, v65, v66, v75);
    }
    if (v59 >= getdtablesize())
    {
      getdtablesize();
      __panic_npx( "panic: invalid log file descriptor: actual = %ld, expected <= %d",  v68,  v69,  v70,  v71,  v72,  v73,  v74,  v59);
    }

    *(_DWORD *)(v2 + 8) = v59;
  }

  return dylib_expert_state_init(v2 + 32);
}

uint64_t _darwin_el0_boot()
{
  return 0LL;
}

uint64_t _darwin_el0_logv( uint64_t a1, unint64_t a2, char *a3, va_list a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  va_list v14 = a4;
  uint64_t v9 = *(void *)(a1 + 16);
  if (*(_BYTE *)(v9 + 32) || *(void *)(v9 + 48)) {
    return dylib_restoreos_logv(a2, a3, a4, (uint64_t)a4, a5, a6, a7, a8);
  }
  if ((*(_DWORD *)(v9 + 8) & 0x80000000) == 0)
  {
    memset(v13, 0, sizeof(v13));
    int v11 = *(_DWORD *)(v9 + 8);
    uint64_t v12 = getprogname();
    dprintf(v11, "%s: %s\n", v12, v13[0]);
    free(v13[0]);
  }

  switch(a2)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
      uint64_t result = os_log_with_args();
      break;
    default:
      __panic_npx("panic: unreachable case: %s = 0x%llx", 16LL, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)"lvl");
  }

  return result;
}

uint64_t _darwin_el0_dump( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  uint64_t v10 = *(void *)(a1 + 16);
  int v11 = *(unsigned __int16 *)(v10 + 296);
  memset(v35, 0, sizeof(v35));
  __int128 v34 = 0u;
  __int128 v33 = 0u;
  __int128 v32 = 0u;
  __int128 v31 = 0u;
  __int128 v30 = 0u;
  __int128 v29 = 0u;
  qmemcpy(v28, "n/a", sizeof(v28));
  if (v11) {
    digest_print_cstr(v10 + 216, (unint64_t)v28, a3, a4, a5, a6, a7, a8);
  }
  expert_log(a1, a2, (uint64_t)"%6s  %-36s : 0x%llx", a4, a5, a6, a7, a8, (uint64_t)&unk_1894F071F);
  expert_log(a1, a2, (uint64_t)"%6s  %-36s : 0x%llx", v12, v13, v14, v15, v16, (uint64_t)&unk_1894F071F);
  expert_log(a1, a2, (uint64_t)"%6s  %-36s : %s", v17, v18, v19, v20, v21, (uint64_t)&unk_1894F071F);
  return expert_log(a1, a2, (uint64_t)"%6s  %-36s : %s", v22, v23, v24, v25, v26, (uint64_t)&unk_1894F071F);
}

void *_darwin_el0_alloc_type(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t handle = type_get_handle(a2);
  uint64_t size = type_get_size(a2);
  if (!handle) {
    return 0LL;
  }
  int64_t v5 = size;
  int is_multithreaded = _dispatch_is_multithreaded();
  uint64_t result = calloc(1uLL, v5);
  if (is_multithreaded)
  {
    for (; !result; uint64_t result = calloc(1uLL, v5))
      __os_temporary_resource_shortage();
  }

  else
  {
    if (result && v5 <= 0) {
      goto LABEL_11;
    }
    if (!result) {
      goto LABEL_12;
    }
  }

  if (v5 < 1)
  {
LABEL_11:
    __break(0x5519u);
LABEL_12:
    _darwin_el0_alloc_type_cold_1(&v8, v9);
  }

  return result;
}

void _darwin_el0_dealloc_type(int a1, int a2, void *a3)
{
}

void *_darwin_el0_alloc_data(uint64_t a1, int64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int is_multithreaded = _dispatch_is_multithreaded();
  uint64_t result = calloc(1uLL, a2);
  if (is_multithreaded)
  {
    for (; !result; uint64_t result = calloc(1uLL, a2))
      __os_temporary_resource_shortage();
  }

  else
  {
    if (a2 <= 0 && result) {
LABEL_9:
    }
      __break(0x5519u);
    if (!result) {
      _darwin_el0_alloc_type_cold_1(&v5, v6);
    }
  }

  if (a2 < 1) {
    goto LABEL_9;
  }
  return result;
}

void _darwin_el0_dealloc_data(int a1, int a2, void *a3)
{
}

uint64_t _darwin_el0_get_digest_info(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t _darwin_el0_get_exception_level()
{
  return 1LL;
}

uint64_t _darwin_el0_get_unprivileged_limit()
{
  return 6LL;
}

uint64_t _darwin_el0_get_secure_boot( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  io_registry_entry_t v10 = *(_DWORD *)(*(void *)(a1 + 16) + 24LL);
  uint64_t v20 = 0LL;
  if (v10)
  {
    darwin_read_iokit_u32(v10, "lp-smb0", (_DWORD *)&v20 + 1);
    darwin_read_iokit_u32(v10, "lp-smb1", &v20);
    uint64_t v11 = (v20 + HIDWORD(v20));
    expert_log( a1,  2uLL,  (uint64_t)"secure boot state: smb0 = %#x, smb1 = %#x, secure boot = %#x",  v12,  v13,  v14,  v15,  v16,  HIDWORD(v20));
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  expert_log(a1, 2uLL, (uint64_t)"returning secure boot state: %#llx", a4, a5, a6, a7, a8, v11);
  *a2 = v11;
  return 0LL;
}

uint64_t _darwin_el0_query_chip(uint64_t a1, uint64_t a2)
{
  v40[1] = *MEMORY[0x1895F89C0];
  io_registry_entry_t v4 = *(_DWORD *)(*(void *)(a1 + 16) + 12LL);
  v39[0] = xmmword_18A3B1E88;
  v39[1] = *(_OWORD *)&off_18A3B1E98;
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38[2] = v5;
  _OWORD v38[3] = v5;
  v38[0] = v5;
  v38[1] = v5;
  __int16 v37 = 0;
  BOOL v36 = 0;
  darwin_read_iokit_cstr(v4, "crypto-hash-method", (char *)v38);
  expert_log(a1, 2uLL, (uint64_t)"crypto method: %s", v6, v7, v8, v9, v10, (uint64_t)v38);
  if (LODWORD(v38[0]) == 828467315)
  {
    uint64_t v18 = "1spa";
  }

  else
  {
    if (*(void *)&v38[0] != 0x3438332D32616873LL) {
      __panic_npx("panic: non-sensical crypto hash method: %s", v11, v12, v13, v14, v15, v16, v17, (char)v38);
    }
    uint64_t v18 = "2spa";
  }

  *(void *)&v39[0] = v18;
  darwin_read_iokit_BOOL(v4, "use-ddi-secure-boot", (BOOL *)&v37 + 1);
  if (HIBYTE(v37))
  {
    expert_log(a1, 2uLL, (uint64_t)"%s: %#x", v19, v20, v21, v22, v23, (uint64_t)"use-ddi-secure-boot");
    *(void *)&v39[0] = "2amv";
  }

  darwin_read_iokit_BOOL(v4, "allow-ecid-mismatch", (BOOL *)&v37);
  if ((_BYTE)v37)
  {
    expert_log(a1, 2uLL, (uint64_t)"%s: %#x", v24, v25, v26, v27, v28, (uint64_t)"allow-ecid-mismatch");
    *(void *)&v39[0] = "namv";
  }

  darwin_read_iokit_BOOL(v4, "uses-avp-root-ca", &v36);
  if (v36)
  {
    expert_log(a1, 2uLL, (uint64_t)"%s: %#x", v29, v30, v31, v32, v33, (uint64_t)"uses-avp-root-ca");
    *(void *)&v39[0] = "3amv";
  }

  __int128 v34 = (char *)v39 + 8 * a2;
  return *(void *)v34;
}

uint64_t _darwin_el0_query_chip_boot(uint64_t a1, uint64_t a2)
{
  return chip_bin_check((uint64_t)&_darwin_el0_query_chip_boot_bin, a2, 0x2Du);
}

uint64_t _darwin_el0_query_nonce()
{
  return 2LL;
}

uint64_t _darwin_el0_entangle_nonce()
{
  return 78LL;
}

unint64_t _darwin_el0_read_boot_manifest(uint64_t a1, const char *a2, void *a3, size_t *a4)
{
  return darwin_read_iokit_node(*(_DWORD *)(*(void *)(a1 + 16) + 20LL), a2, a3, a4);
}

void _darwin_el0_query_trust_store(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, void *a5)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  unint64_t v5 = *(void *)(a1 + 24);
  uint64_t v36 = 0x4000LL;
  uint64_t v35 = 0LL;
  memset(v34, 0, sizeof(v34));
  uint64_t v33 = 0LL;
  if (a2)
  {
    *(void *)&v39[0] = v34;
    buff_destroy(v39);
    return;
  }

  uint64_t v9 = malloc(0x4000uLL);
  if (!v9) {
    _darwin_el0_query_trust_store_cold_1(&v38, v39);
  }
  __int16 v37 = v9;
  buff_init_xfer(v34, (uint64_t *)&v37, 0x4000LL, (uint64_t)&_buff_destructor_free, 0LL);
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 92));
  uint64_t v14 = (_WORD *)(v5 + 136);
  uint64_t v15 = (void *)(v5 + 96);
  if (*(_WORD *)(v5 + 136)) {
    goto LABEL_5;
  }
  uint64_t v20 = darwin_syscall_image_copy_active(a1, 0LL, (uint64_t *)v34, &v36, v10, v11, v12, v13);
  if (!(_DWORD)v20)
  {
    uint64_t v33 = (uint64_t *)v34;
    if (v5 >= v5 + 304) {
      goto LABEL_18;
    }
    uint64_t v15 = buff_xfer((void *)(v5 + 96), &v33);
    _WORD *v14 = 1;
    uint64_t v14 = v15 + 5;
LABEL_5:
    unint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    if (v15 + 5 <= (void *)v14 && v16 <= *v15 + v17)
    {
      unsigned int v19 = 0;
      *a4 = v16;
      *a5 = v17;
      goto LABEL_12;
    }

LABEL_18:
    __break(0x5519u);
    return;
  }

  unsigned int v19 = v20;
  expert_log(a1, 0LL, (uint64_t)"failed to copy active cryptex0 root: %d", v21, v22, v23, v24, v25, v20);
LABEL_12:
  os_unfair_lock_assert_owner((os_unfair_lock_t)(v5 + 92));
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 92));
  *(void *)&v39[0] = v34;
  buff_destroy(v39);
  if (v19 >= 0x6A) {
    __panic_npx("panic: error not set to valid posix code: %d", v26, v27, v28, v29, v30, v31, v32, v19);
  }
}

    __break(0x5519u);
    goto LABEL_19;
  }

  return result;
}

          __break(0x5519u);
          return result;
        }

uint64_t _darwin_el0_read_storage()
{
  return 78LL;
}

uint64_t _darwin_el0_write_storage()
{
  return 78LL;
}

uint64_t _darwin_el0_sync_storage()
{
  return 78LL;
}

unint64_t _darwin_el0_query_property_BOOL( uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  io_registry_entry_t v10 = *(_DWORD *)(*(void *)(a1 + 16) + 12LL);
  BOOL v26 = 0;
  size_t v25 = 4LL;
  uint64_t v11 = *(void *)(a3 + 16);
  int v13 = 0;
  uint64_t v14 = "certificate-production-status";
  switch(v11)
  {
    case 5LL:
      goto LABEL_14;
    case 6LL:
      int v13 = 0;
      uint64_t v14 = "certificate-security-mode";
      goto LABEL_14;
    case 7LL:
      int v13 = 0;
      uint64_t v14 = "effective-production-status-ap";
      goto LABEL_14;
    case 8LL:
      int v13 = 0;
      uint64_t v14 = "effective-security-mode-ap";
      goto LABEL_14;
    case 9LL:
    case 10LL:
    case 16LL:
    case 17LL:
      goto LABEL_22;
    case 11LL:
      uint64_t v14 = "mix-n-match-prevention-status";
      int v13 = 1;
      goto LABEL_14;
    case 12LL:
      unint64_t result = expert_compute_eieiou(a1, a2, &v26);
      if ((_DWORD)result) {
        goto LABEL_15;
      }
      BOOL v15 = v26;
      goto LABEL_19;
    case 13LL:
      int v13 = 0;
      uint64_t v14 = "internal-use-only-unit";
      goto LABEL_14;
    case 14LL:
      int v13 = 0;
      uint64_t v14 = "engineering-use-only-unit";
      goto LABEL_14;
    case 15LL:
      int v13 = 0;
      uint64_t v14 = "factory-prerelease-global-trust";
      goto LABEL_14;
    case 18LL:
      int v13 = 0;
      uint64_t v14 = "research-enabled";
LABEL_14:
      unint64_t result = darwin_read_iokit_node(v10, v14, &v26, &v25);
      if ((_DWORD)result)
      {
LABEL_15:
      }

      else
      {
        BOOL v15 = v26;
        if (v13) {
          BOOL v24 = !v26;
        }
        else {
LABEL_19:
        }
          BOOL v24 = v15;
        unint64_t result = 0LL;
        *a4 = v24;
      }

      return result;
    default:
      if (v11 != 32) {
LABEL_22:
      }
        __panic_npx( "panic: illegal %s property: %s",  (uint64_t)"certificate-production-status",  a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  *(void *)(*(void *)(a3 + 40) + 8LL));
      BOOL v15 = expert_compute_data_only(a1);
      goto LABEL_19;
  }

unint64_t _darwin_el0_query_property_uint32( uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v22 = 0;
  size_t v21 = 4LL;
  uint64_t v9 = *(void *)(a3 + 16);
  unint64_t result = 45LL;
  switch(v9)
  {
    case 0LL:
      uint64_t v12 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 12LL);
      int v13 = "chip-epoch";
      goto LABEL_10;
    case 1LL:
      uint64_t v12 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 12LL);
      int v13 = "board-id";
      goto LABEL_10;
    case 2LL:
      uint64_t v12 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 12LL);
      int v13 = "chip-id";
      goto LABEL_10;
    case 3LL:
      uint64_t v12 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 12LL);
      int v13 = "security-domain";
      goto LABEL_10;
    case 4LL:
    case 5LL:
    case 6LL:
    case 7LL:
    case 8LL:
    case 9LL:
    case 10LL:
    case 11LL:
    case 12LL:
    case 13LL:
    case 14LL:
    case 15LL:
    case 16LL:
    case 17LL:
    case 18LL:
      goto LABEL_4;
    case 19LL:
      uint64_t v12 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 12LL);
      int v13 = "esdm-fuses";
      goto LABEL_10;
    case 20LL:
    case 21LL:
    case 22LL:
    case 24LL:
      return result;
    case 23LL:
      uint64_t v12 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 16LL);
      int v13 = "cryptex1-product-class";
LABEL_10:
      unint64_t result = darwin_read_iokit_node(*v12, v13, &v22, &v21);
      if ((_DWORD)result)
      {
      }

      else
      {
        *a4 = v22;
      }

      return result;
    default:
      if (v9 != 29) {
LABEL_4:
      }
        __panic_npx( "panic: illegal %s property: %s",  a2,  a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  *(void *)(*(void *)(a3 + 40) + 8LL));
      return result;
  }

  return result;
}

unint64_t _darwin_el0_query_property_uint64( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v20 = 8LL;
  uint64_t v21 = 0LL;
  uint64_t v9 = *(void *)(a3 + 16);
  if (v9 == 27)
  {
    io_registry_entry_t v10 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 24LL);
    uint64_t v11 = "lp-stng";
  }

  else
  {
    if (v9 != 4) {
      __panic_npx( "panic: illegal %s property: %s",  a2,  a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  *(void *)(*(void *)(a3 + 40) + 8LL));
    }
    io_registry_entry_t v10 = (io_registry_entry_t *)(*(void *)(a1 + 16) + 12LL);
    uint64_t v11 = "unique-chip-id";
  }

  unint64_t result = darwin_read_iokit_node(*v10, v11, &v21, &v20);
  if ((_DWORD)result)
  {
  }

  else
  {
    *a4 = v21;
  }

  return result;
}

unint64_t _darwin_el0_query_property_digest( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t v11 = *(void *)(a1 + 16);
  io_registry_entry_t v12 = *(_DWORD *)(v11 + 12);
  memset(v32, 0, sizeof(v32));
  size_t __n = 64LL;
  v29[0] = 0LL;
  memset(v31, 0, sizeof(v31));
  memset(v30, 0, 38);
  size_t v27 = 38LL;
  v29[1] = 0LL;
  uint64_t v13 = *(void *)(a3 + 16);
  if (v13 > 24)
  {
    uint64_t v14 = 45LL;
    switch(v13)
    {
      case 25LL:
        io_registry_entry_t v12 = *(_DWORD *)(v11 + 24);
        uint64_t v15 = "lp-spih";
        goto LABEL_18;
      case 26LL:
        return v14;
      case 28LL:
        uint64_t v25 = darwin_copy_kcinstall_nonce_hash(a1, a2);
        if (!(_DWORD)v25) {
          goto LABEL_25;
        }
        uint64_t v14 = v25;
        if ((_DWORD)v25 == 96)
        {
          unint64_t result = darwin_syscall_nonce_copy_hash(a1, (int *)a2, -1, v32, &__n);
          goto LABEL_19;
        }

        expert_log(a1, 0LL, (uint64_t)"failed to copy kcinstall nonce hash: %d", v18, v19, v20, v21, v22, v25);
        if (!(_DWORD)v14) {
          goto LABEL_25;
        }
        goto LABEL_20;
      case 30LL:
        if (*(_WORD *)(v11 + 296))
        {
          digest_copy((uint64_t)v31, v11 + 216, a3, a4, a5, a6, a7, a8);
          goto LABEL_25;
        }

        uint64_t v14 = 2LL;
        break;
      default:
        goto LABEL_30;
    }

    return v14;
  }

  if (v13 == 9)
  {
    uint64_t v14 = expert_compute_udid(a1, (uint64_t)a2, (uint64_t)v31);
    if (!(_DWORD)v14) {
      goto LABEL_25;
    }
    goto LABEL_20;
  }

  if (v13 != 10)
  {
    if (v13 != 16) {
LABEL_30:
    }
      __panic_npx( "panic: illegal %s property: %s",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(*(void *)(a3 + 40) + 8LL));
    uint64_t v14 = darwin_read_iokit_node(v12, "apfs-preboot-uuid", v30, &v27);
    if (!(_DWORD)v14)
    {
      uint64_t v14 = darwin_uuid_parse(v30, (unsigned __int8 *)v29);
      if (!(_DWORD)v14)
      {
        uint64_t v23 = v29;
        size_t v24 = 16LL;
LABEL_24:
        digest_init((uint64_t)v31, v23, v24, v18, v19, v20, v21, v22);
LABEL_25:
        digest_copy(a4, (uint64_t)v31, v17, v18, v19, v20, v21, v22);
        return 0LL;
      }
    }

LABEL_20:
    return v14;
  }

  uint64_t v15 = "boot-manifest-hash";
LABEL_18:
  unint64_t result = darwin_read_iokit_node(v12, v15, v32, &__n);
LABEL_19:
  uint64_t v14 = result;
  if ((_DWORD)result) {
    goto LABEL_20;
  }
  size_t v24 = __n;
  if (__n <= 0x40)
  {
    uint64_t v23 = v32;
    goto LABEL_24;
  }

  __break(0x5519u);
  return result;
}

    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"constraint->type");
  }

  uint64_t v16 = DERParseInteger((char **)(a4 + 24), &v35);
  uint64_t v23 = a2 + 4;
  size_t v24 = 0LL;
  uint64_t v17 = *(void *)a2;
  uint64_t v25 = 33LL;
  BOOL v26 = v17;
  size_t v27 = *(_DWORD *)(a2 + 8);
  uint64_t v15 = &_property_type_uint32;
  if (v16) {
    uint64_t v15 = &_property_type_uint64;
  }
  uint64_t v14 = &_property_constraint_eq;
LABEL_16:
  uint64_t v28 = v15;
  uint64_t v29 = v14;
  uint64_t v30 = 2;
  uint64_t v31 = xmmword_1894E70D0;
  uint64_t v33 = 0LL;
  __int128 v34 = 0LL;
  uint64_t v32 = 4LL;
  if (a5)
  {
    _property_value_init_with_DERImg4(v37, a4);
    _property_value_init_with_DERImg4(v36, a5);
    uint64_t v55 = 0LL;
    uint64_t v53 = 0u;
    uint64_t v54 = 0u;
    uint64_t v51 = 0u;
    uint64_t v52 = 0u;
    uint64_t v49 = 0u;
    uint64_t v50 = 0u;
    uint64_t v47 = 0u;
    uint64_t v48 = 0u;
    int v45 = 0u;
    uint64_t v46 = 0u;
    uint64_t v43 = 0u;
    uint64_t v44 = 0u;
    uint64_t v41 = 0u;
    uint64_t v42 = 0u;
    uint64_t v39 = 0u;
    uint64_t v40 = 0u;
    uint64_t v38 = 0u;
    uint64_t v19 = v37;
    uint64_t v20 = v36;
    uint64_t v21 = a3;
  }

  else
  {
    uint64_t v55 = 0LL;
    uint64_t v53 = 0u;
    uint64_t v54 = 0u;
    uint64_t v51 = 0u;
    uint64_t v52 = 0u;
    uint64_t v49 = 0u;
    uint64_t v50 = 0u;
    uint64_t v47 = 0u;
    uint64_t v48 = 0u;
    int v45 = 0u;
    uint64_t v46 = 0u;
    uint64_t v43 = 0u;
    uint64_t v44 = 0u;
    uint64_t v41 = 0u;
    uint64_t v42 = 0u;
    uint64_t v39 = 0u;
    uint64_t v40 = 0u;
    uint64_t v38 = 0u;
    uint64_t v21 = a3;
    uint64_t v19 = 0LL;
    uint64_t v20 = 0LL;
  }

  image4_audit_event_init((uint64_t *)&v38, (uint64_t)&v23, v21, (uint64_t)v19, (uint64_t)v20, a6, a7, a8);
  return (*(uint64_t (**)(uint64_t, __int128 *, void))(*(void *)(a1 + 80) + 8LL))( a1,  &v38,  *(void *)(a1 + 88));
}

    __break(0x5519u);
  }

  return result;
}

uint64_t _darwin_el0_query_property_version( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  memset(v22, 0, 64);
  size_t v19 = 64LL;
  uint64_t v21 = 0x3E800000000LL;
  memset(v20, 0, sizeof(v20));
  if (*(void *)(a3 + 16) != 17LL) {
    __panic_npx("panic: illegal %s property: %s", a2, a3, a4, a5, a6, a7, a8, *(void *)(*(void *)(a3 + 40) + 8LL));
  }
  uint64_t boot_manifest = expert_read_boot_manifest(a1, (uint64_t)"love", (uint64_t)v22, (uint64_t)&v19);
  uint64_t v17 = boot_manifest;
  if ((_DWORD)boot_manifest)
  {
  }

  else
  {
    version_init((uint64_t)v20, v22, v19);
    version_copy(a4, v20);
  }

  return v17;
}

uint64_t _darwin_el0_init_once(uint64_t result)
{
  uint64_t v2 = result;
  uint64_t v3 = 0LL;
  if (_darwin_el0_init_once_once != -1)
  {
    uint64_t v1 = result;
    dispatch_once_f(&_darwin_el0_init_once_once, &v2, (dispatch_function_t)_darwin_el0_init_once_tramp);
    unint64_t result = v3;
    if (v3)
    {
      expert_init(v3);
      return expert_dump(v1);
    }
  }

  return result;
}

uint64_t _darwin_el0_boot_once(uint64_t a1)
{
  if (_darwin_el0_boot_once_once != -1) {
    dispatch_once_f(&_darwin_el0_boot_once_once, &__del0, (dispatch_function_t)_darwin_el0_boot_once_tramp);
  }
  return *(unsigned int *)(*(void *)(a1 + 16) + 88LL);
}

uint64_t _darwin_el0_syscall( uint64_t a1, uint64_t a2, void *a3, size_t a4, void *a5, size_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v27 = *(void *)a2;
  size_t v28 = *a6;
  uint64_t result = expert_log(a1, 2uLL, (uint64_t)"syscall: %s", a4, (uint64_t)a5, (uint64_t)a6, a7, a8, v27);
  if (v28 > *a6)
  {
    __break(0x5519u);
  }

  else
  {
    uint64_t v15 = *__error();
    dylib_expert_record_trap_error(a1, a2, (uint64_t)"sysctl", v15, v16, v17, v18, v19);
    return v15;
  }

  return result;
}

uint64_t _darwin_el0_init_once_tramp(uint64_t *a1)
{
  uint64_t v1 = *a1;
  a1[1] = (uint64_t)generic_expert();
  return dylib_init(v1);
}

uint64_t _darwin_el0_boot_once_tramp(uint64_t a1)
{
  uint64_t result = expert_boot(a1);
  *(_DWORD *)(*(void *)(a1 + 24) + 88LL) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

  ;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return _os_crash_msg();
}

double OUTLINED_FUNCTION_3(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL OUTLINED_FUNCTION_4(os_log_s *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

char *OUTLINED_FUNCTION_5(int *a1)
{
  return strerror(*a1);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return _os_log_send_and_compose_impl();
}

void _prepare_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v20[2] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(*(void *)a3 + 24LL);
  uint64_t v5 = *(void *)(v4 + 8);
  v20[0] = 0LL;
  v20[1] = 0LL;
  size_t __n = 0LL;
  memset(v19, 0, sizeof(v19));
  uint64_t boot_nonce = image4_environment_callout_query_boot_nonce(v4, (uint64_t)v20, (uint64_t)&__n);
  if ((_DWORD)boot_nonce)
  {
    if ((_DWORD)boot_nonce != 45) {
      expert_log(v5, 0LL, (uint64_t)"failed to get nonce digest from callback: %d", v7, v8, v9, v10, v11, boot_nonce);
    }
  }

  else if (__n > 0x10)
  {
    __break(0x5519u);
  }

  else
  {
    nonce_init(v19, v20, __n, v7, v8, v9, v10, v11);
    odometer_prepare_nonce(a2, v19, v12, v13, v14, v15, v16, v17);
  }

uint64_t _get_constraint_mask_1()
{
  return 0LL;
}

uint64_t _extract_payload_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = 0LL;
  memset(v7, 0, sizeof(v7));
  payload_get_decoded_bytes(a4, (uint64_t)v7);
  uint64_t result = *(void *)&v7[0];
  *a5 = *((void *)&v7[0] + 1);
  return result;
}

uint64_t img4_chip_init_from_buff(uint64_t a1, unint64_t a2)
{
  uint64_t result = img4_runtime_get_expert(_img4_runtime_default);
  if (a2 == 384)
  {
    uint64_t v12 = result;
    uint64_t v13 = _expert_alloc_type(result, (uint64_t)&_image4_type_custom_chip);
    if (!v13) {
      goto LABEL_8;
    }
    a1 = v13;
    *(void *)(v13 + 720) = v12;
    return a1;
  }

  if (a2)
  {
    *(void *)(a1 + 720) = 0LL;
    if (a2 <= 0x2D7) {
LABEL_8:
    }
      __panic_npx( "panic: object overflows buffer: object = chip, length = %lu, required = %lu",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  a2);
    return a1;
  }

  __break(0x5519u);
  return result;
}

uint64_t img4_chip_select_categorized_ap()
{
  return 0LL;
}

unint64_t img4_chip_select_cryptex1_boot()
{
  unint64_t result = img4_chip_select_effective_ap();
  uint64_t v1 = *(void *)(result + 104);
  if (v1) {
    return *(void *)v1;
  }
  if (result < result + 264)
  {
    char name = chip_get_name(result);
    __panic_npx("panic: no cryptex1 guests for %s", v3, v4, v5, v6, v7, v8, v9, name);
  }

  __break(0x5519u);
  return result;
}

unint64_t img4_chip_select_cryptex1_preboot()
{
  unint64_t result = img4_chip_select_effective_ap();
  uint64_t v1 = *(void *)(result + 104);
  if (v1) {
    return *(void *)(v1 + 16);
  }
  if (result < result + 264)
  {
    char name = chip_get_name(result);
    __panic_npx("panic: no cryptex1 guests for %s", v3, v4, v5, v6, v7, v8, v9, name);
  }

  __break(0x5519u);
  return result;
}

unint64_t img4_chip_get_cryptex1_boot(unint64_t result)
{
  uint64_t v1 = *(void *)(result + 104);
  if (v1) {
    return *(void *)v1;
  }
  if (result + 264 >= result)
  {
    char name = chip_get_name(result);
    __panic_npx("panic: no cryptex1 guests for %s", v3, v4, v5, v6, v7, v8, v9, name);
  }

  __break(0x5519u);
  return result;
}

unint64_t img4_chip_get_cryptex1_boot_proposal(unint64_t result)
{
  uint64_t v1 = *(void *)(result + 104);
  if (v1) {
    return *(void *)(v1 + 8);
  }
  if (result + 264 >= result)
  {
    char name = chip_get_name(result);
    __panic_npx("panic: no cryptex1 guests for %s", v3, v4, v5, v6, v7, v8, v9, name);
  }

  __break(0x5519u);
  return result;
}

uint64_t img4_chip_instantiate(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t expert = img4_runtime_get_expert(_img4_runtime_default);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  memset(v19, 0, sizeof(v19));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t result = expert_runtime_boot(expert);
  if ((_DWORD)result
    || (uint64_t result = chip_instance_instantiate((unint64_t)&v16, expert, a1, v8, v9, v10, v11, v12), (_DWORD)result))
  {
  }

  else
  {
    *(void *)(a2 + 8) = a1;
    *(void *)(a2 + 16) = 0LL;
    *(_OWORD *)(a2 + 24) = v17;
    *(void *)(a2 + 40) = v18;
    *(_DWORD *)(a2 + 48) = DWORD2(v18);
    img4_dgst_init_from_digest(a2 + 64, (uint64_t)v19, v7, v8, v9, v10, v11, v12);
    uint64_t v13 = 0LL;
    *(_OWORD *)(a2 + 128) = v20;
    *(_BYTE *)(a2 + 52) = BYTE12(v21);
    *(_BYTE *)(a2 + 54) = BYTE13(v21);
    *(_BYTE *)(a2 + 60) = BYTE14(v21);
    *(_DWORD *)(a2 + 56) = DWORD2(v21);
    *(_BYTE *)(a2 + 53) = HIBYTE(v21);
    do
    {
      uint64_t v14 = __omit_map[(void)v13];
      if (v14)
      {
        uint64_t v15 = property_find_from_expert(v13);
      }

      uint64_t v13 = (char **)((char *)v13 + 1);
    }

    while (v13 != (char **)34);
    return 0LL;
  }

  return result;
}

uint64_t img4_chip_custom( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v8 = *(const void **)(a1 + 8);
  memset(&v24[8], 0, 120);
  __int128 v22 = (unint64_t)v8;
  __int128 v23 = *(_OWORD *)(a1 + 24);
  *(void *)uint64_t v24 = *(void *)(a1 + 40);
  *(_DWORD *)&v24[8] = *(_DWORD *)(a1 + 48);
  size_t v9 = *(void *)(a1 + 72);
  if (v9 >= 0x31) {
    goto LABEL_10;
  }
  unint64_t v12 = a2 + 264;
  unint64_t v13 = a2 + 720;
  digest_init((uint64_t)&v24[16], (const void *)(a1 + 80), v9, a4, a5, a6, a7, a8);
  uint64_t v14 = 0LL;
  *(_OWORD *)&v24[96] = *(_OWORD *)(a1 + 128);
  v24[124] = *(_BYTE *)(a1 + 52);
  v24[125] = *(_BYTE *)(a1 + 54);
  v24[126] = *(_BYTE *)(a1 + 60);
  *(_DWORD *)&v24[120] = *(_DWORD *)(a1 + 56);
  v24[127] = *(_BYTE *)(a1 + 53);
  do
  {
    uint64_t v15 = __omit_map[(void)v14];
    if (v15)
    {
      __int128 v16 = property_find_from_expert(v14);
      if (v16)
      {
        if ((*(void *)(a1 + 16) & v15) == 0) {
          *((void *)&v22 + 1) |= (unint64_t)v16[9];
        }
      }
    }

    uint64_t v14 = (char **)((char *)v14 + 1);
  }

  while (v14 != (char **)34);
  memcpy((void *)a2, v8, 0x108uLL);
  *(void *)(a2 + 16) = 3LL;
  if (v12 >= v13) {
LABEL_10:
  }
    __break(0x5519u);
  *(void *)(a2 + 264) = "custom chip";
  *(_DWORD *)(a2 + 272) = 1667787120;
  *(void *)(a2 + 280) = a2 + 712;
  *(void *)(a2 + 288) = a2 + 712;
  *(void *)(a2 + 296) = _chip_expert_init;
  *(void *)(a2 + 304) = _chip_expert_boot;
  *(void *)(a2 + 312) = _chip_expert_logv;
  *(void *)(a2 + 320) = _chip_expert_dump;
  *(_OWORD *)(a2 + 328) = 0u;
  *(_OWORD *)(a2 + 344) = 0u;
  *(void *)(a2 + 360) = _chip_expert_get_digest_info;
  *(void *)(a2 + 368) = 0LL;
  *(void *)(a2 + 376) = 0LL;
  *(void *)(a2 + 384) = _chip_expert_get_secure_boot;
  *(void *)(a2 + 392) = _chip_expert_query_chip;
  *(void *)(a2 + 400) = _chip_expert_query_chip_boot;
  *(void *)(a2 + 408) = _chip_expert_query_nonce;
  *(void *)(a2 + 416) = _chip_expert_entangle_nonce;
  *(void *)(a2 + 424) = _chip_expert_read_boot_manifest;
  *(void *)(a2 + 432) = _chip_expert_query_trust_store;
  *(void *)(a2 + 440) = _chip_expert_read_storage;
  *(void *)(a2 + 448) = _chip_expert_write_storage;
  *(void *)(a2 + 456) = _chip_expert_sync_storage;
  *(void *)(a2 + 464) = _chip_expert_query_property_BOOL;
  *(void *)(a2 + 472) = _chip_expert_query_property_uint32;
  *(void *)(a2 + 480) = _chip_expert_query_property_uint64;
  *(void *)(a2 + 488) = _chip_expert_query_property_digest;
  *(void *)(a2 + 496) = _chip_expert_query_property_version;
  *(void *)(a2 + 504) = _chip_expert_init_once;
  *(void *)(a2 + 512) = _chip_expert_boot_once;
  *(void *)(a2 + 520) = _chip_expert_read_random;
  *(void *)(a2 + 528) = _chip_expert_syscall;
  *(void *)(a2 + 536) = _chip_expert_lock;
  *(void *)(a2 + 544) = _chip_expert_unlock;
  *(_OWORD *)(a2 + 552) = v22;
  *(_OWORD *)(a2 + 568) = v23;
  __int128 v17 = *(_OWORD *)&v24[48];
  *(_OWORD *)(a2 + 616) = *(_OWORD *)&v24[32];
  *(_OWORD *)(a2 + 632) = v17;
  __int128 v18 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a2 + 584) = *(_OWORD *)v24;
  *(_OWORD *)(a2 + 600) = v18;
  __int128 v19 = *(_OWORD *)&v24[112];
  *(_OWORD *)(a2 + 680) = *(_OWORD *)&v24[96];
  *(_OWORD *)(a2 + 696) = v19;
  __int128 v20 = *(_OWORD *)&v24[80];
  *(_OWORD *)(a2 + 648) = *(_OWORD *)&v24[64];
  *(_OWORD *)(a2 + 664) = v20;
  *(void *)(a2 + 712) = a2 + 552;
  *(void *)(a2 + 112) = v12;
  return a2;
}

uint64_t img4_chip_select_personalized_ap()
{
  uint64_t v0 = generic_expert_specialist();
  return expert_query_chip(v0, 0LL);
}

uint64_t img4_chip_select_personalized_sep()
{
  return 0LL;
}

uint64_t img4_chip_select_effective_ap()
{
  uint64_t v0 = generic_expert_specialist();
  uint64_t v3 = 0LL;
  if (expert_get_secure_boot(v0, (uint64_t)&v3))
  {
    uint64_t v1 = 0LL;
    uint64_t v3 = 0LL;
  }

  else
  {
    uint64_t v1 = v3;
  }

  return expert_query_chip(v0, v1);
}

void *img4_buff_dealloc(void *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t (*)(void *))result[3];
    if (v1)
    {
      if (result[2]) {
        BOOL v2 = 1;
      }
      else {
        BOOL v2 = result[1] == 0LL;
      }
      if (v2) {
        return (void *)v1(&_img4_runtime_default);
      }
      else {
        __break(0x5519u);
      }
    }
  }

  return result;
}

uint64_t img4_runtime_execute_object(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 104))();
}

uint64_t img4_runtime_copy_object(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 112))();
}

void *img4_runtime_find_object_spec(int a1)
{
  uint64_t v1 = &_img4_runtime_object_spec_local_policy;
  if (a1 != 1819307884) {
    uint64_t v1 = 0LL;
  }
  if (a1 == 1634756974) {
    return &_img4_runtime_object_spec_supplemental_root;
  }
  else {
    return v1;
  }
}

uint64_t img4_buff_init_from_buff(uint64_t result, void *a2)
{
  *(_WORD *)uint64_t result = 0;
  uint64_t v2 = a2[1];
  if (*a2 > (unint64_t)(*a2 + v2))
  {
    __break(0x5519u);
  }

  else
  {
    *(void *)(result + 8) = *a2;
    *(void *)(result + 16) = v2;
    *(void *)(result + 24) = 0LL;
  }

  return result;
}

__n128 img4_buff_steal(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  *(void *)(a2 + 24) = 0LL;
  return result;
}

uint64_t img4_buff_dealloc_internal(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)*a2;
  if (*a2)
  {
    __int128 v3 = (uint64_t (*)(void))v2[3];
    if (v3)
    {
      if (v2[2]) {
        BOOL v5 = 1;
      }
      else {
        BOOL v5 = v2[1] == 0LL;
      }
      if (v5)
      {
        uint64_t result = v3();
        *a2 = 0LL;
      }

      else
      {
        __break(0x5519u);
      }
    }
  }

  return result;
}

uint64_t img4_nonce_init_from_digest( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_WORD *)a1 = 0;
  *(_DWORD *)(a1 + 52) = 48;
  digest_copy_out32(a2, (void *)(a1 + 2), (_DWORD *)(a1 + 52), a4, a5, a6, a7, a8);
  return a1;
}

uint64_t digest_init_from_img4_dgst( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = *(void *)(a2 + 8);
  if (v8 < 0x31) {
    return digest_init(result, (const void *)(a2 + 16), v8, a4, a5, a6, a7, a8);
  }
  __break(0x5519u);
  return result;
}

uint64_t digest_init_from_img4_nonce( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = *(unsigned int *)(a2 + 52);
  __break(0x5519u);
  return result;
}

uint64_t img4_dgst_init_from_digest( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_WORD *)a1 = 0;
  *(void *)(a1 + 8) = 48LL;
  digest_copy_out(a2, (void *)(a1 + 16), (size_t *)(a1 + 8), a4, a5, a6, a7, a8);
  return a1;
}

void *buff_init_from_img4_buff(void *a1, uint64_t a2)
{
  return buff_init_wrap(a1, *(void *)(a2 + 8), *(void *)(a2 + 16));
}

uint64_t img4_runtime_init(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t img4_runtime_alloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t img4_runtime_dealloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t img4_runtime_log_handle(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 48))();
}

uint64_t img4_runtime_get_identifier_BOOL(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 56))();
}

uint64_t img4_runtime_get_identifier_uint32(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 64))();
}

uint64_t img4_runtime_get_identifier_uint64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 72))();
}

uint64_t img4_runtime_get_identifier_digest(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 80))();
}

uint64_t img4_runtime_get_identifier_cstr(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 96))();
}

uint64_t img4_runtime_alloc_type(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 120))();
}

uint64_t img4_runtime_dealloc_type(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 128))();
}

uint64_t img4_runtime_set_nonce(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 136))();
}

uint64_t img4_runtime_roll_nonce(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 144))();
}

uint64_t img4_runtime_copy_nonce(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 152))();
}

void _darwin_runtime_init( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void *_darwin_runtime_alloc(uint64_t a1, int64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int is_multithreaded = _dispatch_is_multithreaded();
  uint64_t result = calloc(1uLL, a2);
  if (is_multithreaded)
  {
    for (; !result; uint64_t result = calloc(1uLL, a2))
      __os_temporary_resource_shortage();
  }

  else
  {
    if (a2 <= 0 && result) {
LABEL_9:
    }
      __break(0x5519u);
    if (!result) {
      _darwin_runtime_alloc_cold_1(&v5, v6);
    }
  }

  if (a2 < 1) {
    goto LABEL_9;
  }
  return result;
}

void _darwin_runtime_dealloc(int a1, void *a2)
{
}

void _darwin_runtime_log( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _darwin_runtime_log_handle( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _darwin_runtime_get_identifier_BOOL()
{
  return 0LL;
}

void _darwin_runtime_get_identifier_uint32( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _darwin_runtime_get_identifier_uint64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _darwin_runtime_get_identifier_digest()
{
  return 0LL;
}

void _darwin_runtime_get_identifier_cstr( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _darwin_runtime_execute_object(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = dylib_expert();
  uint64_t v43 = 0LL;
  memset(v42, 0, sizeof(v42));
  uint64_t v41 = 0LL;
  memset(v40, 0, sizeof(v40));
  char v37 = 2;
  uint64_t v38 = *a2;
  memset(v39, 170, sizeof(v39));
  char v32 = 2;
  uint64_t v33 = v38;
  uint64_t v34 = 0LL;
  uint64_t v36 = 0LL;
  uint64_t v35 = 0LL;
  size_t v31 = 33LL;
  buff_init_from_img4_buff(v42, a3);
  if (a4) {
    uint64_t v8 = a4;
  }
  else {
    uint64_t v8 = a3;
  }
  buff_init_from_img4_buff(v40, v8);
  v39[0] = *(void *)&v42[0];
  LODWORD(v39[1]) = buff_get_length_uint32((uint64_t)v42, v9, v10, v11, v12, v13, v14, v15);
  *(void *)((char *)&v39[1] + 4) = *(void *)&v40[0];
  HIDWORD(v39[2]) = buff_get_length_uint32((uint64_t)v40, v16, v17, v18, v19, v20, v21, v22);
  uint64_t result = dylib_expert_call_method((uint64_t)v7, 0xDuLL, &v37, 0x21uLL, &v32, &v31);
  return result;
}

uint64_t _darwin_runtime_copy_object(uint64_t a1, uint64_t *a2, uint64_t a3, void *a4)
{
  uint64_t v7 = dylib_expert();
  char v39 = 1;
  uint64_t v15 = *a2;
  uint64_t v40 = *a2;
  unint64_t v16 = *(void *)(a3 + 16);
  if (v16) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = *(void *)(a3 + 8) == 0LL;
  }
  if (!v17)
  {
    __break(0x5519u);
    goto LABEL_13;
  }

  uint64_t v41 = *(void *)(a3 + 8);
  if (HIDWORD(v16)) {
LABEL_13:
  }
    __panic_npx( "panic: integer cast overflow: v = %s, actual = %llu, expected <= %llu",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  (char)"payload->i4b_len");
  uint64_t v18 = (uint64_t)v7;
  int v42 = v16;
  char v35 = 1;
  uint64_t v36 = v15;
  uint64_t v37 = 0LL;
  unsigned int v38 = 0;
  size_t v34 = 21LL;
  uint64_t v19 = expert_runtime_boot((uint64_t)v7);
  if ((_DWORD)v19)
  {
    uint64_t v25 = v19;
    expert_log(v18, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v20, v21, v22, v23, v24, v19);
  }

  else
  {
    uint64_t v25 = dylib_expert_call_method(v18, 0xFuLL, &v39, 0x15uLL, &v35, &v34);
    if (!(_DWORD)v25)
    {
      *a4 = v38;
      return v25;
    }
  }

  return v25;
}

void _darwin_runtime_alloc_type( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _darwin_runtime_dealloc_type( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _darwin_runtime_set_nonce( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _darwin_runtime_roll_nonce( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _darwin_runtime_copy_nonce( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t darwin_copy_kcinstall_nonce_hash(uint64_t a1, char *a2)
{
  if (a2 != "ckpa") {
    return 96LL;
  }
  __break(0x5519u);
  return result;
}

uint64_t chip_bin_find_entry(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  for (uint64_t i = 0LL; ; ++i)
  {
    uint64_t v6 = *(void *)(a1 + v4);
    if (!v6) {
      return 0LL;
    }
    if (*(void *)(a2 + 16) == 3LL)
    {
      int v7 = strcmp(*(const char **)(a2 + 8), *(const char **)(v6 + 8));
      if (v6 == a2 || v7 == 0) {
        return a1 + v4;
      }
      goto LABEL_11;
    }

    if (v6 == a2) {
      break;
    }
LABEL_11:
    v4 += 24LL;
    if (v4 == 576) {
      return 0LL;
    }
  }

  return a1 + 24 * i;
}

_DWORD *chip_bin_find_by_fourcc(uint64_t a1, int a2)
{
  uint64_t v2 = 0LL;
  while (1)
  {
    __int128 v3 = *(_DWORD **)(a1 + v2);
    if (!v3 || *v3 == a2) {
      break;
    }
    v2 += 24LL;
    if (v2 == 576) {
      return 0LL;
    }
  }

  return v3;
}

uint64_t chip_bin_find_by_name(uint64_t a1, char *__s2)
{
  uint64_t v4 = 0LL;
  while (1)
  {
    uint64_t v5 = *(void *)(a1 + v4);
    v4 += 24LL;
    if (v4 == 576) {
      return 0LL;
    }
  }

  return v5;
}

uint64_t chip_bin_find_by_handle(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  while (1)
  {
    uint64_t v3 = *(void *)(a1 + v2);
    if (!v3 || *(void *)(a1 + v2 + 8) == a2) {
      break;
    }
    v2 += 24LL;
    if (v2 == 576) {
      return 0LL;
    }
  }

  return v3;
}

uint64_t chip_bin_check(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (chip_bin_find_entry(a1, a2)) {
    return 0LL;
  }
  else {
    return a3;
  }
}

uint64_t _chip_bin_get_data(uint64_t a1, uint64_t a2)
{
  uint64_t result = chip_bin_find_entry(a1, a2);
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

uint64_t _manifest_impose_internal( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))
{
  uint64_t v119 = *MEMORY[0x1895F89C0];
  v114[0] = a1;
  v114[1] = a2;
  v114[2] = a3;
  v114[3] = a4;
  v114[4] = a5;
  uint64_t v115 = 0LL;
  __int128 v116 = 0LL;
  __int128 v117 = _manifest_evaluate_trust_payload;
  unint64_t v118 = 0xAAAAAAAAFFFFFFFFLL;
  uint64_t v112 = 0LL;
  uint64_t v113 = 0LL;
  uint64_t v8 = *a1;
  uint64_t v9 = a1[1];
  if (a3)
  {
    uint64_t v10 = "payload";
  }

  else
  {
    __int128 v117 = _manifest_evaluate_trust_manifest;
    uint64_t v10 = "manifest";
  }

  unint64_t alloc_preference = _type_get_alloc_preference((uint64_t)&_image4_type_decode_context);
  if (alloc_preference <= 1) {
    uint64_t v19 = 1LL;
  }
  else {
    uint64_t v19 = alloc_preference;
  }
  if (v19 == 1) {
    goto LABEL_11;
  }
  if (v19 != 2) {
    goto LABEL_48;
  }
  uint64_t v20 = _expert_alloc_type(v8, (uint64_t)&_image4_type_decode_context);
  if (!v20)
  {
LABEL_11:
    uint64_t size = type_get_size((uint64_t)&_image4_type_decode_context);
    unint64_t v36 = MEMORY[0x1895F8858](size, v29, v30, v31, v32, v33, v34, v35);
    uint64_t v26 = (char *)&v112 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    if (v36 >= 0x31) {
      size_t v37 = v36 - 48;
    }
    else {
      size_t v37 = 0LL;
    }
    memset(v26 + 48, 170, v37);
    *(_OWORD *)uint64_t v26 = 0u;
    *((_OWORD *)v26 + 1) = 0u;
    *((_OWORD *)v26 + 2) = 0u;
    uint64_t v27 = "stack";
  }

  else
  {
    uint64_t v26 = (char *)v20;
    uint64_t v112 = v20;
    uint64_t v27 = "heap";
  }

  *((_OWORD *)v26 + 1) = 0u;
  *((_OWORD *)v26 + 2) = 0u;
  *(_OWORD *)uint64_t v26 = 0u;
  expert_log(*a1, 1uLL, (uint64_t)"decode context allocated on %s", v21, v22, v23, v24, v25, (uint64_t)v27);
  uint64_t v38 = chip_select_decode(a2);
  uint64_t v115 = v38;
  if (!v38)
  {
    uint64_t v85 = *a1;
    uint64_t v84 = 82LL;
    expert_log(v85, 0LL, (uint64_t)"chip environment not booted: %s: %d", v39, v40, v41, v42, v43, *(void *)(a2 + 8));
    goto LABEL_44;
  }

  if (v9)
  {
    uint64_t v44 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v9 + 40);
    if (v44)
    {
      uint64_t v45 = v44(a1, v38, a1[2]);
      if (v45)
      {
        uint64_t v115 = v45;
        *(void *)uint64_t v26 = v45;
      }
    }
  }

  unint64_t v46 = _type_get_alloc_preference((uint64_t)&_image4_type_odometer);
  if (v46 <= 1) {
    uint64_t v47 = 1LL;
  }
  else {
    uint64_t v47 = v46;
  }
  if (v47 == 1) {
    goto LABEL_27;
  }
  if (v47 != 2) {
LABEL_48:
  }
    __panic_npx("panic: unreachable case: %s = 0x%llx", v12, v13, v14, v15, v16, v17, v18, (char)"_t_preference");
  uint64_t v48 = _expert_alloc_type(v8, (uint64_t)&_image4_type_odometer);
  if (v48)
  {
    uint64_t v54 = (char *)v48;
    uint64_t v113 = v48;
    uint64_t v55 = "heap";
    goto LABEL_31;
  }

uint64_t _manifest_evaluate_trust_payload( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 528)) {
    __panic_npx("panic: optional not set", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v25);
  }
  Img4DecodePerformTrustEvaluatationWithCallbacks(**(_DWORD **)(a2[2] + 8LL), a1 + 72, a2[4], a2[5], a3);
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)a1;
  if ((_DWORD)v17) {
    expert_log(v18, 0LL, (uint64_t)"Img4DecodePerformTrustEvaluationWithCallbacks: %d", v11, v12, v13, v14, v15, v17);
  }
  else {
    expert_log( v18,  2uLL,  (uint64_t)"trust evaluation succeeded for payload: %s",  v11,  v12,  v13,  v14,  v15,  *(void *)(a2[2] + 8LL) + 4LL);
  }
  _manifest_record_trust_evaluation_error((uint64_t *)a1, v17, a3, v19, v20, v21, v22, v23);
  return v17;
}

uint64_t _manifest_evaluate_trust_manifest( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 528)) {
    __panic_npx("panic: optional not set", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v26);
  }
  Img4DecodePerformManifestTrustEvaluationWithCallbacks(a1 + 72, a2[4], a2[5], a3);
  uint64_t v17 = v11;
  if ((_DWORD)v11)
  {
    expert_log( *(void *)a1,  0LL,  (uint64_t)"Img4DecodePerformManifestTrustEvaluationWithCallbacks: %d",  v12,  v13,  v14,  v15,  v16,  v11);
  }

  else
  {
    uint64_t v23 = a2[2];
    if (v23)
    {
      uint64_t v26 = *(void *)(v23 + 8) + 4LL;
      uint64_t v24 = "manifest trust evaluation succeeded: %s";
    }

    else
    {
      uint64_t v24 = "manifest trust evaluation succeeded";
    }

    expert_log(*(void *)a1, 2uLL, (uint64_t)v24, v12, v13, v14, v15, v16, v26);
  }

  _manifest_record_trust_evaluation_error((uint64_t *)a1, v17, a3, v18, v19, v20, v21, v22);
  return v17;
}

uint64_t manifest_init(uint64_t a1, uint64_t a2, uint64_t **a3)
{
  if (!a2) {
    a2 = generic_expert_specialist();
  }
  *(void *)a1 = a2;
  bzero((void *)(a1 + 8), 0x218uLL);
  buff_xfer((void *)(a1 + 24), a3);
  *(_WORD *)(a1 + 64) = 1;
  return a1;
}

uint64_t manifest_init_borrow(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    a2 = generic_expert_specialist();
  }
  *(void *)a1 = a2;
  bzero((void *)(a1 + 8), 0x210uLL);
  *(void *)(a1 + 536) = a3;
  buff_borrow((void *)(a1 + 24), a3);
  *(_WORD *)(a1 + 64) = 1;
  return a1;
}

uint64_t manifest_init_wrap(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    a2 = generic_expert_specialist();
  }
  *(void *)a1 = a2;
  bzero((void *)(a1 + 8), 0x218uLL);
  buff_init_alias((void *)(a1 + 24), a3);
  *(_WORD *)(a1 + 64) = 1;
  return a1;
}

uint64_t manifest_set_callbacks(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 8) = a3;
  *(void *)(result + 16) = a2;
  return result;
}

unint64_t manifest_parse(uint64_t a1)
{
  unint64_t v2 = a1 + 64;
  if (*(_WORD *)(a1 + 64))
  {
    uint64_t v3 = (unint64_t *)(a1 + 24);
  }

  else
  {
    unint64_t v2 = 0LL;
    uint64_t v3 = 0LL;
  }

  unint64_t result = *v3;
  uint64_t v5 = v3[1];
  if ((unint64_t)(v3 + 5) > v2 || result > *v3 + v5)
  {
    __break(0x5519u);
  }

  else
  {
    Img4DecodeInitAsManifest(result, v5, a1 + 72);
    if ((_DWORD)v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = posixdr(v7);
      expert_log(*(void *)a1, 0LL, (uint64_t)"Img4DecodeInitAsManifest: %d", v10, v11, v12, v13, v14, v8);
    }

    else
    {
      uint64_t v9 = 0LL;
      *(_WORD *)(a1 + 528) = 1;
    }

    return v9;
  }

  return result;
}

uint64_t manifest_get_restore_info( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 528)) {
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v18);
  }
  uint64_t v8 = a1 + 72;
  char v19 = 0;
  int v9 = Img4DecodeRestoreInfoExists((void *)(a1 + 72), &v19);
  if (v9) {
    __panic_npx("panic: Img4DecodeRestoreInfoExists: %d", v10, v11, v12, v13, v14, v15, v16, v9);
  }
  if (v19) {
    return v8;
  }
  else {
    return 0LL;
  }
}

void *manifest_get_bytes(uint64_t a1, void *a2)
{
  if (*(_WORD *)(a1 + 528)) {
    uint64_t v3 = a1 + 72;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unsigned int v14 = 0;
  uint64_t v13 = 0LL;
  int Manifest = Img4DecodeGetManifest(v3, &v13, &v14);
  if (Manifest) {
    __panic_npx("panic: Img4DecodeGetManifest: %d", v5, v6, v7, v8, v9, v10, v11, Manifest);
  }
  return buff_init_wrap(a2, v13, v14);
}

uint64_t manifest_impose(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v5 = xmmword_18A3B31A8;
  uint64_t v6 = 0LL;
  return _manifest_impose_internal( a1,  a2,  a3,  a4,  (uint64_t (**)(unsigned int, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&v5);
}

uint64_t _manifest_validate_property( unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 >= 7) {
    __panic_npx( "panic: bogus property container input: actual = %u, expected < %u",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  a3);
  }
  if ((_DWORD)a3 == 1) {
    return _manifest_validate_property_object(a1, a2, a3, a4);
  }
  if ((_DWORD)a3) {
    __panic_npx("panic: unreachable", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v9);
  }
  return _manifest_validate_property_manifest(a1, a2, 0, a4);
}

uint64_t manifest_property_callback( uint64_t *a1, uint64_t a2, unsigned int a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = a1[1];
  int v35 = 0;
  uint64_t v34 = 0LL;
  BOOL v33 = 0;
  unint64_t v32 = 0LL;
  unsigned int v31 = 0;
  uint64_t v30 = 0LL;
  if (!v10) {
    return expert_log(*a1, 2uLL, (uint64_t)"no callbacks present", (uint64_t)a4, a5, a6, a7, a8, a9);
  }
  fourcc_init((uint64_t)&v34, a3);
  uint64_t v21 = a4[2];
  if (v21 == 4)
  {
    if (*(void *)(v10 + 16))
    {
      int PropertyData = Img4DecodeGetPropertyData(a4, a3, &v30, &v31);
      uint64_t v23 = *a1;
      if (!PropertyData)
      {
        expert_log( v23,  2uLL,  (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v length = 0x%x",  v16,  v17,  v18,  v19,  v20,  (uint64_t)&v34 + 4);
        return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t, void, uint64_t))(v10 + 16))( a1,  &v34,  a2,  v30,  v31,  a1[2]);
      }

      uint64_t v29 = (char *)&v34 + 4;
      uint64_t v24 = "Img4DecodeGetPropertyData: %s: %d";
      goto LABEL_15;
    }

    uint64_t v23 = *a1;
    uint64_t v24 = "no data property callback";
LABEL_19:
    unint64_t v28 = 2LL;
    return expert_log(v23, v28, (uint64_t)v24, v16, v17, v18, v19, v20, (uint64_t)v29);
  }

  if (v21 == 2)
  {
    if (*(void *)(v10 + 8))
    {
      int PropertyInteger64 = Img4DecodeGetPropertyInteger64((uint64_t)a4, a3, &v32);
      uint64_t v23 = *a1;
      if (!PropertyInteger64)
      {
        expert_log( v23,  2uLL,  (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v = 0x%llx",  v16,  v17,  v18,  v19,  v20,  (uint64_t)&v34 + 4);
        return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, unint64_t, uint64_t))(v10 + 8))( a1,  &v34,  a2,  v32,  a1[2]);
      }

      uint64_t v29 = (char *)&v34 + 4;
      uint64_t v24 = "Img4DecodeGetPropertyInteger64: %s: %d";
      goto LABEL_15;
    }

    uint64_t v23 = *a1;
    uint64_t v24 = "no integer property callback";
    goto LABEL_19;
  }

  if (v21 != 1) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", v14, v15, v16, v17, v18, v19, v20, (char)"i4p->type");
  }
  if (!*(void *)v10)
  {
    uint64_t v23 = *a1;
    uint64_t v24 = "no BOOLean property callback";
    goto LABEL_19;
  }

  int PropertyBoolean = Img4DecodeGetPropertyBoolean((uint64_t)a4, a3, &v33);
  uint64_t v23 = *a1;
  if (!PropertyBoolean)
  {
    expert_log( v23,  2uLL,  (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v = 0x%x",  v16,  v17,  v18,  v19,  v20,  (uint64_t)&v34 + 4);
    return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, BOOL, uint64_t))v10)(a1, &v34, a2, v33, a1[2]);
  }

  uint64_t v29 = (char *)&v34 + 4;
  uint64_t v24 = "Img4DecodeGetPropertyBoolean: %s: %d";
LABEL_15:
  unint64_t v28 = 0LL;
  return expert_log(v23, v28, (uint64_t)v24, v16, v17, v18, v19, v20, (uint64_t)v29);
}

uint64_t manifest_post_property_callback( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *a5;
  unsigned __int8 v43 = 0;
  uint64_t v41 = 0LL;
  uint64_t v42 = 0LL;
  uint64_t v40 = 0LL;
  if (v10)
  {
    int v13 = a4;
    uint64_t v14 = a3;
    if (!a3)
    {
      if (!*(_WORD *)(a1 + 528)) {
        __panic_npx("panic: optional not set", a2, 0LL, a4, (uint64_t)a5, a6, a7, a8, v38);
      }
      uint64_t v14 = a1 + 72;
    }

    uint64_t QueryForContainer = Img4DecodeGetQueryForContainer(a2, a2, a3, a4, (uint64_t)a5, a6, a7, a8);
    if (!QueryForContainer) {
      __panic_npx("panic: unsupported container for posting: %u", v17, v18, v19, v20, v21, v22, v23, a2);
    }
    uint64_t v24 = (uint64_t *)QueryForContainer;
    if (Img4DecodeContainerExists(QueryForContainer, v14, (uint64_t)&v43))
    {
      uint64_t v39 = *v24;
      unint64_t v32 = "failed to check for %s: %d";
      uint64_t v33 = *(void *)a1;
LABEL_8:
      unint64_t v34 = 0LL;
      return expert_log(v33, v34, (uint64_t)v32, v27, v28, v29, v30, v31, v39);
    }

    if (!v43)
    {
      uint64_t v33 = *(void *)a1;
      uint64_t v39 = *v24;
      unint64_t v32 = "%s does not exist";
      goto LABEL_8;
    }

    unint64_t v36 = v24 + 6;
    switch(v13)
    {
      case 4:
        if (v24 < v36)
        {
          int PropertyData = Img4DecodeQueryPropertyData((uint64_t)v24, v14, v11, (uint64_t)&v40, (uint64_t)&v41);
          if (!PropertyData)
          {
            if (*(void *)(v10 + 16))
            {
              expert_log( *(void *)a1,  2uLL,  (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v length = %lu",  v27,  v28,  v29,  v30,  v31,  (uint64_t)(a5 + 1));
              (*(void (**)(uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, void))(v10 + 16))( a1,  a5,  a2,  v40,  v41,  *(void *)(a1 + 16));
            }

            goto LABEL_31;
          }

          goto LABEL_26;
        }

        break;
      case 2:
        if (v24 < v36)
        {
          int PropertyData = Img4DecodeQueryPropertyInteger64((uint64_t)v24, v14, v11, (uint64_t)&v42);
          if (!PropertyData)
          {
            if (*(void *)(v10 + 8))
            {
              expert_log( *(void *)a1,  2uLL,  (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v = 0x%llx",  v27,  v28,  v29,  v30,  v31,  (uint64_t)(a5 + 1));
              (*(void (**)(uint64_t, unsigned int *, uint64_t, uint64_t, void))(v10 + 8))( a1,  a5,  a2,  v42,  *(void *)(a1 + 16));
            }

            goto LABEL_31;
          }

LABEL_26:
          uint64_t v33 = *(void *)a1;
          if (PropertyData != 1)
          {
            uint64_t v39 = *v24;
            unint64_t v32 = "failed to decode property: container = %s, type = %x, p = %s: %d";
            goto LABEL_8;
          }

          uint64_t v39 = *v24;
          unint64_t v32 = "property does not exist: container = %s, type = %x, p = %s";
LABEL_32:
          unint64_t v34 = 2LL;
          return expert_log(v33, v34, (uint64_t)v32, v27, v28, v29, v30, v31, v39);
        }

        break;
      case 1:
        if (v24 < v36)
        {
          int PropertyData = Img4DecodeQueryPropertyBool((uint64_t)v24, v14, v11, (uint64_t)&v43);
          if (!PropertyData)
          {
            if (*(void *)v10)
            {
              expert_log( *(void *)a1,  2uLL,  (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v = 0x%x",  v27,  v28,  v29,  v30,  v31,  (uint64_t)(a5 + 1));
              (*(void (**)(uint64_t, unsigned int *, uint64_t, void, void))v10)( a1,  a5,  a2,  v43,  *(void *)(a1 + 16));
            }

uint64_t manifest_audit(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  __int128 v4 = xmmword_18A3B31C0;
  uint64_t v5 = 0LL;
  return _manifest_impose_internal( a1,  a2,  a3,  0LL,  (uint64_t (**)(unsigned int, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&v4);
}

uint64_t _manifest_audit_property( unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 >= 7) {
    __panic_npx( "panic: bogus property container input: actual = %u, expected < %u",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  a3);
  }
  uint64_t v8 = **(uint64_t ***)(a4 + 40);
  if ((_DWORD)a3 == 1)
  {
    uint64_t v9 = _manifest_validate_property_object(a1, a2, a3, a4);
    if (!(_DWORD)v9) {
      return 0LL;
    }
LABEL_7:
    expert_log(*v8, 1uLL, (uint64_t)"auditing manifest; ignoring validation result: %d", v10, v11, v12, v13, v14, v9);
    return 0LL;
  }

  if (!(_DWORD)a3)
  {
    uint64_t v9 = _manifest_validate_property_manifest(a1, a2, 0, a4);
    if ((_DWORD)v9) {
      goto LABEL_7;
    }
  }

  return 0LL;
}

uint64_t manifest_measure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(void *)a1;
  memset(__dst, 0, sizeof(__dst));
  if (*(_WORD *)(a1 + 528)) {
    uint64_t v6 = a1 + 72;
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t v46 = 0LL;
  unint64_t alloc_preference = _type_get_alloc_preference((uint64_t)&_image4_type_decode_context);
  if (alloc_preference <= 1) {
    uint64_t v15 = 1LL;
  }
  else {
    uint64_t v15 = alloc_preference;
  }
  if (v15 == 1) {
    goto LABEL_11;
  }
  if (v15 != 2) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", v8, v9, v10, v11, v12, v13, v14, (char)"_t_preference");
  }
  uint64_t v16 = _expert_alloc_type(v5, (uint64_t)&_image4_type_decode_context);
  if (!v16)
  {
LABEL_11:
    uint64_t size = type_get_size((uint64_t)&_image4_type_decode_context);
    unint64_t v26 = MEMORY[0x1895F8858](size, v19, v20, v21, v22, v23, v24, v25);
    uint64_t v17 = (_OWORD *)((char *)&v45 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    if (v26 >= 0x31) {
      size_t v27 = v26 - 48;
    }
    else {
      size_t v27 = 0LL;
    }
    memset(v17 + 3, 170, v27);
    *uint64_t v17 = 0u;
    v17[1] = 0u;
    v17[2] = 0u;
  }

  else
  {
    uint64_t v17 = (_OWORD *)v16;
    uint64_t v46 = v16;
  }

  v17[1] = 0u;
  v17[2] = 0u;
  *uint64_t v17 = 0u;
  uint64_t v28 = chip_select_decode(a2);
  if (!v28) {
    __panic_npx( "panic: no decode implementation available for chip: %s",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  *(void *)(a2 + 8));
  }
  uint64_t v36 = v28;
  size_t v37 = *(size_t **)(v28 + 32);
  size_t v38 = *v37;
  if (*v37 > 0x40)
  {
    __break(0x5519u);
LABEL_21:
    __panic_npx("panic: Img4DecodeCopyManifestDigest: %d", v29, v30, v36, v32, v33, v34, v35, v28);
  }

  LODWORD(v28) = Img4DecodeCopyManifestDigest( v6,  __dst,  *v37,  (uint64_t (**)(uint64_t, void, _OWORD *, size_t, void))v28);
  if ((_DWORD)v28) {
    goto LABEL_21;
  }
  _expert_dealloc_type(v5, (uint64_t)&_image4_type_decode_context, &v46);
  return digest_init(a3, __dst, v38, v39, v40, v41, v42, v43);
}

void *manifest_destroy( void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *result;
  if (*result)
  {
    if (!*(_WORD *)(v8 + 64)) {
      __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v12);
    }
    uint64_t v9 = result;
    uint64_t v13 = (void *)(v8 + 24);
    uint64_t v10 = *(void *)(v8 + 536);
    if (v10) {
      buff_return(v10, &v13);
    }
    uint64_t v11 = v8 + 544;
    if (!*(_WORD *)(v8 + 584)) {
      uint64_t v11 = 0LL;
    }
    uint64_t v12 = v11;
    buff_destroy(&v12);
    *(_WORD *)(v8 + 64) = 0;
    unint64_t result = buff_destroy(&v13);
    *uint64_t v9 = 0LL;
  }

  return result;
}

uint64_t *_manifest_record_trust_evaluation_error( uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((_DWORD)a2)
  {
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(a3 + 40);
    if (*(_DWORD *)(v10 + 64) == -1)
    {
      expert_log(*result, 1uLL, (uint64_t)"certificate trust evaluation failed", a4, a5, a6, a7, a8, v11);
      *(_DWORD *)(v10 + 64) = 80;
    }

    return (uint64_t *)expert_log( *v9,  0LL,  (uint64_t)"trust evaluation: dr = %d, ct = 0x%x, error = %d",  a4,  a5,  a6,  a7,  a8,  a2);
  }

  return result;
}

uint64_t _manifest_validate_property_manifest(unsigned int a1, uint64_t *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 40);
  uint64_t v7 = *(void *)(v6 + 48);
  uint64_t v8 = *(uint64_t **)v6;
  uint64_t v9 = *(void *)(v6 + 8);
  int v46 = 0;
  uint64_t v45 = 0LL;
  uint64_t v10 = (uint64_t *)fourcc_init((uint64_t)&v45, a1);
  uint64_t result = expert_log(*v8, 1uLL, (uint64_t)"manifest property: %s", v11, v12, v13, v14, v15, (uint64_t)v10 + 4);
  uint64_t v23 = v8 + 74;
  uint64_t result = property_find_from_fourcc(v10, 0LL, v17, v18, v19, v20, v21, v22);
  if (!result)
  {
    if (v8 >= v23) {
      goto LABEL_19;
    }
    _manifest_audit_pseudo_callback((uint64_t)v8, v10, a3);
    uint64_t v40 = "unrecognized manifest property: %s";
LABEL_15:
    uint64_t result = expert_log(*v8, 1uLL, (uint64_t)v40, v30, v31, v32, v33, v34, (uint64_t)v10 + 4);
    goto LABEL_16;
  }

  uint64_t v29 = result;
  uint64_t result = odometer_update(v7, result, (uint64_t)a2, v24, v25, v26, v27, v28);
  if (!(_DWORD)result)
  {
    if (v8 >= v23) {
      goto LABEL_19;
    }
    uint64_t v41 = v8[1];
    if (v41)
    {
      uint64_t v42 = *(void (**)(uint64_t *, uint64_t, uint64_t, void, void, uint64_t))(v41 + 48);
      if (v42) {
        v42(v8, v29, 2LL, 0LL, 0LL, v8[2]);
      }
    }

    uint64_t v40 = "anti-replay property consumed by odometer: %s";
    goto LABEL_15;
  }

  if (v8 >= v23)
  {
LABEL_19:
    __break(0x5519u);
    return result;
  }

  uint64_t result = _manifest_impose_property(v8, v29, v9, a2, v6);
  if ((_DWORD)result)
  {
    *(_DWORD *)(v6 + 64) = result;
    expert_log( *v8,  0LL,  (uint64_t)"property failed to impose on environment: %s: %d",  v35,  v36,  v37,  v38,  v39,  (uint64_t)v10 + 4);
    return 3LL;
  }

LABEL_16:
  if (v8 >= v23) {
    goto LABEL_19;
  }
  manifest_property_callback(v8, a3, a1, a2, v36, v37, v38, v39, v43);
  return 0LL;
}

  if ((_DWORD)v14 == 85) {
    return 8LL;
  }
  return v14;
}

    __break(0x5519u);
  }

  return result;
}

uint64_t _manifest_validate_property_object(unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 40);
  uint64_t v8 = *(uint64_t **)v7;
  uint64_t v9 = *(void *)(v7 + 8);
  int v36 = 0;
  uint64_t v35 = 0LL;
  uint64_t v10 = (uint64_t *)fourcc_init((uint64_t)&v35, a1);
  uint64_t result = expert_log(*v8, 1uLL, (uint64_t)"object property: %s", v11, v12, v13, v14, v15, (uint64_t)v10 + 4);
  uint64_t v23 = v8 + 74;
  uint64_t result = property_find_from_fourcc(v10, 1LL, v17, v18, v19, v20, v21, v22);
  if (!result)
  {
    if (v8 < v23)
    {
      _manifest_audit_pseudo_callback((uint64_t)v8, v10, a3);
      uint64_t result = expert_log( *v8,  1uLL,  (uint64_t)"unrecognized object property: %s",  v29,  v30,  v31,  v32,  v33,  (uint64_t)v10 + 4);
      goto LABEL_9;
    }

uint64_t _manifest_audit_pseudo_callback(uint64_t result, uint64_t *a2, int a3)
{
  uint64_t v3 = *(void *)(result + 8);
  v6[0] = (char *)a2 + 4;
  v6[1] = 0LL;
  uint64_t v4 = *a2;
  v6[2] = 33LL;
  v6[3] = v4;
  int v7 = *((_DWORD *)a2 + 2);
  uint64_t v8 = &_property_type_BOOL;
  uint64_t v9 = &_property_constraint_na;
  int v10 = a3;
  __int128 v11 = xmmword_1894E70D0;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v12 = 4LL;
  if (v3)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, void *, uint64_t, void, void, void))(v3 + 48);
    if (v5) {
      return v5(result, v6, 3LL, 0LL, 0LL, *(void *)(result + 16));
    }
  }

  return result;
}

uint64_t _manifest_impose_property(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v82 = *MEMORY[0x1895F89C0];
  uint64_t v10 = *a1;
  digest = chip_get_digest(a3);
  v81[0] = xmmword_1894E70E8;
  memset(&v81[1], 170, 88);
  __n_4[0] = xmmword_1894E70E8;
  memset(&__n_4[1], 170, 88);
  uint64_t v12 = *(unsigned int *)(a2 + 24);
  unsigned int __n = 0;
  *(void *)uint64_t v78 = 0LL;
  uint64_t constraint = chip_get_constraint(a3, a2, *(void *)(a5 + 24));
  int v21 = *(_DWORD *)(constraint + 56);
  if (v21)
  {
    if (v21 == 6)
    {
      uint64_t property_BOOL = 0LL;
      goto LABEL_46;
    }

    if (v21 != 1)
    {
      uint64_t v76 = "p->p_container";
LABEL_54:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v13, v14, v15, v16, v17, v18, v19, (char)v76);
    }

    uint64_t v22 = 85LL;
    uint64_t v23 = "object";
  }

  else
  {
    uint64_t v22 = 13LL;
    uint64_t v23 = "manifest";
  }

  if (property_imposable(constraint, a3))
  {
    switch(**(void **)(constraint + 40))
    {
      case 0LL:
        uint64_t PropertyBoolean = Img4DecodeGetPropertyBoolean((uint64_t)a4, v12, (BOOL *)v81);
        if ((_DWORD)PropertyBoolean)
        {
          uint64_t v25 = PropertyBoolean;
          uint64_t property_BOOL = posixdr(PropertyBoolean);
          expert_log(*a1, 0LL, (uint64_t)"Img4DecodeGetPropertyBoolean: %d", v27, v28, v29, v30, v31, v25);
          goto LABEL_26;
        }

        uint64_t property_BOOL = expert_query_property_BOOL(v10, a3, constraint, (unsigned __int8 *)__n_4);
        if ((_DWORD)property_BOOL) {
          goto LABEL_43;
        }
        if (!property_constrain_BOOL( constraint,  v10,  (unsigned __int8 *)v81,  (unsigned __int8 *)__n_4,  v16,  v17,  v18,  v19)) {
          goto LABEL_39;
        }
        goto LABEL_42;
      case 1LL:
        uint64_t PropertyInteger = Img4DecodeGetPropertyInteger((uint64_t)a4, v12, v81);
        if ((_DWORD)PropertyInteger)
        {
          uint64_t v35 = PropertyInteger;
          uint64_t property_BOOL = posixdr(PropertyInteger);
          expert_log(*a1, 0LL, (uint64_t)"Img4DecodeGetPropertyInteger: %d", v36, v37, v38, v39, v40, v35);
          goto LABEL_26;
        }

        uint64_t property_BOOL = expert_query_property_uint32(v10, a3, constraint, __n_4);
        if ((_DWORD)property_BOOL) {
          goto LABEL_43;
        }
        if (!property_constrain_uint32( constraint,  v10,  (unsigned int *)v81,  (unsigned int *)__n_4,  v16,  v17,  v18,  v19)) {
          goto LABEL_39;
        }
        goto LABEL_42;
      case 2LL:
        uint64_t PropertyInteger64 = Img4DecodeGetPropertyInteger64((uint64_t)a4, v12, (unint64_t *)v81);
        if ((_DWORD)PropertyInteger64)
        {
          uint64_t v42 = PropertyInteger64;
          uint64_t property_BOOL = posixdr(PropertyInteger64);
          expert_log(*a1, 0LL, (uint64_t)"Img4DecodeGetPropertyInteger64: %d", v43, v44, v45, v46, v47, v42);
          goto LABEL_26;
        }

        uint64_t property_BOOL = expert_query_property_uint64(v10, a3, constraint, __n_4);
        if ((_DWORD)property_BOOL) {
          goto LABEL_43;
        }
        if (!property_constrain_uint64( constraint,  v10,  (unint64_t *)v81,  (unint64_t *)__n_4,  v16,  v17,  v18,  v19)) {
          goto LABEL_39;
        }
        goto LABEL_42;
      case 3LL:
        uint64_t PropertyData = Img4DecodeGetPropertyData(a4, v12, v78, &__n);
        if ((_DWORD)PropertyData) {
          goto LABEL_25;
        }
        digest_init((uint64_t)v81, *(const void **)v78, __n, v49, v50, v51, v52, v53);
        if (property_equal(constraint, (uint64_t)digest))
        {
          expert_log(*a1, 1uLL, (uint64_t)"imposing object digest", v54, v55, v56, v57, v58, v77);
          payload_measure(*(void *)(a5 + 16), a3, (uint64_t)__n_4);
        }

        else
        {
          uint64_t property_BOOL = expert_query_property_digest(v10, a3, constraint, (uint64_t)__n_4);
          if ((_DWORD)property_BOOL) {
            goto LABEL_43;
          }
        }

        if (property_constrain_digest( constraint,  v10,  (unint64_t)v81,  (unint64_t)__n_4,  v16,  v17,  v18,  v19))
        {
          goto LABEL_42;
        }

        goto LABEL_39;
      case 4LL:
        uint64_t PropertyData = Img4DecodeGetPropertyData(a4, v12, v78, &__n);
        if ((_DWORD)PropertyData)
        {
LABEL_25:
          uint64_t v59 = PropertyData;
          uint64_t property_BOOL = posixdr(PropertyData);
          expert_log(*a1, 0LL, (uint64_t)"Img4DecodeGetPropertyData: %d", v60, v61, v62, v63, v64, v59);
LABEL_26:
          if (!(_DWORD)property_BOOL)
          {
LABEL_46:
            uint64_t v70 = 1LL;
LABEL_47:
            uint64_t v73 = a1[1];
            if (v73)
            {
              uint64_t v74 = *(void (**)(uint64_t *, uint64_t, uint64_t, _OWORD *, _OWORD *, uint64_t))(v73 + 48);
              if (v74) {
                v74(a1, constraint, v70, v81, __n_4, a1[2]);
              }
            }

            if (property_BOOL >= 0x6A) {
              __panic_npx( "panic: error not set to valid posix code: %d",  v13,  v70,  v15,  v16,  v17,  v18,  v19,  property_BOOL);
            }
            return property_BOOL;
          }
        }

        else
        {
          version_init((uint64_t)v81, *(char **)v78, __n);
          uint64_t property_BOOL = expert_query_property_version(v10, a3, constraint, (uint64_t)__n_4);
          if (!(_DWORD)property_BOOL)
          {
            if (!property_constrain_version( constraint,  v10,  (uint64_t)v81,  (uint64_t)__n_4,  v16,  v17,  v18,  v19))
            {
LABEL_39:
              expert_log( *a1,  2uLL,  (uint64_t)"%s constraint satisfied: property = %s, type = %s",  v65,  v66,  v67,  v68,  v69,  (uint64_t)v23);
              uint64_t property_BOOL = 0LL;
              uint64_t v70 = 0LL;
              goto LABEL_47;
            }

LABEL_42:
            expert_log( *a1,  0LL,  (uint64_t)"%s constraint violated: property = %s, type = %s: %d",  v65,  v66,  v67,  v68,  v69,  (uint64_t)v23);
            uint64_t property_BOOL = v22;
          }
        }

      __break(0x5519u);
LABEL_43:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v17, v18, v19, v20, v21, v22, v23, (char)"pti->pt_switchable");
    }

    uint64_t v13 = 0;
    uint64_t v9 = 1LL;
  }

  while ((v14 & 1) != 0);
  if (!v12) {
    return result;
  }
LABEL_39:
  uint64_t v45 = *(uint64_t (**)(uint64_t, _DWORD *, uint64_t, char *, size_t, uint64_t))(v12 + 16);
  if (v45) {
    return v45(a1, a2, a3, a4, a5, v46);
  }
  return result;
}

LABEL_6:
        uint64_t v15 = *a1;
        uint64_t v16 = chip_get_name(a1[2]);
        expert_log(v15, 0LL, (uint64_t)"odometer[%s:%s]: constraint violation: %s: %d", v17, v18, v19, v20, v21, v16);
        goto LABEL_19;
      }

      uint64_t v80 = property_version;
      uint64_t v81 = *a1;
      uint64_t v82 = chip_get_name(a1[2]);
      expert_log(v81, 0LL, (uint64_t)"odometer[%s:%s]: failed to query expert: p = %s: %d", v83, v84, v85, v86, v87, v82);
      uint64_t v8 = v80;
LABEL_19:
      return v8;
    default:
      goto LABEL_46;
  }

      __break(0x5519u);
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    __int128 v11 = *a1;
    uint64_t v16 = a1[1];
    if (ccder_blob_decode_tl())
    {
      int v7 = v11;
      if (v16 < v11) {
        goto LABEL_42;
      }
      *a3 = v11;
      a3[1] = 0LL;
      uint64_t v8 = 1;
LABEL_15:
      *a2 = v8;
      goto LABEL_16;
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    uint64_t v12 = *a1;
    uint64_t v17 = a1[1];
    if (ccder_blob_decode_tl())
    {
      int v7 = v12;
      if (v17 < v12) {
        goto LABEL_42;
      }
      *a3 = v12;
      a3[1] = 0LL;
      uint64_t v8 = 2;
      goto LABEL_15;
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    uint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      uint64_t v9 = 3;
LABEL_23:
      *a2 = v9;
      goto LABEL_6;
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    uint64_t v13 = *a1;
    uint64_t v18 = a1[1];
    if (ccder_blob_decode_tl())
    {
      int v7 = v13;
      if (v18 < v13) {
        goto LABEL_42;
      }
      *a3 = v13;
      a3[1] = 0LL;
      uint64_t v8 = 4;
      goto LABEL_15;
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    uint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      uint64_t v9 = 5;
      goto LABEL_23;
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    uint64_t v14 = *a1;
    uint64_t v19 = a1[1];
    if (ccder_blob_decode_tl())
    {
      int v7 = v14;
      if (v19 < v14) {
        goto LABEL_42;
      }
      *a3 = v14;
      a3[1] = 0LL;
      uint64_t v8 = 6;
      goto LABEL_15;
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    uint64_t v15 = *a1;
    uint64_t v20 = a1[1];
    if (ccder_blob_decode_tl())
    {
      int v7 = v15;
      if (v20 < v15) {
        goto LABEL_42;
      }
      *a3 = v15;
      a3[1] = 0LL;
      uint64_t v8 = 7;
      goto LABEL_15;
    }

    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    uint64_t v10 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      uint64_t v9 = 8;
      goto LABEL_23;
    }
  }

  return result;
}

LABEL_43:
        uint64_t v71 = a1[1];
        if (v71)
        {
          uint64_t v72 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v71 + 24);
          if (v72) {
            v72(a1, a3, constraint, a1[2]);
          }
        }

        goto LABEL_46;
      default:
        uint64_t v76 = "p->p_type->pt_switchable";
        goto LABEL_54;
    }
  }

  expert_log(*a1, 1uLL, (uint64_t)"%s property not imposable on chip: %s", v15, v16, v17, v18, v19, (uint64_t)v23);
  uint64_t v32 = a1[1];
  if (v32)
  {
    uint64_t v33 = *(void (**)(uint64_t *, uint64_t, uint64_t, void, void, uint64_t))(v32 + 48);
    if (v33) {
      v33(a1, constraint, 3LL, 0LL, 0LL, a1[2]);
    }
  }

  return 0LL;
}

void *img4_firmware_new(char *a1, __n128 *a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t expert = img4_runtime_get_expert(a1);
  __int128 v11 = (void *)_expert_alloc_type(expert, (uint64_t)&_image4_type_firmware);
  uint64_t v12 = v11;
  if (v11)
  {
    img4_firmware_init(v11, a1, a2, a3, a4, a5);
    v12[2] = &_image4_type_firmware;
  }

  return v12;
}

__n128 img4_firmware_init(void *a1, char *a2, __n128 *a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t expert = img4_runtime_get_expert(a2);
  int v19 = 0;
  uint64_t v18 = 0LL;
  uint64_t v17 = 0LL;
  memset(v16, 0, sizeof(v16));
  bzero(a1, 0x508uLL);
  *a1 = a6;
  a1[1] = a2;
  a1[2] = 0LL;
  a1[6] = 0LL;
  a1[78] = 0LL;
  img4_buff_steal(a1 + 153, a5);
  inited = buff_init_wrap(v16, *(void *)(a5 + 8), *(void *)(a5 + 16));
  fourcc_init((uint64_t)&v18, a4);
  a1[6] = payload_init((uint64_t)(a1 + 7), expert, (unsigned int *)&v18, &inited);
  unint64_t v13 = a3[1].n128_u64[0];
  __n128 result = *a3;
  *(__n128 *)(a1 + 3) = *a3;
  a1[5] = v13;
  return result;
}

void img4_firmware_init_from_buff( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 <= 0x507) {
    __panic_npx( "panic: object overflows buffer: object = firmware, length = %lu, required = %lu",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a2);
  }
}

void img4_firmware_init_sentinel(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = a3;
  a1[1] = a2;
  a1[2] = 0LL;
  a1[6] = 0LL;
  a1[78] = 0LL;
}

uint64_t img4_firmware_attach_manifest(uint64_t a1, uint64_t a2)
{
  uint64_t expert = img4_runtime_get_expert(*(char **)(a1 + 8));
  if (!expert) {
    uint64_t expert = generic_expert_specialist();
  }
  uint64_t v8 = 0LL;
  memset(v7, 0, sizeof(v7));
  img4_buff_steal((_OWORD *)(a1 + 1256), a2);
  inited = buff_init_wrap(v7, *(void *)(a2 + 8), *(void *)(a2 + 16));
  uint64_t result = manifest_init(a1 + 632, expert, &inited);
  *(void *)(a1 + 624) = result;
  return result;
}

uint64_t img4_firmware_select_chip(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  uint64_t expert = img4_runtime_get_expert(*(char **)(a1 + 8));
  if (!expert) {
    uint64_t expert = generic_expert_specialist();
  }
  uint64_t v54 = 0LL;
  memset(v53, 0, sizeof(v53));
  if ((*(_BYTE *)a1 & 4) == 0)
  {
    uint64_t v14 = "cannot select chip with first-stage boots";
LABEL_5:
    uint64_t v15 = expert;
    unint64_t v16 = 0LL;
LABEL_14:
    expert_log(v15, v16, (uint64_t)v14, v8, v9, v10, v11, v12, v49);
    return 0LL;
  }

  uint64_t v17 = *(void *)(a1 + 624);
  if (!v17)
  {
    uint64_t v20 = *(void *)(a1 + 48);
    if (!v20)
    {
      uint64_t v14 = "no manifest with which to select chip";
      goto LABEL_5;
    }

    unint64_t v18 = v20 + 88;
    if (*(_WORD *)(v20 + 88))
    {
      int v19 = (uint64_t *)(v20 + 48);
      goto LABEL_12;
    }

uint64_t _img4_firmware_select_chip_callback()
{
  return 0LL;
}

uint64_t img4_firmware_execute(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 624);
  uint64_t v18 = 0LL;
  memset(v17, 0, sizeof(v17));
  uint64_t result = img4_firmware_evaluate(a1, (uint64_t)a2, a3);
  uint64_t v8 = result;
  uint64_t v9 = 0LL;
  if (!(_DWORD)result)
  {
    if (*(_WORD *)(v5 + 88))
    {
      if (v5 >= v5 + 568)
      {
        __break(0x5519u);
        return result;
      }

      uint64_t v9 = img4_image_init(v17, v5, v6, *(void *)a1);
    }

    else
    {
      uint64_t v9 = 0LL;
    }
  }

  uint64_t result = (*(uint64_t (**)(uint64_t, void *, uint64_t, void))(a1 + 32))(a1, v9, v8, *(void *)(a1 + 40));
  if (a2[2] == 3LL && (void *)a2[14] == a2 + 33)
  {
    uint64_t result = a2[90];
    if (result)
    {
      int v19 = a2;
      uint64_t result = _expert_dealloc_type(result, (uint64_t)&_image4_type_custom_chip, (uint64_t *)&v19);
    }
  }

  return result;
}

uint64_t img4_firmware_evaluate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v29[14] = *MEMORY[0x1895F89C0];
  uint64_t expert = img4_runtime_get_expert(*(char **)(a1 + 8));
  if (!expert) {
    uint64_t expert = generic_expert_specialist();
  }
  uint64_t v28 = 0LL;
  v29[0] = a1;
  memset(v26, 0, 32);
  v26[2] = xmmword_18A3B3210;
  uint64_t v27 = 0LL;
  v29[1] = a2;
  memset(&v29[2], 0, 88);
  v29[13] = 0xAAAAAAAAFFFFFFFFLL;
  if (!expert) {
    __panic_npx("panic: failed to resolve expert for runtime", v6, v7, v8, v9, v10, v11, v12, v25);
  }
  if (!*(void *)(a1 + 48) || (*(_BYTE *)a1 & 2) != 0 || (uint64_t v14 = payload_parse_relax(), !(_DWORD)v14))
  {
    uint64_t v15 = *(uint64_t **)(a1 + 624);
    if (v15)
    {
      uint64_t inited = 0LL;
    }

    else
    {
      uint64_t v17 = *(void *)(a1 + 48);
      if (!*(_WORD *)(v17 + 88)) {
        __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v25);
      }
      uint64_t inited = manifest_init_borrow(a1 + 632, expert, (void *)(v17 + 48));
      uint64_t v28 = inited;
      uint64_t v15 = (uint64_t *)inited;
    }

    manifest_set_callbacks((uint64_t)v15, (uint64_t)v29, (uint64_t)v26);
    if (a3)
    {
      digest_init_from_img4_nonce((uint64_t)&v29[3], a3, v18, v19, v20, v21, v22, v23);
      void v29[2] = &v29[3];
    }

    if (manifest_parse((uint64_t)v15))
    {
      uint64_t v14 = 79LL;
      if (!inited) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }

    uint64_t v14 = manifest_impose(v15, a2, *(void *)(a1 + 48), 0LL);
    if (inited) {
LABEL_15:
    }
      manifest_destroy(&v28, v6, v7, v8, v9, v10, v11, v12);
  }

void _img4_firmware_prepare(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  unint64_t v5 = *(uint64_t **)a3;
  uint64_t expert = img4_runtime_get_expert(*(char **)(*(void *)a3 + 8LL));
  if (!expert) {
    uint64_t expert = generic_expert_specialist();
  }
  uint64_t v12 = *(void **)(a3 + 8);
  uint64_t v13 = *v5;
  if ((*v5 & 4) != 0)
  {
    if (v5 < v5 + 161)
    {
      uint64_t v20 = (char *)v5[1];
      uint64_t v21 = img4_runtime_get_expert(v20);
      if (!v21) {
        uint64_t v21 = generic_expert_specialist();
      }
      LOBYTE(v66[0]) = 0;
      if (img4_runtime_check_custom_BOOL((uint64_t)v20))
      {
        expert_log(v21, 2uLL, (uint64_t)"querying custom runtime for mix-n-match policy", v22, v23, v24, v25, v26, v63);
        uint64_t identifier_BOOL = img4_runtime_get_identifier_BOOL((uint64_t)v20);
        if ((_DWORD)identifier_BOOL)
        {
          expert_log( v21,  0LL,  (uint64_t)"failed to query mix-n-match identifier: %d",  v28,  v29,  v30,  v31,  v32,  identifier_BOOL);
        }

        else
        {
          expert_log(v21, 2uLL, (uint64_t)"preparing mix-n-match policy: 0x%x", v28, v29, v30, v31, v32, LOBYTE(v66[0]));
          odometer_prepare_mixn_match(a2, v66[0]);
        }
      }

      else
      {
        expert_log( v21,  2uLL,  (uint64_t)"stock runtime; not querying for mix-n-match policy",
          v22,
          v23,
          v24,
          v25,
          v26,
          v63);
      }

      uint64_t v33 = (char *)v5[1];
      uint64_t v34 = img4_runtime_get_expert(v33);
      if (!v34) {
        uint64_t v34 = generic_expert_specialist();
      }
      memset(v69, 0, sizeof(v69));
      memset(v68, 0, sizeof(v68));
      char v67 = 0;
      memset(v66, 0, sizeof(v66));
      if (img4_runtime_check_custom_digest((uint64_t)v33))
      {
        expert_log(v34, 2uLL, (uint64_t)"querying custom runtime for boot manifest hash", v35, v36, v37, v38, v39, v64);
        uint64_t identifier_digest = img4_runtime_get_identifier_digest((uint64_t)v33);
        if ((_DWORD)identifier_digest)
        {
          expert_log( v34,  0LL,  (uint64_t)"failed to query manifest hash identifier: %d",  v42,  v43,  v44,  v45,  v46,  identifier_digest);
        }

        else
        {
          digest_init_from_img4_dgst((uint64_t)v68, (uint64_t)v69, v41, v42, v43, v44, v45, v46);
          digest_print_cstr((unint64_t)v68, (unint64_t)v66, v52, v53, v54, v55, v56, v57);
          expert_log( v34,  2uLL,  (uint64_t)"preparing custom boot manifest hash: %s",  v58,  v59,  v60,  v61,  v62,  (uint64_t)v66);
          odometer_prepare_notarized_manifest_hash(a2, (uint64_t)v68);
        }
      }

      else
      {
        expert_log( v34,  2uLL,  (uint64_t)"stock runtime; not querying for boot manifest hash",
          v35,
          v36,
          v37,
          v38,
          v39,
          v64);
      }

      expert_log( expert,  2uLL,  (uint64_t)"forcing sideload anti-replay policy due to subsequent stage firmware evaluation",  v47,  v48,  v49,  v50,  v51,  v65);
      odometer_prepare_sideload_mixn_match(a2);
      goto LABEL_30;
    }

    goto LABEL_36;
  }

  if (*(void *)(a3 + 16))
  {
    expert_log(expert, 2uLL, (uint64_t)"prepared custom nonce hash", v6, v7, v8, v9, v10, v63);
    odometer_prepare_nonce_hash(a2, *(void *)(a3 + 16));
    uint64_t v13 = *v5;
  }

  if ((v13 & 8) != 0)
  {
    expert_log(expert, 2uLL, (uint64_t)"forcing sideload anti-replay policy", v6, v7, v8, v9, v10, v63);
    odometer_prepare_sideload_mixn_match(a2);
  }

  if (v12[3] != 1LL || v12[2] != 1LL) {
    goto LABEL_30;
  }
  if (v12 >= v12 + 33)
  {
LABEL_36:
    __break(0x5519u);
    return;
  }

  uint64_t name = chip_get_name((uint64_t)v12);
  expert_log( expert,  1uLL,  (uint64_t)"%s: simulating chip boot for reduced-security virtual chip policy",  v15,  v16,  v17,  v18,  v19,  name);
  odometer_prepare_mixn_match(a2, 1);
LABEL_30:
  if (!v5[6] && (*(_BYTE *)v5 & 0x20) == 0)
  {
    expert_log(expert, 2uLL, (uint64_t)"manifest-only evaluation; permitting replay", v6, v7, v8, v9, v10, v63);
    odometer_prepare_mixn_match(a2, 1);
  }

  if (!v12[25]) {
    odometer_prepare_mix_n_match_god_mode(a2);
  }
  *(_DWORD *)(a3 + 104) = 0;
}

uint64_t *img4_firmware_destroy(uint64_t *result)
{
  uint64_t v1 = (unint64_t *)*result;
  if (*result)
  {
    unint64_t v2 = result;
    uint64_t v3 = (char *)v1[1];
    uint64_t expert = img4_runtime_get_expert(v3);
    uint64_t v12 = v1 + 157;
    uint64_t v13 = v1 + 153;
    manifest_destroy(v1 + 78, v5, v6, v7, v8, v9, v10, v11);
    payload_destroy(v1 + 6);
    img4_buff_dealloc_internal((uint64_t)v3, &v13);
    img4_buff_dealloc_internal((uint64_t)v3, &v12);
    return (uint64_t *)_expert_dealloc_type(expert, v1[2], v2);
  }

  return result;
}

uint64_t _property_filter_all()
{
  return 0LL;
}

uint64_t _property_filter_constraint(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t _property_filter_anti_replay(uint64_t a1)
{
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t _property_filter_manifest(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 56)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

uint64_t _property_filter_object(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 56) == 1) {
    return 0LL;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t _property_filter_chip_instance(uint64_t a1)
{
  return *(uint64_t *)(a1 + 64) >> 63;
}

uint64_t _property_filter_expert(uint64_t a1)
{
  if (*(void *)(a1 + 16) == 33LL) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

char *property_iterator_next( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = (char **)(v8 + 1);
  if (v8 == 37) {
    return 0LL;
  }
  if (v8 < -1) {
LABEL_18:
  }
    __panic_npx("panic: iteration underflow: idx = 0x%lx, %ld", a2, a3, a4, a5, a6, a7, a8, (char)v9);
  if (*(void *)a1) {
    uint64_t v12 = *(uint64_t (**)())a1;
  }
  else {
    uint64_t v12 = _property_filter_all;
  }
  uint64_t v13 = v8;
  while (1)
  {
    uint64_t v9 = &__all[v13 + 1];
    if (v9 < __all)
    {
      __break(0x5519u);
      goto LABEL_18;
    }

    uint64_t v10 = __all[v8 + 1];
    ++v8;
    ++v13;
    if ((unint64_t)v8 >= 0x25)
    {
      uint64_t v14 = v8 + 1;
      goto LABEL_14;
    }
  }

  uint64_t v14 = v8 + 1;
  if (!v10) {
LABEL_14:
  }
    uint64_t v10 = 0LL;
  *(void *)(a1 + 8) = v10;
  *(void *)(a1 + 16) = v14;
  return v10;
}

uint64_t property_iterator_reset(uint64_t result)
{
  *(void *)(result + 8) = 0LL;
  *(void *)(result + 16) = -1LL;
  return result;
}

double Img4DecodeInitAsPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result = Img4DecodeInit(a1, a2, a3);
  if (v7 == 2) {
    return Img4DecodeInitPayload(a1, a2, a3);
  }
  return result;
}

void Img4DecodeInitAsManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (v6 == 2) {
    Img4DecodeInitManifest(a1, a2, a3);
  }
}

uint64_t Img4DecodeGetQueryForContainer( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >= 6) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"pc");
  }
  return qword_18A3B3710[a1];
}

uint64_t Img4DecodeContainerExists(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(a2, a3);
}

uint64_t Img4DecodeQueryPropertyBool(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(a1 + 16))(a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a2, v7, a4);
}

uint64_t Img4DecodeQueryPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(a1 + 16))(a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, v7, a4);
}

uint64_t Img4DecodeQueryPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(a1 + 16))(a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40))(a2, v9, a4, a5);
}

uint64_t Img4DecodeIterateObjectItems( unint64_t *a1, unsigned int *a2, uint64_t (**a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  __dst[57] = *MEMORY[0x1895F89C0];
  v21[0] = 0LL;
  v21[1] = 0LL;
  uint64_t v19 = 0LL;
  v20[0] = 0LL;
  v20[1] = 0LL;
  uint64_t result = (uint64_t)DERDecodeSeqContentInit(a1 + 5, v21);
  if (!(_DWORD)result)
  {
    for (LODWORD(result) = DERDecodeSeqNext(v21, (unint64_t *)&v19);
          !(_DWORD)result;
          LODWORD(result) = DERDecodeSeqNext(v21, (unint64_t *)&v19))
    {
      unsigned int v9 = v19;
      memset(v18, 0, sizeof(v18));
      uint64_t v10 = memcpy(__dst, a1, 0x1C8uLL);
      memset(v17, 170, 5);
      uint64_t v11 = log_expert(v10);
      if (v9 == 1296125520)
      {
        strcpy((char *)v17, "MANP");
        expert_log(v11, 2uLL, (uint64_t)"found %s; skipping", v12, v13, v14, v15, v16, (uint64_t)v17);
      }

      else
      {
        LOBYTE(v17[1]) = 0;
        v17[0] = bswap32(v9);
        expert_log(v11, 2uLL, (uint64_t)"found object: %s", v12, v13, v14, v15, v16, (uint64_t)v17);
        uint64_t result = DERImg4DecodePropertyWithItem((uint64_t)v20, v19, 0x2000000000000011uLL, (unint64_t)v18);
        if ((_DWORD)result) {
          return result;
        }
        *a2 = v9;
        *(_OWORD *)&__dst[9] = *(_OWORD *)((char *)&v18[1] + 8);
        uint64_t result = Img4DecodeEvaluateObjectProperties((uint64_t)__dst, *a3, a4);
        if ((_DWORD)result) {
          return result;
        }
        *a2 = 0;
      }
    }

    if ((_DWORD)result == 1) {
      return 0LL;
    }
    else {
      return result;
    }
  }

  return result;
}

void Img4DecodeCheckAuthority(uint64_t a1, __int128 *a2)
{
  __int128 v7 = xmmword_18A3B36F8;
  uint64_t v8 = 0LL;
  __int128 v2 = *a2;
  uint64_t v3 = *((void *)a2 + 2);
  uint64_t v4 = _CheckAuthorityEvalCertProperties;
  __int128 v5 = a2[2];
  uint64_t v6 = *((void *)a2 + 6);
  Img4DecodePerformManifestTrustEvaluationWithCallbacks(a1, (uint64_t)&v7, (uint64_t)&v2, 0LL);
}

uint64_t _CheckAuthorityManifestPropertyCallback()
{
  return 0LL;
}

uint64_t _CheckAuthorityEvalCertProperties()
{
  return 0LL;
}

unint64_t DERImg4DecodePrintProperty( unint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v13 = 0;
  unint64_t v12 = 0LL;
  uint64_t v9 = *(void *)(result + 40);
  if (v9 <= 0)
  {
    if (v9 != 0xA000000000000000LL)
    {
      if (v9 != 0xA000000000000001LL) {
        return result;
      }
      uint64_t v10 = "MUST NOT EXIST";
      goto LABEL_16;
    }

    strcpy((char *)a2, "MUST EXIST");
  }

  else
  {
    switch(v9)
    {
      case 4LL:
        if (*(void *)(result + 32) >= 0x40uLL) {
          unint64_t v11 = 64LL;
        }
        else {
          unint64_t v11 = *(void *)(result + 32);
        }
        return sprintdgst_npx(a2, *(unsigned __int8 **)(result + 24), v11, a4, a5, a6, a7, a8);
      case 2LL:
        uint64_t result = DERParseInteger64((char **)(result + 24), &v12);
        if ((_DWORD)result)
        {
LABEL_15:
          uint64_t v10 = "decode failure";
LABEL_16:
          *(void *)a2 = *(void *)v10;
          *(void *)(a2 + 7) = *(void *)(v10 + 7);
          return result;
        }

        return snprintf((char *)a2, 0x81uLL, "0x%llx");
      case 1LL:
        uint64_t result = DERParseBoolean((unsigned __int8 **)(result + 24), &v13);
        if (!(_DWORD)result) {
          return snprintf((char *)a2, 0x81uLL, "%s");
        }
        goto LABEL_15;
      default:
        return result;
    }
  }

  return result;
}

uint64_t CTImg4GetDigestType( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 8);
  return 16LL;
}

uint64_t (**CTImg4GetDecodeImplementation(const DERItem *a1))()
{
  if (a1 == &oidSha1Rsa) {
    return _ctImg4RsaSha1Impl;
  }
  if (a1 == &oidSha224Rsa) {
    return 0LL;
  }
  if (a1 == &oidSha256Rsa) {
    return _ctImg4RsaSha256Impl;
  }
  if (a1 == &oidSha384Rsa) {
    return _ctImg4RsaSha384Impl;
  }
  uint64_t v1 = _ctImg4EcdsaSha1Impl;
  __int128 v2 = _ctImg4EcdsaSha256Impl;
  uint64_t v3 = _ctImg4EcdsaSha384Impl;
  if (a1 == &oidSha512Ecdsa) {
    uint64_t v4 = _ctImg4EcdsaSha512Impl;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a1 != &oidSha384Ecdsa) {
    uint64_t v3 = v4;
  }
  if (a1 != &oidSha256Ecdsa) {
    __int128 v2 = v3;
  }
  if (a1 == &oidSha224Ecdsa) {
    __int128 v5 = 0LL;
  }
  else {
    __int128 v5 = v2;
  }
  if (a1 != &oidSha1Ecdsa) {
    uint64_t v1 = v5;
  }
  if (a1 == &oidSha512Rsa) {
    return _ctImg4RsaSha512Impl;
  }
  else {
    return v1;
  }
}

unint64_t _Img4DecodePayloadPropertiesGetTag(uint64_t a1)
{
  return a1 | 0xE000000000000000LL;
}

uint64_t _chip_decode_select_static( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!result) {
    __panic_npx( "panic: illegal chip definition: no static decode implementation: %s",  v9,  v10,  v11,  v12,  v13,  v14,  v15,  *(void *)(a1 + 8));
  }
  return result;
}

uint64_t chip_get_name(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t _chip_decode_select_trust_store( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  unint64_t v63 = 0LL;
  uint64_t v64 = 0LL;
  unint64_t v59 = 0LL;
  uint64_t v60 = 0LL;
  unint64_t v61 = 0LL;
  char v66 = 0;
  memset(v65, 0, sizeof(v65));
  expert_log(a2, 2uLL, (uint64_t)"%s: decode selection: trust store [0x%llx]", a4, a5, a6, a7, a8, *(void *)(a1 + 8));
  if (*(void *)(a1 + 32)) {
    __panic_npx( "panic: illegal chip definition: trust store cannot override static decode implementation: %s",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  *(void *)(a1 + 8));
  }
  if (expert_query_trust_store(a2, *(void *)(a1 + 56), a1, (uint64_t)&v63, (uint64_t)&v64))
  {
    expert_log(a2, 0LL, (uint64_t)"%s: failed to query anchor: 0x%llx: %d", v18, v19, v20, v21, v22, *(void *)(a1 + 8));
  }

  else
  {
    uint64_t result = (*(uint64_t (**)(void))(a1 + 48))();
    unint64_t v30 = *(void *)(result + 24);
    uint64_t v29 = *(unsigned __int8 **)(result + 32);
    if (v29 > &v29[v30])
    {
      __break(0x5519u);
      return result;
    }

    v62[0] = *(void *)(result + 32);
    v62[1] = v30;
    sprintdgst_npx((unint64_t)v65, v29, v30, v24, v25, v26, v27, v28);
    expert_log( a2,  1uLL,  (uint64_t)"%s: retrieved pinned root from trust store: type = 0x%llx, length = %lu, oid = %s, oid length = %lu",  v31,  v32,  v33,  v34,  v35,  *(void *)(a1 + 8));
    if (DERDecodeItem((uint64_t)v62, &v59))
    {
      expert_log(a2, 0LL, (uint64_t)"%s: DERDecodeItem: %d", v36, v37, v38, v39, v40, *(void *)(a1 + 8));
    }

    else
    {
      sprintdgst_npx((unint64_t)v65, v60, v61, v36, v37, v38, v39, v40);
      expert_log( a2,  1uLL,  (uint64_t)"%s: finding digest algorithm for oid: %s",  v41,  v42,  v43,  v44,  v45,  *(void *)(a1 + 8));
      int DigestType = CTImg4GetDigestType((uint64_t)&v60, v46, v47, v48, v49, v50, v51, v52);
      expert_log(a2, 0LL, (uint64_t)"%s: failed to parse root: %d", v54, v55, v56, v57, v58, *(void *)(a1 + 8));
    }
  }

  return 0LL;
}

uint64_t chip_dump(uint64_t a1, mach_header_64 *mhp, unint64_t a3)
{
  uint64_t size = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = getsectdatafromheader_64(mhp, "__DATA_CONST", "__image4_chp", &size);
  uint64_t v7 = (uint64_t)&v6[_dyld_get_image_slide()];
  uint64_t size = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = getsectdatafromheader_64(mhp, "__DATA_CONST", "__image4_chp", &size);
  uint64_t result = _dyld_get_image_slide();
  if (v7 < (unint64_t)&v8[result + size])
  {
    do
    {
      v7 += 8LL;
      expert_log(a1, a3, (uint64_t)"%6s  %-36s : %s", v10, v11, v12, v13, v14, (uint64_t)&unk_1894F071F);
      uint64_t size = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v15 = getsectdatafromheader_64(mhp, "__DATA_CONST", "__image4_chp", &size);
      uint64_t result = _dyld_get_image_slide();
    }

    while (v7 < (unint64_t)&v15[result + size]);
  }

  return result;
}

unint64_t chip_get_property_expert(uint64_t a1, void *a2)
{
  uint64_t v4 = chip_expert(a1);
  unint64_t v5 = v4;
  if (!v4) {
    return v5;
  }
  unint64_t v6 = v4 + 288;
  unint64_t v7 = chip_expert_instance(a1);
  unint64_t v15 = *(void *)(a1 + 16);
  if (v15 - 2 >= 2 && v15 != 0)
  {
    if (v15 != 1) {
      goto LABEL_16;
    }
    if (!chip_instance_check(v7, a2, v9, v10, v11, v12, v13, v14))
    {
      unint64_t v6 = 0LL;
      unint64_t v5 = 0LL;
    }

    unint64_t v15 = *(void *)(a1 + 16);
  }

  if (v15 < a2[10]) {
    return 0LL;
  }
  if (v5 && v5 >= v6)
  {
    __break(0x5519u);
LABEL_16:
    __panic_npx("panic: unreachable case: %s = 0x%llx", v8, v9, v10, v11, v12, v13, v14, (char)"chp->chp_type");
  }

  return v5;
}

unint64_t chip_select_property_expert(uint64_t a1, void *a2, uint64_t a3)
{
  if (a1)
  {
    if (*(void *)(a1 + 256)) {
      unint64_t v6 = *(char ***)(a1 + 256);
    }
    else {
      unint64_t v6 = &_property_DGST;
    }
    if (!property_equal((uint64_t)a2, (uint64_t)v6))
    {
      property_uint64_t expert = chip_get_property_expert(a1, a2);
      if (property_expert) {
        return property_expert;
      }
    }
  }

  return a3;
}

char **chip_get_digest(uint64_t a1)
{
  if (*(void *)(a1 + 256)) {
    return *(char ***)(a1 + 256);
  }
  else {
    return &_property_DGST;
  }
}

uint64_t chip_get_constraint(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3 == 33) {
    return a2;
  }
  unint64_t v4 = *(void *)(result + 64);
  if (!v4) {
    goto LABEL_17;
  }
  unint64_t v5 = (uint64_t *)(v4 + 8 * v3);
  uint64_t result = *v5;
  if (!*v5)
  {
LABEL_17:
    if (!a3) {
      return a2;
    }
    unint64_t v7 = (uint64_t *)(a3 + 8 * v3);
    if ((unint64_t)v7 >= a3 + 264 || (unint64_t)v7 < a3)
    {
LABEL_19:
      __break(0x5519u);
      return result;
    }

    uint64_t result = *v7;
    if (!*v7) {
      return a2;
    }
  }

  return result;
}

uint64_t chip_select_decode(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))();
}

uint64_t chip_check_entitlement(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0LL;
  uint64_t v4 = a1 + 120;
  while (1)
  {
    uint64_t v5 = *(void *)(v4 + v3);
    if (!v5) {
      return 0xFFFFFFFFLL;
    }
    if (property_equal(a2, v5)) {
      break;
    }
    v3 += 8LL;
    if (v3 == 40) {
      return 0xFFFFFFFFLL;
    }
  }

  return 0LL;
}

uint64_t chip_get_anti_replay(uint64_t a1)
{
  return *(void *)(a1 + 160);
}

uint64_t chip_get_pivot(uint64_t a1)
{
  return *(void *)(a1 + 192);
}

uint64_t chip_get_anti_replay_sideload(uint64_t a1)
{
  return *(void *)(a1 + 176);
}

uint64_t chip_get_mix_n_match(uint64_t a1)
{
  return *(void *)(a1 + 184);
}

uint64_t chip_get_notary(uint64_t a1)
{
  return *(void *)(a1 + 248);
}

uint64_t __handle_absence_0(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 0;
  return 0LL;
}

void _prepare_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v29[2] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(*(void *)a3 + 24LL);
  uint64_t v5 = *(void *)(v4 + 8);
  v29[0] = 0LL;
  v29[1] = 0LL;
  size_t v24 = 0LL;
  size_t __n = 0LL;
  memset(v28, 0, sizeof(v28));
  memset(v27, 0, sizeof(v27));
  memset(v26, 0, sizeof(v26));
  uint64_t boot_nonce = image4_environment_callout_query_boot_nonce(v4, (uint64_t)v29, (uint64_t)&__n);
  if (!(_DWORD)boot_nonce)
  {
    if (__n <= 0x10)
    {
      nonce_init(v28, v29, __n, v7, v8, v9, v10, v11);
      odometer_prepare_nonce(a2, v28, v18, v19, v20, v21, v22, v23);
      return;
    }

    goto LABEL_12;
  }

  if ((_DWORD)boot_nonce != 45)
  {
    expert_log(v5, 0LL, (uint64_t)"failed to get boot nonce from callback: %d", v7, v8, v9, v10, v11, boot_nonce);
    return;
  }

  uint64_t nonce_digest = image4_environment_callout_query_nonce_digest(v4, (uint64_t)v27, (uint64_t)&v24);
  if ((_DWORD)nonce_digest != 45)
  {
    if (!(_DWORD)nonce_digest)
    {
      if (v24 <= 0x40)
      {
        digest_init((uint64_t)v26, v27, v24, v13, v14, v15, v16, v17);
        odometer_prepare_nonce_hash(a2, (uint64_t)v26);
        return;
      }

uint64_t _get_constraint_mask_2()
{
  return 0LL;
}

uint64_t _extract_payload_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  int v7 = *(unsigned __int16 *)(a3 + 528);
  memset(&v12[3], 0, 32);
  if (v7) {
    unint64_t v8 = a3 + 528;
  }
  else {
    unint64_t v8 = 0LL;
  }
  memset(&v12[1], 0, 32);
  if (v7) {
    uint64_t v9 = a3 + 72;
  }
  else {
    uint64_t v9 = 0LL;
  }
  v12[0] = 0uLL;
  uint64_t v10 = manifest_measure(a3, a2, (uint64_t)v12);
  *a5 = *(void *)(*(uint64_t (**)(uint64_t))(a2 + 48))(v10);
  if (v9 + 456 > v8) {
    __break(0x5519u);
  }
  return v9 + 328;
}

void *_payload_img4_get_measured_bytes( void *result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*((_WORD *)result + 44)) {
    __panic_npx("panic: optional not set", (uint64_t)a2, a3, a4, a5, a6, a7, a8, vars0);
  }
  unint64_t v9 = result[6];
  uint64_t v8 = result[7];
  if (v9 <= v9 + v8) {
    return buff_init_wrap(a2, v9, v8);
  }
  __break(0x5519u);
  return result;
}

uint64_t payload_init(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t **a4)
{
  *(_WORD *)(a1 + 88) = 1;
  return a1;
}

double _payload_init(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  if (!a3) {
    a3 = generic_expert_specialist();
  }
  *(void *)a1 = a3;
  *(void *)(a1 + 8) = fourcc_copy(a1 + 16, a2);
  *(void *)(a1 + 32) = _payload_callbacks_bare;
  *(void *)(a1 + 40) = 0LL;
  double result = 0.0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  return result;
}

uint64_t payload_init_borrow(uint64_t a1, uint64_t a2, unsigned int *a3, void *a4)
{
  *(void *)(a1 + 96) = a4;
  *(_WORD *)(a1 + 88) = 1;
  return a1;
}

uint64_t payload_init_wrap(uint64_t a1, uint64_t a2, unsigned int *a3, void *a4)
{
  *(_WORD *)(a1 + 88) = 1;
  return a1;
}

uint64_t payload_init_empty(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  return a1;
}

uint64_t payload_set_callbacks(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 32) = a2;
  *(void *)(result + 40) = a3;
  return result;
}

uint64_t payload_parse(uint64_t *a1)
{
  int v23 = 0;
  unint64_t v9 = _payload_parse_internal((uint64_t)a1);
  if (!(_DWORD)v9)
  {
    unsigned int PayloadType = Img4DecodeGetPayloadType((uint64_t)(a1 + 14), &v23);
    if (!PayloadType)
    {
      uint64_t v22 = (_DWORD *)a1[1];
      if (*v22 == v23) {
        return 0LL;
      }
      expert_log( *a1,  0LL,  (uint64_t)"%s: unexpected payload type: actual = %s, expected = %s",  v11,  v12,  v13,  v14,  v15,  (uint64_t)(v22 + 1));
      return 79LL;
    }

    unint64_t v9 = posixdr(PayloadType);
    expert_log(*a1, 0LL, (uint64_t)"%s: Img4DecodeGetPayloadType: %d", v16, v17, v18, v19, v20, a1[1] + 4);
  }

  return v9;
}

unint64_t _payload_parse_internal(uint64_t a1)
{
  if (!*(_WORD *)(a1 + 88)) {
    return 0LL;
  }
  unint64_t result = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  if (result <= result + v3)
  {
    Img4DecodeInitAsPayload(result, v3, a1 + 112);
    if (v4)
    {
      uint64_t v5 = posixdr(v4);
      expert_log( *(void *)a1,  0LL,  (uint64_t)"%s: Img4DecodeInitAsPayload: %d",  v6,  v7,  v8,  v9,  v10,  *(void *)(a1 + 8) + 4LL);
      return v5;
    }

    *(void *)(a1 + 104) = a1 + 112;
    if (*(uint64_t (***)())(a1 + 32) == _payload_callbacks_bare)
    {
      uint64_t v5 = 0LL;
      *(void *)(a1 + 32) = _payload_callbacks_im4p;
      return v5;
    }

    return 0LL;
  }

  __break(0x5519u);
  return result;
}

uint64_t payload_measure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, void))(a1 + 32))(a1, a2, a3, *(void *)(a1 + 40));
}

uint64_t payload_get_decoded_bytes(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(a1 + 32) + 8LL))( a1,  a2,  *(void *)(a1 + 40));
}

void *payload_get_encoded_bytes(uint64_t a1, void *a2)
{
  return buff_init_wrap(a2, *(void *)(*(void *)(a1 + 104) + 8LL), *(void *)(*(void *)(a1 + 104) + 16LL));
}

unint64_t *payload_destroy(unint64_t *result)
{
  unint64_t v1 = *result;
  if (*result)
  {
    uint64_t v2 = result;
    uint64_t v3 = (void *)(v1 + 48);
    if (!*(_WORD *)(v1 + 88)) {
      uint64_t v3 = 0LL;
    }
    uint64_t v5 = v3;
    uint64_t v4 = *(void *)(v1 + 96);
    if (v4) {
      buff_return(v4, &v5);
    }
    unint64_t result = buff_destroy(&v5);
    *(_WORD *)(v1 + 88) = 0;
    if (v1 >= v1 + 568)
    {
      __break(0x5519u);
    }

    else
    {
      unint64_t result = (unint64_t *)(*(uint64_t (**)(unint64_t, void))(*(void *)(v1 + 32) + 16LL))( v1,  *(void *)(v1 + 40));
      *uint64_t v2 = 0LL;
    }
  }

  return result;
}

uint64_t _payload_im4p_measure(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  uint64_t v6 = *a1;
  uint64_t v46 = 0LL;
  memset(v47, 0, sizeof(v47));
  unint64_t alloc_preference = _type_get_alloc_preference((uint64_t)&_image4_type_decode_context);
  if (alloc_preference <= 1) {
    uint64_t v15 = 1LL;
  }
  else {
    uint64_t v15 = alloc_preference;
  }
  if (v15 == 1) {
    goto LABEL_8;
  }
  if (v15 != 2) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", v8, v9, v10, v11, v12, v13, v14, (char)"_t_preference");
  }
  uint64_t v16 = _expert_alloc_type(v6, (uint64_t)&_image4_type_decode_context);
  if (!v16)
  {
LABEL_8:
    uint64_t size = type_get_size((uint64_t)&_image4_type_decode_context);
    unint64_t v25 = MEMORY[0x1895F8858](size, v18, v19, v20, v21, v22, v23, v24);
    uint64_t v26 = (_OWORD *)((char *)&v45 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    if (v25 >= 0x31) {
      size_t v27 = v25 - 48;
    }
    else {
      size_t v27 = 0LL;
    }
    memset(v26 + 3, 170, v27);
    *uint64_t v26 = 0u;
    v26[1] = 0u;
    v26[2] = 0u;
  }

  else
  {
    uint64_t v46 = v16;
  }

  uint64_t v28 = chip_select_decode(a2);
  if (!v28) {
    __panic_npx( "panic: no decode implementation available for chip: %s",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  *(void *)(a2 + 8));
  }
  uint64_t v36 = v28;
  uint64_t v37 = *(size_t **)(v28 + 32);
  size_t v38 = *v37;
  if (*v37 > 0x40)
  {
    __break(0x5519u);
LABEL_18:
    __panic_npx("panic: Img4DecodeCopyPayloadDigest: %d", v29, v30, v36, v32, v33, v34, v35, v28);
  }

  LODWORD(v28) = Img4DecodeCopyPayloadDigest( a1[13],  v47,  *v37,  (uint64_t (**)(void, void, _OWORD *, size_t, void))v28);
  if ((_DWORD)v28) {
    goto LABEL_18;
  }
  _expert_dealloc_type(v6, (uint64_t)&_image4_type_decode_context, &v46);
  return digest_init(a3, v47, v38, v39, v40, v41, v42, v43);
}

void *_payload_bare_measure( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a1 + 88)) {
    __panic_npx("panic: optional not set", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v17);
  }
  uint64_t v10 = (void *)(*(uint64_t (**)(void))(a2 + 48))();
  return digest_init_measure(a3, v10, a1 + 48, v11, v12, v13, v14, v15);
}

void *_payload_bare_get_measured_bytes( void *result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*((_WORD *)result + 44)) {
    __panic_npx("panic: optional not set", (uint64_t)a2, a3, a4, a5, a6, a7, a8, vars0);
  }
  unint64_t v9 = result[6];
  uint64_t v8 = result[7];
  if (v9 <= v9 + v8) {
    return buff_init_wrap(a2, v9, v8);
  }
  __break(0x5519u);
  return result;
}

void *_payload_im4p_get_measured_bytes(uint64_t a1, void *a2)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int Payload = Img4DecodeGetPayload(*(void *)(a1 + 104), (uint64_t)&v12);
  if (Payload) {
    __panic_npx("panic: Img4DecodeGetPayload: %d", v4, v5, v6, v7, v8, v9, v10, Payload);
  }
  return buff_init_wrap(a2, v12, v13);
}

uint64_t darwin_uuid_parse(_BYTE *a1, unsigned __int8 *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (!*a1) {
    return 2LL;
  }
  *(void *)&v6[13] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v5 = v3;
  *(_OWORD *)uint64_t v6 = v3;
  __strlcpy_chk();
  else {
    return 0LL;
  }
}

uint64_t image4_auditor_post( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v11 = 0LL;
  memset(v10, 0, sizeof(v10));
  image4_audit_event_init((uint64_t *)v10, a2, a3, a4, a5, a6, a7, a8);
  return (*(uint64_t (**)(uint64_t, _OWORD *, void))(*(void *)(a1 + 80) + 8LL))( a1,  v10,  *(void *)(a1 + 88));
}

uint64_t *image4_audit_event_init( uint64_t *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a1 = a2;
  unsigned int v8 = *(_DWORD *)(a2 + 56);
  if (v8 >= 4) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"p->p_container");
  }
  a1[34] = qword_1894E7438[v8];
  if (a3 >= 4) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"mfr");
  }
  a1[33] = a3;
  if (a4)
  {
    a1[1] = image4_audit_value_init((uint64_t)(a1 + 2), a2, a4, a4, a5, a6, a7, a8);
    a1[17] = image4_audit_value_init((uint64_t)(a1 + 18), a2, a5, v12, v13, v14, v15, v16);
  }

  return a1;
}

uint64_t image4_auditor_interpose_decode(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 16) = _AuditorComputeDigest;
  *(void *)(a1 + 24) = _AuditorVerifyChain;
  uint64_t result = a1 + 16;
  *(void *)(result + 16) = _AuditorVerifySignature;
  *(void *)(result + 24) = _AuditorEvaluateCertificateProperties;
  *(_OWORD *)(result + 32) = v3;
  *(void *)(result - 8) = result;
  *(void *)(result + 48) = v2;
  *(void *)(result + 56) = a2;
  return result;
}

uint64_t _AuditorComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = __current();
  uint64_t result = (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 72))(a1, a2, a3, a4, a5);
  if ((_DWORD)result) {
    __panic_npx("panic: digest computation failed: %d", v12, v13, v14, v15, v16, v17, v18, result);
  }
  return result;
}

uint64_t _AuditorVerifyChain( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = __current();
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 + 72) + 8LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8);
  uint64_t v23 = v17;
  if ((_DWORD)v17) {
    _auerr(v16, v17, "certificate chain verification failed: %d", v18, v19, v20, v21, v22, v17);
  }
  return v23;
}

uint64_t _AuditorVerifySignature( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = __current();
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 + 72) + 16LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8);
  uint64_t v23 = v17;
  if ((_DWORD)v17) {
    _auerr(v16, v17, "signature verification failed: %d", v18, v19, v20, v21, v22, v17);
  }
  return v23;
}

uint64_t _AuditorEvaluateCertificateProperties(void *a1)
{
  uint64_t v2 = __current();
  uint64_t v8 = v2;
  v87[0] = 0LL;
  v87[1] = 0LL;
  v85[1] = 0LL;
  uint64_t v86 = 0LL;
  uint64_t v84 = 0LL;
  v85[0] = 0LL;
  if (!a1[40])
  {
    _auerr(v2, 0LL, "certificate properties invalid length: actual = %lu, expected > 0", v3, v4, v5, v6, v7, 0);
    return 3LL;
  }

  uint64_t v9 = DERDecodeSeqInit((uint64_t)(a1 + 39), &v86, v87);
  if ((_DWORD)v9)
  {
    uint64_t v15 = v9;
    _auerr(v8, v9, "DERDecodeSeqInit: %d", v10, v11, v12, v13, v14, v9);
    return v15;
  }

  if (v86 != 0x2000000000000011LL)
  {
    _auerr(v8, 0LL, "bad certificate tag: actual = 0x%llx, expected = 0x%llx", v10, v11, v12, v13, v14, v86);
    return 2LL;
  }

  uint64_t v16 = v85;
LABEL_7:
  while (2)
  {
    int v17 = DERDecodeSeqNext(v87, (unint64_t *)&v84);
    if (v17)
    {
      if (v17 != 1) {
        __panic_npx("panic: exited enforcement loop with bogus value: dr = %d", v18, v19, v20, v21, v22, v23, v24, v17);
      }
      return 0LL;
    }

    int v83 = 0;
    uint64_t v82 = 0LL;
    *(_OWORD *)uint64_t v81 = 0uLL;
    uint64_t v78 = 0LL;
    uint64_t v79 = 0LL;
    size_t v80 = 0LL;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v75 = 0u;
    v74[0] = 0LL;
    v74[1] = 0LL;
    __int128 v73 = 0u;
    memset(v72, 0, sizeof(v72));
    __int128 __s2 = 0uLL;
    fourcc_init((uint64_t)&v82, v84);
    uint64_t v30 = a1 + 7;
    switch(v84)
    {
      case 0xE00000004D414E50LL:
        goto LABEL_12;
      case 0xE00000004F424A50LL:
        uint64_t v30 = a1 + 9;
        if (!a1[9])
        {
          uint64_t v30 = a1 + 9;
          if (!a1[10]) {
            continue;
          }
        }

uint64_t image4_audit_value_init( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)uint64_t result = a2;
  __int128 v8 = *(_OWORD *)a3;
  __int128 v9 = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(result + 32) = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(result + 48) = v9;
  *(_OWORD *)(result + 16) = v8;
  __int128 v10 = *(_OWORD *)(a3 + 48);
  __int128 v11 = *(_OWORD *)(a3 + 64);
  __int128 v12 = *(_OWORD *)(a3 + 80);
  *(void *)(result + 112) = *(void *)(a3 + 96);
  *(_OWORD *)(result + 80) = v11;
  *(_OWORD *)(result + 96) = v12;
  *(_OWORD *)(result + 64) = v10;
  unint64_t v13 = **(void **)(a2 + 40);
  if (v13 >= 5) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"p->p_type->pt_switchable");
  }
  *(void *)(result + 8) = qword_1894E7458[v13];
  return result;
}

uint64_t image4_auditor_new(uint64_t (**a1)(void), uint64_t a2)
{
  uint64_t v4 = generic_expert_specialist();
  uint64_t result = _expert_alloc_type(v4, (uint64_t)&_image4_type_auditor);
  if (result)
  {
    *(void *)(result + 80) = a1;
    *(void *)(result + 88) = a2;
    __current = *a1;
  }

  return result;
}

uint64_t *image4_auditor_destroy( uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*result)
  {
    uint64_t v8 = *(void *)*result;
    if (!*(_WORD *)(v8 + 744)) {
      __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, vars0);
    }
    return (uint64_t *)_expert_dealloc_type(*(void *)(v8 + 152), (uint64_t)&_image4_type_auditor, result);
  }

  return result;
}

uint64_t image4_audit_event_get_section(uint64_t a1)
{
  return *(void *)(a1 + 272);
}

uint64_t image4_audit_event_get_result(uint64_t a1)
{
  return *(void *)(a1 + 264);
}

uint64_t image4_audit_event_get_imposed_value(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t image4_audit_event_get_constrained_value(uint64_t a1)
{
  return *(void *)(a1 + 136);
}

uint64_t image4_audit_value_get_type(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

char *image4_audit_value_print( uint64_t *a1, char *__str, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return property_print_value(*a1, (unint64_t)(a1 + 2), __str, a4, a5, a6, a7, a8);
}

uint64_t _auerr( uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  *(_OWORD *)__int128 __str = 0u;
  __int128 v13 = 0u;
  vsnprintf(__str, 0x100uLL, a3, &a9);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(a1 + 80) + 16LL))(a1, __str, a2);
}

uint64_t aupost( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  v37[0] = xmmword_1894E73D0;
  memset(&v37[1], 170, 88);
  v36[0] = xmmword_1894E73D0;
  memset(&v36[1], 170, 88);
  int v35 = 0;
  uint64_t v13 = *(void *)(a4 + 40);
  if (v13 <= 0)
  {
    if (v13 == 0xA000000000000000LL)
    {
      __int128 v14 = &_property_constraint_ex;
    }

    else
    {
      if (v13 != 0xA000000000000001LL) {
        goto LABEL_20;
      }
      __int128 v14 = &_property_constraint_nx;
    }

LABEL_14:
    __int128 v15 = (uint64_t *)&_property_type_BOOL;
    goto LABEL_15;
  }

  if (v13 == 1)
  {
    __int128 v14 = &_property_constraint_eq;
    goto LABEL_14;
  }

  if (v13 != 2)
  {
    if (v13 == 4)
    {
      __int128 v14 = &_property_constraint_eq;
      __int128 v15 = &_property_type_digest;
LABEL_15:
      uint64_t v23 = a2 + 4;
      uint64_t v24 = 0LL;
      uint64_t v18 = *(void *)a2;
      uint64_t v25 = 33LL;
      uint64_t v26 = v18;
      int v27 = *(_DWORD *)(a2 + 8);
      goto LABEL_16;
    }

  __break(0x5519u);
  return result;
}

  uint64_t v18 = v64;
  uint64_t v17 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  __int128 v19 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 136) = v64;
  *(void *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19)) {
    goto LABEL_187;
  }
  __int128 v20 = v18 + v19;
  if (v18 > v20 || v20 > v17) {
    goto LABEL_186;
  }
  int v64 = v20;
  __int128 v22 = v64;
  unint64_t v21 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  uint64_t v23 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 120) = v64;
  *(void *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23)) {
    goto LABEL_187;
  }
  uint64_t v24 = v22 + v23;
  if (v22 > v24 || v24 > v21) {
    goto LABEL_186;
  }
  int v64 = v24;
  uint64_t v26 = v64;
  uint64_t v25 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  int v27 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 72) = v64;
  *(void *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27)) {
    goto LABEL_187;
  }
  uint64_t v28 = v26 + v27;
  if (v26 > v28 || v28 > v25) {
    goto LABEL_186;
  }
  int v64 = v28;
  uint64_t v29 = v64;
  int v30 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  __int128 v31 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 104) = v64;
  *(void *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31)) {
    goto LABEL_187;
  }
  uint64_t v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30) {
    goto LABEL_186;
  }
  int v64 = v29 + v31;
  uint64_t result = ccder_blob_decode_tl();
  if (!(_DWORD)result) {
    return 720922LL;
  }
  uint64_t v33 = v64;
  uint64_t v34 = v68;
  int v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32) {
      goto LABEL_186;
    }
    *(void *)(a1 + 88) = v32;
    *(void *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34)) {
      goto LABEL_187;
    }
    uint64_t v36 = v33 + v34;
    if (v33 > v36 || v36 > v65) {
      goto LABEL_186;
    }
    uint64_t v63 = v65;
    int v64 = v36;
    uint64_t v62 = v36;
    if ((ccder_blob_decode_tl() & 1) != 0) {
      return 720923LL;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    uint64_t v62 = v64;
    uint64_t v63 = v65;
    if ((ccder_blob_decode_tl() & 1) != 0) {
      return 720924LL;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    uint64_t v62 = v64;
    uint64_t v63 = v65;
    if (ccder_blob_decode_tl())
    {
      uint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68)) {
        goto LABEL_187;
      }
      if (v62 > v62 + v68 || v62 + v68 > v63) {
        goto LABEL_186;
      }
      uint64_t v60 = v62;
      uint64_t v61 = v62 + v68;
      uint64_t v37 = v60;
      if (__CFADD__(v60, v68)) {
LABEL_187:
      }
        __break(0x5513u);
      __int128 v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61) {
        goto LABEL_186;
      }
      uint64_t v61 = v60 + v68;
      *(_BYTE *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3) {
        __int128 v39 = a4 == 0;
      }
      else {
        __int128 v39 = 1;
      }
      __int128 v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        __int128 v53 = 0;
        __int128 v41 = 0;
        do
        {
          int v58 = 0xAAAAAAAAAAAAAAAALL;
          uint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
          uint64_t v57 = 0;
          uint64_t v56 = 0LL;
          if ((ccder_blob_decode_tl() & 1) == 0) {
            return 720926LL;
          }
          __int128 v54 = 0xAAAAAAAAAAAAAAAALL;
          uint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          if (v60 > v60 + v56 || v60 + v56 > v61) {
            goto LABEL_186;
          }
          __int128 v54 = v60;
          uint64_t v55 = v60 + v56;
          if (v55 < v54 || v68 > v55 - v54) {
            goto LABEL_186;
          }
          int v58 = v54;
          uint64_t v59 = v68;
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v55 != v54 + v68) {
            return 720929LL;
          }
          if (v40 && !compare_octet_string_raw((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54) {
              goto LABEL_186;
            }
            __int128 v43 = v68;
            if (v68 > v55 - v54) {
              goto LABEL_186;
            }
            *(void *)(a1 + 248) = v54;
            *(void *)(a1 + 256) = v43;
          }

          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 15)
            {
              int v16 = 720930LL;
              if ((v41 & 1) != 0 || (X509ExtensionParseKeyUsage() & 1) == 0) {
                return v16;
              }
              v41 |= 1u;
              goto LABEL_155;
            }

            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 19)
            {
              int v16 = 720931LL;
              if ((v41 & 2) != 0
                || (X509ExtensionParseBasicConstraints(&v54, (void *)(a1 + 200), (_BYTE *)(a1 + 265)) & 1) == 0)
              {
                return v16;
              }

              v41 |= 2u;
              goto LABEL_155;
            }

            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 35)
            {
              int v16 = 720932LL;
              if ((v41 & 4) != 0
                || (X509ExtensionParseAuthorityKeyIdentifier(&v54, (unint64_t *)(a1 + 168), (void *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }

              v41 |= 4u;
              goto LABEL_155;
            }

            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 14)
            {
              int v16 = 720933LL;
              if ((v41 & 8) != 0
                || (X509ExtensionParseSubjectKeyIdentifier(&v54, (unint64_t *)(a1 + 184), (void *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }

              v41 |= 8u;
              goto LABEL_155;
            }

            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 37)
            {
              int v16 = 720934LL;
              if ((v41 & 0x10) != 0
                || (X509ExtensionParseExtendedKeyUsage(&v54, (unint64_t *)(a1 + 208), (void *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }

              v41 |= 0x10u;
              goto LABEL_155;
            }

            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 17)
            {
              int v16 = 720935LL;
              if ((v41 & 0x20) != 0
                || (X509ExtensionParseSubjectAltName(&v54, (unint64_t *)(a1 + 224), (void *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }

              v41 |= 0x20u;
              goto LABEL_155;
            }
          }

          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            int v16 = 720936LL;
            uint64_t result = X509ExtensionParseAppleExtension( (uint64_t)&v54,  v58,  v59,  (uint64_t *)(a1 + 240),  (unint64_t *)(a1 + 248),  v40);
            if (!(_DWORD)result) {
              return v16;
            }
            if (v53 == 0xFF) {
              goto LABEL_189;
            }
            ++v53;
            goto LABEL_155;
          }

          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (v57) {
            *(_BYTE *)(a1 + 266) = 1;
          }
LABEL_155:
          if (v54 != v55) {
            return 720926LL;
          }
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          uint64_t v37 = v60 + v56;
          if (v60 > v60 + v56) {
            goto LABEL_186;
          }
          __int128 v38 = v61;
          if (v37 > v61) {
            goto LABEL_186;
          }
          v60 += v56;
        }

        while (v37 < v61);
      }

      if (v37 != v38) {
        return 720925LL;
      }
      if (v37 > v65 || v64 > v37) {
        goto LABEL_186;
      }
      int v64 = v37;
    }

    if (*(void *)(a1 + 32) < 3uLL)
    {
      int v16 = 720915LL;
      if (v64 != v65) {
        return v16;
      }
LABEL_170:
      if (__CFADD__(v66, v69)) {
        goto LABEL_187;
      }
      if (v66 > v66 + v69 || v66 + v69 > v67) {
        goto LABEL_186;
      }
      v66 += v69;
      *(void *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v60 = 0LL;
      uint64_t result = ccder_blob_decode_bitstring();
      if (!(_DWORD)result) {
        return 720938LL;
      }
      if (v60 < 0xFFFFFFFFFFFFFFF9LL)
      {
        if (*((void *)&v70[0] + 1) >= *(void *)&v70[0])
        {
          __int128 v51 = (v60 + 7) >> 3;
          if (v51 <= *((void *)&v70[0] + 1) - *(void *)&v70[0])
          {
            *(void *)(a1 + 56) = *(void *)&v70[0];
            *(void *)(a1 + 64) = v51;
            __int128 v52 = v67;
            if (v66 <= v67)
            {
              int v16 = 0LL;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }

        goto LABEL_186;
      }

      goto LABEL_188;
    }

    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }

uint64_t _property_value_init_with_DERImg4(void *a1, uint64_t a2)
{
  BOOL v13 = 0;
  int v12 = 0;
  unint64_t v11 = 0LL;
  uint64_t v4 = (char **)(a2 + 24);
  uint64_t result = DERParseBoolean((unsigned __int8 **)(a2 + 24), &v13);
  if ((_DWORD)result)
  {
    uint64_t result = DERParseInteger(v4, &v12);
    if ((_DWORD)result)
    {
      uint64_t result = DERParseInteger64(v4, &v11);
      if ((_DWORD)result)
      {
        if (a1 && a1 + 10 < a1) {
          __break(0x5519u);
        }
        else {
          return digest_init((uint64_t)a1, *(const void **)(a2 + 24), *(void *)(a2 + 32), v6, v7, v8, v9, v10);
        }
      }

      else
      {
        *a1 = v11;
      }
    }

    else
    {
      *(_DWORD *)a1 = v12;
    }
  }

  else
  {
    *(_BYTE *)a1 = v13;
  }

  return result;
}

uint64_t _chain_manifest_enforceable(uint64_t a1, uint64_t a2)
{
  if (odometer_policy_get_chip_property(a1, *(void *)(a2 + 16)))
  {
    int v3 = *(unsigned __int16 *)(a2 + 320);
    uint64_t v4 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    if (v3)
    {
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, name);
      return 0LL;
    }

    else
    {
      uint64_t v11 = 1LL;
      expert_log( v4,  1uLL,  (uint64_t)"odometer[%s:%s]: manifest has no chained hash constraint",  v6,  v7,  v8,  v9,  v10,  name);
    }
  }

  else
  {
    uint64_t v12 = *(void *)a2;
    uint64_t v13 = chip_get_name(*(void *)(a2 + 16));
    uint64_t v11 = 1LL;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, v13);
  }

  return v11;
}

uint64_t _chain_manifest_enforce(uint64_t a1, uint64_t a2)
{
  v34[13] = *MEMORY[0x1895F89C0];
  uint64_t chip_property = odometer_policy_get_chip_property(a1, *(void *)(a2 + 16));
  if (!*(_WORD *)(a2 + 320)) {
    __panic_npx("panic: optional not set", v5, v6, v7, v8, v9, v10, v11, v33);
  }
  uint64_t v12 = chip_property;
  *(_OWORD *)uint64_t v34 = xmmword_1894E7480;
  memset(&v34[2], 170, 88);
  digest_copy((uint64_t)v34, a2 + 240, v6, v7, v8, v9, v10, v11);
  uint64_t v17 = odometer_enforce_property((uint64_t *)a2, a1, v12, (unsigned __int8 *)v34, v13, v14, v15, v16);
  uint64_t v18 = *(void *)a2;
  uint64_t name = chip_get_name(*(void *)(a2 + 16));
  if ((_DWORD)v17)
  {
    expert_log(v18, 0LL, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v20, v21, v22, v23, v24, name);
  }

  else
  {
    expert_log( v18,  1uLL,  (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain",  v20,  v21,  v22,  v23,  v24,  name);
  }

  return v17;
}

uint64_t image4_trust_evaluation_prepare_manifest_callbacks(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2) {
    *(void *)(a2 + 32) = v2;
  }
  return result;
}

unint64_t image4_trust_evaluation_get_result( unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = *a5;
  if (v8
    || (result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(result + 32))( result,  a2,  a3,  a4,  &v8),  uint64_t v6 = v8,  result > result + v8)
    || ((*a5 = v8, result) ? (BOOL v7 = v6 == 0) : (BOOL v7 = 0), v7))
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t darwin_syscall_init(uint64_t a1)
{
  for (uint64_t i = 0LL; i != 80; i += 5LL)
  {
    int v3 = &(&__traps)[i];
    size_t v25 = 5LL;
    int v9 = *__error();
    if ((v9 - 1) >= 2)
    {
      if (v9)
      {
        uint64_t v17 = (&__traps)[i];
        __error();
        __panic_npx("panic: sysctlnametomib: %s%d", v18, v19, v20, v21, v22, v23, v24, (char)v17);
      }

      uint64_t result = expert_log(a1, 3uLL, (uint64_t)"initialized trap: %s", v4, v5, v6, v7, v8, (uint64_t)(&__traps)[i]);
      LODWORD((&__traps)[i + 4]) = v25;
    }

    else
    {
      uint64_t v10 = (uint64_t)*v3;
      __error();
      uint64_t result = expert_log(a1, 3uLL, (uint64_t)"trap not present trap: %s: %d", v11, v12, v13, v14, v15, v10);
      *((_DWORD *)v3 + 3) = -1;
    }
  }

  return result;
}

char **darwin_syscall_get( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 > 0xF) {
    __panic_npx("panic: invalid trap number: actual = %#llx, expected < %#llx", a2, a3, a4, a5, a6, a7, a8, a1);
  }
  uint64_t v8 = &(&__traps)[5 * a1];
  if (!LODWORD((&__traps)[5 * a1 + 4])) {
    return 0LL;
  }
  if (v8 >= (char **)&__plat4_mem)
  {
LABEL_8:
    __break(0x5519u);
    return 0LL;
  }

  return v8;
}

uint64_t darwin_syscall_kmod_copy_abi_version(uint64_t a1, _BYTE *a2)
{
  __int16 v25 = 0;
  uint64_t v24 = 1LL;
  uint64_t v4 = expert_runtime_boot(a1);
  if ((_DWORD)v4)
  {
    uint64_t v10 = v4;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v5, v6, v7, v8, v9, v4);
  }

  else
  {
    if (!dword_18C507788) {
      return 78LL;
    }
    uint64_t v10 = expert_syscall(a1, (uint64_t)&__traps, (uint64_t)&v25 + 1, 1LL, (uint64_t)&v25, (uint64_t)&v24);
    if (!(_DWORD)v10)
    {
      *a2 = v25;
      return v10;
    }

    expert_log(a1, 0LL, (uint64_t)"trap failed: %s: %d", v19, v20, v21, v22, v23, (uint64_t)__traps);
  }

  return v10;
}

uint64_t darwin_syscall_kmod_copy_version(uint64_t a1, char *a2)
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v43 = 0u;
  __int128 v42 = 0u;
  __int128 v41 = 0u;
  __int128 v40 = 0u;
  __int128 v39 = 0u;
  __int128 v38 = 0u;
  __int128 v37 = 0u;
  __int128 v36 = 0u;
  __int128 v35 = 0u;
  __int128 v34 = 0u;
  __int128 v33 = 0u;
  __int128 v32 = 0u;
  __int128 v31 = 0u;
  __int128 v30 = 0u;
  __int128 v29 = 0u;
  __int128 v28 = 0u;
  char v27 = 1;
  memset(v26, 0, sizeof(v26));
  char v25 = 1;
  uint64_t v24 = 513LL;
  uint64_t v4 = expert_runtime_boot(a1);
  if ((_DWORD)v4)
  {
    uint64_t v10 = v4;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v5, v6, v7, v8, v9, v4);
  }

  else
  {
    if (!dword_18C5077B0) {
      return 78LL;
    }
    uint64_t v10 = expert_syscall(a1, (uint64_t)&qword_18C507790, (uint64_t)&v27, 513LL, (uint64_t)&v25, (uint64_t)&v24);
    if (!(_DWORD)v10)
    {
      strlcpy(a2, (const char *)v26, 0x200uLL);
      return v10;
    }

    expert_log(a1, 0LL, (uint64_t)"trap failed: %s: %d", v19, v20, v21, v22, v23, qword_18C507790);
  }

  return v10;
}

uint64_t darwin_syscall_nonce_copy_hash(uint64_t a1, int *a2, int a3, void *a4, void *a5)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  int v42 = 0;
  __int128 v41 = 0u;
  __int128 v40 = 0u;
  __int128 v39 = 0u;
  __int128 v38 = 0u;
  char v35 = 1;
  int v36 = *a2;
  int v37 = a3;
  unsigned int v34 = 0;
  memset(v33, 0, sizeof(v33));
  char v30 = 1;
  int v31 = v36;
  int v32 = a3;
  uint64_t v29 = 77LL;
  uint64_t v8 = expert_runtime_boot(a1);
  if ((_DWORD)v8)
  {
    uint64_t v14 = v8;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v9, v10, v11, v12, v13, v8);
    goto LABEL_3;
  }

  if (!dword_18C5078A0) {
    return 78LL;
  }
  uint64_t result = expert_syscall(a1, (uint64_t)&qword_18C507880, (uint64_t)&v35, 77LL, (uint64_t)&v30, (uint64_t)&v29);
  if ((_DWORD)result)
  {
    uint64_t v14 = result;
    expert_log(a1, 0LL, (uint64_t)"trap failed: %s: %d", v23, v24, v25, v26, v27, qword_18C507880);
LABEL_3:
    return v14;
  }

  uint64_t v28 = v34;
  if (v34 <= 0x40)
  {
    memcpy(a4, v33, v34);
    uint64_t v14 = 0LL;
    *a5 = v28;
    return v14;
  }

  __break(0x5519u);
  return result;
}

uint64_t darwin_syscall_nonce_peek_hash(uint64_t a1, int *a2, int a3, void *a4, void *a5)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  int v42 = 0;
  __int128 v41 = 0u;
  __int128 v40 = 0u;
  __int128 v39 = 0u;
  __int128 v38 = 0u;
  char v35 = 1;
  int v36 = *a2;
  int v37 = a3;
  unsigned int v34 = 0;
  memset(v33, 0, sizeof(v33));
  char v30 = 1;
  int v31 = v36;
  int v32 = a3;
  uint64_t v29 = 77LL;
  uint64_t v8 = expert_runtime_boot(a1);
  if ((_DWORD)v8)
  {
    uint64_t v14 = v8;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v9, v10, v11, v12, v13, v8);
    goto LABEL_3;
  }

  if (!dword_18C5078C8) {
    return 78LL;
  }
  uint64_t result = expert_syscall(a1, (uint64_t)&qword_18C5078A8, (uint64_t)&v35, 77LL, (uint64_t)&v30, (uint64_t)&v29);
  if ((_DWORD)result)
  {
    uint64_t v14 = result;
    expert_log(a1, 0LL, (uint64_t)"trap failed: %s: %d", v23, v24, v25, v26, v27, qword_18C5078A8);
LABEL_3:
    return v14;
  }

  uint64_t v28 = v34;
  if (v34 <= 0x40)
  {
    memcpy(a4, v33, v34);
    uint64_t v14 = 0LL;
    *a5 = v28;
    return v14;
  }

  __break(0x5519u);
  return result;
}

uint64_t darwin_syscall_nonce_roll(uint64_t a1, int *a2, int a3)
{
  char v28 = 1;
  int v29 = *a2;
  int v30 = a3;
  char v25 = 1;
  int v26 = v29;
  int v27 = a3;
  uint64_t v24 = 9LL;
  uint64_t v4 = expert_runtime_boot(a1);
  if ((_DWORD)v4)
  {
    uint64_t v10 = v4;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v5, v6, v7, v8, v9, v4);
    goto LABEL_3;
  }

  if (!dword_18C5078F0) {
    return 78LL;
  }
  uint64_t v10 = expert_syscall(a1, (uint64_t)&qword_18C5078D0, (uint64_t)&v28, 9LL, (uint64_t)&v25, (uint64_t)&v24);
  if ((_DWORD)v10)
  {
    expert_log(a1, 0LL, (uint64_t)"trap failed: %s: %d", v19, v20, v21, v22, v23, qword_18C5078D0);
LABEL_3:
  }

  return v10;
}

uint64_t darwin_syscall_nonce_unroll(uint64_t a1, int *a2, int a3)
{
  char v28 = 1;
  int v29 = *a2;
  int v30 = a3;
  char v25 = 1;
  int v26 = v29;
  int v27 = a3;
  uint64_t v24 = 9LL;
  uint64_t v4 = expert_runtime_boot(a1);
  if ((_DWORD)v4)
  {
    uint64_t v10 = v4;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v5, v6, v7, v8, v9, v4);
    goto LABEL_3;
  }

  if (!dword_18C507918) {
    return 78LL;
  }
  uint64_t v10 = expert_syscall(a1, (uint64_t)&qword_18C5078F8, (uint64_t)&v28, 9LL, (uint64_t)&v25, (uint64_t)&v24);
  if ((_DWORD)v10)
  {
    expert_log(a1, 0LL, (uint64_t)"trap failed: %s: %d", v19, v20, v21, v22, v23, qword_18C5078F8);
LABEL_3:
  }

  return v10;
}

uint64_t darwin_syscall_nonce_generate_proposal( uint64_t a1, _DWORD *a2, int a3, void *a4, void *a5, char *a6, unint64_t *a7)
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  __int128 v51 = 0u;
  uint64_t v57 = 0LL;
  __int128 v56 = 0u;
  __int128 v55 = 0u;
  __int128 v54 = 0u;
  __int128 v53 = 0u;
  __int128 v52 = 0u;
  char v50 = 1;
  DWORD2(v51) = *a2;
  HIDWORD(v51) = a3;
  uint64_t v44 = 0LL;
  uint64_t v49 = 0LL;
  __int128 v48 = 0u;
  memset(v47, 0, sizeof(v47));
  char v43 = 1;
  int v45 = DWORD2(v51);
  int v46 = a3;
  uint64_t v42 = 105LL;
  uint64_t v12 = expert_runtime_boot(a1);
  if ((_DWORD)v12)
  {
    uint64_t v18 = v12;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v13, v14, v15, v16, v17, v12);
    goto LABEL_3;
  }

  if (!dword_18C507940) {
    return 78LL;
  }
  BOOL v27 = a6 != 0LL;
  if (a7 && a6 && *a7)
  {
    BOOL v27 = 1;
    *(void *)&__int128 v51 = 1LL;
  }

  uint64_t v28 = expert_syscall(a1, (uint64_t)&qword_18C507920, (uint64_t)&v50, 105LL, (uint64_t)&v43, (uint64_t)&v42);
  if (!(_DWORD)v28)
  {
    uint64_t v37 = v48;
    if (v48 <= 0x40)
    {
      memcpy(a4, v47, v48);
      *a5 = v37;
      unint64_t v38 = HIDWORD(v49);
      if (!HIDWORD(v49)) {
        return 0LL;
      }
      unint64_t v36 = *a7;
      if (*a7 <= 0xF) {
LABEL_27:
      }
        __panic_npx( "panic: insufficient nonce buffer length: actual = %lu, expected >= %lu",  v29,  v30,  v31,  v32,  v33,  v34,  v35,  v36);
      __int128 v39 = a6 + 16;
      if (!v27) {
        __int128 v39 = 0LL;
      }
      BOOL v40 = v39 >= a6;
      unint64_t v41 = v39 - a6;
      if (v40 && v36 <= v41 && HIDWORD(v49) <= 0x10 && v36 >= HIDWORD(v49))
      {
        memcpy(a6, (char *)&v48 + 4, HIDWORD(v49));
        uint64_t v18 = 0LL;
        *a7 = v38;
        return v18;
      }
    }

    __break(0x5519u);
    goto LABEL_27;
  }

  uint64_t v18 = v28;
  expert_log(a1, 0LL, (uint64_t)"trap failed: %s: %d", v31, v32, v33, v34, v35, qword_18C507920);
LABEL_3:
  return v18;
}

uint64_t darwin_syscall_nonce_verify( uint64_t a1, int *a2, int a3, uint64_t a4, uint64_t a5, unint64_t a6, _OWORD *a7, unint64_t a8)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  memset(v53, 0, sizeof(v53));
  __int128 v52 = 0u;
  __int128 v51 = 0u;
  __int128 v50 = 0u;
  __int128 v49 = 0u;
  char v45 = 1;
  uint64_t v46 = a4;
  int v47 = *a2;
  int v48 = a3;
  uint64_t v44 = 0LL;
  __int128 v43 = 0u;
  __int128 v42 = 0u;
  __int128 v41 = 0u;
  __int128 v40 = 0u;
  __int128 v39 = 0u;
  char v35 = 1;
  uint64_t v36 = a4;
  int v37 = v47;
  int v38 = a3;
  uint64_t v34 = 105LL;
  uint64_t v12 = expert_runtime_boot(a1);
  if ((_DWORD)v12)
  {
    uint64_t v20 = v12;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v15, v16, v17, v18, v19, v12);
    goto LABEL_3;
  }

  if (!dword_18C507968) {
    return 78LL;
  }
  if (a6 > 0x40) {
    goto LABEL_16;
  }
  __memcpy_chk();
  v53[0] = a6;
  if (!a7 || !a8) {
    goto LABEL_12;
  }
  if (a8 <= 0xF) {
LABEL_17:
  }
    __panic_npx( "panic: insufficient nonce buffer length: actual = %lu, expected >= %lu",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  a8);
  if (a8 != 16)
  {
LABEL_16:
    __break(0x5519u);
    goto LABEL_17;
  }

  *(_OWORD *)&v53[1] = *a7;
  v53[5] = 16;
LABEL_12:
  uint64_t v20 = expert_syscall(a1, (uint64_t)&qword_18C507948, (uint64_t)&v45, 105LL, (uint64_t)&v35, (uint64_t)&v34);
  if (!(_DWORD)v20) {
    return v20;
  }
  expert_log(a1, 0LL, (uint64_t)"trap failed: %s: %d", v29, v30, v31, v32, v33, qword_18C507948);
LABEL_3:
  return v20;
}

uint64_t darwin_syscall_image_activate( uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v45 = 2;
  uint64_t v11 = *a3;
  uint64_t v46 = a2;
  uint64_t v47 = v11;
  int length_uint32 = buff_get_length_uint32((uint64_t)a3, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8);
  uint64_t v49 = *a4;
  int v50 = buff_get_length_uint32((uint64_t)a4, v12, v13, v14, v15, v16, v17, v18);
  char v40 = 2;
  uint64_t v41 = a2;
  uint64_t v42 = 0LL;
  uint64_t v44 = 0LL;
  uint64_t v43 = 0LL;
  uint64_t v39 = 33LL;
  uint64_t v19 = expert_runtime_boot(a1);
  if ((_DWORD)v19)
  {
    uint64_t v25 = v19;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v20, v21, v22, v23, v24, v19);
    goto LABEL_3;
  }

  if (!dword_18C507990) {
    return 78LL;
  }
  uint64_t v25 = expert_syscall(a1, (uint64_t)&qword_18C507970, (uint64_t)&v45, 33LL, (uint64_t)&v40, (uint64_t)&v39);
  if ((_DWORD)v25)
  {
    expert_log(a1, 0LL, (uint64_t)"trap failed: %s: %d", v34, v35, v36, v37, v38, qword_18C507970);
LABEL_3:
  }

  return v25;
}

uint64_t darwin_syscall_image_dfu( uint64_t a1, int *a2, uint64_t *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  char v41 = 0;
  int v42 = *a2;
  uint64_t v43 = *a3;
  int length_uint32 = buff_get_length_uint32((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
  uint64_t v46 = 0LL;
  uint64_t v45 = 0LL;
  int v47 = 0;
  char v39 = 0;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  *(_DWORD *)((char *)&v37 + 1) = *a2;
  unsigned int v40 = 16;
  uint64_t v36 = 37LL;
  uint64_t v12 = expert_runtime_boot(a1);
  if ((_DWORD)v12)
  {
    uint64_t v18 = v12;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v13, v14, v15, v16, v17, v12);
    goto LABEL_3;
  }

  if (!dword_18C5079B8) {
    return 78LL;
  }
  uint64_t v27 = expert_syscall(a1, (uint64_t)&qword_18C507998, (uint64_t)&v41, 37LL, (uint64_t)&v37, (uint64_t)&v36);
  if ((_DWORD)v27)
  {
    uint64_t v18 = v27;
    expert_log(a1, 0LL, (uint64_t)"trap failed: %s: %d", v30, v31, v32, v33, v34, qword_18C507998);
LABEL_3:
    return v18;
  }

  uint64_t v35 = v40;
  if (v40 >= 0x11) {
    __panic_npx( "panic: kernel nonce overflows bounds: actual = %u, expected <= %u",  v28,  v29,  v30,  v31,  v32,  v33,  v34,  v40);
  }
  memcpy(a4, (char *)&v38 + 1, v40);
  uint64_t v18 = 0LL;
  *a5 = v35;
  return v18;
}

uint64_t darwin_syscall_image_copy_active( uint64_t a1, uint64_t a2, uint64_t *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v36 = 1;
  uint64_t v37 = a2;
  uint64_t v38 = *a3;
  int length_uint32 = buff_get_length_uint32((uint64_t)a3, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8);
  char v32 = 1;
  uint64_t v33 = a2;
  uint64_t v34 = 0LL;
  unsigned int v35 = 0;
  uint64_t v31 = 21LL;
  uint64_t v11 = expert_runtime_boot(a1);
  if ((_DWORD)v11)
  {
    uint64_t v17 = v11;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v12, v13, v14, v15, v16, v11);
  }

  else
  {
    if (!dword_18C5079E0) {
      return 78LL;
    }
    uint64_t v17 = expert_syscall(a1, (uint64_t)&qword_18C5079C0, (uint64_t)&v36, 21LL, (uint64_t)&v32, (uint64_t)&v31);
    if (!(_DWORD)v17)
    {
      *a4 = v35;
      return v17;
    }

    expert_log(a1, 0LL, (uint64_t)"trap failed: %s: %d", v26, v27, v28, v29, v30, qword_18C5079C0);
  }

  return v17;
}

uint64_t posixdr(unsigned int a1)
{
  if (a1 > 7) {
    return 14LL;
  }
  else {
    return dword_1894E7588[a1];
  }
}

const char *strdr(unsigned int a1)
{
  if (a1 > 7) {
    return "generic error";
  }
  else {
    return off_18A3B4B88[a1];
  }
}

uint64_t _chain_sideload_enforceable(uint64_t result, uint64_t *a2)
{
  int v3 = (void *)a2[2];
  uint64_t v4 = v3 + 33;
  if (v3[24] && v3[22])
  {
    if (v3 < v4)
    {
      char name = chip_get_name(a2[2]);
      __panic_npx( "panic: illegal chip definition: sideload and pivot policies defined: %s",  v22,  v23,  v24,  v25,  v26,  v27,  v28,  name);
    }

    goto LABEL_12;
  }

  if (v3 >= v4)
  {
LABEL_12:
    __break(0x5519u);
    return result;
  }

  if (odometer_policy_get_chip_property(result, a2[2]))
  {
    uint64_t v5 = v3[31];
    uint64_t v6 = *a2;
    uint64_t v7 = chip_get_name(a2[2]);
    if (v5)
    {
      expert_log(v6, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v8, v9, v10, v11, v12, v7);
      return 0LL;
    }

    else
    {
      uint64_t v13 = 1LL;
      expert_log(v6, 1uLL, (uint64_t)"odometer[%s:%s]: sideload chip has no notary", v8, v9, v10, v11, v12, v7);
    }
  }

  else
  {
    uint64_t v14 = *a2;
    uint64_t v15 = chip_get_name(a2[2]);
    uint64_t v13 = 1LL;
    expert_log(v14, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v16, v17, v18, v19, v20, v15);
  }

  return v13;
}

uint64_t _chain_sideload_enforce(uint64_t a1, uint64_t a2)
{
  v33[13] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  *(_OWORD *)uint64_t v33 = xmmword_1894E75A8;
  memset(&v33[2], 170, 88);
  if (*(_BYTE *)(a2 + 440))
  {
    uint64_t v6 = *(void *)a2;
    uint64_t name = chip_get_name(v5);
    expert_log( v6,  1uLL,  (uint64_t)"odometer[%s:%s]: manifest self-entitled for mix-n-match; relaxing chain integrity policy",
      v7,
      v8,
      v9,
      v10,
      v11,
      name);
    return 0LL;
  }

  manifest_measure(v4, v5, (uint64_t)v33);
  uint64_t v12 = odometer_enforce_property( (uint64_t *)a2,  a1,  (uint64_t)&_property_bmfh,  (unsigned __int8 *)v33,  v13,  v14,  v15,  v16);
  uint64_t v17 = *(void *)a2;
  uint64_t v18 = chip_get_name(*(void *)(a2 + 16));
  if (!(_DWORD)v12)
  {
    expert_log( v17,  1uLL,  (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain",  v19,  v20,  v21,  v22,  v23,  v18);
    return 0LL;
  }

  expert_log(v17, 0LL, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v19, v20, v21, v22, v23, v18);
  return v12;
}

uint64_t digest_check_buff(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x40) {
    return 0LL;
  }
  else {
    return 84LL;
  }
}

uint64_t digest_init( uint64_t a1, const void *a2, size_t __n, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (__n >= 0x41) {
    __panic_npx( "panic: digest length overflow: actual = %lu, expected <= %lu",  (uint64_t)a2,  __n,  a4,  a5,  a6,  a7,  a8,  __n);
  }
  memcpy((void *)(a1 + 8), a2, __n);
  *(void *)(a1 + 72) = __n;
  return a1;
}

void *digest_init_measure( void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a2 >= 0x41uLL) {
    __panic_npx( "panic: digest length overflow: actual = %lu, expected <= %lu",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  *a2);
  }
  ccdigest();
  a1[9] = *a2;
  *a1 = a2;
  return a1;
}

uint64_t digest_copy( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = *(void *)(a2 + 72);
  if (v8 < 0x41) {
    return digest_init(result, (const void *)(a2 + 8), v8, a4, a5, a6, a7, a8);
  }
  __break(0x5519u);
  return result;
}

uint64_t digest_compare(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 72);
  if (v2 == *(void *)(a2 + 72)) {
    return memcmp((const void *)(a1 + 8), (const void *)(a2 + 8), v2);
  }
  else {
    return 1LL;
  }
}

uint64_t digest_compare_buff(uint64_t a1, const void *a2, size_t a3)
{
  if (*(void *)(a1 + 72) == a3) {
    return memcmp((const void *)(a1 + 8), a2, a3);
  }
  else {
    return 1LL;
  }
}

unint64_t digest_print_cstr( unint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = *(void *)(result + 72);
  if (v8 < 0x41) {
    return sprintdgst_npx(a2, (unsigned __int8 *)(result + 8), v8, a4, a5, a6, a7, a8);
  }
  __break(0x5519u);
  return result;
}

void *digest_copy_out( uint64_t a1, void *__dst, size_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9 = *a3;
  size_t v10 = *(void *)(a1 + 72);
  if (v9 < v10) {
LABEL_6:
  }
    __panic_npx( "panic: digest length overflow: actual = %lu, expected >= %lu",  (uint64_t)__dst,  v10,  a4,  a5,  a6,  a7,  a8,  v9);
  if (v10 > 0x40 || (result = memcpy(__dst, (const void *)(a1 + 8), v10), size_t v9 = *(void *)(a1 + 72), v9 > *a3))
  {
    __break(0x5519u);
    goto LABEL_6;
  }

  *a3 = v9;
  return result;
}

void *digest_copy_out32( uint64_t a1, void *__dst, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = *a3;
  size_t v10 = *(void *)(a1 + 72);
  if (v10 > v9) {
LABEL_7:
  }
    __panic_npx( "panic: digest length overflow: actual = %u, expected >= %lu",  (uint64_t)__dst,  v10,  a4,  a5,  a6,  a7,  a8,  v9);
  if (v10 > 0x40) {
    goto LABEL_6;
  }
  uint64_t result = memcpy(__dst, (const void *)(a1 + 8), v10);
  unint64_t v9 = *(void *)(a1 + 72);
  if (HIDWORD(v9)) {
    __panic_npx( "panic: integer cast overflow: v = %s, actual = %llu, expected <= %llu",  (uint64_t)__dst,  v10,  a4,  a5,  a6,  a7,  a8,  (char)"d->d_len");
  }
  if (v9 > *a3)
  {
LABEL_6:
    __break(0x5519u);
    goto LABEL_7;
  }

  *a3 = v9;
  return result;
}

uint64_t __select_ap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 8);
  v7[0] = "AP-SECURE-BOOT";
  v7[1] = 1LL;
  _OWORD v7[2] = expert_query_chip(v5, 0LL);
  v7[3] = "drpa";
  v7[4] = "drpa";
  v7[5] = 0LL;
  uint64_t result = image4_coprocessor_select_digest(a1, (uint64_t)&__select_ap_digest_map);
  if (!result) {
    return image4_coprocessor_select_secure_boot(a1, (uint64_t)v7, a3);
  }
  return result;
}

uint64_t __select_ap_pdi(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[0] = xmmword_18A3B5130;
  v6[1] = *(_OWORD *)&off_18A3B5140;
  v6[2] = xmmword_18A3B5150;
  v5[0] = xmmword_18A3B5160;
  v5[1] = *(_OWORD *)&off_18A3B5170;
  v5[2] = xmmword_18A3B5180;
  uint64_t result = image4_coprocessor_select(a1, v6, a3);
  if (!result) {
    return image4_coprocessor_select_digest(a1, (uint64_t)v5);
  }
  return result;
}

uint64_t __select_ap_ddi(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[0] = xmmword_18A3B5190;
  v6[1] = *(_OWORD *)&off_18A3B51A0;
  v6[2] = xmmword_18A3B51B0;
  v5[0] = xmmword_18A3B51C0;
  v5[1] = *(_OWORD *)&off_18A3B51D0;
  v5[2] = xmmword_18A3B51E0;
  uint64_t result = image4_coprocessor_select(a1, v6, a3);
  if (!result) {
    return image4_coprocessor_select_digest(a1, (uint64_t)v5);
  }
  return result;
}

uint64_t fourcc_init(uint64_t result, unsigned int a2)
{
  *(_DWORD *)uint64_t result = a2;
  if (result + 4 > (unint64_t)(result + 9))
  {
    __break(0x5519u);
  }

  else
  {
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)(result + 4) = 0;
    *(_DWORD *)(result + 4) = bswap32(a2);
  }

  return result;
}

size_t fourcc_init_cstring(uint64_t a1, char *__s)
{
  size_t result = strlen(__s);
  if (result != 4) {
    __panic_npx_4(result, v5, v6, v7, v8, v9, v10, v11, result);
  }
  if (__s + 5 < __s)
  {
    __break(0x5519u);
  }

  else
  {
    *(_DWORD *)a1 = bswap32(*(_DWORD *)__s);
    strlcpy((char *)(a1 + 4), __s, 5uLL);
    return a1;
  }

  return result;
}

void __panic_npx_4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  uint64_t v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: cstring is not a fourcc: length = %lu", &a9);
  _os_crash();
  __break(1u);
}

uint64_t fourcc_get_cstring(uint64_t a1)
{
  return a1 + 4;
}

uint64_t fourcc_copy(uint64_t a1, unsigned int *a2)
{
  return fourcc_init(a1, *a2);
}

BOOL fourcc_equal(_DWORD *a1, _DWORD *a2)
{
  return a2 && *a1 == *a2;
}

uint64_t __handle_absence_1(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 0;
  return 0LL;
}

const char *__select_pdi(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t chip = expert_query_chip(*(void *)(a3 + 8), 0LL);
  if (!*(void *)(chip + 72)) {
    return 0LL;
  }
  if (*(void *)(chip + 64)) {
    return "ndpv";
  }
  return "idpv";
}

const char *__select_ddi(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t chip = expert_query_chip(*(void *)(a3 + 8), 0LL);
  if (!*(void *)(chip + 72)) {
    return 0LL;
  }
  if (*(void *)(chip + 64)) {
    return "nddv";
  }
  return "iddv";
}

uint64_t zcmp_npx(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  size_t v2 = (char *)result;
  while (1)
  {
    int v4 = *v2++;
    int v3 = v4;
    unsigned int v5 = v4 < 0 ? -1 : result;
    size_t result = v3 >= 1 ? 1LL : v5;
    if ((_BYTE)v3) {
      break;
    }
    if (!--a2) {
      return 0LL;
    }
  }

  return result;
}

unint64_t strtou32_npx(const char *a1, char **a2, int a3)
{
  __endptr = 0LL;
  *__error() = 0;
  unint64_t result = strtoul(a1, &__endptr, a3);
  if (__endptr && *__endptr)
  {
    unint64_t result = 0LL;
    if (a2) {
      *a2 = __endptr;
    }
  }

  else if (HIDWORD(result))
  {
    *__error() = 34;
    return 0xFFFFFFFFLL;
  }

  return result;
}

const char *strsuf_npx(const char *a1, const char *a2)
{
  size_t v4 = strlen(a1);
  unsigned int v5 = &a1[v4 - strlen(a2)];
  if (v5 < a1 || strcmp(v5, a2)) {
    return 0LL;
  }
  return v5;
}

uint64_t _boot_flash_secondary_enforceable(uint64_t a1, uint64_t a2)
{
  if (odometer_policy_get_chip_property(a1, *(void *)(a2 + 16)))
  {
    uint64_t v10 = *(void *)(a2 + 16);
    if (*(void *)(v10 + 80))
    {
      if (!*(void *)(v10 + 88))
      {
        if (manifest_get_restore_info(*(void *)(a2 + 8), v3, v4, v5, v6, v7, v8, v9))
        {
          int v28 = *(unsigned __int16 *)(a2 + 144);
          uint64_t v29 = *(void *)a2;
          uint64_t name = chip_get_name(*(void *)(a2 + 16));
          if (v28)
          {
            expert_log(v29, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v12, v13, v14, v15, v16, name);
            return 0LL;
          }

          uint64_t v31 = name;
          uint64_t v17 = "odometer[%s:%s]: manifest has no constraint for policy";
        }

        else
        {
          uint64_t v29 = *(void *)a2;
          uint64_t v31 = chip_get_name(*(void *)(a2 + 16));
          uint64_t v17 = "odometer[%s:%s]: boot object has no restore info";
        }

        uint64_t v20 = 1LL;
        uint64_t v26 = v29;
        goto LABEL_8;
      }

      uint64_t v11 = *(void *)a2;
      uint64_t v31 = chip_get_name(v10);
      uint64_t v17 = "odometer[%s:%s]: chip is not secondary-stage dfu policy";
    }

    else
    {
      uint64_t v11 = *(void *)a2;
      uint64_t v31 = chip_get_name(v10);
      uint64_t v17 = "odometer[%s:%s]: chip has no associated dfu policy";
    }

    uint64_t v20 = 1LL;
    uint64_t v26 = v11;
LABEL_8:
    expert_log(v26, 1uLL, (uint64_t)v17, v12, v13, v14, v15, v16, v31);
    return v20;
  }

  uint64_t v18 = *(void *)a2;
  uint64_t v19 = chip_get_name(*(void *)(a2 + 16));
  uint64_t v20 = 1LL;
  expert_log(v18, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v21, v22, v23, v24, v25, v19);
  return v20;
}

uint64_t _boot_flash_secondary_enforce( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v69[3] = *MEMORY[0x1895F89C0];
  if (!*(_WORD *)(a2 + 144)) {
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v66);
  }
  uint64_t v10 = *(void *)(a2 + 8);
  uint64_t v11 = *(void **)(a2 + 16);
  uint64_t v12 = v11[20];
  uint64_t v13 = *(unsigned int *)(a2 + 24);
  memset(v69, 0, 24);
  memset(v68, 0, sizeof(v68));
  memset(v67, 0, sizeof(v67));
  uint64_t v14 = *(void *)a2;
  uint64_t restore_info = manifest_get_restore_info(v10, a2, a3, a4, a5, a6, a7, a8);
  if (!restore_info) {
    __panic_npx("panic: boot object has no restore info", v16, v17, v18, v19, v20, v21, v22, v66);
  }
  uint64_t restore_info_nonce = odometer_query_restore_info_nonce((uint64_t *)a2, restore_info, v69);
  if ((_DWORD)restore_info_nonce)
  {
    uint64_t v24 = restore_info_nonce;
    uint64_t v25 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log( v25,  0LL,  (uint64_t)"odometer[%s:%s]: failed to query restore info nonce: %d",  v27,  v28,  v29,  v30,  v31,  name);
  }

  else
  {
    uint64_t v39 = expert_entangle_nonce(v14, (uint64_t)v11, v13, (uint64_t)v69, (uint64_t)v68);
    if ((_DWORD)v39)
    {
      uint64_t v24 = v39;
      uint64_t v40 = *(void *)a2;
      uint64_t v41 = chip_get_name(*(void *)(a2 + 16));
      expert_log(v40, 0LL, (uint64_t)"odometer[%s:%s]: failed to entangle nonce: %d", v42, v43, v44, v45, v46, v41);
    }

    else
    {
      odometer_compute_nonce_hash(v14, v11, (uint64_t)v68, (uint64_t)v67);
      if (!property_constrain_digest(v12, v14, a2 + 64, (unint64_t)v67, v47, v48, v49, v50))
      {
        uint64_t v59 = *(void *)a2;
        uint64_t v60 = chip_get_name(*(void *)(a2 + 16));
        expert_log(v59, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is current", v61, v62, v63, v64, v65, v60);
        return 0LL;
      }

      uint64_t v24 = *(unsigned int *)(a1 + 24);
      uint64_t v51 = *(void *)a2;
      uint64_t v52 = chip_get_name(*(void *)(a2 + 16));
      expert_log( v51,  0LL,  (uint64_t)"odometer[%s:%s]: manifest inconsistent with restore info: %d",  v53,  v54,  v55,  v56,  v57,  v52);
    }
  }

  return v24;
}

uint64_t closure_init(uint64_t result, void *a2, uint64_t a3)
{
  *(void *)unint64_t result = a2;
  *(void *)(result + 8) = a3;
  *(void *)(result + 16) = *a2;
  strcpy((char *)(result + 24), "qinuuniq");
  *(void *)(result + 48) = 0LL;
  *(void *)(result + 56) = 0LL;
  *(void *)(result + 40) = 0LL;
  return result;
}

void *_closure_set_unique_tags(void *result, uint64_t a2, uint64_t a3)
{
  result[5] = a2;
  result[6] = a3;
  result[7] = _unique_entry_get_tag;
  return result;
}

uint64_t _unique_entry_get_tag(unsigned int *a1)
{
  return *a1;
}

uint64_t closure_measure( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v27 = 0LL;
  uint64_t v26 = 0LL;
  memset(v25, 0, sizeof(v25));
  uint64_t v10 = _closure_compute_internal(a1, v25, &v27, a4, a5, a6, a7, a8);
  if ((_DWORD)v10)
  {
    uint64_t v28 = v25;
    buff_destroy(&v28);
  }

  else
  {
    uint64_t v18 = (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 8) + 48LL))();
    digest_init_measure(a2, v18, v27, v19, v20, v21, v22, v23);
    uint64_t v28 = v25;
    buff_destroy(&v28);
  }

  return v10;
}

uint64_t closure_compute( uint64_t a1, void *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    a3 = &v9;
  }
  return _closure_compute_internal(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _closure_compute_internal( uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v130[1] = *MEMORY[0x1895F89C0];
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)a1;
  int v10 = *(unsigned __int16 *)(*(void *)a1 + 528LL);
  uint64_t v129 = 0LL;
  v130[0] = 0LL;
  __int128 v127 = 0u;
  __int128 v128 = 0u;
  __int128 v125 = 0u;
  __int128 v126 = 0u;
  __int128 v123 = xmmword_18A3B62A8;
  uint64_t v124 = 0LL;
  uint64_t v121 = 0LL;
  v122 = 0LL;
  uint64_t v119 = 0LL;
  __int128 v120 = 0LL;
  unsigned int v118 = 0;
  uint64_t v117 = 0LL;
  if (!v10) {
LABEL_82:
  }
    __panic_npx( "panic: closure measurement requires a parsed manifest",  (uint64_t)a2,  (uint64_t)a3,  a4,  a5,  a6,  a7,  a8,  v115);
  unint64_t alloc_preference = _type_get_alloc_preference((uint64_t)&_image4_type_decode_context);
  if (alloc_preference <= 1) {
    uint64_t v22 = 1LL;
  }
  else {
    uint64_t v22 = alloc_preference;
  }
  if (v22 == 1) {
    goto LABEL_9;
  }
  if (v22 != 2) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", v15, v16, v17, v18, v19, v20, v21, (char)"_t_preference");
  }
  uint64_t v23 = _expert_alloc_type(v8, (uint64_t)&_image4_type_decode_context);
  if (!v23)
  {
LABEL_9:
    uint64_t size = type_get_size((uint64_t)&_image4_type_decode_context);
    unint64_t v33 = MEMORY[0x1895F8858](size, v26, v27, v28, v29, v30, v31, v32);
    uint64_t v24 = (char *)&v115 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    if (v33 >= 0x31) {
      size_t v34 = v33 - 48;
    }
    else {
      size_t v34 = 0LL;
    }
    memset(v24 + 48, 170, v34);
    *(_OWORD *)uint64_t v24 = 0u;
    *((_OWORD *)v24 + 1) = 0u;
    *((_OWORD *)v24 + 2) = 0u;
  }

  else
  {
    uint64_t v24 = (char *)v23;
    v130[0] = v23;
  }

  *((_OWORD *)v24 + 1) = 0u;
  *((_OWORD *)v24 + 2) = 0u;
  *(_OWORD *)uint64_t v24 = 0u;
  uint64_t v35 = *(void *)(a1 + 8);
  *(void *)&__int128 v115 = *(void *)"PNAMMANP";
  DWORD2(v115) = 0;
  __int128 v125 = (unint64_t)a1;
  *(void *)&__int128 v126 = chip_select_decode(v35);
  if (!(void)v126)
  {
    uint64_t v50 = 82LL;
    expert_log( *(void *)(a1 + 16),  0LL,  (uint64_t)"chip environment not booted: %s: %d",  v36,  v37,  v38,  v39,  v40,  *(void *)(*(void *)(a1 + 8) + 8LL));
LABEL_19:
    expert_log( *(void *)(a1 + 16),  0LL,  (uint64_t)"failed to initialize compute context: %d",  v56,  v57,  v58,  v59,  v60,  v50);
    _expert_dealloc_type(v8, (uint64_t)&_image4_type_decode_context, v130);
    goto LABEL_68;
  }

  uint64_t v41 = (void *)closure_node_new_item(a1, (unsigned int *)&v115);
  if (!v41)
  {
    uint64_t v50 = 12LL;
    expert_log(*(void *)(a1 + 16), 0LL, (uint64_t)"failed to add MANP node: %d", v43, v44, v45, v46, v47, 12LL);
    goto LABEL_19;
  }

  *((void *)v24 + 5) = &v125;
  *(void *)&__int128 v128 = 0LL;
  *((void *)&v128 + 1) = &v128;
  *(void *)&__int128 v127 = 0LL;
  *((void *)&v127 + 1) = v41;
  *((void *)&v126 + 1) = 0LL;
  LODWORD(v129) = -1;
  closure_node_add(v41, (uint64_t)&v128, v42, v43, v44, v45, v46, v47);
  Img4DecodePerformManifestTrustEvaluationWithCallbacks(v9 + 72, (uint64_t)&v123, v126, (uint64_t)v24);
  if ((_DWORD)v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = posixdr(v48);
    expert_log( *(void *)(a1 + 16),  0LL,  (uint64_t)"Img4DecodePerformManifestTrustEvaluation: %d",  v51,  v52,  v53,  v54,  v55,  v49);
    goto LABEL_67;
  }

  uint64_t v61 = Img4DecodeIterateObjectItems( (unint64_t *)(v9 + 72),  (unsigned int *)&v125 + 2,  (uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))&v123,  (uint64_t)v24);
  if ((_DWORD)v61)
  {
    uint64_t v62 = v61;
    uint64_t v50 = posixdr(v61);
    expert_log(*(void *)(a1 + 16), 0LL, (uint64_t)"Img4DecodeIterateObjectItems: %d", v63, v64, v65, v66, v67, v62);
    goto LABEL_67;
  }

  for (uint64_t i = v128; i; uint64_t i = *(void *)i)
  {
    __int128 v115 = *(_OWORD *)(i + 40);
    uint64_t v116 = *(void *)(i + 56);
    unint64_t v69 = v127;
    if ((void)v127)
    {
      uint64_t v70 = *((void *)&v126 + 1);
      if (!*((void *)&v126 + 1)) {
        goto LABEL_33;
      }
    }

    else
    {
      unint64_t v69 = *(void *)(a1 + 40);
      uint64_t v70 = *(void *)(a1 + 48);
      if (!v70)
      {
LABEL_33:
        expert_log( *(void *)(*(void *)(i + 8) + 16LL),  2uLL,  (uint64_t)"%s: tag not in unique list",  a4,  a5,  a6,  a7,  a8,  i + 28);
LABEL_34:
        __int128 v73 = 0LL;
        goto LABEL_35;
      }
    }

    unint64_t v71 = v69 + 4 * v70;
    unint64_t v72 = v69;
    while (1)
    {
      if (v72 && (v72 >= v71 || v72 < v69)) {
        goto LABEL_81;
      }
      v72 += 4LL;
      if (!--v70) {
        goto LABEL_33;
      }
    }

    expert_log( *(void *)(*(void *)(i + 8) + 16LL),  2uLL,  (uint64_t)"%s: found unique tag",  a4,  a5,  a6,  a7,  a8,  i + 28);
    if (!v72) {
      goto LABEL_34;
    }
    if (v72 >= v71 || v72 < v69)
    {
LABEL_81:
      __break(0x5519u);
      goto LABEL_82;
    }

    uint64_t v116 = 5LL;
    __int128 v73 = (uint64_t *)&v115;
LABEL_35:
    int v74 = closure_node_encode_property(i, v73);
    if (v74)
    {
      switch(v74)
      {
        case 1:
          uint64_t v50 = 22LL;
          break;
        case 2:
          uint64_t v50 = 12LL;
          break;
        case 3:
          uint64_t v50 = 104LL;
          break;
        default:
          uint64_t v50 = 14LL;
          break;
      }

      expert_log( *(void *)(*(void *)(i + 8) + 16LL),  0LL,  (uint64_t)"%s: failed to encode property node: %d",  a4,  a5,  a6,  a7,  a8,  i + 28);
      goto LABEL_67;
    }
  }

  Single = (void **)DEREncoderCreateSingle(0LL);
  v122 = Single;
  if (Single)
  {
    uint64_t v81 = (uint64_t *)Single;
    uint64_t v82 = &v128;
    while (1)
    {
      uint64_t v82 = *(__int128 **)v82;
      if (!v82) {
        break;
      }
      int v83 = closure_node_encode_item((uint64_t)v82, v81);
      if (v83)
      {
        switch(v83)
        {
          case 1:
            uint64_t v50 = 22LL;
            break;
          case 2:
            uint64_t v50 = 12LL;
            break;
          case 3:
            uint64_t v50 = 104LL;
            break;
          default:
            uint64_t v50 = 14LL;
            break;
        }

        expert_log( *(void *)(*((void *)v82 + 1) + 16LL),  0LL,  (uint64_t)"%s: failed to encode item node: %d",  v84,  v85,  v86,  v87,  v88,  (uint64_t)v82 + 28);
        goto LABEL_67;
      }
    }

    uint64_t Image4Dictionary = DEREncoderCreateImage4Dictionary("MANB", (uint64_t **)v81, (uint64_t **)&v121);
    uint64_t v50 = 22LL;
    switch((int)Image4Dictionary)
    {
      case 0:
        uint64_t v50 = 22LL;
        switch(_closure_create_image4_manifest(a1, v121, &v120))
        {
          case 0u:
            uint64_t v95 = DEREncoderCreateEncodedBuffer(v120, &v119, &v118);
            uint64_t v50 = 22LL;
            switch((int)v95)
            {
              case 0:
                uint64_t v117 = v119;
                uint64_t v50 = 0LL;
                *a3 = buff_init_xfer(a2, &v117, v118, (uint64_t)&_buff_destructor_free, 0LL);
                goto LABEL_67;
              case 1:
                goto LABEL_80;
              case 2:
                uint64_t v50 = 12LL;
                goto LABEL_80;
              case 3:
                uint64_t v50 = 104LL;
                goto LABEL_80;
              default:
                uint64_t v50 = 14LL;
LABEL_80:
                expert_log( *(void *)(a1 + 16),  0LL,  (uint64_t)"DEREncoderCreateEncodedBuffer: %d",  v96,  v97,  v98,  v99,  v100,  v95);
                break;
            }

            break;
          case 1u:
            goto LABEL_67;
          case 2u:
            uint64_t v50 = 12LL;
            break;
          case 3u:
            uint64_t v50 = 104LL;
            break;
          default:
            uint64_t v50 = 14LL;
            break;
        }

        break;
      case 1:
        goto LABEL_73;
      case 2:
        uint64_t v50 = 12LL;
        goto LABEL_73;
      case 3:
        uint64_t v50 = 104LL;
        goto LABEL_73;
      default:
        uint64_t v50 = 14LL;
LABEL_73:
        expert_log( *(void *)(a1 + 16),  0LL,  (uint64_t)"DEREncoderCreateImage4Dictionary: %d",  v90,  v91,  v92,  v93,  v94,  Image4Dictionary);
        break;
    }
  }

  else
  {
    uint64_t v50 = 12LL;
    expert_log( *(void *)(a1 + 16),  0LL,  (uint64_t)"failed to allocate item sequence encoder: %d",  v76,  v77,  v78,  v79,  v80,  12LL);
  }

LABEL_67:
  _expert_dealloc_type(v8, (uint64_t)&_image4_type_decode_context, v130);
  closure_node_list_destroy(a1, (uint64_t *)&v128, v101, v102, v103, v104, v105, v106);
LABEL_68:
  DEREncoderDestroyAndZero(&v122);
  DEREncoderDestroyAndZero(&v121);
  DEREncoderDestroyAndZero(&v120);
  return v50;
}

uint64_t _closure_manifest_property_callback(unsigned int a1, uint64_t *a2, int a3, uint64_t a4)
{
  int v58 = 0;
  uint64_t v57 = 0LL;
  int v56 = 0;
  uint64_t v55 = 0LL;
  uint64_t v7 = *(void *)(a4 + 40);
  unint64_t v8 = *(void *)v7;
  fourcc_init((uint64_t)&v57, a1);
  if (a3 == 1) {
    fourcc_init((uint64_t)&v55, *(_DWORD *)(v7 + 8));
  }
  unint64_t v14 = v8 + 64;
  uint64_t result = expert_log( *(void *)(v8 + 16),  2uLL,  (uint64_t)"recording property for closure computation: %s%s%s",  v9,  v10,  v11,  v12,  v13,  (uint64_t)&v55 + 4);
  if (*(_DWORD *)(v8 + 24) == a1)
  {
    if (v8 >= v14) {
      goto LABEL_33;
    }
    unsigned int v62 = 0;
    uint64_t v61 = 0LL;
    uint64_t PropertyData = Img4DecodeGetPropertyData(a2, a1, &v61, &v62);
    if ((_DWORD)PropertyData)
    {
      expert_log( *(void *)(v8 + 16),  0LL,  (uint64_t)"Img4DecodeGetPropertyData: %d",  v17,  v18,  v19,  v20,  v21,  PropertyData);
      int v22 = 96;
LABEL_31:
      *(_DWORD *)(v7 + 64) = v22;
      return 0xFFFFFFFFLL;
    }

    unint64_t v23 = v62;
    if ((v62 & 3) != 0)
    {
      expert_log( *(void *)(v8 + 16),  0LL,  (uint64_t)"invalid unique tag list: actual length = %u, expected %% %lu == 0",  v17,  v18,  v19,  v20,  v21,  v62);
      int v22 = 94;
      goto LABEL_31;
    }

    uint64_t v54 = a2;
    unint64_t v24 = (unint64_t)v62 >> 2;
    uint64_t result = expert_log( *(void *)(v8 + 16),  1uLL,  (uint64_t)"found unique tag list: cnt = %u",  v17,  v18,  v19,  v20,  v21,  v24);
    uint64_t v25 = v61;
    *(void *)(v7 + 24) = v24;
    *(void *)(v7 + 32) = v25;
    *(void *)(v8 + 56) = _unique_entry_get_tag_swapped;
    if (v23 >= 4)
    {
      uint64_t v26 = 0LL;
      uint64_t v27 = 0LL;
      if (v24 <= 1) {
        uint64_t v28 = 1LL;
      }
      else {
        uint64_t v28 = v23 >> 2;
      }
      do
      {
        unint64_t v29 = *(void *)(v7 + 32);
        unint64_t v30 = v29 + 4LL * *(void *)(v7 + 24);
        int v60 = 0;
        uint64_t v59 = 0LL;
        if (v29 > v29 + v26 || v29 + v26 + 4 > v30) {
          goto LABEL_33;
        }
        fourcc_init((uint64_t)&v59, bswap32(*(_DWORD *)(v29 + 4 * v27)));
        uint64_t result = expert_log( *(void *)(v8 + 16),  2uLL,  (uint64_t)"unique tag entry[%zu] = %s",  v32,  v33,  v34,  v35,  v36,  v27++);
        v26 += 4LL;
      }

      while (v28 != v27);
    }

    a2 = v54;
  }

  if (*(_DWORD *)(v7 + 8) != *(_DWORD *)(v7 + 12))
  {
    if (v8 >= v14)
    {
LABEL_33:
      __break(0x5519u);
      return result;
    }

    uint64_t v37 = (void *)closure_node_new_item(v8, (unsigned int *)&v55);
    if (!v37)
    {
      int v22 = 12;
      goto LABEL_31;
    }

    uint64_t v44 = v37;
    uint64_t result = closure_node_add(v37, v7 + 48, v38, v39, v40, v41, v42, v43);
    *(_DWORD *)(v7 + 12) = *(_DWORD *)(v7 + 8);
    *(void *)(v7 + 40) = v44;
  }

  if (v8 >= v14) {
    goto LABEL_33;
  }
  uint64_t v45 = closure_node_new(*(void *)(v7 + 40), v8, (unsigned int *)&v57, (uint64_t)a2);
  if (!v45)
  {
    *(_DWORD *)(v7 + 64) = 12;
    expert_log(*(void *)(v8 + 16), 0LL, (uint64_t)"failed to allocate closure node", v47, v48, v49, v50, v51, v53);
    return 0xFFFFFFFFLL;
  }

  uint64_t v52 = v45;
  if (!a3) {
    manifest_property_callback(*(uint64_t **)v8, 0LL, a1, a2, v48, v49, v50, v51, v53);
  }
  closure_node_add(v52, v7 + 48, v46, v47, v48, v49, v50, v51);
  return 0LL;
}

uint64_t _closure_create_image4_manifest(uint64_t a1, uint64_t **a2, void *a3)
{
  uint64_t v50 = 0LL;
  Single = (void **)DEREncoderCreateSingle(0LL);
  uint64_t v51 = Single;
  if (Single)
  {
    uint64_t v12 = (uint64_t *)Single;
    uint64_t v13 = DEREncoderAddImage4Tag((uint64_t *)Single, "IM4M");
    if ((_DWORD)v13)
    {
      uint64_t v19 = v13;
      expert_log(*(void *)(a1 + 16), 0LL, (uint64_t)"DEREncoderAddImage4Tag: IM4M: %d", v14, v15, v16, v17, v18, v13);
LABEL_7:
      uint64_t v21 = v19;
      goto LABEL_8;
    }

    uint64_t v22 = DEREncoderAddUInt(v12, 0LL);
    if ((_DWORD)v22)
    {
      uint64_t v19 = v22;
      expert_log( *(void *)(a1 + 16),  0LL,  (uint64_t)"DEREncoderAddUInt: manifest version: %d",  v23,  v24,  v25,  v26,  v27,  v22);
      goto LABEL_7;
    }

    uint64_t v29 = DEREncoderAddSetFromEncoder(a2, v12);
    if ((_DWORD)v29)
    {
      uint64_t v35 = v29;
      expert_log(*(void *)(a1 + 16), 0LL, (uint64_t)"DEREncoderAddSetFromEncoder: %d", v30, v31, v32, v33, v34, v29);
      uint64_t v21 = v35;
    }

    else
    {
      uint64_t v36 = (void **)DEREncoderCreateSingle(v29);
      uint64_t v50 = v36;
      if (v36)
      {
        uint64_t v42 = v36;
        uint64_t v43 = DEREncoderAddSequenceFromEncoder((uint64_t **)v12, (uint64_t *)v36);
        if ((_DWORD)v43)
        {
          uint64_t v49 = v43;
          expert_log( *(void *)(a1 + 16),  0LL,  (uint64_t)"DEREncoderAddSequenceFromEncoder: %d",  v44,  v45,  v46,  v47,  v48,  v43);
          uint64_t v21 = v49;
        }

        else
        {
          uint64_t v21 = 0LL;
          *a3 = v42;
          uint64_t v50 = 0LL;
        }
      }

      else
      {
        expert_log(*(void *)(a1 + 16), 0LL, (uint64_t)"DEREncoderCreate: %d", v37, v38, v39, v40, v41, 0LL);
        uint64_t v21 = 0LL;
      }
    }
  }

  else
  {
    uint64_t v20 = *(void *)(a1 + 16);
    uint64_t v21 = 2LL;
    expert_log(v20, 0LL, (uint64_t)"DEREncoderCreate: %d", v7, v8, v9, v10, v11, 2LL);
  }

LABEL_8:
  DEREncoderDestroyAndZero(&v51);
  DEREncoderDestroyAndZero(&v50);
  return v21;
}

  if ((_DWORD)v23 == 31 && *(_BYTE *)(a1 + 441)) {
    return 70LL;
  }
  return v23;
}

  DEREncoderDestroy(v7);
  return v8;
}

uint64_t _unique_entry_get_tag_swapped(unsigned int *a1)
{
  return bswap32(*a1);
}

uint64_t __handle_absence_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 0;
  return 0LL;
}

uint64_t img4_nonce_domain_get_from_handle(unsigned int a1)
{
  if (a1 > 4) {
    return 0LL;
  }
  else {
    return _cryptex1_domains[a1];
  }
}

uint64_t chip_expert(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

uint64_t chip_expert_instance(uint64_t a1)
{
  return **(void **)(*(void *)(a1 + 112) + 16LL);
}

uint64_t _chip_expert_boot()
{
  return 78LL;
}

uint64_t _chip_expert_get_digest_info(uint64_t a1)
{
  return (*(uint64_t (**)(void))(***(void ***)(a1 + 16) + 48LL))();
}

uint64_t _chip_expert_get_secure_boot(uint64_t a1, void *a2)
{
  *a2 = *(void *)(***(void ***)(a1 + 16) + 24LL);
  return 0LL;
}

uint64_t _chip_expert_query_chip(uint64_t a1)
{
  return ***(void ***)(a1 + 16);
}

uint64_t _chip_expert_query_chip_boot()
{
  return 45LL;
}

uint64_t _chip_expert_query_nonce()
{
  return 78LL;
}

uint64_t _chip_expert_entangle_nonce()
{
  return 78LL;
}

uint64_t _chip_expert_read_boot_manifest()
{
  return 78LL;
}

uint64_t _chip_expert_query_trust_store()
{
  return 78LL;
}

uint64_t _chip_expert_read_storage()
{
  return 78LL;
}

uint64_t _chip_expert_write_storage()
{
  return 78LL;
}

uint64_t _chip_expert_sync_storage()
{
  return 78LL;
}

uint64_t _chip_expert_query_property_BOOL( uint64_t a1, uint64_t a2, char **a3, BOOL *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 == &_property_iuob) {
    return expert_compute_eieiou_BOOL(a1, a2, a4);
  }
  uint64_t v10 = **(_BYTE ***)(a1 + 16);
  chip_instance_get_BOOL(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0LL;
}

uint64_t _chip_expert_query_property_uint32( uint64_t a1, uint64_t a2, void *a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = **(_DWORD ***)(a1 + 16);
  chip_instance_get_uint32(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0LL;
}

uint64_t _chip_expert_query_property_uint64( uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = **(void ***)(a1 + 16);
  chip_instance_get_uint64(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0LL;
}

uint64_t _chip_expert_query_property_digest( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10 = **(void **)(a1 + 16);
  chip_instance_get_digest(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0LL;
}

uint64_t _chip_expert_query_property_version( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10 = **(void **)(a1 + 16);
  chip_instance_get_version(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0LL;
}

uint64_t _chip_expert_boot_once()
{
  return 0LL;
}

void _chip_expert_read_random( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __panic_npx_5( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  unint64_t v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: should never be called", &a9);
  _os_crash();
  __break(1u);
}

void _chip_expert_syscall( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

const char *__select_cryptex1_mobile_asset_ap()
{
  return "am1c";
}

uint64_t *closure_node_list_destroy( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = (uint64_t *)*a2;
  uint64_t v18 = (uint64_t)result;
  if (result)
  {
    do
    {
      uint64_t v10 = *result;
      closure_node_remove(result, a2, a3, a4, a5, a6, a7, a8);
      closure_node_destroy(&v18, v11, v12, v13, v14, v15, v16, v17);
      uint64_t v18 = v10;
      uint64_t result = (uint64_t *)v10;
    }

    while (v10);
  }

  return result;
}

uint64_t closure_node_remove( uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = expert_log(*(void *)(a1[1] + 16), 2uLL, (uint64_t)"%s: removing node", a4, a5, a6, a7, a8, (uint64_t)a1 + 28);
  uint64_t v11 = (uint64_t *)*a2;
  if ((uint64_t *)*a2 == a1)
  {
    uint64_t v14 = *a1;
    *a2 = *a1;
    uint64_t v12 = a2;
    if (v14) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  do
  {
    uint64_t v12 = v11;
    uint64_t v11 = (uint64_t *)*v11;
  }

  while (v11 != a1);
  uint64_t v13 = *a1;
  *uint64_t v12 = *a1;
  if (!v13) {
LABEL_4:
  }
    a2[1] = (uint64_t)v12;
LABEL_5:
  *a1 = 0LL;
  return result;
}

uint64_t *closure_node_destroy( uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *result;
  uint64_t v12 = v8;
  if (v8)
  {
    if (*(void *)v8) {
      __panic_npx("panic: closure node deallocated while still in list", a2, a3, a4, a5, a6, a7, a8, v11);
    }
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(*(void *)(v8 + 8) + 16LL);
    DEREncoderDestroyAndZero((void ***)(v8 + 64));
    uint64_t result = (uint64_t *)_expert_dealloc_type(v10, (uint64_t)&_image4_type_closure_node, &v12);
    *uint64_t v9 = 0LL;
  }

  return result;
}

void *closure_node_new(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  uint64_t v8 = (void *)_expert_alloc_type(*(void *)(a2 + 16), (uint64_t)&_image4_type_closure_node);
  uint64_t v14 = v8;
  if (v8)
  {
    *uint64_t v8 = 0LL;
    v8[1] = a2;
    v8[2] = a1;
    fourcc_copy((uint64_t)(v8 + 3), a3);
    uint64_t v15 = *(void *)(a4 + 16);
    *(_OWORD *)(v14 + 5) = *(_OWORD *)a4;
    v14[7] = v15;
    v14[8] = 0LL;
  }

  else
  {
    expert_log(*(void *)(a2 + 16), 0LL, (uint64_t)"failed to allocate node", v9, v10, v11, v12, v13, v17);
  }

  return v14;
}

uint64_t closure_node_new_item(uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v16 = 0LL;
  uint64_t v5 = _expert_alloc_type(v4, (uint64_t)&_image4_type_closure_node);
  uint64_t v17 = v5;
  if (!v5)
  {
    uint64_t v14 = "failed to allocate item node";
LABEL_6:
    expert_log(*(void *)(a1 + 16), 0LL, (uint64_t)v14, v6, v7, v8, v9, v10, (uint64_t)v16);
    _expert_dealloc_type(v4, (uint64_t)&_image4_type_closure_node, &v17);
    DEREncoderDestroyAndZero(&v16);
    return v17;
  }

  uint64_t v11 = (void *)v5;
  Single = (void **)DEREncoderCreateSingle(1LL);
  uint64_t v16 = Single;
  if (!Single)
  {
    uint64_t v14 = "failed to allocate DER encoder";
    goto LABEL_6;
  }

  uint64_t v13 = Single;
  v11[1] = a1;
  v11[2] = 0LL;
  fourcc_copy((uint64_t)(v11 + 3), a2);
  v11[5] = 0LL;
  v11[6] = 0LL;
  v11[7] = 0LL;
  v11[8] = v13;
  return (uint64_t)v11;
}

uint64_t closure_node_add( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a1[2])
  {
    *(void *)&__int128 v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v17[14] = v10;
    v17[15] = v10;
    v17[12] = v10;
    v17[13] = v10;
    v17[10] = v10;
    v17[11] = v10;
    v17[8] = v10;
    v17[9] = v10;
    v17[6] = v10;
    v17[7] = v10;
    v17[4] = v10;
    v17[5] = v10;
    _DWORD v17[2] = v10;
    _OWORD v17[3] = v10;
    v17[0] = v10;
    v17[1] = v10;
    _closure_node_get_value_string((uint64_t)a1, 0LL, (char *)v17, a4, a5, a6, a7, a8);
    uint64_t result = expert_log( *(void *)(a1[1] + 16LL),  2uLL,  (uint64_t)"%s: inserting node: %s",  v11,  v12,  v13,  v14,  v15,  (uint64_t)a1 + 28);
  }

  else
  {
    uint64_t result = expert_log( *(void *)(a1[1] + 16LL),  2uLL,  (uint64_t)"%s: inserting item node",  a4,  a5,  a6,  a7,  a8,  (uint64_t)a1 + 28);
  }

  *a1 = 0LL;
  **(void **)(a2 + 8) = a1;
  *(void *)(a2 + 8) = a1;
  return result;
}

char *_closure_node_get_value_string( uint64_t a1, uint64_t *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v30[13] = *MEMORY[0x1895F89C0];
  uint64_t v9 = *(unsigned int *)(a1 + 24);
  *(_OWORD *)uint64_t v30 = xmmword_1894E7950;
  memset(&v30[2], 170, 88);
  unsigned int __n = 0;
  *(void *)uint64_t v27 = 0LL;
  memset(&__n_4[1], 0, 64);
  if (a2) {
    __int128 v10 = a2;
  }
  else {
    __int128 v10 = (uint64_t *)(a1 + 40);
  }
  uint64_t v11 = v10[2];
  __n_4[0] = 0uLL;
  switch(v11)
  {
    case 1LL:
      else {
        snprintf(a3, 0x100uLL, "%d");
      }
      break;
    case 2LL:
      else {
        snprintf(a3, 0x100uLL, "0x%llx");
      }
      break;
    case 4LL:
      if (Img4DecodeGetPropertyData(v10, v9, v27, &__n))
      {
        snprintf(a3, 0x100uLL, "[error decoding data %d]");
      }

      else if (__n < 0x41)
      {
        digest_init((uint64_t)__n_4, *(const void **)v27, __n, v13, v14, v15, v16, v17);
        digest_print_cstr((unint64_t)__n_4, (unint64_t)a3, v21, v22, v23, v24, v25, v26);
      }

      else
      {
        snprintf(a3, 0x100uLL, "<data: %u bytes>");
      }

      break;
    case 5LL:
      strcpy(a3, "<null>");
      break;
    default:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v9, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"i4p->type");
  }

  uint64_t v18 = 0LL;
  do
  {
    if (v18 == 256) {
      __break(0x5519u);
    }
  }

  while (a3[v18++]);
  return a3;
}

uint64_t closure_node_encode_property(uint64_t a1, uint64_t *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t cstring = fourcc_get_cstring(a1 + 24);
  if (!*(void *)(a1 + 16)) {
    return 0LL;
  }
  __int128 v10 = (char *)cstring;
  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[14] = v11;
  v19[15] = v11;
  v19[12] = v11;
  v19[13] = v11;
  v19[10] = v11;
  v19[11] = v11;
  v19[8] = v11;
  v19[9] = v11;
  v19[6] = v11;
  v19[7] = v11;
  v19[4] = v11;
  _OWORD v19[5] = v11;
  v19[2] = v11;
  void v19[3] = v11;
  if (!a2) {
    a2 = (uint64_t *)(a1 + 40);
  }
  v19[0] = v11;
  v19[1] = v11;
  _closure_node_get_value_string(a1, a2, (char *)v19, v5, v6, v7, v8, v9);
  uint64_t v12 = *(uint64_t **)(*(void *)(a1 + 16) + 64LL);
  expert_log( *(void *)(*(void *)(a1 + 8) + 16LL),  2uLL,  (uint64_t)"%s: encoding closure property: p = %s, item = %s, type = %llx, val = %s",  v13,  v14,  v15,  v16,  v17,  a1 + 28);
  return DEREncoderAddImage4Property(v12, v10, a2);
}

size_t closure_node_encode_item(uint64_t a1, uint64_t *a2)
{
  uint64_t cstring = fourcc_get_cstring(a1 + 24);
  if (*(void *)(a1 + 16)) {
    return 0LL;
  }
  __int128 v11 = (char *)cstring;
  expert_log( *(void *)(*(void *)(a1 + 8) + 16LL),  2uLL,  (uint64_t)"%s: encoding closure item: %s",  v5,  v6,  v7,  v8,  v9,  a1 + 28);
  return DEREncoderEncodeImage4Dictionary(a2, v11, *(uint64_t ***)(a1 + 64));
}

uint64_t odometer_policy_get_chip_property(uint64_t result, unint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2 < 0) {
    return 0LL;
  }
  unint64_t v3 = a2 + v2;
  if (v3 < a2 + 264 && v3 >= a2) {
    return *(void *)v3;
  }
  __break(0x5519u);
  return result;
}

uint64_t odometer_policy_enforceable(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t odometer_policy_enforce( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    if (v10 == 2)
    {
      if (*(_BYTE *)(a2 + 440) && *(_BYTE *)(a2 + 968))
      {
        uint64_t v11 = *(void *)a2;
        uint64_t name = chip_get_name(*(void *)(a2 + 16));
        uint64_t v17 = "odometer[%s:%s]: manifest has mix-n-match entitlement and environment allows mix-n-match; relaxing chain integrity policy";
        goto LABEL_11;
      }

      if (expert_query_chip_boot(*(void *)a2, *(void *)(a2 + 16)))
      {
        uint64_t v11 = *(void *)a2;
        uint64_t name = chip_get_name(*(void *)(a2 + 16));
        uint64_t v17 = "odometer[%s:%s]: expert does not boot chip; relaxing chain integrity policy";
        goto LABEL_11;
      }
    }

    else
    {
      if (v10 != 1) {
        __panic_npx_3(a1, a2, a3, a4, a5, a6, a7, a8, (char)"odp->odp_type");
      }
      if (odometer_check_fuse(a2, (uint64_t)&_odometer_cylinder_mixn_match, a3, a4, a5, a6, a7, a8))
      {
        uint64_t v11 = *(void *)a2;
        uint64_t name = chip_get_name(*(void *)(a2 + 16));
        uint64_t v17 = "odometer[%s:%s]: environment allows mix-n-match; relaxing chain integrity policy";
LABEL_11:
        uint64_t v18 = v11;
LABEL_20:
        expert_log(v18, 1uLL, (uint64_t)v17, v12, v13, v14, v15, v16, name);
        return 0LL;
      }
    }
  }

  if (*(_BYTE *)(a2 + 441))
  {
    if ((odometer_check_fuse(a2, (uint64_t)&_odometer_cylinder_mixn_match, a3, a4, a5, a6, a7, a8) & 1) != 0)
    {
      uint64_t v19 = "odometer[%s:%s]: environment allows mix-n-match; relaxing all odometer policy";
LABEL_19:
      uint64_t v21 = *(void *)a2;
      uint64_t name = chip_get_name(*(void *)(a2 + 16));
      uint64_t v18 = v21;
      uint64_t v17 = v19;
      goto LABEL_20;
    }

    if (*(_BYTE *)(a2 + 442) && *(_BYTE *)(a2 + 440))
    {
      uint64_t v19 = "odometer[%s:%s]: manifest self-entitled for mix-n-match; relaxing all odometer policy";
      goto LABEL_19;
    }

    uint64_t v20 = "odometer[%s:%s]: enforcing strict mix-n-match behavior";
  }

  else
  {
    uint64_t v20 = "odometer[%s:%s]: mix-n-match god mode not set; enforcing strict mix-n-match behavior";
  }

  uint64_t v23 = *(void *)a2;
  uint64_t v24 = chip_get_name(*(void *)(a2 + 16));
  expert_log(v23, 1uLL, (uint64_t)v20, v25, v26, v27, v28, v29, v24);
  return (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 40))(a1, a2);
}

void _buff_destructor_panic_call( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _buff_destructor_static_call( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _buff_destructor_free_prepare(void *a1, rsize_t __n)
{
  uint64_t result = memset_s(a1, __n, 0, __n);
  if ((_DWORD)result) {
    __panic_npx("panic: memset_s: %d", v3, v4, v5, v6, v7, v8, v9, result);
  }
  return result;
}

void *buff_init_xfer(void *result, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a2;
  *a2 = 0LL;
  *uint64_t result = v5;
  result[1] = a3;
  result[2] = a4;
  result[4] = a5;
  *a2 = *(void *)(a4 + 8);
  return result;
}

void *buff_init_wrap(void *result, uint64_t a2, uint64_t a3)
{
  *uint64_t result = a2;
  result[1] = a3;
  result[2] = &_buff_destructor_wrap;
  result[4] = 0LL;
  return result;
}

void *buff_init_alias(void *result, void *a2)
{
  *uint64_t result = *a2;
  result[1] = a2[1];
  result[2] = &_buff_destructor_null;
  result[4] = 0LL;
  return result;
}

void *buff_init_xfer_signed( void *result, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 < 0) {
    __panic_npx( "panic: integer cast underflow: v = %s, actual = %lld, expected >= 0",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"len");
  }
  uint64_t v8 = *a2;
  *a2 = 0LL;
  *uint64_t result = v8;
  result[1] = a3;
  result[2] = a4;
  result[4] = a5;
  *a2 = *(void *)(a4 + 8);
  return result;
}

uint64_t *buff_init_wrap_signed( uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 < 0) {
    __panic_npx( "panic: integer cast underflow: v = %s, actual = %lld, expected >= 0",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"len");
  }
  *uint64_t result = a2;
  result[1] = a3;
  result[2] = (uint64_t)&_buff_destructor_wrap;
  result[4] = 0LL;
  return result;
}

void *buff_xfer(void *result, uint64_t **a2)
{
  uint64_t v2 = *a2;
  if (*a2) {
    BOOL v3 = v2 >= *a2 + 1;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    __break(0x5519u);
  }

  else
  {
    uint64_t v5 = v2[1];
    uint64_t v4 = v2[2];
    uint64_t v6 = v2[4];
    uint64_t v7 = *v2;
    *uint64_t v2 = 0LL;
    *uint64_t result = v7;
    result[1] = v5;
    result[2] = v4;
    result[4] = v6;
    *uint64_t v2 = *(void *)(v4 + 8);
    v2[2] = 0LL;
    *a2 = 0LL;
  }

  return result;
}

void *buff_borrow(void *result, void *a2)
{
  *uint64_t result = *a2;
  result[2] = &_buff_destructor_loanee;
  uint64_t v2 = a2[2];
  result[1] = a2[1];
  a2[2] = &_buff_destructor_loan;
  a2[3] = v2;
  return result;
}

uint64_t buff_return(uint64_t result, void **a2)
{
  uint64_t v2 = *a2;
  *(void *)(result + 16) = *(void *)(result + 24);
  *(void *)(result + 24) = 0LL;
  *uint64_t v2 = 0LL;
  v2[1] = 0LL;
  v2[2] = &_buff_destructor_null;
  *a2 = 0LL;
  return result;
}

unint64_t buff_lockdown(unint64_t **a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  unint64_t result = **a1;
  if (result > result + v4[1]
    || (unint64_t result = (*(uint64_t (**)(void))(v4[2] + 16))(), v4[2] = (unint64_t)&_buff_destructor_static, v4 >= v4 + 5))
  {
    __break(0x5519u);
  }

  else
  {
    __int128 v6 = *(_OWORD *)v4;
    __int128 v7 = *((_OWORD *)v4 + 1);
    *(void *)(a2 + 32) = v4[4];
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v7;
    *a1 = 0LL;
    return (unint64_t)v4;
  }

  return result;
}

void *buff_copy_out(void *result, void *__dst, size_t *a3)
{
  size_t v4 = *a3;
  size_t v5 = result[1];
  if (v4 < v5) {
    return 0LL;
  }
  __int128 v6 = __dst;
  __int128 v7 = result;
  if (*result <= *result + v5)
  {
    unint64_t result = memcpy(__dst, (const void *)*result, v5);
    size_t v8 = v7[1];
    if (v8 <= *a3)
    {
      *a3 = v8;
      if (v8) {
        return v6;
      }
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t buff_get_length_signed( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = *(void *)(a1 + 8);
  if (result < 0) {
    __panic_npx("panic: length not expressible as ssize_t: %lu", a2, a3, a4, a5, a6, a7, a8, result);
  }
  return result;
}

unint64_t buff_get_length_uint32( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t result = *(void *)(a1 + 8);
  if (HIDWORD(result)) {
    __panic_npx("panic: length not expressible as unsigned 32-bit integer: %lu", a2, a3, a4, a5, a6, a7, a8, result);
  }
  return result;
}

void *buff_destroy(void *result)
{
  unint64_t v1 = (void *)*result;
  if (*result)
  {
    if (v1 < v1 + 5)
    {
      uint64_t v2 = result;
      uint64_t v3 = v1[2];
      if (!v3)
      {
LABEL_6:
        *uint64_t v2 = 0LL;
        return result;
      }

      uint64_t v5 = *v1;
      uint64_t v4 = v1[1];
      if (*v1 <= (unint64_t)(*v1 + v4))
      {
        uint64_t v6 = v1[4];
        (*(void (**)(void, void, uint64_t))(v3 + 24))(*v1, v1[1], v6);
        unint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1[2] + 32LL))(v5, v4, v6);
        v1[2] = &_buff_destructor_panic;
        goto LABEL_6;
      }
    }

    __break(0x5519u);
  }

  return result;
}

void _buff_destructor_loanee_call( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _buff_destructor_loan_call( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: attempt to deallocate loaned buffer without returning", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void _restore_runtime_init( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void *_restore_runtime_alloc(uint64_t a1, int64_t a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int is_multithreaded = _dispatch_is_multithreaded();
  unint64_t result = calloc(1uLL, a2);
  if (is_multithreaded)
  {
    for (; !result; unint64_t result = calloc(1uLL, a2))
      __os_temporary_resource_shortage();
  }

  else
  {
    if (a2 <= 0 && result) {
LABEL_9:
    }
      __break(0x5519u);
    if (!result) {
      _darwin_runtime_alloc_cold_1(&v5, v6);
    }
  }

  if (a2 < 1) {
    goto LABEL_9;
  }
  return result;
}

void _restore_runtime_dealloc(int a1, void *a2)
{
}

void _restore_runtime_log( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_log_handle( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_get_identifier_BOOL( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_get_identifier_uint32( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_get_identifier_uint64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_get_identifier_digest( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_get_identifier_cstr( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _restore_runtime_execute_object(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return _darwin_runtime_execute_object(a1, a2, a3, a4);
}

uint64_t _restore_runtime_copy_object(uint64_t a1, uint64_t *a2, uint64_t a3, void *a4)
{
  return _darwin_runtime_copy_object(a1, a2, a3, a4);
}

void _restore_runtime_alloc_type( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_dealloc_type( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_set_nonce( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_roll_nonce( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _restore_runtime_copy_nonce( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __panic_npx_6( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  uint64_t v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: function should never be called: %s", &a9);
  _os_crash();
  __break(1u);
}

uint64_t __handle_absence_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 0;
  return 0LL;
}

uint64_t __fallback_to_sdk(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 244;
  return 0LL;
}

uint64_t _BootPolicyClosureComputeDigest_1( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(unint64_t ***)(*(void *)(a5 + 32) + 16LL);
  if (*v9 > a4) {
    __panic_npx_0((uint64_t)v9, a2, a1, a4, a5, a6, a7, a8, a4);
  }
  ccdigest();
  return 0LL;
}

uint64_t _BootPolicyClosureVerifyChain_1()
{
  return 0LL;
}

uint64_t _BootPolicyClosureVerifySignature_1()
{
  return 0LL;
}

uint64_t _BootPolicyClosureEvaluateCertificateProperties_1()
{
  return 0LL;
}

uint64_t img4_nonce_domain_copy_nonce(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v4 = generic_expert_specialist();
  __int128 v24 = 0u;
  memset(v27, 0, sizeof(v27));
  __int128 v26 = 0u;
  __int128 v25 = 0u;
  char v23 = 1;
  DWORD1(v24) = *(_DWORD *)(a1 + 8);
  memset(&v22[1], 0, 76);
  v22[0] = 1;
  *(_DWORD *)&v22[5] = DWORD1(v24);
  size_t v21 = 77LL;
  uint64_t result = dylib_expert_call_method(v4, 7uLL, &v23, 0x4DuLL, v22, &v21);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 45) {
      uint64_t v11 = 19LL;
    }
    else {
      uint64_t v11 = result;
    }
    uint64_t v12 = expert_log(v4, 0LL, (uint64_t)"img4_nonce_domain_copy_nonce: %d", v6, v7, v8, v9, v10, v11);
    return v11;
  }

  *(_WORD *)a2 = 0;
  int v20 = *(_DWORD *)&v22[73];
  if (*(_DWORD *)&v22[73] <= 0x30u)
  {
    memcpy((void *)(a2 + 2), &v22[9], *(unsigned int *)&v22[73]);
    uint64_t v11 = 0LL;
    *(_DWORD *)(a2 + 52) = v20;
    return v11;
  }

  __break(0x5519u);
  return result;
}

uint64_t img4_nonce_domain_roll_nonce(uint64_t a1)
{
  uint64_t v2 = generic_expert_specialist();
  char v24 = 1;
  int v3 = *(_DWORD *)(a1 + 8);
  int v25 = 0;
  int v26 = v3;
  char v21 = 1;
  int v22 = 0;
  int v23 = v3;
  size_t v20 = 9LL;
  unsigned int v4 = dylib_expert_call_method(v2, 9uLL, &v24, 9uLL, &v21, &v20);
  if (!v4) {
    return 0LL;
  }
  if (v4 == 45) {
    uint64_t v10 = 19LL;
  }
  else {
    uint64_t v10 = v4;
  }
  uint64_t v11 = expert_log(v2, 0LL, (uint64_t)"img4_nonce_domain_roll_nonce: %d", v5, v6, v7, v8, v9, v10);
  return v10;
}

uint64_t img4_nonce_domain_preroll_nonce(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  uint64_t v4 = generic_expert_specialist();
  __int128 v28 = 0u;
  uint64_t v34 = 0LL;
  __int128 v33 = 0u;
  __int128 v32 = 0u;
  __int128 v31 = 0u;
  __int128 v30 = 0u;
  __int128 v29 = 0u;
  char v27 = 1;
  HIDWORD(v28) = *(_DWORD *)(a1 + 8);
  __int128 v23 = 0u;
  uint64_t v26 = 0LL;
  __int128 v25 = 0u;
  memset(v24, 0, sizeof(v24));
  char v22 = 1;
  HIDWORD(v23) = HIDWORD(v28);
  size_t v21 = 105LL;
  uint64_t result = dylib_expert_call_method(v4, 0xBuLL, &v27, 0x69uLL, &v22, &v21);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 45) {
      uint64_t v11 = 19LL;
    }
    else {
      uint64_t v11 = result;
    }
    uint64_t v12 = expert_log(v4, 0LL, (uint64_t)"img4_nonce_domain_preroll_nonce: %d", v6, v7, v8, v9, v10, v11);
    return v11;
  }

  *(_WORD *)a2 = 0;
  int v20 = v25;
  if (v25 <= 0x30)
  {
    memcpy((void *)(a2 + 2), v24, v25);
    uint64_t v11 = 0LL;
    *(_DWORD *)(a2 + 52) = v20;
    return v11;
  }

  __break(0x5519u);
  return result;
}

uint64_t img4_nonce_domain_peek_nonce(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v4 = generic_expert_specialist();
  __int128 v24 = 0u;
  memset(v27, 0, sizeof(v27));
  __int128 v26 = 0u;
  __int128 v25 = 0u;
  char v23 = 1;
  DWORD1(v24) = *(_DWORD *)(a1 + 8);
  memset(&v22[1], 0, 76);
  v22[0] = 1;
  *(_DWORD *)&v22[5] = DWORD1(v24);
  size_t v21 = 77LL;
  uint64_t result = dylib_expert_call_method(v4, 8uLL, &v23, 0x4DuLL, v22, &v21);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 45) {
      uint64_t v11 = 19LL;
    }
    else {
      uint64_t v11 = result;
    }
    uint64_t v12 = expert_log(v4, 0LL, (uint64_t)"img4_nonce_domain_peek_nonce: %d", v6, v7, v8, v9, v10, v11);
    return v11;
  }

  *(_WORD *)a2 = 0;
  int v20 = *(_DWORD *)&v22[73];
  if (*(_DWORD *)&v22[73] <= 0x30u)
  {
    memcpy((void *)(a2 + 2), &v22[9], *(unsigned int *)&v22[73]);
    uint64_t v11 = 0LL;
    *(_DWORD *)(a2 + 52) = v20;
    return v11;
  }

  __break(0x5519u);
  return result;
}

char *image4_environment_get_firmware_chip(unsigned int a1, uint64_t a2)
{
  if (a1 > 0x7CF) {
    return 0LL;
  }
  uint64_t result = (char *)image4_environment_resolve(a2);
  if (result == "nupa" || result == 0LL) {
    return 0LL;
  }
  return result;
}

char **property_find_from_expert(char **result)
{
  unint64_t v1 = &__expert_properties[(void)result];
  __break(0x5519u);
  return result;
}

uint64_t property_find_entitlement( _DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v12 = xmmword_18A3B8058;
  uint64_t v13 = -1LL;
  do
  {
    uint64_t v9 = property_iterator_next((uint64_t)&v12, a2, a3, a4, a5, a6, a7, a8);
    unint64_t v10 = (unint64_t)v9;
    if (!v9) {
      return v10;
    }
    uint64_t result = _property_filter_expert((uint64_t)v9);
  }

  while ((_DWORD)result || *(_DWORD *)(v10 + 24) != *a1);
  if (v10 < v10 + 104) {
    return v10;
  }
  __break(0x5519u);
  return result;
}

uint64_t property_find_from_fourcc( _DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v13 = xmmword_1894E7A40;
  uint64_t v14 = -1LL;
  if ((_DWORD)a2 == 1)
  {
    uint64_t v9 = _property_filter_object;
  }

  else
  {
    if ((_DWORD)a2) {
      goto LABEL_6;
    }
    uint64_t v9 = _property_filter_manifest;
  }

  *(void *)&__int128 v13 = v9;
  while (1)
  {
LABEL_6:
    unint64_t v10 = property_iterator_next((uint64_t)&v13, a2, a3, a4, a5, a6, a7, a8);
    unint64_t v11 = (unint64_t)v10;
    if (!v10) {
      return v11;
    }
    uint64_t result = _property_filter_constraint((uint64_t)v10);
    if ((_DWORD)result)
    {
      uint64_t result = _property_filter_anti_replay(v11);
      if ((_DWORD)result) {
        continue;
      }
    }

    if (*(_DWORD *)(v11 + 24) == *a1) {
      break;
    }
  }

  if (v11 < v11 + 104) {
    return v11;
  }
  __break(0x5519u);
  return result;
}

BOOL property_equal(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a1 == a2 || *(void *)(a1 + 8) == a2 || *(void *)(a2 + 8) == a1) {
    return 1LL;
  }
  return *(_DWORD *)(a2 + 24) == *(_DWORD *)(a1 + 24);
}

BOOL property_equal_fourcc(BOOL result, int a2)
{
  if (result) {
    return *(_DWORD *)(result + 24) == a2;
  }
  return result;
}

BOOL property_imposable(uint64_t a1, uint64_t a2)
{
  digest = chip_get_digest(a2);
  if (digest
    && (digest == (char **)a1
     || *(char ***)(a1 + 8) == digest
     || digest[1] == (char *)a1
     || *((_DWORD *)digest + 6) == *(_DWORD *)(a1 + 24)))
  {
    return 1LL;
  }

  return chip_check_entitlement(a2, a1) != 0;
}

uint64_t property_constrain_BOOL( uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = *a3;
  unsigned int v9 = *a4;
  switch(**(void **)(a1 + 48))
  {
    case 0LL:
      uint64_t v10 = v8 != v9;
      if (v8 == v9) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 1LL:
      if (v8 < v9) {
        uint64_t v10 = 0LL;
      }
      else {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      if (!(_DWORD)v10) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 2LL:
      if (v8 <= v9) {
        uint64_t v10 = 0LL;
      }
      else {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      if (!(_DWORD)v10) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 3LL:
      uint64_t v10 = v8 <= v9;
      if (v8 <= v9) {
        goto LABEL_15;
      }
      goto LABEL_22;
    case 4LL:
      uint64_t v10 = v8 < v9;
      if (v8 >= v9) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 5LL:
      uint64_t v10 = v8 == v9;
      if (v8 != v9) {
        goto LABEL_22;
      }
LABEL_15:
      int v11 = *(_DWORD *)(a1 + 56);
      switch(v11)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_26;
        case 2:
        case 3:
          if (v11 != 2 && v11 != 3) {
            goto LABEL_29;
          }
LABEL_26:
          expert_log( a2,  0LL,  (uint64_t)"%s: enforcing[%s %s %s]: 0x%x %s 0x%x: %d",  (uint64_t)a4,  a5,  a6,  a7,  a8,  a1 + 28);
          return v10;
        default:
LABEL_29:
          uint64_t v14 = "p->p_container";
          goto LABEL_30;
      }

    case 6LL:
LABEL_22:
      int v12 = *(_DWORD *)(a1 + 56);
      switch(v12)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_27;
        case 2:
        case 3:
          if (v12 != 2 && v12 != 3) {
            goto LABEL_29;
          }
LABEL_27:
          expert_log( a2,  1uLL,  (uint64_t)"%s: enforcing[%s %s %s]: 0x%x %s 0x%x: success",  (uint64_t)a4,  a5,  a6,  a7,  a8,  a1 + 28);
          uint64_t v10 = 0LL;
          break;
        default:
          goto LABEL_29;
      }

      return v10;
    case 8LL:
      __panic_npx( "panic: property is not constrainable: %s",  a2,  (uint64_t)a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  *(void *)a1);
    default:
      uint64_t v14 = "p->p_constraint->pc_code";
LABEL_30:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)v14);
  }

uint64_t property_constrain_uint32( uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = *a3;
  unsigned int v9 = *a4;
  switch(**(void **)(a1 + 48))
  {
    case 0LL:
      uint64_t v10 = v8 != v9;
      if (v8 == v9) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 1LL:
      if (v8 < v9) {
        uint64_t v10 = 0LL;
      }
      else {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      if (!(_DWORD)v10) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 2LL:
      if (v8 <= v9) {
        uint64_t v10 = 0LL;
      }
      else {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      if (!(_DWORD)v10) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 3LL:
      uint64_t v10 = v8 <= v9;
      if (v8 <= v9) {
        goto LABEL_15;
      }
      goto LABEL_22;
    case 4LL:
      uint64_t v10 = v8 < v9;
      if (v8 >= v9) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 5LL:
      uint64_t v10 = v8 == v9;
      if (v8 != v9) {
        goto LABEL_22;
      }
LABEL_15:
      int v11 = *(_DWORD *)(a1 + 56);
      switch(v11)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_26;
        case 2:
        case 3:
          if (v11 != 2 && v11 != 3) {
            goto LABEL_29;
          }
LABEL_26:
          expert_log( a2,  0LL,  (uint64_t)"%s: enforcing[%s %s %s]: 0x%x %s 0x%x: %d",  (uint64_t)a4,  a5,  a6,  a7,  a8,  a1 + 28);
          return v10;
        default:
LABEL_29:
          uint64_t v14 = "p->p_container";
          goto LABEL_30;
      }

    case 6LL:
LABEL_22:
      int v12 = *(_DWORD *)(a1 + 56);
      switch(v12)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_27;
        case 2:
        case 3:
          if (v12 != 2 && v12 != 3) {
            goto LABEL_29;
          }
LABEL_27:
          expert_log( a2,  1uLL,  (uint64_t)"%s: enforcing[%s %s %s]: 0x%x %s 0x%x: success",  (uint64_t)a4,  a5,  a6,  a7,  a8,  a1 + 28);
          uint64_t v10 = 0LL;
          break;
        default:
          goto LABEL_29;
      }

      return v10;
    case 8LL:
      __panic_npx( "panic: property is not constrainable: %s",  a2,  (uint64_t)a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  *(void *)a1);
    default:
      uint64_t v14 = "p->p_constraint->pc_code";
LABEL_30:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)v14);
  }

uint64_t property_constrain_uint64( uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = *a3;
  unint64_t v9 = *a4;
  switch(**(void **)(a1 + 48))
  {
    case 0LL:
      uint64_t v10 = v8 != v9;
      if (v8 == v9) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 1LL:
      if (v8 < v9) {
        uint64_t v10 = 0LL;
      }
      else {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      if (!(_DWORD)v10) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 2LL:
      if (v8 <= v9) {
        uint64_t v10 = 0LL;
      }
      else {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
      if (!(_DWORD)v10) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 3LL:
      uint64_t v10 = v8 <= v9;
      if (v8 <= v9) {
        goto LABEL_15;
      }
      goto LABEL_22;
    case 4LL:
      uint64_t v10 = v8 < v9;
      if (v8 >= v9) {
        goto LABEL_22;
      }
      goto LABEL_15;
    case 5LL:
      uint64_t v10 = v8 == v9;
      if (v8 != v9) {
        goto LABEL_22;
      }
LABEL_15:
      int v11 = *(_DWORD *)(a1 + 56);
      switch(v11)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_26;
        case 2:
        case 3:
          if (v11 != 2 && v11 != 3) {
            goto LABEL_29;
          }
LABEL_26:
          expert_log( a2,  0LL,  (uint64_t)"%s: enforcing[%s %s %s]: 0x%llx %s 0x%llx: %d",  (uint64_t)a4,  a5,  a6,  a7,  a8,  a1 + 28);
          return v10;
        default:
LABEL_29:
          uint64_t v14 = "p->p_container";
          goto LABEL_30;
      }

    case 6LL:
LABEL_22:
      int v12 = *(_DWORD *)(a1 + 56);
      switch(v12)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_27;
        case 2:
        case 3:
          if (v12 != 2 && v12 != 3) {
            goto LABEL_29;
          }
LABEL_27:
          expert_log( a2,  1uLL,  (uint64_t)"%s: enforcing[%s %s %s]: 0x%llx %s 0x%llx: success",  (uint64_t)a4,  a5,  a6,  a7,  a8,  a1 + 28);
          uint64_t v10 = 0LL;
          break;
        default:
          goto LABEL_29;
      }

      return v10;
    case 8LL:
      __panic_npx( "panic: property is not constrainable: %s",  a2,  (uint64_t)a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  *(void *)a1);
    default:
      uint64_t v14 = "p->p_constraint->pc_code";
LABEL_30:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)v14);
  }

BOOL property_constrain_digest( uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  char v37 = 0;
  memset(v36, 0, sizeof(v36));
  char v35 = 0;
  memset(v34, 0, sizeof(v34));
  digest_print_cstr(a3, (unint64_t)v36, a3, a4, a5, a6, a7, a8);
  digest_print_cstr(a4, (unint64_t)v34, v12, v13, v14, v15, v16, v17);
  uint64_t v18 = digest_compare(a3, a4);
  BOOL v26 = 0LL;
  uint64_t v27 = *(void *)(a3 + 72);
  uint64_t v28 = *(void *)(a4 + 72);
  switch(**(void **)(a1 + 48))
  {
    case 0LL:
      BOOL v26 = v18;
      if (v27 != v28) {
        goto LABEL_3;
      }
      goto LABEL_8;
    case 1LL:
    case 2LL:
    case 3LL:
    case 4LL:
      __panic_npx( "panic: non-sensical property digest specification: %s",  v19,  v20,  v21,  v22,  v23,  v24,  v25,  *(void *)a1);
    case 5LL:
      BOOL v26 = (_DWORD)v18 == 0;
      if (v27 != v28) {
        goto LABEL_8;
      }
LABEL_3:
      int v29 = *(_DWORD *)(a1 + 56);
      switch(v29)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_12;
        case 2:
        case 3:
          if (v29 != 2 && v29 != 3) {
            goto LABEL_26;
          }
LABEL_12:
          expert_log( a2,  0LL,  (uint64_t)"%s: enforcing length[%s %s %s]: %lu %s %lu: %d",  v21,  v22,  v23,  v24,  v25,  a1 + 28);
          break;
        default:
          goto LABEL_26;
      }

LABEL_13:
      int v31 = *(_DWORD *)(a1 + 56);
      if (!v26)
      {
        switch(v31)
        {
          case 0:
          case 1:
          case 6:
            goto LABEL_23;
          case 2:
          case 3:
            if (v31 != 2 && v31 != 3) {
              goto LABEL_27;
            }
LABEL_23:
            expert_log( a2,  1uLL,  (uint64_t)"%s: enforcing[%s %s %s]: %s %s %s: success",  v21,  v22,  v23,  v24,  v25,  a1 + 28);
            return v26;
          default:
LABEL_27:
            __int128 v33 = "p->p_container";
            goto LABEL_30;
        }
      }

      switch(v31)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_22;
        case 2:
        case 3:
          if (v31 != 2 && v31 != 3) {
            goto LABEL_27;
          }
LABEL_22:
          expert_log(a2, 0LL, (uint64_t)"%s: enforcing[%s %s %s]: %s %s %s: %d", v21, v22, v23, v24, v25, a1 + 28);
          break;
        default:
          goto LABEL_27;
      }

      return v26;
    case 6LL:
LABEL_8:
      int v30 = *(_DWORD *)(a1 + 56);
      switch(v30)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_11;
        case 2:
        case 3:
          if (v30 != 2 && v30 != 3) {
            goto LABEL_26;
          }
LABEL_11:
          expert_log( a2,  1uLL,  (uint64_t)"%s: enforcing length[%s %s %s]: %lu %s %lu: success",  v21,  v22,  v23,  v24,  v25,  a1 + 28);
          goto LABEL_13;
        default:
LABEL_26:
          __int128 v33 = "p->p_container";
          goto LABEL_30;
      }

    case 8LL:
      __panic_npx("panic: property is not constrainable: %s", v19, v20, v21, v22, v23, v24, v25, *(void *)a1);
    default:
      __int128 v33 = "p->p_constraint->pc_code";
LABEL_30:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v19, v20, v21, v22, v23, v24, v25, (char)v33);
  }

    if (*(_BYTE *)(v3 + 17)) {
      uint64_t result = X509PolicySetFlagsForTestAnchor((void *)v3, a2);
    }
    goto LABEL_15;
  }

  if ((v4 & 0x1C00000000LL) == 0) {
    goto LABEL_15;
  }
  uint64_t result = compare_octet_string(a2 + 88, (uint64_t)&MFi4RootSpki);
  if ((_DWORD)result) {
    goto LABEL_13;
  }
  uint64_t v5 = *(void *)(a2 + 240) | 0x1C00000000LL;
LABEL_11:
  *(void *)(a2 + 240) = v5;
LABEL_15:
  if (*(_BYTE *)(v3 + 16))
  {
    if (*(_BYTE *)(v3 + 17))
    {
      uint64_t result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootCASPKI);
      if (!(_DWORD)result
        || (uint64_t result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG2SPKI), !(_DWORD)result)
        || (uint64_t result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG3SPKI), !(_DWORD)result))
      {
        *(void *)(a2 + 240) |= 0x58E30653FFF8uLL;
      }
    }

    if (*(_BYTE *)(v3 + 16) && *(_BYTE *)(v3 + 17))
    {
      uint64_t result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootECCSPKI);
      if (!(_DWORD)result) {
        *(void *)(a2 + 240) |= 0x6400000uLL;
      }
    }
  }

  return result;
}

  uint64_t v10 = 0LL;
LABEL_23:
  if (v10 == a2) {
    return 0LL;
  }
  else {
    return 589829LL;
  }
}

    __break(0x5519u);
  }

  return result;
}

  __break(0x5513u);
  return result;
}

uint64_t property_constrain_version( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(void **)(a1 + 48);
  int v11 = 0;
  unsigned int v12 = 1;
  switch(v9)
  {
    case 0LL:
      break;
    case 1LL:
      int v11 = 0;
      goto LABEL_4;
    case 2LL:
      int v11 = 1;
LABEL_4:
      unsigned int v12 = -1;
      uint64_t v9 = 2LL;
      break;
    case 3LL:
      int v11 = 0;
      uint64_t v9 = 1LL;
      unsigned int v12 = 1;
      break;
    case 4LL:
      unsigned int v12 = 1;
      int v11 = 1;
      uint64_t v9 = 1LL;
      break;
    case 5LL:
      int v11 = 0;
      unsigned int v12 = 1;
      uint64_t v9 = 3LL;
      break;
    case 6LL:
      unsigned int v12 = 0;
      int v11 = 0;
      uint64_t v9 = 0LL;
      break;
    default:
      __panic_npx("panic: illegal property definition: %s", a2, a3, a4, a5, a6, a7, a8, *(void *)a1);
  }

  uint64_t v13 = version_compare(a3, a4);
  if (v13) {
    int v21 = 0;
  }
  else {
    int v21 = v11;
  }
  if (v13 == v9) {
    int v21 = 1;
  }
  if (v21) {
    uint64_t v22 = 0LL;
  }
  else {
    uint64_t v22 = v12;
  }
  int v23 = *(_DWORD *)(a1 + 56);
  if ((_DWORD)v22)
  {
    switch(v23)
    {
      case 0:
      case 1:
      case 6:
        goto LABEL_26;
      case 2:
      case 3:
        if (v23 != 2 && v23 != 3) {
          goto LABEL_29;
        }
LABEL_26:
        expert_log(a2, 0LL, (uint64_t)"%s: enforcing[%s %s %s]: %s %s %s: %d", v16, v17, v18, v19, v20, a1 + 28);
        break;
      default:
        goto LABEL_29;
    }
  }

  else
  {
    switch(v23)
    {
      case 0:
      case 1:
      case 6:
        goto LABEL_27;
      case 2:
      case 3:
        if (v23 != 2 && v23 != 3) {
          goto LABEL_29;
        }
LABEL_27:
        expert_log(a2, 1uLL, (uint64_t)"%s: enforcing[%s %s %s]: %s %s %s: success", v16, v17, v18, v19, v20, a1 + 28);
        break;
      default:
LABEL_29:
        __panic_npx("panic: unreachable case: %s = 0x%llx", v14, v15, v16, v17, v18, v19, v20, (char)"p->p_container");
    }
  }

  return v22;
}

char *property_print_value( uint64_t a1, unint64_t a2, char *__str, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(**(void **)(a1 + 40))
  {
    case 0LL:
    case 1LL:
      snprintf(__str, 0x80uLL, "0x%x");
      goto LABEL_7;
    case 2LL:
      snprintf(__str, 0x80uLL, "0x%llx");
      goto LABEL_7;
    case 3LL:
      if (a2 + 80 < a2) {
        goto LABEL_11;
      }
      digest_print_cstr(a2, (unint64_t)__str, (uint64_t)__str, a4, a5, a6, a7, a8);
LABEL_7:
      uint64_t v9 = 0LL;
      do
      {
        if (v9 == 256)
        {
LABEL_11:
          __break(0x5519u);
LABEL_12:
          __panic_npx( "panic: unreachable case: %s = 0x%llx",  a2,  (uint64_t)__str,  a4,  a5,  a6,  a7,  a8,  (char)"p->p_type->pt_switchable");
        }
      }

      while (__str[v9++]);
      return __str;
    case 4LL:
      snprintf(__str, 0x80uLL, "%s");
      goto LABEL_7;
    default:
      goto LABEL_12;
  }

uint64_t _chain_enforceable(uint64_t a1, uint64_t a2)
{
  if (odometer_policy_get_chip_property(a1, *(void *)(a2 + 16)))
  {
    if (*(_WORD *)(a2 + 528))
    {
      uint64_t v3 = *(void *)a2;
      uint64_t name = chip_get_name(*(void *)(a2 + 16));
      uint64_t v9 = "odometer[%s:%s]: boot manifest hash is caller-supplied";
    }

    else
    {
      int chip_boot = odometer_query_chip_boot(a2);
      uint64_t v3 = *(void *)a2;
      uint64_t v19 = chip_get_name(*(void *)(a2 + 16));
      if (chip_boot)
      {
        expert_log(v3, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v4, v5, v6, v7, v8, v19);
        return 0LL;
      }

      uint64_t name = v19;
      uint64_t v9 = "odometer[%s:%s]: environment is a first-stage booter";
    }

    uint64_t v10 = 1LL;
    expert_log(v3, 1uLL, (uint64_t)v9, v4, v5, v6, v7, v8, name);
  }

  else
  {
    uint64_t v11 = *(void *)a2;
    uint64_t v12 = chip_get_name(*(void *)(a2 + 16));
    uint64_t v10 = 1LL;
    expert_log(v11, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v13, v14, v15, v16, v17, v12);
  }

  return v10;
}

uint64_t _chain_enforce(uint64_t a1, uint64_t *a2)
{
  v28[13] = *MEMORY[0x1895F89C0];
  uint64_t v4 = a2[1];
  unint64_t v5 = a2[2];
  uint64_t chip_property = odometer_policy_get_chip_property(a1, v5);
  *(_OWORD *)uint64_t v28 = xmmword_1894E7A58;
  memset(&v28[2], 170, 88);
  manifest_measure(v4, v5, (uint64_t)v28);
  uint64_t v11 = odometer_enforce_property(a2, a1, chip_property, (unsigned __int8 *)v28, v7, v8, v9, v10);
  uint64_t v12 = *a2;
  uint64_t name = chip_get_name(a2[2]);
  if ((_DWORD)v11)
  {
    uint64_t v19 = expert_log( v12,  0LL,  (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d",  v14,  v15,  v16,  v17,  v18,  name);
  }

  else
  {
    expert_log( v12,  1uLL,  (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain",  v14,  v15,  v16,  v17,  v18,  name);
  }

  return v11;
}

uint64_t generic_expert_specialist()
{
  uint64_t bootstrap = expert_get_bootstrap();
  expert_runtime_entry(bootstrap);
  uint64_t result = __plat4_mem;
  if (!__plat4_mem) {
    __panic_npx("panic: specialist not set after runtime entry", v1, v2, v3, v4, v5, v6, v7, vars0);
  }
  return result;
}

uint64_t generic_expert_current()
{
  if (off_18C5079F8) {
    return off_18C5079F8();
  }
  else {
    return generic_expert_specialist();
  }
}

uint64_t generic_expert_supervisor()
{
  return qword_18C5079F0;
}

char **generic_expert()
{
  return &__genx_mem;
}

uint64_t generic_expert_set_specialist( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(void **)(a1 + 24);
  uint64_t result = _expert_assert(a1, 1734700664LL, (uint64_t)"set specialist", a4, a5, a6, a7, a8);
  *uint64_t v10 = a2;
  v10[3] = a3;
  return result;
}

uint64_t generic_expert_set_current_resolver( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t result = _expert_assert(a1, 1734700664LL, (uint64_t)"set resolver", a4, a5, a6, a7, a8);
  *(void *)(v9 + 16) = a2;
  return result;
}

uint64_t generic_expert_set_supervisor( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t result = _expert_assert(a1, 1734700664LL, (uint64_t)"set supervisor", a4, a5, a6, a7, a8);
  *(void *)(v9 + 8) = a2;
  return result;
}

uint64_t generic_expert_get_chip_instance( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return *(void *)(*(void *)(a1 + 16) + 32LL);
}

char *_generic_expert_init( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(v8 + 24);
  __int128 v29 = xmmword_18A3B82D0;
  uint64_t v30 = -1LL;
  uint64_t v11 = *(uint64_t **)v8;
  uint64_t result = property_iterator_next((uint64_t)&v29, a2, a3, a4, a5, a6, a7, a8);
  if (result)
  {
    uint64_t v20 = (uint64_t)result;
    do
    {
      unsigned __int8 v33 = 0;
      int v32 = 0;
      uint64_t v31 = 0LL;
      memset(v36, 0, sizeof(v36));
      uint64_t v35 = 0x3E800000000LL;
      memset(v34, 0, sizeof(v34));
      switch(**(void **)(v20 + 40))
      {
        case 0LL:
          int property_digest = expert_query_property_BOOL((uint64_t)v11, v10, v20, &v33);
          break;
        case 1LL:
          int property_digest = expert_query_property_uint32((uint64_t)v11, v10, v20, &v32);
          break;
        case 2LL:
          int property_digest = expert_query_property_uint64((uint64_t)v11, v10, v20, &v31);
          break;
        case 3LL:
          int property_digest = expert_query_property_digest((uint64_t)v11, v10, v20, (uint64_t)v36);
          break;
        case 4LL:
          int property_digest = expert_query_property_version((uint64_t)v11, v10, v20, (uint64_t)v34);
          break;
        default:
LABEL_26:
          __panic_npx( "panic: unreachable case: %s = 0x%llx",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  (char)"p->p_type->pt_switchable");
      }

      if (property_digest > 18)
      {
        if (property_digest != 45 && property_digest != 19) {
          goto LABEL_25;
        }
      }

      else
      {
        if (!property_digest)
        {
          switch(**(void **)(v20 + 40))
          {
            case 0LL:
              chip_instance_set_BOOL(v9 + 40, v20, &v33, v15, v16, v17, v18, v19);
              goto LABEL_16;
            case 1LL:
              chip_instance_set_uint32(v9 + 40, v20, &v32, v15, v16, v17, v18, v19);
              goto LABEL_16;
            case 2LL:
              chip_instance_set_uint64(v9 + 40, v20, &v31, v15, v16, v17, v18, v19);
              goto LABEL_16;
            case 3LL:
              chip_instance_set_digest(v9 + 40, v20, (uint64_t)v36, v15, v16, v17, v18, v19);
              goto LABEL_16;
            case 4LL:
              chip_instance_set_version(v9 + 40, v20, v34, v15, v16, v17, v18, v19);
              goto LABEL_16;
            default:
              goto LABEL_26;
          }
        }

        if (property_digest != 2) {
LABEL_25:
        }
          __panic_npx( "panic: failed to query expert: uint64_t expert = %s, p = %s, fourcc = %s, code = %llu: %d",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  *v11);
      }

      expert_log( (uint64_t)v11,  2uLL,  (uint64_t)"failed to query expert: uint64_t expert = %s, p = %s, fourcc = %s, code = %llu: %d",  v15,  v16,  v17,  v18,  v19,  *v11);
LABEL_16:
      uint64_t result = property_iterator_next((uint64_t)&v29, v22, v23, v24, v25, v26, v27, v28);
      uint64_t v20 = (uint64_t)result;
    }

    while (result);
  }

  *(void *)(v9 + 32) = v9 + 40;
  return result;
}

uint64_t _generic_expert_boot()
{
  return 0LL;
}

uint64_t _generic_expert_get_digest_info(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 16) + 24LL) + 48LL))();
}

uint64_t _generic_expert_get_secure_boot()
{
  return 78LL;
}

uint64_t _generic_expert_query_chip(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 16) + 24LL);
}

uint64_t _generic_expert_query_chip_boot()
{
  return 45LL;
}

uint64_t _generic_expert_query_nonce()
{
  return 78LL;
}

uint64_t _generic_expert_entangle_nonce()
{
  return 78LL;
}

uint64_t _generic_expert_read_boot_manifest()
{
  return 78LL;
}

uint64_t _generic_expert_query_trust_store()
{
  return 78LL;
}

uint64_t _generic_expert_read_storage()
{
  return 78LL;
}

uint64_t _generic_expert_write_storage()
{
  return 78LL;
}

uint64_t _generic_expert_sync_storage()
{
  return 78LL;
}

uint64_t _generic_expert_query_property_BOOL( uint64_t a1, uint64_t a2, void *a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(_BYTE **)(*(void *)(a1 + 16) + 32LL);
  chip_instance_get_BOOL(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0LL;
}

uint64_t _generic_expert_query_property_uint32( uint64_t a1, uint64_t a2, void *a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(_DWORD **)(*(void *)(a1 + 16) + 32LL);
  chip_instance_get_uint32(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0LL;
}

uint64_t _generic_expert_query_property_uint64( uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(void **)(*(void *)(a1 + 16) + 32LL);
  chip_instance_get_uint64(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0LL;
}

uint64_t _generic_expert_query_property_digest( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10 = *(void *)(*(void *)(a1 + 16) + 32LL);
  chip_instance_get_digest(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0LL;
}

uint64_t _generic_expert_query_property_version( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10 = *(void *)(*(void *)(a1 + 16) + 32LL);
  chip_instance_get_version(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0LL;
}

uint64_t _generic_expert_boot_once()
{
  return 0LL;
}

void _generic_expert_read_random( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _generic_expert_syscall( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t img4_runtime_get_expert(char *a1)
{
  if (a1 == (char *)&_img4_runtime_default || a1 == (char *)&_img4_runtime_restore)
  {
    uint64_t v2 = (uint64_t (**)(void))(a1 + 88);
  }

  else
  {
    uint64_t v3 = (char *)*((void *)a1 + 1);
    if (v3 == "darwin userspace")
    {
      uint64_t v2 = &off_18A3B2C78;
    }

    else
    {
      if (v3 != "restoreOS") {
        return 0LL;
      }
      uint64_t v2 = &off_18A3B7730;
    }
  }

  return (*v2)();
}

uint64_t img4_runtime_check_custom_BOOL(uint64_t a1)
{
  uint64_t v1 = 0LL;
  char v2 = 1;
  while (*(void *)(a1 + 56) != *((void *)(&off_18A3B82E8)[v1] + 7))
  {
    char v3 = v2;
    char v2 = 0;
    uint64_t v1 = 1LL;
    if ((v3 & 1) == 0) {
      return *(void *)(a1 + 80);
    }
  }

  return 0LL;
}

uint64_t img4_runtime_check_custom_digest(uint64_t a1)
{
  char v1 = 0;
  uint64_t v2 = 0LL;
  uint64_t v3 = *(void *)(a1 + 80);
  do
  {
    char v4 = v1;
    uint64_t v5 = *(void *)&(*(&off_18A3B82E8)[v2])[80];
    if (v3 == v5) {
      break;
    }
    char v1 = 1;
    uint64_t v2 = 1LL;
  }

  while ((v4 & 1) == 0);
  if (v3 == v5) {
    return 0LL;
  }
  else {
    return *(void *)(a1 + 80);
  }
}

uint64_t version_init(uint64_t a1, char *a2, size_t a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  memset(v19, 0, sizeof(v19));
  __stringp = (char *)v19;
  cstring_init_with_buff(a1, a2, a3);
  *(void *)(a1 + 96) = 0xFADE2DED00000000LL;
  *(_OWORD *)(a1 + 80) = xmmword_1894E7AE0;
  cstring_get_string(a1);
  __strlcpy_chk();
  uint64_t v17 = strsep_npx(&__stringp, ",");
  if (__stringp) {
    *(_DWORD *)(a1 + 100) = _strtou_bounded(__stringp, 0LL, 0LL, v4, v5, v6, v7, v8);
  }
  for (uint64_t i = 0LL; i != 5; ++i)
  {
    unint64_t v10 = strsep_npx(&v17, ".");
    if (!v10) {
      break;
    }
    *(_DWORD *)(a1 + i * 4 + 80) = _strtou_bounded( v10,  *(unsigned int *)((char *)&xmmword_1894E7AE0 + i * 4),  dword_1894E7AF4[i],  v11,  v12,  v13,  v14,  v15);
  }

  return a1;
}

uint64_t _strtou_bounded( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = a3;
  unsigned int v9 = a2;
  uint64_t v14 = 0LL;
  unsigned int v10 = strtou32_npx(a1, &v14, 10);
  if (v14 && *v14) {
    unsigned int v10 = v9;
  }
  if (v10 <= v9) {
    unsigned int v11 = v9;
  }
  else {
    unsigned int v11 = v10;
  }
  if (v11 <= v8 || v8 == 0) {
    return v11;
  }
  else {
    return v9;
  }
}

uint64_t version_compare_xgroup(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + 80;
  if (!*(_DWORD *)(a1 + 80)) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t result = 1LL;
  while (1)
  {
    unsigned int v5 = *(_DWORD *)(v2 + v3);
    unsigned int v6 = *(_DWORD *)(a2 + 80 + v3);
    if (v5 > v6) {
      break;
    }
    if (v5 < v6) {
      return 2LL;
    }
    v3 += 4LL;
    if (v3 == 20) {
      return 0LL;
    }
  }

  return result;
}

uint64_t version_compare(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + 80;
  if (!*(_DWORD *)(a1 + 80)) {
    return 0LL;
  }
  if (*(_DWORD *)(a1 + 100) != *(_DWORD *)(a2 + 100)) {
    return 3LL;
  }
  uint64_t v3 = 0LL;
  uint64_t result = 1LL;
  while (1)
  {
    unsigned int v5 = *(_DWORD *)(v2 + v3);
    unsigned int v6 = *(_DWORD *)(a2 + 80 + v3);
    if (v5 > v6) {
      break;
    }
    if (v5 < v6) {
      return 2LL;
    }
    v3 += 4LL;
    if (v3 == 20) {
      return 0LL;
    }
  }

  return result;
}

__n128 version_copy(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  __int128 v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  __int128 v5 = a2[4];
  __int128 v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

char *version_copyout(char *__source, char *__dst)
{
  __n128 result = (char *)strlcpy(__dst, __source, 0x40uLL);
  uint64_t v4 = 0LL;
  while (v4 != 64)
  {
    if (!__dst[v4++]) {
      return __dst;
    }
  }

  __break(0x5519u);
  return result;
}

void __panic_npx_7( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unsigned int v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  unsigned int v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: invalid min/max: min = %u, max = %u", &a9);
  _os_crash();
  __break(1u);
}

uint64_t _UnsupportedApComputeDigest()
{
  return 4LL;
}

uint64_t _UnsupportedApVerifyChain()
{
  return 4LL;
}

uint64_t _UnsupportedApVerifySignature()
{
  return 4LL;
}

uint64_t _UnsupportedApEvaluateCertificateProperties()
{
  return 4LL;
}

uint64_t type_get_handle(uint64_t a1)
{
  uint64_t v1 = a1;
  return v1;
}

uint64_t type_get_size(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t _type_get_alloc_preference(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t _image4_coprocessor_select_internal( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(*(void *)(a2 + 8))
  {
    case 0LL:
      uint64_t v9 = image4_coprocessor_select_digest(a1, a2);
      goto LABEL_7;
    case 1LL:
      uint64_t v9 = image4_coprocessor_select_secure_boot(a1, a2, a3);
      goto LABEL_7;
    case 3LL:
      uint64_t v10 = *(void *)(a2 + 16);
      if (!v10) {
        return v10;
      }
      goto LABEL_8;
    case 4LL:
      uint64_t v9 = (*(uint64_t (**)(void))(a2 + 16))();
LABEL_7:
      uint64_t v10 = v9;
      if (v9)
      {
LABEL_8:
        uint64_t name = chip_get_name(v10);
        expert_log(a4, 2uLL, (uint64_t)"resolved: %s", v12, v13, v14, v15, v16, name);
      }

      return v10;
    default:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"cps->cps_type");
  }

uint64_t image4_coprocessor_select_digest(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = generic_expert_current();
  uint64_t v4 = *(void *)expert_get_digest_info(v3, 0LL, 0LL);
  if (v4 == 48)
  {
    uint64_t v6 = a2 + 24;
  }

  else
  {
    uint64_t result = 0LL;
    if (v4 != 20) {
      return result;
    }
    uint64_t v6 = a2 + 16;
  }

  return *(void *)v6;
}

uint64_t image4_coprocessor_select_secure_boot(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, a3);
  uint64_t v12 = a2 + 16;
  switch(v4)
  {
    case 0LL:
      return *(void *)v12;
    case 1LL:
      uint64_t v12 = a2 + 24;
      break;
    case 2LL:
      uint64_t v12 = a2 + 32;
      break;
    case 3LL:
      uint64_t v12 = a2 + 40;
      break;
    default:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v5, v6, v7, v8, v9, v10, v11, (char)"sb");
  }

  return *(void *)v12;
}

uint64_t image4_coprocessor_get_handle(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

uint64_t image4_coprocessor_get_handle_host()
{
  return 0LL;
}

unint64_t image4_coprocessor_get_secure_boot( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return image4_environment_get_secure_boot(a2, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t image4_coprocessor_get_secure_boot_host(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  uint64_t v12 = 0LL;
  int secure_boot = expert_get_secure_boot(v2, (uint64_t)&v12);
  if (secure_boot) {
    __panic_npx("panic: failed to get secure boot: %d", v4, v5, v6, v7, v8, v9, v10, secure_boot);
  }
  return v12;
}

uint64_t image4_coprocessor_select(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = *(void *)(a3 + 8);
  unint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a1, a3);
  unint64_t v15 = v7;
  if (v7 >= *(void *)(v5 + 608)) {
    __panic_npx( "panic: incomplete coprocessor map: uint64_t handle = %lld, expected < %lld",  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v7);
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v5, a3);
  uint64_t result = expert_log( v6,  2uLL,  (uint64_t)"resolving environment: coproc = %s, handle = %llx, secure boot = %llx",  v16,  v17,  v18,  v19,  v20,  *(void *)v5);
  unint64_t v26 = v5 + 32 + 48 * v15;
  if (a2) {
    uint64_t v27 = a2;
  }
  else {
    uint64_t v27 = (void *)(v5 + 32 + 48 * v15);
  }
  if (!v27 || (v26 < v5 + 608 ? (BOOL v28 = v26 >= v5 + 32) : (BOOL v28 = 0), !v28 ? (v29 = 0) : (v29 = 1), a2 || v29))
  {
    if (v27[1] != 2LL) {
      return _image4_coprocessor_select_internal(v5, (uint64_t)v27, a3, v6, v22, v23, v24, v25);
    }
    uint64_t v5 = v27[2];
    uint64_t v27 = (void *)(v5 + 32 + 48LL * v27[3]);
    if (!v27) {
      return _image4_coprocessor_select_internal(v5, (uint64_t)v27, a3, v6, v22, v23, v24, v25);
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t *image4_coprocessor_resolve_from_manifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  uint64_t v6 = generic_expert_current();
  uint64_t v48 = 0LL;
  memset(v47, 0, sizeof(v47));
  uint64_t v7 = expert_runtime_boot(v6);
  if ((_DWORD)v7)
  {
    *(void *)&__int128 v44 = v7;
    uint64_t v13 = "failed to boot expert for chip selection: %d";
    uint64_t v14 = v6;
    unint64_t v15 = 3LL;
    goto LABEL_5;
  }

  Img4DecodeInitAsManifest(a1, a2, (uint64_t)v47);
  if ((_DWORD)v16)
  {
    *(void *)&__int128 v44 = v16;
    uint64_t v13 = "Img4DecodeInitAsManifest: %d";
    uint64_t v14 = v6;
    unint64_t v15 = 0LL;
LABEL_5:
    expert_log(v14, v15, (uint64_t)v13, v8, v9, v10, v11, v12, v44);
    return 0LL;
  }

  uint64_t v19 = 0LL;
  while (1)
  {
    uint64_t v17 = *(uint64_t **)(a3 + v19);
    uint64_t v46 = 0LL;
    if (v17)
    {
      uint64_t v20 = v17 + 77;
      uint64_t v21 = image4_environment_new((uint64_t)v17, 0LL);
      uint64_t v46 = v21;
      if (!v21)
      {
        MEMORY[0x1895F8858](0LL, v22, v23, v24, v25, v26, v27, v28);
        *(void *)&__int128 v36 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *((_OWORD *)&v45 - 2) = v36;
        __int128 v44 = v36;
        *((_OWORD *)&v45 - 4) = v36;
        *((_OWORD *)&v45 - 3) = v36;
        *((_OWORD *)&v45 - 6) = v36;
        *((_OWORD *)&v45 - 5) = v36;
        *((_OWORD *)&v45 - 8) = v36;
        *((_OWORD *)&v45 - 7) = v36;
        *((_OWORD *)&v45 - 10) = v36;
        *((_OWORD *)&v45 - 9) = v36;
        *((_OWORD *)&v45 - 12) = v36;
        *((_OWORD *)&v45 - 11) = v36;
        *((_OWORD *)&v45 - 14) = v36;
        *((_OWORD *)&v45 - 13) = v36;
        *((_OWORD *)&v45 - 16) = v36;
        *((_OWORD *)&v45 - 15) = v36;
        if (v17 >= v20) {
          goto LABEL_19;
        }
        uint64_t v21 = _image4_environment_init((uint64_t)(&v45 - 256), (uint64_t)v17, 0LL, 0LL, v32, v33, v34, v35);
        uint64_t v46 = v21;
      }

      uint64_t v37 = image4_environment_resolve(v21);
      if (v37)
      {
        int v29 = *(__int128 **)(v37 + 32);
        if (!v29) {
          goto LABEL_20;
        }
        Img4DecodeCheckAuthority((uint64_t)v47, v29);
        if (!v43) {
          break;
        }
      }
    }

    image4_environment_destroy(&v46);
    v19 += 8LL;
    if (v19 == 24) {
      return 0LL;
    }
  }

  expert_log(v6, 2uLL, (uint64_t)"manifest matches coproc: %s", v38, v39, v40, v41, v42, *v17);
  image4_environment_destroy(&v46);
  if (v17 >= v20)
  {
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __panic_npx( "panic: illegal coprocessor map: canonical handle has no static decode implementation",  (uint64_t)v29,  v30,  v31,  v32,  v33,  v34,  v35,  v45);
  }

  return v17;
}

uint64_t img4_image_get_bytes(uint64_t a1)
{
  uint64_t v9 = 0LL;
  memset(v8, 0, sizeof(v8));
  uint64_t v2 = *(void *)(a1 + 40);
  if ((*(_BYTE *)a1 & 0x10) != 0) {
    uint64_t encoded_bytes = (uint64_t)payload_get_encoded_bytes(v2, v8);
  }
  else {
    uint64_t encoded_bytes = payload_get_decoded_bytes(v2, (uint64_t)v8);
  }
  uint64_t v4 = (unint64_t *)encoded_bytes;
  *(_WORD *)(a1 + 8) = 0;
  uint64_t result = a1 + 8;
  unint64_t v7 = *v4;
  unint64_t v6 = v4[1];
  if (v7 > v7 + v6)
  {
    __break(0x5519u);
  }

  else
  {
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = 0LL;
  }

  return result;
}

BOOL *img4_image_get_property_BOOL(uint64_t a1, unsigned int a2, BOOL *a3)
{
  if (Img4DecodeGetObjectPropertyBoolean( *(void *)(*(void *)(a1 + 40) + 104LL),  **(unsigned int **)(*(void *)(a1 + 40) + 8LL),  a2,  a3)) {
    return 0LL;
  }
  else {
    return a3;
  }
}

_DWORD *img4_image_get_property_uint32(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  if (v4) {
    return 0LL;
  }
  else {
    return a3;
  }
}

unint64_t *img4_image_get_property_uint64(uint64_t a1, unsigned int a2, unint64_t *a3)
{
  if (v4) {
    return 0LL;
  }
  else {
    return a3;
  }
}

uint64_t img4_image_get_property_data(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v4 + 104);
  uint64_t v6 = **(unsigned int **)(v4 + 8);
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  Img4DecodeGetObjectPropertyData(v5, v6, a2, &v11, &v12);
  int v8 = v7;
  uint64_t result = 0LL;
  if (!v8)
  {
    *(_WORD *)a3 = 0;
    uint64_t v10 = v12;
    *(void *)(a3 + 8) = v11;
    *(void *)(a3 + 16) = v10;
    *(void *)(a3 + 24) = 0LL;
    return a3;
  }

  return result;
}

BOOL *img4_image_get_entitlement_BOOL(uint64_t a1, unsigned int a2, BOOL *a3)
{
  uint64_t v4 = *(void *)(a1 + 48);
  if (*(_WORD *)(v4 + 528)) {
    uint64_t v5 = v4 + 72;
  }
  else {
    uint64_t v5 = 0LL;
  }
  else {
    return a3;
  }
}

_DWORD *img4_image_get_entitlement_uint32(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v4 = *(void *)(a1 + 48);
  if (*(_WORD *)(v4 + 528)) {
    uint64_t v5 = v4 + 72;
  }
  else {
    uint64_t v5 = 0LL;
  }
  Img4DecodeGetIntegerFromSection(v5, 0, a2, a3);
  if (v6) {
    return 0LL;
  }
  else {
    return a3;
  }
}

unint64_t *img4_image_get_entitlement_uint64(uint64_t a1, unsigned int a2, unint64_t *a3)
{
  uint64_t v4 = *(void *)(a1 + 48);
  if (*(_WORD *)(v4 + 528)) {
    uint64_t v5 = v4 + 72;
  }
  else {
    uint64_t v5 = 0LL;
  }
  Img4DecodeGetInteger64FromSection(v5, 0, a2, a3);
  if (v6) {
    return 0LL;
  }
  else {
    return a3;
  }
}

uint64_t img4_image_get_entitlement_data(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 48);
  if (*(_WORD *)(v4 + 528)) {
    uint64_t v5 = v4 + 72;
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  Img4DecodeGetDataFromSection(v5, 0, a2, &v10, &v11);
  int v7 = v6;
  uint64_t result = 0LL;
  if (!v7)
  {
    *(_WORD *)a3 = 0;
    uint64_t v9 = v11;
    *(void *)(a3 + 8) = v10;
    *(void *)(a3 + 16) = v9;
    *(void *)(a3 + 24) = 0LL;
    return a3;
  }

  return result;
}

void *img4_image_init(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *uint64_t result = a4;
  result[5] = a2;
  result[6] = a3;
  return result;
}

uint64_t boot_expert_boot_manifest( uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  v48[0] = xmmword_18A3B8AC0;
  v48[1] = *(_OWORD *)&off_18A3B8AD0;
  void v48[2] = xmmword_18A3B8AE0;
  uint64_t v49 = 0LL;
  v45[0] = a1;
  v45[1] = a2;
  uint64_t v46 = 0LL;
  uint64_t v47 = 0LL;
  memset(v52, 170, sizeof(v52));
  __int128 v50 = xmmword_1894E7C78;
  __int128 v51 = unk_1894E7C88;
  _expert_assert(a1, 1651470196LL, (uint64_t)"boot manifest", a4, a5, a6, a7, a8);
  if (a3[1])
  {
    uint64_t v11 = a3[2];
    uint64_t v46 = a3[1];
    uint64_t v47 = v11;
  }

  manifest_set_callbacks((uint64_t)a3, (uint64_t)v45, (uint64_t)v48);
  unint64_t v12 = manifest_parse((uint64_t)a3);
  if ((_DWORD)v12)
  {
    unint64_t v18 = v12;
    expert_log(a1, 0LL, (uint64_t)"failed to parse manifest for boot: %d", v13, v14, v15, v16, v17, v12);
    goto LABEL_7;
  }

  uint64_t v26 = manifest_impose(a3, a2, 0LL, 0LL);
  if ((_DWORD)v26)
  {
    unint64_t v18 = v26;
    expert_log(a1, 0LL, (uint64_t)"failed to impose manifest for boot: %d", v27, v28, v29, v30, v31, v26);
LABEL_7:
    return v18;
  }

  if (!*(void *)(a2 + 248))
  {
LABEL_15:
    expert_log(a1, 2uLL, (uint64_t)"booted manifest", v27, v28, v29, v30, v31, v44);
    return 0LL;
  }

  uint64_t result = manifest_measure((uint64_t)a3, a2, (uint64_t)&v50);
  uint64_t v33 = *(void *)(a1 + 24);
  uint64_t v34 = *(void *)(*(void *)(a2 + 248) + 16LL);
  unint64_t v35 = v33 + 272;
  unint64_t v36 = v33 + 272 + 104 * v34;
  if (v36 < v33 + 3704 && v36 >= v35)
  {
    __int128 v37 = v50;
    __int128 v38 = *(_OWORD *)v52;
    *(_OWORD *)(v36 + 16) = v51;
    *(_OWORD *)(v36 + 32) = v38;
    *(_OWORD *)unint64_t v36 = v37;
    __int128 v39 = *(_OWORD *)&v52[16];
    __int128 v40 = *(_OWORD *)&v52[32];
    __int128 v41 = *(_OWORD *)&v52[48];
    *(void *)(v36 + 96) = *(void *)&v52[64];
    *(_OWORD *)(v36 + 64) = v40;
    *(_OWORD *)(v36 + 80) = v41;
    *(_OWORD *)(v36 + 48) = v39;
    unint64_t v42 = v33 + 8;
    int v43 = (unint64_t *)(v33 + 8 + 8 * v34);
    if ((unint64_t)v43 < v35 && (unint64_t)v43 >= v42)
    {
      *int v43 = v36;
      goto LABEL_15;
    }
  }

  __break(0x5519u);
  return result;
}

unint64_t _boot_expert_property_BOOL(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9 = *a5;
  uint64_t v11 = (uint64_t (**)(uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t))a5[2];
  uint64_t v10 = a5[3];
  unint64_t result = _boot_expert_find_entitlement(*a5, a2, a3, a5[1], (uint64_t)&_property_type_BOOL);
  if (result)
  {
    uint64_t v13 = *(void *)(v9 + 24);
    unint64_t v14 = v13 + 272 + 104LL * *(void *)(result + 16);
    if (v14)
    {
      if (v14 >= v13 + 3704 || v14 < v13 + 272) {
        goto LABEL_23;
      }
    }

    *(_BYTE *)unint64_t v14 = a4;
    uint64_t v16 = *(void *)(v9 + 24);
    uint64_t v17 = *(void *)(result + 16);
    unint64_t v18 = v16 + 272;
    unint64_t v19 = v16 + 272 + 104 * v17;
    if (v19 >= v16 + 3704 || v19 < v18) {
      goto LABEL_23;
    }
    __int128 v21 = *(_OWORD *)v14;
    __int128 v22 = *(_OWORD *)(v14 + 32);
    *(_OWORD *)(v19 + 16) = *(_OWORD *)(v14 + 16);
    *(_OWORD *)(v19 + 32) = v22;
    *(_OWORD *)unint64_t v19 = v21;
    __int128 v23 = *(_OWORD *)(v14 + 48);
    __int128 v24 = *(_OWORD *)(v14 + 64);
    __int128 v25 = *(_OWORD *)(v14 + 80);
    *(void *)(v19 + 96) = *(void *)(v14 + 96);
    *(_OWORD *)(v19 + 64) = v24;
    *(_OWORD *)(v19 + 80) = v25;
    *(_OWORD *)(v19 + 48) = v23;
    unint64_t v26 = v16 + 8;
    uint64_t v27 = (unint64_t *)(v26 + 8 * v17);
    if ((unint64_t)v27 >= v18 || (unint64_t)v27 < v26)
    {
LABEL_23:
      __break(0x5519u);
      return result;
    }

    *uint64_t v27 = v19;
  }

  if (v11)
  {
    if (*v11) {
      return (*v11)(a1, a2, a3, a4, v10);
    }
  }

  return result;
}

unint64_t _boot_expert_property_integer( uint64_t a1, _DWORD *a2, uint64_t a3, unint64_t a4, uint64_t *a5)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = *a5;
  uint64_t v10 = a5[1];
  uint64_t v12 = a5[2];
  uint64_t v11 = a5[3];
  char v13 = 1;
  do
  {
    char v14 = v13;
    uint64_t v15 = (void *)off_18A3B8AF8[v8];
    unint64_t result = _boot_expert_find_entitlement(v9, a2, a3, v10, (uint64_t)v15);
    if (result)
    {
      uint64_t v24 = *(void *)(v9 + 24);
      unint64_t v25 = v24 + 272 + 104LL * *(void *)(result + 16);
      if (!v25 || (v25 < v24 + 3704 ? (BOOL v26 = v25 >= v24 + 272) : (BOOL v26 = 0), v26))
      {
        if (*v15 == 2LL)
        {
          *(void *)unint64_t v25 = a4;
        }

        else
        {
          if (*v15 != 1LL) {
            goto LABEL_36;
          }
          if (HIDWORD(a4)) {
            __panic_npx( "panic: integer cast overflow: v = %s, actual = %llu, expected <= %llu",  v17,  v18,  v19,  v20,  v21,  v22,  v23,  (char)"v");
          }
          *(_DWORD *)unint64_t v25 = a4;
        }

        if (v25) {
          BOOL v27 = v25 >= v25 + 104;
        }
        else {
          BOOL v27 = 0;
        }
        if (!v27)
        {
          uint64_t v28 = *(void *)(v9 + 24);
          uint64_t v29 = *(void *)(result + 16);
          unint64_t v30 = v28 + 272;
          unint64_t v31 = v28 + 272 + 104 * v29;
          if (v31 < v28 + 3704 && v31 >= v30)
          {
            __int128 v33 = *(_OWORD *)v25;
            __int128 v34 = *(_OWORD *)(v25 + 32);
            *(_OWORD *)(v31 + 16) = *(_OWORD *)(v25 + 16);
            *(_OWORD *)(v31 + 32) = v34;
            *(_OWORD *)unint64_t v31 = v33;
            __int128 v35 = *(_OWORD *)(v25 + 48);
            __int128 v36 = *(_OWORD *)(v25 + 64);
            __int128 v37 = *(_OWORD *)(v25 + 80);
            *(void *)(v31 + 96) = *(void *)(v25 + 96);
            *(_OWORD *)(v31 + 64) = v36;
            *(_OWORD *)(v31 + 80) = v37;
            *(_OWORD *)(v31 + 48) = v35;
            unint64_t v38 = v28 + 8;
            __int128 v39 = (unint64_t *)(v38 + 8 * v29);
            if ((unint64_t)v39 < v30 && (unint64_t)v39 >= v38)
            {
              *__int128 v39 = v31;
              if (v12) {
                goto LABEL_32;
              }
              return result;
            }
          }
        }
      }

      __break(0x5519u);
LABEL_36:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v17, v18, v19, v20, v21, v22, v23, (char)"pti->pt_switchable");
    }

    char v13 = 0;
    uint64_t v8 = 1LL;
  }

  while ((v14 & 1) != 0);
  if (!v12) {
    return result;
  }
LABEL_32:
  __int128 v41 = *(uint64_t (**)(uint64_t, _DWORD *, uint64_t, unint64_t, uint64_t))(v12 + 8);
  if (v41) {
    return v41(a1, a2, a3, a4, v11);
  }
  return result;
}

uint64_t _boot_expert_property_data(uint64_t a1, _DWORD *a2, uint64_t a3, char *a4, size_t a5, uint64_t *a6)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = *a6;
  uint64_t v11 = a6[1];
  uint64_t v12 = a6[2];
  uint64_t v46 = a6[3];
  char v13 = 1;
  do
  {
    char v14 = v13;
    uint64_t v15 = (void *)off_18A3B8B08[v9];
    uint64_t result = _boot_expert_find_entitlement(v10, a2, a3, v11, (uint64_t)v15);
    if (result)
    {
      uint64_t v24 = result;
      uint64_t v25 = *(void *)(v10 + 24);
      unint64_t v26 = v25 + 272 + 104LL * *(void *)(result + 16);
      if (v26)
      {
        if (v26 >= v25 + 3704 || v26 < v25 + 272) {
          goto LABEL_42;
        }
      }

      unint64_t v28 = v26 + 104;
      if (*v15 == 4LL)
      {
        if (v26) {
          BOOL v30 = v26 >= v28;
        }
        else {
          BOOL v30 = 0;
        }
        if (!v30)
        {
          uint64_t result = version_init(v26, a4, a5);
LABEL_24:
          if (v26) {
            BOOL v31 = v26 >= v28;
          }
          else {
            BOOL v31 = 0;
          }
          if (!v31)
          {
            uint64_t v32 = *(void *)(v10 + 24);
            uint64_t v33 = *(void *)(v24 + 16);
            unint64_t v34 = v32 + 272;
            unint64_t v35 = v32 + 272 + 104 * v33;
            if (v35 < v32 + 3704 && v35 >= v34)
            {
              __int128 v37 = *(_OWORD *)v26;
              __int128 v38 = *(_OWORD *)(v26 + 32);
              *(_OWORD *)(v35 + 16) = *(_OWORD *)(v26 + 16);
              *(_OWORD *)(v35 + 32) = v38;
              *(_OWORD *)unint64_t v35 = v37;
              __int128 v39 = *(_OWORD *)(v26 + 48);
              __int128 v40 = *(_OWORD *)(v26 + 64);
              __int128 v41 = *(_OWORD *)(v26 + 80);
              *(void *)(v35 + 96) = *(void *)(v26 + 96);
              *(_OWORD *)(v35 + 64) = v40;
              *(_OWORD *)(v35 + 80) = v41;
              *(_OWORD *)(v35 + 48) = v39;
              unint64_t v42 = v32 + 8;
              int v43 = (unint64_t *)(v32 + 8 + 8 * v33);
              if ((unint64_t)v43 < v34 && (unint64_t)v43 >= v42)
              {
                *int v43 = v35;
                if (v12) {
                  goto LABEL_39;
                }
                return result;
              }
            }
          }
        }
      }

      else
      {
        if (*v15 != 3LL) {
          goto LABEL_43;
        }
        if (v26) {
          BOOL v29 = v26 >= v26 + 80;
        }
        else {
          BOOL v29 = 0;
        }
        if (!v29)
        {
          uint64_t result = digest_init(v26, a4, a5, v19, v20, v21, v22, v23);
          goto LABEL_24;
        }
      }

uint64_t _boot_expert_odometer_prepare(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (v3)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 32);
    if (v4) {
      return v4(result, a2, *(void *)(a3 + 24));
    }
  }

  return result;
}

void *boot_expert_boot_closure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  memset(v25, 170, sizeof(v25));
  __int128 v23 = xmmword_1894E7C78;
  __int128 v24 = unk_1894E7C88;
  uint64_t v5 = (void *)(*(uint64_t (**)(void))(*(void *)(a2 + 8) + 48LL))();
  uint64_t result = digest_init_measure(&v23, v5, a3, v6, v7, v8, v9, v10);
  uint64_t v12 = *(void *)(a1 + 24);
  unint64_t v13 = v12 + 272;
  char v14 = (__int128 *)(v12 + 3496);
  __int128 v16 = v23;
  __int128 v17 = *(_OWORD *)v25;
  *(_OWORD *)(v12 + 3512) = v24;
  *(_OWORD *)(v12 + 3528) = v17;
  __int128 *v14 = v16;
  __int128 v18 = *(_OWORD *)&v25[16];
  __int128 v19 = *(_OWORD *)&v25[32];
  __int128 v20 = *(_OWORD *)&v25[48];
  *(void *)(v12 + 3592) = *(void *)&v25[64];
  *(_OWORD *)(v12 + 3560) = v19;
  *(_OWORD *)(v12 + 3576) = v20;
  *(_OWORD *)(v12 + 3544) = v18;
  unint64_t v21 = v12 + 8;
  uint64_t v22 = (__int128 **)(v12 + 256);
  if ((unint64_t)v22 >= v13 || (unint64_t)v22 < v21) {
LABEL_9:
  }
    __break(0x5519u);
  *uint64_t v22 = v14;
  return result;
}

uint64_t _boot_expert_boot()
{
  return 0LL;
}

void *_boot_expert_logv(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 16) + 48LL))(*(void **)(a1 + 16));
}

uint64_t _boot_expert_get_digest_info(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return expert_get_digest_info(**(void **)(a1 + 16), a2, a3);
}

uint64_t _boot_expert_get_secure_boot(uint64_t a1, uint64_t a2)
{
  return expert_get_secure_boot(**(void **)(a1 + 16), a2);
}

uint64_t _boot_expert_query_chip(uint64_t a1, uint64_t a2)
{
  return expert_query_chip(**(void **)(a1 + 16), a2);
}

uint64_t _boot_expert_query_chip_boot(uint64_t a1, uint64_t a2)
{
  return expert_query_chip_boot(**(void **)(a1 + 16), a2);
}

uint64_t _boot_expert_query_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return expert_query_nonce(**(void **)(a1 + 16), a2, a3, a4);
}

uint64_t _boot_expert_entangle_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return expert_entangle_nonce(**(void **)(a1 + 16), a2, a3, a4, a5);
}

uint64_t _boot_expert_read_boot_manifest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return expert_read_boot_manifest(**(void **)(a1 + 16), a2, a3, a4);
}

uint64_t _boot_expert_query_trust_store(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return expert_query_trust_store(**(void **)(a1 + 16), a2, a3, a4, a5);
}

uint64_t _boot_expert_read_storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return expert_read_storage(**(void **)(a1 + 16), a2, a3, a4);
}

uint64_t _boot_expert_write_storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return expert_write_storage(**(void **)(a1 + 16), a2, a3, a4);
}

uint64_t _boot_expert_sync_storage(uint64_t a1, uint64_t a2)
{
  return expert_sync_storage(**(void **)(a1 + 16), a2);
}

uint64_t _boot_expert_query_property_BOOL( uint64_t result, uint64_t a2, uint64_t a3, BOOL *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(result + 24);
  unint64_t v12 = v11 + 8;
  unint64_t v13 = v11 + 272;
  char v14 = (BOOL **)(v11 + 8 + 8LL * *(void *)(a3 + 16));
  if ((unint64_t)v14 < v13 && (unint64_t)v14 >= v12)
  {
    __int128 v16 = *v14;
    if (v16)
    {
      *a4 = *v16;
      return 0LL;
    }

    else
    {
      uint64_t v17 = **(void **)(result + 16);
      expert_log( result,  2uLL,  (uint64_t)"falling back to base expert for property: %s",  (uint64_t)a4,  a5,  a6,  a7,  a8,  a3 + 28);
      return expert_query_property_BOOL(v17, a2, a3, (unsigned __int8 *)a4);
    }
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t _boot_expert_query_property_uint32( uint64_t result, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 24);
  unint64_t v9 = v8 + 8;
  unint64_t v10 = v8 + 272;
  uint64_t v11 = (_DWORD **)(v8 + 8 + 8LL * *(void *)(a3 + 16));
  if ((unint64_t)v11 < v10 && (unint64_t)v11 >= v9)
  {
    char v14 = *v11;
    if (v14)
    {
      *a4 = *v14;
      return 0LL;
    }

    else
    {
      uint64_t v17 = **(void **)(result + 16);
      expert_log( result,  2uLL,  (uint64_t)"falling back to base expert for property: %s",  (uint64_t)a4,  a5,  a6,  a7,  a8,  a3 + 28);
      return expert_query_property_uint32(v17, a2, a3, a4);
    }
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t _boot_expert_query_property_uint64( uint64_t result, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 24);
  unint64_t v9 = v8 + 8;
  unint64_t v10 = v8 + 272;
  uint64_t v11 = (void **)(v8 + 8 + 8LL * *(void *)(a3 + 16));
  if ((unint64_t)v11 < v10 && (unint64_t)v11 >= v9)
  {
    char v14 = *v11;
    if (v14)
    {
      *a4 = *v14;
      return 0LL;
    }

    else
    {
      uint64_t v17 = **(void **)(result + 16);
      expert_log( result,  2uLL,  (uint64_t)"falling back to base expert for property: %s",  (uint64_t)a4,  a5,  a6,  a7,  a8,  a3 + 28);
      return expert_query_property_uint64(v17, a2, a3, a4);
    }
  }

  else
  {
    __break(0x5519u);
  }

  return result;
}

uint64_t _boot_expert_query_property_digest( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 24);
  unint64_t v9 = v8 + 8;
  unint64_t v10 = v8 + 272;
  uint64_t v11 = (unint64_t *)(v8 + 8 + 8LL * *(void *)(a3 + 16));
  if ((unint64_t)v11 < v10 && (unint64_t)v11 >= v9)
  {
    unint64_t v15 = *v11;
    if (!*v11)
    {
      uint64_t v17 = **(void **)(result + 16);
      expert_log(result, 2uLL, (uint64_t)"falling back to base expert for property: %s", a4, a5, a6, a7, a8, a3 + 28);
      return expert_query_property_digest(v17, a2, a3, a4);
    }

    if (v15 < v15 + 80)
    {
      digest_copy(a4, v15, a3, a4, a5, a6, a7, a8);
      return 0LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t _boot_expert_query_property_version( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 24);
  unint64_t v9 = v8 + 8;
  unint64_t v10 = v8 + 272;
  uint64_t v11 = (__int128 **)(v8 + 8 + 8LL * *(void *)(a3 + 16));
  if ((unint64_t)v11 < v10 && (unint64_t)v11 >= v9)
  {
    unint64_t v15 = *v11;
    if (!*v11)
    {
      uint64_t v17 = **(void **)(result + 16);
      expert_log(result, 2uLL, (uint64_t)"falling back to base expert for property: %s", a4, a5, a6, a7, a8, a3 + 28);
      return expert_query_property_version(v17, a2, a3, a4);
    }

    if (v15 < (__int128 *)((char *)v15 + 104))
    {
      version_copy(a4, v15);
      return 0LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t _boot_expert_boot_once()
{
  return 0LL;
}

uint64_t _boot_expert_read_random(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return expert_read_random(**(void **)(result + 16), a2, a3);
  }
  __break(0x5519u);
  return result;
}

uint64_t _boot_expert_syscall(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return expert_syscall(**(void **)(a1 + 16), a2, a3, a4, a5, a6);
}

unint64_t _boot_expert_find_entitlement(uint64_t a1, _DWORD *a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (uint64_t)(a2 + 1);
  chip_get_name(a4);
  expert_log( a1,  2uLL,  (uint64_t)"finding entitlement for chip: entitlement = %s, uint64_t chip = %s",  v11,  v12,  v13,  v14,  v15,  v10);
  if (a3)
  {
    __int128 v23 = "not a manifest property";
LABEL_11:
    expert_log(a1, 2uLL, (uint64_t)v23, v18, v19, v20, v21, v22, v27);
    return 0LL;
  }

  unint64_t result = property_find_entitlement(a2, v16, v17, v18, v19, v20, v21, v22);
  if (!result || (unint64_t v25 = result, *(void *)(result + 16) == 33LL))
  {
    __int128 v23 = "not an expert property";
    goto LABEL_11;
  }

  uint64_t v26 = *(void *)(result + 40);
  if (v26 != a5)
  {
    expert_log( a1,  2uLL,  (uint64_t)"unexpected type: actual = %s, expected = %s",  v18,  v19,  v20,  v21,  v22,  *(void *)(v26 + 8));
    return 0LL;
  }

  if (result < result + 104)
  {
    if (!chip_check_entitlement(a4, result))
    {
      expert_log(a1, 2uLL, (uint64_t)"entitlement present for chip", v18, v19, v20, v21, v22, v27);
      return v25;
    }

    __int128 v23 = "entitlement not present in chip";
    goto LABEL_11;
  }

  __break(0x5519u);
  return result;
}

uint64_t odometer_compute_nonce_hash(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t chip = a2;
  uint64_t v39 = *MEMORY[0x1895F89C0];
  memset(v38, 0, sizeof(v38));
  if (!a2) {
    uint64_t chip = (void *)expert_query_chip(a1, 0LL);
  }
  if (!chip[25] || (uint64_t v7 = chip[21]) != 0) {
    uint64_t v7 = 1LL;
  }
  if (chip[22]) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = v7;
  }
  uint64_t digest_info = expert_get_digest_info(a1, (uint64_t)chip, v8);
  MEMORY[0x1895F8858]( digest_info,  v10,  (*(void *)(digest_info + 8) + *(void *)(digest_info + 16) + 19LL) & 0xFFFFFFFFFFFFFFF8LL,  v11,  v12,  v13,  v14,  v15);
  __int128 v24 = (char *)v38 - v23;
  if (v25 >= 8) {
    memset((char *)v38 - v23, 170, v17);
  }
  if (*(void *)digest_info >= 0x41uLL) {
    __panic_npx( "panic: buffer not large enough for digest: actual = %lu, expected >= %lu",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  64);
  }
  uint64_t name = chip_get_name((uint64_t)chip);
  expert_log(a1, 2uLL, (uint64_t)"computing nonce digest: uint64_t chip = %s, digest length = %lu", v27, v28, v29, v30, v31, name);
  ccdigest_init();
  ccdigest_update();
  (*(void (**)(uint64_t, char *, _OWORD *))(digest_info + 56))(digest_info, v24, v38);
  if (*(void *)digest_info > 0x40uLL) {
    __break(0x5519u);
  }
  return digest_init(a4, v38, *(void *)digest_info, v32, v33, v34, v35, v36);
}

uint64_t odometer_derive_nonce_hash(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v23[3] = *MEMORY[0x1895F89C0];
  memset(v23, 0, 24);
  uint64_t v8 = expert_entangle_nonce(a1, (uint64_t)a2, a3, a4, (uint64_t)v23);
  uint64_t v14 = v8;
  if ((_DWORD)v8)
  {
    expert_log(a1, 0LL, (uint64_t)"failed to entangle nonce: %d", v9, v10, v11, v12, v13, v8);
  }

  else
  {
    odometer_compute_nonce_hash(a1, a2, (uint64_t)v23, a5);
  }

  return v14;
}

unint64_t odometer_check_fuse( unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a2 + 8);
  if (v8 < 0) {
    __panic_npx("panic: invalid offset: %lld", a2, a3, a4, a5, a6, a7, a8, *(void *)(a2 + 8));
  }
  uint64_t v9 = (unsigned __int8 *)(result + v8);
  __break(0x5519u);
  return result;
}

uint64_t odometer_query_chip_boot(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t chip_boot = expert_query_chip_boot(*(void *)a1, v2);
  if (!(_DWORD)chip_boot)
  {
    uint64_t v12 = "odometer[%s]: expert boots chip";
LABEL_6:
    uint64_t v13 = *(void *)a1;
    uint64_t name = chip_get_name(*(void *)(a1 + 16));
    expert_log(v13, 1uLL, (uint64_t)v12, v15, v16, v17, v18, v19, name);
    return 0LL;
  }

  uint64_t v4 = chip_boot;
  if ((_DWORD)chip_boot == 45)
  {
    uint64_t v5 = *(void *)a1;
    uint64_t v6 = chip_get_name(*(void *)(a1 + 16));
    expert_log(v5, 1uLL, (uint64_t)"odometer[%s]: expert does not boot chip", v7, v8, v9, v10, v11, v6);
    if (*(_WORD *)(a1 + 56))
    {
      uint64_t v12 = "odometer[%s]: nonce supplied; simulating first-stage boot";
    }

    else
    {
      if (!*(_WORD *)(a1 + 232)) {
        return 45LL;
      }
      uint64_t v12 = "odometer[%s]: nonce hash supplied; simulating first-stage boot";
    }

    goto LABEL_6;
  }

  uint64_t v20 = *(void *)a1;
  uint64_t v21 = chip_get_name(*(void *)(a1 + 16));
  chip_get_name(v2);
  expert_log(v20, 0LL, (uint64_t)"odometer[%s]: failed to query chip boot: %s: %d", v22, v23, v24, v25, v26, v21);
  return v4;
}

uint64_t odometer_query_live_nonce( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_WORD *)(a1 + 56))
  {
    nonce_init_copy(a4, (void *)(a1 + 32), a3, (uint64_t)a4, a5, a6, a7, a8);
    return 0LL;
  }

  else
  {
    uint64_t v10 = *(void *)a1;
    if ((_DWORD)a3 == -1) {
      uint64_t v11 = 0LL;
    }
    else {
      uint64_t v11 = *(void *)(a1 + 16);
    }
    return expert_query_nonce(v10, v11, a3, (uint64_t)a4);
  }

uint64_t odometer_query_restore_info_nonce(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = a1[2];
  uint64_t v7 = *(unsigned int *)(*(void *)(v6 + 96) + 24LL);
  *(void *)int v58 = 0LL;
  size_t __n = 0LL;
  uint64_t v8 = *a1;
  uint64_t name = chip_get_name(v6);
  expert_log(v8, 1uLL, (uint64_t)"odometer[%s]: querying restore info for boot nonce: %s", v10, v11, v12, v13, v14, name);
  Img4DecodeGetRestoreInfoData(a2, v7, v58, &__n);
  if (v15 == 1)
  {
    uint64_t v30 = *a1;
    uint64_t v31 = chip_get_name(a1[2]);
    expert_log(v30, 0LL, (uint64_t)"odometer[%s]: restore info has no boot nonce", v32, v33, v34, v35, v36, v31);
    return 2LL;
  }

  else
  {
    unsigned int v21 = v15;
    if (v15)
    {
      uint64_t v37 = *a1;
      uint64_t v38 = chip_get_name(a1[2]);
      expert_log( v37,  0LL,  (uint64_t)"odometer[%s]: failed to query restore info for boot nonce: %d",  v39,  v40,  v41,  v42,  v43,  v38);
      uint64_t result = posixdr(v21);
    }

    else if (__n < 0x11)
    {
      nonce_init(a3, *(const void **)v58, __n, v16, v17, v18, v19, v20);
      uint64_t v51 = *a1;
      uint64_t v52 = chip_get_name(a1[2]);
      expert_log(v51, 1uLL, (uint64_t)"odometer[%s]: fetched boot nonce from restore info", v53, v54, v55, v56, v57, v52);
      return 0LL;
    }

    else
    {
      uint64_t v22 = *a1;
      uint64_t v23 = chip_get_name(a1[2]);
      expert_log( v22,  1uLL,  (uint64_t)"odometer[%s]: restore info nonce too large: actual = %lu, expected <= %lu",  v24,  v25,  v26,  v27,  v28,  v23);
      return 84LL;
    }
  }

  return result;
}

uint64_t odometer_enforce_property( uint64_t *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v96[13] = *MEMORY[0x1895F89C0];
  uint64_t v8 = *(unsigned int *)(a2 + 24);
  uint64_t v9 = *a1;
  unint64_t v10 = a1[2];
  *(_OWORD *)uint64_t v96 = xmmword_1894E7CF0;
  memset(&v96[2], 170, 88);
  switch(**(void **)(a3 + 40))
  {
    case 0LL:
      uint64_t property_BOOL = expert_query_property_BOOL(v9, v10, a3, (unsigned __int8 *)v96);
      if ((_DWORD)property_BOOL) {
        goto LABEL_18;
      }
      if (a4 && a4 + 1 < a4) {
        goto LABEL_45;
      }
      return 0LL;
    case 1LL:
      uint64_t property_BOOL = expert_query_property_uint32(v9, v10, a3, v96);
      if ((_DWORD)property_BOOL) {
        goto LABEL_18;
      }
      if (a4 && a4 + 4 < a4) {
        goto LABEL_45;
      }
      goto LABEL_6;
    case 2LL:
      uint64_t property_BOOL = expert_query_property_uint64(v9, v10, a3, v96);
      if ((_DWORD)property_BOOL) {
        goto LABEL_18;
      }
      if (a4 && a4 + 8 < a4) {
        goto LABEL_45;
      }
      goto LABEL_6;
    case 3LL:
      uint64_t property_BOOL = expert_query_property_digest(v9, v10, a3, (uint64_t)v96);
      if ((_DWORD)property_BOOL)
      {
LABEL_18:
        uint64_t v29 = property_BOOL;
        uint64_t v30 = *a1;
        uint64_t name = chip_get_name(a1[2]);
        expert_log( v30,  0LL,  (uint64_t)"odometer[%s:%s]: failed to query expert: p = %s: %d",  v32,  v33,  v34,  v35,  v36,  name);
        uint64_t v8 = v29;
        goto LABEL_19;
      }

      if (a4 && a4 + 80 < a4) {
        goto LABEL_45;
      }
      goto LABEL_6;
    case 4LL:
      if (odometer_check_fuse( (unint64_t)a1,  (uint64_t)&_odometer_cylinder_mixn_match,  a3,  (uint64_t)a4,  a5,  a6,  a7,  a8))
      {
        uint64_t v44 = *a1;
        uint64_t v45 = chip_get_name(a1[2]);
        int v46 = 1;
        expert_log( v44,  1uLL,  (uint64_t)"odometer[%s:%s]: allowing cross-group policy: mix-n-match",  v47,  v48,  v49,  v50,  v51,  v45);
      }

      else
      {
        int v46 = 0;
      }

      if ((odometer_check_fuse( (unint64_t)a1,  (uint64_t)&_odometer_cylinder_production_status,  v38,  v39,  v40,  v41,  v42,  v43) & 1) == 0)
      {
        uint64_t v58 = *a1;
        uint64_t v59 = chip_get_name(a1[2]);
        expert_log( v58,  1uLL,  (uint64_t)"odometer[%s:%s]: allowing cross-group policy: production status",  v60,  v61,  v62,  v63,  v64,  v59);
        ++v46;
      }

      if (odometer_check_fuse( (unint64_t)a1,  (uint64_t)&_odometer_cylinder_engineering_use,  v52,  v53,  v54,  v55,  v56,  v57))
      {
        uint64_t v65 = *a1;
        uint64_t v66 = chip_get_name(a1[2]);
        expert_log( v65,  1uLL,  (uint64_t)"odometer[%s:%s]: allowing cross-group policy: engineering use",  v67,  v68,  v69,  v70,  v71,  v66);
        ++v46;
      }

      if (!*(void *)(v10 + 24))
      {
        uint64_t v72 = *a1;
        uint64_t v73 = chip_get_name(a1[2]);
        int v46 = 1;
        expert_log( v72,  1uLL,  (uint64_t)"odometer[%s:%s]: allowing cross-group policy: full security",  v74,  v75,  v76,  v77,  v78,  v73);
      }

      if (v10 >= v10 + 264) {
        goto LABEL_45;
      }
      uint64_t property_version = expert_query_property_version(v9, v10, a3, (uint64_t)v96);
      if (!(_DWORD)property_version)
      {
        if (v46)
        {
          uint64_t v88 = *a1;
          uint64_t v89 = chip_get_name(a1[2]);
          expert_log( v88,  1uLL,  (uint64_t)"odometer[%s:%s]: allowing cross-group version comparison",  v90,  v91,  v92,  v93,  v94,  v89);
          uint64_t v95 = _odometer_enforce_version_xgroup;
          if (!a4) {
            goto LABEL_42;
          }
        }

        else
        {
          uint64_t v95 = _odometer_enforce_version;
          if (!a4) {
            goto LABEL_42;
          }
        }

        if (a4 + 104 < a4)
        {
LABEL_45:
          __break(0x5519u);
LABEL_46:
          __panic_npx( "panic: unreachable case: %s = 0x%llx",  a2,  a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  (char)"p->p_type->pt_switchable");
        }

uint64_t _odometer_enforce_version( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return property_constrain_version(a2, *a1, a3, a4, a5, a6, a7, a8);
}

uint64_t _odometer_enforce_version_xgroup( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = property_constrain_version(a2, *a1, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)v11)
  {
    if (*(_DWORD *)(a3 + 100) == *(_DWORD *)(a4 + 100))
    {
      uint64_t v12 = *a1;
      uint64_t name = chip_get_name(a1[2]);
      expert_log( v12,  1uLL,  (uint64_t)"odometer[%s]: versions directly comparable; allowing enforcement decision to stand",
        v14,
        v15,
        v16,
        v17,
        v18,
        name);
    }

    else
    {
      return 0LL;
    }
  }

  return v11;
}

double odometer_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = a4;
  *(_DWORD *)(a1 + 24) = -1;
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(void *)(a1 + 144) = 0LL;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(void *)(a1 + 232) = 0LL;
  *(void *)(a1 + 320) = 0LL;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_BYTE *)(a1 + 440) = 0;
  *(_BYTE *)(a1 + 442) = 0;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 480) = 0u;
  *(_OWORD *)(a1 + 496) = 0u;
  *(_OWORD *)(a1 + 512) = 0u;
  *(void *)(a1 + 528) = 0LL;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 616) = 0u;
  *(_OWORD *)(a1 + 632) = 0u;
  *(_OWORD *)(a1 + 584) = 0u;
  *(_OWORD *)(a1 + 600) = 0u;
  *(_OWORD *)(a1 + 552) = 0u;
  *(_OWORD *)(a1 + 568) = 0u;
  *(_OWORD *)(a1 + 536) = 0u;
  *(_OWORD *)(a1 + 840) = 0u;
  *(_OWORD *)(a1 + 856) = 0u;
  *(_OWORD *)(a1 + 808) = 0u;
  *(_OWORD *)(a1 + 824) = 0u;
  *(_OWORD *)(a1 + 776) = 0u;
  *(_OWORD *)(a1 + 792) = 0u;
  *(_OWORD *)(a1 + 760) = 0u;
  *(_DWORD *)(a1 + 872) = -1;
  *(_WORD *)(a1 + 972) = 0;
  *(_DWORD *)(a1 + 968) = 0;
  return result;
}

uint64_t odometer_prepare( uint64_t *a1, uint64_t a2, uint64_t constraint, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = 0LL;
  unint64_t v10 = a1 + 122;
  while (1)
  {
    uint64_t v11 = (uint64_t *)_cylinders[v9];
    uint64_t v12 = v11[1];
    if (v12 < 0) {
      goto LABEL_20;
    }
    uint64_t v13 = *v11;
    uint64_t v14 = (unsigned __int8 *)a1 + v12;
    uint64_t constraint = chip_get_constraint(a1[2], *v11, 0LL);
    a2 = a1[2];
    if (v14)
    {
      if (v14 >= (unsigned __int8 *)v10 || v14 < (unsigned __int8 *)a1)
      {
LABEL_19:
        __break(0x5519u);
LABEL_20:
        __panic_npx("panic: invalid offset: %lld", a2, constraint, a4, a5, a6, a7, a8, v12);
      }
    }

    uint64_t property_BOOL = expert_query_property_BOOL(*a1, a2, constraint, v14);
    if ((_DWORD)property_BOOL) {
      break;
    }
    expert_log(*a1, 2uLL, (uint64_t)"queried cylinder: p = %s, v = 0x%x", a4, a5, a6, a7, a8, v13 + 28);
    if (++v9 == 6) {
      return property_BOOL;
    }
  }

  uint64_t v18 = *a1;
  uint64_t name = chip_get_name(a1[2]);
  expert_log( v18,  0LL,  (uint64_t)"odometer[%s]: failed to query odometer cylinder: %s: %d",  v20,  v21,  v22,  v23,  v24,  name);
  return property_BOOL;
}

double odometer_prepare_nonce( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0uLL;
  uint64_t v11 = 0LL;
  nonce_init_copy(&v10, a2, a3, a4, a5, a6, a7, a8);
  double result = *(double *)&v10;
  *(_OWORD *)(a1 + 32) = v10;
  *(void *)(a1 + 48) = v11;
  *(_WORD *)(a1 + 56) = 1;
  return result;
}

__n128 odometer_prepare_nonce_hash(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 152) = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 200) = v4;
  *(_OWORD *)(a1 + 184) = v3;
  *(__n128 *)(a1 + 168) = result;
  *(_WORD *)(a1 + 232) = 1;
  return result;
}

uint64_t odometer_prepare_mix_n_match_god_mode(uint64_t result)
{
  *(_BYTE *)(result + 441) = 1;
  return result;
}

uint64_t odometer_prepare_sideload_mixn_match(uint64_t result)
{
  *(_BYTE *)(result + 442) = 1;
  return result;
}

__n128 odometer_prepare_notarized_manifest_hash(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 448) = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 496) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 512) = v4;
  *(__n128 *)(a1 + 464) = result;
  *(_OWORD *)(a1 + 480) = v3;
  *(_WORD *)(a1 + 528) = 1;
  return result;
}

uint64_t odometer_prepare_mixn_match(uint64_t result, char a2)
{
  *(_BYTE *)(result + 968) = a2;
  return result;
}

uint64_t odometer_update( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = result;
  for (uint64_t i = 0LL; i != 80; i += 8LL)
  {
    uint64_t v12 = *(uint64_t *)((char *)&_property_consumers + i);
    uint64_t v13 = *(void *)v12;
    uint64_t v14 = *(void *)(v12 + 8);
    if (*(void *)v12)
    {
      if ((v14 & 0x8000000000000000LL) == 0) {
        __panic_npx("panic: illegal odometer consumption configuration", v13, a3, a4, a5, a6, a7, a8, v18);
      }
    }

    else if (v14 < 0)
    {
      uint64_t v13 = 0LL;
    }

    else
    {
      unint64_t v15 = *(void *)(v10 + 16);
      uint64_t v16 = (uint64_t *)(v15 + v14);
      if ((unint64_t)v16 >= v15 + 264 || (unint64_t)v16 < v15)
      {
        __break(0x5519u);
        return result;
      }

      uint64_t v13 = *v16;
    }

    __n128 result = property_equal(a2, v13);
    if ((result & 1) != 0 || !*(void *)v12 && (*(void *)(v12 + 8) & 0x8000000000000000LL) != 0)
    {
      __n128 result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v10, a2, a3);
      if (!(_DWORD)result) {
        return result;
      }
    }
  }

  return 1LL;
}

uint64_t odometer_enforce(unint64_t a1)
{
  int chip_boot = odometer_query_chip_boot(a1);
  uint64_t v3 = *(void *)a1;
  uint64_t name = chip_get_name(*(void *)(a1 + 16));
  if (chip_boot)
  {
    expert_log(v3, 1uLL, (uint64_t)"odometer[%s]: expert does not boot chip", v5, v6, v7, v8, v9, name);
  }

  else
  {
    expert_log(v3, 1uLL, (uint64_t)"odometer[%s]: enforcing anti-replay", v5, v6, v7, v8, v9, name);
    __odometer_select_policy(a1, (unint64_t)_anti_replay_policies, 7LL, v38, v39, v40, v41, v42);
    uint64_t v50 = odometer_policy_enforce(v43, a1, v44, v45, v46, v47, v48, v49);
    if ((_DWORD)v50)
    {
      uint64_t v23 = v50;
      uint64_t v51 = *(void *)a1;
      uint64_t v52 = chip_get_name(*(void *)(a1 + 16));
      expert_log(v51, 0LL, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v53, v54, v55, v56, v57, v52);
      goto LABEL_8;
    }
  }

  __odometer_select_policy(a1, (unint64_t)_chain_integrity_policies, 5LL, v10, v11, v12, v13, v14);
  uint64_t v22 = odometer_policy_enforce(v15, a1, v16, v17, v18, v19, v20, v21);
  if ((_DWORD)v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)a1;
    uint64_t v25 = chip_get_name(*(void *)(a1 + 16));
    expert_log(v24, 0LL, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v26, v27, v28, v29, v30, v25);
  }

  else
  {
    if (odometer_policy_enforceable((uint64_t)&_odometer_policy_chain_manifest)
      || (uint64_t v72 = odometer_policy_enforce((uint64_t)&_odometer_policy_chain_manifest, a1, v58, v59, v60, v61, v62, v63),
          !(_DWORD)v72))
    {
      uint64_t v64 = *(void *)a1;
      uint64_t v65 = chip_get_name(*(void *)(a1 + 16));
      expert_log( v64,  1uLL,  (uint64_t)"odometer[%s]: manifest is live and boot chain is intact",  v66,  v67,  v68,  v69,  v70,  v65);
      return 0LL;
    }

    uint64_t v23 = v72;
    uint64_t v73 = *(void *)a1;
    uint64_t v79 = chip_get_name(*(void *)(a1 + 16));
    expert_log(v73, 0LL, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v74, v75, v76, v77, v78, v79);
  }

void __odometer_select_policy( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    goto LABEL_7;
  }
  uint64_t v8 = a3;
  unint64_t v10 = a2 + 8 * a3;
  uint64_t v11 = (uint64_t *)a2;
  while (1)
  {
    if ((unint64_t)v11 >= v10 || (unint64_t)v11 < a2)
    {
      __break(0x5519u);
      return;
    }

    uint64_t v12 = *v11;
    ++v11;
    if (!--v8) {
      goto LABEL_7;
    }
  }

  if (!v12) {
LABEL_7:
  }
    __panic_npx("panic: no anti-replay policy selected", a2, a3, a4, a5, a6, a7, a8, v13);
}

__n128 _odometer_consume_nonce_hash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(unsigned int *)(a3 + 24);
  memset(__n, 0, sizeof(__n));
  *(void *)uint64_t v20 = 0LL;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __n128 v22 = 0u;
  __int128 v23 = 0u;
  if (Img4DecodeGetPropertyData(a4, v5, v20, __n))
  {
    uint64_t v11 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v11, 0LL, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyData: %d", v13, v14, v15, v16, v17, name);
  }

  else
  {
    digest_init((uint64_t)&__n[1], *(const void **)v20, __n[0], v6, v7, v8, v9, v10);
    __int128 v19 = v24;
    *(_OWORD *)(a2 + 96) = v23;
    *(_OWORD *)(a2 + 112) = v19;
    *(_OWORD *)(a2 + 128) = v25;
    __n128 result = v22;
    *(_OWORD *)(a2 + 64) = *(_OWORD *)&__n[1];
    *(__n128 *)(a2 + 80) = result;
    *(_WORD *)(a2 + 144) = 1;
  }

  return result;
}

uint64_t _odometer_consume_nonce_domain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(unsigned int *)(a3 + 24);
  int v14 = 0;
  uint64_t result = Img4DecodeGetPropertyInteger(a4, v5, &v14);
  if ((_DWORD)result)
  {
    uint64_t v7 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v7, 0LL, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyInteger: %d", v9, v10, v11, v12, v13, name);
    return 0xFFFFFFFFLL;
  }

  else
  {
    *(_DWORD *)(a2 + 24) = v14;
  }

  return result;
}

uint64_t _odometer_consume_ephemeral_switch( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _odometer_decode_property((uint64_t *)a2, a3, a4, (BOOL *)(a2 + 760), a5, a6, a7, a8);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  *(_WORD *)(a2 + 864) = 1;
  return result;
}

uint64_t _odometer_decode_property( uint64_t *a1, uint64_t a2, uint64_t *a3, BOOL *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(unsigned int *)(a2 + 24);
  LODWORD(__n) = 0;
  *(void *)uint64_t v48 = 0LL;
  switch(**(void **)(a2 + 40))
  {
    case 0LL:
      uint64_t PropertyBoolean = Img4DecodeGetPropertyBoolean((uint64_t)a3, v9, a4);
      if ((_DWORD)PropertyBoolean)
      {
        uint64_t v13 = *a1;
        uint64_t name = chip_get_name(a1[2]);
        expert_log(v13, 0LL, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyBoolean: %d", v15, v16, v17, v18, v19, name);
      }

      return PropertyBoolean;
    case 1LL:
      uint64_t PropertyBoolean = Img4DecodeGetPropertyInteger((uint64_t)a3, v9, a4);
      if ((_DWORD)PropertyBoolean)
      {
        uint64_t v21 = *a1;
        uint64_t v46 = chip_get_name(a1[2]);
        expert_log(v21, 0LL, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyInteger: %d", v22, v23, v24, v25, v26, v46);
      }

      return PropertyBoolean;
    case 2LL:
      uint64_t PropertyBoolean = Img4DecodeGetPropertyInteger64((uint64_t)a3, v9, (unint64_t *)a4);
      if ((_DWORD)PropertyBoolean)
      {
        uint64_t v27 = *a1;
        uint64_t v47 = chip_get_name(a1[2]);
        expert_log(v27, 0LL, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyInteger64: %d", v28, v29, v30, v31, v32, v47);
      }

      return PropertyBoolean;
    case 3LL:
      uint64_t result = Img4DecodeGetPropertyData(a3, v9, v48, &__n);
      if ((_DWORD)result) {
        goto LABEL_14;
      }
      if (a4 && a4 + 80 < a4) {
        goto LABEL_21;
      }
      digest_init((uint64_t)a4, *(const void **)v48, __n, v33, v34, v35, v36, v37);
      return 0LL;
    case 4LL:
      uint64_t result = Img4DecodeGetPropertyData(a3, v9, v48, &__n);
      if ((_DWORD)result)
      {
LABEL_14:
        uint64_t v38 = result;
        uint64_t v39 = *a1;
        uint64_t v40 = chip_get_name(a1[2]);
        expert_log(v39, 0LL, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyData: %d", v41, v42, v43, v44, v45, v40);
        return v38;
      }

      if (!a4 || a4 + 104 >= a4)
      {
        version_init((uint64_t)a4, *(char **)v48, __n);
        return 0LL;
      }

LABEL_21:
      __break(0x5519u);
      return result;
    default:
      __panic_npx( "panic: unreachable case: %s = 0x%llx",  v9,  (uint64_t)a3,  (uint64_t)a4,  a5,  a6,  a7,  a8,  (char)"p->p_type->pt_switchable");
  }

uint64_t _odometer_consume_ephemeral_nonce_domain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(unsigned int *)(a3 + 24);
  int v14 = 0;
  uint64_t result = Img4DecodeGetPropertyInteger(a4, v5, &v14);
  if ((_DWORD)result)
  {
    uint64_t v7 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v7, 0LL, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyInteger: %d", v9, v10, v11, v12, v13, name);
    return 0xFFFFFFFFLL;
  }

  else
  {
    *(_DWORD *)(a2 + 872) = v14;
  }

  return result;
}

__n128 _odometer_consume_ephemeral_nonce_hash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(unsigned int *)(a3 + 24);
  memset(__n, 0, sizeof(__n));
  *(void *)uint64_t v20 = 0LL;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __n128 v22 = 0u;
  __int128 v23 = 0u;
  if (Img4DecodeGetPropertyData(a4, v5, v20, __n))
  {
    uint64_t v11 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v11, 0LL, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyData: %d", v13, v14, v15, v16, v17, name);
  }

  else
  {
    digest_init((uint64_t)&__n[1], *(const void **)v20, __n[0], v6, v7, v8, v9, v10);
    __int128 v19 = v24;
    *(_OWORD *)(a2 + 912) = v23;
    *(_OWORD *)(a2 + 928) = v19;
    *(_OWORD *)(a2 + 944) = v25;
    __n128 result = v22;
    *(_OWORD *)(a2 + 880) = *(_OWORD *)&__n[1];
    *(__n128 *)(a2 + 896) = result;
    *(_WORD *)(a2 + 960) = 1;
  }

  return result;
}

uint64_t _odometer_consume_chain_hash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = *(unsigned int *)(a3 + 24);
  LODWORD(__n) = 0;
  *(void *)__int128 v19 = 0LL;
  if (Img4DecodeGetPropertyData(a4, v5, v19, &__n))
  {
    uint64_t v11 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v11, 0LL, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyData: %d", v13, v14, v15, v16, v17, name);
    return 0xFFFFFFFFLL;
  }

  else
  {
    digest_init(a2 + 240, *(const void **)v19, __n, v6, v7, v8, v9, v10);
    uint64_t result = 0LL;
    *(_WORD *)(a2 + 320) = 1;
  }

  return result;
}

uint64_t _odometer_consume_mixn_match(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(unsigned int *)(a3 + 24);
  BOOL v14 = 0;
  uint64_t result = Img4DecodeGetPropertyBoolean(a4, v5, &v14);
  if ((_DWORD)result)
  {
    uint64_t v7 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    expert_log(v7, 0LL, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyBoolean: %d", v9, v10, v11, v12, v13, name);
    return 0xFFFFFFFFLL;
  }

  else
  {
    *(_BYTE *)(a2 + 440) = v14;
  }

  return result;
}

uint64_t _odometer_consume_pivot( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _odometer_decode_property((uint64_t *)a2, a3, a4, (BOOL *)(a2 + 328), a5, a6, a7, a8);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  *(_WORD *)(a2 + 432) = 1;
  return result;
}

uint64_t _odometer_consume_static_lifetime(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = a2[2] + 232;
  for (char i = 1; ; char i = 0)
  {
    char v10 = i;
    if (property_equal(a3, *(void *)(v8 + 8 * v7))) {
      break;
    }
    uint64_t v7 = 1LL;
    if ((v10 & 1) == 0) {
      return 0xFFFFFFFFLL;
    }
  }

  uint64_t result = _odometer_decode_property(a2, a3, a4, (BOOL *)&a2[14 * v7 + 67], v11, v12, v13, v14);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  LOWORD(a2[14 * v7 + 80]) = 1;
  return result;
}

uint64_t DEREncoderAddImage4Tag(uint64_t *a1, char *__s)
{
  if (strlen(__s) != 4) {
    __panic_npx("panic: invalid Image4 tag: %s", v4, v5, v6, v7, v8, v9, v10, (char)__s);
  }
  return DEREncoderAddData(a1, 0, 0x16u, __s, 4u, 0);
}

uint64_t DEREncoderAddUInt(uint64_t *a1, unint64_t a2)
{
  return DEREncoderAddUInt64(a1, 0, 2u, a2);
}

uint64_t DEREncoderAddString(uint64_t *a1, char *__s)
{
  unsigned int v4 = strlen(__s);
  return DEREncoderAddData(a1, 0, 0x16u, __s, v4, 0);
}

uint64_t DEREncoderAddOctetString(uint64_t *a1, const void *a2, unsigned int a3)
{
  return DEREncoderAddDataNoCopy(a1, 0, 4u, a2, a3, 0);
}

uint64_t DEREncoderAddSequence(uint64_t *a1, const void *a2, unsigned int a3)
{
  return DEREncoderAddData(a1, 0, 0x10u, a2, a3, 1);
}

uint64_t DEREncoderAddContextual(uint64_t *a1, unsigned int a2, const void *a3, unsigned int a4)
{
  return DEREncoderAddData(a1, 2u, a2, a3, a4, 1);
}

uint64_t DEREncoderAddNull(uint64_t *a1)
{
  return DEREncoderAddData(a1, 0, 5u, 0LL, 0, 0);
}

uint64_t DEREncoderAddImage4Property(uint64_t *a1, char *__s, uint64_t *a3)
{
  BOOL v103 = 0;
  unint64_t v102 = 0LL;
  unsigned int v101 = 0;
  uint64_t v100 = 0LL;
  if (strlen(__s) != 4) {
LABEL_31:
  }
    __panic_npx("panic: four-character codes must be four characters long", v6, v7, v8, v9, v10, v11, v12, v99);
  if (__s + 5 < __s)
  {
LABEL_30:
    __break(0x5519u);
    goto LABEL_31;
  }

  unsigned int v13 = *(_DWORD *)__s;
  uint64_t v14 = (uint64_t *)DEREncoderCreate(0);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = DEREncoderAddImage4Tag(v14, __s);
    if ((_DWORD)v16)
    {
      uint64_t v24 = v16;
      uint64_t v25 = log_expert(v16);
      expert_log(v25, 2uLL, (uint64_t)"DEREncoderAddImage4TagUInt32: %d", v26, v27, v28, v29, v30, v24);
LABEL_28:
      DEREncoderDestroy((void **)v15);
      return v24;
    }

    uint64_t v37 = bswap32(v13);
    switch(a3[2])
    {
      case 1LL:
        uint64_t PropertyBoolean = Img4DecodeGetPropertyBoolean((uint64_t)a3, v37, &v103);
        if ((_DWORD)PropertyBoolean)
        {
          uint64_t v39 = PropertyBoolean;
          uint64_t v40 = log_expert(PropertyBoolean);
          expert_log(v40, 2uLL, (uint64_t)"Img4DecodeGetPropertyBoolean: %d", v41, v42, v43, v44, v45, v39);
          goto LABEL_16;
        }

        uint64_t v70 = DEREncoderAddBoolean(v15, v103);
        if (!(_DWORD)v70) {
          goto LABEL_26;
        }
        uint64_t v55 = v70;
        uint64_t v71 = log_expert(v70);
        expert_log(v71, 2uLL, (uint64_t)"DEREncoderAddBoolean: %d", v72, v73, v74, v75, v76, v55);
        goto LABEL_25;
      case 2LL:
        uint64_t PropertyInteger64 = Img4DecodeGetPropertyInteger64((uint64_t)a3, v37, &v102);
        if ((_DWORD)PropertyInteger64)
        {
          uint64_t v63 = PropertyInteger64;
          uint64_t v64 = log_expert(PropertyInteger64);
          expert_log(v64, 2uLL, (uint64_t)"Img4DecodeGetPropertyInteger64: %d", v65, v66, v67, v68, v69, v63);
          goto LABEL_16;
        }

        uint64_t v84 = DEREncoderAddUInt64(v15, 0, 2u, v102);
        if (!(_DWORD)v84) {
          goto LABEL_26;
        }
        uint64_t v55 = v84;
        uint64_t v85 = log_expert(v84);
        expert_log(v85, 2uLL, (uint64_t)"DEREncoderAddUInt64: %d", v86, v87, v88, v89, v90, v55);
        goto LABEL_25;
      case 4LL:
        uint64_t PropertyData = Img4DecodeGetPropertyData(a3, v37, &v100, &v101);
        if ((_DWORD)PropertyData)
        {
          uint64_t v47 = PropertyData;
          uint64_t v48 = log_expert(PropertyData);
          expert_log(v48, 2uLL, (uint64_t)"Img4DecodeGetPropertyData: %d", v49, v50, v51, v52, v53, v47);
LABEL_16:
          uint64_t v24 = 3LL;
          goto LABEL_28;
        }

        uint64_t v8 = (uint64_t)v100;
        uint64_t v9 = v101;
        if (!v100 || v101)
        {
          uint64_t v77 = DEREncoderAddDataNoCopy(v15, 0, 4u, v100, v101, 0);
          if ((_DWORD)v77)
          {
            uint64_t v55 = v77;
            uint64_t v78 = log_expert(v77);
            expert_log(v78, 2uLL, (uint64_t)"DEREncoderAddOctetString: %d", v79, v80, v81, v82, v83, v55);
LABEL_25:
            uint64_t v24 = v55;
          }

          else
          {
LABEL_26:
            uint64_t v91 = DEREncoderAddPrivateFromEncoder((uint64_t **)v15, a1, v37);
            uint64_t v24 = v91;
            if ((_DWORD)v91)
            {
              uint64_t v92 = log_expert(v91);
              expert_log(v92, 2uLL, (uint64_t)"DEREncoderAddPrivateFromEncoder: %d", v93, v94, v95, v96, v97, v24);
            }
          }

          goto LABEL_28;
        }

        break;
      case 5LL:
        uint64_t v54 = DEREncoderAddData(v15, 0, 5u, 0LL, 0, 0);
        if (!(_DWORD)v54) {
          goto LABEL_26;
        }
        uint64_t v55 = v54;
        uint64_t v56 = log_expert(v54);
        expert_log(v56, 2uLL, (uint64_t)"DEREncoderAddNull: %d", v57, v58, v59, v60, v61, v55);
        goto LABEL_25;
      default:
        __panic_npx("panic: unreachable", v17, v18, v19, v20, v21, v22, v23, v99);
    }

    goto LABEL_30;
  }

  uint64_t v31 = log_expert(0LL);
  uint64_t v24 = 2LL;
  expert_log(v31, 2uLL, (uint64_t)"DEREncoderCreate: %d", v32, v33, v34, v35, v36, 2LL);
  return v24;
}

void DEREncoderDestroyAndZero(void ***a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    DEREncoderDestroy(v2);
    *a1 = 0LL;
  }

size_t DEREncoderEncodeImage4Dictionary(uint64_t *a1, char *__s, uint64_t **a3)
{
  size_t result = strlen(__s);
  if (result != 4) {
    __panic_npx("panic: four-character codes must be four characters long", v7, v8, v9, v10, v11, v12, v13, v18);
  }
  if (__s + 5 < __s)
  {
    __break(0x5519u);
  }

  else
  {
    unsigned int v14 = *(_DWORD *)__s;
    uint64_t v15 = (uint64_t *)DEREncoderCreate(0);
    if (!v15) {
      return 2LL;
    }
    uint64_t v16 = v15;
    uint64_t v17 = DEREncoderAddImage4Tag(v15, __s);
    if (!(_DWORD)v17)
    {
      uint64_t v17 = DEREncoderAddSetFromEncoder(a3, v16);
      if (!(_DWORD)v17) {
        uint64_t v17 = DEREncoderAddPrivateFromEncoder((uint64_t **)v16, a1, bswap32(v14));
      }
    }

    DEREncoderDestroy((void **)v16);
    return v17;
  }

  return result;
}

uint64_t DEREncoderCreateImage4Dictionary(char *a1, uint64_t **a2, uint64_t **a3)
{
  uint64_t v6 = (uint64_t *)DEREncoderCreate(0);
  if (!v6) {
    return 2LL;
  }
  uint64_t v7 = v6;
  size_t v8 = DEREncoderEncodeImage4Dictionary(v6, a1, a2);
  if ((_DWORD)v8) {
    DEREncoderDestroy((void **)v7);
  }
  else {
    *a3 = v7;
  }
  return v8;
}

size_t cstring_init_with_string(uint64_t a1, char *__s)
{
  size_t result = strlen(__s);
  if (&__s[result + 1] < __s)
  {
    __break(0x5519u);
  }

  else
  {
    size_t v5 = strnlen(__s, result + 1);
    size_t v6 = v5;
    if (v5 >= 0x3F) {
      uint64_t v7 = 63LL;
    }
    else {
      uint64_t v7 = v5;
    }
    strlcpy((char *)a1, __s, v7 + 1);
    *(void *)(a1 + 64) = v7;
    *(void *)(a1 + 72) = v6;
    return a1;
  }

  return result;
}

uint64_t cstring_init_with_buff(uint64_t a1, char *__s1, size_t __n)
{
  size_t v5 = strnlen(__s1, __n);
  size_t v6 = v5;
  if (v5 >= 0x3F) {
    uint64_t v7 = 63LL;
  }
  else {
    uint64_t v7 = v5;
  }
  strlcpy((char *)a1, __s1, v7 + 1);
  *(void *)(a1 + 64) = v7;
  *(void *)(a1 + 72) = v6;
  return a1;
}

unint64_t _boot_static_enforceable(uint64_t a1, uint64_t *a2)
{
  unint64_t result = a2[2];
  if (!*(void *)(result + 232))
  {
    uint64_t v3 = 1LL;
    unsigned int v4 = "odometer[%s:%s]: chip has no properties for policy";
    goto LABEL_5;
  }

  if (!*(void *)(result + 160))
  {
    uint64_t v3 = 0LL;
    unsigned int v4 = "odometer[%s:%s]: policy is enforceable";
LABEL_5:
    uint64_t v5 = *a2;
    uint64_t name = chip_get_name(result);
    expert_log(v5, 1uLL, (uint64_t)v4, v7, v8, v9, v10, v11, name);
    return v3;
  }

  if (result < result + 264)
  {
    char v12 = chip_get_name(result);
    __panic_npx( "panic: illegal chip definition: anti-replay and static lifetime policies defined: %s",  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v12);
  }

  __break(0x5519u);
  return result;
}

uint64_t _boot_static_enforce( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = a2[2];
  if ((odometer_check_fuse((unint64_t)a2, (uint64_t)&_odometer_cylinder_internal_use, a3, a4, a5, a6, a7, a8) & 1) != 0)
  {
    uint64_t v15 = "odometer[%s:%s]: internal use-only unit entitlement found";
LABEL_13:
    uint64_t v25 = *a2;
    uint64_t name = chip_get_name(a2[2]);
    expert_log(v25, 1uLL, (uint64_t)v15, v27, v28, v29, v30, v31, name);
    return 0LL;
  }

  else
  {
    uint64_t v16 = 0LL;
    uint64_t v17 = v10 + 232;
    char v18 = 1;
    uint64_t v15 = "odometer[%s:%s]: manifest is current";
    while (1)
    {
      uint64_t v19 = *(void *)(v17 + 8 * v16);
      char v20 = v18;
      uint64_t v21 = (uint64_t)&a2[14 * v16 + 67];
      BOOL v22 = !v19 || *(_WORD *)(v21 + 104) == 0;
      if (!v22 && v21 != 0)
      {
        uint64_t v24 = odometer_enforce_property(a2, a1, v19, (unsigned __int8 *)v21, v11, v12, v13, v14);
        if ((_DWORD)v24) {
          break;
        }
      }

      char v18 = 0;
      uint64_t v16 = 1LL;
      if ((v20 & 1) == 0) {
        goto LABEL_13;
      }
    }

    uint64_t v32 = v24;
    uint64_t v34 = *a2;
    uint64_t v35 = chip_get_name(a2[2]);
    expert_log(v34, 0LL, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v36, v37, v38, v39, v40, v35);
  }

  return v32;
}

uint64_t _boot_live_enforceable(uint64_t a1, uint64_t a2)
{
  if (odometer_policy_get_chip_property(a1, *(void *)(a2 + 16)))
  {
    int v3 = *(unsigned __int16 *)(a2 + 144);
    uint64_t v4 = *(void *)a2;
    uint64_t name = chip_get_name(*(void *)(a2 + 16));
    if (v3)
    {
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, name);
      return 0LL;
    }

    else
    {
      uint64_t v11 = 1LL;
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: manifest has no constraint for policy", v6, v7, v8, v9, v10, name);
    }
  }

  else
  {
    uint64_t v12 = *(void *)a2;
    uint64_t v13 = chip_get_name(*(void *)(a2 + 16));
    uint64_t v11 = 1LL;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, v13);
  }

  return v11;
}

uint64_t _boot_live_enforce(uint64_t a1, uint64_t a2)
{
  v91[3] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)a2;
  uint64_t chip_property = odometer_policy_get_chip_property(a1, *(void *)(a2 + 16));
  if (!*(_WORD *)(a2 + 144)) {
    __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v86);
  }
  uint64_t v13 = chip_property;
  uint64_t v14 = *(void **)(a2 + 16);
  uint64_t v15 = *(unsigned int *)(a2 + 24);
  memset(v91, 0, 24);
  memset(v90, 0, sizeof(v90));
  memset(v89, 0, sizeof(v89));
  size_t __n = 64LL;
  uint64_t live_nonce = odometer_query_live_nonce(a2, a1, v15, v91, v9, v10, v11, v12);
  if ((_DWORD)live_nonce != 6)
  {
    uint64_t v17 = live_nonce;
    if ((_DWORD)live_nonce)
    {
      uint64_t v61 = *(void *)a2;
      uint64_t name = chip_get_name(*(void *)(a2 + 16));
      expert_log(v61, 0LL, (uint64_t)"odometer[%s:%s]: failed to query nonce: %d", v63, v64, v65, v66, v67, name);
      goto LABEL_16;
    }

    uint64_t v18 = expert_entangle_nonce(v4, (uint64_t)v14, v15, (uint64_t)v91, (uint64_t)v90);
    if ((_DWORD)v18)
    {
      uint64_t v17 = v18;
      uint64_t v19 = *(void *)a2;
      uint64_t v20 = chip_get_name(*(void *)(a2 + 16));
      expert_log(v19, 0LL, (uint64_t)"odometer[%s:%s]: failed to entangle nonce: %d", v21, v22, v23, v24, v25, v20);
      goto LABEL_16;
    }

    odometer_compute_nonce_hash(v4, v14, (uint64_t)v90, (uint64_t)v89);
LABEL_14:
    if (!property_constrain_digest(v13, v4, a2 + 64, (unint64_t)v89, v68, v69, v70, v71))
    {
      uint64_t v79 = *(void *)a2;
      uint64_t v80 = chip_get_name(*(void *)(a2 + 16));
      expert_log(v79, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is current", v81, v82, v83, v84, v85, v80);
      return 0LL;
    }

    uint64_t v17 = *(unsigned int *)(a1 + 24);
    uint64_t v72 = *(void *)a2;
    uint64_t v73 = chip_get_name(*(void *)(a2 + 16));
    expert_log(v72, 0LL, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v74, v75, v76, v77, v78, v73);
LABEL_16:
    return v17;
  }

  uint64_t v33 = *(void *)a2;
  uint64_t v34 = chip_get_name(*(void *)(a2 + 16));
  expert_log( v33,  1uLL,  (uint64_t)"odometer[%s:%s]: nonce is bootstrapping; using boot nonce hash",
    v35,
    v36,
    v37,
    v38,
    v39,
    v34);
  uint64_t v47 = v14[21];
  if (!v47) {
    __panic_npx("panic: illegal chip/expert configuration", v40, v41, v42, v43, v44, v45, v46, v87);
  }
  uint64_t result = expert_read_boot_manifest(v4, v47 + 28, (uint64_t)v89 + 8, (uint64_t)&__n);
  if ((_DWORD)result)
  {
    uint64_t v17 = result;
    uint64_t v54 = *(void *)a2;
    uint64_t v55 = chip_get_name(*(void *)(a2 + 16));
    expert_log(v54, 0LL, (uint64_t)"odometer[%s:%s]: failed to query boot nonce hash: %d", v56, v57, v58, v59, v60, v55);
    goto LABEL_16;
  }

  if (__n <= 0x40)
  {
    digest_init((uint64_t)v89, (char *)v89 + 8, __n, v49, v50, v51, v52, v53);
    goto LABEL_14;
  }

  __break(0x5519u);
  return result;
}

uint64_t image4_environment_copy_nonce_digest(uint64_t a1, void *a2, size_t *a3)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 8);
  memset(__src, 0, sizeof(__src));
  size_t __n = 64LL;
  uint64_t v7 = image4_environment_resolve(a1);
  if (v7)
  {
    uint64_t v13 = (int *)v7;
    int nonce_domain = image4_environment_get_nonce_domain(a1);
    uint64_t v15 = darwin_syscall_nonce_copy_hash(v6, v13, nonce_domain, __src, &__n);
    if ((_DWORD)v15)
    {
      uint64_t v23 = v15;
    }

    else
    {
      size_t v24 = __n;
      if (__n <= 0x40)
      {
        memcpy(a2, __src, __n);
        uint64_t v23 = 0LL;
        *a3 = v24;
      }

      else
      {
        return 84LL;
      }
    }
  }

  else
  {
    uint64_t v23 = 45LL;
    expert_log(v6, 0LL, (uint64_t)"failed to resolve chip environment: %d", v8, v9, v10, v11, v12, 45LL);
  }

  return v23;
}

uint64_t image4_environment_roll_nonce(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = image4_environment_resolve(a1);
  if (v3)
  {
    uint64_t v9 = (int *)v3;
    int nonce_domain = image4_environment_get_nonce_domain(a1);
    uint64_t v11 = darwin_syscall_nonce_roll(v2, v9, nonce_domain);
    uint64_t v19 = v11;
  }

  else
  {
    uint64_t v19 = 45LL;
    expert_log(v2, 0LL, (uint64_t)"failed to resolve chip environment: %d", v4, v5, v6, v7, v8, 45LL);
  }

  return v19;
}

uint64_t image4_environment_generate_nonce_proposal( uint64_t a1, void *a2, size_t *a3, char *a4, unint64_t *a5)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v10 = *(void *)(a1 + 8);
  memset(__src, 0, sizeof(__src));
  size_t __n = 64LL;
  uint64_t v11 = image4_environment_resolve(a1);
  if (v11)
  {
    uint64_t v17 = (_DWORD *)v11;
    int nonce_domain = image4_environment_get_nonce_domain(a1);
    uint64_t v19 = darwin_syscall_nonce_generate_proposal(v10, v17, nonce_domain, __src, &__n, a4, a5);
    if ((_DWORD)v19)
    {
      uint64_t v27 = v19;
    }

    else
    {
      size_t v28 = __n;
      if (__n <= 0x40)
      {
        memcpy(a2, __src, __n);
        uint64_t v27 = 0LL;
        *a3 = v28;
      }

      else
      {
        return 84LL;
      }
    }
  }

  else
  {
    uint64_t v27 = 45LL;
    expert_log(v10, 0LL, (uint64_t)"failed to resolve chip environment: %d", v12, v13, v14, v15, v16, 45LL);
  }

  return v27;
}

uint64_t image4_environment_commit_nonce_proposal(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 8);
  memset(v22, 0, sizeof(v22));
  uint64_t v21 = 64LL;
  uint64_t v3 = image4_environment_resolve(a1);
  if (v3)
  {
    uint64_t v9 = (int *)v3;
    int nonce_domain = image4_environment_get_nonce_domain(a1);
    uint64_t v11 = darwin_syscall_nonce_peek_hash(v2, v9, nonce_domain, v22, &v21);
    uint64_t v19 = v11;
    if (!(_DWORD)v11)
    {
      uint64_t v11 = darwin_syscall_nonce_roll(v2, v9, nonce_domain);
      uint64_t v19 = v11;
    }
  }

  else
  {
    uint64_t v19 = 45LL;
    expert_log(v2, 0LL, (uint64_t)"failed to resolve chip environment: %d", v4, v5, v6, v7, v8, 45LL);
  }

  return v19;
}

unint64_t image4_environment_flash(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, size_t *a5)
{
  __src[2] = *MEMORY[0x1895F89C0];
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v37 = 0LL;
  __src[0] = 0LL;
  memset(v36, 0, sizeof(v36));
  __src[1] = 0LL;
  size_t __n = 16LL;
  unint64_t result = image4_environment_resolve(a1);
  if (!result)
  {
    uint64_t v27 = 45LL;
    expert_log(v9, 0LL, (uint64_t)"failed to resolve chip environment: %d", v11, v12, v13, v14, v15, 45LL);
    return v27;
  }

  unint64_t v16 = result;
  if (!*(void *)(result + 80))
  {
    if (result >= result + 264) {
      goto LABEL_14;
    }
    uint64_t name = chip_get_name(result);
    uint64_t v27 = 45LL;
    expert_log(v9, 0LL, (uint64_t)"%s: chip has no associated dfu policy: %d", v29, v30, v31, v32, v33, name);
    return v27;
  }

  buff_init_wrap(v36, a2, a3);
  unint64_t result = darwin_syscall_image_dfu(v9, *(int **)(v16 + 80), (uint64_t *)v36, __src, &__n, v17, v18, v19);
  if ((_DWORD)result)
  {
    uint64_t v27 = result;
    return v27;
  }

  if (!a4) {
    return 0LL;
  }
  size_t v34 = __n;
  if (__n <= 0x10)
  {
    memcpy(a4, __src, __n);
    uint64_t v27 = 0LL;
    *a5 = v34;
    return v27;
  }

uint64_t img4_firmware_new_from_fd_4MSM(char *a1, uint64_t a2, unsigned int a3, int *a4, uint64_t a5)
{
  uint64_t expert = img4_runtime_get_expert(a1);
  int v17 = 0;
  uint64_t v16 = 0LL;
  uint64_t v11 = *a4;
  uint64_t v12 = _expert_alloc_type(expert, (uint64_t)&_image4_type_firmware);
  img4_firmware_init_sentinel((void *)v12, (uint64_t)a1, a5);
  fourcc_init((uint64_t)&v16, a3);
  *(void *)(v12 + 16) = &_image4_type_firmware;
  uint64_t inited = payload_init_empty(v12 + 56, expert, (unsigned int *)&v16);
  *(void *)(v12 + 48) = inited;
  uint64_t v14 = *(void *)(a2 + 16);
  *(_OWORD *)(v12 + 24) = *(_OWORD *)a2;
  *(void *)(v12 + 40) = v14;
  payload_set_callbacks(inited, (uint64_t)img4_firmware_new_from_fd_4MSM_callbacks, v11);
  *a4 = -1;
  return v12;
}

uint64_t _fd_measure(uint64_t *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  uint64_t v7 = (*(uint64_t (**)(void))(a2 + 48))();
  memset(&v81, 0, sizeof(v81));
  memset(v82, 0, sizeof(v82));
  MEMORY[0x1895F8858]( v7,  v8,  (*(void *)(v7 + 8) + *(void *)(v7 + 16) + 19LL) & 0xFFFFFFFFFFFFFFF8LL,  v9,  v10,  v11,  v12,  v13);
  uint64_t v16 = (char *)&v76 - v15;
  if (v17 >= 8) {
    memset((char *)&v76 - v15, 170, v14);
  }
  ccdigest_init();
  uint64_t v78 = a3;
  uint64_t v79 = &v76;
  if (a4 < 0)
  {
    size_t v30 = 0LL;
    uint64_t v23 = 0LL;
    goto LABEL_9;
  }

  uint64_t v23 = malloc(0x40000uLL);
  if (v23)
  {
    if (fstat(a4, &v81))
    {
      int v24 = *__error();
      expert_log(*a1, 0LL, (uint64_t)"%s: fstat: %d", v25, v26, v27, v28, v29, a1[1] + 4);
      if (v24) {
        goto LABEL_7;
      }
    }

    else
    {
      unint64_t v33 = 0LL;
      uint64_t v77 = 0LL;
      st_uint64_t size = v81.st_size;
      while (1)
      {
        while (1)
        {
          memset(v80, 0, 40);
          if (st_size >= 0x40000) {
            size_t v35 = 0x40000LL;
          }
          else {
            size_t v35 = st_size;
          }
          ssize_t v36 = read(a4, v23, v35);
          if (v36 < 0) {
            goto LABEL_26;
          }
          ssize_t v42 = v36;
          if (v36 > 0x40000) {
            goto LABEL_25;
          }
          buff_init_wrap_signed(v80, (uint64_t)v23, v36, v37, v38, v39, v40, v41);
          if (v42 != v35) {
            break;
          }
          uint64_t length_signed = buff_get_length_signed((uint64_t)v80, v43, v44, v45, v46, v47, v48, v49);
          st_size -= v80[1];
          expert_log(*a1, 2uLL, (uint64_t)"%s: left to read = %lu", v51, v52, v53, v54, v55, a1[1] + 4);
          uint64_t v56 = *a1;
          uint64_t v57 = a1[1] + 4;
          v77 += length_signed;
          expert_log(v56, 2uLL, (uint64_t)"%s: cur offset = %lld", v58, v59, v60, v61, v62, v57);
          ccdigest_update();
          unint64_t v33 = 0LL;
          if (!st_size) {
            goto LABEL_23;
          }
        }

        if (v42)
        {
          int v70 = 5;
          expert_log( *a1,  0LL,  (uint64_t)"%s: read: bad read: actual = %ld, requested = %lu, chunk length = %lu: %d",  v45,  v46,  v47,  v48,  v49,  a1[1] + 4);
          goto LABEL_29;
        }

        expert_log(*a1, 2uLL, (uint64_t)"%s: stall while reading file", v45, v46, v47, v48, v49, a1[1] + 4);
        if (v33 >= 3) {
          break;
        }
        ++v33;
        if (!st_size)
        {
LABEL_23:
          if (*(void *)v7 >= 0x41uLL) {
            __panic_npx( "panic: buffer not sufficient for digest: actual = %lu, expected >= %lu",  v63,  v64,  v65,  v66,  v67,  v68,  v69,  64);
          }
          (*(void (**)(uint64_t, char *, _OWORD *))(v7 + 56))(v7, v16, v82);
          size_t v30 = *(void *)v7;
          if (*(void *)v7 < 0x41uLL) {
            goto LABEL_9;
          }
LABEL_25:
          __break(0x5519u);
LABEL_26:
          int v70 = *__error();
          expert_log(*a1, 0LL, (uint64_t)"%s: read: %d", v71, v72, v73, v74, v75, a1[1] + 4);
          goto LABEL_29;
        }
      }

      int v70 = 5;
      expert_log(*a1, 0LL, (uint64_t)"%s: stalled out: %d", v65, v66, v67, v68, v69, a1[1] + 4);
LABEL_29:
      if (v70) {
        goto LABEL_7;
      }
    }

    uint64_t v31 = 0LL;
    goto LABEL_10;
  }

LABEL_7:
  size_t v30 = 0LL;
LABEL_9:
  uint64_t v31 = digest_init(v78, v82, v30, v18, v19, v20, v21, v22);
LABEL_10:
  free(v23);
  return v31;
}

    uint64_t v8 = 1LL;
  }

uint64_t _fd_get_measured_bytes()
{
  return 0LL;
}

uint64_t _fd_dealloc(int a1, int a2)
{
  uint64_t result = close(a2);
  if ((_DWORD)result)
  {
    uint64_t v3 = __error();
    __panic_npx("panic: close%d", v4, v5, v6, v7, v8, v9, v10, *v3);
  }

  return result;
}

uint64_t _prepare_3(uint64_t a1, uint64_t a2)
{
  return odometer_prepare_mixn_match(a2, 1);
}

uint64_t _get_constraint_mask_3()
{
  return 0LL;
}

uint64_t _extract_payload_3()
{
  return 0LL;
}

uint64_t _BootPolicyClosureComputeDigest_2( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(unint64_t ***)(*(void *)(a5 + 32) + 16LL);
  if (*v9 > a4) {
    __panic_npx_0((uint64_t)v9, a2, a1, a4, a5, a6, a7, a8, a4);
  }
  ccdigest();
  return 0LL;
}

uint64_t _BootPolicyClosureVerifyChain_2()
{
  return 0LL;
}

uint64_t _BootPolicyClosureVerifySignature_2()
{
  return 0LL;
}

uint64_t _BootPolicyClosureEvaluateCertificateProperties_2()
{
  return 0LL;
}

uint64_t _get_constraint_mask_4()
{
  return 0LL;
}

uint64_t _extract_payload_4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)(a3 + 584)) {
    __panic_npx_8(a1, a2, a3, a4, (uint64_t)a5, a6, a7, a8, vars0);
  }
  *a5 = *(void *)(a3 + 552);
  return *(void *)(a3 + 544);
}

void __panic_npx_8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  uint64_t v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: optional not set", &a9);
  _os_crash();
  __break(1u);
}

uint64_t dylib_init(uint64_t a1)
{
  uint64_t v2 = generic_expert();
  expert_init(a1);
  darwin_syscall_init(a1);
  return generic_expert_set_specialist((uint64_t)v2, a1, 0LL, v3, v4, v5, v6, v7);
}

size_t dylib_expert_state_init(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  memset(v3, 0, sizeof(v3));
  size_t result = os_parse_boot_arg_string();
  if ((_DWORD)result)
  {
    if (LODWORD(v3[0]) == 3171437) {
      *(void *)(a1 + 16) = a1 + 24;
    }
    size_t result = strlcpy((char *)(a1 + 24), (const char *)v3, 0x20uLL);
    *(void *)(a1 + 8) = a1 + 24;
  }

  return result;
}

uint64_t dylib_expert_call_method( uint64_t a1, unint64_t a2, const void *a3, size_t a4, void *a5, size_t *a6)
{
  uint64_t v12 = expert_runtime_boot(a1);
  if ((_DWORD)v12)
  {
    uint64_t v20 = v12;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for user client call: %d", v15, v16, v17, v18, v19, v12);
    goto LABEL_3;
  }

  uint64_t v28 = darwin_syscall_get(a2, v13, v14, v15, v16, v17, v18, v19);
  if (!v28) {
    return 78LL;
  }
  unint64_t v36 = (unint64_t)v28;
  if (*((_DWORD *)v28 + 9) == 6) {
    return 78LL;
  }
  mach_port_t kmod_connect = dylib_expert_get_kmod_connect(a1, v29, v30, v31, v32, v33, v34, v35);
  if (!kmod_connect)
  {
    expert_log( a1,  1uLL,  (uint64_t)"user client not supported on this target",  v39,  v40,  v41,  v42,  v43,  (uint64_t)outputStruct);
    return 45LL;
  }

  uint64_t result = IOConnectCallMethod(kmod_connect, *(_DWORD *)(v36 + 36), 0LL, 0, a3, a4, 0LL, 0LL, a5, a6);
  if (!(_DWORD)result)
  {
    expert_log(a1, 2uLL, (uint64_t)"user client method success", v44, v45, v46, v47, v48, (uint64_t)outputStructa);
    return 0LL;
  }

  if (((result >> 14) & 0xFFF) != 3)
  {
    expert_log( a1,  0LL,  (uint64_t)"user client method failed: v = %hx, trap = %s, kr = %#x, sys = %#x, sub = %#x, code = %#x",  v44,  v45,  v46,  v47,  v48,  *(unsigned __int8 *)(v36 + 8));
    return 64LL;
  }

  if (v36 < v36 + 40)
  {
    uint64_t v20 = result & 0x3FFF;
    dylib_expert_record_trap_error(a1, v36, (uint64_t)"iokit", v20, v45, v46, v47, v48);
LABEL_3:
    return v20;
  }

  __break(0x5519u);
  return result;
}

uint64_t dylib_expert_record_trap_error( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch((_DWORD)a4)
  {
    case 'T':
      return expert_log( a1,  0LL,  (uint64_t)"bad argument vector provided to kext: v = %hx, how = %s, trap = %s: %d",  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 8));
    case 'W':
      return expert_log( a1,  0LL,  (uint64_t)"kext and dylib are out of sync: v = %hx, how = %s, trap = %s: %d",  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 8));
      return expert_log( a1,  0LL,  (uint64_t)"kext cannot parse argument vector: v = %hx, how = %s, trap = %s: %d",  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 8));
  }

  return expert_log( a1,  0LL,  (uint64_t)"trap failed: v = %hx, how = %s, trap = %s: %d",  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 8));
}

uint64_t dylib_restoreos_logv( unint64_t a1, const char *a2, va_list a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a1 >= 4) {
    __panic_npx("panic: unreachable case: %s = 0x%llx", (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"lvl");
  }
  uint64_t v9 = off_18A3BA528[a1];
  os_unfair_lock_lock((os_unfair_lock_t)&dylib_restoreos_logv_rd_log);
  uint64_t v10 = _restore_log_state_file_locked();
  os_unfair_lock_unlock((os_unfair_lock_t)&dylib_restoreos_logv_rd_log);
  uint64_t v11 = getprogname();
  if (fprintf(v10, "%s: AppleImage4 %s", v11, v9) < 0
    || vfprintf(v10, a2, a3) < 0
    || (uint64_t result = fprintf(v10, "\n"), (result & 0x80000000) != 0))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&dylib_restoreos_logv_rd_log);
    uint64_t v13 = (FILE *)qword_18C79CF68;
    qword_18C79CF68 = 0LL;
    uint64_t v14 = _restore_log_state_file_locked();
    os_unfair_lock_unlock((os_unfair_lock_t)&dylib_restoreos_logv_rd_log);
    uint64_t v15 = getprogname();
    fprintf(v14, "%s: AppleImage4 %s", v15, v9);
    vfprintf(v14, a2, a3);
    uint64_t result = fputc(10, v14);
    if (v13 && v13 != (FILE *)*MEMORY[0x1895F89D0])
    {
      uint64_t result = fclose(v13);
      if ((_DWORD)result == -1) {
        dylib_restoreos_logv_cold_1(&v18, v19);
      }
    }
  }

  return result;
}

FILE *_restore_log_state_file_locked()
{
  uint64_t result = (FILE *)qword_18C79CF68;
  if (qword_18C79CF68) {
    return result;
  }
  uint64_t result = fopen("/dev/console", "w");
  if (result && result >= &result[1]) {
    goto LABEL_22;
  }
  qword_18C79CF68 = (uint64_t)result;
  if (result) {
    return result;
  }
  int v8 = *__error();
  if (v8 == 1 || v8 == 13)
  {
    uint64_t result = (FILE *)*MEMORY[0x1895F89D0];
    if (*MEMORY[0x1895F89D0]) {
      BOOL v10 = (unint64_t)result >= *MEMORY[0x1895F89D0] + 152LL;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10) {
      goto LABEL_22;
    }
    qword_18C79CF68 = *MEMORY[0x1895F89D0];
  }

  else
  {
    if (v8 == 22) {
      goto LABEL_23;
    }
    uint64_t result = (FILE *)*MEMORY[0x1895F89D0];
  }

  if (result) {
    BOOL v11 = result >= &result[1];
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
LABEL_22:
    __break(0x5519u);
LABEL_23:
    __panic_npx("panic: invalid mode trying to open console", v1, v2, v3, v4, v5, v6, v7, v12);
  }

  return result;
}

uint64_t chip_instance_instantiate( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v37 = xmmword_18A3BA8A0;
  uint64_t v38 = -1LL;
  BOOL v11 = property_iterator_next((uint64_t)&v37, a2, a3, a4, a5, a6, a7, a8);
  if (!v11)
  {
    LOBYTE(result) = -1;
    goto LABEL_56;
  }

  uint64_t v19 = (uint64_t)v11;
  unint64_t v20 = a1 + 160;
  while (1)
  {
    unint64_t constraint = chip_get_constraint(a3, v19, 0LL);
    unint64_t v29 = constraint;
    unint64_t v30 = constraint + 104;
    switch(**(void **)(constraint + 40))
    {
      case 0LL:
        uint64_t v31 = *(void *)(constraint + 64);
        if (v31 < 0) {
          goto LABEL_53;
        }
        uint64_t v24 = (unsigned __int8 *)(a1 + v31);
        if (a1 + v31)
        {
        }

        uint64_t result = expert_query_property_BOOL(a2, a3, constraint, v24);
        break;
      case 1LL:
        uint64_t v31 = *(void *)(constraint + 64);
        if (v31 < 0) {
          goto LABEL_53;
        }
        uint64_t v24 = (unsigned __int8 *)(a1 + v31);
        if (a1 + v31)
        {
        }

        uint64_t result = expert_query_property_uint32(a2, a3, constraint, v24);
        break;
      case 2LL:
        uint64_t v31 = *(void *)(constraint + 64);
        if (v31 < 0) {
          goto LABEL_53;
        }
        uint64_t v24 = (unsigned __int8 *)(a1 + v31);
        if (a1 + v31)
        {
        }

        uint64_t result = expert_query_property_uint64(a2, a3, constraint, v24);
        break;
      case 3LL:
        uint64_t v31 = *(void *)(constraint + 64);
        if (v31 < 0) {
          goto LABEL_53;
        }
        if (constraint >= v30
          || (uint64_t v24 = (unsigned __int8 *)(a1 + v31)) != 0LL
          && ((unint64_t)v24 < v20 ? (BOOL v36 = (unint64_t)v24 >= a1) : (BOOL v36 = 0), !v36))
        {
LABEL_52:
          __break(0x5519u);
LABEL_53:
          __panic_npx("panic: invalid offset: %lld", v22, v23, (uint64_t)v24, v25, v26, v27, v28, v31);
        }

        uint64_t result = expert_query_property_digest(a2, a3, constraint, (uint64_t)v24);
        break;
      default:
        __panic_npx( "panic: version property iterated during instantiation: p = %s, fourcc = %s",  v22,  v23,  (uint64_t)v24,  v25,  v26,  v27,  v28,  *(void *)constraint);
    }

    if ((int)result <= 18)
    {
      if ((_DWORD)result)
      {
        if ((_DWORD)result != 2) {
          break;
        }
      }

      else
      {
        *(void *)(a1 + 8) |= *(void *)(v29 + 72);
      }

      goto LABEL_48;
    }

    if ((_DWORD)result != 19 && (_DWORD)result != 45) {
      break;
    }
LABEL_48:
    uint64_t result = (uint64_t)property_iterator_next((uint64_t)&v37, v12, v13, v14, v15, v16, v17, v18);
    uint64_t v19 = result;
    if (!result) {
      return result;
    }
  }

  if (result >= 0x6A) {
LABEL_56:
  }
    __panic_npx("panic: error not set to valid posix code: %d", v12, v13, v14, v15, v16, v17, v18, result);
  return result;
}

unint64_t chip_instance_check( unint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a2[8];
  if (v8 < 0) {
    return 0LL;
  }
  uint64_t v9 = a2[9];
  if (!v9) {
    __panic_npx("panic: illegal property definition: %s", (uint64_t)a2, a3, a4, a5, a6, a7, a8, *a2);
  }
  if ((*(void *)(a1 + 8) & v9) == 0) {
    return 0LL;
  }
  unint64_t v10 = a1 + v8;
  if (v10)
  {
    if (v10 >= a1 + 160 || v10 < a1)
    {
      __break(0x5519u);
      return 0LL;
    }
  }

  return v10;
}

unint64_t chip_instance_set_BOOL( unint64_t result, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_UNKNOWN **)(a2 + 40) != &_property_type_BOOL) {
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 22);
  }
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  uint64_t v9 = (_BYTE *)(result + v8);
  *(void *)(result + 8) |= *(void *)(a2 + 72);
  else {
    __break(0x5519u);
  }
  return result;
}

unint64_t chip_instance_set_uint32( unint64_t result, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  uint64_t v9 = (_DWORD *)(result + v8);
  *(void *)(result + 8) |= *(void *)(a2 + 72);
  else {
    __break(0x5519u);
  }
  return result;
}

unint64_t chip_instance_set_uint64( unint64_t result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  uint64_t v9 = (void *)(result + v8);
  *(void *)(result + 8) |= *(void *)(a2 + 72);
  else {
    __break(0x5519u);
  }
  return result;
}

unint64_t chip_instance_set_digest( unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  *(void *)(result + 8) |= *(void *)(a2 + 72);
  unint64_t v9 = result + v8;
  if (!v9) {
    return digest_copy(v9, a3, a3, a4, a5, a6, a7, a8);
  }
  if (v9 < result + 160 && v9 >= result) {
    return digest_copy(v9, a3, a3, a4, a5, a6, a7, a8);
  }
  __break(0x5519u);
  return result;
}

void chip_instance_set_version( unint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  *(void *)(a1 + 8) |= *(void *)(a2 + 72);
  unint64_t v9 = a1 + v8;
  if (!v9 || (v9 < a1 + 160 ? (BOOL v10 = v9 >= a1) : (BOOL v10 = 0), v10)) {
    version_copy(v9, a3);
  }
  else {
    __break(0x5519u);
  }
}

_BYTE *chip_instance_get_BOOL( _BYTE *result, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_UNKNOWN **)(a2 + 40) != &_property_type_BOOL) {
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 22);
  }
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  if ((*(void *)(a2 + 72) & *((void *)result + 1)) == 0LL) {
    return 0LL;
  }
  unint64_t v9 = &result[v8];
  if (v9 >= result + 160 || v9 < result)
  {
    __break(0x5519u);
    return result;
  }

  *a3 = *v9;
  return v9;
}

_DWORD *chip_instance_get_uint32( _DWORD *result, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  if ((*(void *)(a2 + 72) & *((void *)result + 1)) == 0LL) {
    return 0LL;
  }
  unint64_t v9 = (_DWORD *)((char *)result + v8);
  if (v9 >= result + 40 || v9 < result)
  {
    __break(0x5519u);
    return result;
  }

  *a3 = *v9;
  return v9;
}

void *chip_instance_get_uint64( void *result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  if ((*(void *)(a2 + 72) & result[1]) == 0LL) {
    return 0LL;
  }
  unint64_t v9 = (void *)((char *)result + v8);
  if (v9 >= result + 20 || v9 < result)
  {
    __break(0x5519u);
    return result;
  }

  *a3 = *v9;
  return v9;
}

unint64_t chip_instance_get_digest( unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  if ((*(void *)(a2 + 72) & *(void *)(result + 8)) == 0LL) {
    return 0LL;
  }
  unint64_t v9 = result + v8;
  if (!(result + v8)) {
    return digest_copy(a3, v9, a3, a4, a5, a6, a7, a8);
  }
  if (v9 < result + 160 && v9 >= result) {
    return digest_copy(a3, v9, a3, a4, a5, a6, a7, a8);
  }
  __break(0x5519u);
  return result;
}

void chip_instance_get_version( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a2 + 64);
  if (v8 < 0) {
    __panic_npx("panic: property not present in chip instance: %s", a2, a3, a4, a5, a6, a7, a8, *(void *)a2);
  }
  if ((*(void *)(a2 + 72) & *(void *)(a1 + 8)) != 0LL)
  {
    unint64_t v9 = (__int128 *)(a1 + v8);
    else {
      __break(0x5519u);
    }
  }

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  v4[2] = *MEMORY[0x1895F89C0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!(_DWORD)result)
  {
    uint64_t result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if ((_DWORD)result)
    {
      uint64_t result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if ((_DWORD)result)
      {
        uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if ((_DWORD)result)
        {
          uint64_t result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if ((_DWORD)result)
          {
            uint64_t result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if ((_DWORD)result) {
              return result;
            }
            uint64_t v3 = 0x1000000000LL;
          }

          else
          {
            uint64_t v3 = 0x800000000LL;
          }
        }

        else
        {
          uint64_t v3 = 0x400000000LL;
        }
      }

      else
      {
        uint64_t v3 = 8LL;
      }
    }

    else
    {
      uint64_t v3 = 3840LL;
    }

    *(void *)(a1 + 240) |= v3;
  }

  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    time_t v5 = 0LL;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      time_t v3 = timegm(&v4);
      double result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(void *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
      }
    }
  }

  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  if (*(_BYTE *)(result + 16))
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!(_DWORD)result
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !(_DWORD)result)
      || (double result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !(_DWORD)result))
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x58E30653FFF8LL;
      goto LABEL_11;
    }
  }

  uint64_t v4 = *(void *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    double result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!(_DWORD)result)
    {
      uint64_t v5 = *(void *)(a2 + 240) | 0x1000000LL;
      goto LABEL_11;
    }

uint64_t X509PolicySetFlagsForTestAnchor(void *a1, uint64_t a2)
{
  v6[2] = *MEMORY[0x1895F89C0];
  v6[0] = 0LL;
  v6[1] = 0LL;
  v5[0] = 0LL;
  v5[1] = 0LL;
  uint64_t result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0LL, v5);
  if (!(_DWORD)result)
  {
    uint64_t result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!(_DWORD)result)
    {
      uint64_t result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!(_DWORD)result) {
        *(void *)(a2 + 240) |= a1[1];
      }
    }
  }

  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!(_DWORD)result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

uint64_t CTImg4VerifyChain( uint64_t result, uint64_t a2, void *a3, void *a4, void *a5, unint64_t *a6, uint64_t a7, uint64_t a8)
{
  _OWORD v38[4] = *MEMORY[0x1895F89C0];
  if (!a8) {
    return 6LL;
  }
  unint64_t v14 = result;
  memset(v38, 170, 32);
  v37[0] = 0xAAAAAAAAAAAAAAAALL;
  v37[1] = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v15 = *(void *)(a8 + 8);
  if (!v15) {
    goto LABEL_10;
  }
  uint64_t v16 = *(void *)(a8 + 16);
  if (!v16) {
    goto LABEL_10;
  }
  *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v36[12] = v17;
  v36[13] = v17;
  v36[10] = v17;
  v36[11] = v17;
  _OWORD v36[8] = v17;
  v36[9] = v17;
  v36[6] = v17;
  _OWORD v36[7] = v17;
  v36[4] = v17;
  _OWORD v36[5] = v17;
  _OWORD v36[2] = v17;
  v36[3] = v17;
  v36[0] = v17;
  v36[1] = v17;
  __int128 v34 = v17;
  __int128 v35 = v17;
  __int128 v32 = v17;
  __int128 v33 = v17;
  __int128 v31 = v17;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v15, v16))
  {
    __break(0x5513u);
    goto LABEL_27;
  }

  unint64_t v18 = v15 + v16;
  if (v15 > v18)
  {
LABEL_27:
    __break(0x5519u);
    return result;
  }

  unint64_t v29 = v15;
  unint64_t v30 = v18;
  int v19 = X509CertificateParse((unint64_t *)&v31, &v29);
  if (v19 || (int v19 = X509CertificateParseSPKI((unint64_t *)v36 + 1, &v38[2], v37, v38)) != 0)
  {
    *(_DWORD *)(a8 + 32) = v19;
    return 3LL;
  }

uint64_t CTImg4VerifySignatureWithPublicKey( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (!a8) {
    return 6LL;
  }
  int v13 = 655617;
  *(void *)&__int128 v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v31 = v14;
  __int128 v32 = v14;
  __int128 v29 = v14;
  __int128 v30 = v14;
  __int128 v27 = v14;
  __int128 v28 = v14;
  __int128 v25 = v14;
  __int128 v26 = v14;
  v24[0] = v14;
  v24[1] = v14;
  __int128 v23 = v14;
  unint64_t v15 = *(void **)(a7 + 48);
  uint64_t v16 = *(void *)(*(void *)(a7 + 40) + 8LL);
  *((void *)&v25 + 1) = **(void **)(a7 + 40);
  *(void *)&__int128 v26 = v16;
  *((void *)&v27 + 1) = a3;
  *(void *)&__int128 v28 = a4;
  uint64_t v17 = v15[1];
  v22[0] = *v15;
  v22[1] = v17;
  if ((find_digestOID_for_signingOID((uint64_t)&v25 + 8, (void *)v24 + 1) & 1) == 0)
  {
    int v13 = 656640;
    goto LABEL_8;
  }

  uint64_t result = compare_octet_string((uint64_t)v22, (uint64_t)&rsaEncryption);
  if (!(_DWORD)result)
  {
    uint64_t v19 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v21 = validateSignatureRSA;
    goto LABEL_12;
  }

  if (compare_octet_string((uint64_t)v22, (uint64_t)&ecPublicKey))
  {
LABEL_8:
    uint64_t result = 4LL;
    goto LABEL_9;
  }

  uint64_t result = (uint64_t)oidForPubKeyLength();
  uint64_t v20 = *(void *)result;
  uint64_t v19 = *(void *)(result + 8);
  uint64_t v21 = (unint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))validateSignatureEC;
LABEL_12:
  *((void *)&v26 + 1) = v20;
  *(void *)&__int128 v27 = v19;
  if (a1 && !a2 || a5 && !a6)
  {
    __break(0x5519u);
    return result;
  }

  if ((v21(a1, a2, a5, a6, &v23) & 1) != 0) {
    return 0LL;
  }
  int v13 = 655648;
  uint64_t result = 0xFFFFFFFFLL;
LABEL_9:
  *(_DWORD *)(a8 + 32) = v13;
  return result;
}

unint64_t CTImg4CreateContext(unint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v5 = 786435LL;
  if (!a5) {
    return 786433LL;
  }
  unint64_t v10 = result;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)a5 = 0u;
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  if (!a2 || !result)
  {
    if ((a4 | 0x80000000LL) == 0x80000000LL) {
      return v5;
    }
    if ((a4 & 0x40000800000LL) == 0) {
      return 786436LL;
    }
    __int128 v14 = (void *)((unint64_t)&X509PolicyBAAUser & (a4 << 21 >> 63));
    if ((a4 & 0x800000) != 0) {
      __int128 v14 = &X509PolicyBAASystem;
    }
    unint64_t v15 = *(void *)(v14[4] + 8LL);
    unint64_t v22 = *(void *)v14[4];
    unint64_t v23 = v15;
    goto LABEL_14;
  }

  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v21[12] = v11;
  v21[13] = v11;
  v21[10] = v11;
  v21[11] = v11;
  v21[8] = v11;
  v21[9] = v11;
  v21[6] = v11;
  v21[7] = v11;
  v21[4] = v11;
  v21[5] = v11;
  unint64_t v21[2] = v11;
  v21[3] = v11;
  v21[0] = v11;
  v21[1] = v11;
  void v20[3] = v11;
  v20[4] = v11;
  v20[1] = v11;
  int v20[2] = v11;
  v20[0] = v11;
  if (__CFADD__(result, a2))
  {
    __break(0x5513u);
  }

  else if (result + a2 >= result)
  {
    v19[0] = result;
    v19[1] = result + a2;
    int v12 = X509CertificateParse((unint64_t *)v20, v19);
    uint64_t v13 = 786435LL;
    if (v12) {
      return v13;
    }
    v18[0] = 0xAAAAAAAAAAAAAAAALL;
    v18[1] = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v13 = X509CertificateParseSPKI((unint64_t *)v21 + 1, &v22, 0LL, v18);
    if ((_DWORD)v13) {
      return v13;
    }
LABEL_14:
    if (compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)&v22))
    {
      int v16 = 2;
    }

    else
    {
      int v16 = 1;
    }

    uint64_t v5 = 786434LL;
    if (a3 > 7)
    {
      if (a3 == 8)
      {
        if (v16 == 1) {
          uint64_t v17 = _ctImg4RsaSha384Impl;
        }
        else {
          uint64_t v17 = _ctImg4EcdsaSha384Impl;
        }
      }

      else
      {
        if (a3 != 16) {
          return v5;
        }
        if (v16 == 1) {
          uint64_t v17 = _ctImg4RsaSha512Impl;
        }
        else {
          uint64_t v17 = _ctImg4EcdsaSha512Impl;
        }
      }
    }

    else if (a3 == 1)
    {
      if (v16 == 1) {
        uint64_t v17 = _ctImg4RsaSha1Impl;
      }
      else {
        uint64_t v17 = _ctImg4EcdsaSha1Impl;
      }
    }

    else
    {
      if (a3 != 4) {
        return v5;
      }
      if (v16 == 1) {
        uint64_t v17 = _ctImg4RsaSha256Impl;
      }
      else {
        uint64_t v17 = _ctImg4EcdsaSha256Impl;
      }
    }

    *(void *)a5 = v17;
    uint64_t v5 = 0LL;
    *(void *)(a5 + 8) = v10;
    *(void *)(a5 + 16) = a2;
    *(void *)(a5 + 24) = a4;
    return v5;
  }

  __break(0x5519u);
  return result;
}

int *find_digest(uint64_t a1)
{
  unint64_t v2 = 0LL;
  while (1)
  {
    uint64_t result = (int *)compare_octet_string_raw((uint64_t)&digests[v2 / 4 + 2], *(const void **)a1, *(void *)(a1 + 8));
    if (!(_DWORD)result) {
      break;
    }
    v2 += 32LL;
    if (v2 == 160) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

int *find_digest_by_type(int *result)
{
  unint64_t v1 = 0LL;
  while (digests[v1 / 4] != (_DWORD)result)
  {
    v1 += 32LL;
    if (v1 == 160) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t find_digestOID_for_signingOID(uint64_t a1, void *a2)
{
  if (!compare_octet_string_raw(a1, &sha1WithRSA_oid, 9uLL)
    || !compare_octet_string_raw(a1, &sha1WithECDSA_oid, 7uLL))
  {
    uint64_t v6 = &CTOidSha1;
    uint64_t v4 = 5LL;
    goto LABEL_11;
  }

  uint64_t v4 = 9LL;
  if (!compare_octet_string_raw(a1, &sha256WithRSA_oid, 9uLL))
  {
    uint64_t v6 = &CTOidSha256;
    goto LABEL_11;
  }

  if (!compare_octet_string_raw(a1, &sha256WithECDSA_oid, 8uLL))
  {
    uint64_t v6 = &CTOidSha256;
LABEL_18:
    uint64_t v4 = 9LL;
    goto LABEL_11;
  }

  uint64_t v4 = 9LL;
  if (!compare_octet_string_raw(a1, &sha384WithRSA_oid, 9uLL))
  {
    uint64_t v6 = &CTOidSha384;
    goto LABEL_11;
  }

  if (!compare_octet_string_raw(a1, &sha384WithECDSA_oid, 8uLL))
  {
    uint64_t v6 = &CTOidSha384;
    goto LABEL_18;
  }

  uint64_t v4 = 9LL;
  if (compare_octet_string_raw(a1, &sha512WithRSA_oid, 9uLL))
  {
    uint64_t v6 = &CTOidSha512;
    goto LABEL_18;
  }

  uint64_t v6 = &CTOidSha512;
LABEL_11:
  *a2 = v6;
  a2[1] = v4;
  return 1LL;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t result = 0LL;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  char v30 = 0;
  if (a1)
  {
    if (a2)
    {
      unint64_t result = 0LL;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            unint64_t result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!(_DWORD)result
              || (unint64_t result = validateOIDs((uint64_t)&rsaAlgs, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), (_DWORD)result))
            {
              unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
              unint64_t v10 = a5[9];
              uint64_t v9 = a5[10];
              if (__CFADD__(v10, v9)) {
                goto LABEL_31;
              }
              if (v10 > v10 + v9) {
                goto LABEL_32;
              }
              unint64_t v28 = a5[9];
              unint64_t v29 = v10 + v9;
              if (!v9 || (unint64_t result = ccder_blob_check_null(), (_DWORD)result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    unint64_t result = ccder_decode_rsa_pub_n();
                    if (!result) {
                      return result;
                    }
                    unint64_t v11 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }

                    unint64_t v12 = result << 6;
                    if (result << 6 < 0x400) {
                      return 0LL;
                    }
                    unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
                    __int16 v33 = -21846;
                    char v31 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      unint64_t v13 = a5[4];
                      LOBYTE(v32) = v13;
                      if ((unint64_t)&v31 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v13 <= 9)
                        {
                          uint64_t v14 = __memcpy_chk();
                          if (v12 > 0x1068) {
                            return 0LL;
                          }
                          unint64_t result = MEMORY[0x1895F8858](v14, v15, v16, v17, v18, v19, v20, v21);
                          unint64_t v23 = (unint64_t *)((char *)&v27 - v22);
                          unint64_t v24 = 0LL;
                          *(void *)&__int128 v25 = 0xAAAAAAAAAAAAAAAALL;
                          *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            __int128 v26 = &v23[v24 / 8];
                            *(_OWORD *)__int128 v26 = v25;
                            *((_OWORD *)v26 + 1) = v25;
                            v24 += 32LL;
                          }

                          while (v22 != v24);
                          if (v22 >= 1)
                          {
                            *unint64_t v23 = v11;
                            unint64_t result = 0LL;
                            char v30 = 0;
                            return result;
                          }
                        }

                        goto LABEL_32;
                      }
                    }

                    goto LABEL_31;
                  }

LABEL_32:
                  __break(0x5519u);
                  goto LABEL_33;
                }

BOOL validateOIDs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = 0LL;
  BOOL v7 = 1;
  do
  {
    BOOL v7 = v6 < 3;
    a1 += 32LL;
    ++v6;
  }

  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0 = ccec_x963_import_pub_size();
  int is_supported = ccec_keysize_is_supported();
  unint64_t v2 = &CTOidSECP256r1;
  uint64_t v3 = &CTOidSECP521r1;
  uint64_t v4 = &CTOidSECP384r1;
  if (v0 != 384) {
    uint64_t v4 = 0LL;
  }
  if (v0 != 521) {
    uint64_t v3 = v4;
  }
  if (v0 != 256) {
    unint64_t v2 = v3;
  }
  if (is_supported) {
    return v2;
  }
  else {
    return 0LL;
  }
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0LL;
  uint64_t v25 = *MEMORY[0x1895F89C0];
  HIBYTE(v24) = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (uint64_t result = validateOIDs((uint64_t)&ecAlgs, a5 + 24, a5 + 56), (_DWORD)result))
            {
              uint64_t result = ccec_cp_for_oid((int **)(a5 + 72));
              if (result)
              {
                uint64_t v15 = *(void *)result;
                if (*(void *)result >> 61 || !is_mul_ok(8 * v15, 3uLL))
                {
                  __break(0x550Cu);
                }

                else
                {
                  uint64_t v16 = 24 * v15;
                  BOOL v17 = __CFADD__(v16, 16LL);
                  unint64_t v18 = v16 + 16;
                  if (!v17 && v18 < 0xFFFFFFFFFFFFFFF0LL)
                  {
                    uint64_t result = MEMORY[0x1895F8858](result, v8, v9, v10, v11, v12, v13, v14);
                    uint64_t v21 = (uint64_t *)((char *)&v24 - v19);
                    unint64_t v22 = 0LL;
                    do
                    {
                      unint64_t v23 = &v21[v22 / 8];
                      *unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
                      v23[1] = 0xAAAAAAAAAAAAAAAALL;
                      v22 += 16LL;
                    }

                    while (v19 != v22);
                    if (v20 >= 0x10)
                    {
                      *uint64_t v21 = result;
                      if (v19 >= 1)
                      {
                        if (!MEMORY[0x1895E84A0]())
                        {
                          uint64_t result = ccec_x963_import_pub_size();
                          if (result == 256 && *(void *)(a5 + 96) == 64LL)
                          {
                            if (*(void *)(a5 + 88) < 0xFFFFFFFFFFFFFFE0LL)
                            {
                              goto LABEL_24;
                            }

LABEL_29:
                    __break(1u);
                    goto LABEL_30;
                  }
                }

                __break(0x5500u);
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t ccec_cp_for_oid(int **a1)
{
  if (!a1) {
    return 0LL;
  }
  unint64_t v1 = a1[1];
  if (v1 != (int *)7)
  {
    return 0LL;
  }

  uint64_t v3 = *a1;
  int v5 = *v3;
  int v6 = *(int *)((char *)v3 + 3);
  if (v5 != -2127887098 || v6 != 587203713) {
    return 0LL;
  }
  return ccec_cp_521();
}

uint64_t compressECPublicKey(void *a1, int **a2, uint64_t a3, uint64_t a4)
{
  v26[1] = *MEMORY[0x1895F89C0];
  BOOL v7 = (void *)ccec_cp_for_oid(a2);
  if (!v7) {
    return 655366LL;
  }
  uint64_t v15 = v7;
  uint64_t v16 = *v7;
  if (*v7 >> 61 || !is_mul_ok(8 * v16, 3uLL))
  {
    __break(0x550Cu);
    goto LABEL_19;
  }

  uint64_t v17 = 24 * v16;
  BOOL v18 = __CFADD__(v17, 16LL);
  unint64_t v19 = v17 + 16;
  if (v18 || v19 >= 0xFFFFFFFFFFFFFFF0LL) {
LABEL_19:
  }
    __break(0x5500u);
  uint64_t result = MEMORY[0x1895F8858](v7, v8, v9, v10, v11, v12, v13, v14);
  unint64_t v23 = (void *)((char *)v26 - v21);
  unint64_t v24 = 0LL;
  do
  {
    uint64_t v25 = &v23[v24 / 8];
    *uint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
    v25[1] = 0xAAAAAAAAAAAAAAAALL;
    v24 += 16LL;
  }

  while (v21 != v24);
  if (v22 < 0x10) {
    goto LABEL_21;
  }
  *unint64_t v23 = v15;
  if (v21 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }

  uint64_t result = MEMORY[0x1895E84A0](v15, a1[1], *a1, (char *)v26 - v21);
  if (!(_DWORD)result)
  {
    uint64_t result = ccec_compressed_x962_export_pub_size();
    if (result == a4)
    {
      if (!a3 || a4) {
        return ccec_compressed_x962_export_pub();
      }
      goto LABEL_20;
    }

    return 393220LL;
  }

  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  v25[1] = *MEMORY[0x1895F89C0];
  int v6 = (uint64_t *)ccec_cp_for_oid(a2);
  if (!v6) {
    return 655366LL;
  }
  uint64_t v14 = *v6;
  if ((unint64_t)*v6 >> 61 || !is_mul_ok(8 * v14, 3uLL)) {
LABEL_22:
  }
    __break(0x550Cu);
  uint64_t v15 = 24 * v14;
  BOOL v16 = __CFADD__(v15, 16LL);
  unint64_t v17 = v15 + 16;
  if (v16 || v17 >= 0xFFFFFFFFFFFFFFF0LL)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }

  unint64_t result = MEMORY[0x1895F8858](v6, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v21 = (void *)((char *)v25 - v19);
  unint64_t v22 = 0LL;
  do
  {
    unint64_t v23 = &v21[v22 / 8];
    *unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
    v23[1] = 0xAAAAAAAAAAAAAAAALL;
    v22 += 16LL;
  }

  while (v19 != v22);
  if (v20 < 0x10) {
    goto LABEL_24;
  }
  *uint64_t v21 = result;
  if (v19 >= 1)
  {
    uint64_t v24 = ccec_compressed_x962_import_pub();
    if (!(_DWORD)v24)
    {
      unint64_t result = cczp_bitlen();
      if (result < 0xFFFFFFFFFFFFFFF9LL)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4) {
            uint64_t v24 = 0LL;
          }
          else {
            uint64_t v24 = 393220LL;
          }
          ccec_export_pub();
          return v24;
        }

        goto LABEL_23;
      }

      goto LABEL_21;
    }

    return v24;
  }

uint64_t CMSParseContentInfoSignedDataWithOptions(char *a1, uint64_t a2, unint64_t *a3, char a4)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  unint64_t v28 = (char *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v29 = (char *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_114;
  }
  if (&a1[a2] < a1) {
    goto LABEL_112;
  }
  int v4 = 65537;
  unint64_t v28 = a1;
  unint64_t v29 = &a1[a2];
  __int16 v27 = 0;
  size_t v26 = 0xAAAAAAAAAAAAAAAALL;
  int v7 = ccder_blob_decode_ber_tl((uint64_t)&v28, 0x2000000000000010LL, (_BYTE *)&v27 + 1, &v26);
  uint64_t result = 65537LL;
  if (v7)
  {
    uint64_t v24 = (char *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v25 = (char *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v28, v26)) {
      goto LABEL_114;
    }
    if (v28 > &v28[v26] || &v28[v26] > v29) {
      goto LABEL_112;
    }
    uint64_t v24 = v28;
    uint64_t v25 = &v28[v26];
    if (ccder_blob_decode_tl())
    {
      if (v25 < v24 || v26 > v25 - v24) {
        goto LABEL_112;
      }
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      v24 += v26;
      unint64_t v22 = (char *)0xAAAAAAAAAAAAAAAALL;
      unint64_t v23 = (char *)0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v24, v26)) {
        goto LABEL_114;
      }
      if (v24 > &v24[v26] || &v24[v26] > v25) {
        goto LABEL_112;
      }
      unint64_t v22 = v24;
      unint64_t v23 = &v24[v26];
      __int16 v31 = 0;
      memset(v30, 170, sizeof(v30));
      if (__CFADD__(v22, v30[0])) {
        goto LABEL_114;
      }
      uint64_t v9 = 131080LL;
      if (&v22[v30[0]] != v23) {
        return 131082LL;
      }
      uint64_t v10 = a3 + 11;
      uint64_t result = 131092LL;
      if (*v10 <= 4uLL && ((1LL << *v10) & 0x1A) != 0)
      {
        unsigned __int8 v35 = 0;
        size_t v34 = 0LL;
        unint64_t v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v22, v34)) {
          goto LABEL_114;
        }
        if (v22 > &v22[v34] || &v22[v34] > v23) {
          goto LABEL_112;
        }
        unint64_t v32 = v22;
        unint64_t v33 = (unint64_t)&v22[v34];
        if (__CFADD__(v32, v34)) {
          goto LABEL_114;
        }
        uint64_t v11 = &v32[v34];
        v32 += v34;
        int v12 = v35;
        if (v11 != (char *)v33 || v35)
        {
          unsigned __int8 v40 = 0;
          uint64_t v38 = (char *)v33;
          unint64_t v39 = 0LL;
          __int128 v37 = v11;
          if (ccder_blob_decode_ber_tl((uint64_t)&v37, 0xA000000000000000LL, &v40, &v39))
          {
            if (!v12)
            {
              if (__CFADD__(v37, v39)) {
                goto LABEL_114;
              }
            }

            if (v37 > v38) {
              goto LABEL_112;
            }
            unint64_t v32 = v37;
            unint64_t v33 = (unint64_t)v38;
            unsigned __int8 v36 = 0;
            int v16 = v40;
            unint64_t v41 = 0LL;
            unint64_t v17 = v32;
            unint64_t v18 = v33;
            unint64_t v19 = v41;
            a3[9] = (unint64_t)v32;
            a3[10] = v19;
            if (__CFADD__(v17, v19))
            {
LABEL_114:
              __break(0x5513u);
              return 0LL;
            }

            unint64_t v20 = &v17[v19];
            unint64_t v32 = v20;
          }

          else
          {
            if (!v12) {
              return v9;
            }
            int v16 = v40;
          }

          uint64_t v11 = v32;
        }

        if (v11 > v23 || v22 > v11) {
          goto LABEL_112;
        }
        unint64_t v22 = v11;
        __int128 v37 = (char *)0xAAAAAAAAAAAAAAAALL;
        uint64_t v38 = (char *)0xAAAAAAAAAAAAAAAALL;
        if (v22 > v23) {
          goto LABEL_112;
        }
        __int128 v37 = v22;
        uint64_t v38 = v23;
        if ((ccder_blob_decode_ber_tl((uint64_t)&v37, 0xA000000000000000LL, &v31, v30) & 1) == 0)
        {
          uint64_t v13 = v22;
          uint64_t v15 = v23;
          goto LABEL_86;
        }

        unint64_t v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
        if (!__CFADD__(v37, v30[0]))
        {
          if (v37 > &v37[v30[0]] || &v37[v30[0]] > v38) {
            goto LABEL_112;
          }
          unint64_t v32 = v37;
          unint64_t v33 = (unint64_t)&v37[v30[0]];
          uint64_t v13 = v32;
          if (v32 - v37 >= 0 ? v32 >= v37 : v32 < v37)
          {
            if (v37 > v32) {
              goto LABEL_112;
            }
            uint64_t v15 = v38;
            if (v32 > v38) {
              goto LABEL_112;
            }
            unint64_t v22 = v32;
            unint64_t v23 = v38;
LABEL_86:
            if (v13 <= v15)
            {
              __int128 v37 = v13;
              uint64_t v38 = v15;
              if (ccder_blob_eat_ber_inner((unint64_t *)&v37, 0xA000000000000001LL, 0LL, 125))
              {
                if (v37 > v38) {
                  goto LABEL_112;
                }
                unint64_t v22 = v37;
                unint64_t v23 = v38;
              }

              if (v30[2] >= v30[1])
              {
                uint64_t v21 = &v22[-v30[1]];
                if ((unint64_t)&v22[-v30[1]] <= v30[2] - v30[1])
                {
                  a3[5] = v30[1];
                  a3[6] = (unint64_t)v21;
                  if (v22 <= v25 && v24 <= v22)
                  {
                    uint64_t v24 = v22;
                    if (ccder_blob_decode_eoc((unint64_t *)&v24, HIBYTE(v27)))
                    {
                      if ((a4 & 1) == 0 && v24 != v29) {
                        return 65543LL;
                      }
                      return 0LL;
                    }

                    return (v4 + 5);
                  }
                }
              }
            }

LABEL_112:
            __break(0x5519u);
            return (v4 + 5);
          }
        }

        goto LABEL_114;
      }
    }

    else
    {
      return 65538LL;
    }
  }

  return result;
}

uint64_t ccder_blob_decode_ber_tl(uint64_t a1, uint64_t a2, _BYTE *a3, unint64_t *a4)
{
  int v8 = ccder_blob_decode_tag();
  uint64_t result = 0LL;
  if (v8)
  {
    if (a2 == 0xAAAAAAAAAAAAAAAALL) {
      return ccder_blob_decode_ber_len(a1, a3, a4);
    }
  }

  return result;
}

uint64_t ccder_blob_decode_eoc(unint64_t *a1, int a2)
{
  if (!a2) {
    return 1LL;
  }
  uint64_t result = ccder_blob_decode_tl();
  if (!(_DWORD)result) {
    return result;
  }
  unint64_t v4 = *a1;
  if (*a1 >= 0x5555555555555556LL)
  {
    __break(0x5513u);
LABEL_12:
    __break(0x5519u);
    return result;
  }

  unint64_t v5 = v4 - 0x5555555555555556LL;
  if (v4 > v4 - 0x5555555555555556LL || v5 > a1[1]) {
    goto LABEL_12;
  }
  *a1 = v5;
  return 1LL;
}

uint64_t CMSParseContentInfoSignedData(char *a1, uint64_t a2, unint64_t *a3)
{
  return CMSParseContentInfoSignedDataWithOptions(a1, a2, a3, 0);
}

uint64_t CMSParseSignerInfos(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, __int128 *))
{
  uint64_t v86 = *MEMORY[0x1895F89C0];
  unint64_t v84 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v85 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  if (__CFADD__(v4, v3)) {
    goto LABEL_93;
  }
  if (v4 > v4 + v3) {
    goto LABEL_92;
  }
  unint64_t v84 = *(void *)(a1 + 40);
  unint64_t v85 = v4 + v3;
  unint64_t v72 = 0xAAAAAAAAAAAAAAAALL;
  if (v4 >= v4 + v3)
  {
    unsigned int v48 = 0;
    uint64_t result = 0LL;
    if (v3) {
      return (v48 << 8) | 0x30008;
    }
    return result;
  }

  unsigned int v6 = 0;
  unsigned __int8 v60 = 0;
  int v7 = 256;
  while (1)
  {
    unsigned __int8 v71 = 0;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v76 = 0u;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    DWORD2(v83) = 327681;
    LOBYTE(v82) = v6 + 1;
    if ((ccder_blob_decode_ber_tl((uint64_t)&v84, 0x2000000000000010LL, &v71, &v72) & 1) == 0)
    {
      int v49 = 196609;
      return v7 | v49;
    }

    unint64_t v69 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v70 = 0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v84, v72)) {
      goto LABEL_93;
    }
    if (v84 > v84 + v72 || v84 + v72 > v85) {
      goto LABEL_92;
    }
    unint64_t v69 = v84;
    unint64_t v70 = v84 + v72;
    if ((ccder_blob_decode_uint64() & 1) == 0)
    {
      int v49 = 196610;
      return v7 | v49;
    }

    unint64_t v9 = v69;
    unint64_t v8 = v70;
    unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v68 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    unint64_t v67 = v69;
    unint64_t v68 = v70;
    unint64_t v65 = v69;
    unint64_t v66 = v70;
    unint64_t v10 = v69;
LABEL_19:
    if (__CFADD__(v72, v10 - v9)) {
      goto LABEL_94;
    }
    if (v72 + v10 - v9 > v8 - v9) {
      goto LABEL_92;
    }
    *((void *)&v73 + 1) = v9;
    *(void *)&__int128 v74 = v72 + v10 - v9;
    if (__CFADD__(v10, v72)) {
      goto LABEL_93;
    }
    if (v10 > v10 + v72 || v10 + v72 > v70) {
      goto LABEL_92;
    }
    unint64_t v69 = v10 + v72;
    if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v74 + 1))
    {
      int v49 = 196612;
      return v7 | v49;
    }

    unint64_t v63 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70) {
      goto LABEL_92;
    }
    unint64_t v63 = v69;
    unint64_t v64 = v70;
    if (ccder_blob_decode_tl())
    {
      if (v64 < v63 || v72 > v64 - v63) {
        goto LABEL_92;
      }
      *((void *)&v75 + 1) = v63;
      *(void *)&__int128 v76 = v72;
      if (__CFADD__(v63, v72)) {
        goto LABEL_93;
      }
      if (v63 > v63 + v72 || v63 + v72 > v64) {
        goto LABEL_92;
      }
      unint64_t v69 = v63 + v72;
      unint64_t v70 = v64;
    }

    else
    {
      *((void *)&v75 + 1) = 0LL;
      *(void *)&__int128 v76 = 0LL;
    }

    if ((ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v76 + 1) & 1) == 0)
    {
      int v49 = 196613;
      return v7 | v49;
    }

    if ((ccder_blob_decode_tl() & 1) == 0)
    {
      int v49 = 196614;
      return v7 | v49;
    }

    if (v70 < v69 || v72 > v70 - v69) {
      goto LABEL_92;
    }
    *((void *)&v78 + 1) = v69;
    *(void *)&__int128 v79 = v72;
    if (__CFADD__(v69, v72)) {
      goto LABEL_93;
    }
    unint64_t v12 = v69 + v72;
    if (v69 > v69 + v72 || v12 > v70) {
      goto LABEL_92;
    }
    v69 += v72;
    unint64_t v63 = v12;
    unint64_t v64 = v70;
    if (ccder_blob_eat_ber_inner(&v63, 0xA000000000000001LL, 0LL, 125))
    {
      if (v63 > v64) {
        goto LABEL_92;
      }
      unint64_t v69 = v63;
      unint64_t v70 = v64;
    }

    if ((ccder_blob_decode_eoc(&v69, v71) & 1) == 0)
    {
      int v49 = 196615;
      return v7 | v49;
    }

    digest = find_digest((uint64_t)&v74 + 8);
    if (digest)
    {
      uint64_t v14 = digest;
      unsigned int v15 = *(_DWORD *)(a1 + 96);
      if (!v15 || *digest <= v15)
      {
        uint64_t result = a3(a2, a1, &v73);
        if ((_DWORD)result != 327710)
        {
          if ((_DWORD)result) {
            return result;
          }
          unint64_t v17 = *(void *)(a1 + 64);
          if (v17 <= v60)
          {
            if (v17)
            {
              int v29 = v60 - 1;
              unint64_t v30 = *(void *)(a1 + 56);
              uint64_t v31 = 176LL * v29;
              if (__CFADD__(v30, v31)) {
                goto LABEL_93;
              }
              unint64_t v32 = v30 + 176LL * v29;
              if (v32 >= v30 + 176 * v17 || v32 < v30) {
                goto LABEL_92;
              }
              unint64_t v33 = find_digest(v30 + 176LL * v29 + 24);
              if (v33)
              {
                if (*v14 > *v33)
                {
                  unsigned int v34 = *(_DWORD *)(a1 + 96);
                  if (!v34 || *v14 <= v34)
                  {
                    unint64_t v35 = *(void *)(a1 + 56);
                    if (__CFADD__(v35, v31)) {
                      goto LABEL_93;
                    }
                    unsigned __int8 v36 = (_OWORD *)(v35 + 176LL * v29);
                    unint64_t v37 = v35 + 176LL * *(void *)(a1 + 64);
                    BOOL v38 = v37 >= (unint64_t)v36;
                    unint64_t v39 = v37 - (void)v36;
                    __int128 v40 = v73;
                    __int128 v41 = v75;
                    v36[1] = v74;
                    _OWORD v36[2] = v41;
                    *unsigned __int8 v36 = v40;
                    __int128 v42 = v76;
                    __int128 v43 = v77;
                    __int128 v44 = v79;
                    _OWORD v36[5] = v78;
                    v36[6] = v44;
                    v36[3] = v42;
                    v36[4] = v43;
                    __int128 v45 = v80;
                    __int128 v46 = v81;
                    __int128 v47 = v83;
                    v36[9] = v82;
                    v36[10] = v47;
                    _OWORD v36[7] = v45;
                    _OWORD v36[8] = v46;
                  }
                }
              }
            }
          }

          else
          {
            unsigned int v18 = *(_DWORD *)(a1 + 96);
            if (!v18 || *v14 <= v18)
            {
              uint64_t v19 = *(void *)(a1 + 56);
              unint64_t v20 = (_OWORD *)(v19 + 176LL * v60);
              if (176 * v17 - 176LL * v60 < 0xB0) {
                goto LABEL_92;
              }
              __int128 v21 = v73;
              __int128 v22 = v75;
              v20[1] = v74;
              int v20[2] = v22;
              *unint64_t v20 = v21;
              __int128 v23 = v76;
              __int128 v24 = v77;
              __int128 v25 = v79;
              _OWORD v20[5] = v78;
              __int128 v20[6] = v25;
              void v20[3] = v23;
              v20[4] = v24;
              __int128 v26 = v80;
              __int128 v27 = v81;
              __int128 v28 = v83;
              v20[9] = v82;
              v20[10] = v28;
              v20[7] = v26;
              v20[8] = v27;
              if (v60 == 0xFF)
              {
                __break(0x5507u);
                return result;
              }

              ++v60;
            }
          }
        }
      }
    }

    if (v69 > v85 || v84 > v69) {
      goto LABEL_92;
    }
    unint64_t v84 = v69;
    unsigned int v48 = v6 + 1;
    if (v6 <= 6)
    {
      v7 += 256;
      ++v6;
      if (v69 < v85) {
        continue;
      }
    }

    if (v69 == v85)
    {
      if (v60) {
        return 0LL;
      }
      uint64_t v50 = *(void *)(a1 + 64);
      if (!v50) {
        return 0LL;
      }
      if ((unint64_t)(176 * v50) >= 0xB0)
      {
        uint64_t result = 0LL;
        uint64_t v51 = *(_OWORD **)(a1 + 56);
        __int128 v52 = v73;
        __int128 v53 = v75;
        v51[1] = v74;
        v51[2] = v53;
        *uint64_t v51 = v52;
        __int128 v54 = v76;
        __int128 v55 = v77;
        __int128 v56 = v79;
        _OWORD v51[5] = v78;
        v51[6] = v56;
        v51[3] = v54;
        v51[4] = v55;
        __int128 v57 = v80;
        __int128 v58 = v81;
        __int128 v59 = v83;
        v51[9] = v82;
        v51[10] = v59;
        v51[7] = v57;
        v51[8] = v58;
        return result;
      }

LABEL_92:
      __break(0x5519u);
LABEL_93:
      __break(0x5513u);
LABEL_94:
      __break(0x5500u);
    }

    return (v48 << 8) | 0x30008;
  }

  if ((ccder_blob_decode_tl() & 1) != 0)
  {
    unint64_t v10 = v67;
    unint64_t v11 = v68;
LABEL_17:
    if (v10 > v11) {
      goto LABEL_92;
    }
    unint64_t v69 = v10;
    unint64_t v70 = v11;
    goto LABEL_19;
  }

  if (ccder_blob_decode_tl())
  {
    unint64_t v10 = v65;
    unint64_t v11 = v66;
    goto LABEL_17;
  }

  int v49 = 196611;
  return v7 | v49;
}

uint64_t CMSBuildPath(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v3 = *(void *)(a3 + 8);
  uint64_t v4 = *(void *)(a3 + 16);
  if (__CFADD__(v3, v4)) {
LABEL_49:
  }
    __break(0x5513u);
  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_48;
  }
  unint64_t v20 = *(void *)(a3 + 8);
  unint64_t v21 = v5;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  if (*(void *)a3 != 3LL)
  {
    if (*(void *)a3 != 1LL) {
      return 524289LL;
    }
    uint64_t v8 = 524293LL;
    if (v21 >= v20 && v19 <= v21 - v20)
    {
      unint64_t v15 = v20;
      unint64_t v16 = v19;
      if (__CFADD__(v20, v19)) {
        goto LABEL_49;
      }
      if (v20 <= v20 + v19 && v20 + v19 <= v21)
      {
        v20 += v19;
        if (v21 >= v20 && v19 <= v21 - v20)
        {
          unint64_t v17 = v20;
          unint64_t v18 = v19;
          if (__CFADD__(v20, v19)) {
            goto LABEL_49;
          }
          if (v20 <= v20 + v19 && v20 + v19 <= v21)
          {
            v20 += v19;
            unint64_t v9 = *(void **)(a2 + 24);
            if (!v9) {
              return v8;
            }
            while (compare_octet_string((uint64_t)&v15, (uint64_t)(v9 + 15))
                 || compare_octet_string((uint64_t)&v17, (uint64_t)(v9 + 17)))
            {
              unint64_t v9 = (void *)v9[34];
              if (!v9) {
                return v8;
              }
            }

            goto LABEL_36;
          }
        }
      }
    }

    goto LABEL_48;
  }

  if (*(void *)(a2 + 88) == 1LL) {
    return 524298LL;
  }
  unint64_t v15 = v3;
  unint64_t v16 = v5;
  if (ccder_blob_decode_tl())
  {
    unint64_t v11 = v20;
    unint64_t v10 = v21;
    goto LABEL_29;
  }

  uint64_t v8 = 524294LL;
  unint64_t v11 = v15;
  unint64_t v10 = v16;
  if (v15 > v16)
  {
LABEL_48:
    __break(0x5519u);
    goto LABEL_49;
  }

  unint64_t v20 = v15;
  unint64_t v21 = v16;
LABEL_29:
  if (v10 < v11 || v19 > v10 - v11) {
    goto LABEL_48;
  }
  unint64_t v17 = v11;
  unint64_t v18 = v19;
  if (__CFADD__(v11, v19)) {
    goto LABEL_49;
  }
  if (v11 > v11 + v19 || v11 + v19 > v10) {
    goto LABEL_48;
  }
  unint64_t v20 = v11 + v19;
  uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier((uint64_t *)(a2 + 24), (uint64_t)&v17);
  if (!CertificateUsingKeyIdentifier) {
    return 524295LL;
  }
  unint64_t v9 = (void *)CertificateUsingKeyIdentifier;
LABEL_36:
  if (v20 != v21) {
    return 524543LL;
  }
  uint64_t v13 = X509ChainBuildPath(v9, (uint64_t *)(a2 + 24), (void *)(a3 + 152));
  uint64_t v8 = v13;
  if (*(_DWORD *)(a3 + 168) == 327681) {
    *(_DWORD *)(a3 + 168) = v13;
  }
  return v8;
}

uint64_t validateSignerInfo(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  unsigned int v6 = (__int128 *)(a3 + 24);
  digest = find_digest(a3 + 24);
  if (!digest) {
    return 327682LL;
  }
  uint64_t v8 = (unint64_t *)(*((uint64_t (**)(void))digest + 3))();
  unint64_t v9 = v8;
  memset(v34, 0, sizeof(v34));
  unint64_t v10 = (_OWORD *)a2[13];
  unint64_t v11 = a2[14];
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (a2[9] && a2[10])
    {
      unint64_t v10 = v34;
      uint64_t v13 = ccdigest();
      unint64_t v11 = *v9;
      if (*v9 >= 0x41) {
        goto LABEL_55;
      }
      goto LABEL_16;
    }

    if (!v10) {
      goto LABEL_31;
    }
  }

  if (*v8 != v11)
  {
LABEL_31:
    *(_DWORD *)(a3 + 168) = 327710;
    return 327710LL;
  }

  if (v11 > 0x40) {
    goto LABEL_55;
  }
  uint64_t v13 = __memcpy_chk();
LABEL_16:
  *(void *)(a3 + 128) = v10;
  *(void *)(a3 + 136) = v11;
  unint64_t v15 = (void *)(a3 + 128);
  uint64_t v16 = *(void *)(a3 + 48);
  if (!v16)
  {
    uint64_t result = CMSBuildPath(v13, (uint64_t)a2, a3);
    switch((int)result)
    {
      case 524293:
      case 524295:
        *(_DWORD *)(a3 + 168) = result;
        return 0LL;
      case 524294:
        goto LABEL_52;
      case 524296:
        if (*(_DWORD *)(a3 + 168) != 458753) {
          goto LABEL_43;
        }
        int v20 = 524296;
LABEL_42:
        *(_DWORD *)(a3 + 168) = v20;
LABEL_43:
        uint64_t v21 = *v9;
        if (*v9 > 0x40) {
          goto LABEL_55;
        }
        v28[0] = (uint64_t)v34;
        v28[1] = v21;
        uint64_t result = X509CertificateCheckSignatureDigest(29, *(void *)(a3 + 152), v28, v6, (__int128 *)(a3 + 88));
        if (!(_DWORD)result || (_DWORD)result == 655648 || (_DWORD)result == 655632)
        {
          int v22 = *(_DWORD *)(a3 + 168);
          if (!v22 || v22 == 458753 || v22 == 327681) {
            *(_DWORD *)(a3 + 168) = result;
          }
          uint64_t result = 0LL;
        }

        break;
      case 524297:
        int v20 = 524297;
        goto LABEL_42;
      default:
        if ((_DWORD)result) {
          goto LABEL_52;
        }
        goto LABEL_43;
    }

    goto LABEL_52;
  }

  uint64_t v25 = a1;
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = *(void *)(a3 + 40);
  if (__CFADD__(v17, v16)) {
LABEL_56:
  }
    __break(0x5513u);
  unint64_t v18 = v17 + v16;
  if (v17 > v18) {
    goto LABEL_55;
  }
  unint64_t v32 = *(void *)(a3 + 40);
  unint64_t v33 = v18;
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  if (v17 >= v18)
  {
    uint64_t result = 262156LL;
    goto LABEL_52;
  }

  uint64_t v27 = 0x2000000000000010LL;
  unsigned int v24 = 262146;
  int v26 = 262147;
  int v23 = 458754;
  if (!ccder_blob_decode_tl())
  {
    uint64_t result = 262145LL;
    goto LABEL_52;
  }

  if (__CFADD__(v32, v31)) {
    goto LABEL_56;
  }
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  if (v32 > v32 + v31 || v32 + v31 > v33)
  {
LABEL_55:
    __break(0x5519u);
    goto LABEL_56;
  }

  unint64_t v29 = v32;
  unint64_t v30 = v32 + v31;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v29, v31)) {
      goto LABEL_56;
    }
    if (v29 <= v29 + v31 && v29 + v31 <= v30)
    {
      v29 += v31;
      uint64_t result = 262150LL;
      goto LABEL_52;
    }

    goto LABEL_55;
  }

  uint64_t result = v24;
LABEL_52:
  if ((_OWORD *)*v15 == v34)
  {
    *unint64_t v15 = 0LL;
    *(void *)(a3 + 136) = 0LL;
  }

  return result;
}

uint64_t validateSignerInfoAndChain(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = validateSignerInfo((uint64_t)a1, a2, a3);
  if (!(_DWORD)v5)
  {
    int v7 = X509ChainCheckPath(29, (uint64_t *)(a3 + 152), *a1);
    if (v7)
    {
      if (!*(_DWORD *)(a3 + 168)) {
        *(_DWORD *)(a3 + 168) = v7;
      }
    }
  }

  return v5;
}

uint64_t CMSVerifySignedDataWithLeaf( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  v9[1] = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  v9[0] = 0LL;
  return CMSVerify(a1, a2, a3, a4, a5, a6, a7, &v8, v9);
}

uint64_t CMSVerify( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v29 = 0LL;
  v30[0] = 0LL;
  memset(v28, 0, sizeof(v28));
  uint64_t v26 = 0LL;
  uint64_t v25 = 0LL;
  __int128 v23 = 0u;
  unsigned int v24 = (char *)&v23 + 8;
  v30[1] = 0LL;
  memset(__b, 170, sizeof(__b));
  v22[0] = 4LL;
  v22[1] = (unint64_t)__b;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  memset(v19, 0, sizeof(v19));
  uint64_t v27 = v19;
  *(void *)&v28[0] = 1LL;
  DWORD2(v21) = 327681;
  if (a2 < 0) {
    goto LABEL_19;
  }
  uint64_t result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v22, 0);
  if ((_DWORD)result) {
    return result;
  }
  if (!a4) {
    goto LABEL_7;
  }
  uint64_t result = 131091LL;
  if (a4 < 0) {
LABEL_19:
  }
    __break(0x5519u);
  *((void *)&v28[0] + 1) = a3;
  *(void *)&v28[1] = a4;
LABEL_7:
  v30[0] = a5;
  DWORD2(v21) = 458753;
  uint64_t result = CMSParseSignerInfos( (uint64_t)v22,  (uint64_t)v30,  (uint64_t (*)(uint64_t, uint64_t, __int128 *))validateSignerInfoAndChain);
  if (!(_DWORD)result)
  {
    uint64_t result = DWORD2(v21);
    if (!DWORD2(v21))
    {
      if (a6 && a7) {
        uint64_t result = X509CertificateParseKey(*((uint64_t *)&v20 + 1), a6, a7);
      }
      if (!a4)
      {
        if (a8)
        {
          if (a9)
          {
            uint64_t v18 = *(void *)&v28[1];
            if (*(void *)&v28[1])
            {
              if (*((void *)&v28[0] + 1))
              {
                *a8 = *((void *)&v28[0] + 1);
                *a9 = v18;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t CMSVerifySignedData(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  v9[0] = 0LL;
  uint64_t v8 = 0LL;
  return CMSVerify(a1, a2, a3, a4, a5, &v6, &v7, &v8, v9);
}

uint64_t CMSVerifyAndReturnSignedData(char *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  v7[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = 0LL;
  v7[0] = 0LL;
  return CMSVerify(a1, a2, 0LL, 0LL, a5, &v6, v7, a3, a4);
}

uint64_t ccder_blob_decode_ber_len(uint64_t result, _BYTE *a2, unint64_t *a3)
{
  *a2 = 0;
  unint64_t v3 = *(unsigned __int8 **)result;
  if (!*(void *)result) {
    return 0LL;
  }
  unint64_t v4 = *(void *)(result + 8);
  uint64_t v5 = v3 + 1;
  if (v3 >= v3 + 1 || (unint64_t)v5 > v4)
  {
LABEL_41:
    __break(0x5519u);
LABEL_42:
    __break(0x5513u);
    return result;
  }

  *(void *)uint64_t result = v5;
  unint64_t v7 = *v3;
  if ((char)*v3 < 0)
  {
    switch(*v3)
    {
      case 0x80u:
        unint64_t v7 = v4 - (void)v5;
        *a2 = 1;
        break;
      case 0x81u:
        uint64_t v8 = v3 + 2;
        *(void *)uint64_t result = v8;
        unint64_t v7 = *v5;
        uint64_t v5 = v8;
        break;
      case 0x82u:
        unint64_t v9 = v3 + 3;
        unint64_t v10 = (unint64_t)v3[1] << 8;
        uint64_t v11 = v3[2];
        goto LABEL_40;
      case 0x83u:
        unint64_t v9 = v3 + 4;
        unint64_t v10 = ((unint64_t)v3[1] << 16) | ((unint64_t)v3[2] << 8);
        uint64_t v11 = v3[3];
LABEL_40:
        unint64_t v7 = v10 | v11;
        *(void *)uint64_t result = v9;
        uint64_t v5 = v9;
        break;
      default:
        return 0LL;
    }
  }

  *a3 = v7;
  return 1LL;
}

uint64_t CMSParseImplicitCertificateSet( unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  *a4 = 0LL;
  a4[1] = 0LL;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  if (*a1 > v6)
  {
LABEL_43:
    __break(0x5519u);
LABEL_44:
    __break(0x5513u);
  }

  unint64_t v30 = *a1;
  unint64_t v31 = v6;
  BOOL v7 = v5 >= v6 || a3 == 0;
  if (v7)
  {
    unint64_t v12 = 0LL;
LABEL_8:
    if (a5) {
      *a5 = v12;
    }
    return 1LL;
  }

  else
  {
    unint64_t v12 = 0LL;
    unint64_t v13 = 304 * a3;
    unint64_t v14 = a2 + 304 * a3;
    unint64_t v25 = ~a2;
    uint64_t v27 = (unint64_t **)(a4 + 1);
    __int128 v23 = (unint64_t *)(a2 + 272);
    unint64_t v15 = a2;
    while (1)
    {
      char v29 = 0;
      if (!v32) {
        goto LABEL_8;
      }
      if (v15 > v14) {
        goto LABEL_43;
      }
      if (v15 < a2) {
        goto LABEL_43;
      }
      BOOL v16 = v13 >= 0x130;
      v13 -= 304LL;
      if (!v16) {
        goto LABEL_43;
      }
      *(_OWORD *)(v15 + 272) = 0u;
      *(_OWORD *)(v15 + 288) = 0u;
      *(_OWORD *)(v15 + 240) = 0u;
      *(_OWORD *)(v15 + 256) = 0u;
      *(_OWORD *)(v15 + 208) = 0u;
      *(_OWORD *)(v15 + 224) = 0u;
      *(_OWORD *)(v15 + 176) = 0u;
      *(_OWORD *)(v15 + 192) = 0u;
      *(_OWORD *)(v15 + 144) = 0u;
      *(_OWORD *)(v15 + 160) = 0u;
      *(_OWORD *)(v15 + 112) = 0u;
      *(_OWORD *)(v15 + 128) = 0u;
      *(_OWORD *)(v15 + 80) = 0u;
      *(_OWORD *)(v15 + 96) = 0u;
      *(_OWORD *)(v15 + 48) = 0u;
      *(_OWORD *)(v15 + 64) = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)unint64_t v15 = 0u;
      if (v12)
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        *(void *)(v15 + 272) = 0LL;
        unint64_t v17 = *v27;
        *(void *)(v15 + 280) = *v27;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }

        *unint64_t v17 = v15;
        *uint64_t v27 = (unint64_t *)(v15 + 272);
      }

      else
      {
        if (v15 + 304 > v14) {
          goto LABEL_43;
        }
        unint64_t v18 = *a4;
        *__int128 v23 = *a4;
        unint64_t v19 = (unint64_t **)(v18 + 280);
        BOOL v7 = v18 == 0;
        __int128 v20 = v27;
        if (!v7) {
          __int128 v20 = v19;
        }
        *__int128 v20 = v23;
        if (v15)
        {
          if (v15 >= v14) {
            goto LABEL_43;
          }
        }

        *a4 = v15;
        *(void *)(a2 + 280) = a4;
      }

      if (v6 < v5) {
        goto LABEL_43;
      }
      unint64_t v21 = v30;
      uint64_t v22 = v30 - v5;
      if (v30 - v5 > v6 - v5) {
        goto LABEL_43;
      }
      if (v15 + 304 > v14) {
        goto LABEL_43;
      }
      *(void *)unint64_t v15 = v5;
      *(void *)(v15 + 8) = v22;
      unint64_t v6 = v31;
      if (v21 > v31) {
        goto LABEL_43;
      }
      *a1 = v21;
      a1[1] = v6;
      ++v12;
      if (v21 < v6)
      {
        v15 += 304LL;
        unint64_t v5 = v21;
        if (v12 < a3) {
          continue;
        }
      }

      goto LABEL_8;
    }
  }

uint64_t ccder_blob_eat_ber_inner(unint64_t *a1, uint64_t a2, unint64_t *a3, int a4)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  char v15 = 0;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  int v8 = ccder_blob_decode_tag();
  uint64_t result = 0LL;
  if (v8 && v14 == a2)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t result = ccder_blob_decode_ber_len((uint64_t)a1, &v15, &v13);
    if ((result & 1) == 0) {
      return 0LL;
    }
    if (a3)
    {
      unint64_t v10 = a1[1];
      if (*a1 > v10) {
        goto LABEL_18;
      }
      *a3 = *a1;
      a3[1] = v10;
    }

    if (v15)
    {
      if (a4 >= 1)
      {
        uint64_t result = ccder_blob_eat_ber_inner(a1, 0LL, 0LL, (char)(a4 - 1));
        if (!(_DWORD)result) {
          return result;
        }
        return (ccder_blob_decode_eoc(a1, 1) & 1) != 0;
      }

      return 0LL;
    }

    unint64_t v11 = *a1;
    if (__CFADD__(*a1, v13))
    {
LABEL_19:
      __break(0x5513u);
      return result;
    }

    unint64_t v12 = v11 + v13;
    if (v11 <= v11 + v13 && v12 <= a1[1])
    {
      *a1 = v12;
      return 1LL;
    }

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  size_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  }
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  return 1LL;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3 = *(void *)(a1 + 8);
  if (v3 == a3) {
    return memcmp(*(const void **)a1, a2, a3);
  }
  if (v3 > a3) {
    return 0xFFFFFFFFLL;
  }
  return 1LL;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  if (v2 <= *(void *)(a2 + 8)) {
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    if (*a1 > a1[1]) {
      goto LABEL_20;
    }
    unint64_t v5 = *a1;
    unint64_t v6 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (!(_DWORD)result) {
      return result;
    }
    if (a2)
    {
      if (v6 < v5) {
        goto LABEL_20;
      }
      *a2 = v5;
      a2[1] = 0LL;
    }

    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1LL;
      }
    }

    else if (v5 <= v6)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (!(_DWORD)result) {
        return result;
      }
      if (v5 != v6) {
        return 0LL;
      }
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1LL;
      }
    }

uint64_t ccder_blob_decode_Time(void *a1)
{
  if (*a1 > a1[1]) {
    goto LABEL_6;
  }
  if ((ccder_blob_decode_tl() & 1) != 0) {
    return 0LL;
  }
  if (*a1 > a1[1]) {
LABEL_6:
  }
    __break(0x5519u);
  ccder_blob_decode_tl();
  return 0LL;
}

uint64_t ccder_blob_decode_GeneralName(unint64_t *a1, int *a2, unint64_t *a3)
{
  uint64_t result = 0LL;
  if (a2 && a3)
  {
    *a3 = 0LL;
    a3[1] = 0LL;
    if (*a1 > a1[1]) {
      goto LABEL_42;
    }
    unint64_t v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      *a2 = 0;
LABEL_6:
      unint64_t v7 = v10;
LABEL_16:
      if (v7 <= a1[1] && *a1 <= v7)
      {
        *a1 = v7;
        return 1LL;
      }

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, void *a5)
{
  uint64_t v6 = 0LL;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a1 < a2 && a4)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = a4 - 1;
    unint64_t v10 = a3;
    unint64_t v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(void *)&__int128 v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      _OWORD v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      _OWORD v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      _DWORD v17[2] = v12;
      v17[0] = v12;
      unint64_t v15 = a1;
      unint64_t v16 = a2;
      uint64_t result = X509CertificateParse((unint64_t *)v17, &v15);
      if ((_DWORD)result) {
        break;
      }
      a1 = v15;
      a2 = v16;
      *unint64_t v10 = v17[0];
      uint64_t v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++) {
          continue;
        }
      }

      goto LABEL_11;
    }
  }

  else
  {
LABEL_11:
    uint64_t result = 0LL;
    if (a5) {
      *a5 = v6;
    }
  }

  return result;
}

uint64_t CTParseExtensionValue( unint64_t a1, uint64_t a2, const void *a3, size_t a4, void *a5, void *a6)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_11;
  }
  v10[0] = a1;
  v10[1] = a1 + a2;
  uint64_t result = X509CertificateParseWithExtension((unint64_t *)v11, v10, a3, a4);
  if (!(_DWORD)result)
  {
    uint64_t result = 720914LL;
    if (*((void *)&v12 + 1))
    {
      uint64_t v9 = v13;
      if ((void)v13)
      {
        uint64_t result = 0LL;
        if (a5)
        {
          if (a6)
          {
            uint64_t result = 0LL;
            *a5 = *((void *)&v12 + 1);
            *a6 = v9;
          }
        }
      }
    }
  }

  return result;
}

uint64_t CTParseKey(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  memset(v8, 0, sizeof(v8));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_7:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_7;
  }
  v7[0] = a1;
  v7[1] = a1 + a2;
  uint64_t result = X509CertificateParse((unint64_t *)v8, v7);
  if (!(_DWORD)result) {
    return X509CertificateParseKey((uint64_t)v8, a3, a4);
  }
  return result;
}

uint64_t CTEvaluateSavageCertsWithUID( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0LL, 0LL, a9, (uint64_t)&X509PolicySavage, 2LL);
}

uint64_t CTEvaluateCertifiedChip( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, _BYTE *a7, uint64_t a8, const void *a9, size_t a10, BOOL *a11, uint64_t a12, uint64_t a13)
{
  __b[152] = *MEMORY[0x1895F89C0];
  uint64_t result = (uint64_t)memset(__b, 170, 0x4C0uLL);
  memset(v33, 170, sizeof(v33));
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = 0LL;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2)) {
    goto LABEL_34;
  }
  if (a1 + a2 < a1) {
    goto LABEL_35;
  }
  unint64_t v30 = a1;
  unint64_t v31 = a1 + a2;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v30, (unint64_t)__b, 4LL, &v33[2], &v32);
  if ((_DWORD)result) {
    return result;
  }
  uint64_t result = 327690LL;
  if (v30 != v31) {
    return result;
  }
  if (v32 != 2) {
    return 327692LL;
  }
  X509ChainResetChain(v33, &v33[2]);
  __b[74] = v33[0];
  uint64_t v22 = v33[0] ? (uint64_t *)(v33[0] + 296) : &v33[1];
  *uint64_t v22 = (uint64_t)&__b[74];
  if ((void *)((char *)&__b[38] + 1) != 0LL && (unint64_t)__b >= 0xFFFFFFFFFFFFFECFLL) {
LABEL_34:
  }
    __break(0x5513u);
  v33[0] = (uint64_t)&__b[38];
  __b[75] = v33;
  __b[36] = 0LL;
  __b[37] = v33[1];
  *(void *)v33[1] = __b;
  v33[1] = (uint64_t)&__b[36];
  uint64_t result = X509ChainCheckPathWithOptions(12, v33, a12, 0LL);
  if ((_DWORD)result) {
    return result;
  }
  uint64_t v23 = **(void **)(v33[1] + 8);
  uint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 0x8000000000000000LL) != 0) {
    goto LABEL_35;
  }
  uint64_t v28 = a3;
  unint64_t v29 = a4;
  unsigned int v24 = (__int128 *)oidForPubKeyLength();
  uint64_t result = X509CertificateCheckSignatureWithPublicKey( &v28,  (uint64_t)&ecPublicKey,  v24,  v23 + 16,  (__int128 *)(v23 + 40),  (__int128 *)(v23 + 56));
  if ((_DWORD)result) {
    return result;
  }
  if (a9 && a10)
  {
    if ((a10 & 0x8000000000000000LL) != 0) {
      goto LABEL_35;
    }
  }

  unint64_t v25 = v33[0];
  LODWORD(result) = X509CertificateParseKey(v33[0], a5, a6);
  int v26 = result;
  if ((_DWORD)result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = 327691LL;
  }
  if (!v25 || v26) {
    return result;
  }
  if (a11) {
    *a11 = (*(void *)(v25 + 240) & a13) != 0;
  }
  if (!a7 || !a8) {
    return 0LL;
  }
  v27[0] = 0LL;
  v27[1] = 0LL;
  if (v25 >= v25 + 304) {
    goto LABEL_35;
  }
  uint64_t result = X509CertificateSubjectNameGetCommonName((unint64_t *)(v25 + 104), v27);
  if ((_DWORD)result) {
    return result;
  }
  if (a8 < 0)
  {
LABEL_35:
    __break(0x5519u);
    return result;
  }

  uint64_t result = CTCopyUID((uint64_t)v27, a7, a8);
  if (!(_DWORD)result) {
    return 0LL;
  }
  return result;
}

uint64_t CTEvaluateSavageCerts( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, BOOL *a7)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, 0LL, 0LL, 0LL, 0LL, a7, (uint64_t)&X509PolicySavage, 2LL);
}

uint64_t CTEvaluateYonkersCerts( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, void *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0LL, 0LL, a9, (uint64_t)&X509PolicyYonkers, 0x80000LL);
}

uint64_t CTEvaluateSensorCerts( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, const void *a5, size_t a6, void *a7, void *a8, _BYTE *a9, uint64_t a10, BOOL *a11)
{
  return CTEvaluateCertifiedChip( a1,  a2,  a3,  a4,  a7,  a8,  a9,  a10,  a5,  a6,  a11,  (uint64_t)&X509PolicySensor,  0x10000000000LL);
}

uint64_t CTEvaluateCertsForPolicy( unint64_t a1, uint64_t a2, char a3, int a4, void *a5, void *a6, uint64_t a7, uint64_t a8, void *a9, void *a10, __int128 *a11)
{
  v41[116] = *MEMORY[0x1895F89C0];
  memset(v38, 170, sizeof(v38));
  bzero(v39, 0x4C0uLL);
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_42;
  }
  uint64_t v36 = a1 + a2;
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v35 = a1;
  uint64_t result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4LL, &v38[2], &v37);
  if ((_DWORD)result) {
    return result;
  }
  if (v35 != v36) {
    return 327690LL;
  }
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    uint64_t v20 = v38[0];
    unint64_t v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0]) {
      unint64_t v21 = &v38[1];
    }
    *unint64_t v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7) {
      BOOL v23 = a8 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    *(void *)&__int128 v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    __int128 v31 = *a11;
    v32[0] = *((_BYTE *)a11 + 16);
    if (v23) {
      char v25 = a3;
    }
    else {
      char v25 = 1;
    }
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(__int128 *)((char *)a11 + 24);
      uint64_t v27 = (_UNKNOWN **)*((void *)a11 + 5);
    }

    else
    {
      uint64_t v26 = *((void *)a11 + 4);
      *(void *)&v32[8] = v34;
      *(void *)&v32[16] = v26;
      uint64_t v27 = oidForPubKeyLength();
    }

    uint64_t v28 = *((void *)a11 + 6);
    *(void *)&v32[24] = v27;
    uint64_t v33 = v28;
    uint64_t result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0LL);
    if (!(_DWORD)result)
    {
      unint64_t v29 = (void *)v38[0];
      if (!a5 || !a6 || !v38[0] || (uint64_t result = X509CertificateParseKey(v38[0], a5, a6), !(_DWORD)result))
      {
        if (a10 && v29)
        {
          uint64_t v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }

        uint64_t result = 0LL;
        if (a9)
        {
          if (v29)
          {
            uint64_t result = 0LL;
            *a9 = v29[30];
          }
        }
      }
    }

    return result;
  }

  if (v39[265])
  {
    if (v38[2])
    {
      uint64_t v22 = (_BYTE *)v38[2];
      while (v22[265])
      {
        uint64_t v22 = (_BYTE *)*((void *)v22 + 34);
        if (!v22)
        {
          uint64_t v22 = (_BYTE *)v38[2];
          break;
        }
      }
    }

    else
    {
      uint64_t v22 = 0LL;
    }
  }

  else
  {
    uint64_t v22 = v39;
  }

  uint64_t result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!(_DWORD)result) {
    goto LABEL_20;
  }
  return result;
}

uint64_t CTEvaluateSatori(unint64_t a1, uint64_t a2, char a3, void *a4, void *a5)
{
  return CTEvaluateCertsForPolicy(a1, a2, a3, 1, a4, a5, 0LL, 0LL, 0LL, 0LL, X509PolicySatori);
}

uint64_t CTEvaluateAcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 0, a3, a4, 0LL, 0LL, 0LL, 0LL, X509PolicyACRT);
}

uint64_t CTEvaluateUcrt(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0LL, 0LL, 0LL, 0LL, X509PolicyUcrt);
}

uint64_t CTEvaluateUcrtTestRoot( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  return CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, 0LL, 0LL, X509PolicyUcrt);
}

uint64_t CTEvaluatePragueSignatureCMS( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unint64_t v9 = 0xAAAAAAAA0000AA01LL;
  __int128 v8 = xmmword_1894E9170;
  BYTE1(v9) = a5;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTEvaluateKDLSignatureCMS( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unint64_t v9 = 0xAAAAAAAA0000AA01LL;
  __int128 v8 = xmmword_1894E9180;
  BYTE1(v9) = a5;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTVerifyAppleMarkerExtension(void *a1, uint64_t a2)
{
  uint64_t result = 327700LL;
  unint64_t v4 = a1[31];
  unint64_t v5 = a1[32];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 327707LL;
  }
  uint64_t v7 = a1[30];
  if ((v7 & 0x100000000LL) == 0)
  {
    if ((v7 & 0x200000000LL) == 0) {
      return result;
    }
    if (!__CFADD__(v4, v5))
    {
      unint64_t v11 = v4 + v5;
      if (v4 + v5 != -1LL)
      {
        if (v5 > 0x13) {
          return 327704LL;
        }
        uint64_t v16 = (unsigned __int8 *)(v11 - 1);
        if (v11 - 1 >= v4)
        {
          uint64_t v10 = 0LL;
          uint64_t v17 = 0LL;
          while ((unint64_t)v16 < v11)
          {
            int v18 = *v16;
            if (v17 == 20) {
              break;
            }
            if ((v17 & 0x1FFFFFFFFFFFFFFFLL) == 0x14) {
              goto LABEL_39;
            }
            unint64_t v19 = (v18 - 48);
            unint64_t v20 = powersOfTen[v17];
            if (!is_mul_ok(v19, v20)) {
              goto LABEL_40;
            }
            unint64_t v21 = v19 * v20;
            BOOL v15 = __CFADD__(v10, v21);
            v10 += v21;
            if (v15) {
              goto LABEL_38;
            }
            ++v17;
          }

LABEL_37:
          __break(0x5519u);
LABEL_38:
          __break(0x5500u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(0x550Cu);
          goto LABEL_41;
        }

        goto LABEL_13;
      }
    }

LABEL_41:
    __break(0x5513u);
    return result;
  }

  if (__CFADD__(v4, v5)) {
    goto LABEL_41;
  }
  unint64_t v8 = v4 + v5;
  if (v4 + v5 == -1LL) {
    goto LABEL_41;
  }
  unint64_t v9 = (_BYTE *)(v8 - 1);
  if (v8 - 1 >= v4)
  {
    char v12 = 0;
    unint64_t v13 = 0LL;
    uint64_t v10 = 0LL;
    while ((unint64_t)v9 < v8)
    {
      unint64_t v14 = (unint64_t)(*v9 & 0x7F) << v12;
      BOOL v15 = __CFADD__(v10, v14);
      v10 += v14;
      if (v15) {
        goto LABEL_38;
      }
      if (v13 <= 7)
      {
        ++v13;
        --v9;
        v12 += 7;
      }

      goto LABEL_23;
    }

    goto LABEL_37;
  }

uint64_t CTVerifyHostname(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v3 = 327702LL;
  if (*(void *)(a1 + 232) && *(void *)(a1 + 224))
  {
    v7[1] = a3;
    unint64_t v8 = 0xAAAAAAAAAAAAAA00LL;
    v7[0] = a2;
    unsigned int v4 = X509CertificateParseGeneralNamesContent( a1,  (uint64_t (*)(void, int *, uint64_t))CTCompareGeneralNameToHostname,  (uint64_t)v7);
    if ((_BYTE)v8) {
      unsigned int v5 = 0;
    }
    else {
      unsigned int v5 = 327706;
    }
    if (v4) {
      return v4;
    }
    else {
      return v5;
    }
  }

  return v3;
}

uint64_t CTCompareGeneralNameToHostname(uint64_t result, void *a2, unint64_t a3)
{
  if ((_DWORD)result != 2) {
    return 1LL;
  }
  unsigned int v4 = *(char **)a3;
  size_t v5 = *(void *)(a3 + 8);
  size_t v6 = ~*(void *)a3;
  if (v5 > v6) {
    goto LABEL_50;
  }
  uint64_t v7 = &v4[v5];
  unint64_t v8 = v7 - 1;
  if (v7) {
    BOOL v9 = v8 >= v4;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9 || a3 + 24 < a3) {
    goto LABEL_49;
  }
  int v11 = *v8;
  uint64_t result = compare_octet_string((uint64_t)a2, a3);
  if (!(_DWORD)result) {
    goto LABEL_48;
  }
  if (v11 != 46) {
    goto LABEL_15;
  }
  size_t v12 = v5 - 1;
  if (v5)
  {
    if (v12 <= v5)
    {
      uint64_t result = compare_octet_string_raw((uint64_t)a2, v4, v12);
      if ((_DWORD)result)
      {
LABEL_15:
        unint64_t v13 = a2[1];
        if (v13 < 3) {
          return 1LL;
        }
        unint64_t v14 = (_BYTE *)*a2;
        if (*(_BYTE *)*a2 != 42) {
          return 1LL;
        }
        if (v14 != (_BYTE *)-1LL)
        {
          BOOL v15 = v14 + 1;
          if (v14[1] == 46)
          {
            uint64_t v16 = -2LL;
            uint64_t v17 = -v16;
            uint64_t v18 = 2LL;
            uint64_t result = 1LL;
            while (v17 != v18)
            {
              if (&v14[v18] < v14) {
                goto LABEL_49;
              }
              if (v14[v18] == 46)
              {
                if (v13 == v18) {
                  return 1LL;
                }
                size_t v19 = 0LL;
                if (v5)
                {
                  while (1)
                  {
                    unint64_t v20 = &v4[v19];
                    if (&v4[v19] >= v7 || v20 < v4) {
                      goto LABEL_49;
                    }
                    if (*v20 == 46) {
                      break;
                    }
                    if (v5 == ++v19)
                    {
                      size_t v19 = v5;
                      break;
                    }
                  }
                }

                size_t v22 = v13 - 1;
                BOOL v9 = v5 >= v19;
                size_t v23 = v5 - v19;
                if (!v9) {
                  goto LABEL_51;
                }
                if (v22 == v23)
                {
                  if (v19 > v6) {
                    goto LABEL_50;
                  }
                  uint64_t result = memcmp(v15, &v4[v19], v13 - 1);
                  if (!(_DWORD)result) {
                    goto LABEL_48;
                  }
                }

                if (v11 != 46) {
                  return 1LL;
                }
                if (!v23) {
                  goto LABEL_51;
                }
                if (v22 != v23 - 1) {
                  return 1LL;
                }
                if (v19 <= v6)
                {
                  if (!memcmp(v15, &v4[v19], v22)) {
                    goto LABEL_48;
                  }
                  return 1LL;
                }

                goto LABEL_50;
              }

              if (v13 == ++v18) {
                return result;
              }
            }

            goto LABEL_50;
          }

          return 1LL;
        }

LABEL_50:
        __break(0x5513u);
        goto LABEL_51;
      }

LABEL_48:
      uint64_t result = 0LL;
      *(_BYTE *)(a3 + 16) = 1;
      return result;
    }

LABEL_49:
    __break(0x5519u);
    goto LABEL_50;
  }

LABEL_51:
  __break(0x5515u);
  return result;
}

uint64_t CTEvaluateAppleSSLWithOptionalTemporalCheck( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  unint64_t v20 = 0xAAAAAAAA00AAAA01LL;
  unint64_t v21 = &null_octet;
  __int128 v19 = xmmword_1894E9190;
  BYTE1(v20) = a6;
  BYTE2(v20) = a7;
  size_t v22 = &null_octet;
  size_t v23 = &null_octet;
  __int128 v24 = &CTOctetServerAuthEKU;
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t result = CTEvaluateCertsForPolicy(a1, a2, a6, 1, &v17, &v18, 0LL, 0LL, 0LL, 0LL, &v19);
  if (!(_DWORD)result)
  {
    *(void *)&__int128 v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[17] = v13;
    v16[18] = v13;
    v16[15] = v13;
    v16[16] = v13;
    v16[13] = v13;
    v16[14] = v13;
    v16[11] = v13;
    v16[12] = v13;
    v16[9] = v13;
    v16[10] = v13;
    v16[7] = v13;
    v16[8] = v13;
    v16[6] = v13;
    v16[4] = v13;
    _OWORD v16[5] = v13;
    _OWORD v16[2] = v13;
    v16[3] = v13;
    v16[0] = v13;
    v16[1] = v13;
    memset(v15, 170, sizeof(v15));
    if (__CFADD__(a1, a2))
    {
      __break(0x5513u);
    }

    else
    {
      v14[0] = a1;
      v14[1] = a1 + a2;
      uint64_t result = (uint64_t)X509ChainParseCertificateSet(v14, (unint64_t)v16, 1LL, &v15[1], v15);
      if (!(_DWORD)result)
      {
        uint64_t result = CTVerifyAppleMarkerExtension(v16, a5);
        if (!(_DWORD)result) {
          return CTVerifyHostname((uint64_t)v16, a3, a4);
        }
      }
    }
  }

  return result;
}

uint64_t CTEvaluateAppleSSL(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return CTEvaluateAppleSSLWithOptionalTemporalCheck(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t CTGetSEKType(unint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_10:
    __break(0x5519u);
  }

  if (a1 + a2 < a1) {
    goto LABEL_10;
  }
  v3[0] = a1;
  v3[1] = a1 + a2;
  return 2LL;
}

uint64_t CTEvaluateSEK(char a1, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t result = 327712LL;
  if ((a1 & 3) != 0)
  {
    if ((a1 & 1) == 0
      || (uint64_t result = CTEvaluateCertsForPolicy(a2, a3, 0, 1, a4, a5, 0LL, 0LL, 0LL, 0LL, X509PolicySEK), (_DWORD)result))
    {
      if ((a1 & 2) != 0) {
        return CTEvaluateCertsForPolicy( a2,  a3,  0,  1,  a4,  a5,  (uint64_t)&_sek_test_root_public_key,  97LL,  0LL,  0LL,  X509PolicySEK);
      }
    }
  }

  return result;
}

uint64_t CTCopyUID(uint64_t result, _BYTE *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)result;
  uint64_t v4 = *(void *)(result + 8);
  if (__CFADD__(*(void *)result, v4)) {
    goto LABEL_31;
  }
  unint64_t v6 = v5 + v4;
  uint64_t v7 = *(unsigned __int8 **)result;
  if (v5 < v6)
  {
    while ((unint64_t)v7 >= v5)
    {
      int v3 = *v7;
      goto LABEL_6;
    }

    goto LABEL_34;
  }

LABEL_6:
  unint64_t v8 = v7 + 1;
  int v3 = 327693;
  uint64_t result = 327693LL;
  if (a3 < 0 || v5 > (unint64_t)v8)
  {
LABEL_34:
    __break(0x5519u);
    return result;
  }

  if (__CFADD__(v8, v6 - (void)v8)) {
    goto LABEL_31;
  }
  if (v6 - (void)v8 != 2 * a3) {
    return (v3 + 1);
  }
  if (__CFADD__(a2, a3) || v7 == (unsigned __int8 *)-2LL)
  {
LABEL_31:
    __break(0x5513u);
    return (v3 + 1);
  }

  BOOL v9 = v7 + 2;
  uint64_t v10 = a2;
  while (1)
  {
    uint64_t result = 0LL;
    int v11 = v9 - 1;
    size_t v12 = &asciiNibbleToByte[*v11];
    uint64_t result = (uint64_t)&CTOidAppleImg4Manifest;
    if (v11 < v7) {
      goto LABEL_34;
    }
    unint64_t v14 = &asciiNibbleToByte[*v9];
    uint64_t result = (uint64_t)&CTOidAppleImg4Manifest;
    unsigned int v15 = *v12;
    uint64_t result = 327695LL;
    if (v15 > 0xF) {
      return result;
    }
    unsigned int v16 = *v14;
    if (v16 > 0xF) {
      return result;
    }
    if (v10 < a2) {
      goto LABEL_34;
    }
    *v10++ = v16 | (16 * v15);
    v9 += 2;
    if (!v9) {
      goto LABEL_31;
    }
  }

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  unint64_t v68 = 0LL;
  uint64_t v69 = 0LL;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (*a2 > v5) {
    goto LABEL_186;
  }
  uint64_t v10 = 720915LL;
  unint64_t v66 = *a2;
  unint64_t v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  uint64_t result = ccder_blob_decode_tl();
  if (!(_DWORD)result) {
    return v10;
  }
  uint64_t v12 = v69;
  unint64_t v13 = v66;
  unint64_t v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4)) {
    goto LABEL_188;
  }
  if (v14 > v5 - v4) {
    goto LABEL_186;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v14;
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12)) {
    goto LABEL_187;
  }
  unint64_t v15 = v13 + v12;
  if (v13 > v15 || v15 > v67) {
    goto LABEL_186;
  }
  unint64_t v64 = v13;
  unint64_t v65 = v15;
  unint64_t v62 = v13;
  unint64_t v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68)) {
      goto LABEL_187;
    }
    uint64_t v16 = 720916LL;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v64 = v62 + v68;
      unint64_t v65 = v63;
      goto LABEL_14;
    }

    return v16;
  }

LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }

LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t der_get_BOOLean(void *a1, int a2, _BYTE *a3)
{
  if (*a1 > a1[1]) {
    __break(0x5519u);
  }
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2) {
    return 0LL;
  }
  if (a3) {
    *a3 = 0;
  }
  return 1LL;
}

uint64_t X509ExtensionParseKeyUsage()
{
  uint64_t result = ccder_blob_decode_bitstring();
  if ((_DWORD)result) {
    return 0LL;
  }
  return result;
}

uint64_t X509ExtensionParseBasicConstraints(void *a1, void *a2, _BYTE *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    uint64_t result = der_get_BOOLean(a1, 1, a3);
    if ((_DWORD)result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3) {
          return 0LL;
        }
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }

      return 1LL;
    }
  }

  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556LL) {
      goto LABEL_15;
    }
    if (v7 - 0x5555555555555556LL != a1[1]) {
      return 0LL;
    }
    if (v7 > v7 - 0x5555555555555556LL) {
      goto LABEL_16;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556LL;
    uint64_t result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
        goto LABEL_16;
      }
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }

    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556LL)
    {
LABEL_15:
      __break(0x5513u);
    }

    else
    {
      unint64_t v9 = v8 - 0x5555555555555556LL;
      if (v8 <= v8 - 0x5555555555555556LL && v9 <= a1[1])
      {
        *a1 = v9;
        return 1LL;
      }
    }

uint64_t X509ExtensionParseSubjectKeyIdentifier(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556LL)
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v12 = v11 - 0x5555555555555556LL;
    if (v11 > v11 - 0x5555555555555556LL || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }

  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unint64_t *a1, unint64_t *a2, void *a3)
{
  int v6 = ccder_blob_decode_tl();
  uint64_t result = 0LL;
  if (v6)
  {
    if (*a1 > a1[1]) {
      goto LABEL_11;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = a1[1];
    uint64_t result = ccder_blob_decode_tl();
    if (!(_DWORD)result) {
      return result;
    }
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_11;
    }
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556LL)
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v9 = v8 - 0x5555555555555556LL;
    if (v8 > v8 - 0x5555555555555556LL || v9 > a1[1]) {
LABEL_11:
    }
      __break(0x5519u);
    *a1 = v9;
  }

  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result == 1)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556LL)
    {
      __break(0x5513u);
      return result;
    }

    unint64_t v12 = v11 - 0x5555555555555556LL;
    if (v11 > v11 - 0x5555555555555556LL || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }

  return result;
}

uint64_t X509CertificateVerifyOnlyOneAppleExtension(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 > 9) {
    return 0LL;
  }
  unint64_t v5 = (void *)result;
  unsigned __int8 v6 = 0;
  unint64_t v7 = ~a2;
  while (v7 >= 16LL * (char)v6)
  {
    uint64_t result = compare_octet_string((uint64_t)v5, a2 + 16LL * v6);
    if (!(_DWORD)result) {
      return result;
    }
    if (a3 <= v6++)
    {
      uint64_t v9 = v5[1];
      unint64_t v10 = (void *)(a2 + 16LL * a3);
      *unint64_t v10 = *v5;
      v10[1] = v9;
      return 1LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t X509ExtensionParseAppleExtension( uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  if (a6) {
    a5 = 0LL;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786LL)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786LL)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786LL)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786LL)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786LL)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x8000;
      goto LABEL_261;
    }

LABEL_157:
    int v44 = 0;
LABEL_158:
    if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 27) {
      return X509ExtensionParseServerAuthMarker(result, a2, a3, a4, a5);
    }
    if (!v44) {
      goto LABEL_232;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 37748736LL;
    }

    else
    {
      if (*(void *)a2 != 0x66463F78648862ALL || *(_WORD *)(a2 + 8) != 4354)
      {
        if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327) {
          return (uint64_t)X509ExtensionParseMFI4Properties((unint64_t *)result, a4, a5);
        }
        if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841LL)
        {
          unint64_t v52 = *(void *)result;
          unint64_t v51 = *(void *)(result + 8);
          if (a5)
          {
            if (v52 > v51) {
              goto LABEL_265;
            }
            *a5 = v52;
            a5[1] = v51 - v52;
          }

          *a4 |= 0x80000000uLL;
LABEL_233:
          if (v52 <= v51)
          {
            *(void *)uint64_t result = v51;
            return 1LL;
          }

LABEL_265:
          __break(0x5519u);
          return result;
        }

        goto LABEL_232;
      }

      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 0x8004000000LL;
    }

LABEL_201:
    uint64_t v24 = v54 | v55;
    goto LABEL_261;
  }

  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 0x58600003F0D0LL;
      goto LABEL_201;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538) {
      goto LABEL_203;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_203:
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315) {
      return X509ExtensionParseMFISWAuth((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      uint64_t result = ccder_blob_check_null();
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x300000000LL;
      goto LABEL_261;
    }

    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304) {
      return X509ExtensionParseGenericSSLMarker();
    }
    int v44 = 1;
    goto LABEL_158;
  }

  if (a3 != 9)
  {
    if (a3 < 0xA) {
      goto LABEL_232;
    }
    goto LABEL_157;
  }

  if (*(void *)a2 == 0xB6463F78648862ALL && *(_BYTE *)(a2 + 8) == 1) {
    return X509ExtensionParseComponentAuth((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 49)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 44) {
      return X509ExtensionParseCertifiedChipIntermediate((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 36) {
      return X509ExtensionParseMFIAuthv3Leaf((unint64_t *)result);
    }
    if (*(void *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 22)
    {
      if (*(void *)a2 == 0xC6463F78648862ALL && *(_BYTE *)(a2 + 8) == 19)
      {
        uint64_t result = ccder_blob_check_null();
        if (!(_DWORD)result) {
          return result;
        }
        uint64_t v24 = *a4 | 0x8000000000LL;
        goto LABEL_261;
      }

      if (*(void *)a2 != 0xA6463F78648862ALL || *(_BYTE *)(a2 + 8) != 1)
      {
        if (*(void *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 29)
        {
          uint64_t result = ccder_blob_check_null();
          if (!(_DWORD)result) {
            return result;
          }
          uint64_t v24 = *a4 | 0x2000000;
        }

        else
        {
          if (*(void *)a2 != 0xC6463F78648862ALL || *(_BYTE *)(a2 + 8) != 14)
          {
            if (*(void *)a2 == 0x86463F78648862ALL && *(_BYTE *)(a2 + 8) == 3) {
              return X509ExtensionParseDeviceAttestationIdentity((unint64_t *)result, a4, a5);
            }
            goto LABEL_232;
          }

          uint64_t result = ccder_blob_check_null();
          if (!(_DWORD)result) {
            return result;
          }
          uint64_t v24 = *a4 | 0x4000000;
        }

LABEL_261:
        *a4 = v24;
        return 1LL;
      }

      *a4 |= 0x1000000uLL;
LABEL_232:
      unint64_t v52 = *(void *)result;
      unint64_t v51 = *(void *)(result + 8);
      goto LABEL_233;
    }

    uint64_t result = ccder_blob_check_null();
    if (!(_DWORD)result) {
      return result;
    }
    uint64_t v54 = *a4;
    uint64_t v55 = 1048584LL;
    goto LABEL_201;
  }

  char v56 = 0;
  uint64_t result = der_get_BOOLean((void *)result, 0, &v56);
  if ((_DWORD)result)
  {
    uint64_t v53 = 0x10000080002LL;
    if (!v56) {
      uint64_t v53 = 0x20000040001LL;
    }
    *a4 |= v53;
  }

  return result;
}

uint64_t X509CertificateParseWithExtension( unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8 = 720939LL;
  unint64_t v9 = *a2;
  unint64_t v10 = a2[1];
  unint64_t v11 = *a2;
  uint64_t result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  uint64_t v8 = result;
  if ((_DWORD)result) {
    return v8;
  }
  if (v11 >= 0x5555555555555556LL)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }

  uint64_t v8 = 720939LL;
  if (*a2 != v11 - 0x5555555555555556LL) {
    return v8;
  }
  unint64_t v13 = v11 - v9 - 0x5555555555555556LL;
  if (v11 - v9 >= 0x5555555555555556LL) {
    goto LABEL_11;
  }
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0LL;
  }

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0LL, 0LL);
}

uint64_t X509CertificateParseSPKI( unint64_t *a1, unint64_t *a2, unint64_t *a3, void *a4)
{
  unint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  if (__CFADD__(*a1, v5)) {
    goto LABEL_31;
  }
  unint64_t v6 = v4 + v5;
  if (v4 > v6) {
    goto LABEL_30;
  }
  uint64_t v10 = 655361LL;
  unint64_t v14 = *a1;
  unint64_t v15 = v6;
  if (v14 >= 0x5555555555555556LL) {
LABEL_31:
  }
    __break(0x5513u);
  if (v14 > v14 - 0x5555555555555556LL || v14 - 0x5555555555555556LL > v15) {
    goto LABEL_30;
  }
  unint64_t v13 = v14 - 0x5555555555555556LL;
  if (a2)
  {
    if (v13 >= v14)
    {
      *a2 = v14;
      a2[1] = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_12;
    }

uint64_t X509CertificateParseKey(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t result = 327691LL;
  if (a1)
  {
    if (*(void *)(a1 + 96))
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
      uint64_t result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0LL, 0LL, &v8);
      if (!(_DWORD)result)
      {
        if (a2)
        {
          if (a3)
          {
            uint64_t v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }

  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, uint64_t *a3, __int128 *a4, __int128 *a5)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  __int128 v28 = 0uLL;
  __int128 v27 = 0uLL;
  unint64_t v25 = 0LL;
  uint64_t v26 = 0LL;
  uint64_t v24 = 0LL;
  __int128 v23 = 0u;
  __int128 v22 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v9 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v28, (unint64_t *)&v27, &v25);
  if ((_DWORD)v9) {
    return v9;
  }
  uint64_t v9 = 655632LL;
  if (compare_octet_string((uint64_t)&v28, (uint64_t)&rsaEncryption))
  {
    unint64_t v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))validateSignatureEC;
  }

  else
  {
    unint64_t v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))validateSignatureRSA;
  }

  memset(v14, 0, sizeof(v14));
  __int128 v19 = *a5;
  __int128 v15 = *a4;
  __int128 v17 = v28;
  __int128 v18 = v27;
  if (((a1 & 1) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha512, 9uLL)))
  {
    return v9;
  }

  uint64_t result = v25;
  if (v26 || !v25)
  {
    uint64_t v12 = *a3;
    uint64_t v13 = a3[1];
    if (v13 || !v12)
    {
      if (v11(v25, v26, v12, v13, v14)) {
        return 0LL;
      }
      else {
        return 655648LL;
      }
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[2] = v8;
  v12[3] = v8;
  v12[0] = v8;
  v12[1] = v8;
  v11[0] = (uint64_t)v12;
  v11[1] = 64LL;
  __int128 v10 = 0uLL;
  uint64_t result = X509MatchSignatureAlgorithm(a3, a4, (uint64_t)v11, &v10);
  if (!(_DWORD)result) {
    return X509CertificateCheckSignatureDigest(a1, a2, v11, &v10, a5);
  }
  return result;
}

uint64_t X509MatchSignatureAlgorithm(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!(_DWORD)result) {
    goto LABEL_8;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9LL;
    if (*(void *)(a3 + 8) < 0x20uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 32LL;
    ccsha256_di();
    goto LABEL_14;
  }

  uint64_t result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!(_DWORD)result) {
    goto LABEL_12;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!(_DWORD)result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5LL;
    if (*(void *)(a3 + 8) < 0x14uLL) {
      goto LABEL_15;
    }
    *(void *)(a3 + 8) = 20LL;
    ccsha1_di();
LABEL_14:
    ccdigest();
    return 0LL;
  }

  uint64_t result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!(_DWORD)result) {
    goto LABEL_10;
  }
  uint64_t result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if ((_DWORD)result) {
    return 656640LL;
  }
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9LL;
  if (*(void *)(a3 + 8) >= 0x30uLL)
  {
    *(void *)(a3 + 8) = 48LL;
    ccsha384_di();
    goto LABEL_14;
  }

LABEL_15:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignatureWithPublicKey( uint64_t *a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, __int128 *a6)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[2] = v11;
  v32[3] = v11;
  v32[0] = v11;
  v32[1] = v11;
  unint64_t v30 = v32;
  uint64_t v31 = 64LL;
  __int128 v29 = 0uLL;
  uint64_t matched = X509MatchSignatureAlgorithm(a4, (uint64_t)a5, (uint64_t)&v30, &v29);
  if ((_DWORD)matched) {
    return matched;
  }
  uint64_t matched = 655617LL;
  if (compare_octet_string(a2, (uint64_t)&rsaEncryption))
  {
    uint64_t v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))validateSignatureEC;
  }

  else
  {
    uint64_t v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))validateSignatureRSA;
  }

  uint64_t v28 = 0LL;
  __int128 v27 = 0u;
  __int128 v26 = 0u;
  __int128 v25 = 0u;
  __int128 v24 = 0u;
  __int128 v22 = 0u;
  __int128 v20 = 0u;
  __int128 v18 = 0u;
  __int128 v21 = *a5;
  uint64_t v17 = 0LL;
  __int128 v23 = *a6;
  __int128 v19 = v29;
  if (a3) {
    __int128 v14 = *a3;
  }
  else {
    __int128 v14 = null_octet;
  }
  __int128 v22 = v14;
  uint64_t result = *a1;
  uint64_t v16 = a1[1];
  if ((v16 || !result) && (!v30 || v31))
  {
    else {
      return 655648LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParseGeneralNamesContent( uint64_t a1, uint64_t (*a2)(void, int *, uint64_t), uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unint64_t v3 = *(void *)(a1 + 224);
  uint64_t v4 = *(void *)(a1 + 232);
  if (__CFADD__(v3, v4))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }

  unint64_t v5 = v3 + v4;
  if (v3 > v5) {
    goto LABEL_11;
  }
  unint64_t v10 = *(void *)(a1 + 224);
  unint64_t v11 = v5;
  while (1)
  {
    if (v10 >= v11) {
      return 0LL;
    }
    memset(v9, 170, sizeof(v9));
  }

  return 720912LL;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  unint64_t v20 = v3;
  if (__CFADD__(*a1, v3)) {
    goto LABEL_59;
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_58:
    __break(0x5519u);
    goto LABEL_59;
  }

  uint64_t v6 = 720901LL;
  unint64_t v18 = *a1;
  unint64_t v19 = v4;
  *a2 = 0LL;
  a2[1] = 0LL;
  if (v2 < v4)
  {
    while (1)
    {
      unint64_t v2 = v18;
      if (__CFADD__(v18, v20)) {
        break;
      }
      unint64_t v7 = v18 + v20;
      if (v18 > v18 + v20 || v7 > v19) {
        goto LABEL_58;
      }
      unint64_t v16 = v18;
      unint64_t v17 = v18 + v20;
      while (v2 < v7)
      {
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20 || v16 + v20 > v17) {
          goto LABEL_58;
        }
        unint64_t v15 = v16 + v20;
        unint64_t v2 = v16 + v20;
        if (v16 > v15) {
          goto LABEL_58;
        }
        if (__CFADD__(v16, v20)) {
          goto LABEL_59;
        }
        if (v16 > v16 + v20) {
          goto LABEL_58;
        }
        unint64_t v14 = v16 + v20;
        if (v20 == 3 && *(_WORD *)v16 == 1109 && *(_BYTE *)(v16 + 2) == 3)
        {
          unint64_t v12 = v16 + v20;
          unint64_t v13 = v16 + v20;
          if ((ccder_blob_decode_tl() & 1) == 0)
          {
            if (v14 > v15) {
              goto LABEL_58;
            }
            unint64_t v12 = v16 + v20;
            unint64_t v13 = v16 + v20;
            if ((ccder_blob_decode_tl() & 1) == 0)
            {
              if (v14 > v15) {
                goto LABEL_58;
              }
              unint64_t v12 = v16 + v20;
              unint64_t v13 = v16 + v20;
            }
          }

          if (__CFADD__(v12, v20)) {
            goto LABEL_59;
          }
          unint64_t v2 = v12 + v20;
          if (v15 != v12 + v20) {
            return 720902LL;
          }
          if (v13 < v12 || v20 > v13 - v12) {
            goto LABEL_58;
          }
          *a2 = v12;
          a2[1] = v20;
        }

        unint64_t v7 = v18 + v20;
        if (v2 > v17 || v16 > v2) {
          goto LABEL_58;
        }
        unint64_t v16 = v2;
      }

      if (v2 != v7) {
        return 720903LL;
      }
      unint64_t v4 = v19;
      if (v2 > v19 || v18 > v2) {
        goto LABEL_58;
      }
      unint64_t v18 = v2;
      if (v2 >= v19) {
        goto LABEL_46;
      }
    }

LABEL_59:
    __break(0x5513u);
  }

LABEL_46:
  if (v2 != v4) {
    return 720904LL;
  }
  if (a2[1] && *a2) {
    return 0LL;
  }
  *a2 = 0LL;
  a2[1] = 0LL;
  return 720905LL;
}

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  BOOL result = 0LL;
  v6[1] = *MEMORY[0x1895F89C0];
  time_t v5 = 0LL;
  v6[0] = 0LL;
  if (a1 && a2 != -1) {
    return !X509CertificateGetNotBefore(a1, v6)
  }
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6[0]) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  v4[2] = *(const char **)MEMORY[0x1895F89C0];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!(_DWORD)result) {
    return X509TimeConvert(v4, a2);
  }
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  v4[2] = *(const char **)MEMORY[0x1895F89C0];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t result = X509CertificateParseValidity(a1);
  if (!(_DWORD)result) {
    return X509TimeConvert(v4, a2);
  }
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2 = time(0LL);
  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result)
{
  time_t v6[2] = *MEMORY[0x1895F89C0];
  uint64_t v1 = 720906LL;
  if (!result) {
    return v1;
  }
  unint64_t v2 = *(void *)(result + 72);
  uint64_t v3 = *(void *)(result + 80);
  if (!v2 || v3 == 0) {
    return v1;
  }
  if (__CFADD__(v2, v3))
  {
    __break(0x5513u);
  }

  else
  {
    unint64_t v5 = v2 + v3;
    if (v2 <= v5)
    {
      v6[0] = *(void *)(result + 72);
      v6[1] = v5;
      return 720908LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t X509TimeConvert(const char **a1, time_t *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = 720909LL;
  if (!a1) {
    return v2;
  }
  unint64_t v4 = a1[1];
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  unint64_t v7 = *a1;
  if (v4 == (const char *)13)
  {
    uint64_t result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150) {
      v11.tm_year -= 100;
    }
  }

  else
  {
    uint64_t result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }

  uint64_t v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    time_t v10 = timegm(&v11);
    if (v10 == -1) {
      return 720911LL;
    }
    uint64_t v2 = 0LL;
    if (a2) {
      *a2 = v10;
    }
    return v2;
  }

  __break(0x5513u);
  return result;
}

BOOL X509ExtensionParseComponentAuth(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  unint64_t v11 = v3 - *a1;
  if ((ccder_blob_decode_tl() & 1) != 0) {
    goto LABEL_5;
  }
  if (*a1 > a1[1]) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    unint64_t v8 = v12;
    unint64_t v7 = v13;
    if (v12 > v13) {
      goto LABEL_19;
    }
    *a1 = v12;
    a1[1] = v13;
    unint64_t v9 = v11;
  }

  else
  {
    unint64_t v8 = *a1;
    unint64_t v7 = a1[1];
    unint64_t v9 = v7 - *a1;
  }

  if (__CFADD__(v8, v9)) {
    goto LABEL_20;
  }
  if (v7 == v8 + v9)
  {
    if (!v9) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }

      goto LABEL_19;
    }

    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }

LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }

  return v7 == v8 + v9;
}

uint64_t X509ExtensionParseCertifiedChipIntermediate(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556LL)
    {
      __break(0x5513u);
      goto LABEL_12;
    }

    unint64_t v8 = v7 - 0x5555555555555556LL;
    if (a1[1] != v7 - 0x5555555555555556LL) {
      return 0LL;
    }
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8) {
        goto LABEL_12;
      }
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }

    if (v7 <= v8)
    {
      *a1 = v8;
      return 1LL;
    }

uint64_t X509ExtensionParseMFIAuthv3Leaf(unint64_t *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    unint64_t v3 = *a1;
    if (*a1 >= 0x5555555555555556LL)
    {
      __break(0x5513u);
    }

    else
    {
      unint64_t v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556LL) {
        return 0LL;
      }
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1LL;
      }
    }

    __break(0x5519u);
  }

  return result;
}

uint64_t X509ExtensionParseMFISWAuth(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556LL)
    {
      __break(0x5513u);
    }

    else
    {
      unint64_t v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556LL) {
        return 0LL;
      }
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL) {
          goto LABEL_13;
        }
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }

      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1LL;
      }
    }

uint64_t X509ExtensionParseGenericSSLMarker()
{
  return 0LL;
}

uint64_t X509ExtensionParseServerAuthMarker( uint64_t a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = ccder_blob_check_null();
  if ((_DWORD)result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6LL) {
      goto LABEL_26;
    }
    if (__CFADD__(a2, a3)) {
      goto LABEL_26;
    }
    unint64_t v10 = a2 + a3;
    if (a2 + a3 == -1LL) {
      goto LABEL_26;
    }
    unint64_t v11 = a2 + 9;
    unint64_t v12 = (char *)(a2 + 9);
    while (1)
    {
      BOOL v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      BOOL v14 = v13;
      if (!v14) {
        goto LABEL_25;
      }
      int v15 = *v12++;
      if ((v15 & 0x80000000) == 0) {
        return 0LL;
      }
    }

    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }

    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1LL;
      }

      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }

      goto LABEL_25;
    }

    return 0LL;
  }

  return result;
}

uint64_t X509ExtensionParseDeviceAttestationIdentity(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556LL) {
      goto LABEL_17;
    }
    if (a1[1] != v7 - 0x5555555555555556LL) {
      return 0LL;
    }
    if (v7 > v7 - 0x5555555555555556LL) {
      goto LABEL_18;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556LL;
    uint64_t result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      uint64_t result = ccder_blob_decode_tl();
      if ((_DWORD)result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
            goto LABEL_18;
          }
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }

        *a2 |= 0x240000800000uLL;
        unint64_t v8 = *a1;
        if (*a1 < 0x5555555555555556LL)
        {
          unint64_t v9 = v8 - 0x5555555555555556LL;
          if (v8 <= v8 - 0x5555555555555556LL && v9 <= a1[1])
          {
            *a1 = v9;
            return 1LL;
          }

unint64_t *X509ExtensionParseMFI4Properties( unint64_t *result, void *a2, unint64_t *a3)
{
  unint64_t v4 = *result;
  unint64_t v3 = result[1];
  unint64_t v5 = v3 - *result;
  if (v5 != 32) {
    return (unint64_t *)(v5 == 32);
  }
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }

    *a3 = v4;
    a3[1] = 32LL;
  }

  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0LL)
  {
    unint64_t v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *uint64_t result = v6;
      return (unint64_t *)(v5 == 32);
    }

    goto LABEL_12;
  }

unint64_t *X509ChainParseCertificateSet( unint64_t *result, unint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v5 = 0LL;
  *a4 = 0LL;
  a4[1] = 0LL;
  BOOL v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      uint64_t result = 0LL;
      *a5 = v5;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    unint64_t v9 = result;
    uint64_t v10 = 0LL;
    unint64_t v11 = a2 + 304 * a3;
    unint64_t v12 = ~a2;
    BOOL v13 = a4 + 1;
    BOOL v14 = (void *)(a2 + 272);
    uint64_t v15 = a3 - 1;
    unint64_t v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304LL) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      unint64_t v16 = v14 - 34;
      if (v14 != (void *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }

      uint64_t result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if ((_DWORD)result) {
        return result;
      }
      if (v10)
      {
        unint64_t v17 = (void *)*v13;
        void *v14 = 0LL;
        v14[1] = v17;
        *unint64_t v17 = v16;
        *BOOL v13 = (unint64_t)v14;
      }

      else
      {
        uint64_t v18 = *a4;
        *(void *)(a2 + 272) = *a4;
        if (v18) {
          unint64_t v19 = (unint64_t *)(v18 + 280);
        }
        else {
          unint64_t v19 = v13;
        }
        *unint64_t v19 = v21;
        *a4 = v16;
        *(void *)(a2 + 280) = a4;
      }

      uint64_t v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        BOOL v6 = v15 == v10++;
        if (!v6) {
          continue;
        }
      }

      goto LABEL_6;
    }

    __break(0x5513u);
  }

  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  for (uint64_t i = *a1; i; uint64_t i = *(void *)(i + 272))
  {
  }

  return i;
}

void *X509ChainResetChain(void *result, void *a2)
{
  *uint64_t result = 0LL;
  result[1] = result;
  uint64_t v2 = (void *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0LL;
      v2[37] = 0LL;
      uint64_t v2 = (void *)v2[34];
    }

    while (v2);
  }

  return result;
}

uint64_t X509ChainBuildPathPartial(void *a1, uint64_t *a2, void *a3, int a4)
{
  if (!a1) {
    return 327691LL;
  }
  unint64_t v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0LL;
  a1[37] = a3;
  uint64_t v8 = (uint64_t)(a1 + 15);
  uint64_t result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if ((_DWORD)result)
  {
    while (1)
    {
      uint64_t v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (uint64_t CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (unint64_t v7 = (void *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        unint64_t v7 = (void *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (X509ChainGetAppleRootUsingKeyIdentifier(v10, 1)) {
            return 0LL;
          }
          uint64_t BAARootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v10);
          if (a4) {
            unsigned int v16 = 0;
          }
          else {
            unsigned int v16 = 524296;
          }
          if (BAARootUsingKeyIdentifier) {
            return 0LL;
          }
          else {
            return v16;
          }
        }

        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          unint64_t v7 = (void *)v7[34];
          if (!v7) {
            goto LABEL_16;
          }
        }
      }

      unint64_t v12 = (void *)*a3;
      if (*a3) {
        break;
      }
LABEL_13:
      BOOL v13 = (void *)a3[1];
      v7[36] = 0LL;
      v7[37] = v13;
      *BOOL v13 = v7;
      a3[1] = v7 + 36;
      uint64_t v8 = (uint64_t)(v7 + 15);
      int v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      uint64_t result = 0LL;
      if (!v14) {
        return result;
      }
    }

    while (v12 != v7)
    {
      unint64_t v12 = (void *)v12[36];
      if (!v12) {
        goto LABEL_13;
      }
    }

    return 524297LL;
  }

  return result;
}

uint64_t X509ChainGetAppleRootUsingKeyIdentifier(uint64_t result, int a2)
{
  uint64_t v2 = &numAppleRoots;
  if (!a2) {
    uint64_t v2 = &numAppleProdRoots;
  }
  uint64_t v3 = *v2;
  if (*v2)
  {
    uint64_t v4 = result;
    for (uint64_t i = (uint64_t *)&AppleRoots; i < (uint64_t *)&UcrtRootPublicKey && i >= (uint64_t *)&AppleRoots; ++i)
    {
      uint64_t v7 = *i;
      uint64_t result = compare_octet_string(v4, *i + 184);
      if (!(_DWORD)result) {
        return v7;
      }
      if (!--v3) {
        return 0LL;
      }
    }

    __break(0x5519u);
  }

  else
  {
    return 0LL;
  }

  return result;
}

uint64_t X509ChainGetBAARootUsingKeyIdentifier(uint64_t result)
{
  uint64_t v1 = numBAARoots;
  if (numBAARoots)
  {
    uint64_t v2 = result;
    for (uint64_t i = (uint64_t *)&BAARoots; i < (uint64_t *)&SEKTestRootPublicKey && i >= (uint64_t *)&BAARoots; ++i)
    {
      uint64_t v5 = *i;
      uint64_t result = compare_octet_string(v2, *i + 184);
      if (!(_DWORD)result) {
        return v5;
      }
      if (!--v1) {
        return 0LL;
      }
    }

    __break(0x5519u);
  }

  else
  {
    return 0LL;
  }

  return result;
}

uint64_t X509ChainBuildPath(void *a1, uint64_t *a2, void *a3)
{
  return X509ChainBuildPathPartial(a1, a2, a3, 0);
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  BOOL v6 = a2;
  v35[4] = *MEMORY[0x1895F89C0];
  uint64_t v8 = *a2;
  if (a3)
  {
    uint64_t v9 = *(void *)(a3 + 48);
    if (v9)
    {
      if (*(void *)(v9 + 8))
      {
        uint64_t v8 = *v6;
      }
    }
  }

  if (v8)
  {
    uint64_t v31 = v6;
    unint64_t v32 = a4;
    unint64_t v11 = 0LL;
    int v12 = 0;
    char v33 = 0;
    uint64_t v13 = -1LL;
    while (1)
    {
      unint64_t v14 = *(void *)(v8 + 288);
      unint64_t v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        char v16 = 0;
        goto LABEL_11;
      }

      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        char v16 = 0;
        unint64_t v15 = v8 + 304;
        unint64_t v14 = v8;
        goto LABEL_11;
      }

      if (!a3) {
        return v12 | 0x9000Du;
      }
      if (*(_BYTE *)(a3 + 16))
      {
        uint64_t AppleRootUsingKeyIdentifier = X509ChainGetAppleRootUsingKeyIdentifier(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }

      else
      {
        if (!*(void *)(a3 + 24)) {
          goto LABEL_58;
        }
        uint64_t AppleRootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v8 + 168);
      }

      unint64_t v14 = AppleRootUsingKeyIdentifier;
      v33 |= AppleRootUsingKeyIdentifier != 0;
      unint64_t v15 = AppleRootUsingKeyIdentifier + 304;
      if (AppleRootUsingKeyIdentifier) {
        goto LABEL_10;
      }
LABEL_58:
      if (!*(_BYTE *)(a3 + 19)) {
        return v12 | 0x9000Du;
      }
      unint64_t v14 = 0LL;
      char v16 = 1;
LABEL_11:
      if (v11 && *(void *)(v8 + 32) >= 2uLL)
      {
        if (!*(_BYTE *)(v8 + 265))
        {
          int v30 = 589825;
          return v12 | v30;
        }

        if ((*(_BYTE *)(v8 + 264) & 4) == 0)
        {
          int v30 = 589826;
          return v12 | v30;
        }
      }

      unint64_t v17 = *(void *)(v8 + 200);
      if (v17) {
        BOOL v18 = v17 >= v11;
      }
      else {
        BOOL v18 = 1;
      }
      if (!v18)
      {
        int v30 = 589827;
        return v12 | v30;
      }

      if (*(_BYTE *)(v8 + 266))
      {
        int v30 = 589831;
        return v12 | v30;
      }

      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        int v30 = 589828;
        return v12 | v30;
      }

      if ((v16 & 1) == 0 && *(void *)(v8 + 168) && *(void *)(v8 + 176))
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
      }

      if (a3 && v11 && (*(void *)(v8 + 240) & *(void *)(a3 + 8)) == 0LL) {
        X509PolicySetFlagsForCommonNames(v8);
      }
      if (v14 == v8 && !*(void *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(_BYTE *)(a3 + 18) && !X509CertificateIsValid(v8)) {
            return v12 | 0x90009u;
          }
          uint64_t v19 = *(void *)(a3 + 8);
          if (!v11 && (*(void *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            uint64_t v19 = *(void *)(a3 + 8);
          }

          v13 &= *(void *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            int v30 = 589829;
            return v12 | v30;
          }

          goto LABEL_49;
        }
      }

      else if (a3)
      {
        goto LABEL_34;
      }

      v13 &= *(void *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15) {
          goto LABEL_100;
        }
        uint64_t result = X509CertificateCheckSignature(a1, v14, v8 + 16, v8 + 40, (__int128 *)(v8 + 56));
        if ((_DWORD)result) {
          return result;
        }
      }

      unint64_t v21 = v11 + 1;
      if (v11 == -1LL) {
        goto LABEL_99;
      }
      uint64_t v8 = *(void *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        BOOL v6 = v31;
        a4 = v32;
        LOBYTE(v8) = v33;
        if (a3) {
          goto LABEL_61;
        }
        goto LABEL_87;
      }
    }
  }

  unint64_t v21 = 0LL;
  uint64_t v13 = -1LL;
  if (!a3) {
    goto LABEL_87;
  }
LABEL_61:
  if (*(void *)a3)
  {
    unint64_t v22 = v21;
    if ((v8 & 1) != 0)
    {
      unint64_t v22 = v21 + 1;
      if (v21 == -1LL)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }

    if (*(void *)a3 != v22) {
      return ((_DWORD)v22 << 8) | 0x90006u;
    }
  }

  uint64_t v23 = *(void *)(a3 + 24);
  if (!v23 || !*(void *)(v23 + 8))
  {
    if (!*(_BYTE *)(a3 + 16)) {
      goto LABEL_87;
    }
    int v24 = (_DWORD)v21 << 8;
    uint64_t v25 = **(void **)(v6[1] + 8);
LABEL_75:
    uint64_t v27 = 184LL;
    if ((v8 & 1) != 0) {
      uint64_t v27 = 168LL;
    }
    uint64_t v28 = X509ChainGetAppleRootUsingKeyIdentifier(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28) {
      return v24 | 0x9000Bu;
    }
    uint64_t v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, v25 + 16, v25 + 40, (__int128 *)(v25 + 56)))
    {
      goto LABEL_87;
    }

    int v26 = 589836;
    return v24 | v26;
  }

  int v24 = (_DWORD)v21 << 8;
  uint64_t v25 = **(void **)(v6[1] + 8);
  if (*(_BYTE *)(a3 + 16)) {
    goto LABEL_75;
  }
  memset(v35, 170, 32);
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    int v26 = 589832;
    return v24 | v26;
  }

  if (compare_octet_string((uint64_t)&v35[2], *(void *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(void *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey( *(uint64_t **)(a3 + 24),  *(void *)(a3 + 32),  *(__int128 **)(a3 + 40),  v25 + 16,  (__int128 *)(v25 + 40),  (__int128 *)(v25 + 56))) {
      goto LABEL_72;
    }
  }

  else if (!compare_octet_string(*(void *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(void *)(a3 + 40));
  }

LABEL_87:
  uint64_t result = 0LL;
  if (a4) {
    *a4 = v13;
  }
  return result;
}

uint64_t X509ChainCheckPath(char a1, uint64_t *a2, uint64_t a3)
{
  return X509ChainCheckPathWithOptions(a1, a2, a3, 0LL);
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0LL);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3LL;
  }
  uint64_t v4 = *(_BYTE **)result;
  if (*(void *)result == -1LL) {
    goto LABEL_68;
  }
  uint64_t v5 = &v4[v3];
  BOOL v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    int v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1LL)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      unint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0LL;
            }
LABEL_34:
            uint64_t result = 0LL;
            *a3 = v15;
            return result;
          }

LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }

        return 3LL;
      }

      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3LL;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3LL;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3LL;
      }
      unint64_t v15 = 0LL;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1LL)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3LL;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          uint64_t v28 = &v5[-v23];
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0LL;
        }
      }
    }

LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }

  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3LL;
  }
  unint64_t v8 = 0LL;
  uint64_t result = 3LL;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    int v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3LL;
      }
      goto LABEL_20;
    }
  }

  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3LL;
  }
  uint64_t v4 = *(_BYTE **)result;
  if (*(void *)result == -1LL) {
    goto LABEL_54;
  }
  uint64_t v5 = &v4[v3];
  BOOL v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    int v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1LL)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_55;
      }
      unint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        BOOL v17 = v16 < v15 && a3 == 0;
        unint64_t v18 = (unint64_t)(v12 + 1);
        if (v17) {
          return 3LL;
        }
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL)) {
          return 7LL;
        }
        if (v18 <= v18 + v15)
        {
          uint64_t result = 0LL;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }

        goto LABEL_55;
      }

      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3LL;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3LL;
      }
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }

      if (!*v14) {
        return 3LL;
      }
      unint64_t v15 = 0LL;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1LL)
      {
        if (v14 >= v5) {
          goto LABEL_55;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_56;
        }
        unsigned int v23 = *v14++;
        unint64_t v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (v15 <= v22) {
            char v24 = 1;
          }
          else {
            char v24 = a3;
          }
          uint64_t result = 3LL;
          if (v15 >= 0x80 && (v24 & 1) != 0) {
            goto LABEL_28;
          }
          return result;
        }
      }
    }

LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }

  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3LL;
  }
  unint64_t v8 = 0LL;
  uint64_t result = 3LL;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_55;
    }
    int v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3LL;
      }
      goto LABEL_20;
    }
  }

  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  *a3 = 0;
  *a2 = 0LL;
  a2[1] = 0LL;
  if (!*(void *)(result + 8)) {
    return 3LL;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }

      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }

      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1LL)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }

        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0LL;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }

        goto LABEL_19;
      }
    }

    return 3LL;
  }

  if (v3) {
    return 3LL;
  }
  else {
    return 0LL;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3LL;
  }
  uint64_t result = 0LL;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0LL;
      *a3 = a2;
      return result;
    }
  }

  return 3LL;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a2 = v4[0];
    }
  }

  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3LL;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3LL;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7LL;
    }
    goto LABEL_10;
  }

  if (v2 >= 2)
  {
    if (v2 > 9) {
      return 7LL;
    }
  }

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  v8[3] = *MEMORY[0x1895F89C0];
  memset(v8, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0LL);
  if (!(_DWORD)result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008LL)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }

      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0LL;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }

      __break(0x5519u);
    }

    else
    {
      return 2LL;
    }
  }

  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }

  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  unint64_t v10[2] = *MEMORY[0x1895F89C0];
  v10[0] = 0LL;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1LL;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0LL);
  if (!(_DWORD)result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0LL;
        *a1 = v9;
        return result;
      }

      __break(0x5519u);
    }

    __break(0x5513u);
  }

  return result;
}

uint64_t DERParseSequenceToObject( uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  v12[3] = *MEMORY[0x1895F89C0];
  memset(v12, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0LL);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010LL) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2LL;
    }
  }

  return result;
}

uint64_t DERParseSequenceContentToObject( unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  unint64_t v32 = 0LL;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }

  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    uint64_t v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result) {
        break;
      }
      if (a2 <= v13) {
        return 2LL;
      }
      while (1)
      {
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24LL * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24LL * v13 + 8)) {
          break;
        }
        uint64_t result = 2LL;
        if ((v18 & 1) != 0)
        {
          ++v13;
        }

        return result;
      }

      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24LL * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7LL;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3LL;
            }

            goto LABEL_59;
          }

          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }

          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }

      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }

LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }

      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }

    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0LL;
      }

      else
      {
        BOOL v25 = (__int16 *)(a3 + 24LL * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0LL;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }

        return 5LL;
      }
    }
  }

  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0LL;
    }
    else {
      return 3LL;
    }
  }

  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent( unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  unint64_t v4[3] = *MEMORY[0x1895F89C0];
  memset(v4, 170, 24);
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0LL);
  if (!(_DWORD)result)
  {
    if (v4[0] - 0x2000000000000012LL >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2LL;
    }
  }

  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  void v9[2] = *MEMORY[0x1895F89C0];
  v9[0] = 0LL;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }

  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if ((_DWORD)result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if ((_DWORD)result) {
      break;
    }
    if (v7) {
      return 0LL;
    }
  }

  else {
    return result;
  }
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  BOOL result = 0LL;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }

  return result;
}

uint64_t Img4DecodeSecureBootRsa4kSha384IM4C( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&SecureBoot_root_rsa4k_pub, 526LL, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeLocalRsa4kSha384IM4C( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&Local_root_rsa4k_pub, 526LL, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeShamRsa4kSha384IM4C( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&Sham_root_rsa4k_pub, 526LL, a1, a2, a3, a4, a5, a6, a7, a8);
}

void Img4DecodeEvaluateTrust( unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
}

double Img4DecodeCopyPayloadHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyPayloadHashWithCallback(a1, (void (*)(void, void, __int128 *))sha1_digest, a2, a3);
}

double Img4DecodeCopyManifestHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyManifestHashWithCallback(a1, (void (*)(void))sha1_digest, a2, a3);
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v7 = 0LL;
  __int128 v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      double result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }

  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  v6[0] = 0LL;
  v6[1] = 0LL;
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1LL;
  }
  unsigned int v5 = 0;
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t DERImg4Decode(void *a1, unint64_t a2)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0LL;
      unint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      uint64_t result = DERDecodeItem((uint64_t)a1, &v6);
      if (!(_DWORD)result)
      {
        if (v6 == 0x2000000000000010LL)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }

          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0LL);
            if (!(_DWORD)result) {
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
            }
          }

          else
          {
            return 7LL;
          }
        }

        else
        {
          return 2LL;
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceContentToObject( a1,  2u,  (uint64_t)&DERImg4CompressionItemSpecs,  (unint64_t)a2,  0x20uLL,  0LL);
      if (!(_DWORD)result)
      {
        uint64_t result = DERParseInteger(a2, &v5);
        if (!(_DWORD)result)
        {
          if (v5 <= 1) {
            return 0LL;
          }
          else {
            return 6LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0LL);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2LL;
        }

        else if (!*(void *)(a2 + 80) {
               || (__int128 v7 = 0u,
        }
                   __int128 v8 = 0u,
                   uint64_t result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !(_DWORD)result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0LL;
          }
          __int128 v7 = 0u;
          __int128 v8 = 0u;
          uint64_t result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!(_DWORD)result) {
            return 0LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6LL;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0LL);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    uint64_t result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if ((_DWORD)result)
    {
      uint64_t result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0LL);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2LL;
        }

        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0LL;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!(_DWORD)result) {
            return 0LL;
          }
        }
      }
    }

    else
    {
      __int128 v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      __int128 v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      __int128 v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }

  return result;
}

uint64_t DERImg4DecodeManifest(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeManifestCommon( void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6LL;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0LL;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }

    uint64_t result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0LL);
    if (!(_DWORD)result)
    {
      unsigned int v9 = 0;
      uint64_t result = DERParseInteger((char **)(a4 + 16), &v9);
      if ((_DWORD)result) {
        return result;
      }
      if (v9 > 2) {
        return 2LL;
      }
      return 0LL;
    }
  }

  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(void *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeCertificatePropertiesAndPubKey( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v18 = 0LL;
  unint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              v21[0] = a1;
              v21[1] = a2;
              __int128 v16 = 0u;
              __int128 v17 = 0u;
              __int128 v14 = 0u;
              __int128 v15 = 0u;
              uint64_t result = DERDecodeItem((uint64_t)v21, &v18);
              if (!(_DWORD)result)
              {
                if (v18 != 0x2000000000000011LL) {
                  return 2LL;
                }
                if (!DERParseSequenceContentToObject( &v19,  2u,  (uint64_t)&DERIM4CItemSpecs,  (unint64_t)&v16,  0x20uLL,  0LL))
                {
                  uint64_t result = DERDecodeItem((uint64_t)&v16, &v18);
                  if ((_DWORD)result) {
                    return result;
                  }
                  if (v18 != 0x2000000000000010LL) {
                    return 2LL;
                  }
                  if (!DERParseSequenceContentToObject( &v19,  2u,  (uint64_t)&DERCRTPSequenceItemSpecs,  (unint64_t)&v14,  0x20uLL,  0LL))
                  {
                    uint64_t v12 = *((void *)&v15 + 1);
                    *a3 = v15;
                    *a4 = v12;
                    uint64_t result = DERDecodeItem((uint64_t)&v17, &v18);
                    if ((_DWORD)result) {
                      return result;
                    }
                    if (v18 == 4)
                    {
                      uint64_t result = 0LL;
                      uint64_t v13 = v20;
                      *a5 = v19;
                      *a6 = v13;
                      return result;
                    }

                    return 2LL;
                  }
                }

                return 0xFFFFFFFFLL;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6LL;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0LL);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t DERImg4DecodeProperty(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a3)
    {
      unint64_t v14 = 0LL;
      __int128 v15 = 0uLL;
      __int128 v13 = 0uLL;
      uint64_t v11 = 0LL;
      unint64_t v12 = 0LL;
      uint64_t v9 = 0LL;
      unint64_t v10 = 0LL;
      unsigned int v8 = 0;
      uint64_t result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!(_DWORD)result)
      {
        if (v9 != 0x2000000000000010LL) {
          return 2LL;
        }
        uint64_t result = DERDecodeSeqNext(&v10, &v14);
        if ((_DWORD)result) {
          return result;
        }
        if (v14 != 22) {
          return 2LL;
        }
        uint64_t result = DERParseInteger((char **)&v15, &v8);
        if ((_DWORD)result) {
          return result;
        }
        if ((v8 | 0xE000000000000000LL) != a2) {
          return 2LL;
        }
        *(_OWORD *)a3 = v15;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result) {
          return result;
        }
        *(void *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result != 1) {
          return 2LL;
        }
        uint64_t v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }

        else if (v11 == *a1 + v7)
        {
          return 0LL;
        }

        else
        {
          return 7LL;
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  unsigned int v8 = 0;
  v9[0] = 0LL;
  void v9[2] = 0LL;
  v9[1] = 22LL;
  unint64_t v9[3] = 24LL;
  __int128 v10 = a3;
  uint64_t result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = DERParseInteger((char **)a4, &v8);
    if (!(_DWORD)result)
    {
      if ((v8 | 0xE000000000000000LL) == a2)
      {
        uint64_t result = 0LL;
        *(void *)(a4 + 16) = a2 | 0xE000000000000000LL;
        *(void *)(a4 + 40) = a3;
      }

      else
      {
        return 2LL;
      }
    }
  }

  return result;
}

void DERImg4DecodeFindPropertyInSequence( unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  __int128 v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7) {
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
  }
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  v7[0] = 0LL;
  v7[1] = 0LL;
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void DERImg4DecodeParseManifestPropertiesInternal( uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  int v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      unint64_t v14 = 0LL;
      v15[0] = 0LL;
      v15[1] = 0LL;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011LL
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        unint64_t v8 = v11 == 2 ? 0x2000000000000010LL : 0x2000000000000011LL;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000LL, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2) {
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          }
          DERImg4DecodeFindProperty( (unint64_t *)&v13[1] + 1,  0xE00000004D414E50LL,  0x2000000000000011uLL,  (unint64_t)v12);
          if (a3)
          {
            if (!v10) {
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
            }
          }
        }
      }
    }
  }

void DERImg4DecodeParseCertificateProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  unint64_t v11 = 0LL;
  unint64_t v12 = 0LL;
  v16[0] = 0LL;
  v16[1] = 0LL;
  v14[1] = 0LL;
  unint64_t v15 = 0LL;
  uint64_t result = 0xFFFFFFFFLL;
  unint64_t v13 = 0LL;
  v14[0] = 0LL;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!(_DWORD)result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010LL) {
            return 2LL;
          }
          uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if ((_DWORD)result) {
            return result;
          }
          if (v11)
          {
            uint64_t result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!(_DWORD)result)
            {
              uint64_t v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1)) {
                return 7LL;
              }
              BOOL v9 = __CFADD__(v12, v8);
              uint64_t v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }

              else
              {
                uint64_t result = 0LL;
                *a4 = v10;
              }

              return result;
            }

            return 2LL;
          }
        }

        return 3LL;
      }
    }
  }

  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, void *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 136)) {
      BOOL v4 = *(void *)(a1 + 144) != 0LL;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0LL;
    *a2 = v4;
  }

  return result;
}

uint64_t Img4DecodeGetPayload(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        uint64_t result = 0LL;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }

      uint64_t result = 1LL;
    }

    goto LABEL_9;
  }

  uint64_t result = 6LL;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
  }

  return result;
}

uint64_t Img4DecodeGetPayloadType(uint64_t a1, _DWORD *a2)
{
  BOOL v5 = 0;
  uint64_t result = 6LL;
  if (!a1 || !a2 || (uint64_t result = Img4DecodePayloadExists(a1, &v5), (_DWORD)result))
  {
LABEL_6:
    if (!a2) {
      return result;
    }
    goto LABEL_7;
  }

  if (v5)
  {
    uint64_t result = DERParseInteger((char **)(a1 + 104), a2);
    goto LABEL_6;
  }

  uint64_t result = 1LL;
  if (!a2) {
    return result;
  }
LABEL_7:
  if ((_DWORD)result) {
    *a2 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadVersion(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        uint64_t result = 0LL;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 120);
        return result;
      }

      uint64_t result = 1LL;
    }

    goto LABEL_9;
  }

  uint64_t result = 6LL;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
  }

  return result;
}

uint64_t Img4DecodePayloadKeybagExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 152)) {
      BOOL v4 = *(void *)(a1 + 160) != 0LL;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0LL;
    *a2 = v4;
  }

  return result;
}

uint64_t Img4DecodeGetPayloadKeybag(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        uint64_t result = 0LL;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 152);
        return result;
      }

      uint64_t result = 1LL;
    }

    goto LABEL_9;
  }

  uint64_t result = 6LL;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
  }

  return result;
}

uint64_t Img4DecodePayloadCompressionInfoExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 168)) {
      BOOL v4 = *(void *)(a1 + 176) != 0LL;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0LL;
    *a2 = v4;
  }

  return result;
}

uint64_t Img4DecodeGetPayloadCompressionInfo(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  BOOL v11 = 0;
  uint64_t result = 6LL;
  if (!a1) {
    goto LABEL_14;
  }
  if (!a2) {
    goto LABEL_14;
  }
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t result = Img4DecodePayloadExists(a1, &v11);
  if ((_DWORD)result) {
    goto LABEL_14;
  }
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t result = Img4DecodePayloadCompressionInfoExists(a1, &v11);
  if ((_DWORD)result) {
    goto LABEL_14;
  }
  if (!v11)
  {
LABEL_13:
    uint64_t result = 1LL;
    goto LABEL_14;
  }

  __int128 v9 = 0u;
  __int128 v10 = 0u;
  uint64_t v8 = *(void *)(a1 + 168);
  int v7 = (unint64_t *)(a1 + 168);
  if (!v8)
  {
    uint64_t result = 0xFFFFFFFFLL;
    if (!a2) {
      return result;
    }
LABEL_15:
    if (a3)
    {
      *a2 = -1;
      *a3 = -1;
    }

    return result;
  }

  uint64_t result = DERParseSequenceContentToObject( v7,  2u,  (uint64_t)&DERImg4CompressionItemSpecs,  (unint64_t)&v9,  0x20uLL,  0LL);
  if ((_DWORD)result
    || (uint64_t result = DERParseInteger((char **)&v9, a2), (_DWORD)result)
    || (uint64_t result = DERParseInteger((char **)&v10, a3), (_DWORD)result))
  {
LABEL_14:
    if (!a2) {
      return result;
    }
    goto LABEL_15;
  }

  return result;
}

double Img4DecodeCopyPayloadHashWithCallback( uint64_t a1, void (*a2)(void, void, __int128 *), uint64_t a3, int a4)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v7;
    }
LABEL_9:
    *(void *)a3 = 0LL;
    *(void *)(a3 + 8) = 0LL;
    return *(double *)&v7;
  }

  BOOL v9 = 0;
  if (*(_BYTE *)a1)
  {
    __int128 v7 = *(_OWORD *)(a1 + 184);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 200);
    *(_OWORD *)a3 = v7;
  }

  else
  {
    __int128 v10 = 0uLL;
    int v11 = 0;
    a2(*(void *)(a1 + 8), *(void *)(a1 + 16), &v10);
    *(void *)&__int128 v7 = v10;
    *(_OWORD *)a3 = v10;
    *(_DWORD *)(a3 + 16) = v11;
  }

  return *(double *)&v7;
}

uint64_t Img4DecodeCopyPayloadDigest( uint64_t a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v4 = 6LL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          BOOL v10 = 0;
          if (*a4)
          {
            if (!Img4DecodePayloadExists(a1, &v10))
            {
              if (v10)
              {
                if (a3 > 0x30)
                {
                  return 7LL;
                }

                else if (*(_BYTE *)a1)
                {
                  memcpy(a2, (const void *)(a1 + 184), a3);
                  return 0LL;
                }

                else
                {
                  memset(__src, 0, sizeof(__src));
                  uint64_t v4 = (*a4)(*(void *)(a1 + 8), *(void *)(a1 + 16), __src, a3, a4);
                  if (!(_DWORD)v4) {
                    memcpy(a2, __src, a3);
                  }
                }
              }

              else
              {
                return 1LL;
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

uint64_t Img4DecodeManifestExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = *(void *)(a1 + 24) != 0LL;
    }
  }

  return result;
}

double Img4DecodeCopyManifestHashWithCallback(uint64_t a1, void (*a2)(void), uint64_t a3, int a4)
{
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v5;
    }
LABEL_8:
    *(void *)a3 = 0LL;
    *(void *)(a3 + 8) = 0LL;
    return *(double *)&v5;
  }

  if (!*(void *)(a1 + 24)) {
    goto LABEL_8;
  }
  if (*(_BYTE *)(a1 + 1))
  {
    __int128 v5 = *(_OWORD *)(a1 + 328);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 344);
    *(_OWORD *)a3 = v5;
  }

  else
  {
    a2();
    *(void *)&__int128 v5 = 0LL;
    *(_OWORD *)a3 = 0uLL;
    *(_DWORD *)(a3 + 16) = 0;
  }

  return *(double *)&v5;
}

uint64_t Img4DecodeCopyManifestDigest( uint64_t a1, void *__dst, size_t __n, uint64_t (**a4)(uint64_t, void, _OWORD *, size_t, void))
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v4 = 6LL;
  if (a1)
  {
    if (__dst)
    {
      if (__n)
      {
        if (a4)
        {
          __int128 v7 = *a4;
          if (*a4)
          {
            uint64_t v8 = *(void *)(a1 + 24);
            if (v8)
            {
              if (__n > 0x30)
              {
                return 7LL;
              }

              else if (*(_BYTE *)(a1 + 1))
              {
                memcpy(__dst, (const void *)(a1 + 328), __n);
                return 0LL;
              }

              else
              {
                memset(v10, 0, sizeof(v10));
                uint64_t v4 = v7(v8, *(void *)(a1 + 32), v10, __n, a4);
                if (!(_DWORD)v4) {
                  memcpy(__dst, v10, __n);
                }
              }
            }

            else
            {
              return 1LL;
            }
          }
        }
      }
    }
  }

  return v4;
}

uint64_t Img4DecodeGetManifest(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 6LL;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(void *)(a1 + 24);
    *a2 = v5;
    int v6 = *(_DWORD *)(a1 + 32);
    *a3 = v6;
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    int v8 = v7;
    return (v8 << 31 >> 31);
  }

  return result;
}

uint64_t Img4DecodeSectionExists(void *a1, unsigned int a2, char *a3)
{
  uint64_t v3 = 6LL;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56]) {
        goto LABEL_11;
      }
    }

    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      char v4 = 0;
      goto LABEL_12;
    }

    char v4 = 1;
LABEL_12:
    uint64_t v3 = 0LL;
    *a3 = v4;
  }

  return v3;
}

uint64_t Img4DecodeRestoreInfoExists(void *a1, char *a2)
{
  return Img4DecodeSectionExists(a1, 1u, a2);
}

uint64_t Img4DecodeGetRestoreInfoBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  return Img4DecodeGetBooleanFromSection(a1, 1u, a2, a3);
}

uint64_t Img4DecodeGetBooleanFromSection(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4 = 6LL;
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 1uLL, v8);
      uint64_t v4 = v6;
      if (!(_DWORD)v6) {
        return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
      }
    }
  }

  return v4;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 2uLL, v6);
      if (!v5)
      {
      }
    }
  }

void Img4DecodeGetRestoreInfoInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
}

void Img4DecodeGetInteger64FromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t *a4)
{
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 2uLL, v6);
      if (!v5)
      {
      }
    }
  }

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, void *a5)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0LL;
      *a4 = 0LL;
    }

    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
      *a5 = v8;
    }
  }

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 6LL;
  }
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  uint64_t result = 6LL;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!(_DWORD)result) {
        *a2 = (void)v8 != 0LL;
      }
    }
  }

  return result;
}

void Img4DecodePayloadProperty(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    if (a4)
    {
      if (*(void *)(a1 + 8))
      {
        __int128 v10 = 0uLL;
        __int128 v9 = 0uLL;
        memset(v11, 0, sizeof(v11));
        memset(v12, 0, sizeof(v12));
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)v11))
        {
          if (*(void *)&v12[0])
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)v12, 0x2000000000000010LL, &v10);
            if (!v7)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011LL, &v9);
              if (!v8) {
                DERImg4DecodeFindProperty((unint64_t *)&v9, a2, a3, a4);
              }
            }
          }
        }
      }
    }
  }

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v10 = 0uLL;
    __int128 v9 = 0uLL;
    __int128 v8 = 0uLL;
    if (a3)
    {
      if (*(void *)(a1 + 8))
      {
        __int128 v19 = 0uLL;
        __int128 v20 = 0uLL;
        __int128 v17 = 0uLL;
        __int128 v18 = 0uLL;
        __int128 v15 = 0uLL;
        __int128 v16 = 0uLL;
        __int128 v13 = 0uLL;
        __int128 v14 = 0uLL;
        __int128 v11 = 0uLL;
        __int128 v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((void)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010LL, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011LL, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7) {
                  *a3 = (void)v8 != 0LL;
                }
              }
            }
          }
        }
      }
    }
  }

uint64_t Img4DecodeGetPayloadProperties(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 6LL;
  }
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  uint64_t result = 6LL;
  memset(v8, 0, sizeof(v8));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v8);
      if (!(_DWORD)result)
      {
        if ((void)v9)
        {
          uint64_t result = 0LL;
          uint64_t v7 = *((void *)&v9 + 1);
          *a2 = v9;
          a2[1] = v7;
          return result;
        }

        return 6LL;
      }
    }
  }

  return result;
}

uint64_t Img4DecodeCopyPayloadPropertiesDigest( void *a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t result = 6LL;
  if (a1 && a2 && a3)
  {
    if (a3 > 0x30)
    {
      return 7LL;
    }

    else if (a4)
    {
      __int128 v8 = *a4;
      if (*a4)
      {
        memset(v9, 0, sizeof(v9));
        uint64_t result = v8(*a1, a1[1], v9, a3, a4);
        if (!(_DWORD)result)
        {
          memcpy(a2, v9, a3);
          return 0LL;
        }
      }
    }
  }

  return result;
}

void Img4DecodePayloadPropertiesFindItemWithTag(unint64_t *a1, unsigned int a2, void *a3)
{
  if (a1)
  {
    v23[0] = 0LL;
    v23[1] = 0LL;
    v22[0] = 0LL;
    v22[1] = 0LL;
    v21[0] = 0LL;
    v21[1] = 0LL;
    unint64_t v20 = 0LL;
    v19[0] = 0LL;
    v19[1] = 0LL;
    unint64_t v18 = 0LL;
    memset(v17, 0, sizeof(v17));
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    unint64_t v14 = 0LL;
    __int128 v13 = 0uLL;
    __int128 v12 = 0uLL;
    __int128 v11 = 0uLL;
    if (a3)
    {
      if (*a1)
      {
        DERImg4DecodeContentFindItemWithTag(a1, 0x2000000000000010LL, &v11);
        if (!v5)
        {
          if ((void)v11)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 22LL, &v13);
            if (!v6 && !DERImg4DecodeTagCompare((uint64_t)&v13, 0x50415950u))
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 0x2000000000000011LL, &v12);
              if (!v7 && !DERDecodeSeqContentInit((unint64_t *)&v12, v23))
              {
                while (1)
                {
                  do
                  {
                    while (1)
                    {
                      int v8 = DERDecodeSeqNext(v23, &v20);
                      if (!v8) {
                        break;
                      }
                      if (v8 == 1) {
                        return;
                      }
                    }
                  }

                  while (DERDecodeItem((uint64_t)v21, &v18));
                  DERImg4DecodeContentFindItemWithTag(v19, 22LL, &v13);
                  if (v9) {
                    break;
                  }
                  if (!DERImg4DecodeTagCompare((uint64_t)&v13, a2)
                    && !DERDecodeSeqContentInit(v19, v22)
                    && !DERDecodeSeqNext(v22, v17)
                    && v17[0] == 22
                    && !DERDecodeSeqNext(v22, &v14))
                  {
                    if (v15)
                    {
                      uint64_t v10 = v16;
                      *a3 = v15;
                      a3[1] = v10;
                    }

                    return;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

void Img4DecodeGetPayloadPropertiesBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  if (!v4) {
    DERParseBoolean((unsigned __int8 **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!v4) {
    DERParseInteger((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  if (!v4) {
    DERParseInteger64((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v8 = 0u;
  Img4DecodePayloadProperty(a1, a2, 4uLL, (unint64_t)&v8);
  if (!v6)
  {
    uint64_t v7 = v10;
    *a3 = *((void *)&v9 + 1);
    *a4 = v7;
  }

double Img4DecodeGetObjectProperty(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  v14[0] = 0LL;
  v14[1] = 0LL;
  double result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      DERImg4DecodeParseManifestProperties(a1, (unint64_t)v14, 0LL);
      if (v10
        || (DERImg4DecodeFindProperty(v14, a2 | 0xE000000000000000LL, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        double result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }

  return result;
}

uint64_t Img4DecodeGetObjectPropertyBoolean(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4 = 6LL;
  if (a1 && a4)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 1uLL, v8);
    if (!(_DWORD)v6) {
      return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    }
    return v6;
  }

  return v4;
}

void Img4DecodeGetObjectPropertyInteger(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 2uLL, v6);
    }
  }

void Img4DecodeGetObjectPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 2uLL, v6);
    }
  }

void Img4DecodeGetObjectPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 4uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0LL;
      *a4 = 0LL;
    }

    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }

    *a5 = v8;
  }

void Img4DecodeGetObjectPropertyString(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000LL, 0x16uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0LL;
      *a4 = 0LL;
    }

    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }

    *a5 = v8;
  }

void Img4DecodeGetPayloadVersionPropertyString(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a3 && a4)
  {
    uint64_t v14 = 0LL;
    v15[0] = 0LL;
    v15[1] = 0LL;
    memset(v13, 0, sizeof(v13));
    __int128 v12 = 0uLL;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    if (DERDecodeItem(a1, (unint64_t *)&v14)
      || DERImg4DecodeProperty(v15, v14, (uint64_t)v13)
      || (DERImg4DecodeContentFindItemWithTag((unint64_t *)&v13[1] + 1, a2, &v12), v7)
      || DERImg4DecodeProperty(&v12, a2, (uint64_t)&v9))
    {
      uint64_t v8 = 0LL;
      *a3 = 0LL;
    }

    else
    {
      uint64_t v8 = v11;
      *a3 = *((void *)&v10 + 1);
    }

    *a4 = v8;
  }

double Img4DecodeGetPropertyFromSection( uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  *(_OWORD *)__int128 v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    char v14 = 0;
    if (!Img4DecodeSectionExists((void *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)__int128 v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }

      DERImg4DecodeParseManifestProperties(a1, 0LL, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12) {
          return result;
        }
      }
    }

    double result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }

  return result;
}

uint64_t Img4DecodeGetPropertyInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000LL, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((void *)&v9 + 1) != 2LL)
    {
      uint64_t result = 2LL;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }

    if (!a3) {
      return 6LL;
    }
    uint64_t result = DERParseInteger((char **)&v8 + 1, a3);
  }

  if (!a3) {
    return result;
  }
LABEL_6:
  if ((_DWORD)result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000LL, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((void *)&v9 + 1) != 2LL)
    {
      uint64_t result = 2LL;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }

    if (!a3) {
      return 6LL;
    }
    uint64_t result = DERParseInteger64((char **)&v8 + 1, a3);
  }

  if (!a3) {
    return result;
  }
LABEL_6:
  if ((_DWORD)result) {
    *a3 = 0LL;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000LL, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((void *)&v9 + 1) == 1LL)
    {
      if (a3) {
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      }
      else {
        return 6LL;
      }
    }

    else
    {
      return 2LL;
    }
  }

  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v12 = 0u;
  uint64_t result = 6LL;
  if (a3 && a4)
  {
    uint64_t v8 = *a1;
    uint64_t v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    uint64_t result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000LL, (uint64_t)&v12);
    if (!(_DWORD)result)
    {
      if (*((void *)&v14 + 1) == 4LL)
      {
        uint64_t result = 0LL;
        *a3 = *((void *)&v13 + 1);
        int v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }

      uint64_t result = 2LL;
    }

    int v10 = 0;
    *a3 = 0LL;
    goto LABEL_6;
  }

  return result;
}

void Img4DecodeEvaluateCertificateProperties(void *a1)
{
}

void Img4DecodeEvaluateCertificatePropertiesInternal(void *a1, _OWORD *a2)
{
  v21[0] = 0LL;
  v21[1] = 0LL;
  v20[0] = 0LL;
  v20[1] = 0LL;
  uint64_t v19 = 0LL;
  __int128 v18 = 0uLL;
  size_t __n = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v14 = 0LL;
  __s1 = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  memset(v9, 0, sizeof(v9));
  __int128 __s2 = 0uLL;
  __int128 v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011LL)
  {
    while (1)
    {
      uint64_t v4 = (__int128 *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50LL:
LABEL_11:
          __int128 v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((void *)&v13 + 1) != 0x2000000000000011LL
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }

          while (1)
          {
            int v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5) {
              break;
            }
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((void *)&v10 + 1) <= 4uLL && ((1LL << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6) {
                return;
              }
              if (__n != *((void *)&__s2 + 1)) {
                return;
              }
              int v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6) {
                return;
              }
            }

            else if (*((void *)&v10 + 1) != 0xA000000000000000LL)
            {
              if (*((void *)&v10 + 1) != 0xA000000000000001LL || v6 != 1) {
                return;
              }
              int v6 = 0;
            }

            if (v6) {
              return;
            }
          }

          if (v5 != 1) {
            return;
          }
          break;
        case 0xE00000006D616E78LL:
          if (a2) {
            *a2 = v18;
          }
          break;
        case 0xE00000004F424A50LL:
          uint64_t v4 = (__int128 *)(a1 + 9);
          if (a1[9]) {
            goto LABEL_11;
          }
          uint64_t v4 = (__int128 *)(a1 + 9);
          if (a1[10]) {
            goto LABEL_11;
          }
          break;
        default:
          return;
      }
    }
  }

void Img4DecodeCopyManifestTrustedBootPolicyMeasurement( void *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a4)
  {
    if (a5)
    {
      if (a5 <= 0x30)
      {
        memset(v17, 0, sizeof(v17));
        memset(v16, 0, sizeof(v16));
        v10[0] = Img4DecodeDigestInit;
        v10[1] = Img4DecodeDigestUpdate;
        _OWORD v10[2] = Img4DecodeDigestReturnHash;
        *(void *)&__int128 v13 = &default_manifest_property_exclude;
        *((void *)&v13 + 1) = 156LL;
        uint64_t v14 = a3;
        uint64_t v15 = v10;
        Img4DecodeEvaluateCertificatePropertiesInternal(a1, &v13);
        if (!v9)
        {
          if (a1)
          {
            if (a2)
            {
              v11[0] = &v13;
              v11[1] = a2;
              void v11[2] = a1;
              __int128 v12 = v17;
              if (!((unsigned int (*)(void, _BYTE **))*v15)(*(void *)(v14 + 32), &v12)
                && !Img4DecodeEvaluateDictionaryProperties( a1 + 7,  0LL,  (uint64_t (*)(unint64_t, uint64_t *, uint64_t, uint64_t))_Img4DecodeValidateManifestPropertyInterposer,  (uint64_t)v11)
                && !((unsigned int (*)(void, _BYTE **, uint64_t, _BYTE *))v15[2])( *(void *)(v14 + 32),  &v12,  48LL,  v16))
              {
                memcpy(a4, v16, a5);
              }
            }
          }
        }
      }
    }
  }

uint64_t Img4DecodeEvaluateManifestProperties( uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 56), 0LL, a2, a3);
}

uint64_t Img4DecodeEvaluateDictionaryProperties( unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v15 = 0LL;
  unint64_t v16 = 0LL;
  unint64_t v14 = 0LL;
  v13[0] = 0LL;
  v13[1] = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v10 = 0LL;
  memset(v8, 0, sizeof(v8));
  __int128 v9 = 0u;
  if (!a3) {
    return 6LL;
  }
  uint64_t result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!(_DWORD)result)
  {
    while (1)
    {
      uint64_t result = DERDecodeSeqNext(v13, &v14);
      if ((_DWORD)result == 1) {
        return 0LL;
      }
      if ((_DWORD)result) {
        return result;
      }
      uint64_t result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if ((_DWORD)result) {
        return result;
      }
      uint64_t result = 2LL;
      if (*((void *)&v9 + 1) > 0x16uLL
        || ((1LL << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000LL) == 0)
      {
        return result;
      }

      if (HIDWORD(v16)) {
        break;
      }
      uint64_t v10 = v15;
      LODWORD(v11) = v16;
      uint64_t v12 = *((void *)&v9 + 1);
      uint64_t result = a3(v14, &v10, a2, a4);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 7LL;
  }

  return result;
}

uint64_t Img4DecodeEvaluateObjectProperties( uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 72), 1LL, a2, a3);
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      __int128 v7 = 0u;
      __int128 v8 = 0u;
      __int128 v5 = 0u;
      __int128 v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 448) = 0LL;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }

  return result;
}

double Img4DecodeInitPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a3)
  {
    *(void *)&__int128 v5 = a1;
    *((void *)&v5 + 1) = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 128) = 0u;
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 208) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 288) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 368) = 0u;
    *(_OWORD *)(a3 + 384) = 0u;
    *(_OWORD *)(a3 + 400) = 0u;
    *(_OWORD *)(a3 + 416) = 0u;
    *(_OWORD *)(a3 + 432) = 0u;
    *(void *)(a3 + 448) = 0LL;
    if (!DERImg4DecodePayload((uint64_t)&v5, a3 + 88))
    {
      double result = *(double *)&v5;
      *(_OWORD *)(a3 + 8) = v5;
    }
  }

  return result;
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 1, a3, 1229796429);
}

uint64_t Img4DecodeInitManifestCommon(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result = 6LL;
  if (a1 && a4)
  {
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(void *)(a4 + 448) = 0LL;
    if (a5 == 1229796419)
    {
      unint64_t v10 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeCertificate(&v15, v10);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedCertificate(&v15, v10);
      }
    }

    else
    {
      if (a5 != 1229796429) {
        return 2LL;
      }
      unint64_t v9 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeManifest(&v15, v9);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedManifest(&v15, v9);
      }
    }

    if (!(_DWORD)result)
    {
      if (*(void *)(a4 + 264))
      {
        unint64_t v12 = 0LL;
        uint64_t v13 = 0LL;
        uint64_t v14 = 0LL;
        uint64_t v15 = a1;
        uint64_t v16 = a2;
        uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0LL);
        if (!(_DWORD)result)
        {
          *(void *)(a4 + 24) = a1;
          uint64_t v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }

          else
          {
            *(void *)(a4 + 32) = v11;
            if (v11 == a2) {
              return 0LL;
            }
            else {
              return 7LL;
            }
          }
        }
      }

      else
      {
        return 3LL;
      }
    }
  }

  return result;
}

uint64_t Img4DecodeInitUnsignedManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 0, a3, 1229796429);
}

uint64_t Img4DecodeInitCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 1, a3, 1229796419);
}

uint64_t Img4DecodeInitUnsignedCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 0, a3, 1229796419);
}

uint64_t Img4DecodeEvaluateCertificateChain( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 6LL;
  if (a1 && a2 && a3 && a4 && a7 && a6)
  {
    unint64_t v9 = *(void (**)(uint64_t))(a4 + 8);
    if (v9)
    {
      v9(a1);
      return 3LL;
    }
  }

  return result;
}

void Img4DecodeEvaluateTrustWithCallbacks( unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), unsigned int (*a4)(void, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), unsigned int (*a5)(uint64_t, uint64_t), void (*a6)(void, void, uint64_t), uint64_t a7)
{
  if (a2)
  {
    if (a3)
    {
      if (*(void *)(a2 + 24))
      {
        BOOL v16 = 0;
        a6(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376);
        if (!a4( *(void *)(a2 + 296),  *(unsigned int *)(a2 + 304),  *(void *)(a2 + 280),  *(unsigned int *)(a2 + 288),  a2 + 376,  20LL,  a2 + 312,  a2 + 320,  a7))
        {
          DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
          if (!v14)
          {
            DERImg4DecodeFindProperty( (unint64_t *)(a2 + 40),  a1 | 0xE000000000000000LL,  0x2000000000000011uLL,  (unint64_t)v17);
            if (!v15)
            {
              *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v17[1] + 8);
              if (!a5(a2, a7) && !Img4DecodePayloadExists(a2, &v16))
              {
                if (v16)
                {
                  a6(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184);
                  *(_BYTE *)a2 = 1;
                }

                if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0LL, a3, a7)
                  && !Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1LL, a3, a7))
                {
                  a6(*(void *)(a2 + 24), *(void *)(a2 + 32), a2 + 328);
                  *(_BYTE *)(a2 + 1) = 1;
                }
              }
            }
          }
        }
      }
    }
  }

void Img4DecodePerformTrustEvaluation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0LL;
  void v5[2] = 0LL;
  v5[0] = a3;
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(a1, a2, (uint64_t)v5, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatationWithCallbacks( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t Img4DecodeVerifyChainIM4C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, uint64_t a10)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  uint64_t v41 = 0LL;
  __int128 v39 = 0u;
  memset(v40, 0, sizeof(v40));
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t result = 6LL;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  if (a3 && a4 && a5 && a6 && a7 && a8 && a9)
  {
    if (Img4DecodeInitManifestCommon(a3, a4, 1, (uint64_t)&v17, 1229796419)
      || (*(unsigned int (**)(void, void, char *, void, uint64_t))a9)( *((void *)&v33 + 1),  v34,  (char *)v40 + 8,  **(void **)(a9 + 32),  a9)
      || (*(unsigned int (**)(uint64_t, uint64_t, void, void, char *, void, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))(a9 + 16))( a1,  a2,  *((void *)&v34 + 1),  v35,  (char *)v40 + 8,  **(void **)(a9 + 32),  a9,  a10,  v17,  *((void *)&v17 + 1),  v18,  *((void *)&v18 + 1),  v19,  *((void *)&v19 + 1),  v20,  *((void *)&v20 + 1),  v21,  *((void *)&v21 + 1),  v22,  *((void *)&v22 + 1),  v23,  *((void *)&v23 + 1),  v24,  *((void *)&v24 + 1),  v25,  *((void *)&v25 + 1),  v26,  *((void *)&v26 + 1),  v27,  *((void *)&v27 + 1),  v28,  *((void *)&v28 + 1),  v29,  *((void *)&v29 + 1),  v30,  *((void *)&v30 + 1),  v31,  *((void *)&v31 + 1),  v32,  *((void *)&v32 + 1),  v33))
    {
      return 0xFFFFFFFFLL;
    }

    else if (DERImg4DecodeCertificatePropertiesAndPubKey(*((uint64_t *)&v33 + 1), v34, a7, a8, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void _Img4DecodePerformTrustEvaluationWithCallbacksInternal( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      BOOL v21 = 0;
      if (a4)
      {
        if (*(void *)a3)
        {
          if (*(void *)a4)
          {
            if (*(void *)(a4 + 24))
            {
              if (*(void *)(a4 + 8))
              {
                if (*(void *)(a4 + 16))
                {
                  unint64_t v9 = *(void **)(a4 + 32);
                  if (v9)
                  {
                    if (*(void *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(_BYTE *)(a2 + 1) = 1;
                      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (int v14 = (const void *)v13(a2, a6)) != 0LL
                        && !memcmp((const void *)(a2 + 328), v14, **(void **)(a4 + 32)))
                      {
                        int v15 = 0;
                      }

                      else
                      {
                        if ((*(unsigned int (**)(void, void, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))( *(void *)(a2 + 296),  *(void *)(a2 + 304),  &v22,  &v23,  a2 + 312,  a2 + 320,  a4,  a6)
                          || **(void **)(a4 + 32) > 0x30uLL
                          || (*(unsigned int (**)(void, void, uint64_t))a4)( *(void *)(a2 + 264),  *(void *)(a2 + 272),  a2 + 376)
                          || (*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t, void, uint64_t, uint64_t))(a4 + 16))( v22,  v23,  *(void *)(a2 + 280),  *(void *)(a2 + 288),  a2 + 376,  **(void **)(a4 + 32),  a4,  a6))
                        {
                          return;
                        }

                        int v15 = 1;
                      }

                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16) {
                        return;
                      }
                      if ((a5 & 1) == 0)
                      {
                        __int128 v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        unint64_t v18 = a1 | 0xE000000000000000LL;
                        __int128 v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011LL, v24, a6)) {
                            return;
                          }
                        }

                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20) {
                            return;
                          }
                        }

                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }

                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(void **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(void, void, uint64_t, void, uint64_t))a4)( *(void *)(a2 + 8),  *(void *)(a2 + 16),  a2 + 184,  **(void **)(a4 + 32),  a4))
                          {
                            return;
                          }

                          *(_BYTE *)a2 = 1;
                        }

                        if (!Img4DecodeEvaluateDictionaryProperties( (unint64_t *)(a2 + 56),  0LL,  *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3,  a6)
                          && (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties( (unint64_t *)(a2 + 72),  1LL,  *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3,  a6);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

void Img4DecodePerformManifestTrustEvaluationWithCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t _Img4DecodeValidateManifestPropertyInterposer(unsigned int a1, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v10 = a1;
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  __int128 v8 = *(void **)a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v13 = 0u;
  v12[0] = 0LL;
  v12[1] = 0LL;
  memset(v11, 0, sizeof(v11));
  if (v8
    && !DERImg4DecodeProperty(v8, 0xE00000006D616E78LL, (uint64_t)&v13)
    && *((void *)&v15 + 1) == 0x2000000000000011LL
    && !DERDecodeSeqContentInit((unint64_t *)&v14 + 1, v12))
  {
    unint64_t v9 = a1 | 0xE000000000000000LL;
    while (!DERDecodeSeqNext(v12, v11))
    {
      if (v11[0] == v9)
      {
        (*(void (**)(void, uint64_t, uint64_t, unsigned int *))(*(void *)(*(void *)a4 + 24LL) + 8LL))( *(void *)(*(void *)(*(void *)a4 + 16LL) + 32LL),  a4 + 24,  4LL,  &v10);
        return 0LL;
      }
    }
  }

  (*(void (**)(void, uint64_t, void, void))(*(void *)(*(void *)a4 + 24LL) + 8LL))( *(void *)(*(void *)(*(void *)a4 + 16LL) + 32LL),  a4 + 24,  *(unsigned int *)(a2 + 8),  *(void *)a2);
  return 0LL;
}

uint64_t sha1_digest()
{
  return ccdigest();
}

uint64_t verify_signature_rsa3k( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v14[0] = a1;
  v14[1] = a2;
  v13[0] = a3;
  v13[1] = a4;
  v12[0] = a5;
  v12[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = *(void *)(a7 + 32);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *(void ***)(v8 + 16);
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v10 = *v9;
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  if (*v10 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = verify_pkcs1_sig((uint64_t)v14, v10[4], (uint64_t)v12, (uint64_t)v13, 3072LL, a6, a7, a8);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_pkcs1_sig( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v21[4] = *MEMORY[0x1895F89C0];
  if (a5 != 4096 && a5 != 3072) {
    return 0xFFFFFFFFLL;
  }
  void v21[2] = 0LL;
  unint64_t v21[3] = 0LL;
  unint64_t v9 = (unint64_t)(a5 + 63) >> 6;
  MEMORY[0x1895F8858](a1, (24 * v9 + 71) & 0x7FFFFFFFFFFFFFE0LL, a3, a4, a5, a6, a7, a8);
  uint64_t v11 = (unint64_t *)((char *)v20 - v10);
  bzero((char *)v20 - v10, v10);
  *uint64_t v11 = v9;
  uint64_t v12 = *(unsigned int *)(a1 + 8);
  v21[0] = *(void *)a1;
  v21[1] = v12;
  memset(v20, 0, sizeof(v20));
  uint64_t result = DERParseSequenceToObject( (uint64_t)v21,  (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs,  (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs,  (unint64_t)v20,  0x20uLL,  0x20uLL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v14 = *((void *)&v20[0] + 1);
  for (uint64_t i = *(_BYTE **)&v20[0]; v14; --v14)
  {
    if (*i) {
      break;
    }
    if (i == (_BYTE *)-1LL) {
      __break(0x5513u);
    }
    ++i;
  }

  if (v14 >= 0xFFFFFFFFFFFFFFF8LL)
  {
    __break(0x5500u);
    return result;
  }

  unint64_t v16 = (v14 + 7) >> 3;
  if (v16 > *v11) {
    return 0xFFFFFFFFLL;
  }
  *uint64_t v11 = v16;
  if (MEMORY[0x1895FA220]) {
    BOOL v17 = MEMORY[0x1895F8218] == 0LL;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    int v19 = ccrsa_verify_pkcs1v15_digest();
    return 0xFFFFFFFFLL;
  }

  LOBYTE(v20[0]) = 0;
  int v18 = ccrsa_verify_pkcs1v15();
  uint64_t result = 0xFFFFFFFFLL;
  if (!v18 && LOBYTE(v20[0])) {
    return 0LL;
  }
  return result;
}

uint64_t verify_signature_rsa( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v14[0] = a1;
  v14[1] = a2;
  v13[0] = a3;
  v13[1] = a4;
  v12[0] = a5;
  v12[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = *(void *)(a7 + 32);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *(void ***)(v8 + 16);
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  size_t v10 = *v9;
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  if (*v10 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = verify_pkcs1_sig((uint64_t)v14, v10[4], (uint64_t)v12, (uint64_t)v13, 4096LL, a6, a7, a8);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

void verify_signature_ecdsa( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              if (a7)
              {
                __int128 v7 = *(void **)(a7 + 32);
                if (v7)
                {
                  if (v7[2] && *(void *)(a7 + 48) && *v7 == a6)
                  {
                    v8[0] = a1;
                    v8[1] = a2;
                    verify_ecdsa_sig(v8);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

void verify_ecdsa_sig(void *a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v18[7] = 0;
  ccec_x963_import_pub_size();
  if (ccec_keysize_is_supported())
  {
    cp = (void *)ccec_get_cp();
    uint64_t v9 = *cp;
    if (*cp >> 61 || !is_mul_ok(8 * v9, 3uLL))
    {
      __break(0x550Cu);
    }

    else
    {
      uint64_t v10 = 24 * v9;
      BOOL v11 = __CFADD__(v10, 16LL);
      uint64_t v12 = v10 + 16;
      if (!v11)
      {
        BOOL v11 = __CFADD__(v12, 16LL);
        uint64_t v13 = v12 + 16;
        if (!v11)
        {
          unint64_t v14 = cp;
          unint64_t v15 = v13 - 1;
          MEMORY[0x1895F8858](cp, (v13 - 1) & 0xFFFFFFFFFFFFFFF0LL, v3, v4, v5, v6, v7, v8);
          BOOL v17 = &v18[-v16];
          bzero(&v18[-v16], v16);
          if (v15 < 0x10)
          {
            __break(1u);
          }

          else
          {
            *BOOL v17 = v14;
          }

          return;
        }
      }
    }

    __break(0x5500u);
  }

uint64_t verify_chain_img4_v1( unint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215LL;
        if (!_crack_chain_with_anchor(v26, (uint64_t)v27, 3u)
          && !parse_chain((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          __int128 v24 = a6;
          uint64_t v15 = 0LL;
          size_t v16 = (const void **)v32;
          BOOL v17 = &v30;
          int v18 = (const void **)v32;
          while (1)
          {
            uint64_t v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            BOOL v21 = *v18;
            v18 += 20;
            uint64_t result = verify_chain_signatures(&v34[v15], v17, a7);
            if ((_DWORD)result) {
              break;
            }
            v17 += 6;
            ++v15;
            size_t v16 = v18;
            if (v15 == 2)
            {
              __int128 v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }

              v42[0] = 0LL;
              v42[1] = 0LL;
              unint64_t v40 = 0LL;
              v41[0] = 0LL;
              v41[1] = 0LL;
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011LL)
              {
                v47[0] = 0LL;
                v47[1] = 0LL;
                unint64_t v45 = 0LL;
                v46[0] = 0LL;
                v46[1] = 0LL;
                __int128 v43 = 0u;
                __int128 v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    int v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1) {
                        goto LABEL_14;
                      }
                      return 0xFFFFFFFFLL;
                    }

                    if (v45 != 0x2000000000000010LL
                      || DERParseSequenceContentToObject( v46,  (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs,  (uint64_t)&DERAttributeTypeAndValueItemSpecs,  (unint64_t)&v43,  0x20uLL,  0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }

                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  __int128 v25 = v44;
                  uint64_t result = DEROidCompare((uint64_t)&verify_chain_img4_v1_sboot_item, (uint64_t)&v25);
                  if (!(_DWORD)result) {
                    return 0xFFFFFFFFLL;
                  }
                  *a3 = v35;
                  *a4 = v36;
                  if (!v38) {
                    return 0LL;
                  }
                  uint64_t v23 = v39;
                  if (!v39) {
                    return 0LL;
                  }
                  uint64_t result = 0LL;
                  if (a5)
                  {
                    if (v24)
                    {
                      uint64_t result = 0LL;
                      *a5 = v38;
                      *__int128 v24 = v23;
                    }
                  }

                  return result;
                }
              }

              return 0xFFFFFFFFLL;
            }
          }
        }

        return 0xFFFFFFFFLL;
      }
    }
  }

  return result;
}

uint64_t parse_chain(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = 0LL;
  uint64_t v15 = result;
  unint64_t v18 = ~result;
  unint64_t v17 = ~a3;
  unint64_t v14 = ~a4;
  unint64_t v13 = ~a5;
  unint64_t v11 = ~a6;
  uint64_t v10 = a2;
  while (1)
  {
    unint64_t v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17) {
      break;
    }
    uint64_t result = DERParseSequenceToObject( v15 + 16 * v8,  (unsigned __int16)DERNumSignedCertCrlItemSpecs,  (uint64_t)&DERSignedCertCrlItemSpecs,  a3 + 48 * v8,  0x30uLL,  0x30uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (160 * v8 > v14) {
      break;
    }
    uint64_t result = DERParseSequenceToObject( a3 + 48 * v8,  (unsigned __int16)DERNumTBSCertItemSpecs,  (uint64_t)&DERTBSCertItemSpecs,  a4 + 160 * v8,  0xA0uLL,  0xA0uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v13) {
      break;
    }
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    char v21 = 0;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    if (DERParseSequenceContentToObject( (unint64_t *)(a4 + 160 * v8 + 96),  (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs,  (uint64_t)&DERSubjPubKeyInfoItemSpecs,  (unint64_t)&v22,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    if (DERParseSequenceContentToObject( (unint64_t *)&v22,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v19,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    uint64_t result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!(_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (*((void *)&v20 + 1))
    {
      if (*((void *)&v20 + 1) != 2LL || *(_BYTE *)v20 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v20 == -1LL) {
        break;
      }
      if (*(_BYTE *)(v20 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }

    uint64_t result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if ((_DWORD)result || v21) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v11) {
      break;
    }
    uint64_t result = parse_extensions(a4 + 160 * v8, (void *)(a6 + 16 * v8));
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (++v8 == v10) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t verify_chain_signatures(void *a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  char v10 = 0;
  memset(v13, 0, sizeof(v13));
  unint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v5 = *(void **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(void *)a3
    || !*(void *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject( a2 + 2,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v11,  0x20uLL,  0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }

  if (*((void *)&v12 + 1))
  {
    uint64_t result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((void *)&v12 + 1) != 2LL || *(_BYTE *)v12 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v12 == -1LL)
      {
        __break(0x5513u);
        return result;
      }

      if (*(_BYTE *)(v12 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
  }

  if ((*(unsigned int (**)(void, void, _OWORD *, void, uint64_t))a3)( *a2,  a2[1],  v13,  **(void **)(a3 + 32),  a3))
  {
    return 0xFFFFFFFFLL;
  }

  if (v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t, _OWORD *, void, uint64_t, void))(a3 + 16))( *a1,  a1[1],  v8,  v9,  v13,  **(void **)(a3 + 32),  a3,  0LL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_chain_img4_x86( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_x86);
}

uint64_t verify_chain_img4_v2_with_crack_callback( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, _BYTE *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v22, 0x300uLL);
        v21[0] = a1;
        v21[1] = v10;
        if (a8(v21, v22, 2LL)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t result = parse_chain((uint64_t)v22, 2u, (uint64_t)v23, (uint64_t)&v24, (uint64_t)v27, (uint64_t)v28);
        if ((_DWORD)result)
        {
          return 0xFFFFFFFFLL;
        }

        else
        {
          char v16 = 1;
          uint64_t v17 = 1LL;
          while ((v16 & 1) != 0)
          {
            unint64_t v18 = &v21[20 * v17];
            if (__n == v18[33] && !memcmp(__s1, (const void *)v18[32], __n))
            {
              uint64_t result = verify_chain_signatures(v27, &v23[3 * v17], a7);
              char v16 = 0;
              uint64_t v17 = 2LL;
              if (!(_DWORD)result) {
                continue;
              }
            }

            return 0xFFFFFFFFLL;
          }

          if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFEFLL
            || (*a3 = v27[2], *a4 = v27[3], (unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL))
          {
            __break(0x5513u);
          }

          else if (v29 && (uint64_t v19 = v30) != 0)
          {
            uint64_t result = 0LL;
            if (a5 && a6)
            {
              uint64_t result = 0LL;
              *a5 = v29;
              *a6 = v19;
            }
          }

          else
          {
            return 0LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t crack_chain_rsa4k_sha384_x86(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_X86_ROOT_CA_CERTIFICATE;
  a2[1] = 1382LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ddi( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_ddi);
}

uint64_t crack_chain_rsa4k_sha384_ddi(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_ROOT_CA_CERTIFICATE;
  a2[1] = 1394LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ddi_global( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_ddi_global);
}

uint64_t crack_chain_rsa4k_sha384_ddi_global(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1404LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ddi_fake( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_ddi_fake);
}

uint64_t crack_chain_rsa4k_sha384_ddi_fake(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_ROOT_CA_CERTIFICATE;
  a2[1] = 1425LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ddi_fake_global( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_ddi_fake_global);
}

uint64_t crack_chain_rsa4k_sha384_ddi_fake_global(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1435LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_avp( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_avp);
}

uint64_t crack_chain_rsa4k_sha384_avp(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_AVP_ROOT_CA_CERTIFICATE;
  a2[1] = 1431LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_tatsu_local_policy);
}

uint64_t crack_chain_rsa4k_sha384_tatsu_local_policy(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1382LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy_hacktivate( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_tatsu_local_policy_hacktivate);
}

uint64_t crack_chain_rsa4k_sha384_tatsu_local_policy_hacktivate( unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1442LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_v2_rsa3k( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_rsa3k_sha384);
}

uint64_t crack_chain_rsa3k_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA3K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1118LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_v2( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384);
}

uint64_t crack_chain_rsa4k_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1374LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_v2_AWG1( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_AWG1);
}

uint64_t crack_chain_rsa4k_sha384_AWG1(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE_AWG1;
  a2[1] = 1404LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_v2_PED( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_PED);
}

uint64_t crack_chain_rsa4k_sha384_PED(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_PED_ROOT_CA_CERTIFICATE;
  a2[1] = 1400LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ec_v1( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, _BYTE *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v27, 0x330uLL);
        v26[0] = a1;
        v26[1] = v10;
        if (!a8(v26, v27, 3LL)
          && !parse_ec_chain( (uint64_t)v27,  3u,  (uint64_t)&v28,  (uint64_t)&v30,  (unint64_t)v32,  (unint64_t)&v35,  (uint64_t)v36))
        {
          __int128 v25 = a4;
          uint64_t v15 = 0LL;
          char v16 = (const void **)v31;
          uint64_t v17 = &v29;
          unint64_t v18 = (const void **)v31;
          while (1)
          {
            uint64_t v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            char v21 = *v18;
            v18 += 20;
            uint64_t result = verify_chain_signatures(&v32[v15], v17, a7);
            if ((_DWORD)result) {
              break;
            }
            v17 += 6;
            ++v15;
            char v16 = v18;
            if (v15 == 2)
            {
              if ((unint64_t)v32 > 0xFFFFFFFFFFFFFFDFLL
                || (*a3 = v33, *__int128 v25 = v34, (unint64_t)v36 > 0xFFFFFFFFFFFFFFDFLL))
              {
                __break(0x5513u);
              }

              else if (v37 && (uint64_t v22 = v38) != 0)
              {
                uint64_t result = 0LL;
                if (a5)
                {
                  if (a6)
                  {
                    uint64_t result = 0LL;
                    *a5 = v37;
                    *a6 = v22;
                  }
                }
              }

              else
              {
                return 0LL;
              }

              return result;
            }
          }
        }

        return 0xFFFFFFFFLL;
      }
    }
  }

  return result;
}

uint64_t parse_ec_chain( uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  if (!a2) {
    return 0LL;
  }
  unint64_t v9 = 0LL;
  unint64_t v10 = 0LL;
  unint64_t v11 = 0LL;
  uint64_t v21 = result;
  unint64_t v24 = ~result;
  unint64_t v23 = ~a3;
  unint64_t v20 = ~a4;
  if (a5 <= a6) {
    unint64_t v12 = a6;
  }
  else {
    unint64_t v12 = a5;
  }
  unint64_t v19 = ~v12;
  unint64_t v16 = ~a7;
  uint64_t v15 = 16LL * a2;
  while (v11 <= v24 && v10 <= v23)
  {
    uint64_t result = DERParseSequenceToObject( v21 + v11,  (unsigned __int16)DERNumSignedCertCrlItemSpecs,  (uint64_t)&DERSignedCertCrlItemSpecs,  a3 + v10,  0x30uLL,  0x30uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v20) {
      break;
    }
    uint64_t result = DERParseSequenceToObject( a3 + v10,  (unsigned __int16)DERNumTBSCertItemSpecs,  (uint64_t)&DERTBSCertItemSpecs,  a4 + v9,  0xA0uLL,  0xA0uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (v11 > v19) {
      break;
    }
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    char v30 = 0;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    if (DERParseSequenceContentToObject( (unint64_t *)(a4 + v9 + 96),  (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs,  (uint64_t)&DERSubjPubKeyInfoItemSpecs,  (unint64_t)&v31,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    if (DERParseSequenceContentToObject( (unint64_t *)&v31,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v28,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    if (v30) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
    uint64_t v27 = 0LL;
    uint64_t result = DERDecodeItem((uint64_t)&v29, &v25);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v13 = (void *)(a6 + v11);
    uint64_t v14 = v27;
    *unint64_t v13 = v26;
    v13[1] = v14;
    if (v11 > v16) {
      break;
    }
    uint64_t result = parse_extensions(a4 + v9, (void *)(a7 + v11));
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    v11 += 16LL;
    v10 += 48LL;
    v9 += 160LL;
    if (v15 == v11) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t verify_chain_img4_ecdsa256( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v2( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_ecdsa256_sha256);
}

uint64_t verify_chain_img4_ec_v2( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, _BYTE *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1) {
    return result;
  }
  unsigned int v10 = a2;
  if (!a2 || !a3 || !a4) {
    return result;
  }
  bzero(v20, 0x220uLL);
  v19[0] = a1;
  v19[1] = v10;
  if (a8(v19, v20, 2LL)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = parse_ec_chain( (uint64_t)v20,  2u,  (uint64_t)v21,  (uint64_t)v23,  (unint64_t)v28,  (unint64_t)&v29,  (uint64_t)v30);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  if (__n != v27) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = memcmp(__s1, __s2, __n);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v21 > 0xFFFFFFFFFFFFFFCFLL)
  {
LABEL_22:
    __break(0x5513u);
    return result;
  }

  uint64_t result = verify_chain_signatures(v28, v22, a7);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v16 = v28[3];
  *a3 = v28[2];
  *a4 = v16;
  if (!v31) {
    return 0LL;
  }
  uint64_t v17 = v32;
  if (!v32) {
    return 0LL;
  }
  uint64_t result = 0LL;
  if (a5)
  {
    if (a6)
    {
      uint64_t result = 0LL;
      *a5 = v31;
      *a6 = v17;
    }
  }

  return result;
}

uint64_t crack_chain_ecdsa256_sha256(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC256_SHA256_ROOT_CA_CERTIFICATE;
  a2[1] = 551LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ecdsa384( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v2( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_ecdsa384_sha384_hacktivate);
}

uint64_t crack_chain_ecdsa384_sha384_hacktivate(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 610LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ecdsa384_local_policy( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_ecdsa384_sha384);
}

uint64_t crack_chain_ecdsa384_sha384(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &EC384_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 542LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_ecdsa384_hacktivate( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_ecdsa384_sha384_hacktivate);
}

uint64_t verify_chain_img4_ecdsa384_qa( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))crack_chain_ecdsa384_sha384_qa);
}

uint64_t crack_chain_ecdsa384_sha384_qa(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &QA_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 540LL;
  else {
    return 0LL;
  }
}

uint64_t Img4DecodeDigestInit(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = *(void **)(a1 + 16);
  if (!v1 || !*v1) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_init();
  return 0LL;
}

uint64_t Img4DecodeDigestUpdate(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!**(void **)(a1 + 16)) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_update();
  return 0LL;
}

uint64_t Img4DecodeDigestReturnHash(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = **(void **)(a1 + 16);
  if (!v4 || *(void *)v4 > a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 56))(v4, *a2, a4);
  return 0LL;
}

uint64_t Img4DecodeDigestFinal(uint64_t a1, void *a2, uint64_t a3)
{
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    unint64_t v8 = *(void **)(a5 + 32);
    if (v8 && (unint64_t v9 = (void *)v8[2]) != 0LL && *v8 == a4 && *v9 && *(void *)*v9 == a4)
    {
      ccdigest();
      return 0LL;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t img4_verify_signature_with_chain( unint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, void *a7, void *a8)
{
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  *a7 = v16;
  *a8 = v17;
  uint64_t result = verify_signature_rsa(v18, v19, a3, a4, a5, a6, (uint64_t)kImg4DecodeSecureBootRsa1kSha1, v14);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t _crack_chain_with_anchor(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v18 = 0LL;
  unint64_t v19 = 0LL;
  unint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  unint64_t v5 = ~a2;
  unsigned int v6 = 1;
  unint64_t v7 = *a1;
  unint64_t v8 = a1[1];
  while (1)
  {
    unint64_t v18 = v7;
    unint64_t v19 = v8;
    uint64_t result = DERDecodeItem((uint64_t)&v18, &v15);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (__CFADD__(v16, v17)) {
      break;
    }
    unint64_t v10 = v16 + v17;
    unint64_t v11 = v16 + v17 - v7;
    BOOL v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v14 = (unint64_t *)(a2 + 16LL * v6);
    unint64_t *v14 = v7;
    v14[1] = v11;
    if (v10 < v7) {
      break;
    }
    BOOL v12 = v8 >= v11;
    v8 -= v11;
    if (!v12) {
      goto LABEL_21;
    }
    ++v6;
    unint64_t v7 = v10;
    if (!v8)
    {
      if (v6 == a3) {
        return 0LL;
      }
      return 0xFFFFFFFFLL;
    }
  }

  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t parse_extensions(uint64_t a1, void *a2)
{
  v11[0] = 0LL;
  v11[1] = 0LL;
  v9[1] = 0LL;
  uint64_t v10 = 0LL;
  unint64_t v8 = 0LL;
  v9[0] = 0LL;
  __int128 v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0LL;
  a2[1] = 0LL;
  if (!*(void *)(a1 + 152)) {
    return 0LL;
  }
  char v3 = 1;
  while (1)
  {
    int v4 = DERDecodeSeqNext(v11, &v8);
    if (v4) {
      break;
    }
    if (v8 != 0x2000000000000010LL
      || DERParseSequenceContentToObject( v9,  (unsigned __int16)DERNumExtensionItemSpecs,  (uint64_t)&DERExtensionItemSpecs,  (unint64_t)v6,  0x30uLL,  0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }

    char v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      char v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }

  if (v4 != 1 || (v3 & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

_DWORD *DEREncoderCreate(int a1)
{
  uint64_t result = calloc(1uLL, 0x10uLL);
  if (result) {
    result[3] = a1;
  }
  return result;
}

void DEREncoderDestroy(void **a1)
{
  if (a1)
  {
    unint64_t v2 = *a1;
    if (v2)
    {
      do
      {
        char v3 = (void *)*v2;
        _EncodedDataRelease((uint64_t)v2);
        unint64_t v2 = v3;
      }

      while (v3);
    }

    free(a1);
  }

uint64_t DEREncoderAddData( uint64_t *a1, unsigned int a2, unsigned int a3, const void *a4, unsigned int a5, int a6)
{
  __int128 v7 = _EncodedDataCreate(a2, a3, a4, a5, a6, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v7);
}

uint64_t _DEREncoderAddEncodedData(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (!a1)
  {
    uint64_t v22 = 1LL;
    if (!a2) {
      return v22;
    }
    goto LABEL_30;
  }

  if (!a2) {
    return 2LL;
  }
  int v4 = *((_DWORD *)a1 + 2);
  uint64_t v5 = a2;
  do
  {
    int v6 = *(_DWORD *)(v5 + 20);
    BOOL v7 = __CFADD__(v4, v6);
    int v8 = v4 + v6;
    if (v7 || (v9 = *(_DWORD *)(v5 + 24), int v4 = v8 + v9, __CFADD__(v8, v9)))
    {
      uint64_t v22 = 2LL;
      do
      {
LABEL_30:
        uint64_t v23 = *(void *)v2;
        _EncodedDataRelease(v2);
        uint64_t v2 = v23;
      }

      while (v23);
      return v22;
    }

    uint64_t v5 = *(void *)v5;
  }

  while (v5);
  uint64_t v10 = (uint64_t *)*a1;
  unint64_t v11 = a1;
  if (!*a1) {
    goto LABEL_26;
  }
  int v12 = *((_DWORD *)a1 + 3);
  unint64_t v11 = a1;
  while (2)
  {
    unint64_t v13 = v11;
    unint64_t v11 = v10;
    if (!v12) {
      goto LABEL_20;
    }
    unint64_t v14 = bswap64(*(void *)(v2 + 28));
    unint64_t v15 = bswap64(*(uint64_t *)((char *)v11 + 28));
    if (v14 != v15 || (v14 = bswap64(*(void *)(v2 + 36)), unint64_t v15 = bswap64(*(uint64_t *)((char *)v11 + 36)), v14 != v15))
    {
      if (v14 < v15) {
        int v16 = -1;
      }
      else {
        int v16 = 1;
      }
LABEL_19:
      if (v16 < 0) {
        break;
      }
      goto LABEL_20;
    }

    unsigned int v17 = *(_DWORD *)(v2 + 24);
    unsigned int v18 = *((_DWORD *)v11 + 6);
    if (v17 >= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    int v16 = memcmp(*(const void **)(v2 + 8), (const void *)v11[1], v19);
    if (v16) {
      goto LABEL_19;
    }
    if (v17 >= v18)
    {
LABEL_20:
      uint64_t v10 = (uint64_t *)*v11;
      if (!*v11) {
        goto LABEL_26;
      }
      continue;
    }

    break;
  }

  unint64_t v20 = (void *)v2;
  do
  {
    uint64_t v21 = v20;
    unint64_t v20 = (void *)*v20;
  }

  while (v20);
  *uint64_t v21 = v11;
  unint64_t v11 = v13;
LABEL_26:
  uint64_t v22 = 0LL;
  *unint64_t v11 = v2;
  *((_DWORD *)a1 + 2) = v4;
  return v22;
}

char *_EncodedDataCreate(unsigned int a1, unsigned int a2, const void *a3, unsigned int a4, int a5, int a6)
{
  v28[1] = *MEMORY[0x1895F89C0];
  if (!a3 && a4 && a6) {
    return 0LL;
  }
  int v12 = (char *)calloc(1uLL, 0x38uLL);
  unint64_t v13 = v12;
  if (!v12) {
    return v13;
  }
  *((_DWORD *)v12 + 4) = 1;
  unint64_t v14 = v12 + 28;
  if (a1 == 259)
  {
    int v15 = 0;
    goto LABEL_7;
  }

  if (a1 > 3) {
    goto LABEL_40;
  }
  if (a2 > 0x1E)
  {
    uint64_t v17 = 0LL;
    v28[0] = 0LL;
    do
    {
      *((_BYTE *)v28 + v17++) = a2 & 0x7F;
      BOOL v18 = a2 > 0x7F;
      a2 >>= 7;
    }

    while (v18);
    int v16 = (_DWORD)v13 + 28;
    if ((v17 & 0xFFFFFFF0) == 0)
    {
      v13[28] = ((_BYTE)a1 << 6) | (32 * (a5 != 0)) | 0x1F;
      size_t v19 = v13 + 29;
      if (v17 >= 2)
      {
        uint64_t v20 = v17 - 1;
        do
          *v19++ = *((_BYTE *)v28 + v20--) | 0x80;
        while ((_DWORD)v20);
      }

      *size_t v19 = v28[0];
      int v16 = (_DWORD)v19 + 1;
    }
  }

  else
  {
    v13[28] = ((_BYTE)a1 << 6) | (32 * (a5 != 0)) | a2;
    int v16 = (_DWORD)v13 + 29;
  }

  int v21 = v16 - (_DWORD)v14;
  if (!v21) {
    goto LABEL_40;
  }
  uint64_t v22 = &v14[v21];
  if (a4 > 0x7F)
  {
    uint64_t v24 = 0LL;
    v28[0] = 0LL;
    unsigned int v25 = a4;
    do
    {
      *((_BYTE *)v28 + v24++) = v25;
      BOOL v18 = v25 > 0xFF;
      v25 >>= 8;
    }

    while (v18);
    if (16 - v21 <= v24)
    {
      LODWORD(v23) = (_DWORD)v14 + v21;
    }

    else
    {
      *uint64_t v22 = v24 | 0x80;
      uint64_t v23 = v22 + 1;
      if ((_DWORD)v24)
      {
        do
          *v23++ = *((_BYTE *)&v28[-1] + v24-- + 7);
        while (v24);
      }
    }
  }

  else
  {
    LODWORD(v23) = (_DWORD)v14 + v21;
    if (v21 != 16)
    {
      *uint64_t v22 = a4;
      LODWORD(v23) = (_DWORD)v22 + 1;
    }
  }

  int v26 = (_DWORD)v23 - (_DWORD)v22;
  if ((_DWORD)v23 == (_DWORD)v22)
  {
LABEL_40:
    free(v13);
    return 0LL;
  }

  unint64_t v14 = &v22[v26];
  int v15 = v21 + v26;
LABEL_7:
  *((_DWORD *)v13 + 5) = v15;
  switch(a6)
  {
    case 0:
      *((void *)v13 + 1) = 0LL;
      *((void *)v13 + 6) = 0LL;
      *((_DWORD *)v13 + 6) = 0;
      return v13;
    case 1:
      *((void *)v13 + 1) = a3;
      *((void *)v13 + 6) = 0LL;
      goto LABEL_25;
    case 2:
      *((void *)v13 + 1) = a3;
      *((void *)v13 + 6) = v13;
LABEL_25:
      *((_DWORD *)v13 + 6) = a4;
      return v13;
    case 3:
      if (v13 + 56 - v14 >= a4)
      {
        *((void *)v13 + 1) = v14;
        *((_DWORD *)v13 + 6) = a4;
      }

      else
      {
        unint64_t v14 = (char *)malloc(a4);
        *((void *)v13 + 1) = v14;
        *((void *)v13 + 6) = v13;
        *((_DWORD *)v13 + 6) = a4;
        if (!v14) {
          goto LABEL_40;
        }
      }

      memcpy(v14, a3, a4);
      break;
    default:
      return v13;
  }

  return v13;
}

uint64_t DEREncoderAddDataNoCopy( uint64_t *a1, unsigned int a2, unsigned int a3, const void *a4, unsigned int a5, int a6)
{
  BOOL v7 = _EncodedDataCreate(a2, a3, a4, a5, a6, 1);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v7);
}

uint64_t DEREncoderAddUInt32(uint64_t *a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v5 = 0LL;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  unsigned int v10 = bswap32(a4);
  char v11 = 0;
  unsigned int v12 = v10;
  while (!*((_BYTE *)&v10 + v5))
  {
    if (++v5 == 4)
    {
      int v6 = 0;
      goto LABEL_6;
    }
  }

  int v6 = ((unint64_t)*((unsigned __int8 *)&v10 + v5) >> 7) - v5 + 4;
LABEL_6:
  if (v6 <= 1) {
    uint64_t v7 = 1LL;
  }
  else {
    uint64_t v7 = v6;
  }
  int v8 = _EncodedDataCreate(a2, a3, &v11 - v7 + 5, v7, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v8);
}

uint64_t DEREncoderAddUInt64(uint64_t *a1, unsigned int a2, unsigned int a3, unint64_t a4)
{
  uint64_t v5 = 0LL;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  unint64_t v10 = bswap64(a4);
  char v11 = 0;
  unint64_t v12 = v10;
  while (!*((_BYTE *)&v10 + v5))
  {
    if (++v5 == 8)
    {
      int v6 = 0;
      goto LABEL_6;
    }
  }

  int v6 = ((unint64_t)*((unsigned __int8 *)&v10 + v5) >> 7) - v5 + 8;
LABEL_6:
  if (v6 <= 1) {
    uint64_t v7 = 1LL;
  }
  else {
    uint64_t v7 = v6;
  }
  int v8 = _EncodedDataCreate(a2, a3, &v11 - v7 + 9, v7, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v8);
}

uint64_t DEREncoderAddInt32AsData(uint64_t *a1, unsigned int a2, unsigned int a3, int a4)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v7 = a4;
  uint64_t v5 = _EncodedDataCreate(a2, a3, &v7, 4u, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v5);
}

uint64_t DEREncoderAddInt64AsData(uint64_t *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  v7[1] = *MEMORY[0x1895F89C0];
  v7[0] = a4;
  uint64_t v5 = _EncodedDataCreate(a2, a3, v7, 8u, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v5);
}

uint64_t DEREncoderAddIA5String(uint64_t *a1, const void *a2, unsigned int a3)
{
  int v4 = _EncodedDataCreate(0, 0x16u, a2, a3, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v4);
}

uint64_t DEREncoderAddBoolean(uint64_t *a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  char v7 = -1;
  char v6 = 0;
  if (a2) {
    char v3 = &v7;
  }
  else {
    char v3 = &v6;
  }
  int v4 = _EncodedDataCreate(0, 1u, v3, 1u, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v4);
}

uint64_t DEREncoderCreateEncodedBuffer(uint64_t **a1, void *a2, unsigned int *a3)
{
  if (!a1) {
    return 1LL;
  }
  unsigned int v6 = *((_DWORD *)a1 + 2);
  char v7 = (char *)malloc(v6);
  if (!v7) {
    return 2LL;
  }
  uint64_t v8 = v7;
  int v9 = (uint64_t **)*a1;
  if (*a1)
  {
    unint64_t v10 = v7;
    do
    {
      memcpy(v10, (char *)v9 + 28, *((unsigned int *)v9 + 5));
      char v11 = &v10[*((unsigned int *)v9 + 5)];
      memcpy(v11, v9[1], *((unsigned int *)v9 + 6));
      unint64_t v10 = &v11[*((unsigned int *)v9 + 6)];
      int v9 = (uint64_t **)*v9;
    }

    while (v9);
  }

  if (a3) {
    *a3 = v6;
  }
  if (a2)
  {
    uint64_t result = 0LL;
    *a2 = v8;
  }

  else
  {
    free(v8);
    return 0LL;
  }

  return result;
}

uint64_t DEREncoderAddDataFromEncoder(uint64_t **a1, uint64_t *a2, unsigned int a3, unsigned int a4)
{
  if (a1 && a2) {
    return _DEREncoderAddDataFromEncoderByEncoding(a1, a2, a3, a4, 1);
  }
  else {
    return 1LL;
  }
}

uint64_t _DEREncoderAddDataFromEncoderByEncoding( uint64_t **a1, uint64_t *a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  unsigned int v13 = 0;
  unint64_t v12 = 0LL;
  uint64_t v9 = DEREncoderCreateEncodedBuffer(a1, &v12, &v13);
  if (!(_DWORD)v9)
  {
    uint64_t v9 = 2LL;
    unint64_t v10 = _EncodedDataCreate(a3, a4, v12, v13, a5, 2);
    if (v10)
    {
      unint64_t v12 = 0LL;
      uint64_t v9 = _DEREncoderAddEncodedData(a2, (uint64_t)v10);
    }
  }

  if (v12) {
    free(v12);
  }
  return v9;
}

uint64_t DEREncoderAddDataFromEncoderNoCopy(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t result = 1LL;
  if (!a1 || !a2) {
    return result;
  }
  if (*(_DWORD *)(a2 + 12)) {
    return _DEREncoderAddDataFromEncoderByEncoding((uint64_t **)a1, (uint64_t *)a2, a3, a4, a5);
  }
  uint64_t v8 = _EncodedDataCreate(a3, a4, 0LL, *(_DWORD *)(a1 + 8), 1, 0);
  if (!v8) {
    return 2LL;
  }
  uint64_t v9 = v8;
  unint64_t v10 = *(uint64_t **)a1;
  int v21 = 0LL;
  for (uint64_t i = &v21; ; uint64_t i = v12)
  {
    if (!v10)
    {
      size_t v19 = v21;
      *(void *)uint64_t v9 = v21;
      if (!v19) {
        goto LABEL_20;
      }
      return _DEREncoderAddEncodedData((uint64_t *)a2, (uint64_t)v9);
    }

    unint64_t v12 = malloc(0x38uLL);
    if (!v12) {
      break;
    }
    uint64_t v13 = v10[6];
    __int128 v15 = *((_OWORD *)v10 + 1);
    __int128 v14 = *((_OWORD *)v10 + 2);
    *(_OWORD *)unint64_t v12 = *(_OWORD *)v10;
    *((_OWORD *)v12 + 1) = v15;
    v12[6] = v13;
    *((_OWORD *)v12 + 2) = v14;
    *unint64_t v12 = 0LL;
    *((_DWORD *)v12 + 4) = 1;
    unint64_t v16 = v10[1];
    if ((unint64_t)v10 + 28 > v16 || v16 >= (unint64_t)(v10 + 7))
    {
      if (v13) {
        ++*(_DWORD *)(v13 + 16);
      }
    }

    else
    {
      v12[1] = (char *)v12 + v16 - (void)v10;
    }

    *uint64_t i = v12;
    unint64_t v10 = (uint64_t *)*v10;
  }

  uint64_t v17 = v21;
  if (v21)
  {
    do
    {
      BOOL v18 = (void *)*v17;
      _EncodedDataRelease((uint64_t)v17);
      uint64_t v17 = v18;
    }

    while (v18);
  }

  *(void *)uint64_t v9 = 0LL;
LABEL_20:
  if (!*(void *)a1) {
    return _DEREncoderAddEncodedData((uint64_t *)a2, (uint64_t)v9);
  }
  do
  {
    uint64_t v20 = *(char **)v9;
    _EncodedDataRelease((uint64_t)v9);
    uint64_t v9 = v20;
  }

  while (v20);
  return 2LL;
}

uint64_t DEREncoderAddSequenceFromEncoder(uint64_t **a1, uint64_t *a2)
{
  if (a1 && a2) {
    return _DEREncoderAddDataFromEncoderByEncoding(a1, a2, 0, 0x10u, 1);
  }
  else {
    return 1LL;
  }
}

uint64_t DEREncoderAddSetFromEncoder(uint64_t **a1, uint64_t *a2)
{
  if (a1 && a2) {
    return _DEREncoderAddDataFromEncoderByEncoding(a1, a2, 0, 0x11u, 1);
  }
  else {
    return 1LL;
  }
}

uint64_t DEREncoderAddPrivateFromEncoder(uint64_t **a1, uint64_t *a2, unsigned int a3)
{
  unsigned int v6 = (uint64_t **)calloc(1uLL, 0x10uLL);
  char v7 = v6;
  if (!v6)
  {
    uint64_t v8 = 0xFFFFFFFFLL;
    goto LABEL_8;
  }

  *((_DWORD *)v6 + 3) = 0;
  if (!a1) {
    goto LABEL_7;
  }
  uint64_t v8 = _DEREncoderAddDataFromEncoderByEncoding(a1, (uint64_t *)v6, 0, 0x10u, 1);
  if (!(_DWORD)v8)
  {
    if (a2)
    {
      uint64_t v8 = _DEREncoderAddDataFromEncoderByEncoding(v7, a2, 3u, a3, 1);
      goto LABEL_8;
    }

void _EncodedDataRelease(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 1;
  *(_DWORD *)(a1 + 16) = v1;
  if (!v1)
  {
    char v3 = *(void **)(a1 + 8);
    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 48);
      if (((unint64_t)v3 >= a1 + 56 || a1 + 28 > (unint64_t)v3) && v4 != 0)
      {
        if (v4 == a1) {
          free(v3);
        }
        else {
          _EncodedDataRelease(*(void *)(a1 + 48));
        }
      }
    }

    free((void *)a1);
  }

void _darwin_el0_logv_cold_1(void *a1, _OWORD *a2)
{
  uint64_t v2 = __error();
  OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_6();
  _os_crash_msg();
  __break(1u);
}

void _darwin_el0_alloc_type_cold_1(void *a1, _OWORD *a2)
{
  uint64_t v2 = __error();
  OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _darwin_el0_query_trust_store_cold_1(void *a1, _OWORD *a2)
{
  uint64_t v2 = __error();
  OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _darwin_runtime_alloc_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void dylib_restoreos_logv_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  __error();
  _os_log_send_and_compose_impl();
  uint64_t v2 = (const __CFData *)_os_crash_msg();
  __break(1u);
  CFDataGetBytePtr(v2);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x189608488](*(void *)&mainPort, path);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __os_temporary_resource_shortage()
{
  return MEMORY[0x1895F8958]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1895F8AD8]();
}

uint64_t _dyld_get_image_slide()
{
  return MEMORY[0x1895F8C10]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1895F8D80]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1895F9750]();
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x1895F98B8]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x1895F98E0]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x1895F98E8]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x1895F98F0]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x1895F9918]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x1895F9950]();
}

uint64_t ccder_sizeof_len()
{
  return MEMORY[0x1895F99F0]();
}

uint64_t ccder_sizeof_tag()
{
  return MEMORY[0x1895F9A08]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1895F9A90]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1895F9A98]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1895F9AA0]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x1895F9AE0]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x1895F9AE8]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x1895F9AF0]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1895F9B10]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1895F9B18]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1895F9B20]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x1895F9B68]();
}

uint64_t ccec_get_cp()
{
  return MEMORY[0x1895F9BA0]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x1895F9BA8]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x1895F9BB0]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1895F9C40]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x1895F9C48]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1895F9C70]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x1895FA1C8]();
}

uint64_t ccrsa_make_pub()
{
  return MEMORY[0x1895FA1E0]();
}

uint64_t ccrsa_verify_pkcs1v15()
{
  return MEMORY[0x1895FA210]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x1895FA218]();
}

uint64_t ccrsa_verify_pkcs1v15_digest()
{
  return MEMORY[0x1895FA220]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1895FA268]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1895FA278]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1895FA280]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1895FA4B8]();
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

double difftime(time_t a1, time_t a2)
{
  return result;
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x1895FAF98](*(void *)&a1, a2);
}

uint64_t dyld_program_minos_at_least()
{
  return MEMORY[0x1895FB080]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1895FB370](*(void *)&a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int getdtablesize(void)
{
  return MEMORY[0x1895FB528]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

char *__cdecl getsectdatafromheader_64( const mach_header_64 *mhp, const char *segname, const char *sectname, uint64_t *size)
{
  return (char *)MEMORY[0x1895FB698](mhp, segname, sectname, size);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x1895FC480]();
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x1895FC5E0]();
}

uint64_t os_parse_boot_arg_string()
{
  return MEMORY[0x1895FC5E8]();
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1895FD118](a1, a2, a3);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1895FD128](__stringp, __delim);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x1895FD2C0](a1, a2, a3);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1895FD408](a1);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FD4E8](in, uu);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD510](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD528](a1, a2, a3);
}