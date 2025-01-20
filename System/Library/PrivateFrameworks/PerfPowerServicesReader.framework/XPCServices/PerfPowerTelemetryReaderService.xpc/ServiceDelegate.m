@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = PPSLogReaderService();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000031C8((uint64_t)v5, (uint64_t)v6, v8);
  }

  int v9 = [v6 processIdentifier];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 valueForEntitlement:@"com.apple.PerfPowerServices.data-read-xpc"]);
  if ((objc_opt_respondsToSelector(v10, "BOOLValue") & 1) != 0
    && ([v10 BOOLValue] & 1) != 0)
  {
    id v11 = PPSLogReaderService();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000030E0(v9, v12);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PerfPowerServicesReaderProtocol));
    [v6 setExportedInterface:v13];

    [v6 setInterruptionHandler:&stru_100004200];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100002D18;
    v35[3] = &unk_100004220;
    int v36 = v9;
    [v6 setInvalidationHandler:v35];
    v14 = objc_opt_new(&OBJC_CLASS___PerfPowerServicesReaderService);
    [v6 setExportedObject:v14];
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___PPSTimeSeriesRequest);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___PPSHistogramRequest);
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___PPSHistogramDimension);
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___PPSGroupingDimension);
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___PPSIntervalSetRequest);
    v20 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v15,  v16,  v17,  v18,  v19,  objc_opt_class(&OBJC_CLASS___PPSDataRequest),  0LL);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 exportedInterface]);
    [v21 setClasses:v34 forSelector:"dataForRequest:withReply:" argumentIndex:0 ofReply:0];

    uint64_t v22 = objc_opt_class(&OBJC_CLASS___PPSTimeSeries);
    uint64_t v23 = objc_opt_class(&OBJC_CLASS___PPSEvent);
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___PPSHistogram);
    v25 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v22,  v23,  v24,  objc_opt_class(&OBJC_CLASS___PPSHistogramDimension),  0LL);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError), 0LL);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue([v6 exportedInterface]);
    BOOL v30 = 1;
    [v29 setClasses:v26 forSelector:"dataForRequest:withReply:" argumentIndex:0 ofReply:1];

    v31 = (void *)objc_claimAutoreleasedReturnValue([v6 exportedInterface]);
    [v31 setClasses:v28 forSelector:"dataForRequest:withReply:" argumentIndex:1 ofReply:1];

    [v6 resume];
  }

  else
  {
    [v6 invalidate];
    id v32 = PPSLogReaderService();
    v14 = (PerfPowerServicesReaderService *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      sub_100003154(v9, (os_log_s *)v14);
    }
    BOOL v30 = 0;
  }

  return v30;
}

@end