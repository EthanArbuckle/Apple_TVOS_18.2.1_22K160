@interface AAPCommandCheckRestriction
- (void)performWithCompletion:(id)a3;
@end

@implementation AAPCommandCheckRestriction

- (void)performWithCompletion:(id)a3
{
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v39 = sub_ECEC;
  v40 = &unk_1C628;
  v41 = self;
  id v42 = a3;
  id v4 = -[AAPCommandCheckRestriction launchId](self, "launchId");
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    v6 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint");
    uint64_t v37 = 1LL;
    if (-[FBSOpenApplicationService canOpenApplication:reason:]( v6,  "canOpenApplication:reason:",  v5,  &v37))
    {
      v7 = (os_log_s *)AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = objc_opt_class(self);
        *(_DWORD *)buf = 136315906;
        v44 = "-[AAPCommandCheckRestriction performWithCompletion:]";
        __int16 v45 = 2114;
        uint64_t v46 = v8;
        __int16 v47 = 2048;
        v48 = self;
        __int16 v49 = 2112;
        uint64_t v50 = v5;
        _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can be launched",  buf,  0x2Au);
      }

      v9 = (objc_class **)&OBJC_CLASS___SACommandSucceeded_ptr;
      goto LABEL_29;
    }

    if (!v6)
    {
      v13 = (os_log_s *)AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_124D8((uint64_t)self, v5, v13);
      }
      goto LABEL_28;
    }

    if (v37 == 4)
    {
      id v14 = +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v5);
      if (v14)
      {
        v15 = v14;
        unsigned int v16 = [v14 isRestricted];
        v12 = (os_log_s *)AFSiriLogContextPlugin;
        BOOL v17 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO);
        if (v16)
        {
          if (v17)
          {
            uint64_t v18 = objc_opt_class(self);
            uint64_t v19 = v37;
            uint64_t v20 = FBSOpenApplicationErrorCodeToString(v37);
            unsigned int v21 = [v15 isRestricted];
            *(_DWORD *)buf = 136316674;
            v44 = "-[AAPCommandCheckRestriction performWithCompletion:]";
            __int16 v45 = 2114;
            uint64_t v46 = v18;
            __int16 v47 = 2048;
            v48 = self;
            __int16 v49 = 2112;
            uint64_t v50 = v5;
            __int16 v51 = 2048;
            uint64_t v52 = v19;
            __int16 v53 = 2112;
            uint64_t v54 = v20;
            __int16 v55 = 1024;
            unsigned int v56 = v21;
            v22 = "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched with result=%li(%@) restricted=%i";
            v23 = v12;
            uint32_t v24 = 68;
LABEL_27:
            _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, v22, buf, v24);
          }
        }

        else if (v17)
        {
LABEL_25:
          uint64_t v32 = objc_opt_class(self);
          uint64_t v33 = v37;
          uint64_t v34 = FBSOpenApplicationErrorCodeToString(v37);
          *(_DWORD *)buf = 136316418;
          v44 = "-[AAPCommandCheckRestriction performWithCompletion:]";
          __int16 v45 = 2114;
          uint64_t v46 = v32;
          __int16 v47 = 2048;
          v48 = self;
          __int16 v49 = 2112;
          uint64_t v50 = v5;
          __int16 v51 = 2048;
          uint64_t v52 = v33;
          __int16 v53 = 2112;
          uint64_t v54 = v34;
          v22 = "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched with result=%li(%@)";
          goto LABEL_26;
        }
      }

      else
      {
        v12 = (os_log_s *)AFSiriLogContextPlugin;
        if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
        {
          uint64_t v29 = objc_opt_class(self);
          uint64_t v30 = v37;
          uint64_t v31 = FBSOpenApplicationErrorCodeToString(v37);
          *(_DWORD *)buf = 136316418;
          v44 = "-[AAPCommandCheckRestriction performWithCompletion:]";
          __int16 v45 = 2114;
          uint64_t v46 = v29;
          __int16 v47 = 2048;
          v48 = self;
          __int16 v49 = 2112;
          uint64_t v50 = v5;
          __int16 v51 = 2048;
          uint64_t v52 = v30;
          __int16 v53 = 2112;
          uint64_t v54 = v31;
          v22 = "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched with result=%li(%@) (no app proxy)";
LABEL_26:
          v23 = v12;
          uint32_t v24 = 62;
          goto LABEL_27;
        }
      }
    }

    else
    {
      if (v37 != 5)
      {
        v25 = (os_log_s *)AFSiriLogContextPlugin;
        if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
        {
          uint64_t v26 = objc_opt_class(self);
          uint64_t v27 = v37;
          uint64_t v28 = FBSOpenApplicationErrorCodeToString(v37);
          *(_DWORD *)buf = 136316418;
          v44 = "-[AAPCommandCheckRestriction performWithCompletion:]";
          __int16 v45 = 2114;
          uint64_t v46 = v26;
          __int16 v47 = 2048;
          v48 = self;
          __int16 v49 = 2112;
          uint64_t v50 = v5;
          __int16 v51 = 2048;
          uint64_t v52 = v27;
          __int16 v53 = 2112;
          uint64_t v54 = v28;
          _os_log_error_impl( &dword_0,  v25,  OS_LOG_TYPE_ERROR,  "%s com.apple.siri.applications: <%{public}@:%p> app (%@) can not be launched with result=%li(%@) (could not determine)",  buf,  0x3Eu);
        }

        goto LABEL_28;
      }

      v12 = (os_log_s *)AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO)) {
        goto LABEL_25;
      }
    }

@end