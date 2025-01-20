uint64_t init_tailspin()
{
  int v0;
  uint64_t tailspin_ondisk_config;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  id v6;
  os_log_s *v7;
  int v8;
  int v9;
  id v10;
  os_log_s *v11;
  int v12;
  void *v13;
  NSUserDefaults *v14;
  void *v15;
  int v16;
  id v17;
  os_log_s *v18;
  int v19;
  id v20;
  os_log_s *v21;
  const char *v22;
  _DWORD *v23;
  uint64_t tailspin_profile_config;
  uint64_t tailspin_tasking_config;
  uint64_t result;
  int v27;
  uint64_t v28;
  BOOL v29;
  int v30;
  int v31;
  id v32;
  os_log_s *v33;
  size_t v34;
  uint8_t v35[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint8_t buf[4];
  _BYTE v40[10];
  int v41;
  __int16 v42;
  int v43;
  v0 = is_apple_internal_setting();
  tailspin_ondisk_config = get_tailspin_ondisk_config();
  if (tailspin_ondisk_config)
  {
    v2 = tailspin_ondisk_config;
    v3 = strncmp("Photos", (const char *)(tailspin_ondisk_config + 8361), 6uLL);
    v4 = tailspin_enabled_get(v2);
    v5 = *__error();
    v6 = sub_399C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v40 = v3 == 0;
      *(_WORD *)&v40[4] = 1024;
      *(_DWORD *)&v40[6] = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "is Photos: %{BOOL}d, is tailspin enabled: %{BOOL}d", buf, 0xEu);
    }

    *__error() = v5;
    if (v3) {
      v8 = 0;
    }
    else {
      v8 = v4 ^ 1;
    }
    if (!v0) {
      goto LABEL_14;
    }
  }

  else
  {
    v9 = *__error();
    v10 = sub_399C();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Not Photos, no on-disk config", buf, 2u);
    }

    v8 = 0;
    *__error() = v9;
    if (!v0) {
      goto LABEL_14;
    }
  }

  if (!v8)
  {
    v12 = 0;
    goto LABEL_21;
  }

LABEL_14:
  bzero(buf, 0x400uLL);
  v34 = 1024LL;
  sysctlbyname("kern.osversion", buf, &v34, 0LL, 0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buf));
  v14 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.tailspin");
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[NSUserDefaults stringForKey:]( v14,  "stringForKey:",  @"tailspin_configuration_last_build_reset"));
  v16 = *__error();
  v17 = sub_399C();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v35 = 138543618;
    v36 = v15;
    v37 = 2114;
    v38 = v13;
    _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "last build reset: %{public}@, current build: %{public}@",  v35,  0x16u);
  }

  *__error() = v16;
  if (v15 && ([v15 isEqualToString:v13] & 1) != 0)
  {
    v12 = 0;
  }

  else
  {
    unlink("/var/db/tailspin_config.plist");
    -[NSUserDefaults setObject:forKey:](v14, "setObject:forKey:", v13, @"tailspin_configuration_last_build_reset");
    v12 = 1;
  }

LABEL_21:
  v19 = *__error();
  v20 = sub_399C();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = "Didn't";
    *(_DWORD *)buf = 136446722;
    if (v12) {
      v22 = "Did";
    }
    *(void *)v40 = v22;
    *(_WORD *)&v40[8] = 1024;
    v41 = v0;
    v42 = 1024;
    v43 = v8;
    _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}s reset on-disk tailspin configuration. Apple-Internal: %{BOOL}d, Is Photos: %{BOOL}d",  buf,  0x18u);
  }

  *__error() = v19;
  v23 = (_DWORD *)get_tailspin_ondisk_config();
  tailspin_profile_config = get_tailspin_profile_config();
  tailspin_tasking_config = get_tailspin_tasking_config();
  result = tailspin_enabled_get_default();
  if (v23)
  {
    result = tailspin_enabled_get(v23);
    v27 = result;
    switch(v23[2])
    {
      case 0:
        v28 = tailspin_profile_config | tailspin_tasking_config;
        goto LABEL_29;
      case 1:
        v30 = 1;
        if (tailspin_profile_config) {
          goto LABEL_45;
        }
        if (!tailspin_tasking_config) {
          goto LABEL_45;
        }
        result = bcmp((const void *)tailspin_tasking_config, v23, 0x2118uLL);
        if ((_DWORD)result) {
          goto LABEL_45;
        }
        goto LABEL_43;
      case 2:
        v29 = tailspin_profile_config == 0;
        goto LABEL_35;
      case 3:
        if (tailspin_profile_config)
        {
          result = bcmp(v23, (const void *)tailspin_profile_config, 0x2118uLL);
          if (!(_DWORD)result) {
            goto LABEL_43;
          }
        }

        v30 = 1;
        goto LABEL_45;
      default:
LABEL_43:
        v30 = 0;
        goto LABEL_44;
    }
  }

  v27 = result;
  v28 = tailspin_tasking_config | tailspin_profile_config;
LABEL_29:
  v29 = v28 == 0;
LABEL_35:
  v30 = !v29;
  if ((v30 & 1) == 0)
  {
LABEL_44:
    if (!v27) {
      goto LABEL_49;
    }
  }

LABEL_45:
  v31 = *__error();
  v32 = sub_399C();
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    sub_3AA4(v33);
  }

  *__error() = v31;
  result = tailspin_poke();
  if (v30) {
    result = tailspin_resolve_configs(result);
  }
LABEL_49:
  if (v23) {
    result = tailspin_config_free(v23);
  }
  if (tailspin_profile_config) {
    result = tailspin_config_free(tailspin_profile_config);
  }
  if (tailspin_tasking_config) {
    return tailspin_config_free(tailspin_tasking_config);
  }
  return result;
}

id sub_399C()
{
  if (qword_4238 != -1) {
    dispatch_once(&qword_4238, &stru_4160);
  }
  return (id)qword_4230;
}

void sub_39DC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.tailspin", "library");
  v2 = (void *)qword_4230;
  qword_4230 = (uint64_t)v1;

  id v3 = (id)qword_4230;
  if (!v3) {
    sub_3AE4();
  }
}

uint64_t sub_3A28( int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = snprintf(byte_4240, 0x400uLL, "%d ", a1);
  qword_41F8 = (uint64_t)byte_4240;
  return result;
}

void sub_3AA4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Calling tailspin poke", v1, 2u);
}

void sub_3AE4()
{
  uint64_t v0 = _os_assert_log(0LL);
  _os_crash(v0);
  __break(1u);
  __error();
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}