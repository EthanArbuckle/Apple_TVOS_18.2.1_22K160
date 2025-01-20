@interface SAAppsGetRestrictedApps
- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4;
@end

@implementation SAAppsGetRestrictedApps

- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void, id))a4;
  v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v8 = [off_1005735A8() serviceWithDefaultShellEndpoint];
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue(+[AFError errorWithCode:](&OBJC_CLASS___AFError, "errorWithCode:", 13LL));
    if (v11) {
      goto LABEL_25;
    }
LABEL_18:
    id v21 = objc_alloc_init(&OBJC_CLASS___SAAppsGetRestrictedAppsResponse);
    [v21 setAppToItsRestrictionsMap:v30];
    v22 = (void *)objc_claimAutoreleasedReturnValue([v6 createResponseWithReplyCommand:v21]);

    if (!v7) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }

  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAAppsGetRestrictedApps appIds](self, "appIds"));
  id v11 = [v10 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v11)
  {
    v28 = v7;
    uint64_t v12 = *(void *)v33;
    v13 = (void *)SAAppsAppRestrictionReasonRESTRICTEDValue;
    v29 = (void *)SAAppsAppRestrictionReasonNOT_FOUNDValue;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
        uint64_t v31 = 0LL;
        if ([v9 canOpenApplication:v15 reason:&v31])
        {
          v16 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v38 = "-[SAAppsGetRestrictedApps(ADSiriAppLaunchRequestHandler) _ad_handleAppLaunchCommandWithRequest:completion:]";
            __int16 v39 = 2112;
            uint64_t v40 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s app (%@) can be launched - filtering",  buf,  0x16u);
          }
        }

        else
        {
          uint64_t v17 = v31;
          if (v31 == 8)
          {
            v23 = (void *)AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              v24 = v23;
              uint64_t v25 = FBSOpenApplicationErrorCodeToString(8LL);
              v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
              *(_DWORD *)buf = 136315650;
              v38 = "-[SAAppsGetRestrictedApps(ADSiriAppLaunchRequestHandler) _ad_handleAppLaunchCommandWithRequest:completion:]";
              __int16 v39 = 2112;
              uint64_t v40 = v15;
              __int16 v41 = 2112;
              v42 = v26;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "%s app (%@) can not be launched due to '%@' - bailing",  buf,  0x20u);

              uint64_t v27 = v31;
            }

            else
            {
              uint64_t v27 = 8LL;
            }

            v7 = v28;
            id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.siri.bksopenapplication.ErrorDomain",  v27,  0LL));
            goto LABEL_24;
          }

          id v18 = v13;
          if (v17 == 4)
          {
            id v19 = v29;

            id v18 = v19;
          }

          id v36 = v18;
          v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v36,  1LL));
          -[NSMutableDictionary setObject:forKey:](v30, "setObject:forKey:", v20, v15);
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v32 objects:v43 count:16];
      if (v11) {
        continue;
      }
      break;
    }

    v7 = v28;
  }

@end