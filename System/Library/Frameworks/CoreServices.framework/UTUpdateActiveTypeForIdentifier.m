@interface UTUpdateActiveTypeForIdentifier
@end

@implementation UTUpdateActiveTypeForIdentifier

void *___UTUpdateActiveTypeForIdentifier_block_invoke( void *result,  uint64_t a2,  int a3,  uint64_t a4,  _BYTE *a5)
{
  if ((*(_BYTE *)(a4 + 8) & 0x20) != 0) {
    *(_DWORD *)(*(void *)(result[4] + 8LL) + 24LL) = a3;
  }
  uint64_t v5 = *(void *)(result[5] + 8LL);
  if (!*(_DWORD *)(v5 + 24))
  {
    *(_DWORD *)(v5 + 24) = a3;
    *(_DWORD *)(*(void *)(result[6] + 8LL) + 24LL) = *(_DWORD *)(a4 + 8);
  }

  if ((*(_BYTE *)(a4 + 8) & 1) != 0) {
    *(_DWORD *)(*(void *)(result[7] + 8LL) + 24LL) = a3;
  }
  if (*(_DWORD *)(*(void *)(result[7] + 8LL) + 24LL) && *(_DWORD *)(*(void *)(result[5] + 8LL) + 24LL))
  {
    if (*(_DWORD *)(*(void *)(result[4] + 8LL) + 24LL)) {
      *a5 = 1;
    }
  }

  return result;
}

void *___UTUpdateActiveTypeForIdentifier_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::clear((void *)(a2 + 240));
}

@end