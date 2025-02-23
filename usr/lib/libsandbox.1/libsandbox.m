void *sb_packbuff_new(unint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  v2 = calloc(1uLL, 0x38uLL);
  v3 = v2;
  if (v2)
  {
    v4 = 256LL;
    if (a1 >= 8) {
      v4 = a1;
    }
    v2[1] = v4;
    *(_DWORD *)v2 = 1;
    if (sb_packbuff_realloc((uint64_t)v2, 0LL))
    {
      free(v3);
      return 0LL;
    }

    else
    {
      *((void *)v3 + 3) -= 8LL;
      *((void *)v3 + 4) = 8LL;
      **((void **)v3 + 6) = 0LL;
    }
  }

  return v3;
}

uint64_t sb_packbuff_realloc(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2 || *(_DWORD *)a1 != 1) {
    return 45LL;
  }
  unsigned int v5 = 8 - (a2 & 7);
  BOOL v6 = (a2 & 7) == 0;
  size_t v7 = *(void *)(a1 + 16) + v2;
  *(void *)(a1 + 16) = v7;
  if (v6) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = v5;
  }
  size_t v9 = v8 + a2;
  if (v9 > v7 - *(void *)(a1 + 32))
  {
    v7 += v9;
    *(void *)(a1 + 16) = v7;
  }

  v10 = reallocf(*(void **)(a1 + 40), v7);
  *(void *)(a1 + 40) = v10;
  if (!v10) {
    return 12LL;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t result = 0LL;
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)(a1 + 24) = *(void *)(a1 + 16) - v13;
  if (v13) {
    uint64_t v11 = v11 + v13 - 8;
  }
  *(void *)(a1 + 48) = v11;
  return result;
}

void *sb_packbuff_init_with_buffer(void *a1, uint64_t a2, int a3, int a4)
{
  uint64_t result = calloc(1uLL, 0x38uLL);
  if (result)
  {
    *(_DWORD *)uint64_t result = a4;
    result[1] = 0LL;
    result[2] = a2;
    uint64_t v9 = a2;
    result[5] = a1;
    result[6] = a1;
    if (!a3)
    {
      *a1 = 0LL;
      a2 = result[2];
      uint64_t v9 = 8LL;
    }

    result[3] = a2 - v9;
    result[4] = v9;
  }

  return result;
}

void sb_packbuff_free(uint64_t *a1)
{
  if (a1)
  {
    if (*(_DWORD *)a1 == 2)
    {
      if (MEMORY[0x18959DDBC](*MEMORY[0x1895FBBE0], a1[5], a1[2])
        && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        sb_packbuff_free_cold_1(a1 + 5, a1 + 2);
      }
    }

    else if (*(_DWORD *)a1 == 1)
    {
      free((void *)a1[5]);
    }

    free(a1);
  }
}

uint64_t sb_packbuff_get_bytes(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t sb_packbuff_get_size(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t sb_packbuff_get_item_value_type(void *a1, _WORD *a2)
{
  unint64_t v3 = a1[5];
  uint64_t v2 = (_WORD *)a1[6];
  *a2 = v2[1];
  return 1LL;
}

uint64_t sb_packbuff_unpack_uint32(void *a1, int *a2)
{
  unint64_t v2 = a1[5];
  unint64_t v3 = a1[6];
  if (v3 < v2 || (unint64_t v5 = v3 + 8, v3 + 8 > v2 + a1[4]))
  {
    uint64_t result = 0LL;
LABEL_4:
    int v7 = 34;
    goto LABEL_5;
  }

  if (*(_WORD *)v3 == 1)
  {
    uint64_t result = *(unsigned int *)(v3 + 4);
    if (v5 >= v2 + a1[2]) {
      goto LABEL_4;
    }
    int v7 = 0;
    a1[6] = v5;
  }

  else
  {
    uint64_t result = 0LL;
    int v7 = 22;
  }

LABEL_5:
  if (a2) {
    *a2 = v7;
  }
  return result;
}

uint64_t sb_packbuff_unpack_item(void *a1, int a2, _DWORD *a3, unsigned __int16 **a4, _DWORD *a5)
{
  unint64_t v5 = a1[5];
  unint64_t v6 = a1[6];
  if (v6 < v5) {
    return 34LL;
  }
  int v7 = (unsigned __int16 *)(v6 + 8);
  if (v6 + 8 > v5 + a1[4]) {
    return 34LL;
  }
  if ((a2 - 2) >= 2)
  {
    if (a2 == 1 && a3)
    {
      *a3 = *(_DWORD *)(v6 + 4);
      uint64_t v11 = 8LL;
      goto LABEL_16;
    }

    return 22LL;
  }

  uint64_t v8 = 22LL;
  if (!a4 || !a5) {
    return v8;
  }
  uint64_t v10 = *(unsigned int *)(v6 + 4);
  LODWORD(v6) = 8 - (*(_DWORD *)(v6 + 4) & 7);
  *a4 = v7;
  *a5 = v10;
  if ((v10 & 7) != 0) {
    unint64_t v6 = v6;
  }
  else {
    unint64_t v6 = 0LL;
  }
  uint64_t v11 = v10 + v6 + 8;
  unint64_t v5 = a1[5];
  unint64_t v6 = a1[6];
LABEL_16:
  v12 = (char *)(v6 + v11);
  if ((v11 & 7) != 0) {
    sb_packbuff_unpack_item_cold_1();
  }
  uint64_t v8 = 0LL;
  a1[6] = v12;
  return v8;
}

unsigned __int16 *sb_packbuff_unpack_string(void *a1, void *a2, int *a3)
{
  int v9 = 0;
  uint64_t v8 = 0LL;
  int v5 = sb_packbuff_unpack_item(a1, 2, 0LL, &v8, &v9);
  if (!v5)
  {
    if (v9 && (uint64_t v6 = (v9 - 1), !*((_BYTE *)v8 + v6)))
    {
      int v5 = 0;
      if (a2) {
        *a2 = v6;
      }
    }

    else
    {
      int v5 = 22;
    }
  }

  if (a3) {
    *a3 = v5;
  }
  return v8;
}

uint64_t sb_packbuff_pack_uint32(void *a1, __int16 a2, int a3)
{
  return sb_packbuff_pack_item(a1, 1u, a2, a3, 0LL, 0LL);
}

uint64_t sb_packbuff_pack_item(void *a1, unsigned int a2, __int16 a3, int a4, void *__src, size_t __n)
{
  unsigned int v6 = __n;
  unint64_t v12 = 8LL;
  if ((_DWORD)__n)
  {
    if ((__n & 7) != 0) {
      unsigned int v13 = 8 - (__n & 7);
    }
    else {
      unsigned int v13 = 0;
    }
    uint64_t result = 34LL;
    unsigned int v15 = __n + v13;
    if (__CFADD__((_DWORD)__n, v13) || v15 > 0xFFFFFFF7) {
      return result;
    }
    unint64_t v12 = v15 + 8;
  }

  else
  {
    unsigned int v15 = 0;
    unsigned int v13 = 0;
  }

  if (a1[3] >= v12 || (uint64_t result = sb_packbuff_realloc((uint64_t)a1, v12), !(_DWORD)result))
  {
    uint64_t v16 = a1[6];
    *(_WORD *)uint64_t v16 = a2;
    *(_WORD *)(v16 + 2) = a3;
    if (a2 - 2 < 2)
    {
      if (!__src) {
        sb_packbuff_pack_item_cold_2();
      }
      *(_DWORD *)(v16 + 4) = v6;
      v17 = (char *)(a1[6] + 8LL);
      memcpy(v17, __src, v6);
      if (v13) {
        bzero(&v17[v6], v13);
      }
      goto LABEL_18;
    }

    if (a2 <= 1)
    {
      if (v15) {
        sb_packbuff_pack_item_cold_1();
      }
      *(_DWORD *)(v16 + 4) = a4;
LABEL_18:
      uint64_t result = 0LL;
      unint64_t v18 = a1[4] + v12;
      a1[3] -= v12;
      a1[4] = v18;
      v19 = (void *)(a1[6] + v12);
      a1[6] = v19;
      void *v19 = 0LL;
      return result;
    }

    return 22LL;
  }

  return result;
}

uint64_t sb_packbuff_pack_string(void *a1, __int16 a2, void *__src, unint64_t a4)
{
  if (a4 > 0xFFFFFFFE || *((_BYTE *)__src + a4)) {
    return 22LL;
  }
  else {
    return sb_packbuff_pack_item(a1, 2u, a2, 0, __src, (a4 + 1));
  }
}

uint64_t sb_packbuff_pack_key_with_string_value(void *a1, __int16 a2, char *__s, __int16 a4, char *a5)
{
  size_t v10 = strlen(__s);
  if (v10 > 0xFFFFFFFE || __s[v10]) {
    return 22LL;
  }
  uint64_t result = sb_packbuff_pack_item(a1, 2u, a2, 0, __s, (v10 + 1));
  if (!(_DWORD)result)
  {
    size_t v12 = strlen(a5);
    if (v12 <= 0xFFFFFFFE && !a5[v12]) {
      return sb_packbuff_pack_item(a1, 2u, a4, 0, a5, (v12 + 1));
    }
    return 22LL;
  }

  return result;
}

uint64_t sb_packbuff_unpack_key_with_string_value( void *a1, unsigned __int16 **a2, _WORD *a3, unsigned __int16 **a4, void *a5)
{
  uint64_t v16 = 0LL;
  unsigned int v15 = 0;
  size_t v10 = sb_packbuff_unpack_string(a1, &v16, (int *)&v15);
  uint64_t result = v15;
  if (!v15)
  {
    if (a2) {
      *a2 = v10;
    }
    if (a3)
    {
      unint64_t v13 = a1[5];
      size_t v12 = (_WORD *)a1[6];
    }

    v14 = sb_packbuff_unpack_string(a1, &v16, (int *)&v15);
    uint64_t result = v15;
    if (!v15)
    {
      if (a4) {
        *a4 = v14;
      }
      uint64_t result = 0LL;
      if (a5) {
        *a5 = v16;
      }
    }
  }

  return result;
}

char *sandbox_create_params()
{
  v0 = (char *)malloc(0x18uLL);
  if (v0)
  {
    v1 = malloc(0x10uLL);
    *(void *)v0 = v1;
    if (v1)
    {
      *(_OWORD *)(v0 + 8) = xmmword_186F2BD60;
    }

    else
    {
      free(v0);
      return 0LL;
    }
  }

  return v0;
}

uint64_t sandbox_set_param(uint64_t a1, char *__s2, const char *a3)
{
  if (!__s2 || !a3)
  {
    size_t v12 = __error();
    int v13 = 22;
    goto LABEL_13;
  }

  uint64_t v6 = *(void *)(a1 + 8);
  if (!v6)
  {
LABEL_7:
    if (v6 != *(void *)(a1 + 16))
    {
      uint64_t v11 = *(void **)a1;
      goto LABEL_16;
    }

    if (v6 >= 1 && !((unint64_t)(2 * v6) >> 61))
    {
      size_t v10 = realloc(*(void **)a1, 16 * v6);
      if (v10)
      {
        uint64_t v11 = v10;
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = 2 * v6;
        uint64_t v6 = *(void *)(a1 + 8);
LABEL_16:
        uint64_t result = 0LL;
        v11[v6] = __s2;
        v14 = *(void **)a1;
        *(void *)(a1 + 8) = v6 + 2;
        v14[v6 + 1] = a3;
        return result;
      }

      return 0xFFFFFFFFLL;
    }

    size_t v12 = __error();
    int v13 = 12;
LABEL_13:
    int *v12 = v13;
    return 0xFFFFFFFFLL;
  }

  unint64_t v7 = 0LL;
  uint64_t v8 = *(const char ***)a1;
  while (1)
  {
    uint64_t result = strcmp(v8[v7], __s2);
    if (!(_DWORD)result) {
      break;
    }
    v7 += 2LL;
    if (v7 >= v6) {
      goto LABEL_7;
    }
  }

  *(const char **)((char *)v8 + ((8 * v7) | 8)) = a3;
  return result;
}

void sandbox_free_params(void **a1)
{
  if (a1)
  {
    free(*a1);
    free(a1);
  }

uint64_t sandbox_compile_file(char *__filename, uint64_t a2, char **a3)
{
  __filenamea = 0LL;
  if (!*__filename)
  {
    asprintf(a3, "path is empty");
    return 0LL;
  }

  if (*__filename != 47)
  {
    unint64_t v7 = "/System/Library/Sandbox/Profiles";
    for (i = &off_189FAA1D0; ; ++i)
    {
      asprintf(&__filenamea, "%s/%s.sb", v7, __filename);
      if (!__filenamea)
      {
        asprintf(a3, "out of memory");
        return 0LL;
      }

      int v9 = fopen(__filenamea, "r");
      if (v9) {
        break;
      }
      free(__filenamea);
      size_t v10 = *i;
      unint64_t v7 = v10;
      if (!v10)
      {
        asprintf(a3, "%s: profile not found");
        return 0LL;
      }
    }

    int v5 = v9;
    goto LABEL_14;
  }

  int v5 = fopen(__filename, "r");
  if (v5)
  {
LABEL_14:
    asprintf(a3, "%s", "profile compilation not supported on this platform");
    free(__filenamea);
    fclose(v5);
    return 0LL;
  }

  uint64_t v6 = __error();
  strerror(*v6);
  asprintf(a3, "%s: %s");
  return 0LL;
}

void *sandbox_compile_named(char *a1, uint64_t a2, char **a3)
{
  if (__sandbox_ms())
  {
    sandbox_compile_file(a1, v5, a3);
    return 0LL;
  }

  else
  {
    uint64_t v6 = malloc(0x18uLL);
    if (v6)
    {
      unint64_t v7 = strdup(a1);
      v6[1] = 0LL;
      v6[2] = 0LL;
      *uint64_t v6 = v7;
    }

    else
    {
      asprintf(a3, "out of memory");
    }
  }

  return v6;
}

uint64_t sandbox_compile_string(int a1, int a2, char **a3)
{
  return 0LL;
}

uint64_t sandbox_compile_entitlements(int a1, int a2, int a3, char **a4)
{
  return 0LL;
}

void sandbox_free_profile(void **a1)
{
  if (a1)
  {
    free(*a1);
    free(a1[1]);
    free(a1);
  }

uint64_t sandbox_apply_container(void *a1, char *__s)
{
  if (*a1)
  {
    if (!__s) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }

  if (__s) {
LABEL_3:
  }
    strlen(__s);
LABEL_5:
  uint64_t v2 = __sandbox_ms();
  if (!(_DWORD)v2) {
    _sandbox_enter_notify_libxpc();
  }
  return v2;
}

uint64_t sandbox_apply(void *a1)
{
  return sandbox_apply_container(a1, 0LL);
}

uint64_t sandbox_register_profile()
{
  return 45LL;
}

uint64_t sandbox_unregister_profile()
{
  return 45LL;
}

uint64_t sandbox_unregister_all_profiles()
{
  return 45LL;
}

uint64_t sandbox_inspect_pid(int a1, void *a2, void *a3)
{
  return sb_inspect_subsystem(1LL, a1, a2, a3);
}

uint64_t sb_inspect_subsystem(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = 0LL;
  int v7 = 10;
  while (1)
  {
    if (v6) {
      free(v6);
    }
    int v9 = malloc(0x1000uLL);
    if (*__error() != 63)
    {
      if (v9) {
        free(v9);
      }
      return *__error();
    }

    uint64_t v6 = v9;
    if (!--v7)
    {
      free(v9);
      return 26LL;
    }
  }

  if (a3) {
    *a3 = v9;
  }
  uint64_t result = 0LL;
  if (a4) {
    *a4 = 0LL;
  }
  return result;
}

uint64_t sandbox_inspect_smemory()
{
  return 45LL;
}

void *sandbox_user_state_item_buffer_create()
{
  return sb_packbuff_new(0x800uLL);
}

uint64_t sandbox_user_state_item_buffer_send(uint64_t a1)
{
  if (!a1) {
    return 22LL;
  }
  sb_packbuff_get_bytes(a1);
  sb_packbuff_get_size(a1);
  return __sandbox_ms();
}

uint64_t sandbox_user_state_item_buffer_destroy(uint64_t *a1)
{
  if (!a1) {
    return 22LL;
  }
  sb_packbuff_free(a1);
  return 0LL;
}

uint64_t sandbox_set_user_state_item(int a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sandbox_set_user_state_item_with_persona(a1, -1, a2, a3, a4);
}

uint64_t sandbox_set_user_state_item_with_persona(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  if (a5)
  {
    int v9 = a5;
    size_t v10 = 0LL;
  }

  else
  {
    int v9 = (uint64_t *)sb_packbuff_new(0x800uLL);
    size_t v10 = v9;
    if (!v9) {
      return 22LL;
    }
  }

  uint64_t v11 = sb_packbuff_pack_uint32(v9, 0, a1);
  if (!(_DWORD)v11)
  {
    switch(a3)
    {
      case 0LL:
        uint64_t v11 = sb_packbuff_pack_uint32(v9, 1, *(_DWORD *)a4);
        if ((_DWORD)v11) {
          break;
        }
        size_t v12 = *(void **)(a4 + 8);
        if (!v12) {
          goto LABEL_10;
        }
        size_t v13 = strlen(*(const char **)(a4 + 8));
        int v14 = sb_packbuff_pack_string(v9, 2, v12, v13);
        uint64_t v11 = sb_packbuff_pack_uint32(v9, 17, 0) | v14;
        break;
      case 1LL:
        v17 = *(void **)a4;
        if (!*(void *)a4) {
          goto LABEL_27;
        }
        unint64_t v18 = *(char **)(a4 + 8);
        if (v18)
        {
          v19 = v9;
          __int16 v20 = 4;
          v21 = *(char **)a4;
          __int16 v22 = 5;
          goto LABEL_26;
        }

        size_t v25 = strlen(*(const char **)a4);
        v26 = v9;
        __int16 v27 = 6;
        goto LABEL_31;
      case 2LL:
        if (!*(void *)a4) {
          goto LABEL_27;
        }
        uint64_t v11 = sb_packbuff_pack_uint32(v9, 18, a2);
        if ((_DWORD)v11) {
          break;
        }
        v17 = *(void **)a4;
        unint64_t v18 = *(char **)(a4 + 8);
        if (v18)
        {
          v19 = v9;
          __int16 v20 = 7;
          v21 = *(char **)a4;
          __int16 v22 = 8;
          goto LABEL_26;
        }

        size_t v25 = strlen(*(const char **)a4);
        v26 = v9;
        __int16 v27 = 9;
        goto LABEL_31;
      case 4LL:
        v17 = *(void **)a4;
        if (!*(void *)a4) {
          goto LABEL_27;
        }
        unint64_t v18 = *(char **)(a4 + 8);
        if (v18)
        {
          v19 = v9;
          __int16 v20 = 10;
          v21 = *(char **)a4;
          __int16 v22 = 11;
          goto LABEL_26;
        }

        size_t v25 = strlen(*(const char **)a4);
        v26 = v9;
        __int16 v27 = 12;
        goto LABEL_31;
      case 8LL:
        v17 = *(void **)a4;
        if (*(void *)a4)
        {
          unint64_t v18 = *(char **)(a4 + 8);
          if (v18)
          {
            v19 = v9;
            __int16 v20 = 13;
            v21 = *(char **)a4;
            __int16 v22 = 14;
LABEL_26:
            uint64_t v23 = sb_packbuff_pack_key_with_string_value(v19, v20, v21, v22, v18);
          }

          else
          {
            size_t v25 = strlen(*(const char **)a4);
            v26 = v9;
            __int16 v27 = 15;
LABEL_31:
            uint64_t v23 = sb_packbuff_pack_string(v26, v27, v17, v25);
          }

LABEL_35:
          uint64_t v11 = v23;
        }

        else
        {
LABEL_27:
          uint64_t v11 = 22LL;
        }

        break;
      case 16LL:
LABEL_10:
        unsigned int v15 = v9;
        __int16 v16 = 3;
        goto LABEL_33;
      case 17LL:
        int v24 = *(_DWORD *)a4;
        unsigned int v15 = v9;
        __int16 v16 = 1;
        goto LABEL_34;
      case 18LL:
        v17 = *(void **)a4;
        size_t v25 = strlen(*(const char **)a4);
        v26 = v9;
        __int16 v27 = 2;
        goto LABEL_31;
      case 19LL:
        v17 = *(void **)a4;
        size_t v25 = strlen(*(const char **)a4);
        v26 = v9;
        __int16 v27 = 16;
        goto LABEL_31;
      case 20LL:
        unsigned int v15 = v9;
        __int16 v16 = 17;
LABEL_33:
        int v24 = 0;
LABEL_34:
        uint64_t v23 = sb_packbuff_pack_uint32(v15, v16, v24);
        goto LABEL_35;
      default:
        uint64_t v11 = 22LL;
        if (v10) {
          goto LABEL_39;
        }
        return v11;
    }
  }

  if (v10)
  {
    if (!(_DWORD)v11) {
      uint64_t v11 = sandbox_user_state_item_buffer_send((uint64_t)v10);
    }
LABEL_39:
    sb_packbuff_free(v10);
  }

  return v11;
}

uint64_t sandbox_user_state_iterate_items(unsigned int a1, uint64_t a2)
{
  return inspect_iterate_items(a1, 2LL, a2);
}

uint64_t inspect_iterate_items(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v20 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t result = sb_inspect_subsystem(a2, a1, &v20, &v19);
  if (!(_DWORD)result)
  {
    uint64_t v5 = sb_packbuff_init_with_buffer(v20, v19, 1, 1);
    if (v5)
    {
      uint64_t v6 = v5;
      unsigned int v18 = 0;
      __int16 v17 = 0;
      int v14 = 0LL;
      unsigned int v15 = 0LL;
      uint64_t v7 = 0x7FFFFFFFLL;
      uint64_t v16 = 0LL;
      while (2)
      {
        if (sb_packbuff_get_item_value_type(v6, &v17))
        {
          switch(v17)
          {
            case 0:
              uint64_t v7 = sb_packbuff_unpack_uint32(v6, (int *)&v18);
              if (!v18) {
                continue;
              }
              break;
            case 1:
              LODWORD(v14) = sb_packbuff_unpack_uint32(v6, (int *)&v18);
              if (!v18)
              {
                (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 **))(a3 + 16))(a3, v7, 17LL, &v14);
                continue;
              }

              break;
            case 2:
              if ((_DWORD)v7 == 0x7FFFFFFF) {
                goto LABEL_34;
              }
              size_t v13 = 0LL;
              uint64_t v8 = sb_packbuff_unpack_string(v6, &v13, (int *)&v18);
              if (!v18)
              {
                int v14 = v8;
                (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 **))(a3 + 16))(a3, v7, 18LL, &v14);
                continue;
              }

              break;
            case 4:
              if ((_DWORD)v7 == 0x7FFFFFFF) {
                goto LABEL_34;
              }
              size_t v12 = 0LL;
              size_t v13 = 0LL;
              __int16 v11 = 0;
              unsigned int v18 = sb_packbuff_unpack_key_with_string_value(v6, &v13, &v11, &v12, 0LL);
              if (!v18)
              {
                if (v11 != 5) {
                  goto LABEL_34;
                }
                LODWORD(v16) = 0;
                int v14 = v13;
                unsigned int v15 = v12;
                (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 **))(a3 + 16))(a3, v7, 1LL, &v14);
                continue;
              }

              break;
            case 7:
              if ((_DWORD)v7 == 0x7FFFFFFF) {
                goto LABEL_34;
              }
              size_t v12 = 0LL;
              size_t v13 = 0LL;
              __int16 v11 = 0;
              unsigned int v18 = sb_packbuff_unpack_key_with_string_value(v6, &v13, &v11, &v12, 0LL);
              if (!v18)
              {
                if (v11 != 8) {
                  goto LABEL_34;
                }
                int v14 = v13;
                unsigned int v15 = v12;
                (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 **))(a3 + 16))(a3, v7, 2LL, &v14);
                continue;
              }

              break;
            case 10:
              size_t v12 = 0LL;
              size_t v13 = 0LL;
              __int16 v11 = 0;
              unsigned int v18 = sb_packbuff_unpack_key_with_string_value(v6, &v13, &v11, &v12, 0LL);
              if (!v18)
              {
                if (v11 != 11) {
                  goto LABEL_34;
                }
                LODWORD(v16) = 0;
                int v14 = v13;
                unsigned int v15 = v12;
                (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 **))(a3 + 16))(a3, v7, 4LL, &v14);
                continue;
              }

              break;
            case 13:
              size_t v12 = 0LL;
              size_t v13 = 0LL;
              __int16 v11 = 0;
              unsigned int v18 = sb_packbuff_unpack_key_with_string_value(v6, &v13, &v11, &v12, 0LL);
              if (!v18)
              {
                if (v11 != 14) {
                  goto LABEL_34;
                }
                LODWORD(v16) = 0;
                int v14 = v13;
                unsigned int v15 = v12;
                (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 **))(a3 + 16))(a3, v7, 8LL, &v14);
                continue;
              }

              break;
            case 16:
              if ((_DWORD)v7 == 0x7FFFFFFF) {
                goto LABEL_34;
              }
              size_t v13 = 0LL;
              int v9 = sb_packbuff_unpack_string(v6, &v13, (int *)&v18);
              if (!v18)
              {
                int v14 = v9;
                (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 **))(a3 + 16))(a3, v7, 19LL, &v14);
                continue;
              }

              break;
            case 18:
              if ((_DWORD)v7 == 0x7FFFFFFF) {
                goto LABEL_34;
              }
              int v10 = sb_packbuff_unpack_uint32(v6, (int *)&v18);
              if (!v18)
              {
                LODWORD(v16) = v10;
                continue;
              }

              break;
            default:
LABEL_34:
              unsigned int v18 = 22;
              break;
          }
        }

        break;
      }

      sb_packbuff_free(v6);
      return v18;
    }

    else
    {
      return 12LL;
    }
  }

  return result;
}

uint64_t sandbox_container_paths_iterate_items(int a1, uint64_t a2)
{
  return inspect_iterate_items(a1, 4LL, a2);
}

uint64_t sandbox_prepare_user_home_mount()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

uint64_t sandbox_exempt_from_network_approval_policy()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

uint64_t sandbox_register_network_approval_policy_exemption_for_share()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

uint64_t sandbox_register_sync_root()
{
  uint64_t result = __sandbox_ms();
  if ((_DWORD)result) {
    return *__error();
  }
  return result;
}

void sb_packbuff_free_cold_1(uint64_t *a1, uint64_t *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  int v4 = 134218240;
  uint64_t v5 = v2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_error_impl( &dword_186F2A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "failed: vm_deallocate(%p, %zu)",  (uint8_t *)&v4,  0x16u);
}

void sb_packbuff_unpack_item_cold_1()
{
  __assert_rtn("sb_packbuff_unpack_item", "packbuff.c", 369, "(bytes_to_advance % BYTE_ALIGNMENT) == 0");
}

void sb_packbuff_pack_item_cold_1()
{
  __assert_rtn("sb_packbuff_pack_item", "packbuff.c", 267, "extra_bytes_needed == 0");
}

void sb_packbuff_pack_item_cold_2()
{
  __assert_rtn("sb_packbuff_pack_item", "packbuff.c", 273, "additional_bytes != NULL");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sandbox_enter_notify_libxpc()
{
  return MEMORY[0x1895F8F00]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
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