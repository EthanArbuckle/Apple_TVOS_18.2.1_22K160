@interface AppInstallInstallTask
- (void)main;
@end

@implementation AppInstallInstallTask

- (void)main
{
  if ((unint64_t)sub_1001E2698(self->_install, (uint64_t)@"archive_type") > 1)
  {
    uint64_t v17 = ASDErrorWithDescription(ASDErrorDomain, 909LL, @"Not available on this platform.");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = sub_1003082D4( (uint64_t)&OBJC_CLASS___AppInstallInstallResponse,  -[NSError databaseID](self->super._error, "databaseID"),  v18);
    v20 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue(v19);

    logKey = self->_logKey;
    self->_logKey = v20;

    return;
  }

  if (*(void *)&self->super._success)
  {
    id v3 = 0LL;
    goto LABEL_4;
  }

  uint64_t v28 = ASDLogHandleForCategory(2LL);
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    coordinator = self->_coordinator;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = coordinator;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[%@] Looking for existing coordinator to resynchronize installation",  buf,  0xCu);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSError valueForProperty:](self->super._error, "valueForProperty:", @"coordinator_id"));
  if (!v31)
  {
    uint64_t v51 = ASDLogHandleForCategory(2LL);
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v112 = self->_coordinator;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v112;
      _os_log_error_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_ERROR,  "[%@] No coordinator identifier was set",  buf,  0xCu);
    }

    uint64_t v53 = ASDErrorWithDescription(ASDErrorDomain, 820LL, @"Coordinator identifier was unset");
    id v54 = (id)objc_claimAutoreleasedReturnValue(v53);
    v55 = sub_1003082D4( (uint64_t)&OBJC_CLASS___AppInstallInstallResponse,  -[NSError databaseID](self->super._error, "databaseID"),  v54);
    v50 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue(v55);
    goto LABEL_86;
  }

  v32 = v31;
  id v125 = 0LL;
  id v33 = sub_1001E4798((uint64_t)&OBJC_CLASS___IXAppInstallCoordinator, v31, (uint64_t)&v125);
  uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
  id v3 = v125;
  v35 = *(void **)&self->super._success;
  *(void *)&self->super._success = v34;

  if (!*(void *)&self->super._success)
  {
    uint64_t v36 = ASDLogHandleForCategory(2LL);
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = self->_coordinator;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v38;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "[%@] Coordinator is missing - checking if application is installed",  buf,  0xCu);
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSError valueForProperty:](self->super._error, "valueForProperty:", @"bundle_id"));
    if (v39)
    {
      v40 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v39,  0LL,  0LL);
      if (v40)
      {
        id v41 = sub_1001E25D0(self->super._error, (uint64_t)@"evid");
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        id v43 = [v42 unsignedLongLongValue];
        if (v43)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](v40, "iTunesMetadata"));
          id v45 = [v44 versionIdentifier];

          if (v43 == v45)
          {
            uint64_t v46 = ASDLogHandleForCategory(2LL);
            v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v48 = self->_coordinator;
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v48;
              __int16 v128 = 2114;
              id v129 = v42;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "[%@] Expected application appears to be installed with evid: %{public}@, proceeding to postamble",  buf,  0x16u);
            }

            id v49 = -[NSError databaseID](self->super._error, "databaseID");
            objc_opt_self(&OBJC_CLASS___AppInstallInstallResponse);
            v50 = (_TtC9appstored6LogKey *)sub_1003083F0( (id *)objc_alloc(&OBJC_CLASS___AppInstallInstallResponse),  v49,  (void *)3,  0LL);

LABEL_94:
            id v54 = v3;
            goto LABEL_86;
          }
        }

        uint64_t v103 = ASDLogHandleForCategory(2LL);
        v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          v120 = self->_coordinator;
          v121 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord iTunesMetadata](v40, "iTunesMetadata"));
          id v122 = [v121 versionIdentifier];
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v120;
          __int16 v128 = 2048;
          id v129 = v43;
          __int16 v130 = 2048;
          id v131 = v122;
          _os_log_error_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_ERROR,  "[%@] Expected application with evid: %llu not installed. Installed version is: %llu",  buf,  0x20u);
        }
      }
    }

    uint64_t v105 = ASDLogHandleForCategory(2LL);
    v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      v117 = self->_coordinator;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v117;
      __int16 v128 = 2114;
      id v129 = v39;
    }

    uint64_t v107 = ASDErrorWithUnderlyingErrorAndDescription( v3,  ASDErrorDomain,  820LL,  @"Coordinator was not found, could not determine application state");
    v108 = (void *)objc_claimAutoreleasedReturnValue(v107);

    v109 = sub_1003082D4( (uint64_t)&OBJC_CLASS___AppInstallInstallResponse,  -[NSError databaseID](self->super._error, "databaseID"),  v108);
    v50 = (_TtC9appstored6LogKey *)objc_claimAutoreleasedReturnValue(v109);
    id v3 = v108;
    goto LABEL_94;
  }

- (void).cxx_destruct
{
}

@end