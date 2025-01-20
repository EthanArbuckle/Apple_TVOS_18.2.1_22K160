@interface CSDUnknownCallFilter
- (BOOL)containsOutgoingRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)containsRecentsRestrictedHandle:(id)a3;
- (BOOL)containsRestrictedHandle:(id)a3;
- (BOOL)isSilenceUnknownFaceTimeCallersEnabled;
- (BOOL)isSilenceUnknownTelephonyCallersEnabled;
- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5;
- (BOOL)isUnknownCaller:(id)a3;
- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4;
- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4;
- (int64_t)filterStatusForAddresses:(id)a3 withBundleIdentifier:(id)a4;
- (int64_t)maxJunkLevel;
@end

@implementation CSDUnknownCallFilter

- (BOOL)isSilenceUnknownTelephonyCallersEnabled
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults tu_defaults](&OBJC_CLASS___NSUserDefaults, "tu_defaults"));
  unsigned int v4 = [v3 silenceUnknownCallersEnabled];

  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 1024;
    unsigned int v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ isSilenceUnknownCallersEnabled(Telephony): %d",  (uint8_t *)&v8,  0x12u);
  }

  return v4;
}

- (BOOL)isSilenceUnknownFaceTimeCallersEnabled
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults tu_defaults](&OBJC_CLASS___NSUserDefaults, "tu_defaults"));
  unsigned int v4 = [v3 silenceUnknownFaceTimeCallersEnabled];

  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 1024;
    unsigned int v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ isSilenceUnknownFaceTimeCallersEnabled: %d",  (uint8_t *)&v8,  0x12u);
  }

  return v4;
}

- (int64_t)maxJunkLevel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults tu_defaults](&OBJC_CLASS___NSUserDefaults, "tu_defaults"));
  id v4 = [v3 maxJunkLevel];

  id v5 = sub_1001704C4();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 2048;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ maxJunkLevel: %ld", (uint8_t *)&v8, 0x16u);
  }

  return (int64_t)v4;
}

- (BOOL)containsOutgoingRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  return 0;
}

- (BOOL)containsRecentsRestrictedHandle:(id)a3
{
  return 0;
}

- (BOOL)containsRestrictedHandle:(id)a3
{
  return 0;
}

- (int64_t)filterStatusForAddresses:(id)a3 withBundleIdentifier:(id)a4
{
  return 0LL;
}

- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5
{
  return 0;
}

- (BOOL)isUnknownCaller:(id)a3
{
  return 0;
}

- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isSystemProvider] & 1) == 0)
  {
    id v19 = sub_1001704C4();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (CSDUnknownCallFilter *)objc_claimAutoreleasedReturnValue([v6 UUID]);
      int v33 = 138412290;
      v34 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Not a system call; call filter will allow update with identifier %@",
        (uint8_t *)&v33,
        0xCu);
    }

    goto LABEL_13;
  }

  unsigned int v8 = -[CSDUnknownCallFilter isSilenceUnknownTelephonyCallersEnabled](self, "isSilenceUnknownTelephonyCallersEnabled");
  unsigned int v9 = -[CSDUnknownCallFilter isSilenceUnknownFaceTimeCallersEnabled](self, "isSilenceUnknownFaceTimeCallersEnabled");
  id v10 = sub_1001704C4();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138413058;
    v34 = self;
    __int16 v35 = 2112;
    id v36 = v6;
    __int16 v37 = 1024;
    unsigned int v38 = v8;
    __int16 v39 = 1024;
    unsigned int v40 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%@ shouldFilterIncoming update=%@ isSilenceUnknownTelephonyCallersEnabled=%d isSilenceUnknownFaceTimeCallersEnabled=%d",  (uint8_t *)&v33,  0x22u);
  }

  unsigned int v12 = [v7 isTelephonyProvider] & v8;
  if ((v12 & 1) == 0 && ((v9 ^ 1) & 1) == 0)
  {
    if ([v7 isFaceTimeProvider])
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](&OBJC_CLASS___TUCallCenter, "sharedInstance"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 conversationManager]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v6 participantGroupUUID]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v14 activeConversationWithGroupUUID:v15]);

      if (!v16
        || (v17 = (void *)objc_claimAutoreleasedReturnValue([v16 provider]),
            unsigned int v18 = [v17 isDefaultProvider],
            v17,
            v16,
            v18))
      {
        unsigned int v12 = 1;
        goto LABEL_15;
      }

- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  return 0;
}

- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  return 0;
}

@end