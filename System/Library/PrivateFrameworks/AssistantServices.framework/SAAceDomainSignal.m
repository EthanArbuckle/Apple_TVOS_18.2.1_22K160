@interface SAAceDomainSignal
- (id)_ad_likelyApplicationBundleIdentifiers;
- (id)_ad_preheatableDomain;
- (void)_ad_handleAceDomainSignalRequest:(id)a3 completionHandler:(id)a4;
- (void)_ad_recordPreheatLaunchOf:(id)a3;
@end

@implementation SAAceDomainSignal

- (id)_ad_likelyApplicationBundleIdentifiers
{
  if (AFIsNano(self))
  {
    if (qword_100578498 != -1) {
      dispatch_once(&qword_100578498, &stru_1004FAFA0);
    }
    v3 = (void *)qword_100578490;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAAceDomainSignal domain](self, "domain"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v4]);

    if (v5)
    {
      v10 = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    }

    else
    {
      v6 = 0LL;
    }

    return v6;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAAceDomainSignal domain](self, "domain"));
    unsigned int v8 = [v7 isEqualToString:SAAceDomainSignalDomainSYNAPSEValue];

    if (v8) {
      return (id)objc_claimAutoreleasedReturnValue(-[SAAceDomainSignal appIdHints](self, "appIdHints"));
    }
    else {
      return 0LL;
    }
  }

- (void)_ad_recordPreheatLaunchOf:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v7 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v3,  AFAnalyticsContextKey[0]);
    id v4 = sub_1001EA650(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v5,  AFAnalyticsContextKey[1]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](&OBJC_CLASS___AFAnalytics, "sharedAnalytics"));
    [v6 logEventWithType:801 context:v7];
  }

- (void)_ad_handleAceDomainSignalRequest:(id)a3 completionHandler:(id)a4
{
  id v19 = a3;
  id v20 = a4;
  v23 = self;
  v21 = (void *)objc_claimAutoreleasedReturnValue( -[SAAceDomainSignal _ad_likelyApplicationBundleIdentifiers]( self,  "_ad_likelyApplicationBundleIdentifiers"));
  if ([v21 count])
  {
    v6 = dispatch_group_create();
    v35[0] = 0LL;
    v35[1] = v35;
    v35[2] = 0x2020000000LL;
    char v36 = 0;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id obj = v21;
    id v7 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v32;
      uint64_t v9 = BKSOpenApplicationOptionKeyActivateSuspended;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
          id v12 = [(id)off_100576080() serviceWithDefaultShellEndpoint];
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          if (v13)
          {
            dispatch_group_enter(v6);
            -[SAAceDomainSignal _ad_recordPreheatLaunchOf:](v23, "_ad_recordPreheatLaunchOf:", v11);
            id v14 = off_100576088();
            uint64_t v37 = v9;
            v38 = &__kCFBooleanTrue;
            v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
            v16 = (void *)objc_claimAutoreleasedReturnValue([v14 optionsWithDictionary:v15]);
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472LL;
            v28[2] = sub_1002E71D8;
            v28[3] = &unk_1004FAFC8;
            v30 = v35;
            v29 = v6;
            [v13 openApplication:v11 withOptions:v16 completion:v28];
          }
        }

        id v7 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      }

      while (v7);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002E7278;
    block[3] = &unk_1004FAFF0;
    v27 = v35;
    id v26 = v20;
    id v25 = v19;
    dispatch_group_notify(v6, &_dispatch_main_q, block);

    _Block_object_dispose(v35, 8);
  }

  else
  {
    v17 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v19 createResponseWithReplyCommand:v17]);
    (*((void (**)(id, void *, void))v20 + 2))(v20, v18, 0LL);
  }
}

- (id)_ad_preheatableDomain
{
  if (qword_1005784A8 != -1) {
    dispatch_once(&qword_1005784A8, &stru_1004FB010);
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SAAceDomainSignal domain](self, "domain"));
  if (v3) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1005784A0 objectForKeyedSubscript:v3]);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

@end