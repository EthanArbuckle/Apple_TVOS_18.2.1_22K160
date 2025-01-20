void sub_100108B00(uint64_t a1)
{
  void *v2;
  v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100193228);
  sub_100108B88((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_100108B40(void *a1)
{
  v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100193228);
  sub_100108B88((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_100108B88(uint64_t a1)
{
  *(void *)a1 = off_1001932F8;
  sub_100108C24(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_100108C24(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_100108D8C((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_100108D4C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100108D78(uint64_t a1)
{
  v1 = (void *)sub_100108B88(a1);
  operator delete(v1);
}

int *sub_100108D8C(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 381LL;
    __int16 v25 = 2082;
    v26 = v10;
    v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 381LL;
      __int16 v25 = 2082;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_100108F70(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100193448);
  sub_100109134(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_100108FA8(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100193448);
  sub_100109134(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_100108FE8(char *a1)
{
}

uint64_t sub_10010902C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_100109060(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_1001090AC(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100193448);
  sub_100109134((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_1001090EC(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100193448);
  sub_100109134((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_100109134(uint64_t a1)
{
  *(void *)a1 = off_100193518;
  sub_1001091D0(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_1001091D0(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_100109338((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_1001092F8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100109324(uint64_t a1)
{
  uint64_t v1 = (void *)sub_100109134(a1);
  operator delete(v1);
}

int *sub_100109338(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 388LL;
    __int16 v25 = 2082;
    v26 = v10;
    v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 388LL;
      __int16 v25 = 2082;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10010951C(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100193668);
  sub_1001096E0(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_100109554(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100193668);
  sub_1001096E0(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_100109594(char *a1)
{
}

uint64_t sub_1001095D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10010960C(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_100109658(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100193668);
  sub_1001096E0((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_100109698(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100193668);
  sub_1001096E0((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_1001096E0(uint64_t a1)
{
  *(void *)a1 = off_100193738;
  sub_10010977C(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10010977C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_1001098E4((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_1001098A4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1001098D0(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1001096E0(a1);
  operator delete(v1);
}

int *sub_1001098E4(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 398LL;
    __int16 v25 = 2082;
    v26 = v10;
    v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 398LL;
      __int16 v25 = 2082;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_100109AC8(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100193888);
  sub_100109C8C(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_100109B00(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100193888);
  sub_100109C8C(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_100109B40(char *a1)
{
}

uint64_t sub_100109B84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_100109BB8(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_100109C04(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100193888);
  sub_100109C8C((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_100109C44(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100193888);
  sub_100109C8C((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_100109C8C(uint64_t a1)
{
  *(void *)a1 = off_100193958;
  sub_100109D28(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_100109D28(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_100109E90((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_100109E50( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100109E7C(uint64_t a1)
{
  uint64_t v1 = (void *)sub_100109C8C(a1);
  operator delete(v1);
}

int *sub_100109E90(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 411LL;
    __int16 v25 = 2082;
    v26 = v10;
    v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 411LL;
      __int16 v25 = 2082;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10010A074(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100193AA8);
  sub_10010A238(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10010A0AC(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100193AA8);
  sub_10010A238(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10010A0EC(char *a1)
{
}

uint64_t sub_10010A130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10010A164(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10010A1B0(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100193AA8);
  sub_10010A238((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10010A1F0(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100193AA8);
  sub_10010A238((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_10010A238(uint64_t a1)
{
  *(void *)a1 = off_100193B78;
  sub_10010A2D4(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10010A2D4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10010A43C((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10010A3FC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10010A428(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10010A238(a1);
  operator delete(v1);
}

int *sub_10010A43C(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 424LL;
    __int16 v25 = 2082;
    v26 = v10;
    v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 424LL;
      __int16 v25 = 2082;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10010A620(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100193CC8);
  sub_10010A7E4(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10010A658(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100193CC8);
  sub_10010A7E4(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10010A698(char *a1)
{
}

uint64_t sub_10010A6DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10010A710(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10010A75C(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100193CC8);
  sub_10010A7E4((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10010A79C(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100193CC8);
  sub_10010A7E4((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_10010A7E4(uint64_t a1)
{
  *(void *)a1 = off_100193D98;
  sub_10010A880(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10010A880(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10010A9E8((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10010A9A8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10010A9D4(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10010A7E4(a1);
  operator delete(v1);
}

int *sub_10010A9E8(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 432LL;
    __int16 v25 = 2082;
    v26 = v10;
    v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 432LL;
      __int16 v25 = 2082;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10010ABCC(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100193EE8);
  sub_10010AD90(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10010AC04(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100193EE8);
  sub_10010AD90(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10010AC44(char *a1)
{
}

uint64_t sub_10010AC88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10010ACBC(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10010AD08(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100193EE8);
  sub_10010AD90((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10010AD48(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100193EE8);
  sub_10010AD90((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_10010AD90(uint64_t a1)
{
  *(void *)a1 = off_100193FB8;
  sub_10010AE2C(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10010AE2C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10010AF94((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10010AF54( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10010AF80(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10010AD90(a1);
  operator delete(v1);
}

int *sub_10010AF94(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 441LL;
    __int16 v25 = 2082;
    v26 = v10;
    v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 441LL;
      __int16 v25 = 2082;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10010B178(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100194108);
  sub_10010B33C(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10010B1B0(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100194108);
  sub_10010B33C(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10010B1F0(char *a1)
{
}

uint64_t sub_10010B234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10010B268(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10010B2B4(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100194108);
  sub_10010B33C((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10010B2F4(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100194108);
  sub_10010B33C((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_10010B33C(uint64_t a1)
{
  *(void *)a1 = off_1001941D8;
  sub_10010B3D8(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10010B3D8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10010B540((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10010B500( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10010B52C(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10010B33C(a1);
  operator delete(v1);
}

int *sub_10010B540(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 449LL;
    __int16 v25 = 2082;
    v26 = v10;
    v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 449LL;
      __int16 v25 = 2082;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10010B724(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100194328);
  sub_10010B8E8(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10010B75C(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100194328);
  sub_10010B8E8(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10010B79C(char *a1)
{
}

uint64_t sub_10010B7E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10010B814(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10010B860(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100194328);
  sub_10010B8E8((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10010B8A0(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100194328);
  sub_10010B8E8((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_10010B8E8(uint64_t a1)
{
  *(void *)a1 = off_1001943F8;
  sub_10010B984(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10010B984(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10010BAEC((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10010BAAC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10010BAD8(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10010B8E8(a1);
  operator delete(v1);
}

int *sub_10010BAEC(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 489LL;
    __int16 v25 = 2082;
    v26 = v10;
    v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 489LL;
      __int16 v25 = 2082;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10010BCD0(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100194548);
  sub_10010BE94(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10010BD08(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100194548);
  sub_10010BE94(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10010BD48(char *a1)
{
}

uint64_t sub_10010BD8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10010BDC0(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10010BE0C(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100194548);
  sub_10010BE94((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10010BE4C(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100194548);
  sub_10010BE94((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_10010BE94(uint64_t a1)
{
  *(void *)a1 = off_100194618;
  sub_10010BF30(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10010BF30(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10010C098((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10010C058( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10010C084(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10010BE94(a1);
  operator delete(v1);
}

int *sub_10010C098(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 502LL;
    __int16 v25 = 2082;
    v26 = v10;
    v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 502LL;
      __int16 v25 = 2082;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10010C27C(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100194768);
  sub_10010C440(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10010C2B4(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100194768);
  sub_10010C440(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10010C2F4(char *a1)
{
}

uint64_t sub_10010C338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10010C36C(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10010C3B8(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100194768);
  sub_10010C440((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10010C3F8(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100194768);
  sub_10010C440((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_10010C440(uint64_t a1)
{
  *(void *)a1 = off_100194838;
  sub_10010C4DC(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10010C4DC(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10010C644((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10010C604( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10010C630(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10010C440(a1);
  operator delete(v1);
}

int *sub_10010C644(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 643LL;
    __int16 v25 = 2082;
    v26 = v10;
    v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 643LL;
      __int16 v25 = 2082;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

void sub_10010C828(uint64_t a1@<X1>, void *a2@<X8>)
{
  int v4 = operator new(0x470uLL);
  sub_10010C888(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  sub_10001C350((uint64_t)a2, v4 + 4, (uint64_t)(v4 + 3));
}

void sub_10010C874(_Unwind_Exception *a1)
{
}

void *sub_10010C888(void *a1, uint64_t a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_10017AE58;
  sub_10010C8D0(a1 + 3, a2);
  return a1;
}

void sub_10010C8BC(_Unwind_Exception *a1)
{
}

double sub_10010C8D0(void *a1, uint64_t a2)
{
  uint64_t v3 = sub_10011EBA0(a1);
  *uint64_t v3 = off_1001920D8;
  v3[3] = off_1001921B8;
  v3[4] = off_1001921F0;
  uint64_t v4 = *(void *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 48);
  v3[5] = v4;
  v3[6] = v5;
  if (v5)
  {
    char v6 = (unint64_t *)(v5 + 8);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    uint64_t v4 = v3[5];
  }

  v3[7] = v4 + 8;
  v3[8] = v3 + 11;
  double result = 0.0;
  *(_OWORD *)(v3 + 9) = xmmword_100142520;
  return result;
}

void sub_10010C944(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v10 = *a1;
  unint64_t v11 = sub_1000FE25C((uint64_t)a1, a3);
  if (v11 >> 57) {
    sub_10001A548("get_next_capacity, allocator's max size reached");
  }
  uint64_t v12 = v11;
  v13 = operator new(v11 << 6);
  sub_10010C9E0(a1, (uint64_t)v13, v12, a2, a3, a4);
  *a5 = *a1 + a2 - v10;
}

void sub_10010C9E0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = *a1;
  sub_10010CAB0((uint64_t)a1, *a1, a4, *a1 + (a1[1] << 6), a2, a5, a6);
  if (v10)
  {
    for (uint64_t i = a1[1]; i; v10 += 64LL)
    {
      uint64_t v12 = *(void *)(v10 + 56);
      if (v12) {
        *(void *)(v12 + 32) = 0LL;
      }
      --i;
      sub_100006224(v10);
    }
  }

  uint64_t v13 = a1[1] + a5;
  *a1 = a2;
  a1[1] = v13;
  a1[2] = a3;
}

void sub_10010CA8C(_Unwind_Exception *exception_object)
{
  if (v1)
  {
  }

  _Unwind_Resume(exception_object);
}

__n128 sub_10010CAB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  while (a2 != a3)
  {
    *(_OWORD *)a5 = *(_OWORD *)a2;
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
    __int128 v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a5 + 25) = *(_OWORD *)(a2 + 25);
    *(_OWORD *)(a5 + 16) = v7;
    int v8 = *(_DWORD *)(a2 + 48);
    *(void *)(a5 + 56) = *(void *)(a2 + 56);
    uint64_t v9 = a5 + 56;
    *(_DWORD *)(v9 - 8) = v8;
    *(void *)(a2 + 56) = 0LL;
    *(void *)(*(void *)v9 + 32LL) = v9;
    a5 = v9 + 8;
    a2 += 64LL;
  }

  *(_OWORD *)a5 = *(_OWORD *)a7;
  *(void *)a7 = 0LL;
  *(void *)(a7 + 8) = 0LL;
  __n128 result = *(__n128 *)(a7 + 16);
  *(_OWORD *)(a5 + 25) = *(_OWORD *)(a7 + 25);
  *(__n128 *)(a5 + 16) = result;
  *(void *)(a5 + 56) = *(void *)(a7 + 56);
  *(_DWORD *)(a5 + 48) = *(_DWORD *)(a7 + 48);
  *(void *)(a7 + 56) = 0LL;
  *(void *)(*(void *)(a5 + 56) + 32LL) = a5 + 56;
  if (a3 != a4)
  {
    uint64_t v11 = a5 + (a6 << 6);
    do
    {
      *(_OWORD *)uint64_t v11 = *(_OWORD *)a3;
      *(void *)a3 = 0LL;
      *(void *)(a3 + 8) = 0LL;
      __n128 result = *(__n128 *)(a3 + 16);
      *(_OWORD *)(v11 + 25) = *(_OWORD *)(a3 + 25);
      *(__n128 *)(v11 + 16) = result;
      int v12 = *(_DWORD *)(a3 + 48);
      *(void *)(v11 + 56) = *(void *)(a3 + 56);
      uint64_t v13 = v11 + 56;
      *(_DWORD *)(v13 - 8) = v12;
      *(void *)(a3 + 56) = 0LL;
      *(void *)(*(void *)v13 + 32LL) = v13;
      a3 += 64LL;
      uint64_t v11 = v13 + 8;
    }

    while (a3 != a4);
  }

  return result;
}

uint64_t sub_10010CB90(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100192418;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010CBF8(_Unwind_Exception *a1)
{
}

uint64_t sub_10010CC0C(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100192638;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010CC74(_Unwind_Exception *a1)
{
}

uint64_t sub_10010CC88(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100192858;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010CCF0(_Unwind_Exception *a1)
{
}

uint64_t sub_10010CD04(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100192A78;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010CD6C(_Unwind_Exception *a1)
{
}

void sub_10010CD80(uint64_t ***a1)
{
  uint64_t v1 = **a1;
  uint64_t v2 = *v1;
  if ((fstatfs(*(_DWORD *)(*v1 + 8), &v21) & 0x80000000) == 0)
  {
    size_t f_bsize = v21.f_bsize;
    if (!*(_BYTE *)(v2 + 88)) {
      *(_BYTE *)(v2 + 88) = 1;
    }
    *(void *)(v2 + 72) = f_bsize;
    char v4 = valloc(f_bsize);
    if (!v4)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      v16 = std::bad_alloc::bad_alloc(exception);
    }

    *(void *)&__int128 v22 = &off_100194AD8;
    uint64_t v24 = &v22;
    v17 = v4;
    sub_100043B68((uint64_t)&v18, (uint64_t)&v22);
    __int128 v5 = v24;
    if (v24 == &v22)
    {
      uint64_t v6 = 4LL;
      __int128 v5 = &v22;
    }

    else
    {
      if (!v24) {
        goto LABEL_14;
      }
      uint64_t v6 = 5LL;
    }

    (*(void (**)(void))(*(void *)v5 + 8 * v6))();
LABEL_14:
    sub_10010D0B4(v2 + 96, (uint64_t *)&v17);
    sub_100043BCC((uint64_t *)&v17);
    int64_t v14 = *(void *)(v2 + 72);
    if (v14 >= 1) {
      bzero(*(void **)(v2 + 96), v14);
    }
    return;
  }

  *(void *)&__int128 v22 = "FileLocal::shared_state_t::init_unmap_zeros()::(anonymous class)::operator()() const";
  *((void *)&v22 + 1) = 76LL;
  int v23 = 16;
  sub_10010CFCC(&v17, &v22);
  sub_10000552C(&v19, (uint64_t)"fstatfs failed with err code ", 29LL);
  __int128 v7 = __error();
  std::ostream::operator<<(&v19, *v7);
  std::ostream::~ostream(&v19, off_100194988);
  sub_10010D178((uint64_t)&v17);
  std::ios::~ios(&v20);
  int v8 = *__error();
  uint64_t v9 = std::generic_category();
  int v10 = *(unsigned __int8 *)(v2 + 88);
  *(_DWORD *)(v2 + 72) = v8;
  *(void *)(v2 + 80) = v9;
  if (v10) {
    *(_BYTE *)(v2 + 88) = 0;
  }
  int v11 = *__error();
  int v12 = std::generic_category();
  uint64_t v13 = v12;
  if (*(_BYTE *)(v2 + 136))
  {
    sub_100043BCC((uint64_t *)(v2 + 96));
    *(_DWORD *)(v2 + 96) = v11;
    *(void *)(v2 + 104) = v13;
    *(_BYTE *)(v2 + 136) = 0;
  }

  else
  {
    *(_DWORD *)(v2 + 96) = v11;
    *(void *)(v2 + 104) = v12;
  }

void sub_10010CF84(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_10010CFCC(void *a1, __int128 *a2)
{
  uint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_10010D0FC((uint64_t)a1, a2);
  *a1 = off_1001948C0;
  a1[45] = &off_1001949C0;
  a1[46] = &off_1001949E8;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_1001948C0;
  a1[45] = off_100194948;
  a1[46] = off_100194970;
  return a1;
}

void sub_10010D050(_Unwind_Exception *a1)
{
}

uint64_t sub_10010D074(uint64_t a1)
{
  return a1;
}

uint64_t sub_10010D0B4(uint64_t a1, uint64_t *a2)
{
  if (*(_BYTE *)(a1 + 40)) {
    sub_1000BD59C((uint64_t *)a1, a2);
  }
  else {
    sub_10010D7B8(a1, a1, a2);
  }
  return a1;
}

uint64_t sub_10010D0FC(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100194A58;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010D164(_Unwind_Exception *a1)
{
}

uint64_t sub_10010D178(uint64_t a1)
{
  *(void *)a1 = off_100194A58;
  sub_10010D3F0(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

void sub_10010D214(char *a1)
{
}

uint64_t sub_10010D258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10010D28C(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

uint64_t sub_10010D2D8(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100194988);
  sub_10010D178(v2);
  return std::ios::~ios(a1 + 8);
}

void sub_10010D310(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100194988);
  sub_10010D178((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

uint64_t sub_10010D350(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100194988);
  sub_10010D178(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10010D390(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100194988);
  sub_10010D178((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

void sub_10010D3DC(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10010D178(a1);
  operator delete(v1);
}

uint64_t sub_10010D3F0(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10010D540((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10010D518( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

int *sub_10010D540(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      int v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 236LL;
    __int16 v25 = 2082;
    v26 = v10;
    int v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      int v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 236LL;
      __int16 v25 = 2082;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  __n128 result = __error();
  int *result = v5;
  return result;
}

void *sub_10010D72C()
{
  __n128 result = operator new(0x10uLL);
  void *result = &off_100194AD8;
  return result;
}

void sub_10010D750(uint64_t a1, void *a2)
{
  *a2 = &off_100194AD8;
}

void sub_10010D768(uint64_t a1, void **a2)
{
}

uint64_t sub_10010D770(uint64_t a1, uint64_t a2)
{
  else {
    return 0LL;
  }
}

_UNKNOWN **sub_10010D7AC()
{
  return &off_100194B38;
}

uint64_t sub_10010D7B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (*(_BYTE *)(a1 + 40)) {
    sub_100043BCC((uint64_t *)a1);
  }
  uint64_t v5 = *a3;
  *a3 = 0LL;
  *(void *)a1 = v5;
  uint64_t result = sub_100043B68(a1 + 8, (uint64_t)(a3 + 1));
  *(_BYTE *)(a1 + 40) = 1;
  return result;
}

uint64_t sub_10010D808(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100192C98;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010D870(_Unwind_Exception *a1)
{
}

uint64_t sub_10010D884(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100192EB8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010D8EC(_Unwind_Exception *a1)
{
}

uint64_t sub_10010D900(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_1001930D8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010D968(_Unwind_Exception *a1)
{
}

uint64_t sub_10010D97C(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_1001932F8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010D9E4(_Unwind_Exception *a1)
{
}

uint64_t sub_10010D9F8(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100193518;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010DA60(_Unwind_Exception *a1)
{
}

uint64_t sub_10010DA74(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100193738;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010DADC(_Unwind_Exception *a1)
{
}

uint64_t sub_10010DAF0(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100193958;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010DB58(_Unwind_Exception *a1)
{
}

uint64_t sub_10010DB6C(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100193B78;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010DBD4(_Unwind_Exception *a1)
{
}

uint64_t sub_10010DBE8(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100193D98;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010DC50(_Unwind_Exception *a1)
{
}

uint64_t sub_10010DC64(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100193FB8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010DCCC(_Unwind_Exception *a1)
{
}

uint64_t sub_10010DCE0(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_1001941D8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010DD48(_Unwind_Exception *a1)
{
}

uint64_t sub_10010DD5C(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_1001943F8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010DDC4(_Unwind_Exception *a1)
{
}

uint64_t sub_10010DDD8(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100194618;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010DE40(_Unwind_Exception *a1)
{
}

uint64_t *sub_10010DE54(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(v4 + 8);
  char v6 = (char *)(*(void *)v4 + 16 * v5);
  if (v5 == *(void *)(v4 + 16))
  {
    sub_1000B144C((void **)v4, v6, 1LL, a2, &v8);
  }

  else
  {
    *(_OWORD *)char v6 = *a2;
    ++*(void *)(v4 + 8);
  }

  return a1;
}

void *sub_10010DEBC(void *result)
{
  uint64_t v1 = result;
  uint64_t v2 = result[1];
  if (v2)
  {
    uint64_t result = (void *)*result;
    do
    {
      uint64_t v3 = result[7];
      if (v3) {
        *(void *)(v3 + 32) = 0LL;
      }
      --v2;
      uint64_t result = (void *)(sub_100006224((uint64_t)result) + 64);
    }

    while (v2);
  }

  v1[1] = 0LL;
  return result;
}

uint64_t sub_10010DF04(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100194838;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010DF6C(_Unwind_Exception *a1)
{
}

void *sub_10010DF80(void *__dst, __int128 *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10000AD88(__dst, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v10 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)__dst = v10;
  }

  uint64_t v11 = a4[1];
  __dst[4] = *a4;
  __dst[3] = a3;
  __dst[5] = v11;
  if (v11)
  {
    int v12 = (unint64_t *)(v11 + 8);
    do
      unint64_t v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }

  int v14 = *((char *)a2 + 23);
  if (v14 >= 0) {
    uint64_t v15 = (char *)a2;
  }
  else {
    uint64_t v15 = *(char **)a2;
  }
  if (v14 >= 0) {
    uint64_t v16 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    uint64_t v16 = *((void *)a2 + 1);
  }
  __dst[6] = sub_100120C80(v15, v16);
  __dst[7] = v17;
  __dst[8] = a5;
  return __dst;
}

void sub_10010E038(_Unwind_Exception *a1)
{
}

AAByteStream *sub_10010E05C(uint64_t a1, char *a2, uint64_t a3, uint8_t **a4)
{
  if (a2[23] >= 0) {
    char v6 = a2;
  }
  else {
    char v6 = *(char **)a2;
  }
  *(void *)&__int128 v11 = AAS3DownloadStreamOpen(v6, 0LL, 0LL, 0);
  sub_1000EE6D8(&v14, &v11);
  sub_1000EE7AC(&v13, &v14);
  sub_1000EE7DC(&v13, *a4, 0x20uLL);
  sub_1000EE710(&v14, &v13, 0xFFFFFFFFFFFFFFFFLL, 0x4000000000000000uLL, 0, (uint64_t *)&v12);
  sub_100100A58(&v14, (uint64_t *)&v13, &v12, &v11);
  sub_1000198A4(a1 + 40, &v11);
  uint64_t v7 = (std::__shared_weak_count *)*((void *)&v11 + 1);
  if (*((void *)&v11 + 1))
  {
    uint64_t v8 = (unint64_t *)(*((void *)&v11 + 1) + 8LL);
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  sub_1000EE6DC(&v12);
  sub_1000EE7B0(&v13);
  return sub_1000EE6DC(&v14);
}

void sub_10010E160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  AAByteStream v4 = va_arg(va1, AAByteStream);
  va_copy(va2, va1);
  AEAContext v6 = va_arg(va2, AEAContext);
  sub_1000EE6DC((AAByteStream *)va);
  sub_1000EE7B0((AEAContext *)va1);
  sub_1000EE6DC((AAByteStream *)va2);
  _Unwind_Resume(a1);
}

void *sub_10010E198(void *a1, char **a2, uint64_t a3, uint8_t **a4)
{
  uint64_t v7 = sub_10011EBA0(a1);
  *(_OWORD *)(v7 + 3) = 0u;
  uint64_t v9 = (uint64_t)(v7 + 3);
  *(_OWORD *)(v7 + 5) = 0u;
  __int128 v10 = v7 + 5;
  *uint64_t v7 = off_100194B58;
  __int128 v11 = *a2;
  AAByteStream v12 = a4[1];
  v25[0] = *a4;
  v25[1] = v12;
  if (v12)
  {
    AEAContext v13 = (unint64_t *)(v12 + 8);
    do
      unint64_t v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }

  sub_10010E05C((uint64_t)a1, v11, v8, v25);
  if (v12)
  {
    uint64_t v15 = (unint64_t *)(v12 + 8);
    do
      unint64_t v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      (*(void (**)(uint8_t *))(*(void *)v12 + 16LL))(v12);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v12);
    }
  }

  uint64_t v17 = (__int128 *)*a2;
  uint64_t v23 = sub_1000EEA98(*v10);
  uint64_t v22 = sub_1000EEA8C(*v10);
  sub_10010E52C(v17, (uint64_t *)&v23, a4, (uint64_t *)&v22, &v24);
  sub_1000198A4(v9, &v24);
  uint64_t v18 = (std::__shared_weak_count *)*((void *)&v24 + 1);
  if (*((void *)&v24 + 1))
  {
    uint64_t v19 = (unint64_t *)(*((void *)&v24 + 1) + 8LL);
    do
      unint64_t v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  return a1;
}

void sub_10010E2DC(_Unwind_Exception *a1)
{
  __int128 v5 = *(std::__shared_weak_count **)(v1 + 16);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  _Unwind_Resume(a1);
}

ssize_t sub_10010E31C(uint64_t a1, uint64_t a2)
{
  return sub_1000EEAA4(*(void *)(a1 + 40), *(void **)a2, *(void *)(a2 + 16), *(void *)(a2 + 24));
}

void sub_10010E344(void *a1)
{
  uint64_t v1 = sub_10010E3E0(a1);
  operator delete(v1);
}

uint64_t sub_10010E358()
{
  return 4294967251LL;
}

uint64_t sub_10010E360(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 24) + 24LL);
}

uint64_t sub_10010E36C()
{
  return 0LL;
}

uint64_t sub_10010E374()
{
  return 4294967251LL;
}

void *sub_10010E37C(uint64_t a1, void *a2)
{
  return sub_10000552C(a2, (uint64_t)"knox", 4LL);
}

double sub_10010E390@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  double result = v4[0];
  *a2 = *(_OWORD *)v4;
  return result;
}

uint64_t sub_10010E3CC()
{
  return 4294967251LL;
}

uint64_t sub_10010E3D4(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 24) + 48LL);
}

void *sub_10010E3E0(void *a1)
{
  *a1 = off_100194B58;
  sub_100006224((uint64_t)(a1 + 5));
  sub_100006224((uint64_t)(a1 + 3));
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void sub_10010E424(uint64_t a1@<X1>, void *a2@<X8>)
{
  AAByteStream v4 = operator new(0x50uLL);
  sub_10010E484(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  sub_10001C350((uint64_t)a2, v4 + 4, (uint64_t)(v4 + 3));
}

void sub_10010E470(_Unwind_Exception *a1)
{
}

void *sub_10010E484(void *a1, uint64_t a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_1001895C0;
  sub_10010E4CC(a1 + 3, a2);
  return a1;
}

void sub_10010E4B8(_Unwind_Exception *a1)
{
}

void *sub_10010E4CC(void *a1, uint64_t a2)
{
  AAByteStream v4 = sub_10011EBA0(a1);
  *AAByteStream v4 = off_100194B58;
  *(_OWORD *)(v4 + 5) = 0u;
  __int128 v5 = v4 + 5;
  *(_OWORD *)(v4 + 3) = 0u;
  sub_10001C610(v4 + 3, (uint64_t *)(a2 + 24));
  sub_10001C610(v5, (uint64_t *)(a2 + 40));
  return a1;
}

void *sub_10010E52C@<X0>( __int128 *a1@<X1>, uint64_t *a2@<X2>, void *a3@<X3>, uint64_t *a4@<X4>, void *a5@<X8>)
{
  __int128 v10 = operator new(0x60uLL);
  double result = sub_10010E5A4(v10, a1, a2, a3, a4);
  *a5 = v10 + 3;
  a5[1] = v10;
  return result;
}

void sub_10010E590(_Unwind_Exception *a1)
{
}

void *sub_10010E5A4(void *a1, __int128 *a2, uint64_t *a3, void *a4, uint64_t *a5)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_100194C30;
  sub_10010DF80(a1 + 3, a2, *a3, a4, *a5);
  return a1;
}

void sub_10010E5E0(_Unwind_Exception *a1)
{
}

void sub_10010E5F4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100194C30;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10010E604(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100194C30;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void sub_10010E624(uint64_t a1)
{
}

void sub_10010E630(uint64_t a1)
{
}

void sub_10010E66C(void *a1@<X0>, char a2@<W1>, char **a3@<X8>)
{
  id v5 = a1;
  a3[1] = 0LL;
  a3[2] = 0LL;
  *a3 = 0LL;
  id v53 = v5;
  AEAContext v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeNode]);
  if (v6)
  {
    unsigned int v7 = 3;
    do
    {
      if ([v6 isCache])
      {
        uint64_t v9 = 2LL;
        uint64_t v10 = 1LL;
      }

      else
      {
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v6 parent]);
        if (v11) {
          uint64_t v10 = v7;
        }
        else {
          uint64_t v10 = 0LL;
        }

        uint64_t v9 = 0LL;
      }

      if (*a3 == a3[1] && (a2 & 1) == 0)
      {
        uint64_t v9 = 1LL;
        if ((_DWORD)v10)
        {
          if ((_DWORD)v10 != 3)
          {
            exception = __cxa_allocate_exception(0x40uLL);
            uint64_t error_code = make_error_code(150LL);
            void *exception = &off_100196FC8;
            exception[1] = error_code;
            exception[2] = v52;
            *((_BYTE *)exception + 24) = 0;
            *((_BYTE *)exception + 48) = 0;
            exception[7] = "Stack with cache as top image cannot be opened for writing.";
          }
        }
      }

      uint64_t v12 = objc_opt_class(&OBJC_CLASS___DiskImageGraphNodeNative, v8);
      if ((objc_opt_isKindOfClass(v6, v12) & 1) != 0)
      {
        id v13 = (id)objc_claimAutoreleasedReturnValue([v6 filePath]);
        id v14 = objc_claimAutoreleasedReturnValue([v13 path]);
        v54 = (char *)[v14 UTF8String];
        sub_10010F11C(&v55, &v54);
        else {
          std::string __dst = v55;
        }
        v26 = operator new(0x40uLL);
        __p = 0LL;
        int64x2_t v58 = 0uLL;
        diskimage_uio::stack_image_node::stack_image_node(v26, v10, v9, &__dst, &__p, 0LL);
        if (v58.i8[15] < 0) {
          operator delete(__p);
        }
        v28 = a3[1];
        unint64_t v27 = (unint64_t)a3[2];
        if ((unint64_t)v28 >= v27)
        {
          uint64_t v30 = (v28 - *a3) >> 3;
          uint64_t v31 = v27 - (void)*a3;
          uint64_t v32 = v31 >> 2;
          else {
            unint64_t v33 = v32;
          }
          v60 = a3 + 2;
          if (v33) {
            v34 = (char *)sub_1000450A4((uint64_t)(a3 + 2), v33);
          }
          else {
            v34 = 0LL;
          }
          v35 = &v34[8 * v30];
          v36 = &v34[8 * v33];
          v59 = v36;
          *(void *)v35 = v26;
          v29 = v35 + 8;
          v58.i64[1] = (uint64_t)(v35 + 8);
          v38 = *a3;
          v37 = a3[1];
          if (v37 == *a3)
          {
            int64x2_t v40 = vdupq_n_s64((unint64_t)v37);
          }

          else
          {
            do
            {
              uint64_t v39 = *((void *)v37 - 1);
              v37 -= 8;
              *(void *)v37 = 0LL;
              *((void *)v35 - 1) = v39;
              v35 -= 8;
            }

            while (v37 != v38);
            int64x2_t v40 = *(int64x2_t *)a3;
            v29 = (char *)v58.i64[1];
            v36 = v59;
          }

          *a3 = v35;
          a3[1] = v29;
          int64x2_t v58 = v40;
          v41 = a3[2];
          a3[2] = v36;
          v59 = v41;
          __p = (void *)v40.i64[0];
          sub_100055FC0((uint64_t)&__p);
        }

        else
        {
          *(void *)v28 = v26;
          v29 = v28 + 8;
        }

        a3[1] = v29;
      }

      else
      {
        id v13 = v6;
        id v15 = objc_claimAutoreleasedReturnValue([v13 pluginName]);
        sub_100006174(&__dst, (char *)[v15 UTF8String]);

        unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 pluginParams]);
        uint64_t v17 = operator new(0x40uLL);
        sub_100006174(&__p, "");
        diskimage_uio::stack_image_node::stack_image_node(v17, v10, v9, &__p, &__dst, v16);
        if (v58.i8[15] < 0) {
          operator delete(__p);
        }
        uint64_t v19 = a3[1];
        unint64_t v18 = (unint64_t)a3[2];
        if ((unint64_t)v19 >= v18)
        {
          uint64_t v21 = (v19 - *a3) >> 3;
          uint64_t v22 = v18 - (void)*a3;
          uint64_t v23 = v22 >> 2;
          else {
            unint64_t v24 = v23;
          }
          v60 = a3 + 2;
          if (v24) {
            __int16 v25 = (char *)sub_1000450A4((uint64_t)(a3 + 2), v24);
          }
          else {
            __int16 v25 = 0LL;
          }
          v42 = &v25[8 * v21];
          v43 = &v25[8 * v24];
          v59 = v43;
          *(void *)v42 = v17;
          unint64_t v20 = v42 + 8;
          v58.i64[1] = (uint64_t)(v42 + 8);
          v45 = *a3;
          v44 = a3[1];
          if (v44 == *a3)
          {
            int64x2_t v47 = vdupq_n_s64((unint64_t)v44);
          }

          else
          {
            do
            {
              uint64_t v46 = *((void *)v44 - 1);
              v44 -= 8;
              *(void *)v44 = 0LL;
              *((void *)v42 - 1) = v46;
              v42 -= 8;
            }

            while (v44 != v45);
            int64x2_t v47 = *(int64x2_t *)a3;
            unint64_t v20 = (char *)v58.i64[1];
            v43 = v59;
          }

          *a3 = v42;
          a3[1] = v20;
          int64x2_t v58 = v47;
          v48 = a3[2];
          a3[2] = v43;
          v59 = v48;
          __p = (void *)v47.i64[0];
          sub_100055FC0((uint64_t)&__p);
        }

        else
        {
          *(void *)uint64_t v19 = v17;
          unint64_t v20 = v19 + 8;
        }

        a3[1] = v20;
      }

      uint64_t v49 = objc_claimAutoreleasedReturnValue([v6 parent]);
      unsigned int v7 = 2;
      AEAContext v6 = (void *)v49;
    }

    while (v49);
  }
}

void sub_10010EAE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20, __int16 a21, char a22, char a23, void *a24, uint64_t a25, int a26, __int16 a27, char a28, char a29)
{
  _Unwind_Resume(a1);
}

void sub_10010EC08(uint64_t a1@<X0>, uint64_t *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  unsigned int v7 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:closeOnDealloc:",  a1,  0LL);
  id v39 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSFileHandle readDataUpToLength:error:](v7, "readDataUpToLength:error:", 0x100000LL, &v39));
  id v9 = v39;
  if (!v8)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    uint64_t error_code = make_error_code(154LL);
    void *exception = &off_100196FC8;
    exception[1] = error_code;
    exception[2] = v20;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 48) = 0;
    exception[7] = "Failed to read from fd.";
  }

  id v38 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v8,  0LL,  v40,  &v38));
  id v11 = v38;

  if (v10 && (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12), (objc_opt_isKindOfClass(v10, v13) & 1) != 0))
  {
    if (*((char *)a2 + 23) < 0)
    {
      if (!a2[1]) {
        goto LABEL_14;
      }
      a2 = (uint64_t *)*a2;
    }

    else if (!*((_BYTE *)a2 + 23))
    {
LABEL_14:
      uint64_t v21 = __cxa_allocate_exception(0x40uLL);
      uint64_t v22 = std::generic_category();
      *uint64_t v21 = &off_100196FC8;
      v21[1] = 22LL;
      v21[2] = v22;
      *((_BYTE *)v21 + 24) = 0;
      *((_BYTE *)v21 + 48) = 0;
      v21[7] = "Cannot initialize pstack disk image without path.";
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  a2,  +[NSString defaultCStringEncoding](&OBJC_CLASS___NSString, "defaultCStringEncoding")));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v14));

    id v37 = v11;
    unint64_t v16 = -[DiskImageGraph initWithData:pstackURL:imported:error:]( objc_alloc(&OBJC_CLASS___DiskImageGraph),  "initWithData:pstackURL:imported:error:",  v10,  v15,  0LL,  &v37);
    id v17 = v37;

    if (!v16)
    {
      int v23 = *__error();
      if (sub_1000BE2F0())
      {
        uint64_t v36 = 0LL;
        uint64_t v24 = sub_1000BE278();
        __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
        unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v17 description]);
        if (v26) {
          uint64_t v28 = 3LL;
        }
        else {
          uint64_t v28 = 2LL;
        }
        *(_DWORD *)buf = 68158210;
        int v42 = 127;
        __int16 v43 = 2080;
        v44 = "std::vector<diskimage_uio::stack_image_node_ptr_t> create_stack_vector_from_single_fd(int, const std::file"
              "system::path &, BOOL)";
        __int16 v45 = 2112;
        uint64_t v46 = v27;
        v29 = (char *)_os_log_send_and_compose_impl( v28,  &v36,  0LL,  0LL,  &_mh_execute_header,  v25,  16LL,  "%.*s: Failed to create graph from plist: %@.",  buf,  28);

        if (v29)
        {
          fprintf(__stderrp, "%s\n", v29);
          free(v29);
        }
      }

      else
      {
        uint64_t v30 = sub_1000BE278();
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v17 description]);
          *(_DWORD *)buf = 68158210;
          int v42 = 127;
          __int16 v43 = 2080;
          v44 = "std::vector<diskimage_uio::stack_image_node_ptr_t> create_stack_vector_from_single_fd(int, const std::fi"
                "lesystem::path &, BOOL)";
          __int16 v45 = 2112;
          uint64_t v46 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%.*s: Failed to create graph from plist: %@.",  buf,  0x1Cu);
        }
      }

      *__error() = v23;
      unint64_t v33 = __cxa_allocate_exception(0x40uLL);
      uint64_t v34 = make_error_code(161LL);
      *unint64_t v33 = &off_100196FC8;
      v33[1] = v34;
      v33[2] = v35;
      *((_BYTE *)v33 + 24) = 0;
      *((_BYTE *)v33 + 48) = 0;
      v33[7] = "Failed to create graph from plist.";
    }

    sub_10010E66C(v16, a3, (char **)a4);

    id v11 = v17;
  }

  else
  {
    *(void *)a4 = 0LL;
    *(void *)(a4 + 8) = 0LL;
    *(void *)(a4 + 16) = 0LL;
  }
}

void sub_10010F070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

std::string *sub_10010F11C(std::string *this, char **a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__l.__cap_ = 0LL;
  uint64_t v3 = *a2;
  AAByteStream v4 = v3 - 1;
  while (*++v4)
    ;
  sub_100061F5C(this, v3, v4);
  return this;
}

void sub_10010F15C(_Unwind_Exception *exception_object)
{
}

uint64_t sub_10010F178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = a3;
  unsigned int v4 = sub_100098750(a3, a2);
  if ((v4 & 0x80000000) != 0)
  {
    unsigned int v6 = v4;
    exception = __cxa_allocate_exception(0x40uLL);
    uint64_t v8 = (void *)sub_100004494((uint64_t)exception, (uint64_t)"Failed to subscribe to the plugin's IO ring", v6);
  }

  *(_DWORD *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_10010F1DC(uint64_t a1)
{
  return a1;
}

uint64_t sub_10010F214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  LODWORD(v18[0]) = io_rings_get_max_version(0LL, 0);
  HIDWORD(v18[0]) = 48;
  v18[1] = 0LL;
  v18[2] = sub_10010F5B4;
  uint64_t v19 = 0LL;
  uint64_t v20 = a3;
  uint64_t v21 = a4;
  uint64_t v17 = 0LL;
  unsigned int v8 = io_rings_setup(0x100u, (uint64_t)v18, &v17);
  if (v8)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    id v14 = (void *)sub_100004494((uint64_t)exception, (uint64_t)"Failed to setup the plugin's IO ring", v8);
  }

  v18[0] = &off_100194EA0;
  uint64_t v19 = v18;
  *(void *)(a1 + 8) = v17;
  sub_10010FD84(a1 + 16, (uint64_t)v18);
  id v9 = v19;
  if (v19 == v18)
  {
    uint64_t v10 = 4LL;
    id v9 = v18;
  }

  else
  {
    if (!v19) {
      goto LABEL_7;
    }
    uint64_t v10 = 5LL;
  }

  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_7:
  *(void *)(a1 + 48) = *(void *)(*(void *)(a1 + 8) + 24LL);
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(a2 + 56))(a2);
  if (!v11)
  {
    id v15 = __cxa_allocate_exception(0x40uLL);
    *id v15 = &off_100196FC8;
    unint64_t v16 = std::generic_category();
    v15[1] = 4294967284LL;
    v15[2] = v16;
    *((_BYTE *)v15 + 24) = 0;
    *((_BYTE *)v15 + 48) = 0;
    v15[7] = "Cannot get subscriber from plugin";
  }

  sub_10010F178(a1 + 56, v11, *(void *)(a1 + 48));
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 88) = 1018212795LL;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(void *)(a1 + 128) = 0LL;
  *(void *)(a1 + 136) = 850045863LL;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(void *)(a1 + 192) = 0LL;
  return a1;
}

void sub_10010F3F8(_Unwind_Exception *exception_object)
{
}

uint64_t sub_10010F418(uint64_t a1)
{
  return a1;
}

double sub_10010F474(uint64_t a1)
{
  unsigned int v1 = atomic_load((unsigned int *)(a1 + 76));
  uint64_t v2 = (unsigned int *)(a1 + 72);
  unsigned int v3 = atomic_load((unsigned int *)(a1 + 72));
  if (v3 - v1 < *(_DWORD *)(*(void *)(a1 + 8) + 8LL))
  {
    do
    {
      while (1)
      {
        unsigned int v4 = __ldaxr(v2);
        if (v4 == v3) {
          break;
        }
        __clrex();
        unsigned int v5 = atomic_load((unsigned int *)(a1 + 76));
        unsigned int v6 = v4 - v5;
        unsigned int v3 = v4;
        if (v6 >= *(_DWORD *)(*(void *)(a1 + 8) + 8LL)) {
          return result;
        }
      }
    }

    while (__stlxr(v3 + 1, v2));
    return io_rings_sqe_allocate(*(void *)(a1 + 48));
  }

  return result;
}

void sub_10010F4F8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t cqe = io_rings_get_cqe(*(void *)(a1 + 48));
  if ((v5 & 0x100000000LL) != 0)
  {
    uint64_t v7 = cqe;
    uint64_t v8 = v5;
    id v9 = (unsigned int *)(a1 + 76);
    do
      unsigned int v10 = __ldaxr(v9);
    while (__stlxr(v10 + 1, v9));
    if (atomic_load((unint64_t *)(a1 + 80)))
    {
      unsigned int v12 = atomic_load((unsigned int *)(a1 + 72));
      if (v10 + 1 == v12)
      {
        std::mutex::lock((std::mutex *)(a1 + 136));
        std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
        std::mutex::unlock((std::mutex *)(a1 + 136));
      }
    }

    *(void *)a2 = v7;
    *(void *)(a2 + 8) = v8;
    char v6 = 1;
  }

  else
  {
    char v6 = 0;
    *(_BYTE *)a2 = 0;
  }

  *(_BYTE *)(a2 + 16) = v6;
}

uint64_t sub_10010F5A8(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(result + 64);
  return result;
}

uint64_t sub_10010F5B4(uint64_t a1)
{
  uint64_t overruns = io_rings_cq_get_overruns(a1);
  *(void *)&__int128 v4 = "di_plugin_cq_event_callback(io_uhandle_t, void *, enum io_rings_event_type_t, struct io_rings_event_type_data_t *)";
  *((void *)&v4 + 1) = 27LL;
  int v5 = 16;
  sub_10010F674(v6, &v4);
  std::ostream::operator<<(&v7, overruns);
  sub_10000552C(&v7, (uint64_t)" overrun events occurred in the plugin's ring!", 46LL);
  std::ostream::~ostream(&v7, off_100194D50);
  sub_10010F7D8((uint64_t)v6);
  std::ios::~ios(&v8);
  return io_rings_cq_clear_overruns(a1);
}

void sub_10010F660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *sub_10010F674(void *a1, __int128 *a2)
{
  unsigned int v3 = (std::ios_base *)(a1 + 46);
  sub_10010F75C((uint64_t)a1, a2);
  *a1 = off_100194C88;
  a1[45] = &off_100194D88;
  a1[46] = &off_100194DB0;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_100194C88;
  a1[45] = off_100194D10;
  a1[46] = off_100194D38;
  return a1;
}

void sub_10010F6F8(_Unwind_Exception *a1)
{
}

uint64_t sub_10010F71C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10010F75C(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100194E20;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10010F7C4(_Unwind_Exception *a1)
{
}

uint64_t sub_10010F7D8(uint64_t a1)
{
  *(void *)a1 = off_100194E20;
  sub_10010FA50(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

void sub_10010F874(char *a1)
{
}

uint64_t sub_10010F8B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10010F8EC(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

uint64_t sub_10010F938(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100194D50);
  sub_10010F7D8(v2);
  return std::ios::~ios(a1 + 8);
}

void sub_10010F970(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100194D50);
  sub_10010F7D8((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

uint64_t sub_10010F9B0(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100194D50);
  sub_10010F7D8(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10010F9F0(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100194D50);
  sub_10010F7D8((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

void sub_10010FA3C(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10010F7D8(a1);
  operator delete(v1);
}

uint64_t sub_10010FA50(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10010FBA0((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10010FB78( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

int *sub_10010FBA0(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      unsigned int v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 57LL;
    __int16 v25 = 2082;
    BOOL v26 = v10;
    uint64_t v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      unsigned int v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        unint64_t v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 57LL;
      __int16 v25 = 2082;
      BOOL v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  double result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10010FD84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24LL))(*v3, a1);
      return a1;
    }

    *(void *)(a1 + 24) = v4;
  }

  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }

  *uint64_t v3 = 0LL;
  return a1;
}

uint64_t *sub_10010FDE8(uint64_t *a1)
{
  uint64_t v2 = (uint64_t *)a1[4];
  if (v2 == a1 + 1)
  {
    uint64_t v3 = 4LL;
    uint64_t v2 = a1 + 1;
    goto LABEL_5;
  }

  if (v2)
  {
    uint64_t v3 = 5LL;
LABEL_5:
    (*(void (**)(void))(*v2 + 8 * v3))();
  }

  return a1;
}

uint64_t *sub_10010FE40(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  int *result = a2;
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v3 = result[4];
    if (!v3) {
      sub_100014B10();
    }
    return (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v3 + 48LL))(v3, &v4);
  }

  return result;
}

void *sub_10010FE94()
{
  double result = operator new(0x10uLL);
  void *result = &off_100194EA0;
  return result;
}

void sub_10010FEB8(uint64_t a1, void *a2)
{
  *a2 = &off_100194EA0;
}

uint64_t sub_10010FED0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)a2 + 32LL))();
}

uint64_t sub_10010FEDC(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

_UNKNOWN **sub_10010FF18()
{
}

uint64_t sub_10010FF24(uint64_t a1, uint64_t a2)
{
  size_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v3 + v4 <= *(void *)(a1 + 72))
  {
    memcpy((void *)(*(void *)(a1 + 64) + v4), *(const void **)a2, v3);
    return *(unsigned int *)(a2 + 16);
  }

  else
  {
    *(void *)&__int128 v6 = "int Ram::write(const sg_entry &)";
    *((void *)&v6 + 1) = 14LL;
    int v7 = 16;
    sub_100110040(v8, &v6);
    sub_10000552C(&v9, (uint64_t)"Trying to write @ ", 18LL);
    std::ostream::operator<<(&v9, *(void *)(a2 + 24));
    sub_10000552C(&v9, (uint64_t)" ", 1LL);
    std::ostream::operator<<(&v9, *(void *)(a2 + 16));
    sub_10000552C(&v9, (uint64_t)"bytes, which is after end of ramdisk", 36LL);
    std::ostream::~ostream(&v9, off_1001950D8);
    sub_1001105F4((uint64_t)v8);
    std::ios::~ios(&v10);
    return 4294967274LL;
  }

void sub_100110024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *sub_100110040(void *a1, __int128 *a2)
{
  size_t v3 = (std::ios_base *)(a1 + 46);
  sub_100110FC4((uint64_t)a1, a2);
  *a1 = off_100195010;
  a1[45] = &off_100195110;
  a1[46] = &off_100195138;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_100195010;
  a1[45] = off_100195098;
  a1[46] = off_1001950C0;
  return a1;
}

void sub_1001100C4(_Unwind_Exception *a1)
{
}

uint64_t sub_1001100E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100110128(uint64_t a1, uint64_t a2)
{
  size_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v3 + v4 <= *(void *)(a1 + 72))
  {
    memcpy(*(void **)a2, (const void *)(*(void *)(a1 + 64) + v4), v3);
    return *(unsigned int *)(a2 + 16);
  }

  else
  {
    *(void *)&__int128 v6 = "int Ram::read(const sg_entry &)";
    *((void *)&v6 + 1) = 13LL;
    int v7 = 16;
    sub_100110248(v8, &v6);
    sub_10000552C(&v9, (uint64_t)"Trying to read @ ", 17LL);
    std::ostream::operator<<(&v9, *(void *)(a2 + 24));
    sub_10000552C(&v9, (uint64_t)" ", 1LL);
    std::ostream::operator<<(&v9, *(void *)(a2 + 16));
    sub_10000552C(&v9, (uint64_t)"bytes, which is after end of ramdisk", 36LL);
    std::ostream::~ostream(&v9, off_1001952F8);
    sub_100110BA0((uint64_t)v8);
    std::ios::~ios(&v10);
    return 4294967274LL;
  }

void sub_10011022C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *sub_100110248(void *a1, __int128 *a2)
{
  size_t v3 = (std::ios_base *)(a1 + 46);
  sub_100111040((uint64_t)a1, a2);
  *a1 = off_100195230;
  a1[45] = &off_100195330;
  a1[46] = &off_100195358;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_100195230;
  a1[45] = off_1001952B8;
  a1[46] = off_1001952E0;
  return a1;
}

void sub_1001102CC(_Unwind_Exception *a1)
{
}

uint64_t sub_1001102F0(uint64_t a1)
{
  return a1;
}

void sub_100110334(void *a1)
{
  uint64_t v1 = sub_100110F88(a1);
  operator delete(v1);
}

uint64_t sub_100110348()
{
  return 0LL;
}

uint64_t sub_100110350(void *a1, unint64_t a2, uint64_t a3)
{
  if (a3 == -1) {
    return 0LL;
  }
  unint64_t v3 = a1[12];
  unint64_t v4 = (a2 + v3 - 1) / v3 * v3;
  if (a2 > v4 || v4 >= a3 + a2) {
    return 0LL;
  }
  unint64_t v6 = a2 - v4 + a3;
  size_t v7 = v6 / v3 * v3;
  if (v6 == v6 % v3) {
    return 0LL;
  }
  uint64_t v8 = 4294967262LL;
  if (__CFADD__(v4, v7)) {
    return v8;
  }
  unint64_t v10 = a1[9];
  if (v4 > v10 || v7 + v4 > v10) {
    return v8;
  }
  return madvise((void *)(a1[8] + v4), v7, 5);
}

uint64_t sub_1001103D4()
{
  return 1LL;
}

uint64_t sub_1001103DC(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

uint64_t sub_1001103E4()
{
  return 1LL;
}

uint64_t sub_1001103EC(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 72) < a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 72) = a2;
  return result;
}

void *sub_100110410(uint64_t a1, void *a2)
{
  return sub_10000552C(a2, (uint64_t)"ram", 3LL);
}

uint64_t sub_100110424(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

uint64_t sub_100110430(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_1001950D8);
  sub_1001105F4(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_100110468(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_1001950D8);
  sub_1001105F4(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_1001104A8(char *a1)
{
}

uint64_t sub_1001104EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_100110520(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10011056C(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_1001950D8);
  sub_1001105F4((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_1001105AC(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_1001950D8);
  sub_1001105F4((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_1001105F4(uint64_t a1)
{
  *(void *)a1 = off_1001951A8;
  sub_100110690(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_100110690(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_1001107F8((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_1001107B8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1001107E4(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1001105F4(a1);
  operator delete(v1);
}

int *sub_1001107F8(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      unint64_t v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 30LL;
    __int16 v25 = 2082;
    BOOL v26 = v10;
    uint64_t v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      unsigned int v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        unint64_t v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 30LL;
      __int16 v25 = 2082;
      BOOL v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_1001109DC(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_1001952F8);
  sub_100110BA0(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_100110A14(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_1001952F8);
  sub_100110BA0(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_100110A54(char *a1)
{
}

uint64_t sub_100110A98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_100110ACC(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_100110B18(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_1001952F8);
  sub_100110BA0((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_100110B58(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_1001952F8);
  sub_100110BA0((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_100110BA0(uint64_t a1)
{
  *(void *)a1 = off_1001953C8;
  sub_100110C3C(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_100110C3C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_100110DA4((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_100110D64( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100110D90(uint64_t a1)
{
  uint64_t v1 = (void *)sub_100110BA0(a1);
  operator delete(v1);
}

int *sub_100110DA4(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      unint64_t v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 42LL;
    __int16 v25 = 2082;
    BOOL v26 = v10;
    uint64_t v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      unsigned int v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        unint64_t v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 42LL;
      __int16 v25 = 2082;
      BOOL v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

void *sub_100110F88(void *a1)
{
  *a1 = off_100194F30;
  sub_100043BCC(a1 + 3);
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

uint64_t sub_100110FC4(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_1001951A8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10011102C(_Unwind_Exception *a1)
{
}

uint64_t sub_100111040(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_1001953C8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_1001110A8(_Unwind_Exception *a1)
{
}

uint64_t sub_1001110BC(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void sub_1001136C4(_Unwind_Exception *a1)
{
}

uint64_t sub_1001136F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100113700(uint64_t a1)
{
}

void sub_100113708(void *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___DiskImageGraphNodeNative, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    id v9 = v6;
    unint64_t v10 = (void *)a1[4];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 filePath]);
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:v12]);

    os_log_type_t v14 = (void *)a1[5];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 filePath]);
    uint64_t v16 = *(void *)(a1[6] + 8LL);
    id obj = *(id *)(v16 + 40);
    LOBYTE(v14) = [v14 copyItemAtURL:v15 toURL:v13 error:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);

    else {
      *a4 = 1;
    }
  }

  else
  {
    *a4 = 1;
    uint64_t v17 = *(void *)(a1[6] + 8LL);
    id v20 = *(id *)(v17 + 40);
    +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  45LL,  @"Clone of plugin nodes is not supported.",  &v20);
    id v18 = v20;
    id v9 = *(id *)(v17 + 40);
    *(void *)(v17 + 40) = v18;
  }
}

id sub_100113870(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeItemAtURL:a2 error:0];
}

void sub_100113DB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100113DCC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 URLByDeletingLastPathComponent]);
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[DiskImageGraphNode GraphNodeWithDictionary:updateChangesToDict:workDir:error:]( &OBJC_CLASS___DiskImageGraphNode,  "GraphNodeWithDictionary:updateChangesToDict:workDir:error:",  v8,  v6,  v9,  &obj));

  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    unsigned int v12 = *(void **)(a1 + 40);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 UUID]);
    os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    [v12 setObject:v11 forKey:v14];
  }

  else
  {
    *a4 = 1;
  }
}

void sub_100113FA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100113FC0(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v15 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v15 parentUUID]);

  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v15 parentUUID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v9]);

    if (v10)
    {
      [v15 setParent:v10];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v15 parent]);
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 children]);
      [v12 addObject:v15];
    }

    else
    {
      *a4 = 1;
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[DIError errorWithPOSIXCode:verboseInfo:]( &OBJC_CLASS___DIError,  "errorWithPOSIXCode:verboseInfo:",  22LL,  @"Missing parent node in graph."));
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v11 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
}

void sub_1001144A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_1001144B8(uint64_t a1, uint64_t a2, void *a3)
{
  char v4 = (void *)objc_claimAutoreleasedReturnValue([a3 tag]);
  id v5 = [v4 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  return v5;
}

uint64_t sub_100114BDC(uint64_t a1, _DWORD *a2)
{
  *(_DWORD *)a1 = 1919118949;
  int v6 = 1919118949;
  sub_100019FE4((uint64_t)"sig1_t", 1919118949, &v6, 1LL);
  *(_DWORD *)(a1 + 4) = 1634952291;
  int v6 = 1634952291;
  sub_100019FE4((uint64_t)"sig2_t", 1634952291, &v6, 1LL);
  *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = 2;
  int v6 = 2;
  sub_100019FE4((uint64_t)"version_t", 2, &v6, 1LL);
  *(_DWORD *)(a1 + 12) = 16;
  int v6 = 16;
  sub_100019FE4((uint64_t)"iv_size_t", 16, &v6, 1LL);
  *(_DWORD *)(a1 + 16) = 5;
  int v6 = 5;
  sub_100019FE4((uint64_t)"encryption_mode", 5, &v6, 1LL);
  *(_DWORD *)(a1 + 20) = -2147483647;
  int v6 = -2147483647;
  sub_100019FE4((uint64_t)"algorithm_type", -2147483647, &v6, 1LL);
  *(_DWORD *)(a1 + 24) = *a2;
  *(_DWORD *)(a1 + 2_Block_object_dispose(va, 8) = 91;
  int v6 = 91;
  sub_100019FE4((uint64_t)"prng_algorithm_type", 91, &v6, 1LL);
  *(_DWORD *)(a1 + 32) = 160;
  int v6 = 160;
  sub_100019FE4((uint64_t)"prng_key_bits_size_t", 160, &v6, 1LL);
  *(_DWORD *)(a1 + 52) = 512;
  *(_OWORD *)(a1 + 56) = xmmword_10014D340;
  *(_DWORD *)(a1 + 72) = 0;
  *(void *)(a1 + 36) = sub_100120D7C();
  *(void *)(a1 + 44) = v4;
  return a1;
}

uint64_t sub_100114D64(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 52) = 0LL;
  *(void *)(a1 + 6_Block_object_dispose(va, 8) = 0LL;
  *(void *)(a1 + 60) = 0LL;
  unint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40LL))(a2);
  if (v4 >= 0xC
    && (sub_100042FD0(a2, (uint64_t)v25, 12LL, v4 - 12) & 0x80000000) == 0
    && v25[0] == 0x1000000
    && v25[1] == 1634952291
    && v25[2] == 1919118949)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    uint64_t v24 = (void *)sub_100004494( (uint64_t)exception,  (uint64_t)"The image is encrypted with obsolete encoding version 1",  0xA0u);
  }

  if ((unint64_t)(*(uint64_t (**)(uint64_t))(*(void *)a2 + 40LL))(a2) <= 0x4B)
  {
    id v18 = __cxa_allocate_exception(0x20uLL);
    uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40LL))(a2);
    *id v18 = &off_10018E820;
    v18[1] = "crypto";
    v18[2] = 76LL;
    void v18[3] = v19;
  }

  id v5 = (char *)operator new[](0x4CuLL);
  *(_OWORD *)(v5 + 60) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  *(_OWORD *)id v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  unsigned int v6 = sub_100042FD0(a2, (uint64_t)v5, 76LL, 0LL);
  if ((v6 & 0x80000000) != 0)
  {
    id v20 = __cxa_allocate_exception(0x40uLL);
    *id v20 = &off_100196FC8;
    __int16 v21 = std::generic_category();
    v20[1] = v6;
    uint64_t v22 = "Crypto: can't read crypto header";
    goto LABEL_13;
  }

  int v7 = *(_DWORD *)v5;
  LODWORD(v26) = 1919118949;
  sub_100019FE4((uint64_t)"sig1_t", v7, &v26, 1LL);
  *(_DWORD *)a1 = 1919118949;
  int v8 = *((_DWORD *)v5 + 1);
  LODWORD(v26) = 1634952291;
  sub_100019FE4((uint64_t)"sig2_t", v8, &v26, 1LL);
  *(_DWORD *)(a1 + 4) = 1634952291;
  int v9 = bswap32(*((_DWORD *)v5 + 2));
  LODWORD(v26) = 2;
  sub_100019FE4((uint64_t)"version_t", v9, &v26, 1LL);
  *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = v9;
  int v10 = bswap32(*((_DWORD *)v5 + 3));
  LODWORD(v26) = 16;
  sub_100019FE4((uint64_t)"iv_size_t", v10, &v26, 1LL);
  *(_DWORD *)(a1 + 12) = v10;
  int v11 = bswap32(*((_DWORD *)v5 + 4));
  LODWORD(v26) = 5;
  sub_100019FE4((uint64_t)"encryption_mode", v11, &v26, 1LL);
  *(_DWORD *)(a1 + 16) = v11;
  int v12 = bswap32(*((_DWORD *)v5 + 5));
  LODWORD(v26) = -2147483647;
  sub_100019FE4((uint64_t)"algorithm_type", v12, &v26, 1LL);
  *(_DWORD *)(a1 + 20) = v12;
  int v13 = bswap32(*((_DWORD *)v5 + 6));
  uint64_t v26 = 0x10000000080LL;
  sub_100019FE4((uint64_t)"encryption_key_bits_size_t", v13, &v26, 2LL);
  *(_DWORD *)(a1 + 24) = v13;
  int v14 = bswap32(*((_DWORD *)v5 + 7));
  LODWORD(v26) = 91;
  sub_100019FE4((uint64_t)"prng_algorithm_type", v14, &v26, 1LL);
  *(_DWORD *)(a1 + 2_Block_object_dispose(va, 8) = v14;
  int v15 = bswap32(*((_DWORD *)v5 + 8));
  LODWORD(v26) = 160;
  sub_100019FE4((uint64_t)"prng_key_bits_size_t", v15, &v26, 1LL);
  *(_DWORD *)(a1 + 32) = v15;
  *(_OWORD *)(a1 + 36) = *(_OWORD *)(v5 + 36);
  *(_DWORD *)(a1 + 52) = bswap32(*((_DWORD *)v5 + 13));
  *(int8x16_t *)(a1 + 56) = vrev64q_s8(*(int8x16_t *)(v5 + 56));
  unsigned int v16 = bswap32(*((_DWORD *)v5 + 18));
  *(_DWORD *)(a1 + 72) = v16;
  if (v16 - 2049 <= 0xFFFFF7FF)
  {
    id v20 = __cxa_allocate_exception(0x40uLL);
    *id v20 = &off_100196FC8;
    __int16 v21 = std::generic_category();
    v20[1] = 152LL;
    uint64_t v22 = "crypto header contains invalid number of auth entries";
LABEL_13:
    v20[2] = v21;
    *((_BYTE *)v20 + 24) = 0;
    *((_BYTE *)v20 + 4_Block_object_dispose(va, 8) = 0;
    v20[7] = v22;
  }

  operator delete[](v5);
  return a1;
}

void sub_100115160(_Unwind_Exception *a1)
{
}

void sub_100115170()
{
}

void sub_100115178(_Unwind_Exception *a1)
{
}

void sub_10011522C(uint64_t a1, ...)
{
}

void sub_100115278(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_1000052FC(a1);
  }
  _Unwind_Resume(a1);
}

__n128 sub_10011528C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 52) = 0LL;
  *(void *)(a1 + 6_Block_object_dispose(va, 8) = 0LL;
  *(void *)(a1 + 60) = 0LL;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 60) = *(_OWORD *)(a2 + 60);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1001152C8(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a2 = *(_DWORD *)a1;
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 4);
  *(_DWORD *)(a2 + _Block_object_dispose(va, 8) = bswap32(*(_DWORD *)(a1 + 8));
  *(_DWORD *)(a2 + 12) = bswap32(*(_DWORD *)(a1 + 12));
  *(_DWORD *)(a2 + 16) = bswap32(*(_DWORD *)(a1 + 16));
  *(_DWORD *)(a2 + 20) = bswap32(*(_DWORD *)(a1 + 20));
  *(_DWORD *)(a2 + 24) = bswap32(*(_DWORD *)(a1 + 24));
  *(_DWORD *)(a2 + 2_Block_object_dispose(va, 8) = bswap32(*(_DWORD *)(a1 + 28));
  *(_DWORD *)(a2 + 32) = bswap32(*(_DWORD *)(a1 + 32));
  *(_OWORD *)(a2 + 36) = *(_OWORD *)(a1 + 36);
  *(_DWORD *)(a2 + 52) = bswap32(*(_DWORD *)(a1 + 52));
  *(void *)(a2 + 56) = bswap64(*(void *)(a1 + 56));
  *(void *)(a2 + 64) = bswap64(*(void *)(a1 + 64));
  *(_DWORD *)(a2 + 72) = bswap32(*(_DWORD *)(a1 + 72));
  return a2 + 76;
}

const void **sub_10011536C(uint64_t a1, char *a2)
{
  uint64_t v3 = (*(uint64_t (**)(char *))(*(void *)&a2[*(void *)(*(void *)a2 - 40LL)] + 16LL))(&a2[*(void *)(*(void *)a2 - 40LL)]);
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    int v9 = (void *)sub_100004494( (uint64_t)exception,  (uint64_t)"Image contains crypto format but info class is missing EncryptionInfo",  0x16u);
  }

  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned int *)(a1 + 24);
  if (!*(_BYTE *)(v3 + 16)) {
    *(_BYTE *)(v3 + 16) = 1;
  }
  *(void *)(v3 + _Block_object_dispose(va, 8) = v5;
  int v11 = CFUUIDCreateFromUUIDBytes(kCFAllocatorDefault, *(CFUUIDBytes *)(a1 + 36));
  CFStringRef v6 = CFUUIDCreateString(kCFAllocatorDefault, v11);
  int v10 = v6;
  if (*(void *)(v4 + 24))
  {
    CFRelease(*(CFTypeRef *)(v4 + 24));
    CFStringRef v6 = v10;
  }

  *(void *)(v4 + 24) = v6;
  int v10 = 0LL;
  sub_10003AF44((const void **)&v10);
  return sub_10003B07C((const void **)&v11);
}

void sub_100115458( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

uint64_t sub_10011547C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  LODWORD(v9) = 0;
  sub_100019FE4((uint64_t)"public_key_crypto_algo_mode", 0, &v9, 1LL);
  bzero((void *)(a1 + 48), 0x204uLL);
  LODWORD(v9) = bswap32(*(_DWORD *)a2);
  sub_100115A7C((_DWORD *)a1, &v9);
  __int128 v4 = *(_OWORD *)(a2 + 20);
  *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
  *(_OWORD *)(a1 + 20) = v4;
  int v5 = bswap32(*(_DWORD *)(a2 + 36));
  LODWORD(v9) = 42;
  sub_100019FE4((uint64_t)"public_key_crypto_algo", v5, &v9, 1LL);
  *(_DWORD *)(a1 + 36) = v5;
  int v6 = bswap32(*(_DWORD *)(a2 + 40));
  unint64_t v9 = 0x800000010000000ALL;
  sub_100019FE4((uint64_t)"public_key_padding_algo", v6, &v9, 2LL);
  *(_DWORD *)(a1 + 40) = v6;
  int v7 = bswap32(*(_DWORD *)(a2 + 44));
  LODWORD(v9) = 0;
  sub_100019FE4((uint64_t)"public_key_crypto_algo_mode", v7, &v9, 1LL);
  *(_DWORD *)(a1 + 44) = v7;
  LODWORD(v9) = bswap32(*(_DWORD *)(a2 + 48));
  sub_100115B50((_DWORD *)(a1 + 48), &v9);
  memcpy((void *)(a1 + 52), (const void *)(a2 + 52), 0x200uLL);
  return a1;
}

uint64_t sub_1001155F8(uint64_t a1, uint64_t a2, SecKeyRef *a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 32) = 0x2A00000000LL;
  LODWORD(__p) = 42;
  sub_100019FE4((uint64_t)"public_key_crypto_algo", 42, &__p, 1LL);
  *(_DWORD *)(a1 + 40) = 10;
  __p = (void *)0x800000010000000ALL;
  sub_100019FE4((uint64_t)"public_key_padding_algo", 10, &__p, 2LL);
  *(_DWORD *)(a1 + 44) = 0;
  LODWORD(__p) = 0;
  sub_100019FE4((uint64_t)"public_key_crypto_algo_mode", 0, &__p, 1LL);
  bzero((void *)(a1 + 48), 0x204uLL);
  sub_100115954(a2, &__p);
  CFErrorRef error = 0LL;
  CFDataRef v23 = SecKeyCopyExternalRepresentation(*a3, &error);
  if (!v23)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    unsigned int Code = CFErrorGetCode(error);
    void *exception = &off_100196FC8;
    int v14 = std::generic_category();
    exception[1] = Code;
    exception[2] = v14;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 4_Block_object_dispose(va, 8) = 0;
    exception[7] = "Key from the certificate is not exportable.";
  }

  sub_1001159E4((uint64_t *)&v23, (uint64_t *)&theData);
  BytePtr = CFDataGetBytePtr(theData);
  CC_LONG Length = CFDataGetLength(theData);
  CC_SHA1(BytePtr, Length, (unsigned __int8 *)(a1 + 4));
  LODWORD(plaintext) = 20;
  sub_100115A7C((_DWORD *)a1, &plaintext);
  CFDataRef v20 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)__p, v26 - (_BYTE *)__p);
  sub_1001159E4((uint64_t *)&v20, (uint64_t *)&plaintext);
  int v8 = *a3;
  unint64_t v9 = sub_100115AD8(a1);
  CFDataRef v20 = SecKeyCreateEncryptedData(v8, v9, plaintext, &error);
  if (!v20)
  {
    int v15 = __cxa_allocate_exception(0x40uLL);
    unsigned int v16 = CFErrorGetCode(error);
    *int v15 = &off_100196FC8;
    uint64_t v17 = std::generic_category();
    v15[1] = v16;
    v15[2] = v17;
    *((_BYTE *)v15 + 24) = 0;
    *((_BYTE *)v15 + 4_Block_object_dispose(va, 8) = 0;
    v15[7] = "Failed to encrypt data using public key from certificate.";
  }

  sub_1001159E4((uint64_t *)&v20, (uint64_t *)&v19);
  int v18 = CFDataGetLength(v19);
  sub_100115B50((_DWORD *)(a1 + 48), &v18);
  int v10 = v19;
  v27.length = CFDataGetLength(v19);
  v27.location = 0LL;
  CFDataGetBytes(v10, v27, (UInt8 *)(a1 + 52));
  sub_10002A0F0((const void **)&v19);
  sub_10002A0F0((const void **)&plaintext);
  sub_10002A0F0((const void **)&theData);
  if (__p)
  {
    uint64_t v26 = __p;
    operator delete(__p);
  }

  return a1;
}

void sub_1001158CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, const void *a13, const void *a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p)
  {
    a18 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void **sub_100115954@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  __n128 result = (void **)sub_100119568( a2,  *(void *)(a1 + 8) + *(void *)(a1 + 32) - (*(void *)a1 + *(void *)(a1 + 24)) + 5LL);
  __int128 v4 = (char *)*result;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = v5 - *(void *)a1;
  if (v5 != *(void *)a1) {
    __n128 result = (void **)memmove(*result, *(const void **)a1, v5 - *(void *)a1);
  }
  int v7 = &v4[v6];
  int v8 = *(_BYTE **)(a1 + 24);
  unint64_t v9 = *(_BYTE **)(a1 + 32);
  int64_t v10 = v9 - v8;
  if (v9 != v8) {
    __n128 result = (void **)memmove(v7, v8, v9 - v8);
  }
  strcpy(&v7[v10], "CKIE");
  return result;
}

uint64_t *sub_1001159E4@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2 = *result;
  *a2 = *result;
  if (!v2)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    void *exception = &off_100196FC8;
    __int128 v4 = std::generic_category();
    exception[1] = 22LL;
    exception[2] = v4;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 4_Block_object_dispose(va, 8) = 0;
    exception[7] = "Failed creating CFAutoRelease instance.";
  }

  return result;
}

void sub_100115A68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, const void **a10)
{
}

_DWORD *sub_100115A7C(_DWORD *result, _DWORD *a2)
{
  if (*a2 >= 0x21u)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    void *exception = &off_100175680;
    exception[1] = "_publicKeyHash";
    exception[2] = "field size too large";
  }

  int *result = *a2;
  return result;
}

SecKeyAlgorithm sub_100115AD8(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 36) != 42) {
    goto LABEL_7;
  }
  int v1 = *(_DWORD *)(a1 + 40);
  if (v1 == 10)
  {
    uint64_t v2 = &kSecKeyAlgorithmRSAEncryptionPKCS1;
    return *v2;
  }

  if (v1 != -2147483647)
  {
LABEL_7:
    exception = __cxa_allocate_exception(0x40uLL);
    uint64_t v5 = (void *)sub_100004494((uint64_t)exception, (uint64_t)"Unsupported public key algorithm.", 0xA1u);
  }

  uint64_t v2 = &kSecKeyAlgorithmRSAEncryptionOAEPSHA1;
  return *v2;
}

_DWORD *sub_100115B50(_DWORD *result, _DWORD *a2)
{
  if (*a2 >= 0x201u)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    void *exception = &off_100175680;
    exception[1] = "_encryptedBlob";
    exception[2] = "field size too large";
  }

  int *result = *a2;
  return result;
}

int *sub_100115BAC(int *a1, uint64_t a2)
{
  __int128 v4 = a1 + 3;
  uint64_t v5 = a1 + 12;
  uint64_t v6 = a1 + 25;
  bzero(a1, 0x268uLL);
  int v7 = bswap32(*(_DWORD *)a2);
  LODWORD(v12) = 103;
  sub_100019FE4((uint64_t)"key_derivation_algorithm_t", v7, &v12, 1LL);
  *a1 = v7;
  int v8 = bswap32(*(_DWORD *)(a2 + 4));
  LODWORD(v12) = 0;
  sub_100019FE4((uint64_t)"key_derivation_prng_algorithm_t", v8, &v12, 1LL);
  a1[1] = v8;
  a1[2] = bswap32(*(_DWORD *)(a2 + 8));
  LODWORD(v12) = bswap32(*(_DWORD *)(a2 + 12));
  sub_100115FD8(v4, &v12);
  __int128 v9 = *(_OWORD *)(a2 + 32);
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  *((_OWORD *)a1 + 2) = v9;
  LODWORD(v12) = bswap32(*(_DWORD *)(a2 + 48));
  sub_100116034(v5, &v12);
  __int128 v10 = *(_OWORD *)(a2 + 68);
  *(_OWORD *)(a1 + 13) = *(_OWORD *)(a2 + 52);
  *(_OWORD *)(a1 + 17) = v10;
  a1[21] = bswap32(*(_DWORD *)(a2 + 84));
  LODWORD(v5) = bswap32(*(_DWORD *)(a2 + 88));
  unint64_t v12 = 0x8000000100000011LL;
  sub_100019FE4((uint64_t)"wrap_key_crypto_algo", (int)v5, &v12, 2LL);
  a1[22] = (int)v5;
  LODWORD(v5) = bswap32(*(_DWORD *)(a2 + 92));
  LODWORD(v12) = 7;
  sub_100019FE4((uint64_t)"wrap_key_crypto_padding_algo", (int)v5, &v12, 1LL);
  a1[23] = (int)v5;
  LODWORD(v5) = bswap32(*(_DWORD *)(a2 + 96));
  LODWORD(v12) = 6;
  sub_100019FE4((uint64_t)"crypto_mode", (int)v5, &v12, 1LL);
  a1[24] = (int)v5;
  LODWORD(v12) = bswap32(*(_DWORD *)(a2 + 100));
  sub_100116354(v6, &v12);
  memcpy(a1 + 26, (const void *)(a2 + 104), 0x200uLL);
  return a1;
}

uint64_t sub_100115D90(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a2 = bswap32(*(_DWORD *)a1);
  *(_DWORD *)(a2 + 4) = bswap32(*(_DWORD *)(a1 + 4));
  *(_DWORD *)(a2 + _Block_object_dispose(va, 8) = bswap32(*(_DWORD *)(a1 + 8));
  *(_DWORD *)(a2 + 12) = bswap32(*(_DWORD *)(a1 + 12));
  __int128 v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(_DWORD *)(a2 + 4_Block_object_dispose(va, 8) = bswap32(*(_DWORD *)(a1 + 48));
  __int128 v4 = *(_OWORD *)(a1 + 52);
  *(_OWORD *)(a2 + 6_Block_object_dispose(va, 8) = *(_OWORD *)(a1 + 68);
  *(_OWORD *)(a2 + 52) = v4;
  *(_DWORD *)(a2 + 84) = bswap32(*(_DWORD *)(a1 + 84));
  *(_DWORD *)(a2 + 8_Block_object_dispose(va, 8) = bswap32(*(_DWORD *)(a1 + 88));
  *(_DWORD *)(a2 + 92) = bswap32(*(_DWORD *)(a1 + 92));
  *(_DWORD *)(a2 + 96) = bswap32(*(_DWORD *)(a1 + 96));
  *(_DWORD *)(a2 + 100) = bswap32(*(_DWORD *)(a1 + 100));
  memcpy((void *)(a2 + 104), (const void *)(a1 + 104), 0x200uLL);
  return a2 + 616;
}

uint64_t sub_100115E54(uint64_t a1)
{
  *(_DWORD *)a1 = 103;
  LODWORD(v3) = 103;
  sub_100019FE4((uint64_t)"key_derivation_algorithm_t", 103, &v3, 1LL);
  *(_DWORD *)(a1 + 4) = 0;
  LODWORD(v3) = 0;
  sub_100019FE4((uint64_t)"key_derivation_prng_algorithm_t", 0, &v3, 1LL);
  *(_OWORD *)(a1 + 6_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + _Block_object_dispose(va, 8) = 0u;
  *(void *)(a1 + 84) = 0x11000000C0LL;
  unint64_t v3 = 0x8000000100000011LL;
  sub_100019FE4((uint64_t)"wrap_key_crypto_algo", 17, &v3, 2LL);
  *(_DWORD *)(a1 + 92) = 7;
  LODWORD(v3) = 7;
  sub_100019FE4((uint64_t)"wrap_key_crypto_padding_algo", 7, &v3, 1LL);
  *(_DWORD *)(a1 + 96) = 6;
  LODWORD(v3) = 6;
  sub_100019FE4((uint64_t)"crypto_mode", 6, &v3, 1LL);
  bzero((void *)(a1 + 100), 0x204uLL);
  LODWORD(v3) = 20;
  sub_100115FD8((_DWORD *)(a1 + 12), &v3);
  LODWORD(v3) = 8;
  sub_100116034((_DWORD *)(a1 + 48), &v3);
  sub_100116090((void *)(a1 + 16), *(unsigned int *)(a1 + 12));
  sub_100116090((void *)(a1 + 52), *(unsigned int *)(a1 + 48));
  return a1;
}

_DWORD *sub_100115FD8(_DWORD *result, _DWORD *a2)
{
  if (*a2 >= 0x21u)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    void *exception = &off_100175680;
    exception[1] = "_salt";
    exception[2] = "field size too large";
  }

  int *result = *a2;
  return result;
}

_DWORD *sub_100116034(_DWORD *result, _DWORD *a2)
{
  if (*a2 >= 0x21u)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    void *exception = &off_100175680;
    exception[1] = "_blob_encryption_iv";
    exception[2] = "field size too large";
  }

  int *result = *a2;
  return result;
}

uint64_t sub_100116090(void *a1, size_t a2)
{
  uint64_t result = CCRandomGenerateBytes(a1, a2);
  if ((_DWORD)result)
  {
    unsigned int v4 = result;
    exception = __cxa_allocate_exception(0x40uLL);
    sub_100005148((uint64_t)v5);
    sub_10000552C(v5, (uint64_t)"random generation failed with err code ", 39LL);
    std::ostream::operator<<(v5, v4);
    sub_100006AA8((uint64_t)exception, (uint64_t)v5, 0x9Au);
  }

  return result;
}

void sub_100116124(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_100116158(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 88);
  if (v1 == -2147483647) {
    return 0LL;
  }
  if (v1 != 17)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    sub_100005148((uint64_t)v4);
    sub_10000552C(v4, (uint64_t)"Unsupported key decryption algo", 31LL);
    sub_100006AA8((uint64_t)exception, (uint64_t)v4, 0xA1u);
  }

  return 2LL;
}

void sub_1001161F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_10011622C@<X0>(uint64_t a1@<X0>, const char *a2@<X1>, uint8_t **a3@<X8>)
{
  unint64_t v4 = *(unsigned int *)(a1 + 84);
  if ((v4 & 7) != 0)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    int v11 = (void *)sub_100004494((uint64_t)exception, (uint64_t)"crypto_format: key size isn't a multiple of 8", 0x16u);
  }

  char v14 = 0;
  sub_100118D4C(a3, v4 >> 3, &v14);
  size_t v7 = strlen(a2);
  uint64_t result = CCKeyDerivationPBKDF( 2u,  a2,  v7,  (const uint8_t *)(a1 + 16),  *(unsigned int *)(a1 + 12),  1u,  *(_DWORD *)(a1 + 8),  *a3,  a3[1] - *a3);
  unsigned int v9 = result;
  if ((_DWORD)result)
  {
    unint64_t v12 = __cxa_allocate_exception(0x40uLL);
    void *v12 = &off_100196FC8;
    int v13 = std::generic_category();
    v12[1] = v9;
    v12[2] = v13;
    *((_BYTE *)v12 + 24) = 0;
    *((_BYTE *)v12 + 4_Block_object_dispose(va, 8) = 0;
    v12[7] = "crypto_format: Can't derive key";
  }

  return result;
}

void sub_100116338(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(va, 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

_DWORD *sub_100116354(_DWORD *result, _DWORD *a2)
{
  if (*a2 >= 0x201u)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    void *exception = &off_100175680;
    exception[1] = "_blob";
    exception[2] = "field size too large";
  }

  int *result = *a2;
  return result;
}

_DWORD *sub_1001163B0(_DWORD *a1, uint64_t a2, const char *a3)
{
  uint64_t v6 = sub_100115E54((uint64_t)a1);
  LODWORD(v12[0]) = 8;
  sub_100116034((_DWORD *)(v6 + 48), v12);
  size_t v7 = strlen(a3);
  a1[2] = CCCalibratePBKDF(2u, v7, a1[3], 1u, (unint64_t)a1[21] >> 3, 0x64u);
  sub_100115954(a2, &v16);
  size_t dataOutMoved = 0LL;
  sub_10011622C((uint64_t)a1, a3, &v13);
  CCAlgorithm v8 = sub_100116158((uint64_t)a1);
  uint64_t v9 = CCCrypt(0, v8, 1u, v13, v14 - v13, a1 + 13, v16, v17 - (_BYTE *)v16, a1 + 26, 0x200uLL, &dataOutMoved);
  bzero(v13, v14 - v13);
  if ((_DWORD)v9)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    sub_100005148((uint64_t)v12);
    sub_10000552C(v12, (uint64_t)"Image key encoding failed with err code ", 40LL);
    std::ostream::operator<<(v12, v9);
    sub_100006AA8((uint64_t)exception, (uint64_t)v12, 0x9Au);
  }

  LODWORD(v12[0]) = dataOutMoved;
  sub_100116354(a1 + 25, v12);
  if (v13)
  {
    char v14 = v13;
    operator delete(v13);
  }

  if (v16)
  {
    uint64_t v17 = v16;
    operator delete(v16);
  }

  return a1;
}

void sub_100116534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  size_t v7 = *(void **)(v5 - 88);
  if (v7)
  {
    *(void *)(v5 - 80) = v7;
    operator delete(v7);
  }

  CCAlgorithm v8 = *(void **)(v5 - 56);
  if (v8)
  {
    *(void *)(v5 - 4_Block_object_dispose(va, 8) = v8;
    operator delete(v8);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_10011659C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  *(_DWORD *)(a1 + 16) = 0;
  int v4 = bswap32(*(_DWORD *)a2);
  __int128 v6 = xmmword_100142540;
  int v7 = 9;
  sub_100019FE4((uint64_t)"auth_table_entry_mechanism", v4, &v6, 5LL);
  *(_DWORD *)a1 = v4;
  *(void *)(a1 + 4) = bswap64(*(void *)(a2 + 4));
  *(void *)(a1 + 12) = bswap64(*(void *)(a2 + 12));
  return a1;
}

void sub_100116658(unsigned int *a1@<X1>, const char *a2@<X2>, unint64_t *a3@<X8>)
{
  CCAlgorithm v5 = sub_100116158((uint64_t)a1);
  unsigned int v6 = CCCrypt(1u, v5, 1u, __p, v10 - (_BYTE *)__p, a1 + 13, a1 + 26, a1[25], __src, a1[25], &__sz);
  if (v6)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    void *exception = &off_100196FC8;
    CCAlgorithm v8 = std::generic_category();
    exception[1] = v6;
    exception[2] = v8;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 4_Block_object_dispose(va, 8) = 0;
    exception[7] = "crypto_format: Can't decrypt wrapped key";
  }

  *a3 = 0LL;
  a3[1] = 0LL;
  a3[2] = 0LL;
  sub_1000FEFD4(a3, __sz);
  sub_1000FF1C8((uint64_t)a3, (char *)*a3, __src, &__src[__sz], __sz);
  if (__p)
  {
    __int128 v10 = __p;
    operator delete(__p);
  }

void sub_10011679C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  unsigned int v16 = *(void **)v14;
  if (*(void *)v14)
  {
    *(void *)(v14 + _Block_object_dispose(va, 8) = v16;
    operator delete(v16);
  }

  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double sub_1001167DC@<D0>(uint64_t a1@<X1>, const void **a2@<X2>, uint64_t a3@<X8>)
{
  if (!sub_1001168D8(a1, a2))
  {
    exception = __cxa_allocate_exception(0x40uLL);
    uint64_t v14 = (void *)sub_100004494((uint64_t)exception, (uint64_t)"crypto_format: Cookie differs", 0x23u);
  }

  unsigned int v6 = *a2;
  size_t v7 = (unint64_t)*(unsigned int *)(a1 + 24) >> 3;
  uint64_t v18 = 0LL;
  __int128 v17 = 0uLL;
  sub_100118DC8(&v17, v6, (uint64_t)v6 + v7, v7);
  unint64_t v8 = *(unsigned int *)(a1 + 24);
  uint64_t v9 = (char *)*a2 + (v8 >> 3);
  uint64_t v10 = (*(_DWORD *)(a1 + 32) + v8) >> 3;
  uint64_t v11 = (uint64_t)*a2 + v10;
  uint64_t v16 = 0LL;
  __int128 v15 = 0uLL;
  sub_100118DC8(&v15, v9, v11, v10 - (v8 >> 3));
  *(_OWORD *)a3 = v17;
  *(void *)(a3 + 16) = v18;
  double result = *(double *)&v15;
  *(_OWORD *)(a3 + 24) = v15;
  *(void *)(a3 + 40) = v16;
  return result;
}

void sub_1001168BC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1001168D8(uint64_t a1, void *a2)
{
  uint64_t v2 = ((*(_DWORD *)(a1 + 32) + *(_DWORD *)(a1 + 24)) >> 3) + 5;
  if (a2[1] - *a2 != v2) {
    return 0LL;
  }
  uint64_t v3 = *a2 + v2;
  v6.__r_.__value_.__s.__size_ = 4;
  LODWORD(v6.__r_.__value_.__l.__data_) = *(_DWORD *)(v3 - 5);
  v6.__r_.__value_.__s.__data_[4] = 0;
  BOOL v4 = std::string::compare(&v6, "CKIE") == 0;
  return v4;
}

void sub_100116968( uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, const char *a5@<X5>, uint64_t a6@<X8>)
{
  if (a4 != 616)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    uint64_t v14 = (void *)sub_100004494((uint64_t)exception, (uint64_t)"UDIF encryption: password header size mismatch", 0x16u);
  }

  uint64_t v11 = operator new[](0x268uLL);
  bzero(v11, 0x268uLL);
  unsigned int v12 = sub_100042FD0(a1, (uint64_t)v11, 616LL, a3);
  if ((v12 & 0x80000000) != 0)
  {
    __int128 v15 = __cxa_allocate_exception(0x40uLL);
    *__int128 v15 = &off_100196FC8;
    uint64_t v16 = std::generic_category();
    v15[1] = v12;
    v15[2] = v16;
    *((_BYTE *)v15 + 24) = 0;
    *((_BYTE *)v15 + 4_Block_object_dispose(va, 8) = 0;
    v15[7] = "Can't read UDIF crypto header";
  }

  sub_100115BAC((int *)v18, (uint64_t)v11);
  sub_100116658(v18, a5, (unint64_t *)__p);
  sub_1001167DC(a2, (const void **)__p, a6);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  operator delete[](v11);
}

void sub_100116ADC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  operator delete[](v11);
  _Unwind_Resume(a1);
}

uint64_t sub_100116B10(uint64_t a1, uint64_t a2, uint64_t *a3, __SecKey *a4, uint64_t a5)
{
  uint64_t v9 = (void *)(a1 + 24);
  *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(void *)&__int128 v21 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)(a5 + 52), *(unsigned int *)(a5 + 48));
  sub_1001159E4((uint64_t *)&v21, (uint64_t *)&v27);
  uint64_t v10 = sub_100115AD8(a5);
  CFDataRef v26 = SecKeyCreateDecryptedData(a4, v10, v27, &error);
  if (!v26)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    unsigned int Code = CFErrorGetCode(error);
    void *exception = &off_100196FC8;
    CFDataRef v19 = std::generic_category();
    exception[1] = Code;
    exception[2] = v19;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 4_Block_object_dispose(va, 8) = 0;
    exception[7] = "Error while decrypting data using keychain";
  }

  sub_1001159E4((uint64_t *)&v26, (uint64_t *)&v25);
  uint64_t v11 = *a3;
  sub_1000FEEF8(v25, 0, 0LL, (unint64_t *)__p);
  sub_1001167DC(v11, (const void **)__p, (uint64_t)&v21);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  uint64_t v12 = *a3;
  *a3 = 0LL;
  int v13 = *(void **)(a1 + 48);
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = v12;
  if (v13) {
    operator delete(v13);
  }
  uint64_t v14 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + _Block_object_dispose(va, 8) = v14;
    operator delete(v14);
    *(void *)a1 = 0LL;
    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
  }

  *(_OWORD *)a1 = v21;
  *(void *)(a1 + 16) = v22;
  __int128 v15 = *(void **)(a1 + 24);
  if (v15)
  {
    *(void *)(a1 + 32) = v15;
    operator delete(v15);
    *uint64_t v9 = 0LL;
    v9[1] = 0LL;
    v9[2] = 0LL;
  }

  *(_OWORD *)(a1 + 24) = v23;
  *(void *)(a1 + 40) = v24;
  sub_10002A0F0((const void **)&v25);
  sub_10002A0F0((const void **)&v27);
  return a1;
}

void sub_100116CD0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  uint64_t v24 = *(void **)(v19 + 56);
  if (v24)
  {
    *(void *)(v19 + 64) = v24;
    operator delete(v24);
  }

  __int16 v25 = *(void **)(v19 + 48);
  *(void *)(v19 + 4_Block_object_dispose(va, 8) = 0LL;
  if (v25) {
    operator delete(v25);
  }
  CFDataRef v26 = *v21;
  if (*v21)
  {
    *(void *)(v19 + 32) = v26;
    operator delete(v26);
  }

  CFRange v27 = *(void **)v19;
  if (*(void *)v19)
  {
    *(void *)(v19 + _Block_object_dispose(va, 8) = v27;
    operator delete(v27);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_100116D68(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }

  uint64_t v3 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + _Block_object_dispose(va, 8) = v3;
    operator delete(v3);
  }

  return a1;
}

uint64_t sub_100116DAC(uint64_t a1, uint64_t a2, uint64_t *a3, const char *a4)
{
  size_t v7 = (void *)(a1 + 24);
  *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  uint64_t v8 = 20LL * *(unsigned int *)(*a3 + 72);
  uint64_t v9 = operator new[](v8);
  bzero(v9, v8);
  unsigned int v10 = sub_100042FD0(a2, (uint64_t)v9, v8, 76LL);
  CFDataRef v26 = v9;
  if ((v10 & 0x80000000) != 0)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    void *exception = &off_100196FC8;
    __int16 v25 = std::generic_category();
    exception[1] = v10;
    exception[2] = v25;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 4_Block_object_dispose(va, 8) = 0;
    exception[7] = "Crypto: Can't read encryption table";
  }

  if (!*(_DWORD *)(*a3 + 72))
  {
LABEL_15:
    uint64_t v22 = __cxa_allocate_exception(0x40uLL);
    *uint64_t v22 = &off_100196FC8;
    __int128 v23 = std::generic_category();
    v22[1] = 80LL;
    v22[2] = v23;
    *((_BYTE *)v22 + 24) = 0;
    *((_BYTE *)v22 + 4_Block_object_dispose(va, 8) = 0;
    v22[7] = "Invalid passphrase or key";
  }

  unint64_t v11 = 0LL;
  uint64_t v12 = (uint64_t)v9;
  while (1)
  {
    sub_10011659C((uint64_t)&v36, v12);
    if (v36 == 1) {
      break;
    }
    ++v11;
    v12 += 20LL;
  }

  *(_OWORD *)uint64_t v34 = 0u;
  __int128 v35 = 0u;
  *(_OWORD *)__p = 0u;
  sub_100116968(a2, *a3, v37, v38, a4, (uint64_t)&v29);
  int v13 = v29;
  __p[0] = v29;
  *(_OWORD *)uint64_t v28 = v30;
  __p[1] = (void *)v30;
  uint64_t v14 = v31;
  uint64_t v15 = v32;
  v34[1] = v31;
  __int128 v35 = v32;
  uint64_t v16 = *((void *)&v32 + 1);
  uint64_t v17 = *a3;
  *a3 = 0LL;
  uint64_t v18 = *(void **)(a1 + 48);
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = v17;
  if (v18) {
    operator delete(v18);
  }
  uint64_t v19 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + _Block_object_dispose(va, 8) = v19;
    operator delete(v19);
    *(void *)a1 = 0LL;
    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
  }

  *(void *)a1 = v13;
  *(_OWORD *)(a1 + _Block_object_dispose(va, 8) = *(_OWORD *)v28;
  __p[1] = 0LL;
  v34[0] = 0LL;
  __p[0] = 0LL;
  CFDataRef v20 = *(void **)(a1 + 24);
  if (v20)
  {
    *(void *)(a1 + 32) = v20;
    operator delete(v20);
    *size_t v7 = 0LL;
    v7[1] = 0LL;
    v7[2] = 0LL;
  }

  *(void *)(a1 + 24) = v14;
  *(void *)(a1 + 32) = v15;
  *(void *)(a1 + 40) = v16;
  if (__p[0]) {
    operator delete(__p[0]);
  }
  operator delete[](v26);
  return a1;
}

void sub_100117058()
{
}

void sub_10011707C()
{
}

__n128 sub_1001170EC(void *a1, uint64_t a2, __n128 *a3, uint64_t *a4)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = *(void *)(a2 + 16);
  *(void *)a2 = 0LL;
  *(void *)(a2 + _Block_object_dispose(va, 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  a1[3] = 0LL;
  a1[4] = 0LL;
  a1[5] = 0LL;
  __n128 result = *a3;
  *(__n128 *)(a1 + 3) = *a3;
  a1[5] = a3[1].n128_u64[0];
  a3->n128_u64[0] = 0LL;
  a3->n128_u64[1] = 0LL;
  a3[1].n128_u64[0] = 0LL;
  uint64_t v5 = *a4;
  *a4 = 0LL;
  a1[6] = v5;
  a1[7] = 0LL;
  a1[8] = 0LL;
  a1[9] = 0LL;
  return result;
}

const void **sub_100117140(uint64_t a1, char *a2)
{
  return sub_10011536C(*(void *)(a1 + 48), a2);
}

uint64_t sub_100117148(uint64_t a1, CCOperation a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(a1 + 24) = 0LL;
  uint64_t v10 = a1 + 24;
  *(_DWORD *)(a1 + 16) = a2;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  sub_10005FAE8((void *)(a1 + 24), *(const void **)a3, *(void *)(a3 + 8), *(void *)(a3 + 8) - *(void *)a3);
  *(void *)(v10 + 24) = a5;
  *(void *)(v10 + 32) = a4;
  CCCryptorStatus v11 = CCCryptorCreate( a2,  0,  0,  *(const void **)a3,  *(void *)(a3 + 8) - *(void *)a3,  0LL,  (CCCryptorRef *)(v10 - 16));
  if (v11)
  {
    unsigned int v13 = v11;
    exception = __cxa_allocate_exception(0x40uLL);
    void *exception = &off_100196FC8;
    uint64_t v15 = std::generic_category();
    exception[1] = v13;
    exception[2] = v15;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 4_Block_object_dispose(va, 8) = 0;
    exception[7] = "crypto_format: Can't initialize aes cryptor";
  }

  *(_BYTE *)a1 = 1;
  return a1;
}

void sub_100117230(_Unwind_Exception *exception_object)
{
  BOOL v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 32) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(exception_object);
}

uint64_t sub_10011724C(uint64_t a1)
{
  if (*(_BYTE *)a1) {
    CCCryptorRelease(*(CCCryptorRef *)(a1 + 8));
  }
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }

  return a1;
}

uint64_t sub_100117290(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = 0LL;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0LL;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(void *)(a1 + 40) = 0LL;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a2 + 24) = 0u;
  uint64_t v3 = *(void *)(a2 + 48);
  *(_OWORD *)(a2 + 40) = 0u;
  *(void *)(a1 + 56) = 0LL;
  uint64_t v4 = a1 + 56;
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = v3;
  *(void *)(a1 + 64) = 0LL;
  sub_10011B810(a1 + 24, &v9);
  sub_1000198A4(v4, &v9);
  uint64_t v5 = (std::__shared_weak_count *)*((void *)&v9 + 1);
  if (*((void *)&v9 + 1))
  {
    std::string v6 = (unint64_t *)(*((void *)&v9 + 1) + 8LL);
    do
      unint64_t v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  return a1;
}

void sub_100117370(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;
  sub_100006224(v4);
  std::string v6 = *(void **)(v1 + 48);
  *(void *)(v1 + 4_Block_object_dispose(va, 8) = 0LL;
  if (v6) {
    operator delete(v6);
  }
  unint64_t v7 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 32) = v7;
    operator delete(v7);
  }

  uint64_t v8 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(va, 8) = v8;
    operator delete(v8);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1001173BC(uint64_t a1, uint64_t *a2, uint64_t a3, const char *a4, __SecKey *a5)
{
  SecKeyRef v28 = a5;
  uint64_t v8 = (unint64_t *)(a1 + 24);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  uint64_t v9 = *a2;
  *a2 = 0LL;
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = v9;
  *(void *)(a1 + 56) = 0LL;
  uint64_t v10 = a1 + 56;
  *(void *)(a1 + 64) = 0LL;
  unint64_t v11 = (unint64_t)*(unsigned int *)(v9 + 24) >> 3;
  uint64_t v12 = *(char **)a1;
  unsigned int v13 = *(char **)(a1 + 8);
  if (v11 <= v13 - v12)
  {
    if (v11 < v13 - v12)
    {
      unsigned int v13 = &v12[v11];
      *(void *)(a1 + _Block_object_dispose(va, 8) = &v12[v11];
    }
  }

  else
  {
    sub_100118E40((unint64_t *)a1, v11 - (v13 - v12));
    uint64_t v12 = *(char **)a1;
    unsigned int v13 = *(char **)(a1 + 8);
  }

  sub_100116090(v12, v13 - v12);
  unint64_t v15 = (unint64_t)*(unsigned int *)(*(void *)(a1 + 48) + 32LL) >> 3;
  uint64_t v16 = *(char **)(a1 + 24);
  uint64_t v17 = *(char **)(a1 + 32);
  if (v15 <= v17 - v16)
  {
    if (v15 < v17 - v16)
    {
      uint64_t v17 = &v16[v15];
      *(void *)(a1 + 32) = &v16[v15];
    }
  }

  else
  {
    sub_100118E40(v8, v15 - (v17 - v16));
    uint64_t v16 = *(char **)(a1 + 24);
    uint64_t v17 = *(char **)(a1 + 32);
  }

  sub_100116090(v16, v17 - v16);
  sub_10011B810((uint64_t)v8, &v29);
  sub_1000198A4(v10, (__int128 *)&v29);
  uint64_t v18 = *(std::__shared_weak_count **)((char *)&v30 + 4);
  if (*(void *)((char *)&v30 + 4))
  {
    uint64_t v19 = (unint64_t *)(*(void *)((char *)&v30 + 4) + 8LL);
    do
      unint64_t v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  __p = 0LL;
  unint64_t v26 = 0LL;
  unint64_t v27 = 0LL;
  if (a4)
  {
    sub_1001163B0(&v29, a1, a4);
    unint64_t v26 = sub_100118F68((uint64_t *)&__p, (uint64_t)&v29);
  }

  if (v28)
  {
    sub_1001155F8((uint64_t)&v29, a1, &v28);
    unint64_t v21 = v26;
    if (v26 >= v27)
    {
      uint64_t v23 = sub_100119374((uint64_t *)&__p, (uint64_t)&v29);
    }

    else
    {
      *(_DWORD *)(v26 + 32) = 0;
      *(_OWORD *)unint64_t v21 = 0u;
      *(_OWORD *)(v21 + 16) = 0u;
      *(_DWORD *)unint64_t v21 = v29;
      __int128 v22 = v30;
      *(_OWORD *)(v21 + 20) = v31;
      *(_OWORD *)(v21 + 4) = v22;
      *(void *)(v21 + 36) = v32;
      *(_DWORD *)(v21 + 44) = v33;
      bzero((void *)(v21 + 48), 0x204uLL);
      *(_DWORD *)(v21 + 4_Block_object_dispose(va, 8) = v34;
      memcpy((void *)(v21 + 52), v35, 0x200uLL);
      *(_DWORD *)(v21 + 616) = 1;
      uint64_t v23 = v21 + 620;
    }

    unint64_t v26 = v23;
  }

  sub_100117740(a1, a3, (uint64_t *)&__p);
  if (__p)
  {
    unint64_t v26 = (unint64_t)__p;
    operator delete(__p);
  }

  return a1;
}

void sub_1001176D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  sub_100006224(v12);
  uint64_t v14 = *(void **)(v10 + 48);
  *(void *)(v10 + 4_Block_object_dispose(va, 8) = 0LL;
  if (v14) {
    operator delete(v14);
  }
  unint64_t v15 = *v11;
  if (*v11)
  {
    *(void *)(v10 + 32) = v15;
    operator delete(v15);
  }

  uint64_t v16 = *(void **)v10;
  if (*(void *)v10)
  {
    *(void *)(v10 + _Block_object_dispose(va, 8) = v16;
    operator delete(v16);
  }

  _Unwind_Resume(a1);
}

void sub_100117740(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = (a3[1] - *a3) >> 2;
  *(_DWORD *)(*(void *)(a1 + 48) + 72LL) = 1496311187 * v6;
  uint64_t v35 = 76LL;
  unint64_t v7 = 0xBDEF7BDEF7BDEF7CLL * v6 + 76;
  unint64_t v34 = v7;
  uint64_t v8 = sub_100117A14(a1, a3);
  sub_1001195E8(&__p, v8 + v7);
  sub_1001152C8(*(void *)(a1 + 48), (uint64_t)__p);
  uint64_t v9 = *a3;
  for (uint64_t i = a3[1]; v9 != i; v9 += 620LL)
  {
    unint64_t v26 = &v35;
    unint64_t v27 = (std::__shared_weak_count *)&v34;
    p_p = &__p;
    uint64_t v11 = *(unsigned int *)(v9 + 616);
    if ((_DWORD)v11 == -1) {
      sub_100026264();
    }
    int v36 = &v26;
    ((void (*)(uint64_t ***, uint64_t))off_100195638[v11])(&v36, v9);
  }

  if ((unint64_t)(*(uint64_t (**)(uint64_t))(*(void *)a2 + 40LL))(a2) < *(void *)(*(void *)(a1 + 48) + 64LL))
  {
    unsigned int v12 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 56LL))(a2);
    if (v12)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = &off_100196FC8;
      __int16 v25 = std::generic_category();
      exception[1] = v12;
      exception[2] = v25;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + 4_Block_object_dispose(va, 8) = 0;
      exception[7] = "Failed truncating crypto header";
    }
  }

  unsigned int v13 = (uint64_t *)__p;
  uint64_t v14 = v33;
  unint64_t v15 = (std::__shared_weak_count *)*((void *)sub_100120DCC() + 1);
  unint64_t v26 = v13;
  unint64_t v27 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      unint64_t v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }

  p_p = (void **)(v14 - (_BYTE *)v13);
  uint64_t v29 = 0LL;
  int64_t v30 = v14 - (_BYTE *)v13;
  char v31 = 0;
  unsigned int v18 = (*(uint64_t (**)(uint64_t, uint64_t **))(*(void *)a2 + 80LL))(a2, &v26);
  if (p_p != (void **)(int)v18)
  {
    __int128 v22 = __cxa_allocate_exception(0x40uLL);
    *__int128 v22 = &off_100196FC8;
    uint64_t v23 = std::generic_category();
    v22[1] = v18;
    v22[2] = v23;
    *((_BYTE *)v22 + 24) = 0;
    *((_BYTE *)v22 + 4_Block_object_dispose(va, 8) = 0;
    v22[7] = "Failed writing crypto header";
  }

  uint64_t v19 = v27;
  if (v27)
  {
    unint64_t v20 = (unint64_t *)&v27->__shared_owners_;
    do
      unint64_t v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

  if (__p)
  {
    int v33 = __p;
    operator delete(__p);
  }

void sub_1001179D4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100117A14(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  if (*a2 == v3) {
    return 0LL;
  }
  int v4 = 0;
  do
  {
    uint64_t v5 = *(unsigned int *)(v2 + 616);
    if ((_DWORD)v5 == -1) {
      sub_100026264();
    }
    uint64_t v8 = &v7;
    v4 += ((uint64_t (*)(char **, uint64_t))off_100195628[v5])(&v8, v2);
    v2 += 620LL;
  }

  while (v2 != v3);
  return v4;
}

uint64_t sub_100117AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a4) {
    return 0LL;
  }
  uint64_t v6 = a4;
  uint64_t v9 = 0LL;
  unint64_t v10 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 48LL) + 52LL);
  while (1)
  {
    uint64_t v11 = sub_100117BF0(a2, (a5 + v9) / v10, (const void *)(a3 + v9), (void *)(a3 + v9), 1LL);
    if ((_DWORD)v11) {
      break;
    }
    v9 += v10;
    if (!--v6) {
      return 0LL;
    }
  }

  uint64_t v13 = v11;
  *(void *)&__int128 v14 = "crypto_format_backend::crypt_chunk(crypto::format::aes_context &, char *, size_t, uint64_t)";
  *((void *)&v14 + 1) = 34LL;
  int v15 = 16;
  sub_100117E80(v16, &v14);
  sub_10000552C(&v17, (uint64_t)"Crypto operation on data of ", 28LL);
  std::ostream::operator<<(&v17, (a5 + v9) / v10);
  sub_10000552C(&v17, (uint64_t)" failed with ", 13LL);
  std::ostream::operator<<(&v17, v13);
  std::ostream::~ostream(&v17, off_100195B68);
  sub_10011A860((uint64_t)v16);
  std::ios::~ios(&v18);
  else {
    return -(int)v13;
  }
}

void sub_100117BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

uint64_t sub_100117BF0(uint64_t a1, uint64_t a2, const void *a3, void *a4, uint64_t a5)
{
  unint64_t v10 = *(const void **)(a1 + 56);
  LODWORD(v13) = bswap32(a2);
  memcpy(&__dst, v10, sizeof(__dst));
  CCHmacUpdate(&__dst, &v13, 4uLL);
  CCHmacFinal(&__dst, macOut);
  uint64_t v11 = CCCryptorReset(*(CCCryptorRef *)(a1 + 8), macOut);
  if ((_DWORD)v11)
  {
    *(void *)&__int128 v13 = "crypto::format::aes_context::crypt(uint32_t, const void *, void *, size_t)";
    *((void *)&v13 + 1) = 34LL;
    int v14 = 16;
    sub_10011987C(&__dst, &v13);
    sub_10000552C(&__dst.ctx[90], (uint64_t)"CommonCryptoReset @ ", 20LL);
    std::ostream::operator<<(&__dst.ctx[90], a2);
    sub_10000552C(&__dst.ctx[90], (uint64_t)"/", 1LL);
    std::ostream::operator<<(&__dst.ctx[90], *(void *)(a1 + 48) * a5);
    sub_10000552C(&__dst.ctx[90], (uint64_t)" returned ", 10LL);
    std::ostream::operator<<(&__dst.ctx[90], v11);
    std::ostream::~ostream(&__dst.ctx[90], off_100195728);
    sub_100119AC8((uint64_t)&__dst);
  }

  else
  {
    uint64_t v11 = CCCryptorUpdate(*(CCCryptorRef *)(a1 + 8), a3, *(void *)(a1 + 48) * a5, a4, *(void *)(a1 + 48) * a5, 0LL);
    if (!(_DWORD)v11) {
      return 0LL;
    }
    *(void *)&__int128 v13 = "crypto::format::aes_context::crypt(uint32_t, const void *, void *, size_t)";
    *((void *)&v13 + 1) = 34LL;
    int v14 = 16;
    sub_100119964(&__dst, &v13);
    sub_10000552C(&__dst.ctx[90], (uint64_t)"CommonCryptoUpdate @ ", 21LL);
    std::ostream::operator<<(&__dst.ctx[90], a2);
    sub_10000552C(&__dst.ctx[90], (uint64_t)"/", 1LL);
    std::ostream::operator<<(&__dst.ctx[90], *(void *)(a1 + 48) * a5);
    sub_10000552C(&__dst.ctx[90], (uint64_t)" returned ", 10LL);
    std::ostream::operator<<(&__dst.ctx[90], v11);
    std::ostream::~ostream(&__dst.ctx[90], off_100195948);
    sub_10011A0F0((uint64_t)&__dst);
  }

  std::ios::~ios(&__dst.ctx[92]);
  else {
    return -(int)v11;
  }
}

void sub_100117E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *sub_100117E80(void *a1, __int128 *a2)
{
  uint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_10011B8F4((uint64_t)a1, a2);
  *a1 = off_100195AA0;
  a1[45] = &off_100195BA0;
  a1[46] = &off_100195BC8;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 12_Block_object_dispose(va, 8) = -1;
  *a1 = off_100195AA0;
  a1[45] = off_100195B28;
  a1[46] = off_100195B50;
  return a1;
}

void sub_100117F04(_Unwind_Exception *a1)
{
}

uint64_t sub_100117F28(uint64_t a1)
{
  return a1;
}

uint64_t sub_100117F68(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  if (a4 < 0x21) {
    return sub_100117AA0(a1, a2, a3, a4, a5);
  }
  int v10 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 48LL) + 52LL);
  if (qos_class_self() <= 0x14) {
    return sub_100117AA0(a1, a2, a3, a4, a5);
  }
  unsigned int v14 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100118054;
  block[3] = &unk_100195518;
  block[4] = a1;
  block[5] = a4;
  block[6] = a2;
  block[7] = a3;
  int v13 = v10;
  block[8] = a5;
  block[9] = &v14;
  dispatch_apply((a4 + 31) >> 5, 0LL, block);
  return atomic_load(&v14);
}

uint64_t sub_100118054(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 32 * a2;
  uint64_t v4 = *(void *)(a1 + 32);
  else {
    uint64_t v5 = *(void *)(a1 + 40) - 32 * a2;
  }
  sub_100117148( (uint64_t)v8,  *(_DWORD *)(*(void *)(a1 + 48) + 16LL),  *(void *)(a1 + 48) + 24LL,  *(void *)(*(void *)(a1 + 48) + 56LL),  *(void *)(*(void *)(a1 + 48) + 48LL));
  unsigned int v6 = sub_100117AA0( v4,  (uint64_t)v8,  *(void *)(a1 + 56) + v3 * *(unsigned int *)(a1 + 80),  v5,  v3 * *(unsigned int *)(a1 + 80) + *(void *)(a1 + 64));
  if (v6) {
    atomic_store(v6, *(unsigned int **)(a1 + 72));
  }
  return sub_10011724C((uint64_t)v8);
}

void sub_1001180E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_1001180FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 48LL);
  uint64_t v9 = *(unsigned int *)(v8 + 52);
  if ((*(_BYTE *)(a1 + 192) & 1) != 0) {
    uint64_t v10 = 0LL;
  }
  else {
    uint64_t v10 = *(void *)(v8 + 64);
  }
  uint64_t v11 = v10 + a4;
  unint64_t v12 = v9 * a3;
  uint64_t v13 = sub_100042FD0(*(void *)(a1 + 24), a2, v9 * a3, v10 + a4);
  if ((v13 & 0x80000000) == 0) {
    return sub_100117F68(a1, a1 + 120, a2, a3, a4);
  }
  uint64_t v15 = v13;
  *(void *)&__int128 v16 = "crypto_format_backend::read_aligned(char *, ssize_t, uint64_t)";
  *((void *)&v16 + 1) = 35LL;
  int v17 = 16;
  sub_100118270(v18, &v16);
  sub_10000552C(&v19, (uint64_t)"Crypto couldn't read from inner backend @ ", 42LL);
  std::ostream::operator<<(&v19, v11);
  sub_10000552C(&v19, (uint64_t)"/", 1LL);
  std::ostream::operator<<(&v19, v12);
  std::ostream::~ostream(&v19, off_100195D88);
  sub_10011AE0C((uint64_t)v18);
  std::ios::~ios(&v20);
  return v15;
}

void sub_100118258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *sub_100118270(void *a1, __int128 *a2)
{
  uint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_10011B970((uint64_t)a1, a2);
  *a1 = off_100195CC0;
  a1[45] = &off_100195DC0;
  a1[46] = &off_100195DE8;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 12_Block_object_dispose(va, 8) = -1;
  *a1 = off_100195CC0;
  a1[45] = off_100195D48;
  a1[46] = off_100195D70;
  return a1;
}

void sub_1001182F4(_Unwind_Exception *a1)
{
}

uint64_t sub_100118318(uint64_t a1)
{
  return a1;
}

uint64_t sub_100118358(uint64_t a1, char **a2)
{
  uint64_t v4 = *a2;
  uint64_t v6 = (uint64_t)a2[2];
  uint64_t v5 = a2[3];
  uint64_t v7 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 48LL) + 52LL);
  uint64_t v8 = (unint64_t)v5 / v7 * v7;
  unint64_t v9 = (unint64_t)v5 % v7;
  if ((unint64_t)v5 % v7)
  {
    uint64_t result = sub_1001180FC(a1, *(void *)(a1 + 184), 1uLL, (unint64_t)v5 / v7 * v7);
    if ((_DWORD)result) {
      return result;
    }
    unint64_t v11 = v9;
    else {
      size_t v12 = v6;
    }
    memcpy(v4, (const void *)(*(void *)(a1 + 184) + v11), v12);
    v6 -= v12;
    v4 += v12;
    v8 += v7;
  }

  uint64_t result = sub_1001180FC(a1, (uint64_t)v4, v6 / v7, v8);
  if ((_DWORD)result) {
    return result;
  }
  if (!(v6 % v7)) {
    return *((unsigned int *)a2 + 4);
  }
  uint64_t result = sub_1001180FC(a1, *(void *)(a1 + 184), 1uLL, v6 - v6 % v7 + v8);
  if (!(_DWORD)result)
  {
    memcpy(&v4[v6 / v7 * v7], *(const void **)(a1 + 184), v6 % v7);
    return *((unsigned int *)a2 + 4);
  }

  return result;
}

uint64_t sub_100118464(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 48LL);
  if ((*(_BYTE *)(a1 + 192) & 1) != 0) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = *(void *)(v8 + 64);
  }
  uint64_t v10 = *(unsigned int *)(v8 + 52);
  uint64_t v11 = sub_100117F68(a1, a1 + 56, a2, a3, a4);
  if (!(_DWORD)v11)
  {
    uint64_t v12 = v9 + a4;
    uint64_t v13 = v10 * a3;
    uint64_t v14 = sub_1000474C8(*(void *)(a1 + 24), a2, v13, v12);
    if ((v14 & 0x80000000) != 0)
    {
      uint64_t v11 = v14;
      *(void *)&__int128 v16 = "crypto_format_backend::write_aligned(char *, ssize_t, uint64_t)";
      *((void *)&v16 + 1) = 36LL;
      int v17 = 16;
      sub_1001185C4(v18, &v16);
      sub_10000552C(&v19, (uint64_t)"Crypto couldn't write to inner backend @ ", 41LL);
      std::ostream::operator<<(&v19, v12);
      sub_10000552C(&v19, (uint64_t)"/", 1LL);
      std::ostream::operator<<(&v19, v13);
      std::ostream::~ostream(&v19, off_100195FA8);
      sub_10011B3B8((uint64_t)v18);
      std::ios::~ios(&v20);
    }

    else
    {
      return 0LL;
    }
  }

  return v11;
}

void sub_1001185AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *sub_1001185C4(void *a1, __int128 *a2)
{
  uint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_10011B9EC((uint64_t)a1, a2);
  *a1 = off_100195EE0;
  a1[45] = &off_100195FE0;
  a1[46] = &off_100196008;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 12_Block_object_dispose(va, 8) = -1;
  *a1 = off_100195EE0;
  a1[45] = off_100195F68;
  a1[46] = off_100195F90;
  return a1;
}

void sub_100118648(_Unwind_Exception *a1)
{
}

uint64_t sub_10011866C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1001186AC(uint64_t a1, char **a2)
{
  uint64_t v4 = *a2;
  int64_t v6 = (int64_t)a2[2];
  uint64_t v5 = a2[3];
  int64_t v7 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 48LL) + 52LL);
  uint64_t v8 = (unint64_t)v5 / v7 * v7;
  unint64_t v9 = (unint64_t)v5 % v7;
  if ((unint64_t)v5 % v7)
  {
    uint64_t result = sub_1001180FC(a1, *(void *)(a1 + 184), 1uLL, (unint64_t)v5 / v7 * v7);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v12 = &v4[v9];
    size_t v13 = v6 >= (uint64_t)(v7 - v9) ? v7 - v9 : v6;
    memcpy(*(void **)(a1 + 184), v12, v13);
    uint64_t result = sub_100118464(a1, *(void *)(a1 + 184), 1uLL, v8);
    if ((_DWORD)result) {
      return result;
    }
    v6 -= v13;
    v4 += v13;
    v8 += v13;
  }

  if (!*((_BYTE *)a2 + 40))
  {
    uint64_t v10 = v6 / v7;
    uint64_t result = sub_100118464(a1, (uint64_t)v4, v6 / v7, v8);
    if ((_DWORD)result) {
      return result;
    }
    v4 += v10 * v7;
    v8 += v10 * v7;
    v6 %= v7;
    goto LABEL_5;
  }

  if (v6 < v7)
  {
LABEL_5:
    if (!v6) {
      return *((unsigned int *)a2 + 4);
    }
    uint64_t result = sub_1001180FC(a1, *(void *)(a1 + 184), 1uLL, v8);
    if (!(_DWORD)result)
    {
      memcpy(*(void **)(a1 + 184), v4, v6);
      uint64_t result = sub_100118464(a1, *(void *)(a1 + 184), 1uLL, v8);
      if (!(_DWORD)result) {
        return *((unsigned int *)a2 + 4);
      }
    }

    return result;
  }

  uint64_t v14 = 0LL;
  while (1)
  {
    memcpy(*(void **)(a1 + 184), &v4[v14], v7);
    uint64_t result = sub_100118464(a1, *(void *)(a1 + 184), 1uLL, v8 + v14);
    if ((_DWORD)result) {
      return result;
    }
    v6 -= v7;
    v14 += v7;
    if (v6 < v7)
    {
      v4 += v14;
      v8 += v14;
      goto LABEL_5;
    }
  }

uint64_t sub_100118838(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  if ((*(_BYTE *)(a1 + 192) & 1) != 0) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 48LL) + 64LL);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 24LL))(v3, v4 + a2);
}

uint64_t sub_10011886C(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a1 + 192);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 48LL);
  if ((v3 & 2) == 0) {
    *(void *)(v4 + 56) = a2;
  }
  uint64_t v5 = *(void *)(a1 + 24);
  if ((v3 & 1) != 0) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = *(void *)(v4 + 64);
  }
  uint64_t v7 = (*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v5 + 56LL))( v5,  (a2 + (unint64_t)*(unsigned int *)(v4 + 52) - 1)
       / *(unsigned int *)(v4 + 52)
  if (!(_DWORD)v7)
  {
    sub_1001152C8(*(void *)(*(void *)(a1 + 40) + 48LL), (uint64_t)v21);
    unint64_t v9 = (std::__shared_weak_count *)*((void *)sub_100120DCC() + 1);
    __int128 v16 = v21;
    int v17 = v9;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        unint64_t v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }

    __int128 v18 = xmmword_10014D350;
    uint64_t v19 = 76LL;
    char v20 = 0;
    unsigned int v12 = (*(uint64_t (**)(void, _BYTE **))(**(void **)(a1 + 24) + 80LL))(*(void *)(a1 + 24), &v16);
    size_t v13 = v17;
    if ((void)v18 == v12) {
      uint64_t v7 = 0LL;
    }
    else {
      uint64_t v7 = v12;
    }
    if (v17)
    {
      uint64_t v14 = (unint64_t *)&v17->__shared_owners_;
      do
        unint64_t v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }

  return v7;
}

void sub_1001189BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

const void **sub_1001189D8(uint64_t a1, char *a2)
{
  return sub_10011536C(*(void *)(*(void *)(a1 + 40) + 48LL), a2);
}

uint64_t sub_1001189E4(uint64_t a1, uint64_t a2, uint64_t *a3, _DWORD *a4)
{
  (*(void (**)(uint64_t *__return_ptr))(**(void **)a2 + 72LL))(&v14);
  sub_10004683C((void *)a1, &v14);
  uint64_t v7 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  *(void *)a1 = off_100195548;
  *(void *)(a1 + 40) = *a3;
  uint64_t v10 = a3[1];
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = v10;
  if (v10)
  {
    unint64_t v11 = (unint64_t *)(v10 + 8);
    do
      unint64_t v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }

  sub_100117148(a1 + 56, 0, *a3, *(void *)(*a3 + 56), *(unsigned int *)(*(void *)(*a3 + 48) + 52LL));
  sub_100117148(a1 + 120, 1u, *a3, *(void *)(*a3 + 56), *(unsigned int *)(*(void *)(*a3 + 48) + 52LL));
  *(void *)(a1 + 184) = operator new[](*(unsigned int *)(*(void *)(*a3 + 48) + 52LL));
  *(_DWORD *)(a1 + 192) = *a4;
  return a1;
}

void sub_100118B08(_Unwind_Exception *a1)
{
}

uint64_t sub_100118B48(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_10004683C((void *)a1, a3);
  *uint64_t v5 = off_100195548;
  uint64_t v6 = *(void *)(a2 + 48);
  v5[5] = *(void *)(a2 + 40);
  v5[6] = v6;
  if (v6)
  {
    uint64_t v7 = (unint64_t *)(v6 + 8);
    do
      unint64_t v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }

  sub_100117148(a1 + 56, *(_DWORD *)(a2 + 72), a2 + 80, *(void *)(a2 + 112), *(void *)(a2 + 104));
  sub_100117148(a1 + 120, *(_DWORD *)(a2 + 136), a2 + 144, *(void *)(a2 + 176), *(void *)(a2 + 168));
  *(void *)(a1 + 184) = operator new[](*(unsigned int *)(*(void *)(*(void *)(a2 + 40) + 48LL) + 52LL));
  *(_DWORD *)(a1 + 192) = *(_DWORD *)(a2 + 192);
  return a1;
}

void sub_100118C04(_Unwind_Exception *a1)
{
}

double sub_100118C40@<D0>(uint64_t a1@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  double result = v5[0];
  *a3 = *(_OWORD *)v5;
  return result;
}

uint64_t sub_100118C80(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 192) & 2) != 0 || (uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 48LL) + 56LL)) == 0)
  {
    unint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 40LL))(*(void *)(a1 + 24));
    if ((*(_BYTE *)(a1 + 192) & 1) != 0) {
      unint64_t v4 = 0LL;
    }
    else {
      unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 48LL) + 64LL);
    }
    if (v3 <= v4)
    {
      return 0LL;
    }

    else
    {
      uint64_t v5 = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 40LL))(*(void *)(a1 + 24));
      if ((*(_BYTE *)(a1 + 192) & 1) != 0) {
        uint64_t v6 = 0LL;
      }
      else {
        uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 48LL) + 64LL);
      }
      return v5 - v6;
    }
  }

  return result;
}

void sub_100118D24(void *a1)
{
  uint64_t v1 = sub_10011B7A0(a1);
  operator delete(v1);
}

void *sub_100118D38(uint64_t a1, void *a2)
{
  return sub_10000552C(a2, (uint64_t)"crypto", 6LL);
}

void *sub_100118D4C(void *a1, size_t a2, _BYTE *a3)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    size_t v5 = a2;
    sub_10005FB60(a1, a2);
    uint64_t v6 = (_BYTE *)a1[1];
    uint64_t v7 = &v6[v5];
    do
    {
      *v6++ = *a3;
      --v5;
    }

    while (v5);
    a1[1] = v7;
  }

  return a1;
}

void sub_100118DAC(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(va, 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void *sub_100118DC8(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    uint64_t result = sub_10005FB60(result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_100118E24(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(va, 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void sub_100118E40(unint64_t *a1, size_t a2)
{
  size_t v5 = (char *)a1[1];
  unint64_t v4 = (char *)a1[2];
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
    unint64_t v12 = &v7[v11];
    size_t v13 = (char *)(v11 + v10);
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
      size_t v5 = (char *)*a1;
    }

    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5) {
      operator delete(v5);
    }
  }

uint64_t sub_100118F68(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x2FE592FE592FE593LL * ((a1[1] - *a1) >> 2);
  unint64_t v5 = v4 + 1;
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x2FE592FE592FE593LL * ((a1[2] - v3) >> 2);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x34DA034DA034DALL) {
    unint64_t v9 = 0x69B4069B4069B4LL;
  }
  else {
    unint64_t v9 = v5;
  }
  int v17 = a1 + 2;
  if (v9) {
    size_t v10 = (char *)sub_1001192A4(v7, v9);
  }
  else {
    size_t v10 = 0LL;
  }
  __p = v10;
  uint64_t v14 = &v10[620 * v4];
  uint64_t v15 = (uint64_t)v14;
  __int128 v16 = &v10[620 * v9];
  *(_DWORD *)(sub_100119108((uint64_t)v14, a2) + 616) = 0;
  v15 += 620LL;
  sub_1001191C8(a1, &__p);
  uint64_t v11 = a1[1];
  if (__p) {
    operator delete(__p);
  }
  return v11;
}

void sub_1001190B4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100119108(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = *(_DWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 12) = 0u;
  *(_OWORD *)(a1 + 2_Block_object_dispose(va, 8) = 0u;
  *(_DWORD *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_DWORD *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 4_Block_object_dispose(va, 8) = *(_DWORD *)(a2 + 48);
  __int128 v5 = *(_OWORD *)(a2 + 52);
  *(_OWORD *)(a1 + 6_Block_object_dispose(va, 8) = *(_OWORD *)(a2 + 68);
  *(_OWORD *)(a1 + 52) = v5;
  *(_DWORD *)(a1 + 84) = *(_DWORD *)(a2 + 84);
  *(_DWORD *)(a1 + 8_Block_object_dispose(va, 8) = *(_DWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  bzero((void *)(a1 + 100), 0x204uLL);
  *(_DWORD *)(a1 + 100) = *(_DWORD *)(a2 + 100);
  memcpy((void *)(a1 + 104), (const void *)(a2 + 104), 0x200uLL);
  return a1;
}

uint64_t *sub_1001191C8(uint64_t *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v6 = a2[1];
  if (v4 != *result)
  {
    uint64_t v7 = v6 - 620;
    do
    {
      uint64_t v8 = v4 - 620;
      *(_BYTE *)uint64_t v7 = 0;
      *(_DWORD *)(v7 + 616) = -1;
      uint64_t v9 = *(unsigned int *)(v4 - 4);
      if ((_DWORD)v9 != -1)
      {
        uint64_t result = (uint64_t *)((uint64_t (*)(char *, uint64_t, uint64_t))off_100195618[v9])(&v13, v7, v8);
        *(_DWORD *)(v7 + 616) = v9;
      }

      v7 -= 620LL;
      uint64_t v4 = v8;
    }

    while (v8 != v5);
    uint64_t v6 = v7 + 620;
  }

  a2[1] = v6;
  uint64_t v10 = *v3;
  *uint64_t v3 = v6;
  a2[1] = v10;
  uint64_t v11 = v3[1];
  v3[1] = a2[2];
  a2[2] = v11;
  uint64_t v12 = v3[2];
  v3[2] = a2[3];
  a2[3] = v12;
  *a2 = a2[1];
  return result;
}

void *sub_1001192A4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x69B4069B4069B5LL) {
    sub_100044D7C();
  }
  return operator new(620 * a2);
}

uint64_t sub_1001192EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100119108(a2, a3);
}

void *sub_1001192F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_DWORD *)a2 = *(_DWORD *)a3;
  __int128 v5 = *(_OWORD *)(a3 + 4);
  *(_OWORD *)(a2 + 20) = *(_OWORD *)(a3 + 20);
  *(_OWORD *)(a2 + 4) = v5;
  *(_DWORD *)(a2 + 36) = *(_DWORD *)(a3 + 36);
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a3 + 40);
  *(_DWORD *)(a2 + 44) = *(_DWORD *)(a3 + 44);
  bzero((void *)(a2 + 48), 0x204uLL);
  *(_DWORD *)(a2 + 4_Block_object_dispose(va, 8) = *(_DWORD *)(a3 + 48);
  return memcpy((void *)(a2 + 52), (const void *)(a3 + 52), 0x200uLL);
}

uint64_t sub_100119374(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x2FE592FE592FE593LL * ((a1[1] - *a1) >> 2);
  unint64_t v5 = v4 + 1;
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x2FE592FE592FE593LL * ((a1[2] - v3) >> 2);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x34DA034DA034DALL) {
    unint64_t v9 = 0x69B4069B4069B4LL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v19 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_1001192A4(v7, v9);
  }
  else {
    uint64_t v10 = 0LL;
  }
  uint64_t v11 = &v10[620 * v4];
  __p = v10;
  __int128 v16 = v11;
  __int128 v18 = &v10[620 * v9];
  *((_DWORD *)v11 + _Block_object_dispose(va, 8) = 0;
  *(_OWORD *)uint64_t v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *(_DWORD *)uint64_t v11 = *(_DWORD *)a2;
  __int128 v12 = *(_OWORD *)(a2 + 4);
  *(_OWORD *)(v11 + 20) = *(_OWORD *)(a2 + 20);
  *(_OWORD *)(v11 + 4) = v12;
  *((_DWORD *)v11 + 9) = *(_DWORD *)(a2 + 36);
  *((_DWORD *)v11 + 10) = *(_DWORD *)(a2 + 40);
  *((_DWORD *)v11 + 11) = *(_DWORD *)(a2 + 44);
  bzero(v11 + 48, 0x204uLL);
  *((_DWORD *)v11 + 12) = *(_DWORD *)(a2 + 48);
  memcpy(v11 + 52, (const void *)(a2 + 52), 0x200uLL);
  *((_DWORD *)v11 + 154) = 1;
  int v17 = v11 + 620;
  sub_1001191C8(a1, &__p);
  uint64_t v13 = a1[1];
  if (v17 != v16) {
    int v17 = &v16[(v17 - v16 - 620) % 0x26CuLL];
  }
  if (__p) {
    operator delete(__p);
  }
  return v13;
}

void sub_100119514( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100119568(void *a1, size_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_10005FB60(a1, a2);
    uint64_t v4 = (char *)a1[1];
    unint64_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }

  return a1;
}

void sub_1001195BC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(va, 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

uint64_t sub_1001195D8()
{
  return 616LL;
}

uint64_t sub_1001195E0()
{
  return 564LL;
}

void *sub_1001195E8(void *a1, size_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_10005FB60(a1, a2);
    uint64_t v4 = (char *)a1[1];
    unint64_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }

  return a1;
}

void sub_10011963C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(va, 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

uint64_t sub_100119658(void ***a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  __int128 v7 = xmmword_100142540;
  int v8 = 9;
  sub_100019FE4((uint64_t)"auth_table_entry_mechanism", 1, &v7, 5LL);
  unint64_t v4 = *v3[1];
  uint64_t v5 = *v3[2] + **v3;
  *(_DWORD *)uint64_t v5 = 0x1000000;
  *(void *)(v5 + 4) = bswap64(v4);
  *(void *)(v5 + 12) = 0x6802000000000000LL;
  **v3 += 20LL;
  uint64_t result = sub_100115D90(a2, *v3[2] + *v3[1]);
  *v3[1] += 616LL;
  return result;
}

void *sub_100119740(void ***a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  __int128 v9 = xmmword_100142540;
  int v10 = 9;
  sub_100019FE4((uint64_t)"auth_table_entry_mechanism", 2, &v9, 5LL);
  unint64_t v4 = *v3[1];
  uint64_t v5 = *v3[2] + **v3;
  *(_DWORD *)uint64_t v5 = 0x2000000;
  *(void *)(v5 + 4) = bswap64(v4);
  *(void *)(v5 + 12) = 0x3402000000000000LL;
  **v3 += 20LL;
  uint64_t v6 = *v3[2] + *v3[1];
  *(_DWORD *)uint64_t v6 = bswap32(*(_DWORD *)a2);
  __int128 v7 = *(_OWORD *)(a2 + 4);
  *(_OWORD *)(v6 + 20) = *(_OWORD *)(a2 + 20);
  *(_OWORD *)(v6 + 4) = v7;
  *(_DWORD *)(v6 + 36) = bswap32(*(_DWORD *)(a2 + 36));
  *(_DWORD *)(v6 + 40) = bswap32(*(_DWORD *)(a2 + 40));
  *(_DWORD *)(v6 + 44) = bswap32(*(_DWORD *)(a2 + 44));
  *(_DWORD *)(v6 + 4_Block_object_dispose(va, 8) = bswap32(*(_DWORD *)(a2 + 48));
  uint64_t result = memcpy((void *)(v6 + 52), (const void *)(a2 + 52), 0x200uLL);
  *v3[1] += 564LL;
  return result;
}

void *sub_10011987C(void *a1, __int128 *a2)
{
  uint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_100119A4C((uint64_t)a1, a2);
  *a1 = off_100195660;
  a1[45] = &off_100195760;
  a1[46] = &off_100195788;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 12_Block_object_dispose(va, 8) = -1;
  *a1 = off_100195660;
  a1[45] = off_1001956E8;
  a1[46] = off_100195710;
  return a1;
}

void sub_100119900(_Unwind_Exception *a1)
{
}

uint64_t sub_100119924(uint64_t a1)
{
  return a1;
}

void *sub_100119964(void *a1, __int128 *a2)
{
  uint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_10011A074((uint64_t)a1, a2);
  *a1 = off_100195880;
  a1[45] = &off_100195980;
  a1[46] = &off_1001959A8;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 12_Block_object_dispose(va, 8) = -1;
  *a1 = off_100195880;
  a1[45] = off_100195908;
  a1[46] = off_100195930;
  return a1;
}

void sub_1001199E8(_Unwind_Exception *a1)
{
}

uint64_t sub_100119A0C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100119A4C(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_1001957F8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 8_Block_object_dispose(va, 8) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_100119AB4(_Unwind_Exception *a1)
{
}

uint64_t sub_100119AC8(uint64_t a1)
{
  *(void *)a1 = off_1001957F8;
  sub_100119D40(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

void sub_100119B64(char *a1)
{
}

uint64_t sub_100119BA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_100119BDC(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

uint64_t sub_100119C28(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100195728);
  sub_100119AC8(v2);
  return std::ios::~ios(a1 + 8);
}

void sub_100119C60(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100195728);
  sub_100119AC8((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

uint64_t sub_100119CA0(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100195728);
  sub_100119AC8(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_100119CE0(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100195728);
  sub_100119AC8((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

void sub_100119D2C(uint64_t a1)
{
  uint64_t v1 = (void *)sub_100119AC8(a1);
  operator delete(v1);
}

uint64_t sub_100119D40(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_100119E90((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_100119E68( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

int *sub_100119E90(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      int v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 564LL;
    __int16 v25 = 2082;
    unint64_t v26 = v10;
    uint64_t v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      __int128 v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        __int128 v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 564LL;
      __int16 v25 = 2082;
      unint64_t v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10011A074(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100195A18;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 8_Block_object_dispose(va, 8) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10011A0DC(_Unwind_Exception *a1)
{
}

uint64_t sub_10011A0F0(uint64_t a1)
{
  *(void *)a1 = off_100195A18;
  sub_10011A368(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

void sub_10011A18C(char *a1)
{
}

uint64_t sub_10011A1D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10011A204(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

uint64_t sub_10011A250(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100195948);
  sub_10011A0F0(v2);
  return std::ios::~ios(a1 + 8);
}

void sub_10011A288(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100195948);
  sub_10011A0F0((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

uint64_t sub_10011A2C8(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100195948);
  sub_10011A0F0(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10011A308(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100195948);
  sub_10011A0F0((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

void sub_10011A354(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10011A0F0(a1);
  operator delete(v1);
}

uint64_t sub_10011A368(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10011A4B8((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10011A490( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

int *sub_10011A4B8(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      int v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 578LL;
    __int16 v25 = 2082;
    unint64_t v26 = v10;
    uint64_t v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      __int128 v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        __int128 v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 578LL;
      __int16 v25 = 2082;
      unint64_t v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10011A69C(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100195B68);
  sub_10011A860(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10011A6D4(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100195B68);
  sub_10011A860(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10011A714(char *a1)
{
}

uint64_t sub_10011A758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10011A78C(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10011A7D8(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100195B68);
  sub_10011A860((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10011A818(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100195B68);
  sub_10011A860((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_10011A860(uint64_t a1)
{
  *(void *)a1 = off_100195C38;
  sub_10011A8FC(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10011A8FC(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10011AA64((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10011AA24( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10011AA50(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10011A860(a1);
  operator delete(v1);
}

int *sub_10011AA64(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      int v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 690LL;
    __int16 v25 = 2082;
    unint64_t v26 = v10;
    uint64_t v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      __int128 v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        __int128 v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 690LL;
      __int16 v25 = 2082;
      unint64_t v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10011AC48(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100195D88);
  sub_10011AE0C(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10011AC80(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100195D88);
  sub_10011AE0C(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10011ACC0(char *a1)
{
}

uint64_t sub_10011AD04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10011AD38(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10011AD84(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100195D88);
  sub_10011AE0C((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10011ADC4(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100195D88);
  sub_10011AE0C((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_10011AE0C(uint64_t a1)
{
  *(void *)a1 = off_100195E58;
  sub_10011AEA8(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10011AEA8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10011B010((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10011AFD0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10011AFFC(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10011AE0C(a1);
  operator delete(v1);
}

int *sub_10011B010(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      int v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 738LL;
    __int16 v25 = 2082;
    unint64_t v26 = v10;
    uint64_t v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      __int128 v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        __int128 v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 738LL;
      __int16 v25 = 2082;
      unint64_t v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10011B1F4(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100195FA8);
  sub_10011B3B8(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10011B22C(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100195FA8);
  sub_10011B3B8(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10011B26C(char *a1)
{
}

uint64_t sub_10011B2B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10011B2E4(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10011B330(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100195FA8);
  sub_10011B3B8((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10011B370(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100195FA8);
  sub_10011B3B8((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_10011B3B8(uint64_t a1)
{
  *(void *)a1 = off_100196078;
  sub_10011B454(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10011B454(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10011B5BC((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10011B57C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10011B5A8(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10011B3B8(a1);
  operator delete(v1);
}

int *sub_10011B5BC(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      int v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 806LL;
    __int16 v25 = 2082;
    unint64_t v26 = v10;
    uint64_t v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      __int128 v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        __int128 v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 806LL;
      __int16 v25 = 2082;
      unint64_t v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

void *sub_10011B7A0(void *a1)
{
  *a1 = off_100195548;
  uint64_t v2 = (void *)a1[23];
  if (v2) {
    operator delete[](v2);
  }
  sub_10011724C((uint64_t)(a1 + 15));
  sub_10011724C((uint64_t)(a1 + 7));
  sub_100006224((uint64_t)(a1 + 5));
  *a1 = off_100178D68;
  sub_100006224((uint64_t)(a1 + 3));
  uint64_t v3 = (std::__shared_weak_count *)a1[2];
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  return a1;
}

uint64_t sub_10011B810@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  int v4 = (char *)operator new(0x198uLL);
  uint64_t result = sub_10011B868((uint64_t)v4, a1);
  *a2 = v4 + 24;
  a2[1] = v4;
  return result;
}

void sub_10011B854(_Unwind_Exception *a1)
{
}

uint64_t sub_10011B868(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)a1 = off_1001960F8;
  CCHmacInit((CCHmacContext *)(a1 + 24), 0, *(const void **)a2, *(void *)(a2 + 8) - *(void *)a2);
  return a1;
}

void sub_10011B8A8(_Unwind_Exception *a1)
{
}

void sub_10011B8BC(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1001960F8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10011B8CC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1001960F8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_10011B8F4(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100195C38;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 8_Block_object_dispose(va, 8) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10011B95C(_Unwind_Exception *a1)
{
}

uint64_t sub_10011B970(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100195E58;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 8_Block_object_dispose(va, 8) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10011B9D8(_Unwind_Exception *a1)
{
}

uint64_t sub_10011B9EC(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100196078;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 8_Block_object_dispose(va, 8) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10011BA54(_Unwind_Exception *a1)
{
}

void sub_10011BA68(uint64_t a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  char v6 = operator new(0xE0uLL);
  sub_10011BAD0(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  sub_10001C350((uint64_t)a3, v6 + 4, (uint64_t)(v6 + 3));
}

void sub_10011BABC(_Unwind_Exception *a1)
{
}

void *sub_10011BAD0(void *a1, uint64_t a2, void *a3)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_10017C438;
  sub_100118B48((uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_10011BB04(_Unwind_Exception *a1)
{
}

uint64_t sub_10011BB18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, off_t a5, char a6)
{
  *(void *)a1 = a3;
  *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  uint64_t v11 = *a4;
  *a4 = 0LL;
  *(void *)(a1 + 16) = v11;
  *(_BYTE *)(a1 + 24) = 1;
  unint64_t v12 = *(void *)(a2 + 40);
  uint64_t v13 = operator new(0x50uLL);
  sub_100079804(v13, v12 >> 12, 0);
  uint64_t v14 = *(void *)(a1 + 8);
  *(void *)(a1 + _Block_object_dispose(va, 8) = v13;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8LL))(v14);
  }
  if ((sub_10011BC90(a1) & 1) == 0)
  {
    if (!a6)
    {
      int v15 = (***(uint64_t (****)(void))(a2 + 8))(*(void *)(a2 + 8));
      sub_10004BBF4(a3, __p);
      a5 = sub_100103268(v15, (uint64_t)__p);
      if (v18 < 0)
      {
        operator delete(__p[0]);
        if (!a5) {
          return a1;
        }
        goto LABEL_7;
      }
    }

    if (a5) {
LABEL_7:
    }
      sub_10011C0E8(a1, 0LL, a5);
  }

  return a1;
}

void sub_10011BC24( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  uint64_t v17 = *(void *)(v15 + 16);
  *(void *)(v15 + 16) = 0LL;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8LL))(v17);
  }
  uint64_t v18 = *(void *)(v15 + 8);
  *(void *)(v15 + _Block_object_dispose(va, 8) = 0LL;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8LL))(v18);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10011BC90(uint64_t a1)
{
  unint64_t v2 = (unint64_t)(*(void *)(*(void *)(a1 + 8) + 16LL) + 7LL) >> 3;
  uint64_t v3 = (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 40LL))(*(void *)(a1 + 16));
  uint64_t v4 = v3;
  BOOL v5 = v3 == v2 || v3 == v2 + 16;
  uint64_t v6 = v5;
  if (v5)
  {
    unint64_t v7 = v3 - v2;
    uint64_t v8 = *(void *)(*(void *)(a1 + 8) + 8LL);
    uint64_t v9 = *((void *)sub_100120DCC() + 1);
    *(void *)&__int128 v26 = v8;
    *((void *)&v26 + 1) = v9;
    if (v9)
    {
      int v10 = (unint64_t *)(v9 + 8);
      do
        unint64_t v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }

    unint64_t v27 = v2;
    unint64_t v28 = v7;
    unint64_t v29 = v2;
    char v30 = 0;
    unsigned int v12 = (*(uint64_t (**)(void, __int128 *))(**(void **)(a1 + 16) + 88LL))(*(void *)(a1 + 16), &v26);
    if (v2 != v12)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      sub_100005148((uint64_t)v23);
      sub_10000552C(v23, (uint64_t)"Failed reading ", 15LL);
      sub_10011CCA4(v23, (void *)a1);
      sub_100006AA8((uint64_t)exception, (uint64_t)v23, v12);
    }

    if (sub_1000BE308())
    {
      *(void *)&__int128 v21 = "sparse_bundles::mapped_blocks_t::load_file()";
      *((void *)&v21 + 1) = 42LL;
      int v22 = 2;
      sub_10011C4A4(v23, &v21);
      sub_10000552C(&v24, (uint64_t)"Found a valid file for ", 23LL);
      sub_10011CCA4(&v24, (void *)a1);
      std::ostream::~ostream(&v24, off_100196218);
      sub_10011CEE8((uint64_t)v23);
      std::ios::~ios(v25);
    }

    *(_BYTE *)(a1 + 24) = 0;
    uint64_t v13 = (std::__shared_weak_count *)*((void *)&v26 + 1);
    if (*((void *)&v26 + 1))
    {
      uint64_t v14 = (unint64_t *)(*((void *)&v26 + 1) + 8LL);
      do
        unint64_t v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }

  else if (v3)
  {
    *(void *)&__int128 v26 = "sparse_bundles::mapped_blocks_t::load_file()";
    *((void *)&v26 + 1) = 42LL;
    LODWORD(v27) = 16;
    sub_100071FF4(v23, &v26);
    sub_10000552C(&v24, (uint64_t)"invalid file size for ", 22LL);
    sub_10011CCA4(&v24, (void *)a1);
    sub_10000552C(&v24, (uint64_t)", current is ", 13LL);
    std::ostream::operator<<(&v24, v4);
    sub_10000552C(&v24, (uint64_t)" while expected is ", 19LL);
    std::ostream::operator<<(&v24, v2);
    sub_10000552C(&v24, (uint64_t)", truncating", 12LL);
    std::ostream::~ostream(&v24, off_10017EBB8);
    sub_1000749F0((uint64_t)v23);
    std::ios::~ios(v25);
    unsigned int v16 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 56LL))(*(void *)(a1 + 16), 0LL);
    if (v16)
    {
      unsigned int v17 = v16;
      uint64_t v18 = __cxa_allocate_exception(0x40uLL);
      sub_100005148((uint64_t)v23);
      sub_10000552C(v23, (uint64_t)"Failed truncating ", 18LL);
      sub_10011CCA4(v23, (void *)a1);
      sub_100006AA8((uint64_t)v18, (uint64_t)v23, v17);
    }
  }

  else if (sub_1000BE308())
  {
    *(void *)&__int128 v26 = "sparse_bundles::mapped_blocks_t::load_file()";
    *((void *)&v26 + 1) = 42LL;
    LODWORD(v27) = 2;
    sub_10011C58C(v23, &v26);
    sub_10000552C(&v24, (uint64_t)"file of ", 8LL);
    sub_10011CCA4(&v24, (void *)a1);
    sub_10000552C(&v24, (uint64_t)" was just created (truncated)", 29LL);
    std::ostream::~ostream(&v24, off_100196438);
    sub_10011D494((uint64_t)v23);
    std::ios::~ios(v25);
  }

  return v6;
}

void sub_10011C040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

uint64_t sub_10011C0E8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6 = a2 + a3 - 1;
  uint64_t result = sub_1000BE308();
  if ((_DWORD)result)
  {
    *(void *)&__int128 v10 = "sparse_bundles::mapped_blocks_t::map_range(uint64_t, uint64_t)";
    *((void *)&v10 + 1) = 42LL;
    int v11 = 2;
    sub_10011C9F8(v12, &v10);
    sub_10011CCA4(&v13, (void *)a1);
    sub_10000552C(&v13, (uint64_t)" - map_range: [", 15LL);
    uint64_t v8 = v13;
    *(_DWORD *)((char *)&v13 + *(void *)(v13 - 24) + 8) |= 0x200u;
    *(_DWORD *)((char *)&v13 + *(void *)(v8 - 24) + _Block_object_dispose(va, 8) = *(_DWORD *)((_BYTE *)&v13 + *(void *)(v8 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::ostream::operator<<(&v13, a2);
    sub_10000552C(&v13, (uint64_t)"-", 1LL);
    std::ostream::operator<<(&v13, v6);
    uint64_t v9 = v13;
    *(_DWORD *)((char *)&v13 + *(void *)(v13 - 24) + 8) &= ~0x200u;
    *(_DWORD *)((char *)&v13 + *(void *)(v9 - 24) + _Block_object_dispose(va, 8) = *(_DWORD *)((_BYTE *)&v13 + *(void *)(v9 - 24) + 8) & 0xFFFFFFB5 | 2;
    sub_10000552C(&v13, (uint64_t)"]", 1LL);
    std::ostream::~ostream(&v13, off_100196878);
    sub_10011DFEC((uint64_t)v12);
    uint64_t result = std::ios::~ios(&v14);
  }

  if (a3)
  {
    uint64_t result = sub_1000969B8(*(void *)(a1 + 8), a2 >> 12, v6 >> 12, 1LL);
    if ((_DWORD)result) {
      *(_BYTE *)(a1 + 24) = 1;
    }
  }

  return result;
}

void sub_10011C270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void sub_10011C284(void *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  int v7 = (**(uint64_t (***)(void))*a1)(*a1);
  sub_10004BBF4(a2, __p);
  uint64_t v8 = operator new(0x458uLL);
  uint64_t v9 = sub_1001024B0(v7, (uint64_t)__p, a3);
  sub_100052AA8((uint64_t)v8, v9, (a3 & 3) != 0, 0);
  *a4 = v8;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10011C320( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10011C34C(uint64_t a1, uint64_t a2, uint64_t a3, off_t a4, char a5)
{
  uint64_t v10 = v12;
  uint64_t v12 = 0LL;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8LL))(v10);
  }
  return a1;
}

void sub_10011C3DC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 8LL))(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10011C400(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = v9;
  uint64_t v9 = 0LL;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8LL))(v7);
  }
  return a1;
}

void sub_10011C480( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 8LL))(a10);
  }
  _Unwind_Resume(exception_object);
}

void *sub_10011C4A4(void *a1, __int128 *a2)
{
  uint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_10011E3D4((uint64_t)a1, a2);
  *a1 = off_100196150;
  a1[45] = &off_100196250;
  a1[46] = &off_100196278;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 12_Block_object_dispose(va, 8) = -1;
  *a1 = off_100196150;
  a1[45] = off_1001961D8;
  a1[46] = off_100196200;
  return a1;
}

void sub_10011C528(_Unwind_Exception *a1)
{
}

uint64_t sub_10011C54C(uint64_t a1)
{
  return a1;
}

void *sub_10011C58C(void *a1, __int128 *a2)
{
  uint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_10011E450((uint64_t)a1, a2);
  *a1 = off_100196370;
  a1[45] = &off_100196470;
  a1[46] = &off_100196498;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 12_Block_object_dispose(va, 8) = -1;
  *a1 = off_100196370;
  a1[45] = off_1001963F8;
  a1[46] = off_100196420;
  return a1;
}

void sub_10011C610(_Unwind_Exception *a1)
{
}

uint64_t sub_10011C634(uint64_t a1)
{
  return a1;
}

uint64_t sub_10011C674(uint64_t a1, uint64_t a2)
{
  return sub_10011C0E8(a1, *(void *)(a2 + 24), *(void *)(a2 + 16));
}

uint64_t sub_10011C680(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    unint64_t v3 = *(void *)(*(void *)(a1 + 8) + 16LL) + 7LL;
    if ((*(uint64_t (**)(void))(**(void **)(a1 + 16) + 40LL))(*(void *)(a1 + 16)) == v3 >> 3
      || (uint64_t v2 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 56LL))(*(void *)(a1 + 16), 0LL),
          !(_DWORD)v2))
    {
      unint64_t v4 = v3 >> 3;
      *(_BYTE *)(a1 + 24) = 0;
      uint64_t v5 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(*(void *)(a1 + 8) + 8LL);
      uint64_t v7 = (std::__shared_weak_count *)*((void *)sub_100120DCC() + 1);
      uint64_t v16 = v6;
      unsigned int v17 = v7;
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          unint64_t v9 = __ldxr(p_shared_owners);
        while (__stxr(v9 + 1, p_shared_owners));
      }

      unint64_t v18 = v4;
      uint64_t v19 = 0LL;
      unint64_t v20 = v4;
      char v21 = 0;
      uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v5 + 80LL))(v5, &v16);
      uint64_t v10 = v17;
      if (v17)
      {
        char v11 = (unint64_t *)&v17->__shared_owners_;
        do
          unint64_t v12 = __ldaxr(v11);
        while (__stlxr(v12 - 1, v11));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }

      if (v4 == (int)v2)
      {
        uint64_t v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 16) + 16LL))(*(void *)(a1 + 16), 1LL);
        if ((_DWORD)v2) {
          *(_BYTE *)(a1 + 24) = 1;
        }
        if (sub_1000BE308())
        {
          *(void *)&__int128 v14 = "sparse_bundles::mapped_blocks_t::flush()";
          *((void *)&v14 + 1) = 38LL;
          int v15 = 2;
          sub_10011C910(&v16, &v14);
          sub_10000552C(&v22, (uint64_t)"Flushed ", 8LL);
          sub_10011CCA4(&v22, (void *)a1);
          sub_10000552C(&v22, (uint64_t)", res=", 6LL);
          std::ostream::operator<<(&v22, v2);
          std::ostream::~ostream(&v22, off_100196658);
          sub_10011DA40((uint64_t)&v16);
          std::ios::~ios(v23);
        }
      }

      else
      {
        *(_BYTE *)(a1 + 24) = 1;
      }
    }
  }

  else
  {
    if (sub_1000BE308())
    {
      *(void *)&__int128 v14 = "sparse_bundles::mapped_blocks_t::flush()";
      *((void *)&v14 + 1) = 38LL;
      int v15 = 2;
      sub_1000EBFFC(&v16, &v14);
      sub_10011CCA4(&v22, (void *)a1);
      sub_10000552C(&v22, (uint64_t)" is clean, skipping flush", 25LL);
      std::ostream::~ostream(&v22, off_10018FB48);
      sub_1000ECA90((uint64_t)&v16);
      std::ios::~ios(v23);
    }

    return 0LL;
  }

  return v2;
}

void sub_10011C8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *sub_10011C910(void *a1, __int128 *a2)
{
  unint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_10011E4CC((uint64_t)a1, a2);
  *a1 = off_100196590;
  a1[45] = &off_100196690;
  a1[46] = &off_1001966B8;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 12_Block_object_dispose(va, 8) = -1;
  *a1 = off_100196590;
  a1[45] = off_100196618;
  a1[46] = off_100196640;
  return a1;
}

void sub_10011C994(_Unwind_Exception *a1)
{
}

uint64_t sub_10011C9B8(uint64_t a1)
{
  return a1;
}

void *sub_10011C9F8(void *a1, __int128 *a2)
{
  unint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_10011E548((uint64_t)a1, a2);
  *a1 = off_1001967B0;
  a1[45] = &off_1001968B0;
  a1[46] = &off_1001968D8;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 12_Block_object_dispose(va, 8) = -1;
  *a1 = off_1001967B0;
  a1[45] = off_100196838;
  a1[46] = off_100196860;
  return a1;
}

void sub_10011CA7C(_Unwind_Exception *a1)
{
}

uint64_t sub_10011CAA0(uint64_t a1)
{
  return a1;
}

uint64_t sub_10011CAE0(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t result = sub_1000BE308();
  if ((_DWORD)result)
  {
    *(void *)&__int128 v11 = "sparse_bundles::mapped_blocks_t::unmap_interval(uint64_t, uint64_t)";
    *((void *)&v11 + 1) = 47LL;
    int v12 = 2;
    sub_100006398(v13, &v11);
    sub_10011CCA4(&v14, (void *)a1);
    sub_10000552C(&v14, (uint64_t)" - unmap_range: [", 17LL);
    uint64_t v7 = v14;
    *(_DWORD *)((char *)&v14 + *(void *)(v14 - 24) + 8) |= 0x200u;
    *(_DWORD *)((char *)&v14 + *(void *)(v7 - 24) + _Block_object_dispose(va, 8) = *(_DWORD *)((_BYTE *)&v14 + *(void *)(v7 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::ostream::operator<<(&v14, a2);
    sub_10000552C(&v14, (uint64_t)"-", 1LL);
    std::ostream::operator<<(&v14, a3);
    uint64_t v8 = v14;
    *(_DWORD *)((char *)&v14 + *(void *)(v14 - 24) + 8) &= ~0x200u;
    *(_DWORD *)((char *)&v14 + *(void *)(v8 - 24) + _Block_object_dispose(va, 8) = *(_DWORD *)((_BYTE *)&v14 + *(void *)(v8 - 24) + 8) & 0xFFFFFFB5 | 2;
    sub_10000552C(&v14, (uint64_t)"]", 1LL);
    std::ostream::~ostream(&v14, off_1001716A8);
    sub_1000064FC((uint64_t)v13);
    uint64_t result = std::ios::~ios(&v15);
  }

  if (a3 != a2)
  {
    unint64_t v9 = a2 >> 12;
    unint64_t v10 = a3 >> 12;
    if ((a2 & 0xFFF) != 0)
    {
      if (v9 == v10) {
        return result;
      }
      ++v9;
    }

    if ((~(_WORD)a3 & 0xFFF) != 0)
    {
      if (v9 == v10) {
        return result;
      }
      --v10;
    }

    uint64_t result = sub_1000969B8(*(void *)(a1 + 8), v9, v10, 0LL);
    if ((_DWORD)result) {
      *(_BYTE *)(a1 + 24) = 1;
    }
  }

  return result;
}

void sub_10011CC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *sub_10011CCA4(void *a1, void *a2)
{
  unint64_t v4 = sub_10000552C(a1, (uint64_t)"mapped blocks of band ", 22LL);
  *(_DWORD *)((char *)v4 + *(void *)(*v4 - 24LL) + _Block_object_dispose(va, 8) = *(_DWORD *)((_BYTE *)v4 + *(void *)(*v4 - 24LL) + 8) & 0xFFFFFFB5 | 8;
  uint64_t v5 = (void *)std::ostream::operator<<(v4, *a2);
  *(_DWORD *)((char *)v5 + *(void *)(*v5 - 24LL) + _Block_object_dispose(va, 8) = *(_DWORD *)((_BYTE *)v5 + *(void *)(*v5 - 24LL) + 8) & 0xFFFFFFB5 | 2;
  return a1;
}

uint64_t sub_10011CD24(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100196218);
  sub_10011CEE8(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10011CD5C(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100196218);
  sub_10011CEE8(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10011CD9C(char *a1)
{
}

uint64_t sub_10011CDE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10011CE14(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10011CE60(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100196218);
  sub_10011CEE8((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10011CEA0(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100196218);
  sub_10011CEE8((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_10011CEE8(uint64_t a1)
{
  *(void *)a1 = off_1001962E8;
  sub_10011CF84(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10011CF84(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10011D0EC((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10011D0AC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10011D0D8(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10011CEE8(a1);
  operator delete(v1);
}

int *sub_10011D0EC(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      unint64_t v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 89LL;
    __int16 v25 = 2082;
    __int128 v26 = v10;
    __int128 v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      int v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        uint64_t v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 89LL;
      __int16 v25 = 2082;
      __int128 v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10011D2D0(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100196438);
  sub_10011D494(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10011D308(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100196438);
  sub_10011D494(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10011D348(char *a1)
{
}

uint64_t sub_10011D38C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10011D3C0(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10011D40C(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100196438);
  sub_10011D494((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10011D44C(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100196438);
  sub_10011D494((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_10011D494(uint64_t a1)
{
  *(void *)a1 = off_100196508;
  sub_10011D530(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10011D530(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10011D698((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10011D658( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10011D684(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10011D494(a1);
  operator delete(v1);
}

int *sub_10011D698(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      unint64_t v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 99LL;
    __int16 v25 = 2082;
    __int128 v26 = v10;
    __int128 v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      int v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        uint64_t v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 99LL;
      __int16 v25 = 2082;
      __int128 v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10011D87C(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100196658);
  sub_10011DA40(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10011D8B4(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100196658);
  sub_10011DA40(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10011D8F4(char *a1)
{
}

uint64_t sub_10011D938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10011D96C(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10011D9B8(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100196658);
  sub_10011DA40((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10011D9F8(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100196658);
  sub_10011DA40((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_10011DA40(uint64_t a1)
{
  *(void *)a1 = off_100196728;
  sub_10011DADC(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10011DADC(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10011DC44((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10011DC04( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10011DC30(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10011DA40(a1);
  operator delete(v1);
}

int *sub_10011DC44(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      unint64_t v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 141LL;
    __int16 v25 = 2082;
    __int128 v26 = v10;
    __int128 v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      int v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        uint64_t v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 141LL;
      __int16 v25 = 2082;
      __int128 v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10011DE28(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100196878);
  sub_10011DFEC(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10011DE60(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100196878);
  sub_10011DFEC(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10011DEA0(char *a1)
{
}

uint64_t sub_10011DEE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10011DF18(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_10011DF64(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100196878);
  sub_10011DFEC((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10011DFA4(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100196878);
  sub_10011DFEC((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_10011DFEC(uint64_t a1)
{
  *(void *)a1 = off_100196948;
  sub_10011E088(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10011E088(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_10011E1F0((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10011E1B0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10011E1DC(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10011DFEC(a1);
  operator delete(v1);
}

int *sub_10011E1F0(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      unint64_t v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 150LL;
    __int16 v25 = 2082;
    __int128 v26 = v10;
    __int128 v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      int v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        uint64_t v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 150LL;
      __int16 v25 = 2082;
      __int128 v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_10011E3D4(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_1001962E8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 8_Block_object_dispose(va, 8) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10011E43C(_Unwind_Exception *a1)
{
}

uint64_t sub_10011E450(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100196508;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 8_Block_object_dispose(va, 8) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10011E4B8(_Unwind_Exception *a1)
{
}

uint64_t sub_10011E4CC(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100196728;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 8_Block_object_dispose(va, 8) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10011E534(_Unwind_Exception *a1)
{
}

uint64_t sub_10011E548(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100196948;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 8_Block_object_dispose(va, 8) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10011E5B0(_Unwind_Exception *a1)
{
}

char *sub_10011E5C4(unint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)&qword_1001A4858);
  if ((v1 & 1) == 0)
  {
    unint64_t v6 = a1;
    int v5 = __cxa_guard_acquire(&qword_1001A4858);
    a1 = v6;
    if (v5)
    {
      __cxa_atexit((void (*)(void *))sub_10011E8F8, 0LL, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_1001A4858);
      a1 = v6;
    }
  }

  unint64_t v2 = 0x9DDFEA08EB382D69LL * (((8 * a1) + 8LL) ^ HIDWORD(a1));
  unint64_t v3 = 0x9DDFEA08EB382D69LL * (HIDWORD(a1) ^ (v2 >> 47) ^ v2);
  return (char *)&unk_1001A3F98
       + 64 * (unint64_t)((9 * ((v3 >> 47) ^ v3)) & 0xF);
}

char *sub_10011E684(unint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)&qword_1001A4860);
  if ((v1 & 1) == 0)
  {
    unint64_t v6 = a1;
    int v5 = __cxa_guard_acquire(&qword_1001A4860);
    a1 = v6;
    if (v5)
    {
      __cxa_atexit((void (*)(void *))sub_10011E930, 0LL, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_1001A4860);
      a1 = v6;
    }
  }

  unint64_t v2 = 0x9DDFEA08EB382D69LL * (((8 * a1) + 8LL) ^ HIDWORD(a1));
  unint64_t v3 = 0x9DDFEA08EB382D69LL * (HIDWORD(a1) ^ (v2 >> 47) ^ v2);
  return (char *)&unk_1001A4398 + 48 * ((9 * ((v3 >> 47) ^ v3)) & 0xF);
}

uint64_t sub_10011E748(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  *(void *)uint64_t result = off_1001969C8;
  *(void *)(result + _Block_object_dispose(va, 8) = v2;
  *(_BYTE *)(result + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a2 + 16) = 0;
  return result;
}

uint64_t sub_10011E768(uint64_t a1)
{
  *(void *)a1 = off_1001969C8;
  if (*(_BYTE *)(a1 + 16))
  {
    uint64_t v2 = *(unint64_t **)(a1 + 8);
    do
    {
      unint64_t v3 = __ldxr(v2);
      unint64_t v4 = v3 - 1;
    }

    while (__stxr(v4, v2));
    if (!v4) {
      sub_10011E8A8((unint64_t)v2);
    }
  }

  return a1;
}

void sub_10011E7C0(uint64_t a1)
{
  unsigned __int8 v1 = (void *)sub_10011E768(a1);
  operator delete(v1);
}

unint64_t *sub_10011E7D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v6 = *(unsigned __int8 *)(a1 + 16);
  uint64_t result = *(unint64_t **)(a1 + 8);
  if (v6)
  {
    do
    {
      unint64_t v8 = __ldxr(result);
      unint64_t v9 = v8 - 1;
    }

    while (__stxr(v9, result));
    if (!v9) {
      sub_10011E8A8((unint64_t)result);
    }
    *(_BYTE *)(a1 + 16) = 0;
    return (unint64_t *)sub_1000CC470(*(void *)(a1 + 8), a2, a3);
  }

  else
  {
    *(_BYTE *)(a3 + 16) = 0;
    *(void *)a3 = off_1001969E8;
    *(void *)(a3 + _Block_object_dispose(va, 8) = result;
    *(void *)(a3 + 24) = a2;
  }

  return result;
}

uint64_t sub_10011E858(uint64_t a1)
{
  *(void *)a1 = off_1001969E8;
  if (*(_BYTE *)(a1 + 16))
  {
    atomic_store(*(void *)(a1 + 24), *(unint64_t **)(a1 + 8));
    sub_10011E8A8(*(void *)(a1 + 8));
  }

  *(_BYTE *)(a1 + 16) = 0;
  return sub_10011E768(a1);
}

void sub_10011E8A8(unint64_t a1)
{
  uint64_t v2 = sub_10011E5C4(a1);
  std::mutex::lock((std::mutex *)v2);
  unint64_t v3 = sub_10011E684(a1);
  std::condition_variable::notify_all((std::condition_variable *)v3);
  std::mutex::unlock((std::mutex *)v2);
}

void sub_10011E8E4(uint64_t a1)
{
  unsigned __int8 v1 = (void *)sub_10011E858(a1);
  operator delete(v1);
}

void sub_10011E8F8()
{
}

void sub_10011E930()
{
}

void *sub_10011E968(void *a1, uint64_t a2)
{
  if ((_DWORD)a2 == 2)
  {
    unint64_t v3 = "full_fsync";
    uint64_t v4 = 10LL;
  }

  else if ((_DWORD)a2 == 1)
  {
    unint64_t v3 = "fsync";
    uint64_t v4 = 5LL;
  }

  else if ((_DWORD)a2)
  {
    int v5 = sub_10000552C(a1, (uint64_t)"bad flush type (", 16LL);
    a1 = (void *)std::ostream::operator<<(v5, a2);
    unint64_t v3 = ")";
    uint64_t v4 = 1LL;
  }

  else
  {
    unint64_t v3 = "barrier";
    uint64_t v4 = 7LL;
  }

  return sub_10000552C(a1, (uint64_t)v3, v4);
}

void *sub_10011E9EC(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1 + *(void *)(*a1 - 24LL);
  int v5 = *((_DWORD *)v4 + 2);
  *((_DWORD *)v4 + 2) = v5 & 0xFFFFFFB5 | 8;
  char v23 = 48;
  int v6 = sub_10000EDBC(a1, &v23);
  uint64_t v7 = *v6;
  *(uint64_t *)((char *)v6 + *(void *)(*v6 - 24) + 24) = 2LL;
  *(_DWORD *)((char *)v6 + *(void *)(v7 - 24) + 8) |= 0x200u;
  unint64_t v8 = sub_10000552C(v6, (uint64_t)"sg: buffer = ", 13LL);
  unint64_t v9 = (void *)std::ostream::operator<<(v8, *a2);
  unint64_t v10 = sub_10000552C(v9, (uint64_t)" [", 2LL);
  __int128 v11 = (void *)std::ostream::operator<<(v10, a2);
  int v12 = sub_10000552C(v11, (uint64_t)"] ", 2LL);
  uint64_t v13 = *v12;
  *(_DWORD *)((char *)v12 + *(void *)(*v12 - 24) + _Block_object_dispose(va, 8) = *(_DWORD *)((_BYTE *)v12 + *(void *)(*v12 - 24) + 8) & 0xFFFFFFB5 | 2;
  *(uint64_t *)((char *)v12 + *(void *)(v13 - 24) + 24) = 0LL;
  *(_DWORD *)((char *)v12 + *(void *)(v13 - 24) + 8) &= ~0x200u;
  os_log_type_t v14 = sub_10000552C(v12, (uint64_t)" size = ", 8LL);
  uint64_t v15 = (void *)std::ostream::operator<<(v14, a2[2]);
  uint64_t v16 = sub_10000552C(v15, (uint64_t)" buffer_size = ", 15LL);
  unsigned int v17 = (void *)std::ostream::operator<<(v16, a2[4]);
  *(_DWORD *)((char *)v17 + *(void *)(*v17 - 24LL) + _Block_object_dispose(va, 8) = *(_DWORD *)((_BYTE *)v17 + *(void *)(*v17 - 24LL) + 8) & 0xFFFFFFB5 | 8;
  char v22 = 48;
  uint64_t v18 = sub_10000EDBC(v17, &v22);
  uint64_t v19 = *v18;
  *(uint64_t *)((char *)v18 + *(void *)(*v18 - 24) + 24) = 2LL;
  *(_DWORD *)((char *)v18 + *(void *)(v19 - 24) + 8) |= 0x200u;
  int v20 = sub_10000552C(v18, (uint64_t)" offset = ", 10LL);
  std::ostream::operator<<(v20, a2[3]);
  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + _Block_object_dispose(va, 8) = v5;
  return a1;
}

void *sub_10011EBA0(void *result)
{
  result[1] = 0LL;
  result[2] = 0LL;
  unint64_t *result = off_100196A40;
  return result;
}

uint64_t sub_10011EBB4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 152LL))(a2, a1);
}

void sub_10011EBCC(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(const void **)a1;
  if (v4
  {
    int v6 = *(std::__shared_weak_count **)(a1 + 8);
    v20[2] = v5;
    __int16 v21 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        unint64_t v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }

    unint64_t v9 = (std::__shared_weak_count *)*((void *)v5 + 4);
    v20[0] = *((void *)v5 + 3);
    v20[1] = v9;
    if (v9)
    {
      unint64_t v10 = (unint64_t *)&v9->__shared_owners_;
      do
        unint64_t v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }

    sub_10011EBCC(v20);
    if (v9)
    {
      int v12 = (unint64_t *)&v9->__shared_owners_;
      do
        unint64_t v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }

    os_log_type_t v14 = v21;
    if (v21)
    {
      uint64_t v15 = (unint64_t *)&v21->__shared_owners_;
      do
        unint64_t v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }

  else
  {
    uint64_t v17 = *(void *)(a1 + 8);
    *a2 = *(void *)a1;
    a2[1] = v17;
    if (v17)
    {
      uint64_t v18 = (unint64_t *)(v17 + 8);
      do
        unint64_t v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
  }

void sub_10011ECFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_10011ED18(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(const void **)a1;
  if (v4
  {
    int v6 = *(std::__shared_weak_count **)(a1 + 8);
    char v22 = v5;
    char v23 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        unint64_t v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }

    unint64_t v9 = v5[4];
    v20[0] = v5[3];
    v20[1] = v9;
    if (v9)
    {
      unint64_t v10 = (unint64_t *)&v9->__shared_owners_;
      do
        unint64_t v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }

    sub_10011EE74((uint64_t)v20, &v22, &v21);
    *(_OWORD *)a2 = v21;
    __int128 v21 = 0uLL;
    if (v9)
    {
      int v12 = (unint64_t *)&v9->__shared_owners_;
      do
        unint64_t v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }

    os_log_type_t v14 = v23;
    if (v23)
    {
      uint64_t v15 = (unint64_t *)&v23->__shared_owners_;
      do
        unint64_t v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }

  else
  {
    uint64_t v17 = *(void *)(a1 + 8);
    *(void *)a2 = *(void *)a1;
    *(void *)(a2 + _Block_object_dispose(va, 8) = v17;
    if (v17)
    {
      uint64_t v18 = (unint64_t *)(v17 + 8);
      do
        unint64_t v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
  }

void sub_10011EE58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
}

void sub_10011EE74(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  int v6 = *(const void **)a1;
  if (v6
  {
    unint64_t v8 = *(std::__shared_weak_count **)(a1 + 8);
    char v23 = v7;
    uint64_t v24 = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        unint64_t v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }

    unint64_t v11 = v7[4];
    v22[0] = v7[3];
    v22[1] = v11;
    if (v11)
    {
      int v12 = (unint64_t *)&v11->__shared_owners_;
      do
        unint64_t v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }

    sub_10011EE74(v22, &v23);
    if (v11)
    {
      os_log_type_t v14 = (unint64_t *)&v11->__shared_owners_;
      do
        unint64_t v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }

    unint64_t v16 = v24;
    if (v24)
    {
      uint64_t v17 = (unint64_t *)&v24->__shared_owners_;
      do
        unint64_t v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }

  else
  {
    uint64_t v19 = a2[1];
    *a3 = *a2;
    a3[1] = v19;
    if (v19)
    {
      int v20 = (unint64_t *)(v19 + 8);
      do
        unint64_t v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
  }

void sub_10011EFB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

uint64_t sub_10011EFD4(uint64_t a1, const void **a2, uint64_t *a3)
{
  uint64_t v4 = *(const void **)a1;
  if (v4 == *a2) {
    return 4294967274LL;
  }
  if (!v4) {
    return 4294967294LL;
  }
  if (!v7) {
    return 4294967294LL;
  }
  unint64_t v8 = *(std::__shared_weak_count **)(a1 + 8);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      unint64_t v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }

  unint64_t v11 = (const void *)*((void *)v7 + 3);
  int v12 = (std::__shared_weak_count *)*((void *)v7 + 4);
  unint64_t v28 = v11;
  unint64_t v29 = v12;
  if (v12)
  {
    unint64_t v13 = (unint64_t *)&v12->__shared_owners_;
    do
      unint64_t v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }

  if (v11 == *a2)
  {
    uint64_t v17 = *a3;
    uint64_t v16 = a3[1];
    if (v16)
    {
      unint64_t v18 = (unint64_t *)(v16 + 8);
      do
        unint64_t v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }

    unint64_t v15 = (std::__shared_weak_count *)*((void *)v7 + 4);
    *((void *)v7 + 3) = v17;
    *((void *)v7 + 4) = v16;
    if (v15)
    {
      int v20 = (unint64_t *)&v15->__shared_owners_;
      do
        unint64_t v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }

      unint64_t v15 = 0LL;
    }
  }

  else
  {
    unint64_t v15 = (std::__shared_weak_count *)sub_10011EFD4(&v28, a2, a3);
  }

  char v22 = v29;
  if (v29)
  {
    char v23 = (unint64_t *)&v29->__shared_owners_;
    do
      unint64_t v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

  if (v8)
  {
    __int16 v25 = (unint64_t *)&v8->__shared_owners_;
    do
      unint64_t v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  return (uint64_t)v15;
}

void sub_10011F174(_Unwind_Exception *exception_object)
{
  if (v2) {
    sub_100126504(v2);
  }
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      unint64_t v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }

  _Unwind_Resume(exception_object);
}

void sub_10011F1C0(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(const void **)a1;
  if (*(void *)a1
  {
    int v6 = *(std::__shared_weak_count **)(a1 + 8);
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        unint64_t v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }

    uint64_t v9 = v5[4];
    *a2 = v5[3];
    a2[1] = v9;
    if (v9)
    {
      unint64_t v10 = (unint64_t *)(v9 + 8);
      do
        unint64_t v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }

    if (v6)
    {
      int v12 = (unint64_t *)&v6->__shared_owners_;
      do
        unint64_t v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }

  else
  {
    uint64_t v14 = *(void *)(a1 + 8);
    *a2 = v4;
    a2[1] = v14;
    if (v14)
    {
      unint64_t v15 = (unint64_t *)(v14 + 8);
      do
        unint64_t v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
  }

uint64_t sub_10011F2AC(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, char a5)
{
  unint64_t v12 = a4;
  uint64_t v13 = a3;
  *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)a1 = off_100178D68;
  *(void *)(a1 + 24) = *a2;
  uint64_t v7 = a2[1];
  *(void *)(a1 + 32) = v7;
  if (v7)
  {
    unint64_t v8 = (unint64_t *)(v7 + 8);
    do
      unint64_t v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }

  *(void *)a1 = off_100196B00;
  *(void *)(a1 + 40) = a3;
  unsigned int v11 = 0;
  sub_1001206E8(&v13, &v11, &v12, (void *)(a1 + 48));
  *(_OWORD *)(a1 + 89) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_BYTE *)(a1 + 112) = a5;
  return a1;
}

void sub_10011F350(_Unwind_Exception *a1)
{
}

uint64_t sub_10011F368(uint64_t a1, uint64_t a2)
{
  if ((void)v22)
  {
    memcpy((void *)v22, *(const void **)a2, *(void *)(a2 + 16));
    __int128 v4 = *(_OWORD *)(a2 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
    __int128 v18 = v22;
    if (*((void *)&v22 + 1))
    {
      int v6 = (unint64_t *)(*((void *)&v22 + 1) + 8LL);
      do
        unint64_t v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }

    *(_OWORD *)unint64_t v19 = v4;
    *(void *)&v19[16] = v5;
    v19[24] = 0;
    sub_1000198A4(a1 + 64, &v18);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)v19;
    *(_OWORD *)(a1 + 89) = *(_OWORD *)&v19[9];
    unint64_t v8 = (std::__shared_weak_count *)*((void *)&v18 + 1);
    if (*((void *)&v18 + 1))
    {
      unint64_t v9 = (unint64_t *)(*((void *)&v18 + 1) + 8LL);
      do
        unint64_t v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }

    uint64_t v11 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 80LL))(*(void *)(a1 + 24), a1 + 64);
  }

  else
  {
    *(void *)&__int128 v16 = "int BackendSG::write(const sg_entry &)";
    *((void *)&v16 + 1) = 20LL;
    int v17 = 16;
    sub_10001B43C(&v18, &v16);
    sub_10000552C(&v20, (uint64_t)"BackendSG: error allocating buffer", 34LL);
    std::ostream::~ostream(&v20, off_100172D68);
    sub_10001B5A0((uint64_t)&v18);
    std::ios::~ios(&v21);
    uint64_t v11 = 4294967284LL;
  }

  unint64_t v12 = (std::__shared_weak_count *)*((void *)&v22 + 1);
  if (*((void *)&v22 + 1))
  {
    uint64_t v13 = (unint64_t *)(*((void *)&v22 + 1) + 8LL);
    do
      unint64_t v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

  return v11;
}

void sub_10011F504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

uint64_t sub_10011F52C(uint64_t a1, uint64_t a2)
{
  if ((void)v22)
  {
    __int128 v4 = *(_OWORD *)(a2 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
    __int128 v18 = v22;
    if (*((void *)&v22 + 1))
    {
      int v6 = (unint64_t *)(*((void *)&v22 + 1) + 8LL);
      do
        unint64_t v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }

    *(_OWORD *)unint64_t v19 = v4;
    *(void *)&v19[16] = v5;
    v19[24] = 0;
    sub_1000198A4(a1 + 64, &v18);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)v19;
    *(_OWORD *)(a1 + 89) = *(_OWORD *)&v19[9];
    unint64_t v8 = (std::__shared_weak_count *)*((void *)&v18 + 1);
    if (*((void *)&v18 + 1))
    {
      unint64_t v9 = (unint64_t *)(*((void *)&v18 + 1) + 8LL);
      do
        unint64_t v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }

    uint64_t v11 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 88LL))(*(void *)(a1 + 24), a1 + 64);
    if ((v11 & 0x80000000) == 0 && *(_BYTE *)(a1 + 112)) {
      memcpy(*(void **)a2, *(const void **)(a1 + 64), *(void *)(a1 + 80));
    }
  }

  else
  {
    *(void *)&__int128 v16 = "int BackendSG::read(const sg_entry &)";
    *((void *)&v16 + 1) = 19LL;
    int v17 = 16;
    sub_10011F70C(&v18, &v16);
    sub_10000552C(&v20, (uint64_t)"BackendSG: error allocating buffer", 34LL);
    std::ostream::~ostream(&v20, off_100196D90);
    sub_100120290((uint64_t)&v18);
    std::ios::~ios(&v21);
    uint64_t v11 = 4294967284LL;
  }

  unint64_t v12 = (std::__shared_weak_count *)*((void *)&v22 + 1);
  if (*((void *)&v22 + 1))
  {
    uint64_t v13 = (unint64_t *)(*((void *)&v22 + 1) + 8LL);
    do
      unint64_t v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

  return v11;
}

void sub_10011F6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *sub_10011F70C(void *a1, __int128 *a2)
{
  unint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_1001207E8((uint64_t)a1, a2);
  *a1 = off_100196CC8;
  a1[45] = &off_100196DC8;
  a1[46] = &off_100196DF0;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 12_Block_object_dispose(va, 8) = -1;
  *a1 = off_100196CC8;
  a1[45] = off_100196D50;
  a1[46] = off_100196D78;
  return a1;
}

void sub_10011F790(_Unwind_Exception *a1)
{
}

uint64_t sub_10011F7B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_10011F7F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 56LL))(*(void *)(a1 + 24));
  if ((_DWORD)v4)
  {
    *(void *)&__int128 v13 = "int BackendSG::truncate(uint64_t)";
    *((void *)&v13 + 1) = 23LL;
    int v14 = 16;
    sub_1000698D8(&v15, &v13);
    sub_10000552C(&v17, (uint64_t)"BackendSG: truncating the inner backend failed, CFErrorRef error = ", 56LL);
    std::ostream::operator<<(&v17, v4);
    std::ostream::~ostream(&v17, off_10017DC80);
    sub_10006E4FC((uint64_t)&v15);
    std::ios::~ios(&v18);
  }

  else
  {
    __int128 v6 = *(_OWORD *)(a1 + 88);
    uint64_t v7 = *(void *)(a1 + 72);
    *(void *)&__int128 v15 = *(void *)(a1 + 64);
    *((void *)&v15 + 1) = v7;
    if (v7)
    {
      unint64_t v8 = (unint64_t *)(v7 + 8);
      do
        unint64_t v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }

    *(void *)__int128 v16 = a2;
    *(_OWORD *)&v16[8] = v6;
    v16[24] = 0;
    sub_1000198A4(a1 + 64, &v15);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)v16;
    *(_OWORD *)(a1 + 89) = *(_OWORD *)&v16[9];
    unint64_t v10 = (std::__shared_weak_count *)*((void *)&v15 + 1);
    if (*((void *)&v15 + 1))
    {
      uint64_t v11 = (unint64_t *)(*((void *)&v15 + 1) + 8LL);
      do
        unint64_t v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }

  return v4;
}

void sub_10011F93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

__n128 sub_10011F950(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)a1 = off_100178D68;
  uint64_t v3 = a3[1];
  *(void *)(a1 + 24) = *a3;
  *(void *)(a1 + 32) = v3;
  if (v3)
  {
    uint64_t v4 = (unint64_t *)(v3 + 8);
    do
      unint64_t v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }

  *(void *)a1 = off_100196B00;
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 56) = v7;
  if (v7)
  {
    unint64_t v8 = (unint64_t *)(v7 + 8);
    do
      unint64_t v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }

  uint64_t v10 = *(void *)(a2 + 72);
  *(void *)(a1 + sub_100006224(v4 - 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v10;
  if (v10)
  {
    uint64_t v11 = (unint64_t *)(v10 + 8);
    do
      unint64_t v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }

  __n128 result = *(__n128 *)(a2 + 80);
  *(_OWORD *)(a1 + 89) = *(_OWORD *)(a2 + 89);
  *(__n128 *)(a1 + 80) = result;
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  return result;
}

double sub_10011F9F0@<D0>(uint64_t a1@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  double result = v5[0];
  *a3 = *(_OWORD *)v5;
  return result;
}

uint64_t sub_10011FA30(uint64_t a1, void *a2, size_t a3)
{
  *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)a1 = off_100178D68;
  uint64_t v4 = a2[1];
  *(void *)(a1 + 24) = *a2;
  *(void *)(a1 + 32) = v4;
  if (v4)
  {
    unint64_t v5 = (unint64_t *)(v4 + 8);
    do
      unint64_t v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }

  *(void *)a1 = off_100196BC8;
  *(void *)(a1 + 40) = 850045863LL;
  *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + sub_100006224(v4 - 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(void *)(a1 + 96) = 0LL;
  sub_1001195E8((void *)(a1 + 104), a3);
  *(_BYTE *)(a1 + 12_Block_object_dispose(va, 8) = 0;
  *(_BYTE *)(a1 + 136) = 0;
  return a1;
}

void sub_10011FAC8(_Unwind_Exception *a1)
{
}

uint64_t sub_10011FAE8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 104);
  unint64_t v5 = a2 % (*(void *)(a1 + 112) - v4);
  if (!v5) {
    goto LABEL_11;
  }
  unint64_t v6 = (std::__shared_weak_count *)*((void *)sub_100120DCC() + 1);
  uint64_t v14 = v4;
  __int128 v15 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }

  unint64_t v16 = v5;
  uint64_t v17 = a2 - v5;
  unint64_t v18 = v5;
  char v19 = 0;
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)a1 + 104LL))(a1, &v14);
  uint64_t v10 = v15;
  if (v15)
  {
    uint64_t v11 = (unint64_t *)&v15->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  if (v5 == (int)v9)
  {
LABEL_11:
    uint64_t v9 = 0LL;
    *(void *)(a1 + 12_Block_object_dispose(va, 8) = a2;
    *(_BYTE *)(a1 + 136) = 1;
  }

  return v9;
}

void sub_10011FBD4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unint64_t sub_10011FBE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 40);
  std::mutex::lock((std::mutex *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 136))
  {
    unint64_t v15 = sub_10011FAE8(a1, *(void *)(a2 + 24));
    if ((_DWORD)v15) {
      goto LABEL_34;
    }
  }

  unint64_t v5 = *(void *)(a1 + 128);
  uint64_t v6 = *(void *)(a1 + 104);
  size_t v7 = *(void *)(a1 + 112) - v6;
  unint64_t v8 = v5 % v7;
  if (v5 % v7)
  {
    size_t v9 = v7 - v8;
    if (v9 >= *(void *)(a2 + 16)) {
      size_t v10 = *(void *)(a2 + 16);
    }
    else {
      size_t v10 = v9;
    }
    memcpy((void *)(v6 + v8), *(const void **)a2, v10);
    size_t v11 = *(void *)(a1 + 104);
    size_t v7 = *(void *)(a1 + 112) - v11;
    if (v10 + v8 == v7)
    {
      unint64_t v12 = (std::__shared_weak_count *)*((void *)sub_100120DCC() + 1);
      size_t v30 = v11;
      char v31 = v12;
      if (v12)
      {
        p_shared_owners = (unint64_t *)&v12->__shared_owners_;
        do
          unint64_t v14 = __ldxr(p_shared_owners);
        while (__stxr(v14 + 1, p_shared_owners));
      }

      unint64_t v32 = v10 + v8;
      size_t v33 = v5 - v8;
      size_t v34 = v10 + v8;
      char v35 = 0;
      unint64_t v15 = (*(uint64_t (**)(void, size_t *))(**(void **)(a1 + 24) + 80LL))(*(void *)(a1 + 24), &v30);
      unint64_t v16 = v31;
      unint64_t v17 = v32;
      if (v31)
      {
        unint64_t v18 = (unint64_t *)&v31->__shared_owners_;
        do
          unint64_t v19 = __ldaxr(v18);
        while (__stlxr(v19 - 1, v18));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }

      size_t v7 = *(void *)(a1 + 112) - *(void *)(a1 + 104);
    }
  }

  else
  {
    size_t v10 = 0LL;
  }

  unint64_t v15 = *(void *)(a2 + 16);
  unint64_t v20 = (v15 - v10) / v7 * v7;
  if (v15 - v10 == (v15 - v10) % v7)
  {
LABEL_31:
    if (v15 > v10)
    {
      memcpy(*(void **)(a1 + 104), (const void *)(*(void *)a2 + v10), v15 - v10);
      unint64_t v15 = *(void *)(a2 + 16);
    }

    *(void *)(a1 + 128) += v15;
    goto LABEL_34;
  }

  uint64_t v21 = *(void *)(a2 + 32);
  size_t v22 = *(void *)(a2 + 24) + v10;
  char v23 = *(std::__shared_weak_count **)(a2 + 8);
  size_t v30 = *(void *)a2 + v10;
  char v31 = v23;
  if (v23)
  {
    unint64_t v24 = (unint64_t *)&v23->__shared_owners_;
    do
      unint64_t v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }

  unint64_t v32 = v20;
  size_t v33 = v22;
  size_t v34 = v21 - v10;
  char v35 = 0;
  unint64_t v15 = (*(uint64_t (**)(void, size_t *))(**(void **)(a1 + 24) + 80LL))(*(void *)(a1 + 24), &v30);
  unint64_t v26 = v31;
  if (v31)
  {
    unint64_t v27 = (unint64_t *)&v31->__shared_owners_;
    do
      unint64_t v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }

  if (v20 == (int)v15)
  {
    v10 += v20;
    unint64_t v15 = *(void *)(a2 + 16);
    goto LABEL_31;
  }

void sub_10011FE34( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_10011FE60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 40);
  std::mutex::lock((std::mutex *)(a1 + 40));
  if (*(_BYTE *)(a1 + 136))
  {
    uint64_t v5 = *(void *)(a1 + 104);
    unint64_t v6 = *(void *)(a1 + 112) - v5;
    unint64_t v7 = *(void *)(a1 + 128) % v6;
    if (!v7) {
      goto LABEL_15;
    }
    bzero((void *)(v5 + v7), v6 - v7);
    uint64_t v8 = *(void *)(a1 + 128);
    uint64_t v9 = *(void *)(a1 + 104);
    uint64_t v10 = *(void *)(a1 + 112);
    size_t v11 = (std::__shared_weak_count *)*((void *)sub_100120DCC() + 1);
    uint64_t v22 = v9;
    char v23 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        unint64_t v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
    }

    uint64_t v24 = v10 - v9;
    uint64_t v25 = v8 - v7;
    uint64_t v26 = v10 - v9;
    char v27 = 0;
    int v14 = (*(uint64_t (**)(void, uint64_t *))(**(void **)(a1 + 24) + 80LL))(*(void *)(a1 + 24), &v22);
    uint64_t v15 = v14;
    uint64_t v16 = v14 >= 0 ? 4294967291LL : v14;
    unint64_t v17 = v23;
    uint64_t v18 = v24;
    if (v23)
    {
      unint64_t v19 = (unint64_t *)&v23->__shared_owners_;
      do
        unint64_t v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }

    if (v18 == v15) {
LABEL_15:
    }
      uint64_t v16 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 16LL))(*(void *)(a1 + 24), a2);
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  std::mutex::unlock(v4);
  return v16;
}

void sub_10011FFA8(_Unwind_Exception *a1)
{
}

void sub_10011FFD4(uint64_t a1)
{
  uint64_t v1 = (void *)sub_100120678(a1);
  operator delete(v1);
}

void *sub_10011FFE8(uint64_t a1, void *a2)
{
  return sub_10000552C(a2, (uint64_t)"BufferedWriteBackend", 20LL);
}

void *sub_10011FFFC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_10001B3C8(a2, (void *)(a1 + 8));
}

void *sub_100120008(void *a1)
{
  *a1 = off_100196B00;
  sub_100006224((uint64_t)(a1 + 8));
  sub_100006224((uint64_t)(a1 + 6));
  *a1 = off_100178D68;
  sub_100006224((uint64_t)(a1 + 3));
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void sub_100120060(void *a1)
{
  *a1 = off_100196B00;
  sub_100006224((uint64_t)(a1 + 8));
  sub_100006224((uint64_t)(a1 + 6));
  *a1 = off_100178D68;
  sub_100006224((uint64_t)(a1 + 3));
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  operator delete(a1);
}

void *sub_1001200B8(uint64_t a1, void *a2)
{
  return sub_10000552C(a2, (uint64_t)"BackendSG", 9LL);
}

uint64_t sub_1001200CC(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100196D90);
  sub_100120290(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_100120104(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100196D90);
  sub_100120290(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_100120144(char *a1)
{
}

uint64_t sub_100120188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_1001201BC(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

void sub_100120208(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100196D90);
  sub_100120290((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_100120248(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100196D90);
  sub_100120290((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_100120290(uint64_t a1)
{
  *(void *)a1 = off_100196E60;
  sub_10012032C(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10012032C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_100120494((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_100120454( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100120480(uint64_t a1)
{
  uint64_t v1 = (void *)sub_100120290(a1);
  operator delete(v1);
}

int *sub_100120494(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      uint64_t v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 138LL;
    __int16 v25 = 2082;
    uint64_t v26 = v10;
    size_t v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      unint64_t v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    unint64_t v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        uint64_t v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 138LL;
      __int16 v25 = 2082;
      uint64_t v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  double result = __error();
  int *result = v5;
  return result;
}

uint64_t sub_100120678(uint64_t a1)
{
  *(void *)a1 = off_100196BC8;
  sub_10011FE60(a1, 1LL);
  uint64_t v2 = *(void **)(a1 + 104);
  if (v2)
  {
    *(void *)(a1 + 112) = v2;
    operator delete(v2);
  }

  std::mutex::~mutex((std::mutex *)(a1 + 40));
  *(void *)a1 = off_100178D68;
  sub_100006224(a1 + 24);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  return a1;
}

void *sub_1001206E8@<X0>( uint64_t *a1@<X1>, unsigned int *a2@<X2>, unint64_t *a3@<X3>, void *a4@<X8>)
{
  uint64_t v8 = operator new(0xB8uLL);
  double result = sub_100120758(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_100120744(_Unwind_Exception *a1)
{
}

void *sub_100120758(void *a1, uint64_t *a2, unsigned int *a3, unint64_t *a4)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_100196EE0;
  sub_1000FFFE4((uint64_t)(a1 + 3), *a2, *a3, *a4);
  return a1;
}

void sub_100120798(_Unwind_Exception *a1)
{
}

void sub_1001207AC(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100196EE0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1001207BC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100196EE0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_1001207DC(uint64_t a1)
{
  return sub_10010008C(a1 + 24);
}

uint64_t sub_1001207E8(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100196E60;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + sub_100006224(v4 - 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 8_Block_object_dispose(va, 8) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_100120850(_Unwind_Exception *a1)
{
}

void sub_100120864(uint64_t a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  char v6 = operator new(0x90uLL);
  v6[1] = 0LL;
  v6[2] = 0LL;
  *char v6 = off_1001730D8;
  sub_10011F950((uint64_t)(v6 + 3), a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  sub_10001C350((uint64_t)a3, v6 + 4, (uint64_t)(v6 + 3));
}

void sub_1001208D8(char *__s@<X0>, size_t *a2@<X1>, void *a3@<X8>)
{
  __int128 v5 = &v23;
  sub_100006174(&v23, __s);
  uint64_t size = v23.__r_.__value_.__s.__size_;
  signed __int8 v7 = v23.__r_.__value_.__s.__size_;
  std::string::size_type v9 = v23.__r_.__value_.__l.__size_;
  std::string::size_type v8 = v23.__r_.__value_.__r.__words[0];
  if ((v23.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v10 = (std::string *)((char *)&v23 + v23.__r_.__value_.__s.__size_);
  }
  else {
    uint64_t v10 = (std::string *)(v23.__r_.__value_.__r.__words[0] + v23.__r_.__value_.__l.__size_);
  }
  if ((v23.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    __int128 v5 = (std::string *)v23.__r_.__value_.__r.__words[0];
  }
  if (v5 != v10)
  {
    do
    {
      v5->__r_.__value_.__s.__data_[0] = __tolower(v5->__r_.__value_.__s.__data_[0]);
      __int128 v5 = (std::string *)((char *)v5 + 1);
    }

    while (v5 != v10);
    uint64_t size = v23.__r_.__value_.__s.__size_;
    std::string::size_type v9 = v23.__r_.__value_.__l.__size_;
    std::string::size_type v8 = v23.__r_.__value_.__r.__words[0];
    signed __int8 v7 = v23.__r_.__value_.__s.__size_;
  }

  if (v7 >= 0)
  {
    size_t v11 = &v23;
  }

  else
  {
    uint64_t size = v9;
    size_t v11 = (std::string *)v8;
  }

  if (size >= 2)
  {
    unint64_t v12 = (std::string *)((char *)v11 + size);
    unint64_t v13 = v11;
    do
    {
      os_log_type_t v14 = (std::string *)memchr(v13, 48, size - 1);
      if (!v14) {
        break;
      }
      if (LOWORD(v14->__r_.__value_.__l.__data_) == 30768)
      {
        if (v14 != v12 && v14 == v11)
        {
          uint64_t v15 = std::string::erase(&v23, 0LL, 2uLL);
          std::string::operator=(&v23, v15);
        }

        break;
      }

      unint64_t v13 = (std::string *)((char *)&v14->__r_.__value_.__l.__data_ + 1);
      uint64_t size = (char *)v12 - (char *)v13;
    }

    while ((char *)v12 - (char *)v13 >= 2);
  }

  int v20 = 0LL;
  __int16 v21 = 0LL;
  uint64_t v22 = 0LL;
  sub_100120C0C((uint64_t)&v23, (unint64_t *)&v20);
  uint64_t v16 = v20;
  unint64_t v17 = v21;
  size_t v18 = (_BYTE *)v21 - (_BYTE *)v20;
  if (a2) {
    *a2 = v18;
  }
  unint64_t v19 = operator new[](v18);
  bzero(v19, v18);
  *a3 = v19;
  if (v17 != v16) {
    memmove(v19, v16, v18);
  }
  if (v16)
  {
    __int16 v21 = v16;
    operator delete(v16);
  }

void sub_100120A60( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  switch(a2)
  {
    case 3:
      __cxa_begin_catch(exception_object);
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = &off_100196FC8;
      int v20 = std::generic_category();
      exception[1] = 22LL;
      exception[2] = v20;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + 4_Block_object_dispose(va, 8) = 0;
      exception[7] = "Does not contain an even number of hex digits.";
    case 2:
      __cxa_begin_catch(exception_object);
      __int16 v21 = __cxa_allocate_exception(0x40uLL);
      *__int16 v21 = &off_100196FC8;
      uint64_t v22 = std::generic_category();
      v21[1] = 22LL;
      v21[2] = v22;
      *((_BYTE *)v21 + 24) = 0;
      *((_BYTE *)v21 + 4_Block_object_dispose(va, 8) = 0;
      v21[7] = "Contains non-hexadecimal characters.";
    case 1:
      __cxa_begin_catch(exception_object);
      std::string v23 = __cxa_allocate_exception(0x40uLL);
      *std::string v23 = &off_100196FC8;
      uint64_t v24 = std::generic_category();
      v23[1] = 22LL;
      v23[2] = v24;
      *((_BYTE *)v23 + 24) = 0;
      *((_BYTE *)v23 + 4_Block_object_dispose(va, 8) = 0;
      v23[7] = "Decoding error.";
  }

  _Unwind_Resume(exception_object);
}

unint64_t *sub_100120C0C(uint64_t a1, unint64_t *a2)
{
  int v3 = *(char *)(a1 + 23);
  BOOL v4 = v3 < 0;
  uint64_t v5 = *(void *)a1;
  if (v3 >= 0) {
    uint64_t v5 = a1;
  }
  uint64_t v6 = *(unsigned __int8 *)(a1 + 23);
  if (v4) {
    uint64_t v6 = *(void *)(a1 + 8);
  }
  uint64_t v9 = v5;
  if (v6)
  {
    uint64_t v7 = v5 + v6;
    do
      a2 = sub_100121CEC(&v9, v7, a2, (unsigned int (*)(uint64_t, uint64_t))sub_100121E10);
    while (v9 != v7);
  }

  return a2;
}

uint64_t sub_100120C80(char *a1, uint64_t a2)
{
  v3[0] = 0LL;
  v3[1] = 0LL;
  return sub_100088D3C((uint64_t)v3, a1, a2);
}

void *sub_100120CD8(void *a1, unsigned int *a2)
{
  BOOL v4 = (const char *)(*(uint64_t (**)(unsigned int *))(*(void *)a2 + 16LL))(a2);
  size_t v5 = strlen(v4);
  uint64_t v6 = sub_10000552C(a1, (uint64_t)v4, v5);
  uint64_t v7 = sub_10000552C(v6, (uint64_t)" (error code ", 13LL);
  std::string::size_type v8 = (void *)std::ostream::operator<<(v7, a2[2]);
  sub_10000552C(v8, (uint64_t)")", 1LL);
  return a1;
}

uint64_t sub_100120D54(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 48))
  {
    uint64_t result = a1 + 56;
    return *(void *)result;
  }

  uint64_t result = a1 + 24;
  return result;
}

uint64_t sub_100120D7C()
{
  return *(void *)out;
}

void *sub_100120DCC()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1001A4880);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1001A4880))
  {
    __cxa_atexit((void (*)(void *))sub_100120E74, &unk_1001A4870, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_1001A4880);
  }

  unint64_t v1 = atomic_load(&qword_1001A4868);
  if (v1 != -1LL)
  {
    size_t v5 = &v3;
    BOOL v4 = &v5;
    std::__call_once(&qword_1001A4868, &v4, (void (__cdecl *)(void *))sub_1001231F8);
  }

  return &unk_1001A4870;
}

uint64_t sub_100120E78()
{
  if (byte_1001A4698)
  {
    while (!__ldaxr((unsigned __int8 *)&unk_1001A4890))
    {
      if (!__stlxr(1u, (unsigned __int8 *)&unk_1001A4890))
      {
        *(void *)&__int128 v2 = "void process_terminator::terminate()";
        *((void *)&v2 + 1) = 34LL;
        int v3 = 16;
        sub_1000D4850(v4, &v2);
        sub_10000552C(&v5, (uint64_t)"Terminating due to unrecoverable I/O error", 42LL);
        std::ostream::~ostream(&v5, off_10018BA80);
        sub_1000D49B4((uint64_t)v4);
        std::ios::~ios(&v6);
        return raise(15);
      }
    }

    __clrex();
  }

  return result;
}

void sub_100120F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

unint64_t sub_100120F4C(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  uint64_t v6 = (uint64_t *)(a1 + 144);
  uint64_t v5 = *(void *)(a1 + 144);
  uint64_t v7 = a4[1];
  unint64_t v8 = *a4 - (v5 - v7);
  if (v8 >= a3) {
    unint64_t v8 = a3;
  }
  unint64_t v129 = v8;
  unint64_t v9 = v5 - v7;
  if (v5 == v7) {
    goto LABEL_160;
  }
  unint64_t v12 = *(std::__shared_weak_count **)(a1 + 8);
  v188 = *(void **)a1;
  v189 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      unint64_t v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }

  v190[0] = *(_OWORD *)(a1 + 16);
  *(_OWORD *)((char *)v190 + 9) = *(_OWORD *)(a1 + 25);
  uint64_t v191 = *(void *)(a1 + 48);
  __int128 v192 = *(_OWORD *)(a1 + 56);
  __int128 v193 = *(_OWORD *)(a1 + 72);
  __int128 v194 = *(_OWORD *)(a1 + 88);
  char v195 = *(_BYTE *)(a1 + 104);
  uint64_t v15 = *(std::__shared_weak_count **)(a1 + 120);
  uint64_t v196 = *(void *)(a1 + 112);
  v197 = v15;
  if (v15)
  {
    uint64_t v16 = (unint64_t *)&v15->__shared_owners_;
    do
      unint64_t v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }

  __int128 v198 = *(_OWORD *)(a1 + 128);
  uint64_t v199 = *v6;
  char v200 = *(_BYTE *)(a1 + 152);
  unint64_t v18 = v8 + v9;
  sub_10003C884((uint64_t)&v188, v8 + v9);
  sub_10003B6C0(&v192);
  unint64_t v19 = (_OWORD *)(a1 + 16);
  int v20 = (__int128 *)(a1 + 72);
  __int16 v21 = *(std::__shared_weak_count **)(a1 + 8);
  v157 = *(void **)a1;
  v158 = v21;
  if (v21)
  {
    uint64_t v22 = (unint64_t *)&v21->__shared_owners_;
    do
      unint64_t v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }

  *(_OWORD *)v159 = *v19;
  *(_OWORD *)&v159[9] = *(_OWORD *)(a1 + 25);
  __int128 v161 = *(_OWORD *)(a1 + 56);
  __int128 v24 = *(_OWORD *)(a1 + 88);
  __int128 v162 = *v20;
  __int16 v25 = (__int128 *)(a1 + 128);
  uint64_t v160 = *(void *)(a1 + 48);
  __int128 v163 = v24;
  char v164 = *(_BYTE *)(a1 + 104);
  uint64_t v26 = *(std::__shared_weak_count **)(a1 + 120);
  uint64_t v165 = *(void *)(a1 + 112);
  v166 = v26;
  if (v26)
  {
    char v27 = (unint64_t *)&v26->__shared_owners_;
    do
      unint64_t v28 = __ldxr(v27);
    while (__stxr(v28 + 1, v27));
  }

  __int128 v167 = *v25;
  uint64_t v168 = *v6;
  char v169 = *((_BYTE *)v6 + 8);
  sub_10003D9D4((uint64_t)&v157, a2, a4[1], v18, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)&v170);
  unint64_t v29 = v166;
  if (v166)
  {
    size_t v30 = (unint64_t *)&v166->__shared_owners_;
    do
      unint64_t v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }

  unint64_t v32 = v158;
  if (v158)
  {
    size_t v33 = (unint64_t *)&v158->__shared_owners_;
    do
      unint64_t v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }

  sub_10003BD04((uint64_t)&v170, (uint64_t)&v219);
  sub_100018FFC((uint64_t)&v188, (uint64_t)&v219);
  char v35 = v221;
  if (v221)
  {
    int v36 = (unint64_t *)&v221->__shared_owners_;
    do
      unint64_t v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }

  uint64_t v38 = v220;
  if (v220)
  {
    id v39 = (unint64_t *)&v220->__shared_owners_;
    do
      unint64_t v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }

  sub_10003C884((uint64_t)&v188, v9);
  sub_10003BA04((uint64_t)&v170, (uint64_t)v154);
  __src = v188;
  v144 = v189;
  if (v189)
  {
    v41 = (unint64_t *)&v189->__shared_owners_;
    do
      unint64_t v42 = __ldxr(v41);
    while (__stxr(v42 + 1, v41));
  }

  v145[0] = v190[0];
  *(_OWORD *)((char *)v145 + 9) = *(_OWORD *)((char *)v190 + 9);
  v147[0] = v192;
  v147[1] = v193;
  uint64_t v146 = v191;
  v147[2] = v194;
  char v148 = v195;
  uint64_t v149 = v196;
  v150 = v197;
  if (v197)
  {
    __int16 v43 = (unint64_t *)&v197->__shared_owners_;
    do
      unint64_t v44 = __ldxr(v43);
    while (__stxr(v44 + 1, v43));
  }

  __int128 v151 = v198;
  uint64_t v152 = v199;
  char v153 = v200;
  uint64_t v46 = *(void **)a1;
  __int16 v45 = *(std::__shared_weak_count **)(a1 + 8);
  v130 = *(void **)a1;
  v131 = v45;
  if (v45)
  {
    int64x2_t v47 = (unint64_t *)&v45->__shared_owners_;
    do
      unint64_t v48 = __ldxr(v47);
    while (__stxr(v48 + 1, v47));
  }

  *(_OWORD *)v132 = *v19;
  *(_OWORD *)&v132[9] = *(_OWORD *)(a1 + 25);
  __int128 v49 = *v20;
  __int128 v50 = *(_OWORD *)(a1 + 88);
  __int128 v134 = *(_OWORD *)(a1 + 56);
  __int128 v135 = v49;
  uint64_t v133 = *(void *)(a1 + 48);
  __int128 v136 = v50;
  char v137 = *(_BYTE *)(a1 + 104);
  v51 = *(std::__shared_weak_count **)(a1 + 120);
  uint64_t v138 = *(void *)(a1 + 112);
  v139 = v51;
  if (v51)
  {
    uint64_t v52 = (unint64_t *)&v51->__shared_owners_;
    do
      unint64_t v53 = __ldxr(v52);
    while (__stxr(v53 + 1, v52));
  }

  __int128 v140 = *v25;
  uint64_t v141 = *v6;
  char v142 = *((_BYTE *)v6 + 8);
  CCHmacContext __dst = v46;
  v205 = v131;
  if (v131)
  {
    v54 = (unint64_t *)&v131->__shared_owners_;
    do
      unint64_t v55 = __ldxr(v54);
    while (__stxr(v55 + 1, v54));
  }

  *(_OWORD *)v206 = *(_OWORD *)v132;
  *(_OWORD *)&v206[9] = *(_OWORD *)&v132[9];
  __int128 v208 = v134;
  __int128 v209 = v135;
  uint64_t v207 = v133;
  __int128 v210 = v136;
  char v211 = v137;
  uint64_t v212 = v138;
  v213 = v139;
  if (v139)
  {
    v56 = (unint64_t *)&v139->__shared_owners_;
    do
      unint64_t v57 = __ldxr(v56);
    while (__stxr(v57 + 1, v56));
  }

  unint64_t v58 = 0LL;
  __int128 v214 = v140;
  uint64_t v215 = v141;
  char v216 = 0;
  while (!sub_10003B85C((uint64_t)&__src, (uint64_t)v154))
  {
    sub_10003DAF4((uint64_t)v147);
    v59 = v150;
    uint64_t v201 = v149;
    v202 = v150;
    if (v150)
    {
      v60 = (unint64_t *)&v150->__shared_owners_;
      do
        unint64_t v61 = __ldxr(v60);
      while (__stxr(v61 + 1, v60));
    }

    __int128 v203 = v151;
    uint64_t v62 = *((void *)&v151 + 1);
    if (*((void *)&v151 + 1))
    {
      unint64_t v63 = *(void *)&v206[16];
      if (*(void *)&v145[0] < *(void *)&v206[16]) {
        unint64_t v63 = *(void *)&v145[0];
      }
      if (v63 >= *((void *)&v203 + 1)) {
        int64_t v64 = *((void *)&v203 + 1);
      }
      else {
        int64_t v64 = v63;
      }
      if (v64)
      {
        memmove(__dst, __src, v64);
        if (v64 > 0)
        {
          sub_10003C884((uint64_t)&__src, v64);
          sub_10003CA5C((uint64_t)&__dst, v64);
          int v65 = 0;
          v58 += v64;
          if (v59) {
            goto LABEL_73;
          }
          goto LABEL_77;
        }
      }

      else
      {
        *(void *)&__int128 v217 = "trim_data(const sg_vec::iterator &, const sg_vec::iterator &, size_t, const io_result_t &)::(anonymous class)::operator()(const auto &, const auto &, size_t) const [src:auto = sg_vec_ns::details::sg_vec_iterator, dst:auto = sg_vec_ns::details::sg_vec_iterator]";
        *((void *)&v217 + 1) = 121LL;
        int v218 = 16;
        sub_10012333C(&v219, &v217);
        sub_10000552C(&v222, (uint64_t)"Trimming: Written ", 18LL);
        std::ostream::operator<<(&v222, v62);
        sub_10000552C(&v222, (uint64_t)", dest buffer_size ", 19LL);
        std::ostream::operator<<(&v222, *(void *)&v206[16]);
        sub_10000552C(&v222, (uint64_t)" src size ", 10LL);
        std::ostream::operator<<(&v222, *(void *)&v145[0]);
        sub_10000552C(&v222, (uint64_t)", trimmed size", 14LL);
        std::ostream::operator<<(&v222, 0LL);
        std::ostream::~ostream(&v222, off_100197410);
        sub_1001234A0((uint64_t)&v219);
        std::ios::~ios(v223);
      }

      *(void *)&__int128 v217 = "transform(Fn &&, sg_vec_ref::iterator, const sg_vec_ref::iterator &, sg_vec_ref::iterator) [Fn = (lambda at /Library/Caches/com.apple.xbs/Sources/DiskImages2/app/utils.cpp:180:13)]";
      *((void *)&v217 + 1) = 97LL;
      int v218 = 16;
      sub_100045E24(&v219, &v217);
      sub_10000552C(&v222, (uint64_t)"IO error with sg: ", 18LL);
      sub_10011E9EC(&v222, &__src);
      sub_10000552C(&v222, (uint64_t)" dest ", 6LL);
      sub_10011E9EC(&v222, &__dst);
      sub_10000552C(&v222, (uint64_t)" returned status ", 17LL);
      std::ostream::operator<<(&v222, v64);
      std::ostream::~ostream(&v222, off_1001788E0);
      sub_100045F88((uint64_t)&v219);
      std::ios::~ios(v223);
      int v65 = 1;
      if (v59)
      {
LABEL_73:
        v66 = (unint64_t *)&v59->__shared_owners_;
        do
          unint64_t v67 = __ldaxr(v66);
        while (__stlxr(v67 - 1, v66));
        if (!v67)
        {
          ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
          std::__shared_weak_count::__release_weak(v59);
        }
      }
    }

    else
    {
      sub_10003CC34((uint64_t)&__src);
      int v65 = 2;
      if (v59) {
        goto LABEL_73;
      }
    }

LABEL_77:
    if ((v65 | 2) != 2) {
      goto LABEL_80;
    }
  }

  sub_10003CA5C((uint64_t)&v130, v58);
LABEL_80:
  v68 = v213;
  if (v213)
  {
    v69 = (unint64_t *)&v213->__shared_owners_;
    do
      unint64_t v70 = __ldaxr(v69);
    while (__stlxr(v70 - 1, v69));
    if (!v70)
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }

  v71 = v205;
  if (v205)
  {
    v72 = (unint64_t *)&v205->__shared_owners_;
    do
      unint64_t v73 = __ldaxr(v72);
    while (__stlxr(v73 - 1, v72));
    if (!v73)
    {
      ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
      std::__shared_weak_count::__release_weak(v71);
    }
  }

  v74 = v139;
  if (v139)
  {
    v75 = (unint64_t *)&v139->__shared_owners_;
    do
      unint64_t v76 = __ldaxr(v75);
    while (__stlxr(v76 - 1, v75));
    if (!v76)
    {
      ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
      std::__shared_weak_count::__release_weak(v74);
    }
  }

  v77 = v131;
  if (v131)
  {
    v78 = (unint64_t *)&v131->__shared_owners_;
    do
      unint64_t v79 = __ldaxr(v78);
    while (__stlxr(v79 - 1, v78));
    if (!v79)
    {
      ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
      std::__shared_weak_count::__release_weak(v77);
    }
  }

  v80 = v150;
  if (v150)
  {
    v81 = (unint64_t *)&v150->__shared_owners_;
    do
      unint64_t v82 = __ldaxr(v81);
    while (__stlxr(v82 - 1, v81));
    if (!v82)
    {
      ((void (*)(std::__shared_weak_count *))v80->__on_zero_shared)(v80);
      std::__shared_weak_count::__release_weak(v80);
    }
  }

  v83 = v144;
  if (v144)
  {
    v84 = (unint64_t *)&v144->__shared_owners_;
    do
      unint64_t v85 = __ldaxr(v84);
    while (__stlxr(v85 - 1, v84));
    if (!v85)
    {
      ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
      std::__shared_weak_count::__release_weak(v83);
    }
  }

  v86 = v156;
  if (v156)
  {
    v87 = (unint64_t *)&v156->__shared_owners_;
    do
      unint64_t v88 = __ldaxr(v87);
    while (__stlxr(v88 - 1, v87));
    if (!v88)
    {
      ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
      std::__shared_weak_count::__release_weak(v86);
    }
  }

  v89 = v155;
  if (v155)
  {
    v90 = (unint64_t *)&v155->__shared_owners_;
    do
      unint64_t v91 = __ldaxr(v90);
    while (__stlxr(v91 - 1, v90));
    if (!v91)
    {
      ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
      std::__shared_weak_count::__release_weak(v89);
    }
  }

  v92 = v187;
  if (v187)
  {
    v93 = (unint64_t *)&v187->__shared_owners_;
    do
      unint64_t v94 = __ldaxr(v93);
    while (__stlxr(v94 - 1, v93));
    if (!v94)
    {
      ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
      std::__shared_weak_count::__release_weak(v92);
    }
  }

  v95 = v186;
  if (v186)
  {
    v96 = (unint64_t *)&v186->__shared_owners_;
    do
      unint64_t v97 = __ldaxr(v96);
    while (__stlxr(v97 - 1, v96));
    if (!v97)
    {
      ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
      std::__shared_weak_count::__release_weak(v95);
    }
  }

  v98 = v185;
  if (v185)
  {
    v99 = (unint64_t *)&v185->__shared_owners_;
    do
      unint64_t v100 = __ldaxr(v99);
    while (__stlxr(v100 - 1, v99));
    if (!v100)
    {
      ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
      std::__shared_weak_count::__release_weak(v98);
    }
  }

  v101 = v184;
  if (v184)
  {
    v102 = (unint64_t *)&v184->__shared_owners_;
    do
      unint64_t v103 = __ldaxr(v102);
    while (__stlxr(v103 - 1, v102));
    if (!v103)
    {
      ((void (*)(std::__shared_weak_count *))v101->__on_zero_shared)(v101);
      std::__shared_weak_count::__release_weak(v101);
    }
  }

  v104 = v183;
  if (v183)
  {
    v105 = (unint64_t *)&v183->__shared_owners_;
    do
      unint64_t v106 = __ldaxr(v105);
    while (__stlxr(v106 - 1, v105));
    if (!v106)
    {
      ((void (*)(std::__shared_weak_count *))v104->__on_zero_shared)(v104);
      std::__shared_weak_count::__release_weak(v104);
    }
  }

  v107 = (std::__shared_weak_count *)v175;
  if ((void)v175)
  {
    v108 = (unint64_t *)(v175 + 8);
    do
      unint64_t v109 = __ldaxr(v108);
    while (__stlxr(v109 - 1, v108));
    if (!v109)
    {
      ((void (*)(std::__shared_weak_count *))v107->__on_zero_shared)(v107);
      std::__shared_weak_count::__release_weak(v107);
    }
  }

  v110 = v197;
  if (v197)
  {
    v111 = (unint64_t *)&v197->__shared_owners_;
    do
      unint64_t v112 = __ldaxr(v111);
    while (__stlxr(v112 - 1, v111));
    if (!v112)
    {
      ((void (*)(std::__shared_weak_count *))v110->__on_zero_shared)(v110);
      std::__shared_weak_count::__release_weak(v110);
    }
  }

  v113 = v189;
  if (v189)
  {
    v114 = (unint64_t *)&v189->__shared_owners_;
    do
      unint64_t v115 = __ldaxr(v114);
    while (__stlxr(v115 - 1, v114));
    if (!v115)
    {
      ((void (*)(std::__shared_weak_count *))v113->__on_zero_shared)(v113);
      std::__shared_weak_count::__release_weak(v113);
    }
  }

LABEL_160:
  v116 = *(std::__shared_weak_count **)(a1 + 8);
  v170 = *(void **)a1;
  v171 = v116;
  if (v116)
  {
    v117 = (unint64_t *)&v116->__shared_owners_;
    do
      unint64_t v118 = __ldxr(v117);
    while (__stxr(v118 + 1, v117));
  }

  v172[0] = *(_OWORD *)(a1 + 16);
  *(_OWORD *)((char *)v172 + 9) = *(_OWORD *)(a1 + 25);
  uint64_t v173 = *(void *)(a1 + 48);
  __int128 v174 = *(_OWORD *)(a1 + 56);
  __int128 v175 = *(_OWORD *)(a1 + 72);
  __int128 v176 = *(_OWORD *)(a1 + 88);
  char v177 = *(_BYTE *)(a1 + 104);
  v119 = *(std::__shared_weak_count **)(a1 + 120);
  uint64_t v178 = *(void *)(a1 + 112);
  v179 = v119;
  if (v119)
  {
    v120 = (unint64_t *)&v119->__shared_owners_;
    do
      unint64_t v121 = __ldxr(v120);
    while (__stxr(v121 + 1, v120));
  }

  __int128 v180 = *(_OWORD *)(a1 + 128);
  uint64_t v181 = *v6;
  char v182 = *((_BYTE *)v6 + 8);
  sub_10003C884((uint64_t)&v170, v129);
  sub_10003B6C0(&v174);
  v122 = v179;
  if (v179)
  {
    v123 = (unint64_t *)&v179->__shared_owners_;
    do
      unint64_t v124 = __ldaxr(v123);
    while (__stlxr(v124 - 1, v123));
    if (!v124)
    {
      ((void (*)(std::__shared_weak_count *))v122->__on_zero_shared)(v122);
      std::__shared_weak_count::__release_weak(v122);
    }
  }

  v125 = v171;
  if (v171)
  {
    v126 = (unint64_t *)&v171->__shared_owners_;
    do
      unint64_t v127 = __ldaxr(v126);
    while (__stlxr(v127 - 1, v126));
    if (!v127)
    {
      ((void (*)(std::__shared_weak_count *))v125->__on_zero_shared)(v125);
      std::__shared_weak_count::__release_weak(v125);
    }
  }

  return v129;
}

void sub_100121BDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_100121CD8(std::exception *a1)
{
}

unint64_t *sub_100121CEC( uint64_t *a1, uint64_t a2, unint64_t *a3, unsigned int (*a4)(uint64_t, uint64_t))
{
  int v7 = 0;
  unint64_t v17 = a3;
  char v16 = 0;
  uint64_t v8 = *a1;
  char v9 = 1;
  do
  {
    char v10 = v9;
    if (a4(v8, a2))
    {
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      DWORD2(v15) = -1;
      v13[0] = off_100197030;
      v13[1] = off_100197060;
      sub_100121E1C(v13);
    }

    int v11 = sub_100121EA8(*(char *)*a1);
    char v9 = 0;
    int v7 = v11 + 16 * v7;
    char v16 = v7;
    uint64_t v8 = *a1 + 1;
    *a1 = v8;
  }

  while ((v10 & 1) != 0);
  sub_100121FA4(&v17, &v16);
  return v17;
}

void sub_100121DD4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::exception a13, _UNKNOWN **a14, uint64_t a15)
{
  a14 = &off_100197080;
  if (a15) {
    (*(void (**)(uint64_t))(*(void *)a15 + 32LL))(a15);
  }
  _Unwind_Resume(a1);
}

BOOL sub_100121E10(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_100121E1C(void *a1)
{
  exception = __cxa_allocate_exception(0x30uLL);
  sub_1001220A8((uint64_t)exception, a1);
}

void sub_100121E58(_Unwind_Exception *a1)
{
}

std::exception *sub_100121E6C(std::exception *a1)
{
  *(void *)(v2 + _Block_object_dispose(va, 8) = &off_100197080;
  sub_1001221D0((uint64_t *)(v2 + 16));
  return a1;
}

uint64_t sub_100121EA8(int a1)
{
  unsigned __int8 v1 = a1 - 48;
  if ((a1 - 48) >= 0xA)
  {
    if ((a1 - 65) > 5)
    {
      if ((a1 - 97) > 5)
      {
        __int128 v7 = 0u;
        __int128 v8 = 0u;
        DWORD2(v_Block_object_dispose(va, 8) = -1;
        v6[0] = off_1001970C8;
        v6[1] = off_1001970F8;
        BOOL v4 = off_100197140;
        char v5 = a1;
        int v3 = sub_1001223C8(v6, (uint64_t)&v4);
        sub_100122210(v3);
      }

      return (a1 - 87);
    }

    else
    {
      return (a1 - 55);
    }
  }

  return v1;
}

void sub_100121F64( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::exception a15, _UNKNOWN **a16, uint64_t a17)
{
  a16 = &off_100197080;
  if (a17) {
    (*(void (**)(uint64_t))(*(void *)a17 + 32LL))(a17);
  }
  _Unwind_Resume(a1);
}

unint64_t **sub_100121FA4(unint64_t **a1, _BYTE *a2)
{
  BOOL v4 = *a1;
  uint64_t v6 = (_BYTE *)(*a1)[1];
  unint64_t v5 = (*a1)[2];
  if ((unint64_t)v6 >= v5)
  {
    unint64_t v8 = *v4;
    char v9 = &v6[-*v4];
    unint64_t v10 = (unint64_t)(v9 + 1);
    unint64_t v11 = v5 - v8;
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v12 = v10;
    }
    if (v12) {
      unint64_t v13 = (unint64_t)operator new(v12);
    }
    else {
      unint64_t v13 = 0LL;
    }
    __int128 v14 = (char *)(v13 + v12);
    v9[v13] = *a2;
    uint64_t v7 = (uint64_t)&v9[v13 + 1];
    if (v6 == (_BYTE *)v8)
    {
      v13 += (unint64_t)v9;
    }

    else
    {
      __int128 v15 = &v6[~v8];
      do
      {
        char v16 = *--v6;
        (v15--)[v13] = v16;
      }

      while (v6 != (_BYTE *)v8);
      uint64_t v6 = (_BYTE *)*v4;
    }

    *BOOL v4 = v13;
    v4[1] = v7;
    v4[2] = (unint64_t)v14;
    if (v6) {
      operator delete(v6);
    }
  }

  else
  {
    *uint64_t v6 = *a2;
    uint64_t v7 = (uint64_t)(v6 + 1);
  }

  v4[1] = v7;
  return a1;
}

uint64_t sub_1001220A8(uint64_t a1, void *a2)
{
  int v3 = (char *)a2 + *(void *)(*a2 - 40LL);
  uint64_t v4 = *((void *)v3 + 1);
  *(void *)(a1 + _Block_object_dispose(va, 8) = &off_100197080;
  *(void *)(a1 + 16) = v4;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 24LL))(v4);
  }
  __int128 v5 = *((_OWORD *)v3 + 1);
  *(_DWORD *)(a1 + 40) = *((_DWORD *)v3 + 8);
  *(_OWORD *)(a1 + 24) = v5;
  *(void *)a1 = off_100197030;
  *(void *)(a1 + _Block_object_dispose(va, 8) = off_100197060;
  return a1;
}

void sub_100122118(std::exception *a1)
{
  *(void *)(v2 + _Block_object_dispose(va, 8) = &off_100197080;
  sub_1001221D0((uint64_t *)(v2 + 16));
  operator delete(a1);
}

uint64_t *sub_100122154(void *a1)
{
  *(void *)(v1 + _Block_object_dispose(va, 8) = &off_100197080;
  return sub_1001221D0((uint64_t *)(v1 + 16));
}

void sub_100122188(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::exception::~exception((std::exception *)v1);
  *((void *)v1 + 1) = &off_100197080;
  sub_1001221D0((uint64_t *)v1 + 2);
  operator delete(v1);
}

uint64_t *sub_1001221D0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  return a1;
}

void sub_100122210(void *a1)
{
  exception = __cxa_allocate_exception(0x30uLL);
  sub_1001222A0((uint64_t)exception, a1);
}

void sub_10012224C(_Unwind_Exception *a1)
{
}

std::exception *sub_100122264(std::exception *a1)
{
  *(void *)(v2 + _Block_object_dispose(va, 8) = &off_100197080;
  sub_1001221D0((uint64_t *)(v2 + 16));
  return a1;
}

uint64_t sub_1001222A0(uint64_t a1, void *a2)
{
  int v3 = (char *)a2 + *(void *)(*a2 - 40LL);
  uint64_t v4 = *((void *)v3 + 1);
  *(void *)(a1 + _Block_object_dispose(va, 8) = &off_100197080;
  *(void *)(a1 + 16) = v4;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 24LL))(v4);
  }
  __int128 v5 = *((_OWORD *)v3 + 1);
  *(_DWORD *)(a1 + 40) = *((_DWORD *)v3 + 8);
  *(_OWORD *)(a1 + 24) = v5;
  *(void *)a1 = off_1001970C8;
  *(void *)(a1 + _Block_object_dispose(va, 8) = off_1001970F8;
  return a1;
}

void sub_100122310(std::exception *a1)
{
  *(void *)(v2 + _Block_object_dispose(va, 8) = &off_100197080;
  sub_1001221D0((uint64_t *)(v2 + 16));
  operator delete(a1);
}

uint64_t *sub_10012234C(void *a1)
{
  *(void *)(v1 + _Block_object_dispose(va, 8) = &off_100197080;
  return sub_1001221D0((uint64_t *)(v1 + 16));
}

void sub_100122380(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::exception::~exception((std::exception *)v1);
  *((void *)v1 + 1) = &off_100197080;
  sub_1001221D0((uint64_t *)v1 + 2);
  operator delete(v1);
}

void *sub_1001223C8(void *a1, uint64_t a2)
{
  uint64_t v4 = operator new(0x10uLL);
  *(void *)uint64_t v4 = off_100197140;
  v4[8] = *(_BYTE *)(a2 + 8);
  int v20 = v4;
  __int128 v5 = (std::__shared_weak_count *)operator new(0x20uLL);
  v5->__shared_owners_ = 0LL;
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&off_100197170;
  v5->__shared_weak_owners_ = 0LL;
  v5[1].__vftable = (std::__shared_weak_count_vtbl *)v4;
  __int16 v21 = v5;
  uint64_t v7 = (char *)a1 + *(void *)(*a1 - 40LL);
  unint64_t v8 = (void *)*((void *)v7 + 1);
  if (!v8)
  {
    unint64_t v8 = operator new(0x40uLL);
    v8[3] = 0LL;
    v8[4] = 0LL;
    v8[2] = 0LL;
    *unint64_t v8 = off_1001971E8;
    v8[1] = v8 + 2;
    v8[5] = 0LL;
    v8[6] = 0LL;
    *((void *)v7 + 1) = v8;
    *((_DWORD *)v8 + 14) = 1;
  }

  unint64_t v18 = v4;
  unint64_t v19 = v5;
  do
    unint64_t v9 = __ldxr(p_shared_owners);
  while (__stxr(v9 + 1, p_shared_owners));
  (*(void (**)(void *, _BYTE **, _UNKNOWN ***))(*v8 + 16LL))(v8, &v18, &v17);
  unint64_t v10 = v19;
  if (v19)
  {
    unint64_t v11 = (unint64_t *)&v19->__shared_owners_;
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  unint64_t v13 = v21;
  if (v21)
  {
    __int128 v14 = (unint64_t *)&v21->__shared_owners_;
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  return a1;
}

void sub_100122538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
}

_BYTE *sub_100122570(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  *(void *)uint64_t result = off_100197140;
  result[8] = *(_BYTE *)(a1 + 8);
  return result;
}

void sub_1001225AC(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  if (__p[0]) {
    uint64_t v4 = (char *)__p[0];
  }
  else {
    uint64_t v4 = (char *)((unint64_t)"PN5boost9algorithm9bad_char_E" & 0x7FFFFFFFFFFFFFFFLL);
  }
  sub_100006174(&v14, v4);
  free(__p[0]);
  if ((v14.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v5.__i_ = (std::__wrap_iter<const char *>::iterator_type)&v14;
  }
  else {
    v5.__i_ = (std::__wrap_iter<const char *>::iterator_type)v14.__r_.__value_.__r.__words[0];
  }
  std::string::insert(&v14, v5, 91);
  std::string v15 = v14;
  memset(&v14, 0, sizeof(v14));
  uint64_t v6 = std::string::append(&v15, "] = ", 4uLL);
  __int128 v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__l.__cap_ = v6->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0LL;
  v6->__r_.__value_.__l.__cap_ = 0LL;
  v6->__r_.__value_.__r.__words[0] = 0LL;
  sub_1001227F8((char *)(a1 + 8), __p);
  if ((v13 & 0x80u) == 0) {
    unint64_t v8 = __p;
  }
  else {
    unint64_t v8 = (void **)__p[0];
  }
  if ((v13 & 0x80u) == 0) {
    std::string::size_type v9 = v13;
  }
  else {
    std::string::size_type v9 = (std::string::size_type)__p[1];
  }
  unint64_t v10 = std::string::append(&v16, (const std::string::value_type *)v8, v9);
  __int128 v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__l.__cap_ = v10->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0LL;
  v10->__r_.__value_.__l.__cap_ = 0LL;
  v10->__r_.__value_.__r.__words[0] = 0LL;
  std::string::push_back(&v17, 10);
  *a2 = v17;
  memset(&v17, 0, sizeof(v17));
}

void sub_100122720( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26, uint64_t a27, void *a28, uint64_t a29, int a30, __int16 a31, char a32, char a33)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

char **sub_1001227AC(char **a1, char *lpmangled)
{
  int status = 0;
  size_t v4 = 0LL;
  *a1 = __cxa_demangle(lpmangled, 0LL, &v4, &status);
  return a1;
}

uint64_t sub_1001227F8@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  char v9 = *a1;
  sub_10000552C(&v5, (uint64_t)&v9, 1LL);
  sub_100005F24((uint64_t)v6, a2);
  if (v7 < 0) {
    operator delete((void *)v6[8]);
  }
  std::streambuf::~streambuf(v6);
  return std::ios::~ios(&v8);
}

void sub_1001228BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1001228D4(std::__shared_weak_count *a1)
{
}

uint64_t sub_1001228E8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 24LL))(result);
  }
  return result;
}

uint64_t sub_100122900(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }

  else
  {
    return 0LL;
  }

uint64_t sub_100122940(uint64_t a1, const char *a2)
{
  if (a2)
  {
    sub_100005148((uint64_t)&v16);
    size_t v4 = strlen(a2);
    sub_10000552C(&v16, (uint64_t)a2, v4);
    uint64_t v5 = *(void **)(a1 + 8);
    if (v5 != (void *)(a1 + 16))
    {
      do
      {
        (**(void (***)(void **__return_ptr))v5[5])(__p);
        if (v15 >= 0) {
          uint64_t v6 = __p;
        }
        else {
          uint64_t v6 = (void **)__p[0];
        }
        if (v15 >= 0) {
          uint64_t v7 = HIBYTE(v15);
        }
        else {
          uint64_t v7 = (uint64_t)__p[1];
        }
        sub_10000552C(&v16, (uint64_t)v6, v7);
        if (SHIBYTE(v15) < 0) {
          operator delete(__p[0]);
        }
        uint64_t v8 = (void *)v5[1];
        if (v8)
        {
          do
          {
            char v9 = v8;
            uint64_t v8 = (void *)*v8;
          }

          while (v8);
        }

        else
        {
          do
          {
            char v9 = (void *)v5[2];
            BOOL v10 = *v9 == (void)v5;
            uint64_t v5 = v9;
          }

          while (!v10);
        }

        uint64_t v5 = v9;
      }

      while (v9 != (void *)(a1 + 16));
    }

    sub_100005F24((uint64_t)v17, __p);
    uint64_t v11 = v15;
    __int128 v12 = *(_OWORD *)__p;
    *(_OWORD *)__p = *(_OWORD *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 48);
    *(_OWORD *)(a1 + 32) = v12;
    *(void *)(a1 + 4_Block_object_dispose(va, 8) = v11;
    if (SHIBYTE(v15) < 0) {
      operator delete(__p[0]);
    }
    if (v18 < 0) {
      operator delete((void *)v17[8]);
    }
    std::streambuf::~streambuf(v17);
    std::ios::~ios(&v19);
  }

  uint64_t result = a1 + 32;
  return result;
}

void sub_100122AE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
}

void *sub_100122B14@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t result = sub_100122DEC(a1 + 8, a2);
  if ((void *)(a1 + 16) == result)
  {
    *a3 = 0LL;
    a3[1] = 0LL;
  }

  else
  {
    uint64_t v6 = result[6];
    *a3 = result[5];
    a3[1] = v6;
    if (v6)
    {
      uint64_t v7 = (unint64_t *)(v6 + 8);
      do
        unint64_t v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
  }

  return result;
}

void *sub_100122B70(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v7 = a3;
  uint64_t v5 = sub_100122ED0((uint64_t **)(a1 + 8), a3, (uint64_t)&unk_1001447DC, &v7);
  uint64_t result = sub_10001C610(v5 + 5, a2);
  if (*(char *)(a1 + 55) < 0)
  {
    **(_BYTE **)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0LL;
  }

  else
  {
    *(_BYTE *)(a1 + 32) = 0;
    *(_BYTE *)(a1 + 55) = 0;
  }

  return result;
}

uint64_t sub_100122BE8(uint64_t result)
{
  return result;
}

BOOL sub_100122BF8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56) - 1;
  *(_DWORD *)(a1 + ++*(_DWORD *)(result + 56) = v1;
  if (a1 && !v1)
  {
    uint64_t v2 = (void *)sub_100123034(a1);
    operator delete(v2);
  }

  return v1 == 0;
}

void sub_100122C34(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0LL;
  size_t v4 = (char *)operator new(0x40uLL);
  *(void *)size_t v4 = off_1001971E8;
  *((void *)v4 + 2) = 0LL;
  *((void *)v4 + 1) = v4 + 16;
  uint64_t v5 = (uint64_t **)(v4 + 8);
  *((void *)v4 + 3) = 0LL;
  *((void *)v4 + 4) = 0LL;
  *((void *)v4 + 5) = 0LL;
  *((void *)v4 + 6) = 0LL;
  *a2 = v4;
  *((_DWORD *)v4 + 14) = 1;
  uint64_t v6 = *(void **)(a1 + 8);
  if (v6 != (void *)(a1 + 16))
  {
    do
    {
      uint64_t v7 = (*(uint64_t (**)(void))(*(void *)v6[5] + 8LL))(v6[5]);
      sub_100123070(&v21, v7);
      v19[0] = v6[4];
      v19[1] = v21;
      int v20 = v22;
      if (v22)
      {
        p_shared_owners = (unint64_t *)&v22->__shared_owners_;
        do
          unint64_t v9 = __ldxr(p_shared_owners);
        while (__stxr(v9 + 1, p_shared_owners));
      }

      sub_100123144(v5, v19, (uint64_t)v19);
      BOOL v10 = v20;
      if (v20)
      {
        uint64_t v11 = (unint64_t *)&v20->__shared_owners_;
        do
          unint64_t v12 = __ldaxr(v11);
        while (__stlxr(v12 - 1, v11));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }

      unsigned __int8 v13 = v22;
      if (v22)
      {
        std::string v14 = (unint64_t *)&v22->__shared_owners_;
        do
          unint64_t v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }

      uint64_t v16 = (void *)v6[1];
      if (v16)
      {
        do
        {
          std::string v17 = v16;
          uint64_t v16 = (void *)*v16;
        }

        while (v16);
      }

      else
      {
        do
        {
          std::string v17 = (void *)v6[2];
          BOOL v18 = *v17 == (void)v6;
          uint64_t v6 = v17;
        }

        while (!v18);
      }

      uint64_t v6 = v17;
    }

    while (v17 != (void *)(a1 + 16));
  }

void sub_100122DBC(_Unwind_Exception *a1)
{
}

void *sub_100122DEC(uint64_t a1, uint64_t *a2)
{
  int v3 = (void *)(a1 + 8);
  size_t v4 = sub_100122E5C(a1, a2, *(void **)(a1 + 8), (void *)(a1 + 8));
  if (v3 == v4) {
    return v3;
  }
  uint64_t v5 = v4;
  uint64_t v6 = v4[4];
  if (*a2 != v6
    && strcmp( (const char *)(*(void *)(*a2 + 8) & 0x7FFFFFFFFFFFFFFFLL),  (const char *)(*(void *)(v6 + 8) & 0x7FFFFFFFFFFFFFFFLL)) < 0)
  {
    return v3;
  }

  return v5;
}

void *sub_100122E5C(uint64_t a1, uint64_t *a2, void *a3, void *a4)
{
  if (a3)
  {
    uint64_t v5 = a3;
    uint64_t v6 = *a2;
    do
    {
      uint64_t v7 = v5[4];
      if (v7 == v6)
      {
        a4 = v5;
      }

      else if (strcmp( (const char *)(*(void *)(v7 + 8) & 0x7FFFFFFFFFFFFFFFLL),  (const char *)(*(void *)(v6 + 8) & 0x7FFFFFFFFFFFFFFFLL)) < 0)
      {
        ++v5;
      }

      else
      {
        a4 = v5;
      }

      uint64_t v5 = (void *)*v5;
    }

    while (v5);
  }

  return a4;
}

uint64_t *sub_100122ED0(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v6 = (uint64_t **)sub_100122F80((uint64_t)a1, &v12, a2);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    unint64_t v8 = v6;
    uint64_t v7 = (uint64_t *)operator new(0x38uLL);
    v10[1] = a1 + 1;
    v7[4] = **a4;
    v7[5] = 0LL;
    v7[6] = 0LL;
    char v11 = 1;
    sub_10000CC04(a1, v12, v8, v7);
    v10[0] = 0LL;
    sub_10001E3DC((uint64_t)v10, 0LL);
  }

  return v7;
}

void *sub_100122F80(uint64_t a1, void *a2, uint64_t *a3)
{
  size_t v4 = (void *)(a1 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  if (v5)
  {
    uint64_t v6 = *a3;
    uint64_t v7 = v5[4];
    if (*a3 != v7)
    {
      unint64_t v8 = (const char *)(*(void *)(v6 + 8) & 0x7FFFFFFFFFFFFFFFLL);
      do
      {
        unint64_t v9 = (const char *)(*(void *)(v7 + 8) & 0x7FFFFFFFFFFFFFFFLL);
        if (strcmp(v8, v9) < 0)
        {
          BOOL v10 = (void *)*v5;
          size_t v4 = v5;
          if (!*v5) {
            break;
          }
        }

        else
        {
          if ((strcmp(v9, v8) & 0x80000000) == 0) {
            break;
          }
          size_t v4 = v5 + 1;
          BOOL v10 = (void *)v5[1];
          if (!v10) {
            break;
          }
        }

        uint64_t v7 = v10[4];
        uint64_t v5 = v10;
      }

      while (v6 != v7);
    }
  }

  else
  {
    uint64_t v5 = (void *)(a1 + 8);
  }

  *a2 = v5;
  return v4;
}

uint64_t sub_100123034(uint64_t a1)
{
  return a1;
}

void *sub_100123070(void *a1, uint64_t a2)
{
  *a1 = a2;
  size_t v4 = operator new(0x20uLL);
  *size_t v4 = &off_100197250;
  v4[1] = 0LL;
  v4[2] = 0LL;
  double v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_1001230B4(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1001230D8(std::__shared_weak_count *a1)
{
}

uint64_t sub_1001230EC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 24LL))(result);
  }
  return result;
}

uint64_t sub_100123104(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }

  else
  {
    return 0LL;
  }

char *sub_100123144(uint64_t **a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = (void **)sub_100122F80((uint64_t)a1, &v11, a2);
  uint64_t v6 = (char *)*v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    uint64_t v6 = (char *)operator new(0x38uLL);
    v9[1] = a1 + 1;
    *((void *)v6 + 4) = *(void *)a3;
    *(_OWORD *)(v6 + 40) = *(_OWORD *)(a3 + 8);
    *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
    *(void *)(a3 + 16) = 0LL;
    char v10 = 1;
    sub_10000CC04(a1, v11, v7, (uint64_t *)v6);
    v9[0] = 0LL;
    sub_10001E3DC((uint64_t)v9, 0LL);
  }

  return v6;
}

void sub_1001231F8()
{
  unsigned __int8 v0 = operator new(1uLL);
  sub_100123274(&v4, (uint64_t)v0);
  sub_1000198A4((uint64_t)&unk_1001A4870, &v4);
  uint64_t v1 = (std::__shared_weak_count *)*((void *)&v4 + 1);
  if (*((void *)&v4 + 1))
  {
    uint64_t v2 = (unint64_t *)(*((void *)&v4 + 1) + 8LL);
    do
      unint64_t v3 = __ldaxr(v2);
    while (__stlxr(v3 - 1, v2));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }

void *sub_100123274(void *a1, uint64_t a2)
{
  *a1 = a2;
  __int128 v4 = operator new(0x20uLL);
  *__int128 v4 = &off_1001972C8;
  v4[1] = 0LL;
  v4[2] = 0LL;
  double v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_1001232BC(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1001232D8(std::__shared_weak_count *a1)
{
}

void sub_1001232EC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1) {
    operator delete(v1);
  }
}

uint64_t sub_1001232FC(uint64_t a1, uint64_t a2)
{
  else {
    return 0LL;
  }
}

void *sub_10012333C(void *a1, __int128 *a2)
{
  unint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_100123424((uint64_t)a1, a2);
  *a1 = off_100197348;
  a1[45] = &off_100197448;
  a1[46] = &off_100197470;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 12_Block_object_dispose(va, 8) = -1;
  *a1 = off_100197348;
  a1[45] = off_1001973D0;
  a1[46] = off_1001973F8;
  return a1;
}

void sub_1001233C0(_Unwind_Exception *a1)
{
}

uint64_t sub_1001233E4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100123424(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_1001974E0;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000BE308();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + sub_100006224(v4 - 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 8_Block_object_dispose(va, 8) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100005148(a1 + 96);
  return a1;
}

void sub_10012348C(_Unwind_Exception *a1)
{
}

uint64_t sub_1001234A0(uint64_t a1)
{
  *(void *)a1 = off_1001974E0;
  sub_100123718(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

void sub_10012353C(char *a1)
{
}

uint64_t sub_100123580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_1001235B4(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put(a1 + 96, (char)a2);
    }
  }

  return v2;
}

uint64_t sub_100123600(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100197410);
  sub_1001234A0(v2);
  return std::ios::~ios(a1 + 8);
}

void sub_100123638(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100197410);
  sub_1001234A0((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

uint64_t sub_100123678(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100197410);
  sub_1001234A0(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_1001236B8(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100197410);
  sub_1001234A0((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

void sub_100123704(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1001234A0(a1);
  operator delete(v1);
}

uint64_t sub_100123718(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        sub_100005F24(a1 + 104, __p);
        sub_100123868((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100006174(__p, "");
        sub_10000600C(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_100123840( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

int *sub_100123868(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000BE2F0())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000BE278();
    uint64_t v7 = *((unsigned __int8 *)a1 + 16);
    if (os_log_type_enabled(v6, *((os_log_type_t *)a1 + 16))) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = 2LL;
    }
    uint64_t v9 = *a1;
    else {
      char v10 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v20 = v4;
    __int16 v21 = 2080;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    uint64_t v24 = 183LL;
    __int16 v25 = 2082;
    uint64_t v26 = v10;
    uint64_t v11 = (const char *)_os_log_send_and_compose_impl( v8,  &v18,  0LL,  0LL,  &_mh_execute_header,  v6,  v7,  "%.*s: <%lu> %{public}s",  buf,  38);
    if (v11)
    {
      uint64_t v12 = (char *)v11;
      fprintf(__stderrp, "%s\n", v11);
      free(v12);
    }
  }

  else
  {
    unsigned __int8 v13 = (os_log_s *)sub_1000BE278();
    os_log_type_t v14 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = *a1;
      else {
        uint64_t v16 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v20 = v4;
      __int16 v21 = 2080;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = 183LL;
      __int16 v25 = 2082;
      uint64_t v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

id frk_unwrapped_symmetric_key_with_shipping_private_key(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([a1 objectForKey:@"com.apple.wkms.fcs-response"]);
  uint64_t v7 = (void *)v6;
  if (!v5)
  {
    unint64_t v29 = a3;
    NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
    unint64_t v42 = @"ERROR: Shipping private key is NULL.";
    uint64_t v16 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
    uint64_t v22 = 26LL;
LABEL_14:
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.internal.fetchrestorekeys",  v22,  v16));
    uint64_t v8 = 0LL;
    char v10 = 0LL;
    uint64_t v12 = 0LL;
LABEL_16:
    uint64_t v18 = 0LL;
    int v20 = 0LL;
    goto LABEL_17;
  }

  if (!v6)
  {
    unint64_t v29 = a3;
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    unint64_t v40 = @"ERROR: This archive does not contain a shipping key response.";
    uint64_t v16 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    uint64_t v22 = 25LL;
    goto LABEL_14;
  }

  id v32 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v6,  0LL,  &v32));
  id v9 = v32;
  if (!v8)
  {
    char v10 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v18 = 0LL;
    int v20 = 0LL;
    if (!a3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  char v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"wrapped-key"]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"enc-request"]);
  unint64_t v29 = a3;
  if (!v10
    || (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v11), (objc_opt_isKindOfClass(v10, v13) & 1) == 0)
    || !v12
    || (uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v14), (objc_opt_isKindOfClass(v12, v15) & 1) == 0))
  {
    NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
    uint64_t v38 = @"ERROR: Response dictionary is missing required keys. Will fail";
    uint64_t v16 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.internal.fetchrestorekeys",  23LL,  v16));

    goto LABEL_16;
  }

  uint64_t v16 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v10,  0LL);
  std::string v17 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v12,  0LL);
  unint64_t v28 = v17;
  if (!v16)
  {
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    int v36 = @"ERROR: shipping key wrapped-key failed base64 decode";
    __int16 v25 = &v36;
    uint64_t v26 = &v35;
LABEL_24:
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v26,  1LL,  v17));
    uint64_t v27 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.internal.fetchrestorekeys",  19LL,  v19));

    id v21 = (id)v27;
    uint64_t v18 = 0LL;
    int v20 = 0LL;
    goto LABEL_25;
  }

  if (!v17)
  {
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    unint64_t v34 = @"ERROR: shipping key enc-request failed base64 decode";
    __int16 v25 = &v34;
    uint64_t v26 = &v33;
    goto LABEL_24;
  }

  id v31 = v9;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[CryptoKitWrapper convertPrivateKeyTox963WithPemPrivateKey:error:]( &OBJC_CLASS____TtC16FetchRestoreKeys16CryptoKitWrapper,  "convertPrivateKeyTox963WithPemPrivateKey:error:",  v5,  &v31));
  id v19 = v31;

  if (!v18)
  {
    int v20 = 0LL;
    goto LABEL_26;
  }

  id v30 = v19;
  int v20 = (void *)objc_claimAutoreleasedReturnValue( +[CryptoKitWrapper unwrapEncryptionKeyWithWrappedKey:encapsulatedKey:privateKey:error:]( &OBJC_CLASS____TtC16FetchRestoreKeys16CryptoKitWrapper,  "unwrapEncryptionKeyWithWrappedKey:encapsulatedKey:privateKey:error:",  v16,  v28,  v18,  &v30));
  id v21 = v30;
LABEL_25:

  id v19 = v21;
LABEL_26:

LABEL_17:
  id v9 = v19;
  a3 = v29;
  if (v29) {
LABEL_18:
  }
    *a3 = v9;
LABEL_19:
  id v23 = v20;

  return v23;
}

id frk_metadata_from_aea_auth_data(AEAAuthData_impl *a1, void *a2)
{
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint32_t EntryCount = AEAAuthDataGetEntryCount(a1);
  if (!EntryCount)
  {
LABEL_12:
    id v16 = [v4 copy];
    std::string v17 = 0LL;
    if (a2) {
      goto LABEL_23;
    }
    goto LABEL_24;
  }

  uint32_t v6 = EntryCount;
  uint32_t v7 = 0;
  while (1)
  {
    data_uint64_t size = 0LL;
    size_t key_length = 0LL;
    if (AEAAuthDataGetEntry(a1, v7, 0LL, 0LL, &key_length, 0LL, 0LL, &data_size))
    {
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      uint64_t v26 = @"Failed to parse auth data blob.";
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
      std::string v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.internal.fetchrestorekeys",  17LL,  v18));

      goto LABEL_22;
    }

    if (!key_length)
    {
      NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
      uint64_t v38 = @"Failed to parse key in KVS (zero size key).";
      id v19 = &v38;
      int v20 = &v37;
LABEL_20:
      uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v19,  v20,  1LL));
      std::string v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.internal.fetchrestorekeys",  17LL,  v13));
      goto LABEL_21;
    }

    size_t v8 = ++key_length;
    if (!data_size)
    {
      NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
      int v36 = @"Failed to parse key in KVS (zero size data).";
      id v19 = &v36;
      int v20 = &v35;
      goto LABEL_20;
    }

    id v9 = calloc(1uLL, v8);
    if (!v9)
    {
      NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
      unint64_t v34 = @"KVS keyBuffer allocation failure.";
      id v19 = &v34;
      int v20 = &v33;
      goto LABEL_20;
    }

    char v10 = v9;
    uint64_t v11 = (uint8_t *)calloc(1uLL, data_size);
    if (!v11)
    {
      free(v10);
      NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
      id v32 = @"KVS dataBuffer allocation failure.";
      id v19 = &v32;
      int v20 = &v31;
      goto LABEL_20;
    }

    uint64_t v12 = v11;
    if (AEAAuthDataGetEntry(a1, v7, key_length, (char *)v10, &key_length, data_size, v11, &data_size))
    {
      free(v10);
      free(v12);
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      id v30 = @"KVS data fetch failure.";
      id v19 = &v30;
      int v20 = &v29;
      goto LABEL_20;
    }

    uint64_t v13 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v10);
    uint64_t v14 = objc_alloc(&OBJC_CLASS___NSData);
    uint64_t v15 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( v14,  "initWithBytesNoCopy:length:freeWhenDone:",  v12,  data_size,  1LL);
    free(v10);
    if (!v13 || !v15) {
      break;
    }
    [v4 setObject:v15 forKey:v13];

    if (v6 == ++v7) {
      goto LABEL_12;
    }
  }

  NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
  unint64_t v28 = @"KVS key value - parse failure.";
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  std::string v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.internal.fetchrestorekeys",  17LL,  v22));

LABEL_21:
LABEL_22:
  id v16 = 0LL;
  if (a2) {
LABEL_23:
  }
    *a2 = v17;
LABEL_24:

  return v16;
}

void *sub_1001242F0(uint64_t a1, void *a2)
{
  return sub_100124AF8(a1, a2);
}

unint64_t sub_100124304(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    int v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100125F48(&qword_1001A46E8);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  int v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100126010(v7, (uint64_t)&v16);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_1001249B4(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_100126058(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 48LL;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10012442C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    int v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100125F48(&qword_1001A46E0);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  int v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v7 = *(v6 - 3);
    uint64_t v8 = *(v6 - 2);
    uint64_t v10 = *(v6 - 1);
    uint64_t v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    unint64_t result = sub_1001249B4(v7, v8);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v13 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v13 = v7;
    v13[1] = v8;
    BOOL v14 = (void *)(v4[7] + 16 * result);
    *BOOL v14 = v10;
    v14[1] = v9;
    uint64_t v15 = v4[2];
    BOOL v16 = __OFADD__(v15, 1LL);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v6 += 4;
    v4[2] = v17;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

Class sub_100124558(uint64_t a1, uint64_t a2)
{
  return sub_100124D7C(a1, a2);
}

Class sub_100124578( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t (*a5)(uint64_t, unint64_t))
{
  id v7 = a3;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v10 = v9;

  uint64_t v11 = a5(v8, v10);
  unint64_t v13 = v12;
  sub_100125F04(v8, v10);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100125F04(v11, v13);
  return isa;
}

uint64_t *sub_100124660( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_100124FDC(a1, a2, a3, a4, a5, a6);
}

Class static CryptoKitWrapper.wrappedDataDictionaryWithCert(plainText:certificate:)( uint64_t a1, uint64_t a2, __SecCertificate *a3)
{
  return sub_1001254D0(a1, a2, a3);
}

id CryptoKitWrapper.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id CryptoKitWrapper.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CryptoKitWrapper();
  return objc_msgSendSuper2(&v2, "init");
}

id CryptoKitWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CryptoKitWrapper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

unint64_t sub_1001249B4(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100124A18(a1, a2, v5);
}

unint64_t sub_100124A18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

void *sub_100124AF8(uint64_t a1, void *a2)
{
  uint64_t v5 = type metadata accessor for String.Encoding(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = &v29[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v9 = type metadata accessor for P256.KeyAgreement.PrivateKey(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v12 = &v29[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  v30[0] = a1;
  v30[1] = a2;
  sub_100125FCC(a1, (unint64_t)a2);
  uint64_t v13 = P256.KeyAgreement.PrivateKey.init<A>(x963Representation:)( v30,  &type metadata for Data,  &protocol witness table for Data);
  if (!v2)
  {
    uint64_t v31 = v9;
    uint64_t v14 = P256.KeyAgreement.PrivateKey.pemRepresentation.getter(v13);
    uint64_t v16 = v15;
    static String.Encoding.ascii.getter();
    a2 = (void *)String.data(using:allowLossyConversion:)(v8, 0LL, v14, v16);
    unint64_t v18 = v17;
    swift_bridgeObjectRelease(v16);
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    if (v18 >> 60 == 15)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(@"com.apple.internal.fetchrestorekeys");
      uint64_t v20 = v19;
      uint64_t v21 = sub_100125F48(&qword_1001A46C8);
      uint64_t inited = swift_initStackObject(v21, v29);
      *(_OWORD *)(inited + 16) = xmmword_10014DD80;
      *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
      *(void *)(inited + 40) = v23;
      a2 = &type metadata for String;
      *(void *)(inited + 72) = &type metadata for String;
      *(void *)(inited + 4_Block_object_dispose(va, 8) = 0xD000000000000017LL;
      *(void *)(inited + ++*(_DWORD *)(result + 56) = 0x800000010015D5F0LL;
      unint64_t v24 = sub_100124304(inited);
      id v25 = objc_allocWithZone(&OBJC_CLASS___NSError);
      NSString v26 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v20);
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v24);
      [v25 initWithDomain:v26 code:31 userInfo:isa];

      swift_willThrow();
      (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v31);
    }

    else
    {
      (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v31);
    }
  }

  return a2;
}

Class sub_100124D7C(uint64_t a1, uint64_t a2)
{
  Class isa = v2;
  type metadata accessor for String.Encoding(0LL);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v7 = &v26[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = type metadata accessor for P256.KeyAgreement.PrivateKey(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v12 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  static String.Encoding.ascii.getter(v11);
  uint64_t v13 = String.init(data:encoding:)(a1, a2, v7);
  if (v14)
  {
    uint64_t v15 = __chkstk_darwin(v13);
    P256.KeyAgreement.PrivateKey.init(pemRepresentation:)(v15);
    if (!v2)
    {
      uint64_t v24 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v9 + 32))(&v26[-v12], &v26[-v12], v8);
      Class isa = (Class)P256.KeyAgreement.PrivateKey.x963Representation.getter(v24);
      (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(&v26[-v12], v8);
    }
  }

  else
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(@"com.apple.internal.fetchrestorekeys");
    uint64_t v17 = v16;
    uint64_t v18 = sub_100125F48(&qword_1001A46C8);
    uint64_t inited = swift_initStackObject(v18, v26);
    *(_OWORD *)(inited + 16) = xmmword_10014DD80;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
    *(void *)(inited + 40) = v20;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 4_Block_object_dispose(va, 8) = 0xD000000000000017LL;
    *(void *)(inited + ++*(_DWORD *)(result + 56) = 0x800000010015D5F0LL;
    unint64_t v21 = sub_100124304(inited);
    id v22 = objc_allocWithZone(&OBJC_CLASS___NSError);
    NSString v23 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v17);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v21);
    [v22 initWithDomain:v23 code:31 userInfo:isa];

    swift_willThrow();
  }

  return isa;
}

uint64_t *sub_100124FDC( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  if (&type metadata accessor for HPKE) {
    BOOL v7 = &type metadata for HPKE == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || &nominal type descriptor for HPKE == 0LL)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(@"com.apple.internal.fetchrestorekeys");
    uint64_t v17 = v16;
    uint64_t v18 = sub_100125F48(&qword_1001A46C8);
    uint64_t inited = swift_initStackObject(v18, v61);
    *(_OWORD *)(inited + 16) = xmmword_10014DD80;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
    *(void *)(inited + 40) = v20;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 4_Block_object_dispose(va, 8) = 0xD000000000000027LL;
    *(void *)(inited + ++*(_DWORD *)(result + 56) = 0x800000010015D5C0LL;
    unint64_t v21 = sub_100124304(inited);
    uint64_t v13 = (uint64_t *)objc_allocWithZone(&OBJC_CLASS___NSError);
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v17);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v21);
    [v13 initWithDomain:v22 code:12 userInfo:isa];

    swift_willThrow();
  }

  else
  {
    unint64_t v57 = a2;
    unint64_t v58 = (char *)a4;
    uint64_t v56 = a1;
    uint64_t v12 = type metadata accessor for P256.KeyAgreement.PrivateKey(0LL);
    uint64_t v13 = &v44;
    uint64_t v62 = *(void *)(v12 - 8);
    uint64_t v14 = *(void *)(v62 + 64);
    __chkstk_darwin(v12);
    unint64_t v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    uint64_t v59 = a5;
    unint64_t v60 = a6;
    sub_100125FCC(a5, a6);
    P256.KeyAgreement.PrivateKey.init<A>(x963Representation:)( &v59,  &type metadata for Data,  &protocol witness table for Data);
    if (!v6)
    {
      __int128 v49 = &v44;
      uint64_t v54 = type metadata accessor for HPKE.Ciphersuite(0LL);
      unint64_t v48 = &v44;
      uint64_t v24 = *(void *)(v54 - 8);
      uint64_t v25 = *(void *)(v24 + 64);
      uint64_t v26 = __chkstk_darwin(v54);
      uint64_t v55 = a3;
      NSErrorUserInfoKey v27 = (char *)&v44 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      static HPKE.Ciphersuite.P256_SHA256_AES_GCM_256.getter(v26);
      uint64_t v28 = type metadata accessor for HPKE.Recipient(0LL);
      int64x2_t v47 = &v44;
      uint64_t v45 = v28;
      uint64_t v44 = *(void *)(v28 - 8);
      uint64_t v29 = __chkstk_darwin(v28);
      uint64_t v31 = (char *)&v44 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      unint64_t v53 = &v44;
      __chkstk_darwin(v29);
      id v32 = (char *)&v44 - v15;
      NSErrorUserInfoKey v33 = *(uint64_t (**)(char *))(v62 + 16);
      uint64_t v51 = v34;
      uint64_t v35 = v33((char *)&v44 - v15);
      __int128 v50 = &v44;
      __chkstk_darwin(v35);
      uint64_t v36 = v54;
      uint64_t v52 = v24;
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v27, v27, v54);
      uint64_t v37 = v55;
      unint64_t v38 = (unint64_t)v58;
      sub_100125FCC(v55, (unint64_t)v58);
      uint64_t v46 = v31;
      HPKE.Recipient.init<A>(privateKey:ciphersuite:info:encapsulatedKey:)( v32,  v27,  0LL,  0xC000000000000000LL,  v37,  v38,  v12,  &protocol witness table for P256.KeyAgreement.PrivateKey);
      unint64_t v58 = v27;
      uint64_t v39 = v51;
      uint64_t v40 = v52;
      uint64_t v59 = v56;
      unint64_t v60 = v57;
      unint64_t v41 = sub_100126068();
      unint64_t v42 = v46;
      uint64_t v13 = (uint64_t *)HPKE.Recipient.open<A>(_:)(&v59, &type metadata for Data, v41);
      (*(void (**)(char *, uint64_t))(v44 + 8))(v42, v45);
      (*(void (**)(char *, uint64_t))(v40 + 8))(v58, v36);
      (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v39, v12);
    }
  }

  return v13;
}

Class sub_1001254D0(uint64_t a1, uint64_t a2, SecCertificateRef certificate)
{
  if (&type metadata accessor for HPKE) {
    BOOL v4 = &type metadata for HPKE == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4 || &nominal type descriptor for HPKE == 0LL)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(@"com.apple.internal.fetchrestorekeys");
    uint64_t v16 = v15;
    uint64_t v17 = sub_100125F48(&qword_1001A46C8);
    uint64_t inited = swift_initStackObject(v17, v53);
    *(_OWORD *)(inited + 16) = xmmword_10014DD80;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
    *(void *)(inited + 40) = v19;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 4_Block_object_dispose(va, 8) = 0xD000000000000027LL;
    *(void *)(inited + ++*(_DWORD *)(result + 56) = 0x800000010015D5C0LL;
    unint64_t v20 = sub_100124304(inited);
    id v21 = objc_allocWithZone(&OBJC_CLASS___NSError);
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v16);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v20);
    [v21 initWithDomain:v22 code:12 userInfo:isa];

    swift_willThrow();
    return isa;
  }

  uint64_t v50 = a2;
  uint64_t v49 = a1;
  uint64_t v6 = SecCertificateCopyKey(certificate);
  if (!v6)
  {
    __break(1u);
    goto LABEL_18;
  }

  BOOL v7 = v6;
  CFDataRef v8 = SecKeyCopyExternalRepresentation(v6, 0LL);
  if (!v8)
  {
LABEL_18:
    __break(1u);
    JUMPOUT(0x100125ED4LL);
  }

  CFDataRef v9 = v8;
  uint64_t v10 = type metadata accessor for P256.KeyAgreement.PublicKey(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  Class isa = *(Class *)(v11 + 64);
  __chkstk_darwin(v10);
  unint64_t v13 = ((unint64_t)&isa[1].isa + 7) & 0xFFFFFFFFFFFFFFF0LL;
  v52[0] = static Data._unconditionallyBridgeFromObjectiveC(_:)(v9);
  v52[1] = v14;
  P256.KeyAgreement.PublicKey.init<A>(x963Representation:)( v52,  &type metadata for Data,  &protocol witness table for Data);
  if (v3)
  {
  }

  else
  {
    CFDataRef v39 = v9;
    uint64_t v40 = v7;
    int64x2_t v47 = v38;
    uint64_t v48 = type metadata accessor for HPKE.Ciphersuite(0LL);
    unint64_t v41 = v38;
    uint64_t v24 = *(void *)(v48 - 8);
    uint64_t v25 = v11;
    uint64_t v46 = 0LL;
    uint64_t v26 = *(void *)(v24 + 64);
    uint64_t v27 = __chkstk_darwin(v48);
    uint64_t v51 = v10;
    uint64_t v28 = (char *)v38 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    static HPKE.Ciphersuite.P256_SHA256_AES_GCM_256.getter(v27);
    uint64_t v29 = type metadata accessor for HPKE.Sender(0LL);
    unint64_t v42 = v38;
    v38[4] = v29;
    v38[3] = *(void *)(v29 - 8);
    uint64_t v30 = __chkstk_darwin(v29);
    id v32 = (char *)v38 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v45 = v38;
    __chkstk_darwin(v30);
    Class isa = (Class)((char *)v38 - v13);
    uint64_t v44 = v25;
    NSErrorUserInfoKey v33 = *(uint64_t (**)(char *, char *, uint64_t))(v25 + 16);
    uint64_t v34 = v48;
    __int16 v43 = (char *)v38 - v13;
    uint64_t v35 = v33((char *)v38 - v13, (char *)v38 - v13, v51);
    __chkstk_darwin(v35);
    uint64_t v36 = v51;
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v28, v28, v34);
    uint64_t v37 = v46;
    HPKE.Sender.init<A>(recipientKey:ciphersuite:info:)( (char *)v38 - v13,  v28,  0LL,  0xC000000000000000LL,  v36,  &protocol witness table for P256.KeyAgreement.PublicKey);
    if (!v37)
    {
      v38[2] = v32;
      v38[1] = (char *)v38 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v46 = v24;
      __asm { BR              X10 }
    }

    (*(void (**)(char *, uint64_t))(v24 + 8))(v28, v34);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v43, v36);
  }

  return isa;
}

uint64_t type metadata accessor for CryptoKitWrapper()
{
  return objc_opt_self(&OBJC_CLASS____TtC16FetchRestoreKeys16CryptoKitWrapper);
}

uint64_t sub_100125F04(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_release)();
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100125F48(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100125F88()
{
  unint64_t result = qword_1001A46D0;
  if (!qword_1001A46D0)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for UnsafeRawBufferPointer,  &type metadata for UnsafeRawBufferPointer);
    atomic_store(result, (unint64_t *)&qword_1001A46D0);
  }

  return result;
}

uint64_t sub_100125FCC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_retain)();
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100126010(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100125F48(&qword_1001A46F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100126058(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100126068()
{
  unint64_t result = qword_1001A46F8;
  if (!qword_1001A46F8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_1001A46F8);
  }

  return result;
}

uint64_t sub_1001260AC(void *a1, void *a2, uint64_t *a3)
{
  if ((void *)*a1 == a2)
  {
    uint64_t v4 = 4LL;
  }

  else
  {
    if (!*a1) {
      goto LABEL_6;
    }
    uint64_t v4 = 5LL;
    a2 = (void *)*a1;
  }

  (*(void (**)(void *))(*a2 + 8 * v4))(a2);
LABEL_6:
  uint64_t result = *a3;
  *a3 = 0LL;
  if (result) {
    return sub_10000F37C(result);
  }
  return result;
}

uint64_t sub_100126108(uint64_t *a1)
{
  __int128 v2 = a1 + 22;
  uint64_t v3 = (void *)a1[25];
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v2;
  }

  else
  {
    if (!v3) {
      goto LABEL_6;
    }
    uint64_t v4 = 5LL;
  }

  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  uint64_t result = a1[19];
  a1[19] = 0LL;
  if (result) {
    return sub_10000F37C(result);
  }
  return result;
}

void sub_100126164()
{
}

void sub_100126180(void *a1, uint64_t a2, uint64_t a3)
{
  __int128 v4 = *(_OWORD *)((char *)__cxa_begin_catch(a1) + 8);
  if (*(_BYTE *)(a3 + 89))
  {
    __int128 v5 = v4;
    sub_10000C920(a3);
    __int128 v4 = v5;
    *(_BYTE *)(a3 + 89) = 0;
  }

  *(_OWORD *)a3 = v4;
  __cxa_end_catch();
}

void sub_1001261D0(uint64_t a1)
{
  uint64_t v1 = (unint64_t *)(a1 + 8);
  do
    sub_10002B120(v1);
  while (v3);
  if (!v2)
  {
    sub_10002B110();
    sub_10002B138();
  }

  sub_10002B130();
}

uint64_t sub_100126200(uint64_t *a1)
{
  uint64_t result = *a1;
  *a1 = 0LL;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 40LL))(result);
  }
  return result;
}

uint64_t sub_100126298(uint64_t a1, uint64_t a2)
{
  return std::ios::~ios(a2 + 112);
}

uint64_t sub_1001262D4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  for (uint64_t result = (uint64_t)__cxa_begin_catch(a2); a4 != a1; a4 += 104LL)
  {
    uint64_t v8 = *(void *)(a4 + 48);
    if (v8) {
      *(void *)(v8 + 32) = 0LL;
    }
    uint64_t result = sub_100006224(a4);
  }

  return result;
}

void sub_10012633C(void *a1)
{
  uint64_t v1 = sub_100062280(a1);
  sub_100062270(v1);
  sub_10002B130();
}

void sub_100126370(uint64_t a1)
{
}

void sub_10012639C(std::__shared_weak_count *a1)
{
  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    unint64_t v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }

  sub_10002B130();
}

void sub_1001263E4()
{
  if (v4)
  {
    uint64_t v5 = 4LL;
  }

  else
  {
    if (!v3) {
      goto LABEL_6;
    }
    uint64_t v5 = 5LL;
    uint64_t v2 = v3;
  }

  sub_1000E9260(v2, v5);
LABEL_6:
  if ((void *)*v1 == v0)
  {
    uint64_t v6 = 4LL;
    goto LABEL_10;
  }

  if (*v1)
  {
    uint64_t v6 = 5LL;
    unsigned __int8 v0 = (void *)*v1;
LABEL_10:
    sub_1000E9258((uint64_t)v0, *(uint64_t (**)(void))(*v0 + 8 * v6));
    return;
  }

  sub_10002B130();
}

uint64_t sub_10012644C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  *a2 = 0LL;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 40LL))(result);
  }
  return result;
}

void *sub_100126474(void *result, void *a2, void *a3, uint64_t a4)
{
  if ((void *)*result == a2)
  {
    uint64_t v6 = 4LL;
  }

  else
  {
    if (!*result) {
      goto LABEL_6;
    }
    uint64_t v6 = 5LL;
    a2 = (void *)*result;
  }

  uint64_t result = (void *)(*(uint64_t (**)(void *))(*a2 + 8 * v6))(a2);
LABEL_6:
  if (*a3 == a4) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)a4 + 32LL))(a4);
  }
  if (*a3) {
    return (void *)(*(uint64_t (**)(void))(*(void *)*a3 + 40LL))(*a3);
  }
  return result;
}

void sub_100126504(std::__shared_weak_count *a1)
{
  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    unint64_t v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
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

id objc_msgSend_BSDName(void *a1, const char *a2, ...)
{
  return _[a1 BSDName];
}

id objc_msgSend_CLIPassphrasePrompt(void *a1, const char *a2, ...)
{
  return _[a1 CLIPassphrasePrompt];
}

id objc_msgSend_CLIVerifyPassphrasePrompt(void *a1, const char *a2, ...)
{
  return _[a1 CLIVerifyPassphrasePrompt];
}

id objc_msgSend_GUIAskForPassphraseWithEncryptionFrontend_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "GUIAskForPassphraseWithEncryptionFrontend:error:");
}

id objc_msgSend_GUIAskForPassphraseWithEncryptionFrontend_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "GUIAskForPassphraseWithEncryptionFrontend:reply:");
}

id objc_msgSend_GUIAskForPassphraseWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "GUIAskForPassphraseWithError:");
}

id objc_msgSend_GUIPassphraseLabel(void *a1, const char *a2, ...)
{
  return _[a1 GUIPassphraseLabel];
}

id objc_msgSend_GUIPassphrasePrompt(void *a1, const char *a2, ...)
{
  return _[a1 GUIPassphrasePrompt];
}

id objc_msgSend_GUIVerifyPassphraseLabel(void *a1, const char *a2, ...)
{
  return _[a1 GUIVerifyPassphraseLabel];
}

id objc_msgSend_GraphNodeWithDictionary_updateChangesToDict_workDir_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "GraphNodeWithDictionary:updateChangesToDict:workDir:error:");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_KKMSKeyWithURL_destKey_destKeySize_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "KKMSKeyWithURL:destKey:destKeySize:error:");
}

id objc_msgSend_RAMdisk(void *a1, const char *a2, ...)
{
  return _[a1 RAMdisk];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLByStandardizingPath(void *a1, const char *a2, ...)
{
  return _[a1 URLByStandardizingPath];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_WKMSKeyWithURL_authData_destKey_destKeySize_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "WKMSKeyWithURL:authData:destKey:destKeySize:error:");
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 _xpcConnection];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_absoluteURL(void *a1, const char *a2, ...)
{
  return _[a1 absoluteURL];
}

id objc_msgSend_activeNode(void *a1, const char *a2, ...)
{
  return _[a1 activeNode];
}

id objc_msgSend_activeShadowURL(void *a1, const char *a2, ...)
{
  return _[a1 activeShadowURL];
}

id objc_msgSend_addBytesDownloaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBytesDownloaded:");
}

id objc_msgSend_addDecendantsToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDecendantsToArray:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRequest:");
}

id objc_msgSend_addShadowNodes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addShadowNodes:error:");
}

id objc_msgSend_addShadowURLs_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addShadowURLs:error:");
}

id objc_msgSend_addToRefCountWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToRefCountWithError:");
}

id objc_msgSend_addToRefCountWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToRefCountWithReply:");
}

id objc_msgSend_addValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValue:forHTTPHeaderField:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allowOnDiskCacheWithSinkDiskImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowOnDiskCacheWithSinkDiskImage:");
}

id objc_msgSend_allowStoringInKeychain(void *a1, const char *a2, ...)
{
  return _[a1 allowStoringInKeychain];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_applyMountPointsWithBSDName_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyMountPointsWithBSDName:error:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_askPermissionWithRememberPassword_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "askPermissionWithRememberPassword:error:");
}

id objc_msgSend_attachCompletedWithHandle_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachCompletedWithHandle:reply:");
}

id objc_msgSend_attachParams(void *a1, const char *a2, ...)
{
  return _[a1 attachParams];
}

id objc_msgSend_attachToExistingDeviceWithParams_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachToExistingDeviceWithParams:reply:");
}

id objc_msgSend_attachToNewDeviceWithParams_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachToNewDeviceWithParams:reply:");
}

id objc_msgSend_attachWithParams_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachWithParams:reply:");
}

id objc_msgSend_autoMount(void *a1, const char *a2, ...)
{
  return _[a1 autoMount];
}

id objc_msgSend_backend(void *a1, const char *a2, ...)
{
  return _[a1 backend];
}

id objc_msgSend_backendXPC(void *a1, const char *a2, ...)
{
  return _[a1 backendXPC];
}

id objc_msgSend_baseBackendXPC(void *a1, const char *a2, ...)
{
  return _[a1 baseBackendXPC];
}

id objc_msgSend_blockSize(void *a1, const char *a2, ...)
{
  return _[a1 blockSize];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_buf(void *a1, const char *a2, ...)
{
  return _[a1 buf];
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_bytesDownloaded(void *a1, const char *a2, ...)
{
  return _[a1 bytesDownloaded];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return _[a1 cache];
}

id objc_msgSend_cacheDocument_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheDocument:");
}

id objc_msgSend_cacheLock(void *a1, const char *a2, ...)
{
  return _[a1 cacheLock];
}

id objc_msgSend_cacheURL(void *a1, const char *a2, ...)
{
  return _[a1 cacheURL];
}

id objc_msgSend_certificate(void *a1, const char *a2, ...)
{
  return _[a1 certificate];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_checkAttachEntitlementWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkAttachEntitlementWithError:");
}

id objc_msgSend_checkBeforeSetWithIsPassphrase_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkBeforeSetWithIsPassphrase:error:");
}

id objc_msgSend_checkExistingFileWithURL_isDirectory_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkExistingFileWithURL:isDirectory:error:");
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_checkStackValidityWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkStackValidityWithError:");
}

id objc_msgSend_checkWithHasIcloudKeychain_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkWithHasIcloudKeychain:error:");
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return _[a1 children];
}

id objc_msgSend_client2IOhandler(void *a1, const char *a2, ...)
{
  return _[a1 client2IOhandler];
}

id objc_msgSend_closeConnection(void *a1, const char *a2, ...)
{
  return _[a1 closeConnection];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_commandSize(void *a1, const char *a2, ...)
{
  return _[a1 commandSize];
}

id objc_msgSend_completeCommandWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeCommandWithError:");
}

id objc_msgSend_completeRequest_data_response_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeRequest:data:response:error:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_connectWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectWithError:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_consoleAskForPassphraseWithUseStdin_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consoleAskForPassphraseWithUseStdin:error:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsValueForKey:");
}

id objc_msgSend_conversionMethod(void *a1, const char *a2, ...)
{
  return _[a1 conversionMethod];
}

id objc_msgSend_convertParams(void *a1, const char *a2, ...)
{
  return _[a1 convertParams];
}

id objc_msgSend_convertPrivateKeyTox963WithPemPrivateKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPrivateKeyTox963WithPemPrivateKey:error:");
}

id objc_msgSend_convertUserDataWithDiskImage_destination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertUserDataWithDiskImage:destination:");
}

id objc_msgSend_convertWithDiskImage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertWithDiskImage:error:");
}

id objc_msgSend_convertWithParams_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertWithParams:reply:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyBlockDeviceWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyBlockDeviceWithError:");
}

id objc_msgSend_copyDefaultLocalizedStringForDIErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyDefaultLocalizedStringForDIErrorCode:");
}

id objc_msgSend_copyDevicePathWithStatfs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyDevicePathWithStatfs:");
}

id objc_msgSend_copyDictNodesToFolder_dict_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyDictNodesToFolder:dict:error:");
}

id objc_msgSend_copyDiskImagesControllerWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyDiskImagesControllerWithError:");
}

id objc_msgSend_copyIOMediaWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyIOMediaWithError:");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_copyNextObject(void *a1, const char *a2, ...)
{
  return _[a1 copyNextObject];
}

id objc_msgSend_copyPropertyWithClass_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyPropertyWithClass:key:");
}

id objc_msgSend_copyRootBlockDeviceWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyRootBlockDeviceWithError:");
}

id objc_msgSend_copyUnmatchedDiskImageWithRegEntryID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyUnmatchedDiskImageWithRegEntryID:error:");
}

id objc_msgSend_copyUpdatedOutputURLWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyUpdatedOutputURLWithError:");
}

id objc_msgSend_copyWithURL_outURLStr_maxLen_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithURL:outURLStr:maxLen:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createAEABackendWithBackendXPC_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAEABackendWithBackendXPC:error:");
}

id objc_msgSend_createAndResumeTask(void *a1, const char *a2, ...)
{
  return _[a1 createAndResumeTask];
}

id objc_msgSend_createAndStoreInSystemKeychainWithAccount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAndStoreInSystemKeychainWithAccount:error:");
}

id objc_msgSend_createAndStoreInSystemKeychainWithCreator_account_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAndStoreInSystemKeychainWithCreator:account:error:");
}

id objc_msgSend_createAndStoreInSystemKeychainWithCreator_account_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAndStoreInSystemKeychainWithCreator:account:reply:");
}

id objc_msgSend_createBackendWithFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createBackendWithFlags:");
}

id objc_msgSend_createConnection(void *a1, const char *a2, ...)
{
  return _[a1 createConnection];
}

id objc_msgSend_createDeviceWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDeviceWithError:");
}

id objc_msgSend_createDiskImageParamsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDiskImageParamsWithError:");
}

id objc_msgSend_createDiskImageParamsXPC(void *a1, const char *a2, ...)
{
  return _[a1 createDiskImageParamsXPC];
}

id objc_msgSend_createDiskImageWithCache_shadowValidation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDiskImageWithCache:shadowValidation:");
}

id objc_msgSend_createEncryptionWithXPCHandler_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEncryptionWithXPCHandler:error:");
}

id objc_msgSend_createListener(void *a1, const char *a2, ...)
{
  return _[a1 createListener];
}

id objc_msgSend_createNodesConnectivityWithNodesDict_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNodesConnectivityWithNodesDict:error:");
}

id objc_msgSend_createPstackDictWithNode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPstackDictWithNode:");
}

id objc_msgSend_createPublicKeyHeaderWithBackendXPC_publicKeyHeader_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPublicKeyHeaderWithBackendXPC:publicKeyHeader:error:");
}

id objc_msgSend_createRamBackend(void *a1, const char *a2, ...)
{
  return _[a1 createRamBackend];
}

id objc_msgSend_createShadowDiskImageWithBackend_numBlocks_sinkDiskImage_cache_only_stack_size_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:");
}

id objc_msgSend_createSinkDiskImage(void *a1, const char *a2, ...)
{
  return _[a1 createSinkDiskImage];
}

id objc_msgSend_createWithXpcHandler_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWithXpcHandler:error:");
}

id objc_msgSend_cryptoHeader(void *a1, const char *a2, ...)
{
  return _[a1 cryptoHeader];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_customCacheURL(void *a1, const char *a2, ...)
{
  return _[a1 customCacheURL];
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 decimalDigitCharacterSet];
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeBytesForKey_returnedLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBytesForKey:returnedLength:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decryptKeyWithData_destKey_destKeySize_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decryptKeyWithData:destKey:destKeySize:error:");
}

id objc_msgSend_defaultCStringEncoding(void *a1, const char *a2, ...)
{
  return _[a1 defaultCStringEncoding];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_deleteImage(void *a1, const char *a2, ...)
{
  return _[a1 deleteImage];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deserializationError(void *a1, const char *a2, ...)
{
  return _[a1 deserializationError];
}

id objc_msgSend_deviceHandle(void *a1, const char *a2, ...)
{
  return _[a1 deviceHandle];
}

id objc_msgSend_diParams(void *a1, const char *a2, ...)
{
  return _[a1 diParams];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_disconnectFromDriverWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectFromDriverWithError:");
}

id objc_msgSend_diskImageParamsXPC(void *a1, const char *a2, ...)
{
  return _[a1 diskImageParamsXPC];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueue];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_downloadSession(void *a1, const char *a2, ...)
{
  return _[a1 downloadSession];
}

id objc_msgSend_dupStderrWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dupStderrWithError:");
}

id objc_msgSend_dupWithStderrHandle_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dupWithStderrHandle:reply:");
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 effectiveUserIdentifier];
}

id objc_msgSend_embedUserDataWithParams_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "embedUserDataWithParams:reply:");
}

id objc_msgSend_embedWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "embedWithError:");
}

id objc_msgSend_emulateExternalDisk(void *a1, const char *a2, ...)
{
  return _[a1 emulateExternalDisk];
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeBytes_length_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBytes:length:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encryptionMethod(void *a1, const char *a2, ...)
{
  return _[a1 encryptionMethod];
}

id objc_msgSend_encryptionUUID(void *a1, const char *a2, ...)
{
  return _[a1 encryptionUUID];
}

id objc_msgSend_enqueueRequestWithSize_atOffset_destinationBuffer_destinationStream_completionSemaphore_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueRequestWithSize:atOffset:destinationBuffer:destinationStream:completionSemaphore:");
}

id objc_msgSend_enterSandbox(void *a1, const char *a2, ...)
{
  return _[a1 enterSandbox];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 ephemeralSessionConfiguration];
}

id objc_msgSend_eraseIfExistingWithURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eraseIfExistingWithURL:error:");
}

id objc_msgSend_errorWithDIException_description_prefix_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDIException:description:prefix:error:");
}

id objc_msgSend_errorWithDomain_code_description_verboseInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:description:verboseInfo:error:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errorWithEnumValue_verboseInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithEnumValue:verboseInfo:");
}

id objc_msgSend_errorWithPOSIXCode_verboseInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithPOSIXCode:verboseInfo:");
}

id objc_msgSend_executablePath(void *a1, const char *a2, ...)
{
  return _[a1 executablePath];
}

id objc_msgSend_extraInfo(void *a1, const char *a2, ...)
{
  return _[a1 extraInfo];
}

id objc_msgSend_failWithDIException_description_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failWithDIException:description:error:");
}

id objc_msgSend_failWithDIException_prefix_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failWithDIException:prefix:error:");
}

id objc_msgSend_failWithEnumValue_description_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failWithEnumValue:description:error:");
}

id objc_msgSend_failWithEnumValue_verboseInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failWithEnumValue:verboseInfo:error:");
}

id objc_msgSend_failWithNoPstackError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failWithNoPstackError:");
}

id objc_msgSend_failWithOSStatus_description_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failWithOSStatus:description:error:");
}

id objc_msgSend_failWithPOSIXCode_description_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failWithPOSIXCode:description:error:");
}

id objc_msgSend_failWithPOSIXCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failWithPOSIXCode:error:");
}

id objc_msgSend_failWithPOSIXCode_verboseInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failWithPOSIXCode:verboseInfo:error:");
}

id objc_msgSend_fileBackend(void *a1, const char *a2, ...)
{
  return _[a1 fileBackend];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fileDescriptor];
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileHandleForReading(void *a1, const char *a2, ...)
{
  return _[a1 fileHandleForReading];
}

id objc_msgSend_fileHandleForReadingFromURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileHandleForReadingFromURL:error:");
}

id objc_msgSend_fileMode(void *a1, const char *a2, ...)
{
  return _[a1 fileMode];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return _[a1 filePath];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fileURLWithPath_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:relativeToURL:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_getAEAKeyFromSAKSWithMetadata_key_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAEAKeyFromSAKSWithMetadata:key:error:");
}

id objc_msgSend_getAEAKeyWithHelper_keyBuffer_bufferSize_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAEAKeyWithHelper:keyBuffer:bufferSize:error:");
}

id objc_msgSend_getAuthEntryWithBackend_authTableNumEntries_mechanism_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAuthEntryWithBackend:authTableNumEntries:mechanism:error:");
}

id objc_msgSend_getAuthValueWithBackend_authTableNumEntries_mechanism_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAuthValueWithBackend:authTableNumEntries:mechanism:error:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getCFRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 getCFRunLoop];
}

id objc_msgSend_getCertificateWithCertificatePath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCertificateWithCertificatePath:error:");
}

id objc_msgSend_getCertificateWithEncryptionCreator_outCertificate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCertificateWithEncryptionCreator:outCertificate:error:");
}

id objc_msgSend_getCertificateWithPublicKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCertificateWithPublicKey:error:");
}

id objc_msgSend_getCryptoHeaderBackend(void *a1, const char *a2, ...)
{
  return _[a1 getCryptoHeaderBackend];
}

id objc_msgSend_getDescendants(void *a1, const char *a2, ...)
{
  return _[a1 getDescendants];
}

id objc_msgSend_getFileInfoWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFileInfoWithError:");
}

id objc_msgSend_getImageInfoWithExtra_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getImageInfoWithExtra:error:");
}

id objc_msgSend_getImageWithTag_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getImageWithTag:error:");
}

id objc_msgSend_getInterconnectLocation(void *a1, const char *a2, ...)
{
  return _[a1 getInterconnectLocation];
}

id objc_msgSend_getPassphraseUsingSaksWithBackendXPC_passPhrase_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPassphraseUsingSaksWithBackendXPC:passPhrase:error:");
}

id objc_msgSend_getPrivateKeyWithHeader_privateKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPrivateKeyWithHeader:privateKey:error:");
}

id objc_msgSend_getPublicKeyWithCertificate_key_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPublicKeyWithCertificate:key:error:");
}

id objc_msgSend_getRequestWithURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRequestWithURL:error:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_handleRefCount(void *a1, const char *a2, ...)
{
  return _[a1 handleRefCount];
}

id objc_msgSend_hasBaseImageCache(void *a1, const char *a2, ...)
{
  return _[a1 hasBaseImageCache];
}

id objc_msgSend_hasDirectoryPath(void *a1, const char *a2, ...)
{
  return _[a1 hasDirectoryPath];
}

id objc_msgSend_hasGUIaccess(void *a1, const char *a2, ...)
{
  return _[a1 hasGUIaccess];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasUnlockedBackend(void *a1, const char *a2, ...)
{
  return _[a1 hasUnlockedBackend];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hintFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hintFormat:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_imagesDictsArray(void *a1, const char *a2, ...)
{
  return _[a1 imagesDictsArray];
}

id objc_msgSend_imported(void *a1, const char *a2, ...)
{
  return _[a1 imported];
}

id objc_msgSend_inPlaceConversion(void *a1, const char *a2, ...)
{
  return _[a1 inPlaceConversion];
}

id objc_msgSend_initWithBackend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBackend:");
}

id objc_msgSend_initWithBackend_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBackend:key:");
}

id objc_msgSend_initWithBackendXPC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBackendXPC:");
}

id objc_msgSend_initWithBackendXPC_blockSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBackendXPC:blockSize:");
}

id objc_msgSend_initWithBackendXPC_header_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBackendXPC:header:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithClassName_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClassName:error:");
}

id objc_msgSend_initWithDIIOObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDIIOObject:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithData_pstackURL_imported_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:pstackURL:imported:error:");
}

id objc_msgSend_initWithDevName_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevName:error:");
}

id objc_msgSend_initWithDictionary_copyItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:copyItems:");
}

id objc_msgSend_initWithDictionary_updateChangesToDict_workDir_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:updateChangesToDict:workDir:error:");
}

id objc_msgSend_initWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEndpoint:");
}

id objc_msgSend_initWithFD_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFD:error:");
}

id objc_msgSend_initWithFileDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileDescriptor:");
}

id objc_msgSend_initWithFileDescriptor_closeOnDealloc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileDescriptor:closeOnDealloc:");
}

id objc_msgSend_initWithFileDescriptor_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileDescriptor:error:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithIOIterator_retain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIOIterator:retain:");
}

id objc_msgSend_initWithIOObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIOObject:");
}

id objc_msgSend_initWithInputURL_outputURL_shadowURLs_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInputURL:outputURL:shadowURLs:error:");
}

id objc_msgSend_initWithIteratorNext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIteratorNext:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParams:");
}

id objc_msgSend_initWithPluginName_params_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPluginName:params:");
}

id objc_msgSend_initWithPluginName_pluginParams_tag_UUID_parentNode_metadata_isCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPluginName:pluginParams:tag:UUID:parentNode:metadata:isCache:");
}

id objc_msgSend_initWithPstackURL_imported_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPstackURL:imported:error:");
}

id objc_msgSend_initWithRegistryEntryID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRegistryEntryID:error:");
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:");
}

id objc_msgSend_initWithSession_size_atOffset_destinationBuffer_destinationStream_completionSemaphore_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSession:size:atOffset:destinationBuffer:destinationStream:completionSemaphore:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:error:");
}

id objc_msgSend_initWithURL_fileOpenFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:fileOpenFlags:");
}

id objc_msgSend_initWithURL_fileOpenFlags_bandSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:fileOpenFlags:bandSize:");
}

id objc_msgSend_initWithURL_isCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:isCache:");
}

id objc_msgSend_initWithURL_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:key:");
}

id objc_msgSend_initWithURL_openMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:openMode:");
}

id objc_msgSend_initWithURL_shadowURLs_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:shadowURLs:error:");
}

id objc_msgSend_initWithURL_streamBase_maxAttempts_pauseInterval_maxRequestsInFlight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_inputStatFS(void *a1, const char *a2, ...)
{
  return _[a1 inputStatFS];
}

id objc_msgSend_inputURL(void *a1, const char *a2, ...)
{
  return _[a1 inputURL];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_instanceID(void *a1, const char *a2, ...)
{
  return _[a1 instanceID];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _[a1 invalidateAndCancel];
}

id objc_msgSend_ioObj(void *a1, const char *a2, ...)
{
  return _[a1 ioObj];
}

id objc_msgSend_ioObjectWithClassName_iterateParent_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ioObjectWithClassName:iterateParent:error:");
}

id objc_msgSend_isCache(void *a1, const char *a2, ...)
{
  return _[a1 isCache];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return _[a1 isEmpty];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_isNewDevice(void *a1, const char *a2, ...)
{
  return _[a1 isNewDevice];
}

id objc_msgSend_isPlugin(void *a1, const char *a2, ...)
{
  return _[a1 isPlugin];
}

id objc_msgSend_isPrivileged(void *a1, const char *a2, ...)
{
  return _[a1 isPrivileged];
}

id objc_msgSend_isPstack(void *a1, const char *a2, ...)
{
  return _[a1 isPstack];
}

id objc_msgSend_isQuarantined(void *a1, const char *a2, ...)
{
  return _[a1 isQuarantined];
}

id objc_msgSend_isUDIFWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUDIFWithFormat:");
}

id objc_msgSend_isUnlocked(void *a1, const char *a2, ...)
{
  return _[a1 isUnlocked];
}

id objc_msgSend_isWritableFileAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWritableFileAtPath:");
}

id objc_msgSend_isWritableFormat(void *a1, const char *a2, ...)
{
  return _[a1 isWritableFormat];
}

id objc_msgSend_jsonResponseWithRequest_session_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jsonResponseWithRequest:session:error:");
}

id objc_msgSend_keychainUnlockWithEncryptionUnlocker_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keychainUnlockWithEncryptionUnlocker:error:");
}

id objc_msgSend_keychainUnlockWithEncryptionUnlocker_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keychainUnlockWithEncryptionUnlocker:reply:");
}

id objc_msgSend_keychainUnlockWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keychainUnlockWithError:");
}

id objc_msgSend_keychainUnlockWithIsSystemKeychain_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keychainUnlockWithIsSystemKeychain:error:");
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysOfEntriesPassingTest:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_launchAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchAndReturnError:");
}

id objc_msgSend_launchIODaemonWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchIODaemonWithError:");
}

id objc_msgSend_launchedTaskWithExecutableURL_arguments_error_terminationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchedTaskWithExecutableURL:arguments:error:terminationHandler:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return _[a1 listener];
}

id objc_msgSend_loadImportedNodesWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadImportedNodesWithError:");
}

id objc_msgSend_loadPlistDictFromURL_dict_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadPlistDictFromURL:dict:error:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_lockBackendsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockBackendsWithError:");
}

id objc_msgSend_lockWritableBackendsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockWritableBackendsWithError:");
}

id objc_msgSend_logWithHeader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logWithHeader:");
}

id objc_msgSend_lookupLegacyKeychainWithXpcHandler_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lookupLegacyKeychainWithXpcHandler:error:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_makeCryptoFormatWithIsNewImage_pass_certificate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeCryptoFormatWithIsNewImage:pass:certificate:error:");
}

id objc_msgSend_makeNewImageEncryptedWithPassphrase_certificate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeNewImageEncryptedWithPassphrase:certificate:error:");
}

id objc_msgSend_maxAttempts(void *a1, const char *a2, ...)
{
  return _[a1 maxAttempts];
}

id objc_msgSend_maxRawUDIFRunSize(void *a1, const char *a2, ...)
{
  return _[a1 maxRawUDIFRunSize];
}

id objc_msgSend_maxRequests(void *a1, const char *a2, ...)
{
  return _[a1 maxRequests];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_mountedFrom(void *a1, const char *a2, ...)
{
  return _[a1 mountedFrom];
}

id objc_msgSend_mountedOnAPFS(void *a1, const char *a2, ...)
{
  return _[a1 mountedOnAPFS];
}

id objc_msgSend_mountedOnURL(void *a1, const char *a2, ...)
{
  return _[a1 mountedOnURL];
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_nbyte(void *a1, const char *a2, ...)
{
  return _[a1 nbyte];
}

id objc_msgSend_newACEndpointWithEnvironment_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newACEndpointWithEnvironment:error:");
}

id objc_msgSend_newAttachWithParams_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newAttachWithParams:error:");
}

id objc_msgSend_newDIURLWithNSURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newDIURLWithNSURL:");
}

id objc_msgSend_newDIURLWithPluginName_params_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newDIURLWithPluginName:params:");
}

id objc_msgSend_newDawTokenWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newDawTokenWithError:");
}

id objc_msgSend_newEnvWithDictionary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newEnvWithDictionary:error:");
}

id objc_msgSend_newFileBackendWithURL_fileOpenFlags_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newFileBackendWithURL:fileOpenFlags:error:");
}

id objc_msgSend_newIteratorWithOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newIteratorWithOptions:error:");
}

id objc_msgSend_newSessionWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newSessionWithError:");
}

id objc_msgSend_newUnlockBackendXPCValidateArgsWithPassphrase_certificate_isNewImage_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newUnlockBackendXPCValidateArgsWithPassphrase:certificate:isNewImage:error:");
}

id objc_msgSend_newUnlockedBackendXPCWithPassphrase_certificate_isNewImage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newUnlockedBackendXPCWithPassphrase:certificate:isNewImage:error:");
}

id objc_msgSend_newUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newUrl:");
}

id objc_msgSend_newWithCryptoFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newWithCryptoFormat:");
}

id objc_msgSend_newWithPassphrase_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newWithPassphrase:error:");
}

id objc_msgSend_newWithURL_fileOpenFlags_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newWithURL:fileOpenFlags:error:");
}

id objc_msgSend_newWithUnlockedBackendXPC_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newWithUnlockedBackendXPC:error:");
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 newlineCharacterSet];
}

id objc_msgSend_nilWithDIException_description_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nilWithDIException:description:error:");
}

id objc_msgSend_nilWithDIException_prefix_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nilWithDIException:prefix:error:");
}

id objc_msgSend_nilWithEnumValue_description_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nilWithEnumValue:description:error:");
}

id objc_msgSend_nilWithEnumValue_verboseInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nilWithEnumValue:verboseInfo:error:");
}

id objc_msgSend_nilWithOSStatus_verboseInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nilWithOSStatus:verboseInfo:error:");
}

id objc_msgSend_nilWithPOSIXCode_description_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nilWithPOSIXCode:description:error:");
}

id objc_msgSend_nilWithPOSIXCode_verboseInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nilWithPOSIXCode:verboseInfo:error:");
}

id objc_msgSend_nodes(void *a1, const char *a2, ...)
{
  return _[a1 nodes];
}

id objc_msgSend_nonCacheNodes(void *a1, const char *a2, ...)
{
  return _[a1 nonCacheNodes];
}

id objc_msgSend_numBlocks(void *a1, const char *a2, ...)
{
  return _[a1 numBlocks];
}

id objc_msgSend_numBlocksWithSizeStr_blockSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numBlocksWithSizeStr:blockSize:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return _[a1 offset];
}

id objc_msgSend_onDiskCache(void *a1, const char *a2, ...)
{
  return _[a1 onDiskCache];
}

id objc_msgSend_onErrorCleanup(void *a1, const char *a2, ...)
{
  return _[a1 onErrorCleanup];
}

id objc_msgSend_openEncryption(void *a1, const char *a2, ...)
{
  return _[a1 openEncryption];
}

id objc_msgSend_openExistingImageWithFlags_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openExistingImageWithFlags:error:");
}

id objc_msgSend_openWritable_createNonExisting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openWritable:createNonExisting:");
}

id objc_msgSend_outputFormat(void *a1, const char *a2, ...)
{
  return _[a1 outputFormat];
}

id objc_msgSend_outputParams(void *a1, const char *a2, ...)
{
  return _[a1 outputParams];
}

id objc_msgSend_outputURL(void *a1, const char *a2, ...)
{
  return _[a1 outputURL];
}

id objc_msgSend_params(void *a1, const char *a2, ...)
{
  return _[a1 params];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return _[a1 parent];
}

id objc_msgSend_parentUUID(void *a1, const char *a2, ...)
{
  return _[a1 parentUUID];
}

id objc_msgSend_passphrase(void *a1, const char *a2, ...)
{
  return _[a1 passphrase];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return _[a1 password];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pauseInterval(void *a1, const char *a2, ...)
{
  return _[a1 pauseInterval];
}

id objc_msgSend_pipe(void *a1, const char *a2, ...)
{
  return _[a1 pipe];
}

id objc_msgSend_pluginHeader(void *a1, const char *a2, ...)
{
  return _[a1 pluginHeader];
}

id objc_msgSend_pluginName(void *a1, const char *a2, ...)
{
  return _[a1 pluginName];
}

id objc_msgSend_pluginParams(void *a1, const char *a2, ...)
{
  return _[a1 pluginParams];
}

id objc_msgSend_popObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popObjectForKey:");
}

id objc_msgSend_populateNodesDictsWithArray_pstackURL_nodesDict_isTopLevelPstack_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateNodesDictsWithArray:pstackURL:nodesDict:isTopLevelPstack:error:");
}

id objc_msgSend_postRequestWithURL_session_data_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postRequestWithURL:session:data:error:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_prepareImageWithXpcHandler_fileMode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareImageWithXpcHandler:fileMode:error:");
}

id objc_msgSend_prepareParamsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareParamsWithError:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_pstackDB(void *a1, const char *a2, ...)
{
  return _[a1 pstackDB];
}

id objc_msgSend_pstackDict(void *a1, const char *a2, ...)
{
  return _[a1 pstackDict];
}

id objc_msgSend_pstackURL(void *a1, const char *a2, ...)
{
  return _[a1 pstackURL];
}

id objc_msgSend_publicKey(void *a1, const char *a2, ...)
{
  return _[a1 publicKey];
}

id objc_msgSend_ramSizeStr(void *a1, const char *a2, ...)
{
  return _[a1 ramSizeStr];
}

id objc_msgSend_rawBlockSize(void *a1, const char *a2, ...)
{
  return _[a1 rawBlockSize];
}

id objc_msgSend_reOpenIfWritableWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reOpenIfWritableWithError:");
}

id objc_msgSend_readDataToEndOfFileAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDataToEndOfFileAndReturnError:");
}

id objc_msgSend_readDataUpToLength_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDataUpToLength:error:");
}

id objc_msgSend_readPassphraseFlags(void *a1, const char *a2, ...)
{
  return _[a1 readPassphraseFlags];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_regEntryID(void *a1, const char *a2, ...)
{
  return _[a1 regEntryID];
}

id objc_msgSend_registryEntryIDWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registryEntryIDWithError:");
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return _[a1 relativePath];
}

id objc_msgSend_relativeString(void *a1, const char *a2, ...)
{
  return _[a1 relativeString];
}

id objc_msgSend_remainingAttempts(void *a1, const char *a2, ...)
{
  return _[a1 remainingAttempts];
}

id objc_msgSend_remoteObjectInterface(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectInterface];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_remoteProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteProxy];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeRequest:");
}

id objc_msgSend_removeWithNode_recursive_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeWithNode:recursive:error:");
}

id objc_msgSend_replaceWithBackendXPC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceWithBackendXPC:");
}

id objc_msgSend_requestSynchronousDataWithRequest_session_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestSynchronousDataWithRequest:session:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_requests(void *a1, const char *a2, ...)
{
  return _[a1 requests];
}

id objc_msgSend_requestsLock(void *a1, const char *a2, ...)
{
  return _[a1 requestsLock];
}

id objc_msgSend_requestsSem(void *a1, const char *a2, ...)
{
  return _[a1 requestsSem];
}

id objc_msgSend_requiresRootDaemon(void *a1, const char *a2, ...)
{
  return _[a1 requiresRootDaemon];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retrieveStatsWithParams_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveStatsWithParams:reply:");
}

id objc_msgSend_retrieveUserDataWithParams_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveUserDataWithParams:reply:");
}

id objc_msgSend_retrieveWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveWithError:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runMode:beforeDate:");
}

id objc_msgSend_runWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithError:");
}

id objc_msgSend_saveToPlistWithDictionary_URL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveToPlistWithDictionary:URL:error:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_sem(void *a1, const char *a2, ...)
{
  return _[a1 sem];
}

id objc_msgSend_semaphore(void *a1, const char *a2, ...)
{
  return _[a1 semaphore];
}

id objc_msgSend_sendHandleToClient_clientConnection_outError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendHandleToClient:clientConnection:outError:");
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return _[a1 serviceListener];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:");
}

id objc_msgSend_setActiveNode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveNode:");
}

id objc_msgSend_setAllowStoringInKeychain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowStoringInKeychain:");
}

id objc_msgSend_setArguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArguments:");
}

id objc_msgSend_setBSDName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBSDName:");
}

id objc_msgSend_setBackend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackend:");
}

id objc_msgSend_setBackendXPC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackendXPC:");
}

id objc_msgSend_setBlockSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockSize:");
}

id objc_msgSend_setCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCache:");
}

id objc_msgSend_setCacheURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCacheURL:");
}

id objc_msgSend_setCertificate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCertificate:");
}

id objc_msgSend_setClient2IOhandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClient2IOhandler:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setConnectionMode(void *a1, const char *a2, ...)
{
  return _[a1 setConnectionMode];
}

id objc_msgSend_setConversionMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversionMethod:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeserializationError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeserializationError:");
}

id objc_msgSend_setDeviceHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceHandle:");
}

id objc_msgSend_setDiskImageParamsXPC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiskImageParamsXPC:");
}

id objc_msgSend_setEncryptionMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEncryptionMethod:");
}

id objc_msgSend_setExecutableURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExecutableURL:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFileMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFileMode:");
}

id objc_msgSend_setHTTPAdditionalHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPAdditionalHeaders:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMaximumConnectionsPerHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMaximumConnectionsPerHost:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHandleRefCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandleRefCount:");
}

id objc_msgSend_setInputStatFS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputStatFS:");
}

id objc_msgSend_setInputURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputURL:");
}

id objc_msgSend_setInstanceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstanceID:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsNewDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsNewDevice:");
}

id objc_msgSend_setIsPrivileged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPrivileged:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setNumBlocks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumBlocks:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOutputParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputParams:");
}

id objc_msgSend_setParent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParent:");
}

id objc_msgSend_setPassphrase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPassphrase:");
}

id objc_msgSend_setPassphrase_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPassphrase:error:");
}

id objc_msgSend_setPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPassword:");
}

id objc_msgSend_setPauseInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPauseInterval:");
}

id objc_msgSend_setPstackDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPstackDict:");
}

id objc_msgSend_setPublicKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPublicKey:");
}

id objc_msgSend_setReadPassphraseFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReadPassphraseFlags:");
}

id objc_msgSend_setRegEntryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegEntryID:");
}

id objc_msgSend_setRemainingAttempts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemainingAttempts:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemoteProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteProxy:");
}

id objc_msgSend_setSemaphore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSemaphore:");
}

id objc_msgSend_setShadowChain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowChain:");
}

id objc_msgSend_setShouldValidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldValidate:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setSizeWithDiskImage_newSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSizeWithDiskImage:newSize:");
}

id objc_msgSend_setSparseBundleBandSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSparseBundleBandSize:");
}

id objc_msgSend_setStandardOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStandardOutput:");
}

id objc_msgSend_setStartedOver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartedOver:");
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatus:");
}

id objc_msgSend_setTimeoutIntervalForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForRequest:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_setUserDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserDict:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setXpcError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcError:");
}

id objc_msgSend_setupDefaults(void *a1, const char *a2, ...)
{
  return _[a1 setupDefaults];
}

id objc_msgSend_setupDriverWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupDriverWithError:");
}

id objc_msgSend_setupNewConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupNewConnection:");
}

id objc_msgSend_shadowChain(void *a1, const char *a2, ...)
{
  return _[a1 shadowChain];
}

id objc_msgSend_shadowStats(void *a1, const char *a2, ...)
{
  return _[a1 shadowStats];
}

id objc_msgSend_shadowURLs(void *a1, const char *a2, ...)
{
  return _[a1 shadowURLs];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return _[a1 sharedSession];
}

id objc_msgSend_shouldPerformInplaceSquash(void *a1, const char *a2, ...)
{
  return _[a1 shouldPerformInplaceSquash];
}

id objc_msgSend_shouldValidate(void *a1, const char *a2, ...)
{
  return _[a1 shouldValidate];
}

id objc_msgSend_shouldValidateShadows(void *a1, const char *a2, ...)
{
  return _[a1 shouldValidateShadows];
}

id objc_msgSend_signalCommandCompletedWithXpcError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalCommandCompletedWithXpcError:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_sparseBundleBandSize(void *a1, const char *a2, ...)
{
  return _[a1 sparseBundleBandSize];
}

id objc_msgSend_startXPClistener(void *a1, const char *a2, ...)
{
  return _[a1 startXPClistener];
}

id objc_msgSend_statWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statWithError:");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_storeInKeychainWithPassphrase_forceSystemKeychain_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeInKeychainWithPassphrase:forceSystemKeychain:error:");
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return _[a1 stream];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithImageFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithImageFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_supportsPstack(void *a1, const char *a2, ...)
{
  return _[a1 supportsPstack];
}

id objc_msgSend_syncRequests(void *a1, const char *a2, ...)
{
  return _[a1 syncRequests];
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_systemKeychainAccount(void *a1, const char *a2, ...)
{
  return _[a1 systemKeychainAccount];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _[a1 tag];
}

id objc_msgSend_terminationStatus(void *a1, const char *a2, ...)
{
  return _[a1 terminationStatus];
}

id objc_msgSend_toDIShadowNode(void *a1, const char *a2, ...)
{
  return _[a1 toDIShadowNode];
}

id objc_msgSend_toDictionary(void *a1, const char *a2, ...)
{
  return _[a1 toDictionary];
}

id objc_msgSend_topDiskImageNumBlocks(void *a1, const char *a2, ...)
{
  return _[a1 topDiskImageNumBlocks];
}

id objc_msgSend_tryAttachWithParams_clientConnection_outError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryAttachWithParams:clientConnection:outError:");
}

id objc_msgSend_tryCreateAEABackendWithBackendXPC_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryCreateAEABackendWithBackendXPC:error:");
}

id objc_msgSend_tryCreateUsingKeychainCertificateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryCreateUsingKeychainCertificateWithError:");
}

id objc_msgSend_tryCreatingCryptoHeader(void *a1, const char *a2, ...)
{
  return _[a1 tryCreatingCryptoHeader];
}

id objc_msgSend_tryResolvePstackChain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryResolvePstackChain:");
}

id objc_msgSend_tryUnlockUsingKeychainCertificateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryUnlockUsingKeychainCertificateWithError:");
}

id objc_msgSend_tryUnlockUsingSaksWithHasSaksKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryUnlockUsingSaksWithHasSaksKey:error:");
}

id objc_msgSend_ucConnection(void *a1, const char *a2, ...)
{
  return _[a1 ucConnection];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_uniqueDevice(void *a1, const char *a2, ...)
{
  return _[a1 uniqueDevice];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unlockWithXpcHandler_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlockWithXpcHandler:error:");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unwrapEncryptionKeyWithWrappedKey_encapsulatedKey_privateKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unwrapEncryptionKeyWithWrappedKey:encapsulatedKey:privateKey:error:");
}

id objc_msgSend_updateBSDNameWithBlockDevice_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateBSDNameWithBlockDevice:error:");
}

id objc_msgSend_updateDiskImageParamsWithFrontend_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDiskImageParamsWithFrontend:error:");
}

id objc_msgSend_updateFileBackingInfoWithRootDeviceEntryID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFileBackingInfoWithRootDeviceEntryID:error:");
}

id objc_msgSend_updateStatFSWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStatFSWithError:");
}

id objc_msgSend_updateSystemKeychainAttrWithDict_isStoring_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSystemKeychainAttrWithDict:isStoring:error:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _[a1 url];
}

id objc_msgSend_urlRequest(void *a1, const char *a2, ...)
{
  return _[a1 urlRequest];
}

id objc_msgSend_urlSession(void *a1, const char *a2, ...)
{
  return _[a1 urlSession];
}

id objc_msgSend_useFormatMappingInfo(void *a1, const char *a2, ...)
{
  return _[a1 useFormatMappingInfo];
}

id objc_msgSend_userDataParams(void *a1, const char *a2, ...)
{
  return _[a1 userDataParams];
}

id objc_msgSend_userDict(void *a1, const char *a2, ...)
{
  return _[a1 userDict];
}

id objc_msgSend_validateAndPopObjectForKey_className_isOptional_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateAndPopObjectForKey:className:isOptional:error:");
}

id objc_msgSend_validateConnection(void *a1, const char *a2, ...)
{
  return _[a1 validateConnection];
}

id objc_msgSend_validateDeserializationWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateDeserializationWithError:");
}

id objc_msgSend_validateFileWithURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateFileWithURL:error:");
}

id objc_msgSend_validateFormatsWithDiskImage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateFormatsWithDiskImage:error:");
}

id objc_msgSend_validateObjWithKey_className_isOptional_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateObjWithKey:className:isOptional:error:");
}

id objc_msgSend_validateSquashFormats(void *a1, const char *a2, ...)
{
  return _[a1 validateSquashFormats];
}

id objc_msgSend_validateSupportedFormatWithBackendXPC_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateSupportedFormatWithBackendXPC:error:");
}

id objc_msgSend_validateWithDictionary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateWithDictionary:error:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_verifyNodes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyNodes:error:");
}

id objc_msgSend_verifyParams(void *a1, const char *a2, ...)
{
  return _[a1 verifyParams];
}

id objc_msgSend_verifyWithParams_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyWithParams:reply:");
}

id objc_msgSend_waitForQuietWithService_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForQuietWithService:error:");
}

id objc_msgSend_waitUntilExit(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilExit];
}

id objc_msgSend_writeHexKeyToBuffer_hexKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeHexKeyToBuffer:hexKey:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 xpcEndpoint];
}

id objc_msgSend_xpcError(void *a1, const char *a2, ...)
{
  return _[a1 xpcError];
}

id objc_msgSend_xpcListenerEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 xpcListenerEndpoint];
}