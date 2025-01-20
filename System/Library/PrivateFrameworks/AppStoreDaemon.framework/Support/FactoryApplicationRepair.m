@interface FactoryApplicationRepair
+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5;
- (ApplicationRepairDelegate)delegate;
- (BOOL)repairApplication:(id)a3 error:(id *)a4;
- (FactoryApplicationRepair)init;
- (NSArray)repairedBundleIDs;
- (NSString)repairType;
- (_TtC9appstored6LogKey)logKey;
- (int)fairPlayStatus;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setLogKey:(id)a3;
@end

@implementation FactoryApplicationRepair

- (FactoryApplicationRepair)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FactoryApplicationRepair;
  v2 = -[FactoryApplicationRepair init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___UnfairLock);
    lock = v2->_lock;
    v2->_lock = v3;

    id v5 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    bag = v2->_bag;
    v2->_bag = (AMSBagProtocol *)v6;

    *(_WORD *)&v2->_establishesActiveAccount = 257;
  }

  return v2;
}

- (ApplicationRepairDelegate)delegate
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  objc_super v9 = sub_1001F1BE4;
  v10 = sub_1001F1BF4;
  id v11 = 0LL;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001F1BFC;
  v5[3] = &unk_1003E9BE0;
  v5[4] = self;
  v5[5] = &v6;
  sub_1002C11C4(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ApplicationRepairDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001F1CB0;
  v7[3] = &unk_1003E9DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_1002C11C4(lock, v7);
}

- (int)fairPlayStatus
{
  return 0;
}

- (_TtC9appstored6LogKey)logKey
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  objc_super v9 = sub_1001F1BE4;
  v10 = sub_1001F1BF4;
  id v11 = 0LL;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001F1D90;
  v5[3] = &unk_1003E9BE0;
  v5[4] = self;
  v5[5] = &v6;
  sub_1002C11C4(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (_TtC9appstored6LogKey *)v3;
}

- (void)setLogKey:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001F1E20;
  v7[3] = &unk_1003E9DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_1002C11C4(lock, v7);
}

- (NSArray)repairedBundleIDs
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  objc_super v9 = sub_1001F1BE4;
  v10 = sub_1001F1BF4;
  id v11 = 0LL;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001F1F28;
  v5[3] = &unk_1003E9BE0;
  v5[4] = self;
  v5[5] = &v6;
  sub_1002C11C4(lock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSString)repairType
{
  return (NSString *)@"Factory";
}

+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleID]);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 record]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 prependingCategory:@"Claim"]);
    char v12 = sub_1001F20CC((uint64_t)a1, v10, v11);
  }

  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)repairApplication:(id)a3 error:(id *)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_activeiTunesAccount"));

  if (v5)
  {
    id v210 = 0LL;
    goto LABEL_3;
  }

  if (!self) {
    goto LABEL_20;
  }
  *(void *)&__int128 v222 = 0LL;
  *((void *)&v222 + 1) = &v222;
  *(void *)&__int128 v223 = 0x2020000000LL;
  BYTE8(v223) = 0;
  lock = self->_lock;
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472LL;
  *(void *)&buf[16] = sub_1001F1AF0;
  v235 = &unk_1003E9BE0;
  *(void *)&__int128 v236 = self;
  *((void *)&v236 + 1) = &v222;
  sub_1002C11C4(lock, buf);
  int v15 = *(unsigned __int8 *)(*((void *)&v222 + 1) + 24LL);
  _Block_object_dispose(&v222, 8);
  if (!v15)
  {
LABEL_20:
    id v210 = 0LL;
    goto LABEL_21;
  }

  uint64_t v16 = ASDLogHandleForCategory(28LL);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@] Prompting to request authentication to establish an active account",  buf,  0xCu);
  }

  id v19 = objc_alloc_init(&OBJC_CLASS___AMSAuthenticateOptions);
  [v19 setAuthenticationType:2];
  [v19 setDebugReason:@"Claim"];
  uint64_t v20 = ASDLocalizedString(@"CLAIM_AUTHENTICATION_MESSAGE_NO_APPLE_ACCOUNT");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v19 setReason:v21];

  v22 = -[AMSAuthenticateRequest initWithAccount:options:]( objc_alloc(&OBJC_CLASS___AMSAuthenticateRequest),  "initWithAccount:options:",  0LL,  v19);
  id v218 = 0LL;
  id v23 = sub_1001F3FDC(self, v22, &v218);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  id v210 = v218;
  if (v210)
  {
    uint64_t v25 = ASDLogHandleForCategory(28LL);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v210;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%@] Attempt to establish primary account resulted in error: %{public}@",  buf,  0x16u);
    }

    id v5 = 0LL;
LABEL_16:

    goto LABEL_17;
  }

  if (v24)
  {
    v192 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "ams_activeiTunesAccount"));

    uint64_t v193 = ASDLogHandleForCategory(28LL);
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v193);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v194 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
      v195 = (void *)objc_claimAutoreleasedReturnValue([v24 account]);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v194;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v195;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[%@] Logged into account: %{public}@",  buf,  0x16u);
    }

    goto LABEL_16;
  }

  id v5 = 0LL;
LABEL_17:

  if (v5)
  {
LABEL_3:
    v201 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice buildVersion](&OBJC_CLASS___AMSDevice, "buildVersion"));
    id v206 = v5;
    objc_opt_self(&OBJC_CLASS___FactoryApplicationRepair);
    CFPropertyListRef v6 = sub_1002FA5DC((uint64_t)&OBJC_CLASS___AppDefaultsManager);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v206 identifier]);
      if (v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v10]);
        uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString, v12);
        if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0) {
          id v204 = [v11 copy];
        }
        else {
          id v204 = 0LL;
        }
      }

      else
      {
        id v204 = 0LL;
      }
    }

    else
    {
      id v204 = 0LL;
    }

    if (v204)
    {
      if ([v201 isEqualToString:v204])
      {
        if (!self) {
          goto LABEL_158;
        }
        *(void *)&__int128 v222 = 0LL;
        *((void *)&v222 + 1) = &v222;
        *(void *)&__int128 v223 = 0x2020000000LL;
        BYTE8(v223) = 0;
        v34 = self->_lock;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&buf[16] = sub_1001F1B04;
        v235 = &unk_1003E9BE0;
        *(void *)&__int128 v236 = self;
        *((void *)&v236 + 1) = &v222;
        sub_1002C11C4(v34, buf);
        int v35 = *(unsigned __int8 *)(*((void *)&v222 + 1) + 24LL);
        _Block_object_dispose(&v222, 8);
        if (!v35)
        {
LABEL_158:
          uint64_t v190 = ASDLogHandleForCategory(28LL);
          log = (os_log_s *)objc_claimAutoreleasedReturnValue(v190);
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            v191 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v191;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v201;
            *(_WORD *)&buf[22] = 2112;
            v235 = v206;
            _os_log_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEFAULT,  "[%@] Skipping claim, already did claim for this build: %@ and user: %@",  buf,  0x20u);
          }

          goto LABEL_148;
        }
      }
    }

    id v36 = (id)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
    context = (void *)objc_opt_self(&OBJC_CLASS___FactoryApplicationRepair);
    log = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v224 = 0u;
    __int128 v225 = 0u;
    __int128 v222 = 0u;
    __int128 v223 = 0u;
    id v37 = sub_100325C00((uint64_t)&OBJC_CLASS___LSApplicationRecord, 0LL, 0LL);
    id obj = (id)objc_claimAutoreleasedReturnValue(v37);
    id v38 = [obj countByEnumeratingWithState:&v222 objects:buf count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v223;
      do
      {
        for (i = 0LL; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v223 != v39) {
            objc_enumerationMutation(obj);
          }
          v41 = *(void **)(*((void *)&v222 + 1) + 8LL * (void)i);
          v42 = objc_autoreleasePoolPush();
          v43 = (void *)objc_claimAutoreleasedReturnValue([v41 iTunesMetadata]);
          id v44 = [v43 storeItemIdentifier];

          if ((!v44 || sub_1001F20CC((uint64_t)context, v41, v36))
            && ([v41 isProfileValidated] & 1) == 0)
          {
            v45 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            v46 = (void *)objc_claimAutoreleasedReturnValue([v41 bundleIdentifier]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v46, @"bid");

            v47 = (void *)objc_claimAutoreleasedReturnValue([v41 exactBundleVersion]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v47, @"bvrs");

            v48 = (void *)objc_claimAutoreleasedReturnValue([v41 iTunesMetadata]);
            id v49 = [v48 versionIdentifier];

            if (v49)
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v49));
              v51 = (void *)objc_claimAutoreleasedReturnValue([v50 stringValue]);
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v45,  "setObject:forKeyedSubscript:",  v51,  @"vid");
            }

            if (v44)
            {
              v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v44));
              v53 = (void *)objc_claimAutoreleasedReturnValue([v52 stringValue]);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v53, @"id");
            }

            v54 = (void *)objc_claimAutoreleasedReturnValue([v41 iTunesMetadata]);
            v55 = (void *)objc_claimAutoreleasedReturnValue([v54 variantID]);

            if (v55) {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( v45,  "setObject:forKeyedSubscript:",  v55,  @"variantId");
            }
            uint64_t v56 = ASDLogHandleForCategory(28LL);
            v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v228 = 138412546;
              id v229 = v36;
              __int16 v230 = 2114;
              v231 = v45;
              _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "[%@] Discovered claimable application: %{public}@",  v228,  0x16u);
            }

            -[os_log_s addObject:](log, "addObject:", v45);
          }

          objc_autoreleasePoolPop(v42);
        }

        id v38 = [obj countByEnumeratingWithState:&v222 objects:buf count:16];
      }

      while (v38);
    }

    BOOL v58 = -[os_log_s count](log, "count") == 0LL;
    uint64_t v59 = ASDLogHandleForCategory(28LL);
    oslog = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
    BOOL v60 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
    if (v58)
    {
      if (v60)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v77;
        _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "[%@] Skipping claim, wasn't able to discover any unclaimed apps",  buf,  0xCu);
      }

      goto LABEL_143;
    }

    if (v60)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
      id v62 = -[os_log_s count](log, "count");
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "ams_DSID"));
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = v61;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v62;
      *(_WORD *)&buf[22] = 2114;
      v235 = v63;
      LOWORD(v236) = 2114;
      *(void *)((char *)&v236 + 2) = v204;
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "[%@] Running claim for %ld app(s) for accountID: %{public}@. Last claim was on build: %{public}@",  buf,  0x2Au);
    }

    if (self)
    {
      v64 = log;
      id v65 = v206;
      v66 = -[AMSURLRequestEncoder initWithBag:]( objc_alloc(&OBJC_CLASS___AMSURLRequestEncoder),  "initWithBag:",  self->_bag);
      -[AMSURLRequestEncoder setAccount:](v66, "setAccount:", v65);
      -[AMSURLRequestEncoder setRequestEncoding:](v66, "setRequestEncoding:", 3LL);
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
      id v68 = v65;
      id v69 = v67;
      v70 = v64;
      objc_opt_self(&OBJC_CLASS___FactoryApplicationRepair);
      v71 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v71, "setObject:forKeyedSubscript:", v70, @"apps");

      v72 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDevice deviceGUID](&OBJC_CLASS___AMSDevice, "deviceGUID"));
      if (v72) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v71, "setObject:forKeyedSubscript:", v72, @"guid");
      }
      *(void *)&__int128 v222 = 0LL;
      id v73 = sub_10023FE48((uint64_t)&OBJC_CLASS___AMSKeybag, v68, 1LL, &v222);
      v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
      id v75 = (id)v222;
      v76 = v75;
      if (!v74 || v75)
      {
        uint64_t v78 = ASDLogHandleForCategory(28LL);
        v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v69;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v68;
          *(_WORD *)&buf[22] = 2114;
          v235 = v76;
          _os_log_error_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_ERROR,  "[%@] Failed to generate keybag for account: %{public}@ error: %{public}@",  buf,  0x20u);
        }
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v71, "setObject:forKeyedSubscript:", v74, @"kbsync");
      }

      v80 = (void *)objc_claimAutoreleasedReturnValue(-[AMSBagProtocol URLForKey:](self->_bag, "URLForKey:", @"factory-app-claim"));
      v81 = (void *)objc_claimAutoreleasedReturnValue( -[AMSURLRequestEncoder requestWithMethod:bagURL:parameters:]( v66,  "requestWithMethod:bagURL:parameters:",  4LL,  v80,  v71));
      *(void *)buf = 0LL;
      v82 = (void *)objc_claimAutoreleasedReturnValue([v81 resultWithError:buf]);
      id v83 = *(id *)buf;

      v84 = sub_1001E6524((uint64_t)&OBJC_CLASS___AMSURLSession, self);
      v85 = (void *)objc_claimAutoreleasedReturnValue(v84);
      v86 = (void *)objc_claimAutoreleasedReturnValue([v85 dataTaskPromiseWithRequest:v82]);
      *(void *)&__int128 v222 = v83;
      v87 = (void *)objc_claimAutoreleasedReturnValue([v86 resultWithError:&v222]);
      id v88 = (id)v222;

      if (v88)
      {
        id v89 = v88;
        v90 = 0LL;
      }

      else
      {
        v90 = (void *)objc_claimAutoreleasedReturnValue([v87 object]);
        id v89 = v210;
      }
    }

    else
    {
      v90 = 0LL;
      id v89 = v210;
    }

    id v203 = v89;

    if (!v90)
    {
      uint64_t v114 = ASDLogHandleForCategory(28LL);
      v115 = (os_log_s *)objc_claimAutoreleasedReturnValue(v114);
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
      {
        v196 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v196;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v203;
        _os_log_error_impl( (void *)&_mh_execute_header,  v115,  OS_LOG_TYPE_ERROR,  "[%@] Claim failed with error: %{public}@",  buf,  0x16u);
      }

      goto LABEL_150;
    }

    oslog = v90;
    id v207 = v206;
    if (!self)
    {
      v208 = 0LL;
LABEL_138:

      uint64_t v171 = ASDLogHandleForCategory(28LL);
      v172 = (os_log_s *)objc_claimAutoreleasedReturnValue(v171);
      if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
      {
        v173 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
        v174 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v208, "componentsJoinedByString:", @", "));
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v173;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v174;
        _os_log_impl( (void *)&_mh_execute_header,  v172,  OS_LOG_TYPE_DEFAULT,  "[%@] Claim completed for: %{public}@",  buf,  0x16u);
      }

      v175 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self->_application, "bundleID"));
      BOOL v176 = v175 == 0LL;

      if (!v176)
      {
        v177 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self->_application, "bundleID"));
        unsigned int v178 = -[NSMutableArray containsObject:](v208, "containsObject:", v177);

        if (v178)
        {
          v179 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair delegate](self, "delegate"));
          [v179 repair:self wantsToRelaunchApplication:self->_application];

          sub_1001F1F60((uint64_t)self, v208);
          id v210 = v203;
LABEL_143:

          id v180 = v201;
          id v181 = v206;
          objc_opt_self(&OBJC_CLASS___FactoryApplicationRepair);
          v182 = (void *)objc_claimAutoreleasedReturnValue([v181 identifier]);

          if (v182)
          {
            v183 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
            CFPropertyListRef v184 = sub_1002FA5DC((uint64_t)&OBJC_CLASS___AppDefaultsManager);
            v185 = (void *)objc_claimAutoreleasedReturnValue(v184);
            uint64_t v187 = objc_opt_class(&OBJC_CLASS___NSDictionary, v186);
            if ((objc_opt_isKindOfClass(v185, v187) & 1) != 0) {
              -[NSMutableDictionary addEntriesFromDictionary:](v183, "addEntriesFromDictionary:", v185);
            }
            -[NSMutableDictionary setObject:forKey:](v183, "setObject:forKey:", v180, v182, v197);
            sub_1002FA79C((uint64_t)&OBJC_CLASS___AppDefaultsManager, v183);
          }

LABEL_148:
          BOOL v32 = 1;
          id v203 = v210;
LABEL_151:

          v33 = v201;
          goto LABEL_152;
        }
      }

      sub_1001F1F60((uint64_t)self, v208);

LABEL_150:
      BOOL v32 = 0;
      goto LABEL_151;
    }

    v208 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207, "ams_DSID"));
    id v91 = sub_1002EB678((uint64_t)&OBJC_CLASS___StoreItemResponse, oslog, 1);
    selfa = (id)objc_claimAutoreleasedReturnValue(v91);
    uint64_t v92 = ASDLogHandleForCategory(28LL);
    v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      v95 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
      id Property = selfa;
      if (selfa) {
        id Property = objc_getProperty(selfa, v94, 56LL, 1);
      }
      id v97 = Property;
      id v98 = [v97 count];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v95;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v98;
      *(_WORD *)&buf[22] = 2114;
      v235 = v198;
      _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "[%@] Attempting to process %ld item(s) for accountID: %{public}@",  buf,  0x20u);
    }

    id v100 = selfa;
    if (selfa) {
      id v100 = objc_getProperty(selfa, v99, 64LL, 1);
    }
    id v199 = v100;
    uint64_t v102 = objc_opt_class(&OBJC_CLASS___NSData, v101);
    char isKindOfClass = objc_opt_isKindOfClass(v199, v102);
    uint64_t v104 = ASDLogHandleForCategory(28LL);
    v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
    BOOL v106 = os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT);
    if ((isKindOfClass & 1) != 0)
    {
      if (v106)
      {
        v107 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
        id v108 = [v199 length];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v107;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v108;
        _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEFAULT,  "[%@] Importing keybag data (%{iec-bytes}lu) following claim(s)",  buf,  0x16u);
      }

      v109 = (void *)objc_claimAutoreleasedReturnValue(+[AMSKeybag sharedInstance](&OBJC_CLASS___AMSKeybag, "sharedInstance"));
      id v226 = 0LL;
      unsigned __int8 v110 = [v109 importKeybagWithData:v199 error:&v226];
      id v197 = v226;

      if ((v110 & 1) != 0) {
        goto LABEL_89;
      }
      uint64_t v112 = ASDLogHandleForCategory(28LL);
      v105 = (os_log_s *)objc_claimAutoreleasedReturnValue(v112);
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      {
        v113 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v113;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v197;
        _os_log_error_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_ERROR,  "[%@] Importing keybag data failed with error: %{public}@",  buf,  0x16u);
      }
    }

    else
    {
      if (v106)
      {
        v116 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v116;
        _os_log_impl( (void *)&_mh_execute_header,  v105,  OS_LOG_TYPE_DEFAULT,  "[%@] No keybag available to import - keybag sync may follow",  buf,  0xCu);
      }

      id v197 = 0LL;
    }

LABEL_89:
    __int128 v224 = 0u;
    __int128 v225 = 0u;
    __int128 v222 = 0u;
    __int128 v223 = 0u;
    id v117 = selfa;
    if (selfa) {
      id v117 = objc_getProperty(selfa, v111, 56LL, 1);
    }
    id v211 = v117;
    id obja = [v211 countByEnumeratingWithState:&v222 objects:buf count:16];
    if (obja)
    {
      uint64_t v213 = *(void *)v223;
      do
      {
        v118 = 0LL;
        do
        {
          if (*(void *)v223 != v213) {
            objc_enumerationMutation(v211);
          }
          v119 = *(void **)(*((void *)&v222 + 1) + 8LL * (void)v118);
          contexta = objc_autoreleasePoolPush();
          if (v119) {
            id v121 = objc_getProperty(v119, v120, 96LL, 1);
          }
          else {
            id v121 = 0LL;
          }
          v122 = (NSMutableDictionary *)v121;
          v123 = objc_alloc(&OBJC_CLASS___ApplicationProxy);
          id v221 = 0LL;
          v124 = -[ApplicationProxy initWithBundleID:allowPlaceholder:error:]( v123,  "initWithBundleID:allowPlaceholder:error:",  v122,  0LL,  &v221);
          id v126 = v221;
          if (v124)
          {
            if (v119)
            {
              id v127 = objc_getProperty(v119, v125, 72LL, 1);
              v129 = v127;
              if (v127) {
                id v127 = objc_getProperty(v127, v128, 144LL, 1);
              }
            }

            else
            {
              v129 = 0LL;
              id v127 = 0LL;
            }

            id v130 = v127;

            if (v130 && [v130 length])
            {
              uint64_t v131 = ASDLogHandleForCategory(28LL);
              v132 = (os_log_s *)objc_claimAutoreleasedReturnValue(v131);
              if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
              {
                v133 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
                *(_DWORD *)v228 = 138412546;
                id v229 = v133;
                __int16 v230 = 2114;
                v231 = v122;
                _os_log_impl( (void *)&_mh_execute_header,  v132,  OS_LOG_TYPE_DEFAULT,  "[%@][%{public}@] Updating app metadata",  v228,  0x16u);
              }

              v134 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy applicationIdentity](v124, "applicationIdentity"));
              id v220 = v126;
              unsigned __int8 v135 = sub_1001E52B4( (uint64_t)&OBJC_CLASS___IXAppInstallCoordinator,  v134,  0LL,  v130,  (uint64_t)&v220);
              id v136 = v220;

              if ((v135 & 1) != 0)
              {
                v137 = sub_100303B74((uint64_t)&OBJC_CLASS___MIStoreMetadata, v119);
                v138 = (void *)objc_claimAutoreleasedReturnValue(v137);
                sub_1003042C8(v138, v207);
                if (v138) {
                  sub_100304410(v138, v130, 0);
                }
                v139 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy record](v124, "record", v197));
                v140 = (void *)objc_claimAutoreleasedReturnValue([v139 iTunesMetadata]);
                v141 = (void *)objc_claimAutoreleasedReturnValue([v140 variantID]);

                if (v141)
                {
                  uint64_t v142 = ASDLogHandleForCategory(28LL);
                  v143 = (os_log_s *)objc_claimAutoreleasedReturnValue(v142);
                  if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
                  {
                    v144 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
                    *(_DWORD *)v228 = 138412802;
                    id v229 = v144;
                    __int16 v230 = 2114;
                    v231 = v122;
                    __int16 v232 = 2114;
                    id v233 = v141;
                    _os_log_impl( (void *)&_mh_execute_header,  v143,  OS_LOG_TYPE_DEFAULT,  "[%@][%{public}@] Updating app metadata with variantID: %{public}@",  v228,  0x20u);
                  }

                  [v138 setVariantID:v141];
                }

                id v219 = v136;
                unsigned __int8 v145 = sub_10030456C(v138, v122, 0LL, &v219);
                id v126 = v219;

                if ((v145 & 1) == 0)
                {
                  uint64_t v146 = ASDLogHandleForCategory(28LL);
                  v147 = (os_log_s *)objc_claimAutoreleasedReturnValue(v146);
                  if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
                  {
                    v164 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
                    *(_DWORD *)v228 = 138412802;
                    id v229 = v164;
                    __int16 v230 = 2114;
                    v231 = v122;
                    __int16 v232 = 2114;
                    id v233 = v126;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v147,  OS_LOG_TYPE_ERROR,  "[%@][%{public}@] Metadata could not be updated due to error: %{public}@",  v228,  0x20u);
                  }
                }

                v148 = objc_alloc(&OBJC_CLASS___AppLedgerEvent);
                v149 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy record](v124, "record"));
                v150 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
                v151 = sub_1002EAB38(v148, v149, v150);

                id v152 = sub_10022D6AC((uint64_t)&OBJC_CLASS___AppLedger);
                v153 = (void *)objc_claimAutoreleasedReturnValue(v152);
                v227 = v151;
                v154 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v227,  1LL));
                sub_10022DAF8((uint64_t)v153, v154);

                uint64_t v155 = ASDLogHandleForCategory(28LL);
                v156 = (os_log_s *)objc_claimAutoreleasedReturnValue(v155);
                if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
                {
                  v157 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
                  *(_DWORD *)v228 = 138412546;
                  id v229 = v157;
                  __int16 v230 = 2114;
                  v231 = v122;
                  _os_log_impl( (void *)&_mh_execute_header,  v156,  OS_LOG_TYPE_DEFAULT,  "[%@][%{public}@] Claim complete",  v228,  0x16u);
                }

                -[NSMutableArray addObject:](v208, "addObject:", v122);
              }

              else
              {
                uint64_t v162 = ASDLogHandleForCategory(28LL);
                v138 = (void *)objc_claimAutoreleasedReturnValue(v162);
                if (os_log_type_enabled((os_log_t)v138, OS_LOG_TYPE_ERROR))
                {
                  v163 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
                  *(_DWORD *)v228 = 138412802;
                  id v229 = v163;
                  __int16 v230 = 2114;
                  v231 = v122;
                  __int16 v232 = 2114;
                  id v233 = v136;
                  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v138,  OS_LOG_TYPE_ERROR,  "[%@][%{public}@] Skipping update. Unable to update metadata SINF due to error: %{public}@",  v228,  0x20u);
                }

                id v126 = v136;
              }
            }

            else
            {
              uint64_t v158 = ASDLogHandleForCategory(28LL);
              v138 = (void *)objc_claimAutoreleasedReturnValue(v158);
              if (os_log_type_enabled((os_log_t)v138, OS_LOG_TYPE_ERROR))
              {
                v159 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
                *(_DWORD *)v228 = 138412546;
                id v229 = v159;
                __int16 v230 = 2114;
                v231 = v122;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v138,  OS_LOG_TYPE_ERROR,  "[%@][%{public}@] Skipping update due to missing SINF data",  v228,  0x16u);
              }
            }
          }

          else
          {
            uint64_t v160 = ASDLogHandleForCategory(28LL);
            id v130 = (id)objc_claimAutoreleasedReturnValue(v160);
            if (os_log_type_enabled((os_log_t)v130, OS_LOG_TYPE_ERROR))
            {
              v161 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
              *(_DWORD *)v228 = 138412802;
              id v229 = v161;
              __int16 v230 = 2114;
              v231 = v122;
              __int16 v232 = 2114;
              id v233 = v126;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v130,  OS_LOG_TYPE_ERROR,  "[%@][%{public}@] Skipping update as it doesn't appear to be installed: %{public}@",  v228,  0x20u);
            }
          }

          objc_autoreleasePoolPop(contexta);
          v118 = (char *)v118 + 1;
        }

        while (obja != v118);
        id v165 = [v211 countByEnumeratingWithState:&v222 objects:buf count:16];
        id obja = v165;
      }

      while (v165);
    }

    if (-[NSMutableArray count](v208, "count"))
    {
      uint64_t v166 = ASDLogHandleForCategory(28LL);
      v167 = (os_log_s *)objc_claimAutoreleasedReturnValue(v166);
      if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
      {
        v168 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
        v169 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( -[NSMutableArray componentsJoinedByString:]( v208,  "componentsJoinedByString:",  @", "));
        v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207, "ams_DSID"));
        *(_DWORD *)v228 = 138412802;
        id v229 = v168;
        __int16 v230 = 2114;
        v231 = v169;
        __int16 v232 = 2112;
        id v233 = v170;
        _os_log_impl( (void *)&_mh_execute_header,  v167,  OS_LOG_TYPE_DEFAULT,  "[%@] Claim complete for bundleIDs: [%{public}@] for accountID: %@",  v228,  0x20u);
      }
    }

    goto LABEL_138;
  }

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  uint64_t v9 = (void (**)(id, void *, id))a6;
  uint64_t v10 = ASDLogHandleForCategory(28LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
    *(_DWORD *)buf = 138412546;
    uint64_t v25 = v12;
    __int16 v26 = 2114;
    id v27 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%@] Presenting dialog request: %{public}@",  buf,  0x16u);
  }

  uint64_t v13 = ASDErrorWithDescription(ASDErrorDomain, 541LL, @"Need to present server dialog");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  int v15 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair delegate](self, "delegate"));
  [v15 repair:self needsToReleaseBlockingCallerWithReason:v14];

  uint64_t v16 = -[AMSSystemAlertDialogTask initWithRequest:]( objc_alloc(&OBJC_CLASS___AMSSystemAlertDialogTask),  "initWithRequest:",  v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AMSSystemAlertDialogTask present](v16, "present"));
  id v23 = 0LL;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 resultWithError:&v23]);
  id v19 = v23;

  if (!v18)
  {
    uint64_t v20 = ASDLogHandleForCategory(28LL);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = v22;
      __int16 v26 = 2114;
      id v27 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "[%@] Dialog request failed with error: %{public}@",  buf,  0x16u);
    }
  }

  v9[2](v9, v18, v19);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v8 = a5;
  uint64_t v9 = (void (**)(id, void *, id))a6;
  uint64_t v10 = ASDLogHandleForCategory(28LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
    *(_DWORD *)buf = 138412546;
    v21 = v12;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[%@] Presenting authentication request: %{public}@",  buf,  0x16u);
  }

  id v19 = 0LL;
  id v13 = sub_1001F3FDC(self, v8, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v19;
  if (!v14)
  {
    uint64_t v16 = ASDLogHandleForCategory(28LL);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FactoryApplicationRepair logKey](self, "logKey"));
      *(_DWORD *)buf = 138412546;
      v21 = v18;
      __int16 v22 = 2114;
      id v23 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "[%@] Authenticate request failed with error: %{public}@",  buf,  0x16u);
    }
  }

  v9[2](v9, v14, v15);
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  uint64_t v7 = ASDErrorDomain;
  id v8 = a6;
  uint64_t v9 = ASDErrorWithTitleAndMessage(v7, 909LL, 0LL, 0LL);
  id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
  (*((void (**)(id, void, id))a6 + 2))(v8, 0LL, v10);
}

- (void)authenticateTask:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = ASDLogHandleForCategory(28LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting dialog task", buf, 0xCu);
  }

  id v11 = -[AMSSystemAlertDialogTask initWithRequest:]( objc_alloc(&OBJC_CLASS___AMSSystemAlertDialogTask),  "initWithRequest:",  v8);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[AMSSystemAlertDialogTask present](v11, "present"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001F48BC;
  v14[3] = &unk_1003EBDA8;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  [v12 addFinishBlock:v14];
}

- (void).cxx_destruct
{
}

@end