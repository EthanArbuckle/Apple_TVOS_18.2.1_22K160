@interface ASCAppLaunchTrampoline
+ (OS_os_log)log;
- (ASCAppLaunchTrampoline)init;
- (ASCAppLaunchTrampoline)initWithWorkspace:(id)a3;
- (ASCAppLaunchTrampolineWorkspace)workspace;
- (id)handleURL:(id)a3;
- (id)handleURL:(id)a3 workspace:(id)a4;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5 workspace:(id)a6;
- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 workspace:(id)a5;
- (id)productPageURLForAdamId:(id)a3 deeplink:(id)a4 eventId:(id)a5 encodedMetrics:(id)a6 sourceApplication:(id)a7;
- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4;
- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4 encodedMetrics:(id)a5;
- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4 encodedMetrics:(id)a5 sourceApplication:(id)a6;
@end

@implementation ASCAppLaunchTrampoline

+ (OS_os_log)log
{
  if (qword_1001407B0 != -1) {
    dispatch_once(&qword_1001407B0, &stru_10011EE88);
  }
  return (OS_os_log *)(id)qword_1001407B8;
}

- (ASCAppLaunchTrampoline)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ASCWorkspace sharedWorkspace](&OBJC_CLASS___ASCWorkspace, "sharedWorkspace"));
  v4 = -[ASCAppLaunchTrampoline initWithWorkspace:](self, "initWithWorkspace:", v3);

  return v4;
}

- (ASCAppLaunchTrampoline)initWithWorkspace:(id)a3
{
  id v5 = a3;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ASCAppLaunchTrampoline;
  v6 = -[ASCAppLaunchTrampoline init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_workspace, a3);
  }

  return v7;
}

- (id)handleURL:(id)a3
{
  return -[ASCAppLaunchTrampoline handleURL:workspace:](self, "handleURL:workspace:", a3, self->_workspace);
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4
{
  return -[ASCAppLaunchTrampoline openApplicationWithBundleIdentifier:payloadURL:workspace:]( self,  "openApplicationWithBundleIdentifier:payloadURL:workspace:",  a3,  a4,  self->_workspace);
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5
{
  return -[ASCAppLaunchTrampoline openApplicationWithBundleIdentifier:payloadURL:universalLinkRequired:workspace:]( self,  "openApplicationWithBundleIdentifier:payloadURL:universalLinkRequired:workspace:",  a3,  a4,  a5,  self->_workspace);
}

- (id)handleURL:(id)a3 workspace:(id)a4
{
  id v6 = a3;
  id v66 = a4;
  id v7 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  v8 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  v6,  1LL);
  v65 = v8;
  if (!v8
    || (objc_super v9 = v8,
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v8, "queryItems")),
        id v11 = [v10 count],
        v10,
        !v11))
  {
    NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
    v92 = @"Failed while parsing input URL, URL components was nil or empty.";
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v92,  &v91,  1LL));
    uint64_t v53 = 0LL;
LABEL_47:
    id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ASCAppLaunchTrampolineErrorDomain",  v53,  v52));

    [v7 finishWithError:v18];
    id v54 = v7;
    goto LABEL_48;
  }

  v64 = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 host]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 lowercaseString]);
  unsigned __int8 v14 = [v13 isEqualToString:@"launchapp"];

  if ((v14 & 1) == 0)
  {
    NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
    v90 = @"Received URL unsuitable for app launch trampoline.";
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v90,  &v89,  1LL));
    uint64_t v53 = 1LL;
    goto LABEL_47;
  }

  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v9, "queryItems"));
  id v16 = [v15 countByEnumeratingWithState:&v82 objects:v88 count:16];
  if (!v16)
  {

    id v18 = 0LL;
    id v67 = 0LL;
    id v68 = 0LL;
    id v69 = 0LL;
    id v70 = 0LL;
    v71 = 0LL;
    goto LABEL_51;
  }

  id v17 = v16;
  id v63 = v6;
  id v70 = 0LL;
  v71 = 0LL;
  id v68 = 0LL;
  id v69 = 0LL;
  id v67 = 0LL;
  id v18 = 0LL;
  uint64_t v19 = *(void *)v83;
  do
  {
    for (i = 0LL; i != v17; i = (char *)i + 1)
    {
      if (*(void *)v83 != v19) {
        objc_enumerationMutation(v15);
      }
      v21 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)i);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 lowercaseString]);
      if ([v23 isEqualToString:@"appid"])
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v21 value]);

        if (v24)
        {
          id v25 = v21;

          id v18 = v25;
          continue;
        }
      }

      else
      {
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v26 lowercaseString]);
      if ([v27 isEqualToString:@"bundleid"])
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue([v21 value]);

        if (v28)
        {
          id v29 = v21;

          v71 = v29;
          continue;
        }
      }

      else
      {
      }

      v30 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 lowercaseString]);
      if ([v31 isEqualToString:@"deeplink"])
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v21 value]);

        if (v32)
        {
          id v33 = v21;

          id v70 = v33;
          continue;
        }
      }

      else
      {
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 lowercaseString]);
      if ([v35 isEqualToString:@"eventid"])
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue([v21 value]);

        if (v36)
        {
          id v37 = v21;

          id v68 = v37;
          continue;
        }
      }

      else
      {
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 lowercaseString]);
      if ([v39 isEqualToString:@"trampolinemetrics"])
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue([v21 value]);

        if (v40)
        {
          id v41 = v21;

          id v69 = v41;
          continue;
        }
      }

      else
      {
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
      v43 = (void *)objc_claimAutoreleasedReturnValue([v42 lowercaseString]);
      if ([v43 isEqualToString:@"sourceapplication"])
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue([v21 value]);

        if (v44)
        {
          id v45 = v21;

          id v67 = v45;
          continue;
        }
      }

      else
      {
      }

      v46 = (void *)objc_claimAutoreleasedReturnValue([v21 name]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 lowercaseString]);
      if ([v47 isEqualToString:@"metrics"])
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue([v21 value]);

        if (v48 && !v69) {
          id v69 = v21;
        }
      }

      else
      {
      }
    }

    id v17 = [v15 countByEnumeratingWithState:&v82 objects:v88 count:16];
  }

  while (v17);

  if (!v18)
  {
    id v6 = v63;
    goto LABEL_51;
  }

  id v6 = v63;
  if (!v71)
  {
LABEL_51:
    NSErrorUserInfoKey v86 = NSLocalizedDescriptionKey;
    v87 = @"Missing required parameters for app launch.";
    v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v87,  &v86,  1LL));
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ASCAppLaunchTrampolineErrorDomain",  2LL,  v56));

    [v7 finishWithError:v49];
    id v57 = v7;
    goto LABEL_55;
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue([v70 value]);

  if (v49)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue([v70 value]);
    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 stringByRemovingPercentEncoding]);

    if (v51) {
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v51));
    }
    else {
      v49 = 0LL;
    }
  }

  v58 = (void *)objc_claimAutoreleasedReturnValue([v71 value]);
  v59 = (void *)objc_claimAutoreleasedReturnValue([v66 openApplicationWithBundleIdentifier:v58 payloadURL:v49]);

  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472LL;
  v80[2] = sub_100008638;
  v80[3] = &unk_10011EEB0;
  id v60 = v7;
  id v81 = v60;
  [v59 addSuccessBlock:v80];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_100008684;
  v72[3] = &unk_10011EF00;
  v72[4] = v64;
  id v18 = v18;
  id v73 = v18;
  id v70 = v70;
  id v74 = v70;
  id v68 = v68;
  id v75 = v68;
  id v69 = v69;
  id v76 = v69;
  id v67 = v67;
  id v77 = v67;
  id v61 = v60;
  id v78 = v61;
  id v79 = v66;
  [v59 addErrorBlock:v72];
  id v62 = v61;

LABEL_55:
LABEL_48:

  return v7;
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 workspace:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 openApplicationWithBundleIdentifier:v9 payloadURL:v8]);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100008B3C;
  v19[3] = &unk_10011EEB0;
  id v12 = v10;
  id v20 = v12;
  [v11 addSuccessBlock:v19];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100008B88;
  v17[3] = &unk_10011EF28;
  id v13 = v12;
  id v18 = v13;
  [v11 addErrorBlock:v17];
  unsigned __int8 v14 = v18;
  id v15 = v13;

  return v15;
}

- (id)openApplicationWithBundleIdentifier:(id)a3 payloadURL:(id)a4 universalLinkRequired:(BOOL)a5 workspace:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(&OBJC_CLASS___AMSMutablePromise);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( [v9 openApplicationWithBundleIdentifier:v11 payloadURL:v10 universalLinkRequired:v6]);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100008D94;
  v21[3] = &unk_10011EEB0;
  id v14 = v12;
  id v22 = v14;
  [v13 addSuccessBlock:v21];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100008DE0;
  v19[3] = &unk_10011EF28;
  id v15 = v14;
  id v20 = v15;
  [v13 addErrorBlock:v19];
  id v16 = v20;
  id v17 = v15;

  return v17;
}

- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4
{
  return -[ASCAppLaunchTrampoline productPageURLForAdamId:eventId:encodedMetrics:]( self,  "productPageURLForAdamId:eventId:encodedMetrics:",  a3,  a4,  0LL);
}

- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4 encodedMetrics:(id)a5
{
  return -[ASCAppLaunchTrampoline productPageURLForAdamId:eventId:encodedMetrics:sourceApplication:]( self,  "productPageURLForAdamId:eventId:encodedMetrics:sourceApplication:",  a3,  a4,  a5,  0LL);
}

- (id)productPageURLForAdamId:(id)a3 eventId:(id)a4 encodedMetrics:(id)a5 sourceApplication:(id)a6
{
  return -[ASCAppLaunchTrampoline productPageURLForAdamId:deeplink:eventId:encodedMetrics:sourceApplication:]( self,  "productPageURLForAdamId:deeplink:eventId:encodedMetrics:sourceApplication:",  a3,  0LL,  a4,  a5,  a6);
}

- (id)productPageURLForAdamId:(id)a3 deeplink:(id)a4 eventId:(id)a5 encodedMetrics:(id)a6 sourceApplication:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = -[ASCAdamID initWithStringValue:](objc_alloc(&OBJC_CLASS___ASCAdamID), "initWithStringValue:", v15);

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[ASCLockupProductDetails URLForLockupID:ofKind:withOfferFlags:]( &OBJC_CLASS___ASCLockupProductDetails,  "URLForLockupID:ofKind:withOfferFlags:",  v16,  @"app",  0LL));
  if (v17 && (v11 || v12 || v13))
  {
    id v18 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  v17,  0LL);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v18, "queryItems"));
    id v20 = (NSMutableArray *)[v19 mutableCopy];

    if (!v20) {
      id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    }
    if (v11)
    {
      v21 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"deeplink",  v11);
      -[NSMutableArray addObject:](v20, "addObject:", v21);
    }

    if (v12)
    {
      id v22 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"eventid",  v12);
      -[NSMutableArray addObject:](v20, "addObject:", v22);
    }

    if (v13)
    {
      v23 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"trampolineMetrics",  v13);
      -[NSMutableArray addObject:](v20, "addObject:", v23);
    }

    if (v14)
    {
      v24 = -[NSURLQueryItem initWithName:value:]( objc_alloc(&OBJC_CLASS___NSURLQueryItem),  "initWithName:value:",  @"sourceApplication",  v14);
      -[NSMutableArray addObject:](v20, "addObject:", v24);
    }

    -[NSURLComponents setQueryItems:](v18, "setQueryItems:", v20);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v18, "URL"));

    id v17 = (void *)v25;
  }

  return v17;
}

- (ASCAppLaunchTrampolineWorkspace)workspace
{
  return self->_workspace;
}

- (void).cxx_destruct
{
}

@end