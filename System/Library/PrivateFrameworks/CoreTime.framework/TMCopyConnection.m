@interface TMCopyConnection
@end

@implementation TMCopyConnection

xpc_object_t ___TMCopyConnection_block_invoke(uint64_t a1)
{
  uint64_t v2 = _TMCopyConnection_sConnection;
  if (!_TMCopyConnection_sConnection)
  {
    mach_service = *(_xpc_connection_s **)(a1 + 32);
    if (!mach_service)
    {
      if (_TMConnectionQueue_sPred != -1) {
        dispatch_once(&_TMConnectionQueue_sPred, &__block_literal_global_1);
      }
      mach_service = xpc_connection_create_mach_service( "com.apple.timed.xpc",  (dispatch_queue_t)_TMConnectionQueue_sConnectionQueue,  0LL);
    }

    _TMCopyConnection_sConnection = (uint64_t)mach_service;
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_3);
    xpc_connection_resume((xpc_connection_t)_TMCopyConnection_sConnection);
    uint64_t v2 = _TMCopyConnection_sConnection;
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = v2;
  return xpc_retain(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
}

void ___TMCopyConnection_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 != MEMORY[0x1895F9198])
  {
    if (a2 == MEMORY[0x1895F91A0])
    {
      NSLog(@"Error: Daemon connection invalidated");
      xpc_release((xpc_object_t)_TMCopyConnection_sConnection);
      _TMCopyConnection_sConnection = 0LL;
    }

    else
    {
      NSLog(@"Error: Unexpected message or error from Daemon: %@", a2);
    }
  }

@end