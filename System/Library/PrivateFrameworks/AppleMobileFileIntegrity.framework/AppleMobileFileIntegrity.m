uint64_t AMFIExecutionPreflight(void *a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  AMFIError *v17;
  os_log_s *v18;
  AMFIPathValidator_ios *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  AMFIError *v24;
  AMFIError *v25;
  BOOL v26;
  AMFIError *v27;
  uint64_t v28;
  void *v29;
  os_log_s *v30;
  AMFIError *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  AMFIError *v44;
  int v45;
  AMFIPathValidator_ios *v46;
  uint64_t v47;
  uint64_t v48;
  AMFIError *v49;
  os_log_s *v50;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  _BYTE buf[12];
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;
  v69 = *MEMORY[0x1895F89C0];
  v7 = a1;
  v8 = a3;
  if ((a2 - 2) < 4 || a2 == 11)
  {
    v9 = v7;
    v10 = v8;
    v11 = v10;
    v60 = v8;
    v61 = a4;
    v59 = v9;
    if (!v10 || ![v10 count])
    {
      v19 = -[AMFIPathValidator_ios initWithURL:](objc_alloc(&OBJC_CLASS___AMFIPathValidator_ios), "initWithURL:", v9);
      v20 = 0LL;
      v21 = 0LL;
      v22 = 0LL;
      v23 = 0LL;
      v24 = 0LL;
      goto LABEL_12;
    }

    v12 = v9;
    v58 = v11;
    [v58 objectForKey:@"sliceOffset"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v15 = v14;
    }
    else {
      v15 = 0LL;
    }
    v16 = v15;

    v57 = v12;
    if (v14 && !v16)
    {
      v17 = -[AMFIError initWithAMFIErrorCode:withURL:]( objc_alloc(&OBJC_CLASS___AMFIError),  "initWithAMFIErrorCode:withURL:",  -404LL,  v12);
      +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        AMFIExecutionPreflight_cold_4();
      }
      goto LABEL_50;
    }

    [v58 objectForKey:@"cpuType"];
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v14 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v33 = v14;
    }
    else {
      v33 = 0LL;
    }
    v34 = v33;

    if (v14 && !v34)
    {
      v17 = -[AMFIError initWithAMFIErrorCode:withURL:]( objc_alloc(&OBJC_CLASS___AMFIError),  "initWithAMFIErrorCode:withURL:",  -404LL,  v12);
      +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        AMFIExecutionPreflight_cold_5();
      }
      goto LABEL_50;
    }

    v56 = v34;
    [v58 objectForKey:@"cpuSubType"];
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v36 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v37 = v36;
    }
    else {
      v37 = 0LL;
    }
    v38 = v37;

    if (v36 && !v56)
    {
      v17 = -[AMFIError initWithAMFIErrorCode:withURL:]( objc_alloc(&OBJC_CLASS___AMFIError),  "initWithAMFIErrorCode:withURL:",  -404LL,  v57);
      +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        AMFIExecutionPreflight_cold_6();
      }
      v14 = v36;
      goto LABEL_50;
    }

    v55 = v38;
    [v58 objectForKey:@"flags"];
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v40 = v39;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v41 = v40;
    }
    else {
      v41 = 0LL;
    }
    v42 = v41;

    if (v40)
    {
      v43 = v56;
      if (!v56)
      {
        v17 = -[AMFIError initWithAMFIErrorCode:withURL:]( objc_alloc(&OBJC_CLASS___AMFIError),  "initWithAMFIErrorCode:withURL:",  -404LL,  v57);
        +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          AMFIExecutionPreflight_cold_7();
        }
LABEL_49:
        v14 = v40;
LABEL_50:
        v40 = v14;

        v44 = v17;
        v16 = 0LL;
        v14 = 0LL;
        v36 = 0LL;
        v42 = 0LL;
        v45 = 0;
LABEL_51:

        v20 = v16;
        v21 = v14;
        v22 = v36;
        v23 = v42;
        v24 = v44;
        if (!v45) {
          goto LABEL_59;
        }
        if (v20)
        {
          v46 = objc_alloc(&OBJC_CLASS___AMFIPathValidator_ios);
          v47 = [v20 unsignedLongLongValue];
          if (v23) {
            v48 = -[AMFIPathValidator_ios initWithURL:withFileOffset:withFlags:]( v46,  "initWithURL:withFileOffset:withFlags:",  v57,  v47,  [v23 intValue]);
          }
          else {
            v48 = -[AMFIPathValidator_ios initWithURL:withFileOffset:](v46, "initWithURL:withFileOffset:", v57, v47);
          }
          v19 = (AMFIPathValidator_ios *)v48;
LABEL_12:
          v25 = v24;
          *(void *)buf = v24;
          v26 = -[AMFIPathValidator_ios validateWithError:](v19, "validateWithError:", buf);
          v24 = (AMFIError *)*(id *)buf;

          if (v26)
          {
            v27 = 0LL;
            v28 = 1LL;
            v29 = v59;
            goto LABEL_60;
          }

LABEL_59:
          v29 = v59;
          v24 = v24;
          v28 = 0LL;
          v27 = v24;
LABEL_60:

          v31 = v27;
          v8 = v60;
          a4 = v61;
          if (!v61) {
            goto LABEL_63;
          }
          goto LABEL_61;
        }

        if (v21)
        {
          v49 = -[AMFIError initWithAMFIErrorCode:withURL:]( objc_alloc(&OBJC_CLASS___AMFIError),  "initWithAMFIErrorCode:withURL:",  -404LL,  v57);

          +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
          v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            AMFIExecutionPreflight_cold_2();
          }
        }

        else
        {
          if (v23)
          {
            v19 = -[AMFIPathValidator_ios initWithURL:withFlags:]( [AMFIPathValidator_ios alloc],  "initWithURL:withFlags:",  v57,  [v23 intValue]);
            v20 = 0LL;
            v21 = 0LL;
            goto LABEL_12;
          }

          v49 = -[AMFIError initWithAMFIErrorCode:withURL:]( objc_alloc(&OBJC_CLASS___AMFIError),  "initWithAMFIErrorCode:withURL:",  -404LL,  v57);

          +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
          v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            AMFIExecutionPreflight_cold_2();
          }
          v23 = 0LL;
        }

        v20 = 0LL;
        v24 = v49;
        goto LABEL_59;
      }
    }

    else
    {
      v43 = v56;
      if (!v56)
      {
        if (!v55)
        {
          v14 = 0LL;
          v36 = 0LL;
          v44 = 0LL;
          v40 = 0LL;
          goto LABEL_45;
        }

LABEL_47:
        v17 = -[AMFIError initWithAMFIErrorCode:withURL:]( objc_alloc(&OBJC_CLASS___AMFIError),  "initWithAMFIErrorCode:withURL:",  -404LL,  v57);
        +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v52 = [v57 path];
          v53 = v43;
          v54 = (void *)v52;
          *(_DWORD *)buf = 138413058;
          *(void *)&buf[4] = v53;
          v63 = 2112;
          v64 = v55;
          v65 = 2112;
          v66 = v16;
          v67 = 2112;
          v68 = v52;
          _os_log_error_impl( &dword_183D14000,  v18,  OS_LOG_TYPE_ERROR,  "Invalid options combination cpuType: (%@) cpuSubType: (%@) sliceOffset: (%@) for: %@",  buf,  0x2Au);
        }

        goto LABEL_49;
      }
    }

    if (v55 && !v16)
    {
      v44 = 0LL;
LABEL_45:
      v45 = 1;
      goto LABEL_51;
    }

    goto LABEL_47;
  }

  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    AMFIExecutionPreflight_cold_1(v7, a2, v30);
  }

  v31 = -[AMFIError initWithAMFIErrorCode:withURL:]( objc_alloc(&OBJC_CLASS___AMFIError),  "initWithAMFIErrorCode:withURL:",  -403LL,  v7);
  v28 = 0LL;
  if (a4)
  {
LABEL_61:
    if ((v28 & 1) == 0) {
      *a4 = v31;
    }
  }

LABEL_63:
  return v28;
}

void OUTLINED_FUNCTION_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2)
{
  return a2;
}

  ;
}

LABEL_26:
  v29 = isValid;
  return v29;
}

    (*(void (**)(void))(*(void *)(a1 + 48) + 64LL))();
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    return 1LL;
  }

  if (!strcmp(a2, "$in"))
  {
    v11 = *(void *)(a1 + 48);
    if ((*(unsigned int (**)(uint64_t))(v11 + 16))(a3) != 16)
    {
      (*(void (**)(uint64_t, uint64_t))(v11 + 72))(v11, 3LL);
      goto LABEL_38;
    }

    v19 = 0LL;
    v20 = &v19;
    v21 = 0x2000000000LL;
    v22 = 1;
    (*(void (**)(uint64_t, const char *))(v11 + 56))(v11, "Array");
    v12 = *(void (**)(uint64_t, void *))(v11 + 48);
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 0x40000000LL;
    v17[2] = __verifyInArray_block_invoke;
    v17[3] = &unk_189D46738;
    v18 = v8;
    v17[4] = &v19;
    v17[5] = v11;
    v12(a3, v17);
    if (!*((_BYTE *)v20 + 24))
    {
      _Block_object_dispose(&v19, 8);
      goto LABEL_38;
    }

    (*(void (**)(uint64_t))(v11 + 64))(v11);
    v13 = *((unsigned __int8 *)v20 + 24);
    _Block_object_dispose(&v19, 8);
    if (!v13) {
      goto LABEL_38;
    }
    goto LABEL_26;
  }

  if ((v8 & 2) != 0)
  {
    IsKnownNumericOnlyOperator = keyIsKnownNumericOnlyOperator((BOOL)a2);
    v10 = *(void *)(a1 + 48);
    if (IsKnownNumericOnlyOperator)
    {
LABEL_36:
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
      v6 = *(void (**)(void))(*(void *)(a1 + 48) + 72LL);
      goto LABEL_3;
    }

    goto LABEL_27;
  }

  v9 = keyIsKnownForCategory(a2, **(_DWORD **)(a1 + 48));
  if (v9 == 1)
  {
    **(_BYTE **)(a1 + 56) = 1;
    goto LABEL_34;
  }

  if (v9)
  {
LABEL_34:
    (*(void (**)(void))(*(void *)(a1 + 48) + 72LL))();
    goto LABEL_38;
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 72LL))(*(void *)(a1 + 48), 6LL);
LABEL_38:
  result = 0LL;
LABEL_39:
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  return result;
}

id hexStringForData(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1
    && (uint64_t v3 = [v1 length],
        v4 = (unsigned __int8 *)[v2 bytes],
        (v5 = calloc((2 * v3) | 1, 1uLL)) != 0LL))
  {
    v6 = v5;
    if (v3)
    {
      v7 = (char *)v5;
      do
      {
        int v8 = *v4++;
        sprintf(v7, "%2.2x", v8);
        v7 += 2;
        --v3;
      }

      while (v3);
    }

    [NSString stringWithUTF8String:v6];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    free(v6);
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

uint64_t NSErrorToAMFIReturn(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    [v1 domain];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    int v4 = [v3 isEqualToString:@"AppleMobileFileIntegrityError"];

    if (v4)
    {
      uint64_t v5 = [v2 code];
      uint64_t v6 = 7LL;
      switch(v5)
      {
        case -409LL:
          uint64_t v6 = 13LL;
          break;
        case -408LL:
          uint64_t v6 = 8LL;
          break;
        case -407LL:
          uint64_t v6 = 12LL;
          break;
        case -406LL:
          break;
        default:
          if (v5 == -440) {
            uint64_t v6 = 14LL;
          }
          else {
            uint64_t v6 = 1LL;
          }
          break;
      }
    }

    else
    {
      [v2 domain];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      int v8 = [v7 isEqualToString:*MEMORY[0x189607460]];

      if (v8) {
        uint64_t v6 = 9LL;
      }
      else {
        uint64_t v6 = 1LL;
      }
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

uint64_t matchIn(uint64_t a1, char *__s2)
{
  v2 = *(const char **)(a1 + 8);
  if (!v2) {
    return 0LL;
  }
  for (uint64_t i = a1; *(_BYTE *)i; i += 16LL)
  {
    size_t v5 = strlen(v2);
    if (!strncmp(v2, __s2, v5)) {
      return 1LL;
    }
LABEL_7:
    v2 = *(const char **)(i + 24);
    if (!v2) {
      return 0LL;
    }
  }

  if (strcmp(v2, __s2)) {
    goto LABEL_7;
  }
  return 1LL;
}

uint64_t AMFICopySwiftPlaygroundsSigningKey()
{
  v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    AMFICopySwiftPlaygroundsSigningKey_cold_1(v0);
  }

  return 4294967292LL;
}

CFStringRef errorStringForAMFIErrorCode(uint64_t a1)
{
  else {
    return off_189D462F8[a1 + 430];
  }
}

uint64_t errorCodeForMISError(int a1)
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    errorCodeForMISError_cold_1(a1, v2);
  }

  return -400LL;
}

uint64_t AMFIShouldShowDeveloperModeSettings()
{
  if (amfi_developer_mode_status()) {
    return 1LL;
  }
  [MEMORY[0x1896078A8] defaultManager];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  char v1 = [v0 fileExistsAtPath:@"/private/var/tmp/show_dev_mode"];

  if ((v1 & 1) != 0) {
    return 1LL;
  }
  uint64_t v4 = 0LL;
  size_t v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  char v7 = 0;
  BOOL v2 = !MISEnumerateMatchingProfiles() && *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void sub_183D16E18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __AMFIShouldShowDeveloperModeSettings_block_invoke(uint64_t a1, _BYTE *a2)
{
  if (a2[16] || a2[17]) {
    return 1LL;
  }
  uint64_t result = 1LL;
  if (!a2[20])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    return 0LL;
  }

  return result;
}

uint64_t amfi_interface_cdhash_in_trustcache(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = 22LL;
  if (a1 && a2 == 20 && a3)
  {
    *a3 = 0LL;
    uint64_t result = __sandbox_ms();
    if ((_DWORD)result) {
      return *__error();
    }
    else {
      *a3 = 0LL;
    }
  }

  return result;
}

uint64_t amfi_interface_query_bootarg_state(void *a1)
{
  if (!a1) {
    return 22LL;
  }
  *a1 = 0LL;
  uint64_t result = __sandbox_ms();
  if ((_DWORD)result) {
    return *__error();
  }
  *a1 = 0LL;
  return result;
}

uint64_t amfi_interface_get_local_signing_private_key(_BYTE *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  char v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1) {
    return 22LL;
  }
  a1[144] = 0;
  *((_OWORD *)a1 + 7) = 0uLL;
  *((_OWORD *)a1 + _Block_object_dispose(va, 8) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 6) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  uint64_t result = __sandbox_ms();
  if (!(_DWORD)result) {
    return 2 * (memcmp(a1, __s2, 0x91uLL) == 0);
  }
  return result;
}

uint64_t amfi_interface_get_local_signing_public_key(_BYTE *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  char v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1) {
    return 22LL;
  }
  a1[96] = 0;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  uint64_t result = __sandbox_ms();
  if (!(_DWORD)result) {
    return 2 * (memcmp(a1, __s2, 0x61uLL) == 0);
  }
  return result;
}

uint64_t amfi_interface_set_local_signing_public_key(const void *a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  char v3 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1 || !memcmp(a1, __s2, 0x61uLL)) {
    return 22LL;
  }
  else {
    return __sandbox_ms();
  }
}

uint64_t amfi_interface_authorize_local_signing()
{
  return __sandbox_ms();
}

BOOL amfi_developer_mode_status()
{
  uint64_t v2 = 0LL;
  size_t v3 = 8LL;
  return !sysctlbyname("security.mac.amfi.developer_mode_status", &v2, &v3, 0LL, 0LL) && v2 == 1;
}

BOOL amfi_developer_mode_resolved()
{
  uint64_t v2 = 0LL;
  size_t v3 = 8LL;
  return !sysctlbyname("security.mac.amfi.developer_mode_resolved", &v2, &v3, 0LL, 0LL) && v2 == 1;
}

uint64_t amfi_launch_constraint_set_spawnattr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  else {
    return 22LL;
  }
}

uint64_t amfi_launch_constraint_matches_process(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = (int *)a4;
  v7[128] = *MEMORY[0x1895F89C0];
  if (a2 && a3)
  {
    if (a3 <= 0x4000)
    {
      bzero(v7, 0x400uLL);
      int v6 = 5;
      if (!v4) {
        uint64_t v4 = &v6;
      }
    }

    else if (a4)
    {
      uint64_t result = 0LL;
      *(_DWORD *)a4 = 5;
      strcpy((char *)(a4 + 4), "Constraint too large");
      return result;
    }
  }

  else if (a4)
  {
    uint64_t result = 0LL;
    *(_DWORD *)a4 = 5;
    strcpy((char *)(a4 + 4), "No Constraint provided");
    return result;
  }

  return 0LL;
}

uint64_t amfi_restricted_execution_mode_enable()
{
  return __sandbox_ms();
}

BOOL amfi_restricted_execution_mode_status()
{
  return __sandbox_ms() == 0;
}

uint64_t validateCodeSigningFlags(void (**a1)(int *, uint64_t), uint64_t a2)
{
  int v2 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 - 1) >= 2)
  {
    if (v2 == 8)
    {
      uint64_t v3 = -738426648LL;
      goto LABEL_6;
    }

    if (v2 != 4)
    {
      uint64_t v4 = 15LL;
      goto LABEL_10;
    }
  }

  uint64_t v3 = -3203661632LL;
LABEL_6:
  if ((a2 & v3) == 0) {
    return 1LL;
  }
  uint64_t v4 = 14LL;
LABEL_10:
  a1[9]((int *)a1, v4);
  return 0LL;
}

const char *LWCRTypeVerificationBackend_errorStringForCode(int a1)
{
  else {
    return off_189D46820[a1 - 1];
  }
}

BOOL LWCRTypeVerificationBackend_verifyRequirements(uint64_t a1, uint64_t a2)
{
  return verifyAndOrDictionary(a1, a2, &v3);
}

BOOL verifyAndOrDictionary(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 0;
  if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a2) != 32)
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3LL);
    return 0LL;
  }

  unsigned int v6 = *(_DWORD *)(a1 + 4) + 1;
  *(_DWORD *)(a1 + 4) = v6;
  if (v6 >= 6)
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 13LL);
    return 0LL;
  }

  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x2000000000LL;
  char v19 = 1;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  int v15 = 0;
  int v8 = *(void (**)(uint64_t, void *))(a1 + 40);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 0x40000000LL;
  v11[2] = __verifyAndOrDictionary_block_invoke;
  v11[3] = &unk_189D46698;
  v11[5] = &v16;
  v11[6] = a1;
  v11[4] = &v12;
  v8(a2, v11);
  int v9 = *((_DWORD *)v13 + 6);
  if (v9 == 1)
  {
    *a3 = 1;
  }

  else if (!v9 && *((_BYTE *)v17 + 24))
  {
    *((_BYTE *)v17 + 24) = 0;
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 12LL);
  }

  --*(_DWORD *)(a1 + 4);
  BOOL v7 = *((_BYTE *)v17 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v7;
}

BOOL LWCRTypeVerificationBackend_verifyLWCR(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a2) == 32)
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2000000000LL;
    char v20 = 1;
    uint64_t v13 = 0LL;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    uint64_t v16 = 0LL;
    uint64_t v9 = 0LL;
    v10 = &v9;
    uint64_t v11 = 0x2000000000LL;
    char v12 = 0;
    uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 40);
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = __LWCRTypeVerificationBackend_verifyLWCR_block_invoke;
    v8[3] = &unk_189D46670;
    v8[4] = &v17;
    v8[5] = &v13;
    v8[6] = &v9;
    v8[7] = a1;
    v4(a2, v8);
    if (*((_BYTE *)v18 + 24))
    {
      uint64_t v5 = v14[3];
      if (!v5 || (BOOL v6 = 1LL, v5 == 127) && *(_DWORD *)a1 == 2)
      {
        if (*((_BYTE *)v10 + 24))
        {
          BOOL v6 = 1LL;
        }

        else
        {
          (*(void (**)(uint64_t, const char *))(a1 + 56))(a1, "ccat");
          *((_BYTE *)v18 + 24) = 0;
          (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 12LL);
          BOOL v6 = *((_BYTE *)v18 + 24) != 0;
        }
      }
    }

    else
    {
      BOOL v6 = 0LL;
    }

    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 2LL);
    return 0LL;
  }

  return v6;
}

BOOL __verifyAndOrDictionary_block_invoke(void *a1, char *a2, uint64_t a3)
{
  char v8 = 0;
  if (*a2 == 36)
  {
    if (verifyFactLessOperator(a1[6], a2, a3, &v8, &v7))
    {
LABEL_3:
      (*(void (**)(void))(a1[6] + 64LL))();
      ++*(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL);
      return 1LL;
    }
  }

  else if (verifyFactName(a1[6], a2, a3, &v8))
  {
    goto LABEL_3;
  }

  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
  return *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) != 0;
}

uint64_t verifyFactLessOperator(uint64_t a1, char *a2, uint64_t a3, _BYTE *a4, _BYTE *a5)
{
  *a4 = 0;
  *a5 = 0;
  if (!keyIsKnownFactlessDictOperator(a2) && !keyIsKnownOperatorArrayOperator((BOOL)a2))
  {
    int IsKnownForCategory = keyIsKnownForCategory(a2, *(_DWORD *)a1);
    if (IsKnownForCategory == 1)
    {
      *a4 = 1;
    }

    else if (!IsKnownForCategory)
    {
      (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 4LL);
      return 0LL;
    }

    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 1LL);
    return 0LL;
  }

  if (keyIsKnownBooleanOperator((BOOL)a2)) {
    return verifyAndOrDictionary(a1, a3, a5);
  }
  if (!strcmp(a2, "$optional")) {
    return verifyOptionalDictionary(a1, a3, 0);
  }
  if (keyIsKnownOperatorArrayOperator((BOOL)a2))
  {
    if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a3) == 16)
    {
      uint64_t v19 = 0LL;
      char v20 = &v19;
      uint64_t v21 = 0x2000000000LL;
      char v22 = 1;
      uint64_t v15 = 0LL;
      uint64_t v16 = &v15;
      uint64_t v17 = 0x2000000000LL;
      int v18 = 0;
      uint64_t v11 = *(void (**)(uint64_t, void *))(a1 + 48);
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 0x40000000LL;
      v14[2] = __verifyOperatorArray_block_invoke;
      v14[3] = &unk_189D46760;
      v14[5] = &v15;
      v14[6] = a1;
      v14[4] = &v19;
      v11(a3, v14);
      if (*((_DWORD *)v16 + 6) == 1) {
        *a5 = 1;
      }
      BOOL v12 = *((_BYTE *)v20 + 24) != 0;
      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(&v19, 8);
      return v12;
    }

    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3LL);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 10LL);
  }

  return 0LL;
}

BOOL verifyFactName(uint64_t a1, char *__s1, uint64_t a3, _BYTE *a4)
{
  *a4 = 0;
  uint64_t v26 = 0LL;
  int v8 = *(_DWORD *)a1;
  uint64_t IsKnownForCategory = factIsKnownForCategory(__s1, *(_DWORD *)a1, &v26);
  if ((_DWORD)IsKnownForCategory == 1)
  {
    uint64_t v13 = keyIsKnownForCategory(__s1, v8);
    uint64_t v10 = v13;
    if ((_DWORD)v13 == 1)
    {
      *a4 = 1;
    }

    else if (!(_DWORD)v13)
    {
      (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 4LL);
      return 0LL;
    }

LABEL_10:
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, v10);
    return 0LL;
  }

  uint64_t v10 = IsKnownForCategory;
  if ((_DWORD)IsKnownForCategory) {
    goto LABEL_10;
  }
  uint64_t v11 = v26;
  int v12 = *(_DWORD *)(v26 + 12);
  switch(v12)
  {
    case 1:
      return 1LL;
    case 2:
      int v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a3, IsKnownForCategory);
      if ((v22 & 2) != 0) {
        return 1LL;
      }
      if (v22 != 32) {
        goto LABEL_32;
      }
      uint64_t v16 = a1;
      uint64_t v17 = a3;
      int v18 = 2;
      goto LABEL_30;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_16;
    case 4:
      int v23 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a3, IsKnownForCategory);
      if (v23 == 4) {
        return 1LL;
      }
      if (v23 != 32) {
        goto LABEL_32;
      }
      uint64_t v16 = a1;
      uint64_t v17 = a3;
      int v18 = 4;
      goto LABEL_30;
    case 8:
      int v24 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a3, IsKnownForCategory);
      if (v24 == 8) {
        return 1LL;
      }
      if (v24 != 32) {
        goto LABEL_32;
      }
      uint64_t v16 = a1;
      uint64_t v17 = a3;
      int v18 = 8;
LABEL_30:
      uint64_t v19 = a4;
      uint64_t v20 = 0LL;
      return verifyFactOperatorDictionary(v16, v17, v18, v19, 0, v20);
    default:
      if (v12 == 64)
      {
        if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 16))(a3, IsKnownForCategory) == 32)
        {
          uint64_t v16 = a1;
          uint64_t v17 = a3;
          int v18 = 64;
          uint64_t v19 = a4;
          uint64_t v20 = v11;
          return verifyFactOperatorDictionary(v16, v17, v18, v19, 0, v20);
        }

LABEL_32:
        (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3LL);
        return 0LL;
      }

LABEL_16:
      unsigned int v21 = *(_DWORD *)(a1 + 4) + 1;
      *(_DWORD *)(a1 + 4) = v21;
      if (v21 >= 6)
      {
        (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 13LL);
        return 0LL;
      }

      v32[0] = 0LL;
      v32[1] = v32;
      v32[2] = 0x2000000000LL;
      int v33 = 0;
      uint64_t v28 = 0LL;
      v29 = &v28;
      uint64_t v30 = 0x2000000000LL;
      char v31 = 1;
      v25 = *(void (**)(uint64_t, void *))(a1 + 40);
      v27[0] = MEMORY[0x1895F87A8];
      v27[1] = 0x40000000LL;
      v27[2] = __verifyQueryTypeFact_block_invoke;
      v27[3] = &unk_189D467B0;
      v27[5] = &v28;
      v27[6] = a1;
      v27[4] = v32;
      v25(a3, v27);
      --*(_DWORD *)(a1 + 4);
      BOOL v14 = *((_BYTE *)v29 + 24) != 0;
      _Block_object_dispose(&v28, 8);
      _Block_object_dispose(v32, 8);
      return v14;
  }
}

BOOL keyIsKnownBooleanOperator(BOOL result)
{
  if (result)
  {
    char v1 = (const char *)result;
    if (!strcmp((const char *)result, (const char *)kKnownBooleanOperators))
    {
      return 1LL;
    }

    else
    {
      uint64_t v2 = 0LL;
      do
      {
        uint64_t v3 = v2;
        if (v2 == 8) {
          break;
        }
        int v4 = strcmp(v1, *(const char **)((char *)&kKnownBooleanOperators + v2 + 8));
        uint64_t v2 = v3 + 8;
      }

      while (v4);
      return v3 == 0;
    }
  }

  return result;
}

BOOL verifyOptionalDictionary(uint64_t a1, uint64_t a2, int a3)
{
  if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a2) != 32)
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3LL);
    return 0LL;
  }

  unsigned int v6 = *(_DWORD *)(a1 + 4) + 1;
  *(_DWORD *)(a1 + 4) = v6;
  if (v6 < 6)
  {
    uint64_t v19 = 0LL;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2000000000LL;
    v22[0] = 0;
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2000000000LL;
    char v18 = 1;
    v13[0] = 0LL;
    v13[1] = v13;
    v13[2] = 0x2000000000LL;
    int v14 = 0;
    if (a3)
    {
      if (verifyFactOperatorDictionary(a1, a2, a3, v22, 1, 0LL))
      {
        --*(_DWORD *)(a1 + 4);
        BOOL v7 = 1LL;
LABEL_14:
        _Block_object_dispose(v13, 8);
        _Block_object_dispose(&v15, 8);
        _Block_object_dispose(&v19, 8);
        return v7;
      }

      if (*((_BYTE *)v20 + 24))
      {
        (*(void (**)(uint64_t))(a1 + 64))(a1);
        uint64_t v9 = *(void (**)(uint64_t, void *))(a1 + 40);
        v11[0] = MEMORY[0x1895F87A8];
        v11[1] = 0x40000000LL;
        v11[2] = __verifyOptionalDictionary_block_invoke_2;
        v11[3] = &unk_189D466E8;
        v11[4] = v13;
        v11[5] = &v15;
        v11[6] = a1;
        v9(a2, v11);
      }

      else
      {
        *((_BYTE *)v16 + 24) = 0;
      }
    }

    else
    {
      int v8 = *(void (**)(uint64_t, void *))(a1 + 40);
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 0x40000000LL;
      v12[2] = __verifyOptionalDictionary_block_invoke;
      v12[3] = &unk_189D466C0;
      v12[4] = v13;
      v12[5] = &v15;
      v12[6] = &v19;
      v12[7] = a1;
      v8(a2, v12);
    }

    --*(_DWORD *)(a1 + 4);
    BOOL v7 = *((_BYTE *)v16 + 24) != 0;
    goto LABEL_14;
  }

  (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 13LL);
  return 0LL;
}

BOOL keyIsKnownOperatorArrayOperator(BOOL result)
{
  if (result)
  {
    char v1 = (const char *)result;
    if (!strcmp((const char *)result, (const char *)kKnownOperatorArrayOperators))
    {
      return 1LL;
    }

    else
    {
      uint64_t v2 = 0LL;
      do
      {
        uint64_t v3 = v2;
        if (v2 == 8) {
          break;
        }
        int v4 = strcmp(v1, *(const char **)((char *)&kKnownOperatorArrayOperators + v2 + 8));
        uint64_t v2 = v3 + 8;
      }

      while (v4);
      return v3 == 0;
    }
  }

  return result;
}

uint64_t keyIsKnownForCategory(char *a1, int a2)
{
  uint64_t v4 = 0LL;
  uint64_t result = factIsKnownForCategory(a1, a2, &v4);
  if ((_DWORD)result == 1) {
    return !keyIsKnownOperator(a1);
  }
  return result;
}

BOOL keyIsKnownFactlessDictOperator(const char *a1)
{
  return keyIsKnownBooleanOperator((BOOL)a1) || strcmp(a1, "$optional") == 0;
}

uint64_t __verifyOptionalDictionary_block_invoke(void *a1, char *a2, uint64_t a3)
{
  if (*(int *)(*(void *)(a1[4] + 8LL) + 24LL) >= 1)
  {
    unsigned int v6 = *(void (**)(void))(a1[7] + 72LL);
LABEL_3:
    v6();
LABEL_4:
    uint64_t result = 0LL;
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
    return result;
  }

  if (*a2 == 36)
  {
    if (keyIsKnownOperator(a2))
    {
      unsigned int v6 = *(void (**)(void))(a1[7] + 72LL);
      goto LABEL_3;
    }
  }

  else if (!verifyFactName(a1[7], a2, a3, (_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL)) {
         && !*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL))
  }
  {
    goto LABEL_4;
  }

  (*(void (**)(void))(a1[7] + 64LL))();
  ++*(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL);
  return 1LL;
}

BOOL keyIsKnownOperator(const char *a1)
{
  if (keyIsKnownNumericOnlyOperator((BOOL)a1)) {
    return 1LL;
  }
  if (a1)
  {
    uint64_t v3 = 0LL;
    while (v3 != 1)
    {
      if (!strcmp(a1, (const char *)kKnownMultiUseFactOperators[++v3]))
      {
        if (v3 == 1) {
          return 1LL;
        }
        break;
      }
    }
  }

  if (!strcmp(a1, "$query") || keyIsKnownFactlessDictOperator(a1)) {
    return 1LL;
  }
  return keyIsKnownOperatorArrayOperator((BOOL)a1);
}

BOOL verifyFactOperatorDictionary(uint64_t a1, uint64_t a2, int a3, _BYTE *a4, char a5, uint64_t a6)
{
  *a4 = 0;
  if ((*(unsigned int (**)(uint64_t))(a1 + 16))(a2) == 32)
  {
    unsigned int v12 = *(_DWORD *)(a1 + 4) + 1;
    *(_DWORD *)(a1 + 4) = v12;
    if (v12 < 6)
    {
      v23[0] = 0LL;
      v23[1] = v23;
      v23[2] = 0x2000000000LL;
      int v24 = 0;
      uint64_t v19 = 0LL;
      uint64_t v20 = &v19;
      uint64_t v21 = 0x2000000000LL;
      char v22 = 1;
      int v14 = *(void (**)(uint64_t, void *))(a1 + 40);
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 0x40000000LL;
      v16[2] = __verifyFactOperatorDictionary_block_invoke;
      v16[3] = &unk_189D46710;
      v16[4] = v23;
      v16[5] = &v19;
      char v18 = a5;
      int v17 = a3;
      v16[6] = a1;
      v16[7] = a4;
      v16[8] = a6;
      v14(a2, v16);
      --*(_DWORD *)(a1 + 4);
      BOOL v13 = *((_BYTE *)v20 + 24) != 0;
      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(v23, 8);
      return v13;
    }

    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 13LL);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, 3LL);
  }

  return 0LL;
}

uint64_t __verifyOptionalDictionary_block_invoke_2(void *a1, const char *a2)
{
  if (*(int *)(*(void *)(a1[4] + 8LL) + 24LL) >= 1)
  {
    uint64_t v4 = *(void (**)(void))(a1[6] + 72LL);
LABEL_7:
    v4();
    uint64_t result = 0LL;
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
    return result;
  }

  if (*a2 != 36 || keyIsKnownFactlessDictOperator(a2) || keyIsKnownOperatorArrayOperator((BOOL)a2))
  {
    uint64_t v4 = *(void (**)(void))(a1[6] + 72LL);
    goto LABEL_7;
  }

  (*(void (**)(void))(a1[6] + 64LL))();
  ++*(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL);
  return 1LL;
}

BOOL keyIsKnownNumericOnlyOperator(BOOL result)
{
  if (result)
  {
    char v1 = (const char *)result;
    if (!strcmp((const char *)result, (const char *)kKnownNumericOnlyOperators[0]))
    {
      return 1LL;
    }

    else
    {
      unint64_t v2 = 0LL;
      do
      {
        unint64_t v3 = v2;
        if (v2 == 3) {
          break;
        }
        int v4 = strcmp(v1, (const char *)kKnownNumericOnlyOperators[v2 + 1]);
        unint64_t v2 = v3 + 1;
      }

      while (v4);
      return v3 < 3;
    }
  }

  return result;
}

uint64_t __verifyFactOperatorDictionary_block_invoke(uint64_t a1, char *a2, uint64_t a3)
{
  if (*(int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) >= 1)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    unsigned int v6 = *(void (**)(void))(*(void *)(a1 + 48) + 72LL);
LABEL_3:
    v6();
    return 0LL;
  }

  if (!strcmp(a2, "$optional"))
  {
    if (*(_BYTE *)(a1 + 76))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
      goto LABEL_13;
    }

    uint64_t result = verifyOptionalDictionary(*(void *)(a1 + 48), a3, *(unsigned int *)(a1 + 72));
    if (!(_DWORD)result) {
      goto LABEL_39;
    }
    goto LABEL_26;
  }

  int v8 = *(_DWORD *)(a1 + 72);
  if ((v8 & 0xE) == 0)
  {
    if ((v8 & 0x40) == 0) {
      goto LABEL_38;
    }
    if (!a2 || strcmp(a2, (const char *)kKnownFlagSetOnlyOperators))
    {
      uint64_t v10 = *(void *)(a1 + 48);
LABEL_27:
      int IsKnownForCategory = keyIsKnownForCategory(a2, *(_DWORD *)v10);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
      if (IsKnownForCategory == 1)
      {
        **(_BYTE **)(a1 + 56) = 1;
LABEL_32:
        unsigned int v6 = *(void (**)(void))(*(void *)(a1 + 48) + 72LL);
        goto LABEL_3;
      }

      if (IsKnownForCategory) {
        goto LABEL_32;
      }
LABEL_13:
      unsigned int v6 = *(void (**)(void))(*(void *)(a1 + 48) + 72LL);
      goto LABEL_3;
    }

    if (*(void *)(a1 + 64))
    {
      uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 48) + 24LL))(a3);
    }

BOOL __verifyInArray_block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a1 + 48) & (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 40) + 16LL))(a2);
  if (!v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    (*(void (**)(void))(v4 + 72))();
  }

  return v3 != 0;
}

uint64_t __verifyOperatorArray_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[6];
  if ((*(unsigned int (**)(uint64_t))(v4 + 16))(a2) == 16)
  {
    v14[0] = 0LL;
    v14[1] = v14;
    v14[2] = 0x2000000000LL;
    int v15 = 0;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    char v13 = 1;
    v9[0] = 0LL;
    v9[1] = v9;
    v9[2] = 0x2000000000LL;
    v9[3] = 0LL;
    uint64_t v5 = *(void (**)(uint64_t, void *))(v4 + 48);
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = __verifyOperatorArrayTuple_block_invoke;
    v8[3] = &unk_189D46788;
    v8[4] = v14;
    v8[5] = &v10;
    v8[6] = v9;
    v8[7] = v4;
    v5(a2, v8);
    int v6 = *((unsigned __int8 *)v11 + 24);
    _Block_object_dispose(v9, 8);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(v14, 8);
    if (v6)
    {
      ++*(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL);
      return 1LL;
    }
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 72))(v4, 3LL);
  }

  uint64_t result = 0LL;
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
  return result;
}

uint64_t __verifyOperatorArrayTuple_block_invoke(void *a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(uint64_t))(a1[7] + 16LL))(a2);
  int v5 = *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL);
  if (v5 != 1)
  {
    if (!v5)
    {
      uint64_t v6 = a1[7];
      if (v4 == 4)
      {
        *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = (*(uint64_t (**)(uint64_t))(v6 + 32))(a2);
        BOOL v7 = *(char **)(*(void *)(a1[6] + 8LL) + 24LL);
        BOOL IsKnownFactlessDictOperator = keyIsKnownFactlessDictOperator(v7);
        uint64_t v9 = a1[7];
        if (IsKnownFactlessDictOperator)
        {
          (*(void (**)(uint64_t, char *))(v9 + 56))(v9, v7);
LABEL_9:
          ++*(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL);
          return 1LL;
        }

        else {
          uint64_t v12 = 4LL;
        }
        (*(void (**)(void, uint64_t))(a1[7] + 72LL))(a1[7], v12);
      }

      else
      {
        (*(void (**)(void, uint64_t))(v6 + 72))(a1[7], 2LL);
      }

      goto LABEL_18;
    }

    uint64_t v11 = *(void (**)(void))(a1[7] + 72LL);
LABEL_13:
    v11();
LABEL_18:
    uint64_t result = 0LL;
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
    return result;
  }

  if (v4 != 32)
  {
    uint64_t v11 = *(void (**)(void))(a1[7] + 72LL);
    goto LABEL_13;
  }

  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = verifyFactLessOperator( a1[7],  *(void *)(*(void *)(a1[6] + 8LL) + 24LL),  a2,  &v14,  &v13);
  if (*(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL))
  {
    (*(void (**)(void))(a1[7] + 64LL))();
    goto LABEL_9;
  }

  return 0LL;
}

uint64_t factIsKnownForCategory(char *__s1, int a2, void *a3)
{
  uint64_t result = 10LL;
  if (__s1 && a3)
  {
    uint64_t v7 = 0LL;
    while (strcmp(__s1, (&kKnownFacts)[v7]))
    {
      v7 += 3LL;
      if (v7 == 66) {
        return 1LL;
      }
    }

    if (((uint64_t)(&kKnownFacts)[v7 + 1] & a2) != 0)
    {
      uint64_t result = 0LL;
      *a3 = &(&kKnownFacts)[v7];
    }

    else
    {
      return 9LL;
    }
  }

  return result;
}

uint64_t __verifyQueryTypeFact_block_invoke(void *a1, const char *a2, uint64_t a3)
{
  if (*(int *)(*(void *)(a1[4] + 8LL) + 24LL) >= 1)
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
    uint64_t v6 = *(void (**)(void))(a1[6] + 72LL);
LABEL_5:
    v6();
    return 0LL;
  }

  if (strcmp(a2, "$query"))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
    uint64_t v6 = *(void (**)(void))(a1[6] + 72LL);
    goto LABEL_5;
  }

  uint64_t v8 = a1[6];
  int v9 = (*(uint64_t (**)(uint64_t))(v8 + 16))(a3);
  (*(void (**)(uint64_t, const char *))(v8 + 56))(v8, "Query Array");
  if (v9 == 16)
  {
    uint64_t v13 = 0LL;
    char v14 = &v13;
    uint64_t v15 = 0x2000000000LL;
    char v16 = 1;
    uint64_t v10 = *(void (**)(uint64_t, void *))(v8 + 48);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    v12[2] = __verifyQueryArray_block_invoke;
    v12[3] = &unk_189D467D8;
    v12[4] = &v13;
    v12[5] = v8;
    v10(a3, v12);
    if (*((_BYTE *)v14 + 24))
    {
      (*(void (**)(uint64_t))(v8 + 64))(v8);
      int v11 = *((unsigned __int8 *)v14 + 24);
      _Block_object_dispose(&v13, 8);
      if (v11)
      {
        ++*(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL);
        (*(void (**)(void))(a1[6] + 64LL))();
        return 1LL;
      }
    }

    else
    {
      _Block_object_dispose(&v13, 8);
    }
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(v8 + 72))(v8, 3LL);
  }

  uint64_t result = 0LL;
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
  return result;
}

BOOL __verifyQueryArray_block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned int (**)(uint64_t))(*(void *)(a1 + 40) + 16LL))(a2) == 16)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 56LL))();
    uint64_t v4 = *(void *)(a1 + 40);
    if ((*(unsigned int (**)(uint64_t))(v4 + 16))(a2) == 16)
    {
      uint64_t v13 = 0LL;
      char v14 = &v13;
      uint64_t v15 = 0x2000000000LL;
      char v16 = 1;
      uint64_t v9 = 0LL;
      uint64_t v10 = &v9;
      uint64_t v11 = 0x2000000000LL;
      int v12 = 0;
      int v5 = *(void (**)(uint64_t, void *))(v4 + 48);
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 0x40000000LL;
      v8[2] = __verifyQueryTuple_block_invoke;
      v8[3] = &unk_189D46800;
      v8[4] = &v9;
      v8[5] = &v13;
      v8[6] = v4;
      v5(a2, v8);
      if (*((_DWORD *)v10 + 6) == 2)
      {
        BOOL v6 = *((_BYTE *)v14 + 24) != 0;
      }

      else
      {
        BOOL v6 = 0;
        *((_BYTE *)v14 + 24) = 0;
      }

      _Block_object_dispose(&v9, 8);
      _Block_object_dispose(&v13, 8);
    }

    else
    {
      (*(void (**)(uint64_t, uint64_t))(v4 + 72))(v4, 2LL);
      BOOL v6 = 0;
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v6;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 64LL))();
      return *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) != 0;
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    (*(void (**)(void))(*(void *)(a1 + 40) + 72LL))();
  }

  return 0LL;
}

BOOL __verifyQueryTuple_block_invoke(void *a1, uint64_t a2)
{
  if (*(int *)(*(void *)(a1[4] + 8LL) + 24LL) >= 2)
  {
    uint64_t v3 = a1[6];
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
    uint64_t v4 = *(void (**)(void))(v3 + 72);
LABEL_5:
    v4();
    return *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) != 0;
  }

  char v5 = (*(uint64_t (**)(uint64_t))(a1[6] + 16LL))(a2);
  uint64_t v6 = *(void *)(a1[4] + 8LL);
  int v7 = *(_DWORD *)(v6 + 24);
  if (!(v7 | v5 & 2))
  {
    uint64_t v8 = a1[6];
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
    uint64_t v4 = *(void (**)(void))(v8 + 72);
    goto LABEL_5;
  }

  *(_DWORD *)(v6 + 24) = v7 + 1;
  return 1LL;
}

uint64_t AMFIInitiateDataMigration()
{
  id v0 = +[AMFIConnection newConnection](&OBJC_CLASS___AMFIConnection, "newConnection");
  [v0 initiateDataMigration];
  char v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = NSErrorToAMFIReturn(v1);

  return v2;
}

uint64_t AMFIGetSEPDeviceState(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v2 = +[AMFIConnection newConnection](&OBJC_CLASS___AMFIConnection, "newConnection");
  id v8 = 0LL;
  if (v2)
  {
    uint64_t v3 = v2;
    [v2 getSEPStateWithError:&v8];
    id v4 = v8;
    __int128 v13 = v9;
    __int128 v14 = v10;
    __int128 v15 = v11;
    char v16 = v12;

    if (v4)
    {
      uint64_t v5 = NSErrorToAMFIReturn(v4);

      return v5;
    }
  }

  else
  {
    char v16 = 0;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v13 = 0u;
  }

  uint64_t v5 = 0LL;
  if (a1)
  {
    __int128 v6 = v14;
    *(_OWORD *)a1 = v13;
    *(_OWORD *)(a1 + 16) = v6;
    *(_OWORD *)(a1 + 32) = v15;
    *(_BYTE *)(a1 + 4_Block_object_dispose(va, 8) = v16;
  }

  return v5;
}

uint64_t AMFIProfileRequiresReboot(void *a1, _BYTE *a2)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  if (!v3)
  {
    +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      AMFIProfileRequiresReboot_cold_1(v5, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_12;
  }

  if (!a2)
  {
    +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      AMFIProfileRequiresReboot_cold_2(v5, v14, v15, v16, v17, v18, v19, v20);
    }
LABEL_12:
    uint64_t v6 = 7LL;
    goto LABEL_13;
  }

  *a2 = 0;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315394;
    int v23 = "AMFIProfileRequiresReboot";
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_impl(&dword_183D14000, v4, OS_LOG_TYPE_DEFAULT, "[%s] request for profile: %@", (uint8_t *)&v22, 0x16u);
  }

  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315138;
    int v23 = "AMFIProfileRequiresReboot";
    _os_log_impl(&dword_183D14000, v5, OS_LOG_TYPE_DEFAULT, "[%s] platform unsupported", (uint8_t *)&v22, 0xCu);
  }

  uint64_t v6 = 0LL;
LABEL_13:

  return v6;
}

uint64_t AMFIProfileScheduleTrust(void *a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  char v16 = 0;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "AMFIProfileScheduleTrust";
      __int16 v19 = 2112;
      id v20 = v1;
      _os_log_impl(&dword_183D14000, v3, OS_LOG_TYPE_DEFAULT, "%s: attempting to schedule profile: %@", buf, 0x16u);
    }

    uint64_t v4 = AMFIProfileRequiresReboot(v1, &v16);
    if ((_DWORD)v4)
    {
      uint64_t v5 = v4;
      +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        AMFIProfileScheduleTrust_cold_4();
      }
    }

    else if (v16)
    {
      id v14 = +[AMFIConnection newConnection](&OBJC_CLASS___AMFIConnection, "newConnection");
      [v14 stageProfileForUuid:v1];
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (!v3)
      {
        uint64_t v5 = 0LL;
        goto LABEL_11;
      }

      +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        AMFIProfileScheduleTrust_cold_3();
      }

      uint64_t v5 = NSErrorToAMFIReturn(v3);
    }

    else
    {
      +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
      id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        AMFIProfileScheduleTrust_cold_2();
      }
      uint64_t v5 = 11LL;
    }
  }

  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      AMFIProfileScheduleTrust_cold_1(v3, v6, v7, v8, v9, v10, v11, v12);
    }
    uint64_t v5 = 7LL;
  }

LABEL_11:
  return v5;
}

uint64_t AMFIProfileGetScheduledProfile(uint64_t a1)
{
  CFTypeRef cf = 0LL;
  if (!a1)
  {
    +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      AMFIProfileGetScheduledProfile_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v7 = 0LL;
    id v8 = 0LL;
    id v3 = 0LL;
    uint64_t v6 = 7LL;
    goto LABEL_23;
  }

  id v2 = +[AMFIConnection newConnection](&OBJC_CLASS___AMFIConnection, "newConnection");
  id v21 = 0LL;
  [v2 getStagedProfileWithError:&v21];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v21;

  if (!v4)
  {
    else {
      BOOL v17 = cf == 0LL;
    }
    if (v17)
    {
      +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        AMFIProfileGetScheduledProfile_cold_4();
      }
    }

    else
    {
      uint64_t v18 = MISProvisioningProfileGetTeamIdentifier();
      uint64_t v7 = (void *)v18;
      if (v18)
      {
        MISProfileGetValue();
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_storeStrong((id *)a1, v3);
          objc_storeStrong((id *)(a1 + 8), v7);
          id v8 = v19;
          uint64_t v6 = 0LL;
          uint64_t v9 = *(os_log_s **)(a1 + 16);
          *(void *)(a1 + 16) = v8;
LABEL_23:

          id v4 = 0LL;
          goto LABEL_24;
        }

        +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          AMFIProfileGetScheduledProfile_cold_3();
        }
LABEL_22:
        id v8 = 0LL;
        uint64_t v6 = 5LL;
        goto LABEL_23;
      }

      +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        AMFIProfileGetScheduledProfile_cold_2();
      }
    }

    uint64_t v7 = 0LL;
    goto LABEL_22;
  }

  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    AMFIProfileGetScheduledProfile_cold_5();
  }

  uint64_t v6 = NSErrorToAMFIReturn(v4);
  uint64_t v7 = 0LL;
  id v8 = 0LL;
LABEL_24:

  if (cf) {
    CFRelease(cf);
  }
  return v6;
}

void sub_183D19974( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AMFIProfileCommitProfile(void *a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (!v3) {
      goto LABEL_7;
    }
    int v12 = 136315394;
    uint64_t v13 = "AMFIProfileCommitProfile";
    __int16 v14 = 2112;
    id v15 = v1;
    id v4 = "[%s] attempting to commit profile: %@";
    uint64_t v5 = v2;
    uint32_t v6 = 22;
  }

  else
  {
    if (!v3) {
      goto LABEL_7;
    }
    int v12 = 136315138;
    uint64_t v13 = "AMFIProfileCommitProfile";
    id v4 = "[%s] attempting to remove staged profile";
    uint64_t v5 = v2;
    uint32_t v6 = 12;
  }

  _os_log_impl(&dword_183D14000, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v12, v6);
LABEL_7:

  id v7 = +[AMFIConnection newConnection](&OBJC_CLASS___AMFIConnection, "newConnection");
  [v7 commitProfileForUuid:v1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      AMFIProfileCommitProfile_cold_1();
    }

    uint64_t v10 = NSErrorToAMFIReturn(v8);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

uint64_t AMFIProfileSetTrust(unsigned int a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = AMFIProfileSetTrustWithOptions(v3, a1, 0LL);

  return v4;
}

uint64_t AMFIProfileSetTrustWithOptions(void *a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  if (!v5)
  {
    +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      AMFIProfileSetTrustWithOptions_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_10;
  }

  if ((a2 - 1) >= 2)
  {
    +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      AMFIProfileSetTrustWithOptions_cold_6(a2, v8);
    }
LABEL_10:
    id v16 = 0LL;
    uint64_t v17 = 7LL;

    uint64_t v18 = 0LL;
    goto LABEL_11;
  }

  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  uint32_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    buf[0] = 136315650;
    *(void *)&buf[1] = "AMFIProfileSetTrustWithOptions";
    __int16 v24 = 2112;
    id v25 = v5;
    __int16 v26 = 1024;
    int v27 = a2;
    _os_log_impl( &dword_183D14000,  v6,  OS_LOG_TYPE_DEFAULT,  "[%s] attempting to set trust: %@ | %u",  (uint8_t *)buf,  0x1Cu);
  }

  id v7 = v5;
  MISCopyProvisioningProfile();
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    AMFIProfileSetTrustWithOptions_cold_5();
  }

  id v16 = 0LL;
  id v21 = +[AMFIConnection newConnection](&OBJC_CLASS___AMFIConnection, "newConnection");
  [v21 setTrustForUuid:v7 withSignature:0 withSignType:a2];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
    int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      AMFIProfileSetTrustWithOptions_cold_2();
    }

    uint64_t v17 = NSErrorToAMFIReturn(v18);
  }

  else
  {
    uint64_t v17 = 0LL;
  }

LABEL_11:
  return v17;
}

void sub_183D1A034( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef a11, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  if (a11) {
    CFRelease(a11);
  }

  _Unwind_Resume(a1);
}

uint64_t AMFIProfileRemoveTrust(void *a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = "AMFIProfileRemoveTrust";
      __int16 v17 = 2112;
      id v18 = v1;
      _os_log_impl( &dword_183D14000,  v3,  OS_LOG_TYPE_DEFAULT,  "[%s] attempting to remove trust: %@",  (uint8_t *)&v15,  0x16u);
    }

    id v4 = +[AMFIConnection newConnection](&OBJC_CLASS___AMFIConnection, "newConnection");
    [v4 removeTrustforUuid:v1];
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      uint64_t v6 = 0LL;
      goto LABEL_13;
    }

    +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      AMFIProfileRemoveTrust_cold_2();
    }

    uint64_t v6 = NSErrorToAMFIReturn(v3);
  }

  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      AMFIProfileRemoveTrust_cold_1(v3, v7, v8, v9, v10, v11, v12, v13);
    }
    uint64_t v6 = 7LL;
  }

LABEL_13:
  return v6;
}

uint64_t AMFISupervisedModeSetState()
{
  id v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    AMFISupervisedModeSetState_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }

  return 10LL;
}

uint64_t AMFIDemoModeSetState()
{
  id v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    AMFIDemoModeSetState_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }

  return 10LL;
}

uint64_t AMFIMDMModeEnroll()
{
  id v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    AMFIMDMModeEnroll_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }

  return 10LL;
}

uint64_t AMFIMDMModeRemove()
{
  id v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    AMFIMDMModeRemove_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }

  return 10LL;
}

  ;
}

void OUTLINED_FUNCTION_1_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_2_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

BOOL LWCRTypeVerificationNSDictionary(void *a1, int a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = (void *)objc_opt_new();
  uint64_t v10 = v6;
  uint64_t v11 = typeMaskForNSType;
  uint64_t v12 = integerValueForNSNumber;
  uint64_t v13 = stringValueForNSString;
  uint64_t v14 = iterateDictionary;
  int v15 = iterateArray;
  v9[0] = a2;
  v9[1] = 0;
  id v16 = pushKeyContext;
  __int16 v17 = popKeyContext;
  id v18 = setError;
  BOOL v7 = LWCRTypeVerificationBackend_verifyLWCR((uint64_t)v9, (uint64_t)v5);

  if (a3 && !v7)
  {
    [v6 synthesizeError];
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t typeMaskForNSType(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v2 = 32LL;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v2 = 16LL;
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v2 = 4LL;
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          uint64_t v2 = 8LL;
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            else {
              uint64_t v2 = 3LL;
            }
          }

          else
          {
            uint64_t v2 = 0LL;
          }
        }
      }
    }
  }

  return v2;
}

uint64_t stringValueForNSString(void *a1)
{
  return [a1 UTF8String];
}

void iterateDictionary(void *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __iterateDictionary_block_invoke;
  v5[3] = &unk_189D468A0;
  id v6 = v3;
  id v4 = v3;
  [a1 enumerateKeysAndObjectsUsingBlock:v5];
}

void iterateArray(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
LABEL_3:
    uint64_t v8 = 0LL;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(v4);
      }
      if (!v3[2](v3, *(void *)(*((void *)&v9 + 1) + 8 * v8))) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void pushKeyContext(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)NSString;
  id v4 = *(id *)(a1 + 8);
  [v3 stringWithUTF8String:a2];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 pushKey:v5];
}

uint64_t popKeyContext(uint64_t a1)
{
  return [*(id *)(a1 + 8) popKey];
}

uint64_t setError(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 8) setError:a2];
}

BOOL LWCRTypeVerificationNSDictionary_RequirementsOnly(void *a1, int a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = (void *)objc_opt_new();
  __int128 v10 = v6;
  __int128 v11 = typeMaskForNSType;
  __int128 v12 = integerValueForNSNumber;
  uint64_t v13 = stringValueForNSString;
  uint64_t v14 = iterateDictionary;
  int v15 = iterateArray;
  v9[0] = a2;
  v9[1] = 0;
  id v16 = pushKeyContext;
  __int16 v17 = popKeyContext;
  id v18 = setError;
  BOOL v7 = LWCRTypeVerificationBackend_verifyRequirements((uint64_t)v9, (uint64_t)v5);

  if (a3 && !v7)
  {
    [v6 synthesizeError];
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __iterateDictionary_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = v7;
  id v9 = a3;
  LOBYTE(v_Block_object_dispose(va, 8) = (*(uint64_t (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, [v10 UTF8String], v9);

  *a4 = v8 ^ 1;
}

uint64_t __AMFIGetSecurityBootModeWithPath(void *a1, void *a2)
{
  io_registry_entry_t v3 = IORegistryEntryFromPath( *MEMORY[0x1896086A8], (const char *)[a1 cStringUsingEncoding:4]);
  if (!v3)
  {
    id CFProperty = 0LL;
    goto LABEL_6;
  }

  io_object_t v4 = v3;
  id CFProperty = (id)IORegistryEntryCreateCFProperty( v3,  @"security-mode-change-enable",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
  IOObjectRelease(v4);
  if (!CFProperty)
  {
LABEL_6:
    uint64_t v6 = 5LL;
    goto LABEL_8;
  }

  if (a2)
  {
    id CFProperty = CFProperty;
    uint64_t v6 = 0LL;
    *a2 = CFProperty;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

LABEL_8:
  return v6;
}

uint64_t AMFICompleteSecurityBootMode(unsigned int a1)
{
  kern_return_t v6;
  id v7;
  id v8;
  uint64_t v10;
  io_connect_t connect;
  connect = 0;
  id v10 = a1;
  mach_port_t v2 = *MEMORY[0x1896086A8];
  io_registry_entry_t v3 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  io_object_t v5 = MatchingService;
  if (MatchingService)
  {
    uint64_t v6 = IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, &connect);
    if (!v6)
    {
      uint64_t v6 = IOConnectCallScalarMethod(connect, 0x10u, &v10, 1u, 0LL, 0LL);
      if (a1 - 1 <= 1)
      {
        id v7 = +[AMFIConnection newConnection](&OBJC_CLASS___AMFIConnection, "newConnection", v10);
        uint64_t v8 = (id)[v7 initiateDeveloperModeDaemons];
      }
    }
  }

  else
  {
    uint64_t v6 = -536870212;
  }

  if (connect) {
    IOServiceClose(connect);
  }
  if (v5) {
    IOObjectRelease(v5);
  }
  return 4 * (v6 != 0);
}

uint64_t AMFIArmSecurityBootMode(unsigned int a1)
{
  kern_return_t v5;
  io_connect_t v6;
  uint64_t v8;
  io_connect_t connect;
  connect = 0;
  uint64_t v8 = a1;
  mach_port_t v1 = *MEMORY[0x1896086A8];
  mach_port_t v2 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(v1, v2);
  if (MatchingService)
  {
    io_object_t v4 = MatchingService;
    io_object_t v5 = IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, &connect);
    uint64_t v6 = connect;
    if (v5)
    {
      if (!connect)
      {
LABEL_5:
        IOObjectRelease(v4);
        return 4 * (v5 != 0);
      }
    }

    else
    {
      io_object_t v5 = IOConnectCallScalarMethod(connect, 0xBu, &v8, 1u, 0LL, 0LL);
      uint64_t v6 = connect;
      if (!connect) {
        goto LABEL_5;
      }
    }

    IOServiceClose(v6);
    goto LABEL_5;
  }

  return 4LL;
}

uint64_t AMFIGetSecurityBootMode(_DWORD *a1)
{
  int v7 = 0;
  id v6 = 0LL;
  uint64_t v2 = __AMFIGetSecurityBootModeWithPath(@"IODeviceTree:/chosen", &v6);
  id v3 = v6;
  io_object_t v4 = v3;
  if (!(_DWORD)v2)
  {
    if ([v3 length] == 4)
    {
      [v4 getBytes:&v7 length:4];
      uint64_t v2 = 0LL;
      if (a1) {
        *a1 = v7;
      }
    }

    else
    {
      uint64_t v2 = 6LL;
    }
  }

  return v2;
}

uint64_t AMFIGetSecurityBootModeArmed(int *a1)
{
  id v12 = 0LL;
  unsigned int v2 = __AMFIGetSecurityBootModeWithPath(@"IODeviceTree:/options", &v12);
  id v3 = v12;
  if (v2)
  {
    int v4 = 0;
    id v5 = 0LL;
  }

  else
  {
    id v6 = (void *)[objc_alloc(NSString) initWithData:v3 encoding:4];
    *__error() = 0;
    id v5 = v6;
    unint64_t v7 = strtoul((const char *)[v5 cStringUsingEncoding:4], 0, 0);
    int v8 = *__error();
    int v9 = -1;
    if (v7 < 0xFFFFFFFF) {
      int v9 = v7;
    }
    if (v8) {
      unsigned int v2 = 3;
    }
    else {
      unsigned int v2 = 0;
    }
    if (v8) {
      int v4 = 0;
    }
    else {
      int v4 = v9;
    }
  }

  if (v2 == 5) {
    uint64_t v10 = 0LL;
  }
  else {
    uint64_t v10 = v2;
  }
  if (a1 && !(_DWORD)v10)
  {
    if (v2 == 5) {
      int v4 = 0;
    }
    *a1 = v4;
  }

  return v10;
}

uint64_t AMFIDeveloperModeCommit(int a1)
{
  kern_return_t v6;
  io_connect_t v7;
  io_connect_t connect;
  connect = 0;
  if (a1) {
    uint32_t v1 = 14;
  }
  else {
    uint32_t v1 = 12;
  }
  mach_port_t v2 = *MEMORY[0x1896086A8];
  id v3 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    io_object_t v5 = MatchingService;
    id v6 = IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, &connect);
    unint64_t v7 = connect;
    if (v6)
    {
      if (!connect)
      {
LABEL_8:
        IOObjectRelease(v5);
        return 4 * (v6 != 0);
      }
    }

    else
    {
      id v6 = IOConnectCallScalarMethod(connect, v1, 0LL, 0, 0LL, 0LL);
      unint64_t v7 = connect;
      if (!connect) {
        goto LABEL_8;
      }
    }

    IOServiceClose(v7);
    goto LABEL_8;
  }

  return 4LL;
}

BOOL LWCRTypeVerificationXPCDictionary(uint64_t a1, int a2, char **a3)
{
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  v8[0] = a2;
  v8[1] = 0;
  int v9 = &v18;
  uint64_t v10 = typeMaskForXPCObj;
  __int128 v11 = integerValueForXPCObj;
  id v12 = stringValueForXPCObj;
  uint64_t v13 = iterateDictionary_0;
  uint64_t v14 = iterateArray_0;
  int v15 = pushKeyContext_0;
  id v16 = popKeyContext_0;
  __int16 v17 = setError_0;
  uint64_t v18 = 0LL;
  xpc_object_t v19 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v19 = xpc_array_create(0LL, 0LL);
  LODWORD(v20) = 0;
  BOOL v5 = LWCRTypeVerificationBackend_verifyLWCR((uint64_t)v8, a1);
  BOOL v6 = v5;
  if (a3 && !v5) {
    *a3 = LWCRTypeErrorContextSynthesizeError((uint64_t)&v18);
  }
  xpc_release(v19);
  return v6;
}

uint64_t typeMaskForXPCObj()
{
  uint64_t v0 = MEMORY[0x186E266A4]();
  if (v0 == MEMORY[0x1895F9250]) {
    return 32LL;
  }
  if (v0 == MEMORY[0x1895F9220]) {
    return 16LL;
  }
  if (v0 == MEMORY[0x1895F92E8]) {
    return 4LL;
  }
  if (v0 == MEMORY[0x1895F9240]) {
    return 8LL;
  }
  if (v0 == MEMORY[0x1895F9228]) {
    return 1LL;
  }
  return 2 * (v0 == MEMORY[0x1895F9280]);
}

BOOL iterateDictionary_0(void *a1, uint64_t a2)
{
  applier[0] = MEMORY[0x1895F87A8];
  applier[1] = 0x40000000LL;
  applier[2] = __iterateDictionary_block_invoke_0;
  applier[3] = &unk_189D468C8;
  applier[4] = a2;
  return xpc_dictionary_apply(a1, applier);
}

BOOL iterateArray_0(void *a1, uint64_t a2)
{
  applier[0] = MEMORY[0x1895F87A8];
  applier[1] = 0x40000000LL;
  applier[2] = __iterateArray_block_invoke;
  applier[3] = &unk_189D468F0;
  applier[4] = a2;
  return xpc_array_apply(a1, applier);
}

void pushKeyContext_0(uint64_t a1, const char *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      if (*(void *)v2 >= xpc_array_get_count(*(xpc_object_t *)(v2 + 8))) {
        size_t v4 = -1LL;
      }
      else {
        size_t v4 = *(void *)v2;
      }
      xpc_array_set_string(*(xpc_object_t *)(v2 + 8), v4, a2);
      ++*(void *)v2;
    }
  }

uint64_t popKeyContext_0(uint64_t result)
{
  uint32_t v1 = *(void **)(result + 8);
  if (v1)
  {
    if (*v1) {
      --*v1;
    }
  }

  return result;
}

uint64_t setError_0(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(result + 8);
  if (v2) {
    *(_DWORD *)(v2 + 16) = a2;
  }
  return result;
}

char *LWCRTypeErrorContextSynthesizeError(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = (char *)calloc(1uLL, 0x804uLL);
  if (v2)
  {
    int v3 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)uint64_t v2 = v3;
    size_t v4 = LWCRTypeVerificationBackend_errorStringForCode(v3);
    unsigned int v5 = snprintf(v2 + 4, 0x800uLL, "Error: %s, Context: ", v4);
    if (*(void *)a1)
    {
      if (v5 <= 0x7FF)
      {
        size_t v6 = 0LL;
        do
        {
          xpc_array_get_string(*(xpc_object_t *)(a1 + 8), v6);
          unint64_t v7 = __strlcat_chk();
          if (++v6 >= *(void *)a1) {
            break;
          }
        }

        while (v7 < 0x800);
      }
    }
  }

  return v2;
}

BOOL LWCRTypeVerificationXPCDictionary_RequirementsOnly(uint64_t a1, int a2, char **a3)
{
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  v8[0] = a2;
  v8[1] = 0;
  int v9 = &v18;
  uint64_t v10 = typeMaskForXPCObj;
  __int128 v11 = integerValueForXPCObj;
  id v12 = stringValueForXPCObj;
  uint64_t v13 = iterateDictionary_0;
  uint64_t v14 = iterateArray_0;
  int v15 = pushKeyContext_0;
  id v16 = popKeyContext_0;
  __int16 v17 = setError_0;
  uint64_t v18 = 0LL;
  xpc_object_t v19 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v19 = xpc_array_create(0LL, 0LL);
  LODWORD(v20) = 0;
  BOOL v5 = LWCRTypeVerificationBackend_verifyRequirements((uint64_t)v8, a1);
  BOOL v6 = v5;
  if (a3 && !v5) {
    *a3 = LWCRTypeErrorContextSynthesizeError((uint64_t)&v18);
  }
  xpc_release(v19);
  return v6;
}

uint64_t __iterateDictionary_block_invoke_0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __iterateArray_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_183D1B67C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_183D1B884( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_183D1BB18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_183D1BD68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_183D1BF7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_183D1C154( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_183D1C368( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_183D1C530( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_183D1C6D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_183D1C86C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_183D1CA04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_183D1CBA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_183D1CD30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void AMFIExecutionPreflight_cold_1(void *a1, int a2, os_log_s *a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  [a1 path];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = a2;
  __int16 v7 = 2112;
  int v8 = v5;
  _os_log_error_impl( &dword_183D14000,  a3,  OS_LOG_TYPE_ERROR,  "Error cannot evaluate unknown platform (%d) for: %@",  (uint8_t *)v6,  0x12u);

  OUTLINED_FUNCTION_2();
}

void AMFIExecutionPreflight_cold_2()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_183D14000, v3, v4, "Unexpected option(s) in dictionary: %@ for: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void AMFIExecutionPreflight_cold_4()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_183D14000, v3, v4, "Invalid slice offset (%@) for: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void AMFIExecutionPreflight_cold_5()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_183D14000, v3, v4, "Invalid cpu type (%@) for: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void AMFIExecutionPreflight_cold_6()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_183D14000, v3, v4, "Invalid cpu sub type (%@) for: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void AMFIExecutionPreflight_cold_7()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_183D14000, v3, v4, "Invalid flags (%@) for: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void AMFICopySwiftPlaygroundsSigningKey_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_183D14000, log, OS_LOG_TYPE_ERROR, "platform does not support local signing", v1, 2u);
}

void errorCodeForMISError_cold_1(int a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v4[0] = 67109378;
  v4[1] = a1;
  __int16 v5 = 2112;
  id v6 = (id)MISCopyErrorStringForErrorCode();
  id v3 = v6;
  _os_log_error_impl(&dword_183D14000, a2, OS_LOG_TYPE_ERROR, "Unexpected MISError (0x%x): %@", (uint8_t *)v4, 0x12u);
}

void AMFIProfileRequiresReboot_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFIProfileRequiresReboot_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFIProfileScheduleTrust_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFIProfileScheduleTrust_cold_2()
{
}

void AMFIProfileScheduleTrust_cold_3()
{
}

void AMFIProfileScheduleTrust_cold_4()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_183D14000, v0, v1, "[%s] unable to check for reboot: %@ | %u", v2);
  OUTLINED_FUNCTION_6();
}

void AMFIProfileGetScheduledProfile_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFIProfileGetScheduledProfile_cold_2()
{
}

void AMFIProfileGetScheduledProfile_cold_3()
{
}

void AMFIProfileGetScheduledProfile_cold_4()
{
}

void AMFIProfileGetScheduledProfile_cold_5()
{
}

void AMFIProfileCommitProfile_cold_1()
{
}

void AMFIProfileSetTrustWithOptions_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFIProfileSetTrustWithOptions_cold_2()
{
}

void AMFIProfileSetTrustWithOptions_cold_3()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl( &dword_183D14000,  v2,  OS_LOG_TYPE_ERROR,  "[%s] unable to create aux-sig: %@ | %@ (not-fatal)",  (uint8_t *)v3,  0x20u);
  OUTLINED_FUNCTION_6();
}

void AMFIProfileSetTrustWithOptions_cold_4()
{
}

void AMFIProfileSetTrustWithOptions_cold_5()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_183D14000, v0, v1, "[%s] missing profile: %@ | %u", v2);
  OUTLINED_FUNCTION_6();
}

void AMFIProfileSetTrustWithOptions_cold_6(int a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 136315394;
  uint64_t v3 = "AMFIProfileSetTrustWithOptions";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_183D14000, a2, OS_LOG_TYPE_ERROR, "[%s] unknown trust type: %u", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_3_0();
}

void AMFIProfileRemoveTrust_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFIProfileRemoveTrust_cold_2()
{
}

void AMFISupervisedModeSetState_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFIDemoModeSetState_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFIMDMModeEnroll_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void AMFIMDMModeRemove_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOConnectCallScalarMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x189607CC0]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  output,  outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x189608488](*(void *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
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

uint64_t MISCopyAuxiliarySignature()
{
  return MEMORY[0x189615ED0]();
}

uint64_t MISCopyErrorStringForErrorCode()
{
  return MEMORY[0x189615ED8]();
}

uint64_t MISCopyProvisioningProfile()
{
  return MEMORY[0x189615EE0]();
}

uint64_t MISEnumerateMatchingProfiles()
{
  return MEMORY[0x189615EF0]();
}

uint64_t MISProfileCreateDataRepresentation()
{
  return MEMORY[0x189615F08]();
}

uint64_t MISProfileGetValue()
{
  return MEMORY[0x189615F20]();
}

uint64_t MISProfileIsDEREncoded()
{
  return MEMORY[0x189615F28]();
}

uint64_t MISProfileSupportsAuxiliarySignature()
{
  return MEMORY[0x189615F30]();
}

uint64_t MISProvisioningProfileGetTeamIdentifier()
{
  return MEMORY[0x189615F38]();
}

uint64_t MISValidateSignatureAndCopyInfo()
{
  return MEMORY[0x189615F48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x1895F8978]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895F8A00]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t posix_spawnattr_setmacpolicyinfo_np()
{
  return MEMORY[0x1895FC848]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FCFB0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1895FD7C8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FD7D8](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1895FD840](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1895FDEC8](xint);
}

void xpc_release(xpc_object_t object)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}