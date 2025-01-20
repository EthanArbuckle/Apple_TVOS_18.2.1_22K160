@interface MCAppWhitelistPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)_postNotification;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
@end

@implementation MCAppWhitelistPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___MCSingleAppPayload);
  char isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) == 0) {
    return 1;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 applicationBundleID]);
  unsigned int v14 = [v12 allowedToRunAppWithBundleID:v13];

  if (v14)
  {

    return 1;
  }

  uint64_t v15 = MCAppWhitelistErrorDomain;
  uint64_t v16 = MCErrorArray(@"APPWHITE_APP_IS_RESTRICTED");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = MCErrorTypeFatal;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v15,  48000LL,  v17,  MCErrorTypeFatal,  0LL));
  id v20 = [v19 MCCopyAsPrimaryError];

  if (!v20) {
    return 1;
  }
  uint64_t v21 = MCInstallationErrorDomain;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 friendlyName]);
  uint64_t v24 = MCErrorArray(@"ERROR_PAYLOAD_FAILED_P_ID");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v21,  4001LL,  v25,  v20,  v18,  v23,  0LL));

  if (a6) {
    *a6 = v26;
  }
  os_log_t v27 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 friendlyName]);
    v31 = (void *)objc_claimAutoreleasedReturnValue([v26 MCVerboseDescription]);
    *(_DWORD *)buf = 138543618;
    v34 = v30;
    __int16 v35 = 2114;
    v36 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Cannot install app whitelist payload “%{public}@”. Error: %{public}@",  buf,  0x16u);
  }

  return 0;
}

- (void)_postNotification
{
  v2 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Sending App Whitelist change notification", v3, 2u);
  }

  notify_post((const char *)[MCAppWhitelistDidChangeNotification UTF8String]);
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
}

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
}

@end