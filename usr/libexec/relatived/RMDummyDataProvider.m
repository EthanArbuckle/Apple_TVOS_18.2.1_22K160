@interface RMDummyDataProvider
- (BOOL)isRunning;
- (OS_dispatch_queue)producerQueue;
- (OS_dispatch_queue)receiverQueue;
- (OS_dispatch_source)producerTimer;
- (RMDummyDataProvider)initWithConfiguration:(id)a3 receiverQueue:(id)a4;
- (RMDummyDataProviderConfiguration)configuration;
- (id)startProducingDataWithCallback:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setProducerQueue:(id)a3;
- (void)setProducerTimer:(id)a3;
- (void)setReceiverQueue:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)stopProducingData;
@end

@implementation RMDummyDataProvider

- (RMDummyDataProvider)initWithConfiguration:(id)a3 receiverQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___RMDummyDataProvider;
  v8 = -[RMDummyDataProvider init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    -[RMDummyDataProvider setConfiguration:](v8, "setConfiguration:", v6);
    -[RMDummyDataProvider setReceiverQueue:](v9, "setReceiverQueue:", v7);
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("RMDummyDataProviderQueue", v11);
    -[RMDummyDataProvider setProducerQueue:](v9, "setProducerQueue:", v12);
  }

  return v9;
}

- (id)startProducingDataWithCallback:(id)a3
{
  id v4 = a3;
  -[RMDummyDataProvider setRunning:](self, "setRunning:", 1LL);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RMDummyDataProvider producerQueue](self, "producerQueue"));
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 1uLL, v5);
  -[RMDummyDataProvider setProducerTimer:](self, "setProducerTimer:", v6);

  id v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[RMDummyDataProvider producerTimer](self, "producerTimer"));
  dispatch_source_set_timer( v7,  0LL,  -[RMDummyDataProviderConfiguration intervalInNanoSeconds](self->_configuration, "intervalInNanoSeconds"),  0LL);

  v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[RMDummyDataProvider producerTimer](self, "producerTimer"));
  dispatch_queue_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  objc_super v14 = sub_10000D450;
  v15 = &unk_10001CB80;
  v16 = self;
  id v17 = v4;
  id v9 = v4;
  dispatch_source_set_event_handler(v8, &v12);

  dispatch_queue_attr_t v10 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[RMDummyDataProvider producerTimer](self, "producerTimer", v12, v13, v14, v15, v16));
  dispatch_resume(v10);

  return 0LL;
}

- (void)stopProducingData
{
  v3 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[RMDummyDataProvider producerTimer](self, "producerTimer"));
  dispatch_source_cancel(v3);

  -[RMDummyDataProvider setProducerTimer:](self, "setProducerTimer:", 0LL);
}

- (OS_dispatch_queue)producerQueue
{
  return self->_producerQueue;
}

- (void)setProducerQueue:(id)a3
{
}

- (OS_dispatch_queue)receiverQueue
{
  return self->_receiverQueue;
}

- (void)setReceiverQueue:(id)a3
{
}

- (RMDummyDataProviderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (OS_dispatch_source)producerTimer
{
  return self->_producerTimer;
}

- (void)setProducerTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end