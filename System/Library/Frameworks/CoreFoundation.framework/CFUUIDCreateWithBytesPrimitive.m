@interface CFUUIDCreateWithBytesPrimitive
@end

@implementation CFUUIDCreateWithBytesPrimitive

void ____CFUUIDCreateWithBytesPrimitive_block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v9 = (_OWORD *)(a1 + 48);
  Value = (const void *)_uniquedUUIDs;
  if (_uniquedUUIDs) {
    Value = CFDictionaryGetValue((CFDictionaryRef)_uniquedUUIDs, v9);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = Value;
  v11 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v11)
  {
    if (!*(_BYTE *)(a1 + 64)) {
      CFRetain(v11);
    }
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = _CFRuntimeCreateInstance( *(const __CFAllocator **)(a1 + 40),  0x22uLL,  16LL,  0LL,  a5,  a6,  a7,  a8);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    if (!v12) {
      return;
    }
    *(_OWORD *)(v12 + 16) = *v9;
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    memset(&keyCallBacks, 0, 32);
    *(_OWORD *)&keyCallBacks.equal = xmmword_1899E96E0;
    *(_OWORD *)&v15.version = xmmword_1899E96F0;
    *(_OWORD *)&v15.release = unk_1899E9700;
    v15.equal = CFEqual;
    v14 = (__CFDictionary *)_uniquedUUIDs;
    if (!_uniquedUUIDs)
    {
      v14 = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, &keyCallBacks, &v15);
      _uniquedUUIDs = (uint64_t)v14;
    }

    CFDictionarySetValue(v14, (const void *)(v13 + 16), (const void *)v13);
  }

  if (*(_BYTE *)(a1 + 64)) {
    __CFRuntimeSetImmortal(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  }
}

@end