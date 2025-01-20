@interface ADSession
+ (Class)sessionClassForType:(int)a3;
+ (int)_adSessionTypeFromString:(id)a3;
- (ADSessionDelegate)delegate;
- (BOOL)_commandRequiresServerConnection:(id)a3;
- (BOOL)_commandRequiresSync:(id)a3;
- (BOOL)_refIdIsLimboId:(id)a3;
- (BOOL)_shouldSendAssistantData;
- (BOOL)_waitingForAssistantData;
- (BOOL)canHandleRequest;
- (BOOL)dormant;
- (BOOL)hasLoadedAssistant;
- (BOOL)hasResultObjects;
- (BOOL)hasUsefulnessScore;
- (BOOL)sessionIsActive;
- (BOOL)sessionIsAttemptingTryOrRetry;
- (BOOL)sessionRequiresServerConnection;
- (BOOL)sessionRequiresSync;
- (BOOL)supportsSync;
- (NSString)connectionMode;
- (NSString)languageCode;
- (NSString)loggingSharedUserIdentifier;
- (NSString)sharedUserIdentifier;
- (OS_dispatch_queue)queue;
- (id)_account;
- (id)_adSessionTypeString;
- (id)_cachedAssistantData;
- (id)_currentConnectionType;
- (id)_currentSNConnectionType;
- (id)_hubAccount;
- (id)_pendingCommands;
- (id)_requestId;
- (id)_saConnectionType;
- (id)_saSNConnectionType;
- (id)_sendBuffer;
- (id)awdRequestRecord;
- (id)connection;
- (id)currentConnectionPreCachedMetrics;
- (id)currentSNConnectionPreCachedMetrics;
- (id)dequeueResultObjects;
- (id)initOnQueue:(id)a3 withAccount:(id)a4 hubAccount:(id)a5;
- (id)initOnQueue:(id)a3 withAccount:(id)a4 hubAccount:(id)a5 languageCode:(id)a6 connectionMode:(id)a7 sharedUserIdentifier:(id)a8 loggingSharedUserIdentifier:(id)a9 instanceContext:(id)a10;
- (id)sessionId;
- (int)sessionType;
- (int64_t)state;
- (int64_t)usefulnessScore;
- (void)_addLimboId:(id)a3;
- (void)_addPendingCommand:(id)a3;
- (void)_cancelSynchronously:(BOOL)a3;
- (void)_clearLimbo;
- (void)_clearSendBuffer;
- (void)_informDelegateCannotHandleRequest:(id)a3 error:(id)a4;
- (void)_informDelegateOfError:(id)a3;
- (void)_informDelegateWillRetryOnError:(id)a3;
- (void)_passObjectToDelegate:(id)a3;
- (void)_pendDormantCommand:(id)a3;
- (void)_removeLimboId:(id)a3;
- (void)_removeRequestForAssistantData;
- (void)_requestForAssistantData;
- (void)_resetSessionRequiresServerConnection;
- (void)_resetSessionRequiresSync;
- (void)_saGetAssistantData:(id)a3;
- (void)_sendAssistantDataAndPendingCommandsIfNeeded:(id)a3;
- (void)_sendAssistantDataChangedSinceAnchor:(id)a3 refId:(id)a4;
- (void)_sendCommandFailedWithRefId:(id)a3;
- (void)_sendDestroyAssistant;
- (void)_sendLimboCommand:(id)a3;
- (void)_sendPendingCommands;
- (void)_sendPendingDormantCommands;
- (void)_sendServerCommand:(id)a3;
- (void)_sendServerCommands:(id)a3;
- (void)_setAssistantDataAnchorIfNeeded:(id)a3;
- (void)_setCurrentConnectionType:(id)a3;
- (void)_setDormantWithStyle:(int64_t)a3;
- (void)_setPendingAssistantDataAnchor:(id)a3;
- (void)_setRequestId:(id)a3;
- (void)_setSNCurrentConnectionType:(id)a3;
- (void)_setSessionId:(id)a3;
- (void)_setSessionOpened;
- (void)assistantDataManager:(id)a3 didUpdateAssistantData:(id)a4;
- (void)beginUpdatingAssistantData;
- (void)cancel;
- (void)cancelSessionRequest:(id)a3;
- (void)cancelSynchronously;
- (void)dealloc;
- (void)eagerlyFetchAssistantData;
- (void)getConnectionMetrics:(id)a3;
- (void)getSNConnectionMetrics:(id)a3;
- (void)handleCommand:(id)a3;
- (void)preheatAndMakeQuiet:(BOOL)a3;
- (void)prepareForRetry;
- (void)queueResultObjects:(id)a3;
- (void)refreshValidationData;
- (void)resetConnection;
- (void)sendCommand:(id)a3 opportunistically:(BOOL)a4;
- (void)sendCommands:(id)a3 opportunistically:(BOOL)a4;
- (void)setAWDRequestRecord:(id)a3;
- (void)setCanHandleRequest:(BOOL)a3;
- (void)setConnectionMode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDormant:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLoggingSharedUserIdentifier:(id)a3;
- (void)setOrUpdateUsefulnessScore:(id)a3;
- (void)setSessionType:(int)a3;
- (void)setSharedUserIdentifier:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation ADSession

- (id)initOnQueue:(id)a3 withAccount:(id)a4 hubAccount:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADSession;
  v12 = -[ADSession init](&v15, "init");
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeStrong(p_isa + 2, a4);
    [p_isa _resetSessionRequiresServerConnection];
    [p_isa _resetSessionRequiresSync];
    objc_storeStrong(p_isa + 27, a5);
  }

  return p_isa;
}

- (id)initOnQueue:(id)a3 withAccount:(id)a4 hubAccount:(id)a5 languageCode:(id)a6 connectionMode:(id)a7 sharedUserIdentifier:(id)a8 loggingSharedUserIdentifier:(id)a9 instanceContext:(id)a10
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADSession;
  return -[ADSession init](&v11, "init", a3, a4, a5, a6, a7, a8);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___ADSession;
  -[ADSession dealloc](&v2, "dealloc");
}

- (BOOL)supportsSync
{
  return 0;
}

- (void)_setSessionOpened
{
  int64_t v2 = 4LL;
  if (self->_dormant) {
    int64_t v2 = 5LL;
  }
  self->_state = v2;
}

- (id)_pendingCommands
{
  pendingCommands = self->_pendingCommands;
  if (!pendingCommands)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v5 = self->_pendingCommands;
    self->_pendingCommands = v4;

    pendingCommands = self->_pendingCommands;
  }

  return pendingCommands;
}

- (void)_addLimboId:(id)a3
{
  id v4 = a3;
  limboIds = self->_limboIds;
  id v8 = v4;
  if (!limboIds)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v7 = self->_limboIds;
    self->_limboIds = v6;

    id v4 = v8;
    limboIds = self->_limboIds;
  }

  -[NSMutableSet addObject:](limboIds, "addObject:", v4);
}

- (void)_removeLimboId:(id)a3
{
}

- (BOOL)_refIdIsLimboId:(id)a3
{
  return -[NSMutableSet containsObject:](self->_limboIds, "containsObject:", a3);
}

- (void)_addPendingCommand:(id)a3
{
  id v5 = a3;
  if ((objc_msgSend(v5, "siriCore_isProvisional") & 1) == 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _pendingCommands](self, "_pendingCommands"));
    [v4 addObject:v5];
  }
}

- (void)_sendPendingCommands
{
  v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ADSession _sendPendingCommands]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  id v4 = -[NSMutableArray copy](self->_pendingCommands, "copy");
  -[ADSession _sendServerCommands:](self, "_sendServerCommands:", v4);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v9), "aceId", (void)v11));
        -[ADSession _addLimboId:](self, "_addLimboId:", v10);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)_sendAssistantDataAndPendingCommandsIfNeeded:(id)a3
{
  id v5 = a3;
  unsigned int v4 = -[ADSession _shouldSendAssistantData](self, "_shouldSendAssistantData");
  if (v5 && v4 && self->_cachedAssistantData) {
    -[ADSession _sendAssistantDataChangedSinceAnchor:refId:]( self,  "_sendAssistantDataChangedSinceAnchor:refId:",  v5,  0LL);
  }
  if (!-[ADSession _waitingForAssistantData](self, "_waitingForAssistantData")) {
    -[ADSession _sendPendingCommands](self, "_sendPendingCommands");
  }
}

- (void)_sendLimboCommand:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[ADSession _sendLimboCommand:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }

  -[ADSession _sendServerCommand:](self, "_sendServerCommand:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);
  -[ADSession _addLimboId:](self, "_addLimboId:", v6);

  -[ADSession _addPendingCommand:](self, "_addPendingCommand:", v4);
}

- (void)_clearLimbo
{
  limboIds = self->_limboIds;
  self->_limboIds = 0LL;

  pendingCommands = self->_pendingCommands;
  self->_pendingCommands = 0LL;
}

- (id)_sendBuffer
{
  return self->_sendBuffer;
}

- (void)_clearSendBuffer
{
  sendBuffer = self->_sendBuffer;
  self->_sendBuffer = 0LL;
}

- (void)_resetSessionRequiresServerConnection
{
  int v3 = AFDeviceSupportsFullSiriUOD(self, a2);
  self->_sessionRequiresServerConnection = v3 ^ 1;
  id v4 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    id v5 = @"YES";
    if (v3) {
      id v5 = @"NO";
    }
    int v6 = 136315394;
    int v7 = "-[ADSession _resetSessionRequiresServerConnection]";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s _sessionRequiresServerConnection reset to %@",  (uint8_t *)&v6,  0x16u);
  }

- (void)_resetSessionRequiresSync
{
  self->_sessionRequiresSync = 0;
  int64_t v2 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    id v4 = "-[ADSession _resetSessionRequiresSync]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s _sessionRequiresSync reset to NO",  (uint8_t *)&v3,  0xCu);
  }

- (id)_saConnectionType
{
  currentConnectionType = self->_currentConnectionType;
  id v3 = SAConnectionTypeUnknownValue;
  id v4 = -[SiriCoreConnectionType technology](currentConnectionType, "technology");
  switch((unint64_t)v4)
  {
    case 0x7D0uLL:
    case 0x7D4uLL:
    case 0x7D5uLL:
    case 0x7D6uLL:
    case 0x7D7uLL:
    case 0x7D8uLL:
      id v5 = (id *)&SAConnectionTypeCellValue;
      break;
    case 0x7D1uLL:
      id v5 = (id *)&SAConnectionTypeUTRANValue;
      break;
    case 0x7D2uLL:
      id v5 = (id *)&SAConnectionTypeCDMA1xValue;
      break;
    case 0x7D3uLL:
      id v5 = (id *)&SAConnectionTypeLTEValue;
      break;
    case 0x7D9uLL:
    case 0x7DAuLL:
    case 0x7DBuLL:
      id v5 = (id *)&SAConnectionTypeCDMAEVDOValue;
      break;
    case 0x7DCuLL:
      id v5 = (id *)&SAConnectionTypeeHRPDValue;
      break;
    case 0x7DDuLL:
      id v5 = (id *)&SAConnectionTypeNRNSAValue;
      break;
    case 0x7DEuLL:
      id v5 = (id *)&SAConnectionTypeNRValue;
      break;
    default:
      switch((unint64_t)v4)
      {
        case 0xBB8uLL:
        case 0xBBEuLL:
          id v5 = (id *)&SAConnectionTypeMultiPathTCPValue;
          goto LABEL_17;
        case 0xBB9uLL:
          id v5 = (id *)&SAConnectionTypeLedBellyValue;
          goto LABEL_17;
        case 0xBBAuLL:
        case 0xBBCuLL:
          return v3;
        case 0xBBBuLL:
          id v5 = (id *)&SAConnectionTypePOPValue;
          goto LABEL_17;
        case 0xBBDuLL:
          id v5 = (id *)&SAConnectionTypeLocalValue;
          goto LABEL_17;
        default:
          if (v4 != (id)1000) {
            return v3;
          }
          id v5 = (id *)&SAConnectionTypeWifiValue;
          break;
      }

      break;
  }

- (id)_saSNConnectionType
{
  currentSNConnectionType = self->_currentSNConnectionType;
  id v3 = SAConnectionTypeUnknownValue;
  id v4 = -[SNConnectionType technology](currentSNConnectionType, "technology");
  switch((unint64_t)v4)
  {
    case 0x7D0uLL:
    case 0x7D4uLL:
    case 0x7D5uLL:
    case 0x7D6uLL:
    case 0x7D7uLL:
    case 0x7D8uLL:
      id v5 = (id *)&SAConnectionTypeCellValue;
      break;
    case 0x7D1uLL:
      id v5 = (id *)&SAConnectionTypeUTRANValue;
      break;
    case 0x7D2uLL:
      id v5 = (id *)&SAConnectionTypeCDMA1xValue;
      break;
    case 0x7D3uLL:
      id v5 = (id *)&SAConnectionTypeLTEValue;
      break;
    case 0x7D9uLL:
    case 0x7DAuLL:
    case 0x7DBuLL:
      id v5 = (id *)&SAConnectionTypeCDMAEVDOValue;
      break;
    case 0x7DCuLL:
      id v5 = (id *)&SAConnectionTypeeHRPDValue;
      break;
    case 0x7DDuLL:
      id v5 = (id *)&SAConnectionTypeNRNSAValue;
      break;
    case 0x7DEuLL:
      id v5 = (id *)&SAConnectionTypeNRValue;
      break;
    default:
      switch((unint64_t)v4)
      {
        case 0xBB8uLL:
        case 0xBBEuLL:
          id v5 = (id *)&SAConnectionTypeMultiPathTCPValue;
          goto LABEL_17;
        case 0xBB9uLL:
          id v5 = (id *)&SAConnectionTypeLedBellyValue;
          goto LABEL_17;
        case 0xBBAuLL:
        case 0xBBCuLL:
          return v3;
        case 0xBBBuLL:
          id v5 = (id *)&SAConnectionTypePOPValue;
          goto LABEL_17;
        case 0xBBDuLL:
          id v5 = (id *)&SAConnectionTypeLocalValue;
          goto LABEL_17;
        default:
          if (v4 != (id)1000) {
            return v3;
          }
          id v5 = (id *)&SAConnectionTypeWifiValue;
          break;
      }

      break;
  }

- (void)_setSessionId:(id)a3
{
}

- (id)_adSessionTypeString
{
  if (-[ADSession sessionType](self, "sessionType") == 1) {
    return @"remoteLimited";
  }
  else {
    return @"remoteFull";
  }
}

- (void)_setRequestId:(id)a3
{
}

- (id)_requestId
{
  return self->_requestId;
}

- (void)setAWDRequestRecord:(id)a3
{
}

- (id)awdRequestRecord
{
  return self->_awdRequestRecord;
}

- (BOOL)sessionRequiresServerConnection
{
  return self->_sessionRequiresServerConnection;
}

- (BOOL)_commandRequiresServerConnection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SARDExecuteNLOnServer);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___SAStartDirectActionRequest), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    id v6 = (os_log_s *)AFSiriLogContextSession;
    BOOL v7 = 1;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      id v10 = "-[ADSession _commandRequiresServerConnection:]";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)sessionRequiresSync
{
  return self->_sessionRequiresSync;
}

- (BOOL)_commandRequiresSync:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___SASyncGetAnchors);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);
  if ((isKindOfClass & 1) != 0)
  {
    id v6 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      int v9 = "-[ADSession _commandRequiresSync:]";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
    }
  }

  return isKindOfClass & 1;
}

- (void)_passObjectToDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained assistantSession:self receivedCommand:v5];
}

- (void)_informDelegateOfError:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained assistantSession:self receivedError:v5 isRetryableError:0];
}

- (void)_informDelegateWillRetryOnError:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained assistantSession:self willRetryOnError:v5];
}

- (void)_informDelegateCannotHandleRequest:(id)a3 error:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained assistantSession:self cannotHandleRequest:v8 error:v7];
}

- (void)_sendServerCommand:(id)a3
{
  id v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    id v5 = "-[ADSession _sendServerCommand:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Shouldn't reach this method",  (uint8_t *)&v4,  0xCu);
  }

- (void)_sendServerCommands:(id)a3
{
  id v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    id v5 = "-[ADSession _sendServerCommands:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s Shouldn't reach this method",  (uint8_t *)&v4,  0xCu);
  }

- (void)_sendCommandFailedWithRefId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  -[SACommandFailed setRefId:](v5, "setRefId:", v4);

  -[ADSession _sendServerCommand:](self, "_sendServerCommand:", v5);
}

- (void)_sendDestroyAssistant
{
  id v4 = objc_alloc_init(&OBJC_CLASS___SADestroyAssistant);
  -[ADSession _sendServerCommand:](self, "_sendServerCommand:", v4);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](&OBJC_CLASS___AFPreferences, "sharedPreferences"));
  [v3 setTLSSessionTicketsFlushPending:1];

  self->_state = 10LL;
}

- (id)_cachedAssistantData
{
  return self->_cachedAssistantData;
}

- (void)_setPendingAssistantDataAnchor:(id)a3
{
}

- (BOOL)_shouldSendAssistantData
{
  return self->_shouldSendAssistantData;
}

- (BOOL)_waitingForAssistantData
{
  if (self->_cachedAssistantData) {
    return 0;
  }
  else {
    return -[ADSession _shouldSendAssistantData](self, "_shouldSendAssistantData");
  }
}

- (void)_requestForAssistantData
{
  if (!self->_assistantDataRequested)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[ADAssistantDataManager sharedDataManager](&OBJC_CLASS___ADAssistantDataManager, "sharedDataManager"));
    [v3 addObserver:self];
    [v3 requestAssistantDataUpdateHighPriority:1];
    self->_assistantDataRequested = 1;
  }

- (void)_removeRequestForAssistantData
{
  if (self->_assistantDataRequested)
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(+[ADAssistantDataManager sharedDataManager](&OBJC_CLASS___ADAssistantDataManager, "sharedDataManager"));
    [v3 removeObserver:self];
    self->_assistantDataRequested = 0;
  }

- (void)_sendAssistantDataChangedSinceAnchor:(id)a3 refId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_languageCode;
  if ((AFPreferencesLanguageIsSupported(v8) & 1) == 0)
  {
    int v9 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      v19 = "-[ADSession _sendAssistantDataChangedSinceAnchor:refId:]";
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Unsupported language code %@, but sending SAD anyway",  (uint8_t *)&v18,  0x16u);
    }
  }

  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _cachedAssistantData](self, "_cachedAssistantData"));
  id v11 = (NSString *)objc_claimAutoreleasedReturnValue([v10 anchor]);
  id v12 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    v19 = "-[ADSession _sendAssistantDataChangedSinceAnchor:refId:]";
    __int16 v20 = 2112;
    v21 = v11;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s generated setAssistantData anchor %@ (previous anchor %@)",  (uint8_t *)&v18,  0x20u);
  }

  unsigned __int8 v13 = [v6 isEqualToString:v11];
  if (v7 || (v13 & 1) == 0)
  {
    [v10 setRefId:v7];
    -[ADSession _sendServerCommand:](self, "_sendServerCommand:", v10);
    if (self->_state == 11)
    {
      objc_super v15 = self->_account;
      -[ADAccount setLastAssistantDataAnchor:](v15, "setLastAssistantDataAnchor:", v11);
      -[ADAccount save](v15, "save");
    }

    else
    {
      v16 = (NSString *)-[NSString copy](v11, "copy");
      pendingAssistantDataAnchor = self->_pendingAssistantDataAnchor;
      self->_pendingAssistantDataAnchor = v16;
    }
  }

  else
  {
    __int128 v14 = (os_log_s *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      v19 = "-[ADSession _sendAssistantDataChangedSinceAnchor:refId:]";
      __int16 v20 = 2112;
      v21 = (NSString *)v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Assistant Data matches, not sending %@",  (uint8_t *)&v18,  0x16u);
    }
  }
}

- (void)assistantDataManager:(id)a3 didUpdateAssistantData:(id)a4
{
  id v5 = objc_msgSend(a4, "copy", a3);
  queue = (dispatch_queue_s *)self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100229218;
  v8[3] = &unk_1004FD968;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_setAssistantDataAnchorIfNeeded:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[ADSession _waitingForAssistantData](self, "_waitingForAssistantData");
  id v6 = (os_log_s *)AFSiriLogContextSession;
  BOOL v7 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v16 = 136315138;
      v17 = "-[ADSession _setAssistantDataAnchorIfNeeded:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Still waiting on SAD, postponing clearing limbo.",  (uint8_t *)&v16,  0xCu);
    }
  }

  else
  {
    if (v7)
    {
      int v16 = 136315138;
      v17 = "-[ADSession _setAssistantDataAnchorIfNeeded:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s Not waiting on SAD, clearing limbo now.",  (uint8_t *)&v16,  0xCu);
    }

    -[ADSession _clearLimbo](self, "_clearLimbo");
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 dataAnchor]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADSession _account](self, "_account"));
  __int16 v10 = v9;
  if (self->_pendingAssistantDataAnchor)
  {
    objc_msgSend(v9, "setLastAssistantDataAnchor:");
    [v10 save];
    pendingAssistantDataAnchor = self->_pendingAssistantDataAnchor;
    self->_pendingAssistantDataAnchor = 0LL;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 lastAssistantDataAnchor]);
    if ([v8 isEqualToString:v12])
    {
    }

    else
    {
      unsigned int v13 = -[ADSession _shouldSendAssistantData](self, "_shouldSendAssistantData");

      if (v13 && self->_cachedAssistantData) {
        -[ADSession _sendAssistantDataChangedSinceAnchor:refId:]( self,  "_sendAssistantDataChangedSinceAnchor:refId:",  v8,  0LL);
      }
    }

    [v10 setLastAssistantDataAnchor:v8];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v4 requestSync]);
  objc_msgSend(WeakRetained, "assistantSession:didLoadAssistantSyncRequested:", self, objc_msgSend(v15, "BOOLValue"));
}

- (void)_saGetAssistantData:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 aceId]);
  id obj = [v4 copy];

  if (self->_cachedAssistantData) {
    -[ADSession _sendAssistantDataChangedSinceAnchor:refId:]( self,  "_sendAssistantDataChangedSinceAnchor:refId:",  0LL,  obj);
  }
  else {
    objc_storeStrong((id *)&self->_assistantDataRefId, obj);
  }
}

- (void)_pendDormantCommand:(id)a3
{
  id v4 = a3;
  dormantQueue = self->_dormantQueue;
  id v8 = v4;
  if (!dormantQueue)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    BOOL v7 = self->_dormantQueue;
    self->_dormantQueue = v6;

    id v4 = v8;
    dormantQueue = self->_dormantQueue;
  }

  -[NSMutableArray addObject:](dormantQueue, "addObject:", v4);
}

- (void)_sendPendingDormantCommands
{
  id v3 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    id v4 = v3;
    int v7 = 136315394;
    id v8 = "-[ADSession _sendPendingDormantCommands]";
    __int16 v9 = 1024;
    unsigned int v10 = -[ADSession sessionType](self, "sessionType");
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "%s Sending pending dormant commands now that the session is no longer dormant for session %d",  (uint8_t *)&v7,  0x12u);
  }

  dormantQueue = self->_dormantQueue;
  self->_dormantQueue = 0LL;
  id v6 = dormantQueue;

  -[ADSession sendCommands:opportunistically:](self, "sendCommands:opportunistically:", v6, 0LL);
}

- (void)_setDormantWithStyle:(int64_t)a3
{
  BOOL v3 = a3 != 0;
  if (self->_dormant != v3)
  {
    id v6 = (void *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v7 = v6;
      unsigned int v8 = -[ADSession sessionType](self, "sessionType");
      __int16 v9 = @"active";
      *(void *)&v10[4] = "-[ADSession _setDormantWithStyle:]";
      *(_DWORD *)unsigned int v10 = 136315650;
      if (a3) {
        __int16 v9 = @"dormant";
      }
      *(_WORD *)&v10[12] = 1024;
      *(_DWORD *)&v10[14] = v8;
      __int16 v11 = 2112;
      id v12 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Setting dormant state for session %d to %@",  v10,  0x1Cu);
    }

    self->_dormant = v3;
    if (a3)
    {
      if (a3 == 2) {
        -[ADSession _forceFastDormancy](self, "_forceFastDormancy");
      }
      -[ADSession _releaseDormancySuspension](self, "_releaseDormancySuspension", *(_OWORD *)v10);
    }

    else
    {
      -[ADSession _sendPendingDormantCommands](self, "_sendPendingDormantCommands");
    }
  }

- (void)preheatAndMakeQuiet:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    int v11 = 136315394;
    id v12 = "-[ADSession preheatAndMakeQuiet:]";
    __int16 v13 = 2112;
    __int128 v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  int64_t state = self->_state;
  if (!state)
  {
    -[ADSession _startConnection](self, "_startConnection");
    if (!v3) {
      return;
    }
    __int16 v9 = self;
    uint64_t v10 = 1LL;
    goto LABEL_9;
  }

  if (self->_dormant && !v3)
  {
    __int16 v9 = self;
    uint64_t v10 = 0LL;
LABEL_9:
    -[ADSession _setDormantWithStyle:](v9, "_setDormantWithStyle:", v10);
    return;
  }

  if (state >= 11 && !v3) {
    -[ADSession _probeSessionIfIdle](self, "_probeSessionIfIdle");
  }
}

- (void)eagerlyFetchAssistantData
{
  int64_t v2 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    unsigned int v5 = "-[ADSession eagerlyFetchAssistantData]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[ADAssistantDataManager sharedDataManager](&OBJC_CLASS___ADAssistantDataManager, "sharedDataManager"));
  [v3 requestAssistantDataUpdateHighPriority:0];
}

- (void)beginUpdatingAssistantData
{
  if (!self->_shouldSendAssistantData)
  {
    self->_shouldSendAssistantData = 1;
    int64_t state = self->_state;
    if (state >= 8)
    {
      if (self->_cachedAssistantData)
      {
        if (state == 8) {
          uint64_t v4 = 0LL;
        }
        else {
          uint64_t v4 = objc_claimAutoreleasedReturnValue(-[ADAccount lastAssistantDataAnchor](self->_account, "lastAssistantDataAnchor"));
        }
        id v5 = (id)v4;
        -[ADSession _sendAssistantDataChangedSinceAnchor:refId:]( self,  "_sendAssistantDataChangedSinceAnchor:refId:",  v4,  0LL);
      }
    }
  }

- (void)refreshValidationData
{
  BOOL v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSession refreshValidationData]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[ADSession _setDormantWithStyle:](self, "_setDormantWithStyle:", 0LL);
}

- (void)setCanHandleRequest:(BOOL)a3
{
  self->_canHandleRequest = a3;
}

- (BOOL)canHandleRequest
{
  return self->_canHandleRequest;
}

- (void)sendCommand:(id)a3 opportunistically:(BOOL)a4
{
  id v6 = a3;
  int v7 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    v19 = "-[ADSession sendCommand:opportunistically:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v18, 0x16u);
  }

  if (v6)
  {
    if (self->_dormant)
    {
      unsigned int v8 = (void *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        __int16 v9 = v8;
        unsigned int v10 = -[ADSession sessionType](self, "sessionType");
        int v18 = 136315394;
        v19 = "-[ADSession sendCommand:opportunistically:]";
        __int16 v20 = 1024;
        LODWORD(v21) = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Pending command because session is dormant for %d",  (uint8_t *)&v18,  0x12u);
      }

      -[ADSession _pendDormantCommand:](self, "_pendDormantCommand:", v6);
      if (!a4)
      {
        int v11 = (os_log_s *)AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          int v18 = 136315138;
          v19 = "-[ADSession sendCommand:opportunistically:]";
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Waking up dormant session because inopportunistic command needs to be sent.",  (uint8_t *)&v18,  0xCu);
        }

        -[ADSession _setDormantWithStyle:](self, "_setDormantWithStyle:", 0LL);
      }

      goto LABEL_32;
    }

    if (-[ADSession _commandRequiresServerConnection:](self, "_commandRequiresServerConnection:", v6))
    {
      id v12 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        v19 = "-[ADSession sendCommand:opportunistically:]";
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s _sessionRequiresServerConnection set to YES",  (uint8_t *)&v18,  0xCu);
      }

      self->_sessionRequiresServerConnection = 1;
    }

    if (-[ADSession _commandRequiresSync:](self, "_commandRequiresSync:", v6))
    {
      __int16 v13 = (os_log_s *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        v19 = "-[ADSession sendCommand:opportunistically:]";
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s _commandRequiresSync set to YES",  (uint8_t *)&v18,  0xCu);
      }

      self->_sessionRequiresSync = 1;
    }

    if (self->_state < 11 || objc_msgSend(v6, "siriCore_bufferingAllowedDuringActiveSession"))
    {
      sendBuffer = self->_sendBuffer;
      if (!sendBuffer)
      {
        objc_super v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        int v16 = self->_sendBuffer;
        self->_sendBuffer = v15;

        sendBuffer = self->_sendBuffer;
      }

      -[NSMutableArray addObject:](sendBuffer, "addObject:", v6);
    }

    int64_t state = self->_state;
    if (state == 11)
    {
      if (!-[ADSession _waitingForAssistantData](self, "_waitingForAssistantData"))
      {
        -[ADSession _sendServerCommand:](self, "_sendServerCommand:", v6);
        goto LABEL_32;
      }

- (void)sendCommands:(id)a3 opportunistically:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_state == 11 && !-[ADSession _waitingForAssistantData](self, "_waitingForAssistantData"))
  {
    -[ADSession _sendServerCommands:](self, "_sendServerCommands:", v6);
  }

  else
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        int v11 = 0LL;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[ADSession sendCommand:opportunistically:]( self,  "sendCommand:opportunistically:",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v11),  v4,  (void)v12);
          int v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v9);
    }
  }
}

- (void)handleCommand:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10022920C;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getConnectionMetrics:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }
}

- (id)currentConnectionPreCachedMetrics
{
  return 0LL;
}

- (void)getSNConnectionMetrics:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }
}

- (id)currentSNConnectionPreCachedMetrics
{
  return 0LL;
}

- (void)prepareForRetry
{
  BOOL v3 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSession prepareForRetry]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  if (self->_state > 10) {
    -[ADSession _cancelSynchronously:](self, "_cancelSynchronously:", 0LL);
  }
  else {
    -[ADSession _clearLimbo](self, "_clearLimbo");
  }
}

- (void)cancel
{
}

- (void)cancelSynchronously
{
}

- (void)cancelSessionRequest:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[ADSession cancelSessionRequest:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___SACancelRequest);
  [v6 setRefId:v4];
  -[ADSession _sendServerCommand:](self, "_sendServerCommand:", v6);
  id v7 = objc_alloc_init(&OBJC_CLASS___SARollbackRequest);
  [v7 setRefId:v4];
  [v7 setRequestId:v4];
  [v7 setReason:SARollbackReasonSIRIMINI_ARBITRATIONValue];
  -[ADSession _sendServerCommand:](self, "_sendServerCommand:", v7);
}

- (void)resetConnection
{
}

- (void)setDormant:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2LL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  -[ADSession _setDormantWithStyle:](self, "_setDormantWithStyle:", v3);
}

- (BOOL)hasLoadedAssistant
{
  return self->_state > 10;
}

- (BOOL)sessionIsActive
{
  return self->_state > 10;
}

- (BOOL)sessionIsAttemptingTryOrRetry
{
  return self->_state > 0;
}

- (id)sessionId
{
  return self->_sessionId;
}

- (id)connection
{
  return 0LL;
}

- (void)_cancelSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  -[ADSession _clearSendBuffer](self, "_clearSendBuffer");
  -[ADSession _clearLimbo](self, "_clearLimbo");
  -[ADSession _removeRequestForAssistantData](self, "_removeRequestForAssistantData");
  currentConnectionType = self->_currentConnectionType;
  self->_currentConnectionType = 0LL;

  currentSNConnectionType = self->_currentSNConnectionType;
  self->_currentSNConnectionType = 0LL;

  -[ADSession _resetServerConnectionSynchronously:completion:]( self,  "_resetServerConnectionSynchronously:completion:",  v3,  0LL);
}

- (id)_account
{
  return self->_account;
}

- (id)_hubAccount
{
  return self->_hubAccount;
}

- (void)_setCurrentConnectionType:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = -[SiriCoreConnectionType initWithTechnology:]( [SiriCoreConnectionType alloc],  "initWithTechnology:",  [v6 technology]);
    currentConnectionType = self->_currentConnectionType;
    self->_currentConnectionType = v4;
  }

  else
  {
    currentConnectionType = self->_currentConnectionType;
    self->_currentConnectionType = 0LL;
  }
}

- (void)_setSNCurrentConnectionType:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = -[SNConnectionType initWithTechnology:]( [SNConnectionType alloc],  "initWithTechnology:",  [v6 technology]);
    currentSNConnectionType = self->_currentSNConnectionType;
    self->_currentSNConnectionType = v4;
  }

  else
  {
    currentSNConnectionType = self->_currentSNConnectionType;
    self->_currentSNConnectionType = 0LL;
  }
}

- (id)_currentConnectionType
{
  return self->_currentConnectionType;
}

- (id)_currentSNConnectionType
{
  return self->_currentSNConnectionType;
}

- (void)queueResultObjects:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v8 = v4;
  if (!self->_resultObjectsQueue)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    resultObjectsQueue = self->_resultObjectsQueue;
    self->_resultObjectsQueue = v6;

    id v5 = v8;
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v4)
  {
LABEL_3:
    -[NSMutableArray addObject:](self->_resultObjectsQueue, "addObject:", v8);
    id v5 = v8;
  }

- (id)dequeueResultObjects
{
  if (-[NSMutableArray count](self->_resultObjectsQueue, "count"))
  {
    BOOL v3 = self->_resultObjectsQueue;
    resultObjectsQueue = self->_resultObjectsQueue;
    self->_resultObjectsQueue = 0LL;
  }

  else
  {
    BOOL v3 = 0LL;
  }

  self->_resultUsefulnessScore = 0LL;
  self->_hasUsefulnessScore = 0;
  return v3;
}

- (void)setOrUpdateUsefulnessScore:(id)a3
{
  id v4 = [a3 integerValue];
  if ((uint64_t)v4 >= self->_resultUsefulnessScore)
  {
    self->_resultUsefulnessScore = (int64_t)v4;
    self->_hasUsefulnessScore = 1;
  }

- (BOOL)hasResultObjects
{
  return -[NSMutableArray count](self->_resultObjectsQueue, "count") != 0LL;
}

- (int64_t)usefulnessScore
{
  return self->_resultUsefulnessScore;
}

- (BOOL)hasUsefulnessScore
{
  return self->_hasUsefulnessScore;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)sharedUserIdentifier
{
  return self->_sharedUserIdentifier;
}

- (void)setSharedUserIdentifier:(id)a3
{
}

- (NSString)loggingSharedUserIdentifier
{
  return self->_loggingSharedUserIdentifier;
}

- (void)setLoggingSharedUserIdentifier:(id)a3
{
}

- (NSString)connectionMode
{
  return self->_connectionMode;
}

- (void)setConnectionMode:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (int)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(int)a3
{
  self->_sessionType = a3;
}

- (ADSessionDelegate)delegate
{
  return (ADSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)dormant
{
  return self->_dormant;
}

- (void).cxx_destruct
{
}

+ (Class)sessionClassForType:(int)a3
{
  if (a3)
  {
    if (a3 != 1) {
      return (Class)0LL;
    }
    BOOL v3 = off_1004E5498;
  }

  else
  {
    BOOL v3 = off_1004E5490;
  }

  return (Class)(id)objc_opt_class(*v3);
}

+ (int)_adSessionTypeFromString:(id)a3
{
  return [a3 isEqualToString:@"remoteLimited"];
}

@end