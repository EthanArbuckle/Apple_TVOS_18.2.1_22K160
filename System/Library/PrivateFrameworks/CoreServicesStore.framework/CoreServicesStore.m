uint64_t _CSDictionaryCreateWithKeysAndValues( uint64_t a1, char a2, int a3, uint64_t a4, uint64_t a5, unsigned int a6, void *a7)
{
  unint64_t v7;
  uint64_t v14;
  char **v15;
  int *Table;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint8x8_t v21;
  uint64_t **v22;
  uint64_t *i;
  unint64_t v24;
  void *v25;
  int v26;
  float v27;
  BOOL v28;
  unint64_t v29;
  unint64_t v30;
  size_t v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  int v35;
  unsigned int v36;
  int v37;
  const void *v38;
  unint64_t v39;
  NSUInteger v40;
  char *v41;
  unint64_t v42;
  int v43;
  BOOL v44;
  unint64_t v45;
  void *v47;
  char *v48;
  char *v49;
  NSUInteger v50;
  uint64_t v51;
  unsigned int v52;
  unsigned int v53;
  int v54;
  NSUInteger v55;
  Unit *Unit;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v67;
  int *v68;
  void *v70;
  void (*v71)(void *);
  char v72;
  __int128 v73;
  __int128 v74;
  float v75;
  void v76[2];
  void v77[2];
  void v78[2];
  void v79[4];
  v79[2] = *MEMORY[0x1895F89C0];
  if ((a3 & 4) == 0 || (a3 & 3) == 0)
  {
    if (a1) {
      goto LABEL_4;
    }
LABEL_92:
    v65 = (void *)MEMORY[0x189607870];
    v76[0] = *MEMORY[0x189607490];
    v76[1] = @"Line";
    v77[0] = @"paramErr";
    v77[1] = &unk_189D69538;
    [MEMORY[0x189603F68] dictionaryWithObjects:v77 forKeys:v76 count:2];
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = [v65 errorWithDomain:*MEMORY[0x189607670] code:-50 userInfo:v61];
LABEL_93:
    v59 = (void *)v62;

    v58 = 0LL;
    if (!a7) {
      goto LABEL_96;
    }
    goto LABEL_94;
  }

  [MEMORY[0x1896077D8] currentHandler];
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( NSString,  "stringWithUTF8String:",  "CSDictionaryID _CSDictionaryCreateWithKeysAndValues(CSMutableStoreRef _Nonnull, CSDictionaryKeyOptions, CSDictionary ValueOptions, const CSDictionaryKey * _Nonnull, const CSDictionaryValue * _Nonnull, _CSStoreUnitCount, CFErrorRef * _Nullable)");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  [v63 handleFailureInFunction:v64, @"CSDictionary.mm", 23, @"Invalid parameter not satisfying: %@", @"!( inValueOptions &(kCSDictionaryValueOptionsStringPersonality | kCSDictionaryValueOptionsArrayPersonality))" file lineNumber description];

  if (!a1) {
    goto LABEL_92;
  }
LABEL_4:
  if (performMutatingAssertions)
  {
    v14 = *(void *)(a1 + 344);
    if (v14) {
      (***(void (****)(void))(v14 + 8))(*(void *)(v14 + 8));
    }
  }

  v15 = (char **)(a1 + 8);
  Table = *(int **)(a1 + 288);
  if (!Table)
  {
    Table = (int *)CSStore2::Store::getTable((CSStore2 **)(a1 + 8), @"<dictionary>");
    if (!Table)
    {
      Table = (int *)CSStore2::Store::allocateTable((CSStore2::Store *)(a1 + 8), @"<dictionary>", 0, 0LL);
      if (!Table) {
        goto LABEL_90;
      }
    }
  }

  v67 = a7;
  v68 = Table;
  v73 = 0u;
  v74 = 0u;
  v75 = 1.0;
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>( (uint64_t)&v73,  (unint64_t)(float)a6);
  if (a6)
  {
    v17 = 0LL;
    v18 = a6;
    while (1)
    {
      CSStore2::Dictionary::_CopyCanonicalKey((CSStore2::Dictionary *)&v70, v15, *(_DWORD *)(a4 + 4 * v17), a2);
      if (v72) {
        break;
      }
LABEL_51:
      if (++v17 == v18) {
        goto LABEL_52;
      }
    }

    CSStore2::Dictionary::_TakeOwnershipOfValue( (unsigned int *)v15,  (CSStore2::Store *)*(unsigned int *)(a5 + 4 * v17),  a3);
    v19 = v71;
    v20 = *((void *)&v73 + 1);
    if (*((void *)&v73 + 1))
    {
      v21 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v73 + 8));
      v21.i16[0] = vaddlv_u8(v21);
      if (v21.u32[0] > 1uLL)
      {
        v7 = v71;
      }

      else
      {
        v7 = (DWORD2(v73) - 1) & v71;
      }

      v22 = *(uint64_t ***)(v73 + 8 * v7);
      if (v22)
      {
        for (i = *v22; i; i = (uint64_t *)*i)
        {
          v24 = i[1];
          if (v24 == v71)
          {
            if (*((_DWORD *)i + 4) == (_DWORD)v71) {
              goto LABEL_51;
            }
          }

          else
          {
            if (v21.u32[0] > 1uLL)
            {
              if (v24 >= *((void *)&v73 + 1)) {
                v24 %= *((void *)&v73 + 1);
              }
            }

            else
            {
              v24 &= *((void *)&v73 + 1) - 1LL;
            }

            if (v24 != v7) {
              break;
            }
          }
        }
      }
    }

    v25 = operator new(0x18uLL);
    *v25 = 0LL;
    v25[1] = v19;
    v26 = *(_DWORD *)(a5 + 4 * v17);
    *((_DWORD *)v25 + 4) = v19;
    *((_DWORD *)v25 + 5) = v26;
    v27 = (float)(unint64_t)(*((void *)&v74 + 1) + 1LL);
    if (!v20 || (float)(v75 * (float)v20) < v27)
    {
      v28 = (v20 & (v20 - 1)) != 0;
      if (v20 < 3) {
        v28 = 1LL;
      }
      v29 = v28 | (2 * v20);
      v30 = vcvtps_u32_f32(v27 / v75);
      if (v29 <= v30) {
        v31 = v30;
      }
      else {
        v31 = v29;
      }
      std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>( (uint64_t)&v73,  v31);
      v20 = *((void *)&v73 + 1);
      if ((*((void *)&v73 + 1) & (*((void *)&v73 + 1) - 1LL)) != 0)
      {
        if (*((void *)&v73 + 1) <= v19) {
          v7 = v19 % *((void *)&v73 + 1);
        }
        else {
          v7 = v19;
        }
      }

      else
      {
        v7 = (DWORD2(v73) - 1) & v19;
      }
    }

    v32 = v73;
    v33 = *(void **)(v73 + 8 * v7);
    if (v33)
    {
      *v25 = *v33;
    }

    else
    {
      *v25 = v74;
      *(void *)&v74 = v25;
      *(void *)(v32 + 8 * v7) = &v74;
      if (!*v25)
      {
LABEL_50:
        ++*((void *)&v74 + 1);
        goto LABEL_51;
      }

      v34 = *(void *)(*v25 + 8LL);
      if ((v20 & (v20 - 1)) != 0)
      {
        if (v34 >= v20) {
          v34 %= v20;
        }
      }

      else
      {
        v34 &= v20 - 1;
      }

      v33 = (void *)(v73 + 8 * v34);
    }

    *v33 = v25;
    goto LABEL_50;
  }

LABEL_52:
  v35 = *v68;
  else {
    v36 = DWORD2(v74) + 1024;
  }
  if (v36 <= 0x10) {
    v36 = 16;
  }
  v37 = 8 * v36 + 8 * (DWORD2(v74) + 1024);
  v38 = (const void *)(v37 | 4u);
  v39 = CSStore2::Store::extend((CSStore2::Store *)v15, v37 | 4u);
  v40 = v39;
  if (!v39) {
    goto LABEL_89;
  }
  v41 = *v15;
  if (*v15) {
    v42 = *((void *)v41 + 1);
  }
  else {
    v42 = 0LL;
  }
  v43 = -1;
  v44 = v39 >= v42;
  v45 = v39 - v42;
  if (v44 && !HIDWORD(v45))
  {
    else {
      v43 = v45;
    }
  }

  CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Create( (_DWORD **)&v70,  (uint64_t)&v73,  v43,  0x400u,  0LL);
  v47 = v70;
  if (!v70)
  {
    CSStore2::Store::assertNotEnumeratingUnits((uint64_t)v15);
    v51 = *((void *)*v15 + 1);
    v52 = *(_DWORD *)(v51 + 16);
    v44 = v52 >= v38;
    v53 = v52 - (_DWORD)v38;
    if (!v44) {
      v53 = 0;
    }
    *(_DWORD *)(v51 + 16) = v53;
    ++*(_DWORD *)(v51 + 8);
    goto LABEL_89;
  }

  CSStore2::VM::Copy(v40, (NSUInteger)v70, v38);
  v70 = 0LL;
  v71(v47);
  v48 = CSStore2::Store::getTable((CSStore2::Store *)v15, 4 * v35);
  v49 = *v15;
  if (*v15) {
    v50 = *((void *)v49 + 1);
  }
  else {
    v50 = 0LL;
  }
  v54 = -1;
  v44 = v40 >= v50;
  v55 = v40 - v50;
  if (v44 && !HIDWORD(v55))
  {
    else {
      v54 = v55;
    }
  }

  Unit = CSStore2::Store::allocateUnit((CSStore2::Store *)v15, (CSStore2::Table *)v48, 8, 0);
  if (!Unit)
  {
LABEL_89:
    std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v73);
    a7 = v67;
LABEL_90:
    v60 = (void *)MEMORY[0x189607870];
    v78[0] = *MEMORY[0x189607490];
    v78[1] = @"Line";
    v79[0] = @"kCSStoreAllocFailedErr";
    v79[1] = &unk_189D69520;
    [MEMORY[0x189603F68] dictionaryWithObjects:v79 forKeys:v78 count:2];
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = [v60 errorWithDomain:*MEMORY[0x189607670] code:-9493 userInfo:v61];
    goto LABEL_93;
  }

  Unit->var3[0] = a2;
  Unit->var3[1] = a3;
  *(_WORD *)&Unit->var3[2] = 0;
  *(_DWORD *)&Unit->var3[4] = v54;
  v58 = (4 * *(_DWORD *)Unit);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v73);
  v59 = 0LL;
  a7 = v67;
  if (!v67) {
    goto LABEL_96;
  }
LABEL_94:
  if (!(_DWORD)v58) {
    *a7 = v59;
  }
LABEL_96:

  return v58;
}

void sub_183DFF884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSDictionaryCreate(uint64_t a1, char a2, int a3, void *a4)
{
  return _CSDictionaryCreateWithKeysAndValues(a1, a2, a3, 0LL, 0LL, 0, a4);
}

Unit *_CSDictionaryDispose(Unit *result, CSStore2::Store *a2)
{
  if (result && (_DWORD)a2)
  {
    v3 = result;
    if (performMutatingAssertions)
    {
      uint64_t v4 = *(void *)&result->var3[336];
      if (v4) {
        (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
      }
    }

    return CSStore2::Dictionary::Dispose((const CSStore2::Table **)v3->var3, a2);
  }

  return result;
}

uint64_t _CSDictionaryGetCount(uint64_t a1, unsigned int a2)
{
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8LL))(*(void *)(v4 + 8));
    }
  }

  CSStore2::Dictionary::Get((CSStore2::Dictionary *)v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7) {
    return CSStore2::Dictionary::getCount(v6[0], *((_DWORD *)v6[1] + 1));
  }
  else {
    return 0LL;
  }
}

uint64_t _CSDictionaryGetKeyOptions(uint64_t a1, unsigned int a2)
{
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8LL))(*(void *)(v4 + 8));
    }
  }

  CSStore2::Dictionary::Get((CSStore2::Dictionary *)v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7) {
    return *(unsigned __int8 *)v6[1];
  }
  else {
    return 0LL;
  }
}

uint64_t _CSDictionaryGetValueOptions(uint64_t a1, unsigned int a2)
{
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8LL))(*(void *)(v4 + 8));
    }
  }

  CSStore2::Dictionary::Get((CSStore2::Dictionary *)v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7) {
    return *(unsigned __int8 *)(v6[1] + 1LL);
  }
  else {
    return 0LL;
  }
}

_DWORD *_CSDictionaryGetValue(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (performConstantAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8LL))(*(void *)(v6 + 8));
    }
  }

  CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v11, (CSStore2::Store *)(a1 + 8), a2);
  if (!v13) {
    return 0LL;
  }
  uint64_t v7 = *(unsigned int *)(v12 + 4);
  if ((_DWORD)v7 == -1) {
    return 0LL;
  }
  v8 = (CSStore2 **)v11;
  uint64_t v9 = *(void *)(*(void *)v11 + 8LL);
  if ((*(_BYTE *)v12 & 1) != 0) {
    CSStore2::getOrCopyStringFrom4CC((CSStore2 *)&v11, (char **)v11, a3, 0);
  }
  else {
    CSStore2::String::Get(&v11, v11, a3);
  }
  if (!v14) {
    return 0LL;
  }
  result = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find( *v8,  (int *)(v9 + v7),  v12);
  if (result) {
    return (_DWORD *)*result;
  }
  return result;
}

void _CSDictionarySetValue(uint64_t a1, unsigned int a2, unsigned int a3, CSStore2::Store *a4)
{
  if (performMutatingAssertions)
  {
    uint64_t v8 = *(void *)(a1 + 344);
    if (v8) {
      (***(void (****)(void))(v8 + 8))(*(void *)(v8 + 8));
    }
  }

  CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v48, (CSStore2::Store *)(a1 + 8), a2);
  if (v51)
  {
    uint64_t v9 = v49;
    uint64_t v10 = *(unsigned int *)(v49 + 4);
    if ((_DWORD)v10 != -1)
    {
      v11 = (CSStore2 **)v48;
      uint64_t v12 = *(void *)(*(void *)v48 + 8LL);
      if (*(_DWORD *)(v12 + 12) > v10)
      {
        CSStore2::Dictionary::_CopyCanonicalKey((CSStore2::Dictionary *)&v53, (char **)v48, a3, *(_BYTE *)v49);
        if (v55)
        {
          char v13 = (int *)(v12 + v10);
          int v14 = v54;
          v15 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find(*v11, v13, v54);
          if (v15) {
            BOOL v16 = 1;
          }
          else {
            BOOL v16 = (_DWORD)a4 == 0;
          }
          if (!v16)
          {
            CSStore2::String::retain((unsigned int *)&v53);
            CSStore2::Dictionary::_TakeOwnershipOfValue((unsigned int *)v11, a4, *(unsigned __int8 *)(v9 + 1));
            goto LABEL_21;
          }

          v17 = v15;
          if (v15) {
            BOOL v18 = (_DWORD)a4 == 0;
          }
          else {
            BOOL v18 = 0;
          }
          if (v18)
          {
            CSStore2::String::release(&v53);
            CSStore2::Dictionary::_RelinquishOwnershipOfValue( (CSStore2::Store *)v11,  (CSStore2::Store *)*v17,  *(unsigned __int8 *)(v9 + 1));
          }

          else
          {
            if (v15 && *v15 != (_DWORD)a4)
            {
              CSStore2::Dictionary::_TakeOwnershipOfValue((unsigned int *)v11, a4, *(unsigned __int8 *)(v9 + 1));
              CSStore2::Dictionary::_RelinquishOwnershipOfValue( (CSStore2::Store *)v11,  (CSStore2::Store *)*v17,  *(unsigned __int8 *)(v9 + 1));
            }

            if ((_DWORD)a4)
            {
LABEL_21:
              if (!v14)
              {
LABEL_70:
                CSStore2::Store::collectGarbage((CSStore2::Store *)v11, 0LL);
                CSStore2::Dictionary::Get((CSStore2::Dictionary *)v52, (CSStore2::Store *)v11, v50);
LABEL_71:
                CSStore2::String::release(&v53);
                return;
              }

              v19 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find( *v11,  v13,  v14);
              if (v19)
              {
                _DWORD *v19 = (_DWORD)a4;
                goto LABEL_70;
              }

              v21 = &v13[2 * ((unsigned __int16)v14 % *v13)];
              unint64_t v22 = (unint64_t)(v21 + 1);
              uint64_t v23 = v21[2];
              if ((_DWORD)v23 == -1)
              {
                v27 = 0LL;
              }

              else
              {
                uint64_t v24 = *((void *)*v11 + 1);
                BOOL v25 = *(_DWORD *)(v24 + 12) > v23;
                v26 = (char *)(v24 + v23);
                if (v25) {
                  v27 = v26;
                }
                else {
                  v27 = 0LL;
                }
              }

              uint64_t v28 = *(unsigned int *)v22;
              if ((_DWORD)v28)
              {
                uint64_t v29 = 0LL;
                v30 = v27 + 4;
                while (*(v30 - 1) && *v30)
                {
                  ++v29;
                  v30 += 2;
                  if (v28 == v29) {
                    goto LABEL_38;
                  }
                }

                v36 = (int *)&v27[8 * v29];
                int *v36 = v14;
                v36[1] = (int)a4;
                goto LABEL_70;
              }

LABEL_38:
              unsigned int v31 = v28 + 8;
              v32 = *v11;
              if (*v11)
              {
                unint64_t v33 = *((void *)v32 + 1);
                unsigned int v34 = -1;
                BOOL v35 = v22 >= v33;
                v22 -= v33;
                if (!v35)
                {
LABEL_50:
                  v38 = CSStore2::Store::embraceAndExtend( (CSStore2::Store *)v11,  v27,  (const void *)(8 * v28),  8 * v31);
                  if (v34 == -1 || (uint64_t v39 = *((void *)*v11 + 1), *(_DWORD *)(v39 + 12) <= v34)) {
                    v40 = 0LL;
                  }
                  else {
                    v40 = (_DWORD *)(v39 + v34);
                  }
                  if (!v38)
                  {
                    v40[1] = -1;
                    abort();
                  }

                  v41 = *v11;
                  if (*v11) {
                    unint64_t v42 = *((void *)v41 + 1);
                  }
                  else {
                    unint64_t v42 = 0LL;
                  }
                  int v43 = -1;
                  BOOL v35 = (unint64_t)v38 >= v42;
                  unint64_t v44 = (unint64_t)&v38[-v42];
                  if (v35 && !HIDWORD(v44))
                  {
                    else {
                      int v43 = v44;
                    }
                  }

                  v40[1] = v43;
                  v46 = (int *)&v38[8 * v28];
                  int *v46 = v14;
                  v46[1] = (int)a4;
                  if ((int)v28 + 1 < v31)
                  {
                    v47 = &v38[8 * (v28 + 1)];
                    *((void *)v47 + 6) = 0LL;
                    *((_OWORD *)v47 + 1) = 0u;
                    *((_OWORD *)v47 + 2) = 0u;
                    *(_OWORD *)v47 = 0u;
                  }

                  *v40 += 8;
                  goto LABEL_70;
                }
              }

              else
              {
                unsigned int v34 = -1;
              }

              if (!HIDWORD(v22))
              {
                else {
                  unsigned int v34 = v22;
                }
              }

              goto LABEL_50;
            }
          }

          if (v14)
          {
            v20 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find( *v11,  v13,  v14);
            if (v20) {
              _DWORD *v20 = 0;
            }
          }

          goto LABEL_71;
        }
      }
    }
  }
}

char *_CSDictionaryRemoveAllValues(uint64_t a1, unsigned int a2)
{
  if (performMutatingAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
    }
  }

  result = CSStore2::Dictionary::Get((CSStore2::Dictionary *)v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7) {
    return (char *)CSStore2::Dictionary::removeAllValues(v6);
  }
  return result;
}

void _CSDictionaryEnumerateAllValues(uint64_t a1, unsigned int a2, void *a3)
{
  id v6 = a3;
  if (performConstantAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (*(void (**)(void))(**(void **)(v5 + 8) + 8LL))(*(void *)(v5 + 8));
    }
  }

  CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v12, (CSStore2::Store *)(a1 + 8), a2);
  if (v14)
  {
    __int128 v9 = v12;
    uint64_t v10 = v13;
    char v11 = 1;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = ___CSDictionaryEnumerateAllValues_block_invoke;
    v7[3] = &unk_189D65788;
    id v8 = v6;
    CSStore2::Dictionary::enumerateKeysAndValues((unint64_t)&v9, 0, v7);
  }

  else
  {
    LOBYTE(v9) = 0;
    char v11 = 0;
  }
}

void sub_183E0007C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

LABEL_11:
  if (!a7)
  {
LABEL_62:
    v15 = 0LL;
    goto LABEL_63;
  }

  return v12;
}
}

LABEL_12:
  v21 = v21;
  v15 = 0LL;
  *a7 = v21;
LABEL_63:

  return v15;
}

      __int128 v12 = v15;
      goto LABEL_13;
    }

void sub_183E00A1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E00D60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_17:
  return v19;
}

  free(v6);
  if (v8) {
    _CSStoreRemoveTable((uint64_t)a1, v8);
  }
  return v15;
}

void sub_183E01024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E01340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E014E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_183E01740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E01804( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_183E01A64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _CSWriteUnitState *a13)
{
  _Unwind_Resume(a1);
}

void sub_183E01BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E01D14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _CSWriteUnitState::~_CSWriteUnitState(_CSWriteUnitState *this)
{
}

__n128 __copy_helper_block_ea8_32c68_ZTSKZ55___CSVisualizationArchiver_writeAllUnitsInTable_block__E3__1( uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 32);
  __int128 v3 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v3;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t __copy_helper_block_ea8_32c68_ZTSKZ55___CSVisualizationArchiver_writeAllUnitsInTable_block__E3__0( uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(4 * a1);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

void sub_183E02078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E02104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E0227C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E02334( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_183E02594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E02784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t initlockdown_checkin_xpc(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  softLinklockdown_checkin_xpc = (uint64_t (*)())dlsym( (void *)lockdownLibrary(void)::sLib,  "lockdown_checkin_xpc");
  uint64_t v9 = ((uint64_t (*)(uint64_t, uint64_t, id, id))softLinklockdown_checkin_xpc)(a1, a2, v7, v8);

  return v9;
}

void sub_183E02854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::readFromLockdownConnection(CSStore2 *this, uint64_t a2, char *a3)
{
  return softLinklockdown_recv((uint64_t)this, a2, (int)a3);
}

uint64_t CSStore2::writeToLockdownConnection(CSStore2 *this, uint64_t a2, const char *a3)
{
  return softLinklockdown_send((uint64_t)this, a2, (int)a3);
}

uint64_t initlockdown_disconnect(uint64_t a1)
{
  softLinklockdown_disconnect = (uint64_t (*)())dlsym( (void *)lockdownLibrary(void)::sLib,  "lockdown_disconnect");
  return ((uint64_t (*)(uint64_t))softLinklockdown_disconnect)(a1);
}

uint64_t initlockdown_send(uint64_t a1, uint64_t a2, uint64_t a3)
{
  softLinklockdown_send = (uint64_t (*)())dlsym((void *)lockdownLibrary(void)::sLib, "lockdown_send");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinklockdown_send)(a1, a2, a3);
}

uint64_t initlockdown_recv(uint64_t a1, uint64_t a2, uint64_t a3)
{
  softLinklockdown_recv = (uint64_t (*)())dlsym((void *)lockdownLibrary(void)::sLib, "lockdown_recv");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinklockdown_recv)(a1, a2, a3);
}

void *___ZL15lockdownLibraryv_block_invoke()
{
  __n128 result = dlopen("/usr/lib//liblockdown.dylib", 2);
  lockdownLibrary(void)::sLib = (uint64_t)result;
  return result;
}

void sub_183E02BA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::~AttributedStringWriter(CSStore2::AttributedStringWriter *this)
{
}

{
  id *v2;
  void *v3;
  *(void *)this = off_189D658F8;
  v2 = (id *)*((void *)this + 31);
  if (v2 == (id *)((char *)this + 8))
  {
    CSStore2::AttributedStringWriter::Impl::~Impl(v2);
  }

  else if (v2)
  {
    CSStore2::AttributedStringWriter::Impl::~Impl(v2);
    operator delete(v3);
  }

void CSStore2::AttributedStringWriter::Impl::~Impl(id *this)
{
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)(this + 14));
  std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::~__hash_table((uint64_t)(this + 9));

  id v2 = this[4];
  if (v2)
  {
    this[5] = v2;
    operator delete(v2);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table( uint64_t a1)
{
  id v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      __int128 v3 = (void *)*v2;
      operator delete(v2);
      id v2 = v3;
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

uint64_t std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::~__hash_table( uint64_t a1)
{
  id v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__deallocate_node( id *a1)
{
  if (a1)
  {
    v1 = a1;
    do
    {
      id v2 = (id *)*v1;

      operator delete(v1);
      v1 = v2;
    }

    while (v2);
  }

CSStore2::AttributedStringWriter::Impl *CSStore2::AttributedStringWriter::Impl::Impl( CSStore2::AttributedStringWriter::Impl *this, __CSStore *a2, NSMutableAttributedString *a3)
{
  *(void *)this = 0LL;
  *((void *)this + 1) = a3;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((void *)this + 12) = 0LL;
  *((_DWORD *)this + 26) = 1065353216;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_DWORD *)this + 36) = 1065353216;
  *((_WORD *)this + 76) = 0;
  *((void *)this + 20) = 0LL;
  *((_WORD *)this + 84) = 257;
  *((_BYTE *)this + 170) = 0;
  if (a2) {
    objc_storeStrong((id *)this, a2);
  }
  return this;
}

uint64_t CSStore2::AttributedStringWriter::Impl::getStore(CSStore2::AttributedStringWriter::Impl *this)
{
  return *(void *)this;
}

void CSStore2::AttributedStringWriter::Impl::attributedString(id *this, NSAttributedString *a2)
{
  if (a2)
  {
    [this[1] appendAttributedString:a2];
    if (*((_BYTE *)this + 169))
    {
      -[NSAttributedString string](a2, "string");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      char v4 = [v6 hasSuffix:@"\n"];

      if ((v4 & 1) == 0)
      {
        id v5 = this[1];
        CSStore2::getAttributedStringWithCharacter((CSStore2 *)0xA);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendAttributedString:");
      }
    }
  }

void sub_183E02E88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

id CSStore2::getAttributedStringWithCharacter(CSStore2 *this)
{
  unsigned __int8 v1 = this;
  char v5 = (char)this;
  id v2 = (id)CSStore2::getAttributedStringWithCharacter(char)::attributedStrings[v1];
  if (!v2)
  {
    __int128 v3 = (void *)[objc_alloc(NSString) initWithBytes:&v5 length:1 encoding:1];
    if (v3) {
      id v2 = (id)[objc_alloc(MEMORY[0x1896077E0]) initWithString:v3];
    }
    else {
      id v2 = 0LL;
    }
  }

  return v2;
}

void sub_183E02F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore2L32getAttributedStringWithCharacterEc_block_invoke()
{
  uint64_t v0 = 0LL;
  uint64_t v1 = MEMORY[0x1895F8770];
  do
  {
    char v6 = v0;
    if (v0 - 9 < 2 || (*(_DWORD *)(v1 + 4 * v0 + 60) & 0x40000) != 0)
    {
      __int128 v3 = (void *)[objc_alloc(NSString) initWithBytes:&v6 length:1 encoding:1];
      if (v3)
      {
        uint64_t v4 = [objc_alloc(MEMORY[0x1896077E0]) initWithString:v3];
        char v5 = (void *)CSStore2::getAttributedStringWithCharacter(char)::attributedStrings[v0];
        CSStore2::getAttributedStringWithCharacter(char)::attributedStrings[v0] = v4;
      }
    }

    ++v0;
  }

  while (v0 != 127);
}

void sub_183E03024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::AttributedStringWriter::Impl::createMarker( CSStore2::AttributedStringWriter::Impl *this, NSAttributedString *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  *(void *)uu = 0LL;
  uint64_t v11 = 0LL;
  MEMORY[0x186E27E8C](uu);
  uuid_unparse(uu, out);
  out[36] = 0;
  uint64_t v4 = [NSString stringWithUTF8String:out];
  if (!*((void *)this + 2))
  {
    id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
    char v6 = (void *)*((void *)this + 2);
    *((void *)this + 2) = v5;
  }

  id v7 = (void *)-[NSAttributedString copy](a2, "copy");
  [*((id *)this + 2) setObject:v7 forKeyedSubscript:v4];

  return v4;
}

void sub_183E03110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSAttributedString *CSStore2::AttributedStringWriter::Impl::applyAttributesToAttributedString( CSStore2::AttributedStringWriter::Impl *this, NSAttributedString *a2, char a3)
{
  if (!a2) {
    goto LABEL_17;
  }
  if (*((void *)this + 4) == *((void *)this + 5))
  {
    id v11 = 0LL;
  }

  else
  {
    char v6 = (void *)-[NSAttributedString mutableCopy](a2, "mutableCopy");
    uint64_t v7 = [v6 length];
    id v8 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithCapacity:(uint64_t)(*((void *)this + 5) - *((void *)this + 4)) >> 4];
    uint64_t v9 = (void *)*((void *)this + 4);
    uint64_t v10 = (void *)*((void *)this + 5);
    while (v9 != v10)
    {
      if (*v9)
      {
        if (v9[1]) {
          objc_msgSend(v8, "setObject:forKeyedSubscript:");
        }
      }

      v9 += 2;
    }

    objc_msgSend(v6, "addAttributes:range:", v8, 0, v7);

    id v11 = v6;
  }

  if ([*((id *)this + 2) count] && -[NSAttributedString length](a2, "length") >= 0x24)
  {
    if (!v11) {
      id v11 = (id)-[NSAttributedString mutableCopy](a2, "mutableCopy");
    }
    uint64_t v12 = (void *)[*((id *)this + 2) copy];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = ___ZN8CSStore222AttributedStringWriter4Impl33applyAttributesToAttributedStringEP18NSAttributedStringb_block_invoke;
    v15[3] = &unk_189D658A8;
    v17 = this;
    id v11 = v11;
    id v16 = v11;
    char v18 = a3;
    [v12 enumerateKeysAndObjectsUsingBlock:v15];
  }

  uint64_t v13 = (NSAttributedString *)[v11 copy];

  if (!v13) {
LABEL_17:
  }
    uint64_t v13 = a2;
  return v13;
}

void sub_183E032C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter4Impl33applyAttributesToAttributedStringEP18NSAttributedStringb_block_invoke( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) length];
  uint64_t v7 = 0LL;
  for (char i = 0; ; char i = 1)
  {
    [*(id *)(a1 + 32) string];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = objc_msgSend(v9, "rangeOfString:options:range:", a2, 0, v7, objc_msgSend(*(id *)(a1 + 32), "length") - v7);
    uint64_t v11 = v10;

    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withAttributedString:", v7, v11, a3);
  }

  if ((i & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 48)) {
      [*(id *)(v6 + 16) setObject:0 forKeyedSubscript:a2];
    }
  }

void sub_183E033F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSStore2::AttributedStringWriter::Impl::getDateFormatter(CSStore2::AttributedStringWriter::Impl *this)
{
  if (*((void *)this + 3))
  {
    CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::$_0::operator()();
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setLocale:*((void *)this + 3)];
    return v2;
  }

  else
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = ___ZNK8CSStore222AttributedStringWriter4Impl16getDateFormatterEv_block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    return (id)CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::df;
  }

void sub_183E034C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::$_0::operator()()
{
  id v0 = objc_alloc_init(MEMORY[0x189607848]);
  [v0 setDateStyle:1];
  [v0 setTimeStyle:1];
  [MEMORY[0x189604020] systemTimeZone];
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 setTimeZone:v1];

  [MEMORY[0x189603F90] systemLocale];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 setLocale:v2];

  return v0;
}

void sub_183E03558(_Unwind_Exception *a1)
{
  __int128 v3 = v2;

  _Unwind_Resume(a1);
}

void ___ZNK8CSStore222AttributedStringWriter4Impl16getDateFormatterEv_block_invoke()
{
  uint64_t v0 = CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::$_0::operator()();
  uint64_t v1 = (void *)CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::df;
  CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::df = v0;
}

id CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(id *this)
{
  if (this[3])
  {
    id v2 = objc_alloc_init(MEMORY[0x189607840]);
    [v2 setAllowsFractionalUnits:1];
    [v2 setUnitsStyle:5];
    [v2 setCollapsesLargestUnit:1];
    __int128 v3 = (void *)MEMORY[0x189603F38];
    [this[3] calendarIdentifier];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 calendarWithIdentifier:v4];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      [v5 setLocale:this[3]];
      [v2 setCalendar:v5];
    }

    return v2;
  }

  else
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = ___ZNK8CSStore222AttributedStringWriter4Impl26getDateComponentsFormatterEv_block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    return (id)CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(void)const::dcf;
  }

void sub_183E036C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZNK8CSStore222AttributedStringWriter4Impl26getDateComponentsFormatterEv_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607840]);
  [v0 setAllowsFractionalUnits:1];
  [v0 setUnitsStyle:5];
  [v0 setCollapsesLargestUnit:1];
  uint64_t v1 = (void *)CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(void)const::dcf;
  CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(void)const::dcf = (uint64_t)v0;
}

void sub_183E03744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CSStore2::AttributedStringWriter *CSStore2::AttributedStringWriter::AttributedStringWriter( CSStore2::AttributedStringWriter *this, __CSStore *a2, NSMutableAttributedString *a3)
{
  *(void *)this = off_189D658F8;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  *((void *)this + 31) = CSStore2::AttributedStringWriter::Impl::Impl( (CSStore2::AttributedStringWriter *)((char *)this + 8),  a2,  a3);
  return this;
}

{
  *(void *)this = off_189D658F8;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  *((void *)this + 31) = CSStore2::AttributedStringWriter::Impl::Impl( (CSStore2::AttributedStringWriter *)((char *)this + 8),  a2,  a3);
  return this;
}

CSStore2::AttributedStringWriter *CSStore2::AttributedStringWriter::AttributedStringWriter( CSStore2::AttributedStringWriter *this, const CSStore2::AttributedStringWriter *a2)
{
  *(void *)this = off_189D658F8;
  *(_OWORD *)((char *)this + 8) = 0u;
  id v5 = (char *)this + 8;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  uint64_t v6 = (void *)((char *)this + 40);
  unint64_t v7 = *((void *)a2 + 31);
  *((void *)this + 1) = *(id *)v7;
  *((void *)this + 2) = *(id *)(v7 + 8);
  *((void *)this + 3) = *(id *)(v7 + 16);
  *((void *)this + 4) = *(id *)(v7 + 24);
  *uint64_t v6 = 0LL;
  *((void *)this + 6) = 0LL;
  *((void *)this + 7) = 0LL;
  id v8 = *(__int128 **)(v7 + 32);
  uint64_t v9 = *(__int128 **)(v7 + 40);
  if (v9 != v8)
  {
    _ZNSt3__16vectorINS_4pairIP8NSStringP11objc_objectEENS_9allocatorIS8_EEE11__vallocateB8nn180100Em(v6, v9 - v8);
    uint64_t v10 = (_OWORD *)*((void *)this + 6);
    do
    {
      __int128 v11 = *v8++;
      *v10++ = v11;
    }

    while (v8 != v9);
    *((void *)this + 6) = v10;
  }

  id v12 = *(id *)(v7 + 56);
  uint64_t v13 = *(void *)(v7 + 64);
  *((_OWORD *)this + 5) = 0u;
  char v14 = (uint64_t *)((char *)this + 80);
  *((void *)this + 8) = v12;
  *((void *)this + 9) = v13;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = *(_DWORD *)(v7 + 104);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>( (uint64_t)this + 80,  *(void *)(v7 + 80));
  char v55 = v5;
  unint64_t v56 = v7;
  v15 = *(void **)(v7 + 88);
  if (v15)
  {
    id v16 = (void *)((char *)this + 96);
    do
    {
      unint64_t v2 = v15[2];
      unint64_t v17 = *((void *)this + 11);
      if (v17)
      {
        uint8x8_t v18 = (uint8x8_t)vcnt_s8((int8x8_t)v17);
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          unint64_t v7 = v15[2];
          if (v2 >= v17) {
            unint64_t v7 = v2 % v17;
          }
        }

        else
        {
          unint64_t v7 = (v17 - 1) & v2;
        }

        v19 = *(void **)(*v14 + 8 * v7);
        if (v19)
        {
          for (char i = (void *)*v19; i; char i = (void *)*i)
          {
            unint64_t v21 = i[1];
            if (v21 == v2)
            {
              if (i[2] == v2) {
                goto LABEL_45;
              }
            }

            else
            {
              if (v18.u32[0] > 1uLL)
              {
                if (v21 >= v17) {
                  v21 %= v17;
                }
              }

              else
              {
                v21 &= v17 - 1;
              }

              if (v21 != v7) {
                break;
              }
            }
          }
        }
      }

      unint64_t v22 = operator new(0x20uLL);
      *unint64_t v22 = 0LL;
      v22[1] = v2;
      uint64_t v23 = (void *)v15[3];
      v22[2] = v15[2];
      v22[3] = v23;
      float v24 = (float)(unint64_t)(*((void *)this + 13) + 1LL);
      float v25 = *((float *)this + 28);
      if (!v17 || (float)(v25 * (float)v17) < v24)
      {
        BOOL v26 = (v17 & (v17 - 1)) != 0;
        if (v17 < 3) {
          BOOL v26 = 1LL;
        }
        unint64_t v27 = v26 | (2 * v17);
        unint64_t v28 = vcvtps_u32_f32(v24 / v25);
        if (v27 <= v28) {
          size_t v29 = v28;
        }
        else {
          size_t v29 = v27;
        }
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>( (uint64_t)this + 80,  v29);
        unint64_t v17 = *((void *)this + 11);
        if ((v17 & (v17 - 1)) != 0)
        {
          if (v2 >= v17) {
            unint64_t v7 = v2 % v17;
          }
          else {
            unint64_t v7 = v2;
          }
        }

        else
        {
          unint64_t v7 = (v17 - 1) & v2;
        }
      }

      uint64_t v30 = *v14;
      unsigned int v31 = *(void **)(*v14 + 8 * v7);
      if (v31)
      {
        *unint64_t v22 = *v31;
      }

      else
      {
        *unint64_t v22 = *v16;
        *id v16 = v22;
        *(void *)(v30 + 8 * v7) = v16;
        if (!*v22) {
          goto LABEL_44;
        }
        unint64_t v32 = *(void *)(*v22 + 8LL);
        if ((v17 & (v17 - 1)) != 0)
        {
          if (v32 >= v17) {
            v32 %= v17;
          }
        }

        else
        {
          v32 &= v17 - 1;
        }

        unsigned int v31 = (void *)(*v14 + 8 * v32);
      }

      *unsigned int v31 = v22;
LABEL_44:
      ++*((void *)this + 13);
LABEL_45:
      v15 = (void *)*v15;
    }

    while (v15);
  }

  int v54 = a2;
  *(_OWORD *)((char *)this + 120) = 0u;
  unint64_t v33 = (uint64_t *)((char *)this + 120);
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = *(_DWORD *)(v56 + 144);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>( (uint64_t)this + 120,  *(void *)(v56 + 120));
  unsigned int v34 = *(void **)(v56 + 128);
  if (v34)
  {
    BOOL v35 = (void *)((char *)this + 136);
    unint64_t v36 = *((void *)this + 16);
    do
    {
      unint64_t v37 = v34[2];
      if (v36)
      {
        uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)v36);
        v38.i16[0] = vaddlv_u8(v38);
        if (v38.u32[0] > 1uLL)
        {
          unint64_t v2 = v34[2];
          if (v37 >= v36) {
            unint64_t v2 = v37 % v36;
          }
        }

        else
        {
          unint64_t v2 = (v36 - 1) & v37;
        }

        uint64_t v39 = *(void **)(*v33 + 8 * v2);
        if (v39)
        {
          for (j = (void *)*v39; j; j = (void *)*j)
          {
            unint64_t v41 = j[1];
            if (v41 == v37)
            {
              if (j[2] == v37) {
                goto LABEL_86;
              }
            }

            else
            {
              if (v38.u32[0] > 1uLL)
              {
                if (v41 >= v36) {
                  v41 %= v36;
                }
              }

              else
              {
                v41 &= v36 - 1;
              }

              if (v41 != v2) {
                break;
              }
            }
          }
        }
      }

      unint64_t v42 = operator new(0x20uLL);
      *unint64_t v42 = 0LL;
      v42[1] = v37;
      *((_OWORD *)v42 + 1) = *((_OWORD *)v34 + 1);
      float v43 = (float)(unint64_t)(*((void *)this + 18) + 1LL);
      float v44 = *((float *)this + 38);
      if (!v36 || (float)(v44 * (float)v36) < v43)
      {
        BOOL v45 = (v36 & (v36 - 1)) != 0;
        if (v36 < 3) {
          BOOL v45 = 1LL;
        }
        unint64_t v46 = v45 | (2 * v36);
        unint64_t v47 = vcvtps_u32_f32(v43 / v44);
        if (v46 <= v47) {
          size_t v48 = v47;
        }
        else {
          size_t v48 = v46;
        }
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>( (uint64_t)this + 120,  v48);
        unint64_t v36 = *((void *)this + 16);
        if ((v36 & (v36 - 1)) != 0)
        {
          if (v37 >= v36) {
            unint64_t v2 = v37 % v36;
          }
          else {
            unint64_t v2 = v37;
          }
        }

        else
        {
          unint64_t v2 = (v36 - 1) & v37;
        }
      }

      uint64_t v49 = *v33;
      unsigned int v50 = *(void **)(*v33 + 8 * v2);
      if (v50)
      {
        *unint64_t v42 = *v50;
      }

      else
      {
        *unint64_t v42 = *v35;
        *BOOL v35 = v42;
        *(void *)(v49 + 8 * v2) = v35;
        if (!*v42) {
          goto LABEL_85;
        }
        unint64_t v51 = *(void *)(*v42 + 8LL);
        if ((v36 & (v36 - 1)) != 0)
        {
          if (v51 >= v36) {
            v51 %= v36;
          }
        }

        else
        {
          v51 &= v36 - 1;
        }

        unsigned int v50 = (void *)(*v33 + 8 * v51);
      }

      *unsigned int v50 = v42;
LABEL_85:
      ++*((void *)this + 18);
LABEL_86:
      unsigned int v34 = (void *)*v34;
    }

    while (v34);
  }

  *((_WORD *)this + 80) = *(_WORD *)(v56 + 152);
  *((void *)this + 21) = *(id *)(v56 + 160);
  char v52 = *(_BYTE *)(v56 + 170);
  *((_WORD *)this + 88) = *(_WORD *)(v56 + 168);
  *((_BYTE *)this + 178) = v52;
  *((void *)this + 31) = v55;
  if (this == v54) {
    __assert_rtn("AttributedStringWriter", "CSAttributedStringWriter.mm", 389, "this != &other");
  }
  return this;
}

void sub_183E03DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>( uint64_t a1, size_t __n)
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
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }

    else
    {
      uint64_t v13 = 1LL << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }

    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      id v16 = *(void **)a1;
      *(void *)a1 = 0LL;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0LL;
      return;
    }
  }

  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  id v5 = operator new(8 * prime);
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0LL;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0LL;
  while (prime != v7);
  id v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }

    else
    {
      v9 &= prime - 1;
    }

    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    char v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }

        else
        {
          v15 &= prime - 1;
        }

        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }

          *id v8 = *v14;
          *char v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          char v14 = v8;
        }

        size_t v15 = v9;
LABEL_31:
        id v8 = v14;
        char v14 = (void *)*v14;
        size_t v9 = v15;
      }

      while (v14);
    }
  }

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,NSString * {__strong}>,void *>>>::operator()[abi:nn180100]( char a1, id *a2)
{
  if (a1)
  {
  }

  else if (!a2)
  {
    return;
  }

  operator delete(a2);
}

char *_ZNSt3__16vectorINS_4pairIP8NSStringP11objc_objectEENS_9allocatorIS8_EEE11__vallocateB8nn180100Em( void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    abort();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>( unint64_t a1)
{
  if (a1 >> 60) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(16 * a1);
}

uint64_t CSStore2::AttributedStringWriter::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    uint64_t v3 = *(void *)(a2 + 248);
    uint64_t v4 = *(void *)(a1 + 248);
    objc_storeStrong((id *)v4, *(id *)v3);
    objc_storeStrong((id *)(v4 + 8), *(id *)(v3 + 8));
    objc_storeStrong((id *)(v4 + 16), *(id *)(v3 + 16));
    objc_storeStrong((id *)(v4 + 24), *(id *)(v3 + 24));
    if (v4 == v3)
    {
      objc_storeStrong((id *)(v4 + 56), *(id *)(v3 + 56));
      *(void *)(v4 + 64) = *(void *)(v3 + 64);
    }

    else
    {
      id v5 = *(char **)(v4 + 32);
      uint64_t v7 = *(char **)(v3 + 32);
      uint64_t v6 = *(char **)(v3 + 40);
      unint64_t v8 = (v6 - v7) >> 4;
      uint64_t v9 = *(void *)(v4 + 48);
      if (v8 <= (v9 - (uint64_t)v5) >> 4)
      {
        uint8x8_t v12 = *(char **)(v4 + 40);
        unint64_t v16 = (v12 - v5) >> 4;
        if (v16 >= v8)
        {
          unint64_t v22 = *(char **)(v4 + 32);
          while (v7 != v6)
          {
            __int128 v23 = *(_OWORD *)v7;
            v7 += 16;
            *(_OWORD *)unint64_t v22 = v23;
            v22 += 16;
          }

          size_t v15 = (char *)(v22 - v5);
          uint8x8_t v12 = v5;
        }

        else
        {
          unint64_t v17 = &v7[16 * v16];
          if (v12 != v5)
          {
            uint64_t v18 = 16 * v16;
            do
            {
              __int128 v19 = *(_OWORD *)v7;
              v7 += 16;
              *(_OWORD *)id v5 = v19;
              v5 += 16;
              v18 -= 16LL;
            }

            while (v18);
          }

          v20 = v12;
          while (v17 != v6)
          {
            __int128 v21 = *(_OWORD *)v17;
            v17 += 16;
            *(_OWORD *)v20 = v21;
            v20 += 16;
          }

          size_t v15 = (char *)(v20 - v12);
        }
      }

      else
      {
        if (v5)
        {
          *(void *)(v4 + 40) = v5;
          operator delete(v5);
          uint64_t v9 = 0LL;
          *(void *)(v4 + 32) = 0LL;
          *(void *)(v4 + 40) = 0LL;
          *(void *)(v4 + 48) = 0LL;
        }

        if (v6 - v7 < 0) {
          abort();
        }
        uint64_t v10 = v9 >> 3;
        if (v9 >> 3 <= v8) {
          uint64_t v10 = (v6 - v7) >> 4;
        }
        else {
          unint64_t v11 = v10;
        }
        _ZNSt3__16vectorINS_4pairIP8NSStringP11objc_objectEENS_9allocatorIS8_EEE11__vallocateB8nn180100Em( (void *)(v4 + 32),  v11);
        uint8x8_t v12 = *(char **)(v4 + 40);
        uint64_t v13 = v12;
        if (v7 != v6)
        {
          uint64_t v13 = *(char **)(v4 + 40);
          do
          {
            __int128 v14 = *(_OWORD *)v7;
            v7 += 16;
            *(_OWORD *)uint64_t v13 = v14;
            v13 += 16;
          }

          while (v7 != v6);
        }

        size_t v15 = (char *)(v13 - v12);
      }

      *(void *)(v4 + 40) = &v15[(void)v12];
      objc_storeStrong((id *)(v4 + 56), *(id *)(v3 + 56));
      *(void *)(v4 + 64) = *(void *)(v3 + 64);
      if (v4 != v3)
      {
        *(_DWORD *)(v4 + 104) = *(_DWORD *)(v3 + 104);
        float v24 = *(void **)(v3 + 88);
        uint64_t v25 = *(void *)(v4 + 80);
        if (v25)
        {
          for (uint64_t i = 0LL; i != v25; ++i)
            *(void *)(*(void *)(v4 + 72) + 8 * i) = 0LL;
          unint64_t v27 = *(id **)(v4 + 88);
          *(void *)(v4 + 88) = 0LL;
          *(void *)(v4 + 96) = 0LL;
          if (v27) {
            BOOL v28 = v24 == 0LL;
          }
          else {
            BOOL v28 = 1;
          }
          if (v28)
          {
            size_t v29 = v27;
          }

          else
          {
            do
            {
              uint64_t v30 = (void *)v24[3];
              v27[2] = (id)v24[2];
              objc_storeStrong(v27 + 3, v30);
              size_t v29 = (id *)*v27;
              unint64_t v31 = (unint64_t)v27[2];
              v27[1] = (id)v31;
              inserted = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare( v4 + 72,  v31,  v27 + 2);
              std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform( (void *)(v4 + 72),  v27,  inserted);
              float v24 = (void *)*v24;
              if (v29) {
                BOOL v33 = v24 == 0LL;
              }
              else {
                BOOL v33 = 1;
              }
              unint64_t v27 = v29;
            }

            while (!v33);
          }

          std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__deallocate_node(v29);
        }

        for (; v24; float v24 = (void *)*v24)
        {
          unsigned int v34 = operator new(0x20uLL);
          *unsigned int v34 = 0LL;
          BOOL v35 = (void *)v24[3];
          v34[2] = v24[2];
          v34[3] = v35;
          unint64_t v36 = v34[2];
          v34[1] = v36;
          unint64_t v37 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare( v4 + 72,  v36,  v34 + 2);
          std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform( (void *)(v4 + 72),  v34,  v37);
        }

        *(_DWORD *)(v4 + 144) = *(_DWORD *)(v3 + 144);
        uint8x8_t v38 = *(uint64_t **)(v3 + 128);
        uint64_t v39 = *(void *)(v4 + 120);
        if (!v39) {
          goto LABEL_55;
        }
        for (uint64_t j = 0LL; j != v39; *(void *)(*(void *)(v4 + 112) + 8 * j++) = 0LL)
          ;
        unint64_t v41 = *(uint64_t **)(v4 + 128);
        *(void *)(v4 + 128) = 0LL;
        *(void *)(v4 + 136) = 0LL;
        if (v41)
        {
          while (v38)
          {
            unint64_t v42 = v38[2];
            v41[2] = v42;
            *((_DWORD *)v41 + 6) = *((_DWORD *)v38 + 6);
            float v43 = (uint64_t *)*v41;
            v41[1] = v42;
            float v44 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare( v4 + 112,  v42,  v41 + 2);
            std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform( (void *)(v4 + 112),  v41,  v44);
            uint8x8_t v38 = (uint64_t *)*v38;
            unint64_t v41 = v43;
            if (!v43) {
              goto LABEL_55;
            }
          }

          do
          {
            unsigned int v50 = (uint64_t *)*v41;
            operator delete(v41);
            unint64_t v41 = v50;
          }

          while (v50);
        }

        else
        {
LABEL_55:
          while (v38)
          {
            BOOL v45 = operator new(0x20uLL);
            *BOOL v45 = 0LL;
            *((_OWORD *)v45 + 1) = *((_OWORD *)v38 + 1);
            unint64_t v46 = v45[2];
            v45[1] = v46;
            unint64_t v47 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare( v4 + 112,  v46,  v45 + 2);
            std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform( (void *)(v4 + 112),  v45,  v47);
            uint8x8_t v38 = (uint64_t *)*v38;
          }
        }
      }
    }

    *(_WORD *)(v4 + 152) = *(_WORD *)(v3 + 152);
    objc_storeStrong((id *)(v4 + 160), *(id *)(v3 + 160));
    __int16 v48 = *(_WORD *)(v3 + 168);
    *(_BYTE *)(v4 + 170) = *(_BYTE *)(v3 + 170);
    *(_WORD *)(v4 + 168) = v48;
  }

  return a1;
}

void sub_183E044B4(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare( uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    BOOL v9 = 1LL;
    if (v6 >= 3) {
      BOOL v9 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v10 = v9 | (2 * v6);
    unint64_t v11 = vcvtps_u32_f32(v7 / v8);
    if (v10 <= v11) {
      int8x8_t prime = (int8x8_t)v11;
    }
    else {
      int8x8_t prime = (int8x8_t)v10;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v6 = *(void *)(a1 + 8);
    }

    if (*(void *)&prime > v6) {
      goto LABEL_74;
    }
    if (*(void *)&prime >= v6) {
      goto LABEL_43;
    }
    unint64_t v19 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v6 < 3 || (uint8x8_t v20 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v20.i16[0] = vaddlv_u8(v20), v20.u32[0] > 1uLL))
    {
      unint64_t v19 = std::__next_prime(v19);
    }

    else
    {
      uint64_t v21 = 1LL << -(char)__clz(v19 - 1);
      if (v19 >= 2) {
        unint64_t v19 = v21;
      }
    }

    if (*(void *)&prime <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    if (*(void *)&prime >= v6)
    {
      unint64_t v6 = *(void *)(a1 + 8);
      goto LABEL_43;
    }

    if (prime)
    {
LABEL_74:
      if (*(void *)&prime >> 61) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      uint64_t v13 = operator new(8LL * *(void *)&prime);
      __int128 v14 = *(void **)a1;
      *(void *)a1 = v13;
      if (v14) {
        operator delete(v14);
      }
      uint64_t v15 = 0LL;
      *(int8x8_t *)(a1 + 8) = prime;
      do
        *(void *)(*(void *)a1 + 8 * v15++) = 0LL;
      while (*(void *)&prime != v15);
      unint64_t v16 = *(void **)(a1 + 16);
      if (v16)
      {
        unint64_t v17 = v16[1];
        uint8x8_t v18 = (uint8x8_t)vcnt_s8(prime);
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          if (v17 >= *(void *)&prime) {
            v17 %= *(void *)&prime;
          }
        }

        else
        {
          v17 &= *(void *)&prime - 1LL;
        }

        *(void *)(*(void *)a1 + 8 * v17) = a1 + 16;
        for (uint64_t i = (void *)*v16; *v16; uint64_t i = (void *)*v16)
        {
          unint64_t v23 = i[1];
          if (v18.u32[0] > 1uLL)
          {
            if (v23 >= *(void *)&prime) {
              v23 %= *(void *)&prime;
            }
          }

          else
          {
            v23 &= *(void *)&prime - 1LL;
          }

          if (v23 == v17)
          {
            unint64_t v16 = i;
          }

          else
          {
            float v24 = i;
            if (*(void *)(*(void *)a1 + 8 * v23))
            {
              do
              {
                uint64_t v25 = v24;
                float v24 = (void *)*v24;
              }

              while (v24 && i[2] == v24[2]);
              *unint64_t v16 = v24;
              *uint64_t v25 = **(void **)(*(void *)a1 + 8 * v23);
              **(void **)(*(void *)a1 + 8 * v23) = i;
            }

            else
            {
              *(void *)(*(void *)a1 + 8 * v23) = v16;
              unint64_t v16 = i;
              unint64_t v17 = v23;
            }
          }
        }
      }

      unint64_t v6 = (unint64_t)prime;
    }

    else
    {
      BOOL v35 = *(void **)a1;
      *(void *)a1 = 0LL;
      if (v35) {
        operator delete(v35);
      }
      unint64_t v6 = 0LL;
      *(void *)(a1 + 8) = 0LL;
    }
  }

LABEL_43:
  uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v26.i16[0] = vaddlv_u8(v26);
  if (v26.u32[0] > 1uLL)
  {
    unint64_t v27 = a2;
    if (v6 <= a2) {
      unint64_t v27 = a2 % v6;
    }
  }

  else
  {
    unint64_t v27 = (v6 - 1) & a2;
  }

  BOOL v28 = *(void **)(*(void *)a1 + 8 * v27);
  if (!v28) {
    return 0LL;
  }
  int v29 = 0;
  do
  {
    __n128 result = v28;
    BOOL v28 = (void *)*v28;
    if (!v28) {
      break;
    }
    unint64_t v31 = v28[1];
    if (v26.u32[0] > 1uLL)
    {
      unint64_t v32 = v28[1];
      if (v31 >= v6) {
        unint64_t v32 = v31 % v6;
      }
    }

    else
    {
      unint64_t v32 = v31 & (v6 - 1);
    }

    if (v32 != v27) {
      break;
    }
    BOOL v33 = v31 == a2 && v28[2] == *a3;
    int v34 = v29 & !v33;
    v29 |= v33;
  }

  while (v34 != 1);
  return result;
}

  return v31;
}

void *std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform( void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }

  else
  {
    v4 &= *(void *)&v3 - 1LL;
  }

  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8LL);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }

    else
    {
      v6 &= *(void *)&v3 - 1LL;
    }

LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }

  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8LL);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }

    else
    {
      v6 &= *(void *)&v3 - 1LL;
    }

    if (v6 != v4) {
      goto LABEL_18;
    }
  }

    BOOL v9 = v21;
  }

LABEL_19:
  ++result[3];
  return result;
}

  return v14;
}

void CSStore2::AttributedStringWriter::attributedString( CSStore2::AttributedStringWriter::Impl **this, NSAttributedString *a2)
{
  int8x8_t v3 = a2;
  unint64_t v4 = (void *)MEMORY[0x186E27B50]();
  CSStore2::AttributedStringWriter::Impl::applyAttributesToAttributedString(this[31], v3, 1);
  uint8x8_t v5 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();

  CSStore2::AttributedStringWriter::Impl::attributedString((id *)this[31], v5);
  objc_autoreleasePoolPop(v4);
}

void sub_183E04984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::attributedString( CSStore2::AttributedStringWriter *this, NSAttributedString *a2, NSAttributedString *a3)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  uint8x8_t v5 = a2;
  unint64_t v6 = a3;
  float v7 = (void *)MEMORY[0x186E27B50]();
  if (*(_BYTE *)(*((void *)this + 31) + 168LL))
  {
    if (!-[NSAttributedString length](v6, "length"))
    {
      CSStore2::getLog(0LL);
      float v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[NSAttributedString string](v6, "string");
        BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSAttributedString string](v5, "string");
        unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        unint64_t v36 = v9;
        __int16 v37 = 2114;
        uint8x8_t v38 = v10;
        _os_log_debug_impl( &dword_183DFE000,  v8,  OS_LOG_TYPE_DEBUG,  "Eliding value %{private}@ for title %{public}@",  buf,  0x16u);
      }

      goto LABEL_29;
    }
  }

  else if (!-[NSAttributedString length](v6, "length"))
  {
    uint64_t v11 = CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x23);

    unint64_t v6 = (NSAttributedString *)v11;
  }

  uint8x8_t v12 = (CSStore2 *)*((void *)this + 31);
  if (v5 && *((_BYTE *)v12 + 170))
  {
    CSStore2::getLog(v12);
    float v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[NSAttributedString string](v6, "string");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSAttributedString string](v5, "string");
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      unint64_t v36 = v13;
      __int16 v37 = 2114;
      uint8x8_t v38 = v14;
      _os_log_debug_impl( &dword_183DFE000,  v8,  OS_LOG_TYPE_DEBUG,  "Writing child unit with title -- eliding value %{private}@ for title %{public}@",  buf,  0x16u);
    }
  }

  else
  {
    CSStore2::AttributedStringWriter::Impl::applyAttributesToAttributedString(v12, v5, 0);
    uint64_t v15 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();

    CSStore2::AttributedStringWriter::Impl::applyAttributesToAttributedString( *((CSStore2::AttributedStringWriter::Impl **)this + 31),  v6,  1);
    unint64_t v16 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();

    if (-[NSAttributedString length](v15, "length"))
    {
      id v17 = objc_alloc(MEMORY[0x1896077E0]);
      -[NSAttributedString string](v15, "string");
      uint8x8_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v33 = @"_CSVOutputType";
      int v34 = &unk_189D695F8;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint8x8_t v5 = (NSAttributedString *)[v17 initWithString:v18 attributes:v19];
    }

    else
    {
      uint8x8_t v5 = v15;
    }

    uint8x8_t v20 = (void *)-[NSAttributedString mutableCopy](v16, "mutableCopy");
    uint64_t v21 = v20;
    if (v20)
    {
      v31[0] = MEMORY[0x1895F87A8];
      v31[1] = 3221225472LL;
      v31[2] = ___ZN8CSStore222AttributedStringWriter16attributedStringEP18NSAttributedStringS2__block_invoke;
      v31[3] = &unk_189D65910;
      id v22 = v20;
      id v32 = v22;
      unint64_t v23 = (void *)MEMORY[0x186E27CB8](v31);
      float v24 = (void *)MEMORY[0x186E27B50]();
      -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:]( v16,  "enumerateAttribute:inRange:options:usingBlock:",  @"_CSVOutputType",  0LL,  -[NSAttributedString length](v16, "length"),  0x100000LL,  v23);
      objc_autoreleasePoolPop(v24);
      unint64_t v6 = (NSAttributedString *)v22;
    }

    else
    {
      unint64_t v6 = v16;
    }

    uint64_t v25 = (os_log_s *)objc_alloc_init(MEMORY[0x189607928]);
    float v8 = v25;
    if (v25)
    {
      if (v5) {
        -[os_log_s appendAttributedString:](v25, "appendAttributedString:", v5);
      }
      if (-[NSAttributedString length](v5, "length"))
      {
        CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x3A);
        uint8x8_t v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[os_log_s appendAttributedString:](v8, "appendAttributedString:", v26);
      }

      id v27 = objc_alloc_init(MEMORY[0x189607928]);
      if (v27)
      {
        if (-[NSAttributedString length](v5, "length"))
        {
          CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x20);
          BOOL v28 = (void *)objc_claimAutoreleasedReturnValue();
          [v27 appendAttributedString:v28];
        }

        uint64_t v29 = -[os_log_s length](v8, "length");
        if ((unint64_t)([v27 length] + v29) <= 0x1B)
        {
          CSStore2::getAttributedStringWithRepeatedCharacter((CSStore2 *)(28
                                                                        - (-[os_log_s length](v8, "length")
                                                                         + [v27 length])));
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v27 appendAttributedString:v30];
        }

        objc_msgSend( v27,  "addAttribute:value:range:",  @"_CSVOutputType",  &unk_189D69640,  0,  objc_msgSend(v27, "length"));
        -[os_log_s appendAttributedString:](v8, "appendAttributedString:", v27);
      }

      -[os_log_s appendAttributedString:](v8, "appendAttributedString:", v6);
      CSStore2::AttributedStringWriter::Impl::attributedString(*((id **)this + 31), (NSAttributedString *)v8);
    }
  }

{
  NSAttributedString *v4;
  NSString *p_isa;
  unint64_t v4 = a2;
  if (a2) {
    a2 = (NSAttributedString *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:a2];
  }
  p_isa = (NSString *)&a2->super.isa;
  CSStore2::AttributedStringWriter::attributedString(this, a2, a3);
  if (v4) {
}
  }

LABEL_29:
  objc_autoreleasePoolPop(v7);
}

  return v13;
}

void sub_183E04E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSStore2::getLog(CSStore2 *this)
{
  return (id)CSStore2::getLog(void)::result;
}

uint64_t ___ZN8CSStore222AttributedStringWriter16attributedStringEP18NSAttributedStringS2__block_invoke( uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (!a2) {
    return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", @"_CSVOutputType", &unk_189D69628, a3, a4);
  }
  if ([a2 isEqual:&unk_189D695F8]) {
    return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", @"_CSVOutputType", &unk_189D69628, a3, a4);
  }
  uint64_t result = [a2 isEqual:&unk_189D69610];
  if ((_DWORD)result) {
    return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", @"_CSVOutputType", &unk_189D69628, a3, a4);
  }
  return result;
}

id CSStore2::getAttributedStringWithRepeatedCharacter(CSStore2 *this)
{
  if (this)
  {
    if ((v8.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      unint64_t v2 = &v8;
    }
    else {
      unint64_t v2 = (std::string *)v8.__r_.__value_.__r.__words[0];
    }
    memset(v2, 32, (size_t)this);
  }

  id v3 = objc_alloc(MEMORY[0x1896077E0]);
  if ((v8.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    unint64_t v4 = &v8;
  }
  else {
    unint64_t v4 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  [NSString stringWithUTF8String:v4];
  uint8x8_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = (void *)[v3 initWithString:v5];

  return v6;
}

void sub_183E05090( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ___ZN8CSStore2L6getLogEv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.coreservicesstore", "attrstrwriter");
  uint64_t v1 = (void *)CSStore2::getLog(void)::result;
  CSStore2::getLog(void)::uint64_t result = (uint64_t)v0;
}

uint64_t CSStore2::AttributedStringWriter::elidesEmptyValues(CSStore2::AttributedStringWriter *this)
{
  return *(unsigned __int8 *)(*((void *)this + 31) + 168LL);
}

void sub_183E05170( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (v10) {

  }
  _Unwind_Resume(exception_object);
}

void CSStore2::AttributedStringWriter::string( CSStore2::AttributedStringWriter *this, NSString *a2, NSString *a3)
{
  if (a2)
  {
    float v7 = (NSAttributedString *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:a2];
    if (a3)
    {
LABEL_3:
      unint64_t v6 = (NSAttributedString *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:a3];
      goto LABEL_6;
    }
  }

  else
  {
    float v7 = 0LL;
    if (a3) {
      goto LABEL_3;
    }
  }

  unint64_t v6 = 0LL;
LABEL_6:
  CSStore2::AttributedStringWriter::attributedString(this, v7, v6);
  if (a3) {

  }
  if (a2) {
}
  }

void sub_183E05234( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (v11) {

  }
  if (v10) {
  _Unwind_Resume(exception_object);
  }
}

void CSStore2::AttributedStringWriter::string( CSStore2::AttributedStringWriter::Impl **this, NSAttributedString *a2)
{
  unint64_t v2 = a2;
  if (a2) {
    a2 = (NSAttributedString *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:a2];
  }
  p_isa = (NSString *)&a2->super.isa;
  CSStore2::AttributedStringWriter::attributedString(this, a2);
  if (v2) {
}
  }

void sub_183E052C4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (v10) {

  }
  _Unwind_Resume(exception_object);
}

void CSStore2::AttributedStringWriter::string( CSStore2::AttributedStringWriter *this, NSString *a2, unsigned int a3)
{
  id v3 = (uint64_t *)*((void *)this + 31);
  uint64_t v4 = *v3;
  if (*v3)
  {
    uint64_t v8 = _CSStringCopyCFString(*v3, a3);
    id v11 = (id)v8;
    if (!a3 || v8)
    {
      uint64_t UnitFromID = _CSStringGetUnitFromID(v4, a3);
      StringTable = _CSStoreGetStringTable(v4);
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = ___ZN8CSStore222AttributedStringWriter6stringEP8NSStringj_block_invoke_2;
      v12[3] = &unk_189D65960;
      __int128 v14 = this;
      v12[4] = a2;
      id v13 = v11;
      CSStore2::AttributedStringWriter::withReferenceToUnit( (uint64_t)this,  (uint64_t)StringTable,  UnitFromID,  (uint64_t)v12);
    }

    else
    {
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v15[2] = ___ZN8CSStore222AttributedStringWriter6stringEP8NSStringj_block_invoke;
      v15[3] = &unk_189D65938;
      unsigned int v16 = a3;
      void v15[4] = a2;
      v15[5] = this;
      CSStore2::AttributedStringWriter::withWarningColors((uint64_t)this, (uint64_t)v15);
    }
  }

void sub_183E05408( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
}

void ___ZN8CSStore222AttributedStringWriter6stringEP8NSStringj_block_invoke(uint64_t a1)
{
  unint64_t v2 = *(CSStore2::AttributedStringWriter **)(a1 + 40);
  id v3 = (NSString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Could not find string unit %llx!",  *(unsigned int *)(a1 + 48));
  CSStore2::AttributedStringWriter::string(v2, *(NSString **)(a1 + 32), v3);
}

void sub_183E05490( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

uint64_t CSStore2::AttributedStringWriter::withWarningColors(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = ___ZN8CSStore222AttributedStringWriter17withWarningColorsEU13block_pointerFvvE_block_invoke;
  v3[3] = &unk_189D66300;
  v3[4] = a2;
  v3[5] = a1;
  return CSStore2::AttributedStringWriter::withAppliedAttribute( a1,  (uint64_t)@"_LSWarning",  MEMORY[0x189604A88],  (uint64_t)v3);
}

void ___ZN8CSStore222AttributedStringWriter6stringEP8NSStringj_block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    uint64_t v1 = *(__CFString **)(a1 + 40);
  }
  else {
    uint64_t v1 = &stru_189D66DA8;
  }
  CSStore2::AttributedStringWriter::string( *(CSStore2::AttributedStringWriter **)(a1 + 48),  *(NSString **)(a1 + 32),  &v1->isa);
}

void CSStore2::AttributedStringWriter::withReferenceToUnit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  do
    uint64_t v8 = __ldaxr((unsigned int *)&CSStore2::currentBackrefDepth);
  while (__stlxr(v8 + 1, (unsigned int *)&CSStore2::currentBackrefDepth));
  id v11 = (id)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"_CSbr%u", v8);
  +[_CSVisualizer URLForUnit:inTable:](&OBJC_CLASS____CSVisualizer, "URLForUnit:inTable:", a3, a2);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::withAppliedAttribute(a1, (uint64_t)v11, (uint64_t)v9, a4);
  do
    unsigned int v10 = __ldaxr((unsigned int *)&CSStore2::currentBackrefDepth);
  while (__stlxr(v10 - 1, (unsigned int *)&CSStore2::currentBackrefDepth));
}

void sub_183E055E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::AttributedStringWriter::withAppliedAttribute( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void **)(a1 + 248);
  unsigned int v10 = (void *)v8[5];
  unint64_t v9 = v8[6];
  if ((unint64_t)v10 >= v9)
  {
    uint64_t v12 = v8[4];
    uint64_t v13 = ((uint64_t)v10 - v12) >> 4;
    unint64_t v14 = v13 + 1;
    uint64_t v15 = v9 - v12;
    if (v15 >> 3 > v14) {
      unint64_t v14 = v15 >> 3;
    }
    else {
      unint64_t v16 = v14;
    }
    id v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v16);
    uint8x8_t v18 = &v17[16 * v13];
    uint8x8_t v20 = &v17[16 * v19];
    *(void *)uint8x8_t v18 = a2;
    *((void *)v18 + 1) = a3;
    id v11 = v18 + 16;
    id v22 = (char *)v8[4];
    uint64_t v21 = (char *)v8[5];
    if (v21 != v22)
    {
      do
      {
        *((_OWORD *)v18 - 1) = *((_OWORD *)v21 - 1);
        v18 -= 16;
        v21 -= 16;
      }

      while (v21 != v22);
      uint64_t v21 = (char *)v8[4];
    }

    v8[4] = v18;
    v8[5] = v11;
    v8[6] = v20;
    if (v21) {
      operator delete(v21);
    }
  }

  else
  {
    *unsigned int v10 = a2;
    v10[1] = a3;
    id v11 = v10 + 2;
  }

  v8[5] = v11;
  uint64_t result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  *(void *)(*(void *)(a1 + 248) + 40LL) -= 16LL;
  return result;
}

void ___ZN8CSStore222AttributedStringWriter17withWarningColorsEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
}

void CSStore2::AttributedStringWriter::withTextAndBackgroundColor( uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  float v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = ___ZN8CSStore222AttributedStringWriter26withTextAndBackgroundColorEjjU13block_pointerFvvE_block_invoke;
  v8[3] = &unk_189D65A78;
  int v9 = a2;
  v8[4] = a4;
  v8[5] = a1;
  CSStore2::AttributedStringWriter::withAppliedAttribute(a1, (uint64_t)@"_CSVBGColor", (uint64_t)v7, (uint64_t)v8);
}

void sub_183E057B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter26withTextAndBackgroundColorEjjU13block_pointerFvvE_block_invoke( uint64_t a1)
{
}

void CSStore2::AttributedStringWriter::withTextColor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::withAppliedAttribute(a1, (uint64_t)@"_CSVFGColor", (uint64_t)v5, a3);
}

void sub_183E05830( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void CSStore2::AttributedStringWriter::string(CSStore2::AttributedStringWriter *this, unsigned int a2)
{
}

void CSStore2::AttributedStringWriter::array( CSStore2::AttributedStringWriter *this, NSString *a2, NSArray *a3)
{
  uint64_t v21 = this;
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (!a3 || (this = -[NSArray count](a3, "count")) == 0)
  {
    if (*(_BYTE *)(*((void *)v21 + 31) + 168LL))
    {
      CSStore2::getLog(this);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        BOOL v28 = a2;
        _os_log_debug_impl( &dword_183DFE000,  v19,  OS_LOG_TYPE_DEBUG,  "Eliding empty array value for title %{public}@",  buf,  0xCu);
      }

      uint64_t v4 = 0LL;
LABEL_31:

      goto LABEL_32;
    }

    CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x23);
    uint64_t v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    if (!v4) {
      goto LABEL_32;
    }
LABEL_29:
    if (!a2)
    {
      CSStore2::AttributedStringWriter::attributedString((CSStore2::AttributedStringWriter::Impl **)v21, v4);
      goto LABEL_32;
    }

    uint64_t v19 = (os_log_s *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:a2];
    CSStore2::AttributedStringWriter::attributedString(v21, (NSAttributedString *)v19, v4);
    goto LABEL_31;
  }

  uint64_t v4 = (NSAttributedString *)objc_alloc_init(MEMORY[0x189607928]);
  if (!v4) {
    goto LABEL_22;
  }
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v5 = a3;
  uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
  if (!v6) {
    goto LABEL_21;
  }
  uint64_t v7 = *(void *)v23;
  char v8 = 1;
  do
  {
    uint64_t v9 = 0LL;
    do
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(v5);
      }
      unsigned int v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
      if ((v8 & 1) == 0)
      {
        CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x2C);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSAttributedString appendAttributedString:](v4, "appendAttributedString:", v11);

        CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x20);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSAttributedString appendAttributedString:](v4, "appendAttributedString:", v12);
      }

      if (_NSIsNSString())
      {
        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:v10];
        -[NSAttributedString appendAttributedString:](v4, "appendAttributedString:", v13);
      }

      else if (_NSIsNSNumber())
      {
        id v14 = objc_alloc(MEMORY[0x189607928]);
        [v10 description];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = (void *)[v14 initWithString:v15];

        objc_msgSend(v13, "addAttribute:value:range:", @"_CSVNum", v10, 0, objc_msgSend(v13, "length"));
        -[NSAttributedString appendAttributedString:](v4, "appendAttributedString:", v13);
      }

      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NSAttributedString appendAttributedString:](v4, "appendAttributedString:", v10);
          goto LABEL_19;
        }

        id v16 = objc_alloc(MEMORY[0x1896077E0]);
        [v10 description];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        id v17 = (void *)[v16 initWithString:v13];
        -[NSAttributedString appendAttributedString:](v4, "appendAttributedString:", v17);
      }

LABEL_19:
      char v8 = 0;
      ++v9;
    }

    while (v6 != v9);
    uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v22,  v26,  16LL);
    char v8 = 0;
  }

  while (v6);
LABEL_21:

  uint8x8_t v18 = v4;
LABEL_22:

  if (v4) {
    goto LABEL_29;
  }
LABEL_32:
}

void sub_183E05BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::stringArray( CSStore2::AttributedStringWriter *this, NSString *a2, unsigned int a3)
{
  uint64_t v4 = **((void **)this + 31);
  if (v4)
  {
    uint64_t v10 = 0LL;
    id v11 = &v10;
    uint64_t v12 = 0x4812000000LL;
    uint64_t v13 = __Block_byref_object_copy_;
    id v14 = __Block_byref_object_dispose_;
    uint64_t v15 = "";
    __p = 0LL;
    id v17 = 0LL;
    uint64_t v18 = 0LL;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = ___ZN8CSStore222AttributedStringWriter11stringArrayEP8NSStringj_block_invoke;
    v9[3] = &unk_189D65988;
    v9[4] = &v10;
    _CSArrayEnumerateAllValues(v4, a3, v9);
    uint64_t v6 = (unsigned int *)v11[6];
    uint64_t v7 = (unsigned int *)v11[7];
    if (v7 == v6)
    {
      unsigned int v8 = 0;
      CSStore2::AttributedStringWriter::stringArray(this, a2, &v8, 0);
    }

    else
    {
      CSStore2::AttributedStringWriter::stringArray(this, a2, v6, (unint64_t)((char *)v7 - (char *)v6) >> 2);
    }

    _Block_object_dispose(&v10, 8);
    if (__p)
    {
      id v17 = __p;
      operator delete(__p);
    }
  }

void sub_183E05D44( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, void *__p, uint64_t a23)
{
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(__n128 *a1, __n128 *a2)
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

void __Block_byref_object_dispose_(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }

void ___ZN8CSStore222AttributedStringWriter11stringArrayEP8NSStringj_block_invoke( uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = (char *)v4[7];
  unint64_t v5 = v4[8];
  if ((unint64_t)v6 >= v5)
  {
    unsigned int v8 = (char *)v4[6];
    uint64_t v9 = (v6 - v8) >> 2;
    unint64_t v10 = v9 + 1;
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    BOOL v12 = (unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL;
    unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v12) {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unint64_t v13 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v13);
      unsigned int v8 = (char *)v4[6];
      uint64_t v6 = (char *)v4[7];
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    uint64_t v15 = (_DWORD *)(v13 + 4 * v9);
    unint64_t v16 = v13 + 4 * v14;
    _DWORD *v15 = a3;
    uint64_t v7 = v15 + 1;
    while (v6 != v8)
    {
      int v17 = *((_DWORD *)v6 - 1);
      v6 -= 4;
      *--uint64_t v15 = v17;
    }

    v4[6] = v15;
    v4[7] = v7;
    v4[8] = v16;
    if (v8) {
      operator delete(v8);
    }
  }

  else
  {
    *(_DWORD *)uint64_t v6 = a3;
    uint64_t v7 = v6 + 4;
  }

  v4[7] = v7;
}

void CSStore2::AttributedStringWriter::stringArray( CSStore2::AttributedStringWriter *this, NSString *a2, unsigned int *a3, unsigned int a4)
{
  int v17 = 0LL;
  if (a3 && a4)
  {
    uint64_t v6 = **((void **)this + 31);
    if (v6)
    {
      uint64_t v7 = a3;
      uint64_t v8 = a4;
      int v17 = (NSArray *)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:a4];
      do
      {
        unsigned int v10 = *v7++;
        unsigned int v9 = v10;
        uint64_t v11 = (void *)_CSStringCopyCFString(v6, v10);
        if (v11)
        {
          uint64_t UnitFromID = _CSStringGetUnitFromID(v6, v9);
          if ((_DWORD)UnitFromID)
          {
            StringTable = _CSStoreGetStringTable(v6);
            uint64_t v14 = (CSStore2 *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:v11];
            CSStore2::addBackrefToAttributedString(v14, (NSAttributedString *)StringTable, UnitFromID);
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSArray addObject:](v17, "addObject:", v15);
          }

          else
          {
            -[NSArray addObject:](v17, "addObject:", v11);
          }
        }

        --v8;
      }

      while (v8);
    }

    else
    {
      int v17 = 0LL;
    }
  }

  if (v17) {
    unint64_t v16 = v17;
  }
  else {
    unint64_t v16 = (NSArray *)MEMORY[0x189604A58];
  }
  CSStore2::AttributedStringWriter::array(this, a2, v16);
}

void sub_183E05FC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

CSStore2 *CSStore2::addBackrefToAttributedString(CSStore2 *this, NSAttributedString *a2, uint64_t a3)
{
  unint64_t v5 = this;
  +[_CSVisualizer URLForUnit:inTable:](&OBJC_CLASS____CSVisualizer, "URLForUnit:inTable:", a3, a2);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    uint64_t v7 = (CSStore2 *)-[CSStore2 mutableCopy](v5, "mutableCopy");
    -[CSStore2 addAttribute:value:range:]( v7,  "addAttribute:value:range:",  @"_CSdwbr",  v6,  0LL,  -[CSStore2 length](v7, "length"));
  }

  else
  {
    uint64_t v7 = v5;
  }

  return v7;
}

void sub_183E06098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::array(CSStore2::AttributedStringWriter *this, NSArray *a2)
{
}

void CSStore2::AttributedStringWriter::stringArray(CSStore2::AttributedStringWriter *this, unsigned int a2)
{
}

void CSStore2::AttributedStringWriter::stringArray( CSStore2::AttributedStringWriter *this, unsigned int *a2, unsigned int a3)
{
}

uint64_t CSStore2::AttributedStringWriter::number( CSStore2::AttributedStringWriter *this, NSString *a2, NSNumber *a3)
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = ___ZN8CSStore222AttributedStringWriter6numberEP8NSStringP8NSNumber_block_invoke;
  v4[3] = &unk_189D65960;
  v4[5] = a2;
  v4[6] = this;
  v4[4] = a3;
  return CSStore2::AttributedStringWriter::withAppliedAttribute( (uint64_t)this,  (uint64_t)@"_CSVNum",  (uint64_t)a3,  (uint64_t)v4);
}

void ___ZN8CSStore222AttributedStringWriter6numberEP8NSStringP8NSNumber_block_invoke(uint64_t a1)
{
  unint64_t v2 = *(CSStore2::AttributedStringWriter **)(a1 + 48);
  if (*(void *)(a1 + 32))
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    CFTypeID v4 = CFGetTypeID(*(CFTypeRef *)(a1 + 32));
    unint64_t v5 = *(void **)(a1 + 32);
    if (TypeID == v4)
    {
      uint64_t v6 = *(NSString **)(a1 + 40);
      else {
        uint64_t v7 = @"false";
      }
      CSStore2::AttributedStringWriter::string(v2, v6, &v7->isa);
      return;
    }
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  [v5 doubleValue];
  if (v8 != 0.0 || !*(_BYTE *)(*((void *)v2 + 31) + 168LL))
  {
    unsigned int v9 = *(NSString **)(a1 + 40);
    [*(id *)(a1 + 32) description];
    unsigned int v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::string(v2, v9, v10);
  }

void sub_183E06230( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void CSStore2::AttributedStringWriter::formatWithArguments( CSStore2::AttributedStringWriter *this, NSString *a2, NSString *a3, char *a4)
{
  uint64_t v8 = *(void *)(*((void *)this + 31) + 24LL);
  id v9 = objc_alloc(NSString);
  if (v8) {
    unsigned int v10 = (NSString *)[v9 initWithFormat:a3 locale:v8 arguments:a4];
  }
  else {
    unsigned int v10 = (NSString *)[v9 initWithFormat:a3 arguments:a4];
  }
  uint64_t v11 = v10;
  CSStore2::AttributedStringWriter::string(this, a2, v10);
}

void sub_183E062D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void CSStore2::AttributedStringWriter::formatWithArguments( CSStore2::AttributedStringWriter *this, NSString *a2, char *a3)
{
  uint64_t v6 = *(void *)(*((void *)this + 31) + 24LL);
  id v7 = objc_alloc(NSString);
  if (v6) {
    uint64_t v8 = (NSAttributedString *)[v7 initWithFormat:a2 locale:v6 arguments:a3];
  }
  else {
    uint64_t v8 = (NSAttributedString *)[v7 initWithFormat:a2 arguments:a3];
  }
  id v9 = v8;
  CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter::Impl **)this, v8);
}

void sub_183E06360( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void CSStore2::AttributedStringWriter::format(CSStore2::AttributedStringWriter *this, NSString *a2, NSString *a3, ...)
{
  if (a2) {
    CSStore2::AttributedStringWriter::formatWithArguments(this, a2, a3, va);
  }
  else {
    CSStore2::AttributedStringWriter::formatWithArguments(this, a3, va);
  }
}

id CSStore2::AttributedStringWriter::Separator( CSStore2::AttributedStringWriter *this, void *a2, NSString *a3)
{
  if ((_DWORD)this != 45 || a2)
  {
    CSStore2::AttributedStringWriter::Separator(char,NSString *)::$_0::operator()(this, a2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = ___ZN8CSStore222AttributedStringWriter9SeparatorEcP8NSString_block_invoke;
    v5[3] = &unk_189D659B0;
    char v6 = 45;
    v5[4] = 0LL;
    id v3 = (id)CSStore2::AttributedStringWriter::Separator(char,NSString *)::standardSeparator;
  }

  return v3;
}

id CSStore2::AttributedStringWriter::Separator(char,NSString *)::$_0::operator()(unsigned int a1, id a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  int8x16_t v15 = vdupq_n_s8(a1);
  int8x16_t v16 = v15;
  int8x16_t v13 = v15;
  int8x16_t v14 = v15;
  *(int8x16_t *)__dst = v15;
  if (a2)
  {
    unint64_t v2 = (const char *)[a2 UTF8String];
    size_t v3 = strlen(v2);
    if (v3 >= 0x50)
    {
      strlcpy(__dst, v2, 0x51uLL);
    }

    else
    {
      size_t v4 = v3;
      if (v3 <= 0x46)
      {
        unint64_t v5 = &__dst[(80 - v3) >> 1];
        *(v5 - 1) = 32;
        __dst[v4 + ((80 - v4) >> 1)] = 32;
        memcpy(v5, v2, v4);
      }
    }
  }

  char v6 = (void *)[objc_alloc(NSString) initWithBytesNoCopy:__dst length:80 encoding:1 freeWhenDone:0];
  unsigned int v10 = @"_CSVOutputType";
  uint64_t v11 = &unk_189D69658;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:v6 attributes:v7];

  return v8;
}

void sub_183E0659C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter9SeparatorEcP8NSString_block_invoke(uint64_t a1)
{
  uint64_t v1 = CSStore2::AttributedStringWriter::Separator(char,NSString *)::$_0::operator()(*(char *)(a1 + 41), *(id *)(a1 + 32));
  unint64_t v2 = (void *)CSStore2::AttributedStringWriter::Separator(char,NSString *)::standardSeparator;
  CSStore2::AttributedStringWriter::Separator(char,NSString *)::standardSeparator = v1;
}

void CSStore2::AttributedStringWriter::separator( CSStore2::AttributedStringWriter::Impl **this, CSStore2::AttributedStringWriter *a2, NSString *a3)
{
  size_t v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::attributedString(this, v4);
}

void sub_183E06638( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void CSStore2::AttributedStringWriter::timestamp( CSStore2::AttributedStringWriter::Impl **this, NSString *a2, double a3)
{
  char v6 = (void *)MEMORY[0x186E27B50]();
  id DateFormatter = CSStore2::AttributedStringWriter::Impl::getDateFormatter(this[31]);
  [MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:a3];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [DateFormatter stringFromDate:v8];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 timeIntervalSinceNow];
  double v11 = v10;
  BOOL v12 = &stru_189D66DA8;
  if (v10 != 0.0)
  {
    id DateComponentsFormatter = CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter((id *)this[31]);
    id v14 = objc_alloc(NSString);
    [DateComponentsFormatter stringFromTimeInterval:-v11];
    int8x16_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = (__CFString *)[v14 initWithFormat:@", 𝛥 %@", v15];
  }

  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke;
  v19[3] = &unk_189D65A28;
  __int128 v24 = this;
  double v25 = a3;
  id v16 = v8;
  id v20 = v16;
  uint64_t v21 = a2;
  id v17 = v9;
  id v22 = v17;
  uint64_t v18 = v12;
  __int128 v23 = v18;
  double v26 = v11;
  CSStore2::AttributedStringWriter::withAppliedAttribute( (uint64_t)this,  (uint64_t)@"_CSVTime",  (uint64_t)v16,  (uint64_t)v19);

  objc_autoreleasePoolPop(v6);
}

void sub_183E067F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  [MEMORY[0x189607968] numberWithDouble:*(double *)(a1 + 72)];
  size_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke_2;
  v7[3] = &unk_189D65A00;
  uint64_t v12 = v2;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  char v6 = *(void **)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v6;
  id v11 = *(id *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 80);
  CSStore2::AttributedStringWriter::withAppliedAttribute(v2, (uint64_t)@"_CSVNum", (uint64_t)v3, (uint64_t)v7);
}

void sub_183E06938( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke_3;
  v9[3] = &unk_189D659D8;
  uint64_t v14 = v2;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v4;
  id v12 = v5;
  id v13 = *(id *)(a1 + 56);
  uint64_t v6 = MEMORY[0x186E27CB8](v9);
  id v7 = (void *)v6;
  if (*(double *)(a1 + 72) == 0.0)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }

  else
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithDouble:");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::withAppliedAttribute(v2, (uint64_t)@"_CSVTDlt", (uint64_t)v8, (uint64_t)v7);
  }
}

void sub_183E06A5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(CSStore2::AttributedStringWriter **)(a1 + 64);
  [*(id *)(a1 + 32) timeIntervalSince1970];
  double v4 = v3;
  double v5 = fmod(v3, 1.0);
  uint64_t v6 = *(NSString **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  if (v5 == 0.0) {
    CSStore2::AttributedStringWriter::format( v2,  v6,  @"%@ (POSIX %lld%@)",  v7,  (uint64_t)v4,  *(void *)(a1 + 56));
  }
  else {
    CSStore2::AttributedStringWriter::format( v2,  v6,  @"%@ (POSIX %.3f%@)",  v7,  *(void *)&v4,  *(void *)(a1 + 56));
  }
}

void CSStore2::AttributedStringWriter::beginFlags( CSStore2::AttributedStringWriter *this, NSString *a2, uint64_t a3)
{
  uint64_t v5 = *((void *)this + 31);
  if (*(_BYTE *)(v5 + 152))
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "void CSStore2::AttributedStringWriter::beginFlags(NSString *const __strong _Nonnull, uintmax_t)");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInFunction:v10 file:@"CSAttributedStringWriter.mm" lineNumber:826 description:@"Nesting flag lists is not supported. Possible missing call to endFlags()?"];
  }

  uint64_t v6 = -[NSString copy](a2, "copy");
  uint64_t v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = &stru_189D66DA8;
  }
  objc_storeStrong((id *)(v5 + 56), v8);

  *(void *)(v5 + 64) = a3;
  *(_WORD *)(v5 + 152) = 1;
}

void sub_183E06BF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::beginBitfieldFlags( CSStore2::AttributedStringWriter *this, NSString *a2)
{
  uint64_t v3 = *((void *)this + 31);
  if (*(_BYTE *)(v3 + 152))
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"void CSStore2::AttributedStringWriter::beginBitfieldFlags(NSString *const __strong _Nonnull)"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 handleFailureInFunction:v8 file:@"CSAttributedStringWriter.mm" lineNumber:838 description:@"Nesting flag lists is not supported. Possible missing call to endFlags()?"];
  }

  uint64_t v4 = -[NSString copy](a2, "copy");
  uint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = &stru_189D66DA8;
  }
  objc_storeStrong((id *)(v3 + 56), v6);

  *(_WORD *)(v3 + 152) = 257;
}

void sub_183E06CCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::flag(uint64_t a1, unint64_t a2, void *a3, int *a4)
{
  uint64_t v7 = *(void *)(a1 + 248);
  if (!*(_BYTE *)(v7 + 152))
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "void CSStore2::AttributedStringWriter::flag(uintmax_t, NSString *const __strong _Nonnull, const std::optional<RGBColor> &)");
    int8x16_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInFunction:v15 file:@"CSAttributedStringWriter.mm" lineNumber:851 description:@"Called flag() without calling beginFlags() first."];
  }

  uint64_t v8 = *(void *)(v7 + 64);
  if (*(_BYTE *)(v7 + 153))
  {
    *(void *)(v7 + 64) = v8 + 1;
    BOOL v9 = a2 != 0;
    a2 = v8;
    uint64_t v8 = -1LL;
  }

  else
  {
    BOOL v9 = a2;
  }

  unint64_t v16 = a2;
  if ((v9 & v8) != 0)
  {
    uint64_t v10 = [a3 copy];
    uint64_t v11 = std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>( v7 + 72,  a2,  &v16);
    id v12 = (void *)v11[3];
    v11[3] = v10;

    if (*((_BYTE *)a4 + 4))
    {
      int v13 = *a4;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>( v7 + 112,  a2,  &v16)
      + 6) = v13;
    }

    else
    {
      std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__erase_unique<unsigned long>( (void *)(v7 + 112),  a2);
    }
  }

void sub_183E06E1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>( uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }

    BOOL v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == a2)
        {
          if (i[2] == a2) {
            return i;
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
      }
    }
  }

  uint64_t i = operator new(0x20uLL);
  *uint64_t i = 0LL;
  i[1] = a2;
  i[2] = *a3;
  i[3] = 0LL;
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
    std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>( a1,  v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
      else {
        unint64_t v3 = a2;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
  }

  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t i = *v19;
LABEL_38:
    void *v19 = i;
    goto LABEL_39;
  }

  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8LL);
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
  return i;
}

  ++*(void *)(a1 + 24);
  return v10;
}

    return 0LL;
  }

  unint64_t v20 = (*(_DWORD *)v15 & 0xC0000000) != 0x40000000;
  if ((const CSStore2::Table *)(v12 + 20) == a2)
  {
    unint64_t v20 = 1;
    uint64_t v21 = (*(_DWORD *)v15 & 0xC0000000) == 0x40000000;
  }

  else
  {
    uint64_t v21 = 1;
  }

  id v22 = a3 != 4 * *(_DWORD *)v15 || !v20;
  if (v22 || !v21)
  {
    CSStore2::GetLog(v10);
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      __int128 v24 = (4 * *(_DWORD *)a2);
      double v25 = *(unsigned int *)v15;
      int v34 = 134218752;
      BOOL v35 = v24;
      unint64_t v36 = 2048;
      __int16 v37 = a3;
      uint8x8_t v38 = 2048;
      uint64_t v39 = (4 * v25);
      v40 = 2048;
      unint64_t v41 = v25 >> 30;
      double v26 = "*** CSStore corruption detected (3). %llx %llx %llx %llx";
LABEL_43:
      uint64_t v29 = v23;
      uint64_t v30 = 42;
LABEL_44:
      _os_log_fault_impl(&dword_183DFE000, v29, OS_LOG_TYPE_FAULT, v26, (uint8_t *)&v34, v30);
      goto LABEL_39;
    }

    goto LABEL_39;
  }

  return v15;
}

    ++v20;
  }

  while (v20 != v22);

  int v34 = *(void *)(*(void *)(a1 + 40) + 8LL);
  BOOL v35 = *(_BYTE *)(v34 + 24);
  unint64_t v36 = *v9;
  if (!(_DWORD)v36) {
    goto LABEL_70;
  }
  __int16 v37 = 0LL;
  uint8x8_t v38 = *(void *)(a1 + 48);
  while (2)
  {
    uint64_t v39 = &v9[2 * v37];
    unint64_t v42 = v39[1];
    unint64_t v41 = v39 + 1;
    v40 = v42;
    if (v42 - 0x20000000 >= 0xE0000001)
    {
      float v43 = v9[2 * v37 + 2];
      float v44 = v43 + 8 * v40;
      if (!__CFADD__((_DWORD)v43, 8 * v40))
      {
        BOOL v45 = *(void *)(*(void *)v38 + 8LL);
        unint64_t v46 = *(_DWORD *)(v45 + 12);
        if (v44 <= v46 && v46 > v43)
        {
          __int16 v48 = 0LL;
          uint64_t v49 = v45 + v43;
          while (1)
          {
            unsigned int v50 = *(unsigned int *)(v49 + 4);
            if ((_DWORD)v50 != -1)
            {
              unint64_t v51 = *(void *)(*(void *)v38 + 8LL);
              char v52 = *(_DWORD *)(v51 + 12);
              if (v52 <= v50)
              {
                (*(void (**)(void, const char *))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  "Unit %llx in table %llx has an invalid address.");
                goto LABEL_63;
              }

              Unit v53 = (_DWORD *)(v51 + v50);
              int v54 = *(_DWORD *)(v51 + v50 + 4);
              if (v54 >> 25)
              {
                (*(void (**)(void, const char *))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  "Unit %llx is insanely long (payload %llu bytes long.)");
                goto LABEL_63;
              }

              if (v50 >= 0xFFFFFFF8
                || (int)v50 + 8 > v52
                || (char v55 = __CFADD__((_DWORD)v50, v54 + 8), v56 = v50 + v54 + 8, v55)
                || v56 > v52)
              {
                (*(void (**)(void, const char *))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  "Unit %llx is out of range (total %llu bytes long.)");
                goto LABEL_63;
              }

              v57 = *v53 & 0xC0000000;
              if ((*a2 & 0x3FFFFFFF) != 0x3FFFDB5D)
              {
                if (v57 != 0x40000000) {
                  goto LABEL_64;
                }
LABEL_67:
                (*(void (**)(void, const char *))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  "Unit %llx/%llx is garbage");
LABEL_63:
                BOOL v35 = 0;
                goto LABEL_64;
              }

              if (v57 != 0x40000000) {
                goto LABEL_67;
              }
            }

            if (++v23 >= v15) {
              return 4294957797LL;
            }
          }

          if (*a5 == -1) {
            *a5 = v23;
          }
          double v25 = *a4;
LABEL_35:
          if (v25 != -1) {
            return 0LL;
          }
          goto LABEL_39;
        }

        return 4294957797LL;
      }
    }

    if (*a5 == -1) {
      *a5 = v18;
    }
    unint64_t v20 = *a4;
LABEL_11:
    if (v20 != -1) {
      return 0LL;
    }
    goto LABEL_15;
  }

  while (1)
  {
    id v22 = *(_DWORD *)(v12 + 4 * v18);
    if (v22 == v16) {
      break;
    }
    if (v22 == v7 && v22 != v17)
    {
      __n128 result = 0LL;
      *a4 = v18;
      return result;
    }

    if (++v18 >= v14)
    {
      if ((_DWORD)v15)
      {
        id v27 = 0LL;
        __n128 result = 4294957797LL;
        while (1)
        {
          BOOL v28 = *(_DWORD *)(v12 + 4 * v27);
          if (v28 == v16) {
            break;
          }
          if (v28 == v7 && v28 != v17)
          {
            __n128 result = 0LL;
            *a4 = v27;
            return result;
          }

          if (++v27 >= v15) {
            return result;
          }
        }
      }

      return 4294957797LL;
    }
  }

  return 4294957797LL;
}

void sub_183E07030(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>( uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }

    BOOL v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == a2)
          {
            if (v10[2] == a2) {
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

          uint64_t v10 = (void *)*v10;
        }

        while (v10);
      }
    }
  }

  uint64_t v10 = operator new(0x20uLL);
  *uint64_t v10 = 0LL;
  v10[1] = a2;
  v10[2] = *a3;
  *((_DWORD *)v10 + 6) = 0;
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
    std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>( a1,  v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
      else {
        unint64_t v3 = a2;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
  }

  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t v10 = *v19;
LABEL_38:
    void *v19 = v10;
    goto LABEL_39;
  }

  *uint64_t v10 = *(void *)(a1 + 16);
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

void sub_183E07244(_Unwind_Exception *a1)
{
}

void std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__erase_unique<unsigned long>( void *a1, unint64_t a2)
{
  unint64_t v3 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::find<unsigned long>( a1,  a2);
  if (v3)
  {
    int8x8_t v4 = (int8x8_t)a1[1];
    unint64_t v5 = v3[1];
    uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      if (v5 >= *(void *)&v4) {
        v5 %= *(void *)&v4;
      }
    }

    else
    {
      v5 &= *(void *)&v4 - 1LL;
    }

    unint64_t v7 = *(void **)(*a1 + 8 * v5);
    do
    {
      uint8x8_t v8 = v7;
      unint64_t v7 = (void *)*v7;
    }

    while (v7 != v3);
    if (v8 == a1 + 2) {
      goto LABEL_20;
    }
    unint64_t v9 = v8[1];
    if (v6.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v4) {
        v9 %= *(void *)&v4;
      }
    }

    else
    {
      v9 &= *(void *)&v4 - 1LL;
    }

    if (v9 != v5)
    {
LABEL_20:
      if (!*v3) {
        goto LABEL_21;
      }
      unint64_t v10 = *(void *)(*v3 + 8LL);
      if (v6.u32[0] > 1uLL)
      {
        if (v10 >= *(void *)&v4) {
          v10 %= *(void *)&v4;
        }
      }

      else
      {
        v10 &= *(void *)&v4 - 1LL;
      }

      if (v10 != v5) {
LABEL_21:
      }
        *(void *)(*a1 + 8 * v5) = 0LL;
    }

    uint64_t v11 = *v3;
    if (*v3)
    {
      unint64_t v12 = *(void *)(v11 + 8);
      if (v6.u32[0] > 1uLL)
      {
        if (v12 >= *(void *)&v4) {
          v12 %= *(void *)&v4;
        }
      }

      else
      {
        v12 &= *(void *)&v4 - 1LL;
      }

      if (v12 != v5)
      {
        *(void *)(*a1 + 8 * v12) = v8;
        uint64_t v11 = *v3;
      }
    }

    *uint8x8_t v8 = v11;
    void *v3 = 0LL;
    --a1[3];
    operator delete(v3);
  }

void *std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::find<unsigned long>( void *a1, unint64_t a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  uint8x8_t v3 = (uint8x8_t)vcnt_s8(v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    unint64_t v4 = a2;
    if (*(void *)&v2 <= a2) {
      unint64_t v4 = a2 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v4 = (*(void *)&v2 - 1LL) & a2;
  }

  unint64_t v5 = *(void **)(*a1 + 8 * v4);
  if (!v5) {
    return 0LL;
  }
  __n128 result = (void *)*v5;
  if (*v5)
  {
    do
    {
      unint64_t v7 = result[1];
      if (v7 == a2)
      {
        if (result[2] == a2) {
          return result;
        }
      }

      else
      {
        if (v3.u32[0] > 1uLL)
        {
          if (v7 >= *(void *)&v2) {
            v7 %= *(void *)&v2;
          }
        }

        else
        {
          v7 &= *(void *)&v2 - 1LL;
        }

        if (v7 != v4) {
          return 0LL;
        }
      }

      __n128 result = (void *)*result;
    }

    while (result);
  }

  return result;
}

void CSStore2::AttributedStringWriter::missingFlag(uint64_t a1, unint64_t a2, void *a3, int *a4)
{
  uint64_t v7 = *(void *)(a1 + 248);
  if (!*(_BYTE *)(v7 + 152))
  {
    [MEMORY[0x1896077D8] currentHandler];
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "void CSStore2::AttributedStringWriter::missingFlag(uintmax_t, NSString *const __strong _Nonnull, const std::optional<RGBColor> &)");
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInFunction:v15 file:@"CSAttributedStringWriter.mm" lineNumber:892 description:@"Called missingFlag() without calling beginFlags() first."];
  }

  uint64_t v8 = *(void *)(v7 + 64);
  if (*(_BYTE *)(v7 + 153))
  {
    *(void *)(v7 + 64) = v8 + 1;
    BOOL v9 = a2 != 0;
    a2 = v8;
    uint64_t v8 = -1LL;
  }

  else
  {
    BOOL v9 = a2;
  }

  unint64_t v16 = a2;
  if ((v9 & v8) == 0)
  {
    uint64_t v10 = [a3 copy];
    uint64_t v11 = std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>( v7 + 72,  a2,  &v16);
    unint64_t v12 = (void *)v11[3];
    v11[3] = v10;

    if (*((_BYTE *)a4 + 4))
    {
      int v13 = *a4;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>( v7 + 112,  a2,  &v16)
      + 6) = v13;
    }

    else
    {
      std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__erase_unique<unsigned long>( (void *)(v7 + 112),  a2);
    }
  }

void sub_183E07590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::endFlags(CSStore2::AttributedStringWriter *this)
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *((void *)this + 31);
  if (!*(_BYTE *)(v1 + 152))
  {
    [MEMORY[0x1896077D8] currentHandler];
    Unit v53 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"void CSStore2::AttributedStringWriter::endFlags()"];
    int v54 = (void *)objc_claimAutoreleasedReturnValue();
    [v53 handleFailureInFunction:v54 file:@"CSAttributedStringWriter.mm" lineNumber:923 description:@"Called endFlags() without calling beginFlags() first."];
  }

  int8x8_t v2 = (CSStore2 *)MEMORY[0x186E27B50]();
  context = v2;
  if (*(void *)(v1 + 56))
  {
    int8x8_t v2 = (CSStore2 *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:*(void *)(v1 + 56)];
    v57 = (NSAttributedString *)v2;
  }

  else
  {
    v57 = 0LL;
  }

  unint64_t v3 = *(void *)(v1 + 96);
  if (!v3 && *(_BYTE *)(*((void *)this + 31) + 168LL)) {
    goto LABEL_73;
  }
  id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
  if (v3)
  {
    if (v3 >> 61) {
      abort();
    }
    unint64_t v5 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v3);
    uint64_t v7 = &v5[8 * v6];
    uint64_t v8 = v5;
  }

  else
  {
    uint64_t v8 = 0LL;
    uint64_t v7 = 0LL;
  }

  BOOL v9 = *(void **)(v1 + 88);
  if (v9)
  {
    uint64_t v10 = v8;
    do
    {
      if (v10 >= v7)
      {
        uint64_t v12 = (v10 - v8) >> 3;
        unint64_t v13 = v12 + 1;
        if ((v7 - v8) >> 2 > v13) {
          unint64_t v13 = (v7 - v8) >> 2;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v14) {
          unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v14);
        }
        else {
          uint64_t v15 = 0LL;
        }
        unint64_t v16 = (char *)(v14 + 8 * v12);
        *(void *)unint64_t v16 = v9[2];
        uint64_t v11 = v16 + 8;
        while (v10 != v8)
        {
          uint64_t v17 = *((void *)v10 - 1);
          v10 -= 8;
          *((void *)v16 - 1) = v17;
          v16 -= 8;
        }

        uint64_t v7 = (char *)(v14 + 8 * v15);
        if (v8) {
          operator delete(v8);
        }
        uint64_t v8 = v16;
      }

      else
      {
        *(void *)uint64_t v10 = v9[2];
        uint64_t v11 = v10 + 8;
      }

      BOOL v9 = (void *)*v9;
      uint64_t v10 = v11;
    }

    while (v9);
  }

  else
  {
    uint64_t v11 = v8;
  }

  int8x8_t v2 = (CSStore2 *)std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>();
  if (v8 != v11)
  {
    uint64_t v18 = (unint64_t *)v8;
    do
    {
      int8x8_t v19 = *(int8x8_t *)(v1 + 80);
      if (v19)
      {
        unint64_t v20 = *v18;
        uint8x8_t v21 = (uint8x8_t)vcnt_s8(v19);
        v21.i16[0] = vaddlv_u8(v21);
        if (v21.u32[0] > 1uLL)
        {
          unint64_t v22 = *v18;
          if (v20 >= *(void *)&v19) {
            unint64_t v22 = v20 % *(void *)&v19;
          }
        }

        else
        {
          unint64_t v22 = (*(void *)&v19 - 1LL) & v20;
        }

        __int128 v23 = *(void **)(*(void *)(v1 + 72) + 8 * v22);
        if (v23)
        {
          __int128 v24 = (void *)*v23;
          if (*v23)
          {
            do
            {
              unint64_t v25 = v24[1];
              if (v25 == v20)
              {
                if (v24[2] == v20)
                {
                  double v26 = (void *)[objc_alloc(MEMORY[0x189607928]) initWithString:v24[3]];
                  id v27 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::find<unsigned long>( (void *)(v1 + 112),  *v18);
                  if (v27)
                  {
                    [MEMORY[0x189607968] numberWithUnsignedInt:*((unsigned int *)v27 + 6)];
                    BOOL v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend( v26,  "addAttribute:value:range:",  @"_CSVFGColor",  v28,  0,  objc_msgSend(v26, "length"));
                  }

                  [v4 addObject:v26];

                  break;
                }
              }

              else
              {
                if (v21.u32[0] > 1uLL)
                {
                  if (v25 >= *(void *)&v19) {
                    v25 %= *(void *)&v19;
                  }
                }

                else
                {
                  v25 &= *(void *)&v19 - 1LL;
                }

                if (v25 != v22) {
                  break;
                }
              }

              __int128 v24 = (void *)*v24;
            }

            while (v24);
          }
        }
      }

      ++v18;
    }

    while (v18 != (unint64_t *)v11);
  }

  if (v8) {
    operator delete(v8);
  }
  if (v4)
  {
    int8x8_t v2 = (CSStore2 *)[v4 count];
    if (v2)
    {
      uint64_t v29 = (NSAttributedString *)objc_alloc_init(MEMORY[0x189607928]);
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      id v30 = v4;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v62 objects:v73 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v63;
        do
        {
          for (uint64_t i = 0LL; i != v31; ++i)
          {
            if (*(void *)v63 != v32) {
              objc_enumerationMutation(v30);
            }
            uint64_t v34 = *(void *)(*((void *)&v62 + 1) + 8 * i);
            if (-[NSAttributedString length](v29, "length"))
            {
              CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x20);
              BOOL v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSAttributedString appendAttributedString:](v29, "appendAttributedString:", v35);

              CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x20);
              unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSAttributedString appendAttributedString:](v29, "appendAttributedString:", v36);
            }

            -[NSAttributedString appendAttributedString:](v29, "appendAttributedString:", v34);
          }

          uint64_t v31 = [v30 countByEnumeratingWithState:&v62 objects:v73 count:16];
        }

        while (v31);
      }

      if (*(_BYTE *)(v1 + 153)) {
        goto LABEL_80;
      }
      id v37 = objc_alloc(MEMORY[0x1896077E0]);
      objc_msgSend(NSString, "stringWithFormat:", @" (%016llx)", *(void *)(v1 + 64));
      uint8x8_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v39 = (void *)[v37 initWithString:v38];
      -[NSAttributedString appendAttributedString:](v29, "appendAttributedString:", v39);

LABEL_79:
LABEL_80:
      v40 = v30;
      goto LABEL_82;
    }

    v40 = v4;
  }

  else
  {
LABEL_73:
    v40 = 0LL;
  }

  if (*(_BYTE *)(*((void *)this + 31) + 168LL))
  {
    CSStore2::getLog(v2);
    uint8x8_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v52 = *(void *)(v1 + 64);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v52;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v57;
      _os_log_debug_impl( &dword_183DFE000,  (os_log_t)v38,  OS_LOG_TYPE_DEBUG,  "Eliding empty flags value (%016llx) for title %{public}@",  buf,  0x16u);
    }

    uint64_t v29 = 0LL;
    id v30 = v40;
    goto LABEL_79;
  }

  CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x23);
  uint64_t v29 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
LABEL_82:

  objc_autoreleasePoolPop(context);
  if (v29)
  {
    if (*(_BYTE *)(v1 + 153))
    {
      CSStore2::AttributedStringWriter::attributedString(this, v57, v29);
    }

    else
    {
      [MEMORY[0x189607968] numberWithUnsignedLong:*(void *)(v1 + 64)];
      unint64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = MEMORY[0x1895F87A8];
      v58[1] = 3221225472LL;
      v58[2] = ___ZN8CSStore222AttributedStringWriter8endFlagsEv_block_invoke;
      v58[3] = &unk_189D65960;
      v61 = this;
      v59 = v57;
      v60 = v29;
      CSStore2::AttributedStringWriter::withAppliedAttribute( (uint64_t)this,  (uint64_t)@"_CSVNum",  (uint64_t)v41,  (uint64_t)v58);
    }
  }

  __int128 v67 = 0u;
  memset(v70, 0, sizeof(v70));
  int v69 = 1065353216;
  int v71 = 1065353216;
  __int16 v72 = 0;
  uint64_t v68 = 0LL;
  memset(buf, 0, sizeof(buf));
  unint64_t v42 = *(void **)(v1 + 56);
  *(void *)(v1 + 56) = 0LL;

  *(void *)(v1 + 64) = 0LL;
  if (*(void *)(v1 + 96))
  {
    std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__deallocate_node(*(id **)(v1 + 88));
    *(void *)(v1 + 88) = 0LL;
    uint64_t v43 = *(void *)(v1 + 80);
    if (v43)
    {
      for (uint64_t j = 0LL; j != v43; ++j)
        *(void *)(*(void *)(v1 + 72) + 8 * j) = 0LL;
    }

    *(void *)(v1 + 96) = 0LL;
  }

  *(void *)&buf[16] = 0LL;
  BOOL v45 = *(void **)(v1 + 72);
  *(void *)(v1 + 72) = 0LL;
  if (v45) {
    operator delete(v45);
  }
  *(void *)(v1 + 8std::string::resize(&v8, (std::string::size_type)this + 1, 0) = 0LL;
  *(void *)(v1 + 88) = 0LL;
  *(void *)&__int128 v67 = 0LL;
  *(void *)(v1 + 96) = 0LL;
  *(_DWORD *)(v1 + 104) = 1065353216;
  if (*(void *)(v1 + 136))
  {
    unint64_t v46 = *(void **)(v1 + 128);
    if (v46)
    {
      do
      {
        unint64_t v47 = (void *)*v46;
        operator delete(v46);
        unint64_t v46 = v47;
      }

      while (v47);
    }

    *(void *)(v1 + 128) = 0LL;
    uint64_t v48 = *(void *)(v1 + 120);
    if (v48)
    {
      for (uint64_t k = 0LL; k != v48; ++k)
        *(void *)(*(void *)(v1 + 112) + 8 * k) = 0LL;
    }

    *(void *)(v1 + 136) = 0LL;
  }

  v70[0] = 0LL;
  unsigned int v50 = *(void **)(v1 + 112);
  *(void *)(v1 + 112) = 0LL;
  if (v50) {
    operator delete(v50);
  }
  *(void *)(v1 + 12std::string::resize(&v8, (std::string::size_type)this + 1, 0) = 0LL;
  *(void *)(v1 + 128) = 0LL;
  v70[1] = 0LL;
  *(void *)(v1 + 136) = 0LL;
  *(_DWORD *)(v1 + 144) = 1065353216;
  *(_WORD *)(v1 + 152) = v72;
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v70);
  std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__deallocate_node(*((id **)&v67 + 1));
  unint64_t v51 = *(void **)&buf[16];
  *(void *)&buf[16] = 0LL;
  if (v51) {
    operator delete(v51);
  }
}

void sub_183E07D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a1);
}

void ___ZN8CSStore222AttributedStringWriter8endFlagsEv_block_invoke(uint64_t a1)
{
}

id CSStore2::AttributedStringWriter::link( CSStore2::AttributedStringWriter *this, uint64_t a2, uint64_t a3, NSString *a4)
{
  if (a4) {
    uint64_t v8 = (NSAttributedString *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:a4];
  }
  else {
    uint64_t v8 = 0LL;
  }
  CSStore2::AttributedStringWriter::link(this, a2, a3, v8);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4) {

  }
  return v9;
}

void sub_183E07F18(_Unwind_Exception *exception_object)
{
  if (v1) {

  }
  _Unwind_Resume(exception_object);
}

id CSStore2::AttributedStringWriter::link( CSStore2::AttributedStringWriter *this, uint64_t a2, uint64_t a3, NSAttributedString *a4)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v7 = a4;
  uint64_t v8 = v7;
  if (!(_DWORD)a3 && *(_BYTE *)(*((void *)this + 31) + 168LL))
  {
    unint64_t v14 = 0LL;
    if (!v7) {
      goto LABEL_19;
    }
    goto LABEL_13;
  }

  if (!v7)
  {
    id v9 = *(id *)(*((void *)this + 31) + 160LL);
    if (v9)
    {
      uint64_t v10 = v9;
      [v9 summaryOfUnit:a3 inTable:a2];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11) {
        goto LABEL_6;
      }
    }

    [MEMORY[0x189607968] numberWithUnsignedInt:a3];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 description];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
LABEL_6:
      objc_msgSend(v11, "stringByAppendingFormat:", @" (0x%llx)", a3);
      unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      unint64_t v13 = 0LL;
    }

    uint64_t v15 = [objc_alloc(MEMORY[0x1896077E0]) initWithString:v13];

    uint64_t v8 = (NSAttributedString *)v15;
  }

  -[NSAttributedString string](v8, "string");
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
LABEL_13:
    +[_CSVisualizer URLForUnit:inTable:](&OBJC_CLASS____CSVisualizer, "URLForUnit:inTable:", a3, a2);
    unint64_t v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      uint64_t v17 = CSStore2::AttributedStringWriter::link((CSStore2::AttributedStringWriter::Impl **)this, v16, v8);

      unint64_t v14 = (void *)v17;
    }

    else
    {
      CSStore2::getLog(0LL);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v21 = a2;
        __int16 v22 = 2048;
        uint64_t v23 = a3;
        _os_log_error_impl( &dword_183DFE000,  v18,  OS_LOG_TYPE_ERROR,  "Failed to construct URL for table/unit %llx %llx",  buf,  0x16u);
      }
    }
  }

void sub_183E08134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSStore2::AttributedStringWriter::link( CSStore2::AttributedStringWriter::Impl **this, NSURL *a2, NSAttributedString *a3)
{
  unint64_t v5 = a3;
  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x1896077E0]);
    -[NSURL absoluteString](a2, "absoluteString");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v5 = (NSAttributedString *)[v6 initWithString:v7];
  }

  -[NSAttributedString string](v5, "string");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    id v9 = (NSAttributedString *)-[NSAttributedString mutableCopy](v5, "mutableCopy");
    -[NSAttributedString addAttribute:value:range:]( v9,  "addAttribute:value:range:",  @"_CSVLink",  a2,  0LL,  -[NSAttributedString length](v9, "length"));
    Marker = (void *)CSStore2::AttributedStringWriter::Impl::createMarker(this[31], v9);
    uint64_t v11 = Marker;
    if (Marker)
    {
      id v12 = Marker;

      uint64_t v8 = v12;
    }
  }

  return v8;
}

void sub_183E08264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSStore2::AttributedStringWriter::link( CSStore2::AttributedStringWriter::Impl **this, NSURL *a2, NSString *a3)
{
  if (a3) {
    id v6 = (NSAttributedString *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:a3];
  }
  else {
    id v6 = 0LL;
  }
  CSStore2::AttributedStringWriter::link(this, a2, v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3) {

  }
  return v7;
}

void sub_183E08310(_Unwind_Exception *exception_object)
{
  if (v1) {

  }
  _Unwind_Resume(exception_object);
}

void CSStore2::AttributedStringWriter::childUnit( CSStore2::AttributedStringWriter *this, NSString *a2, NSAttributedString *a3, uint64_t a4)
{
  uint64_t v8 = (void *)MEMORY[0x186E27B50]();
  id v9 = *(id *)(*((void *)this + 31) + 160LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (void *)[v9 copy];

    [MEMORY[0x189607968] numberWithBool:a2 != 0];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 userInfo];
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setObject:v12 forKeyedSubscript:@"_CSAttributedStringWriterIsChildUnitWithTitle"];

    [v11 descriptionOfUnit:a4 inTable:a3];
    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = (void *)[v14 mutableCopy];

    if (!(_DWORD)a4) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v15 = 0LL;
    if (!(_DWORD)a4) {
      goto LABEL_7;
    }
  }

  if (!v15)
  {
    CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x23);
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = (void *)[v16 mutableCopy];
  }

LABEL_7:
  while (1)
  {
    [v15 string];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = [v17 hasSuffix:@"\n"];

    if (!v18) {
      break;
    }
    objc_msgSend(v15, "deleteCharactersInRange:", objc_msgSend(v15, "length") - 1, 1);
  }

  if (a2)
  {
    if (v15)
    {
      [v15 string];
      unint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFStringRef theString = v20;
      uint64_t v50 = 0LL;
      uint64_t v51 = [v15 length];
      CharactersPtr = CFStringGetCharactersPtr(v20);
      if (CharactersPtr) {
        CStringPtr = 0LL;
      }
      else {
        CStringPtr = CFStringGetCStringPtr(v20, 0x600u);
      }
      int64_t v52 = 0LL;
      int64_t v53 = 0LL;
      uint64_t v49 = CStringPtr;

      uint64_t v25 = v51;
      if (v51 < 1)
      {
        __int16 v22 = 0LL;
        a3 = (NSAttributedString *)a3;
      }

      else
      {
        uint64_t v26 = 0LL;
        __int16 v22 = 0LL;
        int64_t v27 = 0LL;
        uint64_t v28 = 64LL;
        do
        {
          else {
            uint64_t v29 = v27;
          }
          if (CharactersPtr)
          {
            UniChar v30 = CharactersPtr[v27 + v50];
          }

          else if (v49)
          {
            UniChar v30 = v49[v50 + v27];
          }

          else
          {
            int64_t v31 = v52;
            if (v53 <= v27 || v52 > v27)
            {
              uint64_t v33 = v29 + v26;
              uint64_t v34 = v28 - v29;
              int64_t v35 = v27 - v29;
              int64_t v36 = v35 + 64;
              if (v35 + 64 >= v25) {
                int64_t v36 = v25;
              }
              int64_t v52 = v35;
              int64_t v53 = v36;
              if (v25 >= v34) {
                uint64_t v25 = v34;
              }
              v54.length = v25 + v33;
              v54.location = v35 + v50;
              CFStringGetCharacters(theString, v54, buffer);
              int64_t v31 = v52;
            }

            UniChar v30 = buffer[v27 - v31];
          }

          if (v30 == 10)
          {
            if (!v22)
            {
              [MEMORY[0x189607938] indexSet];
              __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
            }

            [v22 addIndex:v27];
          }

          ++v27;
          uint64_t v25 = v51;
          --v26;
          ++v28;
        }

        while (v27 < v51);
        a3 = (NSAttributedString *)a3;
        if (v22 && [v22 count])
        {
          CSStore2::getAttributedStringWithRepeatedCharacter((CSStore2 *)0x1C);
          id v37 = (void *)objc_claimAutoreleasedReturnValue();
          uint8x8_t v38 = (void *)[v37 mutableCopy];

          objc_msgSend( v38,  "addAttribute:value:range:",  @"_CSVOutputType",  &unk_189D69640,  1,  objc_msgSend(v38, "length") - 1);
          v43[0] = MEMORY[0x1895F87A8];
          v43[1] = 3221225472LL;
          v43[2] = ___ZN8CSStore222AttributedStringWriter9childUnitEP8NSStringjj_block_invoke;
          v43[3] = &unk_189D65A50;
          id v44 = v15;
          id v39 = v38;
          id v45 = v39;
          [v22 enumerateIndexesWithOptions:2 usingBlock:v43];
        }
      }
    }

    else
    {
      __int16 v22 = 0LL;
    }
  }

  else
  {
    CSStore2::AttributedStringWriter::Separator((CSStore2::AttributedStringWriter *)0x2D, 0LL, v19);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 insertAttributedString:v22 atIndex:0];
    if (*(_BYTE *)(*((void *)this + 31) + 169LL))
    {
      CSStore2::getAttributedStringWithCharacter((CSStore2 *)0xA);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "insertAttributedString:atIndex:", v23, objc_msgSend(v22, "length"));
    }

    uint64_t v24 = [v15 length];
    objc_msgSend(v15, "addAttribute:value:range:", @"_CSVIsRelated", MEMORY[0x189604A88], 0, v24);
  }

  CSStore2::addBackrefToAttributedString((CSStore2 *)v15, a3, a4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v41 = (NSAttributedString *)[v40 mutableCopy];

  objc_autoreleasePoolPop(v8);
  if (a2)
  {
    unint64_t v42 = (NSAttributedString *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:a2];
    CSStore2::AttributedStringWriter::attributedString(this, v42, v41);
  }

  else
  {
    CSStore2::AttributedStringWriter::attributedString((CSStore2::AttributedStringWriter::Impl **)this, v41);
  }
}
}

      this = (CSStore2::Store *)CSStore2::Array::Dispose(v4, a2);
      break;
    case 4u:
      this = (CSStore2::Store *)CSStore2::Dictionary::Dispose(this, a2, a3);
      break;
    default:
      return this;
  }

  return this;
}

void sub_183E087D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN8CSStore222AttributedStringWriter9childUnitEP8NSStringjj_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertAttributedString:*(void *)(a1 + 40) atIndex:a2 + 1];
}

id CSStore2::AttributedStringWriter::getVisualizer(CSStore2::AttributedStringWriter *this)
{
  return *(id *)(*((void *)this + 31) + 160LL);
}

uint64_t CSStore2::AttributedStringWriter::insertsNewlines(CSStore2::AttributedStringWriter *this)
{
  return *(unsigned __int8 *)(*((void *)this + 31) + 169LL);
}

void CSStore2::AttributedStringWriter::childUnit( CSStore2::AttributedStringWriter *this, NSAttributedString *a2, uint64_t a3)
{
}

void CSStore2::AttributedStringWriter::setVisualizer( CSStore2::AttributedStringWriter *this, _CSVisualizer *a2)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:@"_CSAttributedStringWriterIsChildUnitWithTitle"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*((void *)this + 31) + 170) = [v4 BOOLValue];
}

void sub_183E08954( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::AttributedStringWriter::setElidesEmptyValues(uint64_t this, char a2)
{
  *(_BYTE *)(*(void *)(this + 248) + 168LL) = a2;
  return this;
}

uint64_t CSStore2::AttributedStringWriter::setInsertsNewlines(uint64_t this, char a2)
{
  *(_BYTE *)(*(void *)(this + 248) + 169LL) = a2;
  return this;
}

id CSStore2::AttributedStringWriter::getLocale(CSStore2::AttributedStringWriter *this)
{
  return *(id *)(*((void *)this + 31) + 24LL);
}

void CSStore2::AttributedStringWriter::setLocale(CSStore2::AttributedStringWriter *this, NSLocale *a2)
{
  uint64_t v3 = -[NSLocale copy](a2, "copy");
  uint64_t v4 = *((void *)this + 31);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;
}

uint64_t CSStringBindingStoreAddTable(__CSStore *a1, void *a2)
{
  return CSMapAddMapTable(a1, a2, 0);
}

uint64_t CSStringBindingStoreInit(uint64_t a1, NSString *a2, int a3, char a4, uint64_t a5)
{
  uint64_t v5 = 4294967246LL;
  if (a1 && a2 && a5)
  {
    v7[0] = xmmword_189D65AD8;
    memset(&v7[1], 0, 32);
    *(_DWORD *)(a5 + 96) = a3;
    *(_BYTE *)(a5 + 10std::string::resize(&v8, (std::string::size_type)this + 1, 0) = a4;
    return CSMapInit(a1, a2, v7, 0LL, a5);
  }

  return v5;
}

unsigned int *_CSStringBindingRetainString(uint64_t a1, int a2, unsigned int a3)
{
  return _CSStringRetain(a1, a3);
}

Unit *_CSStringBindingReleaseString(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return _CSStringRelease(a1, a3);
}

uint64_t CSStringBindingFindStringAndBindings( uint64_t a1, void *a2, CSStore2::_StringFunctions *a3, const char *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v10 = _CSGetStringForCharacters(a1, a3, a4);
  if (!(_DWORD)v10) {
    return 4294957797LL;
  }
  if (a5) {
    *a5 = v10;
  }
  int Bindings = _CSStringBindingGetBindings(a1, a2, v10);
  if (!Bindings) {
    return 4294957797LL;
  }
  if (!a6) {
    return 0LL;
  }
  int v12 = Bindings;
  uint64_t result = 0LL;
  *a6 = v12;
  return result;
}

uint64_t _CSStringBindingGetBindings(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = 0LL;
  unsigned int v5 = 0;
  if (a1 && a2)
  {
    if ((_DWORD)a3)
    {
      CSMapGetValue(a1, a2, a3, &v5);
      return v5;
    }
  }

  return result;
}

void _CSStringBindingEnumerate(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (a1)
  {
    if (a2)
    {
      if ((_DWORD)a3)
      {
        if (v7)
        {
          unsigned int v8 = 0;
          CSMapGetValue(a1, a2, a3, &v8);
          if (v8) {
            _CSArrayEnumerateAllValues(a1, v8, v7);
          }
        }
      }
    }
  }
}

void sub_183E08B78( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
}

uint64_t CSStringBindingCopyCFStrings(uint64_t a1, void *a2)
{
  uint64_t v2 = 0LL;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 0LL;
  if (a1 && a2)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
    v9[3] = (uint64_t)Mutable;
    if (Mutable)
    {
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __CSStringBindingCopyCFStrings_block_invoke;
      __int128 v7[3] = &unk_189D65B10;
      void v7[4] = &v8;
      v7[5] = a1;
      _CSStringBindingEnumerateAllBindings(a1, a2, v7);
      uint64_t v2 = v9[3];
    }

    else
    {
      uint64_t v2 = 0LL;
    }
  }

  _Block_object_dispose(&v8, 8);
  return v2;
}

void sub_183E08C74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __CSStringBindingCopyCFStrings_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = (const void *)_CSStringCopyCFString(*(void *)(a1 + 40), a2);
  if (v3)
  {
    uint64_t v4 = v3;
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), v3);
    CFRelease(v4);
  }

void _CSStringBindingEnumerateAllBindings(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1 && a2 && v5)
  {
    v7[1] = 3221225472LL;
    v7[2] = ___CSStringBindingEnumerateAllBindings_block_invoke;
    __int128 v7[3] = &unk_189D65B38;
    id v6 = v5;
    v7[0] = MEMORY[0x1895F87A8];
    id v8 = v5;
    _CSMapEnumerateKeysAndValues(a1, a2, v7);

    id v5 = v6;
  }
}

void sub_183E08D70( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_183E08DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E08E8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)&OBJC_CLASS____CSStore2DataContainer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void CSStore2::VM::Deallocate(CSStore2::VM *this, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unsigned int v2 = *MEMORY[0x1895FD590];
  unsigned int v3 = (_DWORD)a2 + *MEMORY[0x1895FD590] - 1;
  if (v3 == v3 % *MEMORY[0x1895FD590]) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = v3 / v2 * v2;
  }
  id v5 = (CSStore2 *)MEMORY[0x186E27EB0](*MEMORY[0x1895FBBE0], this, v4);
  if ((_DWORD)v5)
  {
    int v6 = (int)v5;
    CSStore2::GetLog(v5);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 134218240;
      uint64_t v9 = v4;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      _os_log_error_impl( &dword_183DFE000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to deallocate %llu bytes with kernel error %llx.",  (uint8_t *)&v8,  0x16u);
    }
  }

void __clang_call_terminate(void *a1)
{
}

void CSStore2::Store::_Create(CSStore2 *a1, Bytef *a2, void *a3, int a4, uint64_t a5, void *a6)
{
  uint64_t v9 = (id **)a1;
  v110[2] = *MEMORY[0x1895F89C0];
  *(void *)a1 = 0LL;
  if (a4)
  {
    Copy = (CSStore2::VM *)CSStore2::VM::AllocateCopy((CSStore2::VM *)a2, a3, (CSStore2::VM *)a3);
    if (!Copy)
    {
      uint64_t v17 = (void *)MEMORY[0x189607870];
      v109[0] = *MEMORY[0x189607490];
      v109[1] = @"Line";
      v110[0] = @"kCSStoreAllocFailedErr";
      v110[1] = &unk_189D69670;
      [MEMORY[0x189603F68] dictionaryWithObjects:v110 forKeys:v109 count:2];
      unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 errorWithDomain:*MEMORY[0x189607670] code:-9493 userInfo:v16];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_111;
    }

    id v91 = 0LL;
    CSStore2::Store::_Create(buf, Copy, a3, 0LL, a5, &v91);
    id v11 = v91;
    uint64_t v12 = *(void *)buf;
    *uint64_t v9 = *(id **)buf;
    if (!v12)
    {
      CSStore2::VM::Deallocate(Copy, a3);
      unint64_t v13 = 0LL;
      goto LABEL_112;
    }

    goto LABEL_115;
  }

  if (!a2)
  {
LABEL_30:
    int v28 = 2;
    goto LABEL_31;
  }

  if (a3 < 0x64)
  {
LABEL_7:
    unint64_t v14 = (void *)MEMORY[0x189607870];
    v98[0] = *MEMORY[0x189607490];
    v98[1] = @"Line";
    v99[0] = @"kCSStoreBadDataErr";
    v99[1] = &unk_189D696B8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v99 forKeys:v98 count:2];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 errorWithDomain:*MEMORY[0x189607670] code:-9496 userInfo:v15];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v16 = 0LL;
    uint64_t v9 = (id **)a1;
    goto LABEL_110;
  }

  int v18 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 == -788868902 || v18 == -623838512)
  {
    CSStore2::GetLog(a1);
    unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_183DFE000, v20, OS_LOG_TYPE_DEFAULT, "Encountered CSStore1 file, can't read it.", buf, 2u);
    }

    unint64_t v16 = 0LL;
    goto LABEL_17;
  }

  if (v18 != 1819501666) {
    goto LABEL_7;
  }
  int v28 = a2[4];
  if (v28 == 2)
  {
    unsigned int v29 = *((_DWORD *)a2 + 3);
    CSStore2::GetLog(a1);
    UniChar v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v80 = *((unsigned int *)a2 + 3);
      uint64_t v79 = *((unsigned int *)a2 + 4);
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = a3;
      __int16 v105 = 2048;
      uint64_t v106 = v79;
      __int16 v107 = 2048;
      uint64_t v108 = v80;
      _os_log_debug_impl( &dword_183DFE000,  v30,  OS_LOG_TYPE_DEBUG,  "Checked CSStore data with lengths %llu/%llu/%llu",  buf,  0x20u);
    }

    goto LABEL_30;
  }

LABEL_31:
  if (!(_DWORD)a5)
  {
LABEL_86:
    unint64_t v16 = 0LL;
LABEL_87:
    __int128 v62 = (char *)operator new(0x150uLL);
    __int128 v63 = (CSStore2::Store *)v62;
    v62[312] = 0;
    v62[316] = 0;
    *((void *)v62 + 4std::string::resize(&v8, (std::string::size_type)this + 1, 0) = 0LL;
    *(void *)__int128 v62 = 0LL;
    *(void *)&__int128 v64 = -1LL;
    *((void *)&v64 + 1) = -1LL;
    *(_OWORD *)(v62 + _Block_object_dispose(va, 8) = v64;
    *(_OWORD *)(v62 + 24) = v64;
    *(_OWORD *)(v62 + 4std::string::resize(&v8, (std::string::size_type)this + 1, 0) = v64;
    *(_OWORD *)(v62 + 56) = v64;
    *(_OWORD *)(v62 + 72) = v64;
    *(_OWORD *)(v62 + 8_Block_object_dispose(va, 8) = v64;
    *(_OWORD *)(v62 + 104) = v64;
    *(_OWORD *)(v62 + 12std::string::resize(&v8, (std::string::size_type)this + 1, 0) = v64;
    *(_OWORD *)(v62 + 136) = v64;
    *(_OWORD *)(v62 + 152) = v64;
    *(_OWORD *)(v62 + 16_Block_object_dispose(va, 8) = v64;
    *(_OWORD *)(v62 + 184) = v64;
    *(_OWORD *)(v62 + 20std::string::resize(&v8, (std::string::size_type)this + 1, 0) = v64;
    *(_OWORD *)(v62 + 216) = v64;
    *(_OWORD *)(v62 + 232) = v64;
    *(_OWORD *)(v62 + 24_Block_object_dispose(va, 8) = v64;
    *((void *)v62 + 33) = 0LL;
    *((void *)v62 + 34) = 0LL;
    *((void *)v62 + 35) = 0LL;
    atomic_store(0LL, (unint64_t *)v62 + 36);
    atomic_store(0LL, (unint64_t *)v62 + 37);
    do
      unint64_t v65 = __ldaxr(&CSStore2::Store::Store(void)::nextFamily);
    while (__stlxr(v65 + 1, &CSStore2::Store::Store(void)::nextFamily));
    *((void *)v62 + 3_Block_object_dispose(va, 8) = v65;
    v62[312] = 0;
    v62[315] = buf[2];
    *(_WORD *)(v62 + 313) = *(_WORD *)buf;
    v62[316] = 0;
    v62[319] = v93;
    *(_WORD *)(v62 + 317) = v92;
    v62[328] = 0;
    v66 = *v9;
    *uint64_t v9 = (id *)v63;
    if (v66) {
      std::default_delete<CSStore2::Store>::operator()[abi:nn180100](v66);
    }
    CSStore2::Store::setBytesNoCopy(v63, a2, (uint64_t)a3);
    id v11 = 0LL;
    uint64_t v9 = (id **)a1;
    goto LABEL_111;
  }

  if (a3 <= 0x63)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "static std::unique_ptr<Store> CSStore2::Store::_Create(void *, _CSStoreSize, BOOL, BOOL, NSError *__autoreleasing *)");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    [v81 handleFailureInFunction:v82 file:@"CSStore+Store.mm" lineNumber:126 description:@"Somehow thought CSStore header was OK when it's too short."];

    uint64_t v9 = (id **)a1;
  }

  unsigned int v31 = *((_DWORD *)a2 + 3);
  unsigned int v84 = *((_DWORD *)a2 + 4);
  unint64_t v32 = *((unsigned __int16 *)a2 + 3);
  if (v32 > 2)
  {
    unint64_t v87 = *((unsigned __int16 *)a2 + 3);
    unsigned int v86 = v28;
    unsigned int v83 = *((_DWORD *)a2 + 3);
    uLong v33 = crc32(0x6E797267uLL, a2 + 100, v31 - 100);
    else {
      unsigned __int16 v34 = v33 | 0xE000;
    }
    CSStore2::GetLog((CSStore2 *)v33);
    int64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    int64_t v36 = v35;
    if ((_DWORD)v87 != v34)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v87;
        __int16 v105 = 2048;
        uint64_t v106 = v34;
        _os_log_error_impl( &dword_183DFE000,  v36,  OS_LOG_TYPE_ERROR,  "CSStore checksum expected to be %llx, was %llx.",  buf,  0x16u);
      }

      unint64_t v16 = 0LL;
      goto LABEL_106;
    }

    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v87;
      _os_log_debug_impl(&dword_183DFE000, v36, OS_LOG_TYPE_DEBUG, "CSStore checksum matches: %llx", buf, 0xCu);
    }

    goto LABEL_86;
  }

  NSUInteger v37 = (2 * *MEMORY[0x1895FD590]);
  vm_address_t v38 = CSStore2::VM::Allocate((CSStore2::VM *)v37);
  if (!v38)
  {
    CSStore2::GetLog(0LL);
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_183DFE000,  v61,  OS_LOG_TYPE_ERROR,  "CSStore zero-page check could not allocate memory. Skipping check.",  buf,  2u);
    }

    goto LABEL_86;
  }

  unint64_t v87 = v32;
  __s2 = (void *)v38;
  unsigned int v83 = v31;
  unsigned int v86 = v28;
  if (v37 >= a3)
  {
    id v39 = 0LL;
    goto LABEL_95;
  }

  id v39 = 0LL;
  v40 = 0LL;
  v85 = 0LL;
  int v41 = 0;
  unsigned int v42 = 0;
  unsigned int v43 = v37;
  while ((unint64_t)(v40 - v39) < 0x400)
  {
    unsigned int v44 = v43;
    if (!memcmp(&a2[v42], __s2, v37))
    {
      uint64_t v45 = (v40 - v39) >> 4;
      if (v39 == v40)
      {
        if (v39 >= v85)
        {
          uint64_t v47 = v85 - v39;
          else {
            uint64_t v48 = v47 >> 3;
          }
          else {
            unint64_t v49 = v48;
          }
          uint64_t v50 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v49);
          uint64_t v51 = &v50[16 * v45];
          v85 = &v50[16 * v52];
          *(void *)uint64_t v51 = v42;
          *((void *)v51 + 1) = v37;
          v40 = v51 + 16;
          if (v39) {
            operator delete(v39);
          }
          id v39 = v51;
        }

        else
        {
          *(void *)id v39 = v42;
          *((void *)v39 + 1) = v37;
          v40 = v39 + 16;
        }
      }

      else
      {
        NSRange v46 = (NSRange)*((_OWORD *)v40 - 1);
        if (v46.length + v46.location == v42)
        {
          v111.location = v42;
          v111.length = v37;
          uint64_t v9 = (id **)a1;
          *((NSRange *)v40 - 1) = NSUnionRange(v46, v111);
LABEL_76:
          ++v41;
          goto LABEL_77;
        }

        uint64_t v9 = (id **)a1;
        if (v40 < v85)
        {
          *(void *)v40 = v42;
          *((void *)v40 + 1) = v37;
          v40 += 16;
          goto LABEL_76;
        }

        uint64_t v53 = v85 - v39;
        else {
          uint64_t v54 = v53 >> 3;
        }
        else {
          unint64_t v55 = v54;
        }
        unint64_t v56 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v55);
        v57 = &v56[16 * v45];
        v85 = &v56[16 * v58];
        *(void *)v57 = v42;
        *((void *)v57 + 1) = v37;
        v59 = v57 + 16;
        do
        {
          *((_OWORD *)v57 - 1) = *((_OWORD *)v40 - 1);
          v57 -= 16;
          v40 -= 16;
        }

        while (v40 != v39);
        if (v39) {
          operator delete(v39);
        }
        id v39 = v57;
        v40 = v59;
      }

      uint64_t v9 = (id **)a1;
      goto LABEL_76;
    }

    uint64_t v9 = (id **)a1;
LABEL_77:
    unsigned int v43 = v44 + v37;
    unsigned int v42 = v44;
  }

  uint64_t v9 = (id **)a1;
LABEL_94:
  if (v41 >= 8)
  {
    [MEMORY[0x189603FA8] array];
    int v69 = (void *)objc_claimAutoreleasedReturnValue();
    id v70 = objc_alloc_init(MEMORY[0x189607800]);
    if (v39 != v40)
    {
      int v71 = v39;
      do
      {
        [v70 stringFromByteCount:*((void *)v71 + 1)];
        __int16 v72 = (void *)objc_claimAutoreleasedReturnValue();
        [NSString stringWithFormat:@"0x%llX-0x%llX (%@)", *(void *)v71, *(void *)v71 + *((void *)v71 + 1) - 1, v72];
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        [v69 addObject:v73];

        v71 += 16;
      }

      while (v71 != v40);
    }

    id v67 = v69;

    char v68 = 0;
  }

  else
  {
LABEL_95:
    id v67 = 0LL;
    char v68 = 1;
  }

  CSStore2::VM::Deallocate((CSStore2::VM *)__s2, (void *)*MEMORY[0x1895FD590]);
  if (v39) {
    operator delete(v39);
  }
  uint64_t v74 = (CSStore2 *)v67;
  unint64_t v16 = v74;
  if ((v68 & 1) != 0) {
    goto LABEL_87;
  }
  CSStore2::GetLog(v74);
  int64_t v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v16;
    _os_log_error_impl( &dword_183DFE000,  v36,  OS_LOG_TYPE_ERROR,  "CSStore file has zeroed pages and has been corrupted at a low level. Offsets: %{public}@",  buf,  0xCu);
  }

  unsigned __int16 v34 = 0;
LABEL_106:

  uint64_t v60 = v86;
  if (v86 == 2)
  {
    v76 = (void *)MEMORY[0x189607870];
    uint64_t v77 = *MEMORY[0x189607670];
    if (v87 > 2)
    {
      v94[0] = *MEMORY[0x189607490];
      v94[1] = @"Line";
      v95[0] = @"kCSStoreBadChecksumErr";
      v95[1] = &unk_189D696E8;
      v94[2] = @"Checksum";
      objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedShort:");
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      v95[2] = v15;
      v94[3] = @"CalculatedChecksum";
      [MEMORY[0x189607968] numberWithUnsignedShort:v34];
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
      v95[3] = v22;
      [MEMORY[0x189603F68] dictionaryWithObjects:v95 forKeys:v94 count:4];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = (id **)a1;
      [v76 errorWithDomain:v77 code:-9489 userInfo:v24];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }

    v96[0] = *MEMORY[0x189607490];
    v96[1] = @"Line";
    v97[0] = @"kCSStoreBadDataErr";
    v97[1] = &unk_189D696D0;
    v97[2] = v16;
    v96[2] = @"ZeroedRanges";
    v96[3] = @"Length";
    [MEMORY[0x189607968] numberWithUnsignedInt:a3];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    v97[3] = v15;
    v96[4] = @"UsedLength";
    [MEMORY[0x189607968] numberWithUnsignedInt:v84];
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
    v97[4] = v22;
    v96[5] = @"ConsumedLength";
    [MEMORY[0x189607968] numberWithUnsignedInt:v83];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    v97[5] = v24;
    v96[6] = @"Checksum";
    [MEMORY[0x189607968] numberWithUnsignedShort:v87];
    int64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    v97[6] = v27;
    uint64_t v9 = (id **)a1;
    [MEMORY[0x189603F68] dictionaryWithObjects:v97 forKeys:v96 count:7];
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    [v76 errorWithDomain:v77 code:-9496 userInfo:v78];
    id v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
LABEL_22:

    goto LABEL_109;
  }

  if (v86 == 1)
  {
LABEL_17:
    if (!CSStore2::IsAppleInternal(void)::result)
    {
      uint64_t v60 = 1LL;
      goto LABEL_108;
    }

    BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.CSStore");
    uint64_t v15 = (void *)CFBundleCopyLocalizedString( BundleWithIdentifier,  @"This file is in the CSStore1 format.",  0LL,  @"Localized");
    __int16 v22 = (void *)CFBundleCopyLocalizedString( BundleWithIdentifier,  @"The system can only read CSStore2 files, which first shipped with iOS 9 and OS X El Capitan.",  0LL,  @"Localized");
    uint64_t v23 = (void *)MEMORY[0x189607870];
    v102[0] = *MEMORY[0x189607490];
    v102[1] = @"Line";
    v103[0] = @"kCSStoreOldVersionErr";
    v103[1] = &unk_189D69688;
    v102[2] = @"Version";
    [MEMORY[0x189607968] numberWithUnsignedChar:1];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = *MEMORY[0x1896075F0];
    v103[2] = v24;
    v103[3] = v15;
    uint64_t v26 = *MEMORY[0x189607618];
    v102[3] = v25;
    v102[4] = v26;
    v103[4] = v22;
    [MEMORY[0x189603F68] dictionaryWithObjects:v103 forKeys:v102 count:5];
    int64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 errorWithDomain:*MEMORY[0x189607670] code:-9488 userInfo:v27];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }

  v57 = v25;
  unsigned int v43 = CSStore2::Writer::sync((std::string::size_type *)a2, &v57);
  unsigned int v44 = v57;

  uint64_t v25 = v44;
LABEL_38:
  if (a4 && (v43 & 1) == 0) {
    *a4 = v25;
  }

  return v43;
}

LABEL_108:
  v75 = (void *)MEMORY[0x189607870];
  v100[0] = *MEMORY[0x189607490];
  v100[1] = @"Line";
  v101[0] = @"kCSStoreOldVersionErr";
  v101[1] = &unk_189D696A0;
  v100[2] = @"Version";
  [MEMORY[0x189607968] numberWithUnsignedChar:v60];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v101[2] = v15;
  [MEMORY[0x189603F68] dictionaryWithObjects:v101 forKeys:v100 count:3];
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v75 errorWithDomain:*MEMORY[0x189607670] code:-9488 userInfo:v22];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (id **)a1;
LABEL_109:

LABEL_110:
LABEL_111:

  unint64_t v13 = *v9;
LABEL_112:
  if (a6 && !v13)
  {
    id v11 = v11;
    *a6 = v11;
  }

LABEL_115:
}

void sub_183E09CDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id **a17)
{
  unint64_t v20 = *a17;
  *a17 = 0LL;
  if (v20) {
    std::default_delete<CSStore2::Store>::operator()[abi:nn180100](v20);
  }
  _Unwind_Resume(a1);
}

vm_address_t CSStore2::VM::AllocateCopy(CSStore2::VM *this, const void *a2, CSStore2::VM *a3)
{
  unsigned int v3 = a3;
  unsigned int v4 = a2;
  vm_address_t v6 = CSStore2::VM::Allocate(a3);
  vm_address_t v7 = v6;
  if (v6)
  {
    if (v3 >= v4) {
      unint64_t v8 = v4;
    }
    else {
      unint64_t v8 = v3;
    }
    CSStore2::VM::Copy(v6, (NSUInteger)this, (const void *)v8);
  }

  return v7;
}

void std::default_delete<CSStore2::Store>::operator()[abi:nn180100](id *a1)
{
}

void CSStore2::Store::setBytesNoCopy(CSStore2::Store *this, void *a2, uint64_t a3)
{
  if (a2)
  {
    vm_address_t v6 = *(void **)this;
    *(void *)this = 0LL;

    vm_address_t v7 = -[_CSStore2DataContainer initWithBytesNoCopy:length:]( objc_alloc(&OBJC_CLASS____CSStore2DataContainer),  "initWithBytesNoCopy:length:",  a2,  a3);
    unint64_t v8 = *(void **)this;
    *(void *)this = v7;

    CSStore2::Store::_dataDidMove(this);
    atomic_store(0LL, (unint64_t *)this + 37);
  }

  else
  {
    else {
      a3 = a3;
    }
    vm_address_t v9 = CSStore2::VM::Allocate((CSStore2::VM *)a3);
    if (v9)
    {
      __int16 v10 = (void *)v9;
      *(_OWORD *)(v9 + 4) = 0u;
      *(void *)(v9 + 84) = 0LL;
      *(_OWORD *)(v9 + 6_Block_object_dispose(va, 8) = 0u;
      *(_OWORD *)(v9 + 52) = 0u;
      *(_OWORD *)(v9 + 36) = 0u;
      *(_OWORD *)(v9 + 2std::string::resize(&v8, (std::string::size_type)this + 1, 0) = 0u;
      *(_DWORD *)vm_address_t v9 = 1819501666;
      *(_BYTE *)(v9 + 4) = 2;
      *(void *)(v9 + 92) = 0xFFFFFFFF00000000LL;
      *(_OWORD *)(v9 + 12) = xmmword_183E2D5B0;
      CSStore2::Table::setName((CSStore2::Table *)(v9 + 20), @"<catalog>");
      CSStore2::Store::setBytesNoCopy(this, v10, a3);
      uint64_t v11 = *(void *)this;
      if (*(void *)this)
      {
        unint64_t v12 = *(void *)(v11 + 8);
        unint64_t v13 = v12 + 20;
      }

      else
      {
        unint64_t v12 = 0LL;
        unint64_t v13 = 20LL;
      }

      unsigned int v14 = -1;
      BOOL v15 = v13 >= v12;
      unint64_t v16 = v13 - v12;
      if (v15 && !HIDWORD(v16))
      {
        else {
          unsigned int v14 = v16;
        }
      }

      memset(v24, 0, sizeof(v24));
      int v25 = 1065353216;
      NSUInteger v18 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create(this, (uint64_t)v24);
      if (!v18
        || ((uint64_t v19 = *(void *)this) == 0 ? (v20 = 0LL) : (v20 = *(void *)(v19 + 8)),
            (NSUInteger v21 = v18 - v20, v18 < v20)
         || HIDWORD(v21)
         || (_DWORD)v21 == -1
         || (v21 + 1) > *(_DWORD *)(*(void *)(v19 + 8) + 12LL)))
      {
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v24);
      }

      else
      {
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v24);
        *(_DWORD *)(*(void *)(*(void *)this + 8LL) + v14 + 76LL) = v21;
      }
    }

    else
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithUTF8String:",  "void CSStore2::Store::setBytesNoCopy(void *, _CSStoreSize)");
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 handleFailureInFunction:v22 file:@"CSStore+Store.mm" lineNumber:827 description:@"Failed to create data for empty bytes argument!"];
    }
  }

void sub_183E0A148( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, char a11)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN8CSStore2L15IsAppleInternalEv_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  CSStore2::IsAppleInternal(void)::uint64_t result = result;
  return result;
}

uint64_t CSStore2::Store::assertNotEnumeratingUnits(uint64_t this)
{
  return this;
}

char *CSStore2::Store::_dataDidMove(CSStore2::Store *this)
{
  *(void *)&__int128 v2 = -1LL;
  *((void *)&v2 + 1) = -1LL;
  *(_OWORD *)((char *)this + 24_Block_object_dispose(va, 8) = v2;
  *(_OWORD *)((char *)this + 232) = v2;
  *(_OWORD *)((char *)this + 216) = v2;
  *(_OWORD *)((char *)this + 20std::string::resize(&v8, (std::string::size_type)this + 1, 0) = v2;
  *(_OWORD *)((char *)this + 184) = v2;
  *(_OWORD *)((char *)this + 16_Block_object_dispose(va, 8) = v2;
  *(_OWORD *)((char *)this + 152) = v2;
  *(_OWORD *)((char *)this + 136) = v2;
  *(_OWORD *)((char *)this + 12std::string::resize(&v8, (std::string::size_type)this + 1, 0) = v2;
  *(_OWORD *)((char *)this + 104) = v2;
  *(_OWORD *)((char *)this + 8_Block_object_dispose(va, 8) = v2;
  *(_OWORD *)((char *)this + 72) = v2;
  *(_OWORD *)((char *)this + 56) = v2;
  *(_OWORD *)((char *)this + 4std::string::resize(&v8, (std::string::size_type)this + 1, 0) = v2;
  *(_OWORD *)((char *)this + 24) = v2;
  uint64_t v3 = MEMORY[0x1895F87A8];
  *(_OWORD *)((char *)this + _Block_object_dispose(va, 8) = v2;
  v5[0] = v3;
  v5[1] = 3221225472LL;
  v5[2] = ___ZN8CSStore25Store12_dataDidMoveEv_block_invoke;
  v5[3] = &__block_descriptor_40_e47_v24__0r__Table__Unit_b30b2I_0c___48c_QQII_8_B16l;
  v5[4] = this;
  CSStore2::Store::enumerateTables((CSStore2 **)this, v5);
  *((void *)this + 33) = CSStore2::Store::getTable((CSStore2 **)this, @"<array>");
  *((void *)this + 34) = CSStore2::Store::getTable((CSStore2 **)this, @"<string>");
  uint64_t result = CSStore2::Store::getTable((CSStore2 **)this, @"<dictionary>");
  *((void *)this + 35) = result;
  return result;
}

vm_address_t CSStore2::VM::Allocate(CSStore2::VM *this)
{
  kern_return_t v4;
  vm_address_t result;
  BOOL v6;
  os_log_s *v7;
  vm_address_t address;
  uint8_t buf[4];
  vm_size_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v13 = *MEMORY[0x1895F89C0];
  address = 0LL;
  unsigned int v1 = *MEMORY[0x1895FD590];
  unsigned int v2 = (_DWORD)this + *MEMORY[0x1895FD590] - 1;
  if (v2 == v2 % *MEMORY[0x1895FD590]) {
    vm_size_t v3 = v1;
  }
  else {
    vm_size_t v3 = v2 / v1 * v1;
  }
  unsigned int v4 = vm_allocate(*MEMORY[0x1895FBBE0], &address, v3, 721420289);
  uint64_t result = address;
  if (v4) {
    vm_address_t v6 = 1;
  }
  else {
    vm_address_t v6 = address == 0;
  }
  if (v6)
  {
    CSStore2::GetLog((CSStore2 *)address);
    vm_address_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      __int16 v10 = v3;
      uint64_t v11 = 2048;
      unint64_t v12 = v4;
      _os_log_error_impl( &dword_183DFE000,  v7,  OS_LOG_TYPE_ERROR,  "Failed to allocate %llu bytes with kernel error %llx.",  buf,  0x16u);
    }

    return 0LL;
  }

  return result;
}

void CSStore2::Table::setName(CSStore2::Table *this, NSString *a2)
{
  vm_size_t v3 = a2;
  strlcpy((char *)this + 8, -[NSString UTF8String](v3, "UTF8String"), 0x30uLL);
}

void sub_183E0A3FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

NSUInteger CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create( CSStore2::Store *a1, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)(a2 + 24) + 1024;
  if (v4 >= 0x2000) {
    unsigned int v5 = 0x2000;
  }
  else {
    unsigned int v5 = *(_DWORD *)(a2 + 24) + 1024;
  }
  if (v5 <= 0x10) {
    unsigned int v5 = 16;
  }
  int v6 = 8 * v5 + 8 * v4;
  vm_address_t v7 = (const void *)(v6 | 4u);
  unint64_t v8 = CSStore2::Store::extend(a1, v6 | 4u);
  NSUInteger v9 = v8;
  if (v8)
  {
    uint64_t v10 = *(void *)a1;
    if (*(void *)a1) {
      unint64_t v11 = *(void *)(v10 + 8);
    }
    else {
      unint64_t v11 = 0LL;
    }
    int v12 = -1;
    BOOL v13 = v8 >= v11;
    unint64_t v14 = v8 - v11;
    if (v13 && !HIDWORD(v14))
    {
      else {
        int v12 = v14;
      }
    }

    CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create( (_DWORD **)v21,  a2,  v12,  0x400u,  0LL);
    unint64_t v16 = v21[0];
    if (v21[0])
    {
      CSStore2::VM::Copy(v9, (NSUInteger)v21[0], v7);
      ((void (*)(void *))v21[1])(v16);
    }

    else
    {
      CSStore2::Store::assertNotEnumeratingUnits((uint64_t)a1);
      NSUInteger v9 = 0LL;
      uint64_t v17 = *(void *)(*(void *)a1 + 8LL);
      unsigned int v18 = *(_DWORD *)(v17 + 16);
      BOOL v13 = v18 >= v7;
      unsigned int v19 = v18 - (_DWORD)v7;
      if (!v13) {
        unsigned int v19 = 0;
      }
      *(_DWORD *)(v17 + 16) = v19;
      ++*(_DWORD *)(v17 + 8);
    }
  }

  return v9;
}

void sub_183E0A534( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t))
{
}

uint64_t CSStore2::Store::extend(CSStore2::Store *this, unsigned int a2)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  unsigned int v4 = (CSStore2 *)CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
  CSStore2::GetLog(v4);
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v32 = 134217984;
    uint64_t v33 = a2;
    _os_log_debug_impl( &dword_183DFE000,  v5,  OS_LOG_TYPE_DEBUG,  "Attempting to lengthen store by %llu bytes",  (uint8_t *)&v32,  0xCu);
  }

  if (a2 + 3 >= 4) {
    uint64_t v7 = (a2 + 3) & 0xFFFFFFFC;
  }
  else {
    uint64_t v7 = 4LL;
  }
  uint64_t v8 = *(void *)this;
  if (!*(void *)this
    || (uint64_t v9 = *(void *)(v8 + 8),
        unsigned int v10 = *(_DWORD *)(v9 + 12),
        unsigned int v11 = v10 + v7,
        v10 + v7 >= *(_DWORD *)(v8 + 16)))
  {
    CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
    uint64_t v12 = *(void *)this;
    if (*(void *)this)
    {
      unsigned int v10 = *(_DWORD *)(v12 + 16);
      unsigned int v13 = v7 + 0x3FFFF + v10;
      if (v13 >= 0x40000) {
        uint64_t v14 = v13 & 0xFFFC0000;
      }
      else {
        uint64_t v14 = 0x40000LL;
      }
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithUTF8String:",  "BOOL CSStore2::Store::reserve(_CSStoreSize, _CSStoreSize *)");
      int64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 handleFailureInFunction:v27 file:@"CSStore+Store.mm" lineNumber:863 description:@"New CSStore size is smaller than the old size!"];

      uint64_t v12 = *(void *)this;
      if (*(void *)this) {
LABEL_13:
      }
        BOOL v15 = *(CSStore2::VM **)(v12 + 8);
      else {
        BOOL v15 = 0LL;
      }
    }

    else
    {
      unsigned int v10 = 0;
      BOOL v15 = 0LL;
      else {
        uint64_t v14 = 0x40000LL;
      }
    }

    unsigned int v16 = *MEMORY[0x1895FD590];
    unsigned int v17 = v10 + *MEMORY[0x1895FD590] - 1;
    if (v17 == v17 % *MEMORY[0x1895FD590]) {
      unint64_t v18 = v16;
    }
    else {
      unint64_t v18 = v17 / v16 * v16;
    }
    Copy = (void *)CSStore2::VM::AllocateCopy(v15, (const void *)v18, (CSStore2::VM *)v14);
    if (!Copy)
    {
      [MEMORY[0x1896077D8] currentHandler];
      int v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( NSString,  "stringWithUTF8String:",  "BOOL CSStore2::Store::reserve(_CSStoreSize, _CSStoreSize *)");
      unsigned int v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 handleFailureInFunction:v29 file:@"CSStore+Store.mm" lineNumber:868 description:@"Failed to create data for store extension!"];

      CSStore2::GetLog(v30);
      unsigned int v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        int v32 = 134217984;
        uint64_t v33 = v7;
        _os_log_error_impl( &dword_183DFE000,  v31,  OS_LOG_TYPE_ERROR,  "Failed to reserve %llu bytes of virtual memory",  (uint8_t *)&v32,  0xCu);
      }

      abort();
    }

    CSStore2::Store::setBytesNoCopy(this, Copy, v14);
    uint64_t v9 = *(void *)(*(void *)this + 8LL);
    unsigned int v11 = v10 + v7;
  }

  int v20 = *(_DWORD *)(v9 + 16) + v7;
  *(_DWORD *)(v9 + 12) = v11;
  *(_DWORD *)(v9 + 16) = v20;
  uint64_t v21 = v9 + v10;
  if (v11 <= v10) {
    uint64_t v22 = 0LL;
  }
  else {
    uint64_t v22 = v21;
  }
  CSStore2::GetLog(v6);
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = *(unsigned int *)(*(void *)(*(void *)this + 8LL) + 16LL);
    int v32 = 134217984;
    uint64_t v33 = v25;
    _os_log_debug_impl( &dword_183DFE000,  v23,  OS_LOG_TYPE_DEBUG,  "New length of store is %llu bytes",  (uint8_t *)&v32,  0xCu);
  }

  if (v22) {
    ++*(_DWORD *)(*(void *)(*(void *)this + 8LL) + 8LL);
  }
  return v22;
}

void sub_183E0A89C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create( _DWORD **a1, uint64_t a2, int a3, unsigned int a4, _DWORD *a5)
{
  unsigned int v9 = *(void *)(a2 + 24) + a4;
  if (v9 >= 0x2000) {
    unsigned int v10 = 0x2000;
  }
  else {
    unsigned int v10 = *(void *)(a2 + 24) + a4;
  }
  if (v10 <= 0x10) {
    uint64_t v11 = 16LL;
  }
  else {
    uint64_t v11 = v10;
  }
  size_t v12 = (8 * (_DWORD)v11 + 8 * v9) | 4;
  unsigned int v13 = malloc(v12);
  uint64_t v14 = MEMORY[0x1895FB398];
  *a1 = v13;
  a1[1] = v14;
  if (v13)
  {
    BOOL v15 = v13;
    int v74 = a3;
    bzero(v13, v12);
    _DWORD *v15 = v11;
    unsigned int v16 = (void **)operator new(24LL * v11);
    v73 = a5;
    int v72 = v12;
    uint64_t v77 = v16;
    uint64_t v79 = &v16[3 * v11];
    size_t v17 = 24 * ((24 * (unint64_t)v11 - 24) / 0x18) + 24;
    bzero(v16, v17);
    unint64_t v18 = (void **)((char *)v16 + v17);
    v78 = v18;
    unsigned int v19 = *(uint64_t ***)(a2 + 16);
    v75 = a1;
    if (v19)
    {
      uint64_t v20 = v11;
      do
      {
        unsigned int v21 = **a1;
        uint64_t v23 = *((unsigned int *)v19 + 4);
        uint64_t v22 = *((unsigned int *)v19 + 5);
        uint64_t v24 = &v77[3 * ((unsigned __int16)(v23 >> 2) % v21)];
        uint64_t v26 = v24 + 1;
        uint64_t v25 = (uint64_t *)v24[1];
        unint64_t v27 = (unint64_t)v24[2];
        if ((unint64_t)v25 >= v27)
        {
          uint64_t v29 = ((char *)v25 - (_BYTE *)*v24) >> 3;
          uint64_t v30 = v27 - (void)*v24;
          uint64_t v31 = v30 >> 2;
          else {
            unint64_t v32 = v31;
          }
          if (v32) {
            unint64_t v32 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v32);
          }
          else {
            uint64_t v33 = 0LL;
          }
          uint64_t v34 = (uint64_t *)(v32 + 8 * v29);
          *uint64_t v34 = v23 | (v22 << 32);
          int v28 = v34 + 1;
          int64_t v35 = (char *)*v26;
          int64_t v36 = (char *)*v24;
          if (*v26 == *v24)
          {
            a1 = (_DWORD **)v75;
          }

          else
          {
            a1 = (_DWORD **)v75;
            do
            {
              uint64_t v37 = *((void *)v35 - 1);
              v35 -= 8;
              *--uint64_t v34 = v37;
            }

            while (v35 != v36);
            int64_t v35 = (char *)*v24;
          }

          *uint64_t v24 = v34;
          void *v26 = v28;
          _OWORD v24[2] = (void *)(v32 + 8 * v33);
          if (v35) {
            operator delete(v35);
          }
        }

        else
        {
          *uint64_t v25 = v23 | (v22 << 32);
          int v28 = v25 + 1;
          a1 = (_DWORD **)v75;
        }

        void *v26 = v28;
        unsigned int v19 = (uint64_t **)*v19;
      }

      while (v19);
      unsigned int v16 = v77;
      unint64_t v18 = v78;
      uint64_t v11 = v20;
    }

    if (v16 != v18)
    {
      unsigned int v38 = a4 % v11;
      else {
        unsigned int v39 = a4 / v11;
      }
      do
      {
        uint64_t v40 = v11;
        if (v11 <= a4)
        {
          int v41 = 0;
          unsigned int v42 = (char *)v16[1];
          do
          {
            unint64_t v43 = (unint64_t)v16[2];
            if ((unint64_t)v42 >= v43)
            {
              uint64_t v44 = (v42 - (_BYTE *)*v16) >> 3;
              uint64_t v45 = v43 - (void)*v16;
              uint64_t v46 = v45 >> 2;
              else {
                unint64_t v47 = v46;
              }
              if (v47) {
                unint64_t v47 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v47);
              }
              else {
                uint64_t v48 = 0LL;
              }
              unint64_t v49 = (char *)(v47 + 8 * v44);
              *(void *)unint64_t v49 = 0xFFFFFFFF00000000LL;
              unsigned int v42 = v49 + 8;
              uint64_t v51 = (char *)*v16;
              uint64_t v50 = (char *)v16[1];
              if (v50 != *v16)
              {
                do
                {
                  uint64_t v52 = *((void *)v50 - 1);
                  v50 -= 8;
                  *((void *)v49 - 1) = v52;
                  v49 -= 8;
                }

                while (v50 != v51);
                uint64_t v50 = (char *)*v16;
              }

              *unsigned int v16 = v49;
              v16[1] = v42;
              v16[2] = (void *)(v47 + 8 * v48);
              if (v50) {
                operator delete(v50);
              }
            }

            else
            {
              *(void *)unsigned int v42 = 0xFFFFFFFF00000000LL;
              v42 += 8;
            }

            v16[1] = v42;
            ++v41;
          }

          while (v41 != v39);
        }

        if (v38)
        {
          uint64_t v54 = v16[1];
          unint64_t v53 = (unint64_t)v16[2];
          if ((unint64_t)v54 >= v53)
          {
            uint64_t v56 = ((char *)v54 - (_BYTE *)*v16) >> 3;
            uint64_t v57 = v53 - (void)*v16;
            uint64_t v58 = v57 >> 2;
            else {
              unint64_t v59 = v58;
            }
            uint64_t v11 = v40;
            if (v59) {
              unint64_t v59 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v59);
            }
            else {
              uint64_t v60 = 0LL;
            }
            v61 = (void *)(v59 + 8 * v56);
            void *v61 = 0xFFFFFFFF00000000LL;
            unint64_t v55 = v61 + 1;
            __int128 v63 = (char *)*v16;
            __int128 v62 = (char *)v16[1];
            if (v62 != *v16)
            {
              do
              {
                uint64_t v64 = *((void *)v62 - 1);
                v62 -= 8;
                *--v61 = v64;
              }

              while (v62 != v63);
              __int128 v62 = (char *)*v16;
            }

            *unsigned int v16 = v61;
            v16[1] = v55;
            v16[2] = (void *)(v59 + 8 * v60);
            if (v62) {
              operator delete(v62);
            }
          }

          else
          {
            *uint64_t v54 = 0xFFFFFFFF00000000LL;
            unint64_t v55 = v54 + 1;
            uint64_t v11 = v40;
          }

          v16[1] = v55;
          --v38;
        }

        else
        {
          uint64_t v11 = v40;
        }

        v16 += 3;
      }

      while (v16 != v18);
    }

    unint64_t v65 = 0LL;
    NSUInteger v66 = (NSUInteger)&v15[2 * v11 + 1];
    id v67 = (_DWORD *)*v75;
    uint64_t v68 = 24 * v11;
    int v69 = (_DWORD *)(*v75 + 8LL);
    do
    {
      NSUInteger v70 = (NSUInteger)v77[v65 / 8];
      NSUInteger v71 = (NSUInteger)v77[v65 / 8 + 1] - v70;
      *(v69 - 1) = v71 >> 3;
      *int v69 = v66 - (_DWORD)v67 + v74;
      v66 += v71 & 0x7FFFFFFF8LL;
      v65 += 24LL;
      v69 += 2;
    }

    while (v68 != v65);
    uint64_t v80 = &v77;
    std::vector<std::vector<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair,std::allocator<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair>>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v80);
    LODWORD(v12) = v72;
    a5 = v73;
  }

  if (a5) {
    *a5 = v12;
  }
}

void sub_183E0AD34(_Unwind_Exception *a1)
{
  void *v1 = 0LL;
  MEMORY[0x1895FB398](v2);
  _Unwind_Resume(a1);
}

void CSStore2::VM::Copy(NSUInteger this, NSUInteger a2, const void *a3)
{
  unsigned int v3 = a3;
  NSUInteger v4 = a2;
  NSUInteger v6 = a3;
  v8.location = a2;
  v8.length = v6;
  v9.location = this;
  v9.length = v6;
  if (!NSIntersectionRange(v8, v9).length)
  {
    if (v3 < 0x80000) {
      goto LABEL_5;
    }
    if (((NSPageSize() - 1) & (v4 | this)) == 0)
    {
      NSUInteger v7 = NSRoundDownToMultipleOfPageSize(v6);
      NSCopyMemoryPages((const void *)v4, (void *)this, v7);
      v4 += v7;
      this += v7;
      v6 -= v7;
LABEL_5:
      if (!v6) {
        return;
      }
    }
  }

  memmove((void *)this, (const void *)v4, v6);
}

void std::vector<std::vector<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair,std::allocator<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair>>>::__destroy_vector::operator()[abi:nn180100]( void ***a1)
{
  unsigned int v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    NSUInteger v4 = (char *)v1[1];
    unsigned int v5 = **a1;
    if (v4 != v2)
    {
      NSUInteger v6 = (char *)v1[1];
      do
      {
        NSRange v8 = (void *)*((void *)v6 - 3);
        v6 -= 24;
        NSUInteger v7 = v8;
        if (v8)
        {
          *((void *)v4 - 2) = v7;
          operator delete(v7);
        }

        NSUInteger v4 = v6;
      }

      while (v6 != v2);
      unsigned int v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

uint64_t ___ZN8CSStore25Store12_dataDidMoveEv_block_invoke(uint64_t result, _DWORD *a2)
{
  uint64_t v2 = *a2 & 0x3FFFFFFF;
  if (v2 <= 0x3F)
  {
    unsigned int v3 = *(uint64_t **)(result + 32);
    uint64_t v4 = *v3;
    if (*v3) {
      unint64_t v5 = *(void *)(v4 + 8);
    }
    else {
      unint64_t v5 = 0LL;
    }
    NSUInteger v6 = v3 + 1;
    int v7 = -1;
    BOOL v8 = (unint64_t)a2 >= v5;
    unint64_t v9 = (unint64_t)a2 - v5;
    if (v8 && !HIDWORD(v9))
    {
      else {
        int v7 = v9;
      }
    }

    *((_DWORD *)v6 + v2) = v7;
  }

  return result;
}

void CSStore2::Store::enumerateTables(CSStore2 **a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = *a1;
    if (*a1) {
      unint64_t v5 = (CSStore2 *)*((void *)v5 + 1);
    }
    NSUInteger v6 = (unsigned int *)((char *)v5 + 20);
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = ___ZNK8CSStore25Store15enumerateTablesEU13block_pointerFvPKNS_5TableEPbE_block_invoke;
    __int128 v7[3] = &unk_189D65D88;
    id v8 = v3;
    CSStore2::Store::enumerateUnits(a1, v6, v7);
  }
}

void sub_183E0AFC4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

char *CSStore2::Store::getTable(CSStore2 **this, NSString *a2)
{
  id v3 = a2;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v13 = 0LL;
  if (-[NSString isEqualToString:](v3, "isEqualToString:", @"<catalog>"))
  {
    uint64_t v4 = *this;
    if (*this) {
      uint64_t v4 = (CSStore2 *)*((void *)v4 + 1);
    }
    unint64_t v5 = (char *)v4 + 20;
    v11[3] = (uint64_t)v4 + 20;
  }

  else
  {
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = ___ZNK8CSStore25Store8getTableEP8NSString_block_invoke;
    __int128 v7[3] = &unk_189D65C18;
    id v8 = v3;
    unint64_t v9 = &v10;
    CSStore2::Store::enumerateTables(this, v7);

    unint64_t v5 = (char *)v11[3];
  }

  _Block_object_dispose(&v10, 8);

  return v5;
}

void sub_183E0B0B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZNK8CSStore25Store8getTableEP8NSString_block_invoke(uint64_t a1, CSStore2::Table *this, _BYTE *a3)
{
  NSUInteger v6 = *(void **)(a1 + 32);
  int v7 = (__CFString *)CSStore2::Table::copyCFName(this);
  LODWORD(v6) = [v6 isEqualToString:v7];

  if ((_DWORD)v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = this;
    *a3 = 1;
  }

void sub_183E0B150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFStringRef CSStore2::Table::copyCFName(CSStore2::Table *this)
{
  unsigned int v1 = (const UInt8 *)this + 8;
  CFIndex v2 = strnlen((const char *)this + 8, 0x30uLL);
  return CFStringCreateWithBytesNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  v1,  v2,  0x8000100u,  0,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
}

uint64_t ___ZNK8CSStore25Store15enumerateTablesEU13block_pointerFvPKNS_5TableEPbE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void CSStore2::Store::enumerateUnits(CSStore2 **a1, unsigned int *a2, void *a3)
{
  unint64_t v5 = a3;
  if (v5)
  {
    NSUInteger v6 = (unint64_t *)(a1 + 36);
    do
      unint64_t v7 = __ldaxr(v6);
    while (__stlxr(v7 + 1, v6));
    uint64_t v8 = a2[19];
    if ((_DWORD)v8 != -1)
    {
      uint64_t v9 = *((void *)*a1 + 1);
      if (*(_DWORD *)(v9 + 12) > v8)
      {
        uint64_t v10 = (unsigned int *)(v9 + v8);
        unsigned __int8 v30 = 0;
        unint64_t v11 = *(unsigned int *)(v9 + v8);
        if ((_DWORD)v11)
        {
          unint64_t v12 = 0LL;
          do
          {
            uint64_t v13 = &v10[2 * v12];
            unsigned int v16 = v13[1];
            BOOL v15 = v13 + 1;
            unsigned int v14 = v16;
            if (v16 && (unsigned int v17 = v14 >> 29) == 0)
            {
              uint64_t v18 = v10[2 * v12 + 2];
              uint64_t v19 = *((void *)*a1 + 1);
              unsigned int v20 = *(_DWORD *)(v19 + 12);
              BOOL v21 = __CFADD__((_DWORD)v18, 8 * v14);
              unsigned int v22 = v18 + 8 * v14;
              char v23 = v21;
              if (v20 > v18 && (v23 & 1) == 0 && v22 <= v20)
              {
                uint64_t v24 = (unsigned int *)(v19 + v18);
                unint64_t v25 = 1LL;
                do
                {
                  unsigned int v26 = *v24;
                  v24 += 2;
                  Unit = CSStore2::Store::getUnit(a1, (const CSStore2::Table *)a2, v26);
                  if (Unit) {
                    v5[2](v5, Unit, &v30);
                  }
                  unsigned int v17 = v30;
                  BOOL v21 = v25++ >= *v15;
                }

                while (!v21 && v30 == 0);
                unint64_t v11 = *v10;
              }
            }

            else
            {
              unsigned int v17 = 0;
            }

            ++v12;
          }

          while (v12 < v11 && !v17);
        }
      }
    }

    do
      unint64_t v29 = __ldaxr(v6);
    while (__stlxr(v29 - 1, v6));
  }
}

void sub_183E0B31C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *CSStore2::Store::getUnit(CSStore2 **this, const CSStore2::Table *a2, unsigned int a3)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 0LL;
  }
  uint64_t v4 = *((unsigned int *)a2 + 19);
  if ((_DWORD)v4 == -1) {
    return 0LL;
  }
  NSUInteger v6 = *this;
  uint64_t v7 = *((void *)v6 + 1);
  uint64_t v10 = (CSStore2 *)CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Find( v6,  (int *)(v7 + v4),  a3);
  if (!v10) {
    return 0LL;
  }
  uint64_t v11 = *(unsigned int *)v10;
  if ((_DWORD)v11 == -1) {
    return 0LL;
  }
  unint64_t v12 = *((void *)*this + 1);
  unsigned int v13 = *(_DWORD *)(v12 + 12);
  BOOL v15 = (char *)(v12 + v11);
  BOOL v16 = (int)v11 + 1 > v13 || v11 == -1;
  if (v12 + v11 < v12 || v16) {
    LODWORD(v11) = -1;
  }
  if (v11 >= 0xFFFFFFF8 || (int)v11 + 8 > v13)
  {
    CSStore2::GetLog(v10);
    char v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      uint64_t v27 = (4 * *(_DWORD *)a2);
      int v28 = *this;
      if (*this) {
        int v28 = (CSStore2 *)*((void *)v28 + 1);
      }
      int v34 = 134218496;
      uint64_t v35 = v27;
      __int16 v36 = 2048;
      uint64_t v37 = a3;
      __int16 v38 = 2048;
      unint64_t v39 = v15 - (char *)v28;
      unsigned int v26 = "*** CSStore corruption detected (1). %llx %llx %llx";
      unint64_t v29 = v23;
      uint32_t v30 = 32;
      goto LABEL_44;
    }

    goto LABEL_39;
  }

  int v17 = *((_DWORD *)v15 + 1) + 8;
  BOOL v18 = __CFADD__((_DWORD)v11, v17);
  unsigned int v19 = v11 + v17;
  if (v18 || v19 > v13)
  {
    CSStore2::GetLog(v10);
    char v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      uint64_t v32 = (4 * *(_DWORD *)a2);
      unint64_t v33 = *(unsigned int *)v15;
      int v34 = 134218752;
      uint64_t v35 = v32;
      __int16 v36 = 2048;
      uint64_t v37 = a3;
      __int16 v38 = 2048;
      unint64_t v39 = (4 * v33);
      __int16 v40 = 2048;
      unint64_t v41 = v33 >> 30;
      unsigned int v26 = "*** CSStore corruption detected (2). %llx %llx %llx %llx";
      goto LABEL_43;
    }

_DWORD *CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Find( CSStore2 *a1, int *a2, unsigned int a3)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (*a2) {
    BOOL v3 = a3 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0LL;
  }
  if (*a2 > 0x2000)
  {
    CSStore2::GetLog(a1);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v19 = *a2;
      v20[0] = 67109376;
      v20[1] = v19;
      __int16 v21 = 1024;
      int v22 = 0x2000;
      _os_log_error_impl( &dword_183DFE000,  v11,  OS_LOG_TYPE_ERROR,  "Impossible bucket count %u when %u is the maximum.",  (uint8_t *)v20,  0xEu);
    }

    return 0LL;
  }

  uint64_t v5 = (unsigned __int16)(a3 >> 2) % (unsigned __int16)*a2;
  uint64_t v6 = a2[2 * v5 + 1];
  if (!(_DWORD)v6) {
    return 0LL;
  }
  uint64_t v7 = &a2[2 * v5];
  if ((_DWORD)v6 == 1)
  {
    uint64_t v8 = v7[2];
    if ((_DWORD)v8 != -1)
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = *((void *)a1 + 1);
      if (v10)
      {
        if (*(_DWORD *)(v10 + 12) > v8)
        {
          uint64_t v9 = v10 + v8 + 4;
          if (*(_DWORD *)(v10 + v8) != a3) {
            return 0LL;
          }
        }
      }

      return (_DWORD *)v9;
    }

    return 0LL;
  }

  uint64_t v13 = v7[2];
  if ((_DWORD)v13 == -1)
  {
    BOOL v16 = 0LL;
  }

  else
  {
    uint64_t v14 = *((void *)a1 + 1);
    BOOL v15 = *(_DWORD *)(v14 + 12) > v13;
    BOOL v16 = (_DWORD *)(v14 + v13);
    if (!v15) {
      BOOL v16 = 0LL;
    }
  }

  uint64_t v17 = 8 * v6;
  BOOL v18 = &v16[2 * v6];
  while (*v16 != a3)
  {
    v16 += 2;
    v17 -= 8LL;
    if (!v17)
    {
      BOOL v16 = v18;
      break;
    }
  }

  if (v16 == v18) {
    return 0LL;
  }
  else {
    return v16 + 1;
  }
}

void CSStore2::Store::~Store(id *this)
{
}

void CSStore2::Store::CreateWithBytes(void *a1, Bytef *a2, void *a3, void *a4)
{
  v14[2] = *MEMORY[0x1895F89C0];
  *a1 = 0LL;
  if (a2 && (_DWORD)a3)
  {
    id v11 = 0LL;
    CSStore2::Store::_Create((CSStore2 *)&v12, a2, a3, 1, 0LL, &v11);
    id v6 = v11;
    uint64_t v7 = v12;
    *a1 = v12;
    BOOL v8 = v7 != 0;
    if (!a4) {
      goto LABEL_8;
    }
  }

  else
  {
    uint64_t v9 = (void *)MEMORY[0x189607870];
    v13[0] = *MEMORY[0x189607490];
    v13[1] = @"Line";
    v14[0] = @"paramErr";
    v14[1] = &unk_189D69700;
    [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:v13 count:2];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 errorWithDomain:*MEMORY[0x189607670] code:-50 userInfo:v10];
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v8 = 0;
    if (!a4) {
      goto LABEL_8;
    }
  }

  if (!v8) {
    *a4 = v6;
  }
LABEL_8:
}

void sub_183E0B900(_Unwind_Exception *a1)
{
  void *v1 = 0LL;
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__87(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::string::resize(&v8, (std::string::size_type)this + 1, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::string::resize(&v8, (std::string::size_type)this + 1, 0) = 0LL;
  return result;
}

void __Block_byref_object_dispose__88(uint64_t a1)
{
}

void ___ZNK8CSStore25Store4copyEPU15__autoreleasingP7NSError_block_invoke( uint64_t a1, CSStore2::Table *this, _BYTE *a3)
{
  if (*((_DWORD *)this + 18) == 0x3FFFFFFF)
  {
    uint64_t v5 = (__CFString *)CSStore2::Table::copyCFName(this);
    uint64_t v6 = -[__CFString copy](v5, "copy");
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
    BOOL v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 4std::string::resize(&v8, (std::string::size_type)this + 1, 0) = v6;

    *a3 = 1;
  }

void sub_183E0B9A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::Store::CreateWithXPCObject(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v6 = v5;
  *a1 = 0LL;
  if (!v5 || MEMORY[0x186E27EEC](v5) != MEMORY[0x1895F9240])
  {
    uint64_t v7 = (void *)MEMORY[0x189607870];
    v19[0] = *MEMORY[0x189607490];
    v19[1] = @"Line";
    v20[0] = @"paramErr";
    v20[1] = &unk_189D69760;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:2];
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 errorWithDomain:*MEMORY[0x189607670] code:-50 userInfo:v8];
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }

  size_t length = xpc_data_get_length(v6);
  bytes_ptr = (CSStore2 *)xpc_data_get_bytes_ptr(v6);
  uint64_t v13 = (Bytef *)bytes_ptr;
  if (!bytes_ptr || HIDWORD(length))
  {
    BOOL v16 = (void *)MEMORY[0x189607870];
    v21[0] = *MEMORY[0x189607490];
    v21[1] = @"Line";
    v22[0] = @"kCSStoreBadDataErr";
    v22[1] = &unk_189D69748;
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 errorWithDomain:*MEMORY[0x189607670] code:-9496 userInfo:v17];
    id v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_4:
    BOOL v10 = 0;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }

  CSStore2::GetLog(bytes_ptr);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = length;
    _os_log_debug_impl( &dword_183DFE000,  v14,  OS_LOG_TYPE_DEBUG,  "Creating CSStore from XPC coder with length %llu",  buf,  0xCu);
  }

  id v18 = 0LL;
  CSStore2::Store::CreateWithBytes(buf, v13, (void *)length, &v18);
  id v9 = v18;
  uint64_t v15 = *(void *)buf;
  *a1 = *(void *)buf;
  BOOL v10 = v15 != 0;
  if (a3)
  {
LABEL_5:
    if (!v10) {
      *a3 = v9;
    }
  }

void sub_183E0BC14(_Unwind_Exception *a1)
{
  void *v2 = 0LL;
  _Unwind_Resume(a1);
}

id CSStore2::Store::encodeAsXPCObject(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if (a1) {
    int v3 = *(_DWORD *)(a1 + 16);
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = *MEMORY[0x1895FD590];
  unsigned int v5 = v3 + *MEMORY[0x1895FD590] - 1;
  if (v5 == v5 % *MEMORY[0x1895FD590]) {
    size_t v6 = v4;
  }
  else {
    size_t v6 = v5 / v4 * v4;
  }
  if (a1) {
    a1 = *(void *)(a1 + 8);
  }
  Copy = (CSStore2 *)CSStore2::VM::AllocateCopy((CSStore2::VM *)a1, (const void *)v6, (CSStore2::VM *)v6);
  CSStore2::GetLog(Copy);
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (Copy)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      size_t v30 = v6;
      _os_log_debug_impl( &dword_183DFE000,  v9,  OS_LOG_TYPE_DEBUG,  "Creating dispatch_data for XPC coder with length %llu",  buf,  0xCu);
    }

    BOOL v10 = (dispatch_queue_s *)(id)CSStore2::Store::_GetDispatchDataDeallocatorQueue(void)::result;
    id v11 = dispatch_data_create(Copy, v6, v10, (dispatch_block_t)*MEMORY[0x1895F8AA0]);

    if (v11)
    {
      xpc_object_t v13 = xpc_data_create_with_dispatch_data(v11);
      if (v13)
      {

        id v14 = 0LL;
        goto LABEL_30;
      }

      CSStore2::GetLog(0LL);
      BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_183DFE000,  v20,  OS_LOG_TYPE_ERROR,  "Could not create XPC data from dispatch data while encoding store.",  buf,  2u);
      }

      __int16 v21 = (void *)MEMORY[0x189607870];
      v27[0] = *MEMORY[0x189607490];
      v27[1] = @"Line";
      v28[0] = @"kCSStoreAllocFailedErr";
      v28[1] = &unk_189D69778;
      [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:v27 count:2];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v21 errorWithDomain:*MEMORY[0x189607670] code:-9493 userInfo:v18];
    }

    else
    {
      CSStore2::GetLog(v12);
      BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_183DFE000,  v16,  OS_LOG_TYPE_ERROR,  "could not create dispatch data from store mapping while encoding store.",  buf,  2u);
      }

      CSStore2::VM::Deallocate(Copy, (void *)v6);
      uint64_t v17 = (void *)MEMORY[0x189607870];
      v25[0] = *MEMORY[0x189607490];
      v25[1] = @"Line";
      v26[0] = @"kCSStoreAllocFailedErr";
      v26[1] = &unk_189D69790;
      [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:2];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v17 errorWithDomain:*MEMORY[0x189607670] code:-9493 userInfo:v18];
    }

    id v14 = (id)v19;
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( &dword_183DFE000,  v9,  OS_LOG_TYPE_ERROR,  "could not create a copy of the store mapping while encoding store.",  buf,  2u);
    }

    uint64_t v15 = (void *)MEMORY[0x189607870];
    v23[0] = *MEMORY[0x189607490];
    v23[1] = @"Line";
    v24[0] = @"kCSStoreAllocFailedErr";
    v24[1] = &unk_189D697A8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:2];
    id v11 = (dispatch_data_s *)objc_claimAutoreleasedReturnValue();
    [v15 errorWithDomain:*MEMORY[0x189607670] code:-9493 userInfo:v11];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (a2)
  {
    id v14 = v14;
    xpc_object_t v13 = 0LL;
    *a2 = v14;
  }

  else
  {
    xpc_object_t v13 = 0LL;
  }

LABEL_30:
  return v13;
}

void sub_183E0C04C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore25Store32_GetDispatchDataDeallocatorQueueEv_block_invoke()
{
  os_log_t v0 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

  dispatch_queue_t v1 = dispatch_queue_create("CSStore2 dispatch data deallocation", attr);
  CFIndex v2 = (void *)CSStore2::Store::_GetDispatchDataDeallocatorQueue(void)::result;
  CSStore2::Store::_GetDispatchDataDeallocatorQueue(void)::uint64_t result = (uint64_t)v1;
}

void ___ZN8CSStore25Store23CreateWithContentsOfURLEP5NSURLPU15__autoreleasingP7NSError_block_invoke( uint64_t a1, CSStore2::Table *this)
{
  if (this)
  {
    uint64_t v3 = **(void **)(a1 + 40);
    if (v3) {
      unint64_t v4 = *(void *)(v3 + 8);
    }
    else {
      unint64_t v4 = 0LL;
    }
    uint64_t v5 = 0xFFFFFFFFLL;
    BOOL v6 = (unint64_t)this >= v4;
    unint64_t v7 = (unint64_t)this - v4;
    if (v6 && !HIDWORD(v7))
    {
      else {
        uint64_t v5 = v7;
      }
    }
  }

  else
  {
    uint64_t v5 = 0xFFFFFFFFLL;
  }

  uint64_t v9 = *((unsigned int *)this + 19);
  uint64_t v12 = (__CFString *)CSStore2::Table::copyCFName(this);
  [NSString stringWithFormat:@"%@ offs", v12];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(NSString, "stringWithFormat:", @"@0x%llX, $@0x%llX", v5, v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v10];
}

void sub_183E0C1F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::GarbageCollection::Collect( CSStore2::GarbageCollection *this, FILE **a2, CSStore2::Store *a3, void *a4)
{
  char v5 = (char)a3;
  uint64_t v73 = *MEMORY[0x1895F89C0];
  if (*(void *)this) {
    BOOL v8 = *(__int128 **)(*(void *)this + 8LL);
  }
  else {
    BOOL v8 = 0LL;
  }
  BOOL IsNeeded = CSStore2::GarbageCollection::IsNeeded(this, a3);
  BOOL v10 = IsNeeded;
  CSStore2::GarbageCollection::GetGCLog((CSStore2::GarbageCollection *)IsNeeded);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = this;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(void *)&buf[14] = a2;
      _os_log_impl(&dword_183DFE000, v11, OS_LOG_TYPE_DEFAULT, "GCing and writing store %p with writer %p", buf, 0x16u);
    }

    int v14 = CSStore2::IsAppleInternal(void)::result;
    if (CSStore2::IsAppleInternal(void)::result)
    {
      unsigned int v15 = *((_DWORD *)v8 + 3);
      int v16 = *((_DWORD *)v8 + 4);
      CSStore2::GarbageCollection::GetGCLog(v13);
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)&uint8_t buf[4] = (double)(v15 - v16) * 0.0009765625;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(double *)&buf[14] = (double)v15 * 0.0009765625;
        _os_log_impl( &dword_183DFE000,  v17,  OS_LOG_TYPE_DEFAULT,  "Performing garbage collection to try to recover %.3f KB of %.3f KB.",  buf,  0x16u);
      }
    }

    __int128 v18 = *v8;
    __int128 v19 = v8[2];
    *(_OWORD *)&buf[16] = v8[1];
    __int128 v68 = v19;
    *(_OWORD *)buf = v18;
    __int128 v20 = v8[3];
    __int128 v21 = v8[4];
    __int128 v22 = v8[5];
    int v72 = *((_DWORD *)v8 + 24);
    __int128 v70 = v21;
    __int128 v71 = v22;
    __int128 v69 = v20;
    id v62 = 0LL;
    BOOL v23 = CSStore2::Writer::seek(*a2, 100LL, 0, &v62);
    id v24 = v62;
    id v25 = v24;
    if (!v23) {
      goto LABEL_37;
    }
    id v61 = v24;
    uint64_t v26 = *(void *)this;
    if (*(void *)this) {
      uint64_t v26 = *(void *)(v26 + 8);
    }
    int v27 = CSStore2::GarbageCollection::WriteTableCommon( this,  (unsigned int *)(v26 + 20),  (uint64_t)&buf[20],  a2,  v5,  (uint64_t)&v61);
    id v28 = v61;

    if (!v27)
    {
      id v25 = v28;
LABEL_37:
      uint64_t v43 = 0LL;
      goto LABEL_38;
    }

    if (!*a2
      || (CSStore2::Writer::IO<int,__sFILE *>((CSStore2 *)MEMORY[0x1895FB2A0], (std::string::size_type)*a2) & 0x80000000) != 0)
    {
      __int16 v29 = 1;
    }

    else
    {
      __int16 v29 = 2;
    }

    *(_WORD *)&buf[6] = v29;
    ++*(_DWORD *)&buf[8];
    id v60 = v28;
    unint64_t v45 = CSStore2::Writer::tell(*a2, &v60);
    id v46 = v60;

    if (!HIDWORD(v45))
    {
      id v25 = v46;
      goto LABEL_37;
    }

    *(_DWORD *)&_BYTE buf[12] = v45;
    *(_DWORD *)&buf[16] = v45;
    id v59 = v46;
    BOOL v48 = CSStore2::Writer::pwrite(a2, buf, 0x64uLL, 0LL, &v59);
    id v25 = v59;

    if (v14 == 0 || !v48)
    {
      if (!v48) {
        goto LABEL_37;
      }
      goto LABEL_31;
    }

    if (!CSStore2::Writer::IO<int,__sFILE *,long long,int>(*a2, 0LL, 2))
    {
      id v58 = 0LL;
      unint64_t v49 = CSStore2::Writer::tell(*a2, &v58);
      uint64_t v50 = (CSStore2::GarbageCollection *)v58;
      uint64_t v52 = v50;
      if (HIDWORD(v49))
      {
        LODWORD(v51) = *((_DWORD *)v8 + 3);
        double v55 = ((double)v51 - (double)v49) * 0.0009765625;
        CSStore2::GarbageCollection::GetGCLog(v50);
        uint64_t v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        unint64_t v53 = v56;
        if (v55 >= 0.0)
        {
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)unint64_t v65 = 134217984;
            double v66 = v55;
            _os_log_impl(&dword_183DFE000, v53, OS_LOG_TYPE_INFO, "Saved %.3f KB.", v65, 0xCu);
          }

          goto LABEL_55;
        }

        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)unint64_t v65 = 134217984;
          double v66 = v55;
          uint64_t v54 = "Failed to save space, to the order of %.3f KB.";
          goto LABEL_52;
        }
      }

      else
      {
        CSStore2::GarbageCollection::GetGCLog(v50);
        unint64_t v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)unint64_t v65 = 138412290;
          double v66 = *(double *)&v52;
          uint64_t v54 = "Failed to get file offset after GC: %@";
LABEL_52:
          _os_log_error_impl(&dword_183DFE000, v53, OS_LOG_TYPE_ERROR, v54, v65, 0xCu);
        }
      }

LABEL_55:
    }
  }

  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = this;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(void *)&buf[14] = a2;
      _os_log_impl(&dword_183DFE000, v11, OS_LOG_TYPE_DEFAULT, "Writing store (no GC) %p with writer %p", buf, 0x16u);
    }

    __int128 v30 = *v8;
    __int128 v31 = v8[2];
    *(_OWORD *)&buf[16] = v8[1];
    __int128 v68 = v31;
    *(_OWORD *)buf = v30;
    __int128 v32 = v8[3];
    __int128 v33 = v8[4];
    __int128 v34 = v8[5];
    int v72 = *((_DWORD *)v8 + 24);
    __int128 v70 = v33;
    __int128 v71 = v34;
    __int128 v69 = v32;
    unsigned __int16 v35 = crc32(0x6E797267uLL, (const Bytef *)v8 + 100, *((_DWORD *)v8 + 3) - 100);
    if (v35 >= 3uLL) {
      __int16 v36 = v35;
    }
    else {
      __int16 v36 = v35 | 0xE000;
    }
    *(_WORD *)&buf[6] = v36;
    id v64 = 0LL;
    BOOL v37 = CSStore2::Writer::pwrite(a2, buf, 0x64uLL, 0LL, &v64);
    id v38 = v64;
    id v25 = v38;
    if (!v37) {
      goto LABEL_37;
    }
    unsigned int v39 = *((_DWORD *)v8 + 3) + *MEMORY[0x1895FD590] - 1;
    if (v39 == v39 % *MEMORY[0x1895FD590]) {
      int v40 = *MEMORY[0x1895FD590];
    }
    else {
      int v40 = v39 / *MEMORY[0x1895FD590] * *MEMORY[0x1895FD590];
    }
    id v63 = v38;
    BOOL v41 = CSStore2::Writer::pwrite(a2, (char *)v8 + 100, (v40 - 100), 100LL, &v63);
    id v42 = v63;

    if (!v41)
    {
      uint64_t v43 = 0LL;
      id v25 = v42;
      goto LABEL_38;
    }

    id v25 = v42;
  }

void sub_183E0C804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::Writer::~Writer(std::string::size_type *this)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (*((_BYTE *)this + 8) && *this)
  {
    if (*((_BYTE *)this + 9))
    {
      int v2 = CSStore2::Writer::IO<int,__sFILE *>((CSStore2 *)MEMORY[0x1895FB2A0], *this);
      if ((v2 & 0x80000000) == 0)
      {
        int v3 = v2;
        bzero(v9, 0x400uLL);
      }
    }

    unint64_t v4 = (CSStore2 *)CSStore2::Writer::IO<int,__sFILE *>((CSStore2 *)MEMORY[0x1895FB208], *this);
    if ((_DWORD)v4)
    {
      CSStore2::GetLog(v4);
      char v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = *__error();
        unint64_t v7 = __error();
        BOOL v8 = strerror(*v7);
        v9[0] = 67109378;
        v9[1] = v6;
        __int16 v10 = 2082;
        id v11 = v8;
        _os_log_error_impl( &dword_183DFE000,  v5,  OS_LOG_TYPE_ERROR,  "Failed to close file handle for store writer: %i (%{public}s).",  (uint8_t *)v9,  0x12u);
      }
    }
  }

void sub_183E0C978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::IO<int,__sFILE *>(CSStore2 *a1, std::string::size_type a2)
{
  uint64_t v5 = ((uint64_t (*)(std::string::size_type))a1)(a2);
  int v9 = v5;
  if (CSStore2::Writer::logIO == 1)
  {
    __p.__r_.__value_.__r.__words[0] = a2;
    CSStore2::Writer::toString<__sFILE *>(&v8);
    CSStore2::Writer::toString<int>(&__p);
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v2, a1, (uint64_t)&v8, 1LL, (uint64_t)&__p);
  }

  return v5;
}

void sub_183E0CA44( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CSStore2::Writer::IO<int,char *>(int a1, std::string::size_type a2)
{
  uint64_t v5 = fcntl(a1, 50, a2);
  int v12 = v5;
  if (CSStore2::Writer::logIO == 1)
  {
    int v13 = 50;
    int v14 = a1;
    __p.__r_.__value_.__r.__words[0] = a2;
    CSStore2::Writer::toString<int>(&v9);
    CSStore2::Writer::toString<int>(&v10);
    CSStore2::Writer::toString<char *>(&v11, (const char **)&__p.__r_.__value_.__l.__data_);
    CSStore2::Writer::toString<int>(&__p);
    CSStore2::Writer::logFunctionCall( *(CSStore2 **)(vars0 + 8),  v2,  (CSStore2 *)MEMORY[0x1895FB210],  (uint64_t)&v9,  3LL,  (uint64_t)&__p);
    for (uint64_t i = 0LL; i != -9; i -= 3LL)
    {
      if (SHIBYTE(v11.__r_.__value_.__r.__words[i + 2]) < 0) {
        operator delete(*(void **)((char *)&v11.__r_.__value_.__l.__data_ + i * 8));
      }
    }
  }

  return v5;
}

void sub_183E0CB80( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  uint64_t v18 = 0LL;
  while (1)
  {
    if (*(&a17 + v18 + 71) < 0) {
      operator delete(*(void **)(&a17 + v18 + 48));
    }
    v18 -= 24LL;
    if (v18 == -72) {
      _Unwind_Resume(exception_object);
    }
  }

void CSStore2::Writer::IO<int,char const*>(const char *a1)
{
  int v5 = unlink(a1);
  if (CSStore2::Writer::logIO == 1)
  {
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a1;
    CSStore2::Writer::toString<char const*>(&v4, (const char **)&__p.__r_.__value_.__l.__data_);
    CSStore2::Writer::toString<int>(&__p);
    CSStore2::Writer::logFunctionCall( *(CSStore2 **)(vars0 + 8),  v1,  (CSStore2 *)MEMORY[0x1895FD468],  (uint64_t)&v4,  1LL,  (uint64_t)&__p);
  }

void sub_183E0CC90( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CSStore2::Writer::toString<char const*>(std::stringbuf::string_type *a1, const char **a2)
{
  std::stringbuf::string_type v4 = *a2;
  size_t v5 = strlen(v4);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v7, (uint64_t)v4, v5);
  std::stringbuf::str(a1, &v8);
  uint64_t v7 = *MEMORY[0x189614738];
  *(uint64_t *)((char *)&v7 + *(void *)(v7 - 24)) = *(void *)(MEMORY[0x189614738] + 24LL);
  v8.__vftable = (std::stringbuf_vtbl *)(MEMORY[0x189614750] + 16LL);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x186E277CC](&v9);
}

void sub_183E0CD88(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t CSStore2::Writer::toString<int>(std::stringbuf::string_type *a1)
{
  uint64_t v3 = *MEMORY[0x189614738];
  *(uint64_t *)((char *)&v3 + *(void *)(v3 - 24)) = *(void *)(MEMORY[0x189614738] + 24LL);
  v4.__vftable = (std::stringbuf_vtbl *)(MEMORY[0x189614750] + 16LL);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x186E277CC](&v5);
}

void sub_183E0CE50(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t std::ostringstream::basic_ostringstream[abi:nn180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x189614768];
  uint64_t v3 = MEMORY[0x189614768] + 64LL;
  *(void *)(a1 + 112) = MEMORY[0x189614768] + 64LL;
  uint64_t v4 = *(void *)(MEMORY[0x189614738] + 8LL);
  uint64_t v5 = *(void *)(MEMORY[0x189614738] + 16LL);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v5;
  int v6 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0LL;
  v6[1].__fmtflags_ = -1;
  *(void *)a1 = v2 + 24;
  *(void *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + _Block_object_dispose(va, 8) = MEMORY[0x189614750] + 16LL;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 8_Block_object_dispose(va, 8) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_183E0CF28(_Unwind_Exception *a1)
{
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)a1 = *MEMORY[0x189614738];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + _Block_object_dispose(va, 8) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x186E277CC](a1 + 112);
  return a1;
}

void *std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>( void *a1, uint64_t a2, uint64_t a3)
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
      std::stringbuf::string_type v10 = std::locale::use_facet(&__b, MEMORY[0x189614558]);
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
        abort();
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
      __int128 v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
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

  MEMORY[0x186E27718](v23);
  return a1;
}

void sub_183E0D1F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x186E27718](&a10);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::toString<char *>(std::stringbuf::string_type *a1, const char **a2)
{
  uint64_t v4 = *a2;
  size_t v5 = strlen(v4);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v7, (uint64_t)v4, v5);
  std::stringbuf::str(a1, &v8);
  uint64_t v7 = *MEMORY[0x189614738];
  *(uint64_t *)((char *)&v7 + *(void *)(v7 - 24)) = *(void *)(MEMORY[0x189614738] + 24LL);
  v8.__vftable = (std::stringbuf_vtbl *)(MEMORY[0x189614750] + 16LL);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x186E277CC](&v9);
}

void sub_183E0D2F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t CSStore2::Writer::toString<__sFILE *>(std::stringbuf::string_type *a1)
{
  uint64_t v3 = *MEMORY[0x189614738];
  *(uint64_t *)((char *)&v3 + *(void *)(v3 - 24)) = *(void *)(MEMORY[0x189614738] + 24LL);
  v4.__vftable = (std::stringbuf_vtbl *)(MEMORY[0x189614750] + 16LL);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x186E277CC](&v5);
}

void sub_183E0D3C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

BOOL CSStore2::GarbageCollection::IsNeeded(CSStore2::GarbageCollection *this, const CSStore2::Store *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  if ((a2 & 1) != 0)
  {
    CSStore2::GarbageCollection::GetGCLog(this);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_183DFE000, v5, OS_LOG_TYPE_INFO, "Forced. Will collect.", buf, 2u);
    }
  }

  else
  {
    if (!*(void *)this
      || (uint64_t v2 = *(void *)(*(void *)this + 8LL),
          unsigned int v3 = *(_DWORD *)(v2 + 12),
          LODWORD(v2) = *(_DWORD *)(v2 + 16),
          uint64_t v4 = v3 - v2,
          v3 <= v2)
      || v4 <= 0x80000)
    {
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      v8[2] = ___ZN8CSStore217GarbageCollection8IsNeededERKNS_5StoreEh_block_invoke;
      v8[3] = &unk_189D65CD0;
      char v9 = (char)a2;
      v8[4] = &v10;
      v8[5] = this;
      CSStore2::Store::enumerateTables((CSStore2 **)this, v8);
      BOOL v6 = *((_BYTE *)v11 + 24) != 0;
      goto LABEL_12;
    }

    CSStore2::GarbageCollection::GetGCLog(this);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = v4;
      _os_log_impl(&dword_183DFE000, v5, OS_LOG_TYPE_INFO, "Store wastes %llu bytes. Will collect.", buf, 0xCu);
    }
  }

  BOOL v6 = 1LL;
  *((_BYTE *)v11 + 24) = 1;
LABEL_12:
  _Block_object_dispose(&v10, 8);
  return v6;
}

void sub_183E0D564( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id CSStore2::GarbageCollection::GetGCLog(CSStore2::GarbageCollection *this)
{
  return (id)CSStore2::GarbageCollection::GetGCLog(void)::result;
}

BOOL CSStore2::Writer::pwrite(FILE **a1, const void *a2, size_t a3, off_t a4, void *a5)
{
  id v22 = 0LL;
  unint64_t v10 = CSStore2::Writer::tell(*a1, &v22);
  id v11 = v22;
  id v12 = v11;
  if (HIDWORD(v10))
  {
    if (v10 != a4)
    {
      id v21 = v11;
      BOOL v14 = CSStore2::Writer::seek(*a1, a4, 0, &v21);
      id v15 = v21;

      if (!v14) {
        goto LABEL_9;
      }
      id v12 = v15;
    }

    id v20 = v12;
    BOOL v16 = CSStore2::Writer::write(*a1, a2, a3, &v20);
    id v15 = v20;

    if (v16)
    {
      id v19 = v15;
      BOOL v13 = CSStore2::Writer::seek(*a1, v10, 0, &v19);
      id v17 = v19;

      id v15 = v17;
      if (!a5) {
        goto LABEL_12;
      }
LABEL_10:
      if (!v13)
      {
        id v12 = v15;
        BOOL v13 = 0LL;
        *a5 = v12;
        goto LABEL_13;
      }

LABEL_9:
    BOOL v13 = 0LL;
    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }

  BOOL v13 = 1LL;
LABEL_13:

  return v13;
}

  return v9 | v8 | v10;
}

  *a2 = v7;
  return v5;
}

void sub_183E0D720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL CSStore2::Writer::seek(FILE *a1, off_t a2, int a3, void *a4)
{
  v12[2] = *MEMORY[0x1895F89C0];
  int v5 = CSStore2::Writer::IO<int,__sFILE *,long long,int>(a1, a2, a3);
  int v6 = v5;
  if (a4 && v5)
  {
    uint64_t v7 = (void *)MEMORY[0x189607870];
    uint64_t v8 = *__error();
    v11[0] = *MEMORY[0x189607490];
    v11[1] = @"Line";
    v12[0] = @"errno";
    v12[1] = &unk_189D69928;
    [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:2];
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 errorWithDomain:*MEMORY[0x189607688] code:v8 userInfo:v9];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6 == 0;
}

void sub_183E0D830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::GarbageCollection::WriteTableCommon( CSStore2::Store *this, unsigned int *a2, uint64_t a3, FILE **a4, char a5, uint64_t a6)
{
  v55[2] = *MEMORY[0x1895F89C0];
  uint64_t v46 = 0LL;
  unint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000LL;
  char v49 = 1;
  uint64_t v40 = 0LL;
  BOOL v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  uint64_t v43 = __Block_byref_object_copy__87;
  id v44 = __Block_byref_object_dispose__88;
  id v45 = 0LL;
  uint64_t v32 = 0LL;
  __int128 v33 = &v32;
  uint64_t v34 = 0x5812000000LL;
  unsigned __int16 v35 = __Block_byref_object_copy__142;
  __int16 v36 = __Block_byref_object_dispose__143;
  memset(v37, 0, sizeof(v37));
  uint64_t v38 = 0LL;
  int v39 = 1065353216;
  Table = (char *)*((void *)this + 35);
  if (!Table) {
    Table = CSStore2::Store::getTable((CSStore2 **)this, @"<dictionary>");
  }
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = ___ZN8CSStore217GarbageCollection16WriteTableCommonERKNS_5StoreEPKNS_5TableEPS4_RNS_6WriterEhPU15__autoreleasingP7NSError_block_invoke;
  v29[3] = &unk_189D65CA8;
  BOOL v30 = Table == (char *)a2;
  v29[7] = a4;
  v29[8] = this;
  v29[4] = &v40;
  v29[5] = &v46;
  char v31 = a5;
  v29[6] = &v32;
  CSStore2::Store::enumerateUnits((CSStore2 **)this, a2, v29);
  if (*((_BYTE *)v47 + 24))
  {
    BOOL v13 = (id *)(v41 + 5);
    obuint64_t j = (id)v41[5];
    unint64_t v14 = CSStore2::Writer::tell(*a4, &obj);
    objc_storeStrong(v13, obj);
    if (HIDWORD(v14))
    {
      id v15 = v33;
      BOOL v16 = (id *)(v41 + 5);
      id v17 = (void *)v41[5];
      id v53 = 0LL;
      unint64_t v18 = CSStore2::Writer::tell(*a4, &v53);
      id v19 = v53;
      if (HIDWORD(v18))
      {
        unsigned int v52 = 0;
        CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create( v51,  (uint64_t)(v15 + 6),  v18,  0,  &v52);
        id v20 = v51[0];
        if (v51[0])
        {
          id v50 = v19;
          BOOL v21 = CSStore2::Writer::write(*a4, v51[0], v52, &v50);
          id v22 = v50;

          ((void (*)(_DWORD *))v51[1])(v20);
          if (v21)
          {

            objc_storeStrong(v16, v17);
            a6 = 1LL;
            *((_BYTE *)v47 + 24) = 1;
            *(_DWORD *)(a3 + 76) = v14;
            goto LABEL_15;
          }

          id v19 = v22;
        }

        else
        {
          BOOL v23 = (void *)MEMORY[0x189607870];
          v54[0] = *MEMORY[0x189607490];
          v54[1] = @"Line";
          v55[0] = @"kCSStoreAllocFailedErr";
          v55[1] = &unk_189D69958;
          [MEMORY[0x189603F68] dictionaryWithObjects:v55 forKeys:v54 count:2];
          id v24 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v25 = [v23 errorWithDomain:*MEMORY[0x189607670] code:-9493 userInfo:v24];

          id v19 = (id)v25;
        }
      }

      id v26 = v19;

      objc_storeStrong(v16, v26);
    }

    *((_BYTE *)v47 + 24) = 0;
  }

  if (a6)
  {
    *(void *)a6 = (id) v41[5];
    a6 = *((_BYTE *)v47 + 24) != 0;
  }

LABEL_15:
  _Block_object_dispose(&v32, 8);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v37[8]);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return a6;
}

    if (v24) {
      *id v24 = *(_DWORD *)(*(void *)(a2 + 80) + 4LL * i);
    }
    uint64_t result = 0LL;
    if (v15) {
      uint64_t *v15 = *(_DWORD *)(*(void *)(a2 + 88) + 4LL * i);
    }
  }

  return result;
}

      if (++v18 >= v14)
      {
        if ((_DWORD)v15)
        {
          BOOL v23 = 0LL;
          while (1)
          {
            id v24 = *(_DWORD *)(v12 + 4 * v23);
            if (v24 == v16)
            {
              if (*a5 == -1) {
                *a5 = v23;
              }
              goto LABEL_56;
            }

            if (v24 == v17) {
              break;
            }
            if (v24 == v7 && *a4 == -1)
            {
              *a4 = v23;
              uint64_t v25 = *a5;
              goto LABEL_35;
            }

void sub_183E0DBC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, id a37)
{
  _Block_object_dispose(&a21, 8);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table(v37);
  _Block_object_dispose(&a32, 8);

  _Block_object_dispose((const void *)(v40 - 200), 8);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::tell(FILE *a1, void *a2)
{
  v17[2] = *MEMORY[0x1895F89C0];
  off_t v3 = CSStore2::Writer::IO<long long,__sFILE *>(a1);
  if (v3 < 0x100000000LL)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      id v7 = 0LL;
      uint64_t v8 = v3 & 0xFFFFFF00;
      uint64_t v9 = v3;
      uint64_t v10 = 0x100000000LL;
      goto LABEL_9;
    }

    id v11 = (void *)MEMORY[0x189607870];
    int v12 = *__error();
    v14[0] = *MEMORY[0x189607490];
    v14[1] = @"Line";
    v15[0] = @"errno";
    v15[1] = &unk_189D69988;
    [MEMORY[0x189603F68] dictionaryWithObjects:v15 forKeys:v14 count:2];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v11 errorWithDomain:*MEMORY[0x189607688] code:v12 userInfo:v5];
  }

  else
  {
    uint64_t v4 = (void *)MEMORY[0x189607870];
    v16[0] = *MEMORY[0x189607490];
    v16[1] = @"Line";
    v17[0] = @"ERANGE";
    v17[1] = &unk_189D69970;
    [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:2];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v4 errorWithDomain:*MEMORY[0x189607688] code:34 userInfo:v5];
  }

  id v7 = (id)v6;

  if (a2)
  {
    id v7 = v7;
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    *a2 = v7;
  }

  else
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
  }

void sub_183E0DE04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::IO<int,__sFILE *,long long,int>(FILE *a1, off_t a2, int a3)
{
  uint64_t v7 = fseeko(a1, a2, a3);
  int v14 = v7;
  if (CSStore2::Writer::logIO == 1)
  {
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a1;
    off_t v16 = a2;
    int v15 = a3;
    CSStore2::Writer::toString<__sFILE *>(&v11);
    CSStore2::Writer::toString<long long>(&v12);
    CSStore2::Writer::toString<int>(&v13);
    CSStore2::Writer::toString<int>(&__p);
    CSStore2::Writer::logFunctionCall( *(CSStore2 **)(vars0 + 8),  v3,  (CSStore2 *)MEMORY[0x1895FB428],  (uint64_t)&v11,  3LL,  (uint64_t)&__p);
    for (uint64_t i = 0LL; i != -9; i -= 3LL)
    {
      if (SHIBYTE(v13.__r_.__value_.__r.__words[i + 2]) < 0) {
        operator delete(*(void **)((char *)&v13.__r_.__value_.__l.__data_ + i * 8));
      }
    }
  }

  return v7;
}

void sub_183E0DF24( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  uint64_t v16 = 0LL;
  while (1)
  {
    if (*(&a15 + v16 + 71) < 0) {
      operator delete(*(void **)(&a15 + v16 + 48));
    }
    v16 -= 24LL;
    if (v16 == -72) {
      _Unwind_Resume(exception_object);
    }
  }

uint64_t CSStore2::Writer::sync(std::string::size_type *a1, void *a2)
{
  v53[2] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (CSStore2 *)CSStore2::Writer::IO<int,__sFILE *>((CSStore2 *)MEMORY[0x1895FB268], *a1);
  int v5 = (int)v4;
  CSStore2::GetLog(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      std::string::size_type v35 = *a1;
      *(_DWORD *)buf = 134217984;
      *(void *)uint64_t v48 = v35;
      _os_log_debug_impl(&dword_183DFE000, v7, OS_LOG_TYPE_DEBUG, "Successfully called fflush(%p)", buf, 0xCu);
    }

    uint64_t v14 = CSStore2::Writer::IO<int,__sFILE *>((CSStore2 *)MEMORY[0x1895FB2A0], *a1);
    uint64_t v15 = v14;
    if ((v14 & 0x80000000) == 0)
    {
      uint64_t v16 = (CSStore2 *)CSStore2::Writer::IO<int,int>(v14);
      if ((_DWORD)v16)
      {
        id v17 = (CSStore2 *)__error();
        int v18 = *(_DWORD *)v17;
        CSStore2::GetLog(v17);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
        if (v18 == 28)
        {
          if (v20)
          {
            int v36 = *__error();
            uint64_t v37 = __error();
            uint64_t v38 = strerror(*v37);
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)uint64_t v48 = v15;
            *(_WORD *)&v48[4] = 1024;
            *(_DWORD *)&v48[6] = v36;
            LOWORD(v49[0]) = 2082;
            *(void *)((char *)v49 + 2) = v38;
            _os_log_error_impl( &dword_183DFE000,  v19,  OS_LOG_TYPE_ERROR,  "Error calling fcntl(%i, F_FULLFSYNC): %i (%{public}s).",  buf,  0x18u);
          }

          BOOL v21 = (void *)MEMORY[0x189607870];
          int v22 = *__error();
          v52[0] = *MEMORY[0x189607490];
          v52[1] = @"Line";
          v53[0] = @"errno";
          v53[1] = &unk_189D699A0;
          [MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:v52 count:2];
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v11 = [v21 errorWithDomain:*MEMORY[0x189607688] code:v22 userInfo:v10];
          goto LABEL_5;
        }

        if (v20)
        {
          int v39 = *__error();
          uint64_t v40 = __error();
          BOOL v41 = strerror(*v40);
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)uint64_t v48 = v15;
          *(_WORD *)&v48[4] = 1024;
          *(_DWORD *)&v48[6] = v39;
          LOWORD(v49[0]) = 2082;
          *(void *)((char *)v49 + 2) = v41;
          _os_log_error_impl( &dword_183DFE000,  v19,  OS_LOG_TYPE_ERROR,  "Error calling fcntl(%i, F_FULLFSYNC), trying fsync(): %i (%{public}s).",  buf,  0x18u);
        }

        id v24 = (CSStore2 *)CSStore2::Writer::IO<int,int>(MEMORY[0x1895FB468], v15);
        int v25 = (int)v24;
        CSStore2::GetLog(v24);
        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        int v27 = v26;
        if (v25)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            int v42 = *__error();
            uint64_t v43 = __error();
            id v44 = strerror(*v43);
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)uint64_t v48 = v15;
            *(_WORD *)&v48[4] = 1024;
            *(_DWORD *)&v48[6] = v42;
            LOWORD(v49[0]) = 2082;
            *(void *)((char *)v49 + 2) = v44;
            _os_log_error_impl( &dword_183DFE000,  v27,  OS_LOG_TYPE_ERROR,  "Error calling fsync(%i): %i (%{public}s).",  buf,  0x18u);
          }

          id v28 = (void *)MEMORY[0x189607870];
          int v29 = *__error();
          v50[0] = *MEMORY[0x189607490];
          v50[1] = @"Line";
          v51[0] = @"errno";
          v51[1] = &unk_189D699B8;
          [MEMORY[0x189603F68] dictionaryWithObjects:v51 forKeys:v50 count:2];
          uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v11 = [v28 errorWithDomain:*MEMORY[0x189607688] code:v29 userInfo:v10];
          goto LABEL_5;
        }

        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)uint64_t v48 = v15;
          _os_log_debug_impl(&dword_183DFE000, v27, OS_LOG_TYPE_DEBUG, "Successfully called fsync(%i)", buf, 8u);
        }
      }

      else
      {
        CSStore2::GetLog(v16);
        BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)uint64_t v48 = v15;
          _os_log_debug_impl( &dword_183DFE000,  v23,  OS_LOG_TYPE_DEBUG,  "Successfully called fcntl(%i, F_FULLFSYNC)",  buf,  8u);
        }
      }
    }

    id v12 = 0LL;
    uint64_t v13 = 1LL;
    goto LABEL_29;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    std::string::size_type v30 = *a1;
    int v31 = *__error();
    uint64_t v32 = __error();
    __int128 v33 = strerror(*v32);
    *(_DWORD *)buf = 134218498;
    *(void *)uint64_t v48 = v30;
    *(_WORD *)&v48[8] = 1024;
    v49[0] = v31;
    LOWORD(v49[1]) = 2082;
    *(void *)((char *)&v49[1] + 2) = v33;
    _os_log_error_impl( &dword_183DFE000,  v7,  OS_LOG_TYPE_ERROR,  "Error calling fflush(%p): %i (%{public}s).",  buf,  0x1Cu);
  }

  uint64_t v8 = (void *)MEMORY[0x189607870];
  int v9 = *__error();
  v45[0] = *MEMORY[0x189607490];
  v45[1] = @"Line";
  v46[0] = @"errno";
  v46[1] = &unk_189D699D0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:v45 count:2];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v8 errorWithDomain:*MEMORY[0x189607688] code:v9 userInfo:v10];
LABEL_5:
  id v12 = (id)v11;

  if (a2)
  {
    id v12 = v12;
    uint64_t v13 = 0LL;
    *a2 = v12;
  }

  else
  {
    uint64_t v13 = 0LL;
  }

void sub_183E0E4E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::IO<int,int>(int a1)
{
  uint64_t v3 = fcntl(a1, 51, 1LL);
  int v10 = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = a1;
    int v11 = 1;
    int v12 = 51;
    CSStore2::Writer::toString<int>(&v7);
    CSStore2::Writer::toString<int>(&v8);
    CSStore2::Writer::toString<int>(&v9);
    CSStore2::Writer::toString<int>(&__p);
    CSStore2::Writer::logFunctionCall( *(CSStore2 **)(vars0 + 8),  v1,  (CSStore2 *)MEMORY[0x1895FB210],  (uint64_t)&v7,  3LL,  (uint64_t)&__p);
    for (uint64_t i = 0LL; i != -9; i -= 3LL)
    {
      if (SHIBYTE(v9.__r_.__value_.__r.__words[i + 2]) < 0) {
        operator delete(*(void **)((char *)&v9.__r_.__value_.__l.__data_ + i * 8));
      }
    }
  }

  return v3;
}

void sub_183E0E650( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  uint64_t v18 = 0LL;
  while (1)
  {
    if (*(&a17 + v18 + 71) < 0) {
      operator delete(*(void **)(&a17 + v18 + 48));
    }
    v18 -= 24LL;
    if (v18 == -72) {
      _Unwind_Resume(exception_object);
    }
  }

uint64_t CSStore2::Writer::IO<int,int>(CSStore2 *a1, uint64_t a2)
{
  int v3 = a2;
  uint64_t v5 = ((uint64_t (*)(uint64_t))a1)(a2);
  int v9 = v5;
  if (CSStore2::Writer::logIO == 1)
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = v3;
    CSStore2::Writer::toString<int>(&v8);
    CSStore2::Writer::toString<int>(&__p);
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v2, a1, (uint64_t)&v8, 1LL, (uint64_t)&__p);
  }

  return v5;
}

void sub_183E0E774( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CSStore2::Writer::toString<long long>(std::stringbuf::string_type *a1)
{
  uint64_t v3 = *MEMORY[0x189614738];
  *(uint64_t *)((char *)&v3 + *(void *)(v3 - 24)) = *(void *)(MEMORY[0x189614738] + 24LL);
  v4.__vftable = (std::stringbuf_vtbl *)(MEMORY[0x189614750] + 16LL);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x186E277CC](&v5);
}

void sub_183E0E85C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

off_t CSStore2::Writer::IO<long long,__sFILE *>(FILE *a1)
{
  off_t v3 = ftello(a1);
  off_t v7 = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a1;
    CSStore2::Writer::toString<__sFILE *>(&v6);
    CSStore2::Writer::toString<long long>(&__p);
    CSStore2::Writer::logFunctionCall( *(CSStore2 **)(vars0 + 8),  v1,  (CSStore2 *)MEMORY[0x1895FB478],  (uint64_t)&v6,  1LL,  (uint64_t)&__p);
  }

  return v3;
}

void sub_183E0E920( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__142(uint64_t result, void *a2)
{
  uint64_t v2 = a2[6];
  a2[6] = 0LL;
  *(void *)(result + 4_Block_object_dispose(va, 8) = v2;
  *(void *)(result + 56) = a2[7];
  a2[7] = 0LL;
  uint64_t v5 = a2[8];
  off_t v3 = a2 + 8;
  uint64_t v4 = v5;
  *(void *)(result + 64) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 72) = v6;
  *(_DWORD *)(result + 8std::string::resize(&v8, (std::string::size_type)this + 1, 0) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 56);
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

    *(void *)(v2 + 8 * v7) = result + 64;
    void *v3 = 0LL;
    v3[1] = 0LL;
  }

  return result;
}

uint64_t __Block_byref_object_dispose__143(uint64_t a1)
{
  return std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table(a1 + 48);
}

void ___ZN8CSStore217GarbageCollection16WriteTableCommonERKNS_5StoreEPKNS_5TableEPS4_RNS_6WriterEhPU15__autoreleasingP7NSError_block_invoke( uint64_t a1, char *a2, _BYTE *a3)
{
  uint64_t v187 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(FILE ***)(a1 + 56);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  obuint64_t j = *(id *)(v6 + 40);
  unint64_t v167 = CSStore2::Writer::tell(*v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!HIDWORD(v167))
  {
    uint64_t v7 = a1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
    goto LABEL_242;
  }

  if (*(_BYTE *)(a1 + 72))
  {
    CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v184, *(CSStore2::Store **)(a1 + 64), 4 * *(_DWORD *)a2);
    if (!BYTE8(v185))
    {
      uint64_t v7 = a1;
      goto LABEL_202;
    }

    unint64_t v8 = v184;
    unsigned int v9 = v185;
    int v10 = *(FILE ***)(a1 + 56);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v13 = *(void **)(v11 + 40);
    int v12 = (id *)(v11 + 40);
    id v172 = v13;
    Table = *(char **)(v184 + 280);
    if (!Table) {
      Table = CSStore2::Store::getTable((CSStore2 **)v184, @"<dictionary>");
    }
    Unit = CSStore2::Store::getUnit((CSStore2 **)v8, (const CSStore2::Table *)Table, v9);
    if (Unit)
    {
      *(void *)&v177[1] = *((void *)Unit + 1);
      if (v177[2] != -1)
      {
        uint64_t v16 = *(void *)(*(void *)v8 + 8LL);
        if (*(_DWORD *)(v16 + 12) > v177[2])
        {
          v154 = Unit;
          v156 = v12;
          v158 = a2;
          v160 = v10;
          id v17 = (unsigned int *)(v16 + v177[2]);
          __int128 v184 = 0u;
          __int128 v185 = 0u;
          float v186 = 1.0;
          unint64_t v18 = *v17;
          if ((_DWORD)v18)
          {
            uint64_t v19 = 0LL;
            unint64_t v20 = 0LL;
            uint64_t v21 = 0LL;
            v163 = (CSStore2 **)v8;
            v161 = (unsigned int *)(v16 + v177[2]);
            while (1)
            {
              int v22 = &v17[2 * v21];
              unsigned int v23 = v22[1];
              v169 = v22 + 1;
              if (v23 - 0x20000000 >= 0xE0000001)
              {
                uint64_t v24 = v17[2 * v21 + 2];
                if (!__CFADD__((_DWORD)v24, 8 * v23))
                {
                  uint64_t v25 = *(void *)(*(void *)v8 + 8LL);
                  unsigned int v26 = *(_DWORD *)(v25 + 12);
                }
              }

LABEL_63:
              if (++v21 >= v18) {
                goto LABEL_64;
              }
            }

            uint64_t v28 = 0LL;
            uint64_t v29 = v25 + v24;
            while (1)
            {
              std::string::size_type v30 = (unsigned int *)(v29 + 8 * v28);
              unint64_t v31 = *v30;
              if ((_DWORD)v31)
              {
                unint64_t v3 = v30[1];
                if ((_DWORD)v3) {
                  break;
                }
              }

LABEL_61:
              if (++v28 >= (unint64_t)v23)
              {
                id v17 = v161;
                unint64_t v8 = (unint64_t)v163;
                unint64_t v18 = *v161;
                goto LABEL_63;
              }
            }

            if (v20)
            {
              uint8x8_t v32 = (uint8x8_t)vcnt_s8((int8x8_t)v20);
              v32.i16[0] = vaddlv_u8(v32);
              if (v32.u32[0] > 1uLL)
              {
                unint64_t v8 = *v30;
                if (v20 <= v31) {
                  unint64_t v8 = v31 % v20;
                }
              }

              else
              {
                unint64_t v8 = ((_DWORD)v20 - 1) & v31;
              }

              __int128 v33 = *(void ***)(v184 + 8 * v8);
              if (v33)
              {
                uint64_t v34 = *v33;
                if (*v33)
                {
                  do
                  {
                    unint64_t v35 = v34[1];
                    if (v35 == v31)
                    {
                      if (*((_DWORD *)v34 + 4) == (_DWORD)v31) {
                        goto LABEL_60;
                      }
                    }

                    else
                    {
                      if (v32.u32[0] > 1uLL)
                      {
                        if (v35 >= v20) {
                          v35 %= v20;
                        }
                      }

                      else
                      {
                        v35 &= v20 - 1;
                      }

                      if (v35 != v8) {
                        break;
                      }
                    }

                    uint64_t v34 = (void *)*v34;
                  }

                  while (v34);
                }
              }
            }

            uint64_t v34 = operator new(0x18uLL);
            *uint64_t v34 = 0LL;
            v34[1] = v31;
            *((_DWORD *)v34 + 4) = *v30;
            *((_DWORD *)v34 + 5) = 0;
            float v36 = (float)(unint64_t)(v19 + 1);
            if (!v20 || (float)(v186 * (float)v20) < v36)
            {
              BOOL v37 = (v20 & (v20 - 1)) != 0;
              if (v20 < 3) {
                BOOL v37 = 1LL;
              }
              unint64_t v38 = v37 | (2 * v20);
              unint64_t v39 = vcvtps_u32_f32(v36 / v186);
              if (v38 <= v39) {
                size_t v40 = v39;
              }
              else {
                size_t v40 = v38;
              }
              std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>( (uint64_t)&v184,  v40);
              unint64_t v20 = *((void *)&v184 + 1);
              if ((v20 & (v20 - 1)) != 0)
              {
                if (*((void *)&v184 + 1) <= v31) {
                  unint64_t v8 = v31 % *((void *)&v184 + 1);
                }
                else {
                  unint64_t v8 = v31;
                }
              }

              else
              {
                unint64_t v8 = (DWORD2(v184) - 1) & v31;
              }
            }

            uint64_t v41 = v184;
            int v42 = *(void **)(v184 + 8 * v8);
            if (v42)
            {
              *uint64_t v34 = *v42;
            }

            else
            {
              *uint64_t v34 = v185;
              *(void *)&__int128 v185 = v34;
              *(void *)(v41 + 8 * v_Block_object_dispose(va, 8) = &v185;
              if (!*v34) {
                goto LABEL_59;
              }
              unint64_t v43 = *(void *)(*v34 + 8LL);
              if ((v20 & (v20 - 1)) != 0)
              {
                if (v43 >= v20) {
                  v43 %= v20;
                }
              }

              else
              {
                v43 &= v20 - 1;
              }

              int v42 = (void *)(v184 + 8 * v43);
            }

            *int v42 = v34;
LABEL_59:
            uint64_t v19 = ++*((void *)&v185 + 1);
LABEL_60:
            *((_DWORD *)v34 + 5) = v3;
            unsigned int v23 = *v169;
            goto LABEL_61;
          }

    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        uint64_t v2 = v8 % v9;
      }
      else {
        uint64_t v2 = v8;
      }
    }

    else
    {
      uint64_t v2 = (v9 - 1) & v8;
    }
  }

  uint8x8_t v32 = *v5;
  __int128 v33 = (void *)*((void *)*v5 + v2);
  if (v33)
  {
    *uint64_t v14 = *v33;
LABEL_74:
    *__int128 v33 = v14;
    goto LABEL_75;
  }

  *uint64_t v14 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v14;
  v32[v2] = a1 + 32;
  if (*v14)
  {
    uint64_t v34 = *(void *)(*v14 + 8LL);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v34 >= v9) {
        v34 %= v9;
      }
    }

    else
    {
      v34 &= v9 - 1;
    }

    __int128 v33 = (char *)*v5 + 8 * v34;
    goto LABEL_74;
  }

LABEL_64:
          unint64_t v44 = CSStore2::Writer::tell(*v160, &v172);
          int v45 = v44;
          int v12 = v156;
          a2 = v158;
          if (HIDWORD(v44))
          {
            LODWORD(__nitems) = 0;
            CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Create( &v182,  (uint64_t)&v184,  v44,  0,  &__nitems);
            unint64_t v3 = (unint64_t)v182;
            if (v182)
            {
              v177[2] = v45;
              if (CSStore2::Writer::write(*v160, v182, __nitems, &v172)
                && (unint64_t v46 = CSStore2::Writer::tell(*v160, &v172), v47 = v46, HIDWORD(v46))
                && CSStore2::Writer::write(*v160, v154, 8uLL, &v172)
                && CSStore2::Writer::write(*v160, &v177[1], 8uLL, &v172))
              {
                unsigned int v48 = v47 & 0xFFFFFF00;
                uint64_t v49 = 0x100000000LL;
              }

              else
              {
                uint64_t v49 = 0LL;
                LOBYTE(v47) = 0;
                unsigned int v48 = 0;
              }

              ((void (*)(unint64_t))v183)(v3);
              goto LABEL_247;
            }

            unint64_t v3 = MEMORY[0x189607870];
            uint64_t v178 = *MEMORY[0x189607490];
            v179 = @"Line";
            v180 = @"kCSStoreAllocFailedErr";
            v181 = &unk_189D69BF8;
            [MEMORY[0x189603F68] dictionaryWithObjects:&v180 forKeys:&v178 count:2];
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            [(id)v3 errorWithDomain:*MEMORY[0x189607670] code:-9493 userInfo:v141];
            id v172 = (id)objc_claimAutoreleasedReturnValue();
          }

          uint64_t v49 = 0LL;
          LOBYTE(v47) = 0;
          unsigned int v48 = 0;
LABEL_247:
          std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v184);
          goto LABEL_191;
        }
      }

      unint64_t v3 = MEMORY[0x189607870];
      v182 = (_DWORD *)*MEMORY[0x189607490];
      v183 = @"Line";
      *(void *)&__int128 v184 = @"kCSStoreNotFoundErr";
      *((void *)&v184 + 1) = &unk_189D69C10;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v184 forKeys:&v182 count:2];
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      [(id)v3 errorWithDomain:*MEMORY[0x189607670] code:-9499 userInfo:v117];
      id v172 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      unint64_t v3 = MEMORY[0x189607870];
      v182 = (_DWORD *)*MEMORY[0x189607490];
      v183 = @"Line";
      *(void *)&__int128 v184 = @"kCSStoreNotFoundErr";
      *((void *)&v184 + 1) = &unk_189D69C28;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v184 forKeys:&v182 count:2];
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      [(id)v3 errorWithDomain:*MEMORY[0x189607670] code:-9499 userInfo:v118];
      id v172 = (id)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v49 = 0LL;
    LOBYTE(v47) = 0;
    unsigned int v48 = 0;
LABEL_191:
    objc_storeStrong(v12, v172);
    uint64_t v7 = a1;
    if ((v49 & 0x100000000LL) != 0) {
      unsigned int v119 = v48 & 0xFFFFFF00 | v47;
    }
    else {
      unsigned int v119 = v167;
    }
    LODWORD(v167) = v119;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (v49 & 0x100000000LL) != 0;
    goto LABEL_202;
  }

  if (*(_DWORD *)a2 >> 30 == 1)
  {
    id v50 = *(FILE ***)(a1 + 56);
    v165 = *(CSStore2::Store **)(a1 + 64);
    uint64_t v51 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v54 = *(_DWORD **)(v51 + 40);
    unsigned int v52 = (id *)(v51 + 40);
    id v53 = v54;
    size_t __nitems = 0LL;
    unint64_t v170 = CSStore2::Writer::tell(*v50, &__nitems);
    id v55 = (id)__nitems;
    if (!HIDWORD(v170)) {
      goto LABEL_200;
    }
    unsigned int v56 = *((_DWORD *)a2 + 1) + 11;
    if (v56 >= 4) {
      size_t v57 = v56 & 0xFFFFFFFC;
    }
    else {
      size_t v57 = 4LL;
    }
    id v58 = malloc(v57);
    if (!v58)
    {
      v120 = (void *)MEMORY[0x189607870];
      v182 = (_DWORD *)*MEMORY[0x189607490];
      v183 = @"Line";
      *(void *)&__int128 v184 = @"kCSStoreAllocFailedErr";
      *((void *)&v184 + 1) = &unk_189D69940;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v184 forKeys:&v182 count:2];
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v122 = [v120 errorWithDomain:*MEMORY[0x189607670] code:-9493 userInfo:v121];

      id v55 = (id)v122;
      goto LABEL_200;
    }

    id v59 = v58;
    memcpy(v58, a2, v57);
    id v175 = v55;
    size_t v157 = v57;
    BOOL v60 = CSStore2::Writer::seek(*v50, v57, 1, &v175);
    id v61 = (__CFString *)v175;

    if (!v60) {
      goto LABEL_199;
    }
    v174 = v61;
    int v62 = CSStore2::GarbageCollection::WriteTableCommon(v165);
    id v63 = v174;

    if (!v62)
    {
      id v61 = v63;
      goto LABEL_199;
    }

    unint64_t v65 = (char *)*((void *)v165 + 34);
    if (!v65) {
      unint64_t v65 = CSStore2::Store::getTable((CSStore2 **)v165, @"<string>");
    }
    if (v65 != a2) {
      goto LABEL_256;
    }
    StringCache = CSStore2::getStringCache(v165, v64);
    if (StringCache)
    {
      v150 = v52;
      v151 = v59;
      __int128 v184 = 0u;
      __int128 v185 = 0u;
      float v186 = 1.0;
      unint64_t v67 = *(unsigned int *)StringCache;
      *(void *)v155 = v63;
      if ((_DWORD)v67)
      {
        unint64_t v68 = 0LL;
        unint64_t v69 = 0LL;
        v159 = StringCache;
        unint64_t v162 = 0LL;
        __int128 v70 = StringCache;
        v152 = v50;
        v153 = v53;
        do
        {
          __int128 v71 = &v70[8 * v69];
          unsigned int v72 = *((_DWORD *)v71 + 1);
          v164 = (unsigned int *)(v71 + 4);
          if (v72 - 0x20000000 < 0xE0000001
            || (uint64_t v73 = *((unsigned int *)v71 + 2), __CFADD__((_DWORD)v73, 8 * v72))
            || ((uint64_t v74 = *(void *)(*(void *)v165 + 8LL),
                 unsigned int v75 = *(_DWORD *)(v74 + 12),
                 v73 + 8 * v72 <= v75)
              ? (BOOL v76 = v75 > v73)
              : (BOOL v76 = 0),
                !v76))
          {
            __int128 v70 = v159;
            goto LABEL_180;
          }

          unint64_t v77 = 0LL;
          uint64_t v78 = v74 + v73;
          do
          {
            uint64_t v79 = (unsigned int *)(v78 + 8 * v77);
            uint64_t v80 = v79 + 1;
            size_t v81 = *v79;
            if (!*v79 || (*((_BYTE *)v79 + 5) & 1) == 0) {
              goto LABEL_168;
            }
            if (v68)
            {
              uint8x8_t v82 = (uint8x8_t)vcnt_s8((int8x8_t)v68);
              v82.i16[0] = vaddlv_u8(v82);
              if (v82.u32[0] > 1uLL)
              {
                size_t v57 = *v79;
                if (v68 <= v81) {
                  size_t v57 = v81 % v68;
                }
              }

              else
              {
                size_t v57 = ((_DWORD)v68 - 1) & v81;
              }

              unsigned int v83 = *(void ***)(v184 + 8 * v57);
              if (v83)
              {
                unsigned int v84 = *v83;
                if (*v83)
                {
                  do
                  {
                    unint64_t v85 = v84[1];
                    if (v85 == v81)
                    {
                      if (*((_DWORD *)v84 + 4) == (_DWORD)v81) {
                        goto LABEL_167;
                      }
                    }

                    else
                    {
                      if (v82.u32[0] > 1uLL)
                      {
                        if (v85 >= v68) {
                          v85 %= v68;
                        }
                      }

                      else
                      {
                        v85 &= v68 - 1;
                      }

                      if (v85 != v57) {
                        break;
                      }
                    }

                    unsigned int v84 = (void *)*v84;
                  }

                  while (v84);
                }
              }
            }

            unsigned int v84 = operator new(0x18uLL);
            *unsigned int v84 = 0LL;
            v84[1] = v81;
            *((_DWORD *)v84 + 4) = *v79;
            *((_DWORD *)v84 + 5) = 0;
            float v86 = (float)(unint64_t)(*((void *)&v185 + 1) + 1LL);
            if (!v68 || (float)(v186 * (float)v68) < v86)
            {
              unint64_t v87 = v69;
              BOOL v88 = (v68 & (v68 - 1)) != 0;
              if (v68 < 3) {
                BOOL v88 = 1LL;
              }
              unint64_t v89 = v88 | (2 * v68);
              unint64_t v90 = vcvtps_u32_f32(v86 / v186);
              if (v89 <= v90) {
                int8x8_t prime = (int8x8_t)v90;
              }
              else {
                int8x8_t prime = (int8x8_t)v89;
              }
              if (*(void *)&prime == 1LL)
              {
                int8x8_t prime = (int8x8_t)2LL;
                unint64_t v92 = v162;
              }

              else
              {
                unint64_t v92 = v162;
                if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
                {
                  int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
                  unint64_t v92 = *((void *)&v184 + 1);
                  unint64_t v68 = *((void *)&v184 + 1);
                }
              }

              if (*(void *)&prime <= v68)
              {
                if (*(void *)&prime < v68)
                {
                  unint64_t v99 = vcvtps_u32_f32((float)*((unint64_t *)&v185 + 1) / v186);
                  if (v68 < 3
                    || (uint8x8_t v100 = (uint8x8_t)vcnt_s8((int8x8_t)v68), v100.i16[0] = vaddlv_u8(v100), v100.u32[0] > 1uLL))
                  {
                    unint64_t v99 = std::__next_prime(v99);
                  }

                  else
                  {
                    uint64_t v101 = 1LL << -(char)__clz(v99 - 1);
                    if (v99 >= 2) {
                      unint64_t v99 = v101;
                    }
                  }

                  if (*(void *)&prime <= v99) {
                    int8x8_t prime = (int8x8_t)v99;
                  }
                  if (*(void *)&prime >= v68)
                  {
                    unint64_t v92 = *((void *)&v184 + 1);
                  }

                  else
                  {
                    if (prime) {
                      goto LABEL_123;
                    }
                    __int16 v107 = (void *)v184;
                    *(void *)&__int128 v184 = 0LL;
                    if (v107) {
                      operator delete(v107);
                    }
                    unint64_t v92 = 0LL;
                    *((void *)&v184 + 1) = 0LL;
                  }
                }
              }

              else
              {
LABEL_123:
                if (*(void *)&prime >> 61) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                char v93 = operator new(8LL * *(void *)&prime);
                v94 = (void *)v184;
                *(void *)&__int128 v184 = v93;
                if (v94) {
                  operator delete(v94);
                }
                uint64_t v95 = 0LL;
                *((int8x8_t *)&v184 + 1) = prime;
                do
                  *(void *)(v184 + 8 * v95++) = 0LL;
                while (*(void *)&prime != v95);
                v96 = (void **)v185;
                if ((void)v185)
                {
                  unint64_t v97 = *(void *)(v185 + 8);
                  uint8x8_t v98 = (uint8x8_t)vcnt_s8(prime);
                  v98.i16[0] = vaddlv_u8(v98);
                  if (v98.u32[0] > 1uLL)
                  {
                    if (v97 >= *(void *)&prime) {
                      v97 %= *(void *)&prime;
                    }
                  }

                  else
                  {
                    v97 &= *(void *)&prime - 1LL;
                  }

                  *(void *)(v184 + 8 * v97) = &v185;
                  for (uint64_t i = *v96; i; v97 = v103)
                  {
                    unint64_t v103 = i[1];
                    if (v98.u32[0] > 1uLL)
                    {
                      if (v103 >= *(void *)&prime) {
                        v103 %= *(void *)&prime;
                      }
                    }

                    else
                    {
                      v103 &= *(void *)&prime - 1LL;
                    }

                    if (v103 != v97)
                    {
                      if (!*(void *)(v184 + 8 * v103))
                      {
                        *(void *)(v184 + 8 * v103) = v96;
                        goto LABEL_148;
                      }

                      *v96 = (void *)*i;
                      *uint64_t i = **(void **)(v184 + 8 * v103);
                      **(void **)(v184 + 8 * v103) = i;
                      uint64_t i = v96;
                    }

                    unint64_t v103 = v97;
LABEL_148:
                    v96 = (void **)i;
                    uint64_t i = (void *)*i;
                  }
                }

                unint64_t v92 = (unint64_t)prime;
              }

              unint64_t v162 = v92;
              if ((v92 & (v92 - 1)) != 0)
              {
                unint64_t v69 = v87;
                if (v92 <= v81)
                {
                  size_t v57 = v81 % v92;
                  unint64_t v68 = v92;
                }

                else
                {
                  unint64_t v68 = v92;
                  size_t v57 = v81;
                }
              }

              else
              {
                size_t v57 = ((_DWORD)v92 - 1) & v81;
                unint64_t v68 = v92;
                unint64_t v69 = v87;
              }
            }

            uint64_t v104 = v184;
            __int16 v105 = *(void **)(v184 + 8 * v57);
            if (v105)
            {
              *unsigned int v84 = *v105;
            }

            else
            {
              *unsigned int v84 = v185;
              *(void *)&__int128 v185 = v84;
              *(void *)(v104 + 8 * v57) = &v185;
              if (!*v84) {
                goto LABEL_166;
              }
              unint64_t v106 = *(void *)(*v84 + 8LL);
              if ((v68 & (v68 - 1)) != 0)
              {
                if (v106 >= v68) {
                  v106 %= v68;
                }
              }

              else
              {
                v106 &= v68 - 1;
              }

              __int16 v105 = (void *)(v184 + 8 * v106);
            }

            *__int16 v105 = v84;
LABEL_166:
            ++*((void *)&v185 + 1);
LABEL_167:
            *((_DWORD *)v84 + 5) = *v80;
            unsigned int v72 = *v164;
LABEL_168:
            ++v77;
          }

          while (v77 < v72);
          __int128 v70 = v159;
          unint64_t v67 = *(unsigned int *)v159;
          id v50 = v152;
          id v53 = v153;
          id v63 = *(__CFString **)v155;
LABEL_180:
          ++v69;
        }

        while (v69 < v67);
      }

      *(void *)&v177[1] = 0LL;
      unint64_t v108 = CSStore2::Writer::tell(*v50, &v177[1]);
      v109 = (__CFString *)*(id *)&v177[1];
      unsigned int v52 = v150;
      if (!HIDWORD(v108))
      {
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v184);
        id v59 = v151;
LABEL_254:
        v146 = v109;
        int v145 = 0;
        v142 = v146;
LABEL_255:

        id v61 = v146;
        id v63 = v61;
        if (v145)
        {
LABEL_256:
          *(void *)&__int128 v184 = v63;
          BOOL v149 = CSStore2::Writer::pwrite(v50, v59, v157, v170, &v184);
          unint64_t v3 = (unint64_t)(id)v184;

          free(v59);
          if (v149)
          {
            char v123 = 1;
            goto LABEL_201;
          }

          id v55 = (id)v3;
LABEL_200:
          id v53 = v55;
          char v123 = 0;
          unint64_t v3 = (unint64_t)v53;
LABEL_201:

          objc_storeStrong(v52, v53);
          uint64_t v7 = a1;
          *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v123;
          goto LABEL_202;
        }

            v49 += 8LL;
            if (++v48 >= (unint64_t)*v41)
            {
              float v36 = *v9;
              break;
            }
          }
        }
      }
    }

    if (++v37 < v36) {
      continue;
    }
    break;
  }

  uint64_t v34 = *(void *)(*(void *)(a1 + 40) + 8LL);
LABEL_70:
  *(_BYTE *)(v34 + 24) = v35;
}

LABEL_199:
        free(v59);
        id v55 = v61;
        goto LABEL_200;
      }

      v177[0] = 0;
      id v59 = v151;
      CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Create( &v182,  v165,  (uint64_t)&v184,  v108,  v177);
      v143 = v182;
      if (v182)
      {
        v151[20] = v108;
        v180 = v109;
        BOOL v144 = CSStore2::Writer::write(*v50, v143, v177[0], &v180);
        v142 = v180;

        ((void (*)(_DWORD *))v183)(v143);
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v184);
        if (v144) {
          goto LABEL_251;
        }
      }

      else
      {
        v147 = (void *)MEMORY[0x189607870];
        uint64_t v178 = *MEMORY[0x189607490];
        v179 = @"Line";
        v180 = @"kCSStoreAllocFailedErr";
        v181 = &unk_189D69BE0;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v180 forKeys:&v178 count:2];
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        [v147 errorWithDomain:*MEMORY[0x189607670] code:-9493 userInfo:v148];
        v142 = (__CFString *)objc_claimAutoreleasedReturnValue();

        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v184);
      }

      v109 = v142;
      goto LABEL_254;
    }

    v142 = 0LL;
    v59[20] = -1;
LABEL_251:
    int v145 = 1;
    v146 = v63;
    goto LABEL_255;
  }

  v110 = *(FILE ***)(a1 + 56);
  uint64_t v111 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v113 = *(void **)(v111 + 40);
  v112 = (id *)(v111 + 40);
  id v171 = v113;
  unsigned int v114 = *((_DWORD *)a2 + 1) + 11;
  if (v114 >= 4) {
    size_t v115 = v114 & 0xFFFFFFFC;
  }
  else {
    size_t v115 = 4LL;
  }
  BOOL v116 = CSStore2::Writer::write(*v110, a2, v115, &v171);
  objc_storeStrong(v112, v171);
  uint64_t v7 = a1;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v116;
LABEL_202:
  if (!*(_BYTE *)(*(void *)(*(void *)(v7 + 40) + 8LL) + 24LL)) {
    goto LABEL_242;
  }
  uint64_t v124 = *(void *)(*(void *)(v7 + 48) + 8LL);
  v125 = (uint64_t *)(v124 + 48);
  unint64_t v126 = (4 * *(_DWORD *)a2);
  unint64_t v127 = *(void *)(v124 + 56);
  if (v127)
  {
    uint8x8_t v128 = (uint8x8_t)vcnt_s8((int8x8_t)v127);
    v128.i16[0] = vaddlv_u8(v128);
    if (v128.u32[0] > 1uLL)
    {
      unint64_t v3 = v126;
      if (v127 <= v126) {
        unint64_t v3 = v126 % v127;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v127 - 1) & v126;
    }

    v129 = *(void ***)(*v125 + 8 * v3);
    if (v129)
    {
      v130 = *v129;
      if (*v129)
      {
        do
        {
          unint64_t v131 = v130[1];
          if (v131 == v126)
          {
            if (*((_DWORD *)v130 + 4) == (_DWORD)v126)
            {
              uint64_t v7 = a1;
              goto LABEL_241;
            }
          }

          else
          {
            if (v128.u32[0] > 1uLL)
            {
              if (v131 >= v127) {
                v131 %= v127;
              }
            }

            else
            {
              v131 &= v127 - 1;
            }

            if (v131 != v3) {
              break;
            }
          }

          v130 = (void *)*v130;
        }

        while (v130);
      }
    }
  }

  v130 = operator new(0x18uLL);
  void *v130 = 0LL;
  v130[1] = v126;
  *((_DWORD *)v130 + 4) = v126;
  *((_DWORD *)v130 + 5) = 0;
  float v132 = (float)(unint64_t)(*(void *)(v124 + 72) + 1LL);
  float v133 = *(float *)(v124 + 80);
  if ((((float)(v133 * (float)v127) >= v132) & ~(v127 == 0)) == 0)
  {
    BOOL v134 = 1LL;
    if (v127 >= 3) {
      BOOL v134 = (v127 & (v127 - 1)) != 0;
    }
    unint64_t v135 = v134 | (2 * v127);
    unint64_t v136 = vcvtps_u32_f32(v132 / v133);
    if (v135 <= v136) {
      size_t v137 = v136;
    }
    else {
      size_t v137 = v135;
    }
    std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>( v124 + 48,  v137);
    unint64_t v127 = *(void *)(v124 + 56);
    if ((v127 & (v127 - 1)) != 0)
    {
      if (v127 <= v126) {
        unint64_t v3 = v126 % v127;
      }
      else {
        unint64_t v3 = v126;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v127 - 1) & v126;
    }
  }

  uint64_t v138 = *v125;
  v139 = *(void **)(*v125 + 8 * v3);
  uint64_t v7 = a1;
  if (v139)
  {
    void *v130 = *v139;
  }

  else
  {
    void *v130 = *(void *)(v124 + 64);
    *(void *)(v124 + 64) = v130;
    *(void *)(v138 + 8 * v3) = v124 + 64;
    if (!*v130) {
      goto LABEL_240;
    }
    unint64_t v140 = *(void *)(*v130 + 8LL);
    if ((v127 & (v127 - 1)) != 0)
    {
      if (v140 >= v127) {
        v140 %= v127;
      }
    }

    else
    {
      v140 &= v127 - 1;
    }

    v139 = (void *)(*v125 + 8 * v140);
  }

  void *v139 = v130;
LABEL_240:
  ++*(void *)(v124 + 72);
LABEL_241:
  *((_DWORD *)v130 + 5) = v167;
LABEL_242:
  if (!*(_BYTE *)(*(void *)(*(void *)(v7 + 40) + 8LL) + 24LL)) {
    *a3 = 1;
  }
}

void sub_183E0FB6C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table(v16 - 144);
  free(a11);

  _Unwind_Resume(a1);
}

BOOL CSStore2::Writer::write(FILE *__stream, const void *a2, size_t __nitems, void *a4)
{
  void v13[2] = *MEMORY[0x1895F89C0];
  uint64_t v5 = __nitems;
  size_t v6 = CSStore2::Writer::IO<unsigned long,void const*,unsigned long,unsigned long,__sFILE *>( a2,  __nitems,  __stream);
  size_t v7 = v6;
  if (a4 && v6 != v5)
  {
    unint64_t v8 = (void *)MEMORY[0x189607870];
    uint64_t v9 = *__error();
    v12[0] = *MEMORY[0x189607490];
    v12[1] = @"Line";
    v13[0] = @"errno";
    v13[1] = &unk_189D69910;
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:v12 count:2];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 errorWithDomain:*MEMORY[0x189607688] code:v9 userInfo:v10];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 == v5;
}

void sub_183E0FD9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

size_t CSStore2::Writer::IO<unsigned long,void const*,unsigned long,unsigned long,__sFILE *>( const void *a1, size_t __nitems, FILE *__stream)
{
  size_t v6 = fwrite(a1, 1uLL, __nitems, __stream);
  size_t v13 = v6;
  if (CSStore2::Writer::logIO == 1)
  {
    size_t v15 = __nitems;
    uint64_t v16 = 1LL;
    uint64_t v14 = __stream;
    std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v17);
    std::ostream::operator<<();
    std::stringbuf::str(&v9, (const std::stringbuf *)&v17[0].__r_.__value_.__r.__words[1]);
    v17[0].__r_.__value_.__r.__words[0] = *MEMORY[0x189614738];
    *(std::string::size_type *)((char *)v17[0].__r_.__value_.__r.__words
                              + *(void *)(v17[0].__r_.__value_.__r.__words[0] - 24)) = *(void *)(MEMORY[0x189614738] + 24LL);
    v17[0].__r_.__value_.__l.__size_ = MEMORY[0x189614750] + 16LL;
    if (v19 < 0) {
      operator delete(__p);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x186E277CC](_F8);
    CSStore2::Writer::toString<unsigned long>(&v10);
    CSStore2::Writer::toString<unsigned long>(&v11);
    CSStore2::Writer::toString<__sFILE *>(&v12);
    CSStore2::Writer::toString<unsigned long>(v17);
    CSStore2::Writer::logFunctionCall( *(CSStore2 **)(_F8[25] + 8LL),  v3,  (CSStore2 *)MEMORY[0x1895FB4C8],  (uint64_t)&v9,  4LL,  (uint64_t)v17);
    for (uint64_t i = 0LL; i != -12; i -= 3LL)
    {
      if (SHIBYTE(v12.__r_.__value_.__r.__words[i + 2]) < 0) {
        operator delete(*(void **)((char *)&v12.__r_.__value_.__l.__data_ + i * 8));
      }
    }
  }

  return v6;
}

void sub_183E0FF50( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, void *__p, uint64_t a27, int a28, __int16 a29, char a30, char a31)
{
  if (a31 < 0) {
    operator delete(__p);
  }
  uint64_t v32 = 0LL;
  while (1)
  {
    v32 -= 24LL;
    if (v32 == -96) {
      _Unwind_Resume(exception_object);
    }
  }

uint64_t CSStore2::Writer::toString<unsigned long>(std::stringbuf::string_type *a1)
{
  uint64_t v3 = *MEMORY[0x189614738];
  *(uint64_t *)((char *)&v3 + *(void *)(v3 - 24)) = *(void *)(MEMORY[0x189614738] + 24LL);
  v4.__vftable = (std::stringbuf_vtbl *)(MEMORY[0x189614750] + 16LL);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x186E277CC](&v5);
}

void sub_183E10084(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void ___ZN8CSStore217GarbageCollection8GetGCLogEv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.coreservicesstore", "GC");
  uint64_t v1 = (void *)CSStore2::GarbageCollection::GetGCLog(void)::result;
  CSStore2::GarbageCollection::GetGCLog(void)::uint64_t result = (uint64_t)v0;
}

void ___ZN8CSStore217GarbageCollection8IsNeededERKNS_5StoreEh_block_invoke( uint64_t a1, unsigned int *a2, _BYTE *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v3 = a2[19];
  if ((_DWORD)v3 != -1)
  {
    uint64_t v5 = *(void *)(**(void **)(a1 + 40) + 8LL);
    if (*(_DWORD *)(v5 + 12) > v3 && (*(_DWORD *)(v5 + v3) - 1) <= 0x1FFE)
    {
      char v8 = *(_BYTE *)(a1 + 48);
      Statistics = (CSStore2::GarbageCollection *)CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics((unsigned int *)(v5 + v3));
      unsigned int v10 = (v8 & 4) != 0 ? 50 : 5;
      if (Statistics / HIDWORD(Statistics) > v10)
      {
        CSStore2::GarbageCollection::GetGCLog(Statistics);
        std::stringbuf::string_type v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          std::stringbuf::string_type v12 = (id) CSStore2::Table::copyCFName((CSStore2::Table *)a2);
          int v13 = 136446210;
          uint64_t v14 = -[__CFString UTF8String](v12, "UTF8String");
          _os_log_impl( &dword_183DFE000,  v11,  OS_LOG_TYPE_INFO,  "Identifier cache on table '%{public}s' is unbalanced. Will collect.",  (uint8_t *)&v13,  0xCu);
        }

        *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
        *a3 = 1;
      }
    }
  }

void sub_183E10208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics( unsigned int *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = (unint64_t)((8 * (_DWORD)v1) | 4u) << 32;
  if (!(_DWORD)v1) {
    return 0LL;
  }
  LODWORD(v3) = 0;
  std::stringbuf v4 = a1 + 1;
  uint64_t v5 = *a1;
  do
  {
    unsigned int v7 = *v4;
    v4 += 2;
    unsigned int v6 = v7;
    uint64_t v3 = v7 + v3;
    else {
      uint64_t v8 = v6;
    }
    unint64_t v2 = v8 | ((unint64_t)(HIDWORD(v2) + 8 * v6) << 32);
    --v5;
  }

  while (v5);
  return v3 | (v1 << 32);
}

uint64_t CSStore2::Store::collectGarbage(CSStore2::Store *this, CSStore2::Store *a2)
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  if (CSStore2::GarbageCollection::IsNeeded(this, a2))
  {
    [MEMORY[0x1896078A8] defaultManager];
    std::stringbuf v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 temporaryDirectory];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 URLByAppendingPathComponent:@"ls-XXXXXXXXXXXXXXXX" isDirectory:0];
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6) {
      goto LABEL_26;
    }
    bzero(buf, 0x400uLL);
    CSStore2::GetLog((CSStore2 *)[v6 getFileSystemRepresentation:buf maxLength:1024]);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id v55 = 136380675;
      *(void *)unsigned int v56 = buf;
      _os_log_debug_impl( &dword_183DFE000,  v8,  OS_LOG_TYPE_DEBUG,  "Creating temporary file for store writer at %{private}s",  v55,  0xCu);
    }

    else {
      uint64_t v9 = CSStore2::Writer::IO<int,char *,int,int>((char *)buf);
    }
    uint64_t v11 = v9;
    if ((v9 & 0x80000000) != 0)
    {
      CSStore2::GetLog((CSStore2 *)v9);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      int v26 = *__error();
      int v27 = __error();
      uint64_t v28 = strerror(*v27);
      *(_DWORD *)id v55 = 67109378;
      *(_DWORD *)unsigned int v56 = v26;
      *(_WORD *)&v56[4] = 2082;
      *(void *)&v56[6] = v28;
      uint64_t v29 = "Failed to create file descriptor for store writer: %i (%{public}s).";
    }

    else
    {
      std::stringbuf::string_type v12 = CSStore2::Writer::IO<__sFILE *,int,char const*>(v9);
      if (v12)
      {

        id v51 = 0LL;
        unsigned int v52 = v12;
        __int16 v53 = 257;
        int v13 = CSStore2::GarbageCollection::Collect(this, &v52, a2, &v51);
        uint64_t v14 = (CSStore2 *)v51;
        uint64_t v15 = v14;
        if (!v13)
        {
          CSStore2::GetLog(v14);
          uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            buf[0].st_dev = 138543362;
            *(void *)&buf[0].st_mode = v15;
            _os_log_error_impl( &dword_183DFE000,  v32,  OS_LOG_TYPE_ERROR,  "Error running garbage collection: %{public}@",  (uint8_t *)buf,  0xCu);
          }

          goto LABEL_51;
        }

        CSStore2::Writer::sync((std::string::size_type *)&v52, 0LL);
        uint64_t v16 = CSStore2::Writer::IO<int,__sFILE *>((CSStore2 *)MEMORY[0x1895FB2A0], (std::string::size_type)v52);
        int v17 = v16;
        if ((v16 & 0x80000000) != 0)
        {
          CSStore2::GetLog((CSStore2 *)v16);
          unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            buf[0].st_dev = 134217984;
            *(void *)&buf[0].st_mode = v52;
            _os_log_error_impl( &dword_183DFE000,  v20,  OS_LOG_TYPE_ERROR,  "Unsupported: file handle %p had neither an underlying buffer nor a file descriptor.",  (uint8_t *)buf,  0xCu);
          }

          goto LABEL_48;
        }

        if (CSStore2::Writer::IO<int,int,stat *>(v16, buf))
        {
          unint64_t v18 = (CSStore2 *)__error();
          int v19 = *(_DWORD *)v18;
          CSStore2::GetLog(v18);
          unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = strerror(v19);
            *(_DWORD *)id v55 = 67109634;
            *(_DWORD *)unsigned int v56 = v17;
            *(_WORD *)&v56[4] = 1024;
            *(_DWORD *)&v56[6] = v19;
            *(_WORD *)&v56[10] = 2082;
            *(void *)&v56[12] = v21;
            int v22 = "Failed to stat fd %i: error %i %{public}s.";
LABEL_17:
            unsigned int v23 = v20;
            uint32_t v24 = 24;
LABEL_42:
            _os_log_error_impl(&dword_183DFE000, v23, OS_LOG_TYPE_ERROR, v22, v55, v24);
          }
        }

        else
        {
          if ((unint64_t)(buf[0].st_size - 1) <= 0x7FFFFFFFFFFFFFFDLL)
          {
            __int128 v33 = CSStore2::Writer::IO<void *,void *,unsigned long,int,int,int,long long>(buf[0].st_size, v17);
            if (v33 != (void *)-1LL)
            {
              id v34 = objc_alloc(MEMORY[0x189603F48]);
              unint64_t v35 = (void *)[v34 initWithBytesNoCopy:v33 length:buf[0].st_size deallocator:*MEMORY[0x189607478]];
              if (v35)
              {
                uint64_t v32 = v35;
                float v36 = (CSStore2::VM *)-[os_log_s bytes](v32, "bytes");
                BOOL v37 = (void *)-[os_log_s length](v32, "length");
                Copy = (void *)CSStore2::VM::AllocateCopy(v36, v37, (CSStore2::VM *)v37);
                if (Copy) {
                  CSStore2::Store::setBytesNoCopy(this, Copy, -[os_log_s length](v32, "length"));
                }
                uint64_t v10 = 1LL;
                goto LABEL_52;
              }

              CSStore2::GetLog(0LL);
              unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                goto LABEL_48;
              }
              *(_DWORD *)id v55 = 67109120;
              *(_DWORD *)unsigned int v56 = v17;
              int v22 = "Failed to create NSData for mapped file %i.";
              unsigned int v23 = v20;
              uint32_t v24 = 8;
              goto LABEL_42;
            }

            int v45 = (CSStore2 *)__error();
            int v46 = *(_DWORD *)v45;
            CSStore2::GetLog(v45);
            unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              goto LABEL_48;
            }
            int v47 = strerror(v46);
            *(_DWORD *)id v55 = 67109634;
            *(_DWORD *)unsigned int v56 = v17;
            *(_WORD *)&v56[4] = 1024;
            *(_DWORD *)&v56[6] = v46;
            *(_WORD *)&v56[10] = 2082;
            *(void *)&v56[12] = v47;
            int v22 = "Failed to map fd %i: error %i %{public}s.";
            goto LABEL_17;
          }

          CSStore2::GetLog((CSStore2 *)buf[0].st_size);
          unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id v55 = 134217984;
            *(void *)unsigned int v56 = buf[0].st_size;
            int v22 = "Wrote a ludicrously long stream (%lli bytes) that cannot fit back in an NSData.";
            unsigned int v23 = v20;
            uint32_t v24 = 12;
            goto LABEL_42;
          }
        }

LABEL_48:
        CSStore2::GetLog(v48);
        uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0].st_dev) = 0;
          _os_log_impl( &dword_183DFE000,  v49,  OS_LOG_TYPE_DEFAULT,  "Unexpected: garbage collection succeeded, but did not get an NSData object.",  (uint8_t *)buf,  2u);
        }

        uint64_t v32 = 0LL;
LABEL_51:
        uint64_t v10 = 0LL;
LABEL_52:

LABEL_53:
        CSStore2::Writer::~Writer((std::string::size_type *)&v52);
        return v10;
      }

      CSStore2::GetLog(0LL);
      std::string::size_type v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        int v39 = *__error();
        size_t v40 = __error();
        uint64_t v41 = strerror(*v40);
        *(_DWORD *)id v55 = 67109378;
        *(_DWORD *)unsigned int v56 = v39;
        *(_WORD *)&v56[4] = 2082;
        *(void *)&v56[6] = v41;
        _os_log_error_impl( &dword_183DFE000,  v30,  OS_LOG_TYPE_ERROR,  "Failed to create file handle from file descriptor for store writer: %i (%{public}s).",  v55,  0x12u);
      }

      unint64_t v31 = (CSStore2 *)CSStore2::Writer::IO<int,int>((CSStore2 *)MEMORY[0x1895FA590], v11);
      if (!(_DWORD)v31) {
        goto LABEL_25;
      }
      CSStore2::GetLog(v31);
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
LABEL_24:

LABEL_25:
LABEL_26:
        unsigned int v52 = 0LL;
        __int16 v53 = 257;
        CSStore2::GetLog(v7);
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf[0].st_dev) = 0;
          _os_log_error_impl( &dword_183DFE000,  (os_log_t)v15,  OS_LOG_TYPE_ERROR,  "Error running garbage collection: failed to create temporary file handle",  (uint8_t *)buf,  2u);
        }

        uint64_t v10 = 0LL;
        goto LABEL_53;
      }

      int v42 = *__error();
      unint64_t v43 = __error();
      unint64_t v44 = strerror(*v43);
      *(_DWORD *)id v55 = 67109378;
      *(_DWORD *)unsigned int v56 = v42;
      *(_WORD *)&v56[4] = 2082;
      *(void *)&v56[6] = v44;
      uint64_t v29 = "Failed to close file descriptor for store writer: %i (%{public}s).";
    }

    _os_log_error_impl(&dword_183DFE000, v25, OS_LOG_TYPE_ERROR, v29, v55, 0x12u);
    goto LABEL_24;
  }

  return 1LL;
}

void sub_183E10948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  CSStore2::Writer::~Writer((std::string::size_type *)va);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::IO<int,int,stat *>(int a1, stat *a2)
{
  uint64_t v4 = fstat(a1, a2);
  int v9 = v4;
  if (CSStore2::Writer::logIO == 1)
  {
    int v10 = a1;
    CSStore2::Writer::toString<int>(&v7);
    std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v11);
    std::ostream::operator<<();
    std::stringbuf::str(&v8, (const std::stringbuf *)&v11[0].__r_.__value_.__r.__words[1]);
    v11[0].__r_.__value_.__r.__words[0] = *MEMORY[0x189614738];
    *(std::string::size_type *)((char *)v11[0].__r_.__value_.__r.__words
                              + *(void *)(v11[0].__r_.__value_.__r.__words[0] - 24)) = *(void *)(MEMORY[0x189614738] + 24LL);
    v11[0].__r_.__value_.__l.__size_ = MEMORY[0x189614750] + 16LL;
    if (v13 < 0) {
      operator delete(__p);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x186E277CC](_A8);
    CSStore2::Writer::toString<int>(v11);
    CSStore2::Writer::logFunctionCall( *(CSStore2 **)(_A8[25] + 8LL),  v2,  (CSStore2 *)MEMORY[0x1895FB448],  (uint64_t)&v7,  2LL,  (uint64_t)v11);
    for (uint64_t i = 0LL; i != -6; i -= 3LL)
    {
      if (SHIBYTE(v8.__r_.__value_.__r.__words[i + 2]) < 0) {
        operator delete(*(void **)((char *)&v7 + i * 8 + 24));
      }
    }
  }

  return v4;
}

void sub_183E10B3C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20, int a21, __int16 a22, char a23, char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  uint64_t v25 = 0LL;
  while (1)
  {
    v25 -= 24LL;
    if (v25 == -48) {
      _Unwind_Resume(exception_object);
    }
  }

void *CSStore2::Writer::IO<void *,void *,unsigned long,int,int,int,long long>(size_t a1, int a2)
{
  uint64_t v5 = mmap(0LL, a1, 1, 2, a2, 0LL);
  uint64_t v15 = v5;
  if (CSStore2::Writer::logIO == 1)
  {
    __p.__r_.__value_.__r.__words[0] = 0LL;
    size_t v20 = a1;
    int v18 = 2;
    int v19 = 1;
    int v17 = a2;
    uint64_t v16 = 0LL;
    CSStore2::Writer::toString<void *>(&v9);
    CSStore2::Writer::toString<unsigned long>(&v10);
    CSStore2::Writer::toString<int>(&v11);
    CSStore2::Writer::toString<int>(&v12);
    CSStore2::Writer::toString<int>(&v13);
    CSStore2::Writer::toString<long long>(&v14);
    CSStore2::Writer::toString<void *>(&__p);
    CSStore2::Writer::logFunctionCall( *(CSStore2 **)(vars0 + 8),  v2,  (CSStore2 *)MEMORY[0x1895FBF70],  (uint64_t)&v9,  6LL,  (uint64_t)&__p);
    for (uint64_t i = 0LL; i != -18; i -= 3LL)
    {
      if (SHIBYTE(v14.__r_.__value_.__r.__words[i + 2]) < 0) {
        operator delete(*(void **)((char *)&v14.__r_.__value_.__l.__data_ + i * 8));
      }
    }
  }

  return v5;
}

void sub_183E10D18( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  uint64_t v16 = 0LL;
  while (1)
  {
    if (*(&a15 + v16 + 143) < 0) {
      operator delete(*(void **)(&a15 + v16 + 120));
    }
    v16 -= 24LL;
    if (v16 == -144) {
      _Unwind_Resume(exception_object);
    }
  }

uint64_t CSStore2::Writer::toString<void *>(std::stringbuf::string_type *a1)
{
  uint64_t v3 = *MEMORY[0x189614738];
  *(uint64_t *)((char *)&v3 + *(void *)(v3 - 24)) = *(void *)(MEMORY[0x189614738] + 24LL);
  v4.__vftable = (std::stringbuf_vtbl *)(MEMORY[0x189614750] + 16LL);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x186E277CC](&v5);
}

void sub_183E10E3C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

FILE *CSStore2::Writer::IO<__sFILE *,int,char const*>(int a1)
{
  uint64_t v3 = fdopen(a1, "w");
  std::stringbuf::string_type v9 = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    int v10 = a1;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)"w";
    CSStore2::Writer::toString<int>(&v7);
    CSStore2::Writer::toString<char const*>(&v8, (const char **)&__p.__r_.__value_.__l.__data_);
    CSStore2::Writer::toString<__sFILE *>(&__p);
    CSStore2::Writer::logFunctionCall( *(CSStore2 **)(vars0 + 8),  v1,  (CSStore2 *)MEMORY[0x1895FB228],  (uint64_t)&v7,  2LL,  (uint64_t)&__p);
    for (uint64_t i = 0LL; i != -6; i -= 3LL)
    {
      if (SHIBYTE(v8.__r_.__value_.__r.__words[i + 2]) < 0) {
        operator delete(*(void **)((char *)&v7 + i * 8 + 24));
      }
    }
  }

  return v3;
}

void sub_183E10F38( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, uint64_t a23, int a24, __int16 a25, char a26, char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  uint64_t v28 = 0LL;
  while (1)
  {
    if (*(&a27 + v28) < 0) {
      operator delete(*(void **)((char *)&a22 + v28));
    }
    v28 -= 24LL;
    if (v28 == -48) {
      _Unwind_Resume(exception_object);
    }
  }

uint64_t CSStore2::Writer::IO<int,char *,int,int>(char *a1)
{
  uint64_t v3 = mkstemp_dprotected_np(a1, 3, 0);
  int v10 = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a1;
    int v11 = 0;
    int v12 = 3;
    CSStore2::Writer::toString<char *>(&v7, (const char **)&__p.__r_.__value_.__l.__data_);
    CSStore2::Writer::toString<int>(&v8);
    CSStore2::Writer::toString<int>(&v9);
    CSStore2::Writer::toString<int>(&__p);
    CSStore2::Writer::logFunctionCall( *(CSStore2 **)(vars0 + 8),  v1,  (CSStore2 *)MEMORY[0x1895FBF40],  (uint64_t)&v7,  3LL,  (uint64_t)&__p);
    for (uint64_t i = 0LL; i != -9; i -= 3LL)
    {
      if (SHIBYTE(v9.__r_.__value_.__r.__words[i + 2]) < 0) {
        operator delete(*(void **)((char *)&v9.__r_.__value_.__l.__data_ + i * 8));
      }
    }
  }

  return v3;
}

void sub_183E11098( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  uint64_t v16 = 0LL;
  while (1)
  {
    if (*(&a15 + v16 + 71) < 0) {
      operator delete(*(void **)(&a15 + v16 + 48));
    }
    v16 -= 24LL;
    if (v16 == -72) {
      _Unwind_Resume(exception_object);
    }
  }

uint64_t CSStore2::Writer::IO<int,char *>(char *a1)
{
  uint64_t v3 = mkstemp(a1);
  int v7 = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a1;
    CSStore2::Writer::toString<char *>(&v6, (const char **)&__p.__r_.__value_.__l.__data_);
    CSStore2::Writer::toString<int>(&__p);
    CSStore2::Writer::logFunctionCall( *(CSStore2 **)(vars0 + 8),  v1,  (CSStore2 *)MEMORY[0x1895FBF38],  (uint64_t)&v6,  1LL,  (uint64_t)&__p);
  }

  return v3;
}

void sub_183E111B8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t initMKBDeviceUnlockedSinceBoot(void)
{
  softLinkMKBDeviceUnlockedSinceBoot = (uint64_t (*)(void))dlsym( (void *)MobileKeyBagLibrary(void)::sLib,  "MKBDeviceUnlockedSinceBoot");
  return softLinkMKBDeviceUnlockedSinceBoot();
}

void *___ZL19MobileKeyBagLibraryv_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag", 2);
  MobileKeyBagLibrary(void)::sLib = (uint64_t)result;
  return result;
}

char *CSStore2::Store::embraceAndExtend(CSStore2::Store *this, char *a2, const void *a3, unsigned int a4)
{
  std::stringbuf v4 = a2;
  if (a3 >= a4)
  {
    LODWORD(v6) = (_DWORD)a3 - a4;
LABEL_6:
    CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
    else {
      unsigned int v9 = 4;
    }
    uint64_t v10 = *(void *)(*(void *)this + 8LL);
    unsigned int v11 = *(_DWORD *)(v10 + 16);
    BOOL v12 = v11 >= v9;
    unsigned int v13 = v11 - v9;
    if (!v12) {
      unsigned int v13 = 0;
    }
    *(_DWORD *)(v10 + 16) = v13;
    ++*(_DWORD *)(v10 + 8);
    return v4;
  }

  std::stringbuf::string_type v6 = a3;
  if (a2)
  {
    uint64_t v7 = *(void *)this;
    if (*(void *)this) {
      unint64_t v8 = *(void *)(v7 + 8);
    }
    else {
      unint64_t v8 = 0LL;
    }
    unsigned int v15 = -1;
    BOOL v12 = (unint64_t)a2 >= v8;
    unint64_t v16 = (unint64_t)&a2[-v8];
    if (v12 && !HIDWORD(v16))
    {
      else {
        unsigned int v15 = v16;
      }
    }
  }

  else
  {
    unsigned int v15 = -1;
  }

  NSUInteger v18 = CSStore2::Store::extend(this, a4);
  std::stringbuf v4 = (char *)v18;
  if (v18)
  {
    if (v15 != -1)
    {
      uint64_t v19 = *(void *)(*(void *)this + 8LL);
      if (v19 && *(_DWORD *)(v19 + 12) > v15) {
        CSStore2::VM::Copy(v18, v19 + v15, v6);
      }
    }

    goto LABEL_6;
  }

  return v4;
}

Unit *CSStore2::Store::allocateTable(CSStore2::Store *this, NSString *a2, int a3, NSString *a4)
{
  uint64_t v7 = a2;
  unint64_t v8 = v7;
  if (v7 && CSStore2::Table::IsNameAllowed((CSStore2::Table *)v7, a4))
  {
    uint64_t v9 = *(void *)this;
    if (*(void *)this) {
      uint64_t v9 = *(void *)(v9 + 8);
    }
    Unit = CSStore2::Store::allocateUnit(this, (CSStore2::Table *)(v9 + 20), a3 + 72, 0);
    unsigned int v11 = Unit;
    if (Unit)
    {
      uint64_t v12 = *(void *)this;
      if (*(void *)this) {
        unint64_t v13 = *(void *)(v12 + 8);
      }
      else {
        unint64_t v13 = 0LL;
      }
      unsigned int v15 = -1;
      BOOL v16 = (unint64_t)Unit >= v13;
      unint64_t v17 = (unint64_t)Unit - v13;
      if (v16 && !HIDWORD(v17))
      {
        else {
          unsigned int v15 = v17;
        }
      }

      memset(v25, 0, sizeof(v25));
      int v26 = 1065353216;
      NSUInteger v19 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create(this, (uint64_t)v25);
      std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v25);
      if (v19)
      {
        uint64_t v20 = *(void *)this;
        if (v15 == -1)
        {
          unsigned int v11 = 0LL;
          if (v20) {
            NSUInteger v21 = *(void *)(v20 + 8);
          }
          else {
            NSUInteger v21 = 0LL;
          }
        }

        else
        {
          NSUInteger v21 = *(void *)(v20 + 8);
          if (*(_DWORD *)(v21 + 12) <= v15) {
            unsigned int v11 = 0LL;
          }
          else {
            unsigned int v11 = (Unit *)(v21 + v15);
          }
        }

        int v22 = -1;
        BOOL v16 = v19 >= v21;
        NSUInteger v23 = v19 - v21;
        if (v16 && !HIDWORD(v23))
        {
          else {
            int v22 = v23;
          }
        }

        *(_DWORD *)&v11->var3[68] = v22;
        CSStore2::Table::setName((CSStore2::Table *)v11, v8);
        CSStore2::Store::_dataDidMove(this);
      }
    }
  }

  else
  {
    unsigned int v11 = 0LL;
  }

  return v11;
}

void sub_183E1150C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Unwind_Resume(a1);
}

BOOL CSStore2::Table::IsNameAllowed(CSStore2::Table *this, NSString *a2)
{
  int v2 = (int)a2;
  uint64_t v3 = this;
  if (-[CSStore2::Table length](v3, "length")) {
  else
  }
    BOOL v4 = 1LL;

  return v4;
}

void sub_183E115A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Unit *CSStore2::Store::allocateUnit(CSStore2::Store *this, CSStore2::Table *a2, int a3, unsigned int a4)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    uint64_t v7 = *(void *)this;
    if (*(void *)this) {
      unint64_t v8 = *(void *)(v7 + 8);
    }
    else {
      unint64_t v8 = 0LL;
    }
    unsigned int v9 = -1;
    BOOL v10 = (unint64_t)a2 >= v8;
    unint64_t v11 = (unint64_t)a2 - v8;
    if (v10 && !HIDWORD(v11))
    {
      else {
        unsigned int v9 = v11;
      }
    }
  }

  else
  {
    unsigned int v9 = -1;
  }

  uint64_t v13 = CSStore2::Store::extend(this, a3 + 8);
  if (!v13) {
    return 0LL;
  }
  if (v9 == -1 || (uint64_t v14 = *(void *)(*(void *)this + 8LL), *(_DWORD *)(v14 + 12) <= v9))
  {
    unsigned int v15 = 0LL;
    if (!a4)
    {
LABEL_21:
      int v16 = *((_DWORD *)v15 + 18);
      if (v16 == 0x3FFFFFFF)
      {
        CSStore2::GetLog((CSStore2 *)v13);
        NSUInteger v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          id v22 = CSStore2::Table::getName(v15);
          uint64_t v23 = [v22 UTF8String];
          uint64_t v24 = (4 * *(_DWORD *)v15);
          int v26 = 136446466;
          uint64_t v27 = v23;
          __int16 v28 = 2048;
          uint64_t v29 = v24;
          _os_log_fault_impl( &dword_183DFE000,  v21,  OS_LOG_TYPE_FAULT,  "Ran out of unit IDs for table %{public}s (%llx): process will terminate.",  (uint8_t *)&v26,  0x16u);
        }

        uint64_t v25 = *((void *)this + 40);
        if (v25) {
          (*(void (**)(uint64_t, void))(v25 + 16))(v25, (4 * *(_DWORD *)v15));
        }
        abort();
      }

      int v17 = v16 + 1;
      *((_DWORD *)v15 + 1_Block_object_dispose(va, 8) = v17;
      a4 = 4 * v17;
    }
  }

  else
  {
    unsigned int v15 = (CSStore2::Table *)(v14 + v9);
    if (!a4) {
      goto LABEL_21;
    }
  }

  uint64_t v18 = *(void *)this;
  if (*(void *)this) {
    uint64_t v18 = *(void *)(v18 + 8);
  }
  if (v15 == (CSStore2::Table *)(v18 + 20))
  {
    *(_BYTE *)(v13 + _Block_object_dispose(va, 8) = 0;
    *(void *)(v13 + 72) = 0xFFFFFFFF00000000LL;
    int v19 = 0x40000000;
  }

  else
  {
    int v19 = 0;
  }

  *(_DWORD *)uint64_t v13 = v19 | (a4 >> 2);
  *(_DWORD *)(v13 + 4) = a3;
  return CSStore2::Store::setUnitAddress((CSStore2 **)this, v15, a4 & 0xFFFFFFFC, (Unit *)v13);
}

void sub_183E117E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFStringRef CSStore2::Table::getName(CSStore2::Table *this)
{
  return (id)CSStore2::Table::copyCFName(this);
}

Unit *CSStore2::Store::setUnitAddress(CSStore2 **this, CSStore2::Table *a2, unsigned int a3, Unit *a4)
{
  if (a4)
  {
    std::stringbuf::string_type v6 = *this;
    if (*this) {
      unint64_t v7 = *((void *)v6 + 1);
    }
    else {
      unint64_t v7 = 0LL;
    }
    unsigned int v8 = -1;
    BOOL v9 = (unint64_t)a4 >= v7;
    unint64_t v10 = (unint64_t)a4 - v7;
    if (v9 && !HIDWORD(v10))
    {
      else {
        unsigned int v8 = v10;
      }
    }
  }

  else
  {
    unsigned int v8 = -1;
  }

  uint64_t v12 = *((unsigned int *)a2 + 19);
  if ((_DWORD)v12 != -1)
  {
    uint64_t v13 = *this;
    uint64_t v14 = *((void *)*this + 1);
    if (*(_DWORD *)(v14 + 12) > v12)
    {
      unsigned int v15 = (_DWORD *)(v14 + v12);
      if (a4)
      {
        if (a3)
        {
          int v16 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Find( v13,  (int *)(v14 + v12),  a3);
          unsigned int v17 = a3;
          if (v16)
          {
            *int v16 = v8;
            goto LABEL_72;
          }
        }

        else
        {
          if (v8 != -1)
          {
LABEL_73:
            uint64_t v44 = *((void *)*this + 1);
            if (*(_DWORD *)(v44 + 12) > v8) {
              return (Unit *)(v44 + v8);
            }
            return 0LL;
          }

          unsigned int v17 = 0;
        }

        int v19 = &v15[2 * ((unsigned __int16)(v17 >> 2) % *v15)];
        unint64_t v20 = (unint64_t)(v19 + 1);
        uint64_t v21 = v19[2];
        if ((_DWORD)v21 == -1)
        {
          uint64_t v25 = 0LL;
        }

        else
        {
          uint64_t v22 = *((void *)*this + 1);
          BOOL v23 = *(_DWORD *)(v22 + 12) > v21;
          uint64_t v24 = (char *)(v22 + v21);
          if (v23) {
            uint64_t v25 = v24;
          }
          else {
            uint64_t v25 = 0LL;
          }
        }

        uint64_t v26 = *(unsigned int *)v20;
        if ((_DWORD)v26)
        {
          uint64_t v27 = 0LL;
          __int16 v28 = v25 + 4;
          while (*(v28 - 1) && *v28 != -1)
          {
            ++v27;
            v28 += 2;
            if (v26 == v27) {
              goto LABEL_36;
            }
          }

          uint64_t v32 = &v25[8 * v27];
          *(_DWORD *)uint64_t v32 = v17;
          *((_DWORD *)v32 + 1) = v8;
LABEL_72:
          if (v8 == -1) {
            return 0LL;
          }
          goto LABEL_73;
        }

LABEL_36:
        unsigned int v29 = v26 + 8;
        if (*this)
        {
          unint64_t v30 = *((void *)*this + 1);
          unsigned int v31 = -1;
          BOOL v9 = v20 >= v30;
          v20 -= v30;
          if (!v9 || HIDWORD(v20)) {
            goto LABEL_51;
          }
        }

        else
        {
          if (HIDWORD(v20))
          {
            unsigned int v31 = -1;
            goto LABEL_51;
          }

          unint64_t v30 = MEMORY[8];
        }

        else {
          unsigned int v31 = v20;
        }
LABEL_51:
        id v34 = CSStore2::Store::embraceAndExtend( (CSStore2::Store *)this,  v25,  (const void *)(8 * v26),  8 * v29);
        if (v31 == -1 || (uint64_t v35 = *((void *)*this + 1), *(_DWORD *)(v35 + 12) <= v31)) {
          float v36 = 0LL;
        }
        else {
          float v36 = (_DWORD *)(v35 + v31);
        }
        if (!v34)
        {
          v36[1] = -1;
          abort();
        }

        BOOL v37 = *this;
        if (*this) {
          unint64_t v38 = *((void *)v37 + 1);
        }
        else {
          unint64_t v38 = 0LL;
        }
        int v39 = -1;
        BOOL v9 = (unint64_t)v34 >= v38;
        unint64_t v40 = (unint64_t)&v34[-v38];
        if (v9 && !HIDWORD(v40))
        {
          else {
            int v39 = v40;
          }
        }

        v36[1] = v39;
        int v42 = (unsigned int *)&v34[8 * v26];
        *int v42 = a3;
        v42[1] = v8;
        if ((int)v26 + 1 < v29)
        {
          uint64_t v43 = 0LL;
          do
          {
            *(void *)&v34[8 * (v26 + 1) + v43] = 0xFFFFFFFF00000000LL;
            v43 += 8LL;
          }

          while ((_DWORD)v43 != 56);
        }

        *v36 += 8;
        goto LABEL_72;
      }

      if (!a3) {
        return 0LL;
      }
      uint64_t v18 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Find( v13,  (int *)(v14 + v12),  a3);
      if (!v18) {
        return 0LL;
      }
      a4 = 0LL;
      *uint64_t v18 = -1;
    }
  }

  return a4;
}

uint64_t CSStore2::Store::getUnitCount(CSStore2 **this, const CSStore2::Table *a2)
{
  uint64_t v5 = 0LL;
  std::stringbuf::string_type v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  int v8 = 0;
  if (a2)
  {
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = ___ZNK8CSStore25Store12getUnitCountEPKNS_5TableE_block_invoke;
    v4[3] = &unk_189D65C40;
    v4[4] = &v5;
    CSStore2::Store::enumerateUnits(this, (unsigned int *)a2, v4);
    uint64_t v2 = *((unsigned int *)v6 + 6);
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_183E11B84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t ___ZNK8CSStore25Store12getUnitCountEPKNS_5TableE_block_invoke(uint64_t result)
{
  return result;
}

char *CSStore2::Store::getTable(CSStore2::Store *this, unsigned int a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a2 != -37516)
  {
    if (a2 > 0xFF)
    {
      CSStore2::GetLog(this);
      int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 134218240;
        uint64_t v12 = a2;
        __int16 v13 = 2048;
        uint64_t v14 = a2 >> 2;
        _os_log_debug_impl( &dword_183DFE000,  v8,  OS_LOG_TYPE_DEBUG,  "Table %llu (shifted %llu) cannot fit in the in-memory table offset list. Consider lengthening the tableOffsets field.",  (uint8_t *)&v11,  0x16u);
      }
    }

    else
    {
      uint64_t v4 = *((unsigned int *)this + (a2 >> 2) + 2);
      if ((_DWORD)v4 != -1)
      {
        uint64_t v5 = *(void *)(*(void *)this + 8LL);
      }
    }
  }

  uint64_t v9 = *(void *)this;
  if (*(void *)this) {
    uint64_t v9 = *(void *)(v9 + 8);
  }
  uint64_t v7 = (const CSStore2::Table *)(v9 + 20);
  if (a2 != -37516) {
    return CSStore2::Store::getUnit((CSStore2 **)this, v7, a2);
  }
  return (char *)v7;
}

Unit *CSStore2::Store::reallocateUnit(CSStore2 **this, CSStore2::Table *a2, Unit *a3, CSStore2::VM *a4)
{
  uint64_t v5 = a3;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  var2 = (const void *)a3->var2;
  int v8 = (_DWORD)var2 - (_DWORD)a4;
  if (var2 >= a4)
  {
    CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
    else {
      unsigned int v13 = 4;
    }
    uint64_t v14 = *((void *)*this + 1);
    unsigned int v15 = *(_DWORD *)(v14 + 16);
    BOOL v16 = v15 >= v13;
    unsigned int v17 = v15 - v13;
    if (!v16) {
      unsigned int v17 = 0;
    }
    *(_DWORD *)(v14 + 16) = v17;
    ++*(_DWORD *)(v14 + 8);
    v5->var2 = a4;
  }

  else
  {
    unint64_t v10 = (CSStore2::VM *)v19;
    bzero(v19, 0x800uLL);
    if (a4 >= 0x801 && (unint64_t v10 = (CSStore2::VM *)CSStore2::VM::Allocate(a4)) == 0LL
      || (CSStore2::VM::Copy((NSUInteger)v10, (NSUInteger)v5->var3, var2),
          unsigned int v11 = 4 * *(_DWORD *)v5,
          CSStore2::Store::freeUnit(this, a2, v5),
          (Unit = CSStore2::Store::allocateUnit((CSStore2::Store *)this, a2, (int)a4, v11)) == 0LL))
    {
      abort();
    }

    uint64_t v5 = Unit;
    CSStore2::VM::Copy((NSUInteger)Unit->var3, (NSUInteger)v10, var2);
    if (v10 != (CSStore2::VM *)v19) {
      CSStore2::VM::Deallocate(v10, a4);
    }
  }

  return v5;
}

Unit *CSStore2::Store::freeUnit(CSStore2 **this, CSStore2::Table *a2, Unit *a3)
{
  unsigned int var2 = a3->var2;
  CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
  if (var2 + 11 >= 4) {
    unsigned int v7 = (var2 + 11) & 0xFFFFFFFC;
  }
  else {
    unsigned int v7 = 4;
  }
  uint64_t v8 = *((void *)*this + 1);
  unsigned int v9 = *(_DWORD *)(v8 + 16);
  BOOL v10 = v9 >= v7;
  unsigned int v11 = v9 - v7;
  if (!v10) {
    unsigned int v11 = 0;
  }
  *(_DWORD *)(v8 + 16) = v11;
  ++*(_DWORD *)(v8 + 8);
  int v12 = *(_DWORD *)a3;
  uint64_t result = CSStore2::Store::setUnitAddress(this, a2, 4 * v12, 0LL);
  uint64_t v14 = *this;
  if (*this) {
    uint64_t v14 = (CSStore2 *)*((void *)v14 + 1);
  }
  return result;
}

void sub_183E11F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E12028(_Unwind_Exception *exception_object)
{
}

void sub_183E120F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E129D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *a29)
{
  std::default_delete<CSStore2::Store>::operator()[abi:nn180100](v33);
  _Unwind_Resume(a1);
}

void sub_183E12BD0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183E12CC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_183E1312C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id a21)
{
  _Block_object_dispose(&a16, 8);
  std::default_delete<CSStore2::Store>::operator()[abi:nn180100](v21);
  _Unwind_Resume(a1);
}

void sub_183E1322C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E133F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  unsigned int v13 = v12;

  _Unwind_Resume(a1);
}

void sub_183E136CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E13914( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

uint64_t ___ZN8CSStore2L15IsAppleInternalEv_block_invoke_128()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  CSStore2::IsAppleInternal(void)::uint64_t result = result;
  return result;
}

void sub_183E139C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStoreGetXPCClass()
{
  return objc_opt_class();
}

_CSStore *CSStoreCreateMutable(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x186E27B50]();
  id v7 = 0LL;
  uint64_t v3 = -[_CSStore initWithError:](objc_alloc(&OBJC_CLASS____CSStore), "initWithError:", &v7);
  id v4 = v7;
  uint64_t v5 = v4;
  if (a1 && !v3) {
    *a1 = v4;
  }

  objc_autoreleasePoolPop(v2);
  return v3;
}

uint64_t CSStoreCreateMutableCopy(void *a1, void *a2)
{
  id v4 = (void *)MEMORY[0x186E27B50]();
  id v9 = 0LL;
  uint64_t v5 = [a1 mutableCopyWithZone:0 error:&v9];
  id v6 = v9;
  id v7 = v6;
  if (a2 && !v5) {
    *a2 = v6;
  }

  objc_autoreleasePoolPop(v4);
  return v5;
}

uint64_t _CSStoreCommit(void *a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v6 = (void *)MEMORY[0x186E27B50]();
  if (performMutatingAssertions)
  {
    uint64_t v7 = a1[43];
    if (v7) {
      (***(void (****)(void))(v7 + 8))(*(void *)(v7 + 8));
    }
  }

  if (performConstantAssertions)
  {
    uint64_t v8 = a2[43];
    if (v8) {
      (*(void (**)(void))(**(void **)(v8 + 8) + 8LL))(*(void *)(v8 + 8));
    }
  }

  if (a1[39] != a2[39])
  {
    unsigned int v15 = (void *)MEMORY[0x189607870];
    v32[0] = *MEMORY[0x189607490];
    v32[1] = @"Line";
    v33[0] = @"paramErr";
    v33[1] = &unk_189D698C8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v33 forKeys:v32 count:2];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v15 errorWithDomain:*MEMORY[0x189607670] code:-50 userInfo:v16];
LABEL_15:
    uint64_t v20 = (void *)v17;

    id v21 = v20;
    id v22 = v21;
LABEL_16:
    id v23 = v22;
    uint64_t v24 = 0LL;
    goto LABEL_17;
  }

  uint64_t v9 = a2[40];
  if ((v9 & 0xFF00000000LL) == 0)
  {
    uint64_t v18 = (void *)MEMORY[0x189607870];
    v34[0] = *MEMORY[0x189607490];
    v34[1] = @"Line";
    v35[0] = @"paramErr";
    v35[1] = &unk_189D698B0;
    [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:v34 count:2];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v18 errorWithDomain:*MEMORY[0x189607670] code:-50 userInfo:v16];
    goto LABEL_15;
  }

  uint64_t v11 = a1[1];
  BOOL v10 = (CSStore2::Store *)(a1 + 1);
  if (*(_DWORD *)(*(void *)(v11 + 8) + 8LL) != (_DWORD)v9)
  {
    int v19 = (void *)MEMORY[0x189607870];
    uint64_t v36 = *MEMORY[0x189607490];
    BOOL v37 = @"Line";
    unint64_t v38 = @"kCSStoreConflictErr";
    int v39 = &unk_189D69898;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v38 forKeys:&v36 count:2];
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v19 errorWithDomain:*MEMORY[0x189607670] code:-9487 userInfo:v16];
    goto LABEL_15;
  }

  uint64_t v12 = a2[1];
  if (v12)
  {
    uint64_t v13 = *(unsigned int *)(v12 + 16);
    uint64_t v14 = *(CSStore2::VM **)(v12 + 8);
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
  }

  Copy = (void *)CSStore2::VM::AllocateCopy(v14, (const void *)v13, (CSStore2::VM *)v13);
  if (!Copy)
  {
    unint64_t v30 = (void *)MEMORY[0x189607870];
    uint64_t v36 = *MEMORY[0x189607490];
    BOOL v37 = @"Line";
    unint64_t v38 = @"kCSStoreAllocFailedErr";
    int v39 = &unk_189D698E0;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v38 forKeys:&v36 count:2];
    unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 errorWithDomain:*MEMORY[0x189607670] code:-9493 userInfo:v31];
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }

  CSStore2::Store::setBytesNoCopy(v10, Copy, v13);
  id v23 = 0LL;
  uint64_t v24 = 1LL;
LABEL_17:

  id v25 = v23;
  uint64_t v26 = v25;
  if (a3) {
    char v27 = v24;
  }
  else {
    char v27 = 1;
  }
  if ((v27 & 1) == 0) {
    *a3 = v25;
  }

  objc_autoreleasePoolPop(v6);
  return v24;
}

void sub_183E13E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_CSStore *_CSStoreCreateWithURL(uint64_t a1, void *a2)
{
  id v4 = (void *)MEMORY[0x186E27B50]();
  id v9 = 0LL;
  uint64_t v5 = -[_CSStore initWithContentsOfURL:error:]( objc_alloc(&OBJC_CLASS____CSStore),  "initWithContentsOfURL:error:",  a1,  &v9);
  id v6 = v9;
  uint64_t v7 = v6;
  if (a2 && !v5) {
    *a2 = v6;
  }

  objc_autoreleasePoolPop(v4);
  return v5;
}

uint64_t _CSStoreWriteToURL(uint64_t a1, void *a2, void *a3, CSStore2::Store *a4, void *a5)
{
  uint64_t v83 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x186E27B50]();
  if (performConstantAssertions)
  {
    uint64_t v10 = *(void *)(a1 + 344);
    if (v10) {
      (*(void (**)(void))(**(void **)(v10 + 8) + 8LL))(*(void *)(v10 + 8));
    }
  }

  id v11 = a2;
  id v75 = a3;
  if (!v11 || ![v11 isFileURL])
  {
    uint64_t v20 = (void *)MEMORY[0x189607870];
    *(void *)&__int128 v78 = *MEMORY[0x189607490];
    *((void *)&v78 + 1) = @"Line";
    *(void *)buf = @"paramErr";
    *(void *)&buf[8] = &unk_189D69880;
    [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:&v78 count:2];
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    [v20 errorWithDomain:*MEMORY[0x189607670] code:-50 userInfo:v21];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:

    uint64_t v57 = v22;
    uint64_t v58 = 0LL;
    id v59 = v57;
    goto LABEL_48;
  }

  id v70 = v11;
  id v71 = v70;
  if ((a4 & 2) != 0)
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x189607A50]) initWithURL:v70 resolvingAgainstBaseURL:1];
    [v12 path];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = v13;
    if (v13)
    {
      [v13 pathExtension];
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        uint64_t v16 = [v14 stringByDeletingPathExtension];

        uint64_t v14 = (void *)v16;
      }

      objc_msgSend(v14, "stringByAppendingFormat:", @"(%llx~)", arc4random());
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        uint64_t v18 = [v17 stringByAppendingPathExtension:v15];

        int v19 = (void *)v18;
      }

      else
      {
        int v19 = v17;
      }

      [v12 setPath:v19];
    }

    [v12 URL];
    id v71 = (id)objc_claimAutoreleasedReturnValue();

    CSStore2::GetLog(v23);
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = v71;
      _os_log_impl(&dword_183DFE000, v24, OS_LOG_TYPE_INFO, "Writing to temporary CSStore file %{private}@", buf, 0xCu);
    }
  }

  id v25 = (void *)[v75 mutableCopy];
  uint64_t v26 = v25;
  if (v25)
  {
    id v72 = v25;
  }

  else
  {
    [MEMORY[0x189603FC8] dictionary];
    id v72 = (id)objc_claimAutoreleasedReturnValue();
  }

  [v72 objectForKeyedSubscript:*MEMORY[0x189603C10]];
  char v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    *(_WORD *)buf = 0;
    if (CFFileSecurityGetMode((CFFileSecurityRef)v27, (mode_t *)buf)) {
      unsigned __int16 v28 = *(_WORD *)buf;
    }
    else {
      unsigned __int16 v28 = 384;
    }
  }

  else
  {
    unsigned __int16 v28 = 384;
  }

  id v29 = v72;
  uint64_t v30 = *MEMORY[0x189603BD0];
  id v73 = v29;
  [v29 objectForKeyedSubscript:*MEMORY[0x189603BD0]];
  unsigned int v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    uint64_t v32 = *MEMORY[0x189603BB8];
    *(void *)&__int128 v78 = *MEMORY[0x189603BD8];
    *((void *)&v78 + 1) = v32;
    *(void *)buf = &unk_189D697F0;
    *(void *)&buf[8] = &unk_189D69808;
    uint64_t v33 = *MEMORY[0x189603BC8];
    uint64_t v79 = *MEMORY[0x189603BC0];
    uint64_t v80 = v33;
    *(void *)&buf[16] = &unk_189D69820;
    uint8x8_t v82 = (CSStore2 *)&unk_189D69838;
    [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:&v78 count:4];
    id v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 objectForKeyedSubscript:v31];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    int v36 = [v35 intValue];

    [v73 removeObjectForKey:v30];
  }

  else
  {
    int v36 = -1;
  }

  id v21 = v71;
  int v37 = open_dprotected_np((const char *)[v21 fileSystemRepresentation], 2562, v36, 0, v28);
  int v38 = v37;
  if (v37 < 0)
  {
    int v46 = (void *)MEMORY[0x189607870];
    uint64_t v47 = *__error();
    *(void *)&__int128 v78 = *MEMORY[0x189607490];
    *((void *)&v78 + 1) = @"Line";
    *(void *)buf = @"errno";
    *(void *)&buf[8] = &unk_189D69868;
    [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:&v78 count:2];
    unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 errorWithDomain:*MEMORY[0x189607688] code:v47 userInfo:v48];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();

    CSStore2::GetLog(v49);
    id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)unint64_t v77 = 138543362;
      *(void *)&v77[4] = v22;
      _os_log_error_impl( &dword_183DFE000,  v50,  OS_LOG_TYPE_ERROR,  "Failed to open file descriptor for writing store file: %{public}@",  v77,  0xCu);
    }

    goto LABEL_46;
  }

  int v39 = fdopen(v37, "w+");
  if (!v39)
  {
    id v51 = (void *)MEMORY[0x189607870];
    uint64_t v52 = *__error();
    *(void *)&__int128 v78 = *MEMORY[0x189607490];
    *((void *)&v78 + 1) = @"Line";
    *(void *)buf = @"errno";
    *(void *)&buf[8] = &unk_189D69850;
    [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:&v78 count:2];
    __int16 v53 = (void *)objc_claimAutoreleasedReturnValue();
    [v51 errorWithDomain:*MEMORY[0x189607688] code:v52 userInfo:v53];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();

    CSStore2::GetLog(v54);
    id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)unint64_t v77 = 138543362;
      *(void *)&v77[4] = v22;
      _os_log_error_impl( &dword_183DFE000,  v55,  OS_LOG_TYPE_ERROR,  "Failed to create file handle from file descriptor for writing store file: %{public}@",  v77,  0xCu);
    }

    close(v38);
    goto LABEL_46;
  }

  *(void *)buf = v39;
  *(_WORD *)&buf[8] = 1;
  *(void *)unint64_t v77 = 0LL;
  char v40 = CSStore2::GarbageCollection::Collect((CSStore2::GarbageCollection *)(a1 + 8), (FILE **)buf, a4, v77);
  uint64_t v41 = (CSStore2 *)*(id *)v77;
  id v22 = v41;
  if ((v40 & 1) == 0)
  {
    CSStore2::GetLog(v41);
    unsigned int v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v7_Block_object_dispose(va, 8) = 138543362;
      *(void *)((char *)&v78 + 4) = v22;
      _os_log_error_impl( &dword_183DFE000,  v56,  OS_LOG_TYPE_ERROR,  "Failed to collect-and-write store file: %{public}@",  (uint8_t *)&v78,  0xCu);
    }

    unlink((const char *)[v21 fileSystemRepresentation]);
    CSStore2::Writer::~Writer((std::string::size_type *)buf);
LABEL_46:

    goto LABEL_47;
  }

  CSStore2::Writer::~Writer((std::string::size_type *)buf);
  if (v75)
  {
    *(void *)&__int128 v78 = 0LL;
    char v42 = [v21 setResourceValues:v73 error:&v78];
    uint64_t v43 = (CSStore2 *)(id)v78;
    uint64_t v44 = v43;
    if ((v42 & 1) == 0)
    {
      CSStore2::GetLog(v43);
      int v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        [v70 path];
        unint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478339;
        *(void *)&uint8_t buf[4] = v69;
        *(_WORD *)&_BYTE buf[12] = 2114;
        *(void *)&buf[14] = v75;
        *(_WORD *)&buf[22] = 2114;
        uint8x8_t v82 = v44;
        _os_log_error_impl( &dword_183DFE000,  v45,  OS_LOG_TYPE_ERROR,  "Failed to set resource values at %{private}@ to %{public}@ (non-fatal error): %{public}@",  buf,  0x20u);
      }
    }
  }

  else
  {
    uint64_t v44 = 0LL;
  }

  if ((a4 & 2) != 0)
  {
    [MEMORY[0x1896078A8] defaultManager];
    id v64 = (void *)objc_claimAutoreleasedReturnValue();
    id v76 = v22;
    int v65 = [v64 replaceItemAtURL:v70 withItemAtURL:v21 backupItemName:0 options:0 resultingItemURL:0 error:&v76];
    id v59 = (CSStore2 *)v76;

    CSStore2::GetLog(v66);
    unint64_t v67 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v68 = v67;
    if (v65)
    {
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138478083;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&_BYTE buf[12] = 2113;
        *(void *)&buf[14] = v70;
        _os_log_impl( &dword_183DFE000,  v68,  OS_LOG_TYPE_INFO,  "Moved temporary CSStore file %{private}@ to %{private}@",  buf,  0x16u);
      }

      goto LABEL_61;
    }

    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478339;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&_BYTE buf[12] = 2113;
      *(void *)&buf[14] = v70;
      *(_WORD *)&buf[22] = 2112;
      uint8x8_t v82 = v59;
      _os_log_error_impl( &dword_183DFE000,  v68,  OS_LOG_TYPE_ERROR,  "Failed atomic move of temporary CSStore file %{private}@ to %{private}@: %@",  buf,  0x20u);
    }

    id v22 = v59;
    goto LABEL_46;
  }

  id v59 = (CSStore2 *)v22;
LABEL_61:

  uint64_t v57 = 0LL;
  uint64_t v58 = 1LL;
LABEL_48:

  BOOL v60 = v57;
  id v61 = v60;
  if (a5) {
    char v62 = v58;
  }
  else {
    char v62 = 1;
  }
  if ((v62 & 1) == 0) {
    *a5 = v60;
  }

  objc_autoreleasePoolPop(context);
  return v58;
}

void sub_183E14838( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

id _CSStoreCreateByReadingFromFileHandle(FILE *a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = (void *)MEMORY[0x186E27B50]();
  id v7 = objc_alloc_init(MEMORY[0x189603FB8]);
  while (!feof(a1) && !ferror(a1))
  {
    int64_t v8 = fread(__ptr, 1uLL, 0x400uLL, a1);
    if (v8 >= 1) {
      [v7 appendBytes:__ptr length:v8];
    }
  }

  if (ferror(a1))
  {
    id v9 = (void *)MEMORY[0x189607870];
    v22[0] = *MEMORY[0x189607490];
    v22[1] = @"Line";
    v23[0] = @"EIO";
    v23[1] = &unk_189D699E8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:v22 count:2];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 errorWithDomain:*MEMORY[0x189607688] code:5 userInfo:v10];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  else if ((unint64_t)[v7 length] >> 32)
  {
    uint64_t v12 = (void *)MEMORY[0x189607870];
    v20[0] = *MEMORY[0x189607490];
    v20[1] = @"Line";
    v21[0] = @"ERANGE";
    v21[1] = &unk_189D69A00;
    [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:v20 count:2];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 errorWithDomain:*MEMORY[0x189607688] code:34 userInfo:v13];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v14 = v7;
    id v18 = 0LL;
    CSStore2::Store::CreateWithBytes( &v19,  (Bytef *)[v14 bytes],  (void *)objc_msgSend(v14, "length"),  &v18);
    id v11 = v18;
    unsigned int v15 = v19;
    if (v19)
    {
      id v16 = -[_CSStore initByMovingStore:](objc_alloc(&OBJC_CLASS____CSStore), "initByMovingStore:", v19);

      operator delete(v15);
      if (!a3) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }
  }

  id v16 = 0LL;
  if (!a3) {
    goto LABEL_16;
  }
LABEL_14:
  if (!v16) {
    *a3 = v11;
  }
LABEL_16:

  objc_autoreleasePoolPop(v6);
  if (a2) {
    fclose(a1);
  }
  return v16;
}

void sub_183E14C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _CSStoreCreateWithXPCRepresentation(void *a1, void *a2)
{
  id v4 = (void *)MEMORY[0x186E27B50]();
  id v9 = 0LL;
  CSStore2::Store::CreateWithXPCObject(&v10, a1, &v9);
  id v5 = v9;
  id v6 = v10;
  if (v10)
  {
    id v7 = -[_CSStore initByMovingStore:](objc_alloc(&OBJC_CLASS____CSStore), "initByMovingStore:", v10);

    operator delete(v6);
    if (!a2) {
      goto LABEL_7;
    }
  }

  else
  {
    id v7 = 0LL;
    if (!a2) {
      goto LABEL_7;
    }
  }

  if (!v7) {
    *a2 = v5;
  }
LABEL_7:

  objc_autoreleasePoolPop(v4);
  return v7;
}

void sub_183E14D1C(_Unwind_Exception *a1)
{
}

id _CSStoreCreateXPCRepresentation(uint64_t a1, void *a2)
{
  id v4 = (void *)MEMORY[0x186E27B50]();
  if (performConstantAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (*(void (**)(void))(**(void **)(v5 + 8) + 8LL))(*(void *)(v5 + 8));
    }
  }

  id v10 = 0LL;
  CSStore2::Store::encodeAsXPCObject(*(void *)(a1 + 8), &v10);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v10;
  int64_t v8 = v7;
  if (a2 && !v6) {
    *a2 = v7;
  }

  objc_autoreleasePoolPop(v4);
  return v6;
}

void sub_183E14DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStoreGarbageCollect(uint64_t a1, CSStore2::Store *a2)
{
  id v4 = (void *)MEMORY[0x186E27B50]();
  if (performMutatingAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (***(void (****)(void))(v5 + 8))(*(void *)(v5 + 8));
    }
  }

  uint64_t v6 = CSStore2::Store::collectGarbage((CSStore2::Store *)(a1 + 8), a2);
  objc_autoreleasePoolPop(v4);
  return v6;
}

uint64_t CSStoreGetGeneration(uint64_t a1)
{
  if (performConstantAssertions)
  {
    uint64_t v2 = *(void *)(a1 + 344);
    if (v2) {
      (*(void (**)(void))(**(void **)(v2 + 8) + 8LL))(*(void *)(v2 + 8));
    }
  }

  return *(unsigned int *)(*(void *)(*(void *)(a1 + 8) + 8LL) + 8LL);
}

void _CSStoreEnumerateTables(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && v3)
  {
    if (performConstantAssertions)
    {
      uint64_t v5 = *(void *)(a1 + 344);
      if (v5) {
        (*(void (**)(void))(**(void **)(v5 + 8) + 8LL))(*(void *)(v5 + 8));
      }
    }

    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = ___CSStoreEnumerateTables_block_invoke;
    void v6[3] = &unk_189D65D60;
    id v7 = v4;
    CSStore2::Store::enumerateTables((CSStore2 **)(a1 + 8), v6);
  }
}

void sub_183E14F58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStoreGetCatalogTable(uint64_t a1)
{
  if (a1) {
    return 4294929780LL;
  }
  else {
    return 0LL;
  }
}

char *_CSStoreGetArrayTable(uint64_t a1)
{
  if (performConstantAssertions)
  {
    uint64_t v2 = *(void *)(a1 + 344);
    if (v2) {
      (*(void (**)(void))(**(void **)(v2 + 8) + 8LL))(*(void *)(v2 + 8));
    }
  }

  uint64_t result = *(char **)(a1 + 272);
  if (result) {
    return (char *)(4 * *(_DWORD *)result);
  }
  uint64_t result = CSStore2::Store::getTable((CSStore2 **)(a1 + 8), @"<array>");
  if (result) {
    return (char *)(4 * *(_DWORD *)result);
  }
  return result;
}

char *_CSStoreGetStringTable(uint64_t a1)
{
  if (performConstantAssertions)
  {
    uint64_t v2 = *(void *)(a1 + 344);
    if (v2) {
      (*(void (**)(void))(**(void **)(v2 + 8) + 8LL))(*(void *)(v2 + 8));
    }
  }

  uint64_t result = *(char **)(a1 + 280);
  if (result) {
    return (char *)(4 * *(_DWORD *)result);
  }
  uint64_t result = CSStore2::Store::getTable((CSStore2 **)(a1 + 8), @"<string>");
  if (result) {
    return (char *)(4 * *(_DWORD *)result);
  }
  return result;
}

char *_CSStoreGetDictionaryTable(uint64_t a1)
{
  if (performConstantAssertions)
  {
    uint64_t v2 = *(void *)(a1 + 344);
    if (v2) {
      (*(void (**)(void))(**(void **)(v2 + 8) + 8LL))(*(void *)(v2 + 8));
    }
  }

  uint64_t result = *(char **)(a1 + 288);
  if (result) {
    return (char *)(4 * *(_DWORD *)result);
  }
  uint64_t result = CSStore2::Store::getTable((CSStore2 **)(a1 + 8), @"<dictionary>");
  if (result) {
    return (char *)(4 * *(_DWORD *)result);
  }
  return result;
}

NSString *_CSStoreGetTableWithName(uint64_t a1, NSString *a2)
{
  id v4 = (void *)MEMORY[0x186E27B50]();
  if (performConstantAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (*(void (**)(void))(**(void **)(v5 + 8) + 8LL))(*(void *)(v5 + 8));
    }
  }

  if (a2)
  {
    Table = CSStore2::Store::getTable((CSStore2 **)(a1 + 8), a2);
    if (Table) {
      a2 = (NSString *)(4 * *(_DWORD *)Table);
    }
    else {
      a2 = 0LL;
    }
  }

  objc_autoreleasePoolPop(v4);
  return a2;
}

CFStringRef _CSStoreCopyTableName(uint64_t a1, unsigned int a2)
{
  id v4 = (void *)MEMORY[0x186E27B50]();
  if (performConstantAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (*(void (**)(void))(**(void **)(v5 + 8) + 8LL))(*(void *)(v5 + 8));
    }
  }

  if (a2 && (Table = CSStore2::Store::getTable((CSStore2::Store *)(a1 + 8), a2)) != 0LL)
  {
    id v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    int64_t v8 = (id)CSStore2::Table::copyCFName((CSStore2::Table *)Table);
    CFStringRef Copy = CFStringCreateCopy(v7, v8);
  }

  else
  {
    CFStringRef Copy = 0LL;
  }

  objc_autoreleasePoolPop(v4);
  return Copy;
}

uint64_t _CSStoreAddTable(uint64_t a1, void *a2, int a3, void *a4)
{
  v31[2] = *MEMORY[0x1895F89C0];
  int64_t v8 = (void *)MEMORY[0x186E27B50]();
  if (performMutatingAssertions)
  {
    uint64_t v9 = *(void *)(a1 + 344);
    if (v9) {
      (***(void (****)(void))(v9 + 8))(*(void *)(v9 + 8));
    }
  }

  if (a2)
  {
    id v10 = (CSStore2::Store *)(a1 + 8);
    id v11 = a2;
    if (CSStore2::Store::getTable((CSStore2 **)v10, v11))
    {
      uint64_t v12 = (void *)MEMORY[0x189607870];
      v30[0] = *MEMORY[0x189607490];
      v30[1] = @"Line";
      v31[0] = @"kCSStoreNameAlreadyInUseErr";
      v31[1] = &unk_189D69A18;
      [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:v30 count:2];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 errorWithDomain:*MEMORY[0x189607670] code:-9494 userInfo:v13];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      Table = CSStore2::Store::allocateTable(v10, v11, a3, (NSString *)1);
      if (Table)
      {
        id v14 = 0LL;
        uint64_t v16 = (4 * *(_DWORD *)Table);
        goto LABEL_9;
      }

      BOOL IsNameAllowed = CSStore2::Table::IsNameAllowed((CSStore2::Table *)v11, (NSString *)1);
      uint64_t v20 = (void *)MEMORY[0x189607870];
      uint64_t v21 = *MEMORY[0x189607670];
      if (IsNameAllowed)
      {
        v28[0] = *MEMORY[0x189607490];
        v28[1] = @"Line";
        v29[0] = @"kCSStoreAllocFailedErr";
        v29[1] = &unk_189D69A30;
        [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:v28 count:2];
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 errorWithDomain:v21 code:-9493 userInfo:v22];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v26[0] = *MEMORY[0x189607490];
        v26[1] = @"Line";
        v27[0] = @"kCSStoreNameInvalidErr";
        v27[1] = &unk_189D69A48;
        [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:v26 count:2];
        id v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 errorWithDomain:v21 code:-9490 userInfo:v23];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  else
  {
    unsigned int v15 = (void *)MEMORY[0x189607870];
    v24[0] = *MEMORY[0x189607490];
    v24[1] = @"Line";
    v25[0] = @"paramErr";
    v25[1] = &unk_189D69A60;
    [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:v24 count:2];
    id v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    [v15 errorWithDomain:*MEMORY[0x189607670] code:-50 userInfo:v11];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v16 = 0LL;
LABEL_9:

  objc_autoreleasePoolPop(v8);
  if (a4 && !(_DWORD)v16) {
    *a4 = v14;
  }

  return v16;
}

void sub_183E15554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _CSStoreRemoveTable(uint64_t a1, unsigned int a2)
{
  id v4 = (void *)MEMORY[0x186E27B50]();
  if (performMutatingAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (***(void (****)(void))(v5 + 8))(*(void *)(v5 + 8));
    }
  }

  if (a2 != -37516)
  {
    if (a2)
    {
      uint64_t v6 = (CSStore2::Store *)(a1 + 8);
      Table = CSStore2::Store::getTable(v6, a2);
      if (Table)
      {
        if (Table[8] != 60)
        {
          uint64_t v8 = *(void *)v6;
          if (*(void *)v6) {
            uint64_t v8 = *(void *)(v8 + 8);
          }
          CSStore2::Store::freeUnit((CSStore2 **)v6, (CSStore2::Table *)(v8 + 20), (Unit *)Table);
        }
      }
    }
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t CSStoreGetUnitCount(uint64_t a1, unsigned int a2)
{
  id v4 = (void *)MEMORY[0x186E27B50]();
  if (performConstantAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (*(void (**)(void))(**(void **)(v5 + 8) + 8LL))(*(void *)(v5 + 8));
    }
  }

  uint64_t v6 = (CSStore2::Store *)(a1 + 8);
  Table = CSStore2::Store::getTable(v6, a2);
  if (Table) {
    uint64_t UnitCount = CSStore2::Store::getUnitCount((CSStore2 **)v6, (const CSStore2::Table *)Table);
  }
  else {
    uint64_t UnitCount = 0LL;
  }
  objc_autoreleasePoolPop(v4);
  return UnitCount;
}

Unit *CSStoreAllocUnit(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (performMutatingAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (***(void (****)(void))(v6 + 8))(*(void *)(v6 + 8));
    }
  }

  id v7 = (CSStore2::Store *)(a1 + 8);
  Table = CSStore2::Store::getTable(v7, a2);
  if (Table)
  {
    uint64_t result = CSStore2::Store::allocateUnit(v7, (CSStore2::Table *)Table, a3, 0);
    if (result) {
      return (Unit *)(4 * *(_DWORD *)result);
    }
  }

  else
  {
    CSStore2::GetLog(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 136446210;
      uint64_t v12 = "CSStoreUnitID CSStoreAllocUnit(CSMutableStoreRef _Nonnull, CSStoreTableID, _CSStoreSize)";
      _os_log_impl(&dword_183DFE000, v10, OS_LOG_TYPE_INFO, "%{public}s: no table ID supplied", (uint8_t *)&v11, 0xCu);
    }

    return 0LL;
  }

  return result;
}

Unit *CSStoreAllocUnitWithData(uint64_t a1, unsigned int a2, const void *a3, const void *a4)
{
  uint64_t v8 = CSStoreAllocUnit(a1, a2, (int)a3);
  uint64_t v9 = v8;
  if (a4 && (_DWORD)v8) {
    _CSStoreWriteToUnit(a1, a2, v8, 0, a3, a4, 0LL);
  }
  return v9;
}

uint64_t _CSStoreWriteToUnit( uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, const void *a5, const void *a6, void *a7)
{
  v53[2] = *MEMORY[0x1895F89C0];
  if (performMutatingAssertions)
  {
    uint64_t v14 = *(void *)(a1 + 344);
    if (v14) {
      (***(void (****)(void))(v14 + 8))(*(void *)(v14 + 8));
    }
  }

  if (!a2)
  {
    uint64_t v32 = (void *)MEMORY[0x189607870];
    v46[0] = *MEMORY[0x189607490];
    v46[1] = @"Line";
    v47[0] = @"paramErr";
    v47[1] = &unk_189D69AA8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v47 forKeys:v46 count:2];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 errorWithDomain:*MEMORY[0x189607670] code:-50 userInfo:v33];
    id v34 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_40;
  }

  unsigned int v15 = (CSStore2::Store *)(a1 + 8);
  Table = CSStore2::Store::getTable(v15, a2);
  if (!Table)
  {
    uint64_t v35 = (void *)MEMORY[0x189607870];
    v48[0] = *MEMORY[0x189607490];
    v48[1] = @"Line";
    v49[0] = @"kCSStoreNotFoundErr";
    v49[1] = &unk_189D69A90;
    [MEMORY[0x189603F68] dictionaryWithObjects:v49 forKeys:v48 count:2];
    int v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 errorWithDomain:*MEMORY[0x189607670] code:-9499 userInfo:v36];
    id v34 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_40;
  }

  Unit = CSStore2::Store::getUnit((CSStore2 **)v15, (const CSStore2::Table *)Table, a3);
  if (!Unit)
  {
    uint64_t v43 = (void *)MEMORY[0x189607870];
    v50[0] = *MEMORY[0x189607490];
    v50[1] = @"Line";
    v51[0] = @"kCSStoreNotFoundErr";
    v51[1] = &unk_189D69A78;
    [MEMORY[0x189603F68] dictionaryWithObjects:v51 forKeys:v50 count:2];
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v43 errorWithDomain:*MEMORY[0x189607670] code:-9499 userInfo:v44];
    id v34 = (id)objc_claimAutoreleasedReturnValue();

LABEL_40:
    uint64_t v31 = 0LL;
    if (!a7) {
      goto LABEL_43;
    }
    goto LABEL_41;
  }

  unsigned int v18 = *(_DWORD *)Unit & 0xC0000000;
  BOOL v19 = v18 == 0x40000000;
  if (v18 == 0x40000000) {
    uint64_t v20 = Unit + 80;
  }
  else {
    uint64_t v20 = Unit + 8;
  }
  if (v19) {
    unsigned int v21 = *((_DWORD *)Unit + 1) - 72;
  }
  else {
    unsigned int v21 = *((_DWORD *)Unit + 1);
  }
  unint64_t v22 = *(void *)(*(void *)v15 + 8LL);
  unsigned int v23 = *(_DWORD *)(v22 + 12);
  int v24 = (_DWORD)v20 - v22;
  BOOL v25 = (unint64_t)v20 < v22;
  BOOL v26 = v24 + 1 > v23 || v24 == -1;
  if (v25 || v26) {
    int v24 = -1;
  }
  BOOL v27 = __CFADD__(v24, v21);
  unsigned int v28 = v24 + v21;
  if (v27 || v28 > v23)
  {
LABEL_30:
    BOOL v37 = v23 <= a4;
    int v38 = (void *)MEMORY[0x189607870];
    v52[0] = *MEMORY[0x189607490];
    v52[1] = @"Line";
    v53[0] = @"code";
    v53[1] = &unk_189D698F8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v53 forKeys:v52 count:2];
    int v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22) {
      int v40 = v37;
    }
    else {
      int v40 = 1;
    }
    if (v40) {
      uint64_t v41 = -9492LL;
    }
    else {
      uint64_t v41 = -9497LL;
    }
    [v38 errorWithDomain:*MEMORY[0x189607670] code:v41 userInfo:v39];
    char v42 = (void *)objc_claimAutoreleasedReturnValue();

    id v30 = v42;
    uint64_t v31 = 0LL;
  }

  else
  {
    id v29 = &v20[a4];
    if (memcmp(v29, a6, a5))
    {
      CSStore2::VM::Copy((NSUInteger)v29, (NSUInteger)a6, a5);
      unint64_t v22 = *(void *)(*(void *)v15 + 8LL);
    }

    id v30 = 0LL;
    ++*(_DWORD *)(v22 + 8);
    uint64_t v31 = 1LL;
  }

  id v34 = v30;
  if (a7)
  {
LABEL_41:
    if ((v31 & 1) == 0) {
      *a7 = v34;
    }
  }

void sub_183E15C4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *CSStoreReallocUnit(uint64_t a1, unsigned int a2, unsigned int a3, CSStore2::VM *a4)
{
  if (!(_DWORD)a4) {
    return 0LL;
  }
  if (performMutatingAssertions)
  {
    uint64_t v8 = *(void *)(a1 + 344);
    if (v8) {
      (***(void (****)(void))(v8 + 8))(*(void *)(v8 + 8));
    }
  }

  uint64_t v9 = (CSStore2::Store *)(a1 + 8);
  uint64_t result = CSStore2::Store::getTable(v9, a2);
  if (result)
  {
    int v11 = (CSStore2::Table *)result;
    uint64_t result = CSStore2::Store::getUnit((CSStore2 **)v9, (const CSStore2::Table *)result, a3);
    if (result) {
      return (char *)(4
    }
                                  * *(_DWORD *)CSStore2::Store::reallocateUnit((CSStore2 **)v9, v11, (Unit *)result, a4));
  }

  return result;
}

char *CSStoreFreeUnit(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (performMutatingAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (***(void (****)(void))(v6 + 8))(*(void *)(v6 + 8));
    }
  }

  id v7 = (CSStore2::Store *)(a1 + 8);
  uint64_t result = CSStore2::Store::getTable(v7, a2);
  if (result)
  {
    uint64_t v9 = (CSStore2::Table *)result;
    uint64_t result = CSStore2::Store::getUnit((CSStore2 **)v7, (const CSStore2::Table *)result, a3);
    if (result) {
      return (char *)CSStore2::Store::freeUnit((CSStore2 **)v7, v9, (Unit *)result);
    }
  }

  return result;
}

char *CSStoreGetHeader(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  if (performConstantAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8LL))(*(void *)(v6 + 8));
    }
  }

  uint64_t result = CSStore2::Store::getTable((CSStore2::Store *)(a1 + 8), a2);
  if (result)
  {
    uint64_t v8 = (uint64_t)result;
    result += 80;
    if (a3) {
      *a3 = *(_DWORD *)(v8 + 4) - 72;
    }
  }

  return result;
}

uint64_t _CSStoreWriteToHeader( uint64_t a1, unsigned int a2, unsigned int a3, const void *a4, const void *a5, void *a6)
{
  if (a1) {
    unsigned int v11 = -37516;
  }
  else {
    unsigned int v11 = 0;
  }
  return _CSStoreWriteToUnit(a1, v11, a2, a3, a4, a5, a6);
}

char *CSStoreGetUnit(uint64_t a1, unsigned int a2, unsigned int a3, _DWORD *a4)
{
  if (!a3) {
    return 0LL;
  }
  if (performConstantAssertions)
  {
    uint64_t v8 = *(void *)(a1 + 344);
    if (v8) {
      (*(void (**)(void))(**(void **)(v8 + 8) + 8LL))(*(void *)(v8 + 8));
    }
  }

  uint64_t v9 = (CSStore2::Store *)(a1 + 8);
  uint64_t result = CSStore2::Store::getTable(v9, a2);
  if (result)
  {
    uint64_t result = CSStore2::Store::getUnit((CSStore2 **)v9, (const CSStore2::Table *)result, a3);
    if (result)
    {
      unsigned int v11 = result;
      result += 8;
      if (a4) {
        *a4 = *((_DWORD *)v11 + 1);
      }
    }
  }

  return result;
}

UInt8 *_CSStoreCreateDataWithUnitNoCopy(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6 = (void *)MEMORY[0x186E27B50]();
  if (performConstantAssertions)
  {
    uint64_t v7 = *(void *)(a1 + 344);
    if (v7) {
      (*(void (**)(void))(**(void **)(v7 + 8) + 8LL))(*(void *)(v7 + 8));
    }
  }

  unsigned int length = 0;
  Unit = CSStoreGetUnit(a1, a2, a3, &length);
  uint64_t v9 = (UInt8 *)Unit;
  if (Unit)
  {
    uint64_t v10 = *(void *)(a1 + 8);
    if (v10)
    {
      uint64_t v11 = *(void *)(v10 + 8);
      int v12 = v11;
    }

    else
    {
      int v12 = 0;
      uint64_t v11 = MEMORY[8];
    }

    unsigned int v13 = (_DWORD)Unit - v12;
    uint64_t v14 = length;
    if (__CFADD__(v13, length) || v13 + length > *(_DWORD *)(v11 + 12))
    {
LABEL_17:
      CFDataRef v21 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v9, v14);
      if (!v21)
      {
        uint64_t v9 = 0LL;
        goto LABEL_20;
      }

      goto LABEL_18;
    }

    uint64_t v15 = v11 + v13;
    uint64_t v16 = (unint64_t *)(a1 + 304);
    do
      uint64_t v17 = __ldaxr(v16);
    while (__stlxr(v17 + 1, v16));
    if (v17 < 15)
    {
      CFDataRef v21 = (CFDataRef)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v15 length:v14];
      if (!v21)
      {
LABEL_16:
        LODWORD(v14) = length;
        goto LABEL_17;
      }
    }

    else
    {
      id v18 = *(id *)(a1 + 8);
      length_4[0] = MEMORY[0x1895F87A8];
      length_4[1] = 3221225472LL;
      length_4[2] = ___ZNK8CSStore25Store9getNSDataEjj_block_invoke;
      length_4[3] = &unk_189D65BF0;
      id v19 = v18;
      id v25 = v19;
      uint64_t v20 = (void *)MEMORY[0x186E27CB8](length_4);
      CFDataRef v21 = (CFDataRef)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:v15 length:v14 deallocator:v20];

      if (!v21) {
        goto LABEL_16;
      }
    }

LABEL_20:
  objc_autoreleasePoolPop(v6);
  return v9;
}

void sub_183E160B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void _CSStoreEnumerateUnits(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  if (performConstantAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8LL))(*(void *)(v6 + 8));
    }
  }

  if (a2)
  {
    if (v5)
    {
      uint64_t v7 = (CSStore2::Store *)(a1 + 8);
      Table = CSStore2::Store::getTable(v7, a2);
      if (Table)
      {
        uint64_t v9 = (unsigned int *)Table;
        v10[0] = MEMORY[0x1895F87A8];
        v10[1] = 3221225472LL;
        v10[2] = ___CSStoreEnumerateUnits_block_invoke;
        v10[3] = &unk_189D65D88;
        id v11 = v5;
        CSStore2::Store::enumerateUnits((CSStore2 **)v7, v9, v10);
      }
    }
  }
}

void sub_183E1619C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStoreSetExpectedAccessContext(void *a1, const char *a2)
{
  return [a1 setAccessContext:a2];
}

void _CSStoreSetExpectedAccessQueue(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3) {
    id v4 = _CSStoreAccessContextCreateWithQueue(v3);
  }
  else {
    id v4 = 0LL;
  }
  [a1 setAccessContext:v4];
}

void sub_183E16270( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

uint64_t _CSStoreSetMutable(void *a1, const char *a2)
{
  return [a1 setReadOnly:(_DWORD)a2 == 0];
}

uint64_t _CSStoreIsMutable(void *a1)
{
  return [a1 isReadOnly] ^ 1;
}

uint64_t _CSStoreSetUnitIdentifierExhaustionHandler(void *a1, const char *a2)
{
  return [a1 setUnitIdentifierExhaustionHandler:a2];
}

uint64_t _CSStoreValidate(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0) {
    id v4 = &__block_literal_global_93_167;
  }
  else {
    id v4 = &__block_literal_global_92;
  }
  if (performConstantAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (*(void (**)(void))(**(void **)(v5 + 8) + 8LL))(*(void *)(v5 + 8));
    }
  }

  uint64_t v6 = (CSStore2 **)(a1 + 8);
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 1;
  uint64_t v20 = 0LL;
  CFDataRef v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 1;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = ___CSStoreValidate_block_invoke_3;
  std::stringbuf::string_type v17[3] = &unk_189D65E10;
  id v18 = v4;
  id v19 = &v20;
  CSStore2::Store::enumerateTables(v6, v17);
  if ((a2 & 2) != 0)
  {
    v13[0] = v7;
    v13[1] = 3221225472LL;
    void v13[2] = ___CSStoreValidate_block_invoke_4;
    void v13[3] = &unk_189D65E38;
    id v14 = v4;
    uint64_t v15 = &v24;
    uint64_t v16 = v6;
    CSStore2::Store::enumerateTables(v6, v13);
    BOOL v8 = *((_BYTE *)v21 + 24) != 0;
    if (!*((_BYTE *)v21 + 24))
    {
      uint64_t v9 = ___CSStoreValidate_block_invoke_2;
      if ((a2 & 1) == 0) {
        uint64_t v9 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))___CSStoreValidate_block_invoke;
      }
      ((void (*)(void *, const char *))v9)(v4, "Ran out of unit identifiers.");
    }

    if (!*((_BYTE *)v25 + 24))
    {
      uint64_t v10 = ___CSStoreValidate_block_invoke_2;
      if ((a2 & 1) == 0) {
        uint64_t v10 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))___CSStoreValidate_block_invoke;
      }
      ((void (*)(void *, const char *))v10)(v4, "Unit identifier cache entry invalid.");
      BOOL v8 = 0;
    }
  }

  else
  {
    BOOL v8 = 1;
  }

  if (*((_BYTE *)v25 + 24)) {
    uint64_t v11 = 1LL;
  }
  else {
    uint64_t v11 = v8;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v11;
}

void sub_183E1648C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, ...)
{
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_183E16554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E16B58( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21, char a22)
{
  _Unwind_Resume(a1);
}

void sub_183E16C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _CSStoreShow(CSStore2::Store *this, int a2, FILE *a3)
{
  if (performConstantAssertions)
  {
    uint64_t v6 = *((void *)this + 43);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8LL))(*(void *)(v6 + 8));
    }
  }

  uint64_t v9 = *((void *)this + 1);
  BOOL v8 = (CSStore2 **)((char *)this + 8);
  uint64_t v7 = v9;
  if (v9)
  {
    uint64_t v7 = *(void *)(v7 + 8);
    uint64_t v10 = v7 + 12;
  }

  else
  {
    uint64_t v10 = 12LL;
  }

  uint64_t v11 = *(unsigned int *)v10;
  unsigned int UnitCount = CSStore2::Store::getUnitCount(v8, (const CSStore2::Table *)(v7 + 20));
  unsigned int v13 = *v8;
  if (*v8) {
    unsigned int v13 = (CSStore2 *)*((void *)v13 + 1);
  }
  fprintf( a3,  "\n ******************************************************************************\n store:       %p\n bytes:       %p\n length:      %llu\n table count: %llu\n",  v8,  v13,  v11,  UnitCount);
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  void v14[2] = ___ZN8CSStore24Show13StoreContentsERKNS_5StoreEbP7__sFILE_block_invoke;
  void v14[3] = &__block_descriptor_49_e47_v24__0r__Table__Unit_b30b2I_0c___48c_QQII_8_B16l;
  v14[4] = a3;
  v14[5] = v8;
  BOOL v15 = a2 != 0;
  CSStore2::Store::enumerateTables(v8, v14);
}

void ___ZN8CSStore24Show13StoreContentsERKNS_5StoreEbP7__sFILE_block_invoke( uint64_t a1, const CSStore2::Store *a2)
{
  uint64_t v4 = fputs("==============================================================================\n", *(FILE **)(a1 + 32));
  uint64_t v5 = (void *)MEMORY[0x186E27B50](v4);
  CSStore2::Show::TableContents(*(CSStore2 ***)(a1 + 40), a2, (const CSStore2::Table *)*(unsigned __int8 *)(a1 + 48));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 string];
  fputs((const char *)[v7 UTF8String], *(FILE **)(a1 + 32));

  objc_autoreleasePoolPop(v5);
}

void sub_183E16DE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSStore2::Show::TableContents(CSStore2 **this, const CSStore2::Store *a2, const CSStore2::Table *a3)
{
  int v3 = (int)a3;
  uint64_t v6 = (void *)MEMORY[0x186E27B50]();
  char v42 = off_189D658F8;
  v43[0] = 0LL;
  __int128 v49 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  id v7 = objc_alloc_init(MEMORY[0x189607928]);
  v43[1] = v7;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  *(void *)&__int128 v49 = 0LL;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  DWORD2(v49) = 1065353216;
  LODWORD(v52) = 1065353216;
  WORD4(v52) = 0;
  *(void *)&__int128 v53 = 0LL;
  WORD4(v53) = 257;
  BYTE10(v53) = 0;
  uint64_t v58 = v43;
  [MEMORY[0x189607968] numberWithUnsignedInt:(4 * *(_DWORD *)a2)];
  BOOL v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v42, @"table ID", v8);

  uint64_t v9 = (__CFString *)CSStore2::Table::copyCFName(a2);
  CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)&v42, @"name", &v9->isa);

  uint64_t v10 = (char *)a2 + 8;
  uint64_t v11 = *this;
  if (*this) {
    unint64_t v12 = *((void *)v11 + 1);
  }
  else {
    unint64_t v12 = 0LL;
  }
  int v13 = -1;
  BOOL v14 = (unint64_t)v10 >= v12;
  unint64_t v15 = (unint64_t)&v10[-v12];
  if (v14 && !HIDWORD(v15))
  {
    else {
      int v13 = v15;
    }
  }

  int v41 = v13;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1895F87A8];
  v40[1] = 3321888768LL;
  v40[2] = ___ZN8CSStore24Show13TableContentsERKNS_5StoreEPKNS_5TableEb_block_invoke;
  v40[3] = &__block_descriptor_48_ea8_32c68_ZTSKZN8CSStore24Show13TableContentsERKNS_5StoreEPKNS_5TableEbEUlvE__e5_v8__0l;
  v40[4] = &v42;
  v40[5] = &v41;
  CSStore2::AttributedStringWriter::withAppliedAttribute( (uint64_t)&v42,  (uint64_t)@"_CSVNum",  (uint64_t)v17,  (uint64_t)v40);

  [MEMORY[0x189607968] numberWithUnsignedInt:*((unsigned int *)a2 + 1)];
  id v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v42, @"length", v18);

  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", CSStore2::Store::getUnitCount(this, a2));
  id v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v42, @"unit count", v19);

  [MEMORY[0x189607968] numberWithUnsignedInt:(*((_DWORD *)a2 + 1) - 72)];
  uint64_t v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v42, @"header length", v20);

  Table = (char *)this[34];
  if (!Table) {
    Table = CSStore2::Store::getTable(this, @"<string>");
  }
  if (Table == (char *)a2)
  {
    CSStore2::String::GetDebugDescriptionOfCache((CSStore2::String *)this, v21);
    char v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v23) {
      CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)&v42, @"StringCache", v23);
    }
  }

  uint64_t v24 = *((unsigned int *)a2 + 19);
  if ((_DWORD)v24 != -1)
  {
    uint64_t v25 = *((void *)*this + 1);
    if (*(_DWORD *)(v25 + 12) > v24)
    {
      id v26 = objc_alloc_init(MEMORY[0x189607940]);
      if (CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::once != -1) {
        dispatch_once( &CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::once,  &__block_literal_global_133);
      }
      char v27 = (unsigned int *)(v25 + v24);
      id v28 = (id)CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::result;
      id v29 = v28;
      id v30 = *this;
      if (*this) {
        unint64_t v31 = *((void *)v30 + 1);
      }
      else {
        unint64_t v31 = 0LL;
      }
      uint64_t v32 = 0xFFFFFFFFLL;
      BOOL v14 = (unint64_t)v27 >= v31;
      unint64_t v33 = (unint64_t)v27 - v31;
      if (v14 && !HIDWORD(v33))
      {
        BOOL v34 = (v33 + 1) > *(_DWORD *)(*((void *)v30 + 1) + 12LL) || (_DWORD)v33 == -1;
        uint64_t v32 = v33;
        if (v34) {
          uint64_t v32 = 0xFFFFFFFFLL;
        }
      }

      [v26 appendFormat:@"%@ @ 0x%llx", v28, v32];

      unint64_t Statistics = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics(v27);
      objc_msgSend( v26,  "appendFormat:",  @" { buckets = %llu, count = %llu }",  HIDWORD(Statistics),  Statistics);
      if (v26) {
        CSStore2::AttributedStringWriter::string( (CSStore2::AttributedStringWriter *)&v42,  @"IdentifierCache",  (NSString *)v26);
      }
    }
  }

  if (v3)
  {
    CSStore2::AttributedStringWriter::separator( (CSStore2::AttributedStringWriter::Impl **)&v42,  (CSStore2::AttributedStringWriter *)0x2B,  0LL);
    if (*this) {
      int v36 = (CSStore2::Show *)*((void *)*this + 1);
    }
    else {
      int v36 = 0LL;
    }
    CSStore2::Show::ShowBytes(v36, (char *)a2, (const void *)(*((_DWORD *)a2 + 1) + 8));
    BOOL v37 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::attributedString((CSStore2::AttributedStringWriter::Impl **)&v42, v37);
  }

  int v38 = (void *)[v7 copy];
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v42);

  objc_autoreleasePoolPop(v6);
  return v38;
}

void sub_183E17278( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

void ___ZN8CSStore24Show13TableContentsERKNS_5StoreEPKNS_5TableEb_block_invoke(uint64_t a1)
{
}

id CSStore2::Show::ShowBytes(CSStore2::Show *this, char *a2, const void *a3)
{
  unsigned int v3 = a3;
  int v5 = (int)this;
  context = (void *)MEMORY[0x186E27B50]();
  id v6 = objc_alloc_init(MEMORY[0x189607928]);
  id v7 = v6;
  unsigned int v36 = 0;
  for (int i = (_DWORD)a2 - v5; v36 < v3; v36 += 16)
  {
    BOOL v8 = (void *)MEMORY[0x186E27B50](v6);
    id v9 = objc_alloc_init(MEMORY[0x189607928]);
    id v19 = off_189D658F8;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v10 = v9;
    *((void *)&v20 + 1) = v10;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    *(void *)&__int128 v26 = 0LL;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    DWORD2(v26) = 1065353216;
    LODWORD(v29) = 1065353216;
    WORD4(v29) = 0;
    *(void *)&__int128 v30 = 0LL;
    WORD4(v3std::string::resize(&v8, (std::string::size_type)this + 1, 0) = 1;
    BYTE10(v3std::string::resize(&v8, (std::string::size_type)this + 1, 0) = 0;
    uint64_t v35 = &v20;
    int v11 = v3 - v36;
    if (v3 - v36 >= 0x10) {
      int v11 = 16;
    }
    int v18 = v11;
    uint64_t v17 = &a2[v36];
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3321888768LL;
    void v16[2] = ___ZN8CSStore24Show9ShowBytesEPKvS2_j_block_invoke;
    v16[3] = &__block_descriptor_72_ea8_32c45_ZTSKZN8CSStore24Show9ShowBytesEPKvS2_jEUlvE__e5_v8__0l;
    v16[4] = &v19;
    v16[5] = &i;
    v16[6] = &v36;
    v16[7] = &v18;
    v16[8] = &v17;
    CSStore2::AttributedStringWriter::withAppliedAttribute( (uint64_t)&v19,  (uint64_t)@"_CSVFixed",  MEMORY[0x189604A88],  (uint64_t)v16);
    objc_msgSend(v7, "appendAttributedString:", v10, context);
    CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v19);

    objc_autoreleasePoolPop(v8);
  }

  unint64_t v12 = (void *)objc_msgSend(v7, "copy", context);

  objc_autoreleasePoolPop(contexta);
  return v12;
}

void sub_183E17534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore24Show9ShowBytesEPKvS2_j_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v33[0] = MEMORY[0x1895F87A8];
  v33[1] = 3321888768LL;
  void v33[2] = ___ZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEv_block_invoke;
  v33[3] = &__block_descriptor_56_ea8_32c58_ZTSKZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvEUlvE__e5_v8__0l;
  __int128 v34 = *(_OWORD *)(a1 + 40);
  uint64_t v35 = v2;
  CSStore2::AttributedStringWriter::withAppliedAttribute( v2,  (uint64_t)@"_CSVFWeight",  (uint64_t)&unk_189D69CA0,  (uint64_t)v33);
  uint64_t v4 = *(void *)(a1 + 32);
  v32[0] = v3;
  v32[1] = 3321888768LL;
  void v32[2] = ___ZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEv_block_invoke_139;
  v32[3] = &__block_descriptor_40_ea8_32c59_ZTSKZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvEUlvE0__e5_v8__0l;
  v32[4] = v4;
  CSStore2::AttributedStringWriter::withAppliedAttribute( v4,  (uint64_t)@"_CSVOutputType",  (uint64_t)&unk_189D69AC0,  (uint64_t)v32);
  __int128 v31 = (NSAttributedString *)objc_alloc_init(MEMORY[0x189607940]);
  for (unint64_t i = 0LL; i != 16; ++i)
  {
    if (i && (i & 3) == 0) {
      -[NSAttributedString appendString:](v31, "appendString:", @" ");
    }
    else {
      -[NSAttributedString appendFormat:]( v31,  "appendFormat:",  @"%02x",  *(unsigned __int8 *)(**(void **)(a1 + 64) + i));
    }
  }

  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter::Impl ***)(a1 + 32), v31);
  CSStore2::AttributedStringWriter::string( *(CSStore2::AttributedStringWriter::Impl ***)(a1 + 32),  (NSAttributedString *)@"    ");
  uint64_t v6 = **(unsigned int **)(a1 + 56);
  if ((_DWORD)v6)
  {
    id v7 = **(char ***)(a1 + 64);
    BOOL v8 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>(v6);
    id v10 = v8;
    uint64_t v11 = 0LL;
    do
    {
      __int16 v12 = *v7++;
      *(_WORD *)&v8[v11] = v12;
      v11 += 2LL;
    }

    while (2 * v6 != v11);
    int v13 = &v8[v11];
    BOOL v14 = &v8[2 * v9];
    BOOL v15 = v13 == v8;
    if (v13 != v8)
    {
      uint64_t v16 = 0LL;
      uint64_t v17 = MEMORY[0x1895F8770];
      do
      {
        unint64_t v18 = *(unsigned __int16 *)&v8[v16];
        if (v18 > 0x7F || (*(_DWORD *)(v17 + 4 * v18 + 60) & 0x40000) == 0) {
          *(_WORD *)&v8[v16] = 183;
        }
        v16 += 2LL;
      }

      while (2 * ((v13 - v8) >> 1) != v16);
    }
  }

  else
  {
    id v10 = 0LL;
    BOOL v14 = 0LL;
    int v13 = 0LL;
    BOOL v15 = 1;
  }

  uint64_t v19 = v13 - v10;
  if ((unint64_t)(v13 - v10) > 0x1F)
  {
    if (v19 == 32) {
      __int128 v27 = v13;
    }
    else {
      __int128 v27 = v10 + 32;
    }
    goto LABEL_38;
  }

  uint64_t v20 = v19 >> 1;
  unint64_t v21 = 16 - (v19 >> 1);
  if (v21 <= (v14 - v13) >> 1)
  {
    __int128 v27 = &v13[2 * v21];
    uint64_t v29 = 32 - 2 * v20;
    do
    {
      *(_WORD *)int v13 = 32;
      v13 += 2;
      v29 -= 2LL;
    }

    while (v29);
LABEL_38:
    __int128 v26 = v10;
    goto LABEL_39;
  }

  unint64_t v22 = v14 - v10;
  uint64_t v23 = 16LL;
  if (v22 > 0x10) {
    uint64_t v23 = v22;
  }
  if (v22 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v24 = v23;
  }
  __int128 v25 = std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>(v24);
  __int128 v26 = (char *)&v25[v20];
  __int128 v27 = (char *)(v25 + 16);
  do
    v25[v20++] = 32;
  while (v20 != 16);
  if (!v15)
  {
    do
    {
      __int16 v28 = *((_WORD *)v13 - 1);
      v13 -= 2;
      *((_WORD *)v26 - 1) = v28;
      v26 -= 2;
    }

    while (v13 != v10);
  }

  if (v10) {
    operator delete(v10);
  }
LABEL_39:
  __int128 v30 = (NSAttributedString *)[objc_alloc(NSString) initWithCharactersNoCopy:v26 length:(v27 - v26) >> 1 freeWhenDone:0];
  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter::Impl ***)(a1 + 32), v30);
  CSStore2::AttributedStringWriter::string( *(CSStore2::AttributedStringWriter::Impl ***)(a1 + 32),  (NSAttributedString *)@"\n");

  if (v26) {
    operator delete(v26);
  }
}

void sub_183E17898( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (v10) {
    operator delete(v10);
  }

  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_ea8_32c45_ZTSKZN8CSStore24Show9ShowBytesEPKvS2_jEUlvE_(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 32);
  __int128 v3 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = v3;
  return result;
}

void ___ZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEv_block_invoke(uint64_t a1)
{
  uint64_t v5 = (**(_DWORD **)(a1 + 40) + **(_DWORD **)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 48);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3321888768LL;
  v4[2] = ___ZZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvENKUlvE_clEv_block_invoke;
  v4[3] = &__block_descriptor_48_ea8_32c71_ZTSKZZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvENKUlvE_clEvEUlvE__e5_v8__0l;
  v4[4] = *(void *)(a1 + 48);
  void v4[5] = &v5;
  CSStore2::AttributedStringWriter::withAppliedAttribute(v2, (uint64_t)@"_CSVNum", (uint64_t)v3, (uint64_t)v4);
}

void sub_183E179A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEv_block_invoke_139(uint64_t a1)
{
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>(uint64_t a1)
{
  if (a1 < 0) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(2 * a1);
}

uint64_t __copy_helper_block_ea8_32c59_ZTSKZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvEUlvE0_( uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

__n128 __copy_helper_block_ea8_32c58_ZTSKZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvEUlvE_( __n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  a1[2] = result;
  return result;
}

void ___ZZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvENKUlvE_clEv_block_invoke(uint64_t a1)
{
}

__n128 __copy_helper_block_ea8_32c71_ZTSKZZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvENKUlvE_clEvEUlvE_( __n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

void ___ZN8CSStore2L10NameOfTypeINS_7HashMapIjjNS_20_IdentifierFunctionsELy1EEEEEP8NSStringv_block_invoke()
{
  std::string::basic_string[abi:nn180100]<0>( &__p,  "NSString *CSStore2::NameOfType() [T = CSStore2::HashMap<unsigned int, unsigned int, CSStore2::_IdentifierFunctions, 1>]_block_invoke");
  uint64_t v0 = CSStore2::_CopyNameOfTypeImpl(&__p);
  uint64_t v1 = (void *)CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::result;
  CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::__n128 result = v0;
}

void sub_183E17ABC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:nn180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    abort();
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

__n128 __copy_helper_block_ea8_32c68_ZTSKZN8CSStore24Show13TableContentsERKNS_5StoreEPKNS_5TableEbEUlvE_( __n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

char *_CSStoreCopyDebugDescriptionOfTable(uint64_t a1, unsigned int a2, int a3)
{
  if (performConstantAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8LL))(*(void *)(v6 + 8));
    }
  }

  uint64_t v7 = (CSStore2::Store *)(a1 + 8);
  __n128 result = CSStore2::Store::getTable(v7, a2);
  if (result)
  {
    CSStore2::Show::TableContents((CSStore2 **)v7, (const CSStore2::Store *)result, (const CSStore2::Table *)(a3 != 0));
    return (char *)objc_claimAutoreleasedReturnValue();
  }

  return result;
}

char *_CSStoreCopyDebugDescriptionOfUnit(uint64_t a1, unsigned int a2, unsigned int a3, int a4)
{
  if (a1) {
    int v7 = -37516;
  }
  else {
    int v7 = 0;
  }
  if (v7 == a2) {
    return _CSStoreCopyDebugDescriptionOfTable(a1, a3, a4);
  }
  if (performConstantAssertions)
  {
    uint64_t v10 = *(void *)(a1 + 344);
    if (v10) {
      (*(void (**)(void))(**(void **)(v10 + 8) + 8LL))(*(void *)(v10 + 8));
    }
  }

  uint64_t v11 = a1 + 8;
  Table = CSStore2::Store::getTable((CSStore2::Store *)(a1 + 8), a2);
  if (!Table) {
    return 0LL;
  }
  Unit = CSStore2::Store::getUnit((CSStore2 **)(a1 + 8), (const CSStore2::Table *)Table, a3);
  if (!Unit) {
    return 0LL;
  }
  BOOL v14 = Unit;
  BOOL v15 = (void *)MEMORY[0x186E27B50]();
  uint64_t v35 = off_189D658F8;
  v36[0] = 0LL;
  __int128 v42 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v16 = objc_alloc_init(MEMORY[0x189607928]);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  v36[1] = v16;
  *(void *)&__int128 v42 = 0LL;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  DWORD2(v42) = 1065353216;
  LODWORD(v45) = 1065353216;
  WORD4(v45) = 0;
  *(void *)&__int128 v46 = 0LL;
  WORD4(v46) = 257;
  BYTE10(v46) = 0;
  __int128 v51 = v36;
  int v34 = 4 * *(_DWORD *)v14;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = MEMORY[0x1895F87A8];
  v33[0] = MEMORY[0x1895F87A8];
  v33[1] = 3321888768LL;
  void v33[2] = ___ZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEb_block_invoke;
  v33[3] = &__block_descriptor_48_ea8_32c66_ZTSKZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEbEUlvE__e5_v8__0l;
  void v33[4] = &v35;
  v33[5] = &v34;
  CSStore2::AttributedStringWriter::withAppliedAttribute( (uint64_t)&v35,  (uint64_t)@"_CSVNum",  (uint64_t)v17,  (uint64_t)v33);

  [MEMORY[0x189607968] numberWithUnsignedLong:*((unsigned int *)v14 + 1) + 8];
  uint64_t v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v35, @"length", v19);

  uint64_t v20 = v14 + 8;
  uint64_t v21 = *(void *)v11;
  if (*(void *)v11) {
    unint64_t v22 = *(void *)(v21 + 8);
  }
  else {
    unint64_t v22 = 0LL;
  }
  int v24 = -1;
  BOOL v25 = (unint64_t)v20 >= v22;
  unint64_t v26 = (unint64_t)&v20[-v22];
  if (v25 && !HIDWORD(v26))
  {
    else {
      int v24 = v26;
    }
  }

  int v32 = v24;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
  __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v18;
  v31[1] = 3321888768LL;
  v31[2] = ___ZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEb_block_invoke_158;
  void v31[3] = &__block_descriptor_48_ea8_32c67_ZTSKZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEbEUlvE0__e5_v8__0l;
  void v31[4] = &v35;
  v31[5] = &v32;
  CSStore2::AttributedStringWriter::withAppliedAttribute( (uint64_t)&v35,  (uint64_t)@"_CSVNum",  (uint64_t)v28,  (uint64_t)v31);

  if (a4)
  {
    CSStore2::AttributedStringWriter::separator( (CSStore2::AttributedStringWriter::Impl **)&v35,  (CSStore2::AttributedStringWriter *)0x2B,  0LL);
    if (*(void *)v11) {
      uint64_t v29 = *(CSStore2::Show **)(*(void *)v11 + 8LL);
    }
    else {
      uint64_t v29 = 0LL;
    }
    CSStore2::Show::ShowBytes(v29, v14, (const void *)(*((_DWORD *)v14 + 1) + 8));
    __int128 v30 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::attributedString((CSStore2::AttributedStringWriter::Impl **)&v35, v30);
  }

  uint64_t v23 = [v16 copy];
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v35);

  objc_autoreleasePoolPop(v15);
  return (char *)v23;
}

void sub_183E17F78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

void ___ZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEb_block_invoke(uint64_t a1)
{
}

void ___ZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEb_block_invoke_158(uint64_t a1)
{
}

__n128 __copy_helper_block_ea8_32c67_ZTSKZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEbEUlvE0_( __n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

__n128 __copy_helper_block_ea8_32c66_ZTSKZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEbEUlvE_( __n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

uint64_t _CSStoreCopyDebugDescriptionOfBytesInRange(uint64_t a1, unsigned int a2, void *a3)
{
  if (performConstantAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8LL))(*(void *)(v6 + 8));
    }
  }

  uint64_t result = 0LL;
  if (!__CFADD__(a2, (_DWORD)a3))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 8) + 8LL);
    if (a2 + a3 <= *(_DWORD *)(v8 + 12))
    {
      CSStore2::Show::ShowBytes((CSStore2::Show *)(v8 + 100LL * a2), (char *)(v8 + 100LL * a2), a3);
      return objc_claimAutoreleasedReturnValue();
    }
  }

  return result;
}

uint64_t _CSStoreCopyMemoryStatistics(uint64_t a1)
{
  if (performConstantAssertions)
  {
    uint64_t v2 = *(void *)(a1 + 344);
    if (v2) {
      (*(void (**)(void))(**(void **)(v2 + 8) + 8LL))(*(void *)(v2 + 8));
    }
  }

  __int128 v3 = (CSStore2 **)(a1 + 8);
  size_t v4 = (void *)MEMORY[0x186E27B50]();
  uint64_t v73 = 0LL;
  uint64_t v74 = &v73;
  uint64_t v75 = 0x2020000000LL;
  uint64_t v76 = 0LL;
  uint64_t v69 = 0LL;
  id v70 = &v69;
  uint64_t v71 = 0x2020000000LL;
  uint64_t v72 = 0LL;
  uint64_t v61 = 0LL;
  char v62 = &v61;
  uint64_t v63 = 0x4812000000LL;
  id v64 = __Block_byref_object_copy__185;
  int v65 = __Block_byref_object_dispose__186;
  v68[0] = 0LL;
  v68[1] = 0LL;
  double v66 = "";
  unint64_t v67 = v68;
  uint64_t v53 = 0LL;
  __int128 v54 = &v53;
  uint64_t v55 = 0x4812000000LL;
  __int128 v56 = __Block_byref_object_copy__185;
  __int128 v57 = __Block_byref_object_dispose__186;
  v60[0] = 0LL;
  v60[1] = 0LL;
  uint64_t v58 = "";
  id v59 = v60;
  uint64_t v49 = 0LL;
  __int128 v50 = &v49;
  uint64_t v51 = 0x2020000000LL;
  uint64_t v52 = 0LL;
  uint64_t v45 = 0LL;
  __int128 v46 = &v45;
  uint64_t v47 = 0x2020000000LL;
  uint64_t v48 = 0LL;
  v44[0] = MEMORY[0x1895F87A8];
  v44[1] = 3221225472LL;
  v44[2] = ___ZN8CSStore24Show16MemoryStatisticsERKNS_5StoreE_block_invoke;
  v44[3] = &unk_189D66038;
  v44[4] = &v73;
  v44[5] = &v61;
  v44[9] = &v49;
  v44[10] = v3;
  v44[6] = &v53;
  v44[7] = &v45;
  v44[8] = &v69;
  CSStore2::Store::enumerateTables(v3, v44);
  StringCache = (unsigned int *)CSStore2::getStringCache((CSStore2 *)v3, v5);
  if (StringCache)
  {
    CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics(StringCache);
    unint64_t v8 = HIDWORD(v7);
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  unint64_t v26 = v8;
  __int128 v27 = off_189D658F8;
  v28[0] = 0LL;
  __int128 v34 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v9 = objc_alloc_init(MEMORY[0x189607928]);
  v28[1] = v9;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  *(void *)&__int128 v34 = 0LL;
  DWORD2(v34) = 1065353216;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  LODWORD(v37) = 1065353216;
  WORD4(v37) = 0;
  *(void *)&__int128 v38 = 0LL;
  WORD4(v3_Block_object_dispose(va, 8) = 257;
  BYTE10(v3_Block_object_dispose(va, 8) = 0;
  __int128 v43 = v28;
  CSStore2::AttributedStringWriter::separator( (CSStore2::AttributedStringWriter::Impl **)&v27,  (CSStore2::AttributedStringWriter *)0x2B,  @"Structure Sizes");
  CSStore2::Show::ShowSize( (CSStore2::Show *)&v27,  (CSStore2::AttributedStringWriter *)@"sizeof(Data)",  (NSString *)0xFFFFFFFFFFFFFFFFLL,  100LL);
  CSStore2::Show::ShowSize( (CSStore2::Show *)&v27,  (CSStore2::AttributedStringWriter *)@"sizeof(Table)",  (NSString *)0xFFFFFFFFFFFFFFFFLL,  80LL);
  CSStore2::Show::ShowSize( (CSStore2::Show *)&v27,  (CSStore2::AttributedStringWriter *)@"sizeof(Unit)",  (NSString *)0xFFFFFFFFFFFFFFFFLL,  8LL);
  CSStore2::Show::ShowSize( (CSStore2::Show *)&v27,  (CSStore2::AttributedStringWriter *)@"sizeof(IdentifierCache)",  (NSString *)0xFFFFFFFFFFFFFFFFLL,  4LL);
  CSStore2::AttributedStringWriter::separator( (CSStore2::AttributedStringWriter::Impl **)&v27,  (CSStore2::AttributedStringWriter *)0x2B,  @"Memory by Table");
  uint64_t v10 = (uint64_t *)v62[6];
  uint64_t v11 = v62 + 7;
  if (v10 != v62 + 7)
  {
    do
    {
      __int16 v12 = v10 + 4;
      int v13 = v10 + 4;
      [NSString stringWithUTF8String:v13];
      BOOL v14 = (CSStore2::AttributedStringWriter *)objc_claimAutoreleasedReturnValue();
      BOOL v15 = (uint64_t **)(v54 + 6);
      id v16 = (void **)std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__find_equal<std::string>( (uint64_t)(v54 + 6),  &v77,  v10 + 4);
      uint64_t v17 = (char *)*v16;
      if (!*v16)
      {
        uint64_t v18 = (uint64_t **)v16;
        uint64_t v17 = (char *)operator new(0x40uLL);
        uint64_t v19 = (std::string *)(v17 + 32);
        if (*((char *)v10 + 55) < 0)
        {
          std::string::__init_copy_ctor_external(v19, (const std::string::value_type *)v10[4], v10[5]);
        }

        else
        {
          __int128 v20 = *(_OWORD *)v12;
          *((void *)v17 + 6) = v10[6];
          *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
        }

        *((void *)v17 + 7) = 0LL;
        std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__insert_node_at( v15,  v77,  v18,  (uint64_t *)v17);
      }

      CSStore2::Show::ShowSize((CSStore2::Show *)&v27, v14, *((NSString **)v17 + 7), v10[7]);

      uint64_t v21 = (uint64_t *)v10[1];
      if (v21)
      {
        do
        {
          unint64_t v22 = v21;
          uint64_t v21 = (uint64_t *)*v21;
        }

        while (v21);
      }

      else
      {
        do
        {
          unint64_t v22 = (uint64_t *)v10[2];
          BOOL v23 = *v22 == (void)v10;
          uint64_t v10 = v22;
        }

        while (!v23);
      }

      uint64_t v10 = v22;
    }

    while (v22 != v11);
  }

  CSStore2::AttributedStringWriter::separator( (CSStore2::AttributedStringWriter::Impl **)&v27,  (CSStore2::AttributedStringWriter *)0x2B,  @"Memory Summary");
  CSStore2::Show::ShowSize( (CSStore2::Show *)&v27,  (CSStore2::AttributedStringWriter *)@"Tables",  (NSString *)0xFFFFFFFFFFFFFFFFLL,  v74[3]);
  CSStore2::Show::ShowSize( (CSStore2::Show *)&v27,  (CSStore2::AttributedStringWriter *)@"Identifier caches",  (NSString *)0xFFFFFFFFFFFFFFFFLL,  v50[3]);
  CSStore2::Show::ShowSize( (CSStore2::Show *)&v27,  (CSStore2::AttributedStringWriter *)@"String caches",  (NSString *)0xFFFFFFFFFFFFFFFFLL,  v26);
  CSStore2::Show::ShowSize( (CSStore2::Show *)&v27,  (CSStore2::AttributedStringWriter *)@"All units",  (NSString *)v70[3],  v46[3]);
  CSStore2::Show::ShowSize( (CSStore2::Show *)&v27,  (CSStore2::AttributedStringWriter *)@"Collectable",  (NSString *)0xFFFFFFFFFFFFFFFFLL,  (*(_DWORD *)(*((void *)*v3 + 1) + 12LL) - *(_DWORD *)(*((void *)*v3 + 1) + 16LL)));
  CSStore2::Show::ShowSize( (CSStore2::Show *)&v27,  (CSStore2::AttributedStringWriter *)@"Total bytes used",  (NSString *)0xFFFFFFFFFFFFFFFFLL,  *(unsigned int *)(*((void *)*v3 + 1) + 16LL));
  uint64_t v24 = [v9 copy];
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v27);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(v60[0]);
  _Block_object_dispose(&v61, 8);
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(v68[0]);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
  objc_autoreleasePoolPop(v4);
  return v24;
}

void sub_183E185CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__185(void *result, void *a2)
{
  result[6] = a2[6];
  uint64_t v2 = a2 + 7;
  uint64_t v3 = a2[7];
  result[7] = v3;
  size_t v4 = result + 7;
  uint64_t v5 = a2[8];
  result[8] = v5;
  if (v5)
  {
    *(void *)(v3 + 16) = v4;
    a2[6] = v2;
    void *v2 = 0LL;
    a2[8] = 0LL;
  }

  else
  {
    result[6] = v4;
  }

  return result;
}

void __Block_byref_object_dispose__186(uint64_t a1)
{
}

void ___ZN8CSStore24Show16MemoryStatisticsERKNS_5StoreE_block_invoke(uint64_t a1, CSStore2::Table *this)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) += (*((_DWORD *)this + 1) - 72) + 80LL;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v5 = (id) CSStore2::Table::copyCFName(this);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[__CFString UTF8String](v5, "UTF8String"));
  unint64_t v22 = __p;
  uint64_t v6 = std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>( (uint64_t **)(v4 + 48),  __p,  (_OWORD **)&v22);
  if (v21 < 0) {
    operator delete(__p[0]);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  unint64_t v8 = (id) CSStore2::Table::copyCFName(this);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[__CFString UTF8String](v8, "UTF8String"));
  unint64_t v22 = __p;
  id v9 = (char *)v6 + 56;
  uint64_t v10 = (char *)std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>( (uint64_t **)(v7 + 48),  __p,  (_OWORD **)&v22)
      + 56;
  if (v21 < 0) {
    operator delete(__p[0]);
  }

  uint64_t v11 = *(CSStore2 ***)(a1 + 80);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  void v16[2] = ___ZN8CSStore24Show16MemoryStatisticsERKNS_5StoreE_block_invoke_2;
  v16[3] = &unk_189D66010;
  uint64_t v18 = v9;
  uint64_t v19 = v10;
  __int128 v17 = *(_OWORD *)(a1 + 56);
  CSStore2::Store::enumerateUnits(v11, (unsigned int *)this, v16);
  uint64_t v12 = *((unsigned int *)this + 19);
  if ((_DWORD)v12 != -1)
  {
    uint64_t v13 = *(void *)(**(void **)(a1 + 80) + 8LL);
    if (*(_DWORD *)(v13 + 12) > v12 && v13 != 0)
    {
      CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics((unsigned int *)(v13 + v12));
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) += HIDWORD(v15);
    }
  }

void sub_183E18854( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20, char a21, char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void CSStore2::Show::ShowSize( CSStore2::Show *this, CSStore2::AttributedStringWriter *a2, NSString *a3, uint64_t a4)
{
  uint64_t v7 = a2;
  uint64_t v31 = a4;
  __int128 v32 = a3;
  unint64_t v8 = (void *)MEMORY[0x186E27B50]();
  if (CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::once != -1) {
    dispatch_once( &CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::once,  &__block_literal_global_192);
  }
  BOOL v14 = off_189D658F8;
  v15[0] = 0LL;
  __int128 v21 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v9 = (NSAttributedString *)objc_alloc_init(MEMORY[0x189607928]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v15[1] = v9;
  *(void *)&__int128 v21 = 0LL;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  DWORD2(v21) = 1065353216;
  LODWORD(v24) = 1065353216;
  WORD4(v24) = 0;
  *(void *)&__int128 v25 = 0LL;
  WORD4(v25) = 1;
  BYTE10(v25) = 0;
  __int128 v30 = v15;
  uint64_t v10 = MEMORY[0x1895F87A8];
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3321888768LL;
  void v13[2] = ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_2;
  void v13[3] = &__block_descriptor_48_ea8_32c78_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE__e5_v8__0l;
  void v13[4] = &v14;
  v13[5] = &v31;
  CSStore2::AttributedStringWriter::withAppliedAttribute( (uint64_t)&v14,  (uint64_t)@"_CSVFixed",  MEMORY[0x189604A88],  (uint64_t)v13);
  v12[0] = v10;
  v12[1] = 3321888768LL;
  void v12[2] = ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_195;
  void v12[3] = &__block_descriptor_40_ea8_32c79_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE0__e5_v8__0l;
  v12[4] = &v14;
  CSStore2::AttributedStringWriter::withAppliedAttribute( (uint64_t)&v14,  (uint64_t)@"_CSVOutputType",  (uint64_t)&unk_189D69AC0,  (uint64_t)v12);
  v11[0] = v10;
  v11[1] = 3321888768LL;
  void v11[2] = ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_197;
  std::stringbuf::string_type v11[3] = &__block_descriptor_56_ea8_32c79_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE1__e5_v8__0l;
  v11[4] = &v32;
  v11[5] = &v14;
  v11[6] = &v31;
  CSStore2::AttributedStringWriter::withAppliedAttribute( (uint64_t)&v14,  (uint64_t)@"_CSVFixed",  MEMORY[0x189604A88],  (uint64_t)v11);
  CSStore2::AttributedStringWriter::attributedString(this, (NSAttributedString *)v7, v9);
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v14);

  objc_autoreleasePoolPop(v8);
}

void sub_183E18AC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy( char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*((void *)a1 + 1));
    if (a1[55] < 0) {
      operator delete(*((void **)a1 + 4));
    }
    operator delete(a1);
  }

void *std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__find_equal<std::string>( uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        uint64_t v7 = v4;
        unint64_t v8 = v4 + 4;
        if (!std::less<std::string>::operator()[abi:nn180100](a3, v4 + 4)) {
          break;
        }
        uint64_t v4 = (void *)*v7;
        uint64_t v5 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }

      if (!std::less<std::string>::operator()[abi:nn180100](v8, a3)) {
        break;
      }
      uint64_t v5 = v7 + 1;
      uint64_t v4 = (void *)v7[1];
    }

    while (v4);
  }

  else
  {
    uint64_t v7 = (void *)(a1 + 8);
  }

uint64_t **std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__insert_node_at( uint64_t **result, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v4 = (uint64_t *)**result;
  if (v4)
  {
    char *result = v4;
    a4 = *a3;
  }

  uint64_t v5 = result[1];
  *((_BYTE *)a4 + 24) = a4 == v5;
  if (a4 != v5)
  {
    do
    {
      uint64_t v6 = (uint64_t *)a4[2];
      if (*((_BYTE *)v6 + 24)) {
        break;
      }
      uint64_t v7 = (uint64_t *)v6[2];
      unint64_t v8 = (uint64_t *)*v7;
      if ((uint64_t *)*v7 == v6)
      {
        uint64_t v11 = v7[1];
        if (!v11 || (v12 = *(unsigned __int8 *)(v11 + 24), id v9 = (_BYTE *)(v11 + 24), v12))
        {
          if ((uint64_t *)*v6 == a4)
          {
            uint64_t v13 = (uint64_t **)a4[2];
          }

          else
          {
            uint64_t v13 = (uint64_t **)v6[1];
            BOOL v14 = *v13;
            v6[1] = (uint64_t)*v13;
            if (v14)
            {
              void v14[2] = (uint64_t)v6;
              uint64_t v7 = (uint64_t *)v6[2];
            }

            void v13[2] = v7;
            *(void *)(v6[2] + 8LL * (*(void *)v6[2] != (void)v6)) = v13;
            *uint64_t v13 = v6;
            v6[2] = (uint64_t)v13;
            uint64_t v7 = v13[2];
            uint64_t v6 = (uint64_t *)*v7;
          }

          *((_BYTE *)v13 + 24) = 1;
          *((_BYTE *)v7 + 24) = 0;
          uint64_t v17 = v6[1];
          *uint64_t v7 = v17;
          if (v17) {
            *(void *)(v17 + 16) = v7;
          }
          v6[2] = v7[2];
          *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v6;
          v6[1] = (uint64_t)v7;
          goto LABEL_29;
        }
      }

      else if (!v8 || (v10 = *((unsigned __int8 *)v8 + 24), id v9 = v8 + 3, v10))
      {
        if ((uint64_t *)*v6 == a4)
        {
          uint64_t v15 = a4[1];
          *uint64_t v6 = v15;
          if (v15)
          {
            *(void *)(v15 + 16) = v6;
            uint64_t v7 = (uint64_t *)v6[2];
          }

          a4[2] = (uint64_t)v7;
          *(void *)(v6[2] + 8LL * (*(void *)v6[2] != (void)v6)) = a4;
          a4[1] = (uint64_t)v6;
          v6[2] = (uint64_t)a4;
          uint64_t v7 = (uint64_t *)a4[2];
        }

        else
        {
          a4 = (uint64_t *)a4[2];
        }

        *((_BYTE *)a4 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        uint64_t v6 = (uint64_t *)v7[1];
        uint64_t v16 = *v6;
        v7[1] = *v6;
        if (v16) {
          *(void *)(v16 + 16) = v7;
        }
        v6[2] = v7[2];
        *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v6;
        *uint64_t v6 = (uint64_t)v7;
LABEL_29:
        v7[2] = (uint64_t)v6;
        break;
      }

      *((_BYTE *)v6 + 24) = 1;
      a4 = v7;
      *((_BYTE *)v7 + 24) = v7 == v5;
      *id v9 = 1;
    }

    while (v7 != v5);
  }

  result[2] = (uint64_t *)((char *)result[2] + 1);
  return result;
}

void std::string::__init_copy_ctor_external( std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8LL) {
      abort();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    unint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__l.__cap_ = v7 | 0x8000000000000000LL;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }

  else
  {
    this->__r_.__value_.__s.__size_ = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

BOOL std::less<std::string>::operator()[abi:nn180100](void *a1, void *a2)
{
  int v2 = *((char *)a2 + 23);
  int v3 = *((char *)a1 + 23);
  if (v3 >= 0) {
    size_t v4 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v4 = a1[1];
  }
  if (v3 < 0) {
    a1 = (void *)*a1;
  }
  if (v2 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = a2[1];
  }
  if (v2 < 0) {
    a2 = (void *)*a2;
  }
  if (v5 >= v4) {
    size_t v6 = v4;
  }
  else {
    size_t v6 = v5;
  }
  int v7 = memcmp(a1, a2, v6);
  if (v7) {
    return v7 < 0;
  }
  else {
    return v4 < v5;
  }
}

void ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [MEMORY[0x189607968] numberWithUnsignedLongLong:**(void **)(a1 + 40)];
  v5[1] = 3321888768LL;
  v5[2] = ___ZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE_clEv_block_invoke;
  v5[3] = &__block_descriptor_48_ea8_32c91_ZTSKZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE_clEvEUlvE__e5_v8__0l;
  __int128 v6 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v3;
  v5[0] = MEMORY[0x1895F87A8];
  CSStore2::AttributedStringWriter::withAppliedAttribute(v2, (uint64_t)@"_CSVNum", v3, (uint64_t)v5);
}

void sub_183E18F14( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_195(uint64_t a1)
{
}

void ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_197(int8x16_t *a1)
{
  uint64_t v1 = a1[2].i64[1];
  if (*(void *)a1[2].i64[0] == -1LL)
  {
    CSStore2::AttributedStringWriter::string( (CSStore2::AttributedStringWriter::Impl **)a1[2].i64[1],  (NSAttributedString *)@"-----");
  }

  else
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:");
    v6[1] = 3321888768LL;
    v6[2] = ___ZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE1_clEv_block_invoke;
    void v6[3] = &__block_descriptor_56_ea8_32c92_ZTSKZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE1_clEvEUlvE__e5_v8__0l;
    uint64_t v4 = a1[3].i64[0];
    int8x16_t v7 = vextq_s8(a1[2], a1[2], 8uLL);
    uint64_t v8 = v4;
    id v5 = (id)v3;
    v6[0] = MEMORY[0x1895F87A8];
    CSStore2::AttributedStringWriter::withAppliedAttribute(v1, (uint64_t)@"_CSVNum", v3, (uint64_t)v6);
  }

void sub_183E18FF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
}

__n128 __copy_helper_block_ea8_32c79_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE1_( __n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  a1[2] = result;
  return result;
}

void ___ZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE1_clEv_block_invoke( uint64_t a1)
{
  unint64_t v2 = **(void **)(a1 + 40);
  if (v2 >= 2)
  {
    uint64_t v3 = *(CSStore2::AttributedStringWriter **)(a1 + 32);
    [(id)CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::bf stringFromByteCount:**(void **)(a1 + 48) / v2];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::format(v3, 0LL, @" (≅%@/unit)", v4);
  }

void sub_183E190BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

__n128 __copy_helper_block_ea8_32c92_ZTSKZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE1_clEvEUlvE_( __n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  a1[2] = result;
  return result;
}

uint64_t __copy_helper_block_ea8_32c79_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE0_( uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

__n128 __copy_helper_block_ea8_32c78_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE_( __n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

void ___ZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE_clEv_block_invoke( uint64_t a1)
{
  uint64_t v1 = *(CSStore2::AttributedStringWriter **)(a1 + 32);
  uint64_t v2 = **(void **)(a1 + 40);
  id v3 = [(id)CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::bf stringFromByteCount:v2];
  CSStore2::AttributedStringWriter::format(v1, 0, @"%10llu (%10s)", v2, [v3 UTF8String]);
}

void sub_183E19160( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
}

__n128 __copy_helper_block_ea8_32c91_ZTSKZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE_clEvEUlvE_( __n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

void ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607800]);
  uint64_t v1 = (void *)CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::bf;
  CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::bf = (uint64_t)v0;
}

_OWORD *std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>( uint64_t **a1, void *a2, _OWORD **a3)
{
  id v5 = (void **)std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__find_equal<std::string>( (uint64_t)a1,  &v11,  a2);
  __int128 v6 = *v5;
  if (!*v5)
  {
    int8x16_t v7 = (uint64_t **)v5;
    __int128 v6 = operator new(0x40uLL);
    uint64_t v8 = *a3;
    uint64_t v9 = *((void *)*a3 + 2);
    v6[2] = **a3;
    *((void *)v6 + 6) = v9;
    *uint64_t v8 = 0LL;
    v8[1] = 0LL;
    v8[2] = 0LL;
    *((void *)v6 + 7) = 0LL;
    std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__insert_node_at( a1,  v11,  v7,  (uint64_t *)v6);
  }

  return v6;
}

uint64_t ___ZN8CSStore24Show16MemoryStatisticsERKNS_5StoreE_block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a2 + 4) + 8LL;
  id v3 = *(void **)(result + 56);
  **(void **)(result + 48) += v2;
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) += v2;
  ++*v3;
  ++*(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL);
  return result;
}

void sub_183E192FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E19798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E19A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E19F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E1A23C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_183E1A344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E1A3E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_5:
    __int128 v6 = 0LL;
LABEL_12:
    uint64_t v11 = 0LL;
    goto LABEL_15;
  }

  id v5 = [v4 constantValue];
LABEL_7:
  __int128 v6 = (void *)v5;
  if (!v5) {
    goto LABEL_12;
  }
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID == CFGetTypeID(v6))
  {
    uint64_t v8 = [v6 BOOLValue];
    uint64_t v9 = @"false";
    if (v8) {
      uint64_t v9 = @"true";
    }
    int v10 = v9;
  }

  else
  {
    [v6 description];
    int v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v11 = v10;
LABEL_15:

  return v11;
}

void sub_183E1A590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_3:
  id v5 = v39;
  __int128 v6 = 0LL;
LABEL_4:
  if (a4 && !v5)
  {
    if (!v6)
    {
      int8x16_t v7 = (void *)MEMORY[0x189607870];
      v48[0] = *MEMORY[0x189607490];
      v48[1] = @"Line";
      v49[0] = @"kCSStorePredicateErr";
      v49[1] = &unk_189D69B20;
      void v48[2] = *MEMORY[0x1896075F0];
      v48[3] = @"Predicate";
      void v49[2] = @"Could not translate generated predicate to a form usable by CoreServicesStore.";
      v49[3] = v39;
      [MEMORY[0x189603F68] dictionaryWithObjects:v49 forKeys:v48 count:4];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 errorWithDomain:*MEMORY[0x189607670] code:-9495 userInfo:v8];
      __int128 v6 = (id)objc_claimAutoreleasedReturnValue();
    }

    __int128 v6 = v6;
    *a4 = v6;
  }

  uint64_t v9 = v5;

  return v9;
}

void sub_183E1ACB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_183E1AFFC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, const __CFString *a12, uint64_t a13, const __CFString *a14, const __CFString *a15, void *a16, const __CFString *a17, CSStore2 *a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, int buf)
{
  if (a2 == 1)
  {
    __int128 v34 = (CSStore2 *)objc_begin_catch(a1);
    __int128 v35 = v34;
    if (!v28)
    {
      __int128 v36 = (void *)MEMORY[0x189607870];
      a11 = *MEMORY[0x189607490];
      a12 = @"Line";
      a15 = @"kCSStorePredicateErr";
      a16 = &unk_189D69B68;
      a13 = *MEMORY[0x1896075F0];
      a14 = @"Exception";
      a17 = @"An exception was thrown while parsing the predicate string (interpreting as an expression because predicate parsing already failed.)";
      a18 = v34;
      [MEMORY[0x189603F68] dictionaryWithObjects:&a15 forKeys:&a11 count:4];
      __int128 v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v36 errorWithDomain:*MEMORY[0x189607670] code:-9495 userInfo:v37];
      objc_claimAutoreleasedReturnValue();
    }

    CSStore2::GetLog(v34);
    __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      buf = 138477827;
      *(void *)(v31 + 4) = v35;
      _os_log_impl( &dword_183DFE000,  v38,  OS_LOG_TYPE_DEFAULT,  "Suppressing exception during expression parsing: %{private}@",  (uint8_t *)&buf,  0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x183E1AF98LL);
  }

  _Unwind_Resume(a1);
}

void sub_183E1B524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_DWORD *CSStore2::String::Get(_DWORD *this, CSStore2::Store *a2, unsigned int a3)
{
  id v5 = this;
  LOBYTE(v1_Block_object_dispose(va, 8) = 0;
  char v20 = 0;
  if ((a3 & 1) != 0)
  {
    uint64_t v6 = 0LL;
    *(void *)&__int128 v18 = 0LL;
    *(void *)&__int128 v19 = 0LL;
    DWORD2(v19) = 0;
    char v20 = 1;
    DWORD2(v1_Block_object_dispose(va, 8) = a3;
    BYTE12(v1_Block_object_dispose(va, 8) = 1;
    unsigned int v7 = a3 >> 2;
    do
    {
      uint64_t v8 = v7 & 0x3F;
      if ((v7 & 0x3F) == 0) {
        break;
      }
      v7 >>= 6;
      *((_BYTE *)&v19 + v6++) = CSStore2::String::kPackedAlphabet[v8];
    }

    while (v6 != 5);
    this = (_DWORD *)strlen((const char *)&v19);
    if (this >= 2uLL)
    {
      uint64_t v9 = (char *)&v18 + this + 15;
      int v10 = (char *)&v19 + 1;
      do
      {
        char v11 = *(v10 - 1);
        *(v10 - 1) = *v9;
        *v9-- = v11;
      }

      while (v10++ < v9);
    }

    DWORD2(v19) = (_DWORD)this;
  }

  __int128 v13 = v19;
  *(_OWORD *)id v5 = v18;
  *((_OWORD *)v5 + 1) = v13;
  char v14 = v20;
  *((_BYTE *)v5 + 32) = v20;
  if (!v14)
  {
    uint64_t v15 = (const CSStore2::Table *)*((void *)a2 + 34);
    if (v15
      || (this = CSStore2::Store::getTable((CSStore2 **)a2, @"<string>"),
          (uint64_t v15 = (const CSStore2::Table *)this) != 0LL))
    {
      this = CSStore2::Store::getUnit((CSStore2 **)a2, v15, a3);
      if (this)
      {
        int v16 = this[1];
        int v17 = 4 * *this;
        *(void *)id v5 = a2;
        v5[2] = v17;
        *((_BYTE *)v5 + 12) = 0;
        *((void *)v5 + 2) = this + 2;
        v5[6] = v16;
        *((_BYTE *)v5 + 32) = 1;
      }
    }
  }

  return this;
}

void CSStore2::String::Find( CSStore2::String *this, CSStore2::Store *a2, CSStore2::_StringFunctions *a3, const char *a4)
{
  uint64_t v53 = *MEMORY[0x1895F89C0];
  uint64_t v42 = 0LL;
  __int128 v43 = &v42;
  uint64_t v44 = 0x5812000000LL;
  uint64_t v45 = __Block_byref_object_copy__284;
  __int128 v46 = __Block_byref_object_dispose__285;
  uint64_t v47 = 0LL;
  char v48 = 0;
  char v49 = 0;
  char v52 = 0;
  if (a4 > 5)
  {
LABEL_15:
    StringCache = CSStore2::getStringCache(a2, a2);
    if (StringCache)
    {
      unsigned int HashCode = CSStore2::_StringFunctions::getHashCode(a3, a4);
      v35[0] = MEMORY[0x1895F87A8];
      v35[1] = 3221225472LL;
      __int128 v36 = ___ZN8CSStore26String4FindERNS_5StoreEPKcj_block_invoke;
      __int128 v37 = &unk_189D66190;
      __int128 v39 = a2;
      __int128 v40 = a3;
      int v41 = (int)a4;
      __int128 v38 = &v42;
      int v17 = v35;
      char v50 = 0;
      if (*(_DWORD *)StringCache)
      {
        uint64_t v18 = HashCode % *(_DWORD *)StringCache;
        __int128 v19 = &StringCache[8 * v18];
        int v22 = *((_DWORD *)v19 + 1);
        __int128 v21 = (unsigned int *)(v19 + 4);
        int v20 = v22;
        if ((v22 - 0x20000000) >= 0xE0000001)
        {
          uint64_t v23 = *(unsigned int *)&StringCache[8 * v18 + 8];
          unsigned int v24 = v23 + 8 * v20;
          if (!__CFADD__((_DWORD)v23, 8 * v20))
          {
            uint64_t v25 = *(void *)(*(void *)a2 + 8LL);
            unsigned int v26 = *(_DWORD *)(v25 + 12);
            if (v24 <= v26 && v26 > v23)
            {
              __int128 v28 = (unsigned int *)(v25 + v23);
              unint64_t v29 = 1LL;
              do
              {
                v36((uint64_t)v17, v28, (uint64_t)(v28 + 1), &v50);
                BOOL v30 = v29++ >= *v21;
                v28 += 2;
              }

              while (!v30 && v50 == 0);
            }
          }
        }
      }
    }

    goto LABEL_33;
  }

  if ((_DWORD)a4)
  {
    uint64_t v8 = 0LL;
    unsigned int v9 = 0;
    uint64_t v10 = MEMORY[0x1895F8770];
    while (1)
    {
      unsigned int v11 = *((char *)a3 + v8);
      if (!((v11 & 0x80000000) != 0
           ? __maskrune(*((char *)a3 + v8), 0x40000uLL)
           : *(_DWORD *)(v10 + 4LL * v11 + 60) & 0x40000))
        goto LABEL_15;
      __int128 v13 = memchr(CSStore2::String::kPackedAlphabet, v11, 0x40uLL);
      if (v13) {
        unsigned int v9 = ((_DWORD)v13 - CSStore2::String::kPackedAlphabet) | (v9 << 6);
      }
      if (++v8 >= (unint64_t)a4 || !v13)
      {
        if (!v13) {
          goto LABEL_15;
        }
        int v14 = (4 * v9) | 1;
        *(void *)&__int128 __dst = 0LL;
        char v52 = 1;
        if (!(_DWORD)a4) {
          goto LABEL_31;
        }
        memcpy(&__dst, a3, a4);
        DWORD2(__dst) = (_DWORD)a4;
        if (v52) {
          goto LABEL_32;
        }
        goto LABEL_15;
      }
    }
  }

  *(void *)&__int128 __dst = 0LL;
  int v14 = 1;
  char v52 = 1;
LABEL_31:
  DWORD2(__dst) = (_DWORD)a4;
LABEL_32:
  __int128 v32 = v43;
  v43[6] = 0LL;
  *((_DWORD *)v32 + 14) = v14;
  *((_BYTE *)v32 + 6std::string::resize(&v8, (std::string::size_type)this + 1, 0) = 1;
  *((_OWORD *)v32 + 4) = __dst;
  *((_BYTE *)v32 + 8std::string::resize(&v8, (std::string::size_type)this + 1, 0) = v52;
LABEL_33:
  __int128 v33 = v43;
  __int128 v34 = *((_OWORD *)v43 + 4);
  *(_OWORD *)this = *((_OWORD *)v43 + 3);
  *((_OWORD *)this + 1) = v34;
  *((void *)this + 4) = v33[10];
  _Block_object_dispose(&v42, 8);
}

void sub_183E1B994( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
}

__n128 __Block_byref_object_copy__284(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  __int128 v3 = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 8std::string::resize(&v8, (std::string::size_type)this + 1, 0) = *(_BYTE *)(a2 + 80);
  *(__n128 *)(a1 + 4_Block_object_dispose(va, 8) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

char *CSStore2::getStringCache(CSStore2 *this, const CSStore2::Store *a2)
{
  __n128 result = (char *)*((void *)this + 34);
  if (result || (__n128 result = CSStore2::Store::getTable((CSStore2 **)this, @"<string>")) != 0LL)
  {
    uint64_t v4 = *((unsigned int *)result + 20);
    if ((_DWORD)v4 == -1)
    {
      return 0LL;
    }

    else
    {
      __n128 result = 0LL;
      uint64_t v5 = *(void *)(*(void *)this + 8LL);
      unsigned int v6 = *(_DWORD *)(v5 + 12);
    }
  }

  return result;
}

uint64_t CSStore2::_StringFunctions::getHashCode(CSStore2::_StringFunctions *this, const char *a2)
{
  __int16 v2 = (__int16)a2;
  if (a2 < 0x81)
  {
    if ((_DWORD)a2)
    {
      uint64_t v5 = a2;
      do
      {
        __int16 v6 = *(unsigned __int8 *)this;
        this = (CSStore2::_StringFunctions *)((char *)this + 1);
        __int16 v2 = 17 * v2 + v6;
        --v5;
      }

      while (v5);
    }

    else
    {
      __int16 v2 = 0;
    }
  }

  else
  {
    for (uint64_t i = 0LL; i != 64; ++i)
      __int16 v2 = 17 * v2 + *((unsigned __int8 *)this + i);
    for (uint64_t j = 0LL; j != 64; ++j)
      __int16 v2 = 17 * v2 + *((unsigned __int8 *)this + ((_DWORD)a2 - 64) + j);
  }

  return (unsigned __int16)((v2 << (a2 & 7)) + v2);
}

double ___ZN8CSStore26String4FindERNS_5StoreEPKcj_block_invoke( uint64_t a1, unsigned int *a2, uint64_t a3, _BYTE *a4)
{
  unsigned int v7 = *(const void **)(a1 + 48);
  size_t v8 = *(unsigned int *)(a1 + 56);
  CSStore2::String::Get(&v15, *(CSStore2::Store **)(a1 + 40), *a2);
  if (v17)
  {
    double result = *(double *)&v16;
    __int128 v13 = v16;
    char v14 = 1;
    if (DWORD2(v16) == (_DWORD)v8)
    {
      if (BYTE12(v15)) {
        uint64_t v10 = &v13;
      }
      else {
        uint64_t v10 = (__int128 *)v13;
      }
      if (!memcmp(v10, v7, v8))
      {
        CSStore2::String::Get(&v15, *(CSStore2::Store **)(a1 + 40), *a2);
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
        double result = *(double *)&v15;
        __int128 v12 = v16;
        *(_OWORD *)(v11 + 4_Block_object_dispose(va, 8) = v15;
        *(_OWORD *)(v11 + 64) = v12;
        *(_BYTE *)(v11 + 8std::string::resize(&v8, (std::string::size_type)this + 1, 0) = v17;
        *a4 = 1;
      }
    }
  }

  return result;
}

unsigned int *CSStore2::String::Create( CSStore2::String *this, char **a2, CSStore2::_StringFunctions *a3, const char *a4)
{
  unsigned int v4 = a4;
  *(_BYTE *)this = 0;
  *((_BYTE *)this + 32) = 0;
  CSStore2::String::Find((CSStore2::String *)&v71, (CSStore2::Store *)a2, a3, a4);
  __int128 v8 = v72;
  *(_OWORD *)this = v71;
  *((_OWORD *)this + 1) = v8;
  char v9 = v73;
  *((_BYTE *)this + 32) = v73;
  if (v9) {
    return CSStore2::String::retain((unsigned int *)this);
  }
  Table = a2[34];
  if (!Table)
  {
    Table = CSStore2::Store::getTable((CSStore2 **)a2, @"<string>");
    if (!Table)
    {
      double result = (unsigned int *)CSStore2::Store::allocateTable((CSStore2::Store *)a2, @"<string>", 4, 0LL);
      if (!result) {
        return result;
      }
      __int128 v12 = *a2;
      if (*a2) {
        unint64_t v13 = *((void *)v12 + 1);
      }
      else {
        unint64_t v13 = 0LL;
      }
      unsigned int v14 = -1;
      BOOL v15 = (unint64_t)result >= v13;
      unint64_t v16 = (unint64_t)result - v13;
      if (v15 && !HIDWORD(v16))
      {
        else {
          unsigned int v14 = v16;
        }
      }

      if (a2[34] || CSStore2::Store::getTable((CSStore2 **)a2, @"<string>"))
      {
        __int128 v71 = 0u;
        __int128 v72 = 0u;
        int v73 = 1065353216;
        unint64_t v18 = CSStore2::Store::extend((CSStore2::Store *)a2, 0x23884u);
        NSUInteger v19 = v18;
        if (v18)
        {
          int v20 = *a2;
          if (*a2) {
            unint64_t v21 = *((void *)v20 + 1);
          }
          else {
            unint64_t v21 = 0LL;
          }
          int v22 = -1;
          BOOL v15 = v18 >= v21;
          unint64_t v23 = v18 - v21;
          if (v15 && !HIDWORD(v23))
          {
            else {
              int v22 = v23;
            }
          }

          CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Create( v74,  (CSStore2::_StringFunctions *)a2,  (uint64_t)&v71,  v22,  0LL);
          uint64_t v25 = v74[0];
          if (v74[0])
          {
            CSStore2::VM::Copy(v19, (NSUInteger)v74[0], (const void *)0x23884);
            ((void (*)(void *))v74[1])(v25);
          }

          else
          {
            CSStore2::Store::assertNotEnumeratingUnits((uint64_t)a2);
            NSUInteger v19 = 0LL;
            uint64_t v26 = *((void *)*a2 + 1);
            unsigned int v27 = *(_DWORD *)(v26 + 16);
            BOOL v15 = v27 >= 0x23884;
            unsigned int v28 = v27 - 145540;
            if (!v15) {
              unsigned int v28 = 0;
            }
            *(_DWORD *)(v26 + 16) = v28;
            ++*(_DWORD *)(v26 + 8);
          }
        }

        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v71);
      }

      else
      {
        NSUInteger v19 = 0LL;
      }

      if (v14 == -1 || (uint64_t v29 = *((void *)*a2 + 1), *(_DWORD *)(v29 + 12) <= v14)) {
        Table = 0LL;
      }
      else {
        Table = (char *)(v29 + v14);
      }
      if (v19)
      {
        BOOL v30 = *a2;
        if (*a2) {
          NSUInteger v31 = *((void *)v30 + 1);
        }
        else {
          NSUInteger v31 = 0LL;
        }
        int v32 = -1;
        BOOL v15 = v19 >= v31;
        NSUInteger v33 = v19 - v31;
        if (v15 && !HIDWORD(v33))
        {
          else {
            int v32 = v33;
          }
        }
      }

      else
      {
        int v32 = -1;
      }

      *((_DWORD *)Table + 2std::string::resize(&v8, (std::string::size_type)this + 1, 0) = v32;
    }
  }

  double result = (unsigned int *)CSStore2::Store::allocateUnit((CSStore2::Store *)a2, (CSStore2::Table *)Table, v4, 0);
  if (result)
  {
    __int128 v36 = result;
    if (v4) {
      memmove(result + 2, a3, v4);
    }
    double result = (unsigned int *)CSStore2::getStringCache((CSStore2 *)a2, v35);
    if (!result) {
      goto LABEL_120;
    }
    __int128 v37 = result;
    __int128 v38 = *a2;
    if (*a2) {
      unint64_t v39 = *((void *)v38 + 1);
    }
    else {
      unint64_t v39 = 0LL;
    }
    unsigned int v40 = -1;
    BOOL v15 = (unint64_t)v36 >= v39;
    unint64_t v41 = (unint64_t)v36 - v39;
    if (v15 && !HIDWORD(v41))
    {
      else {
        unsigned int v40 = v41;
      }
    }

    __int128 v43 = (const CSStore2::Store *)(4 * *v36);
    LODWORD(v71) = (_DWORD)v43;
    if (!(_DWORD)v43)
    {
LABEL_119:
      __int128 v36 = (unsigned int *)(*((void *)*a2 + 1) + v40);
LABEL_120:
      unsigned int v69 = v36[1];
      int v70 = 4 * *v36;
      *(void *)this = a2;
      *((_DWORD *)this + 2) = v70;
      *((_BYTE *)this + 12) = 0;
      *((void *)this + 2) = v36 + 2;
      *((_DWORD *)this + 6) = v69;
      *((_BYTE *)this + 32) = 1;
      return result;
    }

    double result = CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find( (CSStore2 *)a2,  result,  &v71);
    if (result)
    {
      unsigned int *result = 257;
      goto LABEL_119;
    }

    double result = (unsigned int *)CSStore2::_StringFunctions::getHashCode((CSStore2::_StringFunctions *)a2, v43);
    uint64_t v44 = &v37[2 * (result % *v37)];
    unint64_t v45 = (unint64_t)(v44 + 1);
    uint64_t v46 = v44[2];
    if ((_DWORD)v46 == -1)
    {
      char v50 = 0LL;
    }

    else
    {
      uint64_t v47 = *((void *)*a2 + 1);
      BOOL v48 = *(_DWORD *)(v47 + 12) > v46;
      char v49 = (char *)(v47 + v46);
      if (v48) {
        char v50 = v49;
      }
      else {
        char v50 = 0LL;
      }
    }

    uint64_t v51 = *(unsigned int *)v45;
    if ((_DWORD)v51)
    {
      uint64_t v52 = 0LL;
      uint64_t v53 = v50 + 4;
      while (*(v53 - 1) && *v53)
      {
        ++v52;
        v53 += 2;
        if (v51 == v52) {
          goto LABEL_87;
        }
      }

      uint64_t v58 = &v50[8 * v52];
      *(_DWORD *)uint64_t v58 = (_DWORD)v43;
      *((_DWORD *)v58 + 1) = 257;
      goto LABEL_119;
    }

LABEL_87:
    unsigned int v54 = v51 + 8;
    uint64_t v55 = *a2;
    if (*a2)
    {
      unint64_t v56 = *((void *)v55 + 1);
      unsigned int v57 = -1;
      BOOL v15 = v45 >= v56;
      v45 -= v56;
      if (!v15)
      {
LABEL_99:
        double result = (unsigned int *)CSStore2::Store::embraceAndExtend( (CSStore2::Store *)a2,  v50,  (const void *)(8 * v51),  8 * v54);
        if (v57 == -1 || (uint64_t v60 = *((void *)*a2 + 1), *(_DWORD *)(v60 + 12) <= v57)) {
          uint64_t v61 = 0LL;
        }
        else {
          uint64_t v61 = (_DWORD *)(v60 + v57);
        }
        if (!result)
        {
          v61[1] = -1;
          abort();
        }

        char v62 = *a2;
        if (*a2) {
          unint64_t v63 = *((void *)v62 + 1);
        }
        else {
          unint64_t v63 = 0LL;
        }
        int v64 = -1;
        BOOL v15 = (unint64_t)result >= v63;
        unint64_t v65 = (unint64_t)result - v63;
        if (v15 && !HIDWORD(v65))
        {
          else {
            int v64 = v65;
          }
        }

        v61[1] = v64;
        unint64_t v67 = &result[2 * v51];
        *unint64_t v67 = v43;
        v67[1] = 257;
        if ((int)v51 + 1 < v54)
        {
          unint64_t v68 = &result[2 * (v51 + 1)];
          *((void *)v68 + 6) = 0LL;
          *((_OWORD *)v68 + 1) = 0u;
          *((_OWORD *)v68 + 2) = 0u;
          *(_OWORD *)unint64_t v68 = 0u;
        }

        *v61 += 8;
        goto LABEL_119;
      }
    }

    else
    {
      unsigned int v57 = -1;
    }

    if (!HIDWORD(v45))
    {
      else {
        unsigned int v57 = v45;
      }
    }

    goto LABEL_99;
  }

  return result;
}

            if (++v24 >= (unint64_t)*v17)
            {
              uint64_t v10 = v55;
              __int128 v12 = *v55;
              break;
            }
          }
        }
      }
    }

    ++v13;
  }

  while (v13 < v12);
  uint64_t v53 = (uint64_t **)v59;
  LOBYTE(__dst[0]) = 0;
  for (k = v54; v53; uint64_t v53 = (uint64_t **)*v53)
  {
    (*((void (**)(id, void, void, _OWORD *))v54 + 2))( v54,  *((unsigned int *)v53 + 4),  *((unsigned int *)v53 + 5),  __dst);
    if (LOBYTE(__dst[0])) {
      break;
    }
  }

    if ((v21 & (v21 - 1)) != 0)
    {
      if (v7 >= v21) {
        __int16 v2 = v7 % v21;
      }
      else {
        __int16 v2 = v7;
      }
    }

    else
    {
      __int16 v2 = (v21 - 1) & v7;
    }
  }

  uint64_t v47 = *(void **)v20;
  BOOL v48 = *(void **)(*(void *)v20 + 8 * v2);
  if (v48)
  {
    char *v26 = *v48;
LABEL_100:
    void *v48 = v26;
    goto LABEL_101;
  }

  char *v26 = *v27;
  void *v27 = v26;
  v47[v2] = v27;
  if (*v26)
  {
    char v49 = *(void *)(*v26 + 8LL);
    if ((v21 & (v21 - 1)) != 0)
    {
      if (v49 >= v21) {
        v49 %= v21;
      }
    }

    else
    {
      v49 &= v21 - 1;
    }

    BOOL v48 = (void *)(*(void *)v20 + 8 * v49);
    goto LABEL_100;
  }

void sub_183E1C0EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unsigned int *CSStore2::String::retain(unsigned int *this)
{
  if (*(void *)this)
  {
    uint64_t v1 = this;
    __int16 v2 = 0LL;
    this = CSStore2::String::getRetainCount((uint64_t)this, (unsigned int **)&v2);
    if ((_DWORD)this) {
      return (unsigned int *)CSStore2::String::setRetainCount( (uint64_t)v1,  (const CSStore2::Store *)((_BYTE)this + 1),  v2);
    }
  }

  return this;
}

_DWORD *CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find( CSStore2 *a1, unsigned int *a2, _DWORD *a3)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  unsigned int v3 = *a2;
  if (!*a2) {
    return 0LL;
  }
  __int16 v6 = (const CSStore2::Store *)*a3;
  if (!(_DWORD)v6) {
    return 0LL;
  }
  if (v3 > 0x2000)
  {
    CSStore2::GetLog(a1);
    char v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      unsigned int v25 = *a2;
      v26[0] = 67109376;
      v26[1] = v25;
      __int16 v27 = 1024;
      int v28 = 0x2000;
      _os_log_error_impl( &dword_183DFE000,  v17,  OS_LOG_TYPE_ERROR,  "Impossible bucket count %u when %u is the maximum.",  (uint8_t *)v26,  0xEu);
    }

    return 0LL;
  }

  uint64_t v8 = CSStore2::_StringFunctions::getHashCode(a1, v6) % *a2;
  uint64_t v9 = a2[2 * v8 + 1];
  if (!(_DWORD)v9) {
    return 0LL;
  }
  if ((_DWORD)v9 == 1)
  {
    uint64_t v10 = a2[2 * v8 + 2];
    if ((_DWORD)v10 != -1)
    {
      uint64_t v11 = *(void *)(*(void *)a1 + 8LL);
      if (*(_DWORD *)(v11 + 12) > v10 && v11 != 0)
      {
        unint64_t v13 = (int *)(v11 + v10);
        int v15 = *v13;
        unsigned int v14 = v13 + 1;
        if (v15 == *a3) {
          return v14;
        }
        else {
          return 0LL;
        }
      }
    }

    return 0LL;
  }

  uint64_t v18 = a2[2 * v8 + 2];
  if ((_DWORD)v18 == -1)
  {
    int v22 = 0LL;
  }

  else
  {
    uint64_t v19 = *(void *)(*(void *)a1 + 8LL);
    unsigned int v20 = *(_DWORD *)(v19 + 12);
    unint64_t v21 = (_DWORD *)(v19 + v18);
    else {
      int v22 = v21;
    }
  }

  uint64_t v23 = 8 * v9;
  unsigned int v24 = &v22[2 * v9];
  while (*v22 != *a3)
  {
    v22 += 2;
    v23 -= 8LL;
    if (!v23)
    {
      int v22 = v24;
      break;
    }
  }

  if (v22 == v24) {
    return 0LL;
  }
  else {
    return v22 + 1;
  }
}

uint64_t CSStore2::_StringFunctions::getHashCode(CSStore2::_StringFunctions *this, const CSStore2::Store *a2)
{
  if (!v8) {
    return 0LL;
  }
  *(_OWORD *)unsigned int v4 = v7;
  char v5 = 1;
  if (BYTE12(v6)) {
    __int16 v2 = v4;
  }
  else {
    __int16 v2 = (char **)v7;
  }
  return CSStore2::_StringFunctions::getHashCode((CSStore2::_StringFunctions *)v2, (const char *)LODWORD(v4[1]));
}

void CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Create( void *a1, CSStore2::_StringFunctions *a2, uint64_t a3, int a4, _DWORD *a5)
{
  unsigned int v10 = *(void *)(a3 + 24) + 10000;
  if (v10 >= 0x2000) {
    unsigned int v11 = 0x2000;
  }
  else {
    unsigned int v11 = *(void *)(a3 + 24) + 10000;
  }
  if (v11 <= 0x10) {
    uint64_t v12 = 16LL;
  }
  else {
    uint64_t v12 = v11;
  }
  size_t v13 = (8 * (_DWORD)v12 + 8 * v10) | 4;
  unsigned int v14 = malloc(v13);
  int v15 = MEMORY[0x1895FB398];
  *a1 = v14;
  a1[1] = v15;
  uint64_t v76 = (_DWORD **)a1;
  if (v14)
  {
    unint64_t v16 = v14;
    bzero(v14, v13);
    *unint64_t v16 = v12;
    size_t v17 = 24LL * v12;
    uint64_t v18 = (void **)operator new(v17);
    uint64_t v19 = v12;
    unsigned int v20 = v18;
    int v72 = v13;
    int v73 = a5;
    uint64_t v75 = v19;
    uint64_t v77 = v18;
    uint64_t v79 = &v18[3 * v19];
    size_t v21 = 24 * ((v17 - 24) / 0x18) + 24;
    bzero(v18, v21);
    int v22 = (void **)((char *)v20 + v21);
    __int128 v78 = v22;
    uint64_t v23 = *(uint64_t ***)(a3 + 16);
    uint64_t v74 = v16;
    if (v23)
    {
      do
      {
        unsigned int v24 = *v76;
        unsigned int v25 = &v77[3
                 * (CSStore2::_StringFunctions::getHashCode( a2,  (const CSStore2::Store *)*((unsigned int *)v23 + 4))
                  % *v24)];
        uint64_t v27 = *((unsigned int *)v23 + 4);
        uint64_t v26 = *((unsigned int *)v23 + 5);
        uint64_t v29 = v25 + 1;
        int v28 = (uint64_t *)v25[1];
        unint64_t v30 = (unint64_t)v25[2];
        if ((unint64_t)v28 >= v30)
        {
          uint64_t v32 = ((char *)v28 - (_BYTE *)*v25) >> 3;
          uint64_t v33 = v30 - (void)*v25;
          uint64_t v34 = v33 >> 2;
          else {
            unint64_t v35 = v34;
          }
          if (v35) {
            unint64_t v35 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v35);
          }
          else {
            uint64_t v36 = 0LL;
          }
          __int128 v37 = (uint64_t *)(v35 + 8 * v32);
          *__int128 v37 = v27 | (v26 << 32);
          NSUInteger v31 = v37 + 1;
          __int128 v38 = (char *)*v29;
          unint64_t v39 = (char *)*v25;
          if (*v29 != *v25)
          {
            do
            {
              uint64_t v40 = *((void *)v38 - 1);
              v38 -= 8;
              *--__int128 v37 = v40;
            }

            while (v38 != v39);
            __int128 v38 = (char *)*v25;
          }

          *unsigned int v25 = v37;
          *uint64_t v29 = v31;
          void v25[2] = (void *)(v35 + 8 * v36);
          if (v38) {
            operator delete(v38);
          }
        }

        else
        {
          *int v28 = v27 | (v26 << 32);
          NSUInteger v31 = v28 + 1;
        }

        *uint64_t v29 = v31;
        uint64_t v23 = (uint64_t **)*v23;
      }

      while (v23);
      unsigned int v20 = v77;
      int v22 = v78;
    }

    if (v20 != v22)
    {
      unsigned int v41 = 0x2710 % v75;
      else {
        unsigned int v42 = 0x2710 / v75;
      }
      do
      {
        int v43 = 0;
        uint64_t v44 = v20[1];
        do
        {
          unint64_t v45 = (unint64_t)v20[2];
          if ((unint64_t)v44 >= v45)
          {
            uint64_t v46 = ((char *)v44 - (_BYTE *)*v20) >> 3;
            uint64_t v47 = v45 - (void)*v20;
            uint64_t v48 = v47 >> 2;
            else {
              unint64_t v49 = v48;
            }
            if (v49) {
              unint64_t v49 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v49);
            }
            else {
              uint64_t v50 = 0LL;
            }
            uint64_t v51 = (void *)(v49 + 8 * v46);
            *uint64_t v51 = 0LL;
            uint64_t v44 = v51 + 1;
            uint64_t v53 = (char *)*v20;
            uint64_t v52 = (char *)v20[1];
            if (v52 != *v20)
            {
              do
              {
                uint64_t v54 = *((void *)v52 - 1);
                v52 -= 8;
                *--uint64_t v51 = v54;
              }

              while (v52 != v53);
              uint64_t v52 = (char *)*v20;
            }

            char *v20 = v51;
            v20[1] = v44;
            void v20[2] = (void *)(v49 + 8 * v50);
            if (v52) {
              operator delete(v52);
            }
          }

          else
          {
            *v44++ = 0LL;
          }

          v20[1] = v44;
          ++v43;
        }

        while (v43 != v42);
        if (v41)
        {
          unint64_t v55 = (unint64_t)v20[2];
          if ((unint64_t)v44 >= v55)
          {
            uint64_t v57 = ((char *)v44 - (_BYTE *)*v20) >> 3;
            uint64_t v58 = v55 - (void)*v20;
            uint64_t v59 = v58 >> 2;
            else {
              unint64_t v60 = v59;
            }
            if (v60) {
              unint64_t v60 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v60);
            }
            else {
              uint64_t v61 = 0LL;
            }
            char v62 = (void *)(v60 + 8 * v57);
            *char v62 = 0LL;
            unint64_t v56 = v62 + 1;
            int v64 = (char *)*v20;
            unint64_t v63 = (char *)v20[1];
            if (v63 != *v20)
            {
              do
              {
                uint64_t v65 = *((void *)v63 - 1);
                v63 -= 8;
                *--char v62 = v65;
              }

              while (v63 != v64);
              unint64_t v63 = (char *)*v20;
            }

            char *v20 = v62;
            v20[1] = v56;
            void v20[2] = (void *)(v60 + 8 * v61);
            if (v63) {
              operator delete(v63);
            }
          }

          else
          {
            *uint64_t v44 = 0LL;
            unint64_t v56 = v44 + 1;
          }

          v20[1] = v56;
          --v41;
        }

        v20 += 3;
      }

      while (v20 != v22);
    }

    uint64_t v66 = 0LL;
    NSUInteger v67 = (NSUInteger)&v74[2 * v75 + 1];
    unint64_t v68 = *v76;
    unsigned int v69 = *v76 + 2;
    do
    {
      NSUInteger v70 = (NSUInteger)v77[v66];
      NSUInteger v71 = (NSUInteger)v77[v66 + 1] - v70;
      *(v69 - 1) = v71 >> 3;
      *unsigned int v69 = v67 - (_DWORD)v68 + a4;
      v67 += v71 & 0x7FFFFFFF8LL;
      v66 += 3LL;
      v69 += 2;
    }

    while (3 * v75 != v66);
    uint64_t v80 = &v77;
    std::vector<std::vector<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair,std::allocator<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair>>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v80);
    LODWORD(v13) = v72;
    a5 = v73;
  }

  if (a5) {
    *a5 = v13;
  }
}

void sub_183E1C7C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  *a14 = 0LL;
  MEMORY[0x1895FB398](v14);
  _Unwind_Resume(a1);
}

unsigned int *CSStore2::String::getRetainCount(uint64_t a1, unsigned int **a2)
{
  if (a2) {
    *a2 = 0LL;
  }
  if (!*(void *)a1 || *(_BYTE *)(a1 + 12)) {
    return 0LL;
  }
  double result = CSStore2::getStringCacheEntry(*(CSStore2 **)a1, (const CSStore2::Store *)*(unsigned int *)(a1 + 8));
  if (result)
  {
    unsigned int v4 = result;
    double result = (unsigned int *)*(unsigned __int8 *)result;
    if (a2) {
      *a2 = v4;
    }
  }

  return result;
}

CSStore2 *CSStore2::String::setRetainCount(uint64_t a1, const CSStore2::Store *a2, CSStore2 *a3)
{
  double result = *(CSStore2 **)a1;
  if (result)
  {
    if (!*(_BYTE *)(a1 + 12))
    {
      int v5 = (int)a2;
      if (a3
        || (double result = (CSStore2 *)CSStore2::getStringCacheEntry( result,  (const CSStore2::Store *)*(unsigned int *)(a1 + 8)),  (a3 = result) != 0LL))
      {
        if (*(unsigned __int8 *)a3 != v5)
        {
          int v6 = *(_DWORD *)a3;
          double result = (CSStore2 *)CSStore2::getStringCache(*(CSStore2 **)a1, a2);
          if (result)
          {
            __int128 v7 = (unsigned int *)result;
            double result = *(CSStore2 **)a1;
            int v8 = *(_DWORD *)(a1 + 8);
            if (v8)
            {
              double result = (CSStore2 *)CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find( result,  v7,  &v8);
              if (result) {
                *(_DWORD *)double result = v6 & 0xFFFFFF00 | v5;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

unsigned int *CSStore2::getStringCacheEntry(CSStore2 *this, const CSStore2::Store *a2)
{
  int v4 = (int)a2;
  double result = (unsigned int *)CSStore2::getStringCache(this, a2);
  if (result) {
    return CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find( this,  result,  &v4);
  }
  return result;
}

id CSStore2::String::getNSStringNoCopy(CSStore2::String *this)
{
  id v2 = objc_alloc(NSString);
  unsigned int v3 = (void *)((char *)this + 16);
  if (!*((_BYTE *)this + 12)) {
    unsigned int v3 = (void *)*v3;
  }
  return (id)[v2 initWithBytesNoCopy:v3 length:*((unsigned int *)this + 6) encoding:4 freeWhenDone:0];
}

void ___ZNK8CSStore26String19getDebugDescriptionEv_block_invoke(uint64_t a1)
{
}

uint64_t __copy_helper_block_ea8_32c52_ZTSKZNK8CSStore26String19getDebugDescriptionEvE3__0( uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

uint64_t CSStore2::String::GetUTF8BufferFromNSString(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (([v3 getCString:a2 maxLength:1024 encoding:4] & 1) == 0) {
    a2 = [v3 UTF8String];
  }

  return a2;
}

void sub_183E1CA30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Unit *CSStore2::String::release(Unit *this)
{
  if (*this)
  {
    uint64_t v1 = (unsigned int *)this;
    unsigned int v10 = 0LL;
    this = (Unit *)CSStore2::String::getRetainCount((uint64_t)this, (unsigned int **)&v10);
    if ((_DWORD)this)
    {
      if ((_DWORD)this == 1)
      {
        id v2 = *(CSStore2 ***)v1;
        id v3 = *(const CSStore2::Table **)(*(void *)v1 + 272LL);
        if (!v3)
        {
          this = (Unit *)CSStore2::Store::getTable(v2, @"<string>");
          if (!this) {
            return this;
          }
          id v3 = (const CSStore2::Table *)this;
          id v2 = *(CSStore2 ***)v1;
        }

        this = (Unit *)CSStore2::Store::getUnit(v2, v3, v1[2]);
        if (this)
        {
          int v5 = this;
          int v6 = *(CSStore2 **)v1;
          unsigned int v11 = v1[2];
          unsigned int v7 = v11;
          StringCache = (unsigned int *)CSStore2::getStringCache(v6, v4);
          if (v7 && StringCache)
          {
            uint64_t v9 = CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find( v6,  StringCache,  &v11);
            if (v9) {
              *uint64_t v9 = 0;
            }
          }

          return CSStore2::Store::freeUnit(*(CSStore2 ***)v1, v3, v5);
        }
      }

      else
      {
        return (Unit *)CSStore2::String::setRetainCount( (uint64_t)v1,  (const CSStore2::Store *)((_BYTE)this - 1),  v10);
      }
    }
  }

  return this;
}

id CSStore2::String::GetDebugDescriptionOfCache(CSStore2::String *this, const CSStore2::Store *a2)
{
  StringCache = CSStore2::getStringCache(this, a2);
  if (StringCache)
  {
    int v4 = (unsigned int *)StringCache;
    id v5 = objc_alloc_init(MEMORY[0x189607940]);
    if (CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::once != -1) {
      dispatch_once( &CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::once,  &__block_literal_global_314);
    }
    id v6 = (id)CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::result;
    unsigned int v7 = v6;
    uint64_t v8 = *(void *)this;
    if (*(void *)this) {
      unint64_t v9 = *(void *)(v8 + 8);
    }
    else {
      unint64_t v9 = 0LL;
    }
    uint64_t v10 = 0xFFFFFFFFLL;
    BOOL v11 = (unint64_t)v4 >= v9;
    unint64_t v12 = (unint64_t)v4 - v9;
    if (v11 && !HIDWORD(v12))
    {
      BOOL v13 = (v12 + 1) > *(_DWORD *)(*(void *)(v8 + 8) + 12LL) || v12 == -1;
      uint64_t v10 = v12;
      if (v13) {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
    }

    [v5 appendFormat:@"%@ @ 0x%llx", v6, v10];

    unint64_t Statistics = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics(v4);
    objc_msgSend( v5,  "appendFormat:",  @" { buckets = %llu, count = %llu }",  HIDWORD(Statistics),  Statistics);
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

void sub_183E1CC3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore2L10NameOfTypeINS_7HashMapIjNS_17_StringCacheEntryENS_16_StringFunctionsELy0EEEEEP8NSStringv_block_invoke()
{
  std::string::basic_string[abi:nn180100]<0>( &__p,  "NSString *CSStore2::NameOfType() [T = CSStore2::HashMap<unsigned int, CSStore2::_StringCacheEntry, CSStore2::_String Functions>]_block_invoke");
  uint64_t v0 = CSStore2::_CopyNameOfTypeImpl(&__p);
  uint64_t v1 = (void *)CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::result;
  CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::double result = v0;
}

void sub_183E1CCB4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *___ZN8CSStore27HashMapIjNS_17_StringCacheEntryENS_16_StringFunctionsELy0EE14WriteBreakdownERKNS_5StoreEPKS3_hPh_block_invoke( uint64_t a1, unsigned int a2, size_t __len, int a4, int a5)
{
  if (a4) {
    int v5 = 64;
  }
  else {
    int v5 = -128;
  }
  return memset( (void *)(*(void *)(a1 + 32) + a2),  (v5 | a5 ^ 1) & 0xFFFFFFC1 | (2 * (*(_BYTE *)(a1 + 40) & 0x1F)),  __len);
}

double CSStore2::getOrCopyStringFrom4CC(CSStore2 *this, char **a2, unsigned int a3, int a4)
{
  *(_DWORD *)unint64_t v9 = bswap32(a3);
  char v10 = 0;
  if (a4) {
    CSStore2::String::Create((CSStore2::String *)v7, a2, (CSStore2::_StringFunctions *)v9, (const char *)4);
  }
  else {
    CSStore2::String::Find( (CSStore2::String *)v7,  (CSStore2::Store *)a2,  (CSStore2::_StringFunctions *)v9,  (const char *)4);
  }
  *(_BYTE *)this = 0;
  *((_BYTE *)this + 32) = 0;
  if (v8)
  {
    double result = *(double *)v7;
    __int128 v6 = v7[1];
    *(_OWORD *)this = v7[0];
    *((_OWORD *)this + 1) = v6;
    *((_BYTE *)this + 32) = 1;
  }

  return result;
}

double CSStore2::Dictionary::_CopyCanonicalKey( CSStore2::Dictionary *this, char **a2, unsigned int a3, char a4)
{
  *(_BYTE *)this = 0;
  *((_BYTE *)this + 32) = 0;
  if ((a4 & 1) != 0)
  {
    double result = CSStore2::getOrCopyStringFrom4CC((CSStore2 *)&v9, a2, a3, 1);
    if (v11)
    {
      double result = *(double *)&v9;
      __int128 v8 = v10;
      *(_OWORD *)this = v9;
      *((_OWORD *)this + 1) = v8;
      *((_BYTE *)this + 32) = 1;
    }
  }

  else
  {
    CSStore2::String::Get(&v9, (CSStore2::Store *)a2, a3);
    double result = *(double *)&v9;
    __int128 v6 = v10;
    *(_OWORD *)this = v9;
    *((_OWORD *)this + 1) = v6;
    char v7 = v11;
    *((_BYTE *)this + 32) = v11;
    if (v7) {
      CSStore2::String::retain((unsigned int *)this);
    }
  }

  return result;
}

unsigned int *CSStore2::Dictionary::_TakeOwnershipOfValue(unsigned int *this, CSStore2::Store *a2, int a3)
{
  if (a3 == 1)
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    this = CSStore2::String::Get(v5, (CSStore2::Store *)this, a2);
    if (v6) {
      return CSStore2::String::retain(v5);
    }
  }

  return this;
}

CSStore2::Store *CSStore2::Dictionary::_RelinquishOwnershipOfValue( CSStore2::Store *this, CSStore2::Store *a2, unsigned int a3)
{
  uint64_t v4 = this;
  switch(a3)
  {
    case 1u:
      this = (CSStore2::Store *)CSStore2::String::Get(v6, this, a2);
      if (v8) {
        this = (CSStore2::Store *)CSStore2::String::release(v6);
      }
      break;
    case 2u:
      goto LABEL_7;
    case 3u:
      CSStore2::Array::Get((CSStore2::Array *)v6, this, a2);
      if (v7)
      {
        v5[0] = MEMORY[0x1895F87A8];
        v5[1] = 3221225472LL;
        v5[2] = ___ZN8CSStore210Dictionary27_RelinquishOwnershipOfValueERNS_5StoreEjh_block_invoke;
        v5[3] = &__block_descriptor_40_e17_v28__0I8r_I12_B20l;
        void v5[4] = v4;
        CSStore2::Array::enumerateValues((uint64_t)v6, v5);
      }

void CSStore2::Array::Get(CSStore2::Array *this, CSStore2::Store *a2, unsigned int a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  *(_BYTE *)this = 0;
  *((_BYTE *)this + 24) = 0;
  Table = (char *)*((void *)a2 + 33);
  if (Table || (Table = CSStore2::Store::getTable((CSStore2 **)a2, @"<array>")) != 0LL)
  {
    Unit = (unsigned int *)CSStore2::Store::getUnit((CSStore2 **)a2, (const CSStore2::Table *)Table, a3);
    if (Unit)
    {
      *((_BYTE *)this + 24) = 1;
      *(void *)this = a2;
      *((void *)this + 1) = Unit + 2;
      *((void *)this + 2) = 0LL;
      *((_DWORD *)this + 5) = a3;
      uint64_t v8 = Unit[1];
      if (v8 <= 3)
      {
        CSStore2::GetLog((CSStore2 *)Unit);
        __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v13 = 134217984;
          uint64_t v14 = v8;
          _os_log_error_impl( &dword_183DFE000,  v10,  OS_LOG_TYPE_ERROR,  "Underflow getting array capacity (%llu)",  (uint8_t *)&v13,  0xCu);
        }

        CSStore2::GetLog(v11);
        unint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v13) = 0;
          _os_log_error_impl( &dword_183DFE000,  v12,  OS_LOG_TYPE_ERROR,  "Size of array unit was invalid for a CSArray; discarding",
            (uint8_t *)&v13,
            2u);
        }

        *(_BYTE *)this = 0;
        *((_BYTE *)this + 24) = 0;
      }

      else
      {
        char v9 = 1;
        if ((Unit[2] & 0x20000000) == 0) {
          char v9 = 2;
        }
        *((_DWORD *)this + 4) = (unint64_t)(v8 - 4) >> v9;
      }
    }
  }

Unit *___ZN8CSStore210Dictionary27_RelinquishOwnershipOfValueERNS_5StoreEjh_block_invoke( uint64_t a1, uint64_t a2, unsigned int *a3)
{
  double result = (Unit *)CSStore2::String::Get(v4, *(CSStore2::Store **)(a1 + 32), *a3);
  if (v5) {
    return CSStore2::String::release(v4);
  }
  return result;
}

void CSStore2::Array::enumerateValues(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = *(_DWORD **)(a1 + 8);
  unsigned int v5 = *v4 & 0x1FFFFFFF;
  unsigned int v6 = *(_DWORD *)(a1 + 16);
  if (v5 >= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v5;
  }
  if (v7 > 0xFF)
  {
    CSStore2::Array::getAllValues(&v21, a1);
    std::vector<unsigned int>::pointer begin = v21.__begin_;
    LOBYTE(v21.__begin_) = 0;
    std::vector<unsigned int>::pointer v13 = begin;
  }

  else
  {
    if ((*v4 & 0x20000000) != 0)
    {
      if (!(_DWORD)v7) {
        goto LABEL_23;
      }
      uint64_t v14 = (unsigned __int16 *)(v4 + 1);
      uint64_t v15 = v22;
      int v16 = v7;
      do
      {
        int v17 = *v14++;
        *v15++ = v17;
        --v16;
      }

      while (v16);
    }

    else
    {
      if (!(_DWORD)v7) {
        goto LABEL_23;
      }
      uint64_t v8 = v4 + 1;
      char v9 = v22;
      int v10 = v7;
      do
      {
        int v11 = *v8++;
        *v9++ = v11;
        --v10;
      }

      while (v10);
    }

    LOBYTE(v21.__begin_) = 0;
    std::vector<unsigned int>::pointer v13 = 0LL;
    std::vector<unsigned int>::pointer begin = (std::vector<unsigned int>::pointer)v22;
  }

  uint64_t v18 = 0LL;
  uint64_t v19 = v7 - 1;
  do
  {
    v3[2](v3, v18, begin, &v21);
    if (LOBYTE(v21.__begin_)) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = v19 == v18;
    }
    ++v18;
    ++begin;
  }

  while (!v20);
  if (v13) {
    operator delete(v13);
  }
LABEL_23:
}

void sub_183E1D208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Unit *CSStore2::Array::Dispose(CSStore2::Array *this, CSStore2::Store *a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = (const CSStore2::Table *)*((void *)this + 33);
  if (v4
    || (double result = (Unit *)CSStore2::Store::getTable((CSStore2 **)this, @"<array>"),
        (uint64_t v4 = (const CSStore2::Table *)result) != 0LL))
  {
    double result = (Unit *)CSStore2::Store::getUnit((CSStore2 **)this, v4, v2);
    if (result) {
      return CSStore2::Store::freeUnit((CSStore2 **)this, v4, result);
    }
  }

  return result;
}

Unit *CSStore2::Dictionary::Dispose(const CSStore2::Table **this, CSStore2::Store *a2)
{
  unsigned int v2 = a2;
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)v6, (CSStore2::Store *)this, a2);
  if (v7 && *((_BYTE *)v6[1] + 1)) {
    CSStore2::Dictionary::removeAllValues(v6);
  }
  uint64_t v4 = this[35];
  if (v4
    || (double result = (Unit *)CSStore2::Store::getTable(this, @"<dictionary>"),
        (uint64_t v4 = (const CSStore2::Table *)result) != 0LL))
  {
    double result = (Unit *)CSStore2::Store::getUnit(this, v4, v2);
    if (result) {
      return CSStore2::Store::freeUnit(this, v4, result);
    }
  }

  return result;
}

char *CSStore2::Dictionary::Get(CSStore2::Dictionary *this, CSStore2::Store *a2, unsigned int a3)
{
  *(_BYTE *)this = 0;
  *((_BYTE *)this + 24) = 0;
  unsigned int v6 = (const CSStore2::Table *)*((void *)a2 + 35);
  if (v6
    || (double result = CSStore2::Store::getTable((CSStore2 **)a2, @"<dictionary>"),
        (unsigned int v6 = (const CSStore2::Table *)result) != 0LL))
  {
    double result = CSStore2::Store::getUnit((CSStore2 **)a2, v6, a3);
    if (result)
    {
      *((_BYTE *)this + 24) = 1;
      *(void *)this = a2;
      *((void *)this + 1) = result + 8;
      *((void *)this + 2) = 0LL;
      *((_DWORD *)this + 4) = a3;
    }
  }

  return result;
}

uint64_t CSStore2::Dictionary::removeAllValues(CSStore2::Store **this)
{
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = ___ZN8CSStore210Dictionary15removeAllValuesEv_block_invoke;
  v8[3] = &__block_descriptor_40_e15_v24__0I8I12_B16l;
  v8[4] = this;
  CSStore2::Dictionary::enumerateKeysAndValues((unint64_t)this, 1, v8);
  unsigned int v2 = *this;
  uint64_t v3 = *((unsigned int *)this[1] + 1);
  if ((_DWORD)v3 != -1)
  {
    uint64_t v4 = *(void *)(*(void *)v2 + 8LL);
    if (*(_DWORD *)(v4 + 12) > v3)
    {
      uint64_t v5 = *(unsigned int *)(v4 + v3);
      if ((_DWORD)v5)
      {
        unsigned int v6 = (void *)(v3 + v4 + 4);
        do
        {
          *v6++ = 0xFFFFFFFF00000000LL;
          --v5;
        }

        while (v5);
      }
    }
  }

  return CSStore2::Store::collectGarbage(v2, 0LL);
}

CSStore2::Store *___ZN8CSStore210Dictionary15removeAllValuesEv_block_invoke( uint64_t a1, unsigned int a2, CSStore2::Store *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  CSStore2::String::Get(v6, *(CSStore2::Store **)v4, a2);
  if (v7) {
    CSStore2::String::release(v6);
  }
  return CSStore2::Dictionary::_RelinquishOwnershipOfValue( *(CSStore2::Store **)v4,  a3,  *(unsigned __int8 *)(*(void *)(v4 + 8) + 1LL));
}

void CSStore2::Dictionary::enumerateKeysAndValues(unint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t k = v5;
  char v7 = *(char **)(a1 + 8);
  uint64_t v8 = *((unsigned int *)v7 + 1);
  if ((_DWORD)v8 == -1) {
    goto LABEL_94;
  }
  unint64_t v56 = *(CSStore2::Store **)a1;
  uint64_t v9 = *(void *)(**(void **)a1 + 8LL);
  int v10 = (unsigned int *)(v9 + v8);
  char v11 = *v7;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  float v60 = 1.0;
  unint64_t v12 = *v10;
  if (!(_DWORD)v12) {
    goto LABEL_93;
  }
  id v54 = v5;
  unint64_t v55 = v10;
  unint64_t v13 = 0LL;
  if ((v11 & 1) != 0) {
    char v14 = a2;
  }
  else {
    char v14 = 1;
  }
  char v57 = v14;
  do
  {
    uint64_t v15 = &v10[2 * v13];
    unsigned int v18 = v15[1];
    int v17 = v15 + 1;
    unsigned int v16 = v18;
    if (v18 - 0x20000000 >= 0xE0000001)
    {
      uint64_t v19 = v10[2 * v13 + 2];
      unsigned int v20 = v19 + 8 * v16;
      if (!__CFADD__((_DWORD)v19, 8 * v16))
      {
        uint64_t v21 = *(void *)(*(void *)v56 + 8LL);
        unsigned int v22 = *(_DWORD *)(v21 + 12);
        if (v20 <= v22 && v22 > v19)
        {
          uint64_t v24 = 0LL;
          uint64_t v25 = v21 + v19;
          while (1)
          {
            uint64_t v26 = (unsigned int *)(v25 + 8 * v24);
            uint64_t v27 = v26 + 1;
            if (v26[1])
            {
              if ((v57 & 1) != 0)
              {
                unint64_t v28 = *v26;
                unint64_t v29 = *((void *)&v58 + 1);
                if (*((void *)&v58 + 1))
                {
                  uint8x8_t v30 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v58 + 8));
                  v30.i16[0] = vaddlv_u8(v30);
                  if (v30.u32[0] > 1uLL)
                  {
                    a1 = *v26;
                    if (*((void *)&v58 + 1) <= v28) {
                      a1 = v28 % *((void *)&v58 + 1);
                    }
                  }

                  else
                  {
                    a1 = (DWORD2(v58) - 1) & v28;
                  }

                  uint64_t v34 = *(uint64_t ***)(v58 + 8 * a1);
                  if (v34)
                  {
                    for (uint64_t i = *v34; i; uint64_t i = (uint64_t *)*i)
                    {
                      unint64_t v36 = i[1];
                      if (v36 == v28)
                      {
                        if (*((_DWORD *)i + 4) == (_DWORD)v28) {
                          goto LABEL_87;
                        }
                      }

                      else
                      {
                        if (v30.u32[0] > 1uLL)
                        {
                          if (v36 >= *((void *)&v58 + 1)) {
                            v36 %= *((void *)&v58 + 1);
                          }
                        }

                        else
                        {
                          v36 &= *((void *)&v58 + 1) - 1LL;
                        }

                        if (v36 != a1) {
                          break;
                        }
                      }
                    }
                  }
                }

                __int128 v37 = operator new(0x18uLL);
                *__int128 v37 = 0LL;
                v37[1] = v28;
                *((_DWORD *)v37 + 4) = *v26;
                *((_DWORD *)v37 + 5) = *v27;
                float v38 = (float)(unint64_t)(*((void *)&v59 + 1) + 1LL);
                if (!v29 || (float)(v60 * (float)v29) < v38)
                {
                  BOOL v39 = (v29 & (v29 - 1)) != 0;
                  if (v29 < 3) {
                    BOOL v39 = 1LL;
                  }
                  unint64_t v40 = v39 | (2 * v29);
                  unint64_t v41 = vcvtps_u32_f32(v38 / v60);
                  if (v40 <= v41) {
                    size_t v42 = v41;
                  }
                  else {
                    size_t v42 = v40;
                  }
                  goto LABEL_72;
                }

                goto LABEL_77;
              }

              CSStore2::String::Get(__dst, v56, *v26);
              if (v65)
              {
                __int128 v61 = __dst[0];
                __int128 v62 = __dst[1];
                char v63 = 1;
                LODWORD(__dst[0]) = 0;
                if (BYTE12(v61)) {
                  NSUInteger v31 = &v62;
                }
                else {
                  NSUInteger v31 = (__int128 *)v62;
                }
                if (DWORD2(v62) >= 4) {
                  size_t v32 = 4LL;
                }
                else {
                  size_t v32 = DWORD2(v62);
                }
                memcpy(__dst, v31, v32);
                unint64_t v28 = bswap32(__dst[0]);
                unint64_t v29 = *((void *)&v58 + 1);
                if (*((void *)&v58 + 1))
                {
                  uint8x8_t v33 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v58 + 8));
                  v33.i16[0] = vaddlv_u8(v33);
                  if (v33.u32[0] > 1uLL)
                  {
                    a1 = v28;
                    if (*((void *)&v58 + 1) <= v28) {
                      a1 = v28 % *((void *)&v58 + 1);
                    }
                  }

                  else
                  {
                    a1 = (DWORD2(v58) - 1) & v28;
                  }

                  int v43 = *(uint64_t ***)(v58 + 8 * a1);
                  if (v43)
                  {
                    for (uint64_t j = *v43; j; uint64_t j = (uint64_t *)*j)
                    {
                      unint64_t v45 = j[1];
                      if (v45 == v28)
                      {
                        if (*((_DWORD *)j + 4) == (_DWORD)v28) {
                          goto LABEL_87;
                        }
                      }

                      else
                      {
                        if (v33.u32[0] > 1uLL)
                        {
                          if (v45 >= *((void *)&v58 + 1)) {
                            v45 %= *((void *)&v58 + 1);
                          }
                        }

                        else
                        {
                          v45 &= *((void *)&v58 + 1) - 1LL;
                        }

                        if (v45 != a1) {
                          break;
                        }
                      }
                    }
                  }
                }

                __int128 v37 = operator new(0x18uLL);
                *__int128 v37 = 0LL;
                v37[1] = v28;
                *((_DWORD *)v37 + 4) = v28;
                *((_DWORD *)v37 + 5) = *v27;
                float v46 = (float)(unint64_t)(*((void *)&v59 + 1) + 1LL);
                if (!v29 || (float)(v60 * (float)v29) < v46)
                {
                  BOOL v47 = (v29 & (v29 - 1)) != 0;
                  if (v29 < 3) {
                    BOOL v47 = 1LL;
                  }
                  unint64_t v48 = v47 | (2 * v29);
                  unint64_t v49 = vcvtps_u32_f32(v46 / v60);
                  if (v48 <= v49) {
                    size_t v42 = v49;
                  }
                  else {
                    size_t v42 = v48;
                  }
LABEL_72:
                  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>( (uint64_t)&v58,  v42);
                  unint64_t v29 = *((void *)&v58 + 1);
                  if ((*((void *)&v58 + 1) & (*((void *)&v58 + 1) - 1LL)) != 0)
                  {
                    if (*((void *)&v58 + 1) <= v28) {
                      a1 = v28 % *((void *)&v58 + 1);
                    }
                    else {
                      a1 = v28;
                    }
                  }

                  else
                  {
                    a1 = (DWORD2(v58) - 1) & v28;
                  }
                }

LABEL_77:
                uint64_t v50 = v58;
                uint64_t v51 = *(void **)(v58 + 8 * a1);
                if (v51)
                {
                  *__int128 v37 = *v51;
                  goto LABEL_85;
                }

                *__int128 v37 = v59;
                *(void *)&__int128 v59 = v37;
                *(void *)(v50 + 8 * a1) = &v59;
                if (*v37)
                {
                  unint64_t v52 = *(void *)(*v37 + 8LL);
                  if ((v29 & (v29 - 1)) != 0)
                  {
                    if (v52 >= v29) {
                      v52 %= v29;
                    }
                  }

                  else
                  {
                    v52 &= v29 - 1;
                  }

                  uint64_t v51 = (void *)(v58 + 8 * v52);
LABEL_85:
                  *uint64_t v51 = v37;
                }

                ++*((void *)&v59 + 1);
                goto LABEL_87;
              }

              LOBYTE(v61) = 0;
              char v63 = 0;
            }

LABEL_93:
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v58);
LABEL_94:
}

void sub_183E1D9AC( _Unwind_Exception *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  _Unwind_Resume(a1);
}

void CSStore2::Array::getAllValues(std::vector<unsigned int> *this, uint64_t a2)
{
  this->__begin_ = 0LL;
  this->__end_ = 0LL;
  this->__end_cap_.__value_ = 0LL;
  p_end_cap = (std::allocator<unsigned int> *)&this->__end_cap_;
  unsigned int v5 = **(_DWORD **)(a2 + 8) & 0x1FFFFFFF;
  unsigned int v6 = *(_DWORD *)(a2 + 16);
  if (v5 >= v6) {
    int64_t v7 = v6;
  }
  else {
    int64_t v7 = v5;
  }
  if ((_DWORD)v7)
  {
    uint64_t v9 = (unsigned int *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v7);
    std::vector<unsigned int>::pointer begin = this->__begin_;
    std::vector<unsigned int>::pointer end = this->__end_;
    unint64_t v12 = v9;
    while (end != begin)
    {
      unsigned int v13 = *--end;
      *--unint64_t v12 = v13;
    }

    this->__begin_ = v12;
    this->__end_ = v9;
    this->__end_cap_.__value_ = &v9[v8];
    if (begin)
    {
      operator delete(begin);
      uint64_t v9 = this->__end_;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  uint64_t v14 = *(void *)(a2 + 8);
  uint64_t v15 = (unsigned __int16 *)(v14 + 4);
  std::vector<unsigned int>::pointer v16 = this->__begin_;
  uint64_t v17 = v9 - this->__begin_;
  if ((*(_BYTE *)(v14 + 3) & 0x20) == 0)
  {
    if (!(_DWORD)v7) {
      return;
    }
    if (v7 <= (uint64_t)(*(void *)p_end_cap - (void)v9) >> 2)
    {
      memmove(v9, v15, 4 * v7);
      this->__end_ = &v9[v7];
      return;
    }

    if (!((unint64_t)(v17 + v7) >> 62))
    {
      uint64_t v18 = *(void *)p_end_cap - (void)v16;
      uint64_t v19 = v18 >> 1;
      else {
        unint64_t v20 = v19;
      }
      __v.__end_cap_.__value_ = p_end_cap;
      if (v20) {
        unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v20);
      }
      else {
        uint64_t v21 = 0LL;
      }
      uint8x8_t v30 = (unsigned int *)(v20 + 4 * v17);
      __v.__first_ = (std::__split_buffer<unsigned int>::pointer)v20;
      __v.__begin_ = v30;
      __v.__end_cap_.__value_ = (unsigned int *)(v20 + 4 * v21);
      uint64_t v31 = 4 * v7;
      size_t v32 = &v30[v7];
      do
      {
        unsigned int v33 = *(_DWORD *)v15;
        v15 += 2;
        *v30++ = v33;
        v31 -= 4LL;
      }

      while (v31);
LABEL_43:
      __v.__end_ = v32;
      std::vector<unsigned int>::__swap_out_circular_buffer(this, &__v, v9);
      if (__v.__first_) {
        operator delete(__v.__first_);
      }
      return;
    }

    goto LABEL_46;
  }

  if (!(_DWORD)v7) {
    return;
  }
  if (v7 > (uint64_t)(*(void *)p_end_cap - (void)v9) >> 2)
  {
    if (!((unint64_t)(v17 + v7) >> 62))
    {
      uint64_t v22 = *(void *)p_end_cap - (void)v16;
      uint64_t v23 = v22 >> 1;
      else {
        unint64_t v24 = v23;
      }
      __v.__end_cap_.__value_ = p_end_cap;
      if (v24) {
        unint64_t v24 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v24);
      }
      else {
        uint64_t v25 = 0LL;
      }
      uint64_t v34 = (unsigned int *)(v24 + 4 * v17);
      __v.__first_ = (std::__split_buffer<unsigned int>::pointer)v24;
      __v.__begin_ = v34;
      __v.__end_cap_.__value_ = (unsigned int *)(v24 + 4 * v25);
      uint64_t v35 = 4 * v7;
      size_t v32 = &v34[v7];
      do
      {
        unsigned int v36 = *v15++;
        *v34++ = v36;
        v35 -= 4LL;
      }

      while (v35);
      goto LABEL_43;
    }

LABEL_46:
    abort();
  }

  uint64_t v26 = 2 * v7;
  uint64_t v27 = (unsigned __int16 *)(v14 + 4);
  unint64_t v28 = v9;
  do
  {
    unsigned int v29 = *v27++;
    *v28++ = v29;
    v26 -= 2LL;
  }

  while (v26);
  this->__end_ = v28;
}

void sub_183E1DD3C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(va, 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

std::vector<unsigned int>::pointer std::vector<unsigned int>::__swap_out_circular_buffer( std::vector<unsigned int> *this, std::__split_buffer<unsigned int> *__v, std::vector<unsigned int>::pointer __p)
{
  std::vector<unsigned int>::pointer begin = __v->__begin_;
  std::vector<unsigned int>::pointer v6 = this->__begin_;
  int64_t v7 = begin;
  if (this->__begin_ != __p)
  {
    std::vector<unsigned int>::pointer v8 = __p;
    int64_t v7 = __v->__begin_;
    do
    {
      unsigned int v9 = *--v8;
      *--int64_t v7 = v9;
    }

    while (v8 != v6);
  }

  __v->__begin_ = v7;
  std::vector<unsigned int>::pointer end = this->__end_;
  std::__split_buffer<unsigned int>::pointer v11 = __v->__end_;
  int64_t v12 = (char *)end - (char *)__p;
  if (end != __p)
  {
    memmove(__v->__end_, __p, (char *)end - (char *)__p);
    int64_t v7 = __v->__begin_;
  }

  __v->__end_ = (std::__split_buffer<unsigned int>::pointer)((char *)v11 + v12);
  unsigned int v13 = this->__begin_;
  this->__begin_ = v7;
  __v->__begin_ = v13;
  uint64_t v14 = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = v14;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
  return begin;
}

void CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Create( _DWORD **a1, uint64_t a2, int a3, unsigned int a4, _DWORD *a5)
{
  unsigned int v9 = *(void *)(a2 + 24) + a4;
  if (v9 >= 0x2000) {
    unsigned int v10 = 0x2000;
  }
  else {
    unsigned int v10 = *(void *)(a2 + 24) + a4;
  }
  if (v10 <= 0x10) {
    uint64_t v11 = 16LL;
  }
  else {
    uint64_t v11 = v10;
  }
  size_t v12 = (8 * (_DWORD)v11 + 8 * v9) | 4;
  unsigned int v13 = malloc(v12);
  uint64_t v14 = MEMORY[0x1895FB398];
  *a1 = v13;
  a1[1] = v14;
  if (v13)
  {
    uint64_t v15 = v13;
    int v72 = a3;
    bzero(v13, v12);
    int v73 = v15;
    _DWORD *v15 = v11;
    std::vector<unsigned int>::pointer v16 = (void **)operator new(24LL * v11);
    int v70 = v12;
    NSUInteger v71 = a5;
    uint64_t v75 = v16;
    uint64_t v77 = &v16[3 * v11];
    size_t v17 = 24 * ((24 * (unint64_t)v11 - 24) / 0x18) + 24;
    bzero(v16, v17);
    uint64_t v18 = (void **)((char *)v16 + v17);
    uint64_t v76 = v18;
    uint64_t v19 = *(uint64_t **)(a2 + 16);
    if (v19)
    {
      do
      {
        unint64_t v20 = a1;
        unsigned int v21 = **a1;
        uint64_t v22 = *((unsigned int *)v19 + 4);
        uint64_t v23 = *((unsigned int *)v19 + 5);
        unint64_t v24 = &v75[3 * ((unsigned __int16)*((_DWORD *)v19 + 4) % v21)];
        uint64_t v25 = v24 + 1;
        uint64_t v26 = (uint64_t *)v24[1];
        unint64_t v27 = (unint64_t)v24[2];
        if ((unint64_t)v26 >= v27)
        {
          uint64_t v29 = ((char *)v26 - (_BYTE *)*v24) >> 3;
          uint64_t v30 = v27 - (void)*v24;
          uint64_t v31 = v30 >> 2;
          else {
            unint64_t v32 = v31;
          }
          if (v32) {
            unint64_t v32 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v32);
          }
          else {
            uint64_t v33 = 0LL;
          }
          uint64_t v34 = (uint64_t *)(v32 + 8 * v29);
          *uint64_t v34 = v22 | (v23 << 32);
          unint64_t v28 = v34 + 1;
          uint64_t v35 = (char *)*v25;
          unsigned int v36 = (char *)*v24;
          a1 = (_DWORD **)v20;
          if (*v25 != *v24)
          {
            do
            {
              uint64_t v37 = *((void *)v35 - 1);
              v35 -= 8;
              *--uint64_t v34 = v37;
            }

            while (v35 != v36);
            uint64_t v35 = (char *)*v24;
          }

          *unint64_t v24 = v34;
          *uint64_t v25 = v28;
          void v24[2] = (void *)(v32 + 8 * v33);
          if (v35) {
            operator delete(v35);
          }
        }

        else
        {
          uint64_t *v26 = v22 | (v23 << 32);
          unint64_t v28 = v26 + 1;
          a1 = (_DWORD **)v20;
        }

        *uint64_t v25 = v28;
        uint64_t v19 = (uint64_t *)*v19;
      }

      while (v19);
      std::vector<unsigned int>::pointer v16 = v75;
      uint64_t v18 = v76;
    }

    else
    {
      unint64_t v20 = a1;
    }

    if (v16 != v18)
    {
      unsigned int v38 = a4 % v11;
      else {
        unsigned int v39 = a4 / v11;
      }
      do
      {
        if (v11 <= a4)
        {
          int v40 = 0;
          unint64_t v41 = (char *)v16[1];
          do
          {
            unint64_t v42 = (unint64_t)v16[2];
            if ((unint64_t)v41 >= v42)
            {
              uint64_t v43 = (v41 - (_BYTE *)*v16) >> 3;
              uint64_t v44 = v42 - (void)*v16;
              uint64_t v45 = v44 >> 2;
              else {
                unint64_t v46 = v45;
              }
              if (v46) {
                unint64_t v46 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v46);
              }
              else {
                uint64_t v47 = 0LL;
              }
              unint64_t v48 = (char *)(v46 + 8 * v43);
              *(void *)unint64_t v48 = 0LL;
              unint64_t v41 = v48 + 8;
              uint64_t v50 = (char *)*v16;
              unint64_t v49 = (char *)v16[1];
              if (v49 != *v16)
              {
                do
                {
                  uint64_t v51 = *((void *)v49 - 1);
                  v49 -= 8;
                  *((void *)v48 - 1) = v51;
                  v48 -= 8;
                }

                while (v49 != v50);
                unint64_t v49 = (char *)*v16;
              }

              *std::vector<unsigned int>::pointer v16 = v48;
              v16[1] = v41;
              void v16[2] = (void *)(v46 + 8 * v47);
              if (v49) {
                operator delete(v49);
              }
            }

            else
            {
              *(void *)unint64_t v41 = 0LL;
              v41 += 8;
            }

            v16[1] = v41;
            ++v40;
          }

          while (v40 != v39);
        }

        if (v38)
        {
          uint64_t v53 = v16[1];
          unint64_t v52 = (unint64_t)v16[2];
          if ((unint64_t)v53 >= v52)
          {
            uint64_t v55 = ((char *)v53 - (_BYTE *)*v16) >> 3;
            uint64_t v56 = v52 - (void)*v16;
            uint64_t v57 = v56 >> 2;
            else {
              unint64_t v58 = v57;
            }
            if (v58) {
              unint64_t v58 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v58);
            }
            else {
              uint64_t v59 = 0LL;
            }
            float v60 = (void *)(v58 + 8 * v55);
            void *v60 = 0LL;
            id v54 = v60 + 1;
            __int128 v62 = (char *)*v16;
            __int128 v61 = (char *)v16[1];
            if (v61 != *v16)
            {
              do
              {
                uint64_t v63 = *((void *)v61 - 1);
                v61 -= 8;
                *--float v60 = v63;
              }

              while (v61 != v62);
              __int128 v61 = (char *)*v16;
            }

            *std::vector<unsigned int>::pointer v16 = v60;
            v16[1] = v54;
            void v16[2] = (void *)(v58 + 8 * v59);
            if (v61) {
              operator delete(v61);
            }
          }

          else
          {
            *uint64_t v53 = 0LL;
            id v54 = v53 + 1;
          }

          v16[1] = v54;
          --v38;
        }

        v16 += 3;
      }

      while (v16 != v18);
    }

    uint64_t v64 = 0LL;
    NSUInteger v65 = (NSUInteger)&v73[2 * v11 + 1];
    uint64_t v66 = (_DWORD *)*v20;
    NSUInteger v67 = (_DWORD *)(*v20 + 8LL);
    do
    {
      NSUInteger v68 = (NSUInteger)v75[v64];
      NSUInteger v69 = (NSUInteger)v75[v64 + 1] - v68;
      *(v67 - 1) = v69 >> 3;
      *NSUInteger v67 = v65 - (_DWORD)v66 + v72;
      v65 += v69 & 0x7FFFFFFF8LL;
      v64 += 3LL;
      v67 += 2;
    }

    while (3 * v11 != v64);
    __int128 v78 = &v75;
    std::vector<std::vector<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair,std::allocator<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair>>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v78);
    LODWORD(v12) = v70;
    a5 = v71;
  }

  if (a5) {
    *a5 = v12;
  }
}

void sub_183E1E260( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *unsigned int v13 = 0LL;
  MEMORY[0x1895FB398](a13);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Dictionary::getCount(CSStore2::Dictionary *this, unsigned int a2)
{
  if (a2 == -1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)this;
  uint64_t v3 = *(void *)(*(void *)this + 8LL);
  unsigned int v4 = *(_DWORD *)(v3 + 12);
  if (v4 <= a2) {
    return 0LL;
  }
  unsigned int v5 = (unsigned int *)(v3 + a2);
  uint64_t v6 = *v5;
  if (!(_DWORD)v6) {
    return 0LL;
  }
  uint64_t result = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = v3 + 4;
  do
  {
    unsigned int v10 = &v5[2 * v8];
    unsigned int v11 = v10[1];
    if (v11 - 0x20000000 >= 0xE0000001)
    {
      uint64_t v12 = v10[2];
      BOOL v13 = __CFADD__((_DWORD)v12, 8 * v11) || v12 + 8 * v11 > *(_DWORD *)(*(void *)(v2 + 8) + 12LL);
      BOOL v14 = v13 || (_DWORD)v12 == -1;
      if (!v14 && v4 > v12)
      {
        unint64_t v16 = 0LL;
        size_t v17 = (int *)(v9 + v12);
        LODWORD(v1_Block_object_dispose(va, 8) = v11;
        do
        {
          int v19 = *v17;
          v17 += 2;
          BOOL v20 = v19 == 0;
          if (v19) {
            uint64_t result = (result + 1);
          }
          else {
            uint64_t result = result;
          }
          if (v20) {
            unint64_t v18 = v18;
          }
          else {
            unint64_t v18 = v11;
          }
          ++v16;
        }

        while (v16 < v18);
      }
    }

    ++v8;
  }

  while (v8 != v6);
  return result;
}

id CSStore2::Dictionary::getDescriptionOfContents(CSStore2::Dictionary *this, unint64_t a2)
{
  id v4 = objc_alloc_init(MEMORY[0x189607928]);
  if (v4)
  {
    char v5 = *(_BYTE *)(*((void *)this + 1) + 1LL);
    if (a2 >= 7) {
      uint64_t v6 = 7LL;
    }
    else {
      uint64_t v6 = a2;
    }
    memset_pattern16(__b, asc_183E2D5E0, 2 * v6 + 2);
    uint64_t v23 = (void *)[objc_alloc(NSString) initWithCharacters:__b length:v6 + 1];
    unint64_t v24 = (void *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:@"{"];
    id v7 = objc_alloc(MEMORY[0x1896077E0]);
    uint64_t v8 = (void *)[objc_alloc(NSString) initWithFormat:@"\n%@}", v23];
    uint64_t v22 = (void *)[v7 initWithString:v8];

    unsigned int v21 = (void *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:@"\n"];
    id v9 = objc_alloc(MEMORY[0x189607928]);
    [@"\t" stringByAppendingString:v23];
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v11 = (void *)[v9 initWithString:v10];

    uint64_t v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1896077E0]), "initWithString:", @", ");
    uint64_t v35 = 0LL;
    unsigned int v36 = &v35;
    uint64_t v37 = 0x2020000000LL;
    int v38 = 0;
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    void v25[2] = ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke;
    v25[3] = &unk_189D66278;
    uint64_t v31 = &v35;
    unint64_t v32 = this;
    id v13 = v4;
    id v26 = v13;
    id v14 = v24;
    id v27 = v14;
    id v15 = v12;
    char v34 = v5;
    id v28 = v15;
    uint64_t v33 = v6;
    id v16 = v21;
    id v29 = v16;
    id v17 = v11;
    id v30 = v17;
    CSStore2::Dictionary::enumerateKeysAndValues((unint64_t)this, 1, v25);
    if (*((_DWORD *)v36 + 6))
    {
      [v13 appendAttributedString:v22];
    }

    else
    {
      int v19 = (void *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:@"{ }"];
      [v13 appendAttributedString:v19];
    }

    unint64_t v18 = (void *)[v13 copy];

    _Block_object_dispose(&v35, 8);
  }

  else
  {
    unint64_t v18 = 0LL;
  }

  return v18;
}

void sub_183E1E634( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20, void *a21, void *a22, void *a23)
{
  _Block_object_dispose((const void *)(v27 - 136), 8);
  _Unwind_Resume(a1);
}

void ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke( uint64_t a1, unsigned int a2, unsigned int a3)
{
  v39[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(CSStore2::Store ***)(a1 + 80);
  id v7 = (void *)MEMORY[0x186E27B50]();
  uint64_t v8 = 48LL;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL)) {
    uint64_t v8 = 40LL;
  }
  [*(id *)(a1 + 32) appendAttributedString:*(void *)(a1 + v8)];
  CSStore2::String::Get(v36, *v6, a2);
  if (v37)
  {
    CSStore2::String::getNSStringNoCopy((CSStore2::String *)v36);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    switch(*(_BYTE *)(a1 + 96))
    {
      case 1:
        CSStore2::String::Get(v33, *v6, a3);
        if (!v35) {
          goto LABEL_14;
        }
        id v10 = objc_alloc(NSString);
        CSStore2::String::getNSStringNoCopy((CSStore2::String *)v33);
        unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = (void *)[v10 initWithFormat:@"%@", v11];

        break;
      case 2:
        CSStore2::Array::Get((CSStore2::Array *)v33, *v6, a3);
        if (!v34) {
          goto LABEL_14;
        }
        id v13 = objc_alloc_init(MEMORY[0x189603FA8]);
        v28[0] = MEMORY[0x1895F87A8];
        v28[1] = 3221225472LL;
        void v28[2] = ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke_3;
        v28[3] = &unk_189D66250;
        id v14 = v13;
        id v29 = v14;
        CSStore2::Array::enumerateValues((uint64_t)v33, v28);
        id v15 = objc_alloc(NSString);
        objc_msgSend(v14, "componentsJoinedByString:", @", ");
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = (void *)[v15 initWithFormat:@"[ %@ ]", v16];

        break;
      case 3:
        CSStore2::Array::Get((CSStore2::Array *)v33, *v6, a3);
        if (!v34) {
          goto LABEL_14;
        }
        id v17 = objc_alloc_init(MEMORY[0x189603FA8]);
        v30[0] = MEMORY[0x1895F87A8];
        v30[1] = 3221225472LL;
        void v30[2] = ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke_2;
        v30[3] = &unk_189D66228;
        unint64_t v32 = v6;
        id v18 = v17;
        id v31 = v18;
        CSStore2::Array::enumerateValues((uint64_t)v33, v30);
        id v19 = objc_alloc(NSString);
        objc_msgSend(v18, "componentsJoinedByString:", @", ");
        BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = (void *)[v19 initWithFormat:@"[ %@ ]", v20];

        break;
      case 4:
        CSStore2::Dictionary::Get((CSStore2::Dictionary *)v33, *v6, a3);
        if (!v34) {
          goto LABEL_14;
        }
        CSStore2::Dictionary::getDescriptionOfContents((CSStore2::Dictionary *)v33, *(void *)(a1 + 88) + 1LL);
        unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 string];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        goto LABEL_14;
    }

    if (!v12) {
LABEL_14:
    }
      uint64_t v12 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"0x%llx", a3);
    [*(id *)(a1 + 32) appendAttributedString:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) appendAttributedString:*(void *)(a1 + 64)];
    uint64_t v22 = (void *)[objc_alloc(NSString) initWithFormat:@"%@", v9];

    id v23 = objc_alloc(MEMORY[0x1896077E0]);
    int v38 = @"_CSVFWeight";
    v39[0] = &unk_189D69CB0;
    [MEMORY[0x189603F68] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = (void *)[v23 initWithString:v22 attributes:v24];

    [*(id *)(a1 + 32) appendAttributedString:v25];
    id v26 = (void *)[objc_alloc(NSString) initWithFormat:@":%C%@", 160, v12];

    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1896077E0]) initWithString:v26];
    [*(id *)(a1 + 32) appendAttributedString:v27];
  }

  objc_autoreleasePoolPop(v7);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
}

void sub_183E1EB48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke_2( uint64_t a1, uint64_t a2, unsigned int *a3)
{
  if (v9)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = objc_alloc(NSString);
    CSStore2::String::getNSStringNoCopy((CSStore2::String *)v8);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = (void *)[v5 initWithFormat:@"%@", v6];
    [v4 addObject:v7];
  }

void sub_183E1ECC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke_3( uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = (id)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"0x%llx", *a3);
  objc_msgSend(v3, "addObject:");
}

void sub_183E1ED3C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void *___ZN8CSStore27HashMapIjjNS_10Dictionary10_FunctionsELy0EE14WriteBreakdownERKNS_5StoreEPKS3_hPh_block_invoke( uint64_t a1, unsigned int a2, size_t __len, int a4, int a5)
{
  if (a4) {
    int v5 = 64;
  }
  else {
    int v5 = -128;
  }
  return memset( (void *)(*(void *)(a1 + 32) + a2),  (v5 | a5 ^ 1) & 0xFFFFFFC1 | (2 * (*(_BYTE *)(a1 + 40) & 0x1F)),  __len);
}

_DWORD *CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find( CSStore2 *a1, int *a2, int a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (*a2) {
    BOOL v3 = a3 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0LL;
  }
  if (*a2 > 0x2000)
  {
    CSStore2::GetLog(a1);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v23 = *a2;
      v24[0] = 67109376;
      v24[1] = v23;
      __int16 v25 = 1024;
      int v26 = 0x2000;
      _os_log_error_impl( &dword_183DFE000,  v15,  OS_LOG_TYPE_ERROR,  "Impossible bucket count %u when %u is the maximum.",  (uint8_t *)v24,  0xEu);
    }

    return 0LL;
  }

  uint64_t v5 = (unsigned __int16)a3 % (unsigned __int16)*a2;
  uint64_t v6 = a2[2 * v5 + 1];
  if (!(_DWORD)v6) {
    return 0LL;
  }
  id v7 = &a2[2 * v5];
  if ((_DWORD)v6 == 1)
  {
    uint64_t v8 = v7[2];
    if ((_DWORD)v8 != -1)
    {
      uint64_t v9 = *((void *)a1 + 1);
      if (*(_DWORD *)(v9 + 12) > v8 && v9 != 0)
      {
        unsigned int v11 = (int *)(v9 + v8);
        int v13 = *v11;
        uint64_t v12 = v11 + 1;
        if (v13 == a3) {
          return v12;
        }
        else {
          return 0LL;
        }
      }
    }

    return 0LL;
  }

  uint64_t v16 = v7[2];
  if ((_DWORD)v16 == -1)
  {
    BOOL v20 = 0LL;
  }

  else
  {
    uint64_t v17 = *((void *)a1 + 1);
    unsigned int v18 = *(_DWORD *)(v17 + 12);
    id v19 = (_DWORD *)(v17 + v16);
    else {
      BOOL v20 = v19;
    }
  }

  uint64_t v21 = 8 * v6;
  uint64_t v22 = &v20[2 * v6];
  while (*v20 != a3)
  {
    v20 += 2;
    v21 -= 8LL;
    if (!v21)
    {
      BOOL v20 = v22;
      break;
    }
  }

  if (v20 == v22) {
    return 0LL;
  }
  else {
    return v20 + 1;
  }
}

unsigned int *_CSStringRetain(uint64_t a1, unsigned int a2)
{
  if (performMutatingAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
    }
  }

  uint64_t result = CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7) {
    return CSStore2::String::retain(v6);
  }
  return result;
}

Unit *_CSStringRelease(uint64_t a1, unsigned int a2)
{
  if (performMutatingAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
    }
  }

  uint64_t result = (Unit *)CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7) {
    return CSStore2::String::release(v6);
  }
  return result;
}

uint64_t _CSStringIsValid(uint64_t a1, unsigned int a2)
{
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8LL))(*(void *)(v4 + 8));
    }
  }

  CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  return v7;
}

CSStore2 *_CSStringMakeConst(uint64_t a1, unsigned int a2)
{
  if (performMutatingAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
    }
  }

  uint64_t result = (CSStore2 *)CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7) {
    return CSStore2::String::setRetainCount((uint64_t)v6, 0LL, 0LL);
  }
  return result;
}

uint64_t _CSStringCopyLowercase(uint64_t a1, unsigned int a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (performMutatingAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
    }
  }

  uint64_t v5 = CSStore2::String::Get(v14, (CSStore2::Store *)(a1 + 8), a2);
  if (!v15) {
    return 0LL;
  }
  uint64_t v6 = (void *)MEMORY[0x186E27B50](v5);
  CSStore2::String::getNSStringNoCopy((CSStore2::String *)v14);
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 lowercaseString];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(v8, (uint64_t)v16);
  id v10 = (const char *)strlen(UTF8BufferFromNSString);
  CSStore2::String::Create( (CSStore2::String *)v12,  *(char ***)&v14[0],  (CSStore2::_StringFunctions *)UTF8BufferFromNSString,  v10);

  objc_autoreleasePoolPop(v6);
  char v15 = v13;
  v14[0] = v12[0];
  v14[1] = v12[1];
  if (v13) {
    return DWORD2(v14[0]);
  }
  else {
    return 0LL;
  }
}

void sub_183E1F1E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStringGetLowercase(uint64_t a1, unsigned int a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8LL))(*(void *)(v4 + 8));
    }
  }

  uint64_t v5 = CSStore2::String::Get(v19, (CSStore2::Store *)(a1 + 8), a2);
  if (!v20) {
    return 0LL;
  }
  v14[0] = v19[0];
  v14[1] = v19[1];
  char v15 = 1;
  uint64_t v6 = (void *)MEMORY[0x186E27B50](v5);
  CSStore2::String::getNSStringNoCopy((CSStore2::String *)v14);
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 lowercaseString];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(v8, (uint64_t)v19);
  id v10 = (const char *)strlen(UTF8BufferFromNSString);
  CSStore2::String::Find( (CSStore2::String *)v16,  *(CSStore2::Store **)&v14[0],  (CSStore2::_StringFunctions *)UTF8BufferFromNSString,  v10);
  BOOL v11 = v18 == 0;
  unsigned int v12 = v17;

  objc_autoreleasePoolPop(v6);
  if (v11) {
    return 0LL;
  }
  else {
    return v12;
  }
}

void sub_183E1F340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStringCopyUppercase(uint64_t a1, unsigned int a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (performMutatingAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
    }
  }

  uint64_t v5 = CSStore2::String::Get(v14, (CSStore2::Store *)(a1 + 8), a2);
  if (!v15) {
    return 0LL;
  }
  uint64_t v6 = (void *)MEMORY[0x186E27B50](v5);
  CSStore2::String::getNSStringNoCopy((CSStore2::String *)v14);
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 uppercaseString];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(v8, (uint64_t)v16);
  id v10 = (const char *)strlen(UTF8BufferFromNSString);
  CSStore2::String::Create( (CSStore2::String *)v12,  *(char ***)&v14[0],  (CSStore2::_StringFunctions *)UTF8BufferFromNSString,  v10);

  objc_autoreleasePoolPop(v6);
  char v15 = v13;
  v14[0] = v12[0];
  v14[1] = v12[1];
  if (v13) {
    return DWORD2(v14[0]);
  }
  else {
    return 0LL;
  }
}

void sub_183E1F48C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStringGetUppercase(uint64_t a1, unsigned int a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8LL))(*(void *)(v4 + 8));
    }
  }

  uint64_t v5 = CSStore2::String::Get(v15, (CSStore2::Store *)(a1 + 8), a2);
  if (!v16) {
    return 0LL;
  }
  v12[0] = v15[0];
  v12[1] = v15[1];
  char v13 = 1;
  uint64_t v6 = (void *)MEMORY[0x186E27B50](v5);
  CSStore2::String::getNSStringNoCopy((CSStore2::String *)v12);
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 uppercaseString];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(v8, (uint64_t)v15);
  id v10 = (const char *)strlen(UTF8BufferFromNSString);
  CSStore2::String::Find( (CSStore2::String *)v14,  *(CSStore2::Store **)&v12[0],  (CSStore2::_StringFunctions *)UTF8BufferFromNSString,  v10);
  LODWORD(UTF8BufferFromNSString) = v14[32] == 0;

  objc_autoreleasePoolPop(v6);
  if ((_DWORD)UTF8BufferFromNSString) {
    return 0LL;
  }
  else {
    return DWORD2(v12[0]);
  }
}

void sub_183E1F5EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSGetConstStringForCharacters(uint64_t a1, CSStore2::_StringFunctions *a2, const char *a3)
{
  if (performMutatingAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (***(void (****)(void))(v6 + 8))(*(void *)(v6 + 8));
    }
  }

  CSStore2::String::Create((CSStore2::String *)v8, (char **)(a1 + 8), a2, a3);
  if (!v10) {
    return 0LL;
  }
  CSStore2::String::setRetainCount((uint64_t)v8, 0LL, 0LL);
  return v9;
}

uint64_t _CSGetStringForCharacters(uint64_t a1, CSStore2::_StringFunctions *a2, const char *a3)
{
  if (performConstantAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8LL))(*(void *)(v6 + 8));
    }
  }

  CSStore2::String::Find((CSStore2::String *)v8, (CSStore2::Store *)(a1 + 8), a2, a3);
  if (v10) {
    return v9;
  }
  else {
    return 0LL;
  }
}

uint64_t _CSGetStringForCFString(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(a2, (uint64_t)v6);
  uint64_t v4 = (const char *)strlen(UTF8BufferFromNSString);
  return _CSGetStringForCharacters(a1, (CSStore2::_StringFunctions *)UTF8BufferFromNSString, v4);
}

uint64_t _CSCopyStringForCharacters(uint64_t a1, CSStore2::_StringFunctions *a2, const char *a3)
{
  if (performMutatingAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (***(void (****)(void))(v6 + 8))(*(void *)(v6 + 8));
    }
  }

  CSStore2::String::Create((CSStore2::String *)v8, (char **)(a1 + 8), a2, a3);
  if (v10) {
    return v9;
  }
  else {
    return 0LL;
  }
}

uint64_t _CSStringCopyCFString(uint64_t a1, unsigned int a2)
{
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8LL))(*(void *)(v4 + 8));
    }
  }

  CSStore2::String::Get(v10, (CSStore2::Store *)(a1 + 8), a2);
  if (v11)
  {
    v8[0] = v10[0];
    v8[1] = v10[1];
    char v9 = 1;
    CSStore2::String::getNSStringNoCopy((CSStore2::String *)v8);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 copy];
  }

  else
  {
    uint64_t v6 = 0LL;
    LOBYTE(v8[0]) = 0;
    char v9 = 0;
  }

  return v6;
}

void sub_183E1F8C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStringGetUnitFromID(uint64_t a1, unsigned int a2)
{
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8LL))(*(void *)(v4 + 8));
    }
  }

  CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  if (!v8) {
    return 0LL;
  }
  if (v7) {
    return 0LL;
  }
  return v6[2];
}

void CSStore2::Writer::logFunctionCall( CSStore2 *a1, CSStore2 *a2, CSStore2 *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v12 = (FILE *)CSStore2::getLog(void)::result;
  os_unfair_lock_lock(&CSStore2::logLock);
  id v14 = CSStore2::getFunctionName(a1, v13);
  fprintf(v12, "%s\n", (const char *)[v14 UTF8String]);
  id v16 = CSStore2::getFunctionName(a2, v15);
  fprintf(v12, "\t%s\n", (const char *)[v16 UTF8String]);
  id v18 = CSStore2::getFunctionName(a3, v17);
  fprintf(v12, "\t\t%s(", (const char *)[v18 UTF8String]);
  uint64_t v19 = 0LL;
  do
  {
    if (v19) {
      fputs(", ", v12);
    }
    char v20 = (const char *)a4;
    fputs(v20, v12);
    ++v19;
    a4 += 24LL;
  }

  while (a5 != v19);
  fputs(")\n", v12);
  else {
    uint64_t v21 = *(const char **)a6;
  }
  fprintf(v12, "\t\t\t%s\n", v21);
  fflush(v12);

  os_unfair_lock_unlock(&CSStore2::logLock);
}

void sub_183E1FB00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSStore2::getFunctionName(CSStore2 *this, const void *a2)
{
  if (CSStore2::getFunctionName(void const*)::symbolicate)
  {
    CSStore2::NameOfSymbol(this, a2);
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v3 = 0LL;
  }

  return v3;
}

void ___ZN8CSStore2L15getFunctionNameEPKv_block_invoke()
{
  CSStore2::getFunctionName(void const*)::symbolicate = 1;
  uint64_t v0 = getenv("CS_SYMBOLICATE_IO_CALLERS");
  if (v0)
  {
    [NSString stringWithUTF8String:v0];
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    CSStore2::getFunctionName(void const*)::symbolicate = [v1 BOOLValue];
  }

void sub_183E1FC08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void ___ZN8CSStore2L6getLogEv_block_invoke_415()
{
  if (!CSStore2::getLog(void)::result)
  {
    NSTemporaryDirectory();
    uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
    id v1 = (void *)NSString;
    pid_t v2 = getpid();
    objc_msgSend(v1, "stringWithFormat:", @"csstore-writer-%llu-%llu.log", v2, _CFGetEUID());
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = [v0 stringByAppendingPathComponent:v3];
    uint64_t v5 = (const char *)[v4 fileSystemRepresentation];

    CSStore2::getLog(void)::uint64_t result = (uint64_t)fopen(v5, "wb+");
  }

void sub_183E1FCDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E1FDD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E1FE48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::CSStoreSharedReadingAccessContext::assertHeldForWriting( CSStore2::CSStoreSharedReadingAccessContext *this)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:"virtual void CSStore2::CSStoreSharedReadingAccessContext::assertHeldForWriting() const"];
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 handleFailureInFunction:v1 file:@"CSStoreAccessContextPrivInternal.h" lineNumber:196 description:@"context cannot be held for writing"];
}

void sub_183E1FF30( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void CSStore2::CSStoreSharedReadingAccessContext::assertHeldForReading(os_unfair_lock_s *this)
{
  id v2 = this + 2;
  os_unfair_lock_lock(this + 2);
  pthread_t v3 = pthread_self();
  int8x8_t v4 = *(int8x8_t *)&this[6]._os_unfair_lock_opaque;
  if (v4)
  {
    unint64_t v5 = 0x9DDFEA08EB382D69LL * (((8 * (_DWORD)v3) + 8LL) ^ ((unint64_t)v3 >> 32));
    unint64_t v6 = 0x9DDFEA08EB382D69LL * (((unint64_t)v3 >> 32) ^ (v5 >> 47) ^ v5);
    unint64_t v7 = 0x9DDFEA08EB382D69LL * (v6 ^ (v6 >> 47));
    uint8x8_t v8 = (uint8x8_t)vcnt_s8(v4);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v9 = v7;
      if (v7 >= *(void *)&v4) {
        unint64_t v9 = v7 % *(void *)&v4;
      }
    }

    else
    {
      unint64_t v9 = v7 & (*(void *)&v4 - 1LL);
    }

    char v10 = *(void **)(*(void *)&this[4]._os_unfair_lock_opaque + 8 * v9);
    if (v10)
    {
      for (uint64_t i = (void *)*v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v7 == v12)
        {
          if ((pthread_t)i[2] == v3) {
            goto LABEL_18;
          }
        }

        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v12 >= *(void *)&v4) {
              v12 %= *(void *)&v4;
            }
          }

          else
          {
            v12 &= *(void *)&v4 - 1LL;
          }

          if (v12 != v9) {
            break;
          }
        }
      }
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  char v13 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:"virtual void CSStore2::CSStoreSharedReadingAccessContext::assertHeldForReading() const"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 handleFailureInFunction:v14 file:@"CSStoreAccessContextPrivInternal.h" lineNumber:191 description:@"context not held for reading"];

LABEL_18:
  os_unfair_lock_unlock(v2);
}

void sub_183E200BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::CSStoreSharedReadingAccessContext::accessForReading(uint64_t a1, void *a2)
{
  uint64_t v47 = a2;
  unint64_t v4 = (unint64_t)pthread_self();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  unint64_t v5 = (void **)(a1 + 16);
  if (std::__hash_table<_opaque_pthread_t *,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,std::allocator<_opaque_pthread_t *>>::find<_opaque_pthread_t *>( (void *)(a1 + 16),  v4))
  {
    [MEMORY[0x1896077D8] currentHandler];
    unint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [NSString stringWithUTF8String:"virtual void CSStore2::CSStoreSharedReadingAccessContext::accessForReading(void (^ _Nonnull __strong)())"];
    [v46 handleFailureInFunction:v2 file:@"CSStoreAccessContextPrivInternal.h" lineNumber:204 description:@"context already held for reading"];
  }

  unint64_t v6 = 0x9DDFEA08EB382D69LL * (((8 * v4) + 8LL) ^ HIDWORD(v4));
  unint64_t v7 = 0x9DDFEA08EB382D69LL * (HIDWORD(v4) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69LL * (v7 ^ (v7 >> 47));
  unint64_t v9 = *(void *)(a1 + 24);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      uint64_t v2 = 0x9DDFEA08EB382D69LL * (v7 ^ (v7 >> 47));
      if (v8 >= v9) {
        uint64_t v2 = v8 % v9;
      }
    }

    else
    {
      uint64_t v2 = v8 & (v9 - 1);
    }

    char v11 = (void *)*((void *)*v5 + v2);
    if (v11)
    {
      for (uint64_t i = (void *)*v11; i; uint64_t i = (void *)*i)
      {
        unint64_t v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == v4) {
            goto LABEL_76;
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

          if (v13 != v2) {
            break;
          }
        }
      }
    }
  }

  id v14 = operator new(0x18uLL);
  *id v14 = 0LL;
  v14[1] = v8;
  _OWORD v14[2] = v4;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 40) + 1LL);
  float v16 = *(float *)(a1 + 48);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1LL;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    else {
      int8x8_t prime = (int8x8_t)v18;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v9 = *(void *)(a1 + 24);
    }

    if (*(void *)&prime > v9) {
      goto LABEL_32;
    }
    if (*(void *)&prime < v9)
    {
      unint64_t v27 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 40) / *(float *)(a1 + 48));
      if (v9 < 3 || (uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        unint64_t v27 = std::__next_prime(v27);
      }

      else
      {
        uint64_t v29 = 1LL << -(char)__clz(v27 - 1);
        if (v27 >= 2) {
          unint64_t v27 = v29;
        }
      }

      if (*(void *)&prime <= v27) {
        int8x8_t prime = (int8x8_t)v27;
      }
      if (*(void *)&prime >= v9)
      {
        unint64_t v9 = *(void *)(a1 + 24);
      }

      else
      {
        if (prime)
        {
LABEL_32:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v21 = operator new(8LL * *(void *)&prime);
          uint64_t v22 = *v5;
          *unint64_t v5 = v21;
          if (v22) {
            operator delete(v22);
          }
          uint64_t v23 = 0LL;
          *(int8x8_t *)(a1 + 24) = prime;
          do
            *((void *)*v5 + v23++) = 0LL;
          while (*(void *)&prime != v23);
          unint64_t v24 = *(void **)(a1 + 32);
          if (v24)
          {
            unint64_t v25 = v24[1];
            uint8x8_t v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(void *)&prime) {
                v25 %= *(void *)&prime;
              }
            }

            else
            {
              v25 &= *(void *)&prime - 1LL;
            }

            *((void *)*v5 + v25) = a1 + 32;
            id v30 = (void *)*v24;
            if (*v24)
            {
              do
              {
                unint64_t v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(void *)&prime) {
                    v31 %= *(void *)&prime;
                  }
                }

                else
                {
                  v31 &= *(void *)&prime - 1LL;
                }

                if (v31 != v25)
                {
                  if (!*((void *)*v5 + v31))
                  {
                    *((void *)*v5 + v31) = v24;
                    goto LABEL_57;
                  }

                  *unint64_t v24 = *v30;
                  void *v30 = **((void **)*v5 + v31);
                  **((void **)*v5 + v31) = v30;
                  id v30 = v24;
                }

                unint64_t v31 = v25;
LABEL_57:
                unint64_t v24 = v30;
                id v30 = (void *)*v30;
                unint64_t v25 = v31;
              }

              while (v30);
            }
          }

          unint64_t v9 = (unint64_t)prime;
          goto LABEL_61;
        }

        uint64_t v45 = *v5;
        *unint64_t v5 = 0LL;
        if (v45) {
          operator delete(v45);
        }
        unint64_t v9 = 0LL;
        *(void *)(a1 + 24) = 0LL;
      }
    }

LABEL_75:
  ++*(void *)(a1 + 40);
LABEL_76:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  v47[2]();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  char v35 = std::__hash_table<_opaque_pthread_t *,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,std::allocator<_opaque_pthread_t *>>::find<_opaque_pthread_t *>( (void *)(a1 + 16),  v4);
  if (v35)
  {
    int8x8_t v36 = *(int8x8_t *)(a1 + 24);
    unint64_t v37 = v35[1];
    uint8x8_t v38 = (uint8x8_t)vcnt_s8(v36);
    v38.i16[0] = vaddlv_u8(v38);
    if (v38.u32[0] > 1uLL)
    {
      if (v37 >= *(void *)&v36) {
        v37 %= *(void *)&v36;
      }
    }

    else
    {
      v37 &= *(void *)&v36 - 1LL;
    }

    unsigned int v39 = (void *)*((void *)*v5 + v37);
    do
    {
      int v40 = v39;
      unsigned int v39 = (void *)*v39;
    }

    while (v39 != v35);
    if (v40 == (void *)(a1 + 32)) {
      goto LABEL_94;
    }
    unint64_t v41 = v40[1];
    if (v38.u32[0] > 1uLL)
    {
      if (v41 >= *(void *)&v36) {
        v41 %= *(void *)&v36;
      }
    }

    else
    {
      v41 &= *(void *)&v36 - 1LL;
    }

    if (v41 != v37)
    {
LABEL_94:
      if (!*v35) {
        goto LABEL_95;
      }
      unint64_t v42 = *(void *)(*v35 + 8LL);
      if (v38.u32[0] > 1uLL)
      {
        if (v42 >= *(void *)&v36) {
          v42 %= *(void *)&v36;
        }
      }

      else
      {
        v42 &= *(void *)&v36 - 1LL;
      }

      if (v42 != v37) {
LABEL_95:
      }
        *((void *)*v5 + v37) = 0LL;
    }

    uint64_t v43 = *v35;
    if (*v35)
    {
      unint64_t v44 = *(void *)(v43 + 8);
      if (v38.u32[0] > 1uLL)
      {
        if (v44 >= *(void *)&v36) {
          v44 %= *(void *)&v36;
        }
      }

      else
      {
        v44 &= *(void *)&v36 - 1LL;
      }

      if (v44 != v37)
      {
        *((void *)*v5 + v44) = v40;
        uint64_t v43 = *v35;
      }
    }

    void *v40 = v43;
    *char v35 = 0LL;
    --*(void *)(a1 + 40);
    operator delete(v35);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
}

void sub_183E206D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void CSStore2::CSStoreSharedReadingAccessContext::accessForWriting()
{
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:"virtual void CSStore2::CSStoreSharedReadingAccessContext::accessForWriting(void (^ _Nonnull __strong)())"];
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 handleFailureInFunction:v0 file:@"CSStoreAccessContextPrivInternal.h" lineNumber:216 description:@"context cannot be held for writing"];
}

void sub_183E20784( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::CSStoreSharedReadingAccessContext::copyDescription( CSStore2::CSStoreSharedReadingAccessContext *this)
{
  return objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"<CSStoreSharedReadingAccessContext: %p>",  this);
}

uint64_t CSStore2::CSStoreAccessContextInterface::active(CSStore2::CSStoreAccessContextInterface *this)
{
  return 1LL;
}

void CSStore2::CSStoreSharedReadingAccessContext::~CSStoreSharedReadingAccessContext( CSStore2::CSStoreSharedReadingAccessContext *this)
{
}

{
  char *v1;
  void *v2;
  void *v3;
  *(void *)this = off_189D66520;
  id v1 = (char *)this + 16;
  if (*((void *)this + 5))
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"virtual CSStore2::CSStoreSharedReadingAccessContext::~CSStoreSharedReadingAccessContext()"];
    pthread_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 handleFailureInFunction:v3 file:@"CSStoreAccessContextPrivInternal.h" lineNumber:226 description:@"Destroying shared reading access context with active readers!"];
  }

  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v1);
}

void sub_183E208A8(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<_opaque_pthread_t *,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,std::allocator<_opaque_pthread_t *>>::find<_opaque_pthread_t *>( void *a1, unint64_t a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69LL * (((8 * a2) + 8LL) ^ HIDWORD(a2));
  unint64_t v4 = 0x9DDFEA08EB382D69LL * (HIDWORD(a2) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69LL * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= *(void *)&v2) {
      unint64_t v7 = v5 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v7 = v5 & (*(void *)&v2 - 1LL);
  }

  unint64_t v8 = *(void **)(*a1 + 8 * v7);
  if (!v8) {
    return 0LL;
  }
  uint64_t result = (void *)*v8;
  if (*v8)
  {
    do
    {
      unint64_t v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == a2) {
          return result;
        }
      }

      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(void *)&v2) {
            v10 %= *(void *)&v2;
          }
        }

        else
        {
          v10 &= *(void *)&v2 - 1LL;
        }

        if (v10 != v7) {
          return 0LL;
        }
      }

      uint64_t result = (void *)*result;
    }

    while (result);
  }

  return result;
}

void std::__shared_ptr_emplace<CSStore2::CSStoreSharedReadingAccessContext>::~__shared_ptr_emplace( std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_189D664E8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreSharedReadingAccessContext>::~__shared_ptr_emplace( std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_189D664E8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<CSStore2::CSStoreSharedReadingAccessContext>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 48LL))(a1 + 24);
}

void CSStore2::CSStoreQueueAccessContext::assertHeldForWriting(dispatch_queue_t *this)
{
}

void CSStore2::CSStoreQueueAccessContext::assertHeldForReading(dispatch_queue_t *this)
{
}

void CSStore2::CSStoreQueueAccessContext::accessForReading(uint64_t a1, void *a2)
{
}

void CSStore2::CSStoreQueueAccessContext::accessForWriting(uint64_t a1, void *a2)
{
}

uint64_t CSStore2::CSStoreQueueAccessContext::copyDescription(CSStore2::CSStoreQueueAccessContext *this)
{
  return [objc_alloc(NSString) initWithFormat:@"<CSStoreQueueAccessContext: %@>", *((void *)this + 1)];
}

void CSStore2::CSStoreQueueAccessContext::~CSStoreQueueAccessContext(id *this)
{
}

{

  operator delete(this);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreQueueAccessContext>::~__shared_ptr_emplace( std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_189D66350;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreQueueAccessContext>::~__shared_ptr_emplace( std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_189D66350;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<CSStore2::CSStoreQueueAccessContext>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 48LL))(a1 + 24);
}

uint64_t CSStore2::CSStoreDebugQueueAccessContext::assertHeldForWriting( CSStore2::CSStoreDebugQueueAccessContext *this)
{
  return (*((uint64_t (**)(void))this + 3))(*((void *)this + 1));
}

uint64_t CSStore2::CSStoreDebugQueueAccessContext::assertHeldForReading( CSStore2::CSStoreDebugQueueAccessContext *this)
{
  return (*((uint64_t (**)(void))this + 2))(*((void *)this + 1));
}

uint64_t CSStore2::CSStoreDebugQueueAccessContext::copyDescription( CSStore2::CSStoreDebugQueueAccessContext *this)
{
  return [objc_alloc(NSString) initWithFormat:@"<CSStoreDebugQueueAccessContext: %@, queueAssert: %p, queueAssertBarrier: %p>", *((void *)this + 1), *((void *)this + 2), *((void *)this + 3)];
}

void CSStore2::CSStoreDebugQueueAccessContext::~CSStoreDebugQueueAccessContext(id *this)
{
}

{

  operator delete(this);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreDebugQueueAccessContext>::~__shared_ptr_emplace( std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_189D663D8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreDebugQueueAccessContext>::~__shared_ptr_emplace( std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_189D663D8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<CSStore2::CSStoreDebugQueueAccessContext>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 48LL))(a1 + 24);
}

void CSStore2::CSStoreUnfairLockAccessContext::assertHeldForWriting( CSStore2::CSStoreUnfairLockAccessContext *this)
{
  if (!*((_BYTE *)this + 16))
  {
    [MEMORY[0x1896077D8] currentHandler];
    int8x8_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"virtual void CSStore2::CSStoreUnfairLockAccessContext::assertHeldForWriting() const"];
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 handleFailureInFunction:v3 file:@"CSStoreAccessContextPrivInternal.h" lineNumber:146 description:@"context cannot be held for writing"];
  }

  os_unfair_lock_assert_owner(*((os_unfair_lock_t *)this + 1));
}

void sub_183E20C6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::CSStoreUnfairLockAccessContext::assertHeldForReading(os_unfair_lock_t *this)
{
}

void CSStore2::CSStoreUnfairLockAccessContext::accessForReading(uint64_t a1, void *a2)
{
  unint64_t v3 = *(os_unfair_lock_s **)(a1 + 8);
  unint64_t v4 = a2;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 8));
  v4[2](v4);

  os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 8));
}

void sub_183E20CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::CSStoreUnfairLockAccessContext::accessForWriting(uint64_t a1, void *a2)
{
  unint64_t v5 = a2;
  if (!*(_BYTE *)(a1 + 16))
  {
    [MEMORY[0x1896077D8] currentHandler];
    unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"virtual void CSStore2::CSStoreUnfairLockAccessContext::accessForWriting(void (^ _Nonnull __strong)())"];
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 handleFailureInFunction:v4 file:@"CSStoreAccessContextPrivInternal.h" lineNumber:159 description:@"context cannot be held for writing"];
  }

  os_unfair_lock_assert_not_owner(*(os_unfair_lock_t *)(a1 + 8));
  os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 8));
  v5[2]();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 8));
}

void sub_183E20DB4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::CSStoreUnfairLockAccessContext::copyDescription( CSStore2::CSStoreUnfairLockAccessContext *this)
{
  return objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"<CSStoreUnfairLockAccessContext: %p writeOK: %d>",  *((void *)this + 1),  *((unsigned __int8 *)this + 16));
}

void std::__shared_ptr_emplace<CSStore2::CSStoreUnfairLockAccessContext>::~__shared_ptr_emplace( std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_189D66460;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreUnfairLockAccessContext>::~__shared_ptr_emplace( std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_189D66460;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<CSStore2::CSStoreUnfairLockAccessContext>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 48LL))(a1 + 24);
}

_CSStoreAccessContext *_CSStoreAccessContextCreateWithQueue(void *a1)
{
  id v1 = a1;
  int8x8_t v2 = objc_alloc(&OBJC_CLASS____CSStoreAccessContext);
  id v3 = v1;
  if (v2)
  {
    v11.receiver = v2;
    v11.super_class = (Class)&OBJC_CLASS____CSStoreAccessContext;
    int8x8_t v2 = (_CSStoreAccessContext *)objc_msgSendSuper2(&v11, sel_init);
    if (v2)
    {
      unint64_t v4 = operator new(0x28uLL);
      v4[1] = 0LL;
      v4[2] = 0LL;
      *unint64_t v4 = off_189D66350;
      id v5 = v3;
      v4[3] = off_189D66388;
      Unit v4[4] = v5;
      v6.__ptr_ = (CSStoreAccessContextInterface *)(v4 + 3);
      v6.__cntrl_ = (__shared_weak_count *)v4;
      cntrl = (std::__shared_weak_count *)v2->_impl.__cntrl_;
      v2->_impl = v6;
      if (cntrl)
      {
        p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
        do
          unint64_t v9 = __ldaxr(p_shared_owners);
        while (__stlxr(v9 - 1, p_shared_owners));
        if (!v9)
        {
          ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
          std::__shared_weak_count::__release_weak(cntrl);
        }
      }
    }
  }

  return v2;
}

void sub_183E20F64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_CSStoreAccessContext *_CSStoreAccessContextCreateWithQueueAndAssertionFunctions( void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  shared_ptr<CSStore2::CSStoreAccessContextInterface> v6 = objc_alloc(&OBJC_CLASS____CSStoreAccessContext);
  id v7 = v5;
  if (v6)
  {
    v15.receiver = v6;
    v15.super_class = (Class)&OBJC_CLASS____CSStoreAccessContext;
    shared_ptr<CSStore2::CSStoreAccessContextInterface> v6 = (_CSStoreAccessContext *)objc_msgSendSuper2(&v15, sel_init);
    if (v6)
    {
      unint64_t v8 = operator new(0x38uLL);
      v8[1] = 0LL;
      _OWORD v8[2] = 0LL;
      *unint64_t v8 = off_189D663D8;
      id v9 = v7;
      v8[3] = off_189D66410;
      v8[4] = v9;
      void v8[5] = a2;
      void v8[6] = a3;
      v10.__ptr_ = (CSStoreAccessContextInterface *)(v8 + 3);
      v10.__cntrl_ = (__shared_weak_count *)v8;
      cntrl = (std::__shared_weak_count *)v6->_impl.__cntrl_;
      v6->_impl = v10;
      if (cntrl)
      {
        p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
        do
          unint64_t v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
          std::__shared_weak_count::__release_weak(cntrl);
        }
      }
    }
  }

  return v6;
}

void sub_183E21094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *_CSStoreAccessContextCreateWithLock(uint64_t a1, int a2)
{
  unint64_t v4 = objc_alloc(&OBJC_CLASS____CSStoreAccessContext);
  BOOL v5 = a2 != 0;
  if (!v4) {
    return 0LL;
  }
  v13.receiver = v4;
  v13.super_class = (Class)&OBJC_CLASS____CSStoreAccessContext;
  shared_ptr<CSStore2::CSStoreAccessContextInterface> v6 = (char *)objc_msgSendSuper2(&v13, sel_init);
  if (v6)
  {
    id v7 = operator new(0x30uLL);
    v7[1] = 0LL;
    _OWORD v7[2] = 0LL;
    *id v7 = off_189D66460;
    __int128 v7[3] = off_189D66498;
    void v7[4] = a1;
    *((_BYTE *)v7 + 4std::string::resize(&v8, (std::string::size_type)this + 1, 0) = v5;
    *(void *)&__int128 v8 = v7 + 3;
    *((void *)&v8 + 1) = v7;
    id v9 = (std::__shared_weak_count *)*((void *)v6 + 2);
    *(_OWORD *)(v6 + _Block_object_dispose(va, 8) = v8;
    if (v9)
    {
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        unint64_t v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }

  return v6;
}

void sub_183E211A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _CSStoreAccessContextCreateSharedReadingContext()
{
  return -[_CSStoreAccessContext initForSharedReading]( objc_alloc(&OBJC_CLASS____CSStoreAccessContext),  "initForSharedReading");
}

uint64_t _CSStoreAccessContextAssertReading(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 8LL))(*(void *)(a1 + 8));
}

uint64_t _CSStoreAccessContextAssertWriting(uint64_t a1)
{
  return (***(uint64_t (****)(void))(a1 + 8))(*(void *)(a1 + 8));
}

void _CSStoreAccessContextAccessForRead(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  GetContextLog();
  unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = a1;
    _os_log_debug_impl(&dword_183DFE000, v4, OS_LOG_TYPE_DEBUG, "accessing for read: %@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 8);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  _OWORD v8[2] = ___CSStoreAccessContextAccessForRead_block_invoke;
  v8[3] = &unk_189D66300;
  id v9 = v3;
  uint64_t v10 = a1;
  shared_ptr<CSStore2::CSStoreAccessContextInterface> v6 = *(void (**)(uint64_t, void *))(*(void *)v5 + 16LL);
  id v7 = v3;
  v6(v5, v8);
}

void sub_183E21304( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

id GetContextLog(void)
{
  return (id)GetContextLog(void)::result;
}

void ___ZL13GetContextLogv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.coreservicesstore", "access_context");
  id v1 = (void *)GetContextLog(void)::result;
  GetContextLog(void)::uint64_t result = (uint64_t)v0;
}

void _CSStoreAccessContextAccessForWrite(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  GetContextLog();
  unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = a1;
    _os_log_debug_impl(&dword_183DFE000, v4, OS_LOG_TYPE_DEBUG, "accessing for write: %@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 8);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  _OWORD v8[2] = ___CSStoreAccessContextAccessForWrite_block_invoke;
  v8[3] = &unk_189D66300;
  id v9 = v3;
  uint64_t v10 = a1;
  shared_ptr<CSStore2::CSStoreAccessContextInterface> v6 = *(void (**)(uint64_t, void *))(*(void *)v5 + 24LL);
  id v7 = v3;
  v6(v5, v8);
}

void sub_183E214B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t CSMapAddMapTable(__CSStore *a1, void *a2, int a3)
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  memset(v20, 0, sizeof(v20));
  size_t v5 = (a3 + 28);
  shared_ptr<CSStore2::CSStoreAccessContextInterface> v6 = malloc(v5);
  bzero(v6, v5);
  id v7 = (void *)MEMORY[0x186E27B50]();
  id v19 = 0LL;
  unsigned int v8 = _CSStoreAddTable((uint64_t)a1, a2, v5, &v19);
  if (v8)
  {

    objc_autoreleasePoolPop(v7);
    v6[2] = 511;
    id v9 = v6 + 2;
    unsigned int v10 = CSStoreAllocUnit((uint64_t)a1, v8, 4088);
    uint64_t v11 = (uint64_t)a1;
    unsigned int v12 = v8;
    goto LABEL_3;
  }

  [v19 domain];
  float v16 = (void *)objc_claimAutoreleasedReturnValue();
  char v17 = [v16 isEqual:*MEMORY[0x189607670]];

  if ((v17 & 1) == 0)
  {

    objc_autoreleasePoolPop(v7);
    uint64_t v15 = 4294957803LL;
LABEL_12:
    if (!v6) {
      return v15;
    }
    goto LABEL_13;
  }

  uint64_t v15 = [v19 code];

  objc_autoreleasePoolPop(v7);
  if ((_DWORD)v15) {
    goto LABEL_12;
  }
  v6[2] = 511;
  id v9 = v6 + 2;
  unsigned int v10 = CSStoreAllocUnit((uint64_t)a1, 0, 4088);
  uint64_t v11 = (uint64_t)a1;
  unsigned int v12 = 0;
LABEL_3:
  Unit = CSStoreGetUnit(v11, v12, v10, 0LL);
  v6[1] = v10;
  if (!Unit)
  {
    uint64_t v15 = 4294957803LL;
    goto LABEL_17;
  }

  *shared_ptr<CSStore2::CSStoreAccessContextInterface> v6 = 0;
  *(_OWORD *)(v6 + 3) = xmmword_183E2D5C0;
  uint64_t v14 = _CSMapWriteToHeader(a1, v8, 0, (const void *)v5, v6);
  if ((_DWORD)v14
    || (LODWORD(v20[0]) = v8,
        *((void *)&v21 + 1) = v6,
        uint64_t v14 = _CSMapSetBucketRange((uint64_t)a1, (uint64_t)v20, 0, 0, v6[2], v6[5]),
        (_DWORD)v14))
  {
    uint64_t v15 = v14;
    goto LABEL_17;
  }

  uint64_t v15 = _CSMapSetBucketRange((uint64_t)a1, (uint64_t)v20, *v9, 0, *v9, 233893374);
  if (!(_DWORD)v15)
  {
LABEL_13:
    free(v6);
    return v15;
  }

void sub_183E216FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t _CSMapWriteToHeader(__CSStore *a1, unsigned int a2, unsigned int a3, const void *a4, const void *a5)
{
  id v14 = 0LL;
  if (a1) {
    unsigned int v9 = -37516;
  }
  else {
    unsigned int v9 = 0;
  }
  if (_CSStoreWriteToUnit((uint64_t)a1, v9, a2, a3, a4, a5, &v14))
  {
    uint64_t v10 = 0LL;
  }

  else
  {
    [v14 domain];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = [v11 isEqual:*MEMORY[0x189607670]];

    if (v12) {
      uint64_t v10 = [v14 code];
    }
    else {
      uint64_t v10 = 4294962336LL;
    }
  }

  return v10;
}

void sub_183E217BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t _CSMapSetBucketRange(uint64_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, int a6)
{
  int v27 = a6;
  unsigned int v6 = *(_DWORD *)(*(void *)(a2 + 72) + 8LL);
  if (v6 < a4) {
    return 4294957804LL;
  }
  if (a5 + a4 > v6) {
    return 4294957799LL;
  }
  if (!a5) {
    return 4294957804LL;
  }
  if (a5 == 1)
  {
    uint64_t v13 = (void *)MEMORY[0x186E27B50]();
    unsigned int v14 = *(_DWORD *)(*(void *)(a2 + 72) + 4LL);
    id v26 = 0LL;
    if (_CSStoreWriteToUnit(a1, *(_DWORD *)a2, v14, 4 * (a4 + a3), (const void *)4, &v27, &v26))
    {
      uint64_t v7 = 0LL;
    }

    else
    {
      [v26 domain];
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
      int v22 = [v21 isEqual:*MEMORY[0x189607670]];

      if (v22) {
        uint64_t v7 = [v26 code];
      }
      else {
        uint64_t v7 = 4294962336LL;
      }
    }

    objc_autoreleasePoolPop(v13);
  }

  else
  {
    float v16 = malloc(4LL * a5);
    if (v16)
    {
      char v17 = v16;
      uint64_t v18 = 0LL;
      do
        *((_DWORD *)v16 + v18++) = a6;
      while (a5 != v18);
      id v19 = (void *)MEMORY[0x186E27B50]();
      unsigned int v20 = *(_DWORD *)(*(void *)(a2 + 72) + 4LL);
      id v26 = 0LL;
      if (_CSStoreWriteToUnit(a1, *(_DWORD *)a2, v20, 4 * (a4 + a3), (const void *)(4LL * a5), v17, &v26))
      {
        uint64_t v7 = 0LL;
      }

      else
      {
        [v26 domain];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        int v24 = [v23 isEqual:*MEMORY[0x189607670]];

        if (v24) {
          uint64_t v7 = [v26 code];
        }
        else {
          uint64_t v7 = 4294962336LL;
        }
      }

      objc_autoreleasePoolPop(v19);
      free(v17);
    }

    else
    {
      return 4294967255LL;
    }
  }

  return v7;
}

void sub_183E219CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

uint64_t CSMapSync(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (os_unfair_lock_s *)(a2 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 64));
  uint64_t v5 = 4294967246LL;
  if (a1 && a2)
  {
    int v6 = *(_DWORD *)(a2 + 68);
    if (performConstantAssertions)
    {
      uint64_t v7 = *(void *)(a1 + 344);
      if (v7) {
        (*(void (**)(void))(**(void **)(v7 + 8) + 8LL))(*(void *)(v7 + 8));
      }
    }

    uint64_t v8 = *(void *)(a1 + 8);
    if (v6 == *(_DWORD *)(*(void *)(v8 + 8) + 8LL))
    {
      uint64_t v5 = 0LL;
    }

    else
    {
      if (performConstantAssertions)
      {
        uint64_t v9 = *(void *)(a1 + 344);
        if (v9)
        {
          (*(void (**)(void))(**(void **)(v9 + 8) + 8LL))(*(void *)(v9 + 8));
          uint64_t v8 = *(void *)(a1 + 8);
        }
      }

      *(_DWORD *)(a2 + 6_Block_object_dispose(va, 8) = *(_DWORD *)(*(void *)(v8 + 8) + 8LL);
      Header = CSStoreGetHeader(a1, *(_DWORD *)a2, 0LL);
      *(void *)(a2 + 72) = Header;
      if (Header {
        && (Unit = CSStoreGetUnit(a1, *(_DWORD *)a2, *((_DWORD *)Header + 1), 0LL), (*(void *)(a2 + 8std::string::resize(&v8, (std::string::size_type)this + 1, 0) = Unit) != 0LL))
      }
      {
        uint64_t v5 = 0LL;
        *(void *)(a2 + 8_Block_object_dispose(va, 8) = &Unit[4 * *(unsigned int *)(*(void *)(a2 + 72) + 8LL)];
      }

      else
      {
        uint64_t v5 = 4294957800LL;
      }
    }
  }

  os_unfair_lock_unlock(v4);
  return v5;
}

uint64_t CSMapInit(uint64_t a1, NSString *a2, __int128 *a3, uint64_t a4, uint64_t a5)
{
  unsigned int TableWithName = _CSStoreGetTableWithName(a1, a2);
  *(_DWORD *)a5 = TableWithName;
  if (!TableWithName) {
    return 4294957797LL;
  }
  if (a3)
  {
    __int128 v10 = *a3;
    __int128 v11 = a3[2];
    *(_OWORD *)(a5 + 24) = a3[1];
    *(_OWORD *)(a5 + 4std::string::resize(&v8, (std::string::size_type)this + 1, 0) = v11;
  }

  else
  {
    __int128 v10 = 0uLL;
    *(_OWORD *)(a5 + 24) = 0u;
    *(_OWORD *)(a5 + 4std::string::resize(&v8, (std::string::size_type)this + 1, 0) = 0u;
  }

  *(_OWORD *)(a5 + _Block_object_dispose(va, 8) = v10;
  *(void *)(a5 + 56) = a4;
  *(_OWORD *)(a5 + 64) = 0u;
  *(_OWORD *)(a5 + 8std::string::resize(&v8, (std::string::size_type)this + 1, 0) = 0u;
  CSMapSync(a1, a5);
  return 0LL;
}

char *CSMapGetHeader(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  unsigned int v9 = 0;
  Header = CSStoreGetHeader(a1, *a2, &v9);
  if (Header) {
    BOOL v5 = v9 > 0x1C;
  }
  else {
    BOOL v5 = 0;
  }
  int v6 = v5;
  if (a3)
  {
    unsigned int v7 = v9 - 28;
    if (!v6) {
      unsigned int v7 = 0;
    }
    *a3 = v7;
  }

  if (v6) {
    return Header + 28;
  }
  else {
    return 0LL;
  }
}

uint64_t CSMapWriteToHeader(__CSStore *a1, unsigned int *a2, int a3, const void *a4, const void *a5)
{
  return _CSMapWriteToHeader(a1, *a2, a3 + 28, a4, a5);
}

uint64_t CSMapGetKeyAndValueForKeyData( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, _DWORD *a7)
{
  uint64_t result = CSMapSync(a1, a2);
  if (!(_DWORD)result)
  {
    int v24 = a6;
    uint64_t v15 = a7;
    float v16 = *(unsigned int **)(a2 + 72);
    unint64_t v17 = v16[2];
    unint64_t v18 = a5 % v17;
    unsigned int v19 = v16[5];
    unsigned int v20 = v16[6];
    unint64_t i = v18;
    while (1)
    {
      uint64_t v22 = *(unsigned int *)(*(void *)(a2 + 80) + 4 * i);
      if ((_DWORD)v22 == v19) {
        return 4294957797LL;
      }
      if ((_DWORD)v22 != v20
        && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 32))(a1, a2, v22, a3, a4))
      {
        break;
      }

      if (++i >= v17)
      {
        if ((_DWORD)v18)
        {
          for (unint64_t i = 0LL; i < v18; ++i)
          {
            uint64_t v23 = *(unsigned int *)(*(void *)(a2 + 80) + 4 * i);
            if ((_DWORD)v23 == v19) {
              break;
            }
            if ((_DWORD)v23 != v20
              && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 32))( a1,  a2,  v23,  a3,  a4))
            {
              goto LABEL_15;
            }
          }
        }

        return 4294957797LL;
      }
    }

uint64_t CSMapGetValue(uint64_t a1, void *a2, uint64_t a3, _DWORD *a4)
{
  uint64_t result = CSMapSync(a1, (uint64_t)a2);
  if (!(_DWORD)result)
  {
    uint64_t result = _CSMapFindBucketForKey(a1, a2, a3, (int *)&v9, 0LL);
    if (!(_DWORD)result) {
      *a4 = *(_DWORD *)(a2[11] + 4LL * v9);
    }
  }

  return result;
}

uint64_t _CSMapFindBucketForKey(uint64_t a1, void *a2, uint64_t a3, int *a4, int *a5)
{
  int v7 = a3;
  *a4 = -1;
  if (a5) {
    *a5 = -1;
  }
  __int128 v10 = (uint64_t (*)(uint64_t, void *, uint64_t))a2[3];
  unsigned int v11 = a3;
  if (v10) {
    unsigned int v11 = v10(a1, a2, a3);
  }
  uint64_t v13 = (unsigned int *)a2[9];
  uint64_t v12 = a2[10];
  unint64_t v14 = v13[2];
  unint64_t v15 = v11 % v14;
  unsigned int v16 = v13[5];
  unsigned int v17 = v13[6];
  unint64_t v18 = v15;
  if (a5)
  {
    while (1)
    {
      int v19 = *(_DWORD *)(v12 + 4 * v18);
      if (v19 == v16)
      {
        if (*a5 == -1) {
          *a5 = v18;
        }
LABEL_56:
        if (*a4 == -1) {
          return 4294957797LL;
        }
        else {
          return 0LL;
        }
      }

      if (v19 == v17) {
        break;
      }
      if (v19 == v7 && *a4 == -1)
      {
        *a4 = v18;
        int v20 = *a5;
        goto LABEL_11;
      }

uint64_t CSMapSetValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = CSMapSync(a1, a2);
  if ((_DWORD)result) {
    return result;
  }
  if (*(_DWORD *)(*(void *)(a2 + 72) + 12LL) == *(_DWORD *)(*(void *)(a2 + 72) + 16LL)
    && *(void *)(a2 + 80)
    && *(void *)(a2 + 88))
  {
    LODWORD(__n) = 0;
    Header = CSStoreGetHeader(a1, *(_DWORD *)a2, &__n);
    __int128 v10 = calloc(1uLL, (__n + 1));
    memcpy(v10, Header, __n);
    uint64_t v11 = v10[2];
    uint64_t v12 = (char *)calloc((8 * (_DWORD)v11) | 1u, 1uLL);
    if (v12)
    {
      uint64_t v13 = v12;
      memcpy(v12, *(const void **)(a2 + 80), (8 * v11));
      CSStoreFreeUnit(a1, *(_DWORD *)a2, v10[1]);
      int v14 = 2 * v11 - 1;
      _OWORD v10[2] = v14;
      unsigned int v15 = CSStoreAllocUnit(a1, *(_DWORD *)a2, 8 * v14);
      Unit = CSStoreGetUnit(a1, *(_DWORD *)a2, v15, 0LL);
      *(void *)(a2 + 8std::string::resize(&v8, (std::string::size_type)this + 1, 0) = Unit;
      v10[1] = v15;
      *(void *)(a2 + 8_Block_object_dispose(va, 8) = &Unit[4 * v10[2]];
      *(void *)(a2 + 72) = CSStoreGetHeader(a1, *(_DWORD *)a2, 0LL);
      if (performConstantAssertions)
      {
        uint64_t v17 = *(void *)(a1 + 344);
        if (v17) {
          (*(void (**)(void))(**(void **)(v17 + 8) + 8LL))(*(void *)(v17 + 8));
        }
      }

      *(_DWORD *)(a2 + 6_Block_object_dispose(va, 8) = *(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 8LL) + 8LL);
      unsigned int v18 = v10[2];
      v10[3] = v18;
      void v10[4] = v18 >> 1;
      int v19 = _CSMapSetBucketRange(a1, a2, *(_DWORD *)(*(void *)(a2 + 72) + 8LL), 0, v10[2], 233893374);
      if (!(_DWORD)v11 || v19) {
        goto LABEL_21;
      }
      uint64_t v20 = 0LL;
      uint64_t v21 = 4 * v11;
      int v22 = &v13[4 * v11];
      do
      {
        uint64_t v23 = *(void *)(a2 + 72);
        uint64_t v24 = *(unsigned int *)&v13[v20];
        if (*(_DWORD *)(v23 + 20) != (_DWORD)v24 && *(_DWORD *)(v23 + 24) != (_DWORD)v24)
        {
          _CSMapFindBucketForKey(a1, (void *)a2, v24, (int *)&v52, (int *)&v51);
          if (_CSMapSetBucketRange( a1,  a2,  *(_DWORD *)(*(void *)(a2 + 72) + 8LL),  v51,  1u,  *(_DWORD *)&v22[v20])) {
            break;
          }
          int v25 = v10[3] - 1;
          v10[3] = v25;
          int v50 = v25;
        }

        v20 += 4LL;
      }

      while (v21 != v20);
      if (v10) {
LABEL_21:
      }
        free(v10);
    }

    else
    {
      uint64_t v13 = (char *)v10;
    }

    free(v13);
  }

  _CSMapFindBucketForKey(a1, (void *)a2, a3, (int *)&v52, (int *)&v51);
  if (v52 != -1)
  {
    uint64_t v26 = *(unsigned int *)(*(void *)(a2 + 88) + 4LL * v52);
    if ((_DWORD)v26 == (_DWORD)a4) {
      return 0LL;
    }
    uint64_t result = _CSMapSetBucketRange(a1, a2, *(_DWORD *)(*(void *)(a2 + 72) + 8LL), v52, 1u, a4);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(a2 + 40);
    if (v27) {
      v27(a1, a2, a4);
    }
    int v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(a2 + 48);
    if (!v28) {
      return 0LL;
    }
    uint64_t v29 = a1;
    uint64_t v30 = a2;
    uint64_t v31 = v26;
    goto LABEL_67;
  }

  uint64_t v32 = *(void *)(a2 + 72);
  if (*(_DWORD *)(v32 + 20) == (_DWORD)a3)
  {
    uint64_t v33 = *(unsigned int *)(v32 + 8);
    int v34 = a3 + 2;
    LODWORD(__n) = a3 + 2;
    if ((_DWORD)v33)
    {
      char v35 = *(int **)(a2 + 80);
LABEL_33:
      uint64_t v36 = v33;
      unint64_t v37 = v35;
      do
      {
        int v38 = *v37++;
        if (v38 == v34)
        {
          v34 += 2;
          LODWORD(__n) = v34;
          goto LABEL_33;
        }

        --v36;
      }

      while (v36);
      uint64_t result = _CSMapWriteToHeader((__CSStore *)a1, *(_DWORD *)a2, 0x14u, (const void *)4, &__n);
      if (!(_DWORD)result)
      {
        uint64_t v39 = 0LL;
        while (1)
        {
          if (*(_DWORD *)(*(void *)(a2 + 80) + 4 * v39) == (_DWORD)a3)
          {
            uint64_t result = _CSMapSetBucketRange(a1, a2, 0, v39, 1u, __n);
            if ((_DWORD)result) {
              break;
            }
          }

          if (v33 == ++v39) {
            goto LABEL_45;
          }
        }
      }

      return result;
    }

    uint64_t result = _CSMapWriteToHeader((__CSStore *)a1, *(_DWORD *)a2, 0x14u, (const void *)4, &__n);
    if ((_DWORD)result) {
      return result;
    }
  }

LABEL_45:
  uint64_t v40 = *(void *)(a2 + 72);
  if (*(_DWORD *)(v40 + 24) == (_DWORD)a3)
  {
    uint64_t v41 = *(unsigned int *)(v40 + 8);
    int v42 = a3 + 2;
    LODWORD(__n) = a3 + 2;
    if ((_DWORD)v41)
    {
      uint64_t v43 = *(int **)(a2 + 80);
LABEL_48:
      uint64_t v44 = v41;
      uint64_t v45 = v43;
      do
      {
        int v46 = *v45++;
        if (v46 == v42)
        {
          v42 += 2;
          LODWORD(__n) = v42;
          goto LABEL_48;
        }

        --v44;
      }

      while (v44);
      uint64_t result = _CSMapWriteToHeader((__CSStore *)a1, *(_DWORD *)a2, 0x18u, (const void *)4, &__n);
      if (!(_DWORD)result)
      {
        uint64_t v47 = 0LL;
        while (1)
        {
          if (*(_DWORD *)(*(void *)(a2 + 80) + 4 * v47) == (_DWORD)a3)
          {
            uint64_t result = _CSMapSetBucketRange(a1, a2, 0, v47, 1u, __n);
            if ((_DWORD)result) {
              break;
            }
          }

          if (v41 == ++v47) {
            goto LABEL_60;
          }
        }
      }

      return result;
    }

    uint64_t result = _CSMapWriteToHeader((__CSStore *)a1, *(_DWORD *)a2, 0x18u, (const void *)4, &__n);
    if ((_DWORD)result) {
      return result;
    }
  }

LABEL_60:
  unsigned int v48 = v51;
  uint64_t result = _CSMapSetBucketRange(a1, a2, 0, v51, 1u, a3);
  if (!(_DWORD)result)
  {
    LODWORD(__n) = *(_DWORD *)(*(void *)(a2 + 72) + 12LL) - 1;
    uint64_t result = _CSMapWriteToHeader((__CSStore *)a1, *(_DWORD *)a2, 0xCu, (const void *)4, &__n);
    if (!(_DWORD)result)
    {
      uint64_t result = _CSMapSetBucketRange(a1, a2, *(_DWORD *)(*(void *)(a2 + 72) + 8LL), v48, 1u, a4);
      if (!(_DWORD)result)
      {
        unint64_t v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(a2 + 8);
        if (v49) {
          v49(a1, a2, a3);
        }
        int v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(a2 + 40);
        if (!v28) {
          return 0LL;
        }
        uint64_t v29 = a1;
        uint64_t v30 = a2;
        uint64_t v31 = a4;
LABEL_67:
        v28(v29, v30, v31);
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t CSMapRemoveValue(__CSStore *a1, void *a2, uint64_t a3)
{
  uint64_t result = CSMapSync((uint64_t)a1, (uint64_t)a2);
  if (!(_DWORD)result)
  {
    uint64_t result = _CSMapFindBucketForKey((uint64_t)a1, a2, a3, (int *)&v16, 0LL);
    if (!(_DWORD)result)
    {
      uint64_t v7 = v16;
      uint64_t v8 = *(unsigned int *)(a2[11] + 4LL * v16);
      uint64_t result = _CSMapSetBucketRange((uint64_t)a1, (uint64_t)a2, 0, v16, 1u, *(_DWORD *)(a2[9] + 24LL));
      if (!(_DWORD)result)
      {
        int v15 = *(_DWORD *)(a2[9] + 12LL) + 1;
        uint64_t result = _CSMapWriteToHeader(a1, *(_DWORD *)a2, 0xCu, (const void *)4, &v15);
        if (!(_DWORD)result)
        {
          unsigned int v9 = (_DWORD *)a2[9];
          uint64_t v10 = a2[10];
          if (v9[5] == *(_DWORD *)(v10 + 4LL * ((v7 + 1) % v9[2])))
          {
            int v11 = v9[6];
            for (int i = *(_DWORD *)(v10 + 4 * v7); v11 == i; int i = *(_DWORD *)(a2[10] + 4LL * v7))
            {
              uint64_t result = _CSMapSetBucketRange((uint64_t)a1, (uint64_t)a2, 0, v7, 1u, v9[5]);
              if ((_DWORD)result) {
                return result;
              }
              unsigned int v9 = (_DWORD *)a2[9];
              LODWORD(v7) = (v7 + v9[2] - 1) % v9[2];
              int v11 = v9[6];
            }
          }

          uint64_t v13 = (void (*)(__CSStore *, void *, uint64_t))a2[2];
          if (v13) {
            v13(a1, a2, a3);
          }
          int v14 = (void (*)(__CSStore *, void *, uint64_t))a2[6];
          if (v14) {
            v14(a1, a2, v8);
          }
          return 0LL;
        }
      }
    }
  }

  return result;
}

void _CSMapEnumerateKeysAndValues(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void, void, void, void))v6;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  float v31 = 1.0;
  uint64_t v8 = (_DWORD *)a2[9];
  if (!v8[2]) {
    goto LABEL_51;
  }
  uint64_t v9 = 0LL;
  unint64_t v10 = 0LL;
  unint64_t v11 = 0LL;
  do
  {
    unint64_t v12 = *(unsigned int *)(a2[10] + 4 * v11);
    if (v8[5] != (_DWORD)v12 && v8[6] != (_DWORD)v12)
    {
      int v13 = *(_DWORD *)(a2[11] + 4 * v11);
      if (v10)
      {
        uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
        v14.i16[0] = vaddlv_u8(v14);
        if (v14.u32[0] > 1uLL)
        {
          unint64_t v3 = *(unsigned int *)(a2[10] + 4 * v11);
          if (v10 <= v12) {
            unint64_t v3 = v12 % v10;
          }
        }

        else
        {
          unint64_t v3 = ((_DWORD)v10 - 1) & v12;
        }

        int v15 = *(uint64_t ***)(v29 + 8 * v3);
        if (v15)
        {
          for (int i = *v15; i; int i = (uint64_t *)*i)
          {
            unint64_t v17 = i[1];
            if (v17 == v12)
            {
              if (*((_DWORD *)i + 4) == (_DWORD)v12) {
                goto LABEL_47;
              }
            }

            else
            {
              if (v14.u32[0] > 1uLL)
              {
                if (v17 >= v10) {
                  v17 %= v10;
                }
              }

              else
              {
                v17 &= v10 - 1;
              }

              if (v17 != v3) {
                break;
              }
            }
          }
        }
      }

      unsigned int v18 = operator new(0x18uLL);
      *unsigned int v18 = 0LL;
      v18[1] = v12;
      *((_DWORD *)v18 + 4) = v12;
      *((_DWORD *)v18 + 5) = v13;
      float v19 = (float)(unint64_t)(v9 + 1);
      if (!v10 || (float)(v31 * (float)v10) < v19)
      {
        BOOL v20 = (v10 & (v10 - 1)) != 0;
        if (v10 < 3) {
          BOOL v20 = 1LL;
        }
        unint64_t v21 = v20 | (2 * v10);
        unint64_t v22 = vcvtps_u32_f32(v19 / v31);
        if (v21 <= v22) {
          size_t v23 = v22;
        }
        else {
          size_t v23 = v21;
        }
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>( (uint64_t)&v29,  v23);
        unint64_t v10 = *((void *)&v29 + 1);
        if ((*((void *)&v29 + 1) & (*((void *)&v29 + 1) - 1LL)) != 0)
        {
          if (*((void *)&v29 + 1) <= v12) {
            unint64_t v3 = v12 % *((void *)&v29 + 1);
          }
          else {
            unint64_t v3 = v12;
          }
        }

        else
        {
          unint64_t v3 = (DWORD2(v29) - 1) & v12;
        }
      }

      uint64_t v24 = v29;
      int v25 = *(void **)(v29 + 8 * v3);
      if (v25)
      {
        *unsigned int v18 = *v25;
      }

      else
      {
        *unsigned int v18 = v30;
        *(void *)&__int128 v30 = v18;
        *(void *)(v24 + 8 * v3) = &v30;
        if (!*v18)
        {
LABEL_46:
          uint64_t v9 = ++*((void *)&v30 + 1);
          uint64_t v8 = (_DWORD *)a2[9];
          goto LABEL_47;
        }

        unint64_t v26 = *(void *)(*v18 + 8LL);
        if ((v10 & (v10 - 1)) != 0)
        {
          if (v26 >= v10) {
            v26 %= v10;
          }
        }

        else
        {
          v26 &= v10 - 1;
        }

        int v25 = (void *)(v29 + 8 * v26);
      }

      *int v25 = v18;
      goto LABEL_46;
    }

LABEL_47:
    ++v11;
  }

  while (v11 < v8[2]);
  uint64_t v27 = (uint64_t **)v30;
  for (j = 0; v27; uint64_t v27 = (uint64_t **)*v27)
  {
    ((void (**)(void, void, void, char *))v7)[2]( v7,  *((unsigned int *)v27 + 4),  *((unsigned int *)v27 + 5),  &j);
    if (j) {
      break;
    }
  }

LABEL_51:
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v29);
LABEL_52:
}

void sub_183E2296C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  _Unwind_Resume(a1);
}

uint64_t _CSMapCopyDebugDescription(uint64_t a1, unsigned int *a2)
{
  unint64_t v4 = (void *)MEMORY[0x186E27B50]();
  int v25 = off_189D658F8;
  v26[0] = 0LL;
  __int128 v32 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v5 = objc_alloc_init(MEMORY[0x189607928]);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  v26[1] = v5;
  *(void *)&__int128 v32 = 0LL;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  DWORD2(v32) = 1065353216;
  LODWORD(v35) = 1065353216;
  WORD4(v35) = 0;
  *(void *)&__int128 v36 = 0LL;
  WORD4(v36) = 257;
  BYTE10(v36) = 0;
  uint64_t v41 = v26;
  CSStore2::AttributedStringWriter::format( (CSStore2::AttributedStringWriter *)&v25,  @"table",  @"%llu (0x%llx)",  *a2,  *a2);
  [MEMORY[0x189603FA8] array];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (CSStore2 **)(a2 + 2);
  do
  {
    CSStore2::NameOfSymbol(*v8, v6);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9) {
      [v7 addObject:v9];
    }

    ++v8;
  }

  while (v8 < (CSStore2 **)a2 + 7);
  objc_msgSend(v7, "componentsJoinedByString:", @", ");
  unint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)&v25, @"callbacks", v10);

  unint64_t v11 = (unsigned int *)*((void *)a2 + 9);
  if (v11)
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:*v11];
    unint64_t v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, @"version", v12);

    [MEMORY[0x189607968] numberWithUnsignedInt:v11[1]];
    int v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, @"unit", v13);

    [MEMORY[0x189607968] numberWithUnsignedInt:v11[2]];
    uint8x8_t v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, @"bucket count", v14);

    [MEMORY[0x189607968] numberWithUnsignedInt:v11[3]];
    int v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, @"empty count", v15);

    [MEMORY[0x189607968] numberWithUnsignedInt:v11[4]];
    unsigned int v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, @"threshold", v16);

    unsigned int v24 = v11[5];
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = MEMORY[0x1895F87A8];
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3321888768LL;
    void v23[2] = ___CSMapCopyDebugDescription_block_invoke;
    v23[3] = &__block_descriptor_48_ea8_32c39_ZTSKZ26_CSMapCopyDebugDescriptionE3__0_e5_v8__0l;
    v23[4] = &v25;
    v23[5] = &v24;
    CSStore2::AttributedStringWriter::withAppliedAttribute( (uint64_t)&v25,  (uint64_t)@"_CSVNum",  (uint64_t)v17,  (uint64_t)v23);

    unsigned int v22 = v11[6];
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
    float v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v18;
    v21[1] = 3321888768LL;
    void v21[2] = ___CSMapCopyDebugDescription_block_invoke_22;
    v21[3] = &__block_descriptor_48_ea8_32c39_ZTSKZ26_CSMapCopyDebugDescriptionE3__1_e5_v8__0l;
    v21[4] = &v25;
    v21[5] = &v22;
    CSStore2::AttributedStringWriter::withAppliedAttribute( (uint64_t)&v25,  (uint64_t)@"_CSVNum",  (uint64_t)v19,  (uint64_t)v21);
  }

  uint64_t v3 = [v5 copy];

  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v25);
  objc_autoreleasePoolPop(v4);
  return v3;
}

void sub_183E22D24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_ea8_32c39_ZTSKZ26_CSMapCopyDebugDescriptionE3__1(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

__n128 __copy_helper_block_ea8_32c39_ZTSKZ26_CSMapCopyDebugDescriptionE3__0(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

void sub_183E22E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E22F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E22F88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  unint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)&OBJC_CLASS____CSVisualizer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_183E23030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E23080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E2311C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_183E23340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E23440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E23528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E23740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E2383C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_183E238D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E239DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_183E23AB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E23E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E23EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_10:
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3321888768LL;
    _OWORD v19[2] = ___ZNK8CSStore26String19getDebugDescriptionEv_block_invoke;
    v19[3] = &__block_descriptor_40_ea8_32c52_ZTSKZNK8CSStore26String19getDebugDescriptionEvE3__0_e5_v8__0l;
    void v19[4] = v20;
    CSStore2::AttributedStringWriter::withAppliedAttribute( (uint64_t)v20,  (uint64_t)@"_CSVNum",  (uint64_t)&unk_189D69BC8,  (uint64_t)v19);
    goto LABEL_11;
  }

  StringCacheEntry = CSStore2::getStringCacheEntry(v16[0], (const CSStore2::Store *)LODWORD(v16[1]));
  if (!StringCacheEntry || !*(_BYTE *)StringCacheEntry) {
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedChar:");
  uint64_t v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)v20, @"retainCount", v9);

LABEL_11:
  [MEMORY[0x189607968] numberWithUnsignedInt:LODWORD(v17[1])];
  unint64_t v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)v20, @"length", v11);

  CSStore2::String::getNSStringNoCopy((CSStore2::String *)v16);
  unint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)v20, @"characters", v12);

  if (BYTE4(v16[1])) {
    int v13 = v17;
  }
  else {
    int v13 = (char **)v17[0];
  }
  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedShort:",  CSStore2::_StringFunctions::getHashCode((CSStore2::_StringFunctions *)v13, (const char *)LODWORD(v17[1])));
  uint8x8_t v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)v20, @"hashCode", v14);

  int v15 = (void *)[v7 copy];
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)v20);

  objc_autoreleasePoolPop(v5);
  return v15;
}

void sub_183E241B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

void sub_183E243BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

void sub_183E245A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_183E249EC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, void *a33)
{
  if (v33) {
    operator delete(v33);
  }

  _Block_object_dispose((const void *)(v34 - 176), 8);
  __int128 v36 = *(void **)(v34 - 128);
  if (v36)
  {
    *(void *)(v34 - 12std::string::resize(&v8, (std::string::size_type)this + 1, 0) = v36;
    operator delete(v36);
  }

  _Unwind_Resume(a1);
}

void sub_183E250E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E251C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_183E2526C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_183E252F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E2552C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  uint64_t v20 = va_arg(va1, void);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);

  _Unwind_Resume(a1);
}

void sub_183E256C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_183E25790( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
}

void sub_183E25850(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E25BF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *___ZN8CSStore27HashMapIjjNS_20_IdentifierFunctionsELy1EE14WriteBreakdownERKNS_5StoreEPKS2_hPh_block_invoke( uint64_t a1, unsigned int a2, size_t __len, int a4, int a5)
{
  if (a4) {
    int v5 = 64;
  }
  else {
    int v5 = -128;
  }
  return memset( (void *)(*(void *)(a1 + 32) + a2),  (v5 | a5 ^ 1) & 0xFFFFFFC1 | (2 * (*(_BYTE *)(a1 + 40) & 0x1F)),  __len);
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

void __Block_byref_object_dispose__34(uint64_t a1)
{
  int8x8_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }

void sub_183E25E88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__624(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void sub_183E25F90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183E261B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_183E26244( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_183E262AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_183E26390( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_183E2650C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183E26618( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  _Unwind_Resume(a1);
}

void sub_183E26890( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::ansiColorCodeFromNSNumber(CSStore2 *this, NSNumber *a2)
{
  int8x8_t v2 = this;
  unsigned int v3 = _NSIsNSNumber();
  if (v3) {
    unsigned int v3 = -[CSStore2 unsignedIntegerValue](v2, "unsignedIntegerValue");
  }
  unsigned int v4 = BYTE2(v3);
  unsigned int v5 = v3 >> 8;
  unsigned int v6 = v3;
  unsigned int v7 = BYTE1(v3);

  if (v4 == v5 && v7 == v6)
  {
    if (v4 <= 0xF5) {
      uint64_t v8 = ((197400 * v4) >> 21) + 232;
    }
    else {
      uint64_t v8 = 15LL;
    }
  }

  else
  {
    uint64_t v8 = (((84215046 * (unint64_t)v6) >> 32)
                      + 36 * ((84215046 * (unint64_t)v4) >> 32)
  }

  return v8;
}

void sub_183E269AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSArrayCreate(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  _DWORD v9[2] = ___CSArrayCreate_block_invoke;
  v9[3] = &__block_descriptor_44_e68__optional_CSStore2::Array_____c_Array___Store____Data_II__B_16__0_v8l;
  char v9[4] = a2;
  int v10 = a3;
  unsigned int v6 = (void *)MEMORY[0x186E27CB8](v9);
  uint64_t Common = _CSArrayCreateCommon(a1, v6, a4);

  return Common;
}

void sub_183E26A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSArrayCreateCommon(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(void *__return_ptr, id, uint64_t);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  unsigned int v15;
  char v16;
  void v17[2];
  void v18[2];
  void v19[2];
  void v20[3];
  void v20[2] = *MEMORY[0x1895F89C0];
  unsigned int v5 = a2;
  if (!a1)
  {
    uint64_t v9 = (void *)MEMORY[0x189607870];
    v17[0] = *MEMORY[0x189607490];
    v17[1] = @"Line";
    v18[0] = @"paramErr";
    v18[1] = &unk_189D69C88;
    [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:2];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 errorWithDomain:*MEMORY[0x189607670] code:-50 userInfo:v10];
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }

  if (performMutatingAssertions)
  {
    unsigned int v6 = *(void *)(a1 + 344);
    if (v6) {
      (***(void (****)(void))(v6 + 8))(*(void *)(v6 + 8));
    }
  }

  v5[2](&v14, v5, a1 + 8);
  if (!v16)
  {
    unint64_t v11 = (void *)MEMORY[0x189607870];
    v19[0] = *MEMORY[0x189607490];
    v19[1] = @"Line";
    v20[0] = @"kCSStoreAllocFailedErr";
    v20[1] = &unk_189D69C70;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:2];
    unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 errorWithDomain:*MEMORY[0x189607670] code:-9493 userInfo:v12];
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
    uint64_t v8 = 0LL;
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  unsigned int v7 = 0LL;
  uint64_t v8 = v15;
  if (!a3) {
    goto LABEL_13;
  }
LABEL_11:
  if (!(_DWORD)v8) {
    *a3 = v7;
  }
LABEL_13:

  return v8;
}

void sub_183E26C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t CSStore2::Array::_Create( CSStore2::Array *this, CSStore2::Store *a2, unsigned int a3, const unsigned int *a4, unsigned int a5)
{
  unsigned int v5 = a5;
  *(_BYTE *)this = 0;
  *((_BYTE *)this + 24) = 0;
  if (a5 <= a3) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = a5;
  }
  Table = (char *)*((void *)a2 + 33);
  if (Table
    || (Table = CSStore2::Store::getTable((CSStore2 **)a2, @"<array>")) != 0LL
    || (unint64_t result = (unint64_t)CSStore2::Store::allocateTable(a2, @"<array>", 0, 0LL),
        (Table = (char *)result) != 0LL))
  {
    if (v5)
    {
      if (*((_WORD *)a4 + 1))
      {
        BOOL v14 = 0;
      }

      else
      {
        unint64_t v12 = 0LL;
        while (v5 - 1LL != v12)
        {
          unsigned int v13 = a4[++v12];
          if (v13 >= 0x10000) {
            goto LABEL_16;
          }
        }

        unint64_t v12 = v5;
LABEL_16:
        BOOL v14 = v12 >= v5;
      }
    }

    else
    {
      BOOL v14 = 1;
    }

    unint64_t result = CSStore2::Array::_GetDataSizeWithCapacity((CSStore2::Array *)v9, v14);
    if (HIDWORD(result))
    {
      unint64_t result = (unint64_t)CSStore2::Store::allocateUnit(a2, (CSStore2::Table *)Table, result, 0);
      if (result)
      {
        int v15 = (int *)(result + 8);
        if (v14) {
          int v16 = 0x20000000;
        }
        else {
          int v16 = 0;
        }
        if (a4 && v5)
        {
          *(_DWORD *)(result + _Block_object_dispose(va, 8) = v16 | v5 & 0x1FFFFFFF;
          unint64_t v17 = (_WORD *)(result + 12);
          if (v14)
          {
            do
            {
              int v18 = *a4++;
              *v17++ = v18;
              --v5;
            }

            while (v5);
          }

          else
          {
            do
            {
              int v19 = *a4++;
              *(_DWORD *)unint64_t v17 = v19;
              v17 += 2;
              --v5;
            }

            while (v5);
          }
        }

        else
        {
          int *v15 = v16;
        }

        *((_BYTE *)this + 24) = 1;
        *(void *)this = a2;
        *((void *)this + 1) = v15;
        int v20 = 4 * *(_DWORD *)result;
        *((_DWORD *)this + 4) = v9;
        *((_DWORD *)this + 5) = v20;
      }
    }
  }

  return result;
}

uint64_t CSStore2::Array::_GetDataSizeWithCapacity(CSStore2::Array *this, int a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a2) {
    uint64_t v2 = 2LL;
  }
  else {
    uint64_t v2 = 4LL;
  }
  uint64_t v3 = this;
  char v4 = 1;
  if (!a2) {
    char v4 = 2;
  }
  unint64_t v5 = (unint64_t)this << v4;
  if (v5 == (v5 & 0xFFFFFFFE) && (v5 & 0xFFFFFFFE) <= 0xFFFFFFFB) {
    return ((_DWORD)v5 + 4) & 0xFFFFFFFE | 0x100000000LL;
  }
  CSStore2::GetLog(this);
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 134218496;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v2;
    __int16 v13 = 2048;
    uint64_t v14 = 4LL;
    _os_log_error_impl( &dword_183DFE000,  v7,  OS_LOG_TYPE_ERROR,  "Overflow sizing array (%llu * %llu + %llu)",  (uint8_t *)&v9,  0x20u);
  }

  return 0LL;
}

uint64_t _CSArrayCreateWithCapacity(uint64_t a1, int a2, void *a3)
{
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  _OWORD v8[2] = ___CSArrayCreateWithCapacity_block_invoke;
  v8[3] = &__block_descriptor_36_e68__optional_CSStore2::Array_____c_Array___Store____Data_II__B_16__0_v8l;
  int v9 = a2;
  unint64_t v5 = (void *)MEMORY[0x186E27CB8](v8);
  uint64_t Common = _CSArrayCreateCommon(a1, v5, a3);

  return Common;
}

void sub_183E26FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Unit *_CSArrayDispose(Unit *result, CSStore2::Store *a2)
{
  if (result && (_DWORD)a2)
  {
    uint64_t v3 = (uint64_t)result;
    if (performMutatingAssertions)
    {
      uint64_t v4 = *(void *)&result->var3[336];
      if (v4) {
        (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
      }
    }

    return CSStore2::Array::Dispose((CSStore2::Array *)(v3 + 8), a2);
  }

  return result;
}

uint64_t _CSArrayGetCapacity(uint64_t a1, unsigned int a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (performConstantAssertions)
    {
      uint64_t v5 = *(void *)(a1 + 344);
      if (v5) {
        (*(void (**)(void))(**(void **)(v5 + 8) + 8LL))(*(void *)(v5 + 8));
      }
    }

    CSStore2::Array::Get((CSStore2::Array *)v6, (CSStore2::Store *)(a1 + 8), a2);
    if (v7) {
      return v6[4];
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t _CSArrayReserveCapacity(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      uint64_t v7 = *(void *)(a1 + 344);
      if (v7) {
        (***(void (****)(void))(v7 + 8))(*(void *)(v7 + 8));
      }
    }

    CSStore2::Array::Get((CSStore2::Array *)v8, (CSStore2::Store *)(a1 + 8), a2);
    if (v8[24]) {
      return CSStore2::Array::reserveCapacity((CSStore2::Array *)v8, a3);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t CSStore2::Array::reserveCapacity(CSStore2::Array *this, unsigned int a2)
{
  uint64_t v3 = this;
  uint64_t v18 = *MEMORY[0x1895F89C0];
  unsigned int v4 = **((_DWORD **)this + 1) & 0x1FFFFFFF;
  unsigned int v5 = *((_DWORD *)this + 4);
  if (v4 >= v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  BOOL v7 = __CFADD__((_DWORD)v6, a2);
  uint64_t v8 = (CSStore2::Array *)(v6 + a2);
  if (!v7)
  {
    this = (CSStore2::Array *)CSStore2::Array::_setCapacity((unint64_t)this, v8, 0);
  }

  CSStore2::GetLog(this);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *((unsigned int *)v3 + 4);
    int v12 = 134218496;
    uint64_t v13 = v11;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2048;
    uint64_t v17 = a2;
    _os_log_error_impl( &dword_183DFE000,  v10,  OS_LOG_TYPE_ERROR,  "Unable to reserve array capacity! Current capacity was %llu, count was %llu, wanted %llu more",  (uint8_t *)&v12,  0x20u);
  }

  return 0LL;
}

uint64_t CSStore2::Array::_setCapacity(unint64_t this, CSStore2::Array *a2, int a3)
{
  unint64_t v3 = (unint64_t)a2;
  unint64_t v4 = this;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a2 >> 29)
  {
LABEL_10:
    CSStore2::GetLog((CSStore2 *)this);
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(unsigned int *)(v4 + 16);
      int v11 = 134218240;
      uint64_t v12 = v10;
      __int16 v13 = 2048;
      uint64_t v14 = v3;
      _os_log_error_impl( &dword_183DFE000,  v9,  OS_LOG_TYPE_ERROR,  "Unable to set array capacity! Current capacity was %llu, wanted %llu",  (uint8_t *)&v11,  0x16u);
    }

    return 0LL;
  }

  unsigned int v5 = *(_DWORD *)(this + 16);
  if (v5 < a2)
  {
    unsigned int v6 = v5 + 4;
    else {
      unint64_t v3 = v6;
    }
    unsigned int v7 = **(_DWORD **)(this + 8);
    goto LABEL_7;
  }

  uint64_t result = 1LL;
  if (a3 && v5 > a2)
  {
    unsigned int v7 = **(_DWORD **)(v4 + 8);
    if ((v7 & 0x1FFFFFFF) < v5) {
      unsigned int v5 = v7 & 0x1FFFFFFF;
    }
    if (v5 <= a2)
    {
LABEL_7:
      this = CSStore2::Array::_GetDataSizeWithCapacity((CSStore2::Array *)v3, (v7 >> 29) & 1);
      if (HIDWORD(this))
      {
        this = CSStore2::Array::_reallocate((CSStore2::Array *)v4, (CSStore2::VM *)this);
        if ((_DWORD)this)
        {
          *(_DWORD *)(v4 + 16) = v3;
          return 1LL;
        }
      }

      goto LABEL_10;
    }
  }

  return result;
}

uint64_t CSStore2::Array::_reallocate(CSStore2::Array *this, CSStore2::VM *a2)
{
  unint64_t v4 = *(CSStore2 ***)this;
  unsigned int v5 = v4[33];
  if (!v5)
  {
    uint64_t result = (uint64_t)CSStore2::Store::getTable(v4, @"<array>");
    if (!result) {
      return result;
    }
    unsigned int v5 = (const CSStore2::Table *)result;
    unint64_t v4 = *(CSStore2 ***)this;
  }

  uint64_t result = (uint64_t)CSStore2::Store::getUnit(v4, v5, *((_DWORD *)this + 5));
  if (result)
  {
    unsigned int v7 = CSStore2::Store::reallocateUnit(*(CSStore2 ***)this, v5, (Unit *)result, a2);
    *((void *)this + 1) = v7->var3;
    *((_DWORD *)this + 5) = 4 * *(_DWORD *)v7;
    return 1LL;
  }

  return result;
}

uint64_t _CSArrayGetCount(uint64_t a1, unsigned int a2)
{
  if (!a1 || !a2) {
    return 0LL;
  }
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8LL))(*(void *)(v4 + 8));
    }
  }

  CSStore2::Array::Get((CSStore2::Array *)v7, (CSStore2::Store *)(a1 + 8), a2);
  if (!v9) {
    return 0LL;
  }
  unsigned int v5 = *(_DWORD *)v7[1] & 0x1FFFFFFF;
  if (v5 >= v8) {
    return v8;
  }
  else {
    return v5;
  }
}

unint64_t _CSArrayGetValueAtIndex(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unint64_t result = 0LL;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a1 && a2)
  {
    if (performConstantAssertions)
    {
      uint64_t v7 = *(void *)(a1 + 344);
      if (v7) {
        (*(void (**)(void))(**(void **)(v7 + 8) + 8LL))(*(void *)(v7 + 8));
      }
    }

    CSStore2::Array::Get((CSStore2::Array *)&v17, (CSStore2::Store *)(a1 + 8), a2);
    if (v19)
    {
      unsigned int v9 = **(_DWORD **)&v18[4] & 0x1FFFFFFF;
      if (v9 >= *(_DWORD *)&v18[12]) {
        uint64_t v10 = *(unsigned int *)&v18[12];
      }
      else {
        uint64_t v10 = v9;
      }
      if (v10 <= a3)
      {
        CSStore2::GetLog(v8);
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v17 = 134218240;
          *(void *)uint64_t v18 = a3;
          *(_WORD *)&v18[8] = 2048;
          *(void *)&v18[10] = v10;
          _os_log_error_impl( &dword_183DFE000,  v14,  OS_LOG_TYPE_ERROR,  "Out-of-bounds array read: %llu >= %llu",  (uint8_t *)&v17,  0x16u);
        }

        LOBYTE(v12) = 0;
        uint64_t v15 = 0LL;
        unsigned int v13 = 0;
      }

      else
      {
        uint64_t v11 = *(void *)&v18[4] + 4LL;
        if ((**(_DWORD **)&v18[4] & 0x20000000) != 0)
        {
          LOWORD(v12) = *(_WORD *)(v11 + 2LL * a3);
          unsigned int v13 = v12 & 0xFF00;
        }

        else
        {
          int v12 = *(_DWORD *)(v11 + 4LL * a3);
          unsigned int v13 = v12 & 0xFFFFFF00;
        }

        uint64_t v15 = 0x100000000LL;
      }

      unint64_t v16 = v15 | v13 | v12;
      if (v16 <= 0x100000000LL) {
        return 0x100000000LL;
      }
      else {
        return v16;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void _CSArraySetValueAtIndex(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      uint64_t v8 = *(void *)(a1 + 344);
      if (v8) {
        (***(void (****)(void))(v8 + 8))(*(void *)(v8 + 8));
      }
    }

    CSStore2::Array::Get((CSStore2::Array *)&v17, (CSStore2::Store *)(a1 + 8), a2);
    if (v20)
    {
      unsigned int v10 = *(_DWORD *)v18 & 0x1FFFFFFF;
      if (v10 >= v19) {
        uint64_t v11 = v19;
      }
      else {
        uint64_t v11 = v10;
      }
      if (v11 > a3)
      {
        if ((*(_DWORD *)v18 & 0x20000000) == 0 || HIWORD(a4))
        {
          uint64_t v15 = (CSStore2 *)CSStore2::Array::_unpack((CSStore2::Array *)&v17);
          if (!(_DWORD)v15) {
            goto LABEL_21;
          }
          CSStore2::GetLog(v15);
          int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            unsigned int v13 = "Unpacking array (or already unpacked) for value replacement";
            goto LABEL_26;
          }
        }

        else
        {
          CSStore2::GetLog(v9);
          int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            unsigned int v13 = "Keeping array packed for value replacement";
LABEL_26:
            _os_log_debug_impl(&dword_183DFE000, v12, OS_LOG_TYPE_DEBUG, v13, buf, 2u);
          }
        }

LABEL_21:
        uint64_t v16 = v18 + 4;
        if ((*(_BYTE *)(v18 + 3) & 0x20) != 0) {
          *(_WORD *)(v16 + 2LL * a3) = a4;
        }
        else {
          *(_DWORD *)(v16 + 4LL * a3) = a4;
        }
        return;
      }

      CSStore2::GetLog(v9);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v22 = a3;
        __int16 v23 = 2048;
        uint64_t v24 = v11;
        _os_log_error_impl( &dword_183DFE000,  v14,  OS_LOG_TYPE_ERROR,  "Out-of-bounds array write: %llu >= %llu",  buf,  0x16u);
      }
    }
  }

uint64_t CSStore2::Array::_unpack(CSStore2::Array *this)
{
  if ((*(_BYTE *)(*((void *)this + 1) + 3LL) & 0x20) != 0)
  {
    CSStore2::Array::getAllValues(&__p, (uint64_t)this);
    unint64_t DataSizeWithCapacity = CSStore2::Array::_GetDataSizeWithCapacity((CSStore2::Array *)*((unsigned int *)this + 4), 0);
    uint64_t v1 = 0LL;
    if (!HIDWORD(DataSizeWithCapacity)) {
      goto LABEL_15;
    }
    if (!CSStore2::Array::_reallocate(this, (CSStore2::VM *)DataSizeWithCapacity))
    {
      uint64_t v1 = 0LL;
      goto LABEL_15;
    }

    **((_DWORD **)this + 1) &= ~0x20000000u;
    uint64_t v4 = *((void *)this + 1);
    std::vector<unsigned int>::pointer begin = __p.__begin_;
    if ((*(_BYTE *)(v4 + 3) & 0x20) != 0)
    {
      if (__p.__end_ != __p.__begin_)
      {
        unsigned int v9 = (_WORD *)(v4 + 4);
        int64_t v10 = __p.__end_ - __p.__begin_;
        do
        {
          unsigned int v11 = *begin++;
          *v9++ = v11;
          --v10;
        }

        while (v10);
        goto LABEL_14;
      }
    }

    else if (__p.__end_ != __p.__begin_)
    {
      unsigned int v6 = (_DWORD *)(v4 + 4);
      int64_t v7 = __p.__end_ - __p.__begin_;
      do
      {
        int v8 = *begin++;
        *v6++ = v8;
        --v7;
      }

      while (v7);
LABEL_14:
      uint64_t v1 = 1LL;
LABEL_15:
      std::vector<unsigned int>::pointer begin = __p.__begin_;
      if (!__p.__begin_) {
        return v1;
      }
LABEL_16:
      __p.__end_ = begin;
      operator delete(begin);
      return v1;
    }

    uint64_t v1 = 1LL;
    if (!__p.__begin_) {
      return v1;
    }
    goto LABEL_16;
  }

  return 1LL;
}

void sub_183E27910( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void _CSArrayInsertValueAtIndex(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  unsigned int v9 = a4;
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      uint64_t v7 = *(void *)(a1 + 344);
      if (v7) {
        (***(void (****)(void))(v7 + 8))(*(void *)(v7 + 8));
      }
    }

    CSStore2::Array::Get((CSStore2::Array *)v8, (CSStore2::Store *)(a1 + 8), a2);
    if (v8[24]) {
      CSStore2::Array::insertValueAtIndex((CSStore2::Array *)v8, a3, &v9);
    }
  }

void CSStore2::Array::insertValueAtIndex(CSStore2::Array *this, unsigned int a2, const unsigned int *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  unsigned int v4 = **((_DWORD **)this + 1) & 0x1FFFFFFF;
  unsigned int v5 = *((_DWORD *)this + 4);
  if (v4 >= v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  if (v6 < a2)
  {
    CSStore2::GetLog(this);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v21 = 134218240;
      uint64_t v22 = a2;
      __int16 v23 = 2048;
      uint64_t v24 = v6;
      int v8 = "Out-of-bounds array insertion: %llu > %llu";
      unsigned int v9 = v7;
      uint32_t v10 = 22;
LABEL_28:
      _os_log_error_impl(&dword_183DFE000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v21, v10);
      goto LABEL_13;
    }

    goto LABEL_13;
  }

  unsigned int v13 = (CSStore2 *)CSStore2::Array::reserveCapacity(this, 1u);
  if ((v13 & 1) == 0)
  {
    CSStore2::GetLog(v13);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v21 = 134217984;
      uint64_t v22 = v6;
      int v8 = "Failed to reserve array capacity when preparing for new value (old count = %llu)";
      unsigned int v9 = v7;
      uint32_t v10 = 12;
      goto LABEL_28;
    }

LABEL_13:
    return;
  }

  if ((*(_BYTE *)(*((void *)this + 1) + 3LL) & 0x20) != 0 && !HIWORD(*a3))
  {
    CSStore2::GetLog(v13);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v21) = 0;
      uint64_t v15 = "Array was packed and can remain packed with new values";
LABEL_30:
      _os_log_debug_impl(&dword_183DFE000, v14, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v21, 2u);
      goto LABEL_16;
    }

    goto LABEL_16;
  }

  uint64_t v16 = (CSStore2 *)CSStore2::Array::_unpack(this);
  int v17 = (int)v16;
  CSStore2::GetLog(v16);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v21) = 0;
      uint64_t v15 = "Array was unpacked or needed to be unpacked to take new values";
      goto LABEL_30;
    }

LABEL_16:
    uint64_t v19 = *((void *)this + 1);
    uint64_t v20 = v19 + 4;
    if ((*(_BYTE *)(v19 + 3) & 0x20) != 0)
    {
      *(_WORD *)(v20 + 2LL * a2) = *(_WORD *)a3;
    }

    else
    {
      *(_DWORD *)(v20 + 4LL * a2) = *a3;
    }

    **((_DWORD **)this + 1) = **((_DWORD **)this + 1) & 0xE0000000 | (v6 + 1) & 0x1FFFFFFF;
    return;
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v21 = 134217984;
    uint64_t v22 = v6;
    _os_log_error_impl( &dword_183DFE000,  v14,  OS_LOG_TYPE_ERROR,  "Failed to unpack array when preparing for new value (old count = %llu)",  (uint8_t *)&v21,  0xCu);
  }
}

void _CSArrayAppendValue(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unsigned int v11 = a3;
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      uint64_t v5 = *(void *)(a1 + 344);
      if (v5) {
        (***(void (****)(void))(v5 + 8))(*(void *)(v5 + 8));
      }
    }

    CSStore2::Array::Get((CSStore2::Array *)v7, (CSStore2::Store *)(a1 + 8), a2);
    if (v10)
    {
      if ((*v8 & 0x1FFFFFFFu) >= v9) {
        unsigned int v6 = v9;
      }
      else {
        unsigned int v6 = *v8 & 0x1FFFFFFF;
      }
      CSStore2::Array::insertValueAtIndex((CSStore2::Array *)v7, v6, &v11);
    }
  }

void _CSArrayRemoveValueAtIndex(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      uint64_t v6 = *(void *)(a1 + 344);
      if (v6) {
        (***(void (****)(void))(v6 + 8))(*(void *)(v6 + 8));
      }
    }

    CSStore2::Array::Get((CSStore2::Array *)&v19, (CSStore2::Store *)(a1 + 8), a2);
    if (v22)
    {
      int v8 = v20;
      unsigned int v9 = *v20;
      unsigned int v10 = *v20 & 0x1FFFFFFF;
      if (v10 >= v21) {
        uint64_t v11 = v21;
      }
      else {
        uint64_t v11 = v10;
      }
      if (v11 <= a3)
      {
        CSStore2::GetLog(v7);
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v24 = a3;
          __int16 v25 = 2048;
          uint64_t v26 = v11;
          _os_log_error_impl( &dword_183DFE000,  v14,  OS_LOG_TYPE_ERROR,  "Out-of-bounds array erasure: %llu >= %llu",  buf,  0x16u);
        }
      }

      else
      {
        unsigned int v12 = v11 - 1;
        if ((_DWORD)v11 == 1)
        {
          unsigned int v13 = v9 & 0xE0000000;
        }

        else
        {
          if (v12 > a3)
          {
            uint64_t v15 = v20 + 1;
            if ((v9 & 0x20000000) != 0)
            {
              uint64_t v16 = (char *)v15 + 2 * a3;
              int v17 = v16 + 2;
              uint64_t v18 = (char *)v15 + 2 * v11;
            }

            else
            {
              uint64_t v16 = (char *)&v15[a3];
              int v17 = v16 + 4;
              uint64_t v18 = &v15[v11];
            }

            if (v18 != v17) {
              memmove(v16, v17, v18 - v17);
            }
          }

          unsigned int v13 = *v8 & 0xE0000000 | v12;
        }

        *int v8 = v13;
        CSStore2::Array::_shrinkCapacityIfNeeded((unint64_t)&v19);
      }
    }
  }

unint64_t CSStore2::Array::_shrinkCapacityIfNeeded(unint64_t this)
{
  unsigned int v1 = *(_DWORD *)(this + 16);
  unsigned int v2 = **(_DWORD **)(this + 8) & 0x1FFFFFFF;
  if (v2 >= v1) {
    unint64_t v3 = v1;
  }
  else {
    unint64_t v3 = v2;
  }
  return this;
}

void _CSArrayRemoveAllValues(uint64_t a1, unsigned int a2)
{
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      uint64_t v4 = *(void *)(a1 + 344);
      if (v4) {
        (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
      }
    }

    CSStore2::Array::Get((CSStore2::Array *)&v5, (CSStore2::Store *)(a1 + 8), a2);
    if (v7)
    {
      *v6 &= 0xE0000000;
      CSStore2::Array::_shrinkCapacityIfNeeded((unint64_t)&v5);
    }
  }

void _CSArrayEnumerateAllValues(uint64_t a1, unsigned int a2, void *a3)
{
  id v6 = a3;
  if (performConstantAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (*(void (**)(void))(**(void **)(v5 + 8) + 8LL))(*(void *)(v5 + 8));
    }
  }

  CSStore2::Array::Get((CSStore2::Array *)&v12, (CSStore2::Store *)(a1 + 8), a2);
  if (v14)
  {
    __int128 v9 = v12;
    uint64_t v10 = v13;
    char v11 = 1;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    void v7[2] = ___CSArrayEnumerateAllValues_block_invoke;
    __int128 v7[3] = &unk_189D66928;
    id v8 = v6;
    CSStore2::Array::enumerateValues((uint64_t)&v9, v7);
  }
}

void sub_183E28010( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

id CSStore2::GetLog(CSStore2 *this)
{
  return (id)CSStore2::GetLog(void)::result;
}

void ___ZN8CSStore26GetLogEv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.coreservicesstore", "default");
  unsigned int v1 = (void *)CSStore2::GetLog(void)::result;
  CSStore2::GetLog(void)::unint64_t result = (uint64_t)v0;
}

id CSStore2::_CopyNameOfTypeImpl(std::string *this)
{
  unsigned int v1 = this;
  uint64_t size = this->__r_.__value_.__s.__size_;
  std::string::size_type v3 = this->__r_.__value_.__r.__words[0];
  std::string::size_type v4 = this->__r_.__value_.__l.__size_;
  if ((size & 0x80u) == 0LL) {
    uint64_t v5 = this;
  }
  else {
    uint64_t v5 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  if ((size & 0x80u) == 0LL) {
    std::string::size_type v6 = this->__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type v6 = this->__r_.__value_.__l.__size_;
  }
  if (v6)
  {
    char v7 = (unsigned __int8 *)v5 + v6;
    id v8 = v5;
    __int128 v9 = (std::string *)v7;
    do
    {
      uint64_t v10 = v8;
      char v11 = (unsigned __int8 *)v8;
      while (1)
      {
        int v12 = *v11++;
        if (v12 == 93) {
          break;
        }
        uint64_t v10 = (std::string *)v11;
        if (v11 == v7)
        {
          uint64_t v10 = v9;
          goto LABEL_14;
        }
      }

      id v8 = (std::string *)((char *)&v10->__r_.__value_.__l.__data_ + 1);
      __int128 v9 = v10;
    }

    while (v11 != v7);
LABEL_14:
    if (v10 != (std::string *)v7 && (char *)v10 - (char *)v5 != -1)
    {
      int v13 = (char)size;
      std::string::size_type v14 = v3 + v4;
      uint64_t v15 = (char *)v1 + size;
      if (v13 < 0) {
        uint64_t v15 = (char *)v14;
      }
      std::string::erase(v1, (char *)v10 - (char *)v5, v15 - (char *)v10);
    }
  }

  std::string::basic_string[abi:nn180100]<0>(__p, "[T = ");
  int64_t v16 = v1->__r_.__value_.__s.__size_;
  if ((v16 & 0x80u) == 0LL) {
    int v17 = v1;
  }
  else {
    int v17 = (std::string *)v1->__r_.__value_.__r.__words[0];
  }
  if ((v42 & 0x80u) == 0) {
    uint64_t v18 = __p;
  }
  else {
    uint64_t v18 = (void **)__p[0];
  }
  if ((v42 & 0x80u) == 0) {
    int64_t v19 = v42;
  }
  else {
    int64_t v19 = (int64_t)__p[1];
  }
  if (v19)
  {
    if ((v16 & 0x80u) != 0LL) {
      int64_t v16 = v1->__r_.__value_.__l.__size_;
    }
    if (v16 >= v19)
    {
      uint64_t v20 = (char *)v17 + v16;
      int v21 = *(char *)v18;
      char v22 = v17;
      while (1)
      {
        int64_t v23 = v16 - v19;
        if (v23 == -1) {
          break;
        }
        uint64_t v24 = (char *)memchr(v22, v21, v23 + 1);
        if (!v24) {
          break;
        }
        __int16 v25 = v24;
        if (!memcmp(v24, v18, v19))
        {
          int64_t v26 = v25 - (char *)v17;
          if (v25 == v20 || v26 == -1) {
            goto LABEL_49;
          }
          goto LABEL_39;
        }

        char v22 = (std::string *)(v25 + 1);
        int64_t v16 = v20 - (v25 + 1);
        if (v16 < v19) {
          goto LABEL_49;
        }
      }
    }
  }

  else
  {
    int64_t v26 = 0LL;
LABEL_39:
    std::string::erase(v1, 0LL, v26 + v19);
  }

  while (1)
  {
LABEL_49:
    uint64_t v30 = MEMORY[0x1895F8770];
    if ((char)v1->__r_.__value_.__s.__size_ < 0)
    {
      std::string::size_type v31 = v1->__r_.__value_.__l.__size_;
      if (!v31) {
        goto LABEL_58;
      }
      __int128 v32 = (std::string *)v1->__r_.__value_.__r.__words[0];
    }

    else
    {
      std::string::size_type v31 = v1->__r_.__value_.__s.__size_;
      if (!v1->__r_.__value_.__s.__size_) {
        goto LABEL_58;
      }
      __int128 v32 = v1;
    }

    unsigned int v33 = v32->__r_.__value_.__s.__data_[v31 - 1];
    if (!((v33 & 0x80000000) != 0
         ? __maskrune(v33, 0x4000uLL)
         : *(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v33 + 60) & 0x4000))
      break;
    if ((char)v1->__r_.__value_.__s.__size_ < 0)
    {
      __int128 v29 = (std::string *)v1->__r_.__value_.__r.__words[0];
      uint64_t v28 = v1->__r_.__value_.__l.__size_ - 1;
      v1->__r_.__value_.__l.__size_ = v28;
    }

    else
    {
      uint64_t v28 = v1->__r_.__value_.__s.__size_ - 1LL;
      v1->__r_.__value_.__s.__size_ = v28 & 0x7F;
      __int128 v29 = v1;
    }

    v29->__r_.__value_.__s.__data_[v28] = 0;
  }

  while (1)
  {
LABEL_58:
    int v35 = (char)v1->__r_.__value_.__s.__size_;
    if (v35 < 0)
    {
      __int128 v36 = (std::string *)v1->__r_.__value_.__r.__words[0];
      if (!v1->__r_.__value_.__l.__size_) {
        goto LABEL_68;
      }
    }

    else
    {
      __int128 v36 = v1;
      if (!v1->__r_.__value_.__s.__size_) {
        goto LABEL_70;
      }
    }

    unsigned int v37 = v36->__r_.__value_.__s.__data_[0];
    if ((v37 & 0x80000000) != 0) {
      break;
    }
    if ((*(_DWORD *)(v30 + 4LL * v37 + 60) & 0x4000) == 0) {
      goto LABEL_67;
    }
LABEL_66:
    std::string::erase(v1, 0LL, 1uLL);
  }

  int v38 = __maskrune(v37, 0x4000uLL);
  LOBYTE(v35) = v1->__r_.__value_.__s.__size_;
  if (v38) {
    goto LABEL_66;
  }
LABEL_67:
  __int128 v36 = (std::string *)v1->__r_.__value_.__r.__words[0];
LABEL_68:
  if ((v35 & 0x80u) != 0) {
    unsigned int v1 = v36;
  }
LABEL_70:
  [NSString stringWithUTF8String:v1];
  __int128 v39 = (void *)objc_claimAutoreleasedReturnValue();
  return v39;
}

void sub_183E283C4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

id CSStore2::NameOfSymbol(CSStore2 *this, const void *a2)
{
  std::string::size_type v4 = (char *)CSStore2::NameOfSymbol(void const*)::functionNames;
  if (!CSStore2::NameOfSymbol(void const*)::functionNames)
  {
    std::string::size_type v4 = (char *)operator new(0x28uLL);
    *(_OWORD *)std::string::size_type v4 = 0u;
    *((_OWORD *)v4 + 1) = 0u;
    *((_DWORD *)v4 + _Block_object_dispose(va, 8) = 1065353216;
    CSStore2::NameOfSymbol(void const*)::functionNames = (uint64_t)v4;
  }

  unint64_t v5 = 0x9DDFEA08EB382D69LL * (((8 * (_DWORD)this) + 8LL) ^ ((unint64_t)this >> 32));
  unint64_t v6 = 0x9DDFEA08EB382D69LL * (((unint64_t)this >> 32) ^ (v5 >> 47) ^ v5);
  unint64_t v7 = 0x9DDFEA08EB382D69LL * (v6 ^ (v6 >> 47));
  int8x8_t v8 = *(int8x8_t *)(v4 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8(v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v10 = v7;
      if (v7 >= *(void *)&v8) {
        unint64_t v10 = v7 % *(void *)&v8;
      }
    }

    else
    {
      unint64_t v10 = v7 & (*(void *)&v8 - 1LL);
    }

    char v11 = *(uint64_t ****)(*(void *)v4 + 8 * v10);
    if (v11)
    {
      for (int i = *v11; i; int i = (uint64_t **)*i)
      {
        unint64_t v13 = (unint64_t)i[1];
        if (v13 == v7)
        {
          if (i[2] == (uint64_t *)this)
          {
            unsigned int v52 = i[3];
            int64_t v19 = v52;
            if (!v52) {
              break;
            }
            goto LABEL_28;
          }
        }

        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v13 >= *(void *)&v8) {
              v13 %= *(void *)&v8;
            }
          }

          else
          {
            v13 &= *(void *)&v8 - 1LL;
          }

          if (v13 != v10) {
            break;
          }
        }
      }
    }
  }

  memset(&v55, 0, sizeof(v55));
  if (dladdr(this, &v55))
  {
    dli_sname = v55.dli_sname;
    if (v55.dli_sname)
    {
      int status = 0;
      uint64_t v15 = __cxa_demangle(v55.dli_sname, 0LL, 0LL, &status);
      int64_t v16 = v15;
      if (v15)
      {
        if (!strncmp(v15, "invocation function for block in ", 0x21uLL))
        {
          uint64_t v43 = (void *)[@"^() in " mutableCopy];
          [NSString stringWithUTF8String:v16 + 33];
          uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
          [v43 appendString:v44];

          int64_t v19 = (void *)[v43 copy];
          free(v16);

          goto LABEL_28;
        }

        uint64_t v17 = [objc_alloc(NSString) initWithBytesNoCopy:v16 length:strlen(v16) encoding:4 freeWhenDone:1];
      }

      else
      {
        uint64_t v17 = [NSString stringWithUTF8String:dli_sname];
      }
    }

    else
    {
      id v18 = objc_alloc(NSString);
      uint64_t v17 = objc_msgSend(v18, "initWithFormat:", @"0x%llx", v55.dli_saddr);
    }
  }

  else
  {
    uint64_t v17 = objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"0x%llx?", this);
  }

  int64_t v19 = (void *)v17;
LABEL_28:
  uint64_t v20 = CSStore2::NameOfSymbol(void const*)::functionNames;
  unint64_t v21 = *(void *)(CSStore2::NameOfSymbol(void const*)::functionNames + 8);
  if (v21)
  {
    uint8x8_t v22 = (uint8x8_t)vcnt_s8((int8x8_t)v21);
    v22.i16[0] = vaddlv_u8(v22);
    if (v22.u32[0] > 1uLL)
    {
      unint64_t v2 = v7;
      if (v7 >= v21) {
        unint64_t v2 = v7 % v21;
      }
    }

    else
    {
      unint64_t v2 = v7 & (v21 - 1);
    }

    int64_t v23 = *(uint64_t ****)(*(void *)CSStore2::NameOfSymbol(void const*)::functionNames + 8 * v2);
    if (v23)
    {
      for (char j = *v23; j; char j = (uint64_t **)*j)
      {
        unint64_t v25 = (unint64_t)j[1];
        if (v25 == v7)
        {
        }

        else
        {
          if (v22.u32[0] > 1uLL)
          {
            if (v25 >= v21) {
              v25 %= v21;
            }
          }

          else
          {
            v25 &= v21 - 1;
          }

          if (v25 != v2) {
            break;
          }
        }
      }
    }
  }

  int64_t v26 = operator new(0x20uLL);
  uint64_t v27 = (void *)(v20 + 16);
  void *v26 = 0LL;
  v26[1] = v7;
  void v26[2] = this;
  v26[3] = v19;
  float v28 = (float)(unint64_t)(*(void *)(v20 + 24) + 1LL);
  float v29 = *(float *)(v20 + 32);
  if (!v21 || (float)(v29 * (float)v21) < v28)
  {
    BOOL v30 = 1LL;
    if (v21 >= 3) {
      BOOL v30 = (v21 & (v21 - 1)) != 0;
    }
    unint64_t v31 = v30 | (2 * v21);
    unint64_t v32 = vcvtps_u32_f32(v28 / v29);
    if (v31 <= v32) {
      int8x8_t prime = (int8x8_t)v32;
    }
    else {
      int8x8_t prime = (int8x8_t)v31;
    }
    if (*(void *)&prime == 1LL)
    {
      int8x8_t prime = (int8x8_t)2LL;
    }

    else if ((*(void *)&prime & (*(void *)&prime - 1LL)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }

    unint64_t v21 = *(void *)(v20 + 8);
    if (*(void *)&prime > v21) {
      goto LABEL_57;
    }
    if (*(void *)&prime < v21)
    {
      unint64_t v40 = vcvtps_u32_f32((float)*(unint64_t *)(v20 + 24) / *(float *)(v20 + 32));
      if (v21 < 3 || (uint8x8_t v41 = (uint8x8_t)vcnt_s8((int8x8_t)v21), v41.i16[0] = vaddlv_u8(v41), v41.u32[0] > 1uLL))
      {
        unint64_t v40 = std::__next_prime(v40);
      }

      else
      {
        uint64_t v42 = 1LL << -(char)__clz(v40 - 1);
        if (v40 >= 2) {
          unint64_t v40 = v42;
        }
      }

      if (*(void *)&prime <= v40) {
        int8x8_t prime = (int8x8_t)v40;
      }
      if (*(void *)&prime >= v21)
      {
        unint64_t v21 = *(void *)(v20 + 8);
      }

      else
      {
        if (prime)
        {
LABEL_57:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v34 = operator new(8LL * *(void *)&prime);
          int v35 = *(void **)v20;
          *(void *)uint64_t v20 = v34;
          if (v35) {
            operator delete(v35);
          }
          uint64_t v36 = 0LL;
          *(int8x8_t *)(v20 + _Block_object_dispose(va, 8) = prime;
          do
            *(void *)(*(void *)v20 + 8 * v36++) = 0LL;
          while (*(void *)&prime != v36);
          unsigned int v37 = (void *)*v27;
          if (*v27)
          {
            unint64_t v38 = v37[1];
            uint8x8_t v39 = (uint8x8_t)vcnt_s8(prime);
            v39.i16[0] = vaddlv_u8(v39);
            if (v39.u32[0] > 1uLL)
            {
              if (v38 >= *(void *)&prime) {
                v38 %= *(void *)&prime;
              }
            }

            else
            {
              v38 &= *(void *)&prime - 1LL;
            }

            *(void *)(*(void *)v20 + 8 * v3_Block_object_dispose(va, 8) = v27;
            uint64_t v45 = (void *)*v37;
            if (*v37)
            {
              do
              {
                unint64_t v46 = v45[1];
                if (v39.u32[0] > 1uLL)
                {
                  if (v46 >= *(void *)&prime) {
                    v46 %= *(void *)&prime;
                  }
                }

                else
                {
                  v46 &= *(void *)&prime - 1LL;
                }

                if (v46 != v38)
                {
                  if (!*(void *)(*(void *)v20 + 8 * v46))
                  {
                    *(void *)(*(void *)v20 + 8 * v46) = v37;
                    goto LABEL_83;
                  }

                  *unsigned int v37 = *v45;
                  *uint64_t v45 = **(void **)(*(void *)v20 + 8 * v46);
                  **(void **)(*(void *)v20 + 8 * v46) = v45;
                  uint64_t v45 = v37;
                }

                unint64_t v46 = v38;
LABEL_83:
                unsigned int v37 = v45;
                uint64_t v45 = (void *)*v45;
                unint64_t v38 = v46;
              }

              while (v45);
            }
          }

          unint64_t v21 = (unint64_t)prime;
          goto LABEL_87;
        }

        uint64_t v53 = *(void **)v20;
        *(void *)uint64_t v20 = 0LL;
        if (v53) {
          operator delete(v53);
        }
        unint64_t v21 = 0LL;
        *(void *)(v20 + _Block_object_dispose(va, 8) = 0LL;
      }
    }

LABEL_101:
  ++*(void *)(v20 + 24);
LABEL_102:
  os_unfair_lock_unlock((os_unfair_lock_t)&CSStore2::NameOfSymbol(void const*)::lock);
  id v50 = v19;

  return v50;
}

void sub_183E28A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

CFStringRef CFBundleCopyLocalizedString( CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x189602828](bundle, key, value, tableName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1896028B0](bundleID);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x189602908](bundle, key);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

Boolean CFFileSecurityGetMode(CFFileSecurityRef fileSec, mode_t *mode)
{
  return MEMORY[0x189602CF0](fileSec, mode);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x189603418](alloc, theString);
}

CFStringRef CFStringCreateWithBytesNoCopy( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x189603458]( alloc,  bytes,  numBytes,  *(void *)&encoding,  isExternalRepresentation,  contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x189603520](theString);
}

void NSCopyMemoryPages(const void *source, void *dest, NSUInteger bytes)
{
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1896075A0](range1.location, range1.length, range2.location, range2.length);
  result.unsigned int length = v3;
  result.location = v2;
  return result;
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x189607690]();
}

NSUInteger NSRoundDownToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x1896076D8](bytes);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x189607710](range.location, range.length);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x189607720]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1896077B0](range1.location, range1.length, range2.location, range2.length);
  result.unsigned int length = v3;
  result.location = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x189604238]();
}

uint64_t _CFGetEUID()
{
  return MEMORY[0x1896042F8]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1896048B0]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1896048D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1896142C8](this, __pos, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
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
  return MEMORY[0x1896143E0]();
}

{
  return MEMORY[0x189614400]();
}

{
  return MEMORY[0x189614408]();
}

{
  return MEMORY[0x189614418]();
}

{
  return MEMORY[0x189614430]();
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

uint64_t std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>()
{
  return MEMORY[0x189614590]();
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
  return (void *)off_189D65210(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x1896147C8](lpmangled, lpout, lpoutlen, lpstatus);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
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

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1895F94C0]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x189617578](crc, buf, *(void *)&len);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class( dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FABB8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_data_t dispatch_data_create( const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1895FABF8](buffer, size, queue, destructor);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1895FAF48](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1895FAFA8](*(void *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
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

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FB2A0](a1);
}

double fmod(double a1, double a2)
{
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FB378](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1895FB428](__stream, a2, *(void *)&__whence);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1895FB478](__stream);
}

FILE *__cdecl funopen( const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return (FILE *)MEMORY[0x1895FB4B8](a1, a2, a3, a4, a5);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

int gzclose(gzFile file)
{
  return MEMORY[0x1896175B8](file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return (gzFile)MEMORY[0x1896175D0](*(void *)&fd, mode);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return (const char *)MEMORY[0x1896175D8](file, errnum);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x1896175F8](file, buf, *(void *)&len);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x189617600](file, buf, *(void *)&len);
}

int isatty(int a1)
{
  return MEMORY[0x1895FB868](*(void *)&a1);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkstemp(char *a1)
{
  return MEMORY[0x1895FBF38](a1);
}

int mkstemp_dprotected_np(char *path, int dpclass, int dpflags)
{
  return MEMORY[0x1895FBF40](path, *(void *)&dpclass, *(void *)&dpflags);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

void os_unfair_lock_assert_not_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FC6C8]();
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1895FCB20]();
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FCFD0](a1, a2);
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

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

void uuid_generate(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1895FD548](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}

kern_return_t vm_protect( vm_map_t target_task, vm_address_t address, vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x1895FD598]( *(void *)&target_task,  address,  size,  *(void *)&set_maximum,  *(void *)&new_protection);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1895FDB08](ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

uint64_t objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_);
}