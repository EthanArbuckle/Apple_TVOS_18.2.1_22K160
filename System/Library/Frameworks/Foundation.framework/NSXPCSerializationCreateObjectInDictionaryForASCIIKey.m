@interface NSXPCSerializationCreateObjectInDictionaryForASCIIKey
@end

@implementation NSXPCSerializationCreateObjectInDictionaryForASCIIKey

uint64_t ___NSXPCSerializationCreateObjectInDictionaryForASCIIKey_block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  __s1[1] = *(void **)MEMORY[0x1895F89C0];
  if (*(_DWORD *)(a2 + 8) != 112) {
    return 1LL;
  }
  __s1[0] = 0LL;
  if (__n != *(void *)(a1 + 48)) {
    return 1LL;
  }
  uint64_t result = memcmp(__s1[0], *(const void **)(a1 + 56), __n);
  if ((_DWORD)result) {
    return 1LL;
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  uint64_t v6 = *(void *)(a1 + 64);
  *(void *)uint64_t v6 = 0LL;
  *(_DWORD *)(v6 + 8) = 255;
  *(void *)uint64_t v6 = *(void *)a3;
  *(_DWORD *)(v6 + 8) = *(_DWORD *)(a3 + 8);
  return result;
}

@end