uint64_t __gen2_der_heim_oid_cmp(uint64_t *a1, uint64_t a2)
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

uint64_t __gen2_der_heim_octet_string_cmp(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)a1;
  if (*(void *)a1 == *(void *)a2) {
    return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t __gen2_der_printable_string_cmp(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)a1;
  if (*(void *)a1 == *(void *)a2) {
    return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t __gen2_der_ia5_string_cmp(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)a1;
  if (*(void *)a1 == *(void *)a2) {
    return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t __gen2_der_heim_bit_string_cmp(unint64_t *a1, void *a2)
{
  unint64_t v2 = *a1;
  if (*a1 != *a2) {
    return v2 - *a2;
  }
  if (!v2) {
    return 0LL;
  }
  v3 = (char *)a1[1];
  v4 = (unsigned __int8 *)a2[1];
  unint64_t v5 = v2 >> 3;
  uint64_t result = memcmp(v3, v4, v2 >> 3);
  if ((_DWORD)result) {
    return result;
  }
  if ((v2 & 7) == 0) {
    return 0LL;
  }
  v7 = (unsigned __int8 *)&v3[v5];
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_heim_integer_cmp(uint64_t a1, uint64_t a2)
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

uint64_t __gen2_der_heim_bmp_string_cmp(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1 == *(void *)a2) {
    return memcmp((const void *)a1[1], *(const void **)(a2 + 8), 2 * v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t __gen2_der_heim_universal_string_cmp(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1 == *(void *)a2) {
    return memcmp((const void *)a1[1], *(const void **)(a2 + 8), 4 * v2);
  }
  else {
    return v2 - *(void *)a2;
  }
}

uint64_t __gen2_heim_len_unsigned(unsigned int a1)
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

uint64_t __gen2_heim_len_unsigned64(unint64_t a1)
{
  uint64_t v1 = 1LL;
  do
  {
    unint64_t v2 = a1;
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

uint64_t __gen2_heim_len_int(unsigned int a1)
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

uint64_t _heim_len_int64(unint64_t a1)
{
  if ((a1 & 0x8000000000000000LL) != 0)
  {
    unint64_t v3 = ~a1;
    uint64_t v1 = -1LL;
    do
    {
      unint64_t v2 = v3;
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
      unint64_t v2 = a1;
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

uint64_t __gen2_der_length_len(unint64_t a1)
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

uint64_t __gen2_der_length_tag(unsigned int a1)
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

uint64_t __gen2_der_length_integer(unsigned int *a1)
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

uint64_t __gen2_der_length_integer64(unint64_t *a1)
{
  unint64_t v1 = *a1;
  if ((*a1 & 0x8000000000000000LL) != 0)
  {
    unint64_t v4 = ~v1;
    uint64_t v2 = -1LL;
    do
    {
      unint64_t v3 = v4;
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
      unint64_t v3 = v1;
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

uint64_t __gen2_der_length_unsigned(unsigned int *a1)
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

uint64_t __gen2_der_length_unsigned64(unint64_t *a1)
{
  unint64_t v1 = *a1;
  uint64_t v2 = 1LL;
  do
  {
    unint64_t v3 = v1;
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

uint64_t __gen2_der_length_enumerated(unsigned int *a1)
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

size_t __gen2_der_length_general_string(const char **a1)
{
  return strlen(*a1);
}

size_t __gen2_der_length_utf8string(const char **a1)
{
  return strlen(*a1);
}

uint64_t __gen2_der_length_printable_string(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t __gen2_der_length_ia5_string(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t __gen2_der_length_bmp_string(void *a1)
{
  return 2LL * *a1;
}

uint64_t __gen2_der_length_universal_string(void *a1)
{
  return 4LL * *a1;
}

size_t __gen2_der_length_visible_string(const char **a1)
{
  return strlen(*a1);
}

uint64_t __gen2_der_length_octet_string(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t __gen2_der_length_heim_integer(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (!*a1) {
    return 1LL;
  }
  int v2 = *((_DWORD *)a1 + 4);
  if (v1 == 1 && v2 != 0)
  {
    unsigned int v5 = *(unsigned __int8 *)a1[1];
    if (v5 == 1) {
      return 1LL;
    }
    return v1 + (v5 >> 7);
  }

  unsigned int v4 = (unsigned __int8 *)a1[1];
  if (v2)
  {
    unsigned int v5 = *v4;
    return v1 + (v5 >> 7);
  }

  return v1 + ((unint64_t)*v4 >> 7);
}

uint64_t __gen2_der_length_oid(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  uint64_t v3 = 2LL;
  uint64_t result = 1LL;
  while (1)
  {
    unsigned int v5 = (unsigned int *)(v2 + 4 * v3);
    unsigned int v6 = *v5;
    do
    {
      ++result;
      BOOL v7 = v6 > 0x7F;
      v6 >>= 7;
    }

    while (v7);
    if (++v3 == v1) {
      return result;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_length_generalized_time(uint64_t *a1)
{
  uint64_t v3 = 0LL;
  unsigned int v4 = 0LL;
  __gen2_heim_time2generalizedtime(*a1, &v3, 1);
  uint64_t v1 = v3;
  free(v4);
  return v1;
}

uint64_t __gen2_der_length_utctime(uint64_t *a1)
{
  uint64_t v3 = 0LL;
  unsigned int v4 = 0LL;
  __gen2_heim_time2generalizedtime(*a1, &v3, 0);
  uint64_t v1 = v3;
  free(v4);
  return v1;
}

uint64_t __gen2_der_length_BOOLean()
{
  return 1LL;
}

unint64_t __gen2_der_length_bit_string(void *a1)
{
  return ((unint64_t)(*a1 + 7LL) >> 3) + 1;
}

uint64_t __gen2_der_copy_general_string(const char **a1, char **a2)
{
  uint64_t v3 = strdup(*a1);
  *a2 = v3;
  if (v3) {
    return 0LL;
  }
  else {
    return 12LL;
  }
}

uint64_t __gen2_der_copy_integer(_DWORD *a1, _DWORD *a2)
{
  *a2 = *a1;
  return 0LL;
}

uint64_t __gen2_der_copy_integer64(void *a1, void *a2)
{
  *a2 = *a1;
  return 0LL;
}

uint64_t __gen2_der_copy_unsigned(_DWORD *a1, _DWORD *a2)
{
  *a2 = *a1;
  return 0LL;
}

uint64_t __gen2_der_copy_unsigned64(void *a1, void *a2)
{
  *a2 = *a1;
  return 0LL;
}

uint64_t __gen2_der_copy_generalized_time(void *a1, void *a2)
{
  *a2 = *a1;
  return 0LL;
}

uint64_t __gen2_der_copy_utctime(void *a1, void *a2)
{
  *a2 = *a1;
  return 0LL;
}

uint64_t __gen2_der_copy_utf8string(const char **a1, char **a2)
{
  uint64_t v3 = strdup(*a1);
  *a2 = v3;
  if (v3) {
    return 0LL;
  }
  else {
    return 12LL;
  }
}

uint64_t __gen2_der_copy_printable_string(size_t *a1, size_t *a2)
{
  size_t v4 = *a1 + 1;
  uint64_t result = (uint64_t)malloc(v4);
  if (!result) {
    return 12LL;
  }
  if ((v4 & 0x8000000000000000LL) != 0) {
    goto LABEL_11;
  }
  unint64_t v6 = result;
  *a2 = v4;
  a2[1] = result;
  size_t v7 = *a1;
  if (*a1 > v4) {
    goto LABEL_11;
  }
  size_t v8 = result + v4;
  uint64_t result = (uint64_t)memcpy((void *)result, (const void *)a1[1], *a1);
  v9 = (_BYTE *)(v6 + v7);
  if (v6 + v7 < v8 && (unint64_t)v9 >= v6)
  {
    uint64_t result = 0LL;
    _BYTE *v9 = 0;
  }

  else
  {
LABEL_11:
    __break(0x5519u);
  }

  return result;
}

unint64_t __gen2_der_copy_bmp_string(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = *(void *)a1;
  size_t v5 = 2LL * *(void *)a1;
  unint64_t result = (unint64_t)malloc(v5);
  unint64_t v7 = result + 2 * v4;
  if (!result) {
    unint64_t v7 = 0LL;
  }
  if (v4) {
    BOOL v8 = result == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8) {
    return 12LL;
  }
  if (result > v7 || v4 > (uint64_t)(v7 - result) >> 1 || (*a2 = v4, a2[1] = result, v5 > 2LL * *(void *)a1))
  {
    __break(0x5519u);
  }

  else
  {
    memcpy((void *)result, *(const void **)(a1 + 8), v5);
    return 0LL;
  }

  return result;
}

unint64_t __gen2_der_copy_universal_string(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = *(void *)a1;
  size_t v5 = 4LL * *(void *)a1;
  unint64_t result = (unint64_t)malloc(v5);
  unint64_t v7 = result + 4 * v4;
  if (!result) {
    unint64_t v7 = 0LL;
  }
  if (v4) {
    BOOL v8 = result == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8) {
    return 12LL;
  }
  if (result > v7 || v4 > (uint64_t)(v7 - result) >> 2 || (*a2 = v4, a2[1] = result, v5 > 4LL * *(void *)a1))
  {
    __break(0x5519u);
  }

  else
  {
    memcpy((void *)result, *(const void **)(a1 + 8), v5);
    return 0LL;
  }

  return result;
}

uint64_t __gen2_der_copy_visible_string(const char **a1, char **a2)
{
  uint64_t v3 = strdup(*a1);
  *a2 = v3;
  if (v3) {
    return 0LL;
  }
  else {
    return 12LL;
  }
}

unint64_t __gen2_der_copy_octet_string(uint64_t a1, size_t *a2)
{
  if (*(void *)(a1 + 8))
  {
    size_t v4 = *(void *)a1;
    unint64_t result = (unint64_t)malloc(*(void *)a1);
    if (v4) {
      BOOL v6 = result == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      return 12LL;
    }

    else
    {
      unint64_t v7 = result + v4;
      if (!result) {
        unint64_t v7 = 0LL;
      }
      BOOL v8 = v7 >= result;
      size_t v9 = v7 - result;
      BOOL v10 = !v8 || v4 > v9;
      if (v10 || (*a2 = v4, a2[1] = result, v4 > *(void *)a1))
      {
        __break(0x5519u);
      }

      else
      {
        memcpy((void *)result, *(const void **)(a1 + 8), v4);
        return 0LL;
      }
    }
  }

  else
  {
    unint64_t result = 0LL;
    *a2 = 0LL;
    a2[1] = 0LL;
  }

  return result;
}

unint64_t __gen2_der_copy_heim_integer(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(void *)a1;
  unint64_t result = (unint64_t)malloc(*(void *)a1);
  if (v4) {
    BOOL v6 = result == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    return 12LL;
  }
  unint64_t v7 = result + v4;
  if (!result) {
    unint64_t v7 = 0LL;
  }
  BOOL v8 = v7 >= result;
  size_t v9 = v7 - result;
  BOOL v10 = !v8 || v4 > v9;
  if (v10 || (*(void *)a2 = v4, *(void *)(a2 + 8) = result, v4 > *(void *)a1))
  {
    __break(0x5519u);
  }

  else
  {
    memcpy((void *)result, *(const void **)(a1 + 8), v4);
    unint64_t result = 0LL;
    *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 16);
  }

  return result;
}

unint64_t __gen2_der_copy_oid(uint64_t a1, unint64_t *a2)
{
  unint64_t v4 = *(void *)a1;
  size_t v5 = 4LL * *(void *)a1;
  unint64_t result = (unint64_t)malloc(v5);
  unint64_t v7 = result + 4 * v4;
  if (!result) {
    unint64_t v7 = 0LL;
  }
  if (v4) {
    BOOL v8 = result == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8) {
    return 12LL;
  }
  if (result > v7 || v4 > (uint64_t)(v7 - result) >> 2 || (*a2 = v4, a2[1] = result, v5 > 4LL * *(void *)a1))
  {
    __break(0x5519u);
  }

  else
  {
    memcpy((void *)result, *(const void **)(a1 + 8), v5);
    return 0LL;
  }

  return result;
}

unint64_t __gen2_der_copy_bit_string(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = *a1 + 7;
  unint64_t v6 = v5 >> 3;
  unint64_t result = (unint64_t)malloc(v5 >> 3);
  if (v5 >= 8 && result == 0) {
    return 12LL;
  }
  unint64_t v9 = result + v6;
  if (!result) {
    unint64_t v9 = 0LL;
  }
  BOOL v10 = v9 >= result;
  unint64_t v11 = v9 - result;
  BOOL v12 = !v10 || v6 > v11;
  if (v12 || (*a2 = v4, a2[1] = result, v6 > (unint64_t)(*a1 + 7) >> 3))
  {
    __break(0x5519u);
  }

  else
  {
    memcpy((void *)result, (const void *)a1[1], v5 >> 3);
    return 0LL;
  }

  return result;
}

unint64_t __gen2_decode_heim_any(_BYTE *a1, unint64_t a2, size_t *a3, size_t *a4)
{
  *a3 = 0LL;
  a3[1] = 0LL;
  unint64_t result = __gen2_der_get_tag(a1, a2, &v14, &v13, &v12, (uint64_t *)&v15);
  if (!(_DWORD)result)
  {
    unint64_t result = 1859794436LL;
    if (a2 >= v15)
    {
      unint64_t result = (unint64_t)&a1[v15];
      unint64_t result = __gen2_der_get_length((char *)result, a2 - v15, &v16, &v17);
      if ((_DWORD)result) {
        return result;
      }
      if (v16 == 3705724653)
      {
        unint64_t result = 1859794436LL;
        if (a2 < v15 + v17) {
          return result;
        }
        unint64_t v16 = a2 - (v15 + v17);
        size_t v11 = a2;
      }

      else
      {
        size_t v11 = v17 + v16 + v15;
        unint64_t result = 1859794436LL;
        if (v11 > a2) {
          return result;
        }
      }

      unint64_t result = (unint64_t)malloc(v11);
      if (!result) {
        return 12LL;
      }
      if ((v11 & 0x8000000000000000LL) != 0 || (*a3 = v11, a3[1] = result, v11 > a2))
      {
LABEL_22:
        __break(0x5519u);
        return result;
      }

      memcpy((void *)result, a1, v11);
      unint64_t result = 0LL;
      if (a4) {
        *a4 = v11;
      }
    }
  }

  return result;
}

uint64_t __gen2_length_heim_any(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t __gen2_length_heim_any_set(uint64_t a1)
{
  return *(void *)a1;
}

unint64_t __gen2_der_parse_hex_heim_integer(char *__s, uint64_t a2)
{
  uint64_t v3 = __s;
  *(void *)a2 = 0LL;
  *(void *)(a2 + 8) = 0LL;
  *(_DWORD *)(a2 + 16) = 0;
  if (*__s == 45)
  {
    uint64_t v3 = __s + 1;
    *(_DWORD *)(a2 + 16) = 1;
  }

  int64_t v4 = strlen(v3);
  if (v4 <= 0) {
    goto LABEL_15;
  }
  size_t v5 = ((unint64_t)v4 >> 1) + 1;
  unint64_t v6 = malloc(v5);
  if (!v6)
  {
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
    return 12LL;
  }

  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v6;
  size_t v7 = rk_hex_decode(v3, v6, v5);
  unint64_t result = *(void *)(a2 + 8);
  if ((v7 & 0x8000000000000000LL) != 0)
  {
    free((void *)result);
LABEL_15:
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
    return 22LL;
  }

  unint64_t v9 = result + *(void *)a2;
  if (v7)
  {
    BOOL v10 = (const void *)(result + v7);
    size_t v11 = *(_BYTE **)(a2 + 8);
    while ((unint64_t)v11 < v9 && (unint64_t)v11 >= result)
    {
      if (*v11)
      {
        BOOL v10 = v11;
        goto LABEL_18;
      }

      ++v11;
      if (!--v7) {
        goto LABEL_18;
      }
    }
  }

  else
  {
    BOOL v10 = *(const void **)(a2 + 8);
LABEL_18:
    if (v7 <= *(void *)a2
      && (unint64_t)v10 <= v9
      && result <= (unint64_t)v10
      && v7 <= v9 - (unint64_t)v10)
    {
      unint64_t result = (unint64_t)memmove((void *)result, v10, v7);
      if (v7 <= *(void *)a2)
      {
        unint64_t result = 0LL;
        *(void *)a2 = v7;
        return result;
      }
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_print_hex_heim_integer(uint64_t a1, char **a2)
{
  unint64_t v6 = 0LL;
  if (*(_DWORD *)(a1 + 16))
  {
    int v4 = asprintf(&v6, "-%s", *a2);
    free(*a2);
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

uint64_t __gen2_der_print_heim_oid(unint64_t *a1, char a2, char **a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __source[0] = a2;
  __source[1] = 0;
  if (!*a1) {
    return 22LL;
  }
  unint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  do
  {
    int v7 = *(_DWORD *)(a1[1] + 4 * v6);
    size_t v8 = v5 + 2;
    do
    {
      unsigned int v9 = v7 + 9;
      v7 /= 10;
      ++v8;
    }

    while (v9 > 0x12);
    unint64_t v5 = v8 - 1;
    ++v6;
  }

  while (v6 != *a1);
  uint64_t result = (uint64_t)malloc(v8);
  if (result)
  {
    if (v5 > 0x7FFFFFFFFFFFFFFELL)
    {
      __break(0x5519u);
      return result;
    }

    size_t v11 = (char *)result;
    unint64_t v12 = 0LL;
    *(_BYTE *)uint64_t result = 0;
    while (1)
    {
      snprintf(__str, 0x19uLL, "%d", *(_DWORD *)(a1[1] + 4 * v12));
      if (strlcat(v11, __str, v8) >= v8) {
        break;
      }
      unint64_t v13 = *a1;
      if (v12 < *a1 - 1)
      {
        if (strlcat(v11, __source, v8) >= v8) {
          break;
        }
        unint64_t v13 = *a1;
      }

      if (++v12 >= v13)
      {
        uint64_t result = 0LL;
        *a3 = v11;
        return result;
      }
    }

    free(v11);
  }

  return 12LL;
}

uint64_t __gen2_der_parse_heim_oid(const char *a1, const char *a2, uint64_t a3)
{
  if (a2) {
    int v4 = a2;
  }
  else {
    int v4 = ".";
  }
  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  unint64_t v5 = strdup(a1);
  uint64_t v6 = (uint64_t)strtok_r(v5, v4, &__lasts);
  if (v6)
  {
    while (1)
    {
      unint64_t v7 = *(void *)a3;
      uint64_t v8 = *(void *)a3 + 1LL;
      unsigned int v9 = (char *)realloc(*(void **)(a3 + 8), 4 * v8);
      if (!v9)
      {
        uint64_t v6 = 12LL;
LABEL_19:
        __gen2_der_free_oid(a3);
        goto LABEL_20;
      }

      BOOL v10 = v9;
      uint64_t result = strtol((const char *)v6, &v14, 10);
      uint64_t v6 = 22LL;
      if (*v14 || result < 0 || result > 0x7FFFFFFF) {
        goto LABEL_19;
      }
      unint64_t v12 = &v10[4 * *(void *)a3];
      if (v12 >= &v10[4 * v8] || v12 < v10) {
        break;
      }
      *(_DWORD *)unint64_t v12 = result;
      if (4 * v8 < 0 || v7 >= (v8 & 0x3FFFFFFFFFFFFFFFuLL)) {
        break;
      }
      *(void *)a3 = v8;
      *(void *)(a3 + 8) = v10;
      uint64_t v6 = (uint64_t)strtok_r(0LL, v4, &__lasts);
      if (!v6) {
        goto LABEL_20;
      }
    }

    __break(0x5519u);
  }

  else
  {
LABEL_20:
    free(v5);
    return v6;
  }

  return result;
}

unint64_t __gen2_der_put_unsigned(unint64_t result, uint64_t a2, unsigned int *a3, uint64_t *a4)
{
  uint64_t v4 = a2 - 1;
  if (!a2) {
    uint64_t v4 = 0LL;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = result - v4 + a2;
  if (result - v4 <= v6)
  {
    unsigned int v7 = *a3;
    if (*a3)
    {
      uint64_t v8 = 1859794436LL;
      if (a2)
      {
        unsigned int v9 = (_BYTE *)result;
        do
        {
          unsigned int v10 = v7;
          _BYTE *v9 = v7;
          if (a2 < 0) {
            goto LABEL_26;
          }
          --v9;
          if (!--a2) {
            break;
          }
          v7 >>= 8;
        }

        while (v10 > 0xFF);
        if (v10 > 0xFF) {
          return v8;
        }
        if ((v10 & 0x80) == 0)
        {
LABEL_18:
          uint64_t v11 = result - (void)v9;
          goto LABEL_23;
        }

        if (!a2) {
          return v8;
        }
        if ((unint64_t)v9 < v6 && (unint64_t)v9 >= v5)
        {
          *v9-- = 0;
          goto LABEL_18;
        }

        goto LABEL_26;
      }

      return v8;
    }

    if (!a2) {
      return 1859794436LL;
    }
    if (v4 >= 0 && v6 > result)
    {
      *(_BYTE *)uint64_t result = 0;
      uint64_t v11 = 1LL;
LABEL_23:
      uint64_t v8 = 0LL;
      *a4 = v11;
      return v8;
    }
  }

LABEL_26:
  __break(0x5519u);
  return result;
}

  __break(0x5519u);
  return result;
}

unint64_t __gen2_der_put_unsigned64( unint64_t result, uint64_t a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t v4 = a2 - 1;
  if (!a2) {
    uint64_t v4 = 0LL;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = result - v4 + a2;
  if (result - v4 <= v6)
  {
    unint64_t v7 = *a3;
    if (*a3)
    {
      uint64_t v8 = 1859794436LL;
      if (a2)
      {
        unsigned int v9 = (_BYTE *)result;
        do
        {
          unint64_t v10 = v7;
          _BYTE *v9 = v7;
          if (a2 < 0) {
            goto LABEL_26;
          }
          --v9;
          if (!--a2) {
            break;
          }
          v7 >>= 8;
        }

        while (v10 > 0xFF);
        if (v10 > 0xFF) {
          return v8;
        }
        if (((char)v10 & 0x80000000) == 0)
        {
LABEL_18:
          uint64_t v11 = result - (void)v9;
          goto LABEL_23;
        }

        if (!a2) {
          return v8;
        }
        if ((unint64_t)v9 < v6 && (unint64_t)v9 >= v5)
        {
          *v9-- = 0;
          goto LABEL_18;
        }

        goto LABEL_26;
      }

      return v8;
    }

    if (!a2) {
      return 1859794436LL;
    }
    if (v4 >= 0 && v6 > result)
    {
      *(_BYTE *)uint64_t result = 0;
      uint64_t v11 = 1LL;
LABEL_23:
      uint64_t v8 = 0LL;
      *a4 = v11;
      return v8;
    }
  }

uint64_t __gen2_der_put_integer(uint64_t result, uint64_t a2, unsigned int *a3, void *a4)
{
  uint64_t v4 = a2 - 1;
  if (!a2) {
    uint64_t v4 = 0LL;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = v5 + a2;
  if (v5 > v5 + a2) {
    goto LABEL_30;
  }
  unsigned int v7 = *a3;
  if ((*a3 & 0x80000000) != 0)
  {
    unsigned int v10 = ~v7;
    uint64_t v8 = (_BYTE *)result;
    do
    {
      if (!a2) {
        return 1859794436LL;
      }
      unsigned int v11 = v10;
      *uint64_t v8 = ~(_BYTE)v10;
      if (a2 < 0) {
        goto LABEL_30;
      }
      --v8;
      --a2;
      v10 >>= 8;
    }

    while (v11 > 0xFF);
    if ((v11 & 0x80) == 0)
    {
LABEL_27:
      uint64_t v12 = 0LL;
      *a4 = result - (void)v8;
      return v12;
    }

    if (!a2) {
      return 1859794436LL;
    }
    if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
    {
      *v8-- = -1;
      goto LABEL_27;
    }

LABEL_30:
    __break(0x5519u);
    return result;
  }

  uint64_t v8 = (_BYTE *)result;
  while (a2)
  {
    unsigned int v9 = v7;
    *uint64_t v8 = v7;
    if (a2 < 0) {
      goto LABEL_30;
    }
    --v8;
    --a2;
    v7 >>= 8;
    if (v9 <= 0xFF)
    {
      if ((v9 & 0x80) == 0) {
        goto LABEL_27;
      }
      if (!a2) {
        return 1859794436LL;
      }
      if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
      {
        *v8-- = 0;
        goto LABEL_27;
      }

      goto LABEL_30;
    }
  }

  return 1859794436LL;
}

    __break(0x5519u);
    return result;
  }

  uint64_t v8 = (_BYTE *)result;
  while (a2)
  {
    *uint64_t v8 = v7;
    if (a2 < 0) {
      goto LABEL_30;
    }
    unsigned int v9 = v7;
    --v8;
    --a2;
    unsigned int v10 = v7 > 0xFF;
    v7 >>= 8;
    if (!v10)
    {
      if ((v9 & 0x80000000) == 0) {
        goto LABEL_27;
      }
      if (!a2) {
        return 1859794436LL;
      }
      if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
      {
        *v8-- = 0;
        goto LABEL_27;
      }

      goto LABEL_30;
    }
  }

  return 1859794436LL;
}

uint64_t __gen2_der_put_integer64(uint64_t result, uint64_t a2, unint64_t *a3, void *a4)
{
  uint64_t v4 = a2 - 1;
  if (!a2) {
    uint64_t v4 = 0LL;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = v5 + a2;
  if (v5 > v5 + a2) {
    goto LABEL_30;
  }
  unint64_t v7 = *a3;
  if ((*a3 & 0x8000000000000000LL) != 0)
  {
    unint64_t v11 = ~v7;
    uint64_t v8 = (_BYTE *)result;
    do
    {
      if (!a2) {
        return 1859794436LL;
      }
      *uint64_t v8 = ~(_BYTE)v11;
      if (a2 < 0) {
        goto LABEL_30;
      }
      char v12 = v11;
      --v8;
      --a2;
      BOOL v10 = v11 > 0xFF;
      v11 >>= 8;
    }

    while (v10);
    if ((v12 & 0x80000000) == 0)
    {
LABEL_27:
      uint64_t v13 = 0LL;
      *a4 = result - (void)v8;
      return v13;
    }

    if (!a2) {
      return 1859794436LL;
    }
    if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
    {
      *v8-- = -1;
      goto LABEL_27;
    }

_BYTE *__gen2_der_put_length(_BYTE *result, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  if (a2) {
    uint64_t v4 = a2 - 1;
  }
  else {
    uint64_t v4 = 0LL;
  }
  unint64_t v5 = &result[-v4];
  unint64_t v6 = &result[a2 - v4];
  if (&result[-v4] <= v6)
  {
    uint64_t v7 = 1859794436LL;
    if (!a2) {
      return (_BYTE *)v7;
    }
    if (a3 >= 0x80)
    {
      uint64_t v9 = 0LL;
      while (1 - a2 != v9)
      {
        BOOL v10 = &result[v9];
        if (&result[v9] >= v6) {
          goto LABEL_24;
        }
        if (v10 < v5) {
          goto LABEL_24;
        }
        *BOOL v10 = a3;
        if (~a2 == v9) {
          goto LABEL_24;
        }
        --v9;
        BOOL v11 = a3 > 0xFF;
        a3 >>= 8;
        if (!v11)
        {
          if (&result[v9] >= v6 || &result[v9] < v5) {
            goto LABEL_24;
          }
          result[v9] = -(char)v9 | 0x80;
          if (a4)
          {
            uint64_t v8 = 1 - v9;
            goto LABEL_21;
          }

          return 0LL;
        }
      }

      return (_BYTE *)v7;
    }

    if ((-v4 < 0 || v4 == 0) && v6 > result)
    {
      *uint64_t result = a3;
      uint64_t v8 = 1LL;
LABEL_21:
      uint64_t v7 = 0LL;
      *a4 = v8;
      return (_BYTE *)v7;
    }
  }

LABEL_24:
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_put_BOOLean(char *a1, uint64_t a2, _DWORD *a3, void *a4)
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

unint64_t __gen2_der_put_general_string( unint64_t result, size_t a2, const char **a3, size_t *a4)
{
  size_t v4 = a2 - 1;
  if (!a2) {
    size_t v4 = 0LL;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = result - v4 + a2;
  if (result - v4 > v6) {
    goto LABEL_17;
  }
  unint64_t v9 = result;
  BOOL v10 = *a3;
  size_t v11 = strlen(*a3);
  if (v11 > a2) {
    return 1859794436LL;
  }
  size_t v12 = v11;
  uint64_t result = v9 - v11 + 1;
  BOOL v13 = v10 > &v10[v12] || result > v6;
  BOOL v14 = !v13 && result >= v5;
  if (!v14 || v12 > v6 - result)
  {
LABEL_17:
    __break(0x5519u);
  }

  else
  {
    memcpy((void *)result, v10, v12);
    uint64_t result = 0LL;
    *a4 = v12;
  }

  return result;
}

unint64_t __gen2_der_put_octet_string(unint64_t result, size_t a2, uint64_t a3, size_t *a4)
{
  size_t v4 = a2 - 1;
  if (!a2) {
    size_t v4 = 0LL;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = v5 + a2;
  if (v5 <= v5 + a2)
  {
    size_t v8 = *(void *)a3;
    if (v8 > a2) {
      return 1859794436LL;
    }
    if (!v8)
    {
      size_t v12 = 0LL;
      goto LABEL_17;
    }

    if ((v8 & 0x8000000000000000LL) == 0)
    {
      uint64_t result = result - v8 + 1;
      BOOL v10 = result <= v6 && result >= v5;
      if (v10 && v8 <= v6 - result)
      {
        memcpy((void *)result, *(const void **)(a3 + 8), v8);
        size_t v12 = *(void *)a3;
LABEL_17:
        uint64_t result = 0LL;
        *a4 = v12;
        return result;
      }
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_put_bmp_string(uint64_t result, unint64_t a2, unint64_t *a3, uint64_t *a4)
{
  unint64_t v4 = a2 - 1;
  if (!a2) {
    unint64_t v4 = 0LL;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = v5 + a2;
  if (v5 > v5 + a2)
  {
LABEL_30:
    __break(0x5519u);
    return result;
  }

  unint64_t v7 = *a3;
  if (*a3 > a2 >> 1) {
    return 1859794436LL;
  }
  if (v7)
  {
    uint64_t v8 = 0LL;
    unint64_t v9 = 0LL;
    BOOL v10 = (_BYTE *)(result - 2 * v7 + 2);
    while (1)
    {
      size_t v11 = v10 - 1;
      *size_t v11 = *(_BYTE *)(a3[1] + 2 * v9 + 1);
      unint64_t v13 = a3[1];
      BOOL v14 = v13 + v8 < v13 + 2 * *a3 && v13 + v8 >= v13;
      BOOL v15 = !v14 || (unint64_t)v10 >= v6;
      *BOOL v10 = *(_BYTE *)(v13 + 2 * v9);
      v10 += 2;
      ++v9;
      v8 += 2LL;
      if (v9 >= *a3)
      {
        uint64_t v17 = 2 * *a3;
        goto LABEL_27;
      }
    }
  }

  uint64_t v17 = 0LL;
LABEL_27:
  uint64_t result = 0LL;
  if (a4) {
    *a4 = v17;
  }
  return result;
}

uint64_t __gen2_der_put_universal_string( uint64_t result, unint64_t a2, unint64_t *a3, uint64_t *a4)
{
  unint64_t v4 = a2 - 1;
  if (!a2) {
    unint64_t v4 = 0LL;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = v5 + a2;
  if (v5 > v5 + a2)
  {
LABEL_45:
    __break(0x5519u);
    return result;
  }

  unint64_t v7 = *a3;
  if (*a3 > a2 >> 2) {
    return 1859794436LL;
  }
  if (v7)
  {
    uint64_t v8 = 0LL;
    unint64_t v9 = 0LL;
    uint64_t v10 = result - 4 * v7;
    while (1)
    {
      size_t v11 = (_BYTE *)(v10 + v8 + 1);
      *size_t v11 = *(_BYTE *)(a3[1] + v8 + 3);
      unint64_t v13 = a3[1];
      unint64_t v14 = v13 + v8;
      BOOL v15 = v13 + v8 < v13 + 4 * *a3 && v14 >= v13;
      uint64_t v16 = (_BYTE *)(v10 + v8 + 2);
      BOOL v17 = !v15 || (unint64_t)v16 >= v6;
      *uint64_t v16 = *(_WORD *)(v14 + 2);
      unint64_t v19 = a3[1];
      v20 = (_DWORD *)(v19 + v8);
      BOOL v21 = v19 + v8 < v19 + 4 * *a3 && (unint64_t)v20 >= v19;
      v22 = (_BYTE *)(v10 + v8 + 3);
      BOOL v23 = !v21 || (unint64_t)v22 >= v6;
      _BYTE *v22 = BYTE1(*v20);
      unint64_t v25 = a3[1];
      v26 = (_DWORD *)(v25 + v8);
      if (v25 + v8 >= v25 + 4 * *a3) {
        goto LABEL_45;
      }
      v27 = (_BYTE *)(v10 + v8 + 4);
      _BYTE *v27 = *v26;
      ++v9;
      v8 += 4LL;
      if (v9 >= *a3)
      {
        uint64_t v28 = 4 * *a3;
        goto LABEL_42;
      }
    }
  }

  uint64_t v28 = 0LL;
LABEL_42:
  uint64_t result = 0LL;
  if (a4) {
    *a4 = v28;
  }
  return result;
}

unint64_t __gen2_der_put_heim_integer(unint64_t result, size_t a2, uint64_t a3, uint64_t *a4)
{
  size_t v4 = a2 - 1;
  if (!a2) {
    size_t v4 = 0LL;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = result - v4 + a2;
  if (result - v4 > v6) {
    goto LABEL_54;
  }
  uint64_t v10 = -(uint64_t)v4;
  size_t v11 = *(void *)a3;
  if (!*(void *)a3)
  {
    if (a2)
    {
      if (v10 > 0 || v6 <= result) {
        goto LABEL_54;
      }
      *(_BYTE *)uint64_t result = 0;
      if (a4)
      {
        uint64_t v15 = 1LL;
LABEL_46:
        uint64_t v12 = 0LL;
        *a4 = v15;
        return v12;
      }

      return 0LL;
    }

    return 1859794436LL;
  }

  uint64_t v12 = 1859794436LL;
  if (v11 > a2) {
    return v12;
  }
  unint64_t v13 = *(unsigned __int8 **)(a3 + 8);
  if (!*(_DWORD *)(a3 + 16))
  {
    v22 = (_BYTE *)(result - v11);
    BOOL v23 = (char *)(result - v11 + 1);
    uint64_t result = (unint64_t)memcpy((void *)(result - v11 + 1), v13, *(void *)a3);
    if (*v23 < 0)
    {
      if (v11 == a2) {
        return v12;
      }
      _BYTE *v22 = 0;
LABEL_51:
      uint64_t v14 = 1LL;
      if (!a4) {
        return 0LL;
      }
LABEL_45:
      uint64_t v15 = *(void *)a3 + v14;
      goto LABEL_46;
    }

LABEL_44:
    uint64_t v14 = 0LL;
    if (a4) {
      goto LABEL_45;
    }
    return 0LL;
  }

  if (v11 == 1 && *v13 == 1)
  {
    if (v10 <= 0 && v6 > result)
    {
      uint64_t v14 = 0LL;
      *(_BYTE *)uint64_t result = -1;
      if (!a4) {
        return 0LL;
      }
      goto LABEL_45;
    }
  }

  else
  {
    uint64_t v16 = v13 - 1;
    BOOL v17 = 1;
    size_t v18 = *(void *)a3;
    while (1)
    {
      unint64_t v19 = &v16[v18];
      BOOL v20 = &v16[v18] < &v13[v11] && v19 >= v13;
      if (!v20 || result >= v6 || result < v5) {
        break;
      }
      int v21 = *v19;
      LOBYTE(v19) = ~(_BYTE)v21;
      *(_BYTE *)uint64_t result = ~(_BYTE)v21;
      if (v17)
      {
        LODWORD(v19) = -v21;
        *(_BYTE *)uint64_t result = -(char)v21;
        BOOL v17 = v21 == 0;
      }

      --v18;
      --result;
      if (v18 + 1 <= 1)
      {
        if (v11 == a2) {
          return v12;
        }
        if (result < v6 && result >= v5)
        {
          *(_BYTE *)uint64_t result = -1;
          goto LABEL_51;
        }

        break;
      }
    }
  }

LABEL_54:
  __break(0x5519u);
  return result;
}

unint64_t __gen2_der_put_generalized_time(unint64_t a1, size_t a2, uint64_t *a3, void *a4)
{
  uint64_t v10 = 0LL;
  size_t v11 = 0LL;
  unint64_t v7 = __gen2_heim_time2generalizedtime(*a3, &v10, 1);
  if (!(_DWORD)v7)
  {
    unint64_t v7 = __gen2_der_put_octet_string(a1, a2, (uint64_t)&v10, &v9);
    free(v11);
    if (!(_DWORD)v7)
    {
      unint64_t v7 = 0LL;
      if (a4) {
        *a4 = v9;
      }
    }
  }

  return v7;
}

uint64_t __gen2_heim_time2generalizedtime(uint64_t a1, uint64_t *a2, int a3)
{
  if (a3) {
    uint64_t v5 = 15LL;
  }
  else {
    uint64_t v5 = 13LL;
  }
  *a2 = 0LL;
  a2[1] = 0LL;
  unint64_t v6 = (char *)malloc(v5 + 1);
  if (!v6) {
    return 12LL;
  }
  *a2 = v5;
  a2[1] = (uint64_t)v6;
  if (a3) {
    snprintf(v6, v5 + 1, "%04d%02d%02d%02d%02d%02dZ", (v9 + 1900));
  }
  else {
    snprintf(v6, v5 + 1, "%02d%02d%02d%02d%02d%02dZ", (v9 % 100));
  }
  return 0LL;
}

unint64_t __gen2_der_put_utctime(unint64_t a1, size_t a2, uint64_t *a3, void *a4)
{
  uint64_t v10 = 0LL;
  size_t v11 = 0LL;
  unint64_t v7 = __gen2_heim_time2generalizedtime(*a3, &v10, 0);
  if (!(_DWORD)v7)
  {
    unint64_t v7 = __gen2_der_put_octet_string(a1, a2, (uint64_t)&v10, &v9);
    free(v11);
    if (!(_DWORD)v7)
    {
      unint64_t v7 = 0LL;
      if (a4) {
        *a4 = v9;
      }
    }
  }

  return v7;
}

uint64_t __gen2_der_put_oid(uint64_t result, unint64_t a2, void *a3, void *a4)
{
  unint64_t v4 = a2 - 1;
  if (!a2) {
    unint64_t v4 = 0LL;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = v5 + a2;
  if (v5 > v5 + a2) {
    goto LABEL_37;
  }
  unint64_t v7 = *a3 - 1LL;
  int v8 = (_BYTE *)result;
  while (v7 >= 2)
  {
    unint64_t v9 = a3[1];
    uint64_t v10 = (unsigned int *)(v9 + 4 * v7);
    BOOL v11 = (unint64_t)v10 < v9 + 4LL * *a3 && (unint64_t)v10 >= v9;
    if (!v11) {
      goto LABEL_37;
    }
    if (!a2) {
      return 1859794436LL;
    }
    unsigned int v12 = *v10;
    *int v8 = v12 & 0x7F;
    if ((a2 & 0x8000000000000000LL) != 0) {
      goto LABEL_37;
    }
    --v8;
    --a2;
    while (v12 >= 0x80)
    {
      if (!a2) {
        return 1859794436LL;
      }
      if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
      {
        v12 >>= 7;
        *v8-- = v12 | 0x80;
        BOOL v11 = a2 - 1 >= a2;
        --a2;
        if (!v11) {
          continue;
        }
      }

      goto LABEL_37;
    }

    --v7;
  }

  if (!a2) {
    return 1859794436LL;
  }
  if (*a3)
  {
    unint64_t v13 = (_DWORD *)a3[1];
    BOOL v14 = v13 + 1 >= &v13[*a3] || (unint64_t)v8 >= v6;
    if (!v14 && (unint64_t)v8 >= v5)
    {
      uint64_t v16 = 0LL;
      *int v8 = v13[1] + 40 * *v13;
      *a4 = result - (void)v8 + 1;
      return v16;
    }
  }

LABEL_37:
  __break(0x5519u);
  return result;
}

  uint64_t result = 0LL;
  if (a4) {
    *a4 = a2;
  }
  return result;
}

  __break(0x5519u);
  return result;
}

unint64_t __gen2_der_put_tag( unint64_t result, uint64_t a2, char a3, char a4, unsigned int a5, uint64_t *a6)
{
  if (a2) {
    uint64_t v6 = a2 - 1;
  }
  else {
    uint64_t v6 = 0LL;
  }
  unint64_t v7 = result - v6;
  unint64_t v8 = result - v6 + a2;
  if (result - v6 > v8) {
    goto LABEL_22;
  }
  if (a5 >= 0x1F)
  {
    uint64_t v10 = 0LL;
    char v11 = 0;
    while (-a2 != v10)
    {
      unsigned int v12 = (_BYTE *)(result + v10);
      if (result + v10 >= v8) {
        goto LABEL_22;
      }
      *unsigned int v12 = a5 & 0x7F | v11;
      if (~a2 == v10) {
        goto LABEL_22;
      }
      --v10;
      char v11 = 0x80;
      BOOL v13 = a5 > 0x7F;
      a5 >>= 7;
      if (!v13)
      {
        if (!(a2 + v10)) {
          return 1859794436LL;
        }
        BOOL v14 = (_BYTE *)(result + v10);
        if (result + v10 < v8 && (unint64_t)v14 >= v7)
        {
          *BOOL v14 = (32 * a4) | (a3 << 6) | 0x1F;
          uint64_t v9 = 1 - v10;
          goto LABEL_21;
        }

        goto LABEL_22;
      }
    }

    return 1859794436LL;
  }

  if (!a2) {
    return 1859794436LL;
  }
  if (v6 < 0 || v8 <= result)
  {
LABEL_22:
    __break(0x5519u);
    return result;
  }

  *(_BYTE *)uint64_t result = (32 * a4) | (a3 << 6) | a5;
  uint64_t v9 = 1LL;
LABEL_21:
  uint64_t result = 0LL;
  *a6 = v9;
  return result;
}

_BYTE *__gen2_der_put_length_and_tag( _BYTE *result, unint64_t a2, unint64_t a3, char a4, char a5, unsigned int a6, void *a7)
{
  unint64_t v7 = a2 - 1;
  if (!a2) {
    unint64_t v7 = 0LL;
  }
  if (&result[-v7] > &result[a2 - v7]) {
    goto LABEL_9;
  }
  BOOL v13 = result;
  uint64_t result = __gen2_der_put_length(result, a2, a3, (uint64_t *)&v15);
  if ((_DWORD)result) {
    return result;
  }
  unint64_t v14 = v15;
  if (a2 < v15)
  {
LABEL_9:
    __break(0x5519u);
    return result;
  }

  uint64_t result = (_BYTE *)__gen2_der_put_tag((unint64_t)&v13[-v15], a2 - v15, a4, a5, a6, (uint64_t *)&v15);
  if (!(_DWORD)result) {
    *a7 = v15 + v14;
  }
  return result;
}

unint64_t __gen2_der_put_bit_string( unint64_t result, unint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v4 = a2 - 1;
  if (!a2) {
    unint64_t v4 = 0LL;
  }
  unint64_t v5 = result - v4;
  unint64_t v6 = result - v4 + a2;
  if (result - v4 > v6) {
    goto LABEL_28;
  }
  unint64_t v8 = (unint64_t)(*(void *)a3 + 7LL) >> 3;
  if (v8 >= a2) {
    return 1859794436LL;
  }
  uint64_t result = a2 + v5 - v8;
  BOOL v9 = v6 >= result && result >= v5;
  if (!v9 || v8 > v6 - result) {
    goto LABEL_28;
  }
  uint64_t v12 = a2 + v5 + ~v8 - 1;
  uint64_t result = (unint64_t)memcpy( (void *)result,  *(const void **)(a3 + 8),  (unint64_t)(*(void *)a3 + 7LL) >> 3);
  if (!*(void *)a3 || (uint64_t v13 = *(void *)a3 & 7LL) == 0)
  {
    uint64_t v16 = (_BYTE *)(v12 + 1);
    *uint64_t v16 = 0;
LABEL_27:
    uint64_t result = 0LL;
    *a4 = v8 + 1;
    return result;
  }

  unint64_t v14 = (_BYTE *)(v12 + 1);
  if (v12 + 1 < v6 && (unint64_t)v14 >= v5)
  {
    *unint64_t v14 = 8 - v13;
    goto LABEL_27;
  }

LABEL_28:
  __break(0x5519u);
  return result;
}

uint64_t __gen2_heim_der_set_sort(size_t *a1, size_t *a2)
{
  size_t v3 = *a1;
  unint64_t v2 = (const void *)a1[1];
  size_t v5 = *a2;
  unint64_t v4 = (const void *)a2[1];
  if (v3 >= v5) {
    size_t v6 = v5;
  }
  else {
    size_t v6 = v3;
  }
  LODWORD(result) = memcmp(v2, v4, v6);
  if ((_DWORD)result) {
    return result;
  }
  else {
    return (v3 - v5);
  }
}

char *__gen2_der_get_class_name(unsigned int a1)
{
  if (a1 <= 3) {
    return class_names[a1];
  }
  else {
    return 0LL;
  }
}

uint64_t __gen2_der_get_class_num(char *a1)
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

char *__gen2_der_get_type_name(unsigned int a1)
{
  if (a1 <= 1) {
    return type_names[a1];
  }
  else {
    return 0LL;
  }
}

uint64_t __gen2_der_get_type_num(char *a1)
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

char *__gen2_der_get_tag_name(unsigned int a1)
{
  if (a1 <= 0x1E) {
    return tag_names[a1];
  }
  else {
    return 0LL;
  }
}

uint64_t __gen2_der_get_tag_num(char *a1)
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

uint64_t __gen2_der_timegm(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 20);
  if (v1 > 2000) {
    return 0LL;
  }
  if (v1 < 0) {
    return -1LL;
  }
  uint64_t v2 = *(unsigned int *)(result + 16);
  uint64_t v3 = *(int *)(result + 12);
  int v4 = v1 + 1900;
  int v5 = *(_DWORD *)(result + 20) & 3;
  if ((v1 & 3) != 0)
  {
    BOOL v6 = 0;
  }

  else
  {
    HIDWORD(v7) = -1030792151 * (unsigned __int16)(v1 + 1900);
    LODWORD(v7) = HIDWORD(v7);
    if ((v7 >> 2) <= 0x28F5C28)
    {
      HIDWORD(v8) = -1030792151 * (unsigned __int16)(v1 + 1900);
      LODWORD(v8) = HIDWORD(v8);
      BOOL v6 = (v8 >> 4) < 0xA3D70B;
    }

    else
    {
      BOOL v6 = 1;
    }
  }

  BOOL v9 = (char *)&ndays + 48 * v6;
  uint64_t v10 = &v9[4 * v2];
  if (v10 >= v9 + 48 || v10 < v9) {
    goto LABEL_49;
  }
  uint64_t v12 = *(int *)(result + 8);
  uint64_t v13 = *(int *)(result + 4);
  uint64_t v14 = *(int *)result;
  if (v1 < 0x47)
  {
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v15 = 0LL;
    int v16 = 70;
    int v17 = -1970;
    unsigned int v18 = 1970;
    do
    {
      if ((v16 & 3) == 0 && (!(v17 + 100 * (v18 / 0x64)) ? (BOOL v19 = v17 + 400 * (v18 / 0x190) == 0) : (BOOL v19 = 1), v19)) {
        uint64_t v20 = 366LL;
      }
      else {
        uint64_t v20 = 365LL;
      }
      v15 += v20;
      ++v16;
      --v17;
      ++v18;
    }

    while (v1 != v16);
  }

  HIDWORD(v21) = -1030792151 * v4;
  LODWORD(v21) = -1030792151 * v4;
  uint64_t result = 42949672LL;
  BOOL v22 = (v21 >> 2) > 0x28F5C28;
  HIDWORD(v21) = -1030792151 * v4;
  LODWORD(v21) = -1030792151 * v4;
  unsigned int v23 = v21 >> 4;
  unsigned int v26 = (v22 || v23 < 0xA3D70B) && v5 == 0;
  v27 = (char *)&ndays + 48 * v26;
  for (i = v27; i < v27 + 48 && i >= v27; i += 4)
  {
    unsigned int v29 = *(_DWORD *)i;
    v15 += v29;
    if (!--v2) {
      return v14 + 60 * (v13 + 60 * (v12 + 24 * (v3 + v15)) - 1440);
    }
  }

LABEL_49:
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_gmtime(uint64_t a1, uint64_t a2)
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
    unsigned int v19 = (!v12 || v16 == 0) && (((_BYTE)v9 + 70) & 3) == 0;
    uint64_t v20 = (char *)&ndays + 48 * v19;
    *(_DWORD *)(a2 + 16) = 0;
    unint64_t v21 = (unint64_t)(v20 + 4);
    int v22 = 1;
    while (1)
    {
      uint64_t v23 = *(unsigned int *)(v21 - 4);
      BOOL v14 = __OFSUB__(v4, v23);
      uint64_t v24 = v4 - v23;
      if (v24 < 0 != v14) {
        break;
      }
      *(_DWORD *)(a2 + 16) = v22;
      if (v21 < (unint64_t)(v20 + 48))
      {
        ++v22;
        uint64_t v4 = v24;
        BOOL v25 = v21 >= (unint64_t)v20;
        v21 += 4LL;
        if (v25) {
          continue;
        }
      }

      __break(0x5519u);
      break;
    }

    *(_DWORD *)(a2 + 12) = v4 + 1;
    return a2;
  }

  return result;
}

uint64_t __gen2_der_get_unsigned(_BYTE *a1, unint64_t a2, int *a3, unint64_t *a4)
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

uint64_t __gen2_der_get_unsigned64( _BYTE *a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v4 = 1859794437LL;
  if (a2 == 9)
  {
    if (*a1) {
      return v4;
    }
  }

  else
  {
    if (a2 > 8) {
      return v4;
    }
    if (!a2)
    {
      unint64_t v5 = 0LL;
      goto LABEL_10;
    }
  }

  unint64_t v5 = 0LL;
  unint64_t v6 = a2;
  do
  {
    unsigned int v7 = *a1++;
    unint64_t v5 = v7 | (v5 << 8);
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

uint64_t __gen2_der_get_integer(_BYTE *a1, unint64_t a2, int *a3, unint64_t *a4)
{
  if (a2 == 5)
  {
    int v4 = *a1;
    if (*a1 && v4 != 255) {
      return 1859794437LL;
    }
  }

  else
  {
    if (a2 > 4) {
      return 1859794437LL;
    }
    if (!a2) {
      goto LABEL_17;
    }
    LOBYTE(v4) = *a1;
  }

  unint64_t v6 = a1 + 1;
  if (a1 + 1 >= a1 && v6 <= &a1[a2])
  {
    int v4 = (char)v4;
    unint64_t v7 = a2 - 1;
    while (v7)
    {
      if (v6 + 1 <= &a1[a2])
      {
        int v4 = *v6 | (v4 << 8);
        --v7;
        BOOL v8 = v6 >= v6 + 1;
        ++v6;
        if (!v8) {
          continue;
        }
      }

      goto LABEL_16;
    }

    goto LABEL_18;
  }

LABEL_16:
  __break(0x5519u);
LABEL_17:
  int v4 = 0;
LABEL_18:
  *a3 = v4;
  uint64_t result = 0LL;
  if (a4) {
    *a4 = a2;
  }
  return result;
}

uint64_t __gen2_der_get_integer64(char *a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  if (a2 > 8) {
    return 1859794437LL;
  }
  if (a2)
  {
    unint64_t v5 = (unsigned __int8 *)(a1 + 1);
    if (a1 + 1 >= a1 && v5 <= (unsigned __int8 *)&a1[a2])
    {
      unint64_t v6 = *a1;
      unint64_t v7 = a2 - 1;
      while (v7)
      {
        if (v5 + 1 <= (unsigned __int8 *)&a1[a2])
        {
          unint64_t v6 = *v5 | (v6 << 8);
          --v7;
          BOOL v8 = v5 >= v5 + 1;
          ++v5;
          if (!v8) {
            continue;
          }
        }

        goto LABEL_11;
      }

      goto LABEL_13;
    }

LABEL_11:
    __break(0x5519u);
  }

  unint64_t v6 = 0LL;
LABEL_13:
  *a3 = v6;
  uint64_t result = 0LL;
  if (a4) {
    *a4 = a2;
  }
  return result;
}

  if (v9 != __n)
  {
    *a3 = 0LL;
    return 1859794443LL;
  }

  else
  {
LABEL_12:
    BOOL v12 = __n + 1;
    uint64_t result = (unint64_t)malloc(__n + 1);
    if (!result)
    {
      *a3 = 0LL;
      return 12LL;
    }

    if ((v12 & 0x8000000000000000LL) != 0) {
      goto LABEL_23;
    }
    uint64_t v13 = result;
    BOOL v14 = result + v12;
    uint64_t result = (unint64_t)memcpy((void *)result, a1, __n);
    uint64_t v15 = (_BYTE *)(v13 + __n);
    if (v13 + __n >= v14) {
      goto LABEL_23;
    }
    *uint64_t v15 = 0;
    *a3 = v13;
    uint64_t result = 0LL;
    if (a4) {
      *a4 = __n;
    }
  }

  return result;
}

uint64_t __gen2_der_get_length(char *a1, uint64_t a2, void *a3, uint64_t *a4)
{
  uint64_t v4 = 1859794437LL;
  if (a2)
  {
    int v6 = *a1;
    unint64_t v5 = a1 + 1;
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

uint64_t __gen2_der_get_BOOLean(unsigned __int8 *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  if (!a2) {
    return 1859794437LL;
  }
  uint64_t result = 0LL;
  *a3 = *a1 != 0;
  *a4 = 1LL;
  return result;
}

unint64_t __gen2_der_get_general_string(char *a1, size_t __n, unint64_t *a3, void *a4)
{
  unint64_t result = (unint64_t)memchr(a1, 0, __n);
  if (!result) {
    goto LABEL_12;
  }
  unint64_t v9 = result - (void)a1;
  if (result - (unint64_t)a1 < __n)
  {
    while (1)
    {
      uint64_t v10 = &a1[v9];
      if (&a1[__n] <= &a1[v9] || v10 < a1) {
        break;
      }
      if (*v10) {
        goto LABEL_11;
      }
      if (++v9 >= __n) {
        goto LABEL_12;
      }
    }

LABEL_23:
    __break(0x5519u);
    return result;
  }

uint64_t __gen2_der_get_printable_string(const void *a1, size_t a2, size_t *a3, size_t *a4)
{
  if (a2 == -1LL)
  {
    *a3 = 0LL;
    a3[1] = 0LL;
    return 1859794439LL;
  }

  else
  {
    size_t v8 = a2 + 1;
    uint64_t result = (uint64_t)malloc(a2 + 1);
    if (result)
    {
      if ((v8 & 0x8000000000000000LL) != 0
        || (unint64_t v10 = result,
            unint64_t v11 = result + v8,
            *a3 = v8,
            a3[1] = result,
            uint64_t result = (uint64_t)memcpy((void *)result, a1, a2),
            size_t v12 = (_BYTE *)(v10 + a2),
            v10 + a2 >= v11)
        || (unint64_t)v12 < v10)
      {
        __break(0x5519u);
      }

      else
      {
        *size_t v12 = 0;
        uint64_t result = 0LL;
        if (a4) {
          *a4 = a2;
        }
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

unint64_t __gen2_der_get_bmp_string( unint64_t a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  if (!a2)
  {
    unint64_t result = 0LL;
LABEL_7:
    *a3 = 0LL;
    a3[1] = 0LL;
    return result;
  }

  if ((a2 & 1) != 0)
  {
    unint64_t result = 1859794440LL;
    goto LABEL_7;
  }

  if (HIDWORD(a2))
  {
    *a3 = 0LL;
    a3[1] = 0LL;
    return 34LL;
  }

  unint64_t result = (unint64_t)malloc(a2 & 0xFFFFFFFFFFFFFFFELL);
  unint64_t v9 = result + (a2 & 0xFFFFFFFFFFFFFFFELL);
  if (!result) {
    unint64_t v9 = 0LL;
  }
  if (a2 >= 2 && !result)
  {
    *a3 = 0LL;
    a3[1] = 0LL;
    return 12LL;
  }

  if (result > v9) {
    goto LABEL_39;
  }
  unint64_t v10 = a2 >> 1;
  *a3 = v10;
  a3[1] = result;
  if (a2 >= 2)
  {
    uint64_t v11 = 0LL;
    unint64_t v12 = a1 + a2;
    unint64_t v13 = v10 - 1;
    if (v10 <= 1) {
      unint64_t v10 = 1LL;
    }
    unint64_t v14 = a1 + 1;
    while (1)
    {
      BOOL v15 = v14 - 1 < v12 && v14 - 1 >= a1;
      BOOL v16 = !v15 || v14 >= v12;
      if (v16 || v14 < a1) {
        break;
      }
      unsigned int v18 = __rev16(*(unsigned __int16 *)(v14 - 1));
      *(_WORD *)(result + 2 * v11) = v18;
      if (v18) {
        BOOL v19 = 1;
      }
      else {
        BOOL v19 = v13 == v11;
      }
      if (!v19)
      {
        free((void *)result);
        *a3 = 0LL;
        a3[1] = 0LL;
        return 1859794443LL;
      }

      ++v11;
      v14 += 2LL;
      if (v10 == v11) {
        goto LABEL_37;
      }
    }

LABEL_39:
    __break(0x5519u);
    return result;
  }

unint64_t __gen2_der_get_universal_string( unint64_t a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  if (!a2)
  {
    unint64_t result = 0LL;
    goto LABEL_5;
  }

  if ((a2 & 3) != 0)
  {
    unint64_t result = 1859794440LL;
LABEL_5:
    *a3 = 0LL;
    a3[1] = 0LL;
    return result;
  }

  if (HIDWORD(a2))
  {
    *a3 = 0LL;
    a3[1] = 0LL;
    return 34LL;
  }

  unint64_t result = (unint64_t)malloc(a2 & 0xFFFFFFFFFFFFFFFCLL);
  unint64_t v9 = result + (a2 & 0xFFFFFFFFFFFFFFFCLL);
  if (!result) {
    unint64_t v9 = 0LL;
  }
  if (a2 >= 4 && !result)
  {
    *a3 = 0LL;
    a3[1] = 0LL;
    return 12LL;
  }

  if (result > v9 || (unint64_t v10 = a2 >> 2, a2 >> 2 > (uint64_t)(v9 - result) >> 2))
  {
LABEL_50:
    __break(0x5519u);
    return result;
  }

  *a3 = v10;
  a3[1] = result;
  if (a2 >= 4)
  {
    uint64_t v11 = 0LL;
    unint64_t v12 = a1 + a2;
    unint64_t v13 = v10 - 1;
    if (v10 <= 1) {
      unint64_t v10 = 1LL;
    }
    do
    {
      unint64_t v14 = (unsigned __int8 *)(a1 + v11);
      BOOL v15 = a1 + v11 < v12 && (unint64_t)v14 >= a1;
      BOOL v16 = v14 + 1;
      BOOL v17 = !v15 || (unint64_t)v16 >= v12;
      BOOL v18 = !v17 && (unint64_t)v16 >= a1;
      BOOL v19 = v14 + 2;
      BOOL v20 = !v18 || (unint64_t)v19 >= v12;
      BOOL v21 = !v20 && (unint64_t)v19 >= a1;
      int v22 = v14 + 3;
      BOOL v23 = !v21 || (unint64_t)v22 >= v12;
      int v25 = *v22 | (*v19 << 8) | (*v16 << 16) | (*v14 << 24);
      *(_DWORD *)(result + v11) = v25;
      if (v25) {
        BOOL v26 = 1;
      }
      else {
        BOOL v26 = v13 == 0;
      }
      if (!v26)
      {
        free((void *)result);
        *a3 = 0LL;
        a3[1] = 0LL;
        return 1859794443LL;
      }

      v11 += 4LL;
      --v13;
    }

    while (--v10);
  }

  unint64_t result = 0LL;
  if (a4) {
    *a4 = a2;
  }
  return result;
}

uint64_t __gen2_der_get_octet_string(const void *a1, size_t __size, void *a3, void *a4)
{
  if (__size)
  {
    uint64_t result = (uint64_t)malloc(__size);
    if (!result) {
      return 12LL;
    }
    if ((__size & 0x8000000000000000LL) != 0)
    {
      __break(0x5519u);
      return result;
    }

    *a3 = __size;
    a3[1] = result;
    memcpy((void *)result, a1, __size);
  }

  else
  {
    *a3 = 0LL;
    a3[1] = 0LL;
  }

  uint64_t result = 0LL;
  if (a4) {
    *a4 = __size;
  }
  return result;
}

uint64_t __gen2_der_get_octet_string_ber(_BYTE *a1, unint64_t a2, uint64_t *a3, void *a4)
{
  unint64_t v5 = a2;
  int v27 = 0;
  uint64_t v7 = 1859794438LL;
  *a3 = 0LL;
  a3[1] = 0LL;
  while (1)
  {
    if (!v5)
    {
      if (v27) {
        return 1859794447LL;
      }
      goto LABEL_39;
    }

    tag = (char *)__gen2_der_get_tag(a1, v5, &v31, &v32, &v30, &v29);
    if ((_DWORD)tag) {
      goto LABEL_31;
    }
    if (v31) {
      goto LABEL_35;
    }
    int v9 = v32;
    if (!(v32 | v30)) {
      break;
    }
    if (v30 != 4) {
      goto LABEL_35;
    }
    unint64_t v10 = (unint64_t)&a1[v5];
    uint64_t v11 = &a1[v29];
    unint64_t v12 = v5 - v29;
    if (&a1[v5] < &a1[v29]) {
      goto LABEL_30;
    }
    if (a1 > v11) {
      goto LABEL_30;
    }
    unint64_t v13 = v5 - v29;
    if (v13 > v12) {
      goto LABEL_30;
    }
    tag = (char *)__gen2_der_get_length(&a1[v29], v13, &v28, &v29);
    if ((_DWORD)tag) {
      goto LABEL_31;
    }
    a1 = &v11[v29];
    if (v10 < (unint64_t)&v11[v29] || v11 > a1 || (unint64_t v5 = v13 - v29, v5 > v10 - (unint64_t)&v11[v29]))
    {
LABEL_30:
      __break(0x5519u);
LABEL_31:
      uint64_t v7 = (uint64_t)tag;
LABEL_35:
      free((void *)a3[1]);
      *a3 = 0LL;
      a3[1] = 0LL;
      return v7;
    }

    size_t v14 = v28;
    if (v28 == 3705724653) {
      return 1859794452LL;
    }
    unint64_t v15 = v5 - v28;
    if (v5 < v28) {
      return 1859794437LL;
    }
    if (v9)
    {
      ++v27;
      goto LABEL_27;
    }

    size_t v16 = *a3 + v28;
    if (v16)
    {
      BOOL v17 = (char *)realloc((void *)a3[1], *a3 + v28);
      if (!v17)
      {
        uint64_t v7 = 12LL;
        goto LABEL_35;
      }

      BOOL v18 = v17;
      BOOL v19 = &v17[v16];
      uint64_t v20 = *a3;
      tag = &v17[*a3];
      BOOL v21 = v19 >= tag;
      size_t v22 = v19 - tag;
      if (!v21) {
        goto LABEL_30;
      }
      if (v18 > tag) {
        goto LABEL_30;
      }
      if (v14 > v22) {
        goto LABEL_30;
      }
      tag = (char *)memcpy(tag, a1, v14);
      if ((v16 & 0x8000000000000000LL) != 0 || v20 + v14 > v16) {
        goto LABEL_30;
      }
      *a3 = v20 + v14;
      a3[1] = (uint64_t)v18;
LABEL_27:
      unint64_t v23 = v10 - (void)&a1[v14];
      if (a1 > &a1[v14]) {
        goto LABEL_30;
      }
      unint64_t v5 = v15;
      a1 += v14;
      if (v15 > v23) {
        goto LABEL_30;
      }
    }
  }

  if (v27) {
    goto LABEL_35;
  }
LABEL_39:
  uint64_t v7 = 0LL;
  if (a4) {
    *a4 = a2 - v5;
  }
  return v7;
}

uint64_t __gen2_der_get_tag(_BYTE *a1, uint64_t a2, int *a3, int *a4, _DWORD *a5, uint64_t *a6)
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
        unint64_t v13 = (unint64_t)&a1[v10 + 1];
        if (v13 > (unint64_t)&a1[a2] || (unint64_t)&a1[v10] > v13)
        {
          __break(0x5519u);
          return result;
        }

        ++v10;
        unsigned int v9 = v12;
        if ((v11 & 0x80000000) == 0) {
          goto LABEL_11;
        }
      }
    }

    else
    {
      uint64_t v10 = 1LL;
LABEL_11:
      uint64_t result = 0LL;
      if (a6) {
        *a6 = v10;
      }
    }
  }

  return result;
}

unint64_t __gen2_der_get_heim_integer(unsigned __int8 *a1, size_t __size, uint64_t a3, size_t *a4)
{
  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  *(_DWORD *)(a3 + 16) = 0;
  if (!__size)
  {
    unint64_t result = 0LL;
    if (!a4) {
      return result;
    }
    size_t v6 = 0LL;
    goto LABEL_34;
  }

  size_t v6 = __size;
  int v8 = (char)*a1;
  if ((v8 & 0x80000000) == 0)
  {
    BOOL v10 = __size > 1 && v8 == 0;
    size_t v11 = __size - v10;
    unsigned int v12 = malloc(__size - v10);
    if (v12)
    {
      *(void *)a3 = v11;
      *(void *)(a3 + 8) = v12;
      memcpy(v12, &a1[v10], v6 - v10);
      goto LABEL_11;
    }

    goto LABEL_33;
  }

  *(_DWORD *)(a3 + 16) = 1;
  size_t v14 = __size;
  unint64_t v15 = (char *)a1;
  if (*a1 != 255)
  {
LABEL_21:
    unint64_t result = (unint64_t)malloc(v14);
    if (result)
    {
      *(void *)a3 = v14;
      *(void *)(a3 + 8) = result;
      BOOL v18 = (unsigned __int8 *)&v15[v14 - 1];
      if (v18 < (unsigned __int8 *)&v15[v14] && v15 <= (char *)v18)
      {
        BOOL v19 = (_BYTE *)(result + v14 - 1);
        if ((unint64_t)v19 < result)
        {
LABEL_11:
          unint64_t result = 0LL;
          if (!a4) {
            return result;
          }
          goto LABEL_34;
        }

        BOOL v20 = 1;
        while (v18 < &a1[v6] && v18 >= a1 && (unint64_t)v19 < result + v14)
        {
          int v21 = *v18;
          *BOOL v19 = ~(_BYTE)v21;
          if (v20)
          {
            *BOOL v19 = -(char)v21;
            BOOL v20 = v21 == 0;
          }

          --v18;
        }
      }

      __break(0x5519u);
      return result;
    }

LABEL_33:
    size_t v6 = 0LL;
    *(void *)a3 = 0LL;
    *(void *)(a3 + 8) = 0LL;
    unint64_t result = 12LL;
    if (!a4) {
      return result;
    }
    goto LABEL_34;
  }

  size_t v14 = __size - 1;
  if (__size != 1)
  {
    unint64_t v15 = (char *)(a1 + 1);
    goto LABEL_21;
  }

  size_t v16 = malloc(1uLL);
  if (!v16) {
    return 12LL;
  }
  BOOL v17 = v16;
  unint64_t result = 0LL;
  *BOOL v17 = 1;
  *(void *)a3 = 1LL;
  *(void *)(a3 + 8) = v17;
  if (a4) {
LABEL_34:
  }
    *a4 = v6;
  return result;
}

uint64_t __gen2_der_get_time(const void *a1, size_t a2, uint64_t *a3, size_t *a4)
{
  uint64_t v4 = 1859794432LL;
  if (!a2) {
    return 1859794439LL;
  }
  size_t v9 = a2 + 1;
  uint64_t result = (uint64_t)malloc(a2 + 1);
  if (!result) {
    return 12LL;
  }
  size_t v16 = a3;
  if (((v9 | a2) & 0x8000000000000000LL) == 0)
  {
    size_t v11 = (char *)result;
    unint64_t v12 = result + v9;
    uint64_t result = (uint64_t)memcpy((void *)result, a1, a2);
    unint64_t v13 = &v11[a2];
    if ((unint64_t)&v11[a2] < v12 && v13 >= v11)
    {
      *unint64_t v13 = 0;
      if (v13 + 1 >= v13 && (unint64_t)(v13 + 1) <= v12)
      {
        uint64_t v20 = 0LL;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v17 = 0u;
        if (sscanf( v11,  "%04d%02d%02d%02d%02d%02dZ",  (char *)&v18 + 4,  &v18,  (unint64_t)&v17 | 0xC,  (char *)&v17 + 8,  (char *)&v17 + 4,  &v17) == 6)
        {
          int v14 = DWORD1(v18);
          unint64_t v15 = v16;
        }

        else
        {
          if (sscanf( v11,  "%02d%02d%02d%02d%02d%02dZ",  (char *)&v18 + 4,  &v18,  (unint64_t)&v17 | 0xC,  (char *)&v17 + 8,  (char *)&v17 + 4,  &v17) != 6) {
            goto LABEL_17;
          }
          unint64_t v15 = v16;
          if (SDWORD1(v18) > 49) {
            int v14 = DWORD1(v18) + 1900;
          }
          else {
            int v14 = DWORD1(v18) + 2000;
          }
        }

        LODWORD(v18) = v18 - 1;
        DWORD1(v18) = v14 - 1900;
        uint64_t v4 = 0LL;
        *unint64_t v15 = __gen2_der_timegm((uint64_t)&v17);
LABEL_17:
        free(v11);
        if (a4) {
          *a4 = a2;
        }
        return v4;
      }
    }
  }

  __break(0x5519u);
  return result;
}

unint64_t __gen2_der_get_oid( unsigned __int8 *a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v4 = 1859794437LL;
  if (!a2) {
    return v4;
  }
  if (a2 == -1LL) {
    return 1859794439LL;
  }
  if (a2 > 0x3FFFFFFE) {
    return 34LL;
  }
  unint64_t v9 = a2 + 1;
  unint64_t result = (unint64_t)malloc(4 * (a2 + 1));
  if (!result) {
    return 12LL;
  }
  *a3 = v9;
  a3[1] = result;
  unsigned __int8 v11 = *a1;
  unsigned int v12 = *a1 / 0x28u;
  *(_DWORD *)unint64_t result = v12;
  unint64_t v13 = (_DWORD *)(result + 4);
  unint64_t v14 = result + 4 * v9;
  if (result + 4 < v14 && (unint64_t)v13 >= result)
  {
    *unint64_t v13 = (v11 - 40 * v12);
    size_t v16 = a1 + 1;
    if (a1 + 1 >= a1 && v16 <= &a1[a2])
    {
      unint64_t v17 = 2LL;
      unint64_t v18 = a2 - 1;
      if (a2 != 1)
      {
        while (2)
        {
          unsigned int v19 = 0;
          unint64_t v20 = (unint64_t)&v16[v18];
          int v21 = &v16[v18 - 1];
          unint64_t v22 = v18 - 1;
          unint64_t v23 = v16;
          while (1)
          {
            size_t v16 = v23 + 1;
            unint64_t v18 = v22;
            unsigned int v25 = *v23 & 0x7F | (v19 << 7);
            if (v25 < v19) {
              goto LABEL_35;
            }
            if (!v22) {
              break;
            }
            int v26 = (char)*v23;
            --v22;
            unsigned int v19 = *v23++ & 0x7F | (v19 << 7);
            if ((v26 & 0x80000000) == 0)
            {
              int v21 = v16 - 1;
              goto LABEL_25;
            }
          }

          size_t v16 = (unsigned __int8 *)v20;
LABEL_25:
          int v27 = (unsigned int *)(result + 4 * v17);
          unsigned int *v27 = v25;
          ++v17;
          if (v18) {
            continue;
          }
          break;
        }

        if (v17 >= 3)
        {
          if ((char)*v21 < 0)
          {
LABEL_35:
            __gen2_der_free_oid((uint64_t)a3);
            return v4;
          }
        }
      }

      if (v17 <= v9)
      {
        *a3 = v17;
        uint64_t v4 = 0LL;
        if (a4) {
          *a4 = a2;
        }
        return v4;
      }
    }
  }

uint64_t __gen2_der_match_tag(_BYTE *a1, uint64_t a2, int a3, int a4, unsigned int a5, void *a6)
{
  LODWORD(result) = __gen2_der_match_tag2(a1, a2, a3, &v9, a5, a6);
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

uint64_t __gen2_der_match_tag2(_BYTE *a1, uint64_t a2, int a3, int *a4, unsigned int a5, void *a6)
{
  uint64_t result = __gen2_der_get_tag(a1, a2, &v11, a4, &v10, &v12);
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

char *__gen2_der_match_tag_and_length( char *a1, uint64_t a2, int a3, int *a4, unsigned int a5, void *a6, void *a7)
{
  uint64_t result = (char *)__gen2_der_match_tag2(a1, a2, a3, a4, a5, &v18);
  if (!(_DWORD)result)
  {
    uint64_t v12 = v18;
    uint64_t result = &a1[v18];
    unint64_t v13 = a2 - v18;
    unint64_t v14 = a2 - v18;
    if (&a1[a2] >= &a1[v18] && result >= a1)
    {
      BOOL v16 = v13 >= v14;
      BOOL v17 = v13 == v14;
    }

    else
    {
      BOOL v16 = 1;
      BOOL v17 = 0;
    }

    if (!v17 && v16)
    {
      __break(0x5519u);
    }

    else
    {
      uint64_t result = (char *)__gen2_der_get_length(result, v13, a6, &v18);
      if (!(_DWORD)result)
      {
        uint64_t result = 0LL;
        if (a7) {
          *a7 = v18 + v12;
        }
      }
    }
  }

  return result;
}

uint64_t __gen2_heim_fix_dce(unint64_t a1, unint64_t *a2)
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

uint64_t __gen2_der_get_bit_string( unsigned __int8 *a1, unint64_t a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t result = 1859794437LL;
  if (a2)
  {
    if (a2 <= 0x2000000000000000LL)
    {
      uint64_t result = 1859794440LL;
      if (*a1 <= 7u)
      {
        unint64_t v9 = a2 - 1;
        if (a2 != 1 || !*a1)
        {
          if (a2 == 1)
          {
            *a3 = 0LL;
            a3[1] = 0LL;
          }

          else
          {
            unsigned int v10 = malloc(a2 - 1);
            if (!v10) {
              return 12LL;
            }
            uint64_t v11 = (uint64_t)v10;
            *a3 = 8 * v9;
            a3[1] = (uint64_t)v10;
            uint64_t result = (uint64_t)memcpy(v10, a1 + 1, a2 - 1);
            uint64_t v12 = 8 * v9 - *a1;
            if (v9 < (unint64_t)(v12 + 7) >> 3)
            {
              __break(0x5519u);
              return result;
            }

            *a3 = v12;
            a3[1] = v11;
          }

          uint64_t result = 0LL;
          if (a4) {
            *a4 = a2;
          }
        }
      }
    }
  }

  return result;
}

void __gen2_der_free_general_string(void **a1)
{
  *a1 = 0LL;
}

_DWORD *__gen2_der_free_integer(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

void *__gen2_der_free_integer64(void *result)
{
  *uint64_t result = 0LL;
  return result;
}

_DWORD *__gen2_der_free_unsigned(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

void *__gen2_der_free_unsigned64(void *result)
{
  *uint64_t result = 0LL;
  return result;
}

void *__gen2_der_free_generalized_time(void *result)
{
  *uint64_t result = 0LL;
  return result;
}

void *__gen2_der_free_utctime(void *result)
{
  *uint64_t result = 0LL;
  return result;
}

void __gen2_der_free_utf8string(void **a1)
{
  *a1 = 0LL;
}

void __gen2_der_free_printable_string(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void __gen2_der_free_octet_string(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void __gen2_der_free_ia5_string(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void __gen2_der_free_bmp_string(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void __gen2_der_free_universal_string(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void __gen2_der_free_visible_string(void **a1)
{
  *a1 = 0LL;
}

void __gen2_der_free_heim_integer(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void __gen2_der_free_oid(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void __gen2_der_free_bit_string(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
}

void asn1_abort(char *__format, ...)
{
  for (unsigned int i = &crashreporter_info[1]; (unint64_t)i <= 0x18C7672C4LL; ++i)
  {
    if (!*(i - 1))
    {
      __crashreporter_info__ = (uint64_t)crashreporter_info;
      abort();
    }
  }

  __break(0x5519u);
}

uint64_t __gen2_asn1_sizeofType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t __gen2_asn1_bmember_isset_bit(_DWORD *a1, char a2)
{
  return (*a1 >> a2) & 1;
}

_BYTE *__gen2_asn1_bmember_put_bit(_BYTE *result, _DWORD *a2, char a3, uint64_t a4, _DWORD *a5)
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

uint64_t __gen2_asn1_decode( unint64_t a1, unsigned int a2, unsigned __int8 *a3, size_t a4, char *a5, size_t *a6)
{
  unint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = a1 + 16 * (v6 + 1);
  uint64_t v8 = *(unsigned int *)(a1 + 4);
  BOOL v9 = &a5[v8] >= a5 && v7 >= a1;
  unint64_t v122 = v6 + 1;
  uint64_t v11 = (_DWORD *)a1;
  unint64_t v119 = a1 + 16 * (v6 + 1);
  uint64_t v12 = a3;
  size_t v13 = a4;
  unint64_t v14 = &a3[a4];
  int v113 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 & 1) == 0) {
    unint64_t v14 = 0LL;
  }
  unint64_t v112 = (unint64_t)v14;
  if ((*(_DWORD *)a1 & 1) != 0) {
    unint64_t v15 = a3;
  }
  else {
    unint64_t v15 = 0LL;
  }
  __src = v15;
  if (!v6)
  {
LABEL_209:
    if ((v113 & 2) != 0) {
      size_t v103 = 0LL;
    }
    else {
      size_t v103 = v13;
    }
    size_t v104 = a4 - v103;
    if (a6) {
      *a6 = v104;
    }
    if (!__src) {
      return 0LL;
    }
    v105 = malloc(v104);
    if (!v105) {
      return 12LL;
    }
    if ((v104 & 0x8000000000000000LL) != 0) {
      goto LABEL_241;
    }
    LODWORD(v6) = (_DWORD)a5 + v8;
    if (a5 + 16 > &a5[v8]) {
      goto LABEL_241;
    }
    *(void *)a5 = v104;
    *((void *)a5 + 1) = v105;
    unint64_t v6 = v112 - (void)__src;
    memcpy(v105, __src, v104);
    uint64_t result = 0LL;
    *(void *)a5 = v104;
    return result;
  }

  unint64_t v116 = (unint64_t)(a5 + 16);
  unsigned int v118 = a2 & 0xFFFFFFFA;
  int v111 = a2 & 1;
LABEL_18:
  unint64_t v123 = v6;
  LODWORD(v6) = (_DWORD)v11 + 32;
  v121 = v11 + 4;
  LODWORD(v6) = v11[4];
  switch((v6 >> 28) ^ 8)
  {
    case 0u:
      int v31 = (unsigned int *)*((void *)v11 + 3);
      unint64_t v6 = *((void *)v31 + 1);
      unint64_t v32 = (unint64_t)&v31[4 * v6 + 4];
      uint64_t v33 = v31[1];
      v34 = &a5[v8];
      v35 = &a5[v33];
      if (&a5[v33] >= &a5[v8] || v35 < a5) {
        goto LABEL_241;
      }
      *(_DWORD *)v35 = 1;
      unint64_t v37 = 1LL;
      if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_170;
      }
      while (2)
      {
        v38 = &v31[4 * v37];
        v39 = &a5[v38[1]];
        if (v39)
        {
          LODWORD(v6) = (_DWORD)a5;
          if (v39 >= v34 || v39 < a5) {
            goto LABEL_241;
          }
        }

        uint64_t v41 = __gen2_asn1_decode(*((void *)v38 + 1), 0LL, v12);
        LODWORD(v6) = (1 << (v41 - 1)) & 0x23;
        if ((v41 - 1859794433) <= 5 && (_DWORD)v6 != 0)
        {
          if ((unint64_t)v38 < v32)
          {
            v43 = &v31[4 * v37];
            unint64_t v44 = *((void *)v43 + 1);
            v45 = &a5[v43[1]];
            if (!v45 || ((LODWORD(v6) = (_DWORD)a5, v45 < v34) ? (BOOL v46 = v45 >= a5) : (BOOL v46 = 0), v46))
            {
              __gen2_asn1_free_top(v44, v45);
              unint64_t v37 = (v37 + 1);
              unint64_t v6 = *((void *)v31 + 1);
              if (v6 + 1 <= v37) {
                goto LABEL_170;
              }
              continue;
            }
          }

          goto LABEL_241;
        }

        break;
      }

      uint64_t v86 = v41;
      if ((_DWORD)v41)
      {
        v106 = &v31[4 * v37];
        unint64_t v107 = *((void *)v106 + 1);
        v108 = &a5[v106[1]];
        if (v108)
        {
          LODWORD(v6) = (_DWORD)a5;
          if (v108 >= v34 || v108 < a5) {
            goto LABEL_241;
          }
        }

        __gen2_asn1_free_top(v107, v108);
      }

      else
      {
        *(_DWORD *)v35 = v37;
        LODWORD(v6) = v128[0];
        size_t v87 = v13 - v128[0];
        if (&v12[v13] < &v12[v128[0]]) {
          goto LABEL_241;
        }
        if (v12 > &v12[v128[0]]) {
          goto LABEL_241;
        }
        v13 -= v128[0];
        if (v13 > v87) {
          goto LABEL_241;
        }
        unint64_t v6 = *((void *)v31 + 1);
        v12 += v128[0];
LABEL_170:
        if (v6 + 1 > v37) {
          goto LABEL_182;
        }
        if (*v31)
        {
          *(_DWORD *)v35 = -1;
          unint64_t v6 = *v31;
          v88 = &a5[v6];
          if (&a5[v6])
          {
            if (v88 >= v34) {
              goto LABEL_241;
            }
            LODWORD(v6) = (_DWORD)a5;
            if (v88 < a5) {
              goto LABEL_241;
            }
          }

          uint64_t octet_string = __gen2_der_get_octet_string(v12, v13, v88, v128);
          if (!(_DWORD)octet_string)
          {
LABEL_176:
            v76 = &v12[v13];
            uint64_t v75 = v128[0];
LABEL_177:
            unint64_t v6 = (unint64_t)&v12[v75];
            BOOL v9 = v76 >= &v12[v75];
            size_t v90 = v76 - &v12[v75];
            if (!v9) {
              goto LABEL_241;
            }
            goto LABEL_179;
          }

          return octet_string;
        }

        else
        {
          return 1859794438LL;
        }
      }

      return v86;
    case 9u:
    case 0xAu:
      uint64_t v16 = *((void *)v11 + 3);
      else {
        int64_t v17 = *(void *)(v16 + 40);
      }
      v66 = a5;
      v67 = (void **)&a5[v8];
      v68 = (void **)&a5[v11[5]];
      v69 = v68;
      v70 = &a5[v8];
      if ((v6 & 0x1000000) == 0) {
        goto LABEL_139;
      }
      v71 = (void **)calloc(1uLL, v17);
      if (!v71) {
        return 12LL;
      }
      BOOL v72 = v17 < 1 || v68 >= v67;
      LODWORD(v6) = (_DWORD)a5;
      v69 = v71;
      v70 = (char *)v71 + v17;
      *v68 = v71;
      LODWORD(v6) = *v121;
      v66 = (char *)v71;
LABEL_139:
      uint64_t v74 = *((void *)v11 + 3);
      LODWORD(v6) = v6 >> 28;
      if ((_DWORD)v6 == 1)
      {
        uint64_t result = __gen2_asn1_decode(v74, a2, v12);
        if ((_DWORD)result)
        {
LABEL_144:
          LODWORD(v6) = *((unsigned __int8 *)v11 + 19);
          if ((v6 & 1) != 0)
          {
            if (v68 < v67)
            {
              LODWORD(v6) = (_DWORD)a5;
              if (v68 >= (void **)a5)
              {
                free(*v68);
                *v68 = 0LL;
                goto LABEL_182;
              }
            }

            goto LABEL_241;
          }

          return result;
        }
      }

      else
      {
        unint64_t v6 = *(void *)(v74 + 8);
        uint64_t result = ((uint64_t (*)(unsigned __int8 *, size_t, void **, void *))v6)(v12, v13, v69, v128);
        if ((_DWORD)result) {
          goto LABEL_144;
        }
      }

      uint64_t v75 = v128[0];
      v76 = &v12[v13];
      goto LABEL_177;
    case 0xBu:
      uint64_t result = (uint64_t)__gen2_der_match_tag_and_length( (char *)v12,  v13,  (v6 >> 22) & 3,  &v127,  v6 & 0x1FFFFF,  &v126,  &v125);
      if ((_DWORD)result)
      {
        if ((*v121 & 0x1000000) != 0) {
          goto LABEL_182;
        }
        return result;
      }

      v77 = &v12[v13];
      LODWORD(v6) = v125;
      v78 = &v12[v125];
      if (&v12[v125] > &v12[v13]) {
        goto LABEL_241;
      }
      if (v12 > v78) {
        goto LABEL_241;
      }
      unint64_t v79 = v13 - v125;
      unint64_t v80 = v77 - v78;
      if (v13 - v125 > v77 - v78) {
        goto LABEL_241;
      }
      LODWORD(v6) = *v121;
      uint64_t v81 = a2;
      if ((a2 & 2) != 0)
      {
        uint64_t v81 = a2;
        if (v127 != ((v6 >> 21) & 1))
        {
          unint64_t v82 = *((void *)v11 + 3);
          v83 = (_DWORD *)(v82 + 16);
          uint64_t v81 = ((*v83 & 0xF0000FFF) == 1073741831) | a2;
        }
      }

      unint64_t v84 = v126;
      if (v126 != 3705724653)
      {
        unint64_t v85 = v126;
        if (v126 <= v79) {
          goto LABEL_186;
        }
        return 1859794437LL;
      }

      if ((a2 & 2) == 0) {
        return 1859794449LL;
      }
      unint64_t v85 = v79 - 2;
      if (v79 < 2) {
        return 1859794437LL;
      }
      uint64_t v81 = v81 | 4;
      unint64_t v126 = v79 - 2;
LABEL_186:
      v91 = &a5[v8];
      uint64_t v92 = v11[5];
      v93 = &a5[v92];
      if (&a5[v8] < &a5[v92] || v93 < a5) {
        goto LABEL_241;
      }
      size_t v94 = v8 - v92;
      if ((v6 & 0x1000000) != 0)
      {
        v110 = &v12[v125];
        int64_t v95 = v77 - v78;
        uint64_t v96 = v8;
        uint64_t v97 = v81;
        unint64_t v98 = v84;
        v99 = v77;
        unint64_t v100 = v79;
        size_t v94 = *(unsigned int *)(*((void *)v11 + 3) + 4LL);
        v101 = (char *)calloc(1uLL, v94);
        if (!v101) {
          return 12LL;
        }
        unint64_t v80 = v95;
        v78 = v110;
        if (!(_DWORD)v94 || v93 >= v91) {
          goto LABEL_241;
        }
        unint64_t v79 = v100;
        v77 = v99;
        unint64_t v84 = v98;
        uint64_t v81 = v97;
        uint64_t v8 = v96;
        *(void *)v93 = v101;
        unint64_t v85 = v126;
        v93 = v101;
      }

      if (v85 > v80 || !v94 && v93) {
        goto LABEL_241;
      }
      unint64_t v102 = v79;
      uint64_t result = __gen2_asn1_decode(*((void *)v11 + 3), v81, v78);
      if (!(_DWORD)result)
      {
        LODWORD(v6) = v128[0];
        if (v84 == 3705724653)
        {
          unint64_t v126 = v128[0];
        }

        else if (v128[0] != v126)
        {
          return 1859794442LL;
        }

        uint64_t v12 = &v78[v128[0]];
        if (v77 < &v78[v128[0]]) {
          goto LABEL_241;
        }
        if (v78 > v12) {
          goto LABEL_241;
        }
        size_t v13 = v102 - v128[0];
        if (v102 - v128[0] > v77 - &v78[v128[0]]) {
          goto LABEL_241;
        }
        if (v84 != 3705724653) {
          goto LABEL_182;
        }
        uint64_t result = (uint64_t)__gen2_der_match_tag_and_length( (char *)&v78[v128[0]],  v102 - v128[0],  0,  &v127,  0,  &v126,  &v125);
        if (!(_DWORD)result)
        {
          if (v127)
          {
            return 1859794438LL;
          }

          else
          {
            if (!v126)
            {
              uint64_t v75 = v125;
              unint64_t v6 = (unint64_t)&v12[v125];
              size_t v90 = v77 - &v12[v125];
              if (v77 < &v12[v125]) {
                goto LABEL_241;
              }
LABEL_179:
              if ((unint64_t)v12 <= v6)
              {
                v13 -= v75;
                if (v13 <= v90)
                {
                  uint64_t v12 = (unsigned __int8 *)v6;
                  goto LABEL_182;
                }
              }

              goto LABEL_241;
            }

            return 1859794450LL;
          }
        }
      }

      return result;
    case 0xCu:
      LODWORD(v6) = (v11[4] & 0xFFF) + v111;
      unint64_t v6 = (unint64_t)asn1_template_prim[6 * v6 + 1];
      v47 = &a5[v11[5]];
      if (v47)
      {
        if (v47 >= &a5[v8] || v47 < a5) {
          goto LABEL_241;
        }
      }

      uint64_t result = ((uint64_t (*)(unsigned __int8 *, size_t))v6)(v12, v13);
      if ((_DWORD)result) {
        return result;
      }
      goto LABEL_176;
    case 0xDu:
    case 0xEu:
      LODWORD(v6) = (_DWORD)a5;
      if (!v13) {
        goto LABEL_51;
      }
      uint64_t v18 = 0LL;
      unsigned int v19 = &a5[v11[5]];
      size_t v20 = *(unsigned int *)(*((void *)v11 + 3) + 4LL);
      BOOL v22 = v19 >= a5 && (unint64_t)(v19 + 16) <= v116;
      while (1)
      {
        LODWORD(v6) = a2;
        if ((a2 & 4) != 0
          && !__gen2_der_match_tag_and_length((char *)v12, v13, 0, &v127, 0, &v126, &v125))
        {
          goto LABEL_51;
        }

        if (__CFADD__(v20, v18)) {
          return 1859794436LL;
        }
        if (!v22) {
          goto LABEL_241;
        }
        unint64_t v23 = (char *)realloc(*((void **)v19 + 1), v20 + v18);
        if (!v23) {
          return 12LL;
        }
        uint64_t v24 = v23;
        unsigned int v25 = &v23[v20 + v18];
        int v26 = &v23[v18];
        LODWORD(v6) = v20;
        if (&v23[v18] > v25 || v23 > v26) {
          goto LABEL_241;
        }
        bzero(&v23[v18], v20);
        if (v24 >= v25) {
          goto LABEL_241;
        }
        *((void *)v19 + 1) = v24;
        LODWORD(v6) = *(_DWORD *)v19 + 1;
        *(_DWORD *)unsigned int v19 = v6;
        if (v26 >= v25) {
          goto LABEL_241;
        }
        uint64_t result = __gen2_asn1_decode(*((void *)v11 + 3), v118, v12);
        if ((_DWORD)result) {
          return result;
        }
        unint64_t v6 = (unint64_t)&v12[v128[0]];
        size_t v30 = v13 - v128[0];
        if (&v12[v13] < &v12[v128[0]]) {
          goto LABEL_241;
        }
        v13 -= v128[0];
        if (v13 > v30) {
          goto LABEL_241;
        }
        v18 += v20;
        v12 += v128[0];
        if (!v13)
        {
          uint64_t v12 = (unsigned __int8 *)v6;
LABEL_51:
          uint64_t v8 = 16LL;
LABEL_182:
          LODWORD(v6) = v122 - 2;
          if (v122 - 2 <= (uint64_t)(16 * v123 - 16) >> 4)
          {
            uint64_t v11 = v121;
            unint64_t v122 = v123;
            unint64_t v6 = v123 - 1;
            if (v123 == 1) {
              goto LABEL_209;
            }
            goto LABEL_18;
          }

LABEL_241:
          __break(0x5519u);
LABEL_242:
          asn1_abort("unknown opcode: %d", v6 & 0xF0000000);
        }
      }

    case 0xFu:
      unint64_t v48 = *((void *)v11 + 3);
      uint64_t v49 = *(void *)(v48 + 8);
      unint64_t v50 = v48 + 16;
      unint64_t v51 = v48 + 16 + 16 * v49;
      if (v48 + 16 > v51) {
        goto LABEL_241;
      }
      size_t v52 = *(unsigned int *)(v48 + 4);
      if (v8 < v52) {
        goto LABEL_241;
      }
      bzero(a5, v52);
      if (!v13) {
        return 1859794437LL;
      }
      ++v12;
      uint64_t v53 = v13 - 1;
      if (v49) {
        BOOL v54 = v13 == 1;
      }
      else {
        BOOL v54 = 1;
      }
      if (v54) {
        goto LABEL_126;
      }
      unint64_t v6 = 0LL;
      if (a5) {
        BOOL v55 = v8 < 1;
      }
      else {
        BOOL v55 = 0;
      }
      char v56 = v55;
      do
      {
        if (v48 > v50 || v50 + 16 > v51) {
          goto LABEL_241;
        }
        unint64_t v57 = *(unsigned int *)(v50 + 4);
        BOOL v58 = v53 == 0;
        if (v57 >> 3 > v6 >> 3 && v53 != 0)
        {
          v60 = &v12[v53];
          uint64_t v61 = v53;
          while (1)
          {
            v62 = v12++;
            if (v12 > v60 || v62 > v12) {
              goto LABEL_241;
            }
            uint64_t v53 = v61 - 1;
            v6 += 8LL;
            BOOL v58 = v61 == 1;
            if (v57 >> 3 > v6 >> 3)
            {
              if (--v61) {
                continue;
              }
            }

            break;
          }
        }

        if (v58) {
          goto LABEL_126;
        }
        if (v12) {
          BOOL v64 = v53 < 1;
        }
        else {
          BOOL v64 = 0;
        }
        if (v64) {
          char v65 = 1;
        }
        else {
          char v65 = v56;
        }
        if ((v65 & 1) != 0) {
          goto LABEL_241;
        }
        if (((*v12 >> (~(_BYTE)v57 & 7)) & 1) != 0) {
          *(_DWORD *)a5 |= 1 << v57;
        }
        v50 += 16LL;
        --v49;
      }

      while (v49);
      if ((v53 & 0x8000000000000000LL) == 0)
      {
LABEL_126:
        size_t v13 = 0LL;
        goto LABEL_182;
      }

      goto LABEL_241;
    default:
      goto LABEL_242;
  }
}

uint64_t __gen2_asn1_encode(unint64_t a1, _BYTE *a2, size_t a3, char *a4, void *a5)
{
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = a1 + 16 * (v5 + 1);
  size_t v7 = a3 - 1;
  if (!a3) {
    size_t v7 = 0LL;
  }
  uint64_t v8 = *(unsigned int *)(a1 + 4);
  unint64_t v113 = (unint64_t)&a2[-v7];
  unint64_t v114 = (unint64_t)&a2[a3 - v7];
  BOOL v10 = &a4[v8] >= a4 && &a2[-v7] <= &a2[a3 - v7] && v6 >= a1;
  unint64_t v109 = a1 + 16 * (v5 + 1);
  if (a1 + 16 > v6) {
    goto LABEL_238;
  }
  size_t v12 = a3;
  unint64_t v13 = a1;
  if (!v5) {
    goto LABEL_223;
  }
  unint64_t v14 = a2;
  uint64_t v15 = *(void *)(a1 + 8);
  uint64_t v16 = 0LL;
  unint64_t v17 = a1 + 16 * v5;
  unint64_t v106 = (unint64_t)(a4 + 16);
  size_t v12 = a3;
LABEL_16:
  uint64_t v111 = v15;
  if (v17 < v13 || v17 + 16 > v109) {
    goto LABEL_238;
  }
  int v18 = *(_DWORD *)v17;
  int v19 = *(_DWORD *)v17 >> 28;
  switch(v19 ^ 8)
  {
    case 0:
      uint64_t v24 = *(unsigned int **)(v17 + 8);
      uint64_t v25 = *((void *)v24 + 1);
      unint64_t v26 = (unint64_t)&v24[4 * v25 + 4];
      int v27 = &a4[v8];
      unint64_t v6 = (unint64_t)&a4[v24[1]];
      LODWORD(v6) = *(_DWORD *)v6;
      if ((_DWORD)v6) {
        BOOL v29 = (int)v6 <= (int)v25;
      }
      else {
        BOOL v29 = 0;
      }
      if (!v29) {
        goto LABEL_239;
      }
      if ((_DWORD)v6 == -1)
      {
        unint64_t v91 = (unint64_t)&a4[*v24];
        uint64_t v16 = __gen2_der_put_octet_string((unint64_t)v14, v12, v91, &v116) + v16;
      }

      else
      {
        size_t v30 = &v24[4 * (int)v6];
        unint64_t v6 = (unint64_t)(v30 + 4);
        if (v24 > v30 || v6 > v26) {
          goto LABEL_238;
        }
        unint64_t v32 = &a4[v30[1]];
        if (v32)
        {
          if (v32 >= v27 || v32 < a4) {
            goto LABEL_238;
          }
        }

        uint64_t result = __gen2_asn1_encode(*((void *)v30 + 1), v14);
        if ((_DWORD)result) {
          return result;
        }
        uint64_t v16 = 0LL;
      }

      size_t v75 = v116;
      BOOL v10 = v12 >= v116;
      v12 -= v116;
      if (!v10) {
        goto LABEL_238;
      }
      goto LABEL_198;
    case 9:
    case 0xA:
      LODWORD(v6) = (_DWORD)a4;
      size_t v20 = &a4[v8];
      int v21 = &a4[*(unsigned int *)(v17 + 4)];
      uint64_t v22 = *(void *)(v17 + 8);
      if ((v18 & 0x1000000) != 0)
      {
        if (v21 >= v20 || v21 < a4) {
          goto LABEL_238;
        }
        int v21 = *(char **)v21;
        if (!v21) {
          goto LABEL_222;
        }
        size_t v20 = &v21[*(unsigned int *)(v22 + 4)];
        unint64_t v23 = v21;
      }

      else
      {
        unint64_t v23 = a4;
      }

      if (v19 == 1)
      {
        if (v21 && (v21 >= v20 || v21 < v23)) {
          goto LABEL_238;
        }
        uint64_t result = __gen2_asn1_encode(v22, v14);
        if ((_DWORD)result) {
          return result;
        }
      }

      else
      {
        if (v21 && (v21 >= v20 || v21 < v23)) {
          goto LABEL_238;
        }
        uint64_t result = (*(uint64_t (**)(_BYTE *, size_t, char *, size_t *))v22)(v14, v12, v21, &v116);
        if ((_DWORD)result) {
          return result;
        }
      }

      goto LABEL_136;
    case 0xB:
      uint64_t v35 = *(unsigned int *)(v17 + 4);
      v36 = &a4[v35];
      unint64_t v37 = v8 - v35;
      if (&a4[v8] < &a4[v35]) {
        goto LABEL_238;
      }
      LODWORD(v6) = (_DWORD)a4;
      if (v36 < a4) {
        goto LABEL_238;
      }
      unint64_t v38 = v8 - v35;
      if (v38 > v37) {
        goto LABEL_238;
      }
      if ((v18 & 0x1000000) != 0)
      {
        if (v36 >= &a4[v8]) {
          goto LABEL_238;
        }
        v36 = *(char **)v36;
        if (!v36) {
          goto LABEL_222;
        }
        uint64_t v39 = *(void *)(v17 + 8);
        unint64_t v38 = *(unsigned int *)(v39 + 4);
        if (v36 > &v36[v38]) {
          goto LABEL_238;
        }
      }

      else
      {
        uint64_t v39 = *(void *)(v17 + 8);
      }

      if (v38 || !v36)
      {
        uint64_t result = __gen2_asn1_encode(v39, v14);
        if ((_DWORD)result) {
          return result;
        }
        BOOL v10 = v12 >= v115;
        v12 -= v115;
        if (v10)
        {
          v14 -= v115;
          uint64_t result = (uint64_t)__gen2_der_put_length_and_tag( v14,  v12,  v115,  (*(_DWORD *)v17 >> 22) & 3,  (*(_DWORD *)v17 & 0x200000) != 0,  *(_DWORD *)v17 & 0x1FFFFF,  &v116);
          if ((_DWORD)result) {
            return result;
          }
LABEL_136:
          size_t v75 = v116;
          BOOL v10 = v12 >= v116;
          v12 -= v116;
          if (v10)
          {
            uint64_t v16 = 0LL;
LABEL_198:
            v14 -= v75;
            goto LABEL_222;
          }
        }
      }

      goto LABEL_238;
    case 0xC:
      if ((*(_DWORD *)v17 & 0xFFFu) >= 0x15) {
        asn1_abort("type larger then asn1_template_prim: %d", *(_DWORD *)v17 & 0xFFF);
      }
      v40 = &a4[*(unsigned int *)(v17 + 4)];
      if (v40 && (v40 >= &a4[v8] || v40 < a4)) {
        goto LABEL_238;
      }
      uint64_t result = ((uint64_t (*)(_BYTE *, size_t))asn1_template_prim[6 * (v18 & 0xFFF)])(v14, v12);
      if ((_DWORD)result) {
        return result;
      }
      goto LABEL_136;
    case 0xD:
      uint64_t v41 = *(unsigned int *)(v17 + 4);
      v42 = &a4[v41];
      unsigned int v43 = *(_DWORD *)v42;
      if (!*(_DWORD *)v42) {
        goto LABEL_221;
      }
      int v44 = 0;
      uint64_t v45 = *(unsigned int *)(*(void *)(v17 + 8) + 4LL);
      unint64_t v46 = *((void *)v42 + 1);
      unint64_t v47 = v46 + v43 * (unint64_t)v45;
      unint64_t v48 = v46 + v45 * (unint64_t)(v43 - 1);
      uint64_t v49 = -v45;
      while (!v48 || v48 < v47 && v48 >= v46)
      {
        uint64_t result = __gen2_asn1_encode(*(void *)(v17 + 8), v14);
        if ((_DWORD)result) {
          return result;
        }
        BOOL v10 = v12 >= v116;
        v12 -= v116;
        if (!v10) {
          break;
        }
        v14 -= v116;
        v48 += v49;
      }

      goto LABEL_238;
    case 0xE:
      unint64_t v107 = &a4[*(unsigned int *)(v17 + 4)];
      unint64_t v50 = &a4[*(unsigned int *)(v17 + 4)];
      size_t v51 = *(unsigned int *)v107;
      if (!(_DWORD)v51) {
        goto LABEL_221;
      }
      uint64_t v103 = *(unsigned int *)(*(void *)(v17 + 8) + 4LL);
      v105 = (char *)*((void *)v107 + 1);
      size_t v52 = (void **)calloc(v51, 0x10uLL);
      if (v52) {
        uint64_t v53 = &v52[2 * v51];
      }
      else {
        uint64_t v53 = 0LL;
      }
      if (!v52) {
        return 12LL;
      }
      BOOL v54 = v52;
      if (!*(_DWORD *)v107)
      {
        size_t v56 = 0LL;
        BOOL v69 = 0;
        goto LABEL_203;
      }

      unint64_t v55 = 0LL;
      size_t v56 = 0LL;
      unint64_t v104 = (unint64_t)&v105[v51 * (unint64_t)v103];
      unint64_t v57 = v52;
      BOOL v58 = v105;
      while (1)
      {
        size_t v59 = __gen2_asn1_length(*(void *)(v17 + 8), v58);
        if (v59)
        {
          size_t v60 = v59;
          uint64_t v61 = (char *)malloc(v59);
          v62 = &v61[v60];
          if (!v61) {
            v62 = 0LL;
          }
          BOOL v10 = v62 >= v61;
          size_t v63 = v62 - v61;
          if (!v10 || v60 > v63 || v57 >= v53 || v57 < v54) {
            goto LABEL_238;
          }
          *unint64_t v57 = (void *)v60;
          v57[1] = v61;
          if (!v61) {
            break;
          }
        }

        uint64_t v67 = __gen2_asn1_encode(*(void *)(v17 + 8), (char *)*v57 + (void)v57[1] - 1);
        if ((_DWORD)v67)
        {
          uint64_t v16 = v67;
          goto LABEL_230;
        }

        if (&v58[v103] < v58)
        {
          uint64_t v16 = 1859794436LL;
          goto LABEL_230;
        }

        v68 = *v57;
        v57 += 2;
        v56 += (size_t)v68;
        ++v55;
        unint64_t v50 = v107;
        v58 += v103;
        if (v55 >= *(unsigned int *)v107)
        {
          BOOL v69 = v56 > v12;
          if (v56 <= v12) {
            uint64_t v16 = 0LL;
          }
          else {
            uint64_t v16 = 1859794436LL;
          }
LABEL_203:
          if ((_DWORD)v16) {
            goto LABEL_231;
          }
          if (v69) {
            goto LABEL_238;
          }
          v12 -= v56;
          qsort( v54,  *(unsigned int *)v107,  0x10uLL,  (int (__cdecl *)(const void *, const void *))__gen2_heim_der_set_sort);
          uint64_t v92 = 2LL * (*(_DWORD *)v107 - 1);
          do
          {
            v93 = (const void **)&v54[v92];
            size_t v95 = (size_t)*v93;
            v14 -= (unint64_t)*v93;
            uint64_t v96 = v14 + 1;
            BOOL v97 = v114 >= (unint64_t)(v14 + 1) && (unint64_t)v96 >= v113;
            memcpy(v96, v93[1], v95);
            free((void *)v93[1]);
            v92 -= 2LL;
          }

          while (v92 != -2);
          free(v54);
LABEL_220:
          uint64_t v16 = 0LL;
LABEL_221:
          uint64_t v8 = 16LL;
LABEL_222:
          unint64_t v13 = a1;
          v17 -= 16LL;
          uint64_t v15 = v111 - 1;
          if (v111 == 1)
          {
LABEL_223:
            uint64_t result = 0LL;
            if (a5) {
              *a5 = a3 - v12;
            }
            return result;
          }

          goto LABEL_16;
        }
      }

      uint64_t v16 = 12LL;
LABEL_230:
      unint64_t v50 = v107;
LABEL_231:
      if (*(_DWORD *)v50)
      {
        unint64_t v99 = 0LL;
        unint64_t v100 = v54 + 1;
        do
        {
          v101 = *v100;
          v100 += 2;
          free(v101);
          ++v99;
        }

        while (v99 < *(unsigned int *)v50);
      }

      free(v54);
      return v16;
    case 0xF:
      v70 = *(int **)(v17 + 8);
      uint64_t v71 = *((void *)v70 + 1);
      unint64_t v6 = (unint64_t)&v70[4 * v71 + 4];
      int v72 = *v70;
      unint64_t v73 = (unint64_t)&v70[4 * v71];
      if ((*v70 & 1) != 0)
      {
        unint64_t v74 = 31LL;
      }

      else
      {
        unint64_t v74 = v70[4 * v71 + 1];
      }

      if (v71) {
        BOOL v77 = v12 == 0;
      }
      else {
        BOOL v77 = 1;
      }
      if (!v77)
      {
        int v79 = 0;
        int v78 = 0;
        if (a4) {
          BOOL v83 = v8 <= 0;
        }
        else {
          BOOL v83 = 0;
        }
        int v84 = !v83;
        while ((unint64_t)v70 <= v73 && v73 + 16 <= v6)
        {
          for (unint64_t i = *(unsigned int *)(v73 + 4); v74 >> 3 > i >> 3; unint64_t i = *(unsigned int *)(v73 + 4))
          {
            if (v78) {
              BOOL v86 = 1;
            }
            else {
              BOOL v86 = (v72 & 1 | v79) != 0;
            }
            if (v86)
            {
              if (!v12) {
                return 1859794436LL;
              }
              *v14-- = v78;
              --v12;
            }

            int v78 = 0;
            v74 -= 8LL;
          }

          if (!v84) {
            break;
          }
          int v87 = *(_DWORD *)a4 >> i;
          int v88 = i & 7;
          int v89 = v78 | (1 << (v88 ^ 7));
          int v90 = 8 - v88;
          if (v79) {
            int v90 = v79;
          }
          if ((v87 & 1) != 0)
          {
            int v78 = v89;
            int v79 = v90;
          }

          if (--v71)
          {
            v73 -= 16LL;
            if (v12) {
              continue;
            }
          }

          goto LABEL_150;
        }

LABEL_238:
        __break(0x5519u);
LABEL_239:
        asn1_abort("invalid choice: %d", v6);
      }

      LOBYTE(v78) = 0;
      int v79 = 0;
LABEL_150:
      uint64_t result = 1859794436LL;
      if (v72 & 1 | v79)
      {
        if (!v12) {
          return result;
        }
        *v14-- = v78;
        --v12;
      }

      if (!v12) {
        return result;
      }
      BOOL v81 = (unint64_t)v14 < v114 && (unint64_t)v14 >= v113;
      if ((v72 & 1) != 0 || !v79)
      {
        if (!v81) {
          goto LABEL_238;
        }
        char v82 = 0;
      }

      else
      {
        if (!v81) {
          goto LABEL_238;
        }
        char v82 = v79 - 1;
      }

      *v14-- = v82;
      --v12;
      goto LABEL_222;
    default:
      asn1_abort("unknown opcode: %d", v18 & 0xF0000000);
  }

uint64_t __gen2_asn1_length(unint64_t a1, char *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  unint64_t v3 = a1 + 16 * (v2 + 1);
  uint64_t v4 = *(unsigned int *)(a1 + 4);
  LODWORD(v5) = (_DWORD)a2 + v4;
  BOOL v7 = &a2[v4] < a2 || v3 < a1 || v2 + 1 > (unint64_t)((16 * (v2 + 1)) >> 4);
  if (v7 || (unint64_t v51 = a1 + 16 * (v2 + 1), a1 + 16 > v3))
  {
LABEL_100:
    __break(0x5519u);
LABEL_101:
    asn1_abort("unknown opcode: %d", v5 & 0xF0000000);
  }

  if (v2)
  {
    uint64_t v9 = 0LL;
    unint64_t v50 = (unint64_t)(a2 + 16);
    unint64_t v10 = a1;
    unint64_t v11 = a1 + 16 * v2;
    while (1)
    {
      if (v11 < v10) {
        goto LABEL_100;
      }
      LODWORD(v5) = v51;
      if (v11 + 16 > v51) {
        goto LABEL_100;
      }
      LODWORD(v5) = *(_DWORD *)v11;
      int v12 = *(_DWORD *)v11 >> 28;
      switch(v12 ^ 8)
      {
        case 0:
          unint64_t v5 = *(void *)(v11 + 8);
          uint64_t v23 = *(void *)(v5 + 8);
          unint64_t v24 = v5 + 16 + 16 * v23;
          if (v5 + 16 > v24) {
            goto LABEL_100;
          }
          uint64_t v25 = &a2[v4];
          unint64_t v26 = (int *)&a2[*(unsigned int *)(v5 + 4)];
          int v28 = *v26;
          if (*v26) {
            BOOL v29 = v28 <= (int)v23;
          }
          else {
            BOOL v29 = 0;
          }
          if (!v29) {
            asn1_abort("invalid choice: %d", v28);
          }
          if (v28 == -1)
          {
            unint64_t v5 = *(unsigned int *)v5;
            unint64_t v48 = (unint64_t)&a2[v5];
            uint64_t v45 = __gen2_der_length_octet_string(v48);
          }

          else
          {
            size_t v30 = (unsigned int *)(v5 + 16LL * v28);
            uint64_t v15 = *((void *)v30 + 1);
            unint64_t v5 = v30[1];
            unint64_t v32 = &a2[v5];
            if (&a2[v5])
            {
              if (v32 >= v25 || v32 < a2) {
                goto LABEL_100;
              }
            }

LABEL_77:
            uint64_t v45 = __gen2_asn1_length(v15);
          }

          goto LABEL_83;
        case 9:
        case 0xA:
          unint64_t v13 = &a2[v4];
          unint64_t v14 = &a2[*(unsigned int *)(v11 + 4)];
          uint64_t v15 = *(void *)(v11 + 8);
          if ((v5 & 0x1000000) == 0)
          {
            unint64_t v5 = (unint64_t)a2;
            goto LABEL_73;
          }

          if (v14 >= v13 || v14 < a2) {
            goto LABEL_100;
          }
          unint64_t v14 = *(char **)v14;
          if (!v14) {
            goto LABEL_84;
          }
          unint64_t v13 = &v14[*(unsigned int *)(v15 + 4)];
          unint64_t v5 = (unint64_t)v14;
LABEL_73:
          if (v12 == 1)
          {
            goto LABEL_77;
          }

          uint64_t v39 = *(uint64_t (**)())(v15 + 16);
          v40 = v14;
LABEL_82:
          uint64_t v45 = ((uint64_t (*)(char *))v39)(v40);
LABEL_83:
          v9 += v45;
          goto LABEL_84;
        case 0xB:
          uint64_t v34 = *(unsigned int *)(v11 + 4);
          uint64_t v35 = &a2[v34];
          unint64_t v36 = v4 - v34;
          if (&a2[v4] < &a2[v34]) {
            goto LABEL_100;
          }
          if (v35 < a2) {
            goto LABEL_100;
          }
          unint64_t v37 = v4 - v34;
          if (v37 > v36) {
            goto LABEL_100;
          }
          if ((v5 & 0x1000000) != 0)
          {
            if (v35 >= &a2[v4]) {
              goto LABEL_100;
            }
            uint64_t v35 = *(char **)v35;
            if (!v35) {
              goto LABEL_84;
            }
            uint64_t v38 = *(void *)(v11 + 8);
            unint64_t v37 = *(unsigned int *)(v38 + 4);
            LODWORD(v5) = (_DWORD)v35 + v37;
            if (v35 > &v35[v37]) {
              goto LABEL_100;
            }
          }

          else
          {
            uint64_t v38 = *(void *)(v11 + 8);
          }

          if (!v37 && v35) {
            goto LABEL_100;
          }
          unint64_t v46 = __gen2_asn1_length(v38);
          uint64_t v47 = __gen2_der_length_tag(*(_DWORD *)v11 & 0x1FFFFF);
          v9 += v46 + v47 + __gen2_der_length_len(v46);
LABEL_84:
          unint64_t v10 = a1;
          v11 -= 16LL;
          if (!--v2) {
            return v9;
          }
          break;
        case 0xC:
          if ((*(_DWORD *)v11 & 0xFFFu) >= 0x15) {
            asn1_abort("type larger then asn1_template_prim: %d", *(_DWORD *)v11 & 0xFFF);
          }
          uint64_t v39 = asn1_template_prim[6 * (v5 & 0xFFF) + 2];
          v40 = &a2[*(unsigned int *)(v11 + 4)];
          if (v40)
          {
            LODWORD(v5) = (_DWORD)a2 + v4;
            if (v40 >= &a2[v4] || v40 < a2) {
              goto LABEL_100;
            }
          }

          goto LABEL_82;
        case 0xD:
        case 0xE:
          uint64_t v16 = *(unsigned int *)(v11 + 4);
          unint64_t v17 = &a2[v16];
          if (&a2[v16] < a2) {
            goto LABEL_100;
          }
          LODWORD(v5) = v50;
          if (!*(_DWORD *)v17) {
            goto LABEL_25;
          }
          unsigned int v18 = 0;
          unint64_t v5 = *(void *)(v11 + 8);
          uint64_t v19 = *(unsigned int *)(v5 + 4);
          unint64_t v20 = *((void *)v17 + 1);
          unint64_t v21 = v20 + v19 * (unint64_t)*(unsigned int *)v17;
          unint64_t v22 = v20;
          do
          {
            if (v22 && (v22 >= v21 || v22 < v20)) {
              goto LABEL_100;
            }
            v9 += __gen2_asn1_length(*(void *)(v11 + 8));
            v22 += v19;
            ++v18;
          }

          while (v18 < *(_DWORD *)v17);
LABEL_25:
          uint64_t v4 = 16LL;
          goto LABEL_84;
        case 0xF:
          unint64_t v41 = *(void *)(v11 + 8);
          unint64_t v5 = *(void *)(v41 + 8);
          unint64_t v42 = v41 + 16 + 16 * v5;
          if (v41 + 16 > v42) {
            goto LABEL_100;
          }
          if ((*(_BYTE *)v41 & 1) != 0)
          {
            v9 += 5LL;
          }

          else
          {
            ++v9;
            if (v5)
            {
              if (a2 && v4 < 1) {
                goto LABEL_100;
              }
              unint64_t v43 = v41 + 16 * v5;
              while (1)
              {
                if (v41 > v43 || v43 + 16 > v42) {
                  goto LABEL_100;
                }
                unint64_t v44 = *(unsigned int *)(v43 + 4);
                if (((*(_DWORD *)a2 >> v44) & 1) != 0) {
                  break;
                }
                v43 -= 16LL;
                if (!--v5) {
                  goto LABEL_84;
                }
              }

              v9 += (v44 >> 3) + 1;
            }
          }

          goto LABEL_84;
        default:
          goto LABEL_101;
      }
    }
  }

  return 0LL;
}

void __gen2_asn1_free(unint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  unint64_t v3 = v2 + 1;
  unint64_t v4 = a1 + 16 * (v2 + 1);
  uint64_t v5 = *(unsigned int *)(a1 + 4);
  unint64_t v8 = a1;
  unint64_t v9 = a1 + 16;
  unint64_t v39 = a1 + 16 * (v2 + 1);
  if (a1 + 16 > v4) {
    goto LABEL_100;
  }
  if ((*(_BYTE *)a1 & 1) != 0)
  {
    if (a2 && !(_DWORD)v5) {
      goto LABEL_100;
    }
    __gen2_der_free_octet_string(a2);
  }

  if (v9 < v8 || v2 > (uint64_t)(16 * v3 - 16) >> 4)
  {
LABEL_100:
    __break(0x5519u);
LABEL_101:
    asn1_abort("unknown opcode: %d", v4 & 0xF0000000);
  }

  if (v2)
  {
    unint64_t v38 = a2 + 16;
    while (1)
    {
      if (v8 + 32 > v39) {
        goto LABEL_100;
      }
      LODWORD(v4) = *(_DWORD *)(v8 + 16);
      unsigned int v10 = v4 >> 28;
      switch((v4 >> 28) ^ 8)
      {
        case 0u:
          unint64_t v21 = *(unsigned int **)(v8 + 24);
          uint64_t v22 = *((void *)v21 + 1);
          unint64_t v4 = (unint64_t)&v21[4 * v22 + 4];
          unint64_t v23 = a2 + v5;
          unint64_t v24 = (int *)(a2 + v21[1]);
          uint64_t v26 = *v24;
          if (!(_DWORD)v26) {
            goto LABEL_92;
          }
          if ((_DWORD)v26 == -1)
          {
            LODWORD(v4) = a2;
            unint64_t v37 = a2 + *v21;
            if (v37 && (v37 >= v23 || v37 < a2)) {
              goto LABEL_100;
            }
            __gen2_der_free_octet_string(v37);
          }

          else
          {
            int v27 = &v21[4 * v26];
            LODWORD(v4) = a2;
            unint64_t v29 = a2 + v27[1];
            if (v29)
            {
              if (v29 >= v23 || v29 < a2) {
                goto LABEL_100;
              }
            }

            __gen2_asn1_free(*((void *)v27 + 1), v29);
          }

          goto LABEL_92;
        case 9u:
        case 0xAu:
          unint64_t v11 = (char *)(a2 + v5);
          int v12 = (char *)(a2 + *(unsigned int *)(v8 + 20));
          uint64_t v13 = *(void *)(v8 + 24);
          if ((v4 & 0x1000000) != 0)
          {
            int v12 = *(char **)v12;
            if (!v12) {
              goto LABEL_92;
            }
            unint64_t v11 = &v12[*(unsigned int *)(v13 + 4)];
            unint64_t v4 = (unint64_t)v12;
          }

          else
          {
            unint64_t v4 = a2;
          }

          if (v10 == 1)
          {
            goto LABEL_89;
          }

          (*(void (**)(char *))(v13 + 32))(v12);
          goto LABEL_90;
        case 0xBu:
          unint64_t v31 = a2 + v5;
          int v12 = (char *)(a2 + *(unsigned int *)(v8 + 20));
          uint64_t v13 = *(void *)(v8 + 24);
          if ((v4 & 0x1000000) == 0)
          {
            unint64_t v32 = (char *)a2;
            if (v12) {
              goto LABEL_87;
            }
            goto LABEL_89;
          }

          unint64_t v32 = *(char **)v12;
          if (*(void *)v12)
          {
            unint64_t v31 = (unint64_t)&v32[*(unsigned int *)(v13 + 4)];
            int v12 = *(char **)v12;
LABEL_87:
LABEL_89:
            __gen2_asn1_free(v13, v12);
LABEL_90:
            if ((*(_BYTE *)(v8 + 19) & 1) != 0) {
              free(v12);
            }
          }

LABEL_92:
          v8 += 16LL;
          unint64_t v3 = v2--;
          if (!v2) {
            return;
          }
          break;
        case 0xCu:
          if ((*(_DWORD *)(v8 + 16) & 0xFFFu) >= 0x15) {
            asn1_abort("type larger then asn1_template_prim: %d", *(_DWORD *)(v8 + 16) & 0xFFF);
          }
          uint64_t v33 = (void (*)(void))asn1_template_prim[6 * (v4 & 0xFFF) + 4];
          LODWORD(v4) = a2;
          unint64_t v34 = a2 + *(unsigned int *)(v8 + 20);
          if (v34 && (v34 >= a2 + v5 || v34 < a2)) {
            goto LABEL_100;
          }
          v33();
          goto LABEL_92;
        case 0xDu:
        case 0xEu:
          if (v38 < a2) {
            goto LABEL_100;
          }
          unint64_t v14 = (unsigned int *)(a2 + *(unsigned int *)(v8 + 20));
          if (!*v14) {
            goto LABEL_35;
          }
          LODWORD(v4) = a2 + 16;
          unsigned int v16 = 0;
          uint64_t v17 = *(unsigned int *)(*(void *)(v8 + 24) + 4LL);
          unint64_t v18 = *((void *)v14 + 1);
          unint64_t v19 = v18 + *v14 * (unint64_t)v17;
          unint64_t v20 = v18;
          do
          {
            if (v20 && (v20 >= v19 || v20 < v18)) {
              goto LABEL_100;
            }
            __gen2_asn1_free(*(void *)(v8 + 24), v20);
            v20 += v17;
            ++v16;
          }

          while (v16 < *v14);
          free(*((void **)v14 + 1));
          *((void *)v14 + 1) = 0LL;
          *unint64_t v14 = 0;
LABEL_35:
          uint64_t v5 = 16LL;
          goto LABEL_92;
        case 0xFu:
          goto LABEL_92;
        default:
          goto LABEL_101;
      }
    }
  }

uint64_t __gen2_asn1_copy(unint64_t a1, unint64_t a2, size_t *a3)
{
  unint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = v3 + 1;
  unint64_t v5 = a1 + 16 * (v3 + 1);
  unint64_t v6 = *(unsigned int *)(a1 + 4);
  *(void *)&__int128 v80 = a2;
  *((void *)&v80 + 1) = a3;
  BOOL v7 = (size_t *)((char *)a3 + v6) >= a3 && a2 + v6 >= a2;
  unint64_t v10 = a1;
  if (a1 + 16 > v5) {
    goto LABEL_168;
  }
  if (a1 + 16 < a1) {
    goto LABEL_168;
  }
  unint64_t v5 = 16 * v4 - 16;
  if ((*(_DWORD *)a1 & 1) != 0)
  {
    LODWORD(v5) = a2 | a3;
    if (v80 != 0 && !(_DWORD)v6) {
      goto LABEL_168;
    }
    unint64_t v11 = __gen2_der_copy_octet_string(a2, a3);
    if ((_DWORD)v11) {
      return v11;
    }
  }

  if (!v3) {
    return 0LL;
  }
  unint64_t v77 = *((void *)&v80 + 1) + 16LL;
  BOOL v13 = (uint64_t)v80 + 16 < (unint64_t)v80
     || (unint64_t)(*((void *)&v80 + 1) + 16LL) < *((void *)&v80 + 1);
  BOOL v78 = v13;
  unint64_t v79 = v10 + 16 * v3 + 16;
  while (2)
  {
    LODWORD(v5) = v10 + 32;
    if (v10 + 32 > v79) {
      goto LABEL_168;
    }
    LODWORD(v5) = *(_DWORD *)(v10 + 16);
    switch((v5 >> 28) ^ 8)
    {
      case 0u:
        unint64_t v34 = *(unsigned int **)(v10 + 24);
        unint64_t v5 = *((void *)v34 + 1);
        unint64_t v35 = (unint64_t)&v34[4 * v5 + 4];
        uint64_t v36 = v34[1];
        unint64_t v37 = v80 + v6;
        unint64_t v38 = (int *)(v80 + v36);
        int v40 = *v38;
        if (*v38) {
          BOOL v41 = v40 <= (int)v5;
        }
        else {
          BOOL v41 = 0;
        }
        if (!v41) {
          return 1859794451LL;
        }
        unint64_t v5 = *((void *)&v80 + 1) + v6;
        unint64_t v42 = (int *)(*((void *)&v80 + 1) + v36);
        int *v42 = v40;
        uint64_t v43 = *v38;
        if ((_DWORD)v43 == -1)
        {
          uint64_t v73 = *v34;
          unint64_t v74 = v80 + v73;
          size_t v75 = (size_t *)(*((void *)&v80 + 1) + v73);
          if (*((void *)&v80 + 1) + v73)
          {
            LODWORD(v5) = DWORD2(v80);
          }

          unint64_t v51 = __gen2_der_copy_octet_string(v74, v75);
        }

        else
        {
          unint64_t v44 = &v34[4 * v43];
          uint64_t v46 = v44[1];
          unint64_t v47 = v80 + v46;
          if ((void)v80 + v46)
          {
          }

          unint64_t v49 = *((void *)&v80 + 1) + v46;
          if (*((void *)&v80 + 1) + v46)
          {
            BOOL v7 = v49 >= v5;
            LODWORD(v5) = DWORD2(v80);
            if (v7 || v49 < *((void *)&v80 + 1)) {
              goto LABEL_168;
            }
          }

          unint64_t v51 = __gen2_asn1_copy(*((void *)v44 + 1), v47, v49);
        }

        unint64_t v11 = v51;
        if ((_DWORD)v51) {
          return v11;
        }
        goto LABEL_156;
      case 9u:
      case 0xAu:
        uint64_t v14 = *(void *)(v10 + 24);
        else {
          int64_t v15 = *(void *)(v14 + 40);
        }
        size_t v60 = (char *)*((void *)&v80 + 1);
        uint64_t v61 = (char *)v80;
        uint64_t v62 = *(unsigned int *)(v10 + 20);
        size_t v63 = (char *)(v80 + v6);
        BOOL v64 = (char *)(v80 + v62);
        unint64_t v65 = *((void *)&v80 + 1) + v6;
        BOOL v58 = (void **)(*((void *)&v80 + 1) + v62);
        if ((v5 & 0x1000000) != 0)
        {
          if (v64 >= v63) {
            goto LABEL_168;
          }
          LODWORD(v5) = v80;
          BOOL v64 = *(char **)v64;
          if (!v64) {
            goto LABEL_156;
          }
          v68 = (char *)calloc(1uLL, v15);
          if (!v68) {
            return 12LL;
          }
          if (v15 < 1) {
            goto LABEL_168;
          }
          LODWORD(v5) = DWORD2(v80);
          v66 = v68;
          size_t v63 = &v64[v15];
          uint64_t v67 = &v68[v15];
          *BOOL v58 = v68;
          LODWORD(v5) = *(_DWORD *)(v10 + 16);
          size_t v60 = v68;
          uint64_t v61 = v64;
        }

        else
        {
          v66 = (char *)(*((void *)&v80 + 1) + v62);
          uint64_t v67 = (char *)(*((void *)&v80 + 1) + v6);
        }

        uint64_t v69 = *(void *)(v10 + 24);
        LODWORD(v5) = v5 >> 28;
        if ((_DWORD)v5 == 1)
        {
          if (v64 && (v64 >= v63 || v64 < v61) || v66 && (v66 >= v67 || v66 < v60)) {
            goto LABEL_168;
          }
          uint64_t v70 = __gen2_asn1_copy(v69, v64, v66);
        }

        else
        {
          unint64_t v5 = *(void *)(v69 + 24);
          if (v64 && (v64 >= v63 || v64 < v61) || v66 && (v66 >= v67 || v66 < v60)) {
            goto LABEL_168;
          }
          uint64_t v70 = ((uint64_t (*)(char *, char *))v5)(v64, v66);
        }

        unint64_t v11 = v70;
        if ((_DWORD)v70)
        {
          LODWORD(v5) = *(unsigned __int8 *)(v10 + 19);
          if ((v5 & 1) == 0) {
            return v11;
          }
          if ((unint64_t)v58 < v65)
          {
            LODWORD(v5) = DWORD2(v80);
            if ((unint64_t)v58 >= *((void *)&v80 + 1))
            {
LABEL_165:
              free(*v58);
              *BOOL v58 = 0LL;
              return v11;
            }
          }

LABEL_168:
          __break(0x5519u);
LABEL_169:
          asn1_abort("unknown opcode: %d", v5 & 0xF0000000);
        }

        goto LABEL_156;
      case 0xBu:
        uint64_t v52 = *(unsigned int *)(v10 + 20);
        uint64_t v53 = (void **)(*((void *)&v80 + 1) + v52);
        unint64_t v54 = v80 + v6;
        unint64_t v55 = v80 + v52;
        size_t v56 = v6 - v52;
        if (v6 - v52 > v54 - v55) {
          goto LABEL_168;
        }
        unint64_t v57 = *((void *)&v80 + 1) + v6;
        if ((v5 & 0x1000000) != 0)
        {
          if (v55 >= v54) {
            goto LABEL_168;
          }
          if (!*(void *)v55) {
            goto LABEL_156;
          }
          size_t v56 = *(unsigned int *)(*(void *)(v10 + 24) + 4LL);
          uint64_t v71 = calloc(1uLL, v56);
          if (!v71) {
            return 12LL;
          }
          if (!(_DWORD)v56) {
            goto LABEL_168;
          }
          *uint64_t v53 = v71;
          unint64_t v55 = *(void *)v55;
          LODWORD(v5) = v55 + v56;
          if (v55 > v55 + v56) {
            goto LABEL_168;
          }
          BOOL v58 = v53;
          uint64_t v53 = (void **)v71;
        }

        else
        {
          unint64_t v57 = 0LL;
          BOOL v58 = 0LL;
        }

        LODWORD(v5) = ((unint64_t)v53 | v55) != 0;
        uint64_t v72 = __gen2_asn1_copy(*(void *)(v10 + 24), v55, v53);
        if ((_DWORD)v72)
        {
          unint64_t v11 = v72;
          if (!v58) {
            return v11;
          }
          goto LABEL_168;
        }

        goto LABEL_156;
      case 0xCu:
        unsigned int v30 = *(_DWORD *)(v10 + 16) & 0xFFF;
        if (v30 >= 0x15) {
          asn1_abort("type larger then asn1_template_prim: %d", v30);
        }
        uint64_t v31 = *(unsigned int *)(v10 + 20);
        unint64_t v5 = (unint64_t)asn1_template_prim[6 * v30 + 3];
        unint64_t v32 = v80 + v31;
        unint64_t v33 = *((void *)&v80 + 1) + v31;
        if (*((void *)&v80 + 1) + v31)
        {
          if (v33 >= *((void *)&v80 + 1) + v6 || v33 < *((void *)&v80 + 1)) {
            goto LABEL_168;
          }
        }

        uint64_t v29 = ((uint64_t (*)(void))v5)();
        if ((_DWORD)v29) {
          return v29;
        }
        goto LABEL_156;
      case 0xDu:
      case 0xEu:
        LODWORD(v5) = v78;
        if (v78) {
          goto LABEL_168;
        }
        unint64_t v5 = *(unsigned int *)(v10 + 20);
        unsigned int v16 = (unsigned int *)(v80 + v5);
        uint64_t v17 = (unsigned int *)(*((void *)&v80 + 1) + v5);
        size_t v18 = *v16;
        if (!(_DWORD)v18)
        {
          LODWORD(v5) = (_DWORD)v17 + 16;
          *((void *)v17 + 1) = 0LL;
          *uint64_t v17 = 0;
LABEL_136:
          unint64_t v6 = 16LL;
LABEL_156:
          LODWORD(v5) = v4 - 2;
          v10 += 16LL;
          unint64_t v4 = v3--;
          if (!v3) {
            return 0LL;
          }
          continue;
        }

        size_t v19 = *(unsigned int *)(*(void *)(v10 + 24) + 4LL);
        unint64_t v20 = calloc(v18, v19);
        if (!v20) {
          return 12LL;
        }
        if (!(_DWORD)v19) {
          goto LABEL_168;
        }
        LODWORD(v5) = DWORD2(v80);
        LODWORD(v5) = (_DWORD)v17 + 16;
        *((void *)v17 + 1) = v20;
        *uint64_t v17 = *v16;
        unint64_t v21 = *v16;
        if (!(_DWORD)v21) {
          goto LABEL_136;
        }
        uint64_t v22 = 0LL;
        unint64_t v23 = 0LL;
        while (1)
        {
          unint64_t v24 = *((void *)v16 + 1);
          unint64_t v25 = v24 + v22;
          if (v24 + v22)
          {
            unint64_t v5 = v24 + v21 * v19;
            if (v25 >= v5 || v25 < v24) {
              goto LABEL_168;
            }
          }

          unint64_t v5 = *((void *)v17 + 1);
          unint64_t v27 = v5 + v22;
          if (v5 + v22)
          {
          }

          uint64_t v29 = __gen2_asn1_copy(*(void *)(v10 + 24), v25, v27);
          if ((_DWORD)v29) {
            return v29;
          }
          ++v23;
          unint64_t v21 = *v16;
          v22 += v19;
          if (v23 >= v21) {
            goto LABEL_136;
          }
        }

      case 0xFu:
        unint64_t v5 = *(void *)(v10 + 24);
        if (v5 + 16 > v5 + 16 + 16LL * *(void *)(v5 + 8)) {
          goto LABEL_168;
        }
        size_t v59 = *(unsigned int *)(v5 + 4);
        if (v6 < v59) {
          goto LABEL_168;
        }
        memcpy(*((void **)&v80 + 1), (const void *)v80, v59);
        goto LABEL_156;
      default:
        goto LABEL_169;
    }
  }

unint64_t __gen2_asn1_decode_top( unint64_t result, unsigned int a2, unsigned __int8 *a3, size_t a4, char *a5, size_t *a6)
{
  size_t v7 = *(unsigned int *)(result + 4);
  if (&a5[v7] < a5)
  {
    __break(0x5519u);
  }

  else
  {
    unint64_t v12 = result;
    bzero(a5, v7);
    uint64_t v13 = __gen2_asn1_decode(v12, a2, a3, a4, a5, a6);
    if ((_DWORD)v13) {
      __gen2_asn1_free_top(v12, a5);
    }
    return v13;
  }

  return result;
}

void __gen2_asn1_free_top(unint64_t a1, char *a2)
{
  size_t v4 = *(unsigned int *)(a1 + 4);
  if (&a2[v4] < a2) {
    __break(0x5519u);
  }
  else {
    bzero(a2, v4);
  }
}

unint64_t __gen2_asn1_copy_top(unint64_t result, unint64_t a2, char *a3)
{
  size_t v4 = *(unsigned int *)(result + 4);
  if (&a3[v4] < a3)
  {
    __break(0x5519u);
  }

  else
  {
    unint64_t v6 = result;
    bzero(a3, v4);
    uint64_t v7 = __gen2_asn1_copy(v6, a2, (size_t *)a3);
    if ((_DWORD)v7) {
      __gen2_asn1_free_top(v6, a3);
    }
    return v7;
  }

  return result;
}

char *rk_hex_encode(unsigned __int8 *a1, uint64_t a2, char **a3)
{
  uint64_t v4 = a2;
  size_t v6 = (2 * a2) | 1;
  uint64_t result = (char *)malloc(v6);
  if (result) {
    unint64_t v8 = (unint64_t)&result[v6];
  }
  else {
    unint64_t v8 = 0LL;
  }
  if (!result)
  {
    uint64_t v10 = -1LL;
    goto LABEL_30;
  }

  if (!v4)
  {
    uint64_t v10 = 0LL;
LABEL_23:
    uint64_t v17 = &result[v10];
    *uint64_t v17 = 0;
LABEL_30:
    *a3 = result;
    return (char *)v10;
  }

  unint64_t v9 = &a1[v4];
  uint64_t v10 = 2 * v4;
  unint64_t v11 = result + 1;
  while (a1 < v9)
  {
    unint64_t v12 = *a1;
    uint64_t v13 = &hexchar[v12 >> 4];
    int64_t v15 = v11 - 1;
    if (v15 < result) {
      break;
    }
    *int64_t v15 = *v13;
    unsigned int v16 = &hexchar[v12 & 0xF];
    *unint64_t v11 = *v16;
    v11 += 2;
    ++a1;
    if (!--v4) {
      goto LABEL_23;
    }
  }

LABEL_31:
  __break(0x5519u);
  return result;
}

size_t rk_hex_decode(const char *a1, _BYTE *a2, size_t a3)
{
  unint64_t v5 = (unsigned __int8 *)a1;
  size_t v6 = strlen(a1);
  size_t v7 = v6 & 1;
  if (v7 + (v6 >> 1) > a3) {
    return -1LL;
  }
  unint64_t v9 = v6;
  if ((v6 & 1) != 0)
  {
    size_t result = pos(*v5);
    if (!a3 || (*a2 = result, !*v5))
    {
LABEL_25:
      __break(0x5519u);
      return result;
    }

    ++v5;
    uint64_t v10 = a2 + 1;
  }

  else
  {
    uint64_t v10 = a2;
  }

  size_t result = strlen((const char *)v5);
  if (v9 >= 2)
  {
    unint64_t v12 = &a2[a3];
    unint64_t v13 = (unint64_t)&v5[result + 1];
    if (v9 >> 1 <= 1) {
      uint64_t v11 = 1LL;
    }
    else {
      uint64_t v11 = v9 >> 1;
    }
    uint64_t v14 = v5 + 1;
    uint64_t v15 = v11;
    while ((unint64_t)(v14 - 1) < v13 && v14 - 1 >= v5)
    {
      size_t result = pos(*(v14 - 1));
      if (v14 < v5) {
        break;
      }
      char v17 = result;
      size_t result = pos(*v14);
      if (v10 >= v12 || v10 < a2) {
        break;
      }
      *v10++ = result | (16 * v17);
      v14 += 2;
      if (!--v15) {
        return v11 + v7;
      }
    }

    goto LABEL_25;
  }

  uint64_t v11 = 0LL;
  return v11 + v7;
}

uint64_t pos(unsigned __int8 a1)
{
  char v1 = __toupper(a1);
  uint64_t result = 0LL;
  while (hexchar[result])
  {
    if (&hexchar[++result] >= byte_18907DE88)
    {
      __break(0x5519u);
      return 0xFFFFFFFFLL;
    }
  }

  return 0xFFFFFFFFLL;
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

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0A0](__dst, __source, __size);
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