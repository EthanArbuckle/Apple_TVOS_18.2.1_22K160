@interface GTBaseSocketTransport
@end

@implementation GTBaseSocketTransport

id __53__GTBaseSocketTransport_destroySharedMemoryTransport__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _destroySharedMemoryTransport];
}

_BYTE *__63__GTBaseSocketTransport_createNewSharedMemoryTransportWithURL___block_invoke(uint64_t a1)
{
  result = *(_BYTE **)(a1 + 32);
  if (!result[52])
  {
    [result _destroySharedMemoryTransport];
    v3 = objc_alloc(&OBJC_CLASS___GTSharedMemoryTransport_tools_diagnostics);
    uint64_t v4 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 40LL));
    *(void *)(*(void *)(a1 + 32) + 248LL) = -[GTSharedMemoryTransport_tools_diagnostics initWithMode:initialMessageSerial:]( v3,  "initWithMode:initialMessageSerial:",  2LL,  v4);
    if (*(void *)(a1 + 40)) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "setUrl:");
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "setRelayTransport:");
    [*(id *)(*(void *)(a1 + 32) + 248) setPrioritizeOutgoingMessages:*(unsigned __int8 *)(*(void *)(a1 + 32) + 53)];
    result = [*(id *)(*(void *)(a1 + 32) + 248) url];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = result;
  }

  return result;
}

id __55__GTBaseSocketTransport_setPrioritizeOutgoingMessages___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 248) setPrioritizeOutgoingMessages:*(unsigned __int8 *)(a1 + 40)];
}

void __39__GTBaseSocketTransport_runWithSocket___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 232LL) = 0LL;
}

void __39__GTBaseSocketTransport_runWithSocket___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 240LL) = 0LL;
}

id __39__GTBaseSocketTransport_runWithSocket___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readAndAccumulateLoop];
}

_BYTE *__39__GTBaseSocketTransport_runWithSocket___block_invoke_4(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 256LL) = 1;
  result = *(_BYTE **)(a1 + 32);
  if (result[257]) {
    return [result _readAndAccumulateLoop];
  }
  return result;
}

@end