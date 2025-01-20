@interface AsyncConnection
@end

@implementation AsyncConnection

void ___AsyncConnection_StartNANDataSession_block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  v9 = *(int **)(*(void *)(a1 + 40) + 144LL);
  int v10 = *v9;
  if (a2)
  {
    if (v10 <= 90)
    {
      if (v10 == -1)
      {
        if (!_LogCategory_Initialize(*(void *)(*(void *)(a1 + 40) + 144LL), 0x5Au)) {
          goto LABEL_9;
        }
        v9 = *(int **)(*(void *)(a1 + 40) + 144LL);
      }

      char v12 = [*(id *)(a1 + 32) peerEndpoint];
      LogPrintF( (uint64_t)v9,  (uint64_t)"OSStatus _AsyncConnection_StartNANDataSession(AsyncConnectionRef, CFTypeRef)_block_invoke",  0x5Au,  (uint64_t)"### NAN data session failed: %@, %{error}\n",  v13,  v14,  v15,  v16,  v12);
    }

@end