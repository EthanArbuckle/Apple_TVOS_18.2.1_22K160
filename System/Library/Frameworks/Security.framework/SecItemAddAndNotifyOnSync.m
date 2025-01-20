@interface SecItemAddAndNotifyOnSync
@end

@implementation SecItemAddAndNotifyOnSync

BOOL ___SecItemAddAndNotifyOnSync_block_invoke(void *a1, __CFString **a2)
{
  v4 = (void *)a1[4];
  uint64_t v5 = *(void *)(a1[5] + 8LL);
  v11[0] = MEMORY[0x1895F87A8];
  v11[2] = ___SecItemAddAndNotifyOnSync_block_invoke_2;
  v11[3] = &unk_1896705B8;
  v6 = (CFDictionaryRef *)(v5 + 32);
  v11[1] = 3221225472LL;
  id v7 = v4;
  uint64_t v8 = a1[6];
  id v12 = v7;
  uint64_t v13 = v8;
  BOOL v9 = SecItemAuthDoQuery(v6, 0LL, SecItemAdd, a2, v11);

  return v9;
}

uint64_t ___SecItemAddAndNotifyOnSync_block_invoke_2( uint64_t a1,  void *a2,  const __CFDictionary *a3,  uint64_t a4,  const __CFDictionary *a5,  __CFString **a6)
{
  id v10 = a2;
  if (v10)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v32 = 0LL;
    v33 = &v32;
    uint64_t v34 = 0x2020000000LL;
    uint64_t v35 = 0LL;
    uint64_t v28 = 0LL;
    v29 = &v28;
    uint64_t v30 = 0x2020000000LL;
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v31 = 0LL;
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = ___SecItemAddAndNotifyOnSync_block_invoke_3;
    v26[3] = &unk_189670540;
    id v27 = *(id *)(a1 + 32);
    SecuritydXPCProxyObject(0LL, v26);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = objc_alloc(&OBJC_CLASS___SecuritydXPCCallback);
      v24[0] = v12;
      v24[1] = 3221225472LL;
      v24[2] = ___SecItemAddAndNotifyOnSync_block_invoke_4;
      v24[3] = &unk_189670568;
      id v25 = *(id *)(a1 + 32);
      v15 = -[SecuritydXPCCallback initWithCallback:](v14, "initWithCallback:", v24);
      v20[0] = v12;
      v20[1] = 3221225472LL;
      v20[2] = ___SecItemAddAndNotifyOnSync_block_invoke_5;
      v20[3] = &unk_189670590;
      v22 = &v32;
      v23 = &v28;
      v16 = dispatch_semaphore_create(0LL);
      v21 = v16;
      [v13 SecItemAddAndNotifyOnSync:a3 syncCallback:v15 complete:v20];
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      v17 = v29;
      if (a6) {
        *a6 = (__CFString *)v29[3];
      }
      if (v17[3]) {
        uint64_t v11 = 0LL;
      }
      else {
        uint64_t v11 = SecItemResultProcess(a3, a5, 0LL, (const void *)v33[3], *(CFTypeRef **)(a1 + 40), a6);
      }
      v18 = (const void *)v33[3];
      if (v18)
      {
        v33[3] = 0LL;
        CFRelease(v18);
      }
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }

  return v11;
}

uint64_t ___SecItemAddAndNotifyOnSync_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t ___SecItemAddAndNotifyOnSync_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void ___SecItemAddAndNotifyOnSync_block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = v12;
  if (v12 || (BOOL v9 = v7) != 0LL) {
    id v10 = v9;
  }
  else {
    id v10 = 0LL;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v10;
  id v11 = v8;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v11;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end