@interface OSLogUUIDMapAddFromCatalog
@end

@implementation OSLogUUIDMapAddFromCatalog

uint64_t ___OSLogUUIDMapAddFromCatalog_block_invoke(uint64_t a1, uint64_t *a2)
{
  v7[5] = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = ___OSLogUUIDMapAddFromCatalog_block_invoke_2;
  v6[3] = &__block_descriptor_40_e40_v16__0__catalog_uuidlocation_s_QQ_16C__8l;
  v6[4] = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1895F87A8];
  v4 = (unsigned int *)a2[7];
  v7[1] = 0x40000000LL;
  v7[2] = ___catalog_procinfo_for_each_uuidinfo_block_invoke;
  v7[3] = &unk_189F0DEB0;
  v7[4] = v6;
  hashtable_iterate(v4, (uint64_t)v7);
  _os_trace_uuid_map_insert(*(float **)(a1 + 32), a2 + 3, 1LL);
  return _os_trace_uuid_map_insert(*(float **)(a1 + 32), a2 + 5, 3LL);
}

uint64_t ___OSLogUUIDMapAddFromCatalog_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  v4 = *(float **)(a1 + 32);
  uint64_t result = _os_trace_uuid_map_lookup(v4, a3);
  if (!(_DWORD)result) {
    return _os_trace_uuid_map_insert(v4, a3, 1LL);
  }
  return result;
}

uint64_t ___OSLogUUIDMapAddFromCatalog_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return _os_trace_uuid_map_insert(*(float **)(a1 + 32), (uint64_t *)(a2 + 16), 1LL);
}

@end