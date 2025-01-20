@interface AXPluginDisplayOnMonitor
- (AXPluginDisplayOnMonitor)init;
- (AXPluginDisplayOnMonitorDelegate)delegate;
- (BOOL)_queryIsDisplayOn;
- (BOOL)isDisplayOn;
- (int)notifyToken;
- (void)_registerForSpringboardNotifications;
- (void)_startMonitoring;
- (void)_stopMonitoring;
- (void)_unregisterForSpringboardNotifications;
- (void)_updateDisplayOnState;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDisplayOn:(BOOL)a3;
- (void)setNotifyToken:(int)a3;
@end

@implementation AXPluginDisplayOnMonitor

- (AXPluginDisplayOnMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AXPluginDisplayOnMonitor;
  v2 = -[AXPluginDisplayOnMonitor init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[AXPluginDisplayOnMonitor setNotifyToken:](v2, "setNotifyToken:", 0xFFFFFFFFLL);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AXPluginDisplayOnMonitor;
  -[AXPluginDisplayOnMonitor dealloc](&v3, "dealloc");
}

- (void)setDelegate:(id)a3
{
  if (a3) {
    -[AXPluginDisplayOnMonitor _startMonitoring](self, "_startMonitoring");
  }
  else {
    -[AXPluginDisplayOnMonitor _stopMonitoring](self, "_stopMonitoring");
  }
}

- (void)_startMonitoring
{
}

- (void)_stopMonitoring
{
}

- (void)setDisplayOn:(BOOL)a3
{
  if (self->_displayOn != a3)
  {
    self->_displayOn = a3;
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[AXPluginDisplayOnMonitor delegate](self, "delegate"));
    objc_msgSend( v4,  "displayOnMonitor:didReceiveDisplayOnStateChanged:",  self,  -[AXPluginDisplayOnMonitor isDisplayOn](self, "isDisplayOn"));
  }

- (void)_updateDisplayOnState
{
}

- (BOOL)_queryIsDisplayOn
{
  uint64_t state = notify_get_state(-[AXPluginDisplayOnMonitor notifyToken](self, "notifyToken"), &state64);
  if ((_DWORD)state) {
    goto LABEL_2;
  }
  if (!state64) {
    return 1;
  }
  if (state64 != 1)
  {
LABEL_2:
    uint64_t v3 = AXLogCommon();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_22A8(state, &state64, v4);
    }

    return 1;
  }

  return 0;
}

- (void)_registerForSpringboardNotifications
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1798;
  v10[3] = &unk_41F0;
  objc_copyWeak(&v11, &location);
  uint64_t v3 = objc_retainBlock(v10);
  id v4 = &_dispatch_main_q;
  uint32_t v5 = notify_register_dispatch("com.apple.springboard.hasBlankedScreen", &out_token, &_dispatch_main_q, v3);

  id v6 = -[AXPluginDisplayOnMonitor setNotifyToken:](self, "setNotifyToken:", out_token);
  if (v5)
  {
    uint64_t v7 = AXLogCommon(v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_2378(v8);
    }
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_unregisterForSpringboardNotifications
{
  if (notify_is_valid_token(-[AXPluginDisplayOnMonitor notifyToken](self, "notifyToken"))) {
    notify_cancel(-[AXPluginDisplayOnMonitor notifyToken](self, "notifyToken"));
  }
  -[AXPluginDisplayOnMonitor setNotifyToken:](self, "setNotifyToken:", 0xFFFFFFFFLL);
}

- (BOOL)isDisplayOn
{
  return self->_displayOn;
}

- (AXPluginDisplayOnMonitorDelegate)delegate
{
  return (AXPluginDisplayOnMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
}

@end