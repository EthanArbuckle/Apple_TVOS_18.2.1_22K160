@interface DecryptDataConsumer
- (void)consumeData:(id)a3 withCompletionHandler:(id)a4;
- (void)dealloc;
- (void)finishWithCompletionHandler:(id)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetWithCompletionHandler:(id)a3;
- (void)suspendWithCompletionHandler:(id)a3;
- (void)truncateWithCompletionHandler:(id)a3;
@end

@implementation DecryptDataConsumer

- (void)dealloc
{
  self->_partialSampleBuffer = 0LL;
  free(self->_sampleSizes);
  self->_sampleSizes = 0LL;
  session = self->_session;
  if (session)
  {
    sub_1001802D4((uint64_t)session);
    self->_session = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DecryptDataConsumer;
  -[DecryptDataConsumer dealloc](&v4, "dealloc");
}

- (void)consumeData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  consumerQueue = (dispatch_queue_s *)self->_consumerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001B0AF0;
  block[3] = &unk_1003E9FD0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(consumerQueue, block);
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = (dispatch_queue_s *)self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B11A0;
  v7[3] = &unk_1003E9FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = (dispatch_queue_s *)self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B1474;
  v7[3] = &unk_1003E9FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void)resetWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = (dispatch_queue_s *)self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B163C;
  v7[3] = &unk_1003E9FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void)suspendWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = (dispatch_queue_s *)self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B174C;
  v7[3] = &unk_1003E9FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void)truncateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  consumerQueue = (dispatch_queue_s *)self->_consumerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001B185C;
  v7[3] = &unk_1003E9FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(consumerQueue, v7);
}

- (void).cxx_destruct
{
}

@end