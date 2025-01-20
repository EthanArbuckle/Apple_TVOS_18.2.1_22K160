@interface AAPCommandSearch
- (void)performWithCompletion:(id)a3;
@end

@implementation AAPCommandSearch

- (void)performWithCompletion:(id)a3
{
  if (a3)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_61D0;
    v9[3] = &unk_1C678;
    v9[4] = a3;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v5 = -[AAPCommandSearch applicationName](self, "applicationName");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_6230;
    v8[3] = &unk_1C6A0;
    v8[4] = v5;
    v8[5] = v4;
    AFApplicationWorkspaceEnumerateInstalledUserVisibleApplications(v8);
    v6 = (os_log_s *)AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
      id v7 = -[NSMutableArray count](v4, "count");
      *(_DWORD *)buf = 136315906;
      v11 = "-[AAPCommandSearch performWithCompletion:]";
      __int16 v12 = 2048;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v5;
      __int16 v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%s Found %tu apps matching name %@: %@", buf, 0x2Au);
    }

    sub_61D0((uint64_t)v9, (uint64_t)v4);
  }

@end