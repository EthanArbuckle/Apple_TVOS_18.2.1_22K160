@interface LSApplicationRecordEnumerator
@end

@implementation LSApplicationRecordEnumerator

void __60___LSApplicationRecordEnumerator__prepareWithContext_error___block_invoke( uint64_t a1,  int a2,  uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_DWORD *)(a3 + 160) == *(_DWORD *)(v3 + 132))
  {
    uint64_t v5 = v3 + 104;
    v6 = *(_DWORD **)(v3 + 112);
    uint64_t v7 = v3 + 104;
    unint64_t v10 = *(void *)(v7 + 16);
    uint64_t v8 = v7 + 16;
    unint64_t v9 = v10;
    if ((unint64_t)v6 >= v10)
    {
      v12 = *(_DWORD **)v5;
      uint64_t v13 = ((uint64_t)v6 - *(void *)v5) >> 2;
      unint64_t v14 = v13 + 1;
      uint64_t v15 = v9 - (void)v12;
      if (v15 >> 1 > v14) {
        unint64_t v14 = v15 >> 1;
      }
      else {
        unint64_t v16 = v14;
      }
      if (v16)
      {
        v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v8, v16);
        v12 = *(_DWORD **)v5;
        v6 = *(_DWORD **)(v5 + 8);
      }

      else
      {
        v17 = 0LL;
      }

      v18 = &v17[4 * v13];
      v19 = &v17[4 * v16];
      *(_DWORD *)v18 = a2;
      v11 = v18 + 4;
      while (v6 != v12)
      {
        int v20 = *--v6;
        *((_DWORD *)v18 - 1) = v20;
        v18 -= 4;
      }

      *(void *)uint64_t v5 = v18;
      *(void *)(v5 + 8) = v11;
      *(void *)(v5 + 16) = v19;
      if (v12) {
        operator delete(v12);
      }
    }

    else
    {
      _DWORD *v6 = a2;
      v11 = v6 + 1;
    }

    *(void *)(v5 + 8) = v11;
  }

void __60___LSApplicationRecordEnumerator__prepareWithContext_error___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32) + 104LL;
    v4 = *(_DWORD **)(*(void *)(a1 + 32) + 112LL);
    uint64_t v5 = (void *)(*(void *)(a1 + 32) + 120LL);
    if ((unint64_t)v4 >= *v5)
    {
      uint64_t v7 = *(_DWORD **)v3;
      uint64_t v8 = ((uint64_t)v4 - *(void *)v3) >> 2;
      unint64_t v9 = v8 + 1;
      uint64_t v10 = *v5 - (void)v7;
      if (v10 >> 1 > v9) {
        unint64_t v9 = v10 >> 1;
      }
      else {
        unint64_t v11 = v9;
      }
      if (v11)
      {
        v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)v5, v11);
        uint64_t v7 = *(_DWORD **)v3;
        v4 = *(_DWORD **)(v3 + 8);
      }

      else
      {
        v12 = 0LL;
      }

      uint64_t v13 = &v12[4 * v8];
      unint64_t v14 = &v12[4 * v11];
      *(_DWORD *)uint64_t v13 = a2;
      v6 = v13 + 4;
      while (v4 != v7)
      {
        int v15 = *--v4;
        *((_DWORD *)v13 - 1) = v15;
        v13 -= 4;
      }

      *(void *)uint64_t v3 = v13;
      *(void *)(v3 + 8) = v6;
      *(void *)(v3 + 16) = v14;
      if (v7) {
        operator delete(v7);
      }
    }

    else
    {
      _DWORD *v4 = a2;
      v6 = v4 + 1;
    }

    *(void *)(v3 + 8) = v6;
  }

BOOL __96___LSApplicationRecordEnumerator_Private___applicationRecordWithContext_bundleIdentifierOrUnit___block_invoke( uint64_t a1,  int a2,  _DWORD *a3,  void *a4)
{
  uint64_t v7 = a1;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __96___LSApplicationRecordEnumerator_Private___applicationRecordWithContext_bundleIdentifierOrUnit___block_invoke_2;
  v15[3] = &unk_189D724F0;
  v15[4] = *(void *)(a1 + 32);
  uint64_t v8 = (void *)MEMORY[0x186E2A7B8](v15);
  uint64_t v10 = *(void **)(v7 + 40);
  unint64_t v9 = *(LSContext **)(v7 + 48);
  memset(v16, 0, sizeof(v16));
  LODWORD(v7) = *(_DWORD *)(v7 + 56);
  unint64_t v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v13 = _LSBundleFindWithInfoAndNo_IOFilter(v9, 0LL, v10, 0, v16, v7, a2, v12, v8, a3, a4, 0LL);

  return v13;
}

BOOL __96___LSApplicationRecordEnumerator_Private___applicationRecordWithContext_bundleIdentifierOrUnit___block_invoke_2( uint64_t a1,  int a2,  LSContext *a3,  uint64_t a4)
{
  return evaluateBundleNoIOCommon(a3, a4, *(const LSBundleData **)(*(void *)(a1 + 32) + 96LL));
}

@end