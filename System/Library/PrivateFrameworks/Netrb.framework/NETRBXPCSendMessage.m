@interface NETRBXPCSendMessage
@end

@implementation NETRBXPCSendMessage

uint64_t ____NETRBXPCSendMessage_block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v4 = MEMORY[0x1895B5770](a2);
    if (v4 == MEMORY[0x1895F9250])
    {
      if (xpc_dictionary_get_uint64(a2, netrbXPCResponse) != 2002)
      {
LABEL_10:
        v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL);
        return v5();
      }
    }

    else if (v4 == MEMORY[0x1895F9268])
    {
      xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1895F91B0]);
    }

    NETRBErrorLog();
    NETRBXPCCleanup();
    goto LABEL_10;
  }

  NETRBXPCCleanup();
  NETRBErrorLog();
  v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL);
  return v5();
}

@end