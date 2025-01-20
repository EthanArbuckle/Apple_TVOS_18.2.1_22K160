@interface NILocalization
+ (id)_niFrameworkBundle;
+ (id)_niLocalizedStringFromBundle:(id)a3 withKey:(id)a4;
+ (id)_niLocalizedStringFromFrameworkBundleWithKey:(id)a3;
+ (id)fallbackBundle;
+ (id)fallbackBundleWithBundle:(id)a3;
+ (id)localizedBundle;
+ (id)localizedBundleWithBundle:(id)a3;
@end

@implementation NILocalization

+ (id)_niFrameworkBundle
{
  if (qword_1007F9AD0 != -1) {
    dispatch_once(&qword_1007F9AD0, &stru_1007B64A0);
  }
  return (id)qword_1007F9AC8;
}

+ (id)_niLocalizedStringFromFrameworkBundleWithKey:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(a1, v5), "localizedBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedStringForKey:v4 value:0 table:0]);

  if (!v8)
  {
    id v10 = objc_msgSend((id)objc_opt_class(a1, v9), "fallbackBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:v4 value:0 table:0]);

    if (!v8)
    {
      id v13 = objc_msgSend((id)objc_opt_class(a1, v12), "_niFrameworkBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:v4 value:0 table:0]);
    }
  }

  return v8;
}

+ (id)fallbackBundle
{
  v3 = (void *)objc_opt_class(a1, a2);
  id v5 = objc_msgSend((id)objc_opt_class(a1, v4), "_niFrameworkBundle");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 fallbackBundleWithBundle:v6]);

  return v7;
}

+ (id)localizedBundle
{
  v3 = (void *)objc_opt_class(a1, a2);
  id v5 = objc_msgSend((id)objc_opt_class(a1, v4), "_niFrameworkBundle");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedBundleWithBundle:v6]);

  return v7;
}

+ (id)_niLocalizedStringFromBundle:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = objc_msgSend((id)objc_opt_class(a1, v8), "localizedBundleWithBundle:", v6);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedStringForKey:v7 value:0 table:0]);

  if (!v11)
  {
    id v13 = objc_msgSend((id)objc_opt_class(a1, v12), "fallbackBundleWithBundle:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v14 localizedStringForKey:v7 value:0 table:0]);

    if (!v11) {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedStringForKey:v7 value:0 table:0]);
    }
  }

  return v11;
}

+ (id)fallbackBundleWithBundle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@"-"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v3 pathForResource:@"Localizable" ofType:@"strings" inDirectory:0 forLocalization:v7]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByDeletingLastPathComponent]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v9));

  return v10;
}

+ (id)localizedBundleWithBundle:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
  id v7 = objc_msgSend((id)objc_opt_class(a1, v6), "_niFrameworkBundle");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizations]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v9,  v5));

  v11 = (void *)objc_claimAutoreleasedReturnValue([v4 resourcePath]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.lproj", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingPathComponent:v13]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v14));

  return v15;
}

@end