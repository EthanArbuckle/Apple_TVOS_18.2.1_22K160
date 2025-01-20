@interface DADeviceObserverLocal
- (id)beginDiscoveringDevicesWithHandler:(id)a3;
- (void)discoverAllDevicesWithCompletionHandler:(id)a3;
@end

@implementation DADeviceObserverLocal

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  id v3 = -[DADeviceObserverLocal beginDiscoveringDevicesWithHandler:](self, "beginDiscoveringDevicesWithHandler:", a3);
}

- (id)beginDiscoveringDevicesWithHandler:(id)a3
{
  id v3 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003F28;
  block[3] = &unk_10000C5B8;
  id v10 = v3;
  id v6 = v3;
  dispatch_async(v5, block);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  return v7;
}

@end