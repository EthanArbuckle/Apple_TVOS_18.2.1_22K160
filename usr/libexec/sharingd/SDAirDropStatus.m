@interface SDAirDropStatus
- (SDAirDropStatus)init;
- (SDAirDropStatusDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setStatusAndNotify;
- (void)somethingChanged:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDAirDropStatus

- (SDAirDropStatus)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SDAirDropStatus;
  v2 = -[SDAirDropStatus init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_started = 0;
    v4 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    properties = v3->_properties;
    v3->_properties = v4;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SDAirDropStatus;
  -[SDAirDropStatus dealloc](&v3, "dealloc");
}

- (void)setStatusAndNotify
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058388;
  block[3] = &unk_1005CB2F8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)somethingChanged:(id)a3
{
}

- (void)start
{
  if (!self->_started)
  {
    self->_started = 1;
    -[SDAirDropStatus setStatusAndNotify](self, "setStatusAndNotify");
  }

- (void)stop
{
  if (self->_started) {
    self->_started = 0;
  }
}

- (SDAirDropStatusDelegate)delegate
{
  return (SDAirDropStatusDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end