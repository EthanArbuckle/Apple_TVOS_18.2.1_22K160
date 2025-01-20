@interface TVSettingsLicenseUtilities
+ (id)_termsRequest;
+ (id)gameCenterTermsText;
+ (id)iCloudTermsText;
+ (id)iTunesTermsText;
+ (id)legalSafetyText;
+ (id)softwareLicenseText;
+ (id)warrantyText;
+ (void)_decodeTermsData:(id)a3;
+ (void)_downloadTerms;
+ (void)_getBuiltinTerms;
+ (void)initialize;
@end

@implementation TVSettingsLicenseUtilities

+ (id)_termsRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  @"https://setup.icloud.com/setup/atv/tos"));
  v3 = -[NSMutableURLRequest initWithURL:cachePolicy:timeoutInterval:]( objc_alloc(&OBJC_CLASS___NSMutableURLRequest),  "initWithURL:cachePolicy:timeoutInterval:",  v2,  1LL,  30.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userAgent]);
  -[NSMutableURLRequest setValue:forHTTPHeaderField:](v3, "setValue:forHTTPHeaderField:", v5, @"User-Agent");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AADeviceInfo clientInfoHeader](&OBJC_CLASS___AADeviceInfo, "clientInfoHeader"));
  -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v3,  "setValue:forHTTPHeaderField:",  v6,  @"X-MMe-Client-Info");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](&OBJC_CLASS___NSLocale, "currentLocale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:NSLocaleCountryCode]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 uppercaseString]);
  -[NSMutableURLRequest setValue:forHTTPHeaderField:](v3, "setValue:forHTTPHeaderField:", v9, @"X-MMe-Country");

  v10 = (__CFString *)_CFNetworkCopyPreferredLanguageCode();
  if (v10)
  {
    v11 = v10;
    if (-[__CFString hasPrefix:](v10, "hasPrefix:", @"es-"))
    {
      v12 = (void *)CFPreferencesCopyAppValue(@"AppleLocale", kCFPreferencesAnyApplication);
      if ([@"es_MX" isEqual:v12])
      {

        v11 = @"es-mx";
      }
    }
  }

  else
  {
    v11 = @"en-us";
  }

  -[NSMutableURLRequest setValue:forHTTPHeaderField:](v3, "setValue:forHTTPHeaderField:", v11, @"Accept-Language");
  -[NSMutableURLRequest setValue:forHTTPHeaderField:]( v3,  "setValue:forHTTPHeaderField:",  @"true",  @"X-MMe-Show-Warranty");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aa_primaryAppleAccount"));
  if (v14) {
    -[NSMutableURLRequest aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:]( v3,  "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:",  v14,  1LL);
  }

  return v3;
}

+ (void)_decodeTermsData:(id)a3
{
  if (a3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  a3,  0LL,  0LL));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"terms"]);
    id v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v16 != v5) {
            objc_enumerationMutation(obj);
          }
          v7 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"termsType"]);
          v9 = objc_alloc(&OBJC_CLASS___NSData);
          v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"terms"]);
          v11 = -[NSData initWithBase64EncodedString:options:](v9, "initWithBase64EncodedString:options:", v10, 0LL);

          v12 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  v11,  4LL);
          [(id)qword_1001E1938 setObject:v12 forKeyedSubscript:v8];
        }

        id v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v4);
    }
  }

+ (void)_getBuiltinTerms
{
  uint64_t v2 = SFLicenseFilePath(a1, a2);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:"));
  id v4 = v3;
  if (v3) {
    id v3 = [(id)qword_1001E1938 setObject:v3 forKeyedSubscript:@"tvOS"];
  }
  uint64_t v5 = SFWarrantyFilePath(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithContentsOfFile:encoding:error:]( &OBJC_CLASS___NSString,  "stringWithContentsOfFile:encoding:error:",  v6,  4LL,  0LL));
  if (v7) {
    [(id)qword_1001E1938 setObject:v7 forKeyedSubscript:@"iOSWarranty"];
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"TVSettingsPrivacyPolicy" value:&stru_100195DD8 table:@"Localizable"]);

  if (v9) {
    [(id)qword_1001E1938 setObject:v9 forKeyedSubscript:@"Privacy"];
  }
}

+ (void)_downloadTerms
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  [v3 setRequestCachePolicy:1];
  id v4 = objc_alloc_init(&OBJC_CLASS___AKAppleIDSession);
  objc_msgSend(v3, "set_appleIDContext:", v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](&OBJC_CLASS___NSURLSession, "sessionWithConfiguration:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _termsRequest]);
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_10008C30C;
  v11 = &unk_10018F318;
  objc_copyWeak(&v12, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 dataTaskWithRequest:v6 completionHandler:&v8]);

  objc_msgSend(v7, "resume", v8, v9, v10, v11);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

+ (void)initialize
{
  uint64_t v3 = objc_opt_class(a1);
  if (v3 == objc_opt_class(&OBJC_CLASS___TVSettingsLicenseUtilities))
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v5 = (void *)qword_1001E1938;
    qword_1001E1938 = (uint64_t)v4;

    [a1 _getBuiltinTerms];
    _[a1 _downloadTerms];
  }

+ (id)softwareLicenseText
{
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue([(id)qword_1001E1938 objectForKeyedSubscript:@"tvOS"]);
  if (!v2) {
    uint64_t v2 = &stru_100195DD8;
  }
  return v2;
}

+ (id)warrantyText
{
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue([(id)qword_1001E1938 objectForKeyedSubscript:@"iOSWarranty"]);
  if (!v2) {
    uint64_t v2 = &stru_100195DD8;
  }
  return v2;
}

+ (id)gameCenterTermsText
{
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue([(id)qword_1001E1938 objectForKeyedSubscript:@"GameCenter"]);
  if (!v2) {
    uint64_t v2 = &stru_100195DD8;
  }
  return v2;
}

+ (id)iCloudTermsText
{
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue([(id)qword_1001E1938 objectForKeyedSubscript:@"iCloud"]);
  if (!v2) {
    uint64_t v2 = &stru_100195DD8;
  }
  return v2;
}

+ (id)iTunesTermsText
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", a1));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"LegaliTunesTermsShortWithURL" value:&stru_100195DD8 table:@"Localizable"]);

  return v3;
}

+ (id)legalSafetyText
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  uint64_t v3 = TSKLocStringFromBundleCachingKey(@"LegalSafetyText", v2, 1LL, 0LL, @"Localizable-J255");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

@end