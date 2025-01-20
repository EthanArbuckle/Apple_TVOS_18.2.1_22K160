@interface WACoreCapture
- (OS_dispatch_queue)ccQueue;
- (WACoreCapture)init;
- (void)__dumpCoreCaptureLogsWithReason:(id)a3;
- (void)setCcQueue:(id)a3;
@end

@implementation WACoreCapture

- (WACoreCapture)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___WACoreCapture;
  v2 = -[WACoreCapture init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.wifi.analytics.ccQ", v4);
    ccQueue = v2->_ccQueue;
    v2->_ccQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  else
  {
    id v9 = WALogCategoryDefaultHandle();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "-[WACoreCapture init]";
      __int16 v14 = 1024;
      int v15 = 48;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error super init", buf, 0x12u);
    }
  }

  return v2;
}

- (void)__dumpCoreCaptureLogsWithReason:(id)a3
{
  id v4 = a3;
  id v5 = WALogCategoryDefaultHandle();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v12 = "-[WACoreCapture __dumpCoreCaptureLogsWithReason:]";
    __int16 v13 = 1024;
    int v14 = 62;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}s::%d:Called into __dumpCoreCaptureLogsWithReason: %@",  buf,  0x1Cu);
  }

  ccQueue = (dispatch_queue_s *)self->_ccQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100040408;
  block[3] = &unk_1000CCD80;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(ccQueue, block);
}

- (OS_dispatch_queue)ccQueue
{
  return self->_ccQueue;
}

- (void)setCcQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end