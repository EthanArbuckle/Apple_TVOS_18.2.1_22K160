@interface CDAppSignInUtilities
+ (void)allWebCredentialsDomainsForApplicationIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)approvedWebCredentialsDomainsForApplicationIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)canPerformAuthKitRequest:(id)a3 withAuthKitAccount:(id)a4 clientBundleIdentifier:(id)a5 completionHandler:(id)a6;
+ (void)preparePasskeyRequestsWithRequest:(id)a3 applicationIdentifier:(id)a4 approvedWebCredentialsDomains:(id)a5 completionHandler:(id)a6;
+ (void)sendSessionActivatedMetricsWithRequest:(id)a3 approvedAssociatedDomains:(id)a4;
+ (void)sendSessionCompletedMetricsWithError:(id)a3;
@end

@implementation CDAppSignInUtilities

+ (void)approvedWebCredentialsDomainsForApplicationIdentifier:(id)a3 completionHandler:(id)a4
{
}

+ (void)allWebCredentialsDomainsForApplicationIdentifier:(id)a3 completionHandler:(id)a4
{
}

+ (void)canPerformAuthKitRequest:(id)a3 withAuthKitAccount:(id)a4 clientBundleIdentifier:(id)a5 completionHandler:(id)a6
{
}

+ (void)sendSessionActivatedMetricsWithRequest:(id)a3 approvedAssociatedDomains:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2810000000LL;
  v16 = &unk_10002DBBB;
  char v17 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 appleIDRequest]);

  if (v7) {
    *((_BYTE *)v14 + 32) |= 1u;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 passwordRequest]);

  if (v8) {
    *((_BYTE *)v14 + 32) |= 2u;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 customAuthenticationMethods]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100018A08;
  v12[3] = &unk_100030F50;
  v12[4] = &v13;
  [v9 enumerateObjectsUsingBlock:v12];

  id v10 = [v6 count];
  unsigned int v11 = *((unsigned __int8 *)v14 + 32);
  if (v10)
  {
    v11 |= 0x20u;
    *((_BYTE *)v14 + 32) = v11;
  }

  +[CPSMetrics sendAppSignInSessionActivatedEvent:]( &OBJC_CLASS___CPSMetrics,  "sendAppSignInSessionActivatedEvent:",  v11);
  _Block_object_dispose(&v13, 8);
}

+ (void)sendSessionCompletedMetricsWithError:(id)a3
{
  id v9 = a3;
  uint64_t CustomAuthenticationMethod = CPSErrorGetCustomAuthenticationMethod();
  uint64_t v4 = objc_claimAutoreleasedReturnValue(CustomAuthenticationMethod);
  id v5 = (void *)v4;
  if (!v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
    if ([v7 isEqualToString:CPSErrorDomain])
    {
      id v8 = [v9 code];

      if (v8 == (id)104)
      {
        uint64_t v6 = 2LL;
        goto LABEL_8;
      }
    }

    else
    {
    }

    uint64_t v6 = 3LL;
    goto LABEL_8;
  }

  uint64_t v6 = CPSMetricsSessionResultWithCustomMethod(v4);
LABEL_8:
  +[CPSMetrics sendAppSignInSessionCompletedEvent:](&OBJC_CLASS___CPSMetrics, "sendAppSignInSessionCompletedEvent:", v6);
}

+ (void)preparePasskeyRequestsWithRequest:(id)a3 applicationIdentifier:(id)a4 approvedWebCredentialsDomains:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void *))a6;
  uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 platformKeyCredentialAssertionOptions]);
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v10 platformKeyCredentialRegistrationOptions]);
  if (!(v14 | v15))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"passkeyAssertionOptions || passkeyRegistrationOptions"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001FD54(a2);
    }
    _bs_set_crash_log_message([v26 UTF8String]);
    __break(0);
    JUMPOUT(0x100018ED8LL);
  }

  v16 = (void *)v15;
  if (![v11 length])
  {
    uint64_t v19 = CPSErrorDomain;
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    v32 = @"Missing application identifier";
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v19,  205LL,  v18));
    v13[2](v13, v20);

    goto LABEL_10;
  }

  id v17 = sub_100018EE0((uint64_t)&OBJC_CLASS___CDAppSignInUtilities, (void *)v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if (![v18 length])
  {
    uint64_t v21 = CPSErrorDomain;
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    v30 = @"Missing relying party identifier";
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v21,  205LL,  v22));
    v13[2](v13, v23);
LABEL_9:

    goto LABEL_10;
  }

  if (([v12 containsObject:v18] & 1) == 0)
  {
    uint64_t v24 = CPSErrorDomain;
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Application (%@) is not associated with relying party identifier (%@)",  v11,  v18));
    v28 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v24,  205LL,  v23));
    v13[2](v13, v25);

    goto LABEL_9;
  }

  v13[2](v13, 0LL);
LABEL_10:
}

@end