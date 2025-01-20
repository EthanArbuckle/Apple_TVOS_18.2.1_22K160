@interface ADCompanionRoutingService
- (ADCompanionRoutingService)init;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (void)_callStateDidChange:(id)a3;
- (void)_handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)_processPendingCallResultBlocks;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)preheatDomain:(id)a3;
@end

@implementation ADCompanionRoutingService

- (ADCompanionRoutingService)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ADCompanionRoutingService;
  v2 = -[ADCompanionRoutingService init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("Companion Routing Service Queue", v4);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    v7 = (objc_class *)objc_opt_class(v2);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[ADService setIdentifier:](v2, "setIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v10 addObserver:v2 selector:"_callStateDidChange:" name:@"ADCallStateDidChangeNotification" object:0];
  }

  return v2;
}

- (id)domains
{
  v3[0] = SASmsGroupIdentifier;
  v3[1] = SAABGroupIdentifier;
  v3[2] = SAReminderGroupIdentifier;
  v3[3] = SAUILGroupIdentifier;
  v3[4] = SAGroupIdentifier;
  v3[5] = SAPhoneGroupIdentifier;
  v3[6] = SACalendarGroupIdentifier;
  v3[7] = SAEmailGroupIdentifier;
  v3[8] = SAStockGroupIdentifier;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  9LL));
}

- (id)commandsForDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SASmsGroupIdentifier])
  {
    v16[0] = SASmsSearchClassIdentifier;
    v16[1] = SADomainObjectCancelClassIdentifier;
    v16[2] = SADomainObjectCommitClassIdentifier;
    v16[3] = SADomainObjectCreateClassIdentifier;
    v16[4] = SADomainObjectUpdateClassIdentifier;
    v16[5] = SASmsGroupSearchClassIdentifier;
    v16[6] = SASmsRecipientSearchClassIdentifier;
    v16[7] = SADomainObjectRetrieveClassIdentifier;
    v4 = v16;
LABEL_7:
    uint64_t v5 = 8LL;
    goto LABEL_8;
  }

  if ([v3 isEqualToString:SAABGroupIdentifier])
  {
    v15[0] = SADomainObjectCancelClassIdentifier;
    v15[1] = SADomainObjectCommitClassIdentifier;
    v15[2] = SADomainObjectUpdateClassIdentifier;
    v15[3] = SADomainObjectRetrieveClassIdentifier;
    v15[4] = SADomainObjectPunchOutClassIdentifier;
    v15[5] = SAABPersonSearchClassIdentifier;
    v15[6] = SAABMultiPersonSearchClassIdentifier;
    v4 = v15;
    uint64_t v5 = 7LL;
    goto LABEL_8;
  }

  if ([v3 isEqualToString:SAReminderGroupIdentifier])
  {
    v14[0] = SAReminderSearchClassIdentifier;
    v14[1] = SAReminderSnoozeClassIdentifier;
    v14[2] = SAReminderListSearchClassIdentifier;
    v14[3] = SADomainObjectCommitClassIdentifier;
    v14[4] = SADomainObjectCreateClassIdentifier;
    v14[5] = SADomainObjectDeleteClassIdentifier;
    v14[6] = SADomainObjectUpdateClassIdentifier;
    v14[7] = SADomainObjectRetrieveClassIdentifier;
    v4 = v14;
    goto LABEL_7;
  }

  if ([v3 isEqualToString:SAUILGroupIdentifier])
  {
    uint64_t v13 = SAUILParseExpressionsClassIdentifier;
    v4 = &v13;
LABEL_14:
    uint64_t v5 = 1LL;
    goto LABEL_8;
  }

  if ([v3 isEqualToString:SAGroupIdentifier])
  {
    uint64_t v12 = SAAcknowledgeAlertClassIdentifier;
    v4 = &v12;
    goto LABEL_14;
  }

  if ([v3 isEqualToString:SAPhoneGroupIdentifier])
  {
    v11[0] = SAPhoneCallClassIdentifier;
    v11[1] = SAPhoneSearchClassIdentifier;
    v4 = v11;
  }

  else
  {
    if ([v3 isEqualToString:SACalendarGroupIdentifier])
    {
      v10[0] = SADomainObjectDeleteClassIdentifier;
      v10[1] = SADomainObjectCommitClassIdentifier;
      v10[2] = SADomainObjectRetrieveClassIdentifier;
      v10[3] = SACalendarEventSearchClassIdentifier;
      v10[4] = SACalendarDefaultSourceGetClassIdentifier;
      v4 = v10;
      uint64_t v5 = 5LL;
      goto LABEL_8;
    }

    if ([v3 isEqualToString:SAEmailGroupIdentifier])
    {
      v9[0] = SADomainObjectCreateClassIdentifier;
      v9[1] = SADomainObjectCommitClassIdentifier;
      v9[2] = SADomainObjectRetrieveClassIdentifier;
      v9[3] = SAEmailSearchClassIdentifier;
      v4 = v9;
      uint64_t v5 = 4LL;
      goto LABEL_8;
    }

    if (![v3 isEqualToString:SAStockGroupIdentifier])
    {
      v6 = 0LL;
      goto LABEL_9;
    }

    v8[0] = SAStockAddClassIdentifier;
    v8[1] = SAStockSearchClassIdentifier;
    v4 = v8;
  }

  uint64_t v5 = 2LL;
LABEL_8:
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, v5));
LABEL_9:

  return v6;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return 1;
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100086E24;
  block[3] = &unk_1004FCBB0;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(serialQueue, block);
}

- (void)_handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v15 = v14;
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 encodedClassName]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 groupIdentifier]);
    *(_DWORD *)buf = 136315650;
    v31 = "-[ADCompanionRoutingService _handleCommand:forDomain:executionContext:reply:]";
    __int16 v32 = 2112;
    v33 = v16;
    __int16 v34 = 2112;
    v35 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_INFO,  "%s Dispatching command (%@) for domain (%@)",  buf,  0x20u);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v10 encodedClassName]);
  unsigned int v19 = [v18 isEqualToString:SAPhoneCallClassIdentifier];
  char v20 = v19;
  if (!v19)
  {
    if ([v18 isEqualToString:SAUILParseExpressionsClassIdentifier])
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v10 targetDevice]);
      v24 = (SACommandFailed *)objc_claimAutoreleasedReturnValue([v25 assistantId]);

LABEL_10:
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1000869E8;
      v27[3] = &unk_1004EF578;
      v27[4] = self;
      id v28 = v13;
      char v29 = v20;
      objc_msgSend( v26,  "_remoteExecute_remoteDeviceExecuteCommand:onDeviceForAssistantId:executionContext:completion:",  v10,  v24,  v12,  v27);

      goto LABEL_11;
    }

- (void)preheatDomain:(id)a3
{
  id v3 = a3;
  v4 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    id v17 = "-[ADCompanionRoutingService preheatDomain:]";
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s preheating companion service domain: %@",  (uint8_t *)&v16,  0x16u);
  }

  if (qword_100577B50 == -1)
  {
    if (!v3) {
      goto LABEL_10;
    }
  }

  else
  {
    dispatch_once(&qword_100577B50, &stru_1004EF598);
    if (!v3) {
      goto LABEL_10;
    }
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue([(id)qword_100577B48 objectForKeyedSubscript:v3]);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_alloc_init(&OBJC_CLASS___SAAceDomainSignal);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);

    -[SAAceDomainSignal setAceId:](v7, "setAceId:", v9);
    -[SAAceDomainSignal setDomain:](v7, "setDomain:", v6);
    id v10 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v11 = v10;
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SAAceDomainSignal encodedClassName](v7, "encodedClassName"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SAAceDomainSignal groupIdentifier](v7, "groupIdentifier"));
      int v16 = 136315650;
      id v17 = "-[ADCompanionRoutingService preheatDomain:]";
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Dispatching command (%@) for domain (%@)",  (uint8_t *)&v16,  0x20u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    objc_msgSend( v14,  "_remoteExecute_remoteDeviceExecuteCommand:executionContext:completion:",  v7,  0,  &stru_1004EF5B8);

    goto LABEL_12;
  }

- (void)_callStateDidChange:(id)a3
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100086758;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_processPendingCallResultBlocks
{
  id v3 = -[NSMutableArray count](self->_pendingCallResultBlocks, "count");
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v18 = "-[ADCompanionRoutingService _processPendingCallResultBlocks]";
      __int16 v19 = 2048;
      id v20 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Processing %ld pending Call result(s)",  buf,  0x16u);
    }

    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    v6 = self->_pendingCallResultBlocks;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8LL * (void)v10) + 16LL))(*(void *)(*((void *)&v12 + 1) + 8LL * (void)v10));
          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      }

      while (v8);
    }

    pendingCallResultBlocks = self->_pendingCallResultBlocks;
    self->_pendingCallResultBlocks = 0LL;
  }

- (void).cxx_destruct
{
}

@end