@interface PushServiceTestFlightConsumer
- (void)_handleBagChangedNotification:(id)a3;
- (void)dealloc;
- (void)pushConnection:(id)a3 didReceiveRawMessage:(id)a4;
- (void)pushConnection:(id)a3 didReceiveToken:(id)a4 forTopic:(unint64_t)a5;
@end

@implementation PushServiceTestFlightConsumer

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PushServiceTestFlightConsumer;
  -[PushServiceTestFlightConsumer dealloc](&v4, "dealloc");
}

- (void)pushConnection:(id)a3 didReceiveRawMessage:(id)a4
{
  id v5 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100297914;
  v8[3] = &unk_1003E9DC0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(dispatchQueue, v8);
}

- (void)pushConnection:(id)a3 didReceiveToken:(id)a4 forTopic:(unint64_t)a5
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100297C58;
  v9[3] = &unk_1003E9DC0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, v9);
}

- (void)_handleBagChangedNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100297E48;
  block[3] = &unk_1003E9880;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
}

@end