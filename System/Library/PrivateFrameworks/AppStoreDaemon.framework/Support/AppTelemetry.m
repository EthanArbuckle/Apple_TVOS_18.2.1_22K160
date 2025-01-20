@interface AppTelemetry
- (AppTelemetry)init;
@end

@implementation AppTelemetry

- (AppTelemetry)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___AppTelemetry;
  v2 = -[AppTelemetry init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.AppTelemetry.dispatch", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end