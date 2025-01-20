@interface OS_xpc_datastore_publisher
- (id)copyCurrentStateWithReqType:(unint64_t)a3;
@end

@implementation OS_xpc_datastore_publisher

- (id)copyCurrentStateWithReqType:(unint64_t)a3
{
  p_lock = &self->super.lock;
  v4 = self;
  os_unfair_lock_lock_with_options();
  v5 = v4->super.local_data;
  os_unfair_lock_unlock(p_lock);

  if (v5)
  {
    v6 = (void *)xpc_create_from_serialization();
    if (!v6) {
      sub_188BF0444();
    }
  }

  else
  {
    v6 = 0LL;
    *__error() = 96;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end