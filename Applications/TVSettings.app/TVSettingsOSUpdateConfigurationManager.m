@interface TVSettingsOSUpdateConfigurationManager
+ (TVSettingsOSUpdateConfiguration)currentConfiguration;
+ (id)_audiencesForTrainAudience:(id)a3;
+ (id)_configurationForAudience:(id)a3 inTrain:(id)a4;
+ (id)_currentAudienceOverride;
+ (id)backupLocalConfigurations;
+ (id)shippingConfiguration;
+ (void)_completeSetCurrentConfiguration:(id)a3 withData:(id)a4 error:(id)a5;
+ (void)_processLivAPIResultData:(id)a3 withCompletion:(id)a4;
+ (void)_removeCurrentProfileIfPresent;
+ (void)_setCurrentConfiguration:(id)a3;
+ (void)availableTrainsAndConfigurationsFromLivAPIWithCompletion:(id)a3;
+ (void)setCurrentConfiguration:(id)a3;
@end

@implementation TVSettingsOSUpdateConfigurationManager

+ (TVSettingsOSUpdateConfiguration)currentConfiguration
{
  id v2 = (id)qword_1001E1730;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1001E1728);
  return (TVSettingsOSUpdateConfiguration *)v2;
}

+ (void)setCurrentConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000580FC();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = qword_1001E1730;
    __int16 v36 = 2114;
    id v37 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Switching OSUpdate Configuration from: %{public}@ to: %{public}@",  buf,  0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v6 postNotificationName:off_1001DFB50 object:0 userInfo:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 requiredProfileURL]);
  if (![v7 length])
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10005831C;
    v25[3] = &unk_10018E440;
    id v26 = v3;
    dispatch_async(&_dispatch_main_q, v25);
    v17 = v26;
    goto LABEL_17;
  }

  id v8 = sub_1000580FC();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v35 = (uint64_t)v7;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Configuration requires fetch of profile %{public}@",  buf,  0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
  if ([v3 requiresAppleConnect])
  {
    id v33 = 0LL;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 tokenWithError:&v33]);
    id v12 = v33;
    if (v12)
    {
      v13 = v12;
      id v14 = sub_1000580FC();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000F6C1C();
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10005813C;
      block[3] = &unk_10018E468;
      id v31 = v3;
      id v32 = v13;
      id v16 = v13;
      dispatch_async(&_dispatch_main_q, block);

      v17 = v10;
      goto LABEL_17;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAddingPercentEncodingWithAllowedCharacters:v18]);
  }

  else
  {
    v17 = 0LL;
  }

  v19 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
  [v20 setTimeoutIntervalForRequest:300.0];
  [v20 setWaitsForConnectivity:1];
  [v20 setRequestCachePolicy:1];
  [v20 setURLCache:0];
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v20));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v19));
  v23 = v22;
  if (v17) {
    [v22 addValue:v17 forHTTPHeaderField:@"ACMobileToken"];
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100058154;
  v27[3] = &unk_100190BF8;
  id v28 = v7;
  id v29 = v3;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v21 dataTaskWithRequest:v23 completionHandler:v27]);
  [v24 resume];

LABEL_17:
}

+ (id)shippingConfiguration
{
  if (qword_1001E1740 != -1) {
    dispatch_once(&qword_1001E1740, &stru_100190C18);
  }
  return (id)qword_1001E1738;
}

+ (id)backupLocalConfigurations
{
  if (qword_1001E1750 != -1) {
    dispatch_once(&qword_1001E1750, &stru_100190C38);
  }
  return (id)qword_1001E1748;
}

+ (void)availableTrainsAndConfigurationsFromLivAPIWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 backupLocalConfigurations]);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);
  id v7 = [v6 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v45;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        if ([v11 isConfigurationProfileLoaded])
        {
          [a1 _setCurrentConfiguration:v11];
          goto LABEL_11;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

+ (void)_setCurrentConfiguration:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1001E1728);
  id v4 = (void *)qword_1001E1730;
  qword_1001E1730 = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1001E1728);
  dispatch_async(&_dispatch_main_q, &stru_100190C80);
}

+ (id)_currentAudienceOverride
{
  uint64_t v2 = MAGetPallasAudience(@"com.apple.MobileAsset.SoftwareUpdate", a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (![v3 length])
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue( [v4 installedProfileWithIdentifier:@"com.apple.MobileAsset.OTAlogging.RestoreQA"]);
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 payloads]);
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      id v16 = v5;
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          uint64_t v12 = objc_opt_class(&OBJC_CLASS___MCDefaultsPayload);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue([v11 defaultsForDomain:@"com.apple.MobileAsset"]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"MobileAssetAssetAudience"]);
            if ([v14 length])
            {

              goto LABEL_14;
            }
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }

      id v14 = v3;
LABEL_14:
      v5 = v16;
    }

    else
    {
      id v14 = v3;
    }

    id v3 = v14;
  }

  return v3;
}

+ (void)_processLivAPIResultData:(id)a3 withCompletion:(id)a4
{
  id v61 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  0LL));
  if (v6
    && (id v7 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr,
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary),
        (objc_opt_isKindOfClass(v6, v8) & 1) != 0))
  {
    id v67 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"liveOnAudiences"]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
    {
      id v11 = sub_1000580FC();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000F7FEC();
      }
    }

    v60 = v6;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    id obj = v9;
    id v13 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
    id v68 = a1;
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v81;
      uint64_t v62 = *(void *)v81;
      do
      {
        id v16 = 0LL;
        id v63 = v14;
        do
        {
          if (*(void *)v81 != v15) {
            objc_enumerationMutation(obj);
          }
          v69 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)v16);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v69 objectForKey:@"deviceFamilies"]);
          uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0 && [v17 count])
          {
            v65 = v17;
            v66 = v16;
            __int128 v78 = 0u;
            __int128 v79 = 0u;
            __int128 v76 = 0u;
            __int128 v77 = 0u;
            id v19 = v17;
            id v20 = [v19 countByEnumeratingWithState:&v76 objects:v91 count:16];
            if (v20)
            {
              id v21 = v20;
              uint64_t v22 = *(void *)v77;
              do
              {
                for (i = 0LL; i != v21; i = (char *)i + 1)
                {
                  if (*(void *)v77 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  v24 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)i);
                  uint64_t v25 = objc_opt_class(v7[411]);
                  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
                  {
                    id v26 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:@"permalink"]);
                    unsigned int v27 = [v26 isEqualToString:@"apple-tv"];

                    if (v27)
                    {
                      uint64_t v28 = objc_claimAutoreleasedReturnValue([v69 objectForKey:@"purposeName"]);
                      id v29 = (void *)v28;
                      v30 = @"unknown";
                      if (v28) {
                        v30 = (__CFString *)v28;
                      }
                      id v31 = v30;

                      id v32 = (void *)objc_claimAutoreleasedReturnValue([a1 _configurationForAudience:v69 inTrain:v31]);
                      if (v32)
                      {
                        uint64_t v33 = TSKLocString(@"SettingsOSUpdateConfigurationDescCarry");
                        id v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
                        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v32 rawName]);
                        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v34,  v35));
                        [v32 setLongDescription:v36];

                        a1 = v68;
                        [v67 setObject:v32 forKey:v31];
                        id v7 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
                      }
                    }
                  }
                }

                id v21 = [v19 countByEnumeratingWithState:&v76 objects:v91 count:16];
              }

              while (v21);
            }

            uint64_t v15 = v62;
            id v14 = v63;
            __int128 v17 = v65;
            id v16 = v66;
          }

          id v16 = (char *)v16 + 1;
        }

        while (v16 != v14);
        id v14 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
      }

      while (v14);
    }

    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v60 objectForKey:@"trainAudiences"]);
    uint64_t v39 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v38, v39) & 1) == 0)
    {
      id v40 = sub_1000580FC();
      id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_1000F7F8C();
      }
    }

    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    id v42 = v38;
    id v43 = [v42 countByEnumeratingWithState:&v72 objects:v90 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v73;
      do
      {
        for (j = 0LL; j != v44; j = (char *)j + 1)
        {
          if (*(void *)v73 != v45) {
            objc_enumerationMutation(v42);
          }
          __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsOSUpdateConfigurationManager _audiencesForTrainAudience:]( &OBJC_CLASS___TVSettingsOSUpdateConfigurationManager,  "_audiencesForTrainAudience:",  *(void *)(*((void *)&v72 + 1) + 8LL * (void)j)));
          if ([v47 count])
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue([v47 firstObject]);
            v49 = (void *)objc_claimAutoreleasedReturnValue([v48 trainName]);

            if (v49 && [v47 count]) {
              [v37 setObject:v47 forKey:v49];
            }
          }

          else
          {
            v49 = 0LL;
          }
        }

        id v44 = [v42 countByEnumeratingWithState:&v72 objects:v90 count:16];
      }

      while (v44);
    }

    v50 = (void *)objc_claimAutoreleasedReturnValue([v68 currentConfiguration]);
    if (!v50)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsOSUpdateConfigurationManager shippingConfiguration]( &OBJC_CLASS___TVSettingsOSUpdateConfigurationManager,  "shippingConfiguration"));
      [v68 _setCurrentConfiguration:v51];
    }

    os_unfair_lock_lock((os_unfair_lock_t)&unk_1001E1758);
    objc_storeStrong((id *)&qword_1001E1760, v67);
    objc_storeStrong((id *)&qword_1001E1768, v37);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1001E1758);
    id v52 = sub_1000580FC();
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      id v54 = [v67 count];
      id v55 = [v37 count];
      *(_DWORD *)buf = 134218240;
      id v87 = v54;
      __int16 v88 = 2048;
      id v89 = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Fetched %ld liveOn and %ld train configurations.",  buf,  0x16u);
    }

    v56 = v61;
    (*((void (**)(id, void *, id))v61 + 2))(v61, v37, v67);
    v84[0] = off_1001DFB70;
    v84[1] = off_1001DFB78;
    v85[0] = v67;
    v85[1] = v37;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000596D8;
    block[3] = &unk_10018E440;
    id v71 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v85,  v84,  2LL));
    id v57 = v71;
    dispatch_async(&_dispatch_main_q, block);

    v6 = v60;
  }

  else
  {
    id v58 = sub_1000580FC();
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_1000F7F2C();
    }

    v56 = v61;
    (*((void (**)(id, void, void))v61 + 2))(v61, 0LL, 0LL);
  }
}

+ (id)_audiencesForTrainAudience:(id)a3
{
  id v4 = a3;
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsOSUpdateConfigurationManager _currentAudienceOverride]( &OBJC_CLASS___TVSettingsOSUpdateConfigurationManager,  "_currentAudienceOverride"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"trainName"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0 && [v6 length])
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"audiences"]);
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        id v10 = v8;
        id v11 = [v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v11)
        {
          id v12 = v11;
          unsigned int v27 = v8;
          id v28 = v4;
          uint64_t v13 = *(void *)v32;
          do
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v32 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
              uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
              if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
              {
                __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([a1 _configurationForAudience:v15 inTrain:v6]);
                uint64_t v18 = v17;
                if (v17)
                {
                  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s audienceOverride](v17, "audienceOverride"));
                  unsigned int v20 = [v19 isEqualToString:v30];

                  if (v20) {
                    [a1 _setCurrentConfiguration:v18];
                  }
                  objc_msgSend(v29, "addObject:", v18, v27, v28);
                }
              }

              else
              {
                id v21 = sub_1000580FC();
                uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v36 = v15;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Skipping invalid LiveAPI audience [%{public}@]",  buf,  0xCu);
                }
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
          }

          while (v12);
          uint64_t v8 = v27;
          id v4 = v28;
        }
      }

      else
      {
        id v24 = sub_1000580FC();
        id v10 = (id)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
          sub_1000F80AC();
        }
      }
    }

    else
    {
      id v23 = sub_1000580FC();
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
        sub_1000F804C();
      }
    }
  }

  else
  {
    id v22 = sub_1000580FC();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      sub_1000F810C();
    }
  }

  id v25 = [v29 copy];
  return v25;
}

+ (id)_configurationForAudience:(id)a3 inTrain:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1001E1778 != -1) {
    dispatch_once(&qword_1001E1778, &stru_100190CA0);
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"purposeName"]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0 && [v7 length])
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"purposeId"]);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0 || ![v9 length])
    {
      id v25 = sub_1000580FC();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000F8198();
      }
      uint64_t v18 = 0LL;
      goto LABEL_35;
    }

    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"pallasAudienceId"]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0 || !-[os_log_s length](v11, "length"))
    {
      id v26 = sub_1000580FC();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000F81C4();
      }
      uint64_t v18 = 0LL;
      goto LABEL_34;
    }

    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"profileUrl"]);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0 || !-[os_log_s length](v13, "length"))
    {
      id v27 = sub_1000580FC();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000F81F0();
      }
      uint64_t v18 = 0LL;
      goto LABEL_33;
    }

    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"prodFusedAllowed"]);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    {
      unsigned int v17 = -[os_log_s BOOLValue](v15, "BOOLValue");
      if (v17 == (byte_1001E1770 != 0))
      {
LABEL_13:
        uint64_t v18 = objc_alloc_init(&OBJC_CLASS___TVSettingsOSUpdateConfiguration);
        -[TVSettingsOSUpdateConfiguration setRawName:](v18, "setRawName:", v7);
        -[TVSettingsOSUpdateConfiguration setTrainName:](v18, "setTrainName:", v6);
        -[TVSettingsOSUpdateConfiguration setRequiredProfileURL:](v18, "setRequiredProfileURL:", v13);
        -[TVSettingsOSUpdateConfiguration setRequiresVPN:](v18, "setRequiresVPN:", 1LL);
        -[TVSettingsOSUpdateConfiguration setIdentifier:](v18, "setIdentifier:", v9);
        uint64_t v19 = TSKLocString(@"SettingsOSUpdateConfigurationDescSWELivAPI");
        unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v20, v7, v6));

        -[TVSettingsOSUpdateConfiguration setLongDescription:](v18, "setLongDescription:", v21);
        -[TVSettingsOSUpdateConfiguration setRequiresAppleConnect:](v18, "setRequiresAppleConnect:", 1LL);
        -[TVSettingsOSUpdateConfiguration setAudienceOverride:](v18, "setAudienceOverride:", v11);
        id v22 = sub_1000580FC();
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543874;
          __int128 v31 = v18;
          __int16 v32 = 2114;
          id v33 = v5;
          __int16 v34 = 2114;
          id v35 = v6;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "Configuration: %{public}@ for audience: %{public}@ train: %{public}@",  buf,  0x20u);
        }

LABEL_32:
LABEL_33:

LABEL_34:
LABEL_35:

        goto LABEL_36;
      }
    }

    else if (!byte_1001E1770)
    {
      goto LABEL_13;
    }

    id v28 = sub_1000580FC();
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG)) {
      sub_1000F821C();
    }
    uint64_t v18 = 0LL;
    goto LABEL_32;
  }

  id v24 = sub_1000580FC();
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
    sub_1000F816C();
  }
  uint64_t v18 = 0LL;
LABEL_36:

  return v18;
}

+ (void)_removeCurrentProfileIfPresent
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 installedProfileIdentifiers]);
  id v4 = [v3 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v36;
    uint64_t v7 = @"com.apple.MobileAsset.OTAlogging.RestoreQA";
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v2 installedProfileWithIdentifier:*(void *)(*((void *)&v35 + 1) + 8 * (void)i)]);
        uint64_t v10 = v9;
        if (v9)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
          if ([v11 isEqualToString:v7])
          {
          }

          else
          {
            uint64_t v12 = v2;
            uint64_t v13 = v7;
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
            unsigned int v15 = [v14 hasPrefix:@"com.apple.tvOS.fc"];

            uint64_t v7 = v13;
            uint64_t v2 = v12;

            if (!v15) {
              goto LABEL_11;
            }
          }

          [v30 addObject:v10];
        }

+ (void)_completeSetCurrentConfiguration:(id)a3 withData:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v10)
  {
    [a1 _removeCurrentProfileIfPresent];
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsOSUpdateConfigurationManager shippingConfiguration]( &OBJC_CLASS___TVSettingsOSUpdateConfigurationManager,  "shippingConfiguration"));
    [a1 _setCurrentConfiguration:v16];

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 requiredProfileURL]);
    id v18 = [v17 length];

    if (v18)
    {
      if ([v9 length])
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
        id v54 = 0LL;
        unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 installProfileData:v9 outError:&v54]);
        id v21 = v54;

        id v22 = sub_1000580FC();
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        id v24 = v23;
        if (v20)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "New OSUpdate configuration profile installed.",  buf,  2u);
          }

          id v25 = (void *)objc_claimAutoreleasedReturnValue([v8 audienceOverride]);
          uint64_t v26 = MASetPallasAudience(v25);
          id v27 = sub_1000580FC();
          id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          id v29 = v28;
          if (v26)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              sub_1000F8434();
            }
          }

          else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v56 = v25;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Set pallas audience to %{public}@",  buf,  0xCu);
          }

          [a1 _setCurrentConfiguration:v8];
          id v12 = 0LL;
        }

        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_1000F83CC(v24, v36, v37, v38, v39, v40, v41, v42);
          }

          id v43 = (void *)objc_claimAutoreleasedReturnValue([v21 localizedDescription]);
          if (![v43 length])
          {
            uint64_t v44 = TSKLocString(@"ProfileInstallFailedError");
            uint64_t v45 = objc_claimAutoreleasedReturnValue(v44);

            id v43 = (void *)v45;
          }

          __int128 v46 = (void *)objc_claimAutoreleasedReturnValue([v21 localizedRecoverySuggestion]);
          id v47 = [v46 length];
          v48 = v46;
          if (!v47)
          {
            uint64_t v49 = TSKLocString(@"ProfileInstallFailedErrorSuggestion");
            v48 = (void *)objc_claimAutoreleasedReturnValue(v49);
          }

          id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n%@",  v43,  v48));

          if (!v47) {
          NSErrorUserInfoKey v57 = NSLocalizedFailureReasonErrorKey;
          }
          id v58 = v25;
          v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
          id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TVSettingsErrors",  2LL,  v50));
        }
      }

      else
      {
        id v32 = sub_1000580FC();
        __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_1000F833C(v8, v33);
        }

        NSErrorUserInfoKey v59 = NSLocalizedFailureReasonErrorKey;
        uint64_t v34 = TSKLocString(@"ProfileResultedInNoDataError");
        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        v60 = v35;
        id v21 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));

        id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"TVSettingsErrors",  1LL,  v21));
      }

      if (v12) {
        goto LABEL_3;
      }
    }

    else
    {
      id v30 = sub_1000580FC();
      __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "New OSUpdate configuration does not require a carry profile.",  buf,  2u);
      }

      [a1 _setCurrentConfiguration:v8];
      id v12 = 0LL;
    }

    char v15 = 1;
    goto LABEL_35;
  }

  id v12 = v10;
LABEL_3:
  id v13 = sub_1000580FC();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1000F82DC();
  }

  char v15 = 0;
LABEL_35:
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v52 = v51;
  if ((v15 & 1) == 0) {
    [v51 setObject:v12 forKey:off_1001DFB60];
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v53 postNotificationName:off_1001DFB58 object:0 userInfo:v52];
}

@end