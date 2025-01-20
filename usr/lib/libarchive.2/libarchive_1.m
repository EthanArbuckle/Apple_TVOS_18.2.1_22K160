uint64_t sub_1806FB7A0(unsigned int *a1, unsigned __int8 *a2, unint64_t a3, int a4)
{
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  if (!a3) {
    return 0LL;
  }
  if (a3 == 1)
  {
    *a1 = 65533;
    return 0xFFFFFFFFLL;
  }

  v5 = a2[1];
  if (a4) {
    v6 = *a2;
  }
  else {
    v6 = a2[1];
  }
  if (!a4) {
    v5 = *a2;
  }
  v7 = v5 | (v6 << 8);
  if ((v6 & 0xFC) == 0xD8)
  {
    if (a3 < 4 || ((v8 = a2[3], a4) ? (v9 = a2[2]) : (v9 = a2[3]), (v9 & 0xFC) != 0xDC))
    {
      *a1 = 65533;
      return 4294967294LL;
    }

    if (!a4) {
      v8 = a2[2];
    }
    v7 = (v8 | (v9 << 8)) + (v7 << 10) - 56613888;
    v10 = (_DWORD)a2 + 4;
  }

  else
  {
    v10 = (_DWORD)a2 + 2;
  }

  if (HIWORD(v7) > 0x10u || (v7 & 0xFFFFF800) == 55296)
  {
    *a1 = 65533;
    return ((_DWORD)a2 - v10);
  }

  else
  {
    *a1 = v7;
    return (v10 - (_DWORD)a2);
  }

uint64_t sub_1806FB878(uint64_t a1, char *a2, uint64_t a3, int a4)
{
  uint64_t v5 = a3;
  v8 = *(_BYTE **)a1;
  v9 = (_BYTE *)(*(void *)a1 + *(void *)(a1 + 8));
  uint64_t result = 0LL;
  if (v5)
  {
    do
    {
      int v12 = *a2++;
      __int16 v11 = v12;
      BOOL v13 = v12 < 0;
      if (v12 < 0) {
        uint64_t result = 0xFFFFFFFFLL;
      }
      else {
        uint64_t result = result;
      }
      if (v13) {
        __int16 v11 = -3;
      }
      if (a4) {
        char v14 = HIBYTE(v11);
      }
      else {
        char v14 = v11;
      }
      if (!a4) {
        LOBYTE(v11) = HIBYTE(v11);
      }
      _BYTE *v9 = v14;
      v9[1] = v11;
      v9 += 2;
      --v5;
    }

    while (v5);
    v8 = *(_BYTE **)a1;
  }

  *(void *)(a1 + 8) = v9 - v8;
  _BYTE *v9 = 0;
  *(_BYTE *)(*(void *)(a1 + 8) + *(void *)a1 + 1LL) = 0;
  return result;
}

uint64_t sub_1806FB928(unsigned int a1, unsigned int a2)
{
  int v2 = 0;
  int v3 = 930;
  do
  {
    unsigned int v4 = dword_18071D10C[3 * ((v3 + v2) / 2)];
    if (v4 < a1)
    {
LABEL_5:
      int v2 = (v3 + v2) / 2 + 1;
      continue;
    }

    if (v4 <= a1)
    {
      unsigned int v5 = dword_18071D10C[3 * ((v3 + v2) / 2) + 1];
      if (v5 < a2) {
        goto LABEL_5;
      }
      if (v5 <= a2) {
        return dword_18071D10C[3 * ((v3 + v2) / 2) + 2];
      }
    }

    int v3 = (v3 + v2) / 2 - 1;
  }

  while (v3 >= v2);
  return 0LL;
}

uint64_t sub_1806FB9A4(uint64_t a1, unsigned __int8 *a2, unint64_t a3, int a4)
{
  unint64_t v5 = a3;
  v8 = (char *)(*(void *)a1 + *(void *)(a1 + 8));
  int v9 = sub_1806FB7A0(&v15, a2, v5, a4);
  for (i = 0LL; v9; int v9 = sub_1806FB7A0(&v15, a2, v5, a4))
  {
    if (v9 >= 0) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = -v9;
    }
    if (v9 < 0) {
      unsigned int v12 = -1;
    }
    else {
      unsigned int v12 = i;
    }
    v5 -= v11;
    a2 += v11;
    char v13 = v15;
    if (v15 <= 0x7F)
    {
      uint64_t i = v12;
    }

    else
    {
      char v13 = 63;
      uint64_t i = 0xFFFFFFFFLL;
    }

    *v8++ = v13;
  }

  *(void *)(a1 + 8) = &v8[-*(void *)a1];
  char *v8 = 0;
  return i;
}

_DWORD *sub_1806FBA84( void **a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char *a9)
{
  return sub_1806FBAAC(a1, a2, &a9);
}

_DWORD *sub_1806FBAAC(void **a1, char *a2, char **a3)
{
  uint64_t result = sub_1806F7590(a1, 0x40uLL);
  if (!result) {
LABEL_62:
  }
    sub_1806FBF04(1, "Out of memory");
  if (a2)
  {
    while (1)
    {
      if (*a2 != 37)
      {
        if (!*a2) {
          return result;
        }
        char v6 = *a2;
        v7 = (uint64_t *)a1;
        goto LABEL_6;
      }

      v8 = a2 + 1;
      int v9 = a2[1];
      unsigned int v10 = a2[1] - 106;
      BOOL v11 = v10 > 0x10;
      int v12 = (1 << v10) & 0x10005;
      if (v11 || v12 == 0)
      {
        char v14 = a2[1];
        int v9 = 0;
      }

      else
      {
        v8 = a2 + 2;
        char v14 = a2[2];
      }

      if (v14 > 98)
      {
        switch(v14)
        {
          case 'o':
          case 'u':
          case 'x':
            goto LABEL_19;
          case 'p':
          case 'q':
          case 'r':
          case 't':
          case 'v':
          case 'w':
            goto LABEL_38;
          case 's':
            v29 = a3++;
            v30 = *v29;
            if (v9 != 108)
            {
              if (v30) {
                v32 = v30;
              }
              else {
                v32 = "(null)";
              }
              uint64_t result = sub_1806F76CC((uint64_t *)a1, v32);
LABEL_52:
              a2 = v8;
              goto LABEL_53;
            }

            if (v30) {
              v21 = (__int32 *)v30;
            }
            else {
              v21 = (__int32 *)&unk_18071FCBC;
            }
            break;
          default:
            if (v14 != 99)
            {
              if (v14 != 100) {
                goto LABEL_38;
              }
              if (v9 == 122 || (char)v9 == 108 || (char)v9 == 106)
              {
                v23 = (unint64_t *)a3++;
                unint64_t v24 = *v23;
                if ((*v23 & 0x8000000000000000LL) != 0) {
                  goto LABEL_36;
                }
              }

              else
              {
                v33 = a3++;
                unint64_t v24 = *(int *)v33;
                if ((v24 & 0x8000000000000000LL) != 0)
                {
LABEL_36:
                  sub_1806F76DC((uint64_t *)a1, 45);
                  unint64_t v24 = -(uint64_t)v24;
                }
              }

              v25 = (uint64_t *)a1;
              unint64_t v16 = v24;
              goto LABEL_43;
            }

            v31 = (char *)a3++;
            char v18 = *v31;
            v17 = (uint64_t *)a1;
            goto LABEL_51;
        }
      }

      else
      {
        if (v14 == 37)
        {
          v17 = (uint64_t *)a1;
          char v18 = 37;
LABEL_51:
          uint64_t result = sub_1806F76DC(v17, v18);
          goto LABEL_52;
        }

        if (v14 != 83)
        {
          if (v14 != 88)
          {
LABEL_38:
            v7 = (uint64_t *)a1;
            char v6 = 37;
LABEL_6:
            uint64_t result = sub_1806F76DC(v7, v6);
            goto LABEL_53;
          }

uint64_t *sub_1806FBD80(uint64_t *a1, unint64_t a2, unsigned int a3)
{
  uint64_t v5 = a3;
  unint64_t v6 = a2 / a3;
  if (a3 <= a2) {
    sub_1806FBD80(a1, a2 / a3);
  }
  return sub_1806F76DC(a1, a0123456789abcd_0[a2 - v6 * v5]);
}

uint64_t sub_1806FBDD8(uint64_t a1)
{
  return 0LL;
}

uint64_t archive_version_number()
{
  return 3005003LL;
}

const char *archive_version_string()
{
  return "libarchive 3.5.3";
}

uint64_t archive_errno(uint64_t a1)
{
  return *(unsigned int *)(a1 + 52);
}

_BYTE *archive_error_string(uint64_t a1)
{
  uint64_t result = *(_BYTE **)(a1 + 56);
  if (!result || !*result) {
    return 0LL;
  }
  return result;
}

uint64_t archive_file_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t archive_format(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t archive_format_name(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t archive_compression(uint64_t a1)
{
  return archive_filter_code(a1);
}

uint64_t archive_compression_name(uint64_t a1)
{
  return archive_filter_name(a1);
}

uint64_t archive_position_compressed(uint64_t a1)
{
  return archive_filter_bytes(a1);
}

uint64_t archive_position_uncompressed(uint64_t a1)
{
  return archive_filter_bytes(a1);
}

uint64_t archive_clear_error(uint64_t result)
{
  *(void *)(result + 72) = 0LL;
  *(void *)(result + 56) = 0LL;
  *(_DWORD *)(result + 52) = 0;
  return result;
}

_DWORD *archive_set_error( _DWORD *result, int a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char *a9)
{
  int v9 = a3;
  unsigned int v10 = result;
  result[13] = a2;
  if (a3)
  {
    *((void *)result + 9) = 0LL;
    uint64_t result = sub_1806FBAAC((void **)result + 8, a3, &a9);
    int v9 = (char *)*((void *)v10 + 8);
  }

  *((void *)v10 + 7) = v9;
  return result;
}

uint64_t *archive_copy_error(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  *(void *)(a1 + 72) = 0LL;
  uint64_t result = sub_1806F7484((uint64_t *)(a1 + 64), a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a1 + 64);
  return result;
}

void sub_1806FBF04(int a1, const char *a2)
{
  size_t v4 = strlen(a2);
  write(2, a2, v4);
  write(2, "\n", 1uLL);
  exit(a1);
}

uint64_t sub_1806FBF60(char *__s)
{
  v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  if (__s)
  {
    v1 = __s;
  }

  else
  {
    int v2 = getenv("TMPDIR");
    if (v2) {
      v1 = v2;
    }
    else {
      v1 = "/tmp";
    }
  }

  size_t v3 = strlen(v1);
  sub_1806F7634((uint64_t *)&v7, v1, v3);
  if (v7[v8 - 1] != 47) {
    sub_1806F76DC((uint64_t *)&v7, 47);
  }
  sub_1806F76CC((uint64_t *)&v7, "libarchive_XXXXXX");
  uint64_t v4 = mkstemp(v7);
  uint64_t v5 = v4;
  if ((v4 & 0x80000000) == 0)
  {
    sub_1806FC024(v4);
    unlink(v7);
  }

  sub_1806F755C((uint64_t)&v7);
  return v5;
}

uint64_t sub_1806FC024(uint64_t result)
{
  if ((result & 0x80000000) == 0)
  {
    int v1 = result;
    uint64_t result = fcntl(result, 1);
    if ((result & 1) == 0) {
      return fcntl(v1, 2, result | 1);
    }
  }

  return result;
}

uint64_t sub_1806FC06C(char *a1)
{
  uint64_t v1 = mkstemp(a1);
  uint64_t v2 = v1;
  if ((v1 & 0x80000000) == 0) {
    sub_1806FC024(v1);
  }
  return v2;
}

uint64_t archive_utility_string_sort(const char **a1)
{
  unsigned int v1 = -1;
  do
    ++v1;
  while (a1[v1]);
  return sub_1806FC0B0(a1, v1);
}

uint64_t sub_1806FC0B0(const char **a1, unsigned int a2)
{
  if (a2 < 2) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  unint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v9 = a1 + 1;
  uint64_t v8 = *a1;
  uint64_t v10 = a2 - 1LL;
  do
  {
    if (strcmp(*v9, v8) < 0)
    {
      BOOL v11 = realloc(v6, 8LL * (v4 + 1));
      if (!v11) {
        goto LABEL_14;
      }
      unsigned int v12 = v4;
      unint64_t v6 = v11;
      uint64_t v4 = (v4 + 1);
    }

    else
    {
      BOOL v11 = realloc(v5, 8LL * (v7 + 1));
      if (!v11)
      {
LABEL_14:
        free(v5);
        free(v6);
        return 4294967266LL;
      }

      unsigned int v12 = v7;
      uint64_t v7 = (v7 + 1);
      uint64_t v5 = v11;
    }

    char v13 = *v9++;
    *((void *)v11 + v12) = v13;
    --v10;
  }

  while (v10);
  unsigned int v14 = sub_1806FC0B0(v6, v4);
  if ((_DWORD)v4)
  {
    uint64_t v15 = v4;
    uint64_t v16 = v4;
    v17 = a1;
    char v18 = (const char **)v6;
    do
    {
      v19 = *v18++;
      *v17++ = v19;
      --v16;
    }

    while (v16);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  free(v6);
  a1[v15] = v8;
  unsigned int v20 = sub_1806FC0B0(v5, v7);
  if ((_DWORD)v7)
  {
    int v21 = v4 + 1;
    uint64_t v22 = v7;
    v23 = (const char **)v5;
    do
    {
      unint64_t v24 = *v23++;
      a1[v21++] = v24;
      --v22;
    }

    while (v22);
  }

  free(v5);
  else {
    return v14;
  }
}

uint64_t archive_read_set_format_option( int *a1, char *a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1806AC998( a1,  a2,  a3,  a4,  14594245LL,  "archive_read_set_format_option",  (uint64_t (*)(int *, char *, unint64_t, unint64_t))sub_1806FC240,  a8);
}

uint64_t sub_1806FC240(uint64_t a1, char *__s2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = 0LL;
  int v9 = 0;
  unsigned int v10 = -20;
  do
  {
    uint64_t v11 = a1 + v8;
    unsigned int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + v8 + 1088);
    if (v12)
    {
      char v13 = *(const char **)(v11 + 1072);
      if (v13)
      {
        if (__s2)
        {
          if (strcmp(v13, __s2)) {
            goto LABEL_11;
          }
          ++v9;
        }

        *(void *)(a1 + 2472) = v11 + 1064;
        uint64_t result = v12(a1, a3, a4);
        *(void *)(a1 + 2472) = 0LL;
        if ((_DWORD)result)
        {
          if ((_DWORD)result == -30) {
            return result;
          }
        }

        else
        {
          unsigned int v10 = 0;
        }
      }
    }

uint64_t archive_read_set_filter_option( int *a1, char *a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1806AC998( a1,  a2,  a3,  a4,  14594245LL,  "archive_read_set_filter_option",  (uint64_t (*)(int *, char *, unint64_t, unint64_t))sub_1806FC324,  a8);
}

uint64_t sub_1806FC324(uint64_t a1, char *__s2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 1032);
  if (v5)
  {
    int v8 = 0;
    unsigned int v9 = -20;
    while (1)
    {
      uint64_t v10 = *(void *)(v5 + 8);
      if (v10)
      {
        uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32);
        if (v11)
        {
          if (!__s2) {
            goto LABEL_8;
          }
        }
      }

uint64_t archive_read_set_option( int *a1, char *a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1806AC998( a1,  a2,  a3,  a4,  14594245LL,  "archive_read_set_option",  (uint64_t (*)(int *, char *, unint64_t, unint64_t))sub_1806FC3FC,  a8);
}

uint64_t sub_1806FC3FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1806ACAD8( a1,  a2,  a3,  a4,  (uint64_t (*)(void))sub_1806FC240,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1806FC324);
}

uint64_t archive_read_set_options( int *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1806ACB70( a1,  a2,  14594245,  "archive_read_set_options",  (uint64_t (*)(int *, char *, const char *, const char *))sub_1806FC3FC,  a6,  a7,  a8);
}

uint64_t archive_filter_code(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 88LL))();
}

uint64_t archive_filter_count(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 72LL))();
}

uint64_t archive_filter_name(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 96LL))();
}

uint64_t archive_filter_bytes(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 80LL))();
}

uint64_t archive_free(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_180700C6C();
    return (*(uint64_t (**)(uint64_t))(*(void *)(v1 + 8) + 8LL))(v1);
  }

  return result;
}

uint64_t archive_write_close(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 8))();
}

uint64_t archive_read_close(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 8))();
}

uint64_t archive_write_fail(uint64_t a1)
{
  *(_DWORD *)(a1 + 4) = 0x8000;
  return 0x8000LL;
}

uint64_t archive_write_free(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_180700C6C();
    return (*(uint64_t (**)(uint64_t))(*(void *)(v1 + 8) + 8LL))(v1);
  }

  return result;
}

uint64_t archive_write_finish(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_180700C6C();
    return (*(uint64_t (**)(uint64_t))(*(void *)(v1 + 8) + 8LL))(v1);
  }

  return result;
}

uint64_t archive_read_free(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_180700C6C();
    return (*(uint64_t (**)(uint64_t))(*(void *)(v1 + 8) + 8LL))(v1);
  }

  return result;
}

uint64_t archive_read_finish(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_180700C6C();
    return (*(uint64_t (**)(uint64_t))(*(void *)(v1 + 8) + 8LL))(v1);
  }

  return result;
}

uint64_t archive_write_header(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16LL))();
}

uint64_t archive_write_finish_entry(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 24LL))();
}

uint64_t archive_write_data(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 32LL))();
}

uint64_t archive_write_data_block( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9 = *(uint64_t (**)(uint64_t))(*(void *)(a1 + 8) + 40LL);
  if (v9) {
    return v9(a1);
  }
  archive_set_error((_DWORD *)a1, -1, "archive_write_data_block not supported", a4, 0LL, a6, a7, a8, v11);
  *(_DWORD *)(a1 + 4) = 0x8000;
  return -30LL;
}

uint64_t archive_read_next_header(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 48LL))();
}

uint64_t archive_read_next_header2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 56LL))();
}

uint64_t archive_read_data_block(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 64LL))();
}

uint64_t sub_1806FC634()
{
  time_t v0 = MEMORY[0x1895F8858]();
  uint64_t v2 = v1;
  uint64_t v112 = *MEMORY[0x1895F89C0];
  time_t v109 = v0;
  bzero(v110, 0x1000uLL);
  if (!localtime_r(&v109, &v108)) {
    return -1LL;
  }
  v99 = gmtime_r(&v109, &v107);
  if (v99) {
    uint64_t v3 = 3600 * (v107.tm_hour - (uint64_t)v108.tm_hour)
  }
       + 86400LL
       * (v107.tm_yday
        - (v107.tm_year + 1899) / 100
        + ((v107.tm_year + 1899) >> 2)
        + (((v107.tm_year + 1899) / 100) >> 2)
        + (v108.tm_year + 1899) / 100
        - (v108.tm_yday
         + ((v108.tm_year + 1899) >> 2)
         + (((v108.tm_year + 1899) / 100) >> 2))
        + 365 * (v107.tm_year - v108.tm_year))
       + 60 * (v107.tm_min - (uint64_t)v108.tm_min)
       - v108.tm_sec
       + v107.tm_sec;
  else {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = 0LL;
  if (v108.tm_isdst) {
    v3 += 3600LL;
  }
  uint64_t v103 = v3;
  uint64_t v5 = MEMORY[0x1895F8770];
  while (1)
  {
    unint64_t v6 = (int *)&v110[v4];
    uint64_t v7 = (uint64_t *)(v6 + 2);
    int v8 = v2;
    do
    {
LABEL_9:
      unsigned int v9 = v8;
      uint64_t v10 = *v8;
      if (*v8 < 0) {
        int v11 = __maskrune(*v8, 0x4000uLL);
      }
      else {
        int v11 = *(_DWORD *)(v5 + 4 * v10 + 60) & 0x4000;
      }
      ++v8;
    }

    while (v11);
    if ((_DWORD)v10 == 40)
    {
      int v12 = 0;
      int v8 = v9;
      while (1)
      {
        int v14 = *v8++;
        int v13 = v14;
        if (v14 == 40)
        {
          ++v12;
        }

        else if (v13 == 41)
        {
          --v12;
        }

        else if (!v13)
        {
          *unint64_t v6 = 0;
          goto LABEL_58;
        }

        if (v12 <= 0) {
          goto LABEL_9;
        }
      }
    }

    unsigned int v15 = *v9;
    if (*v9)
    {
      unint64_t v16 = 0LL;
      uint64_t v2 = v9;
      while (1)
      {
        if ((v15 & 0x80) != 0)
        {
          if (__maskrune(v15, 0x500uLL))
          {
LABEL_27:
            if (v16 > 0x3E) {
              goto LABEL_42;
            }
            goto LABEL_32;
          }
        }

        else if ((*(_DWORD *)(v5 + 4LL * v15 + 60) & 0x500) != 0)
        {
          goto LABEL_27;
        }

        if (v15 != 46 || v16 >= 0x3F) {
          goto LABEL_42;
        }
LABEL_32:
        uint64_t v17 = *v2;
        if ((_DWORD)v17 != 46)
        {
          char v18 = *v2;
          if ((char)v17 < 0)
          {
            if (__maskrune(*v2, 0x8000uLL)) {
LABEL_35:
            }
              char v18 = __tolower(v17);
          }

          else if ((*(_DWORD *)(v5 + 4 * v17 + 60) & 0x8000) != 0)
          {
            goto LABEL_35;
          }

          __s[v16++] = v18;
        }

        unsigned int v19 = *++v2;
        unsigned int v15 = v19;
        if (!v19) {
          goto LABEL_42;
        }
      }
    }

    unint64_t v16 = 0LL;
    uint64_t v2 = v9;
LABEL_42:
    __s[v16] = 0;
    size_t v20 = strlen(__s);
    int v21 = &dword_18969D7D0;
    uint64_t v22 = "am";
    do
    {
      size_t v23 = *((void *)v21 - 2);
      if (!v23) {
        size_t v23 = strlen(v22);
      }
      if (v20 >= v23 && !strncmp(v22, __s, v20))
      {
        uint64_t *v7 = *((void *)v21 + 1);
        int v24 = *v21;
        goto LABEL_55;
      }

      uint64_t v22 = (const char *)*((void *)v21 + 3);
      v21 += 8;
    }

    while (v22);
    int v24 = *v9;
    uint64_t *v7 = 0LL;
    int v25 = *v9;
    if ((v25 - 48) <= 9)
    {
      uint64_t v26 = 0LL;
      do
      {
        uint64_t v26 = 10 * v26 + (char)v25 - 48;
        uint64_t *v7 = v26;
        int v27 = *++v9;
        LOBYTE(v25) = v27;
      }

      while ((v27 - 48) < 0xA);
    }

    *unint64_t v6 = 267;
    uint64_t v2 = v9;
LABEL_56:
    ++v4;
    uint64_t result = -1LL;
    if (v4 == 256) {
      return result;
    }
  }

  int v24 = (char)v24;
  uint64_t v2 = v9 + 1;
LABEL_55:
  *unint64_t v6 = v24;
  if (v24) {
    goto LABEL_56;
  }
LABEL_58:
  if (!v4)
  {
    uint64_t v29 = 0LL;
    uint64_t v30 = 0LL;
    uint64_t v106 = 0LL;
    int64_t v32 = 0LL;
    unint64_t v101 = 0LL;
    unint64_t v102 = 0LL;
    unint64_t v75 = 0LL;
    unint64_t v86 = 0LL;
    unint64_t v72 = 0LL;
    int v36 = 0;
    int v37 = 0;
    int v85 = 0;
    LODWORD(v38) = 0;
    LODWORD(v39) = 0;
    int v40 = 0;
    int v84 = 0;
    int v87 = 2;
    uint64_t v88 = v103;
    goto LABEL_182;
  }

  uint64_t v4 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  uint64_t v105 = 0LL;
  uint64_t v106 = 0LL;
  BOOL v31 = 0LL;
  int64_t v32 = 0LL;
  unint64_t v101 = 0LL;
  unint64_t v102 = 0LL;
  unint64_t v33 = 0LL;
  unint64_t v98 = 0LL;
  unint64_t v34 = 0LL;
  uint64_t v35 = 0LL;
  int v36 = 0;
  int v37 = 0;
  uint64_t v38 = 0LL;
  uint64_t v39 = 0LL;
  int v40 = 0;
  v41 = (int *)v110;
  while (2)
  {
    int v42 = *v41;
    uint64_t result = -1LL;
    switch(*v41)
    {
      case 261:
        uint64_t v38 = (v38 + 1);
        v43 = v41 + 4;
        uint64_t v30 = *((void *)v41 + 1);
        uint64_t v106 = 1LL;
        if (v41[4] == 44) {
LABEL_62:
        }
          v43 = v41 + 8;
        else {
          uint64_t v106 = 1LL;
        }
        goto LABEL_97;
      case 262:
        BOOL v31 = 0LL;
        ++v37;
        uint64_t v35 = *((void *)v41 + 1);
        v43 = v41 + 4;
        goto LABEL_97;
      case 263:
        return result;
      case 264:
        if (v41[4] != 267) {
          return -1LL;
        }
        if (v41[8] == 44 && v41[12] == 267)
        {
          ++HIDWORD(v105);
          unint64_t v33 = *((void *)v41 + 1);
          unint64_t v34 = *((void *)v41 + 3);
          uint64_t v45 = 4LL;
          int64_t v32 = *((void *)v41 + 7);
          goto LABEL_87;
        }

        unint64_t v33 = *((void *)v41 + 1);
        unint64_t v34 = *((void *)v41 + 3);
        goto LABEL_86;
      case 265:
        v29 += *((void *)v41 + 1);
        goto LABEL_76;
      case 266:
        v4 += *((void *)v41 + 1);
LABEL_76:
        uint64_t v46 = 1LL;
        goto LABEL_92;
      case 267:
        v43 = v41 + 4;
        int v47 = v41[4];
        if (v47 > 260)
        {
          switch(v47)
          {
            case 261:
              uint64_t v38 = (v38 + 1);
              uint64_t v106 = *((void *)v41 + 1);
              uint64_t v30 = *((void *)v41 + 3);
              goto LABEL_62;
            case 263:
              uint64_t v58 = v38;
              unint64_t v54 = v34;
              uint64_t v55 = v39;
              unint64_t v56 = v33;
              uint64_t v57 = v58;
              unint64_t v101 = 0LL;
              unint64_t v102 = 0LL;
              LODWORD(v105) = v105 + 1;
              uint64_t v59 = *((void *)v41 + 1);
              goto LABEL_107;
            case 264:
              if (v41[8] == 267)
              {
                ++HIDWORD(v105);
                unint64_t v34 = *((void *)v41 + 1);
                unint64_t v33 = *((void *)v41 + 3);
                uint64_t v45 = 3LL;
                int64_t v32 = *((void *)v41 + 5);
                goto LABEL_87;
              }

              unint64_t v34 = *((void *)v41 + 1);
              unint64_t v33 = *((void *)v41 + 3);
              break;
            case 265:
              v29 += *((void *)v41 + 3) * *((void *)v41 + 1);
              goto LABEL_123;
            case 266:
              v4 += *((void *)v41 + 3) * *((void *)v41 + 1);
LABEL_123:
              uint64_t v46 = 2LL;
              goto LABEL_92;
            default:
              goto LABEL_152;
          }

LABEL_86:
          uint64_t v45 = 2LL;
          goto LABEL_87;
        }

        if (v47 == 45)
        {
          int v67 = v41[8];
          if (v67 == 264)
          {
            if (v41[12] == 45 && v41[16] == 267)
            {
              ++HIDWORD(v105);
              uint64_t v68 = *((void *)v41 + 1);
              if (v68 <= 31) {
                int64_t v32 = *((void *)v41 + 9);
              }
              else {
                int64_t v32 = *((void *)v41 + 1);
              }
              if (v68 <= 31) {
                unint64_t v34 = *((void *)v41 + 1);
              }
              else {
                unint64_t v34 = *((void *)v41 + 9);
              }
              unint64_t v33 = *((void *)v41 + 5);
LABEL_168:
              uint64_t v45 = 5LL;
              goto LABEL_87;
            }
          }

          else if (v67 == 267 && v41[12] == 45 && v41[16] == 267)
          {
            ++HIDWORD(v105);
            int64_t v32 = *((void *)v41 + 1);
            unint64_t v33 = *((void *)v41 + 5);
            uint64_t v45 = 5LL;
            unint64_t v34 = *((void *)v41 + 9);
            goto LABEL_87;
          }

          goto LABEL_152;
        }

        if (v47 == 47)
        {
          if (v41[8] == 267)
          {
            if (v41[12] == 47 && v41[16] == 267)
            {
              ++HIDWORD(v105);
              int64_t v32 = *((void *)v41 + 1);
              if (v32 < 13)
              {
                unint64_t v33 = *((void *)v41 + 1);
                int64_t v32 = *((void *)v41 + 9);
                unint64_t v34 = *((void *)v41 + 5);
              }

              else
              {
                unint64_t v33 = *((void *)v41 + 5);
                unint64_t v34 = *((void *)v41 + 9);
              }

              goto LABEL_168;
            }

            unint64_t v33 = *((void *)v41 + 1);
            unint64_t v34 = *((void *)v41 + 5);
            uint64_t v45 = 3LL;
LABEL_87:
            uint64_t v39 = (v39 + 1);
            ++v40;
            v43 = &v41[4 * v45];
            goto LABEL_97;
          }

LABEL_152:
          unint64_t v69 = *((void *)v41 + 1);
          if (!(_DWORD)v105 || HIDWORD(v105) || v36)
          {
            if ((uint64_t)v69 < 10001)
            {
              if ((uint64_t)v69 > 23)
              {
                uint64_t result = -1LL;
                if (v69 > 0x95F) {
                  return result;
                }
                unint64_t v98 = (unsigned __int16)v69 / 0x64u;
                unsigned __int16 v70 = (unsigned __int16)v69 % 0x64u;
                if (v70 > 0x3Bu) {
                  return result;
                }
                unint64_t v101 = v70;
                unint64_t v102 = 0LL;
              }

              else
              {
                unint64_t v101 = 0LL;
                unint64_t v102 = 0LL;
                LODWORD(v105) = v105 + 1;
                unint64_t v98 = v69;
              }
            }

            else
            {
              ++HIDWORD(v105);
              ++v40;
              uint64_t v39 = (v39 + 1);
              unint64_t v34 = v69 % 0x64;
              unint64_t v33 = v69 / 0x64
                  - 100 * ((unint64_t)((v69 / 0x64 * (unsigned __int128)0x51EB851EB851EB9uLL) >> 64) >> 1);
              int64_t v32 = v69 / 0x2710;
            }
          }

          else
          {
            HIDWORD(v105) = 1;
            int64_t v32 = v69;
          }

          goto LABEL_97;
        }

        if (v47 != 58 || v41[8] != 267) {
          goto LABEL_152;
        }
        v43 = v41 + 12;
        int v52 = v41[12];
        if (v52 != 58)
        {
          uint64_t v71 = v38;
          unint64_t v54 = v34;
          uint64_t v55 = v39;
          unint64_t v56 = v33;
          uint64_t v57 = v71;
          unint64_t v102 = 0LL;
LABEL_164:
          unint64_t v101 = *((void *)v41 + 5);
          LODWORD(v105) = v105 + 1;
          uint64_t v59 = *((void *)v41 + 1);
          if (v52 == 263)
          {
LABEL_107:
            BOOL v60 = v31;
            int64_t v61 = v32;
            if (v59 == 12) {
              uint64_t v62 = 0LL;
            }
            else {
              uint64_t v62 = v59;
            }
            uint64_t v63 = v59 + 12;
            int v64 = v43[4];
            v43 += 4;
            int v52 = v64;
            if (v59 == 12) {
              uint64_t v63 = 12LL;
            }
            if (*((void *)v43 - 1) == 1LL) {
              uint64_t v59 = v63;
            }
            else {
              uint64_t v59 = v62;
            }
            int64_t v32 = v61;
            BOOL v31 = v60;
          }

          unint64_t v98 = v59;
          if (v52 == 43)
          {
            uint64_t v65 = v57;
            if (v43[4] == 267)
            {
              ++v37;
              int v66 = v43[8];
              v43 += 8;
              int v52 = v66;
              uint64_t v35 = -60 * (*((void *)v43 - 1) % 100LL) - 3600 * (*((void *)v43 - 1) / 100LL);
              BOOL v31 = 1LL;
              goto LABEL_135;
            }

            unint64_t v33 = v56;
            uint64_t v39 = v55;
LABEL_141:
            unint64_t v34 = v54;
          }

          else
          {
            uint64_t v65 = v57;
LABEL_135:
            unint64_t v33 = v56;
            uint64_t v39 = v55;
            if (v52 != 45) {
              goto LABEL_141;
            }
            unint64_t v34 = v54;
            if (v43[4] == 267)
            {
              ++v37;
              uint64_t v35 = 60 * (*((void *)v43 + 3) % 100LL) + 3600 * (*((void *)v43 + 3) / 100LL);
              v43 += 8;
              BOOL v31 = 1LL;
            }
          }

          uint64_t v38 = v65;
          goto LABEL_97;
        }

        if (v41[16] == 267)
        {
          uint64_t v53 = v38;
          unint64_t v54 = v34;
          uint64_t v55 = v39;
          unint64_t v56 = v33;
          uint64_t v57 = v53;
          v43 = v41 + 20;
          int v52 = v41[20];
          unint64_t v102 = *((void *)v41 + 9);
          goto LABEL_164;
        }

        unint64_t v98 = *((void *)v41 + 1);
        unint64_t v101 = *((void *)v41 + 5);
        unint64_t v102 = 0LL;
        LODWORD(v105) = v105 + 1;
LABEL_97:
        v41 = v43;
        if (v43 < v6) {
          continue;
        }
        unint64_t v72 = v34;
        if (v37) {
          int v73 = v31;
        }
        else {
          int v73 = 2;
        }
        uint64_t v74 = v103;
        if (v37) {
          uint64_t v74 = v35;
        }
        if (v99)
        {
          unint64_t v75 = v33;
          if (v37)
          {
            int v104 = v40;
            int v100 = v39;
            uint64_t v76 = v35;
            int v97 = v38;
            BOOL v77 = v31;
            int64_t v78 = v32;
            uint64_t v79 = v76;
            v109 -= v76;
            v80 = gmtime_r(&v109, &v107);
            if (v80)
            {
              __int128 v81 = *(_OWORD *)&v80->tm_sec;
              __int128 v82 = *(_OWORD *)&v80->tm_mon;
              __int128 v83 = *(_OWORD *)&v80->tm_isdst;
              v108.tm_zone = v80->tm_zone;
              *(_OWORD *)&v108.tm_mon = v82;
              *(_OWORD *)&v108.tm_isdst = v83;
              *(_OWORD *)&v108.tm_sec = v81;
            }

            v109 += v79;
            int v85 = v105;
            int v84 = HIDWORD(v105);
            unint64_t v86 = v98;
            int64_t v32 = v78;
            int v87 = v77;
            LODWORD(v38) = v97;
            uint64_t v88 = v79;
            LODWORD(v39) = v100;
            int v40 = v104;
          }

          else
          {
            int v87 = v73;
            uint64_t v88 = v74;
            int v85 = v105;
            int v84 = HIDWORD(v105);
            unint64_t v86 = v98;
          }
        }

        else
        {
          int v87 = v73;
          uint64_t v88 = v74;
          int v85 = v105;
          int v84 = HIDWORD(v105);
          unint64_t v86 = v98;
          unint64_t v75 = v33;
        }

time_t sub_1806FD2D0( unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7, int a8)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v30 = 0x1F1F1E1F1E1F001FLL;
  int v31 = 522067742;
  uint64_t v9 = a3 + 1900;
  if (a3 >= 100) {
    uint64_t v9 = a3;
  }
  if (a3 < 69) {
    uint64_t v9 = a3 + 2000;
  }
  if ((v9 & 3) != 0)
  {
    char v10 = 28;
  }

  else if (__ROR8__(0x8F5C28F5C28F5C29LL * v9 + 0x51EB851EB851EB8LL, 2) <= 0x28F5C28F5C28F5CuLL)
  {
    if (__ROR8__(0x8F5C28F5C28F5C29LL * v9 + 0x51EB851EB851EB0LL, 4) >= 0xA3D70A3D70A3D7uLL) {
      char v10 = 28;
    }
    else {
      char v10 = 29;
    }
  }

  else
  {
    char v10 = 29;
  }

  BYTE1(v30) = v10;
  uint64_t v11 = -1LL;
  uint64_t v12 = a2 - 1;
  if (a2 >= 1
    && a1 - 13 >= 0xFFFFFFFFFFFFFFF4LL
    && (unint64_t)(v9 - 2039) >= 0xFFFFFFFFFFFFFFBBLL
    && a6 <= 0x3B
    && a5 <= 0x3B
    && a4 <= 0x17)
  {
    unint64_t v13 = a1 - 1;
    if (*((char *)&v30 + a1 - 1) >= a2)
    {
      if (a1 >= 2)
      {
        int v14 = &v30;
        do
        {
          uint64_t v15 = *(char *)v14;
          int v14 = (uint64_t *)((char *)v14 + 1);
          v12 += v15;
          --v13;
        }

        while (v13);
      }

      if (v9 >= 1971)
      {
        uint64_t v16 = 0LL;
        uint64x2_t v17 = (uint64x2_t)vdupq_n_s64(v9 - 1971);
        unint64_t v18 = (v9 - 1969) & 0xFFFFFFFFFFFFFFFELL;
        int64x2_t v19 = (int64x2_t)(unint64_t)v12;
        int64x2_t v20 = (int64x2_t)xmmword_18071FD20;
        int8x16_t v21 = (int8x16_t)vdupq_n_s64(3uLL);
        int8x16_t v22 = (int8x16_t)vdupq_n_s64(0x16DuLL);
        int8x16_t v23 = (int8x16_t)vdupq_n_s64(0x16EuLL);
        int64x2_t v24 = vdupq_n_s64(2uLL);
        do
        {
          int8x16_t v25 = (int8x16_t)v19;
          int64x2_t v19 = vaddq_s64( v19,  (int64x2_t)vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8((int8x16_t)v20, v21)), v23, v22));
          v16 += 2LL;
          int64x2_t v20 = vaddq_s64(v20, v24);
        }

        while (v18 != v16);
        uint64_t v12 = vaddvq_s64((int64x2_t)vbslq_s8( (int8x16_t)vcgtq_u64( (uint64x2_t)vorrq_s8( (int8x16_t)vdupq_n_s64(v16 - 2),  (int8x16_t)xmmword_18071FD30),  v17),  v25,  (int8x16_t)v19));
      }

      time_t v29 = 3600 * a4 + 60 * a5 + a6 + a7 + 86400 * v12;
      uint64_t v26 = localtime_r(&v29, &v28);
      if (!a8 || a8 == 2 && v26->tm_isdst) {
        v29 -= 3600LL;
      }
      return v29;
    }
  }

  return v11;
}

time_t sub_1806FD53C(time_t a1, uint64_t a2, uint64_t a3)
{
  time_t v11 = a1;
  if (!a3) {
    return 0LL;
  }
  uint64_t v5 = localtime_r(&v11, &v10);
  uint64_t v6 = v5->tm_mon + (uint64_t)(12 * v5->tm_year + 22800) + a3;
  time_t v7 = v11;
  time_t v8 = sub_1806FD2D0(v6 % 12 + 1, v5->tm_mday, v6 / 12, v5->tm_hour, v5->tm_min, v5->tm_sec, a2, 2);
  return sub_1806FD69C(v7, v8);
}

time_t sub_1806FD5E4(time_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  time_t v12 = a1 - a2;
  uint64_t v8 = (a5 - gmtime_r(&v12, &v11)->tm_wday + 7) % 7;
  BOOL v9 = a4 > 0;
  if (a3 == 2) {
    return sub_1806FD69C(a1, a1 + 604800 * (a4 - v9) + 86400 * v8);
  }
  else {
    return 604800 * (a4 - v9) + 86400 * v8;
  }
}

time_t sub_1806FD69C(time_t a1, time_t a2)
{
  time_t v6 = a2;
  time_t v7 = a1;
  int v2 = (localtime_r(&v7, &v5)->tm_hour + 1) % 24;
  uint64_t v3 = localtime_r(&v6, &v5);
  return v6 - v7 + 3600 * (v2 + 24 * ((v3->tm_hour + 1) / 24) - (v3->tm_hour + 1));
}

void *archive_write_new()
{
  time_t v0 = calloc(1uLL, 0x168uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    *time_t v0 = 0x1B0C5C0DELL;
    if ((byte_18C446620 & 1) == 0)
    {
      qword_18C446610 = (uint64_t)sub_1806FE274;
      unk_18C446618 = sub_1806FE2BC;
      qword_18C446600 = (uint64_t)sub_1806FE304;
      unk_18C446608 = sub_1806FE22C;
      qword_18C4465B8 = (uint64_t)sub_1806FE16C;
      unk_18C4465C0 = sub_1806FE328;
      qword_18C4465C8 = (uint64_t)sub_1806FE40C;
      unk_18C4465D0 = sub_1806FE554;
      qword_18C4465D8 = (uint64_t)sub_1806FE5B8;
      byte_18C446620 = 1;
    }

    v0[1] = &qword_18C4465B8;
    v0[30] = -4294957056LL;
    v0[24] = 1024LL;
    int v2 = calloc(1uLL, 0x400uLL);
    if (v2)
    {
      v1[23] = v2;
    }

    else
    {
      free(v1);
      return 0LL;
    }
  }

  return v1;
}

uint64_t archive_write_set_bytes_per_block( int *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4(a1, -1329217314, 1, "archive_write_set_bytes_per_block", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    uint64_t result = 0LL;
    a1[60] = a2;
  }

  return result;
}

uint64_t archive_write_get_bytes_per_block( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 0x7FFF, "archive_write_get_bytes_per_block", a5, a6, a7, a8);
  if ((_DWORD)result != -30) {
    return *(unsigned int *)(a1 + 240);
  }
  return result;
}

uint64_t archive_write_set_bytes_in_last_block( int *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4(a1, -1329217314, 0x7FFF, "archive_write_set_bytes_in_last_block", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    uint64_t result = 0LL;
    a1[61] = a2;
  }

  return result;
}

uint64_t archive_write_get_bytes_in_last_block( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 0x7FFF, "archive_write_get_bytes_in_last_block", a5, a6, a7, a8);
  if ((_DWORD)result != -30) {
    return *(unsigned int *)(a1 + 244);
  }
  return result;
}

uint64_t archive_write_set_skip_file( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 0x7FFF, "archive_write_set_skip_file", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    uint64_t result = 0LL;
    *(_DWORD *)(a1 + 160) = 1;
    *(void *)(a1 + 168) = a2;
    *(void *)(a1 + 176) = a3;
  }

  return result;
}

void *sub_1806FD99C(uint64_t a1)
{
  uint64_t result = calloc(1uLL, 0x60uLL);
  if (result)
  {
    result[1] = a1;
    *((_DWORD *)result + 23) = 1;
    uint64_t v3 = (void *)(a1 + 248);
    if (*(void *)(a1 + 248)) {
      uint64_t v3 = (void *)(*(void *)(a1 + 256) + 16LL);
    }
    *uint64_t v3 = result;
    *(void *)(a1 + 256) = result;
  }

  return result;
}

uint64_t sub_1806FD9F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 92) != 2) {
    return 4294967266LL;
  }
  if (a3)
  {
    tm v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 40);
    if (v5)
    {
      uint64_t result = v5(a1, a2, a3);
      *(void *)a1 += a3;
      return result;
    }

    return 4294967266LL;
  }

  return 0LL;
}

uint64_t sub_1806FDA50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 248);
  if (*(_DWORD *)(v3 + 92) != 2) {
    return 4294967266LL;
  }
  if (a3)
  {
    tm v5 = *(uint64_t (**)(void, uint64_t, uint64_t))(v3 + 40);
    if (v5)
    {
      uint64_t result = v5(*(void *)(a1 + 248), a2, a3);
      *(void *)v3 += a3;
      return result;
    }

    return 4294967266LL;
  }

  return 0LL;
}

uint64_t sub_1806FDAB0(void *a1, unint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  unint64_t v2 = a2;
  while (v2)
  {
    if (v2 >= a1[24]) {
      unint64_t v4 = a1[24];
    }
    else {
      unint64_t v4 = v2;
    }
    uint64_t v5 = a1[31];
    if (*(_DWORD *)(v5 + 92) != 2) {
      return 4294967266LL;
    }
    if (v4)
    {
      time_t v6 = *(uint64_t (**)(void, void, unint64_t))(v5 + 40);
      if (!v6) {
        return 4294967266LL;
      }
      uint64_t result = v6(a1[31], a1[23], v4);
      *(void *)v5 += v4;
    }

    else
    {
      uint64_t result = 0LL;
    }

    v2 -= v4;
    if ((result & 0x80000000) != 0) {
      return result;
    }
  }

  return 0LL;
}

uint64_t archive_write_open2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(a1 + 200) = a3;
  *(void *)(a1 + 208) = a4;
  *(void *)(a1 + 216) = a5;
  *(void *)(a1 + 224) = a6;
  *(void *)(a1 + 232) = a2;
  int v14 = sub_1806FD99C(a1);
  if (!v14) {
    return 4294967266LL;
  }
  v14[4] = sub_1806FDC58;
  v14[5] = sub_1806FDD90;
  v14[6] = sub_1806FDF24;
  v14[7] = sub_1806FE038;
  uint64_t v15 = sub_1806FE63C(*(void *)(a1 + 248));
  if ((int)v15 > -21)
  {
    *(_DWORD *)(a1 + 4) = 2;
    unint64_t v18 = *(uint64_t (**)(uint64_t))(a1 + 280);
    if (v18) {
      return v18(a1);
    }
    return v15;
  }

  int v16 = sub_1806FE098(a1);
  sub_1806FE118(a1);
  else {
    return v16;
  }
}

uint64_t sub_1806FDC58( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 8);
  else {
    int v14 = *(_DWORD *)(v9 + 240);
  }
  *(_DWORD *)(a1 + 84) = v14;
  uint64_t v15 = *(int **)(a1 + 8);
  if (sub_1806A93F4( v15,  -1329217314,  0x7FFF,  "archive_write_get_bytes_in_last_block",  v10,  v11,  v12,  v13) == -30) {
    int v16 = -30;
  }
  else {
    int v16 = v15[61];
  }
  *(_DWORD *)(a1 + 88) = v16;
  size_t v17 = *(int *)(a1 + 84);
  unint64_t v18 = calloc(1uLL, 0x20uLL);
  int64x2_t v19 = malloc(v17);
  int64x2_t v20 = v19;
  if (v18 && v19)
  {
    *((void *)v18 + 2) = v19;
    *((void *)v18 + 3) = v19;
    *(void *)unint64_t v18 = v17;
    *((void *)v18 + 1) = v17;
    *(void *)(a1 + 64) = v18;
    int8x16_t v21 = *(uint64_t (**)(void, void))(v9 + 200);
    if (v21)
    {
      uint64_t v22 = v21(*(void *)(a1 + 8), *(void *)(v9 + 232));
      if ((_DWORD)v22)
      {
        free(*((void **)v18 + 2));
        free(v18);
        *(void *)(a1 + 64) = 0LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    free(v18);
    free(v20);
    archive_set_error( *(_DWORD **)(a1 + 8),  12,  "Can't allocate data for output buffering",  v23,  v24,  v25,  v26,  v27,  v29);
    return 4294967266LL;
  }

  return v22;
}

uint64_t sub_1806FDD90(uint64_t a1, char *__src, uint64_t __n)
{
  int64_t v3 = __n;
  unint64_t v4 = __src;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 64);
  unint64_t v7 = *(void *)v6;
  if (!*(void *)v6)
  {
    if (__n >= 1)
    {
      while (1)
      {
        uint64_t v21 = (*(uint64_t (**)(uint64_t, void, char *, int64_t))(v5 + 208))( v5,  *(void *)(v5 + 232),  v4,  v3);
        if (v21 < 1) {
          break;
        }
        v4 += v21;
        BOOL v22 = v3 <= v21;
        v3 -= v21;
        if (v22) {
          return 0LL;
        }
      }

      return 4294967266LL;
    }

    return 0LL;
  }

  unint64_t v8 = *(void *)(v6 + 8);
  if (v8 >= v7) {
    goto LABEL_17;
  }
  size_t v9 = v8 >= __n ? __n : *(void *)(v6 + 8);
  memcpy(*(void **)(v6 + 24), __src, v9);
  *(void *)(v6 + 24) += v9;
  v3 -= v9;
  v4 += v9;
  unint64_t v7 = *(void *)v6;
  size_t v10 = *(void *)(v6 + 8) - v9;
  *(void *)(v6 + 8) = v10;
  if (v10)
  {
LABEL_17:
    while (v3 >= v7)
    {
      uint64_t v19 = (*(uint64_t (**)(uint64_t, void, char *, unint64_t))(v5 + 208))( v5,  *(void *)(v5 + 232),  v4,  v7);
      if (v19 < 1) {
        return 4294967266LL;
      }
      v4 += v19;
      v3 -= v19;
      unint64_t v7 = *(void *)v6;
    }

    if (v3 >= 1)
    {
      memcpy(*(void **)(v6 + 24), v4, v3);
      uint64_t result = 0LL;
      *(void *)(v6 + 24) += v3;
      *(void *)(v6 + 8) -= v3;
      return result;
    }

    return 0LL;
  }

  if (!v7)
  {
LABEL_14:
    *(void *)(v6 + 24) = *(void *)(v6 + 16);
    *(void *)(v6 + 8) = v7;
    goto LABEL_17;
  }

  uint64_t v11 = *(void *)(v6 + 16);
  while (1)
  {
    uint64_t v12 = (*(uint64_t (**)(uint64_t, void, uint64_t, unint64_t))(v5 + 208))( v5,  *(void *)(v5 + 232),  v11,  v7);
    if (v12 < 1) {
      return 4294967266LL;
    }
    BOOL v18 = v7 >= v12;
    v7 -= v12;
    if (!v18) {
      break;
    }
    v11 += v12;
    if (!v7)
    {
      unint64_t v7 = *(void *)v6;
      goto LABEL_14;
    }
  }

  archive_set_error((_DWORD *)v5, -1, "write overrun", v13, v14, v15, v16, v17, v23);
  return 4294967266LL;
}

uint64_t sub_1806FDF24(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  int64_t v3 = *(void **)(a1 + 64);
  unint64_t v4 = (void *)*((void *)v3 + 3);
  if (v4 == *((void **)v3 + 2))
  {
LABEL_16:
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v5 = *(void *)v3 - *((void *)v3 + 1);
    uint64_t v6 = *(unsigned int *)(v2 + 244);
    if ((int)v6 <= 0)
    {
      uint64_t v8 = *(int *)(v2 + 240);
      uint64_t v7 = v8;
    }

    else
    {
      uint64_t v7 = (v5 + v6 - 1) / v6 * v6;
      uint64_t v8 = *(int *)(v2 + 240);
    }

    if (v7 >= v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9 > v5)
    {
      bzero(v4, v9 - v5);
      uint64_t v5 = v9;
    }

    if (v5)
    {
      uint64_t v10 = *((void *)v3 + 2);
      while (1)
      {
        uint64_t v11 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 208))( v2,  *(void *)(v2 + 232),  v10,  v5);
        if (v11 < 1) {
          break;
        }
        BOOL v17 = v5 >= (unint64_t)v11;
        v5 -= v11;
        if (!v17)
        {
          archive_set_error((_DWORD *)v2, -1, "write overrun", v12, v13, v14, v15, v16, v20);
          break;
        }

        v10 += v11;
        if (!v5) {
          goto LABEL_16;
        }
      }

      uint64_t v5 = 4294967266LL;
    }
  }

  BOOL v18 = *(void (**)(uint64_t, void))(v2 + 216);
  if (v18) {
    v18(v2, *(void *)(v2 + 232));
  }
  free(*((void **)v3 + 2));
  free(v3);
  *(_DWORD *)(a1 + 92) = 4;
  return v5;
}

uint64_t sub_1806FE038(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = *(void (**)(void, void))(v1 + 224);
  if (v2) {
    v2(*(void *)(a1 + 8), *(void *)(v1 + 232));
  }
  *(void *)(v1 + 232) = 0LL;
  int64_t v3 = *(void **)(v1 + 336);
  if (v3)
  {
    size_t v4 = strlen(*(const char **)(v1 + 336));
    bzero(v3, v4);
    free(*(void **)(v1 + 336));
    *(void *)(v1 + 336) = 0LL;
  }

  return 0LL;
}

uint64_t sub_1806FE098(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 248);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = 0LL;
  do
  {
    if (*(_DWORD *)(v1 + 92) == 2)
    {
      int64_t v3 = *(uint64_t (**)(uint64_t))(v1 + 48);
      if (v3)
      {
        int v4 = v3(v1);
        else {
          uint64_t v2 = v4;
        }
        if (v4) {
          int v5 = 0x8000;
        }
        else {
          int v5 = 4;
        }
      }

      else
      {
        int v5 = 4;
      }

      *(_DWORD *)(v1 + 92) = v5;
    }

    uint64_t v1 = *(void *)(v1 + 16);
  }

  while (v1);
  return v2;
}

void *sub_1806FE118(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 248);
  if (result)
  {
    do
    {
      int64_t v3 = (void *)result[2];
      int v4 = (void (*)(void))result[7];
      if (v4)
      {
        v4();
        uint64_t result = *(void **)(a1 + 248);
      }

      free(result);
      *(void *)(a1 + 248) = v3;
      uint64_t result = v3;
    }

    while (v3);
  }

  *(void *)(a1 + 256) = 0LL;
  return result;
}

uint64_t archive_write_open( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return archive_write_open2(a1, a2, a3, a4, a5, 0LL, a7, a8);
}

uint64_t sub_1806FE16C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 0xFFFF, "archive_write_close", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    uint64_t result = 0LL;
    int v10 = *(_DWORD *)(a1 + 4);
    if (v10 != 1 && v10 != 32)
    {
      archive_clear_error(a1);
      else {
        int v12 = 0;
      }
      uint64_t v13 = *(uint64_t (**)(uint64_t))(a1 + 320);
      if (v13)
      {
        int v14 = v13(a1);
        if (v14 < v12) {
          int v12 = v14;
        }
      }

      LODWORD(result) = sub_1806FE098(a1);
      else {
        uint64_t result = result;
      }
      if (*(_DWORD *)(a1 + 4) != 0x8000) {
        *(_DWORD *)(a1 + 4) = 32;
      }
    }
  }

  return result;
}

uint64_t sub_1806FE22C(uint64_t a1, unsigned int a2)
{
  if (a2 == -1)
  {
    uint64_t v2 = *(void **)(a1 + 256);
  }

  else
  {
    if ((a2 & 0x80000000) != 0) {
      return -1LL;
    }
    uint64_t v2 = *(void **)(a1 + 248);
    if (a2 && v2)
    {
      do
      {
        uint64_t v2 = (void *)v2[2];
        if (a2 < 2) {
          break;
        }
        --a2;
      }

      while (v2);
    }
  }

  if (v2) {
    return *v2;
  }
  return -1LL;
}

uint64_t sub_1806FE274(uint64_t a1, unsigned int a2)
{
  if (a2 == -1)
  {
    uint64_t v2 = *(void *)(a1 + 256);
  }

  else
  {
    if ((a2 & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v2 = *(void *)(a1 + 248);
    if (a2 && v2)
    {
      do
      {
        uint64_t v2 = *(void *)(v2 + 16);
        if (a2 < 2) {
          break;
        }
        --a2;
      }

      while (v2);
    }
  }

  if (v2) {
    return *(unsigned int *)(v2 + 80);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_1806FE2BC(uint64_t a1, unsigned int a2)
{
  if (a2 == -1)
  {
    uint64_t v2 = *(void *)(a1 + 256);
  }

  else
  {
    if ((a2 & 0x80000000) != 0) {
      return 0LL;
    }
    uint64_t v2 = *(void *)(a1 + 248);
    if (a2 && v2)
    {
      do
      {
        uint64_t v2 = *(void *)(v2 + 16);
        if (a2 < 2) {
          break;
        }
        --a2;
      }

      while (v2);
    }
  }

  if (v2) {
    return *(void *)(v2 + 72);
  }
  return 0LL;
}

uint64_t sub_1806FE304(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 248);
  if (!v1) {
    return 0LL;
  }
  LODWORD(result) = 0;
  do
  {
    uint64_t result = (result + 1);
    uint64_t v1 = *(void *)(v1 + 16);
  }

  while (v1);
  return result;
}

uint64_t sub_1806FE328( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 0LL;
  }
  if (*(_DWORD *)(a1 + 4) == 0x8000) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = archive_write_close(a1);
  }
  int v10 = *(uint64_t (**)(uint64_t))(a1 + 328);
  if (v10)
  {
    int v11 = v10(a1);
    else {
      uint64_t v9 = v11;
    }
  }

  sub_1806FE118(a1);
  free(*(void **)(a1 + 184));
  sub_1806F755C(a1 + 64);
  int v12 = *(void **)(a1 + 336);
  if (v12)
  {
    size_t v13 = strlen(*(const char **)(a1 + 336));
    bzero(v12, v13);
    free(*(void **)(a1 + 336));
  }

  *(_DWORD *)a1 = 0;
  sub_1806FBDD8(a1);
  free((void *)a1);
  return v9;
}

uint64_t sub_1806FE40C( uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(void *)(a1 + 304))
  {
    archive_set_error( (_DWORD *)a1,  -1,  "Format must be set before you can write to an archive.",  v10,  v11,  v12,  v13,  v14,  v23);
LABEL_6:
    *(_DWORD *)(a1 + 4) = 0x8000;
    return 4294967266LL;
  }

  uint64_t v15 = archive_write_finish_entry(a1);
  uint64_t v16 = v15;
  if ((_DWORD)v15 == -30)
  {
    *(_DWORD *)(a1 + 4) = 0x8000;
    return v16;
  }

  if ((v15 & 0x80000000) != 0 && (_DWORD)v15 != -20) {
    return v16;
  }
  if (*(_DWORD *)(a1 + 160)
    && archive_entry_dev_is_set((uint64_t)a2)
    && archive_entry_ino_is_set((uint64_t)a2)
    && archive_entry_dev(a2) == *(_DWORD *)(a1 + 168)
    && archive_entry_ino64((uint64_t)a2) == *(void *)(a1 + 176))
  {
    archive_set_error((_DWORD *)a1, 0, "Can't add archive to itself", v18, v19, v20, v21, v22, v23);
    return 4294967271LL;
  }

  uint64_t result = (*(uint64_t (**)(uint64_t, _DWORD *))(a1 + 304))(a1, a2);
  if ((_DWORD)result == -25) {
    return result;
  }
  if ((_DWORD)result == -30) {
    goto LABEL_6;
  }
  else {
    uint64_t result = result;
  }
  *(_DWORD *)(a1 + 4) = 4;
  return result;
}

uint64_t sub_1806FE554( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 6, "archive_write_finish_entry", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    else {
      uint64_t result = 0LL;
    }
    *(_DWORD *)(a1 + 4) = 2;
  }

  return result;
}

uint64_t sub_1806FE5B8( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 >= 0x7FFFFFFF) {
    a3 = 0x7FFFFFFFLL;
  }
  archive_clear_error(a1);
  return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(a1 + 312))(a1, a2, a3);
}

uint64_t sub_1806FE63C(uint64_t a1)
{
  if (!*(void *)(a1 + 16) || (uint64_t result = sub_1806FE63C(), !(_DWORD)result))
  {
    if (*(_DWORD *)(a1 + 92) == 1)
    {
      int64_t v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
      int v4 = 2;
      if (v3)
      {
        uint64_t result = v3(a1);
        if ((_DWORD)result) {
          int v4 = 0x8000;
        }
        else {
          int v4 = 2;
        }
      }

      else
      {
        uint64_t result = 0LL;
      }

      *(_DWORD *)(a1 + 92) = v4;
    }

    else
    {
      return 4294967266LL;
    }
  }

  return result;
}

uint64_t archive_write_add_filter_zstd(int *a1)
{
  uint64_t v2 = sub_1806FD99C((uint64_t)a1);
  uint64_t result = sub_1806A93F4(a1, -1329217314, 1, "archive_write_add_filter_zstd", v3, v4, v5, v6);
  if ((_DWORD)result != -30)
  {
    uint64_t v8 = calloc(1uLL, 0x10uLL);
    if (v8)
    {
      uint64_t v14 = v8;
      v2[3] = sub_1806FE878;
      v2[4] = sub_1806FE798;
      v2[6] = sub_1806FE954;
      v2[7] = sub_1806FE960;
      *((_DWORD *)v2 + 20) = 14;
      v2[8] = v8;
      v2[9] = "zstd";
      _DWORD *v8 = 3;
      uint64_t v15 = sub_1806ACF24("zstd");
      v14[1] = v15;
      if (v15)
      {
        archive_set_error(a1, -1, "Using external zstd program", v16, v17, v18, v19, v20, v21);
        return 4294967276LL;
      }

      free(v14);
    }

    archive_set_error(a1, 12, "Out of memory", v9, v10, v11, v12, v13, v21);
    return 4294967266LL;
  }

  return result;
}

uint64_t sub_1806FE798(uint64_t a1)
{
  uint64_t v2 = *(unsigned int **)(a1 + 64);
  memset(v13, 0, sizeof(v13));
  sub_1806F7634(v13, "zstd --no-check", 0xFuLL);
  uint64_t v9 = (char *)*v2;
  memset(v12, 0, sizeof(v12));
  else {
    sub_1806FBA84(v12, " -%d", v3, v4, v5, v6, v7, v8, v9);
  }
  sub_1806F7484(v13, (uint64_t)v12);
  sub_1806F755C((uint64_t)v12);
  *(void *)(a1 + 40) = sub_1806FE998;
  uint64_t v10 = sub_1806AD024(a1, *((void *)v2 + 1), (char *)v13[0]);
  sub_1806F755C((uint64_t)v13);
  return v10;
}

uint64_t sub_1806FE878(uint64_t a1, char *__s1, const char *a3)
{
  uint64_t v4 = *(int **)(a1 + 64);
  if (strcmp(__s1, "compression-level")) {
    return 4294967276LL;
  }
  int v6 = atoi(a3);
  size_t v7 = strlen(a3);
  if (!v7) {
    return 4294967276LL;
  }
  size_t v8 = v7 - 1;
  if (v7 != 1)
  {
    int v9 = *(unsigned __int8 *)a3;
    if ((v9 - 48) < 0xA || v9 == 45 || v9 == 43)
    {
      uint64_t v10 = (unsigned __int8 *)(a3 + 1);
      while (1)
      {
        int v11 = *v10++;
        if (!--v8)
        {
          goto LABEL_16;
        }
      }
    }

    return 4294967276LL;
  }

  uint64_t result = 4294967276LL;
  if (*(unsigned __int8 *)a3 - 58 >= 0xFFFFFFF6 && (v6 - 23) >= 0xFFFFFF86)
  {
LABEL_16:
    uint64_t result = 0LL;
    *uint64_t v4 = v6;
  }

  return result;
}

uint64_t sub_1806FE954(uint64_t a1)
{
  return sub_1806AD290(a1, *(void *)(*(void *)(a1 + 64) + 8LL));
}

uint64_t sub_1806FE960(uint64_t a1)
{
  uint64_t v2 = *(void ****)(a1 + 64);
  sub_1806ACFE8(v2[1]);
  free(v2);
  *(void *)(a1 + 64) = 0LL;
  return 0LL;
}

uint64_t sub_1806FE998( uint64_t a1, char *__buf, uint64_t __nbyte, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1806AD0C4(a1, *(void *)(*(void *)(a1 + 64) + 8LL), __buf, __nbyte, a5, a6, a7, a8);
}

void *sub_1806FE9AC(void *result, uint64_t a2)
{
  *uint64_t result = 0LL;
  result[1] = a2;
  return result;
}

uint64_t sub_1806FE9B4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(a1[1] + 8);
    do
    {
      int v5 = v4(v2, a2);
      if (!v5) {
        break;
      }
      uint64_t v2 = *(void *)(v2 + 8LL * (v5 > 0));
    }

    while (v2);
  }

  return v2;
}

uint64_t sub_1806FEA0C(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (!*a1) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  int v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1[1] + 8);
  while (1)
  {
    int v6 = v5(v2, a2);
    if (!v6) {
      break;
    }
    if (v6 < 0) {
      uint64_t v4 = v2;
    }
    uint64_t v2 = *(void *)(v2 + 8LL * (v6 > 0));
    if (!v2) {
      return v4;
    }
  }

  return v2;
}

uint64_t sub_1806FEA7C(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (!*a1) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  int v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1[1] + 8);
  while (1)
  {
    int v6 = v5(v2, a2);
    if (!v6) {
      break;
    }
    if (v6 > 0) {
      uint64_t v4 = v2;
    }
    uint64_t v2 = *(void *)(v2 + 8LL * (v6 > 0));
    if (!v2) {
      return v4;
    }
  }

  return v2;
}

uint64_t sub_1806FEAEC(unint64_t a1, void *a2)
{
  uint64_t v4 = *(void ***)a1;
  if (*(void *)a1)
  {
    int v5 = **(uint64_t (***)(void **, void *))(a1 + 8);
    while (1)
    {
      unint64_t v6 = (unint64_t)v4;
      uint64_t result = v5(v4, a2);
      if (!(_DWORD)result) {
        break;
      }
      uint64_t v4 = *(void ***)(v6 + 8LL * ((int)result > 0));
      if (!v4)
      {
        unint64_t v8 = v6 & 0xFFFFFFFFFFFFFFFDLL;
        LODWORD(v4) = (int)result > 0;
        uint64_t v9 = 2LL;
        goto LABEL_9;
      }
    }
  }

  else
  {
    unint64_t v8 = a1 & 0xFFFFFFFFFFFFFFFDLL;
    unint64_t v6 = a1;
LABEL_8:
    uint64_t v9 = 0LL;
LABEL_9:
    unint64_t v10 = v9 | v8;
    if (v6 == a1)
    {
      *a2 = *(void *)(a1 + 8LL * v4);
      a2[1] = *(void *)(a1 + 8LL * v4);
      a2[2] = v10 & 0xFFFFFFFFFFFFFFFELL;
      *(void *)(a1 + 8LL * v4) = a2;
    }

    else
    {
      *a2 = *(void *)(v6 + 8LL * v4);
      int v11 = *(void **)(v6 + 8LL * v4);
      a2[2] = v10 | 1;
      uint64_t v12 = *(void **)(v6 + 16);
      a2[1] = v11;
      *(void *)(v6 + 8LL * v4) = a2;
      if ((v12 & 1) != 0)
      {
        unint64_t v13 = v6 & 0xFFFFFFFFFFFFFFFCLL;
        uint64_t v14 = (void *)((v6 & 0xFFFFFFFFFFFFFFFCLL) + 16);
        unint64_t v15 = *v14 & 0xFFFFFFFFFFFFFFFCLL;
        uint64_t v16 = *(void *)(v15 + 8);
        unsigned int v17 = v16 == v13;
        BOOL v18 = v16 != v13;
        uint64_t v19 = *(void *)(v15 + 8 * v18);
        if (v19 && (uint64_t v22 = *(void *)(v19 + 16), v20 = (unint64_t *)(v19 + 16), v21 = v22, (v22 & 1) != 0))
        {
          uint64_t v23 = *(void ***)a1;
          while (1)
          {
            unint64_t *v20 = v21 & 0xFFFFFFFFFFFFFFFELL;
            *v14 &= ~1uLL;
            if (v23 == (void **)v15) {
              break;
            }
            a2 = (void *)v15;
            uint64_t v24 = *(void *)(v15 + 16);
            *(void *)(v15 + 16) = v24 | 1;
            unint64_t v13 = v24 & 0xFFFFFFFFFFFFFFFCLL;
            if ((v24 & 0xFFFFFFFFFFFFFFFCLL) == 0) {
              break;
            }
            uint64_t v14 = (void *)(v13 + 16);
            uint64_t v25 = *(void *)(v13 + 16);
            if ((v25 & 1) == 0) {
              break;
            }
            unint64_t v15 = v25 & 0xFFFFFFFFFFFFFFFCLL;
            uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFFFCLL) + 8);
            unsigned int v17 = v26 == v13;
            BOOL v18 = v26 != v13;
            uint64_t v27 = *(void *)(v15 + 8 * v18);
            if (v27)
            {
              uint64_t v28 = *(void *)(v27 + 16);
              uint64_t v20 = (unint64_t *)(v27 + 16);
              uint64_t v21 = v28;
              if ((v28 & 1) != 0) {
                continue;
              }
            }

            goto LABEL_13;
          }
        }

        else
        {
LABEL_13:
          if (a2 == *(void **)(v13 + 8 * v18)) {
            sub_1806FEE84(v13, v18);
          }
          sub_1806FEE84(v15, v17);
          *(void *)(*(void *)a1 + 16LL) &= ~1uLL;
        }
      }
    }

    return 1LL;
  }

  return result;
}

unint64_t sub_1806FEC84(unint64_t result, void *a2)
{
  unint64_t v3 = result;
  if (!a2)
  {
    unint64_t v14 = MEMORY[0x10];
    goto LABEL_18;
  }

  uint64_t v4 = a2[1];
  if (!*a2)
  {
    if (v4) {
      goto LABEL_21;
    }
    unint64_t v14 = a2[2];
    if ((v14 & 1) != 0)
    {
      *(void *)((v14 & 0xFFFFFFFFFFFFFFFCLL) + 8 * ((v14 >> 1) & 1)) = 0LL;
      return result;
    }

unint64_t sub_1806FEE10(unint64_t *a1, unint64_t a2, unsigned int a3)
{
  if (!a2)
  {
    unint64_t v5 = *a1;
    if (*a1)
    {
      do
      {
        a2 = v5;
        unint64_t v5 = *(void *)(v5 + 8LL * a3);
      }

      while (v5);
      return a2;
    }

    return 0LL;
  }

  uint64_t v3 = a3 ^ 1;
  unint64_t v4 = *(void *)(a2 + 8LL * a3);
  if (v4)
  {
    do
    {
      a2 = v4;
      unint64_t v4 = *(void *)(v4 + 8 * v3);
    }

    while (v4);
    return a2;
  }

  if (*a1 == a2) {
    return 0LL;
  }
  while (1)
  {
    uint64_t v6 = *(void *)(a2 + 16);
    a2 = v6 & 0xFFFFFFFFFFFFFFFCLL;
    if (a2) {
      BOOL v7 = *a1 == a2;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      return 0LL;
    }
  }

  return a2;
}

uint64_t sub_1806FEE84(uint64_t result, unsigned int a2)
{
  uint64_t v2 = *(void *)(result + 8LL * a2);
  if (v2)
  {
    unint64_t v3 = *(void *)(result + 16);
    *(void *)((v3 & 0xFFFFFFFFFFFFFFFCLL) + 8 * ((v3 >> 1) & 1)) = v2;
    *(void *)(result + 8LL * a2) = *(void *)(v2 + 8LL * (a2 ^ 1));
    *(void *)(v2 + 8LL * (a2 ^ 1)) = result;
    *(void *)(v2 + 16) = v3 & 0xFFFFFFFFFFFFFFFCLL | *(void *)(v2 + 16) & 3LL;
    uint64_t v4 = *(void *)(result + 16) & 3LL | v2;
    *(void *)(result + 16) = v4;
    uint64_t v5 = *(void *)(v2 + 16);
    uint64_t v6 = (v5 ^ v4) & 3;
    *(void *)(v2 + 16) = v6 ^ v5;
    *(void *)(result + 16) = (*(void *)(result + 16) ^ v6) & 0xFFFFFFFFFFFFFFFDLL | (2LL * (a2 != 1));
    uint64_t v7 = *(void *)(result + 8LL * a2);
    if (v7) {
      *(void *)(v7 + 16) = *(void *)(v7 + 16) & 1LL | result & 0xFFFFFFFFFFFFFFFDLL | (2LL * (a2 != 0));
    }
  }

  return result;
}

void *sub_1806FEF24(void *result, unint64_t a2, unsigned int a3)
{
  uint64_t v5 = result;
  while (1)
  {
    uint64_t v6 = *(void *)(a2 + 8LL * a3);
    if (v6)
    {
      if ((*(_BYTE *)(v6 + 16) & 1) != 0) {
        return result;
      }
    }

    uint64_t v7 = a3 ^ 1;
    uint64_t result = *(void **)(a2 + 8LL * v7);
    if (!result) {
      return result;
    }
    uint64_t v8 = *(void *)(a2 + 16);
    if ((v8 & 1) != 0)
    {
      uint64_t v12 = (void *)(a2 + 8 * v7);
      goto LABEL_17;
    }

    if (*result && (*(_BYTE *)(*result + 16LL) & 1) != 0 || (uint64_t v9 = result[1]) != 0 && (*(_BYTE *)(v9 + 16) & 1) != 0)
    {
      uint64_t v12 = (void *)(a2 + 8 * v7);
LABEL_23:
      uint64_t v14 = result[v7];
      if (v14 && (*(_BYTE *)(v14 + 16) & 1) != 0
        || (uint64_t result = (void *)sub_1806FEE84((uint64_t)result, a3), (v14 = *(void *)(*v12 + 8 * v7)) != 0))
      {
        *(void *)(v14 + 16) &= ~1uLL;
        return (void *)sub_1806FEE84(a2, a3 ^ 1);
      }

      return result;
    }

    uint64_t v10 = result[2];
    if ((v10 & 1) != 0)
    {
      uint64_t v12 = (void *)(a2 + 8 * v7);
      sub_1806FEE84(a2, a3 ^ 1);
      uint64_t result = (void *)*v12;
      if (!*v12) {
        return result;
      }
      uint64_t v8 = *(void *)(a2 + 16);
      if ((v8 & 1) == 0) {
        goto LABEL_23;
      }
LABEL_17:
      if ((result[2] & 1) == 0 && (!*result || (*(_BYTE *)(*result + 16LL) & 1) == 0))
      {
        uint64_t v13 = result[1];
        if (!v13 || (*(_BYTE *)(v13 + 16) & 1) == 0)
        {
          *(void *)(a2 + 16) = v8 & 0xFFFFFFFFFFFFFFFELL;
          result[2] |= 1uLL;
          return result;
        }
      }

      goto LABEL_23;
    }

    result[2] = v10 | 1;
    if (*v5 == a2) {
      return result;
    }
    uint64_t v11 = *(void *)(a2 + 16);
    a3 = (v11 >> 1) & 1;
    a2 = v11 & 0xFFFFFFFFFFFFFFFCLL;
  }

uint64_t sub_1806FF078(CC_MD5_CTX *a1)
{
  return 0LL;
}

uint64_t sub_1806FF090(CC_MD5_CTX *a1, const void *a2, CC_LONG a3)
{
  return 0LL;
}

uint64_t sub_1806FF0A8(CC_MD5_CTX *c, unsigned __int8 *md)
{
  return 0LL;
}

uint64_t sub_1806FF0CC()
{
  return 4294967271LL;
}

uint64_t sub_1806FF0D4()
{
  return 4294967271LL;
}

uint64_t sub_1806FF0DC()
{
  return 4294967271LL;
}

uint64_t sub_1806FF0E4(CC_SHA1_CTX *a1)
{
  return 0LL;
}

uint64_t sub_1806FF0FC(CC_SHA1_CTX *a1, const void *a2, CC_LONG a3)
{
  return 0LL;
}

uint64_t sub_1806FF114(CC_SHA1_CTX *c, unsigned __int8 *md)
{
  return 0LL;
}

uint64_t sub_1806FF138(CC_SHA256_CTX *a1)
{
  return 0LL;
}

uint64_t sub_1806FF150(CC_SHA256_CTX *a1, const void *a2, CC_LONG a3)
{
  return 0LL;
}

uint64_t sub_1806FF168(CC_SHA256_CTX *c, unsigned __int8 *md)
{
  return 0LL;
}

uint64_t sub_1806FF18C(CC_SHA512_CTX *a1)
{
  return 0LL;
}

uint64_t sub_1806FF1A4(CC_SHA512_CTX *a1, const void *a2, CC_LONG a3)
{
  return 0LL;
}

uint64_t sub_1806FF1BC(CC_SHA512_CTX *c, unsigned __int8 *md)
{
  return 0LL;
}

uint64_t sub_1806FF1E0(CC_SHA512_CTX *a1)
{
  return 0LL;
}

uint64_t sub_1806FF1F8(CC_SHA512_CTX *a1, const void *a2, CC_LONG a3)
{
  return 0LL;
}

uint64_t sub_1806FF210(CC_SHA512_CTX *c, unsigned __int8 *md)
{
  return 0LL;
}

uint64_t archive_write_disk_set_standard_lookup(uint64_t a1)
{
  uint64_t v2 = calloc(0x7FuLL, 0x10uLL);
  unint64_t v3 = calloc(0x7FuLL, 0x10uLL);
  uint64_t v8 = v3;
  if (v2 && v3)
  {
    archive_write_disk_set_group_lookup(a1, (uint64_t)v3, (uint64_t)sub_1806FF2D4, (uint64_t)sub_1806FF464, v4, v5, v6, v7);
    archive_write_disk_set_user_lookup( a1,  (uint64_t)v2,  (uint64_t)sub_1806FF49C,  (uint64_t)sub_1806FF464,  v9,  v10,  v11,  v12);
    return 0LL;
  }

  else
  {
    free(v2);
    free(v8);
    return 4294967266LL;
  }

uint64_t sub_1806FF2D4(uint64_t a1, char *__s1, uint64_t gr_gid)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (__s1)
  {
    LOBYTE(v5) = *__s1;
    if (*__s1)
    {
      signed int v7 = 0;
      uint64_t v8 = 1LL;
      do
      {
        int v9 = 16 * v7 + (char)v5;
        if ((v9 & 0xF0000000) != 0) {
          signed int v7 = v9 & 0xFFFFFFF ^ ((v9 & 0xF0000000) >> 24);
        }
        else {
          signed int v7 = v9;
        }
        int v5 = __s1[v8++];
      }

      while (v5);
      uint64_t v10 = ((unint64_t)v7 * (unsigned __int128)0x204081020408103uLL) >> 64;
      unint64_t v11 = -127LL * ((v10 + ((unint64_t)(v7 - v10) >> 1)) >> 6) + v7;
      uint64_t v12 = a1 + 16 * v11;
      uint64_t v13 = *(char **)v12;
      if (*(void *)v12 && *(_DWORD *)(v12 + 8) == v7 && !strcmp(__s1, *(const char **)v12))
      {
        return *(unsigned int *)(a1 + 16 * v11 + 12);
      }

      else
      {
        free(v13);
        uint64_t v14 = 0LL;
        *(void *)uint64_t v12 = strdup(__s1);
        *(_DWORD *)(v12 + 8) = v7;
        unint64_t v15 = &v20;
        size_t v16 = 128LL;
        do
        {
          uint64_t v18 = &v19;
          if (getgrnam_r(__s1, &v19, v15, v16, &v18) != 34) {
            break;
          }
          v16 *= 2LL;
          free(v14);
          unint64_t v15 = (char *)malloc(v16);
          uint64_t v14 = v15;
        }

        while (v15);
        if (v18) {
          gr_gid = v18->gr_gid;
        }
        free(v14);
        *(_DWORD *)(a1 + 16 * v11 + 12) = gr_gid;
      }
    }
  }

  return gr_gid;
}

void sub_1806FF464(char *a1)
{
  for (uint64_t i = 0LL; i != 2032; i += 16LL)
    free(*(void **)&a1[i]);
  free(a1);
}

uint64_t sub_1806FF49C(uint64_t a1, char *__s1, uint64_t pw_uid)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (__s1)
  {
    LOBYTE(v5) = *__s1;
    if (*__s1)
    {
      signed int v7 = 0;
      uint64_t v8 = 1LL;
      do
      {
        int v9 = 16 * v7 + (char)v5;
        if ((v9 & 0xF0000000) != 0) {
          signed int v7 = v9 & 0xFFFFFFF ^ ((v9 & 0xF0000000) >> 24);
        }
        else {
          signed int v7 = v9;
        }
        int v5 = __s1[v8++];
      }

      while (v5);
      uint64_t v10 = ((unint64_t)v7 * (unsigned __int128)0x204081020408103uLL) >> 64;
      unint64_t v11 = -127LL * ((v10 + ((unint64_t)(v7 - v10) >> 1)) >> 6) + v7;
      uint64_t v12 = a1 + 16 * v11;
      uint64_t v13 = *(char **)v12;
      if (*(void *)v12 && *(_DWORD *)(v12 + 8) == v7 && !strcmp(__s1, *(const char **)v12))
      {
        return *(unsigned int *)(a1 + 16 * v11 + 12);
      }

      else
      {
        free(v13);
        uint64_t v14 = 0LL;
        *(void *)uint64_t v12 = strdup(__s1);
        *(_DWORD *)(v12 + 8) = v7;
        unint64_t v15 = &v20;
        size_t v16 = 128LL;
        do
        {
          uint64_t v18 = &v19;
          if (getpwnam_r(__s1, &v19, v15, v16, &v18) != 34) {
            break;
          }
          v16 *= 2LL;
          free(v14);
          unint64_t v15 = (char *)malloc(v16);
          uint64_t v14 = v15;
        }

        while (v15);
        if (v18) {
          pw_uid = v18->pw_uid;
        }
        free(v14);
        *(_DWORD *)(a1 + 16 * v11 + 12) = pw_uid;
      }
    }
  }

  return pw_uid;
}

uint64_t archive_write_add_filter_lz4(int *a1)
{
  uint64_t v2 = sub_1806FD99C((uint64_t)a1);
  uint64_t result = sub_1806A93F4(a1, -1329217314, 1, "archive_write_add_filter_lz4", v3, v4, v5, v6);
  if ((_DWORD)result != -30)
  {
    uint64_t v8 = calloc(1uLL, 0x10uLL);
    if (v8)
    {
      uint64_t v14 = v8;
      _DWORD *v8 = 1;
      *((_WORD *)v8 + 2) = v8[1] & 0xFC01 | 0x3A6;
      v2[6] = sub_1806FF8A0;
      v2[7] = sub_1806FF8AC;
      v2[3] = sub_1806FF734;
      v2[4] = sub_1806FF8DC;
      *((_DWORD *)v2 + 20) = 13;
      v2[8] = v8;
      v2[9] = "lz4";
      unint64_t v15 = sub_1806ACF24("lz4");
      v14[1] = v15;
      if (v15)
      {
        *(_DWORD *)uint64_t v14 = 0;
        archive_set_error(a1, -1, "Using external lz4 program", v16, v17, v18, v19, v20, v21);
        return 4294967276LL;
      }

      free(v14);
    }

    archive_set_error(a1, 12, "Out of memory", v9, v10, v11, v12, v13, v21);
    return 4294967266LL;
  }

  return result;
}

uint64_t sub_1806FF734(uint64_t a1, char *__s1, unsigned __int8 *a3)
{
  uint64_t v6 = *(void *)(a1 + 64);
  if (strcmp(__s1, "compression-level"))
  {
    uint64_t result = strcmp(__s1, "stream-checksum");
    if (!(_DWORD)result)
    {
      __int16 v13 = *(_WORD *)(v6 + 4) & 0xFFDF | (32 * (a3 != 0LL));
      goto LABEL_14;
    }

    uint64_t result = strcmp(__s1, "block-checksum");
    if (!(_DWORD)result)
    {
      __int16 v13 = *(_WORD *)(v6 + 4) & 0xFFF7 | (8 * (a3 != 0LL));
      goto LABEL_14;
    }

    if (!strcmp(__s1, "block-size"))
    {
      if (a3 && (*a3 & 0xFC) == 0x34 && !a3[1])
      {
        uint64_t result = 0LL;
        __int16 v13 = *(_WORD *)(v6 + 4) & 0xFC7F | ((*a3 & 7) << 7);
        goto LABEL_14;
      }
    }

    else
    {
      uint64_t result = strcmp(__s1, "block-dependence");
      if (!(_DWORD)result)
      {
        __int16 v13 = *(_WORD *)(v6 + 4) & 0xFFFB | (4 * (a3 == 0LL));
LABEL_14:
        *(_WORD *)(v6 + 4) = v13;
        return result;
      }
    }

    return 4294967276LL;
  }

  if (!a3) {
    return 4294967276LL;
  }
  int v14 = (char)*a3;
  if (*a3 < 0x33u)
  {
    uint64_t result = 0LL;
    *(_DWORD *)uint64_t v6 = v14 - 48;
  }

  else
  {
    archive_set_error( *(_DWORD **)(a1 + 8),  22,  "High compression not included in this build",  v7,  v8,  v9,  v10,  v11,  v15);
    return 4294967266LL;
  }

  return result;
}

uint64_t sub_1806FF8A0(uint64_t a1)
{
  return sub_1806AD290(a1, *(void *)(*(void *)(a1 + 64) + 8LL));
}

uint64_t sub_1806FF8AC(uint64_t a1)
{
  uint64_t v1 = *(void ****)(a1 + 64);
  sub_1806ACFE8(v1[1]);
  free(v1);
  return 0LL;
}

uint64_t sub_1806FF8DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  memset(v6, 0, sizeof(v6));
  sub_1806F7634(v6, "lz4 -z -q -q", 0xCuLL);
  if (*(int *)v2 >= 1)
  {
    sub_1806F76CC(v6, " -");
    sub_1806F76DC(v6, *(_BYTE *)v2 + 48);
  }

  sub_1806F76CC(v6, " -B");
  sub_1806F76DC(v6, (*(unsigned __int16 *)(v2 + 4) >> 7) & 7 | 0x30);
  __int16 v3 = *(_WORD *)(v2 + 4);
  if ((v3 & 8) == 0)
  {
    if ((v3 & 0x20) != 0) {
      goto LABEL_5;
    }
LABEL_9:
    sub_1806F76CC(v6, " --no-frame-crc");
    if ((*(_WORD *)(v2 + 4) & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  sub_1806F76CC(v6, " -BX");
  __int16 v3 = *(_WORD *)(v2 + 4);
  if ((v3 & 0x20) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((v3 & 4) == 0) {
LABEL_6:
  }
    sub_1806F76CC(v6, " -BD");
LABEL_7:
  *(void *)(a1 + 40) = sub_1806FF9F4;
  uint64_t v4 = sub_1806AD024(a1, *(void *)(v2 + 8), (char *)v6[0]);
  sub_1806F755C((uint64_t)v6);
  return v4;
}

uint64_t sub_1806FF9F4( uint64_t a1, char *__buf, uint64_t __nbyte, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1806AD0C4(a1, *(void *)(*(void *)(a1 + 64) + 8LL), __buf, __nbyte, a5, a6, a7, a8);
}

uint64_t archive_write_open_fd(_DWORD *a1, int a2)
{
  uint64_t v4 = malloc(4uLL);
  if (v4)
  {
    *uint64_t v4 = a2;
    return archive_write_open2( (uint64_t)a1,  (uint64_t)v4,  (uint64_t)sub_1806FFA80,  (uint64_t)sub_1806FFB54,  0LL,  (uint64_t)sub_1806FFBC8,  v8,  v9);
  }

  else
  {
    archive_set_error(a1, 12, "No memory", v5, v6, v7, v8, v9, v11);
    return 4294967266LL;
  }

uint64_t sub_1806FFA80(int *a1, int *a2)
{
  if (fstat(*a2, &v27))
  {
    uint64_t v11 = __error();
    archive_set_error(a1, *v11, "Couldn't stat fd %d", v12, v13, v14, v15, v16, (char *)*a2);
    return 4294967266LL;
  }

  else
  {
    if ((v27.st_mode & 0xF000) == 0x8000) {
      archive_write_set_skip_file((uint64_t)a1, v27.st_dev, v27.st_ino, v6, v7, v8, v9, v10);
    }
    if ((archive_write_get_bytes_in_last_block((uint64_t)a1, v4, v5, v6, v7, v8, v9, v10) & 0x80000000) != 0)
    {
      int v24 = v27.st_mode & 0xF000;
      if (v24 == 4096 || v24 == 0x2000 || v24 == 24576 || *a2 == 1)
      {
        uint64_t v25 = a1;
        int v26 = 0;
      }

      else
      {
        uint64_t v25 = a1;
        int v26 = 1;
      }

      archive_write_set_bytes_in_last_block(v25, v26, v18, v19, v20, v21, v22, v23);
    }

    return 0LL;
  }

ssize_t sub_1806FFB54(_DWORD *a1, int *a2, void *__buf, size_t __nbyte)
{
  while (1)
  {
    ssize_t result = write(*a2, __buf, __nbyte);
    if (result > 0) {
      break;
    }
    if (*__error() != 4)
    {
      uint64_t v9 = __error();
      archive_set_error(a1, *v9, "Write error", v10, v11, v12, v13, v14, v15);
      return -1LL;
    }
  }

  return result;
}

uint64_t sub_1806FFBC8(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
  return 0LL;
}

uint64_t archive_write_set_compression_bzip2(int *a1)
{
  return archive_write_add_filter_bzip2(a1);
}

uint64_t archive_write_add_filter_bzip2(int *a1)
{
  uint64_t v2 = sub_1806FD99C((uint64_t)a1);
  uint64_t result = sub_1806A93F4(a1, -1329217314, 1, "archive_write_add_filter_bzip2", v3, v4, v5, v6);
  if ((_DWORD)result != -30)
  {
    uint64_t v8 = calloc(1uLL, 0x70uLL);
    if (v8)
    {
      uint64_t v14 = v8;
      uint64_t result = 0LL;
      *uint64_t v14 = 9;
      v2[6] = sub_1806FFD38;
      v2[7] = sub_1806FFDB4;
      v2[3] = sub_1806FFCCC;
      v2[4] = sub_1806FFDEC;
      *((_DWORD *)v2 + 20) = 2;
      v2[8] = v14;
      v2[9] = "bzip2";
    }

    else
    {
      archive_set_error(a1, 12, "Out of memory", v9, v10, v11, v12, v13, v15);
      return 4294967266LL;
    }
  }

  return result;
}

uint64_t sub_1806FFCCC(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v4 = *(int **)(a1 + 64);
  int v5 = strcmp(__s1, "compression-level");
  uint64_t result = 4294967276LL;
  if (a3)
  {
    if (!v5)
    {
      unsigned int v7 = *a3;
      if (v7 - 48 <= 9 && !a3[1])
      {
        uint64_t result = 0LL;
        if (v7 < 0x31) {
          int v8 = 1;
        }
        else {
          int v8 = v7 - 48;
        }
        *uint64_t v4 = v8;
      }
    }
  }

  return result;
}

uint64_t sub_1806FFD38(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = sub_1806FFF80(a1, v2, 1);
  if (!(_DWORD)v3) {
    uint64_t v3 = sub_1806FD9F0(*(void *)(a1 + 16), *(void *)(v2 + 96), *(void *)(v2 + 104) - *(unsigned int *)(v2 + 40));
  }
  if (BZ2_bzCompressEnd((bz_stream *)(v2 + 8)))
  {
    archive_set_error(*(_DWORD **)(a1 + 8), 22, "Failed to clean up compressor", v4, v5, v6, v7, v8, v10);
    return 4294967266LL;
  }

  return v3;
}

uint64_t sub_1806FFDB4(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 64);
  free(v2[12]);
  free(v2);
  *(void *)(a1 + 64) = 0LL;
  return 0LL;
}

uint64_t sub_1806FFDEC( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1[8];
  uint64_t v10 = *(void **)(v9 + 96);
  if (v10) {
    goto LABEL_8;
  }
  uint64_t v11 = (_DWORD *)a1[1];
  if (*v11 != -1329217314) {
    goto LABEL_6;
  }
  size_t v12 = (int)archive_write_get_bytes_per_block((uint64_t)v11, a2, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)v12) {
    size_t v12 = 0x10000uLL / (int)v12 * (int)v12;
  }
  else {
LABEL_6:
  }
    size_t v12 = 0x10000LL;
LABEL_7:
  *(void *)(v9 + 104) = v12;
  uint64_t v10 = malloc(v12);
  *(void *)(v9 + 96) = v10;
  if (!v10)
  {
    uint64_t v25 = (_DWORD *)a1[1];
    int v26 = "Can't allocate data for compression buffer";
LABEL_18:
    int v27 = 12;
    goto LABEL_19;
  }

uint64_t sub_1806FFF40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 64);
  *(void *)(v3 + 88) += a3;
  *(void *)(v3 + 8) = a2;
  *(_DWORD *)(v3 + 16) = a3;
  else {
    return 0LL;
  }
}

uint64_t sub_1806FFF80(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = (bz_stream *)(a2 + 8);
  do
  {
    while (1)
    {
      if (*(_DWORD *)(a2 + 40))
      {
        if (a3) {
          goto LABEL_4;
        }
      }

      else
      {
        uint64_t v8 = *(void *)(a2 + 104);
        *(void *)(a2 + 32) = *(void *)(a2 + 96);
        *(_DWORD *)(a2 + 40) = v8;
        if (a3)
        {
LABEL_4:
          int v7 = 2;
          goto LABEL_8;
        }
      }

      int v7 = 0;
      uint64_t result = 0LL;
      if (!*(_DWORD *)(a2 + 16)) {
        return result;
      }
LABEL_8:
      uint64_t v10 = (char *)BZ2_bzCompress(v6, v7);
      if ((_DWORD)v10 != 1) {
        break;
      }
      if (!a3 && !*(_DWORD *)(a2 + 16)) {
        return 0LL;
      }
    }
  }

  while ((_DWORD)v10 == 3);
  if ((_DWORD)v10 == 4) {
    return 0LL;
  }
  archive_set_error( *(_DWORD **)(a1 + 8),  22,  "Bzip2 compression failed; BZ2_bzCompress() returned %d",
    v11,
    v12,
    v13,
    v14,
    v15,
    v10);
  return 4294967266LL;
}

uint64_t archive_write_set_compression_gzip(int *a1)
{
  return archive_write_add_filter_gzip(a1);
}

uint64_t archive_write_add_filter_gzip(int *a1)
{
  uint64_t v2 = sub_1806FD99C((uint64_t)a1);
  uint64_t result = sub_1806A93F4(a1, -1329217314, 1, "archive_write_add_filter_gzip", v3, v4, v5, v6);
  if ((_DWORD)result != -30)
  {
    uint64_t v8 = calloc(1uLL, 0x98uLL);
    if (v8)
    {
      uint64_t v14 = v8;
      uint64_t result = 0LL;
      v2[3] = sub_180700360;
      v2[4] = sub_180700144;
      v2[6] = sub_1807003F4;
      v2[7] = sub_1807004C8;
      *((_DWORD *)v2 + 20) = 1;
      v2[8] = v14;
      v2[9] = "gzip";
      *uint64_t v14 = -1;
    }

    else
    {
      archive_set_error(a1, 12, "Out of memory", v9, v10, v11, v12, v13, v15);
      return 4294967266LL;
    }
  }

  return result;
}

uint64_t sub_180700144( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1[8];
  if (*(void *)(v9 + 128)) {
    goto LABEL_8;
  }
  uint64_t v10 = (_DWORD *)a1[1];
  if (*v10 != -1329217314) {
    goto LABEL_6;
  }
  size_t v11 = (int)archive_write_get_bytes_per_block((uint64_t)v10, a2, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)v11) {
    size_t v11 = 0x10000uLL / (int)v11 * (int)v11;
  }
  else {
LABEL_6:
  }
    size_t v11 = 0x10000LL;
LABEL_7:
  *(void *)(v9 + 136) = v11;
  uint64_t v12 = malloc(v11);
  *(void *)(v9 + 128) = v12;
  if (!v12)
  {
    uint64_t v28 = (_DWORD *)a1[1];
    time_t v29 = "Can't allocate data for compression buffer";
LABEL_24:
    int v30 = 12;
    goto LABEL_25;
  }

uint64_t sub_180700360(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5 = *(unsigned int **)(a1 + 64);
  if (!strcmp(__s1, "compression-level"))
  {
    if (a3)
    {
      unsigned int v8 = *a3 - 48;
      if (v8 <= 9 && !a3[1])
      {
        uint64_t result = 0LL;
        *uint64_t v5 = v8;
        return result;
      }
    }

    return 4294967276LL;
  }

  uint64_t result = strcmp(__s1, "timestamp");
  if ((_DWORD)result) {
    return 4294967276LL;
  }
  if (a3) {
    int v7 = 1;
  }
  else {
    int v7 = -1;
  }
  v5[1] = v7;
  return result;
}

uint64_t sub_1807003F4(uint64_t a1)
{
  v11[1] = *(char **)MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = sub_18070055C(a1, v2, 1);
  if (!(_DWORD)v3)
  {
    uint64_t v3 = sub_1806FD9F0(*(void *)(a1 + 16), *(void *)(v2 + 128), *(void *)(v2 + 136) - *(unsigned int *)(v2 + 40));
    if (!(_DWORD)v3)
    {
      uint64_t v4 = *(void *)(v2 + 120);
      LODWORD(v11[0]) = *(void *)(v2 + 144);
      HIDWORD(v11[0]) = v4;
      uint64_t v3 = sub_1806FD9F0(*(void *)(a1 + 16), (uint64_t)v11, 8LL);
    }
  }

  if (deflateEnd((z_streamp)(v2 + 8)))
  {
    archive_set_error(*(_DWORD **)(a1 + 8), -1, "Failed to clean up compressor", v5, v6, v7, v8, v9, v11[0]);
    return 4294967266LL;
  }

  return v3;
}

uint64_t sub_1807004C8(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 64);
  free(v2[16]);
  free(v2);
  *(void *)(a1 + 64) = 0LL;
  return 0LL;
}

uint64_t sub_180700500(uint64_t a1, const Bytef *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 64);
  *(void *)(v6 + 144) = crc32(*(void *)(v6 + 144), a2, a3);
  *(void *)(v6 + 120) += a3;
  *(void *)(v6 + 8) = a2;
  *(_DWORD *)(v6 + 16) = a3;
  return sub_18070055C(a1, v6, 0);
}

uint64_t sub_18070055C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = (z_stream *)(a2 + 8);
  while (1)
  {
    if (*(_DWORD *)(a2 + 40))
    {
      if (a3) {
        goto LABEL_4;
      }
    }

    else
    {
      uint64_t v8 = *(void *)(a2 + 136);
      *(void *)(a2 + 32) = *(void *)(a2 + 128);
      *(_DWORD *)(a2 + 40) = v8;
      if (a3)
      {
LABEL_4:
        int v7 = 4;
        goto LABEL_8;
      }
    }

    int v7 = 0;
    uint64_t result = 0LL;
    if (!*(_DWORD *)(a2 + 16)) {
      return result;
    }
LABEL_8:
    uint64_t v10 = (char *)deflate(v6, v7);
    if ((_DWORD)v10) {
      break;
    }
    if (!a3 && !*(_DWORD *)(a2 + 16)) {
      return 0LL;
    }
  }

  if ((_DWORD)v10 == 1) {
    return 0LL;
  }
  archive_set_error( *(_DWORD **)(a1 + 8),  -1,  "GZip compression failed: deflate() call returned status %d",  v11,  v12,  v13,  v14,  v15,  v10);
  return 4294967266LL;
}

uint64_t archive_write_open_FILE(_DWORD *a1, uint64_t a2)
{
  uint64_t v4 = malloc(8uLL);
  if (v4)
  {
    *uint64_t v4 = a2;
    return archive_write_open2( (uint64_t)a1,  (uint64_t)v4,  (uint64_t)sub_18070069C,  (uint64_t)sub_1807006A4,  0LL,  (uint64_t)sub_180700718,  v8,  v9);
  }

  else
  {
    archive_set_error(a1, 12, "No memory", v5, v6, v7, v8, v9, v11);
    return 4294967266LL;
  }

uint64_t sub_18070069C()
{
  return 0LL;
}

size_t sub_1807006A4(_DWORD *a1, FILE **a2, void *__ptr, size_t __nitems)
{
  while (1)
  {
    size_t result = fwrite(__ptr, 1uLL, __nitems, *a2);
    if (result) {
      break;
    }
    if (*__error() != 4)
    {
      uint64_t v9 = __error();
      archive_set_error(a1, *v9, "Write error", v10, v11, v12, v13, v14, v15);
      return -1LL;
    }
  }

  return result;
}

uint64_t sub_180700718(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
  return 0LL;
}

uint64_t archive_write_open_filename(_DWORD *a1, char *a2)
{
  if (a2 && *a2) {
    return sub_18070075C(a1, 1, a2);
  }
  else {
    return archive_write_open_fd(a1, 1);
  }
}

uint64_t sub_18070075C(_DWORD *a1, int a2, char *a3)
{
  uint64_t v6 = calloc(1uLL, 0x70uLL);
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v12 = v6;
  uint64_t v13 = (uint64_t)(v6 + 2);
  if (a2)
  {
    if ((sub_1806F8744(v13, a3) & 0x80000000) == 0)
    {
LABEL_4:
      *uint64_t v12 = -1;
      return archive_write_open2( (uint64_t)a1,  (uint64_t)v12,  (uint64_t)sub_180700880,  (uint64_t)sub_180700A20,  (uint64_t)sub_180700A94,  (uint64_t)sub_180700AC0,  v14,  v15);
    }
  }

  else if ((sub_1806F87E8(v13, (__int32 *)a3) & 0x80000000) == 0)
  {
    goto LABEL_4;
  }

  if (*__error() != 12)
  {
    if (a2) {
      archive_set_error(a1, -1, "Can't convert '%s' to WCS", v7, v8, v9, v10, v11, a3);
    }
    else {
      archive_set_error(a1, -1, "Can't convert '%S' to MBS", v7, v8, v9, v10, v11, a3);
    }
    return 4294967271LL;
  }

  else
  {
LABEL_7:
    archive_set_error(a1, 12, "No memory", v7, v8, v9, v10, v11, v17);
    return 4294967266LL;
  }

uint64_t archive_write_open_filename_w(_DWORD *a1, char *a2)
{
  if (a2 && *(_DWORD *)a2) {
    return sub_18070075C(a1, 0, a2);
  }
  else {
    return archive_write_open_fd(a1, 1);
  }
}

uint64_t sub_180700880(int *a1, int *a2)
{
  int v44 = 0LL;
  uint64_t v45 = 0LL;
  uint64_t v4 = (uint64_t)(a2 + 2);
  if (sub_1806F84E8((uint64_t)a1, (uint64_t)(a2 + 2), &v44))
  {
    if (*__error() == 12)
    {
      int v5 = *__error();
      uint64_t v11 = "No memory";
LABEL_21:
      archive_set_error(a1, v5, v11, v6, v7, v8, v9, v10, v43);
      return 4294967266LL;
    }

    sub_1806F85E4((uint64_t)a1, v4, &v45);
    int v27 = *__error();
    archive_set_error(a1, v27, "Can't convert '%S' to MBS", v28, v29, v30, v31, v32, v45);
    return 4294967266LL;
  }

  uint64_t v12 = open(v44, 16778753, 438LL);
  *a2 = v12;
  sub_1806FC024(v12);
  if (*a2 < 0)
  {
    unint64_t v33 = v44;
    int v5 = *__error();
    if (!v33)
    {
      v43 = 0LL;
      uint64_t v11 = "Failed to open '%S'";
      goto LABEL_21;
    }

    archive_set_error(a1, v5, "Failed to open '%s'", v6, v7, v8, v9, v10, v44);
    return 4294967266LL;
  }

  if (fstat(*a2, &v46))
  {
    char v20 = v44;
    int v21 = *__error();
    if (v20) {
      archive_set_error(a1, v21, "Couldn't stat '%s'", v22, v23, v24, v25, v26, v44);
    }
    else {
      archive_set_error(a1, v21, "Couldn't stat '%S'", v22, v23, v24, v25, v26, 0LL);
    }
    return 4294967266LL;
  }

  if ((archive_write_get_bytes_in_last_block((uint64_t)a1, v13, v14, v15, v16, v17, v18, v19) & 0x80000000) != 0)
  {
    BOOL v40 = 0;
    int v41 = v46.st_mode & 0xF000;
    if (v41 != 4096 && v41 != 0x2000) {
      BOOL v40 = v41 != 24576;
    }
    archive_write_set_bytes_in_last_block(a1, v40, v34, v35, v36, v37, v38, v39);
  }

  if ((v46.st_mode & 0xF000) == 0x8000) {
    archive_write_set_skip_file((uint64_t)a1, v46.st_dev, v46.st_ino, v35, v36, v37, v38, v39);
  }
  return 0LL;
}

ssize_t sub_180700A20(_DWORD *a1, int *a2, void *__buf, size_t __nbyte)
{
  while (1)
  {
    ssize_t result = write(*a2, __buf, __nbyte);
    if (result > 0) {
      break;
    }
    if (*__error() != 4)
    {
      uint64_t v9 = __error();
      archive_set_error(a1, *v9, "Write error", v10, v11, v12, v13, v14, v15);
      return -1LL;
    }
  }

  return result;
}

uint64_t sub_180700A94(uint64_t a1, int *a2)
{
  if (!a2) {
    return 4294967266LL;
  }
  if ((*a2 & 0x80000000) == 0) {
    close(*a2);
  }
  return 0LL;
}

uint64_t sub_180700AC0(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1806F8350((uint64_t)a2 + 8);
    free(a2);
  }

  return 0LL;
}

uint64_t archive_write_open_memory(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = calloc(1uLL, 0x20uLL);
  if (v8)
  {
    v8[2] = a4;
    v8[3] = a2;
    v8[1] = a3;
    return archive_write_open2( (uint64_t)a1,  (uint64_t)v8,  (uint64_t)sub_180700B88,  (uint64_t)sub_180700BD4,  0LL,  (uint64_t)sub_180700C4C,  v12,  v13);
  }

  else
  {
    archive_set_error(a1, 12, "No memory", v9, v10, v11, v12, v13, v15);
    return 4294967266LL;
  }

uint64_t sub_180700B88( int *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a2 = 0LL;
  uint64_t v9 = (void *)a2[2];
  if (v9) {
    void *v9 = 0LL;
  }
  return 0LL;
}

size_t sub_180700BD4( _DWORD *a1, void *a2, void *__src, size_t __n, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a2 + __n <= a2[1])
  {
    size_t v8 = __n;
    memcpy((void *)(a2[3] + *a2), __src, __n);
    size_t v10 = *a2 + v8;
    *a2 = v10;
    uint64_t v11 = (size_t *)a2[2];
    if (v11) {
      *uint64_t v11 = v10;
    }
  }

  else
  {
    archive_set_error(a1, 12, "Buffer exhausted", __n, a5, a6, a7, a8, v13);
    return -30LL;
  }

  return v8;
}

uint64_t sub_180700C4C(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
  return 0LL;
}

void sub_180700C6C()
{
  if (qword_18C446790)
  {
    CFRelease((CFTypeRef)qword_18C446790);
    qword_18C446790 = 0LL;
  }

  byte_18C446798 = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C446788);
  os_unfair_lock_lock(&stru_18C44679C);
  if (qword_18C4467A0)
  {
    CFRelease((CFTypeRef)qword_18C4467A0);
    qword_18C4467A0 = 0LL;
  }

  byte_18C4467A8 = 0;
  os_unfair_lock_unlock(&stru_18C44679C);
}

BOOL sub_180700CE8(const char *a1)
{
  return sub_180700D0C( a1,  "com.apple.libarchive.formats",  (os_unfair_lock_t)&unk_18C446788,  (__CFSet **)&qword_18C446790,  &byte_18C446798);
}

BOOL sub_180700D0C(const char *a1, const char *a2, os_unfair_lock_t lock, __CFSet **a4, _BYTE *a5)
{
  if (a4) {
    Mutable = *a4;
  }
  else {
    Mutable = 0LL;
  }
  uint64_t v11 = (CFAllocatorRef *)MEMORY[0x189604DB0];
  uint64_t v12 = (CFAllocatorRef *)MEMORY[0x189604DC8];
  if (a5 && *a5) {
    goto LABEL_29;
  }
  uint64_t v13 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v14 = CFStringCreateWithCStringNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  a2,  0x600u,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
  uint64_t v15 = SecTaskCreateFromSelf(v13);
  CFErrorRef error = 0LL;
  uint64_t v16 = (const __CFString *)SecTaskCopyValueForEntitlement(v15, v14, &error);
  if (v14) {
    CFRelease(v14);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (!v16)
  {
    if (!error)
    {
LABEL_28:
      Mutable = 0LL;
      goto LABEL_29;
    }

    uint64_t v16 = CFErrorCopyDescription(error);
    uint64_t v23 = (char *)sub_180700FE0(v16);
    fprintf((FILE *)*MEMORY[0x1895F89D0], "Error discovering entitlements, error: %s", v23);
    if (!v16)
    {
LABEL_27:
      free(v23);
      goto LABEL_28;
    }

BOOL sub_180700FBC(const char *a1)
{
  return sub_180700D0C( a1,  "com.apple.libarchive.filters",  &stru_18C44679C,  (__CFSet **)&qword_18C4467A0,  &byte_18C4467A8);
}

void *sub_180700FE0(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  size_t MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  if (MaximumSizeForEncoding == -1LL) {
    return 0LL;
  }
  CFIndex v4 = MaximumSizeForEncoding;
  int v5 = calloc(MaximumSizeForEncoding, 1uLL);
  if (v5 && !CFStringGetCString(a1, (char *)v5, v4, 0x8000100u))
  {
    free(v5);
    return 0LL;
  }

  return v5;
}

uint64_t archive_write_set_format( _DWORD *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0LL;
  int v9 = 917504;
  while (v9 != a2)
  {
    int v9 = *(_DWORD *)((char *)&unk_18969E970 + v8 + 16);
    v8 += 16LL;
    if (v8 == 320)
    {
      archive_set_error(a1, 22, "No such format", a4, a5, a6, a7, a8, vars0);
      return 4294967266LL;
    }
  }

  return (*(uint64_t (**)(void))((char *)&unk_18969E970 + v8 + 8))();
}

_DWORD *sub_1807010BC(_DWORD *a1, uint64_t *a2)
{
  HIDWORD(v5) = archive_entry_filetype((uint64_t)a2);
  LODWORD(v5) = HIDWORD(v5) - 4096;
  unsigned int v4 = v5 >> 12;
  if (v4 <= 0xB && ((0xA2Bu >> v4) & 1) != 0)
  {
    uint64_t v18 = (char *)archive_entry_pathname(a2);
    return archive_set_error(a1, 79, "%s: %s format cannot archive %s", v13, v14, v15, v16, v17, v18);
  }

  else
  {
    uint64_t v6 = (char *)archive_entry_pathname(a2);
    archive_entry_mode((uint64_t)a2);
    return archive_set_error(a1, 79, "%s: %s format cannot archive files with mode 0%lo", v7, v8, v9, v10, v11, v6);
  }

uint64_t archive_write_set_format_ar_bsd( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 1, "archive_write_set_format_ar_bsd", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    uint64_t result = sub_1807011D0(a1);
    if (!(_DWORD)result)
    {
      *(_DWORD *)(a1 + 16) = 458754;
      *(void *)(a1 + 24) = "ar (BSD)";
    }
  }

  return result;
}

uint64_t sub_1807011D0(uint64_t a1)
{
  uint64_t v2 = *(void (**)(uint64_t))(a1 + 328);
  if (v2) {
    v2(a1);
  }
  uint64_t v3 = calloc(1uLL, 0x28uLL);
  if (v3)
  {
    uint64_t v9 = v3;
    uint64_t result = 0LL;
    *(void *)(a1 + 264) = v9;
    *(void *)(a1 + 272) = "ar";
    *(void *)(a1 + 312) = sub_1807017BC;
    *(void *)(a1 + 320) = sub_1807018A4;
    *(void *)(a1 + 328) = sub_1807018D0;
    *(void *)(a1 + 296) = sub_180701918;
    *(void *)(a1 + 304) = sub_1807012D0;
  }

  else
  {
    archive_set_error((_DWORD *)a1, 12, "Can't allocate ar data", v4, v5, v6, v7, v8, v11);
    return 4294967266LL;
  }

  return result;
}

uint64_t archive_write_set_format_ar_svr4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 1, "archive_write_set_format_ar_svr4", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    uint64_t result = sub_1807011D0(a1);
    if (!(_DWORD)result)
    {
      *(_DWORD *)(a1 + 16) = 458753;
      *(void *)(a1 + 24) = "ar (GNU/SVR4)";
    }
  }

  return result;
}

uint64_t sub_1807012D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 264);
  *(_DWORD *)(v4 + 16) = 0;
  unint64_t v5 = archive_entry_size((uint64_t)a2);
  uint64_t v6 = (const char *)archive_entry_pathname(a2);
  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v12 = v6;
  if (!*v6) {
    goto LABEL_10;
  }
  if (!*(_BYTE *)(v4 + 24))
  {
    sub_1806FDA50(a1, (uint64_t)"!<arch>\n", 8LL);
    *(_BYTE *)(v4 + 24) = 1;
  }

  *(void *)&__int128 v13 = 0x2020202020202020LL;
  *((void *)&v13 + 1) = 0x2020202020202020LL;
  *(_OWORD *)&v42[10] = v13;
  __int128 v41 = v13;
  *(_OWORD *)int v42 = v13;
  __int128 v40 = v13;
  __int16 v43 = 2656;
  if (!strcmp(v12, "/"))
  {
    int v21 = 0;
    uint64_t v18 = 0LL;
    LOBYTE(v40) = 47;
  }

  else if (!strcmp(v12, "/SYM64/"))
  {
    int v21 = 0;
    uint64_t v18 = 0LL;
    qmemcpy(&v40, "/SYM64/", 7);
  }

  else if (!strcmp(v12, "__.SYMDEF"))
  {
    int v21 = 0;
    uint64_t v18 = 0LL;
    BYTE8(v40) = 70;
    *(void *)&__int128 v40 = *(void *)"__.SYMDEF";
  }

  else
  {
    if (!strcmp(v12, "//"))
    {
      int v21 = 0;
      uint64_t v18 = 0LL;
      *(_DWORD *)(v4 + 16) = 1;
      LOWORD(v40) = 12079;
      goto LABEL_30;
    }

    uint64_t v14 = &v12[strlen(v12) - 1];
    if (*v14 == 47)
    {
LABEL_10:
      uint64_t v15 = "Invalid filename";
LABEL_11:
      uint64_t v16 = (_DWORD *)a1;
      int v17 = 22;
LABEL_35:
      archive_set_error(v16, v17, v15, v7, v8, v9, v10, v11, (char *)v40);
      return 4294967276LL;
    }

    do
    {
      uint64_t v18 = v14;
      if (v14 <= v12) {
        break;
      }
      --v14;
    }

    while (*(v18 - 1) != 47);
    int v19 = *(_DWORD *)(a1 + 16);
    if (v19 != 458753)
    {
      if (v19 == 458754)
      {
        size_t v20 = strlen(v18);
        if (v20 > 0x10 || strchr(v18, 32))
        {
          qmemcpy(&v40, "#1/", 3);
          if (sub_180701990(v20, (char *)&v40 + 3, 0xDuLL))
          {
            uint64_t v15 = "File name too long";
LABEL_34:
            uint64_t v16 = (_DWORD *)a1;
            int v17 = 34;
            goto LABEL_35;
          }

          v5 += strlen(v18);
          int v21 = 1;
        }

        else
        {
          __memcpy_chk();
          int v21 = 0;
          *((_BYTE *)&v40 + strlen(v18)) = 32;
        }

        goto LABEL_23;
      }

      goto LABEL_51;
    }

    size_t v29 = strlen(v18);
    size_t v30 = v29;
    if (v29 > 0xF)
    {
      if (*(int *)(v4 + 20) <= 0)
      {
        uint64_t v15 = "Can't find string table";
        goto LABEL_11;
      }

      uint64_t v31 = (char *)malloc(v29 + 3);
      if (!v31)
      {
        archive_set_error((_DWORD *)a1, 12, "Can't allocate filename buffer", v32, v33, v34, v35, v36, (char *)v40);
        return 4294967266LL;
      }

      uint64_t v37 = v31;
      memcpy(v31, v18, v30);
      strcpy(&v37[strlen(v18)], "/\n");
      uint64_t v38 = *(const char **)(v4 + 32);
      uint64_t v39 = strstr(v38, v37);
      free(v37);
      if (!v39)
      {
        uint64_t v15 = "Invalid string table";
        goto LABEL_11;
      }

      LOBYTE(v40) = 47;
      if (sub_180701990(v39 - v38, (char *)&v40 + 1, 0xFuLL))
      {
        uint64_t v15 = "string table offset too large";
        goto LABEL_34;
      }

LABEL_51:
      int v21 = 0;
      goto LABEL_23;
    }

    __memcpy_chk();
    int v21 = 0;
    *((_BYTE *)&v40 + strlen(v18)) = 47;
  }

  archive_entry_free(0LL);
  return v52;
}

        archive_set_error((_DWORD *)a1, -1, "Can't generate random number for encryption", v22, v23, v24, v25, v26, v49);
        return -30;
      }
    }

    size_t v28 = "Encryption needs passphrase";
    goto LABEL_53;
  }

LABEL_23:
  unint64_t v22 = archive_entry_mtime((uint64_t)a2);
  if (sub_180701990(v22, (char *)&v41, 0xCuLL))
  {
    uint64_t v15 = "File modification time too large";
    goto LABEL_34;
  }

  unint64_t v23 = archive_entry_uid((uint64_t)a2);
  if (sub_180701990(v23, (char *)&v41 + 12, 6uLL))
  {
    uint64_t v15 = "Numeric user ID too large";
    goto LABEL_34;
  }

  unint64_t v24 = archive_entry_gid((uint64_t)a2);
  if (sub_180701990(v24, &v42[2], 6uLL))
  {
    uint64_t v15 = "Numeric group ID too large";
    goto LABEL_34;
  }

  unsigned int v25 = archive_entry_mode((uint64_t)a2);
  if (sub_180701A88(v25, &v42[8]))
  {
    uint64_t v15 = "Numeric mode too large";
    goto LABEL_34;
  }

  if (v18 && archive_entry_filetype((uint64_t)a2) != 0x8000)
  {
    uint64_t v15 = "Regular file required for non-pseudo member";
    goto LABEL_11;
  }

      if ((v17 & 0x200) == 0) {
        goto LABEL_33;
      }
      goto LABEL_24;
    }

    uint64_t v33 = malloc(0x20uLL);
    if (!v33)
    {
      uint64_t v11 = (uint64_t **)(v9 + 192);
      goto LABEL_79;
    }

    *uint64_t v33 = 0LL;
    v33[1] = 0LL;
    *((_DWORD *)v33 + 6) = 1;
    v33[2] = v16;
    *uint64_t v12 = v33;
    if ((v17 & 0x200) == 0) {
      goto LABEL_33;
    }
LABEL_24:
    size_t v30 = *v13;
    if (*v13) {
      break;
    }
    uint64_t v38 = malloc(0x20uLL);
    if (!v38)
    {
      uint64_t v11 = (uint64_t **)(v9 + 200);
      goto LABEL_79;
    }

    *uint64_t v38 = 0LL;
    v38[1] = 0LL;
    *((_DWORD *)v38 + 6) = 1;
    v38[2] = v16;
    *__int128 v13 = v38;
    if ((v17 & 8) != 0) {
      goto LABEL_34;
    }
LABEL_47:
    uint64_t v16 = sub_1806FEE10(*(unint64_t **)(v10 + 40), v16, 1u);
    if (!v16) {
      goto LABEL_48;
    }
  }

  uint64_t v31 = *(unsigned __int16 *)(v16 + 230);
  if (*(unsigned __int16 *)(v30[2] + 230) == v31)
  {
    uint64_t v32 = 0LL;
  }

  else
  {
    do
    {
      uint64_t v32 = (uint64_t)v30;
      size_t v30 = (uint64_t *)v30[1];
    }

    while (v30 && *(unsigned __int16 *)(v30[2] + 230) != v31);
  }

uint64_t sub_1807017BC( uint64_t a1, const void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(void *)(a1 + 264);
  if (*(void *)v10 >= a3) {
    size_t v11 = a3;
  }
  else {
    size_t v11 = *(void *)v10;
  }
  if (*(int *)(v10 + 16) >= 1)
  {
    if (*(int *)(v10 + 20) >= 1)
    {
      archive_set_error((_DWORD *)a1, 22, "More than one string tables exist", a4, a5, a6, a7, a8, v21);
      return -20LL;
    }

    uint64_t v12 = malloc(v11 + 1);
    *(void *)(v10 + 32) = v12;
    if (!v12)
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate strtab buffer", v13, v14, v15, v16, v17, v21);
      return -30LL;
    }

    uint64_t v18 = v12;
    memcpy(v12, a2, v11);
    v18[v11] = 0;
    *(_DWORD *)(v10 + 20) = 1;
  }

  int v19 = sub_1806FDA50(a1, (uint64_t)a2, v11);
  if (v19) {
    return v19;
  }
  *(void *)v10 -= v11;
  return v11;
}

uint64_t sub_1807018A4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 264);
  if (*(_BYTE *)(v1 + 24)) {
    return 0LL;
  }
  *(_BYTE *)(v1 + 24) = 1;
  return sub_1806FDA50(a1, (uint64_t)"!<arch>\n", 8LL);
}

uint64_t sub_1807018D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 264);
  if (v1)
  {
    free((void *)v1);
    *(void *)(a1 + 264) = 0LL;
  }

  return 0LL;
}

uint64_t sub_180701918( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void **)(a1 + 264);
  if (*v8)
  {
    archive_set_error((_DWORD *)a1, -1, "Entry remaining bytes larger than 0", a4, a5, a6, a7, a8, v11);
  }

  else
  {
    uint64_t v10 = (char *)v8[1];
    if (!v10) {
      return 0LL;
    }
    archive_set_error((_DWORD *)a1, -1, "Padding wrong size: %ju should be 1 or 0", a4, a5, a6, a7, a8, v10);
  }

  return 4294967276LL;
}

uint64_t sub_180701990(unint64_t a1, char *__dst, size_t __len)
{
  int v3 = __len;
  if ((a1 & 0x8000000000000000LL) != 0)
  {
    if ((int)__len >= 1)
    {
      __len = __len;
      uint64_t v12 = __dst;
      int v13 = 48;
LABEL_13:
      memset(v12, v13, __len);
    }

    return 0xFFFFFFFFLL;
  }

  uint64_t v4 = 0LL;
  __len = __len;
  unint64_t v5 = &__dst[__len];
  uint64_t v6 = v5;
  int v7 = __len;
  do
  {
    int v8 = v7;
    unint64_t v9 = a1;
    uint64_t v10 = v4;
    a1 /= 0xAuLL;
    *--uint64_t v6 = (v9 - 10 * a1) | 0x30;
    --v7;
    if (v8 < 2) {
      break;
    }
    ++v4;
  }

  while (v9 > 9);
  if (v9 >= 0xA)
  {
    if ((int)__len >= 1)
    {
      uint64_t v12 = v6;
      int v13 = 57;
      goto LABEL_13;
    }

    return 0xFFFFFFFFLL;
  }

  memmove(__dst, v6, (int)__len - v7);
  if (v8 >= 2) {
    memset(&v5[-v7], 32, (v3 - 1) - v10);
  }
  return 0LL;
}

uint64_t sub_180701A88(unint64_t a1, _BYTE *__dst)
{
  uint64_t v3 = 0LL;
  uint64_t v4 = 0LL;
  do
  {
    unint64_t v5 = a1;
    unsigned int v6 = v4 + 8;
    __dst[v4-- + 7] = a1 & 7 | 0x30;
    ++v3;
    if (v6 < 2) {
      break;
    }
    a1 >>= 3;
  }

  while (v5 > 7);
  int v7 = &__dst[v4 + 8];
  if (v5 >= 8)
  {
    void *v7 = 0x3737373737373737LL;
    return 0xFFFFFFFFLL;
  }

  else
  {
    memmove(__dst, v7, -v4);
    return 0LL;
  }

uint64_t archive_write_add_filter( _DWORD *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0LL;
  int v9 = 0;
  while (v9 != a2)
  {
    int v9 = *(_DWORD *)((char *)&unk_18969EB20 + v8 + 16);
    v8 += 16LL;
    if (v8 == 208)
    {
      archive_set_error(a1, 22, "No such filter", a4, a5, a6, a7, a8, vars0);
      return 4294967266LL;
    }
  }

  return (*(uint64_t (**)(void))((char *)&unk_18969EB20 + v8 + 8))();
}

uint64_t archive_write_set_format_by_name(_DWORD *a1, char *__s1)
{
  uint64_t v4 = 0LL;
  unint64_t v5 = "7zip";
  while (strcmp(__s1, v5))
  {
    unint64_t v5 = (&off_18969EC00)[v4 + 2];
    v4 += 2LL;
    if (v4 == 62)
    {
      archive_set_error(a1, 22, "No such format '%s'", v6, v7, v8, v9, v10, __s1);
      a1[1] = 0x8000;
      return 4294967266LL;
    }
  }

  return ((uint64_t (*)(_DWORD *))(&off_18969EC00)[v4 + 1])(a1);
}

void archive_read_support_filter_uu(int *a1)
{
  if (sub_180700FBC("uu"))
  {
    if (sub_1806A93F4(a1, 14594245, 1, "archive_read_support_filter_uu", v3, v4, v5, v6) != -30)
    {
      sub_1806BB35C(a1, &v16, v7, v8, v9, v10, v11, v12);
      if (!v13)
      {
        *uint64_t v16 = 0LL;
        uint64_t v14 = v16;
        v16[1] = "uu";
        v14[2] = sub_180701CF8;
        v14[4] = 0LL;
        v14[5] = 0LL;
        v14[3] = sub_180702038;
      }
    }
  }

  else
  {
    archive_set_error(a1, -1, "Format not allow-listed in entitlement", v2, v3, v4, v5, v6, v15);
  }

uint64_t sub_180701CF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v37 = (unsigned __int8 *)sub_1806BB3C0(a2, 1uLL, &v36, a4, a5, a6, a7, a8);
  if (!v37) {
    return 0LL;
  }
  int v11 = 20;
  uint64_t v35 = v36;
  unint64_t v33 = v36;
  while (1)
  {
    uint64_t v12 = sub_18070210C(a2, &v37, &v36, &v35, &v34, (uint64_t *)&v33, v9, v10);
    uint64_t v13 = 0LL;
    if (v12 < 0 || !v34) {
      return v13;
    }
    if (v12 - v34 >= 11)
    {
      if (*(_DWORD *)v37 == 1768383842 && *((_WORD *)v37 + 2) == 8302)
      {
        uint64_t v16 = 6LL;
      }

      else
      {
        if (*(void *)v37 != 0x61622D6E69676562LL || *(void *)(v37 + 5) != 0x203436657361622DLL) {
          goto LABEL_22;
        }
        uint64_t v16 = 13LL;
      }

      if (v37[v16] - 56 >= 0xFFFFFFF8
        && v37[v16 + 1] - 56 >= 0xFFFFFFF8
        && v37[v16 + 2] - 56 >= 0xFFFFFFF8
        && v37[v16 + 3] == 32)
      {
        break;
      }
    }

uint64_t sub_180702038(uint64_t a1)
{
  *(_DWORD *)(a1 + 104) = 7;
  *(void *)(a1 + 96) = "uu";
  *(void *)(a1 + 40) = sub_180702310;
  *(void *)(a1 + 48) = 0LL;
  *(void *)(a1 + 64) = sub_1807029A0;
  uint64_t v2 = calloc(0x30uLL, 1uLL);
  uint64_t v3 = malloc(0x10000uLL);
  uint64_t v4 = malloc(0x400uLL);
  uint64_t v10 = v4;
  if (v2 && v3 && v4)
  {
    uint64_t result = 0LL;
    *(void *)(a1 + 88) = v2;
    v2[1] = v10;
    *((_DWORD *)v2 + 4) = 0;
    v2[3] = 1024LL;
    v2[4] = v3;
    *((_DWORD *)v2 + 10) = 0;
  }

  else
  {
    archive_set_error(*(_DWORD **)(a1 + 24), 12, "Can't allocate data for uudecode", v5, v6, v7, v8, v9, v12);
    free(v2);
    free(v3);
    free(v10);
    return 4294967266LL;
  }

  return result;
}

uint64_t sub_18070210C( uint64_t a1, unsigned __int8 **a2, uint64_t *a3, uint64_t *a4, void *a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  if (*a3)
  {
    uint64_t v14 = sub_180702258(*a2, *a3, a5);
    if (*a5) {
      return v14;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
    *a5 = 0LL;
  }

  int v15 = 0;
  while (!v15 && v14 == *a3 && !((unint64_t)*a6 >> 17))
  {
    uint64_t v16 = *a4;
    unint64_t v17 = (*a4 + 1023) & 0xFFFFFC00;
    size_t v18 = sub_1806BB3C0(a1, v17 << (v17 < *a4 + 160), a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8);
    *a2 = (unsigned __int8 *)v18;
    if (v18)
    {
      int v15 = 0;
    }

    else
    {
      if (*a4 >= *a3) {
        return 0LL;
      }
      size_t v18 = sub_1806BB3C0(a1, *a3, a3, v19, v20, v21, v22, v23);
      int v15 = 1;
    }

    *a6 = *a3;
    *a4 = *a3;
    *a2 = (unsigned __int8 *)(v18 + v16 - v14);
    uint64_t v24 = *a3 - (v16 - v14);
    *a3 = v24;
    uint64_t v25 = sub_180702258((unsigned __int8 *)(v18 + v16), v24 - v14, a5);
    if (v25 >= 0) {
      uint64_t v26 = v14;
    }
    else {
      uint64_t v26 = 0LL;
    }
    uint64_t v14 = v26 + v25;
    if (*a5) {
      return v14;
    }
  }

  return v14;
}

uint64_t sub_180702258(unsigned __int8 *a1, uint64_t a2, void *a3)
{
  if (a2 < 1)
  {
LABEL_11:
    if (a3) {
      *a3 = 0LL;
    }
    return a2;
  }

  uint64_t v3 = 0LL;
  while (1)
  {
    unsigned int v4 = byte_18071FD50[*a1];
    if (v4 <= 9)
    {
      if (v4 == 1)
      {
        ++a1;
        ++v3;
      }

      else if (!byte_18071FD50[*a1])
      {
        if (a3) {
          *a3 = 0LL;
        }
        return -1LL;
      }

      goto LABEL_10;
    }

    if (v4 == 10) {
      goto LABEL_18;
    }
    if (v4 == 13) {
      break;
    }
LABEL_10:
    if (v3 >= a2) {
      goto LABEL_11;
    }
  }

  if (a2 - v3 >= 2 && a1[1] == 10)
  {
    if (a3) {
      *a3 = 2LL;
    }
    return v3 + 2;
  }

uint64_t sub_180702310( uint64_t *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = a1[11];
  unint64_t v17 = (_BYTE *)sub_1806BB3C0(a1[2], 1uLL, &__n, a4, a5, a6, a7, a8);
  BOOL v18 = v17 == 0LL;
  int64_t v19 = __n;
  if (!v17 && (__n & 0x8000000000000000LL) != 0) {
    return -30LL;
  }
  BOOL v77 = a2;
  while (2)
  {
    if (v18)
    {
      int64_t v19 = 0LL;
      size_t __n = 0LL;
    }

    uint64_t v78 = v19;
    if (*(_DWORD *)(v10 + 40) == 4)
    {
      uint64_t v23 = 0LL;
      int64_t v22 = v19;
      goto LABEL_124;
    }

    uint64_t v20 = *(void *)(v10 + 32);
    uint64_t v21 = *(int *)(v10 + 16);
    if ((_DWORD)v21)
    {
      memcpy((void *)(*(void *)(v10 + 8) + *(int *)(v10 + 16)), v17, __n);
      unint64_t v17 = *(_BYTE **)(v10 + 8);
      int64_t v22 = __n + *(int *)(v10 + 16);
      size_t __n = v22;
      *(_DWORD *)(v10 + 16) = 0;
    }

    else
    {
      int64_t v22 = v19;
    }

    if (v22 < 1)
    {
      int64_t v19 = 0LL;
      uint64_t v23 = 0LL;
      goto LABEL_124;
    }

    uint64_t v23 = 0LL;
    int64_t v19 = 0LL;
    while (1)
    {
      size_t v24 = sub_180702258(v17, v22 - v19, &v79);
      if ((v24 & 0x8000000000000000LL) != 0)
      {
        if (!*(_DWORD *)(v10 + 40) && (*(uint64_t *)v10 > 0 || v23 >= 1))
        {
          *(_DWORD *)(v10 + 40) = 4;
          int64_t v19 = v22;
          goto LABEL_124;
        }

LABEL_118:
        unint64_t v72 = (_DWORD *)a1[3];
        int v73 = "Insufficient compressed data";
        int v74 = -1;
        goto LABEL_119;
      }

      size_t v25 = v24;
      int v26 = *(_DWORD *)(v10 + 40);
      if (!v79) {
        break;
      }
      switch(v26)
      {
        case 1:
          uint64_t v29 = v24 - v79;
          uint64_t v30 = *v17;
          if (byte_18071FE50[v30]) {
            BOOL v31 = v29 <= 0;
          }
          else {
            BOOL v31 = 1;
          }
          if (v31) {
            goto LABEL_118;
          }
          unint64_t v32 = ((_BYTE)v30 + 32) & 0x3F;
          if (v29 <= v32) {
            goto LABEL_118;
          }
          if ((_DWORD)v32)
          {
            uint64_t v33 = 0LL;
            uint64_t v34 = v17 + 1;
            uint64_t v35 = 2LL;
            while (1)
            {
              uint64_t v36 = *v34;
              if (!byte_18071FE50[v36]) {
                goto LABEL_118;
              }
              uint64_t v37 = v34[1];
              if (!byte_18071FE50[v37]) {
                goto LABEL_118;
              }
              int v38 = (((_BYTE)v37 + 32) & 0x3F) << 12;
              *(_BYTE *)(v20 + v35 - 2) = ((v38 | ((_DWORD)v36 << 18)) + 0x800000) >> 16;
              if (v32 + v33 < 2)
              {
                uint64_t v23 = v23 - v33 + 1;
                uint64_t v63 = v20 - v33;
LABEL_97:
                uint64_t v20 = v63 + 1;
                goto LABEL_32;
              }

              uint64_t v39 = v34[2];
              if (!byte_18071FE50[v39]) {
                goto LABEL_118;
              }
              __int16 v40 = ((_BYTE)v39 + 32) & 0x3F;
              *(_BYTE *)(v20 + v35 - 1) = (unsigned __int16)(v38 | (v40 << 6)) >> 8;
              if (v32 + v33 == 2)
              {
                uint64_t v23 = v23 - v33 + 2;
                uint64_t v64 = v20 - v33;
LABEL_101:
                uint64_t v20 = v64 + 2;
                goto LABEL_32;
              }

              uint64_t v41 = v34[3];
              if (!byte_18071FE50[v41]) {
                goto LABEL_118;
              }
              *(_BYTE *)(v20 + v35) = (v41 + 32) & 0x3F | ((_BYTE)v40 << 6);
              v33 -= 3LL;
              v35 += 3LL;
              v34 += 4;
              if ((uint64_t)(v32 + v33 + 3) <= 3)
              {
                v23 -= v33;
                v20 -= v33;
                goto LABEL_32;
              }
            }
          }

          int v61 = 2;
          goto LABEL_80;
        case 2:
          goto LABEL_25;
        case 3:
          uint64_t v27 = v24 - v79;
          if ((uint64_t)(v24 - v79) < 3)
          {
            if (v27 >= 1) {
              goto LABEL_67;
            }
            BOOL v60 = v17;
            if (!v27) {
              goto LABEL_32;
            }
          }

          else
          {
            if (*v17 == 61 && v17[1] == 61 && v17[2] == 61) {
              goto LABEL_31;
            }
LABEL_67:
            uint64_t v46 = 0LL;
            uint64_t v47 = 0LL;
            uint64_t v48 = 3LL;
            while (1)
            {
              uint64_t v49 = v17[v48 - 3];
              if (!byte_18071FF50[v49] || (uint64_t v50 = v17[v48 - 2], !byte_18071FF50[v50]))
              {
                v23 += v46;
                v20 += v46;
                goto LABEL_93;
              }

              unsigned int v51 = dword_180720050[v50] << 12;
              unsigned int v52 = (v51 | (dword_180720050[v49] << 18)) >> 16;
              uint64_t v53 = v20 + v46;
              *(_BYTE *)(v20 + v46) = v52;
              uint64_t v54 = v17[v48 - 1];
              if (v54 == 61)
              {
                v23 += v46 + 1;
                uint64_t v63 = v20 + v46;
                goto LABEL_97;
              }

              if (!byte_18071FF50[v54]) {
                goto LABEL_118;
              }
              int v55 = dword_180720050[v54];
              unsigned int v56 = (v51 | (v55 << 6)) >> 8;
              uint64_t v57 = v20 + v46;
              *(_BYTE *)(v53 + 1) = v56;
              if (v27 + v47 == 3)
              {
                v23 += v46 + 2;
                uint64_t v20 = v57 + 2;
                goto LABEL_32;
              }

              uint64_t v58 = v17[v48];
              if (v58 == 61)
              {
                v23 += v46 + 2;
                uint64_t v64 = v20 + v46;
                goto LABEL_101;
              }

              if (!byte_18071FF50[v58]) {
                goto LABEL_118;
              }
              *(_BYTE *)(v57 + 2) = dword_180720050[v58] | ((_BYTE)v55 << 6);
              v47 -= 4LL;
              uint64_t v59 = v27 + v47;
              v46 += 3LL;
              v48 += 4LL;
              if (v27 + v47 + 4 <= 4)
              {
                v23 += v46;
                BOOL v60 = &v17[-v47];
                v20 += v46;
                if (v59) {
                  goto LABEL_92;
                }
                goto LABEL_32;
              }
            }

            v23 += v46 + 1;
            uint64_t v62 = v27 + v47 - 2;
            BOOL v60 = &v17[-v47 + 2];
            uint64_t v20 = v53 + 1;
            if (!v62) {
              goto LABEL_32;
            }
          }

LABEL_92:
          LODWORD(v49) = *v60;
LABEL_93:
          if ((_DWORD)v49 != 61) {
            goto LABEL_118;
          }
          goto LABEL_32;
      }

      if ((uint64_t)(v24 + v23) >= 0x20000)
      {
        unint64_t v72 = (_DWORD *)a1[3];
        int v73 = "Invalid format data";
        goto LABEL_128;
      }

      if ((uint64_t)(v24 - v79) >= 11)
      {
        BOOL v42 = *(_DWORD *)v17 == 1768383842 && *((_WORD *)v17 + 2) == 8302;
        BOOL v43 = !v42;
        if (v42)
        {
          uint64_t v45 = 6LL;
        }

        else
        {
          if (v24 - v79 < 0x12) {
            goto LABEL_32;
          }
          if (*(void *)v17 != 0x61622D6E69676562LL || *(void *)(v17 + 5) != 0x203436657361622DLL) {
            goto LABEL_32;
          }
          uint64_t v45 = 13LL;
        }

        if ((v17[v45] & 0xF8) == 0x30
          && (v17[v45 + 1] & 0xF8) == 0x30
          && (v17[v45 + 2] & 0xF8) == 0x30
          && v17[v45 + 3] == 32)
        {
          if (v43) {
            int v61 = 3;
          }
          else {
            int v61 = 1;
          }
LABEL_80:
          *(_DWORD *)(v10 + 40) = v61;
        }
      }

  sub_1806F76DC(v13, 10);
  if (*(_DWORD *)(v10 + 960) || *(_DWORD *)(v10 + 216)) {
    sub_180706E34(v10);
  }
  uint64_t v30 = *(void *)(v10 + 96);
  if (v30 <= 0x8000) {
    return 0LL;
  }
  uint64_t result = sub_1806FDA50(a1, *(void *)(v10 + 88), v30);
  *(void *)(v10 + 96) = 0LL;
  return result;
}

uint64_t sub_1807029A0(uint64_t a1)
{
  uint64_t v1 = *(void ***)(a1 + 88);
  free(v1[1]);
  free(v1[4]);
  free(v1);
  return 0LL;
}

uint64_t sub_1807029D8(uint64_t a1, uint64_t a2, size_t a3)
{
  size_t v3 = *(void *)(a2 + 24);
  if (v3 >= a3) {
    return 0LL;
  }
  do
  {
    if (v3 >= 0x8000) {
      v3 += 1024LL;
    }
    else {
      v3 *= 2LL;
    }
  }

  while (v3 < a3);
  uint64_t v6 = malloc(v3);
  if (v6)
  {
    uint64_t v12 = v6;
    size_t v13 = *(int *)(a2 + 16);
    if ((_DWORD)v13) {
      memmove(v6, *(const void **)(a2 + 8), v13);
    }
    free(*(void **)(a2 + 8));
    uint64_t result = 0LL;
    *(void *)(a2 + 8) = v12;
    *(void *)(a2 + 24) = v3;
  }

  else
  {
    archive_set_error(*(_DWORD **)(a1 + 24), 12, "Can't allocate data for uudecode", v7, v8, v9, v10, v11, v15);
    return 4294967266LL;
  }

  return result;
}

uint64_t sub_180702A80(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if ((unint64_t)(a2 - 33) >= 0xFFFFFFFFFFFFFFE0LL)
  {
    unsigned __int8 v2 = a2;
    *(_OWORD *)(a1 + 1704) = 0u;
    *(_OWORD *)(a1 + 1720) = 0u;
    *(_OWORD *)(a1 + 1672) = 0u;
    *(_OWORD *)(a1 + 1688) = 0u;
    *(_OWORD *)(a1 + 1640) = 0u;
    *(_OWORD *)(a1 + 1656) = 0u;
    *(_OWORD *)(a1 + 1608) = 0u;
    *(_OWORD *)(a1 + 1624) = 0u;
    *(_OWORD *)(a1 + 1576) = 0u;
    *(_OWORD *)(a1 + 1592) = 0u;
    *(_OWORD *)(a1 + 1544) = 0u;
    *(_OWORD *)(a1 + 1560) = 0u;
    *(_OWORD *)(a1 + 1512) = 0u;
    *(_OWORD *)(a1 + 1528) = 0u;
    *(_OWORD *)(a1 + 1480) = 0u;
    *(_OWORD *)(a1 + 1496) = 0u;
    *(_OWORD *)(a1 + 1448) = 0u;
    *(_OWORD *)(a1 + 1464) = 0u;
    *(_OWORD *)(a1 + 1416) = 0u;
    *(_OWORD *)(a1 + 1432) = 0u;
    *(_OWORD *)(a1 + 1384) = 0u;
    *(_OWORD *)(a1 + 1400) = 0u;
    *(_OWORD *)(a1 + 1352) = 0u;
    *(_OWORD *)(a1 + 1368) = 0u;
    *(_OWORD *)(a1 + 1320) = 0u;
    *(_OWORD *)(a1 + 1336) = 0u;
    *(_OWORD *)(a1 + 1288) = 0u;
    *(_OWORD *)(a1 + 1304) = 0u;
    *(_OWORD *)(a1 + 1256) = 0u;
    *(_OWORD *)(a1 + 1272) = 0u;
    *(_OWORD *)(a1 + 1224) = 0u;
    *(_OWORD *)(a1 + 1240) = 0u;
    *(void *)(a1 + 1736) = 0LL;
    *(void *)(a1 + 1744) = a2;
    unsigned __int8 v8 = a2;
    __int16 v9 = 2048;
    char v10 = 2;
    *(void *)uint64_t v11 = 0LL;
    *(_DWORD *)&v11[8] = 536936448;
    *(void *)&v11[12] = 0LL;
    uint64_t v12 = 0LL;
    if ((sub_1806CFCF0(a1 + 1088, &v8) & 0x80000000) == 0)
    {
      uint64_t v4 = 0LL;
      for (uint64_t i = a1; ; i += 136LL)
      {
        unsigned __int8 v8 = v2;
        __int16 v9 = 2048;
        char v10 = 2;
        *(_DWORD *)uint64_t v11 = 0;
        v11[4] = v4;
        *(_DWORD *)&v11[5] = 0;
        *(_WORD *)&v11[9] = 0;
        strcpy(&v11[11], " ");
        v11[13] = 0;
        *(_WORD *)&v11[14] = 0;
        *(_DWORD *)&v11[16] = 0;
        uint64_t v12 = 0LL;
        int v6 = sub_1806CFCF0(i, &v8);
        *(void *)(i + 120) = v11[11];
        if (v6 < 0) {
          break;
        }
        if (++v4 == 8)
        {
          uint64_t result = 0LL;
          *(_BYTE *)(a1 + 1216) = 1;
          *(_BYTE *)(a1 + 1080) = 1;
          return result;
        }
      }
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_180702C00(uint64_t a1, char *__src, unint64_t a3)
{
  unint64_t v3 = a3;
  uint64_t v4 = __src;
  uint64_t v6 = *(void *)(a1 + 1736);
  if (v6)
  {
    uint64_t v7 = 512 - v6;
    unint64_t v8 = a3 - (512 - v6);
    if (a3 >= 512 - v6)
    {
      memcpy((void *)(a1 + 1224 + v6), __src, 512 - v6);
      uint64_t v9 = 0LL;
      uint64_t v10 = a1;
      do
      {
        sub_1806CFD44(v10, (int *)(a1 + 1224 + v9), 0x40uLL);
        v9 += 64LL;
        v10 += 136LL;
      }

      while (v9 != 512);
      uint64_t v6 = 0LL;
      v4 += v7;
      unint64_t v3 = v8;
    }
  }

  for (uint64_t i = 0LL; i != 8; ++i)
  {
    if (v3 >= 0x200)
    {
      uint64_t v12 = (int *)&v4[64 * i];
      for (unint64_t j = v3; j > 0x1FF; j -= 512LL)
      {
        sub_1806CFD44(a1 + 136 * i, v12, 0x40uLL);
        v12 += 128;
      }
    }
  }

  if ((v3 & 0x1FF) != 0) {
    memcpy((void *)(a1 + v6 + 1224), &v4[v3 & 0xFFFFFFFFFFFFFE00LL], v3 & 0x1FF);
  }
  *(void *)(a1 + 1736) = (v3 & 0x1FF) + v6;
  return 0LL;
}

uint64_t sub_180702D18(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (!a2 || *(void *)(a1 + 1744) > a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0LL;
  unint64_t v7 = 0LL;
  unint64_t v8 = v14;
  uint64_t v9 = a1;
  do
  {
    unint64_t v10 = *(void *)(a1 + 1736);
    if (v10 > v7)
    {
      unint64_t v11 = v6 + v10;
      if (v11 >= 0x40) {
        unint64_t v12 = 64LL;
      }
      else {
        unint64_t v12 = v11;
      }
      sub_1806CFD44(v9, (int *)(a1 + 1224 + v7), v12);
    }

    sub_1806D1358(v9, v8, 0x20uLL);
    v7 += 64LL;
    v8 += 32;
    v9 += 136LL;
    v6 -= 64LL;
  }

  while (v7 != 512);
  for (uint64_t i = 0LL; i != 256; i += 32LL)
    sub_1806CFD44(a1 + 1088, (int *)&v14[i], 0x20uLL);
  return sub_1806D1358(a1 + 1088, a2, *(void *)(a1 + 1744));
}

uint64_t archive_read_support_format_warc( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = calloc(1uLL, 0x48uLL);
  if (!v9)
  {
    archive_set_error(a1, 12, "Can't allocate warc data", v10, v11, v12, v13, v14, v18);
    return 4294967266LL;
  }

  uint64_t v15 = v9;
  uint64_t v16 = sub_1806BB258( a1,  (uint64_t)v9,  "warc",  (uint64_t)sub_180702F10,  0LL,  (uint64_t)sub_180702F68,  (uint64_t)sub_180703608,  (uint64_t)sub_1807036E4,  0LL,  (uint64_t)sub_180703718,  0LL,  0LL);
  if ((_DWORD)v16) {
    free(v15);
  }
  return v16;
}

uint64_t sub_180702F10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = sub_1806BB3B8(a1, 0xCuLL, &v10, a4, a5, a6, a7, a8);
  if (!v8 || v10 < 12) {
    return 0xFFFFFFFFLL;
  }
  return 64LL;
}

uint64_t sub_180702F68( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(void **)(a1 + 2472);
  size_t v10 = sub_1806BB3B8(a1, 0xCuLL, &__n, a4, a5, a6, a7, a8);
  size_t v16 = __n;
  if ((__n & 0x8000000000000000LL) != 0)
  {
LABEL_89:
    v99 = "Bad record header";
    goto LABEL_90;
  }

  unint64_t v17 = (char *)v10;
  while (1)
  {
    if (!v17) {
      return 1LL;
    }
    uint64_t v18 = sub_180703844(v17, v16, "\r\n\r\n", 4LL);
    if (!v18) {
      goto LABEL_89;
    }
    uint64_t v19 = v18 - (void)v17 + 4;
    unsigned int v20 = sub_180703768((uint64_t)v17, v19);
    if (!v20) {
      break;
    }
    unsigned int v21 = v20;
    if (v20 - 10001 <= 0xFFFFDD9E)
    {
      unint64_t v103 = v20 / 0x2710uLL;
      v99 = "Unsupported record version: %u.%u";
      goto LABEL_90;
    }

    __endptr = 0LL;
    uint64_t v22 = sub_180703844(v17, v19, "\r\nContent-Length:", 17LL);
    if (!v22) {
      goto LABEL_91;
    }
    uint64_t v23 = v22;
    size_t v24 = (const char *)(v22 + 17);
    size_t v25 = &v17[v19];
    unint64_t v26 = sub_180703844((const void *)(v22 + 17), (size_t)&v17[v19 - 17 - v22], "\r\n", 2LL);
    if (!v26) {
      goto LABEL_91;
    }
    uint64_t v27 = (char *)v26;
    if ((unint64_t)v24 < v26)
    {
      uint64_t v28 = v26 - v23 - 17;
      while (1)
      {
        int v29 = *(unsigned __int8 *)v24;
        if (v29 != 32 && v29 != 9) {
          break;
        }
        ++v24;
        if (!--v28)
        {
          size_t v24 = (const char *)v26;
          break;
        }
      }
    }

    if (*(unsigned __int8 *)v24 - 48 > 9
      || (*__error() = 0, uint64_t v31 = strtol(v24, &__endptr, 10), *__error())
      || __endptr != v27
      || v31 < 0)
    {
LABEL_91:
      v99 = "Bad content length";
LABEL_93:
      int v100 = (_DWORD *)a1;
      int v101 = 22;
      goto LABEL_94;
    }

    __endptr = 0LL;
    uint64_t v32 = sub_180703844(v17, v19, "\r\nWARC-Date:", 12LL);
    if (!v32
      || (uint64_t v33 = (unsigned __int8 *)(v32 + 12),
          (uint64_t v34 = sub_180703844((const void *)(v32 + 12), (size_t)&v25[-v32 - 12], "\r\n", 2LL)) == 0)
      || (uint64_t v35 = (char *)v34, v36 = sub_1807039A8(v33, &__endptr), __endptr != v35)
      || (uint64_t v38 = v36, v36 == -1))
    {
      v99 = "Bad record time";
      goto LABEL_93;
    }

    *(_DWORD *)(a1 + 16) = 983040;
    if (v21 != *(_DWORD *)(v9 + 40))
    {
      sub_1806FBA84((void **)(v9 + 48), "WARC/%u.%u", v37, v11, v12, v13, v14, v15, (char *)(v21 / 0x2710uLL));
      *(_DWORD *)(v9 + 40) = v21;
    }

    uint64_t v39 = sub_180703844(v17, v19, "\r\nWARC-Type:", 12LL);
    if (!v39) {
      goto LABEL_40;
    }
    uint64_t v46 = v39;
    uint64_t v47 = (void *)(v39 + 12);
    unint64_t v48 = sub_180703844((const void *)(v39 + 12), (size_t)&v25[-v39 - 12], "\r\n", 2LL);
    if (!v48) {
      goto LABEL_40;
    }
    if ((unint64_t)v47 < v48)
    {
      uint64_t v49 = v48 - v46 - 12;
      while (1)
      {
        int v50 = *(unsigned __int8 *)v47;
        if (v50 != 32 && v50 != 9) {
          break;
        }
        uint64_t v47 = (void *)((char *)v47 + 1);
        if (!--v49)
        {
          uint64_t v47 = (void *)v48;
          break;
        }
      }
    }

    if (v47 + 1 != (void *)v48 || *v47 != 0x656372756F736572LL && *v47 != 0x65736E6F70736572LL)
    {
LABEL_40:
      *(void *)uint64_t v9 = v31;
      *(void *)(v9 + 8) = 0LL;
      sub_1806BB660(a1, v19, v40, v41, v42, v43, v44, v45);
      goto LABEL_41;
    }

    *(void *)uint64_t v9 = v31;
    *(void *)(v9 + 8) = 0LL;
    uint64_t v64 = sub_180703844(v17, v19, "\r\nWARC-Target-URI:", 18LL);
    if (!v64
      || (uint64_t v71 = v64,
          unint64_t v72 = (unsigned __int8 *)(v64 + 18),
          (unint64_t v73 = sub_180703844((const void *)(v64 + 18), (size_t)&v25[-v64 - 18], "\r\n", 2LL)) == 0))
    {
LABEL_64:
      uint64_t v84 = 0LL;
      int v85 = 0LL;
      char v86 = 1;
      goto LABEL_79;
    }

    if ((unint64_t)v72 < v73)
    {
      uint64_t v74 = v73 - v71 - 18;
      while (1)
      {
        int v75 = *v72;
        if (v75 != 32 && v75 != 9) {
          break;
        }
        ++v72;
        if (!--v74)
        {
          unint64_t v72 = (unsigned __int8 *)v73;
          break;
        }
      }
    }

    unint64_t v77 = v73 - (void)v72;
    unint64_t v78 = v73;
    uint64_t v79 = sub_180703844(v72, v73 - (void)v72, "://", 3LL);
    if (!v79) {
      goto LABEL_78;
    }
    unint64_t v80 = v78;
    __int128 v81 = (char *)v72;
    unint64_t v104 = v80;
    unint64_t v105 = v79;
    if ((unint64_t)v72 < v80)
    {
      while (1)
      {
        uint64_t v82 = *v81;
        if (*v81 < 0 ? __maskrune(v82, 0x4000uLL) : *(_DWORD *)(MEMORY[0x1895F8770] + 4 * v82 + 60) & 0x4000) {
          break;
        }
        ++v81;
        if (!--v77) {
          goto LABEL_63;
        }
      }

LABEL_78:
      uint64_t v84 = 0LL;
      int v85 = 0LL;
      char v86 = 1;
      goto LABEL_79;
    }

          if ((v48 & 0x800000) == 0) {
            goto LABEL_79;
          }
LABEL_94:
          if (sub_1806FF138((CC_SHA256_CTX *)(v4 + 428)))
          {
            unint64_t v48 = *(_DWORD *)(v4 + 952) & 0xFF7FFFFF;
            *(_DWORD *)(v4 + 952) = v48;
            if ((v48 & 0x1000000) != 0) {
              goto LABEL_98;
            }
          }

          else
          {
            *(_DWORD *)(v4 + 224) |= 0x800000u;
            unint64_t v48 = *(_DWORD *)(v4 + 952);
            if ((v48 & 0x1000000) != 0) {
              goto LABEL_98;
            }
          }

LABEL_79:
    sub_1806BB660(a1, v19, v65, v66, v67, v68, v69, v70);
    if ((v86 & 1) == 0)
    {
      archive_entry_set_filetype(a2, 0x8000);
      archive_entry_copy_pathname(a2, v85);
      archive_entry_set_size(a2, v31);
      archive_entry_set_perm(a2, 420);
      archive_entry_set_ctime(a2, v38, 0LL);
      archive_entry_set_mtime(a2, v84, 0LL);
      return 0LL;
    }

            if ((v48 & 0x1000000) == 0) {
              goto LABEL_80;
            }
LABEL_98:
            if (sub_1806FF18C((CC_SHA512_CTX *)(v4 + 536)))
            {
              int v50 = *(_DWORD *)(v4 + 952) & 0xFEFFFFFF;
              *(_DWORD *)(v4 + 952) = v50;
              if ((v50 & 0x2000000) == 0) {
                return v10;
              }
            }

            else
            {
              *(_DWORD *)(v4 + 224) |= 0x1000000u;
              if ((*(_DWORD *)(v4 + 952) & 0x2000000) == 0) {
                return v10;
              }
            }

uint64_t sub_180703608( uint64_t a1, size_t *a2, unint64_t *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = **(void ***)(a1 + 2472);
  if (v11[1] >= *v11) {
    goto LABEL_9;
  }
  uint64_t v13 = v11[2];
  if (v13)
  {
    sub_1806BB660(a1, v13, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8);
    v11[2] = 0LL;
  }

  size_t v14 = sub_1806BB3B8(a1, 1uLL, &v18, (uint64_t)a4, a5, a6, a7, a8);
  uint64_t result = v18;
  if ((v18 & 0x8000000000000000LL) != 0)
  {
    *a3 = 0LL;
    return result;
  }

  if (!v18)
  {
LABEL_9:
    *a2 = 0LL;
    *a3 = 0LL;
    *a4 = v11[1] + 4LL;
    v11[2] = 0LL;
    return 1LL;
  }

  uint64_t v16 = v11[1];
  unint64_t v17 = *v11 - v16;
  if (v18 < v17) {
    unint64_t v17 = v18;
  }
  *a4 = v16;
  *a3 = v17;
  *a2 = v14;
  v11[1] += v17;
  v11[2] = v17;
  return 0LL;
}

uint64_t sub_1807036E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = **(void ***)(a1 + 2472);
  sub_1806BB660(a1, *v8 + 4LL, a3, a4, a5, a6, a7, a8);
  void *v8 = 0LL;
  v8[1] = 0LL;
  return 0LL;
}

uint64_t sub_180703718(uint64_t a1)
{
  uint64_t v2 = **(void **)(a1 + 2472);
  if (*(void *)(v2 + 24)) {
    free(*(void **)(v2 + 32));
  }
  sub_1806F755C(v2 + 48);
  free((void *)v2);
  **(void **)(a1 + 2472) = 0LL;
  return 0LL;
}

uint64_t sub_180703768(uint64_t a1, unint64_t a2)
{
  if (a2 < 0xC) {
    return 0LL;
  }
  if (*(_DWORD *)a1 != 1129464151 || *(_BYTE *)(a1 + 4) != 47) {
    return 0LL;
  }
  int v3 = *(unsigned __int8 *)(a1 + 5);
  if (*(_BYTE *)(a1 + 6) != 46) {
    return 0LL;
  }
  int v4 = *(unsigned __int8 *)(a1 + 7);
  int v5 = (char)v4;
  int v7 = *(unsigned __int8 *)(a1 + 8);
  uint64_t v6 = a1 + 8;
  BOOL v8 = (v7 - 48) < 0xA;
  int v9 = 10000 * (char)v3;
  unsigned int v10 = v9 + 100 * v5 - 484800;
  LODWORD(v11) = v9 + 1000 * v5 + 100 * (char)v7 - 532800;
  else {
    uint64_t v11 = v10;
  }
  if (v11 >= 0x4B0)
  {
    if (*(_WORD *)(v6 + v8) == 2573) {
      return v11;
    }
    else {
      return 0LL;
    }
  }

  int v12 = *(unsigned __int8 *)(v6 + v8);
  if (v12 != 9 && v12 != 32) {
    return 0LL;
  }
  return v11;
}

uint64_t sub_180703844(const void *a1, size_t __n, char *a3, uint64_t a4)
{
  uint64_t result = (uint64_t)memchr(a1, *a3, __n);
  if (result)
  {
    uint64_t v9 = result;
    unint64_t v10 = (unint64_t)a1 + __n;
    uint64_t v11 = (char *)(result + 1);
    if (result + 1 >= (unint64_t)a1 + __n || a4 < 2)
    {
      if (a4 > 1) {
        return 0LL;
      }
    }

    else
    {
      uint64_t v13 = 0LL;
      size_t v14 = &a3[a4];
      int v15 = *(char *)result;
      LOBYTE(v16) = 1;
      int v17 = v15;
      do
      {
        int v18 = *(unsigned __int8 *)(result + v13 + 1);
        v17 ^= (char)v18;
        int v19 = a3[v13 + 1];
        v15 ^= (char)v19;
        int v16 = v16 & (v18 == v19);
        unint64_t v20 = (unint64_t)&a3[v13 + 2];
        unint64_t v21 = result + v13++ + 2;
      }

      while (v21 < v10 && v20 < (unint64_t)v14);
      if (!v16)
      {
        if (v21 >= v10) {
          return 0LL;
        }
        uint64_t v22 = 0LL;
        size_t v23 = (size_t)a1 + __n + ~result - v13;
        size_t v24 = a4 - 1;
        while (1)
        {
          v17 ^= *(v11 - 1) ^ *(char *)(v9 + v22 + v13 + 1);
          if (v17 == v15 && !memcmp(v11, a3, v24)) {
            break;
          }
          uint64_t result = 0LL;
          ++v11;
          ++v22;
          if (!--v23) {
            return result;
          }
        }

        return (uint64_t)v11;
      }
    }
  }

  return result;
}

time_t sub_1807039A8(unsigned __int8 *a1, void *a2)
{
  while (1)
  {
    int v3 = *a1;
    if (v3 != 9 && v3 != 32) {
      break;
    }
    ++a1;
  }

  if ((v3 - 48) > 9)
  {
    int v8 = 0;
    int v7 = a1;
  }

  else
  {
    int v4 = 0;
    int v5 = a1 + 1;
    int v6 = 4095;
    do
    {
      int v7 = v5;
      int v8 = v4 + v3 - 48;
      v6 /= 10;
      int v4 = 10 * v8;
      ++v5;
      int v3 = *v7;
    }

    while ((v3 - 48) <= 9);
  }

  else {
    int v10 = -2;
  }
  if (a1 == v7) {
    int v10 = -1;
  }
  time_t v36 = v7;
  v35.tm_year = v10;
  if (v10 < 0) {
    goto LABEL_30;
  }
  uint64_t v11 = v7 + 1;
  time_t v36 = v7 + 1;
  if (*v7 != 45) {
    goto LABEL_30;
  }
  int v12 = *v11;
  int v13 = 0;
  size_t v14 = v7 + 2;
  unsigned int v15 = 12;
  do
  {
    uint64_t v11 = v14;
    int v16 = v13 + v12 - 48;
    if (v16 > 1 || v15 - 10 >= 0xFFFFFFED) {
      break;
    }
    v15 /= 0xAu;
    int v13 = 10 * v16;
    ++v14;
    int v12 = *v11;
  }

  while ((v12 - 48) <= 9);
  v35.tm_mon = v16;
  int v19 = v11 + 1;
  time_t v36 = v11 + 1;
  if (*v11 != 45) {
    goto LABEL_30;
  }
  int v20 = *v19;
  int v21 = 0;
  uint64_t v22 = v11 + 2;
  unsigned int v23 = 31;
  do
  {
    int v19 = v22;
    int v24 = v21 + v20 - 48;
    if (v24 > 3 || v23 - 10 >= 0xFFFFFFED) {
      break;
    }
    v23 /= 0xAu;
    int v21 = 10 * v24;
    ++v22;
    int v20 = *v19;
  }

  while ((v20 - 48) <= 9);
  if ((v24 - 32) <= 0xFFFFFFE0)
  {
LABEL_42:
    time_t v36 = v19;
    goto LABEL_30;
  }

  v35.uint64_t tm_mday = v24;
  uint64_t v11 = v19 + 1;
  time_t v36 = v19 + 1;
  if (*v19 != 84) {
    goto LABEL_30;
  }
  int v26 = *v11;
  int v27 = 0;
  uint64_t v28 = v19 + 2;
  unsigned int v29 = 23;
  do
  {
    uint64_t v11 = v28;
    int v30 = v27 + v26 - 48;
    if (v30 > 2 || v29 - 10 >= 0xFFFFFFED) {
      break;
    }
    v29 /= 0xAu;
    int v27 = 10 * v30;
    ++v28;
    int v26 = *v11;
  }

  while ((v26 - 48) <= 9);
  if (v30 >= 0x18)
  {
LABEL_29:
    time_t v36 = v11;
    goto LABEL_30;
  }

  v35.tm_hour = v30;
  time_t v36 = v11 + 1;
  if (*v11 != 58
    || (v35.tm_min = sub_180703CD0(v11 + 1, &v36, 0, 59), v35.tm_min < 0)
    || (v33 = *v36, uint64_t v32 = v36 + 1, ++v36, v33 != 58)
    || (v35.tm_sec = sub_180703CD0(v32, &v36, 0, 60), v35.tm_sec < 0)
    || (int v34 = *v36, ++v36, v34 != 90))
  {
LABEL_30:
    time_t result = -1LL;
    if (!a2) {
      return result;
    }
    goto LABEL_31;
  }

  *(int32x2_t *)&v35.tm_mon = vadd_s32(*(int32x2_t *)&v35.tm_mon, (int32x2_t)0xFFFFF894FFFFFFFFLL);
  time_t result = timegm(&v35);
  if (!a2) {
    return result;
  }
LABEL_31:
  *a2 = v36;
  return result;
}

uint64_t sub_180703CD0(unsigned __int8 *a1, unsigned __int8 **a2, int a3, int a4)
{
  if (a4 < 1 || (int v4 = *a1, (v4 - 48) > 9))
  {
    int v9 = 0;
    int v8 = a1;
  }

  else
  {
    int v5 = 0;
    int v6 = a1 + 1;
    int v7 = a4;
    do
    {
      int v8 = v6;
      int v9 = v5 + v4 - 48;
      int v5 = 10 * v9;
      v7 /= 10;
      ++v6;
      int v4 = *v8;
    }

    while ((v4 - 48) <= 9);
  }

  if (v9 > a4 || v9 < a3) {
    int v9 = -2;
  }
  if (v8 == a1) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = v9;
  }
  *a2 = v8;
  return result;
}

uint64_t archive_version_details()
{
  time_t v0 = (char *)BZ2_bzlibVersion();
  qword_18C533A88 = 0LL;
  unk_18C533A90 = 0LL;
  qword_18C533A80 = 0LL;
  sub_1806F76CC(&qword_18C533A80, "libarchive 3.5.3");
  sub_1806F76CC(&qword_18C533A80, " zlib/");
  sub_1806F76CC(&qword_18C533A80, "1.2.12");
  sub_1806F76CC(&qword_18C533A80, " liblzma/");
  sub_1806F76CC(&qword_18C533A80, "5.4.3");
  if (v0)
  {
    uint64_t v1 = strchr(v0, 44);
    if (!v1) {
      uint64_t v1 = &v0[strlen(v0)];
    }
    sub_1806F76CC(&qword_18C533A80, " bz2lib/");
    sub_1806F7634(&qword_18C533A80, v0, v1 - v0);
  }

  return qword_18C533A80;
}

const char *archive_zlib_version()
{
  return "1.2.12";
}

const char *archive_liblzma_version()
{
  return "5.4.3";
}

uint64_t archive_liblz4_version()
{
  return 0LL;
}

uint64_t archive_libzstd_version()
{
  return 0LL;
}

uint64_t archive_write_set_format_cpio_newc( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 1, "archive_write_set_format_cpio_newc", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    int v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10) {
      v10(a1);
    }
    uint64_t v11 = calloc(1uLL, 0x28uLL);
    if (v11)
    {
      int v17 = v11;
      uint64_t result = 0LL;
      *(void *)(a1 + 264) = v17;
      *(void *)(a1 + 272) = "cpio";
      *(void *)(a1 + 304) = sub_180704000;
      *(void *)(a1 + 312) = sub_180704108;
      *(void *)(a1 + 288) = sub_180703F5C;
      *(void *)(a1 + 296) = sub_180704150;
      *(void *)(a1 + 320) = sub_180704164;
      *(void *)(a1 + 328) = sub_1807041C8;
      *(_DWORD *)(a1 + 16) = 65540;
      *(void *)(a1 + 24) = "SVR4 cpio nocrc";
    }

    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate cpio data", v12, v13, v14, v15, v16, v18);
      return 4294967266LL;
    }
  }

  return result;
}

uint64_t sub_180703F5C(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5 = *(void *)(a1 + 264);
  if (a3 && *a3)
  {
    uint64_t v12 = sub_1806F7A20(a1, a3, 0);
    *(void *)(v5 + 16) = v12;
    if (v12) {
      return 0LL;
    }
    else {
      return 4294967266LL;
    }
  }

  else
  {
    archive_set_error( (_DWORD *)a1,  -1,  "%s: hdrcharset option needs a character-set name",  v6,  v7,  v8,  v9,  v10,  *(char **)(a1 + 272));
    return 4294967271LL;
  }

uint64_t sub_180704000(_DWORD *a1, uint64_t *a2)
{
  if (archive_entry_filetype((uint64_t)a2) || archive_entry_hardlink((uint64_t)a2))
  {
    uint64_t v9 = sub_1807041F4((uint64_t)a1);
    if (sub_1806AA3BC(a2, &v13, &v12, v9) && *__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Pathname", v4, v5, v6, v7, v8, v12);
      return 4294967266LL;
    }

    if (v12 && v13 && *v13)
    {
      if (archive_entry_hardlink((uint64_t)a2)
        || archive_entry_size_is_set((uint64_t)a2)
        && (archive_entry_size((uint64_t)a2) & 0x8000000000000000LL) == 0)
      {
        return sub_180704240((uint64_t)a1, a2);
      }

      uint64_t v11 = "Size required";
    }

    else
    {
      uint64_t v11 = "Pathname required";
    }
  }

  else
  {
    uint64_t v11 = "Filetype required";
  }

  archive_set_error(a1, -1, v11, v4, v5, v6, v7, v8, v12);
  return 4294967271LL;
}

uint64_t sub_180704108(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v3 = *(uint64_t **)(a1 + 264);
  if (*v3 >= a3) {
    uint64_t v4 = a3;
  }
  else {
    uint64_t v4 = *v3;
  }
  LODWORD(result) = sub_1806FDA50(a1, a2, v4);
  *v3 -= v4;
  else {
    return (int)result;
  }
}

uint64_t sub_180704150(uint64_t a1)
{
  return sub_1806FDAB0((void *)a1, **(void **)(a1 + 264) + *(int *)(*(void *)(a1 + 264) + 8LL));
}

uint64_t sub_180704164(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)archive_entry_new();
  archive_entry_set_nlink((uint64_t)v2, 1);
  archive_entry_set_size((uint64_t)v2, 0LL);
  archive_entry_set_pathname((uint64_t)v2, "TRAILER!!!");
  uint64_t v3 = sub_180704240(a1, v2);
  archive_entry_free((void **)v2);
  return v3;
}

uint64_t sub_1807041C8(uint64_t a1)
{
  *(void *)(a1 + 264) = 0LL;
  return 0LL;
}

uint64_t sub_1807041F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 264);
  uint64_t result = *(void *)(v1 + 16);
  if (!result)
  {
    if (*(_DWORD *)(v1 + 32))
    {
      return *(void *)(v1 + 24);
    }

    else
    {
      uint64_t result = sub_1806F7E68();
      *(void *)(v1 + 24) = result;
      *(_DWORD *)(v1 + 32) = 1;
    }
  }

  return result;
}

uint64_t sub_180704240(uint64_t a1, uint64_t *a2)
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 264);
  uint64_t v5 = sub_1807041F4(a1);
  if (sub_1806AA3BC(a2, &v59, &v58, v5))
  {
    if (*__error() == 12)
    {
      uint64_t v11 = "Can't allocate memory for Pathname";
LABEL_37:
      archive_set_error((_DWORD *)a1, 12, v11, v6, v7, v8, v9, v10, v57);
LABEL_50:
      uint64_t v52 = 4294967266LL;
      goto LABEL_51;
    }

    uint64_t v13 = (char *)archive_entry_pathname(a2);
    sub_1806F7F14(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate pathname '%s' to %s", v14, v15, v16, v17, v18, v13);
    uint64_t v12 = 4294967276LL;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  uint64_t v19 = v58;
  memset(v61, 0, 110);
  sub_1807046F8(0x70701uLL, v61, 6);
  LODWORD(v20) = archive_entry_devmajor((uint64_t)a2);
  if ((v20 & 0x80000000) == 0LL) {
    unint64_t v20 = (int)v20;
  }
  else {
    unint64_t v20 = 0xFFFFFFFFLL;
  }
  sub_1807046F8(v20, (_BYTE *)&v61[3] + 14, 8);
  LODWORD(v21) = archive_entry_devminor(a2);
  if ((v21 & 0x80000000) == 0LL) {
    unint64_t v21 = (int)v21;
  }
  else {
    unint64_t v21 = 0xFFFFFFFFLL;
  }
  sub_1807046F8(v21, (_BYTE *)&v61[4] + 6, 8);
  uint64_t v22 = archive_entry_ino64((uint64_t)a2);
  unsigned int v28 = v22;
  if (v22 >= 0x100000000LL)
  {
    archive_set_error((_DWORD *)a1, 34, "large inode number truncated", v23, v24, v25, v26, v27, v57);
    uint64_t v12 = 4294967276LL;
  }

  sub_1807046F8(v28, (_BYTE *)v61 + 6, 8);
  unsigned int v29 = archive_entry_mode((uint64_t)a2);
  sub_1807046F8(v29, (_BYTE *)((unint64_t)v61 | 0xE), 8);
  unint64_t v30 = archive_entry_uid((uint64_t)a2);
  if (v30 >= 0xFFFFFFFF) {
    unint64_t v30 = 0xFFFFFFFFLL;
  }
  sub_1807046F8(v30, (_BYTE *)&v61[1] + 6, 8);
  unint64_t v31 = archive_entry_gid((uint64_t)a2);
  if (v31 >= 0xFFFFFFFF) {
    unint64_t v31 = 0xFFFFFFFFLL;
  }
  sub_1807046F8(v31, (_BYTE *)&v61[1] + 14, 8);
  unsigned int v32 = archive_entry_nlink((uint64_t)a2);
  sub_1807046F8(v32, (_BYTE *)&v61[2] + 6, 8);
  if (archive_entry_filetype((uint64_t)a2) == 24576
    || archive_entry_filetype((uint64_t)a2) == 0x2000)
  {
    LODWORD(v33) = archive_entry_rdevmajor((uint64_t)a2);
    if ((v33 & 0x80000000) == 0LL) {
      unint64_t v33 = (int)v33;
    }
    else {
      unint64_t v33 = 0xFFFFFFFFLL;
    }
    sub_1807046F8(v33, (_BYTE *)&v61[4] + 14, 8);
    LODWORD(v34) = archive_entry_rdevminor(a2);
    if ((v34 & 0x80000000) == 0LL) {
      unint64_t v34 = (int)v34;
    }
    else {
      unint64_t v34 = 0xFFFFFFFFLL;
    }
  }

  else
  {
    sub_1807046F8(0LL, (_BYTE *)&v61[4] + 14, 8);
    unint64_t v34 = 0LL;
  }

  sub_1807046F8(v34, (_BYTE *)&v61[5] + 6, 8);
  unint64_t v35 = archive_entry_mtime((uint64_t)a2);
  if (v35 >= 0xFFFFFFFF) {
    unint64_t v35 = 0xFFFFFFFFLL;
  }
  sub_1807046F8(v35, (_BYTE *)&v61[2] + 14, 8);
  uint64_t v36 = (v19 << 32) + 0x100000000LL;
  uint64_t v37 = v36 >> 32;
  if (v36 >= 0) {
    unint64_t v38 = v36 >> 32;
  }
  else {
    unint64_t v38 = 0xFFFFFFFFLL;
  }
  sub_1807046F8(v38, (_BYTE *)&v61[5] + 14, 8);
  sub_1807046F8(0LL, (_BYTE *)&v61[6] + 6, 8);
  if (sub_1806AA610((uint64_t)a2, &__s, &v58, v5))
  {
    if (*__error() == 12)
    {
      uint64_t v11 = "Can't allocate memory for Likname";
      goto LABEL_37;
    }

    uint64_t v39 = (char *)archive_entry_symlink((uint64_t)a2);
    sub_1806F7F14(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v40, v41, v42, v43, v44, v39);
    uint64_t v12 = 4294967276LL;
  }

  if (v58 && __s && *__s) {
    unint64_t v45 = strlen(__s);
  }
  else {
    unint64_t v45 = archive_entry_size((uint64_t)a2);
  }
  unint64_t v46 = v45;
  if (v45 >= 0xFFFFFFFF) {
    unint64_t v45 = 0xFFFFFFFFLL;
  }
  sub_1807046F8(v45, (_BYTE *)&v61[3] + 6, 8);
  if (HIDWORD(v46))
  {
    archive_set_error((_DWORD *)a1, 34, "File is too large for this format.", v47, v48, v49, v50, v51, v57);
    uint64_t v52 = 4294967271LL;
  }

  else
  {
    if (sub_1806FDA50(a1, (uint64_t)v61, 110LL)
      || sub_1806FDA50(a1, v59, v37)
      || ((1 - (_BYTE)v19) & 3) != 0 && sub_1806FDA50(a1, (uint64_t)&unk_1807202B0, (1 - (_BYTE)v19) & 3))
    {
      goto LABEL_50;
    }

    uint64_t v54 = archive_entry_size((uint64_t)a2);
    *(void *)uint64_t v4 = v54;
    *(_DWORD *)(v4 + 8) = -(int)v54 & 3;
    if (__s && *__s)
    {
      size_t v55 = strlen(__s);
      uint64_t v52 = 4294967266LL;
      if (!sub_1806FDA50(a1, (uint64_t)__s, v55))
      {
        int v56 = strlen(__s);
        else {
          uint64_t v52 = v12;
        }
      }
    }

    else
    {
      uint64_t v52 = v12;
    }
  }

unint64_t sub_1807046F8(unint64_t result, _BYTE *a2, int a3)
{
  if (a3)
  {
    unint64_t v4 = sub_1807046F8(result, a2 + 1, (a3 - 1));
    *a2 = a0123456789abcd[v4 & 0xF];
    return v4 >> 4;
  }

  return result;
}

uint64_t archive_write_set_format_mtree( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_180704748(a1, "archive_write_set_format_mtree", a3, a4, a5, a6, a7, a8);
}

uint64_t sub_180704748( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 1, a2, a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    uint64_t v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10) {
      v10(a1);
    }
    uint64_t v11 = calloc(1uLL, 0x3C8uLL);
    if (v11)
    {
      uint64_t v17 = v11;
      uint64_t result = 0LL;
      *(void *)uint64_t v17 = 0LL;
      v17[28] = 1;
      *((void *)v17 + 22) = 0LL;
      *((_OWORD *)v17 + 9) = 0u;
      *((_OWORD *)v17 + 10) = 0u;
      *((_OWORD *)v17 + 8) = 0u;
      *((void *)v17 + 119) = 4032058LL;
      *((void *)v17 + 6) = 0LL;
      v17[240] = 0;
      *((_OWORD *)v17 + 4) = 0u;
      *((_OWORD *)v17 + 5) = 0u;
      *((void *)v17 + 7) = v17 + 12;
      *((_OWORD *)v17 + 6) = 0u;
      *(void *)(a1 + 320) = sub_1807053E4;
      *(void *)(a1 + 328) = sub_180704894;
      *(void *)(a1 + 304) = sub_180704CE8;
      *(void *)(a1 + 312) = sub_180705830;
      *(void *)(a1 + 288) = sub_180704908;
      *(void *)(a1 + 296) = sub_180705994;
      *(_DWORD *)(a1 + 16) = 0x80000;
      *(void *)(a1 + 264) = v17;
      *(void *)(a1 + 272) = "mtree";
      *(void *)(a1 + 24) = "mtree";
    }

    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate mtree data", v12, v13, v14, v15, v16, v18);
      return 4294967266LL;
    }
  }

  return result;
}

uint64_t archive_write_set_format_mtree_classic( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_180704748(a1, "archive_write_set_format_mtree_classic", a3, a4, a5, a6, a7, a8);
  if (!(_DWORD)result)
  {
    uint64_t v10 = *(void *)(a1 + 264);
    *(_DWORD *)(v10 + 216) = 1;
    *(_DWORD *)(v10 + 964) = 1;
  }

  return result;
}

uint64_t sub_180704894(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 264);
  if (v1)
  {
    uint64_t v3 = v1[6];
    if (v3)
    {
      do
      {
        uint64_t v4 = *(void *)(v3 + 24);
        sub_180705B5C((void **)v3);
        uint64_t v3 = v4;
      }

      while (v4);
    }

    sub_1806F755C((uint64_t)(v1 + 3));
    sub_1806F755C((uint64_t)(v1 + 8));
    sub_1806F755C((uint64_t)(v1 + 11));
    sub_180705AD0(v1);
    free(v1);
    *(void *)(a1 + 264) = 0LL;
  }

  return 0LL;
}

uint64_t sub_180704908(uint64_t a1, char *__s1, uint64_t a3)
{
  uint64_t result = 4294967276LL;
  uint64_t v7 = *(_DWORD **)(a1 + 264);
  switch(*__s1)
  {
    case 'a':
      if (strcmp(__s1, "all")) {
        return 4294967276LL;
      }
      int v8 = -1;
      goto LABEL_63;
    case 'c':
      if (strcmp(__s1, "cksum")) {
        return 4294967276LL;
      }
      int v8 = 1;
      goto LABEL_63;
    case 'd':
      if (!strcmp(__s1, "device"))
      {
        int v8 = 2;
        goto LABEL_63;
      }

      uint64_t result = strcmp(__s1, "dironly");
      if ((_DWORD)result) {
        return 4294967276LL;
      }
      v7[239] = a3 != 0;
      return result;
    case 'f':
      if (strcmp(__s1, "flags")) {
        return 4294967276LL;
      }
      int v8 = 8;
      goto LABEL_63;
    case 'g':
      if (!strcmp(__s1, "gid"))
      {
        int v8 = 16;
      }

      else
      {
        if (strcmp(__s1, "gname")) {
          return 4294967276LL;
        }
        int v8 = 32;
      }

      goto LABEL_63;
    case 'i':
      uint64_t result = strcmp(__s1, "indent");
      if (!(_DWORD)result)
      {
        v7[240] = a3 != 0;
        return result;
      }

      if (strcmp(__s1, "inode")) {
        return 4294967276LL;
      }
      int v8 = 0x4000000;
      goto LABEL_63;
    case 'l':
      if (strcmp(__s1, "link")) {
        return 4294967276LL;
      }
      int v8 = 0x10000;
      goto LABEL_63;
    case 'm':
      if (!strcmp(__s1, "md5") || !strcmp(__s1, "md5digest")) {
        int v8 = 256;
      }
      else {
        int v8 = 0;
      }
      if (strcmp(__s1, "mode")) {
        goto LABEL_53;
      }
      int v8 = 512;
      goto LABEL_63;
    case 'n':
      if (strcmp(__s1, "nlink")) {
        return 4294967276LL;
      }
      int v8 = 1024;
      goto LABEL_63;
    case 'r':
      if (!strcmp(__s1, "resdevice"))
      {
        int v8 = 0x8000000;
        goto LABEL_63;
      }

      if (!strcmp(__s1, "ripemd160digest") || !strcmp(__s1, "rmd160") || !strcmp(__s1, "rmd160digest"))
      {
        int v8 = 0x2000;
        goto LABEL_63;
      }

      return 4294967276LL;
    case 's':
      if (!strcmp(__s1, "sha1") || !strcmp(__s1, "sha1digest")) {
        int v8 = 0x4000;
      }
      else {
        int v8 = 0;
      }
      if (!strcmp(__s1, "sha256") || !strcmp(__s1, "sha256digest")) {
        int v8 = 0x800000;
      }
      if (!strcmp(__s1, "sha384") || !strcmp(__s1, "sha384digest")) {
        int v8 = 0x1000000;
      }
      if (!strcmp(__s1, "sha512") || !strcmp(__s1, "sha512digest")) {
        int v8 = 0x2000000;
      }
      if (!strcmp(__s1, "size"))
      {
        int v8 = 0x8000;
        goto LABEL_63;
      }

uint64_t sub_180704CE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 264);
  if (*(_DWORD *)(v4 + 112))
  {
    *(_DWORD *)(v4 + 112) = 0;
    sub_1806F76CC((uint64_t *)(v4 + 88), "#mtree\n");
    if ((*(_DWORD *)(v4 + 952) & 0x380238) == 0) {
      *(_DWORD *)(v4 + 964) = 0;
    }
  }

  *(void *)(v4 + 120) = archive_entry_size((uint64_t)a2);
  uint64_t v10 = sub_180705BC4((_DWORD *)a1, a2, &v54);
  if ((int)v10 >= -20)
  {
    uint64_t v11 = *(void *)(a1 + 264);
    uint64_t v12 = v54;
    uint64_t v13 = v54[8];
    if (v13)
    {
      uint64_t v14 = (char *)v54[7];
      if (*(void **)(v11 + 32) != v13 || strcmp(*(const char **)(v11 + 24), (const char *)v54[7]))
      {
        unsigned int v53 = v10;
        uint64_t v15 = *(void ***)(v11 + 8);
        unsigned int v21 = sub_1806C9214(v59, v14);
        for (uint64_t i = v14; v21; v21 = sub_1806C9214(v59, i))
        {
          while (1)
          {
            if ((v21 & 0x80000000) != 0) {
              goto LABEL_65;
            }
            if (v21 == 1 && v59[0] == 46 && v15 != 0LL) {
              break;
            }
            if (!v15) {
              goto LABEL_31;
            }
LABEL_23:
            uint64_t v25 = sub_1806FE9B4((uint64_t *)v15[5], (uint64_t)v59);
            if (!v25) {
              goto LABEL_31;
            }
            uint64_t v26 = (void **)v25;
            if (!*i)
            {
              uint64_t v10 = v53;
              goto LABEL_69;
            }

            if (!*(void *)(v25 + 40))
            {
              goto LABEL_86;
            }

            uint64_t v27 = &i[v21];
            int v29 = *v27;
            unsigned int v28 = v27 + 1;
            if (v29 == 47) {
              uint64_t i = v28;
            }
            else {
              i += v21;
            }
            unsigned int v21 = sub_1806C9214(v59, i);
            uint64_t v15 = v26;
            if (!v21)
            {
              uint64_t v15 = v26;
              goto LABEL_31;
            }
          }

          int v24 = *++i;
          if (v24 == 47) {
            ++i;
          }
        }

LABEL_102:
            else {
              *(_DWORD *)(v4 + 224) |= 0x2000000u;
            }
            return v10;
          }

          if (sub_1806FF078((CC_MD5_CTX *)(v4 + 240)))
          {
            unsigned int v48 = *(_DWORD *)(v4 + 952) & 0xFFFFFEFF;
            *(_DWORD *)(v4 + 952) = v48;
            if ((v48 & 0x4000) != 0) {
              goto LABEL_90;
            }
          }

          else
          {
            *(_DWORD *)(v4 + 224) |= 0x100u;
            unsigned int v48 = *(_DWORD *)(v4 + 952);
            if ((v48 & 0x4000) != 0) {
              goto LABEL_90;
            }
          }

uint64_t sub_1807053E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 264);
  uint64_t v10 = *(void *)(v9 + 8);
  if (!v10)
  {
LABEL_75:
    archive_write_set_bytes_in_last_block((int *)a1, 1, a3, a4, a5, a6, a7, a8);
    return sub_1806FDA50(a1, *(void *)(v9 + 88), *(void *)(v9 + 96));
  }

  uint64_t v11 = (uint64_t **)(v9 + 184);
  uint64_t v12 = (uint64_t **)(v9 + 192);
  uint64_t v13 = (uint64_t **)(v9 + 200);
  uint64_t v14 = (uint64_t **)(v9 + 208);
  while (1)
  {
    if (*(_DWORD *)(v9 + 964))
    {
      sub_180705AD0((void *)v9);
      unint64_t v15 = sub_1806FEE10(*(unint64_t **)(v10 + 40), 0LL, 0);
      if (v15) {
        break;
      }
    }

unint64_t sub_180705830(uint64_t a1, unsigned __int8 *a2, unint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 264);
  unint64_t v4 = *(void *)(v3 + 120);
  if (v4 >= a3) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = *(void *)(v3 + 120);
  }
  *(void *)(v3 + 120) = v4 - v5;
  int v7 = *(_DWORD *)(v3 + 224);
  if ((v7 & 1) != 0)
  {
    if (v5)
    {
      unsigned int v9 = *(_DWORD *)(v3 + 228);
      unint64_t v10 = v5;
      uint64_t v11 = a2;
      do
      {
        int v12 = *v11++;
        unsigned int v9 = dword_1807203E4[v12 ^ HIBYTE(v9)] ^ (v9 << 8);
        *(_DWORD *)(v3 + 228) = v9;
        --v10;
      }

      while (v10);
    }

    *(void *)(v3 + 232) += v5;
    if ((v7 & 0x100) == 0)
    {
LABEL_8:
      if ((v7 & 0x4000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
  }

  else if ((v7 & 0x100) == 0)
  {
    goto LABEL_8;
  }

  sub_1806FF090((CC_MD5_CTX *)(v3 + 240), a2, v5);
  int v7 = *(_DWORD *)(v3 + 224);
  if ((v7 & 0x4000) == 0)
  {
LABEL_9:
    if ((v7 & 0x800000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }

uint64_t sub_180705994(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 264);
  uint64_t v2 = *v1;
  if (*v1)
  {
    uint64_t *v1 = 0LL;
    uint64_t v3 = *(void *)(v2 + 48);
    if (v3)
    {
      int v4 = *((_DWORD *)v1 + 56);
      if ((v4 & 1) != 0)
      {
        unint64_t v6 = v1[29];
        unsigned int v7 = *((_DWORD *)v1 + 57);
        if (v6)
        {
          do
          {
            unsigned int v7 = dword_1807203E4[v6 ^ (unint64_t)HIBYTE(v7)] ^ (v7 << 8);
            BOOL v8 = v6 > 0xFF;
            v6 >>= 8;
          }

          while (v8);
          *((_DWORD *)v1 + 57) = v7;
        }

        *(_DWORD *)(v3 + 4) = ~v7;
        if ((v4 & 0x100) == 0)
        {
LABEL_5:
          if ((v4 & 0x4000) == 0) {
            goto LABEL_6;
          }
          goto LABEL_17;
        }
      }

      else if ((v4 & 0x100) == 0)
      {
        goto LABEL_5;
      }

      sub_1806FF0A8((CC_MD5_CTX *)(v1 + 30), (unsigned __int8 *)(v3 + 8));
      int v4 = *((_DWORD *)v1 + 56);
      if ((v4 & 0x4000) == 0)
      {
LABEL_6:
        if ((v4 & 0x800000) == 0) {
          goto LABEL_7;
        }
        goto LABEL_18;
      }

void *sub_180705AD0(void *a1)
{
  uint64_t v2 = (void *)a1[23];
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)v2[1];
      free(v2);
      uint64_t v2 = v3;
    }

    while (v3);
    a1[23] = 0LL;
  }

  int v4 = (void *)a1[24];
  if (v4)
  {
    do
    {
      unint64_t v5 = (void *)v4[1];
      free(v4);
      int v4 = v5;
    }

    while (v5);
    a1[24] = 0LL;
  }

  unint64_t v6 = (void *)a1[25];
  if (v6)
  {
    do
    {
      unsigned int v7 = (void *)v6[1];
      free(v6);
      unint64_t v6 = v7;
    }

    while (v7);
    a1[25] = 0LL;
  }

  uint64_t result = (void *)a1[26];
  if (result)
  {
    do
    {
      unsigned int v9 = (void *)result[1];
      free(result);
      uint64_t result = v9;
    }

    while (v9);
    a1[26] = 0LL;
  }

  return result;
}

void sub_180705B5C(void **a1)
{
}

uint64_t sub_180705BC4(_DWORD *a1, uint64_t *a2, void *a3)
{
  unint64_t v6 = (char *)calloc(1uLL, 0x138uLL);
  int v12 = v6;
  if (!v6)
  {
    archive_set_error(a1, 12, "Can't allocate memory for a mtree entry", v7, v8, v9, v10, v11, v66);
LABEL_82:
    uint64_t result = 4294967266LL;
    goto LABEL_83;
  }

  uint64_t v13 = (const char **)(v6 + 104);
  *((void *)v6 + 14) = 0LL;
  uint64_t v14 = (_BYTE *)archive_entry_pathname(a2);
  if (archive_entry_pathname(a2))
  {
    unint64_t v15 = (const char *)archive_entry_pathname(a2);
    size_t v16 = strlen(v15);
  }

  else
  {
    size_t v16 = 0LL;
  }

  sub_1806F7634((uint64_t *)v12 + 13, v14, v16);
  int v17 = (char *)*v13;
  if (!strcmp(*v13, "."))
  {
    uint64_t v19 = (uint64_t *)(v12 + 80);
    *((void *)v12 + 11) = 0LL;
    uint64_t v20 = ".";
    size_t v21 = 1LL;
    goto LABEL_64;
  }

  *((void *)v12 + 8) = 0LL;
  if (v17) {
    size_t v18 = strlen(v17);
  }
  else {
    size_t v18 = 0LL;
  }
  sub_1806F7634((uint64_t *)v12 + 7, v17, v18);
  uint64_t v22 = (char *)*((void *)v12 + 7);
  unint64_t v23 = *((void *)v12 + 8);
  uint64_t v24 = v22;
  while (1)
  {
    int v25 = *v24;
    if (v25 != 47) {
      break;
    }
    uint64_t v26 = -1LL;
    uint64_t v27 = 1LL;
LABEL_18:
    v24 += v27;
    v23 += v26;
  }

  if (v25 == 46 && v24[1] == 46 && v24[2] == 47)
  {
    uint64_t v26 = -3LL;
    uint64_t v27 = 3LL;
    goto LABEL_18;
  }

  if (v24 != v22) {
    memmove(*((void **)v12 + 7), v24, v23 + 1);
  }
  do
  {
    if (!v23) {
      break;
    }
    unint64_t v28 = v23;
    if (v22[v23 - 1] == 47)
    {
      v22[v23 - 1] = 0;
      unint64_t v28 = v23 - 1;
    }

    unint64_t v29 = v28 - 2;
    if (v28 >= 2)
    {
      if (v22[v29] == 47 && v22[v28 - 1] == 46)
      {
        v22[v29] = 0;
        v28 -= 2LL;
      }

      unint64_t v30 = v28 - 3;
      if (v28 >= 3 && v22[v30] == 47 && v22[v28 - 2] == 46 && v22[v28 - 1] == 46)
      {
        v22[v30] = 0;
        v28 -= 3LL;
      }
    }

    BOOL v31 = v23 == v28;
    unint64_t v23 = v28;
  }

  while (!v31);
LABEL_35:
  uint64_t v32 = v22;
  while (2)
  {
    while (1)
    {
      uint64_t v33 = v32;
      if (*v32 != 47) {
        break;
      }
      ++v32;
      int v34 = *((unsigned __int8 *)v33 + 1);
      if (v34 != 46)
      {
        if (v34 != 47) {
          continue;
        }
        size_t v35 = strlen(v33 + 1) + 1;
        uint64_t v36 = (char *)v33;
        uint64_t v37 = v33 + 1;
LABEL_45:
        memmove(v36, v37, v35);
        uint64_t v32 = (char *)v33;
        continue;
      }

      int v38 = *((unsigned __int8 *)v33 + 2);
      if (v38 != 46)
      {
        if (v38 != 47) {
          continue;
        }
        size_t v35 = strlen(v33 + 2) + 1;
        uint64_t v36 = (char *)v33;
        uint64_t v37 = v33 + 2;
        goto LABEL_45;
      }

      if (v33[3] == 47)
      {
        time_t v39 = (char *)(v33 - 1);
        do
        {
          uint64_t v32 = v39;
          if (v39 < v22) {
            break;
          }
          --v39;
        }

        while (*v32 != 47);
        if (v32 <= v22)
        {
          strcpy(v22, v33 + 4);
          goto LABEL_35;
        }

        strcpy(v32, v33 + 3);
      }
    }

    if (*v32)
    {
      ++v32;
      continue;
    }

    break;
  }

  size_t v40 = strlen(v22);
  if (strcmp(v22, ".") && strncmp(v22, "./", 2uLL))
  {
    memset(v67, 0, sizeof(v67));
    sub_1806F7634(v67, "./", 2uLL);
    sub_1806F7634(v67, v22, v40);
    *((void *)v12 + 8) = 0LL;
    sub_1806F7484((uint64_t *)v12 + 7, (uint64_t)v67);
    sub_1806F755C((uint64_t)v67);
    uint64_t v22 = (char *)*((void *)v12 + 7);
    size_t v40 = *((void *)v12 + 8);
  }

  unint64_t v41 = 0LL;
  while (2)
  {
    if (*v22 == 47)
    {
      unint64_t v41 = v22;
      goto LABEL_61;
    }

    if (*v22)
    {
LABEL_61:
      ++v22;
      continue;
    }

    break;
  }

  if (v41)
  {
    char *v41 = 0;
    uint64_t v42 = v41 + 1;
    *((void *)v12 + 8) = &v41[-*((void *)v12 + 7)];
    *((void *)v12 + 11) = 0LL;
    size_t v21 = strlen(v41 + 1);
    uint64_t v19 = (uint64_t *)(v12 + 80);
    uint64_t v20 = v42;
LABEL_64:
    sub_1806F7634(v19, v20, v21);
  }

  else
  {
    *((void *)v12 + 8) = v40;
    *((void *)v12 + 11) = 0LL;
    sub_1806F7484((uint64_t *)v12 + 10, (uint64_t)(v12 + 56));
    *((void *)v12 + 8) = 0LL;
    **((_BYTE **)v12 + 7) = 0;
  }

  uint64_t v43 = (const char *)archive_entry_symlink((uint64_t)a2);
  if (v43)
  {
    int v44 = (char *)v43;
    *((void *)v12 + 17) = 0LL;
    size_t v45 = strlen(v43);
    sub_1806F7634((uint64_t *)v12 + 16, v44, v45);
  }

  *((_DWORD *)v12 + 56) = archive_entry_nlink((uint64_t)a2);
  *((_WORD *)v12 + 114) = archive_entry_filetype((uint64_t)a2);
  *((_WORD *)v12 + 115) = archive_entry_mode((uint64_t)a2) & 0xFFF;
  *((void *)v12 + 30) = archive_entry_uid((uint64_t)a2);
  *((void *)v12 + 31) = archive_entry_gid((uint64_t)a2);
  unint64_t v46 = (const char *)archive_entry_uname(a2);
  if (v46)
  {
    uint64_t v47 = (char *)v46;
    *((void *)v12 + 20) = 0LL;
    size_t v48 = strlen(v46);
    sub_1806F7634((uint64_t *)v12 + 19, v47, v48);
  }

  uint64_t v49 = (const char *)archive_entry_gname(a2);
  if (v49)
  {
    unsigned int v50 = (char *)v49;
    *((void *)v12 + 23) = 0LL;
    size_t v51 = strlen(v49);
    sub_1806F7634((uint64_t *)v12 + 22, v50, v51);
  }

  uint64_t v52 = archive_entry_fflags_text(a2);
  if (v52)
  {
    unsigned int v53 = v52;
    *((void *)v12 + 26) = 0LL;
    size_t v54 = strlen(v52);
    sub_1806F7634((uint64_t *)v12 + 25, v53, v54);
  }

  archive_entry_fflags((uint64_t)a2, (void *)v12 + 34, (void *)v12 + 35);
  *((void *)v12 + 32) = archive_entry_mtime((uint64_t)a2);
  *((void *)v12 + 33) = archive_entry_mtime_nsec((uint64_t)a2);
  *((_DWORD *)v12 + 72) = archive_entry_rdevmajor((uint64_t)a2);
  *((_DWORD *)v12 + 73) = archive_entry_rdevminor(a2);
  *((_DWORD *)v12 + 74) = archive_entry_devmajor((uint64_t)a2);
  *((_DWORD *)v12 + 75) = archive_entry_devminor(a2);
  *((void *)v12 + 38) = archive_entry_ino((uint64_t)a2);
  *((void *)v12 + 29) = archive_entry_size((uint64_t)a2);
  int v55 = *((unsigned __int16 *)v12 + 114);
  if (v55 == 0x8000)
  {
    uint64_t v59 = calloc(1uLL, 0xD0uLL);
    *((void *)v12 + 6) = v59;
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t result = 0LL;
      *uint64_t v60 = 0;
      goto LABEL_83;
    }

    goto LABEL_81;
  }

  if (v55 != 0x4000)
  {
    uint64_t result = 0LL;
    goto LABEL_83;
  }

  uint64_t v56 = calloc(1uLL, 0x30uLL);
  *((void *)v12 + 5) = v56;
  if (!v56)
  {
LABEL_81:
    sub_180705B5C((void **)v12);
    archive_set_error(a1, 12, "Can't allocate memory for a mtree entry", v61, v62, v63, v64, v65, v66);
    int v12 = 0LL;
    goto LABEL_82;
  }

  sub_1806FE9AC(v56, (uint64_t)&off_18969EE00);
  uint64_t result = 0LL;
  uint64_t v58 = *((void *)v12 + 5);
  *(void *)(v58 + 16) = 0LL;
  v58 += 16LL;
  *(void *)(v58 + 8) = v58;
  *(void *)(v58 + 16) = 0LL;
LABEL_83:
  *a3 = v12;
  return result;
}

uint64_t sub_1807061AC(uint64_t a1, uint64_t a2)
{
  return strcmp(*(const char **)(a2 + 80), *(const char **)(a1 + 80));
}

uint64_t sub_1807061BC(uint64_t a1, char *__s1)
{
  return strcmp(__s1, *(const char **)(a1 + 80));
}

uint64_t sub_1807061CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(void *)(a1 + 264);
  if (*(void *)(a2 + 40))
  {
    if (*(_DWORD *)(v10 + 216))
    {
      if (!*(_DWORD *)(v10 + 956)) {
        sub_1806F76DC((uint64_t *)(v10 + 88), 10);
      }
      uint64_t v11 = (void **)(v10 + 88);
      if (*(void *)(a2 + 56)) {
        sub_1806FBA84(v11, "# %s/%s\n", a3, a4, a5, a6, a7, a8, *(char **)(a2 + 56));
      }
      else {
        sub_1806FBA84(v11, "# %s\n", a3, a4, a5, a6, a7, a8, *(char **)(a2 + 80));
      }
    }

    if (*(_DWORD *)(v10 + 964)) {
      sub_180706780(v10, a2, a3, a4, a5, a6, a7, a8);
    }
  }

  *(void *)(v10 + 72) = 0LL;
  int v12 = *(_DWORD *)(v10 + 216);
  if (*(_DWORD *)(v10 + 960) | v12) {
    uint64_t v13 = (uint64_t *)(v10 + 64);
  }
  else {
    uint64_t v13 = (uint64_t *)(v10 + 88);
  }
  if (!v12)
  {
    uint64_t v14 = *(unsigned __int8 **)(a2 + 56);
    if (v14)
    {
      sub_180706D60(v13, v14);
      sub_1806F76DC(v13, 47);
    }
  }

  sub_180706D60(v13, *(unsigned __int8 **)(a2 + 80));
  int v21 = *(_DWORD *)(v10 + 952);
  int v22 = *(_DWORD *)(v10 + 136);
  if (v22)
  {
    if ((v22 & 0x30) != 0 && *(void *)(v10 + 152) == *(void *)(a2 + 248)) {
      v21 &= 0xFFFFFFCF;
    }
    if ((v22 & 0x300000) != 0 && *(void *)(v10 + 144) == *(void *)(a2 + 240)) {
      v21 &= 0xFFCFFFFF;
    }
    if ((v22 & 8) != 0
      && *(void *)(v10 + 168) == *(void *)(a2 + 272)
      && *(void *)(v10 + 176) == *(void *)(a2 + 280))
    {
      v21 &= ~8u;
    }

    HIDWORD(v24) = *(unsigned __int16 *)(a2 + 228);
    LODWORD(v24) = HIDWORD(v24) - 4096;
    unsigned int v23 = v24 >> 12;
    if (v23 > 0xB) {
      goto LABEL_107;
    }
    if (((1 << v23) & 0xA23) != 0) {
      goto LABEL_32;
    }
    if (v23 == 3)
    {
      if ((v22 & 0x80000) == 0) {
        goto LABEL_32;
      }
      int v32 = 0x4000;
    }

    else
    {
LABEL_107:
      if ((v22 & 0x80000) == 0) {
        goto LABEL_32;
      }
      int v32 = 0x8000;
    }
  }

LABEL_57:
  sub_1806FBA84((void **)v13, " gid=%jd", v15, v16, v17, v18, v19, v20, *(char **)(a2 + 248));
  if ((v21 & 0x100000) == 0)
  {
LABEL_49:
    if ((v21 & 0x4000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_59;
  }

LABEL_58:
  sub_1806FBA84((void **)v13, " uid=%jd", v15, v16, v17, v18, v19, v20, *(char **)(a2 + 240));
  if ((v21 & 0x4000000) == 0)
  {
LABEL_50:
    if ((v21 & 0x8000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }

LABEL_100:
  sub_1806F76CC(v13, " sha1digest=");
  sub_18070710C(v13, v28 + 44, 20);
  int v29 = *(_DWORD *)v28;
  if ((*(_DWORD *)v28 & 0x800000) == 0)
  {
LABEL_89:
    if ((v29 & 0x1000000) == 0) {
      goto LABEL_90;
    }
LABEL_102:
    sub_1806F76CC(v13, " sha384digest=");
    sub_18070710C(v13, v28 + 96, 48);
    if ((*(_DWORD *)v28 & 0x2000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_91;
  }

LABEL_101:
  sub_1806F76CC(v13, " sha256digest=");
  sub_18070710C(v13, v28 + 64, 32);
  int v29 = *(_DWORD *)v28;
  if ((*(_DWORD *)v28 & 0x1000000) != 0) {
    goto LABEL_102;
  }
LABEL_90:
  if ((v29 & 0x2000000) != 0)
  {
LABEL_91:
    sub_1806F76CC(v13, " sha512digest=");
    sub_18070710C(v13, v28 + 144, 64);
  }

              ++v18;
              unint64_t v24 = v27;
              if (v18 >= j) {
                goto LABEL_109;
              }
              continue;
            }
          }
        }
      }
    }

    if (v10 == 92)
    {
      unint64_t j = (char *)(v5 + 1);
      uint64_t v13 = *i;
      if (v5[1])
      {
        if (v5[1] == v13) {
          goto LABEL_110;
        }
      }

      else
      {
        unint64_t j = (char *)v5;
        if (v13 == 92) {
          goto LABEL_110;
        }
      }

      return 0LL;
    }

    goto LABEL_88;
  }

  if (v10 > 41)
  {
    if (v10 != 47)
    {
      if (v10 != 42) {
        goto LABEL_88;
      }
      while (v11 == 42)
      {
        BOOL v31 = *++v5;
        LOBYTE(v11) = v31;
      }

      if (!(_BYTE)v11) {
        return 1LL;
      }
      if (*i)
      {
        do
        {
          int v32 = sub_18070722C(v5, i, a3);
          uint64_t result = v32 != 0;
          if (v32) {
            break;
          }
        }

        while (*++i);
        return result;
      }

      return 0LL;
    }

    uint64_t v14 = *i;
    if (v14 != 47 && v14 != 0) {
      return 0LL;
    }
    for (unint64_t j = (char *)(v5 - 1); ; ++j)
    {
      if (v11 == 46)
      {
        uint64_t v16 = j[2];
        if (j[2] && v16 != 47)
        {
LABEL_59:
          --i;
          while (1)
          {
            if (v14 == 46)
            {
              uint64_t v14 = i[2];
              if (v14 != 47 && v14 != 0)
              {
LABEL_69:
                if ((a3 & 2) != 0 && !(_BYTE)v11) {
                  return 1LL;
                }
LABEL_110:
                unint64_t v5 = (unsigned __int8 *)(j + 1);
                ++i;
                goto LABEL_25;
              }
            }

            else
            {
              LOBYTE(v14) = i[2];
            }

            ++i;
          }
        }
      }

      else
      {
        LOBYTE(v16) = j[2];
      }

      LOBYTE(v11) = v16;
    }
  }

  if (v10 == 36)
  {
    if ((a3 & 2) != 0 && !v5[1])
    {
      for (k = i + 1; ; ++k)
      {
        uint64_t v36 = *(k - 1);
        if (v36 != 47)
        {
          if (v36 != 46) {
            break;
          }
          uint64_t v37 = *k;
          if (v37 != 47 && v37 != 0) {
            break;
          }
        }
      }

      return v36 == 0;
    }

    goto LABEL_88;
  }

  if (*v5)
  {
LABEL_88:
    unint64_t j = (char *)v5;
    if (v11 == *i) {
      goto LABEL_110;
    }
    return 0LL;
  }

  time_t v39 = *i;
  if (v39 != 47) {
    return v39 == 0;
  }
  if ((a3 & 2) != 0) {
    return 1LL;
  }
  size_t v40 = i + 1;
  LOBYTE(v41) = 47;
  while (2)
  {
    if (v41 != 46)
    {
      LOBYTE(v41) = *v40;
      goto LABEL_138;
    }

    unint64_t v41 = *v40;
    if (v41 == 47 || v41 == 0)
    {
LABEL_138:
      ++v40;
      continue;
    }

    break;
  }

  time_t v39 = *(v40 - 1);
  return v39 == 0;
}

          if (v79 >= 3)
          {
            *(_DWORD *)(v40 + 48) = v74 - *(unsigned __int8 *)(*(void *)(v40 + 264) + v79);
            ++*(_DWORD *)(v40 + 4LL * (v79 - 2) + 68);
            *(_BYTE *)(*(void *)(v40 + 136) + v57) = v79 - 2;
            goto LABEL_114;
          }

          if (!v79) {
            goto LABEL_113;
          }
          if (v79 == 1) {
            uint64_t v84 = -4;
          }
          else {
            uint64_t v84 = -9;
          }
          if (v79 == 1) {
            int v85 = 4;
          }
          else {
            int v85 = 9;
          }
          char v86 = *(unsigned __int8 *)(*(void *)(v40 + 264) + v79);
          if (v74 < v85 + v86)
          {
            int v87 = sub_18070D548(v170, (unint64_t *)(v40 + 40));
            uint64_t v88 = *(void *)(v40 + 264);
            if (v87)
            {
              char v86 = *(unsigned __int8 *)(v88 + v79);
              uint64_t v74 = *(_DWORD *)(v40 + 48);
            }

            else
            {
              uint64_t v74 = *(_DWORD *)(v40 + 48);
              char v86 = *(unsigned __int8 *)(v88 + v79);
              if (v74 < v85 + v86) {
                break;
              }
            }
          }

          uint64_t v89 = v84 - v86 + v74;
          int v90 = (*(void *)(v40 + 40) >> v89) & *(unsigned __int16 *)&algn_18072097C[2 * v85 + 2];
          *(_DWORD *)(v40 + 48) = v89;
          if (v79 == 1) {
            size_t v91 = 3;
          }
          else {
            size_t v91 = 20;
          }
          uint64_t v17 = (v90 + v91);
          int v92 = v17 + v57;
          bzero((void *)(*(void *)(v40 + 136) + v57), v17);
          uint64_t v57 = v92;
LABEL_125:
          uint64_t v56 = *(_DWORD *)(v40 + 60);
        }

        if (v164 == v167) {
          goto LABEL_239;
        }
        int v21 = 0;
        *(_DWORD *)(v40 + 336) = v57;
        v146 = 7;
LABEL_241:
        *(_DWORD *)size_t v40 = v146;
LABEL_242:
        a2 = v163;
LABEL_243:
        int v22 = v16[48] - *((int *)v16 + 94) + (int)v164;
        v16[48] = v22;
        uint64_t v9 = v156;
        uint64_t v11 = v157;
        if (v21)
        {
LABEL_244:
          if (v21 == 1)
          {
            *((_BYTE *)v16 + 300) = 1;
            goto LABEL_246;
          }

          archive_set_error((_DWORD *)v11, -1, "Bad lzh data", a4, a5, a6, a7, a8, v155);
          return 4294967271LL;
        }

        else
        {
LABEL_246:
          v147 = *v16;
          v16[1] -= v22;
          v16[2] = v22;
          v148 = *((int *)v16 + 100);
          unsigned __int8 *v8 = v147;
          if ((_DWORD)v148)
          {
            void *v9 = v148;
            v149 = (char *)v16[49];
            *a2 = v149;
            v150 = sub_18070D358(*((unsigned __int16 *)v16 + 12), v149, v148);
            uint64_t result = 0LL;
            *((_WORD *)v16 + 12) = v150;
            *v16 += v148;
          }

          else
          {
            void *v9 = 0LL;
            *a2 = 0LL;
            if (*((_BYTE *)v16 + 300)) {
              return sub_18070D44C(v11, v17, v18, a4, a5, a6, a7, a8);
            }
            else {
              return 0LL;
            }
          }
        }

        return result;
      case 1:
        int v44 = *(_DWORD *)(v40 + 48);
        size_t v45 = *(_DWORD *)(v40 + 192);
        goto LABEL_40;
      case 2:
        size_t v48 = *(_DWORD *)(v40 + 188);
        if (!v48) {
          goto LABEL_49;
        }
        goto LABEL_44;
      case 3:
        size_t v54 = *(unsigned int *)(v40 + 336);
        goto LABEL_61;
      case 4:
        int v55 = *(unsigned int *)(v40 + 336);
        goto LABEL_72;
      case 5:
        goto LABEL_76;
      case 6:
        uint64_t v56 = *(_DWORD *)(v40 + 60);
        goto LABEL_80;
      case 7:
        uint64_t v57 = *(_DWORD *)(v40 + 336);
        goto LABEL_125;
      case 8:
        goto LABEL_117;
      case 9:
        int v21 = 100;
        goto LABEL_228;
      default:
        continue;
    }
  }

void sub_180706780( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v37 = 0LL;
  uint64_t v38 = 0LL;
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  uint64_t v33 = 0LL;
  uint64_t v34 = 0LL;
  int v9 = *(_DWORD *)(a1 + 952);
  unsigned int v10 = v9 & 0x380238;
  int v11 = *(_DWORD *)(a1 + 136);
  if (*(_DWORD *)(a1 + 128))
  {
    uint64_t v12 = *(void *)(a1 + 184);
    if (!v12
      || (int v13 = v9 & 0x300238, (v11 & 0x300000) != 0)
      && (*(int *)(v12 + 24) < 2 || *(void *)(a1 + 144) == *(void *)(*(void *)(v12 + 16) + 240LL)))
    {
      int v13 = *(_DWORD *)(a1 + 952) & 0x238;
    }

    uint64_t v14 = *(void *)(a1 + 192);
    if (!v14
      || (v11 & 0x30) != 0
      && (*(int *)(v14 + 24) < 2 || *(void *)(a1 + 152) == *(void *)(*(void *)(v14 + 16) + 248LL)))
    {
      v13 &= 0x300208u;
    }

    uint64_t v15 = *(void *)(a1 + 200);
    if (!v15
      || (v11 & 0x200) != 0
      && (*(int *)(v15 + 24) < 2
       || *(unsigned __int16 *)(a1 + 160) == *(unsigned __int16 *)(*(void *)(v15 + 16) + 230LL)))
    {
      v13 &= ~0x200u;
    }

    uint64_t v16 = *(void *)(a1 + 208);
    if (!v16
      || (v11 & 8) != 0
      && (*(int *)(v16 + 24) < 2
       || (uint64_t v17 = *(void *)(v16 + 16), *(void *)(v17 + 272) == *(void *)(a1 + 168))
       && *(void *)(v17 + 280) == *(void *)(a1 + 176)))
    {
      int v18 = v10;
      unsigned int v10 = v13 & 0xFFFFFFF7;
    }

    else
    {
      int v18 = v10;
      unsigned int v10 = v13;
    }
  }

  else
  {
    int v19 = v9 & 0x80238;
    if (*(void *)(a1 + 184)) {
      int v19 = v9 & 0x380238;
    }
    if (!*(void *)(a1 + 192)) {
      v19 &= 0x380208u;
    }
    if (!*(void *)(a1 + 200)) {
      v19 &= 0x380038u;
    }
    if (*(void *)(a1 + 208)) {
      int v18 = v19;
    }
    else {
      int v18 = v19 & 0x380230;
    }
  }

  if ((v10 & v18 & 0x80000) != 0)
  {
    int v20 = *(_DWORD *)(a1 + 956);
    if (v20) {
      int v21 = " type=dir";
    }
    else {
      int v21 = " type=file";
    }
    if (v20) {
      __int16 v22 = 0x4000;
    }
    else {
      __int16 v22 = 0x8000;
    }
    sub_1806F76CC((uint64_t *)&v36, v21);
    *(_WORD *)(a1 + 132) = v22;
  }

  if ((v10 & v18 & 0x200000) != 0)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 184) + 16LL) + 160LL))
    {
      sub_1806F76CC((uint64_t *)&v36, " uname=");
      sub_180706D60((uint64_t *)&v36, *(unsigned __int8 **)(*(void *)(*(void *)(a1 + 184) + 16LL) + 152LL));
    }

    else
    {
      v18 &= ~0x200000u;
      if ((v11 & 0x200000) != 0) {
        sub_1806F76CC((uint64_t *)&v33, " uname");
      }
    }
  }

  if ((v18 & v10 & 0x100000) != 0)
  {
    unsigned int v23 = *(char **)(*(void *)(*(void *)(a1 + 184) + 16LL) + 240LL);
    *(void *)(a1 + 144) = v23;
    sub_1806FBA84((void **)&v36, " uid=%jd", a3, a4, a5, a6, a7, a8, v23);
  }

  if ((v18 & v10 & 0x20) != 0)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 192) + 16LL) + 184LL))
    {
      sub_1806F76CC((uint64_t *)&v36, " gname=");
      sub_180706D60((uint64_t *)&v36, *(unsigned __int8 **)(*(void *)(*(void *)(a1 + 192) + 16LL) + 176LL));
    }

    else
    {
      v18 &= ~0x20u;
      if ((v11 & 0x20) != 0) {
        sub_1806F76CC((uint64_t *)&v33, " gname");
      }
    }
  }

  __int16 v24 = v18 & v10;
  if ((v24 & 0x10) != 0)
  {
    unint64_t v25 = *(char **)(*(void *)(*(void *)(a1 + 192) + 16LL) + 248LL);
    *(void *)(a1 + 152) = v25;
    sub_1806FBA84((void **)&v36, " gid=%jd", a3, a4, a5, a6, a7, a8, v25);
    if ((v24 & 0x200) == 0)
    {
LABEL_55:
      if ((v24 & 8) == 0) {
        goto LABEL_63;
      }
      goto LABEL_59;
    }
  }

  else if ((v24 & 0x200) == 0)
  {
    goto LABEL_55;
  }

  uint64_t v26 = (char *)*(unsigned __int16 *)(*(void *)(*(void *)(a1 + 200) + 16LL) + 230LL);
  *(_WORD *)(a1 + 160) = (_WORD)v26;
  sub_1806FBA84((void **)&v36, " mode=%o", a3, a4, a5, a6, a7, a8, v26);
  if ((v24 & 8) == 0) {
    goto LABEL_63;
  }
LABEL_59:
  if (*(void *)(*(void *)(*(void *)(a1 + 208) + 16LL) + 208LL))
  {
    sub_1806F76CC((uint64_t *)&v36, " flags=");
    sub_180706D60((uint64_t *)&v36, *(unsigned __int8 **)(*(void *)(*(void *)(a1 + 208) + 16LL) + 200LL));
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(*(void *)(*(void *)(a1 + 208) + 16LL) + 272LL);
  }

  else
  {
    v18 &= ~8u;
    if ((v11 & 8) != 0) {
      sub_1806F76CC((uint64_t *)&v33, " flags");
    }
  }

uint64_t sub_180706B54( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 264);
  unsigned int v10 = *(char **)(a2 + 56);
  if (v10)
  {
    if (*(_DWORD *)(v9 + 960))
    {
      int v12 = *(_DWORD *)(v9 + 220);
      if (v12 >= 1)
      {
        if (4 * v12 <= 1) {
          int v13 = 1;
        }
        else {
          int v13 = 4 * v12;
        }
        do
        {
          sub_1806F76DC((uint64_t *)(v9 + 88), 32);
          --v13;
        }

        while (v13);
        unsigned int v10 = *(char **)(a2 + 56);
      }
    }

    sub_1806FBA84((void **)(v9 + 88), "# %s/%s\n", a3, a4, a5, a6, a7, a8, v10);
  }

  if (*(_DWORD *)(v9 + 960))
  {
    *(void *)(v9 + 72) = 0LL;
    if (*(_DWORD *)(v9 + 956)) {
      size_t v14 = 3LL;
    }
    else {
      size_t v14 = 4LL;
    }
    sub_1806F7634((uint64_t *)(v9 + 64), "..\n\n", v14);
    sub_180706E34(v9);
  }

  else
  {
    if (*(_DWORD *)(v9 + 956)) {
      size_t v15 = 3LL;
    }
    else {
      size_t v15 = 4LL;
    }
    sub_1806F7634((uint64_t *)(v9 + 88), "..\n\n", v15);
  }

  unint64_t v16 = *(void *)(v9 + 96);
  if (v16 <= 0x8000) {
    return 0LL;
  }
  uint64_t result = sub_1806FDA50(a1, *(void *)(v9 + 88), v16);
  *(void *)(v9 + 96) = 0LL;
  return result;
}

uint64_t sub_180706C68(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    int v4 = *((_DWORD *)a2 + 6);
    *((_DWORD *)a2 + 6) = v4 + 1;
    if ((uint64_t *)*a1 != a2)
    {
      unint64_t v5 = (uint64_t *)*a2;
      if (*(_DWORD *)(*a2 + 24) <= v4)
      {
        unint64_t v6 = (uint64_t *)*a2;
        do
        {
          int v7 = *((_DWORD *)v6 + 6);
          if (v7 > v4) {
            break;
          }
          unint64_t v6 = (uint64_t *)*v6;
        }

        while (v6);
        v5[1] = a2[1];
        uint64_t v8 = (void *)a2[1];
        if (v8) {
          void *v8 = v5;
        }
        if (v7 <= v4)
        {
          uint64_t v11 = 0LL;
          *a2 = 0LL;
          a2[1] = *a1;
          *a1 = (uint64_t)a2;
          unsigned int v10 = (uint64_t **)a2[1];
          goto LABEL_17;
        }

        uint64_t v9 = v6[1];
        *a2 = (uint64_t)v6;
        a2[1] = v9;
        v6[1] = (uint64_t)a2;
        unsigned int v10 = (uint64_t **)a2[1];
        if (v10)
        {
          uint64_t v11 = 0LL;
LABEL_17:
          *unsigned int v10 = a2;
          return v11;
        }
      }
    }

    return 0LL;
  }

  if (!a3) {
    return 0LL;
  }
  size_t v14 = malloc(0x20uLL);
  if (!v14) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = 0LL;
  *size_t v14 = a3;
  v14[1] = 0LL;
  *((_DWORD *)v14 + 6) = 1;
  v14[2] = a4;
  *(void *)(a3 + 8) = v14;
  return v11;
}

uint64_t *sub_180706D60(uint64_t *result, unsigned __int8 *a2)
{
  unsigned int v2 = *a2;
  if (*a2)
  {
    uint64_t v3 = result;
    int v4 = a2 + 1;
    unint64_t v5 = a2;
    do
    {
      if (!byte_1807202E1[v2])
      {
        if (v4 - 1 != a2)
        {
          sub_1806F7634(v3, a2, v5 - a2);
          unsigned int v2 = *(v4 - 1);
        }

        v7[0] = 92;
        v7[1] = (v2 >> 6) | 0x30;
        v7[2] = (v2 >> 3) & 7 | 0x30;
        v7[3] = v2 & 7 | 0x30;
        uint64_t result = sub_1806F7634(v3, v7, 4uLL);
        a2 = v4;
      }

      unsigned int v6 = *v4++;
      unsigned int v2 = v6;
      ++v5;
    }

    while (v6);
    if (v4 - 1 != a2) {
      return sub_1806F7634(v3, a2, v5 - a2);
    }
  }

  return result;
}

uint64_t *sub_180706E34(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 216))
  {
    int v2 = *(_DWORD *)(a1 + 960);
    int v3 = *(_DWORD *)(a1 + 220);
    int v4 = 4 * (v3 != 0);
    int v5 = 4 * v3;
    if (v2) {
      unsigned int v6 = 0;
    }
    else {
      unsigned int v6 = v4;
    }
    if (v2) {
      int v7 = v5;
    }
    else {
      int v7 = 0;
    }
  }

  else
  {
    unsigned int v6 = 0;
    int v7 = 0;
  }

  uint64_t v8 = *(char **)(a1 + 64);
  uint64_t v9 = v8 - 1;
  do
    int v10 = *(unsigned __int8 *)++v9;
  while (v10 == 32);
  uint64_t v11 = strchr(v9, 32);
  int v12 = v7 + v6;
  if (v11)
  {
    int v13 = v11;
    size_t v14 = 0LL;
    char v15 = 0;
    unint64_t v16 = (uint64_t *)(a1 + 88);
    while ((v15 & 1) != 0)
    {
      if ((uint64_t)&v13[v7 - (void)v8] > 62)
      {
        if (!v14) {
          size_t v14 = v13;
        }
        sub_1806F7634(v16, v8, v14 - v8);
        sub_1806F7634(v16, " \\\n", 3uLL);
        if (v7 >= -15)
        {
          int v20 = ((v7 + 15) & ~((v7 + 15) >> 31)) + 1;
          do
          {
            sub_1806F76DC(v16, 32);
            --v20;
          }

          while (v20);
        }

        int v13 = 0LL;
        uint64_t v17 = v14 + 1;
LABEL_34:
        uint64_t v8 = (char *)v17;
        goto LABEL_35;
      }

      uint64_t v17 = v13 + 1;
LABEL_35:
      size_t v14 = v13;
      int v13 = strchr(v17, 32);
      char v15 = 1;
      if (!v13)
      {
        if (v14 && strlen(v8) + v7 >= 0x3F)
        {
          sub_1806F7634((uint64_t *)(a1 + 88), v8, v14 - v8);
          sub_1806F7634((uint64_t *)(a1 + 88), " \\\n", 3uLL);
          if (v7 >= -15)
          {
            int v22 = ((v7 + 15) & ~((v7 + 15) >> 31)) + 1;
            do
            {
              sub_1806F76DC((uint64_t *)(a1 + 88), 32);
              --v22;
            }

            while (v22);
          }

          uint64_t v8 = v14 + 1;
        }

        goto LABEL_46;
      }
    }

    if (v12 >= 1)
    {
      unsigned int v18 = v7 + v6;
      do
      {
        sub_1806F76DC(v16, 32);
        --v18;
      }

      while (v18);
    }

    sub_1806F7634(v16, v8, v13 - v8);
    if (v13 - v8 + v6 < 16)
    {
      if ((int)((_DWORD)v13 - (_DWORD)v8 + v6) <= 15)
      {
        int v21 = v6 - 1 + (_DWORD)v13 - (_DWORD)v8;
        do
        {
          sub_1806F76DC(v16, 32);
          ++v21;
        }

        while (v21 < 15);
      }
    }

    else
    {
      sub_1806F7634(v16, " \\\n", 3uLL);
      if (v7 >= -15)
      {
        int v19 = ((v7 + 15) & ~((v7 + 15) >> 31)) + 1;
        do
        {
          sub_1806F76DC(v16, 32);
          --v19;
        }

        while (v19);
      }
    }

    uint64_t v17 = v13 + 1;
    int v13 = 0LL;
    goto LABEL_34;
  }

  if (v12 >= 1)
  {
    do
    {
      sub_1806F76DC((uint64_t *)(a1 + 88), 32);
      --v12;
    }

    while (v12);
  }

  sub_1806F76CC((uint64_t *)(a1 + 88), v8);
  v8 += strlen(v8);
LABEL_46:
  uint64_t result = sub_1806F76CC((uint64_t *)(a1 + 88), v8);
  *(void *)(a1 + 72) = 0LL;
  return result;
}

uint64_t *sub_18070710C(uint64_t *result, char *a2, int a3)
{
  if (a3 >= 1)
  {
    int v4 = result;
    uint64_t v5 = a3;
    do
    {
      sub_1806F76DC(v4, a0123456789abcd_1[(unint64_t)*a2 >> 4]);
      char v6 = *a2++;
      uint64_t result = sub_1806F76DC(v4, a0123456789abcd_1[v6 & 0xF]);
      --v5;
    }

    while (v5);
  }

  return result;
}

uint64_t archive_read_support_filter_all( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4(a1, 14594245, 1, "archive_read_support_filter_all", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    archive_read_support_filter_bzip2(a1);
    archive_read_support_filter_compress(a1);
    archive_read_support_filter_gzip(a1);
    archive_read_support_filter_lzip(a1);
    archive_read_support_filter_lzma(a1);
    archive_read_support_filter_xz(a1);
    archive_read_support_filter_uu(a1);
    archive_read_support_filter_rpm(a1);
    archive_read_support_filter_lrzip(a1);
    archive_read_support_filter_lzop(a1);
    archive_read_support_filter_grzip(a1);
    archive_read_support_filter_lz4(a1);
    archive_read_support_filter_zstd(a1);
    archive_clear_error((uint64_t)a1);
    return 0LL;
  }

  return result;
}

uint64_t sub_18070722C(unsigned __int8 *a1, unsigned __int8 *a2, unsigned int a3)
{
  if (a1 && (int v3 = *a1) != 0)
  {
    if (!a2) {
      return 0LL;
    }
    BOOL v4 = v3 == 94;
    BOOL v5 = v3 == 94;
    if (v4) {
      char v6 = a1 + 1;
    }
    else {
      char v6 = a1;
    }
    if (v4) {
      uint64_t v7 = a3 & 0xFFFFFFFE;
    }
    else {
      uint64_t v7 = a3;
    }
    int v8 = *v6;
    if (v8 == 42) {
      goto LABEL_13;
    }
    if (v8 == 47)
    {
      if (*a2 == 47)
      {
LABEL_13:
        uint64_t v9 = &a1[v5 - 1];
        do
          int v10 = *++v9;
        while (v10 == 47);
        --a2;
        do
          int v11 = *++a2;
        while (v11 == 47);
        return sub_180707334(v9, a2, v7);
      }

      return 0LL;
    }

    if ((v7 & 1) == 0)
    {
      uint64_t v9 = v6;
      return sub_180707334(v9, a2, v7);
    }

    while (1)
    {
      int v13 = *a2 == 47 ? a2 + 1 : a2;
      if (sub_180707334(v6, v13, v7)) {
        break;
      }
      a2 = (unsigned __int8 *)strchr((const char *)v13, 47);
      uint64_t result = 0LL;
      if (!a2) {
        return result;
      }
    }
  }

  else if (a2)
  {
    return *a2 == 0;
  }

  return 1LL;
}

BOOL sub_180707334(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t i = a2;
  BOOL v5 = a1;
  if (*a2 == 46)
  {
    int v6 = a2[1];
    if (v6 == 47)
    {
      for (uint64_t i = a2 + 1; ; ++i)
      {
        if (v6 == 46)
        {
          int v6 = i[1];
          if (v6 != 47 && v6 != 0) {
            break;
          }
        }

        else
        {
          LOBYTE(v6) = i[1];
        }
      }
    }
  }

  if (*a1 != 46) {
    goto LABEL_25;
  }
  int v8 = a1[1];
  if (v8 != 47) {
    goto LABEL_25;
  }
  BOOL v5 = a1 + 1;
  while (v8 != 46)
  {
    LOBYTE(v8) = v5[1];
LABEL_24:
    ++v5;
  }

  int v8 = v5[1];
  if (v8 == 47 || v8 == 0) {
    goto LABEL_24;
  }
LABEL_25:
  int v10 = (char)*v5;
  int v11 = *v5;
  if (v10 > 62)
  {
    if (v10 == 63)
    {
      int v17 = *i;
      unint64_t j = (char *)v5;
      goto LABEL_109;
    }

    if (v10 == 91)
    {
      unsigned int v18 = (char *)(v5 + 1);
      for (unint64_t j = (char *)(v5 + 1); ; ++j)
      {
        int v19 = *j;
        if (v19 == 92)
        {
          if (j[1]) {
            ++j;
          }
        }

        else
        {
          if (!*j) {
            goto LABEL_88;
          }
          if (v19 == 93)
          {
            int v21 = *v18;
            if (v21 == 94 || v21 == 33)
            {
              BOOL v22 = v18 >= j;
              if (v18 >= j) {
                unsigned int v18 = (char *)(v5 + 1);
              }
              else {
                unsigned int v18 = (char *)(v5 + 2);
              }
              int v23 = v22;
              int v17 = !v22;
            }

            else
            {
              int v17 = 0;
              int v23 = 1;
            }

            if (v18 >= j)
            {
LABEL_109:
              if (v17) {
                goto LABEL_110;
              }
              return 0LL;
            }

            char v24 = 0;
            int v25 = (char)*i;
            while (2)
            {
              int v26 = *v18;
              if (v26 == 92)
              {
                int v30 = *++v18;
                int v27 = v30;
              }

              else
              {
                int v27 = *v18;
                if (v26 == 45)
                {
                  if (!v24 || v18 == j - 1)
                  {
                    LOBYTE(v27) = 0;
                  }

                  else
                  {
                    int v28 = v18[1];
                    if (v28 == 92)
                    {
                      unsigned __int8 v29 = v18[2];
                      v18 += 2;
                      LOBYTE(v28) = v29;
                    }

                    else
                    {
                      ++v18;
                    }

                    LOBYTE(v27) = 0;
                    if (v25 >= v24 && v25 <= (char)v28)
                    {
LABEL_108:
                      int v17 = v23;
                      goto LABEL_109;
                    }
                  }

                  goto LABEL_101;
                }
              }

uint64_t archive_read_set_format( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t result = archive_read_support_format_by_code((int *)a1, a2, a3, a4, a5, a6, a7, a8);
  if ((result & 0x80000000) == 0)
  {
    if (*(void *)(a1 + 2472)) {
      int v16 = -20;
    }
    else {
      int v16 = 0;
    }
    switch(((a2 & 0xFF0000u) - 0x10000) >> 16)
    {
      case 0u:
        __s2[4] = 0;
        int v17 = 1869181027;
        goto LABEL_22;
      case 2u:
        int v17 = 7496052;
        goto LABEL_22;
      case 3u:
        strcpy(__s2, "iso9660");
        goto LABEL_23;
      case 4u:
        int v17 = 7367034;
        goto LABEL_22;
      case 5u:
        strcpy(&__s2[4], "y");
        int v17 = 1953525093;
        goto LABEL_22;
      case 6u:
        strcpy(__s2, "ar");
        goto LABEL_23;
      case 7u:
        strcpy(&__s2[4], "e");
        int v17 = 1701999725;
        goto LABEL_22;
      case 8u:
        int v17 = 7823730;
        goto LABEL_22;
      case 9u:
        int v17 = 7496056;
        goto LABEL_22;
      case 0xAu:
        int v17 = 6383724;
        goto LABEL_22;
      case 0xBu:
        int v17 = 6447459;
        goto LABEL_22;
      case 0xCu:
        int v17 = 7496050;
        goto LABEL_22;
      case 0xDu:
        __s2[4] = 0;
        int v17 = 1885960759;
        goto LABEL_22;
      case 0xEu:
        __s2[4] = 0;
        int v17 = 1668440439;
        goto LABEL_22;
      case 0xFu:
        __s2[4] = 0;
        int v17 = 896688498;
LABEL_22:
        *(_DWORD *)__s2 = v17;
LABEL_23:
        uint64_t v18 = 0LL;
        *(void *)(a1 + 2472) = a1 + 1064;
        break;
      default:
        archive_set_error((_DWORD *)a1, 22, "Invalid format code specified", v11, v12, v13, v14, v15, v26);
        return 4294967266LL;
    }

    do
    {
      int v19 = *(const char **)(a1 + v18 + 1072);
      if (!v19) {
        goto LABEL_29;
      }
      *(void *)(a1 + 2472) = a1 + v18 + 1152;
      v18 += 88LL;
    }

    while ((_DWORD)v18 != 1408);
    int v19 = *(const char **)(a1 + v18 + 1072);
    if (!v19)
    {
LABEL_29:
      archive_set_error((_DWORD *)a1, 22, "Internal error: Unable to set format", v11, v12, v13, v14, v15, v26);
      int v19 = *(const char **)(*(void *)(a1 + 2472) + 8LL);
      int v20 = -30;
      goto LABEL_31;
    }

uint64_t sub_1807079B4(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  if (*a3 < 0)
  {
    int v6 = (const char *)sub_1806C4C3C(a1, a2, a3);
    if (!v6) {
      return 4294967276LL;
    }
  }

  else
  {
    int v6 = 0LL;
  }

  archive_entry_acl_clear((uint64_t)a2);
  if (*a3 < 0)
  {
    if (*(_BYTE *)(a1 + 169)) {
      file = acl_get_file(v6, ACL_TYPE_EXTENDED);
    }
    else {
      file = acl_get_link_np(v6, ACL_TYPE_EXTENDED);
    }
  }

  else
  {
    file = acl_get_fd_np(*a3, ACL_TYPE_EXTENDED);
  }

  uint64_t v9 = file;
  if (!file) {
    return 0LL;
  }
  int entry = acl_get_entry(file, 0, &entry_p);
  if (entry == -1)
  {
    uint64_t v11 = "Failed to get first ACL entry";
    goto LABEL_46;
  }

  if (entry)
  {
LABEL_42:
    acl_free(v9);
    uint64_t v8 = 0LL;
    goto LABEL_47;
  }

  uint64_t v11 = "Failed to get ACL tag type";
  while (1)
  {
    if (acl_get_tag_type(entry_p, &tag_type_p)) {
      goto LABEL_46;
    }
    if (tag_type_p == ACL_EXTENDED_ALLOW) {
      break;
    }
    if (tag_type_p == ACL_EXTENDED_DENY)
    {
      int v12 = 2048;
      goto LABEL_19;
    }

uint64_t sub_180707EF8(_DWORD *a1, int a2, const char *a3, unsigned __int16 *a4)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  int v8 = sub_1806E1F04((uint64_t)a4, 15360);
  if (!v8) {
    return 0LL;
  }
  acl_t acl = acl_init(v8);
  if (!acl)
  {
    uint64_t v16 = __error();
    archive_set_error(a1, *v16, "Failed to initialize ACL working storage", v17, v18, v19, v20, v21, v45);
    return 4294967271LL;
  }

  if (sub_1806E1F68((uint64_t)a1, a4, 15360, &v50, &v49, &v48, &v47, &v46))
  {
LABEL_5:
    if (a2 < 0)
    {
      if (acl_set_link_np(a3, ACL_TYPE_EXTENDED, acl) && *__error() != 102)
      {
        int v35 = *__error();
        archive_set_error(a1, v35, "Failed to set acl: %s", v36, v37, v38, v39, v40, "nfs4");
        goto LABEL_49;
      }
    }

    else if (acl_set_fd_np(a2, acl, ACL_TYPE_EXTENDED) && *__error() != 102)
    {
      int v9 = *__error();
      archive_set_error(a1, v9, "Failed to set acl on fd: %s", v10, v11, v12, v13, v14, "nfs4");
LABEL_49:
      uint64_t v15 = 4294967276LL;
      goto LABEL_55;
    }

    uint64_t v15 = 0LL;
    goto LABEL_55;
  }

  while (1)
  {
    if (v48 == 10002 || v48 == 10004 || v48 == 10107) {
      goto LABEL_19;
    }
    if (acl_create_entry(&acl, &entry_p))
    {
      int v41 = *__error();
      int v42 = "Failed to create a new ACL entry";
LABEL_53:
      int v43 = a1;
      goto LABEL_54;
    }

    if (v50 == 1024)
    {
      unsigned int v24 = entry_p;
      acl_tag_t v25 = ACL_EXTENDED_ALLOW;
    }

    else
    {
      if (v50 != 2048) {
        goto LABEL_19;
      }
      unsigned int v24 = entry_p;
      acl_tag_t v25 = ACL_EXTENDED_DENY;
    }

    acl_set_tag_type(v24, v25);
    if (v48 != 10003) {
      break;
    }
    gid_t v32 = archive_write_disk_gid((uint64_t)a1, v46, v47, v26, v27, v28, v29, v30);
    if (mbr_gid_to_uuid(v32, uu)) {
      goto LABEL_19;
    }
LABEL_31:
    if (!acl_set_qualifier(entry_p, uu))
    {
      if (acl_get_permset(entry_p, &permset_p))
      {
        int v41 = *__error();
        int v42 = "Failed to get ACL permission set";
      }

      else if (acl_clear_perms(permset_p))
      {
        int v41 = *__error();
        int v42 = "Failed to clear ACL permissions";
      }

      else
      {
        for (uint64_t i = 0LL; i != 34; i += 2LL)
        {
          if ((dword_18072081C[i] & v49) != 0 && acl_add_perm(permset_p, (acl_perm_t)dword_18072081C[i + 1]))
          {
            int v41 = *__error();
            int v42 = "Failed to add ACL permission";
            goto LABEL_53;
          }
        }

        if (acl_get_flagset_np(entry_p, &flagset_p))
        {
          int v41 = *__error();
          int v42 = "Failed to get flagset from an NFSv4 ACL entry";
        }

        else if (acl_clear_flags_np(flagset_p))
        {
          int v41 = *__error();
          int v42 = "Failed to clear flags from an NFSv4 ACL flagset";
        }

        else
        {
          uint64_t v34 = 0LL;
          while ((dword_1807207F4[v34] & v49) == 0 || !acl_add_flag_np(flagset_p, (acl_flag_t)dword_1807207F4[v34 + 1]))
          {
            v34 += 2LL;
            if (v34 == 10) {
              goto LABEL_19;
            }
          }

          int v41 = *__error();
          int v42 = "Failed to add flag to NFSv4 ACL flagset";
        }
      }

      goto LABEL_53;
    }

uint64_t archive_write_set_format_pax_restricted( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 1, "archive_write_set_format_pax_restricted", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    uint64_t result = archive_write_set_format_pax(a1, v10, v11, v12, v13, v14, v15, v16);
    *(_DWORD *)(a1 + 16) = 196611;
    *(void *)(a1 + 24) = "restricted POSIX pax interchange";
  }

  return result;
}

uint64_t archive_write_set_format_pax( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 1, "archive_write_set_format_pax", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    uint64_t v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10) {
      v10(a1);
    }
    uint64_t v11 = calloc(1uLL, 0x80uLL);
    if (v11)
    {
      uint64_t v17 = v11;
      uint64_t result = 0LL;
      v17[31] = 3;
      *(void *)(a1 + 264) = v17;
      *(void *)(a1 + 272) = "pax";
      *(void *)(a1 + 304) = sub_180708604;
      *(void *)(a1 + 312) = sub_1807097DC;
      *(void *)(a1 + 320) = sub_1807098D8;
      *(void *)(a1 + 328) = sub_1807098E0;
      *(void *)(a1 + 288) = sub_180708428;
      *(void *)(a1 + 296) = sub_180709944;
      *(_DWORD *)(a1 + 16) = 196610;
      *(void *)(a1 + 24) = "POSIX pax interchange";
    }

    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate pax data", v12, v13, v14, v15, v16, v18);
      return 4294967266LL;
    }
  }

  return result;
}

uint64_t sub_180708428(uint64_t a1, char *__s1, const char *a3)
{
  uint64_t v6 = *(void *)(a1 + 264);
  if (!strcmp(__s1, "hdrcharset"))
  {
    if (!a3 || !*a3)
    {
      uint64_t v13 = "pax: hdrcharset option needs a character-set name";
      goto LABEL_21;
    }

    if (!strcmp(a3, "BINARY") || !strcmp(a3, "binary"))
    {
      uint64_t result = 0LL;
      *(_DWORD *)(v6 + 120) = 1;
    }

    else
    {
      if (strcmp(a3, "UTF-8"))
      {
        uint64_t v13 = "pax: invalid charset name";
LABEL_21:
        archive_set_error((_DWORD *)a1, -1, v13, v7, v8, v9, v10, v11, v16);
        return 4294967271LL;
      }

      uint64_t v15 = sub_1806F7A20(a1, "UTF-8", 0);
      *(void *)(v6 + 112) = v15;
      if (v15) {
        return 0LL;
      }
      else {
        return 4294967266LL;
      }
    }
  }

  else
  {
    if (strcmp(__s1, "xattrheader")) {
      return 4294967276LL;
    }
    if (!a3 || !*a3)
    {
      uint64_t v13 = "pax: xattrheader requires a value";
      goto LABEL_21;
    }

    if (!strcmp(a3, "ALL") || !strcmp(a3, "all"))
    {
      uint64_t result = 0LL;
      unsigned int v14 = *(_DWORD *)(v6 + 124) | 3;
    }

    else if (!strcmp(a3, "SCHILY") || !strcmp(a3, "schily"))
    {
      uint64_t result = 0LL;
      unsigned int v14 = *(_DWORD *)(v6 + 124) & 0xFFFFFFFC | 1;
    }

    else
    {
      if (strcmp(a3, "LIBARCHIVE") && strcmp(a3, "libarchive"))
      {
        uint64_t v13 = "pax: invalid xattr header name";
        goto LABEL_21;
      }

      uint64_t result = 0LL;
      unsigned int v14 = *(_DWORD *)(v6 + 124) & 0xFFFFFFFC | 2;
    }

    *(_DWORD *)(v6 + 124) = v14;
  }

  return result;
}

uint64_t sub_180708604(uint64_t a1, uint64_t *a2)
{
  uint64_t v208 = *MEMORY[0x1895F89C0];
  v198 = 0LL;
  __s = 0LL;
  v196 = 0LL;
  v197 = 0LL;
  uint64_t v4 = *(void *)(a1 + 264);
  if (!archive_entry_pathname(a2))
  {
    archive_set_error((_DWORD *)a1, -1, "Can't record entry in tar file without pathname", v5, v6, v7, v8, v9, v188);
    return 4294967271LL;
  }

  if (*(_DWORD *)(v4 + 120))
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v10 = *(void **)(v4 + 112);
    if (!v10)
    {
      uint64_t v10 = sub_1806F7A20(a1, "UTF-8", 1);
      *(void *)(v4 + 112) = v10;
      if (!v10) {
        return 4294967271LL;
      }
    }
  }

  uint64_t v12 = sub_1807099C0((_DWORD *)a1, (uint64_t)a2, &v200, &v194, (uint64_t)v10);
  uint64_t v13 = v12;
  if ((_DWORD)v12 == -30) {
    return v12;
  }
  if ((_DWORD)v12)
  {
    unsigned int v14 = v200;
    sub_1806F7F14((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v15, v16, v17, v18, v19, v14);
    uint64_t v10 = 0LL;
    uint64_t v13 = 4294967276LL;
  }

  if (!v200)
  {
    HIDWORD(v21) = archive_entry_filetype((uint64_t)a2);
    LODWORD(v21) = HIDWORD(v21) - 4096;
    unsigned int v20 = v21 >> 12;
    if (v20 > 9) {
      goto LABEL_89;
    }
    if (((1 << v20) & 0x2A3) != 0) {
      goto LABEL_15;
    }
    if (v20 != 3)
    {
LABEL_89:
      sub_1807010BC((_DWORD *)a1, a2);
      return 4294967271LL;
    }

    int v44 = (const char *)archive_entry_pathname(a2);
    if (v44)
    {
      unsigned int v45 = (char *)v44;
      if (*v44)
      {
        if (v44[strlen(v44) - 1] != 47)
        {
          uint64_t v206 = 0LL;
          v205 = 0LL;
          uint64_t v207 = 0LL;
          size_t __n = strlen(v45);
          if (!sub_1806F7590((void **)&v205, __n + 2))
          {
            archive_set_error((_DWORD *)a1, 12, "Can't allocate pax data", v46, v47, v48, v49, v50, v188);
            tm v107 = &v205;
LABEL_231:
            sub_1806F755C((uint64_t)v107);
            return 4294967266LL;
          }

          uint64_t v206 = 0LL;
          sub_1806F7634((uint64_t *)&v205, v45, __n);
          sub_1806F76DC((uint64_t *)&v205, 47);
          archive_entry_copy_pathname((uint64_t)a2, v205);
          sub_1806F755C((uint64_t)&v205);
        }
      }
    }
  }

LABEL_15:
  uint64_t v22 = archive_entry_mac_metadata((uint64_t)a2, &v195);
  if (!v22) {
    goto LABEL_44;
  }
  uint64_t v23 = v22;
  unsigned int v24 = (void **)archive_entry_new2(a1);
  acl_tag_t v25 = (const char *)archive_entry_pathname(a2);
  size_t v26 = strlen(v25);
  uint64_t v27 = (char *)malloc(v26 + 3);
  uint64_t v28 = v27;
  if (!v27 || !v24)
  {
    archive_entry_free(v24);
    free(v28);
    return 4294967271LL;
  }

  for (uint64_t i = strcpy(v27, v25); ; uint64_t i = v28)
  {
    uint64_t v30 = strrchr(i, 47);
    if (!v30)
    {
      memmove(v28 + 2, v28, v26 + 1);
      uid_t v31 = v28;
      goto LABEL_26;
    }

    if (v30[1]) {
      break;
    }
    char *v30 = 0;
  }

  uid_t v31 = v30 + 1;
  gid_t v32 = v30 + 3;
  size_t v33 = strlen(v30 + 1);
  memmove(v32, v31, v33 + 1);
LABEL_26:
  *(_WORD *)uid_t v31 = 24366;
  archive_entry_copy_pathname((uint64_t)v24, v28);
  free(v28);
  archive_entry_set_size((uint64_t)v24, v195);
  archive_entry_set_filetype((uint64_t)v24, 0x8000);
  __int16 v34 = archive_entry_perm((uint64_t)a2);
  archive_entry_set_perm((uint64_t)v24, v34);
  uint64_t v35 = archive_entry_mtime((uint64_t)a2);
  uint64_t v36 = archive_entry_mtime_nsec((uint64_t)a2);
  archive_entry_set_mtime((uint64_t)v24, v35, v36);
  uint64_t v37 = archive_entry_gid((uint64_t)a2);
  archive_entry_set_gid((uint64_t)v24, v37);
  uint64_t v38 = (char *)archive_entry_gname(a2);
  archive_entry_set_gname((uint64_t)v24, v38);
  uint64_t v39 = archive_entry_uid((uint64_t)a2);
  archive_entry_set_uid((uint64_t)v24, v39);
  uint64_t v40 = (char *)archive_entry_uname(a2);
  archive_entry_set_uname((uint64_t)v24, v40);
  uint64_t v41 = sub_180708604(a1, v24);
  archive_entry_free(v24);
  uint64_t v11 = v41;
  unint64_t v42 = sub_1807097DC((void *)a1, v23, v195);
  int v43 = v42;
  uint64_t v51 = sub_180709944((void *)a1);
  uint64_t v11 = v51;
  else {
    int v52 = v41;
  }
  if (v52 >= v43) {
    int v52 = v43;
  }
  else {
    uint64_t v13 = v51;
  }
LABEL_44:
  uint64_t v53 = archive_entry_clone(a2);
  if (!v53)
  {
    archive_set_error((_DWORD *)a1, 12, "Can't allocate pax data", v54, v55, v56, v57, v58, v188);
    return 4294967266LL;
  }

  uint64_t v59 = (uint64_t *)v53;
  *(void *)(v4 + 48) = 0LL;
  *(void *)(v4 + 72) = 0LL;
  while (1)
  {
    uint64_t v60 = *(void **)(v4 + 96);
    if (!v60) {
      break;
    }
    *(void *)(v4 + 96) = *v60;
    free(v60);
  }

  *(void *)(v4 + 104) = 0LL;
  if (!v200
    && archive_entry_filetype((uint64_t)v59) == 0x8000
    && archive_entry_sparse_reset((uint64_t)v59))
  {
    if (archive_entry_sparse_next((uint64_t)v59, &v205, v204))
    {
      uint64_t v61 = 0LL;
    }

    else
    {
      do
      {
        uint64_t v62 = v205;
        uint64_t v63 = v204[0];
      }

      while (!archive_entry_sparse_next((uint64_t)v59, &v205, v204));
      uint64_t v61 = (uint64_t)&v62[(void)v63];
    }

    if (v61 < archive_entry_size((uint64_t)v59))
    {
      uint64_t v64 = archive_entry_size((uint64_t)v59);
      archive_entry_sparse_add_entry(v59, v64, 0LL);
    }

    __int128 v65 = (char *)archive_entry_sparse_reset((uint64_t)v59);
  }

  else
  {
    __int128 v65 = 0LL;
  }

  int v66 = sub_180709A60((_DWORD *)a1, v59, &__s, &__n, (uint64_t)v10);
  if (v66)
  {
    uint64_t v67 = __s;
    sub_1806F7F14((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate pathname '%s' to %s", v68, v69, v70, v71, v72, v67);
    uint64_t v10 = 0LL;
    uint64_t v13 = 4294967276LL;
  }

  int v73 = sub_180709AC4((_DWORD *)a1, v59, &v197, &v191, (uint64_t)v10);
  if (v73)
  {
    uint64_t v74 = v197;
    sub_1806F7F14((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate uname '%s' to %s", v75, v76, v77, v78, v79, v74);
    uint64_t v10 = 0LL;
    uint64_t v13 = 4294967276LL;
  }

  int v80 = sub_180709B28((_DWORD *)a1, v59, &v196, &v190, (uint64_t)v10);
  if (v80)
  {
    __int128 v81 = v196;
    sub_1806F7F14((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate gname '%s' to %s", v82, v83, v84, v85, v86, v81);
    uint64_t v10 = 0LL;
    uint64_t v13 = 4294967276LL;
  }

  v198 = v200;
  unint64_t v192 = v194;
  if (v200 || (int v97 = sub_180709B8C((_DWORD *)a1, (uint64_t)v59, &v198, &v192, (uint64_t)v10)) == 0)
  {
    if (v10) {
      goto LABEL_75;
    }
  }

  else
  {
    time_t v98 = v198;
    sub_1806F7F14((uint64_t)v10);
    archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v99, v100, v101, v102, v103, v98);
    uint64_t v13 = 4294967276LL;
  }

  if (!*(_DWORD *)(v4 + 120))
  {
    if (!v200)
    {
LABEL_106:
      if (sub_180709A60((_DWORD *)a1, v59, &__s, &__n, 0LL) != -30
        && sub_180709AC4((_DWORD *)a1, v59, &v197, &v191, 0LL) != -30
        && sub_180709B28((_DWORD *)a1, v59, &v196, &v190, 0LL) != -30)
      {
        goto LABEL_74;
      }

      goto LABEL_109;
    }

    if (sub_1807099C0((_DWORD *)a1, (uint64_t)v59, &v200, &v194, 0LL) != -30)
    {
      v198 = v200;
      unint64_t v192 = v194;
      goto LABEL_106;
    }

  archive_set_error(a1, 63, "Pathname too long", v30, v31, v32, v33, v34, v139);
  uint64_t v17 = 4294967271LL;
LABEL_16:
  if (sub_1806AA22C((uint64_t)a3, &__s, &__n, a6))
  {
    if (*__error() == 12)
    {
LABEL_23:
      uint64_t v16 = "Can't allocate memory for Linkname";
      goto LABEL_43;
    }

    uint64_t v41 = __s;
    sub_1806F7F14(a6);
    archive_set_error(a1, 79, "Can't translate linkname '%s' to %s", v42, v43, v44, v45, v46, v41);
    uint64_t v17 = 4294967276LL;
  }

  uint64_t v47 = __n;
  if (!__n)
  {
    if (sub_1806AA610((uint64_t)a3, &__s, &__n, a6))
    {
      if (*__error() == 12) {
        goto LABEL_23;
      }
      uint64_t v50 = __s;
      sub_1806F7F14(a6);
      archive_set_error(a1, 79, "Can't translate linkname '%s' to %s", v51, v52, v53, v54, v55, v50);
      uint64_t v17 = 4294967276LL;
    }

    uint64_t v49 = __n;
    uint64_t v48 = -1;
    if (!__n) {
      goto LABEL_30;
    }
    goto LABEL_27;
  }

  uint64_t v48 = 49;
  uint64_t v49 = __n;
LABEL_27:
  if (v49 >= 0x65)
  {
    archive_set_error(a1, 63, "Link contents too long", v36, v37, v38, v39, v40, v139);
    uint64_t v49 = 100LL;
    size_t __n = 100LL;
    uint64_t v17 = 4294967271LL;
  }

  memcpy(__dst + 157, __s, v49);
LABEL_30:
  if (sub_1806AA760(a3, &__s, &__n, a6))
  {
    if (*__error() == 12)
    {
      uint64_t v16 = "Can't allocate memory for Uname";
      goto LABEL_43;
    }

    uint64_t v61 = __s;
    sub_1806F7F14(a6);
    archive_set_error(a1, 79, "Can't translate uname '%s' to %s", v62, v63, v64, v65, v66, v61);
    uint64_t v17 = 4294967276LL;
  }

  uint64_t v67 = __n;
  if (__n)
  {
    if (__n >= 0x21)
    {
      if (a4 != 120)
      {
        archive_set_error(a1, -1, "Username too long", v56, v57, v58, v59, v60, v139);
        uint64_t v17 = 4294967271LL;
      }

      uint64_t v67 = 32LL;
      size_t __n = 32LL;
    }

    memcpy(__dst + 265, __s, v67);
  }

  if (sub_1806AA0E4(a3, &__s, &__n, a6))
  {
    if (*__error() == 12)
    {
      uint64_t v16 = "Can't allocate memory for Gname";
      goto LABEL_43;
    }

    uint64_t v69 = __s;
    sub_1806F7F14(a6);
    archive_set_error(a1, 79, "Can't translate gname '%s' to %s", v70, v71, v72, v73, v74, v69);
    uint64_t v17 = 4294967276LL;
  }

  uint64_t v75 = __n;
  if (__n)
  {
    uint64_t v76 = __s;
    if (strlen(__s) >= 0x21)
    {
      if (a4 != 120)
      {
        archive_set_error(a1, -1, "Group name too long", v77, v78, v79, v80, v81, v139);
        uint64_t v17 = 4294967271LL;
        uint64_t v76 = __s;
      }

      uint64_t v75 = 32LL;
      size_t __n = 32LL;
    }

    memcpy(__dst + 297, v76, v75);
  }

  uint64_t v82 = archive_entry_mode((uint64_t)a3);
  if (sub_18070FA9C(v82 & 0xFFF, __dst + 100, 6uLL, 8, a5))
  {
    archive_set_error(a1, 34, "Numeric mode too large", v83, v84, v85, v86, v87, v139);
    uint64_t v17 = 4294967271LL;
  }

  uint64_t v88 = archive_entry_uid((uint64_t)a3);
  if (sub_18070FA9C(v88, __dst + 108, 6uLL, 8, a5))
  {
    archive_set_error(a1, 34, "Numeric user ID too large", v89, v90, v91, v92, v93, v139);
    uint64_t v17 = 4294967271LL;
  }

  int v94 = archive_entry_gid((uint64_t)a3);
  if (sub_18070FA9C(v94, __dst + 116, 6uLL, 8, a5))
  {
    archive_set_error(a1, 34, "Numeric group ID too large", v95, v96, v97, v98, v99, v139);
    uint64_t v17 = 4294967271LL;
  }

  uint64_t v100 = archive_entry_size((uint64_t)a3);
  if (sub_18070FA9C(v100, __dst + 124, 0xBuLL, 12, a5))
  {
    archive_set_error(a1, 34, "File size out of range", v101, v102, v103, v104, v105, v139);
    uint64_t v17 = 4294967271LL;
  }

  uint64_t v106 = archive_entry_mtime((uint64_t)a3);
  if (sub_18070FA9C(v106, __dst + 136, 0xBuLL, 11, a5))
  {
    archive_set_error(a1, 34, "File modification time too large", v107, v108, v109, v110, v111, v139);
    uint64_t v17 = 4294967271LL;
  }

  if (archive_entry_filetype((uint64_t)a3) == 24576
    || archive_entry_filetype((uint64_t)a3) == 0x2000)
  {
    uint64_t v112 = archive_entry_rdevmajor((uint64_t)a3);
    if (sub_18070FA9C(v112, __dst + 329, 6uLL, 8, a5))
    {
      archive_set_error(a1, 34, "Major device number too large", v113, v114, v115, v116, v117, v139);
      uint64_t v17 = 4294967271LL;
    }

    v118 = archive_entry_rdevminor(a3);
    BOOL v124 = a4;
    if (sub_18070FA9C(v118, __dst + 337, 6uLL, 8, a5))
    {
      archive_set_error(a1, 34, "Minor device number too large", v119, v120, v121, v122, v123, v139);
      uint64_t v17 = 4294967271LL;
    }

    if ((a4 & 0x80000000) == 0) {
      goto LABEL_69;
    }
LABEL_71:
    if (v47)
    {
      __dst[156] = v48;
    }

    else
    {
      HIDWORD(v125) = archive_entry_filetype((uint64_t)a3);
      LODWORD(v125) = HIDWORD(v125) - 4096;
      switch((v125 >> 12))
      {
        case 0u:
          int v126 = 54;
          goto LABEL_81;
        case 1u:
          int v126 = 51;
          goto LABEL_81;
        case 3u:
          int v126 = 53;
          goto LABEL_81;
        case 5u:
          int v126 = 52;
          goto LABEL_81;
        case 7u:
          int v126 = 48;
          goto LABEL_81;
        case 9u:
          int v126 = 50;
LABEL_81:
          __dst[156] = v126;
          break;
        default:
          sub_1807010BC(a1, a3);
          uint64_t v17 = 4294967271LL;
          break;
      }
    }

    goto LABEL_82;
  }

  BOOL v124 = a4;
  if (a4 < 0) {
    goto LABEL_71;
  }
LABEL_69:
  __dst[156] = v124;
LABEL_82:
  __int16 v127 = 0LL;
  int v128 = 0uLL;
  uint64_t v129 = 0uLL;
  unint64_t v130 = 0uLL;
  uint64_t v131 = 0uLL;
  do
  {
    unint64_t v132 = *(uint8x16_t *)&__dst[v127];
    uint64_t v133 = vmovl_u8(*(uint8x8_t *)v132.i8);
    uint64_t v134 = vmovl_high_u8(v132);
    uint64_t v131 = (int32x4_t)vaddw_high_u16((uint32x4_t)v131, v134);
    unint64_t v130 = (int32x4_t)vaddw_u16((uint32x4_t)v130, *(uint16x4_t *)v134.i8);
    uint64_t v129 = (int32x4_t)vaddw_high_u16((uint32x4_t)v129, v133);
    int v128 = (int32x4_t)vaddw_u16((uint32x4_t)v128, *(uint16x4_t *)v133.i8);
    v127 += 16LL;
  }

  while (v127 != 512);
  unint64_t v135 = vaddvq_s32(vaddq_s32(vaddq_s32(v128, v130), vaddq_s32(v129, v131)));
  __dst[154] = 0;
  uint64_t v136 = __dst + 154;
  for (uint64_t i = 7; i > 1; --i)
  {
    v138 = v135;
    *--uint64_t v136 = v135 & 7 | 0x30;
    v135 >>= 3;
  }

  if (v138 >= 8)
  {
    *((_WORD *)v136 + 2) = 14135;
    *(_DWORD *)uint64_t v136 = 926365495;
  }

  return v17;
}

LABEL_181:
  v164 = v200;
  if (*(_DWORD *)(a1 + 16) != 196610 && v200)
  {
    archive_entry_set_size((uint64_t)v59, 0LL);
    v164 = v200;
  }

  if (v164) {
    archive_entry_set_size((uint64_t)v59, 0LL);
  }
  uint64_t v165 = archive_entry_size((uint64_t)v59);
  uint64_t v166 = *(void *)(v4 + 72);
  if (v166)
  {
    uint64_t v167 = -*(_WORD *)(v4 + 72) & 0x1FF;
    *(void *)(v4 + 88) = v167;
    archive_entry_set_size((uint64_t)v59, v166 + v149 + v167);
  }

  if (*(void *)(v4 + 48))
  {
    v168 = (uint64_t *)archive_entry_new2(a1);
    sub_18070A704((uint64_t)v202, v189[0]);
    archive_entry_set_pathname((uint64_t)v168, v202);
    archive_entry_set_size((uint64_t)v168, *(void *)(v4 + 48));
    uint64_t v169 = archive_entry_uid((uint64_t)v59);
    if (v169 >= 0x3FFFF) {
      uint64_t v170 = 0x3FFFFLL;
    }
    else {
      uint64_t v170 = v169;
    }
    archive_entry_set_uid((uint64_t)v168, v170);
    uint64_t v171 = archive_entry_gid((uint64_t)v59);
    if (v171 >= 0x3FFFF) {
      uint64_t v172 = 0x3FFFFLL;
    }
    else {
      uint64_t v172 = v171;
    }
    archive_entry_set_gid((uint64_t)v168, v172);
    __int16 v173 = archive_entry_mode((uint64_t)v59);
    archive_entry_set_mode((uint64_t)v168, v173 & 0xF1FF);
    v174 = (char *)archive_entry_uname(v59);
    archive_entry_set_uname((uint64_t)v168, v174);
    v175 = (char *)archive_entry_gname(v59);
    archive_entry_set_gname((uint64_t)v168, v175);
    uint64_t v176 = archive_entry_mtime((uint64_t)v59);
    else {
      uint64_t v177 = v176 & ~(v176 >> 63);
    }
    archive_entry_set_mtime((uint64_t)v168, v177, 0LL);
    archive_entry_set_atime((uint64_t)v168, 0LL, 0LL);
    archive_entry_set_ctime((uint64_t)v168, 0LL, 0LL);
    int v178 = sub_18070F3C4((_DWORD *)a1, (char *)&v205, v168, 120, 1, 0LL);
    archive_entry_free((void **)v168);
    if (v178 <= -21)
    {
      v161 = "archive_write_pax_header: 'x' header failed?!  This can't happen.\n";
      v162 = (_DWORD *)a1;
      int v163 = -1;
LABEL_203:
      archive_set_error(v162, v163, v161, v156, v157, v158, v159, v160, v188);
      goto LABEL_230;
    }

    else {
      uint64_t v11 = v178;
    }
    if (sub_1806FDA50(a1, (uint64_t)&v205, 512LL))
    {
      sub_180709A24(v4);
      *(void *)uint64_t v4 = 0LL;
      *(void *)(v4 + 8) = 0LL;
LABEL_230:
      archive_entry_free((void **)v59);
      tm v107 = v189;
      goto LABEL_231;
    }

    uint64_t v185 = *(void *)(v4 + 40);
    uint64_t v186 = *(void *)(v4 + 48);
    uint64_t v187 = -*(_WORD *)(v4 + 48) & 0x1FF;
    *(void *)uint64_t v4 = v186;
    *(void *)(v4 + 8) = v187;
    *(void *)uint64_t v4 = 0LL;
    *(void *)(v4 + 8) = 0LL;
  }

  else
  {
    uint64_t v11 = v13;
  }

  uint64_t v180 = sub_1806FDA50(a1, (uint64_t)v204, 512LL);
  if ((_DWORD)v180)
  {
    uint64_t v181 = v180;
    archive_entry_free((void **)v59);
    sub_1806F755C((uint64_t)v189);
    return v181;
  }

  else
  {
    archive_entry_set_size((uint64_t)a2, v165);
    if (!*(void *)(v4 + 96) && v165)
    {
      sub_18070A294(v4, 0LL, v165);
      LODWORD(v149) = v165;
    }

    *(void *)(v4 + 8) = -(int)v149 & 0x1FFLL;
    archive_entry_free((void **)v59);
    sub_1806F755C((uint64_t)v189);
  }

  return v11;
}

unint64_t sub_1807097DC(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = (void *)a1[33];
  uint64_t v7 = v6[9];
  if (v7)
  {
    int v8 = sub_1806FDA50((uint64_t)a1, v6[8], v7);
    if (v8) {
      return v8;
    }
    int v8 = sub_1806FDAB0(a1, v6[11]);
    if (v8) {
      return v8;
    }
    v6[9] = 0LL;
  }

  unint64_t v9 = 0LL;
  if (a3)
  {
    uint64_t v10 = (void *)v6[12];
    while (v10)
    {
      while (1)
      {
        unint64_t v11 = v10[3];
        if (v11) {
          break;
        }
        uint64_t v12 = (void *)*v10;
        free(v10);
        v6[12] = v12;
        uint64_t v10 = v12;
        if (!v12) {
          return v9;
        }
      }

      if (a3 - v9 >= v11) {
        uint64_t v13 = v10[3];
      }
      else {
        uint64_t v13 = a3 - v9;
      }
      if (*((_DWORD *)v10 + 2))
      {
        v10[3] = v11 - v13;
      }

      else
      {
        int v14 = sub_1806FDA50((uint64_t)a1, a2 + v9, v13);
        uint64_t v10 = (void *)v6[12];
        v10[3] -= v13;
        if (v14) {
          return v14;
        }
      }

      v9 += v13;
      if (v9 >= a3) {
        return v9;
      }
    }
  }

  return v9;
}

uint64_t sub_1807098D8(void *a1)
{
  return sub_1806FDAB0(a1, 0x400uLL);
}

uint64_t sub_1807098E0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 264);
  if (v1)
  {
    sub_1806F755C((uint64_t)(v1 + 5));
    sub_1806F755C((uint64_t)(v1 + 8));
    sub_1806F755C((uint64_t)(v1 + 2));
    while (1)
    {
      int v3 = (void *)v1[12];
      if (!v3) {
        break;
      }
      v1[12] = *v3;
      free(v3);
    }

    free(v1);
    *(void *)(a1 + 264) = 0LL;
  }

  return 0LL;
}

uint64_t sub_180709944(void *a1)
{
  int v2 = (uint64_t *)a1[33];
  uint64_t v3 = *v2;
  if (!*v2)
  {
    uint64_t v4 = (void *)v2[12];
    if (v4)
    {
      uint64_t v3 = 0LL;
      do
      {
        if (!*((_DWORD *)v4 + 2)) {
          v3 += v4[3];
        }
        uint64_t v5 = (void *)*v4;
        free(v4);
        v2[12] = (uint64_t)v5;
        uint64_t v4 = v5;
      }

      while (v5);
    }

    else
    {
      uint64_t v3 = 0LL;
    }
  }

  uint64_t result = sub_1806FDAB0(a1, v2[1] + v3);
  *int v2 = 0LL;
  v2[1] = 0LL;
  return result;
}

uint64_t sub_1807099C0(_DWORD *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t result = sub_1806AA22C(a2, a3, a4, a5);
  if ((_DWORD)result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Linkname", v7, v8, v9, v10, v11, v12);
      return 4294967266LL;
    }

    else
    {
      return 4294967276LL;
    }
  }

  return result;
}

void *sub_180709A24(uint64_t a1)
{
  for (uint64_t result = *(void **)(a1 + 96); result; uint64_t result = *(void **)(a1 + 96))
  {
    *(void *)(a1 + 96) = *result;
    free(result);
  }

  *(void *)(a1 + 104) = 0LL;
  return result;
}

uint64_t sub_180709A60(_DWORD *a1, uint64_t *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t result = sub_1806AA3BC(a2, a3, a4, a5);
  if ((_DWORD)result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Pathname", v7, v8, v9, v10, v11, v12);
      return 4294967266LL;
    }

    else
    {
      return 4294967276LL;
    }
  }

  return result;
}

uint64_t sub_180709AC4(_DWORD *a1, uint64_t *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t result = sub_1806AA760(a2, a3, a4, a5);
  if ((_DWORD)result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Uname", v7, v8, v9, v10, v11, v12);
      return 4294967266LL;
    }

    else
    {
      return 4294967276LL;
    }
  }

  return result;
}

uint64_t sub_180709B28(_DWORD *a1, uint64_t *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t result = sub_1806AA0E4(a2, a3, a4, a5);
  if ((_DWORD)result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Gname", v7, v8, v9, v10, v11, v12);
      return 4294967266LL;
    }

    else
    {
      return 4294967276LL;
    }
  }

  return result;
}

uint64_t sub_180709B8C(_DWORD *a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t result = sub_1806AA610(a2, a3, a4, a5);
  if ((_DWORD)result)
  {
    if (*__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Linkname", v7, v8, v9, v10, v11, v12);
      return 4294967266LL;
    }

    else
    {
      return 4294967276LL;
    }
  }

  return result;
}

char *sub_180709BF0(char *__dst, char *__src, size_t __n, char *__s)
{
  uint64_t v5 = __n;
  if (__s)
  {
    size_t v8 = strlen(__s) + 2;
  }

  else
  {
    if (__n < 0x64)
    {
      strncpy(__dst, __src, __n);
      uint64_t v9 = &__dst[v5];
      goto LABEL_65;
    }

    size_t v8 = 0LL;
  }

  uint64_t v10 = &__src[v5];
  if (v5 < 1) {
    goto LABEL_17;
  }
  char v11 = 1;
  while (1)
  {
    int v12 = *(v10 - 1);
    if (v12 == 47)
    {
      uint64_t v13 = v5 - 1;
      goto LABEL_13;
    }

    uint64_t v13 = v5 - 2;
    if (v12 != 46 || __src[v13] != 47) {
      goto LABEL_16;
    }
LABEL_13:
    char v11 = 0;
    uint64_t v10 = &__src[v13];
    uint64_t v5 = v13;
    if (v13 <= 0)
    {
      char v14 = 0;
      uint64_t v15 = v13 - 1;
      uint64_t v16 = &__src[v15];
      uint64_t v17 = 98LL;
      goto LABEL_26;
    }
  }

  uint64_t v5 = 1LL;
LABEL_16:
  if ((v11 & 1) != 0)
  {
LABEL_17:
    char v14 = 1;
    uint64_t v17 = 99LL;
  }

  else
  {
    char v14 = 0;
    uint64_t v17 = 98LL;
  }

  uint64_t v15 = v5 - 1;
  if (v5 < 2)
  {
    uint64_t v16 = &__src[v15];
LABEL_26:
    uint64_t v18 = v15;
  }

  else
  {
    uint64_t v18 = v5 - 1;
    while (__src[v18] != 47)
    {
      BOOL v19 = v18-- <= 1;
      if (v19)
      {
        uint64_t v18 = 0LL;
        uint64_t v16 = __src;
        goto LABEL_28;
      }
    }

    uint64_t v16 = &__src[v18];
  }

uint64_t *sub_180709E7C(uint64_t *a1, char *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v11[1] = 0;
  if (a3 >= 0) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = -a3;
  }
  uint64_t v6 = v11;
  do
  {
    *v6-- = a0123456789[v5 % 0xA];
    BOOL v7 = v5 >= 9;
    BOOL v8 = v5 == 9;
    v5 /= 0xAuLL;
  }

  while (!v8 && v7);
  if (a3 < 0) {
    *uint64_t v6 = 45;
  }
  else {
    ++v6;
  }
  int v9 = strlen(v6);
  return sub_18070A840(a1, a2, (uint64_t)v6, v9);
}

uint64_t *sub_180709F50(uint64_t *a1, char *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v6 = &v16;
  char v16 = 0;
  int v7 = 11;
  do
  {
    unint64_t v8 = a4;
    int v9 = v7;
    a4 /= 0xAuLL;
    unint64_t v10 = v8 - 10 * a4;
    --v7;
  }

  while (v9 != 2 && !v10);
  if (v9 != 2)
  {
    if (v7 >= 2)
    {
      do
      {
        *--uint64_t v6 = a0123456789[v10];
        unint64_t v10 = a4 % 0xA;
        --v7;
        a4 /= 0xAuLL;
      }

      while (v7 > 1);
    }

    *--uint64_t v6 = 46;
  }

  if (a3 >= 0) {
    unint64_t v11 = a3;
  }
  else {
    unint64_t v11 = -a3;
  }
  uint64_t v12 = v6 - 1;
  do
  {
    *v12-- = a0123456789[v11 % 0xA];
    BOOL v13 = v11 > 9;
    v11 /= 0xAuLL;
  }

  while (v13);
  if (a3 < 0) {
    *uint64_t v12 = 45;
  }
  else {
    ++v12;
  }
  int v14 = strlen(v12);
  return sub_18070A840(a1, a2, (uint64_t)v12, v14);
}

uint64_t sub_18070A0A4(_DWORD *a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  if ((archive_entry_acl_types(a2) & 0x3C00) != 0)
  {
    unint64_t v8 = "SCHILY.acl.ace";
  }

  else if ((a4 & 0x100) != 0)
  {
    unint64_t v8 = "SCHILY.acl.access";
  }

  else
  {
    if ((a4 & 0x200) == 0) {
      return 4294967266LL;
    }
    unint64_t v8 = "SCHILY.acl.default";
  }

  int v9 = sub_1806AB698(a2, 0LL, a4, *(void *)(a3 + 112));
  if (!v9)
  {
    if (*__error() != 12)
    {
      archive_set_error(a1, 79, "%s %s %s", v13, v14, v15, v16, v17, "Can't translate ");
      return 4294967276LL;
    }

    archive_set_error(a1, 12, "%s %s", v13, v14, v15, v16, v17, "Can't allocate memory for ");
    return 4294967266LL;
  }

  unint64_t v10 = v9;
  if (*v9)
  {
    int v11 = strlen(v9);
    sub_18070A840((uint64_t *)(a3 + 40), v8, (uint64_t)v10, v11);
  }

  free(v10);
  return 0LL;
}

char *sub_18070A1D8(char *a1, char *__s)
{
  if (!__s || !*__s)
  {
    strcpy(a1, "GNUSparseFile/blank");
    return a1;
  }

  uint64_t v4 = strlen(__s);
  if (v4 < 1) {
    goto LABEL_13;
  }
  while (1)
  {
    int v5 = __s[v4 - 1];
    if (v5 != 47) {
      break;
    }
LABEL_8:
    if (v4-- <= 1)
    {
      uint64_t v4 = 0LL;
      goto LABEL_13;
    }
  }

  if ((unint64_t)v4 >= 2)
  {
    if (v5 != 46 || __s[v4 - 2] != 47) {
      goto LABEL_13;
    }
    goto LABEL_8;
  }

  uint64_t v4 = 1LL;
LABEL_13:
  sub_180709BF0(a1, __s, v4, "GNUSparseFile.0");
  return a1;
}

uint64_t sub_18070A294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 104);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 24) + *(void *)(v6 + 16);
  }
  else {
    uint64_t v7 = 0LL;
  }
  if (a2 <= v7) {
    return sub_18070A9AC(a1, a2, a3, 0);
  }
  uint64_t result = sub_18070A9AC(a1, v7, a2 - v7, 1);
  if (!(_DWORD)result) {
    return sub_18070A9AC(a1, a2, a3, 0);
  }
  return result;
}

uint64_t sub_18070A310(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t result = archive_entry_xattr_reset(a3);
  if (!(_DWORD)result) {
    return result;
  }
  int v7 = result;
  unint64_t v8 = (void *)(a2 + 16);
  uint64_t v48 = (uint64_t *)(a2 + 40);
  uint64_t v49 = v3;
  while (1)
  {
    archive_entry_xattr_next(v3, &v52, &v51, &v50);
    char v14 = *v52;
    if (*v52)
    {
      unint64_t v15 = 0LL;
      uint64_t v16 = v52 + 1;
      uint64_t v17 = v52 + 1;
      char v18 = *v52;
      do
      {
        if (v18 < 33 || v18 == 37 || v18 == 127 || v18 == 61)
        {
          if (v15 > 0xFFFFFFFFFFFFFFFBLL) {
            goto LABEL_44;
          }
          uint64_t v19 = 3LL;
        }

        else
        {
          if (v15 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_44;
          }
          uint64_t v19 = 1LL;
        }

        v15 += v19;
        char v20 = *v17++;
        char v18 = v20;
      }

      while (v20);
      unint64_t v42 = (char *)malloc(v15 + 1);
      unint64_t v21 = v42;
      if (!v42) {
        goto LABEL_44;
      }
      do
      {
        if (v14 < 33 || v14 == 37 || v14 == 127 || v14 == 61)
        {
          *unint64_t v42 = 37;
          v42[1] = a0123456789abcd_2[v14 >> 4];
          v42[2] = a0123456789abcd_2[v14 & 0xF];
          v42 += 3;
        }

        else
        {
          *v42++ = v14;
        }

        char v43 = *v16++;
        char v14 = v43;
      }

      while (v43);
    }

    else
    {
      unint64_t v42 = (char *)malloc(1uLL);
      unint64_t v21 = v42;
      if (!v42) {
        goto LABEL_44;
      }
    }

    *unint64_t v42 = 0;
    size_t v22 = strlen(v21);
    int v23 = sub_1806F81AC((uint64_t)v8, v21, v22, *(void *)(a2 + 112));
    free(v21);
    if (v23) {
      break;
    }
    unsigned int v24 = v8;
    size_t v25 = (_BYTE *)*v8;
    if (*v8)
    {
      unint64_t v27 = v50;
      uint64_t v26 = (uint64_t)v51;
      int v28 = *(_DWORD *)(a2 + 124);
      if ((v28 & 2) != 0)
      {
        uint64_t v47 = v51;
        uint64_t v29 = (char *)malloc(((4 * v50) | 2) / 3 + 1);
        uint64_t v30 = v29;
        if (v29)
        {
          uid_t v31 = v47;
          unint64_t v32 = v27;
          size_t v33 = v29;
          if (v27 >= 3)
          {
            size_t v33 = v29;
            unint64_t v32 = v27;
            uid_t v31 = v47;
            do
            {
              int v34 = *v31;
              int v35 = v31[1];
              uint64_t v36 = v31[2] & 0x3F;
              unint64_t v37 = v31[2] | (v35 << 8);
              v31 += 3;
              v32 -= 3LL;
              *size_t v33 = byte_1807208EC[v34 >> 2];
              v33[1] = byte_1807208EC[((unint64_t)((v35 << 8) & 0xF000 | (v34 << 16)) >> 12) & 0x3F];
              v33[2] = byte_1807208EC[(v37 >> 6) & 0x3F];
              v33[3] = byte_1807208EC[v36];
              v33 += 4;
            }

            while (v32 > 2);
          }

          if (v32 == 2)
          {
            int v44 = *v31;
            int v45 = v31[1];
            *size_t v33 = byte_1807208EC[v44 >> 2];
            uint64_t v39 = v33 + 2;
            v33[1] = byte_1807208EC[((unint64_t)((v45 << 8) & 0xF000 | (v44 << 16)) >> 12) & 0x3F];
            unsigned int v40 = 4 * (v45 & 0xF);
            uint64_t v41 = 3LL;
LABEL_36:
            v33 += v41;
            *uint64_t v39 = byte_1807208EC[v40];
          }

          else if (v32 == 1)
          {
            unsigned __int8 v38 = *v31;
            *size_t v33 = byte_1807208EC[*v31 >> 2];
            uint64_t v39 = v33 + 1;
            unsigned int v40 = 16 * (v38 & 3);
            uint64_t v41 = 2LL;
            goto LABEL_36;
          }

          *size_t v33 = 0;
          __s = 0LL;
          uint64_t v54 = 0LL;
          uint64_t v55 = 0LL;
          sub_1806F7634((uint64_t *)&__s, "LIBARCHIVE.xattr.", 0x11uLL);
          sub_1806F76CC((uint64_t *)&__s, v25);
          int v46 = strlen(v30);
          sub_18070A840(v48, __s, (uint64_t)v30, v46);
          sub_1806F755C((uint64_t)&__s);
          int v28 = *(_DWORD *)(a2 + 124);
        }

        free(v30);
        uint64_t v26 = (uint64_t)v47;
      }

      if ((v28 & 1) != 0)
      {
        __s = 0LL;
        uint64_t v54 = 0LL;
        uint64_t v55 = 0LL;
        sub_1806F7634((uint64_t *)&__s, "SCHILY.xattr.", 0xDuLL);
        sub_1806F76CC((uint64_t *)&__s, v25);
        sub_18070A840(v48, __s, v26, v27);
        sub_1806F755C((uint64_t)&__s);
      }
    }

    --v7;
    unint64_t v8 = v24;
    uint64_t v3 = v49;
    if (!v7) {
      return 0LL;
    }
  }

  if (v23 == -1)
  {
LABEL_44:
    archive_set_error(a1, 12, "Can't allocate memory", v9, v10, v11, v12, v13, v47);
    return 4294967266LL;
  }

  archive_set_error(a1, -1, "Error encoding pax extended attribute", v9, v10, v11, v12, v13, v47);
  return 4294967271LL;
}

uint64_t sub_18070A704(uint64_t a1, char *__s)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (__s && (int v4 = *__s, *__s))
  {
    int64_t v5 = strlen(__s);
    size_t v6 = v5;
    if (v5 >= 1)
    {
      while (1)
      {
        int v7 = __s[v6 - 1];
        if (v7 != 47)
        {
          if (v6 < 2)
          {
            if (v4 == 46)
            {
              strcpy((char *)a1, "PaxHeader/currentdir");
              return a1;
            }

            size_t v6 = 1LL;
LABEL_18:
            strcpy(__sa, "PaxHeader");
            sub_180709BF0((char *)a1, __s, v6, __sa);
            return a1;
          }

          if (v7 != 46 || __s[v6 - 2] != 47) {
            goto LABEL_18;
          }
        }
      }
    }

    if (v5) {
      goto LABEL_18;
    }
LABEL_14:
    *(_DWORD *)(a1 + 15) = 7498084;
    uint64_t v9 = "/PaxHeader/rootdir";
  }

  else
  {
    uint64_t v9 = "PaxHeader/blank";
  }

  *(_OWORD *)a1 = *(_OWORD *)v9;
  return a1;
}

uint64_t *sub_18070A840(uint64_t *a1, char *__s, uint64_t a3, int a4)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v8 = strlen(__s);
  int v9 = a4 + v8 + 3;
  if (v9 < 1)
  {
    int v10 = 0;
    int v11 = 1;
  }

  else
  {
    int v10 = 0;
    int v11 = 1;
    unsigned int v12 = a4 + v8 + 3;
    do
    {
      ++v10;
      v11 *= 10;
      BOOL v13 = v12 >= 9;
      BOOL v14 = v12 == 9;
      v12 /= 0xAu;
    }

    while (!v14 && v13);
  }

  int v15 = v10 + v9;
  v19[1] = 0;
  if (v15 >= v11) {
    ++v15;
  }
  if (v15 >= 0) {
    unint64_t v16 = v15;
  }
  else {
    unint64_t v16 = -v15;
  }
  uint64_t v17 = v19;
  do
  {
    *v17-- = a0123456789[v16 % 0xA];
    BOOL v13 = v16 >= 9;
    BOOL v14 = v16 == 9;
    v16 /= 0xAuLL;
  }

  while (!v14 && v13);
  if (v15 < 0) {
    _BYTE *v17 = 45;
  }
  else {
    ++v17;
  }
  sub_1806F76CC(a1, v17);
  sub_1806F76DC(a1, 32);
  sub_1806F76CC(a1, __s);
  sub_1806F76DC(a1, 61);
  sub_1806F740C(a1, a3);
  return sub_1806F76DC(a1, 10);
}

uint64_t sub_18070A9AC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v8 = malloc(0x20uLL);
  if (!v8) {
    return 4294967266LL;
  }
  *(void *)int v8 = 0LL;
  v8[2] = a4;
  *((void *)v8 + 2) = a2;
  *((void *)v8 + 3) = a3;
  int v9 = (void *)(a1 + 96);
  if (*(void *)(a1 + 96) && (int v10 = *(void **)(a1 + 104)) != 0LL) {
    int v9 = (void *)(a1 + 104);
  }
  else {
    int v10 = (void *)(a1 + 104);
  }
  uint64_t v11 = 0LL;
  *int v10 = v8;
  void *v9 = v8;
  return v11;
}

uint64_t archive_read_support_format_lha(int *a1)
{
  if (!sub_180700FBC("lha"))
  {
    int v10 = "Format not allow-listed in entitlements";
    uint64_t v11 = a1;
    int v12 = -1;
LABEL_7:
    archive_set_error(v11, v12, v10, v2, v3, v4, v5, v6, v13);
    return 4294967266LL;
  }

  uint64_t result = sub_1806A93F4(a1, 14594245, 1, "archive_read_support_format_lha", v3, v4, v5, v6);
  if ((_DWORD)result == -30) {
    return result;
  }
  int v8 = calloc(1uLL, 0x1A8uLL);
  if (!v8)
  {
    int v10 = "Can't allocate lha data";
    uint64_t v11 = a1;
    int v12 = 12;
    goto LABEL_7;
  }

  int v9 = v8;
  v8[34] = 0LL;
  v8[35] = 0LL;
  v8[36] = 0LL;
  uint64_t result = sub_1806BB258( a1,  (uint64_t)v8,  "lha",  (uint64_t)sub_18070AB30,  (uint64_t)sub_18070AC30,  (uint64_t)sub_18070ACC8,  (uint64_t)sub_18070B7D4,  (uint64_t)sub_18070C924,  0LL,  (uint64_t)sub_18070C990,  0LL,  0LL);
  if ((_DWORD)result)
  {
    free(v9);
    return 0LL;
  }

  return result;
}

uint64_t sub_18070AB30( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 > 30) {
    return 0xFFFFFFFFLL;
  }
  v27[7] = v8;
  v27[8] = v9;
  int v12 = (_BYTE *)sub_1806BB3B8(a1, 0x16uLL, 0LL, a4, a5, a6, a7, a8);
  if (!v12) {
    return 0xFFFFFFFFLL;
  }
  BOOL v13 = v12;
  if (!sub_18070CA24(v12)) {
    return 30LL;
  }
  if (*v13 != 77 || v13[1] != 90) {
    return 0LL;
  }
  uint64_t v19 = 0LL;
  unint64_t v20 = 4096LL;
  do
  {
    while (1)
    {
      size_t v21 = sub_1806BB3B8(a1, v20 + v19, v27, v14, v15, v16, v17, v18);
      if (v21) {
        break;
      }
      BOOL v22 = v20 >= 0x32;
      v20 >>= 1;
      if (!v22) {
        return 0LL;
      }
    }

    size_t v23 = v21;
    unsigned int v24 = (_BYTE *)(v21 + v19);
    unint64_t v25 = v21 + v27[0];
    while ((unint64_t)(v24 + 22) < v25)
    {
      uint64_t v26 = sub_18070CA24(v24);
      if (!v26) {
        return 30LL;
      }
      v24 += v26;
    }

    uint64_t result = 0LL;
    uint64_t v19 = (uint64_t)&v24[-v23];
  }

  while (v19 < 20480);
  return result;
}

uint64_t sub_18070AC30(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5 = **(void **)(a1 + 2472);
  if (a3 && *a3)
  {
    int v12 = sub_1806F7E1C(a1, a3, 0);
    *(void *)(v5 + 216) = v12;
    if (v12) {
      return 0LL;
    }
    else {
      return 4294967266LL;
    }
  }

  else
  {
    archive_set_error((_DWORD *)a1, -1, "lha: hdrcharset option needs a character-set name", v6, v7, v8, v9, v10, v13);
    return 4294967271LL;
  }

uint64_t sub_18070ACC8( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((byte_18C533A98 & 1) == 0)
  {
    uint64_t v10 = 0LL;
    byte_18C533A98 = 1;
    do
    {
      int v11 = -8;
      int v12 = v10;
      do
      {
        int v12 = (v12 << 31 >> 31) & 0xA001 ^ ((unsigned __int16)v12 >> 1);
        BOOL v13 = __CFADD__(v11++, 1);
      }

      while (!v13);
      word_18C533A9A[v10++] = v12;
    }

    while (v10 != 256);
    for (uint64_t i = 0LL; i != 256; ++i)
      word_18C533A9A[i + 256] = word_18C533A9A[word_18C533A9A[i]] ^ HIBYTE(word_18C533A9A[i]);
  }

  *(_DWORD *)(a1 + 16) = 720896;
  if (!*(void *)(a1 + 24)) {
    *(void *)(a1 + 24) = "lha";
  }
  uint64_t v15 = **(void **)(a1 + 2472);
  *(_WORD *)(v15 + 299) = 0;
  *(_BYTE *)(v15 + 301) = 0;
  *(void *)(v15 + 16) = 0LL;
  uint64_t v16 = (unsigned __int8 *)sub_1806BB3B8(a1, 0x16uLL, 0LL, a4, a5, a6, a7, a8);
  if (!v16)
  {
    uint64_t v25 = 1LL;
    uint64_t v26 = (_BYTE *)sub_1806BB3B8(a1, 1uLL, 0LL, v17, v18, v19, v20, v21);
    if (!v26) {
      return v25;
    }
    if (*v26) {
      goto LABEL_19;
    }
    return 1LL;
  }

  BOOL v22 = v16;
  if (*(_BYTE *)(v15 + 297)) {
    goto LABEL_13;
  }
  int v23 = *v16;
  if (v23 == 77)
  {
    if (v16[1] == 90)
    {
      size_t v30 = 4096LL;
      while (1)
      {
        while (1)
        {
          size_t v31 = sub_1806BB3B8(a1, v30, v150, v17, v18, v19, v20, v21);
          size_t v33 = v31;
          if (v31) {
            break;
          }
          BOOL v13 = v30 >= 0x32;
          v30 >>= 1;
          if (!v13)
          {
LABEL_36:
            unsigned int v24 = "Couldn't find out LHa header";
            goto LABEL_20;
          }
        }

        int v34 = (_BYTE *)v31;
        if (*(void *)&v150[0] != 22LL) {
          break;
        }
LABEL_34:
        sub_1806BB660(a1, (uint64_t)&v34[-v33], v32, v17, v18, v19, v20, v21);
      }

      unint64_t v35 = v31 + *(void *)&v150[0];
      int v34 = (_BYTE *)v31;
      while (1)
      {
        uint64_t v36 = sub_18070CA24(v34);
        if (!v36) {
          break;
        }
        v34 += v36;
      }

      sub_1806BB660(a1, (uint64_t)&v34[-v33], v32, v17, v18, v19, v20, v21);
      BOOL v22 = (unsigned __int8 *)sub_1806BB3B8(a1, 1uLL, 0LL, v55, v56, v57, v58, v59);
      if (!v22)
      {
LABEL_19:
        unsigned int v24 = "Truncated LHa header";
LABEL_20:
        unint64_t v27 = (_DWORD *)a1;
        int v28 = 79;
LABEL_21:
        archive_set_error(v27, v28, v24, v17, v18, v19, v20, v21, v148);
        return 4294967266LL;
      }
    }

LABEL_104:
LABEL_105:
      if (!*(_BYTE *)(v15 + 298) && !*(void *)(v15 + 256)) {
        goto LABEL_19;
      }
      uint64_t v154 = 0LL;
      uint64_t v155 = 0LL;
      uint64_t v156 = 0LL;
      uint64_t v158 = 0LL;
      uint64_t v159 = 0LL;
      uint64_t v157 = 0LL;
      memset(v150, 0, sizeof(v150));
      __int128 v151 = 0u;
      memset(v152, 0, sizeof(v152));
      __int128 v153 = 0u;
      if (sub_1806F88EC( (uint64_t)v150,  *(char **)(v15 + 224),  *(void *)(v15 + 232),  *(void *)(v15 + 200)))
      {
        uint64_t v109 = *(void *)(v15 + 200);
LABEL_109:
        size_t v110 = (char *)sub_1806F7F14(v109);
        archive_set_error( (_DWORD *)a1,  79,  "Pathname cannot be converted from %s to Unicode.",  v111,  v112,  v113,  v114,  v115,  v110);
LABEL_111:
        sub_1806F8350((uint64_t)v150);
        sub_1806F755C((uint64_t)&v154);
        sub_1806F755C((uint64_t)&v157);
        return 4294967266LL;
      }

      uint64_t v155 = 0LL;
      sub_1806F74B4((uint64_t *)&v154, (uint64_t)v152);
      *((void *)&v150[0] + 1) = 0LL;
      *(void *)&__int128 v151 = 0LL;
      *(void *)&__int128 v153 = 0LL;
      *((void *)&v152[0] + 1) = 0LL;
      if (sub_1806F88EC( (uint64_t)v150,  *(char **)(v15 + 248),  *(void *)(v15 + 256),  *(void *)(v15 + 208)))
      {
        uint64_t v109 = *(void *)(v15 + 208);
        goto LABEL_109;
      }

      sub_1806F74B4((uint64_t *)&v154, (uint64_t)v152);
      sub_1806F8350((uint64_t)v150);
      __int16 v140 = *(_WORD *)(v15 + 120);
      if ((v140 & 0xF000) == 0xA000)
      {
        if (!sub_18070CB34((uint64_t *)&v157, (uint64_t)&v154))
        {
          archive_set_error((_DWORD *)a1, 79, "Unknown symlink-name", v141, v142, v143, v144, v145, v148);
          sub_1806F755C((uint64_t)&v154);
          sub_1806F755C((uint64_t)&v157);
          return 4294967271LL;
        }
      }

      else
      {
        if (*(_BYTE *)(v15 + 298)) {
          __int16 v146 = 0x4000;
        }
        else {
          __int16 v146 = 0x8000;
        }
        *(_WORD *)(v15 + 120) = v146 & 0xF000 | v140 & 0xFFF;
      }

      if ((*(_BYTE *)(v15 + 64) & 4) == 0 && (*(_BYTE *)(v15 + 296) & 1) != 0) {
        *(_WORD *)(v15 + 120) &= 0xFF6Du;
      }
      archive_entry_copy_pathname_w((uint64_t)a2, v154);
      sub_1806F755C((uint64_t)&v154);
      if (v158) {
        archive_entry_copy_symlink_w((uint64_t)a2, v157);
      }
      else {
        archive_entry_set_symlink((uint64_t)a2, 0LL);
      }
      sub_1806F755C((uint64_t)&v157);
      if (!v22[20]) {
        sub_18070CBA4(v15, a2);
      }
      archive_entry_set_mode((uint64_t)a2, *(_WORD *)(v15 + 120));
      archive_entry_set_uid((uint64_t)a2, *(void *)(v15 + 128));
      archive_entry_set_gid((uint64_t)a2, *(void *)(v15 + 136));
      if (*(void *)(v15 + 152)) {
        archive_entry_set_uname((uint64_t)a2, *(char **)(v15 + 144));
      }
      if (*(void *)(v15 + 176)) {
        archive_entry_set_gname((uint64_t)a2, *(char **)(v15 + 168));
      }
      if ((*(_BYTE *)(v15 + 64) & 1) != 0)
      {
        archive_entry_set_birthtime((uint64_t)a2, *(void *)(v15 + 72), *(void *)(v15 + 80));
        archive_entry_set_ctime((uint64_t)a2, *(void *)(v15 + 72), *(void *)(v15 + 80));
      }

      else
      {
        archive_entry_unset_birthtime((uint64_t)a2);
        archive_entry_unset_ctime((uint64_t)a2);
      }

      archive_entry_set_mtime((uint64_t)a2, *(void *)(v15 + 88), *(void *)(v15 + 96));
      if ((*(_BYTE *)(v15 + 64) & 2) != 0) {
        archive_entry_set_atime((uint64_t)a2, *(void *)(v15 + 104), *(void *)(v15 + 112));
      }
      else {
        archive_entry_unset_atime((uint64_t)a2);
      }
      else {
        archive_entry_set_size((uint64_t)a2, *(void *)(v15 + 56));
      }
      uint64_t v147 = *(void *)(v15 + 48);
      *(void *)(v15 + 8) = v147;
      if (v147 < 0)
      {
        unsigned int v24 = "Invalid LHa entry size";
        goto LABEL_20;
      }

      *(void *)uint64_t v15 = 0LL;
      *(_WORD *)(v15 + 24) = 0;
      if (!v147 || *(_BYTE *)(v15 + 298)) {
        *(_BYTE *)(v15 + 300) = 1;
      }
      __sprintf_chk( (char *)(v15 + 303),  0,  0x40uLL,  "lha -%c%c%c-",  *(char *)(v15 + 41),  *(char *)(v15 + 42),  *(char *)(v15 + 43));
      *(void *)(a1 + 24) = v15 + 303;
      break;
    case 3u:
      size_t v73 = sub_1806BB3B8(a1, 0x1CuLL, 0LL, v17, v18, v19, v20, v21);
      if (!v73) {
        goto LABEL_101;
      }
      if (*(_WORD *)v73 != 4) {
        goto LABEL_81;
      }
      uint64_t v74 = *(unsigned int *)(v73 + 24);
      *(void *)(v15 + 32) = v74;
      *(void *)(v15 + 48) = *(unsigned int *)(v73 + 7);
      *(void *)(v15 + 56) = *(unsigned int *)(v73 + 11);
      *(void *)(v15 + 88) = *(unsigned int *)(v73 + 15);
      *(_WORD *)(v15 + 194) = *(_WORD *)(v73 + 21);
      *(_DWORD *)(v15 + 64) |= 8u;
      LOWORD(v157) = sub_18070D358(0LL, (char *)v73, 0x1CuLL);
      sub_1806BB660(a1, 28LL, v116, v117, v118, v119, v120, v121);
      uint64_t v25 = sub_18070CD0C((_DWORD *)a1, v15, &v157, 4LL, *(void *)(v15 + 32) - 28LL, v150, v122, v123);
      goto LABEL_104;
    default:
      uint64_t v148 = (char *)v22[20];
      unsigned int v24 = "Unsupported LHa header level %d";
      goto LABEL_20;
  }

  return v25;
}

uint64_t sub_18070B7D4( uint64_t a1, char **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (void *)a4;
  uint64_t v9 = (void *)a3;
  uint64_t v11 = a1;
  int v12 = *(uint64_t **)(a1 + 2472);
  uint64_t v13 = *v12;
  uint64_t v14 = *(void *)(*v12 + 16);
  if (v14)
  {
    sub_1806BB660(a1, v14, a3, a4, a5, a6, a7, a8);
    *(void *)(v13 + 16) = 0LL;
  }

  if (*(_BYTE *)(v13 + 300))
  {
    void *v8 = *(void *)v13;
    void *v9 = 0LL;
    *a2 = 0LL;
    return sub_18070D44C(v11, v14, a3, a4, a5, a6, a7, a8);
  }

  uint64_t v16 = **(uint64_t ***)(v11 + 2472);
  if (!*(_BYTE *)(v13 + 302))
  {
    if (!v16[1])
    {
      uint64_t result = 0LL;
      *a2 = 0LL;
      void *v9 = 0LL;
      void *v8 = *v16;
      *((_BYTE *)v16 + 300) = 1;
      return result;
    }

    int v23 = (char *)sub_1806BB3B8(v11, 1uLL, v174, a4, a5, a6, a7, a8);
    *a2 = v23;
    unint64_t v24 = *(void *)&v174[0];
    if (*(uint64_t *)&v174[0] > 0)
    {
      uint64_t v25 = v16[1];
      if (*(uint64_t *)&v174[0] > v25)
      {
        *(void *)&v174[0] = v16[1];
        unint64_t v24 = v25;
      }

      *((_WORD *)v16 + 12) = sub_18070D358(*((unsigned __int16 *)v16 + 12), v23, v24);
      void *v9 = v24;
      void *v8 = *v16;
      unint64_t v26 = v16[1] - v24;
      *v16 += v24;
      v16[1] = v26;
      if (!v26) {
        *((_BYTE *)v16 + 300) = 1;
      }
      uint64_t result = 0LL;
      v16[2] = v24;
      return result;
    }

    int v39 = "Truncated LHa file data";
    goto LABEL_237;
  }

  if (!*((_BYTE *)v16 + 299))
  {
    unint64_t v27 = (char *)v16[52];
    if (!v27)
    {
      unint64_t v27 = (char *)calloc(1uLL, 0x158uLL);
      v16[52] = (uint64_t)v27;
      if (!v27) {
        goto LABEL_261;
      }
    }

    *((_DWORD *)v27 + 85) = -25;
    if (*((_BYTE *)v16 + 41) != 108 || *((_BYTE *)v16 + 42) != 104) {
      goto LABEL_27;
    }
    int v28 = *((char *)v16 + 43);
    switch(v28)
    {
      case '5':
        int v31 = 0;
        int v29 = 0;
        int v30 = 13;
        break;
      case '7':
        int v31 = 0;
        int v30 = 16;
        int v29 = 1;
        break;
      case '6':
        int v29 = 0;
        int v30 = 15;
        int v31 = 1;
        break;
      default:
LABEL_27:
        *a2 = 0LL;
        void *v9 = 0LL;
        void *v8 = 0LL;
        archive_set_error( (_DWORD *)v11,  79,  "Unsupported lzh compression method -%c%c%c-",  a4,  a5,  a6,  a7,  a8,  (char *)*((char *)v16 + 41));
        sub_18070C924(v11, v32, v33, v34, v35, v36, v37, v38);
        return 4294967276LL;
    }

    *((_DWORD *)v27 + 85) = -30;
    *(void *)(v27 + 4) = 0x1FFFF00020000LL;
    __int128 v151 = (char *)*((void *)v27 + 2);
    if (v151 || (__int128 v151 = (char *)malloc(0x20000uLL), (*((void *)v27 + 2) = v151) != 0LL))
    {
      memset(&v151[-(1 << v30) + 0x20000], 32, (1 << v30));
      *((_DWORD *)v27 + 6) = 0;
      *(_DWORD *)unint64_t v27 = 0;
      *((_DWORD *)v27 + 79) = v30 + 1;
      int v152 = v31 | v29 ? 5 : 4;
      *((_DWORD *)v27 + 80) = v152;
      *(void *)(v27 + 324) = 0x500000013LL;
      *((void *)v27 + 5) = 0LL;
      *((_DWORD *)v27 + 12) = 0;
      if (!sub_18070D4C0((uint64_t)(v27 + 56), 0x1FEuLL))
      {
        *((_DWORD *)v27 + 16) = 9;
        if (!sub_18070D4C0((uint64_t)(v27 + 184), 0x13uLL))
        {
          *((_DWORD *)v27 + 85) = 0;
          *((_BYTE *)v16 + 299) = 1;
          *((_DWORD *)v16 + 100) = 0;
          v16[51] = 0LL;
          goto LABEL_7;
        }
      }
    }

LABEL_261:
    int v39 = "Couldn't allocate memory for lzh decompression";
    uint64_t v144 = (_DWORD *)v11;
    int v145 = 12;
    goto LABEL_262;
  }

LABEL_156:
        int v116 = v101 - *(unsigned __int8 *)(v168 + v105);
        DWORD2(v174[0]) = v116;
        goto LABEL_159;
      }

      uint64_t v99 = v166;
      if (v164 != v167)
      {
        int v143 = 9;
        goto LABEL_227;
      }

      unsigned int v103 = (*(void *)&v174[0] << (v166 - BYTE8(v174[0]))) & *(unsigned __int16 *)&algn_18072097C[2 * v166 + 2];
      int v104 = *(_DWORD *)(v40 + 148);
      signed int v105 = *(unsigned __int16 *)(*(void *)(v40 + 168) + 2LL * (v103 >> v104));
      signed int v106 = *(_DWORD *)(v40 + 60);
      if (v106 <= v105 && v106 != 0)
      {
        while (1)
        {
          BOOL v82 = __OFSUB__(v104, 1);
          if (--v104 < 0 != v82) {
            break;
          }
          int v108 = v105 - v106;
          if (v108 >= *(_DWORD *)(v40 + 156)) {
            break;
          }
          uint64_t v109 = (unsigned __int16 *)(*(void *)(v40 + 176) + 4LL * v108);
          if (((v103 >> v104) & 1) == 0) {
            ++v109;
          }
          signed int v105 = *v109;
          if (v106 > v105) {
            goto LABEL_158;
          }
        }

        signed int v105 = 0;
      }

LABEL_158:
      int v116 = DWORD2(v174[0]) - *(unsigned __int8 *)(v168 + v105);
      DWORD2(v174[0]) = v116;
      if (v116 < 0) {
        goto LABEL_233;
      }
LABEL_159:
      --v94;
      *(_BYTE *)(v93 + v97++) = v105;
      if (v97 >= v98)
      {
        LODWORD(v97) = 0;
        uint64_t v142 = v16[51];
        v16[49] = *(void *)(v16[52] + 16);
        *((_DWORD *)v16 + 100) = v98;
        v16[51] = v142 + v98;
        int v143 = 9;
LABEL_227:
        int v21 = 0;
        _OWORD *v161 = v174[0];
        *(_DWORD *)(v40 + 312) = v94;
        *(_DWORD *)uint64_t v40 = v143;
        *(_DWORD *)(v40 + 24) = v97;
        goto LABEL_228;
      }
    }

    int v96 = v105 - 253;
LABEL_164:
    uint64_t v117 = v159;
    int v118 = sub_18070D548(v170, (unint64_t *)v174);
    int v116 = DWORD2(v174[0]);
    if (v118)
    {
      uint64_t v117 = v159;
LABEL_179:
      unsigned int v124 = (*(void *)&v174[0] >> (v116 - v117)) & *(unsigned __int16 *)&algn_18072097C[2 * v117 + 2];
      int v125 = *(_DWORD *)(v40 + 276);
      int i = *(unsigned __int16 *)(*(void *)(v40 + 296) + 2LL * (v124 >> v125));
      int v126 = *(_DWORD *)(v40 + 188);
      if (v126 <= i && v126 != 0)
      {
        while (1)
        {
          BOOL v82 = __OFSUB__(v125, 1);
          if (--v125 < 0 != v82 || i - v126 >= *(_DWORD *)(v40 + 284)) {
            break;
          }
          uint64_t v128 = (unsigned __int16 *)(*(void *)(v40 + 304) + 4LL * (i - v126));
          if (((v124 >> v125) & 1) == 0) {
            ++v128;
          }
          int i = *v128;
          if (v126 > i) {
            goto LABEL_190;
          }
        }

        int i = 0;
      }

LABEL_190:
      DWORD2(v174[0]) = v116 - *(unsigned __int8 *)(v158 + i);
      goto LABEL_193;
    }

    uint64_t v117 = v159;
    if (v164 != v167)
    {
      *(_DWORD *)(v40 + 32) = v96;
      int v143 = 10;
      goto LABEL_227;
    }

    unsigned int v119 = (*(void *)&v174[0] << (v159 - BYTE8(v174[0]))) & *(unsigned __int16 *)&algn_18072097C[2 * v159 + 2];
    int v120 = *(_DWORD *)(v40 + 276);
    int i = *(unsigned __int16 *)(*(void *)(v40 + 296) + 2LL * (v119 >> v120));
    int v121 = *(_DWORD *)(v40 + 188);
    if (v121 <= i && v121 != 0)
    {
      while (1)
      {
        BOOL v82 = __OFSUB__(v120, 1);
        if (--v120 < 0 != v82 || i - v121 >= *(_DWORD *)(v40 + 284)) {
          break;
        }
        uint64_t v123 = (unsigned __int16 *)(*(void *)(v40 + 304) + 4LL * (i - v121));
        if (((v119 >> v120) & 1) == 0) {
          ++v123;
        }
        int i = *v123;
        if (v121 > i) {
          goto LABEL_192;
        }
      }

      int i = 0;
    }

LABEL_192:
    DWORD2(v174[0]) -= *(unsigned __int8 *)(v158 + i);
    if ((SDWORD2(v174[0]) & 0x80000000) == 0)
    {
LABEL_193:
      if (i < 2) {
        goto LABEL_198;
      }
      int v129 = i - 1;
      int v130 = DWORD2(v174[0]);
      if (SDWORD2(v174[0]) >= i - 1
        || (v131 = sub_18070D548(v170, (unint64_t *)v174), int v130 = DWORD2(v174[0]), v131)
        || SDWORD2(v174[0]) >= v129)
      {
        int v132 = v130 - v129;
        int i = ((*(void *)&v174[0] >> v132) & *(unsigned __int16 *)&algn_18072097C[2 * v129 + 2]) + (1 << v129);
        DWORD2(v174[0]) = v132;
LABEL_198:
        for (int i = (v97 + ~i) & v172; ; int i = v136 & v172)
        {
LABEL_199:
          int v133 = i <= (int)v97 ? v97 : i;
          int v134 = v98 - v133;
          int v135 = v96 >= v98 - v133 ? v98 - v133 : v96;
          int v136 = v135 + i;
          uint64_t v137 = (char *)(v93 + (int)v97);
          BOOL v138 = v135 + i < (int)v97;
          LODWORD(v97) = v135 + v97;
          size_t v17 = v93 + i;
          BOOL v138 = v138 || (int)v97 < i;
          if (v138)
          {
            memcpy(v137, (const void *)v17, v135);
          }

          else
          {
            if (v135 < 2)
            {
              unint64_t v139 = 0LL;
            }

            else
            {
              unint64_t v139 = 0LL;
              do
              {
                __int16 v140 = &v137[v139];
                *__int16 v140 = *(_BYTE *)(v93 + i + v139);
                v140[1] = *(_BYTE *)(v93 + 1 + i + v139);
                v139 += 2LL;
              }

              while (v139 < (v135 - 1));
              unint64_t v139 = v139;
            }
          }

          if ((_DWORD)v97 == v98) {
            break;
          }
          if (v96 <= v134)
          {
            int v100 = 9;
            uint64_t v16 = v165;
            uint64_t v99 = v166;
            uint64_t v8 = v160;
            goto LABEL_127;
          }

          v96 -= v135;
        }

        uint64_t v141 = v165[51];
        v165[49] = *(void *)(v165[52] + 16);
        *((_DWORD *)v165 + 100) = v98;
        v165[51] = v141 + v98;
        LODWORD(v97) = 0;
        if (v96 <= v134)
        {
          int v143 = 9;
        }

        else
        {
          *(_DWORD *)(v40 + 28) = v136 & v172;
          *(_DWORD *)(v40 + 32) = v96 - v135;
          int v143 = 12;
        }

        uint64_t v16 = v165;
        uint64_t v8 = v160;
        goto LABEL_227;
      }

      if (v164 != v167)
      {
        *(_DWORD *)(v40 + 28) = i;
        *(_DWORD *)(v40 + 32) = v96;
        int v143 = 11;
        goto LABEL_227;
      }
    }

LABEL_233:
    int v21 = -25;
    *(_DWORD *)(v40 + 340) = -25;
LABEL_228:
    uint64_t v20 = v162;
    a2 = v163;
    if (v21 != 100) {
      goto LABEL_243;
    }
  }

  char v41 = (void *)(v40 + 40);
  uint64_t v171 = (int *)(v40 + 184);
  int v42 = *(_DWORD *)v40;
  uint64_t v169 = (_DWORD *)(v40 + 56);
  while (2)
  {
    switch(v42)
    {
      case 0:
        int v43 = *(_DWORD *)(v40 + 48);
        if (v43 > 15) {
          goto LABEL_37;
        }
        if (!sub_18070D548(v170, (unint64_t *)(v40 + 40)))
        {
          if (v164 != v167)
          {
            int v21 = 0;
            goto LABEL_242;
          }

          if (*(int *)(v40 + 48) <= 7)
          {
            uint64_t v153 = *(unsigned int *)(v40 + 24);
            if ((int)v153 < 1)
            {
              int v21 = 1;
            }

            else
            {
              int v21 = 0;
              uint64_t v154 = v16[51];
              v16[49] = *(void *)(v16[52] + 16);
              *((_DWORD *)v16 + 100) = v153;
              v16[51] = v154 + v153;
              *(_DWORD *)(v40 + 24) = 0;
            }

            goto LABEL_242;
          }

LABEL_239:
          int v21 = -25;
          *(_DWORD *)(v40 + 340) = -25;
          goto LABEL_242;
        }

        int v43 = *(_DWORD *)(v40 + 48);
LABEL_37:
        int v44 = v43 - 16;
        BOOL v81 = (unsigned __int16)(*(void *)(v40 + 40) >> v44) == 0;
        *(_DWORD *)(v40 + 312) = (unsigned __int16)(*(void *)(v40 + 40) >> v44);
        if (v81) {
          goto LABEL_239;
        }
        *(_DWORD *)(v40 + 48) = v44;
        *(_DWORD *)(v40 + 184) = *(_DWORD *)(v40 + 324);
        int v45 = *(_DWORD *)(v40 + 328);
        *(_DWORD *)(v40 + 192) = v45;
        *(_DWORD *)(v40 + 332) = 0;
LABEL_40:
        if (v44 < v45)
        {
          int v46 = sub_18070D548(v170, (unint64_t *)(v40 + 40));
          int v44 = *(_DWORD *)(v40 + 48);
          int v45 = *(_DWORD *)(v40 + 192);
          if (!v46 && v44 < v45)
          {
            if (v164 != v167)
            {
              int v21 = 0;
              int v146 = 1;
              goto LABEL_241;
            }

            goto LABEL_239;
          }
        }

        int v47 = v44 - v45;
        int v48 = (*(void *)(v40 + 40) >> (v44 - v45)) & *(unsigned __int16 *)&algn_18072097C[2 * v45 + 2];
        *(_DWORD *)(v40 + 188) = v48;
        *(_DWORD *)(v40 + 48) = v47;
        if (!v48)
        {
LABEL_49:
          int v50 = *(_DWORD *)(v40 + 48);
          int v51 = *(_DWORD *)(v40 + 192);
          if (v50 < v51)
          {
            int v52 = sub_18070D548(v170, (unint64_t *)(v40 + 40));
            int v50 = *(_DWORD *)(v40 + 48);
            int v51 = *(_DWORD *)(v40 + 192);
            if (!v52 && v50 < v51)
            {
              if (v164 != v167)
              {
                int v21 = 0;
                int v146 = 2;
                goto LABEL_241;
              }

              goto LABEL_239;
            }
          }

          uint64_t v53 = (*v41 >> (v50 - v51)) & *(unsigned __int16 *)&algn_18072097C[2 * v51 + 2];
          **(_WORD **)(v40 + 296) = v53;
          *(void *)(v40 + 272) = 0LL;
          *(_BYTE *)(*(void *)(v40 + 264) + v53) = 0;
          *(_DWORD *)(v40 + 48) -= *(_DWORD *)(v40 + 192);
          if (*(_DWORD *)(v40 + 332)) {
            int v42 = 9;
          }
          else {
            int v42 = 5;
          }
LABEL_118:
          *(_DWORD *)uint64_t v40 = v42;
          continue;
        }

uint64_t sub_18070C924( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(uint64_t **)(a1 + 2472);
  uint64_t v10 = *v9;
  uint64_t v11 = *(void *)(*v9 + 16);
  if (v11)
  {
    sub_1806BB660(a1, v11, a3, a4, a5, a6, a7, a8);
    *(void *)(v10 + 16) = 0LL;
  }

  if (*(_BYTE *)(v10 + 301)) {
    return 0LL;
  }
  if (sub_1806BB660(a1, *(void *)(v10 + 8), a3, a4, a5, a6, a7, a8) < 0) {
    return 4294967266LL;
  }
  uint64_t result = 0LL;
  *(_WORD *)(v10 + 300) = 257;
  return result;
}

uint64_t sub_18070C990(uint64_t a1)
{
  uint64_t v2 = **(void ****)(a1 + 2472);
  uint64_t v3 = (void **)v2[52];
  if (v3)
  {
    free(v3[2]);
    sub_18070DBA8((void **)v2[52] + 7);
    sub_18070DBA8((void **)v2[52] + 23);
    free(v2[52]);
    v2[52] = 0LL;
  }

  sub_1806F755C((uint64_t)(v2 + 28));
  sub_1806F755C((uint64_t)(v2 + 31));
  sub_1806F755C((uint64_t)(v2 + 18));
  sub_1806F755C((uint64_t)(v2 + 21));
  sub_1806F755C((uint64_t)(v2 + 34));
  free(v2);
  **(void **)(a1 + 2472) = 0LL;
  return 0LL;
}

uint64_t sub_18070CA24(_BYTE *a1)
{
  int v2 = a1[5];
  if (v2 > 0x63)
  {
    uint64_t result = 1LL;
    if (v2 <= 107)
    {
      if (v2 != 100)
      {
        if (v2 != 104) {
          return 4LL;
        }
        return result;
      }
    }

    else
    {
      if (v2 == 108) {
        return 2LL;
      }
      if (v2 == 122) {
        return result;
      }
      if (v2 != 115) {
        return 4LL;
      }
    }
  }

  else if ((v2 - 48) >= 8)
  {
    if (v2 == 45) {
      return 3LL;
    }
    return 4LL;
  }

  if (!*a1 || a1[2] != 45 || a1[3] != 108 || a1[6] != 45) {
    return 4LL;
  }
  int v3 = a1[4];
  if (v3 != 122)
  {
    return 4LL;
  }

  if (a1[20]) {
    return 4LL;
  }
  uint64_t result = 4LL;
  return result;
}

__int32 *sub_18070CB34(uint64_t *a1, uint64_t a2)
{
  uint64_t result = wcschr(*(const __int32 **)a2, 124);
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = result + 1;
    size_t v7 = wcslen(result + 1);
    a1[1] = 0LL;
    sub_1806F7680(a1, v6, v7);
    *uint64_t v5 = 0;
    *(void *)(a2 + 8) = wcslen(*(const __int32 **)a2);
    return (__int32 *)1;
  }

  return result;
}

const __int32 *sub_18070CBA4(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = (const __int32 *)archive_entry_pathname_w(a2);
  if (v4)
  {
    uint64_t v5 = v4;
    *(void *)(a1 + 280) = 0LL;
    size_t v6 = wcslen(v4);
    sub_1806F7680((uint64_t *)(a1 + 272), v5, v6);
    size_t v7 = *(__int32 **)(a1 + 272);
    uint64_t v8 = *(void *)(a1 + 280);
    if (v8)
    {
      uint64_t v9 = *(_DWORD **)(a1 + 272);
      do
      {
        if (*v9 == 92) {
          _DWORD *v9 = 47;
        }
        ++v9;
        --v8;
      }

      while (v8);
    }

    archive_entry_copy_pathname_w((uint64_t)a2, v7);
  }

  uint64_t result = (const __int32 *)archive_entry_symlink_w((uint64_t)a2);
  if (result)
  {
    uint64_t v11 = result;
    *(void *)(a1 + 280) = 0LL;
    size_t v12 = wcslen(result);
    sub_1806F7680((uint64_t *)(a1 + 272), v11, v12);
    uint64_t v13 = *(__int32 **)(a1 + 272);
    uint64_t v14 = *(void *)(a1 + 280);
    if (v14)
    {
      uint64_t v15 = *(_DWORD **)(a1 + 272);
      do
      {
        if (*v15 == 92) {
          *uint64_t v15 = 47;
        }
        ++v15;
        --v14;
      }

      while (v14);
    }

    return (const __int32 *)archive_entry_copy_symlink_w((uint64_t)a2, v13);
  }

  return result;
}

time_t sub_18070CC98(unsigned __int8 *a1)
{
  unsigned int v1 = a1[1];
  int v2 = *a1;
  unsigned int v3 = a1[3];
  int v4 = a1[2];
  memset(&v6.tm_wday, 0, 32);
  v6.tm_mon = (((v4 | (v3 << 8)) >> 5) & 0xF) - 1;
  v6.tm_year = (v3 >> 1) + 80;
  v6.tm_hour = v1 >> 3;
  v6.uint64_t tm_mday = v4 & 0x1F;
  v6.tm_sec = 2 * (v2 & 0x1F);
  v6.tm_min = ((v2 | (v1 << 8)) >> 5) & 0x3F;
  v6.tm_isdst = -1;
  return mktime(&v6);
}

uint64_t sub_18070CD0C( _DWORD *a1, uint64_t a2, _WORD *a3, uint64_t a4, unint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  int v71 = a4;
  unint64_t v12 = a4;
  *a6 = a4;
  size_t v13 = sub_1806BB3B8((uint64_t)a1, a4, 0LL, a4, a5, (uint64_t)a6, a7, a8);
  if (v13)
  {
    uint64_t v20 = (char *)v13;
    unint64_t v21 = (v71 + 1);
    int v69 = (uint64_t *)(a2 + 224);
    do
    {
      if (v71 == 2)
      {
        size_t v22 = *(unsigned __int16 *)v20;
        if (!*(_WORD *)v20) {
          goto LABEL_102;
        }
      }

      else
      {
        size_t v22 = *(unsigned int *)v20;
        if (!*(_DWORD *)v20)
        {
LABEL_102:
          if (a3) {
            *a3 = sub_18070D358((unsigned __int16)*a3, v20, v12);
          }
          sub_1806BB660((uint64_t)a1, v12, v14, v15, v16, v17, v18, v19);
          return 0LL;
        }
      }

      BOOL v23 = v22 <= v12 || *a6 + v22 > a5;
      if (v23) {
        goto LABEL_99;
      }
      unint64_t v24 = (char *)sub_1806BB3B8((uint64_t)a1, v22, 0LL, v15, v16, v17, v18, v19);
      if (!v24) {
        break;
      }
      uint64_t v25 = v24;
      *a6 += v22;
      int v26 = v24[v12];
      if (a3 && v24[v12]) {
        *a3 = sub_18070D358((unsigned __int16)*a3, v24, v22);
      }
      size_t v27 = v22 - v21;
      int v28 = &v25[v21];
      if (v26 <= 63)
      {
        if (v26)
        {
          if (v26 == 1)
          {
            if (v22 == v21)
            {
LABEL_77:
              *(void *)(a2 + 256) = 0LL;
            }

            else
            {
              if (!*v28) {
                goto LABEL_99;
              }
              *(void *)(a2 + 256) = 0LL;
              int v42 = (uint64_t *)(a2 + 248);
LABEL_83:
              sub_1806F7634(v42, &v25[v21], v27);
            }
          }

          else if (v26 == 2)
          {
            if (v22 == v21 || !*v28) {
              goto LABEL_99;
            }
            *(void *)(a2 + 232) = 0LL;
            sub_1806F7634(v69, &v25[v21], v27);
            unint64_t v29 = *(void *)(a2 + 232);
            if (v29)
            {
              uint64_t v30 = 0LL;
              unsigned int v31 = 1;
              uint64_t v32 = (void *)(a2 + 224);
              do
              {
                if (*(unsigned __int8 *)(*v69 + v30) == 255)
                {
                  *(_BYTE *)(*v69 + v30) = 47;
                  unint64_t v29 = *(void *)(a2 + 232);
                }

                uint64_t v30 = v31;
                BOOL v23 = v29 > v31++;
              }

              while (v23);
            }

            else
            {
              uint64_t v32 = (void *)(a2 + 224);
            }

            int v49 = *(unsigned __int8 *)(v29 + *v32 - 1);
LABEL_86:
            if (v49 != 47)
            {
LABEL_99:
              int v66 = "Invalid extended LHa header";
              goto LABEL_100;
            }
          }
        }

        else
        {
          unint64_t v50 = v27 - 2;
          if (v27 >= 2)
          {
            *(_WORD *)(a2 + 192) = *(_WORD *)v28;
            if (a3)
            {
              uint64_t v51 = sub_18070D358((unsigned __int16)*a3, v25, v21);
              *a3 = v51;
              uint64_t v52 = sub_18070D358(v51, &algn_18072097B, 2uLL);
              *a3 = v52;
              *a3 = sub_18070D358(v52, v28 + 2, v50);
            }
          }
        }
      }

      else
      {
        switch(v26)
        {
          case '@':
            if (v27 == 2) {
              *(_BYTE *)(a2 + 296) = *v28;
            }
            break;
          case 'A':
            if (v27 != 24) {
              break;
            }
            uint64_t v35 = *(void *)v28;
            if (*(void *)v28 <= 0x19DB1DED53E7FFFuLL)
            {
              uint64_t v38 = 0LL;
              unint64_t v37 = 0LL;
            }

            else
            {
              uint64_t v36 = v35 - 116444736000000000LL;
              unint64_t v37 = (v35 - 116444736000000000LL) / 0x989680uLL;
              uint64_t v38 = 100 * (v36 - 10000000 * v37);
            }

            *(void *)(a2 + 72) = v37;
            *(void *)(a2 + 80) = v38;
            unint64_t v53 = *((void *)v28 + 1);
            if (v53 <= 0x19DB1DED53E7FFFLL)
            {
              uint64_t v56 = 0LL;
              unint64_t v55 = 0LL;
            }

            else
            {
              unint64_t v54 = v53 - 116444736000000000LL;
              unint64_t v55 = (v53 - 116444736000000000LL) / 0x989680;
              uint64_t v56 = 100 * (v54 - 10000000 * v55);
            }

            *(void *)(a2 + 88) = v55;
            *(void *)(a2 + 96) = v56;
            unint64_t v57 = *((void *)v28 + 2);
            if (v57 <= 0x19DB1DED53E7FFFLL)
            {
              uint64_t v60 = 0LL;
              unint64_t v59 = 0LL;
            }

            else
            {
              unint64_t v58 = v57 - 116444736000000000LL;
              unint64_t v59 = (v57 - 116444736000000000LL) / 0x989680;
              uint64_t v60 = 100 * (v58 - 10000000 * v59);
            }

            *(void *)(a2 + 104) = v59;
            *(void *)(a2 + 112) = v60;
            int v41 = *(_DWORD *)(a2 + 64) | 3;
            goto LABEL_96;
          case 'B':
            if (v27 == 16)
            {
              *(void *)(a2 + 48) = *(void *)v28;
              *(void *)(a2 + 56) = *((void *)v28 + 1);
            }

            break;
          case 'C':
          case 'G':
          case 'H':
          case 'I':
          case 'J':
          case 'K':
          case 'L':
          case 'M':
          case 'N':
          case 'O':
            break;
          case 'D':
            if (v22 == v21) {
              goto LABEL_77;
            }
            if ((v27 & 1) != 0 || !*v28) {
              goto LABEL_99;
            }
            *(void *)(a2 + 256) = 0LL;
            sub_1806F740C(a2 + 248, &v25[v21]);
            int v43 = sub_1806F7E1C((uint64_t)a1, "UTF-16LE", 1);
            *(void *)(a2 + 208) = v43;
            if (!v43) {
              return 4294967266LL;
            }
            break;
          case 'E':
            if (v22 == v21 || (v27 & 1) != 0 || !*v28) {
              goto LABEL_99;
            }
            *(void *)(a2 + 232) = 0LL;
            sub_1806F740C(v69, &v25[v21]);
            int v44 = sub_1806F7E1C((uint64_t)a1, "UTF-16LE", 1);
            *(void *)(a2 + 200) = v44;
            if (!v44) {
              return 4294967266LL;
            }
            uint64_t v45 = *(void *)(a2 + 224);
            unint64_t v46 = *(void *)(a2 + 232);
            unint64_t v47 = v46 >> 1;
            if (v46 >= 2)
            {
              uint64_t v48 = 0LL;
              do
              {
                ++v48;
              }

              while (v47 > v48);
            }

            int v49 = *(unsigned __int16 *)(v45 + 2 * v47 - 2);
            goto LABEL_86;
          case 'F':
            if (v27 == 4)
            {
              memset(v72, 0, sizeof(v72));
              int v39 = (char *)*(unsigned int *)v28;
              uint64_t v40 = "UTF-8";
              if ((_DWORD)v39 != 65001)
              {
                sub_1806FBA84(v72, "CP%d", 4LL, v15, v16, v17, v18, v19, v39);
                uint64_t v40 = (char *)v72[0];
              }

              *(void *)(a2 + 200) = sub_1806F7E1C((uint64_t)a1, v40, 1);
              *(void *)(a2 + 208) = sub_1806F7E1C((uint64_t)a1, v40, 1);
              sub_1806F755C((uint64_t)v72);
              if (!*(void *)(a2 + 200) || !*(void *)(a2 + 208)) {
                return 4294967266LL;
              }
            }

            break;
          case 'P':
            if (v27 != 2) {
              break;
            }
            *(_WORD *)(a2 + 120) = *(_WORD *)v28;
            int v41 = *(_DWORD *)(a2 + 64) | 4;
            goto LABEL_96;
          case 'Q':
            if (v27 == 4)
            {
              *(void *)(a2 + 136) = *(unsigned __int16 *)v28;
              *(void *)(a2 + 128) = *((unsigned __int16 *)v28 + 1);
            }

            break;
          case 'R':
            if (v22 == v21) {
              break;
            }
            *(void *)(a2 + 176) = 0LL;
            int v42 = (uint64_t *)(a2 + 168);
            goto LABEL_83;
          case 'S':
            if (v22 == v21) {
              break;
            }
            *(void *)(a2 + 152) = 0LL;
            int v42 = (uint64_t *)(a2 + 144);
            goto LABEL_83;
          case 'T':
            if (v27 == 4) {
              *(void *)(a2 + 88) = *(unsigned int *)v28;
            }
            break;
          default:
            if (v26 == 127)
            {
              if (v27 != 16) {
                break;
              }
              *(_BYTE *)(a2 + 296) = *v28;
              *(_WORD *)(a2 + 120) = *((_WORD *)v28 + 1);
              *(void *)(a2 + 136) = *((unsigned __int16 *)v28 + 2);
              *(void *)(a2 + 128) = *((unsigned __int16 *)v28 + 3);
              *(void *)(a2 + 72) = *((unsigned int *)v28 + 2);
              uint64_t v34 = *((unsigned int *)v28 + 3);
            }

            else
            {
              if (v26 != 255 || v27 != 20) {
                break;
              }
              *(_WORD *)(a2 + 120) = *(_DWORD *)v28;
              *(void *)(a2 + 136) = *((unsigned int *)v28 + 1);
              *(void *)(a2 + 128) = *((unsigned int *)v28 + 2);
              *(void *)(a2 + 72) = *((unsigned int *)v28 + 3);
              uint64_t v34 = *((unsigned int *)v28 + 4);
            }

            *(void *)(a2 + 104) = v34;
            int v41 = *(_DWORD *)(a2 + 64) | 7;
LABEL_96:
            *(_DWORD *)(a2 + 64) = v41;
            break;
        }
      }

      sub_1806BB660((uint64_t)a1, v22, v27, v15, v16, v17, v18, v19);
      uint64_t v20 = (char *)sub_1806BB3B8((uint64_t)a1, v12, 0LL, v61, v62, v63, v64, v65);
    }

    while (v20);
  }

  int v66 = "Truncated LHa header";
LABEL_100:
  archive_set_error(a1, 79, v66, v15, v16, v17, v18, v19, v68);
  return 4294967266LL;
}

uint64_t sub_18070D358(uint64_t result, char *a2, unint64_t a3)
{
  if (a3)
  {
    if ((a2 & 1) != 0)
    {
      char v3 = *a2++;
      LODWORD(result) = word_18C533A9A[(v3 ^ result)] ^ (result >> 8);
      --a3;
    }

    if (a3 >= 8)
    {
      do
      {
        unsigned int v5 = word_18C533A9A[(word_18C533A9A[(word_18C533A9A[(*(unsigned __int16 *)a2 ^ (unsigned __int16)result) >> 8] ^ word_18C533A9A[(*(_WORD *)a2 ^ result) + 256] ^ *((unsigned __int16 *)a2 + 1)) >> 8] ^ word_18C533A9A[(word_18C533A9A[(*(unsigned __int16 *)a2 ^ (unsigned __int16)result) >> 8] ^ word_18C533A9A[(*(_WORD *)a2 ^ result) + 256] ^ *((_WORD *)a2 + 1)) + 256] ^ *((unsigned __int16 *)a2 + 2)) >> 8] ^ v4 ^ *((unsigned __int16 *)a2 + 3);
        a2 += 8;
        LOWORD(result) = word_18C533A9A[v5 >> 8] ^ word_18C533A9A[v5 + 256];
        a3 -= 8LL;
      }

      while (a3 > 7);
    }

    for (; a3; --a3)
    {
      char v6 = *a2++;
      LODWORD(result) = word_18C533A9A[(v6 ^ result)] ^ ((unsigned __int16)(result & 0xFF00) >> 8);
    }
  }

  return (unsigned __int16)result;
}

uint64_t sub_18070D44C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = **(void **)(a1 + 2472);
  if (*(_BYTE *)(v8 + 301)) {
    return 1LL;
  }
  uint64_t v9 = 1LL;
  if ((*(_BYTE *)(v8 + 64) & 8) != 0)
  {
    if (*(unsigned __int16 *)(v8 + 194) == *(unsigned __int16 *)(v8 + 24))
    {
      uint64_t v9 = 1LL;
    }

    else
    {
      archive_set_error((_DWORD *)a1, -1, "LHa data CRC error", a4, a5, a6, a7, a8, v11);
      uint64_t v9 = 4294967276LL;
    }
  }

  *(_BYTE *)(v8 + 301) = 1;
  return v9;
}

uint64_t sub_18070D4C0(uint64_t a1, size_t __size)
{
  int v2 = __size;
  if (!*(void *)(a1 + 80))
  {
    int v4 = malloc(__size);
    *(void *)(a1 + 80) = v4;
    if (!v4) {
      return 4294967266LL;
    }
  }

  if (!*(void *)(a1 + 112))
  {
    unsigned int v5 = malloc(0x800uLL);
    *(void *)(a1 + 112) = v5;
    if (!v5) {
      return 4294967266LL;
    }
  }

  if (!*(void *)(a1 + 120))
  {
    *(_DWORD *)(a1 + 104) = 1024;
    char v6 = malloc(0x1000uLL);
    *(void *)(a1 + 120) = v6;
    if (!v6) {
      return 4294967266LL;
    }
  }

  uint64_t result = 0LL;
  *(_DWORD *)a1 = v2;
  *(_DWORD *)(a1 + 96) = 16;
  return result;
}

uint64_t sub_18070D548(_DWORD *a1, unint64_t *a2)
{
  int v2 = *((_DWORD *)a2 + 2);
  int v3 = a1[2];
  int v4 = -v2;
  int v5 = v2 + 8;
  while (v3 < (v4 + 64) >> 3)
  {
LABEL_4:
    if (!v3) {
      return 0LL;
    }
    unint64_t v7 = *a2;
    uint64_t v8 = (unsigned __int8 *)(*(void *)a1)++;
    *a2 = *v8 | (v7 << 8);
    a1[2] = --v3;
    *((_DWORD *)a2 + 2) = v5;
    v4 -= 8;
    v5 += 8;
  }

  uint64_t v6 = 1LL;
  switch((v4 + 64) >> 3)
  {
    case 0:
      return v6;
    case 6:
      uint64_t v9 = *(void *)a1;
      *a2 = (*a2 << 48) | ((unint64_t)**(unsigned __int8 **)a1 << 40) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 1LL) << 32) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 2LL) << 24) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 3LL) << 16) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 4LL) << 8) | *(unsigned __int8 *)(*(void *)a1 + 5LL);
      uint64_t v10 = v9 + 6;
      int v11 = 48;
      int v12 = -6;
      goto LABEL_10;
    case 7:
      uint64_t v13 = *(void *)a1;
      *a2 = (*a2 << 56) | ((unint64_t)**(unsigned __int8 **)a1 << 48) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 1LL) << 40) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 2LL) << 32) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 3LL) << 24) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 4LL) << 16) | ((unint64_t)*(unsigned __int8 *)(*(void *)a1 + 5LL) << 8) | *(unsigned __int8 *)(*(void *)a1 + 6LL);
      uint64_t v10 = v13 + 7;
      int v11 = 56;
      int v12 = -7;
      goto LABEL_10;
    case 8:
      uint64_t v10 = *(void *)a1 + 8LL;
      *a2 = bswap64(**(void **)a1);
      int v11 = 64;
      int v12 = -8;
LABEL_10:
      *(void *)a1 = v10;
      a1[2] = v12 + v3;
      *((_DWORD *)a2 + 2) = v11 - v4;
      uint64_t v6 = 1LL;
      break;
    default:
      goto LABEL_4;
  }

  return v6;
}

uint64_t sub_18070D6AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  if ((int)a2 < (int)a3)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    unint64_t v7 = (void *)(v6 + 40);
    uint64_t v3 = (int)a2;
    while (1)
    {
      int v8 = *(_DWORD *)(v6 + 48);
      if (v8 <= 2)
      {
        int v9 = sub_18070D548((_DWORD *)a1, (unint64_t *)(v6 + 40));
        int v8 = *(_DWORD *)(v6 + 48);
        if (!v9 && v8 < 3) {
          break;
        }
      }

      int v10 = v8 - 3;
      uint64_t v11 = (*v7 >> (v8 - 3)) & 7LL;
      if ((_DWORD)v11 == 7)
      {
        if (v8 <= 12)
        {
          int v12 = sub_18070D548((_DWORD *)a1, (unint64_t *)(v6 + 40));
          int v8 = *(_DWORD *)(v6 + 48);
          if (!v12 && v8 < 13) {
            return v3;
          }
        }

        uint64_t v11 = (*v7 >> (v8 - 13)) & 0x3FFLL;
        if (v11 == 1023) {
          return 0xFFFFFFFFLL;
        }
        LODWORD(v11) = asc_180729E0D[v11];
        int v10 = v8 - v11 + 3;
      }

      *(_DWORD *)(v6 + 48) = v10;
      *(_BYTE *)(*(void *)(v6 + 264) + v3) = v11;
      ++*(_DWORD *)(v6 + 4LL * (int)v11 + 196);
      if ((_DWORD)a3 == (_DWORD)++v3) {
        return a3;
      }
    }
  }

  return v3;
}

uint64_t sub_18070D7C0(uint64_t a1)
{
  uint64_t v2 = 0LL;
  int v3 = 0;
  int v4 = 0;
  uint64_t v44 = *MEMORY[0x1895F89C0];
  unsigned int v5 = 0x8000;
  do
  {
    v43[v2] = v4;
    v42[v2] = v5;
    int v6 = *(_DWORD *)(a1 + 16 + 4 * v2);
    v4 += v6 * v5;
    ++v2;
    if (v6) {
      int v3 = v2;
    }
    v5 >>= 1;
  }

  while (v2 != 16);
  if (v4 != 0x10000 || v3 > *(_DWORD *)(a1 + 96)) {
    return 0LL;
  }
  *(_DWORD *)(a1 + 88) = v3;
  if (v3 > 15) {
    goto LABEL_14;
  }
  if (v3 < 1) {
    goto LABEL_18;
  }
  char v8 = 16 - v3;
  int v9 = v42;
  int v10 = v43;
  uint64_t v11 = (v3 + 1) - 1LL;
  do
  {
    *v10++ >>= v8;
    *v9++ >>= v8;
    --v11;
  }

  while (v11);
  if (v3 <= 10)
  {
LABEL_18:
    int v12 = 0;
    uint64_t v15 = *(void *)(a1 + 112);
  }

  else
  {
LABEL_14:
    int v12 = v3 - 10;
    for (uint64_t i = 1LL; i != 11; ++i)
    {
      v42[i + 16] = (int)v42[i + 16] >> v12;
      *(int *)&v41[i * 4] >>= v12;
    }

    unsigned int v14 = v43[9] + *(_DWORD *)(a1 + 52) * v42[9];
    uint64_t v15 = *(void *)(a1 + 112);
    if (v14 <= 0x3FF) {
      bzero((void *)(v15 + 2LL * v14), 2048 - 2LL * v14);
    }
  }

  *(_DWORD *)(a1 + 92) = v12;
  uint64_t v16 = *(void *)(a1 + 80);
  uint64_t v17 = *(unsigned int *)(a1 + 4);
  *(_DWORD *)(a1 + 100) = 0;
  uint64_t result = 1LL;
  if ((int)v17 >= 1)
  {
    uint64_t v18 = 0LL;
    while (1)
    {
      uint64_t v19 = *(unsigned __int8 *)(v16 + v18);
      if (*(_BYTE *)(v16 + v18))
      {
        uint64_t v20 = (int)v42[v19 + 16];
        int v21 = *(_DWORD *)&v41[4 * v19];
        v42[v19 + 16] = v21 + v20;
        int v22 = v19 - 10;
        if (v19 > 0xA)
        {
          int v29 = *(unsigned __int16 *)(v15 + 2LL * ((int)v20 >> v12));
          if (*(_WORD *)(v15 + 2LL * ((int)v20 >> v12)))
          {
            int v30 = *(_DWORD *)(a1 + 100);
            uint64_t v31 = *(void *)(a1 + 120);
            uint64_t v32 = (unsigned __int16 *)(v31 + 4LL * (v29 - (int)v17));
          }

          else
          {
            uint64_t v38 = *(int *)(a1 + 100);
            *(_WORD *)(v15 + 2LL * ((int)v20 >> v12)) = v38 + v17;
            uint64_t v31 = *(void *)(a1 + 120);
            int v30 = v38 + 1;
            *(_DWORD *)(a1 + 100) = v38 + 1;
            uint64_t v32 = (unsigned __int16 *)(v31 + 4 * v38);
            *(_DWORD *)uint64_t v32 = 0;
          }

          if (v19 < 0xC)
          {
            int v39 = 1 << (v12 - 1);
LABEL_54:
            if (((unsigned __int16)v20 & (unsigned __int16)v39) != 0)
            {
              if (*v32) {
                return 0LL;
              }
              unsigned __int16 *v32 = v18;
            }

            else
            {
              if (v32[1]) {
                return 0LL;
              }
              v32[1] = v18;
            }

            goto LABEL_64;
          }

          int v39 = 1 << (v12 - 1);
          while (2)
          {
            if (((unsigned __int16)v39 & (unsigned __int16)v20) != 0)
            {
              int v40 = *v32;
              if (v40 < (int)v17)
              {
                unsigned __int16 *v32 = v30 + v17;
                goto LABEL_48;
              }

void sub_18070DBA8(void **a1)
{
}

uint64_t archive_write_set_format_shar( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 1, "archive_write_set_format_shar", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    int v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10) {
      v10(a1);
    }
    uint64_t v11 = calloc(1uLL, 0x90uLL);
    if (v11)
    {
      uint64_t v17 = v11;
      uint64_t result = 0LL;
      v17[7] = 0u;
      v17[8] = 0u;
      v17[6] = 0u;
      *(void *)(a1 + 328) = sub_18070E178;
      *(void *)(a1 + 312) = sub_18070E1CC;
      *(void *)(a1 + 320) = sub_18070E118;
      *(void *)(a1 + 296) = sub_18070E328;
      *(void *)(a1 + 304) = sub_18070DCB4;
      *(_DWORD *)(a1 + 16) = 131073;
      *(void *)(a1 + 264) = v17;
      *(void *)(a1 + 272) = "shar";
      *(void *)(a1 + 24) = "shar";
    }

    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate shar data", v12, v13, v14, v15, v16, v18);
      return 4294967266LL;
    }
  }

  return result;
}

uint64_t sub_18070DCB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(a1 + 264);
  if (!*(_DWORD *)(v4 + 88))
  {
    sub_1806F76CC((uint64_t *)(v4 + 96), "#!/bin/sh\n");
    sub_1806F76CC((uint64_t *)(v4 + 96), "# This is a shell archive\n");
    *(_DWORD *)(v4 + 88) = 1;
  }

  archive_entry_free(*(void ***)(v4 + 8));
  *(void *)(v4 + 8) = archive_entry_clone(a2);
  unsigned int v5 = (char *)archive_entry_pathname(a2);
  HIDWORD(v6) = archive_entry_filetype((uint64_t)a2);
  LODWORD(v6) = HIDWORD(v6) - 4096;
  switch((v6 >> 12))
  {
    case 0u:
    case 1u:
    case 5u:
      archive_entry_set_size((uint64_t)a2, 0LL);
      goto LABEL_5;
    case 3u:
      archive_entry_set_size((uint64_t)a2, 0LL);
      uint64_t result = strcmp(v5, ".");
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t result = strcmp(v5, "./");
      if (!(_DWORD)result) {
        return result;
      }
      goto LABEL_5;
    case 7u:
      goto LABEL_5;
    default:
      archive_entry_set_size((uint64_t)a2, 0LL);
      if (!archive_entry_hardlink((uint64_t)a2) && !archive_entry_symlink((uint64_t)a2))
      {
        sub_1807010BC((_DWORD *)a1, a2);
        return 4294967276LL;
      }

uint64_t sub_18070E118(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 264);
  if (*(_DWORD *)(v1 + 88))
  {
    sub_1806F76CC((uint64_t *)(v1 + 96), "exit\n");
    archive_write_set_bytes_in_last_block((int *)a1, 1, v3, v4, v5, v6, v7, v8);
  }

  return 0LL;
}

uint64_t sub_18070E178(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 264);
  if (v1)
  {
    archive_entry_free(*(void ***)(v1 + 8));
    free(*(void **)(v1 + 24));
    sub_1806F755C(v1 + 96);
    sub_1806F755C(v1 + 120);
    free((void *)v1);
    *(void *)(a1 + 264) = 0LL;
  }

  return 0LL;
}

uint64_t sub_18070E1CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0LL;
  if (!a3) {
    return result;
  }
  uint64_t v5 = *(void *)(a1 + 264);
  if (!*(_DWORD *)(v5 + 16)) {
    return result;
  }
  if (!sub_1806F7590((void **)(v5 + 96), 0x10000uLL))
  {
    archive_set_error((_DWORD *)a1, 12, "Out of memory", v8, v9, v10, v11, v12, v21);
    return -30LL;
  }

  unint64_t v13 = *(void *)(v5 + 104);
  if (v13 < 0xFFFE) {
    goto LABEL_7;
  }
  unint64_t v13 = 0LL;
  *(void *)(v5 + 104) = 0LL;
LABEL_7:
  uint64_t v14 = *(void *)(v5 + 96);
  uint64_t v15 = (_BYTE *)(v14 + v13);
  if (*(_DWORD *)(v5 + 4))
  {
    *v15++ = 88;
    *(_DWORD *)(v5 + 4) = 0;
  }

  uint64_t v16 = 0LL;
  unint64_t v17 = v14 + 65533;
  do
  {
    int v18 = *(unsigned __int8 *)(a2 + v16);
    *uint64_t v15 = v18;
    uint64_t v19 = v15 + 1;
    if (v18 == 10)
    {
      if (a3 - 1 == v16)
      {
        *(_DWORD *)(v5 + 4) = 1;
      }

      else
      {
        uint64_t v19 = v15 + 2;
        v15[1] = 88;
      }
    }

    if ((unint64_t)v19 >= v17)
    {
      uint64_t v20 = *(void *)(v5 + 96);
      *(void *)(v5 + 104) = &v19[-v20];
      *(void *)(v5 + 104) = 0LL;
      uint64_t v15 = *(_BYTE **)(v5 + 96);
    }

    else
    {
      uint64_t v15 = v19;
    }

    ++v16;
  }

  while (a3 != v16);
  *(void *)(v5 + 104) = &v15[-*(void *)(v5 + 96)];
  return a3;
}

uint64_t sub_18070E328(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 264);
  uint64_t result = *(void *)(v2 + 8);
  if (!result) {
    return result;
  }
  int v4 = *(_DWORD *)(v2 + 16);
  if (*(_DWORD *)v2)
  {
    if (v4)
    {
      unint64_t v5 = *(void *)(v2 + 80);
      sub_1806F76CC((uint64_t *)(v2 + 96), "SHAR_END\n");
      uint64_t result = *(void *)(v2 + 8);
    }

    __int16 v6 = archive_entry_mode(result);
    sub_1806FBA84((void **)(v2 + 96), "chmod %o ", v7, v8, v9, v10, v11, v12, (char *)(v6 & 0xFFF));
    unint64_t v13 = (char *)archive_entry_pathname(*(uint64_t **)(v2 + 8));
    sub_18070E6C8((uint64_t *)(v2 + 96), v13, 1);
    sub_1806F76CC((uint64_t *)(v2 + 96), "\n");
    uint64_t v14 = archive_entry_uname(*(uint64_t **)(v2 + 8));
    uint64_t v15 = archive_entry_gname(*(uint64_t **)(v2 + 8));
    if (v14 | v15)
    {
      uint64_t v16 = (char *)v15;
      sub_1806F76CC((uint64_t *)(v2 + 96), "chown ");
      if (v14) {
        sub_18070E6C8((uint64_t *)(v2 + 96), (char *)v14, 1);
      }
      if (v16)
      {
        sub_1806F76CC((uint64_t *)(v2 + 96), ":");
        sub_18070E6C8((uint64_t *)(v2 + 96), v16, 1);
      }

      sub_1806F76CC((uint64_t *)(v2 + 96), " ");
      unint64_t v17 = (char *)archive_entry_pathname(*(uint64_t **)(v2 + 8));
      sub_18070E6C8((uint64_t *)(v2 + 96), v17, 1);
      sub_1806F76CC((uint64_t *)(v2 + 96), "\n");
    }

    int v18 = archive_entry_fflags_text(*(uint64_t **)(v2 + 8));
    if (!v18) {
      goto LABEL_20;
    }
    sub_1806FBA84((void **)(v2 + 96), "chflags %s ", v19, v20, v21, v22, v23, v24, v18);
    uint64_t v25 = (char *)archive_entry_pathname(*(uint64_t **)(v2 + 8));
    sub_18070E6C8((uint64_t *)(v2 + 96), v25, 1);
    uint64_t v26 = "\n";
    uint64_t v27 = (uint64_t *)(v2 + 96);
    goto LABEL_19;
  }

  if (v4)
  {
    if (!*(_DWORD *)(v2 + 4)) {
      sub_1806F76DC((uint64_t *)(v2 + 96), 10);
    }
    uint64_t v27 = (uint64_t *)(v2 + 96);
    uint64_t v26 = "SHAR_END\n";
LABEL_19:
    sub_1806F76CC(v27, v26);
  }

uint64_t archive_write_set_format_shar_dump( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  **(_DWORD **)(a1 + 264) = 1;
  *(void *)(a1 + 312) = sub_18070E5A0;
  *(_DWORD *)(a1 + 16) = 131074;
  *(void *)(a1 + 24) = "shar dump";
  return 0LL;
}

size_t sub_18070E5A0(uint64_t a1, unsigned __int8 *__src, size_t __n)
{
  uint64_t v3 = *(void *)(a1 + 264);
  if (!*(_DWORD *)(v3 + 16)) {
    return 0LL;
  }
  size_t v4 = __n;
  unint64_t v5 = __src;
  uint64_t v7 = *(void *)(v3 + 80);
  if (!v7)
  {
    size_t v9 = __n;
LABEL_12:
    if (v9 >= 0x2D)
    {
      while (!sub_18070E784((_DWORD *)a1, v3, v5, 0x2DuLL))
      {
        unint64_t v10 = *(void *)(v3 + 104);
        if (v10 >= 0x10000)
        {
          *(void *)(v3 + 104) = 0LL;
        }

        v5 += 45;
        v9 -= 45LL;
        if (v9 <= 0x2C) {
          goto LABEL_18;
        }
      }

      return -30LL;
    }

uint64_t *sub_18070E6C8(uint64_t *result, char *__s, int a3)
{
  int v3 = *__s;
  if (*__s)
  {
    size_t v4 = __s;
    unint64_t v5 = result;
    if (a3) {
      __int16 v6 = "\n";
    }
    else {
      __int16 v6 = "\\n";
    }
    do
    {
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t result = sub_1806F7634(v5, v4, v7);
      }

      else
      {
        if (v3 == 10)
        {
          uint64_t result = sub_1806F76CC(v5, v6);
        }

        else
        {
          sub_1806F76DC(v5, 92);
          uint64_t result = sub_1806F76DC(v5, *v4);
        }

        uint64_t v8 = 1LL;
      }

      v4 += v8;
      int v3 = *v4;
    }

    while (*v4);
  }

  return result;
}

uint64_t sub_18070E784(_DWORD *a1, uint64_t a2, unsigned __int8 *a3, unint64_t a4)
{
  if (!sub_1806F7590((void **)(a2 + 96), *(void *)(a2 + 104) + 62LL))
  {
    uint64_t v16 = "Out of memory";
    unint64_t v17 = a1;
    int v18 = 12;
LABEL_12:
    archive_set_error(v17, v18, v16, v8, v9, v10, v11, v12, v21);
    return 4294967266LL;
  }

  unint64_t v13 = (_BYTE *)(*(void *)(a2 + 96) + *(void *)(a2 + 104));
  *unint64_t v13 = (a4 & 0x3F) + 32;
  uint64_t v14 = v13 + 1;
  if (a4 >= 3)
  {
    do
    {
      sub_18070E8A4(a3, v14);
      a4 -= 3LL;
      a3 += 3;
      v14 += 4;
    }

    while (a4 > 2);
  }

  if (a4)
  {
    v22[0] = *a3;
    if (a4 == 1) {
      unsigned __int8 v15 = 0;
    }
    else {
      unsigned __int8 v15 = a3[1];
    }
    v22[1] = v15;
    v22[2] = 0;
    sub_18070E8A4(v22, v14);
    v14 += 4;
  }

  *uint64_t v14 = 10;
  uint64_t v19 = (uint64_t)&v14[-*(void *)(a2 + 96) + 1];
  if (v19 > *(void *)(a2 + 104) + 62LL)
  {
    uint64_t v16 = "Buffer overflow";
    unint64_t v17 = a1;
    int v18 = -1;
    goto LABEL_12;
  }

  uint64_t result = 0LL;
  *(void *)(a2 + 104) = v19;
  return result;
}

unsigned __int8 *sub_18070E8A4(unsigned __int8 *result, _BYTE *a2)
{
  unsigned int v2 = *result;
  unsigned __int8 v3 = result[2];
  unsigned int v4 = v3 | (result[1] << 8);
  unsigned int v5 = (v2 << 16) | (result[1] << 8);
  int v6 = (v2 >> 2) + 32;
  if (v2 < 4) {
    LOBYTE(v6) = 96;
  }
  *a2 = v6;
  int v8 = (v5 >> 12) & 0x3F;
  BOOL v7 = v8 == 0;
  char v9 = v8 + 32;
  if (v7) {
    char v9 = 96;
  }
  a2[1] = v9;
  int v10 = ((v4 >> 6) & 0x3F) + 32;
  if (((v4 >> 6) & 0x3F) == 0) {
    LOBYTE(v10) = 96;
  }
  a2[2] = v10;
  if ((v3 & 0x3F) != 0) {
    char v11 = (v3 & 0x3F) + 32;
  }
  else {
    char v11 = 96;
  }
  a2[3] = v11;
  return result;
}

void archive_read_support_filter_gzip(int *a1)
{
  if (sub_180700FBC("gzip"))
  {
    if (sub_1806A93F4(a1, 14594245, 1, "archive_read_support_filter_gzip", v3, v4, v5, v6) != -30)
    {
      sub_1806BB35C(a1, &v16, v7, v8, v9, v10, v11, v12);
      if (!v13)
      {
        *uint64_t v16 = 0LL;
        uint64_t v14 = v16;
        v16[1] = "gzip";
        v14[2] = sub_18070E9C4;
        v14[4] = 0LL;
        v14[5] = 0LL;
        v14[3] = sub_18070E9F8;
      }
    }
  }

  else
  {
    archive_set_error(a1, -1, "Format not allow-listed in entitlements", v2, v3, v4, v5, v6, v15);
  }

uint64_t sub_18070E9C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (sub_18070EAAC(a2, &v9, 0LL, a4, a5, a6, a7, a8)) {
    return v9;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_18070E9F8(uint64_t a1)
{
  *(_DWORD *)(a1 + 104) = 1;
  *(void *)(a1 + 96) = "gzip";
  uint64_t v2 = calloc(0xB0uLL, 1uLL);
  uint64_t v3 = malloc(0x10000uLL);
  uint64_t v4 = v3;
  if (v2 && v3)
  {
    uint64_t result = 0LL;
    v2[15] = v4;
    v2[16] = 0x10000LL;
    *(void *)(a1 + 40) = sub_18070EC3C;
    *(void *)(a1 + 48) = 0LL;
    *(void *)(a1 + 64) = sub_18070EEAC;
    *(void *)(a1 + 80) = sub_18070EF1C;
    *(void *)(a1 + 88) = v2;
    *((_BYTE *)v2 + 112) = 0;
  }

  else
  {
    free(v3);
    free(v2);
    archive_set_error(*(_DWORD **)(a1 + 24), 12, "Can't allocate data for gzip decompression", v6, v7, v8, v9, v10, v11);
    return 4294967266LL;
  }

  return result;
}

size_t sub_18070EAAC( uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = (unsigned __int16 *)sub_1806BB3C0(a1, 0xAuLL, &v28, a4, a5, a6, a7, a8);
  size_t v17 = 0LL;
  if (!v11 || !v28) {
    return v17;
  }
  size_t v18 = (size_t)v11;
  if (*v11 != 35615 || *((_BYTE *)v11 + 2) != 8) {
    return 0LL;
  }
  unsigned int v20 = *((unsigned __int8 *)v11 + 3);
  if (v20 > 0x1F) {
    return 0LL;
  }
  if (a3) {
    *(_DWORD *)(a3 + 152) = *((_DWORD *)v11 + 1);
  }
  if ((v20 & 4) == 0)
  {
    uint64_t v21 = 10LL;
    if ((v20 & 8) == 0) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v24 = v21;
    while (1)
    {
      int64_t v22 = v24 + 1;
      if (v28 <= v24)
      {
        size_t v18 = sub_1806BB3C0(a1, v24 + 1, &v28, v12, v13, v14, v15, v16);
        if (!v18) {
          return 0LL;
        }
      }

      if (!*(unsigned __int8 *)(v18 + v24++))
      {
        if (a3)
        {
          free(*(void **)(a3 + 160));
          *(void *)(a3 + 160) = strdup((const char *)(v18 + v21));
        }

        goto LABEL_22;
      }
    }
  }

  size_t v23 = sub_1806BB3C0(a1, 0xCuLL, &v28, v12, v13, v14, v15, v16);
  if (!v23) {
    return 0LL;
  }
  size_t v18 = v23;
  uint64_t v21 = *(unsigned __int16 *)(v23 + 10) + 12LL;
  if ((v20 & 8) != 0) {
    goto LABEL_16;
  }
LABEL_13:
  int64_t v22 = v21;
LABEL_22:
  if ((v20 & 0x10) != 0)
  {
    while (1)
    {
      size_t v17 = v22 + 1;
      if (v28 <= v22)
      {
        size_t v18 = sub_1806BB3C0(a1, v22 + 1, &v28, v12, v13, v14, v15, v16);
        if (!v18) {
          return 0LL;
        }
      }
    }
  }

  size_t v17 = v22;
LABEL_27:
  if ((v20 & 2) != 0)
  {
    v17 += 2LL;
    if (!sub_1806BB3C0(a1, v17, &v28, v12, v13, v14, v15, v16)) {
      return 0LL;
    }
  }

  if (a2) {
    *a2 = 27;
  }
  return v17;
}

uint64_t sub_18070EC3C( uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1[11];
  *(void *)(v9 + 24) = *(void *)(v9 + 120);
  int v10 = *(_DWORD *)(v9 + 128);
  *(_DWORD *)(v9 + 32) = v10;
  while (*(_DWORD *)(v9 + 32))
  {
    if (*(_BYTE *)(v9 + 168)) {
      break;
    }
    if (!*(_BYTE *)(v9 + 112))
    {
      uint64_t v12 = a1[11];
      size_t v13 = sub_18070EAAC(a1[2], 0LL, v12, a4, a5, a6, a7, a8);
      if (!v13)
      {
        *(_BYTE *)(v9 + 168) = 1;
        break;
      }

      sub_1806BB668(a1[2], v13, v14, v15, v16, v17, v18, v19);
      *(void *)(v12 + 144) = crc32(0LL, 0LL, 0);
      *(void *)uint64_t v12 = sub_1806BB3C0(a1[2], 1uLL, &v43, v20, v21, v22, v23, v24);
      *(_DWORD *)(v12 + 8) = v43;
      uint64_t v25 = (char *)inflateInit2_((z_streamp)v12, -15, "1.2.12", 112);
      if ((_DWORD)v25)
      {
        if ((_DWORD)v25 != -6)
        {
          if ((_DWORD)v25 == -4)
          {
            uint64_t v33 = (_DWORD *)a1[3];
            uint64_t v34 = "Internal error initializing compression library: out of memory";
            int v40 = 12;
          }

          else
          {
            if ((_DWORD)v25 == -2)
            {
              uint64_t v33 = (_DWORD *)a1[3];
              uint64_t v34 = "Internal error initializing compression library: invalid setup parameter";
              goto LABEL_36;
            }

            unint64_t v35 = (_DWORD *)a1[3];
            uint64_t v41 = v25;
            uint64_t v34 = "Internal error initializing compression library:  Zlib error %d";
LABEL_35:
            uint64_t v33 = v35;
LABEL_36:
            int v40 = -1;
          }

          archive_set_error(v33, v40, v34, a4, a5, a6, a7, a8, v41);
          return -30LL;
        }

        uint64_t v33 = (_DWORD *)a1[3];
        uint64_t v34 = "Internal error initializing compression library: invalid library version";
        goto LABEL_36;
      }

      *(_BYTE *)(v12 + 112) = 1;
    }

    size_t v26 = sub_1806BB3C0(a1[2], 1uLL, &v42, a4, a5, a6, a7, a8);
    *(void *)uint64_t v9 = v26;
    if (!v26)
    {
      uint64_t v33 = (_DWORD *)a1[3];
      uint64_t v34 = "truncated gzip input";
      goto LABEL_36;
    }

    int v27 = v42;
    if ((v42 & 0x8000000000000000LL) != 0) {
      return -30LL;
    }
    if (HIDWORD(v42))
    {
      unint64_t v42 = 0xFFFFFFFFLL;
      int v27 = -1;
    }

    *(_DWORD *)(v9 + 8) = v27;
    uint64_t v28 = (char *)inflate((z_streamp)v9, 0);
    if ((_DWORD)v28 == 1)
    {
      sub_1806BB668(a1[2], v42 - *(unsigned int *)(v9 + 8), v29, a4, a5, a6, a7, a8);
      uint64_t v32 = a1[11];
      *(_BYTE *)(v32 + 112) = 0;
      if (inflateEnd((z_streamp)v32))
      {
        uint64_t v33 = (_DWORD *)a1[3];
        uint64_t v34 = "Failed to clean up gzip decompressor";
        goto LABEL_36;
      }

      if (!sub_1806BB3C0(a1[2], 8uLL, &v43, a4, a5, a6, a7, a8) || !v43) {
        return -30LL;
      }
      uint64_t v30 = a1[2];
      uint64_t v31 = 8LL;
    }

    else
    {
      if ((_DWORD)v28)
      {
        unint64_t v35 = (_DWORD *)a1[3];
        uint64_t v41 = v28;
        uint64_t v34 = "gzip decompression failed (zlib returned error %d, msg %s)";
        goto LABEL_35;
      }

      uint64_t v30 = a1[2];
      uint64_t v31 = v42 - *(unsigned int *)(v9 + 8);
    }

    sub_1806BB668(v30, v31, v29, a4, a5, a6, a7, a8);
  }

  uint64_t v36 = *(void *)(v9 + 24);
  uint64_t v37 = *(void *)(v9 + 120);
  uint64_t result = v36 - v37;
  *(void *)(v9 + 136) += v36 - v37;
  if (v36 == v37) {
    uint64_t v39 = 0LL;
  }
  else {
    uint64_t v39 = v37;
  }
  *a2 = v39;
  return result;
}

uint64_t sub_18070EEAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 88);
  if (*(_BYTE *)(v1 + 112) && inflateEnd(*(z_streamp *)(a1 + 88)))
  {
    archive_set_error(*(_DWORD **)(a1 + 24), -1, "Failed to clean up gzip compressor", v3, v4, v5, v6, v7, v10);
    uint64_t v8 = 4294967266LL;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  free(*(void **)(v1 + 160));
  free(*(void **)(v1 + 120));
  free((void *)v1);
  return v8;
}

uint64_t sub_18070EF1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 88);
  uint64_t v4 = *(unsigned int *)(v3 + 152);
  if ((_DWORD)v4) {
    archive_entry_set_mtime(a2, v4, 0LL);
  }
  uint64_t v5 = *(char **)(v3 + 160);
  if (v5) {
    archive_entry_set_pathname(a2, v5);
  }
  return 0LL;
}

uint64_t archive_write_set_format_ustar( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 1, "archive_write_set_format_ustar", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    int v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10) {
      v10(a1);
    }
    uint64_t v11 = calloc(1uLL, 0x28uLL);
    if (v11)
    {
      uint64_t v17 = v11;
      uint64_t result = 0LL;
      *(void *)(a1 + 264) = v17;
      *(void *)(a1 + 272) = "ustar";
      *(void *)(a1 + 304) = sub_18070F0E8;
      *(void *)(a1 + 312) = sub_18070F31C;
      *(void *)(a1 + 320) = sub_18070F364;
      *(void *)(a1 + 328) = sub_18070F36C;
      *(void *)(a1 + 288) = sub_18070F044;
      *(void *)(a1 + 296) = sub_18070F398;
      *(_DWORD *)(a1 + 16) = 196609;
      *(void *)(a1 + 24) = "POSIX ustar";
    }

    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't allocate ustar data", v12, v13, v14, v15, v16, v18);
      return 4294967266LL;
    }
  }

  return result;
}

uint64_t sub_18070F044(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5 = *(void *)(a1 + 264);
  if (a3 && *a3)
  {
    uint64_t v12 = sub_1806F7A20(a1, a3, 0);
    *(void *)(v5 + 16) = v12;
    if (v12) {
      return 0LL;
    }
    else {
      return 4294967266LL;
    }
  }

  else
  {
    archive_set_error( (_DWORD *)a1,  -1,  "%s: hdrcharset option needs a character-set name",  v6,  v7,  v8,  v9,  v10,  *(char **)(a1 + 272));
    return 4294967271LL;
  }

uint64_t sub_18070F0E8(uint64_t a1, uint64_t *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 264);
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5)
  {
    if (*(_DWORD *)(v4 + 32))
    {
      uint64_t v5 = *(void *)(v4 + 24);
    }

    else
    {
      uint64_t v5 = sub_1806F7E68();
      *(void *)(v4 + 24) = v5;
      *(_DWORD *)(v4 + 32) = 1;
    }
  }

  if (!archive_entry_pathname(a2))
  {
    archive_set_error((_DWORD *)a1, -1, "Can't record entry in tar file without pathname", v6, v7, v8, v9, v10, v24);
    return 4294967271LL;
  }

  if (archive_entry_hardlink((uint64_t)a2)
    || archive_entry_symlink((uint64_t)a2)
    || archive_entry_filetype((uint64_t)a2) != 0x8000)
  {
    archive_entry_set_size((uint64_t)a2, 0LL);
  }

  if (archive_entry_filetype((uint64_t)a2) == 0x4000)
  {
    uint64_t v11 = (const char *)archive_entry_pathname(a2);
    if (v11)
    {
      uint64_t v12 = (char *)v11;
      if (*v11)
      {
        if (v11[strlen(v11) - 1] != 47)
        {
          __dst = 0LL;
          uint64_t v26 = 0LL;
          uint64_t v27 = 0LL;
          size_t v13 = strlen(v12);
          if (!sub_1806F7590((void **)&__dst, v13 + 2))
          {
            archive_set_error((_DWORD *)a1, 12, "Can't allocate ustar data", v14, v15, v16, v17, v18, v24);
            sub_1806F755C((uint64_t)&__dst);
            return 4294967266LL;
          }

          uint64_t v26 = 0LL;
          sub_1806F7634((uint64_t *)&__dst, v12, v13);
          sub_1806F76DC((uint64_t *)&__dst, 47);
          archive_entry_copy_pathname((uint64_t)a2, __dst);
          sub_1806F755C((uint64_t)&__dst);
        }
      }
    }
  }

  uint64_t v19 = sub_18070F3C4((_DWORD *)a1, (char *)&__dst, a2, -1, 1, v5);
  if ((int)v19 <= -21)
  {
LABEL_24:
    archive_entry_free(0LL);
    return v19;
  }

  uint64_t v20 = sub_1806FDA50(a1, (uint64_t)&__dst, 512LL);
  uint64_t v21 = v20;
  if ((int)v20 > -21)
  {
    else {
      uint64_t v19 = v20;
    }
    uint64_t v22 = archive_entry_size((uint64_t)a2);
    *(void *)uint64_t v4 = v22;
    *(void *)(v4 + 8) = -(int)v22 & 0x1FFLL;
    goto LABEL_24;
  }

  archive_entry_free(0LL);
  return v21;
}

uint64_t sub_18070F31C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = *(uint64_t **)(a1 + 264);
  if (*v3 >= a3) {
    uint64_t v4 = a3;
  }
  else {
    uint64_t v4 = *v3;
  }
  LODWORD(result) = sub_1806FDA50(a1, a2, v4);
  *v3 -= v4;
  if ((_DWORD)result) {
    return (int)result;
  }
  else {
    return v4;
  }
}

uint64_t sub_18070F364(void *a1)
{
  return sub_1806FDAB0(a1, 0x400uLL);
}

uint64_t sub_18070F36C(uint64_t a1)
{
  *(void *)(a1 + 264) = 0LL;
  return 0LL;
}

uint64_t sub_18070F398(void *a1)
{
  uint64_t v1 = (void *)a1[33];
  uint64_t result = sub_1806FDAB0(a1, v1[1] + *v1);
  void *v1 = 0LL;
  v1[1] = 0LL;
  return result;
}

uint64_t sub_18070F3C4(_DWORD *a1, char *__dst, uint64_t *a3, int a4, int a5, uint64_t a6)
{
  if (sub_1806AA3BC(a3, &__src, &__n, a6))
  {
    if (*__error() == 12)
    {
      uint64_t v16 = "Can't allocate memory for Pathname";
LABEL_43:
      archive_set_error(a1, 12, v16, v11, v12, v13, v14, v15, v139);
      return 4294967266LL;
    }

    uint64_t v18 = (char *)__src;
    sub_1806F7F14(a6);
    archive_set_error(a1, 79, "Can't translate pathname '%s' to %s", v19, v20, v21, v22, v23, v18);
    uint64_t v17 = 4294967276LL;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  size_t v24 = __n;
  uint64_t v25 = (const char *)__src;
  if (__n <= 0x64)
  {
    uint64_t v26 = __dst;
    uint64_t v27 = __src;
LABEL_8:
    memcpy(v26, v27, v24);
    goto LABEL_16;
  }

  uint64_t v28 = (char *)__src + __n;
  uint64_t v29 = strchr((char *)__src + __n - 101, 47);
  unint64_t v35 = v29;
  __s = v29;
  if (v29 == v25)
  {
    unint64_t v35 = strchr(v25 + 1, 47);
    __s = v35;
    if (!v35) {
      goto LABEL_15;
    }
  }

  else if (!v29)
  {
    goto LABEL_15;
  }

  if (v35[1] && v35 <= v25 + 155)
  {
    memcpy(__dst + 345, v25, v35 - v25);
    size_t v24 = (size_t)&v28[~(unint64_t)v35];
    uint64_t v26 = __dst;
    uint64_t v27 = v35 + 1;
    goto LABEL_8;
  }

uint64_t sub_18070FA9C(int64_t a1, char *a2, size_t a3, int a4, int a5)
{
  if (a5) {
    return sub_18070FB18(a1, a2, a3);
  }
  if ((a1 & 0x8000000000000000LL) == 0 && (int)a3 <= a4)
  {
    uint64_t v6 = 1LL << (3 * a3);
    while (v6 <= a1)
    {
      a3 = (a3 + 1);
      v6 *= 8LL;
      if (a4 + 1 == (_DWORD)a3) {
        goto LABEL_8;
      }
    }

    return sub_18070FB18(a1, a2, a3);
  }

uint64_t sub_18070FB18(unint64_t a1, char *__b, size_t __len)
{
  if ((a1 & 0x8000000000000000LL) != 0)
  {
    __len = __len;
    uint64_t v4 = __b;
    int v8 = 48;
LABEL_12:
    memset(v4, v8, __len);
    return 0xFFFFFFFFLL;
  }

  unint64_t v3 = a1;
  if ((int)__len < 1)
  {
    if (a1) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    uint64_t v4 = &__b[(int)__len];
    unsigned int v5 = __len + 1;
    do
    {
      unint64_t v6 = v3;
      *--uint64_t v4 = v3 & 7 | 0x30;
      v3 >>= 3;
      --v5;
    }

    while (v5 > 1);
    if (v6 <= 7) {
      uint64_t v7 = 0LL;
    }
    else {
      uint64_t v7 = 0xFFFFFFFFLL;
    }
    if (v6 >= 8)
    {
      __len = __len;
      int v8 = 55;
      goto LABEL_12;
    }
  }

  return v7;
}

void *sub_18070FBB0(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 2480);
  if (!result)
  {
    uint64_t result = calloc(1uLL, 0x18uLL);
    *(void *)(a1 + 2480) = result;
    if (result)
    {
      *(void *)(a1 + 2488) = sub_18070FC10;
    }

    else
    {
      archive_set_error((_DWORD *)a1, 12, "Can't extract", v3, v4, v5, v6, v7, v8);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_18070FC10(uint64_t a1)
{
  uint64_t v2 = *(uint64_t **)(a1 + 2480);
  if (*v2)
  {
    uint64_t v3 = archive_write_free(*v2);
    uint64_t v2 = *(uint64_t **)(a1 + 2480);
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  free(v2);
  *(void *)(a1 + 2480) = 0LL;
  return v3;
}

uint64_t archive_read_extract2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 168)) {
    archive_write_disk_set_skip_file(a3, *(void *)(a1 + 176), *(void *)(a1 + 184), a4, a5, a6, a7, a8);
  }
  int v11 = archive_write_header(a3);
  if (v11 <= -20) {
    int v12 = -20;
  }
  else {
    int v12 = v11;
  }
  if (v12)
  {
    archive_copy_error(a1, a3);
  }

  else if (archive_entry_size_is_set(a2) && archive_entry_size(a2) < 1)
  {
    int v12 = 0;
  }

  else
  {
    uint64_t v16 = sub_18070FBB0(a1);
    if (v16)
    {
      uint64_t v17 = v16;
      while (1)
      {
        int data_block = archive_read_data_block(a1);
        if (data_block) {
          break;
        }
        int v23 = archive_write_data_block(a3, v33, v32, v34, v19, v20, v21, v22);
        if (v23 <= -20) {
          int v12 = -20;
        }
        else {
          int v12 = v23;
        }
        if (v12 < 0)
        {
          int v25 = archive_errno(a3);
          uint64_t v26 = archive_error_string(a3);
          archive_set_error((_DWORD *)a1, v25, "%s", v27, v28, v29, v30, v31, v26);
          goto LABEL_8;
        }

        size_t v24 = (void (*)(void))v17[1];
        if (v24) {
          v24(v17[2]);
        }
      }

      if (data_block == 1) {
        int v12 = 0;
      }
      else {
        int v12 = data_block;
      }
    }

    else
    {
      int v12 = -30;
    }
  }

void *archive_read_extract_set_progress_callback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_18070FBB0(a1);
  if (result)
  {
    result[1] = a2;
    result[2] = a3;
  }

  return result;
}

uint64_t archive_write_set_format_filter_by_ext(_DWORD *a1, char *__s)
{
  unsigned int v4 = sub_18070FEA0(__s);
  if ((v4 & 0x80000000) != 0)
  {
    archive_set_error(a1, 22, "No such format '%s'", v5, v6, v7, v8, v9, __s);
    a1[1] = 0x8000;
    return 4294967266LL;
  }

  else
  {
    unsigned int v10 = v4;
    uint64_t result = ((uint64_t (*)(_DWORD *))(&off_18969EE10)[3 * v4 + 1])(a1);
    if (!(_DWORD)result) {
      return ((uint64_t (*)(_DWORD *))(&off_18969EE10)[3 * v10 + 2])(a1);
    }
  }

  return result;
}

uint64_t sub_18070FEA0(char *__s)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = ".7z";
  for (unsigned int i = &off_18969EE28; ; i += 3)
  {
    if (__s)
    {
      size_t v5 = strlen(__s);
      size_t v6 = strlen(v3);
      if (v5 >= v6 && !strcmp(&__s[v5 - v6], v3)) {
        break;
      }
    }

    ++v2;
    uint64_t v7 = *i;
    uint64_t v3 = v7;
    if (v2 == 12) {
      return 0xFFFFFFFFLL;
    }
  }

  return v2;
}

uint64_t archive_write_set_format_filter_by_ext_def(_DWORD *a1, char *__s, char *a3)
{
  unsigned int v6 = sub_18070FEA0(__s);
  if ((v6 & 0x80000000) != 0 && (unsigned int v6 = sub_18070FEA0(a3), (v6 & 0x80000000) != 0))
  {
    archive_set_error(a1, 22, "No such format '%s'", v7, v8, v9, v10, v11, __s);
    a1[1] = 0x8000;
    return 4294967266LL;
  }

  else
  {
    uint64_t result = ((uint64_t (*)(_DWORD *))(&off_18969EE10)[3 * v6 + 1])(a1);
    if (!(_DWORD)result) {
      return ((uint64_t (*)(_DWORD *))(&off_18969EE10)[3 * v6 + 2])(a1);
    }
  }

  return result;
}

uint64_t archive_write_set_compression_none()
{
  return 0LL;
}

uint64_t archive_write_add_filter_none()
{
  return 0LL;
}

uint64_t archive_write_zip_set_compression_deflate( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 7, "archive_write_zip_set_compression_deflate", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    if (*(_DWORD *)(a1 + 16) == 327680)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(*(void *)(a1 + 264) + 656LL) = 8;
    }

    else
    {
      archive_set_error( (_DWORD *)a1,  -1,  "Can only use archive_write_zip_set_compression_deflate with zip format",  v10,  v11,  v12,  v13,  v14,  v15);
      return 4294967266LL;
    }
  }

  return result;
}

uint64_t archive_write_zip_set_compression_store( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 264);
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 7, "archive_write_zip_set_compression_deflate", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    if (*(_DWORD *)(a1 + 16) == 327680)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(v9 + 656) = 0;
    }

    else
    {
      archive_set_error( (_DWORD *)a1,  -1,  "Can only use archive_write_zip_set_compression_store with zip format",  v11,  v12,  v13,  v14,  v15,  v16);
      return 4294967266LL;
    }
  }

  return result;
}

uint64_t archive_write_set_format_zip( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 1, "archive_write_set_format_zip", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    uint64_t v10 = *(void (**)(uint64_t))(a1 + 328);
    if (v10) {
      v10(a1);
    }
    uint64_t v11 = calloc(1uLL, 0x328uLL);
    if (v11)
    {
      uint64_t v17 = v11;
      v11[82] = -1LL;
      v11[74] = j__crc32_0;
      v11[99] = 0x10000LL;
      uint64_t v18 = malloc(0x10000uLL);
      v17[100] = v18;
      if (v18)
      {
        uint64_t result = 0LL;
        *(void *)(a1 + 264) = v17;
        *(void *)(a1 + 272) = "zip";
        *(void *)(a1 + 304) = sub_180710560;
        *(void *)(a1 + 312) = sub_1807110C4;
        *(void *)(a1 + 288) = sub_1807101FC;
        *(void *)(a1 + 296) = sub_18071166C;
        *(void *)(a1 + 320) = sub_180711AD4;
        *(void *)(a1 + 328) = sub_180711DE0;
        *(_DWORD *)(a1 + 16) = 327680;
        *(void *)(a1 + 24) = "ZIP";
        return result;
      }

      free(v17);
      uint64_t v19 = "Can't allocate compression buffer";
    }

    else
    {
      uint64_t v19 = "Can't allocate zip data";
    }

    archive_set_error((_DWORD *)a1, 12, v19, v12, v13, v14, v15, v16, v20);
    return 4294967266LL;
  }

  return result;
}

uint64_t sub_1807101FC(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 264);
  if (!strcmp(__s1, "compression"))
  {
    if (!a3 || !*a3)
    {
      uint64_t v30 = *(char **)(a1 + 272);
      uint64_t v20 = "%s: compression option needs a compression name";
LABEL_21:
      archive_set_error((_DWORD *)a1, -1, v20, v7, v8, v9, v10, v11, v30);
      return 4294967271LL;
    }

    uint64_t result = strcmp(a3, "deflate");
    if (!(_DWORD)result)
    {
      *(_DWORD *)(v6 + 656) = 8;
      return result;
    }

    uint64_t result = strcmp(a3, "store");
    if ((_DWORD)result) {
      return 4294967271LL;
    }
LABEL_53:
    *(_DWORD *)(v6 + 656) = 0;
    return result;
  }

  if (!strcmp(__s1, "compression-level"))
  {
    if (!a3) {
      return 4294967276LL;
    }
    int v19 = *a3;
    if (v19 != 48)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(v6 + 656) = 8;
      *(_DWORD *)(v6 + 660) = *a3 - 48;
      return result;
    }

    uint64_t result = 0LL;
    goto LABEL_53;
  }

  if (!strcmp(__s1, "encryption"))
  {
    if (!a3)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(v6 + 668) = 0;
      return result;
    }

    if (*a3 == 49 || !strcmp(a3, "traditional") || !strcmp(a3, "zipcrypt") || !strcmp(a3, "ZipCrypt"))
    {
      uint64_t result = sub_180712A54(v31, 0xBuLL);
      if (!(_DWORD)result)
      {
        *(_DWORD *)(v6 + 668) = 1;
        return result;
      }
    }

    else
    {
      if (!strcmp(a3, "aes128"))
      {
        int v28 = 2;
        int v29 = 2;
      }

      else
      {
        if (strcmp(a3, "aes256"))
        {
          archive_set_error( (_DWORD *)a1,  -1,  "%s: unknown encryption '%s'",  v21,  v22,  v23,  v24,  v25,  *(char **)(a1 + 272));
          return 4294967271LL;
        }

        int v28 = 3;
        int v29 = 3;
      }

      if (sub_180711E84(v29))
      {
        uint64_t result = 0LL;
        *(_DWORD *)(v6 + 668) = v28;
        return result;
      }
    }

    uint64_t v20 = "encryption not supported";
    goto LABEL_21;
  }

  if (!strcmp(__s1, "experimental"))
  {
    if (a3 && *a3)
    {
      uint64_t result = 0LL;
      unsigned int v18 = *(_DWORD *)(v6 + 672) | 4;
    }

    else
    {
      uint64_t result = 0LL;
      unsigned int v18 = *(_DWORD *)(v6 + 672) & 0xFFFFFFFB;
    }

    goto LABEL_40;
  }

  if (strcmp(__s1, "fakecrc32"))
  {
    if (strcmp(__s1, "hdrcharset"))
    {
      if (!strcmp(__s1, "zip64"))
      {
        if (a3 && *a3)
        {
          uint64_t result = 0LL;
          unsigned int v18 = *(_DWORD *)(v6 + 672) & 0xFFFFFFFC | 2;
        }

        else
        {
          uint64_t result = 0LL;
          unsigned int v18 = *(_DWORD *)(v6 + 672) & 0xFFFFFFFC | 1;
        }

uint64_t sub_180710560(uint64_t a1, uint64_t *a2)
{
  uint64_t v111 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 264);
  uint64_t v5 = *(void *)(v4 + 640);
  if (!v5)
  {
    if (*(_DWORD *)(v4 + 664))
    {
      uint64_t v5 = *(void *)(v4 + 648);
    }

    else
    {
      uint64_t v5 = sub_1806F7E68();
      *(void *)(v4 + 648) = v5;
      *(_DWORD *)(v4 + 664) = 1;
    }
  }

  int v6 = archive_entry_filetype((uint64_t)a2);
  int v7 = v6;
  if (v6 != 0x4000 && v6 != 0x8000 && v6 != 40960)
  {
    sub_1807010BC((_DWORD *)a1, a2);
    return 4294967271LL;
  }

  if ((*(_BYTE *)(v4 + 672) & 1) != 0)
  {
    if (archive_entry_size_is_set((uint64_t)a2) && archive_entry_size((uint64_t)a2) >= 0x100000000LL)
    {
      uint64_t v13 = "Files > 4GB require Zip64 extensions";
LABEL_14:
      archive_set_error((_DWORD *)a1, -1, v13, v8, v9, v10, v11, v12, v95);
      return 4294967271LL;
    }

    if (*(uint64_t *)(v4 + 632) >= 0x100000000LL)
    {
      uint64_t v13 = "Archives > 4GB require Zip64 extensions";
      goto LABEL_14;
    }
  }

  if (v7 != 0x8000) {
    archive_entry_set_size((uint64_t)a2, 0LL);
  }
  *(void *)uint64_t v4 = *(void *)(v4 + 632);
  *(void *)(v4 + 40) = 0x7FFFFFFFFFFFFFFFLL;
  *(_OWORD *)(v4 + 8) = 0u;
  uint64_t v14 = (uint64_t *)(v4 + 8);
  *(_DWORD *)(v4 + 68) = 0;
  *(_DWORD *)(v4 + 72) = 0;
  *(_OWORD *)(v4 + 24) = 0u;
  *(_DWORD *)(v4 + 56) = (*(uint64_t (**)(void, void, void))(v4 + 592))(0LL, 0LL, 0LL);
  *(_DWORD *)(v4 + 64) = 0;
  archive_entry_free(*(void ***)(v4 + 48));
  *(void *)(v4 + 48) = 0LL;
  if (*(_BYTE *)(v4 + 184)) {
    sub_1806A9954(v4 + 104);
  }
  if (*(_BYTE *)(v4 + 572)) {
    sub_1806D2718((_OWORD *)(v4 + 188));
  }
  *(_BYTE *)(v4 + 572) = 0;
  *(_BYTE *)(v4 + 184) = 0;
  *(_BYTE *)(v4 + 92) = 0;
  if (v7 == 0x8000 && (!archive_entry_size_is_set((uint64_t)a2) || archive_entry_size((uint64_t)a2) >= 1))
  {
    int v15 = *(_DWORD *)(v4 + 668);
    if ((v15 - 1) <= 2)
    {
      int v16 = *(_DWORD *)(v4 + 68) | 1;
      *(_DWORD *)(v4 + 64) = v15;
      *(_DWORD *)(v4 + 68) = v16;
    }
  }

  uint64_t v17 = (uint64_t *)archive_entry_clone(a2);
  *(void *)(v4 + 48) = v17;
  if (!v17)
  {
    uint64_t v23 = "Can't allocate zip header data";
    goto LABEL_34;
  }

  if (v5)
  {
    if (sub_1806AA3BC(a2, __src, &v105, v5))
    {
      if (*__error() == 12)
      {
        uint64_t v23 = "Can't allocate memory for Pathname";
LABEL_34:
        archive_set_error((_DWORD *)a1, 12, v23, v18, v19, v20, v21, v22, v95);
        return 4294967266LL;
      }

      uint64_t v25 = (char *)archive_entry_pathname(a2);
      sub_1806F7F14(v5);
      archive_set_error((_DWORD *)a1, 79, "Can't translate Pathname '%s' to %s", v26, v27, v28, v29, v30, v25);
      uint64_t v24 = 4294967276LL;
    }

    else
    {
      uint64_t v24 = 0LL;
    }

    if (v105) {
      archive_entry_set_pathname(*(void *)(v4 + 48), *(char **)__src);
    }
    if (v7 == 40960)
    {
      if (sub_1806AA610((uint64_t)a2, __src, &v105, v5))
      {
        if (*__error() == 12)
        {
          uint64_t v23 = "Can't allocate memory  for Symlink";
          goto LABEL_34;
        }
      }

      else if (v105)
      {
        archive_entry_set_symlink(*(void *)(v4 + 48), *(char **)__src);
      }
    }

    uint64_t v17 = *(uint64_t **)(v4 + 48);
  }

  else
  {
    uint64_t v24 = 0LL;
  }

  uint64_t v31 = (_BYTE *)archive_entry_pathname(v17);
  while (1)
  {
    int v32 = (char)*v31;
    if (!*v31) {
      break;
    }
    ++v31;
    if (v32 < 0)
    {
      uint64_t v33 = *(void *)(v4 + 640);
      if (v33) {
        uint64_t v34 = (const char *)sub_1806F7F14(v33);
      }
      else {
        uint64_t v34 = nl_langinfo(0);
      }
      if (!strcmp(v34, "UTF-8")) {
        *(_DWORD *)(v4 + 68) |= 0x800u;
      }
      break;
    }
  }

  unint64_t v35 = *(uint64_t **)(v4 + 48);
  int v36 = archive_entry_filetype((uint64_t)v35);
  uint64_t v37 = (const char *)archive_entry_pathname(v35);
  if (v37)
  {
    uint64_t v38 = v37;
    size_t v39 = strlen(v37);
    uint64_t v40 = v39;
    if (v36 == 0x4000 && (!*v38 || v38[v39 - 1] != 47)) {
      uint64_t v40 = v39 + 1;
    }
  }

  else
  {
    uint64_t v40 = 0LL;
  }

  if (v7 == 40960)
  {
    uint64_t v41 = (const char *)archive_entry_symlink(*(void *)(v4 + 48));
    uint64_t v42 = v41;
    if (v41) {
      size_t v43 = strlen(v41);
    }
    else {
      size_t v43 = 0LL;
    }
    *(void *)(v4 + 40) = v43;
    *(void *)(v4 + 8) = v43;
    *(void *)(v4 + 16) = v43;
    unsigned int v47 = (*(uint64_t (**)(void, const char *, size_t))(v4 + 592))(*(unsigned int *)(v4 + 56), v42, v43);
    LOWORD(v45) = 0;
    *(void *)(v4 + 56) = v47;
    goto LABEL_75;
  }

  if (v7 != 0x8000)
  {
    LOWORD(v45) = 0;
    size_t v43 = 0LL;
    uint64_t v42 = 0LL;
    *(_DWORD *)(v4 + 60) = 0;
    *(void *)(v4 + 40) = 0LL;
    goto LABEL_75;
  }

  if (!archive_entry_size_is_set(*(void *)(v4 + 48)))
  {
    LOWORD(v45) = 8;
    *(_DWORD *)(v4 + 60) = 8;
    *(_DWORD *)(v4 + 68) |= 8u;
    if ((*(_BYTE *)(v4 + 672) & 1) == 0)
    {
      size_t v43 = 0LL;
      uint64_t v42 = 0LL;
      *(_DWORD *)(v4 + 72) = 1;
      __int16 v46 = 45;
      LOWORD(v45) = 8;
      goto LABEL_76;
    }

    size_t v43 = 0LL;
    uint64_t v42 = 0LL;
LABEL_75:
    __int16 v46 = 20;
    goto LABEL_76;
  }

  uint64_t v44 = archive_entry_size(*(void *)(v4 + 48));
  *(void *)(v4 + 40) = v44;
  int v45 = *(_DWORD *)(v4 + 656);
  if (v45 == -1) {
    int v45 = 8;
  }
  if (!v44) {
    int v45 = 0;
  }
  *(_DWORD *)(v4 + 60) = v45;
  if (v45)
  {
    __int16 v46 = 20;
  }

  else
  {
    *uint64_t v14 = v44;
    __int16 v46 = 10;
  }

  *(void *)(v4 + 16) = v44;
  int v92 = *(_DWORD *)(v4 + 68);
  if ((v92 & 1) != 0)
  {
    if ((*(_DWORD *)(v4 + 64) - 1) >= 3)
    {
      uint64_t v93 = 0LL;
    }

    else
    {
      __int16 v46 = 20;
      uint64_t v93 = 8LL * (*(_DWORD *)(v4 + 64) - 1) + 12;
    }

    if (!v45) {
      *v14 += v93;
    }
  }

  else
  {
    uint64_t v93 = 0LL;
  }

  if (v45) {
    BOOL v94 = v44 <= 4278190080LL;
  }
  else {
    BOOL v94 = 1;
  }
  if (!v94 || (*(_DWORD *)(v4 + 672) & 2) != 0 || v93 + v44 >= 0x100000000LL)
  {
    *(_DWORD *)(v4 + 72) = 1;
    __int16 v46 = 45;
  }

  size_t v43 = 0LL;
  uint64_t v42 = 0LL;
  *(_DWORD *)(v4 + 68) = v92 | 8;
LABEL_76:
  *(void *)&v109[2] = 0LL;
  uint64_t v110 = 0LL;
  LODWORD(v105) = 67324752;
  WORD2(v105) = v46;
  int v48 = *(_DWORD *)(v4 + 64);
  HIWORD(v105) = *(_DWORD *)(v4 + 68);
  if ((v48 & 0xFFFFFFFE) == 2)
  {
    LOBYTE(v45) = 99;
    char v49 = 0;
  }

  else
  {
    char v49 = BYTE1(v45);
  }

  char v106 = v45;
  char v107 = v49;
  time_t v50 = archive_entry_mtime(*(void *)(v4 + 48));
  int v51 = sub_180711FAC(v50);
  int v108 = v51;
  unsigned int v52 = *(_DWORD *)(v4 + 56);
  *(_DWORD *)uint64_t v109 = v52;
  uint64_t v96 = (uint64_t)v42;
  if (*(_DWORD *)(v4 + 72))
  {
    *(_DWORD *)&v109[4] = -1;
    LOBYTE(v53) = -1;
    LOBYTE(v54) = -1;
    LOBYTE(v55) = -1;
    LOBYTE(v56) = -1;
  }

  else
  {
    *(_DWORD *)&v109[4] = *(void *)(v4 + 8);
    unint64_t v53 = *(void *)(v4 + 16);
    unint64_t v54 = v53 >> 8;
    unint64_t v55 = v53 >> 16;
    unint64_t v56 = v53 >> 24;
  }

  v109[8] = v53;
  v109[9] = v54;
  LOBYTE(v110) = v55;
  BYTE1(v110) = v56;
  WORD1(v110) = v40;
  if (*(_DWORD *)(v4 + 64) == 1)
  {
    unsigned int v57 = HIBYTE(v52);
    if ((*(_DWORD *)(v4 + 68) & 8) != 0) {
      LOBYTE(v57) = BYTE1(v51);
    }
    *(_BYTE *)(v4 + 93) = v57;
  }

  uint64_t v58 = sub_180712034((void *)v4, 46LL);
  *(void *)(v4 + 576) = v58;
  ++*(void *)(v4 + 624);
  *uint64_t v58 = 0u;
  v58[1] = 0u;
  *(_OWORD *)((char *)v58 + 30) = 0u;
  **(_DWORD **)(v4 + 576) = 33639248;
  uint64_t v59 = *(void *)(v4 + 576);
  *(_BYTE *)(v59 + 4) = v46;
  *(_BYTE *)(v59 + 5) = 3;
  *(_WORD *)(*(void *)(v4 + 576) + 6LL) = v46;
  *(_WORD *)(*(void *)(v4 + 576) + 8LL) = *(_DWORD *)(v4 + 68);
  uint64_t v60 = *(void *)(v4 + 576);
  if ((*(_DWORD *)(v4 + 64) & 0xFFFFFFFE) == 2)
  {
    LOBYTE(v61) = 0;
    *(_BYTE *)(v60 + 10) = 99;
  }

  else
  {
    unsigned int v62 = *(_DWORD *)(v4 + 60);
    *(_BYTE *)(v60 + 10) = v62;
    unsigned int v61 = v62 >> 8;
  }

  *(_BYTE *)(v60 + 11) = v61;
  uint64_t v63 = *(void *)(v4 + 576);
  time_t v64 = archive_entry_mtime(*(void *)(v4 + 48));
  *(_DWORD *)(v63 + 12) = sub_180711FAC(v64);
  *(_WORD *)(*(void *)(v4 + 576) + 28LL) = v40;
  uint64_t v65 = *(void *)(v4 + 576);
  __int16 v66 = archive_entry_mode(*(void *)(v4 + 48));
  *(_WORD *)(v65 + 38) = 0;
  *(_WORD *)(v65 + 40) = v66;
  size_t v67 = sub_180712034((void *)v4, v40);
  uint64_t v68 = *(uint64_t **)(v4 + 48);
  uint64_t v69 = (const char *)archive_entry_pathname(v68);
  size_t v70 = strlen(v69);
  LODWORD(v68) = archive_entry_filetype((uint64_t)v68);
  memcpy(v67, v69, v70);
  if ((_DWORD)v68 == 0x4000 && v69[v70 - 1] != 47) {
    *((_BYTE *)v67 + v70) = 47;
  }
  memset(v104, 0, sizeof(v104));
  __int128 v103 = 0u;
  __int128 v102 = 0u;
  __int128 v101 = 0u;
  __int128 v100 = 0u;
  __int128 v99 = 0u;
  __int128 v98 = 0u;
  *(_OWORD *)&__src[2] = 0u;
  *(_WORD *)__src = 21589;
  int is_set = archive_entry_mtime_is_set((uint64_t)a2);
  char v72 = 4 * (archive_entry_atime_is_set((uint64_t)a2) != 0);
  if (is_set) {
    char v73 = v72 + 5;
  }
  else {
    char v73 = v72 + 1;
  }
  *(_WORD *)&__src[2] = (v73 + 4 * (archive_entry_ctime_is_set((uint64_t)a2) != 0));
  BOOL v74 = archive_entry_mtime_is_set((uint64_t)a2) != 0;
  char v75 = v74 | (2 * (archive_entry_atime_is_set((uint64_t)a2) != 0));
  __src[4] = v75 | (4 * (archive_entry_ctime_is_set((uint64_t)a2) != 0));
  if (archive_entry_mtime_is_set((uint64_t)a2))
  {
    *(_DWORD *)&__src[5] = archive_entry_mtime((uint64_t)a2);
    int v76 = &__src[9];
  }

  else
  {
    int v76 = &__src[5];
  }

  if (archive_entry_atime_is_set((uint64_t)a2))
  {
    *(_DWORD *)int v76 = archive_entry_atime((uint64_t)a2);
    v76 += 4;
  }

  if (archive_entry_ctime_is_set((uint64_t)a2))
  {
    *(_DWORD *)int v76 = archive_entry_ctime((uint64_t)a2);
    v76 += 4;
  }

  *(_DWORD *)int v76 = 751733;
  *((_WORD *)v76 + 2) = 1025;
  *(_DWORD *)(v76 + 6) = archive_entry_uid((uint64_t)a2);
  v76[10] = 4;
  *(_DWORD *)(v76 + 11) = archive_entry_gid((uint64_t)a2);
  uint64_t v77 = v76 + 15;
  if ((*(_BYTE *)(v4 + 68) & 1) != 0 && (*(_DWORD *)(v4 + 64) & 0xFFFFFFFE) == 2)
  {
    *(void *)uint64_t v77 = 0x4541000100079901LL;
    if (archive_entry_size_is_set(*(void *)(v4 + 48)) && archive_entry_size(*(void *)(v4 + 48)) <= 19)
    {
      int v78 = 2;
      *(_WORD *)(v76 + 19) = 2;
    }

    else
    {
      int v78 = 1;
    }

    *(_DWORD *)(v4 + 96) = v78;
    if (*(_DWORD *)(v4 + 64) == 2) {
      char v79 = 1;
    }
    else {
      char v79 = 3;
    }
    v76[23] = v79;
    *((_WORD *)v76 + 12) = *(_DWORD *)(v4 + 60);
    uint64_t v77 = v76 + 26;
  }

  *(void *)(v4 + 584) = *(void *)(v4 + 616);
  uint64_t v80 = sub_180712034((void *)v4, v77 - __src);
  memcpy(v80, __src, v77 - __src);
  if (*(_DWORD *)(v4 + 72))
  {
    *(_DWORD *)uint64_t v77 = 1048577;
    *(void *)(v77 + 4) = *(void *)(v4 + 16);
    *(void *)(v77 + 12) = *(void *)(v4 + 8);
    *((_WORD *)v77 + 1) = 16;
    v77 += 20;
  }

  if ((*(_BYTE *)(v4 + 672) & 4) != 0)
  {
    *(_DWORD *)uint64_t v77 = 27768;
    v77[4] = 7;
    *(_WORD *)(v77 + 5) = v46 | 0x300;
    *(_WORD *)(v77 + 7) = 0;
    __int16 v81 = archive_entry_mode(*(void *)(v4 + 48));
    *(_WORD *)(v77 + 9) = 0;
    *(_WORD *)(v77 + 11) = v81;
    *((_WORD *)v77 + 1) = 9;
    v77 += 13;
  }

  uint64_t v82 = v77 - __src;
  WORD2(v110) = v77 - __src;
  *(void *)(v4 + 632) += 30LL;
  uint64_t v84 = *(uint64_t **)(v4 + 48);
  uint64_t v85 = (const char *)archive_entry_pathname(v84);
  int v86 = archive_entry_filetype((uint64_t)v84);
  if (!v85) {
    return 4294967266LL;
  }
  int v87 = v86;
  size_t v88 = strlen(v85);
  size_t v89 = strlen(v85);
  int v90 = v89;
  if (v87 == 0x4000)
  {
    uint64_t v91 = v96;
    if (v85[v89 - 1] != 47)
    {
      ++v90;
    }
  }

  else
  {
    uint64_t v91 = v96;
  }

  if (v90 < 1) {
    return 4294967266LL;
  }
  *(void *)(v4 + 632) += v90;
  *(void *)(v4 + 632) += v82;
  if (v91)
  {
    *(int64x2_t *)(v4 + 24) = vaddq_s64(*(int64x2_t *)(v4 + 24), vdupq_n_s64(v43));
    *(void *)(v4 + 632) += v43;
  }

  if (*(_DWORD *)(v4 + 60) == 8)
  {
    *(void *)(v4 + 752) = 0LL;
    *(void *)(v4 + 744) = 0LL;
    *(void *)(v4 + 760) = 0LL;
    *(void *)(v4 + 704) = *(void *)(v4 + 800);
    *(_DWORD *)(v4 + 712) = *(void *)(v4 + 792);
    if (deflateInit2_((z_streamp)(v4 + 680), *(_DWORD *)(v4 + 660), 8, -15, 8, 0, "1.2.12", 112))
    {
      uint64_t v23 = "Can't init deflate compressor";
      goto LABEL_34;
    }
  }

  return v24;
}

uint64_t sub_1807110C4( uint64_t a1, Bytef *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  uint64_t v8 = *(void *)(a1 + 264);
  if (*(void *)(v8 + 40) >= a3) {
    uint64_t v9 = a3;
  }
  else {
    uint64_t v9 = *(void *)(v8 + 40);
  }
  *(void *)(v8 + 32) += v9;
  if (!v9) {
    return v9;
  }
  if ((*(_BYTE *)(v8 + 68) & 1) != 0)
  {
    int v12 = *(_DWORD *)(v8 + 64);
    if ((v12 - 2) >= 2)
    {
      if (v12 != 1 || *(_BYTE *)(v8 + 92)) {
        goto LABEL_20;
      }
      uint64_t v40 = sub_1806E90C8(a1);
      if (v40)
      {
        uint64_t v41 = (Bytef *)v40;
        if (!sub_180712A54(&dataLength, 0xBuLL))
        {
          size_t v42 = strlen((const char *)v41);
          *(void *)(v8 + 80) = 0x2345678912345678LL;
          *(_DWORD *)(v8 + 88) = 878082192;
          if (v42)
          {
            size_t v43 = v42;
            do
            {
              Bytef v44 = *v41++;
              sub_1806F57A4((int *)(v8 + 80), v44);
              --v43;
            }

            while (v43);
          }

          uint64_t v45 = 0LL;
          char v52 = *(_BYTE *)(v8 + 93);
          do
          {
            Bytef v46 = *((_BYTE *)&dataLength + v45);
            salt[v45] = v46 ^ ((unsigned __int16)(((*(_WORD *)(v8 + 88) | 2) ^ 1) * (*(_WORD *)(v8 + 88) | 2)) >> 8);
            sub_1806F57A4((int *)(v8 + 80), v46);
            ++v45;
          }

          while (v45 != 12);
          int v37 = sub_1806FDA50(a1, (uint64_t)salt, 12LL);
          if (v37) {
            return v37;
          }
          *(void *)(v8 + 632) += 12LL;
          *(void *)(v8 + 24) += 12LL;
          *(_BYTE *)(v8 + 92) = 1;
          goto LABEL_20;
        }

        goto LABEL_51;
      }
    }

    else
    {
      if (*(_BYTE *)(v8 + 184)) {
        goto LABEL_20;
      }
      uint64_t v13 = sub_1806E90C8(a1);
      if (v13)
      {
        uint64_t v19 = v13;
        if (*(_DWORD *)(v8 + 64) == 2) {
          size_t v20 = 16LL;
        }
        else {
          size_t v20 = 32LL;
        }
        if (*(_DWORD *)(v8 + 64) == 2) {
          size_t v21 = 8LL;
        }
        else {
          size_t v21 = 16LL;
        }
        if (!sub_180712A54(salt, v21))
        {
          size_t v27 = strlen(v19);
          sub_1806A9724(v19, v27, salt, v21, 0x3E8u, (uint8_t *)&dataLength, (2 * v20) | 2);
          if (sub_1806A976C(v8 + 104, &dataLength, v20))
          {
            uint64_t v28 = "Decryption is unsupported due to lack of crypto library";
LABEL_53:
            archive_set_error((_DWORD *)a1, -1, v28, v14, v15, v16, v17, v18, v49);
            return -25;
          }

          if (sub_1806D26C8((CCHmacContext *)(v8 + 188), (char *)&dataLength + v20, v20))
          {
            sub_1806A9954(v8 + 104);
            uint64_t v28 = "Failed to initialize HMAC-SHA1";
            goto LABEL_53;
          }

          salt[v21] = *((_BYTE *)&dataLength + 2 * v20);
          salt[v21 | 1] = *((_BYTE *)&dataLength + ((2 * v20) | 1));
          uint64_t v47 = v21 | 2;
          int v37 = sub_1806FDA50(a1, (uint64_t)salt, v47);
          if (v37) {
            return v37;
          }
          *(void *)(v8 + 632) += v47;
          *(void *)(v8 + 24) += v47;
          *(_BYTE *)(v8 + 572) = 1;
          *(_BYTE *)(v8 + 184) = 1;
          goto LABEL_20;
        }

uint64_t sub_18071166C(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(uint64_t **)(a1 + 264);
  if (*((_DWORD *)v2 + 15) == 8)
  {
    if (deflate((z_streamp)(v2 + 85), 4) != -2)
    {
      while (1)
      {
        uint64_t v3 = *((unsigned int *)v2 + 178);
        unint64_t v4 = v2[99] - v3;
        if (*((_BYTE *)v2 + 92))
        {
          sub_1807120F8((uint64_t)(v2 + 10), (Bytef *)v2[100], v2[99] - v3, (_BYTE *)v2[100], v2[99] - v3);
        }

        else if (*((_BYTE *)v2 + 184))
        {
          *(void *)__src = v2[99] - v3;
          if ((sub_1806A97F0((uint64_t)(v2 + 13), v2[100], v4, v2[100], (unint64_t *)__src) & 0x80000000) != 0)
          {
            archive_set_error((_DWORD *)a1, -1, "Failed to encrypt file", v5, v6, v7, v8, v9, (char *)v33);
            return 4294967271LL;
          }

          j__CCHmacUpdate((CCHmacContext *)((char *)v2 + 188), (const void *)v2[100], v4);
        }

        uint64_t result = sub_1806FDA50(a1, v2[100], v4);
        if ((_DWORD)result) {
          return result;
        }
        v2[3] += v4;
        v2[79] += v4;
        v2[88] = v2[100];
        if (*((_DWORD *)v2 + 178))
        {
          deflateEnd((z_streamp)(v2 + 85));
          goto LABEL_13;
        }

        *((_DWORD *)v2 + 178) = v2[99];
        if (deflate((z_streamp)(v2 + 85), 4) == -2) {
          return 4294967266LL;
        }
      }
    }

    return 4294967266LL;
  }

uint64_t sub_180711AD4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 264);
  uint64_t v3 = *(void *)(v2 + 632);
  unint64_t v4 = *(void **)(v2 + 600);
  uint64_t v5 = v3;
  if (v4)
  {
    while (!sub_1806FDA50(a1, v4[2], v4[3] - v4[2]))
    {
      uint64_t v5 = v4[3] - v4[2] + *(void *)(v2 + 632);
      *(void *)(v2 + 632) = v5;
      unint64_t v4 = (void *)*v4;
      if (!v4) {
        goto LABEL_4;
      }
    }

    return 4294967266LL;
  }

LABEL_4:
  uint64_t v6 = v5 - v3;
  unint64_t v7 = *(void *)(v2 + 624);
  BOOL v9 = v3 <= 0xFFFFFFFFLL && v6 <= 0xFFFFFFFFLL && v7 >> 16 == 0;
  if (!v9 || (*(_BYTE *)(v2 + 672) & 2) != 0)
  {
    *(void *)&v13[16] = 0LL;
    *(_DWORD *)unint64_t v13 = 101075792;
    strcpy(&v13[4], ",");
    *(_WORD *)&v13[6] = 0;
    *(void *)&v13[8] = 0x2D002D00000000LL;
    *(void *)&v13[24] = v7;
    *(void *)&v13[32] = v7;
    *(void *)&v13[40] = v5 - v3;
    *(void *)&v13[48] = v3;
    *(void *)(v2 + 632) += 56LL;
    *(void *)unint64_t v13 = 117853008LL;
    *(void *)&v13[8] = v5;
    *(_DWORD *)&v13[16] = 1;
    *(void *)(v2 + 632) += 20LL;
    unint64_t v7 = *(void *)(v2 + 624);
  }

  memset(&v13[4], 0, 60);
  *(_DWORD *)unint64_t v13 = 101010256;
  if (v7 >= 0xFFFF) {
    LOWORD(v7) = -1;
  }
  *(_WORD *)&v13[8] = v7;
  *(_WORD *)&v13[10] = v7;
  int v10 = -1;
  if (v6 >= 0xFFFFFFFFLL) {
    int v11 = -1;
  }
  else {
    int v11 = v5 - v3;
  }
  *(_DWORD *)&v13[12] = v11;
  if (v3 < 0xFFFFFFFFLL) {
    int v10 = v3;
  }
  *(_DWORD *)&v13[16] = v10;
  uint64_t result = sub_1806FDA50(a1, (uint64_t)v13, 22LL);
  if (!(_DWORD)result)
  {
    *(void *)(v2 + 632) += 22LL;
    return result;
  }

  return 4294967266LL;
}

uint64_t sub_180711DE0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 264);
  while (1)
  {
    uint64_t v3 = *(void ***)(v2 + 600);
    if (!v3) {
      break;
    }
    *(void *)(v2 + 600) = *v3;
    free(v3[2]);
    free(v3);
  }

  free(*(void **)(v2 + 800));
  archive_entry_free(*(void ***)(v2 + 48));
  if (*(_BYTE *)(v2 + 184)) {
    sub_1806A9954(v2 + 104);
  }
  if (*(_BYTE *)(v2 + 572)) {
    sub_1806D2718((_OWORD *)(v2 + 188));
  }
  free((void *)v2);
  *(void *)(a1 + 264) = 0LL;
  return 0LL;
}

uint64_t sub_180711E84(int a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (a1 == 2) {
    size_t v1 = 16LL;
  }
  else {
    size_t v1 = 32LL;
  }
  if (a1 == 2) {
    size_t v2 = 8LL;
  }
  else {
    size_t v2 = 16LL;
  }
  int v3 = sub_1806D26C8(&v5, &derivedKey[v1], v1);
  sub_1806A9954((uint64_t)v6);
  if (v3) {
    return 0LL;
  }
  sub_1806D2718(&v5);
  return 1LL;
}

uint64_t sub_180711FA4()
{
  return 0LL;
}

uint64_t sub_180711FAC(time_t a1)
{
  time_t v5 = a1;
  size_t v1 = localtime_r(&v5, &v4);
  int tm_year = v1->tm_year;
  if (tm_year < 80) {
    return 2162688LL;
  }
  if (tm_year <= 0xCF) {
  return 4288659325LL;
  }
}

void *sub_180712034(void *a1, uint64_t a2)
{
  if (!a1[75] || (v4 = (void *)a1[76], uint64_t result = (void *)v4[3], (unint64_t)result + a2 > v4[2] + v4[1]))
  {
    uint64_t result = calloc(1uLL, 0x20uLL);
    if (!result) {
      return result;
    }
    tm v4 = result;
    result[1] = 0x10000LL;
    uint64_t result = malloc(0x10000uLL);
    v4[2] = result;
    if (!result)
    {
      free(v4);
      return 0LL;
    }

    v4[3] = result;
    uint64_t v6 = (void **)(a1 + 76);
    if (a1[75])
    {
      unint64_t v7 = *v6;
    }

    else
    {
      unint64_t v7 = a1 + 76;
      uint64_t v6 = (void **)(a1 + 75);
    }

    void *v7 = v4;
    *uint64_t v6 = v4;
  }

  v4[3] = (char *)result + a2;
  a1[77] += a2;
  return result;
}

unint64_t sub_1807120F8(uint64_t a1, Bytef *a2, unint64_t a3, _BYTE *a4, unint64_t a5)
{
  if (a3 >= a5) {
    unint64_t v5 = a5;
  }
  else {
    unint64_t v5 = a3;
  }
  if ((_DWORD)v5)
  {
    uint64_t v9 = v5;
    do
    {
      Bytef v10 = *a2++;
      *a4++ = v10 ^ ((unsigned __int16)(((*(_WORD *)(a1 + 8) | 2) ^ 1) * (*(_WORD *)(a1 + 8) | 2)) >> 8);
      sub_1806F57A4((int *)a1, v10);
      --v9;
    }

    while (v9);
  }

  return v5;
}

uint64_t archive_write_set_format_cpio_pwb( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_180712178(a1, 65543, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_180712178( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_1806A93F4((int *)a1, -1329217314, 1, "archive_write_set_format_cpio_binary", a5, a6, a7, a8);
  if ((_DWORD)result != -30)
  {
    int v11 = *(void (**)(uint64_t))(a1 + 328);
    if (v11) {
      v11(a1);
    }
    uint64_t v12 = calloc(1uLL, 0x40uLL);
    if (v12)
    {
      *(void *)(a1 + 264) = v12;
      *(void *)(a1 + 272) = "cpio";
      *(void *)(a1 + 304) = sub_180712344;
      *(void *)(a1 + 312) = sub_180712440;
      *(void *)(a1 + 288) = sub_1807122A0;
      *(void *)(a1 + 296) = sub_180712488;
      *(void *)(a1 + 320) = sub_180712494;
      *(void *)(a1 + 328) = sub_1807124FC;
      *(_DWORD *)(a1 + 16) = a2;
      if (a2 == 65538)
      {
        uint64_t result = 0LL;
        int v18 = "7th Edition cpio";
        goto LABEL_10;
      }

      if (a2 == 65543)
      {
        uint64_t result = 0LL;
        int v18 = "PWB cpio";
LABEL_10:
        *(void *)(a1 + 24) = v18;
        return result;
      }

      uint64_t v19 = "binary format must be 'pwb' or 'bin'";
      uint64_t v20 = (_DWORD *)a1;
      int v21 = 22;
    }

    else
    {
      uint64_t v19 = "Can't allocate cpio data";
      uint64_t v20 = (_DWORD *)a1;
      int v21 = 12;
    }

    archive_set_error(v20, v21, v19, v13, v14, v15, v16, v17, v22);
    return 4294967266LL;
  }

  return result;
}

uint64_t archive_write_set_format_cpio_bin( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_180712178(a1, 65538, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1807122A0(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5 = *(void *)(a1 + 264);
  if (a3 && *a3)
  {
    uint64_t v12 = sub_1806F7A20(a1, a3, 0);
    *(void *)(v5 + 40) = v12;
    if (v12) {
      return 0LL;
    }
    else {
      return 4294967266LL;
    }
  }

  else
  {
    archive_set_error( (_DWORD *)a1,  -1,  "%s: hdrcharset option needs a character-set name",  v6,  v7,  v8,  v9,  v10,  *(char **)(a1 + 272));
    return 4294967271LL;
  }

uint64_t sub_180712344(_DWORD *a1, uint64_t *a2)
{
  if (archive_entry_filetype((uint64_t)a2) || archive_entry_hardlink((uint64_t)a2))
  {
    uint64_t v9 = sub_1806DD818((uint64_t)a1);
    if (sub_1806AA3BC(a2, &v13, &v12, v9) && *__error() == 12)
    {
      archive_set_error(a1, 12, "Can't allocate memory for Pathname", v4, v5, v6, v7, v8, v12);
      return 4294967266LL;
    }

    if (v12 && v13 && *v13)
    {
      if (archive_entry_size_is_set((uint64_t)a2)
        && (archive_entry_size((uint64_t)a2) & 0x8000000000000000LL) == 0)
      {
        return sub_180712534((uint64_t)a1, a2);
      }

      int v11 = "Size required";
    }

    else
    {
      int v11 = "Pathname required";
    }
  }

  else
  {
    int v11 = "Filetype required";
  }

  archive_set_error(a1, -1, v11, v4, v5, v6, v7, v8, v12);
  return 4294967271LL;
}

uint64_t sub_180712440(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v3 = *(uint64_t **)(a1 + 264);
  if (*v3 >= a3) {
    uint64_t v4 = a3;
  }
  else {
    uint64_t v4 = *v3;
  }
  LODWORD(result) = sub_1806FDA50(a1, a2, v4);
  *v3 -= v4;
  else {
    return (int)result;
  }
}

uint64_t sub_180712488(uint64_t a1)
{
  return sub_1806FDAB0((void *)a1, **(void **)(a1 + 264));
}

uint64_t sub_180712494(uint64_t a1)
{
  size_t v2 = (uint64_t *)archive_entry_new2(0LL);
  archive_entry_set_nlink((uint64_t)v2, 1);
  archive_entry_set_size((uint64_t)v2, 0LL);
  archive_entry_set_pathname((uint64_t)v2, "TRAILER!!!");
  uint64_t v3 = sub_180712534(a1, v2);
  archive_entry_free((void **)v2);
  return v3;
}

uint64_t sub_1807124FC(uint64_t a1)
{
  size_t v2 = *(void ***)(a1 + 264);
  free(v2[2]);
  free(v2);
  *(void *)(a1 + 264) = 0LL;
  return 0LL;
}

uint64_t sub_180712534(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(a1 + 264);
  uint64_t v5 = sub_1806DD818(a1);
  if (sub_1806AA3BC(a2, &v65, &v55, v5))
  {
    if (*__error() == 12)
    {
      int v11 = "Can't allocate memory for Pathname";
LABEL_34:
      uint64_t v31 = (_DWORD *)a1;
      int v32 = 12;
      goto LABEL_35;
    }

    uint64_t v13 = (char *)archive_entry_pathname(a2);
    sub_1806F7F14(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate pathname '%s' to %s", v14, v15, v16, v17, v18, v13);
    uint64_t v12 = 4294967276LL;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  int v19 = v55;
  v56[0] = 29127;
  v56[1] = archive_entry_dev(a2);
  uint64_t v20 = archive_entry_ino64((uint64_t)a2);
  if (v20)
  {
    uint64_t v21 = v20;
    if (archive_entry_nlink((uint64_t)a2) >= 2)
    {
      unint64_t v24 = *(void *)(v4 + 32);
      if (v24)
      {
        uint64_t v25 = (_DWORD *)(*(void *)(v4 + 16) + 8LL);
        uint64_t v26 = *(void *)(v4 + 32);
        while (*((void *)v25 - 1) != v21)
        {
          v25 += 4;
          if (!--v26) {
            goto LABEL_15;
          }
        }

        LODWORD(v23) = *v25;
        if ((*v25 & 0x80000000) != 0) {
          goto LABEL_33;
        }
      }

      else
      {
LABEL_15:
        uint64_t v23 = *(void *)(v4 + 8) + 1LL;
        *(void *)(v4 + 8) = v23;
        unint64_t v27 = *(void *)(v4 + 24);
        if (v27 <= v24)
        {
          if (v27 >= 0x200) {
            uint64_t v29 = 2 * v27;
          }
          else {
            uint64_t v29 = 512LL;
          }
          uint64_t v28 = (char *)realloc(*(void **)(v4 + 16), 16 * v29);
          if (!v28) {
            goto LABEL_33;
          }
          *(void *)(v4 + 16) = v28;
          *(void *)(v4 + 24) = v29;
          unint64_t v24 = *(void *)(v4 + 32);
        }

        else
        {
          uint64_t v28 = *(char **)(v4 + 16);
        }

        uint64_t v30 = &v28[16 * v24];
        *(void *)uint64_t v30 = v21;
        *((_DWORD *)v30 + 2) = v23;
        *(void *)(v4 + 32) = v24 + 1;
        if ((v23 & 0x80000000) != 0)
        {
LABEL_33:
          int v11 = "No memory for ino translation table";
          goto LABEL_34;
        }
      }
    }

    else
    {
      uint64_t v22 = *(void *)(v4 + 8);
      LODWORD(v23) = v22 + 1;
      *(void *)(v4 + 8) = v22 + 1;
      if ((_DWORD)v22 + 1 < 0) {
        goto LABEL_33;
      }
    }

    if (v23 >= 0x8000)
    {
      int v11 = "Too many files for this cpio format";
      uint64_t v31 = (_DWORD *)a1;
      int v32 = 34;
LABEL_35:
      archive_set_error(v31, v32, v11, v6, v7, v8, v9, v10, v54);
LABEL_36:
      uint64_t v12 = 4294967266LL;
      goto LABEL_37;
    }
  }

  else
  {
    LOWORD(v23) = 0;
  }

  v56[2] = v23;
  __int16 v57 = archive_entry_mode((uint64_t)a2);
  int v33 = v57 & 0xF000;
  if (v33 == 49152 || v33 == 4096)
  {
    int v11 = "sockets and fifos cannot be represented in the binary cpio formats";
LABEL_28:
    uint64_t v31 = (_DWORD *)a1;
    int v32 = 22;
    goto LABEL_35;
  }

  if (v33 == 40960 && *(_DWORD *)(a1 + 16) == 65543)
  {
    int v11 = "symbolic links cannot be represented in the PWB cpio format";
    goto LABEL_28;
  }

  int v35 = v19 + 1;
  __int16 v58 = archive_entry_uid((uint64_t)a2);
  __int16 v59 = archive_entry_gid((uint64_t)a2);
  __int16 v60 = archive_entry_nlink((uint64_t)a2);
  if (archive_entry_filetype((uint64_t)a2) == 24576
    || archive_entry_filetype((uint64_t)a2) == 0x2000)
  {
    __int16 v36 = archive_entry_rdev(a2);
  }

  else
  {
    __int16 v36 = 0;
  }

  __int16 v61 = v36;
  HIDWORD(v37) = archive_entry_mtime((uint64_t)a2);
  LODWORD(v37) = HIDWORD(v37);
  int v62 = v37 >> 16;
  __int16 v63 = v19 + 1;
  if (sub_1806AA610((uint64_t)a2, &__s, &v55, v5))
  {
    if (*__error() == 12)
    {
      int v11 = "Can't allocate memory for Linkname";
      goto LABEL_34;
    }

    __int16 v38 = (char *)archive_entry_symlink((uint64_t)a2);
    sub_1806F7F14(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v39, v40, v41, v42, v43, v38);
    uint64_t v12 = 4294967276LL;
  }

  if (!v55 || !__s || !*__s)
  {
    if (*(_DWORD *)(a1 + 16) == 65543 && archive_entry_size((uint64_t)a2) >= 0x1000000)
    {
      char v49 = "File is too large for PWB binary cpio format.";
    }

    else
    {
      if (archive_entry_size((uint64_t)a2) < 0x80000000LL)
      {
        int v50 = archive_entry_size((uint64_t)a2);
        goto LABEL_61;
      }

      char v49 = "File is too large for binary cpio format.";
    }

    archive_set_error((_DWORD *)a1, 34, v49, v44, v45, v46, v47, v48, v54);
    uint64_t v12 = 4294967271LL;
    goto LABEL_37;
  }

  if (*(_DWORD *)(a1 + 16) == 65543)
  {
    int v11 = "symlinks are not supported by UNIX V6 or by PWB cpio";
    goto LABEL_28;
  }

  int v50 = strlen(__s);
LABEL_61:
  HIDWORD(v51) = v50;
  LODWORD(v51) = v50;
  int v64 = v51 >> 16;
  if (sub_1806FDA50(a1, (uint64_t)v56, 26LL)
    || sub_1806FDA50(a1, v65, v35)
    || (v35 & 1) != 0 && sub_1806FDAB0((void *)a1, 1uLL))
  {
    goto LABEL_36;
  }

  uint64_t v52 = archive_entry_size((uint64_t)a2);
  *(void *)uint64_t v4 = (v52 & 1) + v52;
  if (__s)
  {
    if (*__s)
    {
      size_t v53 = strlen(__s);
      if (sub_1806FDA50(a1, (uint64_t)__s, v53)
        || (strlen(__s) & 1) != 0 && sub_1806FDAB0((void *)a1, 1uLL))
      {
        goto LABEL_36;
      }
    }
  }

uint64_t archive_write_add_filter_by_name(_DWORD *a1, char *__s1)
{
  uint64_t v4 = 0LL;
  uint64_t v5 = "b64encode";
  while (strcmp(__s1, v5))
  {
    uint64_t v5 = (&off_18969EF48)[v4 + 2];
    v4 += 2LL;
    if (v4 == 26)
    {
      archive_set_error(a1, 22, "No such filter '%s'", v6, v7, v8, v9, v10, __s1);
      a1[1] = 0x8000;
      return 4294967266LL;
    }
  }

  return ((uint64_t (*)(_DWORD *))(&off_18969EF48)[v4 + 1])(a1);
}

uint64_t sub_180712A54(void *a1, size_t a2)
{
  return 0LL;
}

uint64_t archive_read_support_filter_lz4(int *a1)
{
  if (sub_180700FBC("lz4"))
  {
    uint64_t result = sub_1806A93F4(a1, 14594245, 1, "archive_read_support_filter_lz4", v3, v4, v5, v6);
    if ((_DWORD)result == -30) {
      return result;
    }
    sub_1806BB35C(a1, &v22, v8, v9, v10, v11, v12, v13);
    if (!v19)
    {
      *uint64_t v22 = 0LL;
      uint64_t v20 = v22;
      v22[1] = "lz4";
      v20[2] = sub_180712B3C;
      v20[3] = sub_180712BC4;
      v20[4] = 0LL;
      v20[5] = sub_180712C00;
      archive_set_error(a1, -1, "Using external lz4 program", v14, v15, v16, v17, v18, v21);
      return 4294967276LL;
    }
  }

  else
  {
    archive_set_error(a1, -1, "Filter not allow-listed in entitlements", v2, v3, v4, v5, v6, v21);
  }

  return 4294967266LL;
}

size_t sub_180712B3C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t result = sub_1806BB3C0(a2, 0xBuLL, &v9, a4, a5, a6, a7, a8);
  if (result)
  {
    if (*(_DWORD *)result == 407642370)
    {
      return 32LL;
    }

    else if (*(_DWORD *)result == 407708164 {
           && (*(_BYTE *)(result + 4) & 0xC2) == 0x40
    }
           && (*(_BYTE *)(result + 5) & 0xCF) == 0x40)
    {
      return 48LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_180712BC4(uint64_t a1)
{
  uint64_t result = sub_1806C46C0(a1, "lz4 -d -q");
  *(_DWORD *)(a1 + 104) = 13;
  *(void *)(a1 + 96) = "lz4";
  return result;
}

uint64_t sub_180712C00()
{
  return 0LL;
}

uint64_t archive_read_support_format_rar( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = calloc(0x4F20uLL, 1uLL);
  if (!v9)
  {
    archive_set_error(a1, 12, "Can't allocate rar data", v10, v11, v12, v13, v14, v18);
    return 4294967266LL;
  }

  uint64_t v15 = v9;
  *((_DWORD *)v9 + 5062) = -1;
  uint64_t v16 = sub_1806BB258( a1,  (uint64_t)v9,  "rar",  (uint64_t)sub_180712D00,  (uint64_t)sub_180712E40,  (uint64_t)sub_180712ED8,  (uint64_t)sub_1807132D4,  (uint64_t)sub_180714088,  (uint64_t)sub_180714120,  (uint64_t)sub_1807143FC,  (uint64_t)sub_180714474,  (uint64_t)sub_18071447C);
  if ((_DWORD)v16) {
    free(v15);
  }
  return v16;
}

uint64_t sub_180712D00( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 > 30) {
    return 0xFFFFFFFFLL;
  }
  v27[7] = v8;
  v27[8] = v9;
  size_t v12 = sub_1806BB3B8(a1, 7uLL, 0LL, a4, a5, a6, a7, a8);
  if (!v12) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)v12 == 561144146 && *(_DWORD *)(v12 + 3) == 465441) {
    return 30LL;
  }
  if ((*(_BYTE *)v12 != 77 || *(_BYTE *)(v12 + 1) != 90) && *(_DWORD *)v12 != 1179403647) {
    return 0LL;
  }
  uint64_t v19 = 0x10000LL;
  uint64_t v20 = 4096LL;
  size_t v21 = 69632LL;
  while (1)
  {
    size_t v22 = sub_1806BB3B8(a1, v21, v27, v13, v14, v15, v16, v17);
    if (!v22)
    {
      if (v20 < 128) {
        return 0LL;
      }
      uint64_t v20 = (unint64_t)v20 >> 1;
      goto LABEL_25;
    }

    uint64_t v23 = (_DWORD *)(v22 + v19);
    if (v22 + v19 + 7 < v22 + v27[0]) {
      break;
    }
LABEL_22:
    uint64_t v19 = (uint64_t)v23 - v22;
LABEL_25:
    size_t v21 = v20 + v19;
    if (v20 + v19 > 0x20000) {
      return 0LL;
    }
  }

  while (*v23 != 561144146 || *(_DWORD *)((char *)v23 + 3) != 465441)
  {
    uint64_t v25 = v23 + 4;
    uint64_t v26 = (char *)v23 + 23;
    v23 += 4;
    if ((unint64_t)v26 >= v22 + v27[0])
    {
      uint64_t v23 = v25;
      goto LABEL_22;
    }
  }

  return 30LL;
}

uint64_t sub_180712E40(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5 = **(void **)(a1 + 2472);
  if (a3 && *a3)
  {
    size_t v12 = sub_1806F7E1C(a1, a3, 0);
    *(void *)(v5 + 20192) = v12;
    if (v12) {
      return 0LL;
    }
    else {
      return 4294967266LL;
    }
  }

  else
  {
    archive_set_error((_DWORD *)a1, -1, "rar: hdrcharset option needs a character-set name", v6, v7, v8, v9, v10, v13);
    return 4294967271LL;
  }

uint64_t sub_180712ED8( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_DWORD *)(a1 + 16) = 851968;
  if (!*(void *)(a1 + 24)) {
    *(void *)(a1 + 24) = "RAR";
  }
  uint64_t v10 = **(int ***)(a1 + 2472);
  uint64_t v11 = v10 + 5062;
  if (v10[5062] == -1) {
    *uint64_t v11 = 0;
  }
  size_t v12 = (_BYTE *)sub_1806BB3B8(a1, 7uLL, 0LL, a4, a5, a6, a7, a8);
  if (!v12) {
    return 1LL;
  }
  if (!v10[62] && (*v12 == 77 && v12[1] == 90 || *(_DWORD *)v12 == 1179403647))
  {
    uint64_t v38 = 0LL;
    size_t v39 = 4096LL;
    while (1)
    {
LABEL_50:
      if (v39 + v38 > 0x20000)
      {
LABEL_62:
        uint64_t v46 = "Couldn't find out RAR header";
        goto LABEL_69;
      }

      size_t v40 = sub_1806BB3B8(a1, v39, &v48, v13, v14, v15, v16, v17);
      if (v40) {
        break;
      }
      BOOL v42 = v39 >= 0x80;
      v39 >>= 1;
      if (!v42) {
        goto LABEL_62;
      }
    }

    if (v48 < 64) {
      goto LABEL_62;
    }
    uint64_t v43 = 0LL;
    while (1)
    {
      size_t v44 = v40 + v43;
      if (*(_DWORD *)(v40 + v43) == 561144146 && *(_DWORD *)(v40 + v43 + 3) == 465441) {
        break;
      }
      v43 += 16LL;
      if (v44 + 23 >= v40 + v48)
      {
        sub_1806BB660(a1, v43, v41, v13, v14, v15, v16, v17);
        v38 += v43;
        goto LABEL_50;
      }
    }

    sub_1806BB660(a1, v43, v41, v13, v14, v15, v16, v17);
  }

  v10[62] = 1;
  uint64_t v18 = (unsigned __int16 *)sub_1806BB3B8(a1, 7uLL, 0LL, v13, v14, v15, v16, v17);
  if (!v18) {
    return 4294967266LL;
  }
  uint64_t v47 = a2;
  while (2)
  {
    int v20 = *((unsigned __int8 *)v18 + 2);
    switch(*((_BYTE *)v18 + 2))
    {
      case 'r':
        if (*(_DWORD *)v18 != 561144146 || *(_DWORD *)((char *)v18 + 3) != 465441)
        {
          uint64_t v46 = "Invalid marker header";
          goto LABEL_69;
        }

        size_t v34 = 7LL;
        goto LABEL_43;
      case 's':
        *uint64_t v10 = *(unsigned __int16 *)((char *)v18 + 3);
        size_t v34 = *(unsigned __int16 *)((char *)v18 + 5);
        int v35 = (unsigned __int16 *)sub_1806BB3B8(a1, v34, 0LL, v13, v14, v15, v16, v17);
        if (!v35) {
          return 4294967266LL;
        }
        *((_WORD *)v10 + 8) = *(unsigned __int16 *)((char *)v35 + 7);
        *(int *)((char *)v10 + 18) = *(_DWORD *)((char *)v35 + 9);
        int v36 = *v10;
        if ((*v10 & 0x200) == 0) {
          goto LABEL_41;
        }
        if (v34 <= 0xD)
        {
LABEL_66:
          uint64_t v46 = "Invalid header size";
          goto LABEL_69;
        }

        *((_BYTE *)v10 + 22) = *((_BYTE *)v35 + 13);
LABEL_41:
        if ((v36 & 0x80) != 0)
        {
          archive_entry_set_is_metadata_encrypted((uint64_t)v47, 1);
          archive_entry_set_is_data_encrypted((uint64_t)v47, 1);
          *uint64_t v11 = 1;
          uint64_t v46 = "RAR encryption support unavailable.";
          goto LABEL_69;
        }

LABEL_43:
        sub_1806BB660(a1, v34, v19, v13, v14, v15, v16, v17);
        goto LABEL_45;
      case 't':
        return sub_1807144A4(a1, (uint64_t)v47, (char)v20, v13, v14, v15, v16, v17);
      case 'u':
      case 'v':
      case 'w':
      case 'x':
      case 'y':
      case '{':
        size_t v21 = *(unsigned __int16 *)((char *)v18 + 5);
        if (v21 <= 0xA)
        {
LABEL_63:
          uint64_t v46 = "Invalid header size too small";
          goto LABEL_69;
        }

        uint64_t v18 = (unsigned __int16 *)sub_1806BB3B8(a1, v21, 0LL, v13, v14, v15, v16, v17);
        if (!v18) {
          return 4294967266LL;
        }
        v21 += *(unsigned int *)((char *)v18 + 7);
LABEL_18:
        int v22 = *v18;
        sub_1806BB660(a1, 2LL, v19, v13, v14, v15, v16, v17);
        unint64_t v23 = v21 - 2;
        if (v21 == 2)
        {
          LOWORD(v24) = 0;
LABEL_27:
          if (v22 != (unsigned __int16)v24)
          {
LABEL_65:
            uint64_t v46 = "Header CRC error";
            goto LABEL_69;
          }

          if (v20 == 123) {
            return 1LL;
          }
LABEL_45:
          uint64_t v18 = (unsigned __int16 *)sub_1806BB3B8(a1, 7uLL, 0LL, v13, v14, v15, v16, v17);
          if (!v18) {
            return 4294967266LL;
          }
          continue;
        }

        uLong v24 = 0LL;
        while (1)
        {
          uint64_t v25 = v23 >= 0x8000 ? 0x8000LL : v23;
          uint64_t v26 = (const Bytef *)sub_1806BB3B8(a1, v25, 0LL, v13, v14, v15, v16, v17);
          if (!v26) {
            break;
          }
          uLong v24 = crc32(v24, v26, v25);
          sub_1806BB660(a1, v25, v27, v28, v29, v30, v31, v32);
          v23 -= v25;
          if (!v23) {
            goto LABEL_27;
          }
        }

uint64_t sub_1807132D4( uint64_t a1, const Bytef **a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int64x2_t a9)
{
  uint64_t v10 = (void *)a3;
  uint64_t v13 = **(void **)(a1 + 2472);
  if (*(_DWORD *)(v13 + 20248) == -1) {
    *(_DWORD *)(v13 + 20248) = 0;
  }
  uint64_t v14 = *(void *)(v13 + 160);
  if (v14 >= 1)
  {
    sub_1806BB660(a1, v14, a3, (uint64_t)a4, a5, a6, a7, a8);
    *(void *)(v13 + 160) = 0LL;
  }

  *a2 = 0LL;
  if (*(_BYTE *)(v13 + 237) || *(void *)(v13 + 200) >= *(void *)(v13 + 40))
  {
    *uint64_t v10 = 0LL;
    uint64_t v141 = *(void *)(v13 + 184);
    *a4 = v141;
    if (v141 <= *(void *)(v13 + 40)) {
      uint64_t v141 = *(void *)(v13 + 40);
    }
    *a4 = v141;
    return 1LL;
  }

  int v15 = *(char *)(v13 + 23);
  if ((v15 - 49) >= 5)
  {
    if (v15 == 48)
    {
      uint64_t v143 = **(void **)(a1 + 2472);
      if (*(void *)(v143 + 168) || (*(_BYTE *)v143 & 1) != 0 && (*(_BYTE *)(v143 + 24) & 2) != 0)
      {
        uint64_t v144 = (const Bytef *)sub_1807150F0(a1, 1uLL, &v166, (uint64_t)a4, a5, a6, a7, a8);
        *a2 = v144;
        uint64_t v145 = v166;
        if (v166 > 0)
        {
          *uint64_t v10 = v166;
          *a4 = *(void *)(v143 + 184);
          *(void *)(v143 + 184) += v145;
          *(void *)(v143 + 200) += v145;
          uint64_t v146 = *(void *)(v143 + 168) - v145;
          *(void *)(v143 + 160) = v145;
          *(void *)(v143 + 168) = v146;
          uint64_t v17 = 0LL;
          *(void *)(v143 + 240) = crc32(*(void *)(v143 + 240), v144, v145);
          return v17;
        }

        uint64_t v147 = "Truncated RAR file data";
      }

      else
      {
        *a2 = 0LL;
        *uint64_t v10 = 0LL;
        *a4 = *(void *)(v143 + 184);
        if (*(void *)(v143 + 8) == *(void *)(v143 + 240))
        {
          uint64_t v17 = 1LL;
          *(_BYTE *)(v143 + 237) = 1;
          return v17;
        }

        uint64_t v147 = "File CRC error";
      }
    }

    else
    {
      uint64_t v147 = "Unsupported compression method for RAR file.";
    }

    archive_set_error((_DWORD *)a1, 79, v147, (uint64_t)a4, a5, a6, a7, a8, v153);
    return 4294967266LL;
  }

  uint64_t v155 = v10;
  uint64_t v156 = a4;
  uint64_t v16 = 0LL;
  while (2)
  {
    uint64_t v17 = 0LL;
    uint64_t v154 = v16 + 1;
    uint64_t v18 = **(void **)(a1 + 2472);
    v162 = (unsigned __int16 **)(v18 + 928);
    uint64_t v165 = v18 + 20112;
LABEL_10:
    while (2)
    {
      if (!*(_BYTE *)(v18 + 208)) {
        goto LABEL_214;
      }
      if (*(_BYTE *)(v18 + 922)) {
        goto LABEL_215;
      }
      if (*(_DWORD *)(v18 + 232))
      {
        a3 = *(void *)(v18 + 184);
        if (a3 >= *(void *)(v18 + 40))
        {
LABEL_215:
          uint64_t v149 = *(unsigned int *)(v18 + 212);
          if ((_DWORD)v149)
          {
            __int16 v150 = *(const Bytef **)(v18 + 224);
            *a2 = v150;
            *uint64_t v155 = v149;
            *uint64_t v156 = *(void *)(v18 + 192);
            *(void *)(v18 + 192) += v149;
            uint64_t v17 = 0LL;
            *(void *)(v18 + 240) = crc32(*(void *)(v18 + 240), v150, v149);
            *(_DWORD *)(v18 + 212) = 0;
            return v17;
          }

          *a2 = 0LL;
          *uint64_t v155 = 0LL;
          *uint64_t v156 = *(void *)(v18 + 184);
          if (*(void *)(v18 + 8) == *(void *)(v18 + 240))
          {
            uint64_t v17 = 1LL;
            *(_BYTE *)(v18 + 237) = 1;
            goto LABEL_230;
          }

          unint64_t v148 = "File CRC error";
LABEL_213:
          archive_set_error((_DWORD *)a1, 79, v148, (uint64_t)a4, a5, a6, a7, a8, v153);
LABEL_214:
          uint64_t v17 = 4294967266LL;
LABEL_230:
          sub_1806ECB78(v13 + 928);
          *(_WORD *)(v13 + 920) = 1;
          return v17;
        }

        if (!*(_BYTE *)(v18 + 923))
        {
          uint64_t v92 = *(void *)(v18 + 176);
          if (v92 >= 1)
          {
            int v93 = *(_DWORD *)(v18 + 212);
            else {
              uint64_t v94 = *(void *)(v18 + 176);
            }
            uint64_t v95 = sub_1807151C4(a1, a2, a3, v94, a5, a6, a7, a8);
            if ((_DWORD)v95)
            {
              uint64_t v17 = v95;
              goto LABEL_228;
            }

            uint64_t v96 = *(void *)(v18 + 184) + v94;
            *(void *)(v18 + 176) -= v94;
            *(void *)(v18 + 184) = v96;
            uint64_t v97 = *a2;
            if (!*a2)
            {
              uint64_t v17 = 0LL;
              continue;
            }

            *(_DWORD *)(v18 + 212) = 0;
            uint64_t v152 = *(unsigned int *)(v18 + 216);
            *uint64_t v155 = v152;
            *uint64_t v156 = *(void *)(v18 + 192);
            *(void *)(v18 + 192) += v152;
            uint64_t v17 = 0LL;
            *(void *)(v18 + 240) = crc32(*(void *)(v18 + 240), v97, v152);
            return v17;
          }
        }
      }

      break;
    }

    if (*(void *)(v18 + 20240)) {
      goto LABEL_21;
    }
    if (*(uint64_t *)(**(void **)(a1 + 2472) + 168LL) >= 1)
    {
      size_t v19 = sub_1807150F0(a1, 1uLL, (uint64_t *)(v18 + 20232), (uint64_t)a4, a5, a6, a7, a8);
      *(void *)(v18 + 20240) = v19;
      if (v19)
      {
        if (!*(_DWORD *)(v18 + 20224)) {
          a9 = sub_180715AD0(a1, (unint64_t *)(v18 + 20216), a3, (uint64_t)a4, a5, a6, a7, a8, a9);
        }
        goto LABEL_20;
      }

      unint64_t v148 = "Truncated RAR file data";
      goto LABEL_213;
    }

LABEL_212:
      unint64_t v148 = "Invalid symbol";
      goto LABEL_213;
    }

    break;
  }

  uint64_t v157 = *(void *)(v18 + 184);
  uint64_t v158 = a2;
  uint64_t v23 = v157 + *(unsigned int *)(v18 + 232);
  *(void *)(v18 + 912) = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v24 = **(void **)(a1 + 2472);
  uint64_t v164 = (unint64_t *)(v24 + 20216);
  if (*(void *)(v24 + 912) >= v23) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = *(void *)(v24 + 912);
  }
  int v163 = (int *)(v24 + 20224);
  uint64_t v153 = (char *)(v24 + 360);
  uint64_t v160 = (int *)(v24 + 884);
  uint64_t v161 = v25;
  uint64_t v159 = (void *)(v24 + 888);
  while (1)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v17 = *(void *)(v24 + 864);
        if (*(_BYTE *)(v24 + 872))
        {
          uint64_t v26 = *(unsigned int *)(v24 + 876);
          if (v17 + v26 > v25) {
            goto LABEL_192;
          }
          if ((int)v26 >= 1)
          {
            int v27 = *(_DWORD *)(v24 + 856);
            int v28 = v27 & v17;
            int v29 = ((v27 & v17) - *(_DWORD *)(v24 + 880)) & v27;
            int v30 = *(_DWORD *)(v24 + 876);
            do
            {
              if (v28 <= v29) {
                int v31 = v29;
              }
              else {
                int v31 = v28;
              }
              int v32 = v27 - v31;
              if (v30 >= v32 + 1) {
                uint64_t v33 = (v32 + 1);
              }
              else {
                uint64_t v33 = v30;
              }
              uint64_t v34 = *(void *)(v24 + 848);
              int v35 = (_BYTE *)(v34 + v28);
              int v36 = (char *)(v34 + v29);
              int v37 = v33 + v28;
              int v38 = v33 + v29;
              BOOL v39 = (int)v33 + v28 < v29 || v38 < v28;
              if (v39)
              {
                memcpy(v35, v36, (int)v33);
              }

              else if ((int)v33 >= 1)
              {
                uint64_t v40 = v33;
                do
                {
                  char v41 = *v36++;
                  *v35++ = v41;
                  --v40;
                }

                while (v40);
              }

              int v27 = *(_DWORD *)(v24 + 856);
              int v28 = v27 & v37;
              int v29 = v27 & v38;
              BOOL v42 = __OFSUB__(v30, (_DWORD)v33);
              v30 -= v33;
            }

            while (!((v30 < 0) ^ v42 | (v30 == 0)));
            uint64_t v17 = *(void *)(v24 + 864);
          }

          v17 += (int)v26;
          *(void *)(v24 + 864) = v17;
          *(_BYTE *)(v24 + 872) = 0;
        }

        if (*(_BYTE *)(v24 + 923)) {
          BOOL v43 = 0;
        }
        else {
          BOOL v43 = v17 < v25;
        }
        if (!v43) {
          goto LABEL_192;
        }
        unsigned int v44 = sub_180716018(a1, v24 + 280, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
        if ((v44 & 0x80000000) != 0) {
          goto LABEL_227;
        }
        unsigned int v45 = v44;
        *(_BYTE *)(v24 + 872) = 0;
        if (v44 > 0xFF) {
          break;
        }
        *(_BYTE *)(*(void *)(v24 + 848) + (*(_DWORD *)(v24 + 856) & *(_DWORD *)(v24 + 864))) = v44;
        ++*(void *)(v24 + 864);
      }

      if (v44 == 256) {
        break;
      }
      if (v44 == 258)
      {
        int v49 = *(_DWORD *)(v24 + 876);
        if (v49)
        {
          int v47 = *(_DWORD *)(v24 + 880);
          goto LABEL_130;
        }
      }

      else
      {
        if (v44 == 257)
        {
          archive_set_error((_DWORD *)a1, -1, "Parsing filters is unsupported.", (uint64_t)a4, a5, a6, a7, a8, v153);
          uint64_t v17 = -25LL;
          goto LABEL_228;
        }

        if (v44 <= 0x106)
        {
          unint64_t v46 = v44 - 259;
          int v47 = *(_DWORD *)(v24 + 4LL * v46 + 884);
          unsigned int v48 = sub_180716018(a1, v24 + 400, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
          if (v48 > 0x1C) {
            goto LABEL_225;
          }
          int v49 = byte_180720CA4[v48] + 2;
          if (v48 >= 8)
          {
            int v50 = byte_180720CC0[v48];
            unint64_t v51 = (int *)(v24 + 20224);
            int v52 = *v163;
            if (*v163 < v50)
            {
              a9 = sub_180715AD0(a1, v164, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
              int v52 = *v163;
              if (v53)
              {
                unint64_t v51 = (int *)(v24 + 20224);
              }

              else
              {
                unint64_t v51 = (int *)(v24 + 20224);
                if (v52 < v50) {
                  goto LABEL_226;
                }
              }
            }

            int v73 = v52 - v50;
            v49 += dword_180720C14[v50] & (*v164 >> v73);
            int *v51 = v73;
            uint64_t v25 = v161;
          }

          if (v45 >= 0x104)
          {
            do
            {
              BOOL v39 = v46 > 1;
              v160[v46] = *(_DWORD *)(v24 + 4LL * (v46 - 1) + 884);
              --v46;
            }

            while (v39);
          }

          *uint64_t v160 = v47;
          goto LABEL_130;
        }

        if (v44 > 0x10E)
        {
          if (v44 > 0x12B) {
            goto LABEL_225;
          }
          uint64_t v62 = v44 - 271;
          int v63 = byte_180720CA4[v62] + 3;
          if (v62 >= 8)
          {
            int v64 = byte_180720CC0[v62];
            uint64_t v65 = (int *)(v24 + 20224);
            int v66 = *v163;
            if (*v163 < v64)
            {
              a9 = sub_180715AD0(a1, v164, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
              int v66 = *v163;
              if (v67)
              {
                uint64_t v65 = (int *)(v24 + 20224);
              }

              else
              {
                uint64_t v65 = (int *)(v24 + 20224);
                if (v66 < v64) {
                  goto LABEL_226;
                }
              }
            }

            int v74 = v66 - v64;
            v63 += dword_180720C14[v64] & (*v164 >> v74);
            *uint64_t v65 = v74;
            uint64_t v25 = v161;
          }

          unsigned int v75 = sub_180716018(a1, v24 + 320, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
          if (v75 > 0x3C)
          {
LABEL_225:
            archive_set_error((_DWORD *)a1, 79, "Bad RAR file data", (uint64_t)a4, a5, a6, a7, a8, v153);
LABEL_227:
            uint64_t v17 = -30LL;
            goto LABEL_228;
          }

          int v47 = dword_180720CDC[v75] + 1;
          if (v75 >= 4)
          {
            uint64_t v76 = byte_180720DCC[v75];
            if (v75 < 0xA)
            {
              __int16 v81 = (_DWORD *)(v24 + 20224);
              int v82 = *v163;
              if (*v163 < (int)v76)
              {
                a9 = sub_180715AD0(a1, v164, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
                int v82 = *v163;
                if (v83)
                {
                  __int16 v81 = (_DWORD *)(v24 + 20224);
                }

                else
                {
                  __int16 v81 = (_DWORD *)(v24 + 20224);
                }
              }

              int v84 = v82 - v76;
              v47 += dword_180720C14[v76] & (*v164 >> v84);
              *__int16 v81 = v84;
LABEL_122:
              uint64_t v25 = v161;
            }

            else
            {
              if ((unint64_t)v75 - 12 <= 0x2F)
              {
                uint64_t v77 = (_DWORD *)(v24 + 20224);
                int v78 = *v163;
                uint64_t v79 = v76 - 4;
                if (*v163 < (int)v79)
                {
                  a9 = sub_180715AD0(a1, v164, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
                  int v78 = *v163;
                  if (v80)
                  {
                    uint64_t v77 = (_DWORD *)(v24 + 20224);
                  }

                  else
                  {
                    uint64_t v77 = (_DWORD *)(v24 + 20224);
                  }
                }

                int v85 = v78 - v79;
                v47 += 16 * (dword_180720C14[v79] & (*v164 >> v85));
                *uint64_t v77 = v85;
              }

              int v86 = *(_DWORD *)(v24 + 904);
              if (v86)
              {
                *(_DWORD *)(v24 + 904) = v86 - 1;
                v47 += *(_DWORD *)(v24 + 900);
                goto LABEL_122;
              }

              int v89 = sub_180716018(a1, (uint64_t)v153, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
              uint64_t v25 = v161;
              if (v89 < 0) {
                goto LABEL_227;
              }
              if (v89 == 16)
              {
                *(_DWORD *)(v24 + 904) = 15;
                v47 += *(_DWORD *)(v24 + 900);
              }

              else
              {
                v47 += v89;
                *(_DWORD *)(v24 + 900) = v89;
              }
            }
          }

          if (v47 < 0x40000) {
            int v87 = v63;
          }
          else {
            int v87 = v63 + 1;
          }
          uint64_t v88 = *(void *)v160;
          *(_DWORD *)(v24 + 896) = *(_DWORD *)(v24 + 892);
          *uint64_t v159 = v88;
          if (v47 < 0x2000) {
            int v49 = v87;
          }
          else {
            int v49 = v87 + 1;
          }
          *uint64_t v160 = v47;
          goto LABEL_130;
        }

        int v57 = byte_180720E08[v44 - 263];
        int v58 = byte_180720E10[v44 - 263];
        __int16 v59 = (int *)(v24 + 20224);
        int v60 = *v163;
        if (*v163 < v58)
        {
          a9 = sub_180715AD0(a1, v164, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
          int v60 = *v163;
          if (v61)
          {
            __int16 v59 = (int *)(v24 + 20224);
          }

          else
          {
            __int16 v59 = (int *)(v24 + 20224);
            if (v60 < v58) {
              goto LABEL_226;
            }
          }
        }

        int v70 = v60 - v58;
        int v71 = dword_180720C14[v58] & (*v164 >> v70);
        *__int16 v59 = v70;
        uint64_t v25 = v161;
        int v72 = *(_DWORD *)(v24 + 892);
        *uint64_t v159 = *(void *)v160;
        *(_DWORD *)(v24 + 896) = v72;
        int v47 = v57 + 1 + v71;
        *uint64_t v160 = v47;
        int v49 = 2;
LABEL_130:
        *(_DWORD *)(v24 + 880) = v47;
        *(_DWORD *)(v24 + 876) = v49;
        *(_BYTE *)(v24 + 872) = 1;
      }
    }

    uint64_t v54 = (int *)(v24 + 20224);
    int v55 = *v163;
    if (*v163 <= 0)
    {
      a9 = sub_180715AD0(a1, v164, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
      int v55 = *v163;
      if (v56)
      {
        uint64_t v54 = (int *)(v24 + 20224);
      }

      else
      {
        uint64_t v54 = (int *)(v24 + 20224);
        if (v55 < 1) {
          goto LABEL_226;
        }
      }
    }

    unint64_t v68 = *v164;
    int v69 = v55 - 1;
    *uint64_t v54 = v55 - 1;
    uint64_t v25 = v161;
  }

  *(_BYTE *)(v24 + 236) = 1;
  if (v55 <= 1)
  {
    sub_180715AD0(a1, v164, a3, (uint64_t)a4, a5, a6, a7, a8, a9);
    int v69 = *v54;
    if (!v135 && v69 < 1)
    {
LABEL_226:
      archive_set_error((_DWORD *)a1, 79, "Truncated RAR file data", (uint64_t)a4, a5, a6, a7, a8, v153);
      *(_BYTE *)(v24 + 208) = 0;
      goto LABEL_227;
    }

    unint64_t v68 = *v164;
  }

  int v136 = v69 - 1;
  *(_BYTE *)(v24 + 920) = (v68 >> v136) & 1;
  *uint64_t v54 = v136;
  uint64_t v17 = *(void *)(v24 + 864);
LABEL_192:
  if (v17 < 0) {
    goto LABEL_228;
  }
  a2 = v158;
  uint64_t v134 = v17 - v157;
  *(void *)(v18 + 176) = v17 - v157;
  if (v17 == v157)
  {
    unint64_t v148 = "Internal error extracting RAR file";
    goto LABEL_213;
  }

LABEL_228:
  if ((_DWORD)v17 != -20 && (_DWORD)v17) {
    goto LABEL_230;
  }
  return v17;
}

uint64_t sub_180714088( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  while (1)
  {
    uint64_t v9 = *(uint64_t **)(a1 + 2472);
    uint64_t v10 = *v9;
    uint64_t v11 = *(void *)(*v9 + 160);
    if (v11 >= 1)
    {
      sub_1806BB660(a1, v11, a3, a4, a5, a6, a7, a8);
      *(void *)(v10 + 160) = 0LL;
    }

    uint64_t v12 = *(void *)(v10 + 168);
    if (v12 >= 1 && sub_1806BB660(a1, v12, a3, a4, a5, a6, a7, a8) < 0) {
      break;
    }
    if ((*(_BYTE *)v10 & 1) == 0 || (*(_BYTE *)(v10 + 24) & 2) == 0) {
      return 0LL;
    }
    uint64_t result = sub_180712ED8(a1, *(char **)(a1 + 160), a3, a4, a5, a6, a7, a8);
    if ((_DWORD)result == 1) {
      uint64_t result = sub_180712ED8(a1, *(char **)(a1 + 160), a3, a4, a5, a6, a7, a8);
    }
    if ((_DWORD)result) {
      return result;
    }
  }

  return 4294967266LL;
}

uint64_t sub_180714120( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(void **)(a1 + 2472);
  if (*(_BYTE *)(v9 + 23) != 48)
  {
    uint64_t v11 = "Seeking of compressed RAR files is unsupported";
LABEL_6:
    archive_set_error((_DWORD *)a1, -1, v11, a4, a5, a6, a7, a8, v46);
    return -25LL;
  }

  if (a3 == 2)
  {
    uint64_t v10 = (uint64_t *)(v9 + 40);
  }

  else
  {
    if (a3 != 1)
    {
      uint64_t v13 = 0LL;
      goto LABEL_10;
    }

    uint64_t v10 = (uint64_t *)(v9 + 200);
  }

  uint64_t v13 = *v10;
LABEL_10:
  uint64_t v14 = v13 + a2;
  if (v13 + a2 < 0) {
    return -1LL;
  }
  uint64_t v15 = *(void *)(v9 + 40);
  if (v14 > v15)
  {
    *(void *)(v9 + 200) = v14;
    uint64_t v14 = v15;
  }

  uint64_t v16 = *(void *)(v9 + 256);
  uint64_t v17 = *(void *)(v16 + 8) + v14;
  unsigned int v18 = *(_DWORD *)(v9 + 264);
  if (v18)
  {
    size_t v19 = (void *)(v16 + 32);
    uint64_t v20 = *(unsigned int *)(v9 + 264);
    do
    {
      uint64_t v17 = *v19 + v17 - *(v19 - 2);
      v19 += 3;
      --v20;
    }

    while (v20);
  }

  if ((*(_BYTE *)v9 & 1) == 0) {
    goto LABEL_17;
  }
  do
  {
    while (1)
    {
      uint64_t v28 = *(void *)(v16 + 24LL * v18 + 8);
      if (v17 < v28 && (*(_BYTE *)(v9 + 24) & 1) != 0) {
        break;
      }
      uint64_t v29 = *(void *)(v16 + 24LL * v18 + 16);
      if (v17 <= v29 || (*(_BYTE *)(v9 + 24) & 2) == 0) {
        goto LABEL_17;
      }
      unsigned int v30 = v18 + 1;
      *(_DWORD *)(v9 + 264) = v18 + 1;
      if (v18 + 1 >= *(_DWORD *)(v9 + 268) || v17 <= *(void *)(v16 + 24LL * v30 + 16))
      {
        *(_DWORD *)(v9 + 264) = v18;
        uint64_t result = sub_1806BB830(a1, v29, 0);
        if (result < 0) {
          return result;
        }
        int v38 = sub_180712ED8(a1, *(char **)(a1 + 160), v32, v33, v34, v35, v36, v37);
        if (v38 == 1)
        {
          *(_BYTE *)(v9 + 252) = 1;
          int v38 = sub_180712ED8(a1, *(char **)(a1 + 160), v39, a4, a5, a6, a7, a8);
        }

        if (v38) {
          goto LABEL_44;
        }
        uint64_t v16 = *(void *)(v9 + 256);
        unsigned int v18 = *(_DWORD *)(v9 + 264);
        uint64_t v17 = *(void *)(v16 + 24LL * v18 + 8) + v17 - *(void *)(v16 + 24LL * (v18 - 1) + 16);
      }

      else
      {
        uint64_t v17 = v17 - v29 + *(void *)(v16 + 24LL * v30 + 8);
        ++v18;
      }
    }

    if (!v18)
    {
      uint64_t v11 = "Attempt to seek past beginning of RAR data block";
      goto LABEL_6;
    }

    *(_DWORD *)(v9 + 264) = --v18;
    uint64_t v31 = *(void *)(v16 + 24LL * v18 + 8);
    v17 += *(void *)(v16 + 24LL * v18 + 16) - v28;
  }

  while (v17 < v31);
  uint64_t result = sub_1806BB830(a1, v31 - *(void *)(v16 + 24LL * v18), 0);
  if ((result & 0x8000000000000000LL) == 0)
  {
    if (sub_180712ED8(a1, *(char **)(a1 + 160), v40, v41, v42, v43, v44, v45))
    {
LABEL_44:
      uint64_t v11 = "Error during seek of RAR file";
      goto LABEL_6;
    }

    --*(_DWORD *)(v9 + 264);
LABEL_17:
    uint64_t result = sub_1806BB830(a1, v17, 0);
    if ((result & 0x8000000000000000LL) == 0)
    {
      uint64_t v21 = *(void *)(v9 + 256);
      uint64_t v22 = *(unsigned int *)(v9 + 264);
      *(void *)(v9 + 168) = *(void *)(v21 + 24LL * v22 + 16) - result;
      if ((_DWORD)v22)
      {
        uint64_t v23 = (uint64_t *)(v21 + 24LL * v22 + 8);
        uint64_t v24 = v22 - 1;
        do
        {
          uint64_t v25 = *v23;
          v23 -= 3;
          uint64_t v26 = v24;
          uint64_t result = result - v25 + *(void *)(v21 + 24LL * v24-- + 16);
        }

        while (v26);
      }

      uint64_t v27 = result - *(void *)(v21 + 8);
      sub_1806BB0F8(a1);
      *(void *)(v9 + 160) = 0LL;
      *(void *)(v9 + 184) = 0LL;
      if (v27 != *(void *)(v9 + 40) || (uint64_t result = *(void *)(v9 + 200), result <= v27))
      {
        *(void *)(v9 + 200) = v27;
        return v27;
      }
    }
  }

  return result;
}

uint64_t sub_1807143FC(uint64_t a1)
{
  uint64_t v2 = **(void ****)(a1 + 2472);
  sub_180715D0C(a1);
  free(v2[9]);
  free(v2[10]);
  free(v2[32]);
  free(v2[28]);
  free(v2[106]);
  sub_1806ECB78((uint64_t)(v2 + 116));
  free(v2);
  **(void **)(a1 + 2472) = 0LL;
  return 0LL;
}

uint64_t sub_180714474()
{
  return 3LL;
}

uint64_t sub_18071447C(uint64_t a1)
{
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_1807144A4( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = **(void **)(a1 + 2472);
  uint64_t v12 = (_DWORD *)(v11 + 20176);
  uint64_t v13 = *(void *)(v11 + 20192);
  if (!v13)
  {
    if (*v12)
    {
      uint64_t v13 = *(void *)(v11 + 20184);
    }

    else
    {
      uint64_t v13 = sub_1806F7E68();
      *(void *)(v11 + 20184) = v13;
      *uint64_t v12 = 1;
    }
  }

  uint64_t v14 = (unsigned __int8 *)sub_1806BB3B8(a1, 7uLL, 0LL, a4, a5, a6, a7, a8);
  if (!v14) {
    return 4294967266LL;
  }
  int v20 = *v14;
  int v21 = v14[1];
  uint64_t v22 = *(unsigned __int16 *)(v14 + 5);
  *(_DWORD *)(v11 + 24) = *(unsigned __int16 *)(v14 + 3);
  uLong v24 = crc32(0LL, v14 + 2, 5u);
  sub_1806BB660(a1, 7LL, v25, v26, v27, v28, v29, v30);
  if ((*(_BYTE *)(v11 + 24) & 0x10) != 0)
  {
    uint64_t v23 = "RAR solid archive support unavailable.";
    goto LABEL_59;
  }

  uint64_t v109 = a2;
  int v110 = a3;
  *(void *)(v11 + 32) = 0LL;
  *(_BYTE *)(v11 + 23) = 0;
  *(_WORD *)(v11 + 64) = 0;
  *(void *)(v11 + 104) = 0LL;
  *(void *)(v11 + 48) = 0LL;
  *(void *)(v11 + 56) = 0LL;
  *(void *)(v11 + 40) = 0LL;
  *(_OWORD *)(v11 + 112) = 0u;
  *(_OWORD *)(v11 + 128) = 0u;
  *(_OWORD *)(v11 + 144) = 0u;
  uint64_t v31 = (const Bytef *)sub_1806BB3B8(a1, v22 - 7, 0LL, v15, v16, v17, v18, v19);
  if (!v31) {
    return 4294967266LL;
  }
  uint64_t v32 = v31;
  if ((v20 | (v21 << 8)) != (unsigned __int16)crc32(v24, v31, (int)v22 - 7))
  {
    uint64_t v23 = "Header CRC error";
    goto LABEL_59;
  }

  uint64_t v36 = *(unsigned int *)v32;
  uint64_t v35 = *((unsigned int *)v32 + 1);
  uint64_t v37 = *(unsigned int *)(v32 + 9);
  unsigned int v38 = *(_DWORD *)(v32 + 13);
  uint64_t v107 = v32[19];
  uint64_t v105 = v32[20];
  int v103 = *(_DWORD *)(v32 + 21);
  unsigned int v104 = *((char *)v32 + 8);
  *(_BYTE *)(v11 + 23) = v32[18];
  *(void *)(v11 + 48) = sub_180714E14(v38, v33, v34);
  *(void *)(v11 + 8) = v37;
  int v39 = *(_DWORD *)(v11 + 24);
  if ((v39 & 4) != 0)
  {
    archive_entry_set_is_data_encrypted(a2, 1);
    *(_DWORD *)(v11 + 20248) = 1;
    archive_set_error((_DWORD *)a1, 79, "RAR encryption support unavailable.", v40, v41, v42, v43, v44, v102);
    int v39 = *(_DWORD *)(v11 + 24);
  }

  if ((v39 & 0x100) != 0)
  {
    v36 |= (unint64_t)*(unsigned int *)(v32 + 25) << 32;
    unint64_t v49 = v35 | ((unint64_t)*(unsigned int *)(v32 + 29) << 32);
    *(void *)(v11 + 32) = v36;
    *(void *)(v11 + 40) = v49;
    if (v36 < 0 || (v49 & 0x8000000000000000LL) != 0)
    {
      uint64_t v23 = "Invalid sizes specified.";
      goto LABEL_59;
    }

    uint64_t v45 = (char *)(v32 + 33);
  }

  else
  {
    uint64_t v45 = (char *)(v32 + 25);
    *(void *)(v11 + 32) = v36;
    *(void *)(v11 + 40) = v35;
  }

  *(void *)(v11 + 168) = v36;
  if (v110 == 122)
  {
    unint64_t v46 = v45;
    v22 += v36;
    size_t v47 = sub_1806BB3B8(a1, v22 - 7, 0LL, v15, v16, v17, v18, v19);
    if (v47)
    {
      unsigned int v48 = (char *)(v22 - 7 + v47);
      uint64_t v45 = (char *)(v47 + v46 - (char *)v32);
      goto LABEL_25;
    }

    return 4294967266LL;
  }

  unsigned int v48 = (char *)&v32[v22 - 7];
LABEL_25:
  size_t v50 = v107 | (v105 << 8);
  if (&v45[v50] > v48)
  {
    uint64_t v23 = "Invalid filename size";
    goto LABEL_59;
  }

  unint64_t v106 = (unint64_t)v48;
  int v108 = (unsigned __int16 *)&v45[v50];
  unint64_t v51 = (2 * v50 + 2);
  int v52 = *(unsigned __int16 **)(v11 + 72);
  if (*(void *)(v11 + 96) < v51)
  {
    int v53 = v45;
    uint64_t v54 = (unsigned __int16 *)realloc(*(void **)(v11 + 72), (2 * v50 + 2));
    if (!v54) {
      goto LABEL_81;
    }
    int v52 = v54;
    *(void *)(v11 + 72) = v54;
    *(void *)(v11 + 96) = v51;
    uint64_t v45 = v53;
  }

  uint64_t v55 = (uint64_t)v45;
  memcpy(v52, v45, v50);
  *((_BYTE *)v52 + v50) = 0;
  if ((*(_BYTE *)(v11 + 25) & 2) != 0)
  {
    size_t v58 = strlen((const char *)v52);
    if (v58 == v50)
    {
      int v57 = *(void **)(v11 + 20200);
      if (!v57)
      {
        int v57 = sub_1806F7E1C(a1, "UTF-8", 1);
        *(void *)(v11 + 20200) = v57;
        if (!v57) {
          return 4294967266LL;
        }
      }
    }

    else
    {
      unsigned int v60 = v58 + 1;
      uint64_t v16 = v55;
      uint64_t v17 = (2 * v50);
      if (v60 < v50 && (_DWORD)v50) {
        __asm { BR              X15 }
      }

      *int v52 = 0;
      int v61 = *(void **)(v11 + 20208);
      if (!v61)
      {
        uint64_t v62 = sub_1806F7E1C(a1, "UTF-16BE", 1);
        uint64_t v16 = v55;
        *(void *)(v11 + 20208) = v62;
        int v61 = v62;
        if (!v62) {
          return 4294967266LL;
        }
      }

      LODWORD(v50) = 1;
      int v57 = v61;
      if (*v52)
      {
        int v63 = v52 + 1;
        do
        {
          if (*(v63 - 1) == 23552) {
            *((_BYTE *)v63 - 1) = 47;
          }
        }

        while (*v63++);
      }

      int v108 = (unsigned __int16 *)(v16 + v60);
    }
  }

  else
  {
    int v57 = (void *)v13;
  }

  uint64_t v65 = *(void **)(v11 + 80);
  if (v65
    && *(void *)(v11 + 88) == v50
    && !memcmp(*(const void **)(v11 + 72), *(const void **)(v11 + 80), (v50 + 1)))
  {
    sub_1806BB660(a1, v22 - 7, v66, v15, v16, v17, v18, v19);
    unsigned int v77 = *(_DWORD *)(v11 + 264) + 1;
    *(_DWORD *)(v11 + 264) = v77;
    unsigned int v78 = *(_DWORD *)(v11 + 268);
    if (v77 < v78)
    {
      uint64_t v79 = *(char **)(v11 + 256);
      if ((*(void *)&v79[24 * v77 + 8] & 0x8000000000000000LL) == 0) {
        return 0LL;
      }
      goto LABEL_80;
    }

    unsigned int v84 = v78 + 1;
    *(_DWORD *)(v11 + 268) = v84;
    int v85 = (char *)realloc(*(void **)(v11 + 256), 24LL * v84);
    *(void *)(v11 + 256) = v85;
    if (v85)
    {
      uint64_t v79 = v85;
      unsigned int v77 = *(_DWORD *)(v11 + 264);
      int v86 = &v85[24 * v77];
      *(void *)int v86 = v22;
      *((void *)v86 + 1) = -1LL;
      *((void *)v86 + 2) = -1LL;
LABEL_80:
      uint64_t result = 0LL;
      int v87 = &v79[24 * v77];
      uint64_t v88 = **(void **)(a1 + 1032);
      uint64_t v89 = *(void *)(v11 + 32) + v88;
      *((void *)v87 + 1) = v88;
      *((void *)v87 + 2) = v89;
      return result;
    }

time_t sub_180714E14(unsigned int a1, double a2, uint32x4_t a3)
{
  a3.i32[0] = a1;
  int8x16_t v3 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(a1), (uint32x4_t)xmmword_180720E40);
  v3.i32[0] = vshlq_u32(a3, (uint32x4_t)xmmword_180720E30).u32[0];
  *(int8x16_t *)&v5.tm_sec = vandq_s8(v3, (int8x16_t)xmmword_180720E50);
  v5.tm_mon = ((a1 >> 21) & 0xF) - 1;
  v5.int tm_year = (a1 >> 25) + 80;
  v5.tm_isdst = -1;
  return mktime(&v5);
}

uint64_t sub_180714E84(unsigned __int16 *a1, void *a2, unint64_t a3, double a4, uint32x4_t a5)
{
  tm v5 = (unsigned int *)(a1 + 1);
  uint64_t v25 = a2 + 17;
  uint64_t v26 = a2 + 15;
  unsigned int v9 = *a1;
  uint64_t v10 = a2 + 19;
  uint64_t v11 = a2 + 7;
  int v12 = 3;
  do
  {
    int v13 = v12;
    time_t v28 = 0LL;
    if (v12 == 3)
    {
      time_t v14 = a2[6];
      time_t v28 = v14;
      unsigned int v15 = v9 >> 12;
      if (((v9 >> 12) & 8) == 0) {
        goto LABEL_29;
      }
      if (v14) {
        goto LABEL_11;
      }
    }

    else
    {
      unsigned int v15 = v9 >> (4 * v12);
      if ((v15 & 8) == 0) {
        goto LABEL_29;
      }
    }

    time_t v28 = sub_180714E14(*v5++, a4, a5);
LABEL_11:
    uint64_t v16 = v15 & 3;
    unsigned int v17 = 0;
    if ((v15 & 3) != 0)
    {
      uint64_t v18 = (v16 - 1);
      uint64_t v19 = v5;
      do
      {
        int v20 = *(unsigned __int8 *)v19;
        uint64_t v19 = (unsigned int *)((char *)v19 + 1);
        unsigned int v17 = (v20 << 16) | (v17 >> 8);
        LODWORD(v16) = v16 - 1;
      }

      while ((_DWORD)v16);
      tm v5 = (unsigned int *)((char *)v5 + v18 + 1);
    }

    int v21 = localtime_r(&v28, &v27);
    unsigned int tm_sec = v21->tm_sec;
    if (v17 <= 0x98967F) {
      uint64_t v23 = tm_sec;
    }
    else {
      uint64_t v23 = tm_sec + 1;
    }
    if ((v15 & 4) != 0)
    {
      v21->unsigned int tm_sec = tm_sec + 1;
      time_t v28 = mktime(v21);
    }

    switch(v13)
    {
      case 3:
        a2[6] = v28;
        uLong v24 = v11;
        break;
      case 1:
        a2[14] = v28;
        uLong v24 = v26;
        break;
      case 2:
        a2[16] = v28;
        uLong v24 = v25;
        break;
      default:
        a2[18] = v28;
        uLong v24 = v10;
        break;
    }

    *uLong v24 = v23;
LABEL_29:
    int v12 = v13 - 1;
  }

  while (v13);
  return 0LL;
}

uint64_t sub_180715024( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(uint64_t **)(a1 + 2472);
  uint64_t v12 = *v11;
  int v13 = (char *)sub_1806BB3B8(a1, *(void *)(*v11 + 32), 0LL, a4, a5, a6, a7, a8);
  if (!v13) {
    return 4294967266LL;
  }
  if (!sub_1806AB34C(a2, v13, *(void *)(v12 + 32), a3))
  {
    uint64_t v25 = 0LL;
LABEL_8:
    sub_1806BB660(a1, *(void *)(v12 + 32), v14, v15, v16, v17, v18, v19);
    return v25;
  }

  if (*__error() != 12)
  {
    uint64_t v26 = (char *)sub_1806F7F14(a3);
    archive_set_error( (_DWORD *)a1,  79,  "link cannot be converted from %s to current locale.",  v27,  v28,  v29,  v30,  v31,  v26);
    uint64_t v25 = 4294967276LL;
    goto LABEL_8;
  }

  archive_set_error((_DWORD *)a1, 12, "Can't allocate memory for link", v20, v21, v22, v23, v24, v33);
  return 4294967266LL;
}

size_t sub_1807150F0( uint64_t a1, size_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  while (1)
  {
    uint64_t v11 = **(void **)(a1 + 2472);
    size_t result = sub_1806BB3B8(a1, a2, a3, a4, a5, a6, a7, a8);
    if (!a3) {
      break;
    }
    uint64_t v19 = *a3;
    if (*(_BYTE *)(a1 + 144))
    {
      uint64_t v20 = *(void *)(a1 + 152);
      if (v19 > v20)
      {
        *a3 = v20;
        uint64_t v19 = v20;
      }
    }

    uint64_t v21 = *(void *)(v11 + 168);
    if (v19 > v21)
    {
      *a3 = v21;
      uint64_t v19 = v21;
    }

    if ((v19 & 0x8000000000000000LL) == 0)
    {
      if (v19 || (*(_BYTE *)v11 & 1) == 0 || (*(_BYTE *)(v11 + 24) & 2) == 0) {
        return result;
      }
      *(_BYTE *)(v11 + 272) = 1;
      int v22 = sub_180712ED8(a1, *(char **)(a1 + 160), v13, v14, v15, v16, v17, v18);
      if (v22 == 1)
      {
        *(_BYTE *)(v11 + 252) = 1;
        int v22 = sub_180712ED8(a1, *(char **)(a1 + 160), v23, a4, a5, a6, a7, a8);
      }

      *(_BYTE *)(v11 + 272) = 0;
      if (!v22) {
        continue;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t sub_1807151C4( uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  uint64_t v12 = *(uint64_t **)(a1 + 2472);
  uint64_t v13 = *v12;
  uint64_t v14 = *(char **)(*v12 + 224);
  if (!v14)
  {
    uint64_t v14 = (char *)malloc(*(unsigned int *)(v13 + 216));
    *(void *)(v13 + 224) = v14;
    if (!v14)
    {
      uint64_t v26 = "Unable to allocate memory for uncompressed data.";
      uint64_t v27 = (_DWORD *)a1;
      int v28 = 12;
      goto LABEL_15;
    }
  }

  int v15 = *(_DWORD *)(v13 + 856);
  int v16 = v15 & a3;
  int v17 = (v15 & a3) + v8;
  int v18 = v15 + 1;
  if (v17 <= v18)
  {
    uint64_t v20 = &v14[*(unsigned int *)(v13 + 212)];
    uint64_t v21 = (const void *)(*(void *)(v13 + 848) + v16);
    size_t v22 = v8;
    goto LABEL_9;
  }

  if (v18 < v8 || (int v19 = v18 - v16, v18 - v16 < 0))
  {
    uint64_t v26 = "Bad RAR file data";
    uint64_t v27 = (_DWORD *)a1;
    int v28 = 79;
LABEL_15:
    archive_set_error(v27, v28, v26, a4, a5, a6, a7, a8, v30);
    return 4294967266LL;
  }

  uint64_t v20 = &v14[*(unsigned int *)(v13 + 212)];
  uint64_t v21 = (const void *)(*(void *)(v13 + 848) + v16);
  if (v8 <= v19)
  {
    size_t v22 = v8;
  }

  else
  {
    memcpy(v20, v21, (v18 - v16));
    uint64_t v20 = (char *)(*(void *)(v13 + 224) + (*(_DWORD *)(v13 + 212) + v19));
    uint64_t v21 = *(const void **)(v13 + 848);
    size_t v22 = v8 - v19;
  }

uint64_t sub_180715300(uint64_t a1)
{
  uint64_t v97 = *MEMORY[0x1895F89C0];
  uint64_t v2 = **(void **)(a1 + 2472);
  int8x16_t v3 = (unint64_t *)(v2 + 20216);
  *(double *)v10.i64 = sub_180715D0C(a1);
  uint64_t v12 = (int *)(v2 + 20224);
  int v11 = *(_DWORD *)(v2 + 20224);
  signed int v13 = v11 & 0xFFFFFFF8;
  *(_DWORD *)(v2 + 20224) = v11 & 0xFFFFFFF8;
  if ((v11 < 0) ^ v14 | ((v11 & 0xFFFFFFF8) == 0))
  {
    int64x2_t v10 = sub_180715AD0(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
    signed int v13 = *v12;
    if (!v15 && v13 < 1) {
      goto LABEL_129;
    }
  }

  int v17 = v13 - 1;
  uint64_t v18 = *(void *)(v2 + 20216) >> (v13 - 1);
  *(_BYTE *)(v2 + 923) = v18 & 1;
  *uint64_t v12 = v13 - 1;
  if ((v18 & 1) == 0)
  {
    if (v13 > 1
      || ((int64x2_t v10 = sub_180715AD0(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10), v17 = *v12, !v19)
        ? (BOOL v20 = v17 < 1)
        : (BOOL v20 = 0),
          !v20))
    {
      int v21 = v17 - 1;
      if (((*v3 >> (v17 - 1)) & 1) == 0)
      {
        *(_DWORD *)(v2 + 840) = 0;
        int64x2_t v10 = 0uLL;
        *(_OWORD *)(v2 + 808) = 0u;
        *(_OWORD *)(v2 + 824) = 0u;
        *(_OWORD *)(v2 + 776) = 0u;
        *(_OWORD *)(v2 + 792) = 0u;
        *(_OWORD *)(v2 + 744) = 0u;
        *(_OWORD *)(v2 + 760) = 0u;
        *(_OWORD *)(v2 + 712) = 0u;
        *(_OWORD *)(v2 + 728) = 0u;
        *(_OWORD *)(v2 + 680) = 0u;
        *(_OWORD *)(v2 + 696) = 0u;
        *(_OWORD *)(v2 + 648) = 0u;
        *(_OWORD *)(v2 + 664) = 0u;
        *(_OWORD *)(v2 + 616) = 0u;
        *(_OWORD *)(v2 + 632) = 0u;
        *(_OWORD *)(v2 + 584) = 0u;
        *(_OWORD *)(v2 + 600) = 0u;
        *(_OWORD *)(v2 + 552) = 0u;
        *(_OWORD *)(v2 + 568) = 0u;
        *(_OWORD *)(v2 + 520) = 0u;
        *(_OWORD *)(v2 + 536) = 0u;
        *(_OWORD *)(v2 + 488) = 0u;
        *(_OWORD *)(v2 + 504) = 0u;
        *(_OWORD *)(v2 + 456) = 0u;
        *(_OWORD *)(v2 + 472) = 0u;
        *(_OWORD *)(v2 + 440) = 0u;
      }

      int v22 = 0;
      *uint64_t v12 = v21;
      v95[0] = 0LL;
      v95[1] = 0LL;
      int v96 = 0;
      while (1)
      {
        int v23 = v21;
        if (v21 <= 3)
        {
          int64x2_t v10 = sub_180715AD0(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
          int v23 = *v12;
          if (!v24 && v23 < 4) {
            break;
          }
        }

        int v21 = v23 - 4;
        uint64_t v25 = (*v3 >> (v23 - 4)) & 0xF;
        int v26 = v22 + 1;
        *((_BYTE *)v95 + v22) = v25;
        *uint64_t v12 = v23 - 4;
        if ((_DWORD)v25 == 15)
        {
          if (v23 <= 7)
          {
            int64x2_t v10 = sub_180715AD0(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
            int v21 = *v12;
            if (!v27 && v21 < 4) {
              goto LABEL_129;
            }
          }

          v21 -= 4;
          unint64_t v28 = *v3 >> v21;
          *uint64_t v12 = v21;
          if ((v28 & 0xF) != 0)
          {
            unsigned int v29 = (v28 & 0xF) + 2;
            uint64_t v30 = v28 & 0xF;
            else {
              uint64_t v31 = (19 - v22);
            }
            bzero((char *)v95 + v22, v31 + 1);
            uint64_t v32 = 0LL;
            do
              uint64_t v33 = v22 + v32++;
            while (v32 < v29 && v33 < 19);
            int v26 = v22 + v32;
          }
        }

        int v22 = v26;
        if (v26 >= 20)
        {
          uint64_t v94 = 0LL;
          *(_OWORD *)uint64_t v92 = 0u;
          __int128 v93 = 0u;
          uint64_t v35 = sub_180715E34((_DWORD *)a1, (uint64_t)v92, (uint64_t)v95, 20);
          if ((_DWORD)v35)
          {
            uint64_t v43 = v35;
            free(v92[0]);
            free(v94);
            return v43;
          }

          int v56 = 0;
          uint64_t v57 = v2 + 440;
          do
          {
            unsigned int v58 = sub_180716018(a1, (uint64_t)v92, v36, v37, v38, v39, v40, v41, v42);
            if ((v58 & 0x80000000) != 0)
            {
              free(v92[0]);
              free(v94);
              return 4294967266LL;
            }

            if (v58 > 0xF)
            {
              if (v58 > 0x11)
              {
                int v64 = *v12;
                if (v58 == 18)
                {
                  if (v64 <= 2)
                  {
                    sub_180715AD0(a1, (unint64_t *)(v2 + 20216), v36, v37, v38, v39, v40, v41, v42);
                    int v64 = *v12;
                    if (!v65 && v64 < 3) {
                      goto LABEL_128;
                    }
                  }

                  int v66 = v64 - 3;
                  int v67 = 3;
                  int v68 = 7;
                }

                else
                {
                  if (v64 <= 6)
                  {
                    sub_180715AD0(a1, (unint64_t *)(v2 + 20216), v36, v37, v38, v39, v40, v41, v42);
                    int v64 = *v12;
                    if (!v69 && v64 < 7)
                    {
LABEL_128:
                      free(v92[0]);
                      free(v94);
                      goto LABEL_129;
                    }
                  }

                  int v66 = v64 - 7;
                  int v67 = 11;
                  int v68 = 127;
                }

                unint64_t v70 = *v3;
                *uint64_t v12 = v66;
                unsigned int v71 = (v68 & (v70 >> v66)) + v67;
                LODWORD(v72) = v71 - 1;
                if (v71 - 1 >= 403 - v56) {
                  uint64_t v72 = (403 - v56);
                }
                else {
                  uint64_t v72 = v72;
                }
                bzero((void *)(v57 + v56), v72 + 1);
                uint64_t v73 = 0LL;
                do
                {
                  int v74 = v73 + 1;
                  uint64_t v75 = v56 + v73++;
                }

                while (v75 < 403);
                v56 += v74;
              }

              else
              {
                if (!v56)
                {
                  free(v92[0]);
                  free(v94);
                  uint64_t v55 = "Internal error extracting RAR file.";
                  goto LABEL_126;
                }

                int v59 = *v12;
                if (v58 == 16)
                {
                  if (v59 <= 2)
                  {
                    int64x2_t v42 = sub_180715AD0(a1, (unint64_t *)(v2 + 20216), v36, v37, v38, v39, v40, v41, v42);
                    int v59 = *v12;
                    if (!v60 && v59 < 3) {
                      goto LABEL_128;
                    }
                  }

                  int v61 = v59 - 3;
                  int v62 = 3;
                  int v63 = 7;
                }

                else
                {
                  if (v59 <= 6)
                  {
                    int64x2_t v42 = sub_180715AD0(a1, (unint64_t *)(v2 + 20216), v36, v37, v38, v39, v40, v41, v42);
                    int v59 = *v12;
                    if (!v76 && v59 < 7) {
                      goto LABEL_128;
                    }
                  }

                  int v61 = v59 - 7;
                  int v62 = 11;
                  int v63 = 127;
                }

                unint64_t v77 = *v3;
                *uint64_t v12 = v61;
                uint64_t v78 = 0LL;
                unsigned int v79 = (v63 & (v77 >> v61)) + v62;
                char v80 = *(_BYTE *)(v2 + 439 + v56);
                do
                {
                  *(_BYTE *)(v57 + v56 + v78) = v80;
                  int v81 = v78 + 1;
                  uint64_t v82 = v56 + v78++;
                }

                while (v82 < 403);
                v56 += v81;
              }
            }

            else
            {
              *(_BYTE *)(v2 + v56 + 440) = (*(_BYTE *)(v2 + v56 + 440) + v58) & 0xF;
              ++v56;
            }
          }

          while (v56 < 404);
          free(v92[0]);
          free(v94);
          uint64_t v43 = sub_180715E34((_DWORD *)a1, v2 + 280, v2 + 440, 299);
          if ((_DWORD)v43) {
            return v43;
          }
          uint64_t v43 = sub_180715E34((_DWORD *)a1, v2 + 320, v2 + 739, 60);
          if ((_DWORD)v43) {
            return v43;
          }
          uint64_t v43 = sub_180715E34((_DWORD *)a1, v2 + 360, v2 + 799, 17);
          if ((_DWORD)v43) {
            return v43;
          }
          uint64_t v43 = sub_180715E34((_DWORD *)a1, v2 + 400, v2 + 816, 28);
          if ((_DWORD)v43) {
            return v43;
          }
          goto LABEL_109;
        }
      }
    }

    goto LABEL_129;
  }

  if (v13 <= 7)
  {
    int64x2_t v10 = sub_180715AD0(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
    int v17 = *v12;
    if (!v44 && v17 < 7) {
      goto LABEL_129;
    }
  }

  int v46 = v17 - 7;
  unint64_t v47 = *v3 >> (v17 - 7);
  *uint64_t v12 = v17 - 7;
  if ((v47 & 0x20) != 0)
  {
    if (v17 <= 14)
    {
      int64x2_t v10 = sub_180715AD0(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10);
      int v46 = *v12;
      if (!v48 && v46 < 8) {
        goto LABEL_129;
      }
    }

    v46 -= 8;
    *(_DWORD *)(v2 + 232) = ((*(void *)(v2 + 20216) >> v46) << 20) + 0x100000;
    *uint64_t v12 = v46;
  }

  if ((v47 & 0x40) != 0)
  {
    if (v46 > 7
      || ((sub_180715AD0(a1, (unint64_t *)(v2 + 20216), v4, v5, v6, v7, v8, v9, v10), int v46 = *v12, !v50)
        ? (BOOL v51 = v46 < 8)
        : (BOOL v51 = 0),
          !v51))
    {
      int v52 = v46 - 8;
      int v53 = (*(void *)(v2 + 20216) >> v52);
      *(_DWORD *)(v2 + 956) = v53;
      *(_DWORD *)(v2 + 924) = v53;
      *uint64_t v12 = v52;
      if ((v47 & 0x20) == 0) {
        goto LABEL_50;
      }
      goto LABEL_59;
    }

LABEL_129:
    archive_set_error((_DWORD *)a1, 79, "Truncated RAR file data", v5, v6, v7, v8, v9, (char *)v92[0]);
    *(_BYTE *)(v2 + 208) = 0;
    return 4294967266LL;
  }

  *(_DWORD *)(v2 + 924) = 2;
  if ((v47 & 0x20) == 0)
  {
LABEL_50:
    if (*(_BYTE *)(v2 + 921))
    {
      if (!sub_1806ECC58(v2 + 20112)) {
        goto LABEL_114;
      }
      goto LABEL_109;
    }

    uint64_t v55 = "Invalid PPMd sequence";
LABEL_126:
    uint64_t v89 = (_DWORD *)a1;
    int v90 = 79;
    goto LABEL_127;
  }

int64x2_t sub_180715AD0( uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int64x2_t result)
{
  int v11 = **(int64x2_t ***)(a1 + 2472);
  int v12 = *((_DWORD *)a2 + 2);
  int v13 = 64 - v12;
  char v14 = (uint64_t *)(a2 + 2);
  int64x2_t v15 = (int64x2_t)xmmword_180720E90;
  while (2)
  {
    switch(v13 >> 3)
    {
      case 0:
        return result;
      case 6:
        uint64_t v16 = *v14;
        uint64_t v17 = *v14 - 6;
        if (*v14 < 6) {
          goto LABEL_10;
        }
        int v21 = (unsigned __int8 *)a2[3];
        *a2 = (*a2 << 48) | ((unint64_t)*v21 << 40) | ((unint64_t)v21[1] << 32) | ((unint64_t)v21[2] << 24) | ((unint64_t)v21[3] << 16) | ((unint64_t)v21[4] << 8) | v21[5];
        a2[3] = (unint64_t)(v21 + 6);
        int64x2_t v22 = (int64x2_t)xmmword_180720E60;
        int v23 = 48;
        goto LABEL_19;
      case 7:
        uint64_t v16 = *v14;
        uint64_t v17 = *v14 - 7;
        if (*v14 < 7) {
          goto LABEL_10;
        }
        int v24 = (unsigned __int8 *)a2[3];
        *a2 = (*a2 << 56) | ((unint64_t)*v24 << 48) | ((unint64_t)v24[1] << 40) | ((unint64_t)v24[2] << 32) | ((unint64_t)v24[3] << 24) | ((unint64_t)v24[4] << 16) | ((unint64_t)v24[5] << 8) | v24[6];
        a2[3] = (unint64_t)(v24 + 7);
        int64x2_t v22 = (int64x2_t)xmmword_180720E70;
        int v23 = 56;
        goto LABEL_19;
      case 8:
        uint64_t v16 = *v14;
        uint64_t v17 = *v14 - 8;
        if (*v14 < 8) {
          goto LABEL_10;
        }
        uint64_t v25 = (unint64_t *)a2[3];
        *a2 = bswap64(*v25);
        a2[3] = (unint64_t)(v25 + 1);
        int64x2_t v22 = (int64x2_t)xmmword_180720E80;
        int v23 = 64;
LABEL_19:
        a2[2] = v17;
        *((_DWORD *)a2 + 2) = v12 + v23;
        uint64_t result = vaddq_s64(v11[10], v22);
        v11[10] = result;
        return result;
      default:
        uint64_t v16 = *v14;
LABEL_10:
        if (v16 >= 1)
        {
          uint64_t v18 = (unsigned __int8 *)a2[3];
          goto LABEL_17;
        }

        uint64_t v19 = v11[10].i64[0];
        if (v19 >= 1)
        {
          sub_1806BB660(a1, v19, a3, a4, a5, a6, a7, a8);
          v11[10].i64[0] = 0LL;
        }

        uint64_t v18 = (unsigned __int8 *)sub_1807150F0(a1, 1uLL, v14, a4, a5, a6, a7, a8);
        a2[3] = (unint64_t)v18;
        if (v18)
        {
          uint64_t v16 = *v14;
          if (*v14)
          {
            int v12 = *((_DWORD *)a2 + 2);
            int64x2_t v15 = (int64x2_t)xmmword_180720E90;
LABEL_17:
            unint64_t v20 = *a2;
            a2[3] = (unint64_t)(v18 + 1);
            *a2 = *v18 | (v20 << 8);
            a2[2] = v16 - 1;
            v12 += 8;
            *((_DWORD *)a2 + 2) = v12;
            v13 -= 8;
            uint64_t result = vaddq_s64(v11[10], v15);
            v11[10] = result;
            continue;
          }
        }

        return result;
    }
  }

double sub_180715D0C(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 2472);
  uint64_t v2 = v1 + 280;
  free(*(void **)v2);
  free(*(void **)(v1 + 320));
  free(*(void **)(v1 + 360));
  free(*(void **)(v1 + 400));
  free(*(void **)(v1 + 312));
  free(*(void **)(v1 + 352));
  free(*(void **)(v1 + 392));
  free(*(void **)(v1 + 432));
  *(void *)(v1 + 312) = 0LL;
  double result = 0.0;
  *(_OWORD *)uint64_t v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v1 + 320) = 0u;
  *(_OWORD *)(v1 + 336) = 0u;
  *(void *)(v1 + 352) = 0LL;
  *(_OWORD *)(v1 + 360) = 0u;
  *(_OWORD *)(v1 + 376) = 0u;
  *(void *)(v1 + 392) = 0LL;
  *(_OWORD *)(v1 + 400) = 0u;
  *(_OWORD *)(v1 + 416) = 0u;
  *(void *)(v1 + 432) = 0LL;
  return result;
}

uint64_t sub_180715DA0( uint64_t *a1, int64x2_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = (_DWORD *)*a1;
  uint64_t v10 = **(void **)(*a1 + 2472);
  int v12 = (int *)(v10 + 20224);
  int v11 = *(_DWORD *)(v10 + 20224);
  if (v11 <= 7
    && ((sub_180715AD0(*a1, (unint64_t *)(v10 + 20216), a4, a5, a6, a7, a8, a9, a2), int v11 = *v12, !v18)
      ? (BOOL v19 = v11 <= 7)
      : (BOOL v19 = 0),
        v19))
  {
    archive_set_error(v9, 79, "Truncated RAR file data", v13, v14, v15, v16, v17, v23);
    LOBYTE(v21) = 0;
    *(_BYTE *)(v10 + 208) = 0;
  }

  else
  {
    int v20 = v11 - 8;
    uint64_t v21 = *(void *)(v10 + 20216) >> (v11 - 8);
    *int v12 = v20;
  }

  return v21;
}

uint64_t sub_180715E34(_DWORD *a1, uint64_t a2, uint64_t a3, int a4)
{
  *(void *)(a2 + 8) = 0LL;
  if ((sub_1807161D0(a2) & 0x80000000) != 0)
  {
    int v27 = "Unable to allocate memory for node data.";
    unint64_t v28 = a1;
LABEL_27:
    int v29 = 12;
LABEL_28:
    archive_set_error(v28, v29, v27, v8, v9, v10, v11, v12, v30);
    return 4294967266LL;
  }

  else
  {
    uint64_t v31 = a1;
    unsigned int v13 = 0;
    int v14 = 1;
    *(_DWORD *)(a2 + 8) = 1;
    *(void *)(a2 + 16) = 0x800000007FFFFFFFLL;
    uint64_t v15 = a4;
    int v16 = 2;
    int v17 = a4;
    do
    {
      if (a4 >= 1)
      {
        uint64_t v18 = 0LL;
        do
        {
          if (v14 == *(unsigned __int8 *)(a3 + v18))
          {
            int v32 = v17;
            free(*(void **)(a2 + 32));
            *(void *)(a2 + 32) = 0LL;
            if (*(_DWORD *)(a2 + 20) < v14) {
              *(_DWORD *)(a2 + 20) = v14;
            }
            if (*(_DWORD *)(a2 + 16) > v14) {
              *(_DWORD *)(a2 + 16) = v14;
            }
            int v19 = 0;
            uint64_t v20 = *(void *)a2;
            unsigned int v21 = v16;
            do
            {
              int64x2_t v22 = (_DWORD *)(v20 + 8LL * v19);
              if (*v22 == v22[1]) {
                goto LABEL_24;
              }
              uint64_t v23 = (v13 >> (v21 - 2)) & 1;
              int v24 = v22[v23];
              if (v24 < 0)
              {
                if ((sub_1807161D0(a2) & 0x80000000) != 0)
                {
                  int v27 = "Unable to allocate memory for node data.";
                  unint64_t v28 = v31;
                  goto LABEL_27;
                }

                int v24 = *(_DWORD *)(a2 + 8);
                *(_DWORD *)(a2 + 8) = v24 + 1;
                uint64_t v20 = *(void *)a2;
                *(_DWORD *)(*(void *)a2 + 8LL * v19 + 4 * v23) = v24;
              }

              --v21;
              int v19 = v24;
            }

            while (v21 > 1);
            uint64_t v25 = (int32x2_t *)(v20 + 8LL * v24);
            if (v25->i32[0] != -1 || v25->i32[1] != -2)
            {
LABEL_24:
              int v27 = "Prefix found";
              unint64_t v28 = v31;
              int v29 = 79;
              goto LABEL_28;
            }

            int32x2_t *v25 = vdup_n_s32(v18);
            if (v32 < 2) {
              return 0LL;
            }
            ++v13;
            int v17 = v32 - 1;
            uint64_t v15 = a4;
          }

          ++v18;
        }

        while (v18 != v15);
      }

      if (v17 < 1) {
        break;
      }
      v13 *= 2;
      ++v14;
      ++v16;
    }

    while (v14 != 16);
    return 0LL;
  }

uint64_t sub_180716018( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int64x2_t a9)
{
  if (!*(void *)(a2 + 32))
  {
    int v27 = *(_DWORD *)(a2 + 20);
    if (v27 < *(_DWORD *)(a2 + 16) || v27 > 10) {
      int v27 = 10;
    }
    *(_DWORD *)(a2 + 24) = v27;
    int v29 = calloc(1uLL, 8LL << v27);
    *(void *)(a2 + 32) = v29;
    if (sub_18071624C( (_DWORD *)a1,  (uint64_t *)a2,  0,  (uint64_t)v29,  0LL,  *(unsigned int *)(a2 + 24),  v30,  v31)) {
      return 0xFFFFFFFFLL;
    }
  }

  uint64_t v11 = **(void **)(a1 + 2472);
  uint64_t v12 = (void *)(v11 + 20216);
  int v14 = (int *)(v11 + 20224);
  int v13 = *(_DWORD *)(v11 + 20224);
  int v15 = *(_DWORD *)(a2 + 24);
  if (v13 < v15)
  {
    a9 = sub_180715AD0(a1, (unint64_t *)(v11 + 20216), a3, a4, a5, a6, a7, a8, a9);
    int v13 = *v14;
    int v15 = *(_DWORD *)(a2 + 24);
    if (!v16 && v13 < v15)
    {
LABEL_23:
      archive_set_error((_DWORD *)a1, 79, "Truncated RAR file data", a4, a5, a6, a7, a8, v33);
      *(_BYTE *)(v11 + 208) = 0;
      return 0xFFFFFFFFLL;
    }
  }

  int v18 = v13 - v15;
  int v20 = *v19;
  if (*v19 < 0)
  {
LABEL_15:
    archive_set_error((_DWORD *)a1, 79, "Invalid prefix code in bitstream", a4, a5, a6, a7, a8, v33);
    return 0xFFFFFFFFLL;
  }

  uint64_t v21 = v19[1];
  if (v20 <= v15)
  {
    *int v14 = v13 - v20;
  }

  else
  {
    *int v14 = v18;
    uint64_t v22 = *(void *)a2;
    int v23 = v18;
    while (1)
    {
      int v24 = (unsigned int *)(v22 + 8LL * (int)v21);
      if (*v24 == v24[1]) {
        return *v24;
      }
      if (v23 <= 0)
      {
        a9 = sub_180715AD0(a1, (unint64_t *)(v11 + 20216), a3, a4, a5, a6, a7, a8, a9);
        int v23 = *v14;
        if (!v25 && v23 <= 0) {
          goto LABEL_23;
        }
      }

      uint64_t v26 = (*v12 >> --v23) & 1LL;
      *int v14 = v23;
      uint64_t v22 = *(void *)a2;
      LODWORD(v21) = *(_DWORD *)(*(void *)a2 + 8LL * (int)v21 + 4 * v26);
      if ((v21 & 0x80000000) != 0) {
        goto LABEL_15;
      }
    }
  }

  return v21;
}

uint64_t sub_1807161D0(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 8);
  int v3 = *(_DWORD *)(a1 + 12);
  uint64_t v4 = *(void **)a1;
  if (v3 != v2) {
    goto LABEL_7;
  }
  if (v3 <= 0) {
    unsigned int v5 = 256;
  }
  else {
    unsigned int v5 = 2 * v3;
  }
  uint64_t v4 = realloc(v4, 8LL * v5);
  if (v4)
  {
    *(void *)a1 = v4;
    *(_DWORD *)(a1 + 12) = v5;
    int v2 = *(_DWORD *)(a1 + 8);
LABEL_7:
    *((_DWORD *)v4 + 2 * v2) = -1;
    *((_DWORD *)v4 + 2 * *(int *)(a1 + 8) + 1) = -2;
    return 1LL;
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_18071624C( _DWORD *a1, uint64_t *a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *a2;
  if (*a2)
  {
    uint64_t v10 = a3;
    if ((a3 & 0x80000000) != 0)
    {
      unsigned int v15 = 0;
    }

    else
    {
      int v11 = a6;
      int v12 = a5;
      int v13 = (_DWORD *)a4;
      unsigned int v15 = 0;
      int v16 = -(int)a5;
      while (*((_DWORD *)a2 + 2) > (int)v10)
      {
        int v17 = 1 << (v11 + v16);
        int v18 = (_DWORD *)(v9 + 8 * v10);
        if (*v18 == v18[1])
        {
          if (v11 - 31 != v12)
          {
            if (v17 <= 1) {
              uint64_t v23 = 1LL;
            }
            else {
              uint64_t v23 = v17;
            }
            int v24 = v13 + 1;
            do
            {
              *(v24 - 1) = v12;
              *int v24 = *v18;
              v24 += 2;
              --v23;
            }

            while (v23);
          }

          int v21 = 0;
          return v21 | v15;
        }

        if (v11 == v12)
        {
          int v21 = 0;
          *int v13 = v11 + 1;
          v13[1] = v10;
          return v21 | v15;
        }

        ++v12;
        int v19 = sub_18071624C(a1, a2);
        uint64_t v9 = *a2;
        uint64_t v10 = *(unsigned int *)(*a2 + 8 * v10 + 4);
        if (v17 >= 0) {
          int v20 = 1 << (v11 + v16);
        }
        else {
          int v20 = v17 + 1;
        }
        v13 += 2 * (v20 >> 1);
        v15 |= v19;
        LOBYTE(v16) = v16 - 1;
        if ((v10 & 0x80000000) != 0) {
          break;
        }
      }
    }

    archive_set_error(a1, 79, "Invalid location to Huffman tree specified.", a4, a5, a6, a7, a8, v25);
  }

  else
  {
    archive_set_error(a1, 79, "Huffman tree was not created.", a4, a5, a6, a7, a8, v25);
    unsigned int v15 = 0;
  }

  int v21 = -30;
  return v21 | v15;
}

uint64_t archive_write_set_format_gnutar(uint64_t a1)
{
  int v2 = calloc(1uLL, 0x68uLL);
  if (v2)
  {
    uint64_t v8 = v2;
    uint64_t result = 0LL;
    *(void *)(a1 + 264) = v8;
    *(void *)(a1 + 272) = "gnutar";
    *(void *)(a1 + 304) = sub_1807164FC;
    *(void *)(a1 + 312) = sub_180716B28;
    *(void *)(a1 + 320) = sub_180716B70;
    *(void *)(a1 + 328) = sub_180716B78;
    *(void *)(a1 + 288) = sub_180716458;
    *(void *)(a1 + 296) = sub_180716BA4;
    *(_DWORD *)(a1 + 16) = 196612;
    *(void *)(a1 + 24) = "GNU tar";
  }

  else
  {
    archive_set_error((_DWORD *)a1, 12, "Can't allocate gnutar data", v3, v4, v5, v6, v7, v10);
    return 4294967266LL;
  }

  return result;
}

uint64_t sub_180716458(uint64_t a1, char *__s1, char *a3)
{
  uint64_t v5 = *(void *)(a1 + 264);
  if (a3 && *a3)
  {
    int v12 = sub_1806F7A20(a1, a3, 0);
    *(void *)(v5 + 80) = v12;
    if (v12) {
      return 0LL;
    }
    else {
      return 4294967266LL;
    }
  }

  else
  {
    archive_set_error( (_DWORD *)a1,  -1,  "%s: hdrcharset option needs a character-set name",  v6,  v7,  v8,  v9,  v10,  *(char **)(a1 + 272));
    return 4294967271LL;
  }

uint64_t sub_1807164FC(uint64_t a1, uint64_t *a2)
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 264);
  uint64_t v5 = *(void *)(v4 + 80);
  if (!v5)
  {
    if (*(_DWORD *)(v4 + 96))
    {
      uint64_t v5 = *(void *)(v4 + 88);
    }

    else
    {
      uint64_t v5 = sub_1806F7E68();
      *(void *)(v4 + 88) = v5;
      *(_DWORD *)(v4 + 96) = 1;
    }
  }

  if (archive_entry_hardlink((uint64_t)a2)
    || archive_entry_symlink((uint64_t)a2)
    || archive_entry_filetype((uint64_t)a2) != 0x8000)
  {
    archive_entry_set_size((uint64_t)a2, 0LL);
  }

  if (archive_entry_filetype((uint64_t)a2) == 0x4000)
  {
    uint64_t v6 = (const char *)archive_entry_pathname(a2);
    if (v6)
    {
      uint64_t v7 = (char *)v6;
      if (*v6)
      {
        if (v6[strlen(v6) - 1] != 47)
        {
          __dst = 0LL;
          uint64_t v72 = 0LL;
          uint64_t v73 = 0LL;
          size_t v8 = strlen(v7);
          if (!sub_1806F7590((void **)&__dst, v8 + 2))
          {
            archive_set_error((_DWORD *)a1, 12, "Can't allocate ustar data", v9, v10, v11, v12, v13, v70);
            sub_1806F755C((uint64_t)&__dst);
            return 4294967266LL;
          }

          uint64_t v72 = 0LL;
          sub_1806F7634((uint64_t *)&__dst, v7, v8);
          sub_1806F76DC((uint64_t *)&__dst, 47);
          archive_entry_copy_pathname((uint64_t)a2, __dst);
          sub_1806F755C((uint64_t)&__dst);
        }
      }
    }
  }

  int v14 = (uint64_t *)(v4 + 40);
  if (!sub_1806AA3BC(a2, (void *)(v4 + 32), (void *)(v4 + 40), v5))
  {
    int v21 = 0;
    goto LABEL_20;
  }

  if (*__error() != 12)
  {
    uint64_t v22 = (char *)archive_entry_pathname(a2);
    sub_1806F7F14(v5);
    archive_set_error((_DWORD *)a1, 79, "Can't translate pathname '%s' to %s", v23, v24, v25, v26, v27, v22);
    int v21 = -20;
LABEL_20:
    if (sub_1806AA760(a2, (void *)(v4 + 48), (void *)(v4 + 56), v5))
    {
      if (*__error() == 12)
      {
        int v20 = "Can't allocate memory for Uname";
        goto LABEL_35;
      }

      unint64_t v28 = (char *)archive_entry_uname(a2);
      sub_1806F7F14(v5);
      archive_set_error((_DWORD *)a1, 79, "Can't translate uname '%s' to %s", v29, v30, v31, v32, v33, v28);
      int v21 = -20;
    }

    if (sub_1806AA0E4(a2, (void *)(v4 + 64), (void *)(v4 + 72), v5))
    {
      if (*__error() == 12)
      {
        int v20 = "Can't allocate memory for Gname";
        goto LABEL_35;
      }

      uint32x4_t v34 = (char *)archive_entry_gname(a2);
      sub_1806F7F14(v5);
      archive_set_error((_DWORD *)a1, 79, "Can't translate gname '%s' to %s", v35, v36, v37, v38, v39, v34);
      int v21 = -20;
    }

    uint64_t v40 = (unint64_t *)(v4 + 24);
    if (sub_1806AA22C((uint64_t)a2, (void *)(v4 + 16), (void *)(v4 + 24), v5))
    {
      if (*__error() == 12)
      {
LABEL_34:
        int v20 = "Can't allocate memory for Linkname";
        goto LABEL_35;
      }

      uint64_t v41 = (char *)archive_entry_hardlink((uint64_t)a2);
      sub_1806F7F14(v5);
      archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v42, v43, v44, v45, v46, v41);
      int v21 = -20;
    }

    unint64_t v47 = *v40;
    if (!*v40)
    {
      if (sub_1806AA610((uint64_t)a2, (void *)(v4 + 16), (void *)(v4 + 24), v5))
      {
        if (*__error() == 12) {
          goto LABEL_34;
        }
        int v50 = (char *)archive_entry_hardlink((uint64_t)a2);
        sub_1806F7F14(v5);
        archive_set_error((_DWORD *)a1, 79, "Can't translate linkname '%s' to %s", v51, v52, v53, v54, v55, v50);
        int v21 = -20;
      }

      unint64_t v47 = *v40;
    }

    if (v47 >= 0x65)
    {
      int v56 = v21;
      uint64_t v57 = (uint64_t *)archive_entry_new2(a1);
      archive_entry_set_uname((uint64_t)v57, "root");
      archive_entry_set_gname((uint64_t)v57, "wheel");
      archive_entry_set_pathname((uint64_t)v57, "././@LongLink");
      archive_entry_set_size((uint64_t)v57, v47 + 1);
      uint64_t v48 = sub_180716BD0(a1, (char *)&__dst, v57, 75);
      unsigned int v58 = (void **)v57;
      int v21 = v56;
      archive_entry_free(v58);
      uint64_t v48 = sub_1806FDA50(a1, (uint64_t)&__dst, 512LL);
      uint64_t v48 = sub_1806FDA50(a1, *(void *)(v4 + 16), v47 + 1);
      uint64_t v48 = sub_1806FDAB0((void *)a1, ~(_WORD)v47 & 0x1FF);
    }

    uint64_t v59 = *v14;
    if ((unint64_t)*v14 >= 0x65)
    {
      uint64_t v60 = *(void *)(v4 + 32);
      int v61 = (uint64_t *)archive_entry_new2(a1);
      archive_entry_set_uname((uint64_t)v61, "root");
      archive_entry_set_gname((uint64_t)v61, "wheel");
      archive_entry_set_pathname((uint64_t)v61, "././@LongLink");
      archive_entry_set_size((uint64_t)v61, v59 + 1);
      uint64_t v48 = sub_180716BD0(a1, (char *)&__dst, v61, 76);
      archive_entry_free((void **)v61);
      uint64_t v48 = sub_1806FDA50(a1, (uint64_t)&__dst, 512LL);
      uint64_t v48 = sub_1806FDA50(a1, v60, v59 + 1);
      uint64_t v48 = sub_1806FDAB0((void *)a1, ~(_WORD)v59 & 0x1FF);
    }

    if (archive_entry_hardlink((uint64_t)a2))
    {
      int v62 = 49;
    }

    else
    {
      HIDWORD(v69) = archive_entry_filetype((uint64_t)a2);
      LODWORD(v69) = HIDWORD(v69) - 4096;
      unsigned int v68 = v69 >> 12;
      if (v68 >= 0xA || ((0x2ABu >> v68) & 1) == 0)
      {
        sub_1807010BC((_DWORD *)a1, a2);
        uint64_t v48 = 4294967271LL;
        goto LABEL_36;
      }

      int v62 = dword_1807210A0[v68];
    }

    uint64_t v63 = sub_180716BD0(a1, (char *)&__dst, a2, v62);
    uint64_t v48 = v63;
    if ((int)v63 >= -20)
    {
      int v64 = v63;
      uint64_t v65 = sub_1806FDA50(a1, (uint64_t)&__dst, 512LL);
      uint64_t v48 = v65;
      if ((int)v65 >= -20)
      {
        if (v21 >= v64) {
          int v66 = v64;
        }
        else {
          int v66 = v21;
        }
        else {
          uint64_t v48 = v65;
        }
        uint64_t v67 = archive_entry_size((uint64_t)a2);
        *(void *)uint64_t v4 = v67;
        *(void *)(v4 + 8) = -(int)v67 & 0x1FFLL;
      }
    }

    goto LABEL_36;
  }

  int v20 = "Can't allocate memory for Pathame";
LABEL_35:
  archive_set_error((_DWORD *)a1, 12, v20, v15, v16, v17, v18, v19, v70);
  uint64_t v48 = 4294967266LL;
LABEL_36:
  archive_entry_free(0LL);
  return v48;
}

uint64_t sub_180716B28(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = *(uint64_t **)(a1 + 264);
  if (*v3 >= a3) {
    uint64_t v4 = a3;
  }
  else {
    uint64_t v4 = *v3;
  }
  LODWORD(result) = sub_1806FDA50(a1, a2, v4);
  *v3 -= v4;
  if ((_DWORD)result) {
    return (int)result;
  }
  else {
    return v4;
  }
}

uint64_t sub_180716B70(void *a1)
{
  return sub_1806FDAB0(a1, 0x400uLL);
}

uint64_t sub_180716B78(uint64_t a1)
{
  *(void *)(a1 + 264) = 0LL;
  return 0LL;
}

uint64_t sub_180716BA4(void *a1)
{
  uint64_t v1 = (void *)a1[33];
  uint64_t result = sub_1806FDAB0(a1, v1[1] + *v1);
  void *v1 = 0LL;
  v1[1] = 0LL;
  return result;
}

uint64_t sub_180716BD0(uint64_t a1, char *__dst, uint64_t *a3, int a4)
{
  uint64_t v8 = *(void *)(a1 + 264);
  memcpy(__dst, &unk_180720EA0, 0x200uLL);
  unsigned int v9 = a4 - 75;
  if ((a4 - 75) > 1)
  {
    uint64_t v10 = *(const char **)(v8 + 32);
    size_t v11 = *(void *)(v8 + 40);
  }

  else
  {
    uint64_t v10 = (const char *)archive_entry_pathname(a3);
    size_t v11 = strlen(v10);
  }

  if (v11 >= 0x64) {
    size_t v12 = 100LL;
  }
  else {
    size_t v12 = v11;
  }
  memcpy(__dst, v10, v12);
  unint64_t v13 = *(void *)(v8 + 24);
  if (v13)
  {
    if (v13 >= 0x64) {
      size_t v14 = 100LL;
    }
    else {
      size_t v14 = *(void *)(v8 + 24);
    }
    memcpy(__dst + 157, *(const void **)(v8 + 16), v14);
  }

  if (v9 > 1)
  {
    uint64_t v15 = *(const char **)(v8 + 48);
    size_t v16 = *(void *)(v8 + 56);
    if (!v16) {
      goto LABEL_20;
    }
  }

  else
  {
    uint64_t v15 = (const char *)archive_entry_uname(a3);
    size_t v16 = strlen(v15);
    if (!v16) {
      goto LABEL_20;
    }
  }

  if (v16 >= 0x20) {
    size_t v17 = 32LL;
  }
  else {
    size_t v17 = v16;
  }
  memcpy(__dst + 265, v15, v17);
LABEL_20:
  if (v9 > 1)
  {
    uint64_t v18 = *(const char **)(v8 + 64);
    size_t v19 = *(void *)(v8 + 72);
    if (!v19) {
      goto LABEL_28;
    }
  }

  else
  {
    uint64_t v18 = (const char *)archive_entry_gname(a3);
    size_t v19 = strlen(v18);
    if (!v19) {
      goto LABEL_28;
    }
  }

  if (strlen(v18) <= 0x20) {
    size_t v20 = v19;
  }
  else {
    size_t v20 = 32LL;
  }
  memcpy(__dst + 297, v18, v20);
LABEL_28:
  unint64_t v21 = archive_entry_mode((uint64_t)a3) & 0xFFF;
  uint64_t v22 = __dst + 107;
  for (unsigned int i = 8; i > 1; --i)
  {
    unint64_t v24 = v21;
    *((_BYTE *)v22 - 1) = v21 & 7 | 0x30;
    uint64_t v22 = (_DWORD *)((char *)v22 - 1);
    v21 >>= 3;
  }

  if (v24 >= 8)
  {
    *(_DWORD *)((char *)v22 + 3) = 926365495;
    *uint64_t v22 = 926365495;
  }

  uint64_t v25 = archive_entry_uid((uint64_t)a3);
  if (sub_180716FEC(v25, (uint64_t)(__dst + 108), 7uLL, 8))
  {
    uint64_t v26 = (char *)archive_entry_uid((uint64_t)a3);
    archive_set_error((_DWORD *)a1, 34, "Numeric user ID %jd too large", v27, v28, v29, v30, v31, v26);
    uint64_t v32 = 4294967271LL;
  }

  else
  {
    uint64_t v32 = 0LL;
  }

  uint64_t v33 = archive_entry_gid((uint64_t)a3);
  if (sub_180716FEC(v33, (uint64_t)(__dst + 116), 7uLL, 8))
  {
    uint32x4_t v34 = (char *)archive_entry_gid((uint64_t)a3);
    archive_set_error((_DWORD *)a1, 34, "Numeric group ID %jd too large", v35, v36, v37, v38, v39, v34);
    uint64_t v32 = 4294967271LL;
  }

  uint64_t v40 = archive_entry_size((uint64_t)a3);
  if (sub_180716FEC(v40, (uint64_t)(__dst + 124), 0xBuLL, 12))
  {
    archive_set_error((_DWORD *)a1, 34, "File size out of range", v41, v42, v43, v44, v45, v84);
    uint64_t v32 = 4294967271LL;
  }

  uint64_t v46 = archive_entry_mtime((uint64_t)a3);
  unint64_t v47 = v46 & ~(v46 >> 63);
  uint64_t v48 = __dst + 147;
  for (unsigned int j = 12; j > 1; --j)
  {
    unint64_t v50 = v47;
    *--uint64_t v48 = v47 & 7 | 0x30;
    v47 >>= 3;
  }

  if (v50 >= 8) {
    memset(v48, 55, 11);
  }
  if (archive_entry_filetype((uint64_t)a3) == 24576
    || archive_entry_filetype((uint64_t)a3) == 0x2000)
  {
    int v51 = archive_entry_rdevmajor((uint64_t)a3);
    unint64_t v57 = v51 & ~(v51 >> 31);
    unsigned int v58 = __dst + 335;
    for (unsigned int k = 7; k > 1; --k)
    {
      unint64_t v60 = v57;
      *--unsigned int v58 = v57 & 7 | 0x30;
      v57 >>= 3;
    }

    if (v60 >= 8)
    {
      *((_WORD *)v58 + 2) = 14135;
      *(_DWORD *)unsigned int v58 = 926365495;
      archive_set_error((_DWORD *)a1, 34, "Major device number too large", v52, v53, v54, v55, v56, v84);
      uint64_t v32 = 4294967271LL;
    }

    int v61 = archive_entry_rdevminor(a3);
    unint64_t v67 = v61 & ~(v61 >> 31);
    unsigned int v68 = __dst + 343;
    for (unsigned int m = 7; m > 1; --m)
    {
      unint64_t v70 = v67;
      *--unsigned int v68 = v67 & 7 | 0x30;
      v67 >>= 3;
    }

    if (v70 >= 8)
    {
      *((_WORD *)v68 + 2) = 14135;
      *(_DWORD *)unsigned int v68 = 926365495;
      archive_set_error((_DWORD *)a1, 34, "Minor device number too large", v62, v63, v64, v65, v66, v84);
      uint64_t v32 = 4294967271LL;
    }
  }

  uint64_t v71 = 0LL;
  __dst[156] = a4;
  int32x4_t v72 = 0uLL;
  int32x4_t v73 = 0uLL;
  int32x4_t v74 = 0uLL;
  int32x4_t v75 = 0uLL;
  do
  {
    uint8x16_t v76 = *(uint8x16_t *)&__dst[v71];
    uint16x8_t v77 = vmovl_u8(*(uint8x8_t *)v76.i8);
    uint16x8_t v78 = vmovl_high_u8(v76);
    int32x4_t v75 = (int32x4_t)vaddw_high_u16((uint32x4_t)v75, v78);
    int32x4_t v74 = (int32x4_t)vaddw_u16((uint32x4_t)v74, *(uint16x4_t *)v78.i8);
    int32x4_t v73 = (int32x4_t)vaddw_high_u16((uint32x4_t)v73, v77);
    int32x4_t v72 = (int32x4_t)vaddw_u16((uint32x4_t)v72, *(uint16x4_t *)v77.i8);
    v71 += 16LL;
  }

  while (v71 != 512);
  unint64_t v79 = vaddvq_s32(vaddq_s32(vaddq_s32(v72, v74), vaddq_s32(v73, v75)));
  __dst[154] = 0;
  char v80 = __dst + 154;
  for (unsigned int n = 7; n > 1; --n)
  {
    unint64_t v82 = v79;
    *--char v80 = v79 & 7 | 0x30;
    v79 >>= 3;
  }

  if (v82 >= 8)
  {
    *((_WORD *)v80 + 2) = 14135;
    *(_DWORD *)char v80 = 926365495;
  }

  return v32;
}

uint64_t sub_180716FEC(uint64_t a1, uint64_t a2, size_t __len, int a4)
{
  if (1LL << (3 * __len) <= a1)
  {
    unsigned int v9 = (char *)(a2 + a4);
    if (a4 < 1)
    {
      char v11 = *v9;
    }

    else
    {
      unsigned int v10 = a4 + 1;
      do
      {
        char v11 = a1;
        *--unsigned int v9 = a1;
        a1 >>= 8;
        --v10;
      }

      while (v10 > 1);
    }

    uint64_t result = 0LL;
    char *v9 = v11 | 0x80;
  }

  else if ((int)__len < 1)
  {
    if (a1 <= 0) {
      return 0LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
    uint64_t v4 = (char *)(a2 + __len);
    unint64_t v5 = a1 & ~(a1 >> 63);
    unsigned int v6 = __len + 1;
    do
    {
      unint64_t v7 = v5;
      *--uint64_t v4 = v5 & 7 | 0x30;
      v5 >>= 3;
      --v6;
    }

    while (v6 > 1);
    if (v7 <= 7)
    {
      return 0LL;
    }

    else
    {
      memset(v4, 55, __len);
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

int BZ2_bzCompress(bz_stream *strm, int action)
{
  return MEMORY[0x189614130](strm, *(void *)&action);
}

int BZ2_bzCompressEnd(bz_stream *strm)
{
  return MEMORY[0x189614138](strm);
}

int BZ2_bzCompressInit(bz_stream *strm, int blockSize100k, int verbosity, int workFactor)
{
  return MEMORY[0x189614140](strm, *(void *)&blockSize100k, *(void *)&verbosity, *(void *)&workFactor);
}

int BZ2_bzDecompress(bz_stream *strm)
{
  return MEMORY[0x189614148](strm);
}

int BZ2_bzDecompressEnd(bz_stream *strm)
{
  return MEMORY[0x189614150](strm);
}

int BZ2_bzDecompressInit(bz_stream *strm, int verbosity, int small)
{
  return MEMORY[0x189614158](strm, *(void *)&verbosity, *(void *)&small);
}

const char *BZ2_bzlibVersion(void)
{
  return (const char *)MEMORY[0x189614160]();
}

CCCryptorStatus CCCryptorCreateWithMode( CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1895F80B8]( *(void *)&op,  *(void *)&mode,  *(void *)&alg,  *(void *)&padding,  iv,  key,  keyLength,  tweak);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1895F8120](cryptorRef);
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  return MEMORY[0x1895F8128](cryptorRef, iv);
}

CCCryptorStatus CCCryptorUpdate( CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F8130](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

int CCKeyDerivationPBKDF( CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  return MEMORY[0x1895F81F8]( *(void *)&algorithm,  password,  passwordLen,  salt,  saltLen,  *(void *)&prf,  *(void *)&rounds,  derivedKey);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1895F8278](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1895F8280](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8288](c, data, *(void *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F8298](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1895F82A0](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82A8](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F82F8](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8300](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8308](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8318](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1895F8320](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F8328](c, data, *(void *)&len);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x189602A38](type_id);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x189602C48](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x189603248](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x189603260](allocator, capacity, callBacks);
}

CFStringRef CFStringCreateWithCStringNoCopy( CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x189603470](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x18960B640](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x18960B658](allocator);
}

int UTF8Toisolat1(unsigned __int8 *out, int *outlen, const unsigned __int8 *in, int *inlen)
{
  return MEMORY[0x1896173F8](out, outlen, in, inlen);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1895F89A0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strcat_chk()
{
  return MEMORY[0x1895F89F0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A28](*(void *)&a1);
}

void abort(void)
{
}

int acl_add_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x1895F9338](flagset_d, *(void *)&flag);
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1895F9340](permset_d, *(void *)&perm);
}

int acl_clear_flags_np(acl_flagset_t flagset_d)
{
  return MEMORY[0x1895F9348](flagset_d);
}

int acl_clear_perms(acl_permset_t permset_d)
{
  return MEMORY[0x1895F9350](permset_d);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x1895F9378](acl_p, entry_p);
}

acl_t acl_dup(acl_t acl)
{
  return (acl_t)MEMORY[0x1895F9388](acl);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1895F9390](obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x1895F93A0](acl, *(void *)&entry_id, entry_p);
}

acl_t acl_get_fd(int fd)
{
  return (acl_t)MEMORY[0x1895F93A8](*(void *)&fd);
}

acl_t acl_get_fd_np(int fd, acl_type_t type)
{
  return (acl_t)MEMORY[0x1895F93B0](*(void *)&fd, *(void *)&type);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x1895F93B8](path_p, *(void *)&type);
}

int acl_get_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x1895F93C0](flagset_d, *(void *)&flag);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return MEMORY[0x1895F93C8](obj_p, flagset_p);
}

acl_t acl_get_link_np(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x1895F93D0](path_p, *(void *)&type);
}

int acl_get_perm_np(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1895F93D8](permset_d, *(void *)&perm);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x1895F93E0](entry_d, permset_p);
}

void *__cdecl acl_get_qualifier(acl_entry_t entry_d)
{
  return (void *)MEMORY[0x1895F93F0](entry_d);
}

int acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p)
{
  return MEMORY[0x1895F93F8](entry_d, tag_type_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1895F9400](*(void *)&count);
}

int acl_set_fd(int fd, acl_t acl)
{
  return MEMORY[0x1895F9408](*(void *)&fd, acl);
}

int acl_set_fd_np(int fd, acl_t acl, acl_type_t acl_type)
{
  return MEMORY[0x1895F9410](*(void *)&fd, acl, *(void *)&acl_type);
}

int acl_set_link_np(const char *path_p, acl_type_t type, acl_t acl)
{
  return MEMORY[0x1895F9428](path_p, *(void *)&type, acl);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x1895F9440](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x1895F9448](entry_d, *(void *)&tag_type);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x1895F95A0](a1);
}

void *__cdecl bsearch( const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1895F9650](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int chdir(const char *a1)
{
  return MEMORY[0x1895FA528](a1);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FA538](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

uLong compressBound(uLong sourceLen)
{
  return MEMORY[0x189617570](sourceLen);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1895FAA60](from, to, state, *(void *)&flags);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x189617578](crc, buf, *(void *)&len);
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return (char *)MEMORY[0x1895FAAC0](a1, a2);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x189617580](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x189617590](strm);
}

int deflateInit2_( z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x189617598]( strm,  *(void *)&level,  *(void *)&method,  *(void *)&windowBits,  *(void *)&memLevel,  *(void *)&strategy,  version,  *(void *)&stream_size);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1896175A0](strm, *(void *)&level, version, *(void *)&stream_size);
}

int deflateReset(z_streamp strm)
{
  return MEMORY[0x1896175A8](strm);
}

int dup(int a1)
{
  return MEMORY[0x1895FAFA8](*(void *)&a1);
}

void exit(int a1)
{
}

int fchdir(int a1)
{
  return MEMORY[0x1895FB1D0](*(void *)&a1);
}

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x1895FB1D8](*(void *)&a1, *(void *)&a2);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1895FB1E0](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FB1F0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1895FB230](*(void *)&a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FB250](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FB270](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB298](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FB2A0](a1);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1895FB2E8](*(void *)&fd, namebuff, size, *(void *)&options);
}

uint64_t fpathconf(int a1, int a2)
{
  return MEMORY[0x1895FB358](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1895FB3C8](*(void *)&fd, name, *(void *)&options);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1895FB428](__stream, a2, *(void *)&__whence);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB438](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1895FB458](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1895FB460](*(void *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x1895FB4C0](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

gid_t getgid(void)
{
  return MEMORY[0x1895FB550]();
}

int getgrgid_r(gid_t a1, group *a2, char *a3, size_t a4, group **a5)
{
  return MEMORY[0x1895FB560](*(void *)&a1, a2, a3, a4, a5);
}

int getgrnam_r(const char *a1, group *a2, char *a3, size_t a4, group **a5)
{
  return MEMORY[0x1895FB570](a1, a2, a3, a4, a5);
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1895FB668](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1895FB678](*(void *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB708](path, name, value, size, *(void *)&position, *(void *)&options);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FB728](a1, a2);
}

size_t iconv(iconv_t __cd, char **__inbuf, size_t *__inbytesleft, char **__outbuf, size_t *__outbytesleft)
{
  return MEMORY[0x1896153E8](__cd, __inbuf, __inbytesleft, __outbuf, __outbytesleft);
}

int iconv_close(iconv_t _cd)
{
  return MEMORY[0x1896153F0](_cd);
}

iconv_t iconv_open(const char *__tocode, const char *__fromcode)
{
  return (iconv_t)MEMORY[0x1896153F8](__tocode, __fromcode);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x189617608](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x189617610](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x189617618](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x189617620](strm, version, *(void *)&stream_size);
}

int inflateReset(z_streamp strm)
{
  return MEMORY[0x189617628](strm);
}

int inflateSetDictionary(z_streamp strm, const Bytef *dictionary, uInt dictLength)
{
  return MEMORY[0x189617630](strm, dictionary, *(void *)&dictLength);
}

int issetugid(void)
{
  return MEMORY[0x1895FB870]();
}

int lchflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x1895FB9A8](a1, *(void *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FB9B0](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FB9B8](a1, *(void *)&a2, *(void *)&a3);
}

int linkat(int a1, const char *a2, int a3, const char *a4, int a5)
{
  return MEMORY[0x1895FB9F0](*(void *)&a1, a2, *(void *)&a3, a4, *(void *)&a5);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1895FBA00](path, namebuff, size, *(void *)&options);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FBA20](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

int lutimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1895FBA90](a1, a2);
}

uint64_t lzma_alone_decoder()
{
  return MEMORY[0x189615E38]();
}

uint64_t lzma_alone_encoder()
{
  return MEMORY[0x189615E40]();
}

uint64_t lzma_code()
{
  return MEMORY[0x189615E50]();
}

uint64_t lzma_crc32()
{
  return MEMORY[0x189615E58]();
}

uint64_t lzma_end()
{
  return MEMORY[0x189615E70]();
}

uint64_t lzma_lzma_preset()
{
  return MEMORY[0x189615E78]();
}

uint64_t lzma_memusage()
{
  return MEMORY[0x189615E80]();
}

uint64_t lzma_properties_decode()
{
  return MEMORY[0x189615E88]();
}

uint64_t lzma_properties_encode()
{
  return MEMORY[0x189615E90]();
}

uint64_t lzma_properties_size()
{
  return MEMORY[0x189615E98]();
}

uint64_t lzma_raw_decoder()
{
  return MEMORY[0x189615EA0]();
}

uint64_t lzma_raw_encoder()
{
  return MEMORY[0x189615EA8]();
}

uint64_t lzma_stream_decoder()
{
  return MEMORY[0x189615EC0]();
}

uint64_t lzma_stream_encoder()
{
  return MEMORY[0x189615EC8]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x1895FBD80](*(void *)&gid, uu);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1895FBDA8](*(void *)&uid, uu);
}

int mbr_uuid_to_id(const uuid_t uu, id_t *uid_or_gid, int *id_type)
{
  return MEMORY[0x1895FBDB0](uu, uid_or_gid, id_type);
}

size_t mbrtowc(__int32 *a1, const char *a2, size_t a3, mbstate_t *a4)
{
  return MEMORY[0x1895FBDC8](a1, a2, a3, a4);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

int mkfifo(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBF10](a1, a2);
}

int mknod(const char *a1, mode_t a2, dev_t a3)
{
  return MEMORY[0x1895FBF18](a1, a2, *(void *)&a3);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1895FBF38](a1);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1895FBF60](a1);
}

char *__cdecl nl_langinfo(nl_item a1)
{
  return (char *)MEMORY[0x1895FC178](*(void *)&a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1895FC268](*(void *)&a1, a2, *(void *)&a3);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t pathconf(const char *a1, int a2)
{
  return MEMORY[0x1895FC768](a1, *(void *)&a2);
}

int pipe(int a1[2])
{
  return MEMORY[0x1895FC7B0](a1);
}

int poll(pollfd *a1, nfds_t a2, int a3)
{
  return MEMORY[0x1895FC7B8](a1, *(void *)&a2, *(void *)&a3);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x1895FC7E8](a1, *(void *)&a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1895FC7F0](a1, *(void *)&a2, *(void *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1895FC808](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1895FC810](a1);
}

int posix_spawnp( pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1895FC868](a1, a2, a3, a4, __argv, __envp);
}

uint64_t pthread_chdir_np()
{
  return MEMORY[0x1895FC990]();
}

uint64_t pthread_fchdir_np()
{
  return MEMORY[0x1895FCA10]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FCC50](a1, a2, a3);
}

ssize_t readlinkat(int a1, const char *a2, char *a3, size_t a4)
{
  return MEMORY[0x1895FCC58](*(void *)&a1, a2, a3, a4);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1895FCD80](a1);
}

int setxattr( const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FCEE0](path, name, value, size, *(void *)&position, *(void *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1895FD040](__s1, __s2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1895FD068](__dst, __src);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD070](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1895FD090](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD140](__s, __charset);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD240](a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1895FD408](a1);
}

void tzset(void)
{
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1895FD448](a1);
}

int uname(utsname *a1)
{
  return MEMORY[0x1895FD450](a1);
}

int uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x189617638](dest, destLen, source, sourceLen);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1895FD638](*(void *)&a1, a2, *(void *)&a3);
}

size_t wcrtomb(char *a1, __int32 a2, mbstate_t *a3)
{
  return MEMORY[0x1895FD658](a1, *(void *)&a2, a3);
}

__int32 *__cdecl wcschr(const __int32 *a1, __int32 a2)
{
  return (__int32 *)MEMORY[0x1895FD668](a1, *(void *)&a2);
}

__int32 *__cdecl wcscpy(__int32 *a1, const __int32 *a2)
{
  return (__int32 *)MEMORY[0x1895FD680](a1, a2);
}

size_t wcslen(const __int32 *a1)
{
  return MEMORY[0x1895FD690](a1);
}

int wmemcmp(const __int32 *a1, const __int32 *a2, size_t a3)
{
  return MEMORY[0x1895FD738](a1, a2, a3);
}

__int32 *__cdecl wmemmove(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)MEMORY[0x1895FD748](a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x189617400]();
}

void xmlBufferFree(xmlBufferPtr buf)
{
}

void xmlCleanupParser(void)
{
}

void xmlFreeTextReader(xmlTextReaderPtr reader)
{
}

void xmlFreeTextWriter(xmlTextWriterPtr writer)
{
}

xmlTextWriterPtr xmlNewTextWriterMemory(xmlBufferPtr buf, int compression)
{
  return (xmlTextWriterPtr)MEMORY[0x189617470](buf, *(void *)&compression);
}

xmlTextReaderPtr xmlReaderForIO( xmlInputReadCallback ioread, xmlInputCloseCallback ioclose, void *ioctx, const char *URL, const char *encoding, int options)
{
  return (xmlTextReaderPtr)MEMORY[0x189617488](ioread, ioclose, ioctx, URL, encoding, *(void *)&options);
}

const xmlChar *__cdecl xmlTextReaderConstLocalName(xmlTextReaderPtr reader)
{
  return (const xmlChar *)MEMORY[0x1896174E0](reader);
}

const xmlChar *__cdecl xmlTextReaderConstValue(xmlTextReaderPtr reader)
{
  return (const xmlChar *)MEMORY[0x1896174E8](reader);
}

int xmlTextReaderIsEmptyElement(xmlTextReaderPtr reader)
{
  return MEMORY[0x1896174F0](reader);
}

int xmlTextReaderMoveToFirstAttribute(xmlTextReaderPtr reader)
{
  return MEMORY[0x1896174F8](reader);
}

int xmlTextReaderMoveToNextAttribute(xmlTextReaderPtr reader)
{
  return MEMORY[0x189617500](reader);
}

int xmlTextReaderNodeType(xmlTextReaderPtr reader)
{
  return MEMORY[0x189617508](reader);
}

int xmlTextReaderRead(xmlTextReaderPtr reader)
{
  return MEMORY[0x189617510](reader);
}

void xmlTextReaderSetErrorHandler(xmlTextReaderPtr reader, xmlTextReaderErrorFunc f, void *arg)
{
}

int xmlTextWriterEndDocument(xmlTextWriterPtr writer)
{
  return MEMORY[0x189617520](writer);
}

int xmlTextWriterEndElement(xmlTextWriterPtr writer)
{
  return MEMORY[0x189617528](writer);
}

int xmlTextWriterSetIndent(xmlTextWriterPtr writer, int indent)
{
  return MEMORY[0x189617530](writer, *(void *)&indent);
}

int xmlTextWriterStartDocument( xmlTextWriterPtr writer, const char *version, const char *encoding, const char *standalone)
{
  return MEMORY[0x189617538](writer, version, encoding, standalone);
}

int xmlTextWriterStartElement(xmlTextWriterPtr writer, const xmlChar *name)
{
  return MEMORY[0x189617540](writer, name);
}

int xmlTextWriterWriteAttribute(xmlTextWriterPtr writer, const xmlChar *name, const xmlChar *content)
{
  return MEMORY[0x189617548](writer, name, content);
}

int xmlTextWriterWriteBase64(xmlTextWriterPtr writer, const char *data, int start, int len)
{
  return MEMORY[0x189617550](writer, data, *(void *)&start, *(void *)&len);
}

int xmlTextWriterWriteFormatAttribute(xmlTextWriterPtr writer, const xmlChar *name, const char *format, ...)
{
  return MEMORY[0x189617558](writer, name, format);
}