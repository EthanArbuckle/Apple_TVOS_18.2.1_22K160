BOOL sub_100002E68(uint64_t a1, uint64_t a2)
{
  const void **v4;
  unsigned __int8 **v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned __int8 *v11;
  int v12;
  int v13;
  if (*(_DWORD *)a1 > *(_DWORD *)a2) {
    return 1LL;
  }
  if (*(_DWORD *)a1 != *(_DWORD *)a2) {
    return 0LL;
  }
  v4 = (const void **)(a1 + 8);
  v5 = (unsigned __int8 **)(a2 + 8);
  v7 = *(unsigned __int8 *)(a1 + 31);
  if ((v7 & 0x80u) == 0LL) {
    v8 = *(unsigned __int8 *)(a1 + 31);
  }
  else {
    v8 = *(void *)(a1 + 16);
  }
  v9 = *(unsigned __int8 *)(a2 + 31);
  v10 = (char)v9;
  if ((v9 & 0x80u) != 0LL) {
    v9 = *(void *)(a2 + 16);
  }
  if (v8 != v9) {
    return 0LL;
  }
  if (v10 >= 0) {
    v11 = (unsigned __int8 *)v5;
  }
  else {
    v11 = *v5;
  }
  if ((v7 & 0x80) != 0)
  {
    if (memcmp(*v4, v11, *(void *)(a1 + 16))) {
      return 0LL;
    }
  }

  else if (*(_BYTE *)(a1 + 31))
  {
    while (*(unsigned __int8 *)v4 == *v11)
    {
      v4 = (const void **)((char *)v4 + 1);
      ++v11;
      if (!--v7) {
        goto LABEL_20;
      }
    }

    return 0LL;
  }

LABEL_20:
  v12 = *(_DWORD *)(a1 + 32);
  v13 = *(_DWORD *)(a2 + 32);
  if (v12 > v13) {
    return 1LL;
  }
  if (v12 == v13) {
    return *(_DWORD *)(a1 + 36) > *(_DWORD *)(a2 + 36);
  }
  return 0LL;
}

uint64_t sub_100002F6C(void *a1, void **a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = a1[1];
  if ((v2 & 0x80u) != 0LL)
  {
    a1 = (void *)*a1;
    size_t v2 = v3;
  }

  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    v5 = a2;
  }
  else {
    v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return sub_100006AA4(a1, v2, v5, v6);
}

BOOL sub_100002FA4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != *(_DWORD *)a2) {
    return 0LL;
  }
  uint64_t v4 = *(unsigned __int8 *)(a1 + 31);
  if ((v4 & 0x80u) == 0LL) {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 31);
  }
  else {
    uint64_t v5 = *(void *)(a1 + 16);
  }
  uint64_t v6 = *(unsigned __int8 *)(a2 + 31);
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = *(void *)(a2 + 16);
  }
  if (v5 != v6) {
    return 0LL;
  }
  v8 = (const void **)(a1 + 8);
  if (v7 >= 0) {
    v9 = (unsigned __int8 *)(a2 + 8);
  }
  else {
    v9 = *(unsigned __int8 **)(a2 + 8);
  }
  if ((v4 & 0x80) != 0)
  {
    if (memcmp(*v8, v9, *(void *)(a1 + 16))) {
      return 0LL;
    }
  }

  else if (*(_BYTE *)(a1 + 31))
  {
    while (*(unsigned __int8 *)v8 == *v9)
    {
      v8 = (const void **)((char *)v8 + 1);
      ++v9;
      if (!--v4) {
        goto LABEL_17;
      }
    }

    return 0LL;
  }

LABEL_17:
  if (*(_DWORD *)(a1 + 32) == *(_DWORD *)(a2 + 32)) {
    return *(_DWORD *)(a1 + 36) == *(_DWORD *)(a2 + 36);
  }
  return 0LL;
}

    v10 = 0;
    goto LABEL_25;
  }

  if (v4 == v2)
  {
    uint64_t v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        uint64_t v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16LL) + 4 * v6) & 0x500) != 0)
        {
          v10 = 1;
          goto LABEL_25;
        }

        goto LABEL_17;
      }

      goto LABEL_17;
    }
  }

  int v7 = *(v4 - 1);
  v8 = *v4;
  v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16LL) + 4 * v7) & 0x500) != 0;
  v11 = (_DWORD)v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16LL) + 4 * v8) & 0x500) != 0;
  v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    v12 = 0LL;
    v13 = -993;
  }

  else
  {
    v12 = *(void *)(result + 8);
    v13 = -994;
  }

  *(_DWORD *)a2 = v13;
  *(void *)(a2 + 80) = v12;
  return result;
}

void sub_100003078(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = 0LL;
  uint64_t v33 = 0LL;
  char v34 = 0;
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  char v37 = 0;
  char v38 = 0;
  uint64_t v39 = 0LL;
  *(_OWORD *)__p = 0u;
  memset(v31, 0, 25);
  uint64_t v4 = *(unsigned __int8 *)(a2 + 23);
  if ((v4 & 0x80u) == 0LL) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *(void *)a2;
  }
  if ((v4 & 0x80u) != 0LL) {
    uint64_t v4 = *(void *)(a2 + 8);
  }
  char v6 = sub_10000F008(v5, v5 + v4, (uint64_t)__p, (uint64_t)&v40, 0);
  else {
    char v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    else {
      v27 = *(const char **)a2;
    }
    warn( "Cannot parse version string %s, results.size() = %d",  v27,  -1431655765 * (((char *)__p[1] - (char *)__p[0]) >> 3));
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "no match");
  }

  if (*((_BYTE *)__p[0] + 40)) {
    sub_10000BCC0( &__str,  *((char **)__p[0] + 3),  *((char **)__p[0] + 4),  *((void *)__p[0] + 4) - *((void *)__p[0] + 3));
  }
  else {
    memset(&__str, 0, sizeof(__str));
  }
  *(_DWORD *)a1 = std::stoi(&__str, 0LL, 10);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p[1] - (char *)__p[0]) >> 3);
  v9 = (char *)__p[0] + 64;
  if (v8 <= 2) {
    v9 = (char *)&v31[1] + 8;
  }
  if (*v9)
  {
    BOOL v10 = v8 > 2;
    if (v8 <= 2) {
      v11 = (char **)v31 + 1;
    }
    else {
      v11 = (char **)((char *)__p[0] + 48);
    }
    v12 = (char **)((char *)__p[0] + 56);
    if (!v10) {
      v12 = (char **)&v31[1];
    }
    sub_10000BCC0(&__str, *v11, *v12, *v12 - *v11);
  }

  else
  {
    memset(&__str, 0, sizeof(__str));
  }

  v13 = (void **)(a1 + 8);
  *(_OWORD *)v13 = *(_OWORD *)&__str.__r_.__value_.__l.__data_;
  *(void *)(a1 + 24) = __str.__r_.__value_.__l.__cap_;
  unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p[1] - (char *)__p[0]) >> 3);
  v15 = (char *)__p[0] + 88;
  if (v14 <= 3) {
    v15 = (char *)&v31[1] + 8;
  }
  if (*v15)
  {
    BOOL v16 = v14 > 3;
    if (v14 <= 3) {
      v17 = (char **)v31 + 1;
    }
    else {
      v17 = (char **)((char *)__p[0] + 72);
    }
    v18 = (char **)((char *)__p[0] + 80);
    if (!v16) {
      v18 = (char **)&v31[1];
    }
    sub_10000BCC0(&__str, *v17, *v18, *v18 - *v17);
  }

  else
  {
    memset(&__str, 0, sizeof(__str));
  }

  *(_DWORD *)(a1 + 32) = std::stoi(&__str, 0LL, 10);
  unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p[1] - (char *)__p[0]) >> 3);
  v20 = (char *)__p[0] + 112;
  if (v19 <= 4) {
    v20 = (char *)&v31[1] + 8;
  }
  if (*v20)
  {
    BOOL v21 = v19 > 4;
    if (v19 <= 4) {
      v22 = (char **)v31 + 1;
    }
    else {
      v22 = (char **)((char *)__p[0] + 96);
    }
    v23 = (char **)((char *)__p[0] + 104);
    if (!v21) {
      v23 = (char **)&v31[1];
    }
    sub_10000BCC0(&__str, *v22, *v23, *v23 - *v22);
  }

  else
  {
    memset(&__str, 0, sizeof(__str));
  }

  *(_DWORD *)(a1 + 36) = std::stoi(&__str, 0LL, 10);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  v24 = v41;
  if (v41)
  {
    p_shared_owners = (unint64_t *)&v41->__shared_owners_;
    do
      unint64_t v26 = __ldaxr(p_shared_owners);
    while (__stlxr(v26 - 1, p_shared_owners));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }

  std::locale::~locale(&v40);
}

#error "100003564: call analysis failed (funcsize=51)"
std::logic_error *sub_1000035EC(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100003610(void *a1)
{
}

double sub_100003620(uint64_t a1)
{
  *(_DWORD *)a1 = -1;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 8) = 0LL;
  double result = NAN;
  *(void *)(a1 + 32) = -1LL;
  return result;
}

void *sub_10000363C(void *a1, uint64_t a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  a1[3] = 0LL;
  sub_100003078((uint64_t)a1, a2);
  return a1;
}

void sub_100003674(_Unwind_Exception *exception_object)
{
}

void sub_100003694(const std::__fs::filesystem::path *a1@<X0>, uint64_t a2@<X8>)
{
  if ((v6 & 0x80000000) == 0)
  {
    if (v6) {
      goto LABEL_3;
    }
LABEL_6:
    sub_10000380C(a1, a2);
    return;
  }

  uint64_t v4 = v5[1];
  operator delete(v5[0]);
  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  if ((char)a1->__pn_.__r_.__value_.__s.__size_ < 0)
  {
    sub_100006C08((_BYTE *)a2, a1->__pn_.__r_.__value_.__l.__data_, a1->__pn_.__r_.__value_.__l.__size_);
  }

  else
  {
    *(_OWORD *)a2 = *(_OWORD *)&a1->__pn_.__r_.__value_.__l.__data_;
    *(void *)(a2 + 16) = a1->__pn_.__r_.__value_.__l.__cap_;
  }
}

double sub_10000371C@<D0>(const std::__fs::filesystem::path *a1@<X0>, uint64_t a2@<X8>)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__filename(a1);
  if (v3.__size >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100006B58();
  }
  if (v3.__size >= 0x17)
  {
    std::basic_string_view<_CharT, _Traits>::size_type v5 = (v3.__size & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v3.__size | 7) != 0x17) {
      std::basic_string_view<_CharT, _Traits>::size_type v5 = v3.__size | 7;
    }
    std::basic_string_view<_CharT, _Traits>::size_type v6 = v5 + 1;
    p_dst = (__int128 *)operator new(v5 + 1);
    *((void *)&__dst + 1) = v3.__size;
    unint64_t v9 = v6 | 0x8000000000000000LL;
    *(void *)&__int128 __dst = p_dst;
  }

  else
  {
    HIBYTE(v9) = v3.__size;
    p_dst = &__dst;
    if (!v3.__size) {
      goto LABEL_9;
    }
  }

  memmove(p_dst, v3.__data, v3.__size);
LABEL_9:
  *((_BYTE *)p_dst + v3.__size) = 0;
  double result = *(double *)&__dst;
  *(_OWORD *)a2 = __dst;
  *(void *)(a2 + 16) = v9;
  return result;
}

uint64_t sub_1000037DC(uint64_t a1)
{
  return a1;
}

double sub_10000380C@<D0>(const std::__fs::filesystem::path *a1@<X0>, uint64_t a2@<X8>)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__parent_path(a1);
  if (v3.__size >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100006B58();
  }
  if (v3.__size >= 0x17)
  {
    std::basic_string_view<_CharT, _Traits>::size_type v5 = (v3.__size & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v3.__size | 7) != 0x17) {
      std::basic_string_view<_CharT, _Traits>::size_type v5 = v3.__size | 7;
    }
    std::basic_string_view<_CharT, _Traits>::size_type v6 = v5 + 1;
    p_dst = (__int128 *)operator new(v5 + 1);
    *((void *)&__dst + 1) = v3.__size;
    unint64_t v9 = v6 | 0x8000000000000000LL;
    *(void *)&__int128 __dst = p_dst;
  }

  else
  {
    HIBYTE(v9) = v3.__size;
    p_dst = &__dst;
    if (!v3.__size) {
      goto LABEL_9;
    }
  }

  memmove(p_dst, v3.__data, v3.__size);
LABEL_9:
  *((_BYTE *)p_dst + v3.__size) = 0;
  double result = *(double *)&__dst;
  *(_OWORD *)a2 = __dst;
  *(void *)(a2 + 16) = v9;
  return result;
}

void *sub_1000038CC(void *result)
{
  *double result = &off_100014328;
  result[1] = 0LL;
  result[2] = 0LL;
  result[3] = 0LL;
  return result;
}

void *sub_1000038E0(void *a1, const std::__fs::filesystem::path *a2)
{
  *a1 = &off_100014328;
  sub_100003694(a2, (uint64_t)(a1 + 1));
  return a1;
}

uint64_t sub_100003918(uint64_t a1)
{
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)a1 = off_100014348;
  sub_1000112B4((std::string *)(a1 + 32), "/usr/share/zoneinfo.default");
  *(void *)(a1 + 56) = 0LL;
  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 72) = 0LL;
  sub_1000039DC(a1);
  return a1;
}

void sub_10000398C(_Unwind_Exception *exception_object)
{
  *(void *)uint64_t v1 = &off_100014328;
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000039DC(uint64_t a1)
{
  if ((__p.__pn_.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::__fs::filesystem::path *)__p.__pn_.__r_.__value_.__r.__words[0];
  }
  sub_1000114D4(v6, (uint64_t)p_p, 8);
  sub_100003D04((uint64_t *)v6, (std::string *)(a1 + 56));
  std::filebuf::~filebuf(&v7);
  return std::ios::~ios(&v8);
}

void sub_100003AE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22)
{
}

uint64_t sub_100003B30(uint64_t a1, const std::__fs::filesystem::path *a2)
{
  *(void *)a1 = &off_100014328;
  sub_100003694(a2, a1 + 8);
  *(void *)a1 = off_100014348;
  *(_OWORD *)(a1 + 32) = 0u;
  std::__fs::filesystem::path v4 = (void **)(a1 + 32);
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  std::string::size_type size = a2->__pn_.__r_.__value_.__s.__size_;
  if ((size & 0x80u) != 0LL) {
    std::string::size_type size = a2->__pn_.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    sub_1000112B4(&__p, "zoneinfo");
    sub_100003C90((std::__fs::filesystem::path *)&__p, (uint64_t)a2, &v8);
    *(_OWORD *)std::__fs::filesystem::path v4 = *(_OWORD *)&v8.__pn_.__r_.__value_.__l.__data_;
    *(void *)(a1 + 48) = v8.__pn_.__r_.__value_.__l.__cap_;
    v8.__pn_.__r_.__value_.__s.__size_ = 0;
    v8.__pn_.__r_.__value_.__s.__data_[0] = 0;
  }

  else
  {
    sub_100011480((std::string *)(a1 + 32), "/usr/share/zoneinfo.default");
  }

  sub_1000039DC(a1);
  return a1;
}

void sub_100003C34( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  *(void *)uint64_t v15 = v17;
  _Unwind_Resume(exception_object);
}

std::__fs::filesystem::path *sub_100003C90@<X0>( std::__fs::filesystem::path *this@<X1>, uint64_t a2@<X0>, std::__fs::filesystem::path *a3@<X8>)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100006C08(a3, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__pn_.__r_.__value_.__l.__cap_ = *(void *)(a2 + 16);
  }

  return sub_100005720(a3, this);
}

void sub_100003CE4(_Unwind_Exception *exception_object)
{
}

uint64_t *sub_100003D04(uint64_t *a1, std::string *a2)
{
  if (!v20) {
    return a1;
  }
  if ((char)a2->__r_.__value_.__s.__size_ < 0)
  {
    *a2->__r_.__value_.__l.__data_ = 0;
    a2->__r_.__value_.__l.__size_ = 0LL;
  }

  else
  {
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2->__r_.__value_.__s.__size_ = 0;
  }

  uint64_t v4 = *(void *)(*a1 - 24);
  uint64_t v5 = *(uint64_t *)((char *)a1 + v4 + 24);
  if (v5 <= 1) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = *(uint64_t *)((char *)a1 + v4 + 24);
  }
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + v4));
  uint64_t v7 = std::locale::use_facet(&v19, &std::ctype<char>::id);
  std::locale::~locale(&v19);
  uint64_t v8 = 0LL;
  unint64_t v9 = a1 + 5;
  if (v5 >= 1) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFF7LL;
  }
  while (1)
  {
    v11 = *(void **)((char *)v9 + *(void *)(*a1 - 24));
    v12 = (_BYTE *)v11[3];
    if (v12 == (_BYTE *)v11[4]) {
      break;
    }
    LOBYTE(v13) = *v12;
LABEL_14:
    if ((v13 & 0x80) == 0 && (*((_DWORD *)&v7[1].~facet + v13) & 0x4000) != 0)
    {
      int v16 = 0;
      goto LABEL_23;
    }

    std::string::push_back(a2, v13);
    unint64_t v14 = *(void **)((char *)v9 + *(void *)(*a1 - 24));
    uint64_t v15 = v14[3];
    if (v15 == v14[4]) {
      (*(void (**)(void *))(*v14 + 80LL))(v14);
    }
    else {
      v14[3] = v15 + 1;
    }
    if (v10 == ++v8)
    {
      int v16 = 0;
      uint64_t v17 = *a1;
      *(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 24) = 0LL;
      goto LABEL_25;
    }
  }

  int v13 = (*(uint64_t (**)(void *))(*v11 + 72LL))(v11);
  if (v13 != -1) {
    goto LABEL_14;
  }
  int v16 = 2;
LABEL_23:
  uint64_t v17 = *a1;
  *(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 24) = 0LL;
  if (!v8) {
    v16 |= 4u;
  }
LABEL_25:
  std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(v17 - 24)),  *(_DWORD *)((char *)a1 + *(void *)(v17 - 24) + 32) | v16);
  return a1;
}

void sub_100003EB8( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  uint64_t v11 = *v9;
  *(_DWORD *)((char *)v9 + *(void *)(*v9 - 24LL) + 32) |= 1u;
  if ((*((_BYTE *)v9 + *(void *)(v11 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x100003E84LL);
  }

  __cxa_rethrow();
}

void sub_100003F1C(_Unwind_Exception *a1)
{
}

void *sub_100003F30(void *a1)
{
  return a1;
}

uint64_t sub_100003F88()
{
  return 1LL;
}

char *sub_100003F90@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  if (result[79] < 0) {
    return (char *)sub_100006C08((_BYTE *)a2, *((void **)result + 7), *((void *)result + 8));
  }
  *(_OWORD *)a2 = *(_OWORD *)(result + 56);
  *(void *)(a2 + 16) = *((void *)result + 9);
  return result;
}

void sub_100003FBC(uint64_t a1)
{
}

void sub_100004020(void *a1)
{
}

void sub_100004038( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100004064(uint64_t a1)
{
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(void *)a1 = &off_100014368;
  *(void *)(a1 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0LL;
  *(void *)(a1 + 48) = 0LL;
  sub_1000112B4((std::string *)(a1 + 56), "/usr/share/icu");
  sub_100004128(a1);
  return a1;
}

void sub_1000040D8(_Unwind_Exception *exception_object)
{
  *(void *)uint64_t v1 = &off_100014328;
  _Unwind_Resume(exception_object);
}

void sub_100004128(uint64_t a1)
{
  if ((*(char *)(a1 + 31) & 0x80000000) == 0)
  {
    if (*(_BYTE *)(a1 + 31)) {
      goto LABEL_3;
    }
LABEL_14:
    sub_1000112B4(&__dst, "icutzformat.txt");
    sub_100003C90((std::__fs::filesystem::path *)&__dst, a1 + 56, __p);
    if ((__p[0].__pn_.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v10 = __p;
    }
    else {
      uint64_t v10 = (std::__fs::filesystem::path *)__p[0].__pn_.__r_.__value_.__r.__words[0];
    }
    sub_1000114D4((void (__cdecl ***)(std::ifstream *__hidden))v42, (uint64_t)v10, 8);
    sub_100003D04((uint64_t *)v42, (std::string *)(a1 + 32));
    std::filebuf::~filebuf(v43);
    std::ios::~ios(&v52);
    return;
  }

  if (!*(void *)(a1 + 16)) {
    goto LABEL_14;
  }
LABEL_3:
  sub_100006E8C((std::locale *)__p, "icutz([0-9]+[lbe])", 0);
  uint64_t v44 = 0LL;
  uint64_t v45 = 0LL;
  char v46 = 0;
  uint64_t v47 = 0LL;
  uint64_t v48 = 0LL;
  char v49 = 0;
  char v50 = 0;
  uint64_t v51 = 0LL;
  *(_OWORD *)v42 = 0u;
  memset(v43, 0, 25);
  std::__fs::filesystem::directory_iterator::directory_iterator( &v38,  (const std::__fs::filesystem::path *)(a1 + 56),  0LL,  none);
  ptr = v38.__imp_.__ptr_;
  cntrl = v38.__imp_.__cntrl_;
  if (v38.__imp_.__cntrl_)
  {
    p_shared_owners = &v38.__imp_.__cntrl_->__shared_owners_;
    do
      unint64_t v5 = __ldxr((unint64_t *)p_shared_owners);
    while (__stxr(v5 + 1, (unint64_t *)p_shared_owners));
    uint64_t v6 = v38.__imp_.__cntrl_;
    v37.__imp_.__ptr_ = ptr;
    v37.__imp_.__cntrl_ = cntrl;
    if (v38.__imp_.__cntrl_)
    {
      uint64_t v7 = &v38.__imp_.__cntrl_->__shared_owners_;
      do
        unint64_t v8 = __ldxr((unint64_t *)v7);
      while (__stxr(v8 + 1, (unint64_t *)v7));
      uint64_t v35 = 0LL;
      uint64_t v36 = 0LL;
      do
        unint64_t v9 = __ldaxr((unint64_t *)v7);
      while (__stlxr(v9 - 1, (unint64_t *)v7));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }

      goto LABEL_24;
    }
  }

  else
  {
    v37.__imp_.__ptr_ = v38.__imp_.__ptr_;
    v37.__imp_.__cntrl_ = 0LL;
  }

  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
LABEL_24:
  uint64_t v11 = (const char *)(a1 + 8);
  v12 = (void **)(a1 + 32);
  int v13 = v35;
  while (v37.__imp_.__ptr_ != v13)
  {
    unint64_t v14 = (std::__fs::filesystem::directory_entry *)std::__fs::filesystem::directory_iterator::__dereference(&v37);
    if (!sub_1000048A0(&v14->__p_)) {
      goto LABEL_57;
    }
    sub_100006D28(&v14->__p_, 0LL, (uint64_t)&__dst);
    if ((__dst.__r_.__value_.__s.__data_[4] & 4) == 0) {
      goto LABEL_57;
    }
    sub_1000048F0(&v14->__p_, (uint64_t)&v34);
    if ((char)v34.__pn_.__r_.__value_.__s.__size_ < 0)
    {
      sub_100006C08(&__dst, v34.__pn_.__r_.__value_.__l.__data_, v34.__pn_.__r_.__value_.__l.__size_);
    }

    else
    {
      std::string __dst = v34.__pn_;
    }

    sub_1000049E8(&v14->__p_, (uint64_t)&v34);
    sub_1000112B4(&v33, ".dat");
    v53.__data = (const std::string_view::value_type *)&v33;
    if (!sub_1000049B0(&v34, v53)) {
      goto LABEL_49;
    }
    std::string::size_type size = __dst.__r_.__value_.__s.__size_;
    if ((__dst.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_dst = &__dst;
    }
    else {
      p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
    }
    if ((__dst.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type size = __dst.__r_.__value_.__l.__size_;
    }
    if (!sub_10000F008((uint64_t)p_dst, (uint64_t)p_dst + size, (uint64_t)v42, (uint64_t)__p, 0))
    {
LABEL_49:
LABEL_53:
      char v20 = 1;
      goto LABEL_54;
    }

    v18 = v42[0];
    uint64_t v17 = v42[1];
    if (v17 - v18 != 48) {
      goto LABEL_53;
    }
    else {
      std::locale v19 = (void **)v42[0];
    }
    if (*((_BYTE *)v19 + 40)) {
      sub_10000BCC0(&v34, (char *)v19[3], (char *)v19[4], (_BYTE *)v19[4] - (_BYTE *)v19[3]);
    }
    else {
      memset(&v34, 0, sizeof(v34));
    }
    char v20 = 0;
    *(_OWORD *)v12 = *(_OWORD *)&v34.__pn_.__r_.__value_.__l.__data_;
    *(void *)(a1 + 48) = v34.__pn_.__r_.__value_.__l.__cap_;
LABEL_54:
    if ((v20 & 1) == 0) {
      break;
    }
LABEL_57:
    std::__fs::filesystem::directory_iterator::__increment(&v37, 0LL);
  }

  BOOL v21 = v36;
  if (v36)
  {
    v22 = (unint64_t *)&v36->__shared_owners_;
    do
      unint64_t v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  v24 = v37.__imp_.__cntrl_;
  if (v37.__imp_.__cntrl_)
  {
    v25 = &v37.__imp_.__cntrl_->__shared_owners_;
    do
      unint64_t v26 = __ldaxr((unint64_t *)v25);
    while (__stlxr(v26 - 1, (unint64_t *)v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }

  v27 = v38.__imp_.__cntrl_;
  if (v38.__imp_.__cntrl_)
  {
    v28 = &v38.__imp_.__cntrl_->__shared_owners_;
    do
      unint64_t v29 = __ldaxr((unint64_t *)v28);
    while (__stlxr(v29 - 1, (unint64_t *)v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }

  if (*(char *)(a1 + 55) < 0)
  {
    if (!*(void *)(a1 + 40)) {
      goto LABEL_81;
    }
  }

  else if (!*(_BYTE *)(a1 + 55))
  {
LABEL_81:
    warn("No ICU schema found for %s", v11);
  }

  if (v42[0])
  {
    v42[1] = v42[0];
    operator delete(v42[0]);
  }

  v30 = v40;
  if (v40)
  {
    v31 = (unint64_t *)&v40->__shared_owners_;
    do
      unint64_t v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }

  std::locale::~locale((std::locale *)__p);
}

void sub_10000462C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20, char a21, char a22, char a23, uint64_t a24, char a25, uint64_t a26, char a27, uint64_t a28, std::locale a29, uint64_t a30, int a31, __int16 a32, char a33, char a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, void *a40, uint64_t a41, int a42, __int16 a43, char a44, char a45, uint64_t a46, void *__p, uint64_t a48)
{
  if (__p)
  {
    a48 = (uint64_t)__p;
    operator delete(__p);
  }

  sub_100006B00((uint64_t)&a37);
  std::locale::~locale(&a29);
  _Unwind_Resume(a1);
}

uint64_t sub_100004738(uint64_t a1, const std::__fs::filesystem::path *a2)
{
  *(void *)a1 = &off_100014328;
  sub_100003694(a2, a1 + 8);
  *(void *)a1 = &off_100014368;
  *(_OWORD *)(a1 + 32) = 0u;
  uint64_t v4 = (void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  std::string::size_type size = a2->__pn_.__r_.__value_.__s.__size_;
  if ((size & 0x80u) != 0LL) {
    std::string::size_type size = a2->__pn_.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    sub_1000112B4(&__p, "icutz");
    sub_100003C90((std::__fs::filesystem::path *)&__p, (uint64_t)a2, &v8);
    *(_OWORD *)uint64_t v4 = *(_OWORD *)&v8.__pn_.__r_.__value_.__l.__data_;
    *(void *)(a1 + 72) = v8.__pn_.__r_.__value_.__l.__cap_;
    v8.__pn_.__r_.__value_.__s.__size_ = 0;
    v8.__pn_.__r_.__value_.__s.__data_[0] = 0;
  }

  else
  {
    sub_100011480((std::string *)(a1 + 56), "/usr/share/icu");
  }

  sub_100004128(a1);
  return a1;
}

void sub_100004840( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  *(void *)uint64_t v15 = v17;
  _Unwind_Resume(exception_object);
}

BOOL sub_1000048A0(const std::__fs::filesystem::path *a1)
{
  if (((1 << a1[3].__pn_.__r_.__value_.__s.__data_[1]) & 0x13) != 0)
  {
    std::__fs::filesystem::__status(a1, 0LL);
    int v1 = v3;
  }

  else
  {
    int v1 = a1[3].__pn_.__r_.__value_.__s.__data_[0];
  }

  return v1 == 1;
}

double sub_1000048F0@<D0>(const std::__fs::filesystem::path *a1@<X0>, uint64_t a2@<X8>)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__stem(a1);
  if (v3.__size >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100006B58();
  }
  if (v3.__size >= 0x17)
  {
    std::basic_string_view<_CharT, _Traits>::size_type v5 = (v3.__size & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v3.__size | 7) != 0x17) {
      std::basic_string_view<_CharT, _Traits>::size_type v5 = v3.__size | 7;
    }
    std::basic_string_view<_CharT, _Traits>::size_type v6 = v5 + 1;
    p_dst = (__int128 *)operator new(v5 + 1);
    *((void *)&__dst + 1) = v3.__size;
    unint64_t v9 = v6 | 0x8000000000000000LL;
    *(void *)&__int128 __dst = p_dst;
  }

  else
  {
    HIBYTE(v9) = v3.__size;
    p_dst = &__dst;
    if (!v3.__size) {
      goto LABEL_9;
    }
  }

  memmove(p_dst, v3.__data, v3.__size);
LABEL_9:
  *((_BYTE *)p_dst + v3.__size) = 0;
  double result = *(double *)&__dst;
  *(_OWORD *)a2 = __dst;
  *(void *)(a2 + 16) = v9;
  return result;
}

BOOL sub_1000049B0(const std::__fs::filesystem::path *a1, std::__fs::filesystem::path::__string_view a2)
{
  std::basic_string_view<_CharT, _Traits>::size_type v2 = *((void *)a2.__data + 1);
  if (*((char *)a2.__data + 23) >= 0)
  {
    a2.__std::string::size_type size = *((unsigned __int8 *)a2.__data + 23);
  }

  else
  {
    a2.__data = *(const std::string_view::value_type **)a2.__data;
    a2.__std::string::size_type size = v2;
  }

  return std::__fs::filesystem::path::__compare(a1, a2) == 0;
}

double sub_1000049E8@<D0>(const std::__fs::filesystem::path *a1@<X0>, uint64_t a2@<X8>)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__extension(a1);
  if (v3.__size >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100006B58();
  }
  if (v3.__size >= 0x17)
  {
    std::basic_string_view<_CharT, _Traits>::size_type v5 = (v3.__size & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v3.__size | 7) != 0x17) {
      std::basic_string_view<_CharT, _Traits>::size_type v5 = v3.__size | 7;
    }
    std::basic_string_view<_CharT, _Traits>::size_type v6 = v5 + 1;
    p_dst = (__int128 *)operator new(v5 + 1);
    *((void *)&__dst + 1) = v3.__size;
    unint64_t v9 = v6 | 0x8000000000000000LL;
    *(void *)&__int128 __dst = p_dst;
  }

  else
  {
    HIBYTE(v9) = v3.__size;
    p_dst = &__dst;
    if (!v3.__size) {
      goto LABEL_9;
    }
  }

  memmove(p_dst, v3.__data, v3.__size);
LABEL_9:
  *((_BYTE *)p_dst + v3.__size) = 0;
  double result = *(double *)&__dst;
  *(_OWORD *)a2 = __dst;
  *(void *)(a2 + 16) = v9;
  return result;
}

BOOL sub_100004AA8(uint64_t a1, void *lpsrc)
{
  if (!v3)
  {
    warn("tzu_icu::compatible_schema: could not dynamic_cast other component");
    return 0LL;
  }

  uint64_t v4 = *(unsigned __int8 *)(a1 + 55);
  if ((v4 & 0x80u) == 0LL) {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 55);
  }
  else {
    uint64_t v5 = *(void *)(a1 + 40);
  }
  uint64_t v6 = *((unsigned __int8 *)v3 + 55);
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = v3[5];
  }
  if (v5 != v6) {
    return 0LL;
  }
  std::__fs::filesystem::path v8 = (const void **)(a1 + 32);
  uint64_t v11 = (unsigned __int8 *)v3[4];
  unint64_t v9 = (unsigned __int8 *)(v3 + 4);
  uint64_t v10 = v11;
  if (v7 >= 0) {
    v12 = v9;
  }
  else {
    v12 = v10;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*v8, v12, *(void *)(a1 + 40)) == 0;
  }
  if (!*(_BYTE *)(a1 + 55)) {
    return 1LL;
  }
  uint64_t v13 = v4 - 1;
  do
  {
    int v15 = *(unsigned __int8 *)v8;
    std::__fs::filesystem::path v8 = (const void **)((char *)v8 + 1);
    int v14 = v15;
    int v17 = *v12++;
    int v16 = v17;
    BOOL v19 = v13-- != 0;
    BOOL result = v14 == v16;
  }

  while (v14 == v16 && v19);
  return result;
}

void sub_100004B84(uint64_t a1)
{
  if (*(char *)(a1 + 31) < 0)
  {
    if (!*(void *)(a1 + 16)) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  if (*(_BYTE *)(a1 + 31)) {
LABEL_5:
  }
    std::__fs::filesystem::__create_symlink((const std::__fs::filesystem::path *)(a1 + 56), &__new_symlink, 0LL);
LABEL_6:
}

void sub_100004C34( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100004C90(uint64_t a1)
{
  *(void *)(a1 + 8) = 0LL;
  *(_DWORD *)a1 = -1;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = -1LL;
  *(_OWORD *)(a1 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(void *)(a1 + 104) = 0LL;
  sub_100004D38(a1);
  return a1;
}

void sub_100004CFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  a10 = (void **)(v10 + 88);
  sub_100006D88(&a10);
  sub_100011B84(v10, v12, v11);
  _Unwind_Resume(a1);
}

void sub_100004D38(uint64_t a1)
{
  std::basic_string_view<_CharT, _Traits>::size_type v2 = (char *)operator new(0x50uLL);
  std::__fs::filesystem::path::__string_view v3 = (const char *)(a1 + 64);
  sub_100003B30((uint64_t)v2, (const std::__fs::filesystem::path *)(a1 + 64));
  if (*(char *)(a1 + 87) < 0)
  {
    if (*(void *)(a1 + 72))
    {
LABEL_3:
      sub_10000380C((const std::__fs::filesystem::path *)(a1 + 64), (uint64_t)&__p);
      v56.__data = (const std::string_view::value_type *)&unk_100018000;
      BOOL v4 = sub_1000049B0((const std::__fs::filesystem::path *)&__p, v56);
      if (!v4)
      {
        warn("tzu_dataset::create_components: bad path %s", v3);
        exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
        sub_1000035EC(exception, "badpath");
        sub_100011BC4(exception);
      }

      sub_10000371C((const std::__fs::filesystem::path *)(a1 + 64), (uint64_t)&v55);
      else {
        std::string __p = v55;
      }
      uint64_t v5 = (void **)(a1 + 40);
      *(_OWORD *)uint64_t v5 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
      *(void *)(a1 + 56) = __p.__r_.__value_.__l.__cap_;
      __p.__r_.__value_.__s.__size_ = 0;
      __p.__r_.__value_.__s.__data_[0] = 0;
      if ((char)v55.__r_.__value_.__s.__size_ < 0)
      {
        uint64_t v6 = (void *)v55.__r_.__value_.__r.__words[0];
LABEL_21:
        operator delete(v6);
        goto LABEL_22;
      }

      goto LABEL_22;
    }
  }

  else if (*(_BYTE *)(a1 + 87))
  {
    goto LABEL_3;
  }

  if (v2[79] < 0) {
    sub_100006C08(&__p, *((void **)v2 + 7), *((void *)v2 + 8));
  }
  else {
    std::string __p = *(std::string *)(v2 + 56);
  }
  int v7 = std::string::append(&__p, ".1.0", 4uLL);
  std::string::size_type v8 = v7->__r_.__value_.__r.__words[0];
  v55.__r_.__value_.__r.__words[0] = v7->__r_.__value_.__l.__size_;
  *(std::string::size_type *)((char *)v55.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v7->__r_.__value_.__r.__words[1] + 7);
  unsigned __int8 size = v7->__r_.__value_.__s.__size_;
  v7->__r_.__value_.__l.__size_ = 0LL;
  v7->__r_.__value_.__l.__cap_ = 0LL;
  v7->__r_.__value_.__r.__words[0] = 0LL;
  std::string::size_type v10 = v55.__r_.__value_.__r.__words[0];
  *(void *)(a1 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v8;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 55) = *(std::string::size_type *)((char *)v55.__r_.__value_.__r.__words + 7);
  *(_BYTE *)(a1 + 63) = size;
  if ((char)__p.__r_.__value_.__s.__size_ < 0)
  {
    uint64_t v6 = (void *)__p.__r_.__value_.__r.__words[0];
    goto LABEL_21;
  }

LABEL_22:
  sub_100003078(a1, a1 + 40);
  sub_1000115E0(&v55, (uint64_t)v2);
  uint64_t v11 = (int64x2_t *)(a1 + 88);
  unint64_t v12 = *(void *)(a1 + 104);
  uint64_t v13 = *(_OWORD **)(a1 + 96);
  if ((unint64_t)v13 >= v12)
  {
    uint64_t v14 = ((uint64_t)v13 - v11->i64[0]) >> 4;
    unint64_t v15 = v14 + 1;
    uint64_t v16 = v12 - v11->i64[0];
    if (v16 >> 3 > v15) {
      unint64_t v15 = v16 >> 3;
    }
    else {
      unint64_t v17 = v15;
    }
    uint64_t v54 = a1 + 104;
    v18 = (char *)sub_100006E0C(a1 + 104, v17);
    char v20 = &v18[16 * v14];
    *(_OWORD *)char v20 = *(_OWORD *)&v55.__r_.__value_.__l.__data_;
    *(_OWORD *)&v55.__r_.__value_.__l.__data_ = 0uLL;
    v22 = *(void **)(a1 + 88);
    BOOL v21 = *(void **)(a1 + 96);
    if (v21 == v22)
    {
      int64x2_t v25 = vdupq_n_s64((unint64_t)v21);
      unint64_t v23 = &v18[16 * v14];
    }

    else
    {
      unint64_t v23 = &v18[16 * v14];
      do
      {
        __int128 v24 = *((_OWORD *)v21 - 1);
        v21 -= 2;
        *((_OWORD *)v23 - 1) = v24;
        v23 -= 16;
        *BOOL v21 = 0LL;
        v21[1] = 0LL;
      }

      while (v21 != v22);
      int64x2_t v25 = *v11;
    }

    unint64_t v26 = v20 + 16;
    *(void *)(a1 + 88) = v23;
    *(void *)(a1 + 96) = v20 + 16;
    *(int64x2_t *)&__p.__r_.__value_.__r.__words[1] = v25;
    uint64_t v27 = *(void *)(a1 + 104);
    *(void *)(a1 + 104) = &v18[16 * v19];
    uint64_t v53 = v27;
    __p.__r_.__value_.__r.__words[0] = v25.i64[0];
    sub_100006E40((uint64_t)&__p);
    v28 = (std::__shared_weak_count *)v55.__r_.__value_.__l.__size_;
    *(void *)(a1 + 96) = v26;
    if (v28)
    {
      p_shared_owners = (unint64_t *)&v28->__shared_owners_;
      do
        unint64_t v30 = __ldaxr(p_shared_owners);
      while (__stlxr(v30 - 1, p_shared_owners));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
  }

  else
  {
    *uint64_t v13 = *(_OWORD *)&v55.__r_.__value_.__l.__data_;
    *(void *)(a1 + 96) = v13 + 1;
  }

  v31 = operator new(0x50uLL);
  sub_100004738((uint64_t)v31, (const std::__fs::filesystem::path *)(a1 + 64));
  sub_10001171C(&v55, (uint64_t)v31);
  std::string v33 = *(_OWORD **)(a1 + 96);
  unint64_t v32 = *(void *)(a1 + 104);
  if ((unint64_t)v33 >= v32)
  {
    uint64_t v34 = ((uint64_t)v33 - v11->i64[0]) >> 4;
    unint64_t v35 = v34 + 1;
    uint64_t v36 = v32 - v11->i64[0];
    if (v36 >> 3 > v35) {
      unint64_t v35 = v36 >> 3;
    }
    else {
      unint64_t v37 = v35;
    }
    uint64_t v54 = a1 + 104;
    std::__fs::filesystem::directory_iterator v38 = (char *)sub_100006E0C(a1 + 104, v37);
    std::locale v40 = &v38[16 * v34];
    *(_OWORD *)std::locale v40 = *(_OWORD *)&v55.__r_.__value_.__l.__data_;
    *(_OWORD *)&v55.__r_.__value_.__l.__data_ = 0uLL;
    v42 = *(void **)(a1 + 88);
    v41 = *(void **)(a1 + 96);
    if (v41 == v42)
    {
      int64x2_t v45 = vdupq_n_s64((unint64_t)v41);
      v43 = &v38[16 * v34];
    }

    else
    {
      v43 = &v38[16 * v34];
      do
      {
        __int128 v44 = *((_OWORD *)v41 - 1);
        v41 -= 2;
        *((_OWORD *)v43 - 1) = v44;
        v43 -= 16;
        void *v41 = 0LL;
        v41[1] = 0LL;
      }

      while (v41 != v42);
      int64x2_t v45 = *v11;
    }

    char v46 = v40 + 16;
    *(void *)(a1 + 88) = v43;
    *(void *)(a1 + 96) = v40 + 16;
    *(int64x2_t *)&__p.__r_.__value_.__r.__words[1] = v45;
    uint64_t v47 = *(void *)(a1 + 104);
    *(void *)(a1 + 104) = &v38[16 * v39];
    uint64_t v53 = v47;
    __p.__r_.__value_.__r.__words[0] = v45.i64[0];
    sub_100006E40((uint64_t)&__p);
    uint64_t v48 = (std::__shared_weak_count *)v55.__r_.__value_.__l.__size_;
    *(void *)(a1 + 96) = v46;
    if (v48)
    {
      char v49 = (unint64_t *)&v48->__shared_owners_;
      do
        unint64_t v50 = __ldaxr(v49);
      while (__stlxr(v50 - 1, v49));
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
        std::__shared_weak_count::__release_weak(v48);
      }
    }
  }

  else
  {
    *std::string v33 = *(_OWORD *)&v55.__r_.__value_.__l.__data_;
    *(void *)(a1 + 96) = v33 + 1;
  }

    void *v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }

  uint64_t v14 = *v6;
  unint64_t v15 = &v5[-*v6];
  uint64_t v16 = (unint64_t)(v15 + 1);
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    uint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    v18 = v16;
  }
  if (v18) {
    unint64_t v12 = operator new(v18);
  }
  else {
    unint64_t v12 = 0LL;
  }
  char v20 = &v15[(void)v12];
  BOOL v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    unint64_t v29 = &v5[~v14];
    do
    {
      unint64_t v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }

    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }

    void *v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }

  uint64_t v14 = *v6;
  unint64_t v15 = &v5[-*v6];
  uint64_t v16 = (unint64_t)(v15 + 1);
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    uint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    v18 = v16;
  }
  if (v18) {
    unint64_t v12 = operator new(v18);
  }
  else {
    unint64_t v12 = 0LL;
  }
  char v20 = &v15[(void)v12];
  BOOL v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    unint64_t v29 = &v5[~v14];
    do
    {
      unint64_t v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }

    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }

void sub_1000051A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
}

uint64_t sub_100005220(uint64_t a1, const std::__fs::filesystem::path *a2)
{
  *(void *)(a1 + 8) = 0LL;
  *(_DWORD *)a1 = -1;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = -1LL;
  *(void *)(a1 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0LL;
  *(void *)(a1 + 48) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  sub_100003694(a2, a1 + 64);
  *(void *)(a1 + 88) = 0LL;
  *(void *)(a1 + 96) = 0LL;
  *(void *)(a1 + 104) = 0LL;
  sub_100004D38(a1);
  return a1;
}

void sub_1000052A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  unint64_t v15 = v11;
  a10 = v15;
  sub_100006D88(&a10);
  if (v10[87] < 0) {
    operator delete(*v12);
  }
  if (v10[63] < 0) {
    operator delete(*v14);
  }
  if (v10[31] < 0) {
    operator delete(*v13);
  }
  _Unwind_Resume(a1);
}

BOOL sub_100005300(uint64_t a1, uint64_t a2)
{
  return sub_100002E68(a1, a2) || sub_100002FA4(a1, a2);
}

BOOL sub_100005340(uint64_t a1, std::__fs::filesystem::path::__string_view a2)
{
  a2.__data += 64;
  return sub_1000049B0((const std::__fs::filesystem::path *)(a1 + 64), a2);
}

uint64_t sub_10000534C(uint64_t a1, uint64_t a2)
{
  std::__fs::filesystem::path::__string_view v3 = *(void **)(a1 + 88);
  std::basic_string_view<_CharT, _Traits>::size_type v2 = *(void **)(a1 + 96);
  uint64_t v5 = *(void **)(a2 + 88);
  BOOL v4 = *(void **)(a2 + 96);
  if (v3 == v2 || v5 == v4)
  {
LABEL_11:
    BOOL v11 = v5 == v4;
    return v3 == v2 && v11;
  }

  else
  {
    while (1)
    {
      uint64_t result = (**(uint64_t (***)(void, void))*v3)(*v3, *v5);
      if (!(_DWORD)result) {
        break;
      }
      v3 += 2;
      v5 += 2;
      std::basic_string_view<_CharT, _Traits>::size_type v2 = *(void **)(a1 + 96);
      BOOL v4 = *(void **)(a2 + 96);
      if (v3 == v2 || v5 == v4) {
        goto LABEL_11;
      }
    }
  }

  return result;
}

uint64_t sub_1000053CC(uint64_t result)
{
  int v1 = *(uint64_t **)(result + 88);
  std::basic_string_view<_CharT, _Traits>::size_type v2 = *(uint64_t **)(result + 96);
  while (v1 != v2)
  {
    uint64_t v3 = *v1;
    v1 += 2;
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }

  return result;
}

char *sub_100005404@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  if (result[63] < 0) {
    return (char *)sub_100006C08((_BYTE *)a2, *((void **)result + 5), *((void *)result + 6));
  }
  *(_OWORD *)a2 = *(_OWORD *)(result + 40);
  *(void *)(a2 + 16) = *((void *)result + 7);
  return result;
}

void sub_100005430( std::__fs::filesystem::path *this@<X1>, const std::__fs::filesystem::path *a2@<X0>, std::__fs::filesystem::path *a3@<X8>)
{
  a3->__pn_.__r_.__value_.__r.__words[0] = 0LL;
  a3->__pn_.__r_.__value_.__l.__size_ = 0LL;
  a3->__pn_.__r_.__value_.__l.__cap_ = 0LL;
  std::__fs::filesystem::path::begin(&v20, this);
  std::__fs::filesystem::path::begin(&v19, a2);
  while (1)
  {
    std::__fs::filesystem::path::end(&v18, a2);
    if (v19.__path_ptr_ == v18.__path_ptr_ && v19.__entry_.__data == v18.__entry_.__data)
    {
      BOOL v9 = 0;
    }

    else
    {
      std::__fs::filesystem::path::end(&v17, this);
      if (v20.__path_ptr_ == v17.__path_ptr_ && v20.__entry_.__data == v17.__entry_.__data)
      {
        BOOL v9 = 0;
      }

      else
      {
        if ((char)v19.__stashed_elem_.__pn_.__r_.__value_.__s.__size_ < 0) {
          sub_100006C08( &__dst,  v19.__stashed_elem_.__pn_.__r_.__value_.__l.__data_,  v19.__stashed_elem_.__pn_.__r_.__value_.__l.__size_);
        }
        else {
          std::__fs::filesystem::path __dst = v19.__stashed_elem_;
        }
        if ((char)v20.__stashed_elem_.__pn_.__r_.__value_.__s.__size_ < 0)
        {
          sub_100006C08( __p,  v20.__stashed_elem_.__pn_.__r_.__value_.__l.__data_,  v20.__stashed_elem_.__pn_.__r_.__value_.__l.__size_);
        }

        else
        {
          *(_OWORD *)std::string __p = *(_OWORD *)&v20.__stashed_elem_.__pn_.__r_.__value_.__l.__data_;
          std::string::size_type cap = v20.__stashed_elem_.__pn_.__r_.__value_.__l.__cap_;
        }

        v7.__data = (const std::string_view::value_type *)__p;
        BOOL v9 = sub_1000049B0(&__dst, v7);
        if (SHIBYTE(cap) < 0) {
          operator delete(__p[0]);
        }
      }
    }

    if (!v9) {
      break;
    }
    std::__fs::filesystem::path::iterator::__increment(&v19);
    std::__fs::filesystem::path::iterator::__increment(&v20);
  }

  std::__fs::filesystem::path::end(&v18, this);
  BOOL v11 = v20.__path_ptr_ == v18.__path_ptr_ && v20.__entry_.__data == v18.__entry_.__data;
  if ((char)v18.__stashed_elem_.__pn_.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(v18.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if (!v11) {
      goto LABEL_53;
    }
  }

  else if (!v11)
  {
    goto LABEL_53;
  }

  while (1)
  {
    std::__fs::filesystem::path::end(&v18, a2);
    BOOL v13 = v19.__path_ptr_ != v18.__path_ptr_ || v19.__entry_.__data != v18.__entry_.__data;
    if (!v13) {
      break;
    }
    if ((char)v19.__stashed_elem_.__pn_.__r_.__value_.__s.__size_ < 0)
    {
      sub_100006C08( &v18,  v19.__stashed_elem_.__pn_.__r_.__value_.__l.__data_,  v19.__stashed_elem_.__pn_.__r_.__value_.__l.__size_);
    }

    else
    {
      *(_OWORD *)&v18.__stashed_elem_.__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&v19.__stashed_elem_.__pn_.__r_.__value_.__l.__data_;
      v18.__stashed_elem_.__pn_.__r_.__value_.__l.__cap_ = v19.__stashed_elem_.__pn_.__r_.__value_.__l.__cap_;
    }

    sub_100005720(a3, &v18.__stashed_elem_);
    std::__fs::filesystem::path::iterator::__increment(&v19);
  }

LABEL_53:
}

      if ((_DWORD)v6 != 95
        && ((v6 & 0x80000000) != 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 16LL) + 4 * v5) & 0x500) == 0))
      {
        if (a4)
        {
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1LL;
            a4 = (uint64_t *)*a4;
          }

          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }

          *(_WORD *)a4 = v5;
          return ++v4;
        }

        goto LABEL_69;
      }

void sub_100005674( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20, int a21, __int16 a22, char a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *a29, uint64_t a30, int a31, __int16 a32, char a33, char a34)
{
}

std::__fs::filesystem::path *sub_100005720( std::__fs::filesystem::path *a1, std::__fs::filesystem::path *this)
{
  if (std::__fs::filesystem::path::__root_directory(this).__size)
  {
    std::string::operator=(&a1->__pn_, &this->__pn_);
  }

  else
  {
    if (std::__fs::filesystem::path::__filename(a1).__size) {
      std::string::push_back(&a1->__pn_, 47);
    }
    int size = (char)this->__pn_.__r_.__value_.__s.__size_;
    if (size >= 0) {
      uint64_t v5 = this;
    }
    else {
      uint64_t v5 = (std::__fs::filesystem::path *)this->__pn_.__r_.__value_.__r.__words[0];
    }
    if (size >= 0) {
      std::string::size_type v6 = this->__pn_.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v6 = this->__pn_.__r_.__value_.__l.__size_;
    }
    std::string::append(&a1->__pn_, (const std::string::value_type *)v5, v6);
  }

  return a1;
}

void sub_100005794()
{
  v0 = (void *)v9[0];
  int v1 = (void *)v9[1];
  while (v0 != v1)
  {
    (*(void (**)(void))(*(void *)*v0 + 8LL))(*v0);
    v0 += 2;
  }

  std::string::size_type v10 = (void **)v9;
  sub_100006D88(&v10);
  if (v8 < 0) {
    operator delete(__p);
  }
  if (v6 < 0) {
    operator delete(v5);
  }
  if (v4 < 0) {
    operator delete(v3);
  }
}

void sub_10000582C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_100005840(uint64_t a1)
{
  uint64_t v3 = (void **)(a1 + 88);
  sub_100006D88(&v3);
  return a1;
}

void sub_1000058A8(std::__fs::filesystem::path *a1@<X8>)
{
}

void sub_100005900( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000591C(const std::__fs::filesystem::path *a1@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  sub_100003694(a1, (uint64_t)&__p);
  sub_10000380C((const std::__fs::filesystem::path *)&__p, (uint64_t)&__str);
  sub_10000380C((const std::__fs::filesystem::path *)&__str, (uint64_t)&__p);
  v11.__data = (const std::string_view::value_type *)&unk_100018000;
  BOOL v4 = sub_1000049B0((const std::__fs::filesystem::path *)&__p, v11);
  BOOL v5 = v4;
  if ((char)__p.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v5) {
      goto LABEL_5;
    }
  }

  else if (v4)
  {
LABEL_5:
    std::string::operator=(a2, &__str);
    goto LABEL_10;
  }

  sub_1000112B4(&__p, "/usr/share/zoneinfo.default");
  v12.__data = (const std::string_view::value_type *)&__p;
  BOOL v6 = sub_1000049B0(a1, v12);
  if (!v6)
  {
    if ((a1->__pn_.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::__fs::filesystem::path::__string_view v7 = (const char *)a1;
    }
    else {
      std::__fs::filesystem::path::__string_view v7 = (const char *)a1->__pn_.__r_.__value_.__r.__words[0];
    }
    warn("Bad zoneinfo link %s", v7);
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "bad_zoneinfo_link");
  }

LABEL_10:
}

void sub_100005A6C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_100005ACC(std::string *a1@<X8>)
{
}

void sub_100005B40( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  _Unwind_Resume(exception_object);
}

void sub_100005B74()
{
  if ((char)v6.__pn_.__r_.__value_.__s.__size_ < 0)
  {
    BOOL v0 = v6.__pn_.__r_.__value_.__l.__size_ == 0;
    operator delete(v6.__pn_.__r_.__value_.__l.__data_);
  }

  else
  {
    BOOL v0 = v6.__pn_.__r_.__value_.__s.__size_ == 0;
  }

  if (v0)
  {
    sub_1000112B4(&__p, "/usr/share/zoneinfo");
    sub_100005430((std::__fs::filesystem::path *)&__p, &__to, &v6);
    std::string::size_type size = v6.__pn_.__r_.__value_.__s.__size_;
    if ((v6.__pn_.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type size = v6.__pn_.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      sub_1000112B4(&v4, "/var/db/timezone/zoneinfo");
      sub_100003C90(&v6, (uint64_t)&v4, (std::__fs::filesystem::path *)&__p);
      sub_100011BE0((uint64_t)&__to, (__int128 *)&__p, (uint64_t)&v4, &v8);
      if (*v8 >= 0) {
        p_to = &__to;
      }
      else {
        p_to = (std::__fs::filesystem::path *)__to.__pn_.__r_.__value_.__r.__words[0];
      }
      warn("Correcting localtime link to %s", (const char *)p_to);
      std::__fs::filesystem::__status(&__to, 0LL);
      if (__p.__r_.__value_.__s.__data_[0] != 255 && __p.__r_.__value_.__s.__data_[0])
      {
        remove("/var/db/timezone/localtime");
        sub_1000112B4(&__p, "/var/db/timezone/localtime");
        std::__fs::filesystem::__create_symlink(&__to, (const std::__fs::filesystem::path *)&__p, 0LL);
        goto LABEL_9;
      }

      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "localtime_link_bad_zone");
    }

    else
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "localtime_link_invalid");
    }
  }

LABEL_9:
}

#error "100005E6C: call analysis failed (funcsize=48)"
void sub_100005EDC( _Unwind_Exception *a1,  int a2,  int a3,  int a4,  int a5,  int a6,  int a7,  int a8,  uint64_t a9,  uint64_t a10,  uint64_t a11,  uint64_t a12,  uint64_t a13,  uint64_t a14,  uint64_t a15,  void *__p,  uint64_t a17,  int a18,  __int16 a19,  char a20,  char a21)
{
  uint64_t v21;
  if (a21 < 0) {
    operator delete(__p);
  }
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_100005F24(const char *a1)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  uint64_t result = open(a1, 0x1000000);
  if ((_DWORD)result != -1)
  {
    int v2 = result;
    fcntl(result, 64, 4LL);
    return close(v2);
  }

  return result;
}

void sub_100005F8C()
{
}

void sub_100006004( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100006024()
{
}

void sub_100006128( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  __cxa_begin_catch(a1);
  warn("Could not migrate /var/db/icutz to /var/db/timezone/icutz");
  __cxa_end_catch();
  JUMPOUT(0x1000060CCLL);
}

void sub_100006160( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t start()
{
  int v0 = setiopolicy_np(9, 0, 1);
  if (v0) {
    warn("setiopolicy IOPOL_TYPE_VFS_ALLOW_LOW_SPACE_WRITES returned error code %d", v0);
  }
  sub_100005F8C();
  sub_100006024();
  remove("/var/db/icu");
  sub_100004C90((uint64_t)v38);
  sub_1000058A8(&v37);
  sub_100005ACC(__dst);
  std::__fs::filesystem::path __p = (std::__fs::filesystem::path)__dst[0];
  sub_100005220((uint64_t)v28, &__p);
  if ((sub_10000534C((uint64_t)v28, (uint64_t)v38) & 1) == 0)
  {
    warn("Symlink points at data incompatible with installed system");
    goto LABEL_9;
  }

  if (sub_100002E68((uint64_t)v38, (uint64_t)v28) || (int v2 = v28, sub_100002FA4((uint64_t)v38, (uint64_t)v28)))
  {
    v1.__data = (const std::string_view::value_type *)&v33;
    int v2 = v28;
    if (!sub_1000049B0(&v43, v1))
    {
      warn("Current asset is not newer than System volume");
LABEL_9:
      sub_100005794();
      int v2 = v38;
    }
  }

  sub_100005220((uint64_t)v21, &v37);
  std::string::size_type size = v37.__pn_.__r_.__value_.__s.__size_;
  if ((v37.__pn_.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type size = v37.__pn_.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    if (sub_10000534C((uint64_t)v21, (uint64_t)v38) && sub_100002E68((uint64_t)v21, (uint64_t)v2))
    {
      std::string v4 = (void *)v27[0];
      BOOL v5 = (void *)v27[1];
      while (v4 != v5)
      {
        (*(void (**)(void))(*(void *)*v4 + 8LL))(*v4);
        v4 += 2;
      }

      else {
        __dst[0] = v24;
      }
      if ((__dst[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
        char v8 = __dst;
      }
      else {
        char v8 = (std::string *)__dst[0].__r_.__value_.__r.__words[0];
      }
      BOOL v9 = v2 + 40;
      if ((char)v2[63] < 0)
      {
        sub_100006C08(v19, *((void **)v2 + 5), *((void *)v2 + 6));
      }

      else
      {
        *(_OWORD *)std::__fs::filesystem::path::iterator v19 = *v9;
        uint64_t v20 = *((void *)v2 + 7);
      }

      std::string::size_type v10 = v19;
      if (v20 < 0) {
        std::string::size_type v10 = (void **)v19[0];
      }
      warn("Installed version %s, replacing %s", (const char *)v8, (const char *)v10);
      if (SHIBYTE(v20) < 0) {
        operator delete(v19[0]);
      }
      sub_100006944( (void (__cdecl ***)(std::ofstream *__hidden))__dst,  (uint64_t)"/var/db/timezone/TZVersionDiffRecord",  48);
      if ((char)v2[63] < 0)
      {
        sub_100006C08(v19, *((void **)v2 + 5), *((void *)v2 + 6));
      }

      else
      {
        *(_OWORD *)std::__fs::filesystem::path::iterator v19 = *v9;
        uint64_t v20 = *((void *)v2 + 7);
      }

      if (v20 >= 0) {
        std::__fs::filesystem::path::__string_view v11 = v19;
      }
      else {
        std::__fs::filesystem::path::__string_view v11 = (void **)v19[0];
      }
      if (v20 >= 0) {
        uint64_t v12 = HIBYTE(v20);
      }
      else {
        uint64_t v12 = (uint64_t)v19[1];
      }
      BOOL v13 = sub_100011858(__dst, (uint64_t)v11, v12);
      uint64_t v14 = sub_100011858(v13, (uint64_t)"_", 1LL);
      else {
        std::string v18 = v24;
      }
      if ((v18.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        unint64_t v15 = &v18;
      }
      else {
        unint64_t v15 = (std::string *)v18.__r_.__value_.__r.__words[0];
      }
      if ((v18.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v16 = v18.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v16 = v18.__r_.__value_.__l.__size_;
      }
      sub_100011858(v14, (uint64_t)v15, v16);
      if (SHIBYTE(v20) < 0) {
        operator delete(v19[0]);
      }
      *(std::string::size_type *)((char *)__dst[0].__r_.__value_.__r.__words
      std::filebuf::~filebuf(&__dst[0].__r_.__value_.__r.__words[1]);
      std::ios::~ios(&v46);
    }

    else
    {
      else {
        __dst[0] = v24;
      }
      if ((__dst[0].__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::__fs::filesystem::path v6 = __dst;
      }
      else {
        std::__fs::filesystem::path v6 = (std::string *)__dst[0].__r_.__value_.__r.__words[0];
      }
      if ((char)v2[63] < 0)
      {
        sub_100006C08(v19, *((void **)v2 + 5), *((void *)v2 + 6));
      }

      else
      {
        *(_OWORD *)std::__fs::filesystem::path::iterator v19 = *(_OWORD *)(v2 + 40);
        uint64_t v20 = *((void *)v2 + 7);
      }

      std::__fs::filesystem::path::__string_view v7 = v19;
      if (v20 < 0) {
        std::__fs::filesystem::path::__string_view v7 = (void **)v19[0];
      }
      warn( "Latest update incompatible with system, or not newer than current: %s vs. %s",  (const char *)v6,  (const char *)v7);
      if (SHIBYTE(v20) < 0) {
        operator delete(v19[0]);
      }
    }
  }

  __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v27;
  sub_100006D88((void ***)__dst);
  if (v26 < 0) {
    operator delete(v25);
  }
  if (v23 < 0) {
    operator delete(v22);
  }
  __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
  sub_100006D88((void ***)__dst);
  if (v34 < 0) {
    operator delete(v33);
  }
  if (v32 < 0) {
    operator delete(v31);
  }
  if (v30 < 0) {
    operator delete(v29);
  }
  __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v44;
  sub_100006D88((void ***)__dst);
  if (v42 < 0) {
    operator delete(v41);
  }
  if (v40 < 0) {
    operator delete(v39);
  }
  sub_100005B74();
  return 0LL;
}

void sub_1000066FC( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, char a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, void *a50,uint64_t a51,int a52,__int16 a53,char a54,char a55,void *a56,uint64_t a57,int a58,__int16 a59,char a60,char a61,char a62,uint64_t a63)
{
  if (a2)
  {
    if (a20 < 0) {
      operator delete(__p);
    }
    sub_100006A4C(&a71);
    sub_100005840((uint64_t)&a22);
    sub_100005840((uint64_t)&a36);
    if (a55 < 0) {
      operator delete(a50);
    }
    if (a61 < 0) {
      operator delete(a56);
    }
    sub_100005840((uint64_t)&a62);
    __cxa_begin_catch(a1);
    warn("Unable to locate data; resetting to system partition");
    sub_100005794();
    __cxa_end_catch();
    JUMPOUT(0x1000066C0LL);
  }

  _Unwind_Resume(a1);
}

void (__cdecl ***sub_100006944( void (__cdecl ***a1)(std::ofstream *__hidden this), uint64_t a2, int a3))(std::ofstream *__hidden this)
{
  std::__fs::filesystem::path v6 = a1 + 1;
  *a1 = v7;
  *(void *)((char *)*(v7 - 3) + (void)a1) = v8;
  BOOL v9 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v9, a1 + 1);
  v9[1].__vftable = 0LL;
  v9[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf(v6);
  if (!std::filebuf::open(v6, a2, a3 | 0x10u)) {
    std::ios_base::clear( (std::ios_base *)((char *)*(*a1 - 3) + (void)a1),  *(_DWORD *)((char *)*(*a1 - 3) + (void)a1 + 32) | 4);
  }
  return a1;
}

void sub_100006A14(_Unwind_Exception *a1)
{
}

void *sub_100006A4C(void *a1)
{
  return a1;
}

uint64_t sub_100006AA4(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0) {
      return 1LL;
    }
  }

  else
  {
    if (a2 == a4) {
      return 0LL;
    }
    if (a2 >= a4) {
      return 1LL;
    }
  }

  return 255LL;
}

uint64_t sub_100006B00(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  return a1;
}

void sub_100006B58()
{
}

void sub_100006B6C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100006BBC(exception, a1);
}

void sub_100006BA8(_Unwind_Exception *a1)
{
}

std::logic_error *sub_100006BBC(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100006BE0()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_100006C08(_BYTE *__dst, void *__src, unint64_t a3)
{
  BOOL v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_100006B58();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    void *v5 = v8;
    BOOL v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

uint64_t sub_100006C94(std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  if (((1 << a1[3].__pn_.__r_.__value_.__s.__data_[1]) & 0x13) != 0)
  {
    std::__fs::filesystem::__status(a1, __ec);
    return v7;
  }

  else
  {
    if (__ec)
    {
      if ((a1[3].__pn_.__r_.__value_.__s.__data_[0] + 1) > 1u)
      {
        __ec->__val_ = 0;
        BOOL v5 = std::system_category();
      }

      else
      {
        BOOL v5 = std::generic_category();
        *(void *)&__ec->__val_ = 2LL;
      }

      __ec->__cat_ = v5;
    }

    return a1[3].__pn_.__r_.__value_.__s.__data_[0];
  }

std::__fs::filesystem::file_status sub_100006D28@<X0>( std::__fs::filesystem::path *a1@<X0>, std::error_code *a2@<X1>, uint64_t a3@<X8>)
{
  if (((1 << a1[3].__pn_.__r_.__value_.__s.__data_[1]) & 0x17) != 0) {
    return std::__fs::filesystem::__status(a1, a2);
  }
  std::__fs::filesystem::file_status result = (std::__fs::filesystem::file_status)sub_100006C94(a1, a2);
  int v6 = HIDWORD(a1[2].__pn_.__r_.__value_.__r.__words[2]);
  *(_BYTE *)a3 = result.__ft_;
  *(_DWORD *)(a3 + 4) = v6;
  return result;
}

void sub_100006D88(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    BOOL v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = sub_100006B00(v4 - 16);
      while ((void *)v4 != v2);
      BOOL v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void sub_100006DF8()
{
}

void *sub_100006E0C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100006BE0();
  }
  return operator new(16 * a2);
}

uint64_t sub_100006E40(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 16;
    sub_100006B00(i - 16);
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

std::locale *sub_100006E8C(std::locale *a1, char *a2, int a3)
{
  int v6 = sub_100006F1C(a1);
  LODWORD(v6[3].__locale_) = a3;
  *(_OWORD *)((char *)&v6[3].__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v6[5].__locale_ + 4) = 0u;
  HIDWORD(v6[7].__locale_) = 0;
  size_t v7 = strlen(a2);
  return a1;
}

void sub_100006F00(_Unwind_Exception *a1)
{
}

std::locale *sub_100006F1C(std::locale *a1)
{
  uint64_t v2 = std::locale::locale(a1);
  a1[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v2, &std::ctype<char>::id);
  a1[2].__locale_ = (std::locale::__imp *)std::locale::use_facet(a1, &std::collate<char>::id);
  return a1;
}

void sub_100006F64(_Unwind_Exception *a1)
{
}

char *sub_100006F78(uint64_t a1, char *a2, char *a3)
{
  int v6 = operator new(8uLL);
  *int v6 = &off_1000143C8;
  size_t v7 = operator new(0x10uLL);
  *size_t v7 = &off_100014498;
  v7[1] = v6;
  sub_100007114((void *)(a1 + 40), (uint64_t)v7);
  *(void *)(a1 + 56) = *(void *)(a1 + 40);
  unsigned int v8 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v8 > 0x3F)
  {
    switch(v8)
    {
      case 0x40u:
        return sub_1000073D8(a1, a2, a3);
      case 0x80u:
        return (char *)sub_100007478(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
      case 0x100u:
        return sub_1000075A8(a1, a2, a3);
      default:
        goto LABEL_14;
    }
  }

  else if (v8)
  {
    if (v8 != 16)
    {
      if (v8 != 32) {
LABEL_14:
      }
        sub_1000076D8();
      return sub_1000073D8(a1, a2, a3);
    }

    return sub_1000072AC(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
  }

  else
  {
    return sub_100007184(a1, (unsigned __int8 *)a2, a3);
  }

void sub_1000070AC(_Unwind_Exception *a1)
{
}

void sub_1000070C8()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_parse);
}

void sub_100007100(_Unwind_Exception *a1)
{
}

void sub_100007114(void *a1, uint64_t a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[1];
  __int128 v4 = v7;
  *(void *)&__int128 v7 = *a1;
  *((void *)&v7 + 1) = v3;
  *(_OWORD *)a1 = v4;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      unint64_t v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

char *sub_100007184(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  __int128 v7 = a2;
  do
  {
    unsigned int v8 = v7;
    __int128 v7 = sub_100007A38(a1, (char *)v7, a3);
  }

  while (v7 != v8);
  if (v8 == a2)
  {
    BOOL v9 = operator new(0x10uLL);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(v10 + 8);
    void *v9 = &off_100014498;
    v9[1] = v11;
    *(void *)(v10 + std::ostream::~ostream(v1, v2 + 8) = v9;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  if (v8 != (unsigned __int8 *)a3)
  {
    while (*v8 == 124)
    {
      uint64_t v12 = *(void *)(a1 + 56);
      BOOL v13 = v8 + 1;
      uint64_t v14 = v8 + 1;
      do
      {
        unsigned int v8 = v14;
        uint64_t v14 = sub_100007A38(a1, (char *)v14, a3);
      }

      while (v14 != v8);
      if (v8 == v13)
      {
        unint64_t v15 = operator new(0x10uLL);
        uint64_t v16 = *(void *)(a1 + 56);
        uint64_t v17 = *(void *)(v16 + 8);
        void *v15 = &off_100014498;
        v15[1] = v17;
        *(void *)(v16 + std::ostream::~ostream(v1, v2 + 8) = v15;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
      }

      sub_100007988(a1, v6, v12);
    }

    return (char *)v8;
  }

  return a3;
}

char *sub_1000072AC(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return (char *)a2;
  }
  __int128 v4 = (char *)a3;
  if (*a2 == 94)
  {
    uint64_t v6 = operator new(0x18uLL);
    BOOL v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(v8 + 8);
    *uint64_t v6 = &off_100014540;
    v6[1] = v9;
    *((_BYTE *)v6 + 16) = v7;
    *(void *)(v8 + std::ostream::~ostream(v1, v2 + 8) = v6;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    ++v3;
  }

  if (v3 != (unsigned __int8 *)v4)
  {
    do
    {
      uint64_t v10 = v3;
      uint64_t v3 = sub_10000E640(a1, (char *)v3, v4);
    }

    while (v3 != v10);
    if (v10 != (unsigned __int8 *)v4)
    {
      uint64_t v11 = operator new(0x18uLL);
      BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(v13 + 8);
      void *v11 = &off_100014588;
      v11[1] = v14;
      *((_BYTE *)v11 + 16) = v12;
      *(void *)(v13 + std::ostream::~ostream(v1, v2 + 8) = v11;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    }
  }

  return v4;
}

char *sub_1000073D8(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a3;
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = sub_10000EC18(a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2) {
LABEL_9:
  }
    sub_10000E5F4();
  uint64_t v8 = v7;
  while (v8 != (unsigned __int8 *)v3)
  {
    if (*v8 != 124) {
      return (char *)v8;
    }
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = sub_10000EC18(a1, (char *)v8 + 1, v3);
    if (v10 == v8 + 1) {
      goto LABEL_9;
    }
    uint64_t v8 = v10;
    sub_100007988(a1, v6, v9);
  }

  return v3;
}

unsigned __int8 *sub_100007478(uint64_t a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s)
  {
    uint64_t v9 = operator new(0x10uLL);
    uint64_t v10 = *(void *)(v6 + 8);
    void *v9 = &off_100014498;
    v9[1] = v10;
    *(void *)(v6 + std::ostream::~ostream(v1, v2 + 8) = v9;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  else
  {
    sub_1000072AC(a1, __s, v8);
  }

  if (v8 != a3) {
    ++v8;
  }
  while (v8 != a3)
  {
    uint64_t v11 = (unsigned __int8 *)memchr(v8, 10, a3 - v8);
    if (v11) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = a3;
    }
    uint64_t v13 = *(void *)(a1 + 56);
    if (v12 == v8)
    {
      uint64_t v14 = operator new(0x10uLL);
      uint64_t v15 = *(void *)(v13 + 8);
      *uint64_t v14 = &off_100014498;
      v14[1] = v15;
      *(void *)(v13 + std::ostream::~ostream(v1, v2 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    }

    else
    {
      sub_1000072AC(a1, v8, v12);
    }

    sub_100007988(a1, v6, v13);
    if (v12 == a3) {
      uint64_t v8 = v12;
    }
    else {
      uint64_t v8 = v12 + 1;
    }
  }

  return a3;
}

char *sub_1000075A8(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (char *)memchr(__s, 10, a3 - __s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s)
  {
    uint64_t v9 = operator new(0x10uLL);
    uint64_t v10 = *(void *)(v6 + 8);
    void *v9 = &off_100014498;
    v9[1] = v10;
    *(void *)(v6 + std::ostream::~ostream(v1, v2 + 8) = v9;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  else
  {
    sub_1000073D8(a1, __s, v8);
  }

  if (v8 != a3) {
    ++v8;
  }
  while (v8 != a3)
  {
    uint64_t v11 = (char *)memchr(v8, 10, a3 - v8);
    if (v11) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = a3;
    }
    uint64_t v13 = *(void *)(a1 + 56);
    if (v12 == v8)
    {
      uint64_t v14 = operator new(0x10uLL);
      uint64_t v15 = *(void *)(v13 + 8);
      *uint64_t v14 = &off_100014498;
      v14[1] = v15;
      *(void *)(v13 + std::ostream::~ostream(v1, v2 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    }

    else
    {
      sub_1000073D8(a1, v8, v12);
    }

    sub_100007988(a1, v6, v13);
    if (v12 == a3) {
      uint64_t v8 = v12;
    }
    else {
      uint64_t v8 = v12 + 1;
    }
  }

  return a3;
}

void sub_1000076D8()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_grammar);
}

void sub_100007710(_Unwind_Exception *a1)
{
}

void sub_10000772C(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void *sub_100007740(void *a1, uint64_t a2)
{
  *a1 = a2;
  __int128 v4 = operator new(0x20uLL);
  *__int128 v4 = &off_100014420;
  v4[1] = 0LL;
  v4[2] = 0LL;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_100007788(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000077AC(std::__shared_weak_count *a1)
{
}

uint64_t sub_1000077C0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

uint64_t sub_1000077D8(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }

  else
  {
    return 0LL;
  }

BOOL sub_100007818(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1LL;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0LL;
}

void *sub_100007864(void *a1)
{
  *a1 = &off_100014510;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_1000078A8(void *__p)
{
  *std::__fs::filesystem::path __p = &off_100014510;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_1000078EC(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = *(void *)(result + 8);
  return result;
}

void *sub_100007900(void *a1)
{
  *a1 = &off_100014510;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_100007944(void *__p)
{
  *std::__fs::filesystem::path __p = &off_100014510;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

void *sub_100007988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = operator new(0x18uLL);
  uint64_t v7 = *(void *)(a3 + 8);
  v6[1] = *(void *)(a2 + 8);
  v6[2] = v7;
  *uint64_t v6 = &off_100014A08;
  *(void *)(a2 + std::ostream::~ostream(v1, v2 + 8) = v6;
  *(void *)(a3 + std::ostream::~ostream(v1, v2 + 8) = 0LL;
  uint64_t v8 = operator new(0x10uLL);
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
  *uint64_t v8 = &off_100014498;
  v8[1] = v9;
  *(void *)(a3 + std::ostream::~ostream(v1, v2 + 8) = v8;
  *(void *)(*(void *)(a1 + 56) + 8LL) = 0LL;
  uint64_t result = operator new(0x10uLL);
  uint64_t v11 = *(void *)(a3 + 8);
  *uint64_t result = &off_100014A50;
  result[1] = v11;
  *(void *)(*(void *)(a1 + 56) + 8LL) = result;
  *(void *)(a1 + 56) = *(void *)(a3 + 8);
  return result;
}

unsigned __int8 *sub_100007A38(uint64_t a1, char *a2, char *a3)
{
  uint64_t result = (unsigned __int8 *)sub_100007ACC(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    int v8 = *(_DWORD *)(a1 + 28);
    uint64_t v9 = sub_100007D54(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
    uint64_t result = (unsigned __int8 *)a2;
  }

  return result;
}

char *sub_100007ACC(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v6 = *a2;
  if (v6 <= 91)
  {
    if (v6 != 36)
    {
      BOOL v8 = v6 == 40;
      uint64_t v7 = a2 + 1;
      BOOL v8 = !v8 || v7 == a3;
      if (!v8)
      {
        BOOL v8 = *v7 == 63;
        uint64_t v9 = a2 + 2;
        if (v8 && v9 != a3)
        {
          int v11 = *v9;
          if (v11 == 33)
          {
            sub_100006F1C(v23);
            __int128 v24 = 0u;
            uint64_t v26 = 0LL;
            __int128 v25 = 0u;
            LODWORD(v24) = *(_DWORD *)(a1 + 24);
            BOOL v12 = (char *)sub_100006F78(v23, v3 + 3, a3);
            int v22 = DWORD1(v24);
            sub_1000082C0(a1, (uint64_t)v23, 1, *(_DWORD *)(a1 + 28));
            *(_DWORD *)(a1 + 28) += v22;
            if (v12 == a3 || *v12 != 41) {
              sub_100008344();
            }
            goto LABEL_31;
          }

          if (v11 == 61)
          {
            sub_100006F1C(v23);
            __int128 v24 = 0u;
            uint64_t v26 = 0LL;
            __int128 v25 = 0u;
            LODWORD(v24) = *(_DWORD *)(a1 + 24);
            BOOL v12 = (char *)sub_100006F78(v23, v3 + 3, a3);
            int v13 = DWORD1(v24);
            sub_1000082C0(a1, (uint64_t)v23, 0, *(_DWORD *)(a1 + 28));
            *(_DWORD *)(a1 + 28) += v13;
            if (v12 == a3 || *v12 != 41) {
              sub_100008344();
            }
LABEL_31:
            uint64_t v3 = v12 + 1;
            sub_100006B00((uint64_t)&v25);
            std::locale::~locale(v23);
            return v3;
          }
        }
      }

      return v3;
    }

    uint64_t v14 = operator new(0x18uLL);
    BOOL v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(v16 + 8);
LABEL_21:
    *uint64_t v14 = v18 + 2;
    v14[1] = v17;
    *((_BYTE *)v14 + 16) = v15;
    *(void *)(v16 + std::ostream::~ostream(v1, v2 + 8) = v14;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    return ++v3;
  }

  if (v6 != 92)
  {
    if (v6 != 94) {
      return v3;
    }
    uint64_t v14 = operator new(0x18uLL);
    BOOL v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(v16 + 8);
    goto LABEL_21;
  }

  if (a2 + 1 != a3)
  {
    int v20 = a2[1];
    if (v20 == 66)
    {
      char v21 = 1;
    }

    else
    {
      if (v20 != 98) {
        return v3;
      }
      char v21 = 0;
    }

    sub_10000824C(a1, v21);
    v3 += 2;
  }

  return v3;
}

void sub_100007D28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

unsigned __int8 *sub_100007D54(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v6 = (char)*a2;
  if (v6 > 62)
  {
    if (v6 > 91)
    {
      if (v6 == 92) {
        return sub_1000098D8(a1, a2, a3);
      }
      if (v6 != 123) {
        return sub_100009B94(a1, a2, a3);
      }
    }

    else
    {
      if (v6 == 91) {
        return (unsigned __int8 *)sub_100009978(a1, (char *)a2, (char *)a3);
      }
      if (v6 != 63) {
        return sub_100009B94(a1, a2, a3);
      }
    }

LABEL_29:
    sub_100009B48();
  }

  if (v6 == 40)
  {
    if (a2 + 1 == a3) {
      goto LABEL_30;
    }
    if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
    {
      int v11 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      BOOL v12 = (unsigned __int8 *)sub_100007184(a1, a2 + 3, a3);
      if (v12 == a3) {
        goto LABEL_30;
      }
      uint64_t v3 = v12;
      if (*v12 != 41) {
        goto LABEL_30;
      }
    }

    else
    {
      sub_100009A88((void *)a1);
      int v13 = *(_DWORD *)(a1 + 28);
      int v11 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      uint64_t v14 = (unsigned __int8 *)sub_100007184(a1, v3 + 1, a3);
      if (v14 == a3 || (uint64_t v3 = v14, *v14 != 41)) {
LABEL_30:
      }
        sub_100008344();
      sub_100009AEC((void *)a1, v13);
    }

    --*v11;
    return ++v3;
  }

  if (v6 == 46)
  {
    uint64_t v7 = operator new(0x10uLL);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(v8 + 8);
    *uint64_t v7 = &off_100014660;
    v7[1] = v9;
    *(void *)(v8 + std::ostream::~ostream(v1, v2 + 8) = v7;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    return ++v3;
  }

  return sub_100009B94(a1, a2, a3);
}

unsigned __int8 *sub_100007F4C( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
{
  if (a2 == a3) {
    return a2;
  }
  int v6 = a6;
  int v7 = a5;
  uint64_t v10 = a1;
  int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  int v12 = (char)*a2;
  if (v12 > 62)
  {
    if (v12 == 63)
    {
      int v13 = a2 + 1;
      if (v11) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v13 == a3;
      }
      if (!v20 && *v13 == 63)
      {
        int v13 = a2 + 2;
        uint64_t v14 = 0LL;
        uint64_t v18 = 1LL;
        goto LABEL_33;
      }

      uint64_t v14 = 0LL;
      uint64_t v18 = 1LL;
      goto LABEL_45;
    }

    if (v12 != 123) {
      return a2;
    }
    BOOL v15 = a2 + 1;
    uint64_t v16 = sub_10000E0B0(a1, a2 + 1, a3, &v28);
    if (v16 != v15)
    {
      if (v16 != a3)
      {
        int v17 = (char)*v16;
        if (v17 != 44)
        {
          if (v17 == 125)
          {
            int v13 = v16 + 1;
            if (!v11 && v13 != a3 && *v13 == 63)
            {
              int v13 = v16 + 2;
              uint64_t v14 = v28;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              uint64_t v18 = v28;
LABEL_33:
              uint64_t v21 = a4;
              char v22 = 0;
LABEL_46:
              sub_10000DF7C(a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }

            uint64_t v14 = v28;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            uint64_t v18 = v28;
LABEL_45:
            uint64_t v21 = a4;
            char v22 = 1;
            goto LABEL_46;
          }

          goto LABEL_58;
        }

        char v23 = v16 + 1;
        if (v16 + 1 == a3) {
          goto LABEL_58;
        }
        if (*v23 == 125)
        {
          int v13 = v16 + 2;
          if (!v11 && v13 != a3 && *v13 == 63)
          {
            int v13 = v16 + 3;
            uint64_t v14 = v28;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }

          uint64_t v14 = v28;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          uint64_t v18 = -1LL;
          goto LABEL_45;
        }

        int v27 = -1;
        __int128 v25 = sub_10000E0B0(v10, v23, a3, &v27);
        if (v25 != v23 && v25 != a3 && *v25 == 125)
        {
          uint64_t v18 = v27;
          uint64_t v14 = v28;
          if (v27 >= v28)
          {
            int v13 = v25 + 1;
            char v22 = 1;
            if (!v11 && v13 != a3)
            {
              int v26 = v25[1];
              char v22 = v26 != 63;
              if (v26 == 63) {
                int v13 = v25 + 2;
              }
            }

            a5 = v7;
            a6 = v6;
            a1 = v10;
            uint64_t v21 = a4;
            goto LABEL_46;
          }

          goto LABEL_58;
        }
      }

      sub_10000E198();
    }

LABEL_58:
    sub_10000E14C();
  }

  if (v12 == 42)
  {
    int v13 = a2 + 1;
    if (v11) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v13 == a3;
    }
    if (!v19 && *v13 == 63)
    {
      int v13 = a2 + 2;
      uint64_t v14 = 0LL;
      goto LABEL_26;
    }

    uint64_t v14 = 0LL;
    goto LABEL_36;
  }

  if (v12 == 43)
  {
    int v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      int v13 = a2 + 2;
      uint64_t v14 = 1LL;
LABEL_26:
      uint64_t v18 = -1LL;
      goto LABEL_33;
    }

    uint64_t v14 = 1LL;
    goto LABEL_36;
  }

  return a2;
}

__n128 sub_10000824C(uint64_t a1, char a2)
{
  __int128 v4 = (char *)operator new(0x30uLL);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8LL);
  *(void *)__int128 v4 = off_1000145D0;
  *((void *)v4 + 1) = v5;
  std::locale::locale((std::locale *)v4 + 2, (const std::locale *)a1);
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v4 + 24) = result;
  v4[40] = a2;
  *(void *)(*(void *)(a1 + 56) + 8LL) = v4;
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return result;
}

uint64_t sub_1000082C0(uint64_t a1, uint64_t a2, char a3, int a4)
{
  uint64_t v8 = operator new(0x58uLL);
  uint64_t result = sub_100008714((uint64_t)v8, a2, a3, *(void *)(*(void *)(a1 + 56) + 8LL), a4);
  *(void *)(*(void *)(a1 + 56) + 8LL) = v8;
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return result;
}

void sub_100008330(_Unwind_Exception *a1)
{
}

void sub_100008344()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_paren);
}

void sub_10000837C(_Unwind_Exception *a1)
{
}

void *sub_100008390(void *a1)
{
  *a1 = &off_100014510;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_1000083D4(void *__p)
{
  *std::__fs::filesystem::path __p = &off_100014510;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_100008418(uint64_t result, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 92))
  {
    if (*(void *)(a2 + 16) != *(void *)(a2 + 8) || (*(_BYTE *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      uint64_t v4 = 0LL;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }

  else
  {
    if (!*(_BYTE *)(result + 16)) {
      goto LABEL_12;
    }
    int v2 = *(unsigned __int8 *)(*(void *)(a2 + 16) - 1LL);
    if (v2 != 13 && v2 != 10) {
      goto LABEL_12;
    }
  }

  *(_DWORD *)a2 = -994;
  uint64_t v4 = *(void *)(result + 8);
LABEL_13:
  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v4;
  return result;
}

void *sub_100008478(void *a1)
{
  *a1 = &off_100014510;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_1000084BC(void *__p)
{
  *std::__fs::filesystem::path __p = &off_100014510;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_100008500(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(_BYTE *)(a2 + 88) & 2) == 0
    || *(_BYTE *)(result + 16) && ((int v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    uint64_t v5 = *(void *)(result + 8);
  }

  else
  {
    uint64_t v5 = 0LL;
    *(_DWORD *)a2 = -993;
  }

  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v5;
  return result;
}

std::locale *sub_100008550(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_1000145D0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100014510;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_1000085A8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_1000145D0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100014510;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_100008600(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 8);
  int v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_17;
  }
  BOOL v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(_BYTE *)(a2 + 88) & 8) == 0)
    {
      uint64_t v6 = *(v3 - 1);
      goto LABEL_13;
    }

uint64_t sub_100008714(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  *(void *)a1 = off_100014618;
  *(void *)(a1 + std::ostream::~ostream(v1, v2 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = *(_OWORD *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 40);
  *(void *)(a1 + 64) = v9;
  if (v9)
  {
    int v10 = (unint64_t *)(v9 + 8);
    do
      unint64_t v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }

  *(void *)(a1 + 72) = *(void *)(a2 + 56);
  *(_DWORD *)(a1 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = a5;
  *(_BYTE *)(a1 + 84) = a3;
  return a1;
}

std::locale *sub_1000087A0(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100014618;
  uint64_t v2 = a1 + 2;
  sub_100006B00((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&off_100014510;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_100008808(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100014618;
  uint64_t v2 = a1 + 2;
  sub_100006B00((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&off_100014510;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

void sub_100008870(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  char v25 = 0;
  __int128 v26 = 0uLL;
  char v27 = 0;
  char v28 = 0;
  uint64_t v29 = 0LL;
  std::__fs::filesystem::path __p = 0LL;
  BOOL v19 = 0LL;
  unint64_t v4 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v20 = 0LL;
  *(void *)&__int128 v21 = v5;
  *((void *)&v21 + 1) = v5;
  char v22 = 0;
  sub_100008E50((char **)&__p, v4, &v21);
  uint64_t v23 = v6;
  uint64_t v24 = v6;
  char v25 = 0;
  __int128 v26 = v21;
  char v27 = v22;
  uint64_t v29 = v6;
  char v28 = 1;
  uint64_t v7 = *(void *)(a2 + 16);
  if (*(_BYTE *)(a2 + 92)) {
    BOOL v8 = v7 == *(void *)(a2 + 8);
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == sub_100008A68( a1 + 16,  v7,  *(void *)(a2 + 24),  (uint64_t *)&__p,  *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u,  v9))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0LL;
    int v10 = (char *)__p;
    goto LABEL_13;
  }

  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = *(void *)(a1 + 8);
  int v10 = (char *)__p;
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v19 - (_BYTE *)__p) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!v10) {
      return;
    }
    goto LABEL_14;
  }

  int v12 = 0;
  int v13 = *(_DWORD *)(a1 + 80);
  uint64_t v14 = *(void *)(a2 + 32);
  unint64_t v15 = 1LL;
  do
  {
    uint64_t v16 = &v10[24 * v15];
    uint64_t v17 = v14 + 24LL * (v13 + v12);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v16;
    *(_BYTE *)(v17 + 16) = v16[16];
    unint64_t v15 = (v12 + 2);
    ++v12;
  }

  while (v11 > v15);
LABEL_14:
  BOOL v19 = v10;
  operator delete(v10);
}

void sub_1000089D8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1000089F8(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(a1 + 24) = a4;
  BOOL v8 = (_OWORD *)(a1 + 24);
  *(void *)(a1 + 32) = a4;
  *(_BYTE *)(a1 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0;
  uint64_t result = sub_100008E50((char **)a1, a2, (__int128 *)(a1 + 24));
  *(void *)(a1 + 4std::ostream::~ostream(v1, v2 + 8) = a3;
  *(void *)(a1 + 56) = a3;
  *(_BYTE *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 72) = *v8;
  *(_BYTE *)(a1 + 8std::ostream::~ostream(v1, v2 + 8) = *(_BYTE *)(a1 + 40);
  if ((a5 & 1) == 0) {
    *(void *)(a1 + 104) = a3;
  }
  *(_BYTE *)(a1 + 96) = 1;
  return result;
}

uint64_t sub_100008A68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v44 = 0LL;
  int64x2_t v45 = 0LL;
  unint64_t v46 = 0LL;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(void *)&__int128 v42 = a3;
    *((void *)&v42 + 1) = a3;
    char v43 = 0;
    *(_DWORD *)uint64_t v39 = 0;
    memset(&v39[8], 0, 48);
    *(_OWORD *)std::__fs::filesystem::path __p = 0u;
    memset(v41, 0, 21);
    int64x2_t v45 = (_OWORD *)sub_10000919C((uint64_t *)&v44, (uint64_t)v39);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    if (*(void *)&v39[32])
    {
      *(void *)&v39[40] = *(void *)&v39[32];
      operator delete(*(void **)&v39[32]);
    }

    uint64_t v36 = a4;
    int v12 = v45;
    *((_DWORD *)v45 - 24) = 0;
    *((void *)v12 - 11) = a2;
    *((void *)v12 - 1sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = a2;
    *((void *)v12 - 9) = a3;
    sub_100009098((uint64_t)(v12 - 4), *(unsigned int *)(a1 + 28), &v42);
    sub_1000090D4((uint64_t)v45 - 40, *(unsigned int *)(a1 + 32));
    uint64_t v37 = a3;
    signed int v13 = a3 - a2;
    uint64_t v14 = v45;
    *((void *)v45 - 2) = v6;
    *((_DWORD *)v14 - 2) = a5;
    *((_BYTE *)v14 - 4) = a6;
    unsigned int v15 = 1;
    while (2)
    {
      uint64_t v17 = v14 - 1;
      uint64_t v16 = *((void *)v14 - 2);
      uint64_t v18 = v14 - 6;
      if (v16) {
        (*(void (**)(uint64_t, _OWORD *))(*(void *)v16 + 16LL))(v16, v14 - 6);
      }
      switch(*(_DWORD *)v18)
      {
        case 0xFFFFFC18:
          uint64_t v19 = *((void *)v14 - 10);
          if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != v37) {
            goto LABEL_16;
          }
          uint64_t v27 = *v36;
          *(void *)uint64_t v27 = a2;
          *(void *)(v27 + std::ostream::~ostream(v1, v2 + 8) = v19;
          *(_BYTE *)(v27 + 16) = 1;
          uint64_t v28 = *((void *)v14 - 8);
          uint64_t v29 = *((void *)v14 - 7) - v28;
          if (v29)
          {
            unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * (v29 >> 3);
            v31 = (_BYTE *)(v28 + 16);
            unsigned int v32 = 1;
            do
            {
              uint64_t v33 = v27 + 24LL * v32;
              *(_OWORD *)uint64_t v33 = *((_OWORD *)v31 - 1);
              char v34 = *v31;
              v31 += 24;
              *(_BYTE *)(v33 + 16) = v34;
            }

            while (v30 > v32++);
          }

          uint64_t v6 = 1LL;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          uint64_t v20 = v45 - 6;
          sub_10000942C((void *)v45 - 12);
          int64x2_t v45 = v20;
          goto LABEL_23;
        case 0xFFFFFC20:
          __int128 v21 = *(v14 - 5);
          *(_OWORD *)uint64_t v39 = *v18;
          *(_OWORD *)&v39[16] = v21;
          memset(&v39[32], 0, 24);
          sub_10000973C( &v39[32],  *((__int128 **)v14 - 8),  *((__int128 **)v14 - 7),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v14 - 7) - *((void *)v14 - 8)) >> 3));
          __p[0] = 0LL;
          __p[1] = 0LL;
          v41[0] = 0LL;
          sub_1000097B8( (char *)__p,  *((__int128 **)v14 - 5),  *((__int128 **)v14 - 4),  (uint64_t)(*((void *)v14 - 4) - *((void *)v14 - 5)) >> 4);
          uint64_t v22 = *v17;
          *(void *)((char *)&v41[1] + 5) = *(void *)((char *)v14 - 11);
          v41[1] = v22;
          (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v17 + 24LL))(*v17, 1LL, v14 - 6);
          (*(void (**)(void, void, _BYTE *))(*(void *)v41[1] + 24LL))(v41[1], 0LL, v39);
          uint64_t v23 = v45;
          if ((unint64_t)v45 >= v46)
          {
            int64x2_t v45 = (_OWORD *)sub_10000919C((uint64_t *)&v44, (uint64_t)v39);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }

          else
          {
            __int128 v24 = *(_OWORD *)&v39[16];
            *int64x2_t v45 = *(_OWORD *)v39;
            v23[1] = v24;
            *((void *)v23 + 4) = 0LL;
            *((void *)v23 + 5) = 0LL;
            *((void *)v23 + 6) = 0LL;
            *((void *)v23 + 7) = 0LL;
            v23[2] = *(_OWORD *)&v39[32];
            *((void *)v23 + 6) = *(void *)&v39[48];
            memset(&v39[32], 0, 24);
            *((void *)v23 + std::ostream::~ostream(v1, v2 + 8) = 0LL;
            *((void *)v23 + 9) = 0LL;
            *(_OWORD *)((char *)v23 + 56) = *(_OWORD *)__p;
            *((void *)v23 + 9) = v41[0];
            __p[0] = 0LL;
            __p[1] = 0LL;
            v41[0] = 0LL;
            uint64_t v25 = v41[1];
            *(void *)((char *)v23 + 85) = *(void *)((char *)&v41[1] + 5);
            *((void *)v23 + 1sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v25;
            int64x2_t v45 = v23 + 6;
          }

          if (*(void *)&v39[32])
          {
            *(void *)&v39[40] = *(void *)&v39[32];
            operator delete(*(void **)&v39[32]);
          }

LABEL_23:
          uint64_t v14 = v45;
          ++v15;
          if (v44 != v45) {
            continue;
          }
          uint64_t v6 = 0LL;
          break;
        default:
          sub_100009150();
      }

      break;
    }
  }

  *(void *)uint64_t v39 = &v44;
  sub_100009868((void ***)v39);
  return v6;
}

    *(_DWORD *)a2 = -992;
    return result;
  }

  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((void *)result + 2);
  return result;
}

void sub_100008DF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  a13 = v18 - 112;
  sub_100009868((void ***)&a13);
  _Unwind_Resume(a1);
}

char *sub_100008E50(char **a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6 = (uint64_t)a1[2];
  uint64_t result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (uint64_t)result) >> 3) >= a2)
  {
    unsigned int v15 = a1[1];
    unint64_t v16 = (v15 - result) / 24;
    if (v16 >= a2) {
      uint64_t v17 = a2;
    }
    else {
      uint64_t v17 = (v15 - result) / 24;
    }
    if (v17)
    {
      uint64_t v18 = result;
      do
      {
        *(_OWORD *)uint64_t v18 = *a3;
        v18[16] = *((_BYTE *)a3 + 16);
        v18 += 24;
        --v17;
      }

      while (v17);
    }

    if (a2 <= v16)
    {
      a1[1] = &result[24 * a2];
    }

    else
    {
      uint64_t v19 = &v15[24 * (a2 - v16)];
      uint64_t v20 = 24 * a2 - 24 * v16;
      do
      {
        __int128 v21 = *a3;
        *((void *)v15 + 2) = *((void *)a3 + 2);
        *(_OWORD *)unsigned int v15 = v21;
        v15 += 24;
        v20 -= 24LL;
      }

      while (v20);
      a1[1] = v19;
    }
  }

  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v6 = 0LL;
      *a1 = 0LL;
      a1[1] = 0LL;
      a1[2] = 0LL;
    }

    if (a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_100006DF8();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
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
    uint64_t result = sub_100008FC4(a1, v10);
    unint64_t v11 = a1[1];
    int v12 = &v11[24 * a2];
    uint64_t v13 = 24 * a2;
    do
    {
      __int128 v14 = *a3;
      *((void *)v11 + 2) = *((void *)a3 + 2);
      *(_OWORD *)unint64_t v11 = v14;
      v11 += 24;
      v13 -= 24LL;
    }

    while (v13);
    a1[1] = v12;
  }

  return result;
}

char *sub_100008FC4(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100006DF8();
  }
  uint64_t result = (char *)sub_100009014((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *sub_100009014(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100006BE0();
  }
  return operator new(24 * a2);
}

void *sub_100009058(void *a1)
{
  uint64_t v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }

  int v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }

  return a1;
}

void sub_100009098(uint64_t a1, unint64_t a2, __int128 *a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v4 = a2 >= v3;
  unint64_t v5 = a2 - v3;
  if (v5 != 0 && v4)
  {
    sub_1000094BC((void **)a1, v5, a3);
  }

  else if (!v4)
  {
    *(void *)(a1 + std::ostream::~ostream(v1, v2 + 8) = *(void *)a1 + 24 * a2;
  }

void sub_1000090D4(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + std::ostream::~ostream(v1, v2 + 8) = *(void *)a1 + 16 * a2;
    }
  }

  else
  {
    sub_100009630((void **)a1, a2 - v2);
  }

void sub_100009104()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_complexity);
}

void sub_10000913C(_Unwind_Exception *a1)
{
}

void sub_100009150()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_unknown);
}

void sub_100009188(_Unwind_Exception *a1)
{
}

uint64_t sub_10000919C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL) {
    sub_100006DF8();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x155555555555555LL) {
    unint64_t v9 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  v16[4] = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)sub_10000935C(v7, v9);
  }
  else {
    unint64_t v10 = 0LL;
  }
  unint64_t v11 = &v10[96 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[96 * v9];
  __int128 v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v11 = *(_OWORD *)a2;
  *((_OWORD *)v11 + 1) = v12;
  *((void *)v11 + 5) = 0LL;
  *((void *)v11 + 6) = 0LL;
  *((void *)v11 + 4) = 0LL;
  *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v11 + 6) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0LL;
  *(void *)(a2 + 4std::ostream::~ostream(v1, v2 + 8) = 0LL;
  *((void *)v11 + 7) = 0LL;
  *((void *)v11 + std::ostream::~ostream(v1, v2 + 8) = 0LL;
  *((void *)v11 + 9) = 0LL;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v11 + 9) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0LL;
  *(void *)(a2 + 64) = 0LL;
  *(void *)(a2 + 72) = 0LL;
  uint64_t v13 = *(void *)(a2 + 80);
  *(void *)(v11 + 85) = *(void *)(a2 + 85);
  *((void *)v11 + 1sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v13;
  v16[2] = v11 + 96;
  sub_1000092E8(a1, v16);
  uint64_t v14 = a1[1];
  sub_100009470((uint64_t)v16);
  return v14;
}

void sub_1000092D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_1000092E8(uint64_t *a1, void *a2)
{
  a2[1] = v4;
  uint64_t v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  uint64_t v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  uint64_t v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void *sub_10000935C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL) {
    sub_100006BE0();
  }
  return operator new(96 * a2);
}

__n128 sub_1000093A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 != a5)
  {
    uint64_t v7 = 0LL;
    do
    {
      uint64_t v8 = a7 + v7;
      uint64_t v9 = a3 + v7;
      __int128 v10 = *(_OWORD *)(a3 + v7 - 80);
      *(_OWORD *)(v8 - 96) = *(_OWORD *)(a3 + v7 - 96);
      *(_OWORD *)(v8 - 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v10;
      *(void *)(v8 - 56) = 0LL;
      *(void *)(v8 - 4std::ostream::~ostream(v1, v2 + 8) = 0LL;
      *(void *)(v8 - 64) = 0LL;
      *(_OWORD *)(v8 - 64) = *(_OWORD *)(a3 + v7 - 64);
      *(void *)(v8 - 4std::ostream::~ostream(v1, v2 + 8) = *(void *)(a3 + v7 - 48);
      *(void *)(v9 - 64) = 0LL;
      *(void *)(v9 - 56) = 0LL;
      *(void *)(v9 - 4std::ostream::~ostream(v1, v2 + 8) = 0LL;
      *(void *)(v8 - 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0LL;
      *(void *)(v8 - 32) = 0LL;
      *(void *)(v8 - 24) = 0LL;
      __n128 result = *(__n128 *)(a3 + v7 - 40);
      *(__n128 *)(v8 - 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = result;
      *(void *)(v8 - 24) = *(void *)(a3 + v7 - 24);
      *(void *)(v9 - 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0LL;
      *(void *)(v9 - 32) = 0LL;
      *(void *)(v9 - 24) = 0LL;
      uint64_t v12 = *(void *)(a3 + v7 - 16);
      *(void *)(v8 - 11) = *(void *)(a3 + v7 - 11);
      *(void *)(v8 - 16) = v12;
      v7 -= 96LL;
    }

    while (a3 + v7 != a5);
  }

  return result;
}

void sub_10000942C(void *a1)
{
  unint64_t v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }

  uint64_t v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }

uint64_t sub_100009470(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 96;
    sub_10000942C((void *)(i - 96));
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_1000094BC(void **a1, unint64_t a2, __int128 *a3)
{
  uint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  uint64_t v9 = *(void **)(v6 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (_BYTE *)v9) >> 3) >= a2)
  {
    if (a2)
    {
      unsigned int v15 = &v9[3 * a2];
      uint64_t v16 = 24 * a2;
      do
      {
        __int128 v17 = *a3;
        v9[2] = *((void *)a3 + 2);
        *(_OWORD *)uint64_t v9 = v17;
        v9 += 3;
        v16 -= 24LL;
      }

      while (v16);
      uint64_t v9 = v15;
    }

    a1[1] = v9;
  }

  else
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (_BYTE *)*a1) >> 3);
    unint64_t v11 = v10 + a2;
    if (v10 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_100006DF8();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (_BYTE *)*a1) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x555555555555555LL) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13) {
      uint64_t v14 = (char *)sub_100009014(v6, v13);
    }
    else {
      uint64_t v14 = 0LL;
    }
    uint64_t v18 = &v14[24 * v10];
    uint64_t v19 = &v18[24 * a2];
    uint64_t v20 = 24 * a2;
    __int128 v21 = v18;
    do
    {
      __int128 v22 = *a3;
      *((void *)v21 + 2) = *((void *)a3 + 2);
      *(_OWORD *)__int128 v21 = v22;
      v21 += 24;
      v20 -= 24LL;
    }

    while (v20);
    uint64_t v23 = &v14[24 * v13];
    uint64_t v25 = (char *)*a1;
    __int128 v24 = (char *)a1[1];
    if (v24 != *a1)
    {
      do
      {
        __int128 v26 = *(_OWORD *)(v24 - 24);
        *((void *)v18 - 1) = *((void *)v24 - 1);
        *(_OWORD *)(v18 - 24) = v26;
        v18 -= 24;
        v24 -= 24;
      }

      while (v24 != v25);
      __int128 v24 = (char *)*a1;
    }

    *a1 = v18;
    a1[1] = v19;
    a1[2] = v23;
    if (v24) {
      operator delete(v24);
    }
  }

void sub_100009630(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }

    a1[1] = v7;
  }

  else
  {
    uint64_t v8 = v7 - (_BYTE *)*a1;
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      sub_100006DF8();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      unint64_t v13 = (char *)sub_100006E0C(v4, v12);
    }
    else {
      unint64_t v13 = 0LL;
    }
    uint64_t v14 = &v13[16 * v10];
    unsigned int v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    uint64_t v16 = &v14[16 * a2];
    uint64_t v18 = (char *)*a1;
    __int128 v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
        v14 -= 16;
        v17 -= 16;
      }

      while (v17 != v18);
      __int128 v17 = (char *)*a1;
    }

    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17) {
      operator delete(v17);
    }
  }

char *sub_10000973C(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = sub_100008FC4(result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    while (a2 != a3)
    {
      __int128 v8 = *a2;
      *(void *)(v7 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v7 = v8;
      v7 += 24LL;
      a2 = (__int128 *)((char *)a2 + 24);
    }

    *((void *)v6 + 1) = v7;
  }

  return result;
}

void sub_10000979C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::ostream::~ostream(v1, v2 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_1000097B8(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = sub_100009828(result, a4);
    uint64_t v7 = (_OWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      __int128 v8 = *a2++;
      *v7++ = v8;
    }

    *((void *)v6 + 1) = v7;
  }

  return result;
}

void sub_10000980C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::ostream::~ostream(v1, v2 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_100009828(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100006DF8();
  }
  __n128 result = (char *)sub_100006E0C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void sub_100009868(void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        sub_10000942C(v4);
      }

      while (v4 != v2);
      uint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

unsigned __int8 *sub_1000098D8(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3 || *a2 != 92) {
    return a2;
  }
  uint64_t v5 = a2 + 1;
  if (a2 + 1 == a3) {
    sub_100009C8C();
  }
  __n128 result = sub_100009CD8(a1, a2 + 1, a3);
  if (result == v5)
  {
    __n128 result = (unsigned __int8 *)sub_100009D94(a1, (char *)a2 + 1, (char *)a3);
    if (result == v5)
    {
      __n128 result = sub_100009E60(a1, a2 + 1, a3, 0LL);
      if (result == v5) {
        return a2;
      }
    }
  }

  return result;
}

char *sub_100009978(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_20;
    }
    uint64_t v5 = a2[1] == 94 ? a2 + 2 : a2 + 1;
    uint64_t v6 = (uint64_t *)sub_10000ABDC(a1, a2[1] == 94);
    if (v5 == a3) {
      goto LABEL_20;
    }
    uint64_t v7 = v6;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v5 == 93)
    {
      sub_10000AC54((uint64_t)v6, 93LL);
      ++v5;
    }

    if (v5 == a3) {
      goto LABEL_20;
    }
    do
    {
      __int128 v8 = v5;
      uint64_t v5 = sub_10000BF4C(a1, v5, a3, v7);
    }

    while (v5 != v8);
    if (v8 == a3) {
      goto LABEL_20;
    }
    if (*v8 == 45)
    {
      sub_10000AC54((uint64_t)v7, 45LL);
      ++v8;
    }

    if (v8 == a3 || *v8 != 93) {
LABEL_20:
    }
      sub_10000BF00();
    return v8 + 1;
  }

  return a2;
}

void *sub_100009A88(void *result)
{
  if ((result[3] & 2) == 0)
  {
    uint64_t v1 = result;
    __n128 result = operator new(0x18uLL);
    int v2 = *((_DWORD *)v1 + 7) + 1;
    *((_DWORD *)v1 + 7) = v2;
    uint64_t v3 = v1[7];
    uint64_t v4 = *(void *)(v3 + 8);
    *__n128 result = &off_1000148A0;
    result[1] = v4;
    *((_DWORD *)result + 4) = v2;
    *(void *)(v3 + std::ostream::~ostream(v1, v2 + 8) = result;
    v1[7] = *(void *)(v1[7] + 8LL);
  }

  return result;
}

void *sub_100009AEC(void *result, int a2)
{
  if ((result[3] & 2) == 0)
  {
    uint64_t v3 = result;
    __n128 result = operator new(0x18uLL);
    uint64_t v4 = v3[7];
    uint64_t v5 = *(void *)(v4 + 8);
    *__n128 result = &off_1000148E8;
    result[1] = v5;
    *((_DWORD *)result + 4) = a2;
    *(void *)(v4 + std::ostream::~ostream(v1, v2 + 8) = result;
    v3[7] = *(void *)(v3[7] + 8LL);
  }

  return result;
}

void sub_100009B48()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badrepeat);
}

void sub_100009B80(_Unwind_Exception *a1)
{
}

_BYTE *sub_100009B94(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    int v4 = (char)*a2;
    BOOL v5 = (v4 - 36) > 0x3A || ((1LL << (*a2 - 36)) & 0x7800000080004F1LL) == 0;
    if (v5 && (v4 - 123) >= 3)
    {
      sub_10000A234(a1, (char)v4);
      ++v3;
    }
  }

  return v3;
}

void *sub_100009C04(void *a1)
{
  *a1 = &off_100014510;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_100009C48(void *__p)
{
  *std::__fs::filesystem::path __p = &off_100014510;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

void sub_100009C8C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_escape);
}

void sub_100009CC4(_Unwind_Exception *a1)
{
}

unsigned __int8 *sub_100009CD8(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v4 = *a2;
  uint64_t v5 = (v4 - 48);
  if (v4 == 48)
  {
    sub_10000A234(a1, v5);
    return a2 + 1;
  }

  uint64_t v6 = a3;
  uint64_t v7 = a2 + 1;
  if (a2 + 1 != a3)
  {
    while (1)
    {
      int v8 = *v7;
      ++v7;
      LODWORD(v5) = v8 + 10 * v5 - 48;
      if (v7 == a3) {
        goto LABEL_12;
      }
    }

    uint64_t v6 = v7;
LABEL_12:
    if (!(_DWORD)v5) {
      goto LABEL_16;
    }
  }

  if (v5 > *(_DWORD *)(a1 + 28)) {
LABEL_16:
  }
    sub_10000A318();
  sub_10000A364(a1, v5);
  return v6;
}

char *sub_100009D94(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v4 = *a2;
  if (v4 > 99)
  {
    if (v4 == 119)
    {
      char v5 = 0;
      goto LABEL_15;
    }

    if (v4 == 115)
    {
      char v9 = 0;
      goto LABEL_17;
    }

    if (v4 != 100) {
      return v3;
    }
    char v6 = 0;
LABEL_12:
    uint64_t v7 = sub_10000ABDC(a1, v6);
    int v8 = v7[40] | 0x400;
LABEL_18:
    v7[40] = v8;
    goto LABEL_19;
  }

  switch(v4)
  {
    case 'D':
      char v6 = 1;
      goto LABEL_12;
    case 'S':
      char v9 = 1;
LABEL_17:
      uint64_t v7 = sub_10000ABDC(a1, v9);
      int v8 = v7[40] | 0x4000;
      goto LABEL_18;
    case 'W':
      char v5 = 1;
LABEL_15:
      uint64_t v10 = sub_10000ABDC(a1, v5);
      v10[40] |= 0x500u;
      sub_10000AC54((uint64_t)v10, 95LL);
LABEL_19:
      ++v3;
      break;
  }

  return v3;
}

unsigned __int8 *sub_100009E60(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  int v4 = a2;
  if (a2 != a3)
  {
    uint64_t v5 = *a2;
    uint64_t v6 = (char)v5;
    if ((int)v6 > 109)
    {
      char v7 = 0;
      switch((char)v5)
      {
        case 'n':
          if (!a4)
          {
            uint64_t v6 = 10LL;
            goto LABEL_69;
          }

          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1LL;
            a4 = (uint64_t *)*a4;
          }

          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }

          __int16 v17 = 10;
          goto LABEL_81;
        case 'r':
          if (!a4)
          {
            uint64_t v6 = 13LL;
            goto LABEL_69;
          }

          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1LL;
            a4 = (uint64_t *)*a4;
          }

          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }

          __int16 v17 = 13;
          goto LABEL_81;
        case 't':
          if (!a4)
          {
            uint64_t v6 = 9LL;
            goto LABEL_69;
          }

          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1LL;
            a4 = (uint64_t *)*a4;
          }

          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }

          __int16 v17 = 9;
          goto LABEL_81;
        case 'u':
          if (v4 + 1 == a3) {
            goto LABEL_91;
          }
          int v8 = v4[1];
          if ((v8 & 0xF8) != 0x30 && (v8 & 0xFE) != 0x38 && (v8 | 0x20u) - 97 >= 6) {
            goto LABEL_91;
          }
          v4 += 2;
          if (v4 == a3) {
            goto LABEL_91;
          }
          int v9 = *v4;
          char v10 = -48;
          if ((v9 & 0xF8) == 0x30 || (v9 & 0xFE) == 0x38) {
            goto LABEL_28;
          }
          v9 |= 0x20u;
          char v10 = -87;
LABEL_28:
          char v7 = 16 * (v10 + v9);
LABEL_29:
          if (v4 + 1 == a3) {
            goto LABEL_91;
          }
          int v11 = v4[1];
          char v12 = -48;
          if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38) {
            goto LABEL_34;
          }
          v11 |= 0x20u;
          char v12 = -87;
LABEL_34:
          if (v4 + 2 == a3) {
            goto LABEL_91;
          }
          int v13 = v4[2];
          char v14 = -48;
          if ((v13 & 0xF8) == 0x30 || (v13 & 0xFE) == 0x38) {
            goto LABEL_39;
          }
          v13 |= 0x20u;
          char v14 = -87;
LABEL_39:
          char v15 = v14 + v13 + 16 * (v12 + v11 + v7);
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1LL;
              a4 = (uint64_t *)*a4;
            }

            else
            {
              *((_BYTE *)a4 + 23) = 1;
            }

            *(_BYTE *)a4 = v15;
            *((_BYTE *)a4 + 1) = 0;
          }

          else
          {
            sub_10000A234(a1, v15);
          }

          v4 += 3;
          return v4;
        case 'v':
          if (!a4)
          {
            uint64_t v6 = 11LL;
            goto LABEL_69;
          }

          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1LL;
            a4 = (uint64_t *)*a4;
          }

          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }

          __int16 v17 = 11;
          break;
        case 'x':
          goto LABEL_29;
        default:
          goto LABEL_53;
      }

      goto LABEL_81;
    }

    if ((_DWORD)v6 == 48)
    {
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1LL;
          a4 = (uint64_t *)*a4;
        }

        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }

        *(_WORD *)a4 = 0;
        return ++v4;
      }

      uint64_t v6 = 0LL;
      goto LABEL_69;
    }

    if ((_DWORD)v6 != 99)
    {
      if ((_DWORD)v6 == 102)
      {
        if (a4)
        {
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1LL;
            a4 = (uint64_t *)*a4;
          }

          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }

          __int16 v17 = 12;
LABEL_81:
          *(_WORD *)a4 = v17;
          return ++v4;
        }

        uint64_t v6 = 12LL;
LABEL_69:
        sub_10000A234(a1, v6);
        return ++v4;
      }

LABEL_91:
      sub_100009C8C();
    }

    uint64_t v16 = v4[1] & 0x1F;
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1LL;
        a4 = (uint64_t *)*a4;
      }

      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }

      *(_BYTE *)a4 = v16;
      *((_BYTE *)a4 + 1) = 0;
    }

    else
    {
      sub_10000A234(a1, v16);
    }

    v4 += 2;
  }

  return v4;
}

uint64_t sub_10000A234(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 24);
  if ((v4 & 1) != 0)
  {
    int v8 = (char *)operator new(0x30uLL);
    uint64_t result = sub_10000A430((uint64_t)v8, a1, a2, *(void *)(*(void *)(a1 + 56) + 8LL));
LABEL_6:
    *(void *)(*(void *)(a1 + 56) + 8LL) = v8;
    goto LABEL_7;
  }

  if ((v4 & 8) != 0)
  {
    int v8 = (char *)operator new(0x30uLL);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
    *(void *)int v8 = off_1000146F0;
    *((void *)v8 + 1) = v9;
    uint64_t result = (uint64_t)std::locale::locale((std::locale *)v8 + 2, (const std::locale *)a1);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)(a1 + 8);
    v8[40] = a2;
    goto LABEL_6;
  }

  uint64_t result = (uint64_t)operator new(0x18uLL);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(v6 + 8);
  *(void *)uint64_t result = &off_100014738;
  *(void *)(result + std::ostream::~ostream(v1, v2 + 8) = v7;
  *(_BYTE *)(result + 16) = a2;
  *(void *)(v6 + std::ostream::~ostream(v1, v2 + 8) = result;
LABEL_7:
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return result;
}

void sub_10000A304(_Unwind_Exception *a1)
{
}

void sub_10000A318()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_backref);
}

void sub_10000A350(_Unwind_Exception *a1)
{
}

void *sub_10000A364(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)(a1 + 24);
  if ((v4 & 1) != 0)
  {
    int v8 = (std::locale *)operator new(0x30uLL);
    uint64_t v9 = v8;
    char v10 = *(std::locale::__imp **)(*(void *)(a1 + 56) + 8LL);
LABEL_6:
    v8->__locale_ = (std::locale::__imp *)(v11 + 2);
    v8[1].__locale_ = v10;
    uint64_t result = std::locale::locale(v8 + 2, (const std::locale *)a1);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)(a1 + 8);
    LODWORD(v9[5].__locale_) = a2;
    *(void *)(*(void *)(a1 + 56) + 8LL) = v9;
    goto LABEL_7;
  }

  if ((v4 & 8) != 0)
  {
    int v8 = (std::locale *)operator new(0x30uLL);
    uint64_t v9 = v8;
    char v10 = *(std::locale::__imp **)(*(void *)(a1 + 56) + 8LL);
    goto LABEL_6;
  }

  uint64_t result = operator new(0x18uLL);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(v6 + 8);
  *uint64_t result = &off_100014810;
  result[1] = v7;
  *((_DWORD *)result + 4) = a2;
  *(void *)(v6 + std::ostream::~ostream(v1, v2 + 8) = result;
LABEL_7:
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return result;
}

uint64_t sub_10000A430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = off_1000146A8;
  *(void *)(a1 + std::ostream::~ostream(v1, v2 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = (*(uint64_t (**)(void, uint64_t))(**(void **)(a2 + 8) + 40LL))( *(void *)(a2 + 8),  a3);
  return a1;
}

void sub_10000A49C(_Unwind_Exception *a1)
{
  *uint64_t v1 = &off_100014510;
  uint64_t v4 = v1[1];
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
  }
  _Unwind_Resume(a1);
}

std::locale *sub_10000A4D4(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_1000146A8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100014510;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_10000A52C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_1000146A8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100014510;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_10000A584(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40LL))( *(void *)(result + 24),  *v3),  *(unsigned __int8 *)(v4 + 40) != result))
  {
    uint64_t v5 = 0LL;
    *(_DWORD *)a2 = -993;
  }

  else
  {
    *(_DWORD *)a2 = -995;
    ++*(void *)(a2 + 16);
    uint64_t v5 = *(void *)(v4 + 8);
  }

  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v5;
  return result;
}

std::locale *sub_10000A5FC(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_1000146F0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100014510;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_10000A654(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_1000146F0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100014510;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_10000A6AC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    uint64_t v3 = 0LL;
    *(_DWORD *)a2 = -993;
  }

  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }

  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v3;
  return result;
}

void *sub_10000A6F4(void *a1)
{
  *a1 = &off_100014510;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_10000A738(void *__p)
{
  *std::__fs::filesystem::path __p = &off_100014510;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_10000A77C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    uint64_t v3 = 0LL;
    *(_DWORD *)a2 = -993;
  }

  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }

  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v3;
  return result;
}

std::locale *sub_10000A7C4(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100014780;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100014510;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_10000A81C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100014780;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100014510;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_10000A874(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32) + 24LL * (*(_DWORD *)(result + 40) - 1);
  if (*(_BYTE *)(v3 + 16))
  {
    uint64_t v4 = *(void *)(v3 + 8) - *(void *)v3;
    uint64_t v5 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v5 >= v4)
    {
      uint64_t v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v5 + v4;
        uint64_t v6 = *(void *)(v7 + 8);
        goto LABEL_10;
      }

      uint64_t v8 = 0LL;
      while (1)
      {
        int v9 = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40LL))( *(void *)(v7 + 24),  *(char *)(*(void *)v3 + v8));
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40LL))( *(void *)(v7 + 24),  *(char *)(*(void *)(a2 + 16) + v8));
        if (v9 != (_DWORD)result) {
          break;
        }
        if (v4 == ++v8)
        {
          uint64_t v5 = *(void *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }

  uint64_t v6 = 0LL;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v6;
  return result;
}

std::locale *sub_10000A958(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_1000147C8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100014510;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_10000A9B0(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_1000147C8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100014510;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_10000AA08(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(result + 40) - 1;
  uint64_t v3 = *(void *)(a2 + 32);
  if (*(_BYTE *)(v3 + 24LL * v2 + 16))
  {
    uint64_t v4 = (unsigned __int8 **)(v3 + 24LL * v2);
    uint64_t v5 = *v4;
    uint64_t v6 = v4[1] - *v4;
    uint64_t v7 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v7 + v6;
        uint64_t v8 = *(void *)(result + 8);
        goto LABEL_9;
      }

      int v9 = *(unsigned __int8 **)(a2 + 16);
      uint64_t v10 = v6;
      while (1)
      {
        int v12 = *v5++;
        int v11 = v12;
        int v13 = *v9++;
        if (v11 != v13) {
          break;
        }
        if (!--v10) {
          goto LABEL_8;
        }
      }
    }
  }

  uint64_t v8 = 0LL;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v8;
  return result;
}

void *sub_10000AA98(void *a1)
{
  *a1 = &off_100014510;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_10000AADC(void *__p)
{
  *std::__fs::filesystem::path __p = &off_100014510;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

unsigned int *sub_10000AB20(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    sub_10000A318();
  }
  unsigned int v5 = v2 - 1;
  if (*(_BYTE *)(v3 + 24LL * v5 + 16)
    && (uint64_t v6 = result,
        uint64_t v7 = v3 + 24LL * v5,
        uint64_t result = *(unsigned int **)v7,
        int64_t v8 = *(void *)(v7 + 8) - *(void *)v7,
        uint64_t v9 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v9 >= v8)
    && (uint64_t result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !(_DWORD)result))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v9 + v8;
    uint64_t v10 = *((void *)v6 + 1);
  }

  else
  {
    uint64_t v10 = 0LL;
    *(_DWORD *)a2 = -993;
  }

  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v10;
  return result;
}

void *sub_10000ABDC(uint64_t a1, char a2)
{
  uint64_t v4 = operator new(0xB0uLL);
  sub_10000AE80( (uint64_t)v4,  a1,  *(void *)(*(void *)(a1 + 56) + 8LL),  a2,  *(_DWORD *)(a1 + 24) & 1,  (*(_DWORD *)(a1 + 24) & 8) != 0);
  *(void *)(*(void *)(a1 + 56) + 8LL) = v4;
  *(void *)(a1 + 56) = v4;
  return v4;
}

void sub_10000AC40(_Unwind_Exception *a1)
{
}

void sub_10000AC54(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40LL))(*(void *)(a1 + 24), a2);
    unsigned int v5 = *(_BYTE **)(a1 + 48);
    unint64_t v4 = *(void *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      uint64_t v6 = (unint64_t *)(a1 + 40);
      unint64_t v7 = *(void *)(a1 + 40);
      int64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          int v12 = operator new(v11);
        }
        else {
          int v12 = 0LL;
        }
        uint64_t v20 = &v8[(void)v12];
        __int128 v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          __int128 v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }

          while (v5 != (_BYTE *)v7);
LABEL_45:
          unsigned int v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }

        goto LABEL_46;
      }

LABEL_50:
      sub_100006DF8();
    }

    goto LABEL_22;
  }

  uint64_t v6 = (unint64_t *)(a1 + 40);
  unsigned int v5 = *(_BYTE **)(a1 + 48);
  unint64_t v13 = *(void *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      uint64_t v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          int v12 = operator new(v28);
        }
        else {
          int v12 = 0LL;
        }
        uint64_t v20 = &v25[(void)v12];
        __int128 v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }

          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }

        goto LABEL_46;
      }

      goto LABEL_50;
    }

      sub_100006DF8();
    }

    goto LABEL_22;
  }

  uint64_t v6 = (unint64_t *)(a1 + 64);
  unsigned int v5 = *(_BYTE **)(a1 + 72);
  unint64_t v13 = *(void *)(a1 + 80);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      uint64_t v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          int v12 = operator new(v28);
        }
        else {
          int v12 = 0LL;
        }
        uint64_t v20 = &v25[(void)v12];
        __int128 v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }

          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }

        goto LABEL_46;
      }

      goto LABEL_50;
    }

LABEL_46:
  int v12 = v20;
LABEL_47:
  *(void *)(a1 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v12;
  *(void *)(a1 + 4std::ostream::~ostream(v1, v2 + 8) = v19;
  *(void *)(a1 + 56) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 4std::ostream::~ostream(v1, v2 + 8) = v19;
}

    unint64_t v16 = 1;
    goto LABEL_155;
  }

  int v12 = v20;
LABEL_47:
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v19;
  *(void *)(a1 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 72) = v19;
}

uint64_t sub_10000AE80(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)a1 = off_100014858;
  *(void *)(a1 + std::ostream::~ostream(v1, v2 + 8) = a3;
  size_t v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  __int128 v12 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 8std::ostream::~ostream(v1, v2 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = v12;
  *(_OWORD *)(a1 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 12sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_BYTE *)(a1 + 16std::ostream::~ostream(v1, v2 + 8) = a4;
  *(_BYTE *)(a1 + 169) = a5;
  *(_BYTE *)(a1 + 17sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = a6;
  std::locale::locale(&v17, v11);
  std::locale::name(&v18, &v17);
  std::string::size_type size = v18.__r_.__value_.__s.__size_;
  if ((v18.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type size = v18.__r_.__value_.__l.__size_;
  }
  if (size == 1)
  {
    unint64_t v14 = (std::string *)v18.__r_.__value_.__r.__words[0];
    if ((v18.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      unint64_t v14 = &v18;
    }
    BOOL v15 = v14->__r_.__value_.__s.__data_[0] != 67;
  }

  else
  {
    BOOL v15 = 1;
    if ((char)v18.__r_.__value_.__s.__size_ < 0) {
LABEL_9:
    }
      operator delete(v18.__r_.__value_.__l.__data_);
  }

  std::locale::~locale(&v17);
  *(_BYTE *)(a1 + 171) = v15;
  return a1;
}

void sub_10000AF94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  a10 = v10 + 17;
  sub_10000B910((void ***)&a10);
  unint64_t v14 = (void *)v10[14];
  if (v14)
  {
    v10[15] = v14;
    operator delete(v14);
  }

  sub_10000B99C((void ***)&a10);
  BOOL v15 = (void *)v10[8];
  if (v15)
  {
    v10[9] = v15;
    operator delete(v15);
  }

  unint64_t v16 = *v12;
  if (*v12)
  {
    v10[6] = v16;
    operator delete(v16);
  }

  std::locale::~locale(v11);
  *unint64_t v10 = &off_100014510;
  uint64_t v17 = v10[1];
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8LL))(v17);
  }
  _Unwind_Resume(a1);
}

std::locale *sub_10000B020(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100014858;
  unint64_t v7 = a1 + 17;
  sub_10000B910((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }

  unint64_t v7 = a1 + 11;
  sub_10000B99C((void ***)&v7);
  uint64_t v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }

  unint64_t v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }

  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100014510;
  unsigned int v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8LL))(v5);
  }
  return a1;
}

void sub_10000B0D4(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100014858;
  uint64_t v6 = a1 + 17;
  sub_10000B910((void ***)&v6);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }

  uint64_t v6 = a1 + 11;
  sub_10000B99C((void ***)&v6);
  uint64_t v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }

  unint64_t v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }

  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_100014510;
  unsigned int v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8LL))(v5);
  }
  operator delete(a1);
}

void sub_10000B18C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(signed __int8 **)(a2 + 16);
  unsigned int v5 = *(signed __int8 **)(a2 + 24);
  if (v4 == v5)
  {
    uint64_t v18 = 0LL;
    int v16 = *(unsigned __int8 *)(a1 + 168);
    goto LABEL_155;
  }

  if (!*(_BYTE *)(a1 + 171) || v4 + 1 == v5) {
    goto LABEL_27;
  }
  signed __int8 v6 = *v4;
  unsigned __int8 v81 = *v4;
  signed __int8 v7 = v4[1];
  unsigned __int8 v82 = v7;
  if (*(_BYTE *)(a1 + 169))
  {
    unsigned __int8 v81 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  v6);
    unsigned __int8 v82 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  v7);
  }

  sub_10000BB2C(a1 + 16, (char *)&v81, (char *)&v83, &__p);
  if (((char)__p.__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    if (__p.__r_.__value_.__s.__size_) {
      goto LABEL_8;
    }
LABEL_27:
    int v16 = 0;
    uint64_t v18 = 1LL;
    goto LABEL_28;
  }

  std::string::size_type size = __p.__r_.__value_.__l.__size_;
  operator delete(__p.__r_.__value_.__l.__data_);
  if (!size) {
    goto LABEL_27;
  }
LABEL_8:
  uint64_t v8 = *(void *)(a1 + 112);
  uint64_t v9 = *(void *)(a1 + 120) - v8;
  if (v9)
  {
    uint64_t v10 = v9 >> 1;
    size_t v11 = (_BYTE *)(v8 + 1);
    do
    {
      v11 += 2;
      --v10;
    }

    while (v10);
  }

  if (!*(_BYTE *)(a1 + 170) || *(void *)(a1 + 88) == *(void *)(a1 + 96))
  {
    int v16 = 0;
  }

  else
  {
    sub_10000BA90(a1 + 16, (char *)&v81, (char *)&v83);
    uint64_t v13 = *(void *)(a1 + 88);
    if (*(void *)(a1 + 96) == v13)
    {
LABEL_24:
      int v16 = 0;
      int v17 = 0;
    }

    else
    {
      uint64_t v14 = 0LL;
      unint64_t v15 = 0LL;
      while ((int)(sub_100002F6C((void *)(v13 + v14), (void **)&__p.__r_.__value_.__l.__data_) << 24) > 0xFFFFFF
           || (int)(sub_100002F6C(&__p, (void **)(*(void *)(a1 + 88) + v14 + 24)) << 24) >= 0x1000000)
      {
        ++v15;
        uint64_t v13 = *(void *)(a1 + 88);
        v14 += 48LL;
        if (v15 >= 0xAAAAAAAAAAAAAAABLL * ((*(void *)(a1 + 96) - v13) >> 4)) {
          goto LABEL_24;
        }
      }

      int v16 = 1;
      int v17 = 5;
    }

    if ((v16 & 1) != 0) {
      goto LABEL_129;
    }
  }

  if (*(void *)(a1 + 136) == *(void *)(a1 + 144)) {
    goto LABEL_134;
  }
  sub_10000BD64(a1 + 16, (char *)&v81, (char *)&v83, (uint64_t)&__p);
  uint64_t v53 = *(void *)(a1 + 136);
  uint64_t v54 = __p.__r_.__value_.__s.__size_;
  uint64_t v55 = *(void *)(a1 + 144) - v53;
  if (v55)
  {
    uint64_t v56 = 0LL;
    unint64_t v57 = v55 / 24;
    __int128 v58 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type v59 = __p.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v59 = __p.__r_.__value_.__l.__size_;
    }
    if (v57 <= 1) {
      uint64_t v60 = 1LL;
    }
    else {
      uint64_t v60 = v55 / 24;
    }
    BOOL v61 = 1;
    while (1)
    {
      v62 = (unsigned __int8 **)(v53 + 24 * v56);
      v63 = (unsigned __int8 *)*((unsigned __int8 *)v62 + 23);
      int v64 = (char)v63;
      if ((unsigned __int8 *)v59 == v63)
      {
        if (v64 >= 0) {
          v65 = (unsigned __int8 *)(v53 + 24 * v56);
        }
        else {
          v65 = *v62;
        }
        if ((v54 & 0x80) == 0)
        {
          if ((_DWORD)v54)
          {
            p_p = &__p;
            uint64_t v67 = v54;
            do
            {
              p_p = (std::string *)((char *)p_p + 1);
              ++v65;
              --v67;
            }

            while (v67);
            int v16 = 1;
            int v17 = 5;
            goto LABEL_126;
          }

          int v16 = 1;
          if (v61) {
            goto LABEL_154;
          }
LABEL_134:
          if ((char)v81 < 0)
          {
            int v72 = *(_DWORD *)(a1 + 164);
            goto LABEL_147;
          }

          int v69 = *(_DWORD *)(a1 + 160);
          uint64_t v70 = *(void *)(*(void *)(a1 + 24) + 16LL);
          int v71 = *(_DWORD *)(v70 + 4LL * v81);
          if ((v71 & v69) == 0 && (v81 != 95 || (v69 & 0x80) == 0)
            || (char)v82 < 0
            || (*(_DWORD *)(v70 + 4LL * v82) & v69) == 0 && ((v69 & 0x80) == 0 || v82 != 95))
          {
            int v72 = *(_DWORD *)(a1 + 164);
            if ((v71 & v72) != 0 || v81 == 95 && (v72 & 0x80) != 0)
            {
LABEL_151:
              int v73 = v16;
              goto LABEL_153;
            }

LABEL_147:
            if (((char)v82 & 0x80000000) == 0)
            {
              if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16LL) + 4LL * v82) & v72) != 0) {
                goto LABEL_151;
              }
              int v73 = 1;
              if (v82 == 95 && (v72 & 0x80) != 0) {
                goto LABEL_151;
              }
LABEL_153:
              int v16 = v73;
LABEL_154:
              uint64_t v18 = 2LL;
              goto LABEL_155;
            }
          }

LABEL_152:
          int v73 = 1;
          goto LABEL_153;
        }

        unint64_t v78 = v57;
        uint64_t v79 = v54;
        int v68 = memcmp((const void *)v58, v65, *((size_t *)&v58 + 1));
        unint64_t v57 = v78;
        uint64_t v54 = v79;
        if (!v68) {
          break;
        }
      }

LABEL_122:
      BOOL v61 = ++v56 < v57;
      if (v56 == v60) {
        goto LABEL_125;
      }
    }

    int v17 = 5;
    int v16 = 1;
    goto LABEL_127;
  }

  BOOL v61 = 0;
LABEL_125:
  int v17 = 0;
LABEL_126:
  if ((v54 & 0x80) != 0) {
LABEL_127:
  }
    operator delete(__p.__r_.__value_.__l.__data_);
  if (!v61) {
    goto LABEL_134;
  }
LABEL_129:
  if (v17) {
    goto LABEL_154;
  }
  uint64_t v18 = 2LL;
LABEL_28:
  unsigned __int8 v20 = **(_BYTE **)(a2 + 16);
  unsigned __int8 v81 = v20;
  if (*(_BYTE *)(a1 + 169))
  {
    unsigned __int8 v20 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  (char)v20);
    unsigned __int8 v81 = v20;
  }

  __int128 v21 = *(unsigned __int8 **)(a1 + 40);
  unint64_t v22 = *(void *)(a1 + 48) - (void)v21;
  if (v22)
  {
    if (v22 <= 1) {
      unint64_t v22 = 1LL;
    }
    while (1)
    {
      int v23 = *v21++;
      if (v23 == v20) {
        break;
      }
      if (!--v22) {
        goto LABEL_35;
      }
    }

LABEL_35:
  unsigned int v24 = *(_DWORD *)(a1 + 164);
  if (v24 || *(void *)(a1 + 64) != *(void *)(a1 + 72))
  {
    if ((v20 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16LL) + 4LL * v20) & v24) == 0) {
      int v25 = (v20 == 95) & (v24 >> 7);
    }
    else {
      LOBYTE(v25) = 1;
    }
    unint64_t v26 = *(void **)(a1 + 72);
    unint64_t v27 = memchr(*(const void **)(a1 + 64), (char)v20, (size_t)v26 - *(void *)(a1 + 64));
    size_t v28 = v27 ? v27 : v26;
    if ((v25 & 1) == 0 && v28 == v26) {
      goto LABEL_46;
    }
  }

  uint64_t v29 = *(void *)(a1 + 88);
  uint64_t v30 = *(void *)(a1 + 96);
  if (v29 != v30)
  {
    if (*(_BYTE *)(a1 + 170))
    {
      sub_10000BA90(a1 + 16, (char *)&v81, (char *)&v82);
      uint64_t v29 = *(void *)(a1 + 88);
      uint64_t v30 = *(void *)(a1 + 96);
    }

    else
    {
      __p.__r_.__value_.__s.__size_ = 1;
      LOWORD(__p.__r_.__value_.__l.__data_) = v20;
    }

    if (v30 == v29)
    {
LABEL_57:
      char v33 = 0;
    }

    else
    {
      uint64_t v31 = 0LL;
      unint64_t v32 = 0LL;
      while ((int)(sub_100002F6C((void *)(v29 + v31), (void **)&__p.__r_.__value_.__l.__data_) << 24) > 0xFFFFFF
           || (int)(sub_100002F6C(&__p, (void **)(*(void *)(a1 + 88) + v31 + 24)) << 24) >= 0x1000000)
      {
        ++v32;
        uint64_t v29 = *(void *)(a1 + 88);
        v31 += 48LL;
        if (v32 >= 0xAAAAAAAAAAAAAAABLL * ((*(void *)(a1 + 96) - v29) >> 4)) {
          goto LABEL_57;
        }
      }

      char v33 = 1;
      int v16 = 1;
    }

    if ((v33 & 1) != 0) {
      goto LABEL_155;
    }
  }

  if (*(void *)(a1 + 136) == *(void *)(a1 + 144)) {
    goto LABEL_90;
  }
  sub_10000BD64(a1 + 16, (char *)&v81, (char *)&v82, (uint64_t)&__p);
  uint64_t v34 = *(void *)(a1 + 136);
  uint64_t v35 = __p.__r_.__value_.__s.__size_;
  uint64_t v36 = *(void *)(a1 + 144) - v34;
  if (v36)
  {
    uint64_t v37 = 0LL;
    unint64_t v38 = v36 / 24;
    __int128 v39 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type v40 = __p.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v40 = __p.__r_.__value_.__l.__size_;
    }
    if (v38 <= 1) {
      uint64_t v41 = 1LL;
    }
    else {
      uint64_t v41 = v36 / 24;
    }
    BOOL v42 = 1;
    while (1)
    {
      char v43 = (unsigned __int8 **)(v34 + 24 * v37);
      uint64_t v44 = (unsigned __int8 *)*((unsigned __int8 *)v43 + 23);
      int v45 = (char)v44;
      if ((unsigned __int8 *)v40 == v44)
      {
        if (v45 >= 0) {
          unint64_t v46 = (unsigned __int8 *)(v34 + 24 * v37);
        }
        else {
          unint64_t v46 = *v43;
        }
        if ((v35 & 0x80) != 0)
        {
          int v77 = v16;
          std::string::size_type v49 = v40;
          uint64_t v76 = v34;
          int v50 = memcmp((const void *)v39, v46, *((size_t *)&v39 + 1));
          uint64_t v34 = v76;
          std::string::size_type v40 = v49;
          int v16 = v77;
          if (!v50)
          {
            int v16 = 1;
            goto LABEL_88;
          }
        }

        else
        {
          if (!(_DWORD)v35)
          {
            int v16 = 1;
            if (!v42) {
              goto LABEL_90;
            }
            goto LABEL_155;
          }

          uint64_t v47 = &__p;
          uint64_t v48 = v35;
          while (v47->__r_.__value_.__s.__data_[0] == *v46)
          {
            uint64_t v47 = (std::string *)((char *)v47 + 1);
            ++v46;
            if (!--v48)
            {
              int v16 = 1;
              goto LABEL_85;
            }
          }
        }
      }

      BOOL v42 = ++v37 < v38;
      if (v37 == v41)
      {
LABEL_85:
        if ((v35 & 0x80) == 0) {
          goto LABEL_89;
        }
        goto LABEL_88;
      }
    }
  }

  BOOL v42 = 0;
  if ((__p.__r_.__value_.__s.__size_ & 0x80) != 0) {
LABEL_88:
  }
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_89:
  if (!v42)
  {
LABEL_90:
    unsigned int v51 = *(_DWORD *)(a1 + 160);
    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16LL) + 4LL * v81) & v51) == 0)
    {
      int v52 = (v51 >> 7) & 1;
      if (v81 != 95) {
        int v52 = 0;
      }
      if (v52 != 1) {
        goto LABEL_155;
      }
    }

    goto LABEL_46;
  }

LABEL_155:
  if (v16 == *(unsigned __int8 *)(a1 + 168))
  {
    uint64_t v74 = 0LL;
    int v75 = -993;
  }

  else
  {
    *(void *)(a2 + 16) += v18;
    uint64_t v74 = *(void *)(a1 + 8);
    int v75 = -995;
  }

  *(_DWORD *)a2 = v75;
  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v74;
}

void sub_10000B910(void ***a1)
{
  char v2 = *a1;
  if (*v2)
  {
    sub_10000B950((uint64_t *)v2);
    operator delete(**a1);
  }

void sub_10000B950(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24LL)
  {
  }

  a1[1] = v2;
}

void sub_10000B99C(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unsigned int v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48LL;
        sub_10000BA0C(v4);
      }

      while ((void *)v4 != v2);
      unsigned int v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void sub_10000BA0C(uint64_t a1)
{
}

uint64_t sub_10000BA50(uint64_t a1)
{
  return a1;
}

void sub_10000BA90(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unsigned int v5 = __p;
  }
  else {
    unsigned int v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32LL))( *(void *)(a1 + 16),  v5,  (char *)v5 + v4);
}

void sub_10000BB10( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000BB2C(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, std::string *a4@<X8>)
{
  a4->__r_.__value_.__r.__words[0] = 0LL;
  a4->__r_.__value_.__l.__size_ = 0LL;
  a4->__r_.__value_.__l.__cap_ = 0LL;
  if ((char)__s.__r_.__value_.__s.__size_ < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }

  else
  {
    if (!__s.__r_.__value_.__s.__size_) {
      return;
    }
    p_s = &__s;
  }

  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)&a4->__r_.__value_.__l.__data_ = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  std::string::size_type cap = v13.__r_.__value_.__l.__cap_;
  a4->__r_.__value_.__l.__cap_ = v13.__r_.__value_.__l.__cap_;
  std::string::size_type size = HIBYTE(cap);
  if ((size & 0x80u) != 0LL) {
    std::string::size_type size = a4->__r_.__value_.__l.__size_;
  }
  if (size) {
    goto LABEL_9;
  }
  if ((char)__s.__r_.__value_.__s.__size_ < 0)
  {
    std::string::size_type v9 = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
    uint64_t v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }

  else
  {
    std::string::size_type v9 = __s.__r_.__value_.__s.__size_;
    if (__s.__r_.__value_.__s.__size_ >= 3u) {
      return;
    }
    uint64_t v10 = &__s;
  }

  (*(void (**)(std::string *__return_ptr, void, std::string *, char *))(**(void **)(a1 + 16) + 32LL))( &v13,  *(void *)(a1 + 16),  v10,  (char *)v10 + v9);
  *a4 = v13;
  if (((char)a4->__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    int v11 = a4->__r_.__value_.__s.__size_;
    if (v11 != 12 && v11 != 1)
    {
      a4->__r_.__value_.__s.__data_[0] = 0;
      a4->__r_.__value_.__s.__size_ = 0;
      goto LABEL_9;
    }

    goto LABEL_25;
  }

  std::string::size_type v12 = a4->__r_.__value_.__l.__size_;
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=(a4, &__s);
    goto LABEL_9;
  }

  *a4->__r_.__value_.__l.__data_ = 0;
  a4->__r_.__value_.__l.__size_ = 0LL;
LABEL_9:
}

void sub_10000BC8C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_10000BCC0(void *result, char *a2, char *a3, unint64_t a4)
{
  unint64_t v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100006B58();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000LL;
    *unint64_t v4 = result;
    unint64_t v4 = result;
  }

  else
  {
    *((_BYTE *)result + 23) = a4;
  }

  while (a2 != a3)
  {
    char v10 = *a2++;
    *(_BYTE *)unint64_t v4 = v10;
    unint64_t v4 = (void *)((char *)v4 + 1);
  }

  *(_BYTE *)unint64_t v4 = 0;
  return result;
}

void sub_10000BD64(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    unsigned __int8 v7 = __p;
  }
  else {
    unsigned __int8 v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32LL))( *(void *)(a1 + 16),  v7,  (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0LL) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        char v10 = (_BYTE *)a4;
      }
      else {
        char v10 = *(_BYTE **)a4;
      }
      v10[11] = v10[3];
    }

    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(void *)(a4 + std::ostream::~ostream(v1, v2 + 8) = 0LL;
    }

    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }

void sub_10000BE3C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_10000BE58(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100006B58();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000LL;
    *__b = v6;
  }

  else
  {
    *((_BYTE *)__b + 23) = __len;
    unint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void sub_10000BF00()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brack);
}

void sub_10000BF38(_Unwind_Exception *a1)
{
}

char *sub_10000BF4C(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  unint64_t v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  int v5 = *a2;
  if (v5 == 93) {
    return v4;
  }
  uint64_t v6 = (uint64_t)a4;
  unsigned int v9 = 0;
  uint64_t v10 = 0LL;
  __int128 v31 = 0uLL;
  uint64_t v32 = 0LL;
  if (a2 + 1 != a3 && v5 == 91)
  {
    int v11 = a2[1];
    switch(v11)
    {
      case '.':
        unint64_t v4 = (char *)sub_10000C5B0(a1, a2 + 2, a3, (uint64_t)&v31);
        unsigned int v9 = HIBYTE(v32);
        uint64_t v10 = *((void *)&v31 + 1);
        break;
      case ':':
        uint64_t v12 = sub_10000C4F8(a1, a2 + 2, a3, (uint64_t)a4);
        goto LABEL_11;
      case '=':
        uint64_t v12 = sub_10000C31C(a1, a2 + 2, a3, a4);
LABEL_11:
        uint64_t v6 = v12;
        char v13 = 0;
        goto LABEL_44;
      default:
        uint64_t v10 = 0LL;
        unsigned int v9 = 0;
        break;
    }
  }

  int v14 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if ((v9 & 0x80u) == 0) {
    uint64_t v10 = v9;
  }
  if (v10)
  {
    unint64_t v15 = v4;
    goto LABEL_28;
  }

  if ((*(_DWORD *)(a1 + 24) & 0x1B0 | 0x40) == 0x40)
  {
    int v16 = *v4;
    if (v16 == 92)
    {
      uint64_t v17 = v4 + 1;
      if (v14) {
        uint64_t v18 = sub_10000C800(a1, v17, a3, (uint64_t *)&v31);
      }
      else {
        uint64_t v18 = (char *)sub_10000C69C(a1, (unsigned __int8 *)v17, (unsigned __int8 *)a3, (uint64_t)&v31, v6);
      }
      unint64_t v15 = v18;
      goto LABEL_28;
    }
  }

  else
  {
    LOBYTE(v16) = *v4;
  }

  if ((v9 & 0x80) != 0)
  {
    uint64_t v19 = (__int128 *)v31;
    *((void *)&v31 + 1) = 1LL;
  }

  else
  {
    HIBYTE(v32) = 1;
    uint64_t v19 = &v31;
  }

  *(_BYTE *)uint64_t v19 = v16;
  *((_BYTE *)v19 + 1) = 0;
  unint64_t v15 = v4 + 1;
LABEL_28:
  if (v15 == a3
    || (int v20 = *v15, v20 == 93)
    || (__int128 v21 = v15 + 1, v15 + 1 == a3)
    || v20 != 45
    || *v21 == 93)
  {
    if (SHIBYTE(v32) < 0)
    {
      if (*((void *)&v31 + 1))
      {
        if (*((void *)&v31 + 1) != 1LL)
        {
          unint64_t v22 = (char *)v31;
LABEL_42:
          sub_10000CEB0(v6, *v22, v22[1]);
          goto LABEL_43;
        }

        unint64_t v22 = (char *)v31;
        goto LABEL_40;
      }
    }

    else if (HIBYTE(v32))
    {
      unint64_t v22 = (char *)&v31;
      if (HIBYTE(v32) != 1) {
        goto LABEL_42;
      }
LABEL_40:
      sub_10000AC54(v6, *v22);
    }

LABEL_43:
    char v13 = 1;
    unint64_t v4 = v15;
    goto LABEL_44;
  }

  v29[0] = 0LL;
  v29[1] = 0LL;
  uint64_t v30 = 0LL;
  unint64_t v4 = v15 + 2;
  if (v15 + 2 != a3 && *v21 == 91 && *v4 == 46)
  {
    uint64_t v24 = sub_10000C5B0(a1, v15 + 3, a3, (uint64_t)v29);
LABEL_60:
    unint64_t v4 = (char *)v24;
    goto LABEL_61;
  }

  if ((v14 | 0x40) == 0x40)
  {
    LODWORD(v21) = *v21;
    if ((_DWORD)v21 == 92)
    {
      if (v14) {
        uint64_t v24 = (uint64_t)sub_10000C800(a1, v15 + 2, a3, (uint64_t *)v29);
      }
      else {
        uint64_t v24 = (uint64_t)sub_10000C69C(a1, (unsigned __int8 *)v15 + 2, (unsigned __int8 *)a3, (uint64_t)v29, v6);
      }
      goto LABEL_60;
    }
  }

  else
  {
    LOBYTE(v21) = *v21;
  }

  HIBYTE(v3sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 1;
  LOWORD(v29[0]) = v21;
LABEL_61:
  *(_OWORD *)unint64_t v27 = v31;
  uint64_t v28 = v32;
  uint64_t v32 = 0LL;
  __int128 v31 = 0uLL;
  *(_OWORD *)std::string __p = *(_OWORD *)v29;
  uint64_t v26 = v30;
  v29[0] = 0LL;
  v29[1] = 0LL;
  uint64_t v30 = 0LL;
  sub_10000CAEC(v6, (char *)v27, (char *)__p);
  if (SHIBYTE(v26) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v28) < 0) {
    operator delete(v27[0]);
  }
  if (SHIBYTE(v30) < 0) {
    operator delete(v29[0]);
  }
  char v13 = 1;
LABEL_44:
  if (SHIBYTE(v32) < 0) {
    operator delete((void *)v31);
  }
  if ((v13 & 1) != 0) {
    return v4;
  }
  return (char *)v6;
}

void sub_10000C2BC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *__p, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000C31C(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_33;
  }
  for (uint64_t i = 0LL; a2[i] != 61 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_33;
    }
  }

  if (&a2[i] == a3) {
LABEL_33:
  }
    sub_10000BF00();
  sub_10000D164(a1, a2, &a2[i], &v17);
  if (((char)v17.__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    std::string::size_type size = v17.__r_.__value_.__s.__size_;
    if (v17.__r_.__value_.__s.__size_)
    {
      unsigned int v9 = &v17;
      goto LABEL_14;
    }

LABEL_34:
    sub_10000D0D8();
  }

  std::string::size_type size = v17.__r_.__value_.__l.__size_;
  if (!v17.__r_.__value_.__l.__size_) {
    goto LABEL_34;
  }
  unsigned int v9 = (std::string *)v17.__r_.__value_.__r.__words[0];
LABEL_14:
  sub_10000D2F8(a1, (char *)v9, (char *)v9 + size, (uint64_t)__p);
  unint64_t v10 = v16;
  if ((v16 & 0x80u) != 0) {
    unint64_t v10 = (unint64_t)__p[1];
  }
  if (v10)
  {
    sub_10000D124(a4, (__int128 *)__p);
  }

  else
  {
    std::string::size_type v11 = v17.__r_.__value_.__s.__size_;
    if ((v17.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type v11 = v17.__r_.__value_.__l.__size_;
    }
    if (v11 == 2)
    {
      char v13 = &v17;
      if ((v17.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        char v13 = (std::string *)v17.__r_.__value_.__r.__words[0];
      }
      sub_10000CEB0( (uint64_t)a4,  v13->__r_.__value_.__s.__data_[0],  v13->__r_.__value_.__s.__data_[1]);
    }

    else
    {
      if (v11 != 1) {
        sub_10000D0D8();
      }
      uint64_t v12 = &v17;
      if ((v17.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        uint64_t v12 = (std::string *)v17.__r_.__value_.__r.__words[0];
      }
      sub_10000AC54((uint64_t)a4, v12->__r_.__value_.__s.__data_[0]);
    }
  }

  return (uint64_t)&a2[i + 2];
}

void sub_10000C4C0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000C4F8(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_11;
  }
  for (uint64_t i = 0LL; a2[i] != 58 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_11;
    }
  }

  if (&a2[i] == a3) {
LABEL_11:
  }
    sub_10000BF00();
  int v7 = sub_10000D7C4(a1, a2, &a2[i], *(_BYTE *)(a1 + 24) & 1);
  if (!v7) {
    sub_10000D778();
  }
  *(_DWORD *)(a4 + 160) |= v7;
  return (uint64_t)&a2[i + 2];
}

uint64_t sub_10000C5B0(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  for (uint64_t i = 0LL; a2[i] != 46 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_15;
    }
  }

  if (&a2[i] == a3) {
LABEL_15:
  }
    sub_10000BF00();
  sub_10000D164(a1, a2, &a2[i], &v10);
  *(_OWORD *)a4 = *(_OWORD *)&v10.__r_.__value_.__l.__data_;
  std::string::size_type cap = v10.__r_.__value_.__l.__cap_;
  *(void *)(a4 + 16) = v10.__r_.__value_.__l.__cap_;
  std::string::size_type v8 = HIBYTE(cap);
  if ((v8 & 0x80u) != 0LL) {
    std::string::size_type v8 = *(void *)(a4 + 8);
  }
  if (v8 - 1 >= 2) {
    sub_10000D0D8();
  }
  return (uint64_t)&a2[i + 2];
}

unsigned __int8 *sub_10000C69C(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  if (a2 == a3) {
    sub_100009C8C();
  }
  int v6 = (char)*a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119) {
          return sub_100009E60(a1, a2, a3, (uint64_t *)a4);
        }
        *(_DWORD *)(a5 + 160) |= 0x500u;
        sub_10000AC54(a5, 95LL);
        return a2 + 1;
      }

      int v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }

    else
    {
      if (v6 == 98)
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(void *)(a4 + std::ostream::~ostream(v1, v2 + 8) = 1LL;
          a4 = *(void *)a4;
        }

        else
        {
          *(_BYTE *)(a4 + 23) = 1;
        }

        *(_WORD *)a4 = 8;
        return a2 + 1;
      }

      if (v6 != 100) {
        return sub_100009E60(a1, a2, a3, (uint64_t *)a4);
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }

    *(_DWORD *)(a5 + 16sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v8;
    return a2 + 1;
  }

  if (v6 <= 82)
  {
    if (!*a2)
    {
      if (*(char *)(a4 + 23) < 0)
      {
        *(void *)(a4 + std::ostream::~ostream(v1, v2 + 8) = 1LL;
        a4 = *(void *)a4;
      }

      else
      {
        *(_BYTE *)(a4 + 23) = 1;
      }

      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 1) = 0;
      return a2 + 1;
    }

    if (v6 == 68)
    {
      int v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_22:
      *(_DWORD *)(a5 + 164) = v7;
      return a2 + 1;
    }

    return sub_100009E60(a1, a2, a3, (uint64_t *)a4);
  }

  if (v6 == 83)
  {
    int v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_22;
  }

  if (v6 != 87) {
    return sub_100009E60(a1, a2, a3, (uint64_t *)a4);
  }
  *(_DWORD *)(a5 + 164) |= 0x500u;
  sub_10000D87C(a5, 95LL);
  return a2 + 1;
}

char *sub_10000C800(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a2 == a3) {
LABEL_80:
  }
    sub_100009C8C();
  int v5 = *a2;
  char v6 = *a2;
  if (v5 > 97)
  {
    switch(*a2)
    {
      case 'n':
        if (!a4)
        {
          uint64_t v7 = 10LL;
          break;
        }

        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1LL;
          a4 = (uint64_t *)*a4;
        }

        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }

        __int16 v13 = 10;
        goto LABEL_77;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_25;
      case 'r':
        if (!a4)
        {
          uint64_t v7 = 13LL;
          break;
        }

        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1LL;
          a4 = (uint64_t *)*a4;
        }

        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }

        __int16 v13 = 13;
        goto LABEL_77;
      case 't':
        if (!a4)
        {
          uint64_t v7 = 9LL;
          break;
        }

        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1LL;
          a4 = (uint64_t *)*a4;
        }

        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }

        __int16 v13 = 9;
        goto LABEL_77;
      case 'v':
        if (!a4)
        {
          uint64_t v7 = 11LL;
          break;
        }

        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1LL;
          a4 = (uint64_t *)*a4;
        }

        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }

        __int16 v13 = 11;
        goto LABEL_77;
      default:
        if (v5 == 98)
        {
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1LL;
              a4 = (uint64_t *)*a4;
            }

            else
            {
              *((_BYTE *)a4 + 23) = 1;
            }

            __int16 v13 = 8;
            goto LABEL_77;
          }

          uint64_t v7 = 8LL;
        }

        else
        {
          if (v5 != 102) {
            goto LABEL_25;
          }
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1LL;
              a4 = (uint64_t *)*a4;
            }

            else
            {
              *((_BYTE *)a4 + 23) = 1;
            }

            __int16 v13 = 12;
            goto LABEL_77;
          }

          uint64_t v7 = 12LL;
        }

        break;
    }

LABEL_62:
    sub_10000A234(a1, v7);
    return a2 + 1;
  }

  if (v5 > 91)
  {
    if (v5 == 92)
    {
LABEL_16:
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1LL;
          a4 = (uint64_t *)*a4;
        }

        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }

        *(_BYTE *)a4 = v6;
        *((_BYTE *)a4 + 1) = 0;
        return a2 + 1;
      }

      uint64_t v7 = v6;
      goto LABEL_62;
    }

    if (v5 != 97) {
      goto LABEL_25;
    }
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1LL;
        a4 = (uint64_t *)*a4;
      }

      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }

      __int16 v13 = 7;
LABEL_77:
      *(_WORD *)a4 = v13;
      return a2 + 1;
    }

    uint64_t v7 = 7LL;
    goto LABEL_62;
  }

  if (v5 == 34 || v5 == 47) {
    goto LABEL_16;
  }
LABEL_25:
  if ((v6 & 0xF8) != 0x30) {
    goto LABEL_80;
  }
  char v8 = v5 - 48;
  unsigned int v9 = a2 + 1;
  if (a2 + 1 != a3)
  {
    if ((*v9 & 0xF8) != 0x30) {
      goto LABEL_49;
    }
    char v8 = *v9 + 8 * v8 - 48;
    if (a2 + 2 != a3)
    {
      char v10 = a2[2];
      int v11 = v10 & 0xF8;
      char v12 = v10 + 8 * v8 - 48;
      if (v11 == 48) {
        unsigned int v9 = a2 + 3;
      }
      else {
        unsigned int v9 = a2 + 2;
      }
      if (v11 == 48) {
        char v8 = v12;
      }
      goto LABEL_49;
    }
  }

  unsigned int v9 = a3;
LABEL_49:
  if (a4)
  {
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1LL;
      a4 = (uint64_t *)*a4;
    }

    else
    {
      *((_BYTE *)a4 + 23) = 1;
    }

    *(_BYTE *)a4 = v8;
    *((_BYTE *)a4 + 1) = 0;
  }

  else
  {
    sub_10000A234(a1, v8);
  }

  return v9;
}

void sub_10000CAEC(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a3;
  unint64_t v4 = a2;
  if (*(_BYTE *)(a1 + 170))
  {
    if (*(_BYTE *)(a1 + 169))
    {
      for (unint64_t i = 0LL; ; ++i)
      {
        unint64_t v7 = v4[23] < 0 ? *((void *)v4 + 1) : v4[23];
        if (i >= v7) {
          break;
        }
        char v8 = v4;
        if (v4[23] < 0) {
          char v8 = *(char **)v4;
        }
        char v9 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  v8[i]);
        char v10 = v4;
        if (v4[23] < 0) {
          char v10 = *(char **)v4;
        }
        v10[i] = v9;
      }

      for (unint64_t j = 0LL; ; ++j)
      {
        unint64_t v12 = v3[23] < 0 ? *((void *)v3 + 1) : v3[23];
        if (j >= v12) {
          break;
        }
        __int16 v13 = v3;
        if (v3[23] < 0) {
          __int16 v13 = *(char **)v3;
        }
        char v14 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  v13[j]);
        unint64_t v15 = v3;
        if (v3[23] < 0) {
          unint64_t v15 = *(char **)v3;
        }
        v15[j] = v14;
      }
    }

    else
    {
      for (unint64_t k = 0LL; ; ++k)
      {
        unint64_t v18 = a2[23] < 0 ? *((void *)a2 + 1) : a2[23];
        if (k >= v18) {
          break;
        }
        uint64_t v19 = a2;
        if (a2[23] < 0) {
          uint64_t v19 = *(char **)a2;
        }
        int v20 = a2;
        if (a2[23] < 0) {
          int v20 = *(char **)a2;
        }
        v20[k] = v19[k];
      }

      for (unint64_t m = 0LL; ; ++m)
      {
        unint64_t v22 = a3[23] < 0 ? *((void *)a3 + 1) : a3[23];
        if (m >= v22) {
          break;
        }
        int v23 = a3;
        if (a3[23] < 0) {
          int v23 = *(char **)a3;
        }
        uint64_t v24 = a3;
        if (a3[23] < 0) {
          uint64_t v24 = *(char **)a3;
        }
        v24[m] = v23[m];
      }
    }

    if (v4[23] < 0)
    {
      uint64_t v26 = v4;
      unint64_t v4 = *(char **)v4;
      uint64_t v25 = *((void *)v26 + 1);
    }

    else
    {
      uint64_t v25 = v4[23];
    }

    sub_10000DC5C(a1 + 16, v4, &v4[v25]);
    if (v3[23] < 0)
    {
      uint64_t v28 = v3;
      uint64_t v3 = *(char **)v3;
      uint64_t v27 = *((void *)v28 + 1);
    }

    else
    {
      uint64_t v27 = v3[23];
    }

    sub_10000DC5C(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)std::string::size_type v40 = v38;
    uint64_t v41 = v39;
    *(_OWORD *)std::string __p = *(_OWORD *)v36;
    uint64_t v43 = v37;
    sub_10000DAA8((char **)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }

  else
  {
    if (a2[23] < 0) {
      uint64_t v16 = *((void *)a2 + 1);
    }
    else {
      uint64_t v16 = a2[23];
    }
    if (*(_BYTE *)(a1 + 169))
    {
      uint64_t v30 = a2;
      if (a2[23] < 0) {
        uint64_t v30 = *(char **)a2;
      }
      char v31 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  *v30);
      uint64_t v32 = v4;
      if (v4[23] < 0) {
        uint64_t v32 = *(_BYTE **)v4;
      }
      *uint64_t v32 = v31;
      char v33 = v3;
      if (v3[23] < 0) {
        char v33 = *(char **)v3;
      }
      char v34 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  *v33);
      uint64_t v35 = v3;
      if (v3[23] < 0) {
        uint64_t v35 = *(_BYTE **)v3;
      }
      *uint64_t v35 = v34;
    }

    *(_OWORD *)std::string::size_type v40 = *(_OWORD *)v4;
    uint64_t v41 = *((void *)v4 + 2);
    *((void *)v4 + 1) = 0LL;
    *((void *)v4 + 2) = 0LL;
    *(void *)unint64_t v4 = 0LL;
    *(_OWORD *)std::string __p = *(_OWORD *)v3;
    uint64_t v43 = *((void *)v3 + 2);
    *(void *)uint64_t v3 = 0LL;
    *((void *)v3 + 1) = 0LL;
    *((void *)v3 + 2) = 0LL;
    sub_10000DAA8((char **)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }

void sub_10000CE64( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, char a21)
{
}

void sub_10000CEB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(_BYTE *)(a1 + 169))
  {
    uint64_t v18 = a1 + 128;
    unint64_t v19 = *(void *)(a1 + 128);
    char v10 = (char **)(a1 + 112);
    __int16 v8 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    char v9 = *(_WORD **)(a1 + 120);
    if (*(_BYTE *)(a1 + 170))
    {
      uint64_t v20 = (char *)v9 - *v10;
      if (v20 > -3)
      {
        uint64_t v21 = v20 >> 1;
        unint64_t v22 = v19 - (void)*v10;
        if (v22 <= (v20 >> 1) + 1) {
          unint64_t v23 = v21 + 1;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v22 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v24 = v23;
        }
        if (v24) {
          uint64_t v25 = (char *)sub_10000DDD4(v18, v24);
        }
        else {
          uint64_t v25 = 0LL;
        }
        uint64_t v27 = &v25[2 * v21];
        uint64_t v28 = &v25[2 * v24];
        *(_WORD *)uint64_t v27 = v8;
        uint64_t v26 = v27 + 2;
        __int128 v38 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v38) {
          goto LABEL_46;
        }
        do
        {
          __int16 v39 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v39;
          v27 -= 2;
        }

        while (v29 != v38);
        goto LABEL_45;
      }
    }

    else
    {
      uint64_t v32 = (char *)v9 - *v10;
      if (v32 > -3)
      {
        uint64_t v33 = v32 >> 1;
        unint64_t v34 = v19 - (void)*v10;
        if (v34 <= (v32 >> 1) + 1) {
          unint64_t v35 = v33 + 1;
        }
        else {
          unint64_t v35 = v34;
        }
        if (v34 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v36 = v35;
        }
        if (v36) {
          uint64_t v37 = (char *)sub_10000DDD4(v18, v36);
        }
        else {
          uint64_t v37 = 0LL;
        }
        uint64_t v27 = &v37[2 * v33];
        uint64_t v28 = &v37[2 * v36];
        *(_WORD *)uint64_t v27 = v8;
        uint64_t v26 = v27 + 2;
        std::string::size_type v40 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v40) {
          goto LABEL_46;
        }
        do
        {
          __int16 v41 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v41;
          v27 -= 2;
        }

        while (v29 != v40);
        goto LABEL_45;
      }
    }

LABEL_49:
    sub_100006DF8();
  }

  unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40LL))(*(void *)(a1 + 24), a2);
  __int16 v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40LL))(*(void *)(a1 + 24), a3);
  unint64_t v7 = *(void *)(a1 + 128);
  __int16 v8 = v5 | (unsigned __int16)(v6 << 8);
  char v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    _WORD *v9 = v8;
    uint64_t v26 = v9 + 1;
    goto LABEL_48;
  }

  char v10 = (char **)(a1 + 112);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v12 = (uint64_t)v9 - v11;
  uint64_t v13 = v12 >> 1;
  unint64_t v14 = v7 - v11;
  if (v14 <= (v12 >> 1) + 1) {
    unint64_t v15 = v13 + 1;
  }
  else {
    unint64_t v15 = v14;
  }
  if (v14 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v16 = v15;
  }
  if (v16) {
    std::string v17 = (char *)sub_10000DDD4(a1 + 128, v16);
  }
  else {
    std::string v17 = 0LL;
  }
  uint64_t v27 = &v17[2 * v13];
  uint64_t v28 = &v17[2 * v16];
  *(_WORD *)uint64_t v27 = v8;
  uint64_t v26 = v27 + 2;
  uint64_t v30 = *(char **)(a1 + 112);
  uint64_t v29 = *(char **)(a1 + 120);
  if (v29 == v30) {
    goto LABEL_46;
  }
  do
  {
    __int16 v31 = *((_WORD *)v29 - 1);
    v29 -= 2;
    *((_WORD *)v27 - 1) = v31;
    v27 -= 2;
  }

  while (v29 != v30);
LABEL_45:
  uint64_t v29 = *v10;
LABEL_46:
  *(void *)(a1 + 112) = v27;
  *(void *)(a1 + 12sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v26;
  *(void *)(a1 + 12std::ostream::~ostream(v1, v2 + 8) = v28;
  if (v29) {
    operator delete(v29);
  }
LABEL_48:
  *(void *)(a1 + 12sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v26;
}

void sub_10000D0D8()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_collate);
}

void sub_10000D110(_Unwind_Exception *a1)
{
}

uint64_t sub_10000D124(uint64_t *a1, __int128 *a2)
{
  uint64_t v3 = a1 + 17;
  unint64_t v4 = a1[18];
  if (v4 >= a1[19])
  {
    uint64_t result = sub_10000D448(v3, a2);
  }

  else
  {
    sub_10000D3EC(v3, a2);
    uint64_t result = v4 + 24;
  }

  a1[18] = result;
  return result;
}

void sub_10000D164(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, std::string *a4@<X8>)
{
  a4->__r_.__value_.__r.__words[0] = 0LL;
  a4->__r_.__value_.__l.__size_ = 0LL;
  a4->__r_.__value_.__l.__cap_ = 0LL;
  if ((char)__s.__r_.__value_.__s.__size_ < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }

  else
  {
    if (!__s.__r_.__value_.__s.__size_) {
      return;
    }
    p_s = &__s;
  }

  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)&a4->__r_.__value_.__l.__data_ = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  std::string::size_type cap = v13.__r_.__value_.__l.__cap_;
  a4->__r_.__value_.__l.__cap_ = v13.__r_.__value_.__l.__cap_;
  std::string::size_type size = HIBYTE(cap);
  if ((size & 0x80u) != 0LL) {
    std::string::size_type size = a4->__r_.__value_.__l.__size_;
  }
  if (size) {
    goto LABEL_9;
  }
  if ((char)__s.__r_.__value_.__s.__size_ < 0)
  {
    std::string::size_type v9 = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
    char v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }

  else
  {
    std::string::size_type v9 = __s.__r_.__value_.__s.__size_;
    if (__s.__r_.__value_.__s.__size_ >= 3u) {
      return;
    }
    char v10 = &__s;
  }

  (*(void (**)(std::string *__return_ptr, void, std::string *, char *))(**(void **)(a1 + 16) + 32LL))( &v13,  *(void *)(a1 + 16),  v10,  (char *)v10 + v9);
  *a4 = v13;
  if (((char)a4->__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    int v11 = a4->__r_.__value_.__s.__size_;
    if (v11 != 12 && v11 != 1)
    {
      a4->__r_.__value_.__s.__data_[0] = 0;
      a4->__r_.__value_.__s.__size_ = 0;
      goto LABEL_9;
    }

    goto LABEL_25;
  }

  std::string::size_type v12 = a4->__r_.__value_.__l.__size_;
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=(a4, &__s);
    goto LABEL_9;
  }

  *a4->__r_.__value_.__l.__data_ = 0;
  a4->__r_.__value_.__l.__size_ = 0LL;
LABEL_9:
}

void sub_10000D2C4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000D2F8(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    unint64_t v7 = __p;
  }
  else {
    unint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32LL))( *(void *)(a1 + 16),  v7,  (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0LL) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        char v10 = (_BYTE *)a4;
      }
      else {
        char v10 = *(_BYTE **)a4;
      }
      v10[11] = v10[3];
    }

    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(void *)(a4 + std::ostream::~ostream(v1, v2 + 8) = 0LL;
    }

    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }

void sub_10000D3D0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_10000D3EC(void *result, __int128 *a2)
{
  uint64_t v2 = result;
  uint64_t v3 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    uint64_t result = sub_100006C08((_BYTE *)result[1], *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }

  v2[1] = v3 + 24;
  return result;
}

void sub_10000D440(_Unwind_Exception *a1)
{
  *(void *)(v1 + std::ostream::~ostream(v1, v2 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_10000D448(uint64_t *a1, __int128 *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_100006DF8();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555LL) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v18 = a1 + 2;
  if (v9) {
    char v10 = (char *)sub_100009014(v7, v9);
  }
  else {
    char v10 = 0LL;
  }
  int v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  uint64_t v16 = v11;
  uint64_t v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_100006C08(v11, *(void **)a2, *((void *)a2 + 1));
    int v11 = v16;
  }

  else
  {
    __int128 v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)int v11 = v12;
  }

  uint64_t v16 = v11 + 24;
  sub_10000D568(a1, v15);
  uint64_t v13 = a1[1];
  sub_10000D6F0((uint64_t)v15);
  return v13;
}

void sub_10000D554(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_10000D568(uint64_t *a1, void *a2)
{
  uint64_t result = sub_10000D5DC((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

uint64_t sub_10000D5DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v15 = a6;
  *((void *)&v15 + 1) = a7;
  __int128 v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      __int128 v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - std::ostream::~ostream(v1, v2 + 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24LL;
      *(void *)(a3 - 16) = 0LL;
      *(void *)(a3 - std::ostream::~ostream(v1, v2 + 8) = 0LL;
      *(void *)(a3 - 24) = 0LL;
      v7 -= 24LL;
      a3 -= 24LL;
    }

    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }

  char v13 = 1;
  sub_10000D678((uint64_t)v12);
  return a6;
}

uint64_t sub_10000D678(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_10000D6AC(a1);
  }
  return a1;
}

void sub_10000D6AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    v1 += 24LL;
  }

uint64_t sub_10000D6F0(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_10000D724(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }

      uint64_t v2 = v5;
    }

    while (v5 != a2);
  }

void sub_10000D778()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_ctype);
}

void sub_10000D7B0(_Unwind_Exception *a1)
{
}

uint64_t sub_10000D7C4(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    uint64_t v7 = __p;
  }
  else {
    uint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 8) + 48LL))( *(void *)(a1 + 8),  v7,  (char *)v7 + v6);
  if ((v12 & 0x80u) == 0) {
    uint64_t v8 = __p;
  }
  else {
    uint64_t v8 = (void **)__p[0];
  }
  uint64_t classname = std::__get_classname((const char *)v8, a4);
  return classname;
}

void sub_10000D860( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000D87C(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40LL))(*(void *)(a1 + 24), a2);
    uint64_t v5 = *(_BYTE **)(a1 + 72);
    unint64_t v4 = *(void *)(a1 + 80);
    if ((unint64_t)v5 >= v4)
    {
      unint64_t v6 = (unint64_t *)(a1 + 64);
      unint64_t v7 = *(void *)(a1 + 64);
      uint64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          unsigned __int8 v12 = operator new(v11);
        }
        else {
          unsigned __int8 v12 = 0LL;
        }
        uint64_t v20 = &v8[(void)v12];
        uint64_t v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          unint64_t v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }

          while (v5 != (_BYTE *)v7);
LABEL_45:
          uint64_t v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }

        goto LABEL_46;
      }

uint64_t sub_10000DAA8(char **a1, __int128 *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(result - 8);
  if (v7 >= v6)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (void)*a1) >> 4);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555LL) {
      sub_100006DF8();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (void)*a1) >> 4);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v14 = 0x555555555555555LL;
    }
    else {
      unint64_t v14 = v12;
    }
    uint64_t v29 = result;
    if (v14) {
      __int128 v15 = (char *)sub_10000DD44(result, v14);
    }
    else {
      __int128 v15 = 0LL;
    }
    unint64_t v16 = &v15[48 * v11];
    __int128 v17 = *a2;
    *((void *)v16 + 2) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v16 = v17;
    *((void *)a2 + 1) = 0LL;
    *((void *)a2 + 2) = 0LL;
    *(void *)a2 = 0LL;
    __int128 v18 = *(__int128 *)((char *)a2 + 24);
    *((void *)v16 + 5) = *((void *)a2 + 5);
    *(_OWORD *)(v16 + 24) = v18;
    *((void *)a2 + 4) = 0LL;
    *((void *)a2 + 5) = 0LL;
    *((void *)a2 + 3) = 0LL;
    uint64_t v20 = *a1;
    unint64_t v19 = (unint64_t)a1[1];
    if ((char *)v19 == *a1)
    {
      int64x2_t v24 = vdupq_n_s64(v19);
      uint64_t v21 = &v15[48 * v11];
    }

    else
    {
      uint64_t v21 = &v15[48 * v11];
      do
      {
        __int128 v22 = *(_OWORD *)(v19 - 48);
        *((void *)v21 - 4) = *(void *)(v19 - 32);
        *((_OWORD *)v21 - 3) = v22;
        *(void *)(v19 - 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0LL;
        *(void *)(v19 - 32) = 0LL;
        *(void *)(v19 - 4std::ostream::~ostream(v1, v2 + 8) = 0LL;
        __int128 v23 = *(_OWORD *)(v19 - 24);
        *((void *)v21 - 1) = *(void *)(v19 - 8);
        *(_OWORD *)(v21 - 24) = v23;
        v21 -= 48;
        *(void *)(v19 - 16) = 0LL;
        *(void *)(v19 - std::ostream::~ostream(v1, v2 + 8) = 0LL;
        *(void *)(v19 - 24) = 0LL;
        v19 -= 48LL;
      }

      while ((char *)v19 != v20);
      int64x2_t v24 = *(int64x2_t *)a1;
    }

    unint64_t v10 = v16 + 48;
    *a1 = v21;
    a1[1] = v16 + 48;
    int64x2_t v27 = v24;
    uint64_t v25 = a1[2];
    a1[2] = &v15[48 * v14];
    size_t v28 = v25;
    uint64_t v26 = v24.i64[0];
    uint64_t result = sub_10000DD88((uint64_t)&v26);
  }

  else
  {
    __int128 v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    *((void *)a2 + 1) = 0LL;
    *((void *)a2 + 2) = 0LL;
    *(void *)a2 = 0LL;
    __int128 v9 = *(__int128 *)((char *)a2 + 24);
    *(void *)(v7 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = *((void *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((void *)a2 + 4) = 0LL;
    *((void *)a2 + 5) = 0LL;
    *((void *)a2 + 3) = 0LL;
    unint64_t v10 = (char *)(v7 + 48);
  }

  a1[1] = v10;
  return result;
}

void sub_10000DC5C(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unint64_t v5 = __p;
  }
  else {
    unint64_t v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32LL))( *(void *)(a1 + 16),  v5,  (char *)v5 + v4);
}

void sub_10000DCDC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000DCF8()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_range);
}

void sub_10000DD30(_Unwind_Exception *a1)
{
}

void *sub_10000DD44(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556LL) {
    sub_100006BE0();
  }
  return operator new(48 * a2);
}

uint64_t sub_10000DD88(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    sub_10000BA0C(i - 48);
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *sub_10000DDD4(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_100006BE0();
  }
  return operator new(2 * a2);
}

void *sub_10000DE04(void *a1)
{
  *a1 = &off_100014510;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_10000DE48(void *__p)
{
  *std::string __p = &off_100014510;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_10000DE8C(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24LL * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = *(void *)(result + 8);
  return result;
}

void *sub_10000DEBC(void *a1)
{
  *a1 = &off_100014510;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_10000DF00(void *__p)
{
  *std::string __p = &off_100014510;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_10000DF44(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24LL * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + std::ostream::~ostream(v1, v2 + 8) = *(void *)(a2 + 16);
  *(_BYTE *)(v2 + 16) = 1;
  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = *(void *)(result + 8);
  return result;
}

void *sub_10000DF7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, char a7)
{
  unint64_t v14 = operator new(0x10uLL);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(v15 + 8);
  *unint64_t v14 = &off_100014498;
  v14[1] = v16;
  *(void *)(v15 + std::ostream::~ostream(v1, v2 + 8) = 0LL;
  __int128 v17 = operator new(0x38uLL);
  LODWORD(v16) = *(_DWORD *)(a1 + 32);
  uint64_t v18 = *(void *)(a4 + 8);
  *__int128 v17 = &off_100014930;
  v17[1] = v18;
  v17[2] = v14;
  v17[3] = a2;
  v17[4] = a3;
  *((_DWORD *)v17 + 1sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v16;
  *((_DWORD *)v17 + 11) = a5;
  *((_DWORD *)v17 + 12) = a6;
  *((_BYTE *)v17 + 52) = a7;
  *(void *)(a4 + std::ostream::~ostream(v1, v2 + 8) = 0LL;
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &off_1000149C0;
  result[1] = v17;
  *(void *)(*(void *)(a1 + 56) + 8LL) = result;
  *(void *)(a1 + 56) = v17[2];
  *(void *)(a4 + std::ostream::~ostream(v1, v2 + 8) = v17;
  *(_DWORD *)(a1 + 32) = v16 + 1;
  return result;
}

void sub_10000E068(_Unwind_Exception *a1)
{
}

unsigned __int8 *sub_10000E0B0(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    if ((v4 & 0xF8) == 0x30 || (v4 & 0xFE) == 0x38)
    {
      int v5 = v4 - 48;
      *a4 = v5;
      if (++a2 == a3)
      {
        return a3;
      }

      else
      {
        while (1)
        {
          int v6 = *a2;
          if ((v6 & 0xF8) != 0x30 && (v6 & 0xFE) != 0x38) {
            break;
          }
          if (v5 >= 214748364) {
            sub_10000E14C();
          }
          int v5 = v6 + 10 * v5 - 48;
          *a4 = v5;
          if (++a2 == a3) {
            return a3;
          }
        }
      }
    }
  }

  return a2;
}

void sub_10000E14C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badbrace);
}

void sub_10000E184(_Unwind_Exception *a1)
{
}

void sub_10000E198()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brace);
}

void sub_10000E1D0(_Unwind_Exception *a1)
{
}

void *sub_10000E1E4(void *a1)
{
  *a1 = &off_100014990;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  *a1 = &off_100014510;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  return a1;
}

void sub_10000E24C(void *__p)
{
  *std::string __p = &off_100014990;
  uint64_t v2 = __p[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  *std::string __p = &off_100014510;
  uint64_t v3 = __p[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  operator delete(__p);
}

unsigned int *sub_10000E2B4(unsigned int *result, void *a2)
{
  uint64_t v2 = result[10];
  uint64_t v3 = a2[7];
  int v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    unint64_t v5 = *v4 + 1;
    *int v4 = v5;
    unint64_t v6 = *((void *)result + 3);
    unint64_t v7 = *((void *)result + 4);
    BOOL v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      uint64_t v10 = *(void *)(v3 + 16 * v2 + 8);
      BOOL v8 = v5 < v7 && v10 != a2[2];
    }

    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8) {
        goto LABEL_25;
      }
LABEL_22:
      a2[10] = *((void *)result + 1);
      return sub_10000E468(result, a2);
    }

    goto LABEL_23;
  }

  *int v4 = 0LL;
  if (*((void *)result + 4))
  {
    if (*((void *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }

unsigned int *sub_10000E368(unsigned int *result, int a2, void *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((void *)result + 2);
  }

  else
  {
    a3[10] = *((void *)result + 1);
    return sub_10000E468(result, a3);
  }

  return result;
}

void *sub_10000E398(void *a1)
{
  *a1 = &off_100014990;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  *a1 = &off_100014510;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  return a1;
}

void sub_10000E400(void *__p)
{
  *std::string __p = &off_100014990;
  uint64_t v2 = __p[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  *std::string __p = &off_100014510;
  uint64_t v3 = __p[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  operator delete(__p);
}

unsigned int *sub_10000E468(unsigned int *result, void *a2)
{
  unsigned int v2 = result[11];
  *(void *)(a2[7] + 16LL * result[10] + std::ostream::~ostream(v1, v2 + 8) = a2[2];
  unsigned int v3 = result[12];
  if (v2 != v3)
  {
    uint64_t v4 = v2 - 1;
    uint64_t v5 = a2[3];
    uint64_t v6 = v3 - 1 - v4;
    uint64_t v7 = a2[4] + 24LL * v4 + 8;
    do
    {
      *(void *)(v7 - std::ostream::~ostream(v1, v2 + 8) = v5;
      *(void *)uint64_t v7 = v5;
      *(_BYTE *)(v7 + std::ostream::~ostream(v1, v2 + 8) = 0;
      v7 += 24LL;
      --v6;
    }

    while (v6);
  }

  return result;
}

uint64_t sub_10000E4C4(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = *(void *)(result + 8);
  return result;
}

void *sub_10000E4D8(void *a1)
{
  *a1 = &off_100014990;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  *a1 = &off_100014510;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  return a1;
}

void sub_10000E540(void *__p)
{
  *std::string __p = &off_100014990;
  uint64_t v2 = __p[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  *std::string __p = &off_100014510;
  uint64_t v3 = __p[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  operator delete(__p);
}

void sub_10000E5A8(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t sub_10000E5B4(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8LL;
  if (a2) {
    uint64_t v3 = 16LL;
  }
  *(void *)(a3 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = *(void *)(result + v3);
  return result;
}

uint64_t sub_10000E5E0(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = *(void *)(result + 8);
  return result;
}

void sub_10000E5F4()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_empty);
}

void sub_10000E62C(_Unwind_Exception *a1)
{
}

unsigned __int8 *sub_10000E640(uint64_t a1, char *a2, char *a3)
{
  if (a2 == a3) {
    return (unsigned __int8 *)a2;
  }
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = *(_DWORD *)(a1 + 28);
  BOOL v8 = (unsigned __int8 *)sub_10000E6C8(a1, a2, a3);
  else {
    return sub_10000E7D4(a1, v8, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
  }
}

char *sub_10000E6C8(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = sub_10000E974(a1, a2, a3);
  int v7 = v6;
  if (v6 == a2 && v6 != a3)
  {
    if (a2 + 1 == a3 || *a2 != 92)
    {
      return a2;
    }

    else
    {
      int v8 = a2[1];
      if (v8 == 40)
      {
        uint64_t v9 = (uint64_t)(a2 + 2);
        sub_100009A88((void *)a1);
        int v10 = *(_DWORD *)(a1 + 28);
        do
        {
          unint64_t v11 = (char *)v9;
          uint64_t v9 = sub_10000E640(a1, v9, a3);
        }

        while ((char *)v9 != v11);
        if (v11 == a3 || v11 + 1 == a3 || *v11 != 92 || v11[1] != 41) {
          sub_100008344();
        }
        int v7 = v11 + 2;
        sub_100009AEC((void *)a1, v10);
      }

      else
      {
        int v13 = sub_10000EBBC(a1, v8);
        uint64_t v14 = 2LL;
        if (!v13) {
          uint64_t v14 = 0LL;
        }
        return &a2[v14];
      }
    }
  }

  return v7;
}

unsigned __int8 *sub_10000E7D4( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6 = a2;
  if (a2 != a3)
  {
    int v11 = *a2;
    if (v11 == 42)
    {
      sub_10000DF7C(a1, 0LL, -1LL, a4, a5, a6, 1);
      return ++v6;
    }

    if (a2 + 1 != a3 && v11 == 92 && a2[1] == 123)
    {
      int v13 = a2 + 2;
      int v25 = 0;
      uint64_t v14 = sub_10000E0B0(a1, a2 + 2, a3, &v25);
      if (v14 == v13) {
        goto LABEL_16;
      }
      if (v14 != a3)
      {
        uint64_t v15 = v14 + 1;
        int v16 = *v14;
        if (v16 == 44)
        {
          int v24 = -1;
          __int128 v17 = sub_10000E0B0(a1, v15, a3, &v24);
          if (v17 != a3 && v17 + 1 != a3 && *v17 == 92 && v17[1] == 125)
          {
            uint64_t v19 = v24;
            uint64_t v18 = v25;
            if (v24 == -1)
            {
              uint64_t v19 = -1LL;
            }

            else if (v24 < v25)
            {
LABEL_16:
              sub_10000E14C();
            }

            uint64_t v6 = &v17[2 * (v17[1] == 125)];
            int v20 = a5;
            int v21 = a6;
            uint64_t v22 = a1;
LABEL_23:
            sub_10000DF7C(v22, v18, v19, a4, v20, v21, 1);
            return v6;
          }
        }

        else if (v15 != a3 && v16 == 92 && *v15 == 125)
        {
          uint64_t v6 = v14 + 2;
          uint64_t v18 = v25;
          int v20 = a5;
          int v21 = a6;
          uint64_t v22 = a1;
          uint64_t v19 = v25;
          goto LABEL_23;
        }
      }

      sub_10000E198();
    }
  }

  return v6;
}

char *sub_10000E974(uint64_t a1, char *a2, char *a3)
{
  if (a2 == a3)
  {
    uint64_t result = sub_10000EA7C(a1, a2, a3);
    if (result != a2) {
      return result;
    }
    return sub_100009978(a1, a2, a3);
  }

  int v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1LL << (v6 - 46)) & 0x600000000001LL) == 0))
  {
    sub_10000A234(a1, (char)v6);
    return a2 + 1;
  }

  uint64_t result = sub_10000EA7C(a1, a2, a3);
  if (result != a2) {
    return result;
  }
  if (*a2 != 46) {
    return sub_100009978(a1, a2, a3);
  }
  uint64_t v9 = operator new(0x10uLL);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(v10 + 8);
  void *v9 = &off_100014A98;
  v9[1] = v11;
  *(void *)(v10 + std::ostream::~ostream(v1, v2 + 8) = v9;
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return a2 + 1;
}

_BYTE *sub_10000EA7C(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3 && a2 + 1 != a3 && *a2 == 92)
  {
    int v4 = (char)a2[1];
    if ((v4 - 36) <= 0x3A && ((1LL << (a2[1] - 36)) & 0x580000000000441LL) != 0)
    {
      sub_10000A234(a1, (char)v4);
      v3 += 2;
    }
  }

  return v3;
}

void *sub_10000EAF4(void *a1)
{
  *a1 = &off_100014510;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_10000EB38(void *__p)
{
  *std::string __p = &off_100014510;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_10000EB7C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(_BYTE **)(a2 + 16);
  if (v2 == *(_BYTE **)(a2 + 24) || !*v2)
  {
    uint64_t v3 = 0LL;
    *(_DWORD *)a2 = -993;
  }

  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }

  *(void *)(a2 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v3;
  return result;
}

uint64_t sub_10000EBBC(uint64_t a1, unsigned __int8 a2)
{
  return 1LL;
}

unsigned __int8 *sub_10000EC18(uint64_t a1, char *a2, char *a3)
{
  int v6 = sub_10000EC74(a1, a2, a3);
  do
  {
    int v7 = v6;
    int v6 = sub_10000EC74(a1, (char *)v6, a3);
  }

  while (v6 != v7);
  return v7;
}

unsigned __int8 *sub_10000EC74(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = *(_DWORD *)(a1 + 28);
  int v8 = sub_10000EE04(a1, a2, a3);
  uint64_t v9 = (unsigned __int8 *)v8;
  if (v8 != a2 || v8 == a3) {
    goto LABEL_12;
  }
  int v10 = *a2;
  switch(v10)
  {
    case '$':
      uint64_t v11 = operator new(0x18uLL);
      BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v13 = *(void *)(a1 + 56);
      goto LABEL_8;
    case '(':
      sub_100009A88((void *)a1);
      int v16 = *(_DWORD *)(a1 + 28);
      ++*(_DWORD *)(a1 + 36);
      __int128 v17 = (char *)sub_1000073D8(a1, a2 + 1, a3);
      if (v17 == a3 || (uint64_t v18 = v17, *v17 != 41)) {
        sub_100008344();
      }
      sub_100009AEC((void *)a1, v16);
      --*(_DWORD *)(a1 + 36);
      uint64_t v9 = (unsigned __int8 *)(v18 + 1);
LABEL_12:
      return (unsigned __int8 *)a2;
    case '^':
      uint64_t v11 = operator new(0x18uLL);
      BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v13 = *(void *)(a1 + 56);
LABEL_8:
      uint64_t v15 = *(void *)(v13 + 8);
      void *v11 = v14 + 2;
      v11[1] = v15;
      *((_BYTE *)v11 + 16) = v12;
      *(void *)(v13 + std::ostream::~ostream(v1, v2 + 8) = v11;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
      uint64_t v9 = (unsigned __int8 *)(a2 + 1);
      return sub_100007F4C(a1, v9, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
  }

  return (unsigned __int8 *)a2;
}

char *sub_10000EE04(uint64_t a1, char *a2, char *a3)
{
  uint64_t result = sub_10000EEBC(a1, a2, a3);
  if (result == a2)
  {
    uint64_t result = sub_10000EF44(a1, a2, a3);
    if (result == a2)
    {
      if (a2 == a3 || *a2 != 46)
      {
        return sub_100009978(a1, a2, a3);
      }

      else
      {
        int v7 = operator new(0x10uLL);
        uint64_t v8 = *(void *)(a1 + 56);
        uint64_t v9 = *(void *)(v8 + 8);
        *int v7 = &off_100014A98;
        v7[1] = v9;
        *(void *)(v8 + std::ostream::~ostream(v1, v2 + 8) = v7;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
        return a2 + 1;
      }
    }
  }

  return result;
}

char *sub_10000EEBC(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    int v4 = *a2;
    uint64_t v5 = (v4 - 36);
    if (v5 == 5)
    {
      if (*(_DWORD *)(a1 + 36)) {
        return v3;
      }
    }

    else
    {
LABEL_8:
    }

    sub_10000A234(a1, *a2);
    ++v3;
  }

  return v3;
}

char *sub_10000EF44(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v4 = a2 + 1;
  if (v3 + 1 == a3 || *v3 != 92) {
    return v3;
  }
  int v5 = *v4;
  signed __int8 v6 = *v4;
  BOOL v7 = (v5 - 36) > 0x3A || ((1LL << (*v4 - 36)) & 0x5800000080004F1LL) == 0;
  if (!v7 || (v5 - 123) < 3)
  {
    sub_10000A234(a1, v6);
    v3 += 2;
    return v3;
  }

  if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0x40)
  {
    int v9 = sub_10000EBBC(a1, v6);
    uint64_t v10 = 2LL;
    if (!v9) {
      uint64_t v10 = 0LL;
    }
    v3 += v10;
    return v3;
  }

  return sub_10000C800(a1, v4, a3, 0LL);
}

uint64_t sub_10000F008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __int16 v5 = a5;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  char v15 = 0;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  char v18 = 0;
  char v19 = 0;
  uint64_t v20 = 0LL;
  *(_OWORD *)std::string __p = 0u;
  memset(v12, 0, sizeof(v12));
  int v9 = sub_10000F0FC(a4, a1, a2, (uint64_t)__p, a5 | 0x1040u);
  sub_10000F2D4(a3, a1, a2, (uint64_t *)__p, (v5 & 0x800) != 0);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if (!v9) {
    return 0LL;
  }
  if (!*(_BYTE *)(a3 + 88)) {
    return 1LL;
  }
  uint64_t result = 0LL;
  *(void *)(a3 + std::ostream::~ostream(v1, v2 + 8) = *(void *)a3;
  return result;
}

void sub_10000F0E0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000F0FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if ((a5 & 0x80) != 0) {
    int v9 = a5 & 0xFFA;
  }
  else {
    int v9 = a5;
  }
  sub_1000089F8(a4, *(_DWORD *)(a1 + 28) + 1, a2, a3, (unsigned __int16)(v9 & 0x800) >> 11);
  if (sub_10000F460(a1, a2, a3, (uint64_t *)a4, v9, (v9 & 0x800) == 0))
  {
    if (*(void *)(a4 + 8) == *(void *)a4) {
      uint64_t v10 = (uint64_t *)(a4 + 24);
    }
    else {
      uint64_t v10 = *(uint64_t **)a4;
    }
LABEL_8:
    uint64_t v11 = *v10;
    *(void *)(a4 + 56) = *v10;
    *(_BYTE *)(a4 + 64) = *(void *)(a4 + 48) != v11;
    uint64_t v12 = v10[1];
    *(void *)(a4 + 72) = v12;
    *(_BYTE *)(a4 + 8std::ostream::~ostream(v1, v2 + 8) = v12 != *(void *)(a4 + 80);
    return 1LL;
  }

  if (a2 != a3 && (v9 & 0x40) == 0)
  {
    int v14 = v9 | 0x80;
    uint64_t v15 = a2 + 1;
    if (v15 != a3)
    {
      while (1)
      {
        sub_100008E50( (char **)a4,  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3),  (__int128 *)(a4 + 24));
        int v16 = sub_10000F460(a1, v15, a3, (uint64_t *)a4, v14, 0);
        uint64_t v18 = *(void *)a4;
        uint64_t v17 = *(void *)(a4 + 8);
        if (v16) {
          break;
        }
        sub_100008E50((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 3), (__int128 *)(a4 + 24));
        if (++v15 == a3) {
          goto LABEL_14;
        }
      }

      if (v17 == v18) {
        uint64_t v10 = (uint64_t *)(a4 + 24);
      }
      else {
        uint64_t v10 = *(uint64_t **)a4;
      }
      goto LABEL_8;
    }

LABEL_14:
    sub_100008E50( (char **)a4,  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3),  (__int128 *)(a4 + 24));
    if (sub_10000F460(a1, a3, a3, (uint64_t *)a4, v14, 0))
    {
      if (*(void *)(a4 + 8) == *(void *)a4) {
        uint64_t v10 = (uint64_t *)(a4 + 24);
      }
      else {
        uint64_t v10 = *(uint64_t **)a4;
      }
      goto LABEL_8;
    }
  }

  uint64_t result = 0LL;
  *(void *)(a4 + std::ostream::~ostream(v1, v2 + 8) = *(void *)a4;
  return result;
}

void sub_10000F2D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  uint64_t v10 = a4[6];
  sub_100011110(a1, 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3));
  uint64_t v11 = *(void *)a1;
  if (*(void *)(a1 + 8) != *(void *)a1)
  {
    uint64_t v12 = 0LL;
    unint64_t v13 = 0LL;
    uint64_t v15 = *a4;
    uint64_t v14 = a4[1];
    do
    {
      unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3);
      uint64_t v17 = (void *)(v15 + v12);
      if (v16 <= v13) {
        uint64_t v18 = a4 + 3;
      }
      else {
        uint64_t v18 = v17;
      }
      *(void *)(v11 + v12) = a2 + *v18 - v10;
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v13) {
        char v19 = a4 + 3;
      }
      else {
        char v19 = (uint64_t *)(*a4 + v12);
      }
      *(void *)(*(void *)a1 + v12 + std::ostream::~ostream(v1, v2 + 8) = a2 + v19[1] - v10;
      uint64_t v15 = *a4;
      uint64_t v14 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v14 - *a4) >> 3) <= v13) {
        uint64_t v20 = a4 + 3;
      }
      else {
        uint64_t v20 = (uint64_t *)(*a4 + v12);
      }
      char v21 = *((_BYTE *)v20 + 16);
      uint64_t v11 = *(void *)a1;
      uint64_t v22 = *(void *)(a1 + 8);
      *(_BYTE *)(*(void *)a1 + v12 + 16) = v21;
      ++v13;
      v12 += 24LL;
    }

    while (v13 < 0xAAAAAAAAAAAAAAABLL * ((v22 - v11) >> 3));
  }

  *(void *)(a1 + 24) = a3;
  *(void *)(a1 + 32) = a3;
  *(_BYTE *)(a1 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0;
  uint64_t v23 = a2 + a4[6] - v10;
  *(void *)(a1 + 4std::ostream::~ostream(v1, v2 + 8) = v23;
  *(void *)(a1 + 56) = a2 + a4[7] - v10;
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a4 + 64);
  *(void *)(a1 + 72) = a2 + a4[9] - v10;
  *(void *)(a1 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = a2 + a4[10] - v10;
  *(_BYTE *)(a1 + 8std::ostream::~ostream(v1, v2 + 8) = *((_BYTE *)a4 + 88);
  if ((a5 & 1) == 0) {
    *(void *)(a1 + 104) = v23;
  }
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a4 + 96);
}

uint64_t sub_10000F460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0) {
    return sub_100008A68(a1, a2, a3, a4, a5, a6);
  }
  if (*(_DWORD *)(a1 + 28)) {
    return sub_10000F9A0(a1, a2, a3, a4, a5, a6);
  }
  return sub_10000F480(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_10000F480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v61 = 0u;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)unint64_t v57 = 0;
    memset(&v57[8], 0, 32);
    __int128 v58 = 0uLL;
    *(_OWORD *)std::string __p = 0uLL;
    memset(v60, 0, 21);
    sub_10000FEE8(&v61, (uint64_t)v57);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    unsigned int v51 = a4;
    if (*(void *)&v57[32])
    {
      *(void *)&__int128 v58 = *(void *)&v57[32];
      operator delete(*(void **)&v57[32]);
    }

    uint64_t v12 = *((void *)&v61 + 1);
    unint64_t v13 = *((void *)&v63 + 1) + v63 - 1;
    unint64_t v14 = v13 / 0x2A;
    uint64_t v15 = *(void *)(*((void *)&v61 + 1) + 8 * (v13 / 0x2A));
    unint64_t v16 = 3 * (v13 % 0x2A);
    uint64_t v17 = v15 + 32 * v16;
    *(_DWORD *)uint64_t v17 = 0;
    *(void *)(v17 + std::ostream::~ostream(v1, v2 + 8) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    sub_1000090D4(*(void *)(v12 + 8 * v14) + 32 * v16 + 56, *(unsigned int *)(a1 + 32));
    char v55 = 0;
    unsigned int v18 = 0;
    uint64_t v53 = 0LL;
    uint64_t v54 = a2;
    uint64_t v19 = *((void *)&v63 + 1);
    uint64_t v20 = *((void *)&v61 + 1);
    unint64_t v21 = *((void *)&v63 + 1) + v63 - 1;
    unint64_t v22 = v21 / 0x2A;
    unint64_t v23 = 3 * (v21 % 0x2A);
    *(void *)(*(void *)(*((void *)&v61 + 1) + 8 * v22) + 32 * v23 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v6;
    uint64_t v24 = *(void *)(v20 + 8 * v22) + 32 * v23;
    uint64_t v25 = a3 - a2;
    *(_DWORD *)(v24 + 8std::ostream::~ostream(v1, v2 + 8) = a5;
    *(_BYTE *)(v24 + 92) = a6;
    uint64_t v52 = a3;
    while (2)
    {
      unint64_t v27 = v19 + v63 - 1;
      uint64_t v28 = *(void *)(*((void *)&v61 + 1) + 8 * (v27 / 0x2A));
      unint64_t v29 = v27 % 0x2A;
      uint64_t v30 = v28 + 96 * (v27 % 0x2A);
      char v32 = (void *)(v30 + 80);
      uint64_t v31 = *(void *)(v30 + 80);
      if (v31) {
        (*(void (**)(uint64_t, unint64_t))(*(void *)v31 + 16LL))(v31, v28 + 96 * v29);
      }
      switch(*(_DWORD *)v30)
      {
        case 0xFFFFFC18:
          uint64_t v33 = *(void *)(v28 + 96 * v29 + 16);
          BOOL v35 = (a5 & 0x1000) == 0 || v33 == v52;
          BOOL v36 = v33 != v54 || (a5 & 0x20) == 0;
          if (!v36 || !v35) {
            goto LABEL_37;
          }
          uint64_t v37 = v33 - *(void *)(v28 + 96 * v29 + 8);
          uint64_t v38 = v53;
          if (v38 != v25)
          {
            uint64_t v53 = v38;
            sub_10000FFE8(&v61);
            char v55 = 1;
            goto LABEL_38;
          }

          __int16 v39 = (void **)*((void *)&v61 + 1);
          uint64_t v40 = v62;
          if ((void)v62 == *((void *)&v61 + 1))
          {
            uint64_t v40 = *((void *)&v61 + 1);
          }

          else
          {
            __int16 v41 = (void *)(*((void *)&v61 + 1) + 8 * ((unint64_t)v63 / 0x2A));
            BOOL v42 = (void *)(*v41 + 96 * ((unint64_t)v63 % 0x2A));
            unint64_t v43 = *(void *)(*((void *)&v61 + 1) + 8 * ((*((void *)&v63 + 1) + (void)v63) / 0x2AuLL))
                + 96 * ((*((void *)&v63 + 1) + (void)v63) % 0x2AuLL);
            if (v42 != (void *)v43)
            {
              do
              {
                sub_10000942C(v42);
                v42 += 12;
                if ((void *)((char *)v42 - *v41) == (void *)4032)
                {
                  uint64_t v44 = (void *)v41[1];
                  ++v41;
                  BOOL v42 = v44;
                }
              }

              while (v42 != (void *)v43);
              __int16 v39 = (void **)*((void *)&v61 + 1);
              uint64_t v40 = v62;
            }
          }

          *((void *)&v63 + 1) = 0LL;
          unint64_t v47 = v40 - (void)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              __int16 v39 = (void **)(*((void *)&v61 + 1) + 8LL);
              *((void *)&v61 + 1) = v39;
              unint64_t v47 = v62 - (void)v39;
            }

            while ((void)v62 - (void)v39 > 0x10uLL);
          }

          if (v47 >> 3 == 1)
          {
            uint64_t v48 = 21LL;
          }

          else
          {
            if (v47 >> 3 != 2) {
              goto LABEL_53;
            }
            uint64_t v48 = 42LL;
          }

          *(void *)&__int128 v63 = v48;
LABEL_53:
          char v55 = 1;
          uint64_t v53 = v25;
LABEL_38:
          uint64_t v19 = *((void *)&v63 + 1);
          if (*((void *)&v63 + 1)) {
            continue;
          }
          if ((v55 & 1) != 0)
          {
            uint64_t v49 = *v51;
            *(void *)uint64_t v49 = v54;
            *(void *)(v49 + std::ostream::~ostream(v1, v2 + 8) = v54 + v53;
            uint64_t v6 = 1LL;
            *(_BYTE *)(v49 + 16) = 1;
          }

          else
          {
            uint64_t v6 = 0LL;
          }

          break;
        case 0xFFFFFC19:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_38;
        case 0xFFFFFC1D:
          sub_10001005C((uint64_t)&v61, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          sub_10000FFE8(&v61);
          goto LABEL_38;
        case 0xFFFFFC20:
          __int128 v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)unint64_t v57 = *(_OWORD *)v30;
          *(_OWORD *)&v57[16] = v45;
          __int128 v58 = 0uLL;
          *(void *)&v57[32] = 0LL;
          sub_10000973C( &v57[32],  *(__int128 **)(v28 + 96 * v29 + 32),  *(__int128 **)(v28 + 96 * v29 + 40),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v28 + 96 * v29 + 40) - *(void *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0LL;
          __p[1] = 0LL;
          v60[0] = 0LL;
          sub_1000097B8( (char *)__p,  *(__int128 **)(v28 + 96 * v29 + 56),  *(__int128 **)(v28 + 96 * v29 + 64),  (uint64_t)(*(void *)(v28 + 96 * v29 + 64) - *(void *)(v28 + 96 * v29 + 56)) >> 4);
          uint64_t v46 = *v32;
          *(void *)((char *)&v60[1] + 5) = *(void *)(v30 + 85);
          v60[1] = v46;
          (*(void (**)(void, uint64_t, unint64_t))(*(void *)*v32 + 24LL))( *v32,  1LL,  v28 + 96 * v29);
          (*(void (**)(void, void, _BYTE *))(*(void *)v60[1] + 24LL))(v60[1], 0LL, v57);
          sub_10000FEE8(&v61, (uint64_t)v57);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }

          if (*(void *)&v57[32])
          {
            *(void *)&__int128 v58 = *(void *)&v57[32];
            operator delete(*(void **)&v57[32]);
          }

          goto LABEL_38;
        default:
          sub_100009150();
      }

      break;
    }
  }

  sub_100010C7C(&v61);
  return v6;
}

void sub_10000F950( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27)
{
}

uint64_t sub_10000F9A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v53 = 0LL;
  uint64_t v54 = 0LL;
  unint64_t v55 = 0LL;
  *(_DWORD *)int v50 = 0;
  memset(&v50[8], 0, 32);
  __int128 v51 = 0u;
  memset(v52, 0, 37);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(void *)&__int128 v48 = a3;
    *((void *)&v48 + 1) = a3;
    char v49 = 0;
    *(_DWORD *)__int128 v45 = 0;
    memset(&v45[8], 0, 48);
    *(_OWORD *)std::string __p = 0uLL;
    memset(v47, 0, 21);
    uint64_t v54 = (_OWORD *)sub_10000919C((uint64_t *)&v53, (uint64_t)v45);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    if (*(void *)&v45[32])
    {
      *(void *)&v45[40] = *(void *)&v45[32];
      operator delete(*(void **)&v45[32]);
    }

    uint64_t v11 = v54;
    *((_DWORD *)v54 - 24) = 0;
    *((void *)v11 - 11) = a2;
    *((void *)v11 - 1sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = a2;
    *((void *)v11 - 9) = a3;
    sub_100009098((uint64_t)(v11 - 4), *(unsigned int *)(a1 + 28), &v48);
    sub_1000090D4((uint64_t)v54 - 40, *(unsigned int *)(a1 + 32));
    uint64_t v40 = a3;
    uint64_t v41 = 0LL;
    char v42 = 0;
    unsigned int v12 = 0;
    uint64_t v13 = a3 - a2;
    unint64_t v14 = v54;
    *((void *)v54 - 2) = v6;
    *((_DWORD *)v14 - 2) = a5;
    *((_BYTE *)v14 - 4) = a6;
    do
    {
      BOOL v15 = (++v12 & 0xFFF) != 0 || (int)(v12 >> 12) < (int)v13;
      if (!v15) {
        sub_100009104();
      }
      uint64_t v17 = v14 - 1;
      uint64_t v16 = *((void *)v14 - 2);
      unsigned int v18 = v14 - 6;
      if (v16) {
        (*(void (**)(uint64_t, _OWORD *))(*(void *)v16 + 16LL))(v16, v14 - 6);
      }
      switch(*(_DWORD *)v18)
      {
        case 0xFFFFFC18:
          uint64_t v19 = *((void *)v14 - 10);
          if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != v40) {
            goto LABEL_19;
          }
          uint64_t v26 = v19 - *((void *)v14 - 11);
          uint64_t v27 = v41;
          if ((v42 & (v41 >= v26)) == 0)
          {
            __int128 v28 = *(v14 - 5);
            *(_OWORD *)int v50 = *(_OWORD *)v18;
            *(_OWORD *)&v50[16] = v28;
            if (v50 != v18)
            {
              sub_100010E10( &v50[32],  *((__int128 **)v14 - 8),  *((__int128 **)v14 - 7),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v14 - 7) - *((void *)v14 - 8)) >> 3));
              sub_100010FC4( v52,  *((uint64_t **)v14 - 5),  *((uint64_t **)v14 - 4),  (uint64_t)(*((void *)v14 - 4) - *((void *)v14 - 5)) >> 4);
            }

            unint64_t v29 = (void *)*v17;
            *(void **)((char *)&v52[3] + 5) = *(void **)((char *)v14 - 11);
            v52[3] = v29;
            uint64_t v27 = v26;
          }

          uint64_t v30 = v54;
          if (v27 == v13)
          {
            uint64_t v31 = (uint64_t)v53;
            while (v30 != (void *)v31)
            {
              v30 -= 12;
              sub_10000942C(v30);
            }

            uint64_t v54 = (_OWORD *)v31;
            char v42 = 1;
            uint64_t v41 = v13;
          }

          else
          {
            uint64_t v41 = v27;
            char v32 = v54 - 6;
            sub_10000942C((void *)v54 - 12);
            uint64_t v54 = v32;
            char v42 = 1;
          }

          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          break;
        case 0xFFFFFC1F:
LABEL_19:
          uint64_t v20 = v54 - 6;
          sub_10000942C((void *)v54 - 12);
          uint64_t v54 = v20;
          break;
        case 0xFFFFFC20:
          __int128 v21 = *(v14 - 5);
          *(_OWORD *)__int128 v45 = *(_OWORD *)v18;
          *(_OWORD *)&v45[16] = v21;
          memset(&v45[32], 0, 24);
          sub_10000973C( &v45[32],  *((__int128 **)v14 - 8),  *((__int128 **)v14 - 7),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v14 - 7) - *((void *)v14 - 8)) >> 3));
          __p[0] = 0LL;
          __p[1] = 0LL;
          v47[0] = 0LL;
          sub_1000097B8( (char *)__p,  *((__int128 **)v14 - 5),  *((__int128 **)v14 - 4),  (uint64_t)(*((void *)v14 - 4) - *((void *)v14 - 5)) >> 4);
          unint64_t v22 = (void *)*v17;
          *(void *)((char *)&v47[1] + 5) = *(void *)((char *)v14 - 11);
          v47[1] = v22;
          (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v17 + 24LL))(*v17, 1LL, v14 - 6);
          (*(void (**)(void, void, _BYTE *))(*(void *)v47[1] + 24LL))(v47[1], 0LL, v45);
          unint64_t v23 = v54;
          if ((unint64_t)v54 >= v55)
          {
            uint64_t v54 = (_OWORD *)sub_10000919C((uint64_t *)&v53, (uint64_t)v45);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }

          else
          {
            __int128 v24 = *(_OWORD *)&v45[16];
            *uint64_t v54 = *(_OWORD *)v45;
            v23[1] = v24;
            *((void *)v23 + 4) = 0LL;
            *((void *)v23 + 5) = 0LL;
            *((void *)v23 + 6) = 0LL;
            *((void *)v23 + 7) = 0LL;
            v23[2] = *(_OWORD *)&v45[32];
            *((void *)v23 + 6) = *(void *)&v45[48];
            memset(&v45[32], 0, 24);
            *((void *)v23 + std::ostream::~ostream(v1, v2 + 8) = 0LL;
            *((void *)v23 + 9) = 0LL;
            *(_OWORD *)((char *)v23 + 56) = *(_OWORD *)__p;
            *((void *)v23 + 9) = v47[0];
            __p[0] = 0LL;
            __p[1] = 0LL;
            v47[0] = 0LL;
            uint64_t v25 = v47[1];
            *(void *)((char *)v23 + 85) = *(void *)((char *)&v47[1] + 5);
            *((void *)v23 + 1sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v25;
            uint64_t v54 = v23 + 6;
          }

          if (*(void *)&v45[32])
          {
            *(void *)&v45[40] = *(void *)&v45[32];
            operator delete(*(void **)&v45[32]);
          }

          break;
        default:
          sub_100009150();
      }

      unint64_t v14 = v54;
    }

    while (v53 != v54);
    if ((v42 & 1) != 0)
    {
      uint64_t v33 = *a4;
      *(void *)uint64_t v33 = a2;
      *(void *)(v33 + std::ostream::~ostream(v1, v2 + 8) = a2 + v41;
      *(_BYTE *)(v33 + 16) = 1;
      if ((void)v51 != *(void *)&v50[32])
      {
        unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v51 - *(void *)&v50[32]) >> 3);
        BOOL v35 = (_BYTE *)(*(void *)&v50[32] + 16LL);
        unsigned int v36 = 1;
        do
        {
          uint64_t v37 = v33 + 24LL * v36;
          *(_OWORD *)uint64_t v37 = *((_OWORD *)v35 - 1);
          char v38 = *v35;
          v35 += 24;
          *(_BYTE *)(v37 + 16) = v38;
          BOOL v15 = v34 > v36++;
        }

        while (v15);
      }

      uint64_t v6 = 1LL;
    }

    else
    {
      uint64_t v6 = 0LL;
    }
  }

  if (v52[0])
  {
    v52[1] = v52[0];
    operator delete(v52[0]);
  }

  if (*(void *)&v50[32])
  {
    *(void *)&__int128 v51 = *(void *)&v50[32];
    operator delete(*(void **)&v50[32]);
  }

  *(void *)int v50 = &v53;
  sub_100009868((void ***)v50);
  return v6;
}

void sub_10000FE88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *__p, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35)
{
  a35 = v35 - 120;
  sub_100009868((void ***)&a35);
  _Unwind_Resume(a1);
}

__n128 sub_10000FEE8(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 42 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0LL;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    sub_10001014C(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }

  unint64_t v8 = *(void *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  __int128 v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(void *)(v8 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0LL;
  *(void *)(v8 + 4std::ostream::~ostream(v1, v2 + 8) = 0LL;
  *(void *)(v8 + 32) = 0LL;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(v8 + 4std::ostream::~ostream(v1, v2 + 8) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0LL;
  *(void *)(a2 + 4std::ostream::~ostream(v1, v2 + 8) = 0LL;
  *(void *)(v8 + 56) = 0LL;
  *(void *)(v8 + 64) = 0LL;
  *(void *)(v8 + 72) = 0LL;
  __n128 result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v8 + 56) = result;
  *(void *)(v8 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0LL;
  *(void *)(a2 + 64) = 0LL;
  *(void *)(a2 + 72) = 0LL;
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(v8 + 85) = *(void *)(a2 + 85);
  *(void *)(v8 + 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v11;
  ++a1[5];
  return result;
}

uint64_t sub_10000FFE8(void *a1)
{
  unint64_t v2 = a1[5] + a1[4] - 1LL;
  sub_10000942C((void *)(*(void *)(a1[1] + 8 * (v2 / 0x2A)) + 96 * (v2 % 0x2A)));
  --a1[5];
  return sub_1000108F0(a1, 1);
}

int64x2_t sub_10001005C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    sub_100010964((void **)a1);
    unint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = (void *)(v5 + 8 * (v4 / 0x2A));
  uint64_t v7 = *v6 + 96 * (v4 % 0x2A);
  if (*(void *)(a1 + 16) == v5) {
    uint64_t v7 = 0LL;
  }
  if (v7 == *v6) {
    uint64_t v7 = *(v6 - 1) + 4032LL;
  }
  __int128 v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 - 96) = *(_OWORD *)a2;
  *(_OWORD *)(v7 - 8sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = v8;
  *(void *)(v7 - 56) = 0LL;
  *(void *)(v7 - 4std::ostream::~ostream(v1, v2 + 8) = 0LL;
  *(void *)(v7 - 64) = 0LL;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(void *)(v7 - 4std::ostream::~ostream(v1, v2 + 8) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0LL;
  *(void *)(a2 + 4std::ostream::~ostream(v1, v2 + 8) = 0LL;
  *(void *)(v7 - 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = 0LL;
  *(void *)(v7 - 32) = 0LL;
  *(void *)(v7 - 24) = 0LL;
  *(_OWORD *)(v7 - 4sub_100006E8C(&v40, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0) = *(_OWORD *)(a2 + 56);
  *(void *)(v7 - 24) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0LL;
  *(void *)(a2 + 64) = 0LL;
  *(void *)(a2 + 72) = 0LL;
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(v7 - 11) = *(void *)(a2 + 85);
  *(void *)(v7 - 16) = v9;
  int64x2_t result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_100012750);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void sub_10001014C(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x2A;
  unint64_t v4 = v2 - 42;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    __int128 v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)__int128 v8 = v10;
      a1[2] += 8LL;
      return;
    }

    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      unint64_t v34 = (char *)sub_1000108BC(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      char v38 = (uint64_t *)a1[1];
      __int128 v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        __int128 v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v40 = 8 * (v39 >> 3);
        uint64_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)uint64_t v41 = v42;
          v41 += 8;
          v40 -= 8LL;
        }

        while (v40);
      }

      goto LABEL_30;
    }

LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }

    __int128 v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }

  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&__int128 v54 = operator new(0xFC0uLL);
      sub_100010460(a1, &v54);
      return;
    }

    *(void *)&__int128 v54 = operator new(0xFC0uLL);
    sub_100010574((uint64_t)a1, &v54);
    uint64_t v44 = (void *)a1[1];
    __int128 v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      unint64_t v34 = (char *)sub_1000108BC((uint64_t)(a1 + 3), v46);
      uint64_t v35 = &v34[8 * (v46 >> 2)];
      uint64_t v37 = &v34[8 * v47];
      __int128 v48 = (uint64_t *)a1[1];
      __int128 v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        __int128 v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v50 = 8 * (v49 >> 3);
        __int128 v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)__int128 v51 = v52;
          v51 += 8;
          v50 -= 8LL;
        }

        while (v50);
      }

LABEL_30:
      unint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        __int128 v8 = (char *)a1[2];
      }

      goto LABEL_33;
    }

    goto LABEL_5;
  }

  if (v23 == *a1) {
    unint64_t v25 = 1LL;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  uint64_t v56 = a1 + 3;
  *(void *)&__int128 v54 = sub_1000108BC((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&__int128 v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  uint64_t v53 = operator new(0xFC0uLL);
  sub_100010690(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7LL - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8LL;
    sub_1000107A4((uint64_t)&v54, v27);
  }

  unint64_t v29 = (char *)*a1;
  __int128 v30 = v54;
  __int128 v31 = v55;
  *(void *)&__int128 v54 = *a1;
  *((void *)&v54 + 1) = v27;
  __int128 v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  __int128 v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&__int128 v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8LL);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_100010414( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_100010460(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)sub_1000108BC(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8LL;
        }

        while (v24);
      }

      uint64_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }

    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }

      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }

  *(void *)uint64_t v6 = *a2;
  a1[2] += 8LL;
}

void sub_100010574(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(_BYTE **)(a1 + 24);
    uint64_t v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1LL;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)sub_1000108BC(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8LL];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8LL;
        }

        while (v19);
      }

      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + std::ostream::~ostream(v1, v2 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }

    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }

      *(void *)(a1 + std::ostream::~ostream(v1, v2 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }

  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }

  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8LL;
}

void sub_100010690(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)sub_1000108BC(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8LL;
        }

        while (v22);
      }

      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }

    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }

      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }

  *(void *)uint64_t v4 = *a2;
  a1[2] += 8LL;
}

void sub_1000107A4(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(_BYTE **)(a1 + 16);
    uint64_t v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1LL;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_1000108BC(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8LL];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8LL;
        }

        while (v18);
      }

      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + std::ostream::~ostream(v1, v2 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }

    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }

      *(void *)(a1 + std::ostream::~ostream(v1, v2 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }

  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }

  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8LL;
}

void *sub_1000108BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100006BE0();
  }
  return operator new(8 * a2);
}

uint64_t sub_1000108F0(void *a1, int a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  if (v2 == v3) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = 42 * ((v2 - v3) >> 3) - 1;
  }
  unint64_t v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x2A) {
    a2 = 1;
  }
  if (v5 < 0x54) {
    int v7 = a2;
  }
  else {
    int v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8LL;
  }

  return v7 ^ 1u;
}

void sub_100010964(void **a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  unint64_t v4 = (v3 - v2) >> 3;
  if (v3 == v2) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = 42 * v4 - 1;
  }
  uint64_t v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(void)a1[5]] < 0x2A)
  {
    uint64_t v7 = (uint64_t)(a1 + 3);
    uint64_t v8 = a1[3];
    uint64_t v9 = *a1;
    uint64_t v10 = v8 - (_BYTE *)*a1;
    if (v4 >= v10 >> 3)
    {
      if (v8 == v9) {
        unint64_t v11 = 1LL;
      }
      else {
        unint64_t v11 = v10 >> 2;
      }
      unint64_t v46 = a1 + 3;
      std::string __p = sub_1000108BC(v7, v11);
      unint64_t v43 = (char *)__p;
      uint64_t v44 = (char *)__p;
      uint64_t v45 = (char *)__p + 8 * v12;
      uint64_t v41 = operator new(0xFC0uLL);
      sub_100010690(&__p, &v41);
      uint64_t v13 = (char *)a1[1];
      uint64_t v14 = v44;
      if (v13 == a1[2])
      {
        unint64_t v33 = (char *)a1[1];
      }

      else
      {
        do
        {
          if (v14 == v45)
          {
            int64_t v15 = v43 - (_BYTE *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p) {
                unint64_t v23 = 1LL;
              }
              else {
                unint64_t v23 = (v14 - (_BYTE *)__p) >> 2;
              }
              uint64_t v24 = (char *)sub_1000108BC((uint64_t)v46, v23);
              uint64_t v26 = v43;
              uint64_t v14 = &v24[8 * (v23 >> 2)];
              uint64_t v27 = v44 - v43;
              if (v44 != v43)
              {
                uint64_t v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8LL)];
                uint64_t v28 = 8 * (v27 >> 3);
                unint64_t v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  uint64_t v30 = *(void *)v26;
                  v26 += 8;
                  *(void *)unint64_t v29 = v30;
                  v29 += 8;
                  v28 -= 8LL;
                }

                while (v28);
              }

              __int128 v31 = __p;
              std::string __p = v24;
              unint64_t v43 = &v24[8 * (v23 >> 2)];
              uint64_t v44 = v14;
              uint64_t v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                uint64_t v14 = v44;
              }
            }

            else
            {
              uint64_t v16 = v15 >> 3;
              BOOL v17 = v15 >> 3 < -1;
              uint64_t v18 = (v15 >> 3) + 2;
              if (v17) {
                uint64_t v19 = v18;
              }
              else {
                uint64_t v19 = v16 + 1;
              }
              uint64_t v20 = &v43[-8 * (v19 >> 1)];
              int64_t v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                uint64_t v14 = v43;
              }

              uint64_t v22 = &v14[-8 * (v19 >> 1)];
              uint64_t v14 = &v20[v21];
              unint64_t v43 = v22;
              uint64_t v44 = &v20[v21];
            }
          }

          uint64_t v32 = *(void *)v13;
          v13 += 8;
          *(void *)uint64_t v14 = v32;
          uint64_t v14 = v44 + 8;
          v44 += 8;
        }

        while (v13 != a1[2]);
        unint64_t v33 = (char *)a1[1];
      }

      uint64_t v36 = *a1;
      uint64_t v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      std::string __p = v36;
      unint64_t v43 = v33;
      char v38 = (char *)a1[3];
      uint64_t v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      uint64_t v44 = v13;
      uint64_t v45 = v38;
      if (v14 - v37 == 8) {
        uint64_t v40 = 21LL;
      }
      else {
        uint64_t v40 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v40;
      if (v13 != v33) {
        uint64_t v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8LL];
      }
      if (v36) {
        operator delete(v36);
      }
    }

    else
    {
      if (v2 == v9)
      {
        std::string __p = operator new(0xFC0uLL);
        sub_100010460(a1, &__p);
        unint64_t v34 = a1[2];
        std::string __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }

      else
      {
        std::string __p = operator new(0xFC0uLL);
      }

      sub_100010574((uint64_t)a1, &__p);
      if ((_BYTE *)a1[2] - (_BYTE *)a1[1] == 8) {
        uint64_t v35 = 21LL;
      }
      else {
        uint64_t v35 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v35;
    }
  }

  else
  {
    a1[4] = v6 + 42;
    std::string __p = (void *)*((void *)v3 - 1);
    a1[2] = v3 - 8;
    sub_100010574((uint64_t)a1, &__p);
  }

void sub_100010C30( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100010C7C(void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  if (v3 == v2)
  {
    unint64_t v4 = a1 + 5;
    uint64_t v3 = (void **)a1[1];
  }

  else
  {
    unint64_t v4 = a1 + 5;
    unint64_t v5 = a1[4];
    uint64_t v6 = &v2[v5 / 0x2A];
    uint64_t v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    unint64_t v8 = (unint64_t)v2[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        sub_10000942C(v7);
        v7 += 96;
        if (v7 - (_BYTE *)*v6 == 4032)
        {
          uint64_t v9 = (char *)v6[1];
          ++v6;
          uint64_t v7 = v9;
        }
      }

      while (v7 != (char *)v8);
      uint64_t v2 = (void **)a1[1];
      uint64_t v3 = (void **)a1[2];
    }
  }

  *unint64_t v4 = 0LL;
  unint64_t v10 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8LL);
      a1[1] = v2;
      unint64_t v10 = (char *)v3 - (char *)v2;
    }

    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }

  unint64_t v11 = v10 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 21LL;
  }

  else
  {
    if (v11 != 2) {
      goto LABEL_16;
    }
    uint64_t v12 = 42LL;
  }

  a1[4] = v12;
LABEL_16:
  while (v2 != v3)
  {
    uint64_t v13 = *v2++;
    operator delete(v13);
  }

  return sub_100010DC4((uint64_t)a1);
}

uint64_t sub_100010DC4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

char *sub_100010E10(void *a1, __int128 *a2, __int128 *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= a4)
  {
    uint64_t v19 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v19;
    unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((v19 - result) >> 3);
    if (v20 >= a4)
    {
      uint64_t v25 = result;
      if (a2 != a3)
      {
        uint64_t v26 = result;
        do
        {
          *(_OWORD *)uint64_t v26 = *v6;
          v26[16] = *((_BYTE *)v6 + 16);
          v25 += 24;
          uint64_t v6 = (__int128 *)((char *)v6 + 24);
          v26 += 24;
        }

        while (v6 != a3);
      }

      int64_t v18 = v25 - result;
      uint64_t v13 = result;
    }

    else
    {
      int64_t v21 = (__int128 *)((char *)a2 + 24 * v20);
      if (v13 != result)
      {
        do
        {
          *(_OWORD *)int64x2_t result = *v6;
          result[16] = *((_BYTE *)v6 + 16);
          uint64_t v6 = (__int128 *)((char *)v6 + 24);
          result += 24;
        }

        while (v6 != v21);
      }

      uint64_t v22 = v13;
      if (v21 != a3)
      {
        unint64_t v23 = v13;
        do
        {
          __int128 v24 = *v21;
          *((void *)v23 + 2) = *((void *)v21 + 2);
          *(_OWORD *)unint64_t v23 = v24;
          v23 += 24;
          int64_t v21 = (__int128 *)((char *)v21 + 24);
          v22 += 24;
        }

        while (v21 != a3);
      }

      int64_t v18 = v22 - v13;
    }
  }

  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0LL;
      *a1 = 0LL;
      a1[1] = 0LL;
      a1[2] = 0LL;
    }

    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      sub_100006DF8();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x555555555555555LL) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v11;
    }
    int64x2_t result = sub_100008FC4(a1, v12);
    int64_t v15 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v15;
    uint64_t v16 = v15;
    if (v6 != a3)
    {
      uint64_t v16 = v13;
      do
      {
        __int128 v17 = *v6;
        *((void *)v16 + 2) = *((void *)v6 + 2);
        *(_OWORD *)uint64_t v16 = v17;
        v16 += 24;
        uint64_t v6 = (__int128 *)((char *)v6 + 24);
      }

      while (v6 != a3);
    }

    int64_t v18 = v16 - v13;
  }

  *uint64_t v14 = &v13[v18];
  return result;
}

char *sub_100010FC4(void *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (a4 <= (v8 - (uint64_t)result) >> 4)
  {
    int64_t v18 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v18;
    unint64_t v19 = (v18 - result) >> 4;
    if (v19 >= a4)
    {
      uint64_t v26 = result;
      if (a2 != a3)
      {
        uint64_t v27 = result;
        do
        {
          uint64_t v28 = *v6;
          uint64_t v29 = v6[1];
          v6 += 2;
          *(void *)uint64_t v27 = v28;
          *((void *)v27 + 1) = v29;
          v27 += 16;
          v26 += 16;
        }

        while (v6 != a3);
      }

      __int128 v17 = (char *)(v26 - result);
      unint64_t v12 = result;
    }

    else
    {
      unint64_t v20 = (__int128 *)&a2[2 * v19];
      if (v12 != result)
      {
        do
        {
          uint64_t v21 = *v6;
          uint64_t v22 = v6[1];
          v6 += 2;
          *(void *)int64x2_t result = v21;
          *((void *)result + 1) = v22;
          result += 16;
        }

        while (v6 != (uint64_t *)v20);
      }

      unint64_t v23 = v12;
      if (v20 != (__int128 *)a3)
      {
        __int128 v24 = v12;
        do
        {
          __int128 v25 = *v20++;
          *(_OWORD *)__int128 v24 = v25;
          v24 += 16;
          v23 += 16;
        }

        while (v20 != (__int128 *)a3);
      }

      __int128 v17 = (char *)(v23 - v12);
    }
  }

  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0LL;
      *a1 = 0LL;
      a1[1] = 0LL;
      a1[2] = 0LL;
    }

    if (a4 >> 60) {
      sub_100006DF8();
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    else {
      unint64_t v11 = v10;
    }
    int64x2_t result = sub_100009828(a1, v11);
    uint64_t v14 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v14;
    int64_t v15 = v14;
    if (v6 != a3)
    {
      int64_t v15 = v12;
      do
      {
        __int128 v16 = *(_OWORD *)v6;
        v6 += 2;
        *(_OWORD *)int64_t v15 = v16;
        v15 += 16;
      }

      while (v6 != a3);
    }

    __int128 v17 = (char *)(v15 - v12);
  }

  *uint64_t v13 = &v17[(void)v12];
  return result;
}

void sub_100011110(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_10001114C((void **)a1, v4);
  }

  else if (!v3)
  {
    *(void *)(a1 + std::ostream::~ostream(v1, v2 + 8) = *(void *)a1 + 24 * a2;
  }

void sub_10001114C(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(void **)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (_BYTE *)v7) >> 3) >= a2)
  {
    if (a2)
    {
      uint64_t v13 = &v7[3 * a2];
      uint64_t v14 = 24 * a2;
      do
      {
        *uint64_t v7 = 0LL;
        v7[1] = 0LL;
        *((_BYTE *)v7 + 16) = 0;
        v7 += 3;
        v14 -= 24LL;
      }

      while (v14);
      uint64_t v7 = v13;
    }

    a1[1] = v7;
  }

  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (_BYTE *)*a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_100006DF8();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (_BYTE *)*a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555LL) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      unint64_t v12 = (char *)sub_100009014(v4, v11);
    }
    else {
      unint64_t v12 = 0LL;
    }
    int64_t v15 = &v12[24 * v8];
    __int128 v16 = &v15[24 * a2];
    uint64_t v17 = 24 * a2;
    int64_t v18 = v15;
    do
    {
      *(void *)int64_t v18 = 0LL;
      *((void *)v18 + 1) = 0LL;
      v18[16] = 0;
      v18 += 24;
      v17 -= 24LL;
    }

    while (v17);
    unint64_t v19 = &v12[24 * v11];
    uint64_t v21 = (char *)*a1;
    unint64_t v20 = (char *)a1[1];
    if (v20 != *a1)
    {
      do
      {
        __int128 v22 = *(_OWORD *)(v20 - 24);
        *((void *)v15 - 1) = *((void *)v20 - 1);
        *(_OWORD *)(v15 - 24) = v22;
        v15 -= 24;
        v20 -= 24;
      }

      while (v20 != v21);
      unint64_t v20 = (char *)*a1;
    }

    *a1 = v15;
    a1[1] = v16;
    a1[2] = v19;
    if (v20) {
      operator delete(v20);
    }
  }

std::string *sub_1000112B4(std::string *this, char *a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__l.__cap_ = 0LL;
  BOOL v3 = a2 - 1;
  while (*++v3)
    ;
  sub_10001130C(this, a2, v3);
  return this;
}

void sub_1000112F0(_Unwind_Exception *exception_object)
{
}

std::string *sub_10001130C(std::string *this, char *a2, char *a3)
{
  uint64_t v4 = a2;
  LODWORD(v6) = (char)this->__r_.__value_.__s.__size_;
  unint64_t v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    std::string::size_type cap = this->__r_.__value_.__l.__cap_;
    std::string::size_type v9 = (cap & 0x7FFFFFFFFFFFFFFFLL) - 1;
    unint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    std::string::size_type v6 = HIBYTE(cap);
  }

  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__s.__size_;
    std::string::size_type v9 = 22LL;
    unint64_t v10 = this;
  }

  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0LL, 0LL);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = this->__r_.__value_.__s.__size_;
    }

    uint64_t v14 = this;
    if ((v6 & 0x80) != 0) {
      uint64_t v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    for (uint64_t i = (char *)v14 + size; v4 != a3; ++i)
    {
      char v16 = *v4++;
      *uint64_t i = v16;
    }

    *uint64_t i = 0;
    std::string::size_type v17 = v7 + size;
    else {
      this->__r_.__value_.__s.__size_ = v17 & 0x7F;
    }
  }

  else
  {
    sub_10000BCC0(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0) {
      unint64_t v12 = __p;
    }
    else {
      unint64_t v12 = (void **)__p[0];
    }
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v13 = v20;
    }
    else {
      std::string::size_type v13 = (std::string::size_type)__p[1];
    }
    std::string::append(this, (const std::string::value_type *)v12, v13);
  }

  return this;
}

void sub_100011464( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *sub_100011480(std::string *this, char *a2)
{
  if ((char)this->__r_.__value_.__s.__size_ < 0)
  {
    *this->__r_.__value_.__l.__data_ = 0;
    this->__r_.__value_.__l.__size_ = 0LL;
  }

  else
  {
    this->__r_.__value_.__s.__data_[0] = 0;
    this->__r_.__value_.__s.__size_ = 0;
  }

  BOOL v3 = a2 - 1;
  while (*++v3)
    ;
  sub_10001130C(this, a2, v3);
  return this;
}

void (__cdecl ***sub_1000114D4( void (__cdecl ***a1)(std::ifstream *__hidden this), uint64_t a2, int a3))(std::ifstream *__hidden this)
{
  std::string::size_type v6 = a1 + 2;
  *a1 = v7;
  *(void *)((char *)*(v7 - 3) + (void)a1) = v8;
  a1[1] = 0LL;
  std::string::size_type v9 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v9, a1 + 2);
  v9[1].__vftable = 0LL;
  v9[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf(v6);
  if (!std::filebuf::open(v6, a2, a3 | 8u)) {
    std::ios_base::clear( (std::ios_base *)((char *)*(*a1 - 3) + (void)a1),  *(_DWORD *)((char *)*(*a1 - 3) + (void)a1 + 32) | 4);
  }
  return a1;
}

void sub_1000115A8(_Unwind_Exception *a1)
{
}

void *sub_1000115E0(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = operator new(0x20uLL);
  *uint64_t v4 = &off_100014AE0;
  v4[1] = 0LL;
  v4[2] = 0LL;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_10001162C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  a10 = 0LL;
  if (v10) {
    sub_1000116AC((int)&a10, v10);
  }
  _Unwind_Resume(exception_object);
}

void sub_100011650(std::__shared_weak_count *a1)
{
}

void sub_100011664(uint64_t a1)
{
}

uint64_t sub_10001166C(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }

  else
  {
    return 0LL;
  }

void sub_1000116AC(int a1, void **__p)
{
  if (__p)
  {
    *std::string __p = off_100014348;
    *std::string __p = &off_100014328;
    operator delete(__p);
  }

void *sub_10001171C(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = operator new(0x20uLL);
  *uint64_t v4 = &off_100014B58;
  v4[1] = 0LL;
  v4[2] = 0LL;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_100011768( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  a10 = 0LL;
  if (v10) {
    sub_1000117E8((int)&a10, v10);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001178C(std::__shared_weak_count *a1)
{
}

void sub_1000117A0(uint64_t a1)
{
}

uint64_t sub_1000117A8(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }

  else
  {
    return 0LL;
  }

void sub_1000117E8(int a1, void **__p)
{
  if (__p)
  {
    *std::string __p = &off_100014368;
    *std::string __p = &off_100014328;
    operator delete(__p);
  }

void *sub_100011858(void *a1, uint64_t a2, uint64_t a3)
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
      unint64_t v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
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
    if (!sub_1000119BC(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_100011960( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

void sub_1000119A8(_Unwind_Exception *a1)
{
}

uint64_t sub_1000119BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_10000BE58(__p, v12, __c);
      std::string::size_type v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_100011ADC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100011AF8()
{
  return __cxa_atexit((void (*)(void *))sub_1000037DC, &unk_100018000, (void *)&_mh_execute_header);
}

void sub_100011B68( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100011B84(uint64_t a1, void **a2, void **a3)
{
}

void sub_100011BC4(void *a1)
{
}

void sub_100011BE0(uint64_t a1, __int128 *a2, uint64_t a3, void *a4)
{
  *a4 = a1 + 23;
  __int128 v7 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v7;
  *((_BYTE *)a2 + 23) = 0;
  *(_BYTE *)a2 = 0;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}