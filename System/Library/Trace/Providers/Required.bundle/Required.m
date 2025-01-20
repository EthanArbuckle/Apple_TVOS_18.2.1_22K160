LABEL_10:
  return v9;
}

void sub_47C0(int a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  do
  {
    id v6 = v3;
    if (a1 || !LOBYTE((&off_14A98)[v4 + 2])) {
      v7 = &(&off_14A98)[3 * v5 + 1];
    }
    else {
      v7 = (char **)((char *)&off_14A98 + 8 * v4 + 12);
    }
    int v8 = *(_DWORD *)v7;
    int v17 = 0;
    int v18 = v8;
    size_t v16 = 4LL;
    if (sysctlbyname((&off_14A98)[v4], &v17, &v16, 0LL, 0LL))
    {
      if (*__error() == 2) {
        goto LABEL_12;
      }
      v9 = (&off_14A98)[v4];
      v10 = __error();
      v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not check for sysctl %s: %s",  v9,  strerror(*v10));
      goto LABEL_11;
    }

    if (sysctlbyname((&off_14A98)[v4], &v17, &v16, &v18, 4uLL))
    {
      v12 = (&off_14A98)[v4];
      v13 = __error();
      v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not write sysctl %s: %s",  v12,  strerror(*v13));
LABEL_11:
      v14 = (void *)objc_claimAutoreleasedReturnValue(v11);
      [v6 failWithReason:v14];

      goto LABEL_12;
    }

    v15 = &(&off_14A98)[v4];
    if (a1)
    {
      if (!*((_BYTE *)v15 + 16))
      {
        *((_DWORD *)&off_14A98 + 2 * v4 + 3) = v17;
        *((_BYTE *)v15 + 16) = 1;
      }
    }

    else
    {
      *((_BYTE *)v15 + 16) = 0;
    }

LABEL_12:
    ++v5;
    v4 += 3LL;
  }

  while (v4 != 15);
}

          int v18 = (unsigned int *)sub_7D5C((int *)v9, (int *)a2, a3);
          if ((v19 & 1) == 0) {
            goto LABEL_15;
          }
          v20 = sub_7EB4(v9, v18, a3);
          v9 = v18 + 1;
          result = sub_7EB4(v18 + 1, a2, a3);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v20) {
              continue;
            }
LABEL_15:
            result = sub_75D8(v8, v18, a3, -v11, a5 & 1);
            v9 = v18 + 1;
LABEL_17:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }

          a4 = -v11;
          a2 = v18;
          if (v20) {
            return result;
          }
          goto LABEL_2;
        }

        if (v9 != a2) {
          return (uint64_t)sub_82E4(v9, a2, a2, a3);
        }
        return result;
    }
  }

          int v18 = (unsigned int *)sub_7D5C((int *)v9, (int *)a2, a3);
          if ((v19 & 1) == 0) {
            goto LABEL_15;
          }
          v20 = sub_8BB4(v9, v18, a3);
          v9 = v18 + 1;
          result = sub_8BB4(v18 + 1, a2, a3);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v20) {
              continue;
            }
LABEL_15:
            result = sub_8850(v8, v18, a3, -v11, a5 & 1);
            v9 = v18 + 1;
LABEL_17:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }

          a4 = -v11;
          a2 = v18;
          if (v20) {
            return result;
          }
          goto LABEL_2;
        }

        if (v9 != a2) {
          return (uint64_t)sub_82E4(v9, a2, a2, a3);
        }
        return result;
    }
  }

BOOL sub_499C(io_registry_entry_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (IOObjectConformsTo(a1, "AppleIntelFramebuffer"))
  {
    BOOL v6 = 1LL;
  }

  else if (IORegistryEntryGetChildIterator(a1, "IOService", &iterator))
  {
    [v5 failWithReason:@"Could not query io registry for graphics"];
    BOOL v6 = 0LL;
  }

  else
  {
    uint64_t v7 = (a2 + 1);
    do
    {
      uint64_t v8 = IOIteratorNext(iterator);
      BOOL v6 = (_DWORD)v8 != 0;
      if (!(_DWORD)v8) {
        break;
      }
      io_object_t v9 = v8;
      int v10 = sub_499C(v8, v7, v5);
      IOObjectRelease(v9);
    }

    while (!v10);
    IOObjectRelease(iterator);
  }

  return v6;
}

void sub_4AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}
}

void sub_4F3C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *__p, uint64_t a24, uint64_t a25, char a26)
{
  if (__p)
  {
    a24 = (uint64_t)__p;
    operator delete(__p);
  }

  _Block_object_dispose(&a26, 8);
  sub_6674(v26);
  _Unwind_Resume(a1);
}

uint64_t sub_4FC0(uint64_t a1, uint64_t a2)
{
  return sub_6380(a1 + 48, a2 + 48);
}

uint64_t *sub_4FCC(uint64_t a1)
{
  return sub_6674((uint64_t *)(a1 + 48));
}

__n128 sub_4FD4(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0LL;
  a1[3].n128_u64[1] = 0LL;
  a1[4].n128_u64[0] = 0LL;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0LL;
  a2[3].n128_u64[1] = 0LL;
  a2[4].n128_u64[0] = 0LL;
  return result;
}

void sub_4FF8(uint64_t a1)
{
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }

void sub_5010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = sub_511C(a2, a3, *(void *)(*(void *)(a1 + 32) + 8LL) + 48LL, 1);
  if (v4)
  {
    int v5 = v4;
    BOOL v6 = *(void **)(*(void *)(a1 + 40) + 8LL);
    uint64_t v7 = (char *)v6[7];
    unint64_t v8 = v6[8];
    if ((unint64_t)v7 >= v8)
    {
      int v10 = (char *)v6[6];
      uint64_t v11 = (v7 - v10) >> 2;
      unint64_t v12 = v8 - (void)v10;
      unint64_t v13 = (uint64_t)(v8 - (void)v10) >> 1;
      if (v13 <= v11 + 1) {
        unint64_t v13 = v11 + 1;
      }
      if (v12 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14)
      {
        v15 = (char *)sub_750C((uint64_t)(v6 + 8), v14);
        int v10 = (char *)v6[6];
        uint64_t v7 = (char *)v6[7];
      }

      else
      {
        v15 = 0LL;
      }

      size_t v16 = &v15[4 * v11];
      int v17 = &v15[4 * v14];
      *(_DWORD *)size_t v16 = v5;
      io_object_t v9 = v16 + 4;
      while (v7 != v10)
      {
        int v18 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v16 - 1) = v18;
        v16 -= 4;
      }

      v6[6] = v16;
      v6[7] = v9;
      v6[8] = v17;
      if (v10) {
        operator delete(v10);
      }
    }

    else
    {
      *(_DWORD *)uint64_t v7 = v4;
      io_object_t v9 = v7 + 4;
    }

    v6[7] = v9;
  }

uint64_t sub_511C(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v37 = 0LL;
  v38 = &v37;
  uint64_t v39 = 0x4812000000LL;
  v40 = sub_66F0;
  v41 = sub_6714;
  v42 = "";
  __p = 0LL;
  v44 = 0LL;
  uint64_t v45 = 0LL;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_672C;
  v36[3] = &unk_10590;
  v36[4] = &v37;
  v36[5] = a3;
  CSSymbolOwnerForeachSegment(a1, a2, v36);
  uint64_t v8 = v38[6];
  uint64_t v9 = v38[7];
  if (v8 == v9)
  {
    uint64_t v18 = 0LL;
  }

  else
  {
    unsigned int v10 = sub_87E0((_DWORD *)a3, v8, (v9 - v8) >> 2);
    Name = (const char *)CSSymbolOwnerGetName(a1, a2);
    unsigned int v12 = sub_6B94(Name, (void *)a3);
    uint64_t Architecture = CSSymbolOwnerGetArchitecture(a1, a2);
    unsigned int v14 = 0;
    if (a4)
    {
      uint64_t v15 = Architecture;
      unsigned int v35 = 0;
      if (Architecture)
      {
        unint64_t v16 = CSSymbolOwnerGetArchitecture(a1, a2);
        unsigned int v35 = sub_6BCC(v16, a3);
        FamilyName = (const char *)CSArchitectureGetFamilyName(v15);
        unsigned int v14 = sub_6B94(FamilyName, (void *)a3);
      }
    }

    else
    {
      unsigned int v35 = 0;
    }

    CFUUIDBytes = (const unsigned __int8 *)CSSymbolOwnerGetCFUUIDBytes(a1, a2);
    uuid_unparse(CFUUIDBytes, out);
    size_t v20 = strlen(out);
    unsigned int v21 = sub_8E74((void *)a3, out, v20);
    Path = (const char *)CSSymbolOwnerGetPath(a1, a2);
    unsigned int v23 = sub_6B94(Path, (void *)a3);
    unsigned int v34 = v10;
    Version = (const char *)CSSymbolOwnerGetVersion(a1, a2);
    unsigned int v25 = sub_6B94(Version, (void *)a3);
    sub_6E54(a3);
    *(_BYTE *)(a3 + 70) = 1;
    int v26 = *(_DWORD *)(a3 + 32);
    int v27 = *(_DWORD *)(a3 + 48);
    int v28 = *(_DWORD *)(a3 + 40);
    sub_7140((_DWORD *)a3, 4LL, v21);
    sub_7140((_DWORD *)a3, 6LL, v23);
    if (a4)
    {
      sub_7140((_DWORD *)a3, 12LL, v35);
      sub_7140((_DWORD *)a3, 14LL, v14);
    }

    sub_7140((_DWORD *)a3, 16LL, v12);
    sub_7140((_DWORD *)a3, 22LL, v25);
    unsigned int v29 = sub_72B0(a3, v26 - v27 + v28);
    sub_6E54(a3);
    *(_BYTE *)(a3 + 70) = 1;
    int v30 = *(_DWORD *)(a3 + 32);
    int v31 = *(_DWORD *)(a3 + 48);
    int v32 = *(_DWORD *)(a3 + 40);
    sub_8D90(a3, 4LL, 1, 0);
    sub_7140((_DWORD *)a3, 6LL, v29);
    sub_7140((_DWORD *)a3, 8LL, v34);
    sub_6E7C(a3, 10LL, 0LL, -1LL);
    uint64_t v18 = sub_72B0(a3, v30 - v31 + v32);
  }

  _Block_object_dispose(&v37, 8);
  if (__p)
  {
    v44 = __p;
    operator delete(__p);
  }

  return v18;
}

void sub_5438( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *__p, uint64_t a24)
{
  if (__p)
  {
    a24 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_5494(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v6 = a2 - 4;
    uint64_t v7 = a3;
    do
    {
      uint64_t v8 = v7 - 1;
      int v9 = sub_720C(a1, *(_DWORD *)(v6 + 4 * v7));
      sub_725C((uint64_t)a1, v9);
      uint64_t v7 = v8;
    }

    while (v8);
  }

  return sub_8788((uint64_t)a1, a3);
}

uint64_t sub_5504(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 71)) {
    sub_D278();
  }
  uint64_t result = *(void *)(a1 + 48);
  if (!result) {
    sub_D2A0();
  }
  return result;
}

void sub_57E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, void *__p, uint64_t a35, uint64_t a36, char a37)
{
  _Block_object_dispose(&a17, 8);
  sub_B734(v38);
  _Block_object_dispose(&a28, 8);
  if (__p)
  {
    a35 = (uint64_t)__p;
    operator delete(__p);
  }

  _Block_object_dispose(&a37, 8);
  sub_6674(v37);
  _Unwind_Resume(a1);
}

__n128 sub_5854(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0LL;
  a1[3].n128_u64[1] = 0LL;
  a1[4].n128_u64[0] = 0LL;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0LL;
  a2[3].n128_u64[1] = 0LL;
  a2[4].n128_u64[0] = 0LL;
  return result;
}

void sub_5878(uint64_t a1)
{
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }

uint64_t sub_5890(uint64_t a1, uint64_t a2)
{
  return sub_A164(a1 + 48, (uint64_t *)(a2 + 48));
}

uint64_t sub_589C(uint64_t a1)
{
  return sub_B734(a1 + 48);
}

void sub_58A4(void *a1, uint64_t a2)
{
  if (!sub_B0E8((void *)(*(void *)(a1[4] + 8LL) + 48LL), (unsigned __int8 *)__p))
  {
    int v4 = sub_5A6C(a2, *(void *)(a1[5] + 8LL) + 48LL);
    int v5 = v4;
    if (v4)
    {
      uint64_t v6 = *(void **)(a1[6] + 8LL);
      uint64_t v7 = (char *)v6[7];
      unint64_t v8 = v6[8];
      if ((unint64_t)v7 >= v8)
      {
        unsigned int v10 = (char *)v6[6];
        uint64_t v11 = (v7 - v10) >> 2;
        unint64_t v12 = v8 - (void)v10;
        unint64_t v13 = (uint64_t)(v8 - (void)v10) >> 1;
        if (v13 <= v11 + 1) {
          unint64_t v13 = v11 + 1;
        }
        if (v12 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v14)
        {
          uint64_t v15 = (char *)sub_750C((uint64_t)(v6 + 8), v14);
          unsigned int v10 = (char *)v6[6];
          uint64_t v7 = (char *)v6[7];
        }

        else
        {
          uint64_t v15 = 0LL;
        }

        unint64_t v16 = &v15[4 * v11];
        int v17 = &v15[4 * v14];
        *(_DWORD *)unint64_t v16 = v5;
        int v9 = v16 + 4;
        while (v7 != v10)
        {
          int v18 = *((_DWORD *)v7 - 1);
          v7 -= 4;
          *((_DWORD *)v16 - 1) = v18;
          v16 -= 4;
        }

        v6[6] = v16;
        v6[7] = v9;
        v6[8] = v17;
        if (v10) {
          operator delete(v10);
        }
      }

      else
      {
        *(_DWORD *)uint64_t v7 = v4;
        int v9 = v7 + 4;
      }

      v6[7] = v9;
      sub_B7B0(*(void *)(a1[4] + 8LL) + 48LL, (unsigned __int8 *)__p, (uint64_t)__p);
    }
  }

  if (v20 < 0) {
    operator delete(__p[0]);
  }
}

void sub_5A44( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_5A6C(uint64_t a1, unint64_t a2)
{
  uint64_t base_address = dyld_shared_cache_get_base_address(a1);
  size_t v5 = strlen(out);
  unsigned int v6 = sub_8F54(a2, out, v5);
  sub_6E54(a2);
  *(_BYTE *)(a2 + 70) = 1;
  int v7 = *(_DWORD *)(a2 + 32);
  int v8 = *(_DWORD *)(a2 + 48);
  int v9 = *(_DWORD *)(a2 + 40);
  sub_7140((_DWORD *)a2, 4LL, v6);
  sub_6E7C(a2, 20LL, base_address, -1LL);
  unsigned int v10 = sub_72B0(a2, v7 - v8 + v9);
  uint64_t v20 = 0LL;
  unsigned int v21 = &v20;
  uint64_t v22 = 0x4812000000LL;
  unsigned int v23 = sub_4FD4;
  v24 = sub_4FF8;
  unsigned int v25 = "";
  __p = 0LL;
  int v27 = 0LL;
  uint64_t v28 = 0LL;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_9574;
  v19[3] = &unk_105B8;
  v19[4] = &v20;
  v19[5] = a2;
  dyld_shared_cache_for_each_image(a1, v19);
  uint64_t v11 = v21[7] - v21[6];
  if (v11) {
    unint64_t v12 = (void *)v21[6];
  }
  else {
    unint64_t v12 = &flatbuffers::data<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>,std::allocator<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>>>(std::vector<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>> const&)::t;
  }
  unsigned int v13 = sub_5494((_DWORD *)a2, (uint64_t)v12, v11 >> 2);
  sub_6E54(a2);
  *(_BYTE *)(a2 + 70) = 1;
  int v14 = *(_DWORD *)(a2 + 32);
  int v15 = *(_DWORD *)(a2 + 48);
  int v16 = *(_DWORD *)(a2 + 40);
  sub_8D90(a2, 4LL, 3, 0);
  sub_7140((_DWORD *)a2, 6LL, v10);
  sub_7140((_DWORD *)a2, 8LL, v13);
  uint64_t v17 = sub_72B0(a2, v14 - v15 + v16);
  _Block_object_dispose(&v20, 8);
  if (__p)
  {
    int v27 = __p;
    operator delete(__p);
  }

  return v17;
}

void sub_5C88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *__p, uint64_t a23)
{
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_5F24( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *__p, uint64_t a23, uint64_t a24, char a25)
{
  _Block_object_dispose(&a16, 8);
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }

  _Block_object_dispose(&a25, 8);
  sub_6674(v25);
  _Unwind_Resume(a1);
}

void sub_5F7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = sub_6084(a2, a3, *(void *)(*(void *)(a1 + 32) + 8LL) + 48LL);
  if (v4)
  {
    int v5 = v4;
    unsigned int v6 = *(void **)(*(void *)(a1 + 40) + 8LL);
    int v7 = (char *)v6[7];
    unint64_t v8 = v6[8];
    if ((unint64_t)v7 >= v8)
    {
      unsigned int v10 = (char *)v6[6];
      uint64_t v11 = (v7 - v10) >> 2;
      unint64_t v12 = v8 - (void)v10;
      unint64_t v13 = (uint64_t)(v8 - (void)v10) >> 1;
      if (v13 <= v11 + 1) {
        unint64_t v13 = v11 + 1;
      }
      if (v12 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14)
      {
        int v15 = (char *)sub_750C((uint64_t)(v6 + 8), v14);
        unsigned int v10 = (char *)v6[6];
        int v7 = (char *)v6[7];
      }

      else
      {
        int v15 = 0LL;
      }

      int v16 = &v15[4 * v11];
      uint64_t v17 = &v15[4 * v14];
      *(_DWORD *)int v16 = v5;
      int v9 = v16 + 4;
      while (v7 != v10)
      {
        int v18 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v16 - 1) = v18;
        v16 -= 4;
      }

      v6[6] = v16;
      v6[7] = v9;
      v6[8] = v17;
      if (v10) {
        operator delete(v10);
      }
    }

    else
    {
      *(_DWORD *)int v7 = v4;
      int v9 = v7 + 4;
    }

    v6[7] = v9;
  }

uint64_t sub_6084(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t SharedCacheUUID = CSSymbolicatorGetSharedCacheUUID();
  if (!SharedCacheUUID) {
    return 0LL;
  }
  int v7 = (const unsigned __int8 *)SharedCacheUUID;
  unint64_t Architecture = CSSymbolicatorGetArchitecture(a1, a2);
  uuid_copy(dst, v7);
  uuid_unparse(dst, out);
  size_t v9 = strlen(out);
  unsigned int v10 = sub_8F54(a3, out, v9);
  LODWORD(v7) = sub_6BCC(Architecture, a3);
  FamilyName = (const char *)CSArchitectureGetFamilyName(Architecture);
  size_t v12 = strlen(FamilyName);
  LODWORD(FamilyName) = sub_8E74((void *)a3, FamilyName, v12);
  sub_6E54(a3);
  *(_BYTE *)(a3 + 70) = 1;
  int v13 = *(_DWORD *)(a3 + 32);
  int v14 = *(_DWORD *)(a3 + 48);
  int v15 = *(_DWORD *)(a3 + 40);
  sub_7140((_DWORD *)a3, 4LL, v10);
  sub_7140((_DWORD *)a3, 12LL, v7);
  sub_7140((_DWORD *)a3, 14LL, FamilyName);
  unsigned int v16 = sub_72B0(a3, v13 - v14 + v15);
  uint64_t v26 = 0LL;
  int v27 = &v26;
  uint64_t v28 = 0x4812000000LL;
  unsigned int v29 = sub_4FD4;
  int v30 = sub_4FF8;
  int v31 = "";
  __p = 0LL;
  v33 = 0LL;
  uint64_t v34 = 0LL;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_B580;
  v25[3] = &unk_10590;
  v25[4] = &v26;
  v25[5] = a3;
  CSSymbolicatorForeachSymbolOwnerAtTime(a1, a2, 0x8000000000000001LL, v25);
  uint64_t v17 = v27[7] - v27[6];
  if (v17) {
    int v18 = (void *)v27[6];
  }
  else {
    int v18 = &flatbuffers::data<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>,std::allocator<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>>>(std::vector<flatbuffers::Offset<FlatbufferSymbols::SymbolOwner>> const&)::t;
  }
  unsigned int v19 = sub_5494((_DWORD *)a3, (uint64_t)v18, v17 >> 2);
  sub_6E54(a3);
  *(_BYTE *)(a3 + 70) = 1;
  int v20 = *(_DWORD *)(a3 + 32);
  int v21 = *(_DWORD *)(a3 + 48);
  int v22 = *(_DWORD *)(a3 + 40);
  sub_8D90(a3, 4LL, 3, 0);
  sub_7140((_DWORD *)a3, 6LL, v16);
  sub_7140((_DWORD *)a3, 8LL, v19);
  uint64_t v23 = sub_72B0(a3, v20 - v21 + v22);
  _Block_object_dispose(&v26, 8);
  if (__p)
  {
    v33 = __p;
    operator delete(__p);
  }

  return v23;
}

void sub_6310( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *__p, uint64_t a23)
{
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_6380(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 0LL;
  *(_BYTE *)(a1 + 8) = 0;
  *(_OWORD *)(a1 + 16) = xmmword_E450;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 72) = 1LL;
  *(_WORD *)(a1 + 80) = 256;
  *(void *)(a1 + 88) = 0LL;
  sub_63E8(a1, a2);
  return a1;
}

void sub_63D4(_Unwind_Exception *a1)
{
}

uint64_t *sub_63E8(uint64_t a1, uint64_t a2)
{
  __n128 result = sub_648C((uint64_t *)a1, (uint64_t *)a2);
  int v5 = *(_DWORD *)(a1 + 64);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_DWORD *)(a2 + 64) = v5;
  LOWORD(v5) = *(_WORD *)(a1 + 68);
  *(_WORD *)(a1 + 68) = *(_WORD *)(a2 + 68);
  *(_WORD *)(a2 + 68) = v5;
  LOBYTE(v5) = *(_BYTE *)(a1 + 70);
  *(_BYTE *)(a1 + 70) = *(_BYTE *)(a2 + 70);
  *(_BYTE *)(a2 + 70) = v5;
  LOBYTE(v5) = *(_BYTE *)(a1 + 71);
  *(_BYTE *)(a1 + 71) = *(_BYTE *)(a2 + 71);
  *(_BYTE *)(a2 + 71) = v5;
  uint64_t v6 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 72) = v6;
  LOBYTE(v6) = *(_BYTE *)(a1 + 80);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_BYTE *)(a2 + 80) = v6;
  LOBYTE(v6) = *(_BYTE *)(a1 + 81);
  *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
  *(_BYTE *)(a2 + 81) = v6;
  uint64_t v7 = *(void *)(a1 + 88);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a2 + 88) = v7;
  return result;
}

uint64_t *sub_648C(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  *__n128 result = *a2;
  *a2 = v2;
  LOBYTE(v2) = *((_BYTE *)result + 8);
  *((_BYTE *)result + 8) = *((_BYTE *)a2 + 8);
  *((_BYTE *)a2 + 8) = v2;
  uint64_t v3 = result[2];
  result[2] = a2[2];
  a2[2] = v3;
  uint64_t v4 = result[3];
  result[3] = a2[3];
  a2[3] = v4;
  uint64_t v5 = result[4];
  uint64_t v6 = result[5];
  uint64_t v7 = a2[5];
  result[4] = a2[4];
  result[5] = v7;
  a2[4] = v5;
  a2[5] = v6;
  uint64_t v8 = result[6];
  result[6] = a2[6];
  a2[6] = v8;
  uint64_t v9 = result[7];
  result[7] = a2[7];
  a2[7] = v9;
  return result;
}

uint64_t *sub_6500(uint64_t *a1)
{
  if (*((_BYTE *)a1 + 8) && *a1) {
    (*(void (**)(uint64_t))(*(void *)*a1 + 8LL))(*a1);
  }
  *a1 = 0LL;
  *((_BYTE *)a1 + 8) = 0;
  return a1;
}

void sub_654C(uint64_t *a1)
{
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    uint64_t v3 = *a1;
    if (*a1) {
      (*(void (**)(uint64_t))(*(void *)v3 + 24LL))(v3);
    }
    else {
      operator delete[](v2);
    }
  }

  a1[5] = 0LL;
}

void sub_6598(void *a1)
{
}

void sub_65A8(int a1, void *__p)
{
  if (__p) {
    operator delete[](__p);
  }
}

void *sub_65C0(int a1, size_t __sz)
{
  return operator new[](__sz);
}

char *sub_65C8(uint64_t a1, char *a2, unint64_t a3, unint64_t a4, size_t a5, size_t a6)
{
  if (a4 <= a3) {
    sub_D2C8();
  }
  size_t v12 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(*(void *)a1 + 16LL))(a1, a4);
  memcpy(&v12[a4 - a5], &a2[a3 - a5], a5);
  memcpy(v12, a2, a6);
  (*(void (**)(uint64_t, char *, unint64_t))(*(void *)a1 + 24LL))(a1, a2, a3);
  return v12;
}

uint64_t *sub_6674(uint64_t *a1)
{
  uint64_t v2 = (void **)a1[11];
  if (v2)
  {
    sub_66B0(a1[11], v2[1]);
    operator delete(v2);
  }

  return sub_6500(a1);
}

void sub_66B0(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_66B0(a1, *a2);
    sub_66B0(a1, a2[1]);
    operator delete(a2);
  }

__n128 sub_66F0(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0LL;
  a1[3].n128_u64[1] = 0LL;
  a1[4].n128_u64[0] = 0LL;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0LL;
  a2[3].n128_u64[1] = 0LL;
  a2[4].n128_u64[0] = 0LL;
  return result;
}

void sub_6714(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }

void sub_672C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = sub_682C(a2, a3, *(void *)(a1 + 40));
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8LL);
    uint64_t v7 = (char *)v6[7];
    unint64_t v8 = v6[8];
    if ((unint64_t)v7 >= v8)
    {
      unsigned int v10 = (char *)v6[6];
      uint64_t v11 = (v7 - v10) >> 2;
      unint64_t v12 = v8 - (void)v10;
      unint64_t v13 = (uint64_t)(v8 - (void)v10) >> 1;
      if (v13 <= v11 + 1) {
        unint64_t v13 = v11 + 1;
      }
      if (v12 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14)
      {
        int v15 = (char *)sub_750C((uint64_t)(v6 + 8), v14);
        unsigned int v10 = (char *)v6[6];
        uint64_t v7 = (char *)v6[7];
      }

      else
      {
        int v15 = 0LL;
      }

      unsigned int v16 = &v15[4 * v11];
      uint64_t v17 = &v15[4 * v14];
      *(_DWORD *)unsigned int v16 = v5;
      uint64_t v9 = v16 + 4;
      while (v7 != v10)
      {
        int v18 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v16 - 1) = v18;
        v16 -= 4;
      }

      v6[6] = v16;
      v6[7] = v9;
      v6[8] = v17;
      if (v10) {
        operator delete(v10);
      }
    }

    else
    {
      *(_DWORD *)uint64_t v7 = v4;
      uint64_t v9 = v7 + 4;
    }

    v6[7] = v9;
  }

uint64_t sub_682C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v36 = 0LL;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x4812000000LL;
  uint64_t v39 = sub_6C4C;
  v40 = sub_6C70;
  v41 = "";
  __p = 0LL;
  v43 = 0LL;
  uint64_t v44 = 0LL;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_6C88;
  v35[3] = &unk_10590;
  v35[4] = &v36;
  v35[5] = a3;
  CSSegmentForeachSection(a1, a2, v35);
  uint64_t v6 = v37[6];
  uint64_t v7 = v37[7];
  if (v6 == v7) {
    unsigned int v8 = 0;
  }
  else {
    unsigned int v8 = sub_7568((_DWORD *)a3, v6, (v7 - v6) >> 2);
  }
  Name = (char *)CSRegionGetName(a1, a2);
  if (Name)
  {
    sub_B684(v45, " SEGMENT");
    unsigned int v33 = v8;
    sub_B684(&v34, Name);
    int64_t size = v34.__r_.__value_.__s.__size_;
    if ((v34.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v11 = &v34;
    }
    else {
      uint64_t v11 = (std::string *)v34.__r_.__value_.__r.__words[0];
    }
    unsigned __int8 v12 = v46;
    if ((v46 & 0x80u) == 0) {
      unint64_t v13 = v45;
    }
    else {
      unint64_t v13 = (void **)v45[0];
    }
    if ((v46 & 0x80u) == 0) {
      int64_t v14 = v46;
    }
    else {
      int64_t v14 = (int64_t)v45[1];
    }
    if (v14)
    {
      if ((v34.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        int64_t size = v34.__r_.__value_.__l.__size_;
      }
      if (size >= v14)
      {
        int v15 = (char *)v11 + size;
        int v16 = *(char *)v13;
        uint64_t v17 = v11;
        do
        {
          int64_t v18 = size - v14;
          if (v18 == -1) {
            break;
          }
          unsigned int v19 = (char *)memchr(v17, v16, v18 + 1);
          if (!v19) {
            break;
          }
          int v20 = v19;
          if (!memcmp(v19, v13, v14))
          {
            if (v20 != v15)
            {
              std::string::size_type v21 = v20 - (char *)v11;
            }

            break;
          }

          uint64_t v17 = (std::string *)(v20 + 1);
          int64_t size = v15 - (v20 + 1);
        }

        while (size >= v14);
      }
    }

    else
    {
      std::string::size_type v21 = 0LL;
LABEL_26:
      std::string::erase(&v34, v21, v14);
      unsigned __int8 v12 = v46;
    }

    if ((v12 & 0x80) != 0) {
      operator delete(v45[0]);
    }
    unsigned int v8 = v33;
  }

  else
  {
    sub_B684(&v34, (char *)&unk_E96D);
  }

  if ((v34.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    int v22 = &v34;
  }
  else {
    int v22 = (std::string *)v34.__r_.__value_.__r.__words[0];
  }
  if ((v34.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    unint64_t v23 = v34.__r_.__value_.__s.__size_;
  }
  else {
    unint64_t v23 = v34.__r_.__value_.__l.__size_;
  }
  unsigned int v24 = sub_8E74((void *)a3, v22, v23);
  uint64_t Range = CSRegionGetRange(a1, a2);
  uint64_t v27 = v26;
  sub_6E54(a3);
  *(_BYTE *)(a3 + 70) = 1;
  int v28 = *(_DWORD *)(a3 + 32);
  int v29 = *(_DWORD *)(a3 + 48);
  int v30 = *(_DWORD *)(a3 + 40);
  sub_6E7C(a3, 6LL, Range, -1LL);
  sub_6E7C(a3, 8LL, v27, 0LL);
  sub_7140((_DWORD *)a3, 4LL, v24);
  sub_7140((_DWORD *)a3, 22LL, v8);
  uint64_t v31 = sub_72B0(a3, v28 - v29 + v30);
  _Block_object_dispose(&v36, 8);
  if (__p)
  {
    v43 = __p;
    operator delete(__p);
  }

  return v31;
}

void sub_6B18( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *a29, uint64_t a30)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Block_object_dispose(&a23, 8);
  if (a29)
  {
    a30 = (uint64_t)a29;
    operator delete(a29);
  }

  _Unwind_Resume(a1);
}

const char *sub_6B94(const char *result, void *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    size_t v4 = strlen(result);
    return (const char *)sub_8E74(a2, v3, v4);
  }

  return result;
}

uint64_t sub_6BCC(unint64_t a1, unint64_t a2)
{
  int v3 = a1;
  unint64_t v4 = HIDWORD(a1);
  sub_6E54(a2);
  *(_BYTE *)(a2 + 70) = 1;
  int v5 = *(_DWORD *)(a2 + 32) - *(_DWORD *)(a2 + 48) + *(_DWORD *)(a2 + 40);
  sub_7180(a2, 6LL, v3, 0);
  sub_7180(a2, 8LL, v4, 0);
  return sub_72B0(a2, v5);
}

__n128 sub_6C4C(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0LL;
  a1[3].n128_u64[1] = 0LL;
  a1[4].n128_u64[0] = 0LL;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0LL;
  a2[3].n128_u64[1] = 0LL;
  a2[4].n128_u64[0] = 0LL;
  return result;
}

void sub_6C70(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }

void sub_6C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = sub_6D88(a2, a3, *(void *)(a1 + 40));
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8LL);
    uint64_t v7 = (char *)v6[7];
    unint64_t v8 = v6[8];
    if ((unint64_t)v7 >= v8)
    {
      unsigned int v10 = (char *)v6[6];
      uint64_t v11 = (v7 - v10) >> 2;
      unint64_t v12 = v8 - (void)v10;
      unint64_t v13 = (uint64_t)(v8 - (void)v10) >> 1;
      if (v13 <= v11 + 1) {
        unint64_t v13 = v11 + 1;
      }
      if (v12 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14)
      {
        int v15 = (char *)sub_750C((uint64_t)(v6 + 8), v14);
        unsigned int v10 = (char *)v6[6];
        uint64_t v7 = (char *)v6[7];
      }

      else
      {
        int v15 = 0LL;
      }

      int v16 = &v15[4 * v11];
      uint64_t v17 = &v15[4 * v14];
      *(_DWORD *)int v16 = v5;
      uint64_t v9 = v16 + 4;
      while (v7 != v10)
      {
        int v18 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v16 - 1) = v18;
        v16 -= 4;
      }

      v6[6] = v16;
      v6[7] = v9;
      v6[8] = v17;
      if (v10) {
        operator delete(v10);
      }
    }

    else
    {
      *(_DWORD *)uint64_t v7 = v4;
      uint64_t v9 = v7 + 4;
    }

    v6[7] = v9;
  }

uint64_t sub_6D88(uint64_t a1, uint64_t a2, unint64_t a3)
{
  Name = (const char *)CSRegionGetName();
  size_t v7 = strlen(Name);
  LODWORD(Name) = sub_8E74((void *)a3, Name, v7);
  uint64_t Range = CSRegionGetRange(a1, a2);
  uint64_t v10 = v9;
  sub_6E54(a3);
  *(_BYTE *)(a3 + 70) = 1;
  int v11 = *(_DWORD *)(a3 + 32) - *(_DWORD *)(a3 + 48) + *(_DWORD *)(a3 + 40);
  sub_6E7C(a3, 6LL, Range, -1LL);
  sub_6E7C(a3, 8LL, v10, 0LL);
  sub_7140((_DWORD *)a3, 4LL, Name);
  return sub_72B0(a3, v11);
}

uint64_t sub_6E54(uint64_t result)
{
  if (*(_BYTE *)(result + 70)) {
    sub_D318();
  }
  if (*(_DWORD *)(result + 64)) {
    sub_D2F0();
  }
  return result;
}

unint64_t sub_6E7C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 != a4 || *(_BYTE *)(result + 80))
  {
    unsigned int v6 = sub_6F08(result, a3);
    __n128 result = sub_6FDC(v5, 8uLL);
    **(void **)(v5 + 56) = v6 | (unint64_t)(a2 << 32);
    *(void *)(v5 + 56) += 8LL;
    ++*(_DWORD *)(v5 + 64);
    unsigned int v7 = *(unsigned __int16 *)(v5 + 68);
    *(_WORD *)(v5 + 68) = v7;
  }

  return result;
}

uint64_t sub_6F08(uint64_t a1, uint64_t a2)
{
  int v4 = (void *)(*(void *)(a1 + 48) - sub_6FDC(a1, 8uLL));
  *(void *)(a1 + 48) = v4;
  *int v4 = a2;
  return (*(_DWORD *)(a1 + 32) - (_DWORD)v4 + *(_DWORD *)(a1 + 40));
}

unint64_t sub_6F5C(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 72) < a2) {
    *(void *)(a1 + 72) = a2;
  }
  return sub_6F90( a1,  (a2 - 1) & -(uint64_t)(*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40)));
}

unint64_t sub_6F90(uint64_t a1, unint64_t a2)
{
  unint64_t result = sub_6FDC(a1, a2);
  *(void *)(a1 + 48) -= result;
  if (a2)
  {
    uint64_t v5 = 0LL;
    do
      *(_BYTE *)(*(void *)(a1 + 48) + v5++) = 0;
    while (a2 != v5);
  }

  return result;
}

unint64_t sub_6FDC(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 48);
  unint64_t v3 = *(void *)(a1 + 56);
  if (v2 < v3 || (unint64_t v5 = *(void *)(a1 + 40), v3 < v5)) {
    sub_D340();
  }
  if (v2 - v3 < a2)
  {
    sub_7050((uint64_t *)a1, a2);
    unint64_t v5 = *(void *)(a1 + 40);
    unint64_t v2 = *(void *)(a1 + 48);
  }

  return a2;
}

char *sub_7050(uint64_t *a1, unint64_t a2)
{
  unint64_t v5 = a1[4];
  int v4 = (char *)a1[5];
  unsigned int v6 = &v4[v5 - a1[6]];
  uint64_t v7 = a1[7] - (void)v4;
  if (v5) {
    unint64_t v8 = v5 >> 1;
  }
  else {
    unint64_t v8 = a1[2];
  }
  if (v8 > a2) {
    a2 = v8;
  }
  uint64_t v9 = a1[3];
  uint64_t v10 = v9 + v5 + a2 - 1;
  uint64_t v11 = -v9;
  unint64_t v12 = v10 & v11;
  a1[4] = v10 & v11;
  uint64_t v13 = *a1;
  if (v4)
  {
    if (v13)
    {
      unint64_t result = (char *)(*(uint64_t (**)(uint64_t))(*(void *)v13 + 32LL))(v13);
    }

    else
    {
      int v16 = &off_10538;
      unint64_t result = sub_65C8((uint64_t)&v16, v4, v5, v12, v6, v7);
    }
  }

  else if (v13)
  {
    unint64_t result = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v13 + 16LL))(v13, v12);
  }

  else
  {
    unint64_t result = (char *)operator new[](v10 & v11);
  }

  int v15 = &result[a1[4] - v6];
  a1[5] = (uint64_t)result;
  a1[6] = (uint64_t)v15;
  a1[7] = (uint64_t)&result[v7];
  return result;
}

_DWORD *sub_7140(_DWORD *result, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    unint64_t v4 = (unint64_t)result;
    int v5 = sub_720C(result, a3);
    return (_DWORD *)sub_7180(v4, a2, v5, 0);
  }

  return result;
}

unint64_t sub_7180(unint64_t result, uint64_t a2, int a3, int a4)
{
  uint64_t v5 = result;
  if (a3 != a4 || *(_BYTE *)(result + 80))
  {
    unsigned int v6 = sub_725C(result, a3);
    unint64_t result = sub_6FDC(v5, 8uLL);
    **(void **)(v5 + 56) = v6 | (unint64_t)(a2 << 32);
    *(void *)(v5 + 56) += 8LL;
    ++*(_DWORD *)(v5 + 64);
    unsigned int v7 = *(unsigned __int16 *)(v5 + 68);
    *(_WORD *)(v5 + 68) = v7;
  }

  return result;
}

uint64_t sub_720C(_DWORD *a1, unsigned int a2)
{
  if (!a2 || (unsigned int v4 = a1[8] - a1[12] + a1[10], v5 = v4 >= a2, v6 = v4 - a2, !v5)) {
    sub_D390();
  }
  return v6 + 4;
}

uint64_t sub_725C(uint64_t a1, int a2)
{
  unsigned int v4 = (_DWORD *)(*(void *)(a1 + 48) - sub_6FDC(a1, 4uLL));
  *(void *)(a1 + 48) = v4;
  *unsigned int v4 = a2;
  return (*(_DWORD *)(a1 + 32) - (_DWORD)v4 + *(_DWORD *)(a1 + 40));
}

uint64_t sub_72B0(uint64_t a1, int a2)
{
  if (!*(_BYTE *)(a1 + 70)) {
    sub_D3B8();
  }
  uint64_t v4 = sub_725C(a1, 0);
  else {
    unint64_t v5 = (unsigned __int16)(*(_WORD *)(a1 + 68) + 2);
  }
  *(_WORD *)(a1 + 68) = v5;
  unsigned int v6 = (void *)(*(void *)(a1 + 48) - sub_6FDC(a1, v5));
  *(void *)(a1 + 48) = v6;
  bzero(v6, v5);
  unsigned __int16 v7 = v4 - a2;
  unint64_t v8 = *(unsigned __int16 **)(a1 + 48);
  if (!v8) {
    sub_D2A0();
  }
  v8[1] = v7;
  *unint64_t v8 = *(_WORD *)(a1 + 68);
  unint64_t v9 = *(void *)(a1 + 56);
  if (!v9) {
    sub_D408();
  }
  uint64_t v10 = *(unsigned int *)(a1 + 64);
  unint64_t v11 = v9 - 8 * v10;
  if ((_DWORD)v10)
  {
    unint64_t v12 = (int *)(v9 - 8 * v10);
    do
    {
      uint64_t v13 = *((unsigned __int16 *)v12 + 2);
      int v14 = *v12;
      v12 += 2;
      *(unsigned __int16 *)((char *)v8 + v13) = v4 - v14;
    }

    while ((unint64_t)v12 < v9);
  }

  *(void *)(a1 + 56) = v11;
  *(_DWORD *)(a1 + 64) = 0;
  *(_WORD *)(a1 + 68) = 0;
  uint64_t v16 = *(void *)(a1 + 32);
  unint64_t v15 = *(void *)(a1 + 40);
  int v17 = v16 - (_DWORD)v8 + v15;
  if (*(_BYTE *)(a1 + 81))
  {
    if (!v15) {
      sub_D430();
    }
    if (v15 < v11)
    {
      size_t v18 = *v8;
      uint64_t v19 = v15 + v16;
      int v20 = *(unsigned int **)(a1 + 40);
      while (1)
      {
        uint64_t v21 = *v20;
        if ((unint64_t)++v20 >= v11)
        {
          int v17 = v16 - (_DWORD)v8 + v15;
          goto LABEL_21;
        }
      }

      unint64_t v8 = (unsigned __int16 *)((char *)v8 + (v16 - (_DWORD)v8 + v15 - v4));
      *(void *)(a1 + 48) = v8;
      int v17 = v21;
    }
  }

LABEL_21:
  if (v17 == (_DWORD)v16 + (_DWORD)v15 - (_DWORD)v8)
  {
    sub_6FDC(a1, 4uLL);
    int v22 = *(_DWORD **)(a1 + 56);
    *int v22 = v17;
    *(void *)(a1 + 56) = v22 + 1;
    uint64_t v16 = *(void *)(a1 + 32);
    unint64_t v15 = *(void *)(a1 + 40);
  }

  *(_DWORD *)(v15 + v16 - v4) = v17 - v4;
  *(_BYTE *)(a1 + 70) = 0;
  return v4;
}

void sub_7484()
{
}

void sub_7498(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_74E8(exception, a1);
}

void sub_74D4(_Unwind_Exception *a1)
{
}

std::logic_error *sub_74E8(std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_750C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_7540();
  }
  return operator new(4 * a2);
}

void sub_7540()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_7568(_DWORD *a1, uint64_t a2, unint64_t a3)
{
  unsigned int v6 = (unsigned int *)(a2 + 4 * a3);
  uint64_t v10 = a1;
  unint64_t v7 = 126 - 2 * __clz(a3);
  if (a3) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0LL;
  }
  sub_75D8(a2, v6, (uint64_t)&v10, v8, 1);
  return sub_5494(a1, a2, a3);
}

uint64_t sub_75D8(uint64_t result, unsigned int *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v8 = (unsigned int *)result;
LABEL_2:
  unint64_t v9 = v8;
LABEL_3:
  uint64_t v10 = 1 - a4;
  while (2)
  {
    uint64_t v8 = v9;
    uint64_t v11 = v10;
    uint64_t v12 = (char *)a2 - (char *)v9;
    unint64_t v13 = a2 - v9;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        uint64_t v21 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
        unint64_t result = sub_8090((int *)(v21 - *(a2 - 1)), (int *)(v21 - *v9));
        if ((_DWORD)result)
        {
          unsigned int v22 = *v9;
          unsigned int *v9 = *(a2 - 1);
          *(a2 - 1) = v22;
        }

        return result;
      case 3uLL:
        return sub_7AD0(v9, v9 + 1, a2 - 1, a3);
      case 4uLL:
        return sub_80EC(v9, v9 + 1, v9 + 2, a2 - 1, a3);
      case 5uLL:
        return sub_81CC(v9, v9 + 1, v9 + 2, v9 + 3, a2 - 1, a3);
      default:
        if (v12 <= 95)
        {
          if ((a5 & 1) != 0) {
            return (uint64_t)sub_793C(v9, a2, a3);
          }
          else {
            return (uint64_t)sub_7A1C(v9, a2, a3);
          }
        }

        if (v11 != 1)
        {
          unint64_t v14 = v13 >> 1;
          unint64_t v15 = &v9[v13 >> 1];
          if ((unint64_t)v12 < 0x201)
          {
            sub_7AD0(&v9[v13 >> 1], v9, a2 - 1, a3);
            if ((a5 & 1) != 0) {
              goto LABEL_12;
            }
          }

          else
          {
            sub_7AD0(v9, &v9[v13 >> 1], a2 - 1, a3);
            sub_7AD0(v9 + 1, v15 - 1, a2 - 2, a3);
            sub_7AD0(v9 + 2, &v9[v14 + 1], a2 - 3, a3);
            sub_7AD0(v15 - 1, v15, &v9[v14 + 1], a3);
            unsigned int v16 = *v9;
            unsigned int *v9 = *v15;
            unsigned int *v15 = v16;
            if ((a5 & 1) != 0) {
              goto LABEL_12;
            }
          }

          uint64_t v17 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
          if (!sub_8090((int *)(v17 - *(v9 - 1)), (int *)(v17 - *v9)))
          {
            unint64_t result = (uint64_t)sub_7BFC(v9, a2, a3);
            unint64_t v9 = (unsigned int *)result;
            goto LABEL_17;
          }

unsigned int *sub_793C(unsigned int *result, unsigned int *a2, uint64_t a3)
{
  if (result != a2)
  {
    uint64_t v4 = result;
    unint64_t v5 = result + 1;
    if (result + 1 != a2)
    {
      uint64_t v7 = 0LL;
      uint64_t v8 = result;
      do
      {
        uint64_t v10 = *v8;
        uint64_t v9 = v8[1];
        uint64_t v8 = v5;
        uint64_t v11 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
        unint64_t result = (unsigned int *)sub_8090((int *)(v11 - v9), (int *)(v11 - v10));
        if ((_DWORD)result)
        {
          uint64_t v12 = *v8;
          uint64_t v13 = v7;
          while (1)
          {
            *(_DWORD *)((char *)v4 + v13 + 4) = *(_DWORD *)((char *)v4 + v13);
            if (!v13) {
              break;
            }
            uint64_t v14 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
            unint64_t result = (unsigned int *)sub_8090( (int *)(v14 - v12),  (int *)(v14 - *(unsigned int *)((char *)v4 + v13 - 4)));
            v13 -= 4LL;
            if ((result & 1) == 0)
            {
              unint64_t v15 = (_DWORD *)((char *)v4 + v13 + 4);
              goto LABEL_10;
            }
          }

          unint64_t v15 = v4;
LABEL_10:
          _DWORD *v15 = v12;
        }

        unint64_t v5 = v8 + 1;
        v7 += 4LL;
      }

      while (v8 + 1 != a2);
    }
  }

  return result;
}

unsigned int *sub_7A1C(unsigned int *result, unsigned int *a2, uint64_t a3)
{
  if (result != a2)
  {
    uint64_t v4 = result;
    for (i = result + 1; v4 + 1 != a2; i = v4 + 1)
    {
      uint64_t v8 = *v4;
      uint64_t v7 = v4[1];
      uint64_t v4 = i;
      uint64_t v9 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
      unint64_t result = (unsigned int *)sub_8090((int *)(v9 - v7), (int *)(v9 - v8));
      if ((_DWORD)result)
      {
        uint64_t v10 = *v4;
        uint64_t v11 = v4;
        do
        {
          uint64_t v12 = v11;
          unsigned int v13 = *--v11;
          unsigned int *v12 = v13;
          uint64_t v14 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
          unint64_t result = (unsigned int *)sub_8090((int *)(v14 - v10), (int *)(v14 - *(v12 - 2)));
        }

        while ((result & 1) != 0);
        unsigned int *v11 = v10;
      }
    }
  }

  return result;
}

uint64_t sub_7AD0(unsigned int *a1, unsigned int *a2, unsigned int *a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(*(void *)a4 + 40LL) + *(void *)(*(void *)a4 + 32LL);
  BOOL v9 = sub_8090((int *)(v8 - *a2), (int *)(v8 - *a1));
  uint64_t v10 = *(void *)(*(void *)a4 + 40LL) + *(void *)(*(void *)a4 + 32LL);
  uint64_t result = sub_8090((int *)(v10 - *a3), (int *)(v10 - *a2));
  if (!v9)
  {
    if (!(_DWORD)result) {
      return result;
    }
    unsigned int v13 = *a2;
    *a2 = *a3;
    *a3 = v13;
    uint64_t v14 = *(void *)(*(void *)a4 + 40LL) + *(void *)(*(void *)a4 + 32LL);
    unsigned int v15 = *a1;
    *a1 = *a2;
    *a2 = v15;
    return 2LL;
  }

  uint64_t v12 = *a1;
  if (!(_DWORD)result)
  {
    *a1 = *a2;
    *a2 = v12;
    uint64_t v16 = *(void *)(*(void *)a4 + 40LL) + *(void *)(*(void *)a4 + 32LL);
    unsigned int v17 = *a2;
    *a2 = *a3;
    *a3 = v17;
    return 2LL;
  }

  *a1 = *a3;
  *a3 = v12;
  return 1LL;
}

unsigned int *sub_7BFC(unsigned int *a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = *a1;
  uint64_t v7 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
  if (sub_8090((int *)(v7 - v6), (int *)(v7 - *(a2 - 1))))
  {
    uint64_t v8 = a1;
    do
    {
      unsigned int v9 = v8[1];
      ++v8;
      uint64_t v10 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
    }

    while (!sub_8090((int *)(v10 - v6), (int *)(v10 - v9)));
  }

  else
  {
    uint64_t v11 = a1 + 1;
    do
    {
      uint64_t v8 = v11;
      if (v11 >= v4) {
        break;
      }
      uint64_t v12 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
      ++v11;
    }

    while (!sub_8090((int *)(v12 - v6), (int *)(v12 - *v8)));
  }

  if (v8 < v4)
  {
    do
    {
      unsigned int v13 = *--v4;
      uint64_t v14 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
    }

    while (sub_8090((int *)(v14 - v6), (int *)(v14 - v13)));
  }

  while (v8 < v4)
  {
    unsigned int v15 = *v8;
    *uint64_t v8 = *v4;
    *uint64_t v4 = v15;
    do
    {
      unsigned int v16 = v8[1];
      ++v8;
      uint64_t v17 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
    }

    while (!sub_8090((int *)(v17 - v6), (int *)(v17 - v16)));
    do
    {
      unsigned int v18 = *--v4;
      uint64_t v19 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
    }

    while (sub_8090((int *)(v19 - v6), (int *)(v19 - v18)));
  }

  if (v8 - 1 != a1) {
    *a1 = *(v8 - 1);
  }
  *(v8 - 1) = v6;
  return v8;
}

int *sub_7D5C(int *a1, int *a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = *a1;
  do
    uint64_t v8 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
  while (sub_8090((int *)(v8 - a1[++v6]), (int *)(v8 - v7)));
  uint64_t v10 = &a1[v6];
  uint64_t v11 = &a1[v6 - 1];
  if (v6 == 1)
  {
    do
    {
      if (v10 >= a2) {
        break;
      }
      unsigned int v14 = *--a2;
      uint64_t v15 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
    }

    while (!sub_8090((int *)(v15 - v14), (int *)(v15 - v7)));
  }

  else
  {
    do
    {
      unsigned int v12 = *--a2;
      uint64_t v13 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
    }

    while (!sub_8090((int *)(v13 - v12), (int *)(v13 - v7)));
  }

  if (v10 < a2)
  {
    unsigned int v16 = &a1[v6];
    uint64_t v17 = a2;
    do
    {
      int v18 = *v16;
      *unsigned int v16 = *v17;
      *uint64_t v17 = v18;
      do
      {
        unsigned int v19 = v16[1];
        ++v16;
        uint64_t v20 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
      }

      while (sub_8090((int *)(v20 - v19), (int *)(v20 - v7)));
      do
      {
        unsigned int v21 = *--v17;
        uint64_t v22 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
      }

      while (!sub_8090((int *)(v22 - v21), (int *)(v22 - v7)));
    }

    while (v16 < v17);
    uint64_t v11 = v16 - 1;
  }

  if (v11 != a1) {
    *a1 = *v11;
  }
  int *v11 = v7;
  return v11;
}

BOOL sub_7EB4(unsigned int *a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1LL;
  switch(v6)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      uint64_t v8 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
      if (sub_8090((int *)(v8 - *(a2 - 1)), (int *)(v8 - *a1)))
      {
        unsigned int v9 = *a1;
        *a1 = *(a2 - 1);
        *(a2 - 1) = v9;
      }

      return 1LL;
    case 3LL:
      sub_7AD0(a1, a1 + 1, a2 - 1, a3);
      return 1LL;
    case 4LL:
      sub_80EC(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1LL;
    case 5LL:
      sub_81CC(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1LL;
    default:
      uint64_t v10 = a1 + 2;
      sub_7AD0(a1, a1 + 1, a1 + 2, a3);
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
    uint64_t v14 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
    if (sub_8090((int *)(v14 - *v11), (int *)(v14 - *v10)))
    {
      uint64_t v15 = *v11;
      uint64_t v16 = v12;
      while (1)
      {
        *(unsigned int *)((char *)a1 + v16 + 12) = *(unsigned int *)((char *)a1 + v16 + 8);
        if (v16 == -8) {
          break;
        }
        uint64_t v17 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
        BOOL v18 = sub_8090((int *)(v17 - v15), (int *)(v17 - *(unsigned int *)((char *)a1 + v16 + 4)));
        v16 -= 4LL;
        if (!v18)
        {
          unsigned int v19 = (unsigned int *)((char *)a1 + v16 + 12);
          goto LABEL_12;
        }
      }

      unsigned int v19 = a1;
LABEL_12:
      *unsigned int v19 = v15;
      if (++v13 == 8) {
        return v11 + 1 == a2;
      }
    }

    uint64_t v10 = v11;
    v12 += 4LL;
    if (++v11 == a2) {
      return 1LL;
    }
  }

BOOL sub_8090(int *a1, int *a2)
{
  unint64_t v2 = (unsigned __int16 *)((char *)a1 - *a1);
  if (*v2 >= 7u && (uint64_t v3 = v2[3]) != 0) {
    unint64_t v4 = *(void *)((char *)a1 + v3);
  }
  else {
    unint64_t v4 = -1LL;
  }
  unint64_t v5 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v5 >= 7u && (uint64_t v6 = v5[3]) != 0) {
    unint64_t v7 = *(void *)((char *)a2 + v6);
  }
  else {
    unint64_t v7 = -1LL;
  }
  return v4 < v7;
}

BOOL sub_80EC(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4, uint64_t a5)
{
  uint64_t v10 = *(void *)(*(void *)a5 + 40LL) + *(void *)(*(void *)a5 + 32LL);
  BOOL result = sub_8090((int *)(v10 - *a4), (int *)(v10 - *a3));
  if (result)
  {
    unsigned int v12 = *a3;
    *a3 = *a4;
    *a4 = v12;
    uint64_t v13 = *(void *)(*(void *)a5 + 40LL) + *(void *)(*(void *)a5 + 32LL);
    BOOL result = sub_8090((int *)(v13 - *a3), (int *)(v13 - *a2));
    if (result)
    {
      unsigned int v14 = *a2;
      *a2 = *a3;
      *a3 = v14;
      uint64_t v15 = *(void *)(*(void *)a5 + 40LL) + *(void *)(*(void *)a5 + 32LL);
      BOOL result = sub_8090((int *)(v15 - *a2), (int *)(v15 - *a1));
      if (result)
      {
        unsigned int v16 = *a1;
        *a1 = *a2;
        *a2 = v16;
      }
    }
  }

  return result;
}

BOOL sub_81CC( unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4, unsigned int *a5, uint64_t a6)
{
  uint64_t v12 = *(void *)(*(void *)a6 + 40LL) + *(void *)(*(void *)a6 + 32LL);
  BOOL result = sub_8090((int *)(v12 - *a5), (int *)(v12 - *a4));
  if (result)
  {
    unsigned int v14 = *a4;
    *a4 = *a5;
    *a5 = v14;
    uint64_t v15 = *(void *)(*(void *)a6 + 40LL) + *(void *)(*(void *)a6 + 32LL);
    BOOL result = sub_8090((int *)(v15 - *a4), (int *)(v15 - *a3));
    if (result)
    {
      unsigned int v16 = *a3;
      *a3 = *a4;
      *a4 = v16;
      uint64_t v17 = *(void *)(*(void *)a6 + 40LL) + *(void *)(*(void *)a6 + 32LL);
      BOOL result = sub_8090((int *)(v17 - *a3), (int *)(v17 - *a2));
      if (result)
      {
        unsigned int v18 = *a2;
        *a2 = *a3;
        *a3 = v18;
        uint64_t v19 = *(void *)(*(void *)a6 + 40LL) + *(void *)(*(void *)a6 + 32LL);
        BOOL result = sub_8090((int *)(v19 - *a2), (int *)(v19 - *a1));
        if (result)
        {
          unsigned int v20 = *a1;
          *a1 = *a2;
          *a2 = v20;
        }
      }
    }
  }

  return result;
}

unsigned int *sub_82E4(unsigned int *a1, unsigned int *a2, unsigned int *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 5)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = &a1[v10];
      do
      {
        sub_8448((BOOL)a1, a4, v9, v12--);
        --v11;
      }

      while (v11);
    }

    uint64_t v13 = a2;
    if (a2 != a3)
    {
      unsigned int v14 = a2;
      do
      {
        uint64_t v15 = *(void *)(*(void *)a4 + 40LL) + *(void *)(*(void *)a4 + 32LL);
        if (sub_8090((int *)(v15 - *v14), (int *)(v15 - *a1)))
        {
          unsigned int v16 = *v14;
          unsigned int *v14 = *a1;
          *a1 = v16;
          sub_8448((BOOL)a1, a4, v9, a1);
        }

        ++v14;
      }

      while (v14 != a3);
      uint64_t v13 = a3;
    }

    if (v8 >= 5)
    {
      uint64_t v17 = (unint64_t)v8 >> 2;
      unsigned int v18 = a2 - 1;
      do
      {
        unsigned int v19 = *a1;
        unsigned int v20 = sub_85B8(a1, a4, v17);
        if (v18 == v20)
        {
          *unsigned int v20 = v19;
        }

        else
        {
          *unsigned int v20 = *v18;
          *unsigned int v18 = v19;
          sub_8674((BOOL)a1, (uint64_t)(v20 + 1), a4, v20 + 1 - a1);
        }

        --v18;
      }

      while (v17-- > 2);
    }

    return v13;
  }

  return a3;
}

BOOL sub_8448(BOOL result, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    unint64_t v5 = a4;
    BOOL v6 = result;
    int64_t v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 2)
    {
      uint64_t v10 = ((uint64_t)a4 - result) >> 1;
      uint64_t v11 = v10 + 1;
      uint64_t v12 = (unsigned int *)(result + 4 * (v10 + 1));
      uint64_t v13 = v10 + 2;
      if (v10 + 2 < a3)
      {
        uint64_t v14 = *(void *)(*(void *)a2 + 40LL) + *(void *)(*(void *)a2 + 32LL);
        if (sub_8090((int *)(v14 - *v12), (int *)(v14 - v12[1])))
        {
          ++v12;
          uint64_t v11 = v13;
        }
      }

      uint64_t v15 = *(void *)(*(void *)a2 + 40LL) + *(void *)(*(void *)a2 + 32LL);
      BOOL result = sub_8090((int *)(v15 - *v12), (int *)(v15 - *v5));
      if (!result)
      {
        uint64_t v21 = *v5;
        do
        {
          unsigned int v16 = v5;
          unint64_t v5 = v12;
          *unsigned int v16 = *v12;
          if (v7 < v11) {
            break;
          }
          uint64_t v17 = (2 * v11) | 1;
          uint64_t v12 = (unsigned int *)(v6 + 4 * v17);
          uint64_t v18 = 2 * v11 + 2;
          if (v18 < a3)
          {
            uint64_t v19 = *(void *)(*(void *)a2 + 40LL) + *(void *)(*(void *)a2 + 32LL);
            if (sub_8090((int *)(v19 - *v12), (int *)(v19 - v12[1])))
            {
              ++v12;
              uint64_t v17 = v18;
            }
          }

          uint64_t v20 = *(void *)(*(void *)a2 + 40LL) + *(void *)(*(void *)a2 + 32LL);
          BOOL result = sub_8090((int *)(v20 - *v12), (int *)(v20 - v21));
          uint64_t v11 = v17;
        }

        while (!result);
        *unint64_t v5 = v21;
      }
    }
  }

  return result;
}

unsigned int *sub_85B8(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = &a1[v6 + 1];
    uint64_t v10 = (2 * v6) | 1;
    uint64_t v11 = 2 * v6 + 2;
    if (v11 < a3)
    {
      uint64_t v12 = *(void *)(*(void *)a2 + 40LL) + *(void *)(*(void *)a2 + 32LL);
      if (sub_8090((int *)(v12 - *v9), (int *)(v12 - v9[1])))
      {
        ++v9;
        uint64_t v10 = v11;
      }
    }

    *a1 = *v9;
    a1 = v9;
    uint64_t v6 = v10;
  }

  while (v10 <= v8);
  return v9;
}

BOOL sub_8674(BOOL result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    BOOL v6 = result;
    unint64_t v7 = v4 >> 1;
    uint64_t v8 = (_DWORD *)(result + 4 * (v4 >> 1));
    uint64_t v9 = (_DWORD *)(a2 - 4);
    uint64_t v10 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
    BOOL result = sub_8090((int *)(v10 - *v8), (int *)(v10 - *(unsigned int *)(a2 - 4)));
    if (result)
    {
      uint64_t v11 = *v9;
      do
      {
        uint64_t v12 = v9;
        uint64_t v9 = v8;
        _DWORD *v12 = *v8;
        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
        uint64_t v8 = (_DWORD *)(v6 + 4 * v7);
        uint64_t v13 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
        BOOL result = sub_8090((int *)(v13 - *v8), (int *)(v13 - v11));
      }

      while (result);
      _DWORD *v9 = v11;
    }
  }

  return result;
}

unint64_t sub_8730(uint64_t a1, uint64_t a2, unint64_t a3)
{
  *(_BYTE *)(a1 + 70) = 1;
  uint64_t v6 = a3 * a2;
  sub_87A8(a1, v6, 4uLL);
  return sub_87A8(a1, v6, a3);
}

uint64_t sub_8788(uint64_t a1, int a2)
{
  if (!*(_BYTE *)(a1 + 70)) {
    sub_D480();
  }
  *(_BYTE *)(a1 + 70) = 0;
  return sub_725C(a1, a2);
}

unint64_t sub_87A8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(void *)(a1 + 72) < a3) {
    *(void *)(a1 + 72) = a3;
  }
  return sub_6F90( a1,  (a3 - 1) & (-a2 - (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40))));
}

uint64_t sub_87E0(_DWORD *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = (unsigned int *)(a2 + 4 * a3);
  uint64_t v10 = a1;
  unint64_t v7 = 126 - 2 * __clz(a3);
  if (a3) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0LL;
  }
  sub_8850(a2, v6, (uint64_t)&v10, v8, 1);
  return sub_5494(a1, a2, a3);
}

uint64_t sub_8850(uint64_t result, unsigned int *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v8 = (unsigned int *)result;
LABEL_2:
  uint64_t v9 = v8;
LABEL_3:
  uint64_t v10 = 1 - a4;
  while (2)
  {
    uint64_t v8 = v9;
    uint64_t v11 = v10;
    uint64_t v12 = (char *)a2 - (char *)v9;
    unint64_t v13 = a2 - v9;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        uint64_t v21 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
        BOOL result = sub_8090((int *)(v21 - *(a2 - 1)), (int *)(v21 - *v9));
        if ((_DWORD)result)
        {
          unsigned int v22 = *v9;
          unsigned int *v9 = *(a2 - 1);
          *(a2 - 1) = v22;
        }

        return result;
      case 3uLL:
        return sub_7AD0(v9, v9 + 1, a2 - 1, a3);
      case 4uLL:
        return sub_80EC(v9, v9 + 1, v9 + 2, a2 - 1, a3);
      case 5uLL:
        return sub_81CC(v9, v9 + 1, v9 + 2, v9 + 3, a2 - 1, a3);
      default:
        if (v12 <= 95)
        {
          if ((a5 & 1) != 0) {
            return (uint64_t)sub_793C(v9, a2, a3);
          }
          else {
            return (uint64_t)sub_7A1C(v9, a2, a3);
          }
        }

        if (v11 != 1)
        {
          unint64_t v14 = v13 >> 1;
          uint64_t v15 = &v9[v13 >> 1];
          if ((unint64_t)v12 < 0x201)
          {
            sub_7AD0(&v9[v13 >> 1], v9, a2 - 1, a3);
            if ((a5 & 1) != 0) {
              goto LABEL_12;
            }
          }

          else
          {
            sub_7AD0(v9, &v9[v13 >> 1], a2 - 1, a3);
            sub_7AD0(v9 + 1, v15 - 1, a2 - 2, a3);
            sub_7AD0(v9 + 2, &v9[v14 + 1], a2 - 3, a3);
            sub_7AD0(v15 - 1, v15, &v9[v14 + 1], a3);
            unsigned int v16 = *v9;
            unsigned int *v9 = *v15;
            unsigned int *v15 = v16;
            if ((a5 & 1) != 0) {
              goto LABEL_12;
            }
          }

          uint64_t v17 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
          if (!sub_8090((int *)(v17 - *(v9 - 1)), (int *)(v17 - *v9)))
          {
            BOOL result = (uint64_t)sub_7BFC(v9, a2, a3);
            uint64_t v9 = (unsigned int *)result;
            goto LABEL_17;
          }

BOOL sub_8BB4(unsigned int *a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1LL;
  switch(v6)
  {
    case 0LL:
    case 1LL:
      return result;
    case 2LL:
      uint64_t v8 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
      if (sub_8090((int *)(v8 - *(a2 - 1)), (int *)(v8 - *a1)))
      {
        unsigned int v9 = *a1;
        *a1 = *(a2 - 1);
        *(a2 - 1) = v9;
      }

      return 1LL;
    case 3LL:
      sub_7AD0(a1, a1 + 1, a2 - 1, a3);
      return 1LL;
    case 4LL:
      sub_80EC(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1LL;
    case 5LL:
      sub_81CC(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1LL;
    default:
      uint64_t v10 = a1 + 2;
      sub_7AD0(a1, a1 + 1, a1 + 2, a3);
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
    uint64_t v14 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
    if (sub_8090((int *)(v14 - *v11), (int *)(v14 - *v10)))
    {
      uint64_t v15 = *v11;
      uint64_t v16 = v12;
      while (1)
      {
        *(unsigned int *)((char *)a1 + v16 + 12) = *(unsigned int *)((char *)a1 + v16 + 8);
        if (v16 == -8) {
          break;
        }
        uint64_t v17 = *(void *)(*(void *)a3 + 40LL) + *(void *)(*(void *)a3 + 32LL);
        BOOL v18 = sub_8090((int *)(v17 - v15), (int *)(v17 - *(unsigned int *)((char *)a1 + v16 + 4)));
        v16 -= 4LL;
        if (!v18)
        {
          char v19 = (unsigned int *)((char *)a1 + v16 + 12);
          goto LABEL_12;
        }
      }

      char v19 = a1;
LABEL_12:
      *char v19 = v15;
      if (++v13 == 8) {
        return v11 + 1 == a2;
      }
    }

    uint64_t v10 = v11;
    v12 += 4LL;
    if (++v11 == a2) {
      return 1LL;
    }
  }

unint64_t sub_8D90(unint64_t result, uint64_t a2, int a3, int a4)
{
  uint64_t v5 = result;
  if (a3 != a4 || *(_BYTE *)(result + 80))
  {
    unsigned int v6 = sub_8E1C(result, a3);
    BOOL result = sub_6FDC(v5, 8uLL);
    **(void **)(v5 + 56) = v6 | (unint64_t)(a2 << 32);
    *(void *)(v5 + 56) += 8LL;
    ++*(_DWORD *)(v5 + 64);
    unsigned int v7 = *(unsigned __int16 *)(v5 + 68);
    *(_WORD *)(v5 + 68) = v7;
  }

  return result;
}

uint64_t sub_8E1C(uint64_t a1, char a2)
{
  unint64_t v4 = (_BYTE *)(*(void *)(a1 + 48) - sub_6FDC(a1, 1uLL));
  *(void *)(a1 + 48) = v4;
  *unint64_t v4 = a2;
  return (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40));
}

uint64_t sub_8E74(void *a1, const void *a2, unint64_t a3)
{
  if (!a1[11])
  {
    unsigned int v6 = operator new(0x20uLL);
    v6[1] = 0LL;
    v6[2] = 0LL;
    v6[3] = a1;
    *unsigned int v6 = v6 + 1;
    a1[11] = v6;
  }

  uint64_t v8 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v9 = a1[4];
  unsigned int v14 = sub_8F54((uint64_t)a1, a2, a3);
  uint64_t v10 = sub_8FF8(a1[11], &v14);
  uint64_t v11 = (uint64_t **)a1[11];
  if (v11 + 1 == (uint64_t **)v10)
  {
    uint64_t v12 = &v14;
    sub_9128(v11, &v14, &v14);
  }

  else
  {
    a1[6] += *((_DWORD *)a1 + 8) + (_DWORD)v7 - ((_DWORD)v9 + (_DWORD)v8 + a1[6]) + *((_DWORD *)a1 + 10);
    uint64_t v12 = (unsigned int *)(v10 + 28);
  }

  return *v12;
}

uint64_t sub_8F54(uint64_t a1, const void *a2, unint64_t a3)
{
  unsigned int v6 = (_BYTE *)(*(void *)(a1 + 48) - sub_6FDC(a1, 1uLL));
  *(void *)(a1 + 48) = v6;
  *unsigned int v6 = 0;
  if (a3)
  {
    uint64_t v7 = (void *)(*(void *)(a1 + 48) - sub_6FDC(a1, a3));
    *(void *)(a1 + 48) = v7;
    memcpy(v7, a2, a3);
  }

  sub_725C(a1, a3);
  return (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40));
}

uint64_t sub_8FF8(uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = a1 + 8;
  uint64_t v5 = sub_9090(a1, a2, *(void *)(a1 + 8), a1 + 8);
  if (v4 == v5) {
    return v4;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 24) + 40LL) + *(void *)(*(void *)(a1 + 24) + 32LL);
  uint64_t v8 = (unsigned int *)(v7 - *a2);
  uint64_t v9 = *(unsigned int *)(v6 + 28);
  unsigned int v12 = *v8;
  uint64_t v10 = v8 + 1;
  unsigned int v11 = v12;
  unsigned int v13 = *(_DWORD *)(v7 - v9);
  size_t v14 = v13 >= v12 ? v11 : v13;
  int v15 = memcmp(v10, (const void *)(v7 - v9 + 4), v14);
  BOOL v16 = v11 < v13;
  if (v15) {
    BOOL v16 = v15 < 0;
  }
  if (v16) {
    return v4;
  }
  return v6;
}

uint64_t sub_9090(uint64_t a1, unsigned int *a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t v5 = a3;
    uint64_t v6 = *(void *)(*(void *)(a1 + 24) + 40LL) + *(void *)(*(void *)(a1 + 24) + 32LL);
    uint64_t v7 = *a2;
    uint64_t v8 = (const void *)(v6 - v7 + 4);
    unsigned int v9 = *(_DWORD *)(v6 - v7);
    do
    {
      uint64_t v10 = *(unsigned int *)(v5 + 28);
      unsigned int v11 = *(_DWORD *)(v6 - v10);
      if (v9 >= v11) {
        size_t v12 = v11;
      }
      else {
        size_t v12 = v9;
      }
      int v13 = memcmp((const void *)(v6 - v10 + 4), v8, v12);
      BOOL v14 = v11 < v9;
      if (v13) {
        BOOL v14 = v13 < 0;
      }
      BOOL v15 = !v14;
      if (v14) {
        BOOL v16 = (uint64_t *)(v5 + 8);
      }
      else {
        BOOL v16 = (uint64_t *)v5;
      }
      if (v15) {
        a4 = v5;
      }
      uint64_t v5 = *v16;
    }

    while (*v16);
  }

  return a4;
}

uint64_t *sub_9128(uint64_t **a1, unsigned int *a2, _DWORD *a3)
{
  uint64_t v5 = (void **)sub_91A8((uint64_t)a1, &v9, a2);
  uint64_t v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    uint64_t v6 = (uint64_t *)operator new(0x20uLL);
    *((_DWORD *)v6 + 7) = *a3;
    sub_92A4(a1, v9, v7, v6);
  }

  return v6;
}

void *sub_91A8(uint64_t a1, void *a2, unsigned int *a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 24) + 40LL) + *(void *)(*(void *)(a1 + 24) + 32LL);
    uint64_t v7 = (unsigned int *)(v6 - *a3);
    unsigned int v10 = *v7;
    uint64_t v8 = v7 + 1;
    unsigned int v9 = v10;
    do
    {
      while (1)
      {
        unsigned int v11 = (void *)v4;
        uint64_t v12 = *(unsigned int *)(v4 + 28);
        int v13 = (const void *)(v6 - v12 + 4);
        unsigned int v14 = *(_DWORD *)(v6 - v12);
        if (v14 >= v9) {
          size_t v15 = v9;
        }
        else {
          size_t v15 = v14;
        }
        int v16 = memcmp(v8, (const void *)(v6 - v12 + 4), v15);
        BOOL v17 = v9 < v14;
        if (v16) {
          BOOL v17 = v16 < 0;
        }
        if (!v17) {
          break;
        }
        uint64_t v4 = *v11;
        uint64_t v5 = v11;
        if (!*v11) {
          goto LABEL_17;
        }
      }

      int v18 = memcmp(v13, v8, v15);
      BOOL v19 = v14 < v9;
      if (v18) {
        BOOL v19 = v18 < 0;
      }
      if (!v19) {
        break;
      }
      uint64_t v5 = v11 + 1;
      uint64_t v4 = v11[1];
    }

    while (v4);
  }

  else
  {
    unsigned int v11 = (void *)(a1 + 8);
  }

LABEL_17:
  *a2 = v11;
  return v5;
}

uint64_t *sub_92A4(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }

  BOOL result = sub_92F8(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_92F8(uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      unint64_t v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unsigned int v9 = (uint64_t **)a2[2];
          }

          else
          {
            unsigned int v9 = (uint64_t **)v2[1];
            unsigned int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            unsigned int *v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            unint64_t v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *uint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }

      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }

          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }

        else
        {
          a2 = (uint64_t *)a2[2];
        }

        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        unint64_t v2 = (uint64_t *)v3[1];
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
      *uint64_t v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

uint64_t sub_9490(uint64_t a1, unsigned int a2, const char *a3, int a4)
{
  BOOL v8 = a3 != 0LL;
  sub_6E54(a1);
  *(void *)(a1 + 56) = *(void *)(a1 + 40);
  uint64_t v9 = 4LL;
  if (a4) {
    uint64_t v9 = 8LL;
  }
  sub_87A8(a1, v9 + 4LL * v8, *(void *)(a1 + 72));
  if (a3)
  {
    if (strlen(a3) != 4) {
      sub_D4A8();
    }
    unsigned int v10 = (_DWORD *)(*(void *)(a1 + 48) - sub_6FDC(a1, 4uLL));
    *(void *)(a1 + 48) = v10;
    _DWORD *v10 = *(_DWORD *)a3;
  }

  int v11 = sub_720C((_DWORD *)a1, a2);
  uint64_t result = sub_725C(a1, v11);
  if (a4) {
    uint64_t result = sub_725C(a1, *(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40));
  }
  *(_BYTE *)(a1 + 71) = 1;
  return result;
}

void sub_9574(uint64_t a1, uint64_t a2)
{
  int v3 = sub_9670(a2, *(void *)(a1 + 40));
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8LL);
    int v6 = (char *)v5[7];
    unint64_t v7 = v5[8];
    if ((unint64_t)v6 >= v7)
    {
      uint64_t v9 = (char *)v5[6];
      uint64_t v10 = (v6 - v9) >> 2;
      unint64_t v11 = v7 - (void)v9;
      unint64_t v12 = (uint64_t)(v7 - (void)v9) >> 1;
      if (v12 <= v10 + 1) {
        unint64_t v12 = v10 + 1;
      }
      if (v11 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v12;
      }
      if (v13)
      {
        unsigned int v14 = (char *)sub_750C((uint64_t)(v5 + 8), v13);
        uint64_t v9 = (char *)v5[6];
        int v6 = (char *)v5[7];
      }

      else
      {
        unsigned int v14 = 0LL;
      }

      size_t v15 = &v14[4 * v10];
      int v16 = &v14[4 * v13];
      *(_DWORD *)size_t v15 = v4;
      BOOL v8 = v15 + 4;
      while (v6 != v9)
      {
        int v17 = *((_DWORD *)v6 - 1);
        v6 -= 4;
        *((_DWORD *)v15 - 1) = v17;
        v15 -= 4;
      }

      v5[6] = v15;
      v5[7] = v8;
      v5[8] = v16;
      if (v9) {
        operator delete(v9);
      }
    }

    else
    {
      *(_DWORD *)int v6 = v3;
      BOOL v8 = v6 + 4;
    }

    v5[7] = v8;
  }

uint64_t sub_9670(uint64_t a1, unint64_t a2)
{
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x3812000000LL;
  v50 = sub_9AD4;
  v51 = nullsub_2;
  v52 = "";
  int v53 = 0;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x3812000000LL;
  v43 = sub_9AE4;
  uint64_t v44 = nullsub_3;
  uint64_t v45 = "";
  int v46 = 0;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_9AF4;
  v39[3] = &unk_105E0;
  v39[5] = &v40;
  v39[6] = a2;
  v39[4] = &v47;
  dyld_image_content_for_segment(a1, "__TEXT", v39);
  uint64_t v31 = 0LL;
  int v32 = &v31;
  uint64_t v33 = 0x5812000000LL;
  std::string v34 = sub_9B54;
  unsigned int v35 = sub_9B60;
  memset(v36, 0, sizeof(v36));
  uint64_t v37 = 0LL;
  int v38 = 1065353216;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_9B68;
  v30[3] = &unk_10608;
  v30[4] = &v31;
  dyld_image_for_each_section_info(a1, v30);
  uint64_t v21 = 0LL;
  unsigned int v22 = &v21;
  uint64_t v23 = 0x4812000000LL;
  unsigned int v24 = sub_66F0;
  unsigned int v25 = sub_6714;
  uint64_t v26 = "";
  __p = 0LL;
  int v28 = 0LL;
  uint64_t v29 = 0LL;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_9C88;
  v20[3] = &unk_10630;
  v20[5] = &v21;
  v20[6] = a2;
  v20[4] = &v31;
  dyld_image_for_each_segment_info(a1, v20);
  sub_B52C((uint64_t)(v32 + 6));
  uint64_t v4 = v22[6];
  uint64_t v5 = v22[7];
  if (v4 == v5)
  {
    uint64_t v18 = 0LL;
  }

  else
  {
    unsigned int v6 = sub_87E0((_DWORD *)a2, v4, (v5 - v4) >> 2);
    installname = (const char *)dyld_image_get_installname(a1);
    unsigned int v8 = sub_6B94(installname, (void *)a2);
    size_t v9 = strlen(out);
    unsigned int v10 = sub_8E74((void *)a2, out, v9);
    sub_6E54(a2);
    *(_BYTE *)(a2 + 70) = 1;
    int v11 = *(_DWORD *)(a2 + 32);
    int v12 = *(_DWORD *)(a2 + 48);
    int v13 = *(_DWORD *)(a2 + 40);
    sub_7140((_DWORD *)a2, 4LL, v10);
    sub_7140((_DWORD *)a2, 6LL, v8);
    sub_7140((_DWORD *)a2, 12LL, *((_DWORD *)v48 + 12));
    sub_7140((_DWORD *)a2, 14LL, *((_DWORD *)v41 + 12));
    unsigned int v14 = sub_72B0(a2, v11 - v12 + v13);
    sub_6E54(a2);
    *(_BYTE *)(a2 + 70) = 1;
    int v15 = *(_DWORD *)(a2 + 32);
    int v16 = *(_DWORD *)(a2 + 48);
    int v17 = *(_DWORD *)(a2 + 40);
    sub_8D90(a2, 4LL, 1, 0);
    sub_7140((_DWORD *)a2, 6LL, v14);
    sub_7140((_DWORD *)a2, 8LL, v6);
    sub_8D90(a2, 14LL, 1, 0);
    sub_6E7C(a2, 10LL, 0LL, -1LL);
    uint64_t v18 = sub_72B0(a2, v15 - v16 + v17);
  }

  _Block_object_dispose(&v21, 8);
  if (__p)
  {
    int v28 = __p;
    operator delete(__p);
  }

  _Block_object_dispose(&v31, 8);
  sub_A1D4((uint64_t)&v36[8]);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v47, 8);
  return v18;
}

void sub_9A50( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *__p, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49)
{
  if (__p)
  {
    a24 = (uint64_t)__p;
    operator delete(__p);
  }

  _Block_object_dispose(&a31, 8);
  sub_A1D4(v49);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v50 - 216), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_9AD4(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 48) = *(_DWORD *)(a2 + 48);
  return result;
}

uint64_t sub_9AE4(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 48) = *(_DWORD *)(a2 + 48);
  return result;
}

const char *sub_9AF4(const char *result, uint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = result;
    unint64_t v3 = *(unsigned int *)(a2 + 4) | ((unint64_t)(*(_DWORD *)(a2 + 8) & 0xFFFFFF) << 32);
    *(_DWORD *)(*(void *)(*((void *)result + 4) + 8LL) + 48LL) = sub_6BCC(v3, *((void *)result + 6));
    FamilyName = (const char *)CSArchitectureGetFamilyName(v3);
    uint64_t result = sub_6B94(FamilyName, *((void **)v2 + 6));
    *(_DWORD *)(*(void *)(*((void *)v2 + 5) + 8LL) + 48LL) = (_DWORD)result;
  }

  return result;
}

uint64_t sub_9B54(uint64_t a1, uint64_t a2)
{
  return sub_A164(a1 + 48, (uint64_t *)(a2 + 48));
}

uint64_t sub_9B60(uint64_t a1)
{
  return sub_A1D4(a1 + 48);
}

void sub_9B68(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5)
{
  if (a2 && a5)
  {
    v16[0] = a4;
    v16[1] = a5;
    if (a3) {
      unint64_t v7 = a3;
    }
    else {
      unint64_t v7 = (char *)&unk_E96D;
    }
    sub_B684(__p, v7);
    uint64_t v8 = *(void *)(a1 + 32);
    *(_OWORD *)int v17 = *(_OWORD *)__p;
    uint64_t v18 = v15;
    uint64_t v9 = *(void *)(v8 + 8);
    sub_B684(__p, a2);
    BOOL v19 = __p;
    unsigned int v10 = sub_A28C(v9 + 48, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v19);
    int v11 = (uint64_t *)(v10 + 40);
    unint64_t v12 = *((void *)v10 + 6);
    if (v12 >= *((void *)v10 + 7))
    {
      uint64_t v13 = sub_AD5C(v11, (uint64_t)v16);
    }

    else
    {
      sub_ACF4((uint64_t)v11, (uint64_t)v16);
      uint64_t v13 = v12 + 40;
    }

    *((void *)v10 + 6) = v13;
    if (SHIBYTE(v15) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v18) < 0) {
      operator delete(v17[0]);
    }
  }

void sub_9C54( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_9C88(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  if (!a2 || !a4) {
    return;
  }
  v54 = 0LL;
  v55 = 0LL;
  int v53 = 0LL;
  uint64_t v8 = *(void *)(a1[4] + 8LL);
  sub_B684(__p, a2);
  uint64_t v9 = sub_B0E8((void *)(v8 + 48), (unsigned __int8 *)__p);
  unsigned int v10 = v9;
  if ((SBYTE7(v50) & 0x80000000) == 0)
  {
    if (!v9) {
      goto LABEL_33;
    }
LABEL_7:
    uint64_t v48 = a3;
    memset(v52, 0, sizeof(v52));
    sub_B1E8( v52,  *((__int128 **)v10 + 5),  *((__int128 **)v10 + 6),  0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)v10 + 6) - *((void *)v10 + 5)) >> 3));
    uint64_t v11 = *((void *)v10 + 5);
    for (uint64_t i = *((void *)v10 + 6); v11 != i; v11 += 40LL)
    {
      *(_OWORD *)__p = *(_OWORD *)v11;
      if (*(char *)(v11 + 39) < 0)
      {
        sub_B48C(&v50, *(void **)(v11 + 16), *(void *)(v11 + 24));
      }

      else
      {
        __int128 v13 = *(_OWORD *)(v11 + 16);
        uint64_t v51 = *(void *)(v11 + 32);
        __int128 v50 = v13;
      }

      int v14 = sub_A0AC((uint64_t)__p, a1[6]);
      int v15 = v14;
      if (v14)
      {
        int v16 = v54;
        if (v54 >= v55)
        {
          uint64_t v18 = (char *)v53;
          uint64_t v19 = (v54 - (_BYTE *)v53) >> 2;
          unint64_t v20 = v19 + 1;
          uint64_t v21 = v55 - (_BYTE *)v53;
          if ((v55 - (_BYTE *)v53) >> 1 > v20) {
            unint64_t v20 = v21 >> 1;
          }
          else {
            unint64_t v22 = v20;
          }
          if (v22)
          {
            uint64_t v23 = (char *)sub_750C((uint64_t)&v55, v22);
            uint64_t v18 = (char *)v53;
            int v16 = v54;
          }

          else
          {
            uint64_t v23 = 0LL;
          }

          unsigned int v24 = &v23[4 * v19];
          *(_DWORD *)unsigned int v24 = v15;
          int v17 = v24 + 4;
          while (v16 != v18)
          {
            int v25 = *((_DWORD *)v16 - 1);
            v16 -= 4;
            *((_DWORD *)v24 - 1) = v25;
            v24 -= 4;
          }

          int v53 = v24;
          v54 = v17;
          v55 = &v23[4 * v22];
          if (v18) {
            operator delete(v18);
          }
        }

        else
        {
          *(_DWORD *)v54 = v14;
          int v17 = v16 + 4;
        }

        v54 = v17;
      }

      if (SHIBYTE(v51) < 0) {
        operator delete((void *)v50);
      }
    }

    __p[0] = v52;
    sub_B400((void ***)__p);
    a3 = v48;
    goto LABEL_33;
  }

  operator delete(__p[0]);
  if (v10) {
    goto LABEL_7;
  }
LABEL_33:
  if (v53 == v54) {
    unsigned int v26 = 0;
  }
  else {
    unsigned int v26 = sub_7568((_DWORD *)a1[6], (uint64_t)v53, (v54 - (_BYTE *)v53) >> 2);
  }
  size_t v27 = strlen(a2);
  unsigned int v28 = sub_8E74((void *)a1[6], a2, v27);
  unint64_t v29 = a1[6];
  sub_6E54(v29);
  *(_BYTE *)(v29 + 70) = 1;
  int v30 = *(_DWORD *)(v29 + 32);
  int v31 = *(_DWORD *)(v29 + 48);
  int v32 = *(_DWORD *)(v29 + 40);
  sub_6E7C(v29, 6LL, a3, -1LL);
  sub_6E7C(v29, 8LL, a4, 0LL);
  sub_7140((_DWORD *)v29, 4LL, v28);
  sub_7140((_DWORD *)v29, 22LL, v26);
  int v33 = sub_72B0(v29, v30 - v31 + v32);
  int v34 = v33;
  if (v33)
  {
    unsigned int v35 = *(void **)(a1[5] + 8LL);
    uint64_t v36 = (char *)v35[7];
    unint64_t v37 = v35[8];
    if ((unint64_t)v36 >= v37)
    {
      uint64_t v39 = (char *)v35[6];
      uint64_t v40 = (v36 - v39) >> 2;
      unint64_t v41 = v37 - (void)v39;
      unint64_t v42 = (uint64_t)(v37 - (void)v39) >> 1;
      if (v42 <= v40 + 1) {
        unint64_t v42 = v40 + 1;
      }
      if (v41 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v43 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v43 = v42;
      }
      if (v43)
      {
        uint64_t v44 = (char *)sub_750C((uint64_t)(v35 + 8), v43);
        uint64_t v39 = (char *)v35[6];
        uint64_t v36 = (char *)v35[7];
      }

      else
      {
        uint64_t v44 = 0LL;
      }

      uint64_t v45 = &v44[4 * v40];
      int v46 = &v44[4 * v43];
      *(_DWORD *)uint64_t v45 = v34;
      int v38 = v45 + 4;
      while (v36 != v39)
      {
        int v47 = *((_DWORD *)v36 - 1);
        v36 -= 4;
        *((_DWORD *)v45 - 1) = v47;
        v45 -= 4;
      }

      void v35[6] = v45;
      v35[7] = v38;
      v35[8] = v46;
      if (v39) {
        operator delete(v39);
      }
    }

    else
    {
      *(_DWORD *)uint64_t v36 = v33;
      int v38 = v36 + 4;
    }

    v35[7] = v38;
  }

  if (v53)
  {
    v54 = (char *)v53;
    operator delete(v53);
  }

void sub_A030( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, void *__p, uint64_t a27)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_A0AC(uint64_t a1, unint64_t a2)
{
  int v4 = *(char *)(a1 + 39);
  if (v4 >= 0) {
    uint64_t v5 = (const void *)(a1 + 16);
  }
  else {
    uint64_t v5 = *(const void **)(a1 + 16);
  }
  if (v4 >= 0) {
    unint64_t v6 = *(unsigned __int8 *)(a1 + 39);
  }
  else {
    unint64_t v6 = *(void *)(a1 + 24);
  }
  unsigned int v7 = sub_8E74((void *)a2, v5, v6);
  sub_6E54(a2);
  *(_BYTE *)(a2 + 70) = 1;
  int v8 = *(_DWORD *)(a2 + 32) - *(_DWORD *)(a2 + 48) + *(_DWORD *)(a2 + 40);
  sub_6E7C(a2, 6LL, *(void *)a1, -1LL);
  sub_6E7C(a2, 8LL, *(void *)(a1 + 8), 0LL);
  sub_7140((_DWORD *)a2, 4LL, v7);
  return sub_72B0(a2, v8);
}

uint64_t sub_A164(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0LL;
  *(void *)uint64_t result = v2;
  *(void *)(result + 8) = a2[1];
  a2[1] = 0LL;
  uint64_t v5 = a2[2];
  unint64_t v3 = a2 + 2;
  uint64_t v4 = v5;
  *(void *)(result + 16) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 24) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        v7 %= v8;
      }
    }

    else
    {
      v7 &= v8 - 1;
    }

    *(void *)(v2 + 8 * v7) = result + 16;
    *unint64_t v3 = 0LL;
    v3[1] = 0LL;
  }

  return result;
}

uint64_t sub_A1D4(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_A20C(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      unint64_t v3 = (void *)*v2;
      sub_A248((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

void sub_A248(uint64_t a1)
{
  uint64_t v2 = (void **)(a1 + 24);
  sub_B400(&v2);
}

unsigned __int8 *sub_A28C(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = sub_A530(a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }

    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }

    int v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if ((sub_A9D8(a1 + 32, i + 16, a2) & 1) != 0) {
            return i;
          }
        }

        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }

          else
          {
            v16 &= v11 - 1;
          }

          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }

  int v17 = operator new(0x40uLL);
  v29[0] = v17;
  v29[1] = a1 + 16;
  *int v17 = 0LL;
  v17[1] = v10;
  uint64_t v18 = *a4;
  __int128 v19 = **a4;
  v17[4] = *((void *)*a4 + 2);
  *((_OWORD *)v17 + 1) = v19;
  *((void *)v18 + 1) = 0LL;
  *((void *)v18 + 2) = 0LL;
  *(void *)uint64_t v18 = 0LL;
  v17[6] = 0LL;
  v17[7] = 0LL;
  v17[5] = 0LL;
  char v30 = 1;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    BOOL v22 = 1LL;
    if (v11 >= 3) {
      BOOL v22 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v11);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    sub_AA7C(a1, v25);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }

    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }

  unsigned int v26 = *(void **)(*(void *)a1 + 8 * v4);
  if (v26)
  {
    *(void *)v29[0] = *v26;
    void *v26 = v29[0];
  }

  else
  {
    *(void *)v29[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v29[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v29[0])
    {
      unint64_t v27 = *(void *)(*(void *)v29[0] + 8LL);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v27 >= v11) {
          v27 %= v11;
        }
      }

      else
      {
        v27 &= v11 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v27) = v29[0];
    }
  }

  uint64_t i = (unsigned __int8 *)v29[0];
  v29[0] = 0LL;
  ++*v8;
  sub_ACB0((uint64_t)v29, 0LL);
  return i;
}

void sub_A518(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

unint64_t sub_A530(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }

  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }

  return sub_A56C((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t sub_A56C(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69LL
          * (v6 ^ ((0x9DDFEA08EB382D69LL * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69LL * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69LL * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297LL * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      BOOL v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0LL);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273LL * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273LL * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64LL;
      }

      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297LL
          * ((0x9DDFEA08EB382D69LL
            * (v21 ^ ((0x9DDFEA08EB382D69LL * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69LL * (v21 ^ ((0x9DDFEA08EB382D69LL * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69LL
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297LL
                  * ((0x9DDFEA08EB382D69LL
                    * (v20 ^ ((0x9DDFEA08EB382D69LL * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69LL * (v20 ^ ((0x9DDFEA08EB382D69LL * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69LL * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }

    else
    {
      return sub_A918(a2, a3);
    }
  }

  else if (a3 > 0x10)
  {
    return sub_A86C(a2, a3);
  }

  else
  {
    return sub_A774(a2, a3);
  }

unint64_t sub_A774(_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557LL * (a2 + 4LL * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }

    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69LL * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69LL * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }

  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69LL
          * ((0x9DDFEA08EB382D69LL
            * (v4 ^ ((0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69LL * (v4 ^ ((0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }

  return result;
}

unint64_t sub_A86C(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273LL * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557LL, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69LL * (v5 ^ (v4 - 0x3C5A37A36834CED9LL * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69LL
       * ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t sub_A918(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9LL * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9LL * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127LL * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1LL
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9LL * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9LL * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t sub_A9D8(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0LL) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0LL;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1LL;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }

  while (v9 == v11 && v14);
  return result;
}

void sub_AA7C(uint64_t a1, size_t __n)
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
      sub_AB58(a1, prime);
  }

void sub_AB58(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_7540();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + 8) = a2;
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

      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      int v11 = (void *)*v7;
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
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    int v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0LL;
  }

void sub_ACB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      sub_A248((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }

_BYTE *sub_ACF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)a2;
  uint64_t result = (_BYTE *)(v3 + 16);
  if (*(char *)(a2 + 39) < 0)
  {
    uint64_t result = sub_B48C(result, *(void **)(a2 + 16), *(void *)(a2 + 24));
  }

  else
  {
    __int128 v5 = *(_OWORD *)(a2 + 16);
    *(void *)(v3 + 32) = *(void *)(a2 + 32);
    *(_OWORD *)uint64_t result = v5;
  }

  *(void *)(a1 + 8) = v3 + 40;
  return result;
}

void sub_AD54(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_AD5C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x666666666666666LL) {
    sub_7484();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x333333333333333LL) {
    unint64_t v9 = 0x666666666666666LL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v19 = a1 + 2;
  if (v9) {
    int v10 = (char *)sub_AEFC(v7, v9);
  }
  else {
    int v10 = 0LL;
  }
  int v11 = &v10[40 * v4];
  v16[0] = v10;
  v16[1] = v11;
  uint64_t v17 = v11;
  uint64_t v18 = &v10[40 * v9];
  *(_OWORD *)int v11 = *(_OWORD *)a2;
  unint64_t v12 = v11 + 16;
  if (*(char *)(a2 + 39) < 0)
  {
    sub_B48C(v12, *(void **)(a2 + 16), *(void *)(a2 + 24));
    int v11 = v17;
  }

  else
  {
    __int128 v13 = *(_OWORD *)(a2 + 16);
    *((void *)v11 + 4) = *(void *)(a2 + 32);
    *(_OWORD *)unint64_t v12 = v13;
  }

  uint64_t v17 = v11 + 40;
  sub_AE88(a1, v16);
  uint64_t v14 = a1[1];
  sub_B060((uint64_t)v16);
  return v14;
}

void sub_AE74(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_AE88(uint64_t *a1, void *a2)
{
  uint64_t result = sub_AF40((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_AEFC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667LL) {
    sub_7540();
  }
  return operator new(40 * a2);
}

uint64_t sub_AF40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
      *(_OWORD *)(v7 - 40) = *(_OWORD *)(a3 - 40);
      __int128 v8 = *(_OWORD *)(a3 - 24);
      *(void *)(v7 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(a3 - 24) = 0LL;
      *(void *)(a3 - 16) = 0LL;
      *(void *)(a3 - 8) = 0LL;
      uint64_t v7 = *((void *)&v14 + 1) - 40LL;
      *((void *)&v14 + 1) -= 40LL;
      a3 -= 40LL;
    }

    while (a3 != a5);
    uint64_t v9 = v14;
  }

  char v12 = 1;
  sub_AFE8((uint64_t)v11);
  return v9;
}

uint64_t sub_AFE8(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_B01C(a1);
  }
  return a1;
}

void sub_B01C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    v1 += 40LL;
  }

uint64_t sub_B060(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_B094(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 40;
      *(void *)(a1 + 16) = v2 - 40;
      if (*(char *)(v2 - 1) < 0)
      {
        operator delete(*(void **)(v2 - 24));
        uint64_t v5 = *(void *)(a1 + 16);
      }

      uint64_t v2 = v5;
    }

    while (v5 != a2);
  }

unsigned __int8 *sub_B0E8(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = sub_A530((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0LL;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }

  else
  {
    unint64_t v9 = (*(void *)&v5 - 1LL) & v4;
  }

  int v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0LL;
  }
  int v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if ((sub_A9D8(v12, v11 + 16, a2) & 1) != 0) {
          return v11;
        }
      }

      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }

        else
        {
          v13 &= *(void *)&v5 - 1LL;
        }

        if (v13 != v9) {
          return 0LL;
        }
      }

      int v11 = *(unsigned __int8 **)v11;
    }

    while (v11);
  }

  return v11;
}

void *sub_B1E8(void *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    sub_B26C(result, a4);
    uint64_t result = (void *)sub_B2BC((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }

  return result;
}

void sub_B24C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_B400(&a9);
  _Unwind_Resume(a1);
}

char *sub_B26C(void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667LL) {
    sub_7484();
  }
  uint64_t result = (char *)sub_AEFC((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

uint64_t sub_B2BC(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v13 = a4;
  uint64_t v14 = a4;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  char v12 = 0;
  if (a2 != a3)
  {
    unint64_t v6 = a2 + 1;
    do
    {
      *(_OWORD *)uint64_t v4 = *(v6 - 1);
      uint8x8_t v7 = (_BYTE *)(v4 + 16);
      if (*((char *)v6 + 23) < 0)
      {
        sub_B48C(v7, *(void **)v6, *((void *)v6 + 1));
        uint64_t v4 = v14;
      }

      else
      {
        __int128 v8 = *v6;
        *(void *)(v4 + 32) = *((void *)v6 + 2);
        *(_OWORD *)uint8x8_t v7 = v8;
      }

      uint64_t v9 = v6 - 1;
      v4 += 40LL;
      uint64_t v14 = v4;
      unint64_t v6 = (__int128 *)((char *)v6 + 40);
    }

    while ((__int128 *)((char *)v9 + 40) != a3);
  }

  char v12 = 1;
  sub_B388((uint64_t)v11);
  return v4;
}

void sub_B374( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_B388(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_B3BC(a1);
  }
  return a1;
}

void sub_B3BC(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    v1 -= 40LL;
  }

void sub_B400(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_B440((uint64_t *)v2);
    operator delete(**a1);
  }

void sub_B440(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 40LL)
  {
  }

  a1[1] = v2;
}

void *sub_B48C(_BYTE *__dst, void *__src, unint64_t a3)
{
  int8x8_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_B518();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    __int128 v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    *int8x8_t v5 = v8;
    int8x8_t v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_B518()
{
}

void sub_B52C(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_A20C(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0LL;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0LL;
    }

    *(void *)(a1 + 24) = 0LL;
  }

void sub_B580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = sub_511C(a2, a3, *(void *)(a1 + 40), 0);
  if (v4)
  {
    int v5 = v4;
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8LL);
    uint64_t v7 = (char *)v6[7];
    unint64_t v8 = v6[8];
    if ((unint64_t)v7 >= v8)
    {
      uint64_t v10 = (char *)v6[6];
      uint64_t v11 = (v7 - v10) >> 2;
      unint64_t v12 = v8 - (void)v10;
      unint64_t v13 = (uint64_t)(v8 - (void)v10) >> 1;
      if (v13 <= v11 + 1) {
        unint64_t v13 = v11 + 1;
      }
      if (v12 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      if (v14)
      {
        uint64_t v15 = (char *)sub_750C((uint64_t)(v6 + 8), v14);
        uint64_t v10 = (char *)v6[6];
        uint64_t v7 = (char *)v6[7];
      }

      else
      {
        uint64_t v15 = 0LL;
      }

      unint64_t v16 = &v15[4 * v11];
      uint64_t v17 = &v15[4 * v14];
      *(_DWORD *)unint64_t v16 = v5;
      uint64_t v9 = v16 + 4;
      while (v7 != v10)
      {
        int v18 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v16 - 1) = v18;
        v16 -= 4;
      }

      v6[6] = v16;
      v6[7] = v9;
      v6[8] = v17;
      if (v10) {
        operator delete(v10);
      }
    }

    else
    {
      *(_DWORD *)uint64_t v7 = v4;
      uint64_t v9 = v7 + 4;
    }

    v6[7] = v9;
  }

void *sub_B684(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_B518();
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

uint64_t sub_B734(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_B76C(int a1, void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      uint64_t v3 = (void **)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

unsigned __int8 *sub_B7B0(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v7 = (void *)(a1 + 24);
  unint64_t v8 = sub_A530(a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }

    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }

    unint64_t v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if ((sub_A9D8(a1 + 32, i + 16, a2) & 1) != 0) {
            return i;
          }
        }

        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }

          else
          {
            v15 &= v10 - 1;
          }

          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }

  sub_BA2C(a1, v9, a3, (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1LL;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    sub_AA7C(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }

    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }

  BOOL v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    *BOOL v22 = v25[0];
  }

  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8LL);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }

      else
      {
        v23 &= v10 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }

  uint64_t i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_BA08( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    sub_BACC((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_BA2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x28uLL);
  *(void *)(a4 + 8) = v7;
  *(void *)a4 = v8;
  *(_BYTE *)(a4 + 16) = 0;
  *unint64_t v8 = 0LL;
  v8[1] = a2;
  uint64_t result = v8 + 2;
  if (*(char *)(a3 + 23) < 0)
  {
    uint64_t result = sub_B48C(result, *(void **)a3, *(void *)(a3 + 8));
  }

  else
  {
    *(_OWORD *)uint64_t result = *(_OWORD *)a3;
    result[2] = *(void *)(a3 + 16);
  }

  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_BAB0(_Unwind_Exception *a1)
{
  void *v1 = 0LL;
  sub_BACC(v3, v2);
  _Unwind_Resume(a1);
}

void sub_BACC(uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

LABEL_15:
  return v6;
}

id _signpostSpecPathsForURL(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    char v27 = 0;
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v1 path]);
    if ([v2 fileExistsAtPath:v3 isDirectory:&v27])
    {
      if (v27)
      {
        id v26 = 0LL;
        size_t v4 = (void *)objc_claimAutoreleasedReturnValue( [v2 contentsOfDirectoryAtURL:v1 includingPropertiesForKeys:0 options:0 error:&v26]);
        id v5 = v26;
        uint64_t v6 = v5;
        uint64_t v7 = &__NSArray0__struct;
        if (v4 && !v5 && [v4 count])
        {
          unint64_t v20 = v3;
          size_t v21 = v2;
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          __int128 v22 = 0u;
          __int128 v23 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          unint64_t v19 = v4;
          id v8 = v4;
          id v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v23;
            do
            {
              for (uint64_t i = 0LL; i != v10; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v23 != v11) {
                  objc_enumerationMutation(v8);
                }
                unint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
                unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pathExtension]);
                if (([v14 isEqualToString:@"plist"] & 1) != 0
                  || [v14 isEqualToString:@"json"])
                {
                  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLByResolvingAliasFileAtURL:options:error:]( &OBJC_CLASS___NSURL,  "URLByResolvingAliasFileAtURL:options:error:",  v13,  768LL,  0LL));
                  float v16 = v15;
                  if (v15)
                  {
                    float v17 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
                    [v7 addObject:v17];
                  }
                }
              }

              id v10 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
            }

            while (v10);
          }

          uint64_t v2 = v21;
          size_t v4 = v19;
          uint64_t v3 = v20;
          uint64_t v6 = 0LL;
        }
      }

      else
      {
        uint64_t v29 = v3;
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
      }
    }

    else
    {
      uint64_t v7 = &__NSArray0__struct;
    }
  }

  else
  {
    uint64_t v7 = &__NSArray0__struct;
  }

  return v7;
}

id _deserializeSignpostSpecs(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfFile:](&OBJC_CLASS___NSArray, "arrayWithContentsOfFile:", v1));
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v1));
    uint64_t v6 = (void *)v5;
    if (v5)
    {
      uint64_t v14 = v5;
      id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
LABEL_14:

      goto LABEL_15;
    }

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v1));
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  0LL));
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        id v10 = v8;
LABEL_10:
        id v4 = v10;

LABEL_13:
        goto LABEL_14;
      }

      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
      {
        unint64_t v13 = v8;
        id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
        goto LABEL_10;
      }
    }

    id v4 = 0LL;
    goto LABEL_13;
  }

  id v4 = v2;
LABEL_15:

  return v4;
}

uint64_t sub_D04C(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 41LL) = 1;
  return result;
}

void sub_D278()
{
}

void sub_D2A0()
{
}

void sub_D2C8()
{
}

void sub_D2F0()
{
}

void sub_D318()
{
}

void sub_D340()
{
  __assert_rtn("ensure_space", "flatbuffers.h", 986, "cur_ >= scratch_ && scratch_ >= buf_");
}

void sub_D368()
{
}

void sub_D390()
{
  __assert_rtn("ReferTo", "flatbuffers.h", 1415, "off && off <= GetSize()");
}

void sub_D3B8()
{
}

void sub_D3E0()
{
}

void sub_D408()
{
}

void sub_D430()
{
}

void sub_D458()
{
}

void sub_D480()
{
}

void sub_D4A8()
{
  __assert_rtn("Finish", "flatbuffers.h", 2149, "strlen(file_identifier) == kFileIdentifierLength");
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

id objc_msgSend_warnWithMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "warnWithMessage:");
}