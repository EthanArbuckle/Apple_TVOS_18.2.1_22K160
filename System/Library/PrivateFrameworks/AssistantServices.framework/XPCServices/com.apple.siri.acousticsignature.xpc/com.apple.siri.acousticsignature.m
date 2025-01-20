void sub_100004C90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}
}

void sub_100004DE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004F28( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_100005028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASXListenerDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];
  exit(1);
}

std::logic_error *sub_1000052EC(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_100005310(const std::string *a1, const std::string *a2)
{
  if ((char)a1->__r_.__value_.__s.__size_ < 0)
  {
    sub_100005664(__dst, a1->__r_.__value_.__l.__data_, a1->__r_.__value_.__l.__size_);
  }

  else
  {
    *(_OWORD *)__dst = *(_OWORD *)&a1->__r_.__value_.__l.__data_;
    std::string::size_type cap = a1->__r_.__value_.__l.__cap_;
  }

  if (sub_1000056EC((const char *)__dst))
  {
    if ((char)a2->__r_.__value_.__s.__size_ < 0)
    {
      sub_100005664(__p, a2->__r_.__value_.__l.__data_, a2->__r_.__value_.__l.__size_);
    }

    else
    {
      *(_OWORD *)__p = *(_OWORD *)&a2->__r_.__value_.__l.__data_;
      std::string::size_type v29 = a2->__r_.__value_.__l.__cap_;
    }

    BOOL v4 = !sub_1000056EC((const char *)__p);
    if (SHIBYTE(v29) < 0) {
      operator delete(__p[0]);
    }
  }

  else
  {
    BOOL v4 = 1;
  }

  if (SHIBYTE(cap) < 0)
  {
    operator delete(__dst[0]);
    if (v4) {
      goto LABEL_13;
    }
  }

  else if (v4)
  {
LABEL_13:
    sub_10000575C(&std::cerr, (uint64_t)"Invalid version string\n", 23LL);
    return 0LL;
  }

  std::string::size_type v6 = std::string::find(a1, 46, 0LL);
  std::string::size_type v7 = std::string::find(a1, 46, v6 + 1);
  std::string::size_type v8 = std::string::find(a2, 46, 0LL);
  std::string::size_type v9 = std::string::find(a2, 46, v8 + 1);
  std::string::basic_string(&v27, a1, 0LL, v6, (std::allocator<char> *)&v32);
  if ((v27.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v10 = &v27;
  }
  else {
    v10 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  int v11 = strtoul((const char *)v10, 0LL, 10);
  int v12 = v11 << 25;
  std::string::basic_string(&v27, a1, v6 + 1, v7 + ~v6, (std::allocator<char> *)&v32);
  if ((v27.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v13 = &v27;
  }
  else {
    v13 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  int v14 = strtoul((const char *)v13, 0LL, 10);
  int v15 = v12 + (v14 << 20);
  std::string::basic_string(&v27, a1, v7 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v32);
  if ((v27.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v16 = &v27;
  }
  else {
    v16 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  int v17 = strtoul((const char *)v16, 0LL, 10);
  int v18 = v15 + (v17 << 15);
  std::string::basic_string(&v27, a2, 0LL, v8, (std::allocator<char> *)&v32);
  if ((v27.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v19 = &v27;
  }
  else {
    v19 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  int v20 = strtoul((const char *)v19, 0LL, 10);
  int v21 = v18 + (v20 << 10);
  std::string::basic_string(&v27, a2, v8 + 1, v9 + ~v8, (std::allocator<char> *)&v32);
  if ((v27.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v22 = &v27;
  }
  else {
    v22 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  int v23 = strtoul((const char *)v22, 0LL, 10);
  int v24 = v21 + 32 * v23;
  std::string::basic_string(&v27, a2, v9 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v32);
  if ((v27.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v25 = &v27;
  }
  else {
    v25 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  int v26 = strtoul((const char *)v25, 0LL, 10);
  return (v24 + v26) ^ 0x80000000;
}

void sub_100005648( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100005664(_BYTE *__dst, void *__src, unint64_t a3)
{
  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_1000059F0();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    std::string::size_type v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    void *v5 = v8;
    v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

BOOL sub_1000056EC(const char *a1)
{
  int v6 = -1;
  int v7 = -1;
  int v5 = -1;
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return sscanf(a1, "%d.%d.%d", &v7, &v6, &v5) == 3 && v7 >= 0 && v6 >= 0 && v5 >= 0;
}

void *sub_10000575C(void *a1, uint64_t a2, uint64_t a3)
{
  if (v23[0])
  {
    int v6 = (char *)a1 + *(void *)(*a1 - 24LL);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
      v10 = std::locale::use_facet(&__b, &std::ctype<char>::id);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32LL);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }

    uint64_t v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v12 = a2 + a3;
    }
    else {
      uint64_t v12 = a2;
    }
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    uint64_t v15 = v13 - a3;
    size_t v16 = v14 ? 0LL : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96LL))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }

    if ((uint64_t)v16 >= 1)
    {
      if (v16 >= 0x7FFFFFFFFFFFFFF8LL) {
        sub_1000059F0();
      }
      if (v16 >= 0x17)
      {
        uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8LL) + 8;
        if ((v16 | 7) != 0x17) {
          uint64_t v18 = v16 | 7;
        }
        uint64_t v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        size_t v25 = v16;
        int64_t v26 = v19 | 0x8000000000000000LL;
        __b.__locale_ = p_b;
      }

      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }

      memset(p_b, v9, v16);
      *((_BYTE *)p_b + v16) = 0;
      int v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      uint64_t v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(void *)v7 + 96LL))(v7, v20, v16);
      if (SHIBYTE(v26) < 0) {
        operator delete(__b.__locale_);
      }
      if (v21 != v16) {
        goto LABEL_29;
      }
    }

    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96LL))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((void *)v6 + 3) = 0LL;
    }

    else
    {
LABEL_29:
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  std::ostream::sentry::~sentry(v23);
  return a1;
}

void sub_10000597C( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  std::ostream::sentry::~sentry(&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24LL)));
  __cxa_end_catch();
  JUMPOUT(0x100005950LL);
}

void sub_1000059DC(_Unwind_Exception *a1)
{
}

void sub_1000059F0()
{
}

void sub_100005A04(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100005A54(exception, a1);
}

void sub_100005A40(_Unwind_Exception *a1)
{
}

std::logic_error *sub_100005A54(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100005A78(void *a1)
{
}

uint64_t sub_100005A88(uint64_t a1)
{
  uint64_t v2 = a1 + 8;
  *(void *)a1 = v3;
  *(void *)(a1 + *(void *)(v3 - 24)) = v4;
  int v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
  std::ios_base::init(v5, (void *)(a1 + 8));
  v5[1].__vftable = 0LL;
  v5[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf(v2);
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_100005B4C(_Unwind_Exception *a1)
{
}

uint64_t sub_100005B74(uint64_t a1)
{
  uint64_t v3 = a1 + 8;
  std::streambuf::~streambuf(v3);
  std::ios::~ios(a1 + 112);
  return a1;
}

uint64_t sub_100005BF8(uint64_t result, uint64_t a2)
{
  unint64_t v2 = 0LL;
  int v3 = *(unsigned __int8 *)(a2 + 36);
  *(_DWORD *)(result + std::ostream::~ostream(v2, v3 + 8) = *(_DWORD *)(a2 + 12);
  unint64_t v4 = *(unsigned int *)(a2 + 40) | ((unint64_t)*(unsigned __int16 *)(a2 + 44) << 32);
  int v5 = *(_DWORD *)(a2 + 32);
  int v6 = (*(_DWORD *)(a2 + 28) >> 27) & 0xF;
  uint64_t v7 = dword_100014C84;
  while (1)
  {
    int v8 = *v7;
    v7 += 2;
    if (v8 == v6) {
      break;
    }
    if (++v2 == 7) {
      goto LABEL_6;
    }
  }

  if (v2 > 2) {
    goto LABEL_17;
  }
LABEL_6:
  uint64_t v9 = 0LL;
  v10 = dword_100014C84;
  while (1)
  {
    int v11 = *v10;
    v10 += 2;
    if (v11 == v6) {
      break;
    }
    if (++v9 == 7) {
      goto LABEL_17;
    }
  }

  if (v9)
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = dword_100014C84;
    while (1)
    {
      int v14 = *v13;
      v13 += 2;
      if (v14 == v6) {
        break;
      }
      if (++v12 == 7)
      {
        unsigned int v15 = 0;
        goto LABEL_16;
      }
    }

    unsigned int v15 = dword_100014C84[2 * v12 + 1];
LABEL_16:
    v4 *= 0x3E80 / v15;
  }

LABEL_17:
  uint64_t v16 = 0LL;
  int v17 = dword_100014C84;
  while (1)
  {
    int v18 = *v17;
    v17 += 2;
    if (v18 == v6) {
      break;
    }
    if (++v16 == 7)
    {
      int v19 = 0;
      goto LABEL_22;
    }
  }

  int v19 = dword_100014C84[2 * v16 + 1];
LABEL_22:
  uint64_t v20 = 0LL;
  *(_DWORD *)(result + 20) = 0;
  *(void *)(result + 12) = 0LL;
  *(void *)result = 0xFACADE990BE5E519LL;
  uint64_t v21 = &dword_100014CC0;
  while (1)
  {
    int v22 = *v21;
    v21 += 2;
    if (v22 == v19) {
      break;
    }
    if (++v20 == 4)
    {
      int v23 = 252706816;
      goto LABEL_27;
    }
  }

  int v23 = ((dword_100014CBC[2 * v20] & 0xF) << 16) | 0xF100000;
LABEL_27:
  *(_DWORD *)(result + 24) = v23;
  *(_DWORD *)(result + 12) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(result + 16) = *(unsigned __int8 *)(a2 + 36);
  *(_DWORD *)(result + 20) = v4;
  *(_DWORD *)(result + 24) = v23 & 0xFFF0000 | WORD2(v4);
  *(_DWORD *)(result + 24) = v23 & 0xFF0000 | WORD2(v4) | ((*(_DWORD *)(a2 + 44) >> 19) << 24);
  *(_DWORD *)(result + 12) = v5;
  *(_DWORD *)(result + 16) = v3;
  return result;
}

float sub_100005D84(int a1, unsigned int a2)
{
  uint64_t v2 = 0LL;
  int v3 = dword_100014CBC;
  while (1)
  {
    int v4 = *v3;
    v3 += 2;
    if (v4 == (HIWORD(a2) & 0xF)) {
      break;
    }
    if (++v2 == 4)
    {
      float v5 = 0.0;
      return (float)(a1 | ((unint64_t)(unsigned __int16)a2 << 32)) / v5;
    }
  }

  float v5 = (float)dword_100014CBC[2 * v2 + 1];
  return (float)(a1 | ((unint64_t)(unsigned __int16)a2 << 32)) / v5;
}

uint64_t sub_100005DDC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = 0LL;
  unsigned int v3 = *(_DWORD *)(result + 24);
  int v4 = dword_100014CBC;
  while (1)
  {
    int v5 = *v4;
    v4 += 2;
    if (v5 == (HIWORD(v3) & 0xF)) {
      break;
    }
    if (++v2 == 4)
    {
      uint64_t v6 = 0LL;
      goto LABEL_6;
    }
  }

  uint64_t v6 = dword_100014CBC[2 * v2 + 1];
LABEL_6:
  uint64_t v7 = (unsigned __int128)(v6 * (a2 + 45) * (__int128)(uint64_t)0xDF3B645A1CAC0831LL) >> 64;
  unint64_t v8 = (*(unsigned int *)(result + 20) | ((unint64_t)(unsigned __int16)*(_DWORD *)(result + 24) << 32))
     + (v7 >> 4)
     + ((unint64_t)v7 >> 63);
  *(_DWORD *)(result + 20) += (v7 >> 4) + ((unint64_t)v7 >> 63);
  *(_DWORD *)(result + 24) = v3 & 0xFFFF0000 | WORD2(v8);
  return result;
}

void sub_100005E64(uint64_t a1, unint64_t a2)
{
  int v4 = *(void **)a1;
  unsigned int v3 = *(void **)(a1 + 8);
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v3 - *(void *)a1) >> 3);
  unint64_t v6 = a2 - v5;
  if (a2 > v5)
  {
    uint64_t v7 = *(void *)(a1 + 16);
    if (0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)v3) >> 3) >= v6)
    {
      bzero(*(void **)(a1 + 8), 24 * ((24 * v6 - 24) / 0x18) + 24);
      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = &v3[3 * ((24 * v6 - 24) / 0x18) + 3];
      return;
    }

    if (a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_100006118();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)v4) >> 3);
    uint64_t v9 = 2 * v8;
    if (2 * v8 <= a2) {
      uint64_t v9 = a2;
    }
    if (v8 >= 0x555555555555555LL) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v9;
    }
    if (v10 > 0xAAAAAAAAAAAAAAALL) {
      sub_10000612C();
    }
    uint64_t v11 = 3 * v10;
    uint64_t v12 = (char *)operator new(24 * v10);
    uint64_t v13 = &v12[24 * v5];
    int v14 = &v12[8 * v11];
    size_t v15 = 24 * ((24 * v6 - 24) / 0x18) + 24;
    bzero(v13, v15);
    uint64_t v16 = &v13[v15];
    if (v3 == v4)
    {
      *(void *)a1 = v13;
      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v16;
      *(void *)(a1 + 16) = v14;
      if (!v3) {
        return;
      }
    }

    else
    {
      do
      {
        int v17 = v13;
        *((void *)v13 - 1) = 0LL;
        __int128 v18 = *(_OWORD *)(v3 - 3);
        v3 -= 3;
        *(_OWORD *)(v13 - 24) = v18;
        v13 -= 24;
        *((void *)v17 - 1) = v3[2];
        void *v3 = 0LL;
        v3[1] = 0LL;
        v3[2] = 0LL;
      }

      while (v3 != v4);
      int v19 = *(void **)a1;
      unsigned int v3 = *(void **)(a1 + 8);
      *(void *)a1 = v13;
      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v16;
      *(void *)(a1 + 16) = v14;
      if (v3 != v19)
      {
        uint64_t v20 = v3;
        do
        {
          int v22 = (void *)*(v20 - 3);
          v20 -= 3;
          uint64_t v21 = v22;
          if (v22)
          {
            *(v3 - 2) = v21;
            operator delete(v21);
          }

          unsigned int v3 = v20;
        }

        while (v20 != v19);
        unsigned int v3 = v19;
      }

      if (!v3) {
        return;
      }
    }

    operator delete(v3);
    return;
  }

  if (a2 < v5)
  {
    int v23 = &v4[3 * a2];
    if (v3 != v23)
    {
      int v24 = *(void **)(a1 + 8);
      do
      {
        int64_t v26 = (void *)*(v24 - 3);
        v24 -= 3;
        size_t v25 = v26;
        if (v26)
        {
          *(v3 - 2) = v25;
          operator delete(v25);
        }

        unsigned int v3 = v24;
      }

      while (v24 != v23);
    }

    *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v23;
  }

void *sub_10000606C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_1000059F0();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_100006118()
{
}

void sub_10000612C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_100006154(uint64_t a1, DSPComplex *__C, float *a3)
{
  size_t v5 = (const DSPSplitComplex *)(a1 + 16);
  vDSP_ctoz(__C, 2LL, (const DSPSplitComplex *)(a1 + 16), 1LL, 0x400uLL);
  vDSP_fft_zrip(*(FFTSetup *)(a1 + 8), v5, 1LL, 0xBuLL, 1);
  unint64_t v6 = *(_DWORD **)(a1 + 24);
  *(_DWORD *)(*(void *)(a1 + 16) + 4096LL) = *v6;
  v6[1024] = 0;
  *unint64_t v6 = 0;
  sub_1000062D4((const DSPSplitComplex *)a1, a3);
}

void sub_1000061CC(uint64_t a1, DSPComplex *__C, float *a3, uint64_t a4)
{
  uint64_t v7 = (const DSPSplitComplex *)(a1 + 16);
  vDSP_ctoz(__C, 2LL, (const DSPSplitComplex *)(a1 + 16), 1LL, 0x400uLL);
  vDSP_fft_zrip(*(FFTSetup *)(a1 + 8), v7, 1LL, 0xBuLL, 1);
  uint64_t v8 = 0LL;
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v9 = *(_DWORD **)(a1 + 24);
  *(_DWORD *)(v10 + 4096) = *v9;
  v9[1024] = 0;
  *uint64_t v9 = 0;
  uint64_t v11 = (_DWORD *)(a4 + 4);
  do
  {
    int v12 = v9[v8];
    *(v11 - 1) = *(_DWORD *)(v10 + 4 * v8);
    _DWORD *v11 = v12;
    ++v8;
    v11 += 2;
  }

  while (v8 != 1025);
  sub_1000062D4((const DSPSplitComplex *)a1, a3);
}

void sub_100006270(uint64_t a1)
{
  uint64_t v1 = (void *)sub_100006284(a1);
  operator delete(v1);
}

uint64_t sub_100006284(uint64_t a1)
{
  *(void *)a1 = off_100038370;
  vDSP_destroy_fftsetup(*(FFTSetup *)(a1 + 8));
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2) {
    operator delete[](v2);
  }
  unsigned int v3 = *(void **)(a1 + 24);
  if (v3) {
    operator delete[](v3);
  }
  return a1;
}

void sub_1000062D4(const DSPSplitComplex *a1, float *__C)
{
  float __B = 0.0000019073;
  vDSP_vsmul(__C, 1LL, &__B, __C, 1LL, 0x401uLL);
}

void sub_1000063F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000064C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_10:
  if (a5 == 1)
  {
    int v12 = (char *)operator new(0x22C0uLL);
    *(void *)int v12 = off_100038538;
    sub_10000C650((uint64_t)(v12 + 8));
    *(_OWORD *)(v12 + 104) = 0u;
    *((void *)v12 + 19) = 0LL;
    *(_OWORD *)(v12 + 120) = 0u;
    *(_OWORD *)(v12 + 136) = 0u;
    sub_10000C780((uint64_t)(v12 + 160));
    sub_10000E598((uint64_t)(v12 + 200), a4);
    sub_100010290((uint64_t)(v12 + 296));
    *((_DWORD *)v12 + 221std::ostream::~ostream(v2, v3 + 8) = a4;
    *((_DWORD *)v12 + 2219) = a3;
    *((void *)v12 + 1110) = 0LL;
    *((_DWORD *)v12 + 2223) = 1;
    sub_10000A9F8((uint64_t *)v12 + 1);
    *((_OWORD *)v12 + 11) = xmmword_100014C00;
    bzero(*((void **)v12 + 20), 0x10040CuLL);
    int v14 = *((void *)v12 + 24);
    bzero(*(void **)(v14 + 8), 4LL * (*(_DWORD *)v14 * *(_DWORD *)(v14 + 4) + 3));
    *(_DWORD *)(v14 + 40) = 0;
    if (*((_DWORD *)v12 + 2219) == 3) {
      *((void *)v12 + 19) = *((void *)v12 + 22) - 45LL;
    }
    sub_10000606C(&v48, "7.2.1");
    sub_10000606C(&v54, "5.1.0");
    if (SHIBYTE(cat) < 0)
    {
      sub_100005664(&v53, *(void **)&v48.__val_, (unint64_t)v48.__cat_);
    }

    else
    {
      *(std::error_code *)&v53.__r_.__value_.__l.__data_ = v48;
      v53.__r_.__value_.__l.__cap_ = (std::string::size_type)cat;
    }

    else {
      __dst = v54;
    }
    int v24 = sub_100005310(&v53, &__dst);
    size_t v25 = 0LL;
    *((_DWORD *)v12 + 10) = 0;
    *((void *)v12 + 4) = 0LL;
    *((_DWORD *)v12 + 7) = v24;
    *(void *)(v12 + 20) = 0xFACADE990BE5E519LL;
    int64_t v26 = &dword_100014CC0;
    while (1)
    {
      std::string v27 = *v26;
      v26 += 2;
      if (v27 == a4) {
        break;
      }
      if (++v25 == 4)
      {
        v28 = 0;
        goto LABEL_56;
      }
    }

    v28 = (dword_100014CBC[2 * v25] & 0xF) << 16;
LABEL_56:
    *((_DWORD *)v12 + 11) = v28 & 0xFF0FFFFF | ((a3 & 0xF) << 20) | 0xF000000;
    std::string::size_type v29 = (void *)*((void *)v12 + 16);
    if ((0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v12 + 18) - (void)v29) >> 2)) >> 6 <= 0x270)
    {
      v30 = *((void *)v12 + 17);
      v31 = (char *)operator new(0x75300uLL);
      char v32 = &v31[v30 - (void)v29];
      v33 = v32;
      if ((void *)v30 != v29)
      {
        v33 = &v31[v30 - (void)v29];
        do
        {
          v34 = *(_DWORD *)(v30 - 12);
          v30 -= 12LL;
          *((_DWORD *)v33 - 3) = v34;
          v33 -= 12;
          *(void *)(v33 + 4) = *(void *)(v30 + 4);
        }

        while ((void *)v30 != v29);
      }

      *((void *)v12 + 16) = v33;
      *((void *)v12 + 17) = v32;
      *((void *)v12 + 1std::ostream::~ostream(v2, v3 + 8) = v31 + 480000;
      if (v29) {
        operator delete(v29);
      }
    }

    *((_DWORD *)v12 + 2222) = 1;
    *((_DWORD *)v12 + 4) = 1;
  }

  else
  {
    if (a5 == 2)
    {
      int v12 = (char *)operator new(0x22C0uLL);
      *(void *)int v12 = off_1000384F0;
      sub_10000C650((uint64_t)(v12 + 8));
      *(_OWORD *)(v12 + 104) = 0u;
      *((void *)v12 + 19) = 0LL;
      *(_OWORD *)(v12 + 120) = 0u;
      *(_OWORD *)(v12 + 136) = 0u;
      sub_10000C780((uint64_t)(v12 + 160));
      sub_10000E598((uint64_t)(v12 + 200), a4);
      sub_100010290((uint64_t)(v12 + 296));
      *((_DWORD *)v12 + 221std::ostream::~ostream(v2, v3 + 8) = a4;
      *((_DWORD *)v12 + 2219) = a3;
      *((void *)v12 + 1110) = 0LL;
      *((_DWORD *)v12 + 2223) = 2;
      sub_10000A9F8((uint64_t *)v12 + 1);
      *((_OWORD *)v12 + 11) = xmmword_100014C00;
      bzero(*((void **)v12 + 20), 0x10040CuLL);
      uint64_t v13 = *((void *)v12 + 24);
      bzero(*(void **)(v13 + 8), 4LL * (*(_DWORD *)v13 * *(_DWORD *)(v13 + 4) + 3));
      *(_DWORD *)(v13 + 40) = 0;
      if (*((_DWORD *)v12 + 2219) == 3) {
        *((void *)v12 + 19) = *((void *)v12 + 22) - 45LL;
      }
      sub_10000606C(&v54, "7.2.1");
      sub_10000606C(&v53, "5.1.0");
      else {
        __dst = v54;
      }
      else {
        __p = v53;
      }
      uint64_t v16 = sub_100005310(&__dst, &__p);
      int v17 = 0LL;
      *((_DWORD *)v12 + 10) = 0;
      *((void *)v12 + 4) = 0LL;
      *((_DWORD *)v12 + 7) = v16;
      *(void *)(v12 + 20) = 0xFACADE990BE5E519LL;
      __int128 v18 = &dword_100014CC0;
      while (1)
      {
        int v19 = *v18;
        v18 += 2;
        if (v19 == a4) {
          break;
        }
        if (++v17 == 4)
        {
          uint64_t v20 = 0;
          goto LABEL_39;
        }
      }

      uint64_t v20 = (dword_100014CBC[2 * v17] & 0xF) << 16;
LABEL_39:
      *((_DWORD *)v12 + 11) = v20 & 0xFF0FFFFF | ((a3 & 0xF) << 20) | 0xF000000;
      uint64_t v21 = *((void *)v12 + 16);
      if ((unint64_t)(0x4EC4EC4EC4EC4EC5LL * ((*((void *)v12 + 18) - v21) >> 4)) >> 6 <= 0x270)
      {
        int v22 = *((void *)v12 + 17);
        v51 = v12 + 144;
        *(void *)&v48.__val_ = operator new(0x7EF400uLL);
        v48.__cat_ = (const std::error_category *)(*(void *)&v48.__val_ + v22 - v21);
        cat = v48.__cat_;
        v50 = *(void *)&v48.__val_ + 8320000LL;
        sub_10000D374((uint64_t *)v12 + 16, &v48);
        if (*(void *)&v48.__val_) {
          operator delete(*(void **)&v48.__val_);
        }
      }

      *((_DWORD *)v12 + 2222) = 4;
      *((_DWORD *)v12 + 4) = 4;
      int v23 = (void *)v54.__r_.__value_.__r.__words[0];
      goto LABEL_82;
    }

    int v12 = (char *)operator new(0x22C0uLL);
    *(void *)int v12 = off_100038580;
    sub_10000C650((uint64_t)(v12 + 8));
    *(_OWORD *)(v12 + 104) = 0u;
    *((void *)v12 + 19) = 0LL;
    *(_OWORD *)(v12 + 120) = 0u;
    *(_OWORD *)(v12 + 136) = 0u;
    sub_10000C780((uint64_t)(v12 + 160));
    sub_10000E598((uint64_t)(v12 + 200), a4);
    sub_100010290((uint64_t)(v12 + 296));
    *((_DWORD *)v12 + 221std::ostream::~ostream(v2, v3 + 8) = a4;
    *((_DWORD *)v12 + 2219) = a3;
    *((void *)v12 + 1110) = 0LL;
    *((_DWORD *)v12 + 2223) = a5;
    sub_10000A9F8((uint64_t *)v12 + 1);
    *((_OWORD *)v12 + 11) = xmmword_100014C00;
    bzero(*((void **)v12 + 20), 0x10040CuLL);
    size_t v15 = *((void *)v12 + 24);
    bzero(*(void **)(v15 + 8), 4LL * (*(_DWORD *)v15 * *(_DWORD *)(v15 + 4) + 3));
    *(_DWORD *)(v15 + 40) = 0;
    if (*((_DWORD *)v12 + 2219) == 3) {
      *((void *)v12 + 19) = *((void *)v12 + 22) - 45LL;
    }
    sub_10000606C(&v48, "7.2.1");
    sub_10000606C(&v54, "5.1.0");
    if (SHIBYTE(cat) < 0)
    {
      sub_100005664(&v53, *(void **)&v48.__val_, (unint64_t)v48.__cat_);
    }

    else
    {
      *(std::error_code *)&v53.__r_.__value_.__l.__data_ = v48;
      v53.__r_.__value_.__l.__cap_ = (std::string::size_type)cat;
    }

    else {
      __dst = v54;
    }
    v35 = sub_100005310(&v53, &__dst);
    v36 = 0LL;
    *((_DWORD *)v12 + 10) = 0;
    *((void *)v12 + 4) = 0LL;
    *((_DWORD *)v12 + 7) = v35;
    *(void *)(v12 + 20) = 0xFACADE990BE5E519LL;
    v37 = &dword_100014CC0;
    while (1)
    {
      v38 = *v37;
      v37 += 2;
      if (v38 == a4) {
        break;
      }
      if (++v36 == 4)
      {
        v39 = 0;
        goto LABEL_73;
      }
    }

    v39 = (dword_100014CBC[2 * v36] & 0xF) << 16;
LABEL_73:
    *((_DWORD *)v12 + 11) = v39 & 0xFF0FFFFF | ((a3 & 0xF) << 20) | 0xF000000;
    sub_10001016C((void **)v12 + 16, 0x9C40uLL);
    *((_DWORD *)v12 + 2222) = 2;
    *((_DWORD *)v12 + 4) = 2;
    if (a5 == 5 || a5 == 3) {
      v43 = 16LL;
    }
    else {
      v43 = 24LL;
    }
    *((void *)v12 + 10) = v43;
  }

  if ((SHIBYTE(cat) & 0x80000000) == 0) {
    goto LABEL_83;
  }
  int v23 = *(void **)&v48.__val_;
LABEL_82:
  operator delete(v23);
LABEL_83:
  v40 = *v10;
  int *v10 = v12;
  if (v40)
  {
    (*(void (**)(char *))(*(void *)v40 + 8LL))(v40);
    int v12 = *v10;
    if (!*v10)
    {
      v45 = __cxa_allocate_exception(0x20uLL);
      *(void *)&v48.__val_ = 505LL;
      v48.__cat_ = (const std::error_category *)&off_10003CB20;
      sub_100008914((uint64_t)v45, &v48);
    }
  }

  v9->mySigX = v10;
  v41 = (*(uint64_t (**)(char *))(*(void *)v12 + 48LL))(v12);
  *(void *)(v41 + 32) = 0LL;
  *(_OWORD *)v41 = 0u;
  *(_OWORD *)(v41 + 16) = 0u;
  return v9;
}

void sub_100006F58( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void **a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26, uint64_t a27, uint64_t a28, void *a29, uint64_t a30, int a31, __int16 a32, char a33, char a34, uint64_t a35, void *__p, uint64_t a37, int a38, __int16 a39, char a40, char a41)
{
  if (a41 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  uint64_t v49 = v44[50];
  v44[50] = 0LL;
  if (v49) {
    (*(void (**)(uint64_t))(*(void *)v49 + 24LL))(v49);
  }
  v50 = (void *)v44[46];
  if (v50) {
    operator delete[](v50);
  }
  v51 = (void *)v44[44];
  if (v51) {
    operator delete[](v51);
  }
  v52 = (void *)v44[42];
  if (v52) {
    operator delete[](v52);
  }
  v53 = (void *)v44[34];
  if (v53) {
    operator delete[](v53);
  }
  v54 = (void *)v44[32];
  if (v54) {
    operator delete[](v54);
  }
  v55 = (void *)v44[27];
  if (v55)
  {
    v44[28] = v55;
    operator delete(v55);
  }

  sub_10000C888(a10);
  v56 = *a11;
  if (*a11)
  {
    v44[17] = v56;
    operator delete(v56);
  }

  v57 = *v42;
  if (*v42)
  {
    v44[14] = v57;
    operator delete(v57);
  }

  sub_10000A9F8(v45);
  a21 = v44 + 6;
  sub_10000AA7C((void ***)&a21);
  operator delete(v44);
  uint64_t v58 = *v43;
  uint64_t *v43 = 0LL;
  if (v58) {
    (*(void (**)(uint64_t))(*(void *)v58 + 8LL))(v58);
  }
  operator delete(v43);
  if (a2 == 4)
  {
    v59 = __cxa_begin_catch(a1);
    if (a12) {
      *a12 = (id)objc_claimAutoreleasedReturnValue([v41 ConvertSigxException:v59]);
    }
  }

  else if (a2 == 3)
  {
    v60 = __cxa_begin_catch(a1);
    if (a12) {
      *a12 = (id)objc_claimAutoreleasedReturnValue([v41 ConvertSigException:v60]);
    }
  }

  else
  {
    v61 = __cxa_begin_catch(a1);
    if (a2 == 2)
    {
      if (a12) {
        *a12 = (id)objc_claimAutoreleasedReturnValue([v41 ConvertGenericException:v61]);
      }
    }

    else if (a12)
    {
      *a12 = (id)objc_claimAutoreleasedReturnValue([v41 FillUnknownError]);
    }
  }

  __cxa_end_catch();
  JUMPOUT(0x100006E30LL);
}

void sub_100007450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_15:
      v9 += v14 >> 3;
      v11 += 24;
      if (v11 == v54) {
        goto LABEL_18;
      }
    }

    uint64_t v16 = v14 >> 3;
    int v19 = *v12;
    int v17 = v12 + 2;
    __int128 v18 = v19;
    uint64_t v20 = v16 - 1;
    while (1)
    {
      uint64_t v21 = *v17;
      if (*v17 < v18)
      {
        exception = __cxa_allocate_exception(0x20uLL);
        v58.__r_.__value_.__r.__words[0] = 200LL;
        v58.__r_.__value_.__l.__size_ = (std::string::size_type)&off_10003CB28;
        sub_10000F0DC((uint64_t)exception, (std::error_code *)&v58);
        goto LABEL_51;
      }

      if (v18 == v21
        && *((unsigned __int16 *)v17 - 2) == *((unsigned __int16 *)v17 + 2)
        && *((unsigned __int16 *)v17 - 1) == *((unsigned __int16 *)v17 + 3))
      {
        break;
      }

      v17 += 2;
      __int128 v18 = v21;
      if (!--v20) {
        goto LABEL_15;
      }
    }

    exception = __cxa_allocate_exception(0x20uLL);
    v58.__r_.__value_.__r.__words[0] = 202LL;
    v58.__r_.__value_.__l.__size_ = (std::string::size_type)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, (std::error_code *)&v58);
LABEL_51:
  }

  uint64_t v10 = 0LL;
  uint64_t v9 = 0LL;
LABEL_18:
  int v22 = sub_100005D84(v51, v52);
  if (v22 <= 0.24 && v9 == 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    v58.__r_.__value_.__r.__words[0] = 300LL;
    v58.__r_.__value_.__l.__size_ = (std::string::size_type)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, (std::error_code *)&v58);
    goto LABEL_51;
  }

  if (v22 <= 0.24)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    v58.__r_.__value_.__r.__words[0] = 302LL;
    v58.__r_.__value_.__l.__size_ = (std::string::size_type)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, (std::error_code *)&v58);
    goto LABEL_51;
  }

  if (!v9)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    v58.__r_.__value_.__r.__words[0] = 301LL;
    v58.__r_.__value_.__l.__size_ = (std::string::size_type)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, (std::error_code *)&v58);
    goto LABEL_51;
  }

  if (v10 <= 0x3D)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    v58.__r_.__value_.__r.__words[0] = 303LL;
    v58.__r_.__value_.__l.__size_ = (std::string::size_type)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, (std::error_code *)&v58);
    goto LABEL_51;
  }

  int v24 = v56;
  if (v22 < (float)((float)v56 / 125.0))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    v58.__r_.__value_.__r.__words[0] = 203LL;
    v58.__r_.__value_.__l.__size_ = (std::string::size_type)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, (std::error_code *)&v58);
    goto LABEL_51;
  }

  if (v50 == 3)
  {
    sub_10000AC14(&v58, 0xAAAAAAAAAAAAAAABLL * ((v8 - v7) >> 3));
    size_t v25 = 0LL;
    int64_t v26 = -45LL;
    if (v55 != 15) {
      int64_t v26 = 0LL;
    }
    std::string v27 = (void *)v58.__r_.__value_.__r.__words[0];
    if ((uint64_t)v26 < (uint64_t)v24)
    {
      size_t v25 = 0LL;
      std::string::size_type v29 = v53;
      v28 = v54;
      v30 = (v54 - v53) / 24;
      if (v30 <= 1) {
        v30 = 1LL;
      }
      do
      {
        v26 += 256LL;
        if (v28 != v29)
        {
          for (i = 0LL; i != v30; ++i)
          {
            char v32 = v27[i];
            v33 = &v29[24 * i];
            v34 = *(void *)v33;
            v35 = *((void *)v33 + 1) - *(void *)v33;
            if (v32 >= v35 >> 3)
            {
              v37 = v27[i];
            }

            else
            {
              v36 = v35 >> 3;
              v37 = v27[i];
              v38 = (unsigned int *)(v34 + 8 * v32);
              while (1)
              {
                v39 = *v38;
                v38 += 2;
                if (v26 <= v39) {
                  break;
                }
                if (v36 == ++v37)
                {
                  v37 = v36;
                  break;
                }
              }
            }

            v40 = v37 - v32;
            if (v25 <= v40) {
              size_t v25 = v40;
            }
            v27[i] = v37;
          }
        }
      }

      while (v26 < v24);
    }

    if (v27)
    {
      v58.__r_.__value_.__l.__size_ = (std::string::size_type)v27;
      operator delete(v27);
    }

    if (v25 >= 0x19)
    {
      sub_10000606C(&v58, "Density: ");
      std::to_string(&v57, v25);
      if ((v57.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v44 = &v57;
      }
      else {
        v44 = (std::string *)v57.__r_.__value_.__r.__words[0];
      }
      if ((v57.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        size = v57.__r_.__value_.__s.__size_;
      }
      else {
        size = v57.__r_.__value_.__l.__size_;
      }
      std::string::append(&v58, (const std::string::value_type *)v44, size);
      std::string::append(&v58, " instead of ");
      std::to_string(&v57, 0x18uLL);
      if ((v57.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v46 = &v57;
      }
      else {
        uint64_t v46 = (std::string *)v57.__r_.__value_.__r.__words[0];
      }
      if ((v57.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v47 = v57.__r_.__value_.__s.__size_;
      }
      else {
        v47 = v57.__r_.__value_.__l.__size_;
      }
      std::string::append(&v58, (const std::string::value_type *)v46, v47);
      v48 = __cxa_allocate_exception(0x20uLL);
      v57.__r_.__value_.__r.__words[0] = 400LL;
      v57.__r_.__value_.__l.__size_ = (std::string::size_type)&off_10003CB28;
      sub_10000EED4((uint64_t)v48, (const std::error_code *)&v57, (const void **)&v58.__r_.__value_.__l.__data_);
    }
  }

  if (v49)
  {
    v41 = (void *)sub_100008224(v49);
    operator delete(v41);
  }

  uint64_t v49 = 0LL;
  v58.__r_.__value_.__r.__words[0] = (std::string::size_type)&v53;
  sub_10000AA7C((void ***)&v58);
  return 1;
}

void sub_100007FB8( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *__p, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
  if (a2 == 4)
  {
    v31 = __cxa_begin_catch(a1);
    if (v26)
    {
      char v32 = (void *)objc_claimAutoreleasedReturnValue([v27 ConvertSigxException:v31]);
LABEL_14:
      *int64_t v26 = v32;
    }
  }

  else if (a2 == 3)
  {
    v33 = __cxa_begin_catch(a1);
    if (v26)
    {
      char v32 = (void *)objc_claimAutoreleasedReturnValue([v27 ConvertSigException:v33]);
      goto LABEL_14;
    }
  }

  else
  {
    v34 = __cxa_begin_catch(a1);
    if (a2 == 2)
    {
      if (v26)
      {
        char v32 = (void *)objc_claimAutoreleasedReturnValue([v27 ConvertGenericException:v34]);
        goto LABEL_14;
      }
    }

    else if (v26)
    {
      char v32 = (void *)objc_claimAutoreleasedReturnValue([v27 FillUnknownError]);
      goto LABEL_14;
    }
  }

  __cxa_end_catch();
  JUMPOUT(0x100007D88LL);
}

void sub_1000080F0(_Unwind_Exception *a1)
{
}

void sub_100008208( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100008224(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    uint64_t v2 = (void *)sub_100008224();
    operator delete(v2);
  }

  if (*(_BYTE *)(a1 + 8))
  {
    unsigned int v3 = *(void **)(a1 + 16);
    if (v3) {
      operator delete[](v3);
    }
  }

  return a1;
}

uint64_t sub_100008268(unsigned int *a1, uint64_t a2)
{
  uint64_t v10 = a2;
  if (a1)
  {
    unsigned int v2 = *a1;
    unsigned int v3 = &v10;
    do
    {
LABEL_3:
      size_t v4 = v3;
      size_t v5 = (unsigned int *)*v3;
      if (!*v3) {
        break;
      }
      unsigned int v3 = (uint64_t *)(v5 + 6);
    }

    while (*v5 <= v2);
    unint64_t v6 = a1;
    while (1)
    {
      uint64_t v7 = v6;
      unint64_t v6 = (unsigned int *)*((void *)v6 + 3);
      if (!v6) {
        break;
      }
      unsigned int v8 = *v6;
      if (*v6 != v2)
      {
        *((void *)v7 + 3) = v5;
        unsigned int v3 = (uint64_t *)(v7 + 6);
        void *v4 = a1;
        unsigned int v2 = v8;
        a1 = v6;
        goto LABEL_3;
      }
    }

    *((void *)v7 + 3) = v5;
    void *v4 = a1;
    return v10;
  }

  return a2;
}

void *sub_1000082E0(uint64_t a1)
{
  unsigned int v2 = operator new(0x20uLL);
  *(_OWORD *)unsigned int v2 = *(_OWORD *)a1;
  size_t v3 = *(unsigned int *)(a1 + 4);
  unsigned int v4 = (v3 + 3) & 0xFFFFFFFC;
  size_t v5 = (char *)operator new[](v4);
  v2[2] = v5;
  memcpy(v5, *(const void **)(a1 + 16), v3);
  v2[3] = 0LL;
  *((_BYTE *)v2 + std::ostream::~ostream(v2, v3 + 8) = 1;
  return v2;
}

uint64_t sub_100008374(uint64_t a1, unsigned int a2)
{
  uint64_t v8 = 0LL;
  if (a1)
  {
    uint64_t v3 = a1;
    unsigned int v4 = &v8;
    do
    {
      if (!((*(_DWORD *)v3 ^ a2) >> 16))
      {
        size_t v5 = (char *)operator new(0x20uLL);
        __int128 v6 = *(_OWORD *)(v3 + 16);
        *(_OWORD *)size_t v5 = *(_OWORD *)v3;
        *((_OWORD *)v5 + 1) = v6;
        v5[8] = 0;
        uint64_t *v4 = (uint64_t)v5;
        unsigned int v4 = (uint64_t *)(v5 + 24);
      }

      uint64_t v3 = *(void *)(v3 + 24);
    }

    while (v3);
  }

  else
  {
    unsigned int v4 = &v8;
  }

  uint64_t *v4 = 0LL;
  return v8;
}

uint64_t sub_1000083F4(_DWORD *a1, uint64_t a2)
{
  if (*a1 != 0x40000000)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v14.__val_ = 111LL;
    v14.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v14);
    goto LABEL_12;
  }

  unint64_t v3 = a1[1];
  if (a2 != v3 && ((a2 & 7) != 0 || a2 - v3 >= 8))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v14.__val_ = 112LL;
    v14.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v14);
    goto LABEL_12;
  }

  unsigned int v4 = operator new(0x20uLL);
  uint64_t v5 = (uint64_t)v4;
  _DWORD *v4 = 0x40000000;
  v4[1] = v3;
  *((_BYTE *)v4 + std::ostream::~ostream(v2, v3 + 8) = 1;
  *((void *)v4 + 2) = a1;
  *((void *)v4 + 3) = 0LL;
  unint64_t v6 = 8LL;
  if (v3 >= 9)
  {
    uint64_t v7 = v4;
    while (v3 - v6 > 7)
    {
      uint64_t v8 = operator new(0x20uLL);
      int v9 = *(_DWORD *)((char *)a1 + v6 + 4);
      *uint64_t v8 = *(_DWORD *)((char *)a1 + v6);
      v8[1] = v9;
      *((void *)v7 + 3) = v8;
      *((void *)v8 + 2) = (char *)a1 + v6 + 8;
      *((void *)v8 + 3) = 0LL;
      v6 += 8LL + ((v9 + 3) & 0xFFFFFFFC);
      *((_BYTE *)v8 + std::ostream::~ostream(v2, v3 + 8) = 0;
      uint64_t v7 = v8;
      if (v6 >= v3) {
        goto LABEL_9;
      }
    }

    uint64_t v11 = (void *)sub_100008224(v5);
    operator delete(v11);
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v14.__val_ = 113LL;
    v14.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v14);
LABEL_12:
  }

LABEL_9:
  if (v6 != v3)
  {
    uint64_t v13 = (void *)sub_100008224(v5);
    operator delete(v13);
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v14.__val_ = 114LL;
    v14.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v14);
    goto LABEL_12;
  }

  return v5;
}

void sub_1000085A8(_Unwind_Exception *a1)
{
}

uint64_t sub_1000085C8(int *a1, uint64_t a2)
{
  unint64_t v3 = a1;
  if (a2)
  {
    *(void *)a2 = 0LL;
    *(void *)(a2 + std::ostream::~ostream(v2, v3 + 8) = 0LL;
    *(void *)(a2 + 16) = 0LL;
    *(_DWORD *)(a2 + 4) = 0x40000000;
  }

  if (!a1)
  {
    uint64_t v5 = 24LL;
    if (!a2) {
      return v5;
    }
    goto LABEL_21;
  }

  int v4 = 0;
  uint64_t v5 = 24LL;
  uint64_t v6 = a2;
  do
  {
    int v7 = *v3;
    int v8 = v3[1];
    int v9 = (unsigned __int16)*v3;
    if (*v3 != v4 && v9 != 0)
    {
      if (a2)
      {
        uint64_t v6 = a2 + v5;
        *(void *)uint64_t v6 = 0LL;
        *(void *)(v6 + std::ostream::~ostream(v2, v3 + 8) = 0LL;
        *(void *)(v6 + 16) = 0LL;
        *(_DWORD *)(v6 + 4) = v7;
        int v7 = *v3;
        int v9 = (unsigned __int16)*v3;
      }

      uint64_t v5 = (v5 + 24);
      int v4 = v7;
    }

    if (v9)
    {
      int v11 = v8 + 3;
      int v12 = v11 & 0xFFFFFFFC;
      if (a2)
      {
        if (v7 == 1610874935) {
          int v12 = sub_10000F1E0(v3[1], *((void *)v3 + 2), a2 + v5);
        }
        else {
          memcpy((void *)(a2 + v5), *((const void **)v3 + 2), v11 & 0xFFFFFFFC);
        }
        *(_DWORD *)(v6 + std::ostream::~ostream(v2, v3 + 8) = v12;
      }

      uint64_t v5 = (v12 + v5);
    }

    unint64_t v3 = (int *)*((void *)v3 + 3);
  }

  while (v3);
  if (a2) {
LABEL_21:
  }
    *(_DWORD *)(a2 + std::ostream::~ostream(v2, v3 + 8) = v5;
  return v5;
}

uint64_t sub_1000086CC(int *a1, _DWORD *a2)
{
  unint64_t v3 = a1;
  if (a2) {
    *(void *)a2 = 0x40000000LL;
  }
  if (a1)
  {
    int v4 = 0;
    uint64_t v5 = 8LL;
    uint64_t v6 = a2;
    while (1)
    {
      int v8 = *v3;
      unsigned int v7 = v3[1];
LABEL_21:
      unint64_t v3 = (int *)*((void *)v3 + 3);
      if (!v3)
      {
        if (a2) {
          goto LABEL_23;
        }
        return v5;
      }
    }

    if (a2)
    {
      uint64_t v6 = (_DWORD *)((char *)a2 + v5);
      *uint64_t v6 = v8;
      v6[1] = 0;
    }

    LODWORD(v5) = v5 + 8;
    int v4 = v8;
LABEL_15:
    int v10 = (v7 + 3) & 0xFFFFFFFC;
    if (a2)
    {
      if (v8 == 1610874935) {
        int v10 = sub_10000F1E0(v7, *((void *)v3 + 2), (uint64_t)a2 + v5);
      }
      else {
        memcpy((char *)a2 + v5, *((const void **)v3 + 2), (v7 + 3) & 0xFFFFFFFC);
      }
      v6[1] = v10;
    }

    uint64_t v5 = (v10 + v5);
    goto LABEL_21;
  }

  uint64_t v5 = 8LL;
  if (a2) {
LABEL_23:
  }
    a2[1] = v5;
  return v5;
}

void sub_1000087C0(std::error_category *a1)
{
}

const char *sub_1000087D4()
{
  return "sigx";
}

void *sub_1000087E0@<X0>(int a1@<W1>, void *a2@<X8>)
{
  switch(a1)
  {
    case 500:
      unsigned int v2 = "Unknown Error";
      break;
    case 501:
      unsigned int v2 = "Can't checkpoint a fatsig stream that has already been checkpointed. Must call rewind() before.";
      break;
    case 502:
      unsigned int v2 = "Can't rewind() a fatsig stream that hasn't been checkpointed. Must call checkpoint() before.";
      break;
    case 503:
      unsigned int v2 = "Can't checkpoint a fft stream that has already been checkpointed. Must call rewind() before.";
      break;
    case 504:
      unsigned int v2 = "Can't rewind() a fft stream that hasn't been checkpointed. Must call checkpoint() before.";
      break;
    case 505:
      unsigned int v2 = "Unkonwn pipeline error - could not construct pipeline";
      break;
    case 506:
      unsigned int v2 = "Unallocated buffer for vizualize received";
      break;
    case 507:
      unsigned int v2 = "Invalid last_n value";
      break;
    case 508:
      unsigned int v2 = "Error checkpointing the ring buffer";
      break;
    case 509:
      unsigned int v2 = "Error rewinding the ring buffer";
      break;
    case 510:
      unsigned int v2 = "Error writing to the ring buffer";
      break;
    case 511:
      unsigned int v2 = "Error getting frame from ring buffer";
      break;
    case 512:
      unsigned int v2 = "Error - Aligned Buffer is not actually aligned";
      break;
    case 513:
      unsigned int v2 = "Error - count flowed into fft stream not equal to SHZ_SIGX_FFT_STEPSIZE";
      break;
    case 514:
      unsigned int v2 = "Error - sample count after resample less than SHZ_SIGX_FFT_STEPSIZE";
      break;
    case 515:
      unsigned int v2 = "Error - internal sample rate is not 16k";
      break;
    case 516:
      unsigned int v2 = "Error - resampling given too many samples";
      break;
    case 517:
      unsigned int v2 = "Error - resample function not set correctly";
      break;
    default:
      if (a1) {
        unsigned int v2 = "unknown";
      }
      else {
        unsigned int v2 = "Success";
      }
      break;
  }

  return sub_10000606C(a2, v2);
}

void sub_100008900(std::runtime_error *a1)
{
}

uint64_t sub_100008914(uint64_t a1, std::error_code *this)
{
  *(void *)a1 = &off_100038410;
  *(std::error_code *)(a1 + 16) = *this;
  return a1;
}

void sub_10000897C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100008998(uint64_t a1, int *a2, unint64_t a3)
{
  v300 = (uint64_t *)(a1 + 40);
  *(void *)(a1 + 72) = 0LL;
  *(_BYTE *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 84) = 0;
  *(_BYTE *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = 0;
  *(void *)a1 = 0LL;
  *(_OWORD *)(a1 + 12) = 0u;
  unint64_t v3 = (_OWORD *)(a1 + 12);
  *(_OWORD *)(a1 + 2std::ostream::~ostream(v2, v3 + 8) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(void *)(a1 + 57) = 0LL;
  if (!a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v302.__val_ = 101LL;
    v302.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v302);
    goto LABEL_394;
  }

  if (a3 <= 0x2B)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v302.__val_ = 105LL;
    v302.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v302);
    goto LABEL_394;
  }

  int v6 = *a2;
  if (*a2 == 199615769)
  {
    sub_100005E64((uint64_t)v300, 1uLL);
    __int128 v11 = *(_OWORD *)(a2 + 3);
    _OWORD *v3 = *(_OWORD *)a2;
    *(_OWORD *)((char *)v3 + 12) = v11;
    if (*(_DWORD *)v3 != 199615769)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v302.__val_ = 103LL;
      v302.__cat_ = (const std::error_category *)&off_10003CB28;
      sub_10000F0DC((uint64_t)exception, &v302);
      goto LABEL_394;
    }

    int v12 = crc32(dword_10003CB30, (const Bytef *)a2 + 8, (int)a3 - 8);
    int v13 = *(_DWORD *)(a1 + 16);
    if (v13 != v12 && v13 != -87368039)
    {
      sub_10000575C(&std::cerr, (uint64_t)"WRONG CRC!!\n", 12LL);
      *(void *)a1 = 0LL;
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v302.__val_ = 107LL;
      v302.__cat_ = (const std::error_category *)&off_10003CB28;
      sub_10000F0DC((uint64_t)exception, &v302);
      goto LABEL_394;
    }

    sub_100005A88((uint64_t)&v302);
    unsigned int v14 = a3 - 28;
    if ((a3 - 28) < 0x10)
    {
      v286 = __cxa_allocate_exception(0x20uLL);
      v301.__r_.__value_.__r.__words[0] = 131LL;
      v301.__r_.__value_.__l.__size_ = (std::string::size_type)&off_10003CB28;
      sub_10000F0DC((uint64_t)v286, (std::error_code *)&v301);
    }

    uint64_t v15 = 0LL;
    v294 = a2 + 7;
    do
    {
      LOBYTE(v309.__val_) = *((_BYTE *)v294 + v15);
      sub_10000575C(&v302, (uint64_t)&v309, 1LL);
      ++v15;
    }

    while (v15 != 16);
    if (v14 < 0x11)
    {
      unsigned int v18 = 16;
      unsigned int v17 = 16;
LABEL_60:
      if (v17 == v14)
      {
        uint64_t v49 = operator new[](v18);
        std::stringbuf::str(&v301, (const std::stringbuf *)&v302.__cat_);
        int size = (char)v301.__r_.__value_.__s.__size_;
        v51 = (void *)v301.__r_.__value_.__r.__words[0];
        if ((v301.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          v52 = &v301;
        }
        else {
          v52 = (std::stringbuf::string_type *)v301.__r_.__value_.__r.__words[0];
        }
        memcpy(v49, v52, v18);
        v49[1] = v18;
        v49[3] = v18 - 16;
        if (size < 0) {
          operator delete(v51);
        }
        if (v306 < 0) {
          operator delete(__p);
        }
        std::streambuf::~streambuf(&v302.__cat_);
        std::ios::~ios(&v307);
        uint64_t v9 = a1;
        *(void *)a1 = sub_1000083F4(v49, v18);
        int v10 = 4;
        goto LABEL_108;
      }
    }

    else
    {
      int v16 = 0;
      unsigned int v17 = 16;
      unsigned int v18 = 16;
      while (1)
      {
        int v19 = (unsigned __int8 *)v294 + v17;
        int v20 = *v19;
        unsigned int v291 = v18;
        if (v20 == 255)
        {
          int v20 = v19[1] | (unsigned __int16)(v19[2] << 8) | (v19[3] << 16) | (v19[4] << 24);
          int v21 = 5;
        }

        else
        {
          int v21 = 1;
        }

        v16 += v20;
        LOBYTE(v309.__val_) = v16;
        sub_10000575C(&v302, (uint64_t)&v309, 1LL);
        LOBYTE(v309.__val_) = BYTE1(v16);
        sub_10000575C(&v302, (uint64_t)&v309, 1LL);
        LOBYTE(v309.__val_) = BYTE2(v16);
        sub_10000575C(&v302, (uint64_t)&v309, 1LL);
        LOBYTE(v309.__val_) = HIBYTE(v16);
        sub_10000575C(&v302, (uint64_t)&v309, 1LL);
        unsigned int v22 = v21 + v17;
        LOBYTE(v309.__val_) = *((_BYTE *)v294 + v22);
        sub_10000575C(&v302, (uint64_t)&v309, 1LL);
        LOBYTE(v309.__val_) = *((_BYTE *)v294 + v22 + 1);
        sub_10000575C(&v302, (uint64_t)&v309, 1LL);
        LOBYTE(v309.__val_) = *((_BYTE *)v294 + v22 + 2);
        sub_10000575C(&v302, (uint64_t)&v309, 1LL);
        LOBYTE(v309.__val_) = *((_BYTE *)v294 + v22 + 3);
        sub_10000575C(&v302, (uint64_t)&v309, 1LL);
        unsigned int v23 = v22 + 4;
        if (v22 + 4 > v14) {
          break;
        }
        unint64_t v24 = 0LL;
        unint64_t v25 = 0LL;
        unsigned int v26 = 0;
        do
        {
          int v27 = sub_10000F160(v24, v25, &v308, (unint64_t *)&v309);
          float v28 = 0.0;
          if (v27)
          {
            std::string::size_type v29 = (_WORD *)((char *)v294 + v23 + v26);
            LOWORD(v2std::ostream::~ostream(v2, v3 + 8) = *v29;
            HIWORD(v30) = -14464;
            float v28 = (float)((float)((float)LODWORD(v28) * 0.000015259) * 131070.0) + -65536.0;
            LOWORD(v30) = v29[1];
            float v31 = (float)((float)((float)v30 * 0.000015259) * 6.2832) + -3.1416;
            v26 += 4;
          }

          else
          {
            float v31 = 0.0;
          }

          flt_10003CB34[5 * v24 + v25] = v28;
          flt_10003CB98[5 * v24 + v25] = v31;
          BOOL v32 = v25 == 4;
          if (v25 == 4) {
            unint64_t v25 = 0LL;
          }
          else {
            ++v25;
          }
          if (v32) {
            ++v24;
          }
        }

        while (v24 < 5);
        std::ostream::write(&v302, flt_10003CB34, 100LL);
        std::ostream::write(&v302, flt_10003CB98, 100LL);
        unsigned int v17 = v26 + v23;
        unsigned int v18 = v291 + 208;
        if (v17 >= v14) {
          goto LABEL_60;
        }
      }
    }

    v283 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v283, "Sumo decoding read more bytes than expected! Can't unpack this sig.");
  }

  if (v6 == -889313920)
  {
    sub_100005E64((uint64_t)v300, 1uLL);
    __int128 v7 = *((_OWORD *)a2 + 1);
    std::error_code v302 = *(std::error_code *)a2;
    __int128 v303 = v7;
    __int128 v304 = *((_OWORD *)a2 + 2);
    if (a3 - 48 != LODWORD(v302.__cat_)) {
      goto LABEL_401;
    }
    if (v302.__val_ == -889313920)
    {
      if (*(&v302.__val_ + 1) == crc32(dword_10003CB30, (const Bytef *)a2 + 8, (int)a3 - 8)
        || *(&v302.__val_ + 1) == -87368039)
      {
        int v8 = operator new[](a3 - 48);
        memcpy(v8, a2 + 12, a3 - 48);
        uint64_t v9 = a1;
        *(void *)a1 = sub_1000083F4(v8, a3 - 48);
        sub_100005BF8((uint64_t)v3, (uint64_t)&v302);
        int v10 = (HIDWORD(v304) >> 17) & 3;
        goto LABEL_108;
      }

LABEL_401:
      *(void *)a1 = 0LL;
      v285 = __cxa_allocate_exception(0x20uLL);
      v301.__r_.__value_.__r.__words[0] = 106LL;
      v301.__r_.__value_.__l.__size_ = (std::string::size_type)&off_10003CB28;
      sub_10000F0DC((uint64_t)v285, (std::error_code *)&v301);
    }

LABEL_405:
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v309.__val_ = 103LL;
    v309.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v309);
    goto LABEL_394;
  }

  if (a3 < 0xB0
    || ((size_t v33 = a2[5], a3 - 32 != v33)
      ? (BOOL v34 = a3 - 32 - ((a3 / 0x8001) & 0x1FFFFFFFFFFE0LL) == v33)
      : (BOOL v34 = 1),
        v34 ? (BOOL v35 = a3 - 32 >= v6) : (BOOL v35 = 0),
        v35 ? (BOOL v36 = v6 == 0) : (BOOL v36 = 1),
        v36 || (_DWORD)v33 != (a2[6] ^ 0x789ABC13)))
  {
LABEL_56:
    *(void *)a1 = 0LL;
    v47 = __cxa_allocate_exception(0x20uLL);
    v301.__r_.__value_.__r.__words[0] = 108LL;
    v301.__r_.__value_.__l.__size_ = (std::string::size_type)&off_10003CB28;
    sub_10000F0DC((uint64_t)v47, (std::error_code *)&v301);
  }

  v37 = operator new[](a2[5]);
  v295 = v3;
  size_t v38 = 0LL;
  uint64_t v39 = (uint64_t)a2 + a3;
  LODWORD(v40) = v6;
  v41 = (int32x4_t *)a2;
  while (1)
  {
    v42 = v41 + 2;
    unint64_t v43 = (int)v40;
    memcpy((char *)v37 + v38, &v41[2], (int)v40);
    if (vaddvq_s32(vaddq_s32(v41[1], *v41)) + sub_100010200((_DWORD *)((char *)v37 + v38), v43) != 2 * v41[1].i32[3])
    {
LABEL_55:
      operator delete[](v37);
      goto LABEL_56;
    }

    uint64_t v44 = v41->i32[0];
    v38 += v44;
    if (v33 <= v38) {
      break;
    }
    v41 = (int32x4_t *)((char *)v42 + v44);
    if ((unint64_t)(v39 - ((void)v42 + v44)) > 0x1F)
    {
      uint64_t v40 = v41->i32[0];
      if (v38 + v40 <= v33)
      {
        uint64_t v45 = v41[1].u32[1];
        if ((_DWORD)v45 == (v41[1].i32[2] ^ 0x789ABC13) && v33 - v38 == v45) {
          continue;
        }
      }
    }

    goto LABEL_55;
  }

  if (a2[3] < 0)
  {
    uint64_t v48 = (uint64_t)v295;
    if ((v33 & 7) != 0) {
      __assert_rtn("Unobfuscate", "obfuscate.cpp", 99, "!(sz & 0x7)");
    }
    if (v33 >= 8)
    {
      uint64_t v53 = 0LL;
      unint64_t v54 = 0LL;
      uint64_t v55 = 0x57F8FEF4AB2432FFLL;
      do
      {
        int v56 = 73;
        uint64_t v57 = v55;
        do
        {
          if (v57 >= 0) {
            v57 *= 2LL;
          }
          else {
            uint64_t v57 = (2 * v57) ^ 0x1B;
          }
          --v56;
        }

        while (v56);
        int v58 = 73;
        uint64_t v55 = v57;
        do
        {
          if (v55 >= 0) {
            v55 *= 2LL;
          }
          else {
            uint64_t v55 = (2 * v55) ^ 0x1B;
          }
          --v58;
        }

        while (v58);
        uint64_t v59 = v54 ^ v57;
        unint64_t v60 = *(void *)&v37[2 * v53];
        *(void *)&v37[2 * v53++] = v59 ^ ((v60 << ((v55 & 0x1Fu) + 1)) | (v60 >> (v55 & 0x1F ^ 0x3F)));
        unint64_t v54 = v60;
      }

      while (v53 != v33 >> 3);
    }

    v33 -= 8LL;
    memmove(v37, v37 + 2, v33);
  }

  else
  {
    uint64_t v48 = (uint64_t)v295;
  }

  if (v37[1] != 0x40000000)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v309.__val_ = 111LL;
    v309.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v309);
    goto LABEL_394;
  }

  unint64_t v61 = v37[2];
  if (v33 != v61 && ((v33 & 7) != 0 || v33 - v61 >= 8))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v309.__val_ = 112LL;
    v309.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v309);
    goto LABEL_394;
  }

  v62 = operator new(0x20uLL);
  uint64_t v63 = (uint64_t)v62;
  _DWORD *v62 = 0x40000000;
  v62[1] = v61;
  *((_BYTE *)v62 + std::ostream::~ostream(v2, v3 + 8) = 1;
  *((void *)v62 + 2) = v37;
  *((void *)v62 + 3) = 0LL;
  unint64_t v64 = 24LL;
  if (v61 >= 0x19)
  {
    v65 = v62;
    uint64_t v9 = a1;
    while (v61 - v64 > 0x17)
    {
      v66 = operator new(0x20uLL);
      int v67 = *(_DWORD *)((char *)v37 + v64 + 8);
      _DWORD *v66 = *(_DWORD *)((char *)v37 + v64 + 4);
      v66[1] = v67;
      *((void *)v65 + 3) = v66;
      *((void *)v66 + 2) = (char *)v37 + v64 + 24;
      *((void *)v66 + 3) = 0LL;
      v64 += 24LL + ((v67 + 3) & 0xFFFFFFFC);
      *((_BYTE *)v66 + std::ostream::~ostream(v2, v3 + 8) = 0;
      v65 = v66;
      if (v64 >= v61) {
        goto LABEL_94;
      }
    }

    v284 = (void *)sub_100008224(v63);
    operator delete(v284);
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v309.__val_ = 113LL;
    v309.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v309);
LABEL_394:
  }

  uint64_t v9 = a1;
LABEL_94:
  if (v64 != v61)
  {
    v287 = (void *)sub_100008224(v63);
    operator delete(v287);
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v309.__val_ = 114LL;
    v309.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v309);
    goto LABEL_394;
  }

  uint64_t v68 = v63;
  while (2)
  {
    if (*(_DWORD *)v68 == 1342177282)
    {
      if (*(_DWORD *)(v68 + 4) == 48)
      {
        uint64_t v71 = *(void *)(v68 + 16);
        std::error_code v302 = *(std::error_code *)v71;
        __int128 v303 = *(_OWORD *)(v71 + 16);
        __int128 v304 = *(_OWORD *)(v71 + 32);
        goto LABEL_107;
      }

      v288 = (void *)sub_100008224(v63);
      operator delete(v288);
      goto LABEL_56;
    }

    uint64_t v68 = *(void *)(v68 + 24);
    if (v68) {
      continue;
    }
    break;
  }

  uint64_t v69 = v63;
  while (*(_DWORD *)v69 != 1342177281)
  {
    uint64_t v69 = *(void *)(v69 + 24);
    if (!v69) {
      goto LABEL_101;
    }
  }

  uint64_t v72 = *(void *)(v69 + 16);
  if (!v72)
  {
LABEL_101:
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v309.__val_ = 122LL;
    v309.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v309);
    goto LABEL_394;
  }

  if (*(_DWORD *)v72 != -559038737) {
    goto LABEL_405;
  }
  *(void *)&__int128 v303 = 0LL;
  *((void *)&v303 + 1) = 0x800000000000000LL;
  v302.__cat_ = 0LL;
  *(void *)&v302.__val_ = 0xFACADE99CAFE2580LL;
  unint64_t v73 = (unint64_t)(float)(*(float *)(v72 + 8) * 125.0);
  LODWORD(v304) = v73;
  DWORD1(v304) = BYTE4(v73);
  DWORD2(v304) = vcvts_n_u32_f32((float)*(unsigned int *)(v72 + 4) * 0.015625, 6uLL);
  LODWORD(v73) = *(_DWORD *)(v72 + 12);
  int v74 = *(_DWORD *)(v72 + 16) << 19;
  HIDWORD(v302.__cat_) = v73;
  HIDWORD(v304) = v74;
LABEL_107:
  *(void *)uint64_t v9 = v63;
  sub_100005BF8(v48, (uint64_t)&v302);
  int v10 = 2;
LABEL_108:
  *(_DWORD *)(v9 + std::ostream::~ostream(v2, v3 + 8) = v10;
  if (*(_BYTE *)(v9 + 39) == 15) {
    *(_BYTE *)(v9 + 80) = 15;
  }
  if (v10 != 2)
  {
    if (!*(void *)v9)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v302.__val_ = 119LL;
      v302.__cat_ = (const std::error_category *)&off_10003CB28;
      sub_10000F0DC((uint64_t)exception, &v302);
      goto LABEL_394;
    }

    if (v10 != 4 && v10 != 1)
    {
      sub_100005E64((uint64_t)v300, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v9 + 48) - *(void *)(v9 + 40)) >> 3));
      uint64_t v75 = a1;
      v100 = *(uint64_t **)(a1 + 40);
      if (*(uint64_t **)(a1 + 48) == v100)
      {
LABEL_343:
        int v76 = *(_DWORD *)(v75 + 8);
        goto LABEL_344;
      }

      uint64_t v101 = 0LL;
      v102 = (uint64_t *)a1;
      unsigned int v103 = 0;
      do
      {
        uint64_t v104 = *v102;
        if (*v102)
        {
          while (*(_DWORD *)v104 != v103 + 1610809600)
          {
            uint64_t v104 = *(void *)(v104 + 24);
            if (!v104) {
              goto LABEL_184;
            }
          }

          unint64_t v105 = *(unsigned int *)(v104 + 4);
          uint64_t v106 = v105 >> 3;
          v107 = *(uint64_t **)(v104 + 16);
          if (v105 >> 3)
          {
            v108 = &v100[3 * v101];
            v110 = (void **)(v108 + 1);
            v109 = (char *)v108[1];
            uint64_t v111 = v108[2];
            if (v106 <= (v111 - (uint64_t)v109) >> 3)
            {
              if (v105 >> 3)
              {
                memmove(v109, v107, 8 * v106);
                *v110 = &v109[8 * v106];
              }

              else
              {
                v119 = &v109[-8 * v106];
                v120 = (void *)v108[1];
                while (v119 < v109)
                {
                  uint64_t v121 = *(void *)v119;
                  v119 += 8;
                  *v120++ = v121;
                }

                *v110 = v120;
                if (v109 != &v109[8 * v106]) {
                  memmove(&v109[-8 * ((-8 * v106) >> 3)], v109, -8 * v106);
                }
                if (&v107[v106] != v107) {
                  memmove(v109, v107, 8 * v106);
                }
              }
            }

            else
            {
              uint64_t v112 = (uint64_t)&v109[-*v108] >> 3;
              if ((unint64_t)(v112 + v106) >> 61) {
LABEL_395:
              }
                sub_100006118();
              uint64_t v113 = v111 - *v108;
              uint64_t v114 = v113 >> 2;
              else {
                unint64_t v115 = v114;
              }
              if (v115)
              {
                v116 = (char *)sub_10000C61C(v115);
                uint64_t v118 = v117;
              }

              else
              {
                v116 = 0LL;
                uint64_t v118 = 0LL;
              }

              v122 = &v116[8 * v112];
              v123 = &v122[8 * v106];
              uint64_t v124 = 8 * v106;
              v125 = v122;
              do
              {
                uint64_t v126 = *v107++;
                *(void *)v125 = v126;
                v125 += 8;
                v124 -= 8LL;
              }

              while (v124);
              v127 = (char *)*v108;
              if ((char *)*v108 != v109)
              {
                v128 = v109;
                do
                {
                  uint64_t v129 = *((void *)v128 - 1);
                  v128 -= 8;
                  *((void *)v122 - 1) = v129;
                  v122 -= 8;
                }

                while (v128 != v127);
              }

              int64_t v130 = (_BYTE *)*v110 - v109;
              if (*v110 != v109)
              {
                v131 = v123;
                memmove(v123, v109, (_BYTE *)*v110 - v109);
                v123 = v131;
              }

              v132 = (void *)*v108;
              uint64_t *v108 = (uint64_t)v122;
              *v110 = &v123[v130];
              v108[2] = (uint64_t)&v116[8 * v118];
              if (v132) {
                operator delete(v132);
              }
            }
          }
        }

LABEL_184:
        v102 = (uint64_t *)a1;
        v100 = *(uint64_t **)(a1 + 40);
        v133 = *(uint64_t **)(a1 + 48);
        uint64_t v101 = ++v103;
      }

      while (0xAAAAAAAAAAAAAAABLL * (v133 - v100) > v103);
      uint64_t v75 = a1;
LABEL_342:
      while (v100 != v133)
      {
        sub_10000AAF8(v100);
        v100 += 3;
      }

      goto LABEL_343;
    }

    sub_100005E64((uint64_t)v300, 1uLL);
    uint64_t v82 = sub_100008374(*(void *)a1, 0x60040000u);
    uint64_t v83 = v82;
    if (v82)
    {
      uint64_t v84 = *(void *)(v82 + 16);
      unsigned int v85 = *(_DWORD *)(v82 + 4);
      unint64_t v86 = v85 / 0xD0uLL;
      if (*(_BYTE *)(a1 + 64))
      {
        sub_100005E64((uint64_t)v300, 4uLL);
        uint64_t v296 = v83;
        *(void *)&v302.__val_ = 0LL;
        v302.__cat_ = 0LL;
        *(void *)&__int128 v303 = 0LL;
        if (v85 >= 0xD0)
        {
          v88 = 0LL;
          uint64_t v89 = 0LL;
          if (v86 <= 1) {
            unint64_t v86 = 1LL;
          }
          do
          {
            v90 = *(std::error_category_vtbl **)(v84 + 208 * v89);
            if ((unint64_t)v88 >= (unint64_t)v303)
            {
              v92 = *(std::error_category **)&v302.__val_;
              uint64_t v93 = ((uint64_t)v88 - *(void *)&v302.__val_) >> 3;
              unint64_t v94 = v93 + 1;
              uint64_t v95 = v303 - *(void *)&v302.__val_;
              else {
                unint64_t v96 = v94;
              }
              if (v96) {
                unint64_t v96 = (unint64_t)sub_10000C61C(v96);
              }
              else {
                uint64_t v97 = 0LL;
              }
              v98 = (std::error_category *)(v96 + 8 * v93);
              v98->__vftable = v90;
              v91 = v98 + 1;
              if (v88 != v92)
              {
                do
                {
                  v99 = v88[-1].__vftable;
                  --v88;
                  v98[-1].__vftable = v99;
                  --v98;
                }

                while (v88 != v92);
                v88 = *(std::error_category **)&v302.__val_;
              }

              *(void *)&v302.__val_ = v98;
              v302.__cat_ = v91;
              *(void *)&__int128 v303 = v96 + 8 * v97;
              if (v88) {
                operator delete(v88);
              }
            }

            else
            {
              v88->__vftable = v90;
              v91 = v88 + 1;
            }

            v302.__cat_ = v91;
            ++v89;
            v88 = (std::error_category *)v91;
          }

          while (v89 != v86);
        }

LABEL_212:
        uint64_t v75 = a1;
        sub_10000FAE4((uint64_t *)&v302.__val_, v300, *(void *)(a1 + 72), 1, v87);
        uint64_t v83 = v296;
        if (*(void *)&v302.__val_) {
          operator delete(*(void **)&v302.__val_);
        }
        goto LABEL_340;
      }

      sub_10001016C( *(void ***)(a1 + 40),  v86 - 0x5555555555555555LL * ((uint64_t)(*(void *)(a1 + 48) - *(void *)(a1 + 40)) >> 3));
      if (v85 >= 0xD0)
      {
        uint64_t v297 = v83;
        uint64_t v153 = 0LL;
        if (v86 <= 1) {
          unint64_t v86 = 1LL;
        }
        do
        {
          v154 = (void **)*v300;
          uint64_t v155 = *(void *)(v84 + 208 * v153);
          v157 = *(void **)(*v300 + 8);
          unint64_t v156 = *(void *)(*v300 + 16);
          if ((unint64_t)v157 >= v156)
          {
            uint64_t v159 = ((char *)v157 - (_BYTE *)*v154) >> 3;
            uint64_t v160 = v156 - (void)*v154;
            uint64_t v161 = v160 >> 2;
            else {
              unint64_t v162 = v161;
            }
            if (v162) {
              unint64_t v162 = (unint64_t)sub_10000C61C(v162);
            }
            else {
              uint64_t v163 = 0LL;
            }
            v164 = (void *)(v162 + 8 * v159);
            void *v164 = v155;
            v158 = v164 + 1;
            v166 = (char *)*v154;
            v165 = (char *)v154[1];
            if (v165 != *v154)
            {
              do
              {
                uint64_t v167 = *((void *)v165 - 1);
                v165 -= 8;
                *--v164 = v167;
              }

              while (v165 != v166);
              v165 = (char *)*v154;
            }

            *v154 = v164;
            v154[1] = v158;
            v154[2] = (void *)(v162 + 8 * v163);
            if (v165) {
              operator delete(v165);
            }
          }

          else
          {
            void *v157 = v155;
            v158 = v157 + 1;
          }

          v154[1] = v158;
          ++v153;
        }

        while (v153 != v86);
LABEL_339:
        uint64_t v75 = a1;
        uint64_t v83 = v297;
        goto LABEL_340;
      }
    }

    else
    {
      uint64_t v135 = sub_100008374(*(void *)a1, 0x60020000u);
      uint64_t v83 = v135;
      if (!v135)
      {
        exception = __cxa_allocate_exception(0x20uLL);
        *(void *)&v302.__val_ = 120LL;
        v302.__cat_ = (const std::error_category *)&off_10003CB28;
        sub_10000F0DC((uint64_t)exception, &v302);
        goto LABEL_394;
      }

      uint64_t v136 = *(void *)(v135 + 16);
      unsigned int v137 = *(_DWORD *)(v135 + 4);
      unint64_t v138 = v137 / 0xCuLL;
      if (*(_BYTE *)(a1 + 64))
      {
        sub_100005E64((uint64_t)v300, 4uLL);
        uint64_t v296 = v83;
        *(void *)&v302.__val_ = 0LL;
        v302.__cat_ = 0LL;
        *(void *)&__int128 v303 = 0LL;
        if (v137 >= 0xC)
        {
          v139 = 0LL;
          uint64_t v140 = 0LL;
          if (v138 <= 1) {
            unint64_t v138 = 1LL;
          }
          do
          {
            v141 = *(std::error_category_vtbl **)(v136 + 12 * v140);
            if ((unint64_t)v139 >= (unint64_t)v303)
            {
              v143 = *(std::error_category **)&v302.__val_;
              uint64_t v144 = ((uint64_t)v139 - *(void *)&v302.__val_) >> 3;
              unint64_t v145 = v144 + 1;
              uint64_t v146 = v303 - *(void *)&v302.__val_;
              else {
                unint64_t v147 = v145;
              }
              if (v147) {
                unint64_t v147 = (unint64_t)sub_10000C61C(v147);
              }
              else {
                uint64_t v148 = 0LL;
              }
              v149 = (std::error_category *)(v147 + 8 * v144);
              v149->__vftable = v141;
              v142 = v149 + 1;
              if (v139 != v143)
              {
                do
                {
                  v150 = v139[-1].__vftable;
                  --v139;
                  v149[-1].__vftable = v150;
                  --v149;
                }

                while (v139 != v143);
                v139 = *(std::error_category **)&v302.__val_;
              }

              *(void *)&v302.__val_ = v149;
              v302.__cat_ = v142;
              *(void *)&__int128 v303 = v147 + 8 * v148;
              if (v139) {
                operator delete(v139);
              }
            }

            else
            {
              v139->__vftable = v141;
              v142 = v139 + 1;
            }

            v302.__cat_ = v142;
            ++v140;
            v139 = (std::error_category *)v142;
          }

          while (v140 != v138);
        }

        goto LABEL_212;
      }

      sub_10001016C( *(void ***)(a1 + 40),  v138 - 0x5555555555555555LL * ((uint64_t)(*(void *)(a1 + 48) - *(void *)(a1 + 40)) >> 3));
      if (v137 >= 0xC)
      {
        uint64_t v297 = v83;
        uint64_t v229 = 0LL;
        if (v138 <= 1) {
          unint64_t v138 = 1LL;
        }
        do
        {
          v230 = (void **)*v300;
          uint64_t v231 = *(void *)(v136 + 12 * v229);
          v233 = *(void **)(*v300 + 8);
          unint64_t v232 = *(void *)(*v300 + 16);
          if ((unint64_t)v233 >= v232)
          {
            uint64_t v235 = ((char *)v233 - (_BYTE *)*v230) >> 3;
            uint64_t v236 = v232 - (void)*v230;
            uint64_t v237 = v236 >> 2;
            else {
              unint64_t v238 = v237;
            }
            if (v238) {
              unint64_t v238 = (unint64_t)sub_10000C61C(v238);
            }
            else {
              uint64_t v239 = 0LL;
            }
            v240 = (void *)(v238 + 8 * v235);
            void *v240 = v231;
            v234 = v240 + 1;
            v242 = (char *)*v230;
            v241 = (char *)v230[1];
            if (v241 != *v230)
            {
              do
              {
                uint64_t v243 = *((void *)v241 - 1);
                v241 -= 8;
                *--v240 = v243;
              }

              while (v241 != v242);
              v241 = (char *)*v230;
            }

            *v230 = v240;
            v230[1] = v234;
            v230[2] = (void *)(v238 + 8 * v239);
            if (v241) {
              operator delete(v241);
            }
          }

          else
          {
            void *v233 = v231;
            v234 = v233 + 1;
          }

          v230[1] = v234;
          ++v229;
        }

        while (v229 != v138);
        goto LABEL_339;
      }
    }

    uint64_t v75 = a1;
LABEL_340:
    v244 = (void *)sub_100008224(v83);
    operator delete(v244);
    v100 = *(uint64_t **)(v75 + 40);
    v133 = *(uint64_t **)(v75 + 48);
    goto LABEL_342;
  }

  sub_100005E64((uint64_t)v300, 4uLL);
  uint64_t v75 = a1;
  int v76 = *(_DWORD *)(a1 + 8);
  if (v76 != 2)
  {
LABEL_344:
    if (v76 != 3 && !*(_BYTE *)(v75 + 88)) {
      sub_10000A9F8((uint64_t *)v75);
    }
    goto LABEL_347;
  }

  uint64_t v77 = *(void *)a1;
  if (!*(void *)a1)
  {
LABEL_421:
    sub_10000A9F8((uint64_t *)a1);
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v302.__val_ = 125LL;
    v302.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v302);
    goto LABEL_394;
  }

  uint64_t v78 = *(void *)a1;
  do
  {
    if (*(_DWORD *)v78 == 1610809408)
    {
      if (*(_BYTE *)(a1 + 88))
      {
        while (*(_DWORD *)v77 != 1342177281)
        {
          uint64_t v77 = *(void *)(v77 + 24);
          if (!v77) {
            goto LABEL_189;
          }
        }

        uint64_t v134 = (uint64_t)sub_1000082E0(v77);
      }

      else
      {
LABEL_189:
        uint64_t v134 = 0LL;
      }

      uint64_t v207 = 0LL;
      while (1)
      {
        uint64_t v208 = *(void *)a1;
        if (!*(void *)a1) {
          break;
        }
        while (*(_DWORD *)v208 != (_DWORD)v207 + 1610809408)
        {
          uint64_t v208 = *(void *)(v208 + 24);
          if (!v208) {
            goto LABEL_315;
          }
        }

        uint64_t v209 = *(void *)(v208 + 16);
        unsigned int v210 = *(_DWORD *)(v208 + 4);
        unint64_t v211 = v210 / 5uLL;
        uint64_t v212 = *v300 + 24 * v207;
        *(void *)(v212 + std::ostream::~ostream(v2, v3 + 8) = *(void *)v212;
        sub_10000DC24((char **)v212, v211);
        if (v210 >= 5)
        {
          int v214 = 0;
          unint64_t v213 = 0LL;
          v215 = *(char **)v212;
          v216 = (unsigned __int8 *)(v209 + 2);
          do
          {
            int v217 = *(v216 - 2);
            int v218 = *(v216 - 1);
            int v219 = *v216;
            int v220 = v216[1];
            int v221 = v216[2];
            if (v217 == 255)
            {
              int v214 = v218 | (v219 << 8) | (v220 << 16) | (v221 << 24);
            }

            else
            {
              v214 += v217;
              v222 = &v215[8 * v213];
              *(_DWORD *)v222 = v214;
              *((_WORD *)v222 + 3) = v218 | ((_WORD)v219 << 8);
              *((_WORD *)v222 + 2) = v220 | ((_WORD)v221 << 8);
              ++v213;
            }

            v216 += 5;
            --v211;
          }

          while (v211);
        }

        else
        {
          unint64_t v213 = 0LL;
        }

        sub_10000DC24((char **)v212, v213);
        if (*(_BYTE *)(a1 + 88))
        {
          v223 = operator new(0x20uLL);
          uint64_t v224 = *v300 + 24 * v207;
          v225 = *(const void **)v224;
          uint64_t v226 = *(void *)(v224 + 8) - *(void *)v224;
          _DWORD *v223 = v207 + 1610809600;
          v223[1] = v226 & 0xFFFFFFF8;
          size_t v227 = v226 & 0xFFFFFFF8;
          v228 = operator new[](v227);
          *((void *)v223 + 2) = v228;
          memcpy(v228, v225, v227);
          *((void *)v223 + 3) = 0LL;
          *((_BYTE *)v223 + std::ostream::~ostream(v2, v3 + 8) = 1;
          uint64_t v134 = sub_100008268(v223, v134);
        }

        if (++v207 == 4) {
          goto LABEL_317;
        }
      }

LABEL_315:
      if (v207 == 3)
      {
        sub_100005E64((uint64_t)v300, 3uLL);
LABEL_317:
        uint64_t v75 = a1;
        sub_10000A9F8((uint64_t *)a1);
        if (*(_BYTE *)(a1 + 88)) {
          *(void *)a1 = v134;
        }
        goto LABEL_319;
      }

      sub_10000A9F8((uint64_t *)a1);
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v302.__val_ = 124LL;
      v302.__cat_ = (const std::error_category *)&off_10003CB28;
      sub_10000F0DC((uint64_t)exception, &v302);
      goto LABEL_394;
    }

    uint64_t v78 = *(void *)(v78 + 24);
  }

  while (v78);
  int v79 = 1610809348;
  uint64_t v80 = *(void *)a1;
  while (*(_DWORD *)v80 != 1610809348)
  {
    uint64_t v80 = *(void *)(v80 + 24);
    if (!v80)
    {
      int v79 = 1610809345;
      uint64_t v81 = *(void *)a1;
      while (*(_DWORD *)v81 != 1610809345)
      {
        uint64_t v81 = *(void *)(v81 + 24);
        if (!v81) {
          goto LABEL_421;
        }
      }

      break;
    }
  }

  uint64_t v151 = *(void *)a1;
  while (2)
  {
    if (*(_DWORD *)v151 == 1342177281)
    {
      if (*(_DWORD *)(v151 + 4) <= *(_DWORD *)(v77 + 4))
      {
        uint64_t v152 = (uint64_t)sub_1000082E0(v151);
        uint64_t v77 = *(void *)a1;
        goto LABEL_241;
      }

      goto LABEL_421;
    }

    uint64_t v151 = *(void *)(v151 + 24);
    if (v151) {
      continue;
    }
    break;
  }

  uint64_t v152 = 0LL;
LABEL_241:
  int v168 = 0;
  float v169 = 1.0;
  while (v77)
  {
    uint64_t v170 = v77;
    while (*(_DWORD *)v170 != v168 + v79)
    {
      uint64_t v170 = *(void *)(v170 + 24);
      if (!v170) {
        goto LABEL_254;
      }
    }

    unint64_t v171 = *(unsigned int *)(v170 + 4);
    if (v171 >= 0x10)
    {
      uint64_t v172 = *(void *)(v170 + 16);
      unint64_t v173 = v171 >> 4;
      v174 = (float *)(v172 + 12);
      do
      {
        float v175 = *v174;
        v174 += 4;
        float v176 = v175;
        if (v169 <= v175) {
          float v169 = v176;
        }
        --v173;
      }

      while (v173);
    }

    if (++v168 == 4) {
      goto LABEL_256;
    }
  }

LABEL_254:
  if (v168 != 3)
  {
    if (v152)
    {
      v289 = (void *)sub_100008224(v152);
      operator delete(v289);
    }

    goto LABEL_421;
  }

  sub_100005E64((uint64_t)v300, 3uLL);
LABEL_256:
  uint64_t v177 = 0LL;
  float v178 = 1073700000.0 / v169;
  while (1)
  {
    uint64_t v179 = *(void *)a1;
    if (!*(void *)a1) {
      break;
    }
    while (*(_DWORD *)v179 != v79 + (_DWORD)v177)
    {
      uint64_t v179 = *(void *)(v179 + 24);
      if (!v179) {
        goto LABEL_290;
      }
    }

    unint64_t v180 = *(unsigned int *)(v179 + 4);
    unint64_t v181 = v180 >> 4;
    v182 = *(float **)(v179 + 16);
    v183 = (unsigned int *)operator new[](8 * (v180 >> 4));
    v184 = v183;
    uint64_t v298 = v152;
    uint64_t v292 = 8 * (v180 >> 4);
    if (v180 >= 0x10)
    {
      uint64_t v185 = 0LL;
      if (v181 <= 1) {
        uint64_t v186 = 1LL;
      }
      else {
        uint64_t v186 = v180 >> 4;
      }
      do
      {
        float v187 = logf(v178 * v182[3]);
        v188 = &v184[v185];
        *((_WORD *)v188 + 3) = (int)fmaxf(v187 * 1477.3, 0.0);
        *((_WORD *)v188 + 2) = vcvts_n_s32_f32(v182[1], 6uLL);
        unsigned int v189 = *(_DWORD *)v182;
        v182 += 4;
        unsigned int *v188 = v189;
        v185 += 2LL;
      }

      while (2 * v186 != v185);
      sub_10000B47C((uint64_t)v184, &v184[2 * v181], 126 - 2 * __clz(v181), 1);
      uint64_t v190 = 0LL;
      do
      {
        v191 = (void **)(*v300 + 24 * v177);
        v193 = v191 + 1;
        v192 = v191[1];
        unint64_t v194 = (unint64_t)v191[2];
        if ((unint64_t)v192 >= v194)
        {
          uint64_t v196 = ((char *)v192 - (_BYTE *)*v191) >> 3;
          uint64_t v197 = v194 - (void)*v191;
          uint64_t v198 = v197 >> 2;
          else {
            unint64_t v199 = v198;
          }
          if (v199) {
            unint64_t v199 = (unint64_t)sub_10000C61C(v199);
          }
          else {
            uint64_t v200 = 0LL;
          }
          v201 = (void *)(v199 + 8 * v196);
          void *v201 = *(void *)&v184[2 * v190];
          v195 = v201 + 1;
          v202 = (char *)*v193;
          v203 = (char *)*v191;
          if (*v193 != *v191)
          {
            do
            {
              uint64_t v204 = *((void *)v202 - 1);
              v202 -= 8;
              *--v201 = v204;
            }

            while (v202 != v203);
            v202 = (char *)*v191;
          }

          *v191 = v201;
          *v193 = v195;
          v191[2] = (void *)(v199 + 8 * v200);
          if (v202) {
            operator delete(v202);
          }
        }

        else
        {
          void *v192 = *(void *)&v184[2 * v190];
          v195 = v192 + 1;
        }

        *v193 = v195;
        ++v190;
      }

      while (v190 != v186);
    }

    else
    {
      sub_10000B47C((uint64_t)v183, &v183[2 * v181], 0LL, 1);
    }

    if (*(_BYTE *)(a1 + 88))
    {
      v205 = operator new(0x20uLL);
      _DWORD *v205 = v177 + 1610809600;
      v205[1] = v292;
      *((void *)v205 + 2) = v184;
      *((void *)v205 + 3) = 0LL;
      *((_BYTE *)v205 + std::ostream::~ostream(v2, v3 + 8) = 1;
      uint64_t v152 = sub_100008268(v205, v298);
    }

    else
    {
      operator delete[](v184);
      uint64_t v152 = v298;
    }

    if (++v177 == 4) {
      goto LABEL_292;
    }
  }

LABEL_290:
  if (v177 != 3)
  {
    if (v152)
    {
      v290 = (void *)sub_100008224(v152);
      operator delete(v290);
    }

    goto LABEL_421;
  }

  sub_100005E64((uint64_t)v300, 3uLL);
LABEL_292:
  uint64_t v75 = a1;
  sub_10000A9F8((uint64_t *)a1);
  if (*(_BYTE *)(a1 + 88))
  {
    *(void *)a1 = v152;
  }

  else if (v152)
  {
    v206 = (void *)sub_100008224(v152);
    operator delete(v206);
  }

LABEL_319:
  *(_DWORD *)(v75 + std::ostream::~ostream(v2, v3 + 8) = 3;
LABEL_347:
  *(_DWORD *)(v75 + 84) = 0;
  v246 = *(uint64_t **)(v75 + 40);
  v245 = *(uint64_t **)(v75 + 48);
  if (v246 == v245)
  {
    unsigned int v247 = 0;
  }

  else
  {
    unsigned int v247 = 0;
    v248 = *(uint64_t **)(v75 + 40);
    do
    {
      uint64_t v249 = v248[1];
      if (v249 != *v248)
      {
        unsigned int v250 = *(_DWORD *)(v249 - 8);
        if (v250 > v247)
        {
          *(_DWORD *)(v75 + 84) = v250;
          unsigned int v247 = v250;
        }
      }

      v248 += 3;
    }

    while (v248 != v245);
  }

  float v251 = sub_100005D84(*(_DWORD *)(v75 + 32), *(_DWORD *)(v75 + 36));
  float v252 = (float)v247 / 125.0;
  if (v251 <= 0.24 && v252 != 0.0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v302.__val_ = 302LL;
    v302.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v302);
    goto LABEL_394;
  }

  if (v251 < v252)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v302.__val_ = 203LL;
    v302.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v302);
    goto LABEL_394;
  }

  while (v246 != v245)
  {
    sub_10000AAF8(v246);
    v246 += 3;
  }

  if (*(_DWORD *)(v75 + 8) == 3)
  {
    unint64_t v253 = *(void *)(v75 + 72);
    if (v253)
    {
      int64_t v254 = *(unsigned int *)(v75 + 84);
      if (*(_BYTE *)(v75 + 80) == 15) {
        unint64_t v255 = -45LL;
      }
      else {
        unint64_t v255 = 0LL;
      }
      sub_10000AC14(&v302, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v75 + 48) - *(void *)(v75 + 40)) >> 3));
      uint64_t v75 = a1;
      if ((uint64_t)v255 < v254)
      {
        uint64_t v257 = *(void *)(a1 + 40);
        uint64_t v256 = *(void *)(a1 + 48);
        v258 = sub_10000ACA4;
        uint64_t v259 = v256;
        unint64_t v299 = v254;
        do
        {
          v255 += 256LL;
          if (v259 == v257)
          {
            uint64_t v259 = v257;
          }

          else
          {
            unint64_t v260 = 0LL;
            uint64_t v261 = *(void *)&v302.__val_;
            do
            {
              unint64_t v262 = *(void *)(v261 + 8 * v260);
              uint64_t v263 = *(void *)(v257 + 24 * v260);
              uint64_t v264 = *(void *)(v257 + 24 * v260 + 8) - v263;
              if (v262 >= v264 >> 3)
              {
                uint64_t v266 = *(void *)(v261 + 8 * v260);
              }

              else
              {
                uint64_t v265 = v264 >> 3;
                uint64_t v266 = *(void *)(v261 + 8 * v260);
                v267 = (unsigned int *)(v263 + 8 * v262);
                while (1)
                {
                  unsigned int v268 = *v267;
                  v267 += 2;
                  if (v255 <= v268) {
                    break;
                  }
                  if (v265 == ++v266)
                  {
                    uint64_t v266 = v265;
                    break;
                  }
                }
              }

              if (v253 < v266 - v262)
              {
                uint64_t v269 = v263 + 8 * v262;
                v270 = (uint64_t *)(v263 + 8 * v266);
                *(void *)&v309.__val_ = v258;
                unint64_t v271 = 126 - 2 * __clz(((uint64_t)v270 - v269) >> 3);
                if (v266 == v262) {
                  uint64_t v272 = 0LL;
                }
                else {
                  uint64_t v272 = v271;
                }
                sub_10000ACCC(v269, v270, (uint64_t (**)(uint64_t *, uint64_t *))&v309, v272, 1);
                uint64_t v273 = *(void *)(*v300 + 24 * v260);
                unint64_t v274 = v262 + v253;
                if (v262 + v253 != v266)
                {
                  v275 = v258;
                  uint64_t v276 = v273 + 8 * v274;
                  v277 = (_BYTE *)(v273 + 8 * v266);
                  uint64_t v278 = *v300 + 24 * v260;
                  v280 = *(_BYTE **)(v278 + 8);
                  v279 = (void *)(v278 + 8);
                  size_t v281 = v280 - v277;
                  if (v280 != v277)
                  {
                    memmove((void *)(v273 + 8 * v274), v277, v281);
                    uint64_t v273 = *(void *)(*v300 + 24 * v260);
                  }

                  void *v279 = v276 + v281;
                  uint64_t v75 = a1;
                  v258 = v275;
                }

                sub_10000B47C( v273 + 8 * v262,  (unsigned int *)(v273 + 8 * v274),  126 - 2 * __clz((uint64_t)(8 * v274 - 8 * v262) >> 3),  1);
                uint64_t v261 = *(void *)&v302.__val_;
                uint64_t v266 = v262 + v253;
                uint64_t v257 = *(void *)(v75 + 40);
                uint64_t v256 = *(void *)(v75 + 48);
              }

              *(void *)(v261 + 8 * v260++) = v266;
              uint64_t v259 = v256;
            }

            while (v260 < 0xAAAAAAAAAAAAAAABLL * ((v256 - v257) >> 3));
          }
        }

        while (v255 < v299);
      }

      if (*(void *)&v302.__val_)
      {
        v302.__cat_ = *(const std::error_category **)&v302.__val_;
        operator delete(*(void **)&v302.__val_);
      }
    }
  }

  return v75;
}

void sub_10000A74C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t *a11, uint64_t a12, uint64_t *a13, const std::error_code a14, uint64_t *a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  int v21 = v19;
  __cxa_free_exception(v21);
  if (a2 == 2)
  {
    unsigned int v23 = (const std::error_code *)__cxa_begin_catch(a1);
    a15 = 0LL;
    a16 = 0LL;
    a17 = 0LL;
    sub_10000A9F8(a11);
    sub_10000AA28(a13);
    exception = __cxa_allocate_exception(0x20uLL);
    sub_10000EED4((uint64_t)exception, v23 + 1, (const void **)&a15);
  }

  if (a2 == 1)
  {
    unint64_t v25 = __cxa_begin_catch(a1);
    unsigned int v26 = (char *)(*(uint64_t (**)(void *))(*(void *)v25 + 16LL))(v25);
    sub_10000606C(&a15, v26);
    sub_10000A9F8(a11);
    sub_10000AA28(a13);
    int v27 = __cxa_allocate_exception(0x20uLL);
    *(void *)&a14.__val_ = 100LL;
    a14.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000EED4((uint64_t)v27, &a14, (const void **)&a15);
  }

  a15 = a13;
  sub_10000AA7C((void ***)&a15);
  _Unwind_Resume(a1);
}

void sub_10000A990( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  __cxa_end_catch();
  __p = a13;
  sub_10000AA7C((void ***)&__p);
  _Unwind_Resume(a1);
}

void sub_10000A9C4()
{
}

void sub_10000A9F8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    unint64_t v3 = (void *)sub_100008224(v2);
    operator delete(v3);
  }

  *a1 = 0LL;
}

void sub_10000AA28(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      int v6 = *(void **)(v4 - 24);
      v4 -= 24LL;
      std::string v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }

      uint64_t v2 = v4;
    }

    while (v4 != v3);
  }

  a1[1] = v3;
}

void sub_10000AA7C(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_10000AA28((uint64_t *)v2);
    operator delete(**a1);
  }

uint64_t sub_10000AABC(uint64_t a1)
{
  uint64_t v3 = (void **)(a1 + 40);
  sub_10000AA7C(&v3);
  return a1;
}

uint64_t *sub_10000AAF8(uint64_t *result)
{
  uint64_t v1 = *result;
  uint64_t v2 = (unsigned __int16 *)result[1];
  if ((unint64_t)v2 - *result >= 9)
  {
    uint64_t v3 = result;
    unint64_t v4 = 1LL;
    do
    {
      std::string v5 = (unsigned __int16 *)(v1 + 8 * v4);
      unint64_t v6 = v4 - 1;
      unsigned int v7 = *(_DWORD *)(v1 + 8 * (v4 - 1));
      if (v7 == *(_DWORD *)v5
        && (uint64_t v8 = v1 + 8 * v6, *(unsigned __int16 *)(v8 + 4) == v5[2])
        && *(unsigned __int16 *)(v8 + 6) == *(unsigned __int16 *)(v1 + 8 * v4 + 6))
      {
        uint64_t v9 = v5 - 4;
        int64_t v10 = (char *)v2 - (char *)v5;
        if (v2 != v5)
        {
          result = (uint64_t *)memmove(v5 - 4, v5, (char *)v2 - (char *)v5);
          uint64_t v1 = *v3;
        }

        uint64_t v2 = (unsigned __int16 *)((char *)v9 + v10);
        v3[1] = (uint64_t)v9 + v10;
        unint64_t v4 = v6;
      }

      else if (*(_DWORD *)v5 < v7)
      {
        exception = __cxa_allocate_exception(0x20uLL);
        *(void *)&v12.__val_ = 200LL;
        v12.__cat_ = (const std::error_category *)&off_10003CB28;
        sub_10000F0DC((uint64_t)exception, &v12);
      }

      ++v4;
    }

    while (v4 < ((uint64_t)v2 - v1) >> 3);
  }

  return result;
}

void sub_10000AC00(_Unwind_Exception *a1)
{
}

void *sub_10000AC14(void *a1, unint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    if (a2 >> 61) {
      sub_100006118();
    }
    uint64_t v4 = 8 * a2;
    std::string v5 = (char *)operator new(8 * a2);
    *a1 = v5;
    a1[2] = &v5[8 * a2];
    bzero(v5, 8 * a2);
    a1[1] = &v5[v4];
  }

  return a1;
}

void sub_10000AC88(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::ostream::~ostream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

BOOL sub_10000ACA4(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int16 *)(a1 + 6);
  unsigned int v3 = *(unsigned __int16 *)(a2 + 6);
  BOOL v4 = v2 == v3;
  BOOL v5 = v2 > v3;
  if (v4) {
    return *(unsigned __int16 *)(a1 + 4) > *(unsigned __int16 *)(a2 + 4);
  }
  else {
    return v5;
  }
}

uint64_t sub_10000ACCC( uint64_t result, uint64_t *a2, uint64_t (**a3)(uint64_t *, uint64_t *), uint64_t a4, char a5)
{
  uint64_t v9 = (uint64_t *)result;
LABEL_2:
  uint64_t v63 = a2;
  unint64_t v64 = a2 - 1;
  unint64_t v61 = a2 - 3;
  v62 = a2 - 2;
  int64_t v10 = v9;
  while (2)
  {
    uint64_t v9 = v10;
    uint64_t v11 = (char *)a2 - (char *)v10;
    unint64_t v12 = a2 - v10;
    switch(v12)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        result = (*a3)(v64, v10);
        if ((_DWORD)result)
        {
          uint64_t v26 = *v10;
          uint64_t *v10 = *v64;
          *unint64_t v64 = v26;
        }

        return result;
      case 3uLL:
        return sub_10000C1FC(v10, v10 + 1, v64, a3);
      case 4uLL:
        return sub_10000C2DC(v10, v10 + 1, v10 + 2, v64, a3);
      case 5uLL:
        return sub_10000C38C(v10, v10 + 1, v10 + 2, v10 + 3, v64, a3);
      default:
        if (v11 <= 191)
        {
          int v27 = v10 + 1;
          BOOL v29 = v10 == a2 || v27 == a2;
          if ((a5 & 1) != 0)
          {
            if (!v29)
            {
              uint64_t v30 = 0LL;
              float v31 = v10;
              do
              {
                BOOL v32 = v31;
                float v31 = v27;
                result = (*a3)(v27, v32);
                if ((_DWORD)result)
                {
                  uint64_t v67 = *v31;
                  uint64_t v33 = v30;
                  while (1)
                  {
                    *(uint64_t *)((char *)v10 + v33 + std::ostream::~ostream(v2, v3 + 8) = *(uint64_t *)((char *)v10 + v33);
                    if (!v33) {
                      break;
                    }
                    v33 -= 8LL;
                    result = (*a3)(&v67, (uint64_t *)((char *)v10 + v33));
                    if ((result & 1) == 0)
                    {
                      BOOL v34 = (uint64_t *)((char *)v10 + v33 + 8);
                      goto LABEL_72;
                    }
                  }

                  BOOL v34 = v10;
LABEL_72:
                  uint64_t *v34 = v67;
                  a2 = v63;
                }

                int v27 = v31 + 1;
                v30 += 8LL;
              }

              while (v31 + 1 != a2);
            }
          }

          else if (!v29)
          {
            do
            {
              uint64_t v57 = v9;
              uint64_t v9 = v27;
              result = (*a3)(v27, v57);
              if ((_DWORD)result)
              {
                uint64_t v67 = *v9;
                int v58 = v9;
                do
                {
                  uint64_t v59 = v58;
                  uint64_t v60 = *--v58;
                  uint64_t *v59 = v60;
                  result = (*a3)(&v67, v59 - 2);
                }

                while ((result & 1) != 0);
                *int v58 = v67;
              }

              int v27 = v9 + 1;
            }

            while (v9 + 1 != a2);
          }

          return result;
        }

        if (!a4)
        {
          if (v10 != a2)
          {
            int64_t v35 = (v12 - 2) >> 1;
            int64_t v65 = v35;
            do
            {
              int64_t v36 = v35;
              if (v65 >= v35)
              {
                uint64_t v37 = (2 * v35) | 1;
                size_t v38 = &v9[v37];
                if (2 * v35 + 2 < (uint64_t)v12 && (*a3)(&v9[v37], v38 + 1))
                {
                  ++v38;
                  uint64_t v37 = 2 * v36 + 2;
                }

                uint64_t v39 = &v9[v36];
                result = (*a3)(v38, v39);
                if ((result & 1) == 0)
                {
                  uint64_t v67 = *v39;
                  do
                  {
                    uint64_t v40 = v38;
                    *uint64_t v39 = *v38;
                    if (v65 < v37) {
                      break;
                    }
                    uint64_t v41 = (2 * v37) | 1;
                    size_t v38 = &v9[v41];
                    uint64_t v42 = 2 * v37 + 2;
                    if (v42 < (uint64_t)v12 && (*a3)(&v9[v41], v38 + 1))
                    {
                      ++v38;
                      uint64_t v41 = v42;
                    }

                    result = (*a3)(v38, &v67);
                    uint64_t v39 = v40;
                    uint64_t v37 = v41;
                  }

                  while (!(_DWORD)result);
                  *uint64_t v40 = v67;
                }
              }

              int64_t v35 = v36 - 1;
            }

            while (v36);
            uint64_t v43 = (unint64_t)v11 >> 3;
            uint64_t v44 = v63;
            do
            {
              uint64_t v45 = 0LL;
              uint64_t v66 = *v9;
              uint64_t v46 = v9;
              do
              {
                v47 = &v46[v45 + 1];
                uint64_t v48 = (2 * v45) | 1;
                uint64_t v49 = 2 * v45 + 2;
                if (v49 < v43)
                {
                  result = (*a3)(&v46[v45 + 1], &v46[v45 + 2]);
                  if ((_DWORD)result)
                  {
                    ++v47;
                    uint64_t v48 = v49;
                  }
                }

                *uint64_t v46 = *v47;
                uint64_t v46 = v47;
                uint64_t v45 = v48;
              }

              while (v48 <= (uint64_t)((unint64_t)(v43 - 2) >> 1));
              v50 = v44 - 1;
              if (v47 == v50)
              {
                v51 = v50;
                uint64_t *v47 = v66;
              }

              else
              {
                uint64_t *v47 = *v50;
                v51 = v50;
                uint64_t *v50 = v66;
                uint64_t v52 = (char *)v47 - (char *)v9 + 8;
                if (v52 >= 9)
                {
                  unint64_t v53 = (unint64_t)((v52 >> 3) - 2) >> 1;
                  unint64_t v54 = &v9[v53];
                  result = (*a3)(v54, v47);
                  if ((_DWORD)result)
                  {
                    uint64_t v67 = *v47;
                    do
                    {
                      uint64_t v55 = v54;
                      uint64_t *v47 = *v54;
                      if (!v53) {
                        break;
                      }
                      unint64_t v53 = (v53 - 1) >> 1;
                      unint64_t v54 = &v9[v53];
                      result = (*a3)(v54, &v67);
                      v47 = v55;
                    }

                    while ((result & 1) != 0);
                    uint64_t *v55 = v67;
                  }
                }
              }

              BOOL v56 = v43-- <= 2;
              uint64_t v44 = v51;
            }

            while (!v56);
          }

          return result;
        }

        int v13 = &v10[v12 >> 1];
        if ((unint64_t)v11 < 0x401)
        {
          sub_10000C1FC(&v10[v12 >> 1], v10, v64, a3);
        }

        else
        {
          sub_10000C1FC(v10, &v10[v12 >> 1], v64, a3);
          sub_10000C1FC(v10 + 1, v13 - 1, v62, a3);
          sub_10000C1FC(v10 + 2, &v10[(v12 >> 1) + 1], v61, a3);
          sub_10000C1FC(v13 - 1, &v10[v12 >> 1], &v10[(v12 >> 1) + 1], a3);
          uint64_t v14 = *v10;
          uint64_t *v10 = *v13;
          uint64_t *v13 = v14;
        }

        --a4;
        a2 = v63;
        if ((a5 & 1) == 0 && ((*a3)(v10 - 1, v10) & 1) == 0)
        {
          uint64_t v67 = *v10;
          result = (*a3)(&v67, v64);
          if ((result & 1) != 0)
          {
            do
              result = (*a3)(&v67, ++v10);
            while ((result & 1) == 0);
          }

          else
          {
            unsigned int v22 = v10 + 1;
            do
            {
              int64_t v10 = v22;
              if (v22 >= v63) {
                break;
              }
              result = (*a3)(&v67, v22);
              unsigned int v22 = v10 + 1;
            }

            while (!(_DWORD)result);
          }

          unsigned int v23 = v63;
          if (v10 < v63)
          {
            unsigned int v23 = v63;
            do
              result = (*a3)(&v67, --v23);
            while ((result & 1) != 0);
          }

          while (v10 < v23)
          {
            uint64_t v24 = *v10;
            uint64_t *v10 = *v23;
            *unsigned int v23 = v24;
            do
              ++v10;
            while (!(*a3)(&v67, v10));
            do
              result = (*a3)(&v67, --v23);
            while ((result & 1) != 0);
          }

          unint64_t v25 = v10 - 1;
          if (v10 - 1 != v9) {
            *uint64_t v9 = *v25;
          }
          a5 = 0;
          uint64_t *v25 = v67;
          continue;
        }

        uint64_t v67 = *v10;
        uint64_t v15 = v10;
        do
          int v16 = v15++;
        while (((*a3)(v15, &v67) & 1) != 0);
        unsigned int v17 = v63;
        if (v16 == v10)
        {
          unsigned int v17 = v63;
          do
          {
            if (v15 >= v17) {
              break;
            }
            --v17;
          }

          while (((*a3)(v17, &v67) & 1) == 0);
        }

        else
        {
          do
            --v17;
          while (!(*a3)(v17, &v67));
        }

        if (v15 < v17)
        {
          unsigned int v18 = v15;
          int v19 = v17;
          do
          {
            uint64_t v20 = *v18;
            *unsigned int v18 = *v19;
            uint64_t *v19 = v20;
            do
              int v16 = v18++;
            while (((*a3)(v18, &v67) & 1) != 0);
            do
              --v19;
            while (!(*a3)(v19, &v67));
          }

          while (v18 < v19);
        }

        if (v16 != v9) {
          *uint64_t v9 = *v16;
        }
        uint64_t *v16 = v67;
        if (v15 < v17)
        {
LABEL_30:
          result = sub_10000ACCC(v9, v16, a3, a4, a5 & 1);
          a5 = 0;
          int64_t v10 = v16 + 1;
          continue;
        }

        BOOL v21 = sub_10000C464(v9, v16, a3);
        int64_t v10 = v16 + 1;
        result = sub_10000C464(v16 + 1, v63, a3);
        if (!(_DWORD)result)
        {
          if (v21) {
            continue;
          }
          goto LABEL_30;
        }

        a2 = v16;
        if (!v21) {
          goto LABEL_2;
        }
        return result;
    }
  }

uint64_t sub_10000B47C(uint64_t result, unsigned int *a2, uint64_t a3, char a4)
{
  uint64_t v7 = result;
LABEL_2:
  uint64_t v8 = (uint64_t *)(a2 - 2);
  unint64_t v9 = v7;
  while (2)
  {
    uint64_t v7 = v9;
    uint64_t v10 = (uint64_t)a2 - v9;
    unint64_t v11 = (uint64_t)((uint64_t)a2 - v9) >> 3;
    switch(v11)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        unsigned int v56 = *(a2 - 2);
        BOOL v60 = v56 == *(_DWORD *)v9;
        BOOL v57 = v56 < *(_DWORD *)v9;
        if (v60) {
          BOOL v57 = *((unsigned __int16 *)a2 - 2) < *(unsigned __int16 *)(v9 + 4);
        }
        if (v57)
        {
          uint64_t v58 = *(void *)v9;
          *(void *)unint64_t v9 = *v8;
          *uint64_t v8 = v58;
        }

        return result;
      case 3uLL:
        return (uint64_t)sub_10000BD34((uint64_t *)v9, (unsigned int *)(v9 + 8), (uint64_t *)a2 - 1);
      case 4uLL:
        return (uint64_t)sub_10000BE24(v9, (uint64_t *)(v9 + 8), (uint64_t *)(v9 + 16), (uint64_t *)a2 - 1);
      case 5uLL:
        return (uint64_t)sub_10000BF0C(v9, v9 + 8, v9 + 16, v9 + 24, (uint64_t)(a2 - 2));
      default:
        if (v10 <= 191)
        {
          uint64_t v59 = (unsigned int *)(v9 + 8);
          BOOL v60 = (unsigned int *)v9 == a2 || v59 == a2;
          char v61 = v60;
          if ((a4 & 1) != 0)
          {
            if ((v61 & 1) == 0)
            {
              uint64_t v62 = 0LL;
              uint64_t v63 = (void *)v9;
              do
              {
                unsigned int v64 = *((_DWORD *)v63 + 2);
                unsigned int v65 = *(_DWORD *)v63;
                unsigned int v66 = *((unsigned __int16 *)v63 + 6);
                unsigned int v67 = *((unsigned __int16 *)v63 + 2);
                uint64_t v63 = v59;
                BOOL v68 = v66 < v67;
                BOOL v60 = v64 == v65;
                BOOL v69 = v64 < v65;
                if (!v60) {
                  BOOL v68 = v69;
                }
                if (v68)
                {
                  uint64_t v70 = *v63;
                  uint64_t v71 = v62;
                  while (1)
                  {
                    uint64_t v72 = v9 + v71;
                    *(void *)(v9 + v71 + std::ostream::~ostream(v2, v3 + 8) = *(void *)(v9 + v71);
                    if (!v71) {
                      break;
                    }
                    unsigned int v73 = *(_DWORD *)(v72 - 8);
                    BOOL v74 = *(unsigned __int16 *)(v72 - 4) > WORD2(v70);
                    if (v73 != (_DWORD)v70) {
                      BOOL v74 = v73 > v70;
                    }
                    v71 -= 8LL;
                    if (!v74)
                    {
                      uint64_t v75 = (void *)(v9 + v71 + 8);
                      goto LABEL_103;
                    }
                  }

                  uint64_t v75 = (void *)v9;
LABEL_103:
                  *uint64_t v75 = v70;
                }

                uint64_t v59 = (unsigned int *)(v63 + 1);
                v62 += 8LL;
              }

              while (v63 + 1 != (void *)a2);
            }
          }

          else if ((v61 & 1) == 0)
          {
            do
            {
              unsigned int v110 = *(_DWORD *)(v7 + 8);
              unsigned int v111 = *(_DWORD *)v7;
              unsigned int v112 = *(unsigned __int16 *)(v7 + 12);
              unsigned int v113 = *(unsigned __int16 *)(v7 + 4);
              uint64_t v7 = (uint64_t)v59;
              BOOL v60 = v110 == v111;
              BOOL v114 = v110 < v111;
              if (v60) {
                BOOL v114 = v112 < v113;
              }
              if (v114)
              {
                uint64_t v115 = *(void *)v59;
                v116 = v59;
                do
                {
                  uint64_t v117 = v116;
                  uint64_t v118 = *((void *)v116 - 1);
                  v116 -= 2;
                  *(void *)uint64_t v117 = v118;
                  unsigned int v119 = *(v117 - 4);
                  BOOL v120 = *((unsigned __int16 *)v117 - 6) > WORD2(v115);
                  if (v119 != (_DWORD)v115) {
                    BOOL v120 = v119 > v115;
                  }
                }

                while (v120);
                *(void *)v116 = v115;
              }

              uint64_t v59 = (unsigned int *)(v7 + 8);
            }

            while ((unsigned int *)(v7 + 8) != a2);
          }

          return result;
        }

        if (!a3)
        {
          if ((unsigned int *)v9 != a2)
          {
            int64_t v76 = (v11 - 2) >> 1;
            int64_t v77 = v76;
            do
            {
              int64_t v78 = v77;
              if (v76 >= v77)
              {
                uint64_t v79 = (2 * v77) | 1;
                unint64_t v80 = v9 + 8 * v79;
                if (2 * v78 + 2 >= (uint64_t)v11)
                {
                  unsigned int v81 = *(_DWORD *)v80;
                }

                else
                {
                  unsigned int v81 = *(_DWORD *)(v80 + 8);
                  BOOL v82 = *(unsigned __int16 *)(v80 + 4) < *(unsigned __int16 *)(v80 + 12);
                  if (*(_DWORD *)v80 != v81) {
                    BOOL v82 = *(_DWORD *)v80 < v81;
                  }
                  if (v82)
                  {
                    v80 += 8LL;
                    uint64_t v79 = 2 * v78 + 2;
                  }

                  else
                  {
                    unsigned int v81 = *(_DWORD *)v80;
                  }
                }

                unint64_t v83 = v9 + 8 * v78;
                result = *(unsigned __int16 *)(v83 + 4);
                BOOL v60 = v81 == *(_DWORD *)v83;
                BOOL v84 = v81 < *(_DWORD *)v83;
                if (v60) {
                  BOOL v84 = *(unsigned __int16 *)(v80 + 4) < result;
                }
                if (!v84)
                {
                  uint64_t v85 = *(void *)v83;
                  do
                  {
                    unint64_t v86 = (void *)v83;
                    unint64_t v83 = v80;
                    *unint64_t v86 = *(void *)v80;
                    if (v76 < v79) {
                      break;
                    }
                    uint64_t v87 = (2 * v79) | 1;
                    unint64_t v80 = v9 + 8 * v87;
                    uint64_t v79 = 2 * v79 + 2;
                    if (v79 >= (uint64_t)v11)
                    {
                      unsigned int v88 = *(_DWORD *)v80;
                      uint64_t v79 = v87;
                    }

                    else
                    {
                      unsigned int v88 = *(_DWORD *)(v80 + 8);
                      BOOL v89 = *(unsigned __int16 *)(v80 + 4) < *(unsigned __int16 *)(v80 + 12);
                      if (*(_DWORD *)v80 != v88) {
                        BOOL v89 = *(_DWORD *)v80 < v88;
                      }
                      if (v89)
                      {
                        v80 += 8LL;
                      }

                      else
                      {
                        unsigned int v88 = *(_DWORD *)v80;
                        uint64_t v79 = v87;
                      }
                    }

                    result = *(unsigned __int16 *)(v80 + 4);
                    BOOL v90 = result < WORD2(v85);
                    BOOL v60 = v88 == (_DWORD)v85;
                    BOOL v91 = v88 < v85;
                    if (!v60) {
                      BOOL v90 = v91;
                    }
                  }

                  while (!v90);
                  *(void *)unint64_t v83 = v85;
                }
              }

              int64_t v77 = v78 - 1;
            }

            while (v78);
            uint64_t v92 = (unint64_t)v10 >> 3;
            do
            {
              uint64_t v93 = 0LL;
              uint64_t v94 = *(void *)v9;
              uint64_t v95 = v92 - 2;
              if (v92 < 2) {
                uint64_t v95 = v92 - 1;
              }
              uint64_t v96 = v95 >> 1;
              uint64_t v97 = (void *)v9;
              do
              {
                v98 = &v97[v93 + 1];
                uint64_t v99 = (2 * v93) | 1;
                uint64_t v100 = 2 * v93 + 2;
                if (v100 < v92)
                {
                  result = *((unsigned int *)v98 + 2);
                  BOOL v101 = *(_DWORD *)v98 < result;
                  if (*(_DWORD *)v98 == (_DWORD)result) {
                    BOOL v101 = *((unsigned __int16 *)v98 + 2) < *((unsigned __int16 *)v98 + 6);
                  }
                  if (v101)
                  {
                    ++v98;
                    uint64_t v99 = v100;
                  }
                }

                *uint64_t v97 = *v98;
                uint64_t v97 = v98;
                uint64_t v93 = v99;
              }

              while (v99 <= v96);
              a2 -= 2;
              if (v98 == (void *)a2)
              {
                void *v98 = v94;
              }

              else
              {
                void *v98 = *(void *)a2;
                *(void *)a2 = v94;
                uint64_t v102 = (uint64_t)v98 - v9 + 8;
                if (v102 >= 9)
                {
                  unint64_t v103 = (unint64_t)((v102 >> 3) - 2) >> 1;
                  unint64_t v104 = v9 + 8 * v103;
                  BOOL v105 = *(_DWORD *)v104 < *(_DWORD *)v98;
                  if (*(_DWORD *)v104 == *(_DWORD *)v98) {
                    BOOL v105 = *(unsigned __int16 *)(v104 + 4) < *((unsigned __int16 *)v98 + 2);
                  }
                  if (v105)
                  {
                    uint64_t v106 = *v98;
                    do
                    {
                      v107 = v98;
                      v98 = (void *)v104;
                      void *v107 = *(void *)v104;
                      if (!v103) {
                        break;
                      }
                      unint64_t v103 = (v103 - 1) >> 1;
                      unint64_t v104 = v9 + 8 * v103;
                      BOOL v108 = *(unsigned __int16 *)(v104 + 4) < WORD2(v106);
                      if (*(_DWORD *)v104 != (_DWORD)v106) {
                        BOOL v108 = *(_DWORD *)v104 < v106;
                      }
                    }

                    while (v108);
                    void *v98 = v106;
                  }
                }
              }
            }

            while (v92-- > 2);
          }

          return result;
        }

        unint64_t v12 = v11 >> 1;
        int v13 = (unsigned int *)(v9 + 8 * (v11 >> 1));
        if ((unint64_t)v10 < 0x401)
        {
          result = (uint64_t)sub_10000BD34((uint64_t *)(v7 + 8 * (v11 >> 1)), (unsigned int *)v7, (uint64_t *)a2 - 1);
        }

        else
        {
          sub_10000BD34((uint64_t *)v7, (unsigned int *)(v7 + 8 * (v11 >> 1)), (uint64_t *)a2 - 1);
          sub_10000BD34((uint64_t *)(v7 + 8), v13 - 2, (uint64_t *)a2 - 2);
          sub_10000BD34((uint64_t *)(v7 + 16), (unsigned int *)(v7 + 8 + 8 * v12), (uint64_t *)a2 - 3);
          result = (uint64_t)sub_10000BD34((uint64_t *)v13 - 1, v13, (uint64_t *)(v7 + 8 + 8 * v12));
          uint64_t v14 = *(void *)v7;
          *(void *)uint64_t v7 = *(void *)v13;
          *(void *)int v13 = v14;
        }

        --a3;
        if ((a4 & 1) == 0)
        {
          unsigned int v15 = *(_DWORD *)(v7 - 8);
          BOOL v60 = v15 == *(_DWORD *)v7;
          BOOL v16 = v15 < *(_DWORD *)v7;
          if (v60) {
            BOOL v16 = *(unsigned __int16 *)(v7 - 4) < *(unsigned __int16 *)(v7 + 4);
          }
          if (!v16)
          {
            uint64_t v36 = *(void *)v7;
            unsigned int v37 = (unsigned __int16)WORD2(*(void *)v7);
            unsigned int v38 = *(a2 - 2);
            BOOL v39 = *((unsigned __int16 *)a2 - 2) > v37;
            BOOL v60 = v38 == *(void *)v7;
            BOOL v40 = v38 > *(void *)v7;
            if (!v60) {
              BOOL v39 = v40;
            }
            if (v39)
            {
              unint64_t v9 = v7;
              do
              {
                unsigned int v41 = *(_DWORD *)(v9 + 8);
                v9 += 8LL;
                BOOL v42 = v41 > v36;
                if (v41 == (_DWORD)v36) {
                  BOOL v42 = *(unsigned __int16 *)(v9 + 4) > v37;
                }
              }

              while (!v42);
            }

            else
            {
              uint64_t v43 = (unsigned int *)(v7 + 8);
              do
              {
                unint64_t v9 = (unint64_t)v43;
                if (v43 >= a2) {
                  break;
                }
                unsigned int v44 = *v43;
                BOOL v45 = *(unsigned __int16 *)(v9 + 4) > v37;
                BOOL v60 = v44 == (_DWORD)v36;
                BOOL v46 = v44 > v36;
                if (!v60) {
                  BOOL v45 = v46;
                }
                uint64_t v43 = (unsigned int *)(v9 + 8);
              }

              while (!v45);
            }

            v47 = a2;
            if (v9 < (unint64_t)a2)
            {
              v47 = a2;
              do
              {
                unsigned int v48 = *((_DWORD *)v47-- - 2);
                BOOL v49 = v48 > v36;
                if (v48 == (_DWORD)v36) {
                  BOOL v49 = *((unsigned __int16 *)v47 + 2) > v37;
                }
              }

              while (v49);
            }

            while (v9 < (unint64_t)v47)
            {
              uint64_t v50 = *(void *)v9;
              *(void *)unint64_t v9 = *v47;
              void *v47 = v50;
              do
              {
                unsigned int v51 = *(_DWORD *)(v9 + 8);
                v9 += 8LL;
                BOOL v52 = v51 > v36;
                if (v51 == (_DWORD)v36) {
                  BOOL v52 = *(unsigned __int16 *)(v9 + 4) > v37;
                }
              }

              while (!v52);
              do
              {
                unsigned int v53 = *((_DWORD *)v47-- - 2);
                BOOL v54 = v53 > v36;
                if (v53 == (_DWORD)v36) {
                  BOOL v54 = *((unsigned __int16 *)v47 + 2) > v37;
                }
              }

              while (v54);
            }

            uint64_t v55 = (void *)(v9 - 8);
            if (v9 - 8 != v7) {
              *(void *)uint64_t v7 = *v55;
            }
            a4 = 0;
            void *v55 = v36;
            continue;
          }
        }

        uint64_t v17 = *(void *)v7;
        unsigned int v18 = (unsigned __int16)WORD2(*(void *)v7);
        unint64_t v19 = v7;
        do
        {
          uint64_t v20 = v19;
          unsigned int v21 = *(_DWORD *)(v19 + 8);
          v19 += 8LL;
          BOOL v22 = v21 < v17;
          if (v21 == (_DWORD)v17) {
            BOOL v22 = *(unsigned __int16 *)(v20 + 12) < v18;
          }
        }

        while (v22);
        unsigned int v23 = a2;
        if (v20 == v7)
        {
          unsigned int v23 = a2;
          do
          {
            unsigned int v26 = *(v23 - 2);
            v23 -= 2;
            BOOL v27 = v26 < v17;
            if (v26 == (_DWORD)v17) {
              BOOL v27 = *((unsigned __int16 *)v23 + 2) < v18;
            }
          }

          while (!v27);
        }

        else
        {
          do
          {
            unsigned int v24 = *(v23 - 2);
            v23 -= 2;
            BOOL v25 = v24 < v17;
            if (v24 == (_DWORD)v17) {
              BOOL v25 = *((unsigned __int16 *)v23 + 2) < v18;
            }
          }

          while (!v25);
        }

        if (v19 < (unint64_t)v23)
        {
          unint64_t v28 = v19;
          BOOL v29 = v23;
          do
          {
            uint64_t v30 = *(void *)v28;
            *(void *)unint64_t v28 = *(void *)v29;
            *(void *)BOOL v29 = v30;
            do
            {
              uint64_t v20 = v28;
              unsigned int v31 = *(_DWORD *)(v28 + 8);
              v28 += 8LL;
              BOOL v32 = v31 < v17;
              if (v31 == (_DWORD)v17) {
                BOOL v32 = *(unsigned __int16 *)(v20 + 12) < v18;
              }
            }

            while (v32);
            do
            {
              unsigned int v33 = *(v29 - 2);
              v29 -= 2;
              BOOL v34 = v33 < v17;
              if (v33 == (_DWORD)v17) {
                BOOL v34 = *((unsigned __int16 *)v29 + 2) < v18;
              }
            }

            while (!v34);
          }

          while (v28 < (unint64_t)v29);
        }

        if (v20 != v7) {
          *(void *)uint64_t v7 = *(void *)v20;
        }
        *(void *)uint64_t v20 = v17;
        if (v19 < (unint64_t)v23)
        {
LABEL_42:
          result = sub_10000B47C(v7, v20, a3, a4 & 1);
          a4 = 0;
          unint64_t v9 = v20 + 8;
          continue;
        }

        BOOL v35 = sub_10000C03C(v7, v20);
        unint64_t v9 = v20 + 8;
        result = sub_10000C03C(v20 + 8, (uint64_t)a2);
        if (!(_DWORD)result)
        {
          if (v35) {
            continue;
          }
          goto LABEL_42;
        }

        a2 = (unsigned int *)v20;
        if (!v35) {
          goto LABEL_2;
        }
        return result;
    }
  }

uint64_t *sub_10000BD34(uint64_t *result, unsigned int *a2, uint64_t *a3)
{
  unsigned int v3 = *a2;
  unsigned int v4 = *((unsigned __int16 *)a2 + 2);
  BOOL v5 = v4 < *((unsigned __int16 *)result + 2);
  if (*a2 != *(_DWORD *)result) {
    BOOL v5 = *a2 < *(_DWORD *)result;
  }
  BOOL v6 = *((unsigned __int16 *)a3 + 2) < v4;
  BOOL v7 = *(_DWORD *)a3 == v3;
  BOOL v8 = *(_DWORD *)a3 < v3;
  if (v7) {
    BOOL v9 = v6;
  }
  else {
    BOOL v9 = v8;
  }
  if (v5)
  {
    uint64_t v10 = *result;
    if (v9)
    {
      std::logic_error *result = *a3;
LABEL_18:
      *a3 = v10;
      return result;
    }

    std::logic_error *result = *(void *)a2;
    *(void *)a2 = v10;
    BOOL v14 = *(_DWORD *)a3 < v10;
    if (*(_DWORD *)a3 == (_DWORD)v10) {
      BOOL v14 = *((unsigned __int16 *)a3 + 2) < WORD2(v10);
    }
    if (v14)
    {
      *(void *)a2 = *a3;
      goto LABEL_18;
    }
  }

  else if (v9)
  {
    uint64_t v11 = *(void *)a2;
    *(void *)a2 = *a3;
    *a3 = v11;
    BOOL v12 = *a2 < *(_DWORD *)result;
    if (*a2 == *(_DWORD *)result) {
      BOOL v12 = *((unsigned __int16 *)a2 + 2) < *((unsigned __int16 *)result + 2);
    }
    if (v12)
    {
      uint64_t v13 = *result;
      std::logic_error *result = *(void *)a2;
      *(void *)a2 = v13;
    }
  }

  return result;
}

uint64_t *sub_10000BE24(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  result = sub_10000BD34((uint64_t *)a1, (unsigned int *)a2, a3);
  BOOL v9 = *(_DWORD *)a4 < *(_DWORD *)a3;
  if (*(_DWORD *)a4 == *(_DWORD *)a3) {
    BOOL v9 = *((unsigned __int16 *)a4 + 2) < *((unsigned __int16 *)a3 + 2);
  }
  if (v9)
  {
    uint64_t v10 = *a3;
    *a3 = *a4;
    *a4 = v10;
    BOOL v11 = *(_DWORD *)a3 < *(_DWORD *)a2;
    if (*(_DWORD *)a3 == *(_DWORD *)a2) {
      BOOL v11 = *((unsigned __int16 *)a3 + 2) < *((unsigned __int16 *)a2 + 2);
    }
    if (v11)
    {
      uint64_t v12 = *a2;
      *a2 = *a3;
      *a3 = v12;
      BOOL v13 = *(_DWORD *)a2 < *(_DWORD *)a1;
      if (*(_DWORD *)a2 == *(_DWORD *)a1) {
        BOOL v13 = *((unsigned __int16 *)a2 + 2) < *(unsigned __int16 *)(a1 + 4);
      }
      if (v13)
      {
        uint64_t v14 = *(void *)a1;
        *(void *)a1 = *a2;
        *a2 = v14;
      }
    }
  }

  return result;
}

uint64_t *sub_10000BF0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  result = sub_10000BE24(a1, (uint64_t *)a2, (uint64_t *)a3, (uint64_t *)a4);
  BOOL v11 = *(_DWORD *)a5 < *(_DWORD *)a4;
  if (*(_DWORD *)a5 == *(_DWORD *)a4) {
    BOOL v11 = *(unsigned __int16 *)(a5 + 4) < *(unsigned __int16 *)(a4 + 4);
  }
  if (v11)
  {
    uint64_t v12 = *(void *)a4;
    *(void *)a4 = *(void *)a5;
    *(void *)a5 = v12;
    BOOL v13 = *(_DWORD *)a4 < *(_DWORD *)a3;
    if (*(_DWORD *)a4 == *(_DWORD *)a3) {
      BOOL v13 = *(unsigned __int16 *)(a4 + 4) < *(unsigned __int16 *)(a3 + 4);
    }
    if (v13)
    {
      uint64_t v14 = *(void *)a3;
      *(void *)a3 = *(void *)a4;
      *(void *)a4 = v14;
      BOOL v15 = *(_DWORD *)a3 < *(_DWORD *)a2;
      if (*(_DWORD *)a3 == *(_DWORD *)a2) {
        BOOL v15 = *(unsigned __int16 *)(a3 + 4) < *(unsigned __int16 *)(a2 + 4);
      }
      if (v15)
      {
        uint64_t v16 = *(void *)a2;
        *(void *)a2 = *(void *)a3;
        *(void *)a3 = v16;
        BOOL v17 = *(_DWORD *)a2 < *(_DWORD *)a1;
        if (*(_DWORD *)a2 == *(_DWORD *)a1) {
          BOOL v17 = *(unsigned __int16 *)(a2 + 4) < *(unsigned __int16 *)(a1 + 4);
        }
        if (v17)
        {
          uint64_t v18 = *(void *)a1;
          *(void *)a1 = *(void *)a2;
          *(void *)a2 = v18;
        }
      }
    }
  }

  return result;
}

BOOL sub_10000C03C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1LL;
  switch(v4)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      unsigned int v6 = *(_DWORD *)(a2 - 8);
      BOOL v7 = v6 == *(_DWORD *)a1;
      BOOL v8 = v6 < *(_DWORD *)a1;
      if (v7) {
        BOOL v8 = *(unsigned __int16 *)(a2 - 4) < *(unsigned __int16 *)(a1 + 4);
      }
      if (v8)
      {
        uint64_t v9 = *(void *)a1;
        *(void *)a1 = *(void *)(a2 - 8);
        *(void *)(a2 - std::ostream::~ostream(v2, v3 + 8) = v9;
      }

      return result;
    case 3LL:
      sub_10000BD34((uint64_t *)a1, (unsigned int *)(a1 + 8), (uint64_t *)(a2 - 8));
      return 1LL;
    case 4LL:
      sub_10000BE24(a1, (uint64_t *)(a1 + 8), (uint64_t *)(a1 + 16), (uint64_t *)(a2 - 8));
      return 1LL;
    case 5LL:
      sub_10000BF0C(a1, a1 + 8, a1 + 16, a1 + 24, a2 - 8);
      return 1LL;
    default:
      uint64_t v10 = a1 + 16;
      sub_10000BD34((uint64_t *)a1, (unsigned int *)(a1 + 8), (uint64_t *)(a1 + 16));
      uint64_t v11 = a1 + 24;
      if (a1 + 24 == a2) {
        return 1LL;
      }
      uint64_t v12 = 0LL;
      int v13 = 0;
      break;
  }

  while (1)
  {
    BOOL v14 = *(_DWORD *)v11 < *(_DWORD *)v10;
    if (*(_DWORD *)v11 == *(_DWORD *)v10) {
      BOOL v14 = *(unsigned __int16 *)(v11 + 4) < *(unsigned __int16 *)(v10 + 4);
    }
    if (v14)
    {
      uint64_t v15 = *(void *)v11;
      uint64_t v16 = v12;
      while (1)
      {
        uint64_t v17 = a1 + v16;
        *(void *)(a1 + v16 + 24) = *(void *)(a1 + v16 + 16);
        if (v16 == -16) {
          break;
        }
        unsigned int v18 = *(_DWORD *)(v17 + 8);
        BOOL v19 = *(unsigned __int16 *)(v17 + 12) > WORD2(v15);
        if (v18 != (_DWORD)v15) {
          BOOL v19 = v18 > v15;
        }
        v16 -= 8LL;
        if (!v19)
        {
          uint64_t v20 = (void *)(a1 + v16 + 24);
          goto LABEL_18;
        }
      }

      uint64_t v20 = (void *)a1;
LABEL_18:
      *uint64_t v20 = v15;
      if (++v13 == 8) {
        return v11 + 8 == a2;
      }
    }

    uint64_t v10 = v11;
    v12 += 8LL;
    v11 += 8LL;
    if (v11 == a2) {
      return 1LL;
    }
  }

uint64_t sub_10000C1FC( uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t (**a4)(uint64_t *, uint64_t *))
{
  char v8 = (*a4)(a2, a1);
  uint64_t result = (*a4)(a3, a2);
  if ((v8 & 1) != 0)
  {
    uint64_t v10 = *a1;
    if ((_DWORD)result)
    {
      *a1 = *a3;
    }

    else
    {
      *a1 = *a2;
      *a2 = v10;
      uint64_t result = (*a4)(a3, a2);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v10 = *a2;
      *a2 = *a3;
    }

    *a3 = v10;
  }

  else if ((_DWORD)result)
  {
    uint64_t v11 = *a2;
    *a2 = *a3;
    *a3 = v11;
    uint64_t result = (*a4)(a2, a1);
    if ((_DWORD)result)
    {
      uint64_t v12 = *a1;
      *a1 = *a2;
      *a2 = v12;
    }
  }

  return result;
}

uint64_t sub_10000C2DC( uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t (**a5)(uint64_t *, uint64_t *))
{
  uint64_t result = (*a5)(a4, a3);
  if ((_DWORD)result)
  {
    uint64_t v11 = *a3;
    *a3 = *a4;
    *a4 = v11;
    uint64_t result = (*a5)(a3, a2);
    if ((_DWORD)result)
    {
      uint64_t v12 = *a2;
      *a2 = *a3;
      *a3 = v12;
      uint64_t result = (*a5)(a2, a1);
      if ((_DWORD)result)
      {
        uint64_t v13 = *a1;
        *a1 = *a2;
        *a2 = v13;
      }
    }
  }

  return result;
}

uint64_t sub_10000C38C( uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t (**a6)(uint64_t *, uint64_t *))
{
  uint64_t result = (*a6)(a5, a4);
  if ((_DWORD)result)
  {
    uint64_t v13 = *a4;
    *a4 = *a5;
    *a5 = v13;
    uint64_t result = (*a6)(a4, a3);
    if ((_DWORD)result)
    {
      uint64_t v14 = *a3;
      *a3 = *a4;
      *a4 = v14;
      uint64_t result = (*a6)(a3, a2);
      if ((_DWORD)result)
      {
        uint64_t v15 = *a2;
        *a2 = *a3;
        *a3 = v15;
        uint64_t result = (*a6)(a2, a1);
        if ((_DWORD)result)
        {
          uint64_t v16 = *a1;
          *a1 = *a2;
          *a2 = v16;
        }
      }
    }
  }

  return result;
}

BOOL sub_10000C464(uint64_t *a1, uint64_t *a2, uint64_t (**a3)(uint64_t *, uint64_t *))
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1LL;
  switch(v6)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      char v8 = a2 - 1;
      if ((*a3)(a2 - 1, a1))
      {
        uint64_t v9 = *a1;
        *a1 = *v8;
        *char v8 = v9;
      }

      return 1LL;
    case 3LL:
      sub_10000C1FC(a1, a1 + 1, a2 - 1, a3);
      return 1LL;
    case 4LL:
      sub_10000C2DC(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1LL;
    case 5LL:
      sub_10000C38C(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1LL;
    default:
      uint64_t v10 = a1 + 2;
      sub_10000C1FC(a1, a1 + 1, a1 + 2, a3);
      uint64_t v11 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1LL;
      }
      uint64_t v12 = 0LL;
      int v13 = 0;
      break;
  }

  while (1)
  {
    if ((*a3)(v11, v10))
    {
      uint64_t v17 = *v11;
      uint64_t v14 = v12;
      while (1)
      {
        uint64_t v15 = (uint64_t *)((char *)a1 + v14);
        *(uint64_t *)((char *)a1 + v14 + 24) = *(uint64_t *)((char *)a1 + v14 + 16);
        if (v14 == -16) {
          break;
        }
        v14 -= 8LL;
        if (((*a3)(&v17, v15 + 1) & 1) == 0)
        {
          uint64_t v16 = (uint64_t *)((char *)a1 + v14 + 24);
          goto LABEL_12;
        }
      }

      uint64_t v16 = a1;
LABEL_12:
      uint64_t *v16 = v17;
      if (++v13 == 8) {
        return v11 + 1 == a2;
      }
    }

    uint64_t v10 = v11;
    v12 += 8LL;
    if (++v11 == a2) {
      return 1LL;
    }
  }

void *sub_10000C61C(unint64_t a1)
{
  if (a1 >> 61) {
    sub_10000612C();
  }
  return operator new(8 * a1);
}

double sub_10000C650(uint64_t a1)
{
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 4std::ostream::~ostream(v2, v3 + 8) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  *(_BYTE *)(a1 + 64) = 1;
  *(void *)a1 = 0LL;
  *(_DWORD *)(a1 + std::ostream::~ostream(v2, v3 + 8) = 0;
  *(void *)(a1 + 2std::ostream::~ostream(v2, v3 + 8) = 0LL;
  *(void *)(a1 + 20) = 0LL;
  double result = -3.12151834e283;
  *(void *)(a1 + 12) = 0xFACADE990BE5E519LL;
  *(_BYTE *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = 1;
  *(_DWORD *)(a1 + 84) = 0;
  *(_BYTE *)(a1 + 80) = 0;
  *(void *)(a1 + 72) = 0LL;
  *(_DWORD *)(a1 + 36) = 252706816;
  return result;
}

void *sub_10000C698(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    double result = sub_10000C710(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_10000C6F4(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::ostream::~ostream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_10000C710(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100006118();
  }
  double result = (char *)sub_10000C61C(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *sub_10000C74C(unint64_t a1)
{
  if (a1 >> 62) {
    sub_10000612C();
  }
  return operator new(4 * a1);
}

uint64_t sub_10000C780(uint64_t a1)
{
  unsigned int v2 = operator new[](0x10040CuLL);
  *(void *)a1 = v2;
  *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = ((unint64_t)v2 + 12) & 0xFFFFFFFFFFFFFFF0LL;
  bzero(v2, 0x10040CuLL);
  *(void *)(a1 + 24) = -1LL;
  unsigned int v3 = operator new(0x30uLL);
  void *v3 = 0x10000000401LL;
  v3[2] = 0LL;
  v3[3] = 0LL;
  v3[1] = 0LL;
  uint64_t v4 = (char *)operator new(0x10040CuLL);
  v3[1] = v4;
  v3[2] = v4 + 1049612;
  v3[3] = v4 + 1049612;
  v3[4] = (unint64_t)(v4 + 12) & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 16) = xmmword_100014C00;
  bzero(v2, 0x10040CuLL);
  bzero(v4, 0x10040CuLL);
  v3[5] = 0xFFFFFFFF00000000LL;
  return a1;
}

void sub_10000C85C(_Unwind_Exception *a1)
{
  if (*v1) {
    operator delete[](*v1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10000C888(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 32);
  if (v2)
  {
    unsigned int v3 = (void *)v2[1];
    if (v3)
    {
      v2[2] = v3;
      operator delete(v3);
    }

    operator delete(v2);
  }

  if (*(void *)a1) {
    operator delete[](*(void **)a1);
  }
  return a1;
}

void *sub_10000C8D4(void *result)
{
  if (result[3] != -1LL)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v3.__val_ = 501LL;
    v3.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_100008914((uint64_t)exception, &v3);
    goto LABEL_6;
  }

  result[3] = result[2];
  uint64_t v1 = result[4];
  if (*(_DWORD *)(v1 + 44) != -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v3.__val_ = 508LL;
    v3.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_100008914((uint64_t)exception, &v3);
LABEL_6:
  }

  *(_DWORD *)(v1 + 44) = *(_DWORD *)(v1 + 40);
  return result;
}

void sub_10000C984(_Unwind_Exception *a1)
{
}

float *sub_10000C99C(float *result)
{
  uint64_t v1 = *((void *)result + 3);
  if (v1 == -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v23.__val_ = 502LL;
    v23.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_100008914((uint64_t)exception, &v23);
    goto LABEL_36;
  }

  unsigned int v2 = result;
  uint64_t v3 = *((void *)result + 4);
  int v4 = *(_DWORD *)(v3 + 44);
  if (v4 == -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v23.__val_ = 509LL;
    v23.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_100008914((uint64_t)exception, &v23);
LABEL_36:
  }

  *(_DWORD *)(v3 + 40) = v4;
  *(_DWORD *)(v3 + 44) = -1;
  if (v1 >= 7) {
    int v5 = 7;
  }
  else {
    int v5 = v1;
  }
  if (v1 >= 7) {
    uint64_t v6 = v1 - 7;
  }
  else {
    uint64_t v6 = 0LL;
  }
  *((void *)result + 2) = v6;
  if (v5 >= 1)
  {
    for (unsigned int i = 0; i != v5; ++i)
    {
      double result = (float *)sub_10000CB8C(*((int **)v2 + 4), i - v5 + 1);
      uint64_t v8 = 0LL;
      uint64_t v10 = *((void *)v2 + 1);
      uint64_t v9 = *((void *)v2 + 2);
      uint64_t v11 = (float *)(v10 + 4100LL * v9);
      do
      {
        v11[v8] = result[v8];
        ++v8;
      }

      while (v8 != 1025);
      uint64_t v12 = 0LL;
      float v13 = *v11;
      float v14 = v11[1];
      do
      {
        uint64_t v15 = &v11[v12];
        if (v13 <= v14) {
          float v16 = v14;
        }
        else {
          float v16 = v13;
        }
        float v13 = v14;
        float v14 = v15[2];
        if (v16 <= v14) {
          float v16 = v15[2];
        }
        *uint64_t v15 = v16;
        ++v12;
      }

      while (v12 != 1023);
      uint64_t v17 = 0LL;
      uint64_t v18 = v10 + 4100LL * (v9 - 1);
      uint64_t v19 = v10 + 4100LL * (v9 - 3);
      uint64_t v20 = v10 + 4100LL * (v9 - 6);
      do
      {
        if (i)
        {
          float v21 = *(float *)(v18 + 4 * v17);
          if (v21 <= v11[v17]) {
            float v21 = v11[v17];
          }
          *(float *)(v18 + 4 * v17) = v21;
          if (i >= 3)
          {
            *(float *)(v19 + 4 * v17) = v21;
            if (i >= 6)
            {
              *(float *)(v20 + 4 * v17) = v21;
            }
          }
        }

        ++v17;
      }

      while (v17 != 1025);
      *((void *)v2 + 2) = v9 + 1;
    }
  }

  *((void *)v2 + 3) = -1LL;
  return result;
}

void sub_10000CB74(_Unwind_Exception *a1)
{
}

uint64_t sub_10000CB8C(int *a1, int a2)
{
  if (a1[10] <= 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v4.__val_ = 510LL;
    v4.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_100008914((uint64_t)exception, &v4);
  }

  return sub_10000CC0C(a1, a2 - 1);
}

void sub_10000CBF8(_Unwind_Exception *a1)
{
}

uint64_t sub_10000CC0C(int *a1, int a2)
{
  if (a2 > 0 || (int v2 = a1[1], 2 - v2 > a2))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v5.__val_ = 511LL;
    v5.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_100008914((uint64_t)exception, &v5);
  }

  return *((void *)a1 + 4) + 4 * *a1 * (uint64_t)((a1[10] + a2) & (v2 - 1));
}

void sub_10000CCA4(_Unwind_Exception *a1)
{
}

void sub_10000CCB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = a1;
  std::error_code v4 = *(int **)(a1 + 32);
  ++v4[10];
  uint64_t v5 = sub_10000CB8C(v4, 0);
  uint64_t v6 = 0LL;
  uint64_t v8 = *(void *)(v3 + 8);
  uint64_t v7 = *(void *)(v3 + 16);
  uint64_t v9 = (float *)(v8 + 4100LL * v7);
  do
  {
    v9[v6] = *(float *)(v5 + 4 * v6);
    ++v6;
  }

  while (v6 != 1025);
  uint64_t v10 = 0LL;
  float v11 = *v9;
  float v12 = v9[1];
  do
  {
    float v13 = &v9[v10];
    if (v11 <= v12) {
      float v14 = v12;
    }
    else {
      float v14 = v11;
    }
    float v11 = v12;
    float v12 = v13[2];
    if (v14 <= v12) {
      float v14 = v13[2];
    }
    float *v13 = v14;
    ++v10;
  }

  while (v10 != 1023);
  uint64_t v15 = 0LL;
  uint64_t v16 = v8 + 4100LL * (v7 - 1);
  uint64_t v17 = v8 + 4100LL * (v7 - 3);
  uint64_t v18 = v8 + 4100LL * (v7 - 6);
  do
  {
    float v19 = *(float *)(v16 + 4 * v15);
    if (v19 <= v9[v15]) {
      float v19 = v9[v15];
    }
    *(float *)(v16 + 4 * v15) = v19;
    *(float *)(v17 + 4 * v15) = v19;
    *(float *)(v18 + 4 * v15++) = v19;
  }

  while (v15 != 1025);
  if (v7 >= 45)
  {
    uint64_t v79 = sub_10000CB8C(*(int **)(v3 + 32), -45);
    v80[2] = v79;
    uint64_t v78 = sub_10000CB8C(*(int **)(v3 + 32), -47);
    v80[0] = v78;
    uint64_t v77 = sub_10000CB8C(*(int **)(v3 + 32), -46);
    v80[1] = v77;
    uint64_t v76 = sub_10000CB8C(*(int **)(v3 + 32), -44);
    v80[3] = v76;
    uint64_t v75 = sub_10000CB8C(*(int **)(v3 + 32), -43);
    v80[4] = v75;
    uint64_t v20 = *(void *)(v3 + 8) + 4100LL * (*(_DWORD *)(v3 + 16) - 48);
    uint64_t v70 = a2 + 2;
    float v21 = (char *)&v81[6] + 12;
    BOOL v22 = (float *)(v20 + 24);
    uint64_t v23 = v20 + 48;
    uint64_t v24 = 10LL;
    uint64_t v71 = v20;
    uint64_t v72 = v3;
    unsigned int v73 = a2;
    while (1)
    {
      float v25 = *(float *)(v79 + 4 * v24);
      if (v25 >= 0.015625 && v25 >= *(float *)(v20 + 4 * (v24 - 1)))
      {
        unint64_t v26 = 0LL;
        uint64_t v27 = v20 + 4 * v24;
        float v28 = *(float *)(v27 - 12);
        BOOL v29 = v22;
        do
        {
          float v30 = *v29;
          v29 -= 3;
          float v31 = v30;
          if (v28 <= v30) {
            float v28 = v31;
          }
          v26 += 3LL;
        }

        while (v26 < 7);
        if (v25 > v28)
        {
          unint64_t v32 = 0LL;
          uint64_t v33 = *(void *)(v3 + 16);
          uint64_t v34 = *(void *)(v3 + 8) + 4 * (v24 - 1);
          unsigned __int8 v35 = v33 - 55;
          char v36 = v33 - 41;
          do
          {
            v32 += 7LL;
            v35 -= 7;
          }

          while (v32 < 0x26);
          if (v25 > v28) {
            break;
          }
        }
      }

LABEL_65:
      ++v24;
      ++v22;
      v23 += 4LL;
      if (v24 == 1015)
      {
        uint64_t v7 = *(void *)(v3 + 16);
        goto LABEL_67;
      }
    }

    int v74 = v33 - 45;
    float v37 = fmaxf(*(float *)(v79 + 4 * v24), 0.015625);
    memset(v81, 0, sizeof(v81));
    uint64_t v38 = 0LL;
    float v39 = (float)(logf(v37) + 4.1589) * 1477.3;
    uint64_t v40 = v24 + 2;
    while (1)
    {
      unsigned int v41 = (float *)v81 + v38 + 2;
      float *v41 = v39 - (float)((float)(logf(fmaxf(*(float *)(v78 + 4 * (v40 - v38)), 0.015625)) + 4.1589) * 1477.3);
      BOOL v42 = (float *)v81 + v38;
      v42[7] = v39 - (float)((float)(logf(fmaxf(*(float *)(v77 + 4 * (v40 - v38)), 0.015625)) + 4.1589) * 1477.3);
      uint64_t v43 = v42 + 7;
      v43[5] = v39 - (float)((float)(logf(fmaxf(*(float *)(v79 + 4 * (v40 - v38)), 0.015625)) + 4.1589) * 1477.3);
      v43[10] = v39 - (float)((float)(logf(fmaxf(*(float *)(v76 + 4 * (v40 - v38)), 0.015625)) + 4.1589) * 1477.3);
      float v44 = logf(fmaxf(*(float *)(v75 + 4 * (v40 - v38)), 0.015625));
      uint64_t v45 = 0LL;
      v43[15] = v39 - (float)((float)(v44 + 4.1589) * 1477.3);
      BOOL v46 = v43 + 15;
      do
      {
        *(_DWORD *)&v21[v45] = 0;
        v45 += 20LL;
      }

      while (v45 != 100);
      if ((v38 & 0x7FFFFFFFFFFFFFFBLL) != 0)
      {
        if ((v38 & 0x7FFFFFFFFFFFFFFDLL) != 1) {
          goto LABEL_50;
        }
      }

      else
      {
        *BOOL v46 = 0;
        float *v41 = 0.0;
        BOOL v46 = v43 + 10;
        unsigned int v41 = v43;
      }

      *BOOL v46 = 0;
      float *v41 = 0.0;
LABEL_50:
      ++v38;
      v21 += 4;
      if (v38 == 5)
      {
        sub_10000F420(v74, v24, v80, v81, (_WORD *)v81 + 2, (_WORD *)v81 + 3, v83, &v82);
        unint64_t v47 = v73[1];
        unint64_t v48 = v73[2];
        if (v47 >= v48)
        {
          uint64_t v57 = 0x4EC4EC4EC4EC4EC5LL * ((uint64_t)(v47 - *v73) >> 4);
          unint64_t v58 = v57 + 1;
          float v21 = (char *)&v81[6] + 12;
          unint64_t v59 = 0x4EC4EC4EC4EC4EC5LL * ((uint64_t)(v48 - *v73) >> 4);
          if (2 * v59 > v58) {
            unint64_t v58 = 2 * v59;
          }
          if (v59 >= 0x9D89D89D89D89DLL) {
            unint64_t v60 = 0x13B13B13B13B13BLL;
          }
          else {
            unint64_t v60 = v58;
          }
          v83[4] = v70;
          uint64_t v3 = v72;
          if (v60) {
            unint64_t v60 = (unint64_t)sub_10000D32C(v60);
          }
          else {
            uint64_t v61 = 0LL;
          }
          __int128 v62 = *(_OWORD *)((char *)&v81[2] + 8);
          uint64_t v63 = (_DWORD *)(v60 + 208 * v57);
          *(_OWORD *)(v63 + 14) = *(_OWORD *)((char *)&v81[3] + 8);
          __int128 v64 = *(_OWORD *)((char *)&v81[5] + 8);
          *(_OWORD *)(v63 + 1std::ostream::~ostream(v2, v3 + 8) = *(_OWORD *)((char *)&v81[4] + 8);
          *(_OWORD *)(v63 + 22) = v64;
          __int128 v65 = *(_OWORD *)((char *)&v81[1] + 8);
          *(_OWORD *)(v63 + 2) = *(_OWORD *)((char *)v81 + 8);
          *(_OWORD *)(v63 + 6) = v65;
          *(_OWORD *)(v63 + 10) = v62;
          __int128 v66 = *(_OWORD *)((char *)&v81[10] + 12);
          *(_OWORD *)(v63 + 47) = *(_OWORD *)((char *)&v81[11] + 12);
          *(_OWORD *)(v63 + 43) = v66;
          __int128 v67 = *(_OWORD *)((char *)&v81[8] + 12);
          *(_OWORD *)(v63 + 39) = *(_OWORD *)((char *)&v81[9] + 12);
          *(_OWORD *)(v63 + 35) = v67;
          __int128 v68 = *(_OWORD *)((char *)&v81[6] + 12);
          *(_OWORD *)(v63 + 31) = *(_OWORD *)((char *)&v81[7] + 12);
          v83[0] = (void *)v60;
          v83[1] = v63;
          int v69 = DWORD1(v81[0]);
          *uint64_t v63 = v81[0];
          v63[1] = v69;
          v63[26] = DWORD2(v81[6]);
          v63[51] = HIDWORD(v81[12]);
          *(_OWORD *)(v63 + 27) = v68;
          v83[2] = v63 + 52;
          v83[3] = (void *)(v60 + 208 * v61);
          sub_10000D374(v73, v83);
          uint64_t v56 = v73[1];
          if (v83[0]) {
            operator delete(v83[0]);
          }
        }

        else
        {
          __int128 v49 = *(_OWORD *)((char *)&v81[2] + 8);
          *(_OWORD *)(v47 + 56) = *(_OWORD *)((char *)&v81[3] + 8);
          __int128 v50 = *(_OWORD *)((char *)&v81[5] + 8);
          *(_OWORD *)(v47 + 72) = *(_OWORD *)((char *)&v81[4] + 8);
          *(_OWORD *)(v47 + 8std::ostream::~ostream(v2, v3 + 8) = v50;
          __int128 v51 = *(_OWORD *)((char *)&v81[1] + 8);
          *(_OWORD *)(v47 + std::ostream::~ostream(v2, v3 + 8) = *(_OWORD *)((char *)v81 + 8);
          *(_OWORD *)(v47 + 24) = v51;
          *(_OWORD *)(v47 + 40) = v49;
          float v21 = (char *)&v81[6] + 12;
          __int128 v52 = *(_OWORD *)((char *)&v81[10] + 12);
          *(_OWORD *)(v47 + 18std::ostream::~ostream(v2, v3 + 8) = *(_OWORD *)((char *)&v81[11] + 12);
          *(_OWORD *)(v47 + 172) = v52;
          __int128 v53 = *(_OWORD *)((char *)&v81[8] + 12);
          *(_OWORD *)(v47 + 156) = *(_OWORD *)((char *)&v81[9] + 12);
          *(_OWORD *)(v47 + 140) = v53;
          __int128 v54 = *(_OWORD *)((char *)&v81[6] + 12);
          *(_OWORD *)(v47 + 124) = *(_OWORD *)((char *)&v81[7] + 12);
          int v55 = DWORD1(v81[0]);
          *(_DWORD *)unint64_t v47 = v81[0];
          *(_DWORD *)(v47 + 4) = v55;
          *(_DWORD *)(v47 + 104) = DWORD2(v81[6]);
          *(_DWORD *)(v47 + 204) = HIDWORD(v81[12]);
          uint64_t v56 = v47 + 208;
          *(_OWORD *)(v47 + 10std::ostream::~ostream(v2, v3 + 8) = v54;
          uint64_t v3 = v72;
        }

        uint64_t v20 = v71;
        v73[1] = v56;
        goto LABEL_65;
      }
    }
  }

LABEL_67:
  *(void *)(v3 + 16) = v7 + 1;
}

void *sub_10000D32C(unint64_t a1)
{
  if (a1 >= 0x13B13B13B13B13CLL) {
    sub_10000612C();
  }
  return operator new(208 * a1);
}

uint64_t *sub_10000D374(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  if (v2 != *result)
  {
    uint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = v4 + v5;
      int v7 = *(_DWORD *)(v2 + v5 - 204);
      *(_DWORD *)(v6 - 20std::ostream::~ostream(v2, v3 + 8) = *(_DWORD *)(v2 + v5 - 208);
      *(_DWORD *)(v6 - 204) = v7;
      __int128 v8 = *(_OWORD *)(v2 + v5 - 200);
      __int128 v9 = *(_OWORD *)(v2 + v5 - 184);
      *(_OWORD *)(v6 - 16std::ostream::~ostream(v2, v3 + 8) = *(_OWORD *)(v2 + v5 - 168);
      *(_OWORD *)(v6 - 184) = v9;
      *(_OWORD *)(v6 - 200) = v8;
      __int128 v10 = *(_OWORD *)(v2 + v5 - 152);
      __int128 v11 = *(_OWORD *)(v2 + v5 - 136);
      __int128 v12 = *(_OWORD *)(v2 + v5 - 120);
      *(_DWORD *)(v6 - 104) = *(_DWORD *)(v2 + v5 - 104);
      *(_OWORD *)(v6 - 120) = v12;
      *(_OWORD *)(v6 - 136) = v11;
      *(_OWORD *)(v6 - 152) = v10;
      __int128 v13 = *(_OWORD *)(v2 + v5 - 36);
      __int128 v14 = *(_OWORD *)(v2 + v5 - 20);
      int v15 = *(_DWORD *)(v2 + v5 - 4);
      *(_OWORD *)(v6 - 52) = *(_OWORD *)(v2 + v5 - 52);
      *(_DWORD *)(v6 - 4) = v15;
      *(_OWORD *)(v6 - 20) = v14;
      *(_OWORD *)(v6 - 36) = v13;
      __int128 v16 = *(_OWORD *)(v2 + v5 - 100);
      __int128 v17 = *(_OWORD *)(v2 + v5 - 84);
      *(_OWORD *)(v6 - 6std::ostream::~ostream(v2, v3 + 8) = *(_OWORD *)(v2 + v5 - 68);
      *(_OWORD *)(v6 - 84) = v17;
      *(_OWORD *)(v6 - 100) = v16;
      v5 -= 208LL;
    }

    while (v2 + v5 != v3);
    v4 += v5;
  }

  a2[1] = v4;
  uint64_t v18 = *result;
  char *result = v4;
  a2[1] = v18;
  uint64_t v19 = result[1];
  result[1] = a2[2];
  a2[2] = v19;
  uint64_t v20 = result[2];
  result[2] = a2[3];
  a2[3] = v20;
  *a2 = a2[1];
  return result;
}

void sub_10000D458(uint64_t a1, char **a2)
{
  uint64_t v4 = *(int **)(a1 + 32);
  ++v4[10];
  uint64_t v5 = sub_10000CB8C(v4, 0);
  uint64_t v6 = 0LL;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  __int128 v9 = (float *)(v8 + 4100LL * v7);
  do
  {
    v9[v6] = *(float *)(v5 + 4 * v6);
    ++v6;
  }

  while (v6 != 1025);
  uint64_t v10 = 0LL;
  float v11 = *v9;
  float v12 = v9[1];
  do
  {
    __int128 v13 = &v9[v10];
    if (v11 <= v12) {
      float v14 = v12;
    }
    else {
      float v14 = v11;
    }
    float v11 = v12;
    float v12 = v13[2];
    if (v14 <= v12) {
      float v14 = v13[2];
    }
    float *v13 = v14;
    ++v10;
  }

  while (v10 != 1023);
  uint64_t v15 = 0LL;
  uint64_t v16 = v8 + 4100LL * (v7 - 1);
  uint64_t v17 = v8 + 4100LL * (v7 - 3);
  uint64_t v18 = v8 + 4100LL * (v7 - 6);
  do
  {
    float v19 = *(float *)(v16 + 4 * v15);
    if (v19 <= v9[v15]) {
      float v19 = v9[v15];
    }
    *(float *)(v16 + 4 * v15) = v19;
    *(float *)(v17 + 4 * v15) = v19;
    *(float *)(v18 + 4 * v15++) = v19;
  }

  while (v15 != 1025);
  if (v7 >= 45)
  {
    uint64_t v20 = sub_10000CB8C(*(int **)(a1 + 32), -45);
    v52[2] = v20;
    v52[0] = sub_10000CB8C(*(int **)(a1 + 32), -47);
    v52[1] = sub_10000CB8C(*(int **)(a1 + 32), -46);
    v52[3] = sub_10000CB8C(*(int **)(a1 + 32), -44);
    uint64_t v21 = sub_10000CB8C(*(int **)(a1 + 32), -43);
    uint64_t v22 = *(void *)(a1 + 8) + 4100LL * (*(_DWORD *)(a1 + 16) - 48);
    v52[4] = v21;
    uint64_t v23 = (float *)(v22 + 24);
    uint64_t v24 = v22 + 48;
    for (uint64_t i = 10LL; i != 1015; ++i)
    {
      float v26 = *(float *)(v20 + 4 * i);
      if (v26 >= 0.015625 && v26 >= *(float *)(v22 + 4 * (i - 1)))
      {
        unint64_t v27 = 0LL;
        uint64_t v28 = v22 + 4 * i;
        float v29 = *(float *)(v28 - 12);
        float v30 = v23;
        do
        {
          float v31 = *v30;
          v30 -= 3;
          float v32 = v31;
          if (v29 <= v31) {
            float v29 = v32;
          }
          v27 += 3LL;
        }

        while (v27 < 7);
        if (v26 > v29)
        {
          unint64_t v33 = 0LL;
          uint64_t v34 = *(void *)(a1 + 16);
          uint64_t v35 = *(void *)(a1 + 8) + 4 * (i - 1);
          unsigned __int8 v36 = v34 - 55;
          char v37 = v34 - 41;
          do
          {
            v33 += 7LL;
            v36 -= 7;
          }

          while (v33 < 0x26);
          if (v26 > v29)
          {
            memset(v53, 0, 12);
            sub_10000F420(v34 - 45, i, v52, v53, (_WORD *)v53 + 2, (_WORD *)v53 + 3, (_WORD *)&v53[1] + 1, &v53[1]);
            unint64_t v39 = (unint64_t)a2[1];
            unint64_t v38 = (unint64_t)a2[2];
            if (v39 >= v38)
            {
              unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v39 - (void)*a2) >> 2);
              unint64_t v42 = v41 + 1;
              if (v41 + 1 > 0x1555555555555555LL) {
                sub_100006118();
              }
              unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v38 - (void)*a2) >> 2);
              if (2 * v43 > v42) {
                unint64_t v42 = 2 * v43;
              }
              if (v43 >= 0xAAAAAAAAAAAAAAALL) {
                unint64_t v44 = 0x1555555555555555LL;
              }
              else {
                unint64_t v44 = v42;
              }
              uint64_t v45 = (char *)sub_10000D83C(v44);
              unint64_t v47 = &v45[12 * v41];
              *(_DWORD *)unint64_t v47 = v53[0];
              *(void *)(v47 + 4) = *(void *)((char *)v53 + 4);
              __int128 v49 = *a2;
              unint64_t v48 = a2[1];
              __int128 v50 = v47;
              if (v48 != *a2)
              {
                do
                {
                  int v51 = *((_DWORD *)v48 - 3);
                  v48 -= 12;
                  *((_DWORD *)v50 - 3) = v51;
                  v50 -= 12;
                  *(void *)(v50 + 4) = *(void *)(v48 + 4);
                }

                while (v48 != v49);
                unint64_t v48 = *a2;
              }

              uint64_t v40 = v47 + 12;
              *a2 = v50;
              a2[1] = v47 + 12;
              a2[2] = &v45[12 * v46];
              if (v48) {
                operator delete(v48);
              }
            }

            else
            {
              *(_DWORD *)unint64_t v39 = v53[0];
              *(void *)(v39 + 4) = *(void *)((char *)v53 + 4);
              uint64_t v40 = (char *)(v39 + 12);
            }

            a2[1] = v40;
          }
        }
      }

      ++v23;
      v24 += 4LL;
    }

    uint64_t v7 = *(void *)(a1 + 16);
  }

  *(void *)(a1 + 16) = v7 + 1;
}

void *sub_10000D83C(unint64_t a1)
{
  if (a1 >= 0x1555555555555556LL) {
    sub_10000612C();
  }
  return operator new(12 * a1);
}

void sub_10000D880(uint64_t a1, void **a2)
{
  uint64_t v4 = *(int **)(a1 + 32);
  ++v4[10];
  uint64_t v5 = sub_10000CB8C(v4, 0);
  uint64_t v6 = 0LL;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  __int128 v9 = (float *)(v8 + 4100LL * v7);
  do
  {
    v9[v6] = *(float *)(v5 + 4 * v6);
    ++v6;
  }

  while (v6 != 1025);
  uint64_t v10 = 0LL;
  float v11 = *v9;
  float v12 = v9[1];
  do
  {
    __int128 v13 = &v9[v10];
    if (v11 <= v12) {
      float v14 = v12;
    }
    else {
      float v14 = v11;
    }
    float v11 = v12;
    float v12 = v13[2];
    if (v14 <= v12) {
      float v14 = v13[2];
    }
    float *v13 = v14;
    ++v10;
  }

  while (v10 != 1023);
  uint64_t v15 = 0LL;
  uint64_t v16 = v8 + 4100LL * (v7 - 1);
  uint64_t v17 = v8 + 4100LL * (v7 - 3);
  uint64_t v18 = v8 + 4100LL * (v7 - 6);
  do
  {
    float v19 = *(float *)(v16 + 4 * v15);
    if (v19 <= v9[v15]) {
      float v19 = v9[v15];
    }
    *(float *)(v16 + 4 * v15) = v19;
    *(float *)(v17 + 4 * v15) = v19;
    *(float *)(v18 + 4 * v15++) = v19;
  }

  while (v15 != 1025);
  if (v7 >= 45)
  {
    uint64_t v50 = sub_10000CB8C(*(int **)(a1 + 32), -45);
    v49[0] = sub_10000CB8C(*(int **)(a1 + 32), -47);
    v49[1] = sub_10000CB8C(*(int **)(a1 + 32), -46);
    uint64_t v51 = sub_10000CB8C(*(int **)(a1 + 32), -44);
    uint64_t v20 = sub_10000CB8C(*(int **)(a1 + 32), -43);
    uint64_t v21 = *(void *)(a1 + 8) + 4100LL * (*(_DWORD *)(a1 + 16) - 48);
    uint64_t v52 = v20;
    uint64_t v22 = (float *)(v21 + 24);
    uint64_t v23 = v21 + 48;
    for (uint64_t i = 10LL; i != 1015; ++i)
    {
      float v25 = *(float *)(v50 + 4 * i);
      if (v25 >= 0.015625 && v25 >= *(float *)(v21 + 4 * (i - 1)))
      {
        unint64_t v26 = 0LL;
        uint64_t v27 = v21 + 4 * i;
        float v28 = *(float *)(v27 - 12);
        float v29 = v22;
        do
        {
          float v30 = *v29;
          v29 -= 3;
          float v31 = v30;
          if (v28 <= v30) {
            float v28 = v31;
          }
          v26 += 3LL;
        }

        while (v26 < 7);
        if (v25 > v28)
        {
          unint64_t v32 = 0LL;
          uint64_t v33 = *(void *)(a1 + 16);
          uint64_t v34 = *(void *)(a1 + 8) + 4 * (i - 1);
          unsigned __int8 v35 = v33 - 55;
          char v36 = v33 - 41;
          do
          {
            v32 += 7LL;
            v35 -= 7;
          }

          while (v32 < 0x26);
          if (v25 > v28)
          {
            uint64_t v53 = 0LL;
            sub_10000F420(v33 - 45, i, v49, &v53, (_WORD *)&v53 + 2, (_WORD *)&v53 + 3, &v55, &v54);
            unint64_t v38 = a2[1];
            unint64_t v37 = (unint64_t)a2[2];
            if ((unint64_t)v38 >= v37)
            {
              uint64_t v40 = ((char *)v38 - (_BYTE *)*a2) >> 3;
              uint64_t v41 = v37 - (void)*a2;
              uint64_t v42 = v41 >> 2;
              else {
                unint64_t v43 = v42;
              }
              if (v43) {
                unint64_t v43 = (unint64_t)sub_10000C61C(v43);
              }
              else {
                uint64_t v44 = 0LL;
              }
              uint64_t v45 = (void *)(v43 + 8 * v40);
              void *v45 = v53;
              unint64_t v39 = v45 + 1;
              unint64_t v47 = (char *)*a2;
              uint64_t v46 = (char *)a2[1];
              if (v46 != *a2)
              {
                do
                {
                  uint64_t v48 = *((void *)v46 - 1);
                  v46 -= 8;
                  *--uint64_t v45 = v48;
                }

                while (v46 != v47);
                uint64_t v46 = (char *)*a2;
              }

              *a2 = v45;
              a2[1] = v39;
              a2[2] = (void *)(v43 + 8 * v44);
              if (v46) {
                operator delete(v46);
              }
            }

            else
            {
              *unint64_t v38 = v53;
              unint64_t v39 = v38 + 1;
            }

            a2[1] = v39;
          }
        }
      }

      ++v22;
      v23 += 4LL;
    }

    uint64_t v7 = *(void *)(a1 + 16);
  }

  *(void *)(a1 + 16) = v7 + 1;
}

void sub_10000DC24(char **a1, unint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  unint64_t v5 = (v4 - *a1) >> 3;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    float v19 = &v3[8 * a2];
    goto LABEL_17;
  }

  unint64_t v6 = a2 - v5;
  uint64_t v7 = a1[2];
  if (a2 - v5 <= (v7 - v4) >> 3)
  {
    bzero(a1[1], 8 * v6);
    float v19 = &v4[8 * v6];
LABEL_17:
    a1[1] = v19;
    return;
  }

  if (a2 >> 61) {
    sub_100006118();
  }
  uint64_t v8 = v7 - v3;
  uint64_t v9 = v8 >> 2;
  if (v8 >> 2 <= a2) {
    uint64_t v9 = a2;
  }
  else {
    unint64_t v10 = v9;
  }
  float v11 = (char *)sub_10000C61C(v10);
  float v12 = &v11[8 * v5];
  float v14 = &v11[8 * v13];
  bzero(v12, 8 * v6);
  uint64_t v15 = &v12[8 * v6];
  uint64_t v17 = *a1;
  uint64_t v16 = a1[1];
  if (v16 != *a1)
  {
    do
    {
      uint64_t v18 = *((void *)v16 - 1);
      v16 -= 8;
      *((void *)v12 - 1) = v18;
      v12 -= 8;
    }

    while (v16 != v17);
    uint64_t v16 = *a1;
  }

  *a1 = v12;
  a1[1] = v15;
  a1[2] = v14;
  if (v16) {
    operator delete(v16);
  }
}

void sub_10000DD1C(void **a1, unint64_t a2)
{
  if (a2 > ((_BYTE *)a1[2] - (_BYTE *)*a1) >> 2)
  {
    int64_t v3 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    uint64_t v4 = (char *)sub_10000C74C(a2);
    unint64_t v5 = &v4[v3 & 0xFFFFFFFFFFFFFFFCLL];
    uint64_t v7 = &v4[4 * v6];
    uint64_t v8 = (char *)*a1;
    uint64_t v9 = (char *)a1[1];
    unint64_t v10 = v5;
    if (v9 != *a1)
    {
      unint64_t v10 = v5;
      do
      {
        int v11 = *((_DWORD *)v9 - 1);
        v9 -= 4;
        *((_DWORD *)v10 - 1) = v11;
        v10 -= 4;
      }

      while (v9 != v8);
    }

    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8) {
      operator delete(v8);
    }
  }

void sub_10000DDA4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 >= 1)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = a3;
    int v8 = *(_DWORD *)(a1 + 44);
    uint64_t v35 = a2;
    do
    {
      int v9 = *(_DWORD *)(a2 + 4 * v6);
      uint64_t v10 = *(void *)(a1 + 64);
      int v11 = (_DWORD *)(v10 + 4LL * (v8 & 0x3F));
      v11[64] = v9;
      _DWORD *v11 = v9;
      if ((v8 & 1) == 0)
      {
        uint64_t v12 = 0LL;
        uint64_t v13 = v10 + 4LL * (((_BYTE)v8 + 41) & 0x3F);
        float v14 = 0.0;
        do
        {
          float32x4_t v15 = vmulq_f32(*(float32x4_t *)(v13 + v12 * 16), (float32x4_t)xmmword_100016F60[v12]);
          float v14 = (float)((float)((float)(v14 + v15.f32[0]) + v15.f32[1]) + v15.f32[2]) + v15.f32[3];
          ++v12;
        }

        while (v12 != 6);
        int v16 = *(_DWORD *)(a1 + 48);
        int v17 = *(_DWORD *)(a1 + 52);
        int v18 = *(_DWORD *)(a1 + 40);
        float v19 = (float *)(*(void *)(a1 + 80) + 4LL * v18);
        v19[256] = v14;
        float *v19 = v14;
        if (v17 - v16 <= 319)
        {
          do
          {
            uint64_t v20 = 0LL;
            uint64_t v21 = (char *)&unk_100017140 + 384 * (v16 - v17) + 122496;
            float v22 = 0.0;
            do
            {
              float32x4_t v23 = vmulq_f32( *(float32x4_t *)(*(void *)(a1 + 80) + 4LL * (*(_DWORD *)(a1 + 40) - 95) + v20),  *(float32x4_t *)&v21[v20]);
              float v22 = (float)((float)((float)(v22 + v23.f32[0]) + v23.f32[1]) + v23.f32[2]) + v23.f32[3];
              v20 += 16LL;
            }

            while (v20 != 384);
            float v25 = *(float **)(a4 + 8);
            unint64_t v24 = *(void *)(a4 + 16);
            if ((unint64_t)v25 >= v24)
            {
              uint64_t v27 = *(float **)a4;
              uint64_t v28 = ((uint64_t)v25 - *(void *)a4) >> 2;
              unint64_t v29 = v28 + 1;
              uint64_t v30 = v24 - (void)v27;
              if (v30 >> 1 > v29) {
                unint64_t v29 = v30 >> 1;
              }
              else {
                unint64_t v31 = v29;
              }
              if (v31)
              {
                unint64_t v31 = (unint64_t)sub_10000C74C(v31);
                uint64_t v27 = *(float **)a4;
                float v25 = *(float **)(a4 + 8);
              }

              else
              {
                uint64_t v32 = 0LL;
              }

              uint64_t v33 = (float *)(v31 + 4 * v28);
              float *v33 = v22;
              unint64_t v26 = v33 + 1;
              while (v25 != v27)
              {
                int v34 = *((_DWORD *)v25-- - 1);
                *((_DWORD *)v33-- - 1) = v34;
              }

              *(void *)a4 = v33;
              *(void *)(a4 + std::ostream::~ostream(v2, v3 + 8) = v26;
              *(void *)(a4 + 16) = v31 + 4 * v32;
              if (v27) {
                operator delete(v27);
              }
            }

            else
            {
              float *v25 = v22;
              unint64_t v26 = v25 + 1;
            }

            *(void *)(a4 + std::ostream::~ostream(v2, v3 + 8) = v26;
            int v16 = *(_DWORD *)(a1 + 48);
            int v17 = *(_DWORD *)(a1 + 52) + 441;
            *(_DWORD *)(a1 + 52) = v17;
          }

          while (v17 - v16 < 320);
          int v18 = *(_DWORD *)(a1 + 40);
          int v8 = *(_DWORD *)(a1 + 44);
        }

        *(_DWORD *)(a1 + 4std::ostream::~ostream(v2, v3 + 8) = v16 + 320;
        *(_DWORD *)(a1 + 40) = v18 + 1;
        a2 = v35;
      }

      *(_DWORD *)(a1 + 44) = ++v8;
      ++v6;
    }

    while (v6 != v7);
  }

void sub_10000DFF0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 >= 1)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = a3;
    int v9 = *(_DWORD *)(a1 + 40);
    do
    {
      int v10 = *(_DWORD *)(a2 + 4 * v7);
      uint64_t v11 = *(void *)(a1 + 80);
      uint64_t v12 = (_DWORD *)(v11 + 4LL * v9);
      v12[256] = v10;
      *uint64_t v12 = v10;
      if ((v9 & 1) == 0)
      {
        uint64_t v13 = 0LL;
        uint64_t v14 = v11 + 4LL * (v9 - 95);
        float v15 = 0.0;
        do
        {
          float32x4_t v16 = vmulq_f32(*(float32x4_t *)(v14 + v13 * 16), (float32x4_t)xmmword_100016FC0[v13]);
          float v15 = (float)((float)((float)(v15 + v16.f32[0]) + v16.f32[1]) + v16.f32[2]) + v16.f32[3];
          ++v13;
        }

        while (v13 != 24);
        int v18 = *(float **)(a4 + 8);
        unint64_t v17 = *(void *)(a4 + 16);
        if ((unint64_t)v18 >= v17)
        {
          uint64_t v20 = *(float **)a4;
          uint64_t v21 = ((uint64_t)v18 - *(void *)a4) >> 2;
          unint64_t v22 = v21 + 1;
          uint64_t v23 = v17 - (void)v20;
          if (v23 >> 1 > v22) {
            unint64_t v22 = v23 >> 1;
          }
          else {
            unint64_t v24 = v22;
          }
          if (v24)
          {
            unint64_t v24 = (unint64_t)sub_10000C74C(v24);
            uint64_t v20 = *(float **)a4;
            int v18 = *(float **)(a4 + 8);
          }

          else
          {
            uint64_t v25 = 0LL;
          }

          unint64_t v26 = (float *)(v24 + 4 * v21);
          *unint64_t v26 = v15;
          float v19 = v26 + 1;
          while (v18 != v20)
          {
            int v27 = *((_DWORD *)v18-- - 1);
            *((_DWORD *)v26-- - 1) = v27;
          }

          *(void *)a4 = v26;
          *(void *)(a4 + std::ostream::~ostream(v2, v3 + 8) = v19;
          *(void *)(a4 + 16) = v24 + 4 * v25;
          if (v20) {
            operator delete(v20);
          }
        }

        else
        {
          *int v18 = v15;
          float v19 = v18 + 1;
        }

        *(void *)(a4 + std::ostream::~ostream(v2, v3 + 8) = v19;
        int v9 = *(_DWORD *)(a1 + 40);
      }

      *(_DWORD *)(a1 + 40) = ++v9;
      ++v7;
    }

    while (v7 != v8);
  }

void sub_10000E17C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 >= 1)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = *(_DWORD **)(a4 + 8);
    uint64_t v8 = a3;
    do
    {
      unint64_t v9 = *(void *)(a4 + 16);
      if ((unint64_t)v7 >= v9)
      {
        uint64_t v11 = *(_DWORD **)a4;
        uint64_t v12 = ((uint64_t)v7 - *(void *)a4) >> 2;
        unint64_t v13 = v12 + 1;
        uint64_t v14 = v9 - (void)v11;
        if (v14 >> 1 > v13) {
          unint64_t v13 = v14 >> 1;
        }
        else {
          unint64_t v15 = v13;
        }
        if (v15)
        {
          unint64_t v15 = (unint64_t)sub_10000C74C(v15);
          uint64_t v11 = *(_DWORD **)a4;
          uint64_t v7 = *(_DWORD **)(a4 + 8);
        }

        else
        {
          uint64_t v16 = 0LL;
        }

        unint64_t v17 = (_DWORD *)(v15 + 4 * v12);
        *unint64_t v17 = *(_DWORD *)(a2 + 4 * v6);
        int v10 = v17 + 1;
        while (v7 != v11)
        {
          int v18 = *--v7;
          *--unint64_t v17 = v18;
        }

        *(void *)a4 = v17;
        *(void *)(a4 + std::ostream::~ostream(v2, v3 + 8) = v10;
        *(void *)(a4 + 16) = v15 + 4 * v16;
        if (v11) {
          operator delete(v11);
        }
      }

      else
      {
        *uint64_t v7 = *(_DWORD *)(a2 + 4 * v6);
        int v10 = v7 + 1;
      }

      *(void *)(a4 + std::ostream::~ostream(v2, v3 + 8) = v10;
      ++v6;
      uint64_t v7 = v10;
    }

    while (v6 != v8);
  }

void sub_10000E288(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 >= 1)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = a3;
    int v9 = *(_DWORD *)(a1 + 40);
    int v10 = *(_DWORD *)(a1 + 48);
    do
    {
      int v11 = *(_DWORD *)(a2 + 4 * v7);
      uint64_t v12 = *(void *)(a1 + 80);
      unint64_t v13 = (_DWORD *)(v12 + 4LL * v9);
      v13[256] = v11;
      _DWORD *v13 = v11;
      int v14 = v10 + 1;
      *(_DWORD *)(a1 + 4std::ostream::~ostream(v2, v3 + 8) = v10 + 1;
      if (!v10)
      {
        uint64_t v15 = 0LL;
        uint64_t v16 = v12 + 4LL * (v9 - 127);
        float v17 = 0.0;
        do
        {
          float32x4_t v18 = vmulq_f32(*(float32x4_t *)(v16 + v15 * 16), (float32x4_t)xmmword_100016D60[v15]);
          float v17 = (float)((float)((float)(v17 + v18.f32[0]) + v18.f32[1]) + v18.f32[2]) + v18.f32[3];
          ++v15;
        }

        while (v15 != 32);
        uint64_t v20 = *(float **)(a4 + 8);
        unint64_t v19 = *(void *)(a4 + 16);
        if ((unint64_t)v20 >= v19)
        {
          unint64_t v22 = *(float **)a4;
          uint64_t v23 = ((uint64_t)v20 - *(void *)a4) >> 2;
          unint64_t v24 = v23 + 1;
          uint64_t v25 = v19 - (void)v22;
          if (v25 >> 1 > v24) {
            unint64_t v24 = v25 >> 1;
          }
          else {
            unint64_t v26 = v24;
          }
          if (v26)
          {
            unint64_t v26 = (unint64_t)sub_10000C74C(v26);
            unint64_t v22 = *(float **)a4;
            uint64_t v20 = *(float **)(a4 + 8);
          }

          else
          {
            uint64_t v27 = 0LL;
          }

          uint64_t v28 = (float *)(v26 + 4 * v23);
          *uint64_t v28 = v17;
          uint64_t v21 = v28 + 1;
          while (v20 != v22)
          {
            int v29 = *((_DWORD *)v20-- - 1);
            *((_DWORD *)v28-- - 1) = v29;
          }

          *(void *)a4 = v28;
          *(void *)(a4 + std::ostream::~ostream(v2, v3 + 8) = v21;
          *(void *)(a4 + 16) = v26 + 4 * v27;
          if (v22) {
            operator delete(v22);
          }
        }

        else
        {
          *uint64_t v20 = v17;
          uint64_t v21 = v20 + 1;
        }

        *(void *)(a4 + std::ostream::~ostream(v2, v3 + 8) = v21;
        int v14 = *(_DWORD *)(a1 + 48);
      }

      if (v14 >= 3)
      {
        int v14 = 0;
        *(_DWORD *)(a1 + 4std::ostream::~ostream(v2, v3 + 8) = 0;
      }

      int v9 = *(_DWORD *)(a1 + 40) + 1;
      *(_DWORD *)(a1 + 40) = v9;
      ++v7;
      int v10 = v14;
    }

    while (v7 != v8);
  }

double sub_10000E438(uint64_t a1)
{
  uint64_t v2 = *(_OWORD **)(a1 + 8);
  if ((v2 & 0xF) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v5.__val_ = 512LL;
    v5.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_100008914((uint64_t)exception, &v5);
  }

  double result = 0.0;
  v2[30] = 0u;
  v2[31] = 0u;
  v2[28] = 0u;
  v2[29] = 0u;
  v2[26] = 0u;
  v2[27] = 0u;
  v2[24] = 0u;
  v2[25] = 0u;
  v2[22] = 0u;
  v2[23] = 0u;
  v2[20] = 0u;
  v2[21] = 0u;
  v2[18] = 0u;
  v2[19] = 0u;
  v2[16] = 0u;
  v2[17] = 0u;
  v2[14] = 0u;
  v2[15] = 0u;
  v2[12] = 0u;
  v2[13] = 0u;
  v2[10] = 0u;
  v2[11] = 0u;
  v2[8] = 0u;
  v2[9] = 0u;
  v2[6] = 0u;
  v2[7] = 0u;
  v2[4] = 0u;
  v2[5] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  _OWORD *v2 = 0u;
  v2[1] = 0u;
  return result;
}

void sub_10000E4F4(_Unwind_Exception *a1)
{
}

void sub_10000E508(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if ((v2 & 0xF) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v4.__val_ = 512LL;
    v4.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_100008914((uint64_t)exception, &v4);
  }

  bzero(v2, 0x800uLL);
}

void sub_10000E584(_Unwind_Exception *a1)
{
}

uint64_t sub_10000E598(uint64_t a1, int a2)
{
  *(void *)(a1 + 16) = 0LL;
  std::error_code v4 = (void **)(a1 + 16);
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  std::error_code v5 = operator new[](0x20CuLL);
  *(void *)(a1 + 56) = v5;
  *(void *)(a1 + 64) = ((unint64_t)v5 + 12) & 0xFFFFFFFFFFFFFFF0LL;
  bzero(v5, 0x20CuLL);
  uint64_t v6 = operator new[](0x80CuLL);
  *(void *)(a1 + 72) = v6;
  *(void *)(a1 + 80) = ((unint64_t)v6 + 12) & 0xFFFFFFFFFFFFFFF0LL;
  bzero(v6, 0x80CuLL);
  *(_DWORD *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = 16000;
  *(_DWORD *)(a1 + 92) = a2;
  sub_10000DD1C(v4, 0xFA000u / a2);
  if (a2 > 44099)
  {
    if (a2 == 44100)
    {
      uint64_t v7 = sub_10000DDA4;
      goto LABEL_10;
    }

    if (a2 == 48000)
    {
      uint64_t v7 = sub_10000E288;
      goto LABEL_10;
    }

LABEL_11:
    *(void *)a1 = 0LL;
    *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = 0LL;
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Invalid input sample rate.");
  }

  if (a2 == 16000)
  {
    uint64_t v7 = sub_10000E17C;
    goto LABEL_10;
  }

  if (a2 != 32000) {
    goto LABEL_11;
  }
  uint64_t v7 = sub_10000DFF0;
LABEL_10:
  *(void *)a1 = v7;
  *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 4std::ostream::~ostream(v2, v3 + 8) = 0LL;
  sub_10000E438(a1 + 56);
  sub_10000E508(a1 + 72);
  return a1;
}

void sub_10000E6FC(_Unwind_Exception *a1)
{
  if (*v4) {
    operator delete[](*v4);
  }
  if (*v3) {
    operator delete[](*v3);
  }
  uint64_t v7 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v7;
    operator delete(v7);
  }

  _Unwind_Resume(a1);
}

void sub_10000E748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a1 + 16;
  *(void *)(a1 + 24) = *(void *)(a1 + 16);
  uint64_t v7 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))a1;
  uint64_t v8 = *(void *)(a1 + 8);
  int v9 = (void *)(a1 + (v8 >> 1));
  if ((v8 & 1) != 0) {
    uint64_t v7 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(*v9 + v7);
  }
  v7(v9, a2, a3, v6);
  sub_10000E7A0( a4,  *(char **)(a4 + 8),  *(char **)(a1 + 16),  *(char **)(a1 + 24),  (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 2);
}

void sub_10000E7A0(uint64_t a1, char *__dst, char *__src, char *a4, uint64_t a5)
{
  if (a5 < 1) {
    return;
  }
  uint64_t v6 = __src;
  unint64_t v10 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (a5 > (uint64_t)(v9 - v10) >> 2)
  {
    int v11 = *(char **)a1;
    unint64_t v12 = a5 + ((uint64_t)(v10 - *(void *)a1) >> 2);
    if (v12 >> 62) {
      sub_100006118();
    }
    uint64_t v13 = (__dst - v11) >> 2;
    uint64_t v14 = v9 - (void)v11;
    if (v14 >> 1 > v12) {
      unint64_t v12 = v14 >> 1;
    }
    else {
      unint64_t v15 = v12;
    }
    if (v15) {
      unint64_t v15 = (unint64_t)sub_10000C74C(v15);
    }
    else {
      uint64_t v16 = 0LL;
    }
    unint64_t v26 = (_DWORD *)(v15 + 4 * v13);
    uint64_t v27 = (char *)&v26[a5];
    uint64_t v28 = 4 * a5;
    int v29 = v26;
    do
    {
      int v30 = *(_DWORD *)v6;
      v6 += 4;
      *v29++ = v30;
      v28 -= 4LL;
    }

    while (v28);
    unint64_t v31 = *(char **)a1;
    if (*(char **)a1 != __dst)
    {
      uint64_t v32 = __dst;
      do
      {
        int v33 = *((_DWORD *)v32 - 1);
        v32 -= 4;
        *--unint64_t v26 = v33;
      }

      while (v32 != v31);
    }

    unint64_t v34 = v15 + 4 * v16;
    uint64_t v35 = *(_BYTE **)(a1 + 8);
    uint64_t v36 = v35 - __dst;
    if (v35 != __dst) {
      memmove(v27, __dst, v35 - __dst);
    }
    unint64_t v37 = *(char **)a1;
    *(void *)a1 = v26;
    *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = &v27[v36];
    *(void *)(a1 + 16) = v34;
    if (v37) {
      operator delete(v37);
    }
    return;
  }

  uint64_t v17 = v10 - (void)__dst;
  uint64_t v18 = (uint64_t)(v10 - (void)__dst) >> 2;
  if (v18 >= a5)
  {
    unint64_t v19 = &__src[4 * a5];
    uint64_t v21 = *(char **)(a1 + 8);
LABEL_17:
    unint64_t v22 = &__dst[4 * a5];
    uint64_t v23 = &v21[-4 * a5];
    unint64_t v24 = v21;
    if ((unint64_t)v23 < v10)
    {
      unint64_t v24 = v21;
      do
      {
        int v25 = *(_DWORD *)v23;
        v23 += 4;
        *(_DWORD *)unint64_t v24 = v25;
        v24 += 4;
      }

      while ((unint64_t)v23 < v10);
    }

    *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v24;
    if (v21 != v22) {
      memmove(&v21[-4 * ((v21 - v22) >> 2)], __dst, v21 - v22);
    }
    if (v19 != v6) {
      memmove(__dst, v6, v19 - v6);
    }
    return;
  }

  unint64_t v19 = &__src[4 * v18];
  int64_t v20 = a4 - v19;
  if (a4 != v19) {
    memmove(*(void **)(a1 + 8), &__src[4 * v18], a4 - v19);
  }
  uint64_t v21 = (char *)(v10 + v20);
  *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v10 + v20;
  if (v17 >= 1) {
    goto LABEL_17;
  }
}

void sub_10000E98C(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a1[1]) {
    BOOL v4 = (a1[1] & 1LL | *a1) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = v4;
  if (*a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v15.__val_ = 517LL;
    v15.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_100008914((uint64_t)exception, &v15);
  }

  int v7 = a3;
  if (a3 >= 1)
  {
    do
    {
      uint64_t v11 = 0LL;
      if (v7 >= 64) {
        uint64_t v12 = 64LL;
      }
      else {
        uint64_t v12 = v7;
      }
      do
      {
        *((float *)&v15.__val_ + v11) = (float)*(__int16 *)(a2 + 2 * v11);
        ++v11;
      }

      while (v12 != v11);
      sub_10000E748((uint64_t)a1, (uint64_t)&v15, v12, a4);
      a2 += 2 * v12;
      BOOL v13 = __OFSUB__(v7, (_DWORD)v12);
      v7 -= v12;
    }

    while (!((v7 < 0) ^ v13 | (v7 == 0)));
  }

void sub_10000EAB8(_Unwind_Exception *a1)
{
}

void sub_10000EAD4(void *a1, char *__src, int a3, uint64_t a4)
{
  if (a1[1]) {
    BOOL v4 = (a1[1] & 1LL | *a1) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = v4;
  if (*a1) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&__dst[0].__val_ = 517LL;
    __dst[0].__cat_ = (const std::error_category *)&off_10003CB20;
    sub_100008914((uint64_t)exception, __dst);
  }

  int v7 = a3;
  if (a3 >= 1)
  {
    do
    {
      if (v7 >= 64) {
        uint64_t v11 = 64LL;
      }
      else {
        uint64_t v11 = v7;
      }
      else {
        unsigned int v12 = v11;
      }
      memcpy(__dst, __src, 4LL * v12);
      sub_10000E748((uint64_t)a1, (uint64_t)__dst, v11, a4);
      __src += 4 * v11;
      BOOL v13 = __OFSUB__(v7, (_DWORD)v11);
      v7 -= v11;
    }

    while (!((v7 < 0) ^ v13 | (v7 == 0)));
  }

void sub_10000EBF8(_Unwind_Exception *a1)
{
}

void sub_10000EC18(std::error_category *a1)
{
}

const char *sub_10000EC2C()
{
  return "signature validation";
}

void *sub_10000EC38@<X0>(int a1@<W1>, void *a2@<X8>)
{
  if (a1 > 199)
  {
    switch(a1)
    {
      case 200:
        uint64_t v2 = "Invalid - Out of order peaks";
        break;
      case 201:
        uint64_t v2 = "Invalid - Peaks not sorted by time";
        break;
      case 202:
        uint64_t v2 = "Invalid - Duplicate peak found";
        break;
      case 203:
        uint64_t v2 = "Invalid - Sig header length less than last peak time";
        break;
      default:
        switch(a1)
        {
          case 300:
            uint64_t v2 = "Invalid - No audio in signature";
            break;
          case 301:
            uint64_t v2 = "Invalid - No peaks in signature";
            break;
          case 302:
            uint64_t v2 = "Invalid - Sig header has 0 length";
            break;
          case 303:
            uint64_t v2 = "Invalid - First peak and last peak less than 0.5 seconds apart";
            break;
          default:
            if (a1 == 400) {
              uint64_t v2 = "Invalid - Peak Density is too high";
            }
            else {
LABEL_51:
            }
              uint64_t v2 = "unknown";
            break;
        }

        break;
    }
  }

  else
  {
    switch(a1)
    {
      case 100:
        uint64_t v2 = "Unknown Error";
        break;
      case 101:
        uint64_t v2 = "Invalid - Zero byte sig";
        break;
      case 102:
        uint64_t v2 = "Invalid - Could not parse binary sig data";
        break;
      case 103:
        uint64_t v2 = "Invalid - Magic key doesn't match expected";
        break;
      case 104:
        uint64_t v2 = "Invalid - Sumo sig info block has the wrong size";
        break;
      case 105:
        uint64_t v2 = "Invalid - Sig smaller than smallest possible sig";
        break;
      case 106:
        uint64_t v2 = "Invalid - Unable to dump legacy sig";
        break;
      case 107:
        uint64_t v2 = "Invalid - Unable to dump sumo sig";
        break;
      case 108:
        uint64_t v2 = "Invalid - Unable to dump banded sig";
        break;
      case 109:
        uint64_t v2 = "Invalid - Number of Bands not equal between rv and bands";
        break;
      case 110:
        uint64_t v2 = "Invalid - Wrong number of bands.";
        break;
      case 111:
        uint64_t v2 = "Invalid - Size in start header not found";
        break;
      case 112:
        uint64_t v2 = "Invalid - Fp data header pkt size incorrect";
        break;
      case 113:
        uint64_t v2 = "Invalid - Leftover bytes smaller than EXT_HEADER_TYPE";
        break;
      case 114:
        uint64_t v2 = "Invalid - Malformed header chain";
        break;
      case 115:
        uint64_t v2 = "Invalid - no header to extract sumo peaks from";
        break;
      case 116:
        uint64_t v2 = "Invalid - Can only extract sumo peaks from a sumo signature";
        break;
      case 117:
        uint64_t v2 = "Invalid - no header to extract fat peaks from";
        break;
      case 118:
        uint64_t v2 = "Invalid - Can only extract fat peaks from a sumo/fat signature";
        break;
      case 119:
        uint64_t v2 = "Invalid - Unpacked sig has no header to extract peaks from";
        break;
      case 120:
        uint64_t v2 = "Invalid - Payload type of fat/sumo doesn't match sig header";
        break;
      case 121:
        uint64_t v2 = "Invalid - Unknown header error";
        break;
      case 122:
        uint64_t v2 = "Invalid - Legacy sig info missing";
        break;
      case 123:
        uint64_t v2 = "Invalid - Legacy sig info size mismatch";
        break;
      case 124:
        uint64_t v2 = "Invalid - Error decompressing signature, could not get header of each band";
        break;
      case 125:
        uint64_t v2 = "Invalid - Could not get ancient sig fp data header";
        break;
      case 126:
        uint64_t v2 = "Error when reducing density of the signature";
        break;
      case 127:
        uint64_t v2 = "Error when calculating freq curvature: non positive value";
        break;
      case 128:
        uint64_t v2 = "Error when calculating time curvature: negative value";
        break;
      case 129:
        uint64_t v2 = "Error when filling sumo patch: patch size must be 5";
        break;
      case 130:
        uint64_t v2 = "Error when filling sumo patch: invalid position into patch";
        break;
      case 131:
        uint64_t v2 = "Error when decoding sumo peaks: sumo peak too small";
        break;
      default:
        if (a1) {
          goto LABEL_51;
        }
        uint64_t v2 = "Success";
        break;
    }
  }

  return sub_10000606C(a2, v2);
}

void sub_10000EEC0(std::runtime_error *a1)
{
}

uint64_t sub_10000EED4(uint64_t a1, const std::error_code *a2, const void **a3)
{
  int v6 = *((char *)a3 + 23);
  if (v6 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v7)
  {
    unint64_t v8 = v7 + 1;
    if (v7 + 1 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_1000059F0();
    }
    if (v8 > 0x16)
    {
      uint64_t v10 = (v8 & 0xFFFFFFFFFFFFFFF8LL) + 8;
      if ((v8 | 7) != 0x17) {
        uint64_t v10 = v8 | 7;
      }
      uint64_t v11 = v10 + 1;
      uint64_t v9 = (char *)operator new(v10 + 1);
      v19.__r_.__value_.__l.__size_ = v7 + 1;
      v19.__r_.__value_.__l.__cap_ = v11 | 0x8000000000000000LL;
      v19.__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
    }

    else
    {
      memset(&v19, 0, sizeof(v19));
      v19.__r_.__value_.__s.__size_ = v7 + 1;
      if ((v8 & 0x80u) == 0LL) {
        uint64_t v9 = (char *)&v19;
      }
      else {
        uint64_t v9 = 0LL;
      }
    }

    if (v6 >= 0) {
      unsigned int v12 = a3;
    }
    else {
      unsigned int v12 = *a3;
    }
    memmove(v9, v12, v7);
    *(_WORD *)&v9[v7] = 32;
    std::string __p = v19;
  }

  std::error_code::message(&v19, a2);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type size = __p.__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  std::error_code v15 = std::string::insert(&v19, 0LL, (const std::string::value_type *)p_p, size);
  __int128 v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v18.__r_.__value_.__l.__cap_ = v15->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0LL;
  v15->__r_.__value_.__l.__cap_ = 0LL;
  v15->__r_.__value_.__r.__words[0] = 0LL;
  std::runtime_error::runtime_error((std::runtime_error *)a1, &v18);
  *(void *)a1 = &off_100038498;
  *(std::error_code *)(a1 + 16) = *a2;
  return a1;
}

void sub_10000F090( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *__p, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000F0DC(uint64_t a1, std::error_code *this)
{
  *(void *)a1 = &off_100038498;
  *(std::error_code *)(a1 + 16) = *this;
  return a1;
}

void sub_10000F144( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000F160(unint64_t a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  if (a1 == 2 && a2 == 2 || (a1 & 0xFFFFFFFFFFFFFFFBLL) == 0 && a2 != 2 || a1 != 2 && (a2 & 0xFFFFFFFFFFFFFFFBLL) == 0) {
    return 0LL;
  }
  *a3 = a1;
  *a4 = a2;
  if (a1 == 2)
  {
    unint64_t v5 = a2 - 1;
    if (a2 <= 1) {
      unint64_t v5 = a2 + 1;
    }
    *a4 = v5;
  }

  else
  {
    unint64_t v6 = *a3;
    if (a1 > 1) {
      unint64_t v7 = v6 - 1;
    }
    else {
      unint64_t v7 = v6 + 1;
    }
    *a3 = v7;
  }

  return 1LL;
}

uint64_t sub_10000F1E0(unsigned int a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0xD0) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  unint64_t v5 = 0LL;
  LODWORD(v3) = 0;
  unint64_t v22 = a1 / 0xD0uLL;
  uint64_t v6 = a2;
  uint64_t v23 = a2;
  do
  {
    unint64_t v7 = (unsigned int *)(a2 + 208 * v4);
    unint64_t v8 = *v7;
    if (v5 > v8)
    {
      sub_10000575C(&std::cerr, (uint64_t)"\nError: time must be greater or equal than previous_time.\n", 58LL);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "time must be greater or equal than previous_time.");
    }

    uint64_t v9 = a3 + v3;
    unsigned int v10 = v8 - v5;
    if (v10 > 0xFE)
    {
      *(_DWORD *)(v9 + 1) = v10;
      unsigned int v11 = 5;
      LOBYTE(v10) = -1;
    }

    else
    {
      unsigned int v11 = 1;
    }

    unint64_t v12 = 0LL;
    unsigned int v13 = 0;
    *(_BYTE *)uint64_t v9 = v10;
    *(_WORD *)(v9 + v11) = *((_WORD *)v7 + 2);
    *(_WORD *)(v9 + (v11 | 2LL)) = *((_WORD *)v7 + 3);
    uint64_t v25 = v11 + 4LL;
    uint64_t v14 = v9 + v25;
    uint64_t v15 = v6;
    do
    {
      for (unint64_t i = 0LL; i != 5; ++i)
      {
        if (sub_10000F160(v12, i, &v27, &v26))
        {
          uint64_t v17 = v15 + 4 * i;
          std::string v18 = (_WORD *)(v14 + v13);
          *std::string v18 = (int)fmaxf( fminf((float)((float)(*(float *)(v17 + 8) + 65536.0) * 0.0000076294) * 65536.0, 65535.0),  0.0);
          v18[1] = (int)fmaxf(fminf((float)((float)(*(float *)(v17 + 108) + 3.1416) / 6.2832) * 65536.0, 65535.0), 0.0);
          int v19 = 4;
        }

        else
        {
          int v19 = 0;
        }

        v13 += v19;
      }

      ++v12;
      v15 += 20LL;
    }

    while (v12 != 5);
    uint64_t v3 = v13 + v25 + v3;
    unint64_t v5 = *v7;
    ++v4;
    v6 += 208LL;
    a2 = v23;
  }

  while (v4 != v22);
  return v3;
}

void sub_10000F40C(_Unwind_Exception *a1)
{
}

float sub_10000F420( int a1, unsigned int a2, void *a3, _DWORD *a4, _WORD *a5, _WORD *a6, _WORD *a7, _WORD *a8)
{
  __int16 v13 = a2;
  uint64_t v15 = a3[2];
  float v16 = fmaxf(*(float *)(v15 + 4LL * a2), 0.015625);
  float v17 = fmaxf(*(float *)(v15 + 4LL * (a2 + 1)), 0.015625);
  float v18 = fmaxf(*(float *)(a3[1] + 4LL * a2), 0.015625);
  float v19 = fmaxf(*(float *)(a3[3] + 4LL * a2), 0.015625);
  float v20 = (float)(logf(fmaxf(*(float *)(v15 + 4LL * (a2 - 1)), 0.015625)) + 4.1589) * 1477.3;
  float v21 = (float)(logf(v16) + 4.1589) * 1477.3;
  float v22 = (float)(logf(v17) + 4.1589) * 1477.3;
  float v23 = logf(v18);
  float v24 = logf(v19);
  float v25 = -(float)((float)(v20 + v22) - (float)(v21 * 2.0));
  if (v25 <= 0.0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v29.__val_ = 127LL;
    v29.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v29);
    goto LABEL_6;
  }

  if (v26 < 0.0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v29.__val_ = 128LL;
    v29.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v29);
LABEL_6:
  }

  *a4 = a1;
  *a6 = (int)v21;
  *a5 = (int)(float)((float)((float)(v22 - v20) * 32.0) / v25) + (v13 << 6);
  float result = v26 + v26;
  *a7 = (int)v25;
  *a8 = (int)result;
  return result;
}

void sub_10000F5F8(_Unwind_Exception *a1)
{
}

void *sub_10000F610(unint64_t a1)
{
  if (a1 >= 0x3333333333333334LL) {
    sub_10000612C();
  }
  return operator new(5 * a1);
}

_DWORD *sub_10000F64C(const void *a1, uint64_t a2)
{
  size_t v3 = a2 - (void)a1;
  uint64_t v4 = operator new[]((a2 - (void)a1) & 0xFFFFFFF0LL);
  memcpy(v4, a1, v3);
  float result = operator new(0x20uLL);
  _DWORD *result = 1610874935;
  result[1] = v3;
  *((void *)result + 2) = v4;
  *((void *)result + 3) = 0LL;
  *((_BYTE *)result + std::ostream::~ostream(v2, v3 + 8) = 1;
  return result;
}

_DWORD *sub_10000F6AC(const void *a1, uint64_t a2)
{
  size_t v3 = a2 - (void)a1;
  uint64_t v4 = operator new[]((a2 - (void)a1) & 0xFFFFFFFCLL);
  memcpy(v4, a1, v3);
  float result = operator new(0x20uLL);
  _DWORD *result = 1610759808;
  result[1] = v3;
  *((void *)result + 2) = v4;
  *((void *)result + 3) = 0LL;
  *((_BYTE *)result + std::ostream::~ostream(v2, v3 + 8) = 1;
  return result;
}

void **sub_10000F70C(uint64_t *a1, unint64_t a2, int a3, unint64_t a4)
{
  uint64_t v57 = 0LL;
  uint64_t v58 = 0LL;
  uint64_t v59 = 0LL;
  sub_100005E64((uint64_t)&v57, a4);
  sub_10000FAE4(a1, &v57, a2, a3, v7);
  unint64_t v8 = 0LL;
  unint64_t v60 = 0LL;
  uint64_t v9 = v57;
  if (0xAAAAAAAAAAAAAAABLL * ((v58 - v57) >> 3) - 5 >= 0xFFFFFFFFFFFFFFFELL && v58 != v57)
  {
    unsigned int v11 = 0LL;
    unint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t v14 = &v60;
    do
    {
      uint64_t v15 = (uint64_t *)(v9 + 24 * v13);
      uint64_t v17 = *v15;
      uint64_t v16 = v15[1];
      uint64_t v18 = v16 - *v15;
      uint64_t v53 = v14;
      uint64_t v54 = v13;
      if (v16 == *v15)
      {
        float v26 = v11;
      }

      else
      {
        uint64_t v56 = *v15;
        if (0xCCCCCCCCCCCCCCCDLL * (v12 - v11) < v18 >> 2)
        {
          if (v18 < 0) {
            sub_100006118();
          }
          float v20 = (char *)sub_10000F610(v18 >> 2);
          unint64_t v12 = &v20[5 * v19];
          if (v11)
          {
            float v21 = v11;
            float v22 = &v20[5 * v19];
            operator delete(v21);
            unint64_t v12 = v22;
          }

          unsigned int v11 = v20;
          uint64_t v17 = v56;
        }

        unsigned int v23 = 0;
        unint64_t v24 = 0LL;
        unint64_t v25 = v18 >> 3;
        float v26 = v11;
        uint64_t v55 = v18 >> 3;
        do
        {
          unsigned int v27 = v23;
          unsigned int v23 = *(_DWORD *)(v17 + 8 * v24);
          char v28 = v23 - v27;
          if (v23 - v27 >= 0xFF)
          {
            unsigned int v31 = v23 >> 8;
            unsigned int v32 = HIWORD(v23);
            char v28 = -1;
            unsigned int v30 = *(_DWORD *)(v17 + 8 * v24);
            unsigned int v33 = HIBYTE(v23);
          }

          else
          {
            uint64_t v29 = v17 + 8 * v24;
            unsigned int v30 = *(unsigned __int16 *)(v29 + 6);
            unsigned int v31 = v30 >> 8;
            unsigned int v32 = *(unsigned __int16 *)(v29 + 4);
            unsigned int v33 = v32 >> 8;
            ++v24;
          }

          if (v26 >= v12)
          {
            unint64_t v34 = 0xCCCCCCCCCCCCCCCDLL * (v26 - v11) + 1;
            if (v34 >= 0x3333333333333334LL) {
              sub_100006118();
            }
            if (0x999999999999999ALL * (v12 - v11) > v34) {
              unint64_t v34 = 0x999999999999999ALL * (v12 - v11);
            }
            if (0xCCCCCCCCCCCCCCCDLL * (v12 - v11) >= 0x1999999999999999LL) {
              unint64_t v35 = 0x3333333333333333LL;
            }
            else {
              unint64_t v35 = v34;
            }
            if (v35) {
              unint64_t v35 = (unint64_t)sub_10000F610(v35);
            }
            else {
              uint64_t v36 = 0LL;
            }
            unint64_t v37 = (char *)(v35 + v26 - v11);
            char *v37 = v28;
            v37[1] = v30;
            v37[2] = v31;
            v37[3] = v32;
            v37[4] = v33;
            unint64_t v38 = v37;
            while (v26 != v11)
            {
              int v39 = *(_DWORD *)(v26 - 5);
              v26 -= 5;
              char v40 = v26[4];
              *(_DWORD *)(v38 - 5) = v39;
              v38 -= 5;
              v38[4] = v40;
            }

            unint64_t v12 = (char *)(v35 + 5 * v36);
            float v26 = v37 + 5;
            if (v11)
            {
              uint64_t v41 = v11;
              uint64_t v42 = v12;
              operator delete(v41);
              unint64_t v12 = v42;
            }

            unsigned int v11 = v38;
            unint64_t v25 = v55;
            uint64_t v17 = v56;
          }

          else
          {
            *float v26 = v28;
            v26[1] = v30;
            v26[2] = v31;
            v26[3] = v32;
            v26[4] = v33;
            v26 += 5;
          }
        }

        while (v24 < v25);
      }

      unint64_t v43 = v12;
      int64_t v44 = v26 - v11;
      size_t v45 = ((_DWORD)v26 - (_DWORD)v11 + 3) & 0xFFFFFFFC;
      uint64_t v46 = (char *)operator new[](v45);
      bzero(v46, v45);
      if (v26 - v11 < v45) {
        bzero(&v46[v44], &v11[v45] - v26);
      }
      if (v26 != v11)
      {
        uint64_t v47 = v44 / 5;
        uint64_t v48 = v11;
        __int128 v49 = v46;
        do
        {
          int v50 = *(_DWORD *)v48;
          v49[4] = v48[4];
          *(_DWORD *)__int128 v49 = v50;
          v49 += 5;
          v48 += 5;
          --v47;
        }

        while (v47);
      }

      uint64_t v51 = (char *)operator new(0x20uLL);
      *(_DWORD *)uint64_t v51 = v13 + 1610809408;
      *((_DWORD *)v51 + 1) = v44;
      *((void *)v51 + 2) = v46;
      *((void *)v51 + 3) = 0LL;
      v51[8] = 1;
      void *v53 = (void **)v51;
      ++v13;
      uint64_t v9 = v57;
      uint64_t v14 = (void ***)(v51 + 24);
      unint64_t v12 = v43;
    }

    while (v54 + 1 < 0xAAAAAAAAAAAAAAABLL * ((v58 - v57) >> 3));
    unint64_t v8 = v60;
    if (v11) {
      operator delete(v11);
    }
  }

  unint64_t v60 = (void **)&v57;
  sub_10000AA7C(&v60);
  return v8;
}

void sub_10000FAA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)&a13;
  sub_10000AA7C(&a16);
  _Unwind_Resume(a1);
}

void sub_10000FAE4(uint64_t *a1, uint64_t *a2, unint64_t a3, int a4, float a5)
{
  uint64_t v5 = -45LL;
  if (!a4) {
    uint64_t v5 = 0LL;
  }
  unint64_t v81 = v5;
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - *a2) >> 3) - 3 >= 2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v82.__val_ = 110LL;
    v82.__cat_ = (const std::error_category *)&off_10003CB28;
    sub_10000F0DC((uint64_t)exception, &v82);
  }

  unint64_t v8 = a3;
  unsigned int v10 = a1;
  unsigned int v11 = 0LL;
  if (v6 == v7)
  {
    uint64_t v7 = a2[1];
  }

  else
  {
    unint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    unint64_t v14 = 0LL;
    do
    {
      if (v12 >= v13)
      {
        uint64_t v16 = (v12 - v11) >> 2;
        unint64_t v17 = v16 + 1;
        if ((v13 - v11) >> 1 > v17) {
          unint64_t v17 = (v13 - v11) >> 1;
        }
        else {
          unint64_t v18 = v17;
        }
        if (v18)
        {
          if (v18 >> 62) {
            sub_10000612C();
          }
          uint64_t v19 = (char *)operator new(4 * v18);
          unsigned int v10 = a1;
        }

        else
        {
          uint64_t v19 = 0LL;
        }

        float v20 = &v19[4 * v16];
        *(_DWORD *)float v20 = 0;
        uint64_t v15 = v20 + 4;
        while (v12 != v11)
        {
          int v21 = *((_DWORD *)v12 - 1);
          v12 -= 4;
          *((_DWORD *)v20 - 1) = v21;
          v20 -= 4;
        }

        uint64_t v13 = &v19[4 * v18];
        if (v11)
        {
          operator delete(v11);
          unsigned int v10 = a1;
          uint64_t v7 = *a2;
          uint64_t v6 = a2[1];
        }

        unsigned int v11 = v20;
        unint64_t v8 = a3;
      }

      else
      {
        *(_DWORD *)unint64_t v12 = 0;
        uint64_t v15 = v12 + 4;
      }

      ++v14;
      unint64_t v12 = v15;
    }

    while (v14 < 0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3));
  }

  uint64_t v22 = *v10;
  uint64_t v23 = v10[1];
  if (v23 != *v10)
  {
    unint64_t v24 = 0LL;
    uint64_t v25 = 0LL;
    do
    {
      float v26 = (unsigned int *)(v22 + 8 * v24);
      unint64_t v27 = *v26;
      v81 += 256LL;
      if (v81 > v27)
      {
        do
        {
          if (v25 > (uint64_t)v27)
          {
            uint64_t v76 = __cxa_allocate_exception(0x20uLL);
            *(void *)&v82.__val_ = 201LL;
            v82.__cat_ = (const std::error_category *)&off_10003CB28;
            sub_10000F0DC((uint64_t)v76, &v82);
          }

          uint64_t v28 = *a2;
          unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3);
          if (v29 - 3 >= 2)
          {
            uint64_t v77 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(v77, "Wrong number of bands.");
          }

          uint64_t v30 = 0LL;
          LOWORD(a5) = *((_WORD *)v26 + 2);
          a5 = (float)((float)LODWORD(a5) * 7.8125) * 0.015625;
          while (a5 >= flt_100035140[v30])
          {
            if (++v30 > v29)
            {
              if (a5 != flt_100035140[0xEAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3)]) {
                goto LABEL_71;
              }
              uint64_t v31 = v28 + 8 * ((a2[1] - *a2) >> 3);
              unint64_t v34 = *(void *)(v31 - 8);
              unsigned int v33 = (void *)(v31 - 8);
              unint64_t v32 = v34;
              unint64_t v35 = (void **)(v33 - 1);
              uint64_t v36 = (void *)*(v33 - 1);
              if ((unint64_t)v36 >= v34)
              {
                unint64_t v37 = (void **)(v33 - 2);
                uint64_t v38 = *(v33 - 2);
                uint64_t v39 = ((uint64_t)v36 - v38) >> 3;
                if (!((unint64_t)(v39 + 1) >> 61))
                {
                  uint64_t v40 = v32 - v38;
                  uint64_t v41 = v40 >> 2;
                  else {
                    unint64_t v42 = v41;
                  }
                  if (v42) {
                    unint64_t v42 = (unint64_t)sub_10000C61C(v42);
                  }
                  else {
                    uint64_t v43 = 0LL;
                  }
                  uint64_t v52 = (void *)(v42 + 8 * v39);
                  void *v52 = *(void *)v26;
                  uint64_t v47 = v52 + 1;
                  uint64_t v53 = (char *)*v35;
                  uint64_t v56 = (char *)*v37;
                  if (*v35 != *v37)
                  {
                    unint64_t v8 = a3;
                    do
                    {
                      uint64_t v57 = *((void *)v53 - 1);
                      v53 -= 8;
                      *--uint64_t v52 = v57;
                    }

                    while (v53 != v56);
                    goto LABEL_65;
                  }

LABEL_66:
                  unint64_t v8 = a3;
                  goto LABEL_67;
                }

LABEL_96:
                sub_100006118();
              }

LABEL_47:
              *uint64_t v36 = *(void *)v26;
              uint64_t v47 = v36 + 1;
              goto LABEL_70;
            }
          }

          if (!v30) {
            goto LABEL_71;
          }
          uint64_t v44 = v28 + 24 * v30;
          unint64_t v46 = *(void *)(v44 - 8);
          unsigned int v33 = (void *)(v44 - 8);
          unint64_t v45 = v46;
          unint64_t v35 = (void **)(v33 - 1);
          uint64_t v36 = (void *)*(v33 - 1);
          unint64_t v37 = (void **)(v33 - 2);
          uint64_t v48 = *(v33 - 2);
          uint64_t v49 = ((uint64_t)v36 - v48) >> 3;
          uint64_t v50 = v45 - v48;
          uint64_t v51 = v50 >> 2;
          else {
            unint64_t v42 = v51;
          }
          if (v42) {
            unint64_t v42 = (unint64_t)sub_10000C61C(v42);
          }
          else {
            uint64_t v43 = 0LL;
          }
          uint64_t v52 = (void *)(v42 + 8 * v49);
          void *v52 = *(void *)v26;
          uint64_t v47 = v52 + 1;
          uint64_t v53 = (char *)*v35;
          uint64_t v54 = (char *)*v37;
          if (*v35 == *v37) {
            goto LABEL_66;
          }
          unint64_t v8 = a3;
          do
          {
            uint64_t v55 = *((void *)v53 - 1);
            v53 -= 8;
            *--uint64_t v52 = v55;
          }

          while (v53 != v54);
LABEL_65:
          uint64_t v53 = (char *)*v37;
LABEL_67:
          char *v37 = v52;
          *unint64_t v35 = v47;
          void *v33 = v42 + 8 * v43;
          if (v53) {
            operator delete(v53);
          }
          unsigned int v10 = a1;
LABEL_70:
          *unint64_t v35 = v47;
LABEL_71:
          uint64_t v22 = *v10;
          uint64_t v23 = v10[1];
          uint64_t v25 = *(unsigned int *)(*v10 + 8 * v24++);
          if (v24 >= (v23 - *v10) >> 3) {
            break;
          }
          float v26 = (unsigned int *)(v22 + 8 * v24);
          unint64_t v27 = *v26;
        }

        while (v81 > v27);
        uint64_t v7 = *a2;
        uint64_t v6 = a2[1];
      }

      if (v6 == v7)
      {
        uint64_t v6 = v7;
      }

      else
      {
        uint64_t v58 = 0LL;
        unint64_t v59 = 0LL;
        do
        {
          uint64_t v61 = *(void *)(v7 + v58);
          unint64_t v60 = *(uint64_t **)(v7 + v58 + 8);
          unint64_t v62 = (unint64_t)v60 - v61;
          unint64_t v63 = ((uint64_t)v60 - v61) >> 3;
          unint64_t v64 = *(unsigned int *)&v11[4 * v59];
          BOOL v65 = v63 >= v64;
          unint64_t v66 = v63 - v64;
          if (!v65)
          {
            uint64_t v75 = __cxa_allocate_exception(0x20uLL);
            *(void *)&v82.__val_ = 126LL;
            v82.__cat_ = (const std::error_category *)&off_10003CB28;
            sub_10000F0DC((uint64_t)v75, &v82);
          }

          if (v8 && v66 > v8)
          {
            uint64_t v67 = v61 + 8LL * (int)v64;
            unint64_t v68 = 126 - 2 * __clz(((uint64_t)v60 - v67) >> 3);
            *(void *)&v82.__val_ = sub_10000ACA4;
            else {
              uint64_t v69 = v68;
            }
            sub_10000ACCC(v67, v60, (uint64_t (**)(uint64_t *, uint64_t *))&v82, v69, 1);
            sub_10000DC24((char **)(*a2 + v58), *(unsigned int *)&v11[4 * v59] + v8);
            uint64_t v70 = (void *)(*a2 + v58);
            uint64_t v71 = (unsigned int *)v70[1];
            uint64_t v72 = *v70 + 8LL * *(int *)&v11[4 * v59];
            unint64_t v73 = 126 - 2 * __clz(((uint64_t)v71 - v72) >> 3);
            else {
              uint64_t v74 = v73;
            }
            sub_10000B47C(v72, v71, v74, 1);
            uint64_t v7 = *a2;
            uint64_t v6 = a2[1];
            unint64_t v62 = *(void *)(*a2 + v58 + 8) - *(void *)(*a2 + v58);
          }

          *(_DWORD *)&v11[4 * v59++] = v62 >> 3;
          v58 += 24LL;
        }

        while (v59 < 0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3));
        unsigned int v10 = a1;
        uint64_t v22 = *a1;
        uint64_t v23 = a1[1];
      }
    }

    while (v24 < (v23 - v22) >> 3);
  }

  if (v11) {
    operator delete(v11);
  }
}

void sub_1000100FC(_Unwind_Exception *a1)
{
}

void sub_10001016C(void **a1, unint64_t a2)
{
  if (a2 > ((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_100006118();
    }
    int64_t v3 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    uint64_t v4 = (char *)sub_10000C61C(a2);
    uint64_t v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF8LL];
    uint64_t v7 = &v4[8 * v6];
    uint64_t v9 = (char *)*a1;
    unint64_t v8 = (char *)a1[1];
    unsigned int v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        uint64_t v11 = *((void *)v8 - 1);
        v8 -= 8;
        *((void *)v10 - 1) = v11;
        v10 -= 8;
      }

      while (v8 != v9);
      unint64_t v8 = (char *)*a1;
    }

    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8) {
      operator delete(v8);
    }
  }

uint64_t sub_100010200(int *a1, unint64_t a2)
{
  if ((a2 & 3) != 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Checksum Alignment Error");
  }

  if (a2 < 4) {
    return 0LL;
  }
  LODWORD(v2) = 0;
  unint64_t v3 = a2 >> 2;
  do
  {
    int v4 = *a1++;
    uint64_t v2 = (v4 + v2);
    --v3;
  }

  while (v3);
  return v2;
}

void sub_10001027C(_Unwind_Exception *a1)
{
}

uint64_t sub_100010290(uint64_t a1)
{
  *(void *)(a1 + 32) = 0LL;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  uint64_t v2 = operator new[](0x200CuLL);
  *(void *)(a1 + 40) = v2;
  *(void *)(a1 + 4std::ostream::~ostream(v2, v3 + 8) = ((unint64_t)v2 + 12) & 0xFFFFFFFFFFFFFFF0LL;
  bzero(v2, 0x200CuLL);
  unint64_t v3 = operator new[](0x200CuLL);
  *(void *)(a1 + 56) = v3;
  *(void *)(a1 + 64) = ((unint64_t)v3 + 12) & 0xFFFFFFFFFFFFFFF0LL;
  bzero(v3, 0x200CuLL);
  int v4 = operator new[](0x201CuLL);
  *(void *)(a1 + 72) = v4;
  *(void *)(a1 + 80) = ((unint64_t)v4 + 12) & 0xFFFFFFFFFFFFFFF0LL;
  bzero(v4, 0x201CuLL);
  *(void *)(a1 + 96) = -1LL;
  *(void *)(a1 + 104) = 0LL;
  *(void *)(a1 + 8560) = a1 + 112;
  unint64_t v5 = (a1 + 143) & 0xFFFFFFFFFFFFFFE0LL;
  if (v5 - (a1 + 112) - 6401 < 0xFFFFFFFFFFFFDEFFLL || (*(void *)(a1 + 8560) = v5) == 0LL)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Unable to align fft buffer");
  }

  uint64_t v6 = operator new(0x20uLL);
  *uint64_t v6 = off_100038370;
  v6[1] = vDSP_create_fftsetup(0xBuLL, 0);
  v6[2] = operator new[](0x1004uLL);
  v6[3] = operator new[](0x1004uLL);
  uint64_t v7 = *(void *)(a1 + 104);
  *(void *)(a1 + 104) = v6;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 24LL))(v7);
  }
  bzero(*(void **)(a1 + 40), 0x200CuLL);
  bzero(*(void **)(a1 + 72), 0x201CuLL);
  *(void *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = 0LL;
  *(_DWORD *)(a1 + 856std::ostream::~ostream(v2, v3 + 8) = 0;
  unint64_t v8 = *(void **)(a1 + 16);
  if (v8) {
    bzero(v8, (unint64_t)*(unsigned int *)(a1 + 36) << (12 - *(_BYTE *)(a1 + 24)));
  }
  return a1;
}

void sub_100010420(_Unwind_Exception *exception_object)
{
  uint64_t v3 = v1[13];
  v1[13] = 0LL;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 24LL))(v3);
  }
  int v4 = (void *)v1[9];
  if (v4) {
    operator delete[](v4);
  }
  unint64_t v5 = (void *)v1[7];
  if (v5) {
    operator delete[](v5);
  }
  uint64_t v6 = (void *)v1[5];
  if (v6) {
    operator delete[](v6);
  }
  _Unwind_Resume(exception_object);
}

float sub_1000104A0(void *a1)
{
  if (a1[12] != -1LL)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v6.__val_ = 503LL;
    v6.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_100008914((uint64_t)exception, &v6);
  }

  int v1 = 0;
  a1[12] = a1[11];
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[8];
  do
  {
    float result = *(float *)(v2 + 4LL * (v1 & 0x7FF));
    *(float *)(v3 + 4LL * (v1++ & 0x7FF)) = result;
  }

  while (v1 != 2051);
  return result;
}

void sub_100010534(_Unwind_Exception *a1)
{
}

void sub_100010548(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 96);
  if (v1 == -1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    *(void *)&v6.__val_ = 504LL;
    v6.__cat_ = (const std::error_category *)&off_10003CB20;
    sub_100008914((uint64_t)exception, &v6);
  }

  int v2 = 0;
  *(void *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = v1;
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 48);
  do
  {
    *(_DWORD *)(v4 + 4LL * (v2 & 0x7FF)) = *(_DWORD *)(v3 + 4LL * (v2 & 0x7FF));
    ++v2;
  }

  while (v2 != 2051);
  *(void *)(a1 + 96) = -1LL;
  bzero(*(void **)(a1 + 56), 0x200CuLL);
}

void sub_1000105E8(_Unwind_Exception *a1)
{
}

void sub_1000105FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 88);
  do
  {
    *(_DWORD *)(v6 + 4LL * (((_WORD)v7 + (_WORD)v5) & 0x7FF)) = *(_DWORD *)(a2 + 4 * v5);
    ++v5;
  }

  while (v5 != 128);
  uint64_t v8 = 0LL;
  uint64_t v9 = v7 + 128;
  *(void *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = v9;
  uint64_t v10 = *(void *)(a1 + 80);
  do
  {
    *(_DWORD *)(v10 + 4 * vstd::ostream::~ostream(v2, v3 + 8) = *(_DWORD *)(v6 + 4LL * (((_WORD)v9 + (_WORD)v8) & 0x7FF));
    ++v8;
  }

  while (v8 != 2048);
  uint64_t v11 = 0LL;
  uint64_t v12 = *(void *)(a1 + 8560);
  do
  {
    *(float *)(v12 + v11 * 4) = *(float *)(v10 + v11 * 4) * *(float *)&dword_100014D30[v11];
    ++v11;
  }

  while (v11 != 2048);
  (***(void (****)(void))(a1 + 104))(*(void *)(a1 + 104));
  for (uint64_t i = 0LL; i != 1025; ++i)
  {
    float v14 = *(float *)(a3 + 4 * i);
    if (v14 <= 1.0e-10) {
      float v14 = 1.0e-10;
    }
    *(float *)(a3 + 4 * i) = v14;
  }

  uint64_t v15 = *(void *)(a1 + 16);
  if (v15 && (*(_DWORD *)(a1 + 8568) & ~(-1 << *(_DWORD *)(a1 + 28))) == 0)
  {
    unsigned int v16 = *(_DWORD *)(a1 + 32);
    unsigned int v17 = *(_DWORD *)(a1 + 24);
    if (v17 <= 0xA)
    {
      uint64_t v18 = 0LL;
      uint64_t v19 = v15 + 4LL * (((*(_DWORD *)(a1 + 36) - 1) & v16) << (10 - v17));
      do
      {
        uint64_t v20 = 0LL;
        float v21 = 0.0;
        do
          float v21 = v21 + (float)(logf(*(float *)(a3 + 4 * v20++) + 1.0) * 1477.3);
        while (1LL << v17 != v20);
        *(_DWORD *)(v19 + 4 * v18++) = (int)v21 >> v17;
        a3 += 4 * (1LL << v17);
      }

      while (v18 != 0x401u >> v17);
      unsigned int v16 = *(_DWORD *)(a1 + 32);
    }

    *(_DWORD *)(a1 + 32) = v16 + 1;
  }

  ++*(_DWORD *)(a1 + 8568);
}

uint64_t sub_1000107DC(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *(void *)a1;
  if (!result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error( exception,  "Can't write a sig without keeping the header.  When constructing the unpacked sig, make sure keepHeader is True!!");
    goto LABEL_87;
  }

  int v5 = *(_DWORD *)(a1 + 8);
  if (v5 == 1)
  {
    uint64_t v12 = sub_100008374(result, 0x60020000u);
    if (!v12)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Can't write a fat sig without a fat fp data header.");
      goto LABEL_87;
    }

    uint64_t v13 = (void *)sub_100008224(v12);
    operator delete(v13);
    uint64_t v14 = *(void *)a1;
    if (!*(void *)a1) {
      goto LABEL_48;
    }
    uint64_t v15 = (uint64_t *)a1;
    do
    {
      if (*(_DWORD *)v14 == 1342177281)
      {
        *uint64_t v15 = *(void *)(v14 + 24);
        *(void *)(v14 + 24) = 0LL;
        unsigned int v16 = (void *)sub_100008224(v14);
        operator delete(v16);
      }

      else
      {
        uint64_t v15 = (uint64_t *)(v14 + 24);
      }

      uint64_t v14 = *v15;
    }

    while (*v15);
    uint64_t v17 = *(void *)a1;
    if (!*(void *)a1)
    {
LABEL_48:
      unsigned int v19 = 8;
LABEL_49:
      unint64_t v34 = v19 + 48LL;
      unint64_t v35 = *a2;
      unint64_t v36 = a2[1] - *a2;
      if (v34 <= v36)
      {
        if (v34 < v36) {
          a2[1] = v35 + v34;
        }
      }

      else
      {
        sub_100010DF8(a2, v34 - v36);
        unint64_t v35 = *a2;
      }

      uint64_t v37 = 0LL;
      unsigned int v38 = *(_DWORD *)(a1 + 36);
      uint64_t v39 = dword_100014CBC;
      while (1)
      {
        int v40 = *v39;
        v39 += 2;
        if (v40 == (HIWORD(v38) & 0xF)) {
          break;
        }
        if (++v37 == 4)
        {
          int v41 = 0;
          goto LABEL_58;
        }
      }

      int v41 = dword_100014CBC[2 * v37 + 1];
LABEL_58:
      uint64_t v42 = 0LL;
      int v43 = *(_DWORD *)(a1 + 20);
      uint64_t v44 = &dword_100014C88;
      while (1)
      {
        int v45 = *v44;
        v44 += 2;
        if (v45 == v41) {
          break;
        }
        if (++v42 == 7)
        {
          unsigned int v46 = 0x80000000;
          goto LABEL_63;
        }
      }

      unsigned int v46 = (dword_100014C84[2 * v42] << 27) | 0x80000000;
LABEL_63:
      int v47 = *(_DWORD *)(a1 + 24);
      int v48 = *(unsigned __int8 *)(a1 + 28);
      int v49 = *(_DWORD *)(a1 + 32);
      *(void *)unint64_t v35 = 0xFACADE99CAFE2580LL;
      *(_DWORD *)(v35 + 12) = v43;
      *(void *)(v35 + 16) = 0LL;
      *(_DWORD *)(v35 + 24) = 0;
      *(_DWORD *)(v35 + 2std::ostream::~ostream(v2, v3 + 8) = v46;
      *(_DWORD *)(v35 + 32) = v47;
      *(_DWORD *)(v35 + 36) = v48;
      *(_DWORD *)(v35 + 40) = v49;
      *(_DWORD *)(v35 + 44) = (unsigned __int16)v38 | (HIBYTE(v38) << 19) | 0x20000;
      *(_DWORD *)(v35 + std::ostream::~ostream(v2, v3 + 8) = v19;
      sub_1000086CC(*(int **)a1, (_DWORD *)(*a2 + 48));
      uint64_t result = crc32(dword_10003CBFC, (const Bytef *)(v35 + 8), v19 + 40);
      *(_DWORD *)(v35 + 4) = result;
      *(_DWORD *)(v35 + 12) = *(_DWORD *)(a1 + 20);
      return result;
    }

    int v18 = 0;
    unsigned int v19 = 8;
    while (*(_DWORD *)v17 == v18 || (unsigned __int16)*(_DWORD *)v17 == 0)
    {
LABEL_33:
      uint64_t v17 = *(void *)(v17 + 24);
      if (!v17) {
        goto LABEL_49;
      }
    }

    v19 += 8;
    int v18 = *(_DWORD *)v17;
LABEL_32:
    v19 += (*(_DWORD *)(v17 + 4) + 3) & 0xFFFFFFFC;
    goto LABEL_33;
  }

  if (v5 != 2)
  {
    if (v5 != 4) {
      return result;
    }
    uint64_t v6 = sub_100008374(result, 0x60040000u);
    if (v6)
    {
      uint64_t v7 = (void *)sub_100008224(v6);
      operator delete(v7);
      uint64_t v8 = *(int **)a1;
      if (*(void *)a1)
      {
        int v9 = 0;
        int v10 = 8;
        while (*v8 == v9 || (unsigned __int16)*v8 == 0)
        {
LABEL_15:
          uint64_t v8 = (int *)*((void *)v8 + 3);
          if (!v8) {
            goto LABEL_71;
          }
        }

        v10 += 8;
        int v9 = *v8;
LABEL_14:
        v10 += (v8[1] + 3) & 0xFFFFFFFC;
        goto LABEL_15;
      }

      int v10 = 8;
LABEL_71:
      uint64_t v55 = v10 + 1431655832 * ((*(void *)(a1 + 48) - *(void *)(a1 + 40)) >> 3);
      unint64_t v56 = *a2;
      unint64_t v57 = a2[1] - *a2;
      if (v55 + 28 <= v57)
      {
        if (v55 + 28 < v57) {
          a2[1] = v56 + v55 + 28;
        }
      }

      else
      {
        sub_100010DF8(a2, v55 + 28 - v57);
        unint64_t v56 = *a2;
      }

      __int128 v58 = *(_OWORD *)(a1 + 12);
      *(_OWORD *)(v56 + 12) = *(_OWORD *)(a1 + 24);
      *(_OWORD *)unint64_t v56 = v58;
      unsigned int v59 = sub_1000086CC(*(int **)a1, (_DWORD *)(*a2 + 28));
      if (v59 <= v55)
      {
        unsigned int v60 = v59;
        unint64_t v61 = v59 + 28LL;
        unint64_t v62 = a2[1] - *a2;
        if (v61 <= v62)
        {
          if (v61 < v62) {
            a2[1] = *a2 + v61;
          }
        }

        else
        {
          sub_100010DF8(a2, v61 - v62);
        }

        uint64_t result = crc32(dword_10003CBFC, (const Bytef *)(v56 + 8), v60 + 20);
        *(_DWORD *)(v56 + 4) = result;
        return result;
      }

      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Sumo sig is larger than expected!");
    }

    else
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Can't write a sumo sig without a sumo fp data header.");
    }

LABEL_87:
  }

  uint64_t v21 = sub_100008374(result, 0x60030000u);
  if (!v21)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Can't write a normal sig without a normal fp data header.");
    goto LABEL_87;
  }

  uint64_t v22 = (void *)sub_100008224(v21);
  operator delete(v22);
  uint64_t v23 = *(void *)a1;
  if (*(void *)a1)
  {
    unint64_t v24 = *(int **)a1;
    while (*v24 != 1342177281)
    {
      unint64_t v24 = (int *)*((void *)v24 + 3);
      if (!v24) {
        goto LABEL_40;
      }
    }
  }

  else
  {
LABEL_40:
    uint64_t v25 = (char *)operator new[](0x18uLL);
    *(void *)(v25 + 4) = 0LL;
    *((_DWORD *)v25 + 3) = 0;
    *(_DWORD *)uint64_t v25 = -559038737;
    *((void *)v25 + 2) = 0x427000000000000FLL;
    float v26 = operator new(0x20uLL);
    *float v26 = 0x1850000001LL;
    v26[2] = v25;
    v26[3] = 0LL;
    *((_BYTE *)v26 + std::ostream::~ostream(v2, v3 + 8) = 1;
    unsigned int v27 = *(_DWORD *)(a1 + 36);
    float v28 = sub_100005D84(*(_DWORD *)(a1 + 32), v27);
    int v29 = *(_DWORD *)(a1 + 20);
    unint64_t v30 = *(unsigned int *)(a1 + 24) | ((unint64_t)*(unsigned __int8 *)(a1 + 28) << 32);
    *((_DWORD *)v25 + 1) = (float)(v28 * 8000.0);
    *((float *)v25 + 5) = (float)(float)(v28 * 125.0) / 125.0;
    *((float *)v25 + 2) = (float)v30 / 125.0;
    *((_DWORD *)v25 + 3) = v29;
    *((_DWORD *)v25 + 4) = HIBYTE(v27);
    uint64_t v23 = sub_100008268((unsigned int *)v26, v23);
    *(void *)a1 = v23;
  }

  if (v23)
  {
    uint64_t v31 = (uint64_t *)a1;
    do
    {
      if (*(_DWORD *)v23 == 1342177282)
      {
        uint64_t *v31 = *(void *)(v23 + 24);
        *(void *)(v23 + 24) = 0LL;
        unint64_t v32 = (void *)sub_100008224(v23);
        operator delete(v32);
      }

      else
      {
        uint64_t v31 = (uint64_t *)(v23 + 24);
      }

      uint64_t v23 = *v31;
    }

    while (*v31);
    unsigned int v33 = *(int **)a1;
  }

  else
  {
    unsigned int v33 = 0LL;
  }

  unint64_t v50 = sub_1000085C8(v33, 0LL) + 32LL;
  unint64_t v51 = *a2;
  unint64_t v52 = a2[1] - *a2;
  if (v50 <= v52)
  {
    if (v50 < v52) {
      a2[1] = v51 + v50;
    }
  }

  else
  {
    sub_100010DF8(a2, v50 - v52);
    unint64_t v51 = *a2;
  }

  unsigned int v53 = sub_1000085C8(*(int **)a1, 0LL);
  sub_1000085C8(*(int **)a1, v51 + 32);
  int v54 = *(_DWORD *)(a1 + 8) | 0x30000000;
  *(_DWORD *)unint64_t v51 = v53;
  *(void *)(v51 + 4) = -2271560699LL;
  *(_DWORD *)(v51 + 12) = v54;
  *(_DWORD *)(v51 + 16) = 589833;
  *(_DWORD *)(v51 + 20) = v53;
  *(void *)(v51 + 24) = v53 ^ 0x789ABC13;
  uint64_t result = sub_100010200((int *)v51, v53 + 32LL);
  *(_DWORD *)(v51 + 2std::ostream::~ostream(v2, v3 + 8) = result;
  return result;
}

void sub_100010DD4(_Unwind_Exception *a1)
{
}

void sub_100010DF8(unint64_t *a1, size_t a2)
{
  int v5 = (char *)a1[1];
  uint64_t v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }

    a1[1] = (unint64_t)v5;
  }

  else
  {
    unint64_t v6 = *a1;
    uint64_t v7 = &v5[-*a1];
    unint64_t v8 = (unint64_t)&v7[a2];
    unint64_t v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v10 = v8;
    }
    if (v10) {
      unint64_t v11 = (unint64_t)operator new(v10);
    }
    else {
      unint64_t v11 = 0LL;
    }
    uint64_t v12 = &v7[v11];
    uint64_t v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }

    else
    {
      uint64_t v14 = &v5[~v6];
      do
      {
        char v15 = *--v5;
        (v14--)[v11] = v15;
      }

      while (v5 != (char *)v6);
      int v5 = (char *)*a1;
    }

    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5) {
      operator delete(v5);
    }
  }

void sub_100010F20(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1000124B4(a1);
  operator delete(v1);
}

void sub_100010F34(uint64_t a1, unint64_t a2, int a3)
{
  *(void *)(a1 + 8880) += a3;
  int v6 = *(_DWORD *)(a1 + 292);
  int v7 = *(_DWORD *)(a1 + 288);
  if (v6 == v7)
  {
    int v8 = 128;
  }

  else
  {
    unsigned int v9 = vcvtps_u32_f32((float)((float)v6 / (float)v7) * 128.0);
    if (v6 == 44100) {
      int v8 = v9 + 1;
    }
    else {
      int v8 = v9;
    }
  }

  size_t v10 = *(const void **)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v23 = 0LL;
  unint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  sub_1000123CC(&v23, v10, v11, (v11 - (uint64_t)v10) >> 2);
  sub_10000DD1C((void **)&v23, 0x180uLL);
  unint64_t v12 = a2 + 2LL * a3;
  for (unint64_t i = v12 - 2LL * v8; a2 <= i; a2 += 2LL * v8)
  {
    sub_10000E98C((void *)(a1 + 200), a2, v8, (uint64_t)&v23);
    uint64_t v14 = (char *)v23;
    sub_100012460(a1, v23);
    if ((unint64_t)(v24 - v14) <= 0x1FF)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v22.__val_ = 514LL;
      v22.__cat_ = (const std::error_category *)&off_10003CB20;
      sub_100008914((uint64_t)exception, &v22);
    }

    unint64_t v15 = v24 - (v14 + 512);
    if (v24 != v14 + 512) {
      memmove(v14, v14 + 512, v24 - (v14 + 512));
    }
    unint64_t v24 = &v14[v15];
    if (v15 >= 0x201)
    {
      sub_100012460(a1, (uint64_t)v14);
      size_t v16 = v15 - 512;
      memmove(v14, v14 + 512, v16);
      unint64_t v24 = &v14[v16];
    }
  }

  if (a2 >= v12)
  {
    uint64_t v17 = (char *)v23;
    int v18 = v24;
  }

  else
  {
    sub_10000E98C((void *)(a1 + 200), a2, (v12 - a2) >> 1, (uint64_t)&v23);
    uint64_t v17 = (char *)v23;
    int v18 = v24;
    if ((unint64_t)&v24[-v23] >= 0x1FD)
    {
      sub_100012460(a1, v23);
      size_t v19 = v18 - (v17 + 512);
      if (v19) {
        memmove(v17, v17 + 512, v19);
      }
      int v18 = &v17[v19];
    }
  }

  uint64_t v20 = *(char **)(a1 + 104);
  *(void *)(a1 + 112) = v20;
  sub_10000E7A0(a1 + 104, v20, v17, v18, (v18 - v17) >> 2);
  if (v17) {
    operator delete(v17);
  }
}

void sub_10001117C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000111B4(uint64_t a1, char *a2, int a3)
{
  *(void *)(a1 + 8880) += a3;
  int v6 = *(_DWORD *)(a1 + 292);
  int v7 = *(_DWORD *)(a1 + 288);
  if (v6 == v7)
  {
    int v8 = 128;
  }

  else
  {
    unsigned int v9 = vcvtps_u32_f32((float)((float)v6 / (float)v7) * 128.0);
    if (v6 == 44100) {
      int v8 = v9 + 1;
    }
    else {
      int v8 = v9;
    }
  }

  size_t v10 = *(const void **)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v23 = 0LL;
  unint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  sub_1000123CC(&v23, v10, v11, (v11 - (uint64_t)v10) >> 2);
  sub_10000DD1C((void **)&v23, 0x180uLL);
  unint64_t v12 = &a2[4 * a3];
  for (unint64_t i = (unint64_t)&v12[-4 * v8]; (unint64_t)a2 <= i; a2 += 4 * v8)
  {
    sub_10000EAD4((void *)(a1 + 200), a2, v8, (uint64_t)&v23);
    uint64_t v14 = (char *)v23;
    sub_100012460(a1, v23);
    if ((unint64_t)(v24 - v14) <= 0x1FF)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v22.__val_ = 514LL;
      v22.__cat_ = (const std::error_category *)&off_10003CB20;
      sub_100008914((uint64_t)exception, &v22);
    }

    unint64_t v15 = v24 - (v14 + 512);
    if (v24 != v14 + 512) {
      memmove(v14, v14 + 512, v24 - (v14 + 512));
    }
    unint64_t v24 = &v14[v15];
    if (v15 >= 0x201)
    {
      sub_100012460(a1, (uint64_t)v14);
      size_t v16 = v15 - 512;
      memmove(v14, v14 + 512, v16);
      unint64_t v24 = &v14[v16];
    }
  }

  if (a2 >= v12)
  {
    uint64_t v17 = (char *)v23;
    int v18 = v24;
  }

  else
  {
    sub_10000EAD4((void *)(a1 + 200), a2, (unint64_t)(v12 - a2) >> 2, (uint64_t)&v23);
    uint64_t v17 = (char *)v23;
    int v18 = v24;
    if ((unint64_t)&v24[-v23] >= 0x1FD)
    {
      sub_100012460(a1, v23);
      size_t v19 = v18 - (v17 + 512);
      if (v19) {
        memmove(v17, v17 + 512, v19);
      }
      int v18 = &v17[v19];
    }
  }

  uint64_t v20 = *(char **)(a1 + 104);
  *(void *)(a1 + 112) = v20;
  sub_10000E7A0(a1 + 104, v20, v17, v18, (v18 - v17) >> 2);
  if (v17) {
    operator delete(v17);
  }
}

void sub_1000113FC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100011434(uint64_t a1, unint64_t *a2, int a3)
{
  int v3 = a3;
  switch(a3)
  {
    case -1:
      int v6 = *(_DWORD *)(a1 + 16);
      goto LABEL_13;
    case 2:
      int v6 = 4;
      goto LABEL_7;
    case 1:
      int v6 = 1;
LABEL_7:
      *(_DWORD *)(a1 + 16) = v6;
      goto LABEL_13;
  }

  *(_DWORD *)(a1 + 16) = 2;
  if (a3 == 5 || a3 == 3) {
    uint64_t v7 = 16LL;
  }
  else {
    uint64_t v7 = 24LL;
  }
  *(void *)(a1 + 80) = v7;
  int v6 = 2;
LABEL_13:
  int v8 = *(_DWORD *)(a1 + 8888);
  if (v8 == v6)
  {
    unsigned int v9 = *(_DWORD *)(a1 + 36) & 0xFFFFFF00;
    *(_DWORD *)(a1 + 32) = 0;
    *(_DWORD *)(a1 + 36) = v9;
    uint64_t v10 = *(void *)(a1 + 8880);
    unint64_t v11 = v10 + (uint64_t)((double)*(int *)(a1 + 292) * 0.24);
    unint64_t v12 = HIDWORD(v11);
    *(_DWORD *)(a1 + 40) = v11;
    int v13 = *(_DWORD *)(a1 + 44);
    *(_WORD *)(a1 + 44) = v12;
    int v14 = *(_DWORD *)(a1 + 8876);
    if (v14 == 3)
    {
      *(_DWORD *)(a1 + 40) = v10;
      *(_DWORD *)(a1 + 44) = v13 & 0xFF0000 | WORD2(v10);
      uint64_t v37 = *(void *)(a1 + 152);
      if (v37 >= -44)
      {
        uint64_t v38 = a1 + 20;
        if (v37 >= 1)
        {
          uint64_t v39 = *(_DWORD **)(a1 + 128);
          int v40 = *(_DWORD **)(a1 + 136);
          while (v39 != v40)
          {
            *v39 -= v37;
            v39 += 52;
          }
        }

        sub_100005DDC(v38, v37);
      }

      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = sub_10000F64C(*(const void **)(a1 + 128), *(void *)(a1 + 136));
      *(void *)(a1 + 136) = *(void *)(a1 + 128);
      uint64_t v55 = *(void *)(a1 + 152);
      *(_DWORD *)(a1 + 32) = v55;
      int v56 = *(_DWORD *)(a1 + 36);
      *(_BYTE *)(a1 + 36) = BYTE4(v55);
      uint64_t v57 = *(void *)(a1 + 176) - 45LL;
      *(void *)(a1 + 152) = v57;
      if (*(_DWORD *)(a1 + 16) == 4)
      {
        *(_DWORD *)(a1 + 32) = v57;
        *(_DWORD *)(a1 + 36) = v56 & 0xFFFFFF00 | BYTE4(v57);
      }

      goto LABEL_62;
    }

    unint64_t v15 = (uint64_t *)(a1 + 128);
    if (v14 == 2)
    {
      uint64_t v35 = *(void *)(a1 + 136) - *(void *)(a1 + 128);
      sub_100011F00(a1, v15);
      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = sub_10000F64C(*(const void **)(a1 + 128), *(void *)(a1 + 136));
      uint64_t v36 = *(void *)(a1 + 128) + v35;
      if (v36 != *(void *)(a1 + 136)) {
        *(void *)(a1 + 136) = v36;
      }
      goto LABEL_62;
    }

    if (v14 == 1)
    {
      sub_100011F00(a1, v15);
      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = sub_10000F64C(*(const void **)(a1 + 128), *(void *)(a1 + 136));
LABEL_62:
      __int128 v58 = (uint64_t *)(a1 + 8);
      sub_1000107DC((uint64_t)v58, a2);
      sub_10000A9F8(v58);
      return;
    }

    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000052EC(exception, "Invalid signature type");
LABEL_90:
  }

  if (v6 == 1)
  {
    if (v8 != 4) {
      goto LABEL_88;
    }
    uint64_t v79 = 0LL;
    uint64_t v80 = 0LL;
    uint64_t v78 = 0LL;
    sub_100011DEC( (char *)&v78,  *(void *)(a1 + 128),  *(void *)(a1 + 136),  0x4EC4EC4EC4EC4EC5LL * ((uint64_t)(*(void *)(a1 + 136) - *(void *)(a1 + 128)) >> 4));
    uint64_t v23 = v78;
    unint64_t v24 = v79;
    unint64_t v25 = 0x4EC4EC4EC4EC4EC5LL * (((char *)v79 - (char *)v78) >> 4);
    sub_10001216C(&__p, v25);
    if (v24 == v23)
    {
      uint64_t v23 = v24;
      if (!v24)
      {
LABEL_55:
        unsigned int v46 = (uint64_t *)(a1 + 8);
        unsigned int v49 = *(_DWORD *)(a1 + 36) & 0xFFFFFF00;
        *(_DWORD *)(a1 + 32) = 0;
        *(_DWORD *)(a1 + 36) = v49;
        uint64_t v50 = *(void *)(a1 + 8880);
        unint64_t v51 = v50 + (uint64_t)((double)*(int *)(a1 + 292) * 0.24);
        unint64_t v52 = HIDWORD(v51);
        *(_DWORD *)(a1 + 40) = v51;
        int v53 = *(_DWORD *)(a1 + 44);
        *(_WORD *)(a1 + 44) = v52;
        int v54 = *(_DWORD *)(a1 + 8876);
        switch(v54)
        {
          case 3:
            *(_DWORD *)(a1 + 40) = v50;
            *(_DWORD *)(a1 + 44) = v53 & 0xFF0000 | WORD2(v50);
            uint64_t v66 = *(void *)(a1 + 152);
            if (v66 >= -44)
            {
              if (v66 >= 1)
              {
                uint64_t v67 = __p;
                unint64_t v68 = v85;
                while (v67 != v68)
                {
                  *v67 -= v66;
                  v67 += 3;
                }
              }

              sub_100005DDC(a1 + 20, v66);
            }

            *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = sub_10000F6AC(__p, (uint64_t)v85);
            uint64_t v85 = (char *)__p;
            uint64_t v72 = *(void *)(a1 + 152);
            *(_DWORD *)(a1 + 32) = v72;
            int v73 = *(_DWORD *)(a1 + 36);
            *(_BYTE *)(a1 + 36) = BYTE4(v72);
            uint64_t v74 = *(void *)(a1 + 176) - 45LL;
            *(void *)(a1 + 152) = v74;
            if (*(_DWORD *)(a1 + 16) == 4)
            {
              *(_DWORD *)(a1 + 32) = v74;
              *(_DWORD *)(a1 + 36) = v73 & 0xFFFFFF00 | BYTE4(v74);
            }

            break;
          case 2:
            BOOL v65 = __p;
            unint64_t v64 = v85;
            sub_100012008(a1, (char **)&__p);
            *unsigned int v46 = (uint64_t)sub_10000F6AC(__p, (uint64_t)v85);
            break;
          case 1:
            sub_100012008(a1, (char **)&__p);
            *unsigned int v46 = (uint64_t)sub_10000F6AC(__p, (uint64_t)v85);
            break;
          default:
            uint64_t v77 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(v77, "Invalid signature type");
        }

        sub_1000107DC(a1 + 8, a2);
        goto LABEL_85;
      }
    }

    else
    {
      if (v25 <= 1) {
        uint64_t v26 = 1LL;
      }
      else {
        uint64_t v26 = v25;
      }
      uint64_t v27 = 10LL;
      float v28 = v23;
      do
      {
        unsigned __int16 v29 = *((_WORD *)v28 + 2);
        unsigned int v30 = *((unsigned __int16 *)v28 + 3);
        float v31 = (float)(int)(2 * v30);
        float v32 = v31 - (float)((float)((float)v30 - v28[13]) + (float)((float)v30 - v28[15]));
        float v33 = v31 - (float)((float)((float)v30 - v28[9]) + (float)((float)v30 - v28[19]));
        unint64_t v34 = (char *)__p + v27;
        *(float *)(v34 - 5) = *v28;
        *(v34 - 3) = v29;
        *(v34 - 2) = v30;
        *(v34 - 1) = (int)(float)(v33 + v33);
        _WORD *v34 = (int)v32;
        v27 += 12LL;
        v28 += 52;
        --v26;
      }

      while (v26);
    }

    operator delete(v23);
    goto LABEL_55;
  }

  if (v6 != 2)
  {
LABEL_88:
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000052EC(exception, "Invalid combination of pipeline sig options and get signature sig options.");
    goto LABEL_90;
  }

  std::error_code v82 = 0LL;
  uint64_t v83 = 0LL;
  unint64_t v81 = 0LL;
  sub_100011DEC( (char *)&v81,  *(void *)(a1 + 128),  *(void *)(a1 + 136),  0x4EC4EC4EC4EC4EC5LL * ((uint64_t)(*(void *)(a1 + 136) - *(void *)(a1 + 128)) >> 4));
  size_t v16 = v81;
  uint64_t v17 = v82;
  unint64_t v18 = 0x4EC4EC4EC4EC4EC5LL * (((char *)v82 - (char *)v81) >> 4);
  sub_100012358(&__p, v18);
  if (v17 != v16)
  {
    uint64_t v19 = 0LL;
    if (v18 <= 1) {
      uint64_t v20 = 1LL;
    }
    else {
      uint64_t v20 = v18;
    }
    uint64_t v21 = v16;
    do
    {
      uint64_t v22 = *v21;
      v21 += 26;
      *((void *)__p + v19++) = v22;
    }

    while (v20 != v19);
    goto LABEL_43;
  }

  size_t v16 = v17;
  if (v17) {
LABEL_43:
  }
    operator delete(v16);
  unsigned int v41 = *(_DWORD *)(a1 + 36) & 0xFFFFFF00;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 36) = v41;
  uint64_t v42 = *(void *)(a1 + 8880);
  unint64_t v43 = v42 + (uint64_t)((double)*(int *)(a1 + 292) * 0.24);
  unint64_t v44 = HIDWORD(v43);
  *(_DWORD *)(a1 + 40) = v43;
  int v45 = *(_DWORD *)(a1 + 44);
  *(_WORD *)(a1 + 44) = v44;
  if (v3 == -1) {
    int v3 = *(_DWORD *)(a1 + 8892);
  }
  unsigned int v46 = (uint64_t *)(a1 + 8);
  if ((v3 & 0xFFFFFFFE) == 4) {
    unint64_t v47 = 3LL;
  }
  else {
    unint64_t v47 = 4LL;
  }
  int v48 = *(_DWORD *)(a1 + 8876);
  switch(v48)
  {
    case 3:
      *(_DWORD *)(a1 + 40) = v42;
      *(_DWORD *)(a1 + 44) = v45 & 0xFF0000 | WORD2(v42);
      uint64_t v61 = *(void *)(a1 + 152);
      if (v61 >= -44)
      {
        if (v61 >= 1)
        {
          unint64_t v62 = __p;
          unint64_t v63 = v85;
          while (v62 != v63)
          {
            *v62 -= v61;
            v62 += 2;
          }
        }

        sub_100005DDC(a1 + 20, v61);
      }

      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = sub_10000F70C((uint64_t *)&__p, *(void *)(a1 + 80), 0, v47);
      uint64_t v85 = (char *)__p;
      uint64_t v69 = *(void *)(a1 + 152);
      *(_DWORD *)(a1 + 32) = v69;
      int v70 = *(_DWORD *)(a1 + 36);
      *(_BYTE *)(a1 + 36) = BYTE4(v69);
      uint64_t v71 = *(void *)(a1 + 176) - 45LL;
      *(void *)(a1 + 152) = v71;
      if (*(_DWORD *)(a1 + 16) == 4)
      {
        *(_DWORD *)(a1 + 32) = v71;
        *(_DWORD *)(a1 + 36) = v70 & 0xFFFFFF00 | BYTE4(v71);
      }

      break;
    case 2:
      unsigned int v60 = __p;
      unsigned int v59 = v85;
      sub_100012250(a1, &__p);
      *unsigned int v46 = (uint64_t)sub_10000F70C((uint64_t *)&__p, *(void *)(a1 + 80), 1, v47);
      break;
    case 1:
      sub_100012250(a1, &__p);
      *unsigned int v46 = (uint64_t)sub_10000F70C((uint64_t *)&__p, *(void *)(a1 + 80), 1, v47);
      break;
    default:
      uint64_t v76 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(v76, "Invalid signature type");
  }

  sub_1000107DC(a1 + 8, a2);
LABEL_85:
  sub_10000A9F8(v46);
  if (__p)
  {
    uint64_t v85 = (char *)__p;
    operator delete(__p);
  }

void sub_100011C98( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_100011CF4(uint64_t a1)
{
  *(void *)(a1 + 8880) = 0LL;
  *(void *)(a1 + 152) = 0LL;
  *(_OWORD *)(a1 + 176) = xmmword_100014C00;
  bzero(*(void **)(a1 + 160), 0x10040CuLL);
  uint64_t v2 = *(void *)(a1 + 192);
  bzero(*(void **)(v2 + 8), 4LL * (*(_DWORD *)v2 * *(_DWORD *)(v2 + 4) + 3));
  *(_DWORD *)(v2 + 40) = 0;
  if (*(_DWORD *)(a1 + 8876) == 3) {
    *(void *)(a1 + 152) = *(void *)(a1 + 176) - 45LL;
  }
  *(void *)(a1 + 112) = *(void *)(a1 + 104);
  *(void *)(a1 + 136) = *(void *)(a1 + 128);
  *(void *)(a1 + 240) = 0LL;
  *(void *)(a1 + 24std::ostream::~ostream(v2, v3 + 8) = 0LL;
  sub_10000E438(a1 + 256);
  sub_10000E508(a1 + 272);
  bzero(*(void **)(a1 + 336), 0x200CuLL);
  bzero(*(void **)(a1 + 368), 0x201CuLL);
  *(void *)(a1 + 384) = 0LL;
  *(_DWORD *)(a1 + 8864) = 0;
  int v3 = *(void **)(a1 + 312);
  if (v3) {
    bzero(v3, (unint64_t)*(unsigned int *)(a1 + 332) << (12 - *(_BYTE *)(a1 + 320)));
  }
  sub_10000A9F8((uint64_t *)(a1 + 8));
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 8888);
}

uint64_t sub_100011DE4(uint64_t a1)
{
  return a1 + 296;
}

char *sub_100011DEC(char *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = result;
    if (a4 >= 0x13B13B13B13B13CLL) {
      sub_100006118();
    }
    uint64_t result = (char *)sub_10000D32C(a4);
    void *v4 = result;
    v4[1] = result;
    v4[2] = &result[208 * v7];
    while (a2 != a3)
    {
      int v8 = *(_DWORD *)(a2 + 4);
      *(_DWORD *)uint64_t result = *(_DWORD *)a2;
      *((_DWORD *)result + 1) = v8;
      __int128 v9 = *(_OWORD *)(a2 + 8);
      __int128 v10 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(result + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(result + 24) = v10;
      *(_OWORD *)(result + std::ostream::~ostream(v2, v3 + 8) = v9;
      __int128 v11 = *(_OWORD *)(a2 + 56);
      __int128 v12 = *(_OWORD *)(a2 + 72);
      __int128 v13 = *(_OWORD *)(a2 + 88);
      *((_DWORD *)result + 26) = *(_DWORD *)(a2 + 104);
      *(_OWORD *)(result + 8std::ostream::~ostream(v2, v3 + 8) = v13;
      *(_OWORD *)(result + 72) = v12;
      *(_OWORD *)(result + 56) = v11;
      __int128 v14 = *(_OWORD *)(a2 + 172);
      __int128 v15 = *(_OWORD *)(a2 + 188);
      int v16 = *(_DWORD *)(a2 + 204);
      *(_OWORD *)(result + 156) = *(_OWORD *)(a2 + 156);
      *((_DWORD *)result + 51) = v16;
      *(_OWORD *)(result + 18std::ostream::~ostream(v2, v3 + 8) = v15;
      *(_OWORD *)(result + 172) = v14;
      __int128 v17 = *(_OWORD *)(a2 + 108);
      __int128 v18 = *(_OWORD *)(a2 + 124);
      *(_OWORD *)(result + 140) = *(_OWORD *)(a2 + 140);
      *(_OWORD *)(result + 124) = v18;
      *(_OWORD *)(result + 10std::ostream::~ostream(v2, v3 + 8) = v17;
      result += 208;
      a2 += 208LL;
    }

    v4[1] = result;
  }

  return result;
}

void sub_100011EE4(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::ostream::~ostream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void sub_100011F00(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = (float *)(a1 + 160);
  sub_10000C8D4((void *)(a1 + 160));
  sub_1000104A0((void *)(a1 + 296));
  unint64_t v5 = -128LL;
  memset(v7, 0, sizeof(v7));
  do
  {
    uint64_t v6 = sub_10000CC0C(*(int **)(a1 + 192), 0);
    sub_1000105FC(a1 + 296, (uint64_t)v7, v6);
    sub_10000CCB8((uint64_t)v4, a2);
    v5 += 128LL;
  }

  while (v5 >> 9 < 0xF);
  sub_10000C99C(v4);
  sub_100010548(a1 + 296);
}

void sub_100012008(uint64_t a1, char **a2)
{
  uint64_t v4 = (float *)(a1 + 160);
  sub_10000C8D4((void *)(a1 + 160));
  sub_1000104A0((void *)(a1 + 296));
  unint64_t v5 = -128LL;
  memset(v7, 0, sizeof(v7));
  do
  {
    uint64_t v6 = sub_10000CC0C(*(int **)(a1 + 192), 0);
    sub_1000105FC(a1 + 296, (uint64_t)v7, v6);
    sub_10000D458((uint64_t)v4, a2);
    v5 += 128LL;
  }

  while (v5 >> 9 < 0xF);
  sub_10000C99C(v4);
  sub_100010548(a1 + 296);
}

uint64_t sub_100012110(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    uint64_t v3 = *(void *)(result + 8);
    if (a3 != v3)
    {
      uint64_t v4 = 4 * ((a3 - a2) >> 2);
      do
      {
        uint64_t v5 = *(void *)(a2 + v4);
        *(_DWORD *)(a2 + std::ostream::~ostream(v2, v3 + 8) = *(_DWORD *)(a2 + v4 + 8);
        *(void *)a2 = v5;
        a2 += 12LL;
      }

      while (a2 + v4 != v3);
    }

    *(void *)(result + std::ostream::~ostream(v2, v3 + 8) = a2;
  }

  return result;
}

void *sub_10001216C(void *a1, unint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_100012204(a1, a2);
    uint64_t v4 = (char *)a1[1];
    size_t v5 = 12 * ((12 * a2 - 12) / 0xC) + 12;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }

  return a1;
}

void sub_1000121E8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::ostream::~ostream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_100012204(void *a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556LL) {
    sub_100006118();
  }
  uint64_t result = (char *)sub_10000D83C(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[12 * v4];
  return result;
}

void sub_100012250(uint64_t a1, void **a2)
{
  uint64_t v4 = (float *)(a1 + 160);
  sub_10000C8D4((void *)(a1 + 160));
  sub_1000104A0((void *)(a1 + 296));
  unint64_t v5 = -128LL;
  memset(v7, 0, sizeof(v7));
  do
  {
    uint64_t v6 = sub_10000CC0C(*(int **)(a1 + 192), 0);
    sub_1000105FC(a1 + 296, (uint64_t)v7, v6);
    sub_10000D880((uint64_t)v4, a2);
    v5 += 128LL;
  }

  while (v5 >> 9 < 0xF);
  sub_10000C99C(v4);
  sub_100010548(a1 + 296);
}

void *sub_100012358(void *a1, unint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_10000C710(a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }

  return a1;
}

void sub_1000123B0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::ostream::~ostream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void *sub_1000123CC(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = result;
    if (a4 >> 62) {
      sub_100006118();
    }
    uint64_t result = sub_10000C74C(a4);
    uint64_t v7 = result;
    void *v4 = result;
    v4[1] = result;
    v4[2] = (char *)result + 4 * v8;
    size_t v9 = a3 - (void)a2;
    if (v9) {
      uint64_t result = memmove(result, a2, v9);
    }
    v4[1] = (char *)v7 + v9;
  }

  return result;
}

void sub_100012444(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::ostream::~ostream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void sub_100012460(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 296;
  uint64_t v5 = a1 + 160;
  uint64_t v6 = sub_10000CC0C(*(int **)(a1 + 192), 0);
  sub_1000105FC(v4, a2, v6);
  sub_10000CCB8(v5, (uint64_t *)(a1 + 128));
}

uint64_t sub_1000124B4(uint64_t a1)
{
  *(void *)a1 = off_1000384F0;
  uint64_t v2 = *(void *)(a1 + 400);
  *(void *)(a1 + 400) = 0LL;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
  }
  uint64_t v3 = *(void **)(a1 + 368);
  if (v3) {
    operator delete[](v3);
  }
  uint64_t v4 = *(void **)(a1 + 352);
  if (v4) {
    operator delete[](v4);
  }
  uint64_t v5 = *(void **)(a1 + 336);
  if (v5) {
    operator delete[](v5);
  }
  uint64_t v6 = *(void **)(a1 + 272);
  if (v6) {
    operator delete[](v6);
  }
  uint64_t v7 = *(void **)(a1 + 256);
  if (v7) {
    operator delete[](v7);
  }
  uint64_t v8 = *(void **)(a1 + 216);
  if (v8)
  {
    *(void *)(a1 + 224) = v8;
    operator delete(v8);
  }

  sub_10000C888(a1 + 160);
  size_t v9 = *(void **)(a1 + 128);
  if (v9)
  {
    *(void *)(a1 + 136) = v9;
    operator delete(v9);
  }

  __int128 v10 = *(void **)(a1 + 104);
  if (v10)
  {
    *(void *)(a1 + 112) = v10;
    operator delete(v10);
  }

  sub_10000A9F8((uint64_t *)(a1 + 8));
  __int128 v12 = (void **)(a1 + 48);
  sub_10000AA7C(&v12);
  return a1;
}

void sub_100012590(uint64_t a1)
{
  uint64_t v1 = (void *)sub_100013310(a1);
  operator delete(v1);
}

void sub_1000125A4(uint64_t a1, unint64_t a2, int a3)
{
  *(void *)(a1 + 8880) += a3;
  int v6 = *(_DWORD *)(a1 + 292);
  int v7 = *(_DWORD *)(a1 + 288);
  if (v6 == v7)
  {
    int v8 = 128;
  }

  else
  {
    unsigned int v9 = vcvtps_u32_f32((float)((float)v6 / (float)v7) * 128.0);
    if (v6 == 44100) {
      int v8 = v9 + 1;
    }
    else {
      int v8 = v9;
    }
  }

  __int128 v10 = *(const void **)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v23 = 0LL;
  unint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  sub_1000123CC(&v23, v10, v11, (v11 - (uint64_t)v10) >> 2);
  sub_10000DD1C((void **)&v23, 0x180uLL);
  unint64_t v12 = a2 + 2LL * a3;
  for (unint64_t i = v12 - 2LL * v8; a2 <= i; a2 += 2LL * v8)
  {
    sub_10000E98C((void *)(a1 + 200), a2, v8, (uint64_t)&v23);
    __int128 v14 = (char *)v23;
    sub_1000132BC(a1, v23);
    if ((unint64_t)(v24 - v14) <= 0x1FF)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v22.__val_ = 514LL;
      v22.__cat_ = (const std::error_category *)&off_10003CB20;
      sub_100008914((uint64_t)exception, &v22);
    }

    unint64_t v15 = v24 - (v14 + 512);
    if (v24 != v14 + 512) {
      memmove(v14, v14 + 512, v24 - (v14 + 512));
    }
    unint64_t v24 = &v14[v15];
    if (v15 >= 0x201)
    {
      sub_1000132BC(a1, (uint64_t)v14);
      size_t v16 = v15 - 512;
      memmove(v14, v14 + 512, v16);
      unint64_t v24 = &v14[v16];
    }
  }

  if (a2 >= v12)
  {
    __int128 v17 = (char *)v23;
    __int128 v18 = v24;
  }

  else
  {
    sub_10000E98C((void *)(a1 + 200), a2, (v12 - a2) >> 1, (uint64_t)&v23);
    __int128 v17 = (char *)v23;
    __int128 v18 = v24;
    if ((unint64_t)&v24[-v23] >= 0x1FD)
    {
      sub_1000132BC(a1, v23);
      size_t v19 = v18 - (v17 + 512);
      if (v19) {
        memmove(v17, v17 + 512, v19);
      }
      __int128 v18 = &v17[v19];
    }
  }

  uint64_t v20 = *(char **)(a1 + 104);
  *(void *)(a1 + 112) = v20;
  sub_10000E7A0(a1 + 104, v20, v17, v18, (v18 - v17) >> 2);
  if (v17) {
    operator delete(v17);
  }
}

void sub_1000127EC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100012824(uint64_t a1, char *a2, int a3)
{
  *(void *)(a1 + 8880) += a3;
  int v6 = *(_DWORD *)(a1 + 292);
  int v7 = *(_DWORD *)(a1 + 288);
  if (v6 == v7)
  {
    int v8 = 128;
  }

  else
  {
    unsigned int v9 = vcvtps_u32_f32((float)((float)v6 / (float)v7) * 128.0);
    if (v6 == 44100) {
      int v8 = v9 + 1;
    }
    else {
      int v8 = v9;
    }
  }

  __int128 v10 = *(const void **)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v23 = 0LL;
  unint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  sub_1000123CC(&v23, v10, v11, (v11 - (uint64_t)v10) >> 2);
  sub_10000DD1C((void **)&v23, 0x180uLL);
  unint64_t v12 = &a2[4 * a3];
  for (unint64_t i = (unint64_t)&v12[-4 * v8]; (unint64_t)a2 <= i; a2 += 4 * v8)
  {
    sub_10000EAD4((void *)(a1 + 200), a2, v8, (uint64_t)&v23);
    __int128 v14 = (char *)v23;
    sub_1000132BC(a1, v23);
    if ((unint64_t)(v24 - v14) <= 0x1FF)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v22.__val_ = 514LL;
      v22.__cat_ = (const std::error_category *)&off_10003CB20;
      sub_100008914((uint64_t)exception, &v22);
    }

    unint64_t v15 = v24 - (v14 + 512);
    if (v24 != v14 + 512) {
      memmove(v14, v14 + 512, v24 - (v14 + 512));
    }
    unint64_t v24 = &v14[v15];
    if (v15 >= 0x201)
    {
      sub_1000132BC(a1, (uint64_t)v14);
      size_t v16 = v15 - 512;
      memmove(v14, v14 + 512, v16);
      unint64_t v24 = &v14[v16];
    }
  }

  if (a2 >= v12)
  {
    __int128 v17 = (char *)v23;
    __int128 v18 = v24;
  }

  else
  {
    sub_10000EAD4((void *)(a1 + 200), a2, (unint64_t)(v12 - a2) >> 2, (uint64_t)&v23);
    __int128 v17 = (char *)v23;
    __int128 v18 = v24;
    if ((unint64_t)&v24[-v23] >= 0x1FD)
    {
      sub_1000132BC(a1, v23);
      size_t v19 = v18 - (v17 + 512);
      if (v19) {
        memmove(v17, v17 + 512, v19);
      }
      __int128 v18 = &v17[v19];
    }
  }

  uint64_t v20 = *(char **)(a1 + 104);
  *(void *)(a1 + 112) = v20;
  sub_10000E7A0(a1 + 104, v20, v17, v18, (v18 - v17) >> 2);
  if (v17) {
    operator delete(v17);
  }
}

void sub_100012A6C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100012AA4(uint64_t a1, unint64_t *a2, int a3)
{
  int v3 = a3;
  switch(a3)
  {
    case -1:
      int v6 = *(_DWORD *)(a1 + 16);
      goto LABEL_13;
    case 2:
      int v6 = 4;
      goto LABEL_7;
    case 1:
      int v6 = 1;
LABEL_7:
      *(_DWORD *)(a1 + 16) = v6;
      goto LABEL_13;
  }

  *(_DWORD *)(a1 + 16) = 2;
  if (a3 == 5 || a3 == 3) {
    uint64_t v7 = 16LL;
  }
  else {
    uint64_t v7 = 24LL;
  }
  *(void *)(a1 + 80) = v7;
  int v6 = 2;
LABEL_13:
  int v8 = *(_DWORD *)(a1 + 8888);
  if (v8 == v6)
  {
    sub_1000130F8(a1, a1 + 128, a2);
    return;
  }

  if (v6 == 1)
  {
    if (v8 == 4)
    {
      uint64_t v38 = 0LL;
      uint64_t v39 = 0LL;
      uint64_t v37 = 0LL;
      sub_100013078( (char *)&v37,  *(void *)(a1 + 128),  *(void *)(a1 + 136),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 136) - *(void *)(a1 + 128)) >> 2));
      size_t v16 = v37;
      __int128 v17 = v38;
      sub_10001216C(&__p, 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)v38 - (_BYTE *)v37) >> 2));
      if (v17 != v16)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Cannot convert fat peak to fat peak");
      }

      if (v17) {
        operator delete(v17);
      }
      sub_1000130F8(a1, (uint64_t)&__p, a2);
      goto LABEL_51;
    }

LABEL_54:
    unint64_t v34 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000052EC(v34, "Invalid combination of pipeline sig options and get signature sig options.");
  }

  if (v6 != 2) {
    goto LABEL_54;
  }
  unsigned int v41 = 0LL;
  uint64_t v42 = 0LL;
  int v40 = 0LL;
  sub_100013078( (char *)&v40,  *(void *)(a1 + 128),  *(void *)(a1 + 136),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 136) - *(void *)(a1 + 128)) >> 2));
  unsigned int v9 = v40;
  __int128 v10 = v41;
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v41 - (char *)v40) >> 2);
  sub_100012358(&__p, v11);
  if (v10 != v9)
  {
    uint64_t v12 = 0LL;
    if (v11 <= 1) {
      uint64_t v13 = 1LL;
    }
    else {
      uint64_t v13 = v11;
    }
    __int128 v14 = v9;
    do
    {
      uint64_t v15 = *v14;
      __int128 v14 = (uint64_t *)((char *)v14 + 12);
      *((void *)__p + v12++) = v15;
    }

    while (v13 != v12);
    goto LABEL_30;
  }

  unsigned int v9 = v10;
  if (v10) {
LABEL_30:
  }
    operator delete(v9);
  unsigned int v18 = *(_DWORD *)(a1 + 36) & 0xFFFFFF00;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 36) = v18;
  uint64_t v19 = *(void *)(a1 + 8880);
  unint64_t v20 = v19 + (uint64_t)((double)*(int *)(a1 + 292) * 0.24);
  unint64_t v21 = HIDWORD(v20);
  *(_DWORD *)(a1 + 40) = v20;
  int v22 = *(_DWORD *)(a1 + 44);
  *(_WORD *)(a1 + 44) = v21;
  if (v3 == -1) {
    int v3 = *(_DWORD *)(a1 + 8892);
  }
  uint64_t v23 = (void ***)(a1 + 8);
  if ((v3 & 0xFFFFFFFE) == 4) {
    unint64_t v24 = 3LL;
  }
  else {
    unint64_t v24 = 4LL;
  }
  int v25 = *(_DWORD *)(a1 + 8876);
  switch(v25)
  {
    case 3:
      *(_DWORD *)(a1 + 40) = v19;
      *(_DWORD *)(a1 + 44) = v22 & 0xFF0000 | WORD2(v19);
      uint64_t v28 = *(void *)(a1 + 152);
      if (v28 >= -44)
      {
        if (v28 >= 1)
        {
          unsigned __int16 v29 = __p;
          unsigned int v30 = v44;
          while (v29 != v30)
          {
            *v29 -= v28;
            v29 += 2;
          }
        }

        sub_100005DDC(a1 + 20, v28);
      }

      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = sub_10000F70C((uint64_t *)&__p, *(void *)(a1 + 80), 0, v24);
      unint64_t v44 = (char *)__p;
      uint64_t v31 = *(void *)(a1 + 152);
      *(_DWORD *)(a1 + 32) = v31;
      int v32 = *(_DWORD *)(a1 + 36);
      *(_BYTE *)(a1 + 36) = BYTE4(v31);
      uint64_t v33 = *(void *)(a1 + 176) - 45LL;
      *(void *)(a1 + 152) = v33;
      if (*(_DWORD *)(a1 + 16) == 4)
      {
        *(_DWORD *)(a1 + 32) = v33;
        *(_DWORD *)(a1 + 36) = v32 & 0xFFFFFF00 | BYTE4(v33);
      }

      break;
    case 2:
      uint64_t v27 = __p;
      uint64_t v26 = v44;
      sub_100012250(a1, &__p);
      *uint64_t v23 = sub_10000F70C((uint64_t *)&__p, *(void *)(a1 + 80), 1, v24);
      break;
    case 1:
      sub_100012250(a1, &__p);
      *uint64_t v23 = sub_10000F70C((uint64_t *)&__p, *(void *)(a1 + 80), 1, v24);
      break;
    default:
      uint64_t v36 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(v36, "Invalid signature type");
  }

  sub_1000107DC(a1 + 8, a2);
  sub_10000A9F8((uint64_t *)(a1 + 8));
LABEL_51:
  if (__p)
  {
    unint64_t v44 = (char *)__p;
    operator delete(__p);
  }

void sub_100012EE4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_100012F80(uint64_t a1)
{
  *(void *)(a1 + 8880) = 0LL;
  *(void *)(a1 + 152) = 0LL;
  *(_OWORD *)(a1 + 176) = xmmword_100014C00;
  bzero(*(void **)(a1 + 160), 0x10040CuLL);
  uint64_t v2 = *(void *)(a1 + 192);
  bzero(*(void **)(v2 + 8), 4LL * (*(_DWORD *)v2 * *(_DWORD *)(v2 + 4) + 3));
  *(_DWORD *)(v2 + 40) = 0;
  if (*(_DWORD *)(a1 + 8876) == 3) {
    *(void *)(a1 + 152) = *(void *)(a1 + 176) - 45LL;
  }
  *(void *)(a1 + 112) = *(void *)(a1 + 104);
  *(void *)(a1 + 136) = *(void *)(a1 + 128);
  *(void *)(a1 + 240) = 0LL;
  *(void *)(a1 + 24std::ostream::~ostream(v2, v3 + 8) = 0LL;
  sub_10000E438(a1 + 256);
  sub_10000E508(a1 + 272);
  bzero(*(void **)(a1 + 336), 0x200CuLL);
  bzero(*(void **)(a1 + 368), 0x201CuLL);
  *(void *)(a1 + 384) = 0LL;
  *(_DWORD *)(a1 + 8864) = 0;
  int v3 = *(void **)(a1 + 312);
  if (v3) {
    bzero(v3, (unint64_t)*(unsigned int *)(a1 + 332) << (12 - *(_BYTE *)(a1 + 320)));
  }
  sub_10000A9F8((uint64_t *)(a1 + 8));
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 8888);
}

uint64_t sub_100013070(uint64_t a1)
{
  return a1 + 296;
}

char *sub_100013078(char *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    uint64_t result = sub_100012204(result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    while (a2 != a3)
    {
      *(_DWORD *)uint64_t v7 = *(_DWORD *)a2;
      *(void *)(v7 + 4) = *(void *)(a2 + 4);
      v7 += 12LL;
      a2 += 12LL;
    }

    *((void *)v6 + 1) = v7;
  }

  return result;
}

void sub_1000130DC(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::ostream::~ostream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void sub_1000130F8(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unsigned int v6 = *(_DWORD *)(a1 + 36) & 0xFFFFFF00;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 36) = v6;
  uint64_t v7 = *(void *)(a1 + 8880);
  unint64_t v8 = v7 + (uint64_t)((double)*(int *)(a1 + 292) * 0.24);
  unint64_t v9 = HIDWORD(v8);
  *(_DWORD *)(a1 + 40) = v8;
  int v10 = *(_DWORD *)(a1 + 44);
  *(_WORD *)(a1 + 44) = v9;
  int v11 = *(_DWORD *)(a1 + 8876);
  switch(v11)
  {
    case 3:
      *(_DWORD *)(a1 + 40) = v7;
      *(_DWORD *)(a1 + 44) = v10 & 0xFF0000 | WORD2(v7);
      uint64_t v12 = *(void *)(a1 + 152);
      if (v12 >= -44)
      {
        uint64_t v13 = a1 + 20;
        if (v12 >= 1)
        {
          __int128 v14 = *(_DWORD **)a2;
          uint64_t v15 = *(_DWORD **)(a2 + 8);
          while (v14 != v15)
          {
            *v14 -= v12;
            v14 += 3;
          }
        }

        sub_100005DDC(v13, v12);
      }

      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = sub_10000F6AC(*(const void **)a2, *(void *)(a2 + 8));
      *(void *)(a2 + std::ostream::~ostream(v2, v3 + 8) = *(void *)a2;
      uint64_t v17 = *(void *)(a1 + 152);
      *(_DWORD *)(a1 + 32) = v17;
      int v18 = *(_DWORD *)(a1 + 36);
      *(_BYTE *)(a1 + 36) = BYTE4(v17);
      uint64_t v19 = *(void *)(a1 + 176) - 45LL;
      *(void *)(a1 + 152) = v19;
      if (*(_DWORD *)(a1 + 16) == 4)
      {
        *(_DWORD *)(a1 + 32) = v19;
        *(_DWORD *)(a1 + 36) = v18 & 0xFFFFFF00 | BYTE4(v19);
      }

      break;
    case 2:
      uint64_t v16 = *(void *)(a2 + 8) - *(void *)a2;
      sub_100012008(a1, (char **)a2);
      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = sub_10000F6AC(*(const void **)a2, *(void *)(a2 + 8));
      sub_100012110(a2, *(void *)a2 + v16, *(void *)(a2 + 8));
      break;
    case 1:
      sub_100012008(a1, (char **)a2);
      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = sub_10000F6AC(*(const void **)a2, *(void *)(a2 + 8));
      break;
    default:
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      sub_1000052EC(exception, "Invalid signature type");
  }

  unint64_t v20 = (uint64_t *)(a1 + 8);
  sub_1000107DC((uint64_t)v20, a3);
  sub_10000A9F8(v20);
}

void sub_1000132A8(_Unwind_Exception *a1)
{
}

void sub_1000132BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 296;
  uint64_t v5 = a1 + 160;
  uint64_t v6 = sub_10000CC0C(*(int **)(a1 + 192), 0);
  sub_1000105FC(v4, a2, v6);
  sub_10000D458(v5, (char **)(a1 + 128));
}

uint64_t sub_100013310(uint64_t a1)
{
  *(void *)a1 = off_100038538;
  uint64_t v2 = *(void *)(a1 + 400);
  *(void *)(a1 + 400) = 0LL;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
  }
  int v3 = *(void **)(a1 + 368);
  if (v3) {
    operator delete[](v3);
  }
  uint64_t v4 = *(void **)(a1 + 352);
  if (v4) {
    operator delete[](v4);
  }
  uint64_t v5 = *(void **)(a1 + 336);
  if (v5) {
    operator delete[](v5);
  }
  uint64_t v6 = *(void **)(a1 + 272);
  if (v6) {
    operator delete[](v6);
  }
  uint64_t v7 = *(void **)(a1 + 256);
  if (v7) {
    operator delete[](v7);
  }
  unint64_t v8 = *(void **)(a1 + 216);
  if (v8)
  {
    *(void *)(a1 + 224) = v8;
    operator delete(v8);
  }

  sub_10000C888(a1 + 160);
  unint64_t v9 = *(void **)(a1 + 128);
  if (v9)
  {
    *(void *)(a1 + 136) = v9;
    operator delete(v9);
  }

  int v10 = *(void **)(a1 + 104);
  if (v10)
  {
    *(void *)(a1 + 112) = v10;
    operator delete(v10);
  }

  sub_10000A9F8((uint64_t *)(a1 + 8));
  uint64_t v12 = (void **)(a1 + 48);
  sub_10000AA7C(&v12);
  return a1;
}

void sub_1000133EC(uint64_t a1)
{
  uint64_t v1 = (void *)sub_100014138(a1);
  operator delete(v1);
}

void sub_100013400(uint64_t a1, unint64_t a2, int a3)
{
  *(void *)(a1 + 8880) += a3;
  int v6 = *(_DWORD *)(a1 + 292);
  int v7 = *(_DWORD *)(a1 + 288);
  if (v6 == v7)
  {
    int v8 = 128;
  }

  else
  {
    unsigned int v9 = vcvtps_u32_f32((float)((float)v6 / (float)v7) * 128.0);
    if (v6 == 44100) {
      int v8 = v9 + 1;
    }
    else {
      int v8 = v9;
    }
  }

  int v10 = *(const void **)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v23 = 0LL;
  unint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  sub_1000123CC(&v23, v10, v11, (v11 - (uint64_t)v10) >> 2);
  sub_10000DD1C((void **)&v23, 0x180uLL);
  unint64_t v12 = a2 + 2LL * a3;
  for (unint64_t i = v12 - 2LL * v8; a2 <= i; a2 += 2LL * v8)
  {
    sub_10000E98C((void *)(a1 + 200), a2, v8, (uint64_t)&v23);
    __int128 v14 = (char *)v23;
    sub_1000140E4(a1, v23);
    if ((unint64_t)(v24 - v14) <= 0x1FF)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v22.__val_ = 514LL;
      v22.__cat_ = (const std::error_category *)&off_10003CB20;
      sub_100008914((uint64_t)exception, &v22);
    }

    unint64_t v15 = v24 - (v14 + 512);
    if (v24 != v14 + 512) {
      memmove(v14, v14 + 512, v24 - (v14 + 512));
    }
    unint64_t v24 = &v14[v15];
    if (v15 >= 0x201)
    {
      sub_1000140E4(a1, (uint64_t)v14);
      size_t v16 = v15 - 512;
      memmove(v14, v14 + 512, v16);
      unint64_t v24 = &v14[v16];
    }
  }

  if (a2 >= v12)
  {
    uint64_t v17 = (char *)v23;
    int v18 = v24;
  }

  else
  {
    sub_10000E98C((void *)(a1 + 200), a2, (v12 - a2) >> 1, (uint64_t)&v23);
    uint64_t v17 = (char *)v23;
    int v18 = v24;
    if ((unint64_t)&v24[-v23] >= 0x1FD)
    {
      sub_1000140E4(a1, v23);
      size_t v19 = v18 - (v17 + 512);
      if (v19) {
        memmove(v17, v17 + 512, v19);
      }
      int v18 = &v17[v19];
    }
  }

  unint64_t v20 = *(char **)(a1 + 104);
  *(void *)(a1 + 112) = v20;
  sub_10000E7A0(a1 + 104, v20, v17, v18, (v18 - v17) >> 2);
  if (v17) {
    operator delete(v17);
  }
}

void sub_100013648( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100013680(uint64_t a1, char *a2, int a3)
{
  *(void *)(a1 + 8880) += a3;
  int v6 = *(_DWORD *)(a1 + 292);
  int v7 = *(_DWORD *)(a1 + 288);
  if (v6 == v7)
  {
    int v8 = 128;
  }

  else
  {
    unsigned int v9 = vcvtps_u32_f32((float)((float)v6 / (float)v7) * 128.0);
    if (v6 == 44100) {
      int v8 = v9 + 1;
    }
    else {
      int v8 = v9;
    }
  }

  int v10 = *(const void **)(a1 + 104);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v23 = 0LL;
  unint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  sub_1000123CC(&v23, v10, v11, (v11 - (uint64_t)v10) >> 2);
  sub_10000DD1C((void **)&v23, 0x180uLL);
  unint64_t v12 = &a2[4 * a3];
  for (unint64_t i = (unint64_t)&v12[-4 * v8]; (unint64_t)a2 <= i; a2 += 4 * v8)
  {
    sub_10000EAD4((void *)(a1 + 200), a2, v8, (uint64_t)&v23);
    __int128 v14 = (char *)v23;
    sub_1000140E4(a1, v23);
    if ((unint64_t)(v24 - v14) <= 0x1FF)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      *(void *)&v22.__val_ = 514LL;
      v22.__cat_ = (const std::error_category *)&off_10003CB20;
      sub_100008914((uint64_t)exception, &v22);
    }

    unint64_t v15 = v24 - (v14 + 512);
    if (v24 != v14 + 512) {
      memmove(v14, v14 + 512, v24 - (v14 + 512));
    }
    unint64_t v24 = &v14[v15];
    if (v15 >= 0x201)
    {
      sub_1000140E4(a1, (uint64_t)v14);
      size_t v16 = v15 - 512;
      memmove(v14, v14 + 512, v16);
      unint64_t v24 = &v14[v16];
    }
  }

  if (a2 >= v12)
  {
    uint64_t v17 = (char *)v23;
    int v18 = v24;
  }

  else
  {
    sub_10000EAD4((void *)(a1 + 200), a2, (unint64_t)(v12 - a2) >> 2, (uint64_t)&v23);
    uint64_t v17 = (char *)v23;
    int v18 = v24;
    if ((unint64_t)&v24[-v23] >= 0x1FD)
    {
      sub_1000140E4(a1, v23);
      size_t v19 = v18 - (v17 + 512);
      if (v19) {
        memmove(v17, v17 + 512, v19);
      }
      int v18 = &v17[v19];
    }
  }

  unint64_t v20 = *(char **)(a1 + 104);
  *(void *)(a1 + 112) = v20;
  sub_10000E7A0(a1 + 104, v20, v17, v18, (v18 - v17) >> 2);
  if (v17) {
    operator delete(v17);
  }
}

void sub_1000138C8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100013900(uint64_t a1, unint64_t *a2, int a3)
{
  switch(a3)
  {
    case 2:
      int v6 = 4;
      goto LABEL_7;
    case 1:
      int v6 = 1;
LABEL_7:
      *(_DWORD *)(a1 + 16) = v6;
      break;
    case -1:
      int v6 = *(_DWORD *)(a1 + 16);
      break;
    default:
      *(_DWORD *)(a1 + 16) = 2;
      if (a3 == 5 || a3 == 3) {
        uint64_t v7 = 16LL;
      }
      else {
        uint64_t v7 = 24LL;
      }
      *(void *)(a1 + 80) = v7;
      int v6 = 2;
      break;
  }

  int v8 = *(_DWORD *)(a1 + 8888);
  if (v8 == v6)
  {
    sub_100013ED0(a1, (uint64_t *)(a1 + 128), a2, a3);
    return;
  }

  if (v6 == 1)
  {
    if (v8 == 4)
    {
      uint64_t v35 = 0LL;
      uint64_t v36 = 0LL;
      unint64_t v34 = 0LL;
      sub_10000C698( &v34,  *(const void **)(a1 + 128),  *(void *)(a1 + 136),  (uint64_t)(*(void *)(a1 + 136) - *(void *)(a1 + 128)) >> 3);
      __int128 v14 = v34;
      unint64_t v15 = v35;
      sub_10001216C(&__p, ((_BYTE *)v35 - (_BYTE *)v34) >> 3);
      if (v15 != v14)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Cannot convert normal peak to fat peak");
      }

      if (v15) {
        operator delete(v15);
      }
      size_t v16 = (void *)(a1 + 8);
      unsigned int v17 = *(_DWORD *)(a1 + 36) & 0xFFFFFF00;
      *(_DWORD *)(a1 + 32) = 0;
      *(_DWORD *)(a1 + 36) = v17;
      uint64_t v18 = *(void *)(a1 + 8880);
      unint64_t v19 = v18 + (uint64_t)((double)*(int *)(a1 + 292) * 0.24);
      unint64_t v20 = HIDWORD(v19);
      *(_DWORD *)(a1 + 40) = v19;
      int v21 = *(_DWORD *)(a1 + 44);
      *(_WORD *)(a1 + 44) = v20;
      int v22 = *(_DWORD *)(a1 + 8876);
      switch(v22)
      {
        case 3:
          *(_DWORD *)(a1 + 40) = v18;
          *(_DWORD *)(a1 + 44) = v21 & 0xFF0000 | WORD2(v18);
          uint64_t v25 = *(void *)(a1 + 152);
          if (v25 >= -44)
          {
            if (v25 >= 1)
            {
              uint64_t v26 = __p;
              uint64_t v27 = v41;
              while (v26 != v27)
              {
                *v26 -= v25;
                v26 += 3;
              }
            }

            sub_100005DDC(a1 + 20, v25);
          }

          *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = sub_10000F6AC(__p, (uint64_t)v41);
          unsigned int v41 = (char *)__p;
          uint64_t v28 = *(void *)(a1 + 152);
          *(_DWORD *)(a1 + 32) = v28;
          int v29 = *(_DWORD *)(a1 + 36);
          *(_BYTE *)(a1 + 36) = BYTE4(v28);
          uint64_t v30 = *(void *)(a1 + 176) - 45LL;
          *(void *)(a1 + 152) = v30;
          if (*(_DWORD *)(a1 + 16) == 4)
          {
            *(_DWORD *)(a1 + 32) = v30;
            *(_DWORD *)(a1 + 36) = v29 & 0xFFFFFF00 | BYTE4(v30);
          }

          break;
        case 2:
          unint64_t v24 = __p;
          uint64_t v23 = v41;
          sub_100012008(a1, (char **)&__p);
          void *v16 = sub_10000F6AC(__p, (uint64_t)v41);
          break;
        case 1:
          sub_100012008(a1, (char **)&__p);
          void *v16 = sub_10000F6AC(__p, (uint64_t)v41);
          break;
        default:
          uint64_t v33 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(v33, "Invalid signature type");
      }

      sub_1000107DC(a1 + 8, a2);
      sub_10000A9F8((uint64_t *)(a1 + 8));
      goto LABEL_45;
    }

LABEL_48:
    uint64_t v31 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000052EC(v31, "Invalid combination of pipeline sig options and get signature sig options.");
  }

  if (v6 != 2) {
    goto LABEL_48;
  }
  uint64_t v38 = 0LL;
  uint64_t v39 = 0LL;
  uint64_t v37 = 0LL;
  sub_10000C698( &v37,  *(const void **)(a1 + 128),  *(void *)(a1 + 136),  (uint64_t)(*(void *)(a1 + 136) - *(void *)(a1 + 128)) >> 3);
  unsigned int v9 = v37;
  int v10 = v38;
  unint64_t v11 = v38 - v37;
  sub_100012358(&__p, v11);
  if (v10 != v9)
  {
    uint64_t v12 = 0LL;
    if (v11 <= 1) {
      uint64_t v13 = 1LL;
    }
    else {
      uint64_t v13 = v11;
    }
    do
    {
      *((void *)__p + v12) = v9[v12];
      ++v12;
    }

    while (v13 != v12);
    goto LABEL_32;
  }

  unsigned int v9 = v10;
  if (v10) {
LABEL_32:
  }
    operator delete(v9);
  sub_100013ED0(a1, (uint64_t *)&__p, a2, a3);
LABEL_45:
  if (__p)
  {
    unsigned int v41 = (char *)__p;
    operator delete(__p);
  }

void sub_100013D40( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_100013DD8(uint64_t a1)
{
  *(void *)(a1 + 8880) = 0LL;
  *(void *)(a1 + 152) = 0LL;
  *(_OWORD *)(a1 + 176) = xmmword_100014C00;
  bzero(*(void **)(a1 + 160), 0x10040CuLL);
  uint64_t v2 = *(void *)(a1 + 192);
  bzero(*(void **)(v2 + 8), 4LL * (*(_DWORD *)v2 * *(_DWORD *)(v2 + 4) + 3));
  *(_DWORD *)(v2 + 40) = 0;
  if (*(_DWORD *)(a1 + 8876) == 3) {
    *(void *)(a1 + 152) = *(void *)(a1 + 176) - 45LL;
  }
  *(void *)(a1 + 112) = *(void *)(a1 + 104);
  *(void *)(a1 + 136) = *(void *)(a1 + 128);
  *(void *)(a1 + 240) = 0LL;
  *(void *)(a1 + 24std::ostream::~ostream(v2, v3 + 8) = 0LL;
  sub_10000E438(a1 + 256);
  sub_10000E508(a1 + 272);
  bzero(*(void **)(a1 + 336), 0x200CuLL);
  bzero(*(void **)(a1 + 368), 0x201CuLL);
  *(void *)(a1 + 384) = 0LL;
  *(_DWORD *)(a1 + 8864) = 0;
  int v3 = *(void **)(a1 + 312);
  if (v3) {
    bzero(v3, (unint64_t)*(unsigned int *)(a1 + 332) << (12 - *(_BYTE *)(a1 + 320)));
  }
  sub_10000A9F8((uint64_t *)(a1 + 8));
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 8888);
}

uint64_t sub_100013EC8(uint64_t a1)
{
  return a1 + 296;
}

void sub_100013ED0(uint64_t a1, uint64_t *a2, unint64_t *a3, int a4)
{
  unsigned int v7 = *(_DWORD *)(a1 + 36) & 0xFFFFFF00;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 36) = v7;
  uint64_t v8 = *(void *)(a1 + 8880);
  unint64_t v9 = v8 + (uint64_t)((double)*(int *)(a1 + 292) * 0.24);
  unint64_t v10 = HIDWORD(v9);
  *(_DWORD *)(a1 + 40) = v9;
  int v11 = *(_DWORD *)(a1 + 44);
  *(_WORD *)(a1 + 44) = v10;
  if (a4 == -1) {
    a4 = *(_DWORD *)(a1 + 8892);
  }
  if ((a4 & 0xFFFFFFFE) == 4) {
    unint64_t v12 = 3LL;
  }
  else {
    unint64_t v12 = 4LL;
  }
  int v13 = *(_DWORD *)(a1 + 8876);
  switch(v13)
  {
    case 3:
      *(_DWORD *)(a1 + 40) = v8;
      *(_DWORD *)(a1 + 44) = v11 & 0xFF0000 | WORD2(v8);
      uint64_t v14 = *(void *)(a1 + 152);
      if (v14 >= -44)
      {
        uint64_t v15 = a1 + 20;
        if (v14 >= 1)
        {
          size_t v16 = (_DWORD *)*a2;
          unsigned int v17 = (_DWORD *)a2[1];
          while (v16 != v17)
          {
            *v16 -= v14;
            v16 += 2;
          }
        }

        sub_100005DDC(v15, v14);
      }

      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = sub_10000F70C(a2, *(void *)(a1 + 80), 0, v12);
      a2[1] = *a2;
      uint64_t v20 = *(void *)(a1 + 152);
      *(_DWORD *)(a1 + 32) = v20;
      int v21 = *(_DWORD *)(a1 + 36);
      *(_BYTE *)(a1 + 36) = BYTE4(v20);
      uint64_t v22 = *(void *)(a1 + 176) - 45LL;
      *(void *)(a1 + 152) = v22;
      if (*(_DWORD *)(a1 + 16) == 4)
      {
        *(_DWORD *)(a1 + 32) = v22;
        *(_DWORD *)(a1 + 36) = v21 & 0xFFFFFF00 | BYTE4(v22);
      }

      break;
    case 2:
      uint64_t v18 = a2[1] - *a2;
      sub_100012250(a1, (void **)a2);
      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = sub_10000F70C(a2, *(void *)(a1 + 80), 1, v12);
      uint64_t v19 = *a2 + v18;
      if (v19 != a2[1]) {
        a2[1] = v19;
      }
      break;
    case 1:
      sub_100012250(a1, (void **)a2);
      *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = sub_10000F70C(a2, *(void *)(a1 + 80), 1, v12);
      break;
    default:
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      sub_1000052EC(exception, "Invalid signature type");
  }

  uint64_t v23 = (uint64_t *)(a1 + 8);
  sub_1000107DC((uint64_t)v23, a3);
  sub_10000A9F8(v23);
}

void sub_1000140D0(_Unwind_Exception *a1)
{
}

void sub_1000140E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 296;
  uint64_t v5 = a1 + 160;
  uint64_t v6 = sub_10000CC0C(*(int **)(a1 + 192), 0);
  sub_1000105FC(v4, a2, v6);
  sub_10000D880(v5, (void **)(a1 + 128));
}

uint64_t sub_100014138(uint64_t a1)
{
  *(void *)a1 = off_100038580;
  uint64_t v2 = *(void *)(a1 + 400);
  *(void *)(a1 + 400) = 0LL;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24LL))(v2);
  }
  int v3 = *(void **)(a1 + 368);
  if (v3) {
    operator delete[](v3);
  }
  uint64_t v4 = *(void **)(a1 + 352);
  if (v4) {
    operator delete[](v4);
  }
  uint64_t v5 = *(void **)(a1 + 336);
  if (v5) {
    operator delete[](v5);
  }
  uint64_t v6 = *(void **)(a1 + 272);
  if (v6) {
    operator delete[](v6);
  }
  unsigned int v7 = *(void **)(a1 + 256);
  if (v7) {
    operator delete[](v7);
  }
  uint64_t v8 = *(void **)(a1 + 216);
  if (v8)
  {
    *(void *)(a1 + 224) = v8;
    operator delete(v8);
  }

  sub_10000C888(a1 + 160);
  unint64_t v9 = *(void **)(a1 + 128);
  if (v9)
  {
    *(void *)(a1 + 136) = v9;
    operator delete(v9);
  }

  unint64_t v10 = *(void **)(a1 + 104);
  if (v10)
  {
    *(void *)(a1 + 112) = v10;
    operator delete(v10);
  }

  sub_10000A9F8((uint64_t *)(a1 + 8));
  unint64_t v12 = (void **)(a1 + 48);
  sub_10000AA7C(&v12);
  return a1;
}

uLong sub_100014210()
{
  uLong result = crc32(0LL, 0LL, 0);
  dword_10003CB30 = result;
  return result;
}

uint64_t sub_100014238()
{
  return __cxa_atexit( (void (*)(void *))std::error_category::~error_category,  &off_10003CB20,  (void *)&_mh_execute_header);
}

uint64_t sub_100014254()
{
  return __cxa_atexit( (void (*)(void *))std::error_category::~error_category,  &off_10003CB28,  (void *)&_mh_execute_header);
}

uLong sub_100014270()
{
  uLong result = crc32(0LL, 0LL, 0);
  dword_10003CBFC = result;
  return result;
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

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}