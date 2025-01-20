@interface IDSEncryptionQueue
- (IDSEncryptionQueue)initWithName:(char *)a3 qosClass:(unsigned int)a4 specific:(char *)a5;
- (OS_dispatch_queue)backingQueue;
- (const)specific;
- (void)performAsyncBlock:(id)a3;
- (void)performSyncBlock:(id)a3;
- (void)setBackingQueue:(id)a3;
- (void)setSpecific:(const char *)a3;
@end

@implementation IDSEncryptionQueue

- (IDSEncryptionQueue)initWithName:(char *)a3 qosClass:(unsigned int)a4 specific:(char *)a5
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___IDSEncryptionQueue;
  v8 = -[IDSEncryptionQueue init](&v16, "init");
  if (v8)
  {
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_qos_class(v10, (dispatch_qos_class_t)a4, 0);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create(a3, v12);

    dispatch_queue_set_specific(v13, a5, (void *)1, 0LL);
    backingQueue = v8->_backingQueue;
    v8->_backingQueue = (OS_dispatch_queue *)v13;

    v8->_specific = a5;
  }

  return v8;
}

- (void)performAsyncBlock:(id)a3
{
  if (a3) {
    dispatch_async((dispatch_queue_t)self->_backingQueue, a3);
  }
}

- (void)performSyncBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  if (v4)
  {
    block = v4;
    if (dispatch_get_specific(self->_specific)) {
      block[2]();
    }
    else {
      dispatch_sync((dispatch_queue_t)self->_backingQueue, block);
    }
    v4 = block;
  }
}

- (OS_dispatch_queue)backingQueue
{
  return self->_backingQueue;
}

- (void)setBackingQueue:(id)a3
{
}

- (const)specific
{
  return self->_specific;
}

- (void)setSpecific:(const char *)a3
{
  self->_specific = a3;
}

- (void).cxx_destruct
{
}

@end