@interface MCNotificationSettingsPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (id)notificationSettingsFilePath;
- (void)remove;
- (void)setAside;
- (void)unsetAside;
@end

@implementation MCNotificationSettingsPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMCInstallProfileOptionInstallationType]);

  LODWORD(v8) = [v10 intValue];
  if ((_DWORD)v8 == 2) {
    uint64_t v11 = MCUserNotificationSettingsFilePath();
  }
  else {
    uint64_t v11 = MCSystemNotificationSettingsFilePath();
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (([v13 fileExistsAtPath:v12] & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue([v9 notificationSettings]);
    v33 = v32;
    if (v32) {
      [v32 writeToFile:v12 atomically:1];
    }

    goto LABEL_14;
  }

  uint64_t v14 = MCNotificationSettingsErrorDomain;
  uint64_t v15 = MCErrorArray(@"NOTIFICATION_SETTINGS_MULTIPLE_SETTINGS");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = MCErrorTypeFatal;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v14,  44000LL,  v16,  MCErrorTypeFatal,  0LL));
  id v19 = [v18 MCCopyAsPrimaryError];

  if (!v19)
  {
LABEL_14:
    MCSendUserNotificationsSettingsChangedNotification();
    BOOL v31 = 1;
    goto LABEL_15;
  }

  v35 = v9;
  uint64_t v20 = MCInstallationErrorDomain;
  v21 = a6;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 friendlyName]);
  uint64_t v24 = MCErrorArray(@"ERROR_PAYLOAD_FAILED_P_ID");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v20,  4001LL,  v25,  v19,  v17,  v23,  0LL));

  if (v21) {
    id *v21 = v26;
  }
  os_log_t v27 = _MCLogObjects[0];
  v9 = v35;
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue([v35 friendlyName]);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v26 MCVerboseDescription]);
    *(_DWORD *)buf = 138543618;
    v37 = v29;
    __int16 v38 = 2114;
    v39 = v30;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Cannot install notification settings “%{public}@”. Error: %{public}@",  buf,  0x16u);
  }

  BOOL v31 = 0;
LABEL_15:

  return v31;
}

- (void)remove
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[MCNotificationSettingsPayloadHandler notificationSettingsFilePath]( self,  "notificationSettingsFilePath"));
    [v5 removeItemAtPath:v6 error:0];

    MCSendUserNotificationsSettingsChangedNotification();
  }

- (void)setAside
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[MCNotificationSettingsPayloadHandler notificationSettingsFilePath]( self,  "notificationSettingsFilePath"));
  [v4 removeItemAtPath:v3 error:0];
}

- (void)unsetAside
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v5 notificationSettings]);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MCNotificationSettingsPayloadHandler notificationSettingsFilePath]( self,  "notificationSettingsFilePath"));
    [v3 writeToFile:v4 atomically:1];
  }
}

- (id)notificationSettingsFilePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 profile]);
  id v4 = [v3 installType];

  if (v4 == (id)2) {
    uint64_t v5 = MCUserNotificationSettingsFilePath();
  }
  else {
    uint64_t v5 = MCSystemNotificationSettingsFilePath();
  }
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

@end