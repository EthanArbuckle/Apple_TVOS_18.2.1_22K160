@interface AAPApplicationTerminator
- (void)terminateAllAppsExcludingBundleIdentifiers:(id)a3 completion:(id)a4;
@end

@implementation AAPApplicationTerminator

- (void)terminateAllAppsExcludingBundleIdentifiers:(id)a3 completion:(id)a4
{
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_681C;
  v25[3] = &unk_1C6F8;
  v25[4] = v5;
  AFApplicationWorkspaceEnumerateInstalledUserVisibleApplications(v25);
  v6 = -[NSMutableSet initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithCapacity:",  -[NSMutableSet count](v5, "count"));
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v21,  v31,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        *(void *)buf = 0LL;
        id v12 = +[RBSProcessHandle handleForPredicate:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForPredicate:error:",  +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  v11),  buf);
      }

      id v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v21,  v31,  16LL);
    }

    while (v8);
  }

  if (-[NSMutableSet count](v6, "count"))
  {
    uint64_t v20 = 0LL;
    if (objc_msgSend( objc_msgSend( [RBSTerminateRequest alloc],  "initWithPredicate:context:",  +[RBSProcessPredicate predicateMatchingBundleIdentifiers:]( RBSProcessPredicate,  "predicateMatchingBundleIdentifiers:",  v6),  objc_msgSend( [RBSTerminateContext alloc],  "initWithExplanation:",  @"Siri asked to terminate all applications")),  "execute:",  &v20))
    {
      v13 = (os_log_s *)AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[AAPApplicationTerminator terminateAllAppsExcludingBundleIdentifiers:completion:]";
        _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: Terminated all running apps successfully",  buf,  0xCu);
      }

      if (a4)
      {
        v14 = 0LL;
LABEL_26:
        (*((void (**)(id, NSError *))a4 + 2))(a4, v14);
      }
    }

    else
    {
      v16 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      v30 = @"Failed to terminate one or more of the running apps";
      v17 = -[NSMutableDictionary initWithDictionary:]( v16,  "initWithDictionary:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
      v18 = v17;
      if (v20) {
        -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v20, NSUnderlyingErrorKey);
      }
      v14 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.assistant.appsync.apptermination",  2LL,  v18);
      v19 = (os_log_s *)AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[AAPApplicationTerminator terminateAllAppsExcludingBundleIdentifiers:completion:]";
        __int16 v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: %@", buf, 0x16u);
      }

      if (a4) {
        goto LABEL_26;
      }
    }
  }

  else
  {
    v15 = (os_log_s *)AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[AAPApplicationTerminator terminateAllAppsExcludingBundleIdentifiers:completion:]";
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_INFO,  "%s com.apple.siri.applications: No running apps to terminate",  buf,  0xCu);
    }

    if (a4) {
      (*((void (**)(id, void))a4 + 2))(a4, 0LL);
    }
  }

@end