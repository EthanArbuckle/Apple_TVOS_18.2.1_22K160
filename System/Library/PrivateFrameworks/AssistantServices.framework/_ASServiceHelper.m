@interface _ASServiceHelper
- (BOOL)isDeviceInCarDND;
- (BOOL)isDeviceInStarkMode;
- (BOOL)isDeviceLockedWithPasscode;
- (BOOL)isTimeoutSuspended;
- (BOOL)openSensitiveURL:(id)a3;
- (NSString)description;
- (_ASServiceHelper)initWithCommandClassName:(id)a3 infoDictionary:(id)a4 executionInfo:(id)a5 serviceClient:(id)a6;
- (id)_providerServiceDelegateWithErrorHandler:(id)a3;
- (id)_synchronousProviderServiceDelegateWithErrorHandler:(id)a3;
- (id)assistantLocalizedStringForKey:(id)a3 table:(id)a4 bundle:(id)a5;
- (id)endpointInfo;
- (id)instanceInfo;
- (id)peerInfoForCurrentCommand;
- (id)speechInfo;
- (void)dealloc;
- (void)dismissAssistant;
- (void)dismissAssistantWithReason:(int64_t)a3;
- (void)fetchContextsForKeys:(id)a3 includesNearbyDevices:(BOOL)a4 completion:(id)a5;
- (void)handleCommand:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)isDeviceWatchAuthenticatedWithCompletion:(id)a3;
- (void)prepareForAudioHandoffFailedWithCompletion:(id)a3;
- (void)prepareForAudioHandoffWithCompletion:(id)a3;
@end

@implementation _ASServiceHelper

- (_ASServiceHelper)initWithCommandClassName:(id)a3 infoDictionary:(id)a4 executionInfo:(id)a5 serviceClient:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS____ASServiceHelper;
  v14 = -[_ASServiceHelper init](&v24, "init");
  v15 = v14;
  if (v14)
  {
    v14->_isInvalid = 0;
    v16 = (NSString *)[v10 copy];
    commandClassName = v15->_commandClassName;
    v15->_commandClassName = v16;

    v18 = (NSDictionary *)[v11 copy];
    commandInfoDictionary = v15->_commandInfoDictionary;
    v15->_commandInfoDictionary = v18;

    v20 = (AFCommandExecutionInfo *)[v12 copy];
    commandExecutionInfo = v15->_commandExecutionInfo;
    v15->_commandExecutionInfo = v20;

    objc_storeWeak((id *)&v15->_serviceClient, v13);
    v22 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[_ASServiceHelper initWithCommandClassName:infoDictionary:executionInfo:serviceClient:]";
      __int16 v27 = 2112;
      v28 = v15;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    }
  }

  return v15;
}

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[_ASServiceHelper dealloc]";
    __int16 v7 = 2112;
    v8 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____ASServiceHelper;
  -[_ASServiceHelper dealloc](&v4, "dealloc");
}

- (NSString)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____ASServiceHelper;
  objc_super v4 = -[_ASServiceHelper description](&v11, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  __int128 v10 = *(_OWORD *)&self->_commandClassName;
  commandExecutionInfo = self->_commandExecutionInfo;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceClient);
  v8 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ {commandClass = %@, commandInfo = %@, executionInfo = %@, serviceClient = %@}",  v5,  v10,  commandExecutionInfo,  WeakRetained);

  return v8;
}

- (void)invalidate
{
  v3 = (os_log_s *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    v5 = "-[_ASServiceHelper invalidate]";
    __int16 v6 = 2112;
    __int16 v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v4, 0x16u);
  }

  self->_isInvalid = 1;
}

- (BOOL)openSensitiveURL:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextService;
  if (self->_isInvalid && os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[_ASServiceHelper openSensitiveURL:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_fault_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  buf,  0x16u);
    v5 = (os_log_s *)AFSiriLogContextService;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[_ASServiceHelper openSensitiveURL:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Trying to open URL %@", buf, 0x16u);
  }

  if (v4)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    char v17 = 0;
    __int16 v6 = (void *)objc_claimAutoreleasedReturnValue( -[_ASServiceHelper _synchronousProviderServiceDelegateWithErrorHandler:]( self,  "_synchronousProviderServiceDelegateWithErrorHandler:",  &stru_1000146E8));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000D1C8;
    v11[3] = &unk_100014710;
    v11[4] = buf;
    [v6 openURL:v4 reply:v11];

    __int16 v7 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      if (*(_BYTE *)(*(void *)&buf[8] + 24LL)) {
        v8 = @"YES";
      }
      else {
        v8 = @"NO";
      }
      *(_DWORD *)id v12 = 136315394;
      id v13 = "-[_ASServiceHelper openSensitiveURL:]";
      __int16 v14 = 2112;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Success opening URL? %@", v12, 0x16u);
    }

    BOOL v9 = *(_BYTE *)(*(void *)&buf[8] + 24LL) != 0;
    _Block_object_dispose(buf, 8);
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)dismissAssistant
{
  if (self->_isInvalid)
  {
    v3 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315394;
      __int16 v6 = "-[_ASServiceHelper dismissAssistant]";
      __int16 v7 = 2112;
      v8 = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  (uint8_t *)&v5,  0x16u);
    }
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[_ASServiceHelper _providerServiceDelegateWithErrorHandler:]( self,  "_providerServiceDelegateWithErrorHandler:",  0LL));
  [v4 dismissAssistant];
}

- (void)dismissAssistantWithReason:(int64_t)a3
{
  if (self->_isInvalid)
  {
    int v5 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315394;
      v8 = "-[_ASServiceHelper dismissAssistantWithReason:]";
      __int16 v9 = 2112;
      __int128 v10 = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  (uint8_t *)&v7,  0x16u);
    }
  }

  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue( -[_ASServiceHelper _providerServiceDelegateWithErrorHandler:]( self,  "_providerServiceDelegateWithErrorHandler:",  0LL));
  [v6 dismissAssistantWithReason:a3];
}

- (id)assistantLocalizedStringForKey:(id)a3 table:(id)a4 bundle:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(+[ASLocalization sharedLocalization](&OBJC_CLASS___ASLocalization, "sharedLocalization"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:v9 table:v8 bundle:v7]);

  return v11;
}

- (BOOL)isDeviceLockedWithPasscode
{
  if (self->_isInvalid)
  {
    v3 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[_ASServiceHelper isDeviceLockedWithPasscode]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  buf,  0x16u);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v8 = 0;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[_ASServiceHelper _synchronousProviderServiceDelegateWithErrorHandler:]( self,  "_synchronousProviderServiceDelegateWithErrorHandler:",  &stru_100014730));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000D110;
  v6[3] = &unk_100014710;
  v6[4] = buf;
  [v4 getLockStateWithReply:v6];

  LOBYTE(v4) = *(_BYTE *)(*(void *)&buf[8] + 24LL);
  _Block_object_dispose(buf, 8);
  return (char)v4;
}

- (BOOL)isDeviceInCarDND
{
  if (self->_isInvalid)
  {
    v3 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[_ASServiceHelper isDeviceInCarDND]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  buf,  0x16u);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v8 = 0;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[_ASServiceHelper _synchronousProviderServiceDelegateWithErrorHandler:]( self,  "_synchronousProviderServiceDelegateWithErrorHandler:",  &stru_100014750));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000D058;
  v6[3] = &unk_100014710;
  v6[4] = buf;
  [v4 getCarDNDModeWithReply:v6];

  LOBYTE(v4) = *(_BYTE *)(*(void *)&buf[8] + 24LL);
  _Block_object_dispose(buf, 8);
  return (char)v4;
}

- (void)isDeviceWatchAuthenticatedWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_isInvalid)
  {
    int v5 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      objc_super v11 = "-[_ASServiceHelper isDeviceWatchAuthenticatedWithCompletion:]";
      __int16 v12 = 2112;
      id v13 = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  buf,  0x16u);
    }
  }

  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue( -[_ASServiceHelper _providerServiceDelegateWithErrorHandler:]( self,  "_providerServiceDelegateWithErrorHandler:",  &stru_100014770));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000CFA4;
  v8[3] = &unk_100014798;
  id v9 = v4;
  id v7 = v4;
  [v6 getWatchAuthenticatedWithReply:v8];
}

- (BOOL)isDeviceInStarkMode
{
  if (self->_isInvalid)
  {
    v3 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[_ASServiceHelper isDeviceInStarkMode]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  buf,  0x16u);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v8 = 0;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[_ASServiceHelper _synchronousProviderServiceDelegateWithErrorHandler:]( self,  "_synchronousProviderServiceDelegateWithErrorHandler:",  &stru_1000147B8));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000CEEC;
  v6[3] = &unk_100014710;
  v6[4] = buf;
  [v4 getStarkModeWithReply:v6];

  LOBYTE(v4) = *(_BYTE *)(*(void *)&buf[8] + 24LL);
  _Block_object_dispose(buf, 8);
  return (char)v4;
}

- (void)handleCommand:(id)a3 completion:(id)a4
{
  __int16 v6 = (_ASServiceHelper *)a3;
  id v7 = a4;
  if (self->_isInvalid)
  {
    char v8 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[_ASServiceHelper handleCommand:completion:]";
      __int16 v26 = 2112;
      __int16 v27 = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  buf,  0x16u);
    }
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___AceObject);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
  {
    __int128 v10 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
    {
      commandClassName = self->_commandClassName;
      commandInfoDictionary = self->_commandInfoDictionary;
      commandExecutionInfo = self->_commandExecutionInfo;
      *(_DWORD *)buf = 136316162;
      v25 = "-[_ASServiceHelper handleCommand:completion:]";
      __int16 v26 = 2112;
      __int16 v27 = v6;
      __int16 v28 = 2112;
      v29 = commandClassName;
      __int16 v30 = 2112;
      v31 = commandInfoDictionary;
      __int16 v32 = 2112;
      v33 = commandExecutionInfo;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Sending %@ during the execution of %@ %@ with info %@.",  buf,  0x34u);
    }

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10000CDAC;
    v22[3] = &unk_100014528;
    id v14 = v7;
    id v23 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[_ASServiceHelper _providerServiceDelegateWithErrorHandler:]( self,  "_providerServiceDelegateWithErrorHandler:",  v22));
    v16 = self->_commandExecutionInfo;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000CDC8;
    v18[3] = &unk_1000147E0;
    v19 = v6;
    v20 = self;
    id v21 = v14;
    [v15 handleCommand:v19 executionInfo:v16 completion:v18];

    char v17 = v23;
    goto LABEL_10;
  }

  if (v7)
  {
    char v17 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 11LL));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v17);
LABEL_10:
  }
}

- (void)prepareForAudioHandoffFailedWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_isInvalid)
  {
    int v5 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[_ASServiceHelper prepareForAudioHandoffFailedWithCompletion:]";
      __int16 v15 = 2112;
      v16 = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  buf,  0x16u);
    }
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000CC24;
  v11[3] = &unk_100014528;
  id v6 = v4;
  id v12 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[_ASServiceHelper _providerServiceDelegateWithErrorHandler:]( self,  "_providerServiceDelegateWithErrorHandler:",  v11));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000CCF4;
  v9[3] = &unk_100014550;
  id v10 = v6;
  id v8 = v6;
  [v7 prepareForAudioHandoffFailedWithCompletion:v9];
}

- (void)prepareForAudioHandoffWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_isInvalid)
  {
    int v5 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[_ASServiceHelper prepareForAudioHandoffWithCompletion:]";
      __int16 v15 = 2112;
      v16 = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  buf,  0x16u);
    }
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000CA7C;
  v11[3] = &unk_100014528;
  id v6 = v4;
  id v12 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[_ASServiceHelper _providerServiceDelegateWithErrorHandler:]( self,  "_providerServiceDelegateWithErrorHandler:",  v11));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000CB5C;
  v9[3] = &unk_100014798;
  id v10 = v6;
  id v8 = v6;
  [v7 prepareForAudioHandoffWithCompletion:v9];
}

- (void)fetchContextsForKeys:(id)a3 includesNearbyDevices:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (self->_isInvalid)
  {
    id v10 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      char v17 = "-[_ASServiceHelper fetchContextsForKeys:includesNearbyDevices:completion:]";
      __int16 v18 = 2112;
      v19 = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  buf,  0x16u);
    }
  }

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( -[_ASServiceHelper _providerServiceDelegateWithErrorHandler:]( self,  "_providerServiceDelegateWithErrorHandler:",  &stru_100014800));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[AFCommandExecutionInfo requestID](self->_commandExecutionInfo, "requestID"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000C9C8;
  v14[3] = &unk_100014828;
  id v15 = v9;
  id v13 = v9;
  [v11 fetchContextsForKeys:v8 forRequestID:v12 includesNearbyDevices:v6 completion:v14];
}

- (BOOL)isTimeoutSuspended
{
  if (self->_isInvalid)
  {
    v3 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[_ASServiceHelper isTimeoutSuspended]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  buf,  0x16u);
    }
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  char v8 = 0;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[_ASServiceHelper _synchronousProviderServiceDelegateWithErrorHandler:]( self,  "_synchronousProviderServiceDelegateWithErrorHandler:",  &stru_100014848));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000C910;
  v6[3] = &unk_100014710;
  v6[4] = buf;
  [v4 getTimeoutSuspendedWithReply:v6];

  LOBYTE(v4) = *(_BYTE *)(*(void *)&buf[8] + 24LL);
  _Block_object_dispose(buf, 8);
  return (char)v4;
}

- (id)peerInfoForCurrentCommand
{
  if (self->_isInvalid)
  {
    v3 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315394;
      BOOL v6 = "-[_ASServiceHelper peerInfoForCurrentCommand]";
      __int16 v7 = 2112;
      char v8 = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  (uint8_t *)&v5,  0x16u);
    }
  }

  return (id)objc_claimAutoreleasedReturnValue( -[AFCommandExecutionInfo originPeerInfo]( self->_commandExecutionInfo,  "originPeerInfo"));
}

- (id)endpointInfo
{
  v3 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    __int16 v7 = "-[_ASServiceHelper endpointInfo]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s -[AFServiceHelper endpointInfo] is deprecated. Please use -[AFServiceHelper instanceInfo] as replacement.",  (uint8_t *)&v6,  0xCu);
  }

  if (self->_isInvalid)
  {
    id v4 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315394;
      __int16 v7 = "-[_ASServiceHelper endpointInfo]";
      __int16 v8 = 2112;
      id v9 = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  (uint8_t *)&v6,  0x16u);
    }
  }

  return (id)objc_claimAutoreleasedReturnValue( -[AFCommandExecutionInfo endpointInfo]( self->_commandExecutionInfo,  "endpointInfo"));
}

- (id)instanceInfo
{
  if (self->_isInvalid)
  {
    v3 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315394;
      int v6 = "-[_ASServiceHelper instanceInfo]";
      __int16 v7 = 2112;
      __int16 v8 = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  (uint8_t *)&v5,  0x16u);
    }
  }

  return (id)objc_claimAutoreleasedReturnValue( -[AFCommandExecutionInfo instanceInfo]( self->_commandExecutionInfo,  "instanceInfo"));
}

- (id)speechInfo
{
  if (self->_isInvalid)
  {
    v3 = (os_log_s *)AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315394;
      int v6 = "-[_ASServiceHelper speechInfo]";
      __int16 v7 = 2112;
      __int16 v8 = self;
      _os_log_fault_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_FAULT,  "%s Attempting to access %@ after it has been invalidated.",  (uint8_t *)&v5,  0x16u);
    }
  }

  return (id)objc_claimAutoreleasedReturnValue( -[AFCommandExecutionInfo speechInfo]( self->_commandExecutionInfo,  "speechInfo"));
}

- (id)_providerServiceDelegateWithErrorHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceClient);
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained providerServiceDelegateWithErrorHandler:v4]);
  }

  else
  {
    if (v4)
    {
      __int16 v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Service helper %@ is already invalidated.",  self);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  104LL,  v8));
      v4[2](v4, v9);
    }

    __int16 v7 = 0LL;
  }

  return v7;
}

- (id)_synchronousProviderServiceDelegateWithErrorHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceClient);
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained synchronousProviderServiceDelegateWithErrorHandler:v4]);
  }

  else
  {
    if (v4)
    {
      __int16 v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Service helper %@ is already invalidated.",  self);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AFError errorWithCode:description:]( &OBJC_CLASS___AFError,  "errorWithCode:description:",  104LL,  v8));
      v4[2](v4, v9);
    }

    __int16 v7 = 0LL;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end