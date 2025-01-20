@interface ThermalPressureMonitor
- (ThermalPressureMonitor)init;
- (void)dealloc;
@end

@implementation ThermalPressureMonitor

- (ThermalPressureMonitor)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ThermalPressureMonitor;
  v2 = -[ThermalPressureMonitor init](&v13, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.appstored.ThermalPressureMonitor", v4, v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    v9 = (dispatch_queue_s *)v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10030363C;
    block[3] = &unk_1003E9880;
    v12 = v2;
    dispatch_async(v9, block);
  }

  return v2;
}

- (void)dealloc
{
  int token = self->_token;
  if (token != -1)
  {
    notify_cancel(token);
    self->_int token = -1;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ThermalPressureMonitor;
  -[ThermalPressureMonitor dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
}

@end