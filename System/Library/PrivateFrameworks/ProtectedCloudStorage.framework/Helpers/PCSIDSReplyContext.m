@interface PCSIDSReplyContext
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timeoutTimer;
- (PCSIDSReplyContext)initWithTimeout:(double)a3 queue:(id)a4 logDescription:(id)a5 sentID:(id)a6 replyHandler:(id)a7 completion:(id)a8;
- (id)completion;
- (id)replyBlock;
- (void)runReplyHandlerWithMessage:(id)a3 error:(id)a4;
- (void)setCompletion:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReplyBlock:(id)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation PCSIDSReplyContext

- (PCSIDSReplyContext)initWithTimeout:(double)a3 queue:(id)a4 logDescription:(id)a5 sentID:(id)a6 replyHandler:(id)a7 completion:(id)a8
{
  v14 = (dispatch_queue_s *)a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___PCSIDSReplyContext;
  v19 = -[PCSIDSReplyContext init](&v30, "init");
  if (v19)
  {
    id v20 = [v17 copy];
    -[PCSIDSReplyContext setReplyBlock:](v19, "setReplyBlock:", v20);

    id v21 = [v18 copy];
    -[PCSIDSReplyContext setCompletion:](v19, "setCompletion:", v21);

    -[PCSIDSReplyContext setQueue:](v19, "setQueue:", v14);
    v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v14);
    dispatch_time_t v23 = dispatch_time(0LL, 1000000000 * (unint64_t)a3);
    dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100004838;
    handler[3] = &unk_100024908;
    id v27 = v15;
    id v28 = v16;
    v24 = v19;
    v29 = v24;
    dispatch_source_set_event_handler(v22, handler);
    -[PCSIDSReplyContext setTimeoutTimer:](v24, "setTimeoutTimer:", v22);
    dispatch_resume(v22);
  }

  return v19;
}

- (void)runReplyHandlerWithMessage:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[PCSIDSReplyContext replyBlock](self, "replyBlock"));
  ((void (**)(void, id, id))v8)[2](v8, v7, v6);

  -[PCSIDSReplyContext setReplyBlock:](self, "setReplyBlock:", 0LL);
  v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[PCSIDSReplyContext completion](self, "completion"));
  v9[2]();

  -[PCSIDSReplyContext setCompletion:](self, "setCompletion:", 0LL);
  v10 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[PCSIDSReplyContext timeoutTimer](self, "timeoutTimer"));
  dispatch_source_cancel(v10);

  -[PCSIDSReplyContext setTimeoutTimer:](self, "setTimeoutTimer:", 0LL);
}

- (OS_dispatch_source)timeoutTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTimeoutTimer:(id)a3
{
}

- (id)replyBlock
{
  return objc_getProperty(self, a2, 16LL, 1);
}

- (void)setReplyBlock:(id)a3
{
}

- (id)completion
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setCompletion:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end