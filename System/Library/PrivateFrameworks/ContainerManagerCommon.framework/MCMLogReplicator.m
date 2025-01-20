@interface MCMLogReplicator
- (MCMLogReplicator)initWithWorkloop:(id)a3;
- (OS_dispatch_queue)queue;
- (id)volumeChangedDispatchQueue;
- (void)volumeChangedWithEvents:(unint64_t)a3 newVolumeState:(unint64_t)a4;
@end

@implementation MCMLogReplicator

- (MCMLogReplicator)initWithWorkloop:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  v4 = (dispatch_queue_s *)a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMLogReplicator;
  v5 = -[MCMLogReplicator init](&v11, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_t v8 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.log_diverter", v7, v4);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;
  }

  return v5;
}

- (id)volumeChangedDispatchQueue
{
  return -[MCMLogReplicator queue](self, "queue");
}

- (void)volumeChangedWithEvents:(unint64_t)a3 newVolumeState:(unint64_t)a4
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if ((a4 & 3) != 0)
  {
    container_internal_get_first_boot_uuid();
    id v4 = containermanager_copy_global_configuration();
    objc_msgSend(v4, "defaultUser", 0, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 UID];
    container_log_replication_enable_to_uid_relative_path();
  }

  else
  {
    container_log_replication_disable();
  }

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end