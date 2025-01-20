@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  NSLog(@"In the listener of the Signpost Reader XPCService");
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___XPCSignpostReaderProtocol));
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new(&OBJC_CLASS___XPCSignpostReader);
  [v4 setExportedObject:v6];
  if (_os_feature_enabled_impl("PerfPowerServices", "signpost_reader_idle_exit"))
  {
    id v7 = PLLogSignpostReader();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10000A900(v8);
    }

    [v4 setInterruptionHandler:&stru_100010328];
    [v4 setInvalidationHandler:&stru_100010328];
  }

  [v4 resume];

  return 1;
}

@end