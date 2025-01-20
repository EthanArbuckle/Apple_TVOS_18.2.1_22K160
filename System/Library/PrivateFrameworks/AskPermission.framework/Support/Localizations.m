@interface Localizations
+ (BOOL)_useROWKeyForCountryCode:(id)a3;
+ (id)_countryCodes;
+ (id)_stringWithKey:(id)a3 localeIdentifier:(id)a4;
+ (id)stringWithKey:(id)a3;
+ (id)stringWithKey:(id)a3 bag:(id)a4;
+ (id)stringWithKey:(id)a3 countryCode:(id)a4 localeIdentifier:(id)a5;
@end

@implementation Localizations

+ (id)stringWithKey:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag sharedBag](&OBJC_CLASS___AMSBag, "sharedBag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 stringWithKey:v4 bag:v5]);

  return v6;
}

+ (id)stringWithKey:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 countryCode]);
  id v27 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueWithError:&v27]);
  id v10 = v27;

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v11) {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138543618;
      v29 = v13;
      __int16 v30 = 2114;
      id v31 = v10;
      id v14 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to retreive country code bag key. Error: %{public}@",  buf,  0x16u);
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([v7 localeIdentifier]);
  id v26 = v10;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 valueWithError:&v26]);
  id v17 = v26;

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v18) {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 OSLogObject]);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_opt_class(a1);
      *(_DWORD *)buf = 138543618;
      v29 = v20;
      __int16 v30 = 2114;
      id v31 = v17;
      id v21 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to retreive language bag key. Error: %{public}@",  buf,  0x16u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 localeIdentifier]);

    v16 = (void *)v23;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([a1 stringWithKey:v6 countryCode:v9 localeIdentifier:v16]);

  return v24;
}

+ (id)stringWithKey:(id)a3 countryCode:(id)a4 localeIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingString:@"_ROW"]);
  unsigned int v12 = [a1 _useROWKeyForCountryCode:v10];

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _stringWithKey:v11 localeIdentifier:v9]);
    id v14 = v13;
    if (v13)
    {
      v15 = v13;
      if (![v13 isEqualToString:v11])
      {
LABEL_7:
        goto LABEL_8;
      }
    }
  }

  else
  {
    id v14 = 0LL;
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 _stringWithKey:v8 localeIdentifier:v9]);

  if (v15) {
    goto LABEL_7;
  }
LABEL_8:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v16) {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v20 = 138543362;
    id v21 = (id)objc_opt_class(a1);
    id v18 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to retreive localized string",  (uint8_t *)&v20,  0xCu);
  }

LABEL_13:
  return v15;
}

+ (id)_countryCodes
{
  if (qword_10003A9F8 != -1) {
    dispatch_once(&qword_10003A9F8, &stru_100030C18);
  }
  return (id)qword_10003AA00;
}

+ (id)_stringWithKey:(id)a3 localeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___APRequestHandler));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizations]);
  id v25 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:forPreferences:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:forPreferences:",  v10,  v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 firstObject]);

  if (!v13)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v19) {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138543362;
      id v24 = (id)objc_opt_class(a1);
      id v21 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to retreive language from bundle",  (uint8_t *)&v23,  0xCu);
    }

    uint64_t v20 = 0LL;
    goto LABEL_14;
  }

  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:v6 value:0 table:@"Localizable" localization:v13]);
  v15 = v14;
  if (!v14 || -[os_log_s isEqualToString:](v14, "isEqualToString:", v6))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
    if (!v16) {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138543362;
      id v24 = (id)objc_opt_class(a1);
      id v18 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to find localized string in bundle.",  (uint8_t *)&v23,  0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 localizedStringForKey:v6 value:&stru_100031BA0 table:@"Localizable"]);
LABEL_14:

    v15 = (os_log_s *)v20;
  }

  return v15;
}

+ (BOOL)_useROWKeyForCountryCode:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue([a1 _countryCodes]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uppercaseString]);

    unsigned int v7 = [v5 containsObject:v6] ^ 1;
  }

  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

@end