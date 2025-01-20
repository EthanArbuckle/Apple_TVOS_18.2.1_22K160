@interface SANodeIntent
- (id)_tccAccessInfoForAppID:(id)a3;
- (id)ad_filteredDictionaryWithAppID:(id)a3;
@end

@implementation SANodeIntent

- (id)_tccAccessInfoForAppID:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleProxy bundleProxyForIdentifier:]( &OBJC_CLASS___LSBundleProxy,  "bundleProxyForIdentifier:",  a3));
  CFBundleRef v4 = CFBundleCreate(0, (CFURLRef)[v3 bundleURL]);
  if (v4)
  {
    CFBundleRef v5 = v4;
    v17 = v3;
    v6 = (void *)TCCAccessCopyInformationForBundle();
    v7 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v6 count]);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:kTCCInfoService]);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:kTCCInfoGranted]);
          -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v15, v14);
        }

        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v10);
    }

    CFRelease(v5);
    v3 = v17;
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (id)ad_filteredDictionaryWithAppID:(id)a3
{
  id v4 = a3;
  CFBundleRef v5 = (void *)objc_claimAutoreleasedReturnValue(-[SANodeIntent dictionary](self, "dictionary"));
  id v39 = [v5 mutableCopy];

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SANodeIntent _tccAccessInfoForAppID:](self, "_tccAccessInfoForAppID:", v4));
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[SANodeIntent privacyPolicy](self, "privacyPolicy"));
  id v6 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v41;
    uint64_t v9 = SAIntentGroupPrivacyCategoryContactsValue;
    uint64_t v10 = SAIntentGroupPrivacyCategoryLocationServicesValue;
    uint64_t v37 = SAIntentGroupRedactionTargetMatchingSpansValue;
    uint64_t v35 = SAIntentGroupRedactionTargetNodeIntentValue;
    uint64_t v33 = SAIntentGroupRedactionTargetValueValue;
    uint64_t v32 = SANodeIntentValuePListKey;
    uint64_t v34 = SANodeIntentMatchingSpansPListKey;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "privacyCategory", v32));
        unsigned int v14 = [v13 isEqualToString:v9];

        if (v14)
        {
          if ([v4 isEqualToString:@"com.apple.mobileslideshow"])
          {
            unsigned __int8 v15 = 1;
          }

          else
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:kTCCServiceAddressBook]);
            unsigned __int8 v15 = [v16 BOOLValue];
          }
        }

        else
        {
          unsigned __int8 v15 = 0;
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue([v12 privacyCategory]);
        unsigned int v18 = [v17 isEqualToString:v10];

        if (v18)
        {
          if ((AFLocationStatusIsAllowed( +[CLLocationManager authorizationStatusForBundleIdentifier:]( &OBJC_CLASS___CLLocationManager,  "authorizationStatusForBundleIdentifier:",  v4)) & 1) != 0) {
            continue;
          }
        }

        else if ((v15 & 1) != 0)
        {
          continue;
        }

        __int128 v19 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          __int128 v20 = v19;
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v12 privacyCategory]);
          v22 = (void *)objc_claimAutoreleasedReturnValue([v12 redactionTarget]);
          *(_DWORD *)buf = 136315906;
          v45 = "-[SANodeIntent(ADGenericIntentRequestTransformer) ad_filteredDictionaryWithAppID:]";
          __int16 v46 = 2112;
          id v47 = v4;
          __int16 v48 = 2112;
          v49 = v21;
          __int16 v50 = 2112;
          v51 = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_INFO,  "%s Application %@ does not have access to %@, removing %@ from the intent node",  buf,  0x2Au);
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue([v12 redactionTarget]);
        unsigned int v24 = [v23 isEqualToString:v37];

        if (v24)
        {
          v25 = v39;
          uint64_t v26 = v34;
LABEL_19:
          [v25 removeObjectForKey:v26];
          continue;
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue([v12 redactionTarget]);
        unsigned int v28 = [v27 isEqualToString:v35];

        if (v28)
        {

          id v39 = 0LL;
        }

        else
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue([v12 redactionTarget]);
          unsigned int v30 = [v29 isEqualToString:v33];

          if (v30)
          {
            v25 = v39;
            uint64_t v26 = v32;
            goto LABEL_19;
          }
        }
      }

      id v7 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
    }

    while (v7);
  }

  return v39;
}

@end