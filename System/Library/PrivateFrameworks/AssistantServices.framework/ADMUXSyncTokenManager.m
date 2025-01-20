@interface ADMUXSyncTokenManager
+ (id)sharedInstance;
- (ADMUXSyncTokenManager)init;
- (id)getSyncTokenForAssistantId:(id)a3 aceHost:(id)a4;
- (void)handleMuxTokenExchangeMessage:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)updateSyncTokenForAssistantId:(id)a3 aceHost:(id)a4 token:(id)a5;
@end

@implementation ADMUXSyncTokenManager

- (ADMUXSyncTokenManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ADMUXSyncTokenManager;
  v2 = -[ADMUXSyncTokenManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    companionSyncTokens = v2->_companionSyncTokens;
    v2->_companionSyncTokens = v3;

    v2->_syncTokenLock._os_unfair_lock_opaque = 0;
  }

  return v2;
}

- (void)updateSyncTokenForAssistantId:(id)a3 aceHost:(id)a4 token:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v11 && v8 && v9)
  {
    os_unfair_lock_lock(&self->_syncTokenLock);
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_companionSyncTokens,  "objectForKey:",  v11));
    if (!v10) {
      v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v9, v8);
    -[NSMutableDictionary setObject:forKey:](self->_companionSyncTokens, "setObject:forKey:", v10, v11);
    os_unfair_lock_unlock(&self->_syncTokenLock);
  }
}

- (id)getSyncTokenForAssistantId:(id)a3 aceHost:(id)a4
{
  id v6 = a4;
  p_syncTokenLock = &self->_syncTokenLock;
  id v8 = a3;
  os_unfair_lock_lock(&self->_syncTokenLock);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_companionSyncTokens, "objectForKey:", v8));

  if (v9) {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v6]);
  }
  else {
    v10 = 0LL;
  }
  os_unfair_lock_unlock(p_syncTokenLock);

  return v10;
}

- (void)handleMuxTokenExchangeMessage:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  id v10 = a4;
  if ((AFDeviceSupportsSiriMUX(v10) & 1) == 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 1010LL));
    v9[2](v9, 0LL, v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"SiriMuxTokenHost"]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"SiriMuxToken"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 assistantIdentifier]);

  v15 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 136315650;
    v21 = "-[ADMUXSyncTokenManager handleMuxTokenExchangeMessage:fromPeer:completion:]";
    __int16 v22 = 2112;
    v23 = v12;
    __int16 v24 = 2112;
    v25 = v14;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s Received token for aceHost: %@ from peer with assistantID: %@",  (uint8_t *)&v20,  0x20u);
  }

  -[ADMUXSyncTokenManager updateSyncTokenForAssistantId:aceHost:token:]( self,  "updateSyncTokenForAssistantId:aceHost:token:",  v14,  v12,  v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"SiriMuxSyncTokenTransferReason"]);
  id v17 = [v16 integerValue];

  v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"SiriMuxEventTimestamp"]);
  +[ADMUXReverseSyncInstrumentationUtil logSyncTokenReceivedWithTransferReason:requestCreatedAt:]( &OBJC_CLASS___ADMUXReverseSyncInstrumentationUtil,  "logSyncTokenReceivedWithTransferReason:requestCreatedAt:",  v17,  v18);
  if (v13 && v14)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v19 postNotificationName:@"ADMUXSyncTokenReceivedNotification" object:v14];
  }

  ((void (**)(id, void *, void *))v9)[2](v9, &__NSDictionary0__struct, 0LL);
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1005782D8 != -1) {
    dispatch_once(&qword_1005782D8, &stru_1004F8AE0);
  }
  return (id)qword_1005782E0;
}

@end