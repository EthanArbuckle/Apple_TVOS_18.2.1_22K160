@interface ADSettingsService
- (ADSettingsService)initWithRecordingInfoProvider:(id)a3 instanceContext:(id)a4;
- (CSSiriRecordingInfoProviding)recordingInfoProvider;
- (id)_wrapBoolSettingValue:(BOOL)a3;
- (void)_getNoiseManagement:(id)a3 completion:(id)a4;
- (void)_getPlaybackAudioRoute:(id)a3 completion:(id)a4;
- (void)_getVoiceOver:(id)a3 completion:(id)a4;
- (void)_getVoiceTriggerEnabled:(id)a3 completion:(id)a4;
- (void)_registerCommandHandlersWithRegistry:(id)a3;
- (void)_setBoolSetting:(id)a3 currentValueBlock:(id)a4 setValueBlock:(id)a5 completion:(id)a6;
- (void)_setNoiseManagement:(id)a3 completion:(id)a4;
- (void)_setVoiceOver:(id)a3 completion:(id)a4;
- (void)_setVoiceTriggerEnabled:(id)a3 completion:(id)a4;
@end

@implementation ADSettingsService

- (ADSettingsService)initWithRecordingInfoProvider:(id)a3 instanceContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ADSettingsService;
  v9 = -[ADBaseService init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordingInfoProvider, a3);
    v11 = v8;
    if (!v8) {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
    }
    objc_storeStrong((id *)&v10->_instanceContext, v11);
    if (!v8) {
  }
    }

  return v10;
}

- (void)_registerCommandHandlersWithRegistry:(id)a3
{
  id v7 = a3;
  int v5 = AFIsHorseman(v7, v4);
  uint64_t v6 = SASettingGroupIdentifier;
  if (v5)
  {
    -[ADBaseService _registerCommandClass:forDomain:withSelector:forRegistry:]( self,  "_registerCommandClass:forDomain:withSelector:forRegistry:",  SASettingSetVoiceTriggerEnabledStateClassIdentifier,  SASettingGroupIdentifier,  "_setVoiceTriggerEnabled:completion:",  v7);
    -[ADBaseService _registerCommandClass:forDomain:withSelector:forRegistry:]( self,  "_registerCommandClass:forDomain:withSelector:forRegistry:",  SASettingGetVoiceTriggerEnabledStateClassIdentifier,  v6,  "_getVoiceTriggerEnabled:completion:",  v7);
    -[ADBaseService _registerCommandClass:forDomain:withSelector:forRegistry:]( self,  "_registerCommandClass:forDomain:withSelector:forRegistry:",  SASettingGetVoiceOverClassIdentifier,  v6,  "_getVoiceOver:completion:",  v7);
    -[ADBaseService _registerCommandClass:forDomain:withSelector:forRegistry:]( self,  "_registerCommandClass:forDomain:withSelector:forRegistry:",  SASettingSetVoiceOverClassIdentifier,  v6,  "_setVoiceOver:completion:",  v7);
  }

  -[ADBaseService _registerCommandClass:forDomain:withSelector:forRegistry:]( self,  "_registerCommandClass:forDomain:withSelector:forRegistry:",  SASettingGetPlaybackAudioRouteClassIdentifier,  v6,  "_getPlaybackAudioRoute:completion:",  v7);
  -[ADBaseService _registerCommandClass:forDomain:withSelector:forRegistry:]( self,  "_registerCommandClass:forDomain:withSelector:forRegistry:",  SASettingGetNoiseManagementClassIdentifier,  v6,  "_getNoiseManagement:completion:",  v7);
  -[ADBaseService _registerCommandClass:forDomain:withSelector:forRegistry:]( self,  "_registerCommandClass:forDomain:withSelector:forRegistry:",  SASettingSetNoiseManagementClassIdentifier,  v6,  "_setNoiseManagement:completion:",  v7);
}

- (void)_setVoiceTriggerEnabled:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[ADSettingsService _setVoiceTriggerEnabled:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100133D30;
  v12[3] = &unk_1004F28A8;
  v12[4] = self;
  v9 = objc_retainBlock(v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100133D44;
  v11[3] = &unk_1004FB0E0;
  v11[4] = self;
  v10 = objc_retainBlock(v11);
  -[ADSettingsService _setBoolSetting:currentValueBlock:setValueBlock:completion:]( self,  "_setBoolSetting:currentValueBlock:setValueBlock:completion:",  v6,  v9,  v10,  v7);
}

- (void)_getVoiceTriggerEnabled:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    v12 = "-[ADSettingsService _getVoiceTriggerEnabled:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v11, 0xCu);
  }

  if (v7)
  {
    id v9 = -[ADSettingsService _wrapBoolSettingValue:]( self,  "_wrapBoolSettingValue:",  sub_1001EBF24(self->_instanceContext));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v7[2](v7, v10, 0LL);
  }
}

- (void)_getVoiceOver:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  BOOL v9 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (v9)
  {
    int v12 = 136315138;
    objc_super v13 = "-[ADSettingsService _getVoiceOver:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }

  if (v7)
  {
    id v10 = -[ADSettingsService _wrapBoolSettingValue:]( self,  "_wrapBoolSettingValue:",  _AXSVoiceOverTouchEnabled(v9) != 0);
    int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v7[2](v7, v11, 0LL);
  }
}

- (void)_setVoiceOver:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[ADSettingsService _setVoiceOver:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }

  -[ADSettingsService _setBoolSetting:currentValueBlock:setValueBlock:completion:]( self,  "_setBoolSetting:currentValueBlock:setValueBlock:completion:",  v6,  &stru_1004F28E8,  &stru_1004F2908,  v7);
}

- (void)_getPlaybackAudioRoute:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 audioCategory]);
  id v7 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v13 = "-[ADSettingsService _getPlaybackAudioRoute:completion:]";
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s audioCategory = %@", buf, 0x16u);
  }

  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[ADAVSystemControllerLifecycleManager sharedManager]( &OBJC_CLASS___ADAVSystemControllerLifecycleManager,  "sharedManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001339CC;
    v9[3] = &unk_1004F2930;
    id v10 = v6;
    id v11 = v5;
    [v8 getAVSystemControllerWithTimeout:v9 completion:2.0];
  }
}

- (void)_getNoiseManagement:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v8 = (void (**)(void, void, void))v6;
  if (v6)
  {
    uint64_t v43 = 0LL;
    v44 = &v43;
    uint64_t v45 = 0x3032000000LL;
    v46 = sub_100132C94;
    v47 = sub_100132CA4;
    id v48 = 0LL;
    if (AFIsHorseman(v6, v7))
    {
      int v9 = objc_alloc(&OBJC_CLASS___SACommandFailed);
      id v10 = -[SACommandFailed initWithErrorCode:]( v9,  "initWithErrorCode:",  SASettingConnectedHeadsetNoiseManagementSiriControlUnsupportedErrorCode);
      id v11 = -[SACommandFailed errorCode](v10, "errorCode");
      int v12 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  v11,  0LL));
      ((void (**)(void, SACommandFailed *, dispatch_group_s *))v8)[2](v8, v10, v12);
    }

    else
    {
      objc_super v13 = dispatch_group_create();
      dispatch_group_enter(v13);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_1001337B4;
      v40[3] = &unk_1004F30F0;
      v42 = &v43;
      int v12 = v13;
      v41 = v12;
      +[ADCoreBluetoothManager retrieveConnectedDevicesInfoWithCompletion:]( &OBJC_CLASS___ADCoreBluetoothManager,  "retrieveConnectedDevicesInfoWithCompletion:",  v40);
      dispatch_time_t v14 = dispatch_time(0LL, 4000000000LL);
      dispatch_group_wait(v12, v14);
      if (v44[5])
      {
        uint64_t v36 = 0LL;
        v37 = &v36;
        uint64_t v38 = 0x2020000000LL;
        char v39 = 1;
        dispatch_group_enter(v12);
        uint64_t v32 = 0LL;
        v33 = &v32;
        uint64_t v34 = 0x2020000000LL;
        uint64_t v35 = 0LL;
        v15 = (void *)v44[5];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_1001339AC;
        v28[3] = &unk_1004F2958;
        v30 = &v32;
        v31 = &v36;
        v16 = v12;
        v29 = v16;
        [v15 getHeadphoneListeningMode:v28];
        dispatch_time_t v17 = dispatch_time(0LL, 4000000000LL);
        dispatch_group_wait(v16, v17);
        if (*((_BYTE *)v37 + 24))
        {
          v18 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v50 = "-[ADSettingsService _getNoiseManagement:completion:]";
            _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s Bluetooth device time outed while checking current listening mode",  buf,  0xCu);
          }

          id v10 = (SACommandFailed *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  SASettingNoHeadsetConnectedErrorCode,  0LL));
          v19 = -[SACommandFailed initWithErrorCode:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithErrorCode:",  -[SACommandFailed code](v10, "code"));
          ((void (**)(void, SACommandFailed *, SACommandFailed *))v8)[2](v8, v19, v10);
        }

        else
        {
          v19 = (SACommandFailed *)SASettingNoiseManagementOptionOFFValue;
          v22 = (id *)&SASettingNoiseManagementOptionAUDIO_TRANSPARENCYValue;
          switch(v33[3])
          {
            case 0LL:
            case 1LL:
              v23 = (os_log_s *)AFSiriLogContextDaemon;
              if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v50 = "-[ADSettingsService _getNoiseManagement:completion:]";
                _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s Bluetooth device does not support Siri noise management",  buf,  0xCu);
              }

              id v10 = (SACommandFailed *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  SASettingConnectedHeadsetNoiseManagementSiriControlUnsupportedErrorCode,  0LL));
              if (!v10) {
                break;
              }
              v24 = -[SACommandFailed initWithErrorCode:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithErrorCode:",  -[SACommandFailed code](v10, "code"));
              ((void (**)(void, SACommandFailed *, SACommandFailed *))v8)[2](v8, v24, v10);
              goto LABEL_21;
            case 3LL:
              v22 = (id *)&SASettingNoiseManagementOptionNOISE_CANCELLATIONValue;
              goto LABEL_17;
            case 4LL:
              goto LABEL_17;
            case 5LL:
              v22 = (id *)&SASettingNoiseManagementOptionAUTOMATICValue;
LABEL_17:
              v25 = (SACommandFailed *)*v22;

              v19 = v25;
              break;
            default:
              break;
          }

          v26 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v50 = "-[ADSettingsService _getNoiseManagement:completion:]";
            __int16 v51 = 2112;
            v52 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "%s Done getting bluetooth device noise management: %@",  buf,  0x16u);
          }

          v24 = (SACommandFailed *)objc_alloc_init(&OBJC_CLASS___SASettingNoiseManagementEntity);
          -[SACommandFailed setValue:](v24, "setValue:", v19);
          id v27 = objc_alloc_init(&OBJC_CLASS___SASettingGetNoiseManagementResponse);
          [v27 setSetting:v24];
          ((void (**)(void, id, void))v8)[2](v8, v27, 0LL);

          id v10 = 0LL;
LABEL_21:
        }

        _Block_object_dispose(&v32, 8);
        _Block_object_dispose(&v36, 8);
      }

      else
      {
        id v20 = sub_100132EAC(0LL, 0LL);
        id v10 = (SACommandFailed *)objc_claimAutoreleasedReturnValue(v20);
        v21 = -[SACommandFailed initWithErrorCode:]( objc_alloc(&OBJC_CLASS___SACommandFailed),  "initWithErrorCode:",  -[SACommandFailed code](v10, "code"));
        ((void (**)(void, SACommandFailed *, SACommandFailed *))v8)[2](v8, v21, v10);
      }
    }

    _Block_object_dispose(&v43, 8);
  }
}

- (void)_setNoiseManagement:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v8 = (void (**)(void, void, void))v6;
  if (!v6) {
    goto LABEL_39;
  }
  if (AFIsHorseman(v6, v7))
  {
    int v9 = objc_alloc(&OBJC_CLASS___SACommandFailed);
    id v10 = -[SACommandFailed initWithErrorCode:]( v9,  "initWithErrorCode:",  SASettingConnectedHeadsetNoiseManagementSiriControlUnsupportedErrorCode);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kAFAssistantErrorDomain,  -[SACommandFailed errorCode](v10, "errorCode"),  0LL));
    ((void (**)(void, SACommandFailed *, void *))v8)[2](v8, v10, v11);

    goto LABEL_39;
  }

  uint64_t v73 = 0LL;
  v74 = &v73;
  uint64_t v75 = 0x3032000000LL;
  v76 = sub_100132C94;
  v77 = sub_100132CA4;
  v78 = objc_alloc_init(&OBJC_CLASS___AFQueue);
  int v12 = dispatch_group_create();
  uint64_t v69 = 0LL;
  v70 = &v69;
  uint64_t v71 = 0x2020000000LL;
  uint64_t v72 = 0LL;
  v42 = (void *)objc_claimAutoreleasedReturnValue([v5 noiseManagementOption]);
  if ([v42 isEqualToString:SASettingNoiseManagementOptionNOISE_CANCELLATIONValue])
  {
    uint64_t v13 = 3LL;
LABEL_12:
    v70[3] = v13;
    goto LABEL_13;
  }

  if ([v42 isEqualToString:SASettingNoiseManagementOptionAUDIO_TRANSPARENCYValue])
  {
    uint64_t v13 = 4LL;
    goto LABEL_12;
  }

  if ([v42 isEqualToString:SASettingNoiseManagementOptionAUTOMATICValue])
  {
    uint64_t v13 = 5LL;
    goto LABEL_12;
  }

  if ([v42 isEqualToString:SASettingNoiseManagementOptionOFFValue])
  {
    uint64_t v13 = 2LL;
    goto LABEL_12;
  }

- (id)_wrapBoolSettingValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___SASettingGetBoolResponse);
  id v5 = objc_alloc_init(&OBJC_CLASS___SASettingBooleanEntity);
  [v5 setValue:v3];
  [v4 setSetting:v5];

  return v4;
}

- (void)_setBoolSetting:(id)a3 currentValueBlock:(id)a4 setValueBlock:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = (void (**)(id, id))a5;
  id v11 = (void (**)(id, id, void))a6;
  uint64_t v12 = (*((uint64_t (**)(id))a4 + 2))(a4);
  else {
    id v13 = [v9 value];
  }
  if ((_DWORD)v12 == (_DWORD)v13)
  {
    dispatch_time_t v14 = objc_alloc(&OBJC_CLASS___SACommandFailed);
    dispatch_time_t v15 = &SASettingValueUnchangedErrorCode;
    goto LABEL_9;
  }

  if ((v13 & 1) == 0 && [v9 failOnSiriDisconnectWarnings])
  {
    dispatch_time_t v14 = objc_alloc(&OBJC_CLASS___SACommandFailed);
    dispatch_time_t v15 = &SASettingSiriDisconnectErrorCode;
LABEL_9:
    v16 = -[SACommandFailed initWithErrorCode:](v14, "initWithErrorCode:", *v15);
    goto LABEL_13;
  }

  v16 = (SACommandFailed *)objc_alloc_init(&OBJC_CLASS___SASettingSetBoolResponse);
  id v17 = objc_alloc_init(&OBJC_CLASS___SASettingBooleanEntity);
  dispatch_time_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v12));
  [v17 setPreviousValue:v18];

  [v17 setValue:v13];
  -[SACommandFailed setSetting:](v16, "setSetting:", v17);

LABEL_13:
  v19 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v20 = v19;
    v21 = (objc_class *)objc_opt_class(v9);
    id v22 = NSStringFromClass(v21);
    unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    unsigned int v24 = [v9 dryRun];
    v25 = @"Set";
    int v28 = 136316418;
    id v29 = "-[ADSettingsService _setBoolSetting:currentValueBlock:setValueBlock:completion:]";
    if (v24) {
      v25 = @"Dry Run";
    }
    __int16 v30 = 2112;
    v33 = v25;
    id v26 = @"ON";
    v31 = v23;
    __int16 v32 = 2112;
    if ((_DWORD)v12) {
      id v27 = @"ON";
    }
    else {
      id v27 = @"OFF";
    }
    __int16 v34 = 2112;
    uint64_t v35 = v27;
    if (!(_DWORD)v13) {
      id v26 = @"OFF";
    }
    __int16 v36 = 2112;
    v37 = v26;
    __int16 v38 = 2112;
    char v39 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s %@ (%@ / prev: %@ / value: %@ / %@)",  (uint8_t *)&v28,  0x3Eu);
  }

  if (v11) {
    v11[2](v11, v16, 0LL);
  }
}

- (CSSiriRecordingInfoProviding)recordingInfoProvider
{
  return self->_recordingInfoProvider;
}

- (void).cxx_destruct
{
}

@end