@interface LSPluginFindWithPlatformInfo
@end

@implementation LSPluginFindWithPlatformInfo

uint64_t ___LSPluginFindWithPlatformInfo_block_invoke( uint64_t result,  unsigned int a2,  int *a3,  uint64_t a4,  _BYTE *a5)
{
  if (a3[1])
  {
    uint64_t v8 = result;
    int v9 = *(_DWORD *)(result + 64);
    if ((v9 + 1) < 2 || a3[5] == v9)
    {
      result = _LSContainerGet();
      if (result)
      {
        int v10 = _LSContainerCheckState(*(void **)(v8 + 32), a3[1], result, &v12, 0LL);
        result = _LSGetNSErrorFromOSStatusImpl(v10, 0LL, (uint64_t)"_LSPluginFindWithPlatformInfo_block_invoke", 593LL);
        if ((_DWORD)result) {
          BOOL v11 = v12 == 1;
        }
        else {
          BOOL v11 = 0;
        }
        if (v11)
        {
          result = _LSAliasMatchesPath_NoIO(*(void **)(v8 + 32), *a3, *(void **)(v8 + 40), 0LL);
          if ((_DWORD)result)
          {
            if (!*(_BYTE *)(v8 + 68)
              || (result = _LSPluginIsValid(*(void **)(v8 + 32), a2, (uint64_t)a3, 0LL, 0, 0LL), (_DWORD)result))
            {
              *(_DWORD *)(*(void *)(*(void *)(v8 + 48) + 8LL) + 24LL) = a2;
              *(void *)(*(void *)(*(void *)(v8 + 56) + 8LL) + 24LL) = a3;
              *a5 = 1;
            }
          }
        }
      }
    }
  }

  return result;
}

void ___LSPluginFindWithPlatformInfo_block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3, _BYTE *a4)
{
  uint64_t v7 = _LSGetPlugin(*(void *)(a1 + 32), a3);
  if (!v7)
  {
    _LSDefaultLog();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      ___LSPluginFindWithPlatformInfo_block_invoke_2_cold_1();
    }
    goto LABEL_32;
  }

  uint64_t v8 = (_DWORD *)v7;
  int v9 = *(_DWORD *)(a1 + 400);
  char v25 = 0;
  int v10 = (unsigned int *)(v7 + 4);
  uint64_t v11 = _LSContainerGet();
  if (!v11)
  {
    _LSDefaultLog();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      ___LSPluginFindWithPlatformInfo_block_invoke_2_cold_2();
    }
LABEL_32:

    return;
  }

  int v12 = _LSContainerCheckState(*(void **)(a1 + 32), *v10, v11, &v25, 0LL);
  if (_LSGetNSErrorFromOSStatusImpl(v12, 0LL, (uint64_t)"_LSPluginFindWithPlatformInfo_block_invoke_2", 623LL)
    && v25 == 1)
  {
    int v14 = *(_DWORD *)(a1 + 404);
    if (!v14 || v14 == v8[3] || v14 == v8[41] || v14 == v8[42])
    {
      int v15 = *(_DWORD *)(a1 + 408);
      if (!v15 || v15 == v8[53])
      {
        if (!*(_BYTE *)(a1 + 412)
          || (v16 = *(void **)(a1 + 32),
              uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8LL),
              id obj = *(id *)(v17 + 40),
              BOOL v18 = _LSPluginCheckExtensionPoint(v16, a3, (uint64_t)v8, &obj),
              objc_storeStrong((id *)(v17 + 40), obj),
              v18))
        {
          if (!*(_BYTE *)(a1 + 413)
            || _LSPluginIsValid(*(void **)(a1 + 32), a3, (uint64_t)v8, 0LL, 0, 0LL))
          {
            unsigned int v19 = v8[40];
            int v20 = (v19 >> 2) & 1;
            int v21 = *(unsigned __int8 *)(a1 + 414);
            if (*(_BYTE *)(a1 + 414) || (v19 & 4) == 0)
            {
              uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8LL);
              if (!*(_DWORD *)(v22 + 24))
              {
                *(_DWORD *)(v22 + 24) = a3;
                *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = v8;
              }

              *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = a3;
              *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = v8;
            }

            if (v20 == v21)
            {
              *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
              *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0LL;
              *a4 = 1;
            }
          }
        }
      }
    }
  }

void ___LSPluginFindWithPlatformInfo_block_invoke_2_cold_1()
{
}

void ___LSPluginFindWithPlatformInfo_block_invoke_2_cold_2()
{
}

@end