@interface ADDeviceSyncMessageSendingContext
- (ADDeviceSyncMessageSendingContext)initWithQueue:(id)a3 deviceIdentifier:(id)a4 timeoutDuration:(double)a5 completion:(id)a6;
- (void)_addError:(id)a3;
- (void)_beginSendingWithMessageSender:(id)a3;
- (void)_cancelWatchdogTimer;
- (void)_endSendingWithMessageSender:(id)a3 replyMessage:(id)a4 error:(id)a5;
- (void)_finalizeWithError:(id)a3;
- (void)_finalizeWithResponseMessage:(id)a3;
- (void)_handleWatchdogTimeout;
- (void)beginSendingWithMessageSender:(id)a3;
- (void)dealloc;
- (void)endSendingWithMessageSender:(id)a3 replyMessage:(id)a4 error:(id)a5;
@end

@implementation ADDeviceSyncMessageSendingContext

- (void)dealloc
{
  if (self->_completion)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingErrors:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingErrors:",  2405LL,  @"Message sending failed.",  self->_errors));
    -[ADDeviceSyncMessageSendingContext _finalizeWithError:](self, "_finalizeWithError:", v3);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADDeviceSyncMessageSendingContext;
  -[ADDeviceSyncMessageSendingContext dealloc](&v4, "dealloc");
}

- (ADDeviceSyncMessageSendingContext)initWithQueue:(id)a3 deviceIdentifier:(id)a4 timeoutDuration:(double)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___ADDeviceSyncMessageSendingContext;
  v14 = -[ADDeviceSyncMessageSendingContext init](&v28, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a3);
    v16 = (NSString *)[v12 copy];
    deviceIdentifier = v15->_deviceIdentifier;
    v15->_deviceIdentifier = v16;

    id v18 = objc_retainBlock(v13);
    id completion = v15->_completion;
    v15->_id completion = v18;

    if (a5 > 0.0)
    {
      objc_initWeak(&location, v15);
      v20 = objc_alloc(&OBJC_CLASS___AFWatchdogTimer);
      queue = v15->_queue;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100107128;
      v25[3] = &unk_1004FAF58;
      objc_copyWeak(&v26, &location);
      v22 = -[AFWatchdogTimer initWithTimeoutInterval:onQueue:timeoutHandler:]( v20,  "initWithTimeoutInterval:onQueue:timeoutHandler:",  queue,  v25,  a5);
      watchdogTimer = v15->_watchdogTimer;
      v15->_watchdogTimer = v22;

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
  }

  return v15;
}

- (void)beginSendingWithMessageSender:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010711C;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)endSendingWithMessageSender:(id)a3 replyMessage:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10010710C;
  v15[3] = &unk_1004FD470;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_beginSendingWithMessageSender:(id)a3
{
  unint64_t numberOfActiveMessageSenders = self->_numberOfActiveMessageSenders;
  if (!numberOfActiveMessageSenders)
  {
    -[AFWatchdogTimer start](self->_watchdogTimer, "start", a3);
    unint64_t numberOfActiveMessageSenders = self->_numberOfActiveMessageSenders;
  }

  self->_unint64_t numberOfActiveMessageSenders = numberOfActiveMessageSenders + 1;
}

- (void)_endSendingWithMessageSender:(id)a3 replyMessage:(id)a4 error:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t numberOfActiveMessageSenders = self->_numberOfActiveMessageSenders;
  if (numberOfActiveMessageSenders) {
    self->_unint64_t numberOfActiveMessageSenders = numberOfActiveMessageSenders - 1;
  }
  if (self->_completion)
  {
    -[ADDeviceSyncMessageSendingContext _addError:](self, "_addError:", v9);
    if (v8)
    {
      -[ADDeviceSyncMessageSendingContext _finalizeWithResponseMessage:](self, "_finalizeWithResponseMessage:", v8);
    }

    else if (!self->_numberOfActiveMessageSenders)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingErrors:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingErrors:",  2405LL,  @"Message sending failed.",  self->_errors));
      -[ADDeviceSyncMessageSendingContext _finalizeWithError:](self, "_finalizeWithError:", v11);
    }
  }
}

- (void)_handleWatchdogTimeout
{
  if (self->_completion)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:underlyingErrors:]( &OBJC_CLASS___AFError,  "errorWithCode:description:underlyingErrors:",  2406LL,  @"Message sending timed out.",  self->_errors));
    -[ADDeviceSyncMessageSendingContext _finalizeWithError:](self, "_finalizeWithError:", v3);
  }

- (void)_cancelWatchdogTimer
{
  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
  {
    -[AFWatchdogTimer cancel](watchdogTimer, "cancel");
    id v4 = self->_watchdogTimer;
    self->_watchdogTimer = 0LL;
  }

- (void)_addError:(id)a3
{
  id v4 = a3;
  if (v4 && self->_completion)
  {
    errors = self->_errors;
    id v8 = v4;
    if (!errors)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v7 = self->_errors;
      self->_errors = v6;

      errors = self->_errors;
    }

    -[NSMutableArray addObject:](errors, "addObject:", v8);
    id v4 = v8;
  }
}

- (void)_finalizeWithResponseMessage:(id)a3
{
  id v7 = a3;
  -[ADDeviceSyncMessageSendingContext _cancelWatchdogTimer](self, "_cancelWatchdogTimer");
  id completion = (void (**)(id, id, void))self->_completion;
  if (completion)
  {
    completion[2](completion, v7, 0LL);
    id v5 = self->_completion;
    self->_id completion = 0LL;
  }

  errors = self->_errors;
  self->_errors = 0LL;
}

- (void)_finalizeWithError:(id)a3
{
  id v7 = a3;
  -[ADDeviceSyncMessageSendingContext _cancelWatchdogTimer](self, "_cancelWatchdogTimer");
  id completion = (void (**)(id, void, id))self->_completion;
  if (completion)
  {
    completion[2](completion, 0LL, v7);
    id v5 = self->_completion;
    self->_id completion = 0LL;
  }

  errors = self->_errors;
  self->_errors = 0LL;
}

- (void).cxx_destruct
{
}

@end