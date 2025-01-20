@interface MSDLocalization
+ (id)sharedInstance;
- (MSDLocalization)init;
- (NSDictionary)localizationTable;
- (id)localizedStringWithKey:(id)a3 defaultString:(id)a4;
- (void)setLocalizationTable:(id)a3;
@end

@implementation MSDLocalization

+ (id)sharedInstance
{
  if (qword_100125338 != -1) {
    dispatch_once(&qword_100125338, &stru_1000F9C20);
  }
  return (id)qword_100125330;
}

- (MSDLocalization)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MSDLocalization;
  v2 = -[MSDLocalization init](&v16, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/Applications/StoreDemoViewService.app"));
    v4 = v3;
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue([v3 localizations]);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
      v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v5,  v6));

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0LL));
      v9 = (void *)objc_claimAutoreleasedReturnValue( [v4 pathForResource:@"demod" ofType:@"strings" inDirectory:@"." forLocalization:v8]);

      v10 = -[NSDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfFile:",  v9);
      localizationTable = v2->_localizationTable;
      v2->_localizationTable = v10;
    }

    else
    {
      id v12 = sub_10003A95C();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10009663C(v13);
      }

      v7 = v2->_localizationTable;
      v2->_localizationTable = 0LL;
    }

    v14 = v2;
  }

  return v2;
}

- (id)localizedStringWithKey:(id)a3 defaultString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLocalization localizationTable](self, "localizationTable"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLocalization localizationTable](self, "localizationTable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v6]);

    v11 = v10;
    if (!v10)
    {
      id v12 = sub_10003A95C();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
        int v17 = 138543618;
        id v18 = v6;
        __int16 v19 = 2114;
        v20 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Localization lookup failed for key %{public}@, preferred languages %{public}@",  (uint8_t *)&v17,  0x16u);
      }

      v11 = v7;
    }

    id v15 = v11;
  }

  else
  {
    id v15 = v7;
  }

  return v15;
}

- (NSDictionary)localizationTable
{
  return self->_localizationTable;
}

- (void)setLocalizationTable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end