@interface NSRunLoop
@end

@implementation NSRunLoop

uint64_t __41__NSRunLoop_NSRunLoop___portInvalidated___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v5 = result;
    objc_msgSend(*(id *)(result + 40), "addObject:");
    return objc_msgSend(*(id *)(v5 + 48), "addIndexesInRange:", a4, 2);
  }

  return result;
}

uint64_t __46__NSRunLoop_NSRunLoop___containsPort_forMode___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  _BYTE *a5)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v6 = result;
    result = objc_msgSend(*(id *)(result + 40), "isEqual:");
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(void *)(*(void *)(v6 + 48) + 8LL) + 24LL) = 1;
      *a5 = 1;
    }
  }

  return result;
}

uint64_t __44__NSRunLoop_NSRunLoop___removePort_forMode___block_invoke( uint64_t result,  uint64_t a2,  uint64_t a3,  uint64_t a4,  _BYTE *a5)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v7 = result;
    result = objc_msgSend(*(id *)(result + 40), "isEqual:");
    if ((_DWORD)result)
    {
      uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 8LL);
      if (*(void *)(*(void *)(*(void *)(v7 + 48) + 8LL) + 24LL) == 0x7FFFFFFFFFFFFFFFLL)
      {
        *(_BYTE *)(v8 + 24) = 1;
        *(void *)(*(void *)(*(void *)(v7 + 48) + 8LL) + 24LL) = a4;
      }

      else
      {
        *(_BYTE *)(v8 + 24) = 0;
        *a5 = 1;
      }
    }
  }

  return result;
}

@end