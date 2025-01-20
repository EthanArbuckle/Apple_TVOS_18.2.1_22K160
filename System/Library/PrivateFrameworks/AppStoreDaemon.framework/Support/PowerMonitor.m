@interface PowerMonitor
- (PowerMonitor)init;
- (void)dealloc;
@end

@implementation PowerMonitor

- (PowerMonitor)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___PowerMonitor;
  v2 = -[PowerMonitor init](&v13, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.appstored.PowerMonitor", v4, v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    v9 = (dispatch_queue_s *)v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10021AFDC;
    block[3] = &unk_1003E9880;
    v12 = v2;
    dispatch_async(v9, block);
  }

  return v2;
}

- (void)dealloc
{
  int adapterChangeToken = self->_adapterChangeToken;
  if (adapterChangeToken != -1)
  {
    notify_cancel(adapterChangeToken);
    self->_int adapterChangeToken = -1;
  }

  int lowPowerModeToken = self->_lowPowerModeToken;
  if (lowPowerModeToken != -1)
  {
    notify_cancel(lowPowerModeToken);
    self->_int lowPowerModeToken = -1;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PowerMonitor;
  -[PowerMonitor dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
}

@end