const char *locale_charset(void)
{
  char *v0;
  char **v1;
  uint64_t v2;
  char *v3;
  int v4;
  int v5;
  int v6;
  FILE *v7;
  FILE *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  char **v17;
  char **v18;
  char **v19;
  char *v20;
  const char *v21;
  char *v22;
  void **v23;
  char **v24;
  const char *v25;
  size_t v27;
  char v28;
  char __s1[2];
  uint64_t v30;
  v30 = *MEMORY[0x1895F89C0];
  v1 = (char **)charset_map;
  if (charset_map)
  {
    v2 = charset_elems;
    goto LABEL_6;
  }

  v3 = getenv("CHARSETALIASDIR");
  if (v3)
  {
    if (*v3)
    {
      v4 = open(v3, 0x100000);
      v5 = v4;
      if (v4 != -1)
      {
        v6 = openat(v4, "charset.alias", 0);
        if (v6 != -1)
        {
          v7 = fdopen(v6, "r");
          if (v7)
          {
            v8 = v7;
            v9 = 0LL;
            v1 = (char **)&charset_mappings_static;
            v10 = 8LL;
            v11 = MEMORY[0x1895F8770];
            while (!feof(v8) && !ferror(v8))
            {
              do
              {
                v12 = getc(v8);
                v13 = v12;
                if (v12 > 0x7F) {
                  v14 = __maskrune(v12, 0x4000uLL);
                }
                else {
                  v14 = *(_DWORD *)(v11 + 4LL * v12 + 60) & 0x4000;
                }
              }

              while (v13 != -1 && v14);
              if (v13 == 35)
              {
                fgetln(v8, &v27);
              }

              else
              {
                if (v13 == -1) {
                  break;
                }
                ungetc(v13, v8);
                if (fscanf(v8, "%64s %64s", __s1, &v28) != 2 || !__s1[0]) {
                  break;
                }
                if (v9 == v10)
                {
                  v15 = 64LL;
                  if (v10 < 0x40) {
                    v15 = v10;
                  }
                  v16 = v15 + v10;
                  v17 = (char **)calloc(v15 + v10, 0x10uLL);
                  if (!v17)
                  {
                    v9 = v10;
                    break;
                  }

                  v18 = v17;
                  memcpy(v17, v1, 16 * v10);
                  v1 = v18;
                  v10 = v16;
                }

                v19 = &v1[2 * v9];
                v20 = strdup(__s1);
                *v19 = v20;
                if (v28) {
                  v21 = &v28;
                }
                else {
                  v21 = "ASCII";
                }
                v22 = strdup(v21);
                v19[1] = v22;
                v23 = (void **)(v19 + 1);
                if (!v20 || !v22)
                {
                  free(v20);
                  v1[2 * v9] = 0LL;
                  free(*v23);
                  *v23 = 0LL;
LABEL_58:
                  charset_elems = v9;
                  goto LABEL_61;
                }

                ++v9;
              }
            }

            charset_elems = v9;
            if (!v1) {
              locale_charset_cold_3();
            }
LABEL_61:
            fclose(v8);
            goto LABEL_51;
          }
        }
      }
    }

    else
    {
      v5 = -1;
    }

    v1 = 0LL;
    charset_elems = 0LL;
LABEL_51:
    if (v5 != -1) {
      close(v5);
    }
    charset_map = (uint64_t)v1;
    v2 = charset_elems;
LABEL_6:
    if (!v2) {
      goto LABEL_47;
    }
    goto LABEL_41;
  }

  v2 = 1LL;
  charset_elems = 1LL;
  v1 = (char **)&charset_mappings_static;
  charset_map = (uint64_t)&charset_mappings_static;
LABEL_41:
  v24 = v1 + 1;
  while (1)
  {
    v25 = *(v24 - 1);
    if (!strcmp(v25, "*") || !strcmp(v25, v0)) {
      break;
    }
    v24 += 2;
    if (!--v2) {
      goto LABEL_47;
    }
  }

  v0 = *v24;
LABEL_47:
  if (!*v0) {
    locale_charset_cold_1();
  }
  return v0;
}

void locale_charset_cold_1()
{
  __assert_rtn("locale_charset", "libcharset.c", 346, "ret[0] != '\\0'");
}

void locale_charset_cold_2()
{
  __assert_rtn("locale_charset_mapped", "libcharset.c", 304, "map != NULL || nelem == 0");
}

void locale_charset_cold_3()
{
  __assert_rtn("libcharset_build_map", "libcharset.c", 232, "map != NULL");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1895FB228](*(void *)&a1, a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1895FB248](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FB250](a1);
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return (char *)MEMORY[0x1895FB288](a1, a2);
}

void free(void *a1)
{
}

int fscanf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB410](a1, a2);
}

int getc(FILE *a1)
{
  return MEMORY[0x1895FB518](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}