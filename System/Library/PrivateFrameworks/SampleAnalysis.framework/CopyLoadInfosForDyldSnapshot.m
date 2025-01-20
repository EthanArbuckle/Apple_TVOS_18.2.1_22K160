@interface CopyLoadInfosForDyldSnapshot
@end

@implementation CopyLoadInfosForDyldSnapshot

void ___CopyLoadInfosForDyldSnapshot_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    if (!*(_DWORD *)(a1 + 96)) {
      goto LABEL_4;
    }
    uint64_t v17 = 0LL;
    v18 = &v17;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = ___CopyLoadInfosForDyldSnapshot_block_invoke_2;
    v15[3] = &unk_189F63680;
    __int128 v16 = *(_OWORD *)(a1 + 56);
    v15[4] = &v17;
    DyldImageEnumerateSegments(a2, v15);
    int v4 = *((unsigned __int8 *)v18 + 24);
    _Block_object_dispose(&v17, 8);
    if (!v4)
    {
LABEL_4:
      uint64_t v17 = 0LL;
      v18 = &v17;
      uint64_t v19 = 0x2020000000LL;
      char v20 = 0;
      uint64_t v5 = *(void *)(a1 + 48);
      if (!*(_BYTE *)(*(void *)(v5 + 8) + 24LL))
      {
        uint64_t v6 = *(void *)(a1 + 80);
        if (*(_OWORD *)(a1 + 72) != 0LL)
        {
          v14[0] = MEMORY[0x1895F87A8];
          v14[1] = 3221225472LL;
          v14[2] = ___CopyLoadInfosForDyldSnapshot_block_invoke_3;
          v14[3] = &unk_189F636A8;
          v14[4] = &v17;
          v14[5] = v5;
          v14[6] = v6;
          MEMORY[0x186E47544](a2, "__TEXT", v14);
        }
      }

      v7 = *(void **)(a1 + 32);
      if (v7)
      {
        +[SABinaryLoadInfo addBinaryLoadInfoForDyldImage:toLoadInfos:isKernel:dataGatheringOptions:]( (uint64_t)&OBJC_CLASS___SABinaryLoadInfo,  a2,  v7,  *(_DWORD *)(a1 + 96) == 0,  *(void *)(a1 + 88));
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          int v9 = *__error();
          _sa_logt();
          v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            int v12 = *(_DWORD *)(a1 + 96);
            v13 = DyldImagePath(a2);
            *(_DWORD *)buf = 67109378;
            int v22 = v12;
            __int16 v23 = 2080;
            v24 = v13;
            _os_log_error_impl( &dword_186C92000,  v10,  OS_LOG_TYPE_ERROR,  "[%d] Failed to create SABinary for %s",  buf,  0x12u);
          }

          v11 = __error();
          id v8 = 0LL;
          int *v11 = v9;
          *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = -1;
          goto LABEL_19;
        }

        if (*((_BYTE *)v18 + 24) && *(void *)(a1 + 72)) {
          goto LABEL_15;
        }
      }

      else
      {
        if (!*(_BYTE *)(a1 + 100) && (!*((_BYTE *)v18 + 24) || !*(void *)(a1 + 72))) {
          goto LABEL_20;
        }
        +[SABinary binaryForDyldImage:options:]((uint64_t)&OBJC_CLASS___SABinary, a2, *(void *)(a1 + 88));
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        if (*((_BYTE *)v18 + 24) && *(void *)(a1 + 72))
        {
LABEL_15:
          id v8 = v8;
          **(void **)(a1 + 72) = v8;
        }
      }

void *___CopyLoadInfosForDyldSnapshot_block_invoke_2(void *result, uint64_t a2, unint64_t a3)
{
  if (result[5] <= a3 && result[6] > a3) {
    *(_BYTE *)(*(void *)(result[4] + 8LL) + 24LL) = 1;
  }
  return result;
}

void *___CopyLoadInfosForDyldSnapshot_block_invoke_3( void *result,  unsigned int *a2,  uint64_t a3,  unint64_t a4)
{
  if (a2 && a4 >= 0x1C && a2[3] == 2)
  {
    *(_BYTE *)(*(void *)(result[4] + 8LL) + 24LL) = 1;
    int v4 = (unint64_t *)result[6];
    *(_BYTE *)(*(void *)(result[5] + 8LL) + 24LL) = 1;
    if (v4) {
      *int v4 = a2[1] | ((unint64_t)(a2[2] & 0xFFFFFF) << 32);
    }
  }

  return result;
}

@end