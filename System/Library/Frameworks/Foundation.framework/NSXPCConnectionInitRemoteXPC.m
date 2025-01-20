@interface NSXPCConnectionInitRemoteXPC
@end

@implementation NSXPCConnectionInitRemoteXPC

void *___NSXPCConnectionInitRemoteXPC_block_invoke()
{
  result = dlopen("/System/Library/PrivateFrameworks/RemoteXPC.framework/RemoteXPC", 256);
  qword_18C496A00 = (uint64_t)result;
  if (result)
  {
    _xpc_remote_connection_activate = (uint64_t (*)(void))dlsym(result, "xpc_remote_connection_activate");
    _xpc_remote_connection_cancel = (uint64_t (*)(void))dlsym( (void *)qword_18C496A00,  "xpc_remote_connection_cancel");
    _xpc_remote_connection_create_remote_service_listener = dlsym( (void *)qword_18C496A00,  "xpc_remote_connection_create_remote_service_listener");
    off_18C496A08 = dlsym((void *)qword_18C496A00, "xpc_remote_connection_create_with_remote_service");
    off_18C496A10 = (uint64_t (*)(void, void))dlsym( (void *)qword_18C496A00,  "xpc_remote_connection_send_barrier");
    off_18C496A18 = (uint64_t (*)(void, void))dlsym( (void *)qword_18C496A00,  "xpc_remote_connection_send_message");
    off_18C496A20 = (uint64_t (*)(void, void, void, void))dlsym( (void *)qword_18C496A00,  "xpc_remote_connection_send_message_with_reply");
    off_18C496A28 = (uint64_t (*)(void))dlsym( (void *)qword_18C496A00,  "xpc_remote_connection_send_message_with_reply_sync");
    _xpc_remote_connection_set_event_handler = dlsym((void *)qword_18C496A00, "xpc_remote_connection_set_event_handler");
    _xpc_remote_connection_set_target_queue = (uint64_t (*)(void, void))dlsym( (void *)qword_18C496A00,  "xpc_remote_connection_set_target_queue");
    result = dlsym((void *)qword_18C496A00, "_xpc_type_remote_connection");
    _XPC_TYPE_REMOTE_CONNECTION = (uint64_t)result;
  }

  return result;
}

@end