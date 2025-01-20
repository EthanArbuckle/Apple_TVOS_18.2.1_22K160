@interface CellularMonitor
- (CellularMonitor)init;
- (void)dealloc;
@end

@implementation CellularMonitor

- (CellularMonitor)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CellularMonitor;
  v2 = -[CellularMonitor init](&v15, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.CellularMonitor", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    if (os_variant_has_internal_content("com.apple.appstored"))
    {
      objc_initWeak(&location, v2);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100287330;
      v12[3] = &unk_1003EBB18;
      objc_copyWeak(&v13, &location);
      notify_register_dispatch("com.apple.appstored.emulatenetwork", &v2->_emulationToken, v8, v12);

      v9 = sub_10021D7D0((uint64_t)&OBJC_CLASS___NetworkEmulation);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      sub_100287384((uint64_t)v2, v10);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }

  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CellularMonitor;
  -[CellularMonitor dealloc](&v2, "dealloc");
}

- (void).cxx_destruct
{
}

@end