@interface ADRequestDispatcherService
- (ADRequestDispatcherService)init;
- (ADRequestDispatcherService)initWithBridgeConnectionListeners:(id)a3;
- (ADRequestDispatcherService)initWithRequestDispatcher:(id)a3;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)_getDefaultAssistantIdForAssistantId:(id)a3;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (id)sanitizeVoiceTriggerEventInfo:(id)a3;
- (void)_logPowerContextForRequest:(id)a3;
- (void)announceNotificationHandlingStateUpdatedWithAssistantId:(id)a3 toState:(int64_t)a4;
- (void)cancelOperationsForRequestID:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6;
- (void)endDictationSessionWithAssistantId:(id)a3;
- (void)endSessionWithAssistantId:(id)a3;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)pauseDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4;
- (void)postMUXTestResultCandidateWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5 sharedUserIdToSpeechRecognitionDict:(id)a6 voiceIdConfidenceScores:(id)a7;
- (void)postMUXTestResultSelectedWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5 voiceIdConfidenceScores:(id)a6;
- (void)postTestResultCandidateWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5 recognitionSausage:(id)a6;
- (void)postTestResultSelectedWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5;
- (void)prewarmWithAssistantId:(id)a3 languageCode:(id)a4 prewarmOptions:(unint64_t)a5 sharedUserId:(id)a6;
- (void)requestCompletedWithAssistantId:(id)a3 requestId:(id)a4;
- (void)requestFailedWithAssistantId:(id)a3 requestId:(id)a4;
- (void)resumeDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7;
- (void)sendMultiUserInfoWithAssistantId:(id)a3;
- (void)sendMultiUserInfoWithDeviceAssistantId:(id)a3 multiUserInfo:(id)a4;
- (void)startCorrectionSpeechRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 previousUtterance:(id)a7 requestContextData:(id)a8;
- (void)startDictationRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 dictationOptions:(id)a6;
- (void)startDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 recognitionOnDevice:(BOOL)a5 shouldClassifyIntent:(BOOL)a6 understandingOnDevice:(BOOL)a7;
- (void)startDirectActionRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 directAction:(id)a7 requestExecutionParameters:(id)a8 requestContextData:(id)a9;
- (void)startLocalRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 requestContextData:(id)a6;
- (void)startMultiUserTestRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 expectedSelectedSharedUserId:(id)a7 voiceIdConfidenceScores:(id)a8 requestContextData:(id)a9;
- (void)startSessionIfNeededWithConfiguration:(id)a3;
- (void)startSessionWithConfiguration:(id)a3;
- (void)startSpeechRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 location:(id)a6 asrOnServer:(BOOL)a7 requestContextData:(id)a8;
- (void)startTestSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 enableASR:(BOOL)a5 inputOrigin:(id)a6 location:(id)a7 jitContext:(id)a8 overrideModelPath:(id)a9 requestContextData:(id)a10;
- (void)startTextRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7;
- (void)startUnderstandingOnServerRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5;
- (void)startUnderstandingOnServerTextRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7;
- (void)updateVoiceCommandContextWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7 disambiguationActive:(id)a8 cursorInVisibleText:(id)a9 favorCommandSuppression:(id)a10 abortCommandSuppression:(id)a11 undoEvent:(id)a12;
@end

@implementation ADRequestDispatcherService

- (ADRequestDispatcherService)init
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSArray);
  v4 = -[ADRequestDispatcherService initWithBridgeConnectionListeners:](self, "initWithBridgeConnectionListeners:", v3);

  return v4;
}

- (ADRequestDispatcherService)initWithBridgeConnectionListeners:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___SRDRequestDispatcher);
  char v6 = objc_opt_respondsToSelector(v5, "initWithRequestDispatcherServiceHelper:bridgeConnectionListeners:");
  id v7 = v5;
  v8 = objc_alloc_init(&OBJC_CLASS___ADRequestDispatcherServiceHelper);
  if ((v6 & 1) != 0) {
    id v9 = [v7 initWithRequestDispatcherServiceHelper:v8 bridgeConnectionListeners:v4];
  }
  else {
    id v9 = [v7 initWithRequestDispatcherServiceHelper:v8];
  }
  v10 = v9;

  v11 = -[ADRequestDispatcherService initWithRequestDispatcher:](self, "initWithRequestDispatcher:", v10);
  return v11;
}

- (ADRequestDispatcherService)initWithRequestDispatcher:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADRequestDispatcherService;
  char v6 = -[ADRequestDispatcherService init](&v11, "init");
  id v7 = v6;
  if (v6)
  {
    -[ADService setIdentifier:](v6, "setIdentifier:", @"RequestDispatcherService");
    objc_storeStrong((id *)&v7->_requestDispatcher, a3);
    v8 = objc_opt_new(&OBJC_CLASS___AFPowerContextClient);
    powerContext = v7->_powerContext;
    v7->_powerContext = v8;
  }

  return v7;
}

- (id)domains
{
  return -[AFRequestDispatcher domains](self->_requestDispatcher, "domains");
}

- (id)commandsForDomain:(id)a3
{
  return -[AFRequestDispatcher commandsForDomain:](self->_requestDispatcher, "commandsForDomain:", a3);
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return -[AFRequestDispatcher implementsCommand:forDomain:]( self->_requestDispatcher,  "implementsCommand:forDomain:",  a3,  a4);
}

- (void)cancelOperationsForRequestID:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315650;
    v15 = "-[ADRequestDispatcherService cancelOperationsForRequestID:forAssistantID:fromRemote:reason:]";
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 1024;
    BOOL v19 = v7;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s request Id: %@, from remote: %d",  (uint8_t *)&v14,  0x1Cu);
  }

  if ((objc_opt_respondsToSelector(self->_requestDispatcher, "cancelRequestWithAssistantId:requestId:reason:") & 1) != 0)
  {
    -[AFRequestDispatcher cancelRequestWithAssistantId:requestId:reason:]( self->_requestDispatcher,  "cancelRequestWithAssistantId:requestId:reason:",  v11,  v10,  a6);
  }

  else
  {
    v13 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315138;
      v15 = "-[ADRequestDispatcherService cancelOperationsForRequestID:forAssistantID:fromRemote:reason:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "%s SRD has not implemented cancelRequestWithAssistantId:requestId:reason: yet, failing back to cancelRequestWith AssistantId:requestId:",  (uint8_t *)&v14,  0xCu);
    }

    -[AFRequestDispatcher cancelRequestWithAssistantId:requestId:]( self->_requestDispatcher,  "cancelRequestWithAssistantId:requestId:",  v11,  v10);
  }

  -[ADRequestDispatcherService _logPowerContextForRequest:](self, "_logPowerContextForRequest:", v10);
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = (void (**)(void, void, void))v13;
  requestDispatcher = self->_requestDispatcher;
  if (requestDispatcher)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v12 info]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10020E388;
    v18[3] = &unk_1004FC668;
    BOOL v19 = v14;
    -[AFRequestDispatcher handleCommand:executionContextInfo:reply:]( requestDispatcher,  "handleCommand:executionContextInfo:reply:",  v10,  v16,  v18);
  }

  else if (v13)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 44LL));
    ((void (**)(void, void, void *))v14)[2](v14, 0LL, v17);
  }
}

- (void)requestCompletedWithAssistantId:(id)a3 requestId:(id)a4
{
  requestDispatcher = self->_requestDispatcher;
  id v7 = a4;
  -[AFRequestDispatcher requestCompletedWithAssistantId:requestId:]( requestDispatcher,  "requestCompletedWithAssistantId:requestId:",  a3,  v7);
  -[ADRequestDispatcherService _logPowerContextForRequest:](self, "_logPowerContextForRequest:", v7);
}

- (void)requestFailedWithAssistantId:(id)a3 requestId:(id)a4
{
  id v6 = a3;
  requestDispatcher = self->_requestDispatcher;
  id v8 = a4;
  if ((objc_opt_respondsToSelector(requestDispatcher, "requestFailedWithAssistantId:requestId:") & 1) != 0)
  {
    -[AFRequestDispatcher requestFailedWithAssistantId:requestId:]( self->_requestDispatcher,  "requestFailedWithAssistantId:requestId:",  v6,  v8);
  }

  else
  {
    id v9 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315138;
      id v11 = "-[ADRequestDispatcherService requestFailedWithAssistantId:requestId:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "%s SRD has not implemented requestFailedWithAssistantId:requestId: yet, failling back to cancelRequestWithAssist antId:requestId:reason",  (uint8_t *)&v10,  0xCu);
    }

    -[AFRequestDispatcher cancelRequestWithAssistantId:requestId:reason:]( self->_requestDispatcher,  "cancelRequestWithAssistantId:requestId:reason:",  v6,  v8,  3LL);
  }

  -[ADRequestDispatcherService _logPowerContextForRequest:](self, "_logPowerContextForRequest:", v8);
}

- (void)_logPowerContextForRequest:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[AFPowerContextClient currentPowerPolicyWithError:]( self->_powerContext,  "currentPowerPolicyWithError:",  0LL));
  id v4 = (void *)AFSiriLogContextDaemon;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      __int16 v16 = v4;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 description]);
      int v18 = 136315394;
      BOOL v19 = "-[ADRequestDispatcherService _logPowerContextForRequest:]";
      __int16 v20 = 2112;
      v21 = v17;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s Power context policy exists: %@",  (uint8_t *)&v18,  0x16u);
    }

    if (AFIsInternalInstall(v5))
    {
      id v6 = (os_log_s *)AFSiriLogContextPower;
      os_signpost_id_t v7 = os_signpost_id_generate(AFSiriLogContextPower);
      if (v7 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_15;
      }
      os_signpost_id_t v8 = v7;
      if (!os_signpost_enabled(v6)) {
        goto LABEL_15;
      }
      unsigned int v9 = [v3 thermalMitigationLevel];
      int v18 = 67109120;
      LODWORD(v19) = v9;
      int v10 = "%d";
      id v11 = v6;
      os_signpost_id_t v12 = v8;
      uint32_t v13 = 8;
LABEL_14:
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v11,  OS_SIGNPOST_EVENT,  v12,  "ThermalMitigationLevel",  v10,  (uint8_t *)&v18,  v13);
LABEL_15:
    }
  }

  else
  {
    if (v5)
    {
      int v18 = 136315138;
      BOOL v19 = "-[ADRequestDispatcherService _logPowerContextForRequest:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEBUG,  "%s Power context policy is nil",  (uint8_t *)&v18,  0xCu);
    }

    if (AFIsInternalInstall(v5))
    {
      id v6 = (os_log_s *)AFSiriLogContextPower;
      os_signpost_id_t v14 = os_signpost_id_generate(AFSiriLogContextPower);
      if (v14 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_15;
      }
      os_signpost_id_t v15 = v14;
      if (!os_signpost_enabled(v6)) {
        goto LABEL_15;
      }
      LOWORD(v18) = 0;
      int v10 = "UNKNOWN";
      id v11 = v6;
      os_signpost_id_t v12 = v15;
      uint32_t v13 = 2;
      goto LABEL_14;
    }
  }
}

- (void)startSpeechRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 location:(id)a6 asrOnServer:(BOOL)a7 requestContextData:(id)a8
{
  BOOL v9 = a7;
  id v24 = a3;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  if (AFDeviceSupportsSiriMUX( -[ADRequestDispatcherService startSessionIfNeededWithConfiguration:]( self,  "startSessionIfNeededWithConfiguration:",  v24)))
  {
    int v18 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
    unsigned int v19 = [v18 isMultiUserInfoDirty];

    if (v19)
    {
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
      [v20 setIsMultiUserInfoDirty:0];

      v21 = (void *)objc_claimAutoreleasedReturnValue([v24 assistantId]);
      -[ADRequestDispatcherService sendMultiUserInfoWithAssistantId:](self, "sendMultiUserInfoWithAssistantId:", v21);
    }
  }

  requestDispatcher = self->_requestDispatcher;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v24 assistantId]);
  -[AFRequestDispatcher startSpeechRequestWithAssistantId:requestId:inputOrigin:location:asrOnServer:requestContextData:]( requestDispatcher,  "startSpeechRequestWithAssistantId:requestId:inputOrigin:location:asrOnServer:requestContextData:",  v23,  v17,  v16,  v15,  v9,  v14);
}

- (void)sendMultiUserInfoWithAssistantId:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  id v6 = [v5 isMultiUserAvailable];
  if ((v6 & 1) != 0 || AFIsATV(v6, v7))
  {
    os_signpost_id_t v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[ADRequestDispatcherService sendMultiUserInfoWithAssistantId:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Sending MU Information.", buf, 0xCu);
    }

    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v5 multiUserSAObject]);
    -[ADRequestDispatcherService sendMultiUserInfoWithDeviceAssistantId:multiUserInfo:]( self,  "sendMultiUserInfoWithDeviceAssistantId:multiUserInfo:",  v4,  v9);
  }

  else
  {
    int v10 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[ADRequestDispatcherService sendMultiUserInfoWithAssistantId:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Sending deviceOwner.", buf, 0xCu);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10020E378;
    v11[3] = &unk_1004F6918;
    v11[4] = self;
    id v12 = v4;
    [v5 fetchDeviceOwnerAsSAMultiUserInfo:v11];
  }
}

- (void)startLocalRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 requestContextData:(id)a6
{
  requestDispatcher = self->_requestDispatcher;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = (id)objc_claimAutoreleasedReturnValue([a3 assistantId]);
  -[AFRequestDispatcher startLocalRequestWithAssistantId:requestId:inputOrigin:requestContextData:]( requestDispatcher,  "startLocalRequestWithAssistantId:requestId:inputOrigin:requestContextData:",  v13,  v12,  v11,  v10);
}

- (void)startCorrectionSpeechRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 previousUtterance:(id)a7 requestContextData:(id)a8
{
  requestDispatcher = self->_requestDispatcher;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = (id)objc_claimAutoreleasedReturnValue([a3 assistantId]);
  -[AFRequestDispatcher startCorrectionSpeechRequestWithAssistantId:requestId:inputOrigin:utterance:previousUtterance:requestContextData:]( requestDispatcher,  "startCorrectionSpeechRequestWithAssistantId:requestId:inputOrigin:utterance:previousUtterance:requestContextData:",  v19,  v18,  v17,  v16,  v15,  v14);
}

- (void)startUnderstandingOnServerRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[ADRequestDispatcherService startSessionIfNeededWithConfiguration:]( self,  "startSessionIfNeededWithConfiguration:",  v10);
  requestDispatcher = self->_requestDispatcher;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v10 assistantId]);

  -[AFRequestDispatcher startUnderstandingOnServerRequestWithAssistantId:requestId:inputOrigin:]( requestDispatcher,  "startUnderstandingOnServerRequestWithAssistantId:requestId:inputOrigin:",  v12,  v9,  v8);
}

- (void)startDirectActionRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 directAction:(id)a7 requestExecutionParameters:(id)a8 requestContextData:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  -[ADRequestDispatcherService startSessionIfNeededWithConfiguration:]( self,  "startSessionIfNeededWithConfiguration:",  v22);
  requestDispatcher = self->_requestDispatcher;
  id v24 = (id)objc_claimAutoreleasedReturnValue([v22 assistantId]);

  -[AFRequestDispatcher startDirectActionRequestWithAssistantId:requestId:inputOrigin:utterance:directAction:requestExecutionParameters:requestContextData:]( requestDispatcher,  "startDirectActionRequestWithAssistantId:requestId:inputOrigin:utterance:directAction:requestExecutionParameters:requestContextData:",  v24,  v21,  v20,  v19,  v18,  v17,  v16);
}

- (void)startTextRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  -[ADRequestDispatcherService startSessionIfNeededWithConfiguration:]( self,  "startSessionIfNeededWithConfiguration:",  v16);
  requestDispatcher = self->_requestDispatcher;
  id v18 = (id)objc_claimAutoreleasedReturnValue([v16 assistantId]);

  -[AFRequestDispatcher startTextRequestWithAssistantId:requestId:inputOrigin:utterance:requestContextData:]( requestDispatcher,  "startTextRequestWithAssistantId:requestId:inputOrigin:utterance:requestContextData:",  v18,  v15,  v14,  v13,  v12);
}

- (void)startUnderstandingOnServerTextRequestWithConfiguration:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  -[ADRequestDispatcherService startSessionIfNeededWithConfiguration:]( self,  "startSessionIfNeededWithConfiguration:",  v16);
  requestDispatcher = self->_requestDispatcher;
  id v18 = (id)objc_claimAutoreleasedReturnValue([v16 assistantId]);

  -[AFRequestDispatcher startUnderstandingOnServerTextRequestWithAssistantId:requestId:inputOrigin:utterance:requestContextData:]( requestDispatcher,  "startUnderstandingOnServerTextRequestWithAssistantId:requestId:inputOrigin:utterance:requestContextData:",  v18,  v15,  v14,  v13,  v12);
}

- (void)startSessionIfNeededWithConfiguration:(id)a3
{
  id v4 = a3;
  requestDispatcher = self->_requestDispatcher;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 assistantId]);
  unsigned __int8 v7 = -[AFRequestDispatcher sessionExistsForAssistantId:]( requestDispatcher,  "sessionExistsForAssistantId:",  v6);

  id v8 = (void *)AFSiriLogContextDaemon;
  BOOL v9 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG);
  if ((v7 & 1) != 0)
  {
    if (v9)
    {
      id v10 = v8;
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 assistantId]);
      int v14 = 136315394;
      id v15 = "-[ADRequestDispatcherService startSessionIfNeededWithConfiguration:]";
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s session for assistantId: %@ exists not creating one",  (uint8_t *)&v14,  0x16u);
    }
  }

  else
  {
    if (v9)
    {
      id v12 = v8;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 assistantId]);
      int v14 = 136315394;
      id v15 = "-[ADRequestDispatcherService startSessionIfNeededWithConfiguration:]";
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s session for assistantId: %@ not exists creating one",  (uint8_t *)&v14,  0x16u);
    }

    -[ADRequestDispatcherService startSessionWithConfiguration:](self, "startSessionWithConfiguration:", v4);
  }
}

- (void)prewarmWithAssistantId:(id)a3 languageCode:(id)a4 prewarmOptions:(unint64_t)a5 sharedUserId:(id)a6
{
}

- (void)startSessionWithConfiguration:(id)a3
{
  id v5 = a3;
  if (AFDeviceSupportsSiriMUX( -[AFRequestDispatcher startSessionWithConfiguration:]( self->_requestDispatcher,  "startSessionWithConfiguration:")))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 assistantId]);
    -[ADRequestDispatcherService sendMultiUserInfoWithAssistantId:](self, "sendMultiUserInfoWithAssistantId:", v4);
  }
}

- (void)endSessionWithAssistantId:(id)a3
{
}

- (void)startDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 recognitionOnDevice:(BOOL)a5 shouldClassifyIntent:(BOOL)a6 understandingOnDevice:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = (NSString *)a3;
  id v13 = a4;
  defaultDictationAssistantId = self->_defaultDictationAssistantId;
  if (v12)
  {
    if (defaultDictationAssistantId)
    {
      id v15 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v26 = 136315138;
        v27 = "-[ADRequestDispatcherService startDictationSessionWithAssistantId:languageCode:recognitionOnDevice:shouldC"
              "lassifyIntent:understandingOnDevice:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s Starting a dictation session but defaultDictationAssistantId is not nil, was endSession for last session ca lled? Resetting defaultDictationAssistantId to nil, SRD will end previous session automatically",  (uint8_t *)&v26,  0xCu);
        defaultDictationAssistantId = self->_defaultDictationAssistantId;
      }

      self->_defaultDictationAssistantId = 0LL;
    }
  }

  else
  {
    if (defaultDictationAssistantId)
    {
      __int16 v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        int v26 = 136315394;
        v27 = "-[ADRequestDispatcherService startDictationSessionWithAssistantId:languageCode:recognitionOnDevice:shouldC"
              "lassifyIntent:understandingOnDevice:]";
        __int16 v28 = 2112;
        v29 = defaultDictationAssistantId;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s Starting dictation session without an assistantId but defaultDictationAssistantId is not nil %@. This is un expected, but still creating a new defaultDictationAssistantId",  (uint8_t *)&v26,  0x16u);
      }
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
    id v19 = (NSString *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingString:@"-defaultDictationAssistantId"]);
    id v20 = self->_defaultDictationAssistantId;
    self->_defaultDictationAssistantId = v19;

    id v12 = self->_defaultDictationAssistantId;
    id v21 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v25 = self->_defaultDictationAssistantId;
      int v26 = 136315394;
      v27 = "-[ADRequestDispatcherService startDictationSessionWithAssistantId:languageCode:recognitionOnDevice:shouldCla"
            "ssifyIntent:understandingOnDevice:]";
      __int16 v28 = 2112;
      v29 = v25;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%s Created a new default assistantId for dictation %@",  (uint8_t *)&v26,  0x16u);
    }
  }

  requestDispatcher = self->_requestDispatcher;
  if (!v8)
  {
    if ((objc_opt_respondsToSelector( requestDispatcher,  "startSpeechDictationSessionWithAssistantId:languageCode:recognitionOnDevice:") & 1) != 0)
    {
      -[AFRequestDispatcher startSpeechDictationSessionWithAssistantId:languageCode:recognitionOnDevice:]( self->_requestDispatcher,  "startSpeechDictationSessionWithAssistantId:languageCode:recognitionOnDevice:",  v12,  v13,  v9);
      goto LABEL_19;
    }

    v23 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v26 = 136315138;
    v27 = "-[ADRequestDispatcherService startDictationSessionWithAssistantId:languageCode:recognitionOnDevice:shouldClass"
          "ifyIntent:understandingOnDevice:]";
    id v24 = "%s SRD has not implemented startSpeechDictationSessionWithAssistantId:languageCode:recognitionOnDevice: yet. R"
          "equest will have undefined behavior (will likely timeout)";
LABEL_21:
    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v26, 0xCu);
    goto LABEL_19;
  }

  if ((objc_opt_respondsToSelector( requestDispatcher,  "startUnderstandingDictationSessionWithAssistantId:languageCode:understandingOnDevice:") & 1) == 0)
  {
    v23 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v26 = 136315138;
    v27 = "-[ADRequestDispatcherService startDictationSessionWithAssistantId:languageCode:recognitionOnDevice:shouldClass"
          "ifyIntent:understandingOnDevice:]";
    id v24 = "%s SRD has not implemented startUnderstandingDictationSessionWithAssistantId:languageCode:understandingOnDevic"
          "e: yet. Request will have undefined behavior (will likely timeout)";
    goto LABEL_21;
  }

  -[AFRequestDispatcher startUnderstandingDictationSessionWithAssistantId:languageCode:understandingOnDevice:]( self->_requestDispatcher,  "startUnderstandingDictationSessionWithAssistantId:languageCode:understandingOnDevice:",  v12,  v13,  v7);
LABEL_19:
}

- (void)startDictationRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 dictationOptions:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[ADRequestDispatcherService _getDefaultAssistantIdForAssistantId:]( self,  "_getDefaultAssistantIdForAssistantId:",  a3));
  unsigned int v14 = [v12 shouldClassifyIntent];
  requestDispatcher = self->_requestDispatcher;
  if (!v14)
  {
    if ((objc_opt_respondsToSelector( requestDispatcher,  "startSpeechDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions:") & 1) != 0)
    {
      -[AFRequestDispatcher startSpeechDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions:]( self->_requestDispatcher,  "startSpeechDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions:",  v13,  v10,  v11,  v12);
      goto LABEL_9;
    }

    __int16 v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v18 = 136315138;
    id v19 = "-[ADRequestDispatcherService startDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions:]";
    id v17 = "%s SRD has not implemented startSpeechDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions: "
          "yet. Request will have undefined behavior (will likely timeout)";
LABEL_11:
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v18, 0xCu);
    goto LABEL_9;
  }

  if ((objc_opt_respondsToSelector( requestDispatcher,  "startUnderstandingDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions:") & 1) == 0)
  {
    __int16 v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v18 = 136315138;
    id v19 = "-[ADRequestDispatcherService startDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions:]";
    id v17 = "%s SRD has not implemented startUnderstandingDictationRequestWithAssistantId:requestId:inputOrigin:dictationOp"
          "tions: yet. Request will have undefined behavior (will likely timeout)";
    goto LABEL_11;
  }

  -[AFRequestDispatcher startUnderstandingDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions:]( self->_requestDispatcher,  "startUnderstandingDictationRequestWithAssistantId:requestId:inputOrigin:dictationOptions:",  v13,  v10,  v11,  v12);
LABEL_9:
}

- (void)endDictationSessionWithAssistantId:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[ADRequestDispatcherService _getDefaultAssistantIdForAssistantId:]( self,  "_getDefaultAssistantIdForAssistantId:",  a3));
  id v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    BOOL v9 = "-[ADRequestDispatcherService endDictationSessionWithAssistantId:]";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s Clearing defaultDictationAssistantId at the end of dictation session",  (uint8_t *)&v8,  0xCu);
  }

  defaultDictationAssistantId = self->_defaultDictationAssistantId;
  self->_defaultDictationAssistantId = 0LL;

  if ((objc_opt_respondsToSelector(self->_requestDispatcher, "endDictationSessionWithAssistantId:") & 1) != 0)
  {
    -[AFRequestDispatcher endDictationSessionWithAssistantId:]( self->_requestDispatcher,  "endDictationSessionWithAssistantId:",  v4);
  }

  else
  {
    BOOL v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      BOOL v9 = "-[ADRequestDispatcherService endDictationSessionWithAssistantId:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s SRD has not implemented endDictationSessionWithAssistantId yet.",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (void)pauseDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4
{
  id v6 = a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[ADRequestDispatcherService _getDefaultAssistantIdForAssistantId:]( self,  "_getDefaultAssistantIdForAssistantId:",  a3));
  if ((objc_opt_respondsToSelector(self->_requestDispatcher, "pauseDictationRecognitionWithAssistantId:requestId:") & 1) != 0)
  {
    -[AFRequestDispatcher pauseDictationRecognitionWithAssistantId:requestId:]( self->_requestDispatcher,  "pauseDictationRecognitionWithAssistantId:requestId:",  v7,  v6);
  }

  else
  {
    int v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "-[ADRequestDispatcherService pauseDictationRecognitionWithAssistantId:requestId:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s SRD has not implemented pauseDictationRecognitionWithAssistantId:requestId: yet. Ignoring",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (void)resumeDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( -[ADRequestDispatcherService _getDefaultAssistantIdForAssistantId:]( self,  "_getDefaultAssistantIdForAssistantId:",  a3));
  if ((objc_opt_respondsToSelector( self->_requestDispatcher,  "resumeDictationRecognitionWithAssistantId:requestId:prefixText:postfixText:selectedText:") & 1) != 0)
  {
    -[AFRequestDispatcher resumeDictationRecognitionWithAssistantId:requestId:prefixText:postfixText:selectedText:]( self->_requestDispatcher,  "resumeDictationRecognitionWithAssistantId:requestId:prefixText:postfixText:selectedText:",  v16,  v12,  v13,  v14,  v15);
  }

  else
  {
    id v17 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      id v19 = "-[ADRequestDispatcherService resumeDictationRecognitionWithAssistantId:requestId:prefixText:postfixText:selectedText:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s SRD has not implemented resumeDictationRecognitionWithAssistantId:requestId:prefixText:postfixText:selected yet. Ignoring",  (uint8_t *)&v18,  0xCu);
    }
  }
}

- (void)updateVoiceCommandContextWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7 disambiguationActive:(id)a8 cursorInVisibleText:(id)a9 favorCommandSuppression:(id)a10 abortCommandSuppression:(id)a11 undoEvent:(id)a12
{
  id v29 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  id v28 = (id)objc_claimAutoreleasedReturnValue( -[ADRequestDispatcherService _getDefaultAssistantIdForAssistantId:]( self,  "_getDefaultAssistantIdForAssistantId:",  a3));
  char v26 = objc_opt_respondsToSelector( self->_requestDispatcher,  "updateVoiceCommandContextWithAssistantId:requestId:prefixText:postfixText:selectedText:disambiguationActive:cu rsorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:");
  requestDispatcher = self->_requestDispatcher;
  if ((v26 & 1) != 0)
  {
    -[AFRequestDispatcher updateVoiceCommandContextWithAssistantId:requestId:prefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:]( requestDispatcher,  "updateVoiceCommandContextWithAssistantId:requestId:prefixText:postfixText:selectedText:disambiguationActive:cursor InVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:",  v28,  v29,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25);
  }

  else if ((objc_opt_respondsToSelector( requestDispatcher,  "updateVoiceCommandContextWithAssistantId:requestId:prefixText:postfixText:selectedText:disambiguationActi ve:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:") & 1) != 0)
  {
    -[AFRequestDispatcher updateVoiceCommandContextWithAssistantId:requestId:prefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:]( self->_requestDispatcher,  "updateVoiceCommandContextWithAssistantId:requestId:prefixText:postfixText:selectedText:disambiguationActive:cursor InVisibleText:favorCommandSuppression:abortCommandSuppression:",  v28,  v29,  v18,  v19,  v20,  v21,  v22,  v23,  v24);
  }
}

- (void)announceNotificationHandlingStateUpdatedWithAssistantId:(id)a3 toState:(int64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[ADRequestDispatcherService _getDefaultAssistantIdForAssistantId:]( self,  "_getDefaultAssistantIdForAssistantId:",  a3));
  if ((objc_opt_respondsToSelector( self->_requestDispatcher,  "announceNotificationHandlingStateUpdatedWithAssistantId:toState:") & 1) != 0)
  {
    -[AFRequestDispatcher announceNotificationHandlingStateUpdatedWithAssistantId:toState:]( self->_requestDispatcher,  "announceNotificationHandlingStateUpdatedWithAssistantId:toState:",  v6,  a4);
  }

  else
  {
    BOOL v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      int v9 = "-[ADRequestDispatcherService announceNotificationHandlingStateUpdatedWithAssistantId:toState:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s SRD has not implemented announceNotificationHandlingStateUpdatedWithAssistantId:toState: yet. Ignoring",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (id)_getDefaultAssistantIdForAssistantId:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  defaultDictationAssistantId = self->_defaultDictationAssistantId;
  if (defaultDictationAssistantId)
  {
    BOOL v7 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315394;
      id v13 = "-[ADRequestDispatcherService _getDefaultAssistantIdForAssistantId:]";
      __int16 v14 = 2112;
      id v15 = defaultDictationAssistantId;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s Using defaultDictationAssistantId since assistantId it is not nil %@",  (uint8_t *)&v12,  0x16u);
      defaultDictationAssistantId = self->_defaultDictationAssistantId;
    }

    int v8 = defaultDictationAssistantId;
    goto LABEL_7;
  }

  if (v4)
  {
    int v8 = (NSString *)v4;
LABEL_7:
    int v9 = v8;
    goto LABEL_8;
  }

  id v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315138;
    id v13 = "-[ADRequestDispatcherService _getDefaultAssistantIdForAssistantId:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s Processing dictation request without an assistantId and defaultDictationAssistantId is also nil. This is unexpe cted (did Assistant + Siri was disabled during request?), request will likely timeout",  (uint8_t *)&v12,  0xCu);
  }

  int v9 = 0LL;
LABEL_8:

  return v9;
}

- (void)sendMultiUserInfoWithDeviceAssistantId:(id)a3 multiUserInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (!v6 || !v7)
  {
    int v12 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v17 = 136315650;
    id v18 = "-[ADRequestDispatcherService sendMultiUserInfoWithDeviceAssistantId:multiUserInfo:]";
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v8;
    id v13 = "%s Invalid arguments deviceAssistantId = %@, multiUserInfo = %@";
    __int16 v14 = v12;
    uint32_t v15 = 32;
LABEL_7:
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, v15);
    goto LABEL_11;
  }

  char v9 = objc_opt_respondsToSelector( self->_requestDispatcher,  "sendMultiUserInfoWithDeviceAssistantId:multiUserInfo:isRMVEnabled:");
  requestDispatcher = self->_requestDispatcher;
  if ((v9 & 1) == 0)
  {
    if ((objc_opt_respondsToSelector(self->_requestDispatcher, "sendMultiUserInfoWithDeviceAssistantId:multiUserInfo:") & 1) != 0)
    {
      -[AFRequestDispatcher sendMultiUserInfoWithDeviceAssistantId:multiUserInfo:]( self->_requestDispatcher,  "sendMultiUserInfoWithDeviceAssistantId:multiUserInfo:",  v6,  v8);
      goto LABEL_11;
    }

    __int16 v16 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v17 = 136315138;
    id v18 = "-[ADRequestDispatcherService sendMultiUserInfoWithDeviceAssistantId:multiUserInfo:]";
    id v13 = "%s SRD has not implemented sendMultiUserInfoWithDeviceAssistantId:multiUserInfo:isMultiUserAvailable:";
    __int16 v14 = v16;
    uint32_t v15 = 12;
    goto LABEL_7;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ADMultiUserService sharedService](&OBJC_CLASS___ADMultiUserService, "sharedService"));
  -[AFRequestDispatcher sendMultiUserInfoWithDeviceAssistantId:multiUserInfo:isRMVEnabled:]( requestDispatcher,  "sendMultiUserInfoWithDeviceAssistantId:multiUserInfo:isRMVEnabled:",  v6,  v8,  [v11 isMultiUserAvailable]);

LABEL_11:
}

- (void)startMultiUserTestRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 expectedSelectedSharedUserId:(id)a7 voiceIdConfidenceScores:(id)a8 requestContextData:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = (os_log_s *)AFSiriLogContextDaemon;
  if (v19 && v20)
  {
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v24 = "-[ADRequestDispatcherService startMultiUserTestRequestWithAssistantId:requestId:inputOrigin:utterance:expect"
            "edSelectedSharedUserId:voiceIdConfidenceScores:requestContextData:]";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%s Continuing StartMultiUserRequest through RequestDispatcher",  buf,  0xCu);
    }

    -[AFRequestDispatcher startMultiUserTestRequestWithAssistantId:requestId:inputOrigin:utterance:expectedSelectedSharedUserId:voiceIdConfidenceScores:requestContextData:]( self->_requestDispatcher,  "startMultiUserTestRequestWithAssistantId:requestId:inputOrigin:utterance:expectedSelectedSharedUserId:voiceIdConfi denceScores:requestContextData:",  v15,  v16,  v17,  v18,  v19,  v20,  v21);
  }

  else if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    id v24 = "-[ADRequestDispatcherService startMultiUserTestRequestWithAssistantId:requestId:inputOrigin:utterance:expected"
          "SelectedSharedUserId:voiceIdConfidenceScores:requestContextData:]";
    __int16 v25 = 2112;
    id v26 = v19;
    __int16 v27 = 2112;
    id v28 = v20;
    _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s Cannot continue with startMultiUserTestRequest expectedSelectedSharedUserId=%@, voiceId=%@",  buf,  0x20u);
  }
}

- (void)startTestSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 enableASR:(BOOL)a5 inputOrigin:(id)a6 location:(id)a7 jitContext:(id)a8 overrideModelPath:(id)a9 requestContextData:(id)a10
{
}

- (void)postTestResultCandidateWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5 recognitionSausage:(id)a6
{
}

- (void)postTestResultSelectedWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5
{
}

- (void)postMUXTestResultCandidateWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5 sharedUserIdToSpeechRecognitionDict:(id)a6 voiceIdConfidenceScores:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ((objc_opt_respondsToSelector( self->_requestDispatcher,  "postMUXTestResultCandidateWithRcId:sharedUserIdToSpeechRecognitionDict:voiceIdConfidenceScores:") & 1) == 0)
  {
    id v20 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v25 = "-[ADRequestDispatcherService postMUXTestResultCandidateWithAssistantId:requestId:rcId:sharedUserIdToSpeechReco"
          "gnitionDict:voiceIdConfidenceScores:]";
    id v21 = "%s SRD has not implemented postMUXTestResultCanditate() yet";
LABEL_9:
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);
    goto LABEL_7;
  }

  if (!v15)
  {
    id v20 = (os_log_s *)AFSiriLogContextDaemon;
    if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v25 = "-[ADRequestDispatcherService postMUXTestResultCandidateWithAssistantId:requestId:rcId:sharedUserIdToSpeechReco"
          "gnitionDict:voiceIdConfidenceScores:]";
    id v21 = "%s sharedUserIdToSpeechRecognitionDict is nil";
    goto LABEL_9;
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10020E250;
  v22[3] = &unk_1004FD338;
  id v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v17 = v23;
  [v15 enumerateKeysAndObjectsUsingBlock:v22];
  requestDispatcher = self->_requestDispatcher;
  id v19 = [v17 copy];
  -[AFRequestDispatcher postMUXTestResultCandidateWithAssistantId:requestId:rcId:sharedUserIdToSpeechRecognitionDict:voiceIdConfidenceScores:]( requestDispatcher,  "postMUXTestResultCandidateWithAssistantId:requestId:rcId:sharedUserIdToSpeechRecognitionDict:voiceIdConfidenceScores:",  v12,  v13,  v14,  v19,  v16);

LABEL_7:
}

- (void)postMUXTestResultSelectedWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5 voiceIdConfidenceScores:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((objc_opt_respondsToSelector( self->_requestDispatcher,  "postMUXTestResultSelectedWithRcId:voiceIdConfidenceScores:") & 1) != 0)
  {
    -[AFRequestDispatcher postMUXTestResultSelectedWithAssistantId:requestId:rcId:voiceIdConfidenceScores:]( self->_requestDispatcher,  "postMUXTestResultSelectedWithAssistantId:requestId:rcId:voiceIdConfidenceScores:",  v10,  v11,  v12,  v13);
  }

  else
  {
    id v14 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      id v16 = "-[ADRequestDispatcherService postMUXTestResultSelectedWithAssistantId:requestId:rcId:voiceIdConfidenceScores:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s SRD has not implemented postMUXTestResultSelected() yet",  (uint8_t *)&v15,  0xCu);
    }
  }
}

- (id)sanitizeVoiceTriggerEventInfo:(id)a3
{
  id v3 = a3;
  if (!v3) {
    return 0LL;
  }
  id v4 = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10020E184;
  v8[3] = &unk_1004FD338;
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = v9;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = [v5 copy];

  return v6;
}

- (void).cxx_destruct
{
}

@end