void sub_183F50908(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t LSHandlerPref::GetTagForContentType(void *a1, const __CFString *a2, int *a3)
{
  return LSHandlerPref::GetOrCreateTagForContentType(a1, a2, 0, a3);
}

uint64_t LSHandlerPref::GetOrAddHandlerPref(void *a1, int a2, int a3, int a4, _DWORD *a5)
{
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  id v9 = a1;
  _LSDatabaseEnumeratingBindingMap();
  uint64_t v10 = v14[3];
  if (a4 && !v10)
  {
    v11 = (_LSDatabase *)LSHandlerPref::Add(v9, a2, a3);
    if (a5) {
      *a5 = (_DWORD)v11;
    }
    uint64_t v10 = LSHandlerPref::Get((LSHandlerPref *)v9, v11);
  }

  _Block_object_dispose(&v13, 8);
  return v10;
}

void sub_183F50A2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN13LSHandlerPref19GetOrAddHandlerPrefEP11_LSDatabasej14LSBindingMapIDhPj_block_invoke( uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  v4 = (_LSDatabase *)(a3 & 0xFFFFFFFC);
  if ((a3 & 3) == 1 && (_DWORD)v4 != 0)
  {
    uint64_t v7 = result;
    v8 = *(_DWORD **)(result + 48);
    if (v8) {
      _DWORD *v8 = (_DWORD)v4;
    }
    result = LSHandlerPref::Get(*(LSHandlerPref **)(result + 32), v4);
    *(void *)(*(void *)(*(void *)(v7 + 40) + 8LL) + 24LL) = result;
    *a4 = 1;
  }

  return result;
}

uint64_t LSHandlerPref::GetHandlerPref(void *a1, int a2, int a3, _DWORD *a4)
{
  return LSHandlerPref::GetOrAddHandlerPref(a1, a2, a3, 0, a4);
}

void LSHandlerPref::SetRoleHandler( LSHandlerPref *this, _LSDatabase *a2, unsigned int a3, int a4, __int128 *a5, LSVersionNumber *a6)
{
  int v9 = (int)a2;
  uint64_t v53 = *MEMORY[0x1895F89C0];
  uint64_t v10 = this;
  if (v10)
  {
    if (v9)
    {
      uint64_t Unit = CSStoreGetUnit();
      if (Unit)
      {
        __int128 v12 = *(_OWORD *)Unit;
        __int128 v13 = *(_OWORD *)(Unit + 32);
        v37[1] = *(_OWORD *)(Unit + 16);
        __int128 v38 = v13;
        v37[0] = v12;
        __int128 v14 = *(_OWORD *)(Unit + 48);
        __int128 v15 = *(_OWORD *)(Unit + 64);
        __int128 v16 = *(_OWORD *)(Unit + 96);
        __int128 v41 = *(_OWORD *)(Unit + 80);
        __int128 v42 = v16;
        __int128 v39 = v14;
        __int128 v40 = v15;
        __int128 v17 = *(_OWORD *)(Unit + 112);
        __int128 v18 = *(_OWORD *)(Unit + 128);
        __int128 v19 = *(_OWORD *)(Unit + 160);
        __int128 v45 = *(_OWORD *)(Unit + 144);
        __int128 v46 = v19;
        __int128 v43 = v17;
        __int128 v44 = v18;
        __int128 v20 = *(_OWORD *)(Unit + 176);
        __int128 v21 = *(_OWORD *)(Unit + 192);
        __int128 v22 = *(_OWORD *)(Unit + 208);
        *(void *)&v48[32] = *(void *)(Unit + 224);
        *(_OWORD *)v48 = v21;
        *(_OWORD *)&v48[16] = v22;
        __int128 v47 = v20;
        if (a3 != -1)
        {
          uint64_t v23 = 8LL;
          uint64_t v24 = 168LL;
          while (1)
          {
            if (((a3 >> (v23 - 4)) & 1) != 0)
            {
              int v25 = *((_DWORD *)v37 + v23);
              if (a4)
              {
                if (v25)
                {
                  if (a4 == v25)
                  {
                    __int128 v26 = a5[1];
                    __int128 v51 = *a5;
                    __int128 v52 = v26;
                    __int128 v27 = *(_OWORD *)((char *)&v37[1] + v24);
                    __int128 v49 = *(_OWORD *)((char *)v37 + v24);
                    __int128 v50 = v27;
                    if (!_LSVersionNumberCompare(&v51, &v49)) {
                      goto LABEL_21;
                    }
                  }

                  if (a4 == DWORD1(v38))
                  {
                    a4 = 0;
                    *a5 = kLSVersionNumberNull;
                    a5[1] = *(_OWORD *)algn_183FBF5B0;
                  }

                  _CSStringRelease();
                  _CSStringRetain();
                }

                else
                {
                  if (a4 == DWORD1(v38))
                  {
                    __int128 v31 = a5[1];
                    __int128 v51 = *a5;
                    __int128 v52 = v31;
                    __int128 v32 = *(_OWORD *)((char *)&v37[1] + v24);
                    __int128 v49 = *(_OWORD *)((char *)v37 + v24);
                    __int128 v50 = v32;
                    if (!_LSVersionNumberCompare(&v51, &v49)) {
                      goto LABEL_21;
                    }
                  }

                  _CSStringRetain();
                }

                *((_DWORD *)v37 + v23) = a4;
                v28 = (_OWORD *)((char *)v37 + v24);
                __int128 v29 = *a5;
                __int128 v30 = a5[1];
              }

              else
              {
                if (!v25)
                {
                  a4 = 0;
                  goto LABEL_21;
                }

                _CSStringRelease();
                a4 = 0;
                *((_DWORD *)v37 + v23) = 0;
                v28 = (_OWORD *)((char *)v37 + v24);
                __int128 v29 = kLSVersionNumberNull;
                __int128 v30 = *(_OWORD *)algn_183FBF5B0;
              }

              __int128 *v28 = v29;
              v28[1] = v30;
            }

void sub_183F50DF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void LSHandlerPref::RemoveRoleHandlersMatchingBundleID(LSHandlerPref *this, _LSDatabase *a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  __int128 v13 = &v12;
  uint64_t v14 = 0x4812000000LL;
  __int128 v15 = __Block_byref_object_copy__33;
  __int128 v16 = __Block_byref_object_dispose__33;
  __int128 v17 = "";
  __p = 0LL;
  __int128 v19 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v8 = 0LL;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = 0;
  v2 = this;
  _CSStoreEnumerateUnits();
  if (*((_DWORD *)v9 + 6))
  {
    do
    {
      _CSStringRelease();
      int v4 = *((_DWORD *)v9 + 6) - 1;
      *((_DWORD *)v9 + 6) = v4;
    }

    while (v4);
  }

  v5 = (unsigned int *)v13[6];
  for (uint64_t i = (unsigned int *)v13[7]; v5 != i; ++v5)
  {
    uint64_t v7 = (_LSDatabase *)*v5;
    memset(v21, 0, sizeof(v21));
    LSHandlerPref::SetRoleHandler(v2, v7, 0xFFFFFFFF, 0, v21, v3);
  }

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  if (__p)
  {
    __int128 v19 = __p;
    operator delete(__p);
  }
}

void sub_183F50FF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, void *__p, uint64_t a29)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  if (__p)
  {
    a29 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__33(__n128 *a1, __n128 *a2)
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

void __Block_byref_object_dispose__33(uint64_t a1)
{
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }

void ___ZN13LSHandlerPref34RemoveRoleHandlersMatchingBundleIDEP11_LSDatabasej_block_invoke( uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = 0LL;
  char v5 = 0;
  char v6 = 0;
  __int128 v7 = *(_OWORD *)(a3 + 208);
  v33[12] = *(_OWORD *)(a3 + 192);
  v33[13] = v7;
  uint64_t v34 = *(void *)(a3 + 224);
  __int128 v8 = *(_OWORD *)(a3 + 144);
  v33[8] = *(_OWORD *)(a3 + 128);
  v33[9] = v8;
  __int128 v9 = *(_OWORD *)(a3 + 176);
  v33[10] = *(_OWORD *)(a3 + 160);
  v33[11] = v9;
  __int128 v10 = *(_OWORD *)(a3 + 80);
  v33[4] = *(_OWORD *)(a3 + 64);
  v33[5] = v10;
  __int128 v11 = *(_OWORD *)(a3 + 112);
  v33[6] = *(_OWORD *)(a3 + 96);
  v33[7] = v11;
  __int128 v12 = *(_OWORD *)(a3 + 16);
  v33[0] = *(_OWORD *)a3;
  v33[1] = v12;
  __int128 v13 = *(_OWORD *)(a3 + 48);
  v33[2] = *(_OWORD *)(a3 + 32);
  v33[3] = v13;
  while (1)
  {
    int v14 = *(_DWORD *)(a1 + 56);
    __int128 v15 = (char *)v33 + 4 * v4;
    int v17 = *((_DWORD *)v15 + 4);
    __int128 v16 = v15 + 16;
    if (v14 != v17) {
      break;
    }
LABEL_6:
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    *__int128 v16 = 0;
    __int128 v19 = &v33[2 * v4];
    *(_OWORD *)((char *)v19 + 40) = kLSVersionNumberNull;
    *(_OWORD *)((char *)v19 + 56) = *(_OWORD *)algn_183FBF5B0;
    ++v4;
    char v5 = 1;
    if (v4 == 6)
    {
      if ((v6 & 1) == 0)
      {
        uint64_t v20 = *(void **)(*(void *)(a1 + 48) + 8LL);
        __int128 v21 = (char *)v20[7];
        unint64_t v22 = v20[8];
        if ((unint64_t)v21 >= v22)
        {
          uint64_t v24 = (char *)v20[6];
          uint64_t v25 = (v21 - v24) >> 2;
          unint64_t v26 = v25 + 1;
          uint64_t v27 = v22 - (void)v24;
          if (v27 >> 1 > v26) {
            unint64_t v26 = v27 >> 1;
          }
          else {
            unint64_t v28 = v26;
          }
          if (v28)
          {
            __int128 v29 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)(v20 + 8), v28);
            uint64_t v24 = (char *)v20[6];
            __int128 v21 = (char *)v20[7];
          }

          else
          {
            __int128 v29 = 0LL;
          }

          __int128 v30 = &v29[4 * v25];
          __int128 v31 = &v29[4 * v28];
          *(_DWORD *)__int128 v30 = a2;
          uint64_t v23 = v30 + 4;
          while (v21 != v24)
          {
            int v32 = *((_DWORD *)v21 - 1);
            v21 -= 4;
            *((_DWORD *)v30 - 1) = v32;
            v30 -= 4;
          }

          v20[6] = v30;
          v20[7] = v23;
          v20[8] = v31;
          if (v24) {
            operator delete(v24);
          }
        }

        else
        {
          *(_DWORD *)__int128 v21 = a2;
          uint64_t v23 = v21 + 4;
        }

        v20[7] = v23;
        return;
      }

uint64_t LSHandlerPref::roleHandler(LSHandlerPref *this, unsigned int a2, LSVersionNumber *a3)
{
  if (a2 != -1 || (uint64_t v4 = (char *)this + 36, !*((_DWORD *)this + 9)))
  {
    v3 = (__int128 *)((char *)this + 168);
    uint64_t v4 = (char *)this + 32;
    uint64_t v5 = 5LL;
    while (((a2 >> (v5 - 1)) & 1) == 0 || !*(_DWORD *)v4)
    {
      v3 -= 2;
      v4 -= 4;
      if (!--v5)
      {
        if (a3)
        {
          __int128 v6 = *(_OWORD *)((char *)this + 216);
          *(_OWORD *)a3->_opaque = *(_OWORD *)((char *)this + 200);
          *(_OWORD *)&a3->_opaque[16] = v6;
        }

        uint64_t v4 = (char *)this + 36;
        return *(unsigned int *)v4;
      }
    }

    if (!a3) {
      return *(unsigned int *)v4;
    }
    __int128 v7 = *v3;
    __int128 v8 = v3[1];
    goto LABEL_14;
  }

  if (a3)
  {
    __int128 v7 = *(_OWORD *)((char *)this + 200);
    __int128 v8 = *(_OWORD *)((char *)this + 216);
LABEL_14:
    *(_OWORD *)a3->_opaque = v7;
    *(_OWORD *)&a3->_opaque[16] = v8;
  }

  return *(unsigned int *)v4;
}

void LSHandlerPref::GetVisualizationFunctions( id (**a1)(LSHandlerPref **this, LSContext *a2, _LSDatabase *a3)@<X8>)
{
  *a1 = LaunchServices::HandlerPrefs::getSummary;
  a1[1] = (id (*)(LSHandlerPref **, LSContext *, _LSDatabase *))LaunchServices::HandlerPrefs::display;
  a1[2] = 0LL;
}

id LaunchServices::HandlerPrefs::getSummary(LSHandlerPref **this, LSContext *a2, _LSDatabase *a3)
{
  v3 = (void *)LSHandlerPref::Get(*this, a3);
  if (v3) {
    v3 = (void *)_CSStringCopyCFString();
  }
  return v3;
}

BOOL LaunchServices::HandlerPrefs::display( LSHandlerPref **this, LSContext *a2, _LSDatabase *a3, CSStore2::AttributedStringWriter *a4, LaunchServices::DumpWriter *a5)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  __int128 v7 = (int *)LSHandlerPref::Get(*this, a3);
  if (v7)
  {
    v33[0] = xmmword_189D78050;
    v33[1] = *(_OWORD *)&off_189D78060;
    v33[2] = xmmword_189D78070;
    v33[3] = *(_OWORD *)&off_189D78080;
    int BindingMapIndex = _LSDatabaseFindBindingMapIndex((uint64_t)*this, v7[3]);
    if (BindingMapIndex <= 0) {
      int v9 = BindingMapIndex;
    }
    else {
      int v9 = 6;
    }
    if (v9)
    {
      CSStore2::AttributedStringWriter::string(a4, *((NSString **)v33 + v9));
    }

    else
    {
      v28[0] = 0;
      _UTGetActiveTypeForIdentifier(*this, v7[2], v28);
      __int128 v10 = *(NSString **)&v33[0];
      CSStore2::AttributedStringWriter::link(a4, *((unsigned int *)*this + 8), v28[0], 0LL);
      __int128 v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      CSStore2::AttributedStringWriter::string(a4, v10, v11);
    }

    int v12 = v7[9];
    if (v12)
    {
LABEL_13:
      __int128 v15 = (__int128 *)(v7 + 50);
    }

    else
    {
      uint64_t v13 = -168LL;
      uint64_t v14 = 8LL;
      while (1)
      {
        int v12 = v7[v14];
        if (v12) {
          break;
        }
        v13 += 32LL;
        --v14;
        if (v13 == -8)
        {
          int v12 = 0;
          goto LABEL_13;
        }
      }

      __int128 v15 = (__int128 *)&v7[v13 / 0xFFFFFFFFFFFFFFFCLL];
    }

    uint64_t v16 = 0LL;
    __int128 v17 = v15[1];
    __int128 v31 = *v15;
    __int128 v32 = v17;
    do
    {
      *(_OWORD *)unint64_t v28 = xmmword_189D78090;
      __int128 v29 = xmmword_189D780A0;
      __int128 v30 = @"importer";
      memset(&v27, 0, sizeof(v27));
      int v18 = LSHandlerPref::roleHandler((LSHandlerPref *)v7, 1 << v16, &v27);
      if (v18)
      {
        if (v18 != v12)
        {
          CSStore2::AttributedStringWriter::string(a4, *(NSString **)&v28[2 * v16]);
          __int128 v35 = kLSVersionNumberNull;
          __int128 v36 = *(_OWORD *)algn_183FBF5B0;
          LSVersionNumber v34 = v27;
          if (_LSVersionNumberCompare(&v35, &v34))
          {
            [*(id *)&v28[2 * v16] stringByAppendingString:@" (bundle ver)"];
            __int128 v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            LSVersionNumber v26 = v27;
            _LSVersionNumberGetStringRepresentation(&v26);
            uint64_t v20 = (NSString *)objc_claimAutoreleasedReturnValue();
            CSStore2::AttributedStringWriter::string(a4, v19, v20);
          }
        }
      }

      for (uint64_t i = 8LL; i != -2; i -= 2LL)

      ++v16;
    }

    while (v16 != 5);
    if (v12)
    {
      CSStore2::AttributedStringWriter::string(a4, @"all roles");
      *(_OWORD *)unint64_t v28 = kLSVersionNumberNull;
      __int128 v29 = *(_OWORD *)algn_183FBF5B0;
      __int128 v35 = v31;
      __int128 v36 = v32;
      if (_LSVersionNumberCompare(v28, &v35))
      {
        v25[0] = v31;
        v25[1] = v32;
        _LSVersionNumberGetStringRepresentation(v25);
        unint64_t v22 = (NSString *)objc_claimAutoreleasedReturnValue();
        CSStore2::AttributedStringWriter::string(a4, @"all roles (bundle ver)", v22);
      }
    }

    for (uint64_t j = 56LL; j != -8; j -= 8LL)
  }

  return v7 != 0LL;
}

void sub_183F5164C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
  for (uint64_t i = 56LL; i != -8; i -= 8LL)
  _Unwind_Resume(a1);
}

void LSHandlerPref::RemoveAll(LSHandlerPref *this, _LSDatabase *a2)
{
  v2 = this;
  uint64_t v5 = 0LL;
  __int128 v6 = &v5;
  uint64_t v7 = 0x4812000000LL;
  __int128 v8 = __Block_byref_object_copy__33;
  int v9 = __Block_byref_object_dispose__33;
  __int128 v10 = "";
  __p = 0LL;
  int v12 = 0LL;
  uint64_t v13 = 0LL;
  _CSStoreEnumerateUnits();
  v3 = (unsigned int *)v6[6];
  uint64_t v4 = (unsigned int *)v6[7];
  while (v3 != v4)
    LSHandlerPref::Remove(v2, (_LSDatabase *)*v3++);
  _Block_object_dispose(&v5, 8);
  if (__p)
  {
    int v12 = __p;
    operator delete(__p);
  }
}

void sub_183F517E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p, uint64_t a21)
{
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZN13LSHandlerPref9RemoveAllEP11_LSDatabase_block_invoke(uint64_t a1, int a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v4 = (char *)v3[7];
  unint64_t v5 = v3[8];
  if ((unint64_t)v4 >= v5)
  {
    uint64_t v7 = (char *)v3[6];
    uint64_t v8 = (v4 - v7) >> 2;
    unint64_t v9 = v8 + 1;
    uint64_t v10 = v5 - (void)v7;
    if (v10 >> 1 > v9) {
      unint64_t v9 = v10 >> 1;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      int v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)(v3 + 8), v11);
      uint64_t v7 = (char *)v3[6];
      uint64_t v4 = (char *)v3[7];
    }

    else
    {
      int v12 = 0LL;
    }

    uint64_t v13 = &v12[4 * v8];
    uint64_t v14 = &v12[4 * v11];
    *(_DWORD *)uint64_t v13 = a2;
    __int128 v6 = v13 + 4;
    while (v4 != v7)
    {
      int v15 = *((_DWORD *)v4 - 1);
      v4 -= 4;
      *((_DWORD *)v13 - 1) = v15;
      v13 -= 4;
    }

    v3[6] = v13;
    v3[7] = v6;
    v3[8] = v14;
    if (v7) {
      operator delete(v7);
    }
  }

  else
  {
    *(_DWORD *)uint64_t v4 = a2;
    __int128 v6 = v4 + 4;
  }

  v3[7] = v6;
}

void _LSHandlerPrefRemoveAllWithBundleID(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unint64_t v5 = (void *)os_transaction_create();
  if (([(id)__LSDefaultsGetSharedInstance() isServer] & 1) != 0
    || ([(id)__LSDefaultsGetSharedInstance() hasServer] & 1) == 0)
  {
    uint64_t v16 = MEMORY[0x1895F87A8];
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = ___LSHandlerPrefRemoveAllWithBundleID_block_invoke;
    v28[3] = &unk_189D77F08;
    id v29 = v3;
    id v31 = v4;
    id v30 = v5;
    uint64_t v10 = (void (**)(void))MEMORY[0x186E2A7B8](v28);
    unint64_t v11 = &v29;
    int v12 = &v31;
    uint64_t v13 = &v30;
    if (![(id)__LSDefaultsGetSharedInstance() isServer])
    {
      v10[2](v10);
      goto LABEL_8;
    }

    +[LSDBExecutionContext sharedServerInstance]();
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v16;
    v26[1] = 3221225472LL;
    v26[2] = ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_45;
    v26[3] = &unk_189D73FA8;
    __int128 v17 = v10;
    LSVersionNumber v27 = v17;
    -[LSDBExecutionContext performAsyncWrite:]((uint64_t)v15, v26);
    uint64_t v14 = (id *)&v27;
    uint64_t v10 = v17;
  }

  else
  {
    uint64_t v6 = MEMORY[0x1895F87A8];
    v22[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
    v22[1] = (void (*)(void, void))3221225472LL;
    v22[2] = (void (*)(void, void))___LSHandlerPrefRemoveAllWithBundleID_block_invoke_2;
    v22[3] = (void (*)(void, void))&unk_189D77F30;
    id v7 = v3;
    id v23 = v7;
    id v8 = v4;
    id v25 = v8;
    id v9 = v5;
    id v24 = v9;
    +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDModifyService, v22);
    uint64_t v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472LL;
    v18[2] = ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_49;
    v18[3] = &unk_189D77F58;
    id v19 = v7;
    id v21 = v8;
    id v20 = v9;
    [v10 removeAllHandlerPrefsForBundleID:v19 completionHandler:v18];
    unint64_t v11 = &v23;
    int v12 = &v25;
    uint64_t v13 = &v24;
    uint64_t v14 = &v19;

    int v15 = v21;
  }

LABEL_8:
}

void sub_183F51B50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21, void *a22, void *a23)
{
  _Unwind_Resume(a1);
}

void sub_183F51EAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)&a9);
  _Unwind_Resume(a1);
}

void sub_183F51FB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F52044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LaunchServices::PrefsStorage *LaunchServices::PrefsStorage::PrefsStorage(LaunchServices::PrefsStorage *this)
{
  v2 = (LaunchServices::PrefsStorage *)((char *)this + 4);
  *(void *)this = 0xFFFFFFFF00000000LL;
  *((void *)this + 1) = 0LL;
  *((_DWORD *)this + 4) = 0;
  *((void *)this + 3) = [MEMORY[0x189603FC8] dictionary];
  [(id)__LSDefaultsGetSharedInstance() preferencesUpdateNotificationName];
  id v3 = (LaunchServices::notifyd::NotifyToken *)objc_claimAutoreleasedReturnValue();
  LaunchServices::notifyd::NotifyToken::RegisterCheck(v3, &v8);
  LaunchServices::notifyd::NotifyToken::operator=(v2, (LaunchServices::notifyd::NotifyToken *)&v8);
  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&v8);

  uint64_t State = LaunchServices::notifyd::NotifyToken::getState(v2);
  if (v5)
  {
    uint64_t v6 = State;
    os_unfair_lock_lock((os_unfair_lock_t)this);
    *((void *)this + 1) = v6;
    os_unfair_lock_unlock((os_unfair_lock_t)this);
  }

  LaunchServices::PrefsStorage::_update((os_unfair_lock_s *)this);
  return this;
}

void sub_183F52110(_Unwind_Exception *a1)
{
  LaunchServices::notifyd::NotifyToken::~NotifyToken(v1);
  _Unwind_Resume(a1);
}

void LaunchServices::PrefsStorage::_update(os_unfair_lock_s *this)
{
  uint64_t v7 = 0LL;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = __Block_byref_object_copy__54_0;
  unint64_t v11 = __Block_byref_object_dispose__55_0;
  id v12 = 0LL;
  if (([(id)__LSDefaultsGetSharedInstance() isServer] & 1) != 0
    || ([(id)__LSDefaultsGetSharedInstance() hasServer] & 1) == 0)
  {
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke;
    v6[3] = &unk_189D77EE0;
    v6[4] = &v7;
    _LSWithInsecurePreferences(v6);
  }

  else
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]( (uint64_t)&OBJC_CLASS____LSDReadService,  __block_literal_global_54);
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke_57;
    v5[3] = &unk_189D77FA0;
    v5[4] = &v7;
    [v2 getPreferencesWithCompletionHandler:v5];
  }

  if (v8[5])
  {
    os_unfair_lock_lock(this + 4);
    CFPropertyListRef DeepCopy = CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x189604DB0], (CFPropertyListRef)v8[5], 1uLL);
    id v4 = *(void **)&this[6]._os_unfair_lock_opaque;
    *(void *)&this[6]._os_unfair_lock_opaque = DeepCopy;

    os_unfair_lock_unlock(this + 4);
  }

  _Block_object_dispose(&v7, 8);
}

void sub_183F522B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::PrefsStorage::preferenceKeyMayBeSelfSet( LaunchServices::PrefsStorage *this, NSString *a2)
{
  return [MEMORY[0x189604A58] containsObject:this];
}

BOOL LaunchServices::PrefsStorage::_needsUpdate(os_unfair_lock_s *this)
{
  uint64_t State = LaunchServices::notifyd::NotifyToken::getState((LaunchServices::notifyd::NotifyToken *)&this[1]);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = State;
  os_unfair_lock_lock(this);
  uint64_t v6 = *(void *)&this[2]._os_unfair_lock_opaque;
  BOOL v7 = v6 != v4;
  if (v6 != v4)
  {
    LaunchServices::PrefsStorage::_GetLog(v5);
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      LaunchServices::PrefsStorage::_needsUpdate(&this[2]._os_unfair_lock_opaque, v4, v8);
    }

    *(void *)&this[2]._os_unfair_lock_opaque = v4;
  }

  os_unfair_lock_unlock(this);
  return v7;
}

id LaunchServices::PrefsStorage::_GetLog(LaunchServices::PrefsStorage *this)
{
  return (id)LaunchServices::PrefsStorage::_GetLog(void)::result;
}

uint64_t __Block_byref_object_copy__54_0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__55_0(uint64_t a1)
{
}

void ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke(uint64_t a1, void *a2)
{
}

void ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  LaunchServices::PrefsStorage::_GetLog(v2);
  char v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke_2_cold_1();
  }
}

void ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke_57(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  BOOL v7 = a3;
  unsigned int v8 = v7;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }

  else
  {
    LaunchServices::PrefsStorage::_GetLog(v7);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke_2_cold_1();
    }
  }
}

void LaunchServices::PrefsStorage::_updateOtherProcesses(os_unfair_lock_s *this)
{
  uint64_t State = LaunchServices::notifyd::NotifyToken::getState((LaunchServices::notifyd::NotifyToken *)&this[1]);
  if (v3)
  {
    uint64_t v4 = (LaunchServices::PrefsStorage *)LaunchServices::notifyd::NotifyToken::setState( (LaunchServices::notifyd::NotifyToken *)&this[1],  State + 1);
    LaunchServices::PrefsStorage::_GetLog(v4);
    char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      LaunchServices::PrefsStorage::_updateOtherProcesses();
    }
  }

  os_unfair_lock_unlock(this);
}

void LaunchServices::PrefsStorage::_setNeedsUpdate(os_unfair_lock_s *this)
{
  *(void *)&this[2]._os_unfair_lock_opaque = -1LL;
  LaunchServices::PrefsStorage::_GetLog(v2);
  char v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    LaunchServices::PrefsStorage::_setNeedsUpdate(v3);
  }

  os_unfair_lock_unlock(this);
}

__CFString *LaunchServices::PrefsStorage::_GetBundleIdentifierWithAppNode(void *a1, void *a2)
{
  id v3 = a1;
  id v12 = 0LL;
  [v3 bundleIdentifierWithError:&v12];
  uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v5 = v12;
  id v6 = v5;
  if (!v4)
  {
    if ([v5 code] == -10813
      && ([v6 domain],
          BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 isEqual:*MEMORY[0x189607670]],
          v7,
          v8))
    {
      LaunchServices::PrefsStorage::_GetLog(v9);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        LaunchServices::PrefsStorage::_GetBundleIdentifierWithAppNode();
      }

      uint64_t v4 = &stru_189D7B4C8;
    }

    else
    {
      uint64_t v4 = 0LL;
      if (a2) {
        *a2 = v6;
      }
    }
  }

  return v4;
}

void sub_183F526BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::PrefsStorage::_GetIndexOfValueForNodeInPrefsArray( LaunchServices::PrefsStorage *this, NSArray *a2, FSNode *a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v4 = this;
  id v5 = a2;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "static NSInteger LaunchServices::PrefsStorage::_GetIndexOfValueForNodeInPrefsArray(NSArray *__strong, FSNode *__strong)");
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInFunction:v17, @"LSPrefs.mm", 1353, @"Invalid parameter not satisfying: %@", @"appNode != nil" file lineNumber description];
  }

  id v6 = v5;
  BOOL v7 = v4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "static NSInteger LaunchServices::PrefsStorage::_GetIndexOfValueInPrefsArrayWithPredicate(NSArray *__strong, const Pred &) [Pred = (lambda at /Library/Caches/com.apple.xbs/Sources/CoreServices/LaunchServices.subprj/Source/LaunchS ervices/Info/LSPrefs.mm:1355:63)]");
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 handleFailureInFunction:v19, @"LSPrefs.mm", 1331, @"Invalid parameter not satisfying: %@", @"prefsArray != nil" file lineNumber description];
  }

  unint64_t v8 = -[LaunchServices::PrefsStorage count](v7, "count");
  if (v8)
  {
    for (unint64_t i = 0LL; i < v8; i += 2LL)
    {
      -[LaunchServices::PrefsStorage objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", i);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10
        && _NSIsNSData()
        && (unint64_t v11 = (LaunchServices::PrefsStorage *)_LSAliasMatchesNode(v10, v6), (_DWORD)v11)
        && (uint64_t v12 = i + 1, i + 1 < v8))
      {
        LaunchServices::PrefsStorage::_GetLog(v11);
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          -[LaunchServices::PrefsStorage objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", i + 1);
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218243;
          unint64_t v21 = i;
          __int16 v22 = 2113;
          id v23 = v14;
          _os_log_debug_impl( &dword_183E58000,  v13,  OS_LOG_TYPE_DEBUG,  "Found matched pref in prefs array at index %llu. Current value is %{private}@",  buf,  0x16u);
        }
      }

      else
      {
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }

      if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
    }
  }

  else
  {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

void sub_183F5295C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  BOOL v7 = a1;
  unint64_t v8 = a2;
  id v10 = a3;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "static BOOL LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray(NSMutableArray *__strong, FSNode *__strong, __strong id, NSError *__autoreleasing *)");
    int v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 handleFailureInFunction:v18, @"LSPrefs.mm", 1402, @"Invalid parameter not satisfying: %@", @"prefsArray != nil" file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( NSString,  "stringWithUTF8String:",  "static BOOL LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray(NSMutableArray *__strong, FSNode *__strong, _ _strong id, NSError *__autoreleasing *)");
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 handleFailureInFunction:v20, @"LSPrefs.mm", 1403, @"Invalid parameter not satisfying: %@", @"appNode != nil" file lineNumber description];

LABEL_3:
  IndexOfValueForNodeInPrefsArray = (LaunchServices::PrefsStorage *)LaunchServices::PrefsStorage::_GetIndexOfValueForNodeInPrefsArray( v7,  v8,  v9);
  LaunchServices::PrefsStorage::_GetLog(IndexOfValueForNodeInPrefsArray);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (IndexOfValueForNodeInPrefsArray == (LaunchServices::PrefsStorage *)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v10)
    {
      if (v13) {
        LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray();
      }

      -[NSArray bookmarkDataRelativeToNode:error:](v8, "bookmarkDataRelativeToNode:error:", 0LL, a4);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v14 = v12 != 0LL;
      if (!v12) {
        goto LABEL_16;
      }
      -[LaunchServices::PrefsStorage addObject:](v7, "addObject:", v12);
      -[LaunchServices::PrefsStorage addObject:](v7, "addObject:", v10);
    }

    else if (v13)
    {
      LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray();
    }

    BOOL v14 = 1LL;
LABEL_16:

    goto LABEL_21;
  }

  if (v10)
  {
    if (v13)
    {
      -[LaunchServices::PrefsStorage objectAtIndexedSubscript:]( v7,  "objectAtIndexedSubscript:",  IndexOfValueForNodeInPrefsArray);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478339;
      __int16 v22 = v16;
      __int16 v23 = 2113;
      uint64_t v24 = v8;
      __int16 v25 = 2113;
      id v26 = v10;
      _os_log_debug_impl( &dword_183E58000,  v12,  OS_LOG_TYPE_DEBUG,  "Replacing value %{private}@ for app node %{private}@ with value %{private}@.",  buf,  0x20u);
    }

    -[LaunchServices::PrefsStorage setObject:atIndexedSubscript:]( v7,  "setObject:atIndexedSubscript:",  v10,  IndexOfValueForNodeInPrefsArray);
  }

  else
  {
    if (v13) {
      LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray();
    }

    -[LaunchServices::PrefsStorage removeObjectAtIndex:](v7, "removeObjectAtIndex:", IndexOfValueForNodeInPrefsArray);
    -[LaunchServices::PrefsStorage removeObjectAtIndex:]( v7,  "removeObjectAtIndex:",  (char *)IndexOfValueForNodeInPrefsArray - 1);
  }

  BOOL v14 = 1LL;
LABEL_21:

  return v14;
}

void sub_183F52CB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN14LaunchServices12PrefsStorage7_GetLogEv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.launchservices", "prefs-storage");
  v1 = (void *)LaunchServices::PrefsStorage::_GetLog(void)::result;
  LaunchServices::PrefsStorage::_GetLog(void)::__n128 result = (uint64_t)v0;
}

uint64_t LaunchServices::PrefsStorage::GetShared(LaunchServices::PrefsStorage *this)
{
  return LaunchServices::PrefsStorage::GetShared(void)::result;
}

LaunchServices::PrefsStorage *___ZN14LaunchServices12PrefsStorage9GetSharedEv_block_invoke()
{
  os_log_t v0 = (LaunchServices::PrefsStorage *)operator new(0x20uLL);
  __n128 result = LaunchServices::PrefsStorage::PrefsStorage(v0);
  LaunchServices::PrefsStorage::GetShared(void)::__n128 result = (uint64_t)v0;
  return result;
}

void sub_183F52DCC(_Unwind_Exception *a1)
{
}

id LaunchServices::PrefsStorage::getAllPreferences(LaunchServices::PrefsStorage *this)
{
  uint64_t v2 = (os_unfair_lock_s *)((char *)this + 16);
  os_unfair_lock_lock((os_unfair_lock_t)this + 4);
  CFPropertyListRef DeepCopy = (void *)CFPropertyListCreateDeepCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  *((CFPropertyListRef *)this + 3),  0LL);
  os_unfair_lock_unlock(v2);
  return DeepCopy;
}

BOOL LaunchServices::PrefsStorage::setValueForNode(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v34 = 0LL;
  __int128 v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 0;
  if (([(id)__LSDefaultsGetSharedInstance() isServer] & 1) != 0
    || ![(id)__LSDefaultsGetSharedInstance() hasServer])
  {
    if (v9 && v10)
    {
      LaunchServices::PrefsStorage::_GetBundleIdentifierWithAppNode(v10, a5);
      int v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
        [*(id *)(a1 + 24) objectForKeyedSubscript:v9];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        [v16 objectForKeyedSubscript:v15];
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
        int v18 = (void *)[v17 mutableCopy];

        if (!v18)
        {
          [MEMORY[0x189603FA8] array];
          int v18 = (void *)objc_claimAutoreleasedReturnValue();
        }

        BOOL v19 = LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray(v18, v10, v11, (uint64_t)a5);
        *((_BYTE *)v35 + 24) = v19;
        if (v19)
        {
          [*(id *)(a1 + 24) objectForKeyedSubscript:v9];
          id v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            LaunchServices::PrefsStorage::_GetLog(0LL);
            unint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
              LaunchServices::PrefsStorage::setValueForNode();
            }

            [MEMORY[0x189603FC8] dictionary];
            id v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 24), "setObject:forKeyedSubscript:");
          }

          __int16 v22 = (void *)[v18 copy];
          [v20 setObject:v22 forKeyedSubscript:v15];

          v29[0] = MEMORY[0x1895F87A8];
          v29[1] = 3221225472LL;
          v29[2] = ___ZN14LaunchServices12PrefsStorage15setValueForNodeEP8NSStringP6FSNodeP11objc_objectPU15__autoreleasingP7NSError_block_invoke_74;
          v29[3] = &unk_189D78030;
          id v30 = v9;
          id v23 = v20;
          id v31 = v23;
          _LSWithMutableInsecurePreferences(v29);
          LaunchServices::PrefsStorage::_updateOtherProcesses((os_unfair_lock_s *)a1);
        }

        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
        if (*((_BYTE *)v35 + 24))
        {
          LaunchServices::PrefsStorage::_GetLog(v24);
          __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543875;
            *(void *)&uint8_t buf[4] = v9;
            *(_WORD *)&buf[12] = 2113;
            *(void *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2113;
            __int128 v41 = (uint64_t (*)(uint64_t, uint64_t))v11;
            _os_log_debug_impl( &dword_183E58000,  v25,  OS_LOG_TYPE_DEBUG,  "SET prefs[%{public}@][%{private}@] = %{private}@",  buf,  0x20u);
          }
        }
      }
    }

    else if (a5)
    {
      uint64_t v38 = *MEMORY[0x189607490];
      __int128 v39 = @"invalid input parameters";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -50LL, (uint64_t)"setValueForNode", 1585LL, v26);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    __int128 v41 = __Block_byref_object_copy__54_0;
    __int128 v42 = __Block_byref_object_dispose__55_0;
    id v43 = 0LL;
    uint64_t v12 = MEMORY[0x1895F87A8];
    v33[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
    v33[1] = (void (*)(void, void))3221225472LL;
    v33[2] = (void (*)(void, void))___ZN14LaunchServices12PrefsStorage15setValueForNodeEP8NSStringP6FSNodeP11objc_objectPU15__autoreleasingP7NSError_block_invoke;
    v33[3] = (void (*)(void, void))&unk_189D72338;
    _OWORD v33[4] = (void (*)(void, void))buf;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDModifyService, v33);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 URL];
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v12;
    v32[1] = 3221225472LL;
    v32[2] = ___ZN14LaunchServices12PrefsStorage15setValueForNodeEP8NSStringP6FSNodeP11objc_objectPU15__autoreleasingP7NSError_block_invoke_2;
    v32[3] = &unk_189D78008;
    v32[4] = &v34;
    v32[5] = buf;
    [v13 setPreferenceValue:v11 forKey:v9 forApplicationAtURL:v14 completionHandler:v32];

    if (*((_BYTE *)v35 + 24))
    {
      LaunchServices::PrefsStorage::_setNeedsUpdate((os_unfair_lock_s *)a1);
    }

    else if (a5)
    {
      *a5 = *(id *)(*(void *)&buf[8] + 40LL);
    }

    _Block_object_dispose(buf, 8);
  }

  BOOL v27 = *((_BYTE *)v35 + 24) != 0;
  _Block_object_dispose(&v34, 8);

  return v27;
}

void sub_183F532B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void ___ZN14LaunchServices12PrefsStorage15setValueForNodeEP8NSStringP6FSNodeP11objc_objectPU15__autoreleasingP7NSError_block_invoke( uint64_t a1, void *a2)
{
}

void ___ZN14LaunchServices12PrefsStorage15setValueForNodeEP8NSStringP6FSNodeP11objc_objectPU15__autoreleasingP7NSError_block_invoke_2( uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), obj);
}

void ___ZN14LaunchServices12PrefsStorage15setValueForNodeEP8NSStringP6FSNodeP11objc_objectPU15__autoreleasingP7NSError_block_invoke_74( uint64_t a1, CFMutableDictionaryRef theDict)
{
}

void _LSWithMutableInsecurePreferences(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = (void *)MEMORY[0x186E2A59C]();
    __int16 v5 = 0;
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = ___LSWithMutableInsecurePreferences_block_invoke;
    v3[3] = &unk_189D780C0;
    id v4 = v1;
    _LSPreferences::With(&v5, v3);

    objc_autoreleasePoolPop(v2);
  }
}

void sub_183F5347C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _LSPreferences::With(_BYTE *a1, void *a2)
{
  id v4 = a2;
  if (a1 && v4)
  {
    if (_LSPreferences::With(_LSPreferences::SecurityContext const*,void({block_pointer})(void const*))::once != -1) {
      dispatch_once( &_LSPreferences::With(_LSPreferences::SecurityContext const*,void({block_pointer})(void const*))::once,  &__block_literal_global_55);
    }
    id v3 = &_LSPreferences::With(_LSPreferences::SecurityContext const*,void({block_pointer})(void const*))::insecurePrefs;
    if (*a1) {
      id v3 = &_LSPreferences::With(_LSPreferences::SecurityContext const*,void({block_pointer})(void const*))::securePrefs;
    }
    _LSPreferences::with((dispatch_queue_t *)*v3, (uint64_t)a1, v4);
  }
}

void sub_183F5352C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void _LSWithInsecurePreferences(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = (void *)MEMORY[0x186E2A59C]();
    __int16 v5 = 256;
    v3[0] = MEMORY[0x1895F87A8];
    v3[1] = 3221225472LL;
    v3[2] = ___LSWithInsecurePreferences_block_invoke;
    v3[3] = &unk_189D780C0;
    id v4 = v1;
    _LSPreferences::With(&v5, v3);

    objc_autoreleasePoolPop(v2);
  }
}

void sub_183F535E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _LSPreferences::_LSPreferences(_LSPreferences *this, char a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  *(_BYTE *)this = a2;
  *((_DWORD *)this + 8) = -1;
  id v3 = (_LSPreferences *)((char *)this + 32);
  *((void *)this + 2) = 0LL;
  *((void *)this + 3) = 0LL;
  *((void *)this + 1) = 0LL;
  snprintf(__str, 0x100uLL, "com.apple.launchservices.prefs-%p", this);
  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1895F8AF8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v5 = dispatch_queue_create(__str, v4);
  id v6 = (void *)*((void *)this + 3);
  *((void *)this + 3) = v5;

  _LSPreferences::load((dispatch_queue_t *)this, 0);
  BOOL v7 = (void *)MEMORY[0x186E2A59C]();
  [(id)__LSDefaultsGetSharedInstance() preferencesFileChangeNotificationName];
  unint64_t v8 = (LaunchServices::notifyd::NotifyToken *)objc_claimAutoreleasedReturnValue();
  LaunchServices::notifyd::NotifyToken::RegisterCheck(v8, &v9);
  LaunchServices::notifyd::NotifyToken::operator=(v3, (LaunchServices::notifyd::NotifyToken *)&v9);
  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&v9);

  objc_autoreleasePoolPop(v7);
}

void sub_183F53728( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, char a12)
{
  LaunchServices::notifyd::NotifyToken::~NotifyToken(v13);
  _Unwind_Resume(a1);
}

void _LSPreferences::load(dispatch_queue_t *this, int a2)
{
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = ___ZN14_LSPreferences4loadEb_block_invoke;
  v7[3] = &__block_descriptor_40_e5_v8__0l;
  v7[4] = this;
  id v4 = (void (**)(void))MEMORY[0x186E2A7B8](v7);
  dispatch_queue_t v5 = v4;
  if (a2)
  {
    dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v4);

    dispatch_barrier_async(this[3], v6);
    dispatch_queue_t v5 = v6;
  }

  else
  {
    v4[2](v4);
  }
}

void sub_183F53830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN14_LSPreferences4loadEb_block_invoke(uint64_t a1)
{
  id v1 = *(unsigned __int8 **)(a1 + 32);
  if ([(id)__LSDefaultsGetSharedInstance() hasPersistentPreferences])
  {
    uint64_t v2 = (void *)*((void *)v1 + 1);
    *((void *)v1 + 1) = 0LL;

    id v3 = (void *)MEMORY[0x186E2A59C]();
    int v4 = *v1;
    SharedInstance = (void *)__LSDefaultsGetSharedInstance();
    if (v4) {
      [SharedInstance securePreferencesFileURL];
    }
    else {
    uint64_t v6 = [SharedInstance preferencesFileURL];
    }
    BOOL v7 = (void *)*((void *)v1 + 2);
    *((void *)v1 + 2) = v6;

    objc_autoreleasePoolPop(v3);
    unint64_t v8 = (void *)MEMORY[0x186E2A59C]();
    id v9 = objc_alloc(MEMORY[0x189603F68]);
    uint64_t v10 = *((void *)v1 + 2);
    id v24 = 0LL;
    uint64_t v11 = [v9 initWithContentsOfURL:v10 error:&v24];
    id v12 = v24;
    BOOL v13 = (void *)*((void *)v1 + 1);
    *((void *)v1 + 1) = v11;

    if (!*((void *)v1 + 1))
    {
      char v14 = *v1;
      id v15 = *((id *)v1 + 2);
      dispatch_get_global_queue(-2LL, 0LL);
      uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = ___ZN14_LSPreferences4loadEb_block_invoke_2;
      v20[3] = &unk_189D76A78;
      char v23 = v14;
      id v21 = v15;
      id v22 = v12;
      id v17 = v15;
      dispatch_async(v16, v20);
    }

    objc_autoreleasePoolPop(v8);
  }

  if (!*((void *)v1 + 1))
  {
    id v18 = objc_alloc_init(MEMORY[0x189603F68]);
    BOOL v19 = (void *)*((void *)v1 + 1);
    *((void *)v1 + 1) = v18;
  }

void ___ZN14_LSPreferences4loadEb_block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (void *)MEMORY[0x186E2A59C]();
  _LSDefaultLog();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = *(unsigned __int8 *)(a1 + 48);
    [*(id *)(a1 + 32) path];
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = 67109634;
    v7[1] = v4;
    __int16 v8 = 2112;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_error_impl( &dword_183E58000,  v3,  OS_LOG_TYPE_ERROR,  "Failed to read LS preferences (secure? %{BOOL}i) from %@: %@",  (uint8_t *)v7,  0x1Cu);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_183F53ABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _LSPreferences::with(dispatch_queue_t *a1, uint64_t a2, void *a3)
{
  dispatch_queue_t v5 = a3;
  if (v5)
  {
    unint64_t v6 = LaunchServices::notifyd::NotifyToken::checkValue((LaunchServices::notifyd::NotifyToken *)(a1 + 4));
    if ((v6 & 0xFF00000000LL) != 0 && (_DWORD)v6) {
      _LSPreferences::load(a1, 1);
    }
    if (*(_BYTE *)(a2 + 1))
    {
      uint64_t v14 = 0LL;
      id v15 = &v14;
      uint64_t v16 = 0x3032000000LL;
      id v17 = __Block_byref_object_copy__34;
      id v18 = __Block_byref_object_dispose__34;
      BOOL v19 = 0LL;
      BOOL v7 = a1[3];
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = ___ZN14_LSPreferences4withEPKNS_15SecurityContextEU13block_pointerFvPKvE_block_invoke;
      block[3] = &unk_189D75E18;
      block[4] = &v14;
      block[5] = a1;
      dispatch_sync(v7, block);
      if (v15[5]) {
        v5[2](v5);
      }
      _Block_object_dispose(&v14, 8);
      __int16 v8 = v19;
    }

    else
    {
      id v9 = a1[3];
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 3221225472LL;
      v10[2] = ___ZN14_LSPreferences4withEPKNS_15SecurityContextEU13block_pointerFvPKvE_block_invoke_2;
      v10[3] = &unk_189D75DC8;
      uint64_t v12 = a1;
      uint64_t v11 = v5;
      dispatch_barrier_sync(v9, v10);
      __int16 v8 = v11;
    }
  }
}

void sub_183F53C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__34(uint64_t a1)
{
}

void ___ZN14_LSPreferences4withEPKNS_15SecurityContextEU13block_pointerFvPKvE_block_invoke(uint64_t a1)
{
  id v1 = *(void **)(*(void *)(a1 + 40) + 8LL);
  if (v1) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), v1);
  }
}

void ___ZN14_LSPreferences4withEPKNS_15SecurityContextEU13block_pointerFvPKvE_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 40);
  id v3 = v2[1];
  if (v3)
  {
    int v4 = (NSDictionary *)[v3 mutableCopy];
    if (v4)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      if (([v2[1] isEqual:v4] & 1) == 0) {
        _LSPreferences::save((_LSPreferences *)v2, v4);
      }
    }
  }

void sub_183F53D04( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void _LSPreferences::save(_LSPreferences *this, NSDictionary *a2)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  int v4 = v3;
  if (v3)
  {
    dispatch_queue_t v5 = (NSDictionary *)*((void *)this + 1);
    if (v5) {
      BOOL v6 = v5 == v3;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v3 copyItems:1];
      __int16 v8 = (void *)*((void *)this + 1);
      *((void *)this + 1) = v7;
    }

    if (*((void *)this + 2)
      && [(id)__LSDefaultsGetSharedInstance() hasPersistentPreferences])
    {
      id v20 = 0LL;
      [MEMORY[0x1896079E8] dataWithPropertyList:v4 format:200 options:0 error:&v20];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = v20;
      if (v9)
      {
        uint64_t v11 = [MEMORY[0x1896078A8] defaultManager];
        [(id)v11 removeItemAtURL:*((void *)this + 2) error:0];

        uint64_t v12 = *((void *)this + 2);
        id v19 = v10;
        LOBYTE(v11) = [v9 writeToURL:v12 options:268435457 error:&v19];
        id v13 = v19;

        if ((v11 & 1) != 0)
        {
LABEL_17:

          goto LABEL_18;
        }

        _LSDefaultLog();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v15 = *(unsigned __int8 *)this;
          [*((id *)this + 2) path];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109634;
          int v22 = v15;
          __int16 v23 = 2112;
          id v24 = v16;
          __int16 v25 = 2112;
          id v26 = v13;
          _os_log_error_impl( &dword_183E58000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to save LS preferences (secure? %{BOOL}i) to %@: %@",  buf,  0x1Cu);
        }
      }

      else
      {
        _LSDefaultLog();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v17 = *(unsigned __int8 *)this;
          [*((id *)this + 2) path];
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109634;
          int v22 = v17;
          __int16 v23 = 2112;
          id v24 = v18;
          __int16 v25 = 2112;
          id v26 = v10;
          _os_log_error_impl( &dword_183E58000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to serialize LS preferences (secure? %{BOOL}i) to %@: %@",  buf,  0x1Cu);
        }

        id v13 = v10;
      }

      goto LABEL_17;
    }
  }

void sub_183F53F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN14_LSPreferences4WithEPKNS_15SecurityContextEU13block_pointerFvPKvE_block_invoke()
{
  os_log_t v0 = (_LSPreferences *)operator new(0x28uLL);
  _LSPreferences::_LSPreferences(v0, 0);
  _LSPreferences::With(_LSPreferences::SecurityContext const*,void({block_pointer})(void const*))::insecurePrefs = (uint64_t)v0;
  id v1 = (_LSPreferences *)operator new(0x28uLL);
  _LSPreferences::_LSPreferences(v1, 1);
  _LSPreferences::With(_LSPreferences::SecurityContext const*,void({block_pointer})(void const*))::securePrefs = (uint64_t)v1;
}

void sub_183F54018(_Unwind_Exception *a1)
{
}

uint64_t _LSGetProfileValidationStateFromInstallDictionary(const __CFDictionary *a1)
{
  uint64_t result = (uint64_t)_LSGetBooleanFromDict(a1, @"ProfileValidated");
  if ((_DWORD)result)
  {
    if (_LSGetBooleanFromDict(a1, @"UPPValidated"))
    {
      return 2LL;
    }

    else if (_LSGetBooleanFromDict(a1, @"FreeProfileValidated"))
    {
      return 3LL;
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

__CFString *_LSProfileValidationStateGetVisualizationDescription(unsigned int a1)
{
  if (a1 > 3) {
    return 0LL;
  }
  else {
    return off_189D78100[(char)a1];
  }
}

void sub_183F540D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F54134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F542CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F542FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F543C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F544B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F54544( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZL16pluginQueryFaultv_block_invoke_0()
{
  os_log_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __pluginQueryFault_block_invoke_cold_1_0(v0);
  }
}

void sub_183F54630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F54708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F548E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F54A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F54AAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F54C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F54FB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__35(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_183F550F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_183F554D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F55634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F556B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F558BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F55B34( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

LABEL_27:
    }

    id v18 = v51[5];
  }

  if (a5 && !v18)
  {
    *a5 = *(id *)(v48[0] + 40LL);
    id v18 = v51[5];
  }

  uint64_t v34 = v18;
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v50, 8);
  return v34;
}

          CFRelease(v9);
          goto LABEL_13;
        }
      }

      else
      {
        uint64_t v11 = LSBundleProvider::CFBundleCopyResourceURL( (LSBundleProvider *)-[_LSBundleProvider provider](v19, "provider"),  Value,  0LL,  0LL);
        if (v11
          || (uint64_t v11 = LSBundleProvider::CFBundleCopyResourceURL( (LSBundleProvider *)-[_LSBundleProvider provider](v19, "provider"),  Value,  @"icns",  0LL)) != 0LL)
        {
          CFRelease(v11);
        }

        else
        {
          id v18 = (__CFString *)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"Can't find referenced icon resource %@.",  Value);
          if (v18)
          {
            _LSRegistrationWarningPath((uint64_t)-[_LSBundleProvider bundlePath](v19, "bundlePath"), v18);
            CFRelease(v18);
          }
        }

        id v10 = gLogRegistrationErrors;
      }

      if (v10)
      {
        CFGetTypeID(Value);
        ClassWithTypeID = _CFRuntimeGetClassWithTypeID();
        uint64_t v16 = "<unknown>";
        if (ClassWithTypeID)
        {
          int v17 = *(const char **)(ClassWithTypeID + 8);
          if (v17) {
            uint64_t v16 = v17;
          }
        }

        id v9 = (__CFString *)CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"For plist key %@, value has class %s (should be CFString).",  a3,  v16);
        if (v9)
        {
          uint64_t v12 = CFURLCopyFileSystemPath( *(CFURLRef *)-[_LSBundleProvider provider](v19, "provider"),  kCFURLPOSIXPathStyle);
          _LSRegistrationWarningPath((uint64_t)v12, v9);
          if (v12)
          {
LABEL_26:
            CFRelease(v12);
            goto LABEL_27;
          }

          goto LABEL_27;
        }
      }
    }
  }

  else
  {
    CFStringGetTypeID();
  }

        unint64_t v28 = 0LL;
        goto LABEL_19;
      }

      v33 = 0;
      id v13 = _LSFindOrRegisterBundleNode(v12, a2, 0LL, 0x2000000u, 0LL, (unsigned int *)&v33, 0LL);
      if (v13 != -10811)
      {
        if (!v13)
        {
          uint64_t v14 = (void *)_LSBundleCopyArchitecturesAvailable(v12->db, v33);
          int v15 = _LSBundleCopyArchitecturesValidOnCurrentSystem(v12->db, v33);
          uint64_t v16 = v15;
          int v17 = *MEMORY[0x189604B80];
          if (v14 && v15)
          {
            MEMORY[0x186E297E0](a3, v17, v14);
            id v18 = v16;
          }

          else
          {
            id v18 = (const __CFArray *)MEMORY[0x189604A58];
            MEMORY[0x186E297E0](a3, v17, MEMORY[0x189604A58]);
          }

          MEMORY[0x186E297E0](a3, *MEMORY[0x189604BA0], v18);

          goto LABEL_18;
        }

        if (a6)
        {
          _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], v13, (uint64_t)"prepareArchitecturesValue", 2030LL, 0LL);
          __int128 v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
          unint64_t v28 = 0LL;
          *a6 = v32;
          goto LABEL_19;
        }

        goto LABEL_27;
      }

      MEMORY[0x186E297E0](a3, *MEMORY[0x189604B80], 0LL);
      MEMORY[0x186E297E0](a3, *MEMORY[0x189604BA0], 0LL);
    }

    else
    {
      MEMORY[0x186E297E0](a3, *MEMORY[0x189604B80], 0LL);
      MEMORY[0x186E297E0](a3, *MEMORY[0x189604BA0], 0LL);
    }

      ++v19;
      ++v18;
      if (!--v20) {
        goto LABEL_33;
      }
    }

    if (v51)
    {
      if (v16)
      {
LABEL_15:
        uint64_t v16 = v16;
        goto LABEL_21;
      }
    }

    else
    {
      __int128 v51 = objc_alloc_init(MEMORY[0x189603FE0]);
      if (v16) {
        goto LABEL_15;
      }
    }

    LaunchServices::URLPropertyProvider::prepareValues(__CFURL const*,__FileCache *,__CFString const* const*,void const**,long,void const*,__CFError **)::$_0::operator()(v61);
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23) {
      id v24 = -[FSMimicPopulator initWithNode:](objc_alloc(&OBJC_CLASS___FSMimicPopulator), "initWithNode:", v23);
    }
    else {
      id v24 = 0LL;
    }

    uint64_t v16 = v24;
    if (!v16)
    {
      *((_BYTE *)v75 + 24) = 0;
LABEL_26:

      goto LABEL_27;
    }

void sub_183F55FC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, id a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, id a38)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);

  _Unwind_Resume(a1);
}

void sub_183F56154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F561D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F562F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F56454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F56510( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F56548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F565E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F56808( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, id a29)
{
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__36(uint64_t a1)
{
}

void sub_183F568E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_183F56958( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_183F56A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F56B9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F56BF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F56C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F56CC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F56E20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F56E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F56F7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F571CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unsigned __int8 *_LSCheckRecordPISizeAndVersionReturningPIInnerBytes(void *a1, void *a2)
{
  v15[1] = *MEMORY[0x1895F89C0];
  if ((unint64_t)[a1 length] < 0x1C)
  {
    uint64_t v12 = *MEMORY[0x189607490];
    objc_msgSend( NSString,  "stringWithFormat:",  @"data length %zu is too short",  objc_msgSend(a1, "length"));
    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10810LL,  (uint64_t)"_LSCheckRecordPISizeAndVersionReturningPIInnerBytes",  225LL,  v9);
  }

  else
  {
    int v4 = (unsigned __int8 *)[a1 bytes];
    uint64_t v5 = *v4;
    if ((_DWORD)v5 == _LSPersistentIdentifierVersion)
    {
      BOOL v6 = v4;
      id v7 = 0LL;
      goto LABEL_9;
    }

    uint64_t v14 = *MEMORY[0x189607490];
    objc_msgSend(NSString, "stringWithFormat:", @"identifier version %d is unknown", v5);
    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10650LL,  (uint64_t)"_LSCheckRecordPISizeAndVersionReturningPIInnerBytes",  222LL,  v9);
  }

  id v7 = (id)v10;

  if (a2)
  {
    id v7 = v7;
    BOOL v6 = 0LL;
    *a2 = v7;
  }

  else
  {
    BOOL v6 = 0LL;
  }

void sub_183F573DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id LaunchServices::Record::findSubclassForTable(LaunchServices::Record *this, LSContext *a2)
{
  if (*(_DWORD *)(*(void *)this + 20LL) == (_DWORD)a2
    || *(_DWORD *)(*(void *)this + 1604LL) == (_DWORD)a2
    || *(_DWORD *)(*(void *)this + 32LL) == (_DWORD)a2
    || *(_DWORD *)(*(void *)this + 24LL) == (_DWORD)a2
    || *(_DWORD *)(*(void *)this + 1608LL) == (_DWORD)a2
    || *(_DWORD *)(*(void *)this + 1620LL) == (_DWORD)a2)
  {
    return (id)objc_opt_class();
  }

  else
  {
    return 0LL;
  }

void sub_183F57690( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)&a9);
  _Unwind_Resume(a1);
}

void sub_183F5783C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F57978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F57ABC()
{
}

void sub_183F57AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F57C3C(void *a1)
{
}

void sub_183F57C54(_Unwind_Exception *a1)
{
}

void sub_183F57DF4(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_recursive_lock_unlock();
  objc_exception_rethrow();
  __break(1u);
}

void sub_183F57E54(_Unwind_Exception *a1)
{
}

uint64_t LaunchServices::Record::checkForExfiltrationRisk(LaunchServices::Record *this, NSCoder *a2)
{
  if (LaunchServices::Record::checkForExfiltrationRisk(NSCoder *)::once != -1) {
    dispatch_once(&LaunchServices::Record::checkForExfiltrationRisk(NSCoder *)::once, &__block_literal_global_200);
  }
  if ((LaunchServices::Record::checkForExfiltrationRisk(NSCoder *)::isSafeToSendData & 1) != 0) {
    return 0LL;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0LL;
  }
  -[LaunchServices::Record connection](this, "connection");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 _xpcConnection];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (_LSXPCConnectionMayMapDatabase(v4) || _LSIsXPCConnectionPlatformBinary(v4))
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    __LAUNCH_SERVICES_CLIENT_MAY_BE_EXFILTRATING_PRIVACY_SENSITIVE_INFORMATION__();
    uint64_t v5 = 1LL;
  }

  return v5;
}

void sub_183F57F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id LaunchServices::Record::getNullPlaceholder(LaunchServices::Record *this)
{
  return (id)LaunchServices::Record::getNullPlaceholder(void)::result;
}

void sub_183F581EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F58468( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  if (a2)
  {
    operator delete(v10);

    objc_begin_catch(exception_object);
    os_unfair_recursive_lock_unlock();
    objc_exception_rethrow();
    __break(1u);
    JUMPOUT(0x183F584BCLL);
  }

  _Unwind_Resume(exception_object);
}

void sub_183F5858C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_recursive_lock_unlock();
  objc_exception_rethrow();
  __break(1u);
}

void sub_183F585B8(_Unwind_Exception *a1)
{
}

void sub_183F5866C(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_recursive_lock_unlock();
  objc_exception_rethrow();
  __break(1u);
}

void sub_183F58698(_Unwind_Exception *a1)
{
}

void sub_183F587FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__37(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__37(uint64_t a1)
{
}

void sub_183F588B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F58B5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F58C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_32c58_ZTSNSt3__16vectorIU6__weakP8LSRecordNS_9allocatorIS3_EEEE( uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  uint64_t v2 = (void *)(a1 + 32);
  v2[2] = 0LL;
  std::vector<LSRecord * {__weak}>::__init_with_size[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*>( v2,  *(id **)(a2 + 32),  *(id **)(a2 + 40),  (uint64_t)(*(void *)(a2 + 40) - *(void *)(a2 + 32)) >> 3);
}

void __destroy_helper_block_ea8_32c58_ZTSNSt3__16vectorIU6__weakP8LSRecordNS_9allocatorIS3_EEEE(uint64_t a1)
{
  id v1 = (void **)(a1 + 32);
  std::vector<LSRecord * {__weak}>::__destroy_vector::operator()[abi:nn180100](&v1);
}

void sub_183F58D90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  _Unwind_Resume(a1);
}

void std::vector<LSRecord *>::resize(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + _Block_object_dispose((const void *)(v2 - 80), 8) = *(void *)a1 + 8 * a2;
    }
  }

  else
  {
    std::vector<LSRecord *>::__append((void **)a1, a2 - v3, a3);
  }

void sub_183F58E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F58F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F592EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)&a13);
  _Unwind_Resume(a1);
}

void sub_183F59474()
{
}

void sub_183F594AC()
{
}

void sub_183F59670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F59888(_Unwind_Exception *a1)
{
  if (v2) {
    CFRelease(v2);
  }

  _Unwind_Resume(a1);
}

void sub_183F599A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F59A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__(uint64_t a1, const char *a2)
{
  if (!a2)
  {
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }

  uint64_t v2 = a2;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  sel_getName(v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void __LAUNCH_SERVICES_CLIENT_MAY_BE_EXFILTRATING_PRIVACY_SENSITIVE_INFORMATION__()
{
  os_log_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl( &dword_183E58000,  v0,  OS_LOG_TYPE_FAULT,  "Process is attempting to encode sensitive data from Launch Services in order to send it to a non-privileged client . This is a privacy bug in this process; please file a bug report.",
      v1,
      2u);
  }
}

void std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>::shrink_to_fit( uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = *(char **)a1;
  uint64_t v5 = *(_BYTE **)(a1 + 8);
  unint64_t v6 = (v5 - v4) >> 4;
  if (v6 < (v3 - (uint64_t)v4) >> 4)
  {
    if (v5 == v4)
    {
      uint64_t v11 = 0LL;
      uint64_t v9 = 16 * v6;
    }

    else
    {
      id v7 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<unsigned int,NSUUID * {__strong}>>>( v2,  v6);
      int v4 = *(char **)a1;
      __int16 v8 = *(char **)(a1 + 8);
      uint64_t v9 = (uint64_t)&v7[16 * v6];
      uint64_t v11 = &v7[16 * v10];
      if (v8 != *(char **)a1)
      {
        uint64_t v12 = v9;
        do
        {
          *(_OWORD *)(v12 - 16) = *((_OWORD *)v8 - 1);
          v12 -= 16LL;
          v8 -= 16;
        }

        while (v8 != v4);
        int v4 = *(char **)a1;
        goto LABEL_9;
      }
    }

    uint64_t v12 = v9;
LABEL_9:
    *(void *)a1 = v12;
    *(void *)(a1 + _Block_object_dispose((const void *)(v2 - 80), 8) = v9;
    *(void *)(a1 + 16) = v11;
    if (v4) {
      operator delete(v4);
    }
  }

void sub_183F59EA8(void *exc_buf)
{
}

void sub_183F59F04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN14LaunchServices6RecordL24checkForExfiltrationRiskEP7NSCoder_block_invoke()
{
  uint64_t result = [(id)__LSDefaultsGetSharedInstance() isServer];
  if ((result & 1) != 0
    || (uint64_t result = [(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure], (result & 1) != 0)
    || (uint64_t v1 = _LSGetAuditTokenForSelf(),
        uint64_t result = _LSCheckEntitlementForAuditToken(v1, @"com.apple.private.launchservices.canEncodeSensitiveData"),
        (_DWORD)result)
    || (v2 = (_OWORD *)_LSGetAuditTokenForSelf(), uint64_t result = (uint64_t)_LSIsAuditTokenPlatformBinary(v2), !(_DWORD)result))
  {
    LaunchServices::Record::checkForExfiltrationRisk(NSCoder *)::isSafeToSendData = 1;
  }

  return result;
}

void ___ZN14LaunchServices6RecordL18getNullPlaceholderEv_block_invoke()
{
  os_log_t v0 = objc_alloc_init(&OBJC_CLASS_____LSRECORD_NULL_PLACEHOLDER__);
  uint64_t v1 = (void *)LaunchServices::Record::getNullPlaceholder(void)::result;
  LaunchServices::Record::getNullPlaceholder(void)::uint64_t result = (uint64_t)v0;
}

id *std::vector<LSRecord * {__weak}>::erase(uint64_t a1, id *a2, id *a3)
{
  if (a2 != a3)
  {
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*,LSRecord * {__weak}*>( (int)&v9,  a3,  *(id **)(a1 + 8),  a2);
    unint64_t v6 = v5;
    id v7 = *(id **)(a1 + 8);
    if (v7 != v5)
    {
      do
        objc_destroyWeak(--v7);
      while (v7 != v6);
    }

    *(void *)(a1 + _Block_object_dispose((const void *)(v2 - 80), 8) = v6;
  }

  return a2;
}

id *std::remove[abi:nn180100]<std::__wrap_iter<LSRecord * {__weak}*>,decltype(nullptr)>(id *a1, id *a2)
{
  uint64_t v3 = std::__find_impl[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*,decltype(nullptr),std::__identity>( a1,  a2);
  int v4 = v3 + 1;
  if (v3 != a2 && v4 != a2)
  {
    do
    {
      id WeakRetained = objc_loadWeakRetained(v4);

      if (WeakRetained)
      {
        id v7 = objc_loadWeakRetained(v4);
        objc_storeWeak(v3, v7);

        ++v3;
      }

      ++v4;
    }

    while (v4 != a2);
  }

  return v3;
}

void ___ZN14LaunchServices6RecordL25detachRecordsOnMainThreadEPKP8LSRecordm_block_invoke()
{
  os_log_t v0 = (void **)LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool;
  uint64_t v1 = *(id **)LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool;
  uint64_t v2 = *(id **)(LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool + 8);
  if (*(id **)LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool == v2) {
    goto LABEL_6;
  }
  uint64_t v3 = *(id **)LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool;
  do
  {
    id WeakRetained = objc_loadWeakRetained(v3);
    [WeakRetained _resolveAllProperties];

    ++v3;
  }

  while (v3 != v2);
  do
  {
    id v5 = objc_loadWeakRetained(v1);
    [v5 detach];

    ++v1;
  }

  while (v1 != v2);
  os_log_t v0 = (void **)LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool;
  if (LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool)
  {
LABEL_6:
    unint64_t v6 = v0;
    std::vector<LSRecord * {__weak}>::__destroy_vector::operator()[abi:nn180100](&v6);
    operator delete(v0);
  }

  LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::detachPool = 0LL;
  LaunchServices::Record::detachRecordsOnMainThread(LSRecord * const*,unsigned long)::nilScanIndex = 0LL;
}

void sub_183F5A158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*,LSRecord * {__weak}*>( int a1, id *location, id *a3, id *a4)
{
  id v5 = location;
  if (location != a3)
  {
    do
    {
      id WeakRetained = objc_loadWeakRetained(v5);
      objc_storeWeak(a4, WeakRetained);

      ++v5;
      ++a4;
    }

    while (v5 != a3);
    return a3;
  }

  return v5;
}

id *std::__find_impl[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*,decltype(nullptr),std::__identity>( id *location, id *a2)
{
  uint64_t v2 = location;
  if (location != a2)
  {
    while (1)
    {
      id WeakRetained = objc_loadWeakRetained(v2);

      if (!WeakRetained) {
        break;
      }
      if (++v2 == a2) {
        return a2;
      }
    }
  }

  return v2;
}

id *std::vector<LSRecord * {__weak}>::__insert_with_size[abi:nn180100]<LSRecord * const*,LSRecord * const*>( uint64_t a1, id *a2, void **a3, void **a4, uint64_t a5)
{
  id v5 = a2;
  if (a5 < 1) {
    return v5;
  }
  id v7 = a3;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 3)
  {
    id v13 = *(id **)a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 3);
    if (v14 >> 61) {
      abort();
    }
    uint64_t v15 = a2 - v13;
    uint64_t v16 = v10 - (void)v13;
    if (v16 >> 2 > v14) {
      unint64_t v14 = v16 >> 2;
    }
    else {
      unint64_t v17 = v14;
    }
    _OWORD v33[4] = v9;
    if (v17) {
      id v18 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<os_eligibility_answer_t>>(v9, v17);
    }
    else {
      id v18 = 0LL;
    }
    uint64_t v27 = (id *)&v18[8 * v15];
    v33[0] = v18;
    v33[1] = v27;
    v33[3] = &v18[8 * v17];
    uint64_t v28 = 8 * a5;
    id v29 = &v27[a5];
    do
    {
      id v30 = *v7++;
      objc_initWeak(v27++, v30);
      v28 -= 8LL;
    }

    while (v28);
    v33[2] = v29;
    id v5 = std::vector<LSRecord * {__weak}>::__swap_out_circular_buffer((id **)a1, v33, v5);
    std::__split_buffer<LSRecord * {__weak}>::~__split_buffer((uint64_t)v33);
    return v5;
  }

  uint64_t v19 = v12 - (void)a2;
  uint64_t v20 = (uint64_t)(v12 - (void)a2) >> 3;
  if (v20 >= a5)
  {
    id v26 = &a3[a5];
LABEL_18:
    std::vector<LSRecord * {__weak}>::__move_range(a1, v5, v12, (uint64_t)&v5[a5]);
    std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,LSRecord * const*,LSRecord * const*,LSRecord * {__weak}*,0>( v7,  v26,  v5);
    return v5;
  }

  int v22 = &a3[v20];
  __int128 v32 = v22;
  uint64_t v23 = *(void *)(v9 - 8);
  if (v22 != a4)
  {
    id v24 = *(id **)(v9 - 8);
    do
    {
      __int16 v25 = *v22++;
      objc_initWeak(v24++, v25);
      v23 += 8LL;
    }

    while (v22 != a4);
  }

  *(void *)(a1 + _Block_object_dispose((const void *)(v2 - 80), 8) = v23;
  id v26 = v32;
  if (v19 >= 1) {
    goto LABEL_18;
  }
  return v5;
}

void sub_183F5A3CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

id *std::vector<LSRecord * {__weak}>::__move_range(uint64_t a1, id *a2, unint64_t a3, uint64_t a4)
{
  unint64_t v6 = *(id **)(a1 + 8);
  id v7 = (id *)((char *)v6 + (void)a2 - a4);
  __int16 v8 = v6;
  if ((unint64_t)v7 < a3)
  {
    uint64_t v10 = (id *)((char *)v6 + (void)a2 - a4);
    __int16 v8 = *(id **)(a1 + 8);
    do
      objc_moveWeak(v8++, v10++);
    while ((unint64_t)v10 < a3);
  }

  *(void *)(a1 + _Block_object_dispose((const void *)(v2 - 80), 8) = v8;
  return std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*,LSRecord * {__weak}*>( (uint64_t)&v12,  a2,  v7,  v6);
}

id *std::vector<LSRecord * {__weak}>::__swap_out_circular_buffer(id **a1, void *a2, id *from)
{
  uint64_t v3 = from;
  unint64_t v6 = (id *)a2[1];
  id v7 = *a1;
  __int16 v8 = v6;
  if (*a1 != from)
  {
    uint64_t v9 = from;
    __int16 v8 = (id *)a2[1];
    do
      objc_moveWeak(--v8, --v9);
    while (v9 != v7);
  }

  a2[1] = v8;
  uint64_t v10 = a1[1];
  uint64_t v11 = (id *)a2[2];
  if (v10 != v3)
  {
    do
      objc_moveWeak(v11++, v3++);
    while (v3 != v10);
    __int16 v8 = (id *)a2[1];
  }

  a2[2] = v11;
  char v12 = *a1;
  *a1 = v8;
  a2[1] = v12;
  id v13 = a1[1];
  a1[1] = (id *)a2[2];
  a2[2] = v13;
  unint64_t v14 = a1[2];
  a1[2] = (id *)a2[3];
  a2[3] = v14;
  *a2 = a2[1];
  return v6;
}

id *std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*,LSRecord * {__weak}*>( uint64_t a1, id *a2, id *a3, id *a4)
{
  if (a3 != a2)
  {
    id v7 = a3;
    do
    {
      id WeakRetained = objc_loadWeakRetained(--v7);
      objc_storeWeak(--a4, WeakRetained);
    }

    while (v7 != a2);
  }

  return a3;
}

void **std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,LSRecord * const*,LSRecord * const*,LSRecord * {__weak}*,0>( void **a1, void **a2, id *location)
{
  int v4 = a1;
  if (a1 != a2)
  {
    do
    {
      unint64_t v6 = *v4++;
      objc_storeWeak(location++, v6);
    }

    while (v4 != a2);
    return a2;
  }

  return v4;
}

uint64_t std::__split_buffer<LSRecord * {__weak}>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    objc_destroyWeak((id *)(i - 8));
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void ___ZZ31__LSRecord_compatibilityObject_ENK3__0clEP9LSContextjjPKv_block_invoke(uint64_t a1)
{
  uint64_t v2 = [**(id **)(a1 + 40) _compatibilityObjectWithContext:*(void *)(a1 + 48) tableID:*(unsigned int *)(a1 + 64) unitID:*(unsigned int *)(a1 + 68) unitBytes:*(void *)(a1 + 56)];
  uint64_t v3 = *(void ***)(a1 + 32);
  int v4 = *v3;
  id *v3 = (void *)v2;
}

uint64_t std::unordered_map<objc_selector *,objc_object * {__strong}>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>( a1,  *(void *)(a2 + 8));
  for (uint64_t i = *(void **)(a2 + 16); i; uint64_t i = (void *)*i)
    std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__emplace_unique_key_args<objc_selector *,std::pair<objc_selector * const,objc_object * {__strong}> const&>( a1,  i + 2,  i + 2);
  return a1;
}

void sub_183F5A710(_Unwind_Exception *a1)
{
}

void *std::vector<LSRecord * {__weak}>::__init_with_size[abi:nn180100]<LSRecord * const*,LSRecord * const*>( void *result, void **a2, void **a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    uint64_t result = std::vector<LSRecord * {__weak}>::__vallocate[abi:nn180100](result, a4);
    id v7 = (id *)v6[1];
    while (a2 != a3)
    {
      __int16 v8 = *a2++;
      uint64_t result = objc_initWeak(v7++, v8);
    }

    v6[1] = v7;
  }

  return result;
}

char *std::vector<LSRecord * {__weak}>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    abort();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<os_eligibility_answer_t>>( (uint64_t)(a1 + 2),  a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<LSRecord * {__weak}>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (id *)**a1;
  if (v2)
  {
    uint64_t v4 = (id *)v1[1];
    id v5 = **a1;
    if (v4 != v2)
    {
      do
        objc_destroyWeak(--v4);
      while (v4 != v2);
      id v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void std::vector<LSRecord * {__weak}>::__init_with_size[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*>( void *a1, id *a2, id *a3, unint64_t a4)
{
  if (a4)
  {
    std::vector<LSRecord * {__weak}>::__vallocate[abi:nn180100](a1, a4);
    id v7 = (id *)a1[1];
    while (a2 != a3)
      objc_copyWeak(v7++, a2++);
    a1[1] = v7;
  }

void std::vector<LSRecord *>::__append(void **a1, unint64_t a2, void *a3)
{
  __int16 v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  id v7 = v8;
  uint64_t v9 = *(void **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 3)
  {
    if (a2)
    {
      uint64_t v16 = 8 * a2;
      unint64_t v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8LL;
      }

      while (v16);
      uint64_t v9 = v17;
    }

    a1[1] = v9;
  }

  else
  {
    uint64_t v10 = (char *)v9 - (_BYTE *)*a1;
    unint64_t v11 = a2 + (v10 >> 3);
    if (v11 >> 61) {
      abort();
    }
    uint64_t v12 = v10 >> 3;
    uint64_t v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 2 > v11) {
      unint64_t v11 = v13 >> 2;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      uint64_t v15 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<os_eligibility_answer_t>>(v6, v14);
    }
    else {
      uint64_t v15 = 0LL;
    }
    id v18 = &v15[8 * v12];
    uint64_t v19 = &v18[8 * a2];
    uint64_t v20 = 8 * a2;
    id v21 = v18;
    do
    {
      *(void *)id v21 = *a3;
      v21 += 8;
      v20 -= 8LL;
    }

    while (v20);
    int v22 = &v15[8 * v14];
    id v24 = (char *)*a1;
    uint64_t v23 = (char *)a1[1];
    if (v23 != *a1)
    {
      do
      {
        uint64_t v25 = *((void *)v23 - 1);
        v23 -= 8;
        *((void *)v18 - 1) = v25;
        v18 -= 8;
      }

      while (v23 != v24);
      uint64_t v23 = (char *)*a1;
    }

    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23) {
      operator delete(v23);
    }
  }

char *std::__hash_table<std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>>>::__emplace_unique_key_args<void const*,void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>( uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  unint64_t v8 = 0x9DDFEA08EB382D69LL * ((8 * *a2 + 8LL) ^ HIDWORD(*a2));
  unint64_t v9 = 0x9DDFEA08EB382D69LL * (HIDWORD(*a2) ^ (v8 >> 47) ^ v8);
  unint64_t v10 = 0x9DDFEA08EB382D69LL * (v9 ^ (v9 >> 47));
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = 0x9DDFEA08EB382D69LL * (v9 ^ (v9 >> 47));
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
    }

    else
    {
      unint64_t v4 = v10 & (v11 - 1);
    }

    uint64_t v13 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v13)
    {
      unint64_t v14 = (char *)*v13;
      if (*v13)
      {
        do
        {
          unint64_t v15 = *((void *)v14 + 1);
          if (v15 == v10)
          {
            if (*((void *)v14 + 2) == *a2) {
              return v14;
            }
          }

          else
          {
            if (v12.u32[0] > 1uLL)
            {
              if (v15 >= v11) {
                v15 %= v11;
              }
            }

            else
            {
              v15 &= v11 - 1;
            }

            if (v15 != v4) {
              break;
            }
          }

          unint64_t v14 = *(char **)v14;
        }

        while (v14);
      }
    }
  }

  uint64_t v16 = (void *)(a1 + 16);
  unint64_t v14 = (char *)operator new(0x30uLL);
  *(void *)unint64_t v14 = 0LL;
  *((void *)v14 + 1) = v10;
  *((void *)v14 + 2) = *a3;
  *(_OWORD *)(v14 + 24) = *(_OWORD *)a4;
  *((void *)v14 + 5) = *(void *)(a4 + 16);
  *(void *)a4 = 0LL;
  *(void *)(a4 + _Block_object_dispose((const void *)(v2 - 80), 8) = 0LL;
  *(void *)(a4 + 16) = 0LL;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1LL;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>( a1,  v22);
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

  uint64_t v23 = *(void *)a1;
  id v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *(void *)unint64_t v14 = *v24;
LABEL_38:
    *id v24 = v14;
    goto LABEL_39;
  }

  *(void *)unint64_t v14 = *v16;
  *uint64_t v16 = v14;
  *(void *)(v23 + 8 * v4) = v16;
  if (*(void *)v14)
  {
    unint64_t v25 = *(void *)(*(void *)v14 + 8LL);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v25 >= v11) {
        v25 %= v11;
      }
    }

    else
    {
      v25 &= v11 - 1;
    }

    id v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_38;
  }

void sub_183F5AC20( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>,void *>>>::operator()[abi:nn180100]( uint64_t a1, void *__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    uint64_t v3 = (void *)__p[3];
    if (v3)
    {
      __p[4] = v3;
      operator delete(v3);
    }
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

id _LSGetCollapsedMIDictionaryForAppAndContentsDictionaries(void *a1)
{
  id v1 = a1;
  uint64_t v14 = 0LL;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  float v17 = __Block_byref_object_copy__38;
  float v18 = __Block_byref_object_dispose__38;
  [MEMORY[0x189603FC8] dictionary];
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = 0LL;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = __Block_byref_object_copy__38;
  uint8x8_t v12 = __Block_byref_object_dispose__38;
  [MEMORY[0x189603FC8] dictionary];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = MEMORY[0x1895F87A8];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  _DWORD v7[2] = ___LSGetCollapsedMIDictionaryForAppAndContentsDictionaries_block_invoke;
  v7[3] = &unk_189D78350;
  v7[4] = &v14;
  void v7[5] = &v8;
  [v1 enumerateObjectsUsingBlock:v7];
  uint64_t v3 = (void *)v15[5];
  v6[0] = v2;
  v6[1] = 3221225472LL;
  v6[2] = ___LSGetCollapsedMIDictionaryForAppAndContentsDictionaries_block_invoke_2;
  v6[3] = &unk_189D74B20;
  v6[4] = &v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void sub_183F5AF24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__38(uint64_t a1)
{
}

void sub_183F5B0C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_183F5B20C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id _LSGetTeamIdentifierFromInstallDict(void *a1)
{
  id v1 = a1;
  unint64_t v15 = 0LL;
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = [v1 objectForKey:@"Entitlements"];
  id v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (!v3) {
      goto LABEL_24;
    }
  }

  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {

      id v4 = 0LL;
      goto LABEL_24;
    }
  }

  uint64_t v7 = objc_opt_class();
  [v4 objectForKey:@"com.apple.developer.team-identifier"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = v8;
  if (!v7 || !v8)
  {
    unint64_t v15 = v8;
    if (v8) {
      goto LABEL_24;
    }
LABEL_17:
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v4 objectForKey:@"application-identifier"];
    uint8x8_t v12 = (void *)v11;
    if (v10 && v11)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        uint8x8_t v12 = 0LL;
LABEL_23:

        goto LABEL_24;
      }
    }

    else if (!v11)
    {
      goto LABEL_23;
    }

    _LSSplitApplicationIdentifier(v12, &v15, 0LL);
    goto LABEL_23;
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    unint64_t v15 = 0LL;
    goto LABEL_17;
  }

  unint64_t v15 = v9;
LABEL_24:

  id v13 = v15;
  return v13;
}

void sub_183F5B3BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

CFTypeRef _LSCopyBundleInfoDictionary(__CFBundle *a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = (void *)MEMORY[0x186E2A59C]();
  InfoDictionary = CFBundleGetInfoDictionary(a1);
  DeepPropertyListCopy = InfoDictionary;
  if (!InfoDictionary) {
    goto LABEL_7;
  }
  if (CFDictionaryGetCount(InfoDictionary) >= 1)
  {
    BOOL v5 = CFGetAllocator(DeepPropertyListCopy);
    DeepPropertyListCopy = dictionaryCreateDeepPropertyListCopy(v5, DeepPropertyListCopy);
    if (DeepPropertyListCopy) {
      goto LABEL_7;
    }
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"CFMutableDictionaryRef _LSCopyBundleInfoDictionary(CFBundleRef)"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v6,  "handleFailureInFunction:file:lineNumber:description:",  v7,  @"LSRegistration.mm",  734,  @"Failed to create mutable copy of dictionary, cannot safely proceed, aborting");
  }

  DeepPropertyListCopy = 0LL;
LABEL_7:
  objc_autoreleasePoolPop(v2);
  if (!DeepPropertyListCopy) {
    return 0LL;
  }
  CFTypeRef v8 = CFRetain(DeepPropertyListCopy);
  CFRelease(DeepPropertyListCopy);
  return v8;
}

void sub_183F5B4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFDictionary *dictionaryCreateDeepPropertyListCopy(const __CFAllocator *a1, const __CFDictionary *a2)
{
  Mutable = CFDictionaryCreateMutable(a1, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFIndex Count = CFDictionaryGetCount(a2);
  uint64_t v6 = (const void **)MEMORY[0x186E28C1C](a1, 8 * Count, 0LL);
  uint64_t v7 = (const void **)MEMORY[0x186E28C1C](a1, 8 * Count, 0LL);
  CFDictionaryGetKeysAndValues(a2, v6, v7);
  if (Count >= 1)
  {
    CFTypeRef v8 = v6;
    unint64_t v9 = v7;
    while (1)
    {
      CFPropertyListRef DeepCopy = CFPropertyListCreateDeepCopy(a1, *v8, 1uLL);
      CFPropertyListRef v11 = CFPropertyListCreateDeepCopy(a1, *v9, 1uLL);
      uint8x8_t v12 = v11;
      if (DeepCopy && v11 != 0LL) {
        break;
      }
      if (DeepCopy) {
        goto LABEL_13;
      }
      if (v11) {
        goto LABEL_10;
      }
LABEL_11:
      ++v9;
      ++v8;
      if (!--Count) {
        goto LABEL_15;
      }
    }

    CFDictionaryAddValue(Mutable, DeepCopy, v11);
LABEL_13:
    CFRelease(DeepCopy);
    if (!v12) {
      goto LABEL_11;
    }
LABEL_10:
    CFRelease(v12);
    goto LABEL_11;
  }

__CFDictionary *copyDeepMutableDictionary(__CFDictionary *result)
{
  if (result)
  {
    uint64_t result = dictionaryCreateDeepPropertyListCopy((const __CFAllocator *)*MEMORY[0x189604DB0], result);
    if (!result)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v1 = (void *)objc_claimAutoreleasedReturnValue();
      [NSString stringWithUTF8String:"CFMutableDictionaryRef copyDeepMutableDictionary(CFDictionaryRef)"];
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( v1,  "handleFailureInFunction:file:lineNumber:description:",  v2,  @"LSRegistration.mm",  748,  @"Failed to create mutable copy of dictionary, cannot safely proceed, aborting");

      return 0LL;
    }
  }

  return result;
}

void sub_183F5B710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFPropertyListRef _LSCopyiTunesMetadataDictionaryForAppContainerURL(CFURLRef url)
{
  if (!url) {
    return 0LL;
  }
  id v1 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v2 = CFURLCreateCopyAppendingPathComponent( (CFAllocatorRef)*MEMORY[0x189604DB0],  url,  @"iTunesMetadata.plist",  0);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  id v4 = CFReadStreamCreateWithFile(v1, v2);
  if (v4)
  {
    BOOL v5 = v4;
    if (CFReadStreamOpen(v4))
    {
      CFPropertyListRef v6 = CFPropertyListCreateWithStream(v1, v5, 0LL, 0LL, 0LL, 0LL);
      if (v6)
      {
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (TypeID != CFGetTypeID(v6))
        {
          CFRelease(v6);
          CFPropertyListRef v6 = 0LL;
        }
      }

      CFReadStreamClose(v5);
    }

    else
    {
      CFPropertyListRef v6 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    CFPropertyListRef v6 = 0LL;
  }

  CFRelease(v3);
  return v6;
}

void _LSPromoteiTunesMetadataKeys(const __CFDictionary *a1, __CFDictionary *a2)
{
  if (a1 && a2)
  {
    Value = CFDictionaryGetValue(a1, @"initialODRSize");
    CFTypeID TypeID = CFNumberGetTypeID();
    if (Value && (!TypeID || CFGetTypeID(Value) == TypeID)) {
      CFDictionaryAddValue(a2, @"initialODRSize", Value);
    }
    CFPropertyListRef v6 = CFDictionaryGetValue(a1, @"itemId");
    CFTypeID v7 = CFNumberGetTypeID();
    if (v6 && (!v7 || CFGetTypeID(v6) == v7)) {
      CFDictionaryAddValue(a2, @"itemId", v6);
    }
    CFTypeRef v8 = CFDictionaryGetValue(a1, @"artistName");
    CFTypeID v9 = CFStringGetTypeID();
    if (v8 && (!v9 || CFGetTypeID(v8) == v9)) {
      CFDictionaryAddValue(a2, @"artistName", v8);
    }
    uint64_t v10 = CFDictionaryGetValue(a1, @"itemName");
    CFTypeID v11 = CFStringGetTypeID();
    if (v10 && (!v11 || CFGetTypeID(v10) == v11)) {
      CFDictionaryAddValue(a2, @"itemName", v10);
    }
    uint8x8_t v12 = CFDictionaryGetValue(a1, @"storeCohort");
    CFTypeID v13 = CFStringGetTypeID();
    if (v12 && (!v13 || CFGetTypeID(v12) == v13)) {
      CFDictionaryAddValue(a2, @"storeCohort", v12);
    }
    uint64_t v14 = CFDictionaryGetValue(a1, @"s");
    CFTypeID v15 = CFNumberGetTypeID();
    if (v14 && (!v15 || CFGetTypeID(v14) == v15)) {
      CFDictionaryAddValue(a2, @"s", v14);
    }
    uint64_t v16 = CFDictionaryGetValue(a1, @"softwareVersionExternalIdentifier");
    CFTypeID v17 = CFNumberGetTypeID();
    if (v16 && (!v17 || CFGetTypeID(v16) == v17)) {
      CFDictionaryAddValue(a2, @"softwareVersionExternalIdentifier", v16);
    }
    float v18 = CFDictionaryGetValue(a1, @"betaExternalVersionIdentifier");
    CFTypeID v19 = CFNumberGetTypeID();
    if (v18 && (!v19 || CFGetTypeID(v18) == v19)) {
      CFDictionaryAddValue(a2, @"betaExternalVersionIdentifier", v18);
    }
    unint64_t v20 = CFDictionaryGetValue(a1, @"DeviceBasedVPP");
    CFTypeID v21 = CFBooleanGetTypeID();
    if (v20 && (!v21 || CFGetTypeID(v20) == v21)) {
      CFDictionaryAddValue(a2, @"DeviceBasedVPP", v20);
    }
    size_t v22 = CFDictionaryGetValue(a1, @"is-purchased-redownload");
    CFTypeID v23 = CFBooleanGetTypeID();
    if (v22 && (!v23 || CFGetTypeID(v22) == v23)) {
      CFDictionaryAddValue(a2, @"is-purchased-redownload", v22);
    }
    id v24 = CFDictionaryGetValue(a1, @"gameCenterEnabled");
    CFTypeID v25 = CFBooleanGetTypeID();
    if (v24 && (!v25 || CFGetTypeID(v24) == v25)) {
      CFDictionaryAddValue(a2, @"gameCenterEnabled", v24);
    }
    id v26 = CFDictionaryGetValue(a1, @"gameCenterEverEnabled");
    CFTypeID v27 = CFBooleanGetTypeID();
    if (v26 && (!v27 || CFGetTypeID(v26) == v27)) {
      CFDictionaryAddValue(a2, @"gameCenterEverEnabled", v26);
    }
    uint64_t v28 = CFDictionaryGetValue(a1, @"sourceApp");
    CFTypeID v29 = CFStringGetTypeID();
    if (v28 && (!v29 || CFGetTypeID(v28) == v29)) {
      CFDictionaryAddValue(a2, @"sourceApp", v28);
    }
    id v30 = CFDictionaryGetValue(a1, @"variantID");
    CFTypeID v31 = CFStringGetTypeID();
    if (v30 && (!v31 || CFGetTypeID(v30) == v31)) {
      CFDictionaryAddValue(a2, @"variantID", v30);
    }
    __int128 v32 = CFDictionaryGetValue(a1, @"managementDeclarationIdentifier");
    CFTypeID v33 = CFStringGetTypeID();
    if (v32 && (!v33 || CFGetTypeID(v32) == v33)) {
      CFDictionaryAddValue(a2, @"managementDeclarationIdentifier", v32);
    }
    uint64_t v34 = CFDictionaryGetValue(a1, @"genre");
    CFTypeID v35 = CFStringGetTypeID();
    if (v34 && (!v35 || CFGetTypeID(v34) == v35)) {
      CFDictionaryAddValue(a2, @"genre", v34);
    }
    uint64_t v36 = CFDictionaryGetValue(a1, @"genreId");
    CFTypeID v37 = CFNumberGetTypeID();
    if (v36 && (!v37 || CFGetTypeID(v36) == v37)) {
      CFDictionaryAddValue(a2, @"genreId", v36);
    }
    uint64_t v38 = CFDictionaryGetValue(a1, @"subgenres");
    CFTypeID v39 = CFArrayGetTypeID();
    if (v38 && (!v39 || CFGetTypeID(v38) == v39)) {
      CFDictionaryAddValue(a2, @"subgenres", v38);
    }
    __int128 v40 = CFDictionaryGetValue(a1, @"distributorInfo");
    CFTypeID v41 = CFDictionaryGetTypeID();
    if (v40 && (!v41 || CFGetTypeID(v40) == v41)) {
      CFDictionaryAddValue(a2, @"distributorInfo", v40);
    }
    __int128 v42 = CFDictionaryGetValue(a1, @"com.apple.iTunesStore.downloadInfo");
    CFTypeID v43 = CFDictionaryGetTypeID();
    if (v42 && (!v43 || CFGetTypeID(v42) == v43))
    {
      CFTypeID v44 = CFGetTypeID(v42);
      if (v44 == CFDictionaryGetTypeID())
      {
        __int128 v45 = CFDictionaryGetValue((CFDictionaryRef)v42, @"accountInfo");
        CFTypeID v46 = CFDictionaryGetTypeID();
        if (v45)
        {
          if (!v46 || CFGetTypeID(v45) == v46)
          {
            CFTypeID v47 = CFGetTypeID(v45);
            if (v47 == CFDictionaryGetTypeID())
            {
              if ((v48 = CFDictionaryGetValue((CFDictionaryRef)v45, @"PurchaserID"),
                    CFTypeID v49 = CFNumberGetTypeID(),
                    v48)
                && (!v49 || CFGetTypeID(v48) == v49)
                || (v48 = CFDictionaryGetValue((CFDictionaryRef)v45, @"DSPersonID"), CFTypeID v50 = CFNumberGetTypeID(),
                                                                                           v48)
                && (!v50 || CFGetTypeID(v48) == v50))
              {
                CFDictionaryAddValue(a2, @"PurchaserID", v48);
              }
            }
          }
        }
      }
    }

    __int128 v51 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"rating");
    CFTypeID v52 = CFDictionaryGetTypeID();
    if (v51 && (!v52 || CFGetTypeID(v51) == v52))
    {
      uint64_t v53 = CFDictionaryGetValue(v51, @"rank");
      CFTypeID v54 = CFNumberGetTypeID();
      if (v53 && (!v54 || CFGetTypeID(v53) == v54)) {
        CFDictionaryAddValue(a2, @"rank", v53);
      }
      v55 = CFDictionaryGetValue(v51, @"label");
      CFTypeID v56 = CFStringGetTypeID();
      if (v55 && (!v56 || CFGetTypeID(v55) == v56)) {
        CFDictionaryAddValue(a2, @"label", v55);
      }
    }
  }

void sub_183F5C2E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F5C588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F5C608()
{
}

void sub_183F5C708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _LSPathIsTrusted(const char *a1)
{
  uint64_t v2 = 0LL;
  while (1)
  {
    size_t v3 = strlen(_LSPathIsTrusted(char const*)::trustedPaths[v2]);
    if (++v2 == 6) {
      return 0LL;
    }
  }

  return 1LL;
}

BOOL _LSRegisterPluginNode(LSContext *a1, void *a2, FSNode *a3, int a4, unsigned int a5, void *a6)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  CFTypeID v11 = a2;
  HIDWORD(v17) = a5;
  uint8x8_t v12 = objc_alloc_init(&OBJC_CLASS___LSRegistrationInfo);
  LODWORD(v17) = 0;
  -[FSNode bookmarkDataRelativeToNode:error:](v11, "bookmarkDataRelativeToNode:error:", 0LL, a6);
  CFTypeID v13 = (LSRegistrationInfo *)objc_claimAutoreleasedReturnValue();
  if (!v13 || !_LSContainerFindOrRegisterWithNode((id *)&a1->db, v11, a4, &v17, 0LL, 0LL, a6)) {
    goto LABEL_11;
  }
  v12->bundleClass = 12;
  v12->version = 7;
  v12->action = 204;
  v12->options = a4;
  v12->containeruint64_t Unit = v17;
  if (a5 || (_LSPluginFindWithInfo(a1->db, 0LL, 0LL, 0, v11, (_DWORD *)&v17 + 1, 0LL), (a5 = HIDWORD(v17)) != 0)) {
    v12->bundleuint64_t Unit = a5;
  }
  if (-[FSNode getFileSystemRepresentation:error:](v11, "getFileSystemRepresentation:error:", v18, a6))
  {
    int v14 = _LSRegisterDirectoryNode(a1, v11, (FSNode *)v12, v13, a3, 0LL, 0LL, (const __CFURL *)((char *)&v17 + 4), v17);
    BOOL v15 = v14 == 0;
    if (a6 && v14)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], v14, (uint64_t)"_LSRegisterPluginNode", 1982LL, 0LL);
      BOOL v15 = 0LL;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
LABEL_11:
    BOOL v15 = 0LL;
  }

  return v15;
}

void sub_183F5C9AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _LSRegisterDirectoryNode( LSContext *a1, FSNode *a2, FSNode *a3, LSRegistrationInfo *a4, FSNode *a5, const __CFArray **a6, const __CFArray **a7, const __CFURL *a8, unsigned int *a9)
{
  uint64_t v16 = a2;
  CFTypeID v17 = a3;
  float v18 = a4;
  -[FSNode URL](v16, "URL");
  uint64_t v19 = (NSData *)objc_claimAutoreleasedReturnValue();

  uint64_t v20 = _LSDispatchRegistration(a1, (char *)v17, v18, v19, a5, a8, a6, (unsigned __int8 *)a7, v22, v23);
  return v20;
}

void sub_183F5CA90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _LSRegisterBundleURL(void **a1, void *a2, unsigned int a3, FSNode *a4, void *a5)
{
  id v9 = a2;
  uint64_t v10 = v9;
  if ((a3 & 1) != 0)
  {
    uint64_t v11 = [v9 copy];

    uint64_t v10 = (void *)v11;
  }

  uint8x8_t v12 = -[FSNode initWithURL:flags:error:](objc_alloc(&OBJC_CLASS___FSNode), "initWithURL:flags:error:", v10, 0LL, a5);
  if (v12) {
    BOOL v13 = _LSRegisterBundleNode(a1, v12, a3, a4, a5);
  }
  else {
    BOOL v13 = 0LL;
  }

  return v13;
}

void sub_183F5CB54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _LSRegisterBundleNode(void **a1, void *a2, unsigned int a3, FSNode *a4, void *a5)
{
  id v9 = a2;
  CFTypeID v23 = a1;
  id v24 = 0LL;
  char v25 = 0;
  id v26 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v23, v10, 0LL);

  if (!v11)
  {
    if (a5)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      int v14 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v23, v14, 0LL);

      if (v15) {
        id v16 = 0LL;
      }
      else {
        id v16 = v26;
      }
      goto LABEL_18;
    }

    goto LABEL_16;
  }

  int v12 = _LSFindOrRegisterBundleNode(v11, v9, 0LL, a3, a4, 0LL, 0LL);
  if (v12 == -10811)
  {
    uint64_t v22 = -1LL;
    CFTypeID v17 = (void *)_LSGetLibraryBundleIdentifierAndItemIndexForNode(v11, v9, &v22);
    if (v17 && v22 == -1)
    {
      BOOL v13 = _LSRegisterLibrary(v11, v17, 1, a5);
      goto LABEL_19;
    }

    if (a5)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -10811LL, (uint64_t)"_LSRegisterBundleNode", 2529LL, 0LL);
      float v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }

void sub_183F5CD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)va);
  _Unwind_Resume(a1);
}

uint64_t _LSFindOrRegisterBundleNode( LSContext *a1, void *a2, unsigned int *a3, unsigned int a4, FSNode *a5, unsigned int *a6, LSBundleData **a7)
{
  uint64_t v77 = *MEMORY[0x1895F89C0];
  uint64_t v11 = a2;
  int v12 = v11;
  BOOL v13 = 0LL;
  unsigned int v73 = 0;
  v72 = 0LL;
  unsigned int v71 = 0;
  CFArrayRef theArray = 0LL;
  id v70 = 0LL;
  uint64_t v14 = 4294967246LL;
  char v68 = 0;
  if (!a1 || !v11) {
    goto LABEL_120;
  }
  if (a3) {
    unsigned int v15 = *a3;
  }
  else {
    unsigned int v15 = _LSGetBundleClassForNode((uint64_t)a1, v11);
  }
  if (v15 == 11) {
    unsigned int v16 = a4 | 0x10000000;
  }
  else {
    unsigned int v16 = a4;
  }
  BOOL v17 = v15 > 0x10 || ((1 << v15) & 0x16804) == 0;
  if (v17 && (v16 & 0x10000000) == 0)
  {
    int v20 = 0;
    BOOL v13 = 0LL;
    uint64_t v14 = 4294956485LL;
    if ((v16 & 0x4000000) == 0) {
      goto LABEL_103;
    }
    goto LABEL_43;
  }

  uint64_t v18 = _LSBundleFindWithNode(a1, v12, &v73, &v72);
  uint64_t v14 = v18;
  if ((_DWORD)v18 == -9499)
  {
    BOOL v19 = 1;
  }

  else
  {
    if ((_DWORD)v18)
    {
      BOOL v13 = 0LL;
      goto LABEL_120;
    }

    BOOL v19 = _LSBundleNeedsRegistration(a1, v12, v16, v73, v72) != 0;
  }

  BOOL v13 = 0LL;
  int v20 = 0;
  if (!a5 || !v19)
  {
LABEL_42:
    if ((v16 & 0x4000000) == 0) {
      goto LABEL_103;
    }
    goto LABEL_43;
  }

  if (!a1->db)
  {
    BOOL v13 = 0LL;
    uint64_t v14 = 4294956479LL;
    goto LABEL_120;
  }

  id v67 = 0LL;
  BOOL v21 = _LSContainerFindOrRegisterWithNode((id *)&a1->db, v12, v16, &v71, 0LL, &v70, &v67);
  id v22 = v67;
  BOOL v13 = v22;
  if (!v21)
  {
    uint64_t v14 = _LSGetOSStatusFromNSError(v22);
    if ((_DWORD)v14) {
      goto LABEL_120;
    }
  }

  unsigned int v73 = 0;
  v72 = 0LL;
  uint64_t v23 = _LSBundleFindWithNode(a1, v12, &v73, &v72);
  uint64_t v14 = v23;
  if ((_DWORD)v23 == -9499)
  {
    BOOL v24 = 1;
  }

  else
  {
    if ((_DWORD)v23) {
      goto LABEL_120;
    }
    BOOL v24 = _LSBundleNeedsRegistration(a1, v12, v16, v73, v72) != 0;
  }

  if (!v72)
  {
    if (v24)
    {
      unint64_t v59 = 0LL;
      goto LABEL_37;
    }

    goto LABEL_41;
  }

  if (!v24)
  {
LABEL_41:
    int v20 = 0;
    goto LABEL_42;
  }

  unint64_t v59 = *(void *)&v72->_maxSystemVersion._opaque[28];
  if ((*(_BYTE *)(&v72->_clas + 1) & 0x80) == 0) {
    v16 |= 2u;
  }
LABEL_37:
  char v25 = (void *)MEMORY[0x186E2A59C]();
  unsigned int v26 = v71;
  CFArrayRef v27 = theArray;
  id v28 = v70;
  CFArrayRef theArray = 0LL;
  if (v27) {
    CFRelease(v27);
  }
  id v66 = 0LL;
  BOOL v29 = _LSRegisterBundleNode( a1,  v26,  v28,  v12,  v16,  a5,  &theArray,  (const __CFArray **)&v68,  (const __CFURL *)&v73,  &v66);
  id v30 = v66;
  CFTypeID v31 = v30;
  if (v29) {
    uint64_t v14 = 0LL;
  }
  else {
    uint64_t v14 = _LSGetOSStatusFromNSError(v30);
  }

  objc_autoreleasePoolPop(v25);
  if (!(_DWORD)v14)
  {
    if (theArray && (CFIndex Count = CFArrayGetCount(theArray), Count >= 1))
    {
      for (CFIndex i = 0LL; i != Count; ++i)
      {
        CFTypeID v35 = (void *)MEMORY[0x186E2A59C]();
        LODWORD(v62) = 0;
        *(void *)buf = 0LL;
        if (!theArray
          || (ValueAtIndex = CFArrayGetValueAtIndex(theArray, i), CFTypeID v37 = CFURLGetTypeID(), ValueAtIndex)
          && v37
          && CFGetTypeID(ValueAtIndex) != v37)
        {
          ValueAtIndex = 0LL;
        }

        if (v68) {
          v16 |= 6u;
        }
        else {
          unsigned int v16 = v16 & 0xFFFFFFF9 | 4;
        }
        uint64_t v14 = FSNodeCreateWithURL((uint64_t)ValueAtIndex, 0LL, (id *)buf);
        if (!(_DWORD)v14)
        {
          id v65 = 0LL;
          BOOL v38 = _LSRegisterBundleNode(a1, v71, v70, *(void **)buf, v16, a5, 0LL, 0LL, (const __CFURL *)&v62, &v65);
          id v39 = v65;
          __int128 v40 = v39;
          if (v38) {
            uint64_t v14 = 0LL;
          }
          else {
            uint64_t v14 = _LSGetOSStatusFromNSError(v39);
          }
        }

        objc_autoreleasePoolPop(v35);
      }
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    if ((v16 & 0x3000000) == 0x2000000)
    {
      -[_LSDatabase store]((uint64_t)a1->db);
      unsigned int Generation = CSStoreGetGeneration();
      id v64 = 0LL;
      int v42 = _LSContextUpdate((void **)&a1->db, 1, (uint64_t)&v64);
      id v43 = v64;
      if (v42)
      {
        _LSRegistrationLog();
        CFTypeID v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          -[_LSDatabase store]((uint64_t)a1->db);
          unsigned int v45 = CSStoreGetGeneration();
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = Generation;
          __int16 v75 = 2048;
          uint64_t v76 = v45;
          _os_log_impl( &dword_183E58000,  v44,  OS_LOG_TYPE_DEFAULT,  "LSFORBN: Caller wants reinitialization, updated store from generation %lu to %lu",  buf,  0x16u);
        }
      }

      else
      {
        _LSRegistrationLog();
        CFTypeID v47 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_183E58000, v47, OS_LOG_TYPE_ERROR, "LSFORBN: couldn't update context as asked", buf, 2u);
        }

        uint64_t v14 = _LSGetOSStatusFromNSError(v43);
        if ((_DWORD)v14)
        {

          goto LABEL_120;
        }
      }

      v72 = (LSBundleData *)_LSBundleGet(a1->db, v73);
      if (!v72)
      {
        unsigned int v63 = 0;
        uint64_t v62 = 0LL;
        if (_LSBundleFindWithNode(a1, v12, &v63, &v62))
        {
          _LSRegistrationLog();
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v73;
            _os_log_impl( &dword_183E58000,  v48,  OS_LOG_TYPE_ERROR,  "Couldn't refind bundle unit after registering %llx",  buf,  0xCu);
          }
        }

        else if (*(void *)(v62 + 264) > v59)
        {
          _LSRegistrationLog();
          CFTypeID v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v73;
            __int16 v75 = 2048;
            uint64_t v76 = v63;
            _os_log_impl( &dword_183E58000,  v54,  OS_LOG_TYPE_ERROR,  "After registering bundle unit %llx and reinitializing context, couldn't find it, but did find bundle unit %llx on refetch-by-node; using that",
              buf,
              0x16u);
          }

          unsigned int v73 = v63;
          v72 = (LSBundleData *)v62;
        }
      }

      uint64_t v14 = 0LL;
    }

    else
    {
      v72 = 0LL;
    }

    int v20 = 1;
    if ((v16 & 0x4000000) == 0)
    {
LABEL_103:
      if ((_DWORD)v14 && (_DWORD)v14 != -10654) {
        goto LABEL_120;
      }
      unsigned int v55 = v73;
      CFTypeID v56 = v72;
      if ((_DWORD)v14 || !v73 || v72)
      {
        if ((_DWORD)v14) {
          goto LABEL_116;
        }
      }

      else
      {
        CFTypeID v56 = (LSBundleData *)_LSBundleGet(a1->db, v73);
        v72 = v56;
        unsigned int v55 = v73;
      }

      if (!v55) {
        goto LABEL_123;
      }
      if (((v20 ^ 1 | ((v16 & 0x2000000) >> 25)) & 1) == 0)
      {
        _LSDefaultLog();
        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
          _LSFindOrRegisterBundleNode_cold_1((uint64_t *)&v72, v16, v57);
        }

        goto LABEL_116;
      }

      if (!v56)
      {
LABEL_123:
        uint64_t v14 = 4294956482LL;
        goto LABEL_120;
      }

LABEL_116:
      if (a6) {
        *a6 = v73;
      }
      if (a7) {
        *a7 = v72;
      }
      goto LABEL_120;
    }

    if (!v45) {
      goto LABEL_118;
    }
    goto LABEL_117;
  }

  id v28 = 4294956479LL;
  if (v45) {
    goto LABEL_117;
  }
LABEL_118:
  if (HIDWORD(v88)) {
    *__int16 v75 = HIDWORD(v88);
  }

  return v28;
}

LABEL_43:
    if (!v73) {
      goto LABEL_128;
    }
    if (v72)
    {
      int v32 = *((_BYTE *)&v72->_clas + 5) & 1;
    }

    else
    {
      *(void *)buf = 0LL;
      if (_LSContextInit(buf))
      {
        int v32 = 0;
      }

      else
      {
        uint64_t v46 = _LSBundleGet(*(void **)buf, v73);
        v72 = (LSBundleData *)v46;
        if (v46)
        {
          int v32 = *(_BYTE *)(v46 + 165) & 1;
          v72 = 0LL;
        }

        else
        {
          int v32 = 0;
        }

        _LSContextDestroy((void **)buf);
      }
    }

    if (v32)
    {
LABEL_128:
      -[FSNode URL](v12, "URL");
      CFTypeID v49 = (void *)objc_claimAutoreleasedReturnValue();
      CFTypeID v50 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();

      if (v50)
      {
        CFURLRef v51 = CFBundleCopyBundleURL(v50);
        if (v51)
        {
          CFTypeID v52 = -[FSNode initWithURL:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithURL:flags:error:",  v51,  0LL,  0LL);
          if (v52)
          {
            unsigned int v53 = _LSFindOrRegisterBundleNode(a1, v52, 0LL, v16 & 0xFBFFFFFF, 0LL, &v73, &v72);
            if (v53) {
              uint64_t v14 = v53;
            }
            else {
              uint64_t v14 = 4294956642LL;
            }
          }

          CFRelease(v51);
        }

        CFRelease(v50);
      }
    }

    goto LABEL_103;
  }

LABEL_120:
  if (theArray) {
    CFRelease(theArray);
  }

  return v14;
}

  active = _LSBindingListCreate(v10, v121, &v120[20]);
  if (!(_DWORD)active)
  {
    v97 = CFStringGetTypeID();
    v98 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, @"UTTypeReferenceURL");
    v99 = v98;
    if (v98 && CFGetTypeID(v98) == v97) {
      *(_DWORD *)&v120[24] = _LSDatabaseCreateStringForCFString(v10, v99, 0);
    }
    v106[2] = v118;
    v106[3] = v119;
    v107[0] = *(_OWORD *)v120;
    *(_OWORD *)((char *)v107 + 12) = *(_OWORD *)&v120[12];
    v106[0] = *(_OWORD *)v116;
    v106[1] = v117;
    active = _UTTypeAdd(v10, (uint64_t)v106, &v122);
    if (!(_DWORD)active)
    {
      active = _LSBindableActivate(v10, v122);
      if (!(_DWORD)active) {
        active = _UTUpdateActiveTypeForIdentifier(v10, v116[3]);
      }
    }
  }

void sub_183F5D618( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, CFTypeRef cf, void *a23)
{
  if (cf) {
    CFRelease(cf);
  }

  _Unwind_Resume(a1);
}

uint64_t _LSGetLibraryBundleIdentifierAndItemIndexForNode(LSContext *a1, FSNode *a2, uint64_t *a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  BOOL v5 = a2;
  int v24 = 0;
  uint64_t v23 = 0LL;
  bzero(v26, 0x400uLL);
  *a3 = -1LL;
  if (!-[FSNode getFileSystemRepresentation:error:](v5, "getFileSystemRepresentation:error:", v26, 0LL)) {
    goto LABEL_8;
  }
  size_t v6 = strlen(v26);
  uint64_t v7 = 0LL;
  while (1)
  {
    getLibIDs();
    CFTypeRef v8 = (const char **)_LSPathForBundleLibraryIdentifier((const __CFString *)getLibIDs(void)::klibIDs[v7]);
    id v9 = v8;
    if (v8)
    {
      size_t v10 = *(int *)v8;
    }

    if (++v7 == 4) {
      goto LABEL_8;
    }
  }

  getLibIDs();
  BOOL v13 = (void *)getLibIDs(void)::klibIDs[v7];
  memset(v25, 0, sizeof(v25));
  if (_LSBundleFindWithInfo(a1, 0LL, v13, 0, v25, 8, 128, &v24, &v23))
  {
LABEL_8:
    uint64_t v11 = 0LL;
  }

  else
  {
    getLibIDs();
    uint64_t v11 = getLibIDs(void)::klibIDs[v7];
    if (v24)
    {
      uint64_t v14 = 0LL;
      uint64_t v15 = *(int *)v9;
      unsigned int v16 = &v26[v15 + 1];
      size_t v17 = ~v15 + v6;
      while (1)
      {
        size_t v18 = kLibrarySubfolders[v14];
        if (v17 > v18
          && !strncasecmp(v16, *(const char **)&kLibrarySubfolders[v14 + 2], kLibrarySubfolders[v14])
          && v16[v18] == 47)
        {
          break;
        }

        v14 += 6LL;
        if (v14 == 60) {
          goto LABEL_8;
        }
      }

      if (*(_DWORD *)(v23 + 448))
      {
        if (-[FSNode isDirectory](v5, "isDirectory"))
        {
          MEMORY[0x1895F8858]();
          strlcpy((char *)v21 - ((v17 + 17) & 0xFFFFFFFFFFFFFFF0LL), v16, v19);
          *(_WORD *)((char *)v21 + v17 - ((v17 + 17) & 0xFFFFFFFFFFFFFFF0LL)) = 47;
          int v20 = _CSGetStringForCharacters();
        }

        else
        {
          int v20 = _CSGetStringForCharacters();
        }

        if (v20)
        {
          v21[0] = MEMORY[0x1895F87A8];
          v21[1] = 3221225472LL;
          __int128 v21[2] = ___ZL48_LSGetLibraryBundleIdentifierAndItemIndexForNodeP9LSContextP6FSNodePl_block_invoke;
          v21[3] = &__block_descriptor_44_e14_v24__0I8I12_16l;
          int v22 = v20;
          v21[4] = a3;
          _CSArrayEnumerateAllValues();
        }
      }
    }
  }

  return v11;
}

void sub_183F5D9CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _LSRegisterLibrary(LSContext *a1, void *a2, int a3, void *a4)
{
  v26[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = a2;
  uint64_t v8 = _LSPathForBundleLibraryIdentifier(v7);
  unsigned int v24 = 0;
  uint64_t v23 = 0LL;
  unsigned int v22 = 0;
  BOOL v21 = 0LL;
  if (!v8)
  {
    if (a4)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -43LL, (uint64_t)"_LSRegisterLibrary", 3034LL, 0LL);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = 0LL;
      goto LABEL_19;
    }

    id v9 = 0LL;
    goto LABEL_30;
  }

  id v9 = -[FSNode initWithFileSystemRepresentation:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithFileSystemRepresentation:flags:error:",  *(void *)(v8 + 8),  8LL,  a4);
  if (!v9) {
    goto LABEL_30;
  }
  int v10 = _LSBundleFindWithNode(a1, v9, &v24, &v23);
  if (v10 != -9499)
  {
    if (v10)
    {
      if (a4)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], v10, (uint64_t)"_LSRegisterLibrary", 3041LL, 0LL);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
        BOOL v16 = 0LL;
        *a4 = v17;
        goto LABEL_31;
      }

void sub_183F5DE00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t _LSNodeHasChanged(void *a1, uint64_t a2, unsigned int a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v8 = a1;
  double v17 = 0.0;
  int v9 = [v8 getContentModificationDate:&v17 error:0];
  char v10 = v9;
  if (v9)
  {
    double v11 = v17;
    if (_LSBundleDataGetModTime(a4) == (int)v11)
    {
      uint64_t v12 = 0LL;
      if (!a5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }

    getNeedsRegistrationLog();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:(double)(int)_LSBundleDataGetModTime(a4)];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:v17];
      int v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      uint64_t v19 = a3;
      __int16 v20 = 2114;
      BOOL v21 = v14;
      __int16 v22 = 2114;
      uint64_t v23 = v15;
      _os_log_impl( &dword_183E58000,  v13,  OS_LOG_TYPE_DEFAULT,  "bundle 0x%llx mod date changed from %{public}@ to %{public}@",  buf,  0x20u);
    }
  }

  else
  {
    getNeedsRegistrationLog();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = a3;
      _os_log_impl( &dword_183E58000,  v13,  OS_LOG_TYPE_DEFAULT,  "bundle 0x%llx does not appear to exist anymore",  buf,  0xCu);
    }
  }

  uint64_t v12 = 1LL;
  if (a5) {
LABEL_10:
  }
    *a5 = v10;
LABEL_11:

  return v12;
}

void sub_183F5E038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getNeedsRegistrationLog(void)
{
  return (id)getNeedsRegistrationLog(void)::result;
}

uint64_t _LSBundleNeedsRegistration( LSContext *a1, FSNode *a2, int a3, unsigned int a4, const LSBundleData *a5)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v9 = a2;
  double v11 = v9;
  if (v9)
  {
    int HasChanged = _LSNodeHasChanged(v9, v10, a4, (uint64_t)a5, 0LL);
    BOOL v14 = (a3 & 0x40000000) == 0 || HasChanged == 0;
    if ((a3 & 1) != 0 || !v14) {
      goto LABEL_14;
    }
  }

  else if ((a3 & 1) != 0)
  {
    goto LABEL_14;
  }

  if ((-[_LSDatabase isSeeded]((uint64_t)a1->db) & 1) != 0)
  {
    uint64_t v15 = 0LL;
    goto LABEL_17;
  }

void sub_183F5E1C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _LSRegisterBundleNode( LSContext *a1, unsigned int a2, void *a3, void *a4, unsigned int a5, FSNode *a6, const __CFArray **a7, const __CFArray **a8, const __CFURL *a9, id *a10)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v31 = a3;
  BOOL v16 = a4;
  double v17 = objc_alloc_init(&OBJC_CLASS___LSRegistrationInfo);
  v17->unsigned int bundleClass = _LSGetBundleClassForNode((uint64_t)a1, v16);
  unsigned int bundleClass = v17->bundleClass;
  if (bundleClass == 3 || bundleClass == 0)
  {
    if (a10)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -10811LL, (uint64_t)"_LSRegisterBundleNode", 2057LL, 0LL);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v21 = 0LL;
      __int16 v22 = 0LL;
      goto LABEL_26;
    }

    goto LABEL_28;
  }

  if ((a5 & 0x40) != 0 && bundleClass == 2) {
    v17->unsigned int bundleClass = 16;
  }
  v17->version = 7;
  v17->action = 203;
  v17->options = a5;
  v17->containeruint64_t Unit = a2;
  if (*(_DWORD *)a9) {
    v17->bundleuint64_t Unit = *(_DWORD *)a9;
  }
  if (!_LSGetItemInfoFlagsForNode(a1, v16, &v17->itemFlags, a10)
    || !-[FSNode getContentModificationDate:error:](v16, "getContentModificationDate:error:", &v17->contentModDate, a10))
  {
LABEL_28:
    BOOL v21 = 0LL;
    __int16 v22 = 0LL;
    goto LABEL_29;
  }

  -[FSNode bookmarkDataRelativeToNode:error:](v16, "bookmarkDataRelativeToNode:error:", v31, a10);
  __int16 v22 = (LSRegistrationInfo *)objc_claimAutoreleasedReturnValue();
  if (!v22
    || !-[FSNode getInodeNumber:error:](v16, "getInodeNumber:error:", &v17->inoBundle, a10)
    || !-[FSNode getFileSystemRepresentation:error:](v16, "getFileSystemRepresentation:error:", v33, a10))
  {
    goto LABEL_43;
  }

  if ((v17->options & 4) != 0) {
    goto LABEL_23;
  }
  int v32 = -2;
  if (!-[FSNode getOwnerUID:error:](v16, "getOwnerUID:error:", &v32, a10))
  {
LABEL_43:
    BOOL v21 = 0LL;
    if (!a6) {
      goto LABEL_42;
    }
    goto LABEL_30;
  }

void sub_183F5E5C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t _LSFindOrFindOrRegisterBundleNode( LSContext *a1, void *a2, unsigned int *a3, unsigned int a4, FSNode *a5, unsigned int *a6, LSBundleData **a7)
{
  id v13 = a2;
  else {
    uint64_t v14 = _LSBundleFindWithNode(a1, v13, a6, a7);
  }
  uint64_t v15 = v14;

  return v15;
}

void sub_183F5E6AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _LSPathForBundleLibraryIdentifier(const __CFString *a1)
{
  if (CFEqual(a1, @"com.apple.system-library"))
  {
    uint64_t v2 = 0LL;
    return (uint64_t)&libPaths + 16 * v2;
  }

  if (CFEqual(a1, @"com.apple.local-library"))
  {
    uint64_t v2 = 1LL;
    return (uint64_t)&libPaths + 16 * v2;
  }

  if (CFEqual(a1, @"com.apple.network-library"))
  {
    uint64_t v2 = 2LL;
    return (uint64_t)&libPaths + 16 * v2;
  }

  if (CFEqual(a1, @"com.apple.apple-internal-library"))
  {
    uint64_t v2 = 3LL;
    return (uint64_t)&libPaths + 16 * v2;
  }

  return 0LL;
}

uint64_t _LSDispatchRegistration( LSContext *a1, char *a2, LSRegistrationInfo *a3, NSData *a4, FSNode *a5, const __CFURL *a6, const __CFArray **a7, unsigned __int8 *a8, const __CFArray **a9, unsigned __int8 *a10)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  double v17 = a2;
  int v18 = a3;
  context = (void *)MEMORY[0x186E2A59C]();
  if ([(id)__LSDefaultsGetSharedInstance() hasServer])
  {
    if ((v17[19] & 1) == 0)
    {
      uint64_t BundleDataAndRegister = _LSRegisterItemInfo( v17,  v18,  0LL,  (uint64_t)a4,  (uint64_t)a5,  (uint64_t)a6,  (uint64_t)a7,  (uint64_t)a8);
      goto LABEL_14;
    }
  }

  else if (!v17)
  {
    id v20 = objc_alloc_init(&OBJC_CLASS___LSRegistrationInfo);
    goto LABEL_7;
  }

  id v20 = (LSRegistrationInfo *)[v17 mutableCopy];
LABEL_7:
  BOOL v21 = v20;
  uint64_t BundleDataAndRegister = _LSServerCreateBundleDataAndRegister( a1,  v20,  (NSData *)v18,  (const __CFURL *)a4,  a5,  (unsigned int *)a6,  a7,  a8);
  if ((_DWORD)BundleDataAndRegister == -10675)
  {
    if ((v21->options & 2) != 0)
    {
      uint64_t BundleDataAndRegister = 4294956621LL;
    }

    else
    {
      _LSInstallLog();
      __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unsigned int v26 = a4;
        _os_log_impl( &dword_183E58000,  v22,  OS_LOG_TYPE_DEFAULT,  "Retrying registration of %@ with trusted bit",  buf,  0xCu);
      }

      v21->options |= 2u;
      uint64_t BundleDataAndRegister = _LSServerCreateBundleDataAndRegister( a1,  v21,  (NSData *)v18,  (const __CFURL *)a4,  a5,  (unsigned int *)a6,  a7,  a8);
    }
  }

LABEL_14:
  objc_autoreleasePoolPop(context);

  return BundleDataAndRegister;
}

void sub_183F5E974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _LSUnregisterBundle(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = 0LL;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  int v32 = -10810;
  size_t v6 = (void *)MEMORY[0x186E2A59C]();
  if (([(id)__LSDefaultsGetSharedInstance() isServer] & 1) == 0
    && ([(id)__LSDefaultsGetSharedInstance() hasServer] & 1) != 0)
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    v24[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
    v24[1] = (void (*)(void, void))3221225472LL;
    v24[2] = (void (*)(void, void))___LSUnregisterBundle_block_invoke;
    v24[3] = (void (*)(void, void))&unk_189D72338;
    v24[4] = (void (*)(void, void))&v29;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDModifyService, v24);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    v23[1] = 3221225472LL;
    v23[2] = ___LSUnregisterBundle_block_invoke_2;
    v23[3] = &unk_189D76FE0;
    v23[4] = &v29;
    [v8 unregisterBundleUnit:a2 options:a3 completionHandler:v23];
    if ((a3 & 0x3000000) == 0x2000000 && !*((_DWORD *)v30 + 6))
    {
      id v22 = 0LL;
      char v9 = _LSContextUpdate(a1, 1, (uint64_t)&v22);
      id v10 = v22;
      double v11 = v10;
      if ((v9 & 1) != 0) {
        int v12 = 0;
      }
      else {
        int v12 = _LSGetOSStatusFromNSError(v10);
      }
      *((_DWORD *)v30 + 6) = v12;
    }

    goto LABEL_26;
  }

  uint64_t v25 = a1;
  id v26 = 0LL;
  char v27 = 0;
  id v28 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  id v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v25, v13, 0LL);

  if (v14)
  {
    *((_DWORD *)v30 + 6) = 0;
    if ((a3 & 0x20000000) != 0)
    {
      if (CSStoreGetUnit())
      {
        int v15 = _LSPluginUnregister(*v14, a2);
        goto LABEL_14;
      }
    }

    else if (CSStoreGetUnit())
    {
      int v15 = _LSBundleRemove(*v14, a2, 1);
LABEL_14:
      *((_DWORD *)v30 + 6) = v15;
      if (!v15)
      {
        uint64_t SequenceNumber = _LSDatabaseGetSequenceNumber();
        _LSDatabaseSetSequenceNumber((uint64_t)*v14, SequenceNumber + 1);
        if (!*((_DWORD *)v30 + 6)) {
          _LSArmSaveTimer(5);
        }
      }

      goto LABEL_19;
    }

    int v16 = -9499;
  }

  else
  {
    int v16 = LaunchServices::Database::Context::status((id *)&v25);
  }

  *((_DWORD *)v30 + 6) = v16;
LABEL_19:
  if (v25 && v27) {
    _LSContextDestroy(v25);
  }
  id v18 = v26;
  uint64_t v25 = 0LL;
  id v26 = 0LL;

  char v27 = 0;
  id v19 = v28;
  id v28 = 0LL;

LABEL_26:
  objc_autoreleasePoolPop(v6);
  uint64_t v20 = *((unsigned int *)v30 + 6);
  _Block_object_dispose(&v29, 8);
  return v20;
}

void sub_183F5EC74(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v3 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_183F5ED20( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F5ED8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

uint64_t _LSUpdateContainerState(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v62 = 0LL;
  unsigned int v63 = &v62;
  uint64_t v64 = 0x2020000000LL;
  int v65 = -10810;
  if (v5)
  {
    if ((_DWORD)a2) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "OSStatus _LSUpdateContainerState(__strong LSDatabaseRef, LSContainerID, LSContainerData *)");
    __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 handleFailureInFunction:v40, @"LSRegistration.mm", 3347, @"Invalid parameter not satisfying: %@", @"inDB != NULL" file lineNumber description];

    if ((_DWORD)a2) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  CFTypeID v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( NSString,  "stringWithUTF8String:",  "OSStatus _LSUpdateContainerState(__strong LSDatabaseRef, LSContainerID, LSContainerData *)");
  int v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v41 handleFailureInFunction:v42, @"LSRegistration.mm", 3348, @"Invalid parameter not satisfying: %@", @"inContainerUnit != kCSStoreNullID" file lineNumber description];

LABEL_3:
  size_t v6 = (void *)MEMORY[0x186E2A59C]();
  uint64_t v7 = _LSContainerGet();
  if (v7)
  {
    uint64_t v54 = 0LL;
    unsigned int v55 = &v54;
    uint64_t v56 = 0x4812000000LL;
    v57 = __Block_byref_object_copy__135;
    v58 = __Block_byref_object_dispose__136;
    unint64_t v59 = "";
    __int128 v8 = *(_OWORD *)v7;
    int v61 = *(_DWORD *)(v7 + 16);
    __int128 v60 = v8;
    if (_LSContainerDataNeedsUpdate((uint64_t)&v60))
    {
      if (([(id)__LSDefaultsGetSharedInstance() isServer] & 1) != 0
        || ([(id)__LSDefaultsGetSharedInstance() hasServer] & 1) == 0)
      {
        uint64_t v53 = 0LL;
        int v11 = *(_DWORD *)(v7 + 12);
        if (v11)
        {
          _LSAliasGet(v5, v11);
          int v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            id v52 = 0LL;
            BOOL v13 = +[FSNode getVolumeIdentifier:forBookmarkData:error:]( &OBJC_CLASS___FSNode,  "getVolumeIdentifier:forBookmarkData:error:",  &v53,  v12,  &v52);
            id v14 = v52;
            int v15 = v14;
            if (v13) {
              int v16 = 0;
            }
            else {
              int v16 = _LSGetOSStatusFromNSError(v14);
            }
            *((_DWORD *)v63 + 6) = v16;
          }

          else
          {
            *((_DWORD *)v63 + 6) = -41;
          }
        }

        else if ((*(_WORD *)v7 & 2) != 0)
        {
          +[FSNode rootVolumeNode](&OBJC_CLASS___FSNode, "rootVolumeNode");
          double v17 = (void *)objc_claimAutoreleasedReturnValue();
          id v51 = 0LL;
          char v18 = [v17 getVolumeIdentifier:&v53 error:&v51];
          id v19 = v51;

          if ((v18 & 1) != 0) {
            int v20 = 0;
          }
          else {
            int v20 = _LSGetOSStatusFromNSError(v19);
          }
          *((_DWORD *)v63 + 6) = v20;
        }

        else
        {
          *((_DWORD *)v63 + 6) = -35;
        }

        BOOL v21 = v63;
        BOOL v22 = *((_DWORD *)v63 + 6) == 0;
        uint64_t v23 = v53;
        BOOL v24 = v53 != 0;
        uint64_t v25 = v55;
        BOOL v26 = !v22 || !v24;
        if (v22 && v24) {
          char v27 = 1;
        }
        else {
          char v27 = -1;
        }
        if (v26) {
          uint64_t v23 = 0LL;
        }
        *((_BYTE *)v55 + 50) = v27;
        *(uint64_t *)((char *)v25 + 52) = v23;
        *((_DWORD *)v21 + 6) = 0;
        uint64_t v28 = v25[6];
        uint64_t v29 = v25[7];
        uint64_t v30 = *((unsigned int *)v25 + 16);
        if (v28 != *(void *)v7 || v29 != *(void *)(v7 + 8) || v30 != *(_DWORD *)(v7 + 16))
        {
          uint64_t v33 = MEMORY[0x1895F87A8];
          v47[0] = MEMORY[0x1895F87A8];
          v47[1] = 3221225472LL;
          v47[2] = ___LSUpdateContainerState_block_invoke;
          v47[3] = &unk_189D78378;
          CFTypeID v49 = &v54;
          id v48 = v5;
          int v50 = a2;
          uint64_t v34 = (void (**)(void))MEMORY[0x186E2A7B8](v47);
          if ([(id)__LSDefaultsGetSharedInstance() isServer])
          {
            +[LSDBExecutionContext sharedServerInstance]();
            CFTypeID v35 = (void *)objc_claimAutoreleasedReturnValue();
            v45[0] = v33;
            v45[1] = 3221225472LL;
            v45[2] = ___LSUpdateContainerState_block_invoke_2;
            v45[3] = &unk_189D73FA8;
            uint64_t v46 = v34;
            -[LSDBExecutionContext performAsyncWrite:]((uint64_t)v35, v45);
          }

          else
          {
            v34[2](v34);
          }
        }
      }

      else
      {
        uint64_t v9 = MEMORY[0x1895F87A8];
        v44[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
        v44[1] = (void (*)(void, void))3221225472LL;
        v44[2] = (void (*)(void, void))___LSUpdateContainerState_block_invoke_3;
        v44[3] = (void (*)(void, void))&unk_189D72338;
        v44[4] = (void (*)(void, void))&v62;
        +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDModifyService, v44);
        id v10 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v9;
        v43[1] = 3221225472LL;
        v43[2] = ___LSUpdateContainerState_block_invoke_4;
        v43[3] = &unk_189D783A0;
        v43[4] = &v62;
        v43[5] = &v54;
        [v10 updateContainerUnit:a2 completionHandler:v43];
      }
    }

    else
    {
      *((_DWORD *)v63 + 6) = 0;
    }

    if (a3 && !*((_DWORD *)v63 + 6))
    {
      int v36 = *((_DWORD *)v55 + 16);
      *(_OWORD *)a3 = *((_OWORD *)v55 + 3);
      *(_DWORD *)(a3 + 16) = v36;
    }

    _Block_object_dispose(&v54, 8);
  }

  else
  {
    *((_DWORD *)v63 + 6) = -10817;
  }

  objc_autoreleasePoolPop(v6);
  uint64_t v37 = *((unsigned int *)v63 + 6);
  _Block_object_dispose(&v62, 8);

  return v37;
}

void sub_183F5F280(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v4 - 128), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__135(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[4].n128_u32[0] = a2[4].n128_u32[0];
  a1[3] = result;
  return result;
}

void sub_183F5F3FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F5F4C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t _LSRegisterTypeDeclarationsForBundle(void *a1, uint64_t a2, uint64_t a3, const void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a5;
  if (a3) {
    int v11 = *(_DWORD *)(a3 + 456);
  }
  else {
    int v11 = 0;
  }
  uint64_t v12 = _LSRegisterTypeDeclarationsCommon(v9, a2, v11, a4, v10);

  return v12;
}

void sub_183F5F560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _LSRegisterTypeDeclarationsCommon(void *a1, uint64_t a2, int a3, const void *a4, void *a5)
{
  id v8 = a1;
  id v9 = a5;
  uint64_t v10 = 0LL;
  if (v8 && a3 && a4)
  {
    CFTypeID v11 = CFGetTypeID(a4);
    if (v11 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)a4);
      if (Count < 1)
      {
        uint64_t v10 = 0LL;
      }

      else
      {
        CFIndex v13 = 0LL;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a4, v13);
          CFTypeID TypeID = CFDictionaryGetTypeID();
          if (ValueAtIndex && TypeID) {
            CFGetTypeID(ValueAtIndex);
          }
          uint64_t v10 = _UTTypeAddWithDeclarationDictionary();
          if (!(_DWORD)v10) {
            _CSArrayAppendValue();
          }
          ++v13;
        }

        while (Count != v13);
      }
    }

    else
    {
      uint64_t v10 = 4294956479LL;
    }
  }

  return v10;
}

void sub_183F5F6B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _LSRegisterTypeDeclarationsForPlugin(void *a1, uint64_t a2, uint64_t a3, const void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a5;
  if (a3) {
    int v11 = *(_DWORD *)(a3 + 220);
  }
  else {
    int v11 = 0;
  }
  uint64_t v12 = _LSRegisterTypeDeclarationsCommon(v9, a2, v11, a4, v10);

  return v12;
}

void sub_183F5F754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _LSRegisterDocumentTypes(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x1895F8858](a1);
  int v3 = v2;
  id v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  unsigned int v123 = v10;
  uint64_t v145 = *MEMORY[0x1895F89C0];
  v122 = v1;
  id v121 = v5;
  if (v7 && (theArray = v7, CFTypeID v11 = CFGetTypeID(v7), v11 == CFArrayGetTypeID()))
  {
    CFIndex Count = CFArrayGetCount(v7);
    _LSBindingListBufferInit((uint64_t)v122, v130);
    if (Count >= 1)
    {
      CFIndex v13 = 0LL;
      int v124 = v3 | 0x20;
      int v118 = v3 | 0x820;
      v120 = (void *)*MEMORY[0x189604AF0];
      key = (void *)*MEMORY[0x189604AE8];
      v113 = (void *)*MEMORY[0x189604AE0];
      v117 = (void *)*MEMORY[0x189604E00];
      *(void *)&__int128 v12 = 138412290LL;
      __int128 v111 = v12;
      v115 = (void *)*MEMORY[0x189604AD8];
      do
      {
        CFIndex idx = v13;
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(theArray, v13);
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (ValueAtIndex && (!TypeID || CFGetTypeID(ValueAtIndex) == TypeID))
        {
          int v16 = (void *)MEMORY[0x186E2A59C]();
          [MEMORY[0x189603FA8] array];
          CFArrayRef v129 = (CFArrayRef)objc_claimAutoreleasedReturnValue();
          uint64_t v17 = objc_opt_class();
          [ValueAtIndex objectForKey:@"LSHandlerRank"];
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17 && v127 && (objc_opt_isKindOfClass() & 1) == 0)
          {

            v127 = 0LL;
          }

          uint64_t v18 = objc_opt_class();
          uint64_t v19 = [ValueAtIndex objectForKey:@"LSItemContentTypes"];
          int v20 = (void *)v19;
          if (v18 && v19 && (objc_opt_isKindOfClass() & 1) == 0)
          {

            int v20 = 0LL;
          }

          if (objc_msgSend(v127, "isEqualToString:", @"Owner", v111) && objc_msgSend(v20, "count"))
          {
            uint64_t v21 = [MEMORY[0x189603FA8] array];
            uint64_t v22 = [MEMORY[0x189603FA8] array];
            v125 = v16;
            __int128 v139 = 0u;
            __int128 v140 = 0u;
            memset(buf, 0, sizeof(buf));
            id v23 = v20;
            uint64_t v24 = [v23 countByEnumeratingWithState:buf objects:&v133 count:16];
            if (v24)
            {
              uint64_t v25 = **(void **)&buf[16];
              do
              {
                for (uint64_t i = 0LL; i != v24; ++i)
                {
                  if (**(void **)&buf[16] != v25) {
                    objc_enumerationMutation(v23);
                  }
                  uint64_t v27 = *(void *)(*(void *)&buf[8] + 8 * i);
                  if ((_NSIsNSString() & 1) != 0)
                  {
                    else {
                      uint64_t v28 = (void *)v22;
                    }
                    [v28 addObject:v27];
                  }
                }

                uint64_t v24 = [v23 countByEnumeratingWithState:buf objects:&v133 count:16];
              }

              while (v24);
            }

            int v16 = v125;
            uint64_t v29 = (void *)v22;
            uint64_t v30 = (void *)v21;
          }

          else
          {
            uint64_t v29 = 0LL;
            uint64_t v30 = 0LL;
          }

          if ([v30 count])
          {
            _LSDefaultLog();
            uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(v142) = v111;
              *(void *)((char *)&v142 + 4) = v30;
              _os_log_debug_impl( &dword_183E58000,  v33,  OS_LOG_TYPE_DEBUG,  "Decomposeing docuemnt claim for types: %@",  (uint8_t *)&v142,  0xCu);
            }

            uint64_t v34 = (void *)[ValueAtIndex mutableCopy];
            [v34 setObject:v30 forKey:@"LSItemContentTypes"];
            [v34 setObject:@"Default" forKey:@"LSHandlerRank"];
            -[__CFArray addObject:](v129, "addObject:", v34);
            if ([v29 count])
            {
              CFTypeID v35 = (void *)[ValueAtIndex mutableCopy];
              [v35 setObject:v29 forKey:@"LSItemContentTypes"];
              -[__CFArray addObject:](v129, "addObject:", v35);
            }
          }

          else
          {
            -[__CFArray addObject:](v129, "addObject:", ValueAtIndex);
          }

          objc_autoreleasePoolPop(v16);
          if (v129)
          {
            for (CFIndex j = 0LL; ; CFIndex j = v126 + 1)
            {
              if (j >= CFArrayGetCount(v129))
              {
                CFRelease(v129);
                goto LABEL_193;
              }

              CFIndex v126 = j;
              uint64_t v37 = CFArrayGetValueAtIndex(v129, j);
              CFTypeID v38 = CFDictionaryGetTypeID();
              if (v37 && v38 && CFGetTypeID(v37) != v38) {
                uint64_t v37 = 0LL;
              }
              id v39 = v122;
              id v128 = v121;
              uint64_t v137 = 0LL;
              __int128 v135 = 0u;
              __int128 v136 = 0u;
              __int128 v133 = 0u;
              __int128 v134 = 0u;
              *(void *)&__int128 v142 = 0LL;
              *((void *)&v142 + 1) = &v142;
              uint64_t v143 = 0x2020000000LL;
              char v144 = 0;
              if (*(_DWORD *)(v9 + 20) == 6 && (*(_BYTE *)(v9 + 168) & 2) == 0)
              {
                _LSRegistrationLog();
                __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)&uint8_t buf[4] = v123;
                  CFTypeID v41 = buf;
                  int v42 = v40;
                  os_log_type_t v43 = OS_LOG_TYPE_INFO;
                  CFTypeID v44 = "Skipping document claims for bundle %llu because it is Mac Catalyst but does not support open-in-place";
                  uint32_t v45 = 12;
                  goto LABEL_53;
                }

                goto LABEL_54;
              }

              if (v37)
              {
                CFTypeID v46 = CFGetTypeID(v37);
                if (v46 == CFDictionaryGetTypeID())
                {
                  DWORD2(v133) = v124;
                  int v47 = v124;
                  if (_LSGetBooleanFromDict( (const __CFDictionary *)v37,  @"LSDefaultShareModeCollaboration"))
                  {
                    int v47 = v118;
                    DWORD2(v133) = v118;
                  }

                  if (_LSGetBooleanFromDict((const __CFDictionary *)v37, @"LSTypeIsPackage"))
                  {
                    v47 |= 8u;
                    DWORD2(v133) = v47;
                  }

                  if (_LSGetBooleanFromDict( (const __CFDictionary *)v37,  @"LSIsAppleDefaultForType"))
                  {
                    v47 |= 1u;
                    DWORD2(v133) = v47;
                    *(_BYTE *)(*((void *)&v142 + 1) + 24LL) = 1;
                  }

                  if ((*(_BYTE *)(v9 + 156) & 0x10) != 0
                    || (id v48 = (void *)_CSStringCopyCFString(),
                        int v49 = [v48 isEqualToString:@"System"],
                        v48,
                        v49))
                  {
                    if (_LSGetBooleanFromDict( (const __CFDictionary *)v37,  @"LSIsAppleDefaultNoOverrideForType"))
                    {
                      v47 |= 3u;
                      DWORD2(v133) = v47;
                      *(_BYTE *)(*((void *)&v142 + 1) + 24LL) = 1;
                    }
                  }

                  if ((*(_BYTE *)(v9 + 156) & 1) != 0) {
                    DWORD2(v133) = v47 | 4;
                  }
                  WORD6(v133) = _LSGetHandlerRankFromDictKey((const __CFDictionary *)v37, v50);
                  int v51 = _LSGetRoleFromDictKey((const __CFDictionary *)v37, v120);
                  LOBYTE(v52) = v51;
                  HIWORD(v133) = v51;
                  int v53 = *(_DWORD *)(v9 + 160);
                  if (!v51)
                  {
                    if (v53 == 2) {
                      __int16 v52 = 2;
                    }
                    else {
                      __int16 v52 = 1;
                    }
                    HIWORD(v133) = v52;
                  }

                  if (v53 == 2 || (v52 & 0x11) != 0) {
                    break;
                  }
                }
              }

LABEL_188:
              _Block_object_dispose(&v142, 8);
              _LSBindingListBufferReset(v39, (uint64_t)v130);
            }

            CFTypeID v54 = CFStringGetTypeID();
            Value = (void *)CFDictionaryGetValue((CFDictionaryRef)v37, key);
            uint64_t v56 = Value;
            if (Value && CFGetTypeID(Value) == v54)
            {
              id v57 = v56;
              [v128 objectForKeyedSubscript:v57];
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              DWORD1(v134) = LaunchServices::LocalizedString::Add(v39, v58, v57);
            }

            if (!_LSGetBooleanFromDict( (const __CFDictionary *)v37,  @"CFBundleTypeIconSystemGenerated"))
            {
              unint64_t v59 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v37, @"CFBundleTypeIconFiles");
              CFTypeID v60 = CFArrayGetTypeID();
              if (v59 && (!v60 || CFGetTypeID(v59) == v60))
              {
                CFIndex v61 = CFArrayGetCount(v59);
                if (v61 >= 1)
                {
                  int v62 = 0;
                  CFIndex v63 = 0LL;
                  do
                  {
                    uint64_t v64 = (const __CFString *)CFArrayGetValueAtIndex(v59, v63);
                    CFTypeID v65 = CFStringGetTypeID();
                    if (v64 && (!v65 || CFGetTypeID(v64) == v65))
                    {
                      int StringForCFString = _LSDatabaseCreateStringForCFString(v39, v64, 0);
                      id v67 = (char *)&v133 + 4 * v62++;
                      *((_DWORD *)v67 + 7) = StringForCFString;
                    }

                    ++v63;
                  }

                  while (v63 < v61 && v62 < 8);
                }
              }

              else if (v113)
              {
                char v68 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v37, v113);
                CFTypeID v69 = CFStringGetTypeID();
                if (v68 && (!v69 || CFGetTypeID(v68) == v69)) {
                  HIDWORD(v134) = _LSDatabaseCreateStringForCFString(v39, v68, 0);
                }
              }

              else
              {
                CFStringGetTypeID();
              }

              id v70 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v37, @"LSIconName");
              CFTypeID v71 = CFStringGetTypeID();
              if (v70 && (!v71 || CFGetTypeID(v70) == v71)) {
                HIDWORD(v136) = _LSDatabaseCreateStringForCFString(v39, v70, 0);
              }
            }

            if (_LSGetBooleanFromDict( (const __CFDictionary *)v37,  @"NSResolvesUbiquitousConflicts")
              || CFDictionaryContainsKey((CFDictionaryRef)v37, @"NSDocumentClass"))
            {
              DWORD2(v133) |= 0x200u;
            }

            v72 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v37, @"_LSBundleLibraryDelegate");
            CFTypeID v73 = CFStringGetTypeID();
            if (v72 && v73 && CFGetTypeID(v72) != v73) {
              v72 = 0LL;
            }
            LODWORD(v137) = _LSDatabaseCreateStringForCFString(v39, v72, 0);
            if (!(_DWORD)v137) {
              goto LABEL_121;
            }
            if (v117)
            {
              v74 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v37, v117);
              CFTypeID v75 = CFStringGetTypeID();
              if (v74 && (!v75 || CFGetTypeID(v74) == v75))
              {
                int v76 = DWORD2(v133);
                CFIndex Length = CFStringGetLength(v74);
                if (Length > CFStringGetLength(@"com.apple."))
                {
                  v146.length = CFStringGetLength(@"com.apple.");
                  v146.location = 0LL;
                  if (CFStringCompareWithOptions(v74, @"com.apple.", v146, 1uLL) == kCFCompareEqualTo)
                  {
                    unsigned int v78 = v76 | 4;
                    goto LABEL_120;
                  }
                }

LABEL_181:
                      if (v84)
                      {
                        _LSBundleGet(v39, v123);
                        _LSBundleSetFlags();
                      }

LABEL_183:
                      int v108 = _LSBindingListCreate(v39, v130, &v131);
                      if (v108
                        || (HIDWORD(v137) = v131, (int v108 = _LSClaimAdd(v39, (uint64_t)&v133, &v132)) != 0)
                        || (_CSArrayAppendValue(), v131)
                        && !_LSBundleDataIsInUnsupportedLocation((uint64_t)v39, v9)
                        && !_LSBundleDataGetUnsupportedFormatFlag()
                        && (int v108 = _LSBindingListActivate()) != 0)
                      {
                        _LSRegistrationLog();
                        __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                        {
                          v141[0] = 67109120;
                          v141[1] = v108;
                          CFTypeID v41 = (uint8_t *)v141;
                          int v42 = v40;
                          os_log_type_t v43 = OS_LOG_TYPE_ERROR;
                          CFTypeID v44 = "Failed to register document type with error code: %d";
                          uint32_t v45 = 8;
LABEL_53:
                          _os_log_impl(&dword_183E58000, v42, v43, v44, v41, v45);
                        }

LABEL_193:
        CFIndex v13 = idx + 1;
      }

      while (idx + 1 != Count);
    }

    uint64_t v109 = 0LL;
  }

  else
  {
    uint64_t v109 = 4294956479LL;
  }

  return v109;
}

void sub_183F60858( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, void *a37, void *a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, CFTypeRef cf)
{
}

uint64_t _LSRegisterURLTypes(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x1895F8858](a1);
  int v3 = v2;
  uint64_t v5 = v4;
  int v53 = v6;
  uint64_t v7 = v1;
  _LSBindingListBufferInit((uint64_t)v7, v62);
  CFTypeRef cf = (CFTypeRef)_CSStringCopyCFString();
  if (!v3)
  {
LABEL_90:
    uint64_t v10 = 0LL;
    goto LABEL_91;
  }

  CFTypeID v8 = CFGetTypeID(v3);
  if (v8 == CFArrayGetTypeID())
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)v3);
    if (Count >= 1)
    {
      CFIndex v54 = Count;
      uint64_t v10 = 0LL;
      CFIndex v11 = 0LL;
      __int16 v52 = (void *)*MEMORY[0x189604AF0];
      key = (void *)*MEMORY[0x189604B00];
      int v47 = (void *)*MEMORY[0x189604AF8];
      int v49 = (void *)*MEMORY[0x189604E00];
      int v50 = (void *)*MEMORY[0x189604B08];
      while (1)
      {
        uint64_t v60 = 0LL;
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        __int128 v56 = 0u;
        __int128 v57 = 0u;
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v3, v11);
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (ValueAtIndex && (!TypeID || CFGetTypeID(ValueAtIndex) == TypeID))
        {
          CFTypeID v14 = CFGetTypeID(ValueAtIndex);
          if (v14 == CFDictionaryGetTypeID())
          {
            DWORD2(v56) |= 0x40u;
            if (_LSGetBooleanFromDict( (const __CFDictionary *)ValueAtIndex,  @"LSIsAppleDefaultForScheme")) {
              DWORD2(v56) |= 1u;
            }
            if ((*(_BYTE *)(v5 + 156) & 1) != 0) {
              DWORD2(v56) |= 4u;
            }
            WORD6(v56) = _LSGetHandlerRankFromDictKey((const __CFDictionary *)ValueAtIndex, v15);
            int v16 = _LSGetRoleFromDictKey((const __CFDictionary *)ValueAtIndex, v52);
            __int16 v17 = v16 ? v16 : 2;
            HIWORD(v56) = v17;
            int v18 = *(_DWORD *)(v5 + 160);
            if (v18 == 2 || v18 == 14 || v17 == 1)
            {
              Value = (void *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"CFBundleRequiredCapabilities");
              CFTypeID v20 = CFArrayGetTypeID();
              if (!Value || v20 && CFGetTypeID(Value) != v20)
              {
                Value = (void *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"SBRequiredCapabilities");
                CFTypeID v21 = CFArrayGetTypeID();
                if (!Value || v21 && CFGetTypeID(Value) != v21) {
                  goto LABEL_28;
                }
              }

              CFTypeID v22 = CFGetTypeID(Value);
              if (v22 != CFArrayGetTypeID()) {
                goto LABEL_28;
              }
              DWORD2(v57) = _LSDatabaseCreateStringArray(v7, Value, 0, 0LL);
              if (DWORD2(v57))
              {
                uint64_t v10 = 0LL;
LABEL_28:
                CFTypeID v23 = CFStringGetTypeID();
                uint64_t v24 = (void *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, key);
                uint64_t v25 = v24;
                if (v24 && CFGetTypeID(v24) == v23)
                {
                  id v26 = v25;
                  DWORD1(v57) = LaunchServices::LocalizedString::Add(v7, MEMORY[0x189604A60], v26);
                }

                if (!_LSGetBooleanFromDict( (const __CFDictionary *)ValueAtIndex,  @"CFBundleTypeIconSystemGenerated"))
                {
                  uint64_t v27 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"_LSIconPath");
                  CFTypeID v28 = CFStringGetTypeID();
                  if (v27 && (!v28 || CFGetTypeID(v27) == v28))
                  {
                    CFTypeID v29 = CFStringGetTypeID();
                    if (v29 == CFGetTypeID(v27))
                    {
                      DWORD2(v56) |= 0x1000u;
                      goto LABEL_44;
                    }
                  }

                  if (v47)
                  {
                    uint64_t v27 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v47);
                    CFTypeID v30 = CFStringGetTypeID();
                    if (!v27 || !v30 || CFGetTypeID(v27) == v30)
                    {
LABEL_44:
                      HIDWORD(v57) = _LSDatabaseCreateStringForCFString(v7, v27, 0);
                      goto LABEL_45;
                    }
                  }

                  else
                  {
                    CFStringGetTypeID();
                  }

                  uint64_t v27 = 0LL;
                  goto LABEL_44;
                }

LABEL_59:
                    unsigned int v37 = v35 & 0xFFFFFFFB;
LABEL_60:
                    DWORD2(v56) = v37;
LABEL_61:
                    LODWORD(v57) = v53;
                    HIDWORD(v60) = 0;
                    if (!_LSGetBooleanFromDict( (const __CFDictionary *)ValueAtIndex,  @"CFBundleURLIsPrivate")
                      || (char v38 = BYTE8(v56), DWORD2(v56) |= 0x80u, (v38 & 4) != 0))
                    {
                      if (_LSGetBooleanFromDict( (const __CFDictionary *)ValueAtIndex,  @"CFBundleURLAlwaysAvailable")) {
                        DWORD2(v56) |= 0x100u;
                      }
                      if (v50)
                      {
                        id v39 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v50);
                        CFTypeID v40 = CFArrayGetTypeID();
                        if (v39 && (!v40 || CFGetTypeID(v39) == v40))
                        {
                          CFIndex v41 = CFArrayGetCount(v39);
                          if (v41 >= 1)
                          {
                            for (CFIndex i = 0LL; i != v41; ++i)
                            {
                              os_log_type_t v43 = (const __CFString *)CFArrayGetValueAtIndex(v39, i);
                              CFTypeID v44 = CFStringGetTypeID();
                              if (v43 && (!v44 || CFGetTypeID(v43) == v44))
                              {
                                unsigned int StringForCFString = _LSDatabaseCreateStringForCFString(v7, v43, 1);
                                if (StringForCFString)
                                {
                                  _CSStringRelease();
                                }
                              }
                            }
                          }
                        }
                      }

                      else
                      {
                        CFArrayGetTypeID();
                      }

                      uint64_t v10 = _LSBindingListCreate(v7, v62, &v55);
                      if (!(_DWORD)v10)
                      {
                        HIDWORD(v60) = v55;
                        uint64_t v10 = _LSClaimAdd(v7, (uint64_t)&v56, &v61);
                        if (!(_DWORD)v10)
                        {
                          _CSArrayAppendValue();
                          if (!v55
                            || _LSBundleDataIsInUnsupportedLocation((uint64_t)v7, v5)
                            || _LSBundleDataGetUnsupportedFormatFlag())
                          {
                            uint64_t v10 = 0LL;
                          }

                          else
                          {
                            uint64_t v10 = _LSBindingListActivate();
                          }
                        }
                      }
                    }

                    goto LABEL_86;
                  }
                }

                else
                {
                  CFStringGetTypeID();
                }

                int v35 = DWORD2(v56);
                goto LABEL_59;
              }

              uint64_t v10 = 4294957803LL;
            }
          }
        }

LABEL_86:
        _LSBindingListBufferReset(v7, (uint64_t)v62);
        if (++v11 == v54) {
          goto LABEL_91;
        }
      }
    }

    goto LABEL_90;
  }

  uint64_t v10 = 4294956479LL;
LABEL_91:
  if (cf) {
    CFRelease(cf);
  }

  return v10;
}

void sub_183F61080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _LSGetHandlerRankFromDictKey(const __CFDictionary *a1, const void *a2)
{
  if (a1)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a1, @"LSHandlerRank");
    CFTypeID TypeID = CFStringGetTypeID();
    if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
    {
      CFTypeID v4 = CFGetTypeID(Value);
      if (v4 == CFStringGetTypeID()) {
        return _LSNumericHandlerRankFromHandlerRankString(Value);
      }
    }
  }

  else
  {
    CFStringGetTypeID();
  }

  return 2LL;
}

uint64_t _LSGetRoleFromDictKey(const __CFDictionary *a1, const void *a2)
{
  if (!a1 || !a2)
  {
    CFStringGetTypeID();
    return 0LL;
  }

  Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  CFTypeID TypeID = CFStringGetTypeID();
  if (!Value || TypeID && CFGetTypeID(Value) != TypeID) {
    return 0LL;
  }
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID()) {
    return 0LL;
  }
  uint64_t v5 = 1LL;
  if (CFStringCompare(Value, @"None", 1uLL))
  {
    if (CFStringCompare(Value, @"Viewer", 1uLL))
    {
      if (CFStringCompare(Value, @"Editor", 1uLL))
      {
        if (CFStringCompare(Value, @"Shell", 1uLL))
        {
          if (CFStringCompare(Value, @"MDImporter", 1uLL)) {
            return 32 * (CFStringCompare(Value, @"QLGenerator", 1uLL) == kCFCompareEqualTo);
          }
          else {
            return 16LL;
          }
        }

        else
        {
          return 8LL;
        }
      }

      else
      {
        return 4LL;
      }
    }

    else
    {
      return 2LL;
    }
  }

  return v5;
}

uint64_t _LSRegisterExtensionPoint( void *a1, uint64_t a2, __CFString *a3, uint64_t a4, const __CFDictionary *a5, void *a6)
{
  uint64_t v127 = *MEMORY[0x1895F89C0];
  id v11 = a1;
  if (![(id)__LSDefaultsGetSharedInstance() hasServer])
  {
    if (![(id)__LSDefaultsGetSharedInstance() isServer])
    {
      uint64_t v12 = 0LL;
      goto LABEL_105;
    }

    id v67 = v11;
    v90 = 0LL;
    _LSRegistrationLog();
    CFIndex v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = a3;
      *(_WORD *)&_BYTE buf[12] = 1024;
      *(_DWORD *)&buf[14] = a4;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = a6;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = a5;
      _os_log_impl( &dword_183E58000,  v13,  OS_LOG_TYPE_INFO,  "Registering extension point: %@ platform: %u declaring framework: %@ SDK: %@",  buf,  0x26u);
    }

    char v68 = v67;
    if (!v67)
    {
      uint64_t v12 = _LSContextInit(&v90);
      char v68 = v90;
      if ((_DWORD)v12)
      {
LABEL_104:

        goto LABEL_105;
      }
    }

    __int128 v125 = kLSVersionNumberNull;
    __int128 v126 = *(_OWORD *)algn_183FBF5B0;
    uint64_t v88 = 0LL;
    uint64_t v89 = 0LL;
    __int128 v123 = 0u;
    __int128 v124 = 0u;
    if (a5)
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(a5, @"NSExtension");
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
      {
        int v16 = (const __CFDictionary *)CFDictionaryGetValue(Value, @"NSExtensionAttributes");
        CFTypeID v17 = CFDictionaryGetTypeID();
        if (!v16 || !v17 || CFGetTypeID(v16) == v17)
        {
LABEL_20:
          uint64_t v18 = objc_opt_class();
          uint64_t v19 = -[__CFDictionary objectForKey:](a5, "objectForKey:", @"EXExtensionPointIsPublic");
          CFTypeID v20 = (void *)v19;
          if (v18 && v19 && (objc_opt_isKindOfClass() & 1) == 0)
          {

            CFTypeID v20 = 0LL;
          }

          int log = [v20 BOOLValue];

          uint64_t v21 = objc_opt_class();
          uint64_t v22 = -[__CFDictionary objectForKey:](a5, "objectForKey:", @"EXRequiresLegacyInfrastructure");
          CFTypeID v23 = (void *)v22;
          if (v21 && v22 && (objc_opt_isKindOfClass() & 1) == 0)
          {

            CFTypeID v23 = 0LL;
          }

          char v24 = [v23 BOOLValue];

          if ((v24 & 1) != 0)
          {
            int v64 = 1;
          }

          else
          {
            uint64_t v25 = objc_opt_class();
            uint64_t v26 = -[__CFDictionary objectForKey:](a5, "objectForKey:", @"EXTCCPolicy");
            uint64_t v27 = (void *)v26;
            if (v25 && v26 && (objc_opt_isKindOfClass() & 1) == 0)
            {

              uint64_t v27 = 0LL;
            }

            if ([v27 isEqualToString:@"prompt-container-personality"])
            {
              int v28 = 1;
            }

            else if ([v27 isEqualToString:@"prompt-host-personality"])
            {
              int v28 = 2;
            }

            else
            {
              int v28 = 0;
            }

            int v64 = v28;
          }

          if (v16
            && (CFTypeID v29 = (__CFString *)CFDictionaryGetValue(v16, @"NSExtensionPointVersion"),
                CFTypeID v30 = CFStringGetTypeID(),
                v29)
            && (!v30 || CFGetTypeID(v29) == v30))
          {
            _LSGetVersionFromString(v29, buf);
            char v31 = 0;
          }

          else
          {
            CFTypeID v29 = 0LL;
            memset(buf, 0, 32);
            char v31 = 1;
          }

          __int128 v125 = *(_OWORD *)buf;
          __int128 v126 = *(_OWORD *)&buf[16];
          if (!_LSExtensionPointFindWithIdentifier(v68, a3, a4, a2, &v89, &v88) && (_DWORD)v89)
          {
            __int128 v32 = *(_OWORD *)(v88 + 24);
            v122[0] = *(_OWORD *)(v88 + 8);
            v122[1] = v32;
            v121[0] = v125;
            v121[1] = v126;
            if (_LSVersionNumberCompare(v122, v121))
            {
              __int128 v33 = *(_OWORD *)(v88 + 24);
              v120[0] = *(_OWORD *)(v88 + 8);
              v120[1] = v33;
              v119[0] = v125;
              v119[1] = v126;
              if (_LSVersionNumberCompare(v120, v119) != -1)
              {
                _LSRegistrationLog();
                loga = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
                {
                  __int128 v34 = *(_OWORD *)(v88 + 24);
                  v91[0] = *(_OWORD *)(v88 + 8);
                  v91[1] = v34;
                  _LSVersionNumberGetStringRepresentation(v91);
                  int v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = a3;
                  *(_WORD *)&_BYTE buf[12] = 2112;
                  *(void *)&buf[14] = v29;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)&_BYTE buf[24] = v35;
                  _os_log_impl( &dword_183E58000,  loga,  OS_LOG_TYPE_ERROR,  "Not registering extension point %@, it has a lower version (%@) than existing registered extension p oint with that identifer (%@)",  buf,  0x20u);
                }

                uint64_t v12 = 0LL;
                goto LABEL_102;
              }
            }

            _LSExtensionPointRemove(v68, v89);
          }

          if (!v16
            || (int v36 = (const __CFString *)CFDictionaryGetValue(v16, @"NSExtensionPointName"),
                CFTypeID v37 = CFStringGetTypeID(),
                !v36)
            || v37 && CFGetTypeID(v36) != v37)
          {
            _LSRegistrationLog();
            char v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = a3;
              _os_log_impl( &dword_183E58000,  v38,  OS_LOG_TYPE_ERROR,  "ExtensionPoint %@ does not specify NSExtensionPointName",  buf,  0xCu);
            }

            int v36 = a3;
          }

          if (!CFEqual(v36, a3))
          {
            _LSRegistrationLog();
            id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = a3;
              *(_WORD *)&_BYTE buf[12] = 2112;
              *(void *)&buf[14] = v36;
            }
          }

          else {
            int v40 = 2;
          }
          int v63 = v40;
          loga = a5;
          int StringForCFString = _LSDatabaseCreateStringForCFString(v68, a3, 0);
          int v42 = _LSDatabaseCreateStringForCFString(v68, v36, 0);
          if ((v31 & 1) != 0) {
            memset(buf, 0, 32);
          }
          else {
            _LSGetVersionFromString(v29, buf);
          }
          __int128 v123 = *(_OWORD *)buf;
          __int128 v124 = *(_OWORD *)&buf[16];
          int v62 = _LSPlistAdd((uint64_t)v68, loga);
          -[os_log_s objectForKey:](loga, "objectForKey:", @"EXDiscoverFromHiddenApps");
          int v61 = (void *)objc_claimAutoreleasedReturnValue();
          unsigned int v43 = [v61 BOOLValue];
          if (a6)
          {
            id v87 = 0LL;
            LODWORD(a6) = _LSAliasAddURL(v68, a6, &v87);
            id v44 = v87;
            if (v44)
            {
              _LSRegistrationLog();
              uint32_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = a3;
                *(_WORD *)&_BYTE buf[12] = 2112;
                *(void *)&buf[14] = v44;
                _os_log_impl( &dword_183E58000,  v45,  OS_LOG_TYPE_ERROR,  "couldn't set declaring framework of extension point %@: %@",  buf,  0x16u);
              }
            }
          }

          __int128 v109 = v123;
          uint64_t v46 = v43;
          v108[0] = 0;
          v108[1] = StringForCFString;
          __int128 v110 = v124;
          int v111 = v42;
          int v112 = a4;
          int v113 = v62;
          int v114 = (int)a6;
          int v115 = a2;
          int v116 = v63;
          int v117 = v64;
          uint64_t v118 = v43;
          HIDWORD(v89) = _LSExtensionPointAdd(v68, v108);
          if (!HIDWORD(v89))
          {
            uint64_t v12 = 4294956477LL;
LABEL_101:

LABEL_102:
            if (!v67) {
              _LSContextDestroy(&v90);
            }
            goto LABEL_104;
          }

          id v60 = v11;
          uint64_t v47 = _LSBundleGet(v68, a2);
          if (v47)
          {
            if (!*(_DWORD *)(v47 + 468))
            {
              LODWORD(v91[0]) = _CSArrayCreate();
              if (LODWORD(v91[0]))
              {
                *(void *)buf = 0LL;
                else {
                  uint64_t v12 = _LSGetOSStatusFromNSError(*(void **)buf);
                }
              }

              else
              {
                uint64_t v12 = 0LL;
              }

              int v49 = StringForCFString;
              goto LABEL_93;
            }

            _CSArrayAppendValue();
          }

          else
          {
            _LSRegistrationLog();
            id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              *(void *)&uint8_t buf[4] = a2;
              *(_WORD *)&_BYTE buf[12] = 2112;
              *(void *)&buf[14] = a3;
              _os_log_impl( &dword_183E58000,  v48,  OS_LOG_TYPE_ERROR,  "Failed to fetch app bundle unit: %llu for extension point: %@",  buf,  0x16u);
            }
          }

          int v49 = StringForCFString;
          uint64_t v12 = 0LL;
LABEL_93:
          uint64_t v81 = 0LL;
          CFIndex v82 = &v81;
          uint64_t v83 = 0x3032000000LL;
          int v84 = __Block_byref_object_copy__38;
          v85 = __Block_byref_object_dispose__38;
          [MEMORY[0x189603FE0] set];
          id v86 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v75 = 0LL;
          int v76 = &v75;
          uint64_t v77 = 0x3032000000LL;
          unsigned int v78 = __Block_byref_object_copy__38;
          v79 = __Block_byref_object_dispose__38;
          [MEMORY[0x189603FC8] dictionary];
          id v80 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v50 = MEMORY[0x1895F87A8];
          *(void *)buf = MEMORY[0x1895F87A8];
          *(void *)&buf[8] = 3221225472LL;
          *(void *)&buf[16] = ___ZL31_LSServerRegisterExtensionPointP11_LSDatabasejPK10__CFStringjPK14__CFDictionaryPK7__CFURL_block_invoke;
          *(void *)&_BYTE buf[24] = &unk_189D78538;
          int v95 = 0;
          int v96 = v49;
          __int128 v97 = v123;
          __int128 v98 = v124;
          int v99 = v42;
          int v100 = a4;
          int v101 = v62;
          int v102 = (int)a6;
          int v103 = a2;
          int v104 = v63;
          uint64_t v106 = v46;
          int v105 = v64;
          int v107 = v42;
          CFIndex v93 = &v75;
          v94 = &v81;
          id v51 = v68;
          *(void *)&uint8_t buf[32] = v51;
          id v11 = v60;
          __int16 v52 = (void *)MEMORY[0x186E2A7B8](buf);
          _CSStoreEnumerateUnits();
          int v53 = (void *)v76[5];
          v73[0] = v50;
          v73[1] = 3221225472LL;
          v73[2] = ___ZL31_LSServerRegisterExtensionPointP11_LSDatabasejPK10__CFStringjPK14__CFDictionaryPK7__CFURL_block_invoke_2;
          v73[3] = &unk_189D78560;
          id v54 = v51;
          id v74 = v54;
          [v53 enumerateKeysAndObjectsUsingBlock:v73];
          __int128 v71 = 0u;
          __int128 v72 = 0u;
          __int128 v69 = 0u;
          __int128 v70 = 0u;
          id v55 = (id)v82[5];
          uint64_t v56 = [v55 countByEnumeratingWithState:&v69 objects:v91 count:16];
          if (v56)
          {
            uint64_t v57 = *(void *)v70;
            do
            {
              for (uint64_t i = 0LL; i != v56; ++i)
              {
                if (*(void *)v70 != v57) {
                  objc_enumerationMutation(v55);
                }
                _LSBindableActivate(v54, [*(id *)(*((void *)&v69 + 1) + 8 * i) intValue]);
              }

              uint64_t v56 = [v55 countByEnumeratingWithState:&v69 objects:v91 count:16];
            }

            while (v56);
          }

          _Block_object_dispose(&v75, 8);
          _Block_object_dispose(&v81, 8);

          goto LABEL_101;
        }
      }
    }

    else
    {
      CFDictionaryGetTypeID();
    }

    int v16 = 0LL;
    goto LABEL_20;
  }

  uint64_t v12 = _LSRegisterExtensionPointClient((uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6);
LABEL_105:

  return v12;
}

void sub_183F61DA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, void *a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,void *a63)
{
}

uint64_t _LSRegisterFrameworkExtensionPointIfNecessary( void *a1, int a2, __CFString *a3, uint64_t a4, const __CFDictionary *a5, void *a6)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v11 = a1;
  uint64_t v12 = v11;
  if (!a2 && a6)
  {
    int v24 = 0;
    uint64_t v23 = 0LL;
    if (_LSExtensionPointFindWithIdentifier(v11, a3, a4, 0LL, &v24, &v23)
      || !v23
      || !*(_DWORD *)(v23 + 52))
    {
      goto LABEL_25;
    }

    if (a5)
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(a5, @"NSExtension");
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
      {
        int v15 = (const __CFDictionary *)CFDictionaryGetValue(Value, @"NSExtensionAttributes");
        CFTypeID v16 = CFDictionaryGetTypeID();
        if (v15)
        {
          if (!v16 || CFGetTypeID(v15) == v16)
          {
            CFTypeID v17 = (__CFString *)CFDictionaryGetValue(v15, @"NSExtensionPointVersion");
            CFTypeID v18 = CFStringGetTypeID();
            if (v17)
            {
              if (!v18 || CFGetTypeID(v17) == v18)
              {
                _LSGetVersionFromString(v17, &v25);
LABEL_22:
                __int128 v21 = *(_OWORD *)(v23 + 24);
                *(_OWORD *)buf = *(_OWORD *)(v23 + 8);
                __int128 v29 = v21;
                v27[0] = v25;
                v27[1] = v26;
                if (!_LSVersionNumberCompare(buf, v27) && v24)
                {
                  uint64_t v20 = 0LL;
                  goto LABEL_26;
                }

void sub_183F62174(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _LSUnregisterExtensionPoint(void *a1, const __CFString *a2, uint64_t a3, uint64_t a4, __CFString *a5)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v9 = a1;
  if ([(id)__LSDefaultsGetSharedInstance() hasServer])
  {
    uint64_t v10 = _LSUnregisterExtensionPointClient((uint64_t)a2, a3, (uint64_t)a5, a4);
  }

  else if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    id v11 = v9;
    CFTypeID v17 = 0LL;
    uint64_t v12 = v11;
    if (v11 || (uint64_t v10 = _LSContextInit(&v17), v12 = v17, !(_DWORD)v10))
    {
      int v16 = 0;
      uint64_t v15 = 0LL;
      uint64_t v10 = _LSExtensionPointFindWithIdentifier(v12, a2, a3, a4, &v16, &v15);
      if (!(_DWORD)v10)
      {
        if (!a5
          || (__int128 v13 = *(_OWORD *)(v15 + 24),
              v19[0] = *(_OWORD *)(v15 + 8),
              v19[1] = v13,
              _LSGetVersionFromString(a5, v18),
              !_LSVersionNumberCompare(v19, v18)))
        {
          _LSExtensionPointRemove(v12, v16);
        }
      }

      if (!v11) {
        _LSContextDestroy(&v17);
      }
    }
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  return v10;
}

void sub_183F6231C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t _LSRegisterPlugins(void *a1, int a2, int a3, const __CFDictionary *a4, const void *a5, int a6)
{
  id v134 = a1;
  if (!a4 || (CFIndex Count = CFDictionaryGetCount(a4), Count < 1))
  {
    uint64_t v12 = 0LL;
    goto LABEL_220;
  }

  CFTypeID v9 = CFGetTypeID(a4);
  if (v9 != CFDictionaryGetTypeID() || a5 && (CFTypeID v10 = CFGetTypeID(a5), v10 != CFDictionaryGetTypeID()))
  {
    uint64_t v12 = 4294956479LL;
    goto LABEL_220;
  }

  allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (a5) {
    unint64_t v131 = CFDictionaryGetCount((CFDictionaryRef)a5);
  }
  else {
    unint64_t v131 = 0LL;
  }
  keys = 0LL;
  __int128 v140 = 0LL;
  uint64_t v141 = 0LL;
  std::vector<LSRecord * {__weak}>::__vallocate[abi:nn180100](&keys, Count);
  theDict = (const __CFDictionary *)a5;
  __int128 v13 = (char *)v140;
  bzero(v140, 8 * Count);
  __int128 v140 = &v13[8 * Count];
  values = 0LL;
  uint64_t v137 = 0LL;
  uint64_t v138 = 0LL;
  std::vector<LSRecord * {__weak}>::__vallocate[abi:nn180100](&values, Count);
  __int128 v110 = Mutable;
  CFTypeID v14 = (char *)v137;
  bzero(v137, 8 * Count);
  uint64_t v137 = &v14[8 * Count];
  CFDictionaryGetKeysAndValues(a4, (const void **)keys, (const void **)values);
  unint64_t v15 = 0LL;
  Value = 0LL;
  CFTypeID v17 = (const void *)*MEMORY[0x189604E00];
  int v108 = (void *)*MEMORY[0x189604E10];
  __int128 v109 = (void *)*MEMORY[0x189604AC8];
  uint64_t v106 = (void *)*MEMORY[0x189604DF8];
  int v107 = (void *)*MEMORY[0x189604AA0];
  CFIndex v130 = Count;
  do
  {
    CFTypeID v18 = values[v15];
    if (v15 < v131)
    {
      if (theDict && (uint64_t v19 = keys[v15]) != 0LL)
      {
        Value = (void *)CFDictionaryGetValue(theDict, v19);
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (Value && TypeID && CFGetTypeID(Value) != TypeID) {
          Value = 0LL;
        }
      }

      else
      {
        CFDictionaryGetTypeID();
        Value = 0LL;
      }
    }

    __int128 v21 = (_LSDatabase *)v134;
    uint64_t v22 = _LSBundleGet(v21, a3);
    memset(v172, 0, sizeof(v172));
    __int128 v170 = 0u;
    __int128 v171 = 0u;
    __int128 v168 = 0u;
    __int128 v169 = 0u;
    __int128 v166 = 0u;
    __int128 v167 = 0u;
    __int128 v164 = 0u;
    __int128 v165 = 0u;
    __int128 v162 = 0u;
    __int128 v163 = 0u;
    CFTypeID v23 = CFGetTypeID(v18);
    if (v23 != CFDictionaryGetTypeID())
    {
LABEL_213:
      id v44 = 0LL;
      uint64_t v12 = 4294956479LL;
      goto LABEL_69;
    }

    if (Value)
    {
      CFTypeID v24 = CFGetTypeID(Value);
      if (v24 != CFDictionaryGetTypeID()) {
        goto LABEL_213;
      }
      __int128 v25 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)Value, @"Path");
      CFTypeID v26 = CFStringGetTypeID();
      if (!v25) {
        goto LABEL_64;
      }
      CFTypeID v27 = v26;
      if (v26)
      {
LABEL_29:
        if (CFGetTypeID(v25) != v27) {
          goto LABEL_64;
        }
      }
    }

    else
    {
      if (!v18)
      {
        CFStringGetTypeID();
LABEL_64:
        uint64_t v12 = 0LL;
        id v44 = 0LL;
        goto LABEL_69;
      }

      __int128 v25 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v18, @"Path");
      CFTypeID v28 = CFStringGetTypeID();
      if (!v25) {
        goto LABEL_64;
      }
      CFTypeID v27 = v28;
      if (v28) {
        goto LABEL_29;
      }
    }

    CFTypeID v29 = CFGetTypeID(v25);
    if (v29 != CFStringGetTypeID()) {
      goto LABEL_64;
    }
    CFURLRef v30 = CFURLCreateWithFileSystemPath(allocator, v25, kCFURLPOSIXPathStyle, 1u);
    CFURLRef cf = v30;
    if (!v30) {
      goto LABEL_64;
    }
    CFTypeID v31 = CFGetTypeID(v30);
    if (v31 == CFURLGetTypeID())
    {
      __int128 v32 = (void *)MEMORY[0x186E2A59C]();
      objc_msgSend(v18, "_ls_normalizedPluginPlist");
      __int128 v135 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v32);
      __int128 v33 = (void *)MEMORY[0x186E2A59C]();
      CFTypeID v34 = CFNumberGetTypeID();
      int v35 = (void *)CFDictionaryGetValue(v135, @"LSExecutablePlatformKey");
      int v36 = v35;
      if (v35 && CFGetTypeID(v35) == v34)
      {
        id v37 = v36;
        int v126 = [v37 unsignedLongLongValue];
      }

      else
      {
        int v126 = 0;
      }

      objc_autoreleasePoolPop(v33);
      if (v135)
      {
        CFTypeRef v128 = CFDictionaryGetValue(v135, @"NSExtension");
        CFTypeID v38 = CFDictionaryGetTypeID();
        if (!v128 || v38 && CFGetTypeID(v128) != v38 || (CFTypeID v39 = CFGetTypeID(v128), v39 != CFDictionaryGetTypeID()))
        {
          id v44 = 0LL;
          CFURLRef v129 = 0LL;
          uint64_t v12 = 0LL;
LABEL_62:
          CFRelease(v135);
          goto LABEL_67;
        }

        if (!Value)
        {
          int v45 = 0;
          CFURLRef v129 = 0LL;
          CFTypeRef v120 = 0LL;
          CFTypeRef v121 = 0LL;
          CFTypeRef v119 = 0LL;
          CFTypeRef v112 = 0LL;
          goto LABEL_92;
        }

        CFTypeRef v121 = CFDictionaryGetValue((CFDictionaryRef)Value, @"CodeInfoIdentifier");
        CFTypeID v40 = CFStringGetTypeID();
        if (!v121 || v40 && CFGetTypeID(v121) != v40) {
          CFTypeRef v121 = 0LL;
        }
        CFTypeRef v120 = CFDictionaryGetValue((CFDictionaryRef)Value, @"SignerOrganization");
        CFTypeID v41 = CFStringGetTypeID();
        if (!v120 || v41 && CFGetTypeID(v120) != v41) {
          CFTypeRef v120 = 0LL;
        }
        CFTypeRef v119 = CFDictionaryGetValue((CFDictionaryRef)Value, @"SignerIdentity");
        CFTypeID v42 = CFStringGetTypeID();
        if (!v119 || v42 && CFGetTypeID(v119) != v42) {
          CFTypeRef v119 = 0LL;
        }
        CFTypeRef v123 = CFDictionaryGetValue((CFDictionaryRef)Value, @"Entitlements");
        CFTypeID v43 = CFDictionaryGetTypeID();
        if (!v123 || v43 && CFGetTypeID(v123) != v43) {
          CFTypeRef v123 = 0LL;
        }
        *((void *)&v165 + 1) = _LSGetTeamIdentifierFromInstallDict(Value);
        if ([(id)__LSDefaultsGetSharedInstance() isInEducationMode])
        {
          CFTypeRef v112 = 0LL;
        }

        else
        {
          CFTypeRef v112 = CFDictionaryGetValue((CFDictionaryRef)Value, @"GroupContainers");
          CFTypeID v46 = CFDictionaryGetTypeID();
          if (!v112 || v46 && CFGetTypeID(v112) != v46) {
            CFTypeRef v112 = 0LL;
          }
          if (CFDictionaryContainsKey((CFDictionaryRef)Value, @"Container"))
          {
            uint64_t v47 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)Value, @"Container");
            CFTypeID v48 = CFStringGetTypeID();
            if (v47 && v48 && CFGetTypeID(v47) != v48) {
              uint64_t v47 = 0LL;
            }
            CFURLRef v129 = CFURLCreateWithFileSystemPath(allocator, v47, kCFURLPOSIXPathStyle, 1u);
LABEL_83:
            BYTE4(v172[1]) = _LSGetProfileValidationStateFromInstallDictionary((const __CFDictionary *)Value);
            if (CFDictionaryContainsKey((CFDictionaryRef)Value, @"LSHasOverride"))
            {
              int v45 = 8;
              LODWORD(v162) = 8;
            }

            else
            {
              int v45 = 0;
            }

            if (v123)
            {
              if (CFDictionaryContainsKey((CFDictionaryRef)v123, @"com.apple.developer.replace-plugin"))
              {
                v45 |= 4u;
                LODWORD(v162) = v45;
                CFTypeRef v111 = CFDictionaryGetValue((CFDictionaryRef)v123, @"com.apple.developer.replace-plugin");
                CFTypeID v49 = CFStringGetTypeID();
                if (v111)
                {
                  if (!v49 || CFGetTypeID(v111) == v49)
                  {
LABEL_94:
                    if (CFStringFind(v25, @".framework/", 1uLL).location != -1) {
                      LODWORD(v162) = v45 | 2;
                    }
                    CFTypeID v50 = CFArrayGetTypeID();
                    id v51 = (void *)CFDictionaryGetValue(v135, @"_LSSliceInfosKey");
                    __int16 v52 = v51;
                    if (v51)
                    {
                      if (CFGetTypeID(v51) == v50) {
                        int v53 = v52;
                      }
                      else {
                        int v53 = 0LL;
                      }
                    }

                    else
                    {
                      int v53 = 0LL;
                    }

                    id v105 = v53;
                    *((void *)&v171 + 1) = v105;
                    CFTypeID v54 = CFArrayGetTypeID();
                    id v55 = CFDictionaryGetValue(v135, @"UTExportedTypeDeclarations");
                    uint64_t v56 = v55;
                    if (v55)
                    {
                      if (CFGetTypeID(v55) == v54) {
                        uint64_t v57 = v56;
                      }
                      else {
                        uint64_t v57 = 0LL;
                      }
                    }

                    else
                    {
                      uint64_t v57 = 0LL;
                    }

                    *(void *)&v172[0] = v57;
                    CFTypeID v58 = CFArrayGetTypeID();
                    __int128 v59 = CFDictionaryGetValue(v135, @"UTImportedTypeDeclarations");
                    id v60 = v59;
                    if (v59)
                    {
                      if (CFGetTypeID(v59) == v58) {
                        int v61 = v60;
                      }
                      else {
                        int v61 = 0LL;
                      }
                    }

                    else
                    {
                      int v61 = 0LL;
                    }

                    *((void *)&v172[0] + 1) = v61;
                    BOOL v62 = _LSGetBooleanFromDict(v135, @"_LSRequiresGarbageCollection") != 0;
                    int v63 = 2 * v62;
                    BYTE12(v172[1]) = 2 * v62;
                    BOOL v64 = _LSGetBooleanFromDict(v135, @"NSBuiltWithThreadSanitizer") != 0;
                    unsigned int v65 = v63 | (4 * v64);
                    BYTE12(v172[1]) = v63 | (4 * v64);
                    CFTypeRef v122 = CFDictionaryGetValue(v135, @"MachOUUIDs");
                    CFTypeID v66 = CFArrayGetTypeID();
                    if (!v122 || v66 && CFGetTypeID(v122) != v66) {
                      CFTypeRef v122 = 0LL;
                    }
                    if (v17)
                    {
                      __int128 v124 = (const __CFString *)CFDictionaryGetValue(v135, v17);
                      CFTypeID v67 = CFStringGetTypeID();
                      if (v124 && (!v67 || CFGetTypeID(v124) == v67))
                      {
LABEL_122:
                        if (v109)
                        {
                          int v115 = (const __CFString *)CFDictionaryGetValue(v135, v109);
                          CFTypeID v68 = CFStringGetTypeID();
                          if (v115 && (!v68 || CFGetTypeID(v115) == v68))
                          {
LABEL_129:
                            if (v108)
                            {
                              CFTypeRef v118 = CFDictionaryGetValue(v135, v108);
                              CFTypeID v69 = CFStringGetTypeID();
                              if (v118 && (!v69 || CFGetTypeID(v118) == v69))
                              {
LABEL_136:
                                if (v107)
                                {
                                  CFTypeRef v117 = CFDictionaryGetValue(v135, v107);
                                  CFTypeID v70 = CFStringGetTypeID();
                                  if (v117 && (!v70 || CFGetTypeID(v117) == v70))
                                  {
LABEL_143:
                                    if (v106)
                                    {
                                      CFTypeRef v116 = CFDictionaryGetValue(v135, v106);
                                      CFTypeID v71 = CFStringGetTypeID();
                                      if (v116 && (!v71 || CFGetTypeID(v116) == v71))
                                      {
LABEL_150:
                                        __int128 v72 = CFDictionaryGetValue(v135, @"LSExecutableSDKVersion");
                                        CFTypeID v73 = CFStringGetTypeID();
                                        if (v72 && v73 && CFGetTypeID(v72) != v73) {
                                          __int128 v72 = 0LL;
                                        }
                                        if (CFDictionaryContainsKey(v135, @"_LSIsLinkEnabled"))
                                        {
                                          v65 |= 8
                                               * (_LSGetBooleanFromDict(v135, @"_LSIsLinkEnabled") != 0);
                                          BYTE12(v172[1]) = v65;
                                        }

                                        id v74 = CFDictionaryGetValue(v135, @"LSIsSecuredSystemContent");
                                        CFTypeID v75 = CFBooleanGetTypeID();
                                        if (v74
                                          && (!v75 || CFGetTypeID(v74) == v75)
                                          && CFBooleanGetValue((CFBooleanRef)v74))
                                        {
                                          v65 |= 0x10u;
                                          BYTE12(v172[1]) = v65;
                                        }

                                        if (v124)
                                        {
                                          CFTypeID v76 = CFStringGetTypeID();
                                          if (v76 == CFGetTypeID(v124))
                                          {
                                            if (CFStringHasPrefix(v124, @"com.apple."))
                                            {
                                              v65 |= 1u;
                                              BYTE12(v172[1]) = v65;
                                            }
                                          }
                                        }

                                        int v77 = v65 & 0x10;
                                        if (v22)
                                        {
                                          unsigned int v78 = _CSArrayGetCount();
                                          if (v78 > 1) {
                                            goto LABEL_177;
                                          }
                                          if (v78 != 1)
                                          {
                                            if (v65 >> 4) {
                                              goto LABEL_175;
                                            }
                                            goto LABEL_177;
                                          }

                                          int v79 = _CSArrayGetValueAtIndex() & 0xFFFFFFFD;
                                          int v77 = (v65 & 0x10) != 0 && v79 == 1;
                                        }

                                        if (v77)
                                        {
LABEL_175:
                                          char v81 = 32;
                                          goto LABEL_178;
                                        }

LABEL_177:
                                        char v81 = 0;
LABEL_178:
                                        BYTE12(v172[1]) = v81 | v65;
                                        *((void *)&v163 + 1) = cf;
                                        *(void *)&__int128 v164 = v129;
                                        *(void *)&__int128 v166 = v118;
                                        *((void *)&v166 + 1) = v117;
                                        *(void *)&__int128 v167 = v121;
                                        *((void *)&v167 + 1) = v120;
                                        *(void *)&__int128 v168 = v119;
                                        *((void *)&v168 + 1) = v123;
                                        LODWORD(v172[1]) = a2;
                                        *(void *)&__int128 v169 = v112;
                                        *((void *)&v169 + 1) = v116;
                                        *((void *)&v164 + 1) = v124;
                                        *(void *)&__int128 v165 = v111;
                                        *((void *)&v162 + 1) = v122;
                                        *(void *)&__int128 v163 = v72;
                                        DWORD1(v162) = v126;
                                        uint64_t v82 = objc_opt_class();
                                        uint64_t v83 = [Value objectForKey:@"SignatureVersion"];
                                        int v84 = (void *)v83;
                                        if (v82 && v83 && (objc_opt_isKindOfClass() & 1) == 0)
                                        {

                                          int v84 = 0LL;
                                        }

                                        DWORD2(v172[1]) = [v84 unsignedLongLongValue];

                                        v85 = (void *)MEMORY[0x186E2A59C]();
                                        [MEMORY[0x189603FC8] dictionary];
                                        id v86 = (void *)objc_claimAutoreleasedReturnValue();
                                        v160[0] = MEMORY[0x1895F87A8];
                                        v160[1] = 3221225472LL;
                                        v160[2] = ___ZL25_LSPluginRegisterWithInfoP11_LSDatabasePK14__CFDictionaryS3_hPS1_jj_block_invoke;
                                        v160[3] = &unk_189D74AF8;
                                        id v87 = v86;
                                        id v161 = v87;
                                        -[__CFDictionary enumerateKeysAndObjectsUsingBlock:]( v135,  "enumerateKeysAndObjectsUsingBlock:",  v160);
                                        id v88 = v87;

                                        *(void *)&__int128 v170 = v88;
                                        objc_autoreleasePoolPop(v85);
                                        uint64_t v89 = (void *)MEMORY[0x186E2A59C]();
                                        uint64_t v90 = objc_opt_class();
                                        uint64_t v91 = [v18 objectForKey:@"_LSLocalizedStringsDictionary"];
                                        CFIndex v92 = (void *)v91;
                                        if (v90 && v91 && (objc_opt_isKindOfClass() & 1) == 0)
                                        {

                                          CFIndex v92 = 0LL;
                                        }

                                        context = 0LL;
                                        *(void *)&__int128 v143 = &context;
                                        *((void *)&v143 + 1) = 0x2020000000LL;
                                        CFIndex v93 = (void *)objc_opt_class();
                                        v94 = (void *)objc_opt_class();
                                        LOBYTE(v144) = _LSIsDictionaryWithKeysAndValuesOfClass(v92, v93, v94);
                                        if (*(_BYTE *)(v143 + 24))
                                        {
                                          v159[0] = MEMORY[0x1895F87A8];
                                          v159[1] = 3221225472LL;
                                          v159[2] = ___ZL25_LSPluginRegisterWithInfoP11_LSDatabasePK14__CFDictionaryS3_hPS1_jj_block_invoke_2;
                                          v159[3] = &unk_189D74B20;
                                          v159[4] = &context;
                                          [v92 enumerateKeysAndObjectsUsingBlock:v159];
                                          if (*(_BYTE *)(v143 + 24)) {
                                            objc_storeStrong((id *)&v170 + 1, v92);
                                          }
                                        }

                                        _Block_object_dispose(&context, 8);

                                        objc_autoreleasePoolPop(v89);
                                        int v95 = (void *)MEMORY[0x186E2A59C]();
                                        uint64_t v96 = objc_opt_class();
                                        uint64_t v97 = -[__CFDictionary objectForKey:]( v135,  "objectForKey:",  @"_LSIntentDefinitionURLs");
                                        id v44 = (void *)v97;
                                        if (v96 && v97 && (objc_opt_isKindOfClass() & 1) == 0)
                                        {

                                          id v44 = 0LL;
                                        }

                                        __int128 v98 = (void *)v171;
                                        *(void *)&__int128 v171 = v44;

                                        objc_autoreleasePoolPop(v95);
                                        if (CFDictionaryContainsKey((CFDictionaryRef)v128, @"Multiple"))
                                        {
                                          __int128 v157 = 0u;
                                          __int128 v158 = 0u;
                                          *(_OWORD *)&v156[24] = 0u;
                                          context = v21;
                                          __int128 v143 = v162;
                                          __int128 v144 = v163;
                                          __int128 v145 = v164;
                                          uint64_t v146 = v165;
                                          id v147 = *((id *)&v165 + 1);
                                          __int128 v150 = v168;
                                          __int128 v151 = v169;
                                          uint64_t v152 = v170;
                                          __int128 v148 = v166;
                                          __int128 v149 = v167;
                                          id v153 = *((id *)&v170 + 1);
                                          id v154 = v44;
                                          id v99 = v105;
                                          *(_OWORD *)v156 = v172[0];
                                          *(_OWORD *)&v156[14] = *(_OWORD *)((char *)v172 + 14);
                                          id v155 = v99;
                                          *(void *)&v156[32] = v115;
                                          *(void *)&__int128 v157 = v128;
                                          DWORD2(v157) = a3;
                                          BYTE12(v157) = a6;
                                          *(void *)&__int128 v158 = v110;
                                          DWORD2(v15_Block_object_dispose((const void *)(v2 - 112), 8) = 0;
                                          uint64_t v12 = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)v128, @"Multiple");
                                          CFTypeID v100 = CFDictionaryGetTypeID();
                                          if (v12)
                                          {
                                            if (v100 && CFGetTypeID((CFTypeRef)v12) != v100)
                                            {
                                              uint64_t v12 = 0LL;
                                            }

                                            else
                                            {
                                              CFDictionaryApplyFunction( (CFDictionaryRef)v12,  (CFDictionaryApplierFunction)_LSPluginRegistration_CFDictionaryApplier,  &context);
                                              uint64_t v12 = DWORD2(v158);
                                            }
                                          }
                                        }

                                        else
                                        {
                                          int v101 = (__CFString *)CFDictionaryGetValue( (CFDictionaryRef)v128,  @"NSExtensionAttributes");
                                          CFTypeID v102 = CFDictionaryGetTypeID();
                                          if (v101 && v102 && CFGetTypeID(v101) != v102) {
                                            int v101 = 0LL;
                                          }
                                          LODWORD(context) = 0;
                                          unsigned int v103 = _LSRegisterPlugin( v21,  (const LSPluginInfo *)&v162,  v101,  v124,  v115,  (const __CFDictionary *)v128,  a3,  (unsigned int *)&context);
                                          if (a6 || v103 || !(_DWORD)context)
                                          {
                                            if (v103 == -10651) {
                                              uint64_t v12 = 0LL;
                                            }
                                            else {
                                              uint64_t v12 = v103;
                                            }
                                          }

                                          else
                                          {
                                            LSPluginAddInfoToPayloadDict(v21, v110, (int)context, 1LL, 1);
                                            uint64_t v12 = 0LL;
                                          }
                                        }

                                        if (v88) {
                                          CFRelease(v88);
                                        }
                                        goto LABEL_62;
                                      }
                                    }

                                    else
                                    {
                                      CFStringGetTypeID();
                                    }

                                    CFTypeRef v116 = 0LL;
                                    goto LABEL_150;
                                  }
                                }

                                else
                                {
                                  CFStringGetTypeID();
                                }

                                CFTypeRef v117 = 0LL;
                                goto LABEL_143;
                              }
                            }

                            else
                            {
                              CFStringGetTypeID();
                            }

                            CFTypeRef v118 = 0LL;
                            goto LABEL_136;
                          }
                        }

                        else
                        {
                          CFStringGetTypeID();
                        }

                        int v115 = 0LL;
                        goto LABEL_129;
                      }
                    }

                    else
                    {
                      CFStringGetTypeID();
                    }

                    __int128 v124 = 0LL;
                    goto LABEL_122;
                  }
                }
              }

LABEL_93:
              CFTypeRef v111 = 0LL;
              goto LABEL_94;
            }

LABEL_92:
            CFTypeRef v123 = 0LL;
            goto LABEL_93;
          }
        }

        CFURLRef v129 = 0LL;
        goto LABEL_83;
      }

      CFDictionaryGetTypeID();
    }

    uint64_t v12 = 0LL;
    CFURLRef v129 = 0LL;
    id v44 = 0LL;
LABEL_67:
    CFRelease(cf);
    if (v129)
    {
      CFRelease(v129);
      id v44 = (void *)v171;
    }

LABEL_220:
  return v12;
}

void sub_183F633E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, void *a47, uint64_t a48, void *__p, uint64_t a50,uint64_t a51,void *a52)
{
  if (__p) {
    operator delete(__p);
  }
  if (a52) {
    operator delete(a52);
  }

  _Unwind_Resume(a1);
}

uint64_t _LSCopyPluginsWithURL(uint64_t a1, const __CFURL *a2)
{
  uint64_t v8 = 0LL;
  CFTypeID v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 0LL;
  int v3 = (void *)MEMORY[0x186E2A59C]();
  if (a2)
  {
    uint64_t v7 = (__CFString *)CFURLCopyFileSystemPath(a2, kCFURLPOSIXPathStyle);
    CFTypeID v4 = v7;
    _CSStoreEnumerateUnits();
  }

  objc_autoreleasePoolPop(v3);
  uint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_183F635E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _LSUnregisterPlugin(void **a1, uint64_t a2)
{
  return _LSUnregisterBundle(a1, a2, 0x20000000LL);
}

uint64_t _LSServerBundleRegistration( LSContext *a1, void *a2, void *a3, void *a4, const __CFDictionary *a5, unsigned int *a6, uint64_t a7, char *a8, _BYTE *a9)
{
  uint64_t v78 = *MEMORY[0x1895F89C0];
  __int128 v13 = a2;
  id v14 = a3;
  uint64_t v62 = 0LL;
  unsigned int v61 = 0;
  uint64_t v60 = 0LL;
  +[LSRecordBuilder recordBuilderForType:](&OBJC_CLASS___LSRecordBuilder, "recordBuilderForType:", 0LL);
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  int v16 = 0LL;
  uint64_t v17 = 4294956479LL;
  if (!a1 || !v13) {
    goto LABEL_84;
  }
  int v18 = v13[3];
  if (v18 == 203)
  {
    if (!v14)
    {
      int v16 = 0LL;
      goto LABEL_84;
    }
  }

  else
  {
    int v16 = 0LL;
    if (!v14 || v18 != 205) {
      goto LABEL_84;
    }
  }

  uint64_t v19 = a1->db;
  int v16 = v19;
  if (!v19) {
    goto LABEL_84;
  }
  if (!a4) {
    goto LABEL_84;
  }
  if (!v19->store) {
    goto LABEL_84;
  }
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(a4)) {
    goto LABEL_84;
  }
  [v15 setRegistrationInfo:v13 alias:v14];
  [v15 setDatabase:v16];
  if (a5)
  {
    HIDWORD(v54) = _LSGetBooleanFromDict(a5, @"IsPlaceholder");
    Value = (const __CFString *)CFDictionaryGetValue(a5, @"ApplicationType");
    CFTypeID v22 = CFStringGetTypeID();
    BOOL v23 = Value
       && (!v22 || CFGetTypeID(Value) == v22)
       && CFStringCompare(Value, @"SystemAppPlaceholder", 1uLL) == kCFCompareEqualTo;
    int v53 = _LSGetBooleanFromDict(a5, @"LSAppDowngrade");
    LODWORD(v54) = v23;
  }

  else
  {
    int v53 = 0;
    uint64_t v54 = 0LL;
  }

  if (CSStoreGetUnit())
  {
    unsigned int v61 = v13[7];
    uint64_t v24 = _LSBundleGet(v16, v61);
  }

  else
  {
    int v52 = v13[6];
    __int128 v25 = v16;
    uint64_t v63 = 0LL;
    BOOL v64 = &v63;
    uint64_t v65 = 0x2020000000LL;
    uint64_t v66 = 0LL;
    id v55 = (NSString *)v14;
    +[FSNode nameForBookmarkData:error:](&OBJC_CLASS___FSNode, "nameForBookmarkData:error:");
    CFTypeID v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      int StringForCFString = _LSDatabaseGetStringForCFString(v25, v26, 1);

      if (StringForCFString)
      {
        *(void *)&__int128 buf = MEMORY[0x1895F87A8];
        *((void *)&buf + 1) = 3221225472LL;
        CFTypeID v70 = ___ZL61_LSFindExistingRegisteredBundleWithContainerMatchingAliasDataP11_LSDatabasejP6NSDataPj_block_invoke;
        CFTypeID v71 = &unk_189D78588;
        int v76 = StringForCFString;
        int v77 = v52;
        __int128 v72 = v25;
        CFTypeID v28 = v55;
        CFTypeID v75 = &v61;
        CFTypeID v73 = v28;
        id v74 = &v63;
        _CSStoreEnumerateUnits();
      }
    }

    uint64_t v24 = v64[3];
    _Block_object_dispose(&v63, 8);
  }

  uint64_t v62 = v24;
  if (v24)
  {
    if (!HIDWORD(v54)
      && (_LSGetBooleanFromDict((const __CFDictionary *)a4, @"_LSInfoPlistIsMissing")
       || _LSGetBooleanFromDict((const __CFDictionary *)a4, @"_LSNoExecutableInfo"))
      && (*(void *)(v62 + 164) & 0x20000000000200LL) == 0)
    {
      _LSInstallLog();
      CFTypeID v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( &dword_183E58000,  v50,  OS_LOG_TYPE_DEFAULT,  "skipping registration of an incomplete bundle",  (uint8_t *)&buf,  2u);
      }

      char v29 = 1;
    }

    else
    {
      char v29 = 0;
    }

    if ((*(_BYTE *)(v62 + 164) & 0x80) == 0 && (v13[4] & 2) == 0)
    {
      _LSInstallLog();
      CFURLRef v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( &dword_183E58000,  v30,  OS_LOG_TYPE_DEFAULT,  "refusing to replace a trusted bundle with an untrusted one at the same path",  (uint8_t *)&buf,  2u);
      }

      uint64_t v17 = 4294956621LL;
      goto LABEL_84;
    }

    if (_LSBundleDataIsIncomplete(a1->db, v62))
    {
      unsigned int v31 = *(unsigned __int8 *)(v62 + 489);
      if (v31 < 0x3C) {
        LOBYTE(v31) = v31 + 1;
      }
      [v15 setRetries:v31];
    }

    if ((v29 & 1) != 0)
    {
      if (v62)
      {
        char v32 = 0;
LABEL_77:
        if (a6) {
          *a6 = v61;
        }
        if (a8)
        {
          if (!v61) {
            char v32 = 0;
          }
          *a8 = v32;
        }

        _LSDatabaseSetSequenceNumber((uint64_t)v16, v60);
        uint64_t v17 = 0LL;
        goto LABEL_84;
      }
    }

    else
    {
      [v15 setPreviousInstallType:*(unsigned int *)(v62 + 316)];
      uint64_t v17 = _LSBundleRemove(v16, v61, 0);
      if ((_DWORD)v17) {
        goto LABEL_84;
      }
      uint64_t v62 = 0LL;
      unsigned int v61 = 0;
    }
  }

  if (!CSStoreGetUnit())
  {
    uint64_t v17 = 4294957797LL;
    goto LABEL_84;
  }

  if (!*MEMORY[0x189604E00])
  {
    CFTypeID v34 = CFStringGetTypeID();
LABEL_53:
    id v37 = 0LL;
    goto LABEL_54;
  }

  __int128 v33 = (void *)CFDictionaryGetValue((CFDictionaryRef)a4, (const void *)*MEMORY[0x189604E00]);
  CFTypeID v34 = CFStringGetTypeID();
  if (!v33) {
    goto LABEL_53;
  }
  CFTypeID v36 = v34;
  if (v34)
  {
    CFTypeID v34 = CFGetTypeID(v33);
    if (v34 != v36) {
      goto LABEL_53;
    }
  }

  id v37 = (NSString *)v33;
LABEL_54:
  _LSLogStepStart(v34, 0LL, v37, v35);
  uint64_t v56 = v37;
  if (!v37) {
    goto LABEL_67;
  }
  CFTypeID v38 = CFGetTypeID(v37);
  BOOL v39 = v38 == CFStringGetTypeID();
  CFTypeID v40 = v56;
  if (!v39) {
    goto LABEL_67;
  }
  unsigned int v61 = 0;
  int v59 = 0;
  if ((_DWORD)v54
    || (memset(v68, 0, sizeof(v68)),
        BOOL v41 = _LSBundleFindWithInfoAndNo_IOFilter(a1, 0LL, v56, 0, v68, 2, 128, 0LL, 0LL, &v61, &v62, 0LL),
        memset(v67, 0, sizeof(v67)),
        BOOL v42 = _LSBundleFindWithInfoAndNo_IOFilter(a1, 0LL, v56, 0, v67, 2, 1152, 0LL, 0LL, &v59, &v63, 0LL),
        CFTypeID v40 = v56,
        !v41 && !v42))
  {
    _LSInstallLog();
    int v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v40;
      _os_log_impl(&dword_183E58000, v45, OS_LOG_TYPE_DEFAULT, "No bundles to remove for %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_67;
  }

  if (!v42)
  {
    uint64_t v17 = 0LL;
    uint64_t v63 = 0LL;
    int v59 = 0;
    if (!v41)
    {
      uint64_t v62 = 0LL;
      unsigned int v61 = 0;
      goto LABEL_67;
    }

    goto LABEL_89;
  }

  uint64_t v43 = _LSBundleGet(v16, v59);
  [v15 setPreviousInstallType:*(unsigned int *)(v43 + 316)];
  [v15 addBundleFlag:*(void *)(v43 + 164) & 0x80000];
  uint64_t v17 = _LSBundleRemove(v16, v59, 0);
  _LSInstallLog();
  id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  CFTypeID v40 = v56;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v56;
    _os_log_impl( &dword_183E58000,  v44,  OS_LOG_TYPE_DEFAULT,  "Removed existing registered placeholder for %@",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v63 = 0LL;
  int v59 = 0;
  if (v41)
  {
LABEL_89:
    if (!HIDWORD(v54) || v53)
    {
      objc_msgSend(v15, "setPreviousInstallType:", *(unsigned int *)(_LSBundleGet(v16, v61) + 316));
      uint64_t v17 = _LSBundleRemove(v16, v61, v53);
      _LSInstallLog();
      id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v40;
        _os_log_impl( &dword_183E58000,  v51,  OS_LOG_TYPE_DEFAULT,  "Removed existing registered bundle for %@",  (uint8_t *)&buf,  0xCu);
      }
    }

    else
    {
      [v15 addBundleFlag:0x80000];
      *(void *)&__int128 buf = *(void *)(v62 + 164) | 0x400000000000LL;
      _CSStoreWriteToUnit();
    }
  }

  uint64_t v62 = 0LL;
  unsigned int v61 = 0;
  if ((_DWORD)v17 && (_DWORD)v17 != -10814) {
    goto LABEL_84;
  }
LABEL_67:
  unint64_t v46 = _LSDatabaseGetSequenceNumber() + 1;
  uint64_t v60 = v46;
  [v15 setSequenceNumber:v46];
  if ([v15 parseInfoPlist:a4]
    && ([v15 parseInstallationInfo:a5] & 1) != 0)
  {
    uint64_t v17 = 0LL;
    uint64_t v47 = 1LL;
  }

  else
  {
    uint64_t v47 = 0LL;
    uint64_t v17 = 4294967246LL;
  }

  [v15 parseActivityTypesFromDictionary:a4];
  [v15 parseNSExtensionSDKDefinitionsFromDictionary:a4];
  _LSLogStepFinished(5LL, v47, v56, @"Built bundle record for app");
  unsigned int v61 = [v15 registerBundleRecord:v16 error:0];
  char v48 = [v15 registerChildItemsTrusted];
  if (a9) {
    *a9 = v48;
  }
  if ((_DWORD)v47)
  {
    if (v46 < v61)
    {
      uint64_t v60 = v61;
      _CSStoreWriteToUnit();
    }

    _CSStoreGarbageCollect();
    char v32 = 1;
    goto LABEL_77;
  }

void sub_183F64138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _LSLogStepStart(uint64_t a1, uint64_t a2, NSString *a3, NSString *a4, ...)
{
}

{
  va_list va;
  va_start(va, a4);
  _LSLogStep(1LL, 0LL, a3, @"_LSServerRegisterItemInfo begin", (uint64_t)va);
}

{
  va_list va;
  va_start(va, a4);
  _LSLogStep(a1, 1LL, 1LL, a3, a4, (uint64_t)va);
}

void _LSLogStepFinished(uint64_t a1, uint64_t a2, NSString *a3, NSString *a4, ...)
{
}

{
  va_list va;
  va_start(va, a4);
  _LSLogStep(2LL, a2, a3, @"_LSServerRegisterItemInfo __n128 result = %@", (uint64_t)va);
}

{
  va_list va;
  va_start(va, a4);
  _LSLogStep(a1, 2LL, a2, a3, a4, (uint64_t)va);
}

uint64_t _LSSliceMaskForSliceArray(void *a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v1 = a1;
  int v2 = 0;
  uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v1);
        }
        int v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        int v7 = objc_msgSend(v6, "type", (void)v12);
        if (v7 <= 16777222)
        {
          switch(v7)
          {
            case 7:
              v2 |= 4u;
              break;
            case 12:
              switch([v6 subtype] & 0xFFFFFF)
              {
                case 6LL:
                  v2 |= 0x20u;
                  break;
                case 9LL:
                  v2 |= 0x40u;
                  break;
                case 0xALL:
                  v2 |= 0x200u;
                  break;
                case 0xBLL:
                  v2 |= 0x400u;
                  break;
                case 0xCLL:
                  v2 |= 0x800u;
                  break;
                case 0xFLL:
                  v2 |= 0x1000u;
                  break;
                case 0x10LL:
                  v2 |= 0x2000u;
                  break;
                default:
                  continue;
              }

              break;
            case 18:
              v2 |= 1u;
              break;
          }
        }

        else if (v7 > 16777233)
        {
          if (v7 == 16777234)
          {
            v2 |= 2u;
          }

          else if (v7 == 33554444)
          {
            uint64_t v9 = [v6 subtype] & 0xFFFFFF;
            if ((_DWORD)v9 == 1)
            {
              v2 |= 0xFFFF8000;
            }

            else if (!(_DWORD)v9)
            {
              v2 |= 0x4000u;
            }
          }
        }

        else if (v7 == 16777223)
        {
          uint64_t v10 = [v6 subtype] & 0xFFFFFF;
          if ((_DWORD)v10 == 3)
          {
            v2 |= 8u;
          }

          else if ((_DWORD)v10 == 8)
          {
            v2 |= 0x10u;
          }
        }

        else if (v7 == 16777228)
        {
          uint64_t v8 = [v6 subtype] & 0xFFFFFF;
          if ((_DWORD)v8 == 2)
          {
            v2 |= 0x100u;
          }

          else if (!(_DWORD)v8)
          {
            v2 |= 0x80u;
          }
        }
      }

      uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v3);
  }

  return (unsigned __int16)v2;
}

void sub_183F644E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _LSGetMinimumOSVersionStringAndReferencePlatformForPlatformSDKLinkage( void *a1, uint64_t a2, _OWORD *a3, id *a4, _DWORD *a5)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v8 = a1;
  __int128 v9 = a3[1];
  v20[0] = *a3;
  v20[1] = v9;
  _LSMakeVersionNumber(14LL, 5LL, 0LL, v19);
  if (_LSVersionNumberCompare(v20, v19) == -1)
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v8 objectForKey:@"LSMinimumSystemVersion"];
    __int128 v13 = (void *)v15;
    if (v14 && v15)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        goto LABEL_17;
      }
    }

    else if (v15)
    {
      goto LABEL_17;
    }

    uint64_t v16 = objc_opt_class();
    uint64_t v17 = [v8 objectForKey:@"MinimumOSVersion"];
    __int128 v13 = (void *)v17;
    if (v16 && v17 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      __int128 v13 = 0LL;
    }
  }

  else
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v8 objectForKey:@"MinimumOSVersion"];
    __int128 v12 = (void *)v11;
    if (v10 && v11 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      __int128 v13 = 0LL;
    }

    else
    {
      __int128 v13 = v12;
    }
  }

void sub_183F646D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFDictionary *_LSCreateRegistrationData(uint64_t *a1, void *a2, void *a3, FSNode *a4, const __CFArray **a5)
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  __int128 v9 = a2;
  if (a1 && -[_LSDatabase accessContext](*a1)) {
    _CSStoreAccessContextAssertReading();
  }
  int v10 = v9[3];
  if ((v10 - 203) < 2)
  {
    uint64_t v11 = v9;
    if (a3)
    {
      __int128 v12 = -[FSNode initWithURL:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithURL:flags:error:",  a3,  48LL,  0LL);
      __int128 v13 = (_LSBundleProvider *)v12;
      if (v12)
      {
        if (-[FSNode isDirectory](v12, "isDirectory"))
        {
          CFURLRef cf = (__CFBundle *)-[_LSBundleProvider copyCFBundleWithError:](v13, "copyCFBundleWithError:", 0LL);
          if (cf)
          {
            uint64_t v14 = -[_LSBundleProvider initWithURL:useCacheIfPossible:]( objc_alloc(&OBJC_CLASS____LSBundleProvider),  "initWithURL:useCacheIfPossible:",  a3,  1LL);
            theDict = _LSCreateRegistrationDataForDirectoryNode( (LSContext *)a1,  v11,  (const __CFURL *)v14,  v13,  a4,  a5,  v15);
            if (-[_LSBundleProvider usingCachedItem](v14, "usingCachedItem"))
            {
              _LSRegistrationLog();
              uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)__int128 buf = 138477827;
                BOOL v64 = a3;
                _os_log_impl( &dword_183E58000,  v16,  OS_LOG_TYPE_DEBUG,  "Validating item %{private}@, which used the cache for registration",  buf,  0xCu);
              }

              int v52 = -[_LSBundleProvider initWithURL:useCacheIfPossible:]( objc_alloc(&OBJC_CLASS____LSBundleProvider),  "initWithURL:useCacheIfPossible:",  a3,  0LL);
              int v18 = _LSCreateRegistrationDataForDirectoryNode( (LSContext *)a1,  v11,  (const __CFURL *)v52,  v13,  a4,  a5,  v17);
              v62[0] = MEMORY[0x1895F87A8];
              v62[1] = 3221225472LL;
              v62[2] = ___ZL34_LSCreateRegistrationDataForBundleP9LSContextP18LSRegistrationInfoPK7__CFURLPK14__CFDictionaryPPK9__CFArray_block_invoke;
              v62[3] = &__block_descriptor_40_e13_B24__0_v8_v16l;
              v62[4] = theDict;
              if (CFDictionaryApplyBlock(v18, (uint64_t)v62))
              {
                _LSRegistrationLog();
                uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)__int128 buf = 138739971;
                  BOOL v64 = a3;
                  _os_log_impl( &dword_183E58000,  v19,  OS_LOG_TYPE_INFO,  "REGISTRATION: Successfully registered %{sensitive}@ using the boot cache",  buf,  0xCu);
                }
              }

              if (v18) {
                CFRelease(v18);
              }
            }

            if (theDict)
            {
              uint64_t v20 = (const __CFAllocator *)*MEMORY[0x189604DB0];
              MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, theDict);
              if (softLinkLNIsLinkEnabled)
              {
                int v22 = softLinkLNIsLinkEnabled(cf);
                BOOL v23 = (const void *)*MEMORY[0x189604DE0];
                if (v22) {
                  uint64_t v24 = (const void *)*MEMORY[0x189604DE8];
                }
                else {
                  uint64_t v24 = (const void *)*MEMORY[0x189604DE0];
                }
              }

              else
              {
                BOOL v23 = (const void *)*MEMORY[0x189604DE0];
                uint64_t v24 = (const void *)*MEMORY[0x189604DE0];
              }

              CFDictionaryAddValue(MutableCopy, @"_LSIsLinkEnabled", v24);
              CFRelease(theDict);
              CFRelease(cf);
              if (MutableCopy)
              {
                if (CFDictionaryContainsKey(MutableCopy, @"bundlePersonas")
                  || CFDictionaryContainsKey(MutableCopy, @"_LSUsesSystemPersona"))
                {
                  Copy = CFDictionaryCreateMutableCopy(v20, 0LL, MutableCopy);
                  CFDictionaryRemoveValue(Copy, @"bundlePersonas");
                  CFDictionaryRemoveValue(Copy, @"_LSUsesSystemPersona");
                  CFRelease(MutableCopy);
                  if (!Copy) {
                    goto LABEL_36;
                  }
                }

                else
                {
                  Copy = MutableCopy;
                }

                CFTypeID v34 = (const void *)*MEMORY[0x189604E00];
                if (v34)
                {
                  Value = (void *)CFDictionaryGetValue(Copy, v34);
                  CFTypeID TypeID = CFStringGetTypeID();
                  if (!Value || !TypeID || CFGetTypeID(Value) == TypeID) {
                    goto LABEL_58;
                  }
                }

                else
                {
                  CFStringGetTypeID();
                }

                Value = 0LL;
LABEL_58:
                CFDictionaryRef v37 = Value;
                CFTypeID v38 = CFSetGetTypeID();
                BOOL v39 = (void *)CFDictionaryGetValue((CFDictionaryRef)a4, @"LSPersonaUniqueStrings");
                CFTypeID v40 = v39;
                int v53 = v23;
                if (v39 && CFGetTypeID(v39) == v38)
                {
                  id v41 = v40;
                  [v41 allObjects];
                  BOOL v42 = (void *)objc_claimAutoreleasedReturnValue();
                }

                else
                {
                  +[_LSPersonaDatabase sharedInstance]();
                  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_LSPersonaDatabase personasWithAttributesForBundleIdentifier:](v43, v37);
                  BOOL v42 = (void *)objc_claimAutoreleasedReturnValue();
                  id v41 = v43;
                }

                if ([v42 count])
                {
                  CFDictionaryRef theDicta = v37;
                  _LSRegistrationLog();
                  id v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)__int128 buf = 138543874;
                    BOOL v64 = v42;
                    __int16 v65 = 2114;
                    uint64_t v66 = a3;
                    __int16 v67 = 2114;
                    CFDictionaryRef v68 = v37;
                    _os_log_impl( &dword_183E58000,  v44,  OS_LOG_TYPE_INFO,  "- Got personas %{public}@ for application at %{public}@/%{public}@",  buf,  0x20u);
                  }

                  __int128 v60 = 0u;
                  __int128 v61 = 0u;
                  __int128 v58 = 0u;
                  __int128 v59 = 0u;
                  id v45 = v42;
                  uint64_t v46 = [v45 countByEnumeratingWithState:&v58 objects:buf count:16];
                  CFTypeRef cfa = v42;
                  char v47 = 0;
                  if (v46)
                  {
                    uint64_t v48 = *(void *)v59;
                    do
                    {
                      for (uint64_t i = 0LL; i != v46; ++i)
                      {
                        if (*(void *)v59 != v48) {
                          objc_enumerationMutation(v45);
                        }
                        v47 |= -[_LSPersonaWithAttributes personaType](*(void *)(*((void *)&v58 + 1) + 8 * i)) == 3;
                      }

                      uint64_t v46 = [v45 countByEnumeratingWithState:&v58 objects:buf count:16];
                    }

                    while (v46);
                  }

                  BOOL v42 = (void *)cfa;
                  CFDictionaryRef v37 = theDicta;
                  CFTypeID v50 = CFDictionaryCreateMutableCopy(v20, 0LL, Copy);
                  CFDictionarySetValue(v50, @"bundlePersonas", v45);
                  if ((v47 & 1) != 0) {
                    id v51 = (const void *)*MEMORY[0x189604DE8];
                  }
                  else {
                    id v51 = v53;
                  }
                  CFDictionarySetValue(v50, @"_LSUsesSystemPersona", v51);
                  CFRelease(Copy);
                  Copy = CFDictionaryCreateCopy(v20, v50);
                  CFRelease(v50);
                }

                goto LABEL_36;
              }
            }

            else
            {
              CFRelease(cf);
            }
          }
        }
      }
    }

    else
    {
      _LSRegistrationLog();
      __int128 v13 = (_LSBundleProvider *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( &dword_183E58000,  (os_log_t)v13,  OS_LOG_TYPE_ERROR,  "Unexpected nil bundle URL when registering.",  buf,  2u);
      }
    }

    Copy = 0LL;
LABEL_36:

    goto LABEL_40;
  }

  if (v10 == 205)
  {
    __int128 v25 = v9;
    if (a4)
    {
      CFTypeID v26 = (const void *)*MEMORY[0x189604E00];
      if (*MEMORY[0x189604E00])
      {
        CFTypeID v27 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a4, (const void *)*MEMORY[0x189604E00]);
        CFTypeID v28 = CFStringGetTypeID();
        if (v27 && (!v28 || CFGetTypeID(v27) == v28))
        {
          char v29 = (const UInt8 **)_LSPathForBundleLibraryIdentifier(v27);
          CFURLRef v30 = (const __CFAllocator *)*MEMORY[0x189604DB0];
          Copy = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
          CFDictionarySetValue(Copy, v26, v27);
          char v32 = CFURLCreateFromFileSystemRepresentation(v30, v29[1], *(int *)v29, 1u);
          _LSAddBundleLibraryInfo((LSContext *)a1, v32, 0LL, v25, Copy, 1, 0LL);
          if (v32) {
            CFRelease(v32);
          }
          goto LABEL_39;
        }
      }

      else
      {
        CFStringGetTypeID();
      }
    }

    Copy = 0LL;
LABEL_39:

    goto LABEL_40;
  }

  Copy = 0LL;
LABEL_40:

  return Copy;
}

void sub_183F64E68( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef cf, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t _LSServerItemInfoRegistration( LSContext *a1, void *a2, void *a3, void *a4, const __CFDictionary *a5, unsigned int *a6, uint64_t a7, char *a8, _BYTE *a9)
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  uint64_t v15 = a2;
  id v17 = a3;
  int v18 = v15[3];
  if (v18 == 203 || v18 == 205)
  {
    uint64_t v21 = _LSServerBundleRegistration(a1, v15, v17, a4, a5, a6, v16, a8, a9);
  }

  else
  {
    if (v18 == 204)
    {
      CFTypeID v49 = v15;
      id v19 = v17;
      id v54 = 0LL;
      int v53 = 0;
      CFDictionaryRef theDict = (CFDictionaryRef)a4;
      keys = 0LL;
      char v47 = v19;
      id v20 = 0LL;
      if (!a1)
      {
        uint64_t v48 = 0LL;
        uint64_t v21 = 4294956479LL;
        goto LABEL_73;
      }

      uint64_t v21 = 4294956479LL;
      if (!v19)
      {
        uint64_t v48 = 0LL;
        goto LABEL_73;
      }

      uint64_t v48 = 0LL;
      if (v49[3] != 204)
      {
LABEL_73:

        goto LABEL_74;
      }

      int v22 = a1->db;
      if (!v22)
      {
        id v20 = 0LL;
        uint64_t v48 = 0LL;
        goto LABEL_73;
      }

      uint64_t v48 = v22;
      if (!v22->store)
      {
        id v20 = 0LL;
        goto LABEL_73;
      }

      id v50 = 0LL;
      id v20 = -[FSNode initByResolvingBookmarkData:relativeToNode:bookmarkDataIsStale:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initByResolvingBookmarkData:relativeToNode:bookmarkDataIsStale:error:",  v47,  0LL,  0LL,  &v50);
      id v23 = v50;
      uint64_t v24 = v23;
      if (v20)
      {
      }

      else
      {
        uint64_t v21 = _LSGetOSStatusFromNSError(v23);

        if ((_DWORD)v21) {
          goto LABEL_71;
        }
      }

      [v20 URL];
      __int128 v25 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      string = CFURLCopyFileSystemPath(v25, kCFURLPOSIXPathStyle);

      if (!string)
      {
        uint64_t v21 = 0LL;
        if (!a5) {
          goto LABEL_73;
        }
        goto LABEL_72;
      }

      if (!theDict)
      {
LABEL_29:
        if (a5)
        {
          CFRetain(a5);
        }

        else
        {
          if (!keys) {
            goto LABEL_62;
          }
          *(void *)&__int128 buffer = 0LL;
          *((void *)&buffer + 1) = &buffer;
          uint64_t v57 = 0x3812000000LL;
          __int128 v58 = __Block_byref_object_copy__407;
          __int128 v59 = __Block_byref_object_dispose__408;
          __int128 v60 = "";
          CFTypeRef cf = 0LL;
          v55[0] = MEMORY[0x1895F87A8];
          v55[1] = 3221225472LL;
          v55[2] = ___ZL31createInstallationDictForPluginPK10__CFString_block_invoke;
          v55[3] = &unk_189D78638;
          v55[4] = &buffer;
          v55[5] = keys;
          softLinkMobileInstallationEnumerateAllInstalledItemDictionaries(0LL, v55);
          CFTypeID v38 = *(const void **)(*((void *)&buffer + 1) + 48LL);
          if (v38) {
            a5 = (const __CFDictionary *)CFRetain(v38);
          }
          else {
            a5 = 0LL;
          }
          _Block_object_dispose(&buffer, 8);
          if (cf) {
            CFRelease(cf);
          }
          if (!a5)
          {
LABEL_62:
            _LSRegistrationLog();
            BOOL v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buffer) = 138412290;
              *(void *)((char *)&buffer + 4) = keys;
              _os_log_impl( &dword_183E58000,  v42,  OS_LOG_TYPE_ERROR,  "Cannot register app extension %@ without MobileInstallation data. Installation dictionary was NULL",  (uint8_t *)&buffer,  0xCu);
            }

            char v32 = 0LL;
            CFDictionaryRef v37 = 0LL;
            id v45 = 0LL;
            a5 = 0LL;
            uint64_t v21 = 4294956479LL;
            goto LABEL_65;
          }
        }

        if (theDict && keys)
        {
          id v45 = CFDictionaryCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const void **)&keys,  (const void **)&theDict,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
        }

        else
        {
          if (CFStringGetFileSystemRepresentation(string, (char *)&buffer, 1024LL))
          {
            _LSDefaultLog();
            CFTypeID v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              _LSServerItemInfoRegistration_cold_1((uint64_t)&buffer, v28);
            }
          }

          id v45 = 0LL;
        }

        uint64_t v29 = _LSGetPlugin((uint64_t)v48, v49[7]);
        if (v29)
        {
          uint64_t v30 = v49[7];
          int v44 = *(_DWORD *)(v29 + 216);
          int v53 = v44;
          _LSUnregisterBundle((void **)&a1->db, v30, 0x20000000LL);
          [v20 URL];
          unsigned int v31 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
          char v32 = (const __CFArray *)_LSCopyPluginsWithURL((uint64_t)a1, v31);

          if (v32)
          {
            CFIndex Count = CFArrayGetCount(v32);
            if (Count >= 1)
            {
              for (CFIndex i = 0LL; i != Count; ++i)
              {
                ValueAtIndex = (void *)CFArrayGetValueAtIndex(v32, i);
                CFTypeID TypeID = CFNumberGetTypeID();
                if (ValueAtIndex && (!TypeID || CFGetTypeID(ValueAtIndex) == TypeID)) {
                  _LSUnregisterBundle( (void **)&a1->db,  [ValueAtIndex unsignedLongLongValue],  0x20000000);
                }
              }
            }

            CFRelease(v32);
            CFDictionaryRef v37 = 0LL;
            char v32 = 0LL;
          }

          else
          {
            CFDictionaryRef v37 = 0LL;
          }

          int v41 = v44;
        }

        else
        {
          CFRange v39 = CFStringFind(string, @".app/", 4uLL);
          if (v39.location == -1)
          {
            int v41 = 0;
            CFDictionaryRef v37 = 0LL;
            char v32 = 0LL;
          }

          else
          {
            v63.length = v39.location + v39.length;
            CFTypeID v40 = (const __CFAllocator *)*MEMORY[0x189604DB0];
            v63.location = 0LL;
            CFDictionaryRef v37 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x189604DB0], string, v63);
            char v32 = CFURLCreateWithFileSystemPath(v40, v37, kCFURLPOSIXPathStyle, 1u);
            FSNodeCreateWithURL((uint64_t)v32, 0LL, &v54);
            _LSBundleFindWithNode(a1, v54, &v53, 0LL);
            int v41 = v53;
          }
        }

        uint64_t v21 = _LSRegisterPlugins(v48, v49[6], v41, v45, a5, 0);
LABEL_65:
        CFRelease(string);
        if (v32) {
          CFRelease(v32);
        }
        if (v37) {
          CFRelease(v37);
        }
        if (v45) {
          CFRelease(v45);
        }
LABEL_71:
        if (a5)
        {
LABEL_72:
          CFRelease(a5);
          goto LABEL_73;
        }

        goto LABEL_73;
      }

      if (*MEMORY[0x189604E00])
      {
        Value = (void *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x189604E00]);
        CFTypeID v27 = CFStringGetTypeID();
        if (!Value || !v27 || CFGetTypeID(Value) == v27) {
          goto LABEL_28;
        }
      }

      else
      {
        CFStringGetTypeID();
      }

      Value = 0LL;
LABEL_28:
      keys = Value;
      goto LABEL_29;
    }

    uint64_t v21 = 4294967246LL;
  }

void sub_183F655B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, CFTypeRef cf)
{
  _Unwind_Resume(a1);
}

void getLibIDs(void)
{
  if ((v0 & 1) == 0)
  {
    {
      getLibIDs(void)::klibIDs = (uint64_t)@"com.apple.system-library";
      unk_18C670EC0 = @"com.apple.local-library";
      qword_18C670EC8 = (uint64_t)@"com.apple.network-library";
      unk_18C670ED0 = @"com.apple.user-library";
      qword_18C670ED8 = (uint64_t)@"com.apple.apple-internal-library";
    }
  }

uint64_t ___ZL48_LSGetLibraryBundleIdentifierAndItemIndexForNodeP9LSContextP6FSNodePl_block_invoke( uint64_t result, unsigned int a2, int a3, _BYTE *a4)
{
  if (*(_DWORD *)(result + 40) == a3)
  {
    **(void **)(result + 32) = a2;
    *a4 = 1;
  }

  return result;
}

void ___ZL23getNeedsRegistrationLogv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.launchservices", "needs-reg");
  id v1 = (void *)getNeedsRegistrationLog(void)::result;
  getNeedsRegistrationLog(void)::__n128 result = (uint64_t)v0;
}

uint64_t _LSServerCreateBundleDataAndRegister( LSContext *a1, LSRegistrationInfo *a2, NSData *a3, const __CFURL *a4, FSNode *a5, unsigned int *a6, const __CFArray **a7, unsigned __int8 *a8)
{
  uint64_t v15 = a2;
  uint64_t v16 = a3;
  kdebug_trace();
  id v17 = _LSCreateRegistrationData((uint64_t *)a1, v15, a4, a5, a7);
  kdebug_trace();
  kdebug_trace();
  uint64_t v19 = _LSServerItemInfoRegistration(a1, v15, v16, v17, (const __CFDictionary *)a5, a6, v18, 0LL, a8);
  uint64_t v20 = v19;
  if (a1 && !(_DWORD)v19) {
    _LSDatabaseCommit((uint64_t)a1->db);
  }
  kdebug_trace();

  return v20;
}

void sub_183F65888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL23_LSRegisterDocumentTypeP11_LSDatabasejPK12LSBundleDataPK14__CFDictionaryP12NSDictionaryIP8NSStringPS7_IS9_S9_EEjP19LSBindingListBuffer_block_invoke( uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  if ((a3 & 3) == 0 && (a3 & 0xFFFFFFFC) != 0)
  {
    uint64_t v5 = result;
    int v6 = *(_DWORD **)(result + 32);
    int v7 = *(unsigned int **)(result + 48);
    unsigned int v8 = v6[58];
    uint64_t v9 = _UTTypeGet();
    __n128 result = _LSBindingListBufferAppend(v6, v7, v8, *(_DWORD *)(v9 + 12));
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(void *)(*(void *)(v5 + 40) + 8LL) + 24LL) = 0;
      *a4 = 1;
    }
  }

  return result;
}

uint64_t ___ZL31_LSServerRegisterExtensionPointP11_LSDatabasejPK10__CFStringjPK14__CFDictionaryPK7__CFURL_block_invoke( uint64_t result, uint64_t a2, _DWORD *a3)
{
  if (a3)
  {
    uint64_t v3 = result;
    if (a3[43] == *(_DWORD *)(result + 60) && a3[5] == *(_DWORD *)(result + 100))
    {
      int v5 = a3[44];
      if (v5 != *(_DWORD *)(result + 132))
      {
        if (v5)
        {
          int v7 = *(void **)(*(void *)(*(void *)(result + 40) + 8LL) + 40LL);
          objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
          unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
          [MEMORY[0x189607968] numberWithUnsignedInt:a2];
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
          [v7 setObject:v8 forKey:v9];
        }

        int v10 = *(void **)(*(void *)(*(void *)(v3 + 48) + 8LL) + 40LL);
        [MEMORY[0x189607968] numberWithUnsignedInt:a2];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 addObject:v11];

        _CSStringRetain();
        return _CSStoreWriteToUnit();
      }
    }
  }

  return result;
}

void sub_183F65A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL31_LSServerRegisterExtensionPointP11_LSDatabasejPK10__CFStringjPK14__CFDictionaryPK7__CFURL_block_invoke_2( uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  int v6 = *(void **)(a1 + 32);
  int v7 = [v8 intValue];
  [v5 intValue];
  _LSBindableDeactivate(v6, v7);
  [v5 intValue];
  _CSStringRelease();
}

void sub_183F65B4C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZL25_LSPluginRegisterWithInfoP11_LSDatabasePK14__CFDictionaryS3_hPS1_jj_block_invoke( uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (_NSIsNSString()
    && ([v6 hasPrefix:@"DT"] & 1) == 0
    && ([v6 isEqual:@"_LSLocalizedStringsDictionary"] & 1) == 0
    && ([v6 isEqual:@"_LSSliceInfosKey"] & 1) == 0)
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

void sub_183F65BFC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZL25_LSPluginRegisterWithInfoP11_LSDatabasePK14__CFDictionaryS3_hPS1_jj_block_invoke_2( uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v8 = a3;
  id v6 = (void *)objc_opt_class();
  int v7 = (void *)objc_opt_class();
  if ((_LSIsDictionaryWithKeysAndValuesOfClass(v8, v6, v7) & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

void sub_183F65C90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void _LSPluginRegistration_CFDictionaryApplier(const __CFString *a1, CFDictionaryRef theDict, char *a3)
{
  unsigned int v8 = 0;
  if (!theDict)
  {
    CFDictionaryGetTypeID();
LABEL_7:
    Value = 0LL;
    goto LABEL_8;
  }

  Value = (__CFString *)CFDictionaryGetValue(theDict, @"NSExtensionAttributes");
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (Value && TypeID && CFGetTypeID(Value) != TypeID) {
    goto LABEL_7;
  }
LABEL_8:
  int v7 = _LSRegisterPlugin( *(_LSDatabase **)a3,  (const LSPluginInfo *)(a3 + 8),  Value,  a1,  *((const __CFString **)a3 + 25),  *((const __CFDictionary **)a3 + 26),  *((_DWORD *)a3 + 54),  &v8);
  if (v7 || !v8)
  {
    if (v7 == -10651) {
      return;
    }
  }

  else if (!a3[220])
  {
    LSPluginAddInfoToPayloadDict(*(void **)a3, *((__CFDictionary **)a3 + 28), v8, 1LL, 1);
    return;
  }

  *((_DWORD *)a3 + 5_Block_object_dispose((const void *)(v2 - 112), 8) = v7;
}

void LSRegisterPluginState::~LSRegisterPluginState(id *this)
{
}

uint64_t _LSRegisterPlugin( _LSDatabase *a1, const LSPluginInfo *a2, __CFString *a3, const __CFString *a4, const __CFString *a5, const __CFDictionary *a6, int a7, unsigned int *a8)
{
  CFTypeID v75 = a8;
  uint64_t v109 = *MEMORY[0x1895F89C0];
  __int128 v13 = a1;
  __int128 v104 = 0u;
  memset(v105, 0, sizeof(v105));
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  memset(v99, 0, sizeof(v99));
  __int128 v97 = kLSVersionNumberNull;
  __int128 v98 = *(_OWORD *)algn_183FBF5B0;
  uint64_t v88 = 0LL;
  unsigned int v77 = *((_DWORD *)a2 + 1);
  int v78 = *(_DWORD *)a2;
  int v87 = 0;
  uint64_t v86 = 0LL;
  if (!a6 || (v76 = a5, a3) && (CFTypeID v14 = CFGetTypeID(a3), v14 != CFDictionaryGetTypeID()))
  {
    BOOL v42 = 0LL;
    uint64_t v28 = 4294967246LL;
    goto LABEL_118;
  }

  Value = (const __CFString *)CFDictionaryGetValue(a6, @"NSExtensionPointIdentifier");
  CFTypeID TypeID = CFStringGetTypeID();
  if (Value && TypeID && CFGetTypeID(Value) != TypeID) {
    Value = 0LL;
  }
  if (a3)
  {
    if (!CFDictionaryContainsKey((CFDictionaryRef)a3, @"NSExtensionPointName")
      || (id v17 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a3, @"NSExtensionPointName"),
          CFTypeID v18 = CFStringGetTypeID(),
          v17)
      && v18
      && CFGetTypeID(v17) != v18)
    {
      id v17 = 0LL;
    }

    if (!CFDictionaryContainsKey((CFDictionaryRef)a3, @"NSExtensionIdentifier")
      || (uint64_t v19 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a3, @"NSExtensionIdentifier"),
          CFTypeID v20 = CFStringGetTypeID(),
          v19)
      && v20
      && CFGetTypeID(v19) != v20)
    {
      uint64_t v19 = 0LL;
    }

    if (!CFDictionaryContainsKey((CFDictionaryRef)a3, @"NSExtensionVersion")
      || (uint64_t v21 = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)a3, @"NSExtensionVersion"),
          CFTypeID v22 = CFStringGetTypeID(),
          v21)
      && v22
      && CFGetTypeID(v21) != v22)
    {
      uint64_t v21 = 0LL;
    }

    if (!CFDictionaryContainsKey((CFDictionaryRef)a3, @"NSExtensionPointVersion")
      || (a3 = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)a3, @"NSExtensionPointVersion"),
          CFTypeID v23 = CFStringGetTypeID(),
          a3)
      && v23
      && CFGetTypeID(a3) != v23)
    {
      a3 = 0LL;
    }
  }

  else
  {
    id v17 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v19 = 0LL;
  }

  if (!v19) {
    uint64_t v19 = a4;
  }
  _LSBundleGet(v13, a7);
  uint64_t v24 = (void *)*((void *)a2 + 3);
  id v85 = 0LL;
  unsigned int v25 = _LSAliasAddURL(v13, v24, &v85);
  id v26 = v85;
  CFTypeID v27 = v26;
  if (v25)
  {
  }

  else
  {
    uint64_t v28 = _LSGetOSStatusFromNSError(v26);

    if ((_DWORD)v28) {
      goto LABEL_93;
    }
  }

  *(void *)&v99[0] = __PAIR64__(*((_DWORD *)a2 + 44), v25);
  if (([(id)__LSDefaultsGetSharedInstance() isInEducationMode] & 1) == 0)
  {
    uint64_t v29 = (void *)*((void *)a2 + 4);
    if (v29)
    {
      id v84 = 0LL;
      int v30 = _LSAliasAddURL(v13, v29, &v84);
      id v31 = v84;
      char v32 = v31;
      LODWORD(v100) = v30;
      if (v30)
      {

        goto LABEL_39;
      }

      uint64_t v28 = _LSGetOSStatusFromNSError(v31);

      if ((_DWORD)v28)
      {
LABEL_93:
        BOOL v42 = 0LL;
        goto LABEL_118;
      }
    }
  }

void sub_183F66B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void LSPluginInfo::~LSPluginInfo(id *this)
{
}

void ___ZL61_LSFindExistingRegisteredBundleWithContainerMatchingAliasDataP11_LSDatabasejP6NSDataPj_block_invoke( uint64_t a1, int a2, int *a3, uint64_t a4, _BYTE *a5)
{
  if (a3)
  {
    if (a3[76] == *(_DWORD *)(a1 + 64))
    {
      int v9 = *(_DWORD *)(a1 + 68);
      if (!v9 || v9 == a3[1])
      {
        _LSAliasGet(*(void **)(a1 + 32), *a3);
        int v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          id v17 = v10;
          int v11 = +[FSNode compareBookmarkData:toBookmarkData:]( &OBJC_CLASS___FSNode,  "compareBookmarkData:toBookmarkData:",  *(void *)(a1 + 40),  v10);
          int v10 = v17;
          if (!v11)
          {
LABEL_12:
            uint64_t v16 = *(_DWORD **)(a1 + 56);
            if (v16) {
              *uint64_t v16 = a2;
            }
            *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a3;
            *a5 = 1;
            goto LABEL_17;
          }

          if (v11 == 2)
          {
            +[FSNode pathForBookmarkData:error:]( &OBJC_CLASS___FSNode,  "pathForBookmarkData:error:",  *(void *)(a1 + 40),  0LL);
            __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
            +[FSNode pathForBookmarkData:error:](&OBJC_CLASS___FSNode, "pathForBookmarkData:error:", v17, 0LL);
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
            CFTypeID v14 = v13;
            if (*(_DWORD *)(a1 + 68) == a3[1] && v12 && v13)
            {
              char v15 = [v12 isEqualToString:v13];

              int v10 = v17;
              if ((v15 & 1) != 0) {
                goto LABEL_12;
              }
            }

            else
            {

              int v10 = v17;
            }
          }
        }

void sub_183F66E24( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _LSLogStep(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  id v13 = a4;
  id v11 = a5;
  if (v11) {
    __int128 v12 = (void *)[objc_alloc(NSString) initWithFormat:v11 arguments:a6];
  }
  else {
    __int128 v12 = 0LL;
  }
  [(id)getAITransactionLogClass() logStep:a1 byParty:5 phase:a2 success:a3 forBundleID:v13 description:v12];
}

{
  id v11;
  void *v12;
  id v13;
  id v13 = a4;
  id v11 = a5;
  if (v11) {
    __int128 v12 = (void *)[objc_alloc(NSString) initWithFormat:v11 arguments:a6];
  }
  else {
    __int128 v12 = 0LL;
  }
  [(id)getAITransactionLogClass() logStep:a1 byParty:5 phase:a2 success:a3 forBundleID:v13 description:v12];
}

void sub_183F66F0C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

Class initAITransactionLog(void)
{
  if (!MobileInstallationLibrary(void)::frameworkLibrary) {
    MobileInstallationLibrary(void)::frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/MobileInstallation. framework/MobileInstallation",  2);
  }
  Class result = objc_getClass("AITransactionLog");
  classAITransactionLog = (uint64_t)result;
  getAITransactionLogClass = (uint64_t (*)(void))AITransactionLogFunction;
  return result;
}

{
  Class result;
  if (!MobileInstallationLibrary(void)::frameworkLibrary) {
    MobileInstallationLibrary(void)::frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/MobileInstallation. framework/MobileInstallation",  2);
  }
  Class result = objc_getClass("AITransactionLog");
  classAITransactionLog = (uint64_t)result;
  getAITransactionLogClass = (uint64_t (*)(void))AITransactionLogFunction;
  return result;
}

{
  Class result;
  if (!MobileInstallationLibrary(void)::frameworkLibrary) {
    MobileInstallationLibrary(void)::frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/MobileInstallation. framework/MobileInstallation",  2);
  }
  Class result = objc_getClass("AITransactionLog");
  classAITransactionLog = (uint64_t)result;
  getAITransactionLogClass = (uint64_t (*)(void))AITransactionLogFunction;
  return result;
}

id AITransactionLogFunction(void)
{
  return (id)classAITransactionLog;
}

{
  return (id)classAITransactionLog;
}

{
  return (id)classAITransactionLog;
}

__CFDictionary *_LSCreateRegistrationDataForDirectoryNode( LSContext *a1, LSRegistrationInfo *a2, const __CFURL *a3, _LSBundleProvider *a4, FSNode *a5, const __CFArray **a6, const __CFArray **a7)
{
  uint64_t v196 = *MEMORY[0x1895F89C0];
  __int128 v170 = a2;
  int v9 = a3;
  v176 = a4;
  __int128 v171 = v9;
  -[__CFURL infoDictionary](v9, "infoDictionary");
  int v10 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
  CFMutableDictionaryRef Mutable = copyDeepMutableDictionary(v10);

  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  }
  CFDictionaryRef theDict = Mutable;
  if (!CFDictionaryGetCount(Mutable)) {
    CFDictionaryAddValue(Mutable, @"_LSInfoPlistIsMissing", (const void *)*MEMORY[0x189604DE8]);
  }
  CFDictionaryRemoveValue(Mutable, @"LSIsSecuredSystemContent");
  __int128 v12 = v176;
  if (a5
    && (Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a5, @"BundleContainer"),
        CFTypeID TypeID = CFStringGetTypeID(),
        Value)
    && (!TypeID || CFGetTypeID(Value) == TypeID))
  {
    char v15 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x189604DB0], Value, kCFURLPOSIXPathStyle, 1u);
    uint64_t v16 = (const __CFDictionary *)_LSCopyiTunesMetadataDictionaryForAppContainerURL(v15);
    if (v15) {
      CFRelease(v15);
    }

    if (v16)
    {
      _LSPromoteiTunesMetadataKeys(v16, theDict);
      CFRelease(v16);
    }
  }

  else
  {
  }

  id v17 = (void *)MEMORY[0x186E2A59C]();
  CFTypeID v18 = (const void *)[MEMORY[0x189607968] numberWithUnsignedChar:_LSGetDirectoryClassForNode(v12)];
  CFDictionaryAddValue(theDict, @"_LSDirectoryClass", v18);
  objc_autoreleasePoolPop(v17);
  uint64_t v19 = v171;
  CFTypeID v20 = *(const void **)-[_LSBundleProvider provider](v19, "provider");
  if (v20)
  {
    uint64_t v21 = (const __CFURL *)CFRetain(v20);
    CFTypeID v22 = v21;
    if (v21)
    {
      CFStringRef v24 = CFURLCopyFileSystemPath(v21, kCFURLPOSIXPathStyle);
      if (v24)
      {
        _LSPathifyIconKey(v19, theDict, (const __CFString *)*MEMORY[0x189604AB0], v23);
        _LSPathifyIconKeysInPlistKey( v19,  theDict,  (const __CFString *)*MEMORY[0x189604AA8],  (const __CFString *)*MEMORY[0x189604AE0],  v25);
        _LSPathifyIconKeysInPlistKey( v19,  theDict,  (const __CFString *)*MEMORY[0x189604B10],  (const __CFString *)*MEMORY[0x189604AF8],  v26);
        _LSPathifyIconKeysInPlistKey(v19, theDict, @"UTExportedTypeDeclarations", @"UTTypeIconFile", v27);
        _LSPathifyIconKeysInPlistKey(v19, theDict, @"UTImportedTypeDeclarations", @"UTTypeIconFile", v28);
        CFRelease(v24);
      }

      CFRelease(v22);
    }
  }

  v181 = v12;
  uint64_t v29 = (const void *)*MEMORY[0x189604AB8];
  if (theDict) {
    BOOL v30 = v29 == 0LL;
  }
  else {
    BOOL v30 = 1;
  }
  char v31 = !v30;
  if (v30)
  {
    CFStringGetTypeID();
  }

  else
  {
    char v32 = (const __CFString *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x189604AB8]);
    CFTypeID v33 = CFStringGetTypeID();
    if (!v32 || !v33 || CFGetTypeID(v32) == v33) {
      goto LABEL_34;
    }
  }

  char v32 = 0LL;
LABEL_34:
  unsigned int v34 = _LSGetRawOSTypeForPossibleString(v32);
  int v35 = (const void *)*MEMORY[0x189604AD0];
  if (theDict) {
    BOOL v36 = v35 == 0LL;
  }
  else {
    BOOL v36 = 1;
  }
  char v37 = !v36;
  char v182 = v37;
  if (v36)
  {
    CFStringGetTypeID();
LABEL_46:
    CFTypeID v38 = 0LL;
    goto LABEL_47;
  }

  CFTypeID v38 = (const __CFString *)CFDictionaryGetValue(theDict, v35);
  CFTypeID v39 = CFStringGetTypeID();
  if (v38 && v39 && CFGetTypeID(v38) != v39) {
    goto LABEL_46;
  }
LABEL_47:
  unsigned int v40 = _LSGetRawOSTypeForPossibleString(v38);
  if ((-[_LSBundleProvider getHFSType:creator:error:](v181, "getHFSType:creator:error:", buf, &v190, 0LL) & 1) == 0) {
    goto LABEL_102;
  }
  int v41 = -[_LSBundleProvider isDirectory](v181, "isDirectory");
  if (*(_DWORD *)buf != v34)
  {
    if ((v31 & 1) != 0)
    {
      BOOL v42 = (const __CFString *)CFDictionaryGetValue(theDict, v29);
      CFTypeID v43 = CFStringGetTypeID();
      if (!v42 || !v43 || CFGetTypeID(v42) == v43)
      {
LABEL_56:
        if (!gLogRegistrationErrors)
        {
LABEL_71:
          if (*(_DWORD *)buf)
          {
            CFStringRef v54 = _LSCopyStringForOSType(*(unsigned int *)buf);
            if (v54)
            {
              CFDictionarySetValue(theDict, v29, v54);
              CFRelease(v54);
            }
          }

          else
          {
            CFDictionaryRemoveValue(theDict, v29);
          }

          goto LABEL_75;
        }

        CFStringRef v44 = _LSCopyStringForOSType(*(unsigned int *)buf);
        id v45 = (__CFString *)v44;
        if (v42)
        {
          CFStringRef v46 = _LSCopyStringForOSType(v34);
          char v47 = (__CFString *)v46;
          id v48 = (const __CFAllocator *)*MEMORY[0x189604DB0];
          uint64_t v49 = "file";
          if (v41) {
            uint64_t v49 = "PkgInfo";
          }
          uint64_t v50 = (__CFString *)CFStringCreateWithFormat( v48,  0LL,  @"Type mismatch: %s type = '%@', plist CFBundlePackageType = '%@'",  v49,  v45,  v46);

          if (!v50) {
            goto LABEL_66;
          }
        }

        else
        {
          id v48 = (const __CFAllocator *)*MEMORY[0x189604DB0];
          id v51 = "file";
          if (v41) {
            id v51 = "PkgInfo";
          }
          uint64_t v50 = (__CFString *)CFStringCreateWithFormat( v48,  0LL,  @"Type mismatch: %s type = '%@', plist CFBundlePackageType is missing",  v51,  v44);
          if (!v50) {
            goto LABEL_66;
          }
        }

        _LSRegistrationWarning(v181, v50);
        CFRelease(v50);
LABEL_66:
        if (v42)
        {
          if (CFStringGetLength(v42) != 4)
          {
            CFIndex Length = CFStringGetLength(v42);
            int v53 = (__CFString *)CFStringCreateWithFormat( v48,  0LL,  @"Value for CFBundlePackageType key has incorrect length %ld (should be 4)",  Length);
            if (v53)
            {
              _LSRegistrationWarning(v181, v53);
              CFRelease(v53);
            }
          }
        }

        goto LABEL_71;
      }
    }

    else
    {
      CFStringGetTypeID();
    }

    BOOL v42 = 0LL;
    goto LABEL_56;
  }

LABEL_75:
  if ((_DWORD)v190 == v40) {
    goto LABEL_102;
  }
  if ((v182 & 1) == 0)
  {
    CFStringGetTypeID();
LABEL_82:
    id v55 = 0LL;
    goto LABEL_83;
  }

  id v55 = (const __CFString *)CFDictionaryGetValue(theDict, v35);
  CFTypeID v56 = CFStringGetTypeID();
  if (v55 && v56 && CFGetTypeID(v55) != v56) {
    goto LABEL_82;
  }
LABEL_83:
  if (gLogRegistrationErrors)
  {
    CFStringRef v57 = _LSCopyStringForOSType(v190);
    __int128 v58 = (__CFString *)v57;
    if (v55)
    {
      CFStringRef v59 = _LSCopyStringForOSType(v40);
      __int128 v60 = (__CFString *)v59;
      __int128 v61 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      uint64_t v62 = "file";
      if (v41) {
        uint64_t v62 = "PkgInfo";
      }
      CFRange v63 = (__CFString *)CFStringCreateWithFormat( v61,  0LL,  @"Signature mismatch: %s signature = '%@', plist CFBundleSignature = '%@'",  v62,  v58,  v59);

      if (!v63) {
        goto LABEL_93;
      }
    }

    else
    {
      __int128 v61 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      int v64 = "file";
      if (v41) {
        int v64 = "PkgInfo";
      }
      CFRange v63 = (__CFString *)CFStringCreateWithFormat( v61,  0LL,  @"Signature mismatch: %s signature = '%@', plist CFBundleSignature is missing",  v64,  v57);
      if (!v63) {
        goto LABEL_93;
      }
    }

    _LSRegistrationWarning(v181, v63);
    CFRelease(v63);
LABEL_93:
    if (v55)
    {
      if (CFStringGetLength(v55) != 4)
      {
        CFIndex v65 = CFStringGetLength(v55);
        uint64_t v66 = (__CFString *)CFStringCreateWithFormat( v61,  0LL,  @"Value for CFBundleSignature key has incorrect length %ld (should be 4)",  v65);
        if (v66)
        {
          _LSRegistrationWarning(v181, v66);
          CFRelease(v66);
        }
      }
    }
  }

  if ((_DWORD)v190)
  {
    CFStringRef v67 = _LSCopyStringForOSType(v190);
    if (v67)
    {
      CFDictionarySetValue(theDict, v35, v67);
      CFRelease(v67);
    }
  }

  else
  {
    CFDictionaryRemoveValue(theDict, v35);
  }

LABEL_102:
  CFDictionaryRef v68 = v19;
  v180 = v170;
  v183 = v68;
  uint64_t v69 = *(const void **)-[_LSBundleProvider provider](v68, "provider");
  if (v69)
  {
    CFTypeRef v70 = CFRetain(v69);
    if (v70)
    {
      if (a5)
      {
        int v71 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a5, @"IsPlaceholder");
        CFTypeID v72 = CFBooleanGetTypeID();
        if (v71)
        {
          if (!v72 || CFGetTypeID(v71) == v72)
          {
            if (CFBooleanGetValue(v71))
            {
              _LSRegistrationLog();
              uint64_t v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)__int128 buf = 138477827;
                *(void *)&uint8_t buf[4] = v70;
                _os_log_impl( &dword_183E58000,  v73,  OS_LOG_TYPE_DEBUG,  "bundle at %{private}@ is a placeholder; skipping executable lookup",
                  buf,
                  0xCu);
              }

LABEL_111:
LABEL_155:
              CFRelease(v70);
              goto LABEL_156;
            }
          }
        }
      }

      id v74 = LSBundleProvider::CFBundleCopyExecutableURL((LSBundleProvider *)-[_LSBundleProvider provider]( v183,  "provider"));
      if (!v74)
      {
        _LSRegistrationLog();
        uint64_t v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 buf = 138477827;
          *(void *)&uint8_t buf[4] = v70;
          _os_log_impl( &dword_183E58000,  v73,  OS_LOG_TYPE_ERROR,  "Failed to register bundle %{private}@ because no satisfactory executable could be found.",  buf,  0xCu);
        }

        goto LABEL_111;
      }

      if (theDict && *MEMORY[0x189604DF8])
      {
        CFTypeID v75 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x189604DF8]);
        CFTypeID v76 = CFStringGetTypeID();
        if (v75 && (!v76 || CFGetTypeID(v75) == v76))
        {
          CFStringRef PathComponent = CFURLCopyLastPathComponent(v74);
          CFStringRef v78 = PathComponent;
          if (PathComponent)
          {
            if (CFEqual(PathComponent, v75) || (uint64_t v79 = _CFBundleCopyExecutableURLInDirectory()) == 0) {
              uint64_t v79 = (uint64_t)v74;
            }
            else {
              CFRelease(v74);
            }
            id v74 = (__CFBundle *)v79;
            CFRelease(v78);
          }
        }
      }

      else
      {
        CFStringGetTypeID();
      }

      __int128 v80 = CFURLCopyAbsoluteURL((CFURLRef)v70);
      __int128 v81 = CFURLCopyFileSystemPath(v80, kCFURLPOSIXPathStyle);
      __int128 v82 = CFURLCopyAbsoluteURL(v74);
      if (v80) {
        CFRelease(v80);
      }
      __int128 v83 = CFURLCopyFileSystemPath(v82, kCFURLPOSIXPathStyle);
      id v84 = v83;
      if (v81)
      {
        if (v83)
        {
          CFStringRef v85 = _LSCopyPathRelativeToBase(v83, v81);
          if (v85) {
            CFDictionaryAddValue(theDict, @"_LSExecutablePath", v85);
          }
          uint64_t v86 = -[FSNode initWithURL:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithURL:flags:error:",  v74,  1LL,  0LL);
          int v87 = v86;
          if (v86)
          {
            if (-[FSNode isResolvable](v86, "isResolvable"))
            {
              -[FSNode resolvedNodeWithFlags:error:](v87, "resolvedNodeWithFlags:error:", 0LL, 0LL);
              uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v89 = v88;
              if (v88)
              {
                __int128 v90 = v88;

                int v87 = v90;
              }
            }

            _LSAddExecutableFormatInfo();
            if (!-[FSNode getInodeNumber:error:](v87, "getInodeNumber:error:", &v180->inoExec, 0LL))
            {
              _LSRegistrationLog();
              __int128 v91 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__int128 buf = 138739971;
                *(void *)&uint8_t buf[4] = v87;
                _os_log_impl( &dword_183E58000,  v91,  OS_LOG_TYPE_ERROR,  "Unable to get iNode for executable %{sensitive}@",  buf,  0xCu);
              }
            }

            if (!-[FSNode getContentModificationDate:error:]( v87,  "getContentModificationDate:error:",  &v180->executableModDate,  0LL))
            {
              _LSRegistrationLog();
              CFIndex v92 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__int128 buf = 138739971;
                *(void *)&uint8_t buf[4] = v87;
                _os_log_impl( &dword_183E58000,  v92,  OS_LOG_TYPE_ERROR,  "Unable to get modification date for bundle executable, %{sensitive}@",  buf,  0xCu);
              }
            }
          }

          if (v85) {
            CFRelease(v85);
          }
          CFRelease(v84);
        }

        id v84 = v81;
      }

      else if (!v83)
      {
        goto LABEL_152;
      }

      CFRelease(v84);
LABEL_152:
      if (v82) {
        CFRelease(v82);
      }
      CFRelease(v74);
      goto LABEL_155;
    }
  }

LABEL_156:
  -[_LSBundleProvider URL](v181, "URL");
  CFIndex v93 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v94 = v93;
  if (softLink_GSIsDocumentRevision)
  {
    BOOL v95 = softLink_GSIsDocumentRevision(v93) == 0;

    if (!v95) {
      CFDictionaryAddValue(theDict, @"_LSBundleIsInGenerationalStorage", (const void *)*MEMORY[0x189604DE8]);
    }
  }

  else
  {
  }

  LSBundleProvider::intentURLPaths((LSBundleProvider *)-[_LSBundleProvider provider](v183, "provider"));
  id v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (v96) {
    CFDictionaryAddValue(theDict, @"_LSIntentDefinitionURLs", v96);
  }

  __int128 v97 = LSBundleProvider::XCFBundleCopyFolderURL( (LSBundleProvider *)-[_LSBundleProvider provider](v183, "provider"),  @"Library/");
  if (v97)
  {
    _LSAddBundleLibraryInfo(a1, v97, v183, v180, theDict, 0, a6);
    CFRelease(v97);
  }

  if (a6 && !*a6 && (v180->options & 0x10000000) != 0)
  {
    CFURLRef v98 = CFURLCreateWithFileSystemPath( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"/System/Library/CoreServices/CoreTypes.bundle/",  kCFURLPOSIXPathStyle,  1u);
    id v99 = -[_LSBundleProvider initWithURL:useCacheIfPossible:]( objc_alloc(&OBJC_CLASS____LSBundleProvider),  "initWithURL:useCacheIfPossible:",  v98,  1LL);
    __int128 v100 = v99;
    if (v99)
    {
      __int128 v101 = LSBundleProvider::XCFBundleCopyFolderURL( (LSBundleProvider *)-[_LSBundleProvider provider](v99, "provider"),  @"Library/");
      if (v101)
      {
        _LSAddBundleLibraryInfo(a1, v101, v100, v180, theDict, 0, a6);
        CFRelease(v101);
      }
    }

    if (v98) {
      CFRelease(v98);
    }
  }

  if (LSBundleProvider::CFBundleGetIdentifier((LSBundleProvider *)-[_LSBundleProvider provider](v183, "provider")))
  {
    if ((CFTypeID v102 = CFStringGetTypeID(),
          __int128 v103 = (__CFString *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x189604E18]),
          (__int128 v104 = v103) != 0LL)
      && CFGetTypeID(v103) == v102
      || (CFTypeID v105 = CFStringGetTypeID(),
          uint64_t v106 = (__CFString *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x189604AC8]),
          (__int128 v104 = v106) != 0LL)
      && CFGetTypeID(v106) == v105)
    {
      _LSGetVersionFromString(v104, buf);
    }
  }

  BOOL v107 = LSUseLegacyLocalizationList(theDict);
  +[_LSStringLocalizer gatherLocalizedStringsForCFBundle:infoDictionary:domains:delegatesMightBeMainBundle:legacyLocalizationList:]( &OBJC_CLASS____LSStringLocalizer,  "gatherLocalizedStringsForCFBundle:infoDictionary:domains:delegatesMightBeMainBundle:legacyLocalizationList:",  LSBundleProvider::bundleRef( (LSBundleProvider *)-[_LSBundleProvider provider](v183, "provider"),  1,  "making string localizer"),  theDict,  0xFFFFFFFFLL,  0LL,  v107);
  CFTypeRef cfa = LSBundleProvider::XCFBundleCopyFolderURL( (LSBundleProvider *)-[_LSBundleProvider provider](v183, "provider"),  @"Extensions/");
  if (cfa)
  {
    if ([(id)__LSDefaultsGetSharedInstance() allowsUnentitledExtensionPointDeclaration])
    {
      context = (void *)MEMORY[0x186E2A59C]();
      CFDictionaryRef v186 = (CFDictionaryRef)objc_opt_new();
      uint64_t v108 = *MEMORY[0x189603C88];
      v194[0] = *MEMORY[0x189603C88];
      [MEMORY[0x189603F18] arrayWithObjects:v194 count:1];
      __int128 v168 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x1896078A8] defaultManager];
      uint64_t v109 = (void *)objc_claimAutoreleasedReturnValue();
      [v109 enumeratorAtURL:cfa includingPropertiesForKeys:v168 options:1 errorHandler:0];
      __int128 v110 = (void *)objc_claimAutoreleasedReturnValue();

      __int128 v192 = 0u;
      __int128 v193 = 0u;
      __int128 v190 = 0u;
      __int128 v191 = 0u;
      id v111 = v110;
      uint64_t v112 = [v111 countByEnumeratingWithState:&v190 objects:buf count:16];
      if (v112)
      {
        uint64_t v113 = *(void *)v191;
        do
        {
          for (uint64_t i = 0LL; i != v112; ++i)
          {
            if (*(void *)v191 != v113) {
              objc_enumerationMutation(v111);
            }
            int v115 = *(void **)(*((void *)&v190 + 1) + 8 * i);
            CFTypeRef v116 = (void *)MEMORY[0x186E2A59C]();
            id v189 = 0LL;
            int v117 = [v115 getResourceValue:&v189 forKey:v108 error:0];
            id v118 = v189;
            CFTypeRef v119 = v118;
            if (v118) {
              int v120 = v117;
            }
            else {
              int v120 = 0;
            }
            if (v120 != 1 || ([v118 BOOLValue] & 1) != 0)
            {
              [v115 pathExtension];
              CFTypeRef v121 = (void *)objc_claimAutoreleasedReturnValue();
              CFTypeRef v122 = v121;
              if (v121
                && (![v121 caseInsensitiveCompare:@"appexpt"]
                 || ![v122 caseInsensitiveCompare:@"appextensionpoint"]
                 || ![v122 caseInsensitiveCompare:@"appextensionpoints"]))
              {
                -[__CFDictionary addObject:](v186, "addObject:", v115);
              }
            }

            objc_autoreleasePoolPop(v116);
          }

          uint64_t v112 = [v111 countByEnumeratingWithState:&v190 objects:buf count:16];
        }

        while (v112);
      }

      if (-[__CFDictionary count](v186, "count"))
      {
        CFTypeRef v123 = (void *)-[__CFDictionary copy](v186, "copy");
        -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", v123, @"_LSBundleExtensionPoints");
      }

      objc_autoreleasePoolPop(context);
    }

    CFRelease(cfa);
  }

  if (v180->action == 204)
  {
    __int128 v124 = *(const void **)-[_LSBundleProvider provider](v183, "provider");
    if (v124)
    {
      __int128 v125 = (const __CFURL *)CFRetain(v124);
      int v126 = v125;
      if (v125)
      {
        CFStringRef v127 = CFURLCopyFileSystemPath(v125, kCFURLPOSIXPathStyle);
        CFDictionarySetValue(theDict, @"Path", v127);
        CFRelease(v126);
        CFRelease(v127);
      }
    }

    goto LABEL_226;
  }

  CFTypeRef v128 = a5;
  if (a5)
  {
    CFDictionaryRef v187 = (CFDictionaryRef)v128;
    -[FSNode objectForKey:](v128, "objectForKey:", @"_LSBundlePlugins");
    CFURLRef v129 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v129 || !_NSIsNSDictionary() || ![v129 count])
    {

      goto LABEL_226;
    }

    cfb = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFIndex v130 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
    CFDictionaryRef v178 = (CFDictionaryRef)v129;
    [v129 allValues];
    unint64_t v131 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v192 = 0u;
    __int128 v193 = 0u;
    __int128 v190 = 0u;
    __int128 v191 = 0u;
    id v132 = v131;
    uint64_t v133 = [v132 countByEnumeratingWithState:&v190 objects:buf count:16];
    if (v133)
    {
      uint64_t v134 = *(void *)v191;
      do
      {
        for (uint64_t j = 0LL; j != v133; ++j)
        {
          if (*(void *)v191 != v134) {
            objc_enumerationMutation(v132);
          }
          [*(id *)(*((void *)&v190 + 1) + 8 * j) objectForKey:@"Path"];
          __int128 v136 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v137 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:v136 isDirectory:1];
          LSBundleProvider::LSBundleProvider((LSBundleProvider *)v194, v137);
          if (LSBundleProvider::bundleRef((LSBundleProvider *)v194, 1, "checking for validity"))
          {
            uint64_t v138 = (const void *)LSBundleProvider::bundleRef((LSBundleProvider *)v194, 1, 0LL);
            CFArrayAppendValue(v130, v138);
          }

          LSBundleProvider::~LSBundleProvider((LSBundleProvider *)v194);
        }

        uint64_t v133 = [v132 countByEnumeratingWithState:&v190 objects:buf count:16];
      }

      while (v133);
    }

    if (v130)
    {
      if (theDict)
      {
        __int128 v169 = (void *)CFDictionaryGetValue(theDict, @"_LSBundlePlugins");
        CFTypeID v139 = CFDictionaryGetTypeID();
        if (v169 && (!v139 || CFGetTypeID(v169) == v139)) {
          goto LABEL_231;
        }
      }

      else
      {
        CFDictionaryGetTypeID();
      }

      if (CFArrayGetCount(v130) < 1)
      {
        __int128 v169 = 0LL;
      }

      else
      {
        __int128 v169 = CFDictionaryCreateMutable(cfb, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
        CFDictionarySetValue(theDict, @"_LSBundlePlugins", v169);
        CFRelease(v169);
      }

LABEL_231:
      CFTypeID v141 = CFDictionaryGetTypeID();
      __int128 v142 = (const __CFDictionary *)CFDictionaryGetValue(v187, @"_LSBundlePlugins");
      __int128 v143 = v142;
      if (v142)
      {
        if (CFGetTypeID(v142) == v141) {
          __int128 v144 = v143;
        }
        else {
          __int128 v144 = 0LL;
        }
        v188 = v144;
      }

      else
      {
        v188 = 0LL;
      }

      if (CFArrayGetCount(v130) < 1)
      {
LABEL_272:
        CFRelease(v130);
        goto LABEL_226;
      }

      CFIndex v145 = 0LL;
      CFTypeRef cfc = (CFTypeRef)*MEMORY[0x189604DE8];
      CFDictionaryRef v179 = (CFDictionaryRef)*MEMORY[0x189604DE0];
      while (1)
      {
        ValueAtIndex = (__CFBundle *)CFArrayGetValueAtIndex(v130, v145);
        id v147 = (void *)_LSCopyBundleInfoDictionary(ValueAtIndex);
        __int128 v148 = (void *)MEMORY[0x186E2A59C]();
        CFAutorelease(v147);
        objc_msgSend(v147, "_ls_normalizedPluginPlist");
        __int128 v149 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v150 = (__CFDictionary *)[v149 mutableCopy];

        objc_autoreleasePoolPop(v148);
        CFStringRef Identifier = CFBundleGetIdentifier(ValueAtIndex);
        uint64_t v152 = CFBundleCopyBundleURL(ValueAtIndex);
        CFURLRef v153 = CFBundleCopyExecutableURL(ValueAtIndex);
        if (v152)
        {
          id v154 = -[FSNode initWithURL:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithURL:flags:error:",  v152,  0LL,  0LL);
          if (-[FSNode isSecuredSystemContent](v154, "isSecuredSystemContent")) {
            CFDictionarySetValue(v150, @"LSIsSecuredSystemContent", cfc);
          }
          CFStringRef v155 = CFURLCopyFileSystemPath(v152, kCFURLPOSIXPathStyle);
          CFDictionarySetValue(v150, @"Path", v155);
          CFRelease(v152);
          CFRelease(v155);
        }

        if (v153)
        {
          v156 = -[FSNode initWithURL:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithURL:flags:error:",  v153,  1LL,  0LL);
          if (v156)
          {
            bzero(buf, 0x400uLL);
            if (-[FSNode getFileSystemRepresentation:error:](v156, "getFileSystemRepresentation:error:", buf, 0LL))
            {
              *(void *)&__int128 v190 = 0LL;
              int v157 = open((const char *)buf, 0, 511LL);
              if ((v157 & 0x80000000) == 0)
              {
                BOOL v158 = -[FSNode getLength:error:](v156, "getLength:error:", &v190, 0LL);
                if ((void)v190) {
                  BOOL v159 = v158;
                }
                else {
                  BOOL v159 = 0;
                }
                if (v159)
                {
                  uint64_t v160 = fcntl(v157, 48, 1LL);
                  id v161 = (void *)MEMORY[0x186E2A59C](v160);
                  id v162 = objc_alloc_init(MEMORY[0x189603FA8]);
                  _LSParseLoadCommands();
                  -[__CFDictionary setObject:forKey:](v150, "setObject:forKey:", v162, @"_LSSliceInfosKey");

                  objc_autoreleasePoolPop(v161);
                }

                close(v157);
              }
            }
          }

          CFRelease(v153);
        }

        if (v188)
        {
          CFDictionaryGetTypeID();
          __int128 v163 = CFDictionaryGetValue(v188, Identifier);
          if (v163) {
            CFGetTypeID(v163);
          }
        }

        +[_LSStringLocalizer gatherLocalizedStringsForCFBundle:infoDictionary:domains:legacyLocalizationList:]( &OBJC_CLASS____LSStringLocalizer,  "gatherLocalizedStringsForCFBundle:infoDictionary:domains:legacyLocalizationList:",  ValueAtIndex,  v150,  3LL,  LSUseLegacyLocalizationList(v150));
        CFDictionaryRef v164 = v179;
        if (softLinkLNIsLinkEnabled)
        {
          else {
            CFDictionaryRef v164 = v179;
          }
        }

        CFDictionaryAddValue(v150, @"_LSIsLinkEnabled", v164);
        __int128 v165 = (void *)MEMORY[0x186E2A59C]();
        if (softLinkINSchemaURLsForIntentNamesWithBundle)
        {
          softLinkINSchemaURLsForIntentNamesWithBundle(ValueAtIndex);
          __int128 v166 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          __int128 v166 = 0LL;
        }

        if ([v166 count]) {
          CFDictionarySetValue(v150, @"_LSIntentDefinitionURLs", v166);
        }

        objc_autoreleasePoolPop(v165);
        if (Identifier)
        {
          if (v150) {
            break;
          }
        }

        if (v150) {
          goto LABEL_270;
        }
LABEL_271:
        if (CFArrayGetCount(v130) <= ++v145) {
          goto LABEL_272;
        }
      }

      CFDictionaryAddValue((CFMutableDictionaryRef)v169, Identifier, v150);
LABEL_270:
      CFRelease(v150);
      goto LABEL_271;
    }
  }

LABEL_226:
  return theDict;
}

void sub_183F685E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17, uint64_t a18, void *a19, uint64_t a20, void *a21, _Unwind_Exception *exception_object, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL34_LSCreateRegistrationDataForBundleP9LSContextP18LSRegistrationInfoPK7__CFURLPK14__CFDictionaryPPK9__CFArray_block_invoke( uint64_t a1, const void *a2, const void *a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 32), a2))
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
    if (CFEqual(a3, Value)) {
      return 1LL;
    }
    _LSRegistrationLog();
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int128 v12 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
      int v13 = 138543874;
      CFTypeID v14 = a2;
      __int16 v15 = 2114;
      uint64_t v16 = a3;
      __int16 v17 = 2114;
      CFTypeID v18 = v12;
      int v9 = "REGISTRATION CACHE ERROR: Difference, %{public}@   %{public}@ vs (wrong) %{public}@";
      int v10 = v8;
      uint32_t v11 = 32;
      goto LABEL_8;
    }
  }

  else
  {
    _LSRegistrationLog();
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138543618;
      CFTypeID v14 = a2;
      __int16 v15 = 2114;
      uint64_t v16 = a3;
      int v9 = "REGISTRATION CACHE ERROR: Missing, %{public}@   %{public}@";
      int v10 = v8;
      uint32_t v11 = 22;
LABEL_8:
      _os_log_impl(&dword_183E58000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v13, v11);
    }
  }

  return 0LL;
}

void sub_183F68A6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _LSAddBundleLibraryInfo( LSContext *a1, const __CFURL *a2, _LSBundleProvider *a3, LSRegistrationInfo *a4, __CFDictionary *a5, int a6, const __CFArray **a7)
{
  int v13 = a3;
  CFTypeID v14 = a4;
  if ((v14->options & 0x10000000) != 0)
  {
    id v30 = 0LL;
    if (FSNodeCreateWithURL((uint64_t)a2, 1LL, &v30))
    {
LABEL_31:

      goto LABEL_32;
    }

    if (a6)
    {
      __int16 v15 = (const void *)[MEMORY[0x189607968] numberWithUnsignedChar:_LSGetDirectoryClassForNode(v30)];
      CFDictionaryAddValue(a5, @"_LSDirectoryClass", v15);
    }

    id v29 = 0LL;
    *(_OWORD *)CFTypeRef cf = 0u;
    *(_OWORD *)uint64_t v28 = 0u;
    CFTypeRef v16 = CFRetain(a2);
    if (v16) {
      cf[0] = v16;
    }
    CFTypeRef v17 = CFRetain(a5);
    CFTypeRef v18 = v28[0];
    if (v28[0] != v17)
    {
      v28[0] = v17;
      CFTypeRef v17 = v18;
    }

    if (v17) {
      CFRelease(v17);
    }
    objc_storeStrong(&v29, a4);
    if (v13)
    {
      uint64_t v19 = *(const void **)-[_LSBundleProvider provider](v13, "provider");
      if (v19)
      {
        CFTypeID v20 = (const __CFURL *)CFRetain(v19);
        uint64_t v21 = v20;
        if (v20)
        {
          CFStringRef v22 = XCFURLCopyRelativeFileSystemPath(v20, a2, kCFURLPOSIXPathStyle);
          if (!v22)
          {
            CFRelease(v21);
            if (a7)
            {
LABEL_22:
              CFStringRef v24 = (const __CFArray *)v28[1];
              if (v28[1]) {
                CFStringRef v24 = (const __CFArray *)CFRetain(v28[1]);
              }
              *a7 = v24;
            }

void sub_183F68CE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

BOOL LSUseLegacyLocalizationList(const __CFDictionary *a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = -[__CFDictionary objectForKey:](a1, "objectForKey:", @"LSExecutablePlatformKey");
  uint64_t v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v4 = 0LL;
  }

  uint64_t v6 = [v4 unsignedIntegerValue];

  uint64_t v7 = objc_opt_class();
  uint64_t v8 = -[__CFDictionary objectForKey:](a1, "objectForKey:", @"LSExecutableSDKVersion");
  int v9 = (void *)v8;
  if (v7 && v8)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      return 0LL;
    }
  }

  else if (!v8)
  {
    return 0LL;
  }

  _LSVersionNumberMakeWithString(&v13, v9);
  v16[0] = v13;
  v16[1] = v14;
  memset(v15, 0, sizeof(v15));
  if (_LSVersionNumberCompare(v16, v15))
  {
    v12[0] = v13;
    v12[1] = v14;
    BOOL v10 = +[_LSStringLocalizer useLegacyLocalizationListForPlatform:sdkVersion:]( &OBJC_CLASS____LSStringLocalizer,  "useLegacyLocalizationListForPlatform:sdkVersion:",  v6,  _LSMakeDYLDVersionFromVersionNumber(v12));
  }

  else
  {
    BOOL v10 = 0LL;
  }

  return v10;
}

void sub_183F68EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _LSPathifyIconKey( _LSBundleProvider *a1, __CFDictionary *a2, const __CFString *a3, const __CFString *a4)
{
  uint64_t v19 = a1;
  if (a2 && a3)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a2, a3);
    CFTypeID TypeID = CFStringGetTypeID();
    if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
    {
      uint64_t v8 = LSBundleProvider::copyIconResourceURL( (LSBundleProvider *)-[_LSBundleProvider provider](v19, "provider"),  Value,  0LL);
      int v9 = (__CFString *)v8;
      int v10 = gLogRegistrationErrors;
      if (v8 || !gLogRegistrationErrors)
      {
        if (v8)
        {
          __int128 v12 = CFURLCopyFileSystemPath(v8, kCFURLPOSIXPathStyle);
          if (v12)
          {
            uint64x2_t v13 = CFURLCopyFileSystemPath( *(CFURLRef *)-[_LSBundleProvider provider](v19, "provider"),  kCFURLPOSIXPathStyle);
            if (v13)
            {
              CFStringRef v14 = _LSCopyPathRelativeToBase(v12, v13);
              if (v14)
              {
                CFDictionarySetValue(a2, @"_LSIconPath", v14);
                CFRelease(v14);
              }

              CFRelease(v13);
            }

            goto LABEL_26;
          }

void sub_183F6911C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
}

void _LSPathifyIconKeysInPlistKey( _LSBundleProvider *a1, __CFDictionary *a2, const __CFString *a3, const __CFString *a4, const __CFString *a5)
{
  CFTypeRef v16 = a1;
  if (a2 && a3)
  {
    Value = (const __CFArray *)CFDictionaryGetValue(a2, a3);
    CFTypeID TypeID = CFArrayGetTypeID();
    if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
    {
      CFTypeID v10 = CFArrayGetTypeID();
      if (v10 == CFGetTypeID(Value))
      {
        CFIndex Count = CFArrayGetCount(Value);
        if (Count >= 1)
        {
          for (CFIndex i = 0LL; i != Count; ++i)
          {
            ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(Value, i);
            CFTypeID v14 = CFDictionaryGetTypeID();
            if (ValueAtIndex && (!v14 || CFGetTypeID(ValueAtIndex) == v14)) {
              _LSPathifyIconKey(v16, ValueAtIndex, a4, v15);
            }
          }
        }
      }
    }
  }

  else
  {
    CFArrayGetTypeID();
  }
}

void sub_183F692A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

CFStringRef _LSCopyPathRelativeToBase(const __CFString *a1, const __CFString *a2)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v5 = CFStringGetLength(a2);
  if (Length <= v5) {
    return 0LL;
  }
  CFIndex v6 = v5;
  v8.location = 0LL;
  v8.length = v5;
  if (CFStringCompareWithOptions(a1, a2, v8, 0LL)) {
    return 0LL;
  }
  if (CFStringGetCharacterAtIndex(a1, v6) == 47 && Length <= ++v6) {
    return 0LL;
  }
  v9.length = Length - v6;
  v9.location = v6;
  return CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x189604DB0], a1, v9);
}

uint64_t (*init_GSIsDocumentRevision(const __CFURL *a1))(const __CFURL *)
{
  uint64_t v2 = (void *)GenerationalStorageLibrary(void)::frameworkLibrary;
  if (!GenerationalStorageLibrary(void)::frameworkLibrary)
  {
    uint64_t v2 = dlopen("/System/Library/PrivateFrameworks/GenerationalStorage.framework/GenerationalStorage", 2);
    GenerationalStorageLibrary(void)::frameworkLibrary = (uint64_t)v2;
  }

  Class result = (uint64_t (*)(const __CFURL *))dlsym(v2, "_GSIsDocumentRevision");
  softLink_GSIsDocumentRevision = result;
  if (result) {
    return (uint64_t (*)(const __CFURL *))result(a1);
  }
  return result;
}

void _LSHoistLibraryItems(uint64_t a1, void *a2)
{
  uint64_t v4 = *(const char **)(a2[1] + 8LL);
  if (!v4)
  {
    if (!*a2) {
      return;
    }
    CFTypeRef v8 = CFRetain((CFTypeRef)*a2);
    if (!v8) {
      return;
    }
    goto LABEL_10;
  }

  size_t v5 = strlen(v4);
  CFIndex v6 = (const __CFURL *)MEMORY[0x186E293F0](*MEMORY[0x189604DB0], v4, v5, 1LL, *a2);
  uint64_t v7 = v6;
  if (v6)
  {
    CFTypeRef v8 = CFURLResourceIsReachable(v6, 0LL) ? CFRetain(v7) : 0LL;
    CFRelease(v7);
    if (v8)
    {
LABEL_10:
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      v9[2] = ___ZL20_LSHoistLibraryItemsP9LSContextP16_LSHoistingState_block_invoke;
      v9[3] = &__block_descriptor_48_e59_v40__0____CFURLEnumerator__8____CFURL__16____CFError__24_32l;
      v9[4] = a1;
      v9[5] = a2;
      XCFURLEnumerate((uint64_t)v8, 0LL, _LSGetBasicURLPropertyKeys(void)::result, v9);
      CFRelease(v8);
    }
  }

void sub_183F69524(_Unwind_Exception *exception_object)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

void _LSHoistingState::~_LSHoistingState(id *this)
{
  id v2 = this[3];
  if (v2) {
    CFRelease(v2);
  }
  this[3] = 0LL;
  id v3 = this[2];
  if (v3) {
    CFRelease(v3);
  }
  this[2] = 0LL;
  if (*this) {
    CFRelease(*this);
  }
  *this = 0LL;
}

void ___ZL20_LSHoistLibraryItemsP9LSContextP16_LSHoistingState_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = -[FSNode initWithURL:flags:error:](objc_alloc(&OBJC_CLASS___FSNode), "initWithURL:flags:error:", a3, 0LL, 0LL);
    size_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = MEMORY[0x1895F87A8];
      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 3221225472LL;
      v13[2] = ___ZL20_LSHoistLibraryItemsP9LSContextP16_LSHoistingState_block_invoke_2;
      v13[3] = &unk_189D785D0;
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v7 = v4;
      uint64_t v8 = *(void *)(a1 + 40);
      CFTypeID v14 = v7;
      uint64_t v16 = v8;
      CFRange v9 = (void (**)(void))MEMORY[0x186E2A7B8](v13);
      if ([(id)__LSDefaultsGetSharedInstance() isServer] && !*(void *)(a1 + 32))
      {
        +[LSDBExecutionContext sharedServerInstance]();
        CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = v6;
        v11[1] = 3221225472LL;
        v11[2] = ___ZL20_LSHoistLibraryItemsP9LSContextP16_LSHoistingState_block_invoke_3;
        v11[3] = &unk_189D73FA8;
        __int128 v12 = v9;
        -[LSDBExecutionContext syncWrite:]((uint64_t)v10, v11);
      }

      else
      {
        v9[2](v9);
      }
    }
  }

void sub_183F696D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void ___ZL20_LSHoistLibraryItemsP9LSContextP16_LSHoistingState_block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  uint64_t v28 = *(void ***)(a1 + 40);
  id v29 = 0LL;
  char v30 = 0;
  id v31 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  id v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  id v3 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v28, v2, 0LL);

  if (v3
    && (![*(id *)(a1 + 32) isDirectory]
     || _LSGetBundleClassForNode((uint64_t)v3, *(void **)(a1 + 32))
     || _LSNodeIsPackage(v3, *(void **)(a1 + 32), 0LL)))
  {
    uint64_t v4 = *(const __CFURL ***)(a1 + 48);
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *v4;
    [v5 URL];
    uint64_t v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    CFStringRef v8 = XCFURLCopyRelativeFileSystemPath(v6, v7, kCFURLPOSIXPathStyle);

    if (!v8)
    {
LABEL_41:

      goto LABEL_42;
    }

    CFRange v9 = v4[2];
    CFTypeID v10 = (CFAllocatorRef *)MEMORY[0x189604DB0];
    if (v9)
    {
      Value = (void *)CFDictionaryGetValue(v9, @"_LSBundleLibraryItems");
      CFTypeID TypeID = CFArrayGetTypeID();
      if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
      {
        CFTypeID v13 = CFArrayGetTypeID();
        if (v13 == CFGetTypeID(Value)) {
          goto LABEL_14;
        }
      }
    }

    else
    {
      CFArrayGetTypeID();
    }

    Value = CFArrayCreateMutable(*v10, 0LL, MEMORY[0x189605228]);
    CFDictionarySetValue(v4[2], @"_LSBundleLibraryItems", Value);
    CFRelease(Value);
LABEL_14:
    CFArrayAppendValue((CFMutableArrayRef)Value, v8);
    int v14 = _LSGetBundleClassForNode((uint64_t)v3, v5);
    if (!v14)
    {
      id v15 = v5;
      if ((*((_BYTE *)v4[4] + 19) & 0x10) == 0
        || ![(id)__LSDefaultsGetSharedInstance() isAppleInternal]
        || ![v15 isSymbolicLink])
      {
        goto LABEL_22;
      }

      _LSRegistrationLog();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v33 = v15;
        _os_log_impl(&dword_183E58000, v16, OS_LOG_TYPE_INFO, "Symlink %@ will be hoisted into Core Types.", buf, 0xCu);
      }

      [v15 resolvedNodeWithFlags:0 error:0];
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15) {
        int v14 = _LSGetBundleClassForNode((uint64_t)v3, v15);
      }
      else {
LABEL_22:
      }
        int v14 = 0;
    }

    uint64_t v17 = *v10;
    CFTypeRef v18 = (const __CFURL *)MEMORY[0x186E29414](v17, v8, 0LL, 1LL, *v4);
    uint64_t v19 = v18;
    if (v18)
    {
      if (v14 == 2)
      {
        CFURLRef v20 = CFURLCopyAbsoluteURL(v18);
        if (v20)
        {
          CFMutableDictionaryRef Mutable = v4[3];
          if (!Mutable)
          {
            CFMutableDictionaryRef Mutable = CFArrayCreateMutable(v17, 0LL, MEMORY[0x189605228]);
            CFStringRef v22 = v4[3];
            CFTypeID v23 = Mutable;
            if (v22 != Mutable)
            {
              v4[3] = Mutable;
              CFTypeID v23 = v22;
            }

            if (v23)
            {
              CFRelease(v23);
              CFMutableDictionaryRef Mutable = v4[3];
            }
          }

          CFArrayAppendValue(Mutable, v20);
          CFRelease(v20);
        }
      }

      if (v14 && v14 == *((_DWORD *)v4[1] + 4))
      {
        LSBundleProvider::LSBundleProvider((LSBundleProvider *)buf, v19);
        if (LSBundleProvider::bundleRef((LSBundleProvider *)buf, 1, "checking for validity"))
        {
          InfoDictionaryRef = (__CFDictionary *)LSBundleProvider::GetInfoDictionaryRef((LSBundleProvider *)buf);
          __int128 v25 = copyDeepMutableDictionary(InfoDictionaryRef);
          if (v25)
          {
            _LSHoistDelegateDictionaries(v4[2], v25, @"UTExportedTypeDeclarations", v8);
            _LSHoistDelegateDictionaries(v4[2], v25, @"UTImportedTypeDeclarations", v8);
            _LSHoistDelegateDictionaries(v4[2], v25, (const __CFString *)*MEMORY[0x189604AA8], v8);
            _LSHoistDelegateDictionaries(v4[2], v25, (const __CFString *)*MEMORY[0x189604B10], v8);
            CFRelease(v25);
          }
        }

        LSBundleProvider::~LSBundleProvider((LSBundleProvider *)buf);
      }

      CFRelease(v19);
    }

    CFRelease(v8);
    goto LABEL_41;
  }

void sub_183F69B58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)&a9);
  _Unwind_Resume(a1);
}

uint64_t ___ZL20_LSHoistLibraryItemsP9LSContextP16_LSHoistingState_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

CFArrayRef ___ZL26_LSGetBasicURLPropertyKeysv_block_invoke()
{
  v2[3] = *(const void **)MEMORY[0x1895F89C0];
  os_log_t v0 = (const void *)*MEMORY[0x189605378];
  v2[0] = *(const void **)MEMORY[0x189605438];
  v2[1] = v0;
  v2[2] = *(const void **)MEMORY[0x189605368];
  CFArrayRef result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v2, 3LL, MEMORY[0x189605228]);
  _LSGetBasicURLPropertyKeys(void)::CFArrayRef result = (uint64_t)result;
  return result;
}

void _LSHoistDelegateDictionaries( __CFDictionary *a1, CFDictionaryRef theDict, const __CFString *key, const __CFString *a4)
{
  if (!theDict || !key)
  {
    CFArrayGetTypeID();
    return;
  }

  Value = CFDictionaryGetValue(theDict, key);
  CFTypeID TypeID = CFArrayGetTypeID();
  if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
  {
    CFTypeID v10 = CFGetTypeID(Value);
    if (v10 == CFArrayGetTypeID())
    {
      if (a1)
      {
        CFMutableDictionaryRef Mutable = (void *)CFDictionaryGetValue(a1, key);
        CFTypeID v12 = CFArrayGetTypeID();
        if (Mutable && (!v12 || CFGetTypeID(Mutable) == v12))
        {
          CFTypeID v13 = CFGetTypeID(Mutable);
          if (v13 != CFArrayGetTypeID()) {
            return;
          }
LABEL_16:
          int v14 = (const void *)*MEMORY[0x189604E00];
          if (*MEMORY[0x189604E00])
          {
            id v15 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x189604E00]);
            CFTypeID v16 = CFStringGetTypeID();
            if (!v15) {
              goto LABEL_25;
            }
            if (!v16 || CFGetTypeID(v15) == v16)
            {
              CFTypeID v17 = CFGetTypeID(v15);
              if (v17 != CFStringGetTypeID()) {
                id v15 = 0LL;
              }
              goto LABEL_25;
            }
          }

          else
          {
            CFStringGetTypeID();
          }

          id v15 = 0LL;
LABEL_25:
          CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
          if (Count >= 1)
          {
            CFIndex v19 = Count;
            for (CFIndex i = 0LL; i != v19; ++i)
            {
              ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)Value, i);
              CFTypeID v22 = CFDictionaryGetTypeID();
              if (ValueAtIndex && (!v22 || CFGetTypeID(ValueAtIndex) == v22))
              {
                CFDictionarySetValue(ValueAtIndex, @"_LSBundleLibraryDelegate", a4);
                if (v15) {
                  CFDictionarySetValue(ValueAtIndex, v14, v15);
                }
                CFArrayAppendValue((CFMutableArrayRef)Mutable, ValueAtIndex);
              }
            }
          }

          return;
        }
      }

      else
      {
        CFArrayGetTypeID();
      }

      CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
      CFDictionarySetValue(a1, key, Mutable);
      CFRelease(Mutable);
      goto LABEL_16;
    }
  }

uint64_t (*initINSchemaURLsForIntentNamesWithBundle(__CFBundle *a1))(__CFBundle *)
{
  id v2 = (void *)IntentsLibrary(void)::frameworkLibrary;
  if (!IntentsLibrary(void)::frameworkLibrary)
  {
    id v2 = dlopen("/System/Library/Frameworks/Intents.framework/Intents", 2);
    IntentsLibrary(void)::frameworkLibrary = (uint64_t)v2;
  }

  id v3 = (uint64_t (*)(__CFBundle *))dlsym(v2, "INSchemaURLsForIntentNamesWithBundle");
  softLinkINSchemaURLsForIntentNamesWithBundle = v3;
  if (v3)
  {
    v3(a1);
    id v3 = (uint64_t (*)(__CFBundle *))objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

{
  void *v2;
  uint64_t (*v3)(__CFBundle *);
  id v2 = (void *)IntentsLibrary(void)::frameworkLibrary;
  if (!IntentsLibrary(void)::frameworkLibrary)
  {
    id v2 = dlopen("/System/Library/Frameworks/Intents.framework/Intents", 2);
    IntentsLibrary(void)::frameworkLibrary = (uint64_t)v2;
  }

  id v3 = (uint64_t (*)(__CFBundle *))dlsym(v2, "INSchemaURLsForIntentNamesWithBundle");
  softLinkINSchemaURLsForIntentNamesWithBundle = v3;
  if (v3)
  {
    v3(a1);
    id v3 = (uint64_t (*)(__CFBundle *))objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

uint64_t (*initLNIsLinkEnabled(__CFBundle *a1))(__CFBundle *)
{
  id v2 = (void *)LinkServicesLibrary(void)::frameworkLibrary;
  if (!LinkServicesLibrary(void)::frameworkLibrary)
  {
    id v2 = dlopen("/System/Library/PrivateFrameworks/LinkServices.framework/LinkServices", 2);
    LinkServicesLibrary(void)::frameworkLibrary = (uint64_t)v2;
  }

  CFArrayRef result = (uint64_t (*)(__CFBundle *))dlsym(v2, "LNIsLinkEnabled");
  softLinkLNIsLinkEnabled = result;
  if (result) {
    return (uint64_t (*)(__CFBundle *))result(a1);
  }
  return result;
}

CFTypeRef __Block_byref_object_copy__407(uint64_t a1, uint64_t a2)
{
  CFTypeRef result = *(CFTypeRef *)(a2 + 48);
  *(void *)(a1 + 4_Block_object_dispose((const void *)(v2 - 112), 8) = result;
  if (result) {
    return CFRetain(result);
  }
  return result;
}

void __Block_byref_object_dispose__408(uint64_t a1)
{
  id v2 = *(const void **)(a1 + 48);
  if (v2) {
    CFRelease(v2);
  }
  *(void *)(a1 + 4_Block_object_dispose((const void *)(v2 - 112), 8) = 0LL;
}

void ___ZL31createInstallationDictForPluginPK10__CFString_block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 objectForKey:*MEMORY[0x189604E00]];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = [v3 isEqualToString:*(void *)(a1 + 40)];

  if (v4)
  {
    id v5 = v8;
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v7 = *(id *)(v6 + 48);
    if (v7 != v5)
    {
      *(void *)(v6 + 4_Block_object_dispose((const void *)(v2 - 112), 8) = v5;
      id v5 = v7;
    }

    if (v5) {
      CFRelease(v5);
    }
  }
}

void sub_183F6A068( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_183F6A110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _LSSchemaCache::_LSSchemaCache(_LSSchemaCache *this)
{
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((_DWORD *)this + 5_Block_object_dispose((const void *)(v2 - 112), 8) = 1065353216;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_DWORD *)this + 6_Block_object_dispose((const void *)(v2 - 112), 8) = 1065353216;
  pthread_rwlock_init((pthread_rwlock_t *)this, 0LL);
  *(_OWORD *)((char *)this + 324) = 0u;
  *(_OWORD *)((char *)this + 296) = 0u;
  *(_OWORD *)((char *)this + 312) = 0u;
  *(_OWORD *)((char *)this + 280) = 0u;
}

void sub_183F6A458(_Unwind_Exception *a1)
{
}

void _LSSchemaTransferCache(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = ___LSSchemaTransferCache_block_invoke;
  v2[3] = &__block_descriptor_40_e9_v16__0_v8l;
  v2[4] = a2;
  _LSSchemaCacheWrite(a1, v2);
}

void _LSSchemaCacheWrite(uint64_t a1, void *a2)
{
  int v4 = a2;
  if (a1)
  {
    if (v4)
    {
      id v3 = *(pthread_rwlock_t **)(a1 + 1616);
      if (v3)
      {
        pthread_rwlock_wrlock(v3);
        v4[2](v4, v3);
        pthread_rwlock_unlock(v3);
      }
    }
  }
}

void sub_183F6A52C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void _LSSchemaCache::~_LSSchemaCache(_LSSchemaCache *this)
{
}

void sub_183F6A644(_Unwind_Exception *a1)
{
}

void _LSSchemaClearLocalizedCaches(uint64_t a1)
{
}

void _LSSchemaCacheRead(uint64_t a1, void *a2)
{
  int v4 = a2;
  if (a1)
  {
    if (v4)
    {
      id v3 = *(pthread_rwlock_t **)(a1 + 1616);
      if (v3)
      {
        pthread_rwlock_rdlock(v3);
        v4[2](v4, v3);
        pthread_rwlock_unlock(v3);
      }
    }
  }
}

void sub_183F6A6D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void _LSSchemaClearAllCaches(uint64_t a1)
{
}

void std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::clear( uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::__deallocate_node( a1,  *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0LL;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0LL;
    }

    *(void *)(a1 + 24) = 0LL;
  }

void std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::__deallocate_node( uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      id v3 = (void *)*v2;
      std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)(v2 + 3));
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

void *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::clear( void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    CFTypeRef result = (void *)result[2];
    if (result)
    {
      do
      {
        uint64_t v2 = (void *)*result;
        operator delete(result);
        CFTypeRef result = v2;
      }

      while (v2);
    }

    v1[2] = 0LL;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0LL; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0LL;
    }

    v1[3] = 0LL;
  }

  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::~__hash_table( uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::__move_assign( uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *a2 = 0LL;
  id v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v8 = a2[2];
  id v7 = a2 + 2;
  uint64_t v6 = v8;
  uint64_t v9 = *(v7 - 1);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + _Block_object_dispose((const void *)(v2 - 112), 8) = v9;
  *(v7 - 1) = 0LL;
  uint64_t v10 = v7[1];
  *(void *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    unint64_t v11 = *(void *)(v6 + 8);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        v11 %= v12;
      }
    }

    else
    {
      v11 &= v12 - 1;
    }

    *(void *)(*(void *)a1 + 8 * v11) = a1 + 16;
    *id v7 = 0LL;
    v7[1] = 0LL;
  }

void std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__move_assign( uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *a2 = 0LL;
  id v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v8 = a2[2];
  id v7 = a2 + 2;
  uint64_t v6 = v8;
  uint64_t v9 = *(v7 - 1);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + _Block_object_dispose((const void *)(v2 - 112), 8) = v9;
  *(v7 - 1) = 0LL;
  uint64_t v10 = v7[1];
  *(void *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    unint64_t v11 = *(void *)(v6 + 8);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        v11 %= v12;
      }
    }

    else
    {
      v11 &= v12 - 1;
    }

    *(void *)(*(void *)a1 + 8 * v11) = a1 + 16;
    *id v7 = 0LL;
    v7[1] = 0LL;
  }

void _LSSchemeApprovalFindWithCompletionHandler(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  v49[1] = *MEMORY[0x1895F89C0];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  CFTypeID v13 = (void (**)(void, void, void))v12;
  if (!v11 || !v12)
  {
    if (!v12) {
      goto LABEL_52;
    }
    uint64_t v46 = *MEMORY[0x189607490];
    char v47 = @"invalid input parameters";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    CFTypeID v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"_LSSchemeApprovalFindWithCompletionHandler",  157LL,  v16);
    CFTypeID v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void *))v13)[2](v13, 0LL, v17);
    goto LABEL_8;
  }

  if (!v9)
  {
    BOOL v18 = 0;
    CFTypeID v16 = 0LL;
    BOOL v19 = v10 != 0LL;
    goto LABEL_10;
  }

  [v9 _xpcConnection];
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL CanSuppressCustomSchemePrompt = _LSXPCConnectionCanSuppressCustomSchemePrompt(v14, (uint64_t)v11);

  if (!CanSuppressCustomSchemePrompt)
  {
    [v9 _xpcConnection];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    CFTypeID v16 = (void *)_LSCopyBundleIdentifierForXPCConnection(v28, 0);

    BOOL v18 = v16 != 0LL;
    BOOL v19 = v10 != 0LL;
    if (v10 && v16)
    {
      if ([v16 isEqual:v10]) {
        goto LABEL_50;
      }
      id v41 = v10;
      +[LSBundleProxy bundleProxyForIdentifier:](&OBJC_CLASS___LSBundleProxy, "bundleProxyForIdentifier:", v16);
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = +[LSBundleProxy bundleProxyForIdentifier:](&OBJC_CLASS___LSBundleProxy, "bundleProxyForIdentifier:", v41);
      id v31 = (void *)v30;
      int v32 = 0;
      if (v29 && v30)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          [v29 teamID];
          CFTypeID v39 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          CFTypeID v39 = 0LL;
        }

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v37 = [v31 teamID];
          CFTypeID v38 = (void *)v37;
          int v32 = 0;
          if (v39 && v37) {
            int v32 = [v39 isEqual:v37];
          }
        }

        else
        {
          CFTypeID v38 = 0LL;
          int v32 = 0;
        }
      }

      if (v32) {
        goto LABEL_50;
      }
      BOOL v19 = 1;
      goto LABEL_11;
    }

void sub_183F6AE8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _LSSchemeApprovalBundleIsAppleInternal(NSString *a1)
{
  uint64_t v1 = a1;
  id v9 = 0LL;
  +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordWithBundleIdentifier:allowPlaceholder:error:",  v1,  0LL,  &v9);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v9;
  if (v2) {
    goto LABEL_4;
  }
  id v8 = v3;
  uint64_t v4 = -[LSApplicationRecord initWithBundleIdentifierOfSystemPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifierOfSystemPlaceholder:error:",  v1,  &v8);
  id v5 = v8;

  if (v4)
  {
    id v3 = v5;
    uint64_t v2 = v4;
LABEL_4:
    uint64_t v6 = [v2 isAppleInternal];
    goto LABEL_5;
  }

  _LSDefaultLog();
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR)) {
    _LSSchemeApprovalBundleIsAppleInternal((uint64_t)v5, (os_log_s *)v2);
  }
  uint64_t v6 = 0LL;
  id v3 = v5;
LABEL_5:

  return v6;
}

void sub_183F6B090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _LSSchemeApprovalUsePreferenceOrPromptWithCompletionHandler( void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = v11;
  id v17 = v12;
  id v66 = v14;
  if (v17)
  {
    id v18 = v17;
LABEL_3:
    [NSString stringWithFormat:@"%@-->%@", v18, v66];
    BOOL v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }

  [v16 _xpcConnection];
  CFURLRef v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = (void *)_LSCopyBundleURLForXPCConnection(v20, 0);

  if (v21)
  {
    [v21 path];
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18) {
      goto LABEL_3;
    }
  }

  BOOL v19 = 0LL;
LABEL_7:

  if (v19)
  {
    CFIndex v65 = (void *)CFPreferencesCopyValue( v19,  @"com.apple.launchservices.schemeapproval",  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605178]);
    if (v65 && _NSIsNSString() && ([v65 isEqual:v13] & 1) != 0)
    {
      v15[2](v15, 1LL, 0LL);
LABEL_48:

      goto LABEL_49;
    }

    uint64_t v62 = v15;
    CFRange v63 = v16;
    _LSSchemeApprovalGetBouncebackHistory();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v22);
    unint64_t v23 = [v22 count];
    unint64_t v24 = v23 - 2;
    if (v23 < 2)
    {
      int v30 = 0;
    }

    else
    {
      id v60 = v13;
      [v22 objectAtIndexedSubscript:v23 - 1];
      int v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 objectAtIndexedSubscript:v24];
      int v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 objectAtIndexedSubscript:0];
      BOOL v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 objectAtIndexedSubscript:1];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v27 isEqual:v6])
      {
        [v25 objectAtIndexedSubscript:1];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 objectAtIndexedSubscript:0];
        id v29 = (void *)objc_claimAutoreleasedReturnValue();
        int v30 = [v28 isEqual:v29];
      }

      else
      {

        int v30 = 0;
      }

      id v13 = v60;
    }

    objc_sync_exit(v22);

    if (v30)
    {
      id v15 = v62;
      id v16 = v63;
      v62[2](v62, 1LL, 0LL);
      goto LABEL_48;
    }

    id v15 = v62;
    id v16 = v63;
    if ((a5 & 1) == 0)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -2026LL,  (uint64_t)"_LSSchemeApprovalUsePreferenceOrPromptWithCompletionHandler",  287LL,  0LL);
      int v32 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v62)[2](v62, 0LL, v32);

      goto LABEL_48;
    }

    v67[0] = MEMORY[0x1895F87A8];
    v67[1] = 3221225472LL;
    CFDictionaryRef v68 = ___ZL59_LSSchemeApprovalUsePreferenceOrPromptWithCompletionHandlerP15NSXPCConnectionP8NSStringS2_S2_mU13block_pointerFvbP7NSErrorE_block_invoke;
    uint64_t v69 = &unk_189D78738;
    CFTypeRef v70 = v19;
    id v71 = v13;
    CFTypeID v72 = v62;
    id v56 = v63;
    id v33 = (NSString *)v17;
    CFStringRef v59 = (NSString *)v71;
    id v55 = v66;
    CFStringRef v57 = v33;
    __int128 v58 = v67;
    id v61 = v13;
    if (!v17)
    {
      BOOL v36 = 0LL;
LABEL_32:
      applicationBundleNameForIdentifier(v59);
      CFTypeID v39 = (void *)objc_claimAutoreleasedReturnValue();
      int v53 = v36;
      CFStringRef v54 = v39;
      if (v39)
      {
        if (v36)
        {
          _LSSchemeApprovalGetLocalizedString( @"“%@” wants to open “%@”",  @"SCHEME_APPROVAL_PROMPT_TITLE");
          unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(NSString, "stringWithFormat:", v40, v36, v39);
        }

        else
        {
          _LSSchemeApprovalGetLocalizedString( @"Open in “%@”?",  @"SCHEME_APPROVAL_PROMPT_TITLE_NO_SOURCE");
          unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(NSString, "stringWithFormat:", v40, v39);
        }

        id v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (_LSSchemeApprovalDebugMode(void)::result)
        {
          char v44 = (void *)NSString;
          [v56 description];
          id v45 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v46 = v57;
          if (!v17)
          {
            [v56 _xpcConnection];
            uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v46 = (void *)_LSCopyBundleURLForXPCConnection(v6, 0);
          }

          [v44 stringWithFormat:@"[Internal Build Detected]\n\nSource XPC: %@\nSource: %@\nTarget: %@\nScheme: %@\nOptions: %llx", v45, v46, v59, v55, a5];
          char v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
          }
        }

        else
        {
          char v47 = 0LL;
        }

        _LSSchemeApprovalGetLocalizedString(@"Open", @"SCHEME_APPROVAL_OPEN_BUTTON");
        uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
        _LSSchemeApprovalGetLocalizedString(@"Cancel", @"SCHEME_APPROVAL_DO_NOT_OPEN_BUTTON");
        uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
        v73[0] = MEMORY[0x1895F87A8];
        v73[1] = 3221225472LL;
        v73[2] = ___ZL44_LSSchemeApprovalPromptWithCompletionHandlerP15NSXPCConnectionP8NSStringS2_S2_mU13block_pointerFvbP7NSErrorE_block_invoke;
        v73[3] = &unk_189D78788;
        id v41 = v43;
        id v74 = v41;
        id v50 = v47;
        id v75 = v50;
        id v51 = v48;
        id v76 = v51;
        id v77 = v49;
        CFStringRef v78 = v58;
        uint64_t v79 = a5;
        id v52 = v49;
        _LSAskForScreenUnlock(0LL, v73);

        id v15 = v62;
        id v16 = v63;
        BOOL v42 = v57;
        BOOL v36 = v53;
        CFTypeID v39 = v54;
      }

      else
      {
        _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10813LL,  (uint64_t)"_LSSchemeApprovalPromptWithCompletionHandler",  416LL,  0LL);
        id v41 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v42 = v57;
        v68((uint64_t)v58, 0, v41);
      }

      id v13 = v61;
      goto LABEL_48;
    }

    +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v33,  0LL);
    id v34 = (void *)objc_claimAutoreleasedReturnValue();
    char v35 = v34;
    if (v34)
    {
      [v34 applicationType];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v6 isEqual:@"Hidden"])
      {

LABEL_29:
        BOOL v36 = 0LL;
LABEL_31:

        goto LABEL_32;
      }

      [v35 appTags];
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      char v38 = [v37 containsObject:@"hidden"];

      if ((v38 & 1) != 0) {
        goto LABEL_29;
      }
    }

    applicationBundleNameForIdentifier(v57);
    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }

  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -4960LL,  (uint64_t)"_LSSchemeApprovalUsePreferenceOrPromptWithCompletionHandler",  291LL,  0LL);
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v15)[2](v15, 0LL, v31);

LABEL_49:
}

void sub_183F6B804( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20, void *a21, void *a22, void *a23, _Unwind_Exception *exception_object, void *a25, void *a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, void *a31, void *a32, void *a33)
{
  _Unwind_Resume(a1);
}

void _LSSchemeApprovalRememberForBouncebackCheck(void *a1, void *a2)
{
  uint64x2_t v12[2] = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    [v3 _xpcConnection];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = (void *)_LSCopyBundleIdentifierForXPCConnection(v5, 0);
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  id v7 = v4;
  _LSSchemeApprovalGetBouncebackHistory();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  id v9 = v6;
  if (!v6)
  {
    [MEMORY[0x189603FE8] null];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v12[0] = v9;
  id v10 = v7;
  if (!v7)
  {
    [MEMORY[0x189603FE8] null];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v12[1] = v10;
  [MEMORY[0x189603F18] arrayWithObjects:v12 count:2];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 addObject:v11];

  if (!v7) {
  if (!v6)
  }

  objc_sync_exit(v8);
}

void sub_183F6BC20(_Unwind_Exception *a1)
{
  if (!v3) {

  }
  objc_sync_exit(v5);
  _Unwind_Resume(a1);
}

id _LSSchemeApprovalGetBouncebackHistory(void)
{
  return (id)_LSSchemeApprovalGetBouncebackHistory(void)::result;
}

void ___ZL59_LSSchemeApprovalUsePreferenceOrPromptWithCompletionHandlerP15NSXPCConnectionP8NSStringS2_S2_mU13block_pointerFvbP7NSErrorE_block_invoke( uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    CFPreferencesSetValue( *(CFStringRef *)(a1 + 32),  *(CFPropertyListRef *)(a1 + 40),  @"com.apple.launchservices.schemeapproval",  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605178]);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_183F6BD4C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

id applicationBundleNameForIdentifier(NSString *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v1,  1LL,  0LL);
  if (v2
    || (uint64_t v2 = -[LSApplicationRecord initWithBundleIdentifierOfSystemPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifierOfSystemPlaceholder:error:",  v1,  0LL)) != 0LL)
  {
    -[LSBundleRecord localizedName](v2, "localizedName");
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

void sub_183F6BDF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *_LSSchemeApprovalGetLocalizedString(NSString *a1, NSString *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (__CFBundle *)_LSGetBundle();
  uint64_t v6 = (__CFString *)CFBundleCopyLocalizedString(v5, v4, v4, @"SchemeApproval");
  id v7 = v6;
  if (!v6) {
    uint64_t v6 = (__CFString *)v3;
  }
  id v8 = v6;

  return v8;
}

void sub_183F6BE7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL44_LSSchemeApprovalPromptWithCompletionHandlerP15NSXPCConnectionP8NSStringS2_S2_mU13block_pointerFvbP7NSErrorE_block_invoke( uint64_t a1, int a2)
{
  if (a2)
  {
    MEMORY[0x186E2AFD4]();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    _DWORD v7[2] = ___ZL44_LSSchemeApprovalPromptWithCompletionHandlerP15NSXPCConnectionP8NSStringS2_S2_mU13block_pointerFvbP7NSErrorE_block_invoke_2;
    v7[3] = &unk_189D78760;
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    id v3 = (void *)MEMORY[0x186E2A7B8](v7);
    uint64_t v4 = *(void *)(a1 + 72);
    _LSSchemeApprovalGetPromptQueue();
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = v5;
    if ((v4 & 2) != 0) {
      dispatch_async(v5, v3);
    }
    else {
      dispatch_sync(v5, v3);
    }
  }

uint64_t ___ZL44_LSSchemeApprovalPromptWithCompletionHandlerP15NSXPCConnectionP8NSStringS2_S2_mU13block_pointerFvbP7NSErrorE_block_invoke_2( uint64_t a1)
{
  CFOptionFlags v7 = 0LL;
  if (CFUserNotificationDisplayAlert( 0.0,  0LL,  0LL,  0LL,  0LL,  *(CFStringRef *)(a1 + 32),  *(CFStringRef *)(a1 + 40),  *(CFStringRef *)(a1 + 48),  *(CFStringRef *)(a1 + 56),  0LL,  &v7))
  {
    uint64_t v2 = *(void *)(a1 + 64);
LABEL_4:
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10826LL,  (uint64_t)"_LSSchemeApprovalPromptWithCompletionHandler_block_invoke_2",  399LL,  0LL);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = 0LL;
    goto LABEL_5;
  }

  uint64_t v2 = *(void *)(a1 + 64);
  if ((v7 & 3) != 0) {
    goto LABEL_4;
  }
  id v3 = 0LL;
  uint64_t v4 = 1LL;
LABEL_5:
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v4, v3);
  if ((v4 & 1) == 0) {

  }
  return MEMORY[0x186E2AFE0](v5);
}

void sub_183F6C05C(_Unwind_Exception *exception_object)
{
  if ((v2 & 1) == 0) {

  }
  _Unwind_Resume(exception_object);
}

id _LSSchemeApprovalGetPromptQueue(void)
{
  return (id)_LSSchemeApprovalGetPromptQueue(void)::result;
}

void ___ZL26_LSSchemeApprovalDebugModev_block_invoke()
{
  CFPropertyListRef v0 = CFPreferencesCopyValue( @"_DebugMode",  @"com.apple.launchservices.schemeapproval",  (CFStringRef)*MEMORY[0x189605198],  (CFStringRef)*MEMORY[0x189605178]);
  uint64_t v1 = (void *)v0;
  if (v0)
  {
    id v3 = (void *)v0;
    char v2 = objc_opt_respondsToSelector();
    uint64_t v1 = v3;
    if ((v2 & 1) != 0)
    {
      _LSSchemeApprovalDebugMode(void)::CFTypeRef result = [v3 BOOLValue];
      uint64_t v1 = v3;
    }
  }
}

void sub_183F6C134( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void ___ZL31_LSSchemeApprovalGetPromptQueuev_block_invoke()
{
  char v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("LS scheme approval prompt queue", v2);
  uint64_t v1 = (void *)_LSSchemeApprovalGetPromptQueue(void)::result;
  _LSSchemeApprovalGetPromptQueue(void)::CFTypeRef result = (uint64_t)v0;
}

void ___ZL37_LSSchemeApprovalGetBouncebackHistoryv_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:3];
  uint64_t v1 = (void *)_LSSchemeApprovalGetBouncebackHistory(void)::result;
  _LSSchemeApprovalGetBouncebackHistory(void)::CFTypeRef result = v0;

  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&_ZGVZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E14backlightToken);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&_ZGVZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E14backlightToken))
  {
    __cxa_atexit( (void (*)(void *))LaunchServices::notifyd::NotifyToken::~NotifyToken,  &_ZZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E14backlightToken,  &dword_183E58000);
    __cxa_guard_release(&_ZGVZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E14backlightToken);
  }

  dispatch_get_global_queue(0LL, 0LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  LaunchServices::notifyd::NotifyToken::RegisterDispatch( @"com.apple.backboardd.backlight.changed",  v3,  &__block_literal_global_44,  &v6);
  LaunchServices::notifyd::NotifyToken::operator=( (LaunchServices::notifyd::NotifyToken *)&_ZZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E14backlightToken,  (LaunchServices::notifyd::NotifyToken *)&v6);
  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&v6);
  if (FrontBoardServicesLibrary(void)::frameworkLibrary
    || (FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/FrontBoardServi ces.framework/FrontBoardServices",  2)) != 0)
  {
    uint64_t v4 = [objc_alloc((Class)getFBSDisplayLayoutMonitorClass()) initWithDisplayType:0 handler:&__block_literal_global_46];
    uint64_t v5 = (void *)_ZZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E7monitor;
    _ZZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E7monitor = v4;
  }
}

void sub_183F6C2CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11)
{
  _Unwind_Resume(a1);
}

void ___ZL37_LSSchemeApprovalGetBouncebackHistoryv_block_invoke_2()
{
  uint64_t State = LaunchServices::notifyd::NotifyToken::getState((LaunchServices::notifyd::NotifyToken *)&_ZZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E14backlightToken);
  if (v1) {
    BOOL v2 = State == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2) {
    _LSSchemeApprovalClearBouncebackHistory();
  }
}

void _LSSchemeApprovalClearBouncebackHistory(void)
{
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  [obj removeAllObjects];
  objc_sync_exit(obj);
}

void sub_183F6C368( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  _Unwind_Resume(a1);
}

void ___ZL37_LSSchemeApprovalGetBouncebackHistoryv_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  [MEMORY[0x189603FE0] set];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (SpringBoardServicesLibrary(void)::frameworkLibrary
    || (SpringBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/SpringBoardSer vices.framework/SpringBoardServices",  2)) != 0)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    objc_msgSend(v2, "elements", 0);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v8 isUIApplicationElement]
            && (unint64_t)([v8 layoutRole] - 1) < 2)
          {
            [v8 bundleIdentifier];
            id v9 = (void *)objc_claimAutoreleasedReturnValue();
            [v3 addObject:v9];
          }
        }

        uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v5);
    }
  }

  _LSSchemeApprovalGetBouncebackHistory();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  uint64_t v11 = [v10 count];
  if (v11)
  {
    [v10 objectAtIndexedSubscript:v11 - 1];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 objectAtIndexedSubscript:0];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v3 containsObject:v13])
    {
    }

    else
    {
      [v12 objectAtIndexedSubscript:1];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      char v15 = [v3 containsObject:v14];

      if ((v15 & 1) == 0) {
        _LSSchemeApprovalClearBouncebackHistory();
      }
    }
  }

  objc_sync_exit(v10);
}

void sub_183F6C5A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

Class initFBSDisplayLayoutMonitor(void)
{
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary) {
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/FrontBoardServices. framework/FrontBoardServices",  2);
  }
  Class result = objc_getClass("FBSDisplayLayoutMonitor");
  classFBSDisplayLayoutMonitor = (uint64_t)result;
  getFBSDisplayLayoutMonitorClass = (uint64_t (*)(void))FBSDisplayLayoutMonitorFunction;
  return result;
}

id FBSDisplayLayoutMonitorFunction(void)
{
  return (id)classFBSDisplayLayoutMonitor;
}

void _LSAskForScreenUnlock(void *a1, void *a2)
{
  _OWORD v15[2] = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  _LSAssertRunningInServer((uint64_t)"void _LSAskForScreenUnlock(__strong dispatch_queue_t _Nullable, void (^__strong _Non"
                                    "null)(BOOL, NSError *__strong))");
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x186E2A7B8](v4);
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = ___LSAskForScreenUnlock_block_invoke;
    v11[3] = &unk_189D78898;
    id v12 = v3;
    id v13 = v5;
    id v6 = v5;
    uint64_t v7 = MEMORY[0x186E2A7B8](v11);

    id v4 = (id)v7;
  }

  if (softLinkSBSGetScreenLockStatus(0LL))
  {
    id v8 = objc_alloc_init(&OBJC_CLASS____LSSpringBoardCall);
    -[_LSSpringBoardCall setBundleIdentifier:](v8, "setBundleIdentifier:", @"com.apple.springboard");
    v14[0] = getFBSOpenApplicationOptionKeyPromptUnlockDevice();
    uint64_t v9 = MEMORY[0x189604A88];
    v15[0] = MEMORY[0x189604A88];
    v14[1] = getFBSOpenApplicationOptionKeyUnlockDevice();
    v15[1] = v9;
    [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSSpringBoardCall setLaunchOptions:](v8, "setLaunchOptions:", v10);

    -[_LSSpringBoardCall setClientXPCConnection:](v8, "setClientXPCConnection:", 0LL);
    -[_LSSpringBoardCall setCallCompletionHandlerWhenFullyComplete:]( v8,  "setCallCompletionHandlerWhenFullyComplete:",  1LL);
    -[_LSSpringBoardCall callWithCompletionHandler:](v8, "callWithCompletionHandler:", v4);
  }

  else
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1LL, 0LL);
  }
}

void sub_183F6C870(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t initSBSGetScreenLockStatus(unsigned __int8 *a1)
{
  id v2 = (void *)SpringBoardServicesLibrary(void)::frameworkLibrary;
  if (!SpringBoardServicesLibrary(void)::frameworkLibrary)
  {
    id v2 = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", 2);
    SpringBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)v2;
  }

  softLinkSBSGetScreenLockStatus = (uint64_t (*)(unsigned __int8 *))dlsym(v2, "SBSGetScreenLockStatus");
  return softLinkSBSGetScreenLockStatus(a1);
}

uint64_t initFBSOpenApplicationOptionKeyPromptUnlockDevice(void)
{
  uint64_t v0 = (void *)FrontBoardServicesLibrary(void)::frameworkLibrary;
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
  {
    uint64_t v0 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }

  uint64_t result = *(void *)dlsym(v0, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
  constantFBSOpenApplicationOptionKeyPromptUnlockDevice = result;
  getFBSOpenApplicationOptionKeyPromptUnlockDevice = FBSOpenApplicationOptionKeyPromptUnlockDeviceFunction;
  return result;
}

uint64_t FBSOpenApplicationOptionKeyPromptUnlockDeviceFunction(void)
{
  return constantFBSOpenApplicationOptionKeyPromptUnlockDevice;
}

uint64_t initFBSOpenApplicationOptionKeyUnlockDevice(void)
{
  uint64_t v0 = (void *)FrontBoardServicesLibrary(void)::frameworkLibrary;
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
  {
    uint64_t v0 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }

  uint64_t result = *(void *)dlsym(v0, "FBSOpenApplicationOptionKeyUnlockDevice");
  constantFBSOpenApplicationOptionKeyUnlockDevice = result;
  getFBSOpenApplicationOptionKeyUnlockDevice = FBSOpenApplicationOptionKeyUnlockDeviceFunction;
  return result;
}

uint64_t FBSOpenApplicationOptionKeyUnlockDeviceFunction(void)
{
  return constantFBSOpenApplicationOptionKeyUnlockDevice;
}

id _LSServer_GetIOQueue()
{
  if (_LSServer_GetIOQueue::once != -1) {
    dispatch_once(&_LSServer_GetIOQueue::once, &__block_literal_global_61);
  }
  return (id)_LSServer_GetIOQueue::result;
}

uint64_t _LSServer_SetDatabaseIsSeeded(int a1)
{
  id v4 = 0LL;
  _LSDatabaseSessionSetSeedingInProgress(a1 == 0);
  if (_LSContextInit(&v4))
  {
    uint64_t v2 = 0LL;
  }

  else
  {
    if (v4 && -[_LSDatabase isSeeded]((uint64_t)v4) != a1)
    {
      -[_LSDatabase setSeeded:]((uint64_t)v4, a1 != 0);
      _LSDatabaseCommit((uint64_t)v4);
      uint64_t v2 = 1LL;
    }

    else
    {
      uint64_t v2 = 0LL;
    }

    _LSContextDestroy(&v4);
  }

  return v2;
}

void sub_183F6CBB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

uint64_t _LSServer_RegisterItemInfo( void *a1, void *a2, void *a3, const __CFDictionary *a4, int *a5, uint64_t a6, _BYTE *a7, CFTypeRef *a8)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  char v15 = a1;
  id v16 = a2;
  v41.db = 0LL;
  int v40 = 0;
  char v39 = 0;
  _LSLogStepStart((uint64_t)v16, 0LL, 0LL, v17);
  _LSDatabaseSentinelIncrement();
  if (v15)
  {
    if (v15[2] == 7) {
      goto LABEL_6;
    }
    _LSDefaultLog();
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      _LSServer_RegisterItemInfo_cold_1((uint64_t)v15, v18);
    }

    if (v15[2] == 7)
    {
LABEL_6:
      uint64_t v19 = _LSContextInit((id *)&v41.db);
      if ((_DWORD)v19)
      {
        BOOL v27 = 0LL;
      }

      else
      {
        uint64_t v19 = _LSServerItemInfoRegistration(&v41, v15, v16, a3, a4, (unsigned int *)&v40, a6, &v39, a7);
        if ((_DWORD)v19) {
          goto LABEL_24;
        }
        CFURLRef v20 = (_LSDatabase *)_LSServer_CopyLocalDatabase(0LL);
        BOOL v21 = v20 == v41.db;

        if (!v21)
        {
          [MEMORY[0x1896077D8] currentHandler];
          int v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend( NSString,  "stringWithUTF8String:",  "OSStatus _LSServer_RegisterItemInfo(const LSRegistrationInfo *__strong, NSData *__strong, CFDictionaryRef, C FDictionaryRef, CSStoreUnitID *, CSStoreUnitID *, Boolean *, CFStringRef *)");
          id v33 = (void *)objc_claimAutoreleasedReturnValue();
          [v32 handleFailureInFunction:v33 file:@"LSServerInterface.mm" lineNumber:112 description:@"server local database differed from context after registration?"];
        }

        _LSDatabaseCommit((uint64_t)v41.db);
        if (v15[3] != 203 || v40 == 0) {
          goto LABEL_24;
        }
        if (v39)
        {
          unint64_t v23 = (void *)MEMORY[0x186E2A59C]();
          _LSBundleGetRegistrationNotification( v41.db,  v40,  v15[4],  (uint64_t)@"com.apple.LaunchServices.applicationRegistered");
          unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            _LSServer_GetIOQueue();
            int v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
            blocCFIndex k = MEMORY[0x1895F87A8];
            uint64_t v35 = 3221225472LL;
            BOOL v36 = ___LSServer_RegisterItemInfo_block_invoke;
            uint64_t v37 = &unk_189D741C8;
            id v38 = v24;
            dispatch_async(v25, &block);
          }

          objc_autoreleasePoolPop(v23);
        }

        else
        {
          _LSRegistrationLog();
          int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int128 buf = 134217984;
            uint64_t v43 = v40;
            _os_log_impl( &dword_183E58000,  v26,  OS_LOG_TYPE_DEFAULT,  "Registration succeeded, but did not actually register anything new; returning existing bundle 0x%llx and n"
              "ot sending app-registered notification.",
              buf,
              0xCu);
          }
        }

        if (!a8 || !_LSBundleGet(v41.db, v40)) {
LABEL_24:
        }
          BOOL v27 = 0LL;
        else {
          BOOL v27 = (void *)_CSStringCopyCFString();
        }
        _LSContextDestroy((void **)&v41.db);
        if (a8 && v27) {
          *a8 = CFRetain(v27);
        }
        if (a5) {
          *a5 = v40;
        }
      }
    }

    else
    {
      BOOL v27 = 0LL;
      uint64_t v19 = 4294956474LL;
    }
  }

  else
  {
    BOOL v27 = 0LL;
    uint64_t v19 = 4294967246LL;
  }

  uint64_t v28 = v27;
  [MEMORY[0x189607968] numberWithInt:v19];
  id v29 = (void *)objc_claimAutoreleasedReturnValue();
  _LSLogStepFinished((uint64_t)v29, (_DWORD)v19 == 0, v28, v30, v29, block, v35, v36, v37);

  _LSDatabaseSentinelDecrement();
  if (v28) {
    CFRelease(v28);
  }

  return v19;
}

void sub_183F6CFB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_183F6D0CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _LSIfCanModifyDefaultHandler(uint64_t a1, uint64_t a2, _DWORD *a3, void *a4)
{
  id v5 = a4;
  id v9 = 0LL;
  _LSCanModifyDefaultHandler((uint64_t)v5, v6, v7, &v9);
  id v8 = v9;
  *a3 = _LSGetOSStatusFromNSError(v8);
}

void sub_183F6D180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _LSCanModifyDefaultHandler(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -4LL, (uint64_t)"_LSCanModifyDefaultHandler", 217LL, 0LL);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

BOOL _LSServer_RemoveAllHandlers(void *a1)
{
  id v14 = 0LL;
  uint64_t v11 = 0LL;
  id v12 = 0LL;
  char v13 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  id v3 = (LSHandlerPref **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v11, v2, 0LL);

  if (v3)
  {
    LSHandlerPref::RemoveAll(*v3, v4);
    _LSDatabaseCommit((uint64_t)*v3);
    _LSArmSaveTimer(3);
  }

  else if (a1)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    id v5 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v11, v5, 0LL);

    if (v6) {
      id v7 = 0LL;
    }
    else {
      id v7 = v14;
    }
    *a1 = v7;
  }

  if (v11 && v13) {
    _LSContextDestroy(v11);
  }
  id v8 = v12;
  uint64_t v11 = 0LL;
  id v12 = 0LL;

  char v13 = 0;
  id v9 = v14;
  id v14 = 0LL;

  return v3 != 0LL;
}

void sub_183F6D2FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)&a9);
  _Unwind_Resume(a1);
}

void _LSLogStep(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v11 = a3;
  id v9 = a4;
  if (v9) {
    id v10 = (void *)[objc_alloc(NSString) initWithFormat:v9 arguments:a5];
  }
  else {
    id v10 = 0LL;
  }
  [(id)getAITransactionLogClass() logStep:4 byParty:5 phase:a1 success:a2 forBundleID:v11 description:v10];
}

void sub_183F6D3EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _LSServerCleanEphemeralMobileContainersForFirstBoot(uint64_t *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v13 = MEMORY[0x1895F87A8];
  uint64_t v14 = 3221225472LL;
  char v15 = ___LSServerCleanEphemeralMobileContainersForFirstBoot_block_invoke;
  id v16 = &unk_189D788E0;
  __int128 v18 = a1;
  id v3 = v2;
  id v17 = v3;
  _CSStoreEnumerateUnits();
  if ([v3 count])
  {
    _LSDatabaseSentinelIncrement();
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v9 = 0u;
    __int128 v10 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          _LSContainerRemove( a1,  objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "unsignedIntegerValue", (void)v9));
        }

        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v19 count:16];
      }

      while (v6);
    }

    _LSArmSaveTimer(1);
    _LSDatabaseSentinelDecrement();
  }
}

uint64_t _LSServerMain()
{
  uint64_t v105 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x186E2A59C]();
  [MEMORY[0x189607870] _setFileNameLocalizationEnabled:0];
  if (setiopolicy_np(9, 0, 1) < 0)
  {
    int v0 = *__error();
    _LSDefaultLog();
    char v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      _LSServerMain_cold_5(v0, v1);
    }
  }

  [(id)__LSDefaultsGetSharedInstance() setServer:1];
  _LSDefaultLog();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136446722;
    *(void *)&uint8_t buf[4] = getprogname();
    *(_WORD *)&_BYTE buf[12] = 2048;
    *(void *)&buf[14] = [(id)__LSDefaultsGetSharedInstance() currentSchemaVersion];
    *(_WORD *)&buf[22] = 2048;
    unint64_t v99 = _CFGetEUID();
    _os_log_impl( &dword_183E58000,  v2,  OS_LOG_TYPE_DEFAULT,  "%{public}s starting with schema version %llu for effective user %llu",  buf,  0x20u);
  }

  if (listenForSigterm_onceToken != -1) {
    dispatch_once(&listenForSigterm_onceToken, &__block_literal_global_62);
  }
  if (!_LSServerHasDoneFirstBootWork())
  {
    _LSDefaultLog();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( &dword_183E58000,  v3,  OS_LOG_TYPE_DEFAULT,  "migrating old preference files on first start after reboot...",  buf,  2u);
    }

    id v4 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"/private/var/mobile/Library/Preferences/com.apple.MobileCoreServices/com.apple.launchservices.secure.plist" isDirectory:0];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"/private/var/mobile/Library/Preferences/com.apple.MobileCoreServices/com.apple.LaunchServices.plist" isDirectory:0];
    [MEMORY[0x1896078A8] defaultManager];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 path];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = [v6 fileExistsAtPath:v7];

    if (v8)
    {
      [(id)__LSDefaultsGetSharedInstance() securePreferencesFileURL];
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
      moveItemAtURLToURL(v4, v9);
    }

    [MEMORY[0x1896078A8] defaultManager];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 path];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = [v10 fileExistsAtPath:v11];

    if (v12)
    {
      [(id)__LSDefaultsGetSharedInstance() preferencesFileURL];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      moveItemAtURLToURL(v5, v13);
    }

    if (([(id)__LSDefaultsGetSharedInstance() isInEducationMode] & 1) == 0)
    {
      [MEMORY[0x1896078A8] defaultManager];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [(id)__LSDefaultsGetSharedInstance() preSydroFSecurePreferencesFileURL];
      char v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 path];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      int v17 = [v14 fileExistsAtPath:v16];

      if (v17)
      {
        [(id)__LSDefaultsGetSharedInstance() preSydroFSecurePreferencesFileURL];
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
        [(id)__LSDefaultsGetSharedInstance() securePreferencesFileURL];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        moveItemAtURLToURL(v18, v19);

        [(id)__LSDefaultsGetSharedInstance() securePreferencesFileURL];
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(void *)&__int128 v101 = *MEMORY[0x189603BD0];
        *(void *)__int128 buf = *MEMORY[0x189603BD8];
        [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:&v101 count:1];
        BOOL v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(void *)BOOL v95 = 0LL;
        char v22 = [v20 setResourceValues:v21 error:v95];
        id v23 = *(id *)v95;

        if ((v22 & 1) == 0)
        {
          _LSDefaultLog();
          unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
            _LSServerMain_cold_4((uint64_t)v23, v24);
          }
        }
      }
    }

    [MEMORY[0x1896078A8] defaultManager];
    int v25 = (void *)objc_claimAutoreleasedReturnValue();
    int v26 = (void *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"/private/var/db/lsd/com.apple.lsdschemes.plist" isDirectory:0];
    [v25 removeItemAtURL:v26 error:0];

    _LSDefaultLog();
    BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v94 = 0;
      _os_log_impl(&dword_183E58000, v27, OS_LOG_TYPE_DEFAULT, "Done migrating old preference files.", v94, 2u);
    }
  }

  uint64_t v28 = (void *)MEMORY[0x186E2A59C]();
  [(id)__LSDefaultsGetSharedInstance() systemContainerURL];
  id v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 path];
  int v30 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896078A8] defaultManager];
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  char v32 = [v31 fileExistsAtPath:v30];

  if ((v32 & 1) == 0)
  {
    [MEMORY[0x1896078A8] defaultManager];
    id v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(void *)&__int128 v101 = *MEMORY[0x189607500];
    *(void *)__int128 buf = &unk_189DA8230;
    [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:&v101 count:1];
    id v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 createDirectoryAtPath:v30 withIntermediateDirectories:1 attributes:v34 error:0];
  }

  objc_autoreleasePoolPop(v28);
  [MEMORY[0x1896078A8] defaultManager];
  __int128 v90 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)__LSDefaultsGetSharedInstance() databaseContainerDirectoryURL];
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F18] array];
  BOOL v36 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)v94 = 0LL;
  [v90 contentsOfDirectoryAtURL:v35 includingPropertiesForKeys:v36 options:0 error:v94];
  uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue();
  id v92 = *(id *)v94;

  if (v92)
  {
    _LSDefaultLog();
    uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v38 = v37;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      _LSServerMain_cold_3((uint64_t)v92, v37);
      id v38 = v37;
    }

    goto LABEL_51;
  }

  char v39 = getenv("LS_NAME_PREFIX");
  int v40 = "com.apple.LaunchServices";
  if (v39) {
    int v40 = v39;
  }
  __int128 v91 = v40;
  LSContext v41 = (void *)MEMORY[0x189604010];
  [(id)__LSDefaultsGetSharedInstance() databaseStoreFileURL];
  BOOL v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v42 lastPathComponent];
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)__LSDefaultsGetSharedInstance() systemContentDatabaseStoreFileURL];
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
  [v44 lastPathComponent];
  id v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setWithObjects:", v43, v45, 0);
  id v92 = (id)objc_claimAutoreleasedReturnValue();

  __int128 v103 = 0u;
  __int128 v104 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  id v38 = v89;
  uint64_t v46 = -[os_log_s countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v101,  buf,  16LL);
  if (v46)
  {
    uint64_t v47 = *(void *)v102;
    do
    {
      for (uint64_t i = 0LL; i != v46; ++i)
      {
        if (*(void *)v102 != v47) {
          objc_enumerationMutation(v38);
        }
        uint64_t v49 = *(void **)(*((void *)&v101 + 1) + 8 * i);
        [v49 pathExtension];
        id v50 = (void *)objc_claimAutoreleasedReturnValue();
        [v49 lastPathComponent];
        id v51 = (void *)objc_claimAutoreleasedReturnValue();
        char v52 = [v92 containsObject:v51];

        if ((v52 & 1) != 0) {
          continue;
        }
        objc_msgSend(NSString, "stringWithFormat:", @"SystemDataOnly-%s-", v91);
        id v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(NSString, "stringWithFormat:", @"%s-", v91);
        int v53 = (void *)objc_claimAutoreleasedReturnValue();
        [v49 lastPathComponent];
        CFStringRef v54 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v54 hasPrefix:v50])
        {

LABEL_43:
          id v93 = 0LL;
          [v90 removeItemAtURL:v49 error:&v93];
          id v57 = v93;
          if (v57)
          {
            __int128 v58 = v57;
            _LSDefaultLog();
            CFStringRef v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              [v49 path];
              id v60 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)BOOL v95 = 138412546;
              *(void *)&v95[4] = v60;
              __int16 v96 = 2112;
              __int128 v97 = v58;
              _os_log_error_impl( &dword_183E58000,  v59,  OS_LOG_TYPE_ERROR,  "Error removing stale db file at path: %@ %@",  v95,  0x16u);
            }
          }

          goto LABEL_47;
        }

        [v49 lastPathComponent];
        id v55 = (void *)objc_claimAutoreleasedReturnValue();
        int v56 = [v55 hasPrefix:v53];

        if (v56) {
          goto LABEL_43;
        }
LABEL_47:

LABEL_48:
      }

      uint64_t v46 = -[os_log_s countByEnumeratingWithState:objects:count:]( v38,  "countByEnumeratingWithState:objects:count:",  &v101,  buf,  16LL);
    }

    while (v46);
  }

void sub_183F6E438(_Unwind_Exception *a1)
{
}

void runLightweightServerMainRunLoop()
{
}

void runServerMainRunLoop()
{
}

void __listenForSigterm_block_invoke()
{
  listenForSigterm_sigtermSet = 0x4000;
  if (sigprocmask(1, (const sigset_t *)&listenForSigterm_sigtermSet, 0LL))
  {
    _LSDefaultLog();
    int v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __listenForSigterm_block_invoke_cold_1();
    }
  }

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.lsd.sigact", 0LL);
  id v2 = (void *)listenForSigterm_handlerQueue;
  listenForSigterm_handlerQueue = (uint64_t)v1;

  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x1895F8B68], 0xFuLL, 0LL, (dispatch_queue_t)listenForSigterm_handlerQueue);
  id v4 = (void *)listenForSigterm_sigtermSource;
  listenForSigterm_sigtermSource = (uint64_t)v3;

  dispatch_source_set_event_handler((dispatch_source_t)listenForSigterm_sigtermSource, &__block_literal_global_7_0);
  dispatch_resume((dispatch_object_t)listenForSigterm_sigtermSource);
}

void __listenForSigterm_block_invoke_6()
{
  int v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_183E58000, v0, OS_LOG_TYPE_DEFAULT, "Received SIGTERM.", buf, 2u);
  }

  _LSServer_NoteTerminationRequestForMISync();
  sigset_t v6 = 0;
  if (sigpending(&v6))
  {
    _LSDefaultLog();
    dispatch_queue_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __listenForSigterm_block_invoke_6_cold_2();
    }
  }

  if (sigprocmask(2, (const sigset_t *)&listenForSigterm_sigtermSet, 0LL))
  {
    _LSDefaultLog();
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __listenForSigterm_block_invoke_6_cold_1();
    }
  }

  if ((v6 & 0x4000) == 0)
  {
    _LSDefaultLog();
    dispatch_source_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl( &dword_183E58000,  v3,  OS_LOG_TYPE_DEFAULT,  "SIGTERM was consumed. Taking it upon ourselves to deliver it.",  v5,  2u);
    }

    pid_t v4 = getpid();
    kill(v4, 15);
  }

  dispatch_source_cancel((dispatch_source_t)listenForSigterm_sigtermSource);
}

BOOL _LSServerHasDoneFirstBootWork()
{
  int v0 = sem_open("com.apple.lsd.firstboot", 0);
  dispatch_queue_t v1 = v0;
  if (v0 != (sem_t *)-1LL) {
    sem_close(v0);
  }
  return v1 != (sem_t *)-1LL;
}

void moveItemAtURLToURL(void *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (!v3 || !v4)
  {
    _LSDefaultLog();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v25 = v3;
      __int16 v26 = 2112;
      BOOL v27 = v5;
      char v15 = "LaunchServices: failed trying to migrate file %@ to %@";
      id v16 = v14;
      uint32_t v17 = 22;
LABEL_10:
      _os_log_impl(&dword_183E58000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    }

void setBackupAttributesForURL(void *a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    uint64_t v3 = *MEMORY[0x189603C50];
    id v9 = 0LL;
    char v4 = [v1 setResourceValue:MEMORY[0x189604A88] forKey:v3 error:&v9];
    id v5 = v9;
    if ((v4 & 1) == 0)
    {
      _LSDefaultLog();
      sigset_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        [v5 domain];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = [v5 code];
        *(_DWORD *)__int128 buf = 138478339;
        char v11 = v2;
        __int16 v12 = 2114;
        int v13 = v7;
        __int16 v14 = 2048;
        uint64_t v15 = v8;
        _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_DEFAULT,  "Error excluding %{private}@ from backup: %{public}@ %lli",  buf,  0x20u);
      }
    }
  }
}

void __seedDatabase_block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(&OBJC_CLASS___LSDatabaseBuilder);
  _LSServer_GetIOQueue();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = -[LSDatabaseBuilder initWithIOQueue:](v2, "initWithIOQueue:", v3);

  -[LSDatabaseBuilder createAndSeedLocalDatabase:]( v4,  "createAndSeedLocalDatabase:",  *(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

void __seedDatabase_block_invoke_2()
{
}

void __performFirstBootWorkIfNecessary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v9 = 0LL;
  id v10 = 0LL;
  int inited = _LSContextInitReturningError((uint64_t)&v10, (uint64_t)&v9);
  id v7 = v9;
  if (inited)
  {
    _LSServerCleanEphemeralMobileContainersForFirstBoot((uint64_t *)&v10);
  }

  else
  {
    _LSDefaultLog();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __performFirstBootWorkIfNecessary_block_invoke_cold_1((uint64_t)v7, v8);
    }
  }
}

void sub_183F6EBB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

uint64_t (*init_EXStartService())()
{
  int v0 = (void *)ExtensionFoundationLibrary_frameworkLibrary;
  if (!ExtensionFoundationLibrary_frameworkLibrary)
  {
    int v0 = dlopen("/System/Library/Frameworks/ExtensionFoundation.framework/ExtensionFoundation", 2);
    ExtensionFoundationLibrary_frameworkLibrary = (uint64_t)v0;
  }

  uint64_t result = (uint64_t (*)())dlsym(v0, "_EXStartService");
  softLink_EXStartService = result;
  if (result) {
    return (uint64_t (*)())result();
  }
  return result;
}

void languagePrefChanged()
{
  int v0 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v0, 0xFFFFFFFFFFFFFFFFLL);

  _LSDatabaseGetInstallingGroup();
  id v1 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v1, 0xFFFFFFFFFFFFFFFFLL);

  _LSDatabaseGetMobileInstallSyncupGroup();
  id v2 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  _LSServer_DatabaseExecutionContext();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[LSDBExecutionContext syncWrite:]((uint64_t)v3, &__block_literal_global_42_0);
}

void __languagePrefChanged_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  _LSSaveImmediately(1);
  MEMORY[0x186E2AFE0]();
  _LSDefaultLog();
  sigset_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_DEFAULT,  "LaunchServices: received languagePrefChanged notification, exiting.",  v7,  2u);
  }

  exit(0);
}

void OUTLINED_FUNCTION_0_9( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int *OUTLINED_FUNCTION_4_7()
{
  return __error();
}

void sub_183F6EF08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_183F6F0A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F6F154( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F6F234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F6F314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F6F818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F6F93C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_183F6F9A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F6FC6C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_183F6FDEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_183F6FF80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F70098( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_183F70208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F702A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

Class initFBSOpenApplicationOptions(void)
{
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary) {
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/FrontBoardServices. framework/FrontBoardServices",  2);
  }
  Class result = objc_getClass("FBSOpenApplicationOptions");
  classFBSOpenApplicationOptions = (uint64_t)result;
  getFBSOpenApplicationOptionsClass = (uint64_t (*)(void))FBSOpenApplicationOptionsFunction;
  return result;
}

id FBSOpenApplicationOptionsFunction(void)
{
  return (id)classFBSOpenApplicationOptions;
}

Class initFBSProcessHandle(void)
{
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary) {
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/FrontBoardServices. framework/FrontBoardServices",  2);
  }
  Class result = objc_getClass("FBSProcessHandle");
  classFBSProcessHandle = (uint64_t)result;
  getFBSProcessHandleClass = (uint64_t (*)(void))FBSProcessHandleFunction;
  return result;
}

id FBSProcessHandleFunction(void)
{
  return (id)classFBSProcessHandle;
}

void __serviceQueue_block_invoke()
{
  id v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("LS installation serial queue", v2);
  id v1 = (void *)serviceQueue_queue;
  serviceQueue_queue = (uint64_t)v0;
}

void sub_183F7077C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F70868( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F709A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F70A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F70F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F710E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F71228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F71458( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_183F716F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_183F71F58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_183F72228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F722DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F726F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, void *a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, id a32)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__39(uint64_t a1)
{
}

void _LSStringLocalizerPrewarmAllLocalizations(_LSStringLocalizer *a1)
{
  id v1 = a1;
  uint64_t stringsContent = (uint64_t)v1->_stringsContent;
  p_isa = (void **)&v1->super.isa;
  -[_LSStringLocalizer bundleProvider](v1, "bundleProvider");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = (__CFBundle *)LSBundleProvider::bundleRef((LSBundleProvider *)[v3 provider], 1, 0);
  -[_LSStringsFileContent prewarmAllLocalizationsWithBundle:forLocalizations:](stringsContent, v4, p_isa[3]);
}

void sub_183F7286C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F72A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F72CAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_183F730F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, void *a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, id a32)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_183F733C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F735F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_183F73774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F737C8()
{
}

void sub_183F73948( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_183F73AC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F73B68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F73BFC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_183F73CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F73D30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F73DEC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F74038(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F74300( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_183F74448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F746DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_183F74940( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_183F74B10(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_183F74CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F74ED8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id a28)
{
  char v32 = v30;

  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_183F750D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F751D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F753A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, CFTypeRef cf)
{
  if (v14)
  {
    CFRelease(v14);
    if (!v13)
    {
LABEL_4:
      if (cf) {
        CFRelease(cf);
      }

      _Unwind_Resume(a1);
    }
  }

  else if (!v13)
  {
    goto LABEL_4;
  }

  CFRelease(v13);
  goto LABEL_4;
}

void sub_183F75520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL18_LSSetCrashMessageP8NSString_block_invoke_1(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  id v2 = v1;
  if (v1)
  {
    id v3 = strdup((const char *)[v1 UTF8String]);
    _LSDefaultLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      ___ZL18_LSSetCrashMessageP8NSString_block_invoke_cold_1_0((uint64_t)v3, v4);
    }
  }

  else
  {
    id v3 = 0LL;
  }

  uint64_t v5 = _LSSetCrashReporterMessage(NSString *)::messagePtr;
  while (1)
  {
    unint64_t v6 = __ldxr((unint64_t *)&_LSSetCrashReporterMessage(NSString *)::messagePtr);
    if (v6 != v5) {
      break;
    }
    if (!__stxr((unint64_t)v3, (unint64_t *)&_LSSetCrashReporterMessage(NSString *)::messagePtr))
    {
      int v7 = 1;
      goto LABEL_11;
    }
  }

  int v7 = 0;
  __clrex();
LABEL_11:
  if (v7) {
    uint64_t v8 = (void *)v5;
  }
  else {
    uint64_t v8 = v3;
  }
  free(v8);
  qword_18C49A7B0 = _LSSetCrashReporterMessage(NSString *)::messagePtr;
}

void sub_183F7565C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL15_LSLoggingQueuev_block_invoke_1()
{
  id v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.launchservices.logging", v2);
  id v1 = (void *)_LSLoggingQueue(void)::logQueue;
  _LSLoggingQueue(void)::logQueue = (uint64_t)v0;
}

void ___ZL20_LSClearCrashMessagev_block_invoke()
{
  uint64_t v0 = _LSSetCrashReporterMessage(NSString *)::messagePtr;
  while (1)
  {
    unint64_t v1 = __ldxr((unint64_t *)&_LSSetCrashReporterMessage(NSString *)::messagePtr);
    if (v1 != v0) {
      break;
    }
    if (!__stxr(0LL, (unint64_t *)&_LSSetCrashReporterMessage(NSString *)::messagePtr))
    {
      int v2 = 1;
      goto LABEL_6;
    }
  }

  int v2 = 0;
  __clrex();
LABEL_6:
  if (v2) {
    id v3 = (void *)v0;
  }
  else {
    id v3 = 0LL;
  }
  free(v3);
  qword_18C49A7B0 = _LSSetCrashReporterMessage(NSString *)::messagePtr;
}

void LSBundleProvider::LSBundleProvider(LSBundleProvider *this, CFTypeRef cf)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (cf)
  {
    CFRetain(cf);
    *(void *)this = cf;
    *((void *)this + 1) = 0LL;
    *((_DWORD *)this + 5) = 0;
    *((_BYTE *)this + 16) = 1;
    uint64_t Unique = _CFBundleCreateUnique();
    uint64_t v5 = (const void *)*((void *)this + 1);
    unint64_t v6 = (const void *)Unique;
    if (v5 != (const void *)Unique)
    {
      *((void *)this + 1) = Unique;
      unint64_t v6 = v5;
    }

    if (v6)
    {
      CFRelease(v6);
      uint64_t Unique = *((void *)this + 1);
    }

    if (!Unique)
    {
      _LSRegistrationLog();
      int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)this;
        int v9 = 138477827;
        uint64_t v10 = v8;
        _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_ERROR,  "Unable to create bundleRef for %{private}@",  (uint8_t *)&v9,  0xCu);
      }
    }
  }

  else
  {
    *((_DWORD *)this + 5) = 0;
    *(void *)this = 0LL;
    *((void *)this + 1) = 0LL;
    *((_BYTE *)this + 16) = 0;
  }

{
  LSBundleProvider::LSBundleProvider(this, cf);
}

void sub_183F7583C(_Unwind_Exception *exception_object)
{
}

void LSBundleProvider::LSBundleProvider(LSBundleProvider *this, void *cf)
{
  *((_DWORD *)this + 5) = 0;
  *(void *)this = 0LL;
  *((void *)this + 1) = 0LL;
  if (cf)
  {
    CFRetain(cf);
    id v4 = (const void *)*((void *)this + 1);
    CFTypeRef v5 = cf;
    if (v4 == cf || (*((void *)this + 1) = cf, (CFTypeRef v5 = v4) != 0LL)) {
      CFRelease(v5);
    }
    CFURLRef v6 = CFBundleCopyBundleURL((CFBundleRef)cf);
    int v7 = *(const __CFURL **)this;
    if (*(CFURLRef *)this != v6)
    {
      *(void *)this = v6;
      CFURLRef v6 = v7;
    }

    if (v6) {
      CFRelease(v6);
    }
  }

void sub_183F758F8(_Unwind_Exception *exception_object)
{
  id v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  *(void *)(v1 + _Block_object_dispose((const void *)(v1 - 176), 8) = 0LL;
  if (*(void *)v1) {
    CFRelease(*(CFTypeRef *)v1);
  }
  *(void *)uint64_t v1 = 0LL;
  _Unwind_Resume(exception_object);
}

void LSBundleProvider::~LSBundleProvider(LSBundleProvider *this)
{
  int v2 = (const void *)*((void *)this + 1);
  if (v2) {
    CFRelease(v2);
  }
  *((void *)this + 1) = 0LL;
  if (*(void *)this) {
    CFRelease(*(CFTypeRef *)this);
  }
  *(void *)this = 0LL;
}

uint64_t LSBundleProvider::bundleRef(LSBundleProvider *this, BOOL a2, const char *a3)
{
  return *((void *)this + 1);
}

__CFBundle *LSBundleProvider::bundleIdentifier(LSBundleProvider *this)
{
  CFStringRef Identifier = (__CFBundle *)*((void *)this + 1);
  if (Identifier) {
    CFStringRef Identifier = (__CFBundle *)CFBundleGetIdentifier(Identifier);
  }
  return Identifier;
}

__CFBundle *LSBundleProvider::infoDictionary(LSBundleProvider *this)
{
  InfoDictionary = (__CFBundle *)*((void *)this + 1);
  if (InfoDictionary) {
    InfoDictionary = CFBundleGetInfoDictionary(InfoDictionary);
  }
  return InfoDictionary;
}

__CFBundle *LSBundleProvider::CFBundleCopyExecutableURL(LSBundleProvider *this)
{
  Class result = (__CFBundle *)*((void *)this + 1);
  if (result) {
    return CFBundleCopyExecutableURL(result);
  }
  return result;
}

__CFBundle *LSBundleProvider::CFBundleCopyResourceURL( LSBundleProvider *this, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  Class result = (__CFBundle *)*((void *)this + 1);
  if (result) {
    return CFBundleCopyResourceURL(result, a2, a3, a4);
  }
  return result;
}

CFStringRef LSBundleProvider::CFBundleCopyDevelopmentRegion(LSBundleProvider *this)
{
  uint64_t v1 = (__CFBundle *)*((void *)this + 1);
  if (!v1) {
    return 0LL;
  }
  CFStringRef DevelopmentRegion = CFBundleGetDevelopmentRegion(v1);
  CFStringRef v3 = DevelopmentRegion;
  if (DevelopmentRegion) {
    CFRetain(DevelopmentRegion);
  }
  return v3;
}

__CFBundle *LSBundleProvider::CFBundleCopyBundleLocalizations(LSBundleProvider *this)
{
  Class result = (__CFBundle *)*((void *)this + 1);
  if (result) {
    return CFBundleCopyBundleLocalizations(result);
  }
  return result;
}

__CFBundle *LSBundleProvider::copyIconResourceURL( LSBundleProvider *this, const __CFString *a2, const __CFString *a3)
{
  Class result = (__CFBundle *)*((void *)this + 1);
  if (result)
  {
    Class result = CFBundleCopyResourceURLForLocalization(result, a2, a3, 0LL, 0LL);
  }

  return result;
}

__CFBundle *LSBundleProvider::intentURLPaths(LSBundleProvider *this)
{
  uint64_t v1 = (__CFBundle *)*((void *)this + 1);
  if (v1)
  {
    if (softLinkINSchemaURLsForIntentNamesWithBundle)
    {
      softLinkINSchemaURLsForIntentNamesWithBundle(v1);
      uint64_t v1 = (__CFBundle *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v1 = 0LL;
    }
  }

  return v1;
}

__CFBundle *LSBundleProvider::XCFBundleCopyFolderURL(LSBundleProvider *this, const __CFString *a2)
{
  Class result = (__CFBundle *)*((void *)this + 1);
  if (result) {
    return XCFBundleCopyFolderURL(result, a2);
  }
  return result;
}

void sub_183F75BD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F75C78(_Unwind_Exception *a1)
{
  id v4 = v3;
  operator delete(v4);

  _Unwind_Resume(a1);
}

void sub_183F75D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F75E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F7600C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void sub_183F76250( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  os_unfair_lock_unlock(v18);
  _Unwind_Resume(a1);
}

uint64_t std::optional<NSError * {__strong}>::operator=[abi:nn180100]<NSError * {__strong}&,void>( uint64_t a1, id *a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 8);
  id v4 = *a2;
  if (v3)
  {
    CFTypeRef v5 = *(void **)a1;
    *(void *)a1 = v4;
  }

  else
  {
    *(void *)a1 = v4;
    *(_BYTE *)(a1 + _Block_object_dispose((const void *)(v1 - 176), 8) = 1;
  }

  return a1;
}

void sub_183F76428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F76658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F76B28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *a22, void *a23, void *a24, uint64_t a25, void *a26, void *a27, void *a28, void *a29, void *a30, void *a31)
{
  _Unwind_Resume(a1);
}

void sub_183F77278(_Unwind_Exception *a1)
{
  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)(v6 - 160));
  _Unwind_Resume(a1);
}

void sub_183F7750C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id registrationCleanupQueue(void)
{
  return (id)registrationCleanupQueue(void)::queue;
}

void sub_183F77728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F7792C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, id a34)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v36 - 128), 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

uint64_t __Block_byref_object_copy__118(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x186E2A7B8](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__119(uint64_t a1)
{
}

void sub_183F77CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F77E84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F77FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F780BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_183F78128( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F78190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F781F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F782E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F78370( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_183F78420( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_183F78494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F78530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F7864C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_183F787F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F78998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F78B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F78C3C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZL24registrationCleanupQueuev_block_invoke()
{
  int v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.lsd.registration.postprocessing", v2);
  uint64_t v1 = (void *)registrationCleanupQueue(void)::queue;
  registrationCleanupQueue(void)::queue = (uint64_t)v0;
}

BOOL _LSIsSWCAvailable()
{
  dispatch_queue_t v0 = (void *)SharedWebCredentialsLibrary(void)::frameworkLibrary;
  if (!SharedWebCredentialsLibrary(void)::frameworkLibrary)
  {
    dispatch_queue_t v0 = dlopen("/System/Library/PrivateFrameworks/SharedWebCredentials.framework/SharedWebCredentials", 2);
    SharedWebCredentialsLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }

  return v0 != 0LL;
}

uint64_t _LSSWCServiceTypeActivityContinuation()
{
  return get_SWCServiceTypeActivityContinuation();
}

uint64_t _LSSWCServiceTypeAppLinks()
{
  return get_SWCServiceTypeAppLinks();
}

uint64_t _LSSWCErrorDomain()
{
  return get_SWCErrorDomain();
}

uint64_t _LSSWCServiceDetailsClass()
{
  return get_SWCServiceDetailsClass();
}

uint64_t _LSSWCServiceSettingsClass()
{
  return get_SWCServiceSettingsClass();
}

uint64_t _LSSWCServiceSpecifierClass()
{
  return get_SWCServiceSpecifierClass();
}

uint64_t init_SWCServiceTypeActivityContinuation(void)
{
  dispatch_queue_t v0 = (void *)SharedWebCredentialsLibrary(void)::frameworkLibrary;
  if (!SharedWebCredentialsLibrary(void)::frameworkLibrary)
  {
    dispatch_queue_t v0 = dlopen("/System/Library/PrivateFrameworks/SharedWebCredentials.framework/SharedWebCredentials", 2);
    SharedWebCredentialsLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }

  uint64_t result = *(void *)dlsym(v0, "_SWCServiceTypeActivityContinuation");
  constant_SWCServiceTypeActivityContinuation = result;
  get_SWCServiceTypeActivityContinuation = _SWCServiceTypeActivityContinuationFunction;
  return result;
}

uint64_t _SWCServiceTypeActivityContinuationFunction(void)
{
  return constant_SWCServiceTypeActivityContinuation;
}

uint64_t init_SWCServiceTypeAppLinks(void)
{
  dispatch_queue_t v0 = (void *)SharedWebCredentialsLibrary(void)::frameworkLibrary;
  if (!SharedWebCredentialsLibrary(void)::frameworkLibrary)
  {
    dispatch_queue_t v0 = dlopen("/System/Library/PrivateFrameworks/SharedWebCredentials.framework/SharedWebCredentials", 2);
    SharedWebCredentialsLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }

  uint64_t result = *(void *)dlsym(v0, "_SWCServiceTypeAppLinks");
  constant_SWCServiceTypeAppLinks = result;
  get_SWCServiceTypeAppLinks = _SWCServiceTypeAppLinksFunction;
  return result;
}

uint64_t _SWCServiceTypeAppLinksFunction(void)
{
  return constant_SWCServiceTypeAppLinks;
}

uint64_t init_SWCErrorDomain(void)
{
  dispatch_queue_t v0 = (void *)SharedWebCredentialsLibrary(void)::frameworkLibrary;
  if (!SharedWebCredentialsLibrary(void)::frameworkLibrary)
  {
    dispatch_queue_t v0 = dlopen("/System/Library/PrivateFrameworks/SharedWebCredentials.framework/SharedWebCredentials", 2);
    SharedWebCredentialsLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }

  uint64_t result = *(void *)dlsym(v0, "_SWCErrorDomain");
  constant_SWCErrorDomain = result;
  get_SWCErrorDomain = _SWCErrorDomainFunction;
  return result;
}

uint64_t _SWCErrorDomainFunction(void)
{
  return constant_SWCErrorDomain;
}

Class init_SWCServiceDetails(void)
{
  if (!SharedWebCredentialsLibrary(void)::frameworkLibrary) {
    SharedWebCredentialsLibrary(void)::frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/SharedWebCredenti als.framework/SharedWebCredentials",  2);
  }
  Class result = objc_getClass("_SWCServiceDetails");
  class_SWCServiceDetails = (uint64_t)result;
  get_SWCServiceDetailsClass = (uint64_t (*)(void))_SWCServiceDetailsFunction;
  return result;
}

id _SWCServiceDetailsFunction(void)
{
  return (id)class_SWCServiceDetails;
}

Class init_SWCServiceSettings(void)
{
  if (!SharedWebCredentialsLibrary(void)::frameworkLibrary) {
    SharedWebCredentialsLibrary(void)::frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/SharedWebCredenti als.framework/SharedWebCredentials",  2);
  }
  Class result = objc_getClass("_SWCServiceSettings");
  class_SWCServiceSettings = (uint64_t)result;
  get_SWCServiceSettingsClass = (uint64_t (*)(void))_SWCServiceSettingsFunction;
  return result;
}

id _SWCServiceSettingsFunction(void)
{
  return (id)class_SWCServiceSettings;
}

Class init_SWCServiceSpecifier(void)
{
  if (!SharedWebCredentialsLibrary(void)::frameworkLibrary) {
    SharedWebCredentialsLibrary(void)::frameworkLibrary = (uint64_t)dlopen( "/System/Library/PrivateFrameworks/SharedWebCredenti als.framework/SharedWebCredentials",  2);
  }
  Class result = objc_getClass("_SWCServiceSpecifier");
  class_SWCServiceSpecifier = (uint64_t)result;
  get_SWCServiceSpecifierClass = (uint64_t (*)(void))_SWCServiceSpecifierFunction;
  return result;
}

id _SWCServiceSpecifierFunction(void)
{
  return (id)class_SWCServiceSpecifier;
}

void sub_183F7929C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F792FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F7991C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

id LaunchServices::URLOverrides::getLog(LaunchServices::URLOverrides *this)
{
  return (id)LaunchServices::URLOverrides::getLog(void)::result;
}

void sub_183F79B58( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __int16 v12 = v11;

  _Unwind_Resume(a1);
}

id _LSServer_GetiCloudHostNames()
{
  dispatch_queue_t v0 = (LaunchServices::URLOverrides *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"/var/mobile/Library/Caches/CloudKit/com.apple.cloudkit.launchservices.hostnames.plist" isDirectory:0];
  LaunchServices::URLOverrides::getLog(v0);
  uint64_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    _LSServer_GetiCloudHostNames_cold_2();
  }

  LaunchServices::URLOverrides::getiCloudHostNamesFromPlistAtURL(v0, v2);
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v4 = (LaunchServices::URLOverrides *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:@"/System/Library/CoreServices/com.apple.cloudkit.launchservices.hostnames.plist" isDirectory:0];
    LaunchServices::URLOverrides::getLog(v4);
    CFTypeRef v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      _LSServer_GetiCloudHostNames_cold_2();
    }

    LaunchServices::URLOverrides::getiCloudHostNamesFromPlistAtURL(v4, v6);
    int v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      LaunchServices::URLOverrides::getLog(v7);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        _LSServer_GetiCloudHostNames_cold_1();
      }

      [MEMORY[0x189604010] setWithArray:&unk_189DA8508];
      int v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v3;
}

void sub_183F79D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id LaunchServices::URLOverrides::getiCloudHostNamesFromPlistAtURL( LaunchServices::URLOverrides *this, NSURL *a2)
{
  int v2 = this;
  id v12 = 0LL;
  [MEMORY[0x189603F68] dictionaryWithContentsOfURL:v2 error:&v12];
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = (LaunchServices::URLOverrides *)v12;
  CFTypeRef v5 = v4;
  if (!v3)
  {
    LaunchServices::URLOverrides::getLog(v4);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      LaunchServices::URLOverrides::getiCloudHostNamesFromPlistAtURL((uint64_t)v2);
    }
    goto LABEL_12;
  }

  uint64_t v6 = objc_opt_class();
  [v3 objectForKey:@"host-names"];
  int v7 = (LaunchServices::URLOverrides *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_10;
    }
  }

  else if (!v7)
  {
LABEL_10:
    LaunchServices::URLOverrides::getLog(v7);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      LaunchServices::URLOverrides::getiCloudHostNamesFromPlistAtURL();
    }
LABEL_12:
    uint64_t v10 = 0LL;
    goto LABEL_13;
  }

  -[LaunchServices::URLOverrides valueForKey:](v8, "valueForKey:", @"lowercaseString");
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189604010] setWithArray:v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v10;
}

void sub_183F79EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id LaunchServices::URLOverrides::getURLOverrideCommon(LaunchServices::URLOverrides *this, NSURL *a2)
{
  int v3 = this;
  uint64_t v20 = 0LL;
  char v21 = (id *)&v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = __Block_byref_object_copy__41;
  unint64_t v24 = __Block_byref_object_dispose__41;
  id v25 = 0LL;
  id v4 = (LaunchServices::URLOverrides *)_os_feature_enabled_impl();
  if ((_DWORD)v4)
  {
    LaunchServices::URLOverrides::getLog(v4);
    CFTypeRef v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[_LSURLOverride initWithOriginalURL:checkingForAvailableApplications:].cold.3();
    }
  }

  else if (_LSCurrentProcessMayMapDatabase() {
         && ([(id)__LSDefaultsGetSharedInstance() isServer] & 1) == 0)
  }
  {
    int v9 = -[_LSURLOverride initWithOriginalURL:](objc_alloc(&OBJC_CLASS____LSURLOverride), "initWithOriginalURL:", v3);
    CFTypeRef v5 = (os_log_s *)v9;
    if (v9)
    {
      uint64_t v10 = -[_LSURLOverride overrideURL](v9, "overrideURL");
      id v11 = v21[5];
      void v21[5] = (id)v10;
    }
  }

  else
  {
    uint64_t v6 = MEMORY[0x1895F87A8];
    v18[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
    v18[1] = (void (*)(void, void))3221225472LL;
    _OWORD v18[2] = (void (*)(void, void))___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke;
    v18[3] = (void (*)(void, void))&unk_189D72860;
    int v7 = v3;
    uint64_t v19 = v7;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDOpenService, v18);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    v15[1] = 3221225472LL;
    _OWORD v15[2] = ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_180;
    void v15[3] = &unk_189D78E50;
    uint32_t v17 = &v20;
    uint64_t v16 = v7;
    [v8 getURLOverrideForURL:v16 completionHandler:v15];

    CFTypeRef v5 = v19;
  }

  id v12 = v21[5];
  if (!v12)
  {
    objc_storeStrong(v21 + 5, this);
    id v12 = v21[5];
  }

  id v13 = v12;
  _Block_object_dispose(&v20, 8);

  return v13;
}

void sub_183F7A11C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, id a26)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_183F7A358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F7A440( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

BOOL LaunchServices::URLOverrides::State::pathHasCaseInsensitivePrefix(id *this, NSString *a2)
{
  int v3 = a2;
  [*this path];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  CFTypeRef v5 = v4;
  if (v4) {
    BOOL v6 = [v4 rangeOfString:v3 options:9] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v6 = 0LL;
  }

  return v6;
}

void sub_183F7A4C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F7A640(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_183F7A73C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F7A7E4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_183F7A87C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_183F7A914( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_183F7A99C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_183F7AA2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void sub_183F7AAB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

LaunchServices::URLOverrides::State *LaunchServices::URLOverrides::State::State( LaunchServices::URLOverrides::State *this, NSURLComponents *a2, char a3)
{
  CFTypeRef v5 = a2;
  *(void *)this = v5;
  *((_BYTE *)this + _Block_object_dispose((const void *)(v1 - 176), 8) = a3;
  *(_DWORD *)((char *)this + 9) = 0;
  BOOL v6 = (BOOL *)this + 9;
  *((_BYTE *)this + 13) = 0;
  -[NSURLComponents scheme](v5, "scheme");
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 caseInsensitiveCompare:@"http"];
    *BOOL v6 = v9 == 0;
    if (v9)
    {
      BOOL v10 = [v8 caseInsensitiveCompare:@"https"] == 0;
      int v11 = *v6;
    }

    else
    {
      BOOL v10 = 0;
      int v11 = 1;
    }

    BOOL v12 = 0;
    *((_BYTE *)this + 10) = v10;
    if (!v11 && !v10) {
      BOOL v12 = [v8 caseInsensitiveCompare:@"itms"] == 0;
    }
    *((_BYTE *)this + 11) = v12;
  }

  if (*v6 || *((_BYTE *)this + 10))
  {
    id v13 = v5;
    pthread_mutex_lock(&LaunchServices::URLOverrides::checkForiCloudHost(NSURLComponents *)::lock);
    if (!LaunchServices::URLOverrides::checkForiCloudHost(NSURLComponents *)::cachedICloudHosts
      || (double v14 = *(double *)&LaunchServices::URLOverrides::checkForiCloudHost(NSURLComponents *)::nextFetchTime,
          [MEMORY[0x189603F50] timeIntervalSinceReferenceDate],
          v14 < v15))
    {
      uint64_t v16 = [(id)__LSDefaultsGetSharedInstance() isServer];
      if ((v16 & 1) != 0 || (uint64_t v16 = [(id)__LSDefaultsGetSharedInstance() hasServer], (v16 & 1) == 0))
      {
        LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)v16);
        uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          LaunchServices::URLOverrides::State::State();
        }

        _LSServer_GetiCloudHostNames();
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v20 = [v18 copy];
        char v21 = (void *)LaunchServices::URLOverrides::checkForiCloudHost(NSURLComponents *)::cachedICloudHosts;
        LaunchServices::URLOverrides::checkForiCloudHost(NSURLComponents *)::cachedICloudHosts = v20;
      }

      else
      {
        LaunchServices::URLOverrides::getLog((LaunchServices::URLOverrides *)v16);
        uint32_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          LaunchServices::URLOverrides::State::State();
        }

        +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDOpenService, 0LL);
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 getiCloudHostNamesWithCompletionHandler:&__block_literal_global_192];
      }

      [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
      *(double *)&LaunchServices::URLOverrides::checkForiCloudHost(NSURLComponents *)::nextFetchTime = v22 + 86400.0;
    }

    id v23 = (void *)[(id)LaunchServices::URLOverrides::checkForiCloudHost(NSURLComponents *)::cachedICloudHosts copy];
    pthread_mutex_unlock(&LaunchServices::URLOverrides::checkForiCloudHost(NSURLComponents *)::lock);
    -[NSURLComponents host](v13, "host");
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 lowercaseString];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25) {
      char v26 = [v23 containsObject:v25];
    }
    else {
      char v26 = 0;
    }

    *((_BYTE *)this + 12) = v26;
  }

  int v27 = [(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure];
  if (!LaunchServices::URLOverrides::gUseMacOverrides) {
    int v27 = 0;
  }
  if (v27 == 1) {
    *((_BYTE *)this + 13) = [(id)LaunchServices::URLOverrides::gUseMacOverrides BOOLValue];
  }

  return this;
}

void sub_183F7AD9C(_Unwind_Exception *a1)
{
  CFTypeRef v5 = v4;

  _Unwind_Resume(a1);
}

LaunchServices::URLOverrides::State *LaunchServices::URLOverrides::State::State( LaunchServices::URLOverrides::State *this, NSURL *a2, char a3)
{
  CFTypeRef v5 = a2;
  *(void *)this = 0LL;
  *(void *)((char *)this + 6) = 0LL;
  BOOL v6 = (NSURLComponents *)[objc_alloc(MEMORY[0x189607A50]) initWithURL:v5 resolvingAgainstBaseURL:1];
  if (!v6) {
    BOOL v6 = (NSURLComponents *)objc_alloc_init(MEMORY[0x189607A50]);
  }
  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)&obj, v6, a3);
  objc_storeStrong((id *)this, obj);
  *((_DWORD *)this + 2) = v9;
  *((_WORD *)this + 6) = v10;

  return this;
}

void sub_183F7AEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLOverrides::State::isNooverride(id *this)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  int v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 hasSuffix:@":nooverride"];
  }
  else {
    uint64_t v3 = 0LL;
  }

  return v3;
}

void sub_183F7AF40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F7B074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F7B158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F7B7B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23, uint64_t a24, void *a25, void *a26)
{
  _Unwind_Resume(a1);
}

void sub_183F7BDB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_183F7C070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F7C1D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F7C3D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F7C4E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN14LaunchServices12URLOverridesL6getLogEv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.launchservices", "urloverrides");
  uint64_t v1 = (void *)LaunchServices::URLOverrides::getLog(void)::result;
  LaunchServices::URLOverrides::getLog(void)::Class result = (uint64_t)v0;
}

uint64_t __Block_byref_object_copy__41(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__41(uint64_t a1)
{
}

void ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  LaunchServices::URLOverrides::getLog(v3);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_cold_1(a1);
  }
}

void ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_180( uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  int v7 = a3;
  uint64_t v8 = v7;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  }

  else
  {
    LaunchServices::URLOverrides::getLog(v7);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    __int16 v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_180_cold_2(a1);
      }
    }

    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_180_cold_1( a1,  v10,  v11,  v12,  v13,  v14,  v15,  v16);
    }
  }
}

void ___ZN14LaunchServices12URLOverridesL18checkForiCloudHostEP15NSURLComponents_block_invoke( uint64_t a1, void *a2)
{
  id v2 = a2;
  _LSDefaultLog();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    ___ZN14LaunchServices12URLOverridesL18checkForiCloudHostEP15NSURLComponents_block_invoke_cold_1();
  }

  uint64_t v4 = [v2 copy];
  CFTypeRef v5 = (void *)LaunchServices::URLOverrides::checkForiCloudHost(NSURLComponents *)::cachedICloudHosts;
  LaunchServices::URLOverrides::checkForiCloudHost(NSURLComponents *)::cachedICloudHosts = v4;
}

void sub_183F7C6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

  ;
}

id LaunchServices::URLPropertyProvider::getUTTypeClass(LaunchServices::URLPropertyProvider *this)
{
  return (id)LaunchServices::URLPropertyProvider::getUTTypeClass(void)::result;
}

id _LSGetURLPropertyClasses()
{
  void v7[4] = *MEMORY[0x1895F89C0];
  XNSGetPropertyListClasses();
  os_log_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  _DWORD v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v7 count:4];
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 setByAddingObjectsFromArray:v1];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  id UTTypeClass = LaunchServices::URLPropertyProvider::getUTTypeClass(v3);
  if (UTTypeClass)
  {
    uint64_t v5 = [v2 setByAddingObject:UTTypeClass];

    id v2 = (void *)v5;
  }

  return v2;
}

void sub_183F7C824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _LSURLPropertiesNeedReplacement(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v2 = v1 != 0LL;

  return v2;
}

id _LSReplaceURLPropertyValueForEncoding(void *a1)
{
  id v1 = a1;
  if (LaunchServices::URLPropertyProvider::getUTTypeClass((LaunchServices::URLPropertyProvider *)v1)
    && (objc_opt_isKindOfClass() & 1) != 0
    && [v1 _shouldURLPropertyProviderEncodeTypeRecord])
  {
    uint64_t v2 = [v1 _typeRecord];

    id v1 = (id)v2;
  }

  return v1;
}

void sub_183F7C8F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LaunchServices::URLPropertyProvider *_LSReplaceURLPropertyValueForDecoding(void *a1)
{
  id v1 = a1;
  id UTTypeClass = LaunchServices::URLPropertyProvider::getUTTypeClass(v1);
  if (UTTypeClass)
  {
    uint64_t v3 = UTTypeClass;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v4 = [v3 _typeForURLPropertyProviderWithTypeRecord:v1];

      id v1 = (LaunchServices::URLPropertyProvider *)v4;
    }
  }

  return v1;
}

void sub_183F7C96C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _LSEncodeURLPropertyDictionary(void *a1)
{
  id v1 = a1;
  [v1 objectForKeyedSubscript:*MEMORY[0x189604BD0]];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    uint64_t v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v1, "count"));
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    _DWORD v7[2] = ___LSEncodeURLPropertyDictionary_block_invoke;
    v7[3] = &unk_189D74918;
    id v4 = v3;
    id v8 = v4;
    [v1 enumerateKeysAndObjectsUsingBlock:v7];
    uint64_t v5 = [v4 copy];

    id v1 = (id)v5;
  }

  return v1;
}

void sub_183F7CA58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_183F7CAF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id _LSDecodeURLPropertyDictionary(void *a1)
{
  id v1 = a1;
  [v1 objectForKeyedSubscript:*MEMORY[0x189604BD0]];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    uint64_t v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FC8]), "initWithCapacity:", objc_msgSend(v1, "count"));
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    _DWORD v7[2] = ___LSDecodeURLPropertyDictionary_block_invoke;
    v7[3] = &unk_189D74918;
    id v4 = v3;
    id v8 = v4;
    [v1 enumerateKeysAndObjectsUsingBlock:v7];
    uint64_t v5 = [v4 copy];

    id v1 = (id)v5;
  }

  return v1;
}

void sub_183F7CBE4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_183F7CC7C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id _LSResolveRemoteURLPropertiesWithMimic(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  [v7 URL];
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ls_setPreferredLocalizations:", v8);
  [v10 setTemporaryResourceValue:v7 forKey:@"_LSMimicKey"];
  [v9 allObjects];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 resourceValuesForKeys:v11 error:a4];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  [v10 removeCachedResourceValueForKey:@"_LSMimicKey"];
  return v12;
}

void sub_183F7CD5C(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void _LSRegisterFilePropertyProvider()
{
  __p = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  os_log_t v0 = 0LL;
  id v1 = *(void **)(LaunchServices::URLPropertyProvider::propertyTable + 8);
  uint64_t v2 = *(void **)LaunchServices::URLPropertyProvider::propertyTable;
  do
  {
    if (v0 >= v14)
    {
      uint64_t v3 = (v0 - __p) >> 3;
      unint64_t v4 = (v14 - __p) >> 2;
      if (v4 <= v3 + 1) {
        unint64_t v4 = v3 + 1;
      }
      else {
        unint64_t v5 = v4;
      }
      if (v5) {
        id v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<os_eligibility_answer_t>>((uint64_t)&v14, v5);
      }
      else {
        id v6 = 0LL;
      }
      id v7 = &v6[8 * v3];
      *(void *)id v7 = *v2;
      os_log_t v0 = v7 + 8;
      id v8 = v13;
      if (v13 != __p)
      {
        do
        {
          uint64_t v9 = *((void *)v8 - 1);
          v8 -= 8;
          *((void *)v7 - 1) = v9;
          v7 -= 8;
        }

        while (v8 != __p);
        id v8 = __p;
      }

      __p = v7;
      uint64_t v14 = &v6[8 * v5];
      if (v8) {
        operator delete(v8);
      }
    }

    else
    {
      *(void *)os_log_t v0 = *v2;
      v0 += 8;
    }

    uint64_t v13 = v0;
    v2 += 7;
  }

  while (v2 != v1);
  MEMORY[0x186E29804](LaunchServices::URLPropertyProvider::kLSPropertyProviderCallbacks, 0LL);
  __int16 v10 = *(void **)LaunchServices::URLPropertyProvider::propertyTable;
  uint64_t v11 = *(void **)(LaunchServices::URLPropertyProvider::propertyTable + 8);
  while (v10 != v11)
  {
    MEMORY[0x186E29810](*v10, v10[1], v10[5], v10[6], v10);
    v10 += 7;
  }

  if (__p) {
    operator delete(__p);
  }
}

void sub_183F7CF40( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

id _LSURLPropertyProviderAllKeys()
{
  if (_LSURLPropertyProviderAllKeys::onceToken != -1) {
    dispatch_once(&_LSURLPropertyProviderAllKeys::onceToken, &__block_literal_global_68);
  }
  return (id)_LSURLPropertyProviderAllKeys::result;
}

void sub_183F7D068( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void *___ZN14LaunchServices19URLPropertyProviderL14getUTTypeClassEv_block_invoke()
{
  Class result = objc_getClass("UTType");
  LaunchServices::URLPropertyProvider::getUTTypeClass(void)::Class result = (uint64_t)result;
  if (!result)
  {
    if (UniformTypeIdentifiersLibrary(void)::frameworkLibrary
      || (Class result = dlopen("/System/Library/Frameworks/UniformTypeIdentifiers.framework/UniformTypeIdentifiers", 2),
          (UniformTypeIdentifiersLibrary(void)::frameworkLibrary = (uint64_t)result) != 0))
    {
      Class result = objc_getClass("UTType");
      LaunchServices::URLPropertyProvider::getUTTypeClass(void)::Class result = (uint64_t)result;
    }
  }

  return result;
}

void *___ZL16getPropertyTablev_block_invoke()
{
  {
    uint64_t v20 = *MEMORY[0x189604C20];
    once_createPropertyTable(void)::baseDependencyKeys = *MEMORY[0x189605438];
    *(void *)algn_18C49AD98 = v20;
    uint64_t v21 = *MEMORY[0x189605388];
    qword_18C49ADA0 = *MEMORY[0x189605378];
    unk_18C49ADA8 = v21;
    uint64_t v22 = *MEMORY[0x189604CE8];
    qword_18C49ADB0 = *MEMORY[0x189605448];
    unk_18C49ADB8 = v22;
    uint64_t v23 = *MEMORY[0x189605368];
    qword_18C49ADC0 = *MEMORY[0x189604D10];
    unk_18C49ADC8 = v23;
    uint64_t v24 = *MEMORY[0x189605360];
    qword_18C49ADD0 = *MEMORY[0x1896053E8];
    unk_18C49ADD8 = v24;
  }

  if ((v1 & 1) == 0
  {
    uint64_t v25 = *MEMORY[0x189604C20];
    once_createPropertyTable(void)::isApplicationDependencyKeys = *MEMORY[0x189605438];
    *(void *)algn_18C49AE78 = v25;
    uint64_t v26 = *MEMORY[0x189605388];
    qword_18C49AE80 = *MEMORY[0x189605378];
    unk_18C49AE88 = v26;
    uint64_t v27 = *MEMORY[0x189604CE8];
    qword_18C49AE90 = *MEMORY[0x189605448];
    unk_18C49AE98 = v27;
    uint64_t v28 = *MEMORY[0x189605368];
    qword_18C49AEA0 = *MEMORY[0x189604D10];
    unk_18C49AEA8 = v28;
    uint64_t v29 = *MEMORY[0x189605298];
    qword_18C49AEB0 = *MEMORY[0x1896053E8];
    unk_18C49AEB8 = v29;
  }

  uint64_t v3 = (uint64_t *)MEMORY[0x189605418];
  if ((v2 & 1) == 0
  {
    uint64_t v30 = *v3;
    once_createPropertyTable(void)::distinctLocalizedNameKeys = *MEMORY[0x189605438];
    unk_18C49AE60 = v30;
  }

  if ((v4 & 1) == 0
  {
    uint64_t v31 = *MEMORY[0x1896055A0];
    once_createPropertyTable(void)::volLocNameDependencyKeys = *MEMORY[0x189605670];
    *(void *)algn_18C49AE28 = v31;
    uint64_t v32 = *MEMORY[0x1896053E8];
    qword_18C49AE30 = *MEMORY[0x189605438];
    unk_18C49AE38 = v32;
    uint64_t v33 = *MEMORY[0x189605378];
    qword_18C49AE40 = *MEMORY[0x189605398];
    unk_18C49AE48 = v33;
  }

  if ((v5 & 1) == 0
  {
    once_createPropertyTable(void)::canSetHiddenExtensionKeys = *v3;
  }

  if ((v6 & 1) == 0
  {
    once_createPropertyTable(void)::hiddenBySystemDependencyKeys = *MEMORY[0x189605370];
  }

  {
    uint64_t v34 = *MEMORY[0x189604C20];
    once_createPropertyTable(void)::bindingDependencyKeys = *MEMORY[0x189605438];
    unk_18C49ADF0 = v34;
    uint64_t v35 = *MEMORY[0x189605448];
    qword_18C49ADF8 = *MEMORY[0x189604C60];
    unk_18C49AE00 = v35;
    uint64_t v36 = *MEMORY[0x189604CE8];
    qword_18C49AE08 = *MEMORY[0x189605298];
    unk_18C49AE10 = v36;
    qword_18C49AE18 = *MEMORY[0x189604D10];
  }

  uint64_t v9 = (uint64_t *)MEMORY[0x189605478];
  {
    once_createPropertyTable(void)::typeDescriptionKeys = *v9;
  }

  if ((v10 & 1) != 0)
  {
    uint64_t v11 = *MEMORY[0x189605370];
  }

  else
  {
    uint64_t v11 = *MEMORY[0x189605370];
    if (v37)
    {
      once_createPropertyTable(void)::architecturesDependencyKeys = *MEMORY[0x189605370];
    }
  }

  uint64_t v12 = *MEMORY[0x1896053A0];
  uint64_t v13 = *MEMORY[0x189604B98];
  uint64_t v14 = *MEMORY[0x189604B90];
  uint64_t v15 = *v3;
  uint64_t v16 = *MEMORY[0x189604BE0];
  uint64_t v17 = *MEMORY[0x189604CC8];
  uint64_t v38 = *MEMORY[0x189604CD0];
  uint64_t v39 = *MEMORY[0x189604CC0];
  uint64_t v40 = *MEMORY[0x189604BB8];
  uint64_t v41 = *v9;
  uint64_t v42 = *MEMORY[0x189604BD0];
  uint64_t v43 = *MEMORY[0x189605420];
  uint64_t v44 = *MEMORY[0x189604CD8];
  uint64_t v45 = *MEMORY[0x189604BB0];
  uint64_t v46 = *MEMORY[0x189604C38];
  uint64_t v47 = *MEMORY[0x189604BA0];
  uint64_t v48 = *MEMORY[0x189604B80];
  uint64_t v49 = *MEMORY[0x189605588];
  uint64_t v50 = *MEMORY[0x189604B88];
  id v18 = (char *)operator new(0x460uLL);
  *(void *)id v18 = v12;
  *((void *)v18 + 1) = 1LL;
  *((void *)v18 + 2) = LaunchServices::URLPropertyProvider::prepareIsPackageValue;
  *((void *)v18 + 3) = LaunchServices::URLPropertyProvider::prepareIsPackageMimic;
  *((void *)v18 + 4) = LaunchServices::URLPropertyProvider::setIsPackageValue;
  *((void *)v18 + 5) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((void *)v18 + 6) = 10LL;
  *((void *)v18 + 7) = v11;
  *((void *)v18 + _Block_object_dispose((const void *)(v1 - 176), 8) = 0LL;
  *((void *)v18 + 9) = LaunchServices::URLPropertyProvider::prepareIsApplicationValue;
  *((void *)v18 + 10) = LaunchServices::URLPropertyProvider::prepareIsApplicationMimic;
  *((void *)v18 + 11) = 0LL;
  *((void *)v18 + 12) = &once_createPropertyTable(void)::isApplicationDependencyKeys;
  *((void *)v18 + 13) = 10LL;
  *((void *)v18 + 14) = v13;
  *((void *)v18 + 15) = 0LL;
  *((void *)v18 + 16) = LaunchServices::URLPropertyProvider::prepareApplicationFlags;
  *((void *)v18 + 17) = LaunchServices::URLPropertyProvider::prepareAppFlagsMimic;
  *((void *)v18 + 1_Block_object_dispose((const void *)(v1 - 176), 8) = 0LL;
  *((void *)v18 + 19) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((void *)v18 + 20) = 10LL;
  *((void *)v18 + 21) = v14;
  *((void *)v18 + 22) = 0LL;
  *((void *)v18 + 23) = LaunchServices::URLPropertyProvider::prepareApplicationFlags;
  *((void *)v18 + 24) = LaunchServices::URLPropertyProvider::prepareAppFlagsMimic;
  *((void *)v18 + 25) = 0LL;
  *((void *)v18 + 26) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((void *)v18 + 27) = 10LL;
  *((void *)v18 + 2_Block_object_dispose((const void *)(v1 - 176), 8) = v15;
  *((void *)v18 + 29) = 1LL;
  *((void *)v18 + 30) = LaunchServices::URLPropertyProvider::prepareLocalizedNameValue;
  *((void *)v18 + 31) = LaunchServices::URLPropertyProvider::prepareDNCMimic;
  *((void *)v18 + 32) = 0LL;
  *((void *)v18 + 33) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((void *)v18 + 34) = 10LL;
  *((void *)v18 + 35) = v16;
  *((void *)v18 + 36) = 0LL;
  *((void *)v18 + 37) = LaunchServices::URLPropertyProvider::prepareDistinctLocalizedNameValue;
  *((_OWORD *)v18 + 19) = 0u;
  *((void *)v18 + 40) = &once_createPropertyTable(void)::distinctLocalizedNameKeys;
  *((void *)v18 + 41) = 2LL;
  *((void *)v18 + 42) = v17;
  *((void *)v18 + 43) = 0LL;
  *((void *)v18 + 44) = LaunchServices::URLPropertyProvider::prepareLocalizedNameDictionaryValue;
  *((void *)v18 + 45) = LaunchServices::URLPropertyProvider::prepareDNCMimic;
  *((void *)v18 + 46) = 0LL;
  *((void *)v18 + 47) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((void *)v18 + 4_Block_object_dispose((const void *)(v1 - 176), 8) = 10LL;
  *((void *)v18 + 49) = v38;
  *((void *)v18 + 50) = 0LL;
  *((void *)v18 + 51) = LaunchServices::URLPropertyProvider::prepareLocalizedNameDictionaryValue;
  *((void *)v18 + 52) = LaunchServices::URLPropertyProvider::prepareDNCMimic;
  *((void *)v18 + 53) = 0LL;
  *((void *)v18 + 54) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((void *)v18 + 55) = 10LL;
  *((void *)v18 + 56) = v39;
  *((void *)v18 + 57) = 0LL;
  *((void *)v18 + 5_Block_object_dispose((const void *)(v1 - 176), 8) = LaunchServices::URLPropertyProvider::prepareLocalizedNameComponentsValue;
  *((void *)v18 + 59) = LaunchServices::URLPropertyProvider::prepareDNCMimic;
  *((void *)v18 + 60) = 0LL;
  *((void *)v18 + 61) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((void *)v18 + 62) = 10LL;
  *((void *)v18 + 63) = v40;
  *((void *)v18 + 64) = 0LL;
  *((void *)v18 + 65) = LaunchServices::URLPropertyProvider::prepareCanSetHiddenExtensionValue;
  *((void *)v18 + 66) = LaunchServices::URLPropertyProvider::prepareDNCMimic;
  *((void *)v18 + 67) = 0LL;
  *((void *)v18 + 6_Block_object_dispose((const void *)(v1 - 176), 8) = &once_createPropertyTable(void)::canSetHiddenExtensionKeys;
  *((void *)v18 + 69) = 1LL;
  *((void *)v18 + 70) = v41;
  *((void *)v18 + 71) = 1LL;
  *((void *)v18 + 72) = LaunchServices::URLPropertyProvider::prepareTypeIdentifierAndObjectValue;
  *((void *)v18 + 73) = LaunchServices::URLPropertyProvider::prepareTypeMimic;
  *((void *)v18 + 74) = 0LL;
  *((void *)v18 + 75) = &once_createPropertyTable(void)::bindingDependencyKeys;
  *((void *)v18 + 76) = 7LL;
  *((void *)v18 + 77) = v42;
  *((void *)v18 + 7_Block_object_dispose((const void *)(v1 - 176), 8) = 1LL;
  *((void *)v18 + 79) = LaunchServices::URLPropertyProvider::prepareTypeIdentifierAndObjectValue;
  *((void *)v18 + 80) = LaunchServices::URLPropertyProvider::prepareTypeMimic;
  *((void *)v18 + 81) = 0LL;
  *((void *)v18 + 82) = &once_createPropertyTable(void)::bindingDependencyKeys;
  *((void *)v18 + 83) = 7LL;
  *((void *)v18 + 84) = v43;
  *((void *)v18 + 85) = 1LL;
  *((void *)v18 + 86) = LaunchServices::URLPropertyProvider::prepareLocalizedTypeDescriptionValue;
  *((void *)v18 + 87) = LaunchServices::URLPropertyProvider::prepareBindingMimic;
  *((void *)v18 + 8_Block_object_dispose((const void *)(v1 - 176), 8) = 0LL;
  *((void *)v18 + 89) = &once_createPropertyTable(void)::typeDescriptionKeys;
  *((void *)v18 + 90) = 1LL;
  *((void *)v18 + 91) = v44;
  *((void *)v18 + 92) = 0LL;
  *((void *)v18 + 93) = LaunchServices::URLPropertyProvider::prepareLocalizedTypeDescriptionDictionaryValue;
  *((void *)v18 + 94) = LaunchServices::URLPropertyProvider::prepareBindingMimic;
  *((void *)v18 + 95) = 0LL;
  *((void *)v18 + 96) = &once_createPropertyTable(void)::typeDescriptionKeys;
  *((void *)v18 + 97) = 1LL;
  *((void *)v18 + 9_Block_object_dispose((const void *)(v1 - 176), 8) = v45;
  *((void *)v18 + 99) = 0LL;
  *((void *)v18 + 100) = LaunchServices::URLPropertyProvider::prepareBundleIdentifierValue;
  *((void *)v18 + 101) = LaunchServices::URLPropertyProvider::prepareMimicForBundleLookup;
  *((void *)v18 + 102) = 0LL;
  *((void *)v18 + 103) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((void *)v18 + 104) = 10LL;
  *((void *)v18 + 105) = v46;
  *((void *)v18 + 106) = 0LL;
  *((void *)v18 + 107) = LaunchServices::URLPropertyProvider::prepareHFSTypeCodeValue;
  *((void *)v18 + 10_Block_object_dispose((const void *)(v1 - 176), 8) = LaunchServices::URLPropertyProvider::prepareMimicForBundleLookup;
  *((void *)v18 + 109) = 0LL;
  *((void *)v18 + 110) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((void *)v18 + 111) = 10LL;
  *((void *)v18 + 112) = v47;
  *((void *)v18 + 113) = 0LL;
  *((void *)v18 + 114) = LaunchServices::URLPropertyProvider::prepareArchitecturesValue;
  *((void *)v18 + 115) = LaunchServices::URLPropertyProvider::prepareMimicForBundleLookup;
  *((void *)v18 + 116) = 0LL;
  *((void *)v18 + 117) = &once_createPropertyTable(void)::architecturesDependencyKeys;
  *((void *)v18 + 11_Block_object_dispose((const void *)(v1 - 176), 8) = 1LL;
  *((void *)v18 + 119) = v48;
  *((void *)v18 + 120) = 0LL;
  *((void *)v18 + 121) = LaunchServices::URLPropertyProvider::prepareArchitecturesValue;
  *((void *)v18 + 122) = LaunchServices::URLPropertyProvider::prepareMimicForBundleLookup;
  *((void *)v18 + 123) = 0LL;
  *((void *)v18 + 124) = &once_createPropertyTable(void)::architecturesDependencyKeys;
  *((void *)v18 + 125) = 1LL;
  *((void *)v18 + 126) = v49;
  *((void *)v18 + 127) = 0LL;
  *((void *)v18 + 12_Block_object_dispose((const void *)(v1 - 176), 8) = LaunchServices::URLPropertyProvider::prepareVolumeLocalizedNameValue;
  *(_OWORD *)(v18 + 1032) = 0u;
  *((void *)v18 + 131) = &once_createPropertyTable(void)::volLocNameDependencyKeys;
  *((void *)v18 + 132) = 6LL;
  *((void *)v18 + 133) = v50;
  *((void *)v18 + 134) = 0LL;
  *((void *)v18 + 135) = LaunchServices::URLPropertyProvider::prepareApplicationDeviceManagementPolicyValue;
  *((_OWORD *)v18 + 6_Block_object_dispose((const void *)(v1 - 176), 8) = 0u;
  *((void *)v18 + 13_Block_object_dispose((const void *)(v1 - 176), 8) = &once_createPropertyTable(void)::baseDependencyKeys;
  *((void *)v18 + 139) = 10LL;
  Class result = operator new(0x18uLL);
  *Class result = v18;
  result[1] = v18 + 1120;
  result[2] = v18 + 1120;
  LaunchServices::URLPropertyProvider::propertyTable = (uint64_t)result;
  return result;
}

void sub_183F7D940(_Unwind_Exception *a1)
{
}

uint64_t LaunchServices::URLPropertyProvider::prepareIsPackageValue( id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  unsigned __int8 v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v10, 0LL);

  if (v11)
  {
    int IsPackage = _LSNodeIsPackage(v11, a2, 0LL);
    uint64_t v13 = (void *)MEMORY[0x189604DE8];
    if (!IsPackage) {
      uint64_t v13 = (void *)MEMORY[0x189604DE0];
    }
    MEMORY[0x186E297E0](a3, *MEMORY[0x1896053A0], *v13);
    return 1LL;
  }

  else if (a6)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v15, 0LL);

    if (v16) {
      id v17 = 0LL;
    }
    else {
      id v17 = a1[3];
    }
    uint64_t result = 0LL;
    *a6 = v17;
  }

  else
  {
    return 0LL;
  }

  return result;
}

void sub_183F7DA60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareIsPackageMimic( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _LSPrepareMimicForIsPackage(a1, a5);
}

uint64_t LaunchServices::URLPropertyProvider::setIsPackageValue( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFBoolean *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t result = [a2 getFinderInfo:v12 error:a7];
  if ((_DWORD)result)
  {
    __int16 v11 = _LSGetBooleanFromCFType(a5) != 0;
    __int16 v13 = v13 & 0xDFFF | (v11 << 13);
    return [a2 setFinderInfo:v12 error:a7];
  }

  return result;
}

uint64_t LaunchServices::URLPropertyProvider::prepareIsApplicationValue( id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  int v10 = _LSGetBundleClassForNode(0LL, a2);
  if (v10 != 2)
  {
LABEL_4:
    __int16 v13 = (void *)MEMORY[0x189604DE8];
    if (v10 != 2) {
      __int16 v13 = (void *)MEMORY[0x189604DE0];
    }
    MEMORY[0x186E297E0](a3, *MEMORY[0x189605370], *v13);
    return 1LL;
  }

  +[_LSDServiceDomain defaultServiceDomain]();
  __int16 v11 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v11, 0LL);

  if (v12)
  {
    int v10 = _LSGetBundleClassForNode(v12, a2);
    goto LABEL_4;
  }

  if (!a6) {
    return 0LL;
  }
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v15, 0LL);

  if (v16) {
    id v17 = 0LL;
  }
  else {
    id v17 = a1[3];
  }
  uint64_t result = 0LL;
  *a6 = v17;
  return result;
}

void sub_183F7DC50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareIsApplicationMimic( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _LSPrepareMimicForBundleClass(a1, a5);
}

uint64_t LaunchServices::URLPropertyProvider::prepareApplicationFlags( id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  int v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  __int16 v11 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v10, 0LL);

  if (!v11)
  {
    if (a6)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      uint64_t v24 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v24, 0LL);

      if (v25)
      {
        id v26 = 0LL;
LABEL_29:
        uint64_t result = 0LL;
        *a6 = v26;
        return result;
      }

      id v28 = a1[3];
LABEL_28:
      id v26 = v28;
      goto LABEL_29;
    }

    return 0LL;
  }

  uint64_t v29 = 0LL;
  int v12 = _LSFindOrFindOrRegisterBundleNode(v11, a2, 0LL, 0x2000000u, 0LL, 0LL, &v29);
  if (v12) {
    BOOL v13 = v12 == -10811;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if (a6)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], v12, (uint64_t)"prepareApplicationFlags", 994LL, 0LL);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }

    return 0LL;
  }

  if (!v29
    || ((clas = v29->_clas, BOOL v15 = clas > 0x10, v16 = (1 << clas) & 0x14004, !v15) ? (v17 = v16 == 0) : (v17 = 1), v17))
  {
    MEMORY[0x186E297E0](a3, *MEMORY[0x189604B98], 0LL);
    uint64_t v22 = *MEMORY[0x189604B90];
    uint64_t v23 = a3;
    uint64_t v21 = 0LL;
  }

  else
  {
    uint64_t v18 = *MEMORY[0x189604DE8];
    uint64_t v19 = *MEMORY[0x189604DE0];
    if ((*(void *)(&v29->_clas + 1) & 0x40000LL) != 0) {
      uint64_t v20 = *MEMORY[0x189604DE8];
    }
    else {
      uint64_t v20 = *MEMORY[0x189604DE0];
    }
    MEMORY[0x186E297E0](a3, *MEMORY[0x189604B98], v20);
    if ((*(void *)(&v29->_clas + 1) & 0x200000LL) != 0) {
      uint64_t v21 = v18;
    }
    else {
      uint64_t v21 = v19;
    }
    uint64_t v22 = *MEMORY[0x189604B90];
    uint64_t v23 = a3;
  }

  MEMORY[0x186E297E0](v23, v22, v21);
  return 1LL;
}

void sub_183F7DE64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareAppFlagsMimic( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _LSPrepareMimicForBundleLookup(a1, a5);
}

uint64_t LaunchServices::URLPropertyProvider::prepareLocalizedNameValue( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (_LSContextIsCurrentThreadInitializing())
  {
    _LSDefaultLog();
    __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      [a2 URL];
      int v12 = (void *)objc_claimAutoreleasedReturnValue();
      LaunchServices::URLPropertyProvider::prepareLocalizedNameValue(v12, v18, v11);
    }

    [a2 nameWithError:a6];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v14 = 0LL;
    goto LABEL_11;
  }

  LaunchServices::URLPropertyProvider::getDisplayNameConstructor(a1, (uint64_t)a2, a5, a6);
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
  int v16 = v15;
  if (v15)
  {
    [v15 unlocalizedNameWithContextIfNeeded:a1];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v13 = 0LL;
  }

  if (!v13) {
    goto LABEL_10;
  }
LABEL_5:
  MEMORY[0x186E297E0](a3, *MEMORY[0x189605418], v13);
  uint64_t v14 = 1LL;
LABEL_11:

  return v14;
}

void sub_183F7DFBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareDNCMimic( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return +[_LSDisplayNameConstructor prepareMimicWithPopulator:error:]( &OBJC_CLASS____LSDisplayNameConstructor,  "prepareMimicWithPopulator:error:",  a1,  a5);
}

uint64_t LaunchServices::URLPropertyProvider::prepareDistinctLocalizedNameValue( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v23[1] = *MEMORY[0x1895F89C0];
  if ([a2 canIssueIO])
  {
    id v20 = 0LL;
    id v21 = 0LL;
    if ([a2 getResourceValue:&v21 forKey:*MEMORY[0x189603D00] options:1 error:a6]
      && [a2 getResourceValue:&v20 forKey:*MEMORY[0x189603CE0] options:1 error:a6])
    {
      else {
        id v9 = v20;
      }
      MEMORY[0x186E297E0](a3, *MEMORY[0x189604BE0], v9);
      a6 = 1LL;
    }

    else
    {
      a6 = 0LL;
    }
  }

  else
  {
    _LSDefaultLog();
    int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      LaunchServices::URLPropertyProvider::prepareDistinctLocalizedNameValue(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    if (a6)
    {
      uint64_t v22 = *MEMORY[0x189607490];
      v23[0] = @"can't provide with mimic";
      [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -50LL, (uint64_t)"prepareDistinctLocalizedNameValue", 788LL, v18);
      *(void *)a6 = (id)objc_claimAutoreleasedReturnValue();

      return 0LL;
    }
  }

  return a6;
}

void sub_183F7E19C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareLocalizedNameDictionaryValue( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  v41[1] = *MEMORY[0x1895F89C0];
  if ([a2 canIssueIO])
  {
    +[_LSDisplayNameConstructor displayNameConstructorsWithContextIfNeeded:node:error:]( &OBJC_CLASS____LSDisplayNameConstructor,  "displayNameConstructorsWithContextIfNeeded:node:error:",  a1,  a2,  a6);
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      uint64_t v18 = 0LL;
      goto LABEL_12;
    }

    [MEMORY[0x189603FC8] dictionary];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [MEMORY[0x189603FC8] dictionary];
    uint64_t v13 = (void *)v12;
    if (v11)
    {
      if (v12)
      {
LABEL_5:
        uint64_t v33 = MEMORY[0x1895F87A8];
        uint64_t v34 = 3221225472LL;
        uint64_t v35 = ___ZN14LaunchServices19URLPropertyProviderL35prepareLocalizedNameDictionaryValueERNS_8Database7ContextEPU34objcproto23FSNodePropertyProviding11objc_objectP11__FileCachePK10__CFStringPNS0_5StateEPU15__autoreleasingP7NSError_block_invoke;
        uint64_t v36 = &unk_189D78F38;
        uint64_t v39 = a1;
        id v14 = v11;
        id v37 = v14;
        id v15 = v13;
        id v38 = v15;
        [v10 enumerateKeysAndObjectsUsingBlock:&v33];
        uint64_t v16 = (void *)objc_msgSend(v14, "copy", v33, v34, v35, v36);
        MEMORY[0x186E297E0](a3, *MEMORY[0x189604CC8], v16);

        uint64_t v17 = (void *)[v15 copy];
        MEMORY[0x186E297E0](a3, *MEMORY[0x189604CD0], v17);

        uint64_t v18 = 1LL;
LABEL_12:

        return v18;
      }
    }

    else
    {
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithUTF8String:",  "Boolean LaunchServices::prepareLocalizedNameDictionaryValue(Context &, __unsafe_unretained id<FSNodePropertyProv iding>, _CFURLFileCacheRef, CFStringRef, State *, NSError *__autoreleasing *)");
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 handleFailureInFunction:v30 file:@"LSURLPropertyProvider.mm" lineNumber:828 description:@"Failed to create localized name dictionary."];

      if (v13) {
        goto LABEL_5;
      }
    }

    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "Boolean LaunchServices::prepareLocalizedNameDictionaryValue(Context &, __unsafe_unretained id<FSNodePropertyProvid ing>, _CFURLFileCacheRef, CFStringRef, State *, NSError *__autoreleasing *)");
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 handleFailureInFunction:v32 file:@"LSURLPropertyProvider.mm" lineNumber:829 description:@"Failed to create localized name dictionary."];

    goto LABEL_5;
  }

  _LSDefaultLog();
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    LaunchServices::URLPropertyProvider::prepareLocalizedNameDictionaryValue(v19, v20, v21, v22, v23, v24, v25, v26);
  }

  if (a6)
  {
    uint64_t v40 = *MEMORY[0x189607490];
    v41[0] = @"can't provide with mimic";
    [MEMORY[0x189603F68] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -50LL, (uint64_t)"prepareLocalizedNameDictionaryValue", 817LL, v27);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

void sub_183F7E4C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareLocalizedNameComponentsValue( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    [MEMORY[0x189603FA8] arrayWithCapacity:2];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      char v17 = 0;
      id v15 = 0LL;
      id v16 = 0LL;
      [v8 getUnlocalizedBaseName:&v16 extension:&v15 requiresAdditionalBiDiControlCharacters:&v17];
      id v10 = v16;
      id v11 = v15;
      if (v10) {
        [v9 addObject:v10];
      }
      if (v11) {
        [v9 addObject:v11];
      }

      uint64_t v12 = (void *)[v9 copy];
      MEMORY[0x186E297E0](a3, *MEMORY[0x189604CC0], v12);

      uint64_t v13 = 1LL;
    }

    else if (a6)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -41LL,  (uint64_t)"prepareLocalizedNameComponentsValue",  907LL,  0LL);
      uint64_t v13 = 0LL;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v13 = 0LL;
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return v13;
}

void sub_183F7E69C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareCanSetHiddenExtensionValue( LaunchServices::Database::Context *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    id v9 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = LaunchServices::Database::Context::_get(a1, v9, 0LL);

    int v11 = [v8 canSetExtensionHiddenWithContext:v10];
    uint64_t v12 = (void *)MEMORY[0x189604DE0];
    if (v11) {
      uint64_t v12 = (void *)MEMORY[0x189604DE8];
    }
    MEMORY[0x186E297E0](a3, *MEMORY[0x189604BB8], *v12);
  }

  else
  {
    MEMORY[0x186E297E0](a3, *MEMORY[0x189604BB8], *MEMORY[0x189604DE0]);
  }

  return 1LL;
}

void sub_183F7E7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareTypeIdentifierAndObjectValue( id *a1, uint64_t a2, uint64_t a3, const void *a4, uint64_t a5, void *a6)
{
  uint64_t v12 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v12, 0LL);

  if (!v13)
  {
    if (a6)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      id v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v15, 0LL);

      if (v16) {
        id v17 = 0LL;
      }
      else {
        id v17 = a1[3];
      }
      uint64_t result = 0LL;
      *a6 = v17;
      return result;
    }

    return 0LL;
  }

  if (!*(_BYTE *)(a5 + 32))
  {
LABEL_11:
    LaunchServices::TypeEvaluator::TypeEvaluator(v29, a2);
    LaunchServices::TypeEvaluator::evaluateType((uint64_t)v29, (void **)&v13->db, a6, (uint64_t)v26);
    std::__optional_storage_base<LaunchServices::TypeEvaluator::Result,false>::__assign_from[abi:nn180100]<std::__optional_move_assign_base<LaunchServices::TypeEvaluator::Result,false>>( a5,  (uint64_t)v26);
    if (v28) {

    }
    if (*(_BYTE *)(a5 + 32)) {
      goto LABEL_14;
    }
    return 0LL;
  }

  uint64_t v14 = _UTTypeGet();
  *(void *)(a5 + _Block_object_dispose((const void *)(v1 - 176), 8) = v14;
  if (!v14)
  {
    if (*(_BYTE *)(a5 + 32))
    {

      *(_BYTE *)(a5 + 32) = 0;
    }

    goto LABEL_11;
  }

  if (!*(_BYTE *)(a5 + 32)) {
    goto LABEL_11;
  }
LABEL_14:
  LaunchServices::TypeEvaluator::Result::getTypeIdentifier((id *)a5, v13);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = *MEMORY[0x189604BD0];
  uint64_t v20 = (LaunchServices::URLPropertyProvider *)CFEqual(a4, (CFTypeRef)*MEMORY[0x189604BD0]);
  if ((_DWORD)v20)
  {
    id UTTypeClass = LaunchServices::URLPropertyProvider::getUTTypeClass(v20);
    if (UTTypeClass)
    {
      uint64_t v22 = UTTypeClass;
      if (!*(_DWORD *)a5
        || ([UTTypeClass _constantTypeForURLPropertyProviderWithIdentifier:v18],
            (uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
      {
        LaunchServices::TypeEvaluator::Result::getTypeRecord((LaunchServices::TypeEvaluator::Result *)a5, v13);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 _typeForURLPropertyProviderWithTypeRecord:v24];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      }

      MEMORY[0x186E297E0](a3, v19, v23);
    }
  }

  MEMORY[0x186E297E0](a3, *MEMORY[0x189605478], v18);

  return 1LL;
}

void sub_183F7E9E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareTypeMimic( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return LaunchServices::TypeEvaluator::PrepareMimicForTypeEvaluation(a1, a5);
}

uint64_t LaunchServices::URLPropertyProvider::prepareLocalizedTypeDescriptionValue( id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  v18[21] = *MEMORY[0x1895F89C0];
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  int v11 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v10, 0LL);

  if (v11)
  {
    LaunchServices::BindingEvaluator::CreateWithNode(a2, (LaunchServices::BindingEvaluator *)v18);
    LaunchServices::BindingEvaluator::getLocalizedKindString( (const LaunchServices::BindingEvaluator *)v18,  v11,  0LL,  a6);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      MEMORY[0x186E297E0](a3, *MEMORY[0x189605420], v12);
      uint64_t v13 = 1LL;
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v18);
  }

  else if (a6)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    uint64_t v14 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v14, 0LL);

    if (v15) {
      id v16 = 0LL;
    }
    else {
      id v16 = a1[3];
    }
    uint64_t v13 = 0LL;
    *a6 = v16;
  }

  else
  {
    return 0LL;
  }

  return v13;
}

void sub_183F7EB9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareBindingMimic( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return LaunchServices::BindingEvaluator::PrepareMimicForBinding(a1, a5);
}

uint64_t LaunchServices::URLPropertyProvider::prepareLocalizedTypeDescriptionDictionaryValue( id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  v29[1] = *MEMORY[0x1895F89C0];
  if (([a2 canIssueIO] & 1) == 0)
  {
    _LSDefaultLog();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      LaunchServices::URLPropertyProvider::prepareLocalizedTypeDescriptionDictionaryValue( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21);
    }

    if (a6)
    {
      uint64_t v28 = *MEMORY[0x189607490];
      v29[0] = @"can't provide with mimic";
      [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"prepareLocalizedTypeDescriptionDictionaryValue",  1239LL,  v22);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  int v11 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v10, 0LL);

  if (v11)
  {
    LaunchServices::BindingEvaluator::CreateWithNode(a2, (LaunchServices::BindingEvaluator *)v27);
    LaunchServices::BindingEvaluator::getLocalizedKindStringDictionary( (const LaunchServices::BindingEvaluator *)v27,  v11,  a6);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      MEMORY[0x186E297E0](a3, *MEMORY[0x189604CD8], v12);
      uint64_t v13 = 1LL;
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v27);
    return v13;
  }

  if (!a6) {
    return 0LL;
  }
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v23 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v23, 0LL);

  if (v24) {
    id v25 = 0LL;
  }
  else {
    id v25 = a1[3];
  }
  uint64_t v13 = 0LL;
  *a6 = v25;
  return v13;
}

void sub_183F7EDD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareBundleIdentifierValue( id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  int v11 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v10, 0LL);

  if (v11)
  {
    unsigned int v20 = 0;
    uint64_t v19 = 0LL;
    int v12 = _LSFindOrFindOrRegisterBundleNode(v11, a2, 0LL, 0x2000000u, 0LL, &v20, &v19);
    if (v12 == -10811)
    {
      MEMORY[0x186E297E0](a3, *MEMORY[0x189604BB0], 0LL);
      return 1LL;
    }

    if (!v12)
    {
      uint64_t v13 = (void *)_CSStringCopyCFString();
      MEMORY[0x186E297E0](a3, *MEMORY[0x189604BB0], v13);

      return 1LL;
    }

    if (a6)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], v12, (uint64_t)"prepareBundleIdentifierValue", 1558LL, 0LL);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
      id v16 = v18;
      goto LABEL_15;
    }

    return 0LL;
  }

  if (!a6) {
    return 0LL;
  }
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v14 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v14, 0LL);

  if (!v15)
  {
    id v18 = a1[3];
    goto LABEL_14;
  }

  id v16 = 0LL;
LABEL_15:
  uint64_t result = 0LL;
  *a6 = v16;
  return result;
}

void sub_183F7EFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareMimicForBundleLookup( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _LSPrepareMimicForBundleLookup(a1, a5);
}

uint64_t LaunchServices::URLPropertyProvider::prepareHFSTypeCodeValue( LaunchServices::Database::Context *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t valuePtr = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  uint64_t v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  int v11 = (LSContext *)LaunchServices::Database::Context::_get(a1, v10, 0LL);

  if (v11
    && (_LSGetNodeTypeCreatorInfo(v11, a2, 0LL, (_DWORD *)&valuePtr + 1, &valuePtr),
        (CFNumberRef v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, (char *)&valuePtr + 4)) != 0LL))
  {
    CFNumberRef v13 = v12;
    MEMORY[0x186E297E0](a3, *MEMORY[0x189604C38], v12);
    CFRelease(v13);
    return 1LL;
  }

  else
  {
    MEMORY[0x186E297E0](a3, *MEMORY[0x189604C38], 0LL);
    if (a6)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -41LL, (uint64_t)"prepareHFSTypeCodeValue", 1586LL, 0LL);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t result = 0LL;
      *a6 = v15;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void sub_183F7F124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareArchitecturesValue( id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  v36[1] = *MEMORY[0x1895F89C0];
  if ([a2 canIssueIO])
  {
    id v34 = 0LL;
    int v10 = [a2 getResourceValue:&v34 forKey:*MEMORY[0x189603C40] options:3 error:0];
    if (!v34) {
      int v10 = 0;
    }
    if (v10 == 1 && [v34 BOOLValue])
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      int v11 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      CFNumberRef v12 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v11, 0LL);

      if (!v12)
      {
        if (a6)
        {
          +[_LSDServiceDomain defaultServiceDomain]();
          uint64_t v30 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
          uint64_t v31 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v30, 0LL);

          if (v31) {
            id v32 = 0LL;
          }
          else {
            id v32 = a1[3];
          }
          goto LABEL_31;
        }

void sub_183F7F478( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareVolumeLocalizedNameValue( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  v23[1] = *MEMORY[0x1895F89C0];
  if ([a2 canIssueIO])
  {
    [a2 volumeNodeWithFlags:16 error:a6];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = v9;
    if (v9)
    {
      id v21 = 0LL;
      uint64_t v11 = [v9 getResourceValue:&v21 forKey:*MEMORY[0x189603CE0] options:3 error:a6];
      if ((_DWORD)v11) {
        MEMORY[0x186E297E0](a3, *MEMORY[0x189605588], v21);
      }
    }

    else
    {
      uint64_t v11 = 0LL;
    }
  }

  else
  {
    _LSDefaultLog();
    CFNumberRef v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      LaunchServices::URLPropertyProvider::prepareVolumeLocalizedNameValue(v12, v13, v14, v15, v16, v17, v18, v19);
    }

    if (!a6) {
      return 0LL;
    }
    uint64_t v22 = *MEMORY[0x189607490];
    v23[0] = @"can't provide with mimic";
    [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -50LL, (uint64_t)"prepareVolumeLocalizedNameValue", 860LL, v10);
    uint64_t v11 = 0LL;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void sub_183F7F660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareApplicationDeviceManagementPolicyValue( id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  v31[1] = *MEMORY[0x1895F89C0];
  if (([a2 canIssueIO] & 1) == 0)
  {
    _LSDefaultLog();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      LaunchServices::URLPropertyProvider::prepareApplicationDeviceManagementPolicyValue( v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23);
    }

    if (a6)
    {
      uint64_t v30 = *MEMORY[0x189607490];
      v31[0] = @"can't provide with mimic";
      [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"prepareApplicationDeviceManagementPolicyValue",  2335LL,  v24);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0LL;
  }

  +[_LSDServiceDomain defaultServiceDomain]();
  int v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v10, 0LL);

  if (!v11)
  {
    if (a6)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      uint64_t v25 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v25, 0LL);

      if (v26) {
        id v27 = 0LL;
      }
      else {
        id v27 = a1[3];
      }
      goto LABEL_19;
    }

    return 0LL;
  }

  uint64_t v29 = 0LL;
  int v12 = _LSFindOrFindOrRegisterBundleNode(v11, a2, 0LL, 0x2000000u, 0LL, 0LL, &v29);
  if (v12 == -10811)
  {
    MEMORY[0x186E297E0](a3, *MEMORY[0x189604B88], 0LL);
    return 1LL;
  }

  if (v12)
  {
    if (a6)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  v12,  (uint64_t)"prepareApplicationDeviceManagementPolicyValue",  2361LL,  0LL);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
      uint64_t v15 = 0LL;
      *a6 = v27;
      return v15;
    }

    return 0LL;
  }

  uint64_t v13 = (void *)_CSStringCopyCFString();
  _LSGetDMFPolicyNoCache(v13, a6);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    MEMORY[0x186E297E0](a3, *MEMORY[0x189604B88], v14);
    uint64_t v15 = 1LL;
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
}

void sub_183F7F914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id LaunchServices::URLPropertyProvider::getDisplayNameConstructor( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned __int8 v7 = (id *)(a3 + 40);
  id v8 = *(id *)(a3 + 40);
  if (!v8)
  {
    +[_LSDisplayNameConstructor displayNameConstructorWithContextIfNeeded:node:error:]( &OBJC_CLASS____LSDisplayNameConstructor,  "displayNameConstructorWithContextIfNeeded:node:error:",  a1,  a2,  a4);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v9;
    if (v8) {
      objc_storeStrong(v7, v9);
    }
  }

  return v8;
}

void ___ZN14LaunchServices19URLPropertyProviderL35prepareLocalizedNameDictionaryValueERNS_8Database7ContextEPU34objcproto23FSNodePropertyProviding11objc_objectP11__FileCachePK10__CFStringPNS0_5StateEPU15__autoreleasingP7NSError_block_invoke( uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  unsigned __int8 v6 = (void *)MEMORY[0x186E2A59C]();
  [v5 unlocalizedNameWithContextIfNeeded:*(void *)(a1 + 48) asIfShowingAllExtensions:MEMORY[0x189604A88]];
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 unlocalizedNameWithContextIfNeeded:*(void *)(a1 + 48) asIfShowingAllExtensions:MEMORY[0x189604A80]];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 isEqual:v8])
  {
    id v9 = v7;

    id v8 = v9;
  }

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v10];
  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v10];

  objc_autoreleasePoolPop(v6);
}

void sub_183F7FAC0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__n128 std::__optional_storage_base<LaunchServices::TypeEvaluator::Result,false>::__assign_from[abi:nn180100]<std::__optional_move_assign_base<LaunchServices::TypeEvaluator::Result,false>>( uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a1 + 32) == *(unsigned __int8 *)(a2 + 32))
  {
    if (*(_BYTE *)(a1 + 32))
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v4 = *(void *)(a2 + 16);
      *(void *)(a2 + 16) = 0LL;
      id v5 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v4;

      *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
    }
  }

  else if (*(_BYTE *)(a1 + 32))
  {

    *(_BYTE *)(a1 + 32) = 0;
  }

  else
  {
    __n128 result = *(__n128 *)a2;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v7 = *(void *)(a2 + 16);
    *(void *)(a2 + 16) = 0LL;
    *(void *)(a1 + 16) = v7;
    *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
    *(_BYTE *)(a1 + 32) = 1;
  }

  return result;
}

uint64_t LaunchServices::URLPropertyProvider::copyValues( uint64_t a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, void **a5, uint64_t a6)
{
  if (a6 < 1) {
    return 1LL;
  }
  uint64_t v6 = a6;
  do
  {
    uint64_t v10 = MEMORY[0x186E297D4](a2, **a5, a4);
    if (!(_DWORD)v10) {
      break;
    }
    if (*a4) {
      CFRetain(*a4);
    }
    ++a4;
    ++a5;
    --v6;
  }

  while (v6);
  return v10;
}

uint64_t LaunchServices::URLPropertyProvider::prepareValues( void *a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5, uint64_t a6, void **a7)
{
  uint64_t v74 = 0LL;
  id v75 = &v74;
  uint64_t v76 = 0x2020000000LL;
  char v77 = 1;
  id location = 0LL;
  uint64_t v11 = (void *)MEMORY[0x186E2A59C]();
  id v72 = 0LL;
  id v71 = 0LL;
  CFDictionaryRef v68 = 0LL;
  id v69 = 0LL;
  char v70 = 0;
  v64[0] = 0;
  char v66 = 0;
  id v67 = 0LL;
  uint64_t v63 = 0LL;
  if ([(id)__LSDefaultsGetSharedInstance() isServer])
  {
    id v62 = 0LL;
    [a1 getResourceValue:&v62 forKey:@"_LSMimicKey" error:0];
    id v12 = v62;
  }

  else
  {
    id v12 = 0LL;
  }

  v61[0] = &v72;
  v61[1] = &location;
  v61[2] = a7;
  v61[3] = (void **)a1;
  uint64_t v50 = a1;
  uint64_t v13 = getenv("LS_FORCE_URL_PROPERTY_PREP_OOP");
  if (!v13)
  {
LABEL_31:
    uint64_t v16 = 0LL;
    goto LABEL_43;
  }

  [NSString stringWithUTF8String:v13];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  char v15 = [v14 BOOLValue];

  if ((v15 & 1) == 0) {
    goto LABEL_31;
  }
LABEL_6:
  uint64_t v47 = v11;
  id v48 = v12;
  if (a5 >= 1)
  {
    id v51 = 0LL;
    uint64_t v16 = 0LL;
    p_obuint64_t j = &obj;
    if (!a7) {
      p_obuint64_t j = 0LL;
    }
    uint64_t v49 = p_obj;
    uint64_t v18 = a3;
    uint64_t v19 = a4;
    uint64_t v20 = a5;
    while (1)
    {
      if (!*((_BYTE *)v75 + 24)) {
        goto LABEL_33;
      }
      uint64_t v21 = *v19;
      if (*(void *)(*v19 + 24))
      {
        uint64_t v22 = *v18;
      }

void sub_183F8024C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, id a35)
{
  _Block_object_dispose(&a30, 8);
  LaunchServices::URLPropertyProvider::State::~State((id *)(v36 - 240));
  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)(v36 - 192));

  _Block_object_dispose((const void *)(v36 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::setValues( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v13 = (void *)MEMORY[0x186E2A59C]();
  uint64_t v14 = objc_alloc(&OBJC_CLASS___FSNode);
  if (a8) {
    char v15 = &v46;
  }
  else {
    char v15 = 0LL;
  }
  if (a8) {
    id v46 = 0LL;
  }
  uint64_t v33 = -[FSNode initWithURL:flags:error:](v14, "initWithURL:flags:error:", a1, 64LL, v15);
  if (a8) {
    id v16 = v46;
  }
  else {
    id v16 = 0LL;
  }
  if (!v33)
  {
    uint64_t v24 = 1LL;
    goto LABEL_31;
  }

  id v45 = 0LL;
  id v42 = 0LL;
  id v43 = 0LL;
  char v44 = 0;
  v38[0] = 0;
  char v40 = 0;
  id v41 = 0LL;
  if (a6 < 1)
  {
    uint64_t v25 = 0LL;
    BOOL v18 = 0;
    uint64_t v24 = 1LL;
    goto LABEL_24;
  }

  uint64_t v30 = a1;
  uint64_t v31 = a8;
  id v32 = v13;
  uint64_t v17 = 0LL;
  BOOL v18 = 1;
  while (1)
  {
    uint64_t v19 = *(void *)(a3 + 8 * v17);
    if (v19) {
      break;
    }
LABEL_18:
    BOOL v18 = ++v17 < a6;
    if (a6 == v17)
    {
      uint64_t v24 = 1LL;
      goto LABEL_23;
    }
  }

  uint64_t v20 = *(void *)(a4 + 8 * v17);
  if (!v21)
  {
LABEL_16:
    if (!v20) {
      MEMORY[0x186E297A4](a2, v19);
    }
    goto LABEL_18;
  }

  id v37 = v16;
  int v22 = v21(&v42, v33, a2, v19, v20, v38, &v37);
  id v23 = v37;

  if (v22)
  {
    id v16 = v23;
    goto LABEL_16;
  }

  uint64_t v24 = 0LL;
  id v16 = v23;
LABEL_23:
  uint64_t v25 = v41;
  a8 = v31;
  uint64_t v13 = v32;
  a1 = v30;
LABEL_24:

  if (v40) {
  if (v42 && v44)
  }
    _LSContextDestroy(v42);
  id v26 = v43;
  id v42 = 0LL;
  id v43 = 0LL;

  char v44 = 0;
  id v27 = v45;
  id v45 = 0LL;

  if (a8 != 0LL && v18)
  {
    id v36 = v16;
    LaunchServices::URLPropertyProvider::normalizeError(a1, 1LL, &v36);
    id v28 = v36;

    id v16 = v28;
    uint64_t v24 = 0LL;
    *a8 = v16;
  }

void sub_183F805D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__42(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__42(uint64_t a1)
{
}

void ___ZN14LaunchServices19URLPropertyProviderL13prepareValuesEPK7__CFURLP11__FileCachePKPK10__CFStringPPKvlSC_PP9__CFError_block_invoke( uint64_t a1, void *a2)
{
}

void ___ZN14LaunchServices19URLPropertyProviderL13prepareValuesEPK7__CFURLP11__FileCachePKPK10__CFStringPPKvlSC_PP9__CFError_block_invoke_2( void *a1, void *a2, void *a3, void *a4)
{
  unint64_t v12 = a2;
  unint64_t v7 = a3;
  id v8 = a4;
  if (v12 | v7)
  {
    uint64_t v9 = MEMORY[0x1895F87A8];
    if (v12)
    {
      [(id)v12 objectForKeyedSubscript:*MEMORY[0x189604BD0]];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v11 = v10 != 0LL;

      v14[0] = v9;
      v14[1] = 3221225472LL;
      void v14[2] = ___ZN14LaunchServices19URLPropertyProviderL13prepareValuesEPK7__CFURLP11__FileCachePKPK10__CFStringPPKvlSC_PP9__CFError_block_invoke_3;
      v14[3] = &__block_descriptor_41_e25_v32__0__NSString_8_16_B24l;
      BOOL v15 = v11;
      v14[4] = a1[6];
      [(id)v12 enumerateKeysAndObjectsUsingBlock:v14];
    }

    v13[0] = v9;
    v13[1] = 3221225472LL;
    v13[2] = ___ZN14LaunchServices19URLPropertyProviderL13prepareValuesEPK7__CFURLP11__FileCachePKPK10__CFStringPPKvlSC_PP9__CFError_block_invoke_4;
    v13[3] = &__block_descriptor_40_e22_v24__0__NSString_8_B16l;
    void v13[4] = a1[6];
    objc_msgSend((id)v7, "enumerateObjectsUsingBlock:", v13, v12);
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
  }

  else
  {
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a4);
  }
}

void sub_183F80784( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void ___ZN14LaunchServices19URLPropertyProviderL13prepareValuesEPK7__CFURLP11__FileCachePKPK10__CFStringPPKvlSC_PP9__CFError_block_invoke_3( uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (*(_BYTE *)(a1 + 40))
  {
    uint64_t v7 = _LSReplaceURLPropertyValueForDecoding(v5);

    uint64_t v6 = (void *)v7;
  }

  MEMORY[0x186E297E0](*(void *)(a1 + 32), v8, v6);
}

void sub_183F8081C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN14LaunchServices19URLPropertyProviderL13prepareValuesEPK7__CFURLP11__FileCachePKPK10__CFStringPPKvlSC_PP9__CFError_block_invoke_4()
{
}

id LaunchServices::URLPropertyProvider::prepareValues(__CFURL const*,__FileCache *,__CFString const* const*,void const**,long,void const*,__CFError **)::$_0::operator()( void ***a1)
{
  unsigned __int8 v2 = **a1;
  if (v2) {
    return v2;
  }
  uint64_t v3 = a1[3];
  if (os_unfair_lock_trylock((os_unfair_lock_t)&LaunchServices::URLPropertyProvider::reusableNodeLock))
  {
    if (LaunchServices::URLPropertyProvider::reusableNode)
    {
      id v4 = (id)LaunchServices::URLPropertyProvider::reusableNode;
      id v5 = (void *)LaunchServices::URLPropertyProvider::reusableNode;
      LaunchServices::URLPropertyProvider::reusableNode = 0LL;

      os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::URLPropertyProvider::reusableNodeLock);
      uint64_t v6 = (void *)[v4 initWithURL:v3 flags:64 error:0];
      uint64_t v7 = v6;
      if (v6) {
        id v8 = v6;
      }

      goto LABEL_9;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&LaunchServices::URLPropertyProvider::reusableNodeLock);
  }

  uint64_t v7 = 0LL;
LABEL_9:
  uint64_t v9 = **a1;
  **a1 = v7;

  unsigned __int8 v2 = **a1;
  if (!v2)
  {
    uint64_t v10 = objc_alloc(&OBJC_CLASS___FSNode);
    BOOL v11 = a1[3];
    if (a1[2] && (unint64_t v12 = a1[1]) != 0LL)
    {
      obuint64_t j = *v12;
      uint64_t v13 = -[FSNode initWithURL:flags:error:](v10, "initWithURL:flags:error:", v11, 64LL, &obj);
      objc_storeStrong(v12, obj);
    }

    else
    {
      uint64_t v13 = -[FSNode initWithURL:flags:error:](v10, "initWithURL:flags:error:", v11, 64LL, 0LL);
    }

    uint64_t v14 = **a1;
    **a1 = (void *)v13;

    unsigned __int8 v2 = **a1;
  }

  return v2;
}

void LaunchServices::URLPropertyProvider::normalizeError(const void *a1, uint64_t a2, id *a3)
{
  if (a1 && a3)
  {
    id v6 = *a3;
    id v11 = v6;
    if (v6)
    {
      [v6 domain];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      char v8 = [v7 isEqual:*MEMORY[0x189607460]];

      if ((v8 & 1) == 0)
      {
        CFAllocatorRef v9 = CFGetAllocator(a1);
        [v11 domain];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        *a3 = (id)MEMORY[0x186E29798](v9, v10, [v11 code], a2, a1, 0);
      }
    }

    else
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -10810LL, (uint64_t)"normalizeError", 222LL, 0LL);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

void sub_183F80A90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void LaunchServices::URLPropertyProvider::State::~State(id *this)
{
  if (*((_BYTE *)this + 32)) {
}
  }

void _LSRegistrationWarning(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a1;
  if ((id)_LSRegistrationWarning::lastNode != v4)
  {
    objc_storeStrong((id *)&_LSRegistrationWarning::lastNode, a1);
    if (v4)
    {
      uint64_t v5 = [v4 pathWithError:0];
      id v6 = (void *)v5;
      uint64_t v7 = @"<unknown>";
      if (v5) {
        uint64_t v7 = (__CFString *)v5;
      }
      char v8 = v7;

      _LSDefaultLog();
      CFAllocatorRef v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138477827;
        uint64_t v14 = v8;
        _os_log_impl( &dword_183E58000,  v9,  OS_LOG_TYPE_DEFAULT,  "*** Registration warnings for %{private}@:",  (uint8_t *)&v13,  0xCu);
      }
    }
  }

  if (a2)
  {
    uint64_t v10 = (void *)MEMORY[0x186E2A59C]();
    _LSDefaultLog();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [a2 UTF8String];
      int v13 = 136446210;
      uint64_t v14 = (__CFString *)v12;
      _os_log_impl(&dword_183E58000, v11, OS_LOG_TYPE_DEFAULT, "    %{public}s", (uint8_t *)&v13, 0xCu);
    }

    objc_autoreleasePoolPop(v10);
  }
}

void sub_183F80C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _LSRegistrationWarningPath(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  _LSDefaultLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138477827;
    uint64_t v9 = a1;
    _os_log_impl( &dword_183E58000,  v4,  OS_LOG_TYPE_DEFAULT,  "*** Registration warnings for %{private}@:",  (uint8_t *)&v8,  0xCu);
  }

  if (a2)
  {
    uint64_t v5 = (void *)MEMORY[0x186E2A59C]();
    _LSDefaultLog();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [a2 UTF8String];
      int v8 = 136446210;
      uint64_t v9 = v7;
      _os_log_impl(&dword_183E58000, v6, OS_LOG_TYPE_DEFAULT, "    %{public}s", (uint8_t *)&v8, 0xCu);
    }

    objc_autoreleasePoolPop(v5);
  }

void sub_183F80DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFBooleanRef _LSGetBooleanFromCFType(const __CFBoolean *result)
{
  if (result)
  {
    unsigned __int8 v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFBooleanGetTypeID()) {
      return (const __CFBoolean *)CFBooleanGetValue(v1);
    }
    if (v2 != CFStringGetTypeID())
    {
      if (v2 != CFNumberGetTypeID()) {
        return 0LL;
      }
      CFNumberGetValue(v1, kCFNumberLongType, &valuePtr);
      BOOL v3 = valuePtr == 0;
      return (const __CFBoolean *)!v3;
    }

    __n128 result = (const __CFBoolean *)CFStringGetLength((CFStringRef)v1);
    if (result)
    {
      __n128 result = (const __CFBoolean *)CFStringCompare((CFStringRef)v1, @"NO", 1uLL);
      if (result)
      {
        __n128 result = (const __CFBoolean *)CFStringCompare((CFStringRef)v1, @"0", 0x40uLL);
        if (result)
        {
          BOOL v3 = CFStringCompare((CFStringRef)v1, @"FALSE", 1uLL) == kCFCompareEqualTo;
          return (const __CFBoolean *)!v3;
        }
      }
    }
  }

  return result;
}

CFBooleanRef _LSGetBooleanFromDict(const __CFDictionary *a1, const void *a2)
{
  Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  return _LSGetBooleanFromCFType(Value);
}

CFStringRef _LSGetRawOSTypeForPossibleString(const __CFString *result)
{
  *(_DWORD *)__int128 buffer = 0;
  if (result)
  {
    unsigned __int8 v1 = result;
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v1))
    {
      CFIndex Length = CFStringGetLength(v1);
      if (Length >= 4) {
        CFIndex v4 = 4LL;
      }
      else {
        CFIndex v4 = Length;
      }
      v7.id location = 0LL;
      v7.length = v4;
      CFIndex Bytes = CFStringGetBytes(v1, v7, 0, 0, 0, buffer, 4LL, 0LL);
      __n128 result = 0LL;
      if (v4 == Bytes) {
        return (const __CFString *)bswap32(*(unsigned int *)buffer);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t _LSGetBundle()
{
  if (_LSGetBundle::once != -1) {
    dispatch_once(&_LSGetBundle::once, &__block_literal_global_69);
  }
  return _LSGetBundle::gBundleRef;
}

id _LSGetMainBundleURL()
{
  if (_LSGetMainBundleURL::once != -1) {
    dispatch_once(&_LSGetMainBundleURL::once, &__block_literal_global_26_0);
  }
  return (id)_LSGetMainBundleURL::result;
}

void sub_183F8111C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t _LSGetDirectoryClassForNode(void *a1)
{
  unsigned __int8 v1 = a1;
  if (!-[FSNode isOnLocalVolume](v1, "isOnLocalVolume")) {
    goto LABEL_18;
  }
  if ((_LSNodeIsInDirectoryPath(v1, "/System/Library/CoreServices/") & 1) != 0)
  {
    unsigned __int8 v2 = 4;
    goto LABEL_19;
  }

  if ((_LSNodeIsInSearchPath(v1, NSLibraryDirectory, 8LL) & 1) != 0)
  {
    unsigned __int8 v2 = 3;
    goto LABEL_19;
  }

  if ((_LSNodeIsInSearchPath(v1, NSApplicationDirectory, 2LL) & 1) != 0)
  {
    unsigned __int8 v2 = 0;
    goto LABEL_19;
  }

  if ((_LSNodeIsInSearchPath(v1, NSLibraryDirectory, 2LL) & 1) != 0)
  {
    unsigned __int8 v2 = 2;
    goto LABEL_19;
  }

  if ((_LSNodeIsInSearchPath(v1, NSApplicationDirectory, 1LL) & 1) != 0)
  {
    unsigned __int8 v2 = 5;
    goto LABEL_19;
  }

  if ((_LSNodeIsInSearchPath(v1, NSLibraryDirectory, 1LL) & 1) != 0)
  {
    unsigned __int8 v2 = 6;
    goto LABEL_19;
  }

  if (![(id)__LSDefaultsGetSharedInstance() isAppleInternal])
  {
LABEL_18:
    unsigned __int8 v2 = -1;
    goto LABEL_19;
  }

  else {
    unsigned __int8 v2 = -1;
  }
LABEL_19:

  return v2;
}

void sub_183F8124C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _LSNodeIsInDirectoryPath(FSNode *a1, const char *a2)
{
  BOOL v3 = a1;
  CFIndex v4 = (NSURL *)[objc_alloc(MEMORY[0x189604030]) initFileURLWithFileSystemRepresentation:a2 isDirectory:1 relativeToURL:0];
  uint64_t v5 = _LSNodeIsInDirectoryURL(v3, v4);

  return v5;
}

void sub_183F812C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _LSNodeIsInSearchPath(FSNode *a1, NSSearchPathDirectory a2, uint64_t a3)
{
  uint64_t v5 = a1;
  [MEMORY[0x1896078A8] defaultManager];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 URLsForDirectory:a2 inDomains:a3];
  CFRange v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 firstObject];
  int v8 = (NSURL *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = _LSNodeIsInDirectoryURL(v5, v8);
  return v9;
}

void sub_183F81368(_Unwind_Exception *a1)
{
  BOOL v3 = v2;

  _Unwind_Resume(a1);
}

void _LSAssertRunningInServer(uint64_t a1)
{
  if (([(id)__LSDefaultsGetSharedInstance() isServer] & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"void _LSAssertRunningInServer(const char *)"];
    unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v3,  "handleFailureInFunction:file:lineNumber:description:",  v2,  @"LSUtils.mm",  1086,  @"Must call %s from within the Launch Services daemon.",  a1);
  }

void sub_183F8143C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL _LSIconDictionarySupportsAssetCatalogs(void *a1)
{
  unsigned __int8 v2 = (void *)MEMORY[0x186E2A59C]();
  [a1 objectForKey:@"CFBundlePrimaryIcon"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) != 0)
  {
    BOOL v4 = 1LL;
  }

  else if (_NSIsNSDictionary())
  {
    [v3 objectForKey:@"CFBundleIconName"];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v4 = v5 != 0LL;
  }

  else
  {
    BOOL v4 = 0LL;
  }

  objc_autoreleasePoolPop(v2);
  return v4;
}

void sub_183F814F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _LSIconDictionaryGetPrimaryIconName(void *a1)
{
  unsigned __int8 v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    [v1 objectForKey:@"CFBundleIconName"];
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (!_NSIsNSString())
    {
      id v3 = 0LL;
      goto LABEL_7;
    }

    id v2 = v1;
  }

  id v3 = v2;
LABEL_7:

  return v3;
}

void sub_183F81574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F816CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F81734( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F817E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFStringRef _LSGetPlatformNameSuffix()
{
  return @"-tvos";
}

uint64_t _LSGetProductNameSuffix()
{
  if (_LSGetProductNameSuffix::onceToken != -1) {
    dispatch_once(&_LSGetProductNameSuffix::onceToken, &__block_literal_global_87);
  }
  return _LSGetProductNameSuffix::suffix;
}

BOOL _LSIsCPUTypeSubtypeRunnable(int a1, int a2)
{
  if (a1 == 16777228)
  {
    if (_LSGetCPUType::once != -1) {
      dispatch_once(&_LSGetCPUType::once, &__block_literal_global_35_0);
    }
    if (_LSGetCPUType::type == 16777228)
    {
      int v4 = a2 & 0xFFFFFF;
      if ((a2 & 0xFFFFFF) == 0 || v4 == 0xFFFFFF || v4 == 2) {
        return 1LL;
      }
    }

    return 0LL;
  }

  if (a1 != 16777223) {
    return a1 == -1 && a2 == -1;
  }
  if (_LSGetCPUType::once != -1) {
    dispatch_once(&_LSGetCPUType::once, &__block_literal_global_35_0);
  }
  if (_LSGetCPUType::type != 16777223) {
    return 0LL;
  }
  int v5 = a2 & 0xFFFFFF;
  if ((a2 & 0xFFFFFF) == 0xFFFFFF) {
    return 1LL;
  }
  if (v5 != 8) {
    return v5 == 3;
  }
  if (_LSPlatformSupportsHaswell::onceToken != -1) {
    dispatch_once(&_LSPlatformSupportsHaswell::onceToken, &__block_literal_global_83);
  }
  return _LSPlatformSupportsHaswell::canRun != 0;
}

uint64_t _LSSessionKeyCopyDescription(unint64_t a1)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t _LSGetMachTimebase()
{
  if (_LSGetMachTimebase::once != -1) {
    dispatch_once(&_LSGetMachTimebase::once, &__block_literal_global_96);
  }
  return _LSGetMachTimebase::info;
}

id _LSGetDataForUserActivity(void *a1, void *a2)
{
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = __Block_byref_object_copy__43;
  id v26 = __Block_byref_object_dispose__43;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy__43;
  uint64_t v20 = __Block_byref_object_dispose__43;
  id v21 = 0LL;
  id v3 = a1;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  uint64x2_t v12[2] = ___LSGetDataForUserActivity_block_invoke;
  void v12[3] = &unk_189D790E0;
  uint64_t v14 = &v22;
  uint64_t v15 = &v16;
  int v5 = v4;
  int v13 = v5;
  int v6 = [v3 _createUserActivityDataWithOptions:0 completionHandler:v12];

  if (v6)
  {
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  }

  else
  {
    uint64_t v7 = _LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -10817LL, (uint64_t)"_LSGetDataForUserActivity", 1674LL, 0LL);
    int v8 = (void *)v17[5];
    v17[5] = v7;
  }

  uint64_t v9 = (void *)v23[5];
  if (a2 && !v9)
  {
    *a2 = (id) v17[5];
    uint64_t v9 = (void *)v23[5];
  }

  id v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void sub_183F81D3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id a22)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v23 - 80), 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__43(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__43(uint64_t a1)
{
}

uint64_t _LSNodeIsInDirectoryURL(FSNode *a1, NSURL *a2)
{
  id v3 = a1;
  dispatch_semaphore_t v4 = a2;
  unint64_t v10 = 2LL;
  if (v4)
  {
    [MEMORY[0x1896078A8] defaultManager];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSNode URL](v3, "URL");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v7 = [v5 getRelationship:&v10 ofDirectoryAtURL:v4 toItemAtURL:v6 error:0];

    if (v10 < 2) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0LL;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

void sub_183F81EE4(_Unwind_Exception *a1)
{
  int v5 = v4;

  _Unwind_Resume(a1);
}

int *___ZL17_LSGetProductNamev_block_invoke()
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  unsigned __int8 v0 = getenv("CLASSIC_SUFFIX");
  if (v0)
  {
    unsigned __int8 v1 = v0;
    __n128 result = (int *)strncmp(v0, "iphone", 6uLL);
    if (!(_DWORD)result) {
      goto LABEL_13;
    }
    __n128 result = (int *)strncmp(v1, "ipad", 4uLL);
    if (!(_DWORD)result)
    {
LABEL_34:
      dispatch_semaphore_t v4 = @"ipad";
      goto LABEL_36;
    }
  }

  memset(v9, 0, sizeof(v9));
  size_t v8 = 256LL;
  __n128 result = (int *)sysctlbyname("hw.machine", v9, &v8, 0LL, 0LL);
  if ((_DWORD)result)
  {
    if ((_DWORD)result != -1) {
      return result;
    }
    __n128 result = __error();
    if (*result != 12) {
      return result;
    }
  }

  if (v8 >= 6)
  {
    if (LODWORD(v9[0]) != 1869107305 || WORD2(v9[0]) != 25966) {
      goto LABEL_15;
    }
LABEL_13:
    dispatch_semaphore_t v4 = @"iphone";
LABEL_36:
    _LSGetProductName(void)::_cfBundlePlatform = (uint64_t)v4;
    return result;
  }

  if (v8 < 4) {
    return result;
  }
LABEL_15:
  if (LODWORD(v9[0]) == 1685016681)
  {
    dispatch_semaphore_t v4 = @"ipod";
    goto LABEL_36;
  }

  if (LODWORD(v9[0]) == 1684099177) {
    goto LABEL_34;
  }
  if (v8 < 5) {
    return result;
  }
  if (LODWORD(v9[0]) == 1668571479 && BYTE4(v9[0]) == 104)
  {
    dispatch_semaphore_t v4 = @"watch";
    goto LABEL_36;
  }

  if (v8 < 7) {
    return result;
  }
  if (LODWORD(v9[0]) == 1819308097 && *(_DWORD *)((char *)v9 + 3) == 1448371564)
  {
    dispatch_semaphore_t v4 = @"appletv";
    goto LABEL_36;
  }

  if (v8 >= 0xD && *(void *)&v9[0] == 0x447974696C616552LL && *(void *)((char *)v9 + 5) == 0x6563697665447974LL)
  {
    dispatch_semaphore_t v4 = @"reality";
    goto LABEL_36;
  }

  return result;
}

void sub_183F82250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _LSValidationTokenComputeHMAC(NSData *a1, NSData *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  dispatch_semaphore_t v4 = a2;
  _LSAssertRunningInServer((uint64_t)"NSData *_LSValidationTokenComputeHMAC(NSData *__strong, NSData *__strong)");
  uint64_t v5 = [(id)__LSDefaultsGetSharedInstance() HMACSecret];
  int v6 = (void *)v5;
  unsigned int v7 = 0LL;
  if (v4 && v3 && v5)
  {
    size_t v8 = (void *)-[NSData mutableCopy](v3, "mutableCopy");
    [v8 appendData:v4];
    id v9 = v6;
    uint64_t v10 = (const void *)objc_msgSend(v9, "bytes", 0, 0, 0, 0, 0, 0, 0, 0);
    size_t v11 = [v9 length];
    id v12 = v8;
    CCHmac(4u, v10, v11, (const void *)[v12 bytes], objc_msgSend(v12, "length"), &v14);
    [MEMORY[0x189603F48] dataWithBytes:&v14 length:64];
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void sub_183F823C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F82598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F82640( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F82804(_Unwind_Exception *a1)
{
  unsigned int v7 = v6;

  _Unwind_Resume(a1);
}

void sub_183F8293C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F82A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _LSGetVersionFromString(__CFString *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  *a2 = 0u;
  a2[1] = 0u;
  if (a1)
  {
    if (CFStringGetCString(a1, buffer, 1024LL, 0x8000100u))
    {
      LaunchServices::VersionNumber::FromCString((uint64_t)buffer, a2);
    }

    else
    {
      dispatch_semaphore_t v4 = (void *)MEMORY[0x186E2A59C]();
      uint64_t v5 = -[__CFString UTF8String](a1, "UTF8String");
      if (v5) {
        LaunchServices::VersionNumber::FromCString(v5, a2);
      }
      objc_autoreleasePoolPop(v4);
    }
  }

uint64_t LaunchServices::VersionNumber::FromCString@<X0>(uint64_t this@<X0>, _OWORD *a2@<X8>)
{
  void v12[3] = *MEMORY[0x1895F89C0];
  *a2 = 0u;
  a2[1] = 0u;
  if (this)
  {
    id v3 = (char *)(this - 1);
    do
    {
      int v4 = *++v3;
      unsigned int v5 = v4 - 48;
      if (v4) {
        BOOL v6 = v5 > 9;
      }
      else {
        BOOL v6 = 0;
      }
    }

    while (v6);
    uint64_t v7 = 0LL;
    v12[0] = a2;
    v12[1] = (char *)a2 + 8;
    uint64x2_t v12[2] = a2 + 1;
    do
    {
      size_t v8 = (uint64_t *)v12[v7];
      char v9 = *v3;
      if (*v3)
      {
        uint64_t v10 = 0LL;
        ++v3;
        while (v9 != 46)
        {
          if ((v9 - 48) >= 0xAu)
          {
            uint64_t *v8 = v10;
            return this;
          }

          uint64_t v10 = (v9 - 48) + 10 * v10;
          int v11 = *v3++;
          char v9 = v11;
          if (!v11)
          {
            --v3;
            break;
          }
        }
      }

      else
      {
        uint64_t v10 = 0LL;
      }

      uint64_t *v8 = v10;
      ++v7;
    }

    while (v7 != 3);
  }

  return this;
}

double _LSVersionNumberGetCurrentSystemVersion@<D0>(_OWORD *a1@<X8>)
{
  if (_LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::once != -1) {
    dispatch_once( &_LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::once,  &__block_literal_global_70);
  }
  double result = *(double *)&_LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::cachedSystemVersion;
  __int128 v3 = unk_18C49A9A8;
  *a1 = _LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::cachedSystemVersion;
  a1[1] = v3;
  return result;
}

CFStringRef _LSVersionNumberCopyStringRepresentation(_OWORD *a1)
{
  __int128 v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  return LaunchServices::VersionNumber::copyStringRepresentation((LaunchServices::VersionNumber *)v3);
}

uint64_t _LSVersionNumberHash(void *a1)
{
  return a1[1] ^ *a1 ^ a1[2];
}

uint64_t _LSVersionNumberGetMajorComponent(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t _LSVersionNumberGetMinorComponent(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t _LSVersionNumberGetBugFixComponent(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t _LSMakeVersionNumber@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  a4[3] = 0LL;
  return result;
}

uint64_t _LSMakeVersionNumberFromDYLDVersion@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = WORD1(result);
  a2[1] = BYTE1(result);
  a2[2] = result;
  a2[3] = 0LL;
  return result;
}

uint64_t _LSMakeDYLDVersionFromVersionNumber(uint64x2_t *a1)
{
  unint64_t v1 = a1[1].u64[0];
  if (v1 >= 0xFF) {
    LODWORD(v1) = 255;
  }
  int64x2_t v2 = (int64x2_t)vshlq_u64( (uint64x2_t)vbslq_s8( (int8x16_t)vcgtq_u64((uint64x2_t)xmmword_183FBF580, *a1),  *(int8x16_t *)a1,  (int8x16_t)xmmword_183FBF580),  (uint64x2_t)xmmword_183FBF590);
  return vorrq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), (int8x16_t)v2).u32[0] | v1;
}

uint64_t _LSGetCurrentSystemBuildVersionString()
{
  if (_LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::once != -1) {
    dispatch_once( &_LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::once,  &__block_literal_global_70);
  }
  return _LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::cachedBuildVersion;
}

double _LSGetVersionForArchitecture@<D0>( const __CFDictionary *a1@<X0>, const void *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  *a3 = 0u;
  a3[1] = 0u;
  Value = (__CFString *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    BOOL v6 = Value;
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v6))
    {
      _LSGetVersionFromString(v6, v9);
      double result = *(double *)v9;
      __int128 v8 = v9[1];
      *a3 = v9[0];
      a3[1] = v8;
    }
  }

  return result;
}

void ___ZL45_LSGetCurrentSystemIOSSupportAndBuildVersionsP15LSVersionNumberS0_PPK10__CFStringS0_S4__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  unsigned __int8 v0 = (const __CFDictionary *)_CFCopySystemVersionPlatformDictionary();
  if (v0)
  {
    unint64_t v1 = v0;
    Value = (__CFString *)CFDictionaryGetValue(v0, (const void *)*MEMORY[0x189604B78]);
    if (Value)
    {
      _LSGetVersionFromString(Value, v4);
      _LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::cachedSystemVersion = v4[0];
      unk_18C49A9A8 = v4[1];
    }

    __int128 v3 = (const __CFString *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x189604B60]);
    if (v3) {
      _LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::cachedBuildVersion = (uint64_t)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], v3);
    }
    CFRelease(v1);
  }

void sub_183F82F2C(_Unwind_Exception *a1)
{
}

void sub_183F83060( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

uint64_t _LSIsArrayWithValuesOfClasses(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = _LSIsSequenceOfClassWithValuesOfClasses(v4, v5, v3);

  return v6;
}

uint64_t _LSIsSequenceOfClassWithValuesOfClasses(void *a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a3;
  if (v5 && (!a2 || (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v6)
    {
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        while (2)
        {
          uint64_t v11 = 0LL;
          do
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            if (!_LSIsKindOfClasses(*(void **)(*((void *)&v14 + 1) + 8 * v11), v6))
            {
              uint64_t v12 = 0LL;
              goto LABEL_16;
            }

            ++v11;
          }

          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      uint64_t v12 = 1LL;
LABEL_16:
    }

    else
    {
      uint64_t v12 = 1LL;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  return v12;
}

uint64_t _LSIsArrayWithValuesOfClass(void *a1, void *a2)
{
  id v3 = a1;
  id v6 = a2;
  if (a2) {
    a2 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v6 count:1];
  }
  uint64_t v4 = _LSIsArrayWithValuesOfClasses(v3, a2);

  return v4;
}

uint64_t _LSIsSetWithValuesOfClasses(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = _LSIsSequenceOfClassWithValuesOfClasses(v4, v5, v3);

  return v6;
}

uint64_t _LSIsSetWithValuesOfClass(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v6 = a2;
  if (a2) {
    a2 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v6 count:1];
  }
  uint64_t v4 = _LSIsSetWithValuesOfClasses(v3, a2);

  return v4;
}

uint64_t _LSIsDictionaryWithKeysAndValuesOfClasses(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  unint64_t v6 = a2;
  unint64_t v7 = a3;
  uint64_t v15 = 0LL;
  __int128 v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 1;
  if (!v5)
  {
    uint64_t v8 = &v18;
LABEL_7:
    char *v8 = 0;
    goto LABEL_8;
  }

  if ((_NSIsNSDictionary() & 1) == 0)
  {
    uint64_t v8 = (char *)(v16 + 3);
    goto LABEL_7;
  }

  if (v6 | v7)
  {
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = ___LSIsDictionaryWithKeysAndValuesOfClasses_block_invoke;
    v11[3] = &unk_189D79148;
    id v12 = (id)v6;
    id v13 = (id)v7;
    __int128 v14 = &v15;
    [v5 enumerateKeysAndObjectsUsingBlock:v11];
  }

void sub_183F83548( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t _LSIsKindOfClasses(void *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = a2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

          char isKindOfClass = 1;
          goto LABEL_15;
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (_LSClassListContainsBundleRecord(v4))
  {
    _LSDefaultLog();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      _LSIsKindOfClasses_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  else
  {
    char isKindOfClass = 0;
  }

uint64_t _LSIsDictionaryWithKeysAndValuesOfClass(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v8 = a3;
  uint64_t v9 = a2;
  if (a2) {
    a2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189604010]), "initWithObjects:count:", &v9, 1, v8);
  }
  if (a3) {
    a3 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v8 count:1];
  }
  uint64_t v6 = _LSIsDictionaryWithKeysAndValuesOfClasses(v5, a2, a3);

  return v6;
}

uint64_t _LSClassListContainsBundleRecord(void *a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v1);
        }
        id v5 = *(__objc2_class **)(*((void *)&v8 + 1) + 8 * i);
        if (v5 == &OBJC_CLASS___LSRecord || v5 == &OBJC_CLASS___LSBundleRecord)
        {
          uint64_t v2 = 1LL;
          goto LABEL_14;
        }
      }

      uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }

CFStringRef _UTTypeIdentifierIsDynamic(const __CFString *result)
{
  if (result)
  {
    id v1 = result;
    if (CFStringGetLength(result) < 5)
    {
      return 0LL;
    }

    else
    {
      v2.id location = 0LL;
      v2.length = 4LL;
      return (const __CFString *)(CFStringCompareWithOptions(v1, @"dyn.", v2, 1uLL) == kCFCompareEqualTo);
    }
  }

  return result;
}

CFStringRef _UTTypeCreateDynamicIdentifierForTag( void **a1, CFStringRef inUTI, const __CFString *a3, const __CFString *a4)
{
  CFStringRef result = 0LL;
  if (inUTI && a3)
  {
    if (a1)
    {
      int v12 = 0;
      if (!_UTGetActiveTypeForCFStringIdentifier(*a1, inUTI, &v12))
      {
        int v11 = 0;
        return _UTTypeCreateDynamicIdentifierForTagCommon(inUTI, a3, a4, v11);
      }

      unsigned int TypeCaseInsensitiveText = _UTTypeGetTypeCaseInsensitiveText((_LSDatabase *)*a1);
      int v10 = _UTTypeConformsTo(*a1, v12, TypeCaseInsensitiveText);
    }

    else
    {
      int v10 = UTTypeConformsTo(inUTI, @"public.case-insensitive-text");
    }

    int v11 = v10;
    return _UTTypeCreateDynamicIdentifierForTagCommon(inUTI, a3, a4, v11);
  }

  return result;
}

CFStringRef _UTTypeCreateDynamicIdentifierForTagCommon( const __CFString *a1, const __CFString *a2, const __CFString *a3, int a4)
{
  CFStringRef DynamicIdentifierForFileInfo = 0LL;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (a1 && a2)
  {
    memset(v20, 0, sizeof(v20));
    CFTypeID v9 = CFGetTypeID(a1);
    if (v9 == CFStringGetTypeID())
    {
      CFIndex Length = CFStringGetLength(a1);
      int v11 = XCFBufInitWithCFStringRange((uint64_t)v20, a1, 0LL, Length, 1);
    }

    else
    {
      XCFBufInit((uint64_t)v20);
      int v11 = 0;
    }

    memset(v19, 0, sizeof(v19));
    CFTypeID v12 = CFGetTypeID(a2);
    if (v12 == CFStringGetTypeID())
    {
      CFIndex v13 = CFStringGetLength(a2);
      int v14 = XCFBufInitWithCFStringRange((uint64_t)v19, a2, 0LL, v13, a4);
      if (v11 && v14)
      {
        memset(v18, 0, sizeof(v18));
        if (a3)
        {
          CFTypeID v15 = CFGetTypeID(a3);
          if (v15 == CFStringGetTypeID())
          {
            CFIndex v16 = CFStringGetLength(a3);
            if (XCFBufInitWithCFStringRange((uint64_t)v18, a3, 0LL, v16, 1))
            {
              CFStringRef DynamicIdentifierForFileInfo = _UTTypeCreateDynamicIdentifierForFileInfo( (uint64_t)v19,  (uint64_t)v20,  (uint64_t)v18,  1LL);
              XCFBufDestroy((uint64_t)v18);
LABEL_21:
              XCFBufDestroy((uint64_t)v19);
LABEL_22:
              XCFBufDestroy((uint64_t)v20);
              return DynamicIdentifierForFileInfo;
            }
          }

          else
          {
            XCFBufInit((uint64_t)v18);
          }

          CFStringRef DynamicIdentifierForFileInfo = 0LL;
          goto LABEL_21;
        }

        CFStringRef DynamicIdentifierForFileInfo = _UTTypeCreateDynamicIdentifierForFileInfo((uint64_t)v19, (uint64_t)v20, 0LL, 0LL);
        goto LABEL_21;
      }

      if (v14) {
        XCFBufDestroy((uint64_t)v19);
      }
    }

    else
    {
      XCFBufInit((uint64_t)v19);
    }

    CFStringRef DynamicIdentifierForFileInfo = 0LL;
    if (!v11) {
      return DynamicIdentifierForFileInfo;
    }
    goto LABEL_22;
  }

  return DynamicIdentifierForFileInfo;
}

CFStringRef _UTTypeCreateDynamicIdentifierForFileInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!a2 || a4)
  {
    XCFBufInit((uint64_t)&v17);
    if (a4)
    {
      XCFBufAppend((unsigned int *)&v17, "?0=", 3u);
      uint64_t v8 = 0LL;
      CFTypeID v9 = (_DWORD *)(a3 + 8);
      do
      {
        if (v8) {
          XCFBufAppend((unsigned int *)&v17, ",", 1u);
        }
        int v10 = (void *)*((void *)v9 - 1);
        unsigned int v11 = *v9;
        v9 += 4;
        XCFBufInitWithBytes((uint64_t)&v19, v10, v11, 0);
        _UTAbbreviateTerm(&v19);
        _UTAppendCharactersAddingEscapes((unsigned int *)&v17, v19, v20);
        XCFBufDestroy((uint64_t)&v19);
        ++v8;
      }

      while (a4 != v8);
    }
  }

  else
  {
    if (*(void *)a2) {
      CFStringGetLength(@"public.filename-extension");
    }
    XCFBufInit((uint64_t)&v17);
  }

  if (a1)
  {
    if (v18) {
      XCFBufAppend((unsigned int *)&v17, ":", 1u);
    }
    XCFBufInitWithBytes((uint64_t)&v19, *(void **)a2, *(unsigned int *)(a2 + 8), 0);
    _UTAbbreviateTerm(&v19);
    _UTAppendCharactersAddingEscapes((unsigned int *)&v17, v19, v20);
    XCFBufDestroy((uint64_t)&v19);
    XCFBufAppend((unsigned int *)&v17, "=", 1u);
    _UTAppendCharactersAddingEscapes((unsigned int *)&v17, *(_BYTE **)a1, *(_DWORD *)(a1 + 8));
  }

  CFStringRef v12 = 0LL;
  CFIndex v13 = v17;
  if (v17)
  {
    unsigned int v14 = v18;
    if (v18)
    {
      memset(v21, 0, sizeof(v21));
      XCFBufInit((uint64_t)v21);
      XCFBufAppend((unsigned int *)v21, "dyn.a", 5u);
      int v15 = _UTBase32EncodedLength(v14);
      XCFBufAddCapacity((unsigned int *)v21, v15);
      _UTBase32Encode(v13, v14, (_BYTE *)(*(void *)&v21[0] + DWORD2(v21[0])));
      DWORD2(v21[0]) += v15;
      *(_BYTE *)(*(void *)&v21[0] + DWORD2(v21[0])) = 0;
      CFStringRef v12 = CFStringCreateWithBytes( (CFAllocatorRef)*MEMORY[0x189604DB0],  *(const UInt8 **)&v21[0],  DWORD2(v21[0]),  0x8000100u,  0);
      XCFBufDestroy((uint64_t)v21);
    }
  }

  XCFBufDestroy((uint64_t)&v17);
  return v12;
}

_DWORD *_UTAbbreviateTerm(_DWORD *result)
{
  size_t v1 = result[2];
  if (v1 >= 3)
  {
    CFRange v2 = result;
    uint64_t v3 = 0LL;
    id v4 = *(char **)result;
    while (1)
    {
      id v5 = builtins[v3];
      CFStringRef result = (_DWORD *)strncmp(v5, v4, v1);
      if (!(_DWORD)result && !v5[v1]) {
        break;
      }
      if (++v3 == 22) {
        return result;
      }
    }

    if ((v3 & 0xFFFFFFF0) != 0)
    {
      char *v4 = a0123456789abcd_0[v3 >> 4];
      *(_BYTE *)(*(void *)v2 + 1LL) = a0123456789abcd_0[v3 & 0xF];
      *(_BYTE *)(*(void *)v2 + 2LL) = 0;
      int v6 = 2;
    }

    else
    {
      char *v4 = a0123456789abcd_0[v3];
      int v6 = 1;
    }

    v2[2] = v6;
  }

  return result;
}

unsigned int *_UTAppendCharactersAddingEscapes(unsigned int *a1, _BYTE *a2, unsigned int a3)
{
  CFStringRef result = XCFBufAddCapacity(a1, 2 * a3);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = a1[2];
  if (a3)
  {
    CFTypeID v9 = (_BYTE *)(v7 + v8);
    uint64_t v10 = a3;
    do
    {
      int v11 = (char)*a2;
      if ((v11 - 44) <= 0x30 && ((1LL << (*a2 - 44)) & 0x1000000024001LL) != 0 || v11 == 0)
      {
        *v9++ = 92;
        ++a1[2];
        LOBYTE(v11) = *a2;
      }

      *v9++ = v11;
      uint64_t v8 = a1[2] + 1;
      a1[2] = v8;
      ++a2;
      --v10;
    }

    while (v10);
    uint64_t v7 = *(void *)a1;
  }

  *(_BYTE *)(v7 + v_Block_object_dispose(va, 8) = 0;
  return result;
}

CFStringRef _UTTypeCreateDynamicIdentifierForTaggedPointerObject(__CFString *a1, int a2)
{
  CFRange v2 = (const __CFString **)&kUTTypePackage;
  if (!a2) {
    CFRange v2 = (const __CFString **)&kUTTypeData;
  }
  return _UTTypeCreateDynamicIdentifierForTagCommon(@"public.filename-extension", a1, *v2, 1);
}

uint64_t _UTDynamicValuesSearch( uint64_t a1, const __CFString *a2, int a3, uint64_t a4, uint64_t (*a5)(uint64_t *), uint64_t a6)
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  XCFBufInit((uint64_t)&v42);
  if (a2 && (CFTypeID v12 = CFGetTypeID(a2), v12 == CFStringGetTypeID()))
  {
    CFIndex Length = CFStringGetLength(a2);
    XCFBufInitWithCFStringRange((uint64_t)&v44, a2, 0LL, Length, 0);
  }

  else
  {
    XCFBufInit((uint64_t)&v44);
  }

  if (v45 >= 5 && *(_BYTE *)(v44 + 4) == 97)
  {
    int v14 = _UTBase32DecodedLength(v45 - 5);
    XCFBufAddCapacity((unsigned int *)&v42, v14);
    BOOL v15 = _UTBase32Decode(v44 + 5, v45 - 5, v42);
    v42[v14] = 0;
    unsigned int v43 = v14;
    XCFBufDestroy((uint64_t)&v44);
    if (v15)
    {
      uint64_t v51 = a6;
      uint64_t i = v42;
      uint64_t v44 = a1;
      id v46 = (char *)v42;
      if (v42)
      {
        while (1)
        {
          uint64_t v17 = v42;
          unsigned int v18 = &v42[v43];
          if (i - v42 == v43)
          {
            unsigned int v19 = 0;
            goto LABEL_24;
          }

          unsigned int v20 = i;
          uint64_t v21 = i;
          while (1)
          {
            int v22 = *v21;
            if (v22 == 61) {
              break;
            }
            if (v21 + 1 == v18) {
              uint64_t v23 = v21;
            }
            else {
              uint64_t v23 = v21 + 1;
            }
            if (v22 == 92 && v17 != 0LL) {
              uint64_t v21 = v23;
            }
            unsigned __int8 v25 = *v21++;
            *v20++ = v25;
            if (v21 == v18)
            {
              uint64_t v40 = 0LL;
              LODWORD(v47) = 0;
              id v46 = 0LL;
              goto LABEL_79;
            }
          }

          unsigned int v19 = (_DWORD)v21 - (_DWORD)i;
          for (uint64_t i = v21; ; uint64_t i = v29 + 1)
          {
LABEL_24:
            if (i == v18)
            {
              uint64_t i = 0LL;
              goto LABEL_38;
            }

            int v26 = *i;
            if (v26 == 58) {
              break;
            }
            if (i + 1 == v18) {
              id v27 = i;
            }
            else {
              id v27 = i + 1;
            }
            if (v26 != 92 || v17 == 0LL) {
              uint64_t v29 = i;
            }
            else {
              uint64_t v29 = v27;
            }
          }

          ++i;
LABEL_38:
          LODWORD(v47) = v19;
          if (v19)
          {
            uint64_t v30 = v46;
            if (*v46 == 63)
            {
              unsigned int v45 = 1;
              uint64_t v30 = ++v46;
              LODWORD(v47) = --v19;
            }

            else
            {
              unsigned int v45 = 2;
            }

            uint64_t v49 = &v30[v19 + 1];
            uint64_t v31 = _UTDebreviateTerm(&v46);
            id v46 = v31;
            uint64_t v47 = v32;
            if (!a3 || v45 == a3)
            {
              if (!a4) {
                goto LABEL_52;
              }
              uint64_t v40 = 0LL;
              if (*(_DWORD *)(a4 + 8) != (_DWORD)v32 || !v31) {
                goto LABEL_45;
              }
              if (!strncmp(*(const char **)a4, v31, v32))
              {
LABEL_52:
                int v48 = 0;
                int v33 = (int)v49;
                if (v49)
                {
                  do
                  {
                    if (v43 <= v33 - (int)v42)
                    {
                      uint64_t v38 = 0LL;
                      uint64_t v40 = 0LL;
                      LODWORD(v50) = 0;
                    }

                    else
                    {
                      uint64_t v34 = &v42[v33 - (_DWORD)v42];
                      if (v33 - (_DWORD)v42 != (unint64_t)v43)
                      {
                        id v35 = &v42[v43];
                        id v36 = &v42[v33 - (_DWORD)v42];
                        do
                        {
                          int v37 = *v36;
                          if (v37 == 92)
                          {
                            if (v36 + 1 != v35) {
                              ++v36;
                            }
                            LOBYTE(v37) = *v36;
                          }

                          else if (v37 == 44 || v37 == 58)
                          {
                            if (v37 == 58) {
                              uint64_t v38 = 0LL;
                            }
                            else {
                              uint64_t v38 = (char *)(v36 + 1);
                            }
                            goto LABEL_69;
                          }

                          ++v36;
                          *v34++ = v37;
                        }

                        while (v36 != v35);
                      }

                      uint64_t v38 = 0LL;
LABEL_69:
                      LODWORD(v50) = (_DWORD)v34 - v33;
                      if ((_DWORD)v34 == v33)
                      {
                        uint64_t v40 = 0LL;
                      }

                      else
                      {
                        if (v45 == 1)
                        {
                          uint64_t v49 = _UTDebreviateTerm(&v49);
                          uint64_t v50 = v39;
                        }

                        uint64_t v40 = a5(&v44);
                      }
                    }

                    uint64_t v49 = v38;
                    ++v48;
                    if (!v38) {
                      break;
                    }
                    int v33 = (int)v38;
                  }

                  while (!(_DWORD)v40);
                  goto LABEL_45;
                }
              }
            }
          }

          uint64_t v40 = 0LL;
LABEL_45:
          id v46 = (char *)i;
          if (!i || (_DWORD)v40) {
            goto LABEL_79;
          }
        }
      }
    }
  }

  else
  {
    XCFBufDestroy((uint64_t)&v44);
  }

  uint64_t v40 = 0LL;
LABEL_79:
  XCFBufDestroy((uint64_t)&v42);
  return v40;
}

char *_UTDebreviateTerm(_DWORD *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFRange v2 = *(char **)a1;
  if (!*(void *)a1) {
    return v2;
  }
  unsigned int v3 = a1[2];
  if (!v3) {
    return 0LL;
  }
  if (v3 <= 2)
  {
    __int16 v8 = 0;
    char __str = *v2;
    if (v3 == 2) {
      LOBYTE(v_Block_object_dispose(va, 8) = v2[1];
    }
    *__error() = 0;
    unint64_t v4 = strtoul(&__str, 0LL, 16);
    if (!v4 && *__error()) {
      return *(char **)a1;
    }
    unint64_t v5 = 0xFFFFFFFFLL;
    if (v4 < 0xFFFFFFFF) {
      unint64_t v5 = v4;
    }
    if (v5 > 0x15)
    {
      return *(char **)a1;
    }

    else
    {
      CFRange v2 = builtins[v5];
      strlen(v2);
    }
  }

  return v2;
}

id _UTDynamicGetFirstTag(const __CFString *a1, const __CFString *cf)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  CFTypeID v12 = __Block_byref_object_copy__44;
  CFIndex v13 = __Block_byref_object_dispose__44;
  id v14 = 0LL;
  if (cf && (CFTypeID v4 = CFGetTypeID(cf), v4 == CFStringGetTypeID()))
  {
    CFIndex Length = CFStringGetLength(cf);
    if (XCFBufInitWithCFStringRange((uint64_t)v15, cf, 0LL, Length, 1))
    {
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      v8[2] = ___UTDynamicGetFirstTag_block_invoke;
      v8[3] = &unk_189D79170;
      v8[4] = &v9;
      _UTDynamicValuesSearch( 0LL,  a1,  2,  (uint64_t)v15,  (uint64_t (*)(uint64_t *))_UTDynamicValuesSearchWithBlock::$_0::__invoke,  (uint64_t)v8);
      XCFBufDestroy((uint64_t)v15);
    }
  }

  else
  {
    XCFBufInit((uint64_t)v15);
  }

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_183F84EA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__44(uint64_t a1)
{
}

uint64_t _UTDynamicGetTagSpecification(const __CFString *a1)
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  __int16 v8 = __Block_byref_object_copy__44;
  uint64_t v9 = __Block_byref_object_dispose__44;
  id v10 = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  _OWORD v4[2] = ___UTDynamicGetTagSpecification_block_invoke;
  v4[3] = &unk_189D79170;
  v4[4] = &v5;
  _UTDynamicValuesSearch( 0LL,  a1,  2,  0LL,  (uint64_t (*)(uint64_t *))_UTDynamicValuesSearchWithBlock::$_0::__invoke,  (uint64_t)v4);
  if ([(id)v6[5] count])
  {
    id v1 = objc_alloc(MEMORY[0x189603F68]);
    uint64_t v2 = [v1 initWithDictionary:v6[5] copyItems:1];
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_183F85038( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_183F85174( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void _UTDynamicEnumerateTagsFoundInDatabase(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  v4[1] = 3221225472LL;
  _OWORD v4[2] = ___UTDynamicEnumerateTagsFoundInDatabase_block_invoke;
  v4[3] = &unk_189D79198;
  v4[4] = a1;
  void v4[5] = a3;
  id TagSpecification = (id)_UTDynamicGetTagSpecification(a2);
  v4[0] = MEMORY[0x1895F87A8];
  [TagSpecification enumerateKeysAndObjectsUsingBlock:v4];
}

void sub_183F85218( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F8539C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _UTDynamicGetParentIdentifiers(const __CFString *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x189603FA8]);
  unsigned int v3 = v2;
  if (v2)
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    _DWORD v7[2] = ___UTDynamicGetParentIdentifiers_block_invoke;
    v7[3] = &unk_189D791C0;
    id v4 = v2;
    id v8 = v4;
    _UTDynamicEnumerateParentIdentifiers(a1, (uint64_t)v7);
    if ([v4 count]) {
      uint64_t v5 = [v4 copy];
    }
    else {
      uint64_t v5 = 0LL;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

void sub_183F85480( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t _UTDynamicEnumerateParentIdentifiers(const __CFString *a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  _OWORD v3[2] = ___UTDynamicEnumerateParentIdentifiers_block_invoke;
  v3[3] = &unk_189D791E8;
  void v3[4] = a2;
  return _UTDynamicValuesSearch( 0LL,  a1,  1,  (uint64_t)&kUTTypeConformsToKeyChars,  (uint64_t (*)(uint64_t *))_UTDynamicValuesSearchWithBlock::$_0::__invoke,  (uint64_t)v3);
}

void sub_183F85550( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F855D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

uint64_t _UTDynamicGetPedigree(uint64_t a1, __CFString *a2)
{
  id v2 = 0LL;
  if (a1 && a2)
  {
    id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
    if (v5)
    {
      id v6 = (void *)-[__CFString copy](a2, "copy");
      [v5 addObject:v6];

      uint64_t v9 = MEMORY[0x1895F87A8];
      uint64_t v10 = 3221225472LL;
      uint64_t v11 = ___UTDynamicGetPedigree_block_invoke;
      CFTypeID v12 = &unk_189D79210;
      uint64_t v14 = a1;
      id v2 = v5;
      id v13 = v2;
      _UTDynamicEnumerateParentIdentifiers(a2, (uint64_t)&v9);
    }

    else
    {
      id v2 = 0LL;
    }
  }

  uint64_t v7 = objc_msgSend(v2, "copy", v9, v10, v11, v12);

  return v7;
}

void sub_183F856D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_183F857E0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
}

uint64_t _UTDynamicValuesSearchWithBlock::$_0::__invoke(uint64_t a1)
{
  id v2 = (void (**)(void, void, void, void, void, void))MEMORY[0x186E2A7B8](*(void *)(a1 + 56));
  unsigned __int8 v5 = 0;
  ((void (**)(void, void, uint64_t, void, uint64_t, unsigned __int8 *))v2)[2]( v2,  *(unsigned int *)(a1 + 8),  a1 + 16,  *(unsigned int *)(a1 + 32),  a1 + 40,  &v5);
  uint64_t v3 = v5;

  return v3;
}

void sub_183F85868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag( CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  uint64_t v3 = 0LL;
  if (inTagClass && inTag)
  {
    uint64_t v7 = (void *)MEMORY[0x186E2A59C]();
    +[UTTypeRecord typeRecordWithTag:ofClass:conformingToIdentifier:]( &OBJC_CLASS___UTTypeRecord,  "typeRecordWithTag:ofClass:conformingToIdentifier:",  inTag,  inTagClass,  inConformingToUTI);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 identifier];
      uint64_t v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v3 = 0LL;
    }

    objc_autoreleasePoolPop(v7);
  }

  return v3;
}

void sub_183F8590C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFArrayRef UTTypeCreateAllIdentifiersForTag( CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  id v3 = 0LL;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (inTagClass && inTag)
  {
    uint64_t v7 = (void *)MEMORY[0x186E2A59C]();
    +[UTTypeRecord typeRecordsWithTag:ofClass:conformingToIdentifier:]( &OBJC_CLASS___UTTypeRecord,  "typeRecordsWithTag:ofClass:conformingToIdentifier:",  inTag,  inTagClass,  inConformingToUTI);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t i = 0LL; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v9);
            }
            objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "identifier", (void)v15);
            id v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v3 addObject:v13];
          }

          uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }

        while (v10);
      }
    }

    else
    {
      id v3 = 0LL;
    }

    objc_autoreleasePoolPop(v7);
  }

  return (CFArrayRef)v3;
}

void sub_183F85A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  id v2 = UTTypeCopyAllTagsWithClass(inUTI, inTagClass);
  if (!v2) {
    return 0LL;
  }
  id v3 = v2;
  if (CFArrayGetCount(v2) < 1)
  {
    unsigned __int8 v5 = 0LL;
  }

  else
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v3, 0LL);
    unsigned __int8 v5 = (const __CFString *)CFRetain(ValueAtIndex);
  }

  CFRelease(v3);
  return v5;
}

CFArrayRef UTTypeCopyAllTagsWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  id v2 = 0LL;
  if (inUTI && inTagClass)
  {
    unsigned __int8 v5 = (void *)MEMORY[0x186E2A59C]();
    +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", inUTI);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 tagSpecification];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = objc_opt_class();
      [v8 objectForKey:inTagClass ofClass:v9 valuesOfClass:objc_opt_class()];
      id v2 = (void *)objc_claimAutoreleasedReturnValue();

      if (v2) {
        id v10 = v2;
      }
    }

    else
    {
      id v2 = 0LL;
    }

    objc_autoreleasePoolPop(v5);
  }

  return (CFArrayRef)v2;
}

void sub_183F85C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Boolean UTTypeEqual(CFStringRef inUTI1, CFStringRef inUTI2)
{
  if (inUTI1 && inUTI1 == inUTI2) {
    return 1;
  }
  Boolean v2 = 0;
  if (inUTI1 && inUTI2) {
    return _XCFStringEqualCaseInsensitive(inUTI1, inUTI2);
  }
  return v2;
}

uint64_t _UTTypeHash(const __CFString *a1)
{
  return _XCFStringHashCaseInsensitive(a1);
}

CFStringRef _UTTypeCreateSuggestedFilename(__CFString *a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x186E2A59C]();
  uint64_t v5 = 0LL;
  if (a1 && a2)
  {
    [(id)_LSGetUTTypeClass() typeWithIdentifier:a2];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      uint64_t v5 = -[__CFString stringByAppendingPathExtensionForType:](a1, "stringByAppendingPathExtensionForType:", v6);
    }

    else
    {
      uint64_t v5 = 0LL;
    }
  }

  objc_autoreleasePoolPop(v4);
  if (!a1 || v5) {
    return (CFStringRef)v5;
  }
  else {
    return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a1);
  }
}

void sub_183F85D0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _UTTypePrecachePropertiesOfIdentifiers()
{
  if ([(id)__LSDefaultsGetSharedInstance() isAppleInternal])
  {
    _LSDefaultLog();
    unsigned __int8 v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      _UTTypePrecachePropertiesOfIdentifiers_cold_1(v0);
    }
  }

uint64_t _UTTypeIsWildcard(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  Boolean v2 = (void *)MEMORY[0x186E2A59C]();
  +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", a1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 isWildcard];
  }
  else {
    uint64_t v5 = 0LL;
  }

  objc_autoreleasePoolPop(v2);
  return v5;
}

void sub_183F85DE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  Boolean v2 = 0;
  if (inUTI && inConformsToUTI)
  {
    if (inUTI == inConformsToUTI || _XCFStringEqualCaseInsensitive(inUTI, inConformsToUTI))
    {
      return 1;
    }

    else if (_LSCurrentProcessMayMapDatabase() {
           && _UTTypeIdentifierIsDeclarable(inUTI)
    }
           && _UTTypeIdentifierIsDeclarable(inConformsToUTI))
    {
      uint64_t v7 = 0LL;
      if (_LSContextInit(&v7))
      {
        Boolean v2 = 0;
      }

      else
      {
        uint64_t v6 = 0LL;
        if (_UTGetActiveTypeForCFStringIdentifier(v7, inUTI, (_DWORD *)&v6 + 1)
          && _UTGetActiveTypeForCFStringIdentifier(v7, inConformsToUTI, &v6))
        {
          Boolean v2 = _UTTypeConformsTo(v7, SHIDWORD(v6), v6);
        }

        else
        {
          Boolean v2 = 0;
        }

        _LSContextDestroy(&v7);
      }
    }

    else
    {
      return +[UTTypeRecord _typeIdentifier:conformsToTypeIdentifier:]( &OBJC_CLASS___UTTypeRecord,  "_typeIdentifier:conformsToTypeIdentifier:",  inUTI,  inConformsToUTI);
    }
  }

  return v2;
}

void sub_183F85F04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

BOOL _UTTypeIdentifierIsDeclarable(const __CFString *a1)
{
  return !_UTTypeIdentifierIsDynamic(a1) && _UTTypeIdentifierIsValid(a1);
}

uint64_t UTTypeCopyParentIdentifiers(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  Boolean v2 = (void *)MEMORY[0x186E2A59C]();
  +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", a1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [v3 parentTypeIdentifiers];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 array];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 copy];
    }

    else
    {
      uint64_t v8 = 0LL;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  objc_autoreleasePoolPop(v2);
  return v8;
}

void sub_183F86008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t UTTypeCopyChildIdentifiers(const __CFString *a1)
{
  if (!a1 || !_UTTypeIdentifierIsDeclarable(a1)) {
    return 0LL;
  }
  Boolean v2 = (void *)MEMORY[0x186E2A59C]();
  +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", a1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [v3 childTypeIdentifiers];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 allObjects];
    }

    else
    {
      uint64_t v7 = 0LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  objc_autoreleasePoolPop(v2);
  return v7;
}

void sub_183F860D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFStringRef UTTypeCopyDescription(CFStringRef inUTI)
{
  if (!inUTI || !_UTTypeIdentifierIsDeclarable(inUTI)) {
    return 0LL;
  }
  Boolean v2 = (void *)MEMORY[0x186E2A59C]();
  +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", inUTI);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [v3 localizedDescription];
    uint64_t v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  objc_autoreleasePoolPop(v2);
  return v5;
}

void sub_183F86174(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Boolean UTTypeIsDeclared(CFStringRef inUTI)
{
  return _UTTypeGetStatus(inUTI) == 1;
}

uint64_t _UTTypeGetStatus(const __CFString *a1)
{
  if (!_UTTypeIdentifierIsValid(a1)) {
    return -1LL;
  }
  id v3 = (void *)MEMORY[0x186E2A59C]();
  +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", a1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  if (v4) {
    uint64_t v2 = [v4 isDeclared];
  }
  else {
    uint64_t v2 = 0LL;
  }

  objc_autoreleasePoolPop(v3);
  return v2;
}

void sub_183F86230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Boolean UTTypeIsDynamic(CFStringRef inUTI)
{
  if (inUTI)
  {
    id v1 = inUTI;
    LODWORD(inUTI) = _UTTypeIdentifierIsValid(inUTI);
    if ((_DWORD)inUTI) {
      LOBYTE(inUTI) = _UTTypeIdentifierIsDynamic(v1) != 0;
    }
  }

  return inUTI;
}

BOOL _UTTypeIdentifierIsValid(CFStringRef theString)
{
  id v1 = theString;
  if (theString)
  {
    CFIndex Length = CFStringGetLength(theString);
    if (Length >= 3)
    {
      CFIndex v3 = Length;
      CFStringRef theStringa = v1;
      uint64_t v26 = 0LL;
      CFIndex v27 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v1);
      CStringPtr = 0LL;
      uint64_t v24 = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
      }
      uint64_t v6 = 0LL;
      LOBYTE(v1) = 0;
      int v7 = 0;
      uint64_t v28 = 0LL;
      uint64_t v29 = 0LL;
      unsigned __int8 v25 = CStringPtr;
      while (1)
      {
        CFIndex v8 = v7;
        if (v7 < 0 || (uint64_t v9 = v27, v27 <= v7))
        {
          UniChar v10 = 0;
        }

        else if (v24)
        {
          UniChar v10 = v24[v26 + v7];
        }

        else if (v25)
        {
          UniChar v10 = v25[v26 + v7];
        }

        else
        {
          if (v29 <= v7 || v6 > v7)
          {
            uint64_t v17 = v7 - 4LL;
            if (v17 + 64 < v27) {
              uint64_t v9 = v17 + 64;
            }
            uint64_t v28 = v17;
            uint64_t v29 = v9;
            v31.id location = v26 + v17;
            v31.length = v9 - v17;
            CFStringGetCharacters(theStringa, v31, v22);
            uint64_t v6 = v28;
          }

          UniChar v10 = v22[v7 - v6];
        }

        int v11 = v7 + 1;
        CFIndex v12 = v7 + 1;
        if (v3 <= v12) {
          goto LABEL_40;
        }
        while (1)
        {
          if (v7 < -1 || (CFIndex v13 = v27, v27 <= v12))
          {
            UniChar v10 = 0;
LABEL_19:
            goto LABEL_34;
          }

          if (v24)
          {
            UniChar v10 = v24[v12 + v26];
          }

          else if (v25)
          {
            UniChar v10 = v25[v26 + v12];
          }

          else
          {
            if (v29 <= v12 || v6 > v12)
            {
              uint64_t v14 = v12 - 4;
              if ((v12 & 0xFFFFFFFC) == 0) {
                uint64_t v14 = 0LL;
              }
              if (v14 + 64 < v27) {
                CFIndex v13 = v14 + 64;
              }
              uint64_t v28 = v14;
              uint64_t v29 = v13;
              v30.id location = v26 + v14;
              v30.length = v13 - v14;
              CFStringGetCharacters(theStringa, v30, v22);
              uint64_t v6 = v28;
            }

            UniChar v10 = v22[v12 - v6];
          }

          if (v10 == 46) {
            break;
          }
LABEL_34:
          ++v12;
          ++v7;
          if (v3 <= v12) {
            goto LABEL_39;
          }
        }

        UniChar v10 = 46;
LABEL_39:
        CFIndex v8 = v7;
        int v11 = v12;
LABEL_40:
        if ((v7 & 0x80000000) == 0)
        {
          CFIndex v15 = v27;
          if (v27 > v8)
          {
            if (v24)
            {
              UniChar v16 = v24[v26 + v8];
            }

            else if (v25)
            {
              UniChar v16 = v25[v26 + v8];
            }

            else
            {
              if (v29 <= v8 || v6 > v8)
              {
                uint64_t v18 = v8 - 4;
                if (v18 + 64 < v27) {
                  CFIndex v15 = v18 + 64;
                }
                uint64_t v28 = v18;
                uint64_t v29 = v15;
                v32.id location = v26 + v18;
                v32.length = v15 - v18;
                CFStringGetCharacters(theStringa, v32, v22);
                uint64_t v6 = v28;
              }

              UniChar v16 = v22[v8 - v6];
            }

            if (v16 == 45) {
              goto LABEL_69;
            }
          }
        }

        if (v10 == 46 && v3 - 1 > v12)
        {
          LOBYTE(v1) = 1;
          v7 += 2;
        }

        else
        {
          int v7 = v11;
        }

        if (v3 <= v7)
        {
          int v19 = 1;
          goto LABEL_70;
        }
      }
    }

    LOBYTE(v1) = 0;
  }

CFDictionaryRef UTTypeCopyDeclaration(CFStringRef inUTI)
{
  if (!inUTI || !_UTTypeIdentifierIsDeclarable(inUTI)) {
    return 0LL;
  }
  uint64_t v2 = (void *)MEMORY[0x186E2A59C]();
  +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", inUTI);
  CFIndex v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [v3 declaration];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 _expensiveDictionaryRepresentation];
    uint64_t v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  objc_autoreleasePoolPop(v2);
  return v6;
}

void sub_183F86690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFURLRef UTTypeCopyDeclaringBundleURL(CFStringRef inUTI)
{
  if (!inUTI || !_UTTypeIdentifierIsDeclarable(inUTI)) {
    return 0LL;
  }
  uint64_t v2 = (void *)MEMORY[0x186E2A59C]();
  +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", inUTI);
  CFIndex v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [v3 _resolvedPropertyValueForGetter:sel_declaringBundleRecord];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 URL];
      int v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [v4 _declaringBundleBookmark];
      CFIndex v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        && (id v9 = -[FSNode initByResolvingBookmarkData:relativeToNode:bookmarkDataIsStale:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initByResolvingBookmarkData:relativeToNode:bookmarkDataIsStale:error:",  v8,  0LL,  0LL,  0LL)) != 0LL)
      {
        [v4 _delegatePath];
        UniChar v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          uint64_t v11 = [v9 childNodeWithRelativePath:v10 flags:8 error:0];

          id v9 = (id)v11;
        }

        [v9 URL];
        int v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        int v7 = 0LL;
      }
    }
  }

  else
  {
    int v7 = 0LL;
  }

  objc_autoreleasePoolPop(v2);
  return v7;
}

void sub_183F867FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _UTTypeCopyGlyphName(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = (void *)MEMORY[0x186E2A59C]();
  +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", a1);
  CFIndex v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [v3 iconDictionary];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 objectForKeyedSubscript:@"UTTypeGlyphName"];
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  objc_autoreleasePoolPop(v2);
  return v6;
}

void sub_183F868DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _UTTypeCopyIconName(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = (void *)MEMORY[0x186E2A59C]();
  +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", a1);
  CFIndex v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    [v3 iconDictionary];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 objectForKeyedSubscript:@"UTTypeIconName"];
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  objc_autoreleasePoolPop(v2);
  return v6;
}

void sub_183F86990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFArrayRef _UTTypeCopyDynamicIdentifiersForTags(__CFString *a1)
{
  values = a1;
  CFIndex v3 = (void *)MEMORY[0x186E2A59C]();
  +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", a1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
    uint64_t v6 = @"public.data";
    if (([v4 conformsToTypeIdentifier:@"public.data"] & 1) == 0)
    {
      uint64_t v6 = @"com.apple.package";
      if (([v4 conformsToTypeIdentifier:@"com.apple.package"] & 1) == 0)
      {
        else {
          uint64_t v6 = 0LL;
        }
      }
    }

    [v4 tagSpecification];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 _expensiveDictionaryRepresentation];
    CFIndex v8 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = ___UTTypeCopyDynamicIdentifiersForTags_block_invoke;
    v11[3] = &unk_189D79238;
    CFIndex v13 = v6;
    id v9 = v5;
    id v12 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];
    if ([v9 count])
    {
      uint64_t v2 = [v9 allObjects];
    }

    else
    {
      uint64_t v2 = 0LL;
    }
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  objc_autoreleasePoolPop(v3);
  return (CFArrayRef)v2;
}

void sub_183F86B54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_183F86CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _UTTypeCopyPedigree(const __CFString *a1)
{
  uint64_t v2 = (void *)MEMORY[0x186E2A59C]();
  CFIndex v3 = (void *)_UTTypeCopyPedigreeSet((uint64_t)a1);
  if (v3)
  {
    id v4 = v3;
    if ([v3 count] == 1 && _UTTypeIdentifierIsDynamic(a1))
    {

LABEL_7:
      [MEMORY[0x189604010] set];
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    if (!a1) {
      goto LABEL_7;
    }
    if (_UTTypeIdentifierIsValid(a1)) {
      goto LABEL_7;
    }
    [MEMORY[0x189604010] setWithObject:a1];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4) {
      goto LABEL_7;
    }
  }

  uint64_t v5 = [v4 allObjects];

  objc_autoreleasePoolPop(v2);
  return v5;
}

void sub_183F86DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _UTTypeCopyPedigreeSet(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x186E2A59C]();
  +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", a1);
  CFIndex v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 pedigree];
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  objc_autoreleasePoolPop(v2);
  return v5;
}

void sub_183F86E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *_UTCopyDeclaredTypeIdentifiers()
{
  unsigned __int8 v0 = (void *)MEMORY[0x186E2A59C]();
  if (_LSCurrentProcessMayMapDatabase())
  {
    id v15 = 0LL;
    id v12 = 0LL;
    id v13 = 0LL;
    char v14 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    id v1 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = (uint64_t *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v12, v1, 0LL);

    if (v2)
    {
      id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v4 = *v2;
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      _OWORD v9[2] = ___UTCopyDeclaredTypeIdentifiers_block_invoke;
      v9[3] = &unk_189D79260;
      uint64_t v11 = v2;
      id v5 = v3;
      id v10 = v5;
      _UTEnumerateActiveTypes(v4, v9);
      uint64_t v2 = (uint64_t *)v5;
    }

    if (v12 && v14) {
      _LSContextDestroy(v12);
    }
    id v6 = v13;
    id v12 = 0LL;
    id v13 = 0LL;

    char v14 = 0;
    id v7 = v15;
    id v15 = 0LL;
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  objc_autoreleasePoolPop(v0);
  return v2;
}

void sub_183F86F74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18)
{
}

void sub_183F87020( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void *_UTTypeCopyDescriptionLocalizationDictionary(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = (void *)MEMORY[0x186E2A59C]();
  +[UTTypeRecord typeRecordWithIdentifier:](&OBJC_CLASS___UTTypeRecord, "typeRecordWithIdentifier:", a1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 _localizedDescription];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 allStringValues];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6) {
      id v7 = v6;
    }
  }

  else
  {
    id v6 = 0LL;
  }

  objc_autoreleasePoolPop(v2);
  return v6;
}

void sub_183F870CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _UTTypeCopyKindStringForNonMaterializedItem( LaunchServices::BindingEvaluator *a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v6 = (void *)MEMORY[0x186E2A59C]();
  LaunchServices::BindingEvaluator::CreateWithUTI(a1, 0LL, (LaunchServices::BindingEvaluator *)v12);
  id v11 = 0LL;
  uint64_t v7 = LaunchServices::BindingEvaluator::getLocalizedKindString((const LaunchServices::BindingEvaluator *)v12, 0LL, a2, &v11);
  id v8 = v11;
  id v9 = v8;
  if (a3 && !v7) {
    *a3 = v8;
  }
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v12);
  objc_autoreleasePoolPop(v6);

  return v7;
}

void sub_183F871B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _UTTypeCopyKindStringDictionaryForNonMaterializedItem( LaunchServices::BindingEvaluator *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)MEMORY[0x186E2A59C]();
  LaunchServices::BindingEvaluator::CreateWithUTI(a1, 0LL, (LaunchServices::BindingEvaluator *)v10);
  id v9 = 0LL;
  uint64_t v5 = LaunchServices::BindingEvaluator::getLocalizedKindStringDictionary( (const LaunchServices::BindingEvaluator *)v10,  0LL,  &v9);
  id v6 = v9;
  uint64_t v7 = v6;
  if (a2 && !v5) {
    *a2 = v6;
  }
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v10);
  objc_autoreleasePoolPop(v4);

  return v5;
}

void sub_183F872A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _UTExtensionLooksLikeAppendedRandomness(void *a1, CFStringRef theString)
{
  if (!theString) {
    return 0LL;
  }
  CFIndex Length = CFStringGetLength(theString);
  unint64_t v5 = Length;
  v17.id location = 0LL;
  v17.length = Length;
  CFStringGetCharacters(theString, v17, v16);
  uint64_t v6 = 0LL;
  uint64_t v7 = &v16[v5];
  id v8 = v7;
  do
  {
    if (v16[v6] == 45) {
      id v8 = &v16[v6];
    }
    ++v6;
  }

  while (v5 != v6);
  unint64_t v9 = v7 - v8;
  while (++v8 != v7)
  {
    int v13 = *v8;
    if ((v13 - 48) >= 0xA && (v13 & 0xFFFFFFDF) - 65 > 0x19)
    {
      if (v8 != v7) {
        return 0LL;
      }
      break;
    }
  }

  id v15 = CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x189604DB0], v16, v5 - v9);
  BOOL v11 = _UTTypeGetActiveIdentifierForTag(a1, @"public.filename-extension", v15, 0, 0LL) != 0;
  CFRelease(v15);
  return v11;
}

CFTypeRef _LSCreateDeviceTypeIdentifierWithModelCode(uint64_t a1)
{
  return _LSCreateDeviceTypeIdentifierWithModelCodeAndColorComponents(a1, 0LL);
}

CFTypeRef _LSCreateDeviceTypeIdentifierWithModelCodeAndColorComponents(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v4 = (void *)_LSGetUTTypeClass();
  if (!v4) {
    return CFRetain(@"public.device");
  }
  unint64_t v5 = v4;
  if (a1)
  {
    if (a2)
    {
      uint64_t v6 = softLink_UTHardwareColorMakeWithRGBComponents
         ? softLink_UTHardwareColorMakeWithRGBComponents(*a2, a2[1], a2[2])
         : 0LL;
      [v5 _typeWithDeviceModelCode:a1 enclosureColor:v6];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [v4 _typeWithDeviceModelCode:a1];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    [v4 _typeOfCurrentDevice];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  id v8 = v7;
  if (v7 && ([v7 identifier], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v8, v9)) {
    return (CFTypeRef)v9;
  }
  else {
    return CFRetain(@"public.device");
  }
}

void sub_183F874F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t (*init_UTHardwareColorMakeWithRGBComponents( uint64_t a1, uint64_t a2, uint64_t a3))(unsigned __int8, unsigned __int8, unsigned __int8)
{
  uint64_t v6 = (void *)UniformTypeIdentifiersLibrary(void)::frameworkLibrary;
  if (!UniformTypeIdentifiersLibrary(void)::frameworkLibrary)
  {
    uint64_t v6 = dlopen("/System/Library/Frameworks/UniformTypeIdentifiers.framework/UniformTypeIdentifiers", 2);
    UniformTypeIdentifiersLibrary(void)::frameworkLibrary = (uint64_t)v6;
  }

  CFStringRef result = (uint64_t (*)(unsigned __int8, unsigned __int8, unsigned __int8))dlsym( v6,  "_UTHardwareColorMakeWithRGBComponents");
  softLink_UTHardwareColorMakeWithRGBComponents = result;
  if (result) {
    return (uint64_t (*)(unsigned __int8, unsigned __int8, unsigned __int8))result(a1, a2, a3);
  }
  return result;
}

uint64_t _UTTypeAdd(void *a1, uint64_t a2, _DWORD *a3)
{
  unint64_t v5 = a1;
  uint64_t v6 = v5;
  if (v5 && v5->store)
  {
    CSBindableKeyMapNextKey();
    int v7 = CSStoreAllocUnitWithData();
    if (v7)
    {
      CSMapSetValue();
      -[_LSDatabase setTypeDeclarationsChanged:](v6, 1);
      if (a3) {
        *a3 = v7;
      }
      if ((*(_BYTE *)(a2 + 8) & 0x20) != 0) {
        _CSStoreGarbageCollect();
      }
      uint64_t v8 = 0LL;
    }

    else
    {
      uint64_t v8 = 4294957803LL;
    }
  }

  else
  {
    uint64_t v8 = 4294967246LL;
  }

  return v8;
}

void sub_183F876BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _UTTypeAddWithDeclarationDictionary()
{
  unsigned __int8 v0 = (void *)MEMORY[0x1895F8858]();
  __int128 v104 = v1;
  int v3 = v2;
  unsigned int v5 = v4;
  int v7 = v6;
  uint64_t v9 = v8;
  uint64_t v130 = *MEMORY[0x1895F89C0];
  id v10 = v0;
  id v105 = v7;
  int v122 = 0;
  __int128 v126 = kLSVersionNumberNull;
  __int128 v127 = *(_OWORD *)algn_183FBF5B0;
  if ((v5 & 0x2000) != 0)
  {
    uint64_t v11 = _LSGetPlugin((uint64_t)v10, v3);
    if (!v11) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }

  uint64_t v11 = _LSBundleGet(v10, v3);
  if (v11)
  {
LABEL_3:
    __int128 v12 = *(_OWORD *)(v11 + 76);
    __int128 v126 = *(_OWORD *)(v11 + 60);
    __int128 v127 = v12;
  }

LABEL_64:
  *(void *)&v120[16] = 0LL;
  CFTypeID v63 = CFDictionaryGetTypeID();
  int v64 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v9, @"UTTypeTagSpecification");
  id v65 = v64;
  if (v64 && CFGetTypeID(v64) == v63)
  {
    char v66 = 0;
    __int128 v101 = &v120[16];
    __int128 v102 = v65;
    uint64_t v67 = 1LL;
    __int128 v103 = v9;
    do
    {
      uint64_t v68 = (uint64_t)&v10->schema + 104 * v67;
      unsigned int v69 = *(_DWORD *)(v68 + 216);
      int v70 = *(unsigned __int8 *)(v68 + 220);
      id v71 = (const void *)_CSStringCopyCFString();
      if (v71)
      {
        id v72 = (void *)CFDictionaryGetValue(v65, v71);
        uint64_t v73 = v72;
        if (v72)
        {
          CFTypeID v74 = CFGetTypeID(v72);
          if (v74 == CFStringGetTypeID())
          {
            if (!_LSBindingListBufferAppendNSString(v10, v121, v69, v73, v70 != 0))
            {
LABEL_108:
              CFRelease(v71);
              goto LABEL_109;
            }

            if (v67 == 1) {
              char v66 = 1;
            }
          }

          else
          {
            CFTypeID v75 = CFGetTypeID(v73);
            if (v75 == CFArrayGetTypeID())
            {
              __int128 v114 = 0u;
              __int128 v115 = 0u;
              __int128 v112 = 0u;
              __int128 v113 = 0u;
              id v76 = v73;
              uint64_t v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v112, v125, 16, v101);
              if (v77)
              {
                uint64_t v78 = *(void *)v113;
                while (2)
                {
                  for (uint64_t j = 0LL; j != v77; ++j)
                  {
                    if (*(void *)v113 != v78) {
                      objc_enumerationMutation(v76);
                    }
                    if (!_LSBindingListBufferAppendNSString( v10,  v121,  v69,  *(void **)(*((void *)&v112 + 1) + 8 * j),  v70 != 0))
                    {

                      goto LABEL_108;
                    }

                    if (v67 == 1) {
                      char v66 = 1;
                    }
                  }

                  uint64_t v77 = [v76 countByEnumeratingWithState:&v112 objects:v125 count:16];
                  if (v77) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v9 = v103;
              id v65 = v102;
            }
          }
        }

        CFRelease(v71);
      }

      ++v67;
    }

    while (v67 != 5);
    uint64_t active = _LSBindingListCreate(v10, v121, v101);
    if ((_DWORD)active) {
      goto LABEL_127;
    }
    int v81 = v66 & 1;
  }

  else
  {
    int v81 = 0;
  }

  _LSBindingListBufferReset(v10, (uint64_t)v121);
  uint64_t v82 = (void *)CFDictionaryGetValue((CFDictionaryRef)v9, @"UTTypeConformsTo");
  uint64_t v83 = v82;
  if (v82)
  {
    unsigned int bindingClass = v10->schema.bindingMaps[0].bindingClass;
    CFTypeID v85 = CFGetTypeID(v82);
    if (v85 == CFStringGetTypeID())
    {
      if (!_LSBindingListBufferAppendNSString(v10, v121, bindingClass, v83, 1)) {
        goto LABEL_109;
      }
      int v86 = 1;
    }

    else
    {
      CFTypeID v88 = CFGetTypeID(v83);
      if (v88 == CFArrayGetTypeID())
      {
        __int128 v110 = 0u;
        __int128 v111 = 0u;
        __int128 v108 = 0u;
        __int128 v109 = 0u;
        id v89 = v83;
        uint64_t v90 = [v89 countByEnumeratingWithState:&v108 objects:v124 count:16];
        if (v90)
        {
          __int128 v91 = v9;
          uint64_t v92 = *(void *)v109;
          while (2)
          {
            for (uint64_t k = 0LL; k != v90; ++k)
            {
              if (*(void *)v109 != v92) {
                objc_enumerationMutation(v89);
              }
              if (!_LSBindingListBufferAppendNSString( v10,  v121,  bindingClass,  *(void **)(*((void *)&v108 + 1) + 8 * k),  1))
              {

                goto LABEL_109;
              }
            }

            uint64_t v90 = [v89 countByEnumeratingWithState:&v108 objects:v124 count:16];
            if (v90) {
              continue;
            }
            break;
          }

          int v86 = 1;
          uint64_t v9 = v91;
        }

        else
        {
          int v86 = 0;
        }
      }

      else
      {
        int v86 = 0;
      }
    }

    BOOL v87 = v86 != 0;
    if (!v81) {
      goto LABEL_120;
    }
  }

  else
  {
    BOOL v87 = 0;
    if (!v81) {
      goto LABEL_120;
    }
  }

  if ((v116[2] & 4) == 0)
  {
    _LSMakeVersionNumber(13LL, 1LL, 0LL, v123);
    valuePtr[0] = v126;
    valuePtr[1] = v127;
    v128[0] = v123[0];
    v128[1] = v123[1];
    if (_LSVersionNumberCompare(valuePtr, v128) == -1 && !v87)
    {
      _LSDefaultLog();
      v94 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      {
        _LSDatabaseGetNSStringFromString(v10);
        id v95 = (id)objc_claimAutoreleasedReturnValue();
        _LSDatabaseGetNSStringFromString(v10);
        __int16 v96 = (void *)objc_claimAutoreleasedReturnValue();
        _UTTypeAddWithDeclarationDictionary_cold_1(v95, v96, (uint64_t)valuePtr, v94);
      }

      if (_LSBindingListBufferAppendNSString( v10,  v121,  v10->schema.bindingMaps[0].bindingClass,  @"public.data",  1))
      {
        v116[2] |= 0x400u;
        goto LABEL_120;
      }

LABEL_109:
      uint64_t active = 4294956479LL;
      goto LABEL_127;
    }
  }

LABEL_127:
  if (v104) {
    *__int128 v104 = v122;
  }
  _LSBindingListBufferReset(v10, (uint64_t)v121);

  return active;
}

void sub_183F8824C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t _UTUpdateActiveTypeForIdentifier(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  int v32 = 0;
  uint64_t v25 = 0LL;
  CFTypeID v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  int v28 = 0;
  uint64_t v21 = 0LL;
  int v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  int v24 = 0;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  int v20 = 0;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  _OWORD v16[2] = ___UTUpdateActiveTypeForIdentifier_block_invoke;
  v16[3] = &unk_189D79940;
  v16[4] = &v17;
  v16[5] = &v25;
  v16[6] = &v21;
  v16[7] = &v29;
  _UTEnumerateTypesForIdentifier(v3, a2, v16);
  int v4 = *((_DWORD *)v26 + 6);
  if (!v4) {
    goto LABEL_22;
  }
  if (*((_DWORD *)v18 + 6))
  {
    int v5 = *((_DWORD *)v22 + 6);
    if ((v5 & 0x820) == 0)
    {
      *((_DWORD *)v22 + 6) = v5 | 0x800;
      _CSStoreWriteToUnit();
      int v4 = *((_DWORD *)v26 + 6);
    }
  }

  if (v4 == *((_DWORD *)v30 + 6))
  {
LABEL_22:
    uint64_t v9 = 0LL;
    goto LABEL_23;
  }

  id v6 = v3;
  uint64_t Unit = (_DWORD *)CSStoreGetUnit();
  if (!Unit) {
    goto LABEL_34;
  }
  int v8 = Unit[2];
  if ((v8 & 1) != 0)
  {

LABEL_18:
    if (*((_DWORD *)v30 + 6))
    {
      id v11 = v6;
      __int128 v12 = (_DWORD *)CSStoreGetUnit();
      if (v12)
      {
        int v13 = v12[2];
        if ((v13 & 1) == 0)
        {
          uint64_t v9 = 0LL;
          goto LABEL_33;
        }

        unsigned int v34 = v13 & 0xFFFFFFFE;
        if (!v12[20]) {
          goto LABEL_37;
        }
        uint64_t v9 = _LSBindingListDeactivate();
        if ((_DWORD)v9) {
          goto LABEL_33;
        }
        __int128 v12 = (_DWORD *)CSStoreGetUnit();
        if (v12)
        {
LABEL_37:
          if (!v12[21] || (uint64_t v9 = _LSBindingListDeactivate(), !(_DWORD)v9))
          {
            id v15 = (void *)MEMORY[0x186E2A59C]();
            int v33 = 0LL;
            else {
              uint64_t v9 = _LSGetOSStatusFromNSError(v33);
            }

            objc_autoreleasePoolPop(v15);
          }

          goto LABEL_33;
        }
      }

      goto LABEL_34;
    }

    goto LABEL_22;
  }

  unsigned int v34 = v8 | 1;
  if (Unit[20])
  {
    uint64_t v9 = _LSBindingListActivate();
    if ((_DWORD)v9)
    {
LABEL_33:

      goto LABEL_23;
    }

    uint64_t Unit = (_DWORD *)CSStoreGetUnit();
    if (!Unit)
    {
LABEL_34:
      uint64_t v9 = 4294956481LL;
      goto LABEL_33;
    }
  }

  if (Unit[21])
  {
    uint64_t v9 = _LSBindingListActivate();
    if ((_DWORD)v9) {
      goto LABEL_33;
    }
  }

  id v10 = (void *)MEMORY[0x186E2A59C]();
  int v33 = 0LL;
  else {
    uint64_t v9 = _LSGetOSStatusFromNSError(v33);
  }

  objc_autoreleasePoolPop(v10);
  if (!(_DWORD)v9) {
    goto LABEL_18;
  }
LABEL_23:
  _LSSchemaCacheWrite((uint64_t)v3 + 16, &__block_literal_global_71);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v9;
}

void sub_183F8871C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v18 = va_arg(va2, void);
  uint64_t v20 = va_arg(va2, void);
  uint64_t v21 = va_arg(va2, void);
  uint64_t v22 = va_arg(va2, void);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);

  _Unwind_Resume(a1);
}

uint64_t _UTTypeRemove(void *a1, int a2)
{
  id v3 = a1;
  uint64_t Unit = (__int128 *)CSStoreGetUnit();
  if (Unit)
  {
    __int128 v5 = Unit[3];
    __int128 v11 = Unit[2];
    __int128 v12 = v5;
    *(_OWORD *)uint64_t v13 = Unit[4];
    *(_OWORD *)&v13[12] = *(__int128 *)((char *)Unit + 76);
    __int128 v9 = *Unit;
    *(_OWORD *)id v10 = Unit[1];
    CSMapRemoveValue();
    if (HIDWORD(v9))
    {
      uint64_t active = _LSBindableDeactivate(v3, a2);
      if ((BYTE8(v9) & 1) != 0) {
        uint64_t active = _UTUpdateActiveTypeForIdentifier(v3, SHIDWORD(v9));
      }
    }

    else
    {
      uint64_t active = 0LL;
    }

    if (*(_DWORD *)&v13[16])
    {
      uint64_t active = _LSBindingListDeactivate();
      _LSBindingListDestroy();
    }

    if (*(_DWORD *)&v13[20])
    {
      uint64_t active = _LSBindingListDeactivate();
      _LSBindingListDestroy();
    }

    _CSStringRelease();
    LaunchServices::LocalizedString::Remove((LaunchServices::LocalizedString *)v3, (_LSDatabase *)LODWORD(v10[1]));
    _CSStringRelease();
    _CSStringRelease();
    _CSStringRelease();
    if (*(_DWORD *)&v13[4]) {
      _LSPlistRemove((uint64_t)v3, *(int *)&v13[4]);
    }
    CSStoreFreeUnit();
    -[_LSDatabase setTypeDeclarationsChanged:](v3, 1);
  }

  else
  {
    uint64_t active = 4294957797LL;
  }

  return active;
}

void sub_183F889A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _UTTypeGet()
{
  return CSStoreGetUnit();
}

uint64_t _UTTypeGetBundleBaseData(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = v3;
  int v5 = *(_DWORD *)(a2 + 20);
  if ((*(_BYTE *)(a2 + 9) & 0x20) != 0) {
    uint64_t v6 = _LSGetPlugin((uint64_t)v3, v5);
  }
  else {
    uint64_t v6 = _LSBundleGet(v3, v5);
  }
  uint64_t v7 = v6;

  return v7;
}

void sub_183F88A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _UTTypeSearchConformsToTypes(uint64_t a1, int a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  return _UTTypeSearchConformsToTypesCommon(a1, a2, 32LL, a3, a4, a5);
}

uint64_t _UTTypeSearchConformsToTypesCommon( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  uint64_t Unit = CSStoreGetUnit();
  if (!Unit) {
    return 0LL;
  }
  memset(v16, 0, sizeof(v16));
  int v17 = 1065353216;
  uint64_t v18 = a1;
  uint64_t v19 = a5;
  int v20 = a2;
  uint64_t v21 = Unit;
  uint64_t v22 = a4;
  int v23 = 0;
  uint64_t v13 = 32LL;
  if (a3 >= 0) {
    uint64_t v13 = a3;
  }
  uint64_t v24 = v13;
  if (!_UTTypeSearchConformsToTypesCore((uint64_t)v16))
  {
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)v16);
    return 0LL;
  }

  if (a6) {
    *a6 = v20;
  }
  uint64_t v14 = v21;
  std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)v16);
  return v14;
}

void sub_183F88B50( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t _UTTypeSearchConformsToTypesWithBlock(uint64_t a1, int a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  return _UTTypeSearchConformsToTypesCommon( a1,  a2,  a3,  (uint64_t)_UTTypeSearchConformsToTypesWithBlock::$_0::__invoke,  a5,  a4);
}

uint64_t _UTTypeSearchConformingTypesCommon(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  id v11 = a1;
  memset(v15, 0, sizeof(v15));
  int v16 = 1065353216;
  id v17 = v11;
  uint64_t v18 = a5;
  int v19 = a2;
  uint64_t Unit = CSStoreGetUnit();
  uint64_t v21 = a4;
  int v22 = 0;
  uint64_t v12 = 32LL;
  if (a3 >= 0) {
    uint64_t v12 = a3;
  }
  uint64_t v23 = v12;
  if (_UTTypeSearchConformingTypesCore((uint64_t)v15))
  {
    if (a6) {
      *a6 = v19;
    }
    uint64_t v13 = Unit;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)v15);

  return v13;
}

void sub_183F88C58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Unwind_Resume(a1);
}

uint64_t _UTTypeSearchConformingTypesWithBlock(void *a1, int a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  return _UTTypeSearchConformingTypesCommon( a1,  a2,  a3,  (uint64_t)_UTTypeSearchConformingTypesWithBlock::$_0::__invoke,  a5,  a4);
}

uint64_t _UTTypeComparePriority(void *a1, _DWORD *a2, void *a3, _DWORD *a4)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v7 = a1;
  id v8 = a3;
  if (a2 == a4)
  {
LABEL_36:
    char v11 = 0;
    goto LABEL_37;
  }

  int v9 = a2[2];
  int v10 = a4[2];
  if ((v9 & 0x1000) != 0 && (v10 & 0x1000) == 0) {
    goto LABEL_4;
  }
  if ((v9 & 0x1000) == 0 && (v10 & 0x1000) != 0)
  {
LABEL_7:
    char v11 = 1;
    goto LABEL_37;
  }

  if (((v10 ^ v9) & 0x40) != 0)
  {
    BOOL v16 = (a2[2] & 0x40) == 0;
    goto LABEL_17;
  }

  int v12 = a2[2] & 0x820;
  int v13 = v10 & 0x820;
  if (a2[3] != a4[3]) {
    goto LABEL_23;
  }
  int v14 = a2[2] & 0x10;
  int v15 = v10 & 0x10;
  if (v14 != v15)
  {
    if (!v12 || v14)
    {
      if (!v13 || v15) {
        goto LABEL_11;
      }
      if (v14)
      {
        if (!v12) {
          goto LABEL_24;
        }
        goto LABEL_32;
      }
    }

void sub_183F88EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)va);
  _Unwind_Resume(a1);
}

BOOL _UTTypeTagsAreSuperset(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = v5;
  v18[0] = 0LL;
  v18[1] = v18;
  _OWORD v18[2] = 0x5812000000LL;
  v18[3] = __Block_byref_object_copy__45;
  void v18[4] = __Block_byref_object_dispose__45;
  memset(&v18[5], 0, 40);
  int v19 = 1065353216;
  uint64_t v7 = *(unsigned int *)(a2 + 80);
  uint64_t v8 = MEMORY[0x1895F87A8];
  if ((_DWORD)v7)
  {
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = ___UTTypeTagsAreSuperset_block_invoke;
    v17[3] = &unk_189D766F8;
    v17[4] = v18;
    _LSBindingListEnumerate(v5, v7, v17);
  }

  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  BOOL v9 = 1LL;
  char v16 = 1;
  uint64_t v10 = *(unsigned int *)(a3 + 80);
  if ((_DWORD)v10)
  {
    v12[0] = v8;
    v12[1] = 3221225472LL;
    uint64x2_t v12[2] = ___UTTypeTagsAreSuperset_block_invoke_2;
    void v12[3] = &unk_189D79A98;
    void v12[4] = v18;
    v12[5] = &v13;
    _LSBindingListEnumerate(v6, v10, v12);
    BOOL v9 = *((_BYTE *)v14 + 24) != 0;
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v18, 8);
  std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::~__hash_table((uint64_t)&v18[6]);

  return v9;
}

void sub_183F8907C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::~__hash_table(v8);

  _Unwind_Resume(a1);
}

uint64_t _UTTypeGetUltimateDeclaringBundle(void *a1, uint64_t a2, int *a3)
{
  id v5 = a1;
  uint64_t v6 = v5;
  uint64_t v7 = (int *)(a2 + 20);
  if ((*(_BYTE *)(a2 + 9) & 0x20) != 0) {
    uint64_t v7 = (int *)(_LSGetPlugin((uint64_t)v5, *v7) + 216);
  }
  int v8 = *v7;
  if (!*v7)
  {
    uint64_t v9 = 0LL;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  uint64_t v9 = _LSBundleGet(v6, *v7);
  if (a3) {
LABEL_5:
  }
    *a3 = v8;
LABEL_6:

  return v9;
}

void sub_183F89134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _UTGetActiveTypeForIdentifier(void *a1, int a2, _DWORD *a3)
{
  id v5 = a1;
  uint64_t v6 = v5;
  uint64_t v23 = 0LL;
  unsigned int v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  uint64_t v26 = 0LL;
  uint64_t v19 = 0LL;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  int v22 = 0;
  if (v5 && a2)
  {
    uint64_t v7 = MEMORY[0x1895F87A8];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    void v14[2] = ___UTGetActiveTypeForIdentifier_block_invoke;
    v14[3] = &unk_189D798C8;
    int v18 = a2;
    uint64_t v16 = &v19;
    uint64_t v17 = &v23;
    id v8 = v5;
    id v15 = v8;
    _LSSchemaCacheRead((uint64_t)v6 + 16, v14);
    if (!*((_DWORD *)v20 + 6) || !v24[3])
    {
      v13[0] = v7;
      v13[1] = 3221225472LL;
      v13[2] = ___UTGetActiveTypeForIdentifier_block_invoke_2;
      v13[3] = &unk_189D798F0;
      void v13[4] = &v19;
      void v13[5] = &v23;
      _UTEnumerateTypesForIdentifier(v8, a2, v13);
      if (*((_DWORD *)v20 + 6))
      {
        v11[0] = v7;
        v11[1] = 3221225472LL;
        v11[2] = ___UTGetActiveTypeForIdentifier_block_invoke_3;
        v11[3] = &unk_189D79918;
        int v12 = a2;
        void v11[4] = &v19;
        _LSSchemaCacheWrite((uint64_t)v8 + 16, v11);
      }
    }
  }

  if (a3) {
    *a3 = *((_DWORD *)v20 + 6);
  }
  uint64_t v9 = v24[3];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

void sub_183F89300( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, void *a25)
{
  _Block_object_dispose((const void *)(v26 - 144), 8);
  _Block_object_dispose((const void *)(v26 - 112), 8);

  _Unwind_Resume(a1);
}

void _UTEnumerateTypesForIdentifier(void *a1, int a2, void *a3)
{
  id v6 = a1;
  id v5 = a3;
  if (v6 && a2 && v5)
  {
    id v7 = v6;
    id v8 = v5;
    _LSDatabaseEnumeratingBindingMap();
  }
}

void sub_183F89478( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t _UTGetActiveTypeForCFStringIdentifier(void *a1, const __CFString *a2, _DWORD *a3)
{
  id v5 = a1;
  int StringForCFString = _LSDatabaseGetStringForCFString(v5, a2, 1);
  if (StringForCFString) {
    uint64_t active = _UTGetActiveTypeForIdentifier(v5, StringForCFString, a3);
  }
  else {
    uint64_t active = 0LL;
  }

  return active;
}

void sub_183F8954C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _UTTypeGetIconNames(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = 0LL;
  if (v3 && a2)
  {
    [MEMORY[0x189603FA8] array];
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = 0LL;
    uint64_t v6 = a2 + 28;
    do
    {
      if (!*(_DWORD *)(v6 + v5)) {
        break;
      }
      id v7 = (void *)_CSStringCopyCFString();
      if (v7) {
        [v4 addObject:v7];
      }
      v5 += 4LL;
    }

    while (v5 != 32);
  }

  return v4;
}

void sub_183F89600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _UTTypeGetGlyphName(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = 0LL;
  if (v3 && a2)
  {
    if (*(_DWORD *)(a2 + 64)) {
      int v4 = (void *)_CSStringCopyCFString();
    }
    else {
      int v4 = 0LL;
    }
  }

  return v4;
}

void sub_183F89694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _UTTypeGetIconName(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = 0LL;
  if (v3 && a2)
  {
    if (*(_DWORD *)(a2 + 60)) {
      int v4 = (void *)_CSStringCopyCFString();
    }
    else {
      int v4 = 0LL;
    }
  }

  return v4;
}

void sub_183F8970C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _UTTypeGetActiveIdentifierForTag( void *a1, const __CFString *a2, const __CFString *a3, int a4, uint64_t a5)
{
  id v9 = a1;
  uint64_t v10 = v9;
  uint64_t v11 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v21 = 0LL;
  if (v9 && a2 && a3)
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = ___UTTypeGetActiveIdentifierForTag_block_invoke;
    v13[3] = &unk_189D79988;
    int v17 = a4;
    id v14 = v9;
    id v15 = &v18;
    uint64_t v16 = a5;
    _UTEnumerateTypesForTag(v14, a2, a3, v13);

    uint64_t v11 = v19[3];
  }

  _Block_object_dispose(&v18, 8);

  return v11;
}

void sub_183F89894( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _UTEnumerateTypesForTag(void *a1, const __CFString *a2, const __CFString *a3, void *a4)
{
  uint64_t v10 = a1;
  id v7 = a4;
  if (v10)
  {
    if (a2)
    {
      if (a3)
      {
        if (v7)
        {
          int StringForCFString = _LSDatabaseGetStringForCFString(v10, a2, 1);
          if (StringForCFString)
          {
            int BindingMapIndex = _LSDatabaseFindBindingMapIndex((uint64_t)v10, StringForCFString);
            if (BindingMapIndex != -1)
            {
              if (_LSDatabaseGetStringForCFString(v10, a3, v10[104 * BindingMapIndex + 236]))
              {
                uint64_t v11 = v10;
                id v12 = v7;
                _LSDatabaseEnumeratingBindingMap();
              }
            }
          }
        }
      }
    }
  }
}

void sub_183F899DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t _UTTypeConformsTo(void *a1, int a2, unsigned int a3)
{
  id v5 = a1;
  uint64_t v6 = v5;
  uint64_t v21 = 0LL;
  int v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  if (a2 == a3)
  {
    uint64_t v7 = 1LL;
    char v24 = 1;
  }

  else
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    uint64_t v8 = MEMORY[0x1895F87A8];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    void v14[2] = ___UTTypeConformsTo_block_invoke;
    v14[3] = &unk_189D799B0;
    int v15 = a2;
    unsigned int v16 = a3;
    void v14[4] = &v21;
    void v14[5] = &v17;
    _LSSchemaCacheRead((uint64_t)v5 + 16, v14);
    if (!*((_BYTE *)v18 + 24))
    {
      BOOL v9 = _UTTypeSearchConformsToTypesCommon((uint64_t)v6, a2, 32LL, (uint64_t)_UTTypeSearchEqual, a3, 0LL) != 0;
      *((_BYTE *)v22 + 24) = v9;
      v11[0] = v8;
      v11[1] = 3221225472LL;
      v11[2] = ___UTTypeConformsTo_block_invoke_2;
      v11[3] = &unk_189D799D8;
      int v12 = a2;
      unsigned int v13 = a3;
      void v11[4] = &v21;
      _LSSchemaCacheWrite((uint64_t)v6 + 16, v11);
    }

    _Block_object_dispose(&v17, 8);
    uint64_t v7 = *((unsigned __int8 *)v22 + 24);
  }

  _Block_object_dispose(&v21, 8);

  return v7;
}

void sub_183F89BF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  _Unwind_Resume(a1);
}

BOOL _UTTypeSearchEqual(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16) == *(void *)(a1 + 8);
}

uint64_t _UTGetLocalizedDescription(void *a1, int a2)
{
  id v3 = a1;
  unsigned int v7 = 0;
  int v4 = (void *)MEMORY[0x186E2A59C]();
  _UTTypeSearchConformsToTypesCommon((uint64_t)v3, a2, 32LL, (uint64_t)_UTGetLocalizedDescriptionImpl, (uint64_t)&v7, 0LL);
  objc_autoreleasePoolPop(v4);
  uint64_t v5 = v7;

  return v5;
}

void sub_183F89D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _UTGetLocalizedDescriptionImpl(uint64_t a1)
{
  int v2 = *(int **)(a1 + 8);
  if (LaunchServices::LocalizedString::Get( *(LaunchServices::LocalizedString **)a1,  (_LSDatabase *)*(unsigned int *)(*(void *)(a1 + 24) + 24LL)))
  {
    int v3 = *(_DWORD *)(*(void *)(a1 + 24) + 24LL);
    int *v2 = v3;
  }

  else
  {
    int v3 = *v2;
  }

  return v3 != 0;
}

uint64_t _UTTypeGetTypeApplication(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, @"com.apple.application", (unsigned int *)a1->schema._cache + 70);
}

uint64_t _UTTypeGetCachedType(_LSDatabase *a1, const __CFString *a2, unsigned int *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = v5;
  uint64_t v7 = *a3;
  if (!(_DWORD)v7)
  {
    _UTGetActiveTypeForCFStringIdentifier(v5, a2, a3);
    uint64_t v7 = *a3;
  }

  return v7;
}

void sub_183F89E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _UTTypeGetTypeUnixExecutable(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, @"public.unix-executable", (unsigned int *)a1->schema._cache + 71);
}

uint64_t _UTTypeGetTypeWindowsExecutable(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, @"com.microsoft.windows-executable", (unsigned int *)a1->schema._cache + 72);
}

uint64_t _UTTypeGetTypeLocalizableNameBundle(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, @"com.apple.localizable-name-bundle", (unsigned int *)a1->schema._cache + 73);
}

uint64_t _UTTypeGetTypeData(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, @"public.data", (unsigned int *)a1->schema._cache + 74);
}

uint64_t _UTTypeGetTypeFolder(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, @"public.folder", (unsigned int *)a1->schema._cache + 75);
}

uint64_t _UTTypeGetTypePackage(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, @"com.apple.package", (unsigned int *)a1->schema._cache + 76);
}

uint64_t _UTTypeGetTypeResolvable(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, @"com.apple.resolvable", (unsigned int *)a1->schema._cache + 78);
}

uint64_t _UTTypeGetTypeDirectory(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, @"public.directory", (unsigned int *)a1->schema._cache + 79);
}

uint64_t _UTTypeGetTypeAVCHDCollection(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, @"public.avchd-collection", (unsigned int *)a1->schema._cache + 80);
}

uint64_t _UTTypeGetTypeCaseInsensitiveText(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, @"public.case-insensitive-text", (unsigned int *)a1->schema._cache + 81);
}

uint64_t _UTTypeGetTypeVolume(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, @"public.volume", (unsigned int *)a1->schema._cache + 82);
}

uint64_t _UTTypeGetTypeSymbolicLink(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, @"public.symlink", (unsigned int *)a1->schema._cache + 83);
}

uint64_t _UTTypeGetTypeAliasFile(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, @"com.apple.alias-file", (unsigned int *)a1->schema._cache + 84);
}

uint64_t _UTTypeSetGeneration(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = CSStoreGetUnit();
  if (result) {
    *(_DWORD *)(result + 4) = a3;
  }
  return result;
}

void _UTEnumerateActiveTypes(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  _CSStoreEnumerateUnits();
}

void sub_183F8A16C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t _UTTypeGetPedigreeInternal(uint64_t *a1, int a2)
{
  id v4 = objc_alloc_init(MEMORY[0x189603FE0]);
  uint64_t v5 = (void *)_CSStringCopyCFString();
  if (v5) {
    [v4 addObject:v5];
  }

  uint64_t v6 = *a1;
  uint64_t v10 = MEMORY[0x1895F87A8];
  uint64_t v11 = 3221225472LL;
  int v12 = ___UTTypeGetPedigreeInternal_block_invoke;
  unsigned int v13 = &unk_189D79A50;
  int v15 = a1;
  id v7 = v4;
  id v14 = v7;
  _UTTypeSearchConformsToTypesCommon( v6,  a2,  -1LL,  (uint64_t)_UTTypeSearchConformsToTypesWithBlock::$_0::__invoke,  (uint64_t)&v10,  0LL);
  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

void sub_183F8A3CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8A458( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

uint64_t _UTTypeIsDenylistedForBinding(void *a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  id v2 = v1;
  if (_UTTypeIsDenylistedForBinding::once != -1)
  {
    dispatch_once(&_UTTypeIsDenylistedForBinding::once, &__block_literal_global_26_1);
    if (v2) {
      goto LABEL_3;
    }
LABEL_15:
    uint64_t v4 = 0LL;
    goto LABEL_16;
  }

  if (!v1) {
    goto LABEL_15;
  }
LABEL_3:
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  id v3 = (id)_UTTypeIsDenylistedForBinding::denyListedTypes;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (UTTypeEqual(v2, *(CFStringRef *)(*((void *)&v8 + 1) + 8 * i)))
        {
          uint64_t v4 = 1LL;
          goto LABEL_13;
        }
      }

      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

void sub_183F8A5AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8A690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__45(uint64_t a1, uint64_t a2)
{
  return std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::__hash_table( a1 + 48,  (uint64_t *)(a2 + 48));
}

uint64_t __Block_byref_object_dispose__45(uint64_t a1)
{
  return std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::~__hash_table(a1 + 48);
}

void _UTTypeGetVisualizationFunctions(id (**a1)(LaunchServices::UTIs *this, LSContext *a2)@<X8>)
{
  *a1 = LaunchServices::UTIs::getSummary;
  a1[1] = (id (*)(LaunchServices::UTIs *, LSContext *))LaunchServices::UTIs::display;
  a1[2] = (id (*)(LaunchServices::UTIs *, LSContext *))LaunchServices::UTIs::copyBindingForVisualization;
}

id LaunchServices::UTIs::getSummary(LaunchServices::UTIs *this, LSContext *a2)
{
  uint64_t Unit = (void *)CSStoreGetUnit();
  if (Unit) {
    uint64_t Unit = (void *)_CSStringCopyCFString();
  }
  return Unit;
}

BOOL LaunchServices::UTIs::display( LaunchServices::UTIs *this, LSContext *a2, unsigned int a3, CSStore2::AttributedStringWriter *a4, LaunchServices::DumpWriter *a5)
{
  uint64_t Unit = CSStoreGetUnit();
  uint64_t v8 = Unit;
  if (Unit)
  {
    uint64_t v9 = *(unsigned int *)(Unit + 20);
    if ((*(_BYTE *)(Unit + 9) & 0x20) != 0)
    {
      CSStore2::AttributedStringWriter::link(a4, *(unsigned int *)(*(void *)this + 1604LL), v9, 0LL);
      __int128 v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      CSStore2::AttributedStringWriter::string(a4, @"plugin", v10);
    }

    else
    {
      CSStore2::AttributedStringWriter::link(a4, *(unsigned int *)(*(void *)this + 20LL), v9, 0LL);
      __int128 v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      CSStore2::AttributedStringWriter::string(a4, @"bundle", v10);
    }

    CSStore2::AttributedStringWriter::string(a4, @"uti");
    [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(v8 + 16)];
    __int128 v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number(a4, @"version", v11);

    CSStore2::AttributedStringWriter::childUnit(a4, @"localizedDescription");
    CSStore2::AttributedStringWriter::beginFlags(a4, @"flags");
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::missingFlag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::missingFlag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::missingFlag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::endFlags(a4);
    CSStore2::AttributedStringWriter::stringArray(a4, @"iconFiles", (const unsigned int *)(v8 + 28));
    CSStore2::AttributedStringWriter::string(a4, @"iconName");
    CSStore2::AttributedStringWriter::string(a4, @"glyphName");
    CSStore2::AttributedStringWriter::childUnit(a4, @"icons");
    CSStore2::AttributedStringWriter::string(a4, @"delegate");
    CSStore2::AttributedStringWriter::string(a4, @"kextName");
    if (!*(_DWORD *)(v8 + 88)) {
      goto LABEL_12;
    }
    int v12 = (__CFString *)_CSStringCopyCFString();
    if (v12)
    {
      uint64_t v13 = (NSURL *)[objc_alloc(MEMORY[0x189604030]) initWithString:v12];
      id v14 = v12;
      if (v13)
      {
        CSStore2::AttributedStringWriter::link(a4, v13, 0LL);
        int v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        CSStore2::AttributedStringWriter::string(a4, @"reference URL", v15);

LABEL_11:
LABEL_12:
        CSStore2::AttributedStringWriter::childUnit(a4, @"conforms to");
        CSStore2::AttributedStringWriter::childUnit(a4, @"tags");
        return v8 != 0;
      }
    }

    else
    {
      id v14 = @"-nil-";
    }

    CSStore2::AttributedStringWriter::string(a4, @"reference URL", &v14->isa);
    goto LABEL_11;
  }

  return v8 != 0;
}

void sub_183F8AD40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::UTIs::copyBindingForVisualization(LaunchServices::UTIs *this, LSContext *a2)
{
  return 0LL;
}

uint64_t _UTTypeSearchConformsToTypesCore(uint64_t a1)
{
  id v2 = (unsigned int *)(a1 + 56);
  if (std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::find<unsigned int>( (void *)a1,  (unsigned int *)(a1 + 56)))
  {
    return 0LL;
  }

  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int &>( a1,  v2,  v2);
  *(void *)(a1 + 72) = *(unsigned int *)(a1 + 88);
  uint64_t v5 = (unsigned int *)*(id *)(a1 + 40);
  int v6 = *(_DWORD *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  ++*(_DWORD *)(a1 + 88);
  uint64_t v8 = v5[58];
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  uint64_t v9 = *(unsigned int *)(v7 + 84);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = ___ZL32_UTTypeSearchConformsToTypesCoreP14UTTypeSearchPB_block_invoke;
  v11[3] = &unk_189D729E8;
  uint64_t v14 = a1;
  __int128 v10 = v5;
  int v12 = v10;
  uint64_t v13 = &v15;
  _LSBindingListEnumerateEntryWithClass(v10, v9, v8, v11);
  if (*((_BYTE *)v16 + 24))
  {

    _Block_object_dispose(&v15, 8);
    uint64_t v3 = 1LL;
  }

  else
  {
    --*(_DWORD *)(a1 + 88);
    *(_DWORD *)(a1 + 56) = v6;
    *(void *)(a1 + 64) = v7;

    _Block_object_dispose(&v15, 8);
    uint64_t v3 = 0LL;
  }

  return v3;
}

void sub_183F8AF18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZL32_UTTypeSearchConformsToTypesCoreP14UTTypeSearchPB_block_invoke( uint64_t a1, uint64_t a2, int a3, _BYTE *a4)
{
  *(void *)(*(void *)(a1 + 48) + 64LL) = _UTGetActiveTypeForIdentifier( *(void **)(a1 + 32),  a3,  (_DWORD *)(*(void *)(a1 + 48) + 56LL));
  uint64_t result = *(void *)(a1 + 48);
  if (*(void *)(result + 64))
  {
    uint64_t result = _UTTypeSearchConformsToTypesCore();
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
      *a4 = 1;
    }
  }

  return result;
}

uint64_t _UTTypeSearchConformsToTypesWithBlock::$_0::__invoke(uint64_t a1)
{
  unsigned __int8 v2 = 0;
  (*(void (**)(void, void, void, void, unsigned __int8 *))(*(void *)(a1 + 8) + 16LL))( *(void *)(a1 + 8),  *(unsigned int *)(a1 + 16),  *(void *)(a1 + 24),  *(void *)(a1 + 32),  &v2);
  return v2;
}

uint64_t _UTTypeSearchConformingTypesCore(uint64_t a1)
{
  uint64_t v10 = 0LL;
  __int128 v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  unsigned __int8 v2 = (unsigned int *)(a1 + 56);
  if (std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::find<unsigned int>( (void *)a1,  (unsigned int *)(a1 + 56)))
  {
    uint64_t v3 = 0LL;
  }

  else
  {
    std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int &>( a1,  v2,  v2);
    *(void *)(a1 + 72) = *(unsigned int *)(a1 + 88);
    if ((*(unsigned int (**)(uint64_t))(a1 + 80))(a1 + 40))
    {
      uint64_t v3 = 1LL;
    }

    else
    {
      if (*(void *)(a1 + 96) > (uint64_t)*(unsigned int *)(a1 + 88))
      {
        id v4 = *(id *)(a1 + 40);
        int v5 = *(_DWORD *)(a1 + 56);
        uint64_t v6 = *(void *)(a1 + 64);
        ++*(_DWORD *)(a1 + 88);
        id v9 = v4;
        id v7 = v4;
        _LSDatabaseEnumeratingBindingMap();
        --*(_DWORD *)(a1 + 88);
        *(_DWORD *)(a1 + 56) = v5;
        *(void *)(a1 + 64) = v6;
      }

      uint64_t v3 = *((unsigned __int8 *)v11 + 24);
    }
  }

  _Block_object_dispose(&v10, 8);
  return v3;
}

void sub_183F8B128( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZL32_UTTypeSearchConformingTypesCoreP14UTTypeSearchPB_block_invoke( uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  unsigned int v4 = a3 & 0xFFFFFFFC;
  if ((~a3 & 3) == 0 && v4 != 0)
  {
    uint64_t v7 = result;
    uint64_t result = CSStoreGetUnit();
    if (result)
    {
      if ((*(_BYTE *)(result + 8) & 1) != 0)
      {
        uint64_t v8 = *(void *)(v7 + 48);
        *(_DWORD *)(v8 + 56) = v4;
        *(void *)(v8 + 64) = result;
        uint64_t result = _UTTypeSearchConformingTypesCore(*(void *)(v7 + 48));
        if ((_DWORD)result)
        {
          *(_BYTE *)(*(void *)(*(void *)(v7 + 40) + 8LL) + 24LL) = 1;
          *a4 = 1;
        }
      }
    }
  }

  return result;
}

uint64_t _UTTypeSearchConformingTypesWithBlock::$_0::__invoke(uint64_t a1)
{
  unsigned __int8 v2 = 0;
  (*(void (**)(void, void, void, void, unsigned __int8 *))(*(void *)(a1 + 8) + 16LL))( *(void *)(a1 + 8),  *(unsigned int *)(a1 + 16),  *(void *)(a1 + 24),  *(void *)(a1 + 32),  &v2);
  return v2;
}

void *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int const&,unsigned int &>( uint64_t a1, unsigned int *a2, _DWORD *a3, int *a4)
{
  unint64_t v8 = *a2;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v9 - 1) & v8;
    }

    __int128 v11 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v11)
    {
      uint64_t v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (*((_DWORD *)v12 + 4) == (_DWORD)v8) {
              return v12;
            }
          }

          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }

            else
            {
              v13 &= v9 - 1;
            }

            if (v13 != v4) {
              break;
            }
          }

          uint64_t v12 = (void *)*v12;
        }

        while (v12);
      }
    }
  }

  uint64_t v12 = operator new(0x18uLL);
  *uint64_t v12 = 0LL;
  v12[1] = v8;
  int v14 = *a4;
  *((_DWORD *)v12 + 4) = *a3;
  *((_DWORD *)v12 + 5) = v14;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1LL;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>( a1,  v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
      else {
        unint64_t v4 = v8;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v9 - 1) & v8;
    }
  }

  uint64_t v21 = *(void *)a1;
  int v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    *uint64_t v12 = *v22;
LABEL_38:
    *int v22 = v12;
    goto LABEL_39;
  }

  *uint64_t v12 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  *(void *)(v21 + 8 * v4) = a1 + 16;
  if (*v12)
  {
    unint64_t v23 = *(void *)(*v12 + 8LL);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }

    else
    {
      v23 &= v9 - 1;
    }

    int v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }

void sub_183F8B458(_Unwind_Exception *a1)
{
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }

    uint8x8_t v10 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (uint64_t *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (*((_DWORD *)i + 4) == (_DWORD)v7) {
            return i;
          }
        }

        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }

          else
          {
            v12 &= v8 - 1;
          }

          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }

  uint64_t v13 = a1 + 16;
  int v14 = (char *)operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(void *)int v14 = 0LL;
  *((void *)v14 + 1) = v7;
  *((_DWORD *)v14 + 4) = **a4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  char v25 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1LL;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>( a1,  v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }
  }

  uint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *(void *)v24[0] = *v21;
    *uint64_t v21 = v24[0];
  }

  else
  {
    *(void *)v24[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v24[0];
    *(void *)(*(void *)a1 + 8 * v4) = v13;
    if (*(void *)v24[0])
    {
      unint64_t v22 = *(void *)(*(void *)v24[0] + 8LL);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8) {
          v22 %= v8;
        }
      }

      else
      {
        v22 &= v8 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v22) = v24[0];
    }
  }

  uint64_t i = (uint64_t *)v24[0];
  v24[0] = 0LL;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,void *>>>>::reset[abi:nn180100]( (uint64_t)v24,  0LL);
  return i;
}

void sub_183F8B6C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,void *>>>>::reset[abi:nn180100]( uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)v2 + 24);
    }
    operator delete(v2);
  }

void *std::__hash_table<std::__hash_value_type<unsigned int,BOOL>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,BOOL>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,BOOL>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,BOOL>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>( uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }

    uint8x8_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      __int128 v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          __int128 v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  __int128 v11 = operator new(0x18uLL);
  void *v11 = 0LL;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((_BYTE *)v11 + 20) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1LL;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>( a1,  v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }
  }

  uint64_t v19 = *(void *)a1;
  size_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    void *v11 = *v20;
LABEL_38:
    *size_t v20 = v11;
    goto LABEL_39;
  }

  void *v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }

    else
    {
      v21 &= v8 - 1;
    }

    size_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }

void sub_183F8B930(_Unwind_Exception *a1)
{
}

id LaunchServices::TypeEvaluator::Result::getTypeIdentifier(id *this, LSContext *a2)
{
  if (this[1]) {
    id v2 = (id)_CSStringCopyCFString();
  }
  else {
    id v2 = this[2];
  }
  return v2;
}

id LaunchServices::TypeEvaluator::Result::getTypeRecord( LaunchServices::TypeEvaluator::Result *this, LSContext *a2)
{
  if (*(_DWORD *)this) {
    id v2 = -[LSRecord _initWithContext:tableID:unitID:]( objc_alloc(&OBJC_CLASS____UTDeclaredTypeRecord),  "_initWithContext:tableID:unitID:",  a2,  a2->db->schema.utypeTable,  *(unsigned int *)this);
  }
  else {
    id v2 = -[_UTDynamicTypeRecord _initWithContext:dynamicUTI:]( objc_alloc(&OBJC_CLASS____UTDynamicTypeRecord),  "_initWithContext:dynamicUTI:",  a2,  *((void *)this + 2));
  }
  return v2;
}

uint64_t LaunchServices::TypeEvaluator::TypeEvaluator(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)a1 = v3;
  *(_BYTE *)(a1 + _Block_object_dispose((const void *)(v16 - 96), 8) = 0;
  if (!v3)
  {
    [MEMORY[0x1896077D8] currentHandler];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"LaunchServices::TypeEvaluator::TypeEvaluator(const __strong id<FSNodePropertyProviding> _Nonnull)"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 handleFailureInFunction:v6, @"UTTypeEvaluator.mm", 97, @"Invalid parameter not satisfying: %@", @"node != nil" file lineNumber description];
  }

  return a1;
}

void sub_183F8BB08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void LaunchServices::TypeEvaluator::setSniffIfNeeded(LaunchServices::TypeEvaluator *this, int a2)
{
  if (a2)
  {
    char v2 = a2;
    if ([*(id *)this canIssueIO])
    {
      *((_BYTE *)this + _Block_object_dispose((const void *)(v16 - 96), 8) = v2;
    }

    else
    {
      _LSDefaultLog();
      unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        LaunchServices::TypeEvaluator::setSniffIfNeeded(v4);
      }
    }
  }

void LaunchServices::TypeEvaluator::evaluateType( uint64_t a1@<X0>, void **a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
}

void LaunchServices::TypeEvaluation::runEvaluator( void **a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  v71[2] = *(CFTypeRef *)MEMORY[0x1895F89C0];
  *(_BYTE *)a4 = 0;
  *(_BYTE *)(a4 + 32) = 0;
  unsigned int v62 = 0LL;
  if ([*(id *)a2 getCachedResourceValueIfPresent:&v62 forKey:*MEMORY[0x189603D30] error:0])
  {
    if (_UTTypeIdentifierIsDynamic(v62))
    {
      uint64_t v8 = -[__CFString copy](v62, "copy");
      int v9 = *(unsigned __int8 *)(a4 + 32);
      *(_DWORD *)a4 = 0;
      *(void *)(a4 + _Block_object_dispose((const void *)(v16 - 96), 8) = 0LL;
      if (v9)
      {
        uint8x8_t v10 = *(void **)(a4 + 16);
        *(void *)(a4 + 16) = v8;

LABEL_11:
        *(_BYTE *)(a4 + 24) = 0;
        goto LABEL_12;
      }

      *(void *)(a4 + 16) = v8;
    }

    else
    {
      LODWORD(v64) = 0;
      uint64_t active = _UTGetActiveTypeForCFStringIdentifier(*a1, v62, &v64);
      if (!active) {
        goto LABEL_12;
      }
      int v12 = *(unsigned __int8 *)(a4 + 32);
      *(_DWORD *)a4 = (_DWORD)v64;
      *(void *)(a4 + _Block_object_dispose((const void *)(v16 - 96), 8) = active;
      if (v12)
      {
        float v13 = *(void **)(a4 + 16);
        *(void *)(a4 + 16) = 0LL;

        goto LABEL_11;
      }

      *(void *)(a4 + 16) = 0LL;
    }

    *(_BYTE *)(a4 + 32) = 1;
    goto LABEL_11;
  }

LABEL_70:
        uint64_t v39 = _UTTypeGet();
        int v40 = *(unsigned __int8 *)(a4 + 32);
        *(_DWORD *)a4 = v38;
        *(void *)(a4 + _Block_object_dispose((const void *)(v16 - 96), 8) = v39;
        if (v40)
        {
          id v41 = *(void **)(a4 + 16);
          *(void *)(a4 + 16) = 0LL;
        }

        else
        {
          *(void *)(a4 + 16) = 0LL;
          *(_BYTE *)(a4 + 32) = 1;
        }

        *(_BYTE *)(a4 + 24) = 0;
        goto LABEL_74;
      }

      unint64_t v22 = (__CFString *)LaunchServices::TypeEvaluation::State::getExtension((LaunchServices::TypeEvaluation::State *)v57);
      if (v22)
      {
        if (!_UTExtensionLooksLikeAppendedRandomness(**(void ***)v57, v22))
        {
          unint64_t v23 = @"public.filename-extension";
          unint64_t v22 = v22;
          if (v23)
          {
            if (_UTTypeGet()) {
              int v33 = (__CFString *)_CSStringCopyCFString();
            }
            else {
              int v33 = 0LL;
            }
            DynamicIdentifierForTag = (__CFString *)_UTTypeCreateDynamicIdentifierForTag(*(void ***)v57, v23, v22, v33);

LABEL_35:
            if (DynamicIdentifierForTag)
            {
              char v25 = (void *)-[__CFString copy](DynamicIdentifierForTag, "copy");
              LODWORD(v64) = 0;
              uint64_t v65 = 0LL;
              id v66 = v25;
              char v68 = 1;
              char v67 = 0;
            }

            goto LABEL_37;
          }

void sub_183F8C48C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  if (*(_BYTE *)(v14 + 32)) {
  _Unwind_Resume(a1);
  }
}

uint64_t LaunchServices::TypeEvaluator::getTypeUnit(uint64_t a1, void **a2, _DWORD *a3, void *a4)
{
  if (!v11) {
    return 0LL;
  }
  if (a3) {
    *a3 = v8;
  }
  uint64_t v6 = v9;
  if (!a4
    || v9
    || (_LSMakeNSErrorImpl((void *)*MEMORY[0x189607670], -9499LL, (uint64_t)"getTypeUnit", 139LL, 0LL),
        uint64_t v6 = 0LL,
        *a4 = (id)objc_claimAutoreleasedReturnValue(),
        v11))
  {
  }

  return v6;
}

void sub_183F8C638( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, char a14)
{
  if (a14) {

  }
  _Unwind_Resume(exception_object);
}

id LaunchServices::TypeEvaluator::getTypeIdentifier(uint64_t a1, void **a2, void *a3)
{
  int v17 = a2;
  id v18 = 0LL;
  char v19 = 0;
  id v20 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  int v5 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v17, v5, 0LL);

  if (!v6)
  {
    if (a3)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      int v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v17, v8, 0LL);

      if (v9) {
        id v10 = 0LL;
      }
      else {
        id v10 = v20;
      }
      unint64_t v7 = 0LL;
      *a3 = v10;
      goto LABEL_11;
    }

    goto LABEL_8;
  }

  LaunchServices::TypeEvaluation::runEvaluator((void **)&v6->db, a1, a3, (uint64_t)v15);
  if (!v16)
  {
LABEL_8:
    unint64_t v7 = 0LL;
    goto LABEL_11;
  }

  LaunchServices::TypeEvaluator::Result::getTypeIdentifier(v15, v6);
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16) {

  }
LABEL_11:
  id v11 = v7;
  if (v17 && v19) {
    _LSContextDestroy(v17);
  }
  id v12 = v18;
  int v17 = 0LL;
  id v18 = 0LL;

  char v19 = 0;
  id v13 = v20;
  id v20 = 0LL;

  return v11;
}

void sub_183F8C7AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)va);
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::TypeEvaluator::PrepareMimicForTypeEvaluation(void *a1, uint64_t a2)
{
  uint64_t result = _LSPrepareMimicForBundleClass(a1, a2);
  if ((_DWORD)result)
  {
    v8[0] = sel_isSymbolicLink;
    v8[1] = sel_isAliasFile;
    v8[2] = sel_isRegularFile;
    v8[3] = sel_nameWithError_;
    v8[4] = sel_isExecutable;
    id v5 = a1;
    uint64_t v6 = 0LL;
    LOBYTE(v7) = 1;
    do
    {
      while (!(_BYTE)v7)
      {
        if (++v6 == 5)
        {

          return 0LL;
        }

        LOBYTE(v7) = 0;
      }

      int v7 = [v5 populateSimpleSelector:v8[v6++] error:a2];
    }

    while (v6 != 5);

    if (v7) {
      return [v5 populateValueForKey:*MEMORY[0x189603BF8] error:a2];
    }
    return 0LL;
  }

  return result;
}

void sub_183F8C900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id LaunchServices::TypeEvaluation::State::getExtension(LaunchServices::TypeEvaluation::State *this)
{
  id v1 = (void *)*((void *)this + 3);
  if (v1
    || ([*((id *)this + 1) extensionWithError:0],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        unint64_t v4 = (void *)*((void *)this + 3),
        *((void *)this + 3) = v3,
        v4,
        (id v1 = (void *)*((void *)this + 3)) != 0LL))
  {
    if ([v1 length]) {
      id v5 = v1;
    }
    else {
      id v5 = 0LL;
    }
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

void ___ZN14LaunchServices14TypeEvaluationL15resolveBaseTypeERNS0_5StateEPU15__autoreleasingP7NSError_block_invoke()
{
  v5[4] = *MEMORY[0x1895F89C0];
  uint64_t v0 = *MEMORY[0x189603BF0];
  v4[0] = *MEMORY[0x189603C00];
  v4[1] = v0;
  v5[0] = @"public.named-pipe";
  v5[1] = @"public.character-special";
  uint64_t v1 = *MEMORY[0x189603C08];
  _OWORD v4[2] = *MEMORY[0x189603BE8];
  v4[3] = v1;
  v5[2] = @"public.block-special";
  v5[3] = @"public.socket";
  uint64_t v2 = [MEMORY[0x189603F68] dictionaryWithObjects:v5 forKeys:v4 count:4];
  uint64_t v3 = (void *)LaunchServices::TypeEvaluation::resolveBaseType(LaunchServices::TypeEvaluation::State &,NSError * {__autoreleasing}*)::posixUTIs;
  LaunchServices::TypeEvaluation::resolveBaseType(LaunchServices::TypeEvaluation::State &,NSError * {__autoreleasing}*)::posixUTIs = v2;
}

void ___ZN14LaunchServices14TypeEvaluationL14gnitsFileNamesEv_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x189604010]) initWithArray:&unk_189DA8520];
  uint64_t v1 = (void *)LaunchServices::TypeEvaluation::gnitsFileNames(void)::result;
  LaunchServices::TypeEvaluation::gnitsFileNames(void)::uint64_t result = v0;
}

void sub_183F8CC28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__46(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__46(uint64_t a1)
{
}

void sub_183F8CFA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, void *a24, uint64_t a25, void *a26)
{
}

void sub_183F8D0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8D128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8D35C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18)
{
}

id fallbackDynamicOrBaseTypeRecord(LSContext *a1, const __CFString *a2, __CFString *inUTI, __CFString *a4)
{
  if (!a4
    || !-[__CFString isEqual:](inUTI, "isEqual:", @"public.filename-extension")
    || !_UTExtensionLooksLikeAppendedRandomness(a1->db, a2)
    || (-[__CFString isEqualToString:](a4, "isEqualToString:", @"public.data") & 1) == 0
    && (-[__CFString isEqualToString:](a4, "isEqualToString:", @"public.folder") & 1) == 0
    && !-[__CFString isEqualToString:](a4, "isEqualToString:", @"public.directory")
    || (+[UTTypeRecord _typeRecordWithContext:identifier:allowUndeclared:]( &OBJC_CLASS___UTTypeRecord,  "_typeRecordWithContext:identifier:allowUndeclared:",  a1,  a4,  0LL),  (id v8 = (id)objc_claimAutoreleasedReturnValue()) == 0LL))
  {
    DynamicIdentifierForTag = (__CFString *)_UTTypeCreateDynamicIdentifierForTag((void **)&a1->db, inUTI, a2, a4);
    if (DynamicIdentifierForTag) {
      id v8 = -[_UTDynamicTypeRecord _initWithContext:dynamicUTI:]( objc_alloc(&OBJC_CLASS____UTDynamicTypeRecord),  "_initWithContext:dynamicUTI:",  a1,  DynamicIdentifierForTag);
    }
    else {
      id v8 = 0LL;
    }
  }

  return v8;
}

void sub_183F8D4E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8D76C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, ...)
{
  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)va);
  _Block_object_dispose((const void *)(v15 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_183F8D8BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8DBD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, id a26)
{
  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)&a17);
  _Block_object_dispose(&a21, 8);

  _Unwind_Resume(a1);
}

void sub_183F8DDB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8DE20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8DE8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_183F8DF40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8DFC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8E018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8E084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8E3B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
  *(void *)(v27 + 120) = v26;
  std::vector<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::__destroy_vector::operator()[abi:nn180100]((void ***)(v28 - 96));
  _Block_object_dispose((const void *)(v28 - 144), 8);

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__19(__n128 *a1, __n128 *a2)
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

void __Block_byref_object_dispose__20(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 48);
  std::vector<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::__destroy_vector::operator()[abi:nn180100](&v1);
}

void sub_183F8E528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id std::vector<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::push_back[abi:nn180100]( void *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  int v7 = *(void **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - *a1) >> 3);
    if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 3);
    uint64_t v13 = 2 * v12;
    if (2 * v12 <= v11 + 1) {
      uint64_t v13 = v11 + 1;
    }
    if (v12 >= 0x555555555555555LL) {
      unint64_t v14 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v14 = v13;
    }
    uint64_t v30 = v4;
    if (v14)
    {
      uint64_t v15 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>>( v4,  v14);
      uint64_t v17 = v16;
    }

    else
    {
      uint64_t v15 = 0LL;
      uint64_t v17 = 0LL;
    }

    id v18 = &v15[24 * v11];
    *(void *)id v18 = *(id *)a2;
    uint64_t v19 = *(void *)(a2 + 8);
    *(void *)(v18 + 13) = *(void *)(a2 + 13);
    *((void *)v18 + 1) = v19;
    unint64_t v21 = (void *)*a1;
    id v20 = (void *)a1[1];
    if (v20 == (void *)*a1)
    {
      int64x2_t v25 = vdupq_n_s64((unint64_t)v20);
      unint64_t v22 = v18;
    }

    else
    {
      unint64_t v22 = v18;
      do
      {
        uint64_t v23 = *(v20 - 3);
        v20 -= 3;
        *id v20 = 0LL;
        *(v22 - 3) = v23;
        v22 -= 3;
        uint64_t v24 = v20[1];
        *(void *)((char *)v22 + 13) = *(void *)((char *)v20 + 13);
        v22[1] = v24;
      }

      while (v20 != v21);
      int64x2_t v25 = *(int64x2_t *)a1;
    }

    id v10 = v18 + 24;
    *a1 = v22;
    a1[1] = v18 + 24;
    int64x2_t v28 = v25;
    uint64_t v26 = a1[2];
    a1[2] = &v15[24 * v17];
    uint64_t v29 = v26;
    uint64_t v27 = v25.i64[0];
    id result = (id)std::__split_buffer<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::~__split_buffer((uint64_t)&v27);
  }

  else
  {
    id result = *(id *)a2;
    *int v7 = result;
    uint64_t v9 = *(void *)(a2 + 13);
    v7[1] = *(void *)(a2 + 8);
    *(void *)((char *)v7 + 13) = v9;
    id v10 = v7 + 3;
  }

  a1[1] = v10;
  return result;
}

void sub_183F8E804( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_183F8E928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8EA54( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_183F8ED38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8EDE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F8EE70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8EEB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8EF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8F14C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8F724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8F98C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_183F8FA88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F8FB6C(_Unwind_Exception *a1)
{
}

void sub_183F8FC64( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_183F8FDB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_183F8FE4C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F8FF38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_183F8FFD4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F900E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F901DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F90410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F90548(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F90668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F906E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F907B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F908B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F90964( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183F90C44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table(a9);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__229(uint64_t a1, uint64_t a2)
{
  return std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::__hash_table( a1 + 48,  (uint64_t *)(a2 + 48));
}

uint64_t __Block_byref_object_dispose__230(uint64_t a1)
{
  return std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table(a1 + 48);
}

void sub_183F90E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F90F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F910AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F91100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F911D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F9128C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F913B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F9143C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F91640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F91824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::__destroy_vector::operator()[abi:nn180100]( void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        unint64_t v6 = (void *)*((void *)v4 - 3);
        v4 -= 24;
      }

      while (v4 != v2);
      unint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void *std::__allocate_at_least[abi:nn180100]<std::allocator<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>>( uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__split_buffer<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::~__split_buffer( uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 24;
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t _UTBase32EncodedLength(unsigned int a1)
{
  return encodedRemainderLen[a1 % 5] + 8 * (a1 / 5);
}

uint64_t _UTBase32DecodedLength(unsigned int a1)
{
  return 5 * (a1 >> 3) + decodedRemainderLen[a1 & 7];
}

unsigned __int8 *_UTBase32Encode(unsigned __int8 *result, unsigned int a2, _BYTE *a3)
{
  uint64_t v4 = result;
  unint64_t v5 = &result[a2];
  uint64_t v6 = a2 % 5;
  if (&v5[-v6] > result)
  {
    do
    {
      id result = _UTBase32EncodeDatum(v4, 5, a3);
      v4 += 5;
      a3 += 8;
    }

    while (v4 < &v5[-v6]);
  }

  if ((_DWORD)v6) {
    return _UTBase32EncodeDatum(v4, v6, a3);
  }
  return result;
}

unsigned __int8 *_UTBase32EncodeDatum(unsigned __int8 *result, int a2, _BYTE *a3)
{
  switch(a2)
  {
    case 1:
      *a3 = encoder[(unint64_t)*result >> 3];
      uint64_t v3 = 4LL * (*result & 7);
      uint64_t v4 = 1LL;
      goto LABEL_7;
    case 2:
      *a3 = encoder[(unint64_t)*result >> 3];
      a3[1] = encoder[((unint64_t)result[1] >> 6) & 0xFFFFFFFFFFFFFFE3LL | (4LL * (*result & 7))];
      a3[2] = encoder[((unint64_t)result[1] >> 1) & 0x1F];
      uint64_t v3 = 16LL * (result[1] & 1);
      uint64_t v4 = 3LL;
      goto LABEL_7;
    case 3:
      *a3 = encoder[(unint64_t)*result >> 3];
      a3[1] = encoder[((unint64_t)result[1] >> 6) & 0xFFFFFFFFFFFFFFE3LL | (4LL * (*result & 7))];
      a3[2] = encoder[((unint64_t)result[1] >> 1) & 0x1F];
      a3[3] = encoder[((unint64_t)result[2] >> 4) & 0xFFFFFFFFFFFFFFEFLL | (16LL * (result[1] & 1))];
      uint64_t v3 = 2LL * (result[2] & 0xF);
      uint64_t v4 = 4LL;
      goto LABEL_7;
    case 4:
      *a3 = encoder[(unint64_t)*result >> 3];
      a3[1] = encoder[((unint64_t)result[1] >> 6) & 0xFFFFFFFFFFFFFFE3LL | (4LL * (*result & 7))];
      a3[2] = encoder[((unint64_t)result[1] >> 1) & 0x1F];
      a3[3] = encoder[((unint64_t)result[2] >> 4) & 0xFFFFFFFFFFFFFFEFLL | (16LL * (result[1] & 1))];
      a3[4] = encoder[((unint64_t)result[3] >> 7) & 0xFFFFFFFFFFFFFFE1LL | (2LL * (result[2] & 0xF))];
      a3[5] = encoder[((unint64_t)result[3] >> 2) & 0x1F];
      uint64_t v3 = 8LL * (result[3] & 3);
      uint64_t v4 = 6LL;
      goto LABEL_7;
    case 5:
      *a3 = encoder[(unint64_t)*result >> 3];
      a3[1] = encoder[((unint64_t)result[1] >> 6) & 0xFFFFFFFFFFFFFFE3LL | (4LL * (*result & 7))];
      a3[2] = encoder[((unint64_t)result[1] >> 1) & 0x1F];
      a3[3] = encoder[((unint64_t)result[2] >> 4) & 0xFFFFFFFFFFFFFFEFLL | (16LL * (result[1] & 1))];
      a3[4] = encoder[((unint64_t)result[3] >> 7) & 0xFFFFFFFFFFFFFFE1LL | (2LL * (result[2] & 0xF))];
      a3[5] = encoder[((unint64_t)result[3] >> 2) & 0x1F];
      a3[6] = encoder[((unint64_t)result[4] >> 5) & 0xFFFFFFFFFFFFFFE7LL | (8LL * (result[3] & 3))];
      uint64_t v3 = result[4] & 0x1F;
      uint64_t v4 = 7LL;
LABEL_7:
      a3[v4] = encoder[v3];
      break;
    default:
      return result;
  }

  return result;
}

BOOL _UTBase32Decode(uint64_t a1, unsigned int a2, _BYTE *a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = a1 + a2;
  uint64_t v6 = a2 & 7;
  if (v5 - v6 != a1)
  {
    uint64_t v7 = a2 - v6;
    while (_UTBase32DecodeDatum(v4, 8, a3))
    {
      v4 += 8LL;
      a3 += 5;
      v7 -= 8LL;
      if (!v7)
      {
        uint64_t v4 = v5 - v6;
        break;
      }
    }
  }

  return v4 == v5;
}

uint64_t _UTBase32DecodeDatum(uint64_t a1, int a2, _BYTE *a3)
{
  uint64_t v3 = 0LL;
  v20[1] = *MEMORY[0x1895F89C0];
  if (a1 && (a2 - 1) <= 7)
  {
    uint64_t v4 = 0LL;
    v20[0] = 0LL;
    do
    {
      int v5 = decoder[*(char *)(a1 + v4)];
      if (v5 < 0) {
        return 0LL;
      }
      *((_BYTE *)v20 + v4++) = v5;
    }

    while (a2 != v4);
    switch(a2)
    {
      case 2:
        *a3 = (BYTE1(v20[0]) >> 2) | (8 * LOBYTE(v20[0]));
        break;
      case 4:
        char v6 = BYTE1(v20[0]);
        *a3 = (BYTE1(v20[0]) >> 2) | (8 * LOBYTE(v20[0]));
        a3[1] = (2 * BYTE2(v20[0])) | (v6 << 6) | (BYTE3(v20[0]) >> 4);
        break;
      case 5:
        char v7 = BYTE1(v20[0]);
        *a3 = (BYTE1(v20[0]) >> 2) | (8 * LOBYTE(v20[0]));
        char v8 = (2 * BYTE2(v20[0])) | (v7 << 6);
        char v9 = BYTE3(v20[0]);
        a3[1] = v8 | (BYTE3(v20[0]) >> 4);
        a3[2] = (BYTE4(v20[0]) >> 1) | (16 * v9);
        break;
      case 7:
        char v10 = BYTE1(v20[0]);
        *a3 = (BYTE1(v20[0]) >> 2) | (8 * LOBYTE(v20[0]));
        char v11 = (2 * BYTE2(v20[0])) | (v10 << 6);
        char v12 = BYTE3(v20[0]);
        a3[1] = v11 | (BYTE3(v20[0]) >> 4);
        char v13 = BYTE4(v20[0]);
        a3[2] = (BYTE4(v20[0]) >> 1) | (16 * v12);
        a3[3] = (4 * BYTE5(v20[0])) | (v13 << 7) | (BYTE6(v20[0]) >> 3);
        break;
      case 8:
        char v14 = BYTE1(v20[0]);
        *a3 = (BYTE1(v20[0]) >> 2) | (8 * LOBYTE(v20[0]));
        char v15 = (2 * BYTE2(v20[0])) | (v14 << 6);
        char v16 = BYTE3(v20[0]);
        a3[1] = v15 | (BYTE3(v20[0]) >> 4);
        char v17 = BYTE4(v20[0]);
        a3[2] = (BYTE4(v20[0]) >> 1) | (16 * v16);
        char v18 = BYTE6(v20[0]);
        a3[3] = (4 * BYTE5(v20[0])) | (v17 << 7) | (BYTE6(v20[0]) >> 3);
        a3[4] = HIBYTE(v20[0]) | (32 * v18);
        break;
      default:
        return 1LL;
    }

    return 1LL;
  }

  return v3;
}

void sub_183F92568(_Unwind_Exception *a1)
{
}

void sub_183F92810(_Unwind_Exception *a1)
{
}

void sub_183F92AA0(_Unwind_Exception *a1)
{
}

void sub_183F92DC0(_Unwind_Exception *a1)
{
}

void sub_183F92E78(_Unwind_Exception *a1)
{
}

void sub_183F92FD8(_Unwind_Exception *a1)
{
}

void sub_183F93068(_Unwind_Exception *a1)
{
}

void sub_183F93250( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_183F9330C(_Unwind_Exception *a1)
{
}

void sub_183F94388( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_183F944C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_183F9483C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

uint64_t __Block_byref_object_copy__47(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__47(uint64_t a1)
{
}

void sub_183F94BB4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
}

void sub_183F94E44(_Unwind_Exception *a1)
{
}

unint64_t computeEffectiveUnitsForPhase(uint64_t a1, unint64_t a2, void *a3, double a4)
{
  id v7 = a3;
  [MEMORY[0x189607968] numberWithUnsignedInteger:a1];
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v8];
  char v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 > 0.0 && v9)
  {
    [MEMORY[0x189607968] numberWithUnsignedInteger:a1];
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 objectForKeyedSubscript:v10];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 doubleValue];
    double v13 = v12;

    double v14 = v13 / a4 * 100.0;
    else {
      unint64_t v15 = (unint64_t)v14;
    }
    if (v13 <= 0.0) {
      a2 = (unint64_t)v14;
    }
    else {
      a2 = v15;
    }
  }

  return a2;
}

void sub_183F95D84( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22)
{
}

void sub_183F964E0(_Unwind_Exception *a1)
{
}

void sub_183F96B3C(_Unwind_Exception *a1)
{
}

void sub_183F96DC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_183F97234(_Unwind_Exception *a1)
{
}

void sub_183F97520( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183F97678(_Unwind_Exception *a1)
{
}

void sub_183F978BC(_Unwind_Exception *a1)
{
}

void addPluginDataToNotificationDict(void *a1, void *a2)
{
  id v12 = a1;
  id v3 = a2;
  [v3 uniqueIdentifier];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 UUIDString];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    [MEMORY[0x189603FC8] dictionaryWithCapacity:0];
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 bundleIdentifier];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7) {
      [v6 setObject:v7 forKey:*MEMORY[0x189604E00]];
    }
    [v3 effectiveBundleIdentifier];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8) {
      [v6 setObject:v8 forKey:@"NSExtensionIdentifier"];
    }
    [v3 bundleVersion];
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9) {
      [v6 setObject:v9 forKey:*MEMORY[0x189604E18]];
    }
    [v3 URL];
    char v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 path];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11) {
      [v6 setObject:v11 forKey:@"_LSBundlePath"];
    }
    if ([v6 count]) {
      [v12 setObject:v6 forKey:v5];
    }
  }

  else
  {
    id v7 = 0LL;
    char v8 = 0LL;
    char v9 = 0LL;
    char v11 = 0LL;
    char v6 = 0LL;
  }
}

LABEL_95:
          }

          uint64_t v77 = [v75 countByEnumeratingWithState:&v101 objects:v114 count:16];
          if (!v77)
          {
LABEL_97:

            CFTypeID v88 = CFNotificationCenterGetDistributedCenter();
            CFNotificationCenterPostNotificationWithOptions(v88, cf1, 0LL, (CFDictionaryRef)v74, 2uLL);
            _LSProgressLog();
            id v89 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int128 buf = 138412546;
              CFTypeRef v116 = cf1;
              __int128 v117 = 2112;
              __int128 v118 = (const __CFDictionary *)v74;
              _os_log_impl( &dword_183E58000,  v89,  OS_LOG_TYPE_DEFAULT,  "Sent plugin notification %@ with payload %@",  buf,  0x16u);
            }

            id v7 = v95;
            uint64_t v1 = v97;
            break;
          }
        }
      }
    }
  }

  uint64_t v90 = *(void *)(v1 + 72);
  if (v90) {
    uint64_t v90 = (*(uint64_t (**)(void))(v90 + 16))();
  }
  MEMORY[0x186E2AFE0](v90);
}

void sub_183F99654( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183F9A30C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183F9A704( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t __Block_byref_object_copy__288(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x186E2A7B8](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__289(uint64_t a1)
{
}

void sub_183F9C4F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_183F9C6AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
}

uint64_t initMKBDeviceUnlockedSinceBoot()
{
  uint64_t v0 = (void *)MobileKeyBagLibrary_frameworkLibrary;
  if (!MobileKeyBagLibrary_frameworkLibrary)
  {
    uint64_t v0 = dlopen("/System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag", 2);
    MobileKeyBagLibrary_frameworkLibrary = (uint64_t)v0;
  }

  softLinkMKBDeviceUnlockedSinceBoot = (uint64_t (*)())dlsym(v0, "MKBDeviceUnlockedSinceBoot");
  return softLinkMKBDeviceUnlockedSinceBoot();
}

SEL __recordSelectorsForPluginNotification_block_invoke()
{
  uint64_t v0 = 0LL;
  recordSelectorsForPluginNotification_registeredSels_init = 1;
  qword_18C671108 = 0LL;
  do
  {
    SEL result = sel_registerName(recordSelectorsForPluginNotification_unregisteredSels[v0]);
    recordSelectorsForPluginNotification_registeredSels_body[v0++] = (uint64_t)result;
  }

  while (v0 != 5);
  return result;
}

uint64_t LSPersonaTypeForPersonaAttributes(void *a1)
{
  id v1 = a1;
  if ([v1 isSystemPersona])
  {
    uint64_t v2 = 3LL;
  }

  else if ([v1 isPersonalPersona])
  {
    uint64_t v2 = 1LL;
  }

  else if ([v1 isEnterprisePersona])
  {
    uint64_t v2 = 2LL;
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

void sub_183F9D564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F9D62C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F9D6E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183F9D764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F9D858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t personaGenerationChangedCallback( __CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  return objc_msgSend(a2, "refreshFromUserManagementIfNecessary", a3, a4, a5);
}

void sub_183F9DB14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20, void *a21)
{
  _Unwind_Resume(a1);
}

void sub_183F9E190( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, void *a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, void *__p, uint64_t a43)
{
}

void sub_183F9E644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)va);
  _Unwind_Resume(a1);
}

std::vector<unsigned int> *__copy_helper_block_ea8_64c39_ZTSNSt3__16vectorIjNS_9allocatorIjEEEE( uint64_t a1, uint64_t a2)
{
  return std::vector<LSBundleClass>::vector( (std::vector<unsigned int> *)(a1 + 64),  (const std::vector<unsigned int> *)(a2 + 64));
}

void __destroy_helper_block_ea8_64c39_ZTSNSt3__16vectorIjNS_9allocatorIjEEEE(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  if (v2)
  {
    *(void *)(a1 + 72) = v2;
    operator delete(v2);
  }

void sub_183F9E874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F9EB14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F9EF04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_183F9F0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F9F220( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
}

void sub_183F9F298( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_183F9F300( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_183F9F460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183F9F8B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_183F9FBA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL24_LSGetPersonaUpdateQueuev_block_invoke()
{
  uint64_t v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.lsd.personaupdate", v2);
  id v1 = (void *)_LSGetPersonaUpdateQueue(void)::queue;
  _LSGetPersonaUpdateQueue(void)::queue = (uint64_t)v0;
}

uint64_t _AppleIDAuthenticationAddAppleIDWithBlock( uint64_t a1, uint64_t a2, uint64_t a3, dispatch_queue_s *a4, uint64_t a5)
{
  id v7 = (os_log_s *)AppleIDGetLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEFAULT,  "AddAppleID: This operation is not supported anymore\n",  buf,  2u);
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ___AppleIDAuthenticationAddAppleIDWithBlock_block_invoke;
  block[3] = &unk_189D7A260;
  block[4] = a5;
  dispatch_async(a4, block);
  return 1LL;
}

uint64_t _AppleIDAuthenticationAddAppleID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = 0LL;
  char v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  char v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  char v6 = (dispatch_queue_s *)getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 1174405120LL;
  uint64x2_t v12[2] = ___AppleIDAuthenticationAddAppleID_block_invoke;
  void v12[3] = &unk_189D7A288;
  void v12[4] = &v15;
  v12[5] = a4;
  dispatch_object_t object = v5;
  char v14 = 1;
  dispatch_retain(v5);
  _AppleIDAuthenticationAddAppleIDWithBlock(v7, v8, v9, v6, (uint64_t)v12);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v14) {
    dispatch_release(object);
  }
  uint64_t v10 = *((unsigned __int8 *)v16 + 24);
  dispatch_release(v5);
  _Block_object_dispose(&v15, 8);
  return v10;
}

void __copy_helper_block_8_48c14_ZTS9Semaphore(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(dispatch_object_s **)(a2 + 48);
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = v2;
  *(_BYTE *)(a1 + 56) = 1;
  dispatch_retain(v2);
}

void __destroy_helper_block_8_48c14_ZTS9Semaphore(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56)) {
    dispatch_release(*(dispatch_object_t *)(a1 + 48));
  }
}

uint64_t _AppleIDAuthenticationForgetAppleIDWithBlock( uint64_t a1, uint64_t a2, dispatch_queue_s *a3, uint64_t a4)
{
  char v6 = (os_log_s *)AppleIDGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_DEFAULT,  "ForgetAppleID: This operation is not supported anymore\n",  buf,  2u);
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ___AppleIDAuthenticationForgetAppleIDWithBlock_block_invoke;
  block[3] = &unk_189D7A2C0;
  block[4] = a4;
  dispatch_async(a3, block);
  return 1LL;
}

uint64_t _AppleIDAuthenticationForgetAppleID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = 0LL;
  char v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  char v16 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  dispatch_semaphore_t v5 = (dispatch_queue_s *)getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 1174405120LL;
  v10[2] = ___AppleIDAuthenticationForgetAppleID_block_invoke;
  v10[3] = &unk_189D7A2E8;
  void v10[4] = &v13;
  v10[5] = a3;
  dispatch_object_t object = v4;
  char v12 = 1;
  dispatch_retain(v4);
  _AppleIDAuthenticationForgetAppleIDWithBlock(v6, v7, v5, (uint64_t)v10);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  if (v12) {
    dispatch_release(object);
  }
  uint64_t v8 = *((unsigned __int8 *)v14 + 24);
  dispatch_release(v4);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t _AppleIDAuthenticationCopyAppleIDsWithBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_semaphore_t v5 = (os_log_s *)AppleIDGetLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_183E58000, v5, OS_LOG_TYPE_DEFAULT, "CopyAppleIDs: Deferring to sharingd. \n", buf, 2u);
  }

  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 0x40000000LL;
  _DWORD v7[2] = ___AppleIDAuthenticationCopyAppleIDsWithBlock_block_invoke;
  v7[3] = &unk_189D7A320;
  void v7[4] = a3;
  ((void (*)(uint64_t, uint64_t))softLinkSFAppleIDClientCopyMyAppleID[0])(a2, (uint64_t)v7);
  return 1LL;
}

uint64_t _AppleIDAuthenticationCopyAppleIDs(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = 0LL;
  char v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  uint64_t v14 = 0LL;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v4 = getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 1174405120LL;
  v8[2] = ___AppleIDAuthenticationCopyAppleIDs_block_invoke;
  v8[3] = &unk_189D7A348;
  v8[4] = &v11;
  void v8[5] = a2;
  dispatch_object_t object = v3;
  char v10 = 1;
  dispatch_retain(v3);
  _AppleIDAuthenticationCopyAppleIDsWithBlock(v5, v4, (uint64_t)v8);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  if (v10) {
    dispatch_release(object);
  }
  uint64_t v6 = v12[3];
  dispatch_release(v3);
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t _AppleIDAuthenticationCopyCertificateInfoWithBlock( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (os_log_s *)AppleIDGetLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_183E58000, v8, OS_LOG_TYPE_DEFAULT, "CopyCertificateInfo: Deferring to sharingd. \n", buf, 2u);
  }

  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 0x40000000LL;
  v10[2] = ___AppleIDAuthenticationCopyCertificateInfoWithBlock_block_invoke;
  v10[3] = &unk_189D7A380;
  void v10[4] = a5;
  softLinkSFAppleIDClientCopyCertificateInfo(a1, a4, (uint64_t)v10);
  return 1LL;
}

uint64_t _AppleIDAuthenticationCopyCertificateInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = 0LL;
  char v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  uint64_t v18 = 0LL;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
  uint64_t v7 = getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 1174405120LL;
  uint64x2_t v12[2] = ___AppleIDAuthenticationCopyCertificateInfo_block_invoke;
  void v12[3] = &unk_189D7A3A8;
  void v12[4] = &v15;
  v12[5] = a4;
  dispatch_object_t object = v6;
  char v14 = 1;
  dispatch_retain(v6);
  _AppleIDAuthenticationCopyCertificateInfoWithBlock(a1, v8, v9, v7, (uint64_t)v12);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (v14) {
    dispatch_release(object);
  }
  uint64_t v10 = v16[3];
  dispatch_release(v6);
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t _AppleIDAuthenticationCopyMyInfoWithBlock(uint64_t a1, uint64_t a2, dispatch_queue_s *a3, uint64_t a4)
{
  dispatch_semaphore_t v6 = (os_log_s *)AppleIDGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_DEFAULT,  "CopyMyInfo: this operation is not supported anymore.\n",  buf,  2u);
  }

  uint64_t result = 0LL;
  if (a3)
  {
    if (a4)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 0x40000000LL;
      block[2] = ___AppleIDAuthenticationCopyMyInfoWithBlock_block_invoke;
      block[3] = &unk_189D7A3E0;
      block[4] = a4;
      dispatch_async(a3, block);
      return 1LL;
    }
  }

  return result;
}

uint64_t _AppleIDAuthenticationCopyMyInfo(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  uint64_t v13 = 0LL;
  char v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  uint64_t v16 = 0LL;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0LL);
  uint64_t v5 = (dispatch_queue_s *)getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 1174405120LL;
  v10[2] = ___AppleIDAuthenticationCopyMyInfo_block_invoke;
  v10[3] = &unk_189D7A408;
  void v10[4] = &v13;
  void v10[5] = a3;
  dispatch_object_t object = v4;
  char v12 = 1;
  dispatch_retain(v4);
  if (_AppleIDAuthenticationCopyMyInfoWithBlock(v6, v7, v5, (uint64_t)v10))
  {
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  }

  else if (a3)
  {
    *a3 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], @"CSIdentityErrorDomain", -99LL, 0LL);
  }

  if (v12) {
    dispatch_release(object);
  }
  uint64_t v8 = v14[3];
  dispatch_release(v4);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t _AppleIDAuthenticationFindPersonWithBlock( const __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (os_log_s *)AppleIDGetLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_183E58000, v7, OS_LOG_TYPE_DEFAULT, "FindPerson: Deferring to sharingd.", buf, 2u);
  }

  if (!a1)
  {
    CFArrayGetTypeID();
    CFArrayGetTypeID();
LABEL_24:
    ValueAtIndex = 0LL;
    goto LABEL_25;
  }

  Value = CFDictionaryGetValue(a1, @"email");
  CFTypeID TypeID = CFArrayGetTypeID();
  if (Value && TypeID && CFGetTypeID(Value) != TypeID) {
    Value = 0LL;
  }
  uint64_t v10 = CFDictionaryGetValue(a1, @"phone");
  CFTypeID v11 = CFArrayGetTypeID();
  if (v10 && v11 && CFGetTypeID(v10) != v11) {
    uint64_t v10 = 0LL;
  }
  if (!Value
    || !CFArrayGetCount((CFArrayRef)Value)
    || (ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, 0LL), CFTypeID v13 = CFStringGetTypeID(), !ValueAtIndex)
    || v13 && CFGetTypeID(ValueAtIndex) != v13)
  {
    if (!v10) {
      goto LABEL_24;
    }
    if (!CFArrayGetCount((CFArrayRef)v10)) {
      goto LABEL_24;
    }
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v10, 0LL);
    CFTypeID v14 = CFStringGetTypeID();
    if (ValueAtIndex)
    {
      if (v14 && CFGetTypeID(ValueAtIndex) != v14) {
        goto LABEL_24;
      }
    }
  }

uint64_t _AppleIDAuthenticationFindPerson(const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = 0LL;
  CFTypeID v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  uint64_t v13 = 0LL;
  uint64_t v5 = operator new(0x10uLL);
  *(void *)uint64_t v5 = dispatch_semaphore_create(0LL);
  v5[8] = 1;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 0x40000000LL;
  _OWORD v9[2] = ___AppleIDAuthenticationFindPerson_block_invoke;
  v9[3] = &unk_189D7A468;
  void v9[4] = &v10;
  v9[5] = a3;
  void v9[6] = v5;
  _AppleIDAuthenticationFindPersonWithBlock( a1,  v6,  getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue,  (uint64_t)v9);
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v5[8]) {
    dispatch_release(*(dispatch_object_t *)v5);
  }
  operator delete(v5);
  uint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t _AppleIDCopySecIdentityForAppleIDAccount(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v6 = (os_log_s *)AppleIDGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_DEFAULT,  "CopySecIdentity: Deferring to sharingd. \n",  (uint8_t *)v11,  2u);
  }

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 1174405120LL;
  v11[2] = ___ZL41__AppleIDCopySecIdentityForAppleIDAccountPK10__CFStringPK14__CFDictionaryPP9__CFError_block_invoke;
  v11[3] = &unk_189D7A620;
  void v11[4] = &v14;
  void v11[5] = &v17;
  dispatch_object_t object = v5;
  char v13 = 1;
  dispatch_retain(v5);
  softLinkSFAppleIDClientCopyIdentity(a1, (uint64_t)global_queue, (uint64_t)v11);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    int v8 = *((_DWORD *)v18 + 6);
    if (v8) {
      *a3 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F50], v8, 0LL);
    }
  }

  uint64_t v9 = v15[3];
  if (v13) {
    dispatch_release(object);
  }
  dispatch_release(v5);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v17, 8);
  return v9;
}

CFStringRef _AppleIDCopyDSIDForCertificate(uint64_t a1, CFErrorRef *a2)
{
  dispatch_semaphore_t v4 = (os_log_s *)AppleIDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v22 = 0;
    _os_log_impl(&dword_183E58000, v4, OS_LOG_TYPE_DEFAULT, "AppleIDCopyDSIDForCertificate\n", v22, 2u);
  }

  if (a1)
  {
    dispatch_semaphore_t v5 = (const __CFArray *)SecCertificateCopyCommonNames();
    uint64_t v6 = v5;
    if (v5
      && CFArrayGetCount(v5) >= 1
      && (ValueAtIndex = CFArrayGetValueAtIndex(v6, 0LL), CFTypeID TypeID = CFStringGetTypeID(), ValueAtIndex)
      && (!TypeID || CFGetTypeID(ValueAtIndex) == TypeID)
      && (uint64_t v9 = (const __CFString *)CFRetain(ValueAtIndex)) != 0LL)
    {
      uint64_t v10 = v9;
      CFIndex Length = CFStringGetLength(v9);
      uint64_t v12 = 0LL;
      char v13 = 1;
      while (1)
      {
        char v14 = v13;
        uint64_t v15 = off_189D7A488[v12];
        if (CFStringHasPrefix(v10, v15)) {
          break;
        }
        char v13 = 0;
        uint64_t v12 = 1LL;
        if ((v14 & 1) == 0) {
          goto LABEL_35;
        }
      }

      CFIndex v19 = CFStringGetLength(v15);
      if (v19 < Length)
      {
        id v20 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        CFIndex v21 = v19 + 1;
        v23.length = CFStringGetLength(v10) + ~v19;
        v23.id location = v21;
        CFStringRef v17 = CFStringCreateWithSubstring(v20, v10, v23);
        char v13 = 0;
        goto LABEL_36;
      }

      char v13 = 0;
LABEL_35:
      CFStringRef v17 = 0LL;
LABEL_36:
      CFErrorRef v16 = 0LL;
      if (!a2)
      {
LABEL_18:
        if (v6) {
          CFRelease(v6);
        }
        if ((v13 & 1) == 0) {
          CFRelease(v10);
        }
        if (!a2) {
          goto LABEL_28;
        }
        goto LABEL_26;
      }
    }

    else
    {
      CFErrorRef v16 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F50], -1LL, 0LL);
      uint64_t v10 = 0LL;
      CFStringRef v17 = 0LL;
      char v13 = 1;
      if (!a2) {
        goto LABEL_18;
      }
    }

    if (!v17 && !v16) {
      CFErrorRef v16 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], @"CSIdentityErrorDomain", -10LL, 0LL);
    }
    goto LABEL_18;
  }

  if (!a2) {
    return 0LL;
  }
  CFErrorRef v16 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], @"CSIdentityErrorDomain", -99LL, 0LL);
  CFStringRef v17 = 0LL;
LABEL_26:
  if (!v17)
  {
    *a2 = v16;
    return v17;
  }

uint64_t _AppleIDAuthenticatePasswordWithBlock( uint64_t a1, uint64_t a2, uint64_t a3, dispatch_queue_s *a4, uint64_t a5)
{
  uint64_t v7 = (os_log_s *)AppleIDGetLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEFAULT,  "AuthenticatePasswordWithBlock: This operation is not supported anymore\n",  buf,  2u);
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = ___AppleIDAuthenticatePasswordWithBlock_block_invoke;
  block[3] = &unk_189D7A4A0;
  block[4] = a5;
  dispatch_async(a4, block);
  return 1LL;
}

uint64_t _AppleIDAuthenticatePassword(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = 0LL;
  CFErrorRef v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  char v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v6 = (dispatch_queue_s *)getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 1174405120LL;
  uint64x2_t v12[2] = ___AppleIDAuthenticatePassword_block_invoke;
  void v12[3] = &unk_189D7A4C8;
  void v12[4] = &v15;
  v12[5] = a4;
  dispatch_object_t object = v5;
  char v14 = 1;
  dispatch_retain(v5);
  _AppleIDAuthenticatePasswordWithBlock(v7, v8, v9, v6, (uint64_t)v12);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v14) {
    dispatch_release(object);
  }
  uint64_t v10 = *((unsigned __int8 *)v16 + 24);
  dispatch_release(v5);
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t _AppleIDAuthenticationCopyStatusWithBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_semaphore_t v5 = (os_log_s *)AppleIDGetLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl(&dword_183E58000, v5, OS_LOG_TYPE_DEFAULT, "CopyStatus: Deferring to sharingd. \n", buf, 2u);
  }

  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 0x40000000LL;
  _DWORD v7[2] = ___AppleIDAuthenticationCopyStatusWithBlock_block_invoke;
  v7[3] = &unk_189D7A500;
  void v7[4] = a3;
  ((void (*)(uint64_t, uint64_t))softLinkSFAppleIDClientCopyMyAccountInfo[0])(a2, (uint64_t)v7);
  return 1LL;
}

uint64_t _AppleIDAuthenticationCopyStatus(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = 0LL;
  char v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  char v16 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v6 = getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 1174405120LL;
  v10[2] = ___AppleIDAuthenticationCopyStatus_block_invoke;
  v10[3] = &unk_189D7A528;
  void v10[4] = &v13;
  void v10[5] = a2;
  void v10[6] = a3;
  dispatch_object_t object = v5;
  char v12 = 1;
  dispatch_retain(v5);
  _AppleIDAuthenticationCopyStatusWithBlock(v7, v6, (uint64_t)v10);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v12) {
    dispatch_release(object);
  }
  uint64_t v8 = *((unsigned __int8 *)v14 + 24);
  dispatch_release(v5);
  _Block_object_dispose(&v13, 8);
  return v8;
}

void __copy_helper_block_8_56c14_ZTS9Semaphore(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(dispatch_object_s **)(a2 + 56);
  *(void *)(a1 + 56) = v2;
  *(_BYTE *)(a1 + 64) = 1;
  dispatch_retain(v2);
}

void __destroy_helper_block_8_56c14_ZTS9Semaphore(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64)) {
    dispatch_release(*(dispatch_object_t *)(a1 + 56));
  }
}

uint64_t _AppleIDUpdateLinkedIdentityProvisioningWithBlock( uint64_t a1, uint64_t a2, dispatch_queue_s *a3, uint64_t a4)
{
  uint64_t v7 = (os_log_s *)AppleIDGetLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( &dword_183E58000,  v7,  OS_LOG_TYPE_DEFAULT,  "UpdateLinkedIdentityProvisioning: Executing from framework\n",  buf,  2u);
  }

  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 0x40000000LL;
  _OWORD v9[2] = ___AppleIDUpdateLinkedIdentityProvisioningWithBlock_block_invoke;
  v9[3] = &unk_189D7A560;
  void v9[4] = a4;
  v9[5] = a1;
  dispatch_async(a3, v9);
  return 1LL;
}

uint64_t _AppleIDUpdateLinkedIdentityProvisioning(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = 0LL;
  char v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  char v16 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v6 = (dispatch_queue_s *)getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 1174405120LL;
  v10[2] = ___AppleIDUpdateLinkedIdentityProvisioning_block_invoke;
  v10[3] = &unk_189D7A588;
  void v10[4] = &v13;
  void v10[5] = a3;
  dispatch_object_t object = v5;
  char v12 = 1;
  dispatch_retain(v5);
  _AppleIDUpdateLinkedIdentityProvisioningWithBlock(a1, v7, v6, (uint64_t)v10);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v12) {
    dispatch_release(object);
  }
  uint64_t v8 = *((unsigned __int8 *)v14 + 24);
  dispatch_release(v5);
  _Block_object_dispose(&v13, 8);
  return v8;
}

dispatch_queue_t ___ZL27getAppleIDAuthDispatchQueuev_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("AppleIDAuthDispatchQueue", 0LL);
  getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue = (uint64_t)result;
  return result;
}

uint64_t initSFAppleIDClientCopyMyAppleID(uint64_t a1, uint64_t a2)
{
  dispatch_semaphore_t v4 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    dispatch_semaphore_t v4 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v4;
  }

  softLinkSFAppleIDClientCopyMyAppleID[0] = (uint64_t (*)())dlsym(v4, "SFAppleIDClientCopyMyAppleID");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkSFAppleIDClientCopyMyAppleID[0])(a1, a2);
}

uint64_t initSFAppleIDClientCopyCertificateInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    uint64_t v6 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v6;
  }

  softLinkSFAppleIDClientCopyCertificateInfo = (uint64_t (*)())dlsym(v6, "SFAppleIDClientCopyCertificateInfo");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkSFAppleIDClientCopyCertificateInfo)(a1, a2, a3);
}

uint64_t initSFAppleIDClientCopyPersonInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    uint64_t v6 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v6;
  }

  softLinkSFAppleIDClientCopyPersonInfo = (uint64_t (*)())dlsym(v6, "SFAppleIDClientCopyPersonInfo");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkSFAppleIDClientCopyPersonInfo)(a1, a2, a3);
}

uint64_t ___ZL41handleSFAppleIDClientCopyPersonInfoResultPK9__CFArrayiU13block_pointerFvS1_hP9__CFErrorE_block_invoke( uint64_t a1, const __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (Mutable)
  {
    dispatch_semaphore_t v5 = Mutable;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (a2 && (!TypeID || CFGetTypeID(a2) == TypeID))
    {
      uint64_t v7 = (const void *)getkSFAppleIDClientPersonInfoAccountIdentifierCFKey[0]();
      if (v7)
      {
        Value = CFDictionaryGetValue(a2, v7);
        CFTypeID v9 = CFStringGetTypeID();
        if (Value && (!v9 || CFGetTypeID(Value) == v9)) {
          CFDictionaryAddValue(v5, @"certCN", Value);
        }
      }

      else
      {
        CFStringGetTypeID();
      }

      uint64_t v10 = (const void *)getkSFAppleIDClientPersonInfoMatchedValueCFKey[0]();
      if (v10)
      {
        CFTypeID v11 = CFDictionaryGetValue(a2, v10);
        CFTypeID v12 = CFStringGetTypeID();
        if (v11 && (!v12 || CFGetTypeID(v11) == v12)) {
          CFDictionaryAddValue(v5, @"value", v11);
        }
      }

      else
      {
        CFStringGetTypeID();
      }
    }

    if (CFDictionaryGetCount(v5)) {
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v5);
    }
    CFRelease(v5);
  }

  return 1LL;
}

uint64_t initkSFAppleIDClientPersonInfoAccountIdentifierCFKey(void)
{
  dispatch_queue_t v0 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    dispatch_queue_t v0 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }

  uint64_t result = *(void *)dlsym(v0, "kSFAppleIDClientPersonInfoAccountIdentifierCFKey");
  constantkSFAppleIDClientPersonInfoAccountIdentifierCFKey = result;
  getkSFAppleIDClientPersonInfoAccountIdentifierCFKey[0] = kSFAppleIDClientPersonInfoAccountIdentifierCFKeyFunction;
  return result;
}

uint64_t kSFAppleIDClientPersonInfoAccountIdentifierCFKeyFunction(void)
{
  return constantkSFAppleIDClientPersonInfoAccountIdentifierCFKey;
}

uint64_t initkSFAppleIDClientPersonInfoMatchedValueCFKey(void)
{
  dispatch_queue_t v0 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    dispatch_queue_t v0 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }

  uint64_t result = *(void *)dlsym(v0, "kSFAppleIDClientPersonInfoMatchedValueCFKey");
  constantkSFAppleIDClientPersonInfoMatchedValueCFKey = result;
  getkSFAppleIDClientPersonInfoMatchedValueCFKey[0] = kSFAppleIDClientPersonInfoMatchedValueCFKeyFunction;
  return result;
}

uint64_t kSFAppleIDClientPersonInfoMatchedValueCFKeyFunction(void)
{
  return constantkSFAppleIDClientPersonInfoMatchedValueCFKey;
}

uint64_t ___ZL41__AppleIDCopySecIdentityForAppleIDAccountPK10__CFStringPK14__CFDictionaryPP9__CFError_block_invoke( void *a1, uint64_t a2, int a3)
{
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = a2;
  uint64_t v4 = a1[5];
  dispatch_semaphore_t v3 = (dispatch_semaphore_s *)a1[6];
  *(_DWORD *)(*(void *)(v4 + 8) + 24LL) = a3;
  return dispatch_semaphore_signal(v3);
}

uint64_t initSFAppleIDClientCopyIdentity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    uint64_t v6 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v6;
  }

  softLinkSFAppleIDClientCopyIdentity = (uint64_t (*)())dlsym(v6, "SFAppleIDClientCopyIdentity");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkSFAppleIDClientCopyIdentity)(a1, a2, a3);
}

uint64_t initSFAppleIDClientCopyMyAccountInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    uint64_t v4 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v4;
  }

  softLinkSFAppleIDClientCopyMyAccountInfo[0] = (uint64_t (*)())dlsym(v4, "SFAppleIDClientCopyMyAccountInfo");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkSFAppleIDClientCopyMyAccountInfo[0])(a1, a2);
}

uint64_t initkSFAppleIDClientAccountInfoAppleIDCFKey(void)
{
  dispatch_queue_t v0 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    dispatch_queue_t v0 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }

  uint64_t result = *(void *)dlsym(v0, "kSFAppleIDClientAccountInfoAppleIDCFKey");
  constantkSFAppleIDClientAccountInfoAppleIDCFKey = result;
  getkSFAppleIDClientAccountInfoAppleIDCFKey = kSFAppleIDClientAccountInfoAppleIDCFKeyFunction;
  return result;
}

uint64_t kSFAppleIDClientAccountInfoAppleIDCFKeyFunction(void)
{
  return constantkSFAppleIDClientAccountInfoAppleIDCFKey;
}

uint64_t AppleIDGetLogHandle()
{
  if (AppleIDGetLogHandle::sOnce != -1) {
    dispatch_once(&AppleIDGetLogHandle::sOnce, &__block_literal_global_78);
  }
  return AppleIDGetLogHandle::sHandle;
}

void __AppleIDGetLogHandle_block_invoke()
{
  AppleIDGetLogHandle::sHandle = (uint64_t)os_log_create("com.apple.AppleIDAuth", "core");
  if (!AppleIDGetLogHandle::sHandle)
  {
    uint64_t v0 = MEMORY[0x1895F8DA0];
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v1 = 0;
      _os_log_impl( &dword_183E58000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "### AppleIDAuth create log handle failed\n",  v1,  2u);
    }

    AppleIDGetLogHandle::sHandle = v0;
  }

CFArrayRef CFArrayApplyBlock(const __CFArray *result, uint64_t a2)
{
  if (result)
  {
    dispatch_semaphore_t v3 = result;
    CFIndex Count = CFArrayGetCount(result);
    CFIndex v5 = Count - 1;
    if (Count < 1)
    {
      return 0LL;
    }

    else
    {
      CFIndex v6 = 0LL;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, v6);
        uint64_t result = (const __CFArray *)(*(uint64_t (**)(uint64_t, const void *))(a2 + 16))(a2, ValueAtIndex);
        if ((_DWORD)result) {
          BOOL v8 = v5 == v6;
        }
        else {
          BOOL v8 = 1;
        }
        ++v6;
      }

      while (!v8);
    }
  }

  return result;
}

uint64_t CFDictionaryApplyBlock(const __CFDictionary *a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  if (a1 && a2)
  {
    CFIndex Count = CFDictionaryGetCount(a1);
    CFIndex v6 = Count - 1;
    if (Count < 1)
    {
      return 0LL;
    }

    else
    {
      unint64_t v7 = Count;
      Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a1);
      keys = 0LL;
      CFIndex v19 = 0LL;
      uint64_t v20 = 0LL;
      std::vector<LSRecord * {__weak}>::__vallocate[abi:nn180100](&keys, v7);
      CFTypeID v9 = (char *)v19;
      bzero(v19, 8 * v7);
      CFIndex v19 = &v9[8 * v7];
      values = 0LL;
      char v16 = 0LL;
      uint64_t v17 = 0LL;
      std::vector<LSRecord * {__weak}>::__vallocate[abi:nn180100](&values, v7);
      uint64_t v10 = (char *)v16;
      bzero(v16, 8 * v7);
      char v16 = &v10[8 * v7];
      CFDictionaryGetKeysAndValues(Copy, (const void **)keys, (const void **)values);
      uint64_t v11 = 0LL;
      do
      {
        uint64_t v12 = (*(uint64_t (**)(uint64_t, void *, void *))(a2 + 16))(a2, keys[v11], values[v11]);
        if ((_DWORD)v12) {
          BOOL v13 = v6 == v11;
        }
        else {
          BOOL v13 = 1;
        }
        ++v11;
      }

      while (!v13);
      uint64_t v2 = v12;
      CFRelease(Copy);
      if (values)
      {
        char v16 = values;
        operator delete(values);
      }

      if (keys)
      {
        CFIndex v19 = keys;
        operator delete(keys);
      }
    }
  }

  return v2;
}

CFErrorRef _CFErrorCreateCSIdentityErrorWithInfo( CFIndex a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFDictionary *a5, const char *a6, const char *a7, unsigned int a8)
{
  uint64_t v15 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (a6) {
    char v16 = a6;
  }
  else {
    char v16 = "-";
  }
  CFStringRef v17 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], v16, 0x8000100u);
  if (a7) {
    char v18 = a7;
  }
  else {
    char v18 = "-";
  }
  CFStringRef v19 = CFStringCreateWithCString(v15, v18, 0x8000100u);
  uint64_t valuePtr = a8;
  CFNumberRef v20 = CFNumberCreate(v15, kCFNumberLongLongType, &valuePtr);
  if (a5) {
    MutableCopy = CFDictionaryCreateMutableCopy(v15, 0LL, a5);
  }
  else {
    MutableCopy = CFDictionaryCreateMutable(v15, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  }
  unint64_t v22 = MutableCopy;
  CFRange v23 = (const void *)*MEMORY[0x189604F70];
  if (MutableCopy) {
    BOOL v24 = a2 == 0LL;
  }
  else {
    BOOL v24 = 1;
  }
  if (!v24 && v23 != 0LL) {
    CFDictionaryAddValue(MutableCopy, v23, a2);
  }
  uint64_t v26 = (const void *)*MEMORY[0x189604F68];
  if (v22) {
    BOOL v27 = a3 == 0LL;
  }
  else {
    BOOL v27 = 1;
  }
  if (!v27 && v26 != 0LL) {
    CFDictionaryAddValue(v22, v26, a3);
  }
  uint64_t v29 = (const void *)*MEMORY[0x189604F78];
  if (v22) {
    BOOL v30 = a4 == 0LL;
  }
  else {
    BOOL v30 = 1;
  }
  if (!v30 && v29 != 0LL) {
    CFDictionaryAddValue(v22, v29, a4);
  }
  if (v17 && v22) {
    CFDictionaryAddValue(v22, @"function", v17);
  }
  if (v19 && v22) {
    CFDictionaryAddValue(v22, @"file", v19);
  }
  if (v20 && v22)
  {
    CFDictionaryAddValue(v22, @"line", v20);
    CFErrorRef v32 = CFErrorCreate(v15, @"CSIdentityErrorDomain", a1, v22);
  }

  else
  {
    CFErrorRef v32 = CFErrorCreate(v15, @"CSIdentityErrorDomain", a1, v22);
    if (!v22) {
      goto LABEL_45;
    }
  }

  CFRelease(v22);
LABEL_45:
  if (v20) {
    CFRelease(v20);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v17) {
    CFRelease(v17);
  }
  return v32;
}

uint64_t _CSLinkCurrentUserToAppleIDWithVerifiedAccountIdentifier()
{
  return 1LL;
}

void _CSAddAppleIDAccountUsingCompletionBlock(uint64_t a1, uint64_t a2, dispatch_queue_s *a3, uint64_t a4)
{
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 0x40000000LL;
  v6[2] = ___CSAddAppleIDAccountUsingCompletionBlock_block_invoke;
  v6[3] = &unk_189D7A7A0;
  v6[4] = a4;
  if (!_AppleIDAuthenticationAddAppleIDWithBlock(a1, a2, 0LL, a3, (uint64_t)v6))
  {
    CFErrorRef v5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], @"CSIdentityErrorDomain", -99LL, 0LL);
    (*(void (**)(uint64_t, CFErrorRef))(a4 + 16))(a4, v5);
    if (v5) {
      CFRelease(v5);
    }
  }

uint64_t _CSAddAppleIDAccount(CFTypeRef cf, CFTypeRef a2)
{
  if (cf) {
    CFRetain(cf);
  }
  if (a2) {
    CFRetain(a2);
  }
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 0x40000000LL;
  v6[2] = ___CSAddAppleIDAccount_block_invoke;
  v6[3] = &__block_descriptor_tmp_55;
  v6[4] = cf;
  void v6[5] = a2;
  dispatch_async(global_queue, v6);
  return 1LL;
}

uint64_t _CSUnlinkCurrentUserFromAppleID()
{
  return 1LL;
}

uint64_t _CSRemoveAppleIDAccount(uint64_t a1, uint64_t a2)
{
  return _AppleIDAuthenticationForgetAppleID(a1, 0LL, a2);
}

uint64_t _CSCopyAppleIDAccounts()
{
  return _AppleIDAuthenticationCopyAppleIDs(0LL, 0LL);
}

const void *_CSCopyAccountStatusForAppleID(const __CFString *a1, CFErrorRef *a2)
{
  if (!_AppleIDAuthenticationCopyStatus(0LL, (uint64_t)&theDict, (uint64_t)a2))
  {
    uint64_t v10 = 0LL;
    if (!a2) {
      return v10;
    }
    goto LABEL_13;
  }

  Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"AccountStatuses");
  if (Value
    && (CFErrorRef v5 = Value, (MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, a1)) != 0LL))
  {
    unint64_t v7 = MutableCopy;
    System = CFLocaleGetSystem();
    CFStringLowercase(v7, System);
    CFTypeID v9 = CFDictionaryGetValue(v5, v7);
    uint64_t v10 = v9;
    if (v9)
    {
      CFRetain(v9);
    }

    else if (a2)
    {
      *a2 = _CFErrorCreateCSIdentityErrorWithInfo( -115LL,  @"The requested account does not exist",  0LL,  0LL,  0LL,  "_CSCopyAccountStatusForAppleID",  "/Library/Caches/com.apple.xbs/Sources/CoreServices/OSServices.subprj/IdentityServices/CSAuthenticationSupportPriv.cp",  0xD8u);
    }

    CFRelease(v7);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  CFRelease(theDict);
  if (a2)
  {
LABEL_13:
    if (!v10 && !*a2) {
      *a2 = _CFErrorCreateCSIdentityErrorWithInfo( -115LL,  @"The requested account does not exist",  0LL,  0LL,  0LL,  "_CSCopyAccountStatusForAppleID",  "/Library/Caches/com.apple.xbs/Sources/CoreServices/OSServices.subprj/IdentityServices/CSAuthenticationSupportPriv.cp",  0xE0u);
    }
  }

  return v10;
}

AppleIDIdentityAuthority *_CSCreateAppleIDIdentityWithNameAndAccountIdentifier( Identity *a1, const __CFString *a2, const __CFString *a3)
{
  if (!a3) {
    return 0LL;
  }
  unint64_t v6 = Identity::Class(a1);
  uint64_t result = (AppleIDIdentityAuthority *)CFObject::Allocate((CFObject *)0x30, v6, a1, v7);
  if (result)
  {
    CFTypeID v9 = result;
    uint64_t v10 = (AppleIDIdentityAuthority *)AppleIDIdentityAuthority::Authority(result);
    AppleIDIdentity::AppleIDIdentity(v9, a2, a3, v10);
    return (AppleIDIdentity *)((char *)v9 - 16);
  }

  return result;
}

CFStringRef _CSCreateAppleIDIdentityWithCertificate( AppleIDIdentityAuthority *a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = AppleIDIdentityAuthority::Authority(a1);
  uint64_t result = (const __CFString *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v9 + 152LL))( v9,  a2,  a5);
  if (result)
  {
    uint64_t v11 = result;
    uint64_t v12 = _CSCreateAppleIDIdentityWithNameAndAccountIdentifier(a1, a3, result);
    CFRelease(v11);
    return (const __CFString *)v12;
  }

  return result;
}

uint64_t _CSCopyAccountIdentifierForAppleIDCertificate(AppleIDIdentityAuthority *a1, uint64_t a2)
{
  uint64_t v4 = AppleIDIdentityAuthority::Authority(a1);
  return (*(uint64_t (**)(uint64_t, AppleIDIdentityAuthority *, uint64_t))(*(void *)v4 + 152LL))(v4, a1, a2);
}

CFStringRef _CSCreateAppleIDIdentityWithCertificateChain( AppleIDIdentityAuthority *a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = AppleIDIdentityAuthority::Authority(a1);
  uint64_t result = (const __CFString *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v9 + 160LL))( v9,  a2,  a5);
  if (result)
  {
    uint64_t v11 = result;
    uint64_t v12 = _CSCreateAppleIDIdentityWithNameAndAccountIdentifier(a1, a3, result);
    CFRelease(v11);
    return (const __CFString *)v12;
  }

  return result;
}

uint64_t _CSCopyAccountIdentifierForAppleIDCertificateChain(AppleIDIdentityAuthority *a1, uint64_t a2)
{
  uint64_t v4 = AppleIDIdentityAuthority::Authority(a1);
  return (*(uint64_t (**)(uint64_t, AppleIDIdentityAuthority *, uint64_t))(*(void *)v4 + 160LL))(v4, a1, a2);
}

uint64_t _CSCopySecIdentityForAppleID(uint64_t a1, CFErrorRef *a2)
{
  return _AppleIDCopySecIdentityForAppleIDAccount(a1, 0LL, a2);
}

const void *_CSCopyAppleIDAccountForAppleIDCertificate(AppleIDIdentityAuthority *a1, uint64_t a2)
{
  uint64_t v4 = AppleIDIdentityAuthority::Authority(a1);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, AppleIDIdentityAuthority *, uint64_t))(*(void *)v4 + 152LL))(v4, a1, a2);
  if (!v5) {
    return 0LL;
  }
  unint64_t v6 = (const __CFString *)v5;
  unint64_t v7 = (const __CFArray *)_AppleIDAuthenticationCopyAppleIDs(0LL, a2);
  if (v7)
  {
    BOOL v8 = v7;
    CFIndex Count = CFArrayGetCount(v7);
    if (Count < 1) {
      goto LABEL_20;
    }
    CFIndex v10 = Count;
    uint64_t v11 = 1LL;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v8, v11 - 1);
      BOOL v13 = (const __CFDictionary *)_AppleIDAuthenticationCopyCertificateInfo((uint64_t)ValueAtIndex, 0LL, 0LL, a2);
      if (v13)
      {
        char v14 = v13;
        Value = (const __CFString *)CFDictionaryGetValue(v13, @"encDsId");
        if (Value)
        {
          v20.length = CFStringGetLength(v6);
          v20.id location = 0LL;
          int v16 = CFStringFindWithOptions(v6, Value, v20, 5uLL, &v19);
          LODWORD(Value) = 0;
          if (v16)
          {
            if (v19.location >= 1)
            {
              if (CFStringGetCharacterAtIndex(v6, v19.location - 1) == 46)
              {
                CFIndex Length = CFStringGetLength(v6);
                LODWORD(Value) = Length == v19.length + v19.location;
              }

              else
              {
                LODWORD(Value) = 0;
              }
            }
          }
        }

        CFRelease(v14);
      }

      else
      {
        LODWORD(Value) = 0;
      }

      if (v11 >= v10) {
        break;
      }
      ++v11;
    }

    while (!(_DWORD)Value);
    if ((_DWORD)Value) {
      CFRetain(ValueAtIndex);
    }
    else {
LABEL_20:
    }
      ValueAtIndex = 0LL;
    CFRelease(v8);
  }

  else
  {
    ValueAtIndex = 0LL;
  }

  CFRelease(v6);
  return ValueAtIndex;
}

CFArrayRef _CSCopyDefaultSharingSecIdentities(const void *a1)
{
  uint64_t v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (!a1 || (uint64_t v4 = (const void *)_CSGetAppleIDIdentityAuthority(), CFEqual(a1, v4)))
  {
    uint64_t v5 = (const __CFArray *)_AppleIDAuthenticationCopyAppleIDs(0LL, 0LL);
    if (v5)
    {
      unint64_t v6 = v5;
      if (CFArrayGetCount(v5) >= 1)
      {
        CFIndex v7 = 0LL;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v6, v7);
          CFTypeID TypeID = CFStringGetTypeID();
          if (ValueAtIndex && (!TypeID || CFGetTypeID(ValueAtIndex) == TypeID))
          {
            CFIndex v10 = (const void *)_AppleIDCopySecIdentityForAppleIDAccount((uint64_t)ValueAtIndex, 0LL, 0LL);
            if (v10)
            {
              uint64_t v11 = v10;
              CFArrayAppendValue(Mutable, v10);
              CFRelease(v11);
            }
          }

          ++v7;
        }

        while (v7 < CFArrayGetCount(v6));
      }

      CFRelease(v6);
    }
  }

  if (!Mutable) {
    return 0LL;
  }
  if (CFArrayGetCount(Mutable) < 1) {
    CFArrayRef Copy = 0LL;
  }
  else {
    CFArrayRef Copy = CFArrayCreateCopy(v2, Mutable);
  }
  CFRelease(Mutable);
  return Copy;
}

void AppleIDIdentity::AppleIDIdentity( AppleIDIdentity *this, const __CFString *a2, const __CFString *a3, AppleIDIdentityAuthority *a4)
{
  void *v8 = off_189D7A7F8;
  v8[3] = a4;
  uint64_t v9 = v8 - 2;
  CFIndex v10 = CFGetAllocator(v8 - 2);
  *((void *)this + 4) = CFStringCreateCopy(v10, a2);
  uint64_t v11 = CFGetAllocator(v9);
  *((void *)this + 5) = CFStringCreateCopy(v11, a3);
  CFRetain((CFTypeRef)(*((void *)this + 3) - 16LL));
}

void AppleIDIdentity::AppleIDIdentity(AppleIDIdentity *this, const AppleIDIdentity *a2)
{
  void *v4 = off_189D7A7F8;
  v4[3] = *((void *)a2 + 3);
  uint64_t v5 = v4 - 2;
  unint64_t v6 = CFGetAllocator(v4 - 2);
  CFIndex v7 = (const __CFString *)(*(uint64_t (**)(const AppleIDIdentity *))(*(void *)a2 + 48LL))(a2);
  *((void *)this + 4) = CFStringCreateCopy(v6, v7);
  BOOL v8 = CFGetAllocator(v5);
  uint64_t v9 = (const __CFString *)(*(uint64_t (**)(const AppleIDIdentity *))(*(void *)a2 + 64LL))(a2);
  *((void *)this + 5) = CFStringCreateCopy(v8, v9);
  CFRetain((CFTypeRef)(*((void *)this + 3) - 16LL));
}

void AppleIDIdentity::~AppleIDIdentity(AppleIDIdentity *this)
{
  *(void *)this = off_189D7A7F8;
  CFRelease((CFTypeRef)(*((void *)this + 3) - 16LL));
  CFRelease(*((CFTypeRef *)this + 4));
  CFRelease(*((CFTypeRef *)this + 5));
  _LSBundleDisplayNameContextEnumerate(this, v2, v3, v4, v5);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  AppleIDIdentity::~AppleIDIdentity(this);
  _LSBundleDisplayNameContextEnumerate(v1, v2, v3, v4, v5);
}

void AppleIDIdentity::createCopy(AppleIDIdentity *this, const __CFAllocator *a2)
{
  unint64_t v4 = Identity::Class(this);
  unint64_t v6 = (AppleIDIdentity *)CFObject::Allocate((CFObject *)0x30, v4, a2, v5);
  if (v6) {
    AppleIDIdentity::AppleIDIdentity(v6, this);
  }
}

uint64_t AppleIDIdentity::copyPrincipalName(AppleIDIdentity *this)
{
  uint64_t v2 = (*(uint64_t (**)(AppleIDIdentity *))(*(void *)this + 72LL))(this);
  return (*(uint64_t (**)(uint64_t, void, void))(*(void *)v2 + 128LL))( v2,  *((void *)this + 5),  *((void *)this + 4));
}

uint64_t AppleIDIdentity::copyTrustSubjectDistinguishedName(AppleIDIdentity *this)
{
  uint64_t v2 = (*(uint64_t (**)(AppleIDIdentity *))(*(void *)this + 72LL))(this);
  return (*(uint64_t (**)(uint64_t, void, void))(*(void *)v2 + 136LL))( v2,  *((void *)this + 5),  *((void *)this + 4));
}

uint64_t AppleIDIdentity::authenticateCertificateChain( AppleIDIdentity *this, const __CFArray *a2, __CFError **a3)
{
  CFTypeRef cf = 0LL;
  uint64_t v5 = (*(uint64_t (**)(void, const __CFArray *, CFTypeRef *))(**((void **)this + 3) + 160LL))( *((void *)this + 3),  a2,  &cf);
  if (v5)
  {
    unint64_t v6 = (const void *)v5;
    CFIndex v7 = (const void *)(*(uint64_t (**)(AppleIDIdentity *))(*(void *)this + 64LL))(this);
    if (CFEqual(v7, v6))
    {
      CFRelease(v6);
      return 1LL;
    }

    syslog(4, "Identity posixName doesn't match accountIdentifier from certificate");
    CFRelease(v6);
  }

  uint64_t v9 = (__CFError *)cf;
  if (!cf)
  {
    if (!a3) {
      return 0LL;
    }
    uint64_t v9 = CSCreateIdentityError(@"CSIdentityErrorDomain", -101LL);
LABEL_10:
    uint64_t result = 0LL;
    *a3 = v9;
    return result;
  }

  if (a3) {
    goto LABEL_10;
  }
  CFRelease(cf);
  return 0LL;
}

BOOL AppleIDIdentity::authenticatePassword(AppleIDIdentity *this, const __CFString *a2, __CFError **a3)
{
  return _AppleIDAuthenticatePassword(*((void *)this + 4), (uint64_t)a2, 0LL, (uint64_t)a3) != 0;
}

uint64_t AppleIDIdentity::fullName(AppleIDIdentity *this)
{
  return *((void *)this + 4);
}

uint64_t AppleIDIdentity::posixName(AppleIDIdentity *this)
{
  return *((void *)this + 5);
}

uint64_t AppleIDIdentity::authority(AppleIDIdentity *this)
{
  return *((void *)this + 3);
}

uint64_t Identity::needsCommit(Identity *this)
{
  return 0LL;
}

uint64_t Identity::uuid(Identity *this)
{
  return 0LL;
}

uint64_t Identity::posixID(Identity *this)
{
  return 0xFFFFFFFFLL;
}

uint64_t Identity::emailAddress(Identity *this)
{
  return 0LL;
}

uint64_t Identity::imageURL(Identity *this)
{
  return 0LL;
}

uint64_t Identity::imageData(Identity *this)
{
  return 0LL;
}

uint64_t Identity::imageDataType(Identity *this)
{
  return 0LL;
}

uint64_t Identity::aliases(Identity *this)
{
  return 0LL;
}

CFArrayRef Identity::copyLinkedIdentityAuthorities(Identity *this)
{
  id v1 = CFGetAllocator((char *)this - 16);
  return CFArrayCreate(v1, 0LL, 0LL, 0LL);
}

CFArrayRef Identity::copyLinkedIdentityNamesWithAuthority(uint64_t a1)
{
  id v1 = CFGetAllocator((CFTypeRef)(a1 - 16));
  return CFArrayCreate(v1, 0LL, 0LL, 0LL);
}

uint64_t Identity::allowsPasswordResetWithAuthority()
{
  return 0LL;
}

uint64_t Identity::loginShellURL(Identity *this)
{
  return 0LL;
}

uint64_t Identity::homeDirectoryURL(Identity *this)
{
  return 0LL;
}

uint64_t Identity::certificate(Identity *this)
{
  return 0LL;
}

uint64_t Identity::createGroupMembershipQuery(Identity *this, const __CFAllocator *a2)
{
  return 0LL;
}

uint64_t AppleIDIdentity::isMemberOfGroup(AppleIDIdentity *this, Identity *a2)
{
  return 0LL;
}

uint64_t AppleIDIdentity::commit(AppleIDIdentity *this, void *a2, __CFError **a3)
{
  if (a3) {
    *a3 = CSCreateIdentityError(@"CSIdentityErrorDomain", -2LL);
  }
  return 0LL;
}

uint64_t AppleIDIdentity::commitAsync()
{
  return 0LL;
}

uint64_t Identity::updateLinkedIdentityProvisioning(Identity *this, void *a2, __CFError **a3)
{
  return 1LL;
}

uint64_t AppleIDIdentityAuthority::InitializeAuthority(AppleIDIdentityAuthority *this)
{
  id v1 = (const CFClass *)*MEMORY[0x189604DB0];
  unint64_t v2 = IdentityAuthority::Class(this);
  unint64_t v4 = (IdentityAuthority *)CFObject::Allocate((CFObject *)0x18, v2, v1, v3);
  IdentityAuthority::IdentityAuthority(v4, @"appleid.apple.com", @"Apple Account");
  *(void *)uint64_t v5 = off_189D7A9A8;
  AppleIDIdentityAuthority::authority = (uint64_t)v5;
  return IdentityAuthority::RegisterAuthority(v5, v6);
}

uint64_t AppleIDIdentityAuthority::Authority(AppleIDIdentityAuthority *this)
{
  return AppleIDIdentityAuthority::authority;
}

BOOL AppleIDIdentityAuthority::authenticateNameAndPassword( AppleIDIdentityAuthority *this, const __CFString *a2, const __CFString *a3, __CFError **a4)
{
  return _AppleIDAuthenticatePassword((uint64_t)a2, (uint64_t)a3, 0LL, (uint64_t)a4) == 1;
}

uint64_t AppleIDIdentityAuthority::copyAccountIdentifierForCertificate( AppleIDIdentityAuthority *this, __SecCertificate *a2, __CFError **a3)
{
  values = a2;
  CFArrayRef v5 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const void **)&values, 1LL, MEMORY[0x189605228]);
  uint64_t v6 = (*(uint64_t (**)(AppleIDIdentityAuthority *, CFArrayRef, __CFError **))(*(void *)this + 160LL))( this,  v5,  a3);
  CFRelease(v5);
  return v6;
}

const __CFString *AppleIDIdentityAuthority::copyAccountIdentifierForCertificateChain( AppleIDIdentityAuthority *this, const __CFArray *a2, __CFError **a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  SecTrustRef trust = 0LL;
  unsigned int v23 = 0;
  AppleIDAuthorityPolicy = (const void *)SecPolicyCreateAppleIDAuthorityPolicy();
  if (!AppleIDAuthorityPolicy)
  {
    uint64_t v11 = 0LL;
    CFIndex v12 = 14LL;
    goto LABEL_9;
  }

  OSStatus v6 = SecTrustCreateWithCertificates(a2, AppleIDAuthorityPolicy, &trust);
  if (v6)
  {
    LODWORD(v12) = v6;
    CFIndex v21 = (os_log_s *)AppleIDGetLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      CFIndex v12 = (int)v12;
      *(_DWORD *)__int128 buf = 134217984;
      uint64_t v26 = (int)v12;
      unint64_t v22 = "### SecTrustCreateWithCertificates failed with error %ld";
LABEL_43:
      _os_log_impl(&dword_183E58000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
LABEL_45:
      uint64_t v11 = (const __CFString *)*MEMORY[0x189604F50];
      goto LABEL_9;
    }

LABEL_44:
    CFIndex v12 = (int)v12;
    goto LABEL_45;
  }

  int v7 = MEMORY[0x186E29690](trust, &v23);
  if (v7)
  {
    LODWORD(v12) = v7;
    CFIndex v21 = (os_log_s *)AppleIDGetLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      CFIndex v12 = (int)v12;
      *(_DWORD *)__int128 buf = 134217984;
      uint64_t v26 = (int)v12;
      unint64_t v22 = "### SecTrustEvaluate failed with error %ld";
      goto LABEL_43;
    }

    goto LABEL_44;
  }

  char v8 = 0;
  uint64_t v9 = 0LL;
  if (v23 == 1 || v23 == 4) {
    goto LABEL_13;
  }
  CFIndex v10 = (os_log_s *)AppleIDGetLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__int128 buf = 134217984;
    uint64_t v26 = v23;
    _os_log_impl(&dword_183E58000, v10, OS_LOG_TYPE_ERROR, "### Invalid trust result %ld", buf, 0xCu);
  }

  uint64_t v11 = @"CSIdentityErrorDomain";
  CFIndex v12 = 15LL;
LABEL_9:
  if (v11) {
    BOOL v13 = v11;
  }
  else {
    BOOL v13 = @"CSIdentityErrorDomain";
  }
  uint64_t v9 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v13, v12, 0LL);
  char v8 = 1;
LABEL_13:
  if (trust) {
    CFRelease(trust);
  }
  if (AppleIDAuthorityPolicy) {
    CFRelease(AppleIDAuthorityPolicy);
  }
  if ((v8 & 1) == 0)
  {
    CFArrayGetValueAtIndex(a2, 0LL);
    char v14 = (const __CFArray *)SecCertificateCopyCommonNames();
    if (v14)
    {
      uint64_t v15 = v14;
      if (CFArrayGetCount(v14) >= 1
        && (ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v15, 0LL)) != 0LL)
      {
        CFStringRef v17 = ValueAtIndex;
        CFRetain(ValueAtIndex);
        CFRelease(v15);
        CFIndex Length = CFStringGetLength(v17);
        if (Length > 69)
        {
          if (CFStringHasPrefix(v17, @"com.apple.idms.appleid.")) {
            goto LABEL_35;
          }
          syslog(3, "Invalid AppleID account identifier prefix");
          CFIndex v19 = -13LL;
        }

        else
        {
          syslog(3, "Invalid AppleID account identifier lenth %d", Length);
          CFIndex v19 = -12LL;
        }

        uint64_t v15 = v17;
      }

      else
      {
        CFIndex v19 = -10LL;
      }

      CFRelease(v15);
    }

    else
    {
      CFIndex v19 = -10LL;
    }

    uint64_t v9 = CSCreateIdentityError(@"CSIdentityErrorDomain", v19);
  }

  if (a3)
  {
    if (!v9) {
      uint64_t v9 = CSCreateIdentityError(@"CSIdentityErrorDomain", -100LL);
    }
    CFStringRef v17 = 0LL;
    *a3 = v9;
    return v17;
  }

  CFStringRef v17 = 0LL;
LABEL_35:
  if (v9) {
    CFRelease(v9);
  }
  return v17;
}

CFArrayRef AppleIDIdentityAuthority::copyCertificateIssuerNames(AppleIDIdentityAuthority *this)
{
  values = @"Apple Application Integration Certification Authority";
  id v1 = CFGetAllocator((char *)this - 16);
  return CFArrayCreate(v1, (const void **)&values, 1LL, MEMORY[0x189605228]);
}

CFStringRef AppleIDIdentityAuthority::copyPrincipalForCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0LL;
  }
  unint64_t v4 = CFGetAllocator((CFTypeRef)(a1 - 16));
  return CFStringCreateCopy(v4, *(CFStringRef *)(a3 + 16));
}

AppleIDIdentityQuery *AppleIDIdentityAuthority::createQueryWithName( AppleIDIdentityAuthority *this, const __CFAllocator *a2, const __CFString *a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0LL;
  if (a4 == 1 && a5 == 1)
  {
    unint64_t v9 = IdentityQuery::Class(0LL);
    uint64_t result = (AppleIDIdentityQuery *)CFObject::Allocate((CFObject *)0x40, v9, a2, v10);
    if (result) {
      return AppleIDIdentityQuery::AppleIDIdentityQuery(result, a3, this);
    }
  }

  return result;
}

AppleIDIdentityQuery *AppleIDIdentityAuthority::createQueryWithProperties( AppleIDIdentityAuthority *this, const __CFAllocator *a2, const void *a3)
{
  unint64_t v6 = IdentityQuery::Class(this);
  uint64_t result = (AppleIDIdentityQuery *)CFObject::Allocate((CFObject *)0x40, v6, a2, v7);
  if (result) {
    return AppleIDIdentityQuery::AppleIDIdentityQuery(result, a3, this);
  }
  return result;
}

CFStringRef AppleIDIdentityAuthority::copyPrincipalForNamePair( AppleIDIdentityAuthority *this, const __CFString *a2, const __CFString *a3)
{
  unint64_t v4 = CFGetAllocator((char *)this - 16);
  return CFStringCreateCopy(v4, a2);
}

CFStringRef AppleIDIdentityAuthority::copyTrustSubjectDistinguishedNameForNamePair( AppleIDIdentityAuthority *this, const __CFString *a2, const __CFString *a3)
{
  unint64_t v4 = CFGetAllocator((char *)this - 16);
  return CFStringCreateWithFormat(v4, 0LL, @"CN=%@", a2);
}

CFStringRef AppleIDIdentityAuthority::copyTrustAnchorDistinguishedName(AppleIDIdentityAuthority *this)
{
  id v1 = CFGetAllocator((char *)this - 16);
  return CFStringCreateCopy(v1, @"CN=Apple Root CA,OU=Apple Certification Authority,O=Apple Inc.,C=US");
}

void AppleIDIdentityAuthority::~AppleIDIdentityAuthority(CFTypeRef *this)
{
}

CFStringRef IdentityAuthority::copyLocalizedName(IdentityAuthority *this)
{
  CFStringRef result = (CFStringRef)*((void *)this + 2);
  if (result)
  {
    uint64_t v3 = CFGetAllocator(result);
    return CFStringCreateCopy(v3, *((CFStringRef *)this + 2));
  }

  return result;
}

uint64_t IdentityAuthority::createIdentity( IdentityAuthority *this, const __CFAllocator *a2, uint64_t a3, const __CFString *a4, const __CFString *a5)
{
  return 0LL;
}

uint64_t IdentityAuthority::createQueryWithClass(IdentityAuthority *this, const __CFAllocator *a2)
{
  return 0LL;
}

uint64_t IdentityAuthority::createQueryWithUUID( IdentityAuthority *this, const __CFAllocator *a2, const __CFUUID *a3)
{
  return 0LL;
}

uint64_t IdentityAuthority::createQueryWithPosixID(IdentityAuthority *this, const __CFAllocator *a2)
{
  return 0LL;
}

void AppleIDIdentityQuery::AppleIDIdentityQuery( AppleIDIdentityQuery *this, __CFString *a2, AppleIDIdentityAuthority *a3)
{
  values = a2;
  *(void *)this = off_189D7AA68;
  *((void *)this + 1) = 0LL;
  *((void *)this + 2) = a3;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((void *)this + 7) = 0LL;
  CFRetain((char *)a3 - 16);
  CFIndex location = CFStringFind(a2, @"@", 0LL).location;
  unint64_t v6 = @"email";
  if (location == -1) {
    unint64_t v6 = @"phone";
  }
  keys = v6;
  int v7 = CFGetAllocator((char *)this - 16);
  CFTypeRef cf = CFArrayCreate(v7, (const void **)&values, 1LL, MEMORY[0x189605228]);
  char v8 = CFGetAllocator((char *)this - 16);
  *((void *)this + 3) = CFDictionaryCreate( v8,  (const void **)&keys,  &cf,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  CFRelease(cf);
}

__CFDictionary *createCriteriaWithNames(const __CFAllocator *a1, const __CFArray *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a1, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFIndex Count = CFArrayGetCount(a2);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    unint64_t v6 = 0LL;
    int v7 = 0LL;
    CFIndex v8 = 0LL;
    unint64_t v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFIndex v10 = (const CFArrayCallBacks *)MEMORY[0x189605228];
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a2, v8);
      if (CFStringFind(ValueAtIndex, @"@", 0LL).location == -1)
      {
        if (v7)
        {
          CFIndex v12 = v7;
        }

        else
        {
          CFIndex v12 = CFArrayCreateMutable(v9, 0LL, v10);
          int v7 = v12;
        }
      }

      else if (v6)
      {
        CFIndex v12 = v6;
      }

      else
      {
        CFIndex v12 = CFArrayCreateMutable(v9, 0LL, v10);
        unint64_t v6 = v12;
      }

      CFArrayAppendValue(v12, ValueAtIndex);
      ++v8;
    }

    while (v5 != v8);
    if (v7)
    {
      CFDictionaryAddValue(Mutable, @"phone", v7);
      CFRelease(v7);
    }

    if (v6)
    {
      CFDictionaryAddValue(Mutable, @"email", v6);
      CFRelease(v6);
    }
  }

  return Mutable;
}

void AppleIDIdentityQuery::AppleIDIdentityQuery( AppleIDIdentityQuery *this, const void *a2, AppleIDIdentityAuthority *a3)
{
  *(void *)this = off_189D7AA68;
  *((void *)this + 1) = 0LL;
  *((void *)this + 2) = a3;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((void *)this + 7) = 0LL;
  CFRetain((char *)a3 - 16);
  CFTypeID v5 = CFGetTypeID(a2);
  if (v5 == CFDictionaryGetTypeID())
  {
    uint64_t valuePtr = 0LL;
    Value = CFDictionaryGetValue((CFDictionaryRef)a2, @"class");
    int v7 = CFDictionaryGetValue((CFDictionaryRef)a2, @"full name");
    BOOL v13 = v7;
    if (Value)
    {
      CFTypeID v8 = CFGetTypeID(Value);
      if (v8 == CFNumberGetTypeID()) {
        CFNumberGetValue((CFNumberRef)Value, kCFNumberLongType, &valuePtr);
      }
    }

    if (v7)
    {
      CFTypeID v9 = CFGetTypeID(v7);
      if (v9 == CFStringGetTypeID() && valuePtr == 1)
      {
        CFIndex v10 = CFGetAllocator((char *)this - 16);
        uint64_t v11 = CFArrayCreate(v10, &v13, 1LL, MEMORY[0x189605228]);
        CFIndex v12 = CFGetAllocator((char *)this - 16);
        *((void *)this + 3) = createCriteriaWithNames(v12, v11);
        CFRelease(v11);
      }
    }
  }

void AppleIDIdentityQuery::~AppleIDIdentityQuery(AppleIDIdentityQuery *this)
{
  *(void *)this = off_189D7AA68;
  CFRelease((CFTypeRef)(*((void *)this + 2) - 16LL));
  unint64_t v6 = (const void *)*((void *)this + 3);
  if (v6)
  {
    CFRelease(v6);
    *((void *)this + 3) = 0LL;
  }

  uint64_t v7 = *((void *)this + 4);
  if (v7)
  {
    (*(void (**)(uint64_t))(*(void *)v7 + 24LL))(v7);
    uint64_t v8 = *((void *)this + 4);
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 8LL))(v8);
    }
    *((void *)this + 4) = 0LL;
  }

  CFTypeID v9 = (const void *)*((void *)this + 5);
  if (v9)
  {
    CFRelease(v9);
    *((void *)this + 5) = 0LL;
  }

  CFIndex v10 = (const void *)*((void *)this + 6);
  if (v10)
  {
    CFRelease(v10);
    *((void *)this + 6) = 0LL;
  }

  uint64_t v11 = (const void *)*((void *)this + 7);
  if (v11)
  {
    CFRelease(v11);
    *((void *)this + 7) = 0LL;
  }

  _LSBundleDisplayNameContextEnumerate(this, v2, v3, v4, v5);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  AppleIDIdentityQuery::~AppleIDIdentityQuery(this);
  _LSBundleDisplayNameContextEnumerate(v1, v2, v3, v4, v5);
}

CFArrayRef AppleIDIdentityQuery::copyResults(AppleIDIdentityQuery *this)
{
  uint64_t v2 = (const void *)*((void *)this + 7);
  if (v2) {
    return (CFArrayRef)CFRetain(v2);
  }
  uint64_t v4 = CFGetAllocator((char *)this - 16);
  return CFArrayCreate(v4, 0LL, 0LL, 0LL);
}

void AppleIDIdentityQuery::processFindPersonResults(AppleIDIdentityQuery *this, CFArrayRef theArray)
{
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0LL;
    CFMutableDictionaryRef Mutable = 0LL;
    CFIndex v21 = this;
    uint64_t v8 = (char *)this - 16;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v6);
      Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"value");
      uint64_t v11 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"certCN");
      if (!v11) {
        uint64_t v11 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"dsId");
      }
      if (Value && v11)
      {
        CFIndex v12 = CFGetAllocator(v8);
        unint64_t v13 = Identity::Class(v12);
        uint64_t v15 = (AppleIDIdentity *)CFObject::Allocate((CFObject *)0x30, v13, v12, v14);
        int v16 = v15;
        if (v15) {
          AppleIDIdentity::AppleIDIdentity(v15, Value, v11, *((AppleIDIdentityAuthority **)v21 + 2));
        }
        if (!Mutable)
        {
          CFStringRef v17 = CFGetAllocator(v8);
          CFMutableDictionaryRef Mutable = CFArrayCreateMutable(v17, 0LL, MEMORY[0x189605228]);
        }

        char v18 = (char *)v16 - 16;
        CFArrayAppendValue(Mutable, v18);
        CFRelease(v18);
      }

      ++v6;
    }

    while (v5 != v6);
    if (Mutable)
    {
      CFIndex v19 = (__CFArray *)*((void *)v21 + 7);
      if (!v19)
      {
        CFRange v20 = CFGetAllocator(v8);
        CFIndex v19 = CFArrayCreateMutable(v20, 0LL, MEMORY[0x189605228]);
        *((void *)v21 + 7) = v19;
      }

      v22.length = CFArrayGetCount(Mutable);
      v22.CFIndex location = 0LL;
      CFArrayAppendArray(v19, Mutable, v22);
      AppleIDIdentityQuery::sendEvent(v21, 2LL, Mutable, 0LL);
      CFRelease(Mutable);
    }
  }

void AppleIDIdentityQuery::sendEvent(AppleIDIdentityQuery *this, uint64_t a2, CFTypeRef cf, CFTypeRef a4)
{
  if (*((void *)this + 4))
  {
    if (cf) {
      CFRetain(cf);
    }
    if (a4) {
      CFRetain(a4);
    }
    CFRetain((char *)this - 16);
    uint64_t v8 = (__CFRunLoop *)*((void *)this + 5);
    CFTypeID v9 = (const void *)*((void *)this + 6);
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 0x40000000LL;
    v10[2] = ___ZN20AppleIDIdentityQuery9sendEventElPK9__CFArrayP9__CFError_block_invoke;
    v10[3] = &__block_descriptor_tmp_4;
    void v10[4] = this;
    void v10[5] = a2;
    void v10[6] = cf;
    void v10[7] = a4;
    CFRunLoopPerformBlock(v8, v9, v10);
    CFRunLoopWakeUp(*((CFRunLoopRef *)this + 5));
  }

void ___ZN20AppleIDIdentityQuery9sendEventElPK9__CFArrayP9__CFError_block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(v2 + 32);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t, void, void, void))(*(void *)v3 + 32LL))( v3,  v2,  a1[5],  a1[6],  a1[7]);
  }
  uint64_t v4 = (const void *)a1[6];
  if (v4) {
    CFRelease(v4);
  }
  CFIndex v5 = (const void *)a1[7];
  if (v5) {
    CFRelease(v5);
  }
  CFRelease((CFTypeRef)(v2 - 16));
}

uint64_t AppleIDIdentityQuery::execute(AppleIDIdentityQuery *this, unint64_t a2, __CFError **a3)
{
  uint64_t v3 = *((void *)this + 1);
  if ((v3 & 0x80000000) != 0) {
    return 0LL;
  }
  *((void *)this + 1) = v3 | 0x80000000LL;
  uint64_t result = _AppleIDAuthenticationFindPerson(*((const __CFDictionary **)this + 3), 0LL, (uint64_t)a3);
  if (result)
  {
    CFIndex v6 = (const void *)result;
    AppleIDIdentityQuery::processFindPersonResults(this, (CFArrayRef)result);
    CFRelease(v6);
    return 1LL;
  }

  return result;
}

BOOL AppleIDIdentityQuery::executeAsynchronously( void *a1, uint64_t a2, uint64_t a3, const void *a4, const void *a5)
{
  uint64_t v5 = a1[1];
  if ((v5 & 0x80000000) == 0)
  {
    a1[1] = v5 | 0x80000000LL;
    a1[4] = a3;
    (*(void (**)(uint64_t))(*(void *)a3 + 16LL))(a3);
    a1[5] = CFRetain(a4);
    a1[6] = CFRetain(a5);
    CFRetain(a1 - 2);
    CFTypeID v9 = (const __CFDictionary *)a1[3];
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 0x40000000LL;
    uint64x2_t v12[2] = ___ZN20AppleIDIdentityQuery21executeAsynchronouslyEmP19IdentityQueryClientP11__CFRunLoopPK10__CFString_block_invoke;
    void v12[3] = &__block_descriptor_tmp_19_0;
    void v12[4] = a1;
    _AppleIDAuthenticationFindPersonWithBlock(v9, 0LL, (uint64_t)global_queue, (uint64_t)v12);
  }

  return (int)v5 >= 0;
}

void ___ZN20AppleIDIdentityQuery21executeAsynchronouslyEmP19IdentityQueryClientP11__CFRunLoopPK10__CFString_block_invoke( uint64_t a1, const __CFArray *a2, int a3, const void *a4)
{
  uint64_t v5 = *(AppleIDIdentityQuery **)(a1 + 32);
  if ((*((_BYTE *)v5 + 11) & 0x40) != 0)
  {
    if (a3) {
LABEL_10:
    }
      CFRelease((char *)v5 - 16);
  }

  else
  {
    if (a2)
    {
      AppleIDIdentityQuery::processFindPersonResults(*(AppleIDIdentityQuery **)(a1 + 32), a2);
    }

    else if (a4)
    {
      AppleIDIdentityQuery::sendEvent(*(AppleIDIdentityQuery **)(a1 + 32), 5LL, 0LL, a4);
      (*(void (**)(AppleIDIdentityQuery *))(*(void *)v5 + 72LL))(v5);
    }

    if (a3)
    {
      AppleIDIdentityQuery::sendEvent(v5, 1LL, 0LL, 0LL);
      goto LABEL_10;
    }
  }

void *AppleIDIdentityQuery::stop(void *this)
{
  uint64_t v1 = this[1];
  if ((v1 & 0x40000000) == 0)
  {
    uint64_t v2 = this;
    this[1] = v1 | 0x40000000;
    this = (void *)this[4];
    if (this)
    {
      (*(void (**)(void *))(*this + 24LL))(this);
      this = (void *)v2[4];
      if (this) {
        this = (void *)(*(uint64_t (**)(void *))(*this + 8LL))(this);
      }
      v2[4] = 0LL;
    }
  }

  return this;
}

void Identity::InitClass(Identity *this)
{
  uint64_t v1 = (CFClass *)operator new(0x68uLL);
  CFClass::CFClass(v1, "CSIdentity");
  Identity::__cfClass = v2;
}

uint64_t Identity::Class(Identity *this)
{
  return Identity::__cfClass;
}

void Identity::Identity(Identity *this, uint64_t a2, uint64_t a3)
{
  *(void *)this = off_189D7AB08;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = a3;
}

uint64_t Identity::equal(void *a1, void *a2)
{
  if (a1[1] != a2[1]) {
    return 0LL;
  }
  uint64_t v4 = (*(uint64_t (**)(void *))(*a1 + 88LL))(a1);
  uint64_t v5 = *a1;
  if (v4)
  {
    CFIndex v6 = (uint64_t (**)(void *))(v5 + 88);
    uint64_t v7 = 11LL;
  }

  else
  {
    uint64_t v9 = (*(uint64_t (**)(void *))(v5 + 64))(a1);
    uint64_t v10 = *a1;
    if (v9)
    {
      CFIndex v6 = (uint64_t (**)(void *))(v10 + 64);
      uint64_t v7 = 8LL;
    }

    else
    {
      uint64_t result = (*(uint64_t (**)(void *))(v10 + 48))(a1);
      if (!result) {
        return result;
      }
      CFIndex v6 = (uint64_t (**)(void *))(*a1 + 48LL);
      uint64_t v7 = 6LL;
    }
  }

  uint64_t v11 = (const void *)(*v6)(a1);
  CFIndex v12 = (const void *)(*(uint64_t (**)(void *))(*a2 + 8 * v7))(a2);
  return CFEqual(v11, v12) != 0;
}

uint64_t Identity::hash(Identity *this)
{
  uint64_t v2 = *((void *)this + 1);
  uint64_t v3 = (*(uint64_t (**)(Identity *))(*(void *)this + 88LL))(this);
  uint64_t v4 = *(void *)this;
  if (v3)
  {
    uint64_t v5 = (uint64_t (**)(Identity *))(v4 + 88);
LABEL_7:
    uint64_t v8 = (const void *)(*v5)(this);
    v2 += CFHash(v8);
    return v2;
  }

  uint64_t v6 = (*(uint64_t (**)(Identity *))(v4 + 64))(this);
  uint64_t v7 = *(void *)this;
  if (v6)
  {
    uint64_t v5 = (uint64_t (**)(Identity *))(v7 + 64);
    goto LABEL_7;
  }

  if ((*(uint64_t (**)(Identity *))(v7 + 48))(this))
  {
    uint64_t v5 = (uint64_t (**)(Identity *))(*(void *)this + 48LL);
    goto LABEL_7;
  }

  return v2;
}

CFTypeRef Identity::copyFormattingDesc(Identity *this, const __CFDictionary *a2)
{
  uint64_t v2 = (const void *)(*(uint64_t (**)(Identity *, const __CFDictionary *))(*(void *)this + 48LL))(this, a2);
  return CFRetain(v2);
}

CFStringRef Identity::copyDebugDesc(Identity *this)
{
  if ((*(uint64_t (**)(Identity *))(*(void *)this + 88LL))(this))
  {
    uint64_t v2 = (const void *)(*(uint64_t (**)(Identity *))(*(void *)this + 88LL))(this);
    uint64_t v3 = (void *)CFCopyDescription(v2);
  }

  else
  {
    uint64_t v3 = (void *)CFRetain(@"<null>");
  }

  uint64_t v4 = v3;
  uint64_t v5 = CFGetAllocator((char *)this - 16);
  CFAllocatorRef v6 = CFGetAllocator((char *)this - 16);
  uint64_t v7 = *((void *)this + 1);
  uint64_t v8 = (*(uint64_t (**)(Identity *))(*(void *)this + 48LL))(this);
  uint64_t v9 = (*(uint64_t (**)(Identity *))(*(void *)this + 64LL))(this);
  uint64_t v10 = *((void *)this + 2);
  uint64_t v11 = (*(uint64_t (**)(Identity *))(*(void *)this + 96LL))(this);
  CFStringRef v12 = CFStringCreateWithFormat( v5,  0LL,  @"<CSIdentity %p [%p]>{class = %ld, full name = %@, posix name = %@, flags = %lx, uuid = %@, posixID = %d}",  (char *)this - 16,  v6,  v7,  v8,  v9,  v10,  v4,  v11);
  CFRelease(v4);
  return v12;
}

CFTypeRef Identity::createReferenceData(Identity *this, const __CFAllocator *a2)
{
  values[4] = *(void **)MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)this;
  uint64_t v24 = *((void *)this + 1);
  keys[0] = @"authority";
  uint64_t v5 = (*(uint64_t (**)(Identity *))(v4 + 72))(this);
  values[0] = (void *)CFRetain(*(CFTypeRef *)(v5 + 8));
  keys[1] = @"class";
  CFAllocatorRef v6 = CFGetAllocator((char *)this - 16);
  values[1] = CFNumberCreate(v6, kCFNumberLongType, &v24);
  if ((*(uint64_t (**)(Identity *))(*(void *)this + 88LL))(this))
  {
    uint64_t v26 = @"uuid";
    uint64_t v7 = CFGetAllocator((char *)this - 16);
    uint64_t v8 = (const __CFUUID *)(*(uint64_t (**)(Identity *))(*(void *)this + 88LL))(this);
    uint64_t v9 = (void *)CFUUIDCreateString(v7, v8);
    uint64_t v10 = 3LL;
    CFIndex v11 = 2LL;
  }

  else
  {
    if ((*(uint64_t (**)(Identity *))(*(void *)this + 64LL))(this))
    {
      uint64_t v26 = @"name";
      CFStringRef v12 = (const void *)(*(uint64_t (**)(Identity *))(*(void *)this + 64LL))(this);
      values[2] = (void *)CFRetain(v12);
      CFIndex v11 = 3LL;
    }

    else
    {
      CFIndex v11 = 2LL;
    }

    keys[v11] = @"full name";
    unint64_t v13 = (const void *)(*(uint64_t (**)(Identity *))(*(void *)this + 48LL))(this);
    uint64_t v9 = (void *)CFRetain(v13);
    uint64_t v10 = v11 + 1;
  }

  values[v11] = v9;
  CFIndex v11 = v10;
LABEL_9:
  uint64_t v14 = 0LL;
  while (values[v14])
  {
    if (v11 == ++v14) {
      goto LABEL_14;
    }
  }

  if (v11 == v14)
  {
LABEL_14:
    uint64_t v15 = CFGetAllocator((char *)this - 16);
    CFDictionaryRef v16 = CFDictionaryCreate( v15,  (const void **)keys,  (const void **)values,  v11,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    goto LABEL_16;
  }

  CFDictionaryRef v16 = 0LL;
LABEL_16:
  unint64_t v17 = 0LL;
  uint64_t v18 = 8 * v11;
  do
  {
    CFIndex v19 = values[v17 / 8];
    if (v19) {
      CFRelease(v19);
    }
    v17 += 8LL;
  }

  while (v18 != v17);
  if (!v16) {
    return 0LL;
  }
  CFRange v20 = CFWriteStreamCreateWithAllocatedBuffers(a2, a2);
  if (v20)
  {
    CFIndex v21 = v20;
    if (CFWriteStreamOpen(v20))
    {
      if (CFPropertyListWriteToStream(v16, v21, kCFPropertyListBinaryFormat_v1_0, 0LL) < 1) {
        CFTypeRef v22 = 0LL;
      }
      else {
        CFTypeRef v22 = CFWriteStreamCopyProperty(v21, (CFStreamPropertyKey)*MEMORY[0x1896051D0]);
      }
      CFWriteStreamClose(v21);
    }

    else
    {
      CFTypeRef v22 = 0LL;
    }

    CFRelease(v21);
  }

  else
  {
    CFTypeRef v22 = 0LL;
  }

  CFRelease(v16);
  return v22;
}

uint64_t Identity::copyPrincipalName(Identity *this)
{
  return 0LL;
}

uint64_t Identity::copyTrustSubjectDistinguishedName(Identity *this)
{
  return 0LL;
}

uint64_t Identity::authenticateCertificateChain(Identity *this, const __CFArray *a2, __CFError **a3)
{
  if (a3) {
    *a3 = CSCreateIdentityError(@"CSIdentityErrorDomain", -101LL);
  }
  return 0LL;
}

uint64_t Identity::authenticatePassword(Identity *this, const __CFString *a2, __CFError **a3)
{
  if (a3) {
    *a3 = CSCreateIdentityError(@"CSIdentityErrorDomain", -2LL);
  }
  return 0LL;
}

uint64_t IdentityAuthority::RegisterAuthority(IdentityAuthority *this, IdentityAuthority *a2)
{
  uint64_t v3 = (const __CFArray *)(*(uint64_t (**)(IdentityAuthority *, IdentityAuthority *))(*(void *)this + 112LL))( this,  a2);
  _os_nospin_lock_lock();
  CFMutableDictionaryRef Mutable = (__CFDictionary *)IdentityAuthority::sInstances;
  if (!IdentityAuthority::sInstances)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    IdentityAuthority::sInstances = (uint64_t)Mutable;
  }

  if (!IdentityAuthority::sIssuerDict)
  {
    IdentityAuthority::sIssuerDict = (uint64_t)CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    CFMutableDictionaryRef Mutable = (__CFDictionary *)IdentityAuthority::sInstances;
  }

  uint64_t v5 = (const void *)*((void *)this + 1);
  CFAllocatorRef v6 = (char *)this - 16;
  CFDictionarySetValue(Mutable, v5, v6);
  if (v3)
  {
    CFIndex Count = CFArrayGetCount(v3);
    if (Count >= 1)
    {
      CFIndex v8 = Count;
      for (CFIndex i = 0LL; i != v8; ++i)
      {
        uint64_t v10 = (__CFDictionary *)IdentityAuthority::sIssuerDict;
        ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
        CFDictionaryAddValue(v10, ValueAtIndex, v6);
      }
    }

    CFRelease(v3);
  }

  return _os_nospin_lock_unlock();
}

uint64_t IdentityAuthority::IdentityAuthorityWithIdentifier(IdentityAuthority *this, const __CFString *a2)
{
  if (IdentityAuthority::sInstances)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)IdentityAuthority::sInstances, this);
    _os_nospin_lock_unlock();
    if (Value) {
      return (uint64_t)Value + 16;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    _os_nospin_lock_unlock();
    return 0LL;
  }

void IdentityAuthority::InitClass(IdentityAuthority *this)
{
  uint64_t v1 = (CFClass *)operator new(0x68uLL);
  CFClass::CFClass(v1, "CSIdentityAuthority");
  IdentityAuthority::__cfClass = v2;
}

uint64_t IdentityAuthority::Class(IdentityAuthority *this)
{
  return IdentityAuthority::__cfClass;
}

void IdentityAuthority::IdentityAuthority( IdentityAuthority *this, const __CFString *a2, const __CFString *a3)
{
  *(void *)this = off_189D7ACB8;
  CFAllocatorRef v6 = (char *)this - 16;
  uint64_t v7 = CFGetAllocator((char *)this - 16);
  *((void *)this + 1) = CFStringCreateCopy(v7, a2);
  CFIndex v8 = CFGetAllocator(v6);
  *((void *)this + 2) = CFStringCreateCopy(v8, a3);
}

void IdentityAuthority::~IdentityAuthority(CFTypeRef *this)
{
  *this = off_189D7ACB8;
  CFRelease(this[1]);
  CFRelease(this[2]);
  _LSBundleDisplayNameContextEnumerate(this, v2, v3, v4, v5);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  IdentityAuthority::~IdentityAuthority(this);
  _LSBundleDisplayNameContextEnumerate(v1, v2, v3, v4, v5);
}

BOOL IdentityAuthority::equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t IdentityAuthority::hash(IdentityAuthority *this)
{
  return (uint64_t)this - 16;
}

uint64_t IdentityAuthority::copyFormattingDesc(IdentityAuthority *this, const __CFDictionary *a2)
{
  return (*(uint64_t (**)(IdentityAuthority *))(*(void *)this + 48LL))(this);
}

CFStringRef IdentityAuthority::copyDebugDesc(IdentityAuthority *this)
{
  uint64_t v1 = (char *)this - 16;
  uint64_t v2 = (const void *)(*(uint64_t (**)(IdentityAuthority *))(*(void *)this + 48LL))(this);
  uint64_t v3 = CFGetAllocator(v1);
  CFAllocatorRef v4 = CFGetAllocator(v1);
  CFStringRef v5 = CFStringCreateWithFormat(v3, 0LL, @"<CSIdentityAuthority %p [%p]>{localizedName = %@}", v1, v4, v2);
  CFRelease(v2);
  return v5;
}

uint64_t IdentityAuthority::copyIdentityWithName( IdentityAuthority *this, const __CFString *a2, uint64_t a3, Identity **a4, __CFError **a5)
{
  CFAllocatorRef v10 = CFGetAllocator((char *)this - 16);
  uint64_t v11 = (*(uint64_t (**)(IdentityAuthority *, CFAllocatorRef, const __CFString *, uint64_t, uint64_t))(*(void *)this + 72LL))( this,  v10,  a2,  1LL,  a3);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, __CFError **))(*(void *)v11 + 56LL))(v11, 2LL, a5);
    if ((_DWORD)v13)
    {
      uint64_t v14 = (const __CFArray *)(*(uint64_t (**)(uint64_t))(*(void *)v12 + 48LL))(v12);
      if (CFArrayGetCount(v14) < 1)
      {
        *a4 = 0LL;
      }

      else
      {
        ValueAtIndex = (char *)CFArrayGetValueAtIndex(v14, 0LL);
        *a4 = (Identity *)(ValueAtIndex + 16);
        CFRetain(ValueAtIndex);
      }

      CFRelease(v14);
    }

    CFRelease((CFTypeRef)(v12 - 16));
  }

  else
  {
    uint64_t v13 = 0LL;
    if (a5) {
      *a5 = CSCreateIdentityError(@"CSIdentityErrorDomain", -2LL);
    }
  }

  return v13;
}

uint64_t IdentityAuthority::createQueryWithName( IdentityAuthority *this, const __CFAllocator *a2, const __CFString *a3)
{
  return 0LL;
}

uint64_t IdentityAuthority::createQueryWithProperties( IdentityAuthority *this, const __CFAllocator *a2, const void *a3)
{
  return 0LL;
}

uint64_t IdentityAuthority::authenticateNameAndPassword( IdentityAuthority *this, const __CFString *a2, const __CFString *a3, __CFError **a4)
{
  if (a4) {
    *a4 = CSCreateIdentityError(@"CSIdentityErrorDomain", -2LL);
  }
  return 0LL;
}

uint64_t IdentityAuthority::copyCertificateIssuerNames(IdentityAuthority *this)
{
  return 0LL;
}

uint64_t IdentityAuthority::copyPrincipalForCertificate()
{
  return 0LL;
}

uint64_t IdentityAuthority::copyPrincipalForNamePair( IdentityAuthority *this, const __CFString *a2, const __CFString *a3)
{
  return 0LL;
}

uint64_t IdentityAuthority::copyTrustSubjectDistinguishedNameForNamePair( IdentityAuthority *this, const __CFString *a2, const __CFString *a3)
{
  return 0LL;
}

uint64_t IdentityAuthority::copyTrustAnchorDistinguishedName(IdentityAuthority *this)
{
  return 0LL;
}

uint64_t CFClass::FinalizeObj(CFClass *this, const void *a2)
{
  return (*(uint64_t (**)(char *))(*((void *)this + 2) + 8LL))((char *)this + 16);
}

uint64_t CFClass::EqualObj(CFClass *this, char *a2, const void *a3)
{
  return (*(uint64_t (**)(char *, char *, const void *))(*((void *)this + 2) + 16LL))( (char *)this + 16,  a2 + 16,  a3);
}

uint64_t CFClass::HashObj(CFClass *this, const void *a2)
{
  return (*(uint64_t (**)(char *))(*((void *)this + 2) + 24LL))((char *)this + 16);
}

uint64_t CFClass::CopyFormattingDescObj(CFClass *this, const void *a2, const __CFDictionary *a3)
{
  return (*(uint64_t (**)(char *, const void *))(*((void *)this + 2) + 32LL))((char *)this + 16, a2);
}

uint64_t CFClass::CopyDebugDescObj(CFClass *this, const void *a2)
{
  return (*(uint64_t (**)(char *))(*((void *)this + 2) + 40LL))((char *)this + 16);
}

void CFClass::CFClass(CFClass *this, const char *a2)
{
  *(void *)this = 0LL;
  *((void *)this + 1) = a2;
  *((void *)this + 4) = CFClass::FinalizeObj;
  *((void *)this + 5) = CFClass::EqualObj;
  *((void *)this + 2) = 0LL;
  *((void *)this + 3) = 0LL;
  *((void *)this + 6) = CFClass::HashObj;
  *((void *)this + 7) = CFClass::CopyFormattingDescObj;
  *((void *)this + _Block_object_dispose(va, 8) = CFClass::CopyDebugDescObj;
  *((void *)this + 12) = _CFRuntimeRegisterClass();
}

uint64_t CFObject::Allocate(CFObject *this, unint64_t a2, const CFClass *a3, const __CFAllocator *a4)
{
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance) {
    return Instance + 16;
  }
  else {
    return 0LL;
  }
}

BOOL CFObject::equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t CFObject::hash(CFObject *this)
{
  return (uint64_t)this - 16;
}

void IdentityQuery::InitClass(IdentityQuery *this)
{
  uint64_t v1 = (CFClass *)operator new(0x68uLL);
  CFClass::CFClass(v1, "CSIdentityQuery");
  IdentityQuery::__cfClass = v2;
}

uint64_t IdentityQuery::Class(IdentityQuery *this)
{
  return IdentityQuery::__cfClass;
}

uint64_t IdentityQuery::copyFormattingDesc(IdentityQuery *this, const __CFDictionary *a2)
{
  return (*(uint64_t (**)(IdentityQuery *))(*(void *)this + 40LL))(this);
}

CFStringRef IdentityQuery::copyDebugDesc(IdentityQuery *this)
{
  uint64_t v1 = (char *)this - 16;
  uint64_t v2 = CFGetAllocator((char *)this - 16);
  CFAllocatorRef v3 = CFGetAllocator(v1);
  return CFStringCreateWithFormat(v2, 0LL, @"<CSIdentityQuery %p [%p]>", v1, v3);
}

CFTypeID CSIdentityAuthorityGetTypeID(void)
{
  return *(void *)(IdentityAuthority::Class(v0) + 96);
}

CFStringRef CSIdentityAuthorityCopyLocalizedName(CSIdentityAuthorityRef authority)
{
  return (CFStringRef)(*(uint64_t (**)(char *))(*((void *)authority + 2) + 48LL))((char *)authority + 16);
}

uint64_t _CSGetAppleIDIdentityAuthority()
{
  uint64_t v0 = (AppleIDIdentityAuthority *)pthread_once(&gCSIdentityInitLock, (void (*)(void))_CSIdentityInitOnce);
  return AppleIDIdentityAuthority::Authority(v0) - 16;
}

char *_CSIdentityAuthorityCopyIdentityWithName(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  CFAllocatorRef v4 = 0LL;
  IdentityAuthority::copyIdentityWithName((IdentityAuthority *)(a1 + 16), a2, a3, &v4, 0LL);
  if (v4) {
    return (char *)v4 - 16;
  }
  else {
    return 0LL;
  }
}

CFErrorRef CSCreateIdentityError(const void *a1, CFIndex a2)
{
  userInfoKeys[2] = *(void **)MEMORY[0x1895F89C0];
  CFAllocatorRef v3 = (void *)*MEMORY[0x189604F88];
  userInfoKeys[0] = *(void **)MEMORY[0x189604F38];
  userInfoKeys[1] = v3;
  CFTypeRef cf = 0LL;
  int v4 = CFEqual(a1, @"CSIdentityErrorDomain");
  CFStringRef v5 = (CFAllocatorRef *)MEMORY[0x189604DB0];
  if (v4)
  {
    CFErrorRef v6 = 0LL;
    CFErrorRef v7 = 0LL;
    if (a2) {
      goto LABEL_6;
    }
  }

  else
  {
    CFErrorRef v6 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F50], a2, 0LL);
    CFTypeRef cf = v6;
  }

  a2 = -2LL;
  CFErrorRef v7 = v6;
LABEL_6:
  pthread_once(&errorOnceLock, (void (*)(void))createErrorMaps);
  Value = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)errorDescMap, (const void *)a2);
  uint64_t v9 = @"Unknown error";
  if (Value) {
    uint64_t v9 = Value;
  }
  userInfoValues = v9;
  if (v7) {
    CFIndex v10 = 2LL;
  }
  else {
    CFIndex v10 = 1LL;
  }
  CFErrorRef v11 = CFErrorCreateWithUserInfoKeysAndValues( *v5,  @"CSIdentityErrorDomain",  a2,  (const void *const *)userInfoKeys,  (const void *const *)&userInfoValues,  v10);
  if (cf) {
    CFRelease(cf);
  }
  return v11;
}

CFDictionaryRef createErrorMaps(void)
{
  CFDictionaryRef result = CFDictionaryCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const void **)&errorKeys,  (const void **)&errorDescriptions,  16LL,  0LL,  0LL);
  errorDescMap = (uint64_t)result;
  return result;
}

CFTypeID CSIdentityGetTypeID(void)
{
  return *(void *)(Identity::Class(v0) + 96);
}

CSIdentityRef CSIdentityCreateCopy(CFAllocatorRef allocator, CSIdentityRef identity)
{
  uint64_t v2 = (*(uint64_t (**)(char *, CFAllocatorRef))(*((void *)identity + 2) + 352LL))( (char *)identity + 16,  allocator);
  if (v2) {
    return (CSIdentityRef)(v2 - 16);
  }
  else {
    return 0LL;
  }
}

CFStringRef CSIdentityGetFullName(CSIdentityRef identity)
{
  return (CFStringRef)(*(uint64_t (**)(char *))(*((void *)identity + 2) + 48LL))((char *)identity + 16);
}

CFStringRef CSIdentityGetPosixName(CSIdentityRef identity)
{
  return (CFStringRef)(*(uint64_t (**)(char *))(*((void *)identity + 2) + 64LL))((char *)identity + 16);
}

CSIdentityClass CSIdentityGetClass(CSIdentityRef identity)
{
  return *((void *)identity + 3);
}

CSIdentityAuthorityRef CSIdentityGetAuthority(CSIdentityRef identity)
{
}

CFDataRef CSIdentityCreatePersistentReference(CFAllocatorRef allocator, CSIdentityRef identity)
{
  return (CFDataRef)(*(uint64_t (**)(char *, CFAllocatorRef))(*((void *)identity + 2) + 376LL))( (char *)identity + 16,  allocator);
}

uint64_t _CSIdentityAuthenticateUsingCertificateChain(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 16) + 280LL))(a1 + 16);
}

uint64_t _CSIdentityAuthenticateUsingCertificate(void *a1, void *a2, uint64_t a3)
{
  values = a2;
  CFStringRef v5 = CFGetAllocator(a1);
  CFArrayRef v6 = CFArrayCreate(v5, (const void **)&values, 1LL, MEMORY[0x189605228]);
  uint64_t v7 = (*(uint64_t (**)(void *, CFArrayRef, uint64_t))(a1[2] + 280LL))(a1 + 2, v6, a3);
  CFRelease(v6);
  return v7;
}

uint64_t _CSIdentityUpdateLinkedIdentityProvisioning(uint64_t a1, CFErrorRef *a2)
{
  if (a2) {
    *a2 = CSCreateIdentityError(@"CSIdentityErrorDomain", -4LL);
  }
  return 0LL;
}

uint64_t _CSDefaultLog()
{
  if (_CSDefaultLog_onceToken != -1) {
    dispatch_once(&_CSDefaultLog_onceToken, &__block_literal_global_79);
  }
  return _CSDefaultLog_log;
}

uint64_t CSIdentityQueryClient::retain(uint64_t this)
{
  uint64_t v1 = *(uint64_t (**)(void))(this + 24);
  if (v1)
  {
    uint64_t v2 = this;
    this = v1(*(void *)(this + 16));
    *(void *)(v2 + 16) = this;
  }

  return this;
}

uint64_t CSIdentityQueryClient::release(uint64_t this)
{
  uint64_t v1 = *(uint64_t (**)(void))(this + 32);
  if (v1) {
    return v1(*(void *)(this + 16));
  }
  return this;
}

uint64_t CSIdentityQueryClient::receiveEvent( uint64_t this, IdentityQuery *a2, uint64_t a3, const __CFArray *a4, __CFError *a5)
{
  CFStringRef v5 = *(uint64_t (**)(char *, uint64_t, const __CFArray *, __CFError *, void))(this + 48);
  if (v5) {
    return v5((char *)a2 - 16, a3, a4, a5, *(void *)(this + 16));
  }
  return this;
}

CFTypeID CSIdentityQueryGetTypeID(void)
{
  return *(void *)(IdentityQuery::Class(v0) + 96);
}

CSIdentityQueryRef CSIdentityQueryCreateForName( CFAllocatorRef allocator, CFStringRef name, CSIdentityQueryStringComparisonMethod comparisonMethod, CSIdentityClass identityClass, CSIdentityAuthorityRef authority)
{
  uint64_t v5 = (*(uint64_t (**)(char *, CFAllocatorRef, CFStringRef, CSIdentityQueryStringComparisonMethod, CSIdentityClass))(*((void *)authority + 2) + 72LL))( (char *)authority + 16,  allocator,  name,  comparisonMethod,  identityClass);
  if (v5) {
    return (CSIdentityQueryRef)(v5 - 16);
  }
  else {
    return 0LL;
  }
}

CSIdentityQueryRef CSIdentityQueryCreateForPersistentReference( CFAllocatorRef allocator, CFDataRef referenceData)
{
  int v4 = (const __CFDictionary *)CFPropertyListCreateFromXMLData(allocator, referenceData, 0LL, 0LL);
  if (v4)
  {
    uint64_t v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFDictionaryGetTypeID()
      && (Value = (IdentityAuthority *)CFDictionaryGetValue(v5, @"authority")) != 0LL
      && (v8 = Value, CFTypeID v9 = CFGetTypeID(Value), v9 == CFStringGetTypeID())
      && (uint64_t v11 = IdentityAuthority::IdentityAuthorityWithIdentifier(v8, v10)) != 0)
    {
      uint64_t v12 = (*(uint64_t (**)(uint64_t, CFAllocatorRef, const __CFDictionary *))(*(void *)v11 + 96LL))( v11,  allocator,  v5);
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  if (v12) {
    return (CSIdentityQueryRef)(v12 - 16);
  }
  else {
    return 0LL;
  }
}

CFArrayRef CSIdentityQueryCopyResults(CSIdentityQueryRef query)
{
  return (CFArrayRef)(*(uint64_t (**)(char *))(*((void *)query + 2) + 48LL))((char *)query + 16);
}

Boolean CSIdentityQueryExecute(CSIdentityQueryRef query, CSIdentityQueryFlags flags, CFErrorRef *error)
{
  return (*(uint64_t (**)(char *, CSIdentityQueryFlags, CFErrorRef *))(*((void *)query + 2) + 56LL))( (char *)query + 16,  flags,  error);
}

Boolean CSIdentityQueryExecuteAsynchronously( CSIdentityQueryRef query, CSIdentityQueryFlags flags, const CSIdentityQueryClientContext *clientContext, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  CFIndex v10 = (char *)operator new(0x38uLL);
  *(void *)CFIndex v10 = off_189D7ADA0;
  __int128 v11 = *(_OWORD *)&clientContext->retainInfo;
  *(_OWORD *)(v10 + _Block_object_dispose(va, 8) = *(_OWORD *)&clientContext->version;
  *(_OWORD *)(v10 + 24) = v11;
  *(_OWORD *)(v10 + 40) = *(_OWORD *)&clientContext->copyInfoDescription;
  return (*(uint64_t (**)(char *, CSIdentityQueryFlags, char *, CFRunLoopRef, CFStringRef))(*((void *)query + 2) + 64LL))( (char *)query + 16,  flags,  v10,  runLoop,  runLoopMode);
}

void CSIdentityQueryStop(CSIdentityQueryRef query)
{
}

CFStringRef _CSBackToMyMacCopyDomain()
{
  uint64_t v0 = geteuid();
  CFDictionaryRef v1 = copyBackToMyMacPreferences();
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  CFStringRef NormalizedDomainName = CFStringCreateWithFormat(0LL, 0LL, @"%d", v0);
  if (NormalizedDomainName)
  {
    Value = (const __CFString *)CFDictionaryGetValue(v2, NormalizedDomainName);
    if (Value)
    {
      uint64_t v5 = Value;
      CFRetain(Value);
      CFRelease(NormalizedDomainName);
      CFRelease(v2);
      CFStringRef NormalizedDomainName = createNormalizedDomainName(v5);
      uint64_t v2 = (const __CFDictionary *)v5;
    }

    else
    {
      CFRelease(NormalizedDomainName);
      CFStringRef NormalizedDomainName = 0LL;
    }
  }

  CFRelease(v2);
  return NormalizedDomainName;
}

CFMutableStringRef createNormalizedDomainName(const __CFString *a1)
{
  if (!CFStringGetLength(a1)) {
    return 0LL;
  }
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0LL, 0LL, a1);
  if (!CFStringHasSuffix(MutableCopy, @".")) {
    CFStringAppend(MutableCopy, @".");
  }
  CFStringLowercase(MutableCopy, 0LL);
  return MutableCopy;
}

__CFSet *_CSBackToMyMacCopyDomains()
{
  v10[1] = *MEMORY[0x1895F89C0];
  CFMutableDictionaryRef Mutable = CFSetCreateMutable(0LL, 0LL, MEMORY[0x189604E48]);
  CFDictionaryRef v1 = copyBackToMyMacPreferences();
  if (v1)
  {
    uint64_t v2 = v1;
    CFIndex Count = CFDictionaryGetCount(v1);
    if (Count)
    {
      uint64_t v4 = Count;
      MEMORY[0x1895F8858](Count);
      CFTypeID v6 = (const void **)((char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      CFDictionaryGetKeysAndValues(v2, 0LL, v6);
      if (v4 >= 1)
      {
        do
        {
          CFMutableStringRef NormalizedDomainName = createNormalizedDomainName((const __CFString *)*v6);
          if (NormalizedDomainName)
          {
            CFMutableStringRef v8 = NormalizedDomainName;
            CFSetSetValue(Mutable, NormalizedDomainName);
            CFRelease(v8);
          }

          ++v6;
          --v4;
        }

        while (v4);
      }
    }

    CFRelease(v2);
  }

  return Mutable;
}

CFDictionaryRef copyBackToMyMacPreferences()
{
  uint64_t v0 = SCPreferencesCreate(0LL, @"com.apple.BackToMyMac", 0LL);
  if (!v0) {
    return 0LL;
  }
  CFDictionaryRef v1 = v0;
  CFDictionaryRef Value = SCPreferencesPathGetValue(v0, @"/System/Network/BackToMyMac");
  CFDictionaryRef v3 = Value;
  if (Value) {
    CFRetain(Value);
  }
  CFRelease(v1);
  return v3;
}

uint64_t _CSDeviceSupportsAirDrop()
{
  uint64_t v0 = (const __CFBoolean *)_CSDeviceSupportsAirDrop_supportsAirDrop;
  if (_CSDeviceSupportsAirDrop_supportsAirDrop) {
    return CFBooleanGetValue(v0);
  }
  CFDictionaryRef v1 = (const __CFBoolean *)CFPreferencesCopyAppValue(@"DisableAirDrop", @"com.apple.NetworkBrowser");
  if (!v1) {
    goto LABEL_11;
  }
  uint64_t v2 = v1;
  CFTypeID v3 = CFGetTypeID(v1);
  if (v3 == CFBooleanGetTypeID())
  {
    int Value = CFBooleanGetValue(v2);
  }

  else
  {
    CFTypeID v5 = CFGetTypeID(v2);
    if (v5 != CFStringGetTypeID())
    {
      CFRelease(v2);
LABEL_11:
      _CSDeviceSupportsAirDrop_supportsAirDrop = *MEMORY[0x189604DE0];
      uint64_t v0 = (const __CFBoolean *)_CSDeviceSupportsAirDrop_supportsAirDrop;
      if (_CSDeviceSupportsAirDrop_supportsAirDrop) {
        return CFBooleanGetValue(v0);
      }
      goto LABEL_12;
    }

    int Value = CFEqual(v2, @"1");
  }

  int v6 = Value;
  CFRelease(v2);
  if (v6) {
    goto LABEL_11;
  }
  uint64_t v0 = (const __CFBoolean *)_CSDeviceSupportsAirDrop_supportsAirDrop;
  if (_CSDeviceSupportsAirDrop_supportsAirDrop) {
    return CFBooleanGetValue(v0);
  }
LABEL_12:
  uint64_t v7 = (const __CFBoolean *)browseAllInterfacesEnabled_enabled;
  if (!browseAllInterfacesEnabled_enabled)
  {
    CFMutableStringRef v8 = (const __CFBoolean *)CFPreferencesCopyAppValue(@"BrowseAllInterfaces", @"com.apple.NetworkBrowser");
    if (!v8)
    {
      uint64_t v12 = (const __CFBoolean **)MEMORY[0x189604DE8];
LABEL_23:
      uint64_t v7 = *v12;
      browseAllInterfacesEnabled_enabled = (uint64_t)*v12;
      goto LABEL_24;
    }

    CFTypeID v9 = v8;
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFBooleanGetTypeID())
    {
      int v11 = CFBooleanGetValue(v9);
    }

    else
    {
      CFTypeID v13 = CFGetTypeID(v9);
      if (v13 != CFStringGetTypeID())
      {
        int v14 = 1;
LABEL_21:
        CFRelease(v9);
        uint64_t v12 = (const __CFBoolean **)MEMORY[0x189604DE8];
        if (!v14) {
          uint64_t v12 = (const __CFBoolean **)MEMORY[0x189604DE0];
        }
        goto LABEL_23;
      }

      int v11 = CFEqual(v9, @"1");
    }

    int v14 = v11;
    goto LABEL_21;
  }

uint64_t _CSIsComputerToComputerEnabled()
{
  return 0LL;
}

uint64_t _CSIsWirelessAccessPointEnabled()
{
  return 0LL;
}

uint64_t _CSEnableWirelessP2P()
{
  return 0LL;
}

uint64_t _CSDisassociateWireless()
{
  return 0LL;
}

CFStringRef _CSCopyCommentForServerName(const __CFAllocator *a1, CFStringRef theString)
{
  if (_CSCopyCommentForServerName_sOnce != -1) {
    dispatch_once(&_CSCopyCommentForServerName_sOnce, &__block_literal_global_16);
  }
  CFStringEncoding v4 = _CSCopyCommentForServerName_dosEncoding;
  CFIndex Length = CFStringGetLength(theString);
  v16.CFIndex location = 0LL;
  v16.length = Length;
  CFIndex Bytes = CFStringGetBytes(theString, v16, v4, 0, 0, 0LL, 0LL, 0LL);
  range.CFIndex location = Bytes;
  if (Bytes == Length) {
    return CFStringCreateCopy(a1, theString);
  }
  CFIndex v8 = Bytes;
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(a1, 0LL, theString);
  range.length = 0LL;
  if (v8 < Length)
  {
    CFIndex v10 = 0LL;
    do
    {
      while (1)
      {
        CFRange RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(theString, v8);
        range.length = RangeOfComposedCharactersAtIndex.location
                     + RangeOfComposedCharactersAtIndex.length
                     - range.location;
        v17.length = Length - (RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length);
        v17.CFIndex location = RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length;
        CFIndex v12 = CFStringGetBytes(theString, v17, v4, 0, 0, 0LL, 0LL, 0LL);
        CFIndex v13 = range.length;
        if (v12 <= 0) {
          break;
        }
        CFIndex v14 = v12;
        range.location += v10;
        CFStringTransform(MutableCopy, &range, @"Publishing-Any; Any-Latin; NFKD; [:^ASCII:] Remove", 0);
        CFIndex v10 = v10 - v13 + range.length;
        CFIndex v8 = v14 + RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length;
        range.CFIndex location = v8;
        range.length = 0LL;
        if (v8 >= Length) {
          goto LABEL_14;
        }
      }

      CFIndex v8 = range.location + range.length;
    }

    while (range.location + range.length < Length);
    if (range.length >= 1) {
      CFStringTransform(MutableCopy, &range, @"Publishing-Any; Any-Latin; NFKD; [:^ASCII:] Remove", 0);
    }
  }

CFStringRef _CSCreatePosixNameFromString(const __CFAllocator *a1, const __CFString *a2)
{
  return createPosixNameFromString(a1, a2, 1);
}

CFStringRef createPosixNameFromString(const __CFAllocator *a1, CFStringRef theString, int a3)
{
  CFIndex Length = CFStringGetLength(theString);
  if (Length < 1) {
    return 0LL;
  }
  CFIndex v7 = Length;
  CFIndex v8 = CFLocaleCopyPreferredLanguages();
  if (v8)
  {
    CFTypeID v9 = v8;
    if (CFArrayGetCount(v8) < 1)
    {
      int v11 = 0LL;
    }

    else
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v9, 0LL);
      int v11 = CFLocaleCreate(a1, ValueAtIndex);
    }

    CFRelease(v9);
  }

  else
  {
    int v11 = 0LL;
  }

  v21.CFIndex location = 0LL;
  v21.length = v7;
  v22.CFIndex location = 0LL;
  v22.length = v7;
  CFStringTokenizerRef v12 = CFStringTokenizerCreate(a1, theString, v22, 0x10004uLL, v11);
  if (!v12)
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(a1, 0LL, theString);
    if (MutableCopy) {
      goto LABEL_14;
    }
LABEL_27:
    CFStringRef v19 = 0LL;
    if (!v11) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }

  CFIndex v13 = v12;
  CFMutableStringRef MutableCopy = CFStringCreateMutable(a1, 0LL);
  while (CFStringTokenizerAdvanceToNextToken(v13))
  {
    uint64_t v15 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v13, 0x10000uLL);
    if (v15)
    {
      CFRange v16 = v15;
      CFStringAppend(MutableCopy, v15);
      CFRelease(v16);
    }
  }

  CFRelease(v13);
  if (!MutableCopy) {
    goto LABEL_27;
  }
LABEL_14:
  v21.CFIndex location = 0LL;
  v21.length = CFStringGetLength(MutableCopy);
  CFStringTransform(MutableCopy, &v21, @"Latin; NFD; [^-_a-zA-Z0-9] Remove", 0);
  if (a3) {
    CFStringLowercase(MutableCopy, v11);
  }
  uint64_t v17 = CFStringGetLength(MutableCopy);
  if (v17 >= 255) {
    v18.length = 255LL;
  }
  else {
    v18.length = v17;
  }
  v21.CFIndex location = 0LL;
  v21.length = v18.length;
  v18.CFIndex location = 0LL;
  CFStringRef v19 = CFStringCreateWithSubstring(a1, MutableCopy, v18);
  CFRelease(MutableCopy);
  if (v11) {
LABEL_20:
  }
    CFRelease(v11);
LABEL_21:
  if (v19 && !CFStringGetLength(v19))
  {
    CFRelease(v19);
    return 0LL;
  }

  return v19;
}

CFStringRef _CSCopyLocalHostnameForComputerName(const __CFAllocator *a1, CFStringRef theString)
{
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(a1, 0LL, theString);
  v6.length = CFStringGetLength(MutableCopy);
  v6.CFIndex location = 0LL;
  CFStringFindAndReplace(MutableCopy, @" ", @"-", v6, 0LL);
  v7.length = CFStringGetLength(MutableCopy);
  v7.CFIndex location = 0LL;
  CFStringFindAndReplace(MutableCopy, @"_", @"-", v7, 0LL);
  do
  {
    v8.length = CFStringGetLength(MutableCopy);
    v8.CFIndex location = 0LL;
  }

  while (CFStringFindAndReplace(MutableCopy, @"--", @"-", v8, 0LL));
  CFStringTrim(MutableCopy, @"-");
  CFStringRef PosixNameFromString = createPosixNameFromString(a1, MutableCopy, 0);
  CFRelease(MutableCopy);
  if (PosixNameFromString) {
    return PosixNameFromString;
  }
  else {
    return CFStringCreateCopy(a1, @"Macintosh");
  }
}

void _XCFStringHashCaseInsensitive_cold_1(os_log_t log)
{
  *(_WORD *)CFDictionaryRef v1 = 0;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "LaunchServices: unable to create character buffer for string to be hashed",  v1,  2u);
}

void _FSNodeGetNonFictionalDeviceNumber(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_5(&dword_183E58000, a2, a3, "Could not get non-fictional device number: %@", (uint8_t *)&v3);
}

void _LSAliasGet_cold_1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)__int128 buf = 134218240;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&dword_183E58000, log, OS_LOG_TYPE_ERROR, "bad alias at %p, size %ld too big\n", buf, 0x16u);
}

void computeIdentityString( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void evaluateBundleNoIOCommon( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void getSharedMCProfileConnection_cold_1()
{
  OUTLINED_FUNCTION_20( &dword_183E58000,  v0,  v1,  "LSRestrictionsManager: [MCProfileConnection sharedConnection] returned nil",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_33();
}

void _LSServer_RefreshContentInFrameworkAtURL_cold_1()
{
}

void _LSUnregisterAppWithBundleID_cold_1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_23_0();
  int v3 = v0;
  OUTLINED_FUNCTION_16_0( &dword_183E58000,  v1,  (uint64_t)v1,  "LaunchServices: Failed to unregister app %@ with error %d",  v2);
  OUTLINED_FUNCTION_1();
}

void _LSUnregisterAppWithBundleID_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void handleSaveObserverBehavior_cold_1()
{
}

void _LSServer_UpdateDatabaseWithInfo_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138478083;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  v1,  v2,  "Error attempting to update bundle record for %{private}@: %{public}@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void _LSServer_UpdateDatabaseWithInfo_cold_2()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6_0();
  __int16 v3 = 1024;
  int v4 = v0;
  OUTLINED_FUNCTION_16_0( &dword_183E58000,  v1,  (uint64_t)v1,  "Could not create bundle record updater for %@ (placeholder %d): likely missing in the database",  v2);
  OUTLINED_FUNCTION_1();
}

void _LSServer_PerformExternalRebuildRegistration_cold_1()
{
}

void _LSServer_PerformExternalRebuildRegistration_cold_2(uint64_t a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  objc_opt_class();
  OUTLINED_FUNCTION_6_0();
  id v4 = v3;
  _os_log_error_impl(&dword_183E58000, a2, OS_LOG_TYPE_ERROR, "don't know how to register %@ yet", v5, 0xCu);

  OUTLINED_FUNCTION_16();
}

void _LSServer_NoteMigratorRunningInMigration_cold_1()
{
}

void _getBlockToUpdateBundleRecordFromMIAndNotifyIfChanged_cold_1()
{
}

void _LSServer_NoteTerminationRequestForMISync_cold_1()
{
}

void LSApplicationStateChangedCallback_cold_1()
{
}

void __LSApplicationWorkspacePluginsChangedCallback_block_invoke_cold_1()
{
}

void __LSApplicationWorkspacePluginsChangedCallback_block_invoke_cold_2()
{
}

void __unsubscribeFromLSAWDistributedNotification_block_invoke_cold_1()
{
}

void __pluginQueryFault_block_invoke_cold_1()
{
}

void _LSSetCrashReporterMessage_cold_1()
{
}

void ___getBlockToUpdatePluginRecordFromMIAndNotifyIfChanged_block_invoke_cold_1()
{
}

void _LSWriteBundlePlaceholderToURLInternal(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "Creating placeholder for bundle %@ with no iTunesMetadata.plist, this app cannot be recovered!",  (uint8_t *)&v2,  0xCu);
}

void LaunchServices::BindingEvaluation::getKindStringFromState(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_183E58000, log, OS_LOG_TYPE_ERROR, "getKindStringFromState result=nil ", v1, 2u);
}

void LaunchServices::BindingEvaluation::getKindStringFromState(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "Canonical string not found for kind string %@",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::BindingEvaluation::getKindStringFromState(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "isBetaApp bundle lookup error %d, node %@",  (uint8_t *)v3,  0x12u);
  OUTLINED_FUNCTION_1();
}

void ___ZL18_LSSetCrashMessageP8NSString_block_invoke_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _LSBundleFindWithNode_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_DEBUG,  "Bundle %{private}@ was not found by name. Doing a linear search for it.",  (uint8_t *)&v2,  0xCu);
}

void _LSBundleCopyOrCheckNode(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v3 = 136315651;
  uint64_t v4 = "_LSBundleCopyOrCheckNode";
  __int16 v5 = 2113;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "%s: error registering new node %{private}@: %{public}@",  (uint8_t *)&v3,  0x20u);
}

void _LSBundleGetLocalizedName_cold_1()
{
  OUTLINED_FUNCTION_3_3();
}

void _LSBundleGetLocalizedName_cold_2()
{
  OUTLINED_FUNCTION_3_3();
}

void _LSBundleGetLocalizedNameDictionary_cold_1()
{
  OUTLINED_FUNCTION_3_3();
}

void _LSBundleGetLocalizedNameDictionary_cold_2()
{
  OUTLINED_FUNCTION_3_3();
}

void _LSCreateResolvedURL_cold_1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_183E58000, v1, OS_LOG_TYPE_DEBUG, "failed to resolve symlinks in %@ <%@>", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void _LSCreateResolvedURL_cold_2()
{
}

void _LSCreateResolvedURL_cold_3()
{
}

void ___ZL15_LSContainerAddP9LSContextP6FSNodeP6NSDataS2_S4_tyhU13block_pointerFvjP7NSErrorE_block_invoke_cold_1()
{
}

void ___ZL15_LSContainerAddP9LSContextP6FSNodeP6NSDataS2_S4_tyhU13block_pointerFvjP7NSErrorE_block_invoke_cold_2()
{
}

void ___ZL15_LSContainerAddP9LSContextP6FSNodeP6NSDataS2_S4_tyhU13block_pointerFvjP7NSErrorE_block_invoke_cold_3( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZL15_LSContainerAddP9LSContextP6FSNodeP6NSDataS2_S4_tyhU13block_pointerFvjP7NSErrorE_block_invoke_cold_4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _LSCopyDataContainerURLFromContainermanager_cold_1()
{
}

void _LSCopyGroupContainerURLSFromContainermanager_cold_1()
{
}

void _LSCopyEnvironmentVariablesFromContainermanager_cold_1()
{
}

void _LSShouldFetchContainersFromContainermanagerForPersona_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl( &dword_183E58000,  log,  OS_LOG_TYPE_FAULT,  "No concrete persona found for system persona app",  v1,  2u);
}

void _LSShouldFetchContainersFromContainermanagerForPersona_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "No active persona/ system persona detected for system persona app",  v1,  2u);
}

void _LSSetLocalDatabaseIfNewer_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void _LSSetLocalDatabaseIfNewer_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void _LSDatabaseSetHeader()
{
}

void _LSDatabaseCreateWithAccessContext_cold_1(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *(void *)(a1 + 128);
  *(_DWORD *)a2 = 134217984;
  *(void *)(a2 + 4) = v3;
  OUTLINED_FUNCTION_4_3( &dword_183E58000,  a3,  (uint64_t)a3,  "Loaded LS database with sequence number %llu",  (uint8_t *)a2);
}

void _LSDatabaseCreateWithAccessContext_cold_2()
{
}

void _LSDatabaseCreateWithAccessContext_cold_3()
{
}

void _LSDatabaseCreateFromPersistentStore_cold_1()
{
}

void _LSDatabaseCreateFromPersistentStore_cold_2()
{
}

void _LSDatabaseCreateFromPersistentStore_cold_3()
{
}

void _LSDatabaseCreateRecoveryFile_cold_1(int *a1, uint8_t *buf, int a3, os_log_t log)
{
  int v4 = *a1;
  *(_DWORD *)__int128 buf = 136446722;
  *(void *)(buf + 4) = "void _LSDatabaseCreateRecoveryFile(NSURL *__strong)";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = v4;
  _os_log_fault_impl( &dword_183E58000,  log,  OS_LOG_TYPE_FAULT,  "%{public}s: ::close(%i) failed with error %i",  buf,  0x18u);
}

void _LSDatabaseCreateRecoveryFile_cold_2()
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_17_0();
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  __int16 v5 = 1024;
  int v6 = 2561;
  __int16 v7 = 1024;
  int v8 = 436;
  _os_log_error_impl( &dword_183E58000,  v1,  OS_LOG_TYPE_ERROR,  "%{public}s: warning: ::open_dprotected_np(%s, %x, %x) failed with EEXIST",  v2,  0x22u);
}

void _LSDatabaseCreateRecoveryFile_cold_3(uint64_t a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v4 = *a2;
  *(_DWORD *)__int128 buf = 136447234;
  *(void *)(buf + 4) = "void _LSDatabaseCreateRecoveryFile(NSURL *__strong)";
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 2561;
  *((_WORD *)buf + 14) = 1024;
  *(_DWORD *)(buf + 30) = 436;
  *((_WORD *)buf + 17) = 1024;
  *((_DWORD *)buf + 9) = v4;
  _os_log_fault_impl( &dword_183E58000,  log,  OS_LOG_TYPE_FAULT,  "%{public}s: ::open_dprotected_np(%s, %x, %x) failed with error %i",  buf,  0x28u);
}

void _LSDatabaseCreateFromPersistentStoreIgnoringRecoveryFile()
{
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_183E58000, v0, v1, "_LSCreateEmptyStore failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_183E58000, v0, v1, "_LSDatabaseCreate failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3( &dword_183E58000,  v0,  v1,  "_LSCreateStoreWithFileContents Failed with error %{public}@",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseDeleteRecoveryFile_cold_1(uint64_t a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v4 = *a2;
  *(_DWORD *)__int128 buf = 136446466;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v4;
  _os_log_fault_impl( &dword_183E58000,  log,  OS_LOG_TYPE_FAULT,  "Error: Failed to remove recovery file %{public}s with errno %d",  buf,  0x12u);
}

void _LSCreateStoreWithFileContents()
{
}

void _LSDatabaseClean()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_17_0();
  __int16 v2 = 2082;
  uint64_t v3 = "/System/Library/CoreServices/MobileCoreTypes.bundle";
  _os_log_error_impl(&dword_183E58000, v0, OS_LOG_TYPE_ERROR, "Error %ld registering path %{public}s", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseCommit_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3(&dword_183E58000, v0, v1, "NotifyToken::Post(%{public}@)", v2);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseCreateStringArrayCommon(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_11_0( &dword_183E58000,  a3,  (uint64_t)a3,  "Null string in input array while constructing string array, but the caller is OK with that.",  a1);
}

void _LSContextInitCommon()
{
}

{
  os_log_s *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3(&dword_183E58000, v0, v1, "Client database updated - seq#: %llu", v2);
  OUTLINED_FUNCTION_1();
}

void _LSContextInvalidate_cold_1()
{
}

void _LSContextInvalidate_cold_2(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_3(&dword_183E58000, a3, (uint64_t)a3, "Client database invalidated for session: %@", (uint8_t *)a2);
}

void _LSDatabaseSentinelIncrement_cold_1()
{
  OUTLINED_FUNCTION_20(&dword_183E58000, v0, v1, "sentinelCount == UINTMAX_MAX, aborting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void _LSDatabaseSentinelDecrement_cold_1()
{
  OUTLINED_FUNCTION_20(&dword_183E58000, v0, v1, "sentinelCount == 0, aborting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void _LSResetServer_cold_1()
{
}

void _LSResetServer_cold_2()
{
}

void _LSSetCrashReporterMessage()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3(&dword_183E58000, v0, v1, "%s", v2);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseCreateSnapshotAgainstAccessContext()
{
}

void ___ZL26_LSArmSaveTimerWithTimeouthdU13block_pointerFvbP11_LSDatabaseP7NSErrorE_block_invoke_cold_1()
{
}

void ___ZL26_LSArmSaveTimerWithTimeouthdU13block_pointerFvbP11_LSDatabaseP7NSErrorE_block_invoke_cold_2( void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)__int128 buf = 136446722;
  *(void *)(buf + 4) = "_LSSessionSave";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2114;
  *((void *)buf + 3) = a2;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "%{public}s: error saving database for session %@: %{public}@",  buf,  0x20u);
}

void ___ZL26_LSArmSaveTimerWithTimeouthdU13block_pointerFvbP11_LSDatabaseP7NSErrorE_block_invoke_cold_3()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_fault_impl( &dword_183E58000,  v1,  OS_LOG_TYPE_FAULT,  "Failed to save database to %{public}@: %{public}@",  v2,  0x16u);
  OUTLINED_FUNCTION_1();
}

void ___ZL26_LSArmSaveTimerWithTimeouthdU13block_pointerFvbP11_LSDatabaseP7NSErrorE_block_invoke_cold_4()
{
}

void ___ZL16_LSDatabaseRemapP11_LSDatabaseU13block_pointerFvbP7NSErrorP8NSStringE_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3( &dword_183E58000,  v0,  v1,  "_LSDatabaseCreateFromPersistentStore() returned error %{public}@",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_1();
}

void ___ZL16_LSDatabaseRemapP11_LSDatabaseU13block_pointerFvbP7NSErrorP8NSStringE_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3( &dword_183E58000,  v0,  v1,  "_LSDatabaseCreateByRemappingDatabase() returned error %{public}@",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_1();
}

void ___ZL16_LSDatabaseRemapP11_LSDatabaseU13block_pointerFvbP7NSErrorP8NSStringE_block_invoke_cold_3()
{
}

void _LSDatabaseContextStopAccessing_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_DEBUG,  "Stopping database access (depth %li)",  (uint8_t *)&v3,  0xCu);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseContextStartAccessingWithDomain_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_debug_impl( &dword_183E58000,  log,  OS_LOG_TYPE_DEBUG,  "Starting database access (depth %li, options: %llx)",  (uint8_t *)&v4,  0x16u);
  OUTLINED_FUNCTION_1();
}

void getXPCObjectForNodeAndStore(id *a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = *a1;
  int v5 = 138412290;
  id v6 = v3;
  OUTLINED_FUNCTION_5( &dword_183E58000,  a2,  v4,  "could not create XPC representation of store while making XPC object: %@",  (uint8_t *)&v5);
}

void getXPCObjectForNodeAndStore(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_5( &dword_183E58000,  a2,  a3,  "could not get file system representation of store node while making XPC object: %@",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void _LSContextCreateVisualizer_cold_1(void *a1, uint8_t *a2, void *a3, os_log_s *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_4_3(&dword_183E58000, a4, (uint64_t)a3, "No functions for table %{public}@", a2);
}

void ___ZN14LaunchServices21DatabaseVisualizationL14getAllHandlersEP9LSContext_block_invoke_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_4_3( &dword_183E58000,  a2,  a3,  "Table %{public}@ has no handler functions and will not display well in CSStore Viewer.",  (uint8_t *)&v3);
}

void _LSDefaultsBaseSystemContainerURL_cold_1(uint64_t *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v4 = 136446722;
  uint64_t v5 = "NSURL *_LSDefaultsBaseSystemContainerURL(void)";
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  __int16 v8 = 2082;
  uint64_t v9 = a2;
  OUTLINED_FUNCTION_4_4( &dword_183E58000,  a3,  (uint64_t)a3,  "%{public}s: error %llu getting container path: %{public}s",  (uint8_t *)&v4);
}

void emitSandboxExceptionAndMaybeAbortForSneakyURLUsage_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void LaunchServices::DMFSupport::getPoliciesWithCompletionHandler( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN14LaunchServices10DMFSupportL17reloadAllPoliciesEP27DMFApplicationPolicyMonitor_block_invoke_cold_1()
{
}

void ___ZN14LaunchServices10DMFSupportL17reloadAllPoliciesEP27DMFApplicationPolicyMonitor_block_invoke_cold_2()
{
}

void LaunchServices::DMFSupport::addKnownPoliciesToCache()
{
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_4( &dword_183E58000,  v0,  v1,  "No changes in DMF, so not posting a notification",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_33();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1( &dword_183E58000,  v0,  v1,  "DMF policy changed, so posting a notification: %{private}@",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_1();
}

void ___ZN14LaunchServices10DMFSupportL32getPoliciesWithCompletionHandlerEP5NSSetIP8NSStringEhU13block_pointerFvP12NSDictionaryIS3_P8NSNumberEP7NSErrorE_block_invoke_cold_1()
{
}

void ___ZN14LaunchServices10DMFSupportL32getPoliciesWithCompletionHandlerEP5NSSetIP8NSStringEhU13block_pointerFvP12NSDictionaryIS3_P8NSNumberEP7NSErrorE_block_invoke_cold_2()
{
}

void _LSDServiceGetXPCProxyForServiceClass_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _LSCopyServerStore_cold_1()
{
}

void _LSCopyServerStore_cold_2()
{
}

void _LSCopyServerStore_cold_3()
{
}

void _LSCopyServerStore_cold_4()
{
}

void _LSIsAuditTokenSandboxed_cold_1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_FAULT,  "sandbox_check_by_audit_token failed in lsd! That's a bad bug! errno=%d",  (uint8_t *)v2,  8u);
}

void _LSEnumeratorFireErrorHandler_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(&dword_183E58000, v0, (uint64_t)v0, "Error during enumeration of %{private}@: %{public}@", v1);
  OUTLINED_FUNCTION_1();
}

void _LSDBEnumeratorPrepareIfNeeded_cold_1(uint64_t a1, void *a2, uint64_t a3, os_log_s *a4)
{
  *(_DWORD *)a3 = 138478083;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4_0( &dword_183E58000,  a4,  a3,  "Failed to get DB when preparing enumerator %{private}@: %{public}@",  (uint8_t *)a3);
}

void _LSDBEnumeratorPrepareIfNeeded_cold_2(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_183E58000, a2, OS_LOG_TYPE_DEBUG, "Prepared enumerator %{private}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _LSDBEnumeratorPrepareIfNeeded_cold_3()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(&dword_183E58000, v0, (uint64_t)v0, "Failed to prepare enumerator %{private}@: %{public}@", v1);
  OUTLINED_FUNCTION_1();
}

void _LSGetOSStatusFromNSError_cold_1()
{
}

void _LSGetOSStatusFromNSError_cold_2( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _LSGetOSStatusFromNSError_cold_3( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _LSGetNSErrorFromOSStatusImpl_cold_1()
{
}

void _LSCopyUserActivityDomainNamesForBundleID_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 136446466;
  uint64_t v3 = "CFArrayRef _LSCopyUserActivityDomainNamesForBundleID(CFStringRef)";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_183E58000, a2, OS_LOG_TYPE_ERROR, "Error in %{public}s: %{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void ___ZL22initActivationObserverv_block_invoke_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZL29pluginKitUserElectionStoreURLv_block_invoke_cold_1(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v4 = 134217984;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_5(&dword_183E58000, a2, a3, "Failed to get storage container: error=%llu", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void ___ZL29pluginKitUserElectionStoreURLv_block_invoke_223_cold_1(void *a1, uint64_t a2)
{
}

void ___ZL29pluginKitUserElectionStoreURLv_block_invoke_223_cold_2()
{
}

void LSDefaultAppCategoryForMask_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void LSDefaultAppCategoryMaskForCategory_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void LaunchServices::LocalizedString::localizeUnsafely(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *__int128 buf = 0;
  *a2 = 0;
  _os_log_debug_impl( &dword_183E58000,  log,  OS_LOG_TYPE_DEBUG,  "kLSDefaultLocalizedValueKey encountered in matching localizations set.",  buf,  2u);
}

void ___ZL78_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcessesv_block_invoke_cold_1( os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "This process does not have access to the user's preferred locales, yet it is requesting localized strings from Launc h Services with no specified input locales. This is a problem for correctness and performance. This message will be logged only once in this process.",  v1,  2u);
}

void _LSCopierCallback(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_183E58000, a2, OS_LOG_TYPE_DEBUG, "Unknown MDTCopierCallbackType %d", (uint8_t *)v2, 8u);
}

void anonymous namespace'::StagedFileResource::~StagedFileResource(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "Unable to remove open staging container %@: %@",  (uint8_t *)&v4,  0x16u);
}

void makeStagingDirectoryURLInContainer(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "could not create new mailbox directory: %@",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_1();
}

void makeStagingDirectoryURLInContainer()
{
}

void makeStagingDirectoryURLInContainer(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  a2,  a3,  "Unexpected failure to create %{public}@: %{public}@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void ___ZL34makeStagingDirectoryURLInContainerP5NSURLPU15__autoreleasingP7NSError_block_invoke_cold_1()
{
  int v3 = 138543874;
  uint64_t v4 = v0;
  __int16 v5 = 2080;
  __int16 v6 = "makeStagingDirectoryURLInContainer_block_invoke";
  __int16 v7 = 2114;
  uint64_t v8 = v1;
  _os_log_error_impl( &dword_183E58000,  v2,  OS_LOG_TYPE_ERROR,  "could not remove %{public}@ in %s: %{public}@",  (uint8_t *)&v3,  0x20u);
}

void _LSOpenOperationPerform(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)__int128 buf = 138478083;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2113;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl( &dword_183E58000,  log,  OS_LOG_TYPE_DEBUG,  "Default handler for node %{private}@ is already set to %{private}@",  buf,  0x16u);
}

void ___ZL23_LSUpdateDefaultHandlerP18LSApplicationProxyP5NSURL_block_invoke_cold_1()
{
}

void _LSPersistentIdentifierCompare_cold_1()
{
}

void _LSPersistentIdentifierCompare_cold_2()
{
}

void _LSPlistDataGetHint_cold_1(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 134217984;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_4_3(&dword_183E58000, a2, a3, "Getting plist hint for data %p", (uint8_t *)&v3);
}

void _LSPlistDataGetValuesForKeys_cold_1(void *a1, uint64_t a2, os_log_s *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_3( &dword_183E58000,  a3,  (uint64_t)a3,  "Keys { %{public}@ } were requested and require us to take a slow path.",  (uint8_t *)a2);
}

void _LSPlistDataGetValuesForKeys_cold_2(void *a1, uint64_t a2, os_log_s *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_3( &dword_183E58000,  a3,  (uint64_t)a3,  "Got values for keys { %{public}@ } from CF SPI (fast path).",  (uint8_t *)a2);
}

void ___ZL24_LSPlistGetCommonStringsv_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "Unable to get a list of common plist strings from the Launch Services framework. Plists may encode/decode erratically.",  v1,  2u);
}

void _LSPluginIsValid_cold_1(unsigned int a1, unsigned int *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a2;
  int v4 = 134218240;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "Plugin %llx has invalid parent app %llx",  (uint8_t *)&v4,  0x16u);
  OUTLINED_FUNCTION_1();
}

void __pluginQueryFault_block_invoke_cold_1_0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_183E58000, log, OS_LOG_TYPE_FAULT, "59638328 Plugin query method called", v1, 2u);
}

void getValueForKeyFromPlugin( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZL16pluginQueryFaultv_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_183E58000, log, OS_LOG_TYPE_FAULT, "59638328 Plugin query method called", v1, 2u);
  OUTLINED_FUNCTION_33();
}

void ___ZL39getkMISMinSupportedSignatureVersion_ptrv_block_invoke_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZL39getkMISMinSupportedSignatureVersion_ptrv_block_invoke_cold_2( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void LaunchServices::PrefsStorage::_needsUpdate(void *a1, uint64_t a2, os_log_s *a3)
{
  LODWORD(OUTLINED_FUNCTION_1_0(&dword_183E58000, v0, v1, "Persistent identifiers %p and %p are from the same database", v2, v3) = 134218240;
  *(void *)((char *)&v3 + 4) = *a1;
  WORD6(OUTLINED_FUNCTION_1_0(&dword_183E58000, v0, v1, "Persistent identifiers %p and %p are from the same database", v2, v3) = 2048;
  HIWORD(OUTLINED_FUNCTION_1_0(&dword_183E58000, v0, v1, "Persistent identifiers %p and %p are from the same database", v2, v3) = a2;
  OUTLINED_FUNCTION_1_0( &dword_183E58000,  a2,  a3,  "Prefs notify token value changed from %llu to %llu: needs update.",  (void)v3,  *((void *)&v3 + 1));
  OUTLINED_FUNCTION_1();
}

void ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke_2_cold_1()
{
}

void LaunchServices::PrefsStorage::_updateOtherProcesses()
{
}

void LaunchServices::PrefsStorage::_setNeedsUpdate(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( &dword_183E58000,  log,  OS_LOG_TYPE_DEBUG,  "Cleared prefs notify token value to a nonsensical state to force an update on next call.",  v1,  2u);
}

void LaunchServices::PrefsStorage::_GetBundleIdentifierWithAppNode()
{
}

void LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray()
{
}

{
  uint64_t v0;
  os_log_t v1;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_0(&dword_183E58000, v0, v1, "Inserting app node %{private}@ with value %{private}@ into prefs.");
  OUTLINED_FUNCTION_1();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_183E58000, v0, v1, "Deleting app node %{private}@ from prefs.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::PrefsStorage::setValueForNode()
{
}

void _LSFindOrRegisterBundleNode_cold_1(uint64_t *a1, unsigned int a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_debug_impl( &dword_183E58000,  log,  OS_LOG_TYPE_DEBUG,  "Skipping check that bundleData (%p) != NULL because we don't expect we'll have a valid pointer (caller didn't ask us (%llx) to reinitialize LS database context, so data is known-stale)",  (uint8_t *)&v4,  0x16u);
}

void _LSServerItemInfoRegistration_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "LaunchServices: Asked to register a plugin at path %s with no CFBundleIdentifier in their plist.",  (uint8_t *)&v2,  0xCu);
}

void _LSSchemeApprovalBundleIsAppleInternal(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "Error fetching bundle record for scheme approval: %@",  (uint8_t *)&v2,  0xCu);
}

void _LSServer_RegisterItemInfo_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  int v3 = 136446722;
  uint64_t v4 = "OSStatus _LSServer_RegisterItemInfo(const LSRegistrationInfo *__strong, NSData *__strong, CFDictionaryRef, CFDict"
       "ionaryRef, CSStoreUnitID *, CSStoreUnitID *, Boolean *, CFStringRef *)";
  __int16 v5 = 2048;
  uint64_t v6 = 7LL;
  __int16 v7 = 2048;
  uint64_t v8 = v2;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "%{public}s: registration info version should be %llu but is %llu",  (uint8_t *)&v3,  0x20u);
}

void _LSServerMain_cold_1(os_log_s *a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v2 = __error();
  int v3 = strerror(*v2);
  int v5 = 136315394;
  uint64_t v6 = "com.apple.lsd.firstboot";
  __int16 v7 = 2080;
  uint64_t v8 = v3;
  OUTLINED_FUNCTION_4_0(&dword_183E58000, a1, v4, "Failed to create semaphore %s: %s", (uint8_t *)&v5);
}

void _LSServerMain_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "Previous sync was interrupted, presumably by a reboot. Removing any extant recovery file.",  v1,  2u);
}

void _LSServerMain_cold_3(uint64_t a1, os_log_s *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [(id)__LSDefaultsGetSharedInstance() databaseContainerDirectoryURL];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_8();
  uint64_t v7 = a1;
  OUTLINED_FUNCTION_4_0(&dword_183E58000, a2, v5, "Error fetching directory contents at path: %@ %@", v6);
}

void _LSServerMain_cold_4(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_FAULT,  "could not set secure preferences class D: %@",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_1();
}

void _LSServerMain_cold_5(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "setiopolicy_np failed (%d), continuing and hoping for the best",  (uint8_t *)v2,  8u);
}

void __listenForSigterm_block_invoke_cold_1()
{
}

void __listenForSigterm_block_invoke_6_cold_1()
{
}

void __listenForSigterm_block_invoke_6_cold_2()
{
}

void __performFirstBootWorkIfNecessary_block_invoke_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_183E58000, a2, OS_LOG_TYPE_ERROR, "Unable to get database: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void ___ZL18_LSSetCrashMessageP8NSString_block_invoke_cold_1_0(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_183E58000, a2, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _LSServer_GetiCloudHostNames_cold_1()
{
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_33();
}

void _LSServer_GetiCloudHostNames_cold_2()
{
}

void LaunchServices::URLOverrides::getiCloudHostNamesFromPlistAtURL(uint64_t a1)
{
  LODWORD(OUTLINED_FUNCTION_1_0(&dword_183E58000, v0, v1, "Persistent identifiers %p and %p are from the same database", v2, v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  v1,  v2,  "Error loading iCloud hosts plist from %{public}@: %{public}@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void LaunchServices::URLOverrides::getiCloudHostNamesFromPlistAtURL()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl( &dword_183E58000,  v0,  OS_LOG_TYPE_ERROR,  "Error loading iCloud hosts plist from %{public}@: value was missing or not an array",  v1,  0xCu);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::URLOverrides::State::State()
{
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_4(&dword_183E58000, v0, v1, "Getting iCloud hostnames list from lsd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_cold_1(uint64_t a1)
{
  LODWORD(OUTLINED_FUNCTION_1_0(&dword_183E58000, v0, v1, "Persistent identifiers %p and %p are from the same database", v2, v3) = 138478083;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  v1,  v2,  "XPC error getting URL override for %{private}@: %{public}@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_180_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_180_cold_2(uint64_t a1)
{
  LODWORD(OUTLINED_FUNCTION_1_0(&dword_183E58000, v0, v1, "Persistent identifiers %p and %p are from the same database", v2, v3) = 138478083;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_0( &dword_183E58000,  v1,  v2,  "Error getting URL override for %{private}@: %{public}@",  (void)v3,  DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void ___ZN14LaunchServices12URLOverridesL18checkForiCloudHostEP15NSURLComponents_block_invoke_cold_1()
{
}

void LaunchServices::URLPropertyProvider::prepareLocalizedNameValue(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)__int128 buf = 138477827;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl( &dword_183E58000,  log,  OS_LOG_TYPE_DEBUG,  "Not localizing name for %{private}@ because we are in _LSContextInit() and recursion/deadlock would occur.",  buf,  0xCu);
}

void LaunchServices::URLPropertyProvider::prepareDistinctLocalizedNameValue( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void LaunchServices::URLPropertyProvider::prepareLocalizedNameDictionaryValue( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void LaunchServices::URLPropertyProvider::prepareLocalizedTypeDescriptionDictionaryValue( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void LaunchServices::URLPropertyProvider::prepareArchitecturesValue( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void LaunchServices::URLPropertyProvider::prepareVolumeLocalizedNameValue( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void LaunchServices::URLPropertyProvider::prepareApplicationDeviceManagementPolicyValue( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _LSIsKindOfClasses_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _UTTypePrecachePropertiesOfIdentifiers_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 136446210;
  uint64_t v2 = "void _UTTypePrecachePropertiesOfIdentifiers(CFArrayRef)";
  _os_log_error_impl( &dword_183E58000,  log,  OS_LOG_TYPE_ERROR,  "%{public}s is a no-op. Use the UniformTypeIdentifiers framework to get instances of the UTType class instead.",  (uint8_t *)&v1,  0xCu);
}

void _UTTypeAddWithDeclarationDictionary_cold_1(void *a1, void *a2, uint64_t a3, os_log_s *a4)
{
  id v7 = a2;
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = v7;
  _os_log_error_impl( &dword_183E58000,  a4,  OS_LOG_TYPE_ERROR,  "Application %@ declares a type %@ without correct conformance to a file system type such as public.data. This is a bug in the application.",  (uint8_t *)a3,  0x16u);
}

void LaunchServices::TypeEvaluator::setSniffIfNeeded(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_fault_impl(&dword_183E58000, log, OS_LOG_TYPE_FAULT, "type evaluator can't sniff without doing IO", v1, 2u);
}

uint64_t CCDeriveKey()
{
  return MEMORY[0x1895F8138]();
}

void CCHmac( CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

uint64_t CCKDFParametersCreateHkdf()
{
  return MEMORY[0x1895F81E8]();
}

uint64_t CCKDFParametersDestroy()
{
  return MEMORY[0x1895F81F0]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F8270](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F8290](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F82D0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F8310](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1896025D8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1896025F8]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x189602640](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x189602658](allocator, capacity, theArray);
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

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x189602730](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1896027E8](bundle);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1896027F0](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x189602800](bundle);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x189602808](url);
}

CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL)
{
  return (CFDictionaryRef)MEMORY[0x189602810](bundleURL);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x189602820](locArray, prefArray);
}

CFStringRef CFBundleCopyLocalizedString( CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x189602828](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL( CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x189602850](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourceURLForLocalization( CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x189602858](bundle, resourceName, resourceType, subDirName, localizationName);
}

CFURLRef CFBundleCopySupportFilesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x189602898](bundle);
}

CFStringRef CFBundleGetDevelopmentRegion(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1896028C0](bundle);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1896028D0](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1896028D8](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1896028F0]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x189602908](bundle, key);
}

void CFCharacterSetAddCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange)
{
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
}

CFCharacterSetRef CFCharacterSetCreateCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x189602980](alloc, theSet);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutable(CFAllocatorRef alloc)
{
  return (CFMutableCharacterSetRef)MEMORY[0x189602990](alloc);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x189602A10](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy( CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x189602A80](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x189602B90](theDict, key);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x189602BB0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy( CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFErrorRef CFErrorCreate( CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x189602C60](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues( CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x189602C68](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFFileDescriptorRef CFFileDescriptorCreate( CFAllocatorRef allocator, CFFileDescriptorNativeDescriptor fd, Boolean closeOnInvalidate, CFFileDescriptorCallBack callout, const CFFileDescriptorContext *context)
{
  return (CFFileDescriptorRef)MEMORY[0x189602C90](allocator, *(void *)&fd, closeOnInvalidate, callout, context);
}

CFRunLoopSourceRef CFFileDescriptorCreateRunLoopSource( CFAllocatorRef allocator, CFFileDescriptorRef f, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x189602C98](allocator, f, order);
}

void CFFileDescriptorDisableCallBacks(CFFileDescriptorRef f, CFOptionFlags callBackTypes)
{
}

void CFFileDescriptorEnableCallBacks(CFFileDescriptorRef f, CFOptionFlags callBackTypes)
{
}

CFFileDescriptorNativeDescriptor CFFileDescriptorGetNativeDescriptor(CFFileDescriptorRef f)
{
  return MEMORY[0x189602CB0](f);
}

void CFFileDescriptorInvalidate(CFFileDescriptorRef f)
{
}

CFFileSecurityRef CFFileSecurityCreate(CFAllocatorRef allocator)
{
  return (CFFileSecurityRef)MEMORY[0x189602CD8](allocator);
}

Boolean CFFileSecuritySetMode(CFFileSecurityRef fileSec, mode_t mode)
{
  return MEMORY[0x189602D10](fileSec, mode);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x189602D18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x189602D50](cf);
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x189602D70]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x189602D78](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString( CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x189602D80](allocator, localeIdentifier);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x189602D98]();
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x189602DB8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort( CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x189602DC0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x189602DD0](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
}

void CFNotificationCenterAddObserver( CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x189602E50]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x189602E58]();
}

void CFNotificationCenterPostNotification( CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterPostNotificationWithOptions( CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
}

void CFNotificationCenterRemoveObserver( CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x189602F68](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue( CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x189602F98](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue( CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x189602FC0](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateDeepCopy( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x189602FD8](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateFromXMLData( CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x189602FE8](allocator, xmlData, mutabilityOption, errorString);
}

CFPropertyListRef CFPropertyListCreateWithStream( CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189603000](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWriteToStream( CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFStringRef *errorString)
{
  return MEMORY[0x189603020](propertyList, stream, format, errorString);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x189603050](alloc, bytes, length, bytesDeallocator);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x189603060](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x189603098](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x189603138]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopRunResult CFRunLoopRunInMode( CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x189603198](mode, returnAfterSourceHandled, seconds);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFSetRef CFSetCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x189603250](allocator, values, numValues, callBacks);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x189603258](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x189603260](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x189603270](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x189603278]();
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFShow(CFTypeRef obj)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions( CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C8](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

UInt32 CFStringConvertEncodingToWindowsCodepage(CFStringEncoding encoding)
{
  return MEMORY[0x1896033E8](*(void *)&encoding);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x189603418](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x189603438](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x189603450](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x189603478](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithCharactersNoCopy( CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x189603480](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x189603488](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1896034A8](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1896034C0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.CFIndex location = v3;
  return result;
}

CFIndex CFStringFindAndReplace( CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896034C8]( theString,  stringToFind,  replacementString,  rangeToSearch.location,  rangeToSearch.length,  compareOptions);
}

Boolean CFStringFindWithOptions( CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1896034D8]( theString,  stringToFind,  rangeToSearch.location,  rangeToSearch.length,  searchOptions,  result);
}

CFIndex CFStringGetBytes( CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1896034F0]( theString,  range.location,  range.length,  *(void *)&encoding,  lossByte,  isExternalRepresentation,  buffer,  maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x189603510](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x189603520](theString);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603538](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFIndex v2 = MEMORY[0x189603580](theString, theIndex);
  result.length = v3;
  result.CFIndex location = v2;
  return result;
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1896035A0](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1896035A8](theString, suffix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x189603618](tokenizer);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return (CFTypeRef)MEMORY[0x189603628](tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate( CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x189603630](alloc, string, range.location, range.length, options, locale);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x189603650](string, range, transform, reverse);
}

void CFStringTrim(CFMutableStringRef theString, CFStringRef trimString)
{
}

void CFURLClearResourcePropertyCacheForKey(CFURLRef url, CFStringRef key)
{
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1896036B0](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1896036B8](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1896036D0](url);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1896036F8](url);
}

Boolean CFURLCopyResourcePropertyForKey( CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x189603708](url, key, propertyValueTypeRefPtr, error);
}

CFURLRef CFURLCreateCopyAppendingPathComponent( CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603748](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentation( CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603780](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase( CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x189603788](allocator, buffer, bufLen, isDirectory, baseURL);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes( CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1896037A8](allocator, originalString, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithFileSystemPath( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1896037C0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1896037C8](allocator, filePath, pathStyle, isDirectory, baseURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1896037D0](allocator, URLString, baseURL);
}

CFURLEnumeratorRef CFURLEnumeratorCreateForDirectoryURL( CFAllocatorRef alloc, CFURLRef directoryURL, CFURLEnumeratorOptions option, CFArrayRef propertyKeys)
{
  return (CFURLEnumeratorRef)MEMORY[0x1896037D8](alloc, directoryURL, option, propertyKeys);
}

CFURLEnumeratorResult CFURLEnumeratorGetNextURL( CFURLEnumeratorRef enumerator, CFURLRef *url, CFErrorRef *error)
{
  return MEMORY[0x1896037F0](enumerator, url, error);
}

Boolean CFURLGetFileSystemRepresentation( CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603818](url, resolveAgainstBase, buffer, maxBufLen);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x189603830]();
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x189603838](anURL);
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x189603848](url, error);
}

Boolean CFURLSetResourcePropertyForKey( CFURLRef url, CFStringRef key, CFTypeRef propertyValue, CFErrorRef *error)
{
  return MEMORY[0x189603858](url, key, propertyValue, error);
}

void CFURLSetTemporaryResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x189603870](alloc);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x189603878](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

CFUserNotificationRef CFUserNotificationCreate( CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1896038D0](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationDisplayAlert( CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1896038E0]( flags,  iconURL,  soundURL,  localizationURL,  alertHeader,  alertMessage,  defaultButtonTitle,  alternateButtonTitle,  timeout);
}

SInt32 CFUserNotificationReceiveResponse( CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x189603900](userNotification, responseFlags, timeout);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x189603920](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x189603930](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x189603960](stream);
}

uint64_t CSMapAddMapTable()
{
  return MEMORY[0x18960DCD0]();
}

uint64_t CSMapGetHeader()
{
  return MEMORY[0x18960DCD8]();
}

uint64_t CSMapInit()
{
  return MEMORY[0x18960DCE0]();
}

uint64_t CSMapRemoveValue()
{
  return MEMORY[0x18960DCE8]();
}

uint64_t CSMapSetValue()
{
  return MEMORY[0x18960DCF0]();
}

uint64_t CSMapWriteToHeader()
{
  return MEMORY[0x18960DCF8]();
}

uint64_t CSStoreAllocUnit()
{
  return MEMORY[0x18960DD00]();
}

uint64_t CSStoreAllocUnitWithData()
{
  return MEMORY[0x18960DD08]();
}

uint64_t CSStoreCreateMutable()
{
  return MEMORY[0x18960DD10]();
}

uint64_t CSStoreCreateMutableCopy()
{
  return MEMORY[0x18960DD18]();
}

uint64_t CSStoreFreeUnit()
{
  return MEMORY[0x18960DD20]();
}

uint64_t CSStoreGetGeneration()
{
  return MEMORY[0x18960DD28]();
}

uint64_t CSStoreGetHeader()
{
  return MEMORY[0x18960DD30]();
}

uint64_t CSStoreGetUnit()
{
  return MEMORY[0x18960DD38]();
}

uint64_t CSStringBindingCopyCFStrings()
{
  return MEMORY[0x18960DD40]();
}

uint64_t CSStringBindingFindStringAndBindings()
{
  return MEMORY[0x18960DD48]();
}

uint64_t CSStringBindingRemoveBindings()
{
  return MEMORY[0x18960DD50]();
}

uint64_t CSStringBindingSetBindings()
{
  return MEMORY[0x18960DD58]();
}

uint64_t CSStringBindingStoreAddTable()
{
  return MEMORY[0x18960DD60]();
}

uint64_t CSStringBindingStoreInit()
{
  return MEMORY[0x18960DD68]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1896136F0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x189607458](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1896076C8]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1896076F0](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x189607718](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1896077B0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.CFIndex location = v2;
  return result;
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x18960C3F8](allocator, name, prefsID);
}

CFDictionaryRef SCPreferencesPathGetValue(SCPreferencesRef prefs, CFStringRef path)
{
  return (CFDictionaryRef)MEMORY[0x18960C420](prefs, path);
}

uint64_t SecCertificateCopyCommonNames()
{
  return MEMORY[0x18960B250]();
}

uint64_t SecPolicyCreateAppleIDAuthorityPolicy()
{
  return MEMORY[0x18960B558]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x18960B5F8](rnd, count, bytes);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x18960B6B8](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x18960B6C8](trust, result);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleLocalizationsAddingDevelopmentLocalization()
{
  return MEMORY[0x1896040F0]();
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1896040F8]();
}

uint64_t _CFBundleCopyExecutableURLInDirectory()
{
  return MEMORY[0x189604100]();
}

uint64_t _CFBundleCopyFileTypeForFileURL()
{
  return MEMORY[0x189604108]();
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x189604128]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x189604168]();
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x189604170]();
}

uint64_t _CFCopySystemVersionPlatformDictionary()
{
  return MEMORY[0x189604248]();
}

uint64_t _CFGetEUID()
{
  return MEMORY[0x1896042F8]();
}

uint64_t _CFGetPathExtensionRangesFromPathComponent()
{
  return MEMORY[0x189604300]();
}

uint64_t _CFPropertyListCopyTopLevelKeys()
{
  return MEMORY[0x1896044C0]();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1896044C8]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x189604550]();
}

uint64_t _CFRuntimeGetClassWithTypeID()
{
  return MEMORY[0x189604558]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x189604568]();
}

uint64_t _CFStringGetUserDefaultEncoding()
{
  return MEMORY[0x1896045D8]();
}

uint64_t _CFURLBookmarkCopyDescription()
{
  return MEMORY[0x189604628]();
}

uint64_t _CFURLCopyPromiseURLOfLogicalURL()
{
  return MEMORY[0x189604690]();
}

uint64_t _CFURLCopyResourcePropertyForKeyFromCache()
{
  return MEMORY[0x1896046B0]();
}

uint64_t _CFURLCopyResourcePropertyValuesAndFlags()
{
  return MEMORY[0x1896046B8]();
}

uint64_t _CFURLCreateStandardError()
{
  return MEMORY[0x1896046F8]();
}

uint64_t _CFURLFileCacheClearPropertyValueForKey()
{
  return MEMORY[0x189604710]();
}

uint64_t _CFURLFileCacheGetFinderInfo()
{
  return MEMORY[0x189604718]();
}

uint64_t _CFURLFileCacheGetFlags()
{
  return MEMORY[0x189604720]();
}

uint64_t _CFURLFileCacheGetName()
{
  return MEMORY[0x189604728]();
}

uint64_t _CFURLFileCacheGetPropertyValueForKey()
{
  return MEMORY[0x189604730]();
}

uint64_t _CFURLFileCacheSetPropertyValueForKey()
{
  return MEMORY[0x189604738]();
}

uint64_t _CFURLGetResourcePropertyFlags()
{
  return MEMORY[0x189604748]();
}

uint64_t _CFURLIsFileURL()
{
  return MEMORY[0x189604758]();
}

uint64_t _CFURLRegisterFilePropertyProvider()
{
  return MEMORY[0x189604790]();
}

uint64_t _CFURLRegisterFilePropertyWithOptions()
{
  return MEMORY[0x189604798]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

uint64_t _CSArrayAppendValue()
{
  return MEMORY[0x18960DD88]();
}

uint64_t _CSArrayCreate()
{
  return MEMORY[0x18960DD90]();
}

uint64_t _CSArrayCreateWithCapacity()
{
  return MEMORY[0x18960DD98]();
}

uint64_t _CSArrayDispose()
{
  return MEMORY[0x18960DDA0]();
}

uint64_t _CSArrayEnumerateAllValues()
{
  return MEMORY[0x18960DDA8]();
}

uint64_t _CSArrayGetCount()
{
  return MEMORY[0x18960DDB0]();
}

uint64_t _CSArrayGetValueAtIndex()
{
  return MEMORY[0x18960DDB8]();
}

uint64_t _CSArrayInsertValueAtIndex()
{
  return MEMORY[0x18960DDC0]();
}

uint64_t _CSArrayRemoveValueAtIndex()
{
  return MEMORY[0x18960DDC8]();
}

uint64_t _CSCopyStringForCharacters()
{
  return MEMORY[0x18960DDD0]();
}

uint64_t _CSGetConstStringForCharacters()
{
  return MEMORY[0x18960DDD8]();
}

uint64_t _CSGetStringForCharacters()
{
  return MEMORY[0x18960DDE0]();
}

uint64_t _CSMapCopyDebugDescription()
{
  return MEMORY[0x18960DDE8]();
}

uint64_t _CSStoreAccessContextAccessForRead()
{
  return MEMORY[0x18960DDF0]();
}

uint64_t _CSStoreAccessContextAssertReading()
{
  return MEMORY[0x18960DDF8]();
}

uint64_t _CSStoreAccessContextAssertWriting()
{
  return MEMORY[0x18960DE00]();
}

uint64_t _CSStoreAccessContextCreateSharedReadingContext()
{
  return MEMORY[0x18960DE08]();
}

uint64_t _CSStoreAccessContextCreateWithLock()
{
  return MEMORY[0x18960DE10]();
}

uint64_t _CSStoreAddTable()
{
  return MEMORY[0x18960DE18]();
}

uint64_t _CSStoreCopyDebugDescriptionOfBytesInRange()
{
  return MEMORY[0x18960DE20]();
}

uint64_t _CSStoreCopyDebugDescriptionOfUnit()
{
  return MEMORY[0x18960DE28]();
}

uint64_t _CSStoreCopyMemoryStatistics()
{
  return MEMORY[0x18960DE30]();
}

uint64_t _CSStoreCopyTableName()
{
  return MEMORY[0x18960DE38]();
}

uint64_t _CSStoreCreateDataWithUnitNoCopy()
{
  return MEMORY[0x18960DE40]();
}

uint64_t _CSStoreCreateWithURL()
{
  return MEMORY[0x18960DE48]();
}

uint64_t _CSStoreCreateWithXPCRepresentation()
{
  return MEMORY[0x18960DE50]();
}

uint64_t _CSStoreCreateXPCRepresentation()
{
  return MEMORY[0x18960DE58]();
}

uint64_t _CSStoreEnumerateTables()
{
  return MEMORY[0x18960DE60]();
}

uint64_t _CSStoreEnumerateUnits()
{
  return MEMORY[0x18960DE68]();
}

uint64_t _CSStoreGarbageCollect()
{
  return MEMORY[0x18960DE70]();
}

uint64_t _CSStoreGetArrayTable()
{
  return MEMORY[0x18960DE78]();
}

uint64_t _CSStoreGetCatalogTable()
{
  return MEMORY[0x18960DE80]();
}

uint64_t _CSStoreGetStringTable()
{
  return MEMORY[0x18960DE88]();
}

uint64_t _CSStoreGetTableWithName()
{
  return MEMORY[0x18960DE90]();
}

uint64_t _CSStoreGetXPCClass()
{
  return MEMORY[0x18960DE98]();
}

uint64_t _CSStoreIsMutable()
{
  return MEMORY[0x18960DEA0]();
}

uint64_t _CSStoreSetExpectedAccessContext()
{
  return MEMORY[0x18960DEA8]();
}

uint64_t _CSStoreSetMutable()
{
  return MEMORY[0x18960DEB0]();
}

uint64_t _CSStoreSetUnitIdentifierExhaustionHandler()
{
  return MEMORY[0x18960DEB8]();
}

uint64_t _CSStoreValidate()
{
  return MEMORY[0x18960DEC0]();
}

uint64_t _CSStoreWriteToHeader()
{
  return MEMORY[0x18960DEC8]();
}

uint64_t _CSStoreWriteToURL()
{
  return MEMORY[0x18960DED0]();
}

uint64_t _CSStoreWriteToUnit()
{
  return MEMORY[0x18960DED8]();
}

uint64_t _CSStringBindingEnumerate()
{
  return MEMORY[0x18960DEE0]();
}

uint64_t _CSStringBindingEnumerateAllBindings()
{
  return MEMORY[0x18960DEE8]();
}

uint64_t _CSStringBindingGetBindings()
{
  return MEMORY[0x18960DEF0]();
}

uint64_t _CSStringCopyCFString()
{
  return MEMORY[0x18960DEF8]();
}

uint64_t _CSStringIsValid()
{
  return MEMORY[0x18960DF00]();
}

uint64_t _CSStringMakeConst()
{
  return MEMORY[0x18960DF08]();
}

uint64_t _CSStringRelease()
{
  return MEMORY[0x18960DF10]();
}

uint64_t _CSStringRetain()
{
  return MEMORY[0x18960DF18]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x189604880]();
}

uint64_t _NSIsNSData()
{
  return MEMORY[0x189604898]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1896048A8]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1896048B0]();
}

uint64_t _NSIsNSSet()
{
  return MEMORY[0x1896048C8]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1896048D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t CSStore2::AttributedStringWriter::beginFlags(CSStore2::AttributedStringWriter *this, NSString *a2)
{
  return MEMORY[0x18960DF40](this, a2);
}

uint64_t CSStore2::AttributedStringWriter::missingFlag()
{
  return MEMORY[0x18960DF48]();
}

uint64_t CSStore2::AttributedStringWriter::stringArray( CSStore2::AttributedStringWriter *this, NSString *a2, const unsigned int *a3)
{
  return MEMORY[0x18960DF50](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::stringArray(CSStore2::AttributedStringWriter *this, NSString *a2)
{
  return MEMORY[0x18960DF58](this, a2);
}

uint64_t CSStore2::AttributedStringWriter::setVisualizer()
{
  return MEMORY[0x18960DF60]();
}

uint64_t CSStore2::AttributedStringWriter::withTextColor()
{
  return MEMORY[0x18960DF68]();
}

uint64_t CSStore2::AttributedStringWriter::attributedString( CSStore2::AttributedStringWriter *this, NSAttributedString *a2)
{
  return MEMORY[0x18960DF70](this, a2);
}

uint64_t CSStore2::AttributedStringWriter::withWarningColors()
{
  return MEMORY[0x18960DF78]();
}

uint64_t CSStore2::AttributedStringWriter::beginBitfieldFlags( CSStore2::AttributedStringWriter *this, NSString *a2)
{
  return MEMORY[0x18960DF80](this, a2);
}

uint64_t CSStore2::AttributedStringWriter::setInsertsNewlines(CSStore2::AttributedStringWriter *this)
{
  return MEMORY[0x18960DF88](this);
}

uint64_t CSStore2::AttributedStringWriter::withReferenceToUnit()
{
  return MEMORY[0x18960DF90]();
}

uint64_t CSStore2::AttributedStringWriter::setElidesEmptyValues(CSStore2::AttributedStringWriter *this)
{
  return MEMORY[0x18960DF98](this);
}

uint64_t CSStore2::AttributedStringWriter::withAppliedAttribute()
{
  return MEMORY[0x18960DFA0]();
}

uint64_t CSStore2::AttributedStringWriter::withTextAndBackgroundColor()
{
  return MEMORY[0x18960DFA8]();
}

uint64_t CSStore2::AttributedStringWriter::flag()
{
  return MEMORY[0x18960DFB0]();
}

uint64_t CSStore2::AttributedStringWriter::link( CSStore2::AttributedStringWriter *this, NSURL *a2, NSString *a3)
{
  return MEMORY[0x18960DFB8](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::link( CSStore2::AttributedStringWriter *this, uint64_t a2, uint64_t a3, NSString *a4)
{
  return MEMORY[0x18960DFC0](this, a2, a3, a4);
}

uint64_t CSStore2::AttributedStringWriter::array(CSStore2::AttributedStringWriter *this, NSArray *a2)
{
  return MEMORY[0x18960DFC8](this, a2);
}

uint64_t CSStore2::AttributedStringWriter::array( CSStore2::AttributedStringWriter *this, NSString *a2, NSArray *a3)
{
  return MEMORY[0x18960DFD0](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::format( CSStore2::AttributedStringWriter *this, NSString *a2, NSString *a3, ...)
{
  return MEMORY[0x18960DFD8](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::number( CSStore2::AttributedStringWriter *this, NSString *a2, NSNumber *a3)
{
  return MEMORY[0x18960DFE0](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::string(CSStore2::AttributedStringWriter *this, NSString *a2)
{
  return MEMORY[0x18960DFE8](this, a2);
}

{
  return MEMORY[0x18960DFF8](this, a2);
}

uint64_t CSStore2::AttributedStringWriter::string( CSStore2::AttributedStringWriter *this, NSString *a2, NSString *a3)
{
  return MEMORY[0x18960DFF0](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::endFlags(CSStore2::AttributedStringWriter *this)
{
  return MEMORY[0x18960E000](this);
}

uint64_t CSStore2::AttributedStringWriter::Separator( CSStore2::AttributedStringWriter *this, uint64_t a2, NSString *a3)
{
  return MEMORY[0x18960E008](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::childUnit(CSStore2::AttributedStringWriter *this, NSString *a2)
{
  return MEMORY[0x18960E010](this, a2);
}

uint64_t CSStore2::AttributedStringWriter::childUnit(CSStore2::AttributedStringWriter *this)
{
  return MEMORY[0x18960E018](this);
}

uint64_t CSStore2::AttributedStringWriter::separator( CSStore2::AttributedStringWriter *this, uint64_t a2, NSString *a3)
{
  return MEMORY[0x18960E020](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::timestamp( CSStore2::AttributedStringWriter *this, NSString *a2, double a3)
{
  return MEMORY[0x18960E028](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::AttributedStringWriter( CSStore2::AttributedStringWriter *this, const __CSStore *a2, NSMutableAttributedString *a3)
{
  return MEMORY[0x18960E030](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::AttributedStringWriter( CSStore2::AttributedStringWriter *this, const CSStore2::AttributedStringWriter *a2)
{
  return MEMORY[0x18960E038](this, a2);
}

void CSStore2::AttributedStringWriter::~AttributedStringWriter(CSStore2::AttributedStringWriter *this)
{
}

uint64_t CSStore2::AttributedStringWriter::getVisualizer(CSStore2::AttributedStringWriter *this)
{
  return MEMORY[0x18960E048](this);
}

std::stringbuf::string_type *__cdecl std::stringbuf::str( std::stringbuf::string_type *__return_ptr retstr, const std::stringbuf *this)
{
  return (std::stringbuf::string_type *)MEMORY[0x189614198](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1896141C8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1896141D0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1896142A0](__n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1896142F0](this, __s);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1896143C8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1896143D0]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1896143D8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x189614438]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x189614470]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x189614478]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

uint64_t std::pmr::get_default_resource(std::pmr *this)
{
  return MEMORY[0x189614508](this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x189614638]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_189D70F90(__sz);
}

uint64_t __CFURLResourceInfoPtr()
{
  return MEMORY[0x189604A38]();
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1895F8878](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1896147F0](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1895F89F8]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895F8A00]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1895F8D80]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x1895F8DF8]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x1895F8E08]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1895F95A0](a1);
}

void audit_token_to_au32( audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x189614100](atoken);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1895F9618](*(void *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1895F9620]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1895F9648](*(void *)&r);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x189616470](cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x189616480](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1896164B0](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1896164C8](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1896164D0](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1896164E0](cls);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FA5E8](*(void *)&a1, a2, a3);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x1895FA710]();
}

uint64_t container_create_or_lookup_app_group_paths_for_platform()
{
  return MEMORY[0x1895FA728]();
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x1895FA738]();
}

uint64_t container_create_or_lookup_path_for_platform()
{
  return MEMORY[0x1895FA740]();
}

uint64_t container_entitlements_copy_container_identifiers()
{
  return MEMORY[0x1895FA780]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1895FA788]();
}

uint64_t container_error_get_posix_errno()
{
  return MEMORY[0x1895FA7B0]();
}

uint64_t container_get_error_description()
{
  return MEMORY[0x1895FA7F8]();
}

uint64_t container_get_path()
{
  return MEMORY[0x1895FA810]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1895FA8F8]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1895FA908]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1895FA910]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x1895FA918]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1895FA930]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1895FA940]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1895FA960]();
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1895FA9D8]();
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x1895FA9E0]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1895FAA60](from, to, state, *(void *)&flags);
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1895FAAA8]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class( dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FABB8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAC80](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1895FAE30]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1895FAFD8]();
}

uint64_t dyld_get_base_platform()
{
  return MEMORY[0x1895FAFE0]();
}

uint64_t dyld_get_image_versions()
{
  return MEMORY[0x1895FAFE8]();
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x1895FAFF0]();
}

uint64_t dyld_is_simulator_platform()
{
  return MEMORY[0x1895FB038]();
}

void exit(int a1)
{
}

int fclonefileat(int a1, int a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x1895FB200](*(void *)&a1, *(void *)&a2, a3, *(void *)&a4);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1895FB218](*(void *)&from_fd, *(void *)&to_fd, a3, *(void *)&flags);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB278](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1895FB370](*(void *)&a1, a2);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FB418](a1, a2, a3, *(void *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1895FB460](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB4F8](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x1895FB520](a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1895FB548](a1, *(void *)&a2, *(void *)&a3);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB708](path, name, value, size, *(void *)&position, *(void *)&options);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1895FB8C0]();
}

int kevent( int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x1895FB8D8](*(void *)&kq, changelist, *(void *)&nchanges, eventlist, *(void *)&nevents, timeout);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1895FB8E8](*(void *)&a1, *(void *)&a2);
}

int kqueue(void)
{
  return MEMORY[0x1895FB910]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FBAC0](*(void *)&error_value);
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FBAE8]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1895FBB10](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right( ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1895FBB70](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FBB78](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification( ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1895FBB88]( *(void *)&task,  *(void *)&name,  *(void *)&msgid,  *(void *)&sync,  *(void *)&notify,  *(void *)&notifyPoly,  previous);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1895FBC80](a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
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

char *__cdecl method_copyArgumentType(Method m, unsigned int index)
{
  return (char *)MEMORY[0x189616548](m, *(void *)&index);
}

char *__cdecl method_copyReturnType(Method m)
{
  return (char *)MEMORY[0x189616550](m);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x189616570](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x189616578](m);
}

unsigned int method_getNumberOfArguments(Method m)
{
  return MEMORY[0x189616580](m);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1895FBE88]();
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1895FBE98]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1895FBEA0]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1895FBEB8](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1895FBEC0](dest, src, *(void *)&len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1895FC190](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1895FC198](*(void *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1895FC1A0](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1895FC1B0](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1895FC1B8](name, out_token);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1895FC1E8](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerateClasses( const void *image, const char *namePrefix, Protocol *conformingTo, Class subclassing, void *block)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1896166A8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1896169A8](a1);
}

uint64_t object_getMethodImplementation()
{
  return MEMORY[0x1896169C8]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1895FC250](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1895FC670](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1895FC688]();
}

uint64_t os_unfair_recursive_lock_trylock()
{
  return MEMORY[0x1895FC690]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1895FC6A0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FC6C8]();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return MEMORY[0x1895FC6E8]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FC880](*(void *)&__fd, __buf, __nbyte, a4);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1895FC8E0](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1895FC8F0](audittoken, buffer, *(void *)&buffersize);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList( Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x189616A18](p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1895FC9A8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9B0](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1895FC9C8](a1, a2);
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FCA30](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1895FCA40](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1895FCA60](a1, a2);
}

int pthread_main_np(void)
{
  return MEMORY[0x1895FCA78]();
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1895FCAC8](a1, a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCAE8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1895FCAF0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCAF8](a1);
}

int pthread_rwlock_tryrdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB00](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1895FCB18](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1895FCB20]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1895FCB38](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1895FCB48](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x1895FCB98](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1895FCBB8]();
}

int rand(void)
{
  return MEMORY[0x1895FCBE8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

int remove(const char *a1)
{
  return MEMORY[0x1895FCD08](a1);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1895FCD10](path, state, *(void *)&flags);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1895FCD38](path, name, *(void *)&options);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1895FCD68](a1, a2, *(void *)&a3);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1895FCD98]();
}

uint64_t sandbox_container_path_for_audit_token()
{
  return MEMORY[0x1895FCDA0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1895FCDB0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1895FCDB8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1895FCDD0]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x189616A48](sel);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x189616A68](str);
}

int sem_close(sem_t *a1)
{
  return MEMORY[0x1895FCE20](a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x1895FCE28](a1, *(void *)&a2);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1895FCE68](__name, __value, *(void *)&__overwrite);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return MEMORY[0x1895FCE80](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int setxattr( const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FCEE0](path, name, value, size, *(void *)&position, *(void *)&options);
}

int sigpending(sigset_t *a1)
{
  return MEMORY[0x1895FCF58](a1);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1895FCF60](*(void *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FCFB0](a1, a2);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1896170D8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1896170E0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1896170E8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1896170F8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x189617120](a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x189617150](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1896171C8](a1);
}

int sqlite3_exec( sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1896171D8](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x189617200](pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x189617260](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x189617270](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x189617300](a1);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1895FD0D0](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1895FD310](*(void *)&task, *(void *)&which_port, special_port);
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1895FD320](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x1895FD418](__b1, __b2, __len);
}

uint64_t ubidi_close()
{
  return MEMORY[0x1896154E0]();
}

uint64_t ubidi_getBaseDirection()
{
  return MEMORY[0x1896154E8]();
}

uint64_t ubidi_getResultLength()
{
  return MEMORY[0x189615500]();
}

uint64_t ubidi_getVisualMap()
{
  return MEMORY[0x189615508]();
}

uint64_t ubidi_open()
{
  return MEMORY[0x189615510]();
}

uint64_t ubidi_setPara()
{
  return MEMORY[0x189615520]();
}

uint64_t ubidi_setReorderingOptions()
{
  return MEMORY[0x189615530]();
}

int unsetenv(const char *a1)
{
  return MEMORY[0x1895FD480](a1);
}

uint64_t uset_close()
{
  return MEMORY[0x189615CA0]();
}

uint64_t uset_getItem()
{
  return MEMORY[0x189615CB8]();
}

uint64_t uset_getItemCount()
{
  return MEMORY[0x189615CC0]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x189615CC8]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1895FD4B8](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate_random(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1895FD5F8](msg);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1895FD7C8](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1895FD840](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1895FD8C0](xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1895FD930]();
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1895FD978]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1895FD9A8](connection);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1895FDA60]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1895FDAB0]();
}

uint64_t xpc_copy_entitlements_data_for_token()
{
  return MEMORY[0x1895FDAB8]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1895FDEC8](xint);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1895FE040]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1895FE0E8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1895FE0F0]();
}

uint64_t objc_msgSend__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__LSPrivateRebuildApplicationDatabasesForSystemApps_internal_user_uid_);
}

uint64_t objc_msgSend__enumerateRelatedTypeStructuresWithContext_unitID_maximumDegreeOfSeparation_block_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__enumerateRelatedTypeStructuresWithContext_unitID_maximumDegreeOfSeparation_block_);
}

uint64_t objc_msgSend__enumerateRelatedTypeUnitsOrDynamicIdsWithContext_unitID_maximumDegreeOfSeparation_block_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__enumerateRelatedTypeUnitsOrDynamicIdsWithContext_unitID_maximumDegreeOfSeparation_block_);
}

uint64_t objc_msgSend__getGroupContainersCreatingIfNecessary_checkNonContainerizedBundles_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__getGroupContainersCreatingIfNecessary_checkNonContainerizedBundles_);
}

uint64_t objc_msgSend__initWithContext_bundleUnit_applicationRecord_bundleID_resolveAndDetach_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__initWithContext_bundleUnit_applicationRecord_bundleID_resolveAndDetach_);
}

uint64_t objc_msgSend__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__initWithNode_bundleIdentifier_context_tableID_unitID_bundleBaseData_error_);
}

uint64_t objc_msgSend__initWithNode_bundleIdentifier_placeholderBehavior_systemPlaceholder_itemID_forceInBundleContainer_context_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initWithNode_bundleIdentifier_placeholderBehavior_systemPlaceholder_itemID_forceInBundleContainer_context_error_);
}

uint64_t objc_msgSend__initWithPlugin_andContext_applicationExtensionRecord_resolveAndDetach_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__initWithPlugin_andContext_applicationExtensionRecord_resolveAndDetach_);
}

uint64_t objc_msgSend__initWithUUID_bundleIdentifier_pluginIdentifier_effectiveIdentifier_version_bundleURL_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initWithUUID_bundleIdentifier_pluginIdentifier_effectiveIdentifier_version_bundleURL_);
}

uint64_t objc_msgSend__initWithUUID_node_bundleIdentifier_platform_context_requireValid_allowRedacted_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__initWithUUID_node_bundleIdentifier_platform_context_requireValid_allowRedacted_error_);
}

uint64_t objc_msgSend__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__openUserActivity_orUserActivityUUID_activityTypeForUUID_withApplicationProxy_options_completionHandler_);
}

uint64_t objc_msgSend_allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs_originatingAppBundleID_originatingAccountIsManaged_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs_originatingAppBundleID_originatingAccountIsManaged_);
}

uint64_t objc_msgSend_applicationExtensionRecordsForUUIDs_outContainingBundleRecords_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_applicationExtensionRecordsForUUIDs_outContainingBundleRecords_error_);
}

uint64_t objc_msgSend_applicationProxyForBundleType_identifier_isCompanion_URL_itemID_bundleUnit_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_applicationProxyForBundleType_identifier_isCompanion_URL_itemID_bundleUnit_);
}

uint64_t objc_msgSend_applicationsOrClaimBindings_availableForOpeningWithStyle_handlerRank_limit_XPCConnection_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_applicationsOrClaimBindings_availableForOpeningWithStyle_handlerRank_limit_XPCConnection_error_);
}

uint64_t objc_msgSend_applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_applyRestrictionDictionary_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError_);
}

uint64_t objc_msgSend_beginProvidingVisualizationArchivesWithMachServiceName_queue_creatingVisualizersWithBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_beginProvidingVisualizationArchivesWithMachServiceName_queue_creatingVisualizersWithBlock_);
}

uint64_t objc_msgSend_claimBindingsAvailableForOpeningWithStyle_handlerRank_limit_XPCConnection_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_claimBindingsAvailableForOpeningWithStyle_handlerRank_limit_XPCConnection_error_);
}

uint64_t objc_msgSend_commonClientOpenURL_options_configuration_synchronous_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_commonClientOpenURL_options_configuration_synchronous_completionHandler_);
}

uint64_t objc_msgSend_createInstallProgressForApplication_withPhase_andPublishingString_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_createInstallProgressForApplication_withPhase_andPublishingString_reply_);
}

uint64_t objc_msgSend_displayNameConstructorWithContext_bundle_bundleClass_node_preferredLocalizations_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_displayNameConstructorWithContext_bundle_bundleClass_node_preferredLocalizations_error_);
}

uint64_t objc_msgSend_displayNameConstructorWithContextIfNeeded_bundle_bundleClass_node_preferredLocalizations_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_displayNameConstructorWithContextIfNeeded_bundle_bundleClass_node_preferredLocalizations_error_);
}

uint64_t objc_msgSend_displayNameConstructorsWithContextIfNeeded_bundle_bundleClass_node_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_displayNameConstructorsWithContextIfNeeded_bundle_bundleClass_node_error_);
}

uint64_t objc_msgSend_documentProxyForName_type_MIMEType_isContentManaged_sourceAuditToken_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_documentProxyForName_type_MIMEType_isContentManaged_sourceAuditToken_);
}

uint64_t objc_msgSend_findKeysToLocalizeInInfoDictionary_forArrayKey_stringKey_localizedKeys_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_findKeysToLocalizeInInfoDictionary_forArrayKey_stringKey_localizedKeys_);
}

uint64_t objc_msgSend_findOrRegisterContainerizedNodeReinitializingContext_installDictionary_personasWithAttributes_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_findOrRegisterContainerizedNodeReinitializingContext_installDictionary_personasWithAttributes_error_);
}

uint64_t objc_msgSend_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList_);
}

uint64_t objc_msgSend_gatherLocalizedStringsForCFBundle_infoDictionary_domains_legacyLocalizationList_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_gatherLocalizedStringsForCFBundle_infoDictionary_domains_legacyLocalizationList_);
}

uint64_t objc_msgSend_generateIdentifiersForInstallationWithContext_bundleUnit_bundleData_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_generateIdentifiersForInstallationWithContext_bundleUnit_bundleData_);
}

uint64_t objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_);
}

uint64_t objc_msgSend_getCachedBundleIDToPersonasWithAttributesMap_systemPersonaUniqueString_personalPersonaUniqueString_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_getCachedBundleIDToPersonasWithAttributesMap_systemPersonaUniqueString_personalPersonaUniqueString_);
}

uint64_t objc_msgSend_getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_getClientProcessVendorNameBundleIdentifierAndRestrictedIDAccessWithType_completionHandler_);
}

uint64_t objc_msgSend_getExtensionRange_secondaryExtensionRange_fromFileName_considerConfusables_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getExtensionRange_secondaryExtensionRange_fromFileName_considerConfusables_);
}

uint64_t objc_msgSend_getMaxProgressPhaseUnitsForLoading_restoring_installing_essentialAssets_forAppProxy_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_getMaxProgressPhaseUnitsForLoading_restoring_installing_essentialAssets_forAppProxy_);
}

uint64_t objc_msgSend_getRedactedAppexRecordForSystemAppexWithUUID_node_bundleIdentifier_platform_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_getRedactedAppexRecordForSystemAppexWithUUID_node_bundleIdentifier_platform_completionHandler_);
}

uint64_t objc_msgSend_getRelatedTypesOfTypeWithIdentifier_maximumDegreeOfSeparation_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getRelatedTypesOfTypeWithIdentifier_maximumDegreeOfSeparation_completionHandler_);
}

uint64_t objc_msgSend_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler_);
}

uint64_t objc_msgSend_getSessionLanguagesForImproperlyLocalizedProcessWithCompletionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getSessionLanguagesForImproperlyLocalizedProcessWithCompletionHandler_);
}

uint64_t objc_msgSend_getTypeRecordForImportedTypeWithIdentifier_conformingToIdentifier_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_getTypeRecordForImportedTypeWithIdentifier_conformingToIdentifier_completionHandler_);
}

uint64_t objc_msgSend_getTypeRecordWithTag_ofClass_conformingToIdentifier_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getTypeRecordWithTag_ofClass_conformingToIdentifier_completionHandler_);
}

uint64_t objc_msgSend_getTypeRecordsWithTag_ofClass_conformingToIdentifier_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getTypeRecordsWithTag_ofClass_conformingToIdentifier_completionHandler_);
}

uint64_t objc_msgSend_getUncachedBundleIDToPersonasWithAttributesMap_systemPersonaUniqueString_personalPersonaUniqueString_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_getUncachedBundleIDToPersonasWithAttributesMap_systemPersonaUniqueString_personalPersonaUniqueString_);
}

uint64_t objc_msgSend_getUnlocalizedBaseName_extension_requiresAdditionalBiDiControlCharacters_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getUnlocalizedBaseName_extension_requiresAdditionalBiDiControlCharacters_);
}

uint64_t objc_msgSend_getWhetherTypeIdentifier_conformsToTypeIdentifier_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getWhetherTypeIdentifier_conformsToTypeIdentifier_completionHandler_);
}

uint64_t objc_msgSend_initByResolvingBookmarkData_options_relativeToNode_bookmarkDataIsStale_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initByResolvingBookmarkData_options_relativeToNode_bookmarkDataIsStale_error_);
}

uint64_t objc_msgSend_initByResolvingBookmarkData_relativeToNode_bookmarkDataIsStale_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initByResolvingBookmarkData_relativeToNode_bookmarkDataIsStale_error_);
}

uint64_t objc_msgSend_initForBundleWithIdentifier_placeholderInstalled_fullApplicationInstalled_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initForBundleWithIdentifier_placeholderInstalled_fullApplicationInstalled_);
}

uint64_t objc_msgSend_initWithBundleURL_stringsFile_checkMainBundle_legacyLocalizationList_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithBundleURL_stringsFile_checkMainBundle_legacyLocalizationList_);
}

uint64_t objc_msgSend_initWithContextIfNeeded_node_isDirectory_bundleClass_desiredDisplayName_treatAsFSName_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithContextIfNeeded_node_isDirectory_bundleClass_desiredDisplayName_treatAsFSName_);
}

uint64_t objc_msgSend_initWithIdentityBookmark_identityString_personaUniqueString_personaType_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithIdentityBookmark_identityString_personaUniqueString_personaType_);
}

uint64_t objc_msgSend_installContainerizedApplicationArtifactAtURL_withOptions_returningRecordPromise_error_progressBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_installContainerizedApplicationArtifactAtURL_withOptions_returningRecordPromise_error_progressBlock_);
}

uint64_t objc_msgSend_internalCanOpenURL_publicSchemes_privateSchemes_XPCConnection_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_internalCanOpenURL_publicSchemes_privateSchemes_XPCConnection_error_);
}

uint64_t objc_msgSend_isApplicationAvailableToOpenURLCommon_includePrivateURLSchemes_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_isApplicationAvailableToOpenURLCommon_includePrivateURLSchemes_error_);
}

uint64_t objc_msgSend_mapPlugInBundleIdentifiersToContainingBundleIdentifiers_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_mapPlugInBundleIdentifiersToContainingBundleIdentifiers_completionHandler_);
}

uint64_t objc_msgSend_openApplicationWithIdentifier_options_useClientProcessHandle_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_openApplicationWithIdentifier_options_useClientProcessHandle_completionHandler_);
}

uint64_t objc_msgSend_openInWebBrowser_setOpenStrategy_webBrowserState_configuration_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_openInWebBrowser_setOpenStrategy_webBrowserState_configuration_completionHandler_);
}

uint64_t objc_msgSend_openUserActivityWithUniqueIdentifier_activityData_activityType_bundleIdentifier_options_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_openUserActivityWithUniqueIdentifier_activityData_activityType_bundleIdentifier_options_completionHandler_);
}

uint64_t objc_msgSend_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_);
}

uint64_t objc_msgSend_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_userInfo_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_userInfo_);
}

uint64_t objc_msgSend_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_userInfo_delegate_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_userInfo_delegate_);
}

uint64_t objc_msgSend_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_performOpenOperationWithURL_fileHandle_bundleIdentifier_documentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_completionHandler_);
}

uint64_t objc_msgSend_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply_);
}

uint64_t objc_msgSend_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply_);
}

uint64_t objc_msgSend_performShimmedUninstallOfApplicationWithIdentifier_options_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_performShimmedUninstallOfApplicationWithIdentifier_options_completion_);
}

uint64_t objc_msgSend_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_performUpdateOfPersonasOfBundleIDs_toPersonaUniqueStrings_operationUUID_reply_);
}

uint64_t objc_msgSend_plugInKitProxyForPlugin_withContext_applicationExtensionRecord_resolveAndDetach_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_plugInKitProxyForPlugin_withContext_applicationExtensionRecord_resolveAndDetach_);
}

uint64_t objc_msgSend_plugInKitProxyForUUID_bundleIdentifier_pluginIdentifier_effectiveIdentifier_version_bundleURL_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_plugInKitProxyForUUID_bundleIdentifier_pluginIdentifier_effectiveIdentifier_version_bundleURL_);
}

uint64_t objc_msgSend_rebuildApplicationDatabasesForSystem_internal_user_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_rebuildApplicationDatabasesForSystem_internal_user_completionHandler_);
}

uint64_t objc_msgSend_registerApplicationForRebuildWithInfoDictionaries_personaUniqueStrings_requestContext_registrationError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_registerApplicationForRebuildWithInfoDictionaries_personaUniqueStrings_requestContext_registrationError_);
}

uint64_t objc_msgSend_registerContainerizedApplicationWithInfoDictionaries_operationUUID_requestContext_saveObserver_registrationError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_registerContainerizedApplicationWithInfoDictionaries_operationUUID_requestContext_saveObserver_registrationError_);
}

uint64_t objc_msgSend_registerContainerizedApplicationWithInfoDictionaries_personaUniqueStrings_operationUUID_requestContext_saveObserver_registrationError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_registerContainerizedApplicationWithInfoDictionaries_personaUniqueStrings_operationUUID_requestContext_saveObserver_registrationError_);
}

uint64_t objc_msgSend_registerExtensionPoint_platform_declaringURL_withInfo_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_registerExtensionPoint_platform_declaringURL_withInfo_completionHandler_);
}

uint64_t objc_msgSend_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler_);
}

uint64_t objc_msgSend_revertContainerizedApplicationWithIdentifier_options_returningRecordPromise_error_progressBlock_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_revertContainerizedApplicationWithIdentifier_options_returningRecordPromise_error_progressBlock_);
}

uint64_t objc_msgSend_runPostProcessingForBundleID_success_isSystemApp_isPlaceholder_registeredBothFullAppAndPlaceholder_notificationJournaller_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_runPostProcessingForBundleID_success_isSystemApp_isPlaceholder_registeredBothFullAppAndPlaceholder_notificationJournaller_);
}

uint64_t objc_msgSend_sendApplicationStateChangedNotificationsFor_stateProvider_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_sendApplicationStateChangedNotificationsFor_stateProvider_completion_);
}

uint64_t objc_msgSend_serviceDetailsWithServiceSpecifier_URLComponents_limit_auditToken_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_serviceDetailsWithServiceSpecifier_URLComponents_limit_auditToken_error_);
}

uint64_t objc_msgSend_setPersonaUniqueStrings_forApplicationsWithBundleIdentifiers_operationUUID_requestContext_saveObserver_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_setPersonaUniqueStrings_forApplicationsWithBundleIdentifiers_operationUUID_requestContext_saveObserver_error_);
}

uint64_t objc_msgSend_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_completion_);
}

uint64_t objc_msgSend_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_setUpdateAvailabilityForApplicationsWithBundleIdentifiers_completionHandler_);
}

uint64_t objc_msgSend_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_unregisterContainerizedApplicationWithBundleIdentifier_operationUUID_unregistrationOperation_precondition_requestContext_saveObserver_unregistrationError_);
}

uint64_t objc_msgSend_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler_);
}

uint64_t objc_msgSend_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_outSaveToken_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_outSaveToken_error_);
}

uint64_t objc_msgSend_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler_);
}