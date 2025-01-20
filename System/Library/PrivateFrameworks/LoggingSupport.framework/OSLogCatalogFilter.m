@interface OSLogCatalogFilter
@end

@implementation OSLogCatalogFilter

uint64_t __35___OSLogCatalogFilter_readDSCUUIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __35___OSLogCatalogFilter_readDSCUUIDs__block_invoke_2;
  v3[3] = &unk_189F0F188;
  v3[4] = *(void *)(a1 + 32);
  return _os_trace_uuiddb_dsc_foreach_uuid(a2, (uint64_t)v3);
}

uint64_t __35___OSLogCatalogFilter_readDSCUUIDs__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithUTF8String:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = [v4 containsSenderLookupSubstr:v5];

  if ((_DWORD)v4)
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 57LL) = 1;
    v6 = *(void **)(a1 + 32);
    v7 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a2];
    [v6 addUUID:v7];
  }

  return 1LL;
}

void __37___OSLogCatalogFilter_isKeptCatalog___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:a3];
  LODWORD(v4) = [v4 containsUUID:v5];

  if ((_DWORD)v4) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

void __37___OSLogCatalogFilter_isKeptCatalog___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  [NSString stringWithUTF8String:a2];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = [v3 containsSubsystemSubstr:v4];

  if ((_DWORD)v3) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

void __37___OSLogCatalogFilter_isKeptCatalog___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(a2 + 4)];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = [v3 containsProcessID:v4];

  if ((_DWORD)v3) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

@end