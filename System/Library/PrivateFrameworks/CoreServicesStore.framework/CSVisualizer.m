@interface CSVisualizer
@end

@implementation CSVisualizer

void __57___CSVisualizer_enumerateReferencesToUnit_inTable_block___block_invoke( void *a1,  unsigned int *a2,  uint64_t a3)
{
  unsigned int v5 = *a2;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __57___CSVisualizer_enumerateReferencesToUnit_inTable_block___block_invoke_2;
  v9[3] = &unk_189D66718;
  int v13 = 4 * v5;
  uint64_t v14 = a1[8];
  v7 = (CSStore2 **)a1[6];
  uint64_t v6 = a1[7];
  v8 = (void *)a1[5];
  v9[4] = a1[4];
  uint64_t v11 = v6;
  id v10 = v8;
  uint64_t v12 = a3;
  CSStore2::Store::enumerateUnits(v7, a2, v9);
}

void __57___CSVisualizer_enumerateReferencesToUnit_inTable_block___block_invoke_2( uint64_t a1,  _DWORD *a2,  _BYTE *a3)
{
  uint64_t v6 = (void *)MEMORY[0x186E27B50]();
  if (*(_DWORD *)(a1 + 64) != *(_DWORD *)(a1 + 68) || 4 * *a2 != *(_DWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "descriptionOfUnit:inTable:", (4 * *a2));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && [*(id *)(a1 + 48) unitDescription:v7 referencesUnit:*(unsigned int *)(a1 + 72) inTable:*(unsigned int *)(a1 + 68)])
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      *a3 = 0;
      **(_BYTE **)(a1 + 56) = 0;
    }
  }

  objc_autoreleasePoolPop(v6);
}

uint64_t __31___CSVisualizer_breakDownUsage__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) breakDownTable:a2 inStore:*(void *)(a1 + 40) buffer:*(void *)(a1 + 48)];
}

id __42___CSVisualizer_setStandardTableFunctions__block_invoke(uint64_t a1, int a2, int a3, unsigned int a4)
{
  if (!(_BYTE)v27) {
    return 0LL;
  }
  uint64_t v4 = v26;
  uint64_t v5 = DWORD2(v26);
  uint64_t v6 = (void *)MEMORY[0x186E27B50]();
  id v7 = objc_alloc_init(MEMORY[0x189607928]);
  v25 = off_189D658F8;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v8 = v7;
  *((void *)&v26 + 1) = v8;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  *(void *)&__int128 v32 = 0LL;
  DWORD2(v32) = 1065353216;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  LODWORD(v35) = 1065353216;
  WORD4(v35) = 0;
  *(void *)&__int128 v36 = 0LL;
  WORD4(v36) = 257;
  BYTE10(v36) = 0;
  v41 = &v26;
  [MEMORY[0x189607968] numberWithBool:(*(_DWORD *)v4 >> 29) & 1];
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, @"packed", v9);

  unsigned int v10 = *(_DWORD *)v4 & 0x1FFFFFFF;
  else {
    uint64_t v11 = v10;
  }
  [MEMORY[0x189607968] numberWithUnsignedInt:v5];
  uint64_t v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, @"capacity", v12);

  [MEMORY[0x189607968] numberWithUnsignedInt:v11];
  int v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, @"count", v13);

  BOOL v15 = v5 > v10 && (v5 - v11) > 4;
  [MEMORY[0x189607968] numberWithBool:v15];
  v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, @"oversized", v16);

  id v17 = objc_alloc_init(MEMORY[0x189607940]);
  v18 = v17;
  if (v17)
  {
    [v17 appendString:@"{ "];
    id v19 = v18;
    uint64_t v20 = v4 + 4;
    if ((*(_BYTE *)(v4 + 3) & 0x20) != 0)
    {
      if ((_DWORD)v11)
      {
        uint64_t v23 = 0LL;
        do
        {
          if (v23) {
            objc_msgSend(v19, "appendString:", @", ");
          }
          objc_msgSend(v19, "appendFormat:", @"0x%llx", *(unsigned __int16 *)(v20 + v23));
          v23 += 2LL;
        }

        while (2LL * v11 != v23);
      }
    }

    else if ((_DWORD)v11)
    {
      uint64_t v21 = 0LL;
      do
      {
        if (v21) {
          objc_msgSend(v19, "appendString:", @", ");
        }
        objc_msgSend(v19, "appendFormat:", @"0x%llx", *(unsigned int *)(v20 + v21));
        v21 += 4LL;
      }

      while (4LL * v11 != v21);
    }

    [v19 appendString:@" }"];
    CSStore2::AttributedStringWriter::string( (CSStore2::AttributedStringWriter *)&v25,  @"values",  (NSString *)v19);
  }

  v24 = (void *)[v8 copy];
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v25);

  objc_autoreleasePoolPop(v6);
  return v24;
}

id __42___CSVisualizer_setStandardTableFunctions__block_invoke_2( uint64_t a1,  int a2,  int a3,  unsigned int a4)
{
  if (v10)
  {
    v7[0] = v9[0];
    v7[1] = v9[1];
    char v8 = 1;
    CSStore2::String::getNSStringNoCopy((CSStore2::String *)v7);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = (void *)[v4 copy];

    return v5;
  }

  else
  {
    LOBYTE(v7[0]) = 0;
    char v8 = 0;
    return 0LL;
  }

id __42___CSVisualizer_setStandardTableFunctions__block_invoke_3( uint64_t a1,  int a2,  int a3,  unsigned int a4)
{
  uint64_t v4 = CSStore2::String::Get(v20, *(CSStore2::Store **)(a1 + 32), a4);
  if (!v20[32])
  {
    LOBYTE(v16[0]) = 0;
    char v18 = 0;
    return 0LL;
  }

  *(_OWORD *)v16 = *(_OWORD *)v20;
  *(_OWORD *)id v17 = *(_OWORD *)&v20[16];
  char v18 = 1;
  uint64_t v5 = (void *)MEMORY[0x186E27B50](v4);
  id v6 = objc_alloc_init(MEMORY[0x189607928]);
  *(void *)uint64_t v20 = off_189D658F8;
  memset(&v20[8], 0, 32);
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
  id v7 = v6;
  *(void *)&v20[16] = v7;
  *(_OWORD *)&v20[24] = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  *(void *)&__int128 v25 = 0LL;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  DWORD2(v25) = 1065353216;
  LODWORD(v28) = 1065353216;
  WORD4(v28) = 0;
  *(void *)&__int128 v29 = 0LL;
  WORD4(v29) = 257;
  BYTE10(v29) = 0;
  __int128 v34 = &v20[8];
  if (!v16[0] || BYTE4(v16[1]))
  {
    if (BYTE4(v16[1]))
    {
      CSStore2::AttributedStringWriter::string( (CSStore2::AttributedStringWriter *)v20,  @"retainCount",  @"N/A (packed)");
      goto LABEL_11;
    }

id __42___CSVisualizer_setStandardTableFunctions__block_invoke_4( uint64_t a1,  int a2,  int a3,  unsigned int a4)
{
  uint64_t v4 = CSStore2::Dictionary::Get((CSStore2::Dictionary *)v15, *(CSStore2::Store **)(a1 + 32), a4);
  if ((_BYTE)v16)
  {
    __int128 v12 = *(_OWORD *)v15;
    uint64_t v13 = *(void *)&v15[16];
    char v14 = 1;
    uint64_t v5 = (void *)MEMORY[0x186E27B50](v4);
    id v6 = objc_alloc_init(MEMORY[0x189607928]);
    *(void *)BOOL v15 = off_189D658F8;
    *(_OWORD *)&v15[8] = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
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
    id v7 = v6;
    *(void *)&v15[16] = v7;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    *(void *)&__int128 v21 = 0LL;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    DWORD2(v21) = 1065353216;
    LODWORD(v24) = 1065353216;
    WORD4(v24) = 0;
    *(void *)&__int128 v25 = 0LL;
    WORD4(v25) = 257;
    BYTE10(v25) = 0;
    __int128 v30 = &v15[8];
    CSStore2::Dictionary::getDescriptionOfContents((CSStore2::Dictionary *)&v12, 0LL);
    char v8 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    if (v8) {
      CSStore2::AttributedStringWriter::attributedString( (CSStore2::AttributedStringWriter *)v15,  (NSAttributedString *)@"values",  v8);
    }

    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  CSStore2::Dictionary::getCount((CSStore2::Dictionary *)v12, *(_DWORD *)(*((void *)&v12 + 1) + 4)));
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)v15, @"count", v9);

    char v10 = (void *)[v7 copy];
    CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)v15);

    objc_autoreleasePoolPop(v5);
    return v10;
  }

  else
  {
    LOBYTE(v12) = 0;
    char v14 = 0;
    return 0LL;
  }

void __41___CSVisualizer_getUnit_inTable_fromURL___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 name];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 value];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    if (*(void *)(a1 + 48))
    {
      [v7 value];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      **(_DWORD **)(a1 + 48) = [v3 longLongValue];
LABEL_5:
    }
  }

  [v7 name];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v5 isEqual:@"u"])
  {
LABEL_10:

    goto LABEL_11;
  }

  [v7 value];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    if (*(void *)(a1 + 56))
    {
      [v7 value];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      **(_DWORD **)(a1 + 56) = [v5 longLongValue];
      goto LABEL_10;
    }
  }

uint64_t __56___CSVisualizer_unitDescription_referencesUnit_inTable___block_invoke( uint64_t result,  int a2,  int a3,  _BYTE *a4)
{
  if (*(_DWORD *)(result + 40) == a2 && *(_DWORD *)(result + 44) == a3)
  {
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

void __67___CSVisualizer_enumerateReferencesToUnitsInUnitDescription_block___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  _OWORD v7[2] = __67___CSVisualizer_enumerateReferencesToUnitsInUnitDescription_block___block_invoke_2;
  v7[3] = &unk_189D66768;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = a5;
  [a2 enumerateKeysAndObjectsUsingBlock:v7];
}

void __67___CSVisualizer_enumerateReferencesToUnitsInUnitDescription_block___block_invoke_2( uint64_t a1,  void *a2,  void *a3,  _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v9 = 0LL;
      if (+[_CSVisualizer getUnit:inTable:fromURL:]( &OBJC_CLASS____CSVisualizer,  "getUnit:inTable:fromURL:",  &v9,  (char *)&v9 + 4,  v8))
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
      }
    }
  }

  **(_BYTE **)(a1 + 40) = *a4;
}

void __47___CSVisualizer_breakDownTable_inStore_buffer___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = 2 * (*(_BYTE *)(a1 + 48) & 0x1Fu);
  if (a2)
  {
    uint64_t v5 = **(void **)(a1 + 32);
    if (v5) {
      unint64_t v6 = *(void *)(v5 + 8);
    }
    else {
      unint64_t v6 = 0LL;
    }
    uint64_t v7 = 0xFFFFFFFFLL;
    BOOL v8 = (unint64_t)a2 >= v6;
    unint64_t v9 = (unint64_t)a2 - v6;
    if (v8 && !HIDWORD(v9))
    {
      BOOL v10 = (v9 + 1) > *(_DWORD *)(*(void *)(v5 + 8) + 12LL) || (_DWORD)v9 == -1;
      uint64_t v7 = v9;
      if (v10) {
        uint64_t v7 = 0xFFFFFFFFLL;
      }
    }
  }

  else
  {
    uint64_t v7 = 0xFFFFFFFFLL;
  }

  *(void *)(*(void *)(a1 + 40) + v7) = 0x101010101010101LL * v4;
  int v11 = v4 | 0x40;
  __int128 v12 = a2 + 2;
  uint64_t v13 = **(void **)(a1 + 32);
  if (v13) {
    unint64_t v14 = *(void *)(v13 + 8);
  }
  else {
    unint64_t v14 = 0LL;
  }
  uint64_t v15 = 0xFFFFFFFFLL;
  BOOL v8 = (unint64_t)v12 >= v14;
  unint64_t v16 = (unint64_t)v12 - v14;
  if (v8 && !HIDWORD(v16))
  {
    else {
      uint64_t v15 = v16;
    }
  }

  memset((void *)(*(void *)(a1 + 40) + v15), v11, a2[1]);
  if (*(_BYTE *)(a1 + 48) == 8)
  {
    CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v54, *(CSStore2::Store **)(a1 + 32), 4 * *a2);
    if ((_BYTE)v57)
    {
      uint64_t v18 = *(unsigned int *)(v55 + 4);
      if ((_DWORD)v18 != -1)
      {
        __int128 v19 = v54;
        unint64_t v20 = *(void *)(*v54 + 8);
        unsigned int v21 = *(_DWORD *)(v20 + 12);
        if (v21 > v18)
        {
          uint64_t v22 = *(void *)(a1 + 40);
          __int128 v23 = (_DWORD *)(v20 + v18);
          BOOL v24 = v20 + v18 < v20;
          BOOL v25 = (int)v18 + 1 > v21 || v18 == -1;
          uint64_t v26 = *(unsigned int *)(v55 + 4);
          if (v25) {
            uint64_t v26 = 0xFFFFFFFFLL;
          }
          if (v24) {
            uint64_t v26 = 0xFFFFFFFFLL;
          }
          *(_DWORD *)(v22 + v26) = 269488144;
          v54 = (uint64_t *)MEMORY[0x1895F87A8];
          uint64_t v55 = 3221225472LL;
          v56 = ___ZN8CSStore27HashMapIjjNS_10Dictionary10_FunctionsELy0EE14WriteBreakdownERKNS_5StoreEPKS3_hPh_block_invoke;
          v57 = &__block_descriptor_41_e21_v32__0I8I12B16B20_B24l;
          char v59 = 8;
          uint64_t v58 = v22;
          __int128 v27 = &v54;
          __int128 v28 = v27;
          unsigned __int8 v60 = 0;
          __int128 v29 = v23 + 1;
          uint64_t v30 = *v19;
          if (*v19) {
            unint64_t v31 = *(void *)(v30 + 8);
          }
          else {
            unint64_t v31 = 0LL;
          }
          uint64_t v32 = 0xFFFFFFFFLL;
          BOOL v8 = (unint64_t)v29 >= v31;
          unint64_t v33 = (unint64_t)v29 - v31;
          if (v8 && !HIDWORD(v33))
          {
            else {
              uint64_t v32 = v33;
            }
          }

          ((void (*)(uint64_t *, uint64_t, void, uint64_t, uint64_t, unsigned __int8 *))v56)( v27,  v32,  (8 * *v23),  1LL,  1LL,  &v60);
          unint64_t v35 = *v23;
          if ((_DWORD)v35) {
            BOOL v36 = v60 == 0;
          }
          else {
            BOOL v36 = 0;
          }
          if (v36)
          {
            unint64_t v37 = 0LL;
            do
            {
              __int128 v38 = &v23[2 * v37];
              uint64_t v39 = v38[2];
              if ((_DWORD)v39 == -1)
              {
                unint64_t v43 = 0LL;
              }

              else
              {
                uint64_t v40 = *(void *)(*v19 + 8);
                BOOL v41 = *(_DWORD *)(v40 + 12) > v39;
                unint64_t v42 = v40 + v39;
                if (v41) {
                  unint64_t v43 = v42;
                }
                else {
                  unint64_t v43 = 0LL;
                }
              }

              v44 = v38 + 1;
              int v45 = v38[1];
              if (v45)
              {
                v46 = (_DWORD *)(v43 + 4);
                unint64_t v47 = 1LL;
                do
                {
                  if (*(v46 - 1)) {
                    BOOL v48 = *v46 != 0;
                  }
                  else {
                    BOOL v48 = 0LL;
                  }
                  uint64_t v49 = *v19;
                  if (*v19) {
                    unint64_t v50 = *(void *)(v49 + 8);
                  }
                  else {
                    unint64_t v50 = 0LL;
                  }
                  uint64_t v51 = 0xFFFFFFFFLL;
                  BOOL v8 = v43 >= v50;
                  unint64_t v52 = v43 - v50;
                  if (v8 && !HIDWORD(v52))
                  {
                    else {
                      uint64_t v51 = v52;
                    }
                  }

                  ((void (*)(uint64_t *, uint64_t, uint64_t, void, BOOL, unsigned __int8 *))v56)( v28,  v51,  8LL,  0LL,  v48,  &v60);
                  int v45 = v60;
                  if (v47 >= *v44) {
                    break;
                  }
                  ++v47;
                  v46 += 2;
                  v43 += 8LL;
                }

                while (!v60);
                unint64_t v35 = *v23;
              }

              ++v37;
            }

            while (v37 < v35 && !v45);
          }
        }
      }
    }
  }

void __61___CSVisualizer_enumerateValuesForTitlesInDescription_block___block_invoke( uint64_t a1,  void *a2,  NSUInteger a3,  NSUInteger a4)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  BOOL v8 = v7;
  if (v7) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = &unk_189D69C40;
  }
  if ([v9 unsignedLongLongValue] == 1)
  {
    [*(id *)(a1 + 32) attribute:@"_CSVIsRelated" atIndex:a3 effectiveRange:0];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = v10;
    if (v10 && (__int128 v12 = (CSStore2 *)[v10 BOOLValue], (_DWORD)v12))
    {
      CSStore2::GetLog(v12);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v31.location = a3;
        v31.length = a4;
        NSStringFromRange(v31);
        __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
        int v28 = 138543362;
        __int128 v29 = v27;
        _os_log_debug_impl( &dword_183DFE000,  v13,  OS_LOG_TYPE_DEBUG,  "Skipping appearance of title in range %{public}@ because it's in a range marked as a related unit",  (uint8_t *)&v28,  0xCu);
      }
    }

    else
    {
      unint64_t v14 = *(void **)(*(void *)(a1 + 40) + 8LL);
      unint64_t v16 = (char *)v14[7];
      unint64_t v15 = v14[8];
      if ((unint64_t)v16 >= v15)
      {
        uint64_t v18 = (char *)v14[6];
        uint64_t v19 = (v16 - v18) >> 4;
        unint64_t v20 = v19 + 1;
        uint64_t v21 = v15 - (void)v18;
        if (v21 >> 3 > v20) {
          unint64_t v20 = v21 >> 3;
        }
        BOOL v22 = (unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0LL;
        unint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
        if (!v22) {
          unint64_t v23 = v20;
        }
        if (v23)
        {
          unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v23);
          uint64_t v18 = (char *)v14[6];
          unint64_t v16 = (char *)v14[7];
        }

        else
        {
          uint64_t v24 = 0LL;
        }

        BOOL v25 = (NSUInteger *)(v23 + 16 * v19);
        unint64_t v26 = v23 + 16 * v24;
        *BOOL v25 = a3;
        v25[1] = a4;
        __int128 v17 = v25 + 2;
        if (v16 != v18)
        {
          do
          {
            *((_OWORD *)v25 - 1) = *((_OWORD *)v16 - 1);
            v25 -= 2;
            v16 -= 16;
          }

          while (v16 != v18);
          uint64_t v18 = (char *)v14[6];
        }

        v14[6] = v25;
        v14[7] = v17;
        v14[8] = v26;
        if (v18) {
          operator delete(v18);
        }
      }

      else
      {
        *(void *)unint64_t v16 = a3;
        *((void *)v16 + 1) = a4;
        __int128 v17 = v16 + 16;
      }

      v14[7] = v17;
    }
  }
}

void __61___CSVisualizer_enumerateValuesForTitlesInDescription_block___block_invoke_39( uint64_t a1,  void *a2,  NSUInteger a3,  NSUInteger a4,  _BYTE *a5)
{
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9) {
    unint64_t v9 = &unk_189D69C40;
  }
  id v13 = v9;
  int v10 = [v9 unsignedLongLongValue];
  if (v10 == 1)
  {
    *a5 = 1;
  }

  else if (v10 == 3)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v12.location = *(void *)(v11 + 48);
    if (v12.location == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(void *)(v11 + 48) = a3;
      *(void *)(v11 + 56) = a4;
    }

    else
    {
      v12.length = *(void *)(v11 + 56);
      v14.location = a3;
      v14.length = a4;
      *(NSRange *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 48LL) = NSUnionRange(v12, v14);
    }
  }
}

uint64_t __52___CSVisualizer_rangeOfValueForTitle_inDescription___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  _BYTE *a8)
{
  uint64_t result = [*(id *)(a1 + 32) caseInsensitiveCompare:a2];
  if (!result)
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
    *(void *)(v13 + 48) = a6;
    *(void *)(v13 + 56) = a7;
    *a8 = 1;
  }

  return result;
}

id __49___CSVisualizer_Deprecated__setHandler_forTable___block_invoke(uint64_t a1)
{
  id v3 = 0LL;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  id v1 = v3;

  return v1;
}

id __49___CSVisualizer_Deprecated__setHandler_forTable___block_invoke_2(uint64_t a1)
{
  id v3 = 0LL;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  id v1 = v3;

  return v1;
}

void __45___CSVisualizer_Deprecated__handlerForTable___block_invoke( uint64_t a1,  uint64_t a2,  void **a3,  void **a4)
{
  if (a3)
  {
    [*(id *)(a1 + 32) getSummary];
    BOOL v8 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      id v14 = v8;
      uint64_t v9 = v8[2](v8, *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
      int v10 = *a3;
      *a3 = (void *)v9;

      BOOL v8 = (void (**)(void, void, void, void))v14;
    }
  }

  if (a4)
  {
    [*(id *)(a1 + 32) getDescription];
    uint64_t v11 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      id v15 = v11;
      uint64_t v12 = v11[2](v11, *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
      uint64_t v13 = *a4;
      *a4 = (void *)v12;

      uint64_t v11 = (void (**)(void, void, void, void))v15;
    }
  }

@end