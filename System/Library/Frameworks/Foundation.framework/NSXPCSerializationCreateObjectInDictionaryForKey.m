@interface NSXPCSerializationCreateObjectInDictionaryForKey
@end

@implementation NSXPCSerializationCreateObjectInDictionaryForKey

uint64_t ___NSXPCSerializationCreateObjectInDictionaryForKey_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __s1[1] = *(void **)MEMORY[0x1895F89C0];
  int v6 = *(_DWORD *)(a2 + 8);
  if (v6 == 96)
  {
    v8 = _NSXPCSerializationStringForObject(*(uint64_t **)(a1 + 48), (char **)a2);
  }

  else if (v6 == 112)
  {
    __s1[0] = 0LL;
    if (_getASCIIStringAtMarker(*(uint64_t **)(a1 + 48), __s1, *(void *)a2, (uint64_t *)&__n, &v12))
    {
      v7 = *(const void **)(a1 + 56);
      if (v7)
      {
        if (__n == *(void *)(a1 + 64) && !memcmp(__s1[0], v7, __n)) {
          goto LABEL_10;
        }
      }

      else if (objc_msgSend( *(id *)(a1 + 32),  "isEqualToString:",  _NSXPCSerializationStringForObject(*(uint64_t **)(a1 + 48), (char **)a2)))
      {
LABEL_10:
        uint64_t result = 0LL;
        *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
        uint64_t v10 = *(void *)(a1 + 72);
        *(void *)uint64_t v10 = 0LL;
        *(_DWORD *)(v10 + 8) = 255;
        *(void *)uint64_t v10 = *(void *)a3;
        *(_DWORD *)(v10 + 8) = *(_DWORD *)(a3 + 8);
        return result;
      }
    }
  }

  return 1LL;
}

@end