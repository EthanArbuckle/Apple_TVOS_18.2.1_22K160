@interface MCSetupAssistantPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)_removeSetupAssistantSettings;
- (void)_saveSetupAssistantSettings;
- (void)remove;
- (void)setAside;
@end

@implementation MCSetupAssistantPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", a3, a4, a5));
  uint64_t v9 = MCSetupAssistantSettingsFilePath();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  unsigned __int8 v11 = [v8 fileExistsAtPath:v10];

  if ((v11 & 1) == 0)
  {
    -[MCSetupAssistantPayloadHandler _saveSetupAssistantSettings](self, "_saveSetupAssistantSettings");
    goto LABEL_9;
  }

  uint64_t v12 = MCSetupAssistantErrorDomain;
  uint64_t v13 = MCErrorArray(@"SETUP_ASSISTANT_SETTINGS_MULTIPLE_SETTINGS");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = MCErrorTypeFatal;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v12,  56000LL,  v14,  MCErrorTypeFatal,  0LL));
  id v17 = [v16 MCCopyAsPrimaryError];

  if (!v17)
  {
LABEL_9:
    BOOL v29 = 1;
    goto LABEL_10;
  }

  uint64_t v18 = MCInstallationErrorDomain;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 friendlyName]);
  uint64_t v21 = MCErrorArray(@"ERROR_PAYLOAD_FAILED_P_ID");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v18,  4001LL,  v22,  v17,  v15,  v20,  0LL));

  if (a6) {
    *a6 = v23;
  }
  os_log_t v24 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 friendlyName]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v23 MCVerboseDescription]);
    *(_DWORD *)buf = 138543618;
    v32 = v27;
    __int16 v33 = 2114;
    v34 = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Cannot install shared device configuration “%{public}@”. Error: %{public}@",  buf,  0x16u);
  }

  BOOL v29 = 0;
LABEL_10:

  return v29;
}

- (void)remove
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0) {
    -[MCSetupAssistantPayloadHandler _removeSetupAssistantSettings](self, "_removeSetupAssistantSettings");
  }
}

- (void)setAside
{
}

- (void)_saveSetupAssistantSettings
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v5 configuration]);
  uint64_t v3 = MCSetupAssistantSettingsFilePath();
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  [v2 MCWriteToBinaryFile:v4];
}

- (void)_removeSetupAssistantSettings
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v2 = MCSetupAssistantSettingsFilePath();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v4 removeItemAtPath:v3 error:0];
}

@end