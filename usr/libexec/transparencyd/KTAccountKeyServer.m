@interface KTAccountKeyServer
+ (BOOL)verifyData:(id)a3 signature:(id)a4 accountPublicKeyInfo:(id)a5 error:(id *)a6;
+ (_PCSPublicIdentityData)decodePublicKeyInfo:(id)a3 error:(id *)a4;
+ (id)applicationToService:(id)a3;
+ (id)publicKeyInfoFromIdentity:(_PCSIdentityData *)a3 error:(id *)a4;
+ (id)sharedKeyService:(id)a3;
+ (id)sharedKeyServiceForApplication:(id)a3;
+ (void)clearCachedPCSIdentities;
+ (void)startMetrics:(id)a3 services:(id)a4;
- (BOOL)haveIdentity;
- (BOOL)isAccountIdentity:(id)a3 error:(id *)a4;
- (BOOL)outstandingCreationSignal;
- (KTAccountKeyServer)initWithService:(id)a3;
- (NSDate)_pcsIdentityCachedTime;
- (OS_dispatch_group)creationGroup;
- (OS_dispatch_queue)creationQueue;
- (PCSCurrentIdentity)_pcsIdentity;
- (_PCSIdentitySetData)copyPCSIdentitySet:(id *)a3;
- (__CFString)service;
- (id)copyCachedPCSIdentity;
- (id)initKeyServiceWithApplication:(id)a3;
- (id)pcsOptions:(id *)a3;
- (id)publicPublicKey:(id *)a3;
- (os_unfair_lock_s)identityCacheLock;
- (void)cachePCSIdentity:(id)a3;
- (void)clearCachedPCSIdentity;
- (void)createIdentityForSet:(_PCSIdentitySetData *)a3 roll:(BOOL)a4 completionBlock:(id)a5;
- (void)getPCSIdentity:(id)a3;
- (void)rollKey:(id)a3;
- (void)setCreationGroup:(id)a3;
- (void)setCreationQueue:(id)a3;
- (void)setIdentityCacheLock:(os_unfair_lock_s)a3;
- (void)setOutstandingCreationSignal:(BOOL)a3;
- (void)set_pcsIdentity:(id)a3;
- (void)set_pcsIdentityCachedTime:(id)a3;
- (void)signData:(id)a3 completionBlock:(id)a4;
- (void)wrapperPCSIdentitySetCreateManatee:(_PCSIdentitySetData *)a3 service:(__CFString *)a4 options:(id)a5 block:(id)a6;
@end

@implementation KTAccountKeyServer

- (void)clearCachedPCSIdentity
{
  p_identityCacheLock = &self->_identityCacheLock;
  os_unfair_lock_lock(&self->_identityCacheLock);
  -[KTAccountKeyServer set_pcsIdentity:](self, "set_pcsIdentity:", 0LL);
  -[KTAccountKeyServer set_pcsIdentityCachedTime:](self, "set_pcsIdentityCachedTime:", 0LL);
  os_unfair_lock_unlock(p_identityCacheLock);
}

- (id)copyCachedPCSIdentity
{
  p_identityCacheLock = &self->_identityCacheLock;
  os_unfair_lock_lock(&self->_identityCacheLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer _pcsIdentity](self, "_pcsIdentity"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer _pcsIdentityCachedTime](self, "_pcsIdentityCachedTime"));
    [v5 timeIntervalSinceNow];
    double v7 = v6;
    double v8 = (double)(uint64_t)-kKTAuthenticationLifetime;

    v4 = 0LL;
    if (v7 > v8) {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer _pcsIdentity](self, "_pcsIdentity"));
    }
  }

  os_unfair_lock_unlock(p_identityCacheLock);
  return v4;
}

- (void)cachePCSIdentity:(id)a3
{
  p_identityCacheLock = &self->_identityCacheLock;
  id v5 = a3;
  os_unfair_lock_lock(p_identityCacheLock);
  -[KTAccountKeyServer set_pcsIdentity:](self, "set_pcsIdentity:", v5);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[KTAccountKeyServer set_pcsIdentityCachedTime:](self, "set_pcsIdentityCachedTime:", v6);

  os_unfair_lock_unlock(p_identityCacheLock);
}

+ (id)applicationToService:(id)a3
{
  uint64_t v3 = qword_1002EEBC8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1002EEBC8, &stru_100286288);
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1002EEBD0 objectForKeyedSubscript:v4]);

  return v5;
}

+ (id)sharedKeyServiceForApplication:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication applicationValueForIdentifier:]( &OBJC_CLASS___TransparencyApplication,  "applicationValueForIdentifier:",  v4));

  if (v5)
  {
    id v7 = objc_msgSend((id)objc_opt_class(a1, v6), "applicationToService:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v9)
    {
      id v10 = objc_msgSend((id)objc_opt_class(a1, v8), "sharedKeyService:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    }

    else
    {
      if (qword_1002EEBD8 != -1) {
        dispatch_once(&qword_1002EEBD8, &stru_1002862C8);
      }
      v13 = (os_log_s *)qword_1002EEBE0;
      if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        id v16 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Unknown application mapping: %@",  (uint8_t *)&v15,  0xCu);
      }

      v11 = 0LL;
    }
  }

  else
  {
    if (qword_1002EEBD8 != -1) {
      dispatch_once(&qword_1002EEBD8, &stru_1002862A8);
    }
    v12 = (os_log_s *)qword_1002EEBE0;
    if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Unknown application identifier: %@",  (uint8_t *)&v15,  0xCu);
    }

    v11 = 0LL;
  }

  return v11;
}

+ (void)clearCachedPCSIdentities
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1002EEBF0, "allValues", 0));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) clearCachedPCSIdentity];
        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EEBE8);
}

+ (id)sharedKeyService:(id)a3
{
  id v4 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001829D0;
  block[3] = &unk_1002851D0;
  block[4] = a1;
  if (qword_1002EEBF8 != -1) {
    dispatch_once(&qword_1002EEBF8, block);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1002EEBE8);
  id v5 = (id)objc_claimAutoreleasedReturnValue([(id)qword_1002EEBF0 objectForKeyedSubscript:v4]);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EEBE8);
  if (!v5)
  {
    id v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v6)), "initWithService:", v4);
    if (v5)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1002EEBE8);
      __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1002EEBF0 objectForKeyedSubscript:v4]);

      if (v7)
      {
        uint64_t v8 = objc_claimAutoreleasedReturnValue([(id)qword_1002EEBF0 objectForKeyedSubscript:v4]);

        id v5 = (id)v8;
      }

      else
      {
        [(id)qword_1002EEBF0 setObject:v5 forKeyedSubscript:v4];
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1002EEBE8);
    }
  }

  return v5;
}

- (id)initKeyServiceWithApplication:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend((id)objc_opt_class(self, v5), "applicationToService:", v4);
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    self = -[KTAccountKeyServer initWithService:](self, "initWithService:", v4);
    uint64_t v8 = self;
  }

  else
  {
    if (qword_1002EEBD8 != -1) {
      dispatch_once(&qword_1002EEBD8, &stru_100286328);
    }
    __int128 v9 = (os_log_s *)qword_1002EEBE0;
    if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Unknown application mapping: %@",  (uint8_t *)&v11,  0xCu);
    }

    uint64_t v8 = 0LL;
  }

  return v8;
}

- (KTAccountKeyServer)initWithService:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___KTAccountKeyServer;
  id v3 = -[KTAccountKeyServer init](&v13, "init", a3);
  id v4 = v3;
  if (v3)
  {
    v3->_identityCacheLock._os_unfair_lock_opaque = 0;
    dispatch_group_t v5 = dispatch_group_create();
    creationGroup = v4->_creationGroup;
    v4->_creationGroup = (OS_dispatch_group *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.transparencyd.AccountKeyCreate", v8);
    creationQueue = v4->_creationQueue;
    v4->_creationQueue = (OS_dispatch_queue *)v9;

    int v11 = v4;
  }

  return v4;
}

+ (void)startMetrics:(id)a3 services:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id location = 0LL;
  objc_initWeak(&location, v5);
  double v7 = SFAnalyticsSamplerIntervalOncePerReport;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100182E50;
  v9[3] = &unk_100286378;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [v5 addMultiSamplerForName:@"KTAccountKeyMultiSampler" withTimeInterval:v9 block:v7];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)pcsOptions:(id *)a3
{
  id v14 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount primaryAccount:](&OBJC_CLASS___TransparencyAccount, "primaryAccount:", &v14));
  id v5 = v14;
  if (v4)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aa_personID"));
    double v7 = (void *)v6;
    if (v6)
    {
      uint64_t v15 = kPCSSetupDSID;
      uint64_t v16 = v6;
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    }

    else
    {
      if (qword_1002EEBD8 != -1) {
        dispatch_once(&qword_1002EEBD8, &stru_1002863B8);
      }
      id v10 = (void *)qword_1002EEBE0;
      if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_ERROR))
      {
        id v11 = v10;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to get primary account dsid, returning nil PCS options: %@",  buf,  0xCu);
      }

      id v8 = 0LL;
    }
  }

  else
  {
    if (qword_1002EEBD8 != -1) {
      dispatch_once(&qword_1002EEBD8, &stru_100286398);
    }
    dispatch_queue_t v9 = (os_log_s *)qword_1002EEBE0;
    if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to get primary account, returning nil PCS options",  buf,  2u);
    }

    id v8 = 0LL;
    if (a3 && v5)
    {
      id v8 = 0LL;
      *a3 = v5;
    }
  }

  return v8;
}

- (__CFString)service
{
  return @"com.apple.KTAccountKey";
}

- (_PCSIdentitySetData)copyPCSIdentitySet:(id *)a3
{
  id v11 = 0LL;
  id v12 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer pcsOptions:](self, "pcsOptions:", &v11));
  id v6 = v11;
  if (v5)
  {
    double v7 = (_PCSIdentitySetData *)PCSIdentitySetCreate(v5, -[KTAccountKeyServer service](self, "service"), &v12);
    if (v7 && !v12) {
      goto LABEL_15;
    }
    if (qword_1002EEBD8 != -1) {
      dispatch_once(&qword_1002EEBD8, &stru_1002863D8);
    }
    id v8 = (os_log_s *)qword_1002EEBE0;
    if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "failed to create account key identity set: %@",  buf,  0xCu);
    }

    dispatch_queue_t v9 = v12;

    id v6 = v9;
    if (!v9) {
      id v6 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -267LL,  @"failed to create account key identity set"));
    }
    if (v7) {
      CFRelease(v7);
    }
  }

  double v7 = 0LL;
  if (a3 && v6)
  {
    id v6 = v6;
    double v7 = 0LL;
    *a3 = v6;
  }

- (void)createIdentityForSet:(_PCSIdentitySetData *)a3 roll:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer creationGroup](self, "creationGroup"));
  objc_sync_enter(v9);
  if (-[KTAccountKeyServer outstandingCreationSignal](self, "outstandingCreationSignal"))
  {
    id v10 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer creationGroup](self, "creationGroup"));
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer creationQueue](self, "creationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100183740;
    block[3] = &unk_1002798C8;
    block[4] = self;
    id v20 = v8;
    id v12 = v8;
    dispatch_group_notify(v10, v11, block);

    objc_sync_exit(v9);
  }

  else
  {
    objc_sync_exit(v9);

    objc_super v13 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer creationGroup](self, "creationGroup"));
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServer creationQueue](self, "creationQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10018374C;
    v15[3] = &unk_100286448;
    v15[4] = self;
    id v16 = v8;
    BOOL v18 = a4;
    v17 = a3;
    id v9 = v8;
    dispatch_group_async(v13, v14, v15);
  }
}

- (void)wrapperPCSIdentitySetCreateManatee:(_PCSIdentitySetData *)a3 service:(__CFString *)a4 options:(id)a5 block:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100183B6C;
  v11[3] = &unk_100286470;
  id v12 = a6;
  objc_super v13 = a3;
  v11[4] = self;
  id v10 = v12;
  PCSIdentitySetCreateManatee(a3, a4, a5, v11);
}

- (BOOL)haveIdentity
{
  id v3 = -[KTAccountKeyServer copyCachedPCSIdentity](self, "copyCachedPCSIdentity");
  if (v3)
  {
    id v4 = v3;
    BOOL v5 = 1;
  }

  else
  {
    id v12 = 0LL;
    id v6 = -[KTAccountKeyServer copyPCSIdentitySet:](self, "copyPCSIdentitySet:", &v12);
    id v7 = v12;
    if (v6)
    {
      CFTypeRef cf = 0LL;
      uint64_t v8 = PCSIdentitySetCopyCurrentIdentityPointer(v6, -[KTAccountKeyServer service](self, "service"), &cf);
      id v4 = (void *)objc_claimAutoreleasedReturnValue(v8);
      BOOL v5 = v4 != 0LL;
      CFRelease(v6);
      CFTypeRef v9 = cf;
      if (cf)
      {
        CFTypeRef cf = 0LL;
        CFRelease(v9);
      }
    }

    else
    {
      id v4 = 0LL;
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (void)getPCSIdentity:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
  id v6 = -[KTAccountKeyServer copyCachedPCSIdentity](self, "copyCachedPCSIdentity");
  if (v6)
  {
    id v7 = v6;
    v4[2](v4, v6, 0LL);
  }

  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    id v25 = 0LL;
    CFTypeRef v9 = -[KTAccountKeyServer copyPCSIdentitySet:](self, "copyPCSIdentitySet:", &v25);
    id v10 = v25;
    if (v9)
    {
      CFTypeRef cf = 0LL;
      uint64_t v11 = PCSIdentitySetCopyCurrentIdentityPointer(v9, -[KTAccountKeyServer service](self, "service"), &cf);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v7 = v12;
      if (!v12 || cf)
      {
        if (qword_1002EEBD8 != -1) {
          dispatch_once(&qword_1002EEBD8, &stru_100286490);
        }
        v22 = (os_log_s *)qword_1002EEBE0;
        if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          CFTypeRef v27 = cf;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "failed to copy account key identity: %@",  buf,  0xCu);
        }

        [v5 logResultForEvent:@"KTAccountKeyFetch" hardFailure:0 result:cf];
        ((void (**)(id, id, CFTypeRef))v4)[2](v4, 0LL, cf);
        CFRelease(v9);
        CFTypeRef v23 = cf;
        if (cf)
        {
          CFTypeRef cf = 0LL;
          CFRelease(v23);
        }
      }

      else
      {
        objc_super v13 = (void *)PCSIdentityCopyPublicKeyInfo([v12 identity]);
        if (qword_1002EEBD8 != -1) {
          dispatch_once(&qword_1002EEBD8, &stru_1002864B0);
        }
        id v14 = (void *)qword_1002EEBE0;
        if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = v14;
          id v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "kt_hexString"));
          *(_DWORD *)buf = 138412290;
          CFTypeRef v27 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Caching PCS identity: %@", buf, 0xCu);
        }

        -[KTAccountKeyServer cachePCSIdentity:](self, "cachePCSIdentity:", v7);
        CFAbsoluteTime v17 = CFAbsoluteTimeGetCurrent() - Current;
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v17));
        [v18 logMetric:v19 withName:@"KTAccountKeyFetchTime"];

        id v20 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
        [v20 logSuccessForEventNamed:@"KTAccountKeyFetch"];

        if (qword_1002EEBD8 != -1) {
          dispatch_once(&qword_1002EEBD8, &stru_1002864D0);
        }
        v21 = (os_log_s *)qword_1002EEBE0;
        if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "copied current account key identity",  buf,  2u);
        }

        v4[2](v4, v7, 0LL);
        CFRelease(v9);
      }
    }

    else
    {
      [v5 logResultForEvent:@"KTAccountKeyFetch" hardFailure:1 result:v10];
      ((void (**)(id, id, id))v4)[2](v4, 0LL, v10);
      id v7 = 0LL;
    }
  }
}

+ (id)publicKeyInfoFromIdentity:(_PCSIdentityData *)a3 error:(id *)a4
{
  id v6 = (void *)PCSIdentityCopyPublicKeyInfo(a3);
  if (!v6)
  {
    if (qword_1002EEBD8 != -1) {
      dispatch_once(&qword_1002EEBD8, &stru_1002864F0);
    }
    id v7 = (os_log_s *)qword_1002EEBE0;
    if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "failed to get PCS public key info from identity: %@",  (uint8_t *)&v9,  0xCu);
    }

    if (a4) {
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -268LL,  @"failed to get PCS public key info from identity"));
    }
  }

  return v6;
}

+ (_PCSPublicIdentityData)decodePublicKeyInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  id v13 = 0LL;
  if (!v5)
  {
    id v7 = 0LL;
    BOOL v8 = 1;
    goto LABEL_6;
  }

  id v7 = (_PCSPublicIdentityData *)PCSPublicIdentityCreateWithPublicKeyInfo(v5, &v13);
  BOOL v8 = v7 == 0LL;
  if (!v7 || v13)
  {
LABEL_6:
    if (qword_1002EEBD8 != -1) {
      dispatch_once(&qword_1002EEBD8, &stru_100286510);
    }
    id v10 = (os_log_s *)qword_1002EEBE0;
    if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "failed to create public key from data: %@",  buf,  0xCu);
    }

    id v9 = v13;
    if (v13)
    {
      if (v8) {
        goto LABEL_12;
      }
    }

    else
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorDecode,  -269LL,  @"failed to create public key from data"));
      if (v8)
      {
LABEL_12:
        if (!a4) {
          goto LABEL_18;
        }
        goto LABEL_16;
      }
    }

    CFRelease(v7);
    if (!a4)
    {
LABEL_18:
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
      [v11 logResultForEvent:@"KTAccountKeyPublicDecode" hardFailure:1 result:v9];

      id v7 = 0LL;
      goto LABEL_19;
    }

- (void)rollKey:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  BOOL v18 = 0LL;
  id v14 = 0LL;
  id v5 = -[KTAccountKeyServer copyPCSIdentitySet:](self, "copyPCSIdentitySet:", &v14);
  id v6 = v14;
  BOOL v18 = v5;
  if (v16[3])
  {
    if (qword_1002EEBD8 != -1) {
      dispatch_once(&qword_1002EEBD8, &stru_100286530);
    }
    id v7 = (os_log_s *)qword_1002EEBE0;
    if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "attempting to roll account key identity",  buf,  2u);
    }

    uint64_t v8 = v16[3];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001846F8;
    v10[3] = &unk_100286598;
    id v11 = v4;
    id v12 = &v15;
    -[KTAccountKeyServer createIdentityForSet:roll:completionBlock:]( self,  "createIdentityForSet:roll:completionBlock:",  v8,  1LL,  v10);
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    [v9 logResultForEvent:@"KTAccountKeyRoll" hardFailure:1 result:v6];

    (*((void (**)(id, void, id))v4 + 2))(v4, 0LL, v6);
  }

  _Block_object_dispose(&v15, 8);
}

- (BOOL)isAccountIdentity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v21 = 0LL;
  id v7 = -[KTAccountKeyServer copyPCSIdentitySet:](self, "copyPCSIdentitySet:", &v21);
  id v8 = v21;
  id v9 = v8;
  if (!v7)
  {
    BOOL v15 = 0;
    if (!a4 || !v8)
    {
      id v11 = v8;
      goto LABEL_30;
    }

    goto LABEL_28;
  }

  id v20 = v8;
  id v10 = +[KTAccountKeyServer decodePublicKeyInfo:error:]( &OBJC_CLASS___KTAccountKeyServer,  "decodePublicKeyInfo:error:",  v6,  &v20);
  id v11 = v20;

  if (!v10)
  {
    CFRelease(v7);
    BOOL v15 = 0;
    if (!a4 || !v11) {
      goto LABEL_30;
    }
    id v8 = v11;
LABEL_28:
    id v11 = v8;
    BOOL v15 = 0;
    *a4 = v11;
    goto LABEL_30;
  }

  v19 = 0LL;
  uint64_t PublicID = PCSPublicIdentityGetPublicID(v10);
  id v13 = (const void *)PCSIdentitySetCopyIdentityWithError(v7, PublicID, &v19);
  if (v13) {
    BOOL v14 = v19 == 0LL;
  }
  else {
    BOOL v14 = 0;
  }
  BOOL v15 = v14;
  if (v14) {
    goto LABEL_20;
  }
  if (qword_1002EEBD8 != -1) {
    dispatch_once(&qword_1002EEBD8, &stru_1002865B8);
  }
  id v16 = (os_log_s *)qword_1002EEBE0;
  if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    CFTypeRef v23 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "failed to get identity for public identity: %@",  buf,  0xCu);
  }

  uint64_t v17 = v19;

  id v11 = v17;
  if (!v17) {
    id v11 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -271LL,  @"failed to find identity for public identity"));
  }
  if (a4 && v11) {
    *a4 = v11;
  }
  if (v13) {
LABEL_20:
  }
    CFRelease(v13);
  CFRelease(v10);
  CFRelease(v7);
LABEL_30:

  return v15;
}

- (void)signData:(id)a3 completionBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100184CD8;
  v8[3] = &unk_100286640;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  -[KTAccountKeyServer getPCSIdentity:](self, "getPCSIdentity:", v8);
}

- (id)publicPublicKey:(id *)a3
{
  uint64_t v14 = 0LL;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_1001852B8;
  BOOL v18 = sub_1001852C8;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = sub_1001852B8;
  id v12 = sub_1001852C8;
  id v13 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001852D0;
  v7[3] = &unk_100286668;
  v7[4] = &v8;
  v7[5] = &v14;
  -[KTAccountKeyServer getPCSIdentity:](self, "getPCSIdentity:", v7);
  if (a3)
  {
    id v4 = (void *)v9[5];
    if (v4) {
      *a3 = v4;
    }
  }

  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

+ (BOOL)verifyData:(id)a3 signature:(id)a4 accountPublicKeyInfo:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (!v9)
  {
    uint64_t v19 = -346LL;
LABEL_22:
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  v19,  @"missing data or signature or accountKey"));
    if (qword_1002EEBD8 != -1) {
      dispatch_once(&qword_1002EEBD8, &stru_100286688);
    }
    id v20 = (os_log_s *)qword_1002EEBE0;
    if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "PCS signature verify failed due to missing data or signature or accountKey",  buf,  2u);
    }

    goto LABEL_26;
  }

  if (!v10)
  {
    uint64_t v19 = -347LL;
    goto LABEL_22;
  }

  if (!v11)
  {
    uint64_t v19 = -348LL;
    goto LABEL_22;
  }

  id v23 = 0LL;
  id v13 = +[KTAccountKeyServer decodePublicKeyInfo:error:]( &OBJC_CLASS___KTAccountKeyServer,  "decodePublicKeyInfo:error:",  v11,  &v23);
  id v14 = v23;
  if (v13)
  {
    v22 = 0LL;
    char v15 = PCSValidateSignature(v13, v10, v9, &v22);
    if (v22) {
      BOOL v16 = 0;
    }
    else {
      BOOL v16 = v15;
    }
    if (!v16)
    {
      if (qword_1002EEBD8 != -1) {
        dispatch_once(&qword_1002EEBD8, &stru_1002866A8);
      }
      uint64_t v17 = (os_log_s *)qword_1002EEBE0;
      if (os_log_type_enabled((os_log_t)qword_1002EEBE0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v22;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to verify data: %@", buf, 0xCu);
      }

      BOOL v18 = v22;

      id v14 = v18;
      if (!v18) {
        id v14 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  @"TransparencyErrorVerify",  -270LL,  @"failed to verify data with account key"));
      }
      if (a6 && v14)
      {
        id v14 = v14;
        *a6 = v14;
      }
    }

    CFRelease(v13);
    goto LABEL_29;
  }

- (NSDate)_pcsIdentityCachedTime
{
  return (NSDate *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)set_pcsIdentityCachedTime:(id)a3
{
}

- (PCSCurrentIdentity)_pcsIdentity
{
  return (PCSCurrentIdentity *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)set_pcsIdentity:(id)a3
{
}

- (os_unfair_lock_s)identityCacheLock
{
  return self->_identityCacheLock;
}

- (void)setIdentityCacheLock:(os_unfair_lock_s)a3
{
  self->_identityCacheLock = a3;
}

- (BOOL)outstandingCreationSignal
{
  return self->_outstandingCreationSignal;
}

- (void)setOutstandingCreationSignal:(BOOL)a3
{
  self->_outstandingCreationSignal = a3;
}

- (OS_dispatch_queue)creationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCreationQueue:(id)a3
{
}

- (OS_dispatch_group)creationGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setCreationGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end