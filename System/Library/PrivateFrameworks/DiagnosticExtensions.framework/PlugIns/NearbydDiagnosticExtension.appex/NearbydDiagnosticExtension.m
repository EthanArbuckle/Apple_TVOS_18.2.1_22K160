LABEL_50:
  v22 = v41.__imp_.__cntrl_;
  if (v41.__imp_.__cntrl_)
  {
    v23 = &v41.__imp_.__cntrl_->__shared_owners_;
    do
      v24 = __ldaxr((unint64_t *)v23);
    while (__stlxr(v24 - 1, (unint64_t *)v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

  v25 = v42.__imp_.__cntrl_;
  if (!v42.__imp_.__cntrl_) {
    goto LABEL_59;
  }
  v26 = &v42.__imp_.__cntrl_->__shared_owners_;
  do
    v27 = __ldaxr((unint64_t *)v26);
  while (__stlxr(v27 - 1, (unint64_t *)v26));
  if (v27)
  {
LABEL_59:
    if ((v21 & 1) != 0) {
      goto LABEL_60;
    }
LABEL_81:
    v35 = 0LL;
    goto LABEL_82;
  }

  ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
  std::__shared_weak_count::__release_weak(v25);
  if ((v21 & 1) == 0) {
    goto LABEL_81;
  }
LABEL_60:
  v28 = (const void **)v43;
  v29 = (const void **)__dst;
  if (__dst == v43)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v50;
      if (v51 < 0) {
        v36 = (void **)v50[0];
      }
      LODWORD(buf[0].__pn_.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf[0].__pn_.__r_.__value_.__r.__words + 4) = (std::string::size_type)v36;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "#NearbydDiagnosticExtension::attachmentsForParameters: no nearbyd protobuf logs found in %s",  (uint8_t *)buf,  0xCu);
    }

    goto LABEL_81;
  }

  for (i = (const void **)(v43 + 24); i != v29; i += 3)
  {
  }

  sub_10000455C((const void **)v50, v28, (uint64_t)buf);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v31 = buf;
    if ((buf[0].__pn_.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      v31 = (std::__fs::filesystem::path *)buf[0].__pn_.__r_.__value_.__r.__words[0];
    }
    LODWORD(__p.__pn_.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)__p.__pn_.__r_.__value_.__r.__words + 4) = (std::string::size_type)v31;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "#NearbydDiagnosticExtension::attachmentsForParameters: attaching %s",  (uint8_t *)&__p,  0xCu);
  }

  if ((buf[0].__pn_.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v32 = buf;
  }
  else {
    v32 = (std::__fs::filesystem::path *)buf[0].__pn_.__r_.__value_.__r.__words[0];
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v32, 0LL));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](&OBJC_CLASS___DEAttachmentItem, "attachmentWithPath:", v33));
  v52 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v52, 1LL));

LABEL_82:
  buf[0].__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)&v43;
  sub_10000C9EC((void ***)buf);
  v37 = v47;
  if (v47)
  {
    v38 = (unint64_t *)&v47->__shared_owners_;
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }

  std::locale::~locale(&v46);
  if (v49 < 0) {
    operator delete(v48[0]);
  }
  if (v51 < 0) {
    operator delete(v50[0]);
  }

  return v35;
}

      sub_100006CB4();
    }

    goto LABEL_22;
  }

  v6 = (unint64_t *)(a1 + 40);
  v5 = *(_BYTE **)(a1 + 48);
  v13 = *(void *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26) {
          v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          v28 = v26;
        }
        if (v28) {
          v12 = operator new(v28);
        }
        else {
          v12 = 0LL;
        }
        v20 = &v25[(void)v12];
        v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }

          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }

        goto LABEL_46;
      }

      goto LABEL_50;
    }

      sub_100006CB4();
    }

    goto LABEL_22;
  }

  v6 = (unint64_t *)(a1 + 64);
  v5 = *(_BYTE **)(a1 + 72);
  v13 = *(void *)(a1 + 80);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26) {
          v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          v28 = v26;
        }
        if (v28) {
          v12 = operator new(v28);
        }
        else {
          v12 = 0LL;
        }
        v20 = &v25[(void)v12];
        v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }

          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }

        goto LABEL_46;
      }

      goto LABEL_50;
    }

void sub_1000042E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, std::locale a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, void *a26, uint64_t a27, int a28, __int16 a29, char a30, char a31, void *a32, uint64_t a33, int a34, __int16 a35, char a36, char a37, uint64_t a38, void *a39, uint64_t a40, int a41, __int16 a42, char a43, char a44, uint64_t a45, char *__p, uint64_t a47, int a48, __int16 a49, char a50,char a51)
{
  if (a51 < 0) {
    operator delete(__p);
  }
  __p = &a15;
  sub_10000C9EC((void ***)&__p);
  sub_100004850((uint64_t)&a23);
  std::locale::~locale(&a18);
  if (a31 < 0) {
    operator delete(a26);
  }
  if (a37 < 0) {
    operator delete(a32);
  }

  _Unwind_Resume(a1);
}

void *sub_10000440C()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1000203F0);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1000203F0))
  {
    sub_100015EF0(&unk_100020100);
    __cxa_atexit((void (*)(void *))sub_100004624, &unk_100020100, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_1000203F0);
  }

  return &unk_100020100;
}

void sub_100004484(_Unwind_Exception *a1)
{
}

double sub_10000449C@<D0>(const std::__fs::filesystem::path *a1@<X0>, uint64_t a2@<X8>)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__filename(a1);
  if (v3.__size >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_1000048A8();
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

uint64_t sub_10000455C@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  else {
    size_t v5 = (size_t)a1[1];
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  uint64_t result = sub_10000F2C8(a3, v6 + v5);
  else {
    v8 = *(char **)result;
  }
  if (v5)
  {
    else {
      unint64_t v9 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v8, v9, v5);
  }

  v10 = &v8[v5];
  if (v6)
  {
    else {
      v11 = *a2;
    }
    uint64_t result = (uint64_t)memmove(v10, v11, v6);
  }

  v10[v6] = 0;
  return result;
}

uint64_t sub_100004624(uint64_t a1)
{
  v2 = (void *)(a1 + 712);
  std::__fs::filesystem::path::__string_view v3 = *(void **)(a1 + 736);
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    std::__fs::filesystem::path::__string_view v3 = v2;
    goto LABEL_5;
  }

  if (v3)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }

  std::mutex::~mutex((std::mutex *)(a1 + 648));
  std::mutex::~mutex((std::mutex *)(a1 + 584));
  sub_10000468C(a1 + 216);
  return sub_1000047C8(a1);
}

uint64_t sub_10000468C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 352))
  {
    v7 = (void **)(a1 + 328);
    sub_10000473C(&v7);
    if (*(_BYTE *)(a1 + 312))
    {
      v2 = *(void **)(a1 + 288);
      if (v2)
      {
        *(void *)(a1 + 296) = v2;
        operator delete(v2);
      }
    }

    if (*(_BYTE *)(a1 + 248))
    {
      std::__fs::filesystem::path::__string_view v3 = *(void **)(a1 + 224);
      if (v3)
      {
        *(void *)(a1 + 232) = v3;
        operator delete(v3);
      }
    }

    if (*(_BYTE *)(a1 + 184))
    {
      uint64_t v4 = *(void **)(a1 + 160);
      if (v4)
      {
        *(void *)(a1 + 168) = v4;
        operator delete(v4);
      }
    }

    if (*(_BYTE *)(a1 + 120))
    {
      size_t v5 = *(void **)(a1 + 96);
      if (v5)
      {
        *(void *)(a1 + 104) = v5;
        operator delete(v5);
      }
    }
  }

  return a1;
}

void sub_10000472C(void *a1)
{
}

void sub_10000473C(void ***a1)
{
  v2 = *a1;
  if (*v2)
  {
    sub_10000477C((uint64_t *)v2);
    operator delete(**a1);
  }
}

void sub_10000477C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 40LL)
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

uint64_t sub_1000047C8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 112))
  {
    sub_100004808(a1 + 32);
  }

  return a1;
}

uint64_t sub_100004808(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
  {
  }

  return a1;
}

uint64_t sub_100004850(uint64_t a1)
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

void sub_1000048A8()
{
}

void sub_1000048BC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000490C(exception, a1);
}

void sub_1000048F8(_Unwind_Exception *a1)
{
}

std::logic_error *sub_10000490C(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100004930()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_100004958(_BYTE *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_1000048A8();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    *size_t v5 = v8;
    size_t v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

BOOL sub_1000049E4(uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    v8 = a3;
  }
  else {
    v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

void *sub_100004A4C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_1000048A8();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

std::locale *sub_100004AFC(std::locale *a1, uint64_t a2, int a3)
{
  uint64_t v6 = sub_100004B94(a1);
  LODWORD(v6[3].__locale_) = a3;
  *(_OWORD *)((char *)&v6[3].__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v6[5].__locale_ + 4) = 0u;
  HIDWORD(v6[7].__locale_) = 0;
  uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  if ((v7 & 0x80u) == 0LL) {
    uint64_t v8 = (char *)a2;
  }
  else {
    uint64_t v8 = *(char **)a2;
  }
  if ((v7 & 0x80u) != 0LL) {
    uint64_t v7 = *(void *)(a2 + 8);
  }
  return a1;
}

void sub_100004B78(_Unwind_Exception *a1)
{
}

std::locale *sub_100004B94(std::locale *a1)
{
  uint64_t v2 = std::locale::locale(a1);
  a1[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v2, &std::ctype<char>::id);
  a1[2].__locale_ = (std::locale::__imp *)std::locale::use_facet(a1, &std::collate<char>::id);
  return a1;
}

void sub_100004BDC(_Unwind_Exception *a1)
{
}

char *sub_100004BF0(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = operator new(8uLL);
  *uint64_t v6 = &off_10001C480;
  uint64_t v7 = operator new(0x10uLL);
  *uint64_t v7 = &off_10001C550;
  v7[1] = v6;
  sub_100004D8C((void *)(a1 + 40), (uint64_t)v7);
  *(void *)(a1 + 56) = *(void *)(a1 + 40);
  unsigned int v8 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v8 > 0x3F)
  {
    switch(v8)
    {
      case 0x40u:
        return sub_100005028(a1, a2, a3);
      case 0x80u:
        return (char *)sub_1000050C8(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
      case 0x100u:
        return sub_1000051F8(a1, a2, a3);
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
        sub_100005328();
      return sub_100005028(a1, a2, a3);
    }

    return sub_100004EFC(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
  }

  else
  {
    return sub_100004DFC(a1, (unsigned __int8 *)a2, a3);
  }

void sub_100004D24(_Unwind_Exception *a1)
{
}

void sub_100004D40()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_parse);
}

void sub_100004D78(_Unwind_Exception *a1)
{
}

void sub_100004D8C(void *a1, uint64_t a2)
{
  int v3 = (std::__shared_weak_count *)a1[1];
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

char *sub_100004DFC(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  __int128 v7 = sub_1000055D8(a1, a2, a3);
  if (v7 == a2)
  {
    unsigned int v8 = operator new(0x10uLL);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(v9 + 8);
    void *v8 = &off_10001C550;
    v8[1] = v10;
    *(void *)(v9 + 8) = v8;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  while (*v7 == 124)
  {
    uint64_t v11 = *(void *)(a1 + 56);
    v12 = v7 + 1;
    __int128 v7 = sub_1000055D8(a1, v7 + 1, a3);
    if (v12 == v7)
    {
      v13 = operator new(0x10uLL);
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v15 = *(void *)(v14 + 8);
      void *v13 = &off_10001C550;
      v13[1] = v15;
      *(void *)(v14 + 8) = v13;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    }

    sub_100005620(a1, v6, v11);
  }

  return (char *)v7;
}

char *sub_100004EFC(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v3 = a2;
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
    *uint64_t v6 = &off_10001C5F8;
    v6[1] = v9;
    *((_BYTE *)v6 + 16) = v7;
    *(void *)(v8 + 8) = v6;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    ++v3;
  }

  if (v3 != (unsigned __int8 *)v4)
  {
    do
    {
      uint64_t v10 = v3;
      int v3 = sub_10000C020(a1, (uint64_t)v3, v4);
    }

    while (v10 != v3);
    if (v10 != v4)
    {
      if (v10 + 1 != v4 || *v10 != 36) {
        sub_10000BFD4();
      }
      uint64_t v11 = operator new(0x18uLL);
      BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(v13 + 8);
      void *v11 = &off_10001C640;
      v11[1] = v14;
      *((_BYTE *)v11 + 16) = v12;
      *(void *)(v13 + 8) = v11;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    }
  }

  return v4;
}

char *sub_100005028(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = sub_10000C5FC(a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2) {
LABEL_9:
  }
    sub_10000BFD4();
  uint64_t v8 = v7;
  while (v8 != (unsigned __int8 *)a3)
  {
    if (*v8 != 124) {
      return (char *)v8;
    }
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = sub_10000C5FC(a1, (char *)v8 + 1, a3);
    if (v8 + 1 == v10) {
      goto LABEL_9;
    }
    uint64_t v8 = v10;
    sub_100005620(a1, v6, v9);
  }

  return a3;
}

unsigned __int8 *sub_1000050C8(uint64_t a1, unsigned __int8 *__s, unsigned __int8 *a3)
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
    *uint64_t v9 = &off_10001C550;
    v9[1] = v10;
    *(void *)(v6 + 8) = v9;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  else
  {
    sub_100004EFC(a1, __s, v8);
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
      *uint64_t v14 = &off_10001C550;
      v14[1] = v15;
      *(void *)(v13 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    }

    else
    {
      sub_100004EFC(a1, v8, v12);
    }

    sub_100005620(a1, v6, v13);
    if (v12 == a3) {
      uint64_t v8 = v12;
    }
    else {
      uint64_t v8 = v12 + 1;
    }
  }

  return a3;
}

char *sub_1000051F8(uint64_t a1, char *__s, char *a3)
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
    *uint64_t v9 = &off_10001C550;
    v9[1] = v10;
    *(void *)(v6 + 8) = v9;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  else
  {
    sub_100005028(a1, __s, v8);
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
      *uint64_t v14 = &off_10001C550;
      v14[1] = v15;
      *(void *)(v13 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    }

    else
    {
      sub_100005028(a1, v8, v12);
    }

    sub_100005620(a1, v6, v13);
    if (v12 == a3) {
      uint64_t v8 = v12;
    }
    else {
      uint64_t v8 = v12 + 1;
    }
  }

  return a3;
}

void sub_100005328()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_grammar);
}

void sub_100005360(_Unwind_Exception *a1)
{
}

void sub_10000537C(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void *sub_100005390(void *a1, uint64_t a2)
{
  *a1 = a2;
  __int128 v4 = operator new(0x20uLL);
  *__int128 v4 = &off_10001C4D8;
  v4[1] = 0LL;
  v4[2] = 0LL;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_1000053D8(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000053FC(std::__shared_weak_count *a1)
{
}

uint64_t sub_100005410(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

uint64_t sub_100005428(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }

  else
  {
    return 0LL;
  }

BOOL sub_100005468(uint64_t a1, uint64_t a2)
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

void *sub_1000054B4(void *a1)
{
  *a1 = &off_10001C5C8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_1000054F8(void *__p)
{
  *__p = &off_10001C5C8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_10000553C(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_100005550(void *a1)
{
  *a1 = &off_10001C5C8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_100005594(void *__p)
{
  *__p = &off_10001C5C8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

unsigned __int8 *sub_1000055D8(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  do
  {
    size_t v5 = a2;
    a2 = sub_1000056D0(a1, (char *)a2, a3);
  }

  while (v5 != a2);
  return v5;
}

void *sub_100005620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = operator new(0x18uLL);
  uint64_t v7 = *(void *)(a3 + 8);
  v6[1] = *(void *)(a2 + 8);
  v6[2] = v7;
  *uint64_t v6 = &off_10001CAC0;
  *(void *)(a2 + 8) = v6;
  *(void *)(a3 + 8) = 0LL;
  uint64_t v8 = operator new(0x10uLL);
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
  void *v8 = &off_10001C550;
  v8[1] = v9;
  *(void *)(a3 + 8) = v8;
  *(void *)(*(void *)(a1 + 56) + 8LL) = 0LL;
  uint64_t result = operator new(0x10uLL);
  uint64_t v11 = *(void *)(a3 + 8);
  *uint64_t result = &off_10001CB08;
  result[1] = v11;
  *(void *)(*(void *)(a1 + 56) + 8LL) = result;
  *(void *)(a1 + 56) = *(void *)(a3 + 8);
  return result;
}

unsigned __int8 *sub_1000056D0(uint64_t a1, char *a2, char *a3)
{
  uint64_t result = (unsigned __int8 *)sub_100005764(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    int v8 = *(_DWORD *)(a1 + 28);
    uint64_t v9 = sub_1000059F4(a1, (unsigned __int8 *)a2, a3);
    uint64_t result = (unsigned __int8 *)a2;
  }

  return result;
}

char *sub_100005764(uint64_t a1, char *a2, char *a3)
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
      if (v6 == 40 && a2 + 1 != a3 && a2[1] == 63 && a2 + 2 != a3)
      {
        int v7 = a2[2];
        if (v7 == 33)
        {
          sub_100004B94(v19);
          __int128 v20 = 0u;
          uint64_t v22 = 0LL;
          __int128 v21 = 0u;
          LODWORD(v20) = *(_DWORD *)(a1 + 24);
          int v8 = (char *)sub_100004BF0(v19, v3 + 3, a3);
          int v18 = DWORD1(v20);
          sub_100005F48(a1, (uint64_t)v19, 1, *(_DWORD *)(a1 + 28));
          *(_DWORD *)(a1 + 28) += v18;
          if (v8 == a3 || *v8 != 41) {
            sub_100005FCC();
          }
          goto LABEL_27;
        }

        if (v7 == 61)
        {
          sub_100004B94(v19);
          __int128 v20 = 0u;
          uint64_t v22 = 0LL;
          __int128 v21 = 0u;
          LODWORD(v20) = *(_DWORD *)(a1 + 24);
          int v8 = (char *)sub_100004BF0(v19, v3 + 3, a3);
          int v9 = DWORD1(v20);
          sub_100005F48(a1, (uint64_t)v19, 0, *(_DWORD *)(a1 + 28));
          *(_DWORD *)(a1 + 28) += v9;
          if (v8 == a3 || *v8 != 41) {
            sub_100005FCC();
          }
LABEL_27:
          uint64_t v3 = v8 + 1;
          sub_100004850((uint64_t)&v21);
          std::locale::~locale(v19);
          return v3;
        }
      }

      return v3;
    }

    uint64_t v10 = operator new(0x18uLL);
    BOOL v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(v12 + 8);
LABEL_17:
    void *v10 = v14 + 2;
    v10[1] = v13;
    *((_BYTE *)v10 + 16) = v11;
    *(void *)(v12 + 8) = v10;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    return ++v3;
  }

  if (v6 != 92)
  {
    if (v6 != 94) {
      return v3;
    }
    uint64_t v10 = operator new(0x18uLL);
    BOOL v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(v12 + 8);
    goto LABEL_17;
  }

  if (a2 + 1 != a3)
  {
    int v16 = a2[1];
    if (v16 == 66)
    {
      char v17 = 1;
    }

    else
    {
      if (v16 != 98) {
        return v3;
      }
      char v17 = 0;
    }

    sub_100005ED4(a1, v17);
    v3 += 2;
  }

  return v3;
}

void sub_1000059C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

unsigned __int8 *sub_1000059F4(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 != (unsigned __int8 *)a3)
  {
    int v6 = (char)*a2;
    if (v6 <= 62)
    {
      if (v6 == 40)
      {
        BOOL v11 = a2 + 1;
        if (a2 + 1 != (unsigned __int8 *)a3)
        {
          if (a2 + 2 != (unsigned __int8 *)a3 && *v11 == 63 && a2[2] == 58)
          {
            ++*(_DWORD *)(a1 + 36);
            uint64_t v12 = (char *)sub_100004DFC(a1, a2 + 3, a3);
            if (v12 != a3 && *v12 == 41)
            {
              --*(_DWORD *)(a1 + 36);
              return (unsigned __int8 *)(v12 + 1);
            }
          }

          else
          {
            sub_100007884((void *)a1);
            int v13 = *(_DWORD *)(a1 + 28);
            ++*(_DWORD *)(a1 + 36);
            uint64_t v14 = (char *)sub_100004DFC(a1, v11, a3);
            if (v14 != a3)
            {
              uint64_t v15 = v14;
              if (*v14 == 41)
              {
                sub_1000078E8((void *)a1, v13);
                --*(_DWORD *)(a1 + 36);
                return (unsigned __int8 *)(v15 + 1);
              }
            }
          }
        }

        sub_100005FCC();
      }

      if (v6 == 46)
      {
        int v7 = operator new(0x10uLL);
        uint64_t v8 = *(void *)(a1 + 56);
        uint64_t v9 = *(void *)(v8 + 8);
        *int v7 = &off_10001C718;
        v7[1] = v9;
        *(void *)(v8 + 8) = v7;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
        return ++v3;
      }

LABEL_28:
      sub_100007944();
    }

    if (v6 > 91)
    {
      if (v6 == 92) {
        return sub_1000076D4(a1, a2, (unsigned __int8 *)a3);
      }
      if (v6 == 123) {
        goto LABEL_28;
      }
    }

    else
    {
      if (v6 == 91) {
        return (unsigned __int8 *)sub_100007774(a1, (char *)a2, a3);
      }
      if (v6 == 63) {
        goto LABEL_28;
      }
    }

    return sub_100007990(a1, a2, a3);
  }

  return v3;
}

unsigned __int8 *sub_100005BCC( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
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

    int v13 = a2;
    if (v12 != 123) {
      return v13;
    }
    uint64_t v15 = a2 + 1;
    int v16 = sub_10000BA48(a1, a2 + 1, a3, &v28);
    if (v15 != v16)
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
              sub_10000B914(a1, v14, v18, v21, a5, a6, v22);
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

        v23 = v16 + 1;
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
        v25 = sub_10000BA48(v10, v23, a3, &v27);
        if (v23 != v25 && v25 != a3 && *v25 == 125)
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

      sub_10000BB30();
    }

LABEL_58:
    sub_10000BAE4();
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

  int v13 = a2;
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

  return v13;
}

__n128 sub_100005ED4(uint64_t a1, char a2)
{
  __int128 v4 = (char *)operator new(0x30uLL);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8LL);
  *(void *)__int128 v4 = off_10001C688;
  *((void *)v4 + 1) = v5;
  std::locale::locale((std::locale *)v4 + 2, (const std::locale *)a1);
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v4 + 24) = result;
  v4[40] = a2;
  *(void *)(*(void *)(a1 + 56) + 8LL) = v4;
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return result;
}

uint64_t sub_100005F48(uint64_t a1, uint64_t a2, char a3, int a4)
{
  uint64_t v8 = operator new(0x58uLL);
  uint64_t result = sub_10000639C((uint64_t)v8, a2, a3, *(void *)(*(void *)(a1 + 56) + 8LL), a4);
  *(void *)(*(void *)(a1 + 56) + 8LL) = v8;
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return result;
}

void sub_100005FB8(_Unwind_Exception *a1)
{
}

void sub_100005FCC()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_paren);
}

void sub_100006004(_Unwind_Exception *a1)
{
}

void *sub_100006018(void *a1)
{
  *a1 = &off_10001C5C8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_10000605C(void *__p)
{
  *__p = &off_10001C5C8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_1000060A0(uint64_t result, uint64_t a2)
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
  *(void *)(a2 + 80) = v4;
  return result;
}

void *sub_100006100(void *a1)
{
  *a1 = &off_10001C5C8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_100006144(void *__p)
{
  *__p = &off_10001C5C8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_100006188(uint64_t result, uint64_t a2)
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

  *(void *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_1000061D8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C688;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_10001C5C8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_100006230(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C688;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_10001C5C8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_100006288(uint64_t result, uint64_t a2)
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

LABEL_17:
    int v10 = 0;
    goto LABEL_25;
  }

  if (v4 == v2)
  {
    int v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        uint64_t v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16LL) + 4 * v6) & 0x500) != 0)
        {
          int v10 = 1;
          goto LABEL_25;
        }

        goto LABEL_17;
      }

      goto LABEL_17;
    }
  }

  uint64_t v7 = *(v4 - 1);
  uint64_t v8 = *v4;
  int v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16LL) + 4 * v7) & 0x500) != 0;
  int v11 = (_DWORD)v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16LL) + 4 * v8) & 0x500) != 0;
  int v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    uint64_t v12 = 0LL;
    int v13 = -993;
  }

  else
  {
    uint64_t v12 = *(void *)(result + 8);
    int v13 = -994;
  }

  *(_DWORD *)a2 = v13;
  *(void *)(a2 + 80) = v12;
  return result;
}

uint64_t sub_10000639C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  *(void *)a1 = off_10001C6D0;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 24);
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
  *(_DWORD *)(a1 + 80) = a5;
  *(_BYTE *)(a1 + 84) = a3;
  return a1;
}

std::locale *sub_100006428(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C6D0;
  uint64_t v2 = a1 + 2;
  sub_100004850((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&off_10001C5C8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_100006490(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C6D0;
  uint64_t v2 = a1 + 2;
  sub_100004850((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&off_10001C5C8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

void sub_1000064F8(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  char v25 = 0;
  __int128 v26 = 0uLL;
  char v27 = 0;
  char v28 = 0;
  uint64_t v29 = 0LL;
  __p = 0LL;
  BOOL v19 = 0LL;
  unint64_t v4 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v20 = 0LL;
  *(void *)&__int128 v21 = v5;
  *((void *)&v21 + 1) = v5;
  char v22 = 0;
  sub_100006AF0((char **)&__p, v4, &v21);
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
  if (*(unsigned __int8 *)(a1 + 84) == sub_1000066F0( a1 + 16,  v7,  *(void *)(a2 + 24),  (uint64_t *)&__p,  *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u,  v9))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0LL;
    int v10 = (char *)__p;
    goto LABEL_13;
  }

  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(a1 + 8);
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
    int v16 = &v10[24 * v15];
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

void sub_100006660( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100006680(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(a1 + 24) = a4;
  BOOL v8 = (_OWORD *)(a1 + 24);
  *(void *)(a1 + 32) = a4;
  *(_BYTE *)(a1 + 40) = 0;
  uint64_t result = sub_100006AF0((char **)a1, a2, (__int128 *)(a1 + 24));
  *(void *)(a1 + 48) = a3;
  *(void *)(a1 + 56) = a3;
  *(_BYTE *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 72) = *v8;
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a1 + 40);
  if ((a5 & 1) == 0) {
    *(void *)(a1 + 104) = a3;
  }
  *(_BYTE *)(a1 + 96) = 1;
  return result;
}

uint64_t sub_1000066F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  v42 = 0LL;
  v43 = 0LL;
  unint64_t v44 = 0LL;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(void *)&__int128 v40 = a3;
    *((void *)&v40 + 1) = a3;
    char v41 = 0;
    *(_DWORD *)v37 = 0;
    memset(&v37[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v39, 0, 21);
    v43 = (_OWORD *)sub_100006E50((uint64_t *)&v42, (uint64_t)v37);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    if (*(void *)&v37[32])
    {
      *(void *)&v37[40] = *(void *)&v37[32];
      operator delete(*(void **)&v37[32]);
    }

    v34 = a4;
    unint64_t v11 = v43;
    *((_DWORD *)v43 - 24) = 0;
    *((void *)v11 - 11) = a2;
    *((void *)v11 - 10) = a2;
    *((void *)v11 - 9) = a3;
    sub_100006D4C((uint64_t)(v11 - 4), *(unsigned int *)(a1 + 28), &v40);
    sub_100006D88((uint64_t)v43 - 40, *(unsigned int *)(a1 + 32));
    int v12 = v43;
    *((void *)v43 - 2) = v6;
    *((_DWORD *)v12 - 2) = a5;
    *((_BYTE *)v12 - 4) = a6;
    unsigned int v13 = 1;
    while (2)
    {
      unint64_t v15 = v12 - 1;
      uint64_t v14 = *((void *)v12 - 2);
      int v16 = v12 - 6;
      if (v14) {
        (*(void (**)(uint64_t, _OWORD *))(*(void *)v14 + 16LL))(v14, v12 - 6);
      }
      switch(*(_DWORD *)v16)
      {
        case 0xFFFFFC18:
          uint64_t v17 = *((void *)v12 - 10);
          if ((a5 & 0x20) != 0 && v17 == a2 || (a5 & 0x1000) != 0 && v17 != a3) {
            goto LABEL_16;
          }
          uint64_t v25 = *v34;
          *(void *)uint64_t v25 = a2;
          *(void *)(v25 + 8) = v17;
          *(_BYTE *)(v25 + 16) = 1;
          uint64_t v26 = *((void *)v12 - 8);
          uint64_t v27 = *((void *)v12 - 7) - v26;
          if (v27)
          {
            unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * (v27 >> 3);
            uint64_t v29 = (_BYTE *)(v26 + 16);
            unsigned int v30 = 1;
            do
            {
              uint64_t v31 = v25 + 24LL * v30;
              *(_OWORD *)uint64_t v31 = *((_OWORD *)v29 - 1);
              char v32 = *v29;
              v29 += 24;
              *(_BYTE *)(v31 + 16) = v32;
            }

            while (v28 > v30++);
          }

          uint64_t v6 = 1LL;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          uint64_t v18 = v43 - 6;
          sub_1000071B8((uint64_t)&v44, (void *)v43 - 12);
          v43 = v18;
          goto LABEL_23;
        case 0xFFFFFC20:
          __int128 v19 = *(v12 - 5);
          *(_OWORD *)v37 = *v16;
          *(_OWORD *)&v37[16] = v19;
          memset(&v37[32], 0, 24);
          sub_100007524( &v37[32],  *((__int128 **)v12 - 8),  *((__int128 **)v12 - 7),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v12 - 7) - *((void *)v12 - 8)) >> 3));
          __p[0] = 0LL;
          __p[1] = 0LL;
          v39[0] = 0LL;
          sub_1000075A0( (char *)__p,  *((__int128 **)v12 - 5),  *((__int128 **)v12 - 4),  (uint64_t)(*((void *)v12 - 4) - *((void *)v12 - 5)) >> 4);
          uint64_t v20 = *v15;
          *(void *)((char *)&v39[1] + 5) = *(void *)((char *)v12 - 11);
          v39[1] = v20;
          (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v15 + 24LL))(*v15, 1LL, v12 - 6);
          (*(void (**)(void, void, _BYTE *))(*(void *)v39[1] + 24LL))(v39[1], 0LL, v37);
          __int128 v21 = v43;
          if ((unint64_t)v43 >= v44)
          {
            v43 = (_OWORD *)sub_100006E50((uint64_t *)&v42, (uint64_t)v37);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }

          else
          {
            __int128 v22 = *(_OWORD *)&v37[16];
            _OWORD *v43 = *(_OWORD *)v37;
            v21[1] = v22;
            *((void *)v21 + 4) = 0LL;
            *((void *)v21 + 5) = 0LL;
            *((void *)v21 + 6) = 0LL;
            *((void *)v21 + 7) = 0LL;
            v21[2] = *(_OWORD *)&v37[32];
            *((void *)v21 + 6) = *(void *)&v37[48];
            memset(&v37[32], 0, 24);
            *((void *)v21 + 8) = 0LL;
            *((void *)v21 + 9) = 0LL;
            *(_OWORD *)((char *)v21 + 56) = *(_OWORD *)__p;
            *((void *)v21 + 9) = v39[0];
            __p[0] = 0LL;
            __p[1] = 0LL;
            v39[0] = 0LL;
            uint64_t v23 = v39[1];
            *(void *)((char *)v21 + 85) = *(void *)((char *)&v39[1] + 5);
            *((void *)v21 + 10) = v23;
            v43 = v21 + 6;
          }

          if (*(void *)&v37[32])
          {
            *(void *)&v37[40] = *(void *)&v37[32];
            operator delete(*(void **)&v37[32]);
          }

LABEL_23:
          int v12 = v43;
          ++v13;
          if (v42 != v43) {
            continue;
          }
          uint64_t v6 = 0LL;
          break;
        default:
          sub_100006E04();
      }

      break;
    }
  }

  *(void *)v37 = &v42;
  sub_100007650((void ***)v37);
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

      sub_100010E98();
    }

void sub_100006A98( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  a13 = v18 - 112;
  sub_100007650((void ***)&a13);
  _Unwind_Resume(a1);
}

char *sub_100006AF0(char **a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6 = (uint64_t)a1[2];
  uint64_t result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (uint64_t)result) >> 3) >= a2)
  {
    unint64_t v15 = a1[1];
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
      __int128 v19 = &v15[24 * (a2 - v16)];
      uint64_t v20 = 24 * a2 - 24 * v16;
      do
      {
        __int128 v21 = *a3;
        *((void *)v15 + 2) = *((void *)a3 + 2);
        *(_OWORD *)unint64_t v15 = v21;
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
      sub_100006CB4();
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
    uint64_t result = sub_100006C64(a1, v10);
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

char *sub_100006C64(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100006CB4();
  }
  uint64_t result = (char *)sub_100006CC8((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void sub_100006CB4()
{
}

void *sub_100006CC8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100004930();
  }
  return operator new(24 * a2);
}

void *sub_100006D0C(void *a1)
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

void sub_100006D4C(uint64_t a1, unint64_t a2, __int128 *a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v4 = a2 >= v3;
  unint64_t v5 = a2 - v3;
  if (v5 != 0 && v4)
  {
    sub_100007270((void **)a1, v5, a3);
  }

  else if (!v4)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }

void sub_100006D88(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 16 * a2;
    }
  }

  else
  {
    sub_1000073E4((void **)a1, a2 - v2);
  }

void sub_100006DB8()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_complexity);
}

void sub_100006DF0(_Unwind_Exception *a1)
{
}

void sub_100006E04()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_unknown);
}

void sub_100006E3C(_Unwind_Exception *a1)
{
}

uint64_t sub_100006E50(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL) {
    sub_100006CB4();
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
    unint64_t v10 = (char *)sub_100007010(v7, v9);
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
  *(void *)(a2 + 40) = 0LL;
  *(void *)(a2 + 48) = 0LL;
  *((void *)v11 + 7) = 0LL;
  *((void *)v11 + 8) = 0LL;
  *((void *)v11 + 9) = 0LL;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v11 + 9) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0LL;
  *(void *)(a2 + 64) = 0LL;
  *(void *)(a2 + 72) = 0LL;
  uint64_t v13 = *(void *)(a2 + 80);
  *(void *)(v11 + 85) = *(void *)(a2 + 85);
  *((void *)v11 + 10) = v13;
  v16[2] = v11 + 96;
  sub_100006F9C(a1, v16);
  uint64_t v14 = a1[1];
  sub_1000071FC(v16);
  return v14;
}

void sub_100006F88(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_100006F9C(uint64_t *a1, void *a2)
{
  uint64_t result = sub_100007054((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_100007010(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL) {
    sub_100004930();
  }
  return operator new(96 * a2);
}

uint64_t sub_100007054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v15 = a6;
  *((void *)&v15 + 1) = a7;
  __int128 v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }

  else
  {
    do
    {
      __int128 v8 = *(_OWORD *)(a3 - 80);
      *(_OWORD *)(v7 - 96) = *(_OWORD *)(a3 - 96);
      *(_OWORD *)(v7 - 80) = v8;
      *(void *)(v7 - 56) = 0LL;
      *(void *)(v7 - 48) = 0LL;
      *(void *)(v7 - 64) = 0LL;
      *(_OWORD *)(v7 - 64) = *(_OWORD *)(a3 - 64);
      *(void *)(v7 - 48) = *(void *)(a3 - 48);
      *(void *)(a3 - 64) = 0LL;
      *(void *)(a3 - 56) = 0LL;
      *(void *)(a3 - 48) = 0LL;
      *(void *)(v7 - 40) = 0LL;
      *(void *)(v7 - 32) = 0LL;
      *(void *)(v7 - 24) = 0LL;
      *(_OWORD *)(v7 - 40) = *(_OWORD *)(a3 - 40);
      *(void *)(v7 - 24) = *(void *)(a3 - 24);
      *(void *)(a3 - 40) = 0LL;
      *(void *)(a3 - 32) = 0LL;
      *(void *)(a3 - 24) = 0LL;
      uint64_t v9 = *(void *)(a3 - 16);
      *(void *)(v7 - 11) = *(void *)(a3 - 11);
      *(void *)(v7 - 16) = v9;
      uint64_t v7 = *((void *)&v15 + 1) - 96LL;
      *((void *)&v15 + 1) -= 96LL;
      a3 -= 96LL;
    }

    while (a3 != a5);
    uint64_t v10 = v15;
  }

  char v13 = 1;
  sub_100007134((uint64_t)v12);
  return v10;
}

uint64_t sub_100007134(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_100007168((uint64_t *)a1);
  }
  return a1;
}

void sub_100007168(uint64_t *a1)
{
  uint64_t v1 = *(void **)(a1[2] + 8);
  unint64_t v2 = *(void **)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_1000071B8(v3, v1);
      v1 += 12;
    }

    while (v1 != v2);
  }

void sub_1000071B8(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)a2[7];
  if (v3)
  {
    a2[8] = v3;
    operator delete(v3);
  }

  unint64_t v4 = (void *)a2[4];
  if (v4)
  {
    a2[5] = v4;
    operator delete(v4);
  }

void **sub_1000071FC(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_10000722C(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 96;
    sub_1000071B8(v4, (void *)(i - 96));
  }

void sub_100007270(void **a1, unint64_t a2, __int128 *a3)
{
  __int128 v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  uint64_t v9 = *(void **)(v6 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (_BYTE *)v9) >> 3) >= a2)
  {
    if (a2)
    {
      __int128 v15 = &v9[3 * a2];
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
      sub_100006CB4();
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
      __int128 v14 = (char *)sub_100006CC8(v6, v13);
    }
    else {
      __int128 v14 = 0LL;
    }
    uint64_t v18 = &v14[24 * v10];
    __int128 v19 = &v18[24 * a2];
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
    uint64_t v24 = (char *)a1[1];
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
      uint64_t v24 = (char *)*a1;
    }

    *a1 = v18;
    a1[1] = v19;
    a1[2] = v23;
    if (v24) {
      operator delete(v24);
    }
  }

void sub_1000073E4(void **a1, unint64_t a2)
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
      sub_100006CB4();
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
      unint64_t v13 = (char *)sub_1000074F0(v4, v12);
    }
    else {
      unint64_t v13 = 0LL;
    }
    __int128 v14 = &v13[16 * v10];
    __int128 v15 = &v13[16 * v12];
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

void *sub_1000074F0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100004930();
  }
  return operator new(16 * a2);
}

char *sub_100007524(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_100006C64(result, a4);
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

void sub_100007584(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_1000075A0(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_100007610(result, a4);
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

void sub_1000075F4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_100007610(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100006CB4();
  }
  uint64_t result = (char *)sub_1000074F0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void sub_100007650(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        sub_1000071B8((uint64_t)(v1 + 2), v4);
      }

      while (v4 != v2);
      uint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

unsigned __int8 *sub_1000076D4(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3 || *a2 != 92) {
    return a2;
  }
  uint64_t v5 = a2 + 1;
  if (a2 + 1 == a3) {
    sub_100007A88();
  }
  uint64_t result = sub_100007AD4(a1, a2 + 1, a3);
  if (v5 == result)
  {
    uint64_t result = (unsigned __int8 *)sub_100007B88(a1, (char *)a2 + 1, (char *)a3);
    if (v5 == result)
    {
      uint64_t result = sub_100007C54(a1, a2 + 1, (char *)a3, 0LL);
      if (v5 == result) {
        return a2;
      }
    }
  }

  return result;
}

char *sub_100007774(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_20;
    }
    uint64_t v5 = a2[1] == 94 ? a2 + 2 : a2 + 1;
    uint64_t v6 = (uint64_t *)sub_1000088D8(a1, a2[1] == 94);
    if (v5 == a3) {
      goto LABEL_20;
    }
    uint64_t v7 = v6;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v5 == 93)
    {
      sub_100008950((uint64_t)v6, 93LL);
      ++v5;
    }

    if (v5 == a3) {
      goto LABEL_20;
    }
    do
    {
      __int128 v8 = v5;
      uint64_t v5 = sub_100009C58(a1, v5, a3, v7);
    }

    while (v8 != v5);
    if (v8 == a3) {
      goto LABEL_20;
    }
    if (*v8 == 45)
    {
      sub_100008950((uint64_t)v7, 45LL);
      ++v8;
    }

    if (v8 == a3 || *v8 != 93) {
LABEL_20:
    }
      sub_100009C0C();
    return v8 + 1;
  }

  return a2;
}

void *sub_100007884(void *result)
{
  if ((result[3] & 2) == 0)
  {
    uint64_t v1 = result;
    uint64_t result = operator new(0x18uLL);
    int v2 = *((_DWORD *)v1 + 7) + 1;
    *((_DWORD *)v1 + 7) = v2;
    uint64_t v3 = v1[7];
    uint64_t v4 = *(void *)(v3 + 8);
    *uint64_t result = &off_10001C958;
    result[1] = v4;
    *((_DWORD *)result + 4) = v2;
    *(void *)(v3 + 8) = result;
    v1[7] = *(void *)(v1[7] + 8LL);
  }

  return result;
}

void *sub_1000078E8(void *result, int a2)
{
  if ((result[3] & 2) == 0)
  {
    uint64_t v3 = result;
    uint64_t result = operator new(0x18uLL);
    uint64_t v4 = v3[7];
    uint64_t v5 = *(void *)(v4 + 8);
    *uint64_t result = &off_10001C9A0;
    result[1] = v5;
    *((_DWORD *)result + 4) = a2;
    *(void *)(v4 + 8) = result;
    v3[7] = *(void *)(v3[7] + 8LL);
  }

  return result;
}

void sub_100007944()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badrepeat);
}

void sub_10000797C(_Unwind_Exception *a1)
{
}

_BYTE *sub_100007990(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    int v4 = (char)*a2;
    BOOL v5 = (v4 - 36) > 0x3A || ((1LL << (*a2 - 36)) & 0x7800000080004F1LL) == 0;
    if (v5 && (v4 - 123) >= 3)
    {
      sub_100007F30(a1, (char)v4);
      ++v3;
    }
  }

  return v3;
}

void *sub_100007A00(void *a1)
{
  *a1 = &off_10001C5C8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_100007A44(void *__p)
{
  void *__p = &off_10001C5C8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

void sub_100007A88()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_escape);
}

void sub_100007AC0(_Unwind_Exception *a1)
{
}

unsigned __int8 *sub_100007AD4(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    int v4 = *a2;
    uint64_t v5 = (v4 - 48);
    if (v4 == 48)
    {
      sub_100007F30(a1, v5);
      return ++v3;
    }

    if (++v3 == a3)
    {
      uint64_t v3 = a3;
    }

    else
    {
      while (1)
      {
        int v6 = *v3;
        ++v3;
        LODWORD(v5) = v6 + 10 * v5 - 48;
        if (v3 == a3)
        {
          uint64_t v3 = a3;
          break;
        }
      }

      if (!(_DWORD)v5) {
        goto LABEL_16;
      }
    }

    if (v5 <= *(_DWORD *)(a1 + 28))
    {
      sub_100008060(a1, v5);
      return v3;
    }

LABEL_16:
    sub_100008014();
  }

  return v3;
}

  if (v14 == a3
    || (__int128 v15 = *v14, v15 == 93)
    || (__int128 v17 = v14 + 1, v14 + 1 == a3)
    || v15 != 45
    || *v17 == 93)
  {
    if ((char)v26.__r_.__value_.__s.__size_ < 0)
    {
      if (v26.__r_.__value_.__l.__size_)
      {
        if (v26.__r_.__value_.__l.__size_ != 1)
        {
          uint64_t v16 = (std::string *)v26.__r_.__value_.__r.__words[0];
LABEL_40:
          sub_10000AA4C( v6,  v16->__r_.__value_.__s.__data_[0],  v16->__r_.__value_.__s.__data_[1]);
          goto LABEL_41;
        }

        uint64_t v16 = (std::string *)v26.__r_.__value_.__r.__words[0];
        goto LABEL_25;
      }
    }

    else if (v26.__r_.__value_.__s.__size_)
    {
      uint64_t v16 = &v26;
      if (v26.__r_.__value_.__s.__size_ != 1) {
        goto LABEL_40;
      }
LABEL_25:
      sub_100008950(v6, v16->__r_.__value_.__s.__data_[0]);
    }

  std::stringbuf::str(a2, &v15);
  *(void *)((char *)v13
  __int128 v14 = v10;
  std::streambuf::~streambuf(&v15);
  return std::ios::~ios(&v16);
}

char *sub_100007B88(uint64_t a1, char *a2, char *a3)
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
    uint64_t v7 = sub_1000088D8(a1, v6);
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
      uint64_t v7 = sub_1000088D8(a1, v9);
      int v8 = v7[40] | 0x4000;
      goto LABEL_18;
    case 'W':
      char v5 = 1;
LABEL_15:
      uint64_t v10 = sub_1000088D8(a1, v5);
      v10[40] |= 0x500u;
      sub_100008950((uint64_t)v10, 95LL);
LABEL_19:
      ++v3;
      break;
  }

  return v3;
}

unsigned __int8 *sub_100007C54(uint64_t a1, unsigned __int8 *a2, char *a3, std::string *this)
{
  int v4 = a2;
  if (a2 != (unsigned __int8 *)a3)
  {
    int v5 = (char)*a2;
    if (v5 > 109)
    {
      char v6 = 0;
      switch(*a2)
      {
        case 'n':
          if (this)
          {
            uint64_t v7 = this;
            LOBYTE(v8) = 10;
            goto LABEL_52;
          }

          uint64_t v8 = 10LL;
          goto LABEL_61;
        case 'r':
          if (this)
          {
            uint64_t v7 = this;
            LOBYTE(v8) = 13;
            goto LABEL_52;
          }

          uint64_t v8 = 13LL;
          goto LABEL_61;
        case 't':
          if (this)
          {
            uint64_t v7 = this;
            LOBYTE(v8) = 9;
            goto LABEL_52;
          }

          uint64_t v8 = 9LL;
          goto LABEL_61;
        case 'u':
          int v9 = a2[1];
          if ((v9 & 0xF8) != 0x30 && (v9 & 0xFE) != 0x38 && (v9 | 0x20u) - 97 >= 6) {
            goto LABEL_66;
          }
          int v4 = a2 + 2;
          int v10 = *v4;
          char v11 = -48;
          if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38) {
            goto LABEL_24;
          }
          v10 |= 0x20u;
          char v11 = -87;
LABEL_24:
          char v6 = 16 * (v11 + v10);
LABEL_25:
          int v12 = v4[1];
          char v13 = -48;
          if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38) {
            goto LABEL_30;
          }
          v12 |= 0x20u;
          char v13 = -87;
LABEL_30:
          int v14 = v4[2];
          char v15 = -48;
          if ((v14 & 0xF8) == 0x30 || (v14 & 0xFE) == 0x38) {
            goto LABEL_35;
          }
          v14 |= 0x20u;
          char v15 = -87;
LABEL_35:
          if (this) {
            std::string::operator=(this, v15 + v14 + 16 * (v13 + v12 + v6));
          }
          else {
            sub_100007F30(a1, (char)(v15 + v14 + 16 * (v13 + v12 + v6)));
          }
          v4 += 3;
          return v4;
        case 'v':
          if (this)
          {
            uint64_t v7 = this;
            LOBYTE(v8) = 11;
            goto LABEL_52;
          }

          uint64_t v8 = 11LL;
          break;
        case 'x':
          goto LABEL_25;
        default:
          goto LABEL_47;
      }

      goto LABEL_61;
    }

    if (v5 == 48)
    {
      if (this)
      {
        uint64_t v7 = this;
        LOBYTE(v8) = 0;
        goto LABEL_52;
      }

      uint64_t v8 = 0LL;
LABEL_61:
      sub_100007F30(a1, v8);
      return ++v4;
    }

    if (v5 != 99)
    {
      if (v5 == 102)
      {
        if (this)
        {
          uint64_t v7 = this;
          LOBYTE(v8) = 12;
LABEL_52:
          std::string::operator=(v7, v8);
          return ++v4;
        }

        uint64_t v8 = 12LL;
        goto LABEL_61;
      }

LABEL_47:
      if (*a2 != 95
        && ((v5 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 16LL) + 4LL * *a2) & 0x500) == 0))
      {
        uint64_t v8 = (char)v5;
        if (this)
        {
          uint64_t v7 = this;
          goto LABEL_52;
        }

        goto LABEL_61;
      }

LABEL_66:
      sub_100007A88();
    }

    unsigned int v16 = a2[1];
    if (this) {
      std::string::operator=(this, v16 & 0x1F);
    }
    else {
      sub_100007F30(a1, v16 & 0x1F);
    }
    v4 += 2;
  }

  return v4;
}

  v43 = *(_DWORD *)(a1 + 164);
  if (v43 || *(void *)(a1 + 64) != *(void *)(a1 + 72))
  {
    if ((v39 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16LL) + 4LL * v39) & v43) == 0) {
      unint64_t v44 = (v39 == 95) & (v43 >> 7);
    }
    else {
      LOBYTE(v44) = 1;
    }
    v45 = *(void **)(a1 + 72);
    v46 = memchr(*(const void **)(a1 + 64), (char)v39, (size_t)v45 - *(void *)(a1 + 64));
    v47 = v46 ? v46 : v45;
    if ((v44 & 1) == 0 && v47 == v45) {
      goto LABEL_77;
    }
  }

  v49 = *(void *)(a1 + 88);
  v48 = *(void *)(a1 + 96);
  if (v49 != v48)
  {
    if (*(_BYTE *)(a1 + 170))
    {
      sub_100009844(a1 + 16, (char *)&v121, (char *)&v122);
      v49 = *(void *)(a1 + 88);
      v48 = *(void *)(a1 + 96);
    }

    else
    {
      __p.__r_.__value_.__s.__size_ = 1;
      LOWORD(__p.__r_.__value_.__l.__data_) = v39;
    }

    v50 = v48 - v49;
    if (v50)
    {
      v117 = v37;
      v114 = v36;
      v51 = 0LL;
      v52 = v50 / 48;
      v112 = __p.__r_.__value_.__s.__size_;
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v53 = __p.__r_.__value_.__s.__size_;
      }
      else {
        v53 = __p.__r_.__value_.__l.__size_;
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v54 = &__p;
      }
      else {
        v54 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if (v52 <= 1) {
        v55 = 1LL;
      }
      else {
        v55 = v50 / 48;
      }
      v56 = 1;
      while (1)
      {
        v57 = *(char *)(v49 + 23);
        if (v57 >= 0) {
          v58 = *(unsigned __int8 *)(v49 + 23);
        }
        else {
          v58 = *(void *)(v49 + 8);
        }
        if (v57 >= 0) {
          v59 = (const void *)v49;
        }
        else {
          v59 = *(const void **)v49;
        }
        if (v58 >= v53) {
          v60 = v53;
        }
        else {
          v60 = v58;
        }
        v61 = memcmp(v54, v59, v60);
        v62 = v53 >= v58;
        if (v61) {
          v62 = v61 >= 0;
        }
        if (v62)
        {
          v63 = *(char *)(v49 + 47);
          if (v63 >= 0) {
            v64 = *(unsigned __int8 *)(v49 + 47);
          }
          else {
            v64 = *(void *)(v49 + 32);
          }
          if (v63 >= 0) {
            v65 = (const void *)(v49 + 24);
          }
          else {
            v65 = *(const void **)(v49 + 24);
          }
          if (v53 >= v64) {
            v66 = v64;
          }
          else {
            v66 = v53;
          }
          v67 = memcmp(v65, v54, v66);
          v68 = v64 >= v53;
          if (v67) {
            v68 = v67 >= 0;
          }
          if (v68) {
            break;
          }
        }

        v56 = ++v51 < v52;
        v49 += 48LL;
        if (v55 == v51)
        {
          v36 = v114;
          goto LABEL_123;
        }
      }

      v36 = 1;
LABEL_123:
      v37 = v117;
      if ((v112 & 0x80) == 0) {
        goto LABEL_125;
      }
    }

    else
    {
      v56 = 0;
      if ((__p.__r_.__value_.__s.__size_ & 0x80) == 0) {
        goto LABEL_125;
      }
    }

    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_125:
    if (v56) {
      goto LABEL_221;
    }
  }

  if (*(void *)(a1 + 136) == *(void *)(a1 + 144)) {
    goto LABEL_154;
  }
  sub_100009B18(a1 + 16, (char *)&v121, (char *)&v122, (uint64_t)&__p);
  v69 = *(void *)(a1 + 136);
  v70 = __p.__r_.__value_.__s.__size_;
  v71 = *(void *)(a1 + 144) - v69;
  if (v71)
  {
    v118 = v37;
    v72 = 0LL;
    v73 = v71 / 24;
    v74 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      v75 = __p.__r_.__value_.__s.__size_;
    }
    else {
      v75 = __p.__r_.__value_.__l.__size_;
    }
    if (v73 <= 1) {
      v76 = 1LL;
    }
    else {
      v76 = v71 / 24;
    }
    v77 = 1;
    while (1)
    {
      v78 = (unsigned __int8 **)(v69 + 24 * v72);
      v79 = (unsigned __int8 *)*((unsigned __int8 *)v78 + 23);
      v80 = (char)v79;
      if ((unsigned __int8 *)v75 == v79)
      {
        if (v80 >= 0) {
          v81 = (unsigned __int8 *)(v69 + 24 * v72);
        }
        else {
          v81 = *v78;
        }
        if ((v70 & 0x80) != 0)
        {
          v115 = v36;
          v84 = v73;
          v113 = v76;
          v85 = memcmp((const void *)v74, v81, *((size_t *)&v74 + 1));
          v76 = v113;
          v73 = v84;
          v36 = v115;
          if (!v85)
          {
            v36 = 1;
            v37 = v118;
            goto LABEL_152;
          }
        }

        else
        {
          if (!(_DWORD)v70)
          {
            v36 = 1;
            v37 = v118;
            if (!v77) {
              goto LABEL_154;
            }
            goto LABEL_221;
          }

          v82 = &__p;
          v83 = v70;
          while (v82->__r_.__value_.__s.__data_[0] == *v81)
          {
            v82 = (std::string *)((char *)v82 + 1);
            ++v81;
            if (!--v83)
            {
              v36 = 1;
              goto LABEL_149;
            }
          }
        }
      }

      v77 = ++v72 < v73;
      if (v72 == v76)
      {
LABEL_149:
        v37 = v118;
        if ((v70 & 0x80) == 0) {
          goto LABEL_153;
        }
        goto LABEL_152;
      }
    }
  }

  v77 = 0;
  if ((__p.__r_.__value_.__s.__size_ & 0x80) != 0) {
LABEL_152:
  }
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_153:
  if (!v77)
  {
LABEL_154:
    v86 = *(_DWORD *)(a1 + 160);
    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16LL) + 4LL * v121) & v86) == 0)
    {
      v87 = (v86 >> 7) & 1;
      if (v121 != 95) {
        v87 = 0;
      }
      if (v87 != 1) {
        goto LABEL_221;
      }
    }

    goto LABEL_77;
  }

uint64_t sub_100007F30(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 24);
  if ((v4 & 1) != 0)
  {
    uint64_t v8 = (char *)operator new(0x30uLL);
    uint64_t result = sub_10000812C((uint64_t)v8, a1, a2, *(void *)(*(void *)(a1 + 56) + 8LL));
LABEL_6:
    *(void *)(*(void *)(a1 + 56) + 8LL) = v8;
    goto LABEL_7;
  }

  if ((v4 & 8) != 0)
  {
    uint64_t v8 = (char *)operator new(0x30uLL);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
    *(void *)uint64_t v8 = off_10001C7A8;
    *((void *)v8 + 1) = v9;
    uint64_t result = (uint64_t)std::locale::locale((std::locale *)v8 + 2, (const std::locale *)a1);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)(a1 + 8);
    v8[40] = a2;
    goto LABEL_6;
  }

  uint64_t result = (uint64_t)operator new(0x18uLL);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(v6 + 8);
  *(void *)uint64_t result = &off_10001C7F0;
  *(void *)(result + 8) = v7;
  *(_BYTE *)(result + 16) = a2;
  *(void *)(v6 + 8) = result;
LABEL_7:
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return result;
}

void sub_100008000(_Unwind_Exception *a1)
{
}

void sub_100008014()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_backref);
}

void sub_10000804C(_Unwind_Exception *a1)
{
}

void *sub_100008060(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)(a1 + 24);
  if ((v4 & 1) != 0)
  {
    uint64_t v8 = (std::locale *)operator new(0x30uLL);
    uint64_t v9 = v8;
    int v10 = *(std::locale::__imp **)(*(void *)(a1 + 56) + 8LL);
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
    uint64_t v8 = (std::locale *)operator new(0x30uLL);
    uint64_t v9 = v8;
    int v10 = *(std::locale::__imp **)(*(void *)(a1 + 56) + 8LL);
    goto LABEL_6;
  }

  uint64_t result = operator new(0x18uLL);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(v6 + 8);
  *uint64_t result = &off_10001C8C8;
  result[1] = v7;
  *((_DWORD *)result + 4) = a2;
  *(void *)(v6 + 8) = result;
LABEL_7:
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return result;
}

uint64_t sub_10000812C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = off_10001C760;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 40) = (*(uint64_t (**)(void, uint64_t))(**(void **)(a2 + 8) + 40LL))( *(void *)(a2 + 8),  a3);
  return a1;
}

void sub_100008198(_Unwind_Exception *a1)
{
  void *v1 = &off_10001C5C8;
  uint64_t v4 = v1[1];
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
  }
  _Unwind_Resume(a1);
}

std::locale *sub_1000081D0(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C760;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_10001C5C8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_100008228(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C760;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_10001C5C8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_100008280(uint64_t result, uint64_t a2)
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

  *(void *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_1000082F8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C7A8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_10001C5C8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_100008350(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C7A8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_10001C5C8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_1000083A8(uint64_t result, uint64_t a2)
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

  *(void *)(a2 + 80) = v3;
  return result;
}

void *sub_1000083F0(void *a1)
{
  *a1 = &off_10001C5C8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_100008434(void *__p)
{
  void *__p = &off_10001C5C8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_100008478(uint64_t result, uint64_t a2)
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

  *(void *)(a2 + 80) = v3;
  return result;
}

std::locale *sub_1000084C0(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C838;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_10001C5C8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_100008518(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C838;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_10001C5C8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_100008570(uint64_t result, uint64_t a2)
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
  *(void *)(a2 + 80) = v6;
  return result;
}

std::locale *sub_100008654(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C880;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_10001C5C8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_1000086AC(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C880;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_10001C5C8;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_100008704(uint64_t result, uint64_t a2)
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
  *(void *)(a2 + 80) = v8;
  return result;
}

void *sub_100008794(void *a1)
{
  *a1 = &off_10001C5C8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_1000087D8(void *__p)
{
  void *__p = &off_10001C5C8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

unsigned int *sub_10000881C(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    sub_100008014();
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

  *(void *)(a2 + 80) = v10;
  return result;
}

void *sub_1000088D8(uint64_t a1, char a2)
{
  uint64_t v4 = operator new(0xB0uLL);
  sub_100008B7C( (uint64_t)v4,  a1,  *(void *)(*(void *)(a1 + 56) + 8LL),  a2,  *(_DWORD *)(a1 + 24) & 1,  (*(_DWORD *)(a1 + 24) & 8) != 0);
  *(void *)(*(void *)(a1 + 56) + 8LL) = v4;
  *(void *)(a1 + 56) = v4;
  return v4;
}

void sub_10000893C(_Unwind_Exception *a1)
{
}

void sub_100008950(uint64_t a1, uint64_t a2)
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

LABEL_22:
    *unsigned int v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }

  unint64_t v14 = *v6;
  char v15 = &v5[-*v6];
  unint64_t v16 = (unint64_t)(v15 + 1);
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    unint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v18 = v16;
  }
  if (v18) {
    int v12 = operator new(v18);
  }
  else {
    int v12 = 0LL;
  }
  uint64_t v20 = &v15[(void)v12];
  __int128 v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    uint64_t v29 = &v5[~v14];
    do
    {
      char v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }

    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }

    *unsigned int v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }

  unint64_t v14 = *v6;
  char v15 = &v5[-*v6];
  unint64_t v16 = (unint64_t)(v15 + 1);
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    unint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v18 = v16;
  }
  if (v18) {
    int v12 = operator new(v18);
  }
  else {
    int v12 = 0LL;
  }
  uint64_t v20 = &v15[(void)v12];
  __int128 v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    uint64_t v29 = &v5[~v14];
    do
    {
      char v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }

    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }

LABEL_46:
  int v12 = v20;
LABEL_47:
  *(void *)(a1 + 40) = v12;
  *(void *)(a1 + 48) = v19;
  *(void *)(a1 + 56) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 48) = v19;
}

  int v12 = v20;
LABEL_47:
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v19;
  *(void *)(a1 + 80) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 72) = v19;
}

uint64_t sub_100008B7C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)a1 = off_10001C910;
  *(void *)(a1 + 8) = a3;
  size_t v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  __int128 v12 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 24) = v12;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_BYTE *)(a1 + 168) = a4;
  *(_BYTE *)(a1 + 169) = a5;
  *(_BYTE *)(a1 + 170) = a6;
  std::locale::locale(&v15, v11);
  std::locale::name(&v16, &v15);
  if ((char)v16.__r_.__value_.__s.__size_ < 0)
  {
    BOOL v13 = v16.__r_.__value_.__l.__size_ != 1 || *v16.__r_.__value_.__l.__data_ != 67;
    operator delete(v16.__r_.__value_.__l.__data_);
  }

  else
  {
    BOOL v13 = v16.__r_.__value_.__s.__size_ != 1 || v16.__r_.__value_.__s.__data_[0] != 67;
  }

  std::locale::~locale(&v15);
  *(_BYTE *)(a1 + 171) = v13;
  return a1;
}

void sub_100008C8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  a10 = v10 + 17;
  sub_10000C9EC((void ***)&a10);
  unint64_t v14 = (void *)v10[14];
  if (v14)
  {
    v10[15] = v14;
    operator delete(v14);
  }

  sub_10000973C((void ***)&a10);
  std::locale v15 = (void *)v10[8];
  if (v15)
  {
    v10[9] = v15;
    operator delete(v15);
  }

  std::string v16 = *v12;
  if (*v12)
  {
    v10[6] = v16;
    operator delete(v16);
  }

  std::locale::~locale(v11);
  void *v10 = &off_10001C5C8;
  uint64_t v17 = v10[1];
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8LL))(v17);
  }
  _Unwind_Resume(a1);
}

std::locale *sub_100008D18(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C910;
  unint64_t v7 = a1 + 17;
  sub_10000C9EC((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }

  unint64_t v7 = a1 + 11;
  sub_10000973C((void ***)&v7);
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
  a1->__locale_ = (std::locale::__imp *)&off_10001C5C8;
  unsigned int v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8LL))(v5);
  }
  return a1;
}

void sub_100008DCC(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_10001C910;
  uint64_t v6 = a1 + 17;
  sub_10000C9EC((void ***)&v6);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }

  uint64_t v6 = a1 + 11;
  sub_10000973C((void ***)&v6);
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
  a1->__locale_ = (std::locale::__imp *)&off_10001C5C8;
  unsigned int v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8LL))(v5);
  }
  operator delete(a1);
}

void sub_100008E84(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(signed __int8 **)(a2 + 16);
  unsigned int v5 = *(signed __int8 **)(a2 + 24);
  if (v4 == v5)
  {
    uint64_t v37 = 0LL;
    int v36 = *(unsigned __int8 *)(a1 + 168);
    goto LABEL_221;
  }

  if (!*(_BYTE *)(a1 + 171) || v4 + 1 == v5) {
    goto LABEL_58;
  }
  signed __int8 v6 = *v4;
  unsigned __int8 v121 = *v4;
  signed __int8 v7 = v4[1];
  unsigned __int8 v122 = v7;
  if (*(_BYTE *)(a1 + 169))
  {
    unsigned __int8 v121 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  v6);
    unsigned __int8 v122 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  v7);
  }

  uint64_t v8 = a1 + 16;
  sub_1000098E0(a1 + 16, (char *)&v121, (char *)&v123, &__p);
  if (((char)__p.__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    if (__p.__r_.__value_.__s.__size_) {
      goto LABEL_8;
    }
LABEL_58:
    int v36 = 0;
    uint64_t v37 = 1LL;
    goto LABEL_59;
  }

  std::string::size_type size = __p.__r_.__value_.__l.__size_;
  operator delete(__p.__r_.__value_.__l.__data_);
  if (!size) {
    goto LABEL_58;
  }
LABEL_8:
  uint64_t v9 = *(void *)(a1 + 112);
  uint64_t v10 = *(void *)(a1 + 120) - v9;
  if (v10)
  {
    uint64_t v11 = v10 >> 1;
    __int128 v12 = (_BYTE *)(v9 + 1);
    do
    {
      v12 += 2;
      --v11;
    }

    while (v11);
  }

  if (!*(_BYTE *)(a1 + 170) || *(void *)(a1 + 88) == *(void *)(a1 + 96))
  {
    int v36 = 0;
  }

  else
  {
    sub_100009844(a1 + 16, (char *)&v121, (char *)&v123);
    uint64_t v14 = *(void *)(a1 + 88);
    unsigned __int8 v15 = __p.__r_.__value_.__s.__size_;
    uint64_t v16 = *(void *)(a1 + 96) - v14;
    if (v16)
    {
      uint64_t v17 = 0LL;
      unint64_t v18 = v16 / 48;
      unsigned __int8 v111 = __p.__r_.__value_.__s.__size_;
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type v19 = __p.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type v19 = __p.__r_.__value_.__l.__size_;
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if (v18 <= 1) {
        uint64_t v21 = 1LL;
      }
      else {
        uint64_t v21 = v16 / 48;
      }
      BOOL v22 = 1;
      while (1)
      {
        int v23 = *(char *)(v14 + 23);
        if (v23 >= 0) {
          size_t v24 = *(unsigned __int8 *)(v14 + 23);
        }
        else {
          size_t v24 = *(void *)(v14 + 8);
        }
        if (v23 >= 0) {
          uint64_t v25 = (const void *)v14;
        }
        else {
          uint64_t v25 = *(const void **)v14;
        }
        if (v24 >= v19) {
          size_t v26 = v19;
        }
        else {
          size_t v26 = v24;
        }
        int v27 = memcmp(p_p, v25, v26);
        BOOL v28 = v19 >= v24;
        if (v27) {
          BOOL v28 = v27 >= 0;
        }
        if (v28)
        {
          int v29 = *(char *)(v14 + 47);
          if (v29 >= 0) {
            size_t v30 = *(unsigned __int8 *)(v14 + 47);
          }
          else {
            size_t v30 = *(void *)(v14 + 32);
          }
          if (v29 >= 0) {
            uint64_t v31 = (const void *)(v14 + 24);
          }
          else {
            uint64_t v31 = *(const void **)(v14 + 24);
          }
          if (v19 >= v30) {
            size_t v32 = v30;
          }
          else {
            size_t v32 = v19;
          }
          int v33 = memcmp(v31, p_p, v32);
          BOOL v34 = v30 >= v19;
          if (v33) {
            BOOL v34 = v33 >= 0;
          }
          if (v34) {
            break;
          }
        }

        BOOL v22 = ++v17 < v18;
        v14 += 48LL;
        if (v21 == v17)
        {
          int v35 = 0;
          int v36 = 0;
          goto LABEL_162;
        }
      }

      int v36 = 1;
      int v35 = 5;
LABEL_162:
      uint64_t v8 = a1 + 16;
      unsigned __int8 v15 = v111;
    }

    else
    {
      BOOL v22 = 0;
      int v35 = 0;
      int v36 = 0;
    }

    if ((v15 & 0x80) != 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v22) {
      goto LABEL_195;
    }
  }

  if (*(void *)(a1 + 136) == *(void *)(a1 + 144)) {
    goto LABEL_200;
  }
  sub_100009B18(v8, (char *)&v121, (char *)&v123, (uint64_t)&__p);
  uint64_t v88 = *(void *)(a1 + 136);
  uint64_t v89 = __p.__r_.__value_.__s.__size_;
  uint64_t v90 = *(void *)(a1 + 144) - v88;
  if (v90)
  {
    uint64_t v91 = 0LL;
    unint64_t v92 = v90 / 24;
    __int128 v93 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type v94 = __p.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v94 = __p.__r_.__value_.__l.__size_;
    }
    if (v92 <= 1) {
      uint64_t v95 = 1LL;
    }
    else {
      uint64_t v95 = v90 / 24;
    }
    BOOL v96 = 1;
    while (1)
    {
      v97 = (unsigned __int8 **)(v88 + 24 * v91);
      v98 = (unsigned __int8 *)*((unsigned __int8 *)v97 + 23);
      int v99 = (char)v98;
      if ((unsigned __int8 *)v94 == v98)
      {
        if (v99 >= 0) {
          v100 = (unsigned __int8 *)(v88 + 24 * v91);
        }
        else {
          v100 = *v97;
        }
        if ((v89 & 0x80) == 0)
        {
          if ((_DWORD)v89)
          {
            v101 = &__p;
            uint64_t v102 = v89;
            do
            {
              v101 = (std::string *)((char *)v101 + 1);
              ++v100;
              --v102;
            }

            while (v102);
            int v36 = 1;
            int v35 = 5;
            goto LABEL_192;
          }

          int v36 = 1;
          if (v96) {
            goto LABEL_220;
          }
LABEL_200:
          if ((char)v121 < 0)
          {
            int v107 = *(_DWORD *)(a1 + 164);
            goto LABEL_213;
          }

          int v104 = *(_DWORD *)(a1 + 160);
          uint64_t v105 = *(void *)(*(void *)(a1 + 24) + 16LL);
          int v106 = *(_DWORD *)(v105 + 4LL * v121);
          if ((v106 & v104) == 0 && (v121 != 95 || (v104 & 0x80) == 0)
            || (char)v122 < 0
            || (*(_DWORD *)(v105 + 4LL * v122) & v104) == 0 && ((v104 & 0x80) == 0 || v122 != 95))
          {
            int v107 = *(_DWORD *)(a1 + 164);
            if ((v106 & v107) != 0 || v121 == 95 && (v107 & 0x80) != 0)
            {
LABEL_217:
              int v108 = v36;
              goto LABEL_219;
            }

LABEL_213:
            if (((char)v122 & 0x80000000) == 0)
            {
              if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16LL) + 4LL * v122) & v107) != 0) {
                goto LABEL_217;
              }
              int v108 = 1;
              if (v122 == 95 && (v107 & 0x80) != 0) {
                goto LABEL_217;
              }
LABEL_219:
              int v36 = v108;
LABEL_220:
              uint64_t v37 = 2LL;
              goto LABEL_221;
            }
          }

LABEL_218:
          int v108 = 1;
          goto LABEL_219;
        }

        unint64_t v116 = v92;
        uint64_t v119 = v89;
        int v103 = memcmp((const void *)v93, v100, *((size_t *)&v93 + 1));
        unint64_t v92 = v116;
        uint64_t v89 = v119;
        if (!v103) {
          break;
        }
      }

LABEL_188:
      BOOL v96 = ++v91 < v92;
      if (v91 == v95) {
        goto LABEL_191;
      }
    }

    int v35 = 5;
    int v36 = 1;
    goto LABEL_193;
  }

  BOOL v96 = 0;
LABEL_191:
  int v35 = 0;
LABEL_192:
  if ((v89 & 0x80) != 0) {
LABEL_193:
  }
    operator delete(__p.__r_.__value_.__l.__data_);
  if (!v96) {
    goto LABEL_200;
  }
LABEL_195:
  if (v35) {
    goto LABEL_220;
  }
  uint64_t v37 = 2LL;
LABEL_59:
  unsigned __int8 v39 = **(_BYTE **)(a2 + 16);
  unsigned __int8 v121 = v39;
  if (*(_BYTE *)(a1 + 169))
  {
    unsigned __int8 v39 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  (char)v39);
    unsigned __int8 v121 = v39;
  }

  __int128 v40 = *(unsigned __int8 **)(a1 + 40);
  unint64_t v41 = *(void *)(a1 + 48) - (void)v40;
  if (v41)
  {
    if (v41 <= 1) {
      unint64_t v41 = 1LL;
    }
    while (1)
    {
      int v42 = *v40++;
      if (v42 == v39) {
        break;
      }
      if (!--v41) {
        goto LABEL_66;
      }
    }

LABEL_77:
    int v36 = 1;
    goto LABEL_221;
  }

LABEL_221:
  if (v36 == *(unsigned __int8 *)(a1 + 168))
  {
    uint64_t v109 = 0LL;
    int v110 = -993;
  }

  else
  {
    *(void *)(a2 + 16) += v37;
    uint64_t v109 = *(void *)(a1 + 8);
    int v110 = -995;
  }

  *(_DWORD *)a2 = v110;
  *(void *)(a2 + 80) = v109;
}

void sub_10000973C(void ***a1)
{
  uint64_t v1 = *a1;
  char v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unsigned int v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48LL;
        sub_1000097C0((uint64_t)(v1 + 2), v4);
      }

      while ((void *)v4 != v2);
      unsigned int v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void sub_1000097C0(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_100009804(uint64_t a1)
{
  return a1;
}

void sub_100009844(uint64_t a1, char *a2, char *a3)
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

void sub_1000098C4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000098E0(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, std::string *a4@<X8>)
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

void sub_100009A40( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100009A74(void *result, char *a2, char *a3, unint64_t a4)
{
  unint64_t v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_1000048A8();
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

void sub_100009B18(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
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
      *(void *)(a4 + 8) = 0LL;
    }

    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }

void sub_100009BF0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100009C0C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brack);
}

void sub_100009C44(_Unwind_Exception *a1)
{
}

char *sub_100009C58(uint64_t a1, char *a2, char *a3, uint64_t *a4)
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
  memset(&v26, 0, sizeof(v26));
  if (a2 + 1 == a3 || v5 != 91)
  {
LABEL_9:
    int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_10;
  }

  int v9 = a2[1];
  if (v9 != 46)
  {
    if (v9 == 58)
    {
      char v10 = sub_10000A1F8(a1, a2 + 2, a3, (uint64_t)a4);
      goto LABEL_38;
    }

    if (v9 == 61)
    {
      char v10 = sub_10000A01C(a1, a2 + 2, a3, a4);
LABEL_38:
      uint64_t v6 = (uint64_t)v10;
      char v21 = 0;
      goto LABEL_42;
    }

    goto LABEL_9;
  }

  std::string::size_type v19 = sub_10000A2A8(a1, a2 + 2, a3, (uint64_t)&v26);
  unint64_t v4 = v19;
  int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  std::string::size_type size = v26.__r_.__value_.__s.__size_;
  if ((v26.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type size = v26.__r_.__value_.__l.__size_;
  }
  uint64_t v14 = v19;
  if (!size)
  {
LABEL_10:
    if ((v11 | 0x40) == 0x40)
    {
      int v12 = *v4;
      if (v12 == 92)
      {
        std::string v13 = v4 + 1;
        if (v11)
        {
          uint64_t v14 = sub_10000A4B0(a1, v13, a3, &v26);
        }

        else
        {
          uint64_t v14 = (char *)sub_10000A38C(a1, (unsigned __int8 *)v13, a3, &v26, v6);
          int v11 = 0;
        }

        goto LABEL_16;
      }
    }

    else
    {
      LOBYTE(v12) = *v4;
    }

    std::string::operator=(&v26, v12);
    uint64_t v14 = v4 + 1;
  }

LABEL_41:
    char v21 = 1;
    unint64_t v4 = v14;
    goto LABEL_42;
  }

  memset(&v25, 0, sizeof(v25));
  unint64_t v4 = v14 + 2;
  if (v14 + 2 != a3 && *v17 == 91 && *v4 == 46)
  {
    unint64_t v18 = sub_10000A2A8(a1, v14 + 3, a3, (uint64_t)&v25);
LABEL_55:
    unint64_t v4 = v18;
    goto LABEL_56;
  }

  if ((v11 | 0x40) == 0x40)
  {
    LODWORD(v17) = *v17;
    if ((_DWORD)v17 == 92)
    {
      if (v11) {
        unint64_t v18 = sub_10000A4B0(a1, v14 + 2, a3, &v25);
      }
      else {
        unint64_t v18 = (char *)sub_10000A38C(a1, (unsigned __int8 *)v14 + 2, a3, &v25, v6);
      }
      goto LABEL_55;
    }
  }

  else
  {
    LOBYTE(v17) = *v17;
  }

  std::string::operator=(&v25, (std::string::value_type)v17);
LABEL_56:
  std::string v24 = v26;
  memset(&v26, 0, sizeof(v26));
  std::string __p = v25;
  memset(&v25, 0, sizeof(v25));
  sub_10000A688(v6, (char *)&v24, (char *)&__p);
  char v21 = 1;
LABEL_42:
  if ((v21 & 1) != 0) {
    return v4;
  }
  return (char *)v6;
}

void sub_100009FA4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *__p, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000A01C(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_33;
  }
  uint64_t v6 = a3 - 2;
  unsigned __int8 v7 = a2;
  uint64_t v8 = a2;
  for (uint64_t i = a2; ; v8 = i)
  {
    int v10 = *i++;
    if (v10 == 61 && *i == 93) {
      break;
    }
    if (a2 == v6) {
      goto LABEL_33;
    }
    ++v7;
    --v6;
  }

  if (v8 == a3) {
LABEL_33:
  }
    sub_100009C0C();
  sub_10000AD00(a1, a2, v7, &v20);
  if (((char)v20.__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    std::string::size_type size = v20.__r_.__value_.__s.__size_;
    if (v20.__r_.__value_.__s.__size_)
    {
      int v12 = &v20;
      goto LABEL_14;
    }

LABEL_34:
    sub_10000AC74();
  }

  std::string::size_type size = v20.__r_.__value_.__l.__size_;
  if (!v20.__r_.__value_.__l.__size_) {
    goto LABEL_34;
  }
  int v12 = (std::string *)v20.__r_.__value_.__r.__words[0];
LABEL_14:
  sub_10000AE94(a1, (char *)v12, (char *)v12 + size, (uint64_t)__p);
  unint64_t v13 = v19;
  if ((v19 & 0x80u) != 0) {
    unint64_t v13 = (unint64_t)__p[1];
  }
  if (v13)
  {
    sub_10000ACC0(a4, (__int128 *)__p);
  }

  else
  {
    std::string::size_type v14 = v20.__r_.__value_.__s.__size_;
    if ((v20.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type v14 = v20.__r_.__value_.__l.__size_;
    }
    if (v14 == 2)
    {
      uint64_t v16 = &v20;
      if ((v20.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        uint64_t v16 = (std::string *)v20.__r_.__value_.__r.__words[0];
      }
      sub_10000AA4C( (uint64_t)a4,  v16->__r_.__value_.__s.__data_[0],  v16->__r_.__value_.__s.__data_[1]);
    }

    else
    {
      if (v14 != 1) {
        sub_10000AC74();
      }
      int v15 = &v20;
      if ((v20.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        int v15 = (std::string *)v20.__r_.__value_.__r.__words[0];
      }
      sub_100008950((uint64_t)a4, v15->__r_.__value_.__s.__data_[0]);
    }
  }

  return v7 + 2;
}

void sub_10000A1C0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000A1F8(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_11;
  }
  int v5 = a3 - 2;
  uint64_t v6 = a2;
  unsigned __int8 v7 = a2;
  for (uint64_t i = a2; ; v7 = i)
  {
    int v9 = *i++;
    if (v9 == 58 && *i == 93) {
      break;
    }
    if (a2 == v5) {
      goto LABEL_11;
    }
    ++v6;
    --v5;
  }

  if (v7 == a3) {
LABEL_11:
  }
    sub_100009C0C();
  int v10 = sub_10000AFD4(a1, a2, v6, *(_DWORD *)(a1 + 24) & 1);
  if (!v10) {
    sub_10000AF88();
  }
  *(_DWORD *)(a4 + 160) |= v10;
  return v6 + 2;
}

char *sub_10000A2A8(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  int v5 = a3 - 2;
  uint64_t v6 = a2;
  unsigned __int8 v7 = a2;
  for (uint64_t i = a2; ; v7 = i)
  {
    int v9 = *i++;
    if (v9 == 46 && *i == 93) {
      break;
    }
    if (a2 == v5) {
      goto LABEL_15;
    }
    ++v6;
    --v5;
  }

  if (v7 == a3) {
LABEL_15:
  }
    sub_100009C0C();
  sub_10000AD00(a1, a2, v6, &v13);
  *(_OWORD *)a4 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  std::string::size_type cap = v13.__r_.__value_.__l.__cap_;
  *(void *)(a4 + 16) = v13.__r_.__value_.__l.__cap_;
  std::string::size_type v11 = HIBYTE(cap);
  if ((v11 & 0x80u) != 0LL) {
    std::string::size_type v11 = *(void *)(a4 + 8);
  }
  if (v11 - 1 >= 2) {
    sub_10000AC74();
  }
  return v6 + 2;
}

unsigned __int8 *sub_10000A38C(uint64_t a1, unsigned __int8 *a2, char *a3, std::string *this, uint64_t a5)
{
  int v6 = (char)*a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119) {
          return sub_100007C54(a1, a2, a3, this);
        }
        *(_DWORD *)(a5 + 160) |= 0x500u;
        sub_100008950(a5, 95LL);
        return a2 + 1;
      }

      int v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }

    else
    {
      if (v6 == 98)
      {
        int v10 = this;
        std::string::value_type v9 = 8;
LABEL_19:
        std::string::operator=(v10, v9);
        return a2 + 1;
      }

      if (v6 != 100) {
        return sub_100007C54(a1, a2, a3, this);
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }

    *(_DWORD *)(a5 + 160) = v8;
    return a2 + 1;
  }

  if (v6 <= 82)
  {
    if (*a2)
    {
      if (v6 == 68)
      {
        int v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_21:
        *(_DWORD *)(a5 + 164) = v7;
        return a2 + 1;
      }

      return sub_100007C54(a1, a2, a3, this);
    }

    std::string::value_type v9 = 0;
    int v10 = this;
    goto LABEL_19;
  }

  if (v6 == 83)
  {
    int v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_21;
  }

  if (v6 == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    sub_10000B08C(a5, 95LL);
    return a2 + 1;
  }

  return sub_100007C54(a1, a2, a3, this);
}

char *sub_10000A4B0(uint64_t a1, char *a2, char *a3, std::string *this)
{
  if (a2 == a3) {
LABEL_52:
  }
    sub_100007A88();
  uint64_t v5 = *a2;
  if ((int)v5 > 97)
  {
    switch((int)v5)
    {
      case 'n':
        if (this)
        {
          int v6 = this;
          LOBYTE(v5) = 10;
          goto LABEL_16;
        }

        uint64_t v5 = 10LL;
        goto LABEL_49;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_21;
      case 'r':
        if (this)
        {
          int v6 = this;
          LOBYTE(v5) = 13;
          goto LABEL_16;
        }

        uint64_t v5 = 13LL;
        goto LABEL_49;
      case 't':
        if (this)
        {
          int v6 = this;
          LOBYTE(v5) = 9;
          goto LABEL_16;
        }

        uint64_t v5 = 9LL;
        goto LABEL_49;
      case 'v':
        if (this)
        {
          int v6 = this;
          LOBYTE(v5) = 11;
          goto LABEL_16;
        }

        uint64_t v5 = 11LL;
        goto LABEL_49;
      default:
        if ((_DWORD)v5 == 98)
        {
          if (this)
          {
            int v6 = this;
            LOBYTE(v5) = 8;
            goto LABEL_16;
          }

          uint64_t v5 = 8LL;
        }

        else
        {
          if ((_DWORD)v5 != 102) {
            goto LABEL_21;
          }
          if (this)
          {
            int v6 = this;
            LOBYTE(v5) = 12;
            goto LABEL_16;
          }

          uint64_t v5 = 12LL;
        }

        break;
    }

    goto LABEL_49;
  }

  if ((int)v5 > 91)
  {
    if ((_DWORD)v5 != 92)
    {
      if ((_DWORD)v5 != 97) {
        goto LABEL_21;
      }
      if (this)
      {
        int v6 = this;
        LOBYTE(v5) = 7;
LABEL_16:
        std::string::operator=(v6, v5);
        return a2 + 1;
      }

      uint64_t v5 = 7LL;
LABEL_49:
      sub_100007F30(a1, v5);
      return a2 + 1;
    }

LABEL_14:
    if (this)
    {
      int v6 = this;
      goto LABEL_16;
    }

    goto LABEL_49;
  }

  if ((_DWORD)v5 == 34 || (_DWORD)v5 == 47) {
    goto LABEL_14;
  }
LABEL_21:
  if ((v5 & 0xFFFFFFF8) != 0x30) {
    goto LABEL_52;
  }
  std::string::value_type v7 = v5 - 48;
  int v8 = a2 + 1;
  if (a2 + 1 != a3)
  {
    if ((*v8 & 0xF8) != 0x30) {
      goto LABEL_39;
    }
    std::string::value_type v7 = *v8 + 8 * v7 - 48;
    if (a2 + 2 != a3)
    {
      char v9 = a2[2];
      int v10 = v9 & 0xF8;
      std::string::value_type v11 = v9 + 8 * v7 - 48;
      if (v10 == 48) {
        int v8 = a2 + 3;
      }
      else {
        int v8 = a2 + 2;
      }
      if (v10 == 48) {
        std::string::value_type v7 = v11;
      }
      goto LABEL_39;
    }
  }

  int v8 = a3;
LABEL_39:
  if (this) {
    std::string::operator=(this, v7);
  }
  else {
    sub_100007F30(a1, v7);
  }
  return v8;
}

    sub_100006AF0( (char **)a4,  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3),  (__int128 *)(a4 + 24));
    if (sub_10000D0A8(a1, a3, a3, (uint64_t *)a4, v14, 0))
    {
      if (*(void *)(a4 + 8) == *(void *)a4) {
        int v10 = (uint64_t *)(a4 + 24);
      }
      else {
        int v10 = *(uint64_t **)a4;
      }
      goto LABEL_8;
    }
  }

  uint64_t result = 0LL;
  *(void *)(a4 + 8) = *(void *)a4;
  return result;
}

void sub_10000A688(uint64_t a1, char *a2, char *a3)
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
        int v8 = v4;
        if (v4[23] < 0) {
          int v8 = *(char **)v4;
        }
        char v9 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  v8[i]);
        int v10 = v4;
        if (v4[23] < 0) {
          int v10 = *(char **)v4;
        }
        v10[i] = v9;
      }

      for (unint64_t j = 0LL; ; ++j)
      {
        unint64_t v12 = v3[23] < 0 ? *((void *)v3 + 1) : v3[23];
        if (j >= v12) {
          break;
        }
        std::string v13 = v3;
        if (v3[23] < 0) {
          std::string v13 = *(char **)v3;
        }
        char v14 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  v13[j]);
        int v15 = v3;
        if (v3[23] < 0) {
          int v15 = *(char **)v3;
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
        unsigned __int8 v19 = a2;
        if (a2[23] < 0) {
          unsigned __int8 v19 = *(char **)a2;
        }
        std::string v20 = a2;
        if (a2[23] < 0) {
          std::string v20 = *(char **)a2;
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
        std::string v24 = a3;
        if (a3[23] < 0) {
          std::string v24 = *(char **)a3;
        }
        v24[m] = v23[m];
      }
    }

    if (v4[23] < 0)
    {
      std::string v26 = v4;
      unint64_t v4 = *(char **)v4;
      uint64_t v25 = *((void *)v26 + 1);
    }

    else
    {
      uint64_t v25 = v4[23];
    }

    sub_10000B420(a1 + 16, v4, &v4[v25]);
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

    sub_10000B420(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)__int128 v40 = v38;
    uint64_t v41 = v39;
    *(_OWORD *)std::string __p = *(_OWORD *)v36;
    uint64_t v43 = v37;
    sub_10000B2B8((uint64_t *)(a1 + 88), (__int128 *)v40);
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
      size_t v30 = a2;
      if (a2[23] < 0) {
        size_t v30 = *(char **)a2;
      }
      char v31 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  *v30);
      size_t v32 = v4;
      if (v4[23] < 0) {
        size_t v32 = *(_BYTE **)v4;
      }
      *size_t v32 = v31;
      int v33 = v3;
      if (v3[23] < 0) {
        int v33 = *(char **)v3;
      }
      char v34 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  *v33);
      int v35 = v3;
      if (v3[23] < 0) {
        int v35 = *(_BYTE **)v3;
      }
      *int v35 = v34;
    }

    *(_OWORD *)__int128 v40 = *(_OWORD *)v4;
    uint64_t v41 = *((void *)v4 + 2);
    *((void *)v4 + 1) = 0LL;
    *((void *)v4 + 2) = 0LL;
    *(void *)unint64_t v4 = 0LL;
    *(_OWORD *)std::string __p = *(_OWORD *)v3;
    uint64_t v43 = *((void *)v3 + 2);
    *(void *)uint64_t v3 = 0LL;
    *((void *)v3 + 1) = 0LL;
    *((void *)v3 + 2) = 0LL;
    sub_10000B2B8((uint64_t *)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }

void sub_10000AA00( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, char a21)
{
}

void sub_10000AA4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(_BYTE *)(a1 + 169))
  {
    uint64_t v18 = a1 + 128;
    unint64_t v19 = *(void *)(a1 + 128);
    int v10 = (char **)(a1 + 112);
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
          uint64_t v25 = (char *)sub_10000B76C(v18, v24);
        }
        else {
          uint64_t v25 = 0LL;
        }
        uint64_t v27 = &v25[2 * v21];
        uint64_t v28 = &v25[2 * v24];
        *(_WORD *)uint64_t v27 = v8;
        std::string v26 = v27 + 2;
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
          uint64_t v37 = (char *)sub_10000B76C(v18, v36);
        }
        else {
          uint64_t v37 = 0LL;
        }
        uint64_t v27 = &v37[2 * v33];
        uint64_t v28 = &v37[2 * v36];
        *(_WORD *)uint64_t v27 = v8;
        std::string v26 = v27 + 2;
        __int128 v40 = *(char **)(a1 + 112);
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
    sub_100006CB4();
  }

  unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40LL))(*(void *)(a1 + 24), a2);
  __int16 v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40LL))(*(void *)(a1 + 24), a3);
  unint64_t v7 = *(void *)(a1 + 128);
  __int16 v8 = v5 | (unsigned __int16)(v6 << 8);
  char v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    *char v9 = v8;
    std::string v26 = v9 + 1;
    goto LABEL_48;
  }

  int v10 = (char **)(a1 + 112);
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
    uint64_t v17 = (char *)sub_10000B76C(a1 + 128, v16);
  }
  else {
    uint64_t v17 = 0LL;
  }
  uint64_t v27 = &v17[2 * v13];
  uint64_t v28 = &v17[2 * v16];
  *(_WORD *)uint64_t v27 = v8;
  std::string v26 = v27 + 2;
  size_t v30 = *(char **)(a1 + 112);
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
  *(void *)(a1 + 120) = v26;
  *(void *)(a1 + 128) = v28;
  if (v29) {
    operator delete(v29);
  }
LABEL_48:
  *(void *)(a1 + 120) = v26;
}

void sub_10000AC74()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_collate);
}

void sub_10000ACAC(_Unwind_Exception *a1)
{
}

uint64_t sub_10000ACC0(uint64_t *a1, __int128 *a2)
{
  uint64_t v3 = a1 + 17;
  unint64_t v4 = a1[18];
  if (v4 >= a1[19])
  {
    uint64_t result = sub_10000EF98(v3, a2);
  }

  else
  {
    sub_10000EF3C(v3, a2);
    uint64_t result = v4 + 24;
  }

  a1[18] = result;
  return result;
}

void sub_10000AD00(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, std::string *a4@<X8>)
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
    int v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }

  else
  {
    std::string::size_type v9 = __s.__r_.__value_.__s.__size_;
    if (__s.__r_.__value_.__s.__size_ >= 3u) {
      return;
    }
    int v10 = &__s;
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

void sub_10000AE60( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000AE94(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
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
        int v10 = (_BYTE *)a4;
      }
      else {
        int v10 = *(_BYTE **)a4;
      }
      v10[11] = v10[3];
    }

    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(void *)(a4 + 8) = 0LL;
    }

    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }

void sub_10000AF6C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000AF88()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_ctype);
}

void sub_10000AFC0(_Unwind_Exception *a1)
{
}

uint64_t sub_10000AFD4(uint64_t a1, char *a2, char *a3, BOOL a4)
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

void sub_10000B070( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000B08C(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40LL))(*(void *)(a1 + 24), a2);
    unsigned __int8 v5 = *(_BYTE **)(a1 + 72);
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
          unsigned __int8 v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }

        goto LABEL_46;
      }

void **sub_10000B2B8(uint64_t *a1, __int128 *a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = (unint64_t)*(result - 1);
  if (v7 >= v6)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - *a1) >> 4);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555LL) {
      sub_100006CB4();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 4);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v14 = 0x555555555555555LL;
    }
    else {
      unint64_t v14 = v12;
    }
    v19[4] = result;
    if (v14) {
      unint64_t v15 = (char *)sub_10000B57C((uint64_t)result, v14);
    }
    else {
      unint64_t v15 = 0LL;
    }
    unint64_t v16 = &v15[48 * v11];
    v19[0] = v15;
    v19[1] = v16;
    std::locale v19[3] = &v15[48 * v14];
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
    v19[2] = v16 + 48;
    sub_10000B508(a1, v19);
    uint64_t v10 = a1[1];
    uint64_t result = sub_10000B6F8(v19);
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
    *(void *)(v7 + 40) = *((void *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((void *)a2 + 4) = 0LL;
    *((void *)a2 + 5) = 0LL;
    *((void *)a2 + 3) = 0LL;
    uint64_t v10 = v7 + 48;
    a1[1] = v7 + 48;
  }

  a1[1] = v10;
  return result;
}

void sub_10000B40C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_10000B420(uint64_t a1, char *a2, char *a3)
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

void sub_10000B4A0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000B4BC()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_range);
}

void sub_10000B4F4(_Unwind_Exception *a1)
{
}

uint64_t sub_10000B508(uint64_t *a1, void *a2)
{
  uint64_t result = sub_10000B5C0((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_10000B57C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556LL) {
    sub_100004930();
  }
  return operator new(48 * a2);
}

uint64_t sub_10000B5C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v16 = a6;
  *((void *)&v16 + 1) = a7;
  __int128 v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      __int128 v10 = *(_OWORD *)(a3 - 48);
      *(void *)(v9 - 32) = *(void *)(a3 - 32);
      *(_OWORD *)(v9 - 48) = v10;
      *(void *)(a3 - 40) = 0LL;
      *(void *)(a3 - 32) = 0LL;
      *(void *)(a3 - 48) = 0LL;
      __int128 v11 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v11;
      v9 -= 48LL;
      *(void *)(a3 - 16) = 0LL;
      *(void *)(a3 - 8) = 0LL;
      *(void *)(a3 - 24) = 0LL;
      v7 -= 48LL;
      a3 -= 48LL;
    }

    while (a3 != a5);
    *((void *)&v16 + 1) = v9;
  }

  char v14 = 1;
  sub_10000B674((uint64_t)v13);
  return a6;
}

uint64_t sub_10000B674(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_10000B6A8((uint64_t *)a1);
  }
  return a1;
}

void sub_10000B6A8(uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_1000097C0(v3, v1);
      v1 += 48LL;
    }

    while (v1 != v2);
  }

void **sub_10000B6F8(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_10000B728(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 48;
    sub_1000097C0(v4, i - 48);
  }

void *sub_10000B76C(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_100004930();
  }
  return operator new(2 * a2);
}

void *sub_10000B79C(void *a1)
{
  *a1 = &off_10001C5C8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_10000B7E0(void *__p)
{
  void *__p = &off_10001C5C8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_10000B824(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24LL * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_10000B854(void *a1)
{
  *a1 = &off_10001C5C8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_10000B898(void *__p)
{
  void *__p = &off_10001C5C8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_10000B8DC(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24LL * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + 8) = *(void *)(a2 + 16);
  *(_BYTE *)(v2 + 16) = 1;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_10000B914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, char a7)
{
  char v14 = operator new(0x10uLL);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(v15 + 8);
  *char v14 = &off_10001C550;
  v14[1] = v16;
  *(void *)(v15 + 8) = 0LL;
  __int128 v17 = operator new(0x38uLL);
  LODWORD(v16) = *(_DWORD *)(a1 + 32);
  uint64_t v18 = *(void *)(a4 + 8);
  *__int128 v17 = &off_10001C9E8;
  v17[1] = v18;
  v17[2] = v14;
  v17[3] = a2;
  v17[4] = a3;
  *((_DWORD *)v17 + 10) = v16;
  *((_DWORD *)v17 + 11) = a5;
  *((_DWORD *)v17 + 12) = a6;
  *((_BYTE *)v17 + 52) = a7;
  *(void *)(a4 + 8) = 0LL;
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &off_10001CA78;
  result[1] = v17;
  *(void *)(*(void *)(a1 + 56) + 8LL) = result;
  *(void *)(a1 + 56) = v17[2];
  *(void *)(a4 + 8) = v17;
  *(_DWORD *)(a1 + 32) = v16 + 1;
  return result;
}

void sub_10000BA00(_Unwind_Exception *a1)
{
}

unsigned __int8 *sub_10000BA48(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
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
            sub_10000BAE4();
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

void sub_10000BAE4()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badbrace);
}

void sub_10000BB1C(_Unwind_Exception *a1)
{
}

void sub_10000BB30()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brace);
}

void sub_10000BB68(_Unwind_Exception *a1)
{
}

void *sub_10000BB7C(void *a1)
{
  *a1 = &off_10001CA48;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  *a1 = &off_10001C5C8;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  return a1;
}

void sub_10000BBE4(void *__p)
{
  void *__p = &off_10001CA48;
  uint64_t v2 = __p[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  void *__p = &off_10001C5C8;
  uint64_t v3 = __p[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  operator delete(__p);
}

unsigned int *sub_10000BC4C(unsigned int *result, void *a2)
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
      return sub_10000BE00(result, a2);
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

unsigned int *sub_10000BD00(unsigned int *result, int a2, void *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((void *)result + 2);
  }

  else
  {
    a3[10] = *((void *)result + 1);
    return sub_10000BE00(result, a3);
  }

  return result;
}

void *sub_10000BD30(void *a1)
{
  *a1 = &off_10001CA48;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  *a1 = &off_10001C5C8;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  return a1;
}

void sub_10000BD98(void *__p)
{
  void *__p = &off_10001CA48;
  uint64_t v2 = __p[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  void *__p = &off_10001C5C8;
  uint64_t v3 = __p[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  operator delete(__p);
}

unsigned int *sub_10000BE00(unsigned int *result, void *a2)
{
  unsigned int v2 = result[11];
  *(void *)(a2[7] + 16LL * result[10] + 8) = a2[2];
  unsigned int v3 = result[12];
  if (v2 != v3)
  {
    uint64_t v4 = v2 - 1;
    uint64_t v5 = a2[3];
    uint64_t v6 = v3 - 1 - v4;
    uint64_t v7 = a2[4] + 24LL * v4 + 8;
    do
    {
      *(void *)(v7 - 8) = v5;
      *(void *)uint64_t v7 = v5;
      *(_BYTE *)(v7 + 8) = 0;
      v7 += 24LL;
      --v6;
    }

    while (v6);
  }

  return result;
}

uint64_t sub_10000BE5C(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_10000BE70(void *a1)
{
  *a1 = &off_10001CA48;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  *a1 = &off_10001C5C8;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  return a1;
}

void sub_10000BED8(void *__p)
{
  void *__p = &off_10001CA48;
  uint64_t v2 = __p[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  void *__p = &off_10001C5C8;
  uint64_t v3 = __p[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  operator delete(__p);
}

void sub_10000BF40(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t sub_10000BF4C(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8LL;
  if (a2) {
    uint64_t v3 = 16LL;
  }
  *(void *)(a3 + 80) = *(void *)(result + v3);
  return result;
}

uint64_t sub_10000BF78(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

uint64_t sub_10000BF8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  do
  {
    uint64_t v5 = a2;
    a2 = sub_10000C020(a1, a2, a3);
  }

  while (v5 != a2);
  return v5;
}

void sub_10000BFD4()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_empty);
}

void sub_10000C00C(_Unwind_Exception *a1)
{
}

unsigned __int8 *sub_10000C020(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = *(_DWORD *)(a1 + 28);
  BOOL v8 = (unsigned __int8 *)sub_10000C0A8(a1, a2, a3);
  else {
    return sub_10000C1B8(a1, v8, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
  }
}

char *sub_10000C0A8(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = sub_10000C358(a1, (char *)a2, a3);
  int v7 = v6;
  if ((char *)a2 == v6 && (char *)a2 != a3 && (char *)(a2 + 1) != a3)
  {
    uint64_t v9 = (uint64_t)v6;
    if (*(_BYTE *)a2 == 92) {
      uint64_t v9 = a2 + 2LL * (*(_BYTE *)(a2 + 1) == 40);
    }
    if (v9 == a2)
    {
      if (*(_BYTE *)a2 == 92)
      {
        int v12 = sub_10000C5A0(a1, *(_BYTE *)(a2 + 1));
        uint64_t v13 = 2LL;
        if (!v12) {
          uint64_t v13 = 0LL;
        }
        return (char *)(a2 + v13);
      }
    }

    else
    {
      sub_100007884((void *)a1);
      int v10 = *(_DWORD *)(a1 + 28);
      __int128 v11 = (char *)sub_10000BF8C(a1, v9, (uint64_t)a3);
      if (v11 == a3 || v11 + 1 == a3 || *v11 != 92 || v11[1] != 41) {
        sub_100005FCC();
      }
      int v7 = v11 + 2;
      sub_1000078E8((void *)a1, v10);
    }
  }

  return v7;
}

unsigned __int8 *sub_10000C1B8( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6 = a2;
  if (a2 != a3)
  {
    int v11 = *a2;
    if (v11 == 42)
    {
      sub_10000B914(a1, 0LL, -1LL, a4, a5, a6, 1);
      return ++v6;
    }

    if (a2 + 1 != a3 && v11 == 92 && a2[1] == 123)
    {
      uint64_t v13 = a2 + 2;
      int v25 = 0;
      char v14 = sub_10000BA48(a1, a2 + 2, a3, &v25);
      if (v13 == v14) {
        goto LABEL_16;
      }
      if (v14 != a3)
      {
        uint64_t v15 = v14 + 1;
        int v16 = *v14;
        if (v16 == 44)
        {
          int v24 = -1;
          __int128 v17 = sub_10000BA48(a1, v15, a3, &v24);
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
              sub_10000BAE4();
            }

            uint64_t v6 = &v17[2 * (v17[1] == 125)];
            int v20 = a5;
            int v21 = a6;
            uint64_t v22 = a1;
LABEL_23:
            sub_10000B914(v22, v18, v19, a4, v20, v21, 1);
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

      sub_10000BB30();
    }
  }

  return v6;
}

char *sub_10000C358(uint64_t a1, char *a2, char *a3)
{
  if (a2 == a3)
  {
    uint64_t result = sub_10000C460(a1, a2, a3);
    if (result != a2) {
      return result;
    }
    return sub_100007774(a1, a2, a3);
  }

  int v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1LL << (v6 - 46)) & 0x600000000001LL) == 0))
  {
    sub_100007F30(a1, (char)v6);
    return a2 + 1;
  }

  uint64_t result = sub_10000C460(a1, a2, a3);
  if (result != a2) {
    return result;
  }
  if (*a2 != 46) {
    return sub_100007774(a1, a2, a3);
  }
  uint64_t v9 = operator new(0x10uLL);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(v10 + 8);
  *uint64_t v9 = &off_10001CB50;
  v9[1] = v11;
  *(void *)(v10 + 8) = v9;
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return a2 + 1;
}

_BYTE *sub_10000C460(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3 && a2 + 1 != a3 && *a2 == 92)
  {
    int v4 = (char)a2[1];
    if ((v4 - 36) <= 0x3A && ((1LL << (a2[1] - 36)) & 0x580000000000441LL) != 0)
    {
      sub_100007F30(a1, (char)v4);
      v3 += 2;
    }
  }

  return v3;
}

void *sub_10000C4D8(void *a1)
{
  *a1 = &off_10001C5C8;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_10000C51C(void *__p)
{
  void *__p = &off_10001C5C8;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_10000C560(uint64_t result, uint64_t a2)
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

  *(void *)(a2 + 80) = v3;
  return result;
}

uint64_t sub_10000C5A0(uint64_t a1, unsigned __int8 a2)
{
  return 1LL;
}

unsigned __int8 *sub_10000C5FC(uint64_t a1, char *a2, char *a3)
{
  int v6 = sub_10000C658(a1, a2, a3);
  do
  {
    int v7 = v6;
    int v6 = sub_10000C658(a1, (char *)v6, a3);
  }

  while (v7 != v6);
  return v7;
}

unsigned __int8 *sub_10000C658(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = *(_DWORD *)(a1 + 28);
  BOOL v8 = sub_10000C7E8(a1, a2, a3);
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
      sub_100007884((void *)a1);
      int v16 = *(_DWORD *)(a1 + 28);
      ++*(_DWORD *)(a1 + 36);
      __int128 v17 = (char *)sub_100005028(a1, a2 + 1, a3);
      if (v17 == a3 || (uint64_t v18 = v17, *v17 != 41)) {
        sub_100005FCC();
      }
      sub_1000078E8((void *)a1, v16);
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
      *(void *)(v13 + 8) = v11;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
      uint64_t v9 = (unsigned __int8 *)(a2 + 1);
      return sub_100005BCC(a1, v9, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
  }

  return (unsigned __int8 *)a2;
}

char *sub_10000C7E8(uint64_t a1, char *a2, char *a3)
{
  uint64_t result = sub_10000C8A0(a1, a2, a3);
  if (result == a2)
  {
    uint64_t result = sub_10000C928(a1, a2, a3);
    if (result == a2)
    {
      if (a2 == a3 || *a2 != 46)
      {
        return sub_100007774(a1, a2, a3);
      }

      else
      {
        int v7 = operator new(0x10uLL);
        uint64_t v8 = *(void *)(a1 + 56);
        uint64_t v9 = *(void *)(v8 + 8);
        *int v7 = &off_10001CB50;
        v7[1] = v9;
        *(void *)(v8 + 8) = v7;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
        return a2 + 1;
      }
    }
  }

  return result;
}

char *sub_10000C8A0(uint64_t a1, char *a2, char *a3)
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

    sub_100007F30(a1, *a2);
    ++v3;
  }

  return v3;
}

char *sub_10000C928(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    int v4 = a2 + 1;
    if (v3 + 1 != a3 && *v3 == 92)
    {
      int v5 = *v4;
      signed __int8 v6 = *v4;
      BOOL v7 = (v5 - 36) > 0x3A || ((1LL << (*v4 - 36)) & 0x5800000080004F1LL) == 0;
      if (v7 && (v5 - 123) >= 3)
      {
        if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
        {
          return sub_10000A4B0(a1, v4, a3, 0LL);
        }

        else
        {
          int v9 = sub_10000C5A0(a1, v6);
          uint64_t v10 = 2LL;
          if (!v9) {
            uint64_t v10 = 0LL;
          }
          v3 += v10;
        }
      }

      else
      {
        sub_100007F30(a1, v6);
        v3 += 2;
      }
    }
  }

  return v3;
}

void sub_10000C9EC(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_10000CA2C((uint64_t *)v2);
    operator delete(**a1);
  }

void sub_10000CA2C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24LL)
  {
  }

  a1[1] = v2;
}

std::string *sub_10000CA78(std::string *a1, char *a2)
{
  a1->__r_.__value_.__r.__words[0] = 0LL;
  a1->__r_.__value_.__l.__size_ = 0LL;
  a1->__r_.__value_.__l.__cap_ = 0LL;
  LODWORD(v3) = a2[23];
  BOOL v4 = (int)v3 < 0;
  uint64_t v5 = *((void *)a2 + 1);
  uint64_t v3 = v3;
  if (v4) {
    uint64_t v3 = v5;
  }
  sub_10000CADC(a1, a2, &a2[v3]);
  return a1;
}

void sub_10000CAC0(_Unwind_Exception *exception_object)
{
}

std::string *sub_10000CADC(std::string *this, char *a2, char *a3)
{
  BOOL v4 = a2;
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
    uint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    std::string::size_type v6 = HIBYTE(cap);
  }

  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__s.__size_;
    std::string::size_type v9 = 22LL;
    uint64_t v10 = this;
  }

  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0LL, 0LL);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = this->__r_.__value_.__s.__size_;
    }

    char v14 = this;
    if ((v6 & 0x80) != 0) {
      char v14 = (std::string *)this->__r_.__value_.__r.__words[0];
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
    sub_100009A74(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0) {
      BOOL v12 = __p;
    }
    else {
      BOOL v12 = (void **)__p[0];
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

void sub_10000CC34( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000CC50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
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
  int v9 = sub_10000CD44(a4, a1, a2, (uint64_t)__p, a5 | 0x1040u);
  sub_10000CF1C(a3, a1, a2, (uint64_t *)__p, (v5 & 0x800) != 0);
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
  *(void *)(a3 + 8) = *(void *)a3;
  return result;
}

void sub_10000CD28( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000CD44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if ((a5 & 0x80) != 0) {
    int v9 = a5 & 0xFFA;
  }
  else {
    int v9 = a5;
  }
  sub_100006680(a4, *(_DWORD *)(a1 + 28) + 1, a2, a3, (unsigned __int16)(v9 & 0x800) >> 11);
  if (sub_10000D0A8(a1, a2, a3, (uint64_t *)a4, v9, (v9 & 0x800) == 0))
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
    *(_BYTE *)(a4 + 88) = v12 != *(void *)(a4 + 80);
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
        sub_100006AF0( (char **)a4,  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3),  (__int128 *)(a4 + 24));
        int v16 = sub_10000D0A8(a1, v15, a3, (uint64_t *)a4, v14, 0);
        uint64_t v18 = *(void *)a4;
        uint64_t v17 = *(void *)(a4 + 8);
        if (v16) {
          break;
        }
        sub_100006AF0((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 3), (__int128 *)(a4 + 24));
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

void sub_10000CF1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  uint64_t v10 = a4[6];
  sub_10000ED98(a1, 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3));
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
      *(void *)(*(void *)a1 + v12 + 8) = a2 + v19[1] - v10;
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
  *(_BYTE *)(a1 + 40) = 0;
  uint64_t v23 = a2 + a4[6] - v10;
  *(void *)(a1 + 48) = v23;
  *(void *)(a1 + 56) = a2 + a4[7] - v10;
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a4 + 64);
  *(void *)(a1 + 72) = a2 + a4[9] - v10;
  *(void *)(a1 + 80) = a2 + a4[10] - v10;
  *(_BYTE *)(a1 + 88) = *((_BYTE *)a4 + 88);
  if ((a5 & 1) == 0) {
    *(void *)(a1 + 104) = v23;
  }
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a4 + 96);
}

uint64_t sub_10000D0A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0) {
    return sub_1000066F0(a1, a2, a3, a4, a5, a6);
  }
  if (*(_DWORD *)(a1 + 28)) {
    return sub_10000D600(a1, a2, a3, a4, a5, a6);
  }
  return sub_10000D0C8(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_10000D0C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v59 = 0u;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)uint64_t v55 = 0;
    memset(&v55[8], 0, 32);
    __int128 v56 = 0uLL;
    *(_OWORD *)std::string __p = 0uLL;
    memset(v58, 0, 21);
    sub_10000DB68(&v59, (uint64_t)v55);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    if (*(void *)&v55[32])
    {
      *(void *)&__int128 v56 = *(void *)&v55[32];
      operator delete(*(void **)&v55[32]);
    }

    uint64_t v12 = *((void *)&v59 + 1);
    unint64_t v13 = *((void *)&v61 + 1) + v61 - 1;
    unint64_t v14 = v13 / 0x2A;
    uint64_t v15 = *(void *)(*((void *)&v59 + 1) + 8 * (v13 / 0x2A));
    unint64_t v16 = 3 * (v13 % 0x2A);
    uint64_t v17 = v15 + 32 * v16;
    *(_DWORD *)uint64_t v17 = 0;
    *(void *)(v17 + 8) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    sub_100006D88(*(void *)(v12 + 8 * v14) + 32 * v16 + 56, *(unsigned int *)(a1 + 32));
    char v53 = 0;
    unsigned int v18 = 0;
    uint64_t v51 = 0LL;
    uint64_t v52 = a2;
    uint64_t v19 = a3 - a2;
    uint64_t v20 = *((void *)&v61 + 1);
    uint64_t v21 = *((void *)&v59 + 1);
    unint64_t v22 = *((void *)&v61 + 1) + v61 - 1;
    unint64_t v23 = v22 / 0x2A;
    unint64_t v24 = 3 * (v22 % 0x2A);
    *(void *)(*(void *)(*((void *)&v59 + 1) + 8 * v23) + 32 * v24 + 80) = v6;
    uint64_t v25 = *(void *)(v21 + 8 * v23) + 32 * v24;
    *(_DWORD *)(v25 + 88) = a5;
    *(_BYTE *)(v25 + 92) = a6;
    while (2)
    {
      unint64_t v27 = v20 + v61 - 1;
      uint64_t v28 = *(void *)(*((void *)&v59 + 1) + 8 * (v27 / 0x2A));
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
          BOOL v35 = (a5 & 0x1000) == 0 || v33 == a3;
          BOOL v36 = v33 != v52 || (a5 & 0x20) == 0;
          if (!v36 || !v35) {
            goto LABEL_37;
          }
          uint64_t v37 = v33 - *(void *)(v28 + 96 * v29 + 8);
          uint64_t v38 = v51;
          if (v38 != v19)
          {
            uint64_t v51 = v38;
            sub_10000DC68(&v59);
            char v53 = 1;
            goto LABEL_38;
          }

          __int16 v39 = (void **)*((void *)&v59 + 1);
          uint64_t v40 = v60;
          if ((void)v60 == *((void *)&v59 + 1))
          {
            uint64_t v40 = *((void *)&v59 + 1);
          }

          else
          {
            __int16 v41 = (void *)(*((void *)&v59 + 1) + 8 * ((unint64_t)v61 / 0x2A));
            int v42 = (void *)(*v41 + 96 * ((unint64_t)v61 % 0x2A));
            unint64_t v43 = *(void *)(*((void *)&v59 + 1) + 8 * ((*((void *)&v61 + 1) + (void)v61) / 0x2AuLL))
                + 96 * ((*((void *)&v61 + 1) + (void)v61) % 0x2AuLL);
            if (v42 != (void *)v43)
            {
              do
              {
                sub_1000071B8((uint64_t)&v61 + 8, v42);
                v42 += 12;
                if ((void *)((char *)v42 - *v41) == (void *)4032)
                {
                  int v44 = (void *)v41[1];
                  ++v41;
                  int v42 = v44;
                }
              }

              while (v42 != (void *)v43);
              __int16 v39 = (void **)*((void *)&v59 + 1);
              uint64_t v40 = v60;
            }
          }

          *((void *)&v61 + 1) = 0LL;
          unint64_t v47 = v40 - (void)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              __int16 v39 = (void **)(*((void *)&v59 + 1) + 8LL);
              *((void *)&v59 + 1) = v39;
              unint64_t v47 = v60 - (void)v39;
            }

            while ((void)v60 - (void)v39 > 0x10uLL);
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

          *(void *)&__int128 v61 = v48;
LABEL_53:
          char v53 = 1;
          uint64_t v51 = v19;
LABEL_38:
          uint64_t v20 = *((void *)&v61 + 1);
          if (*((void *)&v61 + 1)) {
            continue;
          }
          if ((v53 & 1) != 0)
          {
            uint64_t v49 = *a4;
            *(void *)uint64_t v49 = v52;
            *(void *)(v49 + 8) = v52 + v51;
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
          sub_10000DCE8((uint64_t)&v59, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          sub_10000DC68(&v59);
          goto LABEL_38;
        case 0xFFFFFC20:
          __int128 v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)uint64_t v55 = *(_OWORD *)v30;
          *(_OWORD *)&v55[16] = v45;
          __int128 v56 = 0uLL;
          *(void *)&v55[32] = 0LL;
          sub_100007524( &v55[32],  *(__int128 **)(v28 + 96 * v29 + 32),  *(__int128 **)(v28 + 96 * v29 + 40),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v28 + 96 * v29 + 40) - *(void *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0LL;
          __p[1] = 0LL;
          v58[0] = 0LL;
          sub_1000075A0( (char *)__p,  *(__int128 **)(v28 + 96 * v29 + 56),  *(__int128 **)(v28 + 96 * v29 + 64),  (uint64_t)(*(void *)(v28 + 96 * v29 + 64) - *(void *)(v28 + 96 * v29 + 56)) >> 4);
          uint64_t v46 = *v32;
          *(void *)((char *)&v58[1] + 5) = *(void *)(v30 + 85);
          v58[1] = v46;
          (*(void (**)(void, uint64_t, unint64_t))(*(void *)*v32 + 24LL))( *v32,  1LL,  v28 + 96 * v29);
          (*(void (**)(void, void, _BYTE *))(*(void *)v58[1] + 24LL))(v58[1], 0LL, v55);
          sub_10000DB68(&v59, (uint64_t)v55);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }

          if (*(void *)&v55[32])
          {
            *(void *)&__int128 v56 = *(void *)&v55[32];
            operator delete(*(void **)&v55[32]);
          }

          goto LABEL_38;
        default:
          sub_100006E04();
      }

      break;
    }
  }

  sub_10000E908(&v59);
  return v6;
}

void sub_10000D5B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, void *__p, uint64_t a22)
{
}

uint64_t sub_10000D600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  v54 = 0LL;
  uint64_t v55 = 0LL;
  v56[0] = 0LL;
  *(_DWORD *)uint64_t v51 = 0;
  memset(&v51[8], 0, 32);
  __int128 v52 = 0u;
  memset(v53, 0, 37);
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6) {
    goto LABEL_43;
  }
  *(void *)&__int128 v49 = a3;
  *((void *)&v49 + 1) = a3;
  char v50 = 0;
  *(_DWORD *)uint64_t v46 = 0;
  memset(&v46[8], 0, 48);
  *(_OWORD *)std::string __p = 0uLL;
  memset(v48, 0, 21);
  uint64_t v55 = (_OWORD *)sub_100006E50((uint64_t *)&v54, (uint64_t)v46);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if (*(void *)&v46[32])
  {
    *(void *)&v46[40] = *(void *)&v46[32];
    operator delete(*(void **)&v46[32]);
  }

  __int16 v41 = a4;
  uint64_t v11 = v55;
  *((_DWORD *)v55 - 24) = 0;
  *((void *)v11 - 11) = a2;
  *((void *)v11 - 10) = a2;
  *((void *)v11 - 9) = a3;
  sub_100006D4C((uint64_t)(v11 - 4), *(unsigned int *)(a1 + 28), &v49);
  sub_100006D88((uint64_t)v55 - 40, *(unsigned int *)(a1 + 32));
  uint64_t v42 = 0LL;
  char v43 = 0;
  unsigned int v12 = 0;
  uint64_t v13 = a3 - a2;
  unint64_t v14 = v55;
  *((void *)v55 - 2) = v6;
  *((_DWORD *)v14 - 2) = a5;
  *((_BYTE *)v14 - 4) = a6;
  do
  {
    BOOL v15 = (++v12 & 0xFFF) != 0 || (int)(v12 >> 12) < (int)v13;
    if (!v15) {
      sub_100006DB8();
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
        if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != a3) {
          goto LABEL_19;
        }
        uint64_t v26 = v19 - *((void *)v14 - 11);
        uint64_t v27 = v42;
        if ((v43 & (v42 >= v26)) == 0)
        {
          __int128 v28 = *(v14 - 5);
          *(_OWORD *)uint64_t v51 = *(_OWORD *)v18;
          *(_OWORD *)&v51[16] = v28;
          if (v51 != v18)
          {
            sub_10000EA98( &v51[32],  *((__int128 **)v14 - 8),  *((__int128 **)v14 - 7),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v14 - 7) - *((void *)v14 - 8)) >> 3));
            sub_10000EC4C( v53,  *((uint64_t **)v14 - 5),  *((uint64_t **)v14 - 4),  (uint64_t)(*((void *)v14 - 4) - *((void *)v14 - 5)) >> 4);
          }

          unint64_t v29 = (void *)*v17;
          *(void **)((char *)&v53[3] + 5) = *(void **)((char *)v14 - 11);
          v53[3] = v29;
          uint64_t v27 = v26;
        }

        uint64_t v30 = v55;
        if (v27 == v13)
        {
          uint64_t v31 = (uint64_t)v54;
          while (v30 != (void *)v31)
          {
            v30 -= 12;
            sub_1000071B8((uint64_t)v56, v30);
          }

          uint64_t v55 = (_OWORD *)v31;
          char v43 = 1;
          uint64_t v42 = a3 - a2;
        }

        else
        {
          uint64_t v42 = v27;
          char v32 = v55 - 6;
          sub_1000071B8((uint64_t)v56, (void *)v55 - 12);
          uint64_t v55 = v32;
          char v43 = 1;
        }

        break;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        break;
      case 0xFFFFFC1F:
LABEL_19:
        uint64_t v20 = v55 - 6;
        sub_1000071B8((uint64_t)v56, (void *)v55 - 12);
        uint64_t v55 = v20;
        break;
      case 0xFFFFFC20:
        __int128 v21 = *(v14 - 5);
        *(_OWORD *)uint64_t v46 = *(_OWORD *)v18;
        *(_OWORD *)&v46[16] = v21;
        memset(&v46[32], 0, 24);
        sub_100007524( &v46[32],  *((__int128 **)v14 - 8),  *((__int128 **)v14 - 7),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v14 - 7) - *((void *)v14 - 8)) >> 3));
        __p[0] = 0LL;
        __p[1] = 0LL;
        v48[0] = 0LL;
        sub_1000075A0( (char *)__p,  *((__int128 **)v14 - 5),  *((__int128 **)v14 - 4),  (uint64_t)(*((void *)v14 - 4) - *((void *)v14 - 5)) >> 4);
        uint64_t v22 = (void *)*v17;
        *(void *)((char *)&v48[1] + 5) = *(void *)((char *)v14 - 11);
        v48[1] = v22;
        (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v17 + 24LL))(*v17, 1LL, v14 - 6);
        (*(void (**)(void, void, _BYTE *))(*(void *)v48[1] + 24LL))(v48[1], 0LL, v46);
        unint64_t v23 = v55;
        if ((unint64_t)v55 >= v56[0])
        {
          uint64_t v55 = (_OWORD *)sub_100006E50((uint64_t *)&v54, (uint64_t)v46);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }

        else
        {
          __int128 v24 = *(_OWORD *)&v46[16];
          *uint64_t v55 = *(_OWORD *)v46;
          v23[1] = v24;
          *((void *)v23 + 4) = 0LL;
          *((void *)v23 + 5) = 0LL;
          *((void *)v23 + 6) = 0LL;
          *((void *)v23 + 7) = 0LL;
          v23[2] = *(_OWORD *)&v46[32];
          *((void *)v23 + 6) = *(void *)&v46[48];
          memset(&v46[32], 0, 24);
          *((void *)v23 + 8) = 0LL;
          *((void *)v23 + 9) = 0LL;
          *(_OWORD *)((char *)v23 + 56) = *(_OWORD *)__p;
          *((void *)v23 + 9) = v48[0];
          __p[0] = 0LL;
          __p[1] = 0LL;
          v48[0] = 0LL;
          uint64_t v25 = v48[1];
          *(void *)((char *)v23 + 85) = *(void *)((char *)&v48[1] + 5);
          *((void *)v23 + 10) = v25;
          uint64_t v55 = v23 + 6;
        }

        if (*(void *)&v46[32])
        {
          *(void *)&v46[40] = *(void *)&v46[32];
          operator delete(*(void **)&v46[32]);
        }

        break;
      default:
        sub_100006E04();
    }

    unint64_t v14 = v55;
  }

  while (v54 != v55);
  if ((v43 & 1) != 0)
  {
    uint64_t v33 = *v41;
    *(void *)uint64_t v33 = a2;
    *(void *)(v33 + 8) = a2 + v42;
    *(_BYTE *)(v33 + 16) = 1;
    if ((void)v52 != *(void *)&v51[32])
    {
      unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v52 - *(void *)&v51[32]) >> 3);
      BOOL v35 = (_BYTE *)(*(void *)&v51[32] + 16LL);
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

    uint64_t v39 = 1LL;
  }

  else
  {
LABEL_43:
    uint64_t v39 = 0LL;
  }

  if (v53[0])
  {
    v53[1] = v53[0];
    operator delete(v53[0]);
  }

  if (*(void *)&v51[32])
  {
    *(void *)&__int128 v52 = *(void *)&v51[32];
    operator delete(*(void **)&v51[32]);
  }

  *(void *)uint64_t v51 = &v54;
  sub_100007650((void ***)v51);
  return v39;
}

void sub_10000DB08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *__p, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35)
{
  a35 = v35 - 120;
  sub_100007650((void ***)&a35);
  _Unwind_Resume(a1);
}

__n128 sub_10000DB68(void *a1, uint64_t a2)
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
    sub_10000DDD8(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }

  unint64_t v8 = *(void *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  __int128 v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(void *)(v8 + 40) = 0LL;
  *(void *)(v8 + 48) = 0LL;
  *(void *)(v8 + 32) = 0LL;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(v8 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 40) = 0LL;
  *(void *)(a2 + 48) = 0LL;
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
  *(void *)(v8 + 80) = v11;
  ++a1[5];
  return result;
}

uint64_t sub_10000DC68(void *a1)
{
  uint64_t v2 = a1 + 5;
  unint64_t v3 = a1[5] + a1[4] - 1LL;
  sub_1000071B8((uint64_t)(a1 + 5), (void *)(*(void *)(a1[1] + 8 * (v3 / 0x2A)) + 96 * (v3 % 0x2A)));
  --*v2;
  return sub_10000E57C(a1, 1);
}

int64x2_t sub_10000DCE8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    sub_10000E5F0((void **)a1);
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
  *(_OWORD *)(v7 - 80) = v8;
  *(void *)(v7 - 56) = 0LL;
  *(void *)(v7 - 48) = 0LL;
  *(void *)(v7 - 64) = 0LL;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(void *)(v7 - 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 40) = 0LL;
  *(void *)(a2 + 48) = 0LL;
  *(void *)(v7 - 40) = 0LL;
  *(void *)(v7 - 32) = 0LL;
  *(void *)(v7 - 24) = 0LL;
  *(_OWORD *)(v7 - 40) = *(_OWORD *)(a2 + 56);
  *(void *)(v7 - 24) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0LL;
  *(void *)(a2 + 64) = 0LL;
  *(void *)(a2 + 72) = 0LL;
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(v7 - 11) = *(void *)(a2 + 85);
  *(void *)(v7 - 16) = v9;
  int64x2_t result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_1000182F0);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void sub_10000DDD8(void *a1)
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
      unint64_t v34 = (char *)sub_10000E548(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      char v38 = (uint64_t *)a1[1];
      __int128 v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        __int128 v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v40 = 8 * (v39 >> 3);
        __int16 v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)__int16 v41 = v42;
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
      sub_10000E0EC(a1, &v54);
      return;
    }

    *(void *)&__int128 v54 = operator new(0xFC0uLL);
    sub_10000E200((uint64_t)a1, &v54);
    int v44 = (void *)a1[1];
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
      unint64_t v34 = (char *)sub_10000E548((uint64_t)(a1 + 3), v46);
      uint64_t v35 = &v34[8 * (v46 >> 2)];
      uint64_t v37 = &v34[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      __int128 v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        __int128 v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v50 = 8 * (v49 >> 3);
        uint64_t v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)uint64_t v51 = v52;
          v51 += 8;
          v50 -= 8LL;
        }

        while (v50);
      }

LABEL_30:
      char v43 = (char *)*a1;
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
  __int128 v56 = a1 + 3;
  *(void *)&__int128 v54 = sub_10000E548((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&__int128 v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  char v53 = operator new(0xFC0uLL);
  sub_10000E31C(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7LL - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8LL;
    sub_10000E430((uint64_t)&v54, v27);
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

void sub_10000E0A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_10000E0EC(void *a1, void *a2)
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
      uint64_t v19 = (char *)sub_10000E548(v4, v18);
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

void sub_10000E200(uint64_t a1, void *a2)
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
      uint64_t v14 = (char *)sub_10000E548(v6, v12);
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
      *(void *)(a1 + 8) = v5;
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

      *(void *)(a1 + 8) = v5;
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

void sub_10000E31C(void *a1, void *a2)
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
      uint64_t v17 = (char *)sub_10000E548(a1[4], v16);
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

void sub_10000E430(uint64_t a1, void *a2)
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
      uint64_t v13 = (char *)sub_10000E548(*(void *)(a1 + 32), v11);
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
      *(void *)(a1 + 8) = v5;
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

      *(void *)(a1 + 8) = v5;
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

void *sub_10000E548(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100004930();
  }
  return operator new(8 * a2);
}

uint64_t sub_10000E57C(void *a1, int a2)
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

void sub_10000E5F0(void **a1)
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
      std::string __p = sub_10000E548(v7, v11);
      char v43 = (char *)__p;
      int v44 = (char *)__p;
      uint64_t v45 = (char *)__p + 8 * v12;
      __int16 v41 = operator new(0xFC0uLL);
      sub_10000E31C(&__p, &v41);
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
              uint64_t v24 = (char *)sub_10000E548((uint64_t)v46, v23);
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
              char v43 = &v24[8 * (v23 >> 2)];
              int v44 = v14;
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
              char v43 = v22;
              int v44 = &v20[v21];
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
      char v43 = v33;
      char v38 = (char *)a1[3];
      uint64_t v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      int v44 = v13;
      uint64_t v45 = v38;
      if (v14 - v37 == 8) {
        uint64_t v40 = 21LL;
      }
      else {
        uint64_t v40 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v40;
      if (v13 != v33) {
        int v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8LL];
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
        sub_10000E0EC(a1, &__p);
        unint64_t v34 = a1[2];
        std::string __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }

      else
      {
        std::string __p = operator new(0xFC0uLL);
      }

      sub_10000E200((uint64_t)a1, &__p);
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
    sub_10000E200((uint64_t)a1, &__p);
  }

void sub_10000E8BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10000E908(void *a1)
{
  uint64_t v2 = a1 + 5;
  uint64_t v3 = (void **)a1[1];
  unint64_t v4 = (void **)a1[2];
  if (v4 == v3)
  {
    unint64_t v4 = (void **)a1[1];
  }

  else
  {
    unint64_t v5 = a1[4];
    uint64_t v6 = &v3[v5 / 0x2A];
    uint64_t v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    unint64_t v8 = (unint64_t)v3[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        sub_1000071B8((uint64_t)v2, v7);
        v7 += 96;
        if (v7 - (_BYTE *)*v6 == 4032)
        {
          uint64_t v9 = (char *)v6[1];
          ++v6;
          uint64_t v7 = v9;
        }
      }

      while (v7 != (char *)v8);
      uint64_t v3 = (void **)a1[1];
      unint64_t v4 = (void **)a1[2];
    }
  }

  void *v2 = 0LL;
  unint64_t v10 = (char *)v4 - (char *)v3;
  if ((unint64_t)((char *)v4 - (char *)v3) >= 0x11)
  {
    do
    {
      operator delete(*v3);
      unint64_t v4 = (void **)a1[2];
      uint64_t v3 = (void **)(a1[1] + 8LL);
      a1[1] = v3;
      unint64_t v10 = (char *)v4 - (char *)v3;
    }

    while ((unint64_t)((char *)v4 - (char *)v3) > 0x10);
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
  while (v3 != v4)
  {
    uint64_t v13 = *v3++;
    operator delete(v13);
  }

  return sub_10000EA4C((uint64_t)a1);
}

uint64_t sub_10000EA4C(uint64_t a1)
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

char *sub_10000EA98(void *a1, __int128 *a2, __int128 *a3, unint64_t a4)
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
      sub_100006CB4();
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
    int64x2_t result = sub_100006C64(a1, v12);
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

char *sub_10000EC4C(void *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
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
      sub_100006CB4();
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    else {
      unint64_t v11 = v10;
    }
    int64x2_t result = sub_100007610(a1, v11);
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

  void *v13 = &v17[(void)v12];
  return result;
}

void sub_10000ED98(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_10000EDD4((void **)a1, v4);
  }

  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }

void sub_10000EDD4(void **a1, unint64_t a2)
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
      sub_100006CB4();
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
      unint64_t v12 = (char *)sub_100006CC8(v4, v11);
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

void *sub_10000EF3C(void *result, __int128 *a2)
{
  unint64_t v2 = result;
  uint64_t v3 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    int64x2_t result = sub_100004958((_BYTE *)result[1], *(void **)a2, *((void *)a2 + 1));
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

void sub_10000EF90(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_10000EF98(uint64_t *a1, __int128 *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_100006CB4();
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
  int64_t v18 = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)sub_100006CC8(v7, v9);
  }
  else {
    unint64_t v10 = 0LL;
  }
  unint64_t v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  __int128 v16 = v11;
  uint64_t v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_100004958(v11, *(void **)a2, *((void *)a2 + 1));
    unint64_t v11 = v16;
  }

  else
  {
    __int128 v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v11 = v12;
  }

  __int128 v16 = v11 + 24;
  sub_10000F0B8(a1, v15);
  uint64_t v13 = a1[1];
  sub_10000F240((uint64_t)v15);
  return v13;
}

void sub_10000F0A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_10000F0B8(uint64_t *a1, void *a2)
{
  uint64_t result = sub_10000F12C((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

uint64_t sub_10000F12C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24LL;
      *(void *)(a3 - 16) = 0LL;
      *(void *)(a3 - 8) = 0LL;
      *(void *)(a3 - 24) = 0LL;
      v7 -= 24LL;
      a3 -= 24LL;
    }

    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }

  char v13 = 1;
  sub_10000F1C8((uint64_t)v12);
  return a6;
}

uint64_t sub_10000F1C8(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_10000F1FC(a1);
  }
  return a1;
}

void sub_10000F1FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    v1 += 24LL;
  }

uint64_t sub_10000F240(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_10000F274(uint64_t a1, void **a2)
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

uint64_t sub_10000F2C8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_1000048A8();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    uint64_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000LL;
    *(void *)a1 = v6;
  }

  else
  {
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
    *(void *)a1 = 0LL;
    *(_BYTE *)(a1 + 23) = a2;
  }

  return a1;
}

uint64_t sub_10000F34C@<X0>(uint64_t a1@<X0>, std::stringbuf::string_type *a2@<X8>)
{
  *(void *)((char *)v6
  uint64_t v7 = v4;
  std::streambuf::~streambuf(&v8);
  return std::ios::~ios(&v9);
}

void sub_10000F400(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_10000F414(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  uint64_t v3 = a1 + 24;
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v5;
  *(void *)(a1 + 8) = 0LL;
  uint64_t v6 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
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

void sub_10000F518(_Unwind_Exception *a1)
{
}

uint64_t sub_10000F540(uint64_t a1)
{
  uint64_t v4 = a1 + 24;
  *(void *)(a1 + 16) = v3;
  std::streambuf::~streambuf(v4);
  std::ios::~ios(a1 + 128);
  return a1;
}

BOOL sub_10000F5C8(int a1)
{
  return ((a1 - 997) & 0xFFFFFFFD) != 0;
}

uint64_t sub_10000F5D8(int a1)
{
  uint64_t result = 1LL;
  if (a1 > 199)
  {
    return 0LL;
  }

  return result;
}

uint64_t sub_10000F628(int a1)
{
  uint64_t result = 1LL;
  if (a1 > 199)
  {
    return 0LL;
  }

  return result;
}

uint64_t sub_10000F678(int a1)
{
  uint64_t result = 1LL;
  if (a1 <= 99)
  {
    return 0LL;
  }

  if (a1 <= 199)
  {
    return 0LL;
  }

  return result;
}

BOOL sub_10000F6D0(int a1)
{
  return (a1 - 100) < 0x16 || (a1 - 3) <= 0x14;
}

BOOL sub_10000F6F8(int a1)
{
  return (a1 - 100) >= 0x16 && (a1 - 200) >= 2 && a1 != 999 && a1 != 997;
}

BOOL sub_10000F730(unsigned int a1)
{
  return a1 >= 0x18 && a1 - 200 >= 2 && a1 != 999 && a1 != 997;
}

uint64_t sub_10000F764(int a1)
{
  uint64_t result = 1LL;
  if (a1 <= 99)
  {
    return 0LL;
  }

  if (a1 > 199)
  {
  }

  else
  {
    unsigned int v3 = a1 - 100;
    if (v3 <= 0x13 && ((1 << v3) & 0xC6333) != 0) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_10000F7D4(int a1)
{
  uint64_t result = 1LL;
  if (a1 <= 99)
  {
    return 0LL;
  }

  return result;
}

BOOL sub_10000F818(unsigned int a1)
{
  return a1 >= 0x17 && a1 != 997 && a1 != 999;
}

uint64_t sub_10000F840(int a1)
{
  uint64_t result = 1LL;
  if (a1 > 199)
  {
    return 0LL;
  }

  return result;
}

uint64_t sub_10000F88C(int a1)
{
  uint64_t result = 1LL;
  if (a1 <= 99)
  {
    return 0LL;
  }

  if (a1 <= 199)
  {
    return 0LL;
  }

  if (a1 == 200 || a1 == 999 || a1 == 997) {
    return 0LL;
  }
  return result;
}

uint64_t sub_10000F8E0(int a1)
{
  if (a1 == 201) {
    unsigned int v1 = 2;
  }
  else {
    unsigned int v1 = a1 == 200;
  }
  if (a1 == 999) {
    return 999LL;
  }
  else {
    return v1;
  }
}

uint64_t sub_10000F908(uint64_t result)
{
  else {
    return result;
  }
}

uint64_t sub_10000F920@<X0>(uint64_t a1@<X0>, std::stringbuf::string_type *a2@<X8>)
{
  *(void *)((char *)v6
  uint64_t v7 = v4;
  std::streambuf::~streambuf(&v8);
  return std::ios::~ios(&v9);
}

void sub_10000F9D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_10000F9E8(uint64_t result)
{
  if ((_DWORD)result == 998) {
    unsigned int v1 = 998;
  }
  else {
    unsigned int v1 = 999;
  }
  else {
    return result;
  }
}

double sub_10000FA00@<D0>(int a1@<W0>, void *a2@<X8>)
{
  switch(a1)
  {
    case 0:
      *a2 = 0LL;
      a2[1] = 0LL;
      a2[2] = 0LL;
      std::stringbuf v8 = operator new(8uLL);
      *a2 = v8;
      uint64_t v9 = (uint64_t)&_mh_execute_header;
      goto LABEL_10;
    case 1:
      *a2 = 0LL;
      a2[1] = 0LL;
      a2[2] = 0LL;
      std::stringbuf v8 = operator new(8uLL);
      *a2 = v8;
      uint64_t v9 = 0x200000000LL;
      goto LABEL_10;
    case 2:
      *a2 = 0LL;
      a2[1] = 0LL;
      a2[2] = 0LL;
      std::stringbuf v8 = operator new(8uLL);
      *a2 = v8;
      uint64_t v9 = 0x300000000LL;
LABEL_10:
      void *v8 = v9;
      uint64_t v5 = v8 + 1;
      goto LABEL_3;
    case 3:
    case 4:
    case 5:
    case 6:
      *a2 = 0LL;
      a2[1] = 0LL;
      a2[2] = 0LL;
      uint64_t v6 = operator new(0x20uLL);
      a2[1] = v6 + 2;
      a2[2] = v6 + 2;
      *(void *)&double result = 0x400000000LL;
      *uint64_t v6 = xmmword_100018340;
      v6[1] = *(_OWORD *)&byte_100018350;
      *a2 = v6;
      return result;
    case 7:
    case 8:
    case 9:
    case 10:
      *a2 = 0LL;
      a2[1] = 0LL;
      a2[2] = 0LL;
      uint64_t v7 = operator new(0x10uLL);
      *a2 = v7;
      *(void *)&double result = 0xB00000000LL;
      *uint64_t v7 = xmmword_100018300;
      uint64_t v5 = v7 + 1;
      goto LABEL_3;
    default:
      *a2 = 0LL;
      a2[1] = 0LL;
      a2[2] = 0LL;
      unsigned int v3 = operator new(4uLL);
      *a2 = v3;
      *unsigned int v3 = 0;
      uint64_t v5 = v3 + 1;
LABEL_3:
      a2[1] = v5;
      a2[2] = v5;
      return result;
  }

_DWORD *sub_10000FB1C@<X0>(_DWORD *result@<X0>, void *a2@<X8>)
{
  switch((int)result)
  {
    case 0:
      *a2 = 0LL;
      a2[1] = 0LL;
      a2[2] = 0LL;
      unsigned int v3 = operator new(4uLL);
      *a2 = v3;
      int v4 = 1;
      goto LABEL_7;
    case 1:
      *a2 = 0LL;
      a2[1] = 0LL;
      a2[2] = 0LL;
      unsigned int v3 = operator new(4uLL);
      *a2 = v3;
      int v4 = 2;
      goto LABEL_7;
    case 2:
      *a2 = 0LL;
      a2[1] = 0LL;
      a2[2] = 0LL;
      unsigned int v3 = operator new(4uLL);
      *a2 = v3;
      int v4 = 3;
      goto LABEL_7;
    case 3:
      *a2 = 0LL;
      a2[1] = 0LL;
      a2[2] = 0LL;
      unsigned int v3 = operator new(4uLL);
      *a2 = v3;
      int v4 = 7;
LABEL_7:
      *unsigned int v3 = v4;
      double result = v3 + 1;
      a2[1] = result;
      a2[2] = result;
      break;
    default:
      *a2 = 0LL;
      a2[1] = 0LL;
      a2[2] = 0LL;
      break;
  }

  return result;
}

uint64_t sub_10000FBF0(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(_DWORD *)(a1 + std::iostream::~basic_iostream(v2, v3 + 8) = a4;
  *(_DWORD *)(a1 + 12) = a5;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 4std::iostream::~basic_iostream(v2, v3 + 8) = 0LL;
  sub_100010ECC( (void *)(a1 + 32),  *(const void **)a6,  *(void *)(a6 + 8),  (uint64_t)(*(void *)(a6 + 8) - *(void *)a6) >> 1);
  if (a3 < a2)
  {
    __int128 v14 = "maxAzDeg >= minAzDeg";
    int v15 = 20;
    goto LABEL_8;
  }

  if (a5 < a4)
  {
    __int128 v14 = "maxElDeg >= minElDeg";
    int v15 = 21;
    goto LABEL_8;
  }

  uint64_t v11 = a3 - a2 + 1;
  uint64_t v12 = a5 - a4 + 1;
  *(void *)(a1 + 16) = v11;
  *(void *)(a1 + 24) = v12;
  if (v12 * v11 != (uint64_t)(*(void *)(a1 + 40) - *(void *)(a1 + 32)) >> 1)
  {
    __int128 v14 = "fNumRows * fNumCols == fPDOATable.size()";
    int v15 = 24;
LABEL_8:
    __assert_rtn("AOAtoPDOAMapping", "RoseAOAtoPDOAMapping.cpp", v15, v14);
  }

  return a1;
}

void sub_10000FCDC(_Unwind_Exception *exception_object)
{
  int v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 40) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(exception_object);
}

uint64_t sub_10000FCFC(uint64_t result, int a2, int a3, int a4, int a5, uint64_t a6)
{
  *(_DWORD *)double result = a2;
  *(_DWORD *)(result + 4) = a3;
  *(_DWORD *)(result + std::iostream::~basic_iostream(v2, v3 + 8) = a4;
  *(_DWORD *)(result + 12) = a5;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(void *)(result + 4std::iostream::~basic_iostream(v2, v3 + 8) = 0LL;
  *(_OWORD *)(result + 32) = *(_OWORD *)a6;
  *(void *)(result + 4std::iostream::~basic_iostream(v2, v3 + 8) = *(void *)(a6 + 16);
  *(void *)a6 = 0LL;
  *(void *)(a6 + std::iostream::~basic_iostream(v2, v3 + 8) = 0LL;
  *(void *)(a6 + 16) = 0LL;
  if (a3 < a2)
  {
    std::stringbuf v8 = "maxAzDeg >= minAzDeg";
    int v9 = 30;
    goto LABEL_8;
  }

  if (a5 < a4)
  {
    std::stringbuf v8 = "maxElDeg >= minElDeg";
    int v9 = 31;
    goto LABEL_8;
  }

  uint64_t v6 = a3 - a2 + 1;
  uint64_t v7 = a5 - a4 + 1;
  *(void *)(result + 16) = v6;
  *(void *)(result + 24) = v7;
  if (v7 * v6 != (uint64_t)(*(void *)(result + 40) - *(void *)(result + 32)) >> 1)
  {
    std::stringbuf v8 = "fNumRows * fNumCols == fPDOATable.size()";
    int v9 = 34;
LABEL_8:
    __assert_rtn("AOAtoPDOAMapping", "RoseAOAtoPDOAMapping.cpp", v9, v8);
  }

  return result;
}

void sub_10000FDC4(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)(v1 + 32);
  if (v3)
  {
    *(void *)(v1 + 40) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

uint64_t sub_10000FDE4(uint64_t a1, int a2, int a3)
{
  if (a2 < *(_DWORD *)a1) {
    sub_100017010();
  }
  if (*(_DWORD *)(a1 + 4) < a2) {
    sub_100017038();
  }
  int v3 = *(_DWORD *)(a1 + 8);
  BOOL v4 = __OFSUB__(a3, v3);
  int v5 = a3 - v3;
  if (v5 < 0 != v4) {
    sub_100017060();
  }
  if (*(_DWORD *)(a1 + 12) < a3) {
    sub_100017088();
  }
  return *(__int16 *)(*(void *)(a1 + 32) + 2 * (*(void *)(a1 + 24) * (a2 - *(_DWORD *)a1) + v5));
}

uint64_t sub_10000FE48(uint64_t a1, int a2, int a3)
{
  if (a2 < *(_DWORD *)a1) {
    sub_1000170B0();
  }
  if (*(_DWORD *)(a1 + 4) < a2) {
    sub_1000170D8();
  }
  int v3 = *(_DWORD *)(a1 + 8);
  BOOL v4 = __OFSUB__(a3, v3);
  int v5 = a3 - v3;
  if (v5 < 0 != v4) {
    sub_100017100();
  }
  if (*(_DWORD *)(a1 + 12) < a3) {
    sub_100017128();
  }
  return *(void *)(a1 + 32) + 2 * (*(void *)(a1 + 24) * (a2 - *(_DWORD *)a1) + v5);
}

_BYTE *sub_10000FEAC(_BYTE *a1, uint64_t a2)
{
  *a1 = 0;
  a1[8] = 0;
  uint64_t v4 = (uint64_t)(a1 + 8);
  a1[64] = 0;
  a1[72] = 0;
  uint64_t v5 = (uint64_t)(a1 + 72);
  a1[136] = 0;
  uint64_t v6 = (uint64_t)(a1 + 136);
  a1[128] = 0;
  a1[192] = 0;
  a1[200] = 0;
  uint64_t v7 = (uint64_t)(a1 + 200);
  a1[256] = 0;
  if (sub_1000125F4(a2))
  {
    unint64_t v15 = sub_100011744((uint64_t *)a2);
    if (!v16) {
      sub_100010E98();
    }
    unint64_t v17 = v15;
    if (v15 < 0x2009E) {
      __assert_rtn("CalBlob", "RoseAOAtoPDOAMapping.cpp", 101, "fileSize >= kHeaderSize + kBytesPerChan");
    }
    sub_1000107A4(v94, (uint64_t *)a2, 4);
    __int128 v25 = (char *)v94 + (unint64_t)*(v94[0] - 3);
    if (*((_DWORD *)v25 + 8))
    {
      else {
        uint64_t v26 = *(void *)a2;
      }
      sub_100015380("CalBlob: error opening %s", v18, v19, v20, v21, v22, v23, v24, v26);
    }

    else
    {
      *((_DWORD *)v25 + 2) &= ~0x1000u;
      std::istream::seekg(v94, 178LL, 0LL);
      std::string __p = 0LL;
      uint64_t v88 = 0LL;
      uint64_t v89 = 0LL;
      sub_1000108BC(&__p, 0x7FF9uLL);
      while (1)
      {
        uint64_t v28 = (void *)std::istream::read(v94, &v86, 4LL);
        if ((*((_BYTE *)v28 + *(void *)(*v28 - 24LL) + 32) & 5) != 0) {
          goto LABEL_113;
        }
        std::istream::tellg(v90, v94);
        if (v93 == -1) {
          break;
        }
        std::istream::tellg(v90, v94);
        if (v93 + 131052 > v17 + 4) {
          __assert_rtn( "CalBlob",  "RoseAOAtoPDOAMapping.cpp",  123,  "static_cast<size_t>(f.tellg()) + kBytesPerChan <= fileSize + sizeof(tag)");
        }
        int v36 = v86;
        if (!v86)
        {
          std::istream::read(v94, &v85, 4LL);
          if (v85 != 131044)
          {
            int v81 = 127;
            v82 = "length == kCh5Length";
LABEL_120:
            __assert_rtn("CalBlob", "RoseAOAtoPDOAMapping.cpp", v81, v82);
          }

          int v37 = 0;
          uint64_t v88 = (char *)__p;
          do
          {
            std::istream::read(v94, &v84, 2LL);
            char v38 = v88;
            if (v88 >= v89)
            {
              uint64_t v40 = (char *)__p;
              uint64_t v41 = v88 - (_BYTE *)__p;
              if (v88 - (_BYTE *)__p <= -3) {
                sub_100006CB4();
              }
              uint64_t v42 = v41 >> 1;
              else {
                uint64_t v43 = v89 - (_BYTE *)__p;
              }
              else {
                uint64_t v44 = v43;
              }
              if (v44)
              {
                uint64_t v45 = (char *)sub_10000B76C((uint64_t)&v89, v44);
                uint64_t v40 = (char *)__p;
                char v38 = v88;
              }

              else
              {
                uint64_t v45 = 0LL;
              }

              unint64_t v46 = &v45[2 * v42];
              *(_WORD *)unint64_t v46 = v84;
              uint64_t v39 = v46 + 2;
              while (v38 != v40)
              {
                __int16 v47 = *((_WORD *)v38 - 1);
                v38 -= 2;
                *((_WORD *)v46 - 1) = v47;
                v46 -= 2;
              }

              std::string __p = v46;
              uint64_t v88 = v39;
              uint64_t v89 = &v45[2 * v44];
              if (v40) {
                operator delete(v40);
              }
            }

            else
            {
              *(_WORD *)uint64_t v88 = v84;
              uint64_t v39 = v38 + 2;
            }

            uint64_t v88 = v39;
            ++v37;
          }

          while (v37 != 32761);
          sub_10000FBF0((uint64_t)v90, 0, 180, 0, 180, (uint64_t)&__p);
          sub_10001094C(v4, (uint64_t)v90);
          if (v91)
          {
            unint64_t v92 = v91;
            operator delete(v91);
          }

          int v48 = 0;
          uint64_t v88 = (char *)__p;
          do
          {
            std::istream::read(v94, &v84, 2LL);
            uint64_t v49 = v88;
            if (v88 >= v89)
            {
              uint64_t v51 = (char *)__p;
              uint64_t v52 = v88 - (_BYTE *)__p;
              if (v88 - (_BYTE *)__p <= -3) {
                sub_100006CB4();
              }
              uint64_t v53 = v52 >> 1;
              else {
                uint64_t v54 = v89 - (_BYTE *)__p;
              }
              else {
                uint64_t v29 = v54;
              }
              if (v29)
              {
                __int128 v55 = (char *)sub_10000B76C((uint64_t)&v89, v29);
                uint64_t v51 = (char *)__p;
                uint64_t v49 = v88;
              }

              else
              {
                __int128 v55 = 0LL;
              }

              __int128 v56 = &v55[2 * v53];
              *(_WORD *)__int128 v56 = v84;
              uint64_t v50 = v56 + 2;
              while (v49 != v51)
              {
                __int16 v57 = *((_WORD *)v49 - 1);
                v49 -= 2;
                *((_WORD *)v56 - 1) = v57;
                v56 -= 2;
              }

              std::string __p = v56;
              uint64_t v88 = v50;
              uint64_t v89 = &v55[2 * v29];
              if (v51) {
                operator delete(v51);
              }
            }

            else
            {
              *(_WORD *)uint64_t v88 = v84;
              uint64_t v50 = v49 + 2;
            }

            uint64_t v88 = v50;
            ++v48;
          }

          while (v48 != 32761);
          if (*(_DWORD *)&v95[(unint64_t)*(v94[0] - 3) + 16])
          {
            v79 = "Reading Ch5 calblob failed";
            goto LABEL_112;
          }

          sub_10000FBF0((uint64_t)v90, 0, 180, 0, 180, (uint64_t)&__p);
          sub_10001094C(v5, (uint64_t)v90);
          if (v91)
          {
            unint64_t v92 = v91;
            operator delete(v91);
          }

          sub_100013F40(a1, 5);
          int v36 = v86;
        }

        if (v36 == 1)
        {
          std::istream::read(v94, &v85, 4LL);
          if (v85 != 131044)
          {
            int v81 = 156;
            v82 = "length == kCh9Length";
            goto LABEL_120;
          }

          int v58 = 0;
          uint64_t v88 = (char *)__p;
          do
          {
            std::istream::read(v94, &v84, 2LL);
            __int128 v59 = v88;
            if (v88 >= v89)
            {
              __int128 v61 = (char *)__p;
              uint64_t v62 = v88 - (_BYTE *)__p;
              if (v88 - (_BYTE *)__p <= -3) {
                sub_100006CB4();
              }
              uint64_t v63 = v62 >> 1;
              else {
                uint64_t v64 = v89 - (_BYTE *)__p;
              }
              else {
                uint64_t v65 = v64;
              }
              if (v65)
              {
                size_t v66 = (char *)sub_10000B76C((uint64_t)&v89, v65);
                __int128 v61 = (char *)__p;
                __int128 v59 = v88;
              }

              else
              {
                size_t v66 = 0LL;
              }

              int v67 = &v66[2 * v63];
              *(_WORD *)int v67 = v84;
              __int128 v60 = v67 + 2;
              while (v59 != v61)
              {
                __int16 v68 = *((_WORD *)v59 - 1);
                v59 -= 2;
                *((_WORD *)v67 - 1) = v68;
                v67 -= 2;
              }

              std::string __p = v67;
              uint64_t v88 = v60;
              uint64_t v89 = &v66[2 * v65];
              if (v61) {
                operator delete(v61);
              }
            }

            else
            {
              *(_WORD *)uint64_t v88 = v84;
              __int128 v60 = v59 + 2;
            }

            uint64_t v88 = v60;
            ++v58;
          }

          while (v58 != 32761);
          sub_10000FBF0((uint64_t)v90, 0, 180, 0, 180, (uint64_t)&__p);
          sub_10001094C(v6, (uint64_t)v90);
          if (v91)
          {
            unint64_t v92 = v91;
            operator delete(v91);
          }

          int v69 = 0;
          uint64_t v88 = (char *)__p;
          do
          {
            std::istream::read(v94, &v84, 2LL);
            uint64_t v70 = v88;
            if (v88 >= v89)
            {
              uint64_t v72 = (char *)__p;
              uint64_t v73 = v88 - (_BYTE *)__p;
              if (v88 - (_BYTE *)__p <= -3) {
                sub_100006CB4();
              }
              uint64_t v74 = v73 >> 1;
              else {
                uint64_t v75 = v89 - (_BYTE *)__p;
              }
              else {
                uint64_t v29 = v75;
              }
              if (v29)
              {
                uint64_t v76 = (char *)sub_10000B76C((uint64_t)&v89, v29);
                uint64_t v72 = (char *)__p;
                uint64_t v70 = v88;
              }

              else
              {
                uint64_t v76 = 0LL;
              }

              BOOL v77 = &v76[2 * v74];
              *(_WORD *)BOOL v77 = v84;
              uint64_t v71 = v77 + 2;
              while (v70 != v72)
              {
                __int16 v78 = *((_WORD *)v70 - 1);
                v70 -= 2;
                *((_WORD *)v77 - 1) = v78;
                v77 -= 2;
              }

              std::string __p = v77;
              uint64_t v88 = v71;
              uint64_t v89 = &v76[2 * v29];
              if (v72) {
                operator delete(v72);
              }
            }

            else
            {
              *(_WORD *)uint64_t v88 = v84;
              uint64_t v71 = v70 + 2;
            }

            uint64_t v88 = v71;
            ++v69;
          }

          while (v69 != 32761);
          if (*(_DWORD *)&v95[(unint64_t)*(v94[0] - 3) + 16])
          {
            v79 = "Reading Ch9 calblob failed";
            goto LABEL_112;
          }

          sub_10000FBF0((uint64_t)v90, 0, 180, 0, 180, (uint64_t)&__p);
          sub_10001094C(v7, (uint64_t)v90);
          if (v91)
          {
            unint64_t v92 = v91;
            operator delete(v91);
          }

          sub_100013F40(a1, 9);
        }
      }

      v79 = "Current position in the file stream is -1, return";
LABEL_112:
      sub_100015380(v79, v29, v30, v31, v32, v33, v34, v35, v83);
LABEL_113:
      if (__p)
      {
        uint64_t v88 = (char *)__p;
        operator delete(__p);
      }
    }

    std::filebuf::~filebuf(v95);
    std::ios::~ios(&v96);
  }

  else
  {
    else {
      uint64_t v27 = *(void *)a2;
    }
    sub_100015380("CalBlob: file %s integrity check fails ", v8, v9, v10, v11, v12, v13, v14, v27);
  }

  return a1;
}

void sub_10001069C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35)
{
  if (__p) {
    operator delete(__p);
  }
  sub_1000109B4(&a35);
  if (*(_BYTE *)(v35 + 256))
  {
    int v37 = *(void **)(v35 + 232);
    if (v37)
    {
      *(void *)(v35 + 240) = v37;
      operator delete(v37);
    }
  }

  if (*(_BYTE *)(v35 + 192))
  {
    char v38 = *(void **)(v35 + 168);
    if (v38)
    {
      *(void *)(v35 + 176) = v38;
      operator delete(v38);
    }
  }

  if (*(_BYTE *)(v35 + 128))
  {
    uint64_t v39 = *(void **)(v35 + 104);
    if (v39)
    {
      *(void *)(v35 + 112) = v39;
      operator delete(v39);
    }
  }

  if (*(_BYTE *)(v35 + 64))
  {
    uint64_t v40 = *(void **)(v35 + 40);
    if (v40)
    {
      *(void *)(v35 + 4std::iostream::~basic_iostream(v2, v3 + 8) = v40;
      operator delete(v40);
    }
  }

  _Unwind_Resume(a1);
}

void (__cdecl ***sub_1000107A4( void (__cdecl ***a1)(std::ifstream *__hidden this), uint64_t *a2, int a3))(std::ifstream *__hidden this)
{
  uint64_t v6 = a1 + 2;
  *a1 = v7;
  *(void *)((char *)*(v7 - 3) + (void)a1) = v8;
  a1[1] = 0LL;
  uint64_t v9 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v9, a1 + 2);
  v9[1].__vftable = 0LL;
  v9[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf(v6);
  else {
    uint64_t v10 = (uint64_t *)*a2;
  }
  if (!std::filebuf::open(v6, v10, a3 | 8u)) {
    std::ios_base::clear( (std::ios_base *)((char *)*(*a1 - 3) + (void)a1),  *(_DWORD *)((char *)*(*a1 - 3) + (void)a1 + 32) | 4);
  }
  return a1;
}

void sub_100010884(_Unwind_Exception *a1)
{
}

void sub_1000108BC(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 1)
  {
    if ((a2 & 0x8000000000000000LL) != 0) {
      sub_100006CB4();
    }
    int64_t v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    uint64_t v6 = (char *)sub_10000B76C(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFELL];
    uint64_t v9 = &v6[2 * v8];
    uint64_t v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        __int16 v13 = *((_WORD *)v11 - 1);
        v11 -= 2;
        *((_WORD *)v12 - 1) = v13;
        v12 -= 2;
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

uint64_t sub_10001094C(uint64_t a1, uint64_t a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 56);
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  int64_t v5 = (void *)(a1 + 32);
  if (v3)
  {
    sub_100010F80((uint64_t)v5, (__n128 *)(a2 + 32));
  }

  else
  {
    *int64_t v5 = 0LL;
    v5[1] = 0LL;
    v5[2] = 0LL;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 4std::istream::~istream(v1, v2 + 8) = *(void *)(a2 + 48);
    *(void *)(a2 + 32) = 0LL;
    *(void *)(a2 + 40) = 0LL;
    *(void *)(a2 + 4std::istream::~istream(v1, v2 + 8) = 0LL;
    *(_BYTE *)(a1 + 56) = 1;
  }

  return a1;
}

void *sub_1000109B4(void *a1)
{
  return a1;
}

_BYTE *sub_100010A10(_BYTE *result, char a2)
{
  *double result = a2;
  return result;
}

uint64_t sub_100010A18(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t sub_100010A20(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  return (v1 >> sub_10001411C(5, 1)) & 1;
}

uint64_t sub_100010A50(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  return (v1 >> sub_10001411C(9, 1)) & 1;
}

BOOL sub_100010A80(unsigned __int8 *a1)
{
  BOOL result = 0;
  if (*a1)
  {
    unsigned int v1 = *a1;
    if (((v1 >> sub_10001411C(9, 1)) & 1) != 0)
    {
      if (a1[192])
      {
        if (a1[256])
        {
          if (*((void *)a1 + 19) == 181LL
            && *((void *)a1 + 20) == 181LL
            && *((void *)a1 + 27) == 181LL
            && *((void *)a1 + 28) == 181LL)
          {
            unsigned int v3 = *a1;
            if (((v3 >> sub_10001411C(5, 1)) & 1) == 0
              || a1[64]
              && a1[128]
              && *((void *)a1 + 3) == 181LL
              && *((void *)a1 + 4) == 181LL
              && *((void *)a1 + 11) == 181LL
              && *((void *)a1 + 12) == 181LL)
            {
              return 1;
            }
          }
        }
      }
    }
  }

  return result;
}

unsigned __int8 *sub_100010B5C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (!sub_100010A80(a1) || !sub_100010A80(a2) || (unsigned int v4 = *a1, v4 != *a2)) {
    sub_100017178();
  }
  if (((v4 >> sub_10001411C(9, 1)) & 1) == 0 || (unsigned int v5 = *a2, ((v5 >> sub_10001411C(9, 1)) & 1) == 0)) {
    sub_100017150();
  }
  int v6 = *a2;
  int v7 = 0;
  int v31 = (1 << sub_10001411C(5, 1)) & v6;
  uint64_t v32 = (uint64_t)(a1 + 8);
  do
  {
    for (int i = 0; i != 181; ++i)
    {
      if (!a1[192]) {
        goto LABEL_56;
      }
      uint64_t v9 = (unsigned __int16 *)sub_10000FE48((uint64_t)(a1 + 136), v7, i);
      if (!a2[192]) {
        goto LABEL_56;
      }
      int v10 = *v9;
      int v11 = sub_10000FDE4((uint64_t)(a2 + 136), v7, i);
      __int16 v12 = v11 + v10;
      if (v12 < -179) {
        v12 += 360;
      }
      BOOL v13 = v10 == 0x7FFF || v11 == 0x7FFF;
      __int16 v14 = v13 ? 0x7FFF : v12;
      if (!a1[192]) {
        goto LABEL_56;
      }
      *(_WORD *)sub_10000FE48((uint64_t)(a1 + 136), v7, i) = v14;
      if (!a1[256]) {
        goto LABEL_56;
      }
      unint64_t v15 = (unsigned __int16 *)sub_10000FE48((uint64_t)(a1 + 200), v7, i);
      if (!a2[256]) {
        goto LABEL_56;
      }
      int v16 = *v15;
      int v17 = sub_10000FDE4((uint64_t)(a2 + 200), v7, i);
      __int16 v18 = 0x7FFF;
      if (v16 != 0x7FFF && v17 != 0x7FFF)
      {
        __int16 v19 = v17 + v16;
        if (v19 >= -179) {
          __int16 v18 = v19;
        }
        else {
          __int16 v18 = v19 + 360;
        }
      }

      if (!a1[256]) {
LABEL_56:
      }
        sub_100010E98();
      *(_WORD *)sub_10000FE48((uint64_t)(a1 + 200), v7, i) = v18;
      if (v31)
      {
        if (!a1[64]) {
          goto LABEL_56;
        }
        uint64_t v20 = (unsigned __int16 *)sub_10000FE48(v32, v7, i);
        if (!a2[64]) {
          goto LABEL_56;
        }
        int v21 = *v20;
        int v22 = sub_10000FDE4((uint64_t)(a2 + 8), v7, i);
        __int16 v23 = 0x7FFF;
        if (v21 != 0x7FFF && v22 != 0x7FFF)
        {
          __int16 v24 = v22 + v21;
          if (v24 >= -179) {
            __int16 v23 = v24;
          }
          else {
            __int16 v23 = v24 + 360;
          }
        }

        if (!a1[64]) {
          goto LABEL_56;
        }
        *(_WORD *)sub_10000FE48(v32, v7, i) = v23;
        if (!a1[128]) {
          goto LABEL_56;
        }
        __int128 v25 = (unsigned __int16 *)sub_10000FE48((uint64_t)(a1 + 72), v7, i);
        if (!a2[128]) {
          goto LABEL_56;
        }
        int v26 = *v25;
        int v27 = sub_10000FDE4((uint64_t)(a2 + 72), v7, i);
        __int16 v28 = 0x7FFF;
        if (v26 != 0x7FFF && v27 != 0x7FFF)
        {
          __int16 v29 = v27 + v26;
          if (v29 >= -179) {
            __int16 v28 = v29;
          }
          else {
            __int16 v28 = v29 + 360;
          }
        }

        if (!a1[128]) {
          goto LABEL_56;
        }
        *(_WORD *)sub_10000FE48((uint64_t)(a1 + 72), v7, i) = v28;
      }
    }

    ++v7;
  }

  while (v7 != 181);
  return a1;
}

void sub_100010E98()
{
  exception = __cxa_allocate_exception(8uLL);
}

void *sub_100010ECC(void *result, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    BOOL result = sub_100010F44(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      BOOL result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_100010F28(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::istream::~istream(v1, v2 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_100010F44(void *a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_100006CB4();
  }
  BOOL result = (char *)sub_10000B76C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

__n128 sub_100010F80(uint64_t a1, __n128 *a2)
{
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + std::istream::~istream(v1, v2 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0LL;
    *(void *)(a1 + std::istream::~istream(v1, v2 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
  }

  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0LL;
  a2->n128_u64[1] = 0LL;
  a2[1].n128_u64[0] = 0LL;
  return result;
}

uint64_t sub_100010FD0()
{
  unsigned __int8 v0 = std::string::insert(&v37, 0LL, "reverseLUT_A");
  __int128 v1 = *(_OWORD *)&v0->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__l.__cap_ = v0->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v1;
  v0->__r_.__value_.__l.__size_ = 0LL;
  v0->__r_.__value_.__l.__cap_ = 0LL;
  v0->__r_.__value_.__r.__words[0] = 0LL;
  uint64_t v2 = std::string::append(&v38, ".bin");
  __int128 v3 = *(_OWORD *)&v2->__r_.__value_.__l.__data_;
  qword_1000204A8 = v2->__r_.__value_.__l.__cap_;
  xmmword_100020498 = v3;
  v2->__r_.__value_.__l.__size_ = 0LL;
  v2->__r_.__value_.__l.__cap_ = 0LL;
  v2->__r_.__value_.__r.__words[0] = 0LL;
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_100020498, (void *)&_mh_execute_header);
  sub_10000F920(1LL, &v37);
  uint64_t v4 = std::string::insert(&v37, 0LL, "reverseLUT_A");
  __int128 v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__l.__cap_ = v4->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0LL;
  v4->__r_.__value_.__l.__cap_ = 0LL;
  v4->__r_.__value_.__r.__words[0] = 0LL;
  int v6 = std::string::append(&v38, ".bin");
  __int128 v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  qword_1000204C0 = v6->__r_.__value_.__l.__cap_;
  xmmword_1000204B0 = v7;
  v6->__r_.__value_.__l.__size_ = 0LL;
  v6->__r_.__value_.__l.__cap_ = 0LL;
  v6->__r_.__value_.__r.__words[0] = 0LL;
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_1000204B0, (void *)&_mh_execute_header);
  sub_10000F920(2LL, &v37);
  size_t v8 = std::string::insert(&v37, 0LL, "reverseLUT_A");
  __int128 v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__l.__cap_ = v8->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0LL;
  v8->__r_.__value_.__l.__cap_ = 0LL;
  v8->__r_.__value_.__r.__words[0] = 0LL;
  int v10 = std::string::append(&v38, ".bin");
  __int128 v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  qword_1000204D8 = v10->__r_.__value_.__l.__cap_;
  xmmword_1000204C8 = v11;
  v10->__r_.__value_.__l.__size_ = 0LL;
  v10->__r_.__value_.__l.__cap_ = 0LL;
  v10->__r_.__value_.__r.__words[0] = 0LL;
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_1000204C8, (void *)&_mh_execute_header);
  sub_10000F920(3LL, &v37);
  __int16 v12 = std::string::insert(&v37, 0LL, "reverseLUT_A");
  __int128 v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__l.__cap_ = v12->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0LL;
  v12->__r_.__value_.__l.__cap_ = 0LL;
  v12->__r_.__value_.__r.__words[0] = 0LL;
  __int16 v14 = std::string::append(&v38, ".bin");
  __int128 v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  qword_1000204F0 = v14->__r_.__value_.__l.__cap_;
  xmmword_1000204E0 = v15;
  v14->__r_.__value_.__l.__size_ = 0LL;
  v14->__r_.__value_.__l.__cap_ = 0LL;
  v14->__r_.__value_.__r.__words[0] = 0LL;
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_1000204E0, (void *)&_mh_execute_header);
  sub_10000F920(4LL, &v37);
  int v16 = std::string::insert(&v37, 0LL, "reverseLUT_A");
  __int128 v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__l.__cap_ = v16->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0LL;
  v16->__r_.__value_.__l.__cap_ = 0LL;
  v16->__r_.__value_.__r.__words[0] = 0LL;
  __int16 v18 = std::string::append(&v38, ".bin");
  __int128 v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  qword_100020508 = v18->__r_.__value_.__l.__cap_;
  xmmword_1000204F8 = v19;
  v18->__r_.__value_.__l.__size_ = 0LL;
  v18->__r_.__value_.__l.__cap_ = 0LL;
  v18->__r_.__value_.__r.__words[0] = 0LL;
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_1000204F8, (void *)&_mh_execute_header);
  sub_10000F920(5LL, &v37);
  uint64_t v20 = std::string::insert(&v37, 0LL, "reverseLUT_A");
  __int128 v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__l.__cap_ = v20->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v21;
  v20->__r_.__value_.__l.__size_ = 0LL;
  v20->__r_.__value_.__l.__cap_ = 0LL;
  v20->__r_.__value_.__r.__words[0] = 0LL;
  int v22 = std::string::append(&v38, ".bin");
  __int128 v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
  qword_100020520 = v22->__r_.__value_.__l.__cap_;
  xmmword_100020510 = v23;
  v22->__r_.__value_.__l.__size_ = 0LL;
  v22->__r_.__value_.__l.__cap_ = 0LL;
  v22->__r_.__value_.__r.__words[0] = 0LL;
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_100020510, (void *)&_mh_execute_header);
  sub_10000F920(6LL, &v37);
  __int16 v24 = std::string::insert(&v37, 0LL, "reverseLUT_A");
  __int128 v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__l.__cap_ = v24->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v25;
  v24->__r_.__value_.__l.__size_ = 0LL;
  v24->__r_.__value_.__l.__cap_ = 0LL;
  v24->__r_.__value_.__r.__words[0] = 0LL;
  int v26 = std::string::append(&v38, ".bin");
  __int128 v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  qword_100020538 = v26->__r_.__value_.__l.__cap_;
  xmmword_100020528 = v27;
  v26->__r_.__value_.__l.__size_ = 0LL;
  v26->__r_.__value_.__l.__cap_ = 0LL;
  v26->__r_.__value_.__r.__words[0] = 0LL;
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_100020528, (void *)&_mh_execute_header);
  sub_10000F920(7LL, &v37);
  __int16 v28 = std::string::insert(&v37, 0LL, "reverseLUT_A");
  __int128 v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__l.__cap_ = v28->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v29;
  v28->__r_.__value_.__l.__size_ = 0LL;
  v28->__r_.__value_.__l.__cap_ = 0LL;
  v28->__r_.__value_.__r.__words[0] = 0LL;
  uint64_t v30 = std::string::append(&v38, ".bin");
  __int128 v31 = *(_OWORD *)&v30->__r_.__value_.__l.__data_;
  qword_100020550 = v30->__r_.__value_.__l.__cap_;
  xmmword_100020540 = v31;
  v30->__r_.__value_.__l.__size_ = 0LL;
  v30->__r_.__value_.__l.__cap_ = 0LL;
  v30->__r_.__value_.__r.__words[0] = 0LL;
  __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_100020540, (void *)&_mh_execute_header);
  sub_10000F920(8LL, &v37);
  uint64_t v32 = std::string::insert(&v37, 0LL, "reverseLUT_A");
  __int128 v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
  v38.__r_.__value_.__l.__cap_ = v32->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v33;
  v32->__r_.__value_.__l.__size_ = 0LL;
  v32->__r_.__value_.__l.__cap_ = 0LL;
  v32->__r_.__value_.__r.__words[0] = 0LL;
  uint64_t v34 = std::string::append(&v38, ".bin");
  __int128 v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
  qword_100020568 = v34->__r_.__value_.__l.__cap_;
  xmmword_100020558 = v35;
  v34->__r_.__value_.__l.__size_ = 0LL;
  v34->__r_.__value_.__l.__cap_ = 0LL;
  v34->__r_.__value_.__r.__words[0] = 0LL;
  return __cxa_atexit( (void (*)(void *))&std::string::~string,  &xmmword_100020558,  (void *)&_mh_execute_header);
}

void sub_1000115B4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_100011628(unsigned __int8 *a1)
{
  uint64_t v2 = (os_log_s *)qword_1000205A0;
  if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v3 = a1 + 8;
    int v4 = *a1;
    int v5 = a1[1];
    int v6 = *((unsigned __int16 *)a1 + 16);
    __int128 v7 = a1 + 40;
    int v8 = *((_DWORD *)a1 + 16);
    int v9 = *((_DWORD *)a1 + 17);
    int v10 = *((_DWORD *)a1 + 18);
    int v11 = *((_DWORD *)a1 + 19);
    v12[0] = 67176707;
    v12[1] = v4;
    __int16 v13 = 1025;
    int v14 = v5;
    __int16 v15 = 2081;
    int v16 = v3;
    __int16 v17 = 1025;
    int v18 = v6;
    __int16 v19 = 2081;
    uint64_t v20 = v7;
    __int16 v21 = 1025;
    int v22 = v8;
    __int16 v23 = 1025;
    int v24 = v9;
    __int16 v25 = 1025;
    int v26 = v10;
    __int16 v27 = 1025;
    int v28 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "#fu,endian,%{private}d,headerVersion,%{private}d,type,%{private}s,version,%{private}d,copyright,%{private}s,timest amp,%{private}u,expiration,%{private}u,dataSizeBytes,%{private}u,crc,%{private}u",  (uint8_t *)v12,  0x40u);
  }

unint64_t sub_100011744(uint64_t *a1)
{
  if ((v7[(unint64_t)*(v6[0] - 3) + 16] & 5) != 0)
  {
    uint64_t v1 = 0LL;
    unint64_t v2 = 0LL;
  }

  else
  {
    std::istream::tellg(v4, v6);
    unint64_t v2 = v5 & 0xFFFFFFFFFFFFFF00LL;
    uint64_t v1 = v5;
  }

  std::filebuf::~filebuf(v7);
  std::ios::~ios(&v8);
  return v2 | v1;
}

void sub_100011840( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26)
{
}

BOOL sub_10001185C(const char *a1)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  return stat(a1, &v2) >= 0;
}

void sub_100011894(const char *a1)
{
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if ((stat(a1, &v1) & 0x80000000) == 0) {
    CFAbsoluteTimeGetCurrent();
  }
}

uint64_t sub_10001190C(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 128))
  {
    int v16 = (os_log_s *)qword_1000205A0;
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_1000171A0(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    return 0LL;
  }

  uint64_t v3 = *(unsigned __int8 *)(a2 + 31);
  if ((v3 & 0x80u) != 0LL) {
    uint64_t v3 = *(void *)(a2 + 16);
  }
  if (v3 != 30)
  {
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_100017244();
    }
    return 0LL;
  }

  if ((*(char *)(a2 + 63) & 0x80000000) == 0 || *(void *)(a2 + 48) != 128LL)
  {
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_1000171D0();
    }
    return 0LL;
  }

  uint64_t v5 = a2 + 8;
  uint64_t v6 = 1LL;
  ((void (*)(void))std::ostream::write)();
  std::ostream::write(a1, a2 + 1, 1LL);
  int v7 = *(char *)(a2 + 31);
  if (v7 >= 0) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = *(void *)(a2 + 8);
  }
  if (v7 >= 0) {
    uint64_t v9 = *(unsigned __int8 *)(a2 + 31);
  }
  else {
    uint64_t v9 = *(void *)(a2 + 16);
  }
  std::ostream::write(a1, v8, v9);
  std::ostream::write(a1, a2 + 32, 2LL);
  uint64_t v12 = *(void *)(a2 + 40);
  uint64_t v11 = a2 + 40;
  uint64_t v10 = v12;
  int v13 = *(char *)(v11 + 23);
  if (v13 >= 0) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = v10;
  }
  if (v13 >= 0) {
    uint64_t v15 = *(unsigned __int8 *)(v11 + 23);
  }
  else {
    uint64_t v15 = *(void *)(v11 + 8);
  }
  std::ostream::write(a1, v14, v15);
  std::ostream::write(a1, v11 + 24, 4LL);
  std::ostream::write(a1, v11 + 28, 4LL);
  std::ostream::write(a1, v11 + 32, 4LL);
  std::ostream::write(a1, v11 + 36, 4LL);
  std::ostream::flush(a1);
  return v6;
}

BOOL sub_100011AD8(FILE *__stream, uint64_t a2)
{
  if (!__stream)
  {
    uint64_t v8 = (os_log_s *)qword_1000205A0;
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_1000172B8(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    return 0LL;
  }

  size_t v3 = fread(&__ptr, 1uLL, 0xB2uLL, __stream);
  if (v3 != 178)
  {
    uint64_t v16 = v3;
    uint64_t v17 = (os_log_s *)qword_1000205A0;
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_100017420(v16, v17, v18);
    }
    return 0LL;
  }

  int v4 = __ptr;
  *(_BYTE *)a2 = __ptr;
  if ((v4 - 1) >= 2)
  {
    uint64_t v19 = (os_log_s *)qword_1000205A0;
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_1000173B8(a2, v19, v20, v21, v22, v23, v24, v25);
    }
    return 0LL;
  }

  int v5 = v52;
  *(_BYTE *)(a2 + 1) = v52;
  uint64_t v6 = a2 + 1;
  if (!v5)
  {
    int v26 = (os_log_s *)qword_1000205A0;
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_1000172E8(v6, v26, v27, v28, v29, v30, v31, v32);
    }
    return 0LL;
  }

  char v50 = 0;
  *(_OWORD *)std::string __s = *(_OWORD *)v53;
  *(_OWORD *)&__s[14] = *(_OWORD *)&v53[14];
  std::string::assign((std::string *)(a2 + 8), __s);
  if (*(_BYTE *)a2 == 2) {
    unsigned int v7 = bswap32(v54) >> 16;
  }
  else {
    unsigned int v7 = v54;
  }
  *(_WORD *)(a2 + 32) = v7;
  uint64_t v35 = a2 + 32;
  BOOL v33 = v7 != 0;
  if (v7)
  {
    char v48 = 0;
    v47[4] = v59;
    v47[5] = v60;
    v47[6] = v61;
    v47[7] = v62;
    v47[0] = v55;
    v47[1] = v56;
    v47[2] = v57;
    v47[3] = v58;
    std::string::assign((std::string *)(a2 + 40), (const std::string::value_type *)v47);
    if (*(_BYTE *)a2 == 2)
    {
      unsigned int v36 = bswap32(v63);
      unsigned int v37 = bswap32(v64);
      unsigned int v38 = bswap32(v65);
      unsigned int v39 = bswap32(v66);
    }

    else
    {
      unsigned int v36 = v63;
      unsigned int v37 = v64;
      unsigned int v38 = v65;
      unsigned int v39 = v66;
    }

    *(_DWORD *)(a2 + 64) = v36;
    *(_DWORD *)(a2 + 6std::istream::~istream(v1, v2 + 8) = v37;
    *(_DWORD *)(a2 + 72) = v38;
    *(_DWORD *)(a2 + 76) = v39;
  }

  else
  {
    uint64_t v40 = (os_log_s *)qword_1000205A0;
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_100017350(v35, v40, v41, v42, v43, v44, v45, v46);
    }
  }

  return v33;
}

BOOL sub_100011D44(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  if (stat((const char *)a1, &v14) < 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_100017568();
    }
    return 0LL;
  }

  unint64_t v4 = sub_100011744((uint64_t *)v3);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_100017498();
    }
    return 0LL;
  }

  __darwin_ino64_t v6 = v4;
  if (v4 <= 0xB1)
  {
    unsigned int v7 = (os_log_s *)qword_1000205A0;
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR))
    {
      else {
        uint64_t v13 = *(void *)v3;
      }
      v14.st_dev = 136315650;
      *(void *)&v14.st_mode = v13;
      WORD2(v14.st_ino) = 2048;
      *(__darwin_ino64_t *)((char *)&v14.st_ino + 6) = v6;
      HIWORD(v14.st_gid) = 1024;
      v14.st_rdev = 178;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "#fu,getHeader,failed,file,%s,fileTooSmall,size,%lu,expected,%d",  (uint8_t *)&v14,  0x1Cu);
    }
  }

  else {
    uint64_t v8 = *(const char **)v3;
  }
  uint64_t v9 = fopen(v8, "rb");
  uint64_t v10 = v9;
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_100017500();
    }
    return 0LL;
  }

  BOOL v11 = sub_100011AD8(v9, a2);
  fclose(v10);
  return v11;
}

BOOL sub_100011F3C(uint64_t a1)
{
  __int16 v8 = 0;
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  std::string __p = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v9 = 0LL;
  __int16 v12 = 0;
  __int128 v16 = xmmword_1000183A0;
  BOOL v1 = sub_100011D44(a1, (uint64_t)&v8);
  if ((_DWORD)v16) {
    BOOL v2 = v1;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    LODWORD(v5) = DWORD1(v16);
    LODWORD(v4) = v16;
    BOOL v6 = Current - (double)v4 > (double)v5;
  }

  else
  {
    BOOL v6 = 0LL;
  }

  if (SHIBYTE(v15) < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v11) < 0) {
    operator delete(v9);
  }
  return v6;
}

void sub_100011FE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100011FF8(uint64_t a1)
{
  return a1;
}

BOOL sub_100012038(uint64_t *a1, int *a2)
{
  uint64_t v3 = v13;
  if (v13)
  {
    unint64_t v4 = v11[0];
    *(_DWORD *)((char *)&v11[1] + (unint64_t)*(v11[0] - 3)) &= ~0x1000u;
    char v10 = 0;
    int v5 = -1;
    *a2 = -1;
    if ((v12[(void)*(v4 - 3) + 16] & 2) == 0)
    {
      unint64_t v6 = -174LL;
      while (1)
      {
        std::istream::read(v11, &v10, 1LL);
        unsigned int v7 = v11[0];
        if (v6 >= 4)
        {
          char v8 = v10;
        }

        else
        {
          char v8 = 0;
          char v10 = 0;
        }

        int v5 = dword_1000183B0[(v8 ^ *a2)] ^ (*a2 >> 8);
        *a2 = v5;
        ++v6;
        if ((v12[(void)*(v7 - 3) + 16] & 2) != 0) {
          goto LABEL_13;
        }
      }

      int v5 = *a2;
    }

LABEL_13:
    *a2 = ~v5;
  }

  else if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR))
  {
    sub_1000175D0();
  }

  std::filebuf::~filebuf(v12);
  std::ios::~ios(&v14);
  return v3 != 0;
}

void sub_1000121E8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

BOOL sub_100012204(uint64_t *a1, int *a2)
{
  BOOL v4 = sub_100012038(a1, a2);
  if (v7 < 0) {
    operator delete(__p);
  }
  return v4;
}

void sub_100012264( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100012280(uint64_t a1)
{
  *(_WORD *)char v10 = 0;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  std::string __p = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v11 = 0LL;
  __int16 v14 = 0;
  __int128 v18 = xmmword_1000183A0;
  if (!sub_100011D44(a1, (uint64_t)v10))
  {
    if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR)) {
      sub_10001764C();
    }
    goto LABEL_11;
  }

  sub_100011628(v10);
  sub_100004A4C(buf, "isCrcOkay");
  BOOL v2 = sub_100012038((uint64_t *)a1, &v9);
  BOOL v3 = v2;
  if (SHIBYTE(v23) < 0)
  {
    operator delete(*(void **)buf);
    if (!v3) {
      goto LABEL_11;
    }
  }

  else if (!v2)
  {
    goto LABEL_11;
  }

  int v4 = v9;
  if (HIDWORD(v18) == v9)
  {
    uint64_t v5 = 1LL;
    goto LABEL_12;
  }

  unint64_t v6 = (os_log_s *)qword_1000205A0;
  if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR))
  {
    else {
      uint64_t v8 = *(void *)a1;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = v8;
    __int16 v20 = 1024;
    int v21 = HIDWORD(v18);
    __int16 v22 = 1024;
    int v23 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "#fu,isCrcOkay,file,%s,crcMismatch,onFile,%08x,calculated,%08x",  buf,  0x18u);
  }

LABEL_11:
  uint64_t v5 = 0LL;
LABEL_12:
  if (SHIBYTE(v17) < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v13) < 0) {
    operator delete(v11);
  }
  return v5;
}

void sub_100012438( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

BOOL sub_100012470(uint64_t a1, int a2)
{
  __int16 v8 = 0;
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  std::string __p = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  int v9 = 0LL;
  unsigned __int16 v12 = 0;
  __int128 v16 = xmmword_1000183A0;
  BOOL v4 = sub_100011D44(a1, (uint64_t)&v8);
  if (v4)
  {
    if (v12 != a2)
    {
      uint64_t v5 = (os_log_s *)qword_1000205A0;
      if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_DEFAULT))
      {
        else {
          uint64_t v6 = *(void *)a1;
        }
        *(_DWORD *)buf = 67109634;
        int v18 = v12;
        __int16 v19 = 1024;
        int v20 = a2;
        __int16 v21 = 2080;
        uint64_t v22 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#fu,isVersionOkay, Incorrect file version %d, expected %d, file %s",  buf,  0x18u);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR))
  {
    sub_1000176B0();
  }

  if (SHIBYTE(v15) < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v11) < 0) {
    operator delete(v9);
  }
  return v4;
}

void sub_1000125D8(_Unwind_Exception *exception_object)
{
}

BOOL sub_1000125F4(uint64_t a1)
{
  if (!v2)
  {
    BOOL v4 = (os_log_s *)qword_1000205A0;
    BOOL v5 = os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0LL;
    if (!v5) {
      return result;
    }
    else {
      uint64_t v6 = *(void *)a1;
    }
    int v7 = 136315138;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#fu,%s does not exist", (uint8_t *)&v7, 0xCu);
    return 0LL;
  }

  if ((sub_100012280(a1) & 1) != 0) {
    return 1LL;
  }
  BOOL result = os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100017714();
    return 0LL;
  }

  return result;
}

BOOL sub_100012700(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100011744((uint64_t *)a1);
  if (!v5)
  {
    uint64_t v8 = (os_log_s *)qword_1000205A0;
    BOOL v9 = os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0LL;
    if (!v9) {
      return result;
    }
    else {
      uint64_t v10 = *(void *)a1;
    }
    int v12 = 136315138;
    uint64_t v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#fu,%s does not exist", (uint8_t *)&v12, 0xCu);
    return 0LL;
  }

  uint64_t v6 = v4;
  if (v4 != a2)
  {
    uint64_t v11 = (os_log_s *)qword_1000205A0;
    BOOL result = os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_100017778(a2, v6, v11);
    return 0LL;
  }

  if ((sub_100012280(a1) & 1) != 0) {
    return 1LL;
  }
  BOOL result = os_log_type_enabled((os_log_t)qword_1000205A0, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100017714();
    return 0LL;
  }

  return result;
}

void sub_100012854(uint64_t a1@<X8>)
{
  *(void *)(v1 - std::istream::~istream(v1, v2 + 8) = a1;
}

void sub_10001286C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100012880(uint64_t a1@<X8>)
{
  *(void *)(v1 - std::istream::~istream(v1, v2 + 8) = a1;
}

void sub_100012898( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1000128BC(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_1000128C8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_1000128DC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000128EC(uint64_t a1@<X8>)
{
  *(void *)(v1 - std::istream::~istream(v1, v2 + 8) = a1;
}

  ;
}

void sub_100012918(void *a1, __int16 **a2)
{
  char v2 = a1 + 1;
  BOOL v3 = (_BYTE *)a1[1];
  a1[2] = v3;
  unint64_t v4 = *a2;
  char v5 = a2[1];
  if (*a2 != v5)
  {
    do
    {
      __int16 v7 = *v4;
      unint64_t v8 = a1[3];
      if ((unint64_t)v3 >= v8)
      {
        unint64_t v10 = *v2;
        uint64_t v11 = &v3[-*v2];
        unint64_t v12 = (unint64_t)(v11 + 1);
        unint64_t v13 = v8 - v10;
        if (2 * v13 > v12) {
          unint64_t v12 = 2 * v13;
        }
        if (v13 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v14 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v14 = v12;
        }
        if (v14) {
          uint64_t v15 = (char *)operator new(v14);
        }
        else {
          uint64_t v15 = 0LL;
        }
        __int128 v16 = &v11[(void)v15];
        uint64_t v17 = &v11[(void)v15];
        *uint64_t v17 = v7;
        BOOL v9 = v17 + 1;
        if (v3 != (_BYTE *)v10)
        {
          int v18 = &v3[~v10];
          do
          {
            char v19 = *--v3;
            (v18--)[(void)v15] = v19;
          }

          while (v3 != (_BYTE *)v10);
          BOOL v3 = (_BYTE *)*v2;
          __int128 v16 = v15;
        }

        a1[1] = v16;
        a1[2] = v9;
        a1[3] = &v15[v14];
        if (v3) {
          operator delete(v3);
        }
      }

      else
      {
        *BOOL v3 = v7;
        BOOL v9 = v3 + 1;
      }

      a1[2] = v9;
      unint64_t v20 = a1[3];
      if ((unint64_t)v9 >= v20)
      {
        unint64_t v21 = *v2;
        uint64_t v22 = &v9[-*v2];
        unint64_t v23 = (unint64_t)(v22 + 1);
        if ((uint64_t)(v22 + 1) < 0) {
LABEL_39:
        }
          sub_100006CB4();
        unint64_t v24 = v20 - v21;
        if (2 * v24 > v23) {
          unint64_t v23 = 2 * v24;
        }
        if (v24 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v25 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v25 = v23;
        }
        if (v25) {
          int v26 = operator new(v25);
        }
        else {
          int v26 = 0LL;
        }
        uint64_t v27 = (char *)v26 + v25;
        v22[(void)v26] = HIBYTE(v7);
        BOOL v3 = &v22[(void)v26 + 1];
        if (v9 == (_BYTE *)v21)
        {
          a1[1] = &v22[(void)v26];
          a1[2] = v3;
          a1[3] = v27;
        }

        else
        {
          uint64_t v28 = &v9[~v21];
          do
          {
            char v29 = *--v9;
            (v28--)[(void)v26] = v29;
          }

          while (v9 != (_BYTE *)v21);
          BOOL v9 = (_BYTE *)a1[1];
          a1[1] = v26;
          a1[2] = v3;
          a1[3] = v27;
          if (!v9) {
            goto LABEL_37;
          }
        }

        operator delete(v9);
      }

      else
      {
        *BOOL v9 = HIBYTE(v7);
        BOOL v3 = v9 + 1;
      }

LABEL_37:
      a1[2] = v3;
      ++v4;
    }

    while (v4 != v5);
  }

uint64_t sub_100012AF0@<X0>(unsigned __int8 *a1@<X0>, std::stringbuf::string_type *a2@<X8>)
{
  unint64_t v4 = std::string::append(&v14, ": [");
  __int128 v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  int64_t cap = v4->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v5;
  v4->__r_.__value_.__l.__size_ = 0LL;
  v4->__r_.__value_.__l.__cap_ = 0LL;
  v4->__r_.__value_.__r.__words[0] = 0LL;
  if (cap >= 0) {
    uint64_t v6 = __p;
  }
  else {
    uint64_t v6 = (void **)__p[0];
  }
  if (cap >= 0) {
    uint64_t v7 = HIBYTE(cap);
  }
  else {
    uint64_t v7 = (uint64_t)__p[1];
  }
  sub_100014C40(&v17, (uint64_t)v6, v7);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
  LOBYTE(__p[0]) = 48;
  unint64_t v8 = sub_100012E64(&v17, (char *)__p);
  *(_DWORD *)((char *)v8 + *(void *)(*v8 - 24LL) + std::istream::~istream(v1, v2 + 8) = *(_DWORD *)((_BYTE *)v8 + *(void *)(*v8 - 24LL) + 8) & 0xFFFFFFB5 | 8;
  if (*((void *)a1 + 2) != *((void *)a1 + 1))
  {
    unint64_t v9 = 0LL;
    do
    {
      unint64_t v10 = sub_100014C40(&v17, (uint64_t)"0x", 2LL);
      *(void *)((char *)v10 + *(void *)(*v10 - 24LL) + 24) = 2LL;
      std::ostream::operator<<();
      uint64_t v12 = *((void *)a1 + 1);
      uint64_t v11 = *((void *)a1 + 2);
      if (v9 != ~v12 + v11)
      {
        sub_100014C40(&v17, (uint64_t)", ", 2LL);
        uint64_t v12 = *((void *)a1 + 1);
        uint64_t v11 = *((void *)a1 + 2);
      }

      ++v9;
    }

    while (v9 < v11 - v12);
  }

  sub_100014C40(&v17, (uint64_t)"]", 1LL);
  std::stringbuf::str(a2, &v18);
  std::streambuf::~streambuf(&v18);
  return std::ios::~ios(&v19);
}

void sub_100012CF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21, char a22)
{
}

uint64_t sub_100012D44(uint64_t a1)
{
  uint64_t v2 = a1 + 8;
  *(void *)a1 = v3;
  *(void *)(a1 + *(void *)(v3 - 24)) = v4;
  __int128 v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
  std::ios_base::init(v5, (void *)(a1 + 8));
  v5[1].__vftable = 0LL;
  v5[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf(v2);
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 8std::istream::~istream(v1, v2 + 8) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_100012E08(_Unwind_Exception *a1)
{
}

void *sub_100012E30@<X0>(int a1@<W0>, void *a2@<X8>)
{
  else {
    uint64_t v2 = (&off_10001CB88)[(char)(a1 - 1)];
  }
  return sub_100004A4C(a2, v2);
}

void *sub_100012E64(void *a1, char *a2)
{
  uint64_t v3 = (char *)a1 + *(void *)(*a1 - 24LL);
  int v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
    __int128 v5 = std::locale::use_facet(&v8, &std::ctype<char>::id);
    int v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32LL);
    std::locale::~locale(&v8);
    *((_DWORD *)v3 + 36) = v6;
  }

  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void sub_100012EF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

uint64_t sub_100012F04(uint64_t a1)
{
  uint64_t v3 = a1 + 8;
  std::streambuf::~streambuf(v3);
  std::ios::~ios(a1 + 112);
  return a1;
}

uint64_t sub_100012F88(uint64_t a1, int a2)
{
  int v2 = 0;
  if (a2 < 0)
  {
    int v4 = 0;
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 8);
    int v4 = 0;
    if (*(void *)(a1 + 16) - v3 > (unint64_t)a2)
    {
      int v4 = *(unsigned __int8 *)(v3 + a2);
      int v2 = 1;
    }
  }

  return v4 | (v2 << 8);
}

BOOL sub_100012FC0(uint64_t a1, int a2, char a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16) - v3;
  if (v4 > a2) {
    *(_BYTE *)(v3 + a2) = a3;
  }
  return v4 > a2;
}

BOOL sub_100012FE4(int a1)
{
  return (a1 - 9) < 4;
}

uint64_t sub_100012FF4(unsigned int a1, int a2)
{
  if (a2 == 2)
  {
    if (a1 < 0x21 && ((0x1FFFFFE01uLL >> a1) & 1) != 0) {
      return algn_1000188F6[(char)a1];
    }
LABEL_9:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_10001309C(exception, "Invalid raw value for extended preamble");
  }

  if (a2 != 1 || a1 >= 4) {
    goto LABEL_9;
  }
  return (a1 + 9);
}

void sub_100013088(_Unwind_Exception *a1)
{
}

std::runtime_error *sub_10001309C(std::runtime_error *a1, const char *a2)
{
  BOOL result = std::runtime_error::runtime_error(a1, a2);
  return result;
}

uint64_t sub_1000130C0( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((_DWORD)a2 == 1)
  {
    int v8 = result;
    BOOL result = 0LL;
    switch(v8)
    {
      case 0:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
        sub_100015380("Preambles not supported in HSI 1.x", a2, a3, a4, a5, a6, a7, a8, v10);
        goto LABEL_9;
      case 9:
        return result;
      case 10:
        return 1LL;
      case 11:
        return 2LL;
      case 12:
        return 3LL;
      default:
        goto LABEL_9;
    }
  }

  if ((_DWORD)a2 != 2)
  {
    if ((_DWORD)a2)
    {
LABEL_9:
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_10001309C(exception, "Invalid extended preamble");
    }

    else
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_10001309C(exception, "Unknown HSI version");
    }
  }

  return result;
}

void sub_100013184(_Unwind_Exception *a1)
{
}

uint64_t sub_10001319C@<X0>(char a1@<W0>, std::stringbuf::string_type *a2@<X8>)
{
  unint64_t v4 = sub_100014C40(&v8, (uint64_t)"Preamble_", 9LL);
  char v11 = a1;
  sub_100014C40(v4, (uint64_t)&v11, 1LL);
  std::stringbuf::str(a2, &v9);
  *(void *)((char *)v7
  uint64_t v8 = v5;
  std::streambuf::~streambuf(&v9);
  return std::ios::~ios(&v10);
}

void sub_10001326C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100013280( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((result | 2) != 2)
  {
    sub_100015380("Exception: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid SFD code");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_10001309C(exception, "Invalid sfd code");
  }

  return result;
}

void sub_1000132F8(_Unwind_Exception *a1)
{
}

void *sub_10001330C@<X0>(int a1@<W0>, void *a2@<X8>)
{
  if (a1) {
    int v2 = "Binary";
  }
  else {
    int v2 = "Ternary";
  }
  return sub_100004A4C(a2, v2);
}

uint64_t sub_10001332C( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result > 0x1B || ((1 << result) & 0xFDB548F) == 0)
  {
    sub_100015380("Exception: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid session type");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_10001309C(exception, "Invalid session type");
  }

  return result;
}

void sub_1000133B4(_Unwind_Exception *a1)
{
}

void *sub_1000133C8@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 0x1B) {
    int v2 = "UNKNOWN";
  }
  else {
    int v2 = (&off_10001CD38)[(char)a1];
  }
  return sub_100004A4C(a2, v2);
}

uint64_t sub_1000133F8(unsigned int a1)
{
  return (a1 > 0x1B) | (0x24FFFFu >> a1) & 1;
}

uint64_t sub_100013414( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result > 4)
  {
    sub_100015380("Exception: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid gr superframe format");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_10001309C(exception, "Invalid session type");
  }

  return result;
}

void sub_100013488(_Unwind_Exception *a1)
{
}

void *sub_10001349C@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 4) {
    int v2 = "UNKNOWN";
  }
  else {
    int v2 = (&off_10001CE18)[(char)a1];
  }
  return sub_100004A4C(a2, v2);
}

uint64_t sub_1000134CC( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result > 1)
  {
    sub_100015380("Exception: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid session role");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_10001309C(exception, "Invalid session role");
  }

  return result;
}

void sub_10001353C(_Unwind_Exception *a1)
{
}

void *sub_100013550@<X0>(int a1@<W0>, void *a2@<X8>)
{
  int v2 = "UNKNOWN";
  if (a1 == 1) {
    int v2 = "Responder";
  }
  if (a1) {
    uint64_t v3 = (char *)v2;
  }
  else {
    uint64_t v3 = "Initiator";
  }
  return sub_100004A4C(a2, v3);
}

uint64_t sub_100013580( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result > 0x36 || ((1LL << result) & 0x49E3C884FAA1F2LL) == 0)
  {
    sub_100015380("Exception: Invalid config parameter ID %d", a2, a3, a4, a5, a6, a7, a8, result);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_10001309C(exception, "Invalid config parameter ID");
  }

  return result;
}

void sub_10001360C(_Unwind_Exception *a1)
{
}

_WORD *sub_100013620@<X0>(_WORD *result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  if (result < 0x33 && (__int16 v4 = a2, (a2 - 1) > 0xFFFFFFCC))
  {
    __int16 v6 = (__int16)result;
    uint64_t v7 = operator new(2uLL);
    *(void *)a3 = v7;
    *uint64_t v7 = v6 | (v4 << 8);
    BOOL result = v7 + 1;
    *(void *)(a3 + std::ostream::~ostream(v2, v3 + 8) = result;
    *(void *)(a3 + 16) = result;
    char v5 = 1;
  }

  else
  {
    char v5 = 0;
    *(_BYTE *)a3 = 0;
  }

  *(_BYTE *)(a3 + 24) = v5;
  return result;
}

uint64_t sub_10001368C( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((result - 1) > 2)
  {
    sub_100015380("Exception: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid range debug level");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_10001309C(exception, "Invalid range debug level");
  }

  return result;
}

void sub_100013700(_Unwind_Exception *a1)
{
}

void *sub_100013714@<X0>(int a1@<W0>, void *a2@<X8>)
{
  else {
    int v2 = (&off_10001CE40)[(char)(a1 - 1)];
  }
  return sub_100004A4C(a2, v2);
}

uint64_t sub_100013748( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result >= 0x62 && (_DWORD)result != 16398 && (_DWORD)result != 0xFFFF)
  {
    sub_100015514("Fault: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Unknown error code");
    return 0xFFFFLL;
  }

  return result;
}

void *sub_1000137A4@<X0>(int a1@<W0>, void *a2@<X8>)
{
  int v2 = "SUCCESS";
  switch(a1)
  {
    case 0:
      return sub_100004A4C(a2, v2);
    case 1:
      int v2 = "INVALID_CMD_PARAM";
      break;
    case 2:
      int v2 = "UNKNOWN_CMD";
      break;
    case 3:
      int v2 = "INVALID_CMD_LEN";
      break;
    case 4:
      int v2 = "MEMORY_FAILURE";
      break;
    case 5:
      int v2 = "INTERNAL";
      break;
    case 6:
      int v2 = "BUSY";
      break;
    case 7:
      int v2 = "CMD_DISALLOWED";
      break;
    case 8:
      int v2 = "SES_MAX_LIMIT_REACHED";
      break;
    case 9:
      int v2 = "SES_NOT_FOUND";
      break;
    case 10:
      int v2 = "TBD3";
      break;
    case 11:
      int v2 = "TBD4";
      break;
    case 12:
      int v2 = "SES_TIMEOUT";
      break;
    case 13:
      int v2 = "SES_SYNC_TIMEOUT";
      break;
    case 14:
      int v2 = "MISSED_RANGING_CYCLE";
      break;
    case 15:
      int v2 = "LOCAL_SES_REMOVE_SUCCESS";
      break;
    case 16:
      int v2 = "LOCAL_SES_DISABLE_SUCCESS";
      break;
    case 17:
      int v2 = "SES_COMPLETED";
      break;
    case 18:
      int v2 = "SES_ALREADY_ACTIVE";
      break;
    case 19:
      int v2 = "SES_ALREADY_DISABLED";
      break;
    case 20:
      int v2 = "SES_SCHEDULING_CONFLICT";
      break;
    case 21:
      int v2 = "SES_COEX_CONFLICT";
      break;
    case 22:
      int v2 = "SES_WRONG_SYNC";
      break;
    case 23:
      int v2 = "START_TIME_ELAPSED";
      break;
    case 24:
      int v2 = "SES_UAP_ALREADY_PENDING";
      break;
    case 25:
      int v2 = "COEX_UNSUPPORTED";
      break;
    case 26:
      int v2 = "INVALID_TX_MINI_SLOT_SIZE";
      break;
    case 27:
      int v2 = "INVALID_RX_MINI_SLOT_SIZE";
      break;
    case 28:
      int v2 = "INVALID_SES_ROLE";
      break;
    case 29:
      int v2 = "INVALID_ANTENNA_CFG";
      break;
    case 30:
      int v2 = "INVALID_NACCESS_SLOTS";
      break;
    case 31:
      int v2 = "INVALID_PREAMBLE";
      break;
    case 32:
      int v2 = "INVALID_FEM_CFG";
      break;
    case 33:
      int v2 = "SUPERFRAMES_OVERLAP";
      break;
    case 34:
      int v2 = "INVALID_INTERVAL";
      break;
    case 35:
      int v2 = "INVALID_PKT_TYPE";
      break;
    case 36:
      int v2 = "INVALID_MAC_ADDR";
      break;
    case 37:
      int v2 = "MUTE_UNMUTE_DISALLOWED";
      break;
    case 38:
      int v2 = "SES_MUTED";
      break;
    case 39:
      int v2 = "INVALID_CHANNEL";
      break;
    case 40:
      int v2 = "DTM_CMD_UNSUPPORTED";
      break;
    case 41:
      int v2 = "DTM_SES_NOT_READY";
      break;
    case 42:
      int v2 = "DTM_SES_BUSY";
      break;
    case 43:
      int v2 = "DTM_PAYLOAD_INVALID_LEN";
      break;
    case 44:
      int v2 = "DTM_INVALID_SES_TO";
      break;
    case 45:
      int v2 = "MP_CMD_INTERLEAVED";
      break;
    case 46:
      int v2 = "MP_CMD_LEN_OVERFLOW";
      break;
    case 47:
      int v2 = "INVALID_SES_TYPE";
      break;
    case 48:
      int v2 = "INVALID_ALISHA_UWB_CFG_ID";
      break;
    case 49:
      int v2 = "INVALID_ALISHA_RAN_MULTIPLIER";
      break;
    case 50:
      int v2 = "INVALID_ALISHA_NRESPONDERS";
      break;
    case 51:
      int v2 = "INVALID_ALISHA_NCHAPS_PER_SLOT";
      break;
    case 52:
      int v2 = "INVALID_ALISHA_NSLOTS_PER_ROUND";
      break;
    case 53:
      int v2 = "INVALID_ALISHA_RBLOCK_CFG";
      break;
    case 54:
      int v2 = "ALISHA_UWB_SES_ID_NOT_FOUND";
      break;
    case 55:
      int v2 = "ALISHA_UWB_SES_ID_ALREADY_IN_USE";
      break;
    case 56:
      int v2 = "ALISHA_KEY_STORE_FULL";
      break;
    case 57:
      int v2 = "INVALID_ALISHA_RESPONDER_IDX";
      break;
    case 58:
      int v2 = "SES_GRUAP_ALREADY_PENDING";
      break;
    case 59:
      int v2 = "INVALID_CHANNEL_HOP_PATTERN";
      break;
    case 60:
      int v2 = "INVALID_ACCESS_SLOT_IDX";
      break;
    case 61:
      int v2 = "INVALID_GR_TYPE";
      break;
    case 62:
      int v2 = "SLOT_TIME_ELAPSED";
      break;
    case 63:
      int v2 = "INVALID_ALISHA_PULSE_SHAPE_COMBO";
      break;
    case 64:
      int v2 = "INVALID_ALISHA_HOP_MODE";
      break;
    case 65:
      int v2 = "INVALID_ALISHA_HOP_SEQUENCE";
      break;
    case 66:
      int v2 = "INVALID_SUBRATE";
      break;
    case 67:
      int v2 = "SES_NOT_ACTIVE";
      break;
    case 68:
      int v2 = "SES_SUBRATE_ALREADY_PENDING";
      break;
    case 69:
      int v2 = "SES_SUBRATE_ALREADY_EFFECTIVE";
      break;
    case 70:
      int v2 = "UAP_RX_FAILED";
      break;
    case 71:
      int v2 = "ALISHA_URSK_RETRIEVAL_FAILED";
      break;
    case 72:
      int v2 = "ALISHA_GET_KEY_ALREADY_PENDING";
      break;
    case 73:
      int v2 = "ALISHA_STS_INDEX_EXHAUSTED";
      break;
    case 74:
      int v2 = "ALISHA_BLOCK_IDX_EXHAUSTED";
      break;
    case 75:
      int v2 = "ALISHA_URSK_TTL_EXPIRED";
      break;
    case 76:
      int v2 = "INVALID_ALISHA_STS_INDEX_0";
      break;
    case 77:
      int v2 = "ALISHA_RESPONSE_TIMEOUT";
      break;
    case 78:
      int v2 = "ALISHA_TOTAL_TIMEOUT";
      break;
    case 79:
      int v2 = "UNAUTHENTICATED_CAL_BLOB";
      break;
    case 80:
      int v2 = "INVALID_SFD";
      break;
    case 81:
      int v2 = "INVALID_ALISHA_NSIMRESPONDERS";
      break;
    case 82:
      int v2 = "DUPLICATE";
      break;
    case 83:
      int v2 = "NMI_NAP_RX_FAILED";
      break;
    case 84:
      int v2 = "NMI_NAR_RX_FAILED";
      break;
    case 85:
      int v2 = "NMI_SOR_RX_FAILED";
      break;
    case 86:
      int v2 = "NMI_NAP_WRONG_SYNC";
      break;
    case 87:
      int v2 = "NMI_WRONG_IRK";
      break;
    case 88:
      int v2 = "NMI_RNG_DIS_BOTH_SIDES";
      break;
    case 89:
      int v2 = "NMI_POLL_RSP_RX_OTHER_FAILURE";
      break;
    case 90:
      int v2 = "NMI_DATA_RX_OTHER_FAILURE";
      break;
    case 91:
      int v2 = "NMI_POLL_RSP_WRONG_SYNC";
      break;
    case 92:
      int v2 = "NMI_DATA_WRONG_SYNC";
      break;
    case 93:
      int v2 = "SES_EXCLUSIVE_MAC_DISALLOWED";
      break;
    case 94:
      int v2 = "NMI_NAR_WRONG_SYNC";
      break;
    case 95:
      int v2 = "NMI_SOR_WRONG_SYNC";
      break;
    case 96:
      int v2 = "NMI_INVALID_RTT_TAT";
      break;
    case 97:
      int v2 = "NMI_POLL_RSP_MISSED_CYCLE";
      break;
    default:
      uint64_t v3 = "UNKNOWN";
      if (a1 == 0xFFFF) {
        uint64_t v3 = "UNKNOWN_ERROR";
      }
      if (a1 == 16398) {
        int v2 = "FACTORY_STOP_TEST";
      }
      else {
        int v2 = (char *)v3;
      }
      break;
  }

  return sub_100004A4C(a2, v2);
}

uint64_t sub_100013C98( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result > 6)
  {
    sub_100015380("Exception: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid Rose hardware version");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_10001309C(exception, "Invalid Rose hardware version");
  }

  return result;
}

void sub_100013D08(_Unwind_Exception *a1)
{
}

void *sub_100013D1C@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 6) {
    int v2 = "UNKNOWN";
  }
  else {
    int v2 = (&off_10001CE58)[(__int16)a1];
  }
  return sub_100004A4C(a2, v2);
}

uint64_t sub_100013D4C( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (((result - 208) > 0x2E || ((1LL << (result + 48)) & 0x7FFF47FF1FFFLL) == 0)
    && (result > 0x18 || ((1 << result) & 0x116003F) == 0))
  {
    sub_100015380("Exception: %s - 0x%x", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid rx status.");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_10001309C(exception, "Invalid rx status.");
  }

  return result;
}

void sub_100013DFC(_Unwind_Exception *a1)
{
}

uint64_t sub_100013E10(unsigned __int8 **a1)
{
  uint64_t v1 = *a1;
  int v2 = a1[1];
  if (*a1 == v2)
  {
    LOBYTE(v3) = 0;
  }

  else
  {
    int v3 = 0;
    int v4 = 0;
    do
    {
      int v5 = *v1++;
      unsigned int v6 = v5 - 2;
      int v7 = v3 | 2;
      if (v5 == 1) {
        v3 |= 1u;
      }
      if (v6 < 4)
      {
        ++v4;
        int v3 = v7;
      }
    }

    while (v1 != v2);
    if ((v4 & 0xFFFFFFFB) != 0) {
      sub_1000177E8();
    }
  }

  return v3;
}

uint64_t sub_100013E74(unsigned int a1)
{
  if (a1 >= 4) {
    sub_100017810();
  }
  return a1 & 1;
}

uint64_t sub_100013E90(unsigned int a1)
{
  if (a1 >= 4) {
    sub_100017838();
  }
  return (a1 >> 1) & 1;
}

void *sub_100013EAC@<X0>(int a1@<W0>, void *a2@<X8>)
{
  else {
    int v2 = (&off_10001CE90)[(char)(a1 - 1)];
  }
  return sub_100004A4C(a2, v2);
}

void *sub_100013EE0@<X0>(int a1@<W0>, void *a2@<X8>)
{
  int v2 = "UNKNOWN";
  if (a1 == 9) {
    int v2 = "CHANNEL9";
  }
  if (a1 == 5) {
    int v3 = "CHANNEL5";
  }
  else {
    int v3 = (char *)v2;
  }
  return sub_100004A4C(a2, v3);
}

void *sub_100013F10@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 6) {
    int v2 = "UNKNOWN";
  }
  else {
    int v2 = (&off_10001CEB8)[(char)a1];
  }
  return sub_100004A4C(a2, v2);
}

_BYTE *sub_100013F40(_BYTE *result, int a2)
{
  if (a2 == 5)
  {
    char v2 = 1;
  }

  else
  {
    if (a2 != 9) {
      return result;
    }
    char v2 = 2;
  }

  *result |= v2;
  return result;
}

_WORD *sub_100013F6C(_WORD *result, int a2)
{
  return result;
}

uint64_t sub_100013F98( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 v8 = a1;
  switch((_DWORD)a2)
  {
    case 1:
      if ((_DWORD)a1)
      {
        if ((_DWORD)a1 != 1)
        {
          sub_100015380( "Exception: %s - %d",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"Invalid Rose channel config for HSI V1");
          exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          sub_10001309C(exception, "Invalid Rose channel config");
LABEL_12:
        }

        return 9;
      }

      else
      {
        return 5;
      }

    case 2:
      sub_10001408C(a1, a2, a3, a4, a5, a6, a7, a8);
      break;
    case 0:
      sub_100015380("Exception: %s", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Unknown HSI version");
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_10001309C(exception, "Unknown HSI version");
      goto LABEL_12;
  }

  return v8;
}

void sub_100014074(_Unwind_Exception *a1)
{
}

uint64_t sub_10001408C( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((_DWORD)result != 9 && (_DWORD)result != 5)
  {
    sub_100015380("Exception: %s - %d", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid Rose channel config for HSI V2");
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_10001309C(exception, "Invalid Rose channel config");
  }

  return result;
}

void sub_100014108(_Unwind_Exception *a1)
{
}

uint64_t sub_10001411C(int a1, int a2)
{
  if (a2 == 2)
  {
    if (a1 == 5) {
      return 5LL;
    }
    else {
      return 9LL;
    }
  }

  else
  {
    if (a2 != 1)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_10001309C(exception, "Unknown HSI version");
    }

    return a1 != 5;
  }

void sub_10001418C(_Unwind_Exception *a1)
{
}

unint64_t sub_1000141A0(unsigned int a1)
{
  unsigned int v1 = a1 >> 11;
  if ((a1 >> 11) - 1 >= 6)
  {
    if (!v1 && (a1 == 9 || a1 == 5))
    {
      LOBYTE(v1) = 0;
      unint64_t v2 = ((unint64_t)a1 << 8) | 0x10000;
    }

    else
    {
      LOBYTE(v1) = 0;
      unint64_t v2 = 0LL;
    }
  }

  else
  {
    unint64_t v2 = ((unint64_t)(a1 & 0x7FF) << 32) | 0x1000000000000LL;
  }

  return v2 | v1;
}

uint64_t sub_100014208(unsigned __int8 *a1)
{
  int v1 = *a1;
  __int16 v2 = (_WORD)v1 << 11;
  unsigned __int16 v3 = v1 - 1;
  if ((v1 - 1) >= 6)
  {
    if (*a1) {
      return v3;
    }
    if (a1[2]) {
      return (unsigned __int16)(v2 | a1[1]);
    }
LABEL_8:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_10001309C(exception, "Missing channel-select for band");
  }

  if (!a1[6]) {
    goto LABEL_8;
  }
  return (unsigned __int16)(*((_WORD *)a1 + 2) | v2);
}

void sub_1000142AC(_Unwind_Exception *a1)
{
}

uint64_t sub_1000142C4(int a1)
{
  if ((*(void *)&a1 & 0xFF0000LL) != 0 && (unint64_t v1 = sub_1000141A0((unsigned __int16)a1), v2))
  {
    BOOL v3 = v1 == 0LL;
    unint64_t v4 = v1 >> 16;
    if ((_BYTE)v1) {
      unsigned __int8 v5 = 0;
    }
    else {
      unsigned __int8 v5 = BYTE1(v1);
    }
    if (v3) {
      int v6 = v4;
    }
    else {
      int v6 = 0;
    }
  }

  else
  {
    unsigned __int8 v5 = 0;
    int v6 = 0;
  }

  return v5 | (v6 << 8);
}

uint64_t sub_100014310@<X0>(unsigned __int8 *a1@<X0>, std::stringbuf::string_type *a2@<X8>)
{
  int v4 = *a1;
  switch(*a1)
  {
    case 0u:
      unsigned __int8 v5 = &v14;
      int v6 = "UWB";
      uint64_t v7 = 3LL;
      goto LABEL_10;
    case 1u:
      uint64_t v7 = 3LL;
      unsigned __int8 v5 = sub_100014C40(&v14, (uint64_t)"UNI", 3LL);
      int v6 = "I-3";
      goto LABEL_10;
    case 2u:
      unsigned __int8 v5 = sub_100014C40(&v14, (uint64_t)"UNI", 3LL);
      int v6 = "I-5a";
      goto LABEL_9;
    case 3u:
      unsigned __int8 v5 = sub_100014C40(&v14, (uint64_t)"UNI", 3LL);
      int v6 = "I-5b";
      goto LABEL_9;
    case 4u:
      unsigned __int8 v5 = sub_100014C40(&v14, (uint64_t)"UNI", 3LL);
      int v6 = "I-5c";
      goto LABEL_9;
    case 5u:
      unsigned __int8 v5 = sub_100014C40(&v14, (uint64_t)"UNI", 3LL);
      int v6 = "I-5d";
      goto LABEL_9;
    case 6u:
      unsigned __int8 v5 = sub_100014C40(&v14, (uint64_t)"UNI", 3LL);
      int v6 = "I-35";
LABEL_9:
      uint64_t v7 = 4LL;
LABEL_10:
      sub_100014C40(v5, (uint64_t)v6, v7);
      int v4 = *a1;
      break;
    default:
      break;
  }

  if ((v4 - 1) < 6)
  {
    if (a1[6])
    {
      unsigned __int8 v8 = sub_100014C40(&v14, (uint64_t)" Ch", 3LL);
      if (a1[6])
      {
        uint64_t v9 = *((unsigned __int16 *)a1 + 2);
LABEL_15:
        std::ostream::operator<<(v8, v9);
        goto LABEL_16;
      }

      goto LABEL_23;
    }

    goto LABEL_24;
  }

  if (!v4)
  {
    if (a1[2])
    {
      unsigned __int8 v8 = sub_100014C40(&v14, (uint64_t)" Ch", 3LL);
      if (a1[2])
      {
        uint64_t v9 = a1[1];
        goto LABEL_15;
      }

LABEL_24:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Missing channel-select for band");
  }

void sub_1000145B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

BOOL sub_1000145DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned int v2 = *a1;
  unsigned int v3 = *a2;
  if (v2 < v3) {
    return 1LL;
  }
  if (v2 == v3) {
    return a1[1] < a2[1];
  }
  return 0LL;
}

BOOL sub_100014614(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

BOOL sub_100014634(_BYTE *a1)
{
  return *a1 == 0;
}

uint64_t sub_100014644(unsigned int a1)
{
  unsigned int v1 = a1 >> 8;
  unsigned __int8 v2 = __rev16(a1);
  unsigned int v3 = bswap32(a1) >> 24;
  if (((1 << SBYTE1(a1)) & 0x101F7) == 0)
  {
    unsigned __int8 v2 = 0;
    unsigned int v3 = a1 >> 8;
  }

  BOOL v4 = v1 > 0x10;
  int v5 = v1 <= 0x10 && ((1 << SBYTE1(a1)) & 0x101F7) != 0;
  if (v4)
  {
    unsigned __int8 v2 = 0;
    LOWORD(v3) = v5;
  }

  return (unsigned __int16)(v2 | (unsigned __int16)((_WORD)v3 << 8)) | (v5 << 16);
}

uint64_t sub_100014698(unsigned __int16 *a1)
{
  return bswap32(*a1) >> 16;
}

uint64_t sub_1000146A8(unsigned __int8 *a1)
{
  int v1 = a1[1];
  int v2 = *a1;
  if (*a1)
  {
    if (v2 == 16 && v1 == 1)
    {
      int v1 = 1;
      int v2 = 16;
    }
  }

  else
  {
    unsigned int v3 = v1 - 1;
    if (v3 >= 0xD)
    {
      int v1 = 0;
      int v2 = 0;
    }

    else
    {
      int v2 = 0;
      int v1 = byte_100018924[(char)v3];
    }
  }

  return v1 | (v2 << 8);
}

uint64_t sub_10001470C@<X0>(_BYTE *a1@<X0>, std::stringbuf::string_type *a2@<X8>)
{
  switch(*a1)
  {
    case 0:
      BOOL v4 = &v17;
      int v5 = "Legacy_";
      uint64_t v6 = 7LL;
      goto LABEL_7;
    case 1:
      BOOL v4 = &v17;
      int v5 = "IEEE_";
      uint64_t v6 = 5LL;
      goto LABEL_7;
    case 2:
      uint64_t v7 = &v17;
      unsigned __int8 v8 = "IEEE_";
      uint64_t v9 = 5LL;
      goto LABEL_9;
    case 4:
      uint64_t v7 = &v17;
      unsigned __int8 v8 = "Proprietary_";
      uint64_t v9 = 12LL;
      goto LABEL_9;
    case 5:
      BOOL v4 = sub_100014C40(&v17, (uint64_t)"Split", 5LL);
      int v5 = "ND_";
      uint64_t v6 = 3LL;
LABEL_7:
      uint64_t v10 = sub_100014C40(v4, (uint64_t)v5, v6);
      char v11 = "BPRF";
      goto LABEL_10;
    case 6:
      uint64_t v7 = sub_100014C40(&v17, (uint64_t)"Split", 5LL);
      unsigned __int8 v8 = "ND_";
      uint64_t v9 = 3LL;
LABEL_9:
      uint64_t v10 = sub_100014C40(v7, (uint64_t)v8, v9);
      char v11 = "HPRF";
LABEL_10:
      uint64_t v12 = 4LL;
      goto LABEL_15;
    case 7:
      uint64_t v10 = &v17;
      goto LABEL_13;
    case 8:
      uint64_t v10 = sub_100014C40(&v17, (uint64_t)"Mixed_", 6LL);
LABEL_13:
      char v11 = "MMS";
      uint64_t v12 = 3LL;
      goto LABEL_15;
    case 0x10:
      uint64_t v10 = &v17;
      char v11 = "NB";
      uint64_t v12 = 2LL;
LABEL_15:
      sub_100014C40(v10, (uint64_t)v11, v12);
      break;
    default:
      break;
  }

  unint64_t v13 = sub_100014C40(&v17, (uint64_t)" PktIdx ", 8LL);
  std::ostream::operator<<(v13, a1[1]);
  std::stringbuf::str(a2, &v18);
  *(void *)((char *)v16
  uint64_t v17 = v14;
  std::streambuf::~streambuf(&v18);
  return std::ios::~ios(&v19);
}

void sub_100014910(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_100014924@<X0>( int a1@<W0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  switch(a1)
  {
    case 208:
      a2 = "SW_PADDING_VAL_MISMATCH";
      break;
    case 209:
      a2 = "SW_SC_MISMATCH";
      break;
    case 210:
      a2 = "SW_IE_HDR_MISMATCH";
      break;
    case 211:
      a2 = "SW_VENDOR_OUI_MISMATCH";
      break;
    case 212:
      a2 = "SW_HDR_TERM_IE_MISMATCH";
      break;
    case 213:
      a2 = "SW_UWB_SES_ID_MISMATCH";
      break;
    case 214:
      a2 = "SW_STS_INDEX_MISMATCH";
      break;
    case 215:
      a2 = "SW_INVALID_PLD_HDR_CONTENTS";
      break;
    case 216:
      a2 = "SW_INVALID_RDM_CONTENTS";
      break;
    case 217:
      a2 = "SW_ROUND_IDX_MISMATCH";
      break;
    case 218:
      a2 = "SW_INVALID_RCM_CONTENTS";
      break;
    case 219:
      a2 = "SW_INVALID_MRM_CONTENTS";
      break;
    case 220:
      a2 = "SW_INVALID_RRRM_CONTENTS";
      break;
    case 221:
    case 222:
    case 223:
    case 235:
    case 236:
    case 237:
    case 239:
LABEL_53:
      sub_100015380("Exception: %s - 0x%hhx", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (uint64_t)"Invalid rx status.");
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_10001309C(exception, "Invalid rx status.");
    case 224:
      a2 = "SW_SUPERFRAMES_OVERLAP";
      break;
    case 225:
      a2 = "SW_INVALID_SRC_ADDR";
      break;
    case 226:
      a2 = "SW_SKIPPED";
      break;
    case 227:
      a2 = "SW_AOA_UNCERTAIN";
      break;
    case 228:
      a2 = "SW_NEG_SOF_TS_ERROR";
      break;
    case 229:
      a2 = "SW_BUSY";
      break;
    case 230:
      a2 = "INVALID_FEM_CFG";
      break;
    case 231:
      a2 = "DECRYPTION_FAILED";
      break;
    case 232:
      a2 = "INVALID_CHANNEL_HOP_PATTERN";
      break;
    case 233:
      a2 = "INVALID_CHANNEL";
      break;
    case 234:
      a2 = "INVALID_CURRENT_CHANNEL";
      break;
    case 238:
      a2 = "SW_TIME_ELAPSED";
      break;
    case 240:
      a2 = "SW_ABORT";
      break;
    case 241:
      a2 = "SW_STS_MISMATCH";
      break;
    case 242:
      a2 = "SW_VERSION_PREFIX_MISMATCH";
      break;
    case 243:
      a2 = "SW_FC_MISMATCH";
      break;
    case 244:
      a2 = "SW_SEQN_MISMATCH";
      break;
    case 245:
      a2 = "SW_WRONG_SYNC";
      break;
    case 246:
      a2 = "SW_PDU_LEN_MISMATCH";
      break;
    case 247:
      a2 = "SW_PDU_ID_MISMATCH";
      break;
    case 248:
      a2 = "SW_UNSUPPORTED_VERSION";
      break;
    case 249:
      a2 = "SW_UAP_OFFSET_ELAPSED";
      break;
    case 250:
      a2 = "SW_INVALID_TX_MSLOT_SZ";
      break;
    case 251:
      a2 = "SW_INVALID_RX_MSLOT_SZ";
      break;
    case 252:
      a2 = "SW_INVALID_NACCESS_SLOTS";
      break;
    case 253:
      a2 = "SW_INVALID_INTERVAL";
      break;
    case 254:
      a2 = "SW_INVALID_PREAMBLE";
      break;
    default:
      a2 = "SUCCESS";
      switch(a1)
      {
        case 0:
          return sub_100004A4C(a9, a2);
        case 1:
          a2 = "TIMEOUT";
          return sub_100004A4C(a9, a2);
        case 2:
          a2 = "PHR_ERROR";
          return sub_100004A4C(a9, a2);
        case 3:
          a2 = "SECDED_ERROR";
          return sub_100004A4C(a9, a2);
        case 4:
          a2 = "STS_ERROR";
          return sub_100004A4C(a9, a2);
        case 5:
          a2 = "CRC_ERROR";
          return sub_100004A4C(a9, a2);
        case 17:
          a2 = "PHY_INVALID_CONFIG";
          return sub_100004A4C(a9, a2);
        case 18:
          a2 = "PHY_FINGER_LOSS";
          return sub_100004A4C(a9, a2);
        case 20:
          a2 = "PHY_SFD_FAILURE";
          return sub_100004A4C(a9, a2);
        case 24:
          a2 = "PHY_SECDED_FAILURE";
          return sub_100004A4C(a9, a2);
        default:
          goto LABEL_53;
      }
  }

  return sub_100004A4C(a9, a2);
}

void sub_100014C2C(_Unwind_Exception *a1)
{
}

void *sub_100014C40(void *a1, uint64_t a2, uint64_t a3)
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
      uint64_t v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
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
    if (!sub_100014DA4(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_100014D48( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

void sub_100014D90(_Unwind_Exception *a1)
{
}

uint64_t sub_100014DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_100014EE0(__p, v12, __c);
      unint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_100014EC4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100014EE0(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_1000048A8();
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

void sub_100014F88( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  va_list v18 = (va_list)&a9;
  uint64_t v10 = sub_100015068();
  sub_10001510C((uint64_t)v10, (uint64_t)a1, (uint64_t)&a9);
  sub_100004A4C(&v15, a1);
  uint64_t v11 = std::string::append(&v15, "\n");
  __int128 v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  int64_t cap = v11->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v12;
  v11->__r_.__value_.__l.__size_ = 0LL;
  v11->__r_.__value_.__l.__cap_ = 0LL;
  v11->__r_.__value_.__r.__words[0] = 0LL;
  unint64_t v13 = (std::mutex *)sub_10001516C();
  if (cap >= 0) {
    uint64_t v14 = __p;
  }
  else {
    uint64_t v14 = (void **)__p[0];
  }
  sub_1000151F0(v13, (const char *)v14, v18);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100015038( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_100015068()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_100020440);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_100020440))
  {
    qword_100020400 = 850045863LL;
    xmmword_100020408 = 0u;
    unk_100020418 = 0u;
    xmmword_100020428 = 0u;
    qword_100020438 = 0LL;
    qword_1000203F8 = (uint64_t)os_log_create("com.apple.librose", "client");
    __cxa_atexit((void (*)(void *))sub_100015654, &qword_1000203F8, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_100020440);
  }

  return &qword_1000203F8;
}

void sub_10001510C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  size_t v7 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  os_log_with_args(*(void *)a1, 2LL, a2, a3, v3);
  std::mutex::unlock(v7);
}

uint64_t *sub_10001516C()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_100020488);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_100020488))
  {
    qword_100020448 = 850045863LL;
    *(_OWORD *)algn_100020450 = 0u;
    *(_OWORD *)&algn_100020450[16] = 0u;
    *(_OWORD *)&algn_100020450[32] = 0u;
    qword_100020480 = 0LL;
    __cxa_atexit((void (*)(void *))std::mutex::~mutex, &qword_100020448, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_100020488);
  }

  return &qword_100020448;
}

void sub_1000151F0(std::mutex *a1, const char *a2, va_list a3)
{
}

void sub_100015240( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  va_list v18 = (va_list)&a9;
  uint64_t v10 = sub_100015068();
  sub_100015320((uint64_t)v10, (uint64_t)a1, (uint64_t)&a9);
  sub_100004A4C(&v15, a1);
  uint64_t v11 = std::string::append(&v15, "\n");
  __int128 v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  int64_t cap = v11->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v12;
  v11->__r_.__value_.__l.__size_ = 0LL;
  v11->__r_.__value_.__l.__cap_ = 0LL;
  v11->__r_.__value_.__r.__words[0] = 0LL;
  unint64_t v13 = (std::mutex *)sub_10001516C();
  if (cap >= 0) {
    uint64_t v14 = __p;
  }
  else {
    uint64_t v14 = (void **)__p[0];
  }
  sub_1000151F0(v13, (const char *)v14, v18);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1000152F0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100015320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  size_t v7 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  os_log_with_args(*(void *)a1, 0LL, a2, a3, v3);
  std::mutex::unlock(v7);
}

void sub_100015380( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  va_list v18 = (va_list)&a9;
  uint64_t v10 = sub_100015068();
  sub_100015460((uint64_t)v10, (uint64_t)a1, (uint64_t)&a9);
  sub_100004A4C(&v15, a1);
  uint64_t v11 = std::string::append(&v15, "\n");
  __int128 v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  int64_t cap = v11->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v12;
  v11->__r_.__value_.__l.__size_ = 0LL;
  v11->__r_.__value_.__l.__cap_ = 0LL;
  v11->__r_.__value_.__r.__words[0] = 0LL;
  unint64_t v13 = (std::mutex *)sub_10001516C();
  if (cap >= 0) {
    uint64_t v14 = __p;
  }
  else {
    uint64_t v14 = (void **)__p[0];
  }
  sub_1000154C0(v13, (const char *)v14, v18);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100015430( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100015460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  size_t v7 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  os_log_with_args(*(void *)a1, 16LL, a2, a3, v3);
  std::mutex::unlock(v7);
}

void sub_1000154C0(std::mutex *a1, const char *a2, va_list a3)
{
}

void sub_100015514( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  va_list v18 = (va_list)&a9;
  uint64_t v10 = sub_100015068();
  sub_1000155F4((uint64_t)v10, (uint64_t)a1, (uint64_t)&a9);
  sub_100004A4C(&v15, a1);
  uint64_t v11 = std::string::append(&v15, "\n");
  __int128 v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  int64_t cap = v11->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v12;
  v11->__r_.__value_.__l.__size_ = 0LL;
  v11->__r_.__value_.__l.__cap_ = 0LL;
  v11->__r_.__value_.__r.__words[0] = 0LL;
  unint64_t v13 = (std::mutex *)sub_10001516C();
  if (cap >= 0) {
    uint64_t v14 = __p;
  }
  else {
    uint64_t v14 = (void **)__p[0];
  }
  sub_1000154C0(v13, (const char *)v14, v18);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1000155C4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000155F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  size_t v7 = (std::mutex *)(a1 + 8);
  std::mutex::lock((std::mutex *)(a1 + 8));
  os_log_with_args(*(void *)a1, 17LL, a2, a3, v3);
  std::mutex::unlock(v7);
}

uint64_t sub_100015658(uint64_t a1)
{
  return a1;
}

uint64_t sub_100015690()
{
  if (qword_100020570 != -1) {
    dispatch_once(&qword_100020570, &stru_10001CF10);
  }
  return dword_100020490;
}

void sub_1000156D0(id a1)
{
  int v1 = (const __CFNumber *)MGCopyAnswer(@"nhGhVMyvrWYe9U2ltAUImg", 0LL);
  if (!v1)
  {
    sub_100015380("Failed to get ChipID", v2, v3, v4, v5, v6, v7, v8, v22);
    return;
  }

  int v9 = v1;
  CFTypeID v10 = CFGetTypeID(v1);
  if (v10 != CFNumberGetTypeID())
  {
    uint64_t v19 = "ChipID has unexpected type";
LABEL_13:
    sub_100015380(v19, v11, v12, v13, v14, v15, v16, v17, v20);
    goto LABEL_14;
  }

  unsigned int valuePtr = 0;
  if (!CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr))
  {
    uint64_t v19 = "Failed to extract ChipID as a number";
    goto LABEL_13;
  }

  if (valuePtr == 8228)
  {
    dword_100020490 = 1;
    va_list v18 = "Chip type 2";
    goto LABEL_11;
  }

  if (valuePtr != 8198)
  {
    uint64_t v20 = valuePtr;
    uint64_t v19 = "Unrecognized ChipID 0x%x";
    goto LABEL_13;
  }

  dword_100020490 = 0;
  va_list v18 = "Chip type 1";
LABEL_11:
  sub_100015240(v18, v11, v12, v13, v14, v15, v16, v17, v20);
LABEL_14:
  CFRelease(v9);
}

void sub_1000157C8()
{
  os_log_t v0 = os_log_create("com.apple.nearbyd", "general");
  int v1 = (void *)qword_1000205A0;
  qword_1000205A0 = (uint64_t)v0;
}

uint64_t sub_1000157F8(uint64_t a1)
{
  *(_BYTE *)a1 = 0;
  *(_BYTE *)(a1 + 112) = 0;
  *(_BYTE *)(a1 + 120) = 0;
  *(_BYTE *)(a1 + 213) = 0;
  *(_BYTE *)(a1 + 216) = 0;
  *(_BYTE *)(a1 + 56std::ostream::~ostream(v2, v3 + 8) = 0;
  *(_DWORD *)(a1 + 576) = 999;
  *(void *)(a1 + 584) = 850045863LL;
  *(_OWORD *)(a1 + 592) = 0u;
  *(_OWORD *)(a1 + 60std::ostream::~ostream(v2, v3 + 8) = 0u;
  *(_OWORD *)(a1 + 624) = 0u;
  *(void *)(a1 + 640) = 0LL;
  *(void *)(a1 + 64std::ostream::~ostream(v2, v3 + 8) = 850045863LL;
  *(_OWORD *)(a1 + 656) = 0u;
  *(_OWORD *)(a1 + 672) = 0u;
  *(_OWORD *)(a1 + 68std::ostream::~ostream(v2, v3 + 8) = 0u;
  *(void *)(a1 + 704) = 0LL;
  *(void *)(a1 + 736) = 0LL;
  sub_10001590C(a1);
  unsigned int v2 = sub_100015690();
  *(_DWORD *)(a1 + 744) = v2;
  if (v2 <= 2) {
    *(_DWORD *)(a1 + 74std::ostream::~ostream(v2, v3 + 8) = dword_100018950[v2];
  }
  return a1;
}

void sub_1000158AC(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;
  uint64_t v8 = *(void **)(v1 + 736);
  if (v8 == v6)
  {
    int v9 = v6;
    uint64_t v10 = 4LL;
  }

  else
  {
    if (!v8) {
      goto LABEL_6;
    }
    uint64_t v10 = 5LL;
    int v9 = *(void **)(v1 + 736);
  }

  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_6:
  std::mutex::~mutex(v4);
  std::mutex::~mutex(v3);
  sub_10000468C(v2);
  sub_1000047C8(v1);
  _Unwind_Resume(a1);
}

void sub_10001590C(uint64_t a1)
{
  uint64_t v2 = MGGetProductType();
  if (v2 > 2625074842LL)
  {
    if (v2 > 3571532205LL)
    {
      if (v2 > 3825599859LL)
      {
        if (v2 > 3885279869LL)
        {
          switch(v2)
          {
            case 3885279870LL:
              uint64_t v10 = 3LL;
              goto LABEL_113;
            case 4068102502LL:
              uint64_t v10 = 120LL;
              goto LABEL_113;
            case 4201643249LL:
              uint64_t v10 = 6LL;
              goto LABEL_113;
          }
        }

        else
        {
          switch(v2)
          {
            case 3825599860LL:
              uint64_t v10 = 16LL;
              goto LABEL_113;
            case 3839750255LL:
              uint64_t v10 = 117LL;
              goto LABEL_113;
            case 3867318491LL:
              uint64_t v10 = 113LL;
              goto LABEL_113;
          }
        }
      }

      else if (v2 > 3742999857LL)
      {
        switch(v2)
        {
          case 3742999858LL:
            uint64_t v10 = 110LL;
            goto LABEL_113;
          case 3767261006LL:
            uint64_t v10 = 104LL;
            goto LABEL_113;
          case 3819635030LL:
            uint64_t v10 = 112LL;
            goto LABEL_113;
        }
      }

      else
      {
        switch(v2)
        {
          case 3571532206LL:
            uint64_t v10 = 102LL;
            goto LABEL_113;
          case 3585085679LL:
            uint64_t v10 = 8LL;
            goto LABEL_113;
          case 3663011141LL:
            uint64_t v10 = 109LL;
            goto LABEL_113;
        }
      }
    }

    else if (v2 > 2941181570LL)
    {
      if (v2 > 3001488777LL)
      {
        switch(v2)
        {
          case 3001488778LL:
            uint64_t v10 = 5LL;
            goto LABEL_113;
          case 3143587592LL:
            uint64_t v10 = 118LL;
            goto LABEL_113;
          case 3348380076LL:
            uint64_t v10 = 200LL;
            goto LABEL_113;
        }
      }

      else
      {
        switch(v2)
        {
          case 2941181571LL:
            uint64_t v10 = 18LL;
            goto LABEL_113;
          case 2943112657LL:
            uint64_t v10 = 100LL;
            goto LABEL_113;
          case 2979575960LL:
            uint64_t v10 = 106LL;
            goto LABEL_113;
        }
      }
    }

    else if (v2 > 2793418700LL)
    {
      switch(v2)
      {
        case 2793418701LL:
          uint64_t v10 = 15LL;
          goto LABEL_113;
        case 2795618603LL:
          uint64_t v10 = 21LL;
          goto LABEL_113;
        case 2940697645LL:
          uint64_t v10 = 13LL;
          goto LABEL_113;
      }
    }

    else
    {
      switch(v2)
      {
        case 2625074843LL:
          uint64_t v10 = 114LL;
          goto LABEL_113;
        case 2688879999LL:
          uint64_t v10 = 14LL;
          goto LABEL_113;
        case 2722529672LL:
          uint64_t v10 = 2LL;
          goto LABEL_113;
      }
    }

LABEL_112:
    uint64_t v10 = 997LL;
    goto LABEL_113;
  }

  if (v2 > 1408738133)
  {
    if (v2 > 2021146988)
    {
      if (v2 > 2085054104)
      {
        switch(v2)
        {
          case 2085054105LL:
            uint64_t v10 = 111LL;
            goto LABEL_113;
          case 2132302344LL:
            uint64_t v10 = 101LL;
            goto LABEL_113;
          case 2309863438LL:
            uint64_t v10 = 10LL;
            goto LABEL_113;
        }
      }

      else
      {
        switch(v2)
        {
          case 2021146989LL:
            uint64_t v10 = 12LL;
            goto LABEL_113;
          case 2080700391LL:
            uint64_t v10 = 0LL;
            goto LABEL_113;
          case 2084894489LL:
            uint64_t v10 = 115LL;
            goto LABEL_113;
        }
      }
    }

    else if (v2 > 1554479184)
    {
      switch(v2)
      {
        case 1554479185LL:
          uint64_t v10 = 121LL;
          goto LABEL_113;
        case 1602181456LL:
          uint64_t v10 = 107LL;
          goto LABEL_113;
        case 1770142589LL:
          uint64_t v10 = 116LL;
          goto LABEL_113;
      }
    }

    else
    {
      switch(v2)
      {
        case 1408738134LL:
          uint64_t v10 = 103LL;
          goto LABEL_113;
        case 1434404433LL:
          uint64_t v10 = 11LL;
          goto LABEL_113;
        case 1540760353LL:
          uint64_t v10 = 201LL;
          goto LABEL_113;
      }
    }

    goto LABEL_112;
  }

  if (v2 > 749116820)
  {
    if (v2 > 1169082143)
    {
      switch(v2)
      {
        case 1169082144LL:
          uint64_t v10 = 4LL;
          goto LABEL_113;
        case 1280909812LL:
          uint64_t v10 = 105LL;
          goto LABEL_113;
        case 1371389549LL:
          uint64_t v10 = 1LL;
          goto LABEL_113;
      }
    }

    else
    {
      switch(v2)
      {
        case 749116821LL:
          uint64_t v10 = 119LL;
          goto LABEL_113;
        case 851437781LL:
          uint64_t v10 = 19LL;
          goto LABEL_113;
        case 1060988941LL:
          uint64_t v10 = 7LL;
          goto LABEL_113;
      }
    }

    goto LABEL_112;
  }

  if (v2 > 425046864)
  {
    switch(v2)
    {
      case 425046865LL:
        uint64_t v10 = 108LL;
        goto LABEL_113;
      case 574536383LL:
        uint64_t v10 = 20LL;
        goto LABEL_113;
      case 689804742LL:
        uint64_t v10 = 9LL;
        goto LABEL_113;
    }

    goto LABEL_112;
  }

  if (v2 == -1)
  {
    uint64_t v10 = 999LL;
    goto LABEL_113;
  }

  if (v2 == 133314240)
  {
    uint64_t v10 = 17LL;
    goto LABEL_113;
  }

  if (v2 != 330877086) {
    goto LABEL_112;
  }
  uint64_t v10 = 22LL;
LABEL_113:
  *(_DWORD *)(a1 + 576) = v10;
  sub_100015240("RoseParameterCache: device type %d", v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100015EB4(uint64_t a1)
{
  uint64_t result = sub_100015690();
  *(_DWORD *)(a1 + 744) = result;
  return result;
}

void sub_100015EF4(uint64_t a1, __int128 *a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 648);
  std::mutex::lock((std::mutex *)(a1 + 648));
  sub_100016AEC(a1);
  sub_100016B2C((void *)a1, a2);
  *(_BYTE *)(a1 + 112) = 1;
  sub_100015240("RoseParameterCache::cacheHelloResponse", v5, v6, v7, v8, v9, v10, v11, v19);
  sub_100015F70((_BYTE *)a1, v12, v13, v14, v15, v16, v17, v18);
  std::mutex::unlock(v4);
}

void sub_100015F5C(_Unwind_Exception *a1)
{
}

void sub_100015F70( _BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[112]) {
    uint64_t v9 = "cached";
  }
  else {
    uint64_t v9 = "not cached";
  }
  sub_100015240("RoseParameterCache: HelloResponse %s", a2, a3, a4, a5, a6, a7, a8, (uint64_t)v9);
  if (a1[213]) {
    uint64_t v17 = "cached";
  }
  else {
    uint64_t v17 = "not cached";
  }
  sub_100015240("RoseParameterCache: AlishaCapabilities %s", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v17);
  if (a1[568]) {
    size_t v25 = "cached";
  }
  else {
    size_t v25 = "not cached";
  }
  sub_100015240("RoseParameterCache: RoseCalFileParser %s", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v25);
  if (a1[568])
  {
    int v26 = sub_100004A4C(__p, "AOAtoPDOAMapping_CV_Ch5");
    sub_10001662C((uint64_t)v26, (uint64_t)(a1 + 280), (uint64_t)__p, v27, v28, v29, v30, v31);
    if (v51 < 0) {
      operator delete(__p[0]);
    }
    if (!a1[568]) {
      goto LABEL_23;
    }
    uint64_t v32 = sub_100004A4C(__p, "AOAtoPDOAMapping_CH_Ch5");
    sub_10001662C((uint64_t)v32, (uint64_t)(a1 + 344), (uint64_t)__p, v33, v34, v35, v36, v37);
    if (v51 < 0) {
      operator delete(__p[0]);
    }
    if (!a1[568]) {
      goto LABEL_23;
    }
    unsigned int v38 = sub_100004A4C(__p, "AOAtoPDOAMapping_CV_Ch9");
    sub_10001662C((uint64_t)v38, (uint64_t)(a1 + 408), (uint64_t)__p, v39, v40, v41, v42, v43);
    if (v51 < 0) {
      operator delete(__p[0]);
    }
    if (!a1[568]) {
LABEL_23:
    }
      sub_100010E98();
    uint64_t v44 = sub_100004A4C(__p, "AOAtoPDOAMapping_CH_Ch9");
    sub_10001662C((uint64_t)v44, (uint64_t)(a1 + 472), (uint64_t)__p, v45, v46, v47, v48, v49);
    if (v51 < 0) {
      operator delete(__p[0]);
    }
  }

void sub_1000160E4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001610C( uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a1 + 213)) {
    *(_BYTE *)(a1 + 213) = 0;
  }
  __int128 v9 = *a2;
  *(_OWORD *)(a1 + 136) = a2[1];
  *(_OWORD *)(a1 + 120) = v9;
  __int128 v10 = a2[2];
  __int128 v11 = a2[3];
  __int128 v12 = a2[4];
  *(_OWORD *)(a1 + 197) = *(__int128 *)((char *)a2 + 77);
  *(_OWORD *)(a1 + 184) = v12;
  *(_OWORD *)(a1 + 16std::ostream::~ostream(v2, v3 + 8) = v11;
  *(_OWORD *)(a1 + 152) = v10;
  *(_BYTE *)(a1 + 213) = 1;
  sub_100015240("RoseParameterCache::cacheAlishaCapabilities", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v20);
  sub_100015F70((_BYTE *)a1, v13, v14, v15, v16, v17, v18, v19);
}

void sub_100016174( uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(_BYTE *)(a1 + 568))
  {
    sub_100015240( "RoseParameterCache::cacheRoseCalFileParser: returning because roseCalFileParser is already cached",  (uint64_t)a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9);
    return;
  }

  sub_10001626C(a1 + 216, a2);
  sub_100015240("RoseParameterCache::cacheRoseCalFileParser", v10, v11, v12, v13, v14, v15, v16, v33);
  sub_100015F70((_BYTE *)a1, v17, v18, v19, v20, v21, v22, v23);
  std::mutex::lock((std::mutex *)(a1 + 584));
  if (*(void *)(a1 + 736))
  {
    sub_100015240( "RoseParameterCache::cacheRoseCalFileParser: start executing CalFileParsingDone callback function",  v24,  v25,  v26,  v27,  v28,  v29,  v30,  v34);
    if (*(_BYTE *)(a1 + 568) && sub_100010A80((unsigned __int8 *)(a1 + 272)))
    {
      char v35 = 1;
      uint64_t v31 = *(void *)(a1 + 736);
      if (v31)
      {
        (*(void (**)(uint64_t, char *))(*(void *)v31 + 48LL))(v31, &v35);
        goto LABEL_10;
      }
    }

    else
    {
      char v36 = 0;
      uint64_t v32 = *(void *)(a1 + 736);
      if (v32)
      {
        (*(void (**)(uint64_t, char *))(*(void *)v32 + 48LL))(v32, &v36);
        goto LABEL_10;
      }
    }

    sub_100016DEC();
  }

LABEL_10:
  std::mutex::unlock((std::mutex *)(a1 + 584));
}

void sub_100016258(_Unwind_Exception *a1)
{
}

uint64_t sub_10001626C(uint64_t a1, __int128 *a2)
{
  __int128 v4 = *a2;
  __int128 v5 = a2[1];
  __int128 v6 = a2[2];
  *(_BYTE *)(a1 + 4std::ostream::~ostream(v2, v3 + 8) = *((_BYTE *)a2 + 48);
  *(_OWORD *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = v6;
  *(_OWORD *)a1 = v4;
  sub_100016CC0(a1 + 56, (uint64_t)a2 + 56);
  *(_WORD *)(a1 + 320) = *((_WORD *)a2 + 160);
  *(void *)(a1 + 336) = 0LL;
  *(void *)(a1 + 344) = 0LL;
  *(void *)(a1 + 32std::ostream::~ostream(v2, v3 + 8) = 0LL;
  uint64_t v7 = *((void *)a2 + 42);
  *(void *)(a1 + 32std::ostream::~ostream(v2, v3 + 8) = *((void *)a2 + 41);
  *(void *)(a1 + 336) = v7;
  *(void *)(a1 + 344) = *((void *)a2 + 43);
  *((void *)a2 + 41) = 0LL;
  *((void *)a2 + 42) = 0LL;
  *((void *)a2 + 43) = 0LL;
  *(_BYTE *)(a1 + 352) = 1;
  return a1;
}

void sub_1000162E8(uint64_t a1@<X8>)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&qword_100020590);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_100020590))
  {
    xmmword_100020578 = 0uLL;
    unk_100020588 = 0LL;
    __cxa_atexit((void (*)(void *))&std::string::~string, &xmmword_100020578, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_100020590);
  }

  if (qword_100020598 != -1) {
    dispatch_once(&qword_100020598, &stru_10001CF50);
  }
  if (byte_10002058F < 0)
  {
    sub_100004958((_BYTE *)a1, (void *)xmmword_100020578, *((unint64_t *)&xmmword_100020578 + 1));
  }

  else
  {
    *(_OWORD *)a1 = xmmword_100020578;
    *(void *)(a1 + 16) = unk_100020588;
  }

void sub_1000163C0(id a1)
{
  uint64_t v25 = 1LL;
  uint64_t v8 = (char *)container_system_group_path_for_identifier(0LL, "systemgroup.com.apple.nearbyd.datastore", &v25);
  if (!v8) {
    sub_100017860(&v25, v1, v2, v3, v4, v5, v6, v7);
  }
  sub_100004A4C(&v24, v8);
  sub_100004A4C(__p, "/Library/");
  if ((v23 & 0x80u) == 0) {
    __int128 v9 = __p;
  }
  else {
    __int128 v9 = (void **)__p[0];
  }
  if ((v23 & 0x80u) == 0) {
    std::string::size_type v10 = v23;
  }
  else {
    std::string::size_type v10 = (std::string::size_type)__p[1];
  }
  uint64_t v11 = std::string::append(&v24, (const std::string::value_type *)v9, v10);
  std::string::size_type v19 = v11->__r_.__value_.__r.__words[0];
  v26[0] = v11->__r_.__value_.__l.__size_;
  *(void *)((char *)v26 + 7) = *(std::string::size_type *)((char *)&v11->__r_.__value_.__r.__words[1] + 7);
  char size = v11->__r_.__value_.__s.__size_;
  v11->__r_.__value_.__l.__size_ = 0LL;
  v11->__r_.__value_.__l.__cap_ = 0LL;
  v11->__r_.__value_.__r.__words[0] = 0LL;
  if (byte_10002058F < 0) {
    operator delete((void *)xmmword_100020578);
  }
  *(void *)&xmmword_100020578 = v19;
  *((void *)&xmmword_100020578 + 1) = v26[0];
  *(void *)((char *)&xmmword_100020578 + 15) = *(void *)((char *)v26 + 7);
  byte_10002058F = size;
  if (byte_10002058F >= 0) {
    uint64_t v21 = &xmmword_100020578;
  }
  else {
    uint64_t v21 = (__int128 *)xmmword_100020578;
  }
  sub_100015240("system group container path: %s", v12, v13, v14, v15, v16, v17, v18, (uint64_t)v21);
  free(v8);
}

void sub_10001651C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20, char a21, char a22)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  _Unwind_Resume(exception_object);
}

void sub_100016558(char *a1@<X1>, std::string *a2@<X8>)
{
  if ((v8 & 0x80u) == 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  if ((v8 & 0x80u) == 0) {
    std::string::size_type v5 = v8;
  }
  else {
    std::string::size_type v5 = (std::string::size_type)__p[1];
  }
  uint64_t v6 = std::string::append(&v9, (const std::string::value_type *)v4, v5);
  *a2 = *v6;
  v6->__r_.__value_.__l.__size_ = 0LL;
  v6->__r_.__value_.__l.__cap_ = 0LL;
  v6->__r_.__value_.__r.__words[0] = 0LL;
}

void sub_1000165F8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001662C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  else {
    uint64_t v8 = *(void *)a3;
  }
  if (*(_BYTE *)(a2 + 56)) {
    sub_100015240("RoseParameterCache: mapping %s cached (%zu x %zu)", a2, a3, a4, a5, a6, a7, a8, v8);
  }
  else {
    sub_100015240("RoseParameterCache: mapping %s not cached", a2, a3, a4, a5, a6, a7, a8, v8);
  }
}

void sub_100016684(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 584);
  std::mutex::lock((std::mutex *)(a1 + 584));
  sub_100015240( "RoseParameterCache: CalFileParsingDone callback function is registered",  v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12);
  sub_1000166E8((void *)(a1 + 712), a2);
  std::mutex::unlock(v4);
}

void sub_1000166D4(_Unwind_Exception *a1)
{
}

void *sub_1000166E8(void *a1, uint64_t a2)
{
  uint64_t v3 = v7;
  if (v7 == v6)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v6;
    goto LABEL_5;
  }

  if (v7)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }

  return a1;
}

void sub_100016780( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1000167A0(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 352))
  {
    uint64_t v6 = (void **)(a1 + 328);
    sub_10000473C(&v6);
    if (*(_BYTE *)(a1 + 312))
    {
      uint64_t v2 = *(void **)(a1 + 288);
      if (v2)
      {
        *(void *)(a1 + 296) = v2;
        operator delete(v2);
      }
    }

    if (*(_BYTE *)(a1 + 248))
    {
      uint64_t v3 = *(void **)(a1 + 224);
      if (v3)
      {
        *(void *)(a1 + 232) = v3;
        operator delete(v3);
      }
    }

    if (*(_BYTE *)(a1 + 184))
    {
      uint64_t v4 = *(void **)(a1 + 160);
      if (v4)
      {
        *(void *)(a1 + 16std::ostream::~ostream(v2, v3 + 8) = v4;
        operator delete(v4);
      }
    }

    if (*(_BYTE *)(a1 + 120))
    {
      uint64_t v5 = *(void **)(a1 + 96);
      if (v5)
      {
        *(void *)(a1 + 104) = v5;
        operator delete(v5);
      }
    }

    *(_BYTE *)(a1 + 352) = 0;
  }

uint64_t sub_100016840(uint64_t a1)
{
  uint64_t v2 = (std::mutex *)(a1 + 648);
  std::mutex::lock((std::mutex *)(a1 + 648));
  if (*(_BYTE *)(a1 + 112))
  {
    __int16 v3 = *(_WORD *)(a1 + 26);
    int v4 = v3 & 0xFF00;
    int v5 = v3;
    int v6 = 0x10000;
  }

  else
  {
    int v6 = 0;
    int v5 = 0;
    int v4 = 0;
  }

  std::mutex::unlock(v2);
  return v5 | v6 | v4;
}

BOOL sub_1000168A8(uint64_t a1)
{
  return sub_10000F5C8(*(_DWORD *)(a1 + 576));
}

uint64_t sub_1000168B0(uint64_t a1)
{
  return sub_10000F5D8(*(_DWORD *)(a1 + 576));
}

uint64_t sub_1000168B8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 744);
  if (v1 == 1) {
    return 0LL;
  }
  if (v1 == 2)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Chip type error");
  }

  return 1LL;
}

void sub_100016920(_Unwind_Exception *a1)
{
}

BOOL sub_100016934(uint64_t a1)
{
  return sub_10000F6D0(*(_DWORD *)(a1 + 576));
}

uint64_t sub_10001693C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 744);
  if (v1 == 1) {
    return 0LL;
  }
  if (v1 == 2)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Chip type error");
  }

  return 1LL;
}

void sub_1000169A4(_Unwind_Exception *a1)
{
}

uint64_t sub_1000169B8(uint64_t a1)
{
  return sub_10000F678(*(_DWORD *)(a1 + 576));
}

BOOL sub_1000169C0(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 744) & 0xFFFFFFFD) != 0;
}

uint64_t sub_1000169D0(uint64_t a1)
{
  uint64_t result = sub_10000F678(*(_DWORD *)(a1 + 576));
  if ((_DWORD)result)
  {
    uint64_t v3 = sub_100016840(a1);
    return (v3 & 0xFF0000) != 0 && (unsigned __int16)v3 == 6;
  }

  return result;
}

BOOL sub_100016A14(uint64_t a1)
{
  return *(_DWORD *)(a1 + 744) == 1;
}

BOOL sub_100016A24(uint64_t a1)
{
  return sub_10000F818(*(_DWORD *)(a1 + 576));
}

BOOL sub_100016A2C(uint64_t a1)
{
  BOOL result = sub_10000F6F8(*(_DWORD *)(a1 + 576));
  if (result)
  {
    uint64_t v3 = sub_100016840(a1);
    return (v3 & 0xFF0000) != 0 && (unsigned __int16)v3 == 6;
  }

  return result;
}

uint64_t sub_100016A70(uint64_t a1)
{
  return sub_10000F840(*(_DWORD *)(a1 + 576));
}

BOOL sub_100016A78(uint64_t a1)
{
  return *(_DWORD *)(a1 + 744) == 1 && sub_10000F6F8(*(_DWORD *)(a1 + 576));
}

BOOL sub_100016A94(uint64_t a1)
{
  uint64_t v1 = sub_100016840(a1);
  return (v1 & 0xFF0000) != 0 && (unsigned __int16)v1 == 6;
}

uint64_t sub_100016AB8(uint64_t a1)
{
  uint64_t v1 = sub_100016840(a1);
  else {
    unsigned int v2 = 310;
  }
  if ((v1 & 0xFF0000) != 0) {
    return v2;
  }
  else {
    return 0LL;
  }
}

void sub_100016AEC(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 112))
  {
    sub_100004808(a1 + 32);
    *(_BYTE *)(a1 + 112) = 0;
  }

void *sub_100016B2C(void *__dst, __int128 *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_100004958(__dst, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v4 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)__int128 __dst = v4;
  }

  *((_DWORD *)__dst + 6) = *((_DWORD *)a2 + 6);
  sub_100016BB0((_BYTE *)__dst + 32, (uint64_t)(a2 + 2));
  __dst[13] = *((void *)a2 + 13);
  return __dst;
}

void sub_100016B94(_Unwind_Exception *exception_object)
{
}

_BYTE *sub_100016BB0(_BYTE *a1, uint64_t a2)
{
  *a1 = 0;
  a1[64] = 0;
  if (*(_BYTE *)(a2 + 64))
  {
    sub_100016C04((uint64_t)a1, (int *)a2);
    a1[64] = 1;
  }

  return a1;
}

void sub_100016BF0(_Unwind_Exception *a1)
{
}

uint64_t sub_100016C04(uint64_t a1, int *a2)
{
  int v4 = *a2;
  *(_WORD *)(a1 + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)a1 = v4;
  if (*((char *)a2 + 31) < 0)
  {
    sub_100004958((_BYTE *)(a1 + 8), *((void **)a2 + 1), *((void *)a2 + 2));
  }

  else
  {
    __int128 v5 = *(_OWORD *)(a2 + 2);
    *(void *)(a1 + 24) = *((void *)a2 + 3);
    *(_OWORD *)(a1 + std::ostream::~ostream(v2, v3 + 8) = v5;
  }

  *(void *)(a1 + 32) = *((void *)a2 + 4);
  int v6 = (_BYTE *)(a1 + 40);
  if (*((char *)a2 + 63) < 0)
  {
    sub_100004958(v6, *((void **)a2 + 5), *((void *)a2 + 6));
  }

  else
  {
    __int128 v7 = *(_OWORD *)(a2 + 10);
    *(void *)(a1 + 56) = *((void *)a2 + 7);
    *(_OWORD *)int v6 = v7;
  }

  return a1;
}

void sub_100016CA4(_Unwind_Exception *exception_object)
{
}

__n128 sub_100016CC0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + std::ostream::~ostream(v2, v3 + 8) = 0;
  *(_BYTE *)(a1 + 64) = 0;
  if (*(_BYTE *)(a2 + 64))
  {
    __int128 v2 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + std::ostream::~ostream(v2, v3 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a1 + 24) = v2;
    *(void *)(a1 + 4std::ostream::~ostream(v2, v3 + 8) = 0LL;
    *(void *)(a1 + 56) = 0LL;
    *(void *)(a1 + 40) = 0LL;
    __n128 result = *(__n128 *)(a2 + 40);
    *(__n128 *)(a1 + 40) = result;
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a2 + 40) = 0LL;
    *(void *)(a2 + 4std::ostream::~ostream(v2, v3 + 8) = 0LL;
    *(void *)(a2 + 56) = 0LL;
    *(_BYTE *)(a1 + 64) = 1;
  }

  *(_BYTE *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 12std::ostream::~ostream(v2, v3 + 8) = 0;
  if (*(_BYTE *)(a2 + 128))
  {
    __int128 v4 = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 8std::ostream::~ostream(v2, v3 + 8) = v4;
    *(void *)(a1 + 112) = 0LL;
    *(void *)(a1 + 120) = 0LL;
    *(void *)(a1 + 104) = 0LL;
    __n128 result = *(__n128 *)(a2 + 104);
    *(__n128 *)(a1 + 104) = result;
    *(void *)(a1 + 120) = *(void *)(a2 + 120);
    *(void *)(a2 + 104) = 0LL;
    *(void *)(a2 + 112) = 0LL;
    *(void *)(a2 + 120) = 0LL;
    *(_BYTE *)(a1 + 12std::ostream::~ostream(v2, v3 + 8) = 1;
  }

  *(_BYTE *)(a1 + 136) = 0;
  *(_BYTE *)(a1 + 192) = 0;
  if (*(_BYTE *)(a2 + 192))
  {
    __int128 v5 = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
    *(_OWORD *)(a1 + 152) = v5;
    *(void *)(a1 + 176) = 0LL;
    *(void *)(a1 + 184) = 0LL;
    *(void *)(a1 + 16std::ostream::~ostream(v2, v3 + 8) = 0LL;
    __n128 result = *(__n128 *)(a2 + 168);
    *(__n128 *)(a1 + 16std::ostream::~ostream(v2, v3 + 8) = result;
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    *(void *)(a2 + 16std::ostream::~ostream(v2, v3 + 8) = 0LL;
    *(void *)(a2 + 176) = 0LL;
    *(void *)(a2 + 184) = 0LL;
    *(_BYTE *)(a1 + 192) = 1;
  }

  *(_BYTE *)(a1 + 200) = 0;
  *(_BYTE *)(a1 + 256) = 0;
  if (*(_BYTE *)(a2 + 256))
  {
    __int128 v6 = *(_OWORD *)(a2 + 216);
    *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
    *(_OWORD *)(a1 + 216) = v6;
    *(void *)(a1 + 240) = 0LL;
    *(void *)(a1 + 24std::ostream::~ostream(v2, v3 + 8) = 0LL;
    *(void *)(a1 + 232) = 0LL;
    __n128 result = *(__n128 *)(a2 + 232);
    *(__n128 *)(a1 + 232) = result;
    *(void *)(a1 + 24std::ostream::~ostream(v2, v3 + 8) = *(void *)(a2 + 248);
    *(void *)(a2 + 232) = 0LL;
    *(void *)(a2 + 240) = 0LL;
    *(void *)(a2 + 24std::ostream::~ostream(v2, v3 + 8) = 0LL;
    *(_BYTE *)(a1 + 256) = 1;
  }

  return result;
}

void sub_100016DEC()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_10001CF98;
}

void sub_100016E24(std::exception *a1)
{
}

uint64_t sub_100016E38(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24LL))(*(void *)(a2 + 24), a1);
    }

    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16LL))(v3);
    }
  }

  else
  {
    *(void *)(a1 + 24) = 0LL;
  }

  return a1;
}

void *sub_100016E9C(void *result, void *a2)
{
  if (a2 != result)
  {
    uint64_t v3 = result;
    __int128 v4 = (void *)result[3];
    __int128 v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24LL))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32LL))(v3[3]);
        v3[3] = 0LL;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24LL))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32LL))(a2[3]);
        a2[3] = 0LL;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24LL))(v6, a2);
        __n128 result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32LL))(v6);
      }

      else
      {
        (*(void (**)(void *, void *))(*result + 24LL))(result, a2);
        __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32LL))(v3[3]);
        v3[3] = a2[3];
      }

      a2[3] = a2;
    }

    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24LL))(a2, result);
      __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32LL))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }

    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }

  return result;
}

void sub_100017004(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_10000472C(a1);
}

void sub_100017010()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 39, "azDeg >= fMinAzDeg");
}

void sub_100017038()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 40, "azDeg <= fMaxAzDeg");
}

void sub_100017060()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 41, "elDeg >= fMinElDeg");
}

void sub_100017088()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 42, "elDeg <= fMaxElDeg");
}

void sub_1000170B0()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 50, "azDeg >= fMinAzDeg");
}

void sub_1000170D8()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 51, "azDeg <= fMaxAzDeg");
}

void sub_100017100()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 52, "elDeg >= fMinElDeg");
}

void sub_100017128()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 53, "elDeg <= fMaxElDeg");
}

void sub_100017150()
{
  __assert_rtn("operator+=", "RoseAOAtoPDOAMapping.cpp", 248, "ch9CalAvailable() && rhs.ch9CalAvailable()");
}

void sub_100017178()
{
  __assert_rtn( "operator+=",  "RoseAOAtoPDOAMapping.cpp",  247,  "checkCalBlobIntegrity() && rhs.checkCalBlobIntegrity() && fChannelAvailabilityMask == rhs.getChannelAvailabilityMask()");
}

void sub_1000171A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000171D0()
{
  int v2 = 128;
  sub_1000128BC( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "#fu,writeHeader failed, header copyright size %zu, expected %d",  v1);
  sub_100012878();
}

void sub_100017244()
{
  int v2 = 30;
  sub_1000128BC( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "#fu,writeHeader failed, header typeStr size %zu, expected %d",  v1);
  sub_100012878();
}

void sub_1000172B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000172E8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017350( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000173B8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017420(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = 178;
  sub_1000128BC( (void *)&_mh_execute_header,  a2,  a3,  "#fu,getHeader,failed,fileToSmall,size,%lu,expected,%d",  (uint8_t *)&v3);
  sub_100012878();
}

void sub_100017498()
{
}

void sub_100017500()
{
}

void sub_100017568()
{
}

void sub_1000175D0()
{
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  sub_1000128C8((void *)&_mh_execute_header, v1, v2, "#fu,calcCrc called from %s,file,%s,cantOpen", v3, v4);
  sub_100012878();
}

void sub_10001764C()
{
}

void sub_1000176B0()
{
}

void sub_100017714()
{
}

void sub_100017778(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)int v3 = 134349312;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2050;
  *(void *)&v3[14] = a2;
  sub_1000128C8( (void *)&_mh_execute_header,  a2,  a3,  "#fu,expected file size %{public}zu, actual file size %{public}zu",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  sub_100012878();
}

void sub_1000177E8()
{
  __assert_rtn("getNBMaskOOB", "roseSharedTypes.cpp", 1012, "unii5_subbands == 0 || unii5_subbands == 4");
}

void sub_100017810()
{
  __assert_rtn("nbMaskAllowsUNII3", "roseSharedTypes.cpp", 1019, "nb_mask <= 3");
}

void sub_100017838()
{
  __assert_rtn("nbMaskAllowsUNII5", "roseSharedTypes.cpp", 1025, "nb_mask <= 3");
}

void sub_100017860( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}