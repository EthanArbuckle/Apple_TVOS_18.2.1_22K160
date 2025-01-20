@interface FTNotifyObserver
- (FTNotifyObserver)initWithName:(id)a3 queue:(id)a4 callback:(id)a5;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)callback;
- (int)token;
- (void)dealloc;
- (void)setToken:(int)a3;
@end

@implementation FTNotifyObserver

- (FTNotifyObserver)initWithName:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___FTNotifyObserver;
  v11 = -[FTNotifyObserver init](&v22, "init");
  if (v11)
  {
    id v12 = objc_retainBlock(v10);
    id callback = v11->_callback;
    v11->_id callback = v12;

    v14 = (NSString *)[v8 copy];
    name = v11->_name;
    v11->_name = v14;

    objc_storeStrong((id *)&v11->_queue, a4);
    v11->_token = 0;
    objc_initWeak(&location, v11);
    v16 = -[NSString UTF8String](v11->_name, "UTF8String");
    queue = (dispatch_queue_s *)v11->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100008198;
    v19[3] = &unk_100014678;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch(v16, &v11->_token, queue, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)dealloc
{
  self->_token = 0;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___FTNotifyObserver;
  -[FTNotifyObserver dealloc](&v3, "dealloc");
}

- (id)callback
{
  return self->_callback;
}

- (NSString)name
{
  return self->_name;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
}

@end