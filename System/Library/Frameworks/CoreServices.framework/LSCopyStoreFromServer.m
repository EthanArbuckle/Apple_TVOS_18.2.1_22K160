@interface LSCopyStoreFromServer
@end

@implementation LSCopyStoreFromServer

void ___LSCopyStoreFromServer_block_invoke(void *a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = *(void *)(a1[4] + 8LL);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v11;
  id v27 = v11;

  uint64_t v17 = *(void *)(a1[5] + 8LL);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v12;
  id v19 = v12;

  uint64_t v20 = *(void *)(a1[6] + 8LL);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v13;
  id v22 = v13;

  *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = a5;
  uint64_t v23 = *(void *)(a1[8] + 8LL);
  v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v14;
  id v25 = v14;

  uint64_t v26 = *(void *)(*(void *)(a1[4] + 8LL) + 40LL);
  if (v26) {
    LOBYTE(v26) = *(void *)(*(void *)(a1[5] + 8LL) + 40LL) != 0LL;
  }
  *(_BYTE *)(*(void *)(a1[9] + 8LL) + 24LL) = v26;
}

uint64_t ___LSCopyStoreFromServer_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void ___LSCopyStoreFromServer_block_invoke_53(uint64_t a1, void *a2)
{
  id v2 = a2;
  _LSDefaultLog();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    ___LSCopyStoreFromServer_block_invoke_53_cold_1((uint64_t)v2, v3);
  }
}

uint64_t ___LSCopyStoreFromServer_block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t ___LSCopyStoreFromServer_block_invoke_2_56( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return _LSBundleDisplayNameContextEnumerate( __LAUNCH_SERVICES_IS_RESEEDING_ITS_DATABASE_AND_MAY_BLOCK__,  v13,  v14,  v15,  v16);
}

void ___LSCopyStoreFromServer_block_invoke_53_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "error on blocking retry to fetch database: %@",  (uint8_t *)&v2,  0xCu);
}

@end