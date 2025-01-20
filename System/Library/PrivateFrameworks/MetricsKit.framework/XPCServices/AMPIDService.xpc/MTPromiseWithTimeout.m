@interface MTPromiseWithTimeout
- (MTPromise)promise;
- (MTPromiseWithTimeout)initWithTimeout:(double)a3 queue:(id)a4 timeoutBlock:(id)a5;
- (NSDate)startDate;
- (OS_dispatch_source)dispatchSourceTimer;
- (void)dealloc;
- (void)finishWithError:(id)a3;
- (void)finishWithResult:(id)a3;
- (void)setDispatchSourceTimer:(id)a3;
- (void)setPromise:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation MTPromiseWithTimeout

- (MTPromiseWithTimeout)initWithTimeout:(double)a3 queue:(id)a4 timeoutBlock:(id)a5
{
  v8 = (dispatch_queue_s *)a4;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___MTPromiseWithTimeout;
  v10 = -[MTPromiseWithTimeout init](&v22, "init");
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[MTPromiseWithTimeout setStartDate:](v10, "setStartDate:", v11);

    v12 = objc_alloc_init(&OBJC_CLASS___MTPromise);
    -[MTPromiseWithTimeout setPromise:](v10, "setPromise:", v12);

    v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v8);
    dispatch_source_set_timer(v13, 0LL, (unint64_t)(a3 * 1000000000.0), 0x989680uLL);
    objc_initWeak(&location, v10);
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472LL;
    v17 = sub_10000CE90;
    v18 = &unk_100020A78;
    objc_copyWeak(v20, &location);
    v20[1] = *(id *)&a3;
    id v19 = v9;
    dispatch_source_set_event_handler(v13, &v15);
    -[MTPromiseWithTimeout setDispatchSourceTimer:](v10, "setDispatchSourceTimer:", v13, v15, v16, v17, v18);
    dispatch_resume(v13);

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)finishWithResult:(id)a3
{
  id v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromiseWithTimeout promise](self, "promise"));
  unsigned __int8 v5 = [v4 isFinished];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromiseWithTimeout promise](self, "promise"));
    [v6 finishWithResult:v9];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromiseWithTimeout dispatchSourceTimer](self, "dispatchSourceTimer"));

  if (v7)
  {
    v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[MTPromiseWithTimeout dispatchSourceTimer](self, "dispatchSourceTimer"));
    dispatch_source_cancel(v8);

    -[MTPromiseWithTimeout setDispatchSourceTimer:](self, "setDispatchSourceTimer:", 0LL);
  }
}

- (void)finishWithError:(id)a3
{
  id v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromiseWithTimeout promise](self, "promise"));
  unsigned __int8 v5 = [v4 isFinished];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromiseWithTimeout promise](self, "promise"));
    [v6 finishWithError:v9];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromiseWithTimeout dispatchSourceTimer](self, "dispatchSourceTimer"));

  if (v7)
  {
    v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[MTPromiseWithTimeout dispatchSourceTimer](self, "dispatchSourceTimer"));
    dispatch_source_cancel(v8);

    -[MTPromiseWithTimeout setDispatchSourceTimer:](self, "setDispatchSourceTimer:", 0LL);
  }
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPromiseWithTimeout dispatchSourceTimer](self, "dispatchSourceTimer"));

  if (v3)
  {
    v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[MTPromiseWithTimeout dispatchSourceTimer](self, "dispatchSourceTimer"));
    dispatch_source_cancel(v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTPromiseWithTimeout;
  -[MTPromiseWithTimeout dealloc](&v5, "dealloc");
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (MTPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
}

- (OS_dispatch_source)dispatchSourceTimer
{
  return self->_dispatchSourceTimer;
}

- (void)setDispatchSourceTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end