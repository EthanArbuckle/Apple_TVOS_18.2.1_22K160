@interface DADeviceDecoratorWithUI
+ (id)decorateWithDevice:(id)a3;
- (BOOL)ignoreButtonEvents;
- (BOOL)isKindOfClass:(Class)a3;
- (DADeviceDecoratorWithUI)initWithDevice:(id)a3;
- (DADeviceMaterialized)original;
- (DADeviceWithUIDelegate)delegate;
- (DKBrightnessResponder)brightnessResponder;
- (DKUserAlertResponder)userAlertResponder;
- (DKViewControllerDelegate)viewControllerDelegate;
- (DKVolumeHUDResponder)volumeHUDResponder;
- (DSHardwareButtonEventMonitor)buttonEventMonitor;
- (float)originalScreenBrightness;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_reset;
- (void)_startInterceptingButtonEvents;
- (void)connect;
- (void)end;
- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)forwardInvocation:(id)a3;
- (void)handleButtonEvent:(unint64_t)a3;
- (void)idle;
- (void)requestSuiteFinishWithCompletionHandler:(id)a3;
- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4;
- (void)resumeTests;
- (void)setBrightnessResponder:(id)a3;
- (void)setButtonEventMonitor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIgnoreButtonEvents:(BOOL)a3;
- (void)setOriginal:(id)a3;
- (void)setOriginalScreenBrightness:(float)a3;
- (void)setUserAlertResponder:(id)a3;
- (void)setViewControllerDelegate:(id)a3;
- (void)setVolumeHUDResponder:(id)a3;
- (void)start;
- (void)suspendTests;
- (void)testViewPresented:(id)a3;
@end

@implementation DADeviceDecoratorWithUI

+ (id)decorateWithDevice:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDevice:v4];

  return v5;
}

- (DADeviceDecoratorWithUI)initWithDevice:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DATestQueue testQueueWithDelegate:](&OBJC_CLASS___DATestQueue, "testQueueWithDelegate:", self));
  -[DADeviceMaterialized setTestQueue:](self->_original, "setTestQueue:", v6);

  v7 = objc_opt_new(&OBJC_CLASS___DSHardwareButtonEventMonitor);
  buttonEventMonitor = self->_buttonEventMonitor;
  self->_buttonEventMonitor = v7;

  self->_ignoreButtonEvents = 0;
  return self;
}

- (DADeviceWithUIDelegate)delegate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);

  return (DADeviceWithUIDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  [v5 setDelegate:v4];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  uint64_t v5 = DiagnosticLogHandleForCategory(10LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
    int v14 = 138412546;
    v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Fast forwarding %@ to %@",  (uint8_t *)&v14,  0x16u);
  }

  v10 = (DADeviceDecoratorWithUI *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  if ((objc_opt_respondsToSelector(v10, a3) & 1) != 0) {
    v11 = v10;
  }
  else {
    v11 = self;
  }
  v12 = v11;

  return v12;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DiagnosticLogHandleForCategory(10LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector((SEL)[v4 selector]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2112;
    int v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Slow forwarding %@ to %@",  (uint8_t *)&v11,  0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  [v4 invokeWithTarget:v10];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DADeviceDecoratorWithUI;
  id v5 = -[DADeviceDecoratorWithUI methodSignatureForSelector:](&v9, "methodSignatureForSelector:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v7 methodSignatureForSelector:a3]);
  }

  return v6;
}

- (BOOL)isKindOfClass:(Class)a3
{
  if ((Class)objc_opt_class(self) == a3)
  {
    char isKindOfClass = 1;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
    char isKindOfClass = objc_opt_isKindOfClass(v5, a3);
  }

  return isKindOfClass & 1;
}

- (void)setViewControllerDelegate:(id)a3
{
  p_viewControllerDelegate = &self->_viewControllerDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_viewControllerDelegate, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI diagnosticsManager](self, "diagnosticsManager"));
  [v6 setViewControllerDelegate:v5];
}

- (void)setVolumeHUDResponder:(id)a3
{
  p_volumeHUDResponder = &self->_volumeHUDResponder;
  id v5 = a3;
  objc_storeWeak((id *)p_volumeHUDResponder, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI diagnosticsManager](self, "diagnosticsManager"));
  [v6 setVolumeHUDResponder:v5];
}

- (void)setBrightnessResponder:(id)a3
{
  p_brightnessResponder = &self->_brightnessResponder;
  id v5 = a3;
  objc_storeWeak((id *)p_brightnessResponder, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI diagnosticsManager](self, "diagnosticsManager"));
  [v6 setBrightnessResponder:v5];
}

- (void)setUserAlertResponder:(id)a3
{
  p_userAlertResponder = &self->_userAlertResponder;
  id v5 = a3;
  objc_storeWeak((id *)p_userAlertResponder, v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI diagnosticsManager](self, "diagnosticsManager"));
  [v6 setUserAlertResponder:v5];
}

- (void)connect
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  [v2 connect];
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI buttonEventMonitor](self, "buttonEventMonitor"));

  if (!v3)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___DSHardwareButtonEventMonitor);
    -[DADeviceDecoratorWithUI setButtonEventMonitor:](self, "setButtonEventMonitor:", v4);
  }

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  [v5 start];
}

- (void)idle
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  [v2 idle];
}

- (void)suspendTests
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  [v2 suspendTests];
}

- (void)resumeTests
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  [v2 resumeTests];
}

- (void)end
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000446C;
  block[3] = &unk_10002C820;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)requestSuiteStart:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  char v8 = objc_opt_respondsToSelector(v7, "requestSuiteStart:completionHandler:");

  if ((v8 & 1) != 0)
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
    [v9 requestSuiteStart:v10 completionHandler:v6];
  }
}

- (void)requestSuiteFinishWithCompletionHandler:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
  char v5 = objc_opt_respondsToSelector(v4, "requestSuiteFinishWithCompletionHandler:");

  if ((v5 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI original](self, "original"));
    [v6 requestSuiteFinishWithCompletionHandler:v7];
  }
}

- (void)executeTestWithTestAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = DiagnosticLogHandleForCategory(10LL);
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[DADeviceDecoratorWithUI executeTestWithTestAttributes:parameters:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI delegate](self, "delegate"));
  int v14 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  unsigned int v15 = [v8 isHeadless];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000047B4;
  v19[3] = &unk_10002C870;
  objc_copyWeak(&v24, (id *)buf);
  id v16 = v8;
  id v20 = v16;
  v21 = self;
  id v17 = v9;
  id v22 = v17;
  id v18 = v10;
  id v23 = v18;
  [v13 device:self shouldStartTestWithTestId:v14 fullscreen:v15 ^ 1 response:v19];

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

- (void)testViewPresented:(id)a3
{
}

- (void)handleButtonEvent:(unint64_t)a3
{
  if (!-[DADeviceDecoratorWithUI ignoreButtonEvents](self, "ignoreButtonEvents"))
  {
    if ((uint64_t)a3 >= 0x8000)
    {
      if ((uint64_t)a3 >= 0x200000)
      {
        if ((uint64_t)a3 > 0x7FFFFFF)
        {
          if (a3 == 0x20000000) {
            goto LABEL_25;
          }
          uint64_t v5 = 0x8000000LL;
        }

        else
        {
          if (a3 == 0x200000) {
            goto LABEL_25;
          }
          uint64_t v5 = 0x2000000LL;
        }

        if (a3 != v5) {
          return;
        }
LABEL_25:
        objc_initWeak(&location, self);
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100004B5C;
        block[3] = &unk_10002C8C0;
        block[4] = self;
        objc_copyWeak(&v9, &location);
        dispatch_async(v7, block);

        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
        return;
      }

      if (a3 == 0x8000 || a3 == 0x20000 || a3 == 0x80000) {
        goto LABEL_25;
      }
    }

    else
    {
      if ((uint64_t)a3 <= 127)
      {
        if (a3 > 0x20 || ((1LL << a3) & 0x100000114LL) == 0) {
          return;
        }
        goto LABEL_25;
      }

      if ((uint64_t)a3 > 2047)
      {
        if (a3 == 2048 || a3 == 0x2000) {
          goto LABEL_25;
        }
      }

      else if (a3 == 128 || a3 == 512)
      {
        goto LABEL_25;
      }
    }
  }

- (void)_startInterceptingButtonEvents
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI buttonEventMonitor](self, "buttonEventMonitor"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100004D44;
  v4[3] = &unk_10002C898;
  objc_copyWeak(&v5, &location);
  [v3 startWithPriority:26 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_reset
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI buttonEventMonitor](self, "buttonEventMonitor"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 removeObserver:self name:@"com.apple.Diagnostics.DKViewControllerPresented" object:0];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceDecoratorWithUI buttonEventMonitor](self, "buttonEventMonitor"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100004E64;
    v6[3] = &unk_10002C820;
    v6[4] = self;
    [v5 stopWithCompletion:v6];
  }

- (DKVolumeHUDResponder)volumeHUDResponder
{
  return (DKVolumeHUDResponder *)objc_loadWeakRetained((id *)&self->_volumeHUDResponder);
}

- (DKBrightnessResponder)brightnessResponder
{
  return (DKBrightnessResponder *)objc_loadWeakRetained((id *)&self->_brightnessResponder);
}

- (DKUserAlertResponder)userAlertResponder
{
  return (DKUserAlertResponder *)objc_loadWeakRetained((id *)&self->_userAlertResponder);
}

- (DKViewControllerDelegate)viewControllerDelegate
{
  return (DKViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_viewControllerDelegate);
}

- (float)originalScreenBrightness
{
  return self->_originalScreenBrightness;
}

- (void)setOriginalScreenBrightness:(float)a3
{
  self->_originalScreenBrightness = a3;
}

- (DSHardwareButtonEventMonitor)buttonEventMonitor
{
  return self->_buttonEventMonitor;
}

- (void)setButtonEventMonitor:(id)a3
{
}

- (DADeviceMaterialized)original
{
  return self->_original;
}

- (void)setOriginal:(id)a3
{
}

- (BOOL)ignoreButtonEvents
{
  return self->_ignoreButtonEvents;
}

- (void)setIgnoreButtonEvents:(BOOL)a3
{
  self->_ignoreButtonEvents = a3;
}

- (void).cxx_destruct
{
}

@end