@interface TUCall
- (BOOL)disconnectedReasonRequiresCallBackUI;
- (BOOL)disconnectedReasonRequiresCallFailureUI;
- (BOOL)hasSendCustomMessageCapability;
- (BOOL)hasSendMessageCapability;
- (BOOL)shouldPlayInCallSounds;
- (BOOL)shouldShowAutomaticTelephonyCallFallback;
- (BOOL)shouldShowFailureAlert;
- (BOOL)supportsSendMessageIntent;
- (id)sendMessageIntentExtension;
@end

@implementation TUCall

- (BOOL)disconnectedReasonRequiresCallBackUI
{
  unsigned int v3 = -[TUCall disconnectedReason](self, "disconnectedReason");
  LOBYTE(v4) = 0;
  if (v3 > 0x18 || ((1 << v3) & 0x1C2C020) == 0) {
    return v4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeConversationForCall:self]);

  if (v6)
  {
    unsigned int v7 = [v6 isOneToOneModeEnabled];
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall remoteParticipantHandles](self, "remoteParticipantHandles"));
    unsigned int v7 = [v8 count] == (id)1;
  }

  unsigned int v9 = +[PHInCallUIUtilities isSpringBoardPasscodeLocked]( &OBJC_CLASS___PHInCallUIUtilities,  "isSpringBoardPasscodeLocked");
  if (!-[TUCall isIncoming](self, "isIncoming"))
  {
    if ((v9 & 1) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    unsigned int v4 = -[TUCall isConversation](self, "isConversation") ^ 1 | v7;
    goto LABEL_11;
  }

- (BOOL)disconnectedReasonRequiresCallFailureUI
{
  unsigned int v2 = -[TUCall disconnectedReason](self, "disconnectedReason");
  return (v2 < 0x19) & (0x1C24000u >> v2);
}

- (BOOL)shouldShowFailureAlert
{
  if (-[TUCall status](self, "status") == 6)
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall errorAlertTitle](self, "errorAlertTitle"));
    if (v3)
    {
      unsigned int v4 = !-[TUCall shouldShowAutomaticTelephonyCallFallback](self, "shouldShowAutomaticTelephonyCallFallback");
    }

    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall errorAlertMessage](self, "errorAlertMessage"));
      if (v5) {
        unsigned int v4 = !-[TUCall shouldShowAutomaticTelephonyCallFallback](self, "shouldShowAutomaticTelephonyCallFallback");
      }
      else {
        LOBYTE(v4) = 0;
      }
    }
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)shouldShowAutomaticTelephonyCallFallback
{
  unsigned int v3 = -[TUCall disconnectedReason](self, "disconnectedReason");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall provider](self, "provider"));
  if ([v4 isFaceTimeProvider]
    && (-[TUCall isVideo](self, "isVideo") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall remoteParticipantHandles](self, "remoteParticipantHandles"));
    if ([v6 count] == (id)1 && (v3 == 49 || v3 == 30)) {
      char v5 = TUDefaultAppsEnabled(0LL);
    }
    else {
      char v5 = 0;
    }
  }

  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)shouldPlayInCallSounds
{
  unsigned int v3 = -[TUCall needsManualInCallSounds](self, "needsManualInCallSounds");
  if (v3) {
    LOBYTE(v3) = -[TUCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice");
  }
  return v3;
}

- (BOOL)hasSendMessageCapability
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall provider](self, "provider"));
  if ([v3 isSystemProvider])
  {
    BOOL v4 = 1;
  }

  else
  {
    char v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall sendMessageIntentExtension](self, "sendMessageIntentExtension"));
    BOOL v4 = v5 != 0LL;
  }

  return v4;
}

- (BOOL)supportsSendMessageIntent
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall provider](self, "provider"));
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  char v5 = (void *)objc_claimAutoreleasedReturnValue([v4 applicationsForUserActivityType:@"INSendMessageIntent"]);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v11 = sub_100011210();
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unsigned int v21 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "application %@", buf, 0xCu);
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
        unsigned __int8 v14 = [v13 isEqualToString:v3];

        if ((v14 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_13;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (BOOL)hasSendCustomMessageCapability
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall provider](self, "provider"));
  else {
    BOOL v4 = -[TUCall supportsSendMessageIntent](self, "supportsSendMessageIntent");
  }

  return v4;
}

- (id)sendMessageIntentExtension
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall provider](self, "provider"));
  if ([v3 isSystemProvider])
  {

LABEL_13:
    __int128 v19 = 0LL;
    return v19;
  }

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall provider](self, "provider"));
  char v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleURL]);

  if (!v5) {
    goto LABEL_13;
  }
  if (qword_100116930 != -1) {
    dispatch_once(&qword_100116930, &stru_1000F6B10);
  }
  if (([(id)qword_100116920 containsObject:self] & 1) == 0)
  {
    [(id)qword_100116920 addObject:self];
    v37 = @"INSendMessageIntent";
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSExtension _intents_extensionMatchingAttributesForIntents:]( &OBJC_CLASS___NSExtension,  "_intents_extensionMatchingAttributesForIntents:",  v6));
    id v8 = [v7 mutableCopy];

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUCall provider](self, "provider"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleURL]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
    [v8 setObject:v11 forKeyedSubscript:NSExtensionContainingAppName];

    uint64_t v27 = 0LL;
    v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    v30 = sub_100009DFC;
    v31 = sub_100009E0C;
    id v32 = 0LL;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
    id v13 = sub_100011210();
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Looking up send message intent extension using attributes: %@",  buf,  0xCu);
    }

    unsigned int v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    unsigned int v23 = sub_100009E14;
    __int16 v24 = &unk_1000F6B38;
    __int16 v26 = &v27;
    unsigned int v15 = v12;
    unsigned int v25 = v15;
    +[NSExtension extensionsWithMatchingAttributes:completion:]( &OBJC_CLASS___NSExtension,  "extensionsWithMatchingAttributes:completion:",  v8,  &v21);
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    id v16 = sub_100011210();
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v18 = (void *)v28[5];
      *(_DWORD *)buf = 138412546;
      id v34 = v18;
      __int16 v35 = 2112;
      v36 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Found send message intent extension %@ for call %@",  buf,  0x16u);
    }

    objc_msgSend((id)qword_100116928, "setObject:forKey:", v28[5], self, v21, v22, v23, v24);
    _Block_object_dispose(&v27, 8);
  }

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100116928 objectForKey:self]);
  return v19;
}

@end