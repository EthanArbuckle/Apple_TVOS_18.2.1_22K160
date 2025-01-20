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
  if (qword_1000CFB80 != -1) {
    dispatch_once(&qword_1000CFB80, &stru_1000BD408);
  }
  return (NSXPCInterface *)(id)qword_1000CFB78;
}

- (NSXPCInterface)driverInterface
{
  if (qword_1000CFB90 != -1) {
    dispatch_once(&qword_1000CFB90, &stru_1000BD428);
  }
  return (NSXPCInterface *)(id)qword_1000CFB88;
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
      uint64_t v11 = ne_log_obj(v9, v10);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        int v14 = 138412546;
        v15 = self;
        __int16 v16 = 2112;
        v17 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%@ extension [%@] was uninstalled",  (uint8_t *)&v14,  0x16u);
      }

      sub_100004CBC(self, 0LL);
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
      uint64_t v11 = ne_log_obj(v9, v10);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        int v14 = 138412546;
        v15 = self;
        __int16 v16 = 2112;
        v17 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%@ update for extension [%@] started",  (uint8_t *)&v14,  0x16u);
      }

      sub_100004CBC(self, 1LL);
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
      uint64_t v11 = ne_log_obj(v9, v10);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        int v14 = 138412546;
        v15 = self;
        __int16 v16 = 2112;
        v17 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%@ update for extension [%@] is in progress",  (uint8_t *)&v14,  0x16u);
      }

      sub_100004CBC(self, 1LL);
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
      uint64_t v11 = ne_log_obj(v9, v10);
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension extensionIdentifier](self, "extensionIdentifier"));
        int v14 = 138412546;
        v15 = self;
        __int16 v16 = 2112;
        v17 = v13;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%@ update for extension [%@] completed",  (uint8_t *)&v14,  0x16u);
      }

      sub_100004CBC(self, 2LL);
    }
  }
}

- (void)didReceiveIncomingCallWithUserInfo:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%@ received incoming call with user info %@",  (uint8_t *)&v11,  0x16u);
  }

  if (self)
  {
    id v8 = v4;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension managerObjectFactory](self, "managerObjectFactory"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 managerObject]);

    [v10 reportIncomingCall:v8];
  }
}

- (void)didReceivePushToTalkMessageWithUserInfo:(id)a3
{
  id v4 = a3;
  uint64_t v6 = ne_log_obj(v4, v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%@ received PushToTalk message with user info %@",  (uint8_t *)&v11,  0x16u);
  }

  if (self)
  {
    id v8 = v4;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension managerObjectFactory](self, "managerObjectFactory"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 managerObject]);

    [v10 reportPushToTalkMessage:v8];
  }
}

- (void)startConnectionWithProviderConfig:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension sessionContext](self, "sessionContext"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100004B70;
  v6[3] = &unk_1000BEA88;
  v6[4] = self;
  [v5 startConnectionWithProviderConfig:v4 completionHandler:v6];
}

- (void)stopWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension sessionContext](self, "sessionContext"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100004A98;
  v6[3] = &unk_1000BEC08;
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
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NEAgentAppPushExtension sessionContext](self, "sessionContext"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100004930;
  v10[3] = &unk_1000BD730;
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