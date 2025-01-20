@interface IDSDGroupContextController
+ (id)sharedInstance;
- (CUTPromiseSeal)seal;
- (ENGroupContext)messagesGroupContext;
- (IDSDGroupContextController)init;
- (id)registrationCenter;
- (void)_messagesGroupContextWithCompletion:(id)a3;
- (void)centerUpdatedRegistrationIdentities:(id)a3;
- (void)dealloc;
- (void)deleteAllCachedValuesForGroupWithID:(id)a3 WithCompletion:(id)a4;
- (void)deleteAllKnownGroupsWithCompletion:(id)a3;
- (void)fetchAllKnownGroups:(id)a3;
- (void)fetchGroupWithID:(id)a3 completion:(id)a4;
- (void)groupContextForProtectionSpace:(int64_t)a3 withCompletion:(id)a4;
- (void)groupFromPublicDataRepresentation:(id)a3 completion:(id)a4;
- (void)latestCachedGroupWithStableID:(id)a3 completion:(id)a4;
- (void)participantsForCypher:(id)a3 completion:(id)a4;
- (void)publicDataRepresentationForGroup:(id)a3 completion:(id)a4;
- (void)qGroupContextWithDeviceIdentity:(id)a3 completion:(id)a4;
- (void)qSetupSeal;
- (void)setMessagesGroupContext:(id)a3;
- (void)setSeal:(id)a3;
- (void)upsertGroupWithInfo:(id)a3 previousGroup:(id)a4 completion:(id)a5;
- (void)validateCachedGroup:(id)a3 isParentOfGroup:(id)a4 completion:(id)a5;
@end

@implementation IDSDGroupContextController

+ (id)sharedInstance
{
  if (qword_1009C0A40 != -1) {
    dispatch_once(&qword_1009C0A40, &stru_1008FFC70);
  }
  return (id)qword_1009C0A48;
}

- (IDSDGroupContextController)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSDGroupContextController;
  v2 = -[IDSDGroupContextController init](&v9, "init");
  if (v2)
  {
    uint64_t v3 = OSLogHandleForIDSCategory("DaemonGroupContext");
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Group context controller starting up", v8, 2u);
    }

    if (os_log_shim_legacy_logging_enabled(v5)
      && _IDSShouldLog(0LL, @"DaemonGroupContext"))
    {
      _IDSLogV(0LL, @"IDSFoundation", @"DaemonGroupContext", @"Group context controller starting up");
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupContextController registrationCenter](v2, "registrationCenter"));
    [v6 addListener:v2];
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupContextController registrationCenter](self, "registrationCenter"));
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IDSDGroupContextController;
  -[IDSDGroupContextController dealloc](&v4, "dealloc");
}

- (id)registrationCenter
{
  return +[IDSRegistrationCenter sharedInstance](&OBJC_CLASS___IDSRegistrationCenter, "sharedInstance");
}

- (void)groupContextForProtectionSpace:(int64_t)a3 withCompletion:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupContextController seal](self, "seal"));

  if (!v6) {
    -[IDSDGroupContextController qSetupSeal](self, "qSetupSeal");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupContextController seal](self, "seal"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 promise]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002C6DBC;
  v10[3] = &unk_1008F8760;
  id v11 = v5;
  id v9 = v5;
  [v8 registerResultBlock:v10];
}

- (void)upsertGroupWithInfo:(id)a3 previousGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = OSLogHandleForIDSCategory("DaemonGroupContext");
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Incoming Daemon UpsertGroup", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled(v13)
    && _IDSShouldLog(0LL, @"DaemonGroupContext"))
  {
    _IDSLogV(0LL, @"IDSFoundation", @"DaemonGroupContext", @"Incoming Daemon UpsertGroup");
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1002C7100;
  v17[3] = &unk_1008FFC98;
  id v18 = v9;
  id v19 = v8;
  id v20 = v10;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  -[IDSDGroupContextController groupContextForProtectionSpace:withCompletion:]( self,  "groupContextForProtectionSpace:withCompletion:",  0LL,  v17);
}

- (void)fetchGroupWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForIDSCategory("DaemonGroupContext");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Incoming Daemon FetchGroup {groupID: %{public}@}",  buf,  0xCu);
  }

  if (os_log_shim_legacy_logging_enabled(v10)
    && _IDSShouldLog(0LL, @"DaemonGroupContext"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"DaemonGroupContext",  @"Incoming Daemon FetchGroup {groupID: %{public}@}");
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002C7848;
  v13[3] = &unk_1008FFCC0;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  -[IDSDGroupContextController groupContextForProtectionSpace:withCompletion:]( self,  "groupContextForProtectionSpace:withCompletion:",  0LL,  v13);
}

- (void)publicDataRepresentationForGroup:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002C7AB0;
  v8[3] = &unk_1008FFCC0;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  -[IDSDGroupContextController groupContextForProtectionSpace:withCompletion:]( self,  "groupContextForProtectionSpace:withCompletion:",  0LL,  v8);
}

- (void)groupFromPublicDataRepresentation:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002C7D18;
  v8[3] = &unk_1008FFCC0;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  -[IDSDGroupContextController groupContextForProtectionSpace:withCompletion:]( self,  "groupContextForProtectionSpace:withCompletion:",  0LL,  v8);
}

- (void)participantsForCypher:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002C7F6C;
  v8[3] = &unk_1008FFCC0;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  -[IDSDGroupContextController groupContextForProtectionSpace:withCompletion:]( self,  "groupContextForProtectionSpace:withCompletion:",  0LL,  v8);
}

- (void)validateCachedGroup:(id)a3 isParentOfGroup:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002C81E4;
  v11[3] = &unk_1008FFC98;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  -[IDSDGroupContextController groupContextForProtectionSpace:withCompletion:]( self,  "groupContextForProtectionSpace:withCompletion:",  0LL,  v11);
}

- (void)latestCachedGroupWithStableID:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002C843C;
  v8[3] = &unk_1008FFCC0;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  -[IDSDGroupContextController _messagesGroupContextWithCompletion:](self, "_messagesGroupContextWithCompletion:", v8);
}

- (void)fetchAllKnownGroups:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002C8550;
  v5[3] = &unk_1008FFD60;
  id v6 = a3;
  id v4 = v6;
  -[IDSDGroupContextController _messagesGroupContextWithCompletion:](self, "_messagesGroupContextWithCompletion:", v5);
}

- (void)deleteAllKnownGroupsWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002C86C4;
  v5[3] = &unk_1008FFD60;
  id v6 = a3;
  id v4 = v6;
  -[IDSDGroupContextController groupContextForProtectionSpace:withCompletion:]( self,  "groupContextForProtectionSpace:withCompletion:",  0LL,  v5);
}

- (void)deleteAllCachedValuesForGroupWithID:(id)a3 WithCompletion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1002C8800;
  v8[3] = &unk_1008FFCC0;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  -[IDSDGroupContextController groupContextForProtectionSpace:withCompletion:]( self,  "groupContextForProtectionSpace:withCompletion:",  0LL,  v8);
}

- (void)centerUpdatedRegistrationIdentities:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory("DaemonGroupContext");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Notified of update to registration identities; invalidating daemon cache",
      v8,
      2u);
  }

  if (os_log_shim_legacy_logging_enabled(v7)
    && _IDSShouldLog(0LL, @"DaemonGroupContext"))
  {
    _IDSLogV( 0LL,  @"IDSFoundation",  @"DaemonGroupContext",  @"Notified of update to registration identities; invalidating daemon cache");
  }

  -[IDSDGroupContextController setSeal:](self, "setSeal:", 0LL);
  -[IDSDGroupContextController groupContextForProtectionSpace:withCompletion:]( self,  "groupContextForProtectionSpace:withCompletion:",  0LL,  &stru_1008FFDA0);
}

- (void)_messagesGroupContextWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002C8B44;
  v5[3] = &unk_1008FFD60;
  id v6 = a3;
  id v4 = v6;
  -[IDSDGroupContextController groupContextForProtectionSpace:withCompletion:]( self,  "groupContextForProtectionSpace:withCompletion:",  0LL,  v5);
}

- (void)qSetupSeal
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___CUTPromiseSeal);
  uint64_t v5 = im_primary_queue(v3, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = -[CUTPromiseSeal initWithQueue:](v3, "initWithQueue:", v6);

  -[IDSDGroupContextController setSeal:](self, "setSeal:", v7);
}

- (void)qGroupContextWithDeviceIdentity:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupContextController messagesGroupContext](self, "messagesGroupContext"));

  if (v6)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[IDSDGroupContextController seal](self, "seal"));
    [v7 fulfillWithValue:self->_messagesGroupContext];
  }

  else
  {
    id v8 = objc_alloc(&OBJC_CLASS___ENAccountIdentity);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 accountIdentity]);
    id v7 = [v8 initWithAccountKey:v9 deviceKey:v5];

    id v10 = objc_alloc(&OBJC_CLASS___ENGroupContext);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[IDSDGroupContextDataSource sharedInstance]( &OBJC_CLASS___IDSDGroupContextDataSource,  "sharedInstance"));
    uint64_t v13 = im_primary_queue(v11, v12);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = -[ENGroupContext initWithAccountIdentity:dataSource:queue:]( v10,  "initWithAccountIdentity:dataSource:queue:",  v7,  v11,  v14);

    if (+[IMUserDefaults isEngramEnabled](&OBJC_CLASS___IMUserDefaults, "isEngramEnabled"))
    {
      id v16 = NSHomeDirectory();
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v17,  @"/Library/IdentityServices/",  0LL));
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v18));
      id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v19));

      id v21 = objc_alloc(&OBJC_CLASS___ENGroupContextCoreDataCache);
      uint64_t v23 = im_primary_queue(v21, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      id v25 = [v21 initOnDiskCacheWithContainerURL:v20 Queue:v24];

      v26 = -[IDSGroupSendAheadObserver initWithProtectionSpace:]( objc_alloc(&OBJC_CLASS___IDSGroupSendAheadObserver),  "initWithProtectionSpace:",  0LL);
      -[ENGroupContext appendMiddleware:](v15, "appendMiddleware:", v25);
      -[ENGroupContext appendMiddleware:](v15, "appendMiddleware:", v26);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_1002C8EC0;
      v28[3] = &unk_1008FA978;
      v28[4] = self;
      v29 = v15;
      [v25 loadWithCompletion:v28];
    }

    else
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDGroupContextController seal](self, "seal"));
      uint64_t v27 = ENGroupContextErrorDomain;
      NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
      v31 = @"Engram is disabled";
      id v25 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
      v26 = (IDSGroupSendAheadObserver *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v27,  -1000LL,  v25));
      [v20 failWithError:v26];
    }
  }
}

- (ENGroupContext)messagesGroupContext
{
  return self->_messagesGroupContext;
}

- (void)setMessagesGroupContext:(id)a3
{
}

- (CUTPromiseSeal)seal
{
  return self->_seal;
}

- (void)setSeal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end