@interface MSDAccount
+ (ACAccount)activeiTunesAccount;
- (BOOL)_accountHasLocalPlayableContent:(id)a3;
- (BOOL)hasValidSubscription;
- (MSDAccount)initWithHomeIdentifier:(id)a3;
- (MSDAccount)initWithHomeUserIdentifier:(id)a3;
- (NSString)iTunesAccountName;
- (NSUUID)homeIdentifier;
- (NSUUID)homeUserIdentifier;
@end

@implementation MSDAccount

- (MSDAccount)initWithHomeUserIdentifier:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MSDAccount;
  v6 = -[MSDAccount init](&v19, "init");
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  if (v5)
  {
    objc_storeStrong((id *)&v6->_homeUserIdentifier, a3);
    v7->_syncLock._os_unfair_lock_opaque = 0;
LABEL_4:
    v8 = v7;
    goto LABEL_8;
  }

  id v9 = sub_10003E9DC();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100026A0C(v10, v11, v12, v13, v14, v15, v16, v17);
  }

  v8 = 0LL;
LABEL_8:

  return v8;
}

- (MSDAccount)initWithHomeIdentifier:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MSDAccount;
  v6 = -[MSDAccount init](&v19, "init");
  v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  if (v5)
  {
    objc_storeStrong((id *)&v6->_homeIdentifier, a3);
LABEL_4:
    v8 = v7;
    goto LABEL_8;
  }

  id v9 = sub_10003E9DC();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100026A40(v10, v11, v12, v13, v14, v15, v16, v17);
  }

  v8 = 0LL;
LABEL_8:

  return v8;
}

- (NSString)iTunesAccountName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_iTunesAccountWithHomeUserIdentifier:", self->_homeUserIdentifier));
  id v5 = sub_10003E9DC();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);
    int v10 = 138412290;
    uint64_t v11 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "User Active iTunes Account: %@",  (uint8_t *)&v10,  0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 username]);
  return (NSString *)v8;
}

- (BOOL)hasValidSubscription
{
  if (qword_1000707D8 != -1) {
    dispatch_once(&qword_1000707D8, &stru_100061E88);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_iTunesAccountWithHomeUserIdentifier:", self->_homeUserIdentifier));

  if (v4)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000707D0 objectForKey:v5]);
    v7 = v6;
    if (v6)
    {
      unsigned __int8 v8 = [v6 BOOLValue];
    }

    else
    {
      uint64_t v41 = 0LL;
      v42 = &v41;
      uint64_t v43 = 0x2020000000LL;
      char v44 = 1;
      dispatch_semaphore_t v16 = dispatch_semaphore_create(0LL);
      id v17 = sub_10003E9DC();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      dispatch_semaphore_t v34 = v16;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138478083;
        v46 = v4;
        __int16 v47 = 2113;
        v48 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "UserAccount %{private}@ with DSID %{private}@",  buf,  0x16u);
      }

      objc_super v19 = (void *)objc_claimAutoreleasedReturnValue( +[ICUserIdentity specificAccountWithDSID:]( &OBJC_CLASS___ICUserIdentity,  "specificAccountWithDSID:",  v5));
      id v20 = sub_10003E9DC();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v46 = v19;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "UserIdentity %{private}@", buf, 0xCu);
      }

      id v35 = [[ICStoreRequestContext alloc] initWithIdentity:v19];
      id v22 = [[ICMusicSubscriptionStatusRequest alloc] initWithStoreRequestContext:v35];
      [v22 setShouldReturnLastKnownStatusOnly:1];
      v23 = (char *)MSDGenerateSignpostID();
      id v24 = MSDSignpostFacility();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      v26 = v25;
      if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)v23,  "CheckSubscriptionStatus",  (const char *)&unk_10004C5A3,  buf,  2u);
      }

      objc_initWeak((id *)buf, self);
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_100026680;
      v36[3] = &unk_100061EB0;
      v39 = &v41;
      objc_copyWeak(v40, (id *)buf);
      id v28 = v19;
      id v37 = v28;
      v40[1] = v23;
      v29 = v34;
      v38 = v29;
      [v27 performSubscriptionStatusRequest:v22 withStatusHandler:v36];
      dispatch_time_t v30 = dispatch_time(0LL, 1000000000LL * MSiTunesCloudSubscriptionStatusMaxTimeOut);
      dispatch_semaphore_wait(v29, v30);
      v31 = (void *)qword_1000707D0;
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *((unsigned __int8 *)v42 + 24)));
      [v31 setObject:v32 forKey:v5];

      unsigned __int8 v8 = *((_BYTE *)v42 + 24) != 0;
      objc_destroyWeak(v40);

      objc_destroyWeak((id *)buf);
      _Block_object_dispose(&v41, 8);
    }
  }

  else
  {
    id v9 = sub_10003E9DC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100026A74((uint64_t)&self->_homeUserIdentifier, v5, v10, v11, v12, v13, v14, v15);
    }
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)_accountHasLocalPlayableContent:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery songsQuery](&OBJC_CLASS___MPMediaQuery, "songsQuery"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:]( &OBJC_CLASS___MPMediaLibrary,  "deviceMediaLibraryWithUserIdentity:",  v3));

  [v4 setIgnoreSystemFilterPredicates:1];
  [v4 setMediaLibrary:v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[MPMediaPropertyPredicate predicateWithValue:forProperty:]( &OBJC_CLASS___MPMediaPropertyPredicate,  "predicateWithValue:forProperty:",  &__kCFBooleanTrue,  MPMediaItemPropertyHasNonPurgeableAsset));
  [v4 addFilterPredicate:v6];

  LOBYTE(v6) = [v4 _hasItems];
  return (char)v6;
}

+ (ACAccount)activeiTunesAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_activeiTunesAccount"));

  return (ACAccount *)v3;
}

- (NSUUID)homeUserIdentifier
{
  return self->_homeUserIdentifier;
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void).cxx_destruct
{
}

@end