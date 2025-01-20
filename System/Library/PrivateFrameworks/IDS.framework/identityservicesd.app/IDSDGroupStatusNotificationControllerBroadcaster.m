@interface IDSDGroupStatusNotificationControllerBroadcaster
- (void)broadcastGroupSessionParticipantDataUpdate:(id)a3 onTopic:(id)a4 toURI:(id)a5 fromURI:(id)a6;
- (void)broadcastGroupSessionParticipantUpdate:(id)a3 onTopic:(id)a4 toURI:(id)a5 fromURI:(id)a6 context:(id)a7;
@end

@implementation IDSDGroupStatusNotificationControllerBroadcaster

- (void)broadcastGroupSessionParticipantUpdate:(id)a3 onTopic:(id)a4 toURI:(id)a5 fromURI:(id)a6 context:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = OSLogHandleForTransportCategory("GroupStatusNotificationController");
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v36 = v12;
    __int16 v37 = 2112;
    id v38 = v11;
    __int16 v39 = 2112;
    id v40 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Broadcasting receivedGroupSessionParticipantUpdate:forTopic: {topic: %@, update: %@, context: %@}",  buf,  0x20u);
  }

  uint64_t v19 = os_log_shim_legacy_logging_enabled(v18);
  if ((_DWORD)v19)
  {
    if (_IDSShouldLogTransport(v19))
    {
      _IDSLogTransport( @"GroupStatusNotificationController",  @"IDS",  @"Broadcasting receivedGroupSessionParticipantUpdate:forTopic: {topic: %@, update: %@, context: %@}");
      if (_IDSShouldLog(0LL, @"GroupStatusNotificationController")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"Broadcasting receivedGroupSessionParticipantUpdate:forTopic: {topic: %@, update: %@, context: %@}");
      }
    }
  }

  v20 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
  -[IMMessageContext setShouldBoost:](v20, "setShouldBoost:", 1LL);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_1000CCC98;
  v29[3] = &unk_1008F95A0;
  id v30 = v11;
  id v31 = v12;
  id v32 = v13;
  id v33 = v14;
  id v34 = v15;
  uint64_t v22 = kIDSSessionEntitlement;
  uint64_t v23 = kIDSListenerCapConsumesLaunchOnDemandGroupSessionParticipantUpdates;
  id v24 = v15;
  id v25 = v14;
  id v26 = v13;
  id v27 = v12;
  id v28 = v11;
  [v21 enqueueBroadcast:v29 forTopic:v27 entitlement:v22 command:0 capabilities:v23 messageContext:v20];
}

- (void)broadcastGroupSessionParticipantDataUpdate:(id)a3 onTopic:(id)a4 toURI:(id)a5 fromURI:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = OSLogHandleForTransportCategory("GroupStatusNotificationController");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v10;
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Broadcasting receivedGroupSessionParticipantDataUpdate:forTopic: {topic: %@, update: %@}",  buf,  0x16u);
  }

  uint64_t v16 = os_log_shim_legacy_logging_enabled(v15);
  if ((_DWORD)v16)
  {
    if (_IDSShouldLogTransport(v16))
    {
      _IDSLogTransport( @"GroupStatusNotificationController",  @"IDS",  @"Broadcasting receivedGroupSessionParticipantDataUpdate:forTopic: {topic: %@, update: %@}");
      if (_IDSShouldLog(0LL, @"GroupStatusNotificationController")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"GroupStatusNotificationController",  @"Broadcasting receivedGroupSessionParticipantDataUpdate:forTopic: {topic: %@, update: %@}");
      }
    }
  }

  v17 = objc_alloc_init(&OBJC_CLASS___IMMessageContext);
  -[IMMessageContext setShouldBoost:](v17, "setShouldBoost:", 1LL);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[IDSDaemon sharedInstance](&OBJC_CLASS___IDSDaemon, "sharedInstance"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000CD07C;
  v25[3] = &unk_1008F95C8;
  id v26 = v9;
  id v27 = v10;
  id v28 = v11;
  id v29 = v12;
  uint64_t v19 = kIDSSessionEntitlement;
  uint64_t v20 = kIDSListenerCapConsumesLaunchOnDemandGroupSessionParticipantUpdates;
  id v21 = v12;
  id v22 = v11;
  id v23 = v10;
  id v24 = v9;
  [v18 enqueueBroadcast:v25 forTopic:v23 entitlement:v19 command:0 capabilities:v20 messageContext:v17];
}

@end