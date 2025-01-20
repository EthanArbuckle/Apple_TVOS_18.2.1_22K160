uint64_t der_heim_oid_cmp(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  v2 = *a1;
  if (*a1 == *(void *)a2) {
    return memcmp((const void *)a1[1], *(const void **)(a2 + 8), 4 * v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t der_heim_octet_string_cmp(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)a1;
  if (*(void *)a1 == *(void *)a2) {
    return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t der_printable_string_cmp(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)a1;
  if (*(void *)a1 == *(void *)a2) {
    return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t der_ia5_string_cmp(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)a1;
  if (*(void *)a1 == *(void *)a2) {
    return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t der_heim_bit_string_cmp(unint64_t *a1, void *a2)
{
  unint64_t v2 = *a1;
  if (*a1 != *a2) {
    return v2 - *a2;
  }
  v3 = (unsigned __int8 *)a1[1];
  v4 = (unsigned __int8 *)a2[1];
  uint64_t result = memcmp(v3, v4, v2 >> 3);
  if (!(_DWORD)result)
  {
    if ((v2 & 7) != 0) {
      return (v3[v2 >> 3] >> (8 - (v2 & 7))) - (v4[v2 >> 3] >> (8 - (v2 & 7)));
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t der_heim_integer_cmp(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (*(_DWORD *)(a2 + 16) - *(_DWORD *)(a1 + 16));
  if (!(_DWORD)v2)
  {
    size_t v3 = *(void *)a1;
    if (*(void *)a1 == *(void *)a2) {
      return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v3);
    }
    return v3 - *(void *)a2;
  }

  return v2;
}

uint64_t der_heim_bmp_string_cmp(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1 == *(void *)a2) {
    return memcmp((const void *)a1[1], *(const void **)(a2 + 8), 2 * v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t der_heim_universal_string_cmp(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1 == *(void *)a2) {
    return memcmp((const void *)a1[1], *(const void **)(a2 + 8), 4 * v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t der_copy_general_string(const char **a1, char **a2)
{
  size_t v3 = strdup(*a1);
  *a2 = v3;
  if (v3) {
    return 0LL;
  }
  else {
    return 12LL;
  }
}

uint64_t der_copy_integer(_DWORD *a1, _DWORD *a2)
{
  *a2 = *a1;
  return 0LL;
}

uint64_t der_copy_unsigned(_DWORD *a1, _DWORD *a2)
{
  *a2 = *a1;
  return 0LL;
}

uint64_t der_copy_generalized_time(void *a1, void *a2)
{
  *a2 = *a1;
  return 0LL;
}

uint64_t der_copy_utctime(void *a1, void *a2)
{
  *a2 = *a1;
  return 0LL;
}

uint64_t der_copy_utf8string(const char **a1, char **a2)
{
  size_t v3 = strdup(*a1);
  *a2 = v3;
  if (v3) {
    return 0LL;
  }
  else {
    return 12LL;
  }
}

uint64_t der_copy_printable_string(uint64_t a1, void *a2)
{
  size_t v4 = *(void *)a1;
  *a2 = *(void *)a1;
  v5 = malloc(v4 + 1);
  a2[1] = v5;
  if (!v5) {
    return 12LL;
  }
  v6 = v5;
  memcpy(v5, *(const void **)(a1 + 8), v4);
  uint64_t result = 0LL;
  v6[v4] = 0;
  return result;
}

uint64_t der_copy_bmp_string(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a2 = *a1;
  v5 = malloc(2 * v4);
  a2[1] = (uint64_t)v5;
  if (v4) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    return 12LL;
  }
  memcpy(v5, (const void *)a1[1], 2 * v4);
  return 0LL;
}

uint64_t der_copy_universal_string(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a2 = *a1;
  v5 = malloc(4 * v4);
  a2[1] = (uint64_t)v5;
  if (v4) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    return 12LL;
  }
  memcpy(v5, (const void *)a1[1], 4 * v4);
  return 0LL;
}

uint64_t der_copy_visible_string(const char **a1, char **a2)
{
  size_t v3 = strdup(*a1);
  *a2 = v3;
  if (v3) {
    return 0LL;
  }
  else {
    return 12LL;
  }
}

uint64_t der_copy_octet_string(uint64_t a1, void *a2)
{
  size_t v4 = *(void *)a1;
  *a2 = *(void *)a1;
  v5 = malloc(v4);
  a2[1] = v5;
  if (v4) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    return 12LL;
  }
  memcpy(v5, *(const void **)(a1 + 8), v4);
  return 0LL;
}

uint64_t der_copy_heim_integer(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(void *)a1;
  *(void *)a2 = *(void *)a1;
  v5 = malloc(v4);
  *(void *)(a2 + 8) = v5;
  if (v4) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    return 12LL;
  }
  memcpy(v5, *(const void **)(a1 + 8), v4);
  uint64_t result = 0LL;
  *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 16);
  return result;
}

uint64_t der_copy_oid(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a2 = *a1;
  v5 = malloc(4 * v4);
  a2[1] = (uint64_t)v5;
  if (v4) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    return 12LL;
  }
  memcpy(v5, (const void *)a1[1], 4 * v4);
  return 0LL;
}

uint64_t der_copy_bit_string(uint64_t a1, void *a2)
{
  unint64_t v4 = *(void *)a1 + 7LL;
  *a2 = *(void *)a1;
  v5 = malloc(v4 >> 3);
  a2[1] = v5;
  if (v4 >= 8 && v5 == 0LL) {
    return 12LL;
  }
  memcpy(v5, *(const void **)(a1 + 8), v4 >> 3);
  return 0LL;
}

uint64_t der_parse_hex_heim_integer(char *__s, uint64_t a2)
{
  size_t v3 = __s;
  *(void *)a2 = 0LL;
  *(void *)(a2 + 8) = 0LL;
  *(_DWORD *)(a2 + 16) = 0;
  if (*__s == 45)
  {
    size_t v3 = __s + 1;
    *(_DWORD *)(a2 + 16) = 1;
  }

  int64_t v4 = strlen(v3);
  if (v4 <= 0) {
    goto LABEL_17;
  }
  size_t v5 = ((unint64_t)v4 >> 1) + 1;
  *(void *)a2 = v5;
  BOOL v6 = malloc(v5);
  *(void *)(a2 + 8) = v6;
  if (!v6)
  {
    *(void *)a2 = 0LL;
    return 12LL;
  }

  int64_t v7 = rk_hex_decode(v3, v6, v5);
  v8 = *(void **)(a2 + 8);
  if (v7 < 0)
  {
    free(v8);
LABEL_17:
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
    return 22LL;
  }

  if (v7)
  {
    if (v7 >= 1) {
      uint64_t v9 = 1LL;
    }
    else {
      uint64_t v9 = v7;
    }
    int64_t v10 = v9 - 1;
    v11 = *(_BYTE **)(a2 + 8);
    while (!*v11)
    {
      ++v11;
      if (v7-- <= 1)
      {
        int64_t v7 = v10;
        break;
      }
    }
  }

  else
  {
    v11 = *(_BYTE **)(a2 + 8);
  }

  *(void *)a2 = v7;
  memmove(v8, v11, v7);
  return 0LL;
}

uint64_t der_print_hex_heim_integer(uint64_t a1, const char **a2)
{
  if (*(_DWORD *)(a1 + 16))
  {
    int v4 = asprintf(&v6, "-%s", *a2);
    free((void *)*a2);
    if ((v4 & 0x80000000) == 0)
    {
      uint64_t result = 0LL;
      *a2 = v6;
      return result;
    }

    return 12LL;
  }

  return 0LL;
}

uint64_t der_print_heim_oid(unint64_t *a1, uint64_t a2, char **a3)
{
  if (!*a1) {
    return 22LL;
  }
  unint64_t v6 = 0LL;
  int64_t v7 = 0LL;
  do
  {
    int64_t v7 = rk_strpoolprintf(v7, "%d", *(_DWORD *)(a1[1] + 4 * v6));
    if (!v7)
    {
LABEL_12:
      *a3 = 0LL;
      return 12LL;
    }

    unint64_t v8 = *a1;
    if (v6 < *a1 - 1)
    {
      int64_t v7 = rk_strpoolprintf(v7, "%c", a2);
      if (!v7) {
        goto LABEL_12;
      }
      unint64_t v8 = *a1;
    }

    ++v6;
  }

  while (v6 < v8);
  uint64_t v9 = rk_strpoolcollect((uint64_t *)v7);
  *a3 = v9;
  if (v9) {
    return 0LL;
  }
  else {
    return 12LL;
  }
}

uint64_t der_parse_heim_oid(const char *a1, const char *a2, uint64_t a3)
{
  if (a2) {
    int v4 = a2;
  }
  else {
    int v4 = ".";
  }
  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  size_t v5 = strdup(a1);
  uint64_t v6 = (uint64_t)strtok_r(v5, v4, &__lasts);
  if (v6)
  {
    while (1)
    {
      int64_t v7 = realloc(*(void **)(a3 + 8), 4LL * *(void *)a3 + 4);
      if (!v7) {
        break;
      }
      *(void *)(a3 + 8) = v7;
      uint64_t v8 = strtol((const char *)v6, &v12, 10);
      uint64_t v6 = 22LL;
      if (*v12 || v8 < 0 || v8 > 0x7FFFFFFF) {
        goto LABEL_12;
      }
      uint64_t v10 = *(void *)a3;
      uint64_t v9 = *(void *)(a3 + 8);
      ++*(void *)a3;
      *(_DWORD *)(v9 + 4 * v10) = v8;
      uint64_t v6 = (uint64_t)strtok_r(0LL, v4, &__lasts);
      if (!v6) {
        goto LABEL_13;
      }
    }

    uint64_t v6 = 12LL;
LABEL_12:
    der_free_oid(a3);
  }

LABEL_13:
  free(v5);
  return v6;
}

void der_free_general_string(void **a1)
{
  *a1 = 0LL;
}

_DWORD *der_free_integer(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *der_free_unsigned(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

void *der_free_generalized_time(void *result)
{
  *uint64_t result = 0LL;
  return result;
}

void *der_free_utctime(void *result)
{
  *uint64_t result = 0LL;
  return result;
}

void der_free_utf8string(void **a1)
{
  *a1 = 0LL;
}

void der_free_printable_string(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void der_free_octet_string(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void der_free_ia5_string(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void der_free_bmp_string(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void der_free_universal_string(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void der_free_visible_string(void **a1)
{
  *a1 = 0LL;
}

void der_free_heim_integer(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void der_free_oid(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void der_free_bit_string(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

uint64_t der_get_unsigned(_BYTE *a1, unint64_t a2, int *a3, unint64_t *a4)
{
  uint64_t v4 = 1859794437LL;
  if (a2 == 5)
  {
    if (*a1) {
      return v4;
    }
  }

  else
  {
    if (a2 > 4) {
      return v4;
    }
    if (!a2)
    {
      int v5 = 0;
      goto LABEL_10;
    }
  }

  int v5 = 0;
  unint64_t v6 = a2;
  do
  {
    int v7 = *a1++;
    int v5 = v7 | (v5 << 8);
    --v6;
  }

  while (v6);
LABEL_10:
  *a3 = v5;
  uint64_t v4 = 0LL;
  if (a4) {
    *a4 = a2;
  }
  return v4;
}

uint64_t der_get_integer(char *a1, unint64_t a2, int *a3, unint64_t *a4)
{
  if (a2 > 4) {
    return 1859794437LL;
  }
  if (a2)
  {
    int v5 = *a1;
    unint64_t v6 = a2 - 1;
    if (a2 != 1)
    {
      int v7 = (unsigned __int8 *)(a1 + 1);
      do
      {
        int v8 = *v7++;
        int v5 = v8 | (v5 << 8);
        --v6;
      }

      while (v6);
    }
  }

  else
  {
    int v5 = 0;
  }

  *a3 = v5;
  uint64_t result = 0LL;
  if (a4) {
    *a4 = a2;
  }
  return result;
}

uint64_t der_get_length(char *a1, uint64_t a2, void *a3, uint64_t *a4)
{
  uint64_t v4 = 1859794437LL;
  if (a2)
  {
    int v6 = *a1;
    int v5 = a1 + 1;
    uint64_t v7 = v6;
    if ((v6 & 0x80000000) == 0)
    {
      *a3 = v7;
      if (!a4) {
        return 0LL;
      }
      goto LABEL_7;
    }

    if ((_DWORD)v7 == 128)
    {
      *a3 = 3705724653LL;
      if (a4)
      {
LABEL_7:
        uint64_t v8 = 1LL;
LABEL_8:
        uint64_t v4 = 0LL;
        *a4 = v8;
        return v4;
      }

      return 0LL;
    }

    unint64_t v9 = v7 & 0x7F;
    if (a2 - 1 < v9) {
      return v4;
    }
    if (v9 == 5)
    {
      if (*v5) {
        return v4;
      }
    }

    else
    {
      if (v9 > 4) {
        return v4;
      }
      if (!v9)
      {
        uint64_t v10 = 0LL;
        goto LABEL_19;
      }
    }

    LODWORD(v10) = 0;
    unint64_t v11 = v9;
    do
    {
      unsigned int v12 = *v5++;
      uint64_t v10 = v12 | ((_DWORD)v10 << 8);
      --v11;
    }

    while (v11);
LABEL_19:
    *a3 = v10;
    if (a4)
    {
      uint64_t v8 = v9 + 1;
      goto LABEL_8;
    }

    return 0LL;
  }

  return v4;
}

uint64_t der_get_BOOLean(unsigned __int8 *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  if (!a2) {
    return 1859794437LL;
  }
  uint64_t result = 0LL;
  *a3 = *a1 != 0;
  *a4 = 1LL;
  return result;
}

uint64_t der_get_general_string(const void *a1, size_t __n, void *a3, void *a4)
{
  uint64_t v8 = memchr(a1, 0, __n);
  if (v8)
  {
    uint64_t v9 = v8 - (_BYTE *)a1;
    if (v8 - (_BYTE *)a1 >= __n || *v8)
    {
LABEL_7:
      if (v9 != __n)
      {
        *a3 = 0LL;
        return 1859794443LL;
      }
    }

    else
    {
      uint64_t v10 = v8 + 1;
      while (++v9 < __n)
      {
        if (*v10++) {
          goto LABEL_7;
        }
      }
    }
  }

  if (__n == -1LL)
  {
    uint64_t result = 1859794439LL;
    *a3 = 0LL;
  }

  else
  {
    unsigned int v12 = malloc(__n + 1);
    *a3 = v12;
    if (v12)
    {
      v13 = v12;
      memcpy(v12, a1, __n);
      v13[__n] = 0;
      uint64_t result = 0LL;
      if (a4) {
        *a4 = __n;
      }
    }

    else
    {
      return 12LL;
    }
  }

  return result;
}

uint64_t der_get_printable_string(const void *a1, size_t a2, size_t *a3, size_t *a4)
{
  if (a2 == -1LL)
  {
    *a3 = 0LL;
    a3[1] = 0LL;
    return 1859794439LL;
  }

  else
  {
    *a3 = a2;
    uint64_t v8 = malloc(a2 + 1);
    a3[1] = (size_t)v8;
    if (v8)
    {
      uint64_t v9 = v8;
      memcpy(v8, a1, a2);
      v9[a2] = 0;
      uint64_t result = 0LL;
      if (a4) {
        *a4 = a2;
      }
    }

    else
    {
      *a3 = 0LL;
      a3[1] = 0LL;
      return 12LL;
    }
  }

  return result;
}

uint64_t der_get_bmp_string( unsigned __int16 *a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  if (!a2)
  {
    uint64_t result = 0LL;
LABEL_7:
    *a3 = 0LL;
    a3[1] = 0LL;
    return result;
  }

  if ((a2 & 1) != 0)
  {
    uint64_t result = 1859794440LL;
    goto LABEL_7;
  }

  unint64_t v6 = a2 >> 1;
  *a3 = a2 >> 1;
  if (HIDWORD(a2))
  {
    *a3 = 0LL;
    a3[1] = 0LL;
    return 34LL;
  }

  else
  {
    uint64_t v10 = malloc(a2 & 0xFFFFFFFFFFFFFFFELL);
    a3[1] = (unint64_t)v10;
    if (a2 < 2 || v10)
    {
      if (a2 < 2)
      {
LABEL_19:
        uint64_t result = 0LL;
        if (a4) {
          *a4 = a2;
        }
      }

      else
      {
        uint64_t v11 = 0LL;
        if (v6 <= 1) {
          uint64_t v12 = 1LL;
        }
        else {
          uint64_t v12 = a2 >> 1;
        }
        while (1)
        {
          unsigned int v13 = __rev16(*a1);
          v10[v11] = v13;
          if (v6 - 1 != v11 && !v13) {
            break;
          }
          ++a1;
          if (v12 == ++v11) {
            goto LABEL_19;
          }
        }

        free(v10);
        *a3 = 0LL;
        a3[1] = 0LL;
        return 1859794443LL;
      }
    }

    else
    {
      *a3 = 0LL;
      a3[1] = 0LL;
      return 12LL;
    }
  }

  return result;
}

uint64_t der_get_universal_string( unsigned int *a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  if (!a2)
  {
    uint64_t result = 0LL;
    goto LABEL_5;
  }

  if ((a2 & 3) != 0)
  {
    uint64_t result = 1859794440LL;
LABEL_5:
    *a3 = 0LL;
    a3[1] = 0LL;
    return result;
  }

  unint64_t v7 = a2 >> 2;
  *a3 = a2 >> 2;
  if (HIDWORD(a2))
  {
    *a3 = 0LL;
    a3[1] = 0LL;
    return 34LL;
  }

  else
  {
    uint64_t v10 = malloc(a2 & 0xFFFFFFFFFFFFFFFCLL);
    a3[1] = (unint64_t)v10;
    if (v10)
    {
      if (a2 < 4)
      {
LABEL_17:
        uint64_t result = 0LL;
        if (a4) {
          *a4 = a2;
        }
      }

      else
      {
        uint64_t v11 = 0LL;
        if (v7 <= 1) {
          uint64_t v12 = 1LL;
        }
        else {
          uint64_t v12 = a2 >> 2;
        }
        while (1)
        {
          unsigned int v13 = bswap32(*a1);
          v10[v11] = v13;
          if (v7 - 1 != v11 && !v13) {
            break;
          }
          ++a1;
          if (v12 == ++v11) {
            goto LABEL_17;
          }
        }

        free(v10);
        *a3 = 0LL;
        a3[1] = 0LL;
        return 1859794443LL;
      }
    }

    else
    {
      *a3 = 0LL;
      a3[1] = 0LL;
      return 12LL;
    }
  }

  return result;
}

uint64_t der_get_octet_string(const void *a1, size_t __size, void *a3, void *a4)
{
  *a3 = __size;
  if (__size)
  {
    uint64_t v8 = malloc(__size);
    a3[1] = v8;
    if (!v8) {
      return 12LL;
    }
    memcpy(v8, a1, __size);
  }

  else
  {
    a3[1] = 0LL;
  }

  uint64_t result = 0LL;
  if (a4) {
    *a4 = __size;
  }
  return result;
}

uint64_t der_get_octet_string_ber(char *a1, unint64_t a2, uint64_t *a3, void *a4)
{
  unint64_t v5 = a2;
  unint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  int v20 = 0;
  uint64_t v9 = 1859794438LL;
  *a3 = 0LL;
  a3[1] = 0LL;
  while (1)
  {
    if (!v5)
    {
      if (v20) {
        return 1859794447LL;
      }
      goto LABEL_24;
    }

    uint64_t tag = der_get_tag(a1, v5, &v24, &v25, &v23, &v22);
    if ((_DWORD)tag) {
      goto LABEL_16;
    }
    if (v24) {
      goto LABEL_20;
    }
    int v11 = v25;
    if (!(v25 | v23)) {
      break;
    }
    if (v23 != 4) {
      goto LABEL_20;
    }
    uint64_t v12 = &a1[v22];
    uint64_t v13 = v5 - v22;
    uint64_t tag = der_get_length(v12, v13, &v21, &v22);
    if ((_DWORD)tag)
    {
LABEL_16:
      uint64_t v9 = tag;
LABEL_20:
      free(v7);
      *a3 = 0LL;
      a3[1] = 0LL;
      return v9;
    }

    size_t v14 = v21;
    if (v21 == 3705724653) {
      return 1859794452LL;
    }
    unint64_t v5 = v13 - v22;
    if (v5 < v21) {
      return 1859794437LL;
    }
    a1 = &v12[v22];
    if (v11)
    {
      ++v20;
      goto LABEL_15;
    }

    if (v8 | v21)
    {
      v15 = (char *)realloc(v7, v8 + v21);
      if (!v15)
      {
        unint64_t v7 = (void *)a3[1];
        uint64_t v9 = 12LL;
        goto LABEL_20;
      }

      unint64_t v7 = v15;
      a3[1] = (uint64_t)v15;
      uint64_t v16 = *a3;
      memcpy(&v15[*a3], a1, v14);
      uint64_t v8 = v16 + v14;
      *a3 = v8;
LABEL_15:
      a1 += v14;
      v5 -= v14;
    }
  }

  if (v20) {
    goto LABEL_20;
  }
LABEL_24:
  uint64_t v9 = 0LL;
  if (a4) {
    *a4 = a2 - v5;
  }
  return v9;
}

uint64_t der_get_tag(_BYTE *a1, uint64_t a2, int *a3, int *a4, _DWORD *a5, uint64_t *a6)
{
  uint64_t result = 1859794437LL;
  if (a2)
  {
    *a3 = *a1 >> 6;
    *a4 = (*a1 >> 5) & 1;
    int v8 = *a1 & 0x1F;
    *a5 = v8;
    if (v8 == 31)
    {
      unsigned int v9 = 0;
      *a5 = 0;
      uint64_t v10 = 1LL;
      while (a2 != v10)
      {
        char v11 = a1[v10];
        unsigned int v12 = v11 & 0x7F | (v9 << 7);
        if (v12 < v9) {
          return 1859794436LL;
        }
        *a5 = v12;
        ++v10;
        unsigned int v9 = v11 & 0x7F | (v9 << 7);
        if ((v11 & 0x80000000) == 0) {
          goto LABEL_9;
        }
      }
    }

    else
    {
      uint64_t v10 = 1LL;
LABEL_9:
      uint64_t result = 0LL;
      if (a6) {
        *a6 = v10;
      }
    }
  }

  return result;
}

uint64_t der_get_heim_integer(char *a1, unint64_t a2, uint64_t a3, unint64_t *a4)
{
  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  *(_DWORD *)(a3 + 16) = 0;
  if (a2)
  {
    unint64_t v6 = a2;
    unint64_t v7 = a1;
    if (*a1 < 0)
    {
      *(_DWORD *)(a3 + 16) = 1;
      *(void *)a3 = a2;
      if (a2 >= 2 && *a1 == 255)
      {
        unint64_t v7 = a1 + 1;
        size_t v10 = a2 - 1;
        *(void *)a3 = a2 - 1;
      }

      else
      {
        size_t v10 = a2;
      }

      unsigned int v12 = (char *)malloc(v10);
      *(void *)(a3 + 8) = v12;
      if (v12)
      {
        size_t v13 = v10 - 1;
        if ((uint64_t)(v10 - 1) >= 0)
        {
          size_t v14 = &v7[v13];
          v15 = &v12[v13];
          BOOL v16 = 1;
          do
          {
            int v17 = *v14;
            char *v15 = ~(_BYTE)v17;
            if (v16)
            {
              char *v15 = -(char)v17;
              BOOL v16 = v17 == 0;
            }

            --v14;
            --v15;
          }

          while (v15 >= v12);
        }

LABEL_21:
        uint64_t result = 0LL;
        if (!a4) {
          return result;
        }
        goto LABEL_22;
      }
    }

    else
    {
      *(void *)a3 = a2;
      if (a2 < 2 || *a1)
      {
        size_t v8 = a2;
      }

      else
      {
        unint64_t v7 = a1 + 1;
        size_t v8 = a2 - 1;
        *(void *)a3 = a2 - 1;
      }

      char v11 = malloc(v8);
      *(void *)(a3 + 8) = v11;
      if (v11)
      {
        memcpy(v11, v7, v8);
        goto LABEL_21;
      }
    }

    unint64_t v6 = 0LL;
    *(void *)a3 = 0LL;
    uint64_t result = 12LL;
    if (!a4) {
      return result;
    }
  }

  else
  {
    uint64_t result = 0LL;
    if (!a4) {
      return result;
    }
    unint64_t v6 = 0LL;
  }

LABEL_22:
  *a4 = v6;
  return result;
}

uint64_t der_get_time(const void *a1, size_t a2, uint64_t *a3, size_t *a4)
{
  uint64_t v5 = 1859794432LL;
  if (a2 + 1 < 2) {
    return 1859794439LL;
  }
  unsigned int v9 = (char *)malloc(a2 + 1);
  if (!v9) {
    return 12LL;
  }
  size_t v10 = v9;
  memcpy(v9, a1, a2);
  v10[a2] = 0;
  uint64_t v16 = 0LL;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v13 = 0u;
  if (sscanf( v10,  "%04d%02d%02d%02d%02d%02dZ",  (char *)&v14 + 4,  &v14,  (unint64_t)&v13 | 0xC,  (char *)&v13 + 8,  (char *)&v13 + 4,  &v13) == 6)
  {
    int v11 = DWORD1(v14);
  }

  else
  {
    if (sscanf( v10,  "%02d%02d%02d%02d%02d%02dZ",  (char *)&v14 + 4,  &v14,  (unint64_t)&v13 | 0xC,  (char *)&v13 + 8,  (char *)&v13 + 4,  &v13) != 6) {
      goto LABEL_11;
    }
    int v11 = DWORD1(v14) + 2000;
    if (SDWORD1(v14) > 49) {
      int v11 = DWORD1(v14) + 1900;
    }
  }

  LODWORD(v14) = v14 - 1;
  DWORD1(v14) = v11 - 1900;
  uint64_t v5 = 0LL;
  *a3 = _der_timegm((int *)&v13);
LABEL_11:
  free(v10);
  if (a4) {
    *a4 = a2;
  }
  return v5;
}

uint64_t der_get_oid(_BYTE *a1, uint64_t a2, unint64_t *a3, void *a4)
{
  uint64_t v4 = 1859794437LL;
  if (a2)
  {
    unint64_t v6 = a2 + 1;
    if (a2 == -1)
    {
      return 1859794439LL;
    }

    else if (v6 >> 30)
    {
      return 34LL;
    }

    else
    {
      size_t v10 = malloc(4 * v6);
      a3[1] = (unint64_t)v10;
      if (v10)
      {
        unsigned int v11 = *a1 % 0x28u;
        *size_t v10 = *a1 / 0x28u;
        v10[1] = v11;
        uint64_t v12 = a2 - 1;
        if (a2 == 1)
        {
          unint64_t v14 = 2LL;
        }

        else
        {
          __int128 v13 = a1 + 1;
          unint64_t v14 = 2LL;
          while (2)
          {
            unsigned int v15 = 0;
            do
            {
              unsigned int v16 = v15;
              char v17 = *v13;
              unsigned int v15 = *v13 & 0x7F | (v15 << 7);
              if (v15 < v16) {
                goto LABEL_16;
              }
              uint64_t v18 = v12;
              ++v13;
              --v12;
            }

            while (v12 && v17 < 0);
            v10[v14++] = v15;
            if (v18 != 1) {
              continue;
            }
            break;
          }

          if (v14 >= 3 && *(v13 - 1) < 0)
          {
LABEL_16:
            der_free_oid((uint64_t)a3);
            return v4;
          }
        }

        *a3 = v14;
        uint64_t v4 = 0LL;
        if (a4) {
          *a4 = a2;
        }
      }

      else
      {
        return 12LL;
      }
    }
  }

  return v4;
}

uint64_t der_match_tag(_BYTE *a1, uint64_t a2, int a3, int a4, unsigned int a5, void *a6)
{
  LODWORD(result) = der_match_tag2(a1, a2, a3, &v9, a5, a6);
  if (v9 == a4) {
    unsigned int v8 = 0;
  }
  else {
    unsigned int v8 = 1859794438;
  }
  if ((_DWORD)result) {
    return result;
  }
  else {
    return v8;
  }
}

uint64_t der_match_tag2(_BYTE *a1, uint64_t a2, int a3, int *a4, unsigned int a5, void *a6)
{
  uint64_t result = der_get_tag(a1, a2, &v11, a4, &v10, &v12);
  if (!(_DWORD)result)
  {
    uint64_t result = 1859794433LL;
    if (v11 == a3)
    {
      if (v10 >= a5)
      {
        if (v10 <= a5)
        {
          uint64_t result = 0LL;
          if (a6) {
            *a6 = v12;
          }
        }
      }

      else
      {
        return 1859794434LL;
      }
    }

    else
    {
      return 1859794438LL;
    }
  }

  return result;
}

uint64_t der_match_tag_and_length( _BYTE *a1, uint64_t a2, int a3, int *a4, unsigned int a5, void *a6, void *a7)
{
  uint64_t result = der_match_tag2(a1, a2, a3, a4, a5, &v13);
  if (!(_DWORD)result)
  {
    uint64_t v12 = v13;
    uint64_t result = der_get_length(&a1[v13], a2 - v13, a6, &v13);
    if (!(_DWORD)result)
    {
      uint64_t result = 0LL;
      if (a7) {
        *a7 = v13 + v12;
      }
    }
  }

  return result;
}

uint64_t _heim_fix_dce(unint64_t a1, unint64_t *a2)
{
  if (a1 == 3705724653) {
    return 1LL;
  }
  if (*a2 < a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *a2 = a1;
  return result;
}

uint64_t der_get_bit_string(unsigned __int8 *a1, unint64_t a2, uint64_t *a3, unint64_t *a4)
{
  if (!a2) {
    return 1859794437LL;
  }
  unsigned int v5 = *a1;
  uint64_t result = 1859794440LL;
  if (v5 <= 7)
  {
    size_t v10 = a2 - 1;
    if (a2 != 1 || !v5)
    {
      uint64_t result = 1859794437LL;
      if (a2 <= 0x2000000000000000LL)
      {
        if (a2 == 1)
        {
          uint64_t v12 = 0LL;
          a3[1] = 0LL;
        }

        else
        {
          *a3 = 8 * v10;
          int v11 = malloc(a2 - 1);
          a3[1] = (uint64_t)v11;
          if (!v11) {
            return 12LL;
          }
          memcpy(v11, a1 + 1, v10);
          uint64_t v12 = 8 * v10 - *a1;
        }

        *a3 = v12;
        uint64_t result = 0LL;
        if (a4) {
          *a4 = a2;
        }
      }
    }
  }

  return result;
}

uint64_t _heim_len_unsigned(unsigned int a1)
{
  uint64_t v1 = 1LL;
  do
  {
    unsigned int v2 = a1;
    a1 >>= 8;
    ++v1;
  }

  while (v2 > 0xFF);
  if (v2 <= 0x7F) {
    return v1 - 1;
  }
  else {
    return v1;
  }
}

uint64_t _heim_len_int(unsigned int a1)
{
  if ((a1 & 0x80000000) != 0)
  {
    unsigned int v3 = ~a1;
    uint64_t v1 = -1LL;
    do
    {
      unsigned int v2 = v3;
      v3 >>= 8;
      ++v1;
    }

    while (v2 >= 0x100);
  }

  else
  {
    uint64_t v1 = -1LL;
    do
    {
      unsigned int v2 = a1;
      a1 >>= 8;
      ++v1;
    }

    while (v2 >= 0x100);
  }

  uint64_t v4 = v1 + 1;
  uint64_t v5 = v1 + 2;
  if (v2 >= 0x80) {
    return v5;
  }
  else {
    return v4;
  }
}

uint64_t der_length_len(unint64_t a1)
{
  if (a1 < 0x80) {
    return 1LL;
  }
  unint64_t v2 = a1;
  uint64_t result = 1LL;
  do
  {
    ++result;
    BOOL v3 = v2 > 0xFF;
    v2 >>= 8;
  }

  while (v3);
  return result;
}

uint64_t der_length_tag(unsigned int a1)
{
  if (a1 < 0x1F) {
    return 1LL;
  }
  unsigned int v2 = a1;
  uint64_t result = 1LL;
  do
  {
    ++result;
    BOOL v3 = v2 > 0x7F;
    v2 >>= 7;
  }

  while (v3);
  return result;
}

uint64_t der_length_integer(unsigned int *a1)
{
  unsigned int v1 = *a1;
  if ((*a1 & 0x80000000) != 0)
  {
    unsigned int v4 = ~v1;
    uint64_t v2 = -1LL;
    do
    {
      unsigned int v3 = v4;
      v4 >>= 8;
      ++v2;
    }

    while (v3 >= 0x100);
  }

  else
  {
    uint64_t v2 = -1LL;
    do
    {
      unsigned int v3 = v1;
      v1 >>= 8;
      ++v2;
    }

    while (v3 >= 0x100);
  }

  uint64_t v5 = v2 + 1;
  uint64_t v6 = v2 + 2;
  if (v3 >= 0x80) {
    return v6;
  }
  else {
    return v5;
  }
}

uint64_t der_length_unsigned(unsigned int *a1)
{
  unsigned int v1 = *a1;
  uint64_t v2 = 1LL;
  do
  {
    unsigned int v3 = v1;
    v1 >>= 8;
    ++v2;
  }

  while (v3 > 0xFF);
  if (v3 <= 0x7F) {
    return v2 - 1;
  }
  else {
    return v2;
  }
}

uint64_t der_length_enumerated(unsigned int *a1)
{
  unsigned int v1 = *a1;
  if ((*a1 & 0x80000000) != 0)
  {
    unsigned int v4 = ~v1;
    uint64_t v2 = -1LL;
    do
    {
      unsigned int v3 = v4;
      v4 >>= 8;
      ++v2;
    }

    while (v3 >= 0x100);
  }

  else
  {
    uint64_t v2 = -1LL;
    do
    {
      unsigned int v3 = v1;
      v1 >>= 8;
      ++v2;
    }

    while (v3 >= 0x100);
  }

  uint64_t v5 = v2 + 1;
  uint64_t v6 = v2 + 2;
  if (v3 >= 0x80) {
    return v6;
  }
  else {
    return v5;
  }
}

size_t der_length_general_string(const char **a1)
{
  return strlen(*a1);
}

size_t der_length_utf8string(const char **a1)
{
  return strlen(*a1);
}

uint64_t der_length_printable_string(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t der_length_ia5_string(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t der_length_bmp_string(void *a1)
{
  return 2LL * *a1;
}

uint64_t der_length_universal_string(void *a1)
{
  return 4LL * *a1;
}

size_t der_length_visible_string(const char **a1)
{
  return strlen(*a1);
}

uint64_t der_length_octet_string(uint64_t a1)
{
  return *(void *)a1;
}

unint64_t der_length_heim_integer(uint64_t a1)
{
  if (*(void *)a1) {
    return *(void *)a1 + ((unint64_t)**(unsigned __int8 **)(a1 + 8) >> 7);
  }
  else {
    return 1LL;
  }
}

uint64_t der_length_oid(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  uint64_t result = 1LL;
  uint64_t v4 = 2LL;
  do
  {
    unsigned int v5 = *(_DWORD *)(v2 + 4 * v4);
    do
    {
      ++result;
      BOOL v6 = v5 > 0x7F;
      v5 >>= 7;
    }

    while (v6);
    ++v4;
  }

  while (v4 != v1);
  return result;
}

uint64_t der_length_generalized_time(uint64_t *a1)
{
  uint64_t v1 = v3[0];
  free((void *)v3[1]);
  return v1;
}

uint64_t der_length_utctime(uint64_t *a1)
{
  uint64_t v1 = v3[0];
  free((void *)v3[1]);
  return v1;
}

uint64_t der_length_BOOLean()
{
  return 1LL;
}

unint64_t der_length_bit_string(void *a1)
{
  return ((unint64_t)(*a1 + 7LL) >> 3) + 1;
}

uint64_t der_put_unsigned(_BYTE *a1, uint64_t a2, unsigned int *a3, uint64_t *a4)
{
  uint64_t v4 = 1859794436LL;
  unsigned int v5 = *a3;
  if (*a3)
  {
    if (a2)
    {
      BOOL v6 = a1;
      do
      {
        unsigned int v7 = v5;
        *v6-- = v5;
        if (!--a2) {
          break;
        }
        v5 >>= 8;
      }

      while (v7 > 0xFF);
      if (v7 <= 0xFF)
      {
        if ((v7 & 0x80) == 0)
        {
LABEL_10:
          uint64_t v8 = a1 - v6;
LABEL_13:
          uint64_t v4 = 0LL;
          *a4 = v8;
          return v4;
        }

        if (a2)
        {
          *v6-- = 0;
          goto LABEL_10;
        }
      }
    }
  }

  else if (a2)
  {
    *a1 = 0;
    uint64_t v8 = 1LL;
    goto LABEL_13;
  }

  return v4;
}

uint64_t der_put_integer(_BYTE *a1, uint64_t a2, unsigned int *a3, void *a4)
{
  unsigned int v4 = *a3;
  if ((*a3 & 0x80000000) != 0)
  {
    unsigned int v7 = ~v4;
    unsigned int v5 = a1;
    while (a2)
    {
      unsigned int v8 = v7;
      *v5-- = ~(_BYTE)v7;
      --a2;
      v7 >>= 8;
      if (v8 <= 0xFF)
      {
        if ((v8 & 0x80) != 0)
        {
          if (!a2) {
            return 1859794436LL;
          }
          *v5-- = -1;
        }

LABEL_14:
        uint64_t v9 = 0LL;
        *a4 = a1 - v5;
        return v9;
      }
    }
  }

  else
  {
    unsigned int v5 = a1;
    while (a2)
    {
      unsigned int v6 = v4;
      *v5-- = v4;
      --a2;
      v4 >>= 8;
      if (v6 <= 0xFF)
      {
        if ((v6 & 0x80) == 0) {
          goto LABEL_14;
        }
        if (a2)
        {
          *v5-- = 0;
          goto LABEL_14;
        }

        return 1859794436LL;
      }
    }
  }

  return 1859794436LL;
}

uint64_t der_put_length(_BYTE *a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  uint64_t result = 1859794436LL;
  if (a2)
  {
    if (a3 >= 0x80)
    {
      uint64_t v7 = 0LL;
      while (1 - a2 != v7)
      {
        a1[v7--] = a3;
        BOOL v8 = a3 > 0xFF;
        a3 >>= 8;
        if (!v8)
        {
          a1[v7] = -(char)v7 | 0x80;
          if (a4)
          {
            uint64_t v6 = 1 - v7;
            goto LABEL_9;
          }

          return 0LL;
        }
      }
    }

    else
    {
      *a1 = a3;
      uint64_t v6 = 1LL;
LABEL_9:
      uint64_t result = 0LL;
      *a4 = v6;
    }
  }

  return result;
}

uint64_t der_put_BOOLean(char *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  if (!a2) {
    return 1859794436LL;
  }
  uint64_t result = 0LL;
  if (*a3) {
    char v6 = -1;
  }
  else {
    char v6 = 0;
  }
  *a1 = v6;
  *a4 = 1LL;
  return result;
}

uint64_t der_put_general_string(uint64_t a1, size_t a2, const char **a3, size_t *a4)
{
  uint64_t v7 = *a3;
  size_t v8 = strlen(*a3);
  if (v8 > a2) {
    return 1859794436LL;
  }
  size_t v10 = v8;
  memcpy((void *)(a1 - v8 + 1), v7, v8);
  uint64_t result = 0LL;
  *a4 = v10;
  return result;
}

uint64_t der_put_printable_string(uint64_t a1, size_t a2, uint64_t a3, void *a4)
{
  size_t v5 = *(void *)a3;
  if (v5 > a2) {
    return 1859794436LL;
  }
  memcpy((void *)(a1 - v5 + 1), *(const void **)(a3 + 8), v5);
  uint64_t result = 0LL;
  *a4 = *(void *)a3;
  return result;
}

uint64_t der_put_octet_string(uint64_t a1, size_t a2, uint64_t a3, void *a4)
{
  size_t v5 = *(void *)a3;
  if (v5 > a2) {
    return 1859794436LL;
  }
  memcpy((void *)(a1 - v5 + 1), *(const void **)(a3 + 8), v5);
  uint64_t result = 0LL;
  *a4 = *(void *)a3;
  return result;
}

uint64_t der_put_ia5_string(uint64_t a1, size_t a2, uint64_t a3, void *a4)
{
  size_t v5 = *(void *)a3;
  if (v5 > a2) {
    return 1859794436LL;
  }
  memcpy((void *)(a1 - v5 + 1), *(const void **)(a3 + 8), v5);
  uint64_t result = 0LL;
  *a4 = *(void *)a3;
  return result;
}

uint64_t der_put_bmp_string(uint64_t a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  unint64_t v4 = *a3;
  if (*a3 > a2 >> 1) {
    return 1859794436LL;
  }
  unint64_t v6 = 0LL;
  if (v4)
  {
    uint64_t v7 = a1 - 2 * v4;
    do
    {
      *(_BYTE *)(v7 + 1) = *(_BYTE *)(a3[1] + 2 * v6 + 1);
      *(_BYTE *)(v7 + 2) = *(_BYTE *)(a3[1] + 2 * v6);
      v7 += 2LL;
      ++v6;
    }

    while (v6 < *a3);
    unint64_t v6 = 2 * *a3;
  }

  uint64_t result = 0LL;
  if (a4) {
    *a4 = v6;
  }
  return result;
}

uint64_t der_put_universal_string(uint64_t a1, unint64_t a2, unint64_t *a3, uint64_t *a4)
{
  unint64_t v4 = *a3;
  if (*a3 > a2 >> 2) {
    return 1859794436LL;
  }
  uint64_t v6 = 0LL;
  if (v4)
  {
    unint64_t v7 = 0LL;
    uint64_t v8 = a1 - 4 * v4;
    do
    {
      uint64_t v9 = (_BYTE *)(v8 + v6);
      v9[1] = *(_BYTE *)(a3[1] + v6 + 3);
      v9[2] = *(_WORD *)(a3[1] + v6 + 2);
      v9[3] = BYTE1(*(_DWORD *)(a3[1] + v6));
      v9[4] = *(_DWORD *)(a3[1] + v6);
      ++v7;
      v6 += 4LL;
    }

    while (v7 < *a3);
    uint64_t v6 = 4 * *a3;
  }

  uint64_t result = 0LL;
  if (a4) {
    *a4 = v6;
  }
  return result;
}

uint64_t der_put_heim_integer(_BYTE *a1, size_t a2, uint64_t a3, uint64_t *a4)
{
  size_t v6 = *(void *)a3;
  if (!*(void *)a3)
  {
    if (!a2) {
      return 1859794436LL;
    }
    *a1 = 0;
    if (a4)
    {
      uint64_t v13 = 1LL;
LABEL_19:
      uint64_t v7 = 0LL;
      *a4 = v13;
      return v7;
    }

    return 0LL;
  }

  uint64_t v7 = 1859794436LL;
  if (v6 > a2) {
    return v7;
  }
  uint64_t v9 = *(char **)(a3 + 8);
  if (!*(_DWORD *)(a3 + 16))
  {
    unint64_t v14 = &a1[-v6];
    memcpy(&a1[-v6 + 1], v9, *(void *)a3);
    if ((char)v14[1] < 0)
    {
      if (v6 == a2) {
        return v7;
      }
      *unint64_t v14 = 0;
      goto LABEL_22;
    }

    goto LABEL_17;
  }

  if ((uint64_t)(v6 - 1) >= 0)
  {
    BOOL v10 = 1;
    uint64_t v11 = *(void *)a3;
    do
    {
      int v12 = v9[v11 - 1];
      *a1 = ~(_BYTE)v12;
      if (v10)
      {
        *a1 = -(char)v12;
        BOOL v10 = v12 == 0;
      }

      --a1;
      --v11;
    }

    while (v11 > 0);
  }

  if ((char)a1[1] < 0)
  {
LABEL_17:
    uint64_t v15 = 0LL;
    if (a4)
    {
LABEL_18:
      uint64_t v13 = *(void *)a3 + v15;
      goto LABEL_19;
    }

    return 0LL;
  }

  if (v6 != a2)
  {
    *a1 = -1;
LABEL_22:
    uint64_t v15 = 1LL;
    if (!a4) {
      return 0LL;
    }
    goto LABEL_18;
  }

  return v7;
}

uint64_t der_put_generalized_time(uint64_t a1, size_t a2, uint64_t *a3, size_t *a4)
{
  uint64_t result = _heim_time2generalizedtime(*a3, (uint64_t *)&__n, 1);
  if (!(_DWORD)result)
  {
    size_t v8 = __n;
    if (__n <= a2)
    {
      uint64_t v9 = (void *)(a1 - __n + 1);
      BOOL v10 = __src;
      memcpy(v9, __src, __n);
      free(v10);
      uint64_t result = 0LL;
      if (a4) {
        *a4 = v8;
      }
    }

    else
    {
      free(__src);
      return 1859794436LL;
    }
  }

  return result;
}

uint64_t _heim_time2generalizedtime(uint64_t a1, uint64_t *a2, int a3)
{
  if (a3) {
    uint64_t v6 = 15LL;
  }
  else {
    uint64_t v6 = 13LL;
  }
  uint64_t v7 = malloc(v6 + 1);
  a2[1] = (uint64_t)v7;
  if (!v7) {
    return 12LL;
  }
  *a2 = v6;
  uint64_t v8 = _der_gmtime(a1, (uint64_t)&v11);
  uint64_t v9 = (char *)a2[1];
  if (v8)
  {
    if (a3) {
      snprintf(v9, v6 + 1, "%04d%02d%02d%02d%02d%02dZ", (v12 + 1900));
    }
    else {
      snprintf(v9, v6 + 1, "%02d%02d%02d%02d%02d%02dZ", (v12 % 100));
    }
    return 0LL;
  }

  else
  {
    free(v9);
    *a2 = 0LL;
    a2[1] = 0LL;
    return 1859794432LL;
  }
}

uint64_t der_put_utctime(uint64_t a1, size_t a2, uint64_t *a3, size_t *a4)
{
  uint64_t result = _heim_time2generalizedtime(*a3, (uint64_t *)&__n, 0);
  if (!(_DWORD)result)
  {
    size_t v8 = __n;
    if (__n <= a2)
    {
      uint64_t v9 = (void *)(a1 - __n + 1);
      BOOL v10 = __src;
      memcpy(v9, __src, __n);
      free(v10);
      uint64_t result = 0LL;
      if (a4) {
        *a4 = v8;
      }
    }

    else
    {
      free(__src);
      return 1859794436LL;
    }
  }

  return result;
}

uint64_t der_put_oid(_BYTE *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t result = 1859794436LL;
  unint64_t v6 = *a3 - 1LL;
  uint64_t v7 = a1;
  while (1)
  {
    if (v6 < 2)
    {
      if (a2)
      {
        uint64_t result = 0LL;
        *uint64_t v7 = *(_BYTE *)(a3[1] + 4LL) + 40 * *(_BYTE *)a3[1];
        *a4 = a1 - v7 + 1;
      }

      return result;
    }

    if (!a2) {
      return result;
    }
    unsigned int v8 = *(_DWORD *)(a3[1] + 4 * v6);
    *v7-- = v8 & 0x7F;
    --a2;
    if (v8 >= 0x80) {
      break;
    }
LABEL_7:
    --v6;
  }

  while (a2)
  {
    *v7-- = (v8 >> 7) | 0x80;
    --a2;
    BOOL v9 = v8 >= 0x4000;
    v8 >>= 7;
    if (!v9) {
      goto LABEL_7;
    }
  }

  return result;
}

uint64_t der_put_tag(_BYTE *a1, uint64_t a2, char a3, char a4, unsigned int a5, uint64_t *a6)
{
  if (a5 >= 0x1F)
  {
    uint64_t v7 = 0LL;
    char v8 = 0;
    uint64_t v9 = 1859794436LL;
    while (-a2 != v7)
    {
      a1[v7--] = v8 | a5 & 0x7F;
      char v8 = 0x80;
      BOOL v10 = a5 > 0x7F;
      a5 >>= 7;
      if (!v10)
      {
        if (!(a2 + v7)) {
          return v9;
        }
        a1[v7] = (32 * a4) | (a3 << 6) | 0x1F;
        uint64_t v6 = 1 - v7;
        goto LABEL_9;
      }
    }
  }

  else if (a2)
  {
    *a1 = (32 * a4) | (a3 << 6) | a5;
    uint64_t v6 = 1LL;
LABEL_9:
    uint64_t v9 = 0LL;
    *a6 = v6;
  }

  else
  {
    return 1859794436LL;
  }

  return v9;
}

uint64_t der_put_length_and_tag( _BYTE *a1, uint64_t a2, unint64_t a3, char a4, char a5, unsigned int a6, void *a7)
{
  uint64_t v7 = 1859794436LL;
  if (a2)
  {
    if (a3 >= 0x80)
    {
      uint64_t v10 = 0LL;
      while (1 - a2 != v10)
      {
        a1[v10--] = a3;
        BOOL v11 = a3 > 0xFF;
        a3 >>= 8;
        if (!v11)
        {
          a1[v10] = -(char)v10 | 0x80;
          uint64_t v9 = 1 - v10;
          goto LABEL_8;
        }
      }
    }

    else
    {
      *a1 = a3;
      uint64_t v9 = 1LL;
LABEL_8:
      uint64_t v13 = v9;
      uint64_t v7 = der_put_tag(&a1[-v9], a2 - v9, a4, a5, a6, &v13);
      if (!(_DWORD)v7) {
        *a7 = v13 + v9;
      }
    }
  }

  return v7;
}

uint64_t der_put_bit_string(uint64_t a1, size_t a2, uint64_t a3, size_t *a4)
{
  size_t v5 = (unint64_t)(*(void *)a3 + 7LL) >> 3;
  if (v5 >= a2) {
    return 1859794436LL;
  }
  size_t v7 = v5 + 1;
  size_t v8 = a1 + ~v5;
  memcpy((void *)(v8 + 2), *(const void **)(a3 + 8), v5);
  uint64_t v9 = *(void *)a3;
  if (*(void *)a3)
  {
    uint64_t v9 = *(void *)a3 & 7LL;
    if (v9) {
      LOBYTE(v9) = 8 - v9;
    }
  }

  uint64_t result = 0LL;
  *(_BYTE *)(v8 + 1) = v9;
  *a4 = v7;
  return result;
}

uint64_t _heim_der_set_sort(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)a1;
  size_t v3 = *(void *)a2;
  if (*(void *)a1 >= *(void *)a2) {
    size_t v4 = *(void *)a2;
  }
  else {
    size_t v4 = *(void *)a1;
  }
  LODWORD(result) = memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v4);
  if ((_DWORD)result) {
    return result;
  }
  else {
    return (v2 - v3);
  }
}

char *der_get_class_name(unsigned int a1)
{
  if (a1 <= 3) {
    return class_names[a1];
  }
  else {
    return 0LL;
  }
}

uint64_t der_get_class_num(char *a1)
{
  uint64_t v2 = 0LL;
  while (1)
  {
    size_t v3 = class_names[v2];
    if (v3)
    {
      if (!strcasecmp(v3, a1)) {
        break;
      }
    }

    if (++v2 == 4) {
      return 0xFFFFFFFFLL;
    }
  }

  return v2;
}

char *der_get_type_name(unsigned int a1)
{
  if (a1 <= 1) {
    return type_names[a1];
  }
  else {
    return 0LL;
  }
}

uint64_t der_get_type_num(char *a1)
{
  uint64_t v2 = 0LL;
  while (1)
  {
    size_t v3 = type_names[v2];
    if (v3)
    {
      if (!strcasecmp(v3, a1)) {
        break;
      }
    }

    if (++v2 == 2) {
      return 0xFFFFFFFFLL;
    }
  }

  return v2;
}

char *der_get_tag_name(unsigned int a1)
{
  if (a1 <= 0x1E) {
    return tag_names[a1];
  }
  else {
    return 0LL;
  }
}

uint64_t der_get_tag_num(char *a1)
{
  uint64_t v2 = 0LL;
  while (1)
  {
    size_t v3 = tag_names[v2];
    if (v3)
    {
      if (!strcasecmp(v3, a1)) {
        break;
      }
    }

    if (++v2 == 31) {
      return 0xFFFFFFFFLL;
    }
  }

  return v2;
}

uint64_t decode_heim_any(_BYTE *a1, unint64_t a2, size_t *a3, size_t *a4)
{
  *a3 = 0LL;
  a3[1] = 0LL;
  uint64_t result = der_get_tag(a1, a2, &v13, &v12, &v11, (uint64_t *)&v14);
  if (!(_DWORD)result)
  {
    uint64_t result = 1859794436LL;
    if (a2 >= v14)
    {
      uint64_t result = der_get_length(&a1[v14], a2 - v14, &v15, &v16);
      if (!(_DWORD)result)
      {
        if (v15 == 3705724653LL)
        {
          uint64_t result = 1859794436LL;
          if (a2 < v14 + v16) {
            return result;
          }
          size_t v9 = a2;
        }

        else
        {
          size_t v9 = v16 + v15 + v14;
          uint64_t result = 1859794436LL;
          if (v9 > a2) {
            return result;
          }
        }

        uint64_t v10 = malloc(v9);
        a3[1] = (size_t)v10;
        if (v10)
        {
          *a3 = v9;
          memcpy(v10, a1, v9);
          uint64_t result = 0LL;
          if (a4) {
            *a4 = v9;
          }
        }

        else
        {
          return 12LL;
        }
      }
    }
  }

  return result;
}

uint64_t length_heim_any(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t length_heim_any_set(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t _der_timegm(int *a1)
{
  int v1 = a1[5];
  if (v1 > 2000) {
    return 0LL;
  }
  if (v1 < 0) {
    return -1LL;
  }
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[3];
  int v5 = v1 + 1900;
  int v6 = a1[5] & 3;
  if ((v1 & 3) != 0)
  {
    BOOL v7 = 0;
  }

  else
  {
    HIDWORD(v8) = -1030792151 * (unsigned __int16)(v1 + 1900);
    LODWORD(v8) = HIDWORD(v8);
    if ((v8 >> 2) <= 0x28F5C28)
    {
      HIDWORD(v9) = -1030792151 * (unsigned __int16)(v1 + 1900);
      LODWORD(v9) = HIDWORD(v9);
      BOOL v7 = (v9 >> 4) < 0xA3D70B;
    }

    else
    {
      BOOL v7 = 1;
    }
  }

  uint64_t v10 = a1[2];
  uint64_t v11 = a1[1];
  uint64_t v12 = *a1;
  if (v1 < 0x47)
  {
    uint64_t v13 = 0LL;
  }

  else
  {
    uint64_t v13 = 0LL;
    int v14 = 70;
    int v15 = -1970;
    unsigned int v16 = 1970;
    do
    {
      if ((v14 & 3) == 0 && (!(v15 + 100 * (v16 / 0x64)) ? (BOOL v17 = v15 + 400 * (v16 / 0x190) == 0) : (BOOL v17 = 1), v17)) {
        uint64_t v18 = 366LL;
      }
      else {
        uint64_t v18 = 365LL;
      }
      v13 += v18;
      ++v14;
      --v15;
      ++v16;
    }

    while (v1 != v14);
  }

  if ((int)v3 >= 1)
  {
    HIDWORD(v19) = -1030792151 * v5;
    LODWORD(v19) = -1030792151 * v5;
    BOOL v20 = (v19 >> 2) > 0x28F5C28;
    HIDWORD(v19) = -1030792151 * v5;
    LODWORD(v19) = -1030792151 * v5;
    unsigned int v21 = v19 >> 4;
    unsigned int v24 = (v20 || v21 < 0xA3D70B) && v6 == 0;
    int v25 = &ndays[12 * v24];
    do
    {
      unsigned int v26 = *v25++;
      v13 += v26;
      --v3;
    }

    while (v3);
  }

  return v12 + 60 * (v11 + 60 * (v10 + 24 * (v4 + v13)) - 1440);
}

uint64_t _der_gmtime(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  uint64_t v4 = a1 / 86400;
  int v5 = a1 % 86400;
  int v6 = v5 % 60;
  int v7 = v5 / 3600;
  unsigned int v8 = v5 % 3600 + ((-30583 * (v5 % 3600)) >> 16);
  *(void *)(a2 + 48) = 0LL;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_DWORD *)a2 = v6;
  *(_DWORD *)(a2 + 4) = ((__int16)v8 >> 5) + ((unsigned __int16)(v8 & 0x8000) >> 15);
  *(_DWORD *)(a2 + 8) = v7;
  if (a1 <= 0xEAF63A97FLL)
  {
    int v9 = 0;
    *(_DWORD *)(a2 + 20) = 70;
    int v10 = -1970;
    for (unsigned int i = 1970; ; ++i)
    {
      if ((((_BYTE)v9 + 70) & 3) == 0
        && (!(v10 + 100 * (i / 0x64)) ? (BOOL v12 = v10 + 400 * (i / 0x190) == 0) : (BOOL v12 = 1), v12))
      {
        uint64_t v13 = 366LL;
      }

      else
      {
        uint64_t v13 = 365LL;
      }

      BOOL v14 = __OFSUB__(v4, v13);
      uint64_t v15 = v4 - v13;
      if (v15 < 0 != v14) {
        break;
      }
      *(_DWORD *)(a2 + 20) = v9 + 71;
      --v10;
      ++v9;
      uint64_t v4 = v15;
    }

    BOOL v12 = v10 + 100 * (i / 0x64) == 0;
    unsigned int v16 = v10 + 400 * (i / 0x190);
    int v19 = (!v12 || v16 == 0) && (((_BYTE)v9 + 70) & 3) == 0;
    uint64_t v20 = ndays[12 * v19];
    if (v4 >= v20)
    {
      uint64_t v21 = 0LL;
      uint64_t v22 = &ndays[12 * v19 + 1];
      do
      {
        v4 -= v20;
        uint64_t v20 = v22[v21++];
      }

      while (v4 >= v20);
    }

    else
    {
      LODWORD(v21) = 0;
    }

    *(_DWORD *)(a2 + 12) = v4 + 1;
    *(_DWORD *)(a2 + 16) = v21;
    return a2;
  }

  return result;
}

uint64_t rk_hex_encode(unsigned __int8 *a1, uint64_t a2, void *a3)
{
  return encode_hex(a1, a2, (uint64_t)hexchar_upper, a3);
}

uint64_t encode_hex(unsigned __int8 *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2 < 0)
  {
    unsigned int v8 = 0LL;
    goto LABEL_8;
  }

  uint64_t v6 = a2;
  unsigned int v8 = (char *)malloc((2 * a2) | 1);
  if (!v8)
  {
LABEL_8:
    uint64_t v9 = -1LL;
    goto LABEL_11;
  }

  if (v6)
  {
    uint64_t v9 = 2 * v6;
    int v10 = v8 + 1;
    do
    {
      unsigned int v11 = *a1++;
      *(v10 - 1) = *(_BYTE *)(a3 + ((unint64_t)v11 >> 4));
      *int v10 = *(_BYTE *)(a3 + (v11 & 0xF));
      v10 += 2;
      --v6;
    }

    while (v6);
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  v8[v9] = 0;
LABEL_11:
  *a4 = v8;
  return v9;
}

uint64_t rk_hex_decode(const char *a1, _BYTE *a2, size_t a3)
{
  int v5 = (unsigned __int8 *)a1;
  size_t v6 = strlen(a1);
  size_t v7 = v6 & 1;
  if (v7 + (v6 >> 1) > a3) {
    return -1LL;
  }
  unint64_t v9 = v6;
  if ((v6 & 1) != 0)
  {
    unsigned __int8 v10 = *v5++;
    *a2++ = pos(v10);
  }

  if (v9 >= 2)
  {
    if (v9 >> 1 <= 1) {
      uint64_t v11 = 1LL;
    }
    else {
      uint64_t v11 = v9 >> 1;
    }
    BOOL v12 = v5 + 1;
    uint64_t v13 = v11;
    do
    {
      char v14 = pos(*(v12 - 1));
      *a2++ = pos(*v12) | (16 * v14);
      v12 += 2;
      --v13;
    }

    while (v13);
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  return v11 + v7;
}

uint64_t pos(unsigned __int8 a1)
{
  char v1 = __toupper(a1);
  uint64_t result = 0LL;
  LOBYTE(v3) = 48;
  while (v1 != (char)v3)
  {
    int v3 = hexchar_upper[++result];
    if (!v3) {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

void rk_strpoolfree(void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    free(v2);
  }
  free(a1);
}

void **rk_strpoolprintf(void **a1, char *a2, ...)
{
  int v3 = a1;
  if (!a1)
  {
    uint64_t v4 = (void **)malloc(0x10uLL);
    int v3 = v4;
    if (!v4) {
      return v3;
    }
    const char *v4 = 0LL;
    v4[1] = 0LL;
  }

  va_copy((va_list)&__src[1], va);
  int v5 = vasprintf((char **)__src, a2, va);
  if (__src[0] && (int v6 = v5, (v7 = (char *)realloc(*v3, (size_t)v3[1] + v5 + 1)) != 0LL))
  {
    const char *v3 = v7;
    unsigned int v8 = (char *)v3[1];
    unint64_t v9 = __src[0];
    memcpy(&v8[(void)v7], __src[0], v6 + 1);
    v3[1] = &v8[v6];
    free(v9);
  }

  else
  {
    rk_strpoolfree(v3);
    return 0LL;
  }

  return v3;
}

char *rk_strpoolcollect(uint64_t *a1)
{
  if (!a1) {
    return strdup((const char *)&unk_180F79E1D);
  }
  uint64_t v1 = *a1;
  free(a1);
  return (char *)v1;
}

void asn1_abort(char *__format, ...)
{
  __crashreporter_info__ = (uint64_t)crashreporter_info;
  abort();
}

uint64_t _asn1_sizeofType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t _asn1_bmember_isset_bit(_DWORD *a1, char a2)
{
  return (*a1 >> a2) & 1;
}

_BYTE *_asn1_bmember_put_bit(_BYTE *result, _DWORD *a2, char a3, uint64_t a4, _DWORD *a5)
{
  if (((*a2 >> a3) & 1) != 0)
  {
    *result |= 1 << (a3 & 7 ^ 7);
    if (!*a5) {
      *a5 = 8 - (a3 & 7);
    }
  }

  return result;
}

uint64_t _asn1_decode(int *a1, uint64_t a2, unsigned __int8 *a3, size_t a4, size_t *a5, size_t *a6)
{
  size_t v7 = a4;
  uint64_t v8 = *((void *)a1 + 1);
  int v75 = *a1;
  if ((*a1 & 1) != 0) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = 0LL;
  }
  v77 = v9;
  size_t v10 = a4;
  if (!v8)
  {
LABEL_88:
    if ((v75 & 2) != 0) {
      size_t v66 = 0LL;
    }
    else {
      size_t v66 = v10;
    }
    size_t v67 = v7 - v66;
    if (a6) {
      *a6 = v67;
    }
    if (v77)
    {
      v68 = malloc(v67);
      a5[1] = (size_t)v68;
      if (!v68) {
        return 12LL;
      }
      *a5 = v67;
      memcpy(v68, v77, v67);
    }

    return 0LL;
  }

  uint64_t v11 = a3;
  uint64_t v12 = a2;
  uint64_t v13 = (unsigned int *)a1;
  unsigned int v78 = a2 & 0xFFFFFFFA;
  unsigned int v79 = a2;
  int v73 = a2 & 1;
  size_t v10 = a4;
  while (2)
  {
    char v14 = v13;
    unsigned int v16 = v13[4];
    v13 += 4;
    unsigned int v15 = v16;
    unsigned int v17 = v16 >> 28;
    switch((v16 >> 28) ^ 8)
    {
      case 0u:
        v28 = (unsigned int *)*((void *)v14 + 3);
        uint64_t v29 = v28[1];
        *(_DWORD *)((char *)a5 + v29) = 0;
        uint64_t v30 = *((void *)v28 + 1);
        if ((unint64_t)(v30 - 1) > 0xFFFFFFFFFFFFFFFDLL)
        {
          unint64_t v31 = 1LL;
        }

        else
        {
          uint64_t v72 = v29;
          unint64_t v31 = 1LL;
          while (1)
          {
            v32 = &v28[4 * v31];
            uint64_t v34 = *((void *)v32 + 1);
            v33 = (uint64_t *)(v32 + 2);
            v35 = (unsigned int *)v33 - 1;
            uint64_t v36 = _asn1_decode(v34, 0LL, v11, v10, (char *)a5 + *((unsigned int *)v33 - 1), &v83);
            uint64_t v38 = *v33;
            v39 = (char *)a5 + *v35;
            _asn1_free(v38, (uint64_t)v39);
            bzero(v39, *(unsigned int *)(v38 + 4));
            unint64_t v31 = (v31 + 1);
            uint64_t v30 = *((void *)v28 + 1);
            if (v30 + 1 <= v31)
            {
              size_t v7 = a4;
              uint64_t v29 = v72;
              goto LABEL_50;
            }
          }

          uint64_t v60 = v36;
          if ((_DWORD)v36)
          {
            uint64_t v69 = *v33;
            v70 = (char *)a5 + *v35;
            _asn1_free(v69, (uint64_t)v70);
            bzero(v70, *(unsigned int *)(v69 + 4));
            return v60;
          }

          uint64_t v29 = v72;
          *(_DWORD *)((char *)a5 + v72) = v31;
          v11 += v83;
          v10 -= v83;
          uint64_t v30 = *((void *)v28 + 1);
          size_t v7 = a4;
        }

LABEL_50:
        if (v30 + 1 > v31)
        {
LABEL_54:
          uint64_t v12 = v79;
          goto LABEL_87;
        }

        if (!*v28) {
          return 1859794438LL;
        }
        *(_DWORD *)((char *)a5 + v29) = -1;
        uint64_t octet_string = der_get_octet_string(v11, v10, (size_t *)((char *)a5 + *v28), &v83);
        if (!(_DWORD)octet_string)
        {
          v11 += v83;
          v10 -= v83;
          size_t v7 = a4;
          goto LABEL_54;
        }

        return octet_string;
      case 9u:
      case 0xAu:
        uint64_t v18 = *((void *)v14 + 3);
        if (v17 == 1) {
          size_t v19 = *(unsigned int *)(v18 + 4);
        }
        else {
          size_t v19 = *(void *)(v18 + 40);
        }
        v45 = (void **)((char *)a5 + v14[5]);
        v46 = v45;
        if ((v15 & 0x1000000) == 0) {
          goto LABEL_43;
        }
        v47 = calloc(1uLL, v19);
        *v45 = v47;
        if (!v47) {
          return 12LL;
        }
        v46 = (void **)v47;
        unsigned int v15 = *v13;
LABEL_43:
        uint64_t v48 = *((void *)v14 + 3);
        if (v15 >> 28 == 1)
        {
          uint64_t result = _asn1_decode(v48, v12, v11, v10, v46, &v83);
          if (!(_DWORD)result) {
            goto LABEL_48;
          }
        }

        else
        {
          uint64_t result = (*(uint64_t (**)(unsigned __int8 *, size_t, void **, unint64_t *))(v48 + 8))( v11,  v10,  v46,  &v83);
          if (!(_DWORD)result)
          {
LABEL_48:
            v11 += v83;
            v10 -= v83;
            goto LABEL_87;
          }
        }

        if ((*((_BYTE *)v13 + 3) & 1) == 0) {
          return result;
        }
        free(*v45);
        *v45 = 0LL;
        goto LABEL_87;
      case 0xBu:
        uint64_t result = der_match_tag_and_length(v11, v10, (v15 >> 22) & 3, &v82, v15 & 0x1FFFFF, &v81, &v80);
        if ((_DWORD)result)
        {
          if ((*v13 & 0x1000000) == 0) {
            return result;
          }
        }

        else
        {
          unsigned int v54 = *v13;
          uint64_t v55 = v12;
          if ((v12 & 2) != 0)
          {
            uint64_t v55 = v12;
            if (v82 != ((v54 >> 21) & 1)) {
              uint64_t v55 = ((*(_DWORD *)(*((void *)v14 + 3) + 16LL) & 0xF0000FFF) == 1073741829) | v12;
            }
          }

          uint64_t v57 = v80;
          unint64_t v56 = v81;
          unint64_t v58 = v10 - v80;
          if (v81 == 3705724653)
          {
            if ((v79 & 2) == 0) {
              return 1859794449LL;
            }
            unint64_t v59 = v58 - 2;
            if (v58 < 2) {
              return 1859794437LL;
            }
            uint64_t v55 = v55 | 4;
            unint64_t v81 = v58 - 2;
          }

          else
          {
            unint64_t v59 = v81;
            if (v81 > v58) {
              return 1859794437LL;
            }
          }

          v61 = (size_t *)((char *)a5 + v14[5]);
          if ((v54 & 0x1000000) != 0)
          {
            v62 = calloc(1uLL, *(unsigned int *)(*((void *)v14 + 3) + 4LL));
            void *v61 = v62;
            if (!v62) {
              return 12LL;
            }
            unint64_t v59 = v81;
            v61 = v62;
          }

          v63 = &v11[v57];
          uint64_t result = _asn1_decode(*((void *)v14 + 3), v55, v63, v59, v61, &v83);
          if ((_DWORD)result) {
            return result;
          }
          if (v56 == 3705724653)
          {
            unint64_t v81 = v83;
            unint64_t v64 = v58 - v83;
            v65 = &v63[v83];
            uint64_t result = der_match_tag_and_length(v65, v58 - v83, 0, &v82, 0, &v81, &v80);
            uint64_t v12 = v79;
            if ((_DWORD)result) {
              return result;
            }
            if (v82) {
              return 1859794438LL;
            }
            if (v81) {
              return 1859794450LL;
            }
            uint64_t v11 = &v65[v80];
            size_t v10 = v64 - v80;
            size_t v7 = a4;
          }

          else
          {
            size_t v7 = a4;
            uint64_t v12 = v79;
            if (v83 != v81) {
              return 1859794442LL;
            }
            size_t v10 = v58 - v83;
            uint64_t v11 = &v63[v83];
          }
        }

        goto LABEL_87;
      case 0xCu:
        unsigned int v40 = (v15 & 0xFFF) + v73;
        if (v40 >= 0x13) {
          asn1_abort("type larger then asn1_template_prim: %d", v40);
        }
        uint64_t result = ((uint64_t (*)(unsigned __int8 *, size_t, char *, unint64_t *))asn1_template_prim[6 * v40 + 1])( v11,  v10,  (char *)a5 + v14[5],  &v83);
        if ((_DWORD)result) {
          return result;
        }
        goto LABEL_48;
      case 0xDu:
      case 0xEu:
        if (!v10) {
          goto LABEL_87;
        }
        uint64_t v20 = a5;
        uint64_t v21 = 0LL;
        v71 = v20;
        uint64_t v22 = (void **)((char *)v20 + v14[5]);
        size_t v23 = *(unsigned int *)(*((void *)v14 + 3) + 4LL);
LABEL_11:
        if ((v12 & 4) != 0 && !der_match_tag_and_length(v11, v10, 0, &v82, 0, &v81, &v80))
        {
LABEL_17:
          a5 = v71;
          size_t v7 = a4;
LABEL_87:
          if (!--v8) {
            goto LABEL_88;
          }
          continue;
        }

        if (__CFADD__(v23, v21)) {
          return 1859794436LL;
        }
        unsigned int v24 = (char *)realloc(v22[1], v23 + v21);
        if (!v24) {
          return 12LL;
        }
        int v25 = v24;
        unsigned int v26 = &v24[v21];
        bzero(&v24[v21], v23);
        v22[1] = v25;
        ++*(_DWORD *)v22;
        uint64_t result = _asn1_decode(*((void *)v14 + 3), v78, v11, v10, v26, &v83);
        if (!(_DWORD)result)
        {
          v21 += v23;
          v11 += v83;
          v10 -= v83;
          uint64_t v12 = v79;
          if (!v10) {
            goto LABEL_17;
          }
          goto LABEL_11;
        }

        return result;
      case 0xFu:
        uint64_t v41 = *((void *)v14 + 3);
        uint64_t v42 = *(void *)(v41 + 8);
        bzero(a5, *(unsigned int *)(v41 + 4));
        if (!v10) {
          return 1859794437LL;
        }
        ++v11;
        size_t v43 = v10 - 1;
        if (v42) {
          BOOL v44 = v10 == 1;
        }
        else {
          BOOL v44 = 1;
        }
        if (v44)
        {
          size_t v10 = 0LL;
        }

        else
        {
          unint64_t v50 = 0LL;
          uint64_t v51 = v41 + 16;
          do
          {
            unint64_t v52 = *(unsigned int *)(v51 + 4);
            if (v52 >> 3 <= v50 >> 3) {
              goto LABEL_60;
            }
            do
            {
              size_t v53 = v43;
              ++v11;
              --v43;
              v50 += 8LL;
            }

            while (v52 >> 3 > v50 >> 3 && v53 != 1);
            if (v53 == 1)
            {
              size_t v43 = 0LL;
            }

            else
            {
LABEL_60:
              if (((*v11 >> (~(_BYTE)v52 & 7)) & 1) != 0) {
                *(_DWORD *)a5 |= 1 << v52;
              }
              --v42;
              v51 += 16LL;
            }

            size_t v10 = 0LL;
          }

          while (v42 && v43);
        }

        goto LABEL_87;
      default:
        asn1_abort("unknown opcode: %d", v15 & 0xF0000000);
    }
  }

void _asn1_free_top(uint64_t a1, void *a2)
{
}

uint64_t _asn1_encode(uint64_t a1, _BYTE *a2, size_t a3, _DWORD *a4, void *a5)
{
  size_t v5 = a3;
  uint64_t v6 = *(void *)(a1 + 8);
  size_t v7 = a3;
  if (v6)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = (int *)(a1 + 16 * v6);
    size_t v7 = a3;
    while (2)
    {
      unsigned int v12 = *v11;
      unsigned int v13 = *v11 >> 28;
      switch(v13 ^ 8)
      {
        case 0u:
          unsigned int v17 = (unsigned int *)*((void *)v11 + 1);
          uint64_t v18 = *(int *)((char *)a4 + v17[1]);
          if ((_DWORD)v18 == -1)
          {
            uint64_t v10 = der_put_octet_string((uint64_t)a2, v7, (uint64_t)a4 + *v17, &v68) + v10;
            goto LABEL_82;
          }

          uint64_t result = _asn1_encode(*(void *)&v17[4 * v18 + 2], a2, v7, (char *)a4 + v17[4 * v18 + 1], &v68);
          if (!(_DWORD)result)
          {
            uint64_t v10 = 0LL;
LABEL_82:
            v7 -= v68;
            a2 -= v68;
            goto LABEL_88;
          }

          return result;
        case 9u:
        case 0xAu:
          char v14 = (void *)((char *)a4 + v11[1]);
          if ((v12 & 0x1000000) != 0)
          {
            char v14 = (void *)*v14;
            if (!v14) {
              goto LABEL_88;
            }
          }

          unsigned int v15 = (uint64_t (**)(_BYTE *, size_t, void *, uint64_t *))*((void *)v11 + 1);
          if (v13 == 1)
          {
            uint64_t result = _asn1_encode(v15, a2, v7, v14, &v68);
            if ((_DWORD)result) {
              return result;
            }
LABEL_45:
            uint64_t v10 = 0LL;
            a2 -= v68;
            v7 -= v68;
            goto LABEL_88;
          }

          uint64_t result = (*v15)(a2, v7, v14, &v68);
          if (!(_DWORD)result) {
            goto LABEL_45;
          }
          break;
        case 0xBu:
          size_t v19 = (void *)((char *)a4 + v11[1]);
          if ((v12 & 0x1000000) != 0)
          {
            size_t v19 = (void *)*v19;
            if (!v19) {
              goto LABEL_88;
            }
          }

          uint64_t result = _asn1_encode(*((void *)v11 + 1), a2, v7, v19, &v67);
          if ((_DWORD)result) {
            return result;
          }
          v7 -= v67;
          a2 -= v67;
          uint64_t result = der_put_length_and_tag( a2,  v7,  v67,  (*v11 >> 22) & 3,  (*v11 & 0x200000) != 0,  *v11 & 0x1FFFFF,  &v68);
          if ((_DWORD)result) {
            return result;
          }
          goto LABEL_45;
        case 0xCu:
          if ((*v11 & 0xFFFu) >= 0x14) {
            asn1_abort("type larger then asn1_template_prim: %d", *v11 & 0xFFF);
          }
          uint64_t result = ((uint64_t (*)(_BYTE *, size_t, char *, uint64_t *))asn1_template_prim[6 * (v12 & 0xFFF)])( a2,  v7,  (char *)a4 + v11[1],  &v68);
          if ((_DWORD)result) {
            return result;
          }
          goto LABEL_45;
        case 0xDu:
          uint64_t v20 = (char *)a4 + v11[1];
          if (!*(_DWORD *)v20) {
            goto LABEL_88;
          }
          uint64_t v21 = v6;
          unsigned int v22 = 0;
          uint64_t v23 = *(unsigned int *)(*((void *)v11 + 1) + 4LL);
          unint64_t v24 = *((void *)v20 + 1) + v23 * (unint64_t)(*(_DWORD *)v20 - 1);
          uint64_t v25 = -v23;
          do
          {
            uint64_t result = _asn1_encode(*((void *)v11 + 1), a2, v7, v24, &v68);
            if ((_DWORD)result) {
              return result;
            }
            a2 -= v68;
            v7 -= v68;
            v24 += v25;
            ++v22;
          }

          while (v22 < *(_DWORD *)v20);
          uint64_t v10 = 0LL;
          uint64_t v6 = v21;
          goto LABEL_88;
        case 0xEu:
          unsigned int v26 = (_DWORD *)((char *)a4 + v11[1]);
          size_t v27 = *v26;
          if (!(_DWORD)v27) {
            goto LABEL_88;
          }
          size_t v63 = v5;
          unint64_t v64 = a4;
          uint64_t v66 = *(unsigned int *)(*((void *)v11 + 1) + 4LL);
          v28 = (_DWORD *)*((void *)v26 + 1);
          uint64_t v29 = calloc(v27, 0x10uLL);
          if (!v29) {
            return 12LL;
          }
          uint64_t v30 = (void **)v29;
          uint64_t v62 = v6;
          if (!*v26)
          {
            size_t v31 = 0LL;
            a4 = v64;
            goto LABEL_84;
          }

          size_t v31 = 0LL;
          unint64_t v32 = 0LL;
          v33 = (char **)(v29 + 1);
          do
          {
            size_t v34 = _asn1_length(*((void *)v11 + 1), v28);
            size_t v35 = v34;
            *(v33 - 1) = (char *)v34;
            if (v34)
            {
              uint64_t v36 = (char *)malloc(v34);
              uint64_t *v33 = v36;
              if (!v36)
              {
                uint64_t v10 = 12LL;
                goto LABEL_93;
              }
            }

            else
            {
              uint64_t v36 = *v33;
            }

            uint64_t v37 = _asn1_encode(*((void *)v11 + 1), &v36[v35 - 1], v35, v28, &v68);
            if ((_DWORD)v37)
            {
              uint64_t v10 = v37;
              goto LABEL_93;
            }

            v28 = (_DWORD *)((char *)v28 + v66);
            v31 += (size_t)*(v33 - 1);
            ++v32;
            v33 += 2;
          }

          while (v32 < *v26);
          if (v31 <= v7) {
            uint64_t v10 = 0LL;
          }
          else {
            uint64_t v10 = 1859794436LL;
          }
          a4 = v64;
LABEL_84:
          if (!(_DWORD)v10)
          {
            qsort(v30, *v26, 0x10uLL, (int (__cdecl *)(const void *, const void *))_heim_der_set_sort);
            uint64_t v57 = 2LL * (*v26 - 1);
            do
            {
              size_t v58 = (size_t)v30[v57];
              a2 -= v58;
              memcpy(a2 + 1, v30[v57 + 1], v58);
              free(v30[v57 + 1]);
              v57 -= 2LL;
            }

            while (v57 != -2);
            v7 -= v31;
            free(v30);
            uint64_t v10 = 0LL;
            uint64_t v6 = v62;
            size_t v5 = v63;
            goto LABEL_88;
          }

LABEL_93:
          if (*v26)
          {
            unint64_t v59 = 0LL;
            uint64_t v60 = v30 + 1;
            do
            {
              v61 = *v60;
              v60 += 2;
              free(v61);
              ++v59;
            }

            while (v59 < *v26);
          }

          free(v30);
          return v10;
        case 0xFu:
          uint64_t v38 = (int *)*((void *)v11 + 1);
          uint64_t v39 = *((void *)v38 + 1);
          int v40 = *v38;
          uint64_t v41 = &v38[4 * v39];
          if ((*v38 & 1) != 0) {
            unint64_t v42 = 31LL;
          }
          else {
            unint64_t v42 = v41[1];
          }
          uint64_t result = 1859794436LL;
          if (v39) {
            BOOL v43 = v7 == 0;
          }
          else {
            BOOL v43 = 1;
          }
          if (v43)
          {
            LOBYTE(v48) = 0;
            int v47 = 0;
          }

          else
          {
            int v47 = 0;
            int v48 = 0;
            do
            {
              unint64_t v49 = v41[1];
              if (v42 >> 3 <= v49 >> 3)
              {
                int v51 = v48;
              }

              else
              {
                do
                {
                  if (v48) {
                    BOOL v50 = 1;
                  }
                  else {
                    BOOL v50 = (v40 & 1 | v47) != 0;
                  }
                  if (v50)
                  {
                    if (!v7) {
                      return result;
                    }
                    *a2-- = v48;
                    --v7;
                    LODWORD(v49) = v41[1];
                  }

                  int v48 = 0;
                  int v51 = 0;
                  v42 -= 8LL;
                }

                while (v49 >> 3 < v42 >> 3);
              }

              int v52 = *a4 >> v49;
              int v53 = v49 & 7;
              int v54 = v51 | (1 << (v53 ^ 7));
              int v55 = 8 - v53;
              if (v47) {
                int v55 = v47;
              }
              BOOL v56 = (v52 & 1) == 0;
              if ((v52 & 1) != 0) {
                int v48 = v54;
              }
              else {
                int v48 = v51;
              }
              if (!v56) {
                int v47 = v55;
              }
              if (!--v39) {
                break;
              }
              v41 -= 4;
            }

            while (v7);
          }

          if (!(v40 & 1 | v47)) {
            goto LABEL_56;
          }
          if (!v7) {
            return result;
          }
          *a2-- = v48;
          --v7;
LABEL_56:
          if (!v7) {
            return result;
          }
          BOOL v44 = v47 == 0;
          char v45 = v47 - 1;
          else {
            char v46 = v45;
          }
          *a2-- = v46;
          --v7;
LABEL_88:
          v11 -= 4;
          if (!--v6) {
            goto LABEL_89;
          }
          continue;
        default:
          asn1_abort("unknown opcode: %d", v12 & 0xF0000000);
      }

      break;
    }
  }

  else
  {
LABEL_89:
    uint64_t result = 0LL;
    if (a5) {
      *a5 = v5 - v7;
    }
  }

  return result;
}

uint64_t _asn1_length(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v4 = 0LL;
    size_t v5 = (unsigned int *)(a1 + 16 * v2);
    while (2)
    {
      unsigned int v6 = *v5;
      unsigned int v7 = *v5 >> 28;
      switch(v7 ^ 8)
      {
        case 0u:
          uint64_t v20 = (unsigned int *)*((void *)v5 + 1);
          uint64_t v21 = *(int *)((char *)a2 + v20[1]);
          if ((_DWORD)v21 == -1)
          {
            uint64_t v10 = der_length_octet_string((uint64_t)a2 + *v20);
          }

          else
          {
            unsigned int v22 = &v20[4 * v21];
            uint64_t v9 = *((void *)v22 + 1);
            uint64_t v8 = (void *)((char *)a2 + v22[1]);
LABEL_24:
            uint64_t v10 = _asn1_length(v9, v8);
          }

          goto LABEL_30;
        case 9u:
        case 0xAu:
          uint64_t v8 = (void *)((char *)a2 + v5[1]);
          if ((v6 & 0x1000000) != 0)
          {
            uint64_t v8 = (void *)*v8;
            if (!v8) {
              goto LABEL_31;
            }
          }

          uint64_t v9 = *((void *)v5 + 1);
          if (v7 == 1) {
            goto LABEL_24;
          }
          uint64_t v10 = (*(uint64_t (**)(void *))(v9 + 16))(v8);
LABEL_30:
          v4 += v10;
          goto LABEL_31;
        case 0xBu:
          uint64_t v23 = (void *)((char *)a2 + v5[1]);
          if ((v6 & 0x1000000) == 0 || (uint64_t v23 = (void *)*v23) != 0LL)
          {
            unint64_t v24 = _asn1_length(*((void *)v5 + 1), v23);
            uint64_t v25 = der_length_tag(*v5 & 0x1FFFFF);
            v4 += v24 + v25 + der_length_len(v24);
          }

          goto LABEL_31;
        case 0xCu:
          if ((*v5 & 0xFFF) >= 0x14) {
            asn1_abort("type larger then asn1_template_prim: %d", *v5 & 0xFFF);
          }
          uint64_t v10 = ((uint64_t (*)(char *))asn1_template_prim[6 * (v6 & 0xFFF) + 2])((char *)a2 + v5[1]);
          goto LABEL_30;
        case 0xDu:
        case 0xEu:
          uint64_t v11 = (char *)a2 + v5[1];
          if (*(_DWORD *)v11)
          {
            unsigned int v12 = 0;
            uint64_t v13 = *(unsigned int *)(*((void *)v5 + 1) + 4LL);
            uint64_t v14 = *((void *)v11 + 1);
            do
            {
              v4 += _asn1_length(*((void *)v5 + 1), v14);
              v14 += v13;
              ++v12;
            }

            while (v12 < *(_DWORD *)v11);
          }

          goto LABEL_31;
        case 0xFu:
          uint64_t v15 = *((void *)v5 + 1);
          if ((*(_BYTE *)v15 & 1) != 0)
          {
            v4 += 5LL;
          }

          else
          {
            uint64_t v16 = *(void *)(v15 + 8);
            ++v4;
            if (!v16) {
              goto LABEL_31;
            }
            unsigned int v17 = (unsigned int *)(v15 + 16 * v16 + 4);
            while (1)
            {
              unsigned int v19 = *v17;
              v17 -= 4;
              unint64_t v18 = v19;
              if (((*a2 >> v19) & 1) != 0) {
                break;
              }
              if (!--v16) {
                goto LABEL_31;
              }
            }

            v4 += (v18 >> 3) + 1;
          }

LABEL_31:
          v5 -= 4;
          if (!--v2) {
            return v4;
          }
          continue;
        default:
          asn1_abort("unknown opcode: %d", v6 & 0xF0000000);
      }
    }
  }

  return 0LL;
}

void _asn1_free(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a1 + 8);
  if ((*(_BYTE *)a1 & 1) != 0) {
    der_free_octet_string(a2);
  }
  for (; v4; --v4)
  {
    uint64_t v5 = v3;
    unsigned int v7 = *(_DWORD *)(v3 + 16);
    v3 += 16LL;
    unsigned int v6 = v7;
    unsigned int v8 = v7 >> 28;
    switch((v7 >> 28) ^ 8)
    {
      case 0u:
        uint64_t v15 = *(unsigned int **)(v5 + 24);
        uint64_t v16 = *(int *)(a2 + v15[1]);
        if ((_DWORD)v16)
        {
          if ((_DWORD)v16 == -1) {
            der_free_octet_string(a2 + *v15);
          }
          else {
            _asn1_free(*(void *)&v15[4 * v16 + 2], a2 + v15[4 * v16 + 1]);
          }
        }

        continue;
      case 9u:
      case 0xAu:
        uint64_t v9 = (void *)(a2 + *(unsigned int *)(v5 + 20));
        if ((v6 & 0x1000000) == 0 || (uint64_t v9 = (void *)*v9) != 0LL)
        {
          uint64_t v10 = *(void *)(v5 + 24);
          if (v8 == 1) {
            _asn1_free(v10, v9);
          }
          else {
            (*(void (**)(void *))(v10 + 32))(v9);
          }
          if ((*(_BYTE *)(v3 + 3) & 1) != 0) {
            goto LABEL_26;
          }
        }

        continue;
      case 0xBu:
        uint64_t v9 = (void *)(a2 + *(unsigned int *)(v5 + 20));
        if ((v6 & 0x1000000) != 0)
        {
          uint64_t v9 = (void *)*v9;
          if (!v9) {
            continue;
          }
        }

        _asn1_free(*(void *)(v5 + 24), v9);
        if ((*(_BYTE *)(v5 + 19) & 1) == 0) {
          continue;
        }
LABEL_26:
        free(v9);
        break;
      case 0xCu:
        if ((v6 & 0xFFF) >= 0x14) {
          asn1_abort("type larger then asn1_template_prim: %d", v6 & 0xFFF);
        }
        ((void (*)(uint64_t))asn1_template_prim[6 * (v6 & 0xFFF) + 4])(a2 + *(unsigned int *)(v5 + 20));
        break;
      case 0xDu:
      case 0xEu:
        uint64_t v11 = a2 + *(unsigned int *)(v5 + 20);
        unsigned int v12 = *(char **)(v11 + 8);
        if (*(_DWORD *)v11)
        {
          unsigned int v13 = 0;
          uint64_t v14 = *(unsigned int *)(*(void *)(v5 + 24) + 4LL);
          do
          {
            _asn1_free(*(void *)(v5 + 24), v12);
            v12 += v14;
            ++v13;
          }

          while (v13 < *(_DWORD *)v11);
          unsigned int v12 = *(char **)(v11 + 8);
        }

        free(v12);
        *(void *)(v11 + 8) = 0LL;
        *(_DWORD *)uint64_t v11 = 0;
        break;
      case 0xFu:
        continue;
      default:
        asn1_abort("unknown opcode: %d", v6 & 0xF0000000);
    }
  }

uint64_t _asn1_copy(unsigned int *a1, char *a2, void *a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *((void *)a1 + 1);
  if ((*(_BYTE *)a1 & 1) != 0)
  {
    uint64_t v6 = der_copy_octet_string((uint64_t)a2, a3);
    if ((_DWORD)v6) {
      return v6;
    }
  }

  if (!v5) {
    return 0LL;
  }
  while (2)
  {
    unsigned int v7 = v4;
    unsigned int v9 = v4[4];
    v4 += 4;
    unsigned int v8 = v9;
    unsigned int v10 = v9 >> 28;
    switch((v9 >> 28) ^ 8)
    {
      case 0u:
        uint64_t v6 = 1859794451LL;
        uint64_t v21 = (unsigned int *)*((void *)v7 + 3);
        uint64_t v22 = v21[1];
        signed int v23 = *(_DWORD *)&a2[v22];
        if (v23 && v23 <= (int)v21[2])
        {
          *(_DWORD *)((char *)a3 + v22) = v23;
          uint64_t v24 = *(int *)&a2[v22];
          uint64_t v25 = (_DWORD)v24 == -1
          uint64_t v6 = v25;
          if (!(_DWORD)v25) {
            goto LABEL_41;
          }
        }

        return v6;
      case 9u:
      case 0xAu:
        uint64_t v11 = *((void *)v7 + 3);
        if (v10 == 1) {
          size_t v12 = *(unsigned int *)(v11 + 4);
        }
        else {
          size_t v12 = *(void *)(v11 + 40);
        }
        uint64_t v31 = v7[5];
        unint64_t v32 = &a2[v31];
        uint64_t v29 = (void **)((char *)a3 + v31);
        if ((v8 & 0x1000000) == 0)
        {
          v33 = (char *)a3 + v31;
          goto LABEL_29;
        }

        unint64_t v32 = *(char **)v32;
        if (!v32)
        {
LABEL_41:
          if (!--v5) {
            return 0LL;
          }
          continue;
        }

        size_t v34 = (char *)calloc(1uLL, v12);
        *uint64_t v29 = v34;
        if (!v34) {
          return 12LL;
        }
        v33 = v34;
        unsigned int v8 = *v4;
LABEL_29:
        uint64_t v35 = *((void *)v7 + 3);
        if (v8 >> 28 == 1) {
          uint64_t v36 = _asn1_copy(v35, v32, v33);
        }
        else {
          uint64_t v36 = (*(uint64_t (**)(char *, char *))(v35 + 24))(v32, v33);
        }
        uint64_t v6 = v36;
        if (!(_DWORD)v36) {
          goto LABEL_41;
        }
        if ((*((_BYTE *)v4 + 3) & 1) != 0)
        {
LABEL_49:
          free(*v29);
          *uint64_t v29 = 0LL;
        }

        return v6;
      case 0xBu:
        uint64_t v26 = v7[5];
        size_t v27 = &a2[v26];
        v28 = (void **)((char *)a3 + v26);
        if ((v8 & 0x1000000) != 0)
        {
          size_t v27 = *(char **)v27;
          if (!v27) {
            goto LABEL_41;
          }
          uint64_t v37 = calloc(1uLL, *(unsigned int *)(*((void *)v7 + 3) + 4LL));
          _DWORD *v28 = v37;
          if (!v37) {
            return 12LL;
          }
          uint64_t v29 = v28;
          v28 = (void **)v37;
        }

        else
        {
          uint64_t v29 = 0LL;
        }

        uint64_t v38 = _asn1_copy(*((void *)v7 + 3), v27, v28);
        if ((_DWORD)v38)
        {
          uint64_t v6 = v38;
          if (v29) {
            goto LABEL_49;
          }
          return v6;
        }

        goto LABEL_41;
      case 0xCu:
        unsigned int v30 = v8 & 0xFFF;
        if (v30 >= 0x14) {
          asn1_abort("type larger then asn1_template_prim: %d", v30);
        }
        uint64_t v20 = ((uint64_t (*)(char *, char *))asn1_template_prim[6 * v30 + 3])(&a2[v7[5]], (char *)a3 + v7[5]);
        if ((_DWORD)v20) {
          return v20;
        }
        goto LABEL_41;
      case 0xDu:
      case 0xEu:
        uint64_t v13 = v7[5];
        uint64_t v14 = &a2[v13];
        uint64_t v15 = (char *)a3 + v13;
        size_t v16 = *(unsigned int *)(*((void *)v7 + 3) + 4LL);
        unsigned int v17 = calloc(*(unsigned int *)&a2[v13], v16);
        *((void *)v15 + 1) = v17;
        if (!v17) {
          return 12LL;
        }
        *(_DWORD *)uint64_t v15 = *(_DWORD *)v14;
        if (!*(_DWORD *)v14) {
          goto LABEL_41;
        }
        uint64_t v18 = 0LL;
        unint64_t v19 = 0LL;
        while (1)
        {
          uint64_t v20 = _asn1_copy(*((void *)v7 + 3), *((void *)v14 + 1) + v18, *((void *)v15 + 1) + v18);
          if ((_DWORD)v20) {
            return v20;
          }
          ++v19;
          v18 += v16;
        }

      case 0xFu:
        memcpy(a3, a2, *(unsigned int *)(*((void *)v7 + 3) + 4LL));
        goto LABEL_41;
      default:
        asn1_abort("unknown opcode: %d", v8 & 0xF0000000);
    }
  }

uint64_t _asn1_decode_top(uint64_t a1, uint64_t a2, unsigned __int8 *a3, size_t a4, void *a5, size_t *a6)
{
  uint64_t v12 = _asn1_decode((int *)a1, a2, a3, a4, (size_t *)a5, a6);
  if ((_DWORD)v12)
  {
    _asn1_free(a1, (uint64_t)a5);
    bzero(a5, *(unsigned int *)(a1 + 4));
  }

  return v12;
}

uint64_t _asn1_copy_top(unsigned int *a1, char *a2, void *a3)
{
  uint64_t v6 = _asn1_copy(a1, a2, a3);
  if ((_DWORD)v6)
  {
    _asn1_free((uint64_t)a1, (uint64_t)a3);
    bzero(a3, a1[1]);
  }

  return v6;
}

uint64_t asn1_fuzzer_method()
{
  return 1LL;
}

void asn1_fuzzer_done()
{
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A30](*(void *)&a1);
}

void abort(void)
{
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

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FCFD0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1895FD178](__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD510](a1, a2, a3);
}