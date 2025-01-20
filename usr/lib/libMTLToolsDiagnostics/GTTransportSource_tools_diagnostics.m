@interface GTTransportSource_tools_diagnostics
- (BOOL)cancelled;
- (GTTransportSource_tools_diagnostics)init;
- (id)_initWithQueue:(id)a3 transport:(id)a4;
- (id)cancellationHandler;
- (id)messageHandler;
- (id)registrationHandler;
- (void)_callCancellationHandler;
- (void)_callRegistrationHandler;
- (void)_cancel;
- (void)_dispatch:(id)a3;
- (void)_register;
- (void)cancel;
- (void)dealloc;
- (void)resume;
- (void)setCancellationHandler:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)setRegistrationHandler:(id)a3;
- (void)suspend;
@end

@implementation GTTransportSource_tools_diagnostics

- (GTTransportSource_tools_diagnostics)init
{
  return 0LL;
}

- (id)_initWithQueue:(id)a3 transport:(id)a4
{
  if (!a3)
  {
    if (s_logUsingOsLog)
    {
      v13 = (os_log_s *)gt_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v14 = "fail: queue cannot be NULL";
        goto LABEL_12;
      }

- (void)dealloc
{
  mqueue = (dispatch_object_s *)self->_mqueue;
  if (mqueue)
  {
    dispatch_release(mqueue);
    self->_mqueue = 0LL;
  }

  queue = (dispatch_object_s *)self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GTTransportSource_tools_diagnostics;
  -[GTTransportSource_tools_diagnostics dealloc](&v5, "dealloc");
}

- (void)resume
{
}

- (void)suspend
{
}

- (void)cancel
{
  p_state = &self->_state;
  do
    unsigned int v4 = __ldaxr((unsigned int *)p_state);
  while (__stlxr(v4 | 1, (unsigned int *)p_state));
  if ((v4 & 1) == 0)
  {
    dispatch_suspend((dispatch_object_t)self->_mqueue);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __27__GTTransportSource_cancel__block_invoke;
    block[3] = &unk_20988;
    block[4] = self;
    dispatch_async((dispatch_queue_t)queue, block);
  }

- (BOOL)cancelled
{
  char v2 = atomic_load((unsigned int *)&self->_state);
  return v2 & 1;
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
  id v4 = [a3 copy];
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __39__GTTransportSource_setMessageHandler___block_invoke;
  v6[3] = &unk_20960;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async((dispatch_queue_t)queue, v6);
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setCancellationHandler:(id)a3
{
  id v4 = [a3 copy];
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __44__GTTransportSource_setCancellationHandler___block_invoke;
  v6[3] = &unk_20960;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async((dispatch_queue_t)queue, v6);
}

- (id)registrationHandler
{
  return self->_registrationHandler;
}

- (void)setRegistrationHandler:(id)a3
{
  id v4 = [a3 copy];
  dispatch_suspend((dispatch_object_t)self->_mqueue);
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __44__GTTransportSource_setRegistrationHandler___block_invoke;
  v6[3] = &unk_20960;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async((dispatch_queue_t)queue, v6);
}

- (void)_callRegistrationHandler
{
  char v2 = atomic_load((unsigned int *)&self->_state);
  if ((v2 & 1) == 0)
  {
    registrationHandler = (void (**)(id, SEL))self->_registrationHandler;
    if (registrationHandler)
    {
      registrationHandler[2](registrationHandler, a2);

      self->_registrationHandler = 0LL;
    }
  }

- (void)_register
{
  p_state = &self->_state;
  char v3 = atomic_load((unsigned int *)&self->_state);
  if ((v3 & 1) == 0)
  {
    if (-[GTTransport_tools_diagnostics _activateSource:](self->_transport, "_activateSource:", self))
    {
      do
        unsigned int v5 = __ldaxr((unsigned int *)p_state);
      while (__stlxr(v5 | 2, (unsigned int *)p_state));
      mqueue = self->_mqueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = __30__GTTransportSource__register__block_invoke;
      block[3] = &unk_20988;
      block[4] = self;
      dispatch_async((dispatch_queue_t)mqueue, block);
    }

    else
    {
      -[GTTransportSource_tools_diagnostics cancel](self, "cancel");
    }
  }

- (void)_callCancellationHandler
{
  cancellationHandler = (void (**)(id, SEL))self->_cancellationHandler;
  if (cancellationHandler)
  {
    cancellationHandler[2](cancellationHandler, a2);

    self->_cancellationHandler = 0LL;
  }

  self->_transport = 0LL;
}

- (void)_cancel
{
  self->_messageHandler = 0LL;
  self->_registrationHandler = 0LL;
  mqueue = self->_mqueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __28__GTTransportSource__cancel__block_invoke;
  block[3] = &unk_20988;
  block[4] = self;
  dispatch_async((dispatch_queue_t)mqueue, block);
}

- (void)_dispatch:(id)a3
{
  mqueue = self->_mqueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __31__GTTransportSource__dispatch___block_invoke;
  v4[3] = &unk_209B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)mqueue, v4);
}

@end