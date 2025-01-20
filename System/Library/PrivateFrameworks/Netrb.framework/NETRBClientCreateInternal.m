@interface NETRBClientCreateInternal
@end

@implementation NETRBClientCreateInternal

void ___NETRBClientCreateInternal_block_invoke(uint64_t a1)
{
  v2 = *(const void **)(a1 + 48);
  v3 = (__CFArray *)__netrbClientList;
  if (!__netrbClientList)
  {
    v7 = *(dispatch_queue_s **)(a1 + 56);
    v6 = *(dispatch_queue_s **)(a1 + 64);
    __netrbClientList = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
    if (!__netrbClientList)
    {
      v8 = __error();
      strerror(*v8);
      goto LABEL_12;
    }

    if (NETRBXPCCreate(v7, (uint64_t)v6))
    {
      if (NETRBXPCEndPointCreate(v6))
      {
        v3 = (__CFArray *)__netrbClientList;
        goto LABEL_2;
      }

      NETRBErrorLog();
      NETRBXPCCleanup();
    }

    else
    {
      NETRBErrorLog();
    }

    CFRelease((CFTypeRef)__netrbClientList);
    __netrbClientList = 0LL;
    goto LABEL_16;
  }

void ___NETRBClientCreateInternal_block_invoke_2(uint64_t a1, void *a2)
{
  if (!a2) {
    goto LABEL_6;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = xpc_dictionary_get_uint64(a2, netrbXPCResponse);
  if (*(void *)(a1 + 48)) {
    **(_DWORD **)(a1 + 48) = xpc_dictionary_get_uint64(a2, netrbXPCErrorCode);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) != 2001LL
    || (xpc_object_t v4 = (char *)(*(void *)(a1 + 40) + 32LL),
        string = xpc_dictionary_get_string(a2, netrbXPCClientID),
        snprintf(v4, 0x100uLL, "%s", string),
        *(_BYTE *)(*(void *)(a1 + 40) + 288LL) = 1,
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) != 2001LL))
  {
LABEL_6:
    __NETRBClientRemoveFromList(*(const void **)(a1 + 40));
  }

@end