@interface AAPCommandFilterNonRestricted
- (void)performWithCompletion:(id)a3;
@end

@implementation AAPCommandFilterNonRestricted

- (void)performWithCompletion:(id)a3
{
  id v5 = -[AAPCommandFilterNonRestricted appIds](self, "appIds");
  v47 = +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v5 count]);
  v6 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint");
  v7 = (os_log_t *)&AFSiriLogContextPlugin;
  if (v6)
  {
    v8 = v6;
    id v42 = a3;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id v9 = [v5 countByEnumeratingWithState:&v49 objects:v66 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v50;
      uint64_t v43 = SAAppsAppRestrictionReasonNOT_FOUNDValue;
      uint64_t v46 = SAAppsAppRestrictionReasonRESTRICTEDValue;
      uint64_t v44 = *(void *)v50;
      v45 = v8;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v50 != v11) {
            objc_enumerationMutation(v5);
          }
          v13 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
          uint64_t v48 = 1LL;
          if (-[FBSOpenApplicationService canOpenApplication:reason:]( v8,  "canOpenApplication:reason:",  v13,  &v48))
          {
            v14 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
            {
              uint64_t v15 = objc_opt_class(self);
              *(_DWORD *)buf = 136315906;
              v55 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
              __int16 v56 = 2114;
              uint64_t v57 = v15;
              __int16 v58 = 2048;
              v59 = self;
              __int16 v60 = 2112;
              id v61 = v13;
              _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can be launched - filtering",  buf,  0x2Au);
            }
          }

          else if (v48 == 4)
          {
            v20 = +[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL);
            unsigned int v21 = objc_msgSend( +[LSApplicationProxy applicationProxyForIdentifier:]( LSApplicationProxy,  "applicationProxyForIdentifier:",  v13),  "isRestricted");
            v22 = *v7;
            BOOL v23 = os_log_type_enabled(*v7, OS_LOG_TYPE_INFO);
            if (v21)
            {
              uint64_t v24 = v46;
              if (v23)
              {
                uint64_t v25 = objc_opt_class(self);
                *(_DWORD *)buf = 136315906;
                v55 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
                __int16 v56 = 2114;
                uint64_t v57 = v25;
                __int16 v58 = 2048;
                v59 = self;
                __int16 v60 = 2112;
                id v61 = v13;
                _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched because it is restricted - not filtering",  buf,  0x2Au);
                uint64_t v24 = v46;
              }
            }

            else
            {
              uint64_t v24 = v43;
              if (v23)
              {
                uint64_t v26 = objc_opt_class(self);
                id v27 = v5;
                v28 = v7;
                uint64_t v29 = v48;
                uint64_t v30 = FBSOpenApplicationErrorCodeToString(v48);
                *(_DWORD *)buf = 136316418;
                v55 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
                __int16 v56 = 2114;
                uint64_t v57 = v26;
                __int16 v58 = 2048;
                v59 = self;
                __int16 v60 = 2112;
                id v61 = v13;
                __int16 v62 = 2048;
                uint64_t v63 = v29;
                v7 = v28;
                id v5 = v27;
                __int16 v64 = 2112;
                uint64_t v65 = v30;
                _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched with result=%li(%@) (rest ricted) - not filtering",  buf,  0x3Eu);
                uint64_t v24 = v43;
              }
            }

            -[NSMutableArray addObject:](v20, "addObject:", v24);
            -[NSMutableDictionary setObject:forKey:]( v47,  "setObject:forKey:",  -[NSMutableArray copy](v20, "copy"),  v13);
            uint64_t v11 = v44;
            v8 = v45;
          }

          else
          {
            if (v48 != 5)
            {
              v33 = *v7;
              if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
              {
                uint64_t v39 = objc_opt_class(self);
                uint64_t v40 = v48;
                uint64_t v41 = FBSOpenApplicationErrorCodeToString(v48);
                *(_DWORD *)buf = 136316418;
                v55 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
                __int16 v56 = 2114;
                uint64_t v57 = v39;
                __int16 v58 = 2048;
                v59 = self;
                __int16 v60 = 2112;
                id v61 = v13;
                __int16 v62 = 2048;
                uint64_t v63 = v40;
                __int16 v64 = 2112;
                uint64_t v65 = v41;
                _os_log_error_impl( &dword_0,  v33,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched with result=%li(%@) - bailing",  buf,  0x3Eu);
              }

              a3 = v42;
              goto LABEL_29;
            }

            v16 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
            {
              uint64_t v17 = objc_opt_class(self);
              uint64_t v18 = v48;
              uint64_t v19 = FBSOpenApplicationErrorCodeToString(v48);
              *(_DWORD *)buf = 136316418;
              v55 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
              __int16 v56 = 2114;
              uint64_t v57 = v17;
              __int16 v58 = 2048;
              v59 = self;
              __int16 v60 = 2112;
              id v61 = v13;
              __int16 v62 = 2048;
              uint64_t v63 = v18;
              uint64_t v11 = v44;
              v8 = v45;
              __int16 v64 = 2112;
              uint64_t v65 = v19;
              _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched with result=%li(%@) - not filtering",  buf,  0x3Eu);
            }

            uint64_t v53 = v46;
            -[NSMutableDictionary setObject:forKey:]( v47,  "setObject:forKey:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v53, 1LL),  v13);
          }
        }

        id v10 = [v5 countByEnumeratingWithState:&v49 objects:v66 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v31 = objc_alloc_init(&OBJC_CLASS___SAAppsGetRestrictedAppsResponse);
    [v31 setAppToItsRestrictionsMap:v47];
    objc_msgSend(v31, "setRestrictedApps:", -[NSMutableDictionary allKeys](v47, "allKeys"));
    a3 = v42;
  }

  else
  {
    v32 = (os_log_s *)AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_12588((uint64_t)self, (uint64_t)v5, v32);
    }
LABEL_29:
    id v31 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  }

  id v34 = [v31 dictionary];

  v35 = *v7;
  BOOL v36 = os_log_type_enabled(*v7, OS_LOG_TYPE_INFO);
  if (a3)
  {
    if (v36)
    {
      uint64_t v37 = objc_opt_class(self);
      *(_DWORD *)buf = 136315906;
      v55 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
      __int16 v56 = 2114;
      uint64_t v57 = v37;
      __int16 v58 = 2048;
      v59 = self;
      __int16 v60 = 2112;
      id v61 = v34;
      _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: <%{public}@:%p> sending response = %@",  buf,  0x2Au);
    }

    (*((void (**)(id, id))a3 + 2))(a3, v34);
  }

  else if (v36)
  {
    uint64_t v38 = objc_opt_class(self);
    *(_DWORD *)buf = 136315906;
    v55 = "-[AAPCommandFilterNonRestricted performWithCompletion:]";
    __int16 v56 = 2114;
    uint64_t v57 = v38;
    __int16 v58 = 2048;
    v59 = self;
    __int16 v60 = 2112;
    id v61 = v34;
    _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: <%{public}@:%p> no completion block - dropping response = %@",  buf,  0x2Au);
  }

@end