@interface NEAgentAppPushExtension
- (NSXPCInterface)driverInterface;
- (NSXPCInterface)managerInterface;
- (void)didReceiveIncomingCallWithUserInfo:(id)a3;
- (void)didReceivePushToTalkMessageWithUserInfo:(id)a3;
- (void)handleAppsUninstalled:(id)a3;
- (void)handleAppsUpdateBegins:(id)a3;
- (void)handleAppsUpdateEnding:(id)a3;
- (void)handleAppsUpdateEnds:(id)a3;
- (void)handleCancel;
- (void)sendExtensionFailed;
- (void)sendOutgoingCallMessage:(id)a3 andMessageID:(id)a4;
- (void)sendTimerEvent;
- (void)setProviderConfiguration:(id)a3;
- (void)startConnectionWithProviderConfig:(id)a3;
- (void)stopWithReason:(int)a3;
@end

@implementation NEAgentAppPushExtension

- (NSXPCInterface)managerInterface
{
  if (qword_10000DA48 != -1) {
    dispatch_once(&qword_10000DA48, &stru_100008260);
  }
  return (NSXPCInterface *)(id)qword_10000DA40;
}

- (NSXPCInterface)driverInterface
{
  if (qword_10000DA58 != -1) {
    dispatch_once(&qword_10000DA58, &stru_100008280);
  }
  return (NSXPCInterface *)(id)qword_10000DA50;
}

- (void)handleCancel
{
}

- (void)handleAppsUninstalled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
    unsigned int v8 = [v4 containsObject:v7];

    if (v8)
    {
      uint64_t v9 = ne_log_obj();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        int v12 = 138412546;
        v13 = self;
        __int16 v14 = 2112;
        v15 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@ extension [%@] was uninstalled",  (uint8_t *)&v12,  0x16u);
      }

      sub_1000039E8(self, 0LL);
    }
  }
}

- (void)handleAppsUpdateBegins:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
    unsigned int v8 = [v4 containsObject:v7];

    if (v8)
    {
      uint64_t v9 = ne_log_obj();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        int v12 = 138412546;
        v13 = self;
        __int16 v14 = 2112;
        v15 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@ update for extension [%@] started",  (uint8_t *)&v12,  0x16u);
      }

      sub_1000039E8(self, 1LL);
    }
  }
}

- (void)handleAppsUpdateEnding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
    unsigned int v8 = [v4 containsObject:v7];

    if (v8)
    {
      uint64_t v9 = ne_log_obj();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        int v12 = 138412546;
        v13 = self;
        __int16 v14 = 2112;
        v15 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%@ update for extension [%@] is in progress",  (uint8_t *)&v12,  0x16u);
      }

      sub_1000039E8(self, 1LL);
    }
  }
}

- (void)handleAppsUpdateEnds:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
    unsigned int v8 = [v4 containsObject:v7];

    if (v8)
    {
      uint64_t v9 = ne_log_obj();
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        int v12 = 138412546;
        v13 = self;
        __int16 v14 = 2112;
        v15 = v11;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%@ update for extension [%@] completed",  (uint8_t *)&v12,  0x16u);
      }

      sub_1000039E8(self, 2LL);
    }
  }
}

- (void)didReceiveIncomingCallWithUserInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ne_log_obj();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%@ received incoming call with user info %@",  (uint8_t *)&v10,  0x16u);
  }

  if (self)
  {
    id v7 = v4;
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension managerObjectFactory](self, "managerObjectFactory"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 managerObject]);

    [v9 reportIncomingCall:v7];
  }
}

- (void)didReceivePushToTalkMessageWithUserInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = ne_log_obj();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%@ received PushToTalk message with user info %@",  (uint8_t *)&v10,  0x16u);
  }

  if (self)
  {
    id v7 = v4;
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension managerObjectFactory](self, "managerObjectFactory"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 managerObject]);

    [v9 reportPushToTalkMessage:v7];
  }
}

- (void)startConnectionWithProviderConfig:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension sessionContext](self, "sessionContext"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000389C;
  v6[3] = &unk_1000082A8;
  v6[4] = self;
  [v5 startConnectionWithProviderConfig:v4 completionHandler:v6];
}

- (void)stopWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension sessionContext](self, "sessionContext"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000037C4;
  v6[3] = &unk_100008338;
  v6[4] = self;
  [v5 stopWithReason:v3 completionHandler:v6];
}

- (void)setProviderConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension sessionContext](self, "sessionContext"));
  [v5 setProviderConfiguration:v4];
}

- (void)sendOutgoingCallMessage:(id)a3 andMessageID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension sessionContext](self, "sessionContext"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000365C;
  v10[3] = &unk_1000082D0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 sendOutgoingCallMessage:v7 completionHandler:v10];
}

- (void)sendTimerEvent
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension sessionContext](self, "sessionContext"));
  [v2 sendTimerEvent];
}

- (void)sendExtensionFailed
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension managerObjectFactory](self, "managerObjectFactory"));
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 managerObject]);

  [v3 sendExtensionFailed];
}

@end