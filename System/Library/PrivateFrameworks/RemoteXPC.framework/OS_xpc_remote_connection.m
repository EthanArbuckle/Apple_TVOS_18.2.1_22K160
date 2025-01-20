@interface OS_xpc_remote_connection
- (BOOL)send_in_progress;
- (OS_dispatch_queue)internal_queue;
- (OS_dispatch_queue)target_queue;
- (OS_dispatch_queue)tls_verify_queue;
- (OS_sec_identity)tls_identity;
- (OS_xpc_remote_listener)listener;
- (id)event_handler;
- (id)tls_verify;
- (int)state;
- (int)type;
- (void)dealloc;
- (void)setEvent_handler:(id)a3;
- (void)setInternal_queue:(id)a3;
- (void)setListener:(id)a3;
- (void)setSend_in_progress:(BOOL)a3;
- (void)setState:(int)a3;
- (void)setTarget_queue:(id)a3;
- (void)setTls_identity:(id)a3;
- (void)setTls_verify:(id)a3;
- (void)setTls_verify_queue:(id)a3;
- (void)setType:(int)a3;
@end

@implementation OS_xpc_remote_connection

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_xpc_remote_connection;
  -[OS_xpc_remote_connection dealloc](&v3, sel_dealloc);
}

- (OS_dispatch_queue)internal_queue
{
  return self->_internal_queue;
}

- (void)setInternal_queue:(id)a3
{
}

- (OS_dispatch_queue)target_queue
{
  return self->_target_queue;
}

- (void)setTarget_queue:(id)a3
{
}

- (id)event_handler
{
  return self->_event_handler;
}

- (void)setEvent_handler:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)send_in_progress
{
  return self->_send_in_progress;
}

- (void)setSend_in_progress:(BOOL)a3
{
  self->_send_in_progress = a3;
}

- (OS_xpc_remote_listener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_sec_identity)tls_identity
{
  return self->_tls_identity;
}

- (void)setTls_identity:(id)a3
{
}

- (id)tls_verify
{
  return self->_tls_verify;
}

- (void)setTls_verify:(id)a3
{
}

- (OS_dispatch_queue)tls_verify_queue
{
  return self->_tls_verify_queue;
}

- (void)setTls_verify_queue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end