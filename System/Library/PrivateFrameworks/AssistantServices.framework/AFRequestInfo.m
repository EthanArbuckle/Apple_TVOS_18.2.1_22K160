@interface AFRequestInfo
+ (id)_announceIncomingCallRequestInfoFromRequest:(id)a3;
+ (id)_announceNotificationRequestInfoFromNotificationRequest:(id)a3 previousRequest:(id)a4 synchronousBurstIndex:(unint64_t)a5 isMediaPlaying:(BOOL)a6;
+ (id)_createAnnounceInHomeRequestFromSKIAnnouncePayload:(id)a3;
+ (id)_createAnnounceIncomingCallRequest:(id)a3;
+ (id)_createAnnounceWorkoutReminderRequestFromSKIAnnouncePayload:(id)a3 announceNotificationRequest:(id)a4;
+ (id)_createAnnounceWorkoutVoiceFeedbackRequestFromSKIAnnouncePayload:(id)a3 skiAnnouncePayload:(id)a4;
+ (id)_updateStartLocalRequest:(id)a3 withNewAnnouncePayload:(id)a4 forAnnouncementType:(int64_t)a5;
+ (id)requestInfoFromAnnouncementRequest:(id)a3 previousRequest:(id)a4 synchronousBurstIndex:(unint64_t)a5 isMediaPlaying:(BOOL)a6;
- (id)_ad_localRequestCommandWithRequestHelper:(id)a3;
- (id)_ad_requestCommandWithRequestHelper:(id)a3;
- (id)_ad_speechRequestOptionsWithClientConfiguration:(id)a3;
- (void)_ad_setHandoffPayload:(id)a3;
@end

@implementation AFRequestInfo

- (id)_ad_requestCommandWithRequestHelper:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AFRequestInfo notifyState](self, "notifyState"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteRequestInfo]);
    v7 = sub_10021CF28(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue([v6 handoffURLString]);
      -[AFRequestInfo setHandoffURLString:](self, "setHandoffURLString:", v9);
    }
  }

  else
  {
    v10 = sub_10021CF28(self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  return v8;
}

- (id)_ad_localRequestCommandWithRequestHelper:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AFRequestInfo startLocalRequest](self, "startLocalRequest"));
  if (!v5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AFRequestInfo notifyState](self, "notifyState"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteRequestInfo]);
      v5 = (void *)objc_claimAutoreleasedReturnValue([v6 startLocalRequest]);
    }
  }

  return v5;
}

- (id)_ad_speechRequestOptionsWithClientConfiguration:(id)a3
{
  id v4 = a3;
  v5 = (AFSpeechRequestOptions *)objc_claimAutoreleasedReturnValue(-[AFRequestInfo speechRequestOptions](self, "speechRequestOptions"));
  if (v5) {
    goto LABEL_18;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AFRequestInfo handoffRequestData](self, "handoffRequestData"));
  if (v6)
  {

    goto LABEL_5;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AFRequestInfo notifyState](self, "notifyState"));

  if (v7)
  {
LABEL_5:
    v8 = -[AFSpeechRequestOptions initWithActivationEvent:]( objc_alloc(&OBJC_CLASS___AFSpeechRequestOptions),  "initWithActivationEvent:",  1LL);
    v5 = v8;
    if (v8) {
      goto LABEL_18;
    }
  }

  v10 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315138;
    v17 = "-[AFRequestInfo(SiriAce) _ad_speechRequestOptionsWithClientConfiguration:]";
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "%s Drop in Announcement. Setting SmartSiriVolumeTTSType with AFSpeechEventHomeButton.",  (uint8_t *)&v16,  0xCu);
  }

  v5 = -[AFSpeechRequestOptions initWithActivationEvent:]( objc_alloc(&OBJC_CLASS___AFSpeechRequestOptions),  "initWithActivationEvent:",  1LL);
  -[AFSpeechRequestOptions setSmartSiriVolumeTTSType:](v5, "setSmartSiriVolumeTTSType:", 5LL);
  if (!v5)
  {
LABEL_12:
    if (-[AFRequestInfo activationEvent](self, "activationEvent") != (id)6
      && -[AFRequestInfo activationEvent](self, "activationEvent") != (id)9)
    {
      goto LABEL_17;
    }

    unsigned int v11 = [v4 isDeviceInStarkMode];
    v12 = objc_alloc(&OBJC_CLASS___AFSpeechRequestOptions);
    if (v11)
    {
      v5 = -[AFSpeechRequestOptions initWithActivationEvent:](v12, "initWithActivationEvent:", 32LL);
      -[AFSpeechRequestOptions setAnnouncementPlatform:](v5, "setAnnouncementPlatform:", 2LL);
      if (!v5) {
        goto LABEL_17;
      }
    }

    else
    {
      v5 = -[AFSpeechRequestOptions initWithActivationEvent:](v12, "initWithActivationEvent:", 21LL);
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[ADExternalNotificationRequestHandler sharedNotificationRequestHandler]( &OBJC_CLASS___ADExternalNotificationRequestHandler,  "sharedNotificationRequestHandler"));
      id v14 = [v13 announcePlatformForCurrentRequest];

      -[AFSpeechRequestOptions setAnnouncementPlatform:](v5, "setAnnouncementPlatform:", v14);
      -[AFSpeechRequestOptions setEndpointerOperationMode:](v5, "setEndpointerOperationMode:", 3LL);
      if (!v5) {
LABEL_17:
      }
        v5 = 0LL;
    }
  }

- (void)_ad_setHandoffPayload:(id)a3
{
}

+ (id)requestInfoFromAnnouncementRequest:(id)a3 previousRequest:(id)a4 synchronousBurstIndex:(unint64_t)a5 isMediaPlaying:(BOOL)a6
{
  BOOL v7 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = [v11 requestType];
  if (v13)
  {
    if (v13 == (id)2)
    {
      int v16 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v18 = 136315138;
        v19 = "+[AFRequestInfo(ADAnnouncementRequestBuilder) requestInfoFromAnnouncementRequest:previousRequest:synchrono"
              "usBurstIndex:isMediaPlaying:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "%s Creating announce incoming call request",  (uint8_t *)&v18,  0xCu);
      }

      uint64_t v14 = objc_claimAutoreleasedReturnValue([a1 _announceIncomingCallRequestInfoFromRequest:v11]);
      goto LABEL_11;
    }

    if (v13 == (id)1)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue( [a1 _announceNotificationRequestInfoFromNotificationRequest:v11 previousRequest:v12 synchronousBurstIndex:a5 isMediaPlaying:v7]);
LABEL_11:
      v6 = (void *)v14;
    }
  }

  else
  {
    v15 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      v19 = "+[AFRequestInfo(ADAnnouncementRequestBuilder) requestInfoFromAnnouncementRequest:previousRequest:synchronous"
            "BurstIndex:isMediaPlaying:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s Unspecified announcement request type unable to create a request.",  (uint8_t *)&v18,  0xCu);
    }

    v6 = 0LL;
  }

  return v6;
}

+ (id)_announceNotificationRequestInfoFromNotificationRequest:(id)a3 previousRequest:(id)a4 synchronousBurstIndex:(unint64_t)a5 isMediaPlaying:(BOOL)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = objc_alloc_init(&OBJC_CLASS___AFRequestInfo);
  -[AFRequestInfo setActivationEvent:](v10, "setActivationEvent:", 6LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 notification]);
  id v12 = [v8 platform];
  if ([v9 requestType] == (id)1)
  {
    id v13 = v9;
    id v14 = [v13 announcementType];
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 appID]);

    if (v15) {
      int v16 = v15;
    }
    else {
      int v16 = &stru_1004FECA0;
    }
    v42 = v16;
  }

  else
  {
    v42 = &stru_1004FECA0;
    id v14 = 0LL;
  }

  id v17 = [v8 announcementType];
  v43 = (void *)objc_claimAutoreleasedReturnValue([v8 appID]);
  int v18 = (void *)objc_claimAutoreleasedReturnValue([v9 timeOfRequestArrival]);
  [v18 timeIntervalSinceNow];
  double v20 = -v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
    v46 = v22;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
  }

  BOOL v23 = v17 == v14;
  LOBYTE(v39) = a6;
  v24 = (__CFString *)v42;
  id v25 = [[SKIAnnounceNotificationDirectInvocationPayload alloc] initWithNotification:v11 appBundleId:v43 appBundleIdOfLastAnnouncement:v42 synchronousBurstIndex:a5 isSameTypeAsLastAnnouncem ent:v23 timeSinceLastAnnouncement:v12 announcementPlatform:v20 isMediaPlaying:v39 summaries:v21];
  v26 = (void *)objc_claimAutoreleasedReturnValue([v8 startLocalRequest]);

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue([v8 startLocalRequest]);
    id v28 = [(id)objc_opt_class(a1) _updateStartLocalRequest:v27 withNewAnnouncePayload:v25 forAnnouncementType:v17];
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    -[AFRequestInfo setStartLocalRequest:](v10, "setStartLocalRequest:", v29);
    v30 = v10;
  }

  else
  {
    switch((unint64_t)v17)
    {
      case 0uLL:
        v31 = (os_log_s *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v45 = "+[AFRequestInfo(ADAnnouncementRequestBuilder) _announceNotificationRequestInfoFromNotificationRequest:pr"
                "eviousRequest:synchronousBurstIndex:isMediaPlaying:]";
          _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s Unspecified announcement type unable to create a request.",  buf,  0xCu);
        }

        v30 = 0LL;
        goto LABEL_26;
      case 1uLL:
        uint64_t v33 = objc_claimAutoreleasedReturnValue( +[SKIMessagesInvocation announceMessagesRequestFromAnnounceDirectInvocationPayload:]( &OBJC_CLASS___SKIMessagesInvocation,  "announceMessagesRequestFromAnnounceDirectInvocationPayload:",  v25));
        goto LABEL_23;
      case 2uLL:
        id v34 = [(id)objc_opt_class(a1) _createAnnounceInHomeRequestFromSKIAnnouncePayload:v25];
        uint64_t v33 = objc_claimAutoreleasedReturnValue(v34);
        goto LABEL_23;
      case 3uLL:
        uint64_t v33 = objc_claimAutoreleasedReturnValue( +[SKINotificationsInvocation announceNotificationsRequestFromAnnounceDirectInvocationPayload:]( &OBJC_CLASS___SKINotificationsInvocation,  "announceNotificationsRequestFromAnnounceDirectInvocationPayload:",  v25));
        goto LABEL_23;
      case 4uLL:
        uint64_t v33 = objc_claimAutoreleasedReturnValue( +[SKINotebookInvocation announceRemindersRequestFromAnnounceDirectInvocationPayload:]( &OBJC_CLASS___SKINotebookInvocation,  "announceRemindersRequestFromAnnounceDirectInvocationPayload:",  v25));
        goto LABEL_23;
      case 5uLL:
        uint64_t v33 = objc_claimAutoreleasedReturnValue( +[SKIPhoneInvocation announceVoicemailRequestForAnnounceDirectInvocationPayload:]( &OBJC_CLASS___SKIPhoneInvocation,  "announceVoicemailRequestForAnnounceDirectInvocationPayload:",  v25));
        goto LABEL_23;
      case 6uLL:
        uint64_t v33 = objc_claimAutoreleasedReturnValue( +[SKIPhoneInvocation announceGroupFaceTimeRequestForAnnounceDirectInvocationPayload:]( &OBJC_CLASS___SKIPhoneInvocation,  "announceGroupFaceTimeRequestForAnnounceDirectInvocationPayload:",  v25));
        goto LABEL_23;
      case 7uLL:
        uint64_t v33 = objc_claimAutoreleasedReturnValue( +[SKIPhoneInvocation announceIncomingCallNotificationRequest:]( &OBJC_CLASS___SKIPhoneInvocation,  "announceIncomingCallNotificationRequest:",  v25));
LABEL_23:
        v32 = (void *)v33;
        goto LABEL_24;
      case 8uLL:
        id v36 = [(id)objc_opt_class(a1) _createAnnounceWorkoutReminderRequestFromSKIAnnouncePayload:v25 announceNotificationRequest:v8];
        uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);
        goto LABEL_29;
      case 9uLL:
        id v38 = [(id)objc_opt_class(a1) _createAnnounceWorkoutVoiceFeedbackRequestFromSKIAnnouncePayload:v8 skiAnnouncePayload:v25];
        uint64_t v37 = objc_claimAutoreleasedReturnValue(v38);
LABEL_29:
        v32 = (void *)v37;
        if (v37) {
          goto LABEL_24;
        }
        v30 = 0LL;
        break;
      default:
        v32 = 0LL;
LABEL_24:
        -[AFRequestInfo setStartLocalRequest:](v10, "setStartLocalRequest:", v32);
        v30 = v10;

        break;
    }

    v24 = (__CFString *)v42;
  }

+ (id)_updateStartLocalRequest:(id)a3 withNewAnnouncePayload:(id)a4 forAnnouncementType:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SKIFitnessInvocation updateStartLocalRequest:withNewAnnouncePayload:]( &OBJC_CLASS___SKIFitnessInvocation,  "updateStartLocalRequest:withNewAnnouncePayload:",  v7,  v8));
  }

  else
  {
    v10 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      id v12 = v10;
      uint64_t Name = AFSiriUserNotificationAnnouncementTypeGetName(a5);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(Name);
      int v15 = 136315394;
      int v16 = "+[AFRequestInfo(ADAnnouncementRequestBuilder) _updateStartLocalRequest:withNewAnnouncePayload:forAnnouncementType:]";
      __int16 v17 = 2112;
      int v18 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Remote announcements not supported for announcement type: %@",  (uint8_t *)&v15,  0x16u);
    }

    id v9 = 0LL;
  }

  return v9;
}

+ (id)_createAnnounceWorkoutVoiceFeedbackRequestFromSKIAnnouncePayload:(id)a3 skiAnnouncePayload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 announcementType] == (id)9
    && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___ADAnnounceWorkoutVoiceFeedbackRequest),
        (objc_opt_isKindOfClass(v5, v7) & 1) != 0))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 data]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SKIFitnessInvocation announceWorkoutVoiceFeedback:announcePayload:]( &OBJC_CLASS___SKIFitnessInvocation,  "announceWorkoutVoiceFeedback:announcePayload:",  v8,  v6));
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (id)_createAnnounceWorkoutReminderRequestFromSKIAnnouncePayload:(id)a3 announceNotificationRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___ADAnnounceWorkoutReminderRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 workoutReminder]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[SKIFitnessInvocation announceWorkoutReminder:announcePayload:]( &OBJC_CLASS___SKIFitnessInvocation,  "announceWorkoutReminder:announcePayload:",  v8,  v5));
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (id)_createAnnounceInHomeRequestFromSKIAnnouncePayload:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 notification]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 request]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 content]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);

  id v8 = off_100576450();
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v9]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  if (v10 == v11)
  {
    uint64_t v12 = 1LL;
  }

  else if ([v10 integerValue] == (id)1)
  {
    uint64_t v12 = 2LL;
  }

  else
  {
    uint64_t v12 = 1LL;
  }

  id v13 = off_100576458();
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  int v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v14]);

  int v16 = (void *)objc_claimAutoreleasedReturnValue([v3 appBundleId]);
  id v17 = [v3 synchronousBurstIndex];

  int v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v17));
  double v19 = (void *)objc_claimAutoreleasedReturnValue( +[SKIPhoneInvocation announceHomeAnnouncementRequestFromApp:withAnnouncementIdentifier:withUserNotificationType:synchronousBurstIndex:]( &OBJC_CLASS___SKIPhoneInvocation,  "announceHomeAnnouncementRequestFromApp:withAnnouncementIdentifier:withUserNotificationType:synchronousBurstIndex:",  v16,  v15,  v12,  v18));

  return v19;
}

+ (id)_announceIncomingCallRequestInfoFromRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___AFRequestInfo);
  id v6 = [(id)objc_opt_class(a1) _createAnnounceIncomingCallRequest:v4];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  id v8 = objc_alloc(&OBJC_CLASS___AFRequestCompletionOptions);
  uint64_t v9 = _AFPreferencesSpokenNotificationShowUIDuringTriggerlessListening();
  id v10 = [v8 _initWithShowUIDuringListening:v9 playAlertBeforeListening:_AFPreferencesSpokenNotificationPlayAlertBeforeTriggerlessListening()];
  -[AFRequestInfo setStartLocalRequest:](v5, "setStartLocalRequest:", v7);
  -[AFRequestInfo setActivationEvent:](v5, "setActivationEvent:", 9LL);
  -[AFRequestInfo setRequestCompletionOptions:](v5, "setRequestCompletionOptions:", v10);

  return v5;
}

+ (id)_createAnnounceIncomingCallRequest:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 call]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 callUUID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 callProviderIdentifier]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 callProviderBundleID]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 callerContactIdentifiers]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 handle]);
  id v9 = [v3 isVideo];
  LOBYTE(v12) = [v3 isCallerIDBlocked];
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SKIPhoneInvocation announceIncomingCallerRequestForCallUUID:callProviderIdentifier:callProviderBundleId:callerContactIdentifiers:handle:isVideo:isCallerIDBlocked:]( &OBJC_CLASS___SKIPhoneInvocation,  "announceIncomingCallerRequestForCallUUID:callProviderIdentifier:callProviderBundleId:callerContactId entifiers:handle:isVideo:isCallerIDBlocked:",  v4,  v5,  v6,  v7,  v8,  v9,  v12));

  return v10;
}

@end