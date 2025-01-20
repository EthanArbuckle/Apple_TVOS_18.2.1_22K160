@interface IPLocalizationSwitcher
- (IPLocalizationSwitcherServiceDelegate)delegate;
- (void)notifyPreferredLanguageChangedForBundleID:(id)a3;
- (void)preferredLanguagesForBundleID:(id)a3 reply:(id)a4;
- (void)preferredLanguagesForBundleIDs:(id)a3 reply:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPreferredLanguage:(id)a3 forBundleID:(id)a4 andRelaunchWithReply:(id)a5;
@end

@implementation IPLocalizationSwitcher

- (void)setPreferredLanguage:(id)a3 forBundleID:(id)a4 andRelaunchWithReply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  -[IPLocalizationSwitcher notifyPreferredLanguageChangedForBundleID:]( self,  "notifyPreferredLanguageChangedForBundleID:",  v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v8));
  id v12 = sub_10000272C();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Initalized app proxy for [%{public}@]",  buf,  0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSystemService sharedService](&OBJC_CLASS___FBSSystemService, "sharedService"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"localizationswitcherd is about to switch language to [%@] for application with bundle identifier: [%@]",  v10,  v8));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v16));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100002208;
  v21[3] = &unk_100004348;
  id v23 = v11;
  id v24 = v9;
  id v22 = v8;
  id v18 = v11;
  id v19 = v8;
  id v20 = v9;
  [v14 terminateApplication:v15 forReason:3 andReport:0 withDescription:v17 completion:v21];
}

- (void)notifyPreferredLanguageChangedForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IPLocalizationSwitcher delegate](self, "delegate"));
  [v5 preferredLanguageChangedForBundleID:v4];
}

- (void)preferredLanguagesForBundleID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[IntlUtility _preferredLanguagesForBundleID:]( &OBJC_CLASS___IntlUtility,  "_preferredLanguagesForBundleID:",  a3));
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)preferredLanguagesForBundleIDs:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  if ([v5 count])
  {
    id v18 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
          uint64_t v14 = objc_claimAutoreleasedReturnValue( +[IntlUtility _preferredLanguagesForBundleID:]( &OBJC_CLASS___IntlUtility,  "_preferredLanguagesForBundleID:",  v13));
          v15 = (void *)v14;
          if (v14) {
            v16 = (void *)v14;
          }
          else {
            v16 = &__NSArray0__struct;
          }
          id v17 = v16;

          [v7 setObject:v17 forKeyedSubscript:v13];
          CFPreferencesFlushCaches();
        }

        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v10);
    }

    id v6 = v18;
    ((void (**)(id, void *))v18)[2](v18, v7);
  }

  else
  {
    v6[2](v6, 0LL);
  }
}

- (IPLocalizationSwitcherServiceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end