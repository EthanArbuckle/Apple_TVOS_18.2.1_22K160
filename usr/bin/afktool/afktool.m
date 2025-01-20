void sub_100002B40(uint64_t a1, unint64_t a2, const char *a3, int a4)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _BYTE *v13;
  int v14;
  os_log_s *v15;
  size_t v16;
  void *v17;
  const std::locale::facet *v18;
  uint64_t v19;
  BOOL v20;
  const char *v21;
  int v22;
  uint8_t buf[4];
  char *v25;
  char __str[256];
  v5 = a1;
  v21 = a3;
  v22 = a1;
  do
  {
    v6 = 16LL;
    if (a2 < 0x10) {
      v6 = a2;
    }
    if (v6 <= 1) {
      v7 = 1LL;
    }
    else {
      v7 = v6;
    }
    if (!a2) {
      break;
    }
    v8 = a3 ? &__str[snprintf(__str, 0x100uLL, "%s ", a3)] : __str;
    v9 = v7 - 1;
    v10 = 0LL;
    v11 = &v8[snprintf(v8, 0x100uLL, "%08x: ", v5 - v22)];
    do
    {
      v11 += snprintf(v11, 0x100uLL, "%02x ", *(unsigned __int8 *)(v5 + v10));
      if (v10 == 7) {
        *(_WORD *)v11++ = 32;
      }
      ++v10;
    }

    while (v7 != v10);
    if (v7 <= 0xF)
    {
      do
      {
        *(_DWORD *)v11 = 2105376;
        if (v9 == 6)
        {
          *(_WORD *)(v11 + 3) = 32;
          v11 += 4;
        }

        else
        {
          v11 += 3;
        }

        ++v9;
      }

      while (v9 < 0xF);
    }

    v12 = 0LL;
    *(_DWORD *)v11 = 2128928;
    v13 = v11 + 3;
    do
    {
      v14 = *(unsigned __int8 *)(v5 + v12);
      *v13 = v14;
      v13[1] = 0;
      if (v12 == 7)
      {
        *(_WORD *)(v13 + 1) = 32;
        v13 += 2;
      }

      else
      {
        ++v13;
      }

      ++v12;
    }

    while (v7 != v12);
    if (a4)
    {
      v15 = (os_log_s *)_AFKUserLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = __str;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
      }
    }

    else
    {
      v16 = strlen(__str);
      v17 = sub_100002E04(&std::cout, (uint64_t)__str, v16);
      std::ios_base::getloc((const std::ios_base *)((char *)v17 + *(void *)(*v17 - 24LL)));
      v18 = std::locale::use_facet((const std::locale *)buf, &std::ctype<char>::id);
      v19 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v18->__vftable[2].~facet_0)(v18, 10LL);
      std::locale::~locale((std::locale *)buf);
      std::ostream::put(v17, v19);
      std::ostream::flush(v17);
    }

    v5 += v12;
    v20 = a2 > 0xF;
    a2 -= 16LL;
    a3 = v21;
  }

  while (v20);
}

void sub_100002DE8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::locale a17)
{
}

void *sub_100002E04(void *a1, uint64_t a2, uint64_t a3)
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
    if (!sub_100002F68(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_100002F0C( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

void sub_100002F54(_Unwind_Exception *a1)
{
}

uint64_t sub_100002F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_1000030B4(__p, v12, __c);
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

void sub_100003088( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000030A4(void *a1)
{
}

void *sub_1000030B4(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_10000315C();
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

void sub_10000315C()
{
}

void sub_100003170(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000031C0(exception, a1);
}

void sub_1000031AC(_Unwind_Exception *a1)
{
}

std::logic_error *sub_1000031C0(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_1000031E4(uint64_t **a1)
{
  uint64_t v11 = __p;
  int v2 = *((_DWORD *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v11) + 14);
  if (v10 < 0)
  {
    operator delete(__p[0]);
    if (v2) {
      goto LABEL_3;
    }
LABEL_5:
    v3 = v7;
    sub_10000687C((uint64_t *)v7, (const void ***)a1);
    uint64_t v4 = sub_100003490(v7);
    goto LABEL_6;
  }

  if (!v2) {
    goto LABEL_5;
  }
LABEL_3:
  v3 = v8;
  sub_10000687C((uint64_t *)v8, (const void ***)a1);
  uint64_t v4 = sub_1000032E0(v8);
LABEL_6:
  uint64_t v5 = v4;
  sub_100006FD4((uint64_t)v3, v3[1]);
  return v5;
}

void sub_1000032A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
}

uint64_t sub_1000032E0(uint64_t **a1)
{
  v16 = __p;
  int v2 = sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v16);
  sub_1000051CC((int *)v2 + 14, 3u);
  v3 = v2 + 4;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v4));

  if (v15 < 0) {
    operator delete(__p[0]);
  }
  id v13 = 0LL;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v5,  0LL,  0LL,  &v13));
  id v7 = v13;
  size_t v8 = v7;
  if (v7)
  {
    NSLog(@"ERROR! NSPropertyListSerialization:%@\n", v7);
LABEL_10:
    uint64_t v10 = 1LL;
    goto LABEL_11;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
  {
    uint64_t v11 = objc_opt_class(v6);
    NSLog(@"ERROR! Unexpected type:%@\n", v11);
    goto LABEL_10;
  }

  sub_100004388(v6);
  uint64_t v10 = 0LL;
LABEL_11:

  return v10;
}

void sub_10000344C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100003490(uint64_t **a1)
{
  v73 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v74 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v92 = 0LL;
  v93 = &v92;
  uint64_t v94 = 0x2020000000LL;
  uint64_t v95 = 0LL;
  sub_1000062B8(__p, "--hex");
  v88[0] = __p;
  int v2 = (int *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
  sub_1000051CC(v2 + 14, 1u);
  int v3 = *((unsigned __int8 *)v2 + 64);
  if (v91 < 0) {
    operator delete(__p[0]);
  }
  if (v3) {
    byte_100010208 = 1;
  }
  sub_1000062B8(__p, "--archive");
  v88[0] = __p;
  uint64_t v4 = (int *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
  sub_1000051CC(v4 + 14, 1u);
  int v5 = *((unsigned __int8 *)v4 + 64);
  if (v91 < 0) {
    operator delete(__p[0]);
  }
  sub_1000062B8(__p, "--format");
  v88[0] = __p;
  int v6 = *((_DWORD *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88) + 14);
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (!v6)
    {
LABEL_25:
      uint64_t v14 = 100LL;
      goto LABEL_26;
    }
  }

  else if (!v6)
  {
    goto LABEL_25;
  }

  sub_1000062B8(__p, "--format");
  v88[0] = __p;
  id v7 = sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
  sub_1000051CC((int *)v7 + 14, 3u);
  size_t v8 = (unsigned __int16 *)(v7 + 4);
  int v9 = *((char *)v7 + 87);
  if (v9 < 0)
  {
    if (*((void *)v7 + 9) != 3LL)
    {
LABEL_22:
      BOOL v13 = 0;
      goto LABEL_23;
    }

    size_t v8 = *(unsigned __int16 **)v8;
  }

  else if (v9 != 3)
  {
    goto LABEL_22;
  }

  int v10 = *v8;
  int v11 = *((unsigned __int8 *)v8 + 2);
  BOOL v13 = v10 == 28024 && v11 == 108;
LABEL_23:
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (v13) {
      goto LABEL_25;
    }
  }

  else if (v13)
  {
    goto LABEL_25;
  }

  sub_1000062B8(__p, "--format");
  v88[0] = __p;
  v19 = sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
  sub_1000051CC((int *)v19 + 14, 3u);
  v20 = (unsigned __int16 *)(v19 + 4);
  int v21 = *((char *)v19 + 87);
  if (v21 < 0)
  {
    if (*((void *)v19 + 9) != 3LL)
    {
LABEL_62:
      BOOL v33 = 0;
      goto LABEL_63;
    }

    v20 = *(unsigned __int16 **)v20;
  }

  else if (v21 != 3)
  {
    goto LABEL_62;
  }

  int v30 = *v20;
  int v31 = *((unsigned __int8 *)v20 + 2);
  BOOL v33 = v30 == 26978 && v31 == 110;
LABEL_63:
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (v33) {
      goto LABEL_65;
    }
LABEL_67:
    v34 = @"ERROR! Unknown plist format. Options are xml, bin";
    goto LABEL_163;
  }

  if (!v33) {
    goto LABEL_67;
  }
LABEL_65:
  uint64_t v14 = 200LL;
LABEL_26:
  uint64_t v75 = v14;
  sub_1000062B8(__p, "--protocol");
  v88[0] = __p;
  int v15 = *((_DWORD *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88) + 14);
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (!v15) {
      goto LABEL_86;
    }
LABEL_30:
    sub_1000062B8(__p, "--protocol");
    v88[0] = __p;
    v16 = (int *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
    sub_1000051CC(v16 + 14, 3u);
    v17 = v16 + 16;
    int v18 = *((char *)v16 + 87);
    if (v18 < 0)
    {
      if (*((void *)v16 + 9) != 6LL)
      {
LABEL_45:
        BOOL v25 = 0;
        goto LABEL_46;
      }

      v17 = *(_OWORD **)v17;
    }

    else if (v18 != 6)
    {
      goto LABEL_45;
    }

    int v22 = *(_DWORD *)v17;
    int v23 = *((unsigned __int16 *)v17 + 2);
    BOOL v25 = v22 == 1701999731 && v23 == 28001;
LABEL_46:
    if (v91 < 0)
    {
      operator delete(__p[0]);
      if (v25)
      {
LABEL_48:
        int v26 = 2;
        if (!v5) {
          goto LABEL_98;
        }
        goto LABEL_87;
      }
    }

    else if (v25)
    {
      goto LABEL_48;
    }

    sub_1000062B8(__p, "--protocol");
    v88[0] = __p;
    v27 = sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
    sub_1000051CC((int *)v27 + 14, 3u);
    v28 = v27 + 4;
    int v29 = *((char *)v27 + 87);
    if (v29 < 0)
    {
      if (*((void *)v27 + 9) != 4LL)
      {
LABEL_71:
        BOOL v35 = 0;
LABEL_72:
        if (v91 < 0)
        {
          operator delete(__p[0]);
          if (v35)
          {
LABEL_74:
            int v26 = 1;
            if (!v5) {
              goto LABEL_98;
            }
            goto LABEL_87;
          }
        }

        else if (v35)
        {
          goto LABEL_74;
        }

        sub_1000062B8(__p, "--protocol");
        v88[0] = __p;
        v36 = sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
        sub_1000051CC((int *)v36 + 14, 3u);
        v37 = v36 + 4;
        int v38 = *((char *)v36 + 87);
        if (v38 < 0)
        {
          if (*((void *)v36 + 9) != 4LL)
          {
LABEL_83:
            BOOL v39 = 0;
            goto LABEL_84;
          }

          v37 = (void *)*v37;
        }

        else if (v38 != 4)
        {
          goto LABEL_83;
        }

        BOOL v39 = *(_DWORD *)v37 == 1869903201;
LABEL_84:
        if (v91 < 0)
        {
          operator delete(__p[0]);
          if (v39) {
            goto LABEL_86;
          }
        }

        else if (v39)
        {
          goto LABEL_86;
        }

        v34 = @"ERROR! Unknown registry collection protocol.";
LABEL_163:
        id v43 = 0LL;
        NSLog(&v34->isa);
        uint64_t v53 = 1LL;
        v52 = 0LL;
        goto LABEL_164;
      }

      v28 = (void *)*v28;
    }

    else if (v29 != 4)
    {
      goto LABEL_71;
    }

    BOOL v35 = *(_DWORD *)v28 == 1886221668;
    goto LABEL_72;
  }

  if (v15) {
    goto LABEL_30;
  }
LABEL_86:
  int v26 = 0;
  if (!v5) {
    goto LABEL_98;
  }
LABEL_87:
  sub_1000062B8(__p, "--path");
  v88[0] = __p;
  int v40 = *((_DWORD *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88) + 14);
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (v40) {
      goto LABEL_89;
    }
LABEL_98:
    id v43 = 0LL;
    goto LABEL_99;
  }

  if (!v40) {
    goto LABEL_98;
  }
LABEL_89:
  sub_1000062B8(__p, "--path");
  v88[0] = __p;
  v41 = sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
  sub_1000051CC((int *)v41 + 14, 3u);
  v42 = v41 + 4;
  id v43 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v42, 1LL));
  if (v91 < 0) {
    operator delete(__p[0]);
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v45 = (void *)objc_claimAutoreleasedReturnValue([v44 contentsOfDirectoryAtPath:v43 error:0]);
  v46 = v45;
  if (!v45)
  {
    NSLog(@"contentsOfDirectoryAtPath returned nil");
    exit(1);
  }

  if (![v45 count]) {
    NSLog(@"contentsOfDirectoryAtPath no files ");
  }

LABEL_99:
  sub_1000062B8(__p, "--buffer");
  v88[0] = __p;
  if (!*((_DWORD *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88) + 14))
  {
    int v48 = 0;
    goto LABEL_108;
  }

  sub_1000062B8(v88, "--buffer");
  v96 = v88;
  v47 = (int *)sub_100006390(a1, (const void **)v88, (uint64_t)&unk_10000A114, (_OWORD **)&v96);
  sub_1000051CC(v47 + 14, 3u);
  if (*((char *)v47 + 87) < 0)
  {
    if (*((void *)v47 + 9)) {
      goto LABEL_102;
    }
  }

  else if (*((_BYTE *)v47 + 87))
  {
LABEL_102:
    int v48 = 1;
    goto LABEL_106;
  }

  int v48 = 0;
LABEL_106:
  if (v89 < 0) {
    operator delete(v88[0]);
  }
LABEL_108:
  if ((v91 & 0x80000000) == 0)
  {
    if (v48) {
      goto LABEL_110;
    }
LABEL_115:
    uint64_t v51 = 0x100000LL;
    unint64_t v50 = 0x400000LL;
    goto LABEL_116;
  }

  operator delete(__p[0]);
  if (!v48) {
    goto LABEL_115;
  }
LABEL_110:
  sub_1000062B8(__p, "--buffer");
  v88[0] = __p;
  v49 = sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
  sub_1000051CC((int *)v49 + 14, 3u);
  unint64_t v50 = std::stoul((const std::string *)(v49 + 4), 0LL, 0);
  if (v91 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v51 = v50;
  if (v50)
  {
LABEL_116:
    sub_1000062B8(__p, "--matching");
    v88[0] = __p;
    int v54 = *((_DWORD *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88) + 14);
    if (v91 < 0)
    {
      operator delete(__p[0]);
      if (v54) {
        goto LABEL_118;
      }
    }

    else if (v54)
    {
LABEL_118:
      NSLog(@"ERROR! '--matching' not allowed");
LABEL_119:
      v52 = 0LL;
      goto LABEL_136;
    }

    sub_1000062B8(__p, "--role");
    v88[0] = __p;
    int v55 = *((_DWORD *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88) + 14);
    if (v91 < 0) {
      operator delete(__p[0]);
    }
    if (!v55) {
      goto LABEL_119;
    }
    sub_1000062B8(__p, "--role");
    v88[0] = __p;
    v56 = sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
    sub_1000051CC((int *)v56 + 14, 3u);
    v57 = v56 + 4;
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v57,  1LL));
    if (v91 < 0) {
      operator delete(__p[0]);
    }
    v59 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  &__kCFBooleanTrue,  @"system-service"));
    CFMutableDictionaryRef v60 = IOServiceMatching("AFKEndpointInterface");
    -[__CFDictionary setObject:forKey:](v60, "setObject:forKey:", v59, @"IOPropertyMatch");
    sub_1000062B8(__p, "--name");
    v88[0] = __p;
    int v61 = *((_DWORD *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88) + 14);
    if (v91 < 0)
    {
      operator delete(__p[0]);
      if (!v61)
      {
LABEL_135:
        v52 = v60;

LABEL_136:
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472LL;
        v80[2] = sub_10000440C;
        v80[3] = &unk_10000C540;
        v84 = &v92;
        uint64_t v85 = v51;
        int v87 = v26;
        unint64_t v86 = v50;
        id v43 = v43;
        id v81 = v43;
        v62 = v74;
        v82 = v62;
        v63 = v73;
        v83 = v63;
        sub_100007748(v52, v80);
        if (v93[3])
        {
          if (!-[NSMutableDictionary count](v62, "count") && !-[NSMutableDictionary count](v63, "count")) {
            goto LABEL_156;
          }
          if (v5)
          {
            if (-[NSMutableDictionary count](v62, "count") || -[NSMutableDictionary count](v63, "count"))
            {
              if (-[NSMutableDictionary count](v62, "count"))
              {
                __int128 v78 = 0u;
                __int128 v79 = 0u;
                __int128 v76 = 0u;
                __int128 v77 = 0u;
                v64 = v62;
                id v65 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v64,  "countByEnumeratingWithState:objects:count:",  &v76,  v97,  16LL);
                if (v65)
                {
                  uint64_t v66 = *(void *)v77;
                  while (2)
                  {
                    for (i = 0LL; i != v65; i = (char *)i + 1)
                    {
                      if (*(void *)v77 != v66) {
                        objc_enumerationMutation(v64);
                      }
                      id v68 = *(id *)(*((void *)&v76 + 1) + 8LL * (void)i);
                      v69 = (void *)objc_claimAutoreleasedReturnValue([v43 stringByAppendingFormat:@"/%s.plist" UTF8String:[v68 UTF8String]]);
                      v70 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v64,  "objectForKeyedSubscript:",  v68));
                      int v71 = sub_1000050CC(v70, v69, v75);

                      if (v71)
                      {
                        uint64_t v53 = 1LL;
                        goto LABEL_158;
                      }
                    }

                    id v65 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v64,  "countByEnumeratingWithState:objects:count:",  &v76,  v97,  16LL);
                    if (v65) {
                      continue;
                    }
                    break;
                  }
                }

                uint64_t v53 = 0LL;
LABEL_158:
              }

              else
              {
                uint64_t v53 = sub_1000050CC(v63, @"/dev/stdout", v75);
              }

              goto LABEL_160;
            }

            goto LABEL_156;
          }

          if (!-[NSMutableDictionary count](v63, "count"))
          {
LABEL_156:
            uint64_t v53 = 1LL;
            goto LABEL_160;
          }

          sub_100004388(v63);
        }

        else
        {
          NSLog(@"WARNING! No AppleFirmwareKit IOP matched.");
        }

        uint64_t v53 = 0LL;
LABEL_160:

        goto LABEL_164;
      }
    }

    else if (!v61)
    {
      goto LABEL_135;
    }

    NSLog(@"ERROR! '--name' not allowed");
    goto LABEL_135;
  }

  NSLog(@"ERROR! Failed to parse buffer size.");
  v52 = 0LL;
  uint64_t v53 = 1LL;
LABEL_164:

  _Block_object_dispose(&v92, 8);
  return v53;
}

void sub_100004120( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, void *a26, void *a27, void *a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, void *a33, uint64_t a34, int a35, __int16 a36, char a37, char a38, void *__p, uint64_t a40, int a41, __int16 a42, char a43, char a44, char a45)
{
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_100004388(void *a1)
{
  id v2 = a1;
  v1 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"class"]);

  if (v1) {
    sub_10000571C(v2, 0, 0, 0LL);
  }
  else {
    [v2 enumerateKeysAndObjectsUsingBlock:&stru_10000C670];
  }
}

void sub_1000043F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10000440C(uint64_t a1, uint64_t entry)
{
  uint64_t entryID = 0LL;
  unint64_t v3 = *(void *)(a1 + 64);
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
  IORegistryEntryGetRegistryEntryID(entry, &entryID);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(entry, @"role", 0LL, 0);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(CFProperty, v5) & 1) != 0) {
    id v6 = CFProperty;
  }
  else {
    id v6 = 0LL;
  }
  CFTypeRef v7 = IORegistryEntryCreateCFProperty(entry, @"compartment", 0LL, 0);

  size_t v8 = (void *)v7;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", v6, v7));
  }

  else
  {
    v57 = v6;
  }

  int v10 = (void *)IORegistryEntryCreateCFProperty(entry, @"reg-stream-block-size", 0LL, 0);

  int v11 = *(_DWORD *)(a1 + 80);
  if (v11 != 2)
  {
    if (v11 || (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v10, v12) & 1) == 0))
    {
      id v56 = (id)IORegistryEntryCreateCFProperty(entry, @"reg-size-inc", 0LL, 0);

      uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v56, v20) & 1) != 0)
      {
        id v21 = v56;
        unsigned int v22 = [v21 unsignedIntValue];
        unsigned int v23 = [v21 unsignedIntValue];

        unint64_t v3 = v22;
        uint64_t v24 = v23;
      }

      else
      {
        uint64_t v24 = 0x100000LL;
      }

      uint64_t v58 = v24;
      uint64_t v25 = a1;
      while (v3 <= *(void *)(v25 + 72))
      {
        int v26 = (void *)objc_claimAutoreleasedReturnValue(+[AFKEndpointInterface withService:](&OBJC_CLASS___AFKEndpointInterface, "withService:", entry));
        dispatch_semaphore_t v27 = dispatch_semaphore_create(0LL);
        uint64_t v79 = 0LL;
        v80 = &v79;
        uint64_t v81 = 0x3032000000LL;
        v82 = sub_1000052D0;
        v83 = sub_1000052E0;
        id v84 = 0LL;
        uint64_t v62 = 0LL;
        v63 = &v62;
        uint64_t v64 = 0x2020000000LL;
        LODWORD(v65) = 0;
        dispatch_queue_t v28 = dispatch_queue_create("afkregistry", 0LL);
        [v26 setDispatchQueue:v28];
        v72 = _NSConcreteStackBlock;
        uint64_t v73 = 3221225472LL;
        uint64_t v74 = (uint64_t)sub_1000056BC;
        uint64_t v75 = (uint64_t (*)(uint64_t, uint64_t))&unk_10000C630;
        __int128 v77 = (NSMutableArray *)&v79;
        __int128 v78 = &v62;
        int v29 = v27;
        __int128 v76 = (void (*)(uint64_t))v29;
        [v26 setResponseHandler:&v72];
        [v26 activate:1];
        LODWORD(v92) = 0;
        LODWORD(v55) = 2;
        id v30 = [v26 enqueueCommand:128 timestamp:mach_continuous_time() inputBuffer:0 inputBufferSize:0 outputPayloadSize:v3 context:&v92 options:v55];
        *((_DWORD *)v63 + 6) = (_DWORD)v30;
        if ((_DWORD)v30)
        {
          NSLog(@"enqueueCommand:%x", v30);
        }

        else if (dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL))
        {
          *((_DWORD *)v63 + 6) = -536870186;
        }

        [v26 cancel];
        uint64_t v31 = *((int *)v63 + 6);
        if ((_DWORD)v31 || (v34 = (void *)v80[5]) == 0LL)
        {
          v87[0] = NSDebugDescriptionErrorKey;
          v88[0] = @"Did not receive registry dump AFK Endpoint Interface";
          v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v88,  v87,  1LL));
          id v33 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.afktool",  v31,  v32));

          v34 = (void *)v80[5];
        }

        else
        {
          id v33 = 0LL;
        }

        v85[0] = 0LL;
        BOOL v35 = (char *)[v34 bytes];
        v36 = sub_1000076BC(v35, (unint64_t)[(id)v80[5] length], kCFAllocatorDefault, 0, v85);
        if (!v36)
        {
          uint64_t v68 = 0LL;
          IORegistryEntryGetRegistryEntryID(entry, &v68);
          NSLog(@"ERROR! Unserialize registry dump for service:0x%llx error:%@", v68, v85[0]);
        }

        _Block_object_dispose(&v62, 8);
        _Block_object_dispose(&v79, 8);

        id v37 = v33;
        if (v37)
        {
          int v38 = v37;
          NSLog(@"ERROR! Registry dump for service:0x%llx error:%@ buffer:%zu", entryID, v37, v3);
          if ([v38 code] == (id)-536870211) {
            goto LABEL_51;
          }
        }

        uint64_t v25 = a1;
        v3 += v58;
        if (v36)
        {
          int v38 = 0LL;
          goto LABEL_52;
        }
      }

      int v38 = 0LL;
      v36 = 0LL;
      goto LABEL_55;
    }
  }

  id v56 = v10;
  [v56 unsignedIntValue];
  uint64_t v13 = entryID;
  uint64_t v91 = AFKEndpointInterfaceEnsureReportDeliveryKey;
  uint64_t v92 = &off_10000CE90;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v92,  &v91,  1LL));
  int v15 = (void *)objc_claimAutoreleasedReturnValue( +[AFKEndpointInterface withService:properties:]( &OBJC_CLASS___AFKEndpointInterface,  "withService:properties:",  entry,  v14));

  dispatch_semaphore_t v16 = dispatch_semaphore_create(0LL);
  v72 = 0LL;
  uint64_t v73 = (uint64_t)&v72;
  uint64_t v74 = 0x3032000000LL;
  uint64_t v75 = sub_1000052D0;
  __int128 v76 = sub_1000052E0;
  __int128 v77 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v79 = 0LL;
  v80 = &v79;
  uint64_t v81 = 0x3032000000LL;
  v82 = sub_1000052D0;
  v83 = sub_1000052E0;
  id v84 = 0LL;
  uint64_t v68 = 0LL;
  v69 = &v68;
  uint64_t v70 = 0x2020000000LL;
  int v71 = 0;
  dispatch_queue_t v17 = dispatch_queue_create("afkregistry", 0LL);
  uint64_t v62 = 0LL;
  v63 = &v62;
  uint64_t v64 = 0x3032000000LL;
  id v65 = sub_1000052D0;
  uint64_t v66 = sub_1000052E0;
  id v67 = 0LL;
  [v15 setDispatchQueue:v17];
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472LL;
  v88[2] = sub_1000052E8;
  v88[3] = &unk_10000C568;
  v90 = &v68;
  int v18 = v16;
  char v89 = v18;
  [v15 setResponseHandler:v88];
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472LL;
  v87[2] = sub_1000052FC;
  v87[3] = &unk_10000C590;
  v87[4] = &v62;
  v87[5] = &v72;
  [v15 setReportHandler:v87];
  [v15 activate:1];
  int v61 = 0;
  LODWORD(v55) = 0;
  id v19 = [v15 enqueueCommand:129 timestamp:mach_continuous_time() inputBuffer:0 inputBufferSize:0 outputPayloadSize:16 context:&v61 options:v55];
  *((_DWORD *)v69 + 6) = (_DWORD)v19;
  if ((_DWORD)v19)
  {
    NSLog(@"enqueueCommand:%x", v19);
  }

  else if (dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL))
  {
    *((_DWORD *)v69 + 6) = -536870186;
  }

  [v15 cancel];
  int v39 = *((_DWORD *)v69 + 6);
  if (!v39)
  {
    if ([*(id *)(v73 + 40) count])
    {
      for (unint64_t i = 0LL; ; ++i)
      {
        id v43 = [*(id *)(v73 + 40) count];
        v44 = *(void **)(v73 + 40);
        if (i >= (unint64_t)v43)
        {
          v85[0] = _NSConcreteStackBlock;
          v85[1] = 3221225472LL;
          v85[2] = sub_1000053E0;
          v85[3] = &unk_10000C608;
          v85[4] = &v79;
          v85[5] = &v72;
          [v44 enumerateObjectsUsingBlock:v85];
          v36 = (__CFSet *)(id)v80[5];
          goto LABEL_47;
        }

        v45 = (void *)objc_claimAutoreleasedReturnValue([v44 objectAtIndexedSubscript:i]);
        v85[0] = 0LL;
        id v46 = v45;
        v47 = sub_1000076BC( (char *)[v46 bytes],  (unint64_t)objc_msgSend(v46, "length"),  kCFAllocatorDefault,  0,  v85);
        if (!v47) {
          break;
        }
        [*(id *)(v73 + 40) setObject:v47 atIndexedSubscript:i];
      }

      id v48 = v46;
      sub_100002B40([v48 bytes], [v48 length], "AFKReg Failed", 1);
      uint64_t v49 = _AFKUserLog();
      unint64_t v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
        sub_1000092BC(v13, v50);
      }

      v36 = (__CFSet *)*(id *)(v73 + 40);
LABEL_47:
      id v41 = 0LL;
      goto LABEL_48;
    }

    int v39 = *((_DWORD *)v69 + 6);
  }

  NSErrorUserInfoKey v86 = NSDebugDescriptionErrorKey;
  v85[0] = @"Did not receive registry dump AFK Endpoint Interface";
  int v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v85,  &v86,  1LL));
  id v41 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.afktool",  v39,  v40));

  v36 = 0LL;
LABEL_48:

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v79, 8);

  _Block_object_dispose(&v72, 8);
  id v51 = v41;
  int v38 = v51;
  if (v51) {
    NSLog(@"ERROR! Registry dump for service:0x%llx error:%@", entryID, v51);
  }

LABEL_51:
  if (!v36)
  {
LABEL_55:
    v52 = v56;
    goto LABEL_58;
  }

LABEL_52:
  v52 = v56;
  if (*(void *)(a1 + 32))
  {
    if (v57) {
      [*(id *)(a1 + 40) setObject:v36 forKeyedSubscript:];
    }
    else {
      NSLog(@"ERROR! no role:0x%llx", entryID);
    }
  }

  else
  {
    uint64_t v53 = *(void **)(a1 + 48);
    int v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"0x%llx", entryID));
    [v53 setObject:v36 forKeyedSubscript:v54];
  }

LABEL_58:
}

void sub_100004F14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, id a34, uint64_t a35, char a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, id a41)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a36, 8);

  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000050CC(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  CFTypeRef v7 = -[NSOutputStream initToFileAtPath:append:]( objc_alloc(&OBJC_CLASS___NSOutputStream),  "initToFileAtPath:append:",  v6,  1LL);
  -[NSOutputStream open](v7, "open");
  id v11 = 0LL;
  +[NSPropertyListSerialization writePropertyList:toStream:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "writePropertyList:toStream:format:options:error:",  v5,  v7,  a3,  0LL,  &v11);
  id v8 = v11;
  -[NSOutputStream close](v7, "close");
  if (v8)
  {
    NSLog(@"ERROR! Unable to write registry output, serialization error: %@", v8);
    uint64_t v9 = 1LL;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  return v9;
}

void sub_1000051A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int *sub_1000051CC(int *result, unsigned int a2)
{
  if (*result != a2)
  {
    unint64_t v3 = result;
    sub_1000062B8(&v8, "Illegal cast to ");
    if (a2 > 4) {
      uint64_t v4 = "unknown";
    }
    else {
      uint64_t v4 = off_10000C6C0[a2];
    }
    std::string::append(&v8, v4);
    std::string::append(&v8, "; type is actually ");
    uint64_t v5 = *v3;
    else {
      id v6 = off_10000C6C0[v5];
    }
    std::string::append(&v8, v6);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, &v8);
  }

  return result;
}

void sub_1000052A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1000052D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000052E0(uint64_t a1)
{
}

uint64_t sub_1000052E8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000052FC(uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v16 = a2;
  if (a3 == 130)
  {
    if (a6)
    {
      int v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      if (!v10)
      {
        id v11 = -[NSMutableData initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithCapacity:", a6);
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
        uint64_t v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        int v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      }

      [v10 appendBytes:a5 length:a6];
    }

    else
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8LL);
      int v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = 0LL;
    }
  }
}

void sub_1000053CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_1000053E0(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"class"]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"children"]);
  if (v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000554C;
    v9[3] = &unk_10000C5E0;
    uint64_t v11 = *(void *)(a1 + 40);
    CFTypeRef v7 = v6;
    int v10 = v7;
    [v5 enumerateObjectsUsingBlock:v9];
    [v8 setObject:v7 forKeyedSubscript:@"children"];
  }
}

void sub_1000054FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10000554C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005608;
  v7[3] = &unk_10000C5B8;
  id v8 = v3;
  id v9 = v4;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v7];
}

void sub_1000055E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
}

void sub_100005608(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  CFTypeRef v7 = *(void **)(a1 + 32);
  id v9 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"id"]);
  LODWORD(v7) = [v7 isEqual:v8];

  if ((_DWORD)v7)
  {
    [*(id *)(a1 + 40) addObject:v9];
    *a4 = 1;
  }
}

void sub_100005694( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000056BC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a4)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a4;
  }

  else
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a6, a7));
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
    int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000571C(void *a1, int a2, int a3, unint64_t a4)
{
  id v7 = a1;
  id v33 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"children"]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v33 objectEnumerator]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 nextObject]);
  unint64_t v10 = (1 << a3) | a4;
  if (!a2) {
    unint64_t v10 = ~(1 << a3) & a4;
  }
  uint64_t v11 = (void *)v9;
  uint64_t v12 = v10 & ~(2 << a3);
  uint64_t v13 = v10 | (2 << a3);
  if (v9) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = v12;
  }
  id v15 = v7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"properties"]);
  dispatch_queue_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"name"]);

  if (a3)
  {
    int v18 = 0;
    do
    {
      if ((v14 & (1 << v18)) != 0) {
        printf("| ");
      }
      else {
        printf("  ");
      }
      ++v18;
    }

    while (a3 != v18);
  }

  printf("+-o ");
  id v19 = v17;
  printf("%s", (const char *)[v19 UTF8String]);
  printf("  <class ");
  id v32 = objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"class"]);
  printf("%s", (const char *)[v32 UTF8String]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"id"]);
  printf(", id 0x%llx", [v20 longLongValue]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"state"]);
  v34 = v20;
  unsigned __int8 v22 = [v21 longLongValue];

  unsigned int v23 = "";
  uint64_t v24 = "!";
  if ((v22 & 0x20) != 0) {
    uint64_t v25 = "";
  }
  else {
    uint64_t v25 = "!";
  }
  if ((v22 & 8) != 0) {
    uint64_t v24 = "";
  }
  if ((v22 & 1) != 0) {
    unsigned int v23 = "in";
  }
  printf(", %sregistered, %sterminated, %sactive", v25, v24, v23);
  puts(">");
  unsigned int v26 = 0;
  uint64_t v27 = (a3 + 1);
  do
  {
    if ((v14 & (1 << v26)) != 0) {
      printf("| ");
    }
    else {
      printf("  ");
    }
    ++v26;
  }

  while (v26 <= v27);
  puts("{");
  dispatch_queue_t v28 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"properties"]);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3321888768LL;
  v36[2] = sub_100005C2C;
  v36[3] = &unk_10000C690;
  id v35 = v15;
  id v37 = v35;
  int v38 = a3;
  uint64_t v39 = v14;
  [v28 enumerateKeysAndObjectsUsingBlock:v36];
  unsigned int v29 = 0;
  do
  {
    if ((v14 & (1 << v29)) != 0) {
      printf("| ");
    }
    else {
      printf("  ");
    }
    ++v29;
  }

  while (v29 <= v27);
  puts("}");
  unsigned int v30 = 0;
  do
  {
    if ((v14 & (1 << v30)) != 0) {
      printf("| ");
    }
    else {
      printf("  ");
    }
    ++v30;
  }

  while (v30 <= v27);
  putchar(10);

  while (v11)
  {
    id v31 = v11;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 nextObject]);

    sub_10000571C(v31, v11 != 0LL, v27, v14);
  }
}

void sub_100005B18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *a22)
{
  _Unwind_Resume(a1);
}

void sub_100005BBC(id a1, id a2, id a3, BOOL *a4)
{
  id v5 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
    sub_10000571C(v5, 0, 0, 0LL);
  }
}

void sub_100005C18( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100005C2C(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v14 = a2;
  id v7 = a3;
  *a4 = 0;
  if (([v14 isEqualToString:@"children"] & 1) == 0)
  {
    uint64_t v8 = (__CFString *)v14;
    uint64_t v9 = (__CFString *)v7;
    unsigned int v10 = 0;
    int v11 = *(_DWORD *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    unsigned int v13 = v11 + 1;
    do
    {
      if ((v12 & (1 << v10)) != 0) {
        printf("| ");
      }
      else {
        printf("  ");
      }
      ++v10;
    }

    while (v10 <= v13);
    printf("  ");
    sub_100005D9C(v8);
    printf(" = ");
    sub_100005D9C(v9);
    putchar(10);
  }
}

void sub_100005D38( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__n128 sub_100005D60(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = *(id *)(a2 + 32);
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void sub_100005D94(uint64_t a1)
{
}

void sub_100005D9C(const __CFString *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFArrayGetTypeID())
  {
    char context = 1;
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    putchar(40);
    v22.location = 0LL;
    v22.length = Count;
    CFArrayApplyFunction((CFArrayRef)a1, v22, (CFArrayApplierFunction)sub_1000061FC, &context);
    int v4 = 41;
LABEL_3:
    putchar(v4);
    return;
  }

  if (v2 == CFBooleanGetTypeID())
  {
    if (CFBooleanGetValue((CFBooleanRef)a1)) {
      printf("Yes");
    }
    else {
      printf("No");
    }
    return;
  }

  if (v2 == CFDataGetTypeID())
  {
    putchar(60);
    CFIndex Length = CFDataGetLength((CFDataRef)a1);
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    if (Length >= 1)
    {
      unsigned int v7 = 0;
      CFIndex v8 = 0LL;
      unsigned int v9 = 0;
LABEL_12:
      if (BytePtr[v8]) {
        BOOL v10 = v8 < Length;
      }
      else {
        BOOL v10 = 0;
      }
      if (!v10) {
        goto LABEL_36;
      }
      while (1)
      {
        uint64_t v11 = BytePtr[v8];
        if ((char)BytePtr[v8] < 0)
        {
          if (__maskrune(v11, 0x40000uLL))
          {
LABEL_19:
            ++v7;
            goto LABEL_23;
          }
        }

        else if ((_DefaultRuneLocale.__runetype[v11] & 0x40000) != 0)
        {
          goto LABEL_19;
        }

        if ((char)BytePtr[v8] > -2)
        {
          if (BytePtr[v8]) {
            goto LABEL_36;
          }
          if (++v8 >= Length) {
            goto LABEL_36;
          }
          goto LABEL_12;
        }

        ++v9;
LABEL_23:
        if (Length == ++v8)
        {
          CFIndex v8 = Length;
          goto LABEL_36;
        }
      }
    }

    unsigned int v9 = 0;
    CFIndex v8 = 0LL;
    unsigned int v7 = 0;
LABEL_36:
    BOOL v13 = v9 > v7 >> 2 || Length == 1;
    else {
      CFIndex v14 = v8;
    }
    if (v7 && v14 >= Length)
    {
      if (Length >= 1)
      {
        int v15 = 0;
        for (uint64_t i = 0LL; i != Length; ++i)
        {
          if (BytePtr[i])
          {
            if (!v15)
            {
              if (i) {
                printf(",");
              }
              else {
                putchar(34);
              }
              int v15 = 1;
            }

            int v17 = BytePtr[i];
          }

          else
          {
            if (v15 != 1) {
              goto LABEL_63;
            }
            int v15 = 0;
            int v17 = 34;
          }

          putchar(v17);
        }

        if (v15 == 1) {
          putchar(34);
        }
      }
    }

    else if (Length >= 1)
    {
      do
      {
        int v18 = *BytePtr++;
        printf("%02x", v18);
        --Length;
      }

      while (Length);
    }

LABEL_63:
    putchar(62);
  }

  else
  {
    if (v2 == CFDictionaryGetTypeID())
    {
      char v20 = 1;
      putchar(123);
      CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)sub_100006234, &v20);
      int v4 = 125;
      goto LABEL_3;
    }

    if (v2 == CFNumberGetTypeID())
    {
      if (CFNumberGetValue((CFNumberRef)a1, kCFNumberLongLongType, &valuePtr))
      {
        if (byte_100010208) {
          printf("0x%qx");
        }
        else {
          printf("%qu");
        }
      }
    }

    else if (v2 == CFSetGetTypeID())
    {
      sub_100006108((const __CFSet *)a1);
    }

    else if (v2 == CFStringGetTypeID())
    {
      sub_100006158(a1);
    }

    else
    {
      printf("<unknown object>");
    }
  }
}

uint64_t sub_100006108(const __CFSet *a1)
{
  char context = 1;
  putchar(91);
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_100006280, &context);
  return putchar(93);
}

void sub_100006158(const __CFString *a1)
{
  CStringPtr = CFStringGetCStringPtr(a1, 0);
  if (CStringPtr)
  {
    printf("%s", CStringPtr);
  }

  else
  {
    CFIndex v3 = CFStringGetLength(a1) + 1;
    int v4 = (char *)malloc(v3);
    if (v4)
    {
      id v5 = v4;
      if (CFStringGetCString(a1, v4, v3, 0)) {
        printf("%s", v5);
      }
      free(v5);
    }
  }

uint64_t sub_1000061FC(uint64_t a1, _BYTE *a2)
{
  if (*a2) {
    *a2 = 0;
  }
  else {
    putchar(44);
  }
  return sub_100005D9C(a1);
}

uint64_t sub_100006234(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if (*a3) {
    *a3 = 0;
  }
  else {
    putchar(44);
  }
  sub_100005D9C(a1);
  putchar(61);
  return sub_100005D9C(a2);
}

uint64_t sub_100006280(uint64_t a1, _BYTE *a2)
{
  if (*a2) {
    *a2 = 0;
  }
  else {
    putchar(44);
  }
  return sub_100005D9C(a1);
}

void *sub_1000062B8(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_10000315C();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    id v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    id v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_100006368()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

_OWORD *sub_100006390(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  id v6 = (void **)sub_100006450((uint64_t)a1, &v14, a2);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    uint64_t v7 = operator new(0x58uLL);
    v12[1] = a1 + 1;
    unsigned int v9 = *a4;
    uint64_t v10 = *((void *)*a4 + 2);
    v7[2] = **a4;
    *((void *)v7 + 6) = v10;
    v9[1] = 0LL;
    v9[2] = 0LL;
    *unsigned int v9 = 0LL;
    *((_DWORD *)v7 + 14) = 0;
    char v13 = 1;
    sub_1000064EC(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0LL;
    sub_100006740((uint64_t)v12, 0LL);
  }

  return v7;
}

void *sub_100006450(uint64_t a1, void *a2, const void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        unsigned int v9 = (const void **)(v4 + 32);
        uint64_t v4 = *v8;
        size_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (!sub_100006540(v7, v9, a3)) {
        break;
      }
      size_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }

    while (v4);
  }

  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }

LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *sub_1000064EC(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  size_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }

  __n128 result = sub_1000065A8(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL sub_100006540(uint64_t a1, const void **a2, const void **a3)
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
    id v6 = a2;
  }
  else {
    id v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
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

uint64_t *sub_1000065A8(uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      CFTypeID v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            size_t v9 = (uint64_t **)a2[2];
          }

          else
          {
            size_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            *size_t v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            CFTypeID v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
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
          *CFTypeID v2 = v11;
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
        CFTypeID v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
        *CFTypeID v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }

      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *size_t v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

void sub_100006740(uint64_t a1, uint64_t a2)
{
  CFTypeID v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      sub_100006784((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }

void sub_100006784(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 24);
  if (v2 == 4)
  {
    int v3 = (void **)(a1 + 32);
    sub_1000067F0(&v3);
  }

  else if (v2 == 3 && *(char *)(a1 + 55) < 0)
  {
    operator delete(*(void **)(a1 + 32));
  }

void sub_1000067F0(void ***a1)
{
  int v2 = *a1;
  if (*v2)
  {
    sub_100006830((uint64_t *)v2);
    operator delete(**a1);
  }

void sub_100006830(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24LL)
  {
  }

  a1[1] = v2;
}

uint64_t *sub_10000687C(uint64_t *a1, const void ***a2)
{
  a1[2] = 0LL;
  a1[1] = 0LL;
  *a1 = (uint64_t)(a1 + 1);
  sub_1000068D0(a1, *a2, a2 + 1);
  return a1;
}

void sub_1000068B8(_Unwind_Exception *a1)
{
}

uint64_t *sub_1000068D0(uint64_t *result, const void **a2, const void ***a3)
{
  if (a2 != (const void **)a3)
  {
    int v4 = a2;
    size_t v5 = (uint64_t **)result;
    int v6 = result + 1;
    do
    {
      __n128 result = sub_100006954(v5, v6, v4 + 4, (__int128 *)v4 + 2);
      uint64_t v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          int v8 = (const void ***)v7;
          uint64_t v7 = (const void **)*v7;
        }

        while (v7);
      }

      else
      {
        do
        {
          int v8 = (const void ***)v4[2];
          BOOL v9 = *v8 == v4;
          int v4 = (const void **)v8;
        }

        while (!v9);
      }

      int v4 = (const void **)v8;
    }

    while (v8 != a3);
  }

  return result;
}

uint64_t *sub_100006954(uint64_t **a1, uint64_t *a2, const void **a3, __int128 *a4)
{
  int v6 = sub_1000069E8(a1, a2, &v12, &v11, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    int v8 = (uint64_t **)v6;
    sub_100006B80((uint64_t)a1, a4, (uint64_t)v10);
    sub_1000064EC(a1, (uint64_t)v12, v8, v10[0]);
    uint64_t v7 = v10[0];
    v10[0] = 0LL;
    sub_100006740((uint64_t)v10, 0LL);
  }

  return v7;
}

const void **sub_1000069E8(void *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  BOOL v9 = (const void **)(a1 + 1);
  if (a1 + 1 == a2 || sub_100006540((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v12 = (const void **)a2;
LABEL_16:
      if (*a2)
      {
        *a3 = v12;
        return v12 + 1;
      }

      else
      {
        *a3 = (const void **)a2;
        return (const void **)a2;
      }
    }

    uint64_t v11 = (const void **)*a2;
    if (*a2)
    {
      do
      {
        uint64_t v12 = v11;
        uint64_t v11 = (const void **)v11[1];
      }

      while (v11);
    }

    else
    {
      id v16 = a2;
      do
      {
        uint64_t v12 = (const void **)v16[2];
        BOOL v17 = *v12 == v16;
        id v16 = (uint64_t *)v12;
      }

      while (v17);
    }

    return (const void **)sub_100006450((uint64_t)a1, a3, a5);
  }

  if (sub_100006540((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
  {
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      uint64_t v14 = (const void **)a2[1];
      do
      {
        int v15 = v14;
        uint64_t v14 = (const void **)*v14;
      }

      while (v14);
    }

    else
    {
      int v18 = (const void **)a2;
      do
      {
        int v15 = (const void **)v18[2];
        BOOL v17 = *v15 == v18;
        int v18 = v15;
      }

      while (!v17);
    }

    if (v15 != v9)
    {
      uint64_t v13 = *a4;
    }

    if (v13)
    {
      *a3 = v15;
      return v15;
    }

    else
    {
      *a3 = (const void **)a2;
    }

    return (const void **)a4;
  }

  *a3 = (const void **)a2;
  *a4 = (uint64_t)a2;
  return (const void **)a4;
}

char *sub_100006B80@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = (char *)operator new(0x58uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  __n128 result = sub_100006BE8(v6 + 32, a2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_100006BD0(_Unwind_Exception *a1)
{
}

char *sub_100006BE8(char *__dst, __int128 *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_100006CE8(__dst, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v4 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }

  int v5 = *((_DWORD *)a2 + 6);
  *((_DWORD *)__dst + 6) = v5;
  int v6 = __dst + 32;
  switch(v5)
  {
    case 1:
      *int v6 = *((_BYTE *)a2 + 32);
      break;
    case 2:
      *(void *)int v6 = *((void *)a2 + 4);
      break;
    case 3:
      if (*((char *)a2 + 55) < 0)
      {
        sub_100006CE8(v6, *((void **)a2 + 4), *((void *)a2 + 5));
      }

      else
      {
        __int128 v7 = a2[2];
        *((void *)__dst + 6) = *((void *)a2 + 6);
        *(_OWORD *)int v6 = v7;
      }

      break;
    case 4:
      *(void *)int v6 = 0LL;
      *((void *)__dst + 5) = 0LL;
      *((void *)__dst + 6) = 0LL;
      sub_100006D74( v6,  *((__int128 **)a2 + 4),  *((__int128 **)a2 + 5),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 5) - *((void *)a2 + 4)) >> 3));
      break;
    default:
      return __dst;
  }

  return __dst;
}

void sub_100006CCC(_Unwind_Exception *exception_object)
{
}

void *sub_100006CE8(_BYTE *__dst, void *__src, unint64_t a3)
{
  int v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_10000315C();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    *int v5 = v8;
    int v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

char *sub_100006D74(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_100006DF8(result, a4);
    __n128 result = sub_100006EA0((uint64_t)(v6 + 16), a2, a3, *((char **)v6 + 1));
    *((void *)v6 + 1) = result;
  }

  return result;
}

void sub_100006DD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_1000067F0(&a9);
  _Unwind_Resume(a1);
}

char *sub_100006DF8(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100006E48();
  }
  __n128 result = (char *)sub_100006E5C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void sub_100006E48()
{
}

void *sub_100006E5C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100006368();
  }
  return operator new(24 * a2);
}

char *sub_100006EA0(uint64_t a1, __int128 *a2, __int128 *a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v11 = __dst;
  uint64_t v12 = __dst;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_100006CE8(v4, *(void **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }

      else
      {
        __int128 v7 = *v6;
        *((void *)v4 + 2) = *((void *)v6 + 2);
        *(_OWORD *)uint64_t v4 = v7;
      }

      uint64_t v6 = (__int128 *)((char *)v6 + 24);
      v4 += 24;
      uint64_t v12 = v4;
    }

    while (v6 != a3);
  }

  char v10 = 1;
  sub_100006F5C((uint64_t)v9);
  return v4;
}

void sub_100006F48( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100006F5C(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_100006F90(a1);
  }
  return a1;
}

void sub_100006F90(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    v1 -= 24LL;
  }

void sub_100006FD4(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_100006FD4(a1, *a2);
    sub_100006FD4(a1, a2[1]);
    sub_100006784((uint64_t)(a2 + 4));
    operator delete(a2);
  }

__CFSet *sub_10000701C(char *__s2, unint64_t a2, const __CFAllocator *a3, uint64_t a4, void *a5)
{
  unint64_t v5 = a2;
  if (a5) {
    *a5 = 0LL;
  }
  __int128 v7 = 0LL;
  if (*__s2 == 212)
  {
    unint64_t v47 = a2 >> 2;
    int v8 = calloc(a2 >> 2, 8uLL);
  }

  else
  {
    int v8 = 0LL;
    if (strcmp(byte_10000A130, __s2)) {
      return 0LL;
    }
  }

  __src = 0LL;
  uint64_t v64 = 0LL;
  unsigned int v66 = 0;
  uint64_t v49 = 0LL;
  unint64_t v50 = 0LL;
  unsigned int v52 = 0;
  id v48 = 0LL;
  uint64_t v9 = 0LL;
  id v65 = 0LL;
  __int128 v7 = 0LL;
  char v10 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v53 = __s2;
  id v67 = __s2 + 4;
  BOOL v51 = v8 != 0LL;
  uint64_t v12 = 4LL;
  int v54 = v8;
  unint64_t v60 = v5;
LABEL_10:
  theSet = v7;
  int v61 = v11;
  uint64_t v62 = v10;
  while (2)
  {
    unint64_t v13 = v12 + 4;
    if (v12 + 4 > v5) {
      goto LABEL_93;
    }
    __int128 v7 = 0LL;
    int v15 = v67 + 4;
    int v14 = *(_DWORD *)v67;
    int v16 = *(_DWORD *)v67 & 0x7F000000;
    BOOL v17 = v9;
    CFIndex v18 = *(_DWORD *)v67 & 0xFFFFFFLL;
    uint64_t v19 = (v18 + 3) >> 2;
    switch((v16 - 0x1000000) >> 24)
    {
      case 0u:
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a3, v18, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v57 = 0LL;
        __int128 v7 = 0LL;
        BOOL v63 = v18 != 0;
        uint64_t v58 = Mutable;
        goto LABEL_16;
      case 1u:
        CFMutableDictionaryRef Mutable = CFArrayCreateMutable(a3, v18, &kCFTypeArrayCallBacks);
        uint64_t v58 = 0LL;
        __int128 v7 = 0LL;
        BOOL v63 = v18 != 0;
        v57 = Mutable;
        goto LABEL_16;
      case 2u:
        CFMutableDictionaryRef Mutable = CFSetCreateMutable(a3, v18, &kCFTypeSetCallBacks);
        __int128 v7 = Mutable;
        v57 = 0LL;
        uint64_t v58 = 0LL;
        BOOL v63 = v18 != 0;
LABEL_16:
        uint64_t v9 = (const __CFString *)Mutable;
        BOOL v21 = v51;
        goto LABEL_36;
      case 3u:
        unint64_t v13 = v12 + 12;
        if (v12 + 12 > v5) {
          goto LABEL_93;
        }
        else {
          CFNumberType v22 = kCFNumberSInt64Type;
        }
        uint64_t v9 = (const __CFString *)CFNumberCreate(a3, v22, v15);
        v57 = 0LL;
        uint64_t v58 = 0LL;
        __int128 v7 = 0LL;
        BOOL v63 = 0;
        BOOL v21 = 0;
        int v15 = v67 + 12;
        goto LABEL_36;
      case 7u:
        if (!(_DWORD)v18) {
          goto LABEL_93;
        }
        LODWORD(v18) = v18 - 1;
        goto LABEL_24;
      case 8u:
LABEL_24:
        v13 += 4LL * v19;
        if (v13 > v5) {
          goto LABEL_93;
        }
        CFIndex v23 = v18;
        if (v16 == 0x8000000)
        {
        }

        uint64_t v9 = CFStringCreateWithBytes(a3, (const UInt8 *)v15, v18, 0x8000100u, 0);
        if (!v9)
        {
          uint64_t v9 = CFStringCreateWithBytes(a3, (const UInt8 *)v15, v23, 0, 0);
          CStringPtr = CFStringGetCStringPtr(v9, 0);
          syslog(3, "FIXME: IOUnserialize has detected a string that is not valid UTF-8, %s.", CStringPtr);
        }

LABEL_31:
        v57 = 0LL;
        uint64_t v58 = 0LL;
        __int128 v7 = 0LL;
        BOOL v63 = 0;
        BOOL v21 = 0;
        v15 += 4 * v19;
LABEL_36:
        unsigned int v25 = v66;
        if (!v9) {
          goto LABEL_93;
        }
        if (v66 < v64)
        {
          uint64_t v26 = v64;
          uint64_t v27 = __src;
LABEL_46:
          char v29 = 0;
          *(void *)&v27[8 * v25] = v9;
          int v28 = 1;
          __src = v27;
          uint64_t v64 = v26;
          int v8 = v54;
          if (!v54) {
            goto LABEL_48;
          }
LABEL_47:
          v8[(v67 - v53) >> 2] = v9;
          goto LABEL_48;
        }

        if (BYTE3(v64))
        {
          int v28 = 0;
          char v29 = 1;
          if (!v8) {
            goto LABEL_48;
          }
          goto LABEL_47;
        }

        uint64_t v26 = (v64 + 64);
        unsigned int v30 = (char *)malloc(8 * v26);
        if (v30)
        {
          uint64_t v27 = v30;
          if (__src)
          {
            memmove(v30, __src, 8LL * v64);
            free(__src);
          }

          unsigned int v25 = v66;
          goto LABEL_46;
        }

        int v28 = 0;
        char v29 = 1;
        int v8 = v54;
        unsigned int v25 = v66;
        if (v54) {
          goto LABEL_47;
        }
LABEL_48:
        if ((v29 & 1) != 0) {
          goto LABEL_92;
        }
        unsigned int v31 = v25 + 1;
        if (v21)
        {
          uint64_t v12 = v13 + 4;
          if (v13 + 4 > v60)
          {
            unsigned int v66 = v31;
LABEL_92:
            CFRelease(v9);
LABEL_93:
            __int128 v7 = 0LL;
            goto LABEL_94;
          }

          id v67 = v15 + 4;
          int v28 = 1;
        }

        else
        {
LABEL_61:
          uint64_t v12 = v13;
          id v67 = v15;
        }

        id v33 = v65;
        unsigned int v66 = v31;
        if (v61)
        {
          if (v65)
          {
            unint64_t v5 = v60;
            if (v9 != (const __CFString *)v61) {
              CFDictionarySetValue(v61, v65, v9);
            }
            id v33 = 0LL;
          }

          else
          {
            CFTypeID TypeID = CFStringGetTypeID();
            id v33 = v9;
            unint64_t v5 = v60;
            if (TypeID != CFGetTypeID(v9)) {
              goto LABEL_93;
            }
          }
        }

        else if (v62)
        {
          CFArrayAppendValue(v62, v9);
          unint64_t v5 = v60;
        }

        else
        {
          unint64_t v5 = v60;
          if (theSet)
          {
            CFSetAddValue(theSet, v9);
          }

          else
          {
            unint64_t v35 = (unint64_t)v48 | (unint64_t)v17;
            id v48 = (__CFString *)v9;
            if (v35) {
              goto LABEL_93;
            }
          }
        }

        if (!v28) {
          goto LABEL_93;
        }
        id v65 = v33;
        if (v63)
        {
          theSet = v7;
          int v61 = v58;
          uint64_t v62 = v57;
          if (v14 < 0) {
            continue;
          }
          unsigned int v38 = v52 + 1;
          if (v52 + 1 >= v49)
          {
            if (WORD1(v49)) {
              goto LABEL_93;
            }
            uint64_t v39 = (v49 + 64);
            id v41 = malloc(8 * v39);
            if (!v41) {
              goto LABEL_93;
            }
            int v40 = v41;
            if (v50)
            {
              memmove(v41, v50, 8LL * v49);
              free(v50);
            }
          }

          else
          {
            uint64_t v39 = v49;
            int v40 = v50;
          }

          ++v52;
          v40[v38] = v17;
          uint64_t v49 = v39;
          unint64_t v50 = v40;
          unint64_t v5 = v60;
          char v10 = v57;
          uint64_t v11 = v58;
          goto LABEL_10;
        }

        uint64_t v9 = v17;
        if ((v14 & 0x80000000) == 0) {
          continue;
        }
        unsigned int v36 = v52;
        if (v52)
        {
          uint64_t v9 = (const __CFString *)*((void *)v50 + v52--);
          CFTypeID v37 = CFGetTypeID(*((CFTypeRef *)v50 + v36));
          theSet = 0LL;
          int v61 = (__CFDictionary *)v9;
          uint64_t v62 = 0LL;
          if (v37 != CFDictionaryGetTypeID())
          {
            theSet = 0LL;
            int v61 = 0LL;
            uint64_t v62 = (__CFArray *)v9;
            if (v37 != CFArrayGetTypeID())
            {
              int v61 = 0LL;
              uint64_t v62 = 0LL;
              __int128 v7 = 0LL;
              theSet = (__CFSet *)v9;
              if (v37 != CFSetGetTypeID()) {
                goto LABEL_94;
              }
            }
          }

          continue;
        }

        __int128 v7 = (__CFSet *)v48;
LABEL_94:
        if ((_DWORD)v64)
        {
          unsigned int v42 = v7 != 0LL;
          int v43 = v66 - v42;
          if (v66 > v42)
          {
            v44 = (const void **)&__src[8 * (v7 != 0LL)];
            do
            {
              v45 = *v44++;
              CFRelease(v45);
              --v43;
            }

            while (v43);
          }

          free(__src);
        }

        if ((_DWORD)v49) {
          free(v50);
        }
        if (v8) {
          free(v8);
        }
        return v7;
      case 9u:
        v13 += 4LL * v19;
        if (v13 > v5) {
          goto LABEL_93;
        }
        uint64_t v9 = (const __CFString *)CFDataCreate(a3, (const UInt8 *)v15, v18);
        goto LABEL_31;
      case 0xAu:
        if ((_DWORD)v18) {
          uint64_t v9 = (const __CFString *)kCFBooleanTrue;
        }
        else {
          uint64_t v9 = (const __CFString *)kCFBooleanFalse;
        }
        CFRetain(v9);
        v57 = 0LL;
        uint64_t v58 = 0LL;
        __int128 v7 = 0LL;
        BOOL v63 = 0;
        BOOL v21 = 0;
        goto LABEL_36;
      case 0xBu:
        if (v8)
        {
          unsigned int v31 = v66;
          id v32 = (const __CFString **)&v8[v18];
        }

        else
        {
          unsigned int v31 = v66;
          id v32 = (const __CFString **)&__src[8 * v18];
        }

        __int128 v7 = 0LL;
        uint64_t v9 = *v32;
        if (!*v32) {
          goto LABEL_94;
        }
        BOOL v63 = 0;
        int v28 = 1;
        v57 = 0LL;
        uint64_t v58 = 0LL;
        goto LABEL_61;
      default:
        goto LABEL_94;
    }
  }

__CFSet *sub_1000076BC(char *__s2, unint64_t a2, const __CFAllocator *a3, uint64_t a4, void *a5)
{
  if (a5) {
    *a5 = 0LL;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100007748(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, (CFDictionaryRef)v3, &existing);
    if ((_DWORD)MatchingServices)
    {
      NSLog(@"Matching returned error: %d", MatchingServices);
      uint64_t v7 = 0LL;
      goto LABEL_22;
    }

    while (1)
    {
      uint64_t v8 = IOIteratorNext(existing);
      if (!(_DWORD)v8) {
        break;
      }
      v4[2](v4, v8);
      IOObjectRelease(v8);
    }

    IOObjectRelease(existing);
LABEL_19:
    uint64_t v7 = 1LL;
    goto LABEL_22;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v3, v9) & 1) == 0) {
    goto LABEL_19;
  }
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v10 = v3;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      unint64_t v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = IOServiceGetMatchingServices( kIOMainPortDefault,  (CFDictionaryRef)*(id *)(*((void *)&v17 + 1) + 8LL * (void)v13),  &existing);
        if ((_DWORD)v14)
        {
          NSLog(@"Matching returned error: %d", v14);
          uint64_t v7 = 0LL;
          goto LABEL_21;
        }

        while (1)
        {
          uint64_t v15 = IOIteratorNext(existing);
          if (!(_DWORD)v15) {
            break;
          }
          v4[2](v4, v15);
          IOObjectRelease(v15);
        }

        IOObjectRelease(existing);
        unint64_t v13 = (char *)v13 + 1;
      }

      while (v13 != v11);
      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v7 = 1LL;
LABEL_21:

LABEL_22:
  return v7;
}

void sub_10000797C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000079C0(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2) {
    BOOL v4 = v3 == 0LL;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    uint64_t v5 = &off_10000CEA8;
  }
  else {
    uint64_t v5 = v3;
  }
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    id v7 = [v5 longLongValue];
    if (a2 == 16) {
      uint64_t v8 = @"%#llx";
    }
    else {
      uint64_t v8 = @"%lld";
    }
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v7));
  }

  else
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v5));
  }

  id v10 = (void *)v9;

  return v10;
}

void sub_100007A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100007A9C(uint64_t *a1)
{
  else {
    uint64_t v1 = (uint64_t *)*a1;
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithUTF8String:](&OBJC_CLASS___NSMutableString, "stringWithUTF8String:", v1));
  id v29 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"0[xX][0-9a-f]+",  1LL,  &v29));
  id v4 = v29;
  uint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  while (1)
  {
    id v7 = [v3 firstMatchInString:v2 options:0 range:NSMakeRange([v2 length] - [v6 length], [v6 length])];

    if (!v7) {
      break;
    }
    id v8 = [v7 range];
    id v10 = [v2 substringWithRange:v8, v9];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v10));

    uint64_t v28 = 0LL;
    [v11 scanHexLongLong:&v28];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%llu", v28));
    id v13 = [v7 range];
    [v2 replaceCharactersInRange:v13 withString:v14];
    uint64_t v15 = (char *)[v7 range];
    uint64_t v6 = &v15[(void)[v12 length]];

    uint64_t v5 = v7;
  }

  if (!v2 || ![v2 length])
  {
    __int128 v17 = 0LL;
    goto LABEL_19;
  }

  int v16 = (void *)objc_claimAutoreleasedReturnValue([v2 substringToIndex:1]);
  if ([v16 isEqual:@"["])
  {

    goto LABEL_13;
  }

  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v2 substringToIndex:1]);
  unsigned int v19 = [v18 isEqual:@"{"];

  if (v19)
  {
LABEL_13:
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v2 dataUsingEncoding:4]);
    id v27 = 0LL;
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v20,  1LL,  &v27));
    id v22 = v27;

    __int128 v17 = v21;
    if (!v22) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }

  id v22 = 0LL;
  BOOL v21 = 0LL;
LABEL_16:
  CFIndex v23 = (void *)objc_claimAutoreleasedReturnValue([v2 dataUsingEncoding:4]);
  id v26 = 0LL;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v23,  0LL,  0LL,  &v26));
  id v24 = v26;

  if (v24) {
    NSLog(@"ERROR! Failed to parse property string [%@] JSON error: %@ Plist error: %@", v2, v22, v24);
  }

LABEL_19:
  return v17;
}

void sub_100007DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSMutableData *sub_100007E40(unsigned __int8 **a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (v1 == *a1)
  {
    id v7 = 0LL;
  }

  else
  {
    uint64_t v4 = 0LL;
    do
    {
      else {
        unint64_t v5 = v2[23];
      }
      v4 += (v5 >> 1) + (v5 & 1);
      v2 += 24;
    }

    while (v2 != v1);
    uint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableData);
    -[NSMutableData setLength:](v6, "setLength:", v4);
    id v7 = v6;
    id v8 = -[NSMutableData mutableBytes](v7, "mutableBytes");
    uint64_t v9 = *a1;
    id v10 = a1[1];
    if (*a1 != v10)
    {
      uint64_t v11 = 0LL;
      do
      {
        else {
          LODWORD(v12) = v9[23];
        }
        uint64_t v13 = (v12 - 1);
        if ((int)v12 >= 1)
        {
          unsigned int v14 = v12 + 1;
          while (1)
          {
            unsigned int v15 = v14 - 2;
            if (v14 == 2) {
              break;
            }
            int v16 = v9;
            int v17 = v16[v13];
            unsigned int v18 = v17 - 97;
            char v19 = v17 + 9;
            if (v18 <= 5) {
              LOBYTE(v17) = v19;
            }
            __int128 v20 = v9;
            char v21 = v17 & 0xF;
            int v22 = v20[v14 - 3];
            unsigned int v23 = v22 - 97;
            char v24 = v22 + 9;
            if (v23 <= 5) {
              LOBYTE(v22) = v24;
            }
            v8[v11++] = v21 | (16 * v22);
            v13 -= 2LL;
            unsigned int v14 = v15;
            if (v15 <= 1) {
              goto LABEL_36;
            }
          }

          unsigned int v25 = v9;
          int v26 = *v25;
          unsigned int v27 = v26 - 97;
          char v28 = v26 + 9;
          if (v27 <= 5) {
            LOBYTE(v26) = v28;
          }
          v8[v11++] = v26 & 0xF;
        }

LABEL_36:
        v9 += 24;
      }

      while (v9 != v10);
    }
  }

  return v7;
}

void sub_100007FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007FF0(const char *a1, unint64_t a2, int a3)
{
  CFStringRef errorString = 0LL;
  if (!a2)
  {
    puts("(blank)");
    return;
  }

  if (a3 == 2)
  {
    sub_100002B40((uint64_t)a1, a2, 0LL, 0);
    return;
  }

  uint64_t v4 = (void *)IOCFUnserializeWithSize(a1, a2, kCFAllocatorDefault, 0LL, &errorString);
  unint64_t v5 = v4;
  if (v4)
  {
    switch(a3)
    {
      case 0:
        id v13 = 0LL;
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v4,  100LL,  0LL,  &v13));
        id v7 = v13;
        if (v9) {
          printf("%.*s", (int)[v9 length], (const char *)[v9 bytes]);
        }
        else {
          NSLog(@"ERROR! Unable to convert to xml\n");
        }

        goto LABEL_22;
      case 1:
        if (+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v4))
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  1LL,  0LL));
          uint64_t v11 = v10;
          if (v10)
          {
            unsigned int v12 = [v10 length];
            id v7 = v11;
            printf("%.*s\n", v12, (const char *)[v7 bytes]);
LABEL_22:

            break;
          }
        }

        NSLog(@"ERROR! Unable to convert to json\n");
        break;
      case 3:
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
        id v7 = v6;
        if (v6) {
          id v8 = (const char *)[v6 UTF8String];
        }
        else {
          id v8 = "(blank)";
        }
        puts(v8);
        goto LABEL_22;
    }
  }

  else
  {
    NSLog(@"ERROR! Unable to unserialize object\n");
  }
}

void sub_1000081E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000821C(io_registry_entry_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(a1, @"role", 0LL, 0);
    id v10 = CFProperty;
    v11[0] = @"IOPropertyMatch";
    uint64_t v9 = @"role";
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    v12[0] = v8;
    v12[1] = @"md-allocator";
    v11[1] = @"IOPropertyExistsMatch";
    v11[2] = @"IOProviderClass";
    void v12[2] = @"AFKMemoryDescriptorManager";
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));
  }

  sub_100007748(v5, v6);
}

void sub_100008340(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t sub_100008380(uint64_t **a1)
{
  uint64_t v25 = 0LL;
  int v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  int v28 = 0;
  sub_1000062B8(__p, "--matching");
  id v29 = __p;
  int v2 = *((_DWORD *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29) + 14);
  if ((v24 & 0x80000000) == 0)
  {
    if (v2) {
      goto LABEL_3;
    }
LABEL_6:
    sub_1000062B8(__p, "--role");
    id v29 = __p;
    int v6 = *((_DWORD *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29) + 14);
    if (v24 < 0)
    {
      operator delete(__p[0]);
      if (v6)
      {
LABEL_8:
        sub_1000062B8(__p, "--role");
        id v29 = __p;
        id v7 = sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29);
        sub_1000051CC((int *)v7 + 14, 3u);
        id v8 = v7 + 4;
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  1LL));
        if (v24 < 0) {
          operator delete(__p[0]);
        }
        CFMutableDictionaryRef v5 = IOServiceMatching("AFKEndpointInterface");
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v9,  @"role"));
        sub_1000062B8(__p, "--name");
        id v29 = __p;
        int v11 = *((_DWORD *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29) + 14);
        if (v24 < 0)
        {
          operator delete(__p[0]);
          if (v11) {
            goto LABEL_14;
          }
        }

        else if (v11)
        {
LABEL_14:
          sub_1000062B8(__p, "--name");
          id v29 = __p;
          unsigned int v12 = sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29);
          sub_1000051CC((int *)v12 + 14, 3u);
          id v13 = v12 + 4;
          unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  1LL));
          if (v24 < 0) {
            operator delete(__p[0]);
          }
          -[__CFDictionary setObject:forKey:](v5, "setObject:forKey:", v14, @"IONameMatch");

          goto LABEL_23;
        }

        [v10 setObject:&__kCFBooleanTrue forKey:@"system-service"];
LABEL_23:
        -[__CFDictionary setObject:forKey:](v5, "setObject:forKey:", v10, @"IOPropertyMatch");

        goto LABEL_24;
      }
    }

    else if (v6)
    {
      goto LABEL_8;
    }

    CFMutableDictionaryRef v5 = 0LL;
    goto LABEL_24;
  }

  operator delete(__p[0]);
  if (!v2) {
    goto LABEL_6;
  }
LABEL_3:
  sub_1000062B8(__p, "--matching");
  id v29 = __p;
  id v3 = sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29);
  sub_1000051CC((int *)v3 + 14, 3u);
  id v4 = sub_100007A9C((uint64_t *)v3 + 8);
  CFMutableDictionaryRef v5 = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue(v4);
  if (v24 < 0) {
    operator delete(__p[0]);
  }
LABEL_24:
  sub_1000062B8(__p, "FILENAME");
  id v29 = __p;
  int v15 = *((_DWORD *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29) + 14);
  if (v24 < 0)
  {
    operator delete(__p[0]);
    if (v15) {
      goto LABEL_26;
    }
  }

  else if (v15)
  {
LABEL_26:
    sub_1000062B8(__p, "FILENAME");
    id v29 = __p;
    int v16 = sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29);
    sub_1000051CC((int *)v16 + 14, 3u);
    int v17 = v16 + 4;
    if (v24 < 0) {
      operator delete(__p[0]);
    }
    BOOL v18 = 0;
    goto LABEL_35;
  }

  sub_1000062B8(__p, "--reset");
  id v29 = __p;
  BOOL v18 = *((_DWORD *)sub_100006390(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29) + 14) != 0;
  if (v24 < 0) {
    operator delete(__p[0]);
  }
  int v17 = 0LL;
LABEL_35:
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000088E8;
  v21[3] = &unk_10000C6F0;
  BOOL v22 = v18;
  v21[4] = &v25;
  v21[5] = v17;
  sub_100007748(v5, v21);
  uint64_t v19 = *((unsigned int *)v26 + 6);
  _Block_object_dispose(&v25, 8);

  return v19;
}

void sub_10000881C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21, char a22)
{
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000088E8(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 48)) {
    BOOL result = sub_10000893C(a2);
  }
  else {
    BOOL result = sub_100008B94(a2, *(void *)(a1 + 40));
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) |= result;
  return result;
}

BOOL sub_10000893C(uint64_t a1)
{
  uint64_t v19 = AFKEndpointInterfaceDataQueueSizeKey;
  __int128 v20 = &off_10000CEC0;
  int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[AFKEndpointInterface withService:properties:]( &OBJC_CLASS___AFKEndpointInterface,  "withService:properties:",  a1,  v2));

  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  uint64_t v15 = 0LL;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  int v18 = 0;
  dispatch_queue_t v5 = dispatch_queue_create("afktool", 0LL);
  [v3 setDispatchQueue:v5];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  void v12[2] = sub_100008F10;
  void v12[3] = &unk_10000C568;
  unsigned int v14 = &v15;
  int v6 = v4;
  id v13 = v6;
  [v3 setResponseHandler:v12];
  [v3 activate:1];
  int v11 = 0;
  LODWORD(v10) = 0;
  uint64_t v7 = (uint64_t)[v3 enqueueCommand:213 timestamp:mach_continuous_time() inputBuffer:0 inputBufferSize:0 outputPayloadSize:16 context:&v11 options:v10];
  *((_DWORD *)v16 + 6) = v7;
  if ((_DWORD)v7) {
    goto LABEL_5;
  }
  if (dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v7 = 3758097110LL;
    *((_DWORD *)v16 + 6) = -536870186;
LABEL_5:
    NSLog(@"ERROR!enqueueCommand:%x", v7);
    goto LABEL_6;
  }

  uint64_t v7 = *((unsigned int *)v16 + 6);
  if ((_DWORD)v7) {
    goto LABEL_5;
  }
LABEL_6:
  [v3 cancel];
  BOOL v8 = *((_DWORD *)v16 + 6) != 0;

  _Block_object_dispose(&v15, 8);
  return v8;
}

void sub_100008B38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100008B94(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = AFKEndpointInterfaceDataQueueSizeKey;
  unsigned int v30 = &off_10000CEC0;
  dispatch_semaphore_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AFKEndpointInterface withService:properties:]( &OBJC_CLASS___AFKEndpointInterface,  "withService:properties:",  a1,  v4));

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  uint64_t v25 = 0LL;
  int v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  int v28 = 0;
  dispatch_queue_t v7 = dispatch_queue_create("afktool", 0LL);
  BOOL v8 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
  [v5 setDispatchQueue:v7];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100008F24;
  v22[3] = &unk_10000C568;
  char v24 = &v25;
  uint64_t v9 = v6;
  unsigned int v23 = v9;
  [v5 setResponseHandler:v22];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100008F38;
  v20[3] = &unk_10000C718;
  uint64_t v10 = v8;
  char v21 = v10;
  [v5 setReportHandler:v20];
  [v5 activate:1];
  int v19 = 0;
  LODWORD(v17) = 0;
  id v11 = [v5 enqueueCommand:211 timestamp:mach_continuous_time() inputBuffer:0 inputBufferSize:0 outputPayloadSize:16 context:&v19 options:v17];
  *((_DWORD *)v26 + 6) = (_DWORD)v11;
  if ((_DWORD)v11)
  {
    NSLog(@"ERROR!enqueueCommand:%x", v11);
  }

  else if (dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL))
  {
    NSLog(@"ERROR!enqueueCommand: timeout");
    *((_DWORD *)v26 + 6) = -536870186;
  }

  else
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
    id v18 = 0LL;
    unsigned __int8 v13 = -[NSMutableData writeToFile:options:error:]( v10,  "writeToFile:options:error:",  v12,  1LL,  &v18);
    id v14 = v18;

    if ((v13 & 1) == 0)
    {
      NSLog(@"ERROR! Saving codecoverage data to file:%@", v14);
      *((_DWORD *)v26 + 6) = -536870212;
    }
  }

  [v5 cancel];
  BOOL v15 = *((_DWORD *)v26 + 6) != 0;

  _Block_object_dispose(&v25, 8);
  return v15;
}

void sub_100008E84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008F10(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100008F24(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id *sub_100008F38(id *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a3 == 212) {
    return (id *)[result[4] appendBytes:a5 length:a6];
  }
  return result;
}

uint64_t start(int a1, uint64_t a2)
{
  sub_1000062B8( v13,  "Usage: afktool (--help | -v...)\n afktool registry (--role=<role> [--name=<name>] | --matching=<matching>) [-x]  [--archive [--format=<fmt>] [--path =<dir>]] [--buffer=<size>]\n \n Options:\n -r --role=<role>           IOP  role\n -a --archive               Archive output\n -x --hex                   Output numbers as hexidecimal. This option does not apply when creating an archive from ioreg.\n --buffer=<value>           The size of the command buffer to use. By default this is 64KB.\n -f --format=<fmt>          Archive or response output format (xml,bin)\n -p --path=<dir>            Save output to files at this path instead of stdout (1 file per role)\n -m --matching=<matching>   Service matching dictionary in json or xml format");
  v11[0] = 0LL;
  v11[1] = 0LL;
  uint64_t v12 = 0LL;
  sub_100009198(v11, (char **)(a2 + 8), (char **)(a2 + 8LL * a1), (8LL * a1 - 8) >> 3);
  sub_1000062B8(__p, "AppleFirmwareKit ToolvRC_ProjectBuildVersion Nov 10 2024 01:25:41");
  docopt::docopt(v15, v13, v11, 1LL, __p, 0LL);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  __p[0] = v11;
  sub_1000067F0((void ***)__p);
  if (v14 < 0) {
    operator delete(v13[0]);
  }
  sub_1000062B8(v13, "registry");
  v11[0] = v13;
  if (*((_DWORD *)sub_100006390(v15, (const void **)v13, (uint64_t)&unk_10000A114, (_OWORD **)v11) + 14))
  {
    sub_1000062B8(v11, "registry");
    __p[0] = v11;
    dispatch_semaphore_t v4 = (int *)sub_100006390(v15, (const void **)v11, (uint64_t)&unk_10000A114, (_OWORD **)__p);
    sub_1000051CC(v4 + 14, 1u);
    BOOL v5 = *((_BYTE *)v4 + 64) != 0;
    if (SHIBYTE(v12) < 0) {
      operator delete(v11[0]);
    }
  }

  else
  {
    BOOL v5 = 0;
  }

  if (v14 < 0)
  {
    operator delete(v13[0]);
    if (v5) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v6 = 1LL;
    goto LABEL_14;
  }

  if (!v5) {
    goto LABEL_13;
  }
LABEL_11:
  sub_10000687C((uint64_t *)v8, (const void ***)v15);
  uint64_t v6 = sub_1000031E4(v8);
  sub_100006FD4((uint64_t)v8, v8[1]);
LABEL_14:
  sub_100006FD4((uint64_t)v15, v15[1]);
  return v6;
}

void sub_100009104( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *__p, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
}

void *sub_100009198(void *result, char **a2, char **a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_100006DF8(result, a4);
    BOOL result = sub_10000921C((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }

  return result;
}

void sub_1000091FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_1000067F0(&a9);
  _Unwind_Resume(a1);
}

void *sub_10000921C(uint64_t a1, char **a2, char **a3, void *a4)
{
  dispatch_semaphore_t v4 = a4;
  uint64_t v10 = a4;
  id v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      sub_1000062B8(v4, *v6++);
      dispatch_semaphore_t v4 = v11 + 3;
      v11 += 3;
    }

    while (v6 != a3);
  }

  char v9 = 1;
  sub_100006F5C((uint64_t)v8);
  return v4;
}

void sub_1000092A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1000092BC(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "0x%llx: AFKIOCFUnserializeWithSize failed",  (uint8_t *)&v2,  0xCu);
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

id objc_msgSend_enqueueCommand_timestamp_inputBuffer_inputBufferSize_outputPayloadSize_context_options_( void *a1, const char *a2, ...)
{
  return [a1 enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:options:error:];
}