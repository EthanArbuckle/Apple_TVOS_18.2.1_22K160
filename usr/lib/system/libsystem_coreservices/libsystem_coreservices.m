uint64_t NSStartSearchPathEnumerationPrivate(int a1, int a2)
{
  return NSStartSearchPathEnumerationStatic(a1, a2, 0);
}

uint64_t NSStartSearchPathEnumerationStatic(int a1, int a2, int a3)
{
  unsigned int v4 = a1 - 1;
  if ((a1 - 1) < 0x16
    || (result = 0LL, (a1 & 0xFFFFFFFE) == 0x64) && (unsigned int v4 = a1 - 78, ((a1 - 78) & 0x80000000) == 0))
  {
    int v6 = a2 & ~a3 & 0x1FFF;
    int v7 = 1032;
    if (v6 != 1032)
    {
      int v7 = a2 & ~a3 & 0x1FFF;
      if ((a2 & ~a3 & 0x408) == 8)
      {
        if (_os_feature_enabled_impl())
        {
          int v7 = v6 | 0x400;
        }

        else
        {
          if (LinkedAtLeastSydro_once != -1) {
            dispatch_once(&LinkedAtLeastSydro_once, &__block_literal_global);
          }
          if (LinkedAtLeastSydro_result) {
            int v7 = v6 | 0x4000;
          }
          else {
            int v7 = v6;
          }
        }
      }

      if ((~v7 & 0xA) == 0)
      {
        uint64_t v8 = dirInfo[3 * v4 + 1];
        v9 = *(const char **)(v8 + 8);
        v10 = *(const char **)(v8 + 24);
        if (v9) {
          BOOL v11 = v10 == 0LL;
        }
        else {
          BOOL v11 = 1;
        }
        if (!v11 && (v9 == v10 || !strcmp(v9, v10))) {
          v7 &= ~8u;
        }
      }
    }

    return (v7 + (a1 << 24));
  }

  return result;
}

uint64_t sysdir_start_search_path_enumeration_private(int a1, int a2)
{
  return NSStartSearchPathEnumerationStatic(a1, a2, 0);
}

uint64_t NSStartSearchPathEnumeration(int a1, int a2)
{
  return NSStartSearchPathEnumerationStatic(a1, a2, 8112);
}

sysdir_search_path_enumeration_state sysdir_start_search_path_enumeration( sysdir_search_path_directory_t dir, sysdir_search_path_domain_mask_t domainMask)
{
  return NSStartSearchPathEnumerationStatic(dir, domainMask, 8112);
}

uint64_t NSGetNextSearchPathEnumerationStatic(unsigned int a1, char *a2)
{
  while (1)
  {
    v2 = a2;
    unsigned int v3 = a1;
    uint64_t v50 = *MEMORY[0x1895FEE08];
    unsigned int v4 = HIBYTE(a1);
    unsigned int v43 = (unsigned __int16)a1;
    if ((a1 - 0x1000000) >> 25 > 0xA)
    {
      if (a1 >> 25 != 50) {
        return 0LL;
      }
      unsigned int v5 = v4 - 78;
      if (((v4 - 78) & 0x80000000) != 0) {
        return 0LL;
      }
    }

    else
    {
      unsigned int v5 = v4 - 1;
      if (((v4 - 1) & 0x80000000) != 0) {
        return 0LL;
      }
    }

    int NextDomain = _getNextDomain(&v43);
    if (!NextDomain) {
      return 0LL;
    }
    int v7 = NextDomain - 1;
    unsigned int v8 = v5;
    v9 = &dirInfo[3 * v5];
    int v10 = *(_DWORD *)v9;
    uint64_t v11 = v9[1];
    if (*(_DWORD *)v9 == 1)
    {
      while (1)
      {
        unsigned int v12 = v43 & ~(1 << v7);
        unsigned int v43 = v12;
        v13 = *(const char **)(v11 + 8LL * v7);
        if (v13) {
          break;
        }
        int v14 = _getNextDomain(&v43);
        if (!v14) {
          return 0LL;
        }
        int v7 = v14 - 1;
      }

      v18 = (const char **)&dirInfo[3 * v8 + 2];
      uint64_t v19 = v12 + (v3 & 0xFF000000);
    }

    else
    {
      uint64_t v15 = dirInfo[3 * v8 + 2];
      unsigned int v16 = BYTE2(v3);
      if (BYTE2(v3) >= v10)
      {
        v43 &= ~(1 << v7);
        int v17 = _getNextDomain(&v43);
        if (!v17) {
          return 0LL;
        }
        unsigned int v16 = 0;
        int v7 = v17 - 1;
      }

      v13 = *(const char **)(*(void *)(v11 + 8LL * v7) + 8LL * v16);
      v18 = (const char **)(v15 + 8LL * v16);
      uint64_t v19 = (v3 & 0xFF000000 | (v16 << 16)) + v43 + 0x10000;
    }

    v20 = *v18;
    int v21 = *(unsigned __int8 *)v13;
    if (v21 == 47 || v21 == 0)
    {
      if (globals != -1) {
        _os_once();
      }
      if (!qword_18C43CA20) {
        return 0LL;
      }
      strlcpy(v2, (const char *)qword_18C43CA20, 0x400uLL);
    }

    else
    {
      char *v2 = 0;
    }

    if (v7 == 4 && (_DWORD)v19)
    {
      v41 = 0LL;
      uint64_t v24 = sysconf(71);
      if (v24 < 1)
      {
        if (os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_DEFAULT))
        {
          int v38 = *__error();
          *(_DWORD *)buf = 136315394;
          v45 = "NSGetNextSearchPathEnumerationStatic";
          __int16 v46 = 1024;
          uid_t v47 = v38;
          _os_log_impl( &dword_18013C000,  MEMORY[0x189600830],  OS_LOG_TYPE_DEFAULT,  "%s: sysconf(_SC_GETPW_R_SIZE_MAX) error: %{errno}d",  buf,  0x12u);
        }

        goto LABEL_50;
      }

      size_t v25 = v24;
      v26 = (char *)&v40 - ((MEMORY[0x1895FE128]() + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uid_t v27 = getuid();
      if (getpwuid_r(v27, &v42, v26, v25, &v41))
      {
        if (os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_DEFAULT))
        {
          uid_t v28 = getuid();
          int v29 = *__error();
          *(_DWORD *)buf = 136315650;
          v45 = "NSGetNextSearchPathEnumerationStatic";
          __int16 v46 = 1024;
          uid_t v47 = v28;
          __int16 v48 = 1024;
          int v49 = v29;
          v30 = (os_log_s *)MEMORY[0x189600830];
          v31 = "%s: getpwuid_r(%d) error: %{errno}d";
          uint32_t v32 = 24;
LABEL_33:
          _os_log_impl(&dword_18013C000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
        }
      }

      else
      {
        if (v41)
        {
          strlcat(v2, v42.pw_dir, 0x400uLL);
          goto LABEL_54;
        }

        if (os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_DEFAULT))
        {
          uid_t v39 = getuid();
          *(_DWORD *)buf = 136315394;
          v45 = "NSGetNextSearchPathEnumerationStatic";
          __int16 v46 = 1024;
          uid_t v47 = v39;
          v30 = (os_log_s *)MEMORY[0x189600830];
          v31 = "%s: getpwuid_r returned no results for uid %d";
          uint32_t v32 = 18;
          goto LABEL_33;
        }
      }

LABEL_50:
      char *v2 = 0;
      return NSGetNextSearchPathEnumerationStatic(v19, v2);
    }

    if (v7 == 5 && (_DWORD)v19)
    {
      if (NSGetNextSearchPathEnumerationStatic_containerizedUserPath) {
        goto LABEL_40;
      }
      uint64_t v33 = container_create_or_lookup_path_for_current_user();
      if (v33)
      {
        v34 = (void *)v33;
        __strlcpy_chk();
        free(v34);
LABEL_40:
        v35 = &NSGetNextSearchPathEnumerationStatic_containerizedUserPath;
        goto LABEL_47;
      }

      goto LABEL_55;
    }

    if (v7 != 7 || !(_DWORD)v19)
    {
      strlcat(v2, v13, 0x400uLL);
      goto LABEL_54;
    }

    if (NSGetNextSearchPathEnumerationStatic_systemContainerPath) {
      goto LABEL_46;
    }
    uint64_t v36 = container_system_path_for_identifier();
    if (v36) {
      break;
    }
LABEL_55:
    char *v2 = 0;
    a1 = v19;
    a2 = v2;
  }

  v37 = (void *)v36;
  __strlcpy_chk();
  free(v37);
LABEL_46:
  v35 = &NSGetNextSearchPathEnumerationStatic_systemContainerPath;
LABEL_47:
  strlcpy(v2, v35, 0x400uLL);
LABEL_54:
  strlcat(v2, v20, 0x400uLL);
  return v19;
}

uint64_t __LinkedAtLeastSydro_block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  LinkedAtLeastSydro_uint64_t result = result;
  return result;
}

uint64_t _getNextDomain(unsigned int *a1)
{
  unsigned int v2 = *a1;
  unsigned int v3 = __clz(__rbit32(*a1));
  if (*a1) {
    uint64_t result = v3 + 1;
  }
  else {
    uint64_t result = 0LL;
  }
  if ((v2 & 0x400) != 0 && (_DWORD)result == 4) {
    return 11LL;
  }
  if ((v2 & 0x800) != 0 && (_DWORD)result == 4) {
    return 12LL;
  }
  if ((_DWORD)result == 15)
  {
    *a1 = v2 & 0xFFFFBBFF | 0x400;
    return 11LL;
  }

  return result;
}

char *nextRoot_init()
{
  if ((dyld_process_is_restricted() & 1) != 0) {
    v0 = 0LL;
  }
  else {
    v0 = getenv("NEXT_ROOT");
  }
  if (!v0) {
    v0 = (char *)&unk_18013EB6F;
  }
  uint64_t result = strdup(v0);
  qword_18C43CA20 = (uint64_t)result;
  return result;
}

uint64_t ministatfs(const char *a1, statfs *a2)
{
  uint64_t v19 = *MEMORY[0x1895FEE08];
  *(_OWORD *)uint64_t v11 = xmmword_18013E9C0;
  *(void *)&v11[16] = 0LL;
  uint64_t v4 = getattrlist(a1, v11, v12, 0x83CuLL, 1u);
  if ((_DWORD)v4) {
    goto LABEL_7;
  }
  if (*(_OWORD *)&v11[4] != v13) {
    goto LABEL_7;
  }
  if (*(_DWORD *)&v11[20] != v14) {
    goto LABEL_7;
  }
  bzero(a2, 0x878uLL);
  a2->f_fsid = v15;
  uint32_t v5 = v16;
  a2->f_iosize = v17;
  uint32_t v6 = v18;
  a2->f_type = v5;
  a2->f_flags = v6;
  unint64_t v7 = __strlcpy_chk();
  unint64_t v8 = __strlcpy_chk();
  if (v7 > 0x3FF) {
    goto LABEL_7;
  }
  if (v8 < 0x400) {
    return 0LL;
  }
LABEL_7:
  if (*__error() != 2)
  {
    if (_log_onceToken != -1) {
      dispatch_once(&_log_onceToken, &__block_literal_global_9);
    }
    v9 = (os_log_s *)_log_log;
    if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_ERROR)) {
      ministatfs_cold_1((uint64_t)a1, v4, v9);
    }
    return statfs(a1, a2);
  }

  return v4;
}

char *__user_local_dirname(int a1, int a2, char *__dst, size_t __size)
{
  if (a2 != 1) {
    goto LABEL_7;
  }
  if (qword_18C43CA28 != -1) {
    _os_once();
  }
  if (!qword_18C43CA90 || !*(_BYTE *)qword_18C43CA90 || strlcpy(__dst, (const char *)qword_18C43CA90, __size) >= __size)
  {
LABEL_7:
    __dst = 0LL;
    *__error() = 22;
  }

  return __dst;
}

void _dirhelper_init(_BYTE *a1)
{
  if (qword_18C43CA30) {
    bzero((void *)qword_18C43CA30, 0x400uLL);
  }
  else {
    qword_18C43CA30 = (uint64_t)calloc(0x400uLL, 1uLL);
  }
  pthread_mutex_init(&stru_18C43CA38, 0LL);
  dword_18C43CA78 = 0;
  if (!qword_18C43CA90)
  {
    unsigned int v2 = getenv("TMPDIR");
    if (v2)
    {
      unsigned int v3 = v2;
      if (*v2)
      {
        size_t v4 = strlen(v2) + 2;
        uint32_t v5 = (char *)calloc(v4, 1uLL);
        qword_18C43CA90 = (uint64_t)v5;
        if (v3[strlen(v3) - 1] == 47) {
          int v6 = snprintf(v5, v4, "%s");
        }
        else {
          int v6 = snprintf(v5, v4, "%s/");
        }
        if (v4 <= v6)
        {
          free((void *)qword_18C43CA90);
          qword_18C43CA90 = 0LL;
        }

        else if (qword_18C43CA90)
        {
          return;
        }
      }
    }

    uid_t v7 = geteuid();
    uid_t v8 = v7;
    if (a1 && *a1)
    {
      if (v7 == -2)
      {
        v9 = "/var/tmp/";
        goto LABEL_30;
      }

      if (v7 >= 0x1F5)
      {
        v9 = "/var/mobile/tmp/";
LABEL_30:
        qword_18C43CA90 = (uint64_t)strdup(v9);
        if (qword_18C43CA90) {
          return;
        }
        goto LABEL_34;
      }
    }

    else if (v7 != -2 && v7 >= 0x1F5)
    {
      if (getpwuid(v7))
      {
        int v10 = getpwuid(v8);
        pw_dir = v10->pw_dir;
        if (pw_dir)
        {
          if (*pw_dir)
          {
            size_t v12 = strlen(v10->pw_dir);
            size_t v13 = v12 + 7;
            int v14 = pw_dir[v12 - 1];
            fsid_t v15 = (char *)calloc(v12 + 7, 1uLL);
            uint32_t v16 = v15;
            int32_t v17 = "/tmp/";
            if (v14 == 47) {
              int32_t v17 = "tmp/";
            }
            if (v13 > snprintf(v15, v13, "%s%s", pw_dir, v17))
            {
              qword_18C43CA90 = (uint64_t)v16;
              if (v16) {
                return;
              }
LABEL_34:
              qword_18C43CA90 = (uint64_t)strdup("/var/tmp/");
              return;
            }

            free(v16);
          }
        }
      }
    }

    if (qword_18C43CA90) {
      return;
    }
    goto LABEL_34;
  }
}

  ;
}

uint64_t _libcoreservices_fork_child()
{
  qword_18C43CA28 = 0LL;
  qword_18C43CA80 = 0LL;
  return _os_once();
}

char *_dirhelper(int a1, char *__dst, size_t __size)
{
  uint64_t v13 = *MEMORY[0x1895FEE08];
  if (a1 != 1) {
    goto LABEL_19;
  }
  if (qword_18C43CA28 != -1) {
    _os_once();
  }
  if (!qword_18C43CA98 || !*(_BYTE *)qword_18C43CA98) {
    return __dst;
  }
  if (strlcat(__dst, (const char *)qword_18C43CA98, __size) >= __size)
  {
LABEL_19:
    v9 = __error();
    uint64_t result = 0LL;
    int *v9 = 22;
    return result;
  }

  if (!mkdir(__dst, 0x1C0u))
  {
    if (_log_onceToken != -1) {
      dispatch_once(&_log_onceToken, &__block_literal_global_9);
    }
    int v10 = (os_log_s *)_log_log;
    if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_DEFAULT))
    {
      v12.st_dev = 136446210;
      *(void *)&v12.st_mode = __dst;
      _os_log_impl( &dword_18013C000,  v10,  OS_LOG_TYPE_DEFAULT,  "__makeDirectory: created %{public}s",  (uint8_t *)&v12,  0xCu);
    }

    if (!lstat(__dst, &v12) && (v12.st_mode & 0x1FF) != 0x1C0 && (v12.st_flags & 0x100000) == 0) {
      chmod(__dst, 0x1C0u);
    }
LABEL_29:
    if (!__dst) {
      return 0LL;
    }
    goto LABEL_30;
  }

  if (*__error() == 17) {
    goto LABEL_29;
  }
  int v5 = *__error();
  if (_log_onceToken != -1) {
    dispatch_once(&_log_onceToken, &__block_literal_global_9);
  }
  int v6 = (os_log_s *)_log_log;
  if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_ERROR)) {
    _dirhelper_cold_1((uint64_t)__dst, v5, v6);
  }
  *__error() = v5;
  uid_t v7 = __error();
  uint64_t result = 0LL;
  if (__dst && *v7 == 17)
  {
LABEL_30:
    uint64_t v11 = getenv("TMPDIR");
    if (!v11 || strcmp(v11, __dst)) {
      setenv("TMPDIR", __dst, 1);
    }
    return __dst;
  }

  return result;
}

uint64_t _set_user_dir_suffix(char *__s)
{
  if (qword_18C43CA28 == -1)
  {
    if (!__s)
    {
LABEL_30:
      if (!qword_18C43CA98) {
        return 1LL;
      }
      free((void *)qword_18C43CA98);
      qword_18C43CA98 = 0LL;
      if (!qword_18C43CA90 || !*(_BYTE *)qword_18C43CA90) {
        return 1LL;
      }
      uint64_t v4 = 1LL;
      setenv("TMPDIR", (const char *)qword_18C43CA90, 1);
      return v4;
    }
  }

  else
  {
    _os_once();
    if (!__s) {
      goto LABEL_30;
    }
  }

  if (!*__s) {
    goto LABEL_30;
  }
  size_t v2 = strlen(__s);
  if (strnstr(__s, "/../", v2))
  {
LABEL_5:
    if (_log_onceToken != -1) {
      dispatch_once(&_log_onceToken, &__block_literal_global_9);
    }
    unsigned int v3 = (os_log_s *)_log_log;
    if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_ERROR)) {
      _set_user_dir_suffix_cold_1(v3);
    }
    goto LABEL_9;
  }

  if (v2 == 2)
  {
    if (*__s == 46)
    {
      int v5 = __s[1];
      goto LABEL_13;
    }
  }

  else if (v2 >= 3)
  {
    if (*__s == 46 && __s[1] == 46 && __s[2] == 47) {
      goto LABEL_5;
    }
    if (__s[v2 - 3] == 47 && __s[v2 - 2] == 46)
    {
      int v5 = __s[v2 - 1];
LABEL_13:
      if (v5 == 46) {
        goto LABEL_5;
      }
    }
  }

  if (qword_18C43CA98)
  {
    free((void *)qword_18C43CA98);
    qword_18C43CA98 = 0LL;
  }

  size_t v6 = strlen(__s) + 2;
  uint64_t v4 = 1LL;
  uid_t v7 = (char *)calloc(v6, 1uLL);
  qword_18C43CA98 = (uint64_t)v7;
  if (__s[strlen(__s) - 1] == 47) {
    int v8 = snprintf(v7, v6, "%s");
  }
  else {
    int v8 = snprintf(v7, v6, "%s/");
  }
  if (v6 <= v8)
  {
    free((void *)qword_18C43CA98);
    qword_18C43CA98 = 0LL;
LABEL_9:
    uint64_t v4 = 0LL;
    *__error() = 22;
  }

  return v4;
}

char *_get_user_dir_suffix()
{
  if (qword_18C43CA28 != -1) {
    _os_once();
  }
  uint64_t result = (char *)qword_18C43CA98;
  if (qword_18C43CA98) {
    return strdup((const char *)qword_18C43CA98);
  }
  return result;
}

void _append_relative_path_component()
{
}

char *__user_relative_dirname(uint64_t a1, int a2)
{
  if (a2) {
    abort();
  }
  return _dirhelper_relative_internal();
}

char *_dirhelper_relative_internal()
{
  v0 = (const char *)MEMORY[0x1895FE128]();
  size_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v13 = *MEMORY[0x1895FEE08];
  if (!ministatfs(v0, &v12))
  {
    if ((v12.f_flags & 1) != 0)
    {
      size_t v6 = 0LL;
      int v7 = 30;
      goto LABEL_38;
    }

    if ((v12.f_flags & 0x1000) == 0)
    {
      int v7 = 19;
      goto LABEL_41;
    }

    bzero(__source, 0x400uLL);
    if (_dirhelper(1, __source, 0x400uLL)
      && !ministatfs(__source, &v10)
      && *(void *)&v10.f_fsid == *(void *)&v12.f_fsid)
    {
      size_t v5 = strlcpy(v4, __source, v2);
      if (v5 >= v2) {
        size_t v6 = 0LL;
      }
      else {
        size_t v6 = v4;
      }
      int v7 = 2 * (v5 >= v2);
      if (v6) {
        goto LABEL_16;
      }
    }

    else
    {
      size_t v6 = 0LL;
      int v7 = 0;
    }

    if (v7 != 2)
    {
      getpid();
    }

LABEL_16:
    if (v6 || v7)
    {
LABEL_25:
      if (v6)
      {
        if (!v7) {
          return v6;
        }
        goto LABEL_38;
      }

      if ((v7 & 1) != 0)
      {
        if (v7 == 1)
        {
          size_t v6 = 0LL;
          int v7 = 1;
          goto LABEL_38;
        }

        int v7 = 2;
LABEL_41:
        if (_log_onceToken != -1) {
          dispatch_once(&_log_onceToken, &__block_literal_global_9);
        }
        if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_ERROR)) {
          _dirhelper_relative_internal_cold_1();
        }
        size_t v6 = 0LL;
        goto LABEL_38;
      }

      goto LABEL_33;
    }

    if (*(void *)&v12.f_fsid == _dirhelper_relative_internal_userDataDevice_0)
    {
      int v8 = "/var/mobile/tmp/";
    }

    else
    {
      int v8 = "/var/tmp/";
    }

    size_t v6 = v4;
    if (strlcpy(v4, v8, v2) < v2) {
      goto LABEL_25;
    }
LABEL_33:
    if (_log_onceToken != -1) {
      dispatch_once(&_log_onceToken, &__block_literal_global_9);
    }
    if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_DEBUG)) {
      _dirhelper_relative_internal_cold_2();
    }
  }

  size_t v6 = 0LL;
  int v7 = 2;
LABEL_38:
  *__error() = v7;
  return v6;
}

char *_dirhelper_relative(int a1)
{
  if (a1) {
    abort();
  }
  getuid();
  return _dirhelper_relative_internal();
}

void _dirhelper_relative_with_hints()
{
}

void __user_relative_dirname_with_hints()
{
}

os_log_t ___log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.libcoreservices", "default");
  _log_log = (uint64_t)result;
  return result;
}

uint64_t ___dirhelper_relative_internal_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1895FEE08];
  uint64_t result = ministatfs("/var/mobile/tmp/", &v1);
  if (!(_DWORD)result) {
    _dirhelper_relative_internal_userDataDevice_0 = (uint64_t)v1.f_fsid;
  }
  return result;
}

void ___dirhelper_relative_internal_block_invoke_20()
{
  uint64_t v3 = *MEMORY[0x1895FEE08];
  if (_log_onceToken != -1) {
    dispatch_once(&_log_onceToken, &__block_literal_global_9);
  }
  v0 = (os_log_s *)_log_log;
  if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    uint64_t v2 = "_dirhelper_relative_internal_block_invoke";
    _os_log_impl( &dword_18013C000,  v0,  OS_LOG_TYPE_DEFAULT,  "%s: this process is sandboxed so will never return /var/tmp/ or /var/mobile/tmp. This message is only logged once per process.",  (uint8_t *)&v1,  0xCu);
  }

void ministatfs_cold_1(uint64_t a1, int a2, os_log_s *a3)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  int v6 = *__error();
  int v7 = 136315906;
  int v8 = "ministatfs";
  __int16 v9 = 1024;
  int v10 = a2;
  __int16 v11 = 1024;
  int v12 = v6;
  __int16 v13 = 2082;
  uint64_t v14 = a1;
  _os_log_error_impl( &dword_18013C000,  a3,  OS_LOG_TYPE_ERROR,  "%s: getattrlist result=%d, error=%{errno}d, calling statfs for '%{public}s'",  (uint8_t *)&v7,  0x22u);
}

void _dirhelper_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1895FEE08];
  int v3 = 136446722;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = 448;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl( &dword_18013C000,  log,  OS_LOG_TYPE_ERROR,  "mkdir: path=%{public}s mode= %{darwin.mode}d: %{darwin.errno}d",  (uint8_t *)&v3,  0x18u);
}

void _set_user_dir_suffix_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl( &dword_18013C000,  log,  OS_LOG_TYPE_ERROR,  "illegal path traversal (..) pattern found in user_dir_suffix",  v1,  2u);
}

void _dirhelper_relative_internal_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895FEE08];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl( &dword_18013C000,  v0,  OS_LOG_TYPE_ERROR,  "%s: error for relativepath %s: %{errno}d",  (uint8_t *)v1,  0x1Cu);
}

void _dirhelper_relative_internal_cold_2()
{
  uint64_t v2 = *MEMORY[0x1895FEE08];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl( &dword_18013C000,  v0,  OS_LOG_TYPE_DEBUG,  "%s: no result for relativepath %s, err=%{errno}d",  (uint8_t *)v1,  0x1Cu);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895FF6D0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895FEE38]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895FF5F8]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_once()
{
  return MEMORY[0x189600420]();
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x189600258](__count, __size);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FF940](a1, a2);
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x1895FF588]();
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x1895FF590]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dyld_process_is_restricted()
{
  return MEMORY[0x1895FECB0]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1895FECB8]();
}

void free(void *a1)
{
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FFA80](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FF0E8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FFAA8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FFAE0]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1895FF648](*(void *)&a1);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1895FF650](*(void *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FFB10]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FFBF8](a1, a2);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FFE20](a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x189600890](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1896008B0](oslog, type);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1896006F0](a1, a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1896007A8]();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1895FF268](__name, __value, *(void *)&__overwrite);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FF2A0](__str, __size, __format);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x189600048](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FF2E8](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FF300](__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FF320](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FF328](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FF330](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1895FF360](__big, __little, __len);
}