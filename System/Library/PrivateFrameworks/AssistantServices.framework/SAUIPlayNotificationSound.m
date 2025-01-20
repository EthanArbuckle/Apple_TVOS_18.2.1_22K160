@interface SAUIPlayNotificationSound
- (BOOL)_adui_shouldBeHandledByAssistantd;
- (id)_soundURLForAnnouncePlatform:(int64_t)a3;
- (int64_t)_soundIDForAnnouncePlatform:(int64_t)a3;
- (void)_adui_handleWithCompletion:(id)a3;
@end

@implementation SAUIPlayNotificationSound

- (BOOL)_adui_shouldBeHandledByAssistantd
{
  return 1;
}

- (int64_t)_soundIDForAnnouncePlatform:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIPlayNotificationSound notificationType](self, "notificationType"));

  if (!v5) {
    return 0LL;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIPlayNotificationSound notificationType](self, "notificationType"));
  unsigned int v7 = [v6 isEqualToString:SANotificationTypeIncomingMessageValue];

  if (v7)
  {
    if (a3 == 2) {
      return 7LL;
    }
    else {
      return 4LL;
    }
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIPlayNotificationSound notificationType](self, "notificationType"));
    unsigned int v10 = [v9 isEqualToString:SANotificationTypeIncomingHomeCommunicationValue];

    if (v10) {
      return 6LL;
    }
    else {
      return 0LL;
    }
  }

- (id)_soundURLForAnnouncePlatform:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIPlayNotificationSound notificationType](self, "notificationType"));
  unsigned int v6 = [v5 isEqualToString:SANotificationTypeConnectedCallValue];

  if (v6) {
    return  -[NSURL initFileURLWithPath:isDirectory:]( objc_alloc(&OBJC_CLASS___NSURL),  "initFileURLWithPath:isDirectory:",  @"/System/Library/Audio/UISounds/nano/vc~invitation-accepted.caf",  0LL);
  }
  int64_t v8 = -[SAUIPlayNotificationSound _soundIDForAnnouncePlatform:](self, "_soundIDForAnnouncePlatform:", a3);
  if (v8)
  {
    int64_t v9 = v8;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[AFBundleResourceManager sharedManager](&OBJC_CLASS___AFBundleResourceManager, "sharedManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 URLForSoundID:v9]);

    return v11;
  }

  else
  {
    v12 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIPlayNotificationSound notificationType](self, "notificationType"));
      int v15 = 136315394;
      v16 = "-[SAUIPlayNotificationSound(ADUIService) _soundURLForAnnouncePlatform:]";
      __int16 v17 = 2112;
      v18 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s Unsupported notificationType: %@",  (uint8_t *)&v15,  0x16u);
    }

    return 0LL;
  }

- (void)_adui_handleWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[SAUIPlayNotificationSound(ADUIService) _adui_handleWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  unsigned int v6 = objc_alloc(&OBJC_CLASS___AFTwoArgumentSafetyBlock);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10025F874;
  v46[3] = &unk_1004F8D20;
  v46[4] = self;
  id v7 = v4;
  id v47 = v7;
  int64_t v8 = -[AFTwoArgumentSafetyBlock initWithBlock:defaultValue1:defaultValue2:]( v6,  "initWithBlock:defaultValue1:defaultValue2:",  v46,  0LL,  0LL);
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[ADExternalNotificationRequestHandler sharedNotificationRequestHandler]( &OBJC_CLASS___ADExternalNotificationRequestHandler,  "sharedNotificationRequestHandler"));
  id v11 = [v10 announcePlatformForCurrentRequest];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIPlayNotificationSound _soundURLForAnnouncePlatform:](self, "_soundURLForAnnouncePlatform:", v11));
  v13 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v49 = "-[SAUIPlayNotificationSound(ADUIService) _adui_handleWithCompletion:]";
    __int16 v50 = 2112;
    v51 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Chose sound URL: %@", buf, 0x16u);
  }

  if (v12)
  {
    id v32 = v7;
    v33 = v8;
    id v14 = objc_alloc(&OBJC_CLASS___AFAudioPlaybackRequest);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_10025F978;
    v43[3] = &unk_1004F7D08;
    v44 = v12;
    v45 = self;
    id v15 = [v14 initWithBuilder:v43];
    v16 = objc_alloc(&OBJC_CLASS___AFSpeechRequestOptions);
    if (v11 == (id)2) {
      uint64_t v17 = 32LL;
    }
    else {
      uint64_t v17 = 21LL;
    }
    v18 = -[AFSpeechRequestOptions initWithActivationEvent:](v16, "initWithActivationEvent:", v17);
    -[AFSpeechRequestOptions setAnnouncementPlatform:](v18, "setAnnouncementPlatform:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIPlayNotificationSound notificationType](self, "notificationType"));
    unsigned int v20 = [v19 isEqualToString:SANotificationTypeConnectedCallValue];

    if (v20)
    {
      v21 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v49 = "-[SAUIPlayNotificationSound(ADUIService) _adui_handleWithCompletion:]";
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "%s Related reply to announce incoming request",  buf,  0xCu);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
      [v22 logEventWithType:6011 context:0];

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIPlayNotificationSound notificationId](self, "notificationId"));
      if (!v23)
      {
        v31 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
        int64_t v8 = v33;
        -[AFTwoArgumentSafetyBlock invokeWithValue:andValue:](v33, "invokeWithValue:andValue:", v31, 0LL);
LABEL_21:

        v30 = v44;
        id v7 = v32;
        goto LABEL_22;
      }

      -[AFSpeechRequestOptions setIsOnPhoneCall:](v18, "setIsOnPhoneCall:", 1LL);
    }

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10025FA0C;
    v36[3] = &unk_1004F7DA8;
    v24 = v9;
    v37 = v24;
    v38 = v18;
    char v42 = v20;
    id v39 = v15;
    id v41 = v11;
    v40 = v33;
    v25 = objc_retainBlock(v36);
    v26 = v25;
    if ((v20 & 1) != 0)
    {
      dispatch_time_t v27 = dispatch_time(0LL, 750000000LL);
      v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SACommandSucceeded _queue](v24, "_queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10025FB14;
      block[3] = &unk_1004FC838;
      id v35 = v26;
      dispatch_after(v27, v28, block);
    }

    else
    {
      ((void (*)(void *))v25[2])(v25);
    }

    v31 = v37;
    int64_t v8 = v33;
    goto LABEL_21;
  }

  v29 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[SAUIPlayNotificationSound(ADUIService) _adui_handleWithCompletion:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%s Error resolving sound URL for SAUIPlayNotificationSound",  buf,  0xCu);
  }

  v30 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  -[AFTwoArgumentSafetyBlock invokeWithValue:andValue:](v8, "invokeWithValue:andValue:", v30, 0LL);
LABEL_22:
}

@end