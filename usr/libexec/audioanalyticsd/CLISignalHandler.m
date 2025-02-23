@interface CLISignalHandler
- (BOOL)enabled;
- (CLISignalHandler)initWithSignal:(int)a3;
- (int)signal;
- (void)dealloc;
- (void)setEnabled:(BOOL)a3;
- (void)setExecutionBlock:(id)a3;
@end

@implementation CLISignalHandler

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    if (a3)
    {
      [(id)qword_100042CB0 addObject:self];
      dispatch_resume((dispatch_object_t)self->_dispatch_source);
    }

    else
    {
      [(id)qword_100042CB0 removeObject:self];
      dispatch_suspend((dispatch_object_t)self->_dispatch_source);
    }

    self->_enabled = a3;
  }

- (void)setExecutionBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    int signal = self->_signal;
    dispatch_source = self->_dispatch_source;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100034154;
    v8[3] = &unk_10003E4B0;
    id v9 = v4;
    int v10 = signal;
    dispatch_source_set_event_handler((dispatch_source_t)dispatch_source, v8);
  }

  else
  {
    dispatch_source_set_event_handler((dispatch_source_t)self->_dispatch_source, 0LL);
  }
}

- (CLISignalHandler)initWithSignal:(int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CLISignalHandler;
  id v4 = -[CLISignalHandler init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_int signal = a3;
    if (qword_100042CB8 != -1) {
      dispatch_once(&qword_100042CB8, &stru_10003E4F0);
    }
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, a3, 0LL, &_dispatch_main_q);
    dispatch_source = v5->_dispatch_source;
    v5->_dispatch_source = (OS_dispatch_source *)v6;
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLISignalHandler;
  -[CLISignalHandler dealloc](&v3, "dealloc");
}

- (int)signal
{
  return self->_signal;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
}

@end