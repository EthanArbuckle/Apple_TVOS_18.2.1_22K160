@interface GTBaseStreamTransport
@end

@implementation GTBaseStreamTransport

void __43__GTBaseStreamTransport__relayBuffer_size___block_invoke(uint64_t a1)
{
  v2 = objc_autoreleasePoolPush();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _relayBufferInner:*(void *)(a1 + 48) size:*(void *)(a1 + 56)];
  objc_autoreleasePoolPop(v2);
  if (*(_BYTE *)(a1 + 64)) {
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24LL));
  }
}

size_t __48__GTBaseStreamTransport__relayBufferInner_size___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 224LL);
  if (*(void *)(v2 + 32) >= *(void *)(a1 + 40)) {
    size_t v3 = *(void *)(a1 + 40);
  }
  else {
    size_t v3 = *(void *)(v2 + 32);
  }
  memcpy((void *)(*(void *)(v2 + 40) + v2), *(const void **)(a1 + 48), v3);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 224LL) + 40LL) += v3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 224LL) + 32LL) -= v3;
  return v3;
}

id __43__GTBaseStreamTransport__readAndAccumulate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRead:*(void *)(*(void *)(*(void *)(a1 + 32) + 104) + 40) + *(void *)(*(void *)(a1 + 32) + 104) size:*(void *)(*(void *)(*(void *)(a1 + 32) + 104) + 32)];
}

@end