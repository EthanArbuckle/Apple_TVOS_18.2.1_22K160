@interface CSAttSiriTimer
- (CSAttSiriTimer)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (id)completionBlock;
- (void)cancelTimer;
- (void)setCompletionBlock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimerForSecs:(double)a3 completionBlock:(id)a4;
@end

@implementation CSAttSiriTimer

- (CSAttSiriTimer)initWithQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSAttSiriTimer;
  v5 = -[CSAttSiriTimer init](&v9, "init");
  if (v5)
  {
    if (v4) {
      dispatch_queue_t v6 = (dispatch_queue_t)v4;
    }
    else {
      dispatch_queue_t v6 = dispatch_queue_create("com.apple.corespeech.attsiri-timer", 0LL);
    }
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;
  }

  return v5;
}

- (void)setTimerForSecs:(double)a3 completionBlock:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C2274;
  block[3] = &unk_10022C878;
  block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)cancelTimer
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C21AC;
  block[3] = &unk_10022F100;
  block[4] = self;
  dispatch_async(queue, block);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end