unint64_t absolute_time_to_absolute_milliseconds(uint64_t a1)
{
  uint64_t *v2;
  v2 = sub_1882907A4();
  return *v2 * a1 / (unint64_t)v2[1];
}

double absolute_time_to_absolute_milliseconds_double(unint64_t a1)
{
  v2 = (unint64_t *)sub_1882907A4();
  return (double)a1 * (double)*v2 / (double)v2[1];
}

uint64_t now_in_absolute_milliseconds()
{
  uint64_t v0 = systemstats_mach_absolute_time();
  v1 = sub_1882907A4();
  return *v1 * v0 / v1[1];
}

uint64_t now_in_continuous_milliseconds()
{
  uint64_t v0 = systemstats_mach_continuous_time();
  v1 = sub_1882907A4();
  return *v1 * v0 / v1[1];
}

void *_systemstats_writers()
{
  if (qword_18C4E9CB0 != -1) {
    dispatch_once(&qword_18C4E9CB0, &unk_18A2167A0);
  }
  return &unk_18C4E9770;
}

uint64_t sub_18828FA7C()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  if ((_DWORD)result) {
    qword_18C4E9A90 = 0x40000000LL;
  }
  return result;
}

double sub_18828FAA8(uint64_t a1, int a2)
{
  *(void *)&double result = 4LL;
  *(_OWORD *)a1 = xmmword_188295AF0;
  *(_DWORD *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a1 + 32;
  return result;
}

void sub_18828FAC4(void *a1)
{
  if (*a1 >= 0x4000uLL) {
    sub_188294408();
  }
  v2 = (void *)a1[3];
  if (v2 != a1 + 4) {
    free(v2);
  }
}

uint64_t sub_18828FB00(uint64_t result, size_t *a2, unint64_t a3)
{
  if (a3)
  {
    unint64_t v3 = a3;
    unint64_t v5 = (8 * result);
    do
    {
      char __src = v5 & 0x7F | ((v5 > 0x7F) << 7);
      sub_18828FCCC(a2, &__src, 1uLL);
      BOOL v6 = v5 >= 0x7F;
      BOOL v7 = v5 == 127;
      v5 >>= 7;
    }

    while (!v7 && v6);
    do
    {
      char v9 = v3 & 0x7F | ((v3 > 0x7F) << 7);
      double result = (uint64_t)sub_18828FCCC(a2, &v9, 1uLL);
      BOOL v6 = v3 >= 0x7F;
      BOOL v7 = v3 == 127;
      v3 >>= 7;
    }

    while (!v7 && v6);
  }

  return result;
}

void *sub_18828FB98(void *result, size_t *a2, void *a3, size_t a4)
{
  if (a3 && a4)
  {
    unint64_t v7 = (8 * (_DWORD)result) | 2u;
    do
    {
      char __src = v7 & 0x7F | ((v7 > 0x7F) << 7);
      sub_18828FCCC(a2, &__src, 1uLL);
      BOOL v8 = v7 > 0x7F;
      v7 >>= 7;
    }

    while (v8);
    size_t v9 = 16382 - *a2;
    if (a4 >= v9)
    {
      if (a4 != v9) {
        _os_assumes_log();
      }
      unint64_t v12 = v9;
      do
      {
        char v15 = v12 & 0x7F | ((v12 > 0x7F) << 7);
        sub_18828FCCC(a2, &v15, 1uLL);
        BOOL v8 = v12 > 0x7F;
        v12 >>= 7;
      }

      while (v8);
    }

    else
    {
      unint64_t v10 = a4;
      do
      {
        char v14 = v10 & 0x7F | ((v10 > 0x7F) << 7);
        sub_18828FCCC(a2, &v14, 1uLL);
        BOOL v11 = v10 >= 0x80;
        v10 >>= 7;
      }

      while (v11);
      size_t v9 = a4;
    }

    return sub_18828FCCC(a2, a3, v9);
  }

  return result;
}

void *sub_18828FCCC(size_t *a1, void *__src, size_t __n)
{
  if (__n >> 14 || (size_t v5 = *a1, v6 = *a1 + __n, v6 >= 0x4000)) {
    abort();
  }
  unint64_t v8 = a1[1];
  size_t v9 = (size_t *)a1[3];
  if (v6 > v8)
  {
    if (v9 == a1 + 4) {
      unint64_t v10 = 0LL;
    }
    else {
      unint64_t v10 = (void *)a1[3];
    }
    unint64_t v11 = 2 * v8;
    if (v11 > v6) {
      unint64_t v6 = v11;
    }
    if (v6 >= 0x3FFF) {
      size_t v12 = 0x3FFFLL;
    }
    else {
      size_t v12 = v6;
    }
    a1[1] = v12;
    v13 = (size_t *)reallocf(v10, v12);
    a1[3] = (size_t)v13;
    if (!v13) {
      sub_188294408();
    }
    size_t v9 = v13;
    size_t v5 = *a1;
    if (!v10) {
      memcpy(v13, a1 + 4, *a1);
    }
  }

  double result = memcpy((char *)v9 + v5, __src, __n);
  size_t v15 = a1[1];
  size_t v16 = *a1 + __n;
  *a1 = v16;
  if (v16 > v15) {
    sub_188294408();
  }
  return result;
}

void *sub_18828FDB4(void *result, size_t *a2, char *__s)
{
  if (__s)
  {
    size_t v5 = result;
    size_t v6 = strlen(__s);
    return sub_18828FB98(v5, a2, __s, v6);
  }

  return result;
}

uint64_t sub_18828FE00(uint64_t a1)
{
  uint64_t v2 = *(void *)a1 - 4LL;
  if (*(void *)a1 == 4LL) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = (flsll(*(void *)a1 - 4LL) - 1) / 7 + 1;
  }
  unint64_t v4 = (8 * *(_DWORD *)(a1 + 16)) | 2u;
  int v5 = (flsll(v4) - 1) / 7 + 1;
  unint64_t v6 = v3 + v5;
  if (v6 >= 5) {
    sub_188294408();
  }
  uint64_t v7 = 4 - v3;
  *(void *)a1 = v7 - v5;
  do
  {
    char __src = v4 & 0x7F | ((v4 > 0x7F) << 7);
    sub_18828FCCC((size_t *)a1, &__src, 1uLL);
    BOOL v8 = v4 > 0x7F;
    v4 >>= 7;
  }

  while (v8);
  if (*(void *)a1 != v7) {
    sub_188294408();
  }
  unint64_t v9 = v2;
  do
  {
    char v12 = v9 & 0x7F | ((v9 > 0x7F) << 7);
    sub_18828FCCC((size_t *)a1, &v12, 1uLL);
    BOOL v8 = v9 > 0x7F;
    v9 >>= 7;
  }

  while (v8);
  if (*(void *)a1 != 4LL) {
    sub_188294408();
  }
  *(void *)a1 = v6 + v2;
  return *(void *)(a1 + 24) - v6 + 4;
}

double systemstats_create_record(int a1)
{
  uint64_t v2 = malloc(0xA0uLL);
  *(void *)&double result = 4LL;
  *(_OWORD *)uint64_t v2 = xmmword_188295AF0;
  v2[4] = a1;
  *((void *)v2 + 3) = v2 + 8;
  return result;
}

void systemstats_insert_and_dispose_subrecord(size_t *a1, uint64_t a2)
{
}

void systemstats_write_and_dispose_record(_BYTE *a1, uint64_t *a2)
{
  if (a1 && *a1)
  {
    uint64_t v4 = sub_18828FE00((uint64_t)a2);
    _systemstats_queued_write((uint64_t)a1, v4, *a2);
    sub_18828FAC4(a2);
    free(a2);
  }

  else
  {
    _os_assumes_log();
  }
}

void systemstats_dispose_record(void *a1)
{
}

uint64_t systemstats_write_checkpoint(_BYTE *a1)
{
  uint64_t v2 = now_in_absolute_milliseconds();
  uint64_t v3 = malloc(0xA0uLL);
  *(_OWORD *)uint64_t v3 = xmmword_188295AF0;
  v3[4] = 36;
  *((void *)v3 + 3) = v3 + 8;
  sub_18828FB00(1LL, (size_t *)v3, v2);
  systemstats_write_and_dispose_record(a1, (uint64_t *)v3);
  return v2;
}

uint64_t sub_1882900E8()
{
  return _os_assert_log();
}

void _systemstats_enumerate_files( const char *a1, const char *a2, const char *a3, const char **a4, size_t *a5, uint64_t a6, void *a7)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  char v12 = a7;
  if (a1) {
    v13 = a1;
  }
  else {
    v13 = "/private/var/db/systemstats";
  }
  char v14 = opendir(v13);
  if (v14)
  {
    size_t v15 = v14;
    int v31 = (int)v13;
    int v30 = dirfd(v14);
    size_t v16 = readdir(v15);
    v17 = a2;
    if (v16)
    {
      v18 = v16;
      do
      {
        if (v18->d_type == 8 && v18->d_namlen > 0x27u)
        {
          __strlcpy_chk();
          if (!uuid_parse(in, uu)
            && (!v17 || !strncmp(v17, in, 0x25uLL))
            && (!a3 || strncmp(a3, in, 0x25uLL))
            && v18->d_name[36] == 46)
          {
            if (!a6) {
              goto LABEL_24;
            }
            v25 = a3;
            v26 = a4;
            uint64_t v28 = a6;
            v29 = v12;
            char v19 = 0;
            unint64_t d_namlen = v18->d_namlen;
            v27 = a5;
            uint64_t v21 = a6;
            do
            {
              size_t v23 = *a5++;
              size_t v22 = v23;
              if (v23 + 38 <= d_namlen && !strncmp(&v18->d_name[37], *a4, v22)) {
                v19 |= v18->d_name[v22 + 37] == 46;
              }
              ++a4;
              --v21;
            }

            while (v21);
            a6 = v28;
            char v12 = v29;
            a4 = v26;
            a5 = v27;
            a3 = v25;
            v17 = a2;
            if ((v19 & 1) != 0)
            {
LABEL_24:
              int v24 = sub_18829078C(v31, v30, v18->d_name, &v33);
              if (v24)
              {
                if (v24 == -1) {
                  sub_18829441C();
                }
              }

              else
              {
                v12[2](v12, (uint64_t)v18->d_name, v18->d_namlen, &v33);
              }
            }
          }
        }

        v18 = readdir(v15);
      }

      while (v18);
    }

    closedir(v15);
  }

  else if (*__error())
  {
    _os_assumes_log();
  }
}

void systemstats_delete_old_files(const char *a1, const char *a2, char *__s, uint64_t a4, void *a5)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  v48 = __s;
  if (a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = "/private/var/db/systemstats";
  }
  uint64_t v8 = *a5 - 345600LL;
  size_t v47 = strlen(__s);
  context = (void *)MEMORY[0x1895C0AA0]();
  id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
  uint64_t v43 = 0LL;
  v44 = &v43;
  uint64_t v45 = 0x2020000000LL;
  uint64_t v46 = 0LL;
  v36[0] = MEMORY[0x1895F87A8];
  v36[1] = 3221225472LL;
  v36[2] = sub_188290698;
  v36[3] = &unk_18A2167C8;
  v41 = v7;
  uint64_t v42 = v8;
  id v12 = v9;
  id v37 = v12;
  id v13 = v10;
  id v38 = v13;
  id v14 = v11;
  id v39 = v14;
  v40 = &v43;
  _systemstats_enumerate_files(v7, 0LL, a2, &v48, &v47, 1LL, v36);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v50 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v33;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v15);
        }
        unlink((const char *)[*(id *)(*((void *)&v32 + 1) + 8 * v18++) UTF8String]);
      }

      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v50 count:16];
    }

    while (v16);
  }

  unint64_t v19 = 4 * a4;
  if (v44[3] > (unint64_t)(4 * a4))
  {
    [v13 keysSortedByValueUsingSelector:sel_compare_];
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v49 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v29;
LABEL_14:
      uint64_t v23 = 0LL;
      while (1)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v20);
        }
        id v24 = *(id *)(*((void *)&v28 + 1) + 8 * v23);
        unlink((const char *)[v24 UTF8String]);
        [v14 objectForKeyedSubscript:v24];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = [v25 unsignedIntegerValue];
        v44[3] -= v26;

        if (v44[3] <= v19) {
          break;
        }
        if (v21 == ++v23)
        {
          uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v49 count:16];
          if (v21) {
            goto LABEL_14;
          }
          break;
        }
      }
    }
  }

  _Block_object_dispose(&v43, 8);
  objc_autoreleasePoolPop(context);
}

void sub_18829065C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_188290698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 48);
  id v9 = (id)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s/%s", *(void *)(a1 + 64), a2);
  if (v6 >= *(void *)(a1 + 72))
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189603F50]) initWithTimeIntervalSince1970:(double)v6];
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v9];

    [MEMORY[0x189607968] numberWithLongLong:*(void *)(a4 + 96)];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:v9];

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) += *(void *)(a4 + 96);
  }

  else
  {
    [*(id *)(a1 + 32) addObject:v9];
  }
}

uint64_t sub_18829078C(int a1, int a2, char *a3, stat *a4)
{
  return fstatat(a2, a3, a4, 32);
}

uint64_t *sub_1882907A4()
{
  if (qword_18C4E9CB8 != -1) {
    dispatch_once(&qword_18C4E9CB8, &unk_18A216808);
  }
  return &qword_18C4E9CC0;
}

uint64_t sub_1882907E4()
{
  uint64_t v0 = 1000000LL;
  uint64_t result = mach_timebase_info(&info);
  if ((_DWORD)result)
  {
    uint64_t result = _os_assumes_log();
    goto LABEL_5;
  }

  if (!info.denom)
  {
LABEL_5:
    qword_18C4E9CC0 = 1LL;
    goto LABEL_6;
  }

  qword_18C4E9CC0 = info.numer;
  uint64_t v0 = 1000000LL * info.denom;
LABEL_6:
  qword_18C4E9CC8 = v0;
  return result;
}

BOOL _systemstats_get_system_version(char *a1, size_t a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  size_t v6 = a2;
  *(void *)uint64_t v7 = 0x4100000001LL;
  int v4 = sysctl(v7, 2u, a1, &v6, 0LL, 0LL);
  if (v4 == -1) {
    sub_18829441C();
  }
  a1[a2 - 1] = 0;
  return v4 == 0;
}

uint64_t sub_188290900(unsigned __int8 *a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  size_t v4 = 37LL;
  int v2 = sysctlbyname("kern.bootsessionuuid", in, &v4, 0LL, 0LL);
  if (v2 || (in[36] = 0, (int v2 = uuid_parse(in, a1)) != 0))
  {
    if (v2 == -1) {
      sub_18829441C();
    }
    uuid_generate_random(a1);
  }

  return 1LL;
}

unint64_t now_in_wall_milliseconds()
{
  int v0 = systemstats_gettimeofday(&v3, 0LL);
  if (!v0) {
    return 1000 * v3.tv_sec + v3.tv_usec / 0x3E8uLL;
  }
  int v1 = v0;
  unint64_t result = 0LL;
  if (v1 == -1)
  {
    sub_18829441C();
    return 0LL;
  }

  return result;
}

uint64_t sub_188290A18(const char *a1, void *a2, size_t a3)
{
  int v5 = open(a1, 0);
  if (v5 < 0) {
    return -1LL;
  }
  int v6 = v5;
  do
    ssize_t v7 = read(v6, a2, a3);
  while (v7 == -1 && *__error() == 4);
  if (close(v6) == -1) {
    sub_18829441C();
  }
  return v7;
}

uint64_t _systemstats_read_uuid(const char *a1, unsigned __int8 *a2, _BYTE *a3)
{
  uint64_t v5 = sub_188290A18(a1, a3, 0x25uLL);
  if (v5 == 37)
  {
    a3[36] = 0;
    if (uuid_parse(a3, a2))
    {
      _os_assumes_log();
      return 0LL;
    }

    else
    {
      return 1LL;
    }
  }

  else
  {
    if (v5 == -1 && *__error() != 2) {
      sub_18829441C();
    }
    _os_assumes_log();
    uint64_t result = 0LL;
    *a3 = 0;
  }

  return result;
}

BOOL _systemstats_read_current_build(const char *a1, _BYTE *a2, size_t a3)
{
  BOOL v3 = 0LL;
  if (a2 && a3)
  {
    size_t v4 = a2;
    uint64_t v6 = sub_188290A18(a1, a2, a3);
    BOOL v3 = v6 != -1;
    if (v6 == -1)
    {
      int v7 = *__error();
      BOOL v8 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
      if (v7 == 2)
      {
        if (v8) {
          sub_188294438((uint64_t)a1);
        }
      }

      else if (v8)
      {
        sub_1882944B4((uint64_t)a1);
      }
    }

    else
    {
      size_t v4 = &v4[v6 - 1];
    }

    *size_t v4 = 0;
  }

  return v3;
}

char *_systemstats_copy_cookie_path(const char *a1, const char *a2)
{
  size_t v4 = 0LL;
  int v2 = "/private/var/db/systemstats";
  if (a1) {
    int v2 = a1;
  }
  asprintf(&v4, "%s/%s", v2, a2);
  return v4;
}

uint64_t _systemstats_read_uuid_from_cookie_path( const char *a1, const char *a2, unsigned __int8 *a3, _BYTE *a4)
{
  uint64_t uuid = 0LL;
  if (a2 && a3 && a4)
  {
    id v10 = 0LL;
    int v7 = "/private/var/db/systemstats";
    if (a1) {
      int v7 = a1;
    }
    asprintf(&v10, "%s/%s", v7, a2);
    BOOL v8 = v10;
    if (v10)
    {
      uint64_t uuid = _systemstats_read_uuid(v10, a3, a4);
      free(v8);
    }

    else
    {
      return 0LL;
    }
  }

  return uuid;
}

void systemstats_unlink_if_present(const char *a1, const char *a2)
{
  *(void *)&v5.st_dev = 0LL;
  BOOL v3 = "/private/var/db/systemstats";
  if (a1) {
    BOOL v3 = a1;
  }
  asprintf((char **)&v5, "%s/%s", v3, a2);
  if (a2)
  {
    size_t v4 = *(char **)&v5.st_dev;
    free(v4);
  }

BOOL sub_188290D20()
{
  return !getenv("DISABLE_FDR")
      && !getenv("DISABLE_SYSTEMSTATS")
      && stat("/private/var/db/systemstats/disabled", &v1) != 0;
}

unint64_t systemstats_foreach_micro(unint64_t a1, uint64_t a2, char a3, void *a4)
{
  int v7 = a4;
  if ((a2 & 0x8000000000000000LL) == 0)
  {
    int v8 = 0;
    unint64_t v9 = 0LL;
    unint64_t v10 = 0LL;
    unint64_t v11 = 0LL;
    unint64_t v12 = a1 + a2;
    unint64_t v13 = a1;
    while (v13 != v12 || (a3 & 1) == 0)
    {
      if (v13 != v12)
      {
        if (v13 + 4 > v12) {
          break;
        }
        int v8 = *(_DWORD *)v13;
      }

      BOOL v14 = v8 == 835010577 || v13 == v12;
      if (v14 && v11)
      {
        if (!v7[2](v7, v11, v10, v9, v13 - v11)) {
          break;
        }
        unint64_t v11 = 0LL;
        unint64_t v10 = 0LL;
        unint64_t v9 = 0LL;
        a1 = v13;
      }

      if (v13 == v12) {
        break;
      }
      switch(v8)
      {
        case -557122643:
          unint64_t v15 = v13 + 293;
          if (v13 + 293 <= v12)
          {
            unsigned int v16 = *(_DWORD *)(v13 + 56);
            unint64_t v17 = v15 + 20LL * v16;
            v15 += 24LL * v16;
            if ((*(_BYTE *)(v13 + 80) & 1) == 0) {
              unint64_t v15 = v17;
            }
          }

          unint64_t v10 = v13;
          break;
        case -17958194:
          unint64_t v15 = v13 + 316;
          if (v13 + 316 <= v12)
          {
            uint64_t v18 = 324LL;
            if ((*(_BYTE *)(v13 + 68) & 4) == 0) {
              uint64_t v18 = 316LL;
            }
            if ((*(_BYTE *)(v13 + 68) & 2) != 0) {
              char v19 = 4;
            }
            else {
              char v19 = 3;
            }
            unint64_t v20 = v13 + v18 + ((unint64_t)*(unsigned int *)(v13 + 4) << v19);
            if ((*(_BYTE *)(v13 + 68) & 1) != 0)
            {
              if ((*(_BYTE *)(v13 + 68) & 8) != 0) {
                char v21 = 3;
              }
              else {
                char v21 = 4;
              }
            }

            else
            {
              char v21 = 2;
              if ((*(_BYTE *)(v13 + 68) & 8) == 0) {
                char v21 = 3;
              }
            }

            unint64_t v15 = v20 + ((unint64_t)*(unsigned int *)(v13 + 8) << v21);
          }

          unint64_t v9 = v13;
          break;
        case 835010577:
          unint64_t v15 = v13 + 27;
          unint64_t v11 = v13;
          break;
        default:
          a1 = 0LL;
          goto LABEL_44;
      }

      if (v15 <= v12)
      {
        unint64_t v13 = v15;
        if (v15 >= a1) {
          continue;
        }
      }

      break;
    }
  }

LABEL_44:
  return a1;
}

void get_microstackshots_from_files(const char *a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
  if (v7) {
    sub_1882945C4(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  if (!v5)
  {
    uint64_t uint64 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    int v16 = 0;
    goto LABEL_9;
  }

  uint64_t uint64 = xpc_dictionary_get_uint64(v5, "time");
  int v16 = xpc_dictionary_get_uint64(v5, "pid");
  uint64_t v17 = xpc_dictionary_get_uint64(v5, "uniqueid");
  uint64_t v18 = xpc_dictionary_get_uint64(v5, "type");
  if (!xpc_dictionary_get_BOOL(v5, "currentBoot"))
  {
LABEL_9:
    char v19 = 0LL;
    uint64_t v40 = 0LL;
    v41 = &v40;
    uint64_t v42 = 0x2020000000LL;
    uint64_t v43 = 0LL;
    goto LABEL_10;
  }

  char v19 = v48;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  uint64_t v43 = 0LL;
LABEL_10:
  uint64_t v20 = MEMORY[0x1895F87A8];
  v33[0] = MEMORY[0x1895F87A8];
  v33[1] = 3221225472LL;
  v33[2] = sub_1882911F8;
  v33[3] = &unk_18A216830;
  int v39 = v16;
  uint64_t v36 = v17;
  uint64_t v37 = v18;
  uint64_t v38 = uint64;
  id v21 = v6;
  id v34 = v21;
  __int128 v35 = &v40;
  uint64_t v22 = v33;
  v46[0] = v20;
  v46[1] = 3221225472LL;
  v46[2] = sub_188292274;
  v46[3] = &unk_18A2168A8;
  id v47 = v22;
  uint64_t v23 = v22;
  id v24 = (void *)MEMORY[0x1895C0B54](v46);
  v44[0] = v20;
  v44[1] = 3221225472LL;
  v44[2] = sub_188292444;
  v44[3] = &unk_18A2168D0;
  id v45 = v24;
  id v25 = v24;
  sub_188292294(a1, v19, uint64, v44);

  (*((void (**)(id, uint64_t, void, void))v21 + 2))(v21, 1LL, 0LL, 0LL);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    sub_188294550((uint64_t)&v41, v26, v27, v28, v29, v30, v31, v32);
  }

  _Block_object_dispose(&v40, 8);
}

void sub_1882911D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
}

void sub_1882911F8(uint64_t a1, void *bytes, uint64_t a3, int a4, size_t length)
{
  if ((!a3 || (int v6 = *(_DWORD *)(a1 + 72)) == 0 || *(_DWORD *)(a3 + 4) == v6)
    && (!a3 || (uint64_t v7 = *(void *)(a1 + 48)) == 0 || *(void *)(a3 + 8) == v7))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    if ((!v8 || (v8 & *((_BYTE *)bytes + 24)) != 0) && *((void *)bytes + 1) >= *(void *)(a1 + 64))
    {
      id v9 = xpc_data_create(bytes, length);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    }
  }

uint64_t systemstats_microstackshot_checkpoint_async(void *a1)
{
  id v1 = a1;
  int out_token = 0;
  dispatch_get_global_queue(0LL, 0LL);
  int v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  int v7[2] = sub_18829139C;
  v7[3] = &unk_18A216858;
  id v3 = v1;
  id v8 = v3;
  uint32_t v4 = notify_register_dispatch("com.apple.telemetry.immediate-done", &out_token, v2, v7);

  uint64_t v5 = 0LL;
  if (!v4)
  {
    if (notify_post("com.apple.telemetry.immediate"))
    {
      notify_cancel(out_token);
      uint64_t v5 = 0LL;
    }

    else
    {
      uint64_t v5 = 1LL;
    }
  }

  return v5;
}

uint64_t sub_18829139C(uint64_t a1, int token)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t systemstats_persistence_is_allowed()
{
  v18[1] = *MEMORY[0x1895F89C0];
  CFPropertyListRef v0 = CFPreferencesCopyValue( @"allowMicrostackshotPersistence",  @"com.apple.da",  @"mobile",  (CFStringRef)*MEMORY[0x189605190]);
  if (v0)
  {
    id v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFNumberGetTypeID())
    {
      v18[0] = 0LL;
      if (CFNumberGetValue((CFNumberRef)v1, kCFNumberSInt64Type, v18) && v18[0] < 2uLL)
      {
        BOOL v3 = v18[0] == 0LL;
LABEL_8:
        uint64_t v5 = !v3;
        CFRelease(v1);
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
        {
          LODWORD(v18[0]) = 67109120;
          HIDWORD(v18[0]) = v5;
          _os_log_impl( &dword_18828E000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "allowMicrostackshotPersistence setting: %d",  (uint8_t *)v18,  8u);
        }

        return v5;
      }
    }

    else
    {
      CFTypeID v4 = CFGetTypeID(v1);
      if (v4 == CFBooleanGetTypeID())
      {
        BOOL v3 = CFBooleanGetValue((CFBooleanRef)v1) == 0;
        goto LABEL_8;
      }
    }

    CFTypeID v6 = CFGetTypeID(v1);
    CFStringRef v7 = CFCopyTypeIDDescription(v6);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
      sub_1882946D4();
    }
    CFRelease(v7);
    CFRelease(v1);
  }

  char has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
  if ((has_internal_diagnostics & 1) != 0)
  {
    if (v9) {
      sub_1882945F8(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    return 1LL;
  }

  else
  {
    if (v9) {
      sub_188294668(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    return 0LL;
  }

BOOL systemstats_cpu_hotspot_report_allowed_by_tasking()
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  double v20 = 0.0;
  if (!sub_1882916D8(@"cpuHotspotReportPercentage", &v20))
  {
LABEL_8:
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    BOOL v11 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
    if (has_internal_diagnostics)
    {
      if (v11) {
        sub_188294748(v11, v12, v13, v14, v15, v16, v17, v18);
      }
      double v0 = 100.0;
    }

    else
    {
      double v0 = 0.0;
      if (v11) {
        sub_1882947B8(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }

    return sub_1882917C4(v0);
  }

  double v0 = v20;
  if (v20 < 0.0 || v20 > 100.0)
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
    if (v2) {
      sub_188294824(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    goto LABEL_8;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v22 = v0;
    _os_log_impl( &dword_18828E000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "cpuHotspotReportPercentage setting: %.1f",  buf,  0xCu);
  }

  return sub_1882917C4(v0);
}

uint64_t sub_1882916D8(const __CFString *a1, void *a2)
{
  CFPropertyListRef v4 = CFPreferencesCopyValue(a1, @"com.apple.da", @"mobile", (CFStringRef)*MEMORY[0x189605190]);
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFNumberGetTypeID() && (uint64_t valuePtr = 0LL, CFNumberGetValue((CFNumberRef)v5, kCFNumberDoubleType, &valuePtr)))
  {
    *a2 = valuePtr;
    uint64_t v7 = 1LL;
  }

  else
  {
    CFTypeID v8 = CFGetTypeID(v5);
    CFStringRef v9 = CFCopyTypeIDDescription(v8);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
      sub_188294890((uint64_t)a1, (uint64_t)v9, (uint64_t)v5, v10, v11, v12, v13, v14);
    }
    CFRelease(v9);
    uint64_t v7 = 0LL;
  }

  CFRelease(v5);
  return v7;
}

BOOL sub_1882917C4(double a1)
{
  if (a1 <= 0.0) {
    return 0LL;
  }
  if (a1 >= 100.0) {
    return 1LL;
  }
  if (qword_18C703D38 != -1) {
    dispatch_once(&qword_18C703D38, &unk_18A216938);
  }
  double v2 = (double)rand() * 100.0 / 2147483650.0;
  BOOL result = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
  if (v2 <= a1)
  {
    if (result) {
      sub_188294910();
    }
    return 1LL;
  }

  if (result)
  {
    sub_188294978();
    return 0LL;
  }

  return result;
}

BOOL systemstats_io_hotspot_report_allowed_by_tasking()
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  double v20 = 0.0;
  if (!sub_1882916D8(@"ioHotspotReportPercentage", &v20))
  {
LABEL_8:
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    BOOL v11 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
    if (has_internal_diagnostics)
    {
      if (v11) {
        sub_1882949E0(v11, v12, v13, v14, v15, v16, v17, v18);
      }
      double v0 = 100.0;
    }

    else
    {
      double v0 = 0.0;
      if (v11) {
        sub_188294A50(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }

    return sub_1882917C4(v0);
  }

  double v0 = v20;
  if (v20 < 0.0 || v20 > 100.0)
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
    if (v2) {
      sub_188294ABC(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    goto LABEL_8;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    double v22 = v0;
    _os_log_impl( &dword_18828E000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "cpuHotspotReportPercentage setting: %.1f",  buf,  0xCu);
  }

  return sub_1882917C4(v0);
}

uint64_t systemstats_get_pmi_cycle_interval()
{
  uint64_t v0 = 10000000000LL;
  CFPropertyListRef v1 = CFPreferencesCopyValue( @"microstackshotPMICycleInterval",  @"com.apple.da",  @"mobile",  (CFStringRef)*MEMORY[0x189605190]);
  if (v1)
  {
    BOOL v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFNumberGetTypeID()
      && (unint64_t valuePtr = 0LL, CFNumberGetValue((CFNumberRef)v2, kCFNumberSInt64Type, &valuePtr)))
    {
      unint64_t v4 = valuePtr;
      CFRelease(v2);
      if (v4 - 1 < 0x3B9AC9FF) {
        uint64_t v5 = 1000000000LL;
      }
      else {
        uint64_t v5 = v4;
      }
      if (v4 <= 0x174876E800LL) {
        return v5;
      }
      else {
        return 100000000000LL;
      }
    }

    else
    {
      CFTypeID v6 = CFGetTypeID(v2);
      CFStringRef v7 = CFCopyTypeIDDescription(v6);
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT)) {
        sub_188294B28();
      }
      CFRelease(v7);
      CFRelease(v2);
    }
  }

  return v0;
}

void systemstats_get_microstackshots(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ((systemstats_persistence_is_allowed() & 1) != 0)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
    v35[0] = MEMORY[0x1895F87A8];
    v35[1] = 3221225472LL;
    v35[2] = sub_188291D78;
    v35[3] = &unk_18A216880;
    CFTypeID v6 = v5;
    uint64_t v36 = v6;
    if (systemstats_microstackshot_checkpoint_async(v35))
    {
      dispatch_time_t v7 = dispatch_time(0LL, 10000000000LL);
      uint64_t v8 = dispatch_semaphore_wait(v6, v7);
      BOOL v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
      if (v8)
      {
        if (v9) {
          sub_188294BD0(v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }

      else if (v9)
      {
        sub_188294B9C(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }

    get_microstackshots_from_files("/private/var/db/systemstats", v3, v4);
  }

  else
  {
    CFTypeID v6 = (dispatch_semaphore_s *)v3;
    id v17 = v4;
    BOOL v18 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
    if (v18) {
      sub_188294C6C(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    uint64_t v26 = malloc(0x10000uLL);
    if (v26)
    {
      uint64_t v27 = v26;
      unsigned int v28 = __microstackshot();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        sub_188294C04();
      }
      if (v28 <= 0x10000)
      {
        if (v6)
        {
          uint64_t uint64 = xpc_dictionary_get_uint64(v6, "time");
          int v30 = xpc_dictionary_get_uint64(v6, "pid");
          uint64_t v31 = xpc_dictionary_get_uint64(v6, "uniqueid");
          uint64_t v32 = xpc_dictionary_get_uint64(v6, "type");
        }

        else
        {
          uint64_t uint64 = 0LL;
          uint64_t v31 = 0LL;
          uint64_t v32 = 0LL;
          int v30 = 0;
        }

        v37[0] = MEMORY[0x1895F87A8];
        v37[1] = 3221225472LL;
        v37[2] = sub_188292728;
        v37[3] = &unk_18A216960;
        int v42 = v30;
        uint64_t v39 = v31;
        uint64_t v40 = v32;
        uint64_t v41 = uint64;
        id v33 = v17;
        id v38 = v33;
        id v34 = (void *)MEMORY[0x1895C0B54](v37);
        systemstats_foreach_micro((unint64_t)v27, v28, 0, v34);
        (*((void (**)(id, uint64_t, void, void))v33 + 2))(v33, 1LL, 0LL, 0LL);
      }

      free(v27);
    }
  }
}

uint64_t sub_188291D78(uint64_t a1)
{
  BOOL v2 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
  if (v2) {
    sub_188294CA0(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t systemstats_copy_microstackshots_to_file(void *a1, int a2)
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  if ((a2 & 0x80000000) == 0)
  {
    if ((systemstats_persistence_is_allowed() & 1) != 0)
    {
      dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
      uint64_t v5 = MEMORY[0x1895F87A8];
      v54[0] = MEMORY[0x1895F87A8];
      v54[1] = 3221225472LL;
      v54[2] = sub_188292234;
      v54[3] = &unk_18A216880;
      uint64_t v6 = v4;
      v55 = v6;
      if (systemstats_microstackshot_checkpoint_async(v54))
      {
        dispatch_time_t v7 = dispatch_time(0LL, 10000000000LL);
        uint64_t v8 = dispatch_semaphore_wait(v6, v7);
        BOOL v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
        if (v8)
        {
          if (v9) {
            sub_188294BD0(v9, v10, v11, v12, v13, v14, v15, v16);
          }
        }

        else if (v9)
        {
          sub_188294B9C(v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }

      id v41 = v3;
      BOOL v42 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
      if (v42) {
        sub_188294D10(v42, v43, v44, v45, v46, v47, v48, v49);
      }
      if (v41)
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(v41, "time");
        if (xpc_dictionary_get_BOOL(v41, "currentBoot"))
        {
          uint64_t v51 = v68;
          if (!_systemstats_read_uuid_from_cookie_path( "/private/var/db/systemstats",  "current_boot_uuid",  v69,  v68)) {
            uint64_t v51 = 0LL;
          }
          goto LABEL_39;
        }
      }

      else
      {
        uint64_t uint64 = 0LL;
      }

      uint64_t v51 = 0LL;
LABEL_39:
      v52 = malloc(0x100000uLL);
      uint64_t v64 = 0LL;
      v65 = &v64;
      uint64_t v66 = 0x2020000000LL;
      int v67 = 1;
      *(void *)buf = v5;
      uint64_t v57 = 3221225472LL;
      v58 = sub_1882927C8;
      v59 = &unk_18A2169B0;
      v60 = &v64;
      v61 = v52;
      int v62 = a2;
      int v63 = 0x100000;
      sub_188292294("/private/var/db/systemstats", v51, uint64, buf);
      free(v52);
      uint64_t v17 = *((unsigned int *)v65 + 6);
      _Block_object_dispose(&v64, 8);

      goto LABEL_50;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_18828E000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Persistence disallowed, copying only live microstackshots",  buf,  2u);
    }

    BOOL v18 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
    if (v18) {
      sub_188294C6C(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    uint64_t v26 = malloc(0x10000uLL);
    if (v26)
    {
      uint64_t v27 = v26;
      unsigned int v28 = __microstackshot();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        sub_188294C04();
      }
      if (v28 <= 0x10000)
      {
        int v29 = dup(a2);
        if (v29 < 0)
        {
          uint64_t v17 = *__error();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            sub_188294DAC();
          }
        }

        else
        {
          int v30 = gzdopen(a2, "ab");
          uint64_t v31 = v30;
          if (v30)
          {
            *(_DWORD *)buf = 0;
            if (gzwrite(v30, v27, 0x10000u) != 0x10000)
            {
              uint64_t v32 = gzerror(v31, (int *)buf);
              uint64_t v33 = *(unsigned int *)buf;
              if (*(_DWORD *)buf == -1)
              {
                *(_DWORD *)buf = *__error();
                if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
                  sub_188294E14();
                }
              }

              else
              {
                uint64_t v34 = (uint64_t)v32;
                if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
                  sub_188294E7C(v34, v33, v35, v36, v37, v38, v39, v40);
                }
              }
            }

            gzclose(v31);
            free(v27);
            uint64_t v17 = *(unsigned int *)buf;
            goto LABEL_49;
          }

          uint64_t v17 = *__error();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            sub_188294DAC();
          }
          close(v29);
        }

        free(v27);
      }

      else
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          sub_188294D44();
        }
        free(v27);
        uint64_t v17 = 7LL;
      }
    }

    else
    {
      uint64_t v17 = 12LL;
    }

LABEL_49:
    close(a2);
    goto LABEL_50;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    sub_188294CD4();
  }
  uint64_t v17 = 22LL;
LABEL_50:

  return v17;
}

void sub_188292214( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t sub_188292234(uint64_t a1)
{
  BOOL v2 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
  if (v2) {
    sub_188294CA0(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_188292274(uint64_t a1)
{
  return 1LL;
}

void sub_188292294(const char *a1, const char *a2, uint64_t a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v7 = a4;
  size_t v24 = 15LL;
  uint64_t v25 = "microstackshots";
  id v8 = objc_alloc_init(MEMORY[0x189603FC8]);
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = sub_188292690;
  v20[3] = &unk_18A2168F8;
  uint64_t v22 = a1;
  uint64_t v23 = a3;
  id v9 = v8;
  id v21 = v9;
  _systemstats_enumerate_files(a1, a2, 0LL, &v25, &v24, 1LL, v20);
  uint64_t v10 = (void *)MEMORY[0x1895C0AA0]();
  [v9 keysSortedByValueUsingSelector:sel_compare_];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        v7[2](v7, *(void *)(*((void *)&v16 + 1) + 8 * v15++));
      }

      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }

    while (v13);
  }

  objc_autoreleasePoolPop(v10);
}

void sub_188292444(uint64_t a1, void *a2)
{
}

void sub_188292454(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  gzFile v6 = gzopen((const char *)[v5 UTF8String], "rb");
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = (void *)MEMORY[0x1895C0AA0]();
    id v9 = (char *)malloc(0x40000uLL);
    if (!v9) {
      sub_188294408();
    }
    uint64_t v10 = v9;
    uint64_t v11 = 0LL;
    unsigned int v12 = 0;
    unsigned int v13 = 0x40000;
    uint64_t v14 = (os_log_s *)MEMORY[0x1895F8DA0];
    while (1)
    {
      if (v12 == v13)
      {
        if (v11 != v10) {
          sub_188294408();
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          sub_188294FBC(&buf, v31);
        }
        if (v12 > 0x100000)
        {
          BOOL v21 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
          if (v21) {
            sub_188294EF4(v21, v22, v23, v24, v25, v26, v27, v28);
          }
LABEL_25:
          uint64_t v10 = v11;
          goto LABEL_26;
        }

        if (!v12) {
          goto LABEL_25;
        }
        unsigned int v13 = 2 * v12;
        uint64_t v15 = (char *)reallocf(v11, 2 * v12);
        if (!v15) {
          sub_188294408();
        }
        uint64_t v10 = v15;
      }

      else if (v12)
      {
        memmove(v10, v11, v12);
      }

      int v16 = gzread(v7, &v10[v12], v13 - v12);
      if (v16 < 0) {
        break;
      }
      if (v16 != v13 - v12)
      {
        systemstats_foreach_micro((unint64_t)v10, v16 + v12, 0, v4);
        goto LABEL_26;
      }

      unint64_t v17 = systemstats_foreach_micro((unint64_t)v10, v13, 1, v4);
      if (!v17) {
        goto LABEL_26;
      }
      uint64_t v11 = (char *)v17;
      unsigned int v12 = (_DWORD)v10 + v13 - v17;
    }

    systemstats_foreach_micro((unint64_t)v10, v12, 0, v4);
    int errnum = 0;
    __int128 v18 = (void *)gzerror(v7, &errnum);
    if (errnum == -1)
    {
      int errnum = *__error();
      __int128 v19 = __error();
      __int128 v18 = strerror(*v19);
    }

    uint64_t v20 = (uint64_t)v18;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      sub_188294F28((uint64_t)v5, &errnum, v20);
    }
LABEL_26:
    free(v10);
    objc_autoreleasePoolPop(v8);
    gzclose(v7);
  }
}

void sub_188292690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + 48);
  gzFile v6 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%s/%s",  *(void *)(a1 + 40),  a2);
  if (v5 >= *(void *)(a1 + 48))
  {
    id v8 = v6;
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x189603F50]) initWithTimeIntervalSince1970:(double)v5];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];

    gzFile v6 = v8;
  }
}

uint64_t sub_188292728(uint64_t a1, void *bytes, uint64_t a3, int a4, size_t length)
{
  if ((!a3 || (int v6 = *(_DWORD *)(a1 + 64)) == 0 || *(_DWORD *)(a3 + 4) == v6)
    && (!a3 || (uint64_t v7 = *(void *)(a1 + 40)) == 0 || *(void *)(a3 + 8) == v7))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if ((!v8 || (v8 & *((_BYTE *)bytes + 24)) != 0) && *((void *)bytes + 1) >= *(void *)(a1 + 56))
    {
      xpc_object_t v9 = xpc_data_create(bytes, length);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }
  }

  return 1LL;
}

void sub_1882927C8(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = (const char *)[v3 UTF8String];
  if (v4)
  {
    uint64_t v5 = v4;
    if (strstr(v4, "XXXXXX") || strstr(v5, "truncated"))
    {
      int v6 = dup(*(_DWORD *)(a1 + 48));
      if (v6 < 0)
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *__error();
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          sub_1882950FC();
        }
      }

      else
      {
        int v7 = v6;
        gzFile v8 = gzdopen(v6, "ab");
        if (v8)
        {
          xpc_object_t v9 = v8;
          *(void *)uint8_t buf = 0LL;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000LL;
          LODWORD(v26) = 0;
          v21[0] = MEMORY[0x1895F87A8];
          v21[1] = 3221225472LL;
          v21[2] = sub_188292CC8;
          v21[3] = &unk_18A216988;
          gzFile v24 = v8;
          id v10 = v3;
          id v22 = v10;
          uint64_t v23 = buf;
          sub_188292454(v10, v21);
          if (*(_DWORD *)(*(void *)&buf[8] + 24LL))
          {
            if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
              sub_1882951E4((uint64_t)&buf[8], (uint64_t)v10);
            }
          }

          else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int v29 = 138412290;
            id v30 = v10;
            _os_log_impl( &dword_18828E000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Read 0 bytes from microstackshots file %@",  v29,  0xCu);
          }

          gzclose(v9);

          _Block_object_dispose(buf, 8);
        }

        else
        {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *__error();
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            sub_188295170();
          }
          close(v7);
        }
      }

      goto LABEL_39;
    }

    id v11 = v3;
    int v12 = open((const char *)[v11 UTF8String], 0);
    if ((v12 & 0x80000000) == 0)
    {
      int v13 = v12;
      LODWORD(v14) = *(_DWORD *)(a1 + 52);
      uint64_t v15 = (os_log_s *)MEMORY[0x1895F8DA0];
      while (1)
      {
        ssize_t v16 = read(v13, *(void **)(a1 + 40), (int)v14);
        ssize_t v17 = v16;
        if (v16 < 0)
        {
          if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
            *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *__error();
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v19 = *__error();
            *(_DWORD *)uint8_t buf = 138412546;
            *(void *)&uint8_t buf[4] = v11;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v19;
            _os_log_error_impl( &dword_18828E000,  v15,  OS_LOG_TYPE_ERROR,  "Failed to read microstackshots file %@: %{errno}d",  buf,  0x12u);
          }

          goto LABEL_34;
        }

        if (!v16)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint8_t buf = 138412290;
            *(void *)&uint8_t buf[4] = v11;
            _os_log_impl( &dword_18828E000,  v15,  OS_LOG_TYPE_INFO,  "Read 0 bytes from microstackshots file %@",  buf,  0xCu);
          }

          goto LABEL_34;
        }

        ssize_t v18 = write(*(_DWORD *)(a1 + 48), *(const void **)(a1 + 40), v16);
        if (v18 == v17)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)uint8_t buf = 134218242;
            *(void *)&uint8_t buf[4] = v17;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v11;
            _os_log_debug_impl( &dword_18828E000,  v15,  OS_LOG_TYPE_DEBUG,  "Copied %ld bytes of microstackshots from file %@",  buf,  0x16u);
          }

          goto LABEL_34;
        }

        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v20 = *__error();
          *(_DWORD *)uint8_t buf = 138413058;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 2048;
          ssize_t v26 = v17;
          __int16 v27 = 1024;
          int v28 = v20;
          _os_log_error_impl( &dword_18828E000,  v15,  OS_LOG_TYPE_ERROR,  "Failed to write microstackshots from file %@, only wrote %ld out of %ld bytes: %{errno}d",  buf,  0x26u);
          if (v18 < 0)
          {
LABEL_33:
            *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *__error();
            goto LABEL_34;
          }
        }

        else if (v18 < 0)
        {
          goto LABEL_33;
        }

        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 28;
LABEL_34:
        uint64_t v14 = *(int *)(a1 + 52);
        if (v17 != v14)
        {
          close(v13);
          goto LABEL_39;
        }
      }
    }

    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = *__error();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        sub_188295070();
      }
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    sub_188294FFC();
  }

LABEL_39:
}

void sub_188292CA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

BOOL sub_188292CC8(uint64_t a1, const void *a2, int a3, int a4, unint64_t len)
{
  if (len >> 31) {
    sub_188295270();
  }
  int v5 = len;
  int v7 = gzwrite(*(gzFile *)(a1 + 48), a2, len);
  int v8 = v7;
  if (v7 == v5)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) += v5;
  }

  else if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      sub_188295384();
    }
  }

  else
  {
    int errnum = 0;
    gzerror(*(gzFile *)(a1 + 48), &errnum);
    if (errnum == -1)
    {
      int errnum = *__error();
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        sub_188295298();
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      sub_188295308();
    }
  }

  return v8 == v5;
}

void sub_188292DE0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_188292DF8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_188292E10( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_188292E20( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_188292E38( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_188292EB4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_188292EC4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_188292ED4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_188292EE4(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

size_t sub_188292EFC(int __fd, void *__buf, size_t __nbyte)
{
  if (__fd == -1) {
    return 0LL;
  }
  size_t v6 = 0LL;
  while (1)
  {
    ssize_t v7 = write(__fd, __buf, __nbyte);
    if (v7 == -1) {
      break;
    }
LABEL_6:
    v6 += v7;
    if (v6 >= __nbyte) {
      return v6;
    }
  }

  if (*__error() == 4)
  {
    ssize_t v7 = 0LL;
    goto LABEL_6;
  }

  if (*__error()) {
    _os_assumes_log();
  }
  return v6;
}

unint64_t _systemstats_retried_write(uint64_t a1, void *a2, size_t __nbyte)
{
  int v4 = *(_DWORD *)(a1 + 88);
  if (v4 == -1 || *(_BYTE *)(a1 + 200)) {
    return 0LL;
  }
  unint64_t v5 = __nbyte;
  if ((*(_BYTE *)(*(void *)(a1 + 8) + 16LL) & 2) == 0)
  {
    sub_188292EFC(v4, a2, __nbyte);
    *(int64x2_t *)(a1 + 112) = vaddq_s64(*(int64x2_t *)(a1 + 112), vdupq_n_s64(v5));
LABEL_11:
    nullsub_1(*(unsigned int *)(a1 + 88));
    return v5;
  }

  gzwrite(*(gzFile *)(a1 + 184), a2, __nbyte);
  uint64_t v6 = MEMORY[0x1895C09BC](*(void *)(a1 + 184));
  if (v6 < 1) {
    goto LABEL_11;
  }
  uint64_t v7 = *(void *)(a1 + 112);
  BOOL v8 = __OFSUB__(v6, v7);
  uint64_t v9 = v6 - v7;
  if (v9 < 0 == v8)
  {
    uint64_t v11 = v9 + *(void *)(a1 + 120);
    *(void *)(a1 + 112) = v6;
    *(void *)(a1 + 120) = v11;
    goto LABEL_11;
  }

  *(_BYTE *)(a1 + 200) = 1;
  id v10 = *(dispatch_queue_s **)(a1 + 104);
  if (v10)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = sub_188293088;
    block[3] = &unk_18A2169D0;
    block[4] = a1;
    dispatch_async(v10, block);
    goto LABEL_11;
  }

  return 0LL;
}

uint64_t sub_188293088(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 200LL) = 0;
  systemstats_gettimeofday(&v5, 0LL);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = now_in_absolute_milliseconds();
  return sub_1882930DC(v2, v3, &v5, 0);
}

uint64_t sub_1882930DC(uint64_t a1, unint64_t a2, void *a3, int a4)
{
  uint64_t result = geteuid();
  if (!*(void *)(a1 + 96))
  {
    *(_DWORD *)(a1 + 8_Block_object_dispose(va, 8) = -1;
    return result;
  }

  int v9 = result;
  uint64_t v10 = a1;
  if (*(_DWORD *)(a1 + 88) == -1)
  {
    uint64_t result = sub_188294290(a1, v9);
    if (!(_DWORD)result) {
      return result;
    }
    if (a4)
    {
      uint64_t v14 = *(void *)(a1 + 112);
      if (!v14)
      {
        uint64_t result = sub_1882932D8((void *)a1, a2, a3);
        if ((result & 1) == 0) {
          return result;
        }
        uint64_t v14 = *(void *)(a1 + 112);
      }

      BOOL v13 = v14 != 0;
    }

    else
    {
      uint64_t result = sub_1882932D8((void *)a1, a2, a3);
      if ((result & 1) == 0) {
        return result;
      }
      BOOL v13 = 0;
    }

    uint64_t v10 = a1;
    uint64_t v11 = a2;
    int v12 = a3;
  }

  else
  {
    uint64_t v11 = a2;
    int v12 = a3;
    BOOL v13 = 0;
  }

  uint64_t result = sub_188294058(v10, v11, v12, v13);
  if ((_DWORD)result) {
    return sub_188294290(a1, v9);
  }
  return result;
}

void _systemstats_queued_write(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(dispatch_queue_s **)(a1 + 104);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = sub_188293230;
  block[3] = &unk_18A2169F0;
  block[4] = a1;
  void block[5] = a2;
  block[6] = a3;
  dispatch_sync(v3, block);
}

unint64_t sub_188293230(unint64_t result)
{
  if (!*(_BYTE *)(*(void *)(result + 32) + 200LL))
  {
    unint64_t v1 = result;
    uint64_t v2 = now_in_absolute_milliseconds();
    systemstats_gettimeofday(&v5, 0LL);
    BOOL v3 = sub_1882932D8(*(void **)(v1 + 32), v2, &v5);
    uint64_t v4 = *(void *)(v1 + 32);
    if (v3)
    {
      sub_1882930DC(v4, v2, &v5, 0);
      uint64_t v4 = *(void *)(v1 + 32);
      if ((*(_BYTE *)(*(void *)(v4 + 8) + 16LL) & 1) != 0)
      {
        sub_188293368(v4, 0, 0LL, 0LL, 0LL);
        uint64_t v4 = *(void *)(v1 + 32);
      }
    }

    uint64_t result = _systemstats_retried_write(v4, *(void **)(v1 + 40), *(void *)(v1 + 48));
    *(void *)(*(void *)(v1 + 32) + 176LL) = v2;
  }

  return result;
}

BOOL sub_1882932D8(void *a1, unint64_t a2, void *a3)
{
  unint64_t v3 = a1[22];
  if (a2 < v3) {
    sub_188295420();
  }
  uint64_t v4 = a1[1];
  if ((*(_BYTE *)(v4 + 16) & 4) != 0) {
    return 0LL;
  }
  if (v3 && a2 - v3 < *(void *)(v4 + 24))
  {
    unint64_t v5 = a1[14];
  }

  else
  {
    unint64_t v5 = a1[14];
    if (v5 >= a1[16]) {
      return 1LL;
    }
  }

  if (v5 < *(void *)(v4 + 32)) {
    return *a3 - a1[17] > 86400LL;
  }
  return 1LL;
}

void sub_188293368(uint64_t a1, unsigned int a2, void *a3, char *a4, uint64_t a5)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (!*(_BYTE *)(a1 + 200))
  {
    uint64_t v10 = *(dispatch_queue_s **)(a1 + 104);
    if (v10) {
      dispatch_assert_queue_V2(v10);
    }
    sub_18828FAA8((uint64_t)__nbyte, 12);
    sub_18828FDB4((void *)1, __nbyte, "systemstats_v1");
    uint64_t v11 = now_in_absolute_milliseconds();
    sub_18828FB00(2LL, __nbyte, v11);
    unint64_t v12 = now_in_wall_milliseconds();
    sub_18828FB00(3LL, __nbyte, v12);
    sub_18828FB00(4LL, __nbyte, **(unsigned int **)(a1 + 8));
    sub_18828FB98((void *)5, __nbyte, (void *)(a1 + 24), 0x10uLL);
    if (_systemstats_get_system_version(__s, 0x20uLL)) {
      sub_18828FDB4((void *)6, __nbyte, __s);
    }
    if (a3) {
      sub_18828FB98((void *)7, __nbyte, a3, 0x10uLL);
    }
    sub_18828FB00(8LL, __nbyte, a2);
    if (a4) {
      sub_18828FDB4((void *)9, __nbyte, a4);
    }
    if (a5)
    {
      sub_18828FDB4((void *)0xA, __nbyte, (char *)a5);
      unint64_t v13 = *(unsigned int *)(a5 + 528);
      if ((_DWORD)v13) {
        sub_18828FB00(11LL, __nbyte, v13);
      }
      unint64_t v14 = *(void *)(a5 + 512);
      if (v14) {
        sub_18828FB00(12LL, __nbyte, v14);
      }
      sub_18828FB00(13LL, __nbyte, *(unsigned int *)(a5 + 536));
      if ((*(_BYTE *)(a5 + 536) & 1) != 0)
      {
        sub_18828FDB4((void *)0xE, __nbyte, (char *)(a5 + 128));
        sub_18828FDB4((void *)0xF, __nbyte, (char *)(a5 + 256));
      }

      sub_18828FDB4((void *)0x10, __nbyte, (char *)(a5 + 384));
      sub_18828FB00(17LL, __nbyte, *(void *)(a5 + 520));
    }

    uint64_t v15 = (void *)sub_18828FE00((uint64_t)__nbyte);
    *(void *)(a1 + 112) += _systemstats_retried_write(a1, v15, __nbyte[0]);
    sub_18828FAC4(__nbyte);
  }

void _systemstats_write_logstarts_queued(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((*(_BYTE *)(*(void *)(a1 + 8) + 16LL) & 1) != 0)
  {
    unint64_t v5 = *(dispatch_queue_s **)(a1 + 104);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = sub_1882935E4;
    block[3] = &unk_18A216A10;
    char v7 = a2;
    block[4] = a1;
    void block[5] = a3;
    block[6] = a4;
    void block[7] = a5;
    dispatch_sync(v5, block);
  }

void sub_1882935E4(uint64_t a1)
{
}

uint64_t _systemstats_stream_init(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)a1) {
    sub_18829544C();
  }
  if (a3) {
    char v7 = a3;
  }
  else {
    char v7 = "/private/var/db/systemstats";
  }
  uint64_t result = sub_188290D20();
  if ((_DWORD)result)
  {
    *(void *)(a1 + 16) = a4;
    uint64_t result = (uint64_t)_systemstats_writers();
    if (a2 - 5 < 0x17 || !a2 || a2 == 3)
    {
      *(void *)(a1 + _Block_object_dispose(va, 8) = result + 48LL * a2;
      if (result)
      {
        *(void *)(a1 + 80) = v7;
        uint64_t result = _systemstats_read_uuid_from_cookie_path( v7,  "current_boot_uuid",  (unsigned __int8 *)(a1 + 24),  (_BYTE *)(a1 + 40));
        if ((_DWORD)result)
        {
          *(_DWORD *)(a1 + 8_Block_object_dispose(va, 8) = -1;
          *(void *)(a1 + 184) = 0LL;
          *(void *)(a1 + 120) = 0LL;
          systemstats_gettimeofday((timeval *)(a1 + 152), 0LL);
          *(void *)(a1 + 16_Block_object_dispose(va, 8) = now_in_absolute_milliseconds();
          int v9 = ".gz";
          uint64_t v10 = 0x40000LL;
          switch(*(void *)(*(void *)(a1 + 8) + 16LL))
          {
            case 0LL:
              sub_188294408();
            case 1LL:
              int v9 = ".stats";
              goto LABEL_16;
            case 2LL:
              goto LABEL_17;
            case 3LL:
              int v9 = ".stats.gz";
              goto LABEL_16;
            case 4LL:
              int v9 = ".oneshot";
LABEL_16:
              uint64_t v10 = 0x20000LL;
LABEL_17:
              *(void *)(a1 + 192) = v9;
              *(void *)(a1 + 12_Block_object_dispose(va, 8) = v10;
              uint64_t v18 = 0LL;
              uuid_unparse((const unsigned __int8 *)(a1 + 24), out);
              uint64_t v11 = (const char **)_systemstats_writers();
              asprintf(&v18, "%s/%s.%s.XXXXXX%s", v7, out, v11[6 * a2 + 1], v9);
              *(void *)(a1 + 96) = v18;
              uint64_t v12 = *(void *)(a1 + 8);
              if (!*(_BYTE *)(v12 + 42))
              {
                systemstats_delete_old_files( *(const char **)(a1 + 80),  0LL,  *(char **)(v12 + 8),  *(void *)(v12 + 32),  (void *)(a1 + 152));
                uint64_t v12 = *(void *)(a1 + 8);
              }

              sub_1882930DC(a1, *(void *)(a1 + 168), (void *)(a1 + 152), (*(void *)(v12 + 16) >> 1) & 1);
              if ((*(_DWORD *)(a1 + 88) & 0x80000000) != 0)
              {
                free(*(void **)(a1 + 96));
                uint64_t result = 0LL;
              }

              else
              {
                if ((a2 & 0xFFFFFFEF) == 5)
                {
                  *(void *)(a1 + 104) = 0LL;
                }

                else
                {
                  uint64_t v13 = *(void *)(a1 + 8);
                  if (*(_BYTE *)(v13 + 44))
                  {
                    if (qword_18C703D48 != -1) {
                      dispatch_once(&qword_18C703D48, &unk_18A216A50);
                    }
                    unint64_t v14 = (dispatch_object_s *)qword_18C703D40;
                    *(void *)(a1 + 104) = qword_18C703D40;
                    dispatch_retain(v14);
                  }

                  else
                  {
                    *(void *)uuid_string_t out = 0LL;
                    asprintf((char **)out, "com.apple.systemstats.filestream.%s", *(const char **)(v13 + 8));
                    uint64_t v15 = *(const char **)out;
                    ssize_t v16 = dispatch_queue_attr_make_with_autorelease_frequency( 0LL,  DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                    ssize_t v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_BACKGROUND, 0);
                    *(void *)(a1 + 104) = dispatch_queue_create(v15, v17);
                    free(*(void **)out);
                  }
                }

                uint64_t result = 1LL;
                *(_BYTE *)a1 = 1;
              }

              break;
            default:
              sub_188295438();
          }
        }
      }
    }

    else
    {
      uint64_t result = 0LL;
      *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
    }
  }

  return result;
}

dispatch_queue_t sub_1882938E4()
{
  uint64_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unint64_t v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t result = dispatch_queue_create("com.apple.systemstats.filestream", v1);
  qword_18C703D40 = (uint64_t)result;
  return result;
}

uint64_t _systemstats_stream_teardown(uint64_t a1)
{
  if (!a1) {
    sub_188294408();
  }
  free(*(void **)(a1 + 96));
  uint64_t v2 = *(dispatch_object_s **)(a1 + 104);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(a1 + 104) = 0LL;
  }

  if ((*(_BYTE *)(*(void *)(a1 + 8) + 16LL) & 2) != 0)
  {
    uint64_t result = gzclose_w(*(gzFile *)(a1 + 184));
    if ((_DWORD)result) {
      uint64_t result = _os_assumes_log();
    }
    *(void *)(a1 + 184) = 0LL;
  }

  else
  {
    uint64_t result = close(*(_DWORD *)(a1 + 88));
    if ((_DWORD)result == -1) {
      uint64_t result = sub_188295464();
    }
  }

  *(_DWORD *)(a1 + 8_Block_object_dispose(va, 8) = -1;
  *(void *)(a1 + 120) = 0LL;
  *(_BYTE *)a1 = 0;
  return result;
}

void *_systemstats_stream_create(unsigned int a1, const char *a2, uint64_t a3)
{
  uint64_t v6 = calloc(1uLL, 0xD0uLL);
  char v7 = v6;
  if (v6)
  {
    if (_systemstats_stream_init((uint64_t)v6, a1, a2, a3))
    {
      _systemstats_write_logstarts_queued((uint64_t)v7, 1, 0LL, 0LL, 0LL);
    }

    else
    {
      free(v7);
      return 0LL;
    }
  }

  return v7;
}

void systemstats_stream_delete(void *a1)
{
}

void systemstats_write_microstackshot(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(dispatch_queue_s **)(a1 + 104);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = sub_188293230;
  block[3] = &unk_18A2169F0;
  block[4] = a1;
  void block[5] = a2;
  block[6] = a3;
  dispatch_sync(v3, block);
}

void systemstats_stream_flush(uint64_t a1)
{
  if (*(_BYTE *)a1)
  {
    if ((*(_BYTE *)(*(void *)(a1 + 8) + 16LL) & 2) != 0)
    {
      unint64_t v1 = *(dispatch_queue_s **)(a1 + 104);
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = sub_188293B20;
      block[3] = &unk_18A216A70;
      block[4] = a1;
      dispatch_sync(v1, block);
    }
  }

uint64_t sub_188293B20(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(_BYTE *)(v1 + 200)) {
    return gzflush(*(gzFile *)(v1 + 184), 2);
  }
  return result;
}

uint64_t systemstats_stream_get_attr(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t _systemstats_save_current_boot_uuid(const char *a1, unsigned __int8 *a2, char *a3)
{
  uid_t v6 = geteuid();
  int v7 = sub_188293BD4(a1, 1537, v6);
  if (v7 == -1) {
    return sub_188295464();
  }
  int v8 = v7;
  sub_188290900(a2);
  uuid_unparse(a2, a3);
  a3[36] = 10;
  sub_188292EFC(v8, a3, 0x25uLL);
  return close(v8);
}

uint64_t sub_188293BD4(const char *a1, int a2, int a3)
{
  __int16 v4 = a2;
  if ((a2 & 0x200) != 0) {
    int v6 = -3585;
  }
  else {
    int v6 = -1025;
  }
  int v7 = v6 & a2;
  if ((lstat(a1, &v15) & 0x80000000) == 0)
  {
    if ((v15.st_mode & 0xF000) == 0x8000 && v15.st_nlink == 1 && (v15.st_mode & 0xFFF) == 0x1A4 && v15.st_uid == a3)
    {
      uint64_t v10 = open(a1, v7, 0LL);
      if ((v10 & 0x80000000) == 0)
      {
        uint64_t v11 = v10;
        if (!fstat(v10, &v16)
          && v16.st_nlink == v15.st_nlink
          && v16.st_uid == v15.st_uid
          && v16.st_mode == v15.st_mode
          && v16.st_ino == v15.st_ino
          && v16.st_dev == v15.st_dev)
        {
          if ((v4 & 0x400) != 0)
          {
            ftruncate(v11, 0LL);
LABEL_28:
            nullsub_1(v11);
            return v11;
          }

          return v11;
        }

        close(v11);
      }
    }

    return 0xFFFFFFFFLL;
  }

  uint64_t v12 = __error();
  uint64_t v11 = 0xFFFFFFFFLL;
  if ((v4 & 0x200) != 0 && *v12 == 2)
  {
    uint64_t v13 = open(a1, v7 | 0xA00, 420LL);
    if ((v13 & 0x80000000) == 0)
    {
      uint64_t v11 = v13;
      ((void (*)(void))nullsub_1)();
      goto LABEL_28;
    }
  }

  return v11;
}

uint64_t _systemstats_boot(const char *a1, int a2)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  memset(&v26[9], 0, 64);
  if (a1) {
    unint64_t v3 = a1;
  }
  else {
    unint64_t v3 = "/private/var/db/systemstats";
  }
  memset(v26, 0, 144);
  if (stat(v3, &v21) == -1 && mkpath_np(v3, 0x1EDu) == -1) {
    sub_18829547C();
  }
  if (sub_188290D20())
  {
    __int16 v4 = _systemstats_copy_cookie_path(v3, "current_boot_uuid");
    unint64_t v5 = _systemstats_copy_cookie_path(v3, "last_boot_uuid");
    int v6 = _systemstats_copy_cookie_path(v3, "current_build");
    int v7 = _systemstats_copy_cookie_path(v3, "last_build");
    if (rename(v4, v5) == -1 && *__error() != 2) {
      sub_188295464();
    }
    _systemstats_save_current_boot_uuid(v4, (unsigned __int8 *)&v26[1] + 8, (char *)&v26[2] + 8);
    int v8 = rename(v6, v7);
    if (v8 == -1 && *__error() != 2) {
      sub_188295464();
    }
    if (_systemstats_get_system_version(__s, 0x20uLL))
    {
      uid_t v9 = geteuid();
      int v10 = sub_188293BD4(v6, 1537, v9);
      if (v10 == -1)
      {
        sub_188295464();
        if (a2)
        {
LABEL_17:
          if ((_systemstats_read_uuid(v5, v24, v23) & 1) == 0)
          {
            uint64_t v13 = __error();
            if (v8 == -1 && *v13 != 2) {
              sub_188295464();
            }
          }

          uint64_t v14 = sub_188290A18(v7, v22, 0x1FuLL);
          uint64_t v15 = v14;
          if (v14 < 1)
          {
            if (v14 == -1 && *__error() != 2) {
              sub_188295464();
            }
          }

          else
          {
            v22[v14] = 0;
            stat v16 = strchr(v22, 10);
            if (v16) {
              *stat v16 = 0;
            }
          }

          uint64_t v17 = _systemstats_stream_init((uint64_t)v26, 5u, v3, 20180126LL);
          if ((_DWORD)v17)
          {
            if (v8) {
              uint64_t v18 = 0LL;
            }
            else {
              uint64_t v18 = v24;
            }
            if (v15 <= 0) {
              int v19 = 0LL;
            }
            else {
              int v19 = v22;
            }
            sub_188293368((uint64_t)v26, 1u, v18, v19, 0LL);
            _systemstats_stream_teardown((uint64_t)v26);
          }

          goto LABEL_38;
        }

LABEL_37:
        uint64_t v17 = 1LL;
LABEL_38:
        free(v4);
        free(v5);
        free(v6);
        free(v7);
        return v17;
      }

      int v11 = v10;
      size_t v12 = strlen(__s);
      sub_188292EFC(v11, __s, v12);
      sub_188292EFC(v11, "\n", 1uLL);
      close(v11);
    }

    if (a2) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }

  return 0LL;
}

uint64_t sub_188294058(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  int v5 = *(_DWORD *)(a1 + 88);
  if (v5 == -1) {
    sub_188294408();
  }
  if ((*(_BYTE *)(*(void *)(a1 + 8) + 16LL) & 2) != 0)
  {
    if (!gzclose_w(*(gzFile *)(a1 + 184))) {
      goto LABEL_6;
    }
  }

  else
  {
    if (close(v5) != -1) {
      goto LABEL_6;
    }
    __error();
  }

  _os_assumes_log();
LABEL_6:
  *(_DWORD *)(a1 + 8_Block_object_dispose(va, 8) = -1;
  *(void *)(a1 + 184) = 0LL;
  if ((*(_BYTE *)(*(void *)(a1 + 8) + 16LL) & 4) != 0) {
    return 0LL;
  }
  uid_t v9 = strdup(*(const char **)(a1 + 96));
  int v10 = strlen(*(const char **)(a1 + 192));
  if (a4)
  {
    int v11 = strstr(v9, "XXXXXX");
    size_t v12 = strrchr(v9, 46);
    uint64_t v20 = 0LL;
    if (v11 && v12 && v11 < v12)
    {
      *size_t v12 = 0;
      asprintf(&v20, "%s.truncated.%s");
    }

    else
    {
      asprintf(&v20, "%s.truncated");
    }

    uint64_t v13 = v20;
    if (v20)
    {
      free(v9);
      v10 += 10;
      uid_t v9 = v13;
    }
  }

  int v14 = mkstemps(v9, v10);
  if (v14 < 0)
  {
    if (*__error()) {
      _os_assumes_log();
    }
    free(v9);
    return 0LL;
  }

  if (close(v14) == -1) {
    sub_188295464();
  }
  int v15 = rename(*(const char **)(a1 + 96), v9);
  free(v9);
  if (!v15)
  {
    if ((uint64_t)(*a3 - *(void *)(a1 + 152)) < 86401 || (unint64_t)(a2 - *(void *)(a1 + 168)) < 0x36EE81)
    {
      uint64_t v17 = *(void *)(a1 + 8);
      unint64_t v18 = *(void *)(v17 + 32);
      if (*(void *)(a1 + 120) < v18) {
        return 1LL;
      }
    }

    else
    {
      uint64_t v17 = *(void *)(a1 + 8);
      unint64_t v18 = *(void *)(v17 + 32);
    }

    if (*(_BYTE *)(v17 + 42)) {
      int v19 = (const char *)(a1 + 40);
    }
    else {
      int v19 = 0LL;
    }
    systemstats_delete_old_files(*(const char **)(a1 + 80), v19, *(char **)(v17 + 8), v18, a3);
    *(_OWORD *)(a1 + 152) = *(_OWORD *)a3;
    *(void *)(a1 + 120) = 0LL;
    *(void *)(a1 + 16_Block_object_dispose(va, 8) = a2;
    return 1LL;
  }

  uint64_t result = *__error();
  if (!(_DWORD)result) {
    return result;
  }
  _os_assumes_log();
  return 0LL;
}

uint64_t sub_188294290(uint64_t a1, int a2)
{
  *(void *)(a1 + 112) = 0LL;
  if ((*(void *)(*(void *)(a1 + 8) + 16LL) & 4LL) != 0) {
    int v4 = 1537;
  }
  else {
    int v4 = 521;
  }
  int v5 = sub_188293BD4(*(const char **)(a1 + 96), v4, a2);
  *(_DWORD *)(a1 + 8_Block_object_dispose(va, 8) = v5;
  if (v5 != -1)
  {
    memset(&v10, 0, sizeof(v10));
    if (_systemstats_get_file_stats(v5, &v10) || v10.st_size < 0)
    {
      if (close(*(_DWORD *)(a1 + 88)) != -1)
      {
LABEL_21:
        uint64_t result = 0LL;
        *(_DWORD *)(a1 + 8_Block_object_dispose(va, 8) = -1;
        return result;
      }
    }

    else
    {
      int tv_nsec = v10.st_birthtimespec.tv_nsec;
      *(void *)(a1 + 136) = v10.st_birthtimespec.tv_sec;
      *(_DWORD *)(a1 + 144) = tv_nsec / 1000;
      *(void *)(a1 + 176) = 0LL;
      if (fcntl(*(_DWORD *)(a1 + 88), 2, 1LL) == -1) {
        sub_188295464();
      }
      if ((*(_BYTE *)(*(void *)(a1 + 8) + 16LL) & 2) == 0)
      {
        *(void *)(a1 + 112) = v10.st_size;
        return 1LL;
      }

      gzFile v8 = gzdopen(*(_DWORD *)(a1 + 88), "ab");
      *(void *)(a1 + 184) = v8;
      if (v8)
      {
        uint64_t v9 = MEMORY[0x1895C09BC]();
        if ((v9 & 0x8000000000000000LL) == 0)
        {
          *(void *)(a1 + 112) = v9;
          return 1LL;
        }
      }

      if (close(*(_DWORD *)(a1 + 88)) != -1) {
        goto LABEL_21;
      }
    }

    sub_188295464();
    goto LABEL_21;
  }

  uint64_t result = *__error();
  if ((_DWORD)result)
  {
    _os_assumes_log();
    return 0LL;
  }

  return result;
}

uint64_t sub_188294400()
{
  return _os_assumes_log();
}

void sub_188294408()
{
}

uint64_t sub_18829441C()
{
  return _os_assumes_log();
}

void sub_188294438(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_debug_impl( &dword_18828E000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Could not find the file for current build at path: %s",  (uint8_t *)&v1,  0xCu);
}

void sub_1882944B4(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = *__error();
  v3[0] = 67109378;
  v3[1] = v2;
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_debug_impl( &dword_18828E000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Error reading current build from file with errno %d at path: %s",  (uint8_t *)v3,  0x12u);
}

void sub_188294550( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1882945C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1882945F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188294668( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1882946D4()
{
}

void sub_188294748( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1882947B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188294824( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188294890( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188294910()
{
}

void sub_188294978()
{
}

void sub_1882949E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188294A50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188294ABC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188294B28()
{
}

void sub_188294B9C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188294BD0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188294C04()
{
}

void sub_188294C6C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188294CA0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188294CD4()
{
}

void sub_188294D10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188294D44()
{
}

void sub_188294DAC()
{
}

void sub_188294E14()
{
}

void sub_188294E7C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188294EF4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188294F28(uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v3 = *a2;
  int v4 = 138412802;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 2080;
  uint64_t v9 = a3;
  _os_log_debug_impl( &dword_18828E000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Read failed for microstackshots for file %@: %d %s",  (uint8_t *)&v4,  0x1Cu);
  sub_188292E30();
}

void sub_188294FBC(uint8_t *buf, _BYTE *a2)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl( &dword_18828E000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Unexpected: a single microstackshot was larger than TELEMETRY_DATA_HIGHWATER_SIZE",  buf,  2u);
}

void sub_188294FFC()
{
}

void sub_188295070()
{
}

void sub_1882950FC()
{
}

void sub_188295170()
{
}

void sub_1882951E4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = *(_DWORD *)(*(void *)a1 + 24LL);
  v3[0] = 67109378;
  v3[1] = v2;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl( &dword_18828E000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Copied %d (uncompressed) bytes of microstackshots from file %@",  (uint8_t *)v3,  0x12u);
  sub_188292E08();
}

void sub_188295270()
{
  __assert_rtn("microstackshots_copy_files_block_invoke", "micro.m", 381, "len <= INT_MAX");
}

void sub_188295298()
{
}

void sub_188295308()
{
}

void sub_188295384()
{
}

void sub_188295420()
{
}

void sub_188295438()
{
}

void sub_18829544C()
{
}

uint64_t sub_188295464()
{
  return sub_188294400();
}

void sub_18829547C()
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x189602A38](type_id);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __microstackshot()
{
  return MEMORY[0x1895F8948]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895F8D68]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1895F8D70]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x1895FAAD8](dirp);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x1895FAFA8](*(void *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int flsll(uint64_t a1)
{
  return MEMORY[0x1895FB310](a1);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1895FB458](*(void *)&a1, a2, a3, *(void *)&a4);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

int gzclose(gzFile file)
{
  return MEMORY[0x1896175B8](file);
}

int gzclose_w(gzFile file)
{
  return MEMORY[0x1896175C0](file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return (gzFile)MEMORY[0x1896175D0](*(void *)&fd, mode);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return (const char *)MEMORY[0x1896175D8](file, errnum);
}

int gzflush(gzFile file, int flush)
{
  return MEMORY[0x1896175E0](file, *(void *)&flush);
}

uint64_t gzoffset(gzFile a1)
{
  return MEMORY[0x1896175E8](a1);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return (gzFile)MEMORY[0x1896175F0](a1, a2);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x1896175F8](file, buf, *(void *)&len);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x189617600](file, buf, *(void *)&len);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FBAB0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1895FBF28](path, omode);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x1895FBF48](a1, *(void *)&a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1895FC1B0](name);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FC6C8]();
}

int rand(void)
{
  return MEMORY[0x1895FCBE8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

void sranddev(void)
{
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FD2B0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

void uuid_generate_random(uuid_t out)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FD4E8](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1895FDB00](bytes, length);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDBE8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC50](xdict, key);
}