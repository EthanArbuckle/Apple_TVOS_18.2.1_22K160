@interface FAFamilyCircleDaemonChangeHandler
+ (BOOL)handleURLResponse:(id)a3 networkService:(id)a4 familyRefreshActivityScheduler:(id)a5 completion:(id)a6;
+ (void)_refetchFamilyWithNetworkService:(id)a3 familyRefreshActivityScheduler:(id)a4 context:(id)a5 completion:(id)a6;
+ (void)handleDidReceivePushEventWithNetworkService:(id)a3 familyRefreshActivityScheduler:(id)a4 completion:(id)a5;
+ (void)handleDidRemoveMemberWithNetworkService:(id)a3 completion:(id)a4;
+ (void)handleDidUpdateMemberFlagWithNetworkService:(id)a3 completion:(id)a4;
@end

@implementation FAFamilyCircleDaemonChangeHandler

+ (BOOL)handleURLResponse:(id)a3 networkService:(id)a4 familyRefreshActivityScheduler:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 allHeaderFields]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"X-Apple-Family-Changed"]);

  if (v15)
  {
    uint64_t v18 = _FALogSystem(v16, v17);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "FAFamilyCircleDaemonChangeHandler - Family state has changed",  buf,  2u);
    }

    [a1 _refetchFamilyWithNetworkService:v11 familyRefreshActivityScheduler:v12 context:@"family_changed_header" completion:v13];
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v10 allHeaderFields]);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKey:@"X-Apple-Family-Subscription-Changed"]);

  uint64_t v24 = _FALogSystem(v22, v23);
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v26)
    {
      *(_WORD *)v29 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Family subscription properties changed:",  v29,  2u);
    }

    +[FABroadcaster broadcastServicesChangedNotification]( &OBJC_CLASS___FABroadcaster,  "broadcastServicesChangedNotification");
  }

  else
  {
    if (v26)
    {
      *(_WORD *)v28 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "FAFamilyCircleDaemonChangeHandler - No change header detected... Skipping family refresh update.",  v28,  2u);
    }
  }

  return v15 != 0LL;
}

+ (void)handleDidReceivePushEventWithNetworkService:(id)a3 familyRefreshActivityScheduler:(id)a4 completion:(id)a5
{
}

+ (void)handleDidRemoveMemberWithNetworkService:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 familyRefreshActivityScheduler]);
  [a1 _refetchFamilyWithNetworkService:v7 familyRefreshActivityScheduler:v8 context:@"removed_family_member" completion:v6];
}

+ (void)handleDidUpdateMemberFlagWithNetworkService:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue([v7 familyRefreshActivityScheduler]);
  [a1 _refetchFamilyWithNetworkService:v7 familyRefreshActivityScheduler:v8 context:@"update_member_flag" completion:v6];
}

+ (void)_refetchFamilyWithNetworkService:(id)a3 familyRefreshActivityScheduler:(id)a4 context:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v15 = _FALogSystem(v13, v14);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = (objc_class *)objc_opt_class(a1);
    uint64_t v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)buf = 138412546;
    v41 = v19;
    __int16 v42 = 2080;
    v43 = "+[FAFamilyCircleDaemonChangeHandler _refetchFamilyWithNetworkService:familyRefreshActivityScheduler:context:completion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%@ %s: Not clearing family cache upon family changes",  buf,  0x16u);
  }

  v20 = objc_alloc(&OBJC_CLASS___FAFamilyCircleCache);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v13 account]);
  uint64_t v22 = -[FAFamilyCircleCache initWithAccount:](v20, "initWithAccount:", v21);

  uint64_t v23 = objc_alloc_init(&OBJC_CLASS___FAMarqueeUpdateHandler);
  uint64_t v24 = objc_alloc(&OBJC_CLASS___FAFetchFamilyCircleOperation);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[FARequestCoalescer sharedInstance](&OBJC_CLASS___FARequestCoalescer, "sharedInstance"));
  BOOL v26 = -[FAFetchFamilyCircleOperation initWithNetworkService:cache:marqueeCacheHanlder:requestCoalescer:familyRefreshActivityScheduler:]( v24,  "initWithNetworkService:cache:marqueeCacheHanlder:requestCoalescer:familyRefreshActivityScheduler:",  v13,  v22,  v23,  v25,  v12);

  -[FAFetchFamilyCircleOperation setSignedInAccountShouldBeApprover:](v26, "setSignedInAccountShouldBeApprover:", 0LL);
  -[FAFetchFamilyCircleOperation setCachePolicy:](v26, "setCachePolicy:", 1000LL);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 processName]);
  -[FAFetchFamilyCircleOperation setClientProcess:](v26, "setClientProcess:", v28);

  -[FAFetchFamilyCircleOperation setContext:](v26, "setContext:", v11);
  -[FAFetchFamilyCircleOperation setPromptUserToResolveAuthenticatonFailure:]( v26,  "setPromptUserToResolveAuthenticatonFailure:",  0LL);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[FAFetchFamilyCircleOperation fetchFamilyCircle](v26, "fetchFamilyCircle"));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_1000199E8;
  v38[3] = &unk_100041B98;
  id v39 = v10;
  id v30 = v10;
  [v29 onComplete:v38];

  uint64_t v33 = _FALogSystem(v31, v32);
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = (objc_class *)objc_opt_class(a1);
    v36 = NSStringFromClass(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    *(_DWORD *)buf = 138412546;
    v41 = v37;
    __int16 v42 = 2080;
    v43 = "+[FAFamilyCircleDaemonChangeHandler _refetchFamilyWithNetworkService:familyRefreshActivityScheduler:context:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@ %s done", buf, 0x16u);
  }
}

@end