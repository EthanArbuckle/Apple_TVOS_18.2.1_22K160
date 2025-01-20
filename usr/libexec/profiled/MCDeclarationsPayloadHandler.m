@interface MCDeclarationsPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)remove;
@end

@implementation MCDeclarationsPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);

  if (v13)
  {
    if (a6)
    {
      uint64_t v32 = kMCDeclarationsPayloadType;
      uint64_t v14 = MCErrorArray(@"ERROR_UNACCEPTABLE_PAYLOAD_VIA_MDM_P_TYPE");
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  MCInstallationErrorDomain,  4052LL,  v15,  MCErrorTypeFatal,  v32,  0LL));
LABEL_15:
      *a6 = v16;

      goto LABEL_16;
    }

    goto LABEL_16;
  }

  if (!objc_opt_class(&OBJC_CLASS___RMProfileStore) || !objc_opt_class(&OBJC_CLASS___RMSynchronous))
  {
    if (a6)
    {
      uint64_t v29 = MCErrorArray(@"ERROR_MISSING_FRAMEWORK");
      v15 = (void *)objc_claimAutoreleasedReturnValue(v29);
      id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  MCInternalErrorDomain,  4LL,  v15,  MCErrorTypeFatal,  0LL));
      goto LABEL_15;
    }

- (void)remove
{
  os_log_t v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 friendlyName]);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "Removing declarations profile %{public}@.",  (uint8_t *)&buf,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[RMProfileStore profileStoreForOwner:]( &OBJC_CLASS___RMProfileStore,  "profileStoreForOwner:",  @"MC.DeclarationsInProfile"));
  v8 = (void *)objc_opt_new(&OBJC_CLASS___RMSynchronous);
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000LL;
  uint64_t v32 = sub_10003C944;
  v33 = sub_10003C954;
  id v34 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  id v22 = sub_10003CCA4;
  uint64_t v23 = &unk_1000C32C0;
  p___int128 buf = &buf;
  id v11 = v8;
  id v24 = v11;
  [v7 removeProfile:v10 completionHandler:&v20];

  objc_msgSend(v11, "waitForCompletion", v20, v21, v22, v23);
  uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40LL);
  v13 = _MCLogObjects[0];
  uint64_t v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 friendlyName]);
      uint64_t v17 = *(void *)(*((void *)&buf + 1) + 40LL);
      *(_DWORD *)v26 = 138543618;
      v27 = v16;
      __int16 v28 = 2114;
      uint64_t v29 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to remove declarations profile %{public}@: %{public}@",  v26,  0x16u);
    }
  }

  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 friendlyName]);
    *(_DWORD *)v26 = 138543362;
    v27 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Successfully removed declarations profile %{public}@",  v26,  0xCu);
  }

  _Block_object_dispose(&buf, 8);
}

@end