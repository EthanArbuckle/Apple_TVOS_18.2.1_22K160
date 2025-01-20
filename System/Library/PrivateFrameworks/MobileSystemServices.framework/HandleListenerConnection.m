@interface HandleListenerConnection
@end

@implementation HandleListenerConnection

uint64_t ___HandleListenerConnection_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 48LL) + 16LL))();
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

void ___HandleListenerConnection_block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  char a9)
{
  uint64_t v11 = MEMORY[0x186E253B4](a2);
  if (v11 == MEMORY[0x1895F9250])
  {
    _HandleIncomingMessage(*(void *)(a1 + 32), *(_xpc_connection_s **)(a1 + 40), a2, v12, v13, v14, v15, v16, a9);
  }

  else if (v11 == MEMORY[0x1895F9268])
  {
    v17 = *(_xpc_connection_s **)(a1 + 40);
    char string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1895F91B0]);
    if (a2 == (void *)MEMORY[0x1895F91A0])
    {
      context = xpc_connection_get_context(v17);
      if (context)
      {
        xpc_release(context);
        xpc_connection_set_context(v17, 0LL);
      }

      MEMORY[0x186E253E4]();
      xpc_connection_cancel(v17);
      xpc_release(v17);
    }

    else
    {
      MOLogWrite( 0LL,  3,  (uint64_t)"_HandleClientError",  @"client connection error: %s",  v19,  v20,  v21,  v22,  string);
    }
  }

  else
  {
    MOLogWrite( 0LL,  3,  (uint64_t)"_HandleListenerConnection_block_invoke_2",  @"ignoring unknown event type from client",  v13,  v14,  v15,  v16,  a9);
  }

@end