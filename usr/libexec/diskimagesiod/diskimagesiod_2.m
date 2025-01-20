void sub_100113DD0(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100113DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, off_t a5, char a6)
{
  *(void *)a1 = a3;
  *(void *)(a1 + 8) = 0LL;
  uint64_t v11 = *a4;
  *a4 = 0LL;
  *(void *)(a1 + 16) = v11;
  *(_BYTE *)(a1 + 24) = 1;
  unint64_t v12 = *(void *)(a2 + 40);
  v13 = operator new(0x50uLL);
  sub_100070FCC(v13, v12 >> 12, 0);
  uint64_t v14 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v13;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8LL))(v14);
  }
  if ((sub_100113F5C(a1) & 1) == 0)
  {
    if (!a6)
    {
      int v15 = (***(uint64_t (****)(void))(a2 + 8))(*(void *)(a2 + 8));
      sub_10003DFE8(a3, __p);
      a5 = sub_1000FB534(v15, (uint64_t)__p);
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
      sub_1001143B4(a1, 0LL, a5);
  }

  return a1;
}

void sub_100113EF0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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
  *(void *)(v15 + 8) = 0LL;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8LL))(v18);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100113F5C(uint64_t a1)
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
    uint64_t v9 = *((void *)sub_100118DDC() + 1);
    *(void *)&__int128 v26 = v8;
    *((void *)&v26 + 1) = v9;
    if (v9)
    {
      v10 = (unint64_t *)(v9 + 8);
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
      sub_100004D60((uint64_t)v23);
      sub_100004E4C(v23, (uint64_t)"Failed reading ", 15LL);
      sub_100114F70(v23, (void *)a1);
      sub_10001161C((uint64_t)exception, (uint64_t)v23, v12);
    }

    if (sub_1000B866C())
    {
      *(void *)&__int128 v21 = "sparse_bundles::mapped_blocks_t::load_file()";
      *((void *)&v21 + 1) = 42LL;
      int v22 = 2;
      sub_100114770(v23, &v21);
      sub_100004E4C(&v24, (uint64_t)"Found a valid file for ", 23LL);
      sub_100114F70(&v24, (void *)a1);
      std::ostream::~ostream(&v24, off_1001890C8);
      sub_1001151B4((uint64_t)v23);
      std::ios::~ios(v25);
    }

    *(_BYTE *)(a1 + 24) = 0;
    v13 = (std::__shared_weak_count *)*((void *)&v26 + 1);
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
    sub_100069838(v23, &v26);
    sub_100004E4C(&v24, (uint64_t)"invalid file size for ", 22LL);
    sub_100114F70(&v24, (void *)a1);
    sub_100004E4C(&v24, (uint64_t)", current is ", 13LL);
    std::ostream::operator<<(&v24, v4);
    sub_100004E4C(&v24, (uint64_t)" while expected is ", 19LL);
    std::ostream::operator<<(&v24, v2);
    sub_100004E4C(&v24, (uint64_t)", truncating", 12LL);
    std::ostream::~ostream(&v24, off_1001716F0);
    sub_10006C31C((uint64_t)v23);
    std::ios::~ios(v25);
    unsigned int v16 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 16) + 56LL))(*(void *)(a1 + 16), 0LL);
    if (v16)
    {
      unsigned int v17 = v16;
      uint64_t v18 = __cxa_allocate_exception(0x40uLL);
      sub_100004D60((uint64_t)v23);
      sub_100004E4C(v23, (uint64_t)"Failed truncating ", 18LL);
      sub_100114F70(v23, (void *)a1);
      sub_10001161C((uint64_t)v18, (uint64_t)v23, v17);
    }
  }

  else if (sub_1000B866C())
  {
    *(void *)&__int128 v26 = "sparse_bundles::mapped_blocks_t::load_file()";
    *((void *)&v26 + 1) = 42LL;
    LODWORD(v27) = 2;
    sub_100114858(v23, &v26);
    sub_100004E4C(&v24, (uint64_t)"file of ", 8LL);
    sub_100114F70(&v24, (void *)a1);
    sub_100004E4C(&v24, (uint64_t)" was just created (truncated)", 29LL);
    std::ostream::~ostream(&v24, off_1001892E8);
    sub_100115760((uint64_t)v23);
    std::ios::~ios(v25);
  }

  return v6;
}

void sub_10011430C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

uint64_t sub_1001143B4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6 = a2 + a3 - 1;
  uint64_t result = sub_1000B866C();
  if ((_DWORD)result)
  {
    *(void *)&__int128 v10 = "sparse_bundles::mapped_blocks_t::map_range(uint64_t, uint64_t)";
    *((void *)&v10 + 1) = 42LL;
    int v11 = 2;
    sub_100114CC4(v12, &v10);
    sub_100114F70(&v13, (void *)a1);
    sub_100004E4C(&v13, (uint64_t)" - map_range: [", 15LL);
    uint64_t v8 = v13;
    *(_DWORD *)((char *)&v13 + *(void *)(v13 - 24) + 8) |= 0x200u;
    *(_DWORD *)((char *)&v13 + *(void *)(v8 - 24) + 8) = *(_DWORD *)((_BYTE *)&v13 + *(void *)(v8 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::ostream::operator<<(&v13, a2);
    sub_100004E4C(&v13, (uint64_t)"-", 1LL);
    std::ostream::operator<<(&v13, v6);
    uint64_t v9 = v13;
    *(_DWORD *)((char *)&v13 + *(void *)(v13 - 24) + 8) &= ~0x200u;
    *(_DWORD *)((char *)&v13 + *(void *)(v9 - 24) + 8) = *(_DWORD *)((_BYTE *)&v13 + *(void *)(v9 - 24) + 8) & 0xFFFFFFB5 | 2;
    sub_100004E4C(&v13, (uint64_t)"]", 1LL);
    std::ostream::~ostream(&v13, off_100189728);
    sub_1001162B8((uint64_t)v12);
    uint64_t result = std::ios::~ios(&v14);
  }

  if (a3)
  {
    uint64_t result = sub_10008F08C(*(void *)(a1 + 8), a2 >> 12, v6 >> 12, 1LL);
    if ((_DWORD)result) {
      *(_BYTE *)(a1 + 24) = 1;
    }
  }

  return result;
}

void sub_10011453C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void sub_100114550(void *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  int v7 = (**(uint64_t (***)(void))*a1)(*a1);
  sub_10003DFE8(a2, __p);
  uint64_t v8 = operator new(0x458uLL);
  uint64_t v9 = sub_1000FA77C(v7, (uint64_t)__p, a3);
  sub_100045554((uint64_t)v8, v9, (a3 & 3) != 0, 0);
  *a4 = v8;
  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1001145EC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100114618(uint64_t a1, uint64_t a2, uint64_t a3, off_t a4, char a5)
{
  uint64_t v10 = v12;
  uint64_t v12 = 0LL;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8LL))(v10);
  }
  return a1;
}

void sub_1001146A8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 8LL))(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1001146CC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = v9;
  uint64_t v9 = 0LL;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8LL))(v7);
  }
  return a1;
}

void sub_10011474C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 8LL))(a10);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100114770(void *a1, __int128 *a2)
{
  uint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_1001166A0((uint64_t)a1, a2);
  *a1 = off_100189000;
  a1[45] = &off_100189100;
  a1[46] = &off_100189128;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_100189000;
  a1[45] = off_100189088;
  a1[46] = off_1001890B0;
  return a1;
}

void sub_1001147F4(_Unwind_Exception *a1)
{
}

uint64_t sub_100114818(uint64_t a1)
{
  return a1;
}

void *sub_100114858(void *a1, __int128 *a2)
{
  uint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_10011671C((uint64_t)a1, a2);
  *a1 = off_100189220;
  a1[45] = &off_100189320;
  a1[46] = &off_100189348;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_100189220;
  a1[45] = off_1001892A8;
  a1[46] = off_1001892D0;
  return a1;
}

void sub_1001148DC(_Unwind_Exception *a1)
{
}

uint64_t sub_100114900(uint64_t a1)
{
  return a1;
}

uint64_t sub_100114940(uint64_t a1, uint64_t a2)
{
  return sub_1001143B4(a1, *(void *)(a2 + 24), *(void *)(a2 + 16));
}

uint64_t sub_10011494C(uint64_t a1)
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
      uint64_t v7 = (std::__shared_weak_count *)*((void *)sub_100118DDC() + 1);
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
        if (sub_1000B866C())
        {
          *(void *)&__int128 v14 = "sparse_bundles::mapped_blocks_t::flush()";
          *((void *)&v14 + 1) = 38LL;
          int v15 = 2;
          sub_100114BDC(&v16, &v14);
          sub_100004E4C(&v22, (uint64_t)"Flushed ", 8LL);
          sub_100114F70(&v22, (void *)a1);
          sub_100004E4C(&v22, (uint64_t)", res=", 6LL);
          std::ostream::operator<<(&v22, v2);
          std::ostream::~ostream(&v22, off_100189508);
          sub_100115D0C((uint64_t)&v16);
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
    if (sub_1000B866C())
    {
      *(void *)&__int128 v14 = "sparse_bundles::mapped_blocks_t::flush()";
      *((void *)&v14 + 1) = 38LL;
      int v15 = 2;
      sub_1000E4CAC(&v16, &v14);
      sub_100114F70(&v22, (void *)a1);
      sub_100004E4C(&v22, (uint64_t)" is clean, skipping flush", 25LL);
      std::ostream::~ostream(&v22, off_100182D98);
      sub_1000E5234((uint64_t)&v16);
      std::ios::~ios(v23);
    }

    return 0LL;
  }

  return v2;
}

void sub_100114BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *sub_100114BDC(void *a1, __int128 *a2)
{
  unint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_100116798((uint64_t)a1, a2);
  *a1 = off_100189440;
  a1[45] = &off_100189540;
  a1[46] = &off_100189568;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_100189440;
  a1[45] = off_1001894C8;
  a1[46] = off_1001894F0;
  return a1;
}

void sub_100114C60(_Unwind_Exception *a1)
{
}

uint64_t sub_100114C84(uint64_t a1)
{
  return a1;
}

void *sub_100114CC4(void *a1, __int128 *a2)
{
  unint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_100116814((uint64_t)a1, a2);
  *a1 = off_100189660;
  a1[45] = &off_100189760;
  a1[46] = &off_100189788;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_100189660;
  a1[45] = off_1001896E8;
  a1[46] = off_100189710;
  return a1;
}

void sub_100114D48(_Unwind_Exception *a1)
{
}

uint64_t sub_100114D6C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100114DAC(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t result = sub_1000B866C();
  if ((_DWORD)result)
  {
    *(void *)&__int128 v11 = "sparse_bundles::mapped_blocks_t::unmap_interval(uint64_t, uint64_t)";
    *((void *)&v11 + 1) = 47LL;
    int v12 = 2;
    sub_1000158E8(v13, &v11);
    sub_100114F70(&v14, (void *)a1);
    sub_100004E4C(&v14, (uint64_t)" - unmap_range: [", 17LL);
    uint64_t v7 = v14;
    *(_DWORD *)((char *)&v14 + *(void *)(v14 - 24) + 8) |= 0x200u;
    *(_DWORD *)((char *)&v14 + *(void *)(v7 - 24) + 8) = *(_DWORD *)((_BYTE *)&v14 + *(void *)(v7 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::ostream::operator<<(&v14, a2);
    sub_100004E4C(&v14, (uint64_t)"-", 1LL);
    std::ostream::operator<<(&v14, a3);
    uint64_t v8 = v14;
    *(_DWORD *)((char *)&v14 + *(void *)(v14 - 24) + 8) &= ~0x200u;
    *(_DWORD *)((char *)&v14 + *(void *)(v8 - 24) + 8) = *(_DWORD *)((_BYTE *)&v14 + *(void *)(v8 - 24) + 8) & 0xFFFFFFB5 | 2;
    sub_100004E4C(&v14, (uint64_t)"]", 1LL);
    std::ostream::~ostream(&v14, off_100166350);
    sub_100015A4C((uint64_t)v13);
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

    uint64_t result = sub_10008F08C(*(void *)(a1 + 8), v9, v10, 0LL);
    if ((_DWORD)result) {
      *(_BYTE *)(a1 + 24) = 1;
    }
  }

  return result;
}

void sub_100114F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *sub_100114F70(void *a1, void *a2)
{
  unint64_t v4 = sub_100004E4C(a1, (uint64_t)"mapped blocks of band ", 22LL);
  *(_DWORD *)((char *)v4 + *(void *)(*v4 - 24LL) + 8) = *(_DWORD *)((_BYTE *)v4 + *(void *)(*v4 - 24LL) + 8) & 0xFFFFFFB5 | 8;
  uint64_t v5 = (void *)std::ostream::operator<<(v4, *a2);
  *(_DWORD *)((char *)v5 + *(void *)(*v5 - 24LL) + 8) = *(_DWORD *)((_BYTE *)v5 + *(void *)(*v5 - 24LL) + 8) & 0xFFFFFFB5 | 2;
  return a1;
}

uint64_t sub_100114FF0(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_1001890C8);
  sub_1001151B4(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_100115028(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_1001890C8);
  sub_1001151B4(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_100115068(char *a1)
{
}

uint64_t sub_1001150AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_1001150E0(_BYTE *a1, int a2)
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

void sub_10011512C(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_1001890C8);
  sub_1001151B4((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_10011516C(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_1001890C8);
  sub_1001151B4((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_1001151B4(uint64_t a1)
{
  *(void *)a1 = off_100189198;
  sub_100115250(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_100115250(uint64_t a1)
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
        sub_1000049D8(a1 + 104, __p);
        sub_1001153B8((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100004CB0(__p, "");
        sub_100004B48(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_100115378( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1001153A4(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1001151B4(a1);
  operator delete(v1);
}

int *sub_1001153B8(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000B85DC();
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
    uint64_t v13 = (os_log_s *)sub_1000B85DC();
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
  *uint64_t result = v5;
  return result;
}

uint64_t sub_10011559C(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_1001892E8);
  sub_100115760(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_1001155D4(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_1001892E8);
  sub_100115760(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_100115614(char *a1)
{
}

uint64_t sub_100115658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10011568C(_BYTE *a1, int a2)
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

void sub_1001156D8(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_1001892E8);
  sub_100115760((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_100115718(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_1001892E8);
  sub_100115760((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_100115760(uint64_t a1)
{
  *(void *)a1 = off_1001893B8;
  sub_1001157FC(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_1001157FC(uint64_t a1)
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
        sub_1000049D8(a1 + 104, __p);
        sub_100115964((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100004CB0(__p, "");
        sub_100004B48(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_100115924( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100115950(uint64_t a1)
{
  uint64_t v1 = (void *)sub_100115760(a1);
  operator delete(v1);
}

int *sub_100115964(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000B85DC();
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
    uint64_t v13 = (os_log_s *)sub_1000B85DC();
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
  *uint64_t result = v5;
  return result;
}

uint64_t sub_100115B48(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100189508);
  sub_100115D0C(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_100115B80(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100189508);
  sub_100115D0C(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_100115BC0(char *a1)
{
}

uint64_t sub_100115C04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_100115C38(_BYTE *a1, int a2)
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

void sub_100115C84(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100189508);
  sub_100115D0C((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_100115CC4(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100189508);
  sub_100115D0C((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_100115D0C(uint64_t a1)
{
  *(void *)a1 = off_1001895D8;
  sub_100115DA8(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_100115DA8(uint64_t a1)
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
        sub_1000049D8(a1 + 104, __p);
        sub_100115F10((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100004CB0(__p, "");
        sub_100004B48(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_100115ED0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100115EFC(uint64_t a1)
{
  uint64_t v1 = (void *)sub_100115D0C(a1);
  operator delete(v1);
}

int *sub_100115F10(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000B85DC();
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
    uint64_t v13 = (os_log_s *)sub_1000B85DC();
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
  *uint64_t result = v5;
  return result;
}

uint64_t sub_1001160F4(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100189728);
  sub_1001162B8(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_10011612C(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100189728);
  sub_1001162B8(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10011616C(char *a1)
{
}

uint64_t sub_1001161B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_1001161E4(_BYTE *a1, int a2)
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

void sub_100116230(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100189728);
  sub_1001162B8((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_100116270(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100189728);
  sub_1001162B8((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_1001162B8(uint64_t a1)
{
  *(void *)a1 = off_1001897F8;
  sub_100116354(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_100116354(uint64_t a1)
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
        sub_1000049D8(a1 + 104, __p);
        sub_1001164BC((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100004CB0(__p, "");
        sub_100004B48(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10011647C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1001164A8(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1001162B8(a1);
  operator delete(v1);
}

int *sub_1001164BC(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000B85DC();
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
    uint64_t v13 = (os_log_s *)sub_1000B85DC();
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
  *uint64_t result = v5;
  return result;
}

uint64_t sub_1001166A0(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100189198;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000B866C();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100004D60(a1 + 96);
  return a1;
}

void sub_100116708(_Unwind_Exception *a1)
{
}

uint64_t sub_10011671C(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_1001893B8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000B866C();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100004D60(a1 + 96);
  return a1;
}

void sub_100116784(_Unwind_Exception *a1)
{
}

uint64_t sub_100116798(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_1001895D8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000B866C();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100004D60(a1 + 96);
  return a1;
}

void sub_100116800(_Unwind_Exception *a1)
{
}

uint64_t sub_100116814(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_1001897F8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000B866C();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100004D60(a1 + 96);
  return a1;
}

void sub_10011687C(_Unwind_Exception *a1)
{
}

char *sub_100116890(unint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)&qword_100199018);
  if ((v1 & 1) == 0)
  {
    unint64_t v6 = a1;
    int v5 = __cxa_guard_acquire(&qword_100199018);
    a1 = v6;
    if (v5)
    {
      __cxa_atexit((void (*)(void *))sub_100116BC4, 0LL, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_100199018);
      a1 = v6;
    }
  }

  unint64_t v2 = 0x9DDFEA08EB382D69LL * (((8 * a1) + 8LL) ^ HIDWORD(a1));
  unint64_t v3 = 0x9DDFEA08EB382D69LL * (HIDWORD(a1) ^ (v2 >> 47) ^ v2);
  return (char *)&unk_100198828
       + 64 * (unint64_t)((9 * ((v3 >> 47) ^ v3)) & 0xF);
}

char *sub_100116950(unint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)&qword_100199020);
  if ((v1 & 1) == 0)
  {
    unint64_t v6 = a1;
    int v5 = __cxa_guard_acquire(&qword_100199020);
    a1 = v6;
    if (v5)
    {
      __cxa_atexit((void (*)(void *))sub_100116BFC, 0LL, (void *)&_mh_execute_header);
      __cxa_guard_release(&qword_100199020);
      a1 = v6;
    }
  }

  unint64_t v2 = 0x9DDFEA08EB382D69LL * (((8 * a1) + 8LL) ^ HIDWORD(a1));
  unint64_t v3 = 0x9DDFEA08EB382D69LL * (HIDWORD(a1) ^ (v2 >> 47) ^ v2);
  return (char *)&unk_100198C28 + 48 * ((9 * ((v3 >> 47) ^ v3)) & 0xF);
}

uint64_t sub_100116A14(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  *(void *)uint64_t result = off_100189878;
  *(void *)(result + 8) = v2;
  *(_BYTE *)(result + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a2 + 16) = 0;
  return result;
}

uint64_t sub_100116A34(uint64_t a1)
{
  *(void *)a1 = off_100189878;
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
      sub_100116B74((unint64_t)v2);
    }
  }

  return a1;
}

void sub_100116A8C(uint64_t a1)
{
  unsigned __int8 v1 = (void *)sub_100116A34(a1);
  operator delete(v1);
}

unint64_t *sub_100116AA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
      sub_100116B74((unint64_t)result);
    }
    *(_BYTE *)(a1 + 16) = 0;
    return (unint64_t *)sub_1000C6848(*(void *)(a1 + 8), a2, a3);
  }

  else
  {
    *(_BYTE *)(a3 + 16) = 0;
    *(void *)a3 = off_100189898;
    *(void *)(a3 + 8) = result;
    *(void *)(a3 + 24) = a2;
  }

  return result;
}

uint64_t sub_100116B24(uint64_t a1)
{
  *(void *)a1 = off_100189898;
  if (*(_BYTE *)(a1 + 16))
  {
    atomic_store(*(void *)(a1 + 24), *(unint64_t **)(a1 + 8));
    sub_100116B74(*(void *)(a1 + 8));
  }

  *(_BYTE *)(a1 + 16) = 0;
  return sub_100116A34(a1);
}

void sub_100116B74(unint64_t a1)
{
  uint64_t v2 = sub_100116890(a1);
  std::mutex::lock((std::mutex *)v2);
  unint64_t v3 = sub_100116950(a1);
  std::condition_variable::notify_all((std::condition_variable *)v3);
  std::mutex::unlock((std::mutex *)v2);
}

void sub_100116BB0(uint64_t a1)
{
  unsigned __int8 v1 = (void *)sub_100116B24(a1);
  operator delete(v1);
}

void sub_100116BC4()
{
}

void sub_100116BFC()
{
}

void *sub_100116C34(void *a1, uint64_t a2)
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
    int v5 = sub_100004E4C(a1, (uint64_t)"bad flush type (", 16LL);
    a1 = (void *)std::ostream::operator<<(v5, a2);
    unint64_t v3 = ")";
    uint64_t v4 = 1LL;
  }

  else
  {
    unint64_t v3 = "barrier";
    uint64_t v4 = 7LL;
  }

  return sub_100004E4C(a1, (uint64_t)v3, v4);
}

void *sub_100116CB8(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1 + *(void *)(*a1 - 24LL);
  int v5 = *((_DWORD *)v4 + 2);
  *((_DWORD *)v4 + 2) = v5 & 0xFFFFFFB5 | 8;
  char v23 = 48;
  int v6 = sub_1000166BC(a1, &v23);
  uint64_t v7 = *v6;
  *(uint64_t *)((char *)v6 + *(void *)(*v6 - 24) + 24) = 2LL;
  *(_DWORD *)((char *)v6 + *(void *)(v7 - 24) + 8) |= 0x200u;
  unint64_t v8 = sub_100004E4C(v6, (uint64_t)"sg: buffer = ", 13LL);
  unint64_t v9 = (void *)std::ostream::operator<<(v8, *a2);
  unint64_t v10 = sub_100004E4C(v9, (uint64_t)" [", 2LL);
  __int128 v11 = (void *)std::ostream::operator<<(v10, a2);
  int v12 = sub_100004E4C(v11, (uint64_t)"] ", 2LL);
  uint64_t v13 = *v12;
  *(_DWORD *)((char *)v12 + *(void *)(*v12 - 24) + 8) = *(_DWORD *)((_BYTE *)v12 + *(void *)(*v12 - 24) + 8) & 0xFFFFFFB5 | 2;
  *(uint64_t *)((char *)v12 + *(void *)(v13 - 24) + 24) = 0LL;
  *(_DWORD *)((char *)v12 + *(void *)(v13 - 24) + 8) &= ~0x200u;
  os_log_type_t v14 = sub_100004E4C(v12, (uint64_t)" size = ", 8LL);
  uint64_t v15 = (void *)std::ostream::operator<<(v14, a2[2]);
  uint64_t v16 = sub_100004E4C(v15, (uint64_t)" buffer_size = ", 15LL);
  unsigned int v17 = (void *)std::ostream::operator<<(v16, a2[4]);
  *(_DWORD *)((char *)v17 + *(void *)(*v17 - 24LL) + 8) = *(_DWORD *)((_BYTE *)v17 + *(void *)(*v17 - 24LL) + 8) & 0xFFFFFFB5 | 8;
  char v22 = 48;
  uint64_t v18 = sub_1000166BC(v17, &v22);
  uint64_t v19 = *v18;
  *(uint64_t *)((char *)v18 + *(void *)(*v18 - 24) + 24) = 2LL;
  *(_DWORD *)((char *)v18 + *(void *)(v19 - 24) + 8) |= 0x200u;
  int v20 = sub_100004E4C(v18, (uint64_t)" offset = ", 10LL);
  std::ostream::operator<<(v20, a2[3]);
  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 8) = v5;
  return a1;
}

void *sub_100116E6C(void *result)
{
  result[1] = 0LL;
  result[2] = 0LL;
  *uint64_t result = off_1001898F0;
  return result;
}

uint64_t sub_100116E80(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 152LL))(a2, a1);
}

void sub_100116E98(uint64_t a1@<X0>, void *a2@<X8>)
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

    sub_100116E98(v20);
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

void sub_100116FC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

uint64_t sub_100116FE4(uint64_t a1, const void **a2, uint64_t *a3)
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
      uint64_t v18 = (unint64_t *)(v16 + 8);
      do
        unint64_t v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }

    uint64_t v15 = (std::__shared_weak_count *)*((void *)v7 + 4);
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

      uint64_t v15 = 0LL;
    }
  }

  else
  {
    uint64_t v15 = (std::__shared_weak_count *)sub_100116FE4(&v28, a2, a3);
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

void sub_100117184(_Unwind_Exception *exception_object)
{
  if (v2) {
    sub_10011BD8C(v2);
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

void sub_1001171D0(uint64_t a1@<X0>, void *a2@<X8>)
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
      uint64_t v15 = (unint64_t *)(v14 + 8);
      do
        unint64_t v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
  }

uint64_t sub_1001172BC(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, char a5)
{
  unint64_t v12 = a4;
  uint64_t v13 = a3;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)a1 = off_10016A598;
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

  *(void *)a1 = off_1001899B0;
  *(void *)(a1 + 40) = a3;
  unsigned int v11 = 0;
  sub_1001186F8(&v13, &v11, &v12, (void *)(a1 + 48));
  *(_OWORD *)(a1 + 89) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_BYTE *)(a1 + 112) = a5;
  return a1;
}

void sub_100117360(_Unwind_Exception *a1)
{
}

uint64_t sub_100117378(uint64_t a1, uint64_t a2)
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
    sub_100014DF0(a1 + 64, &v18);
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
    sub_10003B8F8(&v18, &v16);
    sub_100004E4C(&v20, (uint64_t)"BackendSG: error allocating buffer", 34LL);
    std::ostream::~ostream(&v20, off_10016B468);
    sub_10003BA5C((uint64_t)&v18);
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

void sub_100117514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

uint64_t sub_10011753C(uint64_t a1, uint64_t a2)
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
    sub_100014DF0(a1 + 64, &v18);
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
    sub_10011771C(&v18, &v16);
    sub_100004E4C(&v20, (uint64_t)"BackendSG: error allocating buffer", 34LL);
    std::ostream::~ostream(&v20, off_100189C40);
    sub_1001182A0((uint64_t)&v18);
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

void sub_1001176F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *sub_10011771C(void *a1, __int128 *a2)
{
  unint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_1001187F8((uint64_t)a1, a2);
  *a1 = off_100189B78;
  a1[45] = &off_100189C78;
  a1[46] = &off_100189CA0;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_100189B78;
  a1[45] = off_100189C00;
  a1[46] = off_100189C28;
  return a1;
}

void sub_1001177A0(_Unwind_Exception *a1)
{
}

uint64_t sub_1001177C4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100117804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 56LL))(*(void *)(a1 + 24));
  if ((_DWORD)v4)
  {
    *(void *)&__int128 v13 = "int BackendSG::truncate(uint64_t)";
    *((void *)&v13 + 1) = 23LL;
    int v14 = 16;
    sub_100060AF4(&v15, &v13);
    sub_100004E4C(&v17, (uint64_t)"BackendSG: truncating the inner backend failed, error = ", 56LL);
    std::ostream::operator<<(&v17, v4);
    std::ostream::~ostream(&v17, off_1001707B8);
    sub_100065CC4((uint64_t)&v15);
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
    sub_100014DF0(a1 + 64, &v15);
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

void sub_10011794C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

__n128 sub_100117960(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)a1 = off_10016A598;
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

  *(void *)a1 = off_1001899B0;
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + sub_1000114F0(v4 - 48) = v6;
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
  *(void *)(a1 + sub_1000114F0(v4 - 64) = *(void *)(a2 + 64);
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

double sub_100117A00@<D0>(uint64_t a1@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  double result = v5[0];
  *a3 = *(_OWORD *)v5;
  return result;
}

uint64_t sub_100117A40(uint64_t a1, void *a2, size_t a3)
{
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)a1 = off_10016A598;
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

  *(void *)a1 = off_100189A78;
  *(void *)(a1 + 40) = 850045863LL;
  *(_OWORD *)(a1 + sub_1000114F0(v4 - 48) = 0u;
  *(_OWORD *)(a1 + sub_1000114F0(v4 - 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(void *)(a1 + 96) = 0LL;
  sub_1001118B4((void *)(a1 + 104), a3);
  *(_BYTE *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 136) = 0;
  return a1;
}

void sub_100117AD8(_Unwind_Exception *a1)
{
}

uint64_t sub_100117AF8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 104);
  unint64_t v5 = a2 % (*(void *)(a1 + 112) - v4);
  if (!v5) {
    goto LABEL_11;
  }
  unint64_t v6 = (std::__shared_weak_count *)*((void *)sub_100118DDC() + 1);
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
    *(void *)(a1 + 128) = a2;
    *(_BYTE *)(a1 + 136) = 1;
  }

  return v9;
}

void sub_100117BE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unint64_t sub_100117BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (std::mutex *)(a1 + 40);
  std::mutex::lock((std::mutex *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 136))
  {
    unint64_t v15 = sub_100117AF8(a1, *(void *)(a2 + 24));
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
      unint64_t v12 = (std::__shared_weak_count *)*((void *)sub_100118DDC() + 1);
      size_t v30 = v11;
      v31 = v12;
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
  v31 = v23;
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

void sub_100117E44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100117E70(uint64_t a1, uint64_t a2)
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
    size_t v11 = (std::__shared_weak_count *)*((void *)sub_100118DDC() + 1);
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

void sub_100117FB8(_Unwind_Exception *a1)
{
}

void sub_100117FE4(uint64_t a1)
{
  uint64_t v1 = (void *)sub_100118688(a1);
  operator delete(v1);
}

void *sub_100117FF8(uint64_t a1, void *a2)
{
  return sub_100004E4C(a2, (uint64_t)"BufferedWriteBackend", 20LL);
}

void *sub_10011800C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_100019244(a2, (void *)(a1 + 8));
}

void *sub_100118018(void *a1)
{
  *a1 = off_1001899B0;
  sub_1000114F0((uint64_t)(a1 + 8));
  sub_1000114F0((uint64_t)(a1 + 6));
  *a1 = off_10016A598;
  sub_1000114F0((uint64_t)(a1 + 3));
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void sub_100118070(void *a1)
{
  *a1 = off_1001899B0;
  sub_1000114F0((uint64_t)(a1 + 8));
  sub_1000114F0((uint64_t)(a1 + 6));
  *a1 = off_10016A598;
  sub_1000114F0((uint64_t)(a1 + 3));
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  operator delete(a1);
}

void *sub_1001180C8(uint64_t a1, void *a2)
{
  return sub_100004E4C(a2, (uint64_t)"BackendSG", 9LL);
}

uint64_t sub_1001180DC(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_100189C40);
  sub_1001182A0(v2);
  return std::ios::~ios(a1 + 8);
}

uint64_t sub_100118114(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100189C40);
  sub_1001182A0(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_100118154(char *a1)
{
}

uint64_t sub_100118198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_1001181CC(_BYTE *a1, int a2)
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

void sub_100118218(uint64_t a1)
{
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_100189C40);
  sub_1001182A0((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

void sub_100118258(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_100189C40);
  sub_1001182A0((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

uint64_t sub_1001182A0(uint64_t a1)
{
  *(void *)a1 = off_100189D10;
  sub_10011833C(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

uint64_t sub_10011833C(uint64_t a1)
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
        sub_1000049D8(a1 + 104, __p);
        sub_1001184A4((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100004CB0(__p, "");
        sub_100004B48(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_100118464( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100118490(uint64_t a1)
{
  uint64_t v1 = (void *)sub_1001182A0(a1);
  operator delete(v1);
}

int *sub_1001184A4(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000B85DC();
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
    unint64_t v13 = (os_log_s *)sub_1000B85DC();
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
  *double result = v5;
  return result;
}

uint64_t sub_100118688(uint64_t a1)
{
  *(void *)a1 = off_100189A78;
  sub_100117E70(a1, 1LL);
  uint64_t v2 = *(void **)(a1 + 104);
  if (v2)
  {
    *(void *)(a1 + 112) = v2;
    operator delete(v2);
  }

  std::mutex::~mutex((std::mutex *)(a1 + 40));
  *(void *)a1 = off_10016A598;
  sub_1000114F0(a1 + 24);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  return a1;
}

void *sub_1001186F8@<X0>( uint64_t *a1@<X1>, unsigned int *a2@<X2>, unint64_t *a3@<X3>, void *a4@<X8>)
{
  uint64_t v8 = operator new(0xB8uLL);
  double result = sub_100118768(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_100118754(_Unwind_Exception *a1)
{
}

void *sub_100118768(void *a1, uint64_t *a2, unsigned int *a3, unint64_t *a4)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_100189D90;
  sub_1000F7D8C((uint64_t)(a1 + 3), *a2, *a3, *a4);
  return a1;
}

void sub_1001187A8(_Unwind_Exception *a1)
{
}

void sub_1001187BC(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100189D90;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1001187CC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100189D90;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_1001187EC(uint64_t a1)
{
  return sub_1000F7E34(a1 + 24);
}

uint64_t sub_1001187F8(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_100189D10;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000B866C();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + sub_1000114F0(v4 - 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100004D60(a1 + 96);
  return a1;
}

void sub_100118860(_Unwind_Exception *a1)
{
}

void sub_100118874(uint64_t a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  char v6 = operator new(0x90uLL);
  v6[1] = 0LL;
  v6[2] = 0LL;
  *char v6 = off_100178338;
  sub_100117960((uint64_t)(v6 + 3), a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  sub_100018774((uint64_t)a3, v6 + 4, (uint64_t)(v6 + 3));
}

void sub_1001188E8(char *__s@<X0>, size_t *a2@<X1>, void *a3@<X8>)
{
  __int128 v5 = &v23;
  sub_100004CB0(&v23, __s);
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
  sub_100118C1C((uint64_t)&v23, (unint64_t *)&v20);
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

void sub_100118A70( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  switch(a2)
  {
    case 3:
      __cxa_begin_catch(exception_object);
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = &off_100189E78;
      int v20 = std::generic_category();
      exception[1] = 22LL;
      exception[2] = v20;
      *((_BYTE *)exception + 24) = 0;
      *((_BYTE *)exception + sub_1000114F0(v4 - 48) = 0;
      exception[7] = "Does not contain an even number of hex digits.";
    case 2:
      __cxa_begin_catch(exception_object);
      __int16 v21 = __cxa_allocate_exception(0x40uLL);
      *__int16 v21 = &off_100189E78;
      uint64_t v22 = std::generic_category();
      v21[1] = 22LL;
      v21[2] = v22;
      *((_BYTE *)v21 + 24) = 0;
      *((_BYTE *)v21 + sub_1000114F0(v4 - 48) = 0;
      v21[7] = "Contains non-hexadecimal characters.";
    case 1:
      __cxa_begin_catch(exception_object);
      std::string v23 = __cxa_allocate_exception(0x40uLL);
      *std::string v23 = &off_100189E78;
      uint64_t v24 = std::generic_category();
      v23[1] = 22LL;
      v23[2] = v24;
      *((_BYTE *)v23 + 24) = 0;
      *((_BYTE *)v23 + sub_1000114F0(v4 - 48) = 0;
      v23[7] = "Decoding error.";
  }

  _Unwind_Resume(exception_object);
}

unint64_t *sub_100118C1C(uint64_t a1, unint64_t *a2)
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
      a2 = sub_100119CFC(&v9, v7, a2, (unsigned int (*)(uint64_t, uint64_t))sub_100119E20);
    while (v9 != v7);
  }

  return a2;
}

uint64_t sub_100118C90(char *a1, uint64_t a2)
{
  v3[0] = 0LL;
  v3[1] = 0LL;
  return sub_100080CB0((uint64_t)v3, a1, a2);
}

void *sub_100118CE8(void *a1, unsigned int *a2)
{
  BOOL v4 = (const char *)(*(uint64_t (**)(unsigned int *))(*(void *)a2 + 16LL))(a2);
  size_t v5 = strlen(v4);
  uint64_t v6 = sub_100004E4C(a1, (uint64_t)v4, v5);
  uint64_t v7 = sub_100004E4C(v6, (uint64_t)" (error code ", 13LL);
  std::string::size_type v8 = (void *)std::ostream::operator<<(v7, a2[2]);
  sub_100004E4C(v8, (uint64_t)")", 1LL);
  return a1;
}

uint64_t sub_100118D64(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 48))
  {
    uint64_t result = a1 + 56;
    return *(void *)result;
  }

  uint64_t result = a1 + 24;
  return result;
}

uint64_t sub_100118D8C()
{
  return *(void *)out;
}

void *sub_100118DDC()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_100199040);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_100199040))
  {
    __cxa_atexit((void (*)(void *))sub_100118E84, &unk_100199030, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_100199040);
  }

  unint64_t v1 = atomic_load(&qword_100199028);
  if (v1 != -1LL)
  {
    size_t v5 = &v3;
    BOOL v4 = &v5;
    std::__call_once(&qword_100199028, &v4, (void (__cdecl *)(void *))sub_10011B208);
  }

  return &unk_100199030;
}

uint64_t sub_100118E88()
{
  if (byte_100198568)
  {
    while (!__ldaxr((unsigned __int8 *)&unk_100199050))
    {
      if (!__stlxr(1u, (unsigned __int8 *)&unk_100199050))
      {
        *(void *)&__int128 v2 = "void process_terminator::terminate()";
        *((void *)&v2 + 1) = 34LL;
        int v3 = 16;
        sub_1000CEBA4(v4, &v2);
        sub_100004E4C(&v5, (uint64_t)"Terminating due to unrecoverable I/O error", 42LL);
        std::ostream::~ostream(&v5, off_10017EF20);
        sub_1000CED08((uint64_t)v4);
        std::ios::~ios(&v6);
        return raise(15);
      }
    }

    __clrex();
  }

  return result;
}

void sub_100118F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

unint64_t sub_100118F5C(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
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
  sub_10002C354((uint64_t)&v188, v8 + v9);
  sub_10002B060(&v192);
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
  sub_10002D4A4((uint64_t)&v157, a2, a4[1], v18, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)&v170);
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

  sub_10002B7D4((uint64_t)&v170, (uint64_t)&v219);
  sub_100035F24((uint64_t)&v188, (uint64_t)&v219);
  char v35 = v221;
  if (v221)
  {
    v36 = (unint64_t *)&v221->__shared_owners_;
    do
      unint64_t v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }

  v38 = v220;
  if (v220)
  {
    v39 = (unint64_t *)&v220->__shared_owners_;
    do
      unint64_t v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }

  sub_10002C354((uint64_t)&v188, v9);
  sub_10002B3A4((uint64_t)&v170, (uint64_t)v154);
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
    v43 = (unint64_t *)&v197->__shared_owners_;
    do
      unint64_t v44 = __ldxr(v43);
    while (__stxr(v44 + 1, v43));
  }

  __int128 v151 = v198;
  uint64_t v152 = v199;
  char v153 = v200;
  v46 = *(void **)a1;
  v45 = *(std::__shared_weak_count **)(a1 + 8);
  v130 = *(void **)a1;
  v131 = v45;
  if (v45)
  {
    v47 = (unint64_t *)&v45->__shared_owners_;
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
    v52 = (unint64_t *)&v51->__shared_owners_;
    do
      unint64_t v53 = __ldxr(v52);
    while (__stxr(v53 + 1, v52));
  }

  __int128 v140 = *v25;
  uint64_t v141 = *v6;
  char v142 = *((_BYTE *)v6 + 8);
  __dst = v46;
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
  while (!sub_10002B1FC((uint64_t)&__src, (uint64_t)v154))
  {
    sub_100016640((uint64_t)v147);
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
          sub_10002C354((uint64_t)&__src, v64);
          sub_10002C52C((uint64_t)&__dst, v64);
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
        sub_10011B34C(&v219, &v217);
        sub_100004E4C(&v222, (uint64_t)"Trimming: Written ", 18LL);
        std::ostream::operator<<(&v222, v62);
        sub_100004E4C(&v222, (uint64_t)", dest buffer_size ", 19LL);
        std::ostream::operator<<(&v222, *(void *)&v206[16]);
        sub_100004E4C(&v222, (uint64_t)" src size ", 10LL);
        std::ostream::operator<<(&v222, *(void *)&v145[0]);
        sub_100004E4C(&v222, (uint64_t)", trimmed size", 14LL);
        std::ostream::operator<<(&v222, 0LL);
        std::ostream::~ostream(&v222, off_10018A2C0);
        sub_10011B4B0((uint64_t)&v219);
        std::ios::~ios(v223);
      }

      *(void *)&__int128 v217 = "transform(Fn &&, sg_vec_ref::iterator, const sg_vec_ref::iterator &, sg_vec_ref::iterator) [Fn = (lambda at /Library/Caches/com.apple.xbs/Sources/DiskImages2/app/utils.cpp:180:13)]";
      *((void *)&v217 + 1) = 97LL;
      int v218 = 16;
      sub_100036C3C(&v219, &v217);
      sub_100004E4C(&v222, (uint64_t)"IO error with sg: ", 18LL);
      sub_100116CB8(&v222, &__src);
      sub_100004E4C(&v222, (uint64_t)" dest ", 6LL);
      sub_100116CB8(&v222, &__dst);
      sub_100004E4C(&v222, (uint64_t)" returned status ", 17LL);
      std::ostream::operator<<(&v222, v64);
      std::ostream::~ostream(&v222, off_10016A110);
      sub_100036DA0((uint64_t)&v219);
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
      sub_10002C704((uint64_t)&__src);
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

  sub_10002C52C((uint64_t)&v130, v58);
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
  sub_10002C354((uint64_t)&v170, v129);
  sub_10002B060(&v174);
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

void sub_100119BEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_100119CE8(std::exception *a1)
{
}

unint64_t *sub_100119CFC( uint64_t *a1, uint64_t a2, unint64_t *a3, unsigned int (*a4)(uint64_t, uint64_t))
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
      v13[0] = off_100189EE0;
      v13[1] = off_100189F10;
      sub_100119E2C(v13);
    }

    int v11 = sub_100119EB8(*(char *)*a1);
    char v9 = 0;
    int v7 = v11 + 16 * v7;
    char v16 = v7;
    uint64_t v8 = *a1 + 1;
    *a1 = v8;
  }

  while ((v10 & 1) != 0);
  sub_100119FB4(&v17, &v16);
  return v17;
}

void sub_100119DE4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::exception a13, _UNKNOWN **a14, uint64_t a15)
{
  a14 = &off_100189F30;
  if (a15) {
    (*(void (**)(uint64_t))(*(void *)a15 + 32LL))(a15);
  }
  _Unwind_Resume(a1);
}

BOOL sub_100119E20(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_100119E2C(void *a1)
{
  exception = __cxa_allocate_exception(0x30uLL);
  sub_10011A0B8((uint64_t)exception, a1);
}

void sub_100119E68(_Unwind_Exception *a1)
{
}

std::exception *sub_100119E7C(std::exception *a1)
{
  *(void *)(v2 + 8) = &off_100189F30;
  sub_10011A1E0((uint64_t *)(v2 + 16));
  return a1;
}

uint64_t sub_100119EB8(int a1)
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
        DWORD2(v8) = -1;
        v6[0] = off_100189F78;
        v6[1] = off_100189FA8;
        BOOL v4 = off_100189FF0;
        char v5 = a1;
        int v3 = sub_10011A3D8(v6, (uint64_t)&v4);
        sub_10011A220(v3);
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

void sub_100119F74( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::exception a15, _UNKNOWN **a16, uint64_t a17)
{
  a16 = &off_100189F30;
  if (a17) {
    (*(void (**)(uint64_t))(*(void *)a17 + 32LL))(a17);
  }
  _Unwind_Resume(a1);
}

unint64_t **sub_100119FB4(unint64_t **a1, _BYTE *a2)
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

uint64_t sub_10011A0B8(uint64_t a1, void *a2)
{
  int v3 = (char *)a2 + *(void *)(*a2 - 40LL);
  uint64_t v4 = *((void *)v3 + 1);
  *(void *)(a1 + 8) = &off_100189F30;
  *(void *)(a1 + 16) = v4;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 24LL))(v4);
  }
  __int128 v5 = *((_OWORD *)v3 + 1);
  *(_DWORD *)(a1 + 40) = *((_DWORD *)v3 + 8);
  *(_OWORD *)(a1 + 24) = v5;
  *(void *)a1 = off_100189EE0;
  *(void *)(a1 + 8) = off_100189F10;
  return a1;
}

void sub_10011A128(std::exception *a1)
{
  *(void *)(v2 + 8) = &off_100189F30;
  sub_10011A1E0((uint64_t *)(v2 + 16));
  operator delete(a1);
}

uint64_t *sub_10011A164(void *a1)
{
  *(void *)(v1 + 8) = &off_100189F30;
  return sub_10011A1E0((uint64_t *)(v1 + 16));
}

void sub_10011A198(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::exception::~exception((std::exception *)v1);
  *((void *)v1 + 1) = &off_100189F30;
  sub_10011A1E0((uint64_t *)v1 + 2);
  operator delete(v1);
}

uint64_t *sub_10011A1E0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  return a1;
}

void sub_10011A220(void *a1)
{
  exception = __cxa_allocate_exception(0x30uLL);
  sub_10011A2B0((uint64_t)exception, a1);
}

void sub_10011A25C(_Unwind_Exception *a1)
{
}

std::exception *sub_10011A274(std::exception *a1)
{
  *(void *)(v2 + 8) = &off_100189F30;
  sub_10011A1E0((uint64_t *)(v2 + 16));
  return a1;
}

uint64_t sub_10011A2B0(uint64_t a1, void *a2)
{
  int v3 = (char *)a2 + *(void *)(*a2 - 40LL);
  uint64_t v4 = *((void *)v3 + 1);
  *(void *)(a1 + 8) = &off_100189F30;
  *(void *)(a1 + 16) = v4;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 24LL))(v4);
  }
  __int128 v5 = *((_OWORD *)v3 + 1);
  *(_DWORD *)(a1 + 40) = *((_DWORD *)v3 + 8);
  *(_OWORD *)(a1 + 24) = v5;
  *(void *)a1 = off_100189F78;
  *(void *)(a1 + 8) = off_100189FA8;
  return a1;
}

void sub_10011A320(std::exception *a1)
{
  *(void *)(v2 + 8) = &off_100189F30;
  sub_10011A1E0((uint64_t *)(v2 + 16));
  operator delete(a1);
}

uint64_t *sub_10011A35C(void *a1)
{
  *(void *)(v1 + 8) = &off_100189F30;
  return sub_10011A1E0((uint64_t *)(v1 + 16));
}

void sub_10011A390(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::exception::~exception((std::exception *)v1);
  *((void *)v1 + 1) = &off_100189F30;
  sub_10011A1E0((uint64_t *)v1 + 2);
  operator delete(v1);
}

void *sub_10011A3D8(void *a1, uint64_t a2)
{
  uint64_t v4 = operator new(0x10uLL);
  *(void *)uint64_t v4 = off_100189FF0;
  v4[8] = *(_BYTE *)(a2 + 8);
  int v20 = v4;
  __int128 v5 = (std::__shared_weak_count *)operator new(0x20uLL);
  v5->__shared_owners_ = 0LL;
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&off_10018A020;
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
    *unint64_t v8 = off_10018A098;
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

void sub_10011A548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
}

_BYTE *sub_10011A580(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  *(void *)uint64_t result = off_100189FF0;
  result[8] = *(_BYTE *)(a1 + 8);
  return result;
}

void sub_10011A5BC(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  if (__p[0]) {
    uint64_t v4 = (char *)__p[0];
  }
  else {
    uint64_t v4 = (char *)((unint64_t)"PN5boost9algorithm9bad_char_E" & 0x7FFFFFFFFFFFFFFFLL);
  }
  sub_100004CB0(&v14, v4);
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
  sub_10011A808((char *)(a1 + 8), __p);
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

void sub_10011A730( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26, uint64_t a27, void *a28, uint64_t a29, int a30, __int16 a31, char a32, char a33)
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

char **sub_10011A7BC(char **a1, char *lpmangled)
{
  int status = 0;
  size_t v4 = 0LL;
  *a1 = __cxa_demangle(lpmangled, 0LL, &v4, &status);
  return a1;
}

uint64_t sub_10011A808@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  char v9 = *a1;
  sub_100004E4C(&v5, (uint64_t)&v9, 1LL);
  sub_1000049D8((uint64_t)v6, a2);
  if (v7 < 0) {
    operator delete((void *)v6[8]);
  }
  std::streambuf::~streambuf(v6);
  return std::ios::~ios(&v8);
}

void sub_10011A8CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10011A8E4(std::__shared_weak_count *a1)
{
}

uint64_t sub_10011A8F8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 24LL))(result);
  }
  return result;
}

uint64_t sub_10011A910(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }

  else
  {
    return 0LL;
  }

uint64_t sub_10011A950(uint64_t a1, const char *a2)
{
  if (a2)
  {
    sub_100004D60((uint64_t)&v16);
    size_t v4 = strlen(a2);
    sub_100004E4C(&v16, (uint64_t)a2, v4);
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
        sub_100004E4C(&v16, (uint64_t)v6, v7);
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

    sub_1000049D8((uint64_t)v17, __p);
    uint64_t v11 = v15;
    __int128 v12 = *(_OWORD *)__p;
    *(_OWORD *)__p = *(_OWORD *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 48);
    *(_OWORD *)(a1 + 32) = v12;
    *(void *)(a1 + sub_1000114F0(v4 - 48) = v11;
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

void sub_10011AAF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
}

void *sub_10011AB24@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t result = sub_10011ADFC(a1 + 8, a2);
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

void *sub_10011AB80(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v7 = a3;
  uint64_t v5 = sub_10011AEE0((uint64_t **)(a1 + 8), a3, (uint64_t)&unk_100139230, &v7);
  uint64_t result = sub_100026A1C(v5 + 5, a2);
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

uint64_t sub_10011ABF8(uint64_t result)
{
  return result;
}

BOOL sub_10011AC08(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56) - 1;
  *(_DWORD *)(a1 + ++*(_DWORD *)(result + 56) = v1;
  if (a1 && !v1)
  {
    uint64_t v2 = (void *)sub_10011B044(a1);
    operator delete(v2);
  }

  return v1 == 0;
}

void sub_10011AC44(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0LL;
  size_t v4 = (char *)operator new(0x40uLL);
  *(void *)size_t v4 = off_10018A098;
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
      sub_10011B080(&v21, v7);
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

      sub_10011B154(v5, v19, (uint64_t)v19);
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

void sub_10011ADCC(_Unwind_Exception *a1)
{
}

void *sub_10011ADFC(uint64_t a1, uint64_t *a2)
{
  int v3 = (void *)(a1 + 8);
  size_t v4 = sub_10011AE6C(a1, a2, *(void **)(a1 + 8), (void *)(a1 + 8));
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

void *sub_10011AE6C(uint64_t a1, uint64_t *a2, void *a3, void *a4)
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

uint64_t *sub_10011AEE0(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v6 = (uint64_t **)sub_10011AF90((uint64_t)a1, &v12, a2);
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
    sub_100027200(a1, v12, v8, v7);
    v10[0] = 0LL;
    sub_10004D080((uint64_t)v10, 0LL);
  }

  return v7;
}

void *sub_10011AF90(uint64_t a1, void *a2, uint64_t *a3)
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

uint64_t sub_10011B044(uint64_t a1)
{
  return a1;
}

void *sub_10011B080(void *a1, uint64_t a2)
{
  *a1 = a2;
  size_t v4 = operator new(0x20uLL);
  *size_t v4 = &off_10018A100;
  v4[1] = 0LL;
  v4[2] = 0LL;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_10011B0C4(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_10011B0E8(std::__shared_weak_count *a1)
{
}

uint64_t sub_10011B0FC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 24LL))(result);
  }
  return result;
}

uint64_t sub_10011B114(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }

  else
  {
    return 0LL;
  }

char *sub_10011B154(uint64_t **a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = (void **)sub_10011AF90((uint64_t)a1, &v11, a2);
  uint64_t v6 = (char *)*v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    uint64_t v6 = (char *)operator new(0x38uLL);
    v9[1] = a1 + 1;
    *((void *)v6 + 4) = *(void *)a3;
    *(_OWORD *)(v6 + 40) = *(_OWORD *)(a3 + 8);
    *(void *)(a3 + 8) = 0LL;
    *(void *)(a3 + 16) = 0LL;
    char v10 = 1;
    sub_100027200(a1, v11, v7, (uint64_t *)v6);
    v9[0] = 0LL;
    sub_10004D080((uint64_t)v9, 0LL);
  }

  return v6;
}

void sub_10011B208()
{
  unsigned __int8 v0 = operator new(1uLL);
  sub_10011B284(&v4, (uint64_t)v0);
  sub_100014DF0((uint64_t)&unk_100199030, &v4);
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

void *sub_10011B284(void *a1, uint64_t a2)
{
  *a1 = a2;
  __int128 v4 = operator new(0x20uLL);
  *__int128 v4 = &off_10018A178;
  v4[1] = 0LL;
  v4[2] = 0LL;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_10011B2CC(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_10011B2E8(std::__shared_weak_count *a1)
{
}

void sub_10011B2FC(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1) {
    operator delete(v1);
  }
}

uint64_t sub_10011B30C(uint64_t a1, uint64_t a2)
{
  else {
    return 0LL;
  }
}

void *sub_10011B34C(void *a1, __int128 *a2)
{
  unint64_t v3 = (std::ios_base *)(a1 + 46);
  sub_10011B434((uint64_t)a1, a2);
  *a1 = off_10018A1F8;
  a1[45] = &off_10018A2F8;
  a1[46] = &off_10018A320;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_10018A1F8;
  a1[45] = off_10018A280;
  a1[46] = off_10018A2A8;
  return a1;
}

void sub_10011B3D0(_Unwind_Exception *a1)
{
}

uint64_t sub_10011B3F4(uint64_t a1)
{
  return a1;
}

uint64_t sub_10011B434(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf(a1) = off_10018A390;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = sub_1000B866C();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + sub_1000114F0(v4 - 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  sub_100004D60(a1 + 96);
  return a1;
}

void sub_10011B49C(_Unwind_Exception *a1)
{
}

uint64_t sub_10011B4B0(uint64_t a1)
{
  *(void *)a1 = off_10018A390;
  sub_10011B728(a1);
  std::streambuf::~streambuf(a1 + 104);
  std::ios::~ios(a1 + 208);
  return std::streambuf::~streambuf(a1);
}

void sub_10011B54C(char *a1)
{
}

uint64_t sub_10011B590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write(a1 + 96, a2, a3);
  }
  return a3;
}

uint64_t sub_10011B5C4(_BYTE *a1, int a2)
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

uint64_t sub_10011B610(uint64_t a1)
{
  uint64_t v2 = a1 - 360;
  std::ostream::~ostream(a1, off_10018A2C0);
  sub_10011B4B0(v2);
  return std::ios::~ios(a1 + 8);
}

void sub_10011B648(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream(a1, off_10018A2C0);
  sub_10011B4B0((uint64_t)v2);
  std::ios::~ios(a1 + 8);
  operator delete(v2);
}

uint64_t sub_10011B688(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_10018A2C0);
  sub_10011B4B0(v1);
  return std::ios::~ios(v1 + 368);
}

void sub_10011B6C8(void *a1)
{
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream(v1 + 360, off_10018A2C0);
  sub_10011B4B0((uint64_t)v1);
  std::ios::~ios(v1 + 368);
  operator delete(v1);
}

void sub_10011B714(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10011B4B0(a1);
  operator delete(v1);
}

uint64_t sub_10011B728(uint64_t a1)
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
        sub_1000049D8(a1 + 104, __p);
        sub_10011B878((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        sub_100004CB0(__p, "");
        sub_100004B48(a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_10011B850( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

int *sub_10011B878(uint64_t *a1, uint64_t *a2)
{
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (sub_1000B8654())
  {
    uint64_t v18 = 0LL;
    char v6 = (os_log_s *)sub_1000B85DC();
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
    unsigned __int8 v13 = (os_log_s *)sub_1000B85DC();
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
  *uint64_t result = v5;
  return result;
}

void sub_10011BA5C(void *a1, void *a2, void *__p)
{
  if ((void *)*a1 == a2)
  {
    uint64_t v4 = 4LL;
    goto LABEL_5;
  }

  if (*a1)
  {
    uint64_t v4 = 5LL;
    a2 = (void *)*a1;
LABEL_5:
    (*(void (**)(void *))(*a2 + 8 * v4))(a2);
  }

  operator delete(__p);
}

uint64_t sub_10011BB28(uint64_t a1, uint64_t a2)
{
  return std::ios::~ios(a2 + 112);
}

uint64_t sub_10011BB64(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  for (uint64_t result = (uint64_t)__cxa_begin_catch(a2); a4 != a1; a4 += 104LL)
  {
    uint64_t v8 = *(void *)(a4 + 48);
    if (v8) {
      *(void *)(v8 + 32) = 0LL;
    }
    uint64_t result = sub_1000114F0(a4);
  }

  return result;
}

void sub_10011BBCC(void *a1)
{
  uint64_t v1 = sub_100059020(a1);
  sub_100059008(v1);
  sub_100059018();
}

uint64_t sub_10011BBE8(uint64_t *a1)
{
  uint64_t result = *a1;
  *a1 = 0LL;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 40LL))(result);
  }
  return result;
}

void sub_10011BC20(uint64_t a1)
{
}

void sub_10011BC4C(std::__shared_weak_count *a1)
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

  sub_100059018();
}

void sub_10011BC94()
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

  sub_1000E35B4(v2, v5);
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
    sub_1000E35AC((uint64_t)v0, *(uint64_t (**)(void))(*v0 + 8 * v6));
    return;
  }

  sub_100059018();
}

void *sub_10011BCFC(void *result, void *a2, void *a3, uint64_t a4)
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

void sub_10011BD8C(std::__shared_weak_count *a1)
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

id objc_msgSend_DI1URLWithData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "DI1URLWithData:error:");
}

id objc_msgSend_GUIAskForPassphraseWithEncryptionFrontend_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "GUIAskForPassphraseWithEncryptionFrontend:error:");
}

id objc_msgSend_GUIAskForPassphraseWithEncryptionFrontend_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "GUIAskForPassphraseWithEncryptionFrontend:reply:");
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

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_absoluteURL(void *a1, const char *a2, ...)
{
  return _[a1 absoluteURL];
}

id objc_msgSend_activeConnections(void *a1, const char *a2, ...)
{
  return _[a1 activeConnections];
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

id objc_msgSend_addDisappearedCallbackWithMountPoint_shadowMountPoints_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:");
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

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return _[a1 anonymousListener];
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

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return _[a1 arguments];
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

id objc_msgSend_callbackReached(void *a1, const char *a2, ...)
{
  return _[a1 callbackReached];
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

id objc_msgSend_clientDelegate(void *a1, const char *a2, ...)
{
  return _[a1 clientDelegate];
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

id objc_msgSend_convertPrivateKeyTox963WithPemPrivateKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPrivateKeyTox963WithPemPrivateKey:error:");
}

id objc_msgSend_convertWithParams_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertWithParams:reply:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyAllMountPoints(void *a1, const char *a2, ...)
{
  return _[a1 copyAllMountPoints];
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

id objc_msgSend_copyEntitiesList(void *a1, const char *a2, ...)
{
  return _[a1 copyEntitiesList];
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

id objc_msgSend_copyParentWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyParentWithError:");
}

id objc_msgSend_copyPropertyWithClass_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyPropertyWithClass:key:");
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

id objc_msgSend_createNotificationPortWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNotificationPortWithError:");
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

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_customCacheURL(void *a1, const char *a2, ...)
{
  return _[a1 customCacheURL];
}

id objc_msgSend_daSession(void *a1, const char *a2, ...)
{
  return _[a1 daSession];
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

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
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

id objc_msgSend_destroyNotificationPort(void *a1, const char *a2, ...)
{
  return _[a1 destroyNotificationPort];
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

id objc_msgSend_diskArbDisappear(void *a1, const char *a2, ...)
{
  return _[a1 diskArbDisappear];
}

id objc_msgSend_diskArbWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "diskArbWithError:");
}

id objc_msgSend_diskImageDevice(void *a1, const char *a2, ...)
{
  return _[a1 diskImageDevice];
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

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _[a1 endpoint];
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

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 ephemeralSessionConfiguration];
}

id objc_msgSend_eraseIfExistingWithURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eraseIfExistingWithURL:error:");
}

id objc_msgSend_eraseOldCacheFiles(void *a1, const char *a2, ...)
{
  return _[a1 eraseOldCacheFiles];
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

id objc_msgSend_executeWithPath_arguments_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeWithPath:arguments:error:");
}

id objc_msgSend_exitDaemon(void *a1, const char *a2, ...)
{
  return _[a1 exitDaemon];
}

id objc_msgSend_exitTimer(void *a1, const char *a2, ...)
{
  return _[a1 exitTimer];
}

id objc_msgSend_exitWithUnmount(void *a1, const char *a2, ...)
{
  return _[a1 exitWithUnmount];
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

id objc_msgSend_fillDI1InfoWithDevice_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillDI1InfoWithDevice:error:");
}

id objc_msgSend_fillDI2InfoWithDevice_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillDI2InfoWithDevice:error:");
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

id objc_msgSend_frameworkNum(void *a1, const char *a2, ...)
{
  return _[a1 frameworkNum];
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

id objc_msgSend_getImageInfoWithExtra_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getImageInfoWithExtra:error:");
}

id objc_msgSend_getImageWithTag_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getImageWithTag:error:");
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

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
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

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _[a1 imageURL];
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

id objc_msgSend_initFileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFileURLWithPath:");
}

id objc_msgSend_initWithBSDName_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBSDName:error:");
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

id objc_msgSend_initWithDebugServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDebugServiceName:");
}

id objc_msgSend_initWithDevName_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevName:error:");
}

id objc_msgSend_initWithDevice_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:error:");
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

id objc_msgSend_initWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithError:");
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

id objc_msgSend_initWithIODaemon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIODaemon:");
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

id objc_msgSend_initWithIsRAM_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIsRAM:");
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

id objc_msgSend_initWithRegEntryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRegEntryID:");
}

id objc_msgSend_initWithRegEntryID_xpcEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRegEntryID:xpcEndpoint:");
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

id objc_msgSend_initWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnsignedInt:");
}

id objc_msgSend_initWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnsignedLongLong:");
}

id objc_msgSend_initWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnsignedShort:");
}

id objc_msgSend_inputMountedOnURL(void *a1, const char *a2, ...)
{
  return _[a1 inputMountedOnURL];
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

id objc_msgSend_instanceId(void *a1, const char *a2, ...)
{
  return _[a1 instanceId];
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

id objc_msgSend_ioMedia(void *a1, const char *a2, ...)
{
  return _[a1 ioMedia];
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

id objc_msgSend_isRAM(void *a1, const char *a2, ...)
{
  return _[a1 isRAM];
}

id objc_msgSend_isSparseFormat(void *a1, const char *a2, ...)
{
  return _[a1 isSparseFormat];
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

id objc_msgSend_mediaSize(void *a1, const char *a2, ...)
{
  return _[a1 mediaSize];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_mountPoints(void *a1, const char *a2, ...)
{
  return _[a1 mountPoints];
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

id objc_msgSend_newDI1DevicesArrayWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newDI1DevicesArrayWithError:");
}

id objc_msgSend_newDI2DevicesArrayWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newDI2DevicesArrayWithError:");
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

id objc_msgSend_newEntityDictWithIOMedia_mountPoints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newEntityDictWithIOMedia:mountPoints:");
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

id objc_msgSend_notificationPort(void *a1, const char *a2, ...)
{
  return _[a1 notificationPort];
}

id objc_msgSend_numBlocks(void *a1, const char *a2, ...)
{
  return _[a1 numBlocks];
}

id objc_msgSend_numBlocksWithSizeStr_blockSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numBlocksWithSizeStr:blockSize:");
}

id objc_msgSend_numberOfMatchesInString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfMatchesInString:options:range:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
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

id objc_msgSend_onClientInvalidateWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onClientInvalidateWithConnection:");
}

id objc_msgSend_onDisappearedMountPoint(void *a1, const char *a2, ...)
{
  return _[a1 onDisappearedMountPoint];
}

id objc_msgSend_onDiskCache(void *a1, const char *a2, ...)
{
  return _[a1 onDiskCache];
}

id objc_msgSend_onErrorCleanup(void *a1, const char *a2, ...)
{
  return _[a1 onErrorCleanup];
}

id objc_msgSend_onPeriodicWithInfo_urgency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onPeriodicWithInfo:urgency:");
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

id objc_msgSend_operationError(void *a1, const char *a2, ...)
{
  return _[a1 operationError];
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

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
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

id objc_msgSend_registerPeriodicCallback(void *a1, const char *a2, ...)
{
  return _[a1 registerPeriodicCallback];
}

id objc_msgSend_registryEntryIDWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registryEntryIDWithError:");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
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

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
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

id objc_msgSend_requestsStatsToNSArrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestsStatsToNSArrayWithArray:");
}

id objc_msgSend_requiresRootDaemon(void *a1, const char *a2, ...)
{
  return _[a1 requiresRootDaemon];
}

id objc_msgSend_restartExitTimer(void *a1, const char *a2, ...)
{
  return _[a1 restartExitTimer];
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

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runIOmanager(void *a1, const char *a2, ...)
{
  return _[a1 runIOmanager];
}

id objc_msgSend_runLoopSource(void *a1, const char *a2, ...)
{
  return _[a1 runLoopSource];
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runMode:beforeDate:");
}

id objc_msgSend_saveToPlistWithDictionary_URL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveToPlistWithDictionary:URL:error:");
}

id objc_msgSend_scanInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanInteger:");
}

id objc_msgSend_scanUpToCharactersFromSet_intoString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanUpToCharactersFromSet:intoString:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:repeats:block:");
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

id objc_msgSend_setAttachedTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttachedTransaction:");
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

id objc_msgSend_setCallbackReached_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallbackReached:");
}

id objc_msgSend_setCertificate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCertificate:");
}

id objc_msgSend_setClient2IOhandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClient2IOhandler:");
}

id objc_msgSend_setClientDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientDelegate:");
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

id objc_msgSend_setDI2PIDWithDevice_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDI2PIDWithDevice:error:");
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

id objc_msgSend_setExitTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExitTimer:");
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

id objc_msgSend_setInputMountedOnURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInputMountedOnURL:");
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

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setNotificationPort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationPort:");
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

id objc_msgSend_setOperationError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOperationError:");
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

id objc_msgSend_setRunLoopSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRunLoopSource:");
}

id objc_msgSend_setSemaphore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSemaphore:");
}

id objc_msgSend_setShadowChain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowChain:");
}

id objc_msgSend_setShadowMountedOnURLs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowMountedOnURLs:");
}

id objc_msgSend_setShouldValidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldValidate:");
}

id objc_msgSend_setSigtermHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSigtermHandler:");
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

id objc_msgSend_setXpcEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcEndpoint:");
}

id objc_msgSend_setXpcError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcError:");
}

id objc_msgSend_setupDefaults(void *a1, const char *a2, ...)
{
  return _[a1 setupDefaults];
}

id objc_msgSend_setupExitDaemonWatchdog(void *a1, const char *a2, ...)
{
  return _[a1 setupExitDaemonWatchdog];
}

id objc_msgSend_setupNewConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupNewConnection:");
}

id objc_msgSend_setupSigtermHandler(void *a1, const char *a2, ...)
{
  return _[a1 setupSigtermHandler];
}

id objc_msgSend_setupTerminationNotificationWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupTerminationNotificationWithError:");
}

id objc_msgSend_shadowChain(void *a1, const char *a2, ...)
{
  return _[a1 shadowChain];
}

id objc_msgSend_shadowMountedOnURLs(void *a1, const char *a2, ...)
{
  return _[a1 shadowMountedOnURLs];
}

id objc_msgSend_shadowStats(void *a1, const char *a2, ...)
{
  return _[a1 shadowStats];
}

id objc_msgSend_shadowURL(void *a1, const char *a2, ...)
{
  return _[a1 shadowURL];
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

id objc_msgSend_sigtermHandler(void *a1, const char *a2, ...)
{
  return _[a1 sigtermHandler];
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

id objc_msgSend_startedOver(void *a1, const char *a2, ...)
{
  return _[a1 startedOver];
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

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
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

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_toDIShadowNode(void *a1, const char *a2, ...)
{
  return _[a1 toDIShadowNode];
}

id objc_msgSend_toDictionary(void *a1, const char *a2, ...)
{
  return _[a1 toDictionary];
}

id objc_msgSend_tryAttachWithParams_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryAttachWithParams:error:");
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

id objc_msgSend_unmountAll(void *a1, const char *a2, ...)
{
  return _[a1 unmountAll];
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

id objc_msgSend_validateDeserializationWithParams_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateDeserializationWithParams:reply:");
}

id objc_msgSend_validateFileWithURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateFileWithURL:error:");
}

id objc_msgSend_validateInstance(void *a1, const char *a2, ...)
{
  return _[a1 validateInstance];
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

id objc_msgSend_verifyWithParams_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyWithParams:reply:");
}

id objc_msgSend_waitForDAIdleWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForDAIdleWithError:");
}

id objc_msgSend_waitForDeviceWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForDeviceWithError:");
}

id objc_msgSend_waitForQuietWithService_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForQuietWithService:error:");
}

id objc_msgSend_waitUntilExit(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilExit];
}

id objc_msgSend_weakDaemon(void *a1, const char *a2, ...)
{
  return _[a1 weakDaemon];
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