@interface ADUIService
+ (id)serviceIdentifierForRequestDelegate:(id)a3;
- (ADUIService)initWithRequestDelegate:(id)a3;
- (BOOL)_shouldWakeSystemForHandlingCommand:(id)a3 executionContext:(id)a4;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)commandsForDomain:(id)a3;
- (id)controlCenterLockRestrictedCommands;
- (id)domains;
- (id)handle;
- (void)_wakeSystemForHandlingCommand;
- (void)cancelOperationsForRequestID:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation ADUIService

- (ADUIService)initWithRequestDelegate:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ADUIService;
  v6 = -[ADUIService init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestDelegate, a3);
    id v8 = [(id)objc_opt_class(v7) serviceIdentifierForRequestDelegate:v5];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[ADService setIdentifier:](v7, "setIdentifier:", v9);

    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("ADUIServiceQueue", v11);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;
  }

  return v7;
}

- (id)handle
{
  return self->_requestDelegate;
}

- (id)domains
{
  v3[0] = SAUIGroupIdentifier;
  v3[1] = SAGLGroupIdentifier;
  v3[2] = SAPhoneGroupIdentifier;
  v3[3] = SASettingGroupIdentifier;
  v3[4] = SASmsGroupIdentifier;
  v3[5] = SAGuidanceGroupIdentifier;
  v3[6] = SAVCSGroupIdentifier;
  v3[7] = SACardGroupIdentifier;
  v3[8] = SAGroupIdentifier;
  v3[9] = SADeviceControlGroupIdentifier;
  return (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v3,  10LL));
}

- (id)commandsForDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SAGroupIdentifier])
  {
    uint64_t v24 = SAPreSynthesizeTTSClassIdentifier;
    v4 = &v24;
LABEL_26:
    uint64_t v6 = 1LL;
    goto LABEL_27;
  }

  id v5 = [v3 isEqualToString:SAPhoneGroupIdentifier];
  if ((_DWORD)v5)
  {
    if ((AFIsHorseman(v5) & 1) == 0)
    {
      uint64_t v23 = SAPhonePlayVoiceMailClassIdentifier;
      v4 = &v23;
      goto LABEL_26;
    }

    v22[0] = SAPhonePlayVoiceMailClassIdentifier;
    v22[1] = SAPhoneClientCoordinationPhoneCallClassIdentifier;
    v4 = v22;
    goto LABEL_6;
  }

  uint64_t v7 = SAGLGroupIdentifier;
  if ([v3 isEqualToString:SAGLGroupIdentifier])
  {
    uint64_t v21 = v7;
    v4 = &v21;
    goto LABEL_26;
  }

  if ([v3 isEqualToString:SAGuidanceGroupIdentifier])
  {
    uint64_t v20 = SAGuidanceGuideUpdateClassIdentifier;
    v4 = &v20;
    goto LABEL_26;
  }

  id v8 = [v3 isEqualToString:SASettingGroupIdentifier];
  if (!(_DWORD)v8)
  {
    if ([v3 isEqualToString:SASmsGroupIdentifier])
    {
      uint64_t v17 = SASmsPlayAudioClassIdentifier;
      v4 = &v17;
      goto LABEL_26;
    }

    if ([v3 isEqualToString:SAVCSGroupIdentifier])
    {
      uint64_t v16 = SAVCSAddResultsToContentShelfClassIdentifier;
      v4 = &v16;
      goto LABEL_26;
    }

    uint64_t v9 = SACardGroupIdentifier;
    if ([v3 isEqualToString:SACardGroupIdentifier])
    {
      uint64_t v15 = v9;
      v4 = &v15;
      goto LABEL_26;
    }

    if (![v3 isEqualToString:SADeviceControlGroupIdentifier])
    {
      uint64_t v10 = SAUIGroupIdentifier;
      if (![v3 isEqualToString:SAUIGroupIdentifier])
      {
        v11 = 0LL;
        goto LABEL_28;
      }

      uint64_t v13 = v10;
      v4 = &v13;
      goto LABEL_26;
    }

    v14[0] = SADeviceControlStartScreenRecordingClassIdentifier;
    v14[1] = SADeviceControlStopScreenRecordingClassIdentifier;
    v4 = v14;
LABEL_6:
    uint64_t v6 = 2LL;
    goto LABEL_27;
  }

  if (!AFIsNano(v8))
  {
    uint64_t v18 = SASettingSetUIGuidedAccessClassIdentifier;
    v4 = &v18;
    goto LABEL_26;
  }

  v19[0] = SASettingSetUIGuidedAccessClassIdentifier;
  v19[1] = SASettingGetFlashlightClassIdentifier;
  v19[2] = SASettingSetFlashlightClassIdentifier;
  v4 = v19;
  uint64_t v6 = 3LL;
LABEL_27:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v4, v6));
LABEL_28:

  return v11;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return 1;
}

- (id)controlCenterLockRestrictedCommands
{
  return 0LL;
}

- (void)cancelOperationsForRequestID:(id)a3 forAssistantID:(id)a4 fromRemote:(BOOL)a5 reason:(int64_t)a6
{
  id v8 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10025EDBC;
  block[3] = &unk_1004FC188;
  BOOL v14 = a5;
  id v12 = v8;
  uint64_t v13 = self;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (BOOL)_shouldWakeSystemForHandlingCommand:(id)a3 executionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[ADUIService _isWakeSystemSupportedOnPlatform](self, "_isWakeSystemSupportedOnPlatform")
    && [v7 isFromRemote])
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___SAUIAddViews);
    char isKindOfClass = objc_opt_isKindOfClass(v6, v8);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_wakeSystemForHandlingCommand
{
  v2 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[ADUIService _wakeSystemForHandlingCommand]";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s Waking system to handle command",  (uint8_t *)&v7,  0xCu);
  }

  id v3 = [off_100575208() sharedInstance];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = off_100575210();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  [v4 wakeSystemForReason:v6];
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  if (!objc_msgSend(v14, "_adui_shouldBeHandledByAssistantd"))
  {
    -[ADCommandCenterRequestDelegate adRequestWillReceiveCommand:]( self->_requestDelegate,  "adRequestWillReceiveCommand:",  v14);
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_10025E7F8;
    v53[3] = &unk_1004FCBB0;
    id v57 = v13;
    v53[4] = self;
    id v15 = v14;
    id v54 = v15;
    id v55 = v12;
    id v56 = v11;
    uint64_t v16 = objc_retainBlock(v53);
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (!WeakRetained)
    {
      ((void (*)(void *))v16[2])(v16);
LABEL_26:

      goto LABEL_27;
    }

    uint64_t v19 = objc_opt_class(&OBJC_CLASS___SAUIAddViews);
    if ((objc_opt_isKindOfClass(v15, v19) & 1) == 0)
    {
      uint64_t v22 = objc_opt_class(&OBJC_CLASS___SAUIAddDialogs);
      if ((objc_opt_isKindOfClass(v15, v22) & 1) == 0)
      {
LABEL_25:
        id v38 = objc_loadWeakRetained((id *)p_delegate);
        [v38 UIService:self executeHandler:v16 forCommand:v15];

        goto LABEL_26;
      }

      v47 = &self->_delegate;
      v48 = v16;
      id v23 = v15;
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 _responseModeProvider]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 fetchCurrentMode]);
      [v23 setResponseMode:v26];

      v27 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v28 = v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue([v24 _responseModeProvider]);
        v30 = (void *)objc_claimAutoreleasedReturnValue([v29 fetchCurrentMode]);
        *(_DWORD *)buf = 136315394;
        v60 = "-[ADUIService handleCommand:forDomain:executionContext:reply:]";
        __int16 v61 = 2112;
        v62 = v30;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "%s #modes Bridging addDialogs with Response Mode %@",  buf,  0x16u);
      }

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)serviceIdentifierForRequestDelegate:(id)a3
{
  id v3 = a3;
  v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"com.apple.siri.uiservice.%p",  v3);

  return v4;
}

@end