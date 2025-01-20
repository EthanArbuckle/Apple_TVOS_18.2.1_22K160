@interface MSDAccountManager
+ (id)sharedInstance;
- (BOOL)_setupiCloudAccountWithSettings:(id)a3 outError:(id *)a4;
- (BOOL)_setupiTunesAccountWithSettings:(id)a3 outError:(id *)a4;
- (BOOL)_signIniCloudAccount:(id)a3 password:(id)a4 features:(id)a5 recoveryKey:(id)a6 resetCDP:(BOOL)a7 outError:(id *)a8;
- (BOOL)_signIniTunesAccount:(id)a3 password:(id)a4 outError:(id *)a5;
- (BOOL)_signOutiCloudAccountWithPassword:(id)a3 outError:(id *)a4;
- (BOOL)_signOutiTunesAccount:(id *)a3;
- (BOOL)_trySetupAccounts:(id *)a3;
- (BOOL)removeAccounts:(id *)a3;
- (BOOL)setupAccounts:(id *)a3;
- (MSDAccountManager)init;
- (MSDAccountManagerHelper)accountManagerHelper;
- (id)existingAccounts;
- (int)peerChangeToken;
- (void)_forceiCloudKeychainToSyncWithServer;
- (void)disallowAccountModification;
- (void)setAccountManagerHelper:(id)a3;
- (void)setPeerChangeToken:(int)a3;
- (void)setupTrustedPeerChangeNotificationObserver;
@end

@implementation MSDAccountManager

+ (id)sharedInstance
{
  if (qword_100125448 != -1) {
    dispatch_once(&qword_100125448, &stru_1000FA0D0);
  }
  return (id)qword_100125440;
}

- (MSDAccountManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MSDAccountManager;
  v2 = -[MSDAccountManager init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MSDAccountManagerHelper);
    -[MSDAccountManager setAccountManagerHelper:](v2, "setAccountManagerHelper:", v3);

    -[MSDAccountManager setPeerChangeToken:](v2, "setPeerChangeToken:", 0xFFFFFFFFLL);
  }

  return v2;
}

- (void)disallowAccountModification
{
  id v2 = sub_10003A95C();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disabling AppleID options in Settings!", v4, 2u);
  }
}

- (void)setupTrustedPeerChangeNotificationObserver
{
  id v3 = sub_10003A95C();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Starting to observe trusted peer change!",  v9,  2u);
  }

  uint32_t v5 = notify_register_dispatch( "com.apple.security.octagon.peer-changed",  &self->_peerChangeToken,  &_dispatch_main_q,  &stru_1000FA110);
  if (v5)
  {
    int v6 = v5;
    id v7 = sub_10003A95C();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000990BC(v6, v8);
    }
  }

- (id)existingAccounts
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  0LL));
  uint32_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 fetchiTunesiCloudAccountsInfo]);

  if (v6) {
    [v4 addEntriesFromDictionary:v6];
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 iCloudAccountRecoveryKey]);
  if (v7) {
    [v4 setObject:v7 forKey:@"iCloudRecoveryKey"];
  }
  id v8 = [v4 copy];

  return v8;
}

- (BOOL)setupAccounts:(id *)a3
{
  id v6 = 0LL;
  unint64_t v7 = 2LL;
  *(void *)&__int128 v3 = 134218498LL;
  __int128 v20 = v3;
  do
  {
    id v8 = v6;
    id v21 = v6;
    BOOL v9 = -[MSDAccountManager _trySetupAccounts:](self, "_trySetupAccounts:", &v21, v20);
    id v6 = v21;

    if (v9) {
      break;
    }
    if ([v6 code] == (id)3727741185)
    {
      id v17 = sub_10003A95C();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "Account setup cancelled. Not going to retry.";
        goto LABEL_16;
      }

- (BOOL)removeAccounts:(id *)a3
{
  id v6 = 0LL;
  uint64_t v7 = 1LL;
  *(void *)&__int128 v3 = 134218498LL;
  __int128 v18 = v3;
  while (1)
  {
    id v8 = v6;
    id v20 = v6;
    unsigned int v9 = -[MSDAccountManager _signOutiCloudAccountWithPassword:outError:]( self,  "_signOutiCloudAccountWithPassword:outError:",  0LL,  &v20,  v18);
    id v6 = v20;

    if (v9) {
      break;
    }
LABEL_5:
    id v12 = sub_10003A95C();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      char v14 = (void *)objc_claimAutoreleasedReturnValue([v6 localizedFailureReason]);
      id v15 = [v6 code];
      *(_DWORD *)buf = v18;
      uint64_t v22 = v7;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      __int16 v25 = 2048;
      id v26 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to remove accounts (retryCount = %td): %{public}@(0x%tx)",  buf,  0x20u);
    }

    if (--v7 == -1)
    {
      BOOL v16 = 0;
      id v11 = v6;
      if (!a3) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }

  id v19 = v6;
  unsigned __int8 v10 = -[MSDAccountManager _signOutiTunesAccount:](self, "_signOutiTunesAccount:", &v19);
  id v11 = v19;

  if ((v10 & 1) == 0)
  {
    id v6 = v11;
    goto LABEL_5;
  }

  BOOL v16 = 1;
  if (a3) {
LABEL_9:
  }
    *a3 = v11;
LABEL_10:

  return v16;
}

- (BOOL)_trySetupAccounts:(id *)a3
{
  uint32_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  id v7 = sub_10003A95C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Start setting up accounts with Continuity support.",  buf,  2u);
  }

  [v6 updateStage:20];
  v61 = v6;
  if (([v5 allowAccountSetup] & 1) == 0)
  {
    v59 = v5;
    v60 = a3;
    id v57 = sub_10003A95C();
    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      sub_1000991C4(v58);
    }

    id v29 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727740956LL,  @"The operation is not allowed."));
    __int16 v25 = 0LL;
    uint64_t v26 = 0LL;
    uint64_t v27 = 0LL;
    id v15 = 0LL;
    goto LABEL_61;
  }

  [v5 saveiCloudAccountSyncNeeded:0];
  if (!os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    id v16 = 0LL;
    goto LABEL_17;
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](&OBJC_CLASS___MSDTestPreferences, "sharedInstance"));
  unsigned __int8 v10 = (MSDGetAccountSettingsRequest *)objc_claimAutoreleasedReturnValue([v9 mockAccountSettingsFile]);

  if (!v10)
  {
    id v16 = 0LL;
LABEL_16:

LABEL_17:
    unsigned __int8 v10 = objc_alloc_init(&OBJC_CLASS___MSDGetAccountSettingsRequest);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager existingAccounts](self, "existingAccounts"));
    -[MSDGetAccountSettingsRequest setExistingAccounts:](v10, "setExistingAccounts:", v20);

    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSDServerRequestHandler sharedInstance](&OBJC_CLASS___MSDServerRequestHandler, "sharedInstance"));
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 handleRequestSync:v10]);

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s error](v19, "error"));
    __int16 v23 = v22;
    if (v22)
    {
      if ([v22 code] == (id)3727741185)
      {
        id v24 = v23;

        id v16 = v24;
        goto LABEL_20;
      }

      uint64_t v30 = objc_claimAutoreleasedReturnValue( +[NSError errorDomainMSDWithCode:message:]( &OBJC_CLASS___NSError,  "errorDomainMSDWithCode:message:",  3727744512LL,  @"Unexpected server response."));

      id v16 = (id)v30;
    }

    if (!v16)
    {
      id v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[os_log_s accountSettings](v19, "accountSettings"));

      goto LABEL_25;
    }

- (BOOL)_setupiCloudAccountWithSettings:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    id v56 = sub_10003A95C();
    id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_1000994A0();
    }

    sub_100087610(a4, 3727744512LL, (uint64_t)@"Unexpected server response.");
    BOOL v36 = 0;
    id v17 = 0LL;
    __int16 v23 = 0LL;
    id v20 = 0LL;
    char v14 = 0LL;
    id v11 = 0LL;
    goto LABEL_20;
  }

  uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Account"]);
  if (!v9)
  {
    id v34 = sub_10003A95C();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v78 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "No iCloud account information in settings. iCloud account setup skipped.",  v78,  2u);
    }

    id v17 = 0LL;
    __int16 v23 = 0LL;
    id v20 = 0LL;
    char v14 = 0LL;
    id v11 = 0LL;
LABEL_19:
    BOOL v36 = 1;
    goto LABEL_20;
  }

  id v11 = (void *)v9;
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString, v10);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
  {
    id v58 = sub_10003A95C();
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_100099434();
    }

    sub_100087610(a4, 3727744512LL, (uint64_t)@"Unexpected server response.");
    BOOL v36 = 0;
    id v17 = 0LL;
    __int16 v23 = 0LL;
    id v20 = 0LL;
    char v14 = 0LL;
    goto LABEL_20;
  }

  char v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Password"]);
  if (!v14 || (uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v13), (objc_opt_isKindOfClass(v14, v15) & 1) == 0))
  {
    id v38 = sub_10003A95C();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_100099204(v39, v40, v41, v42, v43, v44, v45, v46);
    }

    sub_100087610(a4, 3727744512LL, (uint64_t)@"Unexpected server response.");
    BOOL v36 = 0;
    id v17 = 0LL;
    goto LABEL_27;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Features"]);
  if (!v17 || (uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary, v16), (objc_opt_isKindOfClass(v17, v18) & 1) == 0))
  {
    id v47 = sub_10003A95C();
    unsigned int v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      sub_100099274(v48, v49, v50, v51, v52, v53, v54, v55);
    }

    sub_100087610(a4, 3727744512LL, (uint64_t)@"Unexpected server response.");
    BOOL v36 = 0;
LABEL_27:
    __int16 v23 = 0LL;
    id v20 = 0LL;
    goto LABEL_20;
  }

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"RecoveryKey"]);
  if (!v20 || (uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSString, v19), (objc_opt_isKindOfClass(v20, v21) & 1) != 0))
  {
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"CDPResetNeeded"]);
    if (v23)
    {
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber, v22);
      if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
      {
        id v69 = sub_10003A95C();
        v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
          sub_100099354(v70, v71, v72, v73, v74, v75, v76, v77);
        }

        sub_100087610(a4, 3727744512LL, (uint64_t)@"Unexpected server response.");
        goto LABEL_40;
      }
    }

    if (!-[MSDAccountManager _signIniCloudAccount:password:features:recoveryKey:resetCDP:outError:]( self,  "_signIniCloudAccount:password:features:recoveryKey:resetCDP:outError:",  v11,  v14,  v17,  v20,  [v23 BOOLValue],  a4))
    {
      id v25 = sub_10003A95C();
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1000992E4(v26, v27, v28, v29, v30, v31, v32, v33);
      }

LABEL_40:
      BOOL v36 = 0;
      goto LABEL_20;
    }

    goto LABEL_19;
  }

  id v60 = sub_10003A95C();
  v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
    sub_1000993C4(v61, v62, v63, v64, v65, v66, v67, v68);
  }

  sub_100087610(a4, 3727744512LL, (uint64_t)@"Unexpected server response.");
  BOOL v36 = 0;
  __int16 v23 = 0LL;
LABEL_20:

  return v36;
}

- (BOOL)_setupiTunesAccountWithSettings:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Account"]);
    if (!v9)
    {
      id v25 = sub_10003A95C();
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v42 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "No iTunes account information in settings. iTunes account setup skipped.",  v42,  2u);
      }

      char v14 = 0LL;
      id v11 = 0LL;
LABEL_13:
      BOOL v27 = 1;
      goto LABEL_14;
    }

    id v11 = (void *)v9;
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString, v10);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      char v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Password"]);
      if (!v14 || (uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString, v13), (objc_opt_isKindOfClass(v14, v15) & 1) == 0))
      {
        id v29 = sub_10003A95C();
        uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_10009950C(v30, v31, v32, v33, v34, v35, v36, v37);
        }

        sub_100087610(a4, 3727744512LL, (uint64_t)@"Unexpected server response.");
        goto LABEL_18;
      }

      if (!-[MSDAccountManager _signIniTunesAccount:password:outError:]( self,  "_signIniTunesAccount:password:outError:",  v11,  v14,  a4))
      {
        id v16 = sub_10003A95C();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10009957C(v17, v18, v19, v20, v21, v22, v23, v24);
        }

LABEL_18:
        BOOL v27 = 0;
        goto LABEL_14;
      }

      goto LABEL_13;
    }

    id v40 = sub_10003A95C();
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_1000995EC();
    }

    sub_100087610(a4, 3727744512LL, (uint64_t)@"Unexpected server response.");
    BOOL v27 = 0;
    char v14 = 0LL;
  }

  else
  {
    id v38 = sub_10003A95C();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_100099658();
    }

    sub_100087610(a4, 3727744512LL, (uint64_t)@"Unexpected server response.");
    BOOL v27 = 0;
    char v14 = 0LL;
    id v11 = 0LL;
  }

- (BOOL)_signIniTunesAccount:(id)a3 password:(id)a4 outError:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_alloc_init(&OBJC_CLASS___MSDAccountContext);
  -[MSDAccountContext setUsername:](v10, "setUsername:", v9);

  -[MSDAccountContext setPassword:](v10, "setPassword:", v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  LOBYTE(a5) = [v11 performiTunesAccountSignInWithContext:v10 outError:a5];

  return (char)a5;
}

- (BOOL)_signOutiTunesAccount:(id *)a3
{
  uint32_t v5 = objc_alloc_init(&OBJC_CLASS___MSDAccountContext);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  LOBYTE(a3) = [v6 performiTunesAccountSignOutWithContext:v5 outError:a3];

  return (char)a3;
}

- (BOOL)_signIniCloudAccount:(id)a3 password:(id)a4 features:(id)a5 recoveryKey:(id)a6 resetCDP:(BOOL)a7 outError:(id *)a8
{
  BOOL v9 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](&OBJC_CLASS___MSDMailProcessor, "sharedInstance"));
  uint64_t v20 = objc_alloc_init(&OBJC_CLASS___MSDAccountContext);
  -[MSDAccountContext setUsername:](v20, "setUsername:", v17);

  -[MSDAccountContext setPassword:](v20, "setPassword:", v16);
  -[MSDAccountContext setRecoveryKey:](v20, "setRecoveryKey:", v14);
  -[MSDAccountContext setResetCDP:](v20, "setResetCDP:", v9);
  -[MSDAccountContext setFeatures:](v20, "setFeatures:", v15);

  -[MSDAccountContext setLocalSecret:](v20, "setLocalSecret:", @"123456");
  if (([v18 createTemporaryPasscodeIfNeeded] & 1) == 0)
  {
    sub_100087610(a8, 3727741045LL, (uint64_t)@"Failed to setup device local secret.");
    LOBYTE(v22) = 0;
LABEL_15:
    uint64_t v26 = v14;
    goto LABEL_16;
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  unsigned int v22 = [v21 performiCloudAccountSignInWithContext:v20 outError:a8];

  if (!v22 || !v9) {
    goto LABEL_15;
  }
  id v23 = sub_10003A95C();
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v35 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Received CDP reset request. Generate new recovery key for iCloud account!",  v35,  2u);
  }

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 generateiCloudAccountRecoveryKeyWithError:a8]);

  if (!v26)
  {
    LOBYTE(v22) = 0;
    goto LABEL_16;
  }

  int has_internal_content = os_variant_has_internal_content("com.apple.mobilestoredemod");
  id v28 = sub_10003A95C();
  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (has_internal_content)
  {
    if (v30)
    {
      *(_DWORD *)uint64_t v35 = 138543362;
      *(void *)&v35[4] = v26;
      uint64_t v31 = "New recovery key generated: %{public}@";
      uint64_t v32 = v29;
      uint32_t v33 = 12;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v31, v35, v33);
    }
  }

  else if (v30)
  {
    *(_DWORD *)uint64_t v35 = 141558274;
    *(void *)&v35[4] = 1752392040LL;
    *(_WORD *)&v35[12] = 2112;
    *(void *)&v35[14] = v26;
    uint64_t v31 = "New recovery key generated: %{mask.hash}@";
    uint64_t v32 = v29;
    uint32_t v33 = 22;
    goto LABEL_12;
  }

  [v18 saveiCloudAccountRecoveryKey:v26];
  [v19 sendImmediateDeviceInfoPing];
  LOBYTE(v22) = 1;
LABEL_16:
  objc_msgSend(v18, "removeTemporaryPasscodeIfNeeded", *(_OWORD *)v35, *(void *)&v35[16]);
  -[MSDAccountManager _forceiCloudKeychainToSyncWithServer](self, "_forceiCloudKeychainToSyncWithServer");

  return v22;
}

- (BOOL)_signOutiCloudAccountWithPassword:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___MSDAccountContext);
  -[MSDAccountContext setPassword:](v7, "setPassword:", v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  LOBYTE(a4) = [v8 performiCloudAccountSignOutWithContext:v7 outError:a4];

  return (char)a4;
}

- (void)_forceiCloudKeychainToSyncWithServer
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MSDAccountManager accountManagerHelper](self, "accountManagerHelper"));
  [v2 forceiCloudKeychainToSyncWithServerAndError:0];
}

- (MSDAccountManagerHelper)accountManagerHelper
{
  return self->_accountManagerHelper;
}

- (void)setAccountManagerHelper:(id)a3
{
}

- (int)peerChangeToken
{
  return self->_peerChangeToken;
}

- (void)setPeerChangeToken:(int)a3
{
  self->_peerChangeToken = a3;
}

- (void).cxx_destruct
{
}

@end