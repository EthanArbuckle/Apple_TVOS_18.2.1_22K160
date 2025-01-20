@interface OS_xpc_datastore_object
- (OS_xpc_datastore_object)initWithName:(const char *)a3;
- (id)copyCurrentStateWithReqType:(unint64_t)a3;
- (void)dealloc;
@end

@implementation OS_xpc_datastore_object

- (OS_xpc_datastore_object)initWithName:(const char *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___OS_xpc_datastore_object;
  v4 = -[OS_xpc_datastore_object init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->lock._os_unfair_lock_opaque = 0;
    v4->ds_name = strdup(a3);
  }

  return v5;
}

- (void)dealloc
{
  local_data = self->local_data;
  self->local_data = 0LL;

  conn = self->conn;
  if (conn) {
    xpc_connection_cancel(conn);
  }
  free(self->ds_name);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___OS_xpc_datastore_object;
  -[OS_xpc_datastore_object dealloc](&v5, sel_dealloc);
}

- (id)copyCurrentStateWithReqType:(unint64_t)a3
{
  return 0LL;
}

- (void).cxx_destruct
{
}

@end