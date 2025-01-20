@interface UALocalizedString
+ (id)_UABundle;
+ (id)localizedStringForKey:(id)a3 comment:(id)a4;
@end

@implementation UALocalizedString

+ (id)localizedStringForKey:(id)a3 comment:(id)a4
{
  id v4 = a3;
  os_log_t v5 = sub_100039584(@"Localization");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412290;
    id v19 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Looking for localized string for key: %@",  (uint8_t *)&v18,  0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UALocalizedString _UABundle](&OBJC_CLASS___UALocalizedString, "_UABundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizations]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v8,  v9));

  if ([v10 count])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue( [v7 pathForResource:@"Localizable" ofType:@"strings" inDirectory:@"." forLocalization:v11]);
    v13 = -[NSDictionary initWithContentsOfFile:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithContentsOfFile:",  v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v13, "objectForKey:", v4));
    if (!v14)
    {
      os_log_t v15 = sub_100039584(@"Localization");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Falling back to NSLocalizedString",  (uint8_t *)&v18,  2u);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:v4 value:&stru_1000BE738 table:@"Localizable"]);
    }
  }

  else
  {
    v13 = 0LL;
    v14 = 0LL;
  }

  return v14;
}

+ (id)_UABundle
{
  return +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PrivateFrameworks/UserActivity.framework");
}

@end