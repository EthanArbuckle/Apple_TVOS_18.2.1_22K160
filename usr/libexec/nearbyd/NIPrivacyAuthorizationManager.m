@interface NIPrivacyAuthorizationManager
- (AuthorizationState)presentUserAuthorizationPrompt:(SEL)a3 forAuditToken:(id)a4 withBundleRecord:(id *)a5;
- (NIPrivacyAuthorizationManager)init;
- (id).cxx_construct;
- (int)authorizationStatusForSession:(id)a3 promptUserIfUndetermined:(BOOL)a4;
- (void)clearStateForPid:(int)a3;
@end

@implementation NIPrivacyAuthorizationManager

- (NIPrivacyAuthorizationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NIPrivacyAuthorizationManager;
  return -[NIPrivacyAuthorizationManager init](&v3, "init");
}

- (void)clearStateForPid:(int)a3
{
  int v5 = a3;
  v4 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  sub_1000216EC((void *)self + 9, &v5);
  std::mutex::unlock(v4);
}

- (int)authorizationStatusForSession:(id)a3 promptUserIfUndetermined:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v29 = [v6 pid];
  std::mutex::lock((std::mutex *)((char *)self + 8));
  v7 = sub_100021720((void *)self + 9, (int *)&v29);
  if (v7)
  {
    int v8 = *((_DWORD *)v7 + 6);
    std::mutex::unlock((std::mutex *)((char *)self + 8));
  }

  else
  {
    std::mutex::unlock((std::mutex *)((char *)self + 8));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
    BOOL v10 = v9 == 0LL;

    if (v10)
    {
      v13 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_10038A8AC(v13);
      }
      int v8 = 0;
    }

    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
      v12 = v11;
      if (v11) {
        [v11 auditToken];
      }
      else {
        memset(v28, 0, sizeof(v28));
      }
      id v27 = 0LL;
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordForAuditToken:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordForAuditToken:error:",  v28,  &v27));
      id v15 = v27;

      if (!v14 || v15)
      {
        v19 = (os_log_s *)(id)qword_1008000A0;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
          sub_10038A8EC(v20, (uint64_t)v15, (uint8_t *)&buf, v19);
        }

        int v8 = 0;
      }

      else if (v4)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue([v6 displayName]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v6 connection]);
        v18 = v17;
        if (v17) {
          [v17 auditToken];
        }
        else {
          memset(v26, 0, sizeof(v26));
        }
        -[NIPrivacyAuthorizationManager presentUserAuthorizationPrompt:forAuditToken:withBundleRecord:]( self,  "presentUserAuthorizationPrompt:forAuditToken:withBundleRecord:",  v16,  v26,  v14);

        std::mutex::lock((std::mutex *)((char *)self + 8));
        v30 = &v29;
        v21 = sub_100021948((uint64_t)self + 72, (int *)&v29, (uint64_t)&unk_1004242F8, &v30);
        *(_OWORD *)(v21 + 3) = buf;
        v21[5] = v32;
        std::mutex::unlock((std::mutex *)((char *)self + 8));
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_1000214D4;
        v23[3] = &unk_1007A2518;
        __int128 v24 = buf;
        uint64_t v25 = v32;
        AnalyticsSendEventLazy(@"com.apple.nearbyinteraction.auth", v23);
        int v8 = buf;
      }

      else
      {
        int v8 = 2;
      }
    }
  }

  return v8;
}

- (AuthorizationState)presentUserAuthorizationPrompt:(SEL)a3 forAuditToken:(id)a4 withBundleRecord:(id *)a5
{
  id v7 = a6;
  retstr->var0 = 2;
  retstr->var1.var0.__null_state_ = 0;
  retstr->var1.__engaged_ = 0;
  int v8 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    v13 = @"NO";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#bundle Application: %@, hasAccessToNearbyInteraction: %@",  (uint8_t *)&v10,  0x16u);
  }

  retstr->var0 = 4;
  retstr->var1.var0.__val_ = sub_100023CC4();
  retstr->var1.__engaged_ = 1;

  return result;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 850045863LL;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((void *)self + 12) = 0LL;
  *((_DWORD *)self + 26) = 1065353216;
  return self;
}

@end