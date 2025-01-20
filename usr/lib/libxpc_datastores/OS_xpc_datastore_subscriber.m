@interface OS_xpc_datastore_subscriber
- (id)copyCurrentStateWithReqType:(unint64_t)a3;
- (void)dealloc;
@end

@implementation OS_xpc_datastore_subscriber

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___OS_xpc_datastore_subscriber;
  -[OS_xpc_datastore_object dealloc](&v3, sel_dealloc);
}

- (id)copyCurrentStateWithReqType:(unint64_t)a3
{
  int v4 = _xpc_datastore_subscriber_refresh(self, a3);
  if (v4)
  {
    v5 = 0LL;
    *__error() = v4;
  }

  else
  {
    p_lock = &self->super.lock;
    v7 = self;
    os_unfair_lock_lock_with_options();
    v8 = v7->super.local_data;
    os_unfair_lock_unlock(p_lock);

    if (!v8) {
      sub_188BF0430();
    }
    uint64_t v9 = xpc_create_from_serialization();
    if (!v9) {
      sub_188BF0444();
    }
    v5 = (void *)v9;
  }

  return v5;
}

@end