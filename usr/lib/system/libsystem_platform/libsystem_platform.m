uint64_t __libplatform_init(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  __pfz_setup(a3);
  _simple_asl_init(a2, a4);
  return __libkernel_platform_init();
}

uint64_t os_log_simple_type_from_asl(int a1)
{
  unsigned int v1 = a1 & ~(a1 >> 31);
  if (v1 >= 7) {
    unsigned int v1 = 7;
  }
  return os_log_simple_type_from_asl__level2ostype[v1];
}

uint64_t __os_log_simple_offset( uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, uint64_t a8)
{
  uint64_t v23 = 0LL;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v18 = 0u;
  v17[0] = a6;
  v17[1] = a7;
  v17[2] = a8;
  v17[3] = mach_continuous_time();
  pid_t v13 = getpid();
  *(void *)&__int128 v18 = v13;
  if (proc_pidinfo(v13, 17, 0LL, buffer, 56) == 56)
  {
    *((void *)&v18 + 1) = buffer[2];
    *(void *)&__int128 v19 = v25;
    _platform_memmove((uint64_t *)&v21 + 1, buffer, 0x10uLL);
  }

  *((void *)&v19 + 1) = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  if (a1)
  {
    else {
      uint64_t v14 = a4;
    }
    *(void *)&__int128 v20 = a5 - v14;
    v15 = a2;
  }

  else
  {
    v15 = (uint64_t *)&v21 + 1;
  }

  _platform_memmove((uint64_t *)&v20 + 1, v15, 0x10uLL);
  _platform_memmove((uint64_t *)&v22 + 1, a3, 0x10uLL);
  return _os_log_simple_send(v17);
}

uint64_t _os_log_simple_send(uint64_t *a1)
{
  if ((_simple_asl_get_fd() & 0x80000000) != 0) {
    return 9LL;
  }
  if ((MEMORY[0xFFFFFC105] & 4) != 0) {
    return 0LL;
  }
  unint64_t v2 = _platform_strlen(a1[2]) + 1;
  uint64_t v3 = a1[1];
  if (v3) {
    unint64_t v4 = _platform_strlen(v3) + 1;
  }
  else {
    unint64_t v4 = 0LL;
  }
  unint64_t v6 = v4 + v2 + 104;
  BOOL v7 = __CFADD__(v4, v2 + 104);
  uint64_t result = 84LL;
  if (v2 < 0xFFFFFFFFFFFFFF98LL && !v7)
  {
    if (v6 <= 0x800)
    {
      _platform_memmove(&v9, a1 + 9, 0x10uLL);
      _platform_memmove(&v10, a1 + 11, 0x10uLL);
      _platform_memmove(&v11, a1 + 13, 0x10uLL);
      _platform_strlcpy(v12, (uint64_t *)a1[2], v2);
      if (v4) {
        _platform_strlcpy((uint64_t *)((char *)v12 + v2), (uint64_t *)a1[1], v4);
      }
      unint64_t v8 = __sendto();
      if ((v8 & 0x8000000000000000LL) != 0)
      {
        return *__error();
      }

      else if (v8 >= v6)
      {
        return 0LL;
      }

      else
      {
        return 40LL;
      }
    }

    else
    {
      return 7LL;
    }
  }

  return result;
}

mach_vm_address_t *_os_log_simple( uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4, unsigned __int8 a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, int a9)
{
  uint64_t result = (mach_vm_address_t *)_simple_salloc();
  if (result)
  {
    __int128 v18 = result;
    _simple_vesprintf(result, 0LL, a7, &a9);
    uint64_t v19 = _simple_string((_BYTE **)v18);
    __os_log_simple_offset(a1, a2, a3, a4, v9, a5, a6, v19);
    return _simple_sfree(v18);
  }

  return result;
}

uint64_t _os_log_simple_shim(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  return __os_log_simple_offset(0LL, (uint64_t *)&UUID_NULL, (uint64_t *)&UUID_NULL, 0LL, 0LL, a1, a2, a3);
}

uint64_t _os_log_simple_parse_type(_BYTE *a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 4);
  if (v2 > 0x10 || ((1 << v2) & 0x10007) == 0) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *a1 = v2;
  return result;
}

uint64_t _os_log_simple_parse_subsystem(uint64_t a1, unsigned __int16 *a2)
{
  if (!a2[1])
  {
    uint64_t v2 = 0LL;
    goto LABEL_5;
  }

  uint64_t v2 = (uint64_t)a2 + *a2 + 104;
  if (!*(_BYTE *)(v2 + a2[1] - 1))
  {
LABEL_5:
    uint64_t v3 = 0LL;
    *(void *)(a1 + 8) = v2;
    return v3;
  }

  return 22LL;
}

uint64_t _os_log_simple_parse_message(uint64_t a1, _WORD *a2)
{
  uint64_t result = 0LL;
  *(void *)(a1 + 16) = a2 + 52;
  return result;
}

uint64_t _os_log_simple_parse_timestamp(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  *(void *)(a1 + 24) = v2;
  uint64_t v3 = 22LL;
  if (v2)
  {
    if (v2 <= mach_continuous_time()) {
      return 0LL;
    }
    else {
      return 22LL;
    }
  }

  return v3;
}

uint64_t _os_log_simple_parse_identifiers(void *a1, void *a2)
{
  uint64_t v2 = a2[2];
  a1[4] = v2;
  a1[5] = a2[3];
  a1[6] = a2[4];
  a1[7] = a2[5];
  if (v2) {
    return 0LL;
  }
  else {
    return 22LL;
  }
}

uint64_t _os_log_simple_parse(unsigned __int16 *a1, unint64_t a2, uint64_t a3)
{
  if (a2 < 0x68) {
    return 94LL;
  }
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if (v5 + v6 + 104 > a2) {
    return 7LL;
  }
  unsigned int v7 = *((unsigned __int8 *)a1 + 4);
  if (v7 > 0x10 || ((1 << v7) & 0x10007) == 0) {
    return 22LL;
  }
  *(_BYTE *)a3 = v7;
  if ((_DWORD)v6)
  {
    uint64_t v10 = (uint64_t)a1 + v5 + 104;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  *(void *)(a3 + 8) = v10;
  if ((_DWORD)v5)
  {
    if (!*((_BYTE *)a1 + (v5 - 1) + 104))
    {
      uint64_t v11 = *((void *)a1 + 1);
      *(void *)(a3 + 16) = a1 + 52;
      *(void *)(a3 + 24) = v11;
      if (v11)
      {
        if (v11 <= mach_continuous_time())
        {
          uint64_t v12 = *((void *)a1 + 2);
          *(void *)(a3 + 32) = v12;
          *(void *)(a3 + 40) = *((void *)a1 + 3);
          *(void *)(a3 + 48) = *((void *)a1 + 4);
          *(void *)(a3 + 56) = *((void *)a1 + 5);
          if (v12)
          {
            *(void *)(a3 + 64) = *((void *)a1 + 6);
            _platform_memmove((uint64_t *)(a3 + 72), (uint64_t *)a1 + 7, 0x10uLL);
            _platform_memmove((uint64_t *)(a3 + 88), (uint64_t *)a1 + 9, 0x10uLL);
            _platform_memmove((uint64_t *)(a3 + 104), (uint64_t *)a1 + 11, 0x10uLL);
            return 0LL;
          }
        }
      }
    }
  }

  return 22LL;
}

uint64_t _simple_getenv(uint64_t *a1, uint64_t a2)
{
  unint64_t v4 = _platform_strlen(a2);
  if (!a1) {
    return 0LL;
  }
  unint64_t v5 = v4;
  uint64_t result = *a1;
  if (!*a1) {
    return result;
  }
  while (1)
  {
    if (_platform_strlen(result) >= v5)
    {
      uint64_t v7 = *a1;
      if (v5)
      {
        unint64_t v8 = v5;
        uint64_t v9 = (unsigned __int8 *)*a1;
        uint64_t v10 = (unsigned __int8 *)a2;
        while (*v9 == *v10)
        {
          ++v10;
          ++v9;
          if (!--v8) {
            goto LABEL_8;
          }
        }

        goto LABEL_9;
      }

LABEL_8:
      if (*(_BYTE *)(v7 + v5) == 61) {
        return v5 + v7 + 1;
      }
    }

LABEL_9:
    uint64_t v11 = a1[1];
    ++a1;
    uint64_t result = v11;
    if (!v11) {
      return result;
    }
  }
}

int8x16_t *_simple_asl_init(uint64_t *a1, uint64_t a2)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 336LL) == -1LL) {
    unint64_t v4 = *(void *)(MEMORY[0x1895FF8E0] + 344LL);
  }
  else {
    unint64_t v4 = _os_alloc_once((unint64_t *)(MEMORY[0x1895FF8E0] + 336LL), 32LL, (uint64_t)_simple_asl_init_context);
  }
  uint64_t result = (int8x16_t *)_simple_getenv(a1, (uint64_t)"ASL_DISABLE");
  if (!result || (uint64_t result = (int8x16_t *)_platform_strcmp(result, (int8x16_t *)"1"), (_DWORD)result))
  {
    *(_BYTE *)unint64_t v4 = 1;
    if (a2)
    {
      uint64_t v6 = *(void **)(a2 + 32);
      if (v6) {
        *(void *)(v4 + 8) = *v6;
      }
    }
  }

  return result;
}

void _os_log_simple_reinit_4launchd()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 336LL) == -1LL) {
    unint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 344LL);
  }
  else {
    unint64_t v0 = _os_alloc_once((unint64_t *)(MEMORY[0x1895FF8E0] + 336LL), 32LL, (uint64_t)_simple_asl_init_context);
  }
  if (*(_BYTE *)v0)
  {
    int v1 = *(_DWORD *)(v0 + 16);
    if (v1 != -1) {
      _os_log_simple_reinit_4launchd_cold_1(v1);
    }
    *(_DWORD *)(v0 + 16) = _simple_asl_connect();
  }

uint64_t _simple_asl_connect()
{
  uint64_t v0 = socket(1, 2, 0);
  uint64_t v1 = v0;
  if ((_DWORD)v0 != -1)
  {
    fcntl(v0, 2, 1LL);
    v5.sa_family = 1;
    unint64_t v2 = _platform_strlen((uint64_t)"/var/run/syslog");
    if (v2 + 1 < 0x68) {
      unint64_t v3 = v2 + 1;
    }
    else {
      unint64_t v3 = 104LL;
    }
    _platform_memmove((uint64_t *)v5.sa_data, (uint64_t *)"/var/run/syslog", v3);
    if (connect(v1, &v5, 0x6Au) == -1)
    {
      close(v1);
      return 0xFFFFFFFFLL;
    }
  }

  return v1;
}

uint64_t _simple_asl_get_fd()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 336LL) == -1LL) {
    unint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 344LL);
  }
  else {
    unint64_t v0 = _os_alloc_once((unint64_t *)(MEMORY[0x1895FF8E0] + 336LL), 32LL, (uint64_t)_simple_asl_init_context);
  }
  if (!*(_BYTE *)v0) {
    return 0xFFFFFFFFLL;
  }
  if (*(void *)(v0 + 24) != -1LL) {
    _os_once((unint64_t *)(v0 + 24), 0LL, (uint64_t (*)(uint64_t))_simple_asl_connect_once);
  }
  return *(unsigned int *)(v0 + 16);
}

void _simple_asl_connect_once()
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 336LL) == -1LL) {
    unint64_t v0 = *(void *)(MEMORY[0x1895FF8E0] + 344LL);
  }
  else {
    unint64_t v0 = _os_alloc_once((unint64_t *)(MEMORY[0x1895FF8E0] + 336LL), 32LL, (uint64_t)_simple_asl_init_context);
  }
  if (*(_DWORD *)(v0 + 16) == -1) {
    *(_DWORD *)(v0 + 16) = _simple_asl_connect();
  }
}

mach_vm_address_t *_simple_asl_msg_new()
{
  unint64_t v0 = (mach_vm_address_t *)_simple_salloc();
  uint64_t v7 = v0;
  if (v0 && _simple_sprintf(v0, "         0", v1, v2, v3, v4, v5, v6, v9))
  {
    _simple_sfree(v7);
    return 0LL;
  }

  return v7;
}

_BYTE *_simple_asl_msg_set( _BYTE *result, int8x16_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    if (a2)
    {
      uint64_t v10 = result;
      uint64_t result = (_BYTE *)_simple_sprintf(result, " [", a3, a4, a5, a6, a7, a8, v25);
      if (!(_DWORD)result)
      {
        uint64_t result = (_BYTE *)_simple_esprintf( v10,  (uint64_t (*)(uint64_t))_simple_asl_escape_key,  "%s",  v11,  v12,  v13,  v14,  v15,  (int)a2);
        if (!(_DWORD)result)
        {
          if (a3)
          {
            uint64_t result = (_BYTE *)_simple_esprintf( v10,  (uint64_t (*)(uint64_t))_simple_asl_escape_val,  " %s",  v16,  v17,  v18,  v19,  v20,  a3);
            if ((_DWORD)result) {
              return result;
            }
            if (!_platform_strcmp(a2, (int8x16_t *)"Message"))
            {
              uint64_t v21 = _simple_string((_BYTE **)v10);
              unint64_t v22 = _platform_strlen(v21);
              if (!_platform_strcmp((int8x16_t *)(v21 + v22 - 2), (int8x16_t *)"\\n"))
              {
                uint64_t v23 = (int8x16_t *)(v22 + v21 - 4);
                do
                {
                  v23->i8[2] = 0;
                  int v24 = _platform_strcmp(v23, (int8x16_t *)"\\n");
                  uint64_t v23 = (int8x16_t *)((char *)v23 - 2);
                }

                while (!v24);
              }

              _simple_sresize((uint64_t *)v10);
            }
          }

          return (_BYTE *)_simple_sappend((uint64_t)v10, "]");
        }
      }
    }
  }

  return result;
}

const char *_simple_asl_escape_key(int a1)
{
  if (a1 <= 90)
  {
    if (a1 == 10) {
      return "\\n";
    }
    if (a1 == 32) {
      return "\\s";
    }
  }

  else
  {
    switch(a1)
    {
      case ']':
        return "\\]";
      case '\\':
        return "\\\\"";
      case '[':
        return "\\[";
    }
  }

  return 0LL;
}

const char *_simple_asl_escape_val(int a1)
{
  if (a1 > 91)
  {
    if (a1 != 92)
    {
      if (a1 == 93) {
        return "\\]";
      }
      return 0LL;
    }

    return "\\\\"";
  }

  else
  {
    if (a1 != 10)
    {
      if (a1 == 91) {
        return "\\[";
      }
      return 0LL;
    }

    return "\\n";
  }

uint64_t _simple_asl_send(_BYTE *a1)
{
  uint64_t result = _simple_asl_get_fd();
  if ((result & 0x80000000) == 0)
  {
    __gettimeofday();
    uint64_t result = _simple_sprintf(a1, " [PID ", v3, v4, v5, v6, v7, v8, v56);
    if (!(_DWORD)result)
    {
      pid_t v9 = getpid();
      uint64_t result = _simple_esprintf( a1,  (uint64_t (*)(uint64_t))_simple_asl_escape_val,  "%u",  v10,  v11,  v12,  v13,  v14,  v9);
      if (!(_DWORD)result)
      {
        uint64_t result = _simple_sprintf(a1, "] [UID ", v15, v16, v17, v18, v19, v20, v57);
        if (!(_DWORD)result)
        {
          uid_t v21 = getuid();
          uint64_t result = _simple_esprintf( a1,  (uint64_t (*)(uint64_t))_simple_asl_escape_val,  "%u",  v22,  v23,  v24,  v25,  v26,  v21);
          if (!(_DWORD)result)
          {
            uint64_t result = _simple_sprintf(a1, "] [GID ", v27, v28, v29, v30, v31, v32, v58);
            if (!(_DWORD)result)
            {
              gid_t v33 = getgid();
              uint64_t result = _simple_esprintf( a1,  (uint64_t (*)(uint64_t))_simple_asl_escape_val,  "%u",  v34,  v35,  v36,  v37,  v38,  v33);
              if (!(_DWORD)result)
              {
                uint64_t result = _simple_sprintf(a1, "] [Time ", v39, v40, v41, v42, v43, v44, v59);
                if (!(_DWORD)result)
                {
                  uint64_t result = _simple_esprintf( a1,  (uint64_t (*)(uint64_t))_simple_asl_escape_val,  "%lu",  v45,  v46,  v47,  v48,  v49,  v60);
                  if (!(_DWORD)result)
                  {
                    uint64_t result = _simple_sappend((uint64_t)a1, "] [TimeNanoSec ");
                    if (!(_DWORD)result)
                    {
                      uint64_t result = _simple_esprintf( a1,  (uint64_t (*)(uint64_t))_simple_asl_escape_val,  "%d",  v50,  v51,  v52,  v53,  v54,  1000 * v61);
                      if (!(_DWORD)result)
                      {
                        uint64_t result = _simple_sappend((uint64_t)a1, "]\n");
                        if (!(_DWORD)result)
                        {
                          uint64_t v55 = _simple_string((_BYTE **)a1);
                          _platform_strlen(v55);
                          return __sendto();
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

  return result;
}

uint64_t _simple_asl_log_prog(int a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5 = os_log_simple_type_from_asl(a1);
  return _os_log_simple_shim(v5, a2, a3);
}

uint64_t _simple_asl_log(int a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 336LL) != -1LL) {
    _os_alloc_once((unint64_t *)(MEMORY[0x1895FF8E0] + 336LL), 32LL, (uint64_t)_simple_asl_init_context);
  }
  unsigned __int8 v6 = os_log_simple_type_from_asl(a1);
  return _os_log_simple_shim(v6, a2, a3);
}

uint64_t _simple_asl_init_context(uint64_t result)
{
  *(void *)(result + 8) = "unknown";
  *(_DWORD *)(result + 16) = -1;
  return result;
}

ssize_t _simple_vdprintf(int a1, unsigned __int8 *a2, int *a3)
{
  int v6 = a1;
  v5[0] = v4;
  v5[1] = v4;
  v5[2] = v5;
  uint64_t v7 = _flush_reset;
  __simple_bprintf(v5, 0LL, a2, a3);
  return _flush((ssize_t)v5);
}

ssize_t _flush_reset(void *a1)
{
  ssize_t result = _flush((ssize_t)a1);
  a1[1] = *a1;
  return result;
}

_BYTE *__simple_bprintf(_BYTE *result, uint64_t (*a2)(uint64_t), unsigned __int8 *a3, int *a4)
{
  if (!*a3) {
    return result;
  }
  uint64_t v4 = a3;
  uint64_t v6 = (uint64_t)result;
  do
  {
    ssize_t result = _platform_strchr((uint64_t)v4, 0x25u);
    if (!result)
    {
      while (1)
      {
        unsigned __int8 v85 = *v4;
        if (!*v4) {
          break;
        }
        if (a2 && (ssize_t result = (_BYTE *)a2(*v4)) != 0LL)
        {
          char v80 = *result;
          if (*result)
          {
            v81 = result + 1;
            do
            {
              v82 = *(_BYTE **)(v6 + 8);
              if ((unint64_t)v82 >= *(void *)(v6 + 16))
              {
                ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                v82 = *(_BYTE **)(v6 + 8);
              }

              *(void *)(v6 + 8) = v82 + 1;
              _BYTE *v82 = v80;
              int v83 = *v81++;
              char v80 = v83;
            }

            while (v83);
          }
        }

        else
        {
          v84 = *(unsigned __int8 **)(v6 + 8);
          if ((unint64_t)v84 >= *(void *)(v6 + 16))
          {
            ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
            v84 = *(unsigned __int8 **)(v6 + 8);
          }

          *(void *)(v6 + 8) = v84 + 1;
          unsigned __int8 *v84 = v85;
        }

        ++v4;
      }

      return result;
    }

    uint64_t v7 = result;
    uint64_t v8 = result - v4;
    if (result - v4 >= 1)
    {
      do
      {
        unsigned int v10 = *v4++;
        uint64_t v9 = v10;
        if (a2 && (ssize_t result = (_BYTE *)a2(v9)) != 0LL)
        {
          char v11 = *result;
          if (*result)
          {
            uint64_t v12 = result + 1;
            do
            {
              uint64_t v13 = *(_BYTE **)(v6 + 8);
              if ((unint64_t)v13 >= *(void *)(v6 + 16))
              {
                ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                uint64_t v13 = *(_BYTE **)(v6 + 8);
              }

              *(void *)(v6 + 8) = v13 + 1;
              *uint64_t v13 = v11;
              int v14 = *v12++;
              char v11 = v14;
            }

            while (v14);
          }
        }

        else
        {
          uint64_t v15 = *(_BYTE **)(v6 + 8);
          if ((unint64_t)v15 >= *(void *)(v6 + 16))
          {
            ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
            uint64_t v15 = *(_BYTE **)(v6 + 8);
          }

          *(void *)(v6 + 8) = v15 + 1;
          _BYTE *v15 = v9;
        }

        BOOL v16 = v8-- <= 1;
      }

      while (!v16);
    }

    uint64_t v17 = (int8x16_t *)(v7 + 1);
    if (v7[1] == 37)
    {
      if (a2 && (ssize_t result = (_BYTE *)a2(37LL)) != 0LL)
      {
        char v18 = *result;
        if (*result)
        {
          uint64_t v19 = result + 1;
          do
          {
            uint64_t v20 = *(_BYTE **)(v6 + 8);
            if ((unint64_t)v20 >= *(void *)(v6 + 16))
            {
              ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
              uint64_t v20 = *(_BYTE **)(v6 + 8);
            }

            *(void *)(v6 + 8) = v20 + 1;
            *uint64_t v20 = v18;
            int v21 = *v19++;
            char v18 = v21;
          }

          while (v21);
        }
      }

      else
      {
        uint64_t v30 = *(_BYTE **)(v6 + 8);
        if ((unint64_t)v30 >= *(void *)(v6 + 16))
        {
          ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
          uint64_t v30 = *(_BYTE **)(v6 + 8);
        }

        *(void *)(v6 + 8) = v30 + 1;
        *uint64_t v30 = 37;
      }

      uint64_t v4 = v7 + 2;
      continue;
    }

    ssize_t result = (_BYTE *)_platform_strncmp((int8x16_t *)(v7 + 1), (int8x16_t *)".*s", 3uLL);
    if (!(_DWORD)result)
    {
LABEL_44:
      uint64_t v31 = a4;
      int v32 = *a4;
      a4 += 4;
      if (v32 >= 1)
      {
        gid_t v33 = (unsigned __int8 *)*((void *)v31 + 1);
        do
        {
          unsigned int v35 = *v33++;
          uint64_t v34 = v35;
          if (a2 && (ssize_t result = (_BYTE *)a2(v34)) != 0LL)
          {
            char v36 = *result;
            if (*result)
            {
              uint64_t v37 = result + 1;
              do
              {
                uint64_t v38 = *(_BYTE **)(v6 + 8);
                if ((unint64_t)v38 >= *(void *)(v6 + 16))
                {
                  ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                  uint64_t v38 = *(_BYTE **)(v6 + 8);
                }

                *(void *)(v6 + 8) = v38 + 1;
                *uint64_t v38 = v36;
                int v39 = *v37++;
                char v36 = v39;
              }

              while (v39);
            }
          }

          else
          {
            uint64_t v40 = *(_BYTE **)(v6 + 8);
            if ((unint64_t)v40 >= *(void *)(v6 + 16))
            {
              ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
              uint64_t v40 = *(_BYTE **)(v6 + 8);
            }

            *(void *)(v6 + 8) = v40 + 1;
            *uint64_t v40 = v34;
          }

          BOOL v16 = v32-- <= 1;
        }

        while (!v16);
      }

      uint64_t v17 = (int8x16_t *)((char *)v17 + 2);
      goto LABEL_148;
    }

    int v22 = 0;
    int v23 = 0;
    int v24 = 0;
    while (1)
    {
      int v25 = v17->i8[0];
      int v26 = v17->u8[0];
      if (v25 > 98)
      {
        switch(v17->i8[0])
        {
          case 'c':
            if (v24 >= 2)
            {
              if (v23) {
                uint64_t v42 = 48LL;
              }
              else {
                uint64_t v42 = 32LL;
              }
              do
              {
                if (a2 && (ssize_t result = (_BYTE *)a2(v42)) != 0LL)
                {
                  char v43 = *result;
                  if (*result)
                  {
                    uint64_t v44 = result + 1;
                    do
                    {
                      uint64_t v45 = *(_BYTE **)(v6 + 8);
                      if ((unint64_t)v45 >= *(void *)(v6 + 16))
                      {
                        ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                        uint64_t v45 = *(_BYTE **)(v6 + 8);
                      }

                      *(void *)(v6 + 8) = v45 + 1;
                      *uint64_t v45 = v43;
                      int v46 = *v44++;
                      char v43 = v46;
                    }

                    while (v46);
                  }
                }

                else
                {
                  uint64_t v47 = *(_BYTE **)(v6 + 8);
                  if ((unint64_t)v47 >= *(void *)(v6 + 16))
                  {
                    ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                    uint64_t v47 = *(_BYTE **)(v6 + 8);
                  }

                  *(void *)(v6 + 8) = v47 + 1;
                  *uint64_t v47 = v42;
                }

                BOOL v16 = v24-- <= 2;
              }

              while (!v16);
            }

            uint64_t v48 = a4;
            a4 += 2;
            int v49 = *v48;
            if (a2 && (ssize_t result = (_BYTE *)a2(*v48)) != 0LL)
            {
              char v50 = *result;
              if (*result)
              {
                uint64_t v51 = result + 1;
                do
                {
                  uint64_t v52 = *(_BYTE **)(v6 + 8);
                  if ((unint64_t)v52 >= *(void *)(v6 + 16))
                  {
                    ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                    uint64_t v52 = *(_BYTE **)(v6 + 8);
                  }

                  *(void *)(v6 + 8) = v52 + 1;
                  *uint64_t v52 = v50;
                  int v53 = *v51++;
                  char v50 = v53;
                }

                while (v53);
              }
            }

            else
            {
              v78 = *(_BYTE **)(v6 + 8);
              if ((unint64_t)v78 >= *(void *)(v6 + 16))
              {
                ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                v78 = *(_BYTE **)(v6 + 8);
              }

              *(void *)(v6 + 8) = v78 + 1;
              _BYTE *v78 = v49;
            }

            break;
          case 'd':
          case 'i':
            a4 += 2;
            ssize_t result = dec((std::ios_base *)v6);
            break;
          case 'l':
            ++v22;
            uint64_t v17 = (int8x16_t *)((char *)v17 + 1);
            goto LABEL_32;
          case 'o':
            a4 += 2;
            ssize_t result = oct((std::ios_base *)v6);
            break;
          case 'p':
            a4 += 2;
            uint64_t v41 = (std::ios_base *)v6;
            goto LABEL_90;
          case 's':
            uint64_t v54 = (const char **)a4;
            a4 += 2;
            uint64_t v55 = *v54;
            if (v55) {
              int v56 = v55;
            }
            else {
              int v56 = "(null)";
            }
            ssize_t result = (_BYTE *)_platform_strlen((uint64_t)v56);
            int v57 = v24 - (_DWORD)result;
            if (v24 - (int)result >= 1)
            {
              if (v23) {
                uint64_t v58 = 48LL;
              }
              else {
                uint64_t v58 = 32LL;
              }
              do
              {
                if (a2 && (ssize_t result = (_BYTE *)a2(v58)) != 0LL)
                {
                  char v59 = *result;
                  if (*result)
                  {
                    int v60 = result + 1;
                    do
                    {
                      int v61 = *(_BYTE **)(v6 + 8);
                      if ((unint64_t)v61 >= *(void *)(v6 + 16))
                      {
                        ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                        int v61 = *(_BYTE **)(v6 + 8);
                      }

                      *(void *)(v6 + 8) = v61 + 1;
                      *int v61 = v59;
                      int v62 = *v60++;
                      char v59 = v62;
                    }

                    while (v62);
                  }
                }

                else
                {
                  v63 = *(_BYTE **)(v6 + 8);
                  if ((unint64_t)v63 >= *(void *)(v6 + 16))
                  {
                    ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                    v63 = *(_BYTE **)(v6 + 8);
                  }

                  *(void *)(v6 + 8) = v63 + 1;
                  _BYTE *v63 = v58;
                }

                BOOL v16 = v57-- <= 1;
              }

              while (!v16);
            }

            while (1)
            {
              char v69 = *v56;
              if (!*v56) {
                break;
              }
              if (a2 && (ssize_t result = (_BYTE *)a2(*(unsigned __int8 *)v56)) != 0LL)
              {
                char v64 = *result;
                if (*result)
                {
                  v65 = result + 1;
                  do
                  {
                    v66 = *(_BYTE **)(v6 + 8);
                    if ((unint64_t)v66 >= *(void *)(v6 + 16))
                    {
                      ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                      v66 = *(_BYTE **)(v6 + 8);
                    }

                    *(void *)(v6 + 8) = v66 + 1;
                    _BYTE *v66 = v64;
                    int v67 = *v65++;
                    char v64 = v67;
                  }

                  while (v67);
                }
              }

              else
              {
                v68 = *(char **)(v6 + 8);
                if ((unint64_t)v68 >= *(void *)(v6 + 16))
                {
                  ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                  v68 = *(char **)(v6 + 8);
                }

                *(void *)(v6 + 8) = v68 + 1;
                char *v68 = v69;
              }

              ++v56;
            }

            break;
          case 'u':
            v70 = (unint64_t *)a4;
            a4 += 2;
            if (v22) {
              unint64_t v71 = *v70;
            }
            else {
              unint64_t v71 = *(unsigned int *)v70;
            }
            ssize_t result = udec(v6, a2, v71, v24, v23);
            break;
          case 'x':
            goto LABEL_62;
          case 'y':
            v72 = (unint64_t *)a4;
            a4 += 2;
            if (v22) {
              unint64_t v73 = *v72;
            }
            else {
              unint64_t v73 = *(unsigned int *)v72;
            }
            ssize_t result = ydec(v6, a2, v73, v24, v23);
            break;
          default:
            goto LABEL_130;
        }

        goto LABEL_148;
      }

LABEL_35:
      if ((v26 - 48) <= 9)
      {
        do
        {
          int v27 = 10 * v24 + v26;
          int v28 = v17->u8[1];
          uint64_t v17 = (int8x16_t *)((char *)v17 + 1);
          LOBYTE(v26) = v28;
          int v24 = v27 - 48;
        }

        while ((v28 - 48) < 0xA);
      }

LABEL_32:
      ssize_t result = (_BYTE *)_platform_strncmp(v17, (int8x16_t *)".*s", 3uLL);
      if (!(_DWORD)result) {
        goto LABEL_44;
      }
    }

    if (v25 == 48)
    {
      ++v23;
      int v29 = v17->u8[1];
      uint64_t v17 = (int8x16_t *)((char *)v17 + 1);
      int v26 = v29;
      goto LABEL_35;
    }

    if (v25 == 88)
    {
LABEL_62:
      a4 += 2;
      uint64_t v41 = (std::ios_base *)v6;
LABEL_90:
      ssize_t result = hex(v41);
    }

    else
    {
LABEL_130:
      if (a2 && (ssize_t result = (_BYTE *)a2(v17->u8[0])) != 0LL)
      {
        char v74 = *result;
        if (*result)
        {
          v75 = result + 1;
          do
          {
            v76 = *(_BYTE **)(v6 + 8);
            if ((unint64_t)v76 >= *(void *)(v6 + 16))
            {
              ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
              v76 = *(_BYTE **)(v6 + 8);
            }

            *(void *)(v6 + 8) = v76 + 1;
            _BYTE *v76 = v74;
            int v77 = *v75++;
            char v74 = v77;
          }

          while (v77);
        }
      }

      else
      {
        v79 = *(_BYTE **)(v6 + 8);
        if ((unint64_t)v79 >= *(void *)(v6 + 16))
        {
          ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
          v79 = *(_BYTE **)(v6 + 8);
        }

        *(void *)(v6 + 8) = v79 + 1;
        _BYTE *v79 = v26;
      }
    }

LABEL_148:
    uint64_t v4 = &v17->u8[1];
  }

  while (*v4);
  return result;
}

ssize_t _flush(ssize_t result)
{
  uint64_t v1 = *(char **)result;
  int64_t v2 = *(void *)(result + 8) - *(void *)result;
  if (v2 >= 1)
  {
    ssize_t v3 = result;
    while (1)
    {
      while (1)
      {
        ssize_t result = write(*(_DWORD *)(v3 + 24), v1, v2);
        if (result < 0) {
          break;
        }
        BOOL v4 = v2 <= result;
        v2 -= result;
        v1 += v2;
        if (v4) {
          return result;
        }
      }

      if (*__error() != 4)
      {
        ssize_t result = (ssize_t)__error();
        if (*(_DWORD *)result != 35) {
          break;
        }
      }
    }
  }

  return result;
}

ssize_t _simple_dprintf( int a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  return _simple_vdprintf(a1, a2, &a9);
}

vm_address_t _simple_salloc()
{
  unint64_t v0 = (void *)MEMORY[0x189600148];
  if (vm_allocate(*MEMORY[0x1895FFD48], &address, *MEMORY[0x189600148], 1)) {
    return 0LL;
  }
  vm_address_t v2 = address + 40;
  *(void *)vm_address_t address = address + 40;
  vm_address_t result = address;
  vm_address_t v3 = address + *v0 - 1;
  *(void *)(address + 8) = v2;
  *(void *)(result + 16) = v3;
  *(void *)(result + 32) = _enlarge;
  return result;
}

uint64_t *_enlarge(uint64_t a1)
{
  kern_return_t v8;
  vm_address_t v9;
  uint64_t *v10;
  vm_address_t v11;
  vm_address_t v12;
  vm_address_t address;
  vm_address_t v2 = (vm_address_t *)(a1 + 16);
  vm_address_t address = *(void *)(a1 + 16) + 1LL;
  vm_address_t v3 = (vm_map_t *)MEMORY[0x1895FFD48];
  BOOL v4 = (vm_address_t *)MEMORY[0x189600148];
  vm_address_t result = (uint64_t *)vm_allocate(*MEMORY[0x1895FFD48], &address, *MEMORY[0x189600148], 0);
  if ((_DWORD)result)
  {
    unint64_t v6 = *(void *)(a1 + 16) - *(void *)a1 + 1LL;
    vm_size_t v7 = (v6 + *v4) & -(uint64_t)*v4;
    uint64_t v8 = vm_allocate(*v3, &address, v7, 1);
    if (v8) {
      _enlarge_cold_1(v8);
    }
    uint64_t v9 = address - *(void *)a1;
    vm_address_t result = _platform_memmove((uint64_t *)address, *(uint64_t **)a1, v6);
    unsigned int v10 = *(uint64_t **)a1;
    char v11 = *v4;
    if (((*v4 - 1) & *(void *)a1) != 0)
    {
      v6 &= -(uint64_t)v11;
      unsigned int v10 = (uint64_t *)(((unint64_t)v10 + v11) & -(uint64_t)v11);
      *(void *)a1 = v10;
      uint64_t v12 = v7 + address - 1;
    }

    else
    {
      uint64_t v12 = *v2 + v11 + v9;
    }

    *vm_address_t v2 = v12;
    if (v6) {
      vm_address_t result = (uint64_t *)mach_vm_deallocate(*v3, (mach_vm_address_t)v10, v6);
    }
    *(void *)a1 = address;
    vm_address_t v2 = (vm_address_t *)(a1 + 8);
  }

  else
  {
    uint64_t v9 = *v4;
  }

  *v2 += v9;
  return result;
}

uint64_t _simple_vsprintf(_BYTE *a1, unsigned __int8 *a2, int *a3)
{
  return 0LL;
}

uint64_t _simple_vesprintf(_BYTE *a1, uint64_t (*a2)(uint64_t), unsigned __int8 *a3, int *a4)
{
  return 0LL;
}

uint64_t _simple_sprintf( _BYTE *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  return 0LL;
}

uint64_t _simple_esprintf( _BYTE *a1, uint64_t (*a2)(uint64_t), unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  return 0LL;
}

uint64_t _simple_string(_BYTE **a1)
{
  *a1[1] = 0;
  return (uint64_t)*a1;
}

unint64_t _simple_sresize(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t result = _platform_strlen(*a1);
  a1[1] = v2 + result;
  return result;
}

uint64_t _simple_sappend(uint64_t a1, _BYTE *a2)
{
  char v2 = *a2;
  if (*a2)
  {
    BOOL v4 = a2 + 1;
    do
    {
      unsigned __int8 v5 = *(_BYTE **)(a1 + 8);
      if ((unint64_t)v5 >= *(void *)(a1 + 16))
      {
        (*(void (**)(uint64_t))(a1 + 32))(a1);
        unsigned __int8 v5 = *(_BYTE **)(a1 + 8);
      }

      *(void *)(a1 + 8) = v5 + 1;
      *unsigned __int8 v5 = v2;
      int v6 = *v4++;
      char v2 = v6;
    }

    while (v6);
  }

  return 0LL;
}

uint64_t _simple_esappend(uint64_t a1, uint64_t (*a2)(void), unsigned __int8 *a3)
{
  unsigned __int8 v3 = *a3;
  if (*a3)
  {
    BOOL v4 = a3;
    do
    {
      if (a2 && (vm_size_t v7 = (_BYTE *)a2(v3)) != 0LL)
      {
        char v8 = *v7;
        if (*v7)
        {
          uint64_t v9 = v7 + 1;
          do
          {
            unsigned int v10 = *(_BYTE **)(a1 + 8);
            if ((unint64_t)v10 >= *(void *)(a1 + 16))
            {
              (*(void (**)(uint64_t))(a1 + 32))(a1);
              unsigned int v10 = *(_BYTE **)(a1 + 8);
            }

            *(void *)(a1 + 8) = v10 + 1;
            *unsigned int v10 = v8;
            int v11 = *v9++;
            char v8 = v11;
          }

          while (v11);
        }
      }

      else
      {
        uint64_t v12 = *(unsigned __int8 **)(a1 + 8);
        if ((unint64_t)v12 >= *(void *)(a1 + 16))
        {
          (*(void (**)(uint64_t))(a1 + 32))(a1);
          uint64_t v12 = *(unsigned __int8 **)(a1 + 8);
        }

        *(void *)(a1 + 8) = v12 + 1;
        *uint64_t v12 = v3;
      }

      int v13 = *++v4;
      unsigned __int8 v3 = v13;
    }

    while (v13);
  }

  return 0LL;
}

ssize_t _simple_put(ssize_t result, int a2)
{
  *(_DWORD *)(result + 24) = a2;
  return _flush(result);
}

ssize_t _simple_putline(ssize_t a1, int a2)
{
  *(_DWORD *)(a1 + 24) = a2;
  unsigned __int8 v3 = *(_BYTE **)(a1 + 8);
  *(void *)(a1 + 8) = v3 + 1;
  *unsigned __int8 v3 = 10;
  ssize_t result = _flush(a1);
  --*(void *)(a1 + 8);
  return result;
}

mach_vm_address_t *_simple_sfree(mach_vm_address_t *address)
{
  if (address)
  {
    mach_vm_address_t v1 = (mach_vm_address_t)address;
    char v2 = (mach_vm_size_t *)MEMORY[0x189600148];
    unsigned __int8 v3 = (vm_map_t *)MEMORY[0x1895FFD48];
    if (((*MEMORY[0x189600148] - 1LL) & *address) != 0)
    {
      mach_vm_size_t v4 = address[2] - (void)address + 1;
    }

    else
    {
      mach_vm_deallocate(*MEMORY[0x1895FFD48], *address, address[2] - *address + 1);
      mach_vm_size_t v4 = *v2;
    }

    return (mach_vm_address_t *)mach_vm_deallocate(*v3, v1, v4);
  }

  return address;
}

std::ios_base *__cdecl dec(std::ios_base *__str)
{
  unsigned __int8 v5 = v1;
  int v7 = (v2 >> 63) + v3;
  unint64_t v8 = (unint64_t)v2 >> 63;
  char v39 = 0;
  if (v2)
  {
    uint64_t v9 = &v39;
    if (v2 >= 0) {
      unint64_t v10 = v2;
    }
    else {
      unint64_t v10 = -v2;
    }
    do
    {
      *--uint64_t v9 = (v10 % 0xA) | 0x30;
      BOOL v11 = v10 >= 0xA;
      v10 /= 0xAuLL;
    }

    while (v11);
    BOOL v12 = v4 != 0;
    if (v2 < 0 && v4)
    {
      if (v1 && (int v13 = (_BYTE *)v1(45LL)) != 0LL)
      {
        LODWORD(v8) = *v13;
        if (*v13)
        {
          int v14 = v13 + 1;
          do
          {
            uint64_t v15 = *(_BYTE **)&__str->__fmtflags_;
            if ((unint64_t)v15 >= __str->__precision_)
            {
              (*(void (**)(std::ios_base *))&__str->__rdstate_)(__str);
              uint64_t v15 = *(_BYTE **)&__str->__fmtflags_;
            }

            *(void *)&__str->__fmtflags_ = v15 + 1;
            _BYTE *v15 = v8;
            int v16 = *v14++;
            LODWORD(v8) = v16;
          }

          while (v16);
        }
      }

      else
      {
        uint64_t v17 = *(_BYTE **)&__str->__fmtflags_;
        if ((unint64_t)v17 >= __str->__precision_)
        {
          (*(void (**)(std::ios_base *))&__str->__rdstate_)(__str);
          uint64_t v17 = *(_BYTE **)&__str->__fmtflags_;
        }

        LODWORD(v8) = 0;
        *(void *)&__str->__fmtflags_ = v17 + 1;
        *uint64_t v17 = 45;
      }

      BOOL v12 = 1;
    }
  }

  else
  {
    uint64_t v9 = &v38;
    char v38 = 48;
    BOOL v12 = v4 != 0;
  }

  ssize_t result = (std::ios_base *)_platform_strlen((uint64_t)v9);
  uint64_t v19 = v7 - (void)result;
  if (v19 >= 1)
  {
    if (v12) {
      uint64_t v20 = 48LL;
    }
    else {
      uint64_t v20 = 32LL;
    }
    do
    {
      if (v5 && (ssize_t result = (std::ios_base *)v5(v20)) != 0LL)
      {
        char v21 = (char)result->__vftable;
        if (LOBYTE(result->__vftable))
        {
          int v22 = (unsigned __int8 *)&result->__vftable + 1;
          do
          {
            int v23 = *(_BYTE **)&__str->__fmtflags_;
            if ((unint64_t)v23 >= __str->__precision_)
            {
              ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
              int v23 = *(_BYTE **)&__str->__fmtflags_;
            }

            *(void *)&__str->__fmtflags_ = v23 + 1;
            *int v23 = v21;
            int v24 = *v22++;
            char v21 = v24;
          }

          while (v24);
        }
      }

      else
      {
        int v25 = *(_BYTE **)&__str->__fmtflags_;
        if ((unint64_t)v25 >= __str->__precision_)
        {
          ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
          int v25 = *(_BYTE **)&__str->__fmtflags_;
        }

        *(void *)&__str->__fmtflags_ = v25 + 1;
        *int v25 = v20;
      }
    }

    while (v19-- > 1);
  }

  if ((_DWORD)v8)
  {
    if (v5 && (ssize_t result = (std::ios_base *)v5(45LL)) != 0LL)
    {
      char v27 = (char)result->__vftable;
      if (LOBYTE(result->__vftable))
      {
        int v28 = (unsigned __int8 *)&result->__vftable + 1;
        do
        {
          int v29 = *(_BYTE **)&__str->__fmtflags_;
          if ((unint64_t)v29 >= __str->__precision_)
          {
            ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
            int v29 = *(_BYTE **)&__str->__fmtflags_;
          }

          *(void *)&__str->__fmtflags_ = v29 + 1;
          *int v29 = v27;
          int v30 = *v28++;
          char v27 = v30;
        }

        while (v30);
      }
    }

    else
    {
      uint64_t v31 = *(_BYTE **)&__str->__fmtflags_;
      if ((unint64_t)v31 >= __str->__precision_)
      {
        ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
        uint64_t v31 = *(_BYTE **)&__str->__fmtflags_;
      }

      *(void *)&__str->__fmtflags_ = v31 + 1;
      *uint64_t v31 = 45;
    }
  }

  while (1)
  {
    char v37 = *v9;
    if (!*v9) {
      break;
    }
    if (v5 && (ssize_t result = (std::ios_base *)v5(*v9)) != 0LL)
    {
      char v32 = (char)result->__vftable;
      if (LOBYTE(result->__vftable))
      {
        gid_t v33 = (unsigned __int8 *)&result->__vftable + 1;
        do
        {
          uint64_t v34 = *(_BYTE **)&__str->__fmtflags_;
          if ((unint64_t)v34 >= __str->__precision_)
          {
            ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
            uint64_t v34 = *(_BYTE **)&__str->__fmtflags_;
          }

          *(void *)&__str->__fmtflags_ = v34 + 1;
          *uint64_t v34 = v32;
          int v35 = *v33++;
          char v32 = v35;
        }

        while (v35);
      }
    }

    else
    {
      char v36 = *(char **)&__str->__fmtflags_;
      if ((unint64_t)v36 >= __str->__precision_)
      {
        ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
        char v36 = *(char **)&__str->__fmtflags_;
      }

      *(void *)&__str->__fmtflags_ = v36 + 1;
      *char v36 = v37;
    }

    ++v9;
  }

  return result;
}

std::ios_base *__cdecl oct(std::ios_base *__str)
{
  int v5 = v4;
  int v6 = v1;
  char v27 = 0;
  if (v2)
  {
    unint64_t v8 = &v27;
    do
    {
      *--unint64_t v8 = v2 & 7 | 0x30;
      BOOL v9 = v2 >= 8;
      v2 >>= 3;
    }

    while (v9);
  }

  else
  {
    unint64_t v8 = &v26;
    char v26 = 48;
  }

  uint64_t v10 = v3;
  ssize_t result = (std::ios_base *)_platform_strlen((uint64_t)v8);
  uint64_t v12 = v10 - (void)result;
  if (v12 >= 1)
  {
    if (v5) {
      uint64_t v13 = 48LL;
    }
    else {
      uint64_t v13 = 32LL;
    }
    do
    {
      if (v6 && (ssize_t result = (std::ios_base *)v6(v13)) != 0LL)
      {
        char v14 = (char)result->__vftable;
        if (LOBYTE(result->__vftable))
        {
          uint64_t v15 = (unsigned __int8 *)&result->__vftable + 1;
          do
          {
            int v16 = *(_BYTE **)&__str->__fmtflags_;
            if ((unint64_t)v16 >= __str->__precision_)
            {
              ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
              int v16 = *(_BYTE **)&__str->__fmtflags_;
            }

            *(void *)&__str->__fmtflags_ = v16 + 1;
            *int v16 = v14;
            int v17 = *v15++;
            char v14 = v17;
          }

          while (v17);
        }
      }

      else
      {
        char v18 = *(_BYTE **)&__str->__fmtflags_;
        if ((unint64_t)v18 >= __str->__precision_)
        {
          ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
          char v18 = *(_BYTE **)&__str->__fmtflags_;
        }

        *(void *)&__str->__fmtflags_ = v18 + 1;
        *char v18 = v13;
      }
    }

    while (v12-- > 1);
  }

  while (1)
  {
    char v25 = *v8;
    if (!*v8) {
      break;
    }
    if (v6 && (ssize_t result = (std::ios_base *)v6(*v8)) != 0LL)
    {
      char v20 = (char)result->__vftable;
      if (LOBYTE(result->__vftable))
      {
        char v21 = (unsigned __int8 *)&result->__vftable + 1;
        do
        {
          int v22 = *(_BYTE **)&__str->__fmtflags_;
          if ((unint64_t)v22 >= __str->__precision_)
          {
            ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
            int v22 = *(_BYTE **)&__str->__fmtflags_;
          }

          *(void *)&__str->__fmtflags_ = v22 + 1;
          *int v22 = v20;
          int v23 = *v21++;
          char v20 = v23;
        }

        while (v23);
      }
    }

    else
    {
      int v24 = *(char **)&__str->__fmtflags_;
      if ((unint64_t)v24 >= __str->__precision_)
      {
        ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
        int v24 = *(char **)&__str->__fmtflags_;
      }

      *(void *)&__str->__fmtflags_ = v24 + 1;
      *int v24 = v25;
    }

    ++v8;
  }

  return result;
}

std::ios_base *__cdecl hex(std::ios_base *__str)
{
  int v7 = v4;
  int v8 = v3;
  BOOL v9 = v1;
  BOOL v11 = "0123456789ABCDEF";
  if (!v5) {
    BOOL v11 = "0123456789abcdef";
  }
  char v48 = 0;
  if (v2)
  {
    uint64_t v12 = &v48;
    do
    {
      *--uint64_t v12 = v11[v2 & 0xF];
      BOOL v13 = v2 >= 0x10;
      v2 >>= 4;
    }

    while (v13);
    if (!v6) {
      goto LABEL_23;
    }
  }

  else
  {
    uint64_t v12 = &v47;
    char v47 = 48;
    if (!v6)
    {
LABEL_23:
      char v23 = 1;
      goto LABEL_25;
    }
  }

  int v8 = v3 - 2;
  if (v4)
  {
    char v14 = (char *)&_0x;
    unsigned __int8 v15 = 48;
    do
    {
      if (v9 && (int v16 = (_BYTE *)v9(v15)) != 0LL)
      {
        char v17 = *v16;
        if (*v16)
        {
          char v18 = v16 + 1;
          do
          {
            uint64_t v19 = *(_BYTE **)&__str->__fmtflags_;
            if ((unint64_t)v19 >= __str->__precision_)
            {
              (*(void (**)(std::ios_base *))&__str->__rdstate_)(__str);
              uint64_t v19 = *(_BYTE **)&__str->__fmtflags_;
            }

            *(void *)&__str->__fmtflags_ = v19 + 1;
            *uint64_t v19 = v17;
            int v20 = *v18++;
            char v17 = v20;
          }

          while (v20);
        }
      }

      else
      {
        char v21 = *(unsigned __int8 **)&__str->__fmtflags_;
        if ((unint64_t)v21 >= __str->__precision_)
        {
          (*(void (**)(std::ios_base *))&__str->__rdstate_)(__str);
          char v21 = *(unsigned __int8 **)&__str->__fmtflags_;
        }

        *(void *)&__str->__fmtflags_ = v21 + 1;
        *char v21 = v15;
      }

      unsigned __int8 v22 = *++v14;
      unsigned __int8 v15 = v22;
    }

    while (v14 != (char *)&unk_1803C26A0);
    goto LABEL_23;
  }

  char v23 = 0;
LABEL_25:
  ssize_t result = (std::ios_base *)_platform_strlen((uint64_t)v12);
  int v25 = v8 - (_DWORD)result;
  if (v25 >= 1)
  {
    if (v7) {
      uint64_t v26 = 48LL;
    }
    else {
      uint64_t v26 = 32LL;
    }
    do
    {
      if (v9 && (ssize_t result = (std::ios_base *)v9(v26)) != 0LL)
      {
        char v27 = (char)result->__vftable;
        if (LOBYTE(result->__vftable))
        {
          int v28 = (unsigned __int8 *)&result->__vftable + 1;
          do
          {
            int v29 = *(_BYTE **)&__str->__fmtflags_;
            if ((unint64_t)v29 >= __str->__precision_)
            {
              ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
              int v29 = *(_BYTE **)&__str->__fmtflags_;
            }

            *(void *)&__str->__fmtflags_ = v29 + 1;
            *int v29 = v27;
            int v30 = *v28++;
            char v27 = v30;
          }

          while (v30);
        }
      }

      else
      {
        uint64_t v31 = *(_BYTE **)&__str->__fmtflags_;
        if ((unint64_t)v31 >= __str->__precision_)
        {
          ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
          uint64_t v31 = *(_BYTE **)&__str->__fmtflags_;
        }

        *(void *)&__str->__fmtflags_ = v31 + 1;
        *uint64_t v31 = v26;
      }
    }

    while (v25-- > 1);
  }

  if ((v23 & 1) == 0)
  {
    gid_t v33 = (char *)&_0x;
    unsigned __int8 v34 = 48;
    do
    {
      if (v9 && (ssize_t result = (std::ios_base *)v9(v34)) != 0LL)
      {
        char v35 = (char)result->__vftable;
        if (LOBYTE(result->__vftable))
        {
          char v36 = (unsigned __int8 *)&result->__vftable + 1;
          do
          {
            char v37 = *(_BYTE **)&__str->__fmtflags_;
            if ((unint64_t)v37 >= __str->__precision_)
            {
              ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
              char v37 = *(_BYTE **)&__str->__fmtflags_;
            }

            *(void *)&__str->__fmtflags_ = v37 + 1;
            *char v37 = v35;
            int v38 = *v36++;
            char v35 = v38;
          }

          while (v38);
        }
      }

      else
      {
        char v39 = *(unsigned __int8 **)&__str->__fmtflags_;
        if ((unint64_t)v39 >= __str->__precision_)
        {
          ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
          char v39 = *(unsigned __int8 **)&__str->__fmtflags_;
        }

        *(void *)&__str->__fmtflags_ = v39 + 1;
        *char v39 = v34;
      }

      unsigned __int8 v40 = *++v33;
      unsigned __int8 v34 = v40;
    }

    while (v33 != (char *)&unk_1803C26A0);
  }

  while (1)
  {
    char v46 = *v12;
    if (!*v12) {
      break;
    }
    if (v9 && (ssize_t result = (std::ios_base *)v9(*v12)) != 0LL)
    {
      char v41 = (char)result->__vftable;
      if (LOBYTE(result->__vftable))
      {
        uint64_t v42 = (unsigned __int8 *)&result->__vftable + 1;
        do
        {
          char v43 = *(_BYTE **)&__str->__fmtflags_;
          if ((unint64_t)v43 >= __str->__precision_)
          {
            ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
            char v43 = *(_BYTE **)&__str->__fmtflags_;
          }

          *(void *)&__str->__fmtflags_ = v43 + 1;
          *char v43 = v41;
          int v44 = *v42++;
          char v41 = v44;
        }

        while (v44);
      }
    }

    else
    {
      uint64_t v45 = *(char **)&__str->__fmtflags_;
      if ((unint64_t)v45 >= __str->__precision_)
      {
        ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
        uint64_t v45 = *(char **)&__str->__fmtflags_;
      }

      *(void *)&__str->__fmtflags_ = v45 + 1;
      *uint64_t v45 = v46;
    }

    ++v12;
  }

  return result;
}

_BYTE *udec(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t a3, int a4, int a5)
{
  char v27 = 0;
  if (a3)
  {
    int v8 = &v27;
    do
    {
      *--int v8 = (a3 % 0xA) | 0x30;
      BOOL v9 = a3 >= 0xA;
      a3 /= 0xAuLL;
    }

    while (v9);
  }

  else
  {
    int v8 = &v26;
    char v26 = 48;
  }

  uint64_t v10 = a4;
  ssize_t result = (_BYTE *)_platform_strlen((uint64_t)v8);
  uint64_t v12 = v10 - (void)result;
  if (v12 >= 1)
  {
    if (a5) {
      uint64_t v13 = 48LL;
    }
    else {
      uint64_t v13 = 32LL;
    }
    do
    {
      if (a2 && (ssize_t result = (_BYTE *)a2(v13)) != 0LL)
      {
        char v14 = *result;
        if (*result)
        {
          unsigned __int8 v15 = result + 1;
          do
          {
            int v16 = *(_BYTE **)(a1 + 8);
            if ((unint64_t)v16 >= *(void *)(a1 + 16))
            {
              ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
              int v16 = *(_BYTE **)(a1 + 8);
            }

            *(void *)(a1 + 8) = v16 + 1;
            *int v16 = v14;
            int v17 = *v15++;
            char v14 = v17;
          }

          while (v17);
        }
      }

      else
      {
        char v18 = *(_BYTE **)(a1 + 8);
        if ((unint64_t)v18 >= *(void *)(a1 + 16))
        {
          ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
          char v18 = *(_BYTE **)(a1 + 8);
        }

        *(void *)(a1 + 8) = v18 + 1;
        *char v18 = v13;
      }
    }

    while (v12-- > 1);
  }

  while (1)
  {
    char v25 = *v8;
    if (!*v8) {
      break;
    }
    if (a2 && (ssize_t result = (_BYTE *)a2(*v8)) != 0LL)
    {
      char v20 = *result;
      if (*result)
      {
        char v21 = result + 1;
        do
        {
          unsigned __int8 v22 = *(_BYTE **)(a1 + 8);
          if ((unint64_t)v22 >= *(void *)(a1 + 16))
          {
            ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
            unsigned __int8 v22 = *(_BYTE **)(a1 + 8);
          }

          *(void *)(a1 + 8) = v22 + 1;
          *unsigned __int8 v22 = v20;
          int v23 = *v21++;
          char v20 = v23;
        }

        while (v23);
      }
    }

    else
    {
      int v24 = *(char **)(a1 + 8);
      if ((unint64_t)v24 >= *(void *)(a1 + 16))
      {
        ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
        int v24 = *(char **)(a1 + 8);
      }

      *(void *)(a1 + 8) = v24 + 1;
      *int v24 = v25;
    }

    ++v8;
  }

  return result;
}

_BYTE *ydec(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t a3, int a4, int a5)
{
  if (a3 < 0xA00000)
  {
    if (a3 >> 11 < 5)
    {
      ssize_t result = udec(a1, a2, a3, a4, a5);
      if (a2 && (ssize_t result = (_BYTE *)a2(98LL)) != 0LL)
      {
        char v24 = *result;
        if (*result)
        {
          char v25 = result + 1;
          do
          {
            char v26 = *(_BYTE **)(a1 + 8);
            if ((unint64_t)v26 >= *(void *)(a1 + 16))
            {
              ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
              char v26 = *(_BYTE **)(a1 + 8);
            }

            *(void *)(a1 + 8) = v26 + 1;
            *char v26 = v24;
            int v27 = *v25++;
            char v24 = v27;
          }

          while (v27);
        }
      }

      else
      {
        int v28 = *(_BYTE **)(a1 + 8);
        if ((unint64_t)v28 >= *(void *)(a1 + 16))
        {
          ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
          int v28 = *(_BYTE **)(a1 + 8);
        }

        *(void *)(a1 + 8) = v28 + 1;
        *int v28 = 98;
      }
    }

    else
    {
      ssize_t result = udec(a1, a2, (a3 + 512) >> 10, a4, a5);
      int v16 = "KB";
      unsigned __int8 v17 = 75;
      do
      {
        if (a2 && (ssize_t result = (_BYTE *)a2(v17)) != 0LL)
        {
          char v18 = *result;
          if (*result)
          {
            uint64_t v19 = result + 1;
            do
            {
              char v20 = *(_BYTE **)(a1 + 8);
              if ((unint64_t)v20 >= *(void *)(a1 + 16))
              {
                ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
                char v20 = *(_BYTE **)(a1 + 8);
              }

              *(void *)(a1 + 8) = v20 + 1;
              *char v20 = v18;
              int v21 = *v19++;
              char v18 = v21;
            }

            while (v21);
          }
        }

        else
        {
          unsigned __int8 v22 = *(unsigned __int8 **)(a1 + 8);
          if ((unint64_t)v22 >= *(void *)(a1 + 16))
          {
            ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
            unsigned __int8 v22 = *(unsigned __int8 **)(a1 + 8);
          }

          *(void *)(a1 + 8) = v22 + 1;
          *unsigned __int8 v22 = v17;
        }

        unsigned __int8 v23 = *++v16;
        unsigned __int8 v17 = v23;
      }

      while (v16 != "");
    }
  }

  else
  {
    ssize_t result = udec(a1, a2, (a3 + 0x80000) >> 20, a4, a5);
    int v8 = "MB";
    unsigned __int8 v9 = 77;
    do
    {
      if (a2 && (ssize_t result = (_BYTE *)a2(v9)) != 0LL)
      {
        char v10 = *result;
        if (*result)
        {
          BOOL v11 = result + 1;
          do
          {
            uint64_t v12 = *(_BYTE **)(a1 + 8);
            if ((unint64_t)v12 >= *(void *)(a1 + 16))
            {
              ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
              uint64_t v12 = *(_BYTE **)(a1 + 8);
            }

            *(void *)(a1 + 8) = v12 + 1;
            *uint64_t v12 = v10;
            int v13 = *v11++;
            char v10 = v13;
          }

          while (v13);
        }
      }

      else
      {
        char v14 = *(unsigned __int8 **)(a1 + 8);
        if ((unint64_t)v14 >= *(void *)(a1 + 16))
        {
          ssize_t result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
          char v14 = *(unsigned __int8 **)(a1 + 8);
        }

        *(void *)(a1 + 8) = v14 + 1;
        *char v14 = v9;
      }

      unsigned __int8 v15 = *++v8;
      unsigned __int8 v9 = v15;
    }

    while (v8 != "");
  }

  return result;
}

_BYTE *__pfz_setup(uint64_t *a1)
{
  ssize_t result = (_BYTE *)_simple_getenv(a1, (uint64_t)"pfz");
  if (result)
  {
    if (*result == 48 && result[1] == 120 && (char v2 = result[2]) != 0)
    {
      uint64_t v3 = 0LL;
      int v4 = result + 3;
      do
      {
        int v5 = v2;
        if ((v2 - 48) >= 0xAu)
        {
          int v6 = -87;
          if ((v5 - 97) >= 6u)
          {
            int v6 = -55;
          }
        }

        else
        {
          int v6 = -48;
        }

        uint64_t v3 = (v6 + v5) + 16 * v3;
        int v7 = *v4++;
        char v2 = v7;
      }

      while (v7);
    }

    else
    {
LABEL_13:
      uint64_t v3 = 0LL;
    }

    int v8 = result - 4;
    unint64_t v9 = _platform_strlen((uint64_t)result);
    ssize_t result = _platform_bzero(v8, v9 + 4);
    if (v3) {
      commpage_pfz_base = v3;
    }
  }

  return result;
}

int sys_cache_control(int function, void *start, size_t len)
{
  if (function == 2)
  {
    sys_dcache_flush(start, len);
    return 0;
  }

  if (function == 1)
  {
    sys_icache_invalidate(start, len);
    return 0;
  }

  return 45;
}

void sys_icache_invalidate(void *start, size_t len)
{
  if (len)
  {
    unint64_t v2 = (unint64_t)start & 0xFFFFFFFFFFFFFFC0LL;
    size_t v3 = ~((len + (start & 0x3F) - 1) >> 6);
    __dsb(0xBu);
    uint64_t v4 = 20LL;
    uint64_t v5 = 0LL;
    do
    {
      __asm { IC              IVAU, X9 }

      v2 += 64LL;
      if (!--v4)
      {
        if (v5)
        {
LABEL_5:
          __dsb(0xBu);
          uint64_t v4 = 20LL;
        }

        else
        {
          char v10 = &cpus_that_need_dsb_for_ic_ivau;
          while (1)
          {
            unsigned int v11 = *v10++;
            uint64_t v5 = v11;
            if (!v11) {
              break;
            }
            if ((_DWORD)v5 == MEMORY[0xFFFFFC080]) {
              goto LABEL_5;
            }
          }

          uint64_t v4 = 0LL;
          uint64_t v5 = 1LL;
        }
      }

      ++v3;
    }

    while (v3);
    __dsb(0xBu);
    __isb(0xFu);
  }

void sys_dcache_flush(void *start, size_t len)
{
}

uint64_t os_lock_lock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8LL))(a1);
}

uint64_t os_lock_trylock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
}

uint64_t os_lock_unlock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24LL))(a1);
}

unsigned int *_OSSpinLockLockSlow(unsigned int *result)
{
  for (int i = 100; ; --i)
  {
    while (1)
    {
      signed int v2 = __ldaxr(result);
      if (v2) {
        break;
      }
      if (!__stxr(1u, result)) {
        return result;
      }
    }

    if (v2 != 1)
    {
      __clrex();
      _os_lock_corruption_abort((uint64_t)result, v2);
    }

    if (!i) {
      break;
    }
    __wfe();
  }

  __clrex();
  return (unsigned int *)_OSSpinLockLockYield(result);
}

unint64_t _OSSpinLockLockYield(unsigned int *a1)
{
  unint64_t result = mach_timebase_info(&info);
  if ((_DWORD)result)
  {
    unint64_t v3 = -1LL;
  }

  else
  {
    unint64_t v4 = 1000000 * (unint64_t)info.denom / info.numer;
    unint64_t result = mach_absolute_time();
    unint64_t v3 = result + v4;
  }

  uint64_t v5 = 1LL;
  uint64_t v6 = 1LL;
  while (1)
  {
    signed int v7 = *a1;
    if (!*a1) {
      break;
    }
LABEL_6:
    if (v7 != 1) {
      _os_lock_corruption_abort(result, v7);
    }
    unint64_t result = MEMORY[0x186DFAC20](0LL, v6, v5);
    if ((_DWORD)v6 == 2)
    {
      uint64_t v5 = (v5 + 1);
    }

    else
    {
      unint64_t result = mach_absolute_time();
      if (result < v3) {
        uint64_t v6 = 1LL;
      }
      else {
        uint64_t v6 = 2LL;
      }
    }
  }

  do
  {
    signed int v7 = __ldaxr(a1);
    if (v7)
    {
      __clrex();
      goto LABEL_6;
    }
  }

  while (__stxr(1u, a1));
  return result;
}

void spin_lock(OSSpinLock *__lock)
{
  while (!__ldaxr((unsigned int *)__lock))
  {
  }

  __clrex();
  _OSSpinLockLockSlow((unsigned int *)__lock);
}

BOOL OSSpinLockTry(OSSpinLock *__lock)
{
  while (!__ldaxr((unsigned int *)__lock))
  {
    BOOL result = 1;
  }

  BOOL result = 0;
  __clrex();
  return result;
}

uint64_t spin_lock_try(unsigned int *a1)
{
  while (!__ldaxr(a1))
  {
    uint64_t result = 1LL;
    if (!__stxr(1u, a1)) {
      return result;
    }
  }

  uint64_t result = 0LL;
  __clrex();
  return result;
}

void spin_unlock(OSSpinLock *__lock)
{
}

unsigned int *_os_lock_spin_lock(uint64_t a1)
{
  uint64_t result = (unsigned int *)(a1 + 8);
  while (!__ldaxr(result))
  {
    if (!__stxr(1u, result)) {
      return result;
    }
  }

  __clrex();
  return _OSSpinLockLockSlow(result);
}

uint64_t _os_lock_spin_trylock(uint64_t a1)
{
  mach_vm_address_t v1 = (unsigned int *)(a1 + 8);
  while (!__ldaxr(v1))
  {
    uint64_t result = 1LL;
    if (!__stxr(1u, v1)) {
      return result;
    }
  }

  uint64_t result = 0LL;
  __clrex();
  return result;
}

uint64_t _os_lock_spin_unlock(uint64_t result)
{
  return result;
}

uint64_t _os_lock_handoff_lock(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  signed int v2 = (unsigned int *)(a1 + 8);
  while (!__ldaxr(v2))
  {
    if (!__stxr(v1, v2)) {
      return a1;
    }
  }

  __clrex();
  return _os_lock_handoff_lock_slow(a1);
}

uint64_t _os_lock_handoff_trylock(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  signed int v2 = (unsigned int *)(a1 + 8);
  while (!__ldaxr(v2))
  {
    if (!__stxr(v1, v2)) {
      return 1LL;
    }
  }

  uint64_t result = 0LL;
  __clrex();
  return result;
}

uint64_t _os_lock_handoff_unlock(uint64_t result)
{
  return result;
}

uint64_t _os_lock_handoff_lock_slow(uint64_t a1)
{
  char v1 = 0;
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  unint64_t v3 = (unsigned int *)(a1 + 8);
  int v4 = 1;
  int v5 = 100;
LABEL_2:
  int v6 = v5;
  while (1)
  {
    LODWORD(result) = *v3;
    if (!*v3) {
      break;
    }
LABEL_8:
    if ((_DWORD)result == v2) {
      _os_lock_recursive_abort(v2);
    }
    int v5 = v6 - 1;
    if (!v6)
    {
      MEMORY[0x186DFAC20]();
LABEL_11:
      ++v4;
      char v1 = 1;
      goto LABEL_2;
    }

    MEMORY[0x186DFAC20]();
    int v6 = v5;
    if ((v1 & 1) != 0) {
      goto LABEL_11;
    }
  }

  do
  {
    uint64_t result = __ldaxr(v3);
    if ((_DWORD)result)
    {
      __clrex();
      goto LABEL_8;
    }
  }

  while (__stxr(v2, v3));
  return result;
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(&lock->_os_unfair_lock_opaque))
  {
    if (!__stxr(v1, &lock->_os_unfair_lock_opaque)) {
      return;
    }
  }

  __clrex();
  _os_unfair_lock_lock_slow(&lock->_os_unfair_lock_opaque, 0, 0LL, v1);
}

uint64_t _os_unfair_lock_lock_slow(unsigned int *a1, int a2, uint64_t a3, unsigned int a4)
{
  if ((a2 & 0xFCFAFFFF) != 0)
  {
    qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Invalid options";
    qword_18C51C3B0 = a2 & 0xFEFFFFFF;
    __break(1u);
LABEL_34:
    _os_unfair_lock_recursive_abort(v4);
  }

  unsigned int v4 = a4;
  int v7 = 0;
  do
  {
    while (1)
    {
      while (1)
      {
LABEL_3:
        unsigned int v8 = *a1;
        if (!*a1)
        {
          while (1)
          {
            unsigned int v8 = __ldaxr(a1);
            if (v8) {
              break;
            }
            if (!__stxr(v4 & ~v7, a1)) {
              return 1LL;
            }
          }

          __clrex();
        }

        int v9 = v8 | 1;
        BOOL v11 = (a2 & 0x1000000) == 0 || v9 != -1;
        if (v9 == v4 && v11) {
          goto LABEL_34;
        }
        if (v8 == (v8 & 0xFFFFFFFE)) {
          goto LABEL_23;
        }
        do
        {
          unsigned int v13 = __ldxr(a1);
          if (v13 != v8)
          {
            __clrex();
            goto LABEL_3;
          }
        }

        while (__stxr(v8 & 0xFFFFFFFE, a1));
        v8 &= ~1u;
LABEL_23:
        uint64_t result = __ulock_wait2();
        if ((result & 0x80000000) != 0) {
          break;
        }
        if ((_DWORD)result) {
          int v7 = 1;
        }
      }

      uint64_t v14 = -(int)result;
      if ((_DWORD)v14 != 4) {
        goto LABEL_38;
      }
    }
  }

  while ((_DWORD)v14 == 14);
  uint64_t result = 0LL;
  if ((_DWORD)v14 != 60)
  {
    if ((_DWORD)v14 == 105) {
      _os_unfair_lock_corruption_abort(v8);
    }
LABEL_38:
    qword_18C51C380 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait2 failure";
    qword_18C51C3B0 = v14;
    __break(1u);
  }

  return result;
}

unsigned int *os_unfair_lock_lock_with_options(unsigned int *result, int a2)
{
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(result))
  {
    if (!__stxr(v2, result)) {
      return result;
    }
  }

  __clrex();
  return (unsigned int *)_os_unfair_lock_lock_slow(result, a2, 0LL, v2);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(&lock->_os_unfair_lock_opaque))
  {
    if (!__stxr(v1, &lock->_os_unfair_lock_opaque)) {
      return 1;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

uint64_t os_unfair_lock_trylock_with_options(unsigned int *a1, int a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(a1))
  {
    if (!__stxr(v3, a1)) {
      return 1LL;
    }
  }

  __clrex();
  return _os_unfair_lock_trylock_with_options_slow(a1, a2, a3, v3);
}

uint64_t _os_unfair_lock_trylock_with_options_slow(unsigned int *a1, int a2, uint64_t a3, unsigned int a4)
{
  if ((a2 & 0x2000000) != 0)
  {
    if (mach_absolute_time() <= a3) {
      return _os_unfair_lock_lock_slow(a1, a2, a3, a4);
    }
  }

  else if (a3)
  {
    mach_timebase_info(&info);
    unint64_t v8 = info.denom * a3 / info.numer;
    uint64_t v9 = mach_absolute_time();
    return _os_unfair_lock_lock_slow(a1, a2 | 0x2000000u, v9 + v8, a4);
  }

  return 0LL;
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v2 = __ldxr(&lock->_os_unfair_lock_opaque);
  while (__stlxr(0, &lock->_os_unfair_lock_opaque));
  if (v2 != v1) {
    _os_unfair_lock_unlock_slow((uint64_t)lock, v1, v2);
  }
}

uint64_t _os_unfair_lock_unlock_slow(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t result = a3 | 1;
  if ((_DWORD)result != a2) {
    _os_unfair_lock_unowned_abort(result);
  }
  if ((a3 & 1) != 0)
  {
    uint64_t v4 = a3;
    qword_18C51C380 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
    qword_18C51C3B0 = a3;
    __break(1u);
LABEL_9:
    qword_18C51C380 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
    qword_18C51C3B0 = v4;
    __break(1u);
  }

  else
  {
    while (1)
    {
      uint64_t result = __ulock_wake();
      if ((result & 0x80000000) == 0) {
        break;
      }
      if ((_DWORD)result != -4)
      {
        uint64_t v4 = -(int)result;
        if ((_DWORD)v4 != 2) {
          goto LABEL_9;
        }
        return result;
      }
    }
  }

  return result;
}

unsigned int *os_unfair_lock_lock_no_tsd(unsigned int *result, int a2, unsigned int a3)
{
  while (!__ldaxr(result))
  {
    if (!__stxr(a3, result)) {
      return result;
    }
  }

  __clrex();
  return (unsigned int *)_os_unfair_lock_lock_slow(result, a2, 0LL, a3);
}

unsigned int *os_unfair_lock_unlock_no_tsd(unsigned int *result, int a2)
{
  do
    unsigned int v2 = __ldxr(result);
  while (__stlxr(0, result));
  if (v2 != a2) {
    return (unsigned int *)_os_unfair_lock_unlock_slow((uint64_t)result, a2, v2);
  }
  return result;
}

unsigned int *os_unfair_lock_lock_with_flags(unsigned int *result, int a2)
{
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(result))
  {
    if (!__stxr(v2, result)) {
      return result;
    }
  }

  __clrex();
  return (unsigned int *)_os_unfair_lock_lock_slow(result, a2, 0LL, v2);
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  uint32_t os_unfair_lock_opaque = lock->_os_unfair_lock_opaque;
  if ((os_unfair_lock_opaque | 1) != v1) {
    os_unfair_lock_assert_owner_cold_1(os_unfair_lock_opaque);
  }
}

void os_unfair_lock_assert_not_owner(os_unfair_lock_t lock)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  uint32_t os_unfair_lock_opaque = lock->_os_unfair_lock_opaque;
  if ((os_unfair_lock_opaque | 1) == v1) {
    os_unfair_lock_assert_not_owner_cold_1(os_unfair_lock_opaque);
  }
}

BOOL os_unfair_recursive_lock_owned(_DWORD *a1)
{
  int v1 = *a1 | 1;
  return v1 == *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
}

unsigned int *os_unfair_recursive_lock_lock_with_options(unsigned int *result, int a2)
{
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    unsigned int v3 = __ldaxr(result);
    if (v3) {
      break;
    }
    if (!__stxr(v2, result))
    {
      char v4 = 1;
      goto LABEL_6;
    }
  }

  char v4 = 0;
  __clrex();
LABEL_6:
  if ((v4 & 1) == 0)
  {
    if ((v3 | 1) == v2) {
      ++result[1];
    }
    else {
      return (unsigned int *)_os_unfair_lock_lock_slow(result, a2, 0LL, v2);
    }
  }

  return result;
}

uint64_t os_unfair_recursive_lock_trylock(unsigned int *a1)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    unsigned int v2 = __ldaxr(a1);
    if (v2) {
      break;
    }
    if (!__stxr(v1, a1))
    {
      char v3 = 1;
      goto LABEL_6;
    }
  }

  char v3 = 0;
  __clrex();
LABEL_6:
  if ((v3 & 1) != 0) {
    return 1LL;
  }
  if ((v2 | 1) == v1)
  {
    ++a1[1];
    return 1LL;
  }

  return 0LL;
}

unsigned int *os_unfair_recursive_lock_unlock(unsigned int *result)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  unsigned int v2 = result[1];
  if (v2)
  {
    if ((*result | 1) != v1) {
      _os_unfair_lock_unowned_abort(*result | 1);
    }
    result[1] = v2 - 1;
  }

  else
  {
    do
      unsigned int v3 = __ldxr(result);
    while (__stlxr(0, result));
    if (v3 != v1) {
      return (unsigned int *)_os_unfair_lock_unlock_slow((uint64_t)result, v1, v3);
    }
  }

  return result;
}

BOOL os_unfair_recursive_lock_tryunlock4objc(unsigned int *a1)
{
  int v1 = *a1 | 1;
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  if (v1 == v2)
  {
    unsigned int v3 = a1[1];
    if (v3)
    {
      if ((*a1 | 1) != v1) {
        _os_unfair_lock_unowned_abort(*a1 | 1);
      }
      a1[1] = v3 - 1;
    }

    else
    {
      do
        unsigned int v4 = __ldxr(a1);
      while (__stlxr(0, a1));
      if (v4 != v1) {
        _os_unfair_lock_unlock_slow((uint64_t)a1, v1, v4);
      }
    }
  }

  return v1 == v2;
}

_DWORD *os_unfair_recursive_lock_unlock_forked_child(_DWORD *result)
{
  if (!*result) {
    os_unfair_recursive_lock_unlock_forked_child_cold_1();
  }
  int v1 = result[1];
  if (v1)
  {
    int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    result[1] = v1 - 1;
  }

  else
  {
    int v2 = 0;
  }

  *uint64_t result = v2;
  return result;
}

unsigned int *_os_lock_unfair_lock(uint64_t a1)
{
  uint64_t result = (unsigned int *)(a1 + 8);
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(result))
  {
    if (!__stxr(v2, result)) {
      return result;
    }
  }

  __clrex();
  return (unsigned int *)_os_unfair_lock_lock_slow(result, 0, 0LL, v2);
}

uint64_t _os_lock_unfair_trylock(uint64_t a1)
{
  int v1 = (unsigned int *)(a1 + 8);
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(v1))
  {
    if (!__stxr(v2, v1)) {
      return 1LL;
    }
  }

  uint64_t result = 0LL;
  __clrex();
  return result;
}

unsigned int *_os_lock_unfair_unlock(uint64_t a1)
{
  uint64_t result = (unsigned int *)(a1 + 8);
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v3 = __ldxr(result);
  while (__stlxr(0, result));
  if (v3 != v2) {
    return (unsigned int *)_os_unfair_lock_unlock_slow((uint64_t)result, v2, v3);
  }
  return result;
}

uint64_t _os_nospin_lock_lock(uint64_t result)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr((unsigned int *)result))
  {
  }

  __clrex();
  return _os_nospin_lock_lock_slow(result);
}

uint64_t _os_nospin_lock_lock_slow(uint64_t result)
{
  unsigned int v1 = (unsigned int *)result;
  int v2 = 0;
  int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  for (int i = 1; ; ++i)
  {
    do
    {
      while (1)
      {
        while (1)
        {
          uint64_t v5 = *v1;
          if (!(_DWORD)v5)
          {
            while (1)
            {
              uint64_t v5 = __ldaxr(v1);
              if ((_DWORD)v5) {
                break;
              }
              if (!__stxr(v3 & ~v2, v1)) {
                return result;
              }
            }

            __clrex();
          }

          uint64_t v6 = v5 & 0xFFFFFFFE;
          if (v5 == v6 || v6 == 0) {
            break;
          }
          while (1)
          {
            uint64_t v8 = __ldxr(v1);
            if (v8 != v5) {
              break;
            }
            if (!__stxr(v6, v1)) {
              goto LABEL_13;
            }
          }

          __clrex();
        }

LABEL_13:
        uint64_t result = __ulock_wait();
        if ((result & 0x80000000) != 0) {
          break;
        }
        if ((_DWORD)result) {
          int v2 = 1;
        }
      }

      int v9 = -(int)result;
    }

    while ((_DWORD)result == -4 || v9 == 14);
    if (v9 != 60) {
      break;
    }
  }

  qword_18C51C380 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait failure";
  qword_18C51C3B0 = -(int)result;
  __break(1u);
  return result;
}

uint64_t _os_nospin_lock_trylock(unsigned int *a1)
{
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(a1))
  {
    if (!__stxr(v1, a1)) {
      return 1LL;
    }
  }

  uint64_t result = 0LL;
  __clrex();
  return result;
}

void _os_nospin_lock_unlock(unsigned int *a1)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v2 = __ldxr(a1);
  while (__stlxr(0, a1));
  if (v2 != v1) {
    _os_nospin_lock_unlock_slow((uint64_t)a1, v2);
  }
}

void _os_nospin_lock_unlock_slow(uint64_t a1, unsigned int a2)
{
  if ((a2 | 1) == *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24))
  {
    if ((a2 & 1) != 0)
    {
      uint64_t v3 = a2;
      qword_18C51C380 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
      qword_18C51C3B0 = a2;
      __break(1u);
LABEL_8:
      qword_18C51C380 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
      qword_18C51C3B0 = v3;
      __break(1u);
    }

    else
    {
      while (1)
      {
        int v2 = __ulock_wake();
        if ((v2 & 0x80000000) == 0) {
          break;
        }
        if (v2 != -4)
        {
          uint64_t v3 = -v2;
          if ((_DWORD)v3 != 2) {
            goto LABEL_8;
          }
          return;
        }
      }
    }
  }

unsigned int *_os_lock_nospin_lock(uint64_t a1)
{
  uint64_t result = (unsigned int *)(a1 + 8);
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(result))
  {
    if (!__stxr(v2, result)) {
      return result;
    }
  }

  __clrex();
  return (unsigned int *)_os_nospin_lock_lock_slow((uint64_t)result);
}

uint64_t _os_lock_nospin_trylock(uint64_t a1)
{
  int v1 = (unsigned int *)(a1 + 8);
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(v1))
  {
    if (!__stxr(v2, v1)) {
      return 1LL;
    }
  }

  uint64_t result = 0LL;
  __clrex();
  return result;
}

void _os_lock_nospin_unlock(uint64_t a1)
{
  int v1 = (unsigned int *)(a1 + 8);
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v3 = __ldxr(v1);
  while (__stlxr(0, v1));
  if (v3 != v2) {
    _os_nospin_lock_unlock_slow((uint64_t)v1, v3);
  }
}

unint64_t *__os_once_reset(unint64_t *result)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v2 = __ldxr(result);
  while (__stlxr(0LL, result));
  if (v1 != v2) {
    return (unint64_t *)_os_once_gate_broadcast((uint64_t)result, v2, v1);
  }
  return result;
}

uint64_t _os_once_gate_broadcast(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result = a2 | 1;
  if ((_DWORD)result != a3) {
    _os_once_gate_unowned_abort(result);
  }
  if ((a2 & 1) != 0)
  {
    uint64_t v4 = a2;
    qword_18C51C380 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
    qword_18C51C3B0 = a2;
    __break(1u);
LABEL_9:
    qword_18C51C380 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
    qword_18C51C3B0 = v4;
    __break(1u);
  }

  else
  {
    while (1)
    {
      uint64_t result = __ulock_wake();
      if ((result & 0x80000000) == 0) {
        break;
      }
      if ((_DWORD)result != -4)
      {
        uint64_t v4 = -(int)result;
        if ((_DWORD)v4 != 2) {
          goto LABEL_9;
        }
        return result;
      }
    }
  }

  return result;
}

unint64_t *_os_once(unint64_t *result, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  unint64_t v3 = atomic_load(result);
  if ((v3 & 3) == 1)
  {
    if (4LL * MEMORY[0xFFFFFC180] - v3 - 15 <= 0xFFFFFFFFFFFFFFEFLL) {
      *uint64_t result = -1LL;
    }
  }

  else
  {
    uint64_t v4 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    while (!__ldaxr(result))
    {
    }

    __clrex();
    return (unint64_t *)_os_once_gate_wait((uint64_t)result, a2, a3, v4);
  }

  return result;
}

uint64_t _os_once_callout(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), int a4)
{
  uint64_t result = a3(a2);
  unint64_t v7 = (4LL * MEMORY[0xFFFFFC180]) | 1;
  do
    unsigned int v8 = __ldxr(a1);
  while (__stlxr(v7, a1));
  if (v8 != a4) {
    return _os_once_gate_broadcast((uint64_t)a1, v8, a4);
  }
  return result;
}

uint64_t _os_once_gate_wait(uint64_t result, uint64_t a2, uint64_t (*a3)(uint64_t), unsigned int a4)
{
  unint64_t v4 = __ldxr((unint64_t *)result);
  if (v4 == -1LL)
  {
LABEL_19:
    __clrex();
    return result;
  }

  unsigned int v8 = (unint64_t *)result;
  unint64_t v9 = a4;
  while ((v4 & 3) != 1)
  {
    if (v4)
    {
      if ((v4 & 0xFFFFFFFFFFFFFFFELL) == v4)
      {
        __clrex();
      }

      else if (__stxr(v4 & 0xFFFFFFFFFFFFFFFELL, v8))
      {
        goto LABEL_12;
      }

      uint64_t result = __ulock_wait();
      if ((result & 0x80000000) != 0 && (_DWORD)result != -4 && -(int)result != 14)
      {
        qword_18C51C380 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait failure";
        qword_18C51C3B0 = -(int)result;
        __break(1u);
        return result;
      }
    }

    else if (!__stxr(v9, v8))
    {
      __dmb(9u);
      return _os_once_callout(v8, a2, a3, a4);
    }

LABEL_12:
    unint64_t v4 = __ldxr(v8);
    if (v4 == -1LL) {
      goto LABEL_19;
    }
  }

  __clrex();
  __dmb(9u);
  if (4LL * MEMORY[0xFFFFFC180] - v4 - 15 <= 0xFFFFFFFFFFFFFFEFLL) {
    *unsigned int v8 = -1LL;
  }
  return result;
}

uint64_t os_sync_wait_on_address_with_deadline( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    int v6 = 22;
    if (a6 && a5 == 32)
    {
      uint64_t result = __ulock_wait2();
      if ((result & 0x80000000) == 0) {
        return result;
      }
      int v6 = -(int)result;
    }
  }

  else
  {
    int v6 = 22;
  }

  *__error() = v6;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wait_on_address_with_timeout( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    int v6 = 22;
    if (a6 && a5 == 32)
    {
      uint64_t result = __ulock_wait2();
      if ((result & 0x80000000) == 0) {
        return result;
      }
      int v6 = -(int)result;
    }
  }

  else
  {
    int v6 = 22;
  }

  *__error() = v6;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wait_on_address(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    uint64_t result = __ulock_wait2();
    if ((result & 0x80000000) == 0) {
      return result;
    }
    int v5 = -(int)result;
  }

  else
  {
    int v5 = 22;
  }

  *__error() = v5;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wake_by_address_any(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 <= 1 && (a2 == 8 || a2 == 4))
  {
    uint64_t result = __ulock_wake();
    if ((result & 0x80000000) == 0) {
      return result;
    }
    int v4 = -(int)result;
  }

  else
  {
    int v4 = 22;
  }

  *__error() = v4;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wake_by_address_all(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 <= 1 && (a2 == 8 || a2 == 4))
  {
    uint64_t result = __ulock_wake();
    if ((result & 0x80000000) == 0) {
      return result;
    }
    int v4 = -(int)result;
  }

  else
  {
    int v4 = 22;
  }

  *__error() = v4;
  return 0xFFFFFFFFLL;
}

unint64_t _os_alloc_once(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  _os_once(a1, (uint64_t)v5, _os_alloc);
  return a1[1];
}

uint64_t _os_alloc(uint64_t a1)
{
  int v1 = (void *)MEMORY[0x189600148];
  uint64_t v2 = (*(_DWORD *)(a1 + 8) + 15) & 0xFFFFFFF0;
  int v4 = (unint64_t *)_os_alloc_heap;
  if (!_os_alloc_heap) {
    goto LABEL_5;
  }
  do
    unint64_t v5 = __ldxr(v4);
  while (__stxr(v5 + v2, v4));
  if (v5 + v2 <= 2LL * *v1 - 16) {
    uint64_t result = (uint64_t)v4 + v5 + 16;
  }
  else {
LABEL_5:
  }
    uint64_t result = _os_alloc_slow(v4, v2);
  *(void *)(*(void *)a1 + 8LL) = result;
  unint64_t v7 = *(uint64_t (**)(void))(a1 + 16);
  if (v7) {
    return v7();
  }
  return result;
}

uint64_t _os_alloc_slow(unint64_t *a1, uint64_t a2)
{
  int v4 = (mach_vm_address_t *)MEMORY[0x189600148];
  unint64_t v5 = (vm_map_t *)MEMORY[0x1895FFD48];
  mach_vm_address_t v6 = *MEMORY[0x189600148];
  while (1)
  {
    mach_vm_address_t address = v6;
    uint64_t result = mach_vm_map(*v5, &address, 2 * v6, 0LL, 1224736769, 0, 0LL, 0, 3, 7, 1u);
    if ((_DWORD)result) {
      break;
    }
    mach_vm_address_t v8 = address;
    while (1)
    {
      unint64_t v9 = __ldxr((unint64_t *)&_os_alloc_heap);
      if (!__stxr(v8, (unint64_t *)&_os_alloc_heap))
      {
        *(void *)(v8 + 8) = a1;
        a1 = (unint64_t *)v8;
        goto LABEL_8;
      }
    }

    __clrex();
    mach_vm_deallocate(*v5, v8, 2 * *v4);
    a1 = (unint64_t *)_os_alloc_heap;
    if (!_os_alloc_heap)
    {
      mach_vm_address_t v6 = *v4;
      continue;
    }

    do
LABEL_8:
      unint64_t v10 = __ldxr(a1);
    while (__stxr(v10 + a2, a1));
    mach_vm_address_t v6 = *v4;
    if (v10 + a2 <= 2 * *v4 - 16) {
      return (uint64_t)a1 + v10 + 16;
    }
  }

  qword_18C51C380 = (uint64_t)"BUG IN LIBPLATFORM: Failed to allocate in os_alloc_once";
  qword_18C51C3B0 = (int)result;
  __break(1u);
  return result;
}

uint64_t _os_semaphore_create()
{
  kern_return_t v0;
  semaphore_t semaphore;
  unint64_t v0 = semaphore_create(*MEMORY[0x1895FFD48], &semaphore, 0, 0);
  if (v0)
  {
    if (v0 == -301) {
      _os_semaphore_create_cold_2();
    }
    _os_semaphore_create_cold_1(v0);
  }

  return semaphore;
}

uint64_t _os_semaphore_dispose(semaphore_t semaphore)
{
  uint64_t result = semaphore_destroy(*MEMORY[0x1895FFD48], semaphore);
  if ((_DWORD)result) {
    _os_semaphore_dispose_cold_1(result);
  }
  return result;
}

uint64_t _os_semaphore_signal()
{
  uint64_t result = MEMORY[0x186DFABF0]();
  if ((_DWORD)result) {
    _os_semaphore_signal_cold_1(result);
  }
  return result;
}

uint64_t _os_semaphore_wait(uint64_t a1)
{
  while (1)
  {
    uint64_t result = MEMORY[0x186DFABFC](a1);
    if (!(_DWORD)result) {
      break;
    }
    if ((_DWORD)result != 14) {
      _os_semaphore_wait_cold_1(result);
    }
  }

  return result;
}

int32_t OSAtomicAdd32(int32_t __theAmount, int32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldxr((unsigned int *)__theValue);
    unsigned int v3 = v2 + __theAmount;
  }

  while (__stxr(v3, (unsigned int *)__theValue));
  return v3;
}

int32_t OSAtomicAdd32Barrier(int32_t __theAmount, int32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldaxr((unsigned int *)__theValue);
    unsigned int v3 = v2 + __theAmount;
  }

  while (__stlxr(v3, (unsigned int *)__theValue));
  return v3;
}

int32_t OSAtomicIncrement32(int32_t *__theValue)
{
  do
  {
    unsigned int v1 = __ldxr((unsigned int *)__theValue);
    unsigned int v2 = v1 + 1;
  }

  while (__stxr(v2, (unsigned int *)__theValue));
  return v2;
}

int32_t OSAtomicIncrement32Barrier(int32_t *__theValue)
{
  do
  {
    unsigned int v1 = __ldaxr((unsigned int *)__theValue);
    unsigned int v2 = v1 + 1;
  }

  while (__stlxr(v2, (unsigned int *)__theValue));
  return v2;
}

int32_t OSAtomicDecrement32(int32_t *__theValue)
{
  do
  {
    unsigned int v1 = __ldxr((unsigned int *)__theValue);
    unsigned int v2 = v1 - 1;
  }

  while (__stxr(v2, (unsigned int *)__theValue));
  return v2;
}

int32_t OSAtomicDecrement32Barrier(int32_t *__theValue)
{
  do
  {
    unsigned int v1 = __ldaxr((unsigned int *)__theValue);
    unsigned int v2 = v1 - 1;
  }

  while (__stlxr(v2, (unsigned int *)__theValue));
  return v2;
}

int64_t OSAtomicAdd64(int64_t __theAmount, OSAtomic_int64_aligned64_t *__theValue)
{
  do
  {
    unint64_t v2 = __ldxr((unint64_t *)__theValue);
    unint64_t v3 = v2 + __theAmount;
  }

  while (__stxr(v3, (unint64_t *)__theValue));
  return v3;
}

int64_t OSAtomicAdd64Barrier(int64_t __theAmount, OSAtomic_int64_aligned64_t *__theValue)
{
  do
  {
    unint64_t v2 = __ldaxr((unint64_t *)__theValue);
    unint64_t v3 = v2 + __theAmount;
  }

  while (__stlxr(v3, (unint64_t *)__theValue));
  return v3;
}

int64_t OSAtomicIncrement64(OSAtomic_int64_aligned64_t *__theValue)
{
  do
  {
    unint64_t v1 = __ldxr((unint64_t *)__theValue);
    unint64_t v2 = v1 + 1;
  }

  while (__stxr(v2, (unint64_t *)__theValue));
  return v2;
}

int64_t OSAtomicIncrement64Barrier(OSAtomic_int64_aligned64_t *__theValue)
{
  do
  {
    unint64_t v1 = __ldaxr((unint64_t *)__theValue);
    unint64_t v2 = v1 + 1;
  }

  while (__stlxr(v2, (unint64_t *)__theValue));
  return v2;
}

int64_t OSAtomicDecrement64(OSAtomic_int64_aligned64_t *__theValue)
{
  do
  {
    unint64_t v1 = __ldxr((unint64_t *)__theValue);
    unint64_t v2 = v1 - 1;
  }

  while (__stxr(v2, (unint64_t *)__theValue));
  return v2;
}

int64_t OSAtomicDecrement64Barrier(OSAtomic_int64_aligned64_t *__theValue)
{
  do
  {
    unint64_t v1 = __ldaxr((unint64_t *)__theValue);
    unint64_t v2 = v1 - 1;
  }

  while (__stlxr(v2, (unint64_t *)__theValue));
  return v2;
}

int32_t OSAtomicAnd32(uint32_t __theMask, uint32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldxr(__theValue);
    uint32_t v3 = v2 & __theMask;
  }

  while (__stxr(v3, __theValue));
  return v3;
}

int32_t OSAtomicAnd32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldaxr(__theValue);
    uint32_t v3 = v2 & __theMask;
  }

  while (__stlxr(v3, __theValue));
  return v3;
}

int32_t OSAtomicAnd32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  do
    int32_t v2 = __ldxr(__theValue);
  while (__stxr(v2 & __theMask, __theValue));
  return v2;
}

int32_t OSAtomicAnd32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  do
    int32_t v2 = __ldaxr(__theValue);
  while (__stlxr(v2 & __theMask, __theValue));
  return v2;
}

int32_t OSAtomicOr32(uint32_t __theMask, uint32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldxr(__theValue);
    uint32_t v3 = v2 | __theMask;
  }

  while (__stxr(v3, __theValue));
  return v3;
}

int32_t OSAtomicOr32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldaxr(__theValue);
    uint32_t v3 = v2 | __theMask;
  }

  while (__stlxr(v3, __theValue));
  return v3;
}

int32_t OSAtomicOr32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  do
    int32_t v2 = __ldxr(__theValue);
  while (__stxr(v2 | __theMask, __theValue));
  return v2;
}

int32_t OSAtomicOr32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  do
    int32_t v2 = __ldaxr(__theValue);
  while (__stlxr(v2 | __theMask, __theValue));
  return v2;
}

int32_t OSAtomicXor32(uint32_t __theMask, uint32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldxr(__theValue);
    uint32_t v3 = v2 ^ __theMask;
  }

  while (__stxr(v3, __theValue));
  return v3;
}

int32_t OSAtomicXor32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  do
  {
    unsigned int v2 = __ldaxr(__theValue);
    uint32_t v3 = v2 ^ __theMask;
  }

  while (__stlxr(v3, __theValue));
  return v3;
}

int32_t OSAtomicXor32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  do
    int32_t v2 = __ldxr(__theValue);
  while (__stxr(v2 ^ __theMask, __theValue));
  return v2;
}

int32_t OSAtomicXor32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  do
    int32_t v2 = __ldaxr(__theValue);
  while (__stlxr(v2 ^ __theMask, __theValue));
  return v2;
}

BOOL OSAtomicCompareAndSwap32(int32_t __oldValue, int32_t __newValue, int32_t *__theValue)
{
  while (1)
  {
    unsigned int v3 = __ldxr((unsigned int *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwap32Barrier(int32_t __oldValue, int32_t __newValue, int32_t *__theValue)
{
  while (1)
  {
    unsigned int v3 = __ldaxr((unsigned int *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwapPtr(void *__oldValue, void *__newValue, void **__theValue)
{
  while (1)
  {
    unsigned int v3 = (void *)__ldxr((unint64_t *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwapPtrBarrier(void *__oldValue, void *__newValue, void **__theValue)
{
  while (1)
  {
    unsigned int v3 = (void *)__ldaxr((unint64_t *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwapInt(int __oldValue, int __newValue, int *__theValue)
{
  while (1)
  {
    unsigned int v3 = __ldxr((unsigned int *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwapIntBarrier(int __oldValue, int __newValue, int *__theValue)
{
  while (1)
  {
    unsigned int v3 = __ldaxr((unsigned int *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwapLong(uint64_t __oldValue, uint64_t __newValue, uint64_t *__theValue)
{
  while (1)
  {
    unint64_t v3 = __ldxr((unint64_t *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwapLongBarrier(uint64_t __oldValue, uint64_t __newValue, uint64_t *__theValue)
{
  while (1)
  {
    unint64_t v3 = __ldaxr((unint64_t *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwap64(int64_t __oldValue, int64_t __newValue, OSAtomic_int64_aligned64_t *__theValue)
{
  while (1)
  {
    unint64_t v3 = __ldxr((unint64_t *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicCompareAndSwap64Barrier( int64_t __oldValue, int64_t __newValue, OSAtomic_int64_aligned64_t *__theValue)
{
  while (1)
  {
    unint64_t v3 = __ldaxr((unint64_t *)__theValue);
    if (v3 != __oldValue) {
      break;
    }
  }

  BOOL result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicTestAndSet(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  uint32_t v3 = __n + 8 * (__theAddress & 3);
  unsigned int v4 = 0x80u >> (__n & 7) << (v3 & 0x18);
  unint64_t v5 = (unsigned int *)(v2 + ((v3 >> 3) & 0x1FFFFFFC));
  do
    unsigned int v6 = __ldxr(v5);
  while (__stxr(v6 | v4, v5));
  return (v6 & v4) != 0;
}

BOOL OSAtomicTestAndSetBarrier(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  uint32_t v3 = __n + 8 * (__theAddress & 3);
  unsigned int v4 = 0x80u >> (__n & 7) << (v3 & 0x18);
  unint64_t v5 = (unsigned int *)(v2 + ((v3 >> 3) & 0x1FFFFFFC));
  do
    unsigned int v6 = __ldaxr(v5);
  while (__stlxr(v6 | v4, v5));
  return (v6 & v4) != 0;
}

BOOL OSAtomicTestAndClear(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  uint32_t v3 = __n + 8 * (__theAddress & 3);
  unsigned int v4 = 0x80u >> (__n & 7) << (v3 & 0x18);
  unint64_t v5 = (unsigned int *)(v2 + ((v3 >> 3) & 0x1FFFFFFC));
  do
    unsigned int v6 = __ldxr(v5);
  while (__stxr(v6 & ~v4, v5));
  return (v6 & v4) != 0;
}

BOOL OSAtomicTestAndClearBarrier(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  uint32_t v3 = __n + 8 * (__theAddress & 3);
  unsigned int v4 = 0x80u >> (__n & 7) << (v3 & 0x18);
  unint64_t v5 = (unsigned int *)(v2 + ((v3 >> 3) & 0x1FFFFFFC));
  do
    unsigned int v6 = __ldaxr(v5);
  while (__stlxr(v6 & ~v4, v5));
  return (v6 & v4) != 0;
}

void OSAtomicEnqueue(OSQueueHead *__list, void *__new, size_t a3)
{
  opaque1 = __list->opaque1;
  do
  {
    do
    {
      *(void *)((char *)__new + a3) = opaque1;
      unint64_t v4 = __ldxr((unint64_t *)__list);
      BOOL v5 = opaque1 == (void *)v4;
      opaque1 = (void *)v4;
    }

    while (!v5);
    opaque1 = (void *)v4;
  }

  while (__stlxr((unint64_t)__new, (unint64_t *)__list));
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  while (1)
  {
    BOOL result = (void *)__ldaxr((unint64_t *)__list);
    if (!result) {
      break;
    }
  }

  __clrex();
  return result;
}

void OSMemoryBarrier(void)
{
}

uint64_t _sigunaltstack()
{
  return __sigreturn();
}

void _sigtramp( void (*a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __in_sigtramp = a3;
  a1(a3, a4, a5);
  __in_sigtramp = 0;
  __sigreturn();
  __break(1u);
}

uint64_t __platform_sigaction(int a1)
{
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

int _setjmp(jmp_buf a1)
{
  uint64_t v21 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 56);
  *(void *)a1 = v1;
  *((void *)a1 + 1) = v2;
  *((void *)a1 + 2) = v3;
  *((void *)a1 + 3) = v4;
  *((void *)a1 + 4) = v5;
  *((void *)a1 + 5) = v6;
  *((void *)a1 + 6) = v7;
  *((void *)a1 + 7) = v8;
  *((void *)a1 + 8) = v9;
  *((void *)a1 + 9) = v10;
  *((void *)a1 + 10) = v11 ^ v21;
  *((void *)a1 + 11) = v12 ^ v21;
  *((void *)a1 + 12) = (unint64_t)&v23 ^ v21;
  *((void *)a1 + 14) = v13;
  *((void *)a1 + 15) = v14;
  *((void *)a1 + 16) = v15;
  *((void *)a1 + 17) = v16;
  *((void *)a1 + 18) = v17;
  *((void *)a1 + 19) = v18;
  *((void *)a1 + 20) = v19;
  *((void *)a1 + 21) = v20;
  return 0;
}

void _longjmp(jmp_buf a1, int a2)
{
}

int sigsetjmp(sigjmp_buf a1, int a2)
{
  a1[46] = a2;
  if (a2) {
    return setjmp(a1);
  }
  else {
    return _setjmp(a1);
  }
}

int setjmp(jmp_buf a1)
{
  *(void *)a1 = v1;
  *((void *)a1 + 1) = v2;
  sigprocmask(1, 0LL, (sigset_t *)a1 + 44);
  __sigaltstack();
  a1[47] = v5;
  return _setjmp(a1);
}

void siglongjmp(sigjmp_buf a1, int a2)
{
  if (!a1[46]) {
    _longjmp(a1, a2);
  }
  longjmp(a1, a2);
}

void longjmp(jmp_buf a1, int a2)
{
  *(void *)uint64_t v4 = *((void *)a1 + 22);
  sigprocmask(3, v4, 0LL);
  _sigunaltstack();
  _longjmp(a1, a2);
}

int8x16_t *_platform_strstr(int8x16_t *a1, _BYTE *a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = (int8x16_t *)(a2 + 1);
  int v4 = *a2;
  if (!*a2) {
    return a1;
  }
  unint64_t v5 = _platform_strlen((uint64_t)(a2 + 1));
  while (1)
  {
    int v6 = v2->u8[0];
    if (!v2->i8[0]) {
      break;
    }
    uint64_t v7 = v2;
    uint64_t v2 = (int8x16_t *)((char *)v2 + 1);
  }

  return 0LL;
}

uint64_t *_platform_strcpy(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = _platform_strlen((uint64_t)a2);
  _platform_memmove(a1, a2, v4 + 1);
  return a1;
}

unint64_t _platform_strlcpy(uint64_t *a1, uint64_t *a2, unint64_t a3)
{
  unint64_t v6 = _platform_strlen((uint64_t)a2);
  unint64_t v7 = v6;
  if (v6 >= a3)
  {
    if (a3)
    {
      unint64_t v8 = a3 - 1;
      _platform_memmove(a1, a2, v8);
      *((_BYTE *)a1 + v8) = 0;
    }
  }

  else
  {
    _platform_memmove(a1, a2, v6 + 1);
  }

  return v7;
}

char *_platform_memccpy(uint64_t *a1, uint64_t *a2, unsigned int a3, unint64_t a4)
{
  if (!a4) {
    return 0LL;
  }
  unint64_t v7 = _platform_memchr((uint64_t)a2, a3, a4);
  if (v7)
  {
    unint64_t v8 = v7 - (void)a2 + 1;
    _platform_memmove(a1, a2, v8);
    return (char *)a1 + v8;
  }

  else
  {
    _platform_memmove(a1, a2, a4);
    return 0LL;
  }

uint64_t *_platform_strncpy(uint64_t *a1, uint64_t *a2, unint64_t a3)
{
  unint64_t v6 = _platform_strnlen((uint64_t)a2, a3);
  unint64_t v7 = a3 - v6;
  if (a3 <= v6)
  {
    _platform_memmove(a1, a2, a3);
  }

  else
  {
    unint64_t v8 = v6;
    _platform_memmove(a1, a2, v6);
    _platform_memset((uint64_t *)((char *)a1 + v8), 0, v7);
  }

  return a1;
}

unint64_t _platform_strlcat(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v6 = _platform_strlen((uint64_t)a2);
  unint64_t v7 = _platform_strnlen(a1, a3);
  unint64_t v8 = a3 - v7;
  if (a3 == v7)
  {
    unint64_t v9 = a3;
  }

  else
  {
    unint64_t v9 = v7;
    uint64_t v10 = (uint64_t *)(a1 + v7);
    if (v6 >= v8)
    {
      _platform_memmove(v10, a2, v8 - 1);
      *(_BYTE *)(a3 + a1 - 1) = 0;
    }

    else
    {
      _platform_memmove(v10, a2, v6 + 1);
    }
  }

  return v9 + v6;
}

uint64_t sub_1803C0FC8()
{
  return 0LL;
}

uint64_t *_platform_memmove(uint64_t *result, uint64_t *a2, unint64_t a3)
{
  if ((char *)result - (char *)a2 < a3)
  {
    if (result != a2)
    {
      char v46 = (char *)result + a3;
      char v47 = (char *)a2 + a3;
      if (a3 < 0x40)
      {
        while (1)
        {
          BOOL v43 = a3 >= 8;
          a3 -= 8LL;
          if (!v43) {
            break;
          }
          uint64_t v70 = *((void *)v47 - 1);
          v47 -= 8;
          *((void *)v46 - 1) = v70;
          v46 -= 8;
        }

        for (unint64_t i = a3 + 8; i; --i)
        {
          char v72 = *--v47;
          *--char v46 = v72;
        }
      }

      else
      {
        if (a3 < 0x4000)
        {
          uint64_t v65 = *((void *)v47 - 2);
          uint64_t v66 = *((void *)v47 - 1);
          uint64_t v67 = *((void *)v47 - 4);
          uint64_t v68 = *((void *)v47 - 3);
          unint64_t v52 = (unint64_t)(v46 - 1) & 0xFFFFFFFFFFFFFFE0LL;
          uint64_t v69 = v47 - &v46[-v52];
          uint64_t v54 = *(void *)(v69 - 16);
          uint64_t v55 = *(void *)(v69 - 8);
          uint64_t v56 = *(void *)(v69 - 32);
          uint64_t v57 = *(void *)(v69 - 24);
          *((void *)v46 - 2) = v65;
          *((void *)v46 - 1) = v66;
          *((void *)v46 - 4) = v67;
          *((void *)v46 - 3) = v68;
          uint64_t v58 = v69 - 32;
          unint64_t v59 = v52 - (void)result - 64;
          if (v52 - (unint64_t)result > 0x40)
          {
            do
            {
              *(void *)(v52 - 16) = v54;
              *(void *)(v52 - 8) = v55;
              *(void *)(v52 - 32) = v56;
              *(void *)(v52 - 24) = v57;
              v52 -= 32LL;
              uint64_t v54 = *(void *)(v58 - 16);
              uint64_t v55 = *(void *)(v58 - 8);
              uint64_t v56 = *(void *)(v58 - 32);
              uint64_t v57 = *(void *)(v58 - 24);
              v58 -= 32LL;
              BOOL v16 = v59 > 0x20;
              v59 -= 32LL;
            }

            while (v16);
          }
        }

        else
        {
          uint64_t v48 = *((void *)v47 - 2);
          uint64_t v49 = *((void *)v47 - 1);
          uint64_t v50 = *((void *)v47 - 4);
          uint64_t v51 = *((void *)v47 - 3);
          unint64_t v52 = (unint64_t)(v46 - 1) & 0xFFFFFFFFFFFFFFE0LL;
          uint64_t v53 = v47 - &v46[-v52];
          uint64_t v54 = *(void *)(v53 - 16);
          uint64_t v55 = *(void *)(v53 - 8);
          uint64_t v56 = *(void *)(v53 - 32);
          uint64_t v57 = *(void *)(v53 - 24);
          *((void *)v46 - 2) = v48;
          *((void *)v46 - 1) = v49;
          *((void *)v46 - 4) = v50;
          *((void *)v46 - 3) = v51;
          uint64_t v58 = v53 - 32;
          unint64_t v59 = v52 - (void)result - 64;
          if (v52 - (unint64_t)result > 0x40)
          {
            do
            {
              *(void *)(v52 - 16) = v54;
              *(void *)(v52 - 8) = v55;
              *(void *)(v52 - 32) = v56;
              *(void *)(v52 - 24) = v57;
              v52 -= 32LL;
              uint64_t v54 = *(void *)(v58 - 16);
              uint64_t v55 = *(void *)(v58 - 8);
              uint64_t v56 = *(void *)(v58 - 32);
              uint64_t v57 = *(void *)(v58 - 24);
              v58 -= 32LL;
              BOOL v16 = v59 > 0x20;
              v59 -= 32LL;
            }

            while (v16);
          }
        }

        uint64_t v60 = v58 - v59;
        uint64_t v61 = *(void *)(v60 - 16);
        uint64_t v62 = *(void *)(v60 - 8);
        uint64_t v63 = *(void *)(v60 - 32);
        uint64_t v64 = *(void *)(v60 - 24);
        *(void *)(v52 - 16) = v54;
        *(void *)(v52 - 8) = v55;
        *(void *)(v52 - 32) = v56;
        *(void *)(v52 - 24) = v57;
        result[2] = v61;
        result[3] = v62;
        *BOOL result = v63;
        result[1] = v64;
      }
    }
  }

  else
  {
    uint64_t v3 = result;
    if (a3 < 0x40)
    {
      while (1)
      {
        BOOL v43 = a3 >= 8;
        a3 -= 8LL;
        if (!v43) {
          break;
        }
        uint64_t v42 = *a2++;
        *v3++ = v42;
      }

      for (unint64_t j = a3 + 8; j; --j)
      {
        char v45 = *(_BYTE *)a2;
        a2 = (uint64_t *)((char *)a2 + 1);
        *(_BYTE *)uint64_t v3 = v45;
        uint64_t v3 = (uint64_t *)((char *)v3 + 1);
      }
    }

    else
    {
      if ((char *)a2 - (char *)result < a3)
      {
        if (a3 < 0x4000)
        {
          unint64_t v4 = (char *)((unint64_t)(result + 4) & 0xFFFFFFFFFFFFFFE0LL);
          uint64_t v30 = *a2;
          uint64_t v31 = a2[1];
          uint64_t v32 = a2[2];
          uint64_t v33 = a2[3];
          unsigned __int8 v34 = (uint64_t *)((char *)a2 + v4 - (char *)result);
          uint64_t v10 = *v34;
          uint64_t v11 = v34[1];
          uint64_t v12 = v34[2];
          uint64_t v13 = v34[3];
          uint64_t v14 = v34 + 4;
          unint64_t v35 = a3 - (v4 - (char *)result);
          *BOOL result = v30;
          result[1] = v31;
          result[2] = v32;
          result[3] = v33;
          BOOL v16 = v35 > 0x40;
          for (unint64_t k = v35 - 64; v16; k -= 32LL)
          {
            *(void *)unint64_t v4 = v10;
            *((void *)v4 + 1) = v11;
            *((void *)v4 + 2) = v12;
            *((void *)v4 + 3) = v13;
            v4 += 32;
            uint64_t v10 = *v14;
            uint64_t v11 = v14[1];
            uint64_t v12 = v14[2];
            uint64_t v13 = v14[3];
            v14 += 4;
            BOOL v16 = k > 0x20;
          }
        }

        else
        {
          unint64_t v4 = (char *)((unint64_t)(result + 4) & 0xFFFFFFFFFFFFFFE0LL);
          uint64_t v24 = *a2;
          uint64_t v25 = a2[1];
          uint64_t v26 = a2[2];
          uint64_t v27 = a2[3];
          int v28 = (uint64_t *)((char *)a2 + v4 - (char *)result);
          uint64_t v10 = *v28;
          uint64_t v11 = v28[1];
          uint64_t v12 = v28[2];
          uint64_t v13 = v28[3];
          uint64_t v14 = v28 + 4;
          unint64_t v29 = a3 - (v4 - (char *)result);
          *BOOL result = v24;
          result[1] = v25;
          result[2] = v26;
          result[3] = v27;
          BOOL v16 = v29 > 0x40;
          for (unint64_t k = v29 - 64; v16; k -= 32LL)
          {
            *(void *)unint64_t v4 = v10;
            *((void *)v4 + 1) = v11;
            *((void *)v4 + 2) = v12;
            *((void *)v4 + 3) = v13;
            v4 += 32;
            uint64_t v10 = *v14;
            uint64_t v11 = v14[1];
            uint64_t v12 = v14[2];
            uint64_t v13 = v14[3];
            v14 += 4;
            BOOL v16 = k > 0x20;
          }
        }
      }

      else if (a3 < 0x4000)
      {
        unint64_t v4 = (char *)((unint64_t)(result + 4) & 0xFFFFFFFFFFFFFFE0LL);
        uint64_t v18 = *a2;
        uint64_t v19 = a2[1];
        uint64_t v20 = a2[2];
        uint64_t v21 = a2[3];
        unsigned __int8 v22 = (uint64_t *)((char *)a2 + v4 - (char *)result);
        uint64_t v10 = *v22;
        uint64_t v11 = v22[1];
        uint64_t v12 = v22[2];
        uint64_t v13 = v22[3];
        uint64_t v14 = v22 + 4;
        unint64_t v23 = a3 - (v4 - (char *)result);
        *BOOL result = v18;
        result[1] = v19;
        result[2] = v20;
        result[3] = v21;
        BOOL v16 = v23 > 0x40;
        for (unint64_t k = v23 - 64; v16; k -= 32LL)
        {
          *(void *)unint64_t v4 = v10;
          *((void *)v4 + 1) = v11;
          *((void *)v4 + 2) = v12;
          *((void *)v4 + 3) = v13;
          v4 += 32;
          uint64_t v10 = *v14;
          uint64_t v11 = v14[1];
          uint64_t v12 = v14[2];
          uint64_t v13 = v14[3];
          v14 += 4;
          BOOL v16 = k > 0x20;
        }
      }

      else
      {
        unint64_t v4 = (char *)((unint64_t)(result + 4) & 0xFFFFFFFFFFFFFFE0LL);
        uint64_t v5 = *a2;
        uint64_t v6 = a2[1];
        uint64_t v7 = a2[2];
        uint64_t v8 = a2[3];
        unint64_t v9 = (uint64_t *)((char *)a2 + v4 - (char *)result);
        uint64_t v10 = *v9;
        uint64_t v11 = v9[1];
        uint64_t v12 = v9[2];
        uint64_t v13 = v9[3];
        uint64_t v14 = v9 + 4;
        unint64_t v15 = a3 - (v4 - (char *)result);
        *BOOL result = v5;
        result[1] = v6;
        result[2] = v7;
        result[3] = v8;
        BOOL v16 = v15 > 0x40;
        for (unint64_t k = v15 - 64; v16; k -= 32LL)
        {
          *(void *)unint64_t v4 = v10;
          *((void *)v4 + 1) = v11;
          *((void *)v4 + 2) = v12;
          *((void *)v4 + 3) = v13;
          v4 += 32;
          uint64_t v10 = *v14;
          uint64_t v11 = v14[1];
          uint64_t v12 = v14[2];
          uint64_t v13 = v14[3];
          v14 += 4;
          BOOL v16 = k > 0x20;
        }
      }

      char v36 = (uint64_t *)((char *)v14 + k);
      uint64_t v37 = *v36;
      uint64_t v38 = v36[1];
      uint64_t v39 = v36[2];
      uint64_t v40 = v36[3];
      *(void *)unint64_t v4 = v10;
      *((void *)v4 + 1) = v11;
      *((void *)v4 + 2) = v12;
      *((void *)v4 + 3) = v13;
      char v41 = &v4[k];
      *((void *)v41 + 4) = v37;
      *((void *)v41 + 5) = v38;
      *((void *)v41 + 6) = v39;
      *((void *)v41 + 7) = v40;
    }
  }

  return result;
}

unint64_t _platform_strcmp(int8x16_t *a1, int8x16_t *a2)
{
  while ((a1 & 0xF) != 0)
  {
    unsigned int v3 = a1->u8[0];
    a1 = (int8x16_t *)((char *)a1 + 1);
    uint64_t v2 = v3;
    unsigned int v4 = a2->u8[0];
    a2 = (int8x16_t *)((char *)a2 + 1);
    uint64_t v5 = v2 - v4;
    if (v2 != v4 || (_DWORD)v2 == 0) {
      return v5;
    }
  }

  if ((a2 & 0xF) != 0)
  {
    uint64_t v8 = -(uint64_t)a2 & 0xFF0;
    if (!v8) {
      goto LABEL_12;
    }
LABEL_10:
    while (1)
    {
      int8x16_t v9 = *a1++;
      int8x16_t v10 = v9;
      int8x16_t v11 = *a2++;
      int8x16_t v13 = vceqq_s8(v10, v11);
      uint8x16_t v12 = (uint8x16_t)vandq_s8(v10, v13);
      v13.i8[0] = vminvq_u8(v12);
      if (!v13.i32[0]) {
        break;
      }
      v8 -= 16LL;
      if (!v8)
      {
LABEL_12:
        while (1)
        {
          unsigned int v15 = a1->u8[0];
          a1 = (int8x16_t *)((char *)a1 + 1);
          uint64_t v14 = v15;
          unsigned int v16 = a2->u8[0];
          a2 = (int8x16_t *)((char *)a2 + 1);
          uint64_t v5 = v14 - v16;
          if (v14 != v16 || (_DWORD)v14 == 0) {
            return v5;
          }
          if ((a1 & 0xF) == 0)
          {
            uint64_t v8 = 4080LL;
            goto LABEL_10;
          }
        }
      }
    }
  }

  else
  {
    do
    {
      int8x16_t v18 = *a1++;
      int8x16_t v19 = v18;
      int8x16_t v20 = *a2++;
      int8x16_t v13 = vceqq_s8(v19, v20);
      uint8x16_t v12 = (uint8x16_t)vandq_s8(v19, v13);
      v13.i8[0] = vminvq_u8(v12);
    }

    while (v13.i32[0]);
  }

  uint8x16_t v21 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v12, (uint8x16_t)veorq_s8(v13, v13)), (int8x16_t)xmmword_1803C1540);
  v21.i8[0] = vminvq_u8(v21);
  return a1[-1].u8[v21.u32[0]] - (unint64_t)a2[-1].u8[v21.u32[0]];
}

int ffs(int a1)
{
  return 32 - __clz(a1 & -a1);
}

int ffsll(uint64_t a1)
{
  return 64 - __clz(a1 & -a1);
}

int fls(int a1)
{
  return 32 - __clz(a1);
}

int flsll(uint64_t a1)
{
  return 64 - __clz(a1);
}

unint64_t _platform_memchr(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a3) {
    return 0LL;
  }
  if (a3 < 0)
  {
    int8x16_t v13 = vdupq_n_s8(a2);
    uint64_t v14 = a1 & 0xF;
    unint64_t v15 = a1 & 0xFFFFFFFFFFFFFFF0LL;
    int8x16_t v16 = *(int8x16_t *)&algn_1803C1690[-v14];
    for (uint8x16_t i = (uint8x16_t)vorrq_s8(vsubq_s8(*(int8x16_t *)v15, v13), v16); ; uint8x16_t i = (uint8x16_t)vsubq_s8(v18, v13))
    {
      v16.i8[0] = vminvq_u8(i);
      if (!v16.i32[0]) {
        break;
      }
      int8x16_t v18 = *(int8x16_t *)(v15 + 16);
      v15 += 16LL;
    }

    uint8x16_t v19 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, (uint8x16_t)veorq_s8(v13, v13)), (int8x16_t)xmmword_1803C1680);
    v19.i8[0] = vminvq_u8(v19);
    return v15 + v19.u32[0];
  }

  else
  {
    int8x16_t v3 = vdupq_n_s8(a2);
    uint64_t v4 = a1 & 0xF;
    unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFF0LL;
    int8x16_t v6 = *(int8x16_t *)&algn_1803C1690[-v4];
    uint8x16_t v7 = (uint8x16_t)vorrq_s8(vsubq_s8(*(int8x16_t *)v5, v3), v6);
    unint64_t v8 = a3 + v4;
    while (1)
    {
      v6.i8[0] = vminvq_u8(v7);
      if (!v6.i32[0]) {
        break;
      }
      BOOL v10 = v8 > 0x10;
      v8 -= 16LL;
      if (!v10) {
        return 0LL;
      }
      int8x16_t v9 = *(int8x16_t *)(v5 + 16);
      v5 += 16LL;
      uint8x16_t v7 = (uint8x16_t)vsubq_s8(v9, v3);
    }

    uint8x16_t v12 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v7, (uint8x16_t)veorq_s8(v3, v3)), (int8x16_t)xmmword_1803C1680);
    v12.i8[0] = vminvq_u8(v12);
    unint64_t result = v5 + v12.u32[0];
    if (v12.u32[0] >= v8) {
      return 0LL;
    }
  }

  return result;
}

unint64_t _platform_memcmp(unint64_t *a1, unint64_t *a2, unint64_t a3)
{
  BOOL v3 = a3 >= 0x10;
  unint64_t v4 = a3 - 16;
  if (!v3)
  {
    BOOL v3 = __CFADD__(v4, 8LL);
    unint64_t v17 = v4 + 8;
    if (v3)
    {
      unint64_t v19 = *a1++;
      unint64_t v18 = v19;
      unint64_t v21 = *a2++;
      unint64_t v20 = v21;
      unint64_t v22 = v18 - v21;
      if (v18 != v21) {
        goto LABEL_18;
      }
      v17 -= 8LL;
    }

    BOOL v3 = __CFADD__(v17, 4LL);
    unint64_t v23 = v17 + 4;
    if (!v3)
    {
      v23 += 4LL;
      unint64_t v22 = 0LL;
      goto LABEL_20;
    }

    unsigned int v24 = *(_DWORD *)a1;
    a1 = (unint64_t *)((char *)a1 + 4);
    unint64_t v18 = v24;
    unsigned int v25 = *(_DWORD *)a2;
    a2 = (unint64_t *)((char *)a2 + 4);
    unint64_t v20 = v25;
    unint64_t v22 = v18 - v25;
    if (v18 == v25)
    {
      do
      {
LABEL_20:
        BOOL v3 = v23-- != 0;
        if (!v3) {
          break;
        }
        unsigned int v28 = *(unsigned __int8 *)a1;
        a1 = (unint64_t *)((char *)a1 + 1);
        uint64_t v27 = v28;
        unsigned int v29 = *(unsigned __int8 *)a2;
        a2 = (unint64_t *)((char *)a2 + 1);
        unint64_t v22 = v27 - v29;
      }

      while (v27 == v29);
      return v22;
    }

LABEL_18:
    unint64_t v26 = __clz(bswap64(v22)) & 0xFFFFFFFFFFFFFFF8LL;
    return (v18 >> v26) - (unint64_t)(v20 >> v26);
  }

  if (v4)
  {
    unint64_t v5 = (unint64_t *)((char *)a1 + v4);
    int8x16_t v6 = (unint64_t *)((char *)a2 + v4);
    while (1)
    {
      int8x16_t v7 = *(int8x16_t *)a1;
      a1 += 2;
      int8x16_t v8 = v7;
      int8x16_t v9 = *(int8x16_t *)a2;
      a2 += 2;
      int8x16_t v10 = vceqq_s8(v8, v9);
      v8.i8[0] = vminvq_u8((uint8x16_t)v10);
      if (!v8.i32[0]) {
        break;
      }
      BOOL v11 = v4 > 0x10;
      v4 -= 16LL;
      if (!v11)
      {
        a1 = v5;
        a2 = v6;
        goto LABEL_8;
      }
    }
  }

  else
  {
LABEL_8:
    int8x16_t v12 = *(int8x16_t *)a1;
    a1 += 2;
    int8x16_t v13 = v12;
    int8x16_t v14 = *(int8x16_t *)a2;
    a2 += 2;
    int8x16_t v10 = vceqq_s8(v13, v14);
    v13.i8[0] = vminvq_u8((uint8x16_t)v10);
    if (v13.i32[0]) {
      return 0LL;
    }
  }

  uint8x16_t v16 = (uint8x16_t)vorrq_s8(v10, (int8x16_t)xmmword_1803C17A0);
  v16.i8[0] = vminvq_u8(v16);
  return *((unsigned __int8 *)a1 + v16.u32[0] - 16) - (unint64_t)*((unsigned __int8 *)a2 + v16.u32[0] - 16);
}

unint64_t _platform_strnlen(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    return _platform_strlen(a1);
  }
  if (!a2) {
    return 0LL;
  }
  unint64_t v3 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  unint64_t v4 = (int8x16_t *)&algn_1803C18F0[-(a1 & 0xF)];
  int8x16_t v5 = *v4;
  uint8x16_t v6 = (uint8x16_t)vorrq_s8(*(int8x16_t *)(a1 & 0xFFFFFFFFFFFFFFF0LL), *v4);
  unint64_t v7 = a2 + (a1 & 0xF);
  while (1)
  {
    v5.i8[0] = vminvq_u8(v6);
    if (!v5.i32[0]) {
      break;
    }
    BOOL v9 = v7 > 0x10;
    v7 -= 16LL;
    if (!v9) {
      return v3 - a1 + v7 + 16;
    }
    uint8x16_t v8 = *(uint8x16_t *)(v3 + 16);
    v3 += 16LL;
    uint8x16_t v6 = v8;
  }

  uint8x16_t v10 = (uint8x16_t)veorq_s8(v5, v5);
  v10.i8[0] = vminvq_u8((uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v6, v10), (int8x16_t)xmmword_1803C18E0));
  unint64_t v11 = v3 - a1;
  if (v7 >= v10.u32[0]) {
    unint64_t v7 = v10.u32[0];
  }
  return v11 + v7;
}

unint64_t _platform_strlen(uint64_t a1)
{
  unint64_t v1 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v2 = (int8x16_t *)&algn_1803C18F0[-(a1 & 0xF)];
  int8x16_t v3 = *v2;
  for (uint8x16_t i = (uint8x16_t)vorrq_s8(*(int8x16_t *)(a1 & 0xFFFFFFFFFFFFFFF0LL), *v2); ; uint8x16_t i = v5)
  {
    v3.i8[0] = vminvq_u8(i);
    if (!v3.i32[0]) {
      break;
    }
    uint8x16_t v5 = *(uint8x16_t *)(v1 + 16);
    v1 += 16LL;
  }

  uint8x16_t v6 = (uint8x16_t)veorq_s8(v3, v3);
  v6.i8[0] = vminvq_u8((uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, v6), (int8x16_t)xmmword_1803C18E0));
  return v1 - a1 + v6.u32[0];
}

unint64_t _platform_strncmp(int8x16_t *a1, int8x16_t *a2, unint64_t a3)
{
  uint64_t v3 = 0LL;
  if (!a3) {
    return v3;
  }
  while ((a1 & 0xF) != 0)
  {
    unsigned int v5 = a1->u8[0];
    a1 = (int8x16_t *)((char *)a1 + 1);
    uint64_t v4 = v5;
    unsigned int v6 = a2->u8[0];
    a2 = (int8x16_t *)((char *)a2 + 1);
    uint64_t v3 = v4 - v6;
    if (v4 == v6 && (_DWORD)v4 != 0)
    {
      if (--a3) {
        continue;
      }
    }

    return v3;
  }

  unint64_t v9 = -(uint64_t)a2 & 0xFF0;
  if (!v9) {
    goto LABEL_16;
  }
LABEL_11:
  if (a3 > v9)
  {
    unint64_t v10 = a3 - v9;
    while (1)
    {
      int8x16_t v11 = *a1++;
      int8x16_t v12 = v11;
      int8x16_t v13 = *a2++;
      int8x16_t v15 = vceqq_s8(v12, v13);
      uint8x16_t v14 = (uint8x16_t)vandq_s8(v12, v15);
      v15.i8[0] = vminvq_u8(v14);
      if (!v15.i32[0]) {
        break;
      }
      v9 -= 16LL;
      if (!v9)
      {
        a3 = v10;
LABEL_16:
        while (1)
        {
          unsigned int v17 = a1->u8[0];
          a1 = (int8x16_t *)((char *)a1 + 1);
          uint64_t v16 = v17;
          unsigned int v18 = a2->u8[0];
          a2 = (int8x16_t *)((char *)a2 + 1);
          uint64_t v3 = v16 - v18;
          if (v16 != v18 || (_DWORD)v16 == 0) {
            return v3;
          }
          if (!--a3) {
            return v3;
          }
          if ((a1 & 0xF) == 0)
          {
            unint64_t v9 = 4080LL;
            goto LABEL_11;
          }
        }
      }
    }
  }

  else
  {
LABEL_30:
    while (1)
    {
      int8x16_t v20 = *a1++;
      int8x16_t v21 = v20;
      int8x16_t v22 = *a2++;
      int8x16_t v15 = vceqq_s8(v21, v22);
      uint8x16_t v14 = (uint8x16_t)vandq_s8(v21, v15);
      v15.i8[0] = vminvq_u8(v14);
      if (!v15.i32[0]) {
        break;
      }
      BOOL v23 = a3 > 0x10;
      a3 -= 16LL;
      if (!v23) {
        return 0LL;
      }
    }
  }

  uint8x16_t v24 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v14, (uint8x16_t)veorq_s8(v15, v15)), (int8x16_t)xmmword_1803C1A00);
  v24.i8[0] = vminvq_u8(v24);
  if (v24.u32[0] >= a3) {
    return 0LL;
  }
  else {
    return a1[-1].u8[v24.u32[0]] - (unint64_t)a2[-1].u8[v24.u32[0]];
  }
}

void *_platform_bzero(void *result, unint64_t a2)
{
  if (a2 < 0x40) {
    JUMPOUT(0x1803C1C70LL);
  }
  if (a2 < 0x8000) {
    JUMPOUT(0x1803C1C10LL);
  }
  *unint64_t result = 0LL;
  result[1] = 0LL;
  result[2] = 0LL;
  result[3] = 0LL;
  result[4] = 0LL;
  result[5] = 0LL;
  result[6] = 0LL;
  result[7] = 0LL;
  unint64_t v2 = (unint64_t)(result + 8) & 0xFFFFFFFFFFFFFFC0LL;
  unint64_t v3 = (unint64_t)result + a2 - v2 - 64;
  if ((unint64_t)result + a2 > v2 + 64)
  {
    do
    {
      __asm { DC              ZVA, X3 }

      v2 += 64LL;
      BOOL v8 = v3 > 0x40;
      v3 -= 64LL;
    }

    while (v8);
  }

  unint64_t v9 = (void *)(v2 + v3);
  *unint64_t v9 = 0LL;
  v9[1] = 0LL;
  v9[2] = 0LL;
  v9[3] = 0LL;
  v9[4] = 0LL;
  v9[5] = 0LL;
  v9[6] = 0LL;
  v9[7] = 0LL;
  return result;
}

uint64_t *_platform_memset(uint64_t *result, unsigned __int8 a2, unint64_t a3)
{
  uint64_t v3 = 0x101010101010101LL * a2;
  uint64_t v4 = result;
  if (a3 < 0x40)
  {
    while (1)
    {
      BOOL v11 = a3 >= 8;
      a3 -= 8LL;
      if (!v11) {
        break;
      }
      *v4++ = v3;
    }

    for (unint64_t i = a3 + 8; i; --i)
    {
      *(_BYTE *)uint64_t v4 = v3;
      uint64_t v4 = (uint64_t *)((char *)v4 + 1);
    }
  }

  else
  {
    if (a3 < 0x8000)
    {
      *unint64_t result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      result[4] = v3;
      result[5] = v3;
      result[6] = v3;
      result[7] = v3;
      unsigned int v5 = (void *)((unint64_t)(result + 8) & 0xFFFFFFFFFFFFFFC0LL);
      unint64_t v10 = (unint64_t)result + a3;
      BOOL v7 = v10 > (unint64_t)(v5 + 8);
      for (unint64_t j = v10 - (void)(v5 + 8); v7; j -= 64LL)
      {
        *unsigned int v5 = v3;
        v5[1] = v3;
        v5[2] = v3;
        void v5[3] = v3;
        v5[4] = v3;
        v5[5] = v3;
        v5[6] = v3;
        v5[7] = v3;
        v5 += 8;
        BOOL v7 = j > 0x40;
      }
    }

    else
    {
      if (!v3) {
        JUMPOUT(0x1803C1B3CLL);
      }
      *unint64_t result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      result[4] = v3;
      result[5] = v3;
      result[6] = v3;
      result[7] = v3;
      unsigned int v5 = (void *)((unint64_t)(result + 8) & 0xFFFFFFFFFFFFFFC0LL);
      unint64_t v6 = (unint64_t)result + a3;
      BOOL v7 = v6 > (unint64_t)(v5 + 8);
      for (unint64_t j = v6 - (void)(v5 + 8); v7; j -= 64LL)
      {
        *unsigned int v5 = v3;
        v5[1] = v3;
        v5[2] = v3;
        void v5[3] = v3;
        v5[4] = v3;
        v5[5] = v3;
        v5[6] = v3;
        v5[7] = v3;
        v5 += 8;
        BOOL v7 = j > 0x40;
      }
    }

    unint64_t v9 = (void *)((char *)v5 + j);
    *unint64_t v9 = v3;
    v9[1] = v3;
    v9[2] = v3;
    v9[3] = v3;
    v9[4] = v3;
    v9[5] = v3;
    v9[6] = v3;
    v9[7] = v3;
  }

  return result;
}

BOOL _platform_memcmp_zero_aligned8(int8x16_t *a1, unint64_t a2)
{
  if (a2 < 0x40)
  {
    if (a2)
    {
      uint64_t v12 = 0LL;
      do
      {
        uint64_t v13 = a1->i64[0];
        a1 = (int8x16_t *)((char *)a1 + 8);
        v12 |= v13;
        BOOL v9 = a2 > 8;
        a2 -= 8LL;
      }

      while (v9);
      return v12 != 0;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    unint64_t v2 = a1;
    uint64_t v3 = (int8x16_t *)((unint64_t)&a1[4] & 0xFFFFFFFFFFFFFFC0LL);
    int8x16_t v4 = *v2;
    int8x16_t v5 = v2[1];
    int8x16_t v6 = v2[2];
    int8x16_t v7 = v2[3];
    unint64_t v8 = a2 - ((char *)v3 - (char *)v2);
    BOOL v9 = v8 > 0x40;
    for (unint64_t i = v8 - 64; v9; i -= 64LL)
    {
      int8x16_t v4 = vorrq_s8(v4, *v3);
      int8x16_t v5 = vorrq_s8(v5, v3[1]);
      int8x16_t v6 = vorrq_s8(v6, v3[2]);
      int8x16_t v7 = vorrq_s8(v7, v3[3]);
      v3 += 4;
      BOOL v9 = i > 0x40;
    }

    return vmaxvq_u8((uint8x16_t)vorrq_s8( vorrq_s8( vorrq_s8(v4, *(int8x16_t *)((char *)v3 + i)),  vorrq_s8(v5, *(int8x16_t *)((char *)&v3[1] + i))),  vorrq_s8( vorrq_s8(v6, *(int8x16_t *)((char *)&v3[2] + i)),  vorrq_s8(v7, *(int8x16_t *)((char *)&v3[3] + i))))) != 0;
  }

void _platform_memset_pattern4(uint64_t a1, const float *a2, unint64_t a3)
{
  if (a3 >= 0x40)
  {
    if (a3 >= 0x8000) {
      JUMPOUT(0x1803C1DB4LL);
    }
    JUMPOUT(0x1803C1E30LL);
  }

  JUMPOUT(0x1803C1EB0LL);
}

void _platform_memset_pattern8(uint64_t a1, const double *a2, unint64_t a3)
{
  if (a3 >= 0x40)
  {
    if (a3 >= 0x8000) {
      JUMPOUT(0x1803C1DB4LL);
    }
    JUMPOUT(0x1803C1E30LL);
  }

  JUMPOUT(0x1803C1EB0LL);
}

int8x16_t *_platform_memset_pattern16(int8x16_t *result, int8x16_t *a2, unint64_t a3)
{
  int8x16_t v3 = *a2;
  if (a3 < 0x40)
  {
    while (1)
    {
      BOOL v14 = a3 >= 0x10;
      a3 -= 16LL;
      if (!v14) {
        break;
      }
      *result++ = v3;
    }

    unint64_t v15 = a3 + 16;
    if (v15)
    {
      unint64_t v17 = v3.u64[1];
      unint64_t v16 = v3.i64[0];
      do
      {
        result->i8[0] = v16;
        unint64_t result = (int8x16_t *)((char *)result + 1);
        unint64_t v16 = (v16 >> 8) | (v17 << 56);
        v17 >>= 8;
        --v15;
      }

      while (v15);
    }
  }

  else
  {
    if (a3 < 0x8000)
    {
      *unint64_t result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      int8x16_t v4 = (_OWORD *)((unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0LL);
      unint64_t v12 = (unint64_t)result->u64 + a3;
      BOOL v6 = v12 > (unint64_t)(v4 + 4);
      unint64_t v7 = v12 - (void)(v4 + 4);
      uint64_t v8 = ((_BYTE)v4 - (_BYTE)result) & 0xF;
      if (v6)
      {
        int8x16_t v13 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_1803C1F00 + v8));
        do
        {
          *int8x16_t v4 = v13;
          v4[1] = v13;
          sigset_t v4[2] = v13;
          v4[3] = v13;
          v4 += 4;
          BOOL v6 = v7 > 0x40;
          v7 -= 64LL;
        }

        while (v6);
      }
    }

    else
    {
      *unint64_t result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      int8x16_t v4 = (_OWORD *)((unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0LL);
      unint64_t v5 = (unint64_t)result->u64 + a3;
      BOOL v6 = v5 > (unint64_t)(v4 + 4);
      unint64_t v7 = v5 - (void)(v4 + 4);
      uint64_t v8 = ((_BYTE)v4 - (_BYTE)result) & 0xF;
      if (v6)
      {
        int8x16_t v9 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_1803C1F00 + v8));
        do
        {
          *int8x16_t v4 = v9;
          v4[1] = v9;
          sigset_t v4[2] = v9;
          v4[3] = v9;
          v4 += 4;
          BOOL v6 = v7 > 0x40;
          v7 -= 64LL;
        }

        while (v6);
      }
    }

    int8x16_t v10 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_1803C1F00 + (((_BYTE)v8 + (_BYTE)v7) & 0xF)));
    BOOL v11 = (int8x16_t *)((char *)v4 + v7);
    *BOOL v11 = v10;
    v11[1] = v10;
    v11[2] = v10;
    v11[3] = v10;
  }

  return result;
}

unsigned __int8 *_platform_strchr(uint64_t a1, unsigned __int8 a2)
{
  int8x16_t v2 = vdupq_n_s8(a2);
  uint64_t v3 = a1 & 0xF;
  unint64_t v4 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  int8x16_t v5 = *(int8x16_t *)&algn_1803C2010[-v3];
  for (uint8x16_t i = (uint8x16_t)vorrq_s8(vbicq_s8(*(int8x16_t *)v4, vceqq_s8(*(int8x16_t *)v4, v2)), v5);
        ;
        uint8x16_t i = (uint8x16_t)vbicq_s8(v7, v5))
  {
    v5.i8[0] = vminvq_u8(i);
    if (!v5.i32[0]) {
      break;
    }
    int8x16_t v7 = *(int8x16_t *)(v4 + 16);
    v4 += 16LL;
    int8x16_t v5 = vceqq_s8(v7, v2);
  }

  uint8x16_t v8 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, (uint8x16_t)veorq_s8(v5, v5)), (int8x16_t)xmmword_1803C2000);
  v8.i8[0] = vminvq_u8(v8);
  unint64_t result = (unsigned __int8 *)(v4 + v8.u32[0]);
  return result;
}

uint64_t swapcontext()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

uint64_t getcontext()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

uint64_t setcontext()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

unint64_t timingsafe_enable_if_supported()
{
  uint64_t v0 = MEMORY[0xFFFFFC010];
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000LL) != 0)
  {
    unint64_t v1 = (_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) >> 24) & 1;
    __asm { MSR             DIT, #1 }

    if ((v0 & 0x200000000000LL) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    __dsb(0xFu);
    __isb(0xFu);
    return v1;
  }

  unint64_t v1 = 0LL;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000LL) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  sb();
  return v1;
}

uint64_t timingsafe_restore_if_supported(uint64_t result)
{
  if ((result & 1) == 0 && (MEMORY[0xFFFFFC010] & 0x200000000000000LL) != 0) {
    __asm { MSR             DIT, #0 }
  }

  return result;
}

void sb()
{
  __asm { SB }

void _os_log_simple_reinit_4launchd_cold_1(int a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: asl fd already initialized";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void _enlarge_cold_1(int a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Failed to allocate memory for buffer";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void _os_lock_corruption_abort(uint64_t a1, uint64_t a2)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_lock is corrupt";
  qword_18C51C3B0 = a2;
  __break(1u);
}

void _os_unfair_lock_recursive_abort(unsigned int a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_unfair_lock";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void _os_unfair_lock_unowned_abort(unsigned int a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Unlock of an os_unfair_lock not owned by current thread";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void _os_unfair_lock_corruption_abort(unsigned int a1)
{
  if (a1 - 512 <= 0x3FE00)
  {
    qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_unfair_lock is corrupt, or owner thread exited without unlocking";
    qword_18C51C3B0 = a1;
    __break(1u);
  }

  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_unfair_lock is corrupt";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void _os_once_gate_recursive_abort(unsigned int a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_once_t";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void _os_once_gate_unowned_abort(unsigned int a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Unlock of an os_once_t not owned by current thread";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void _os_once_gate_corruption_abort(unsigned int a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_once_t is corrupt";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void _os_lock_recursive_abort(unsigned int a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_lock";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void os_unfair_lock_assert_owner_cold_1(unsigned int a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Assertion failed: Lock unexpectedly not owned by current thread";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void os_unfair_lock_assert_not_owner_cold_1(unsigned int a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Assertion failed: Lock unexpectedly owned by current thread";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void os_unfair_recursive_lock_unlock_forked_child_cold_1()
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Lock was not held";
  __break(1u);
}

void _os_alloc_cold_1(uint64_t a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Requested allocation size is invalid";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void _os_semaphore_create_cold_1(int a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Creating semaphore failed, possible port leak";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void _os_semaphore_create_cold_2()
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Allocating semaphore failed with MIG_REPLY_MISMATCH";
  qword_18C51C3B0 = -301LL;
  __break(1u);
}

void _os_semaphore_dispose_cold_1(int a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Destroying semaphore failed";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void _os_semaphore_signal_cold_1(int a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Signaling semaphore failed";
  qword_18C51C3B0 = a1;
  __break(1u);
}

void _os_semaphore_wait_cold_1(int a1)
{
  qword_18C51C380 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Waiting on semaphore failed";
  qword_18C51C3B0 = a1;
  __break(1u);
  __error();
}

int *__error(void)
{
  return (int *)MEMORY[0x1895FF6D0]();
}

uint64_t __gettimeofday()
{
  return MEMORY[0x1895FF718]();
}

uint64_t __libkernel_platform_init()
{
  return MEMORY[0x1895FF738]();
}

uint64_t __sendto()
{
  return MEMORY[0x1895FF820]();
}

uint64_t __sigaction()
{
  return MEMORY[0x1895FF840]();
}

uint64_t __sigaltstack()
{
  return MEMORY[0x1895FF848]();
}

uint64_t __sigreturn()
{
  return MEMORY[0x1895FF850]();
}

uint64_t __ulock_wait()
{
  return MEMORY[0x1895FF888]();
}

uint64_t __ulock_wait2()
{
  return MEMORY[0x1895FF890]();
}

uint64_t __ulock_wake()
{
  return MEMORY[0x1895FF898]();
}

int close(int a1)
{
  return MEMORY[0x1895FF960](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1895FF970](*(void *)&a1, a2, *(void *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FF9D8](*(void *)&a1, *(void *)&a2);
}

gid_t getgid(void)
{
  return MEMORY[0x1895FFAB8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FFAE0]();
}

uid_t getuid(void)
{
  return MEMORY[0x1895FFB10]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FFC00]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FFC20]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FFD58](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1895FFD70](*(void *)&target, address, size);
}

kern_return_t mach_vm_map( vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1895FFD78]( *(void *)&target_task,  address,  size,  mask,  *(void *)&flags,  *(void *)&object,  offset,  *(void *)&copy);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1895FFF10](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return MEMORY[0x1895FFF80](*(void *)&task, semaphore, *(void *)&policy, *(void *)&value);
}

kern_return_t semaphore_destroy(task_t task, semaphore_t semaphore)
{
  return MEMORY[0x1895FFF88](*(void *)&task, *(void *)&semaphore);
}

kern_return_t semaphore_signal(semaphore_t semaphore)
{
  return MEMORY[0x1895FFF90](*(void *)&semaphore);
}

kern_return_t semaphore_wait(semaphore_t semaphore)
{
  return MEMORY[0x1895FFFA0](*(void *)&semaphore);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x189600018](*(void *)&a1, a2, a3);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x189600030](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

kern_return_t thread_switch(mach_port_name_t thread_name, int option, mach_msg_timeout_t option_time)
{
  return MEMORY[0x1896000D8](*(void *)&thread_name, *(void *)&option, *(void *)&option_time);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x189600100](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x189600110](*(void *)&target_task, address, size);
}