@interface SAAppsAppSearch
- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4;
@end

@implementation SAAppsAppSearch

- (void)_ad_handleAppLaunchCommandWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_1001287CC;
  v19 = &unk_1004F2320;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SAAppsAppSearch applicationName](self, "applicationName"));
  id v20 = v9;
  v10 = v8;
  v21 = v10;
  AFApplicationWorkspaceEnumerateInstalledUserVisibleApplications(&v16);
  v11 = (void *)AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    id v13 = -[NSMutableArray count](v10, "count", v16, v17, v18, v19, v20);
    *(_DWORD *)buf = 136315906;
    v23 = "-[SAAppsAppSearch(ADSiriAppLaunchRequestHandler) _ad_handleAppLaunchCommandWithRequest:completion:]";
    __int16 v24 = 2048;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    v29 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Found %tu apps matching name %@: %@",  buf,  0x2Au);
  }

  id v14 = objc_alloc_init(&OBJC_CLASS___SAAppsAppSearchResponse);
  [v14 setFoundApps:v10];
  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 createResponseWithReplyCommand:v14]);

  if (v6) {
    (*((void (**)(id, void *, void, void))v6 + 2))(v6, v15, 0LL, 0LL);
  }
}

@end