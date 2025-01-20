unint64_t sub_10000318C(FILE *a1, FILE *a2, unint64_t a3, unint64_t a4, int a5)
{
  unint64_t v10;
  unint64_t v11;
  char __str[32];
  do
  {
    do
    {
      printf("> ");
      fflush(__stdoutp);
      fgets(__str, 32, a1);
      v10 = strtoul(__str, 0LL, a5);
    }

    while (v10 < a3);
    v11 = v10;
  }

  while (v10 > a4);
  if (a2)
  {
    fprintf(a2, "%lu\n", v10);
    fflush(a2);
  }

  return v11;
}

uint64_t sub_10000327C(char *__str, int __base)
{
  if (*__str != 48 || __str[1] != 98) {
    return strtoul(__str, 0LL, __base);
  }
  int v3 = __str[2];
  if ((v3 & 0xFE) != 0x30) {
    return 0LL;
  }
  uint64_t result = 0LL;
  v5 = __str + 3;
  do
  {
    uint64_t result = (v3 == 49) | (unint64_t)(2 * result);
    int v6 = *v5++;
    int v3 = v6;
  }

  while ((v6 & 0xFE) == 0x30);
  return result;
}

void sub_1000032E8(void *a1)
{
}

void *sub_1000032F8(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_1000033A8();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    int v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    int v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_1000033A8()
{
}

void sub_1000033BC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000340C(exception, a1);
}

void sub_1000033F8(_Unwind_Exception *a1)
{
}

std::logic_error *sub_10000340C(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100003430()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_100003458(_BYTE *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_1000033A8();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    void *v5 = v8;
    size_t v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void *sub_1000034E4(void *a1, uint64_t a2, uint64_t a3)
{
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
      v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32LL);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }

    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_100003648(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_1000035EC( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

void sub_100003634(_Unwind_Exception *a1)
{
}

uint64_t sub_100003648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0LL;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (v12 >= 1)
    {
      sub_100003784(__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96LL))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0LL;
      }
    }

    uint64_t v15 = a4 - a3;
    else {
      return 0LL;
    }
  }

  return v6;
}

void sub_100003768( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100003784(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_1000033A8();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000LL;
    *__b = v6;
  }

  else
  {
    *((_BYTE *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

uint64_t *sub_10000382C(uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      size_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            int v9 = (uint64_t **)a2[2];
          }

          else
          {
            int v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            *int v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }

      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }

          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }

        else
        {
          a2 = (uint64_t *)a2[2];
        }

        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }

      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      _BYTE *v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

uint64_t sub_1000039C4(uint64_t a1)
{
  *(_BYTE *)a1 = 1;
  *(void *)(a1 + 4) = 0x1000000001LL;
  *(void *)(a1 + 16) = __stdoutp;
  ioctl(0, 0x40087468uLL, v4);
  if (v5)
  {
    if (v5 < 0x11u) {
      unsigned int v2 = 1;
    }
    else {
      unsigned int v2 = v5 / 0x11u;
    }
    *(_DWORD *)(a1 + 4) = v2;
  }

  return a1;
}

uint64_t sub_100003A4C()
{
  return v2;
}

FILE *sub_100003A84(uint64_t a1)
{
  uint64_t result = *(FILE **)(a1 + 16);
  if (result) {
    BOOL v3 = result == __stdoutp;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3 && result != __stderrp)
  {
    uint64_t result = (FILE *)fclose(result);
    *(void *)(a1 + 16) = 0LL;
  }

  return result;
}

uint64_t sub_100003AD4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100003AF8(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)(result + 4) = a2;
    *(_BYTE *)uint64_t result = 0;
  }

  return result;
}

uint64_t sub_100003B08(uint64_t result, int a2)
{
  *(_DWORD *)(result + 8) = a2;
  return result;
}

uint64_t sub_100003B10(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    if (!*(void *)(a2 + 8)) {
      return 0LL;
    }
    size_t v4 = *(const char **)a2;
  }

  else
  {
    size_t v4 = (const char *)a2;
    if (!*(_BYTE *)(a2 + 23)) {
      return 0LL;
    }
  }

  unsigned __int16 v5 = fopen(v4, "w");
  if (v5)
  {
    int v6 = v5;
    sub_100003A84(a1);
    *(void *)(a1 + 16) = v6;
    return 1LL;
  }

  else {
    int v8 = *(const char **)a2;
  }
  fprintf(__stderrp, "Unable to open output file %s\n", v8);
  return 0LL;
}

uint64_t sub_100003BB8(uint64_t a1, uint64_t a2)
{
  unsigned __int16 v2 = *(FILE **)(a1 + 16);
  else {
    BOOL v3 = *(const char **)a2;
  }
  return fprintf(v2, "%s\n", v3);
}

uint64_t sub_100003BF4(uint64_t result, int **a2, int a3, int a4)
{
  size_t v4 = *a2;
  v20 = a2[1];
  if (*a2 != v20)
  {
    uint64_t v7 = result;
    do
    {
      unsigned int v8 = *(_DWORD *)(v7 + 4);
      if (a3 == 4 && *(_BYTE *)v7)
      {
        double v9 = (double)v8;
        if (*(_DWORD *)(v7 + 8) == 10) {
          double v10 = v9 / 1.8;
        }
        else {
          double v10 = v9 / 1.5;
        }
        unsigned int v8 = v10;
      }

      if (v8 <= 1) {
        unsigned int v11 = 1;
      }
      else {
        unsigned int v11 = v8;
      }
      uint64_t v12 = *((void *)v4 + 1);
      uint64_t v13 = *((void *)v4 + 2) - v12;
      if (v13)
      {
        unsigned int v14 = 0;
        LODWORD(v15) = 0;
        int v16 = *v4;
        unint64_t v17 = v13 >> 2;
        unsigned int v18 = (v11 + ((unint64_t)(*((void *)v4 + 2) - v12) >> 2) - 1) / v11;
        do
        {
          unint64_t v19 = v15 / v11 + v14 * v18;
          if (v17 > v19) {
            sub_100003D78(v7, (v16 + v19 * a4), *(_DWORD *)(v12 + 4 * v19), a3, 0);
          }
          if (v14 + 1 == v11 || v14 == -1) {
            fputc(10, *(FILE **)(v7 + 16));
          }
          else {
            fwrite("  ", 2uLL, 1uLL, *(FILE **)(v7 + 16));
          }
          unint64_t v15 = (v15 + 1);
          uint64_t v12 = *((void *)v4 + 1);
          unint64_t v17 = (*((void *)v4 + 2) - v12) >> 2;
          unsigned int v14 = v15 % v11;
        }

        while (v17 > v15 || v14);
      }

      uint64_t result = fputc(10, *(FILE **)(v7 + 16));
      v4 += 8;
    }

    while (v4 != v20);
  }

  return result;
}

uint64_t sub_100003D78(uint64_t a1, uint64_t a2, unsigned int a3, int a4, int a5)
{
  int v20 = 0;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v15 = 0u;
  int v9 = *(_DWORD *)(a1 + 8);
  if (v9 == 10)
  {
    switch(a4)
    {
      case 4:
        snprintf(__str, 0x64uLL, "R%012ud: %012d");
        break;
      case 2:
        snprintf(__str, 0x64uLL, "R%06ud: %06d");
        break;
      case 1:
        snprintf(__str, 0x64uLL, "R%06ud: %04d");
        break;
      default:
        fprintf(__stderrp, "Unexpected register width (%d).  Supported widths are 1 and 4\n");
        break;
    }
  }

  else if (v9 == 16)
  {
    switch(a4)
    {
      case 4:
        snprintf(__str, 0x64uLL, "%8Xh: 0x%08x");
        break;
      case 2:
        snprintf(__str, 0x64uLL, "%8Xh: 0x%04x");
        break;
      case 1:
        snprintf(__str, 0x64uLL, "%8Xh: 0x%02x");
        break;
      default:
        fprintf(__stderrp, "Unexpected register width (%d).  Supported widths are 1, 2, and 4\n");
        break;
    }
  }

  uint64_t result = fputs(__str, *(FILE **)(a1 + 16));
  if (a5)
  {
    fwrite("    ", 4uLL, 1uLL, *(FILE **)(a1 + 16));
    unint64_t v11 = (8 * a4);
    if ((_DWORD)v11)
    {
      do
      {
        if (((a3 >> (v11 - 1)) & 1) != 0) {
          int v12 = 49;
        }
        else {
          int v12 = 48;
        }
        fputc(v12, *(FILE **)(a1 + 16));
      }

      while (v11-- > 1);
    }

    return fputc(10, *(FILE **)(a1 + 16));
  }

  return result;
}

uint64_t sub_100003F78(uint64_t a1, unsigned int *a2, int a3)
{
  int v12 = 0;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v7 = 0u;
  int v4 = *(_DWORD *)(a1 + 8);
  if (v4 == 10)
  {
    snprintf(__str, 0x64uLL, "R%0*d: bitmask = %0*d, val = %0*d (patched count: %d)\n", (3 * a3));
  }

  else if (v4 == 16)
  {
    snprintf(__str, 0x64uLL, "%8Xh: bitmask = 0x%0*x, val = 0x%0*x (patched count: %d)\n", *a2);
  }

  return fputs(__str, *(FILE **)(a1 + 16));
}

double sub_100004054(uint64_t a1)
{
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)a1 = a1 + 8;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 48) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(_DWORD *)(a1 + 56) = -1;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 64) = 0LL;
  *(void *)&double result = 16LL;
  *(void *)(a1 + 88) = 16LL;
  *(_WORD *)(a1 + 96) = 256;
  return result;
}

size_t sub_100004098(uint64_t a1, int a2)
{
  BOOL v3 = __stderrp;
  int v4 = getprogname();
  fprintf(v3, "usage: %s [-d | -x] [-p] [-u] [-H val] [-c width] [-f file] [codec|index|default] [sequence...]\n", v4);
  fwrite("\t-d\tUse decimal register numbers\n", 0x21uLL, 1uLL, __stderrp);
  fwrite("\t-x\tUse hex register numbers\n", 0x1DuLL, 1uLL, __stderrp);
  fwrite("\t-H\tForce headphone detect: true/false\n", 0x27uLL, 1uLL, __stderrp);
  fwrite("\t-p\tPing codec (set exit status based on success)\n", 0x32uLL, 1uLL, __stderrp);
  fwrite("\t-u\tMatch codec on HAL UID rather than name\n", 0x2CuLL, 1uLL, __stderrp);
  fwrite("\t-c\tSet the column width (default is to expand to fit screen\n", 0x3DuLL, 1uLL, __stderrp);
  fwrite("\t-f\tDump output to file\n", 0x18uLL, 1uLL, __stderrp);
  fwrite("\t-a\tDump all codec settings then quit\n", 0x26uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("Sequence options:", 0x11uLL, 1uLL, __stderrp);
  fwrite("\t<reg> <value> <sleep_ms> \tWrite register\n", 0x2AuLL, 1uLL, __stderrp);
  fwrite("\tdump                     \tRead all registers\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\tread <reg>               \tRead single register\n", 0x30uLL, 1uLL, __stderrp);
  fwrite("\tread <reg>,<count>       \tRead register range\n", 0x2FuLL, 1uLL, __stderrp);
  fwrite("\twrite <reg> <value>      \tWrite single register\n", 0x31uLL, 1uLL, __stderrp);
  fwrite("\tmask <reg> <mask> <value>\tMask and write single register\n", 0x3AuLL, 1uLL, __stderrp);
  fwrite( "\tpatch <reg> <mask> <value>\tThis command can patch a register bitmask value similar to above\n \t                          \t'mask' command format, but only by patching that bitmask value in driver.\n \t                          \tWhen the underlying driver write a bitmask value during the runtime,\n \t                          \tthe (address matched) bitmask patch will be applied. This can be used\n \t                          \tas driver tunable for some parameters, control logic register should\n \t                          \tnot be patched.\n",  0x213uLL,  1uLL,  __stderrp);
  fwrite( "\tpatch reset\t\t\tRemove all register bitmask patch, it will rest the underlying driver to its default behavior.\n",  0x6EuLL,  1uLL,  __stderrp);
  fwrite( "\tpatch list\t\t\tList all patched register bitmask list, it also show how many times underlying\n \t          \t\t\tdriver actually write the patched bitmask.\n",  0x96uLL,  1uLL,  __stderrp);
  fputc(10, __stderrp);
  size_t result = fwrite("Specify no sequence for interactive mode\n\n", 0x2AuLL, 1uLL, __stderrp);
  if (a2) {
    exit(0);
  }
  return result;
}

uint64_t sub_1000042D4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 97);
}

uint64_t sub_1000042DC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t sub_1000042E4(uint64_t a1, std::string *this)
{
  int v4 = std::string::compare(this, "default");
  unsigned __int16 v5 = (std::string *)(a1 + 32);
  if (v4)
  {
    std::string::operator=(v5, this);
  }

  else
  {
    if (*(char *)(a1 + 55) < 0)
    {
      *(void *)(a1 + 40) = 5LL;
      unsigned __int16 v5 = *(std::string **)(a1 + 32);
    }

    else
    {
      *(_BYTE *)(a1 + 55) = 5;
    }

    strcpy((char *)v5, "Codec");
    *(_BYTE *)(a1 + 96) = 1;
  }

  return 1LL;
}

char *sub_10000436C@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  if (result[55] < 0) {
    return (char *)sub_100003458((_BYTE *)a2, *((void **)result + 4), *((void *)result + 5));
  }
  *(_OWORD *)a2 = *((_OWORD *)result + 2);
  *(void *)(a2 + 16) = *((void *)result + 6);
  return result;
}

uint64_t sub_100004398(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

BOOL sub_1000043A0(uint64_t a1, const std::string *a2)
{
  if ((a2->__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type size = a2->__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type size = a2->__r_.__value_.__l.__size_;
  }
  if (size) {
    std::string::operator=((std::string *)(a1 + 64), a2);
  }
  else {
    fwrite("Empty output file name\n", 0x17uLL, 1uLL, __stderrp);
  }
  return size != 0;
}

char *sub_100004404@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  if (result[87] < 0) {
    return (char *)sub_100003458((_BYTE *)a2, *((void **)result + 8), *((void *)result + 9));
  }
  *(_OWORD *)a2 = *((_OWORD *)result + 4);
  *(void *)(a2 + 16) = *((void *)result + 10);
  return result;
}

uint64_t sub_100004430(uint64_t a1)
{
  return *(unsigned int *)(a1 + 88);
}

uint64_t sub_100004438(uint64_t a1)
{
  return *(unsigned int *)(a1 + 92);
}

uint64_t sub_100004440(uint64_t a1, int a2, char **a3)
{
  while (2)
  {
    while (1)
    {
      uint64_t v6 = getopt(a2, a3, "h?xdH:upc:f:a");
      switch((_DWORD)v6)
      {
        case 'p':
          uint64_t v7 = a1;
          int v8 = 5;
LABEL_21:
          sub_1000047B0(v7, v8, 0LL);
          break;
        case 'u':
          *(_BYTE *)(a1 + 96) = 1;
          break;
        case 'x':
          *(_DWORD *)(a1 + 88) = 16;
          break;
        default:
          goto LABEL_33;
      }
    }

    switch((int)v6)
    {
      case 'a':
        uint64_t v7 = a1;
        int v8 = 4;
        goto LABEL_21;
      case 'b':
      case 'e':
        goto LABEL_33;
      case 'c':
        *(_DWORD *)(a1 + 92) = atoi(optarg);
        continue;
      case 'd':
        *(_DWORD *)(a1 + 88) = 10;
        continue;
      case 'f':
        sub_1000032F8(&__p, optarg);
        uint64_t v6 = sub_1000043A0(a1, &__p);
        char v17 = v6;
        if ((v17 & 1) == 0) {
          goto LABEL_33;
        }
        continue;
      default:
        if ((_DWORD)v6 == 72)
        {
          memset(&__p, 0, sizeof(__p));
          __int128 v9 = optarg;
          if (!strcmp(optarg, "true"))
          {
            __int128 v11 = sub_1000051C8((uint64_t)&__p.__r_.__value_.__l.__cap_, 1uLL);
            std::string::size_type size = __p.__r_.__value_.__l.__size_;
            int v12 = (void *)__p.__r_.__value_.__r.__words[0];
            *__int128 v11 = 1LL;
            std::string::size_type v14 = (std::string::size_type)(v11 + 1);
            std::string::size_type v15 = (std::string::size_type)v11;
            while ((void *)size != v12)
            {
              uint64_t v19 = *(void *)(size - 8);
              size -= 8LL;
              *(void *)(v15 - 8) = v19;
              v15 -= 8LL;
            }
          }

          else
          {
            if (strcmp(v9, "false")) {
              goto LABEL_29;
            }
            __int128 v11 = sub_1000051C8((uint64_t)&__p.__r_.__value_.__l.__cap_, 1uLL);
            std::string::size_type v13 = __p.__r_.__value_.__l.__size_;
            int v12 = (void *)__p.__r_.__value_.__r.__words[0];
            *__int128 v11 = 0LL;
            std::string::size_type v14 = (std::string::size_type)(v11 + 1);
            std::string::size_type v15 = (std::string::size_type)v11;
            while ((void *)v13 != v12)
            {
              uint64_t v16 = *(void *)(v13 - 8);
              v13 -= 8LL;
              *(void *)(v15 - 8) = v16;
              v15 -= 8LL;
            }
          }

          __p.__r_.__value_.__r.__words[0] = v15;
          __p.__r_.__value_.__l.__size_ = v14;
          __p.__r_.__value_.__l.__cap_ = (std::string::size_type)&v11[v10];
          if (v12) {
            operator delete(v12);
          }
          __p.__r_.__value_.__l.__size_ = v14;
LABEL_29:
          sub_1000047B0(a1, 6, (uint64_t)&__p);
          if (__p.__r_.__value_.__r.__words[0])
          {
            __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
            operator delete(__p.__r_.__value_.__l.__data_);
          }

          continue;
        }

        if ((_DWORD)v6 == -1) {
          return sub_100004860(a1, a2 - optind, (uint64_t)&a3[optind]);
        }
LABEL_33:
        sub_100004098(v6, 0);
        return 0LL;
    }
  }
}

void sub_100004694( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000046CC(uint64_t a1, void *a2)
{
  uint64_t v4 = a1 + 16;
  unint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void **)(a1 + 8);
  if ((unint64_t)v6 >= v5)
  {
    int v8 = *(void **)a1;
    uint64_t v9 = ((uint64_t)v6 - *(void *)a1) >> 3;
    unint64_t v10 = v9 + 1;
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      std::string::size_type v13 = (char *)sub_1000051C8(v4, v12);
      int v8 = *(void **)a1;
      uint64_t v6 = *(void **)(a1 + 8);
    }

    else
    {
      std::string::size_type v13 = 0LL;
    }

    std::string::size_type v14 = &v13[8 * v9];
    std::string::size_type v15 = &v13[8 * v12];
    *(void *)std::string::size_type v14 = *a2;
    uint64_t v7 = v14 + 8;
    while (v6 != v8)
    {
      uint64_t v16 = *--v6;
      *((void *)v14 - 1) = v16;
      v14 -= 8;
    }

    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }

  else
  {
    *uint64_t v6 = *a2;
    uint64_t v7 = v6 + 1;
  }

  *(void *)(a1 + 8) = v7;
}

uint64_t sub_1000047B0(uint64_t a1, int a2, uint64_t a3)
{
  int v10 = a2;
  if (!a3)
  {
    uint64_t v11 = &v10;
    unint64_t v5 = (char *)(sub_100005344((uint64_t **)a1, &v10, (uint64_t)&unk_10000BC60, &v11) + 5);
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    unint64_t v8 = 0LL;
    goto LABEL_5;
  }

  uint64_t v11 = &v10;
  unint64_t v5 = (char *)(sub_100005344((uint64_t **)a1, &v10, (uint64_t)&unk_10000BC60, &v11) + 5);
  if (v5 != (char *)a3)
  {
    uint64_t v6 = *(char **)a3;
    uint64_t v7 = *(void *)(a3 + 8);
    unint64_t v8 = (v7 - *(void *)a3) >> 3;
LABEL_5:
    sub_1000051FC(v5, v6, v7, v8);
  }

  *(_BYTE *)(a1 + 97) = 0;
  return 1LL;
}

uint64_t sub_100004860(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v6 = *(char **)a3;
    size_t v7 = strlen(*(const char **)a3);
    if (v7)
    {
      uint64_t v8 = 0LL;
      while ((v6[v8] & 0x80000000) == 0 && (_DefaultRuneLocale.__runetype[v6[v8]] & 0x400) != 0)
      {
        if (v7 == ++v8) {
          goto LABEL_7;
        }
      }

      sub_1000032F8(&__p, v6);
      sub_1000042E4(a1, &__p);
    }

    else
    {
LABEL_7:
      *(_DWORD *)(a1 + 56) = atoi(v6) - 1;
    }

    if ((int)a2 >= 2)
    {
      uint64_t v9 = *(const char **)(a3 + 8);
      if (!strcmp(v9, "dump"))
      {
        sub_1000047B0(a1, 1, 0LL);
        goto LABEL_148;
      }

      int v10 = strcmp(v9, "write");
      if (a2 < 4 || v10)
      {
        int v15 = strcmp(v9, "read");
        if (a2 >= 3 && !v15)
        {
          memset(&__p, 0, sizeof(__p));
          uint64_t v16 = *(char **)(a3 + 16);
          char v17 = strchr(v16, 44);
          if (v17)
          {
            __int128 v18 = v17;
            unint64_t v19 = strtoul(v17 + 1, 0LL, 0);
            *__int128 v18 = 0;
            uint64_t v16 = *(char **)(a3 + 16);
          }

          else
          {
            unint64_t v19 = 1LL;
          }

          uint64_t v33 = sub_10000327C(v16, *(_DWORD *)(a1 + 88));
          uint64_t v34 = v33;
          std::string::size_type cap = __p.__r_.__value_.__l.__cap_;
          std::string::size_type size = __p.__r_.__value_.__l.__size_;
          if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__l.__cap_)
          {
            v38 = (void *)__p.__r_.__value_.__r.__words[0];
            uint64_t v39 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
            unint64_t v40 = v39 + 1;
            int64_t v41 = __p.__r_.__value_.__l.__cap_ - __p.__r_.__value_.__r.__words[0];
            else {
              unint64_t v42 = v40;
            }
            if (v42)
            {
              v43 = (char *)sub_1000051C8((uint64_t)&__p.__r_.__value_.__l.__cap_, v42);
              std::string::size_type size = __p.__r_.__value_.__l.__size_;
              v38 = (void *)__p.__r_.__value_.__r.__words[0];
            }

            else
            {
              v43 = 0LL;
            }

            v67 = (uint64_t *)&v43[8 * v39];
            std::string::size_type cap = (std::string::size_type)&v43[8 * v42];
            uint64_t *v67 = v34;
            v37 = v67 + 1;
            while ((void *)size != v38)
            {
              uint64_t v68 = *(void *)(size - 8);
              size -= 8LL;
              *--v67 = v68;
            }

            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v67;
            __p.__r_.__value_.__l.__size_ = (std::string::size_type)v37;
            __p.__r_.__value_.__l.__cap_ = cap;
            if (v38)
            {
              operator delete(v38);
              std::string::size_type cap = __p.__r_.__value_.__l.__cap_;
            }
          }

          else
          {
            *(void *)__p.__r_.__value_.__l.__size_ = v33;
            v37 = (void *)(size + 8);
          }

          __p.__r_.__value_.__l.__size_ = (std::string::size_type)v37;
          if ((unint64_t)v37 >= cap)
          {
            v70 = (void *)__p.__r_.__value_.__r.__words[0];
            uint64_t v71 = (uint64_t)((uint64_t)v37 - __p.__r_.__value_.__r.__words[0]) >> 3;
            unint64_t v72 = v71 + 1;
            uint64_t v73 = cap - __p.__r_.__value_.__r.__words[0];
            if (v73 >> 2 > v72) {
              unint64_t v72 = v73 >> 2;
            }
            else {
              unint64_t v74 = v72;
            }
            if (v74)
            {
              v75 = (char *)sub_1000051C8((uint64_t)&__p.__r_.__value_.__l.__cap_, v74);
              v37 = (void *)__p.__r_.__value_.__l.__size_;
              v70 = (void *)__p.__r_.__value_.__r.__words[0];
            }

            else
            {
              v75 = 0LL;
            }

            v76 = (unint64_t *)&v75[8 * v71];
            std::string::size_type v77 = (std::string::size_type)&v75[8 * v74];
            unint64_t *v76 = v19;
            std::string::size_type v69 = (std::string::size_type)(v76 + 1);
            while (v37 != v70)
            {
              unint64_t v78 = *--v37;
              *--v76 = v78;
            }

            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v76;
            __p.__r_.__value_.__l.__size_ = v69;
            __p.__r_.__value_.__l.__cap_ = v77;
            if (v70) {
              operator delete(v70);
            }
          }

          else
          {
            void *v37 = v19;
            std::string::size_type v69 = (std::string::size_type)(v37 + 1);
          }

          __p.__r_.__value_.__l.__size_ = v69;
          sub_1000047B0(a1, 0, (uint64_t)&__p);
          goto LABEL_146;
        }

        int v20 = strcmp(v9, "mask");
        if (a2 < 5 || v20)
        {
          uint64_t v31 = strcmp(v9, "patch");
          if ((_DWORD)v31)
          {
            sub_100004098(v31, 1);
            return 0LL;
          }

          memset(&__p, 0, sizeof(__p));
          v66 = *(const char **)(a3 + 16);
          if (!strcmp(v66, "reset"))
          {
            uint64_t v108 = 1LL;
            sub_1000046CC((uint64_t)&__p, &v108);
          }

          else
          {
            if (!strcmp(v66, "list"))
            {
              uint64_t v108 = 2LL;
            }

            else
            {
              uint64_t v108 = 0LL;
              sub_1000046CC((uint64_t)&__p, &v108);
              uint64_t v108 = sub_10000327C(*(char **)(a3 + 16), *(_DWORD *)(a1 + 88));
              sub_1000046CC((uint64_t)&__p, &v108);
              uint64_t v108 = sub_10000327C(*(char **)(a3 + 32), *(_DWORD *)(a1 + 88));
              sub_1000046CC((uint64_t)&__p, &v108);
              uint64_t v108 = sub_10000327C(*(char **)(a3 + 24), *(_DWORD *)(a1 + 88));
            }

            sub_1000046CC((uint64_t)&__p, &v108);
          }

          sub_1000047B0(a1, 7, (uint64_t)&__p);
          goto LABEL_146;
        }

        memset(&__p, 0, sizeof(__p));
        uint64_t v21 = sub_10000327C(*(char **)(a3 + 16), *(_DWORD *)(a1 + 88));
        uint64_t v22 = v21;
        std::string::size_type v23 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__l.__cap_)
        {
          v60 = (void *)__p.__r_.__value_.__r.__words[0];
          uint64_t v61 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          unint64_t v62 = v61 + 1;
          int64_t v63 = __p.__r_.__value_.__l.__cap_ - __p.__r_.__value_.__r.__words[0];
          else {
            unint64_t v64 = v62;
          }
          if (v64)
          {
            v65 = (char *)sub_1000051C8((uint64_t)&__p.__r_.__value_.__l.__cap_, v64);
            std::string::size_type v23 = __p.__r_.__value_.__l.__size_;
            v60 = (void *)__p.__r_.__value_.__r.__words[0];
          }

          else
          {
            v65 = 0LL;
          }

          v79 = (uint64_t *)&v65[8 * v61];
          std::string::size_type v80 = (std::string::size_type)&v65[8 * v64];
          uint64_t *v79 = v22;
          std::string::size_type v24 = (std::string::size_type)(v79 + 1);
          while ((void *)v23 != v60)
          {
            uint64_t v81 = *(void *)(v23 - 8);
            v23 -= 8LL;
            *--v79 = v81;
          }

          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v79;
          __p.__r_.__value_.__l.__size_ = v24;
          __p.__r_.__value_.__l.__cap_ = v80;
          if (v60) {
            operator delete(v60);
          }
        }

        else
        {
          *(void *)__p.__r_.__value_.__l.__size_ = v21;
          std::string::size_type v24 = v23 + 8;
        }

        __p.__r_.__value_.__l.__size_ = v24;
        uint64_t v82 = sub_10000327C(*(char **)(a3 + 32), *(_DWORD *)(a1 + 88));
        uint64_t v83 = v82;
        std::string::size_type v84 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__l.__cap_)
        {
          v86 = (void *)__p.__r_.__value_.__r.__words[0];
          uint64_t v87 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          unint64_t v88 = v87 + 1;
          int64_t v89 = __p.__r_.__value_.__l.__cap_ - __p.__r_.__value_.__r.__words[0];
          else {
            unint64_t v90 = v88;
          }
          if (v90)
          {
            v91 = (char *)sub_1000051C8((uint64_t)&__p.__r_.__value_.__l.__cap_, v90);
            std::string::size_type v84 = __p.__r_.__value_.__l.__size_;
            v86 = (void *)__p.__r_.__value_.__r.__words[0];
          }

          else
          {
            v91 = 0LL;
          }

          v92 = (uint64_t *)&v91[8 * v87];
          std::string::size_type v93 = (std::string::size_type)&v91[8 * v90];
          uint64_t *v92 = v83;
          std::string::size_type v85 = (std::string::size_type)(v92 + 1);
          while ((void *)v84 != v86)
          {
            uint64_t v94 = *(void *)(v84 - 8);
            v84 -= 8LL;
            *--v92 = v94;
          }

          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v92;
          __p.__r_.__value_.__l.__size_ = v85;
          __p.__r_.__value_.__l.__cap_ = v93;
          if (v86) {
            operator delete(v86);
          }
        }

        else
        {
          *(void *)__p.__r_.__value_.__l.__size_ = v82;
          std::string::size_type v85 = v84 + 8;
        }

        __p.__r_.__value_.__l.__size_ = v85;
        uint64_t v95 = sub_10000327C(*(char **)(a3 + 24), *(_DWORD *)(a1 + 88));
        uint64_t v96 = v95;
        std::string::size_type v97 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__l.__cap_)
        {
          v98 = (void *)__p.__r_.__value_.__r.__words[0];
          uint64_t v99 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          unint64_t v100 = v99 + 1;
          int64_t v101 = __p.__r_.__value_.__l.__cap_ - __p.__r_.__value_.__r.__words[0];
          else {
            unint64_t v102 = v100;
          }
          if (v102)
          {
            v103 = (char *)sub_1000051C8((uint64_t)&__p.__r_.__value_.__l.__cap_, v102);
            std::string::size_type v97 = __p.__r_.__value_.__l.__size_;
            v98 = (void *)__p.__r_.__value_.__r.__words[0];
          }

          else
          {
            v103 = 0LL;
          }

          v104 = (uint64_t *)&v103[8 * v99];
          std::string::size_type v105 = (std::string::size_type)&v103[8 * v102];
          uint64_t *v104 = v96;
          std::string::size_type v50 = (std::string::size_type)(v104 + 1);
          while ((void *)v97 != v98)
          {
            uint64_t v106 = *(void *)(v97 - 8);
            v97 -= 8LL;
            *--v104 = v106;
          }

          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v104;
          __p.__r_.__value_.__l.__size_ = v50;
          __p.__r_.__value_.__l.__cap_ = v105;
          if (v98) {
            operator delete(v98);
          }
        }

        else
        {
          *(void *)__p.__r_.__value_.__l.__size_ = v95;
          std::string::size_type v50 = v97 + 8;
        }
      }

      else
      {
        memset(&__p, 0, sizeof(__p));
        uint64_t v11 = sub_10000327C(*(char **)(a3 + 16), *(_DWORD *)(a1 + 88));
        uint64_t v12 = v11;
        std::string::size_type v13 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__l.__cap_)
        {
          v25 = (void *)__p.__r_.__value_.__r.__words[0];
          uint64_t v26 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          unint64_t v27 = v26 + 1;
          int64_t v28 = __p.__r_.__value_.__l.__cap_ - __p.__r_.__value_.__r.__words[0];
          else {
            unint64_t v29 = v27;
          }
          if (v29)
          {
            v30 = (char *)sub_1000051C8((uint64_t)&__p.__r_.__value_.__l.__cap_, v29);
            std::string::size_type v13 = __p.__r_.__value_.__l.__size_;
            v25 = (void *)__p.__r_.__value_.__r.__words[0];
          }

          else
          {
            v30 = 0LL;
          }

          v44 = (uint64_t *)&v30[8 * v26];
          std::string::size_type v45 = (std::string::size_type)&v30[8 * v29];
          uint64_t *v44 = v12;
          std::string::size_type v14 = (std::string::size_type)(v44 + 1);
          while ((void *)v13 != v25)
          {
            uint64_t v46 = *(void *)(v13 - 8);
            v13 -= 8LL;
            *--v44 = v46;
          }

          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v44;
          __p.__r_.__value_.__l.__size_ = v14;
          __p.__r_.__value_.__l.__cap_ = v45;
          if (v25) {
            operator delete(v25);
          }
        }

        else
        {
          *(void *)__p.__r_.__value_.__l.__size_ = v11;
          std::string::size_type v14 = v13 + 8;
        }

        __p.__r_.__value_.__l.__size_ = v14;
        uint64_t v47 = sub_10000327C(*(char **)(a3 + 24), *(_DWORD *)(a1 + 88));
        uint64_t v48 = v47;
        std::string::size_type v49 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__l.__cap_)
        {
          v51 = (void *)__p.__r_.__value_.__r.__words[0];
          uint64_t v52 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          unint64_t v53 = v52 + 1;
          int64_t v54 = __p.__r_.__value_.__l.__cap_ - __p.__r_.__value_.__r.__words[0];
          else {
            unint64_t v55 = v53;
          }
          if (v55)
          {
            v56 = (char *)sub_1000051C8((uint64_t)&__p.__r_.__value_.__l.__cap_, v55);
            std::string::size_type v49 = __p.__r_.__value_.__l.__size_;
            v51 = (void *)__p.__r_.__value_.__r.__words[0];
          }

          else
          {
            v56 = 0LL;
          }

          v57 = (uint64_t *)&v56[8 * v52];
          std::string::size_type v58 = (std::string::size_type)&v56[8 * v55];
          uint64_t *v57 = v48;
          std::string::size_type v50 = (std::string::size_type)(v57 + 1);
          while ((void *)v49 != v51)
          {
            uint64_t v59 = *(void *)(v49 - 8);
            v49 -= 8LL;
            *--v57 = v59;
          }

          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v57;
          __p.__r_.__value_.__l.__size_ = v50;
          __p.__r_.__value_.__l.__cap_ = v58;
          if (v51) {
            operator delete(v51);
          }
        }

        else
        {
          *(void *)__p.__r_.__value_.__l.__size_ = v47;
          std::string::size_type v50 = v49 + 8;
        }
      }

      __p.__r_.__value_.__l.__size_ = v50;
      sub_1000047B0(a1, 2, (uint64_t)&__p);
LABEL_146:
      if (__p.__r_.__value_.__r.__words[0])
      {
        __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }

LABEL_148:
  if ((*(char *)(a1 + 55) & 0x80000000) == 0)
  {
    if (*(_BYTE *)(a1 + 55)) {
      goto LABEL_150;
    }
LABEL_153:
    if ((*(_DWORD *)(a1 + 56) & 0x80000000) != 0) {
      return 1LL;
    }
    int v107 = 3;
LABEL_155:
    *(_DWORD *)(a1 + 24) = v107;
    return 1LL;
  }

  if (!*(void *)(a1 + 40)) {
    goto LABEL_153;
  }
LABEL_150:
  if (*(_BYTE *)(a1 + 96))
  {
    int v107 = 2;
    goto LABEL_155;
  }

  uint64_t result = 1LL;
  *(_DWORD *)(a1 + 24) = 1;
  return result;
}

void sub_1000050D0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100005140(uint64_t **a1, _DWORD *a2, char *a3)
{
  uint64_t v4 = (uint64_t *)(a1 + 1);
  BOOL v3 = *a1;
  if (*a1 != (uint64_t *)(a1 + 1))
  {
    *a2 = *((_DWORD *)v3 + 8);
    sub_10000545C(a1, v3);
  }

  return v3 != v4;
}

void sub_1000051B4()
{
}

void *sub_1000051C8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100003430();
  }
  return operator new(8 * a2);
}

char *sub_1000051FC(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  size_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 3)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0LL;
      *size_t v7 = 0LL;
      v7[1] = 0LL;
      v7[2] = 0LL;
    }

    if (a4 >> 61) {
      sub_1000051B4();
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = sub_100005304(v7, v11);
    std::string::size_type v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      __int128 v18 = v9;
      unint64_t v19 = __src;
      goto LABEL_18;
    }

    goto LABEL_19;
  }

  uint64_t v12 = (void **)(result + 8);
  std::string::size_type v14 = (_BYTE *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 3;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }

  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    __int128 v18 = v9;
    unint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }

LABEL_19:
  void *v12 = &v9[v17];
  return result;
}

char *sub_100005304(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_1000051B4();
  }
  uint64_t result = (char *)sub_1000051C8((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

uint64_t **sub_100005344(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  size_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        size_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }

      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        size_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    unint64_t v11 = operator new(0x40uLL);
    v11[8] = **a4;
    *((void *)v11 + 6) = 0LL;
    *((void *)v11 + 7) = 0LL;
    *((void *)v11 + 5) = 0LL;
    sub_100005408(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }

  return v9;
}

uint64_t *sub_100005408(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  unint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }

  uint64_t result = sub_10000382C(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_10000545C(uint64_t **a1, uint64_t *a2)
{
  BOOL v3 = sub_10000549C(a1, a2);
  uint64_t v4 = (void *)a2[5];
  if (v4)
  {
    a2[6] = (uint64_t)v4;
    operator delete(v4);
  }

  operator delete(a2);
  return v3;
}

uint64_t *sub_10000549C(uint64_t **a1, uint64_t *a2)
{
  unsigned __int16 v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      BOOL v3 = v2;
      unsigned __int16 v2 = (uint64_t *)*v2;
    }

    while (v2);
  }

  else
  {
    uint64_t v4 = a2;
    do
    {
      BOOL v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }

    while (!v5);
  }

  if (*a1 == a2) {
    *a1 = v3;
  }
  uint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_10000550C(v6, a2);
  return v3;
}

uint64_t *sub_10000550C(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  BOOL v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      BOOL v3 = a2;
      goto LABEL_7;
    }

    do
    {
      BOOL v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }

    while (v4);
  }

  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }

  int v5 = 1;
LABEL_8:
  uint64_t v6 = (uint64_t **)v3[2];
  size_t v7 = *v6;
  if (*v6 == v3)
  {
    *uint64_t v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      size_t v7 = 0LL;
      uint64_t result = (uint64_t *)v2;
    }

    else
    {
      size_t v7 = v6[1];
    }
  }

  else
  {
    v6[1] = (uint64_t *)v2;
  }

  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8LL * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *BOOL v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }

  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }

  while (1)
  {
    uint64_t v12 = v7[2];
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      std::string::size_type v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8LL * (**(void **)(v12 + 16) != v12)) = v13;
      *std::string::size_type v13 = v12;
      *(void *)(v12 + 16) = v13;
      size_t v7 = *(uint64_t **)(*v7 + 8);
    }

    unint64_t v15 = (void *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      uint64_t v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *size_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        uint64_t v16 = v7;
      }

      else
      {
        unint64_t v15 = v7;
      }

      uint64_t v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      std::string::size_type v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8LL * (**(void **)(v23 + 16) != v23)) = v24;
      *std::string::size_type v24 = v23;
      goto LABEL_72;
    }

    uint64_t v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24)) {
      goto LABEL_55;
    }
    *((_BYTE *)v7 + 24) = 0;
    size_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      size_t v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }

    if (!*((_BYTE *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    size_t v7 = *(uint64_t **)(v17[2] + 8LL * (*(void *)v17[2] == (void)v17));
  }

  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8LL * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    size_t v7 = *(uint64_t **)v12;
  }

  unint64_t v19 = (void *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24)) {
    goto LABEL_68;
  }
  int v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    size_t v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }

  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    int v20 = v7;
  }

  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v20;
    uint64_t *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    unint64_t v19 = v7;
  }

  uint64_t v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  std::string::size_type v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8LL);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8LL * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t start(int a1, char **a2)
{
  std::string::size_type v24 = 0LL;
  int v4 = sub_1000042DC((uint64_t)v25);
  if (v4 == 1)
  {
    sub_10000436C((char *)v25, (uint64_t)&__p);
    sub_100007024(&__p, v21);
  }

  else
  {
    if (v4 != 2)
    {
      if (v4 == 3)
      {
        int v5 = sub_1000076A4();
        unsigned int v6 = sub_100004398((uint64_t)v25);
        if ((v6 & 0x80000000) == 0)
        {
          uint64_t v7 = *(void *)v5;
          if (v6 < (unint64_t)((uint64_t)(*((void *)v5 + 1) - *(void *)v5) >> 3))
          {
            int v8 = *(void **)(v7 + 8LL * v6);
            *(void *)(v7 + 8LL * v6) = 0LL;
            std::string::size_type v24 = v8;
            sub_100006A34( (uint64_t *)(*(void *)v5 + 8LL * v6 + 8),  *((uint64_t **)v5 + 1),  (uint64_t *)(*(void *)v5 + 8LL * v6));
            uint64_t v10 = v9;
            uint64_t v11 = (void *)*((void *)v5 + 1);
            while (v11 != v10)
            {
              uint64_t v13 = *--v11;
              uint64_t v12 = v13;
              *uint64_t v11 = 0LL;
              if (v13) {
                (*(void (**)(uint64_t))(*(void *)v12 + 8LL))(v12);
              }
            }

            *((void *)v5 + 1) = v10;
            goto LABEL_17;
          }
        }

        fprintf(__stdoutp, "There is no device at index %d\n", v6 + 1);
        sub_100005C44((uint64_t *)v5);
      }

      int v8 = 0LL;
      goto LABEL_17;
    }

    sub_10000436C((char *)v25, (uint64_t)&__p);
    sub_1000073DC((uint64_t)&__p, v21);
  }

  int v8 = v21[0];
  std::string::size_type v24 = v21[0];
  v21[0] = 0LL;
LABEL_17:
  sub_100003A80((uint64_t)&__p);
  int v14 = sub_100004438((uint64_t)v25);
  sub_100003AF8((uint64_t)&__p, v14);
  int v15 = sub_100004430((uint64_t)v25);
  sub_100003B08((uint64_t)&__p, v15);
  sub_100004404((char *)v25, (uint64_t)v21);
  if (v22 < 0)
  {
    uint64_t v16 = v21[1];
    operator delete(v21[0]);
    if (!v16) {
      goto LABEL_24;
    }
  }

  else if (!v22)
  {
    goto LABEL_24;
  }

  sub_100004404((char *)v25, (uint64_t)v21);
  char v17 = sub_100003B10((uint64_t)&__p, (uint64_t)v21);
  if (v22 < 0) {
    operator delete(v21[0]);
  }
  if ((v17 & 1) == 0) {
    exit(2);
  }
LABEL_24:
  sub_100005D84(v25, (uint64_t)&__p, (uint64_t *)&v24);
  if (!sub_1000042D4((uint64_t)v25))
  {
    sub_100003AD4((uint64_t)&__p);
    if (!v8) {
      goto LABEL_30;
    }
    goto LABEL_28;
  }

  if (v8)
  {
    sub_1000062EC((uint64_t)v25, (uint64_t)&__p, (uint64_t *)&v24);
    sub_100003AD4((uint64_t)&__p);
LABEL_28:
    (*(void (**)(void *))(*(void *)v8 + 8LL))(v8);
    goto LABEL_30;
  }

  uint64_t v18 = (uint64_t *)sub_1000076A4();
  fwrite("Choose a device:\n\n", 0x12uLL, 1uLL, __stdoutp);
  sub_100005C44(v18);
  unint64_t v19 = sub_10000318C(__stdinp, 0LL, 1uLL, (v18[1] - *v18) >> 3, 0);
  sub_1000062EC((uint64_t)v25, (uint64_t)&__p, (uint64_t *)(*v18 + 8 * v19 - 8));
  sub_100003AD4((uint64_t)&__p);
LABEL_30:
  if (v28 < 0) {
    operator delete(v27);
  }
  if (v26 < 0) {
    operator delete(v25[4]);
  }
  sub_100006AA4((uint64_t)v25, v25[1]);
  return 0LL;
}

void sub_100005BA0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22, uint64_t a23, char a24)
{
  if (v24) {
    (*(void (**)(uint64_t))(*(void *)v24 + 8LL))(v24);
  }
  sub_1000064B0((uint64_t)&a24);
  _Unwind_Resume(a1);
}

void sub_100005C44(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (a1[1] != *a1)
  {
    unint64_t v3 = 0LL;
    unsigned int v4 = 1;
    do
    {
      int v5 = __stdoutp;
      sub_100007B70(*(void *)(v2 + 8 * v3), v12);
      int v6 = v13;
      uint64_t v7 = (void **)v12[0];
      sub_100007BE8(*(void *)(v2 + 8 * v3), __p);
      if (v6 >= 0) {
        int v8 = v12;
      }
      else {
        int v8 = v7;
      }
      if (v11 >= 0) {
        uint64_t v9 = __p;
      }
      else {
        uint64_t v9 = (void **)__p[0];
      }
      fprintf(v5, "[%2d]: %s (%s)\n", v4, (const char *)v8, (const char *)v9);
      if (v11 < 0) {
        operator delete(__p[0]);
      }
      if (v13 < 0) {
        operator delete(v12[0]);
      }
      unint64_t v3 = v4;
      uint64_t v2 = *a1;
      ++v4;
    }

    while (v3 < (a1[1] - *a1) >> 3);
  }

void sub_100005D68( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100005D84(uint64_t **a1, uint64_t a2, uint64_t *a3)
{
  std::string::size_type v45 = 0LL;
  uint64_t v46 = 0LL;
  uint64_t v47 = 0LL;
  while (2)
  {
    BOOL v6 = sub_100005140(a1, &v48, (char *)&v45);
    if (v6)
    {
      switch(v48)
      {
        case 0:
          uint64_t v7 = v45;
          if (v45 == v46)
          {
            BOOL v33 = 0LL;
            goto LABEL_75;
          }

          if (!*a3) {
            break;
          }
          else {
            unsigned int v8 = *((_DWORD *)v45 + 2);
          }
          int v25 = *(_DWORD *)v45;
          sub_100006AF4(&__p, v8);
          int v26 = sub_1000087A8(*a3, v25, v8, (char **)&__p);
          char v27 = v26;
          if (v26)
          {
            unint64_t v29 = (unsigned int *)__p;
            char v28 = v43;
            if (__p == v43) {
              goto LABEL_55;
            }
            do
            {
              uint64_t v30 = *v29;
              unsigned int v31 = v29[1];
              int v32 = sub_100007E84(*a3, *v29);
              sub_100003D78(a2, v30, v31, v32, 1);
              v29 += 2;
            }

            while (v29 != v28);
          }

          else
          {
            fprintf(__stderrp, "Unable to find register address %x\n", v25);
          }

          unint64_t v29 = (unsigned int *)__p;
LABEL_55:
          if (v29)
          {
            v43 = v29;
            operator delete(v29);
          }

          if ((v27 & 1) == 0) {
            break;
          }
          continue;
        case 1:
          if (!*a3) {
            goto LABEL_58;
          }
          if (sub_1000064FC(a3, a2, 1)) {
            continue;
          }
          v37 = __stderrp;
          sub_100007B70(*a3, &__p);
          if (v44 >= 0) {
            p_p = (const char *)&__p;
          }
          else {
            p_p = (const char *)__p;
          }
          fprintf(v37, "Failed to dump registers for %s\n", p_p);
          if (SHIBYTE(v44) < 0) {
            operator delete(__p);
          }
          goto LABEL_73;
        case 2:
          else {
            char v9 = sub_100007C78(*a3, *(_DWORD *)v45, *((_DWORD *)v45 + 4), *((_DWORD *)v45 + 2));
          }
          if ((v9 & 1) != 0) {
            continue;
          }
          fprintf(__stderrp, "Unable to write to the register address %x\n");
          goto LABEL_73;
        case 4:
          uint64_t v16 = sub_1000076A4();
          char v17 = *(uint64_t **)v16;
          uint64_t v18 = (uint64_t *)*((void *)v16 + 1);
          char v19 = 1;
          do
          {
            while (!sub_1000064FC(v17, a2, 1))
            {
              int v20 = __stderrp;
              sub_100007B70(*v17, &__p);
              BOOL v21 = (const char *)&__p;
              if (v44 < 0) {
                BOOL v21 = (const char *)__p;
              }
              fprintf(v20, "Failed to dump registers for %s\n", v21);
              if (SHIBYTE(v44) < 0) {
                operator delete(__p);
              }
              char v19 = 0;
              if (++v17 == v18) {
                goto LABEL_58;
              }
            }

            ++v17;
          }

          while (v17 != v18);
          if ((v19 & 1) == 0) {
            goto LABEL_58;
          }
          continue;
        case 5:
          if (!*a3 || !sub_100009654(*a3, &__p)) {
            goto LABEL_63;
          }
          if (__p == kCFBooleanTrue)
          {
            int v40 = 0;
            int64_t v41 = "Ping success\n";
          }

          else
          {
            if (__p != kCFBooleanFalse)
            {
LABEL_63:
              uint64_t v34 = __stdoutp;
              v35 = "ping error\n";
              size_t v36 = 11LL;
LABEL_72:
              fwrite(v35, v36, 1uLL, v34);
LABEL_73:
              BOOL v33 = 0LL;
              goto LABEL_74;
            }

            int v40 = 1;
            int64_t v41 = "Ping failure\n";
          }

          fwrite(v41, 0xDuLL, 1uLL, __stdoutp);
          exit(v40);
        case 6:
          if (v45 == v46 || !*a3) {
            continue;
          }
          CFBooleanRef v10 = *(void *)v45 ? kCFBooleanTrue : kCFBooleanFalse;
          fprintf(__stderrp, "Unable to force headphone detect (%s)\n");
          goto LABEL_73;
        case 7:
          if (v46 == v45) {
            goto LABEL_58;
          }
          uint64_t v11 = *(unsigned int *)v45;
          if (v11 == 2)
          {
            std::string __p = 0LL;
            v43 = 0LL;
            uint64_t v44 = 0LL;
            BOOL v12 = sub_100008410(*a3, (uint64_t)&__p);
            int v14 = (unsigned int *)__p;
            char v13 = v43;
            if (__p != v43)
            {
              do
              {
                int v15 = sub_100007E84(*a3, *v14);
                sub_100003F78(a2, v14, v15);
                v14 += 4;
              }

              while (v14 != v13);
              int v14 = (unsigned int *)__p;
            }

            if (v14)
            {
              v43 = v14;
              operator delete(v14);
            }

            if (!v12)
            {
LABEL_71:
              uint64_t v34 = __stderrp;
              v35 = "Unable to patch the register\n";
              size_t v36 = 29LL;
              goto LABEL_72;
            }
          }

          else
          {
            uint64_t v22 = *((void *)v45 + 2);
            uint64_t v23 = *((void *)v45 + 3);
            uint64_t v24 = *a3;
            LODWORD(__p) = *((void *)v45 + 1);
            HIDWORD(__p) = v23;
            v43 = (unsigned int *)v22;
          }

          continue;
        default:
          fprintf(__stdoutp, "Unhandled Standalone operation %d\n");
          goto LABEL_73;
      }
    }

    break;
  }

LABEL_58:
  BOOL v33 = !v6;
LABEL_74:
  uint64_t v7 = v45;
LABEL_75:
  if (v7)
  {
    uint64_t v46 = v7;
    operator delete(v7);
  }

  return v33;
}

void sub_100006288( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1000062EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  if (*a3)
  {
    uint64_t v11 = *a3;
    while (1)
    {
      fputc(10, __stdoutp);
      sub_1000064FC(a3, a2, 0);
      fputc(10, __stdoutp);
      fwrite("? ", 2uLL, 1uLL, __stdoutp);
      fflush(__stdoutp);
      if (!fgets(__str, 32, __stdinp)) {
        break;
      }
      int v7 = sub_100004430(a1);
      unsigned int v8 = sub_10000327C(__str, v7);
      if (sub_1000080F4(*a3, v8))
      {
        fwrite("new value? ", 0xBuLL, 1uLL, __stdoutp);
        fflush(__stdoutp);
        fgets(__str, 32, __stdinp);
        int v9 = sub_10000327C(__str, 16);
        if (!sub_100007D74(*a3, v8, v9)) {
          fprintf(__stderrp, "Failed to write register to %x\n", v8);
        }
      }
    }

    uint64_t v3 = v11;
  }

  else
  {
    fwrite("Critical error!!! No device has been selected!!!\n", 0x31uLL, 1uLL, __stderrp);
  }

  return v3 != 0;
}

uint64_t sub_1000064B0(uint64_t a1)
{
  return a1;
}

BOOL sub_1000064FC(uint64_t *a1, uint64_t a2, int a3)
{
  uint64_t v4 = *a1;
  if (!v4) {
    return 0LL;
  }
  if (a3)
  {
    unsigned int v6 = sub_100003A4C();
    sub_100006880((uint64_t)&v27);
    sub_100003784(&__p, v6, 61);
    if ((v26 & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    if ((v26 & 0x80u) == 0) {
      uint64_t v8 = v26;
    }
    else {
      uint64_t v8 = v25;
    }
    int v9 = sub_1000034E4(&v29, (uint64_t)p_p, v8);
    sub_1000034E4(v9, (uint64_t)"\n", 1LL);
    CFBooleanRef v10 = sub_1000034E4(&v29, (uint64_t)"NAME : [", 8LL);
    sub_100007B70(*a1, &__p);
    if ((v26 & 0x80u) == 0) {
      uint64_t v11 = &__p;
    }
    else {
      uint64_t v11 = __p;
    }
    if ((v26 & 0x80u) == 0) {
      uint64_t v12 = v26;
    }
    else {
      uint64_t v12 = v25;
    }
    char v13 = sub_1000034E4(v10, (uint64_t)v11, v12);
    sub_1000034E4(v13, (uint64_t)"]\n", 2LL);
    sub_100003784(&__p, v6, 61);
    if ((v26 & 0x80u) == 0) {
      int v14 = &__p;
    }
    else {
      int v14 = __p;
    }
    if ((v26 & 0x80u) == 0) {
      uint64_t v15 = v26;
    }
    else {
      uint64_t v15 = v25;
    }
    uint64_t v16 = sub_1000034E4(&v29, (uint64_t)v14, v15);
    sub_1000034E4(v16, (uint64_t)"\n", 1LL);
    sub_100006F08((uint64_t)v30, &__p);
    sub_100003BB8(a2, (uint64_t)&__p);
    *(uint64_t *)((char *)&v27
    uint64_t v29 = v17;
    if (v31 < 0) {
      operator delete((void *)v30[8]);
    }
    std::streambuf::~streambuf(v30);
    std::ios::~ios(&v32);
    uint64_t v4 = *a1;
  }

  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  sub_100008C00(v4);
  BOOL v18 = sub_100008990(*a1, &v27, 1);
  if (v18)
  {
    memset(v23, 0, sizeof(v23));
    sub_100006B68(v23, v27, v28, (v28 - v27) >> 5);
    int v19 = sub_10000812C(*a1);
    sub_100003BF4(a2, v23, 1, v19);
    std::string __p = v23;
    sub_100006E7C((void ***)&__p);
  }

  if (sub_100008990(*a1, &v27, 3))
  {
    memset(v22, 0, sizeof(v22));
    sub_100006B68(v22, v27, v28, (v28 - v27) >> 5);
    int v20 = sub_10000812C(*a1);
    sub_100003BF4(a2, v22, 4, v20);
    std::string __p = v22;
    sub_100006E7C((void ***)&__p);
  }

  else
  {
    BOOL v18 = 0LL;
  }

  sub_100008C70(*a1);
  std::string __p = &v27;
  sub_100006E7C((void ***)&__p);
  return v18;
}

void sub_1000067FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21, char a22)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  sub_1000069AC((uint64_t)&a22);
  _Unwind_Resume(a1);
}

uint64_t sub_100006880(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  uint64_t v3 = a1 + 24;
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v5;
  *(void *)(a1 + 8) = 0LL;
  unsigned int v6 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
  std::ios_base::init(v6, (void *)(a1 + 24));
  v6[1].__vftable = 0LL;
  v6[1].__fmtflags_ = -1;
  *(void *)(a1 + 16) = v7;
  *(void *)(v2 + *(void *)(v7 - 24)) = v8;
  *(void *)a1 = v9;
  std::streambuf::basic_streambuf(v3);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_100006984(_Unwind_Exception *a1)
{
}

uint64_t sub_1000069AC(uint64_t a1)
{
  uint64_t v4 = a1 + 24;
  *(void *)(a1 + 16) = v3;
  std::streambuf::~streambuf(v4);
  std::ios::~ios(a1 + 128);
  return a1;
}

uint64_t *sub_100006A34(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4 = a1;
  if (a1 != a2)
  {
    do
    {
      uint64_t v6 = *v4;
      *uint64_t v4 = 0LL;
      uint64_t v7 = *a3;
      *a3 = v6;
      if (v7) {
        (*(void (**)(uint64_t))(*(void *)v7 + 8LL))(v7);
      }
      ++v4;
      ++a3;
    }

    while (v4 != a2);
    return a2;
  }

  return v4;
}

void sub_100006AA4(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_100006AA4(a1, *a2);
    sub_100006AA4(a1, a2[1]);
    uint64_t v4 = (void *)a2[5];
    if (v4)
    {
      a2[6] = v4;
      operator delete(v4);
    }

    operator delete(a2);
  }

void *sub_100006AF4(void *a1, unint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_100005304(a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }

  return a1;
}

void sub_100006B4C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::iostream::~basic_iostream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void *sub_100006B68(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_100006BEC(result, a4);
    uint64_t result = (void *)sub_100006C60((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }

  return result;
}

void sub_100006BCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + std::iostream::~basic_iostream(v2, v3 + 8) = v10;
  sub_100006E7C(&a9);
  _Unwind_Resume(a1);
}

char *sub_100006BEC(void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_1000051B4();
  }
  uint64_t result = (char *)sub_100006C2C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void *sub_100006C2C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_100003430();
  }
  return operator new(32 * a2);
}

uint64_t sub_100006C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *(_DWORD *)uint64_t v4 = *(_DWORD *)v6;
      *(void *)(v4 + 16) = 0LL;
      *(void *)(v4 + 24) = 0LL;
      *(void *)(v4 + std::iostream::~basic_iostream(v2, v3 + 8) = 0LL;
      sub_100006D18( (void *)(v4 + 8),  *(const void **)(v6 + 8),  *(void *)(v6 + 16),  (uint64_t)(*(void *)(v6 + 16) - *(void *)(v6 + 8)) >> 2);
      uint64_t v4 = v11 + 32;
      v11 += 32LL;
      v6 += 32LL;
    }

    while (v6 != a3);
  }

  char v9 = 1;
  sub_100006E04((uint64_t)v8);
  return v4;
}

void sub_100006D04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_100006D18(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_100006D90(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_100006D74(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::iostream::~basic_iostream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_100006D90(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_1000051B4();
  }
  uint64_t result = (char *)sub_100006DD0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_100006DD0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_100003430();
  }
  return operator new(4 * a2);
}

uint64_t sub_100006E04(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_100006E38(a1);
  }
  return a1;
}

void sub_100006E38(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)(v1 - 24);
    if (v3)
    {
      *(void *)(v1 - 16) = v3;
      operator delete(v3);
    }

    v1 -= 32LL;
  }

void sub_100006E7C(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_100006EBC((uint64_t *)v2);
    operator delete(**a1);
  }

void sub_100006EBC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32LL)
  {
    uint64_t v4 = *(void **)(i - 24);
    if (v4)
    {
      *(void *)(i - 16) = v4;
      operator delete(v4);
    }
  }

  a1[1] = v2;
}

uint64_t sub_100006F08@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_100006FA4(a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_1000033A8();
  }
  uint64_t v5 = (const void *)result;
  size_t v6 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    char v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000LL;
    *a2 = v9;
    a2 = v9;
  }

  else
  {
    *((_BYTE *)a2 + 23) = v4;
    if (!v4) {
      goto LABEL_9;
    }
  }

  uint64_t result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((_BYTE *)a2 + v6) = 0;
  return result;
}

uint64_t sub_100006FA4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    unint64_t v3 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 88) < v3) {
      *(void *)(a1 + 8std::iostream::~basic_iostream(v2, v3 + 8) = v3;
    }
    return *(void *)(a1 + 40);
  }

  else if ((v1 & 8) != 0)
  {
    return *(void *)(a1 + 16);
  }

  else
  {
    return 0LL;
  }

void **sub_100006FF0(void **a1)
{
  unint64_t v3 = a1;
  sub_100009744(&v3);
  return a1;
}

void sub_100007024(const std::string *a1@<X0>, void *a2@<X8>)
{
  std::string::size_type size = a1->__r_.__value_.__s.__size_;
  if ((size & 0x80u) != 0LL) {
    std::string::size_type size = a1->__r_.__value_.__l.__size_;
  }
  *a2 = 0LL;
  if (size)
  {
    sub_1000032F8(__p, "IONameMatch");
    unsigned int v5 = sub_100007200((uint64_t)a1, (const char *)__p);
    unsigned int v6 = v5;
    if (v15 < 0)
    {
      operator delete(__p[0]);
      if (v6) {
        goto LABEL_6;
      }
    }

    else if (v5)
    {
LABEL_6:
      char v7 = 0;
LABEL_7:
      uint64_t v8 = operator new(0x38uLL);
      *(void *)uint64_t v8 = off_10000C3B8;
      v8[2] = v6;
      *((_BYTE *)v8 + 12) = 0;
      v8[4] = 0;
      *((void *)v8 + 5) = 0LL;
      *((void *)v8 + 6) = 0LL;
      *((void *)v8 + 4) = 0LL;
      *((void *)v8 + 3) = v8 + 8;
      *a2 = v8;
      sub_100007314((uint64_t)v8, v7);
      return;
    }

    if ((char)a1->__r_.__value_.__s.__size_ < 0)
    {
      std::string::size_type v9 = a1->__r_.__value_.__l.__size_;
      if (!v9) {
        return;
      }
      uint64_t v10 = (char *)(a1->__r_.__value_.__r.__words[0] + v9);
    }

    else
    {
      std::string::size_type v9 = a1->__r_.__value_.__s.__size_;
      if (!a1->__r_.__value_.__s.__size_) {
        return;
      }
      uint64_t v10 = (char *)a1 + v9;
    }

    if (*(v10 - 1) == 69)
    {
      std::string::basic_string(&v13, a1, 0LL, v9 - 1, (std::allocator<char> *)&v16);
      sub_1000032F8(v11, "IONameMatch");
      unsigned int v6 = sub_100007200((uint64_t)&v13, (const char *)v11);
      if (v12 < 0) {
        operator delete(v11[0]);
      }
      char v7 = v6 != 0;
      if (v6) {
        goto LABEL_7;
      }
    }
  }

void sub_100007188( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, uint64_t a21, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  *unsigned __int8 v26 = 0LL;
  _Unwind_Resume(exception_object);
}

CFMutableDictionaryRef sub_100007200(uint64_t a1, const char *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 0LL;
  }
  unsigned int v5 = Mutable;
  else {
    unsigned int v6 = *(const char **)a1;
  }
  CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, v6, 0);
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  CFStringRef v8 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0);
  CFStringRef v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    CFDictionarySetValue(v5, v8, v7);
    CFMutableDictionaryRef v13 = sub_1000074EC(v5, 0LL);
    CFMutableDictionaryRef v11 = v13;
    if (!(_DWORD)v13) {
      CFMutableDictionaryRef v11 = sub_1000074EC(v5, "IOService");
    }
LABEL_20:
    CFRelease(v7);
    if (!v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

  CFMutableDictionaryRef v11 = 0LL;
  if (v7) {
    goto LABEL_20;
  }
  if (v8) {
LABEL_14:
  }
    CFRelease(v9);
LABEL_15:
  CFRelease(v5);
  return v11;
}

uint64_t sub_100007314(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 12) = a2;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( *(_DWORD *)(a1 + 8),  @"CodecRegisterStartIndex",  kCFAllocatorDefault,  0);
  if (CFProperty)
  {
    unint64_t v4 = CFProperty;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr)) {
      *(_DWORD *)(a1 + 16) = valuePtr;
    }
    CFRelease(v4);
  }

  if (*(_BYTE *)(a1 + 12))
  {
    unsigned int v5 = (const __CFNumber *)IORegistryEntryCreateCFProperty( *(_DWORD *)(a1 + 8),  @"CodecExtendedRegisterStartIndex",  kCFAllocatorDefault,  0);
    if (v5)
    {
      unsigned int v6 = v5;
      if (CFNumberGetValue(v5, kCFNumberSInt32Type, &v8)) {
        *(_DWORD *)(a1 + 16) = v8;
      }
      CFRelease(v6);
    }
  }

  return 1LL;
}

void sub_1000073DC(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 23);
  if ((v3 & 0x80u) != 0LL) {
    uint64_t v3 = *(void *)(a1 + 8);
  }
  *a2 = 0LL;
  if (v3)
  {
    sub_1000032F8(__p, "CodecUID");
    unsigned int v5 = sub_100007200(a1, (const char *)__p);
    unsigned int v6 = v5;
    if (v9 < 0)
    {
      operator delete(__p[0]);
      if (!v6) {
        return;
      }
    }

    else if (!v5)
    {
      return;
    }

    CFStringRef v7 = operator new(0x38uLL);
    *(void *)CFStringRef v7 = off_10000C3B8;
    v7[2] = v6;
    *((_BYTE *)v7 + 12) = 0;
    v7[4] = 0;
    *((void *)v7 + 5) = 0LL;
    *((void *)v7 + 6) = 0LL;
    *((void *)v7 + 4) = 0LL;
    *((void *)v7 + 3) = v7 + 8;
    *a2 = v7;
    sub_100007314((uint64_t)v7, 0);
  }

void sub_1000074A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  *char v15 = 0LL;
  (*(void (**)(uint64_t))(*(void *)v16 + 8LL))(v16);
  _Unwind_Resume(a1);
}

CFMutableDictionaryRef sub_1000074EC(const __CFDictionary *a1, const char *a2)
{
  if (a2) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = "AppleEmbeddedAudio";
  }
  CFMutableDictionaryRef result = IOServiceMatching(v3);
  if (result)
  {
    unsigned int v5 = result;
    if (a1)
    {
      CFIndex Count = CFDictionaryGetCount(a1);
      keys = 0LL;
      char v12 = 0LL;
      uint64_t v13 = 0LL;
      values = 0LL;
      char v9 = 0LL;
      uint64_t v10 = 0LL;
      sub_100007610((void **)&keys, Count);
      sub_100007610((void **)&values, Count);
      CFDictionaryGetKeysAndValues(a1, (const void **)keys, (const void **)values);
      if (Count >= 1)
      {
        for (uint64_t i = 0LL; i != Count; ++i)
          CFDictionarySetValue(v5, keys[i], values[i]);
      }

      if (values)
      {
        char v9 = values;
        operator delete(values);
      }

      if (keys)
      {
        char v12 = keys;
        operator delete(keys);
      }
    }

    return (CFMutableDictionaryRef)IOServiceGetMatchingService(kIOMainPortDefault, v5);
  }

  return result;
}

void sub_1000075E0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_100007610(void **a1, unint64_t a2)
{
  unint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_1000051B4();
    }
    int64_t v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    unsigned int v6 = (char *)sub_1000051C8(v3, a2);
    CFStringRef v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8LL];
    char v9 = &v6[8 * v8];
    CFMutableDictionaryRef v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    char v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }

      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }

__int128 *sub_1000076A4()
{
  *(void *)existing = 0LL;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  int v27 = 1065353216;
  int v1 = (void *)*((void *)&xmmword_100010000 + 1);
  v0 = (void *)xmmword_100010000;
  while (v1 != v0)
  {
    uint64_t v3 = *--v1;
    uint64_t v2 = v3;
    void *v1 = 0LL;
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
    }
  }

  *((void *)&xmmword_100010000 + 1) = v0;
  unint64_t v4 = IOServiceMatching("AppleEmbeddedAudio");
  if (!IOServiceGetMatchingServices(kIOMainPortDefault, v4, &existing[1]))
  {
    while (1)
    {
      existing[0] = IOIteratorNext(existing[1]);
      if (!existing[0]) {
        break;
      }
      sub_100009E88((uint64_t)&v25, existing, existing);
    }
  }

  if (existing[1]) {
    IOObjectRelease(existing[1]);
  }
  LODWORD(v23) = 1;
  sub_10000A2D8((uint64_t)&v33, "AppleAudioHardwareInterface", (int *)&v23);
  uint64_t v29 = &v33;
  v30.i64[0] = 1LL;
  CFTypeRef v24 = sub_1000097C0((uint64_t)&v29);
  if (cf) {
    CFRelease(cf);
  }
  if (v33) {
    CFRelease(v33);
  }
  sub_10000A498((uint64_t)&v33, "IOPropertyMatch", &v24);
  uint64_t v29 = &v33;
  v30.i64[0] = 1LL;
  int64_t v5 = sub_1000097C0((uint64_t)&v29);
  uint64_t v23 = v5;
  if (cf) {
    CFRelease(cf);
  }
  if (v33) {
    CFRelease(v33);
  }
  uint64_t v23 = 0LL;
  if (!IOServiceGetMatchingServices(kIOMainPortDefault, v5, &existing[1]))
  {
    while (1)
    {
      existing[0] = IOIteratorNext(existing[1]);
      if (!existing[0]) {
        break;
      }
      sub_100009E88((uint64_t)&v25, existing, existing);
    }
  }

  for (uint64_t i = (uint64_t *)v26; i; uint64_t i = (uint64_t *)*i)
  {
    int v7 = *((_DWORD *)i + 4);
    uint64_t v8 = operator new(0x38uLL);
    *(void *)uint64_t v8 = off_10000C3B8;
    v8[2] = v7;
    *((_BYTE *)v8 + 12) = 0;
    v8[4] = 0;
    *((void *)v8 + 5) = 0LL;
    *((void *)v8 + 6) = 0LL;
    *((void *)v8 + 4) = 0LL;
    *((void *)v8 + 3) = v8 + 8;
    sub_100007314((uint64_t)v8, 0);
    uint64_t v9 = *((void *)&xmmword_100010000 + 1);
    if (*((void *)&xmmword_100010000 + 1) >= (unint64_t)qword_100010010)
    {
      uint64_t v11 = (uint64_t)(*((void *)&xmmword_100010000 + 1) - xmmword_100010000) >> 3;
      unint64_t v12 = (qword_100010010 - (uint64_t)xmmword_100010000) >> 2;
      if (v12 <= v11 + 1) {
        unint64_t v12 = v11 + 1;
      }
      else {
        unint64_t v13 = v12;
      }
      uint64_t v32 = &qword_100010010;
      if (v13) {
        int v14 = (char *)sub_1000051C8((uint64_t)&qword_100010010, v13);
      }
      else {
        int v14 = 0LL;
      }
      char v15 = &v14[8 * v11];
      uint64_t v16 = (uint64_t)&v14[8 * v13];
      uint64_t v31 = v16;
      *(void *)char v15 = v8;
      uint64_t v10 = v15 + 8;
      v30.i64[1] = (uint64_t)(v15 + 8);
      uint64_t v17 = (void *)*((void *)&xmmword_100010000 + 1);
      BOOL v18 = (void *)xmmword_100010000;
      if (*((void *)&xmmword_100010000 + 1) == (void)xmmword_100010000)
      {
        int64x2_t v20 = vdupq_n_s64(*((unint64_t *)&xmmword_100010000 + 1));
      }

      else
      {
        do
        {
          uint64_t v19 = *--v17;
          *uint64_t v17 = 0LL;
          *((void *)v15 - 1) = v19;
          v15 -= 8;
        }

        while (v17 != v18);
        int64x2_t v20 = (int64x2_t)xmmword_100010000;
        uint64_t v10 = (void *)v30.i64[1];
        uint64_t v16 = v31;
      }

      *(void *)&xmmword_100010000 = v15;
      *((void *)&xmmword_100010000 + 1) = v10;
      int64x2_t v30 = v20;
      uint64_t v21 = qword_100010010;
      qword_100010010 = v16;
      uint64_t v31 = v21;
      uint64_t v29 = (CFTypeRef *)v20.i64[0];
      sub_100009AD0((uint64_t)&v29);
    }

    else
    {
      **((void **)&xmmword_100010000 + 1) = v8;
      uint64_t v10 = (void *)(v9 + 8);
    }

    *((void *)&xmmword_100010000 + 1) = v10;
  }

  if (existing[1]) {
    IOObjectRelease(existing[1]);
  }
  if (v24) {
    CFRelease(v24);
  }
  sub_100009E40((uint64_t)&v25);
  return &xmmword_100010000;
}

void sub_1000079F8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25)
{
  if (a2) {
    sub_1000032E8(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100007A98(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  return a1;
}

const void **sub_100007AD8(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t sub_100007B08(uint64_t a1)
{
  *(void *)a1 = off_10000C3B8;
  sub_10000A4D8(a1 + 24, *(void **)(a1 + 32));
  return a1;
}

void sub_100007B3C(void **a1)
{
  *a1 = off_10000C3B8;
  sub_10000A4D8((uint64_t)(a1 + 3), a1[4]);
  operator delete(a1);
}

void *sub_100007B70@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (IORegistryEntryGetName(*(_DWORD *)(a1 + 8), name)) {
    uint64_t v3 = (char *)&unk_10000BAA7;
  }
  else {
    uint64_t v3 = name;
  }
  return sub_1000032F8(a2, v3);
}

void *sub_100007BE8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 8), "IOService", &parent) || IORegistryEntryGetName(parent, name)) {
    uint64_t v3 = (char *)&unk_10000BAA7;
  }
  else {
    uint64_t v3 = name;
  }
  return sub_1000032F8(a2, v3);
}

uint64_t sub_100007C78(uint64_t a1, int a2, int a3, int a4)
{
  int v9 = 0;
  uint64_t result = sub_100007CEC(a1, a2, &v9);
  if ((_DWORD)result) {
    return sub_100007D74(a1, a2, v9 & ~a3 | a4 & a3);
  }
  return result;
}

uint64_t sub_100007CEC(uint64_t a1, int a2, _DWORD *a3)
{
  uint64_t v8 = 0LL;
  int v9 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v4 = sub_1000087A8(a1, a2, 1u, &v8);
  int64_t v5 = v8;
  if (v9 == v8) {
    int v6 = 0;
  }
  else {
    int v6 = v4;
  }
  if (v6 == 1)
  {
    *a3 = *((_DWORD *)v8 + 1);
LABEL_7:
    int v9 = v5;
    operator delete(v5);
    return v4;
  }

  if (v8) {
    goto LABEL_7;
  }
  return v4;
}

void sub_100007D58( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100007D74(uint64_t a1, int a2, int a3)
{
  int v15 = a3;
  int valuePtr = a2;
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 3LL, &kCFTypeArrayCallBacks);
  CFTypeRef cf = Mutable;
  if (!Mutable) {
    return 0LL;
  }
  int64_t v5 = Mutable;
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    CFArrayAppendValue(v5, v6);
    CFRelease(v7);
  }

  CFNumberRef v8 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v15);
  if (v8)
  {
    CFNumberRef v9 = v8;
    CFArrayAppendValue(v5, v8);
    CFRelease(v9);
  }

  CFArrayRef v10 = CFArrayCreate(kCFAllocatorDefault, &cf, 1LL, &kCFTypeArrayCallBacks);
  if (v10)
  {
    CFArrayRef v11 = v10;
    BOOL v12 = sub_1000081BC(a1, @"CodecRegisterData", v10);
    CFRelease(v11);
  }

  else
  {
    BOOL v12 = 0LL;
  }

  CFRelease(cf);
  return v12;
}

uint64_t sub_100007E84(uint64_t a1, unsigned int a2)
{
  if (!*(void *)(a1 + 40))
  {
    std::string __p = 0LL;
    unint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    sub_100007F40(a1, (unint64_t **)&__p, 0);
    if (__p)
    {
      unint64_t v13 = __p;
      operator delete(__p);
    }
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = a1 + 32;
  uint64_t v4 = v6;
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = v5;
  do
  {
    unsigned int v8 = *(_DWORD *)(v4 + 28);
    BOOL v9 = v8 >= a2;
    if (v8 >= a2) {
      CFArrayRef v10 = (uint64_t *)v4;
    }
    else {
      CFArrayRef v10 = (uint64_t *)(v4 + 8);
    }
    if (v9) {
      uint64_t v7 = v4;
    }
    uint64_t v4 = *v10;
  }

  while (*v10);
  if (v7 != v5 && *(_DWORD *)(v7 + 28) <= a2) {
    return *(unsigned int *)(v7 + 32);
  }
  else {
    return 0LL;
  }
}

void sub_100007F24( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100007F40(uint64_t a1, unint64_t **a2, int a3)
{
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  BOOL v24 = sub_100008990(a1, &v27, a3);
  if (v24)
  {
    uint64_t v4 = v27;
    uint64_t v25 = v28;
    if (v27 != v28)
    {
      uint64_t v5 = a2 + 2;
      do
      {
        int v6 = *(_DWORD *)v4;
        int v7 = sub_10000812C(a1);
        BOOL v9 = *(unsigned int **)(v4 + 8);
        unsigned int v8 = *(unsigned int **)(v4 + 16);
        if (v9 != v8)
        {
          int v10 = v7;
          int v11 = 0;
          BOOL v12 = a2[1];
          do
          {
            unint64_t v13 = (v6 + v11 * v10) | ((unint64_t)*v9 << 32);
            if ((unint64_t)v12 >= *v5)
            {
              uint64_t v14 = v12 - *a2;
              uint64_t v15 = *v5 - (void)*a2;
              uint64_t v16 = v15 >> 2;
              else {
                unint64_t v17 = v16;
              }
              if (v17) {
                BOOL v18 = (char *)sub_1000051C8((uint64_t)(a2 + 2), v17);
              }
              else {
                BOOL v18 = 0LL;
              }
              uint64_t v19 = (unint64_t *)&v18[8 * v14];
              *uint64_t v19 = v13;
              BOOL v12 = v19 + 1;
              uint64_t v21 = (char *)*a2;
              int64x2_t v20 = (char *)a2[1];
              if (v20 != (char *)*a2)
              {
                do
                {
                  unint64_t v22 = *((void *)v20 - 1);
                  v20 -= 8;
                  *--uint64_t v19 = v22;
                }

                while (v20 != v21);
                int64x2_t v20 = (char *)*a2;
              }

              *a2 = v19;
              a2[1] = v12;
              a2[2] = (unint64_t *)&v18[8 * v17];
              if (v20) {
                operator delete(v20);
              }
            }

            else
            {
              *v12++ = v13;
            }

            a2[1] = v12;
            ++v11;
            ++v9;
          }

          while (v9 != v8);
        }

        v4 += 32LL;
      }

      while (v4 != v25);
    }
  }

  int64x2_t v30 = (void **)&v27;
  sub_100006E7C(&v30);
  return v24;
}

void sub_1000080CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)&a13;
  sub_100006E7C(&a16);
  _Unwind_Resume(a1);
}

uint64_t sub_1000080F4(uint64_t a1, unsigned int a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 16);
  LODWORD(result) = sub_100007CEC(a1, a2, &v5);
  if (v3 <= a2) {
    return result;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10000812C(uint64_t a1)
{
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( *(_DWORD *)(a1 + 8),  @"CodecRegisterAddressIncrement",  kCFAllocatorDefault,  0);
  if (!CFProperty) {
    return 1LL;
  }
  uint64_t v2 = CFProperty;
  CFTypeID v3 = CFGetTypeID(CFProperty);
  if (v3 != CFNumberGetTypeID()) {
    return 1LL;
  }
  int valuePtr = 0;
  CFNumberGetValue(v2, kCFNumberSInt32Type, &valuePtr);
  if (valuePtr <= 1) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = valuePtr;
  }
  CFRelease(v2);
  return v4;
}

BOOL sub_1000081BC(uint64_t a1, const __CFString *a2, const void *a3)
{
  kern_return_t v5;
  char *v6;
  int v7;
  void **v8;
  void **v9;
  char *v10;
  void *__p[2];
  char v13;
  io_name_t name;
  int v5 = IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 8), a2, a3);
  if (v5)
  {
    if (IORegistryEntryGetName(*(_DWORD *)(a1 + 8), name)) {
      int v6 = (char *)&unk_10000BAA7;
    }
    else {
      int v6 = name;
    }
    sub_1000032F8(__p, v6);
    int v7 = v13;
    unsigned int v8 = (void **)__p[0];
    sub_1000095B8(a2, (std::string *)name);
    BOOL v9 = __p;
    if (v7 < 0) {
      BOOL v9 = v8;
    }
    if (name[23] >= 0) {
      int v10 = name;
    }
    else {
      int v10 = *(char **)name;
    }
    syslog(3, "%s : Unable to SetProperty %s ret=%#x\n", (const char *)v9, v10, v5);
    if (name[23] < 0) {
      operator delete(*(void **)name);
    }
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }

  return v5 == 0;
}

void sub_1000082CC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20, int a21, __int16 a22, char a23, char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  if (a18 < 0) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100008308(uint64_t a1, int a2, uint64_t *a3)
{
  int v11 = a2;
  uint64_t v12 = *a3;
  int v13 = *((_DWORD *)a3 + 2);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 4LL, &kCFTypeArrayCallBacks);
  if (!Mutable) {
    return 0LL;
  }
  int v5 = Mutable;
  for (uint64_t i = 0LL; i != 16; i += 4LL)
  {
    CFNumberRef v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&v11 + i);
    if (v7)
    {
      CFNumberRef v8 = v7;
      CFArrayAppendValue(v5, v7);
      CFRelease(v8);
    }
  }

  BOOL v9 = sub_1000081BC(a1, @"CodecRegisterPatch", v5);
  CFRelease(v5);
  return v9;
}

BOOL sub_100008410(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CFStringCreateWithCString(kCFAllocatorDefault, "CodecRegisterPatch", 0);
  if (!v4) {
    return 0LL;
  }
  int v5 = v4;
  BOOL v6 = sub_100008644(a1, v4, &cf);
  if (v6)
  {
    CFNumberRef v7 = (const __CFArray *)cf;
    CFTypeID v8 = CFGetTypeID(cf);
    if (v8 == CFArrayGetTypeID() && CFArrayGetCount(v7) >= 1)
    {
      CFIndex v9 = 0LL;
      unsigned int v10 = 0;
      do
      {
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v7, v9);
        uint64_t v12 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 0LL);
        CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
        int v13 = valuePtr;
        uint64_t v14 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 1LL);
        CFNumberGetValue(v14, kCFNumberSInt32Type, &valuePtr);
        int v15 = valuePtr;
        uint64_t v16 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 2LL);
        CFNumberGetValue(v16, kCFNumberSInt32Type, &valuePtr);
        int v17 = valuePtr;
        BOOL v18 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 3LL);
        CFNumberGetValue(v18, kCFNumberSInt32Type, &valuePtr);
        int v19 = valuePtr;
        uint64_t v21 = *(_DWORD **)(a2 + 8);
        unint64_t v20 = *(void *)(a2 + 16);
        if ((unint64_t)v21 >= v20)
        {
          uint64_t v23 = *(_DWORD **)a2;
          uint64_t v24 = ((uint64_t)v21 - *(void *)a2) >> 4;
          unint64_t v25 = v24 + 1;
          uint64_t v26 = v20 - (void)v23;
          if (v26 >> 3 > v25) {
            unint64_t v25 = v26 >> 3;
          }
          else {
            unint64_t v27 = v25;
          }
          if (v27)
          {
            uint64_t v28 = (char *)sub_100009B30(a2 + 16, v27);
            uint64_t v23 = *(_DWORD **)a2;
            uint64_t v21 = *(_DWORD **)(a2 + 8);
          }

          else
          {
            uint64_t v28 = 0LL;
          }

          uint64_t v29 = &v28[16 * v24];
          *(_DWORD *)uint64_t v29 = v13;
          *((_DWORD *)v29 + 1) = v15;
          *((_DWORD *)v29 + 2) = v17;
          *((_DWORD *)v29 + 3) = v19;
          int64x2_t v30 = v29;
          if (v21 != v23)
          {
            do
            {
              *((_OWORD *)v30 - 1) = *((_OWORD *)v21 - 1);
              v30 -= 16;
              v21 -= 4;
            }

            while (v21 != v23);
            uint64_t v23 = *(_DWORD **)a2;
          }

          unint64_t v22 = v29 + 16;
          *(void *)a2 = v30;
          *(void *)(a2 + std::iostream::~basic_iostream(v2, v3 + 8) = v29 + 16;
          *(void *)(a2 + 16) = &v28[16 * v27];
          if (v23) {
            operator delete(v23);
          }
        }

        else
        {
          *uint64_t v21 = v13;
          v21[1] = v15;
          unint64_t v22 = v21 + 4;
          v21[2] = v17;
          v21[3] = v19;
        }

        *(void *)(a2 + std::iostream::~basic_iostream(v2, v3 + 8) = v22;
        CFIndex v9 = ++v10;
      }

      while (CFArrayGetCount(v7) > v10);
    }
  }

  CFRelease(v5);
  return v6;
}

BOOL sub_100008644(uint64_t a1, const __CFString *a2, void *a3)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 8), a2, kCFAllocatorDefault, 0);
  CFTypeRef v7 = CFProperty;
  if (CFProperty)
  {
    *a3 = CFProperty;
  }

  else
  {
    if (IORegistryEntryGetName(*(_DWORD *)(a1 + 8), name)) {
      CFTypeID v8 = (char *)&unk_10000BAA7;
    }
    else {
      CFTypeID v8 = name;
    }
    sub_1000032F8(__p, v8);
    int v9 = v15;
    unsigned int v10 = (void **)__p[0];
    sub_1000095B8(a2, (std::string *)name);
    int v11 = __p;
    if (v9 < 0) {
      int v11 = v10;
    }
    if (name[23] >= 0) {
      uint64_t v12 = name;
    }
    else {
      uint64_t v12 = *(char **)name;
    }
    syslog(7, "%s : Unable to GetProperty %s", (const char *)v11, v12);
    if (name[23] < 0) {
      operator delete(*(void **)name);
    }
    if (v15 < 0) {
      operator delete(__p[0]);
    }
  }

  return v7 != 0LL;
}

void sub_10000876C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  if (a16 < 0) {
    operator delete(a11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000087A8(uint64_t a1, int a2, unsigned int a3, char **a4)
{
  if (!a3) {
    return 1LL;
  }
  a4[1] = *a4;
  std::string __p = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  BOOL v8 = sub_100007F40(a1, (unint64_t **)&__p, 0);
  int v9 = __p;
  if (!v8 || (unsigned int v10 = v28, __p == v28))
  {
    uint64_t v25 = 0LL;
    if (!__p) {
      return v25;
    }
LABEL_35:
    uint64_t v28 = v9;
    operator delete(v9);
    return v25;
  }

  char v11 = 0;
  do
  {
    if (*v9 == a2) {
      char v11 = 1;
    }
    if ((v11 & 1) != 0)
    {
      uint64_t v14 = a4[1];
      unint64_t v13 = (unint64_t)a4[2];
      if ((unint64_t)v14 >= v13)
      {
        uint64_t v15 = (v14 - *a4) >> 3;
        uint64_t v16 = v13 - (void)*a4;
        uint64_t v17 = v16 >> 2;
        else {
          unint64_t v18 = v17;
        }
        if (v18) {
          int v19 = (char *)sub_1000051C8((uint64_t)(a4 + 2), v18);
        }
        else {
          int v19 = 0LL;
        }
        unint64_t v20 = &v19[8 * v15];
        *(void *)unint64_t v20 = *(void *)v9;
        uint64_t v12 = v20 + 8;
        unint64_t v22 = *a4;
        uint64_t v21 = a4[1];
        if (v21 != *a4)
        {
          do
          {
            uint64_t v23 = *((void *)v21 - 1);
            v21 -= 8;
            *((void *)v20 - 1) = v23;
            v20 -= 8;
          }

          while (v21 != v22);
          uint64_t v21 = *a4;
        }

        *a4 = v20;
        a4[1] = v12;
        a4[2] = &v19[8 * v18];
        if (v21) {
          operator delete(v21);
        }
      }

      else
      {
        *(void *)uint64_t v14 = *(void *)v9;
        uint64_t v12 = v14 + 8;
      }

      a4[1] = v12;
    }

    else
    {
      uint64_t v12 = a4[1];
    }

    v9 += 2;
  }

  while (a3 > (unint64_t)((v12 - *a4) >> 3) && v9 != v10);
  int v9 = __p;
  uint64_t v25 = v11 & 1;
  if (__p) {
    goto LABEL_35;
  }
  return v25;
}

void sub_10000896C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100008990(uint64_t a1, uint64_t *a2, int a3)
{
  BOOL v6 = sub_100008C00(a1);
  if (v6)
  {
    CFTypeRef v7 = *(const void **)(a1 + 48);
    uint64_t v31 = *(void *)(a1 + 40);
    int v8 = *(unsigned __int8 *)(a1 + 12);
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFArrayGetTypeID())
    {
      sub_100006EBC(a2);
      CFIndex Count = CFArrayGetCount((CFArrayRef)v7);
      if (Count >= 0) {
        uint64_t v11 = Count;
      }
      else {
        uint64_t v11 = Count + 1;
      }
      sub_100008CB4(a2, v11 >> 1);
      if (CFArrayGetCount((CFArrayRef)v7) >= 2)
      {
        uint64_t v12 = 0LL;
        int v13 = v8 != 0;
        unsigned int v14 = 1;
        unsigned int v15 = 1;
        while (1)
        {
          ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v7, v14 - 1);
          unsigned int valuePtr = 0;
          if (ValueAtIndex && CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr))
          {
            uint64_t v17 = valuePtr;
            v13 |= valuePtr < v12;
            unint64_t v18 = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)v7, v14);
            if ((v13 & 1) != 0)
            {
              if (a3 != 1)
              {
                int v24 = 4;
                goto LABEL_23;
              }

              int v13 = 1;
            }

            else
            {
              if (a3 != 3)
              {
                int v24 = 1;
LABEL_23:
                if (!sub_100008D44(a1, (uint64_t)a2, v18, valuePtr, v24, v19, v31 == 0)) {
                  fprintf( __stderrp,  "Error encountered while reading register data for register address %x\n",  valuePtr);
                }
                goto LABEL_14;
              }

              int v13 = 0;
            }
          }

          else
          {
            uint64_t v17 = v12;
          }

LABEL_14:
          uint64_t v20 = v15;
          CFIndex v21 = CFArrayGetCount((CFArrayRef)v7);
          if (v21 >= 0) {
            uint64_t v22 = v21;
          }
          else {
            uint64_t v22 = v21 + 1;
          }
          ++v15;
          v14 += 2;
          BOOL v23 = v20 < v22 >> 1;
          uint64_t v12 = v17;
          if (!v23) {
            goto LABEL_33;
          }
        }
      }

      goto LABEL_33;
    }

    CFTypeID v25 = CFGetTypeID(v7);
    if (v25 != CFDataGetTypeID())
    {
LABEL_33:
      sub_100008C70(a1);
      return v6;
    }

    sub_100006EBC(a2);
    unsigned int v26 = *(_DWORD *)(a1 + 16);
    if (v8)
    {
      if (a3 != 1)
      {
        CFIndex Length = CFDataGetLength((CFDataRef)v7) / 4;
        int v28 = 4;
        goto LABEL_31;
      }
    }

    else if (a3 != 3)
    {
      CFIndex Length = CFDataGetLength((CFDataRef)v7);
      int v28 = 2;
LABEL_31:
      sub_100008CB4(a2, Length);
      goto LABEL_33;
    }
  }

  return v6;
}

BOOL sub_100008C00(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRetain(v2);
    return 1LL;
  }

  else
  {
    if (*(_BYTE *)(a1 + 12)) {
      uint64_t v4 = @"CodecExtendedRegisterData";
    }
    else {
      uint64_t v4 = @"CodecRegisterData";
    }
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 8), v4, kCFAllocatorDefault, 0);
    *(void *)(a1 + 4std::iostream::~basic_iostream(v2, v3 + 8) = CFProperty;
    return CFProperty != 0LL;
  }

uint64_t sub_100008C70(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 48);
  if (v1)
  {
    if (CFGetRetainCount(*(CFTypeRef *)(a1 + 48)) == 1) {
      *(void *)(a1 + 4std::iostream::~basic_iostream(v2, v3 + 8) = 0LL;
    }
    CFRelease(v1);
  }

  return 1LL;
}

uint64_t sub_100008CB4(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 5)
  {
    if (a2 >> 59) {
      sub_1000051B4();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = sub_100006C2C(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 32 * v6;
    sub_100009B64(a1, v7);
    return sub_100009CF8((uint64_t)v7);
  }

  return result;
}

void sub_100008D30(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

BOOL sub_100008D44(uint64_t a1, uint64_t a2, CFDataRef theData, unsigned int a4, int a5, uint64_t a6, int a7)
{
  if (!theData) {
    return theData != 0LL;
  }
  switch(a5)
  {
    case 1:
      CFIndex Length = CFDataGetLength(theData);
      BytePtr = CFDataGetBytePtr(theData);
      if (!BytePtr) {
        return theData != 0LL;
      }
      v57 = BytePtr;
      uint64_t v80 = a2;
      std::string __p = 0LL;
      std::string::size_type v85 = 0LL;
      unint64_t v86 = 0LL;
      sub_100009524(&__p, Length);
      if (Length >= 1)
      {
        uint64_t v58 = 0LL;
        uint64_t v59 = (uint64_t **)(a1 + 24);
        do
        {
          int v60 = v57[v58];
          uint64_t v61 = v85;
          if ((unint64_t)v85 >= v86)
          {
            int64_t v63 = __p;
            uint64_t v64 = ((char *)v85 - (_BYTE *)__p) >> 2;
            unint64_t v65 = v64 + 1;
            uint64_t v66 = v86 - (void)__p;
            else {
              unint64_t v67 = v65;
            }
            if (v67)
            {
              uint64_t v68 = (char *)sub_100006DD0((uint64_t)&v86, v67);
              int64_t v63 = __p;
              uint64_t v61 = v85;
            }

            else
            {
              uint64_t v68 = 0LL;
            }

            std::string::size_type v69 = &v68[4 * v64];
            *(_DWORD *)std::string::size_type v69 = v60;
            unint64_t v62 = v69 + 4;
            while (v61 != v63)
            {
              int v70 = *--v61;
              *((_DWORD *)v69 - 1) = v70;
              v69 -= 4;
            }

            std::string __p = v69;
            std::string::size_type v85 = v62;
            unint64_t v86 = (unint64_t)&v68[4 * v67];
            if (v63) {
              operator delete(v63);
            }
          }

          else
          {
            *std::string::size_type v85 = v60;
            unint64_t v62 = v61 + 1;
          }

          std::string::size_type v85 = v62;
          if (a7)
          {
            unsigned int v81 = v58 + a4;
            v87[0] = &v81;
            *((_DWORD *)sub_10000A518(v59, &v81, (uint64_t)&unk_10000BC60, v87) + std::iostream::~basic_iostream(v2, v3 + 8) = 1;
          }

          ++v58;
        }

        while (v58 != Length);
      }

      unsigned int v81 = a4;
      v82[1] = 0LL;
      uint64_t v83 = 0LL;
      v82[0] = 0LL;
      sub_100006D18(v82, __p, (uint64_t)v85, ((char *)v85 - (_BYTE *)__p) >> 2);
      unint64_t v27 = (uint64_t *)v80;
      uint64_t v28 = v80 + 16;
      unint64_t v71 = *(void *)(v80 + 16);
      unint64_t v30 = *(void *)(v80 + 8);
      if (v30 >= v71)
      {
        uint64_t v31 = (uint64_t)(v30 - *(void *)v80) >> 5;
        unint64_t v72 = v31 + 1;
        uint64_t v73 = v71 - *(void *)v80;
        if (v73 >> 4 > v72) {
          unint64_t v72 = v73 >> 4;
        }
        else {
          unint64_t v34 = v72;
        }
        goto LABEL_97;
      }

      break;
    case 2:
      unint64_t v35 = CFDataGetLength(theData);
      size_t v36 = CFDataGetBytePtr(theData);
      if (!v36) {
        return theData != 0LL;
      }
      v37 = v36;
      uint64_t v80 = a2;
      std::string __p = 0LL;
      std::string::size_type v85 = 0LL;
      unint64_t v86 = 0LL;
      sub_100009524(&__p, v35 >> 1);
      if (v35 >= 2)
      {
        uint64_t v38 = 0LL;
        uint64_t v39 = (uint64_t **)(a1 + 24);
        if (v35 >> 1 <= 1) {
          uint64_t v40 = 1LL;
        }
        else {
          uint64_t v40 = v35 >> 1;
        }
        do
        {
          int v41 = *(unsigned __int16 *)&v37[2 * v38];
          unint64_t v42 = v85;
          if ((unint64_t)v85 >= v86)
          {
            uint64_t v44 = __p;
            uint64_t v45 = ((char *)v85 - (_BYTE *)__p) >> 2;
            unint64_t v46 = v45 + 1;
            uint64_t v47 = v86 - (void)__p;
            else {
              unint64_t v48 = v46;
            }
            if (v48)
            {
              std::string::size_type v49 = (char *)sub_100006DD0((uint64_t)&v86, v48);
              uint64_t v44 = __p;
              unint64_t v42 = v85;
            }

            else
            {
              std::string::size_type v49 = 0LL;
            }

            std::string::size_type v50 = &v49[4 * v45];
            *(_DWORD *)std::string::size_type v50 = v41;
            v43 = v50 + 4;
            while (v42 != v44)
            {
              int v51 = *--v42;
              *((_DWORD *)v50 - 1) = v51;
              v50 -= 4;
            }

            std::string __p = v50;
            std::string::size_type v85 = v43;
            unint64_t v86 = (unint64_t)&v49[4 * v48];
            if (v44) {
              operator delete(v44);
            }
          }

          else
          {
            *std::string::size_type v85 = v41;
            v43 = v42 + 1;
          }

          std::string::size_type v85 = v43;
          if (a7)
          {
            unsigned int v81 = v38 + a4;
            v87[0] = &v81;
            *((_DWORD *)sub_10000A518(v39, &v81, (uint64_t)&unk_10000BC60, v87) + std::iostream::~basic_iostream(v2, v3 + 8) = 2;
          }

          ++v38;
        }

        while (v38 != v40);
      }

      unsigned int v81 = a4;
      v82[1] = 0LL;
      uint64_t v83 = 0LL;
      v82[0] = 0LL;
      sub_100006D18(v82, __p, (uint64_t)v85, ((char *)v85 - (_BYTE *)__p) >> 2);
      unint64_t v27 = (uint64_t *)v80;
      uint64_t v28 = v80 + 16;
      unint64_t v52 = *(void *)(v80 + 16);
      unint64_t v30 = *(void *)(v80 + 8);
      if (v30 >= v52)
      {
        uint64_t v31 = (uint64_t)(v30 - *(void *)v80) >> 5;
        unint64_t v53 = v31 + 1;
        uint64_t v54 = v52 - *(void *)v80;
        if (v54 >> 4 > v53) {
          unint64_t v53 = v54 >> 4;
        }
        else {
          unint64_t v34 = v53;
        }
        goto LABEL_97;
      }

      break;
    case 4:
      unint64_t v12 = CFDataGetLength(theData);
      int v13 = CFDataGetBytePtr(theData);
      if (!v13) {
        return theData != 0LL;
      }
      unsigned int v14 = v13;
      uint64_t v80 = a2;
      std::string __p = 0LL;
      std::string::size_type v85 = 0LL;
      unint64_t v86 = 0LL;
      sub_100009524(&__p, v12 >> 2);
      if (v12 >= 4)
      {
        uint64_t v15 = 0LL;
        if (v12 >> 2 <= 1) {
          uint64_t v16 = 1LL;
        }
        else {
          uint64_t v16 = v12 >> 2;
        }
        do
        {
          uint64_t v17 = v85;
          if ((unint64_t)v85 >= v86)
          {
            uint64_t v19 = __p;
            uint64_t v20 = ((char *)v85 - (_BYTE *)__p) >> 2;
            unint64_t v21 = v20 + 1;
            uint64_t v22 = v86 - (void)__p;
            else {
              unint64_t v23 = v21;
            }
            if (v23)
            {
              int v24 = (char *)sub_100006DD0((uint64_t)&v86, v23);
              uint64_t v19 = __p;
              uint64_t v17 = v85;
            }

            else
            {
              int v24 = 0LL;
            }

            CFTypeID v25 = &v24[4 * v20];
            *(_DWORD *)CFTypeID v25 = *(_DWORD *)&v14[4 * v15];
            unint64_t v18 = v25 + 4;
            while (v17 != v19)
            {
              int v26 = *--v17;
              *((_DWORD *)v25 - 1) = v26;
              v25 -= 4;
            }

            std::string __p = v25;
            std::string::size_type v85 = v18;
            unint64_t v86 = (unint64_t)&v24[4 * v23];
            if (v19) {
              operator delete(v19);
            }
          }

          else
          {
            *std::string::size_type v85 = *(_DWORD *)&v14[4 * v15];
            unint64_t v18 = v17 + 1;
          }

          std::string::size_type v85 = v18;
          if (a7)
          {
            unsigned int v81 = a4 + sub_10000812C(a1) * v15;
            v87[0] = &v81;
            *((_DWORD *)sub_10000A518((uint64_t **)(a1 + 24), &v81, (uint64_t)&unk_10000BC60, v87) + std::iostream::~basic_iostream(v2, v3 + 8) = 4;
          }

          ++v15;
        }

        while (v15 != v16);
      }

      unsigned int v81 = a4;
      v82[1] = 0LL;
      uint64_t v83 = 0LL;
      v82[0] = 0LL;
      sub_100006D18(v82, __p, (uint64_t)v85, ((char *)v85 - (_BYTE *)__p) >> 2);
      unint64_t v27 = (uint64_t *)v80;
      uint64_t v28 = v80 + 16;
      unint64_t v29 = *(void *)(v80 + 16);
      unint64_t v30 = *(void *)(v80 + 8);
      if (v30 >= v29)
      {
        uint64_t v31 = (uint64_t)(v30 - *(void *)v80) >> 5;
        unint64_t v32 = v31 + 1;
        uint64_t v33 = v29 - *(void *)v80;
        if (v33 >> 4 > v32) {
          unint64_t v32 = v33 >> 4;
        }
        else {
          unint64_t v34 = v32;
        }
LABEL_97:
        v87[4] = (unsigned int *)(v80 + 16);
        unint64_t v74 = (unsigned int *)sub_100006C2C(v28, v34);
        v75 = &v74[8 * v31];
        v87[0] = v74;
        v87[1] = v75;
        v87[3] = &v74[8 * v76];
        unsigned int *v75 = v81;
        *((void *)v75 + 2) = 0LL;
        *((void *)v75 + 3) = 0LL;
        *((void *)v75 + 1) = 0LL;
        *(_OWORD *)(v75 + 2) = *(_OWORD *)v82;
        *((void *)v75 + 3) = v83;
        v82[0] = 0LL;
        v82[1] = 0LL;
        uint64_t v83 = 0LL;
        v87[2] = v75 + 8;
        sub_100009B64(v27, v87);
        uint64_t v77 = v27[1];
        sub_100009CF8((uint64_t)v87);
        unint64_t v78 = v82[0];
        v27[1] = v77;
        if (v78)
        {
          v82[1] = v78;
          operator delete(v78);
        }

        goto LABEL_99;
      }

      break;
    default:
      return theData != 0LL;
  }

  *(_DWORD *)unint64_t v30 = v81;
  *(void *)(v30 + 16) = 0LL;
  *(void *)(v30 + 24) = 0LL;
  *(void *)(v30 + std::iostream::~basic_iostream(v2, v3 + 8) = 0LL;
  *(_OWORD *)(v30 + std::iostream::~basic_iostream(v2, v3 + 8) = *(_OWORD *)v82;
  *(void *)(v30 + 24) = v83;
  v27[1] = v30 + 32;
LABEL_99:
  if (__p)
  {
    std::string::size_type v85 = __p;
    operator delete(__p);
  }

  return theData != 0LL;
}

void sub_100009498( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a14) {
    operator delete(a14);
  }
  _Unwind_Resume(a1);
}

void sub_100009524(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_1000051B4();
    }
    int64_t v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    uint64_t v6 = (char *)sub_100006DD0(v3, a2);
    CFTypeRef v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    CFTypeID v9 = &v6[4 * v8];
    unsigned int v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
    unint64_t v12 = v7;
    if (v11 != *a1)
    {
      unint64_t v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }

      while (v11 != v10);
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }

void sub_1000095B8(const __CFString *a1@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  uint64_t v6 = (std::string::value_type *)operator new[](v5);
  if (CFStringGetCString(a1, v6, v5, 0x8000100u)) {
    sub_100009D84(a2, v6, v5);
  }
  operator delete[](v6);
}

void sub_100009638(_Unwind_Exception *exception_object)
{
}

BOOL sub_100009654(uint64_t a1, void *a2)
{
  uint64_t v4 = CFStringCreateWithCString(kCFAllocatorDefault, "Ping", 0);
  if (!v4) {
    return 0LL;
  }
  CFIndex v5 = v4;
  BOOL v6 = sub_100008644(a1, v4, &v8);
  *a2 = v8;
  CFRelease(v5);
  return v6;
}

CFStringRef sub_1000096D8(uint64_t a1, const void *a2)
{
  uint64_t result = CFStringCreateWithCString(kCFAllocatorDefault, "HPDetect", 0);
  if (result)
  {
    CFIndex v5 = result;
    BOOL v6 = sub_1000081BC(a1, result, a2);
    CFRelease(v5);
    return (const __CFString *)v6;
  }

  return result;
}

void sub_100009744(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    CFIndex v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v7 = *--v4;
        uint64_t v6 = v7;
        *uint64_t v4 = 0LL;
        if (v7) {
          (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
        }
      }

      while (v4 != v2);
      CFIndex v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

CFDictionaryRef sub_1000097C0(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 8);
  keys = 0LL;
  unint64_t v35 = 0LL;
  size_t v36 = 0LL;
  sub_100007610((void **)&keys, v2);
  values = 0LL;
  unint64_t v32 = 0LL;
  uint64_t v33 = 0LL;
  sub_100007610((void **)&values, v2);
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    uint64_t v4 = *(void ***)a1;
    uint64_t v5 = *(void *)a1 + 16 * v3;
    do
    {
      uint64_t v6 = *v4;
      uint64_t v7 = v35;
      if (v35 >= v36)
      {
        uint64_t v9 = v35 - keys;
        unint64_t v10 = ((char *)v36 - (char *)keys) >> 2;
        if (v10 <= v9 + 1) {
          unint64_t v10 = v9 + 1;
        }
        else {
          unint64_t v11 = v10;
        }
        if (v11) {
          unint64_t v12 = (char *)sub_1000051C8((uint64_t)&v36, v11);
        }
        else {
          unint64_t v12 = 0LL;
        }
        int v13 = (void **)&v12[8 * v9];
        *int v13 = v6;
        uint64_t v8 = v13 + 1;
        uint64_t v15 = keys;
        unsigned int v14 = v35;
        if (v35 != keys)
        {
          do
          {
            uint64_t v16 = *--v14;
            *--int v13 = v16;
          }

          while (v14 != v15);
          unsigned int v14 = keys;
        }

        keys = v13;
        unint64_t v35 = v8;
        size_t v36 = (void **)&v12[8 * v11];
        if (v14) {
          operator delete(v14);
        }
      }

      else
      {
        const char *v35 = v6;
        uint64_t v8 = v7 + 1;
      }

      unint64_t v35 = v8;
      uint64_t v17 = v4[1];
      unint64_t v18 = v32;
      if (v32 >= v33)
      {
        uint64_t v20 = v32 - values;
        unint64_t v21 = ((char *)v33 - (char *)values) >> 2;
        if (v21 <= v20 + 1) {
          unint64_t v21 = v20 + 1;
        }
        else {
          unint64_t v22 = v21;
        }
        if (v22) {
          unint64_t v23 = (char *)sub_1000051C8((uint64_t)&v33, v22);
        }
        else {
          unint64_t v23 = 0LL;
        }
        int v24 = (void **)&v23[8 * v20];
        *int v24 = v17;
        uint64_t v19 = v24 + 1;
        int v26 = values;
        CFTypeID v25 = v32;
        if (v32 != values)
        {
          do
          {
            unint64_t v27 = *--v25;
            *--int v24 = v27;
          }

          while (v25 != v26);
          CFTypeID v25 = values;
        }

        values = v24;
        unint64_t v32 = v19;
        uint64_t v33 = (void **)&v23[8 * v22];
        if (v25) {
          operator delete(v25);
        }
      }

      else
      {
        *unint64_t v32 = v17;
        uint64_t v19 = v18 + 1;
      }

      unint64_t v32 = v19;
      v4 += 2;
    }

    while (v4 != (void **)v5);
  }

  CFDictionaryRef v28 = CFDictionaryCreate( 0LL,  (const void **)keys,  (const void **)values,  v2,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!v28)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }

  if (values)
  {
    unint64_t v32 = values;
    operator delete(values);
  }

  if (keys)
  {
    unint64_t v35 = keys;
    operator delete(keys);
  }

  return v28;
}

void sub_100009A48( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(a1);
}

const void **sub_100009AA0(const void **a1)
{
  unint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t sub_100009AD0(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    uint64_t v4 = *(void *)(i - 8);
    *(void *)(i - std::iostream::~basic_iostream(v2, v3 + 8) = 0LL;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
    }
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *sub_100009B30(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100003430();
  }
  return operator new(16 * a2);
}

uint64_t sub_100009B64(uint64_t *a1, void *a2)
{
  uint64_t result = sub_100009BD8((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_100009BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v14 = a6;
  *((void *)&v14 + 1) = a7;
  __int128 v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }

  else
  {
    do
    {
      int v8 = *(_DWORD *)(a3 - 32);
      a3 -= 32LL;
      *(_DWORD *)(v7 - 32) = v8;
      *(void *)(v7 - 16) = 0LL;
      *(void *)(v7 - std::iostream::~basic_iostream(v2, v3 + 8) = 0LL;
      *(void *)(v7 - 24) = 0LL;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 + 8);
      *(void *)(v7 - std::iostream::~basic_iostream(v2, v3 + 8) = *(void *)(a3 + 24);
      *(void *)(a3 + std::iostream::~basic_iostream(v2, v3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      *(void *)(a3 + 24) = 0LL;
      uint64_t v7 = *((void *)&v14 + 1) - 32LL;
      *((void *)&v14 + 1) -= 32LL;
    }

    while (a3 != a5);
    uint64_t v9 = v14;
  }

  char v12 = 1;
  sub_100009C80((uint64_t)v11);
  return v9;
}

uint64_t sub_100009C80(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_100009CB4(a1);
  }
  return a1;
}

void sub_100009CB4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)(v1 + 8);
    if (v3)
    {
      *(void *)(v1 + 16) = v3;
      operator delete(v3);
    }

    v1 += 32LL;
  }

uint64_t sub_100009CF8(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_100009D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    *(void *)(a1 + 16) = v2 - 32;
    uint64_t v5 = *(void **)(v2 - 24);
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }

    else
    {
      v2 -= 32LL;
    }
  }

std::string *sub_100009D84(std::string *__dst, const std::string::value_type *__src, size_t __len)
{
  LODWORD(v6) = (char)__dst->__r_.__value_.__s.__size_;
  if ((v6 & 0x80000000) != 0)
  {
    std::string::size_type cap = __dst->__r_.__value_.__l.__cap_;
    std::string::size_type v9 = (cap & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __len)
    {
      std::string::size_type size = __dst->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }

    std::string::size_type v6 = HIBYTE(cap);
    uint64_t v7 = (std::string *)__dst->__r_.__value_.__r.__words[0];
  }

  else
  {
    uint64_t v7 = __dst;
    if (__len > 0x16)
    {
      std::string::size_type size = __dst->__r_.__value_.__s.__size_;
      std::string::size_type v9 = 22LL;
LABEL_6:
      std::string::__grow_by_and_replace(__dst, v9, __len - v9, size, 0LL, size, __len, __src);
      return __dst;
    }
  }

  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = __dst->__r_.__value_.__s.__size_;
  }

  if ((v6 & 0x80) != 0) {
    __dst->__r_.__value_.__l.__size_ = __len;
  }
  else {
    __dst->__r_.__value_.__s.__size_ = __len & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__len] = 0;
  return __dst;
}

uint64_t sub_100009E40(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *sub_100009E88(uint64_t a1, unsigned int *a2, _DWORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }

    std::string::size_type v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      unint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6) {
              return v10;
            }
          }

          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }

            else
            {
              v11 &= v7 - 1;
            }

            if (v11 != v3) {
              break;
            }
          }

          unint64_t v10 = (void *)*v10;
        }

        while (v10);
      }
    }
  }

  unint64_t v10 = operator new(0x18uLL);
  void *v10 = 0LL;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_10000A0A4(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *v10 = *v19;
LABEL_38:
    *uint64_t v19 = v10;
    goto LABEL_39;
  }

  void *v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_10000A090(_Unwind_Exception *a1)
{
}

void sub_10000A0A4(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      sub_10000A180(a1, prime);
  }

void sub_10000A180(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_100003430();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + std::iostream::~basic_iostream(v2, v3 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * vstd::iostream::~basic_iostream(v2, v3 + 8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }

          else
          {
            v12 &= a2 - 1;
          }

          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }

            *uint64_t v7 = *v11;
            *unint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + std::iostream::~basic_iostream(v2, v3 + 8) = 0LL;
  }

uint64_t sub_10000A2D8(uint64_t a1, char *a2, int *a3)
{
  int valuePtr = *a3;
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  *(void *)(a1 + std::iostream::~basic_iostream(v2, v3 + 8) = v5;
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }

  return a1;
}

void sub_10000A364(_Unwind_Exception *a1)
{
  unint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  sub_100009AA0((const void **)v1);
  _Unwind_Resume(a1);
}

CFStringRef *sub_10000A3A0(CFStringRef *a1, char *a2)
{
  if ((v9 & 0x80u) == 0) {
    unint64_t v3 = __p;
  }
  else {
    unint64_t v3 = (void **)__p[0];
  }
  if ((v9 & 0x80u) == 0) {
    CFIndex v4 = v9;
  }
  else {
    CFIndex v4 = (CFIndex)__p[1];
  }
  CFStringRef v5 = CFStringCreateWithBytes(0LL, (const UInt8 *)v3, v4, 0x8000100u, 0);
  *a1 = v5;
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }

  return a1;
}

void sub_10000A454( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*v15) {
    CFRelease(*v15);
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000A498(uint64_t a1, char *a2, const void **a3)
{
  CFStringRef v5 = *a3;
  if (v5) {
    CFRetain(v5);
  }
  *(void *)(a1 + std::iostream::~basic_iostream(v2, v3 + 8) = v5;
  return a1;
}

void sub_10000A4D8(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_10000A4D8(a1, *a2);
    sub_10000A4D8(a1, a2[1]);
    operator delete(a2);
  }

uint64_t *sub_10000A518(uint64_t **a1, unsigned int *a2, uint64_t a3, unsigned int **a4)
{
  uint64_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    unsigned int v8 = *a2;
    while (1)
    {
      while (1)
      {
        unsigned __int8 v9 = (uint64_t **)v6;
        unsigned int v10 = *((_DWORD *)v6 + 7);
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }

      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    unsigned __int8 v9 = a1 + 1;
LABEL_10:
    unint64_t v11 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v11 + 2std::iostream::~basic_iostream(v2, v3 + 8) = **a4;
    sub_100005408(a1, (uint64_t)v9, v7, v11);
    return v11;
  }

  return (uint64_t *)v9;
}

uint64_t sub_10000A5D4()
{
  return __cxa_atexit((void (*)(void *))sub_100006FF0, &xmmword_100010000, (void *)&_mh_execute_header);
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}