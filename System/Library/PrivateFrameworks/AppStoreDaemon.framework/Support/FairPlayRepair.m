@interface FairPlayRepair
+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5;
- (ApplicationRepairDelegate)delegate;
- (BOOL)repairApplication:(id)a3 error:(id *)a4;
- (FairPlayRepair)init;
- (NSArray)repairedBundleIDs;
- (NSString)repairType;
- (_TtC9appstored6LogKey)logKey;
- (int)fairPlayStatus;
- (void)setDelegate:(id)a3;
- (void)setLogKey:(id)a3;
@end

@implementation FairPlayRepair

- (FairPlayRepair)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FairPlayRepair;
  v2 = -[FairPlayRepair init](&v9, "init");
  if (v2)
  {
    id v3 = sub_100255630((uint64_t)&OBJC_CLASS___URLBag);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
    bag = v2->_bag;
    v2->_bag = (URLBag *)v4;

    v6 = objc_alloc_init(&OBJC_CLASS___UnfairLock);
    lock = v2->_lock;
    v2->_lock = v6;
  }

  return v2;
}

- (ApplicationRepairDelegate)delegate
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  objc_super v9 = sub_10019254C;
  v10 = sub_10019255C;
  id v11 = 0LL;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100192564;
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
  v7[2] = sub_100192618;
  v7[3] = &unk_1003E9DC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_1002C11C4(lock, v7);
}

- (int)fairPlayStatus
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001926CC;
  v5[3] = &unk_1003E9BE0;
  v5[4] = self;
  v5[5] = &v6;
  sub_1002C11C4(lock, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (_TtC9appstored6LogKey)logKey
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  int v9 = sub_10019254C;
  v10 = sub_10019255C;
  id v11 = 0LL;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001927AC;
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
  v7[2] = sub_100192860;
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
  int v9 = sub_10019254C;
  v10 = sub_10019255C;
  id v11 = 0LL;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100192968;
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
  return (NSString *)@"Keybag";
}

+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v7 isArcade] & 1) == 0
    && (([v7 isStoreOriginated] & 1) != 0 || objc_msgSend(v7, "isBeta")))
  {
    if (os_variant_has_internal_content("com.apple.appstored")
      && [v8 fairplayStatus])
    {
      unsigned int v10 = [v8 fairplayStatus];
    }

    else
    {
      id v12 = objc_claimAutoreleasedReturnValue([v7 canonicalExecutablePath]);
      id v13 = [v12 fileSystemRepresentation];

      if (!v13) {
        goto LABEL_14;
      }
      unsigned int v10 = sub_100192BC4((uint64_t)&OBJC_CLASS___FairPlayRepair, v7, v8);
    }

    unsigned int v14 = v10;
    if (v10)
    {
      uint64_t v15 = ASDLogHandleForCategory(28LL);
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138543618;
        id v20 = v9;
        __int16 v21 = 1024;
        unsigned int v22 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[FP/%{public}@] Will start fairplay recovery with fairplayStatus: %d",  (uint8_t *)&v19,  0x12u);
      }

      BOOL v11 = 1;
LABEL_17:

      goto LABEL_18;
    }

- (BOOL)repairApplication:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!self)
  {
    uint64_t v20 = ASDErrorWithUserInfoAndFormat(502LL, 0LL, @"Not supported in current system integrity state");
    id v15 = (id)objc_claimAutoreleasedReturnValue(v20);
    goto LABEL_23;
  }

  id v7 = sub_1001D17B8((uint64_t)&OBJC_CLASS___NetworkMonitor);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  unsigned int v9 = [v8 isConnected];

  if (v9)
  {
    unsigned int v10 = sub_1001B64DC((id *)objc_alloc(&OBJC_CLASS___RefetchKeybag), self->_application);
    unsigned __int8 v11 = -[ASDRepairOptions isBackground](self->_options, "isBackground");
    if (v10) {
      *((_BYTE *)v10 + 24) = v11 ^ 1;
    }
    id v12 = sub_1001B6534(v10);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v69 = 0LL;
    unsigned int v14 = [v13 resultWithError:&v69];
    id v15 = v69;

    LODWORD(v13) = sub_100192BC4( (uint64_t)&OBJC_CLASS___FairPlayRepair,  self->_application,  self->_options);
    lock = self->_lock;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = sub_1001933E0;
    v67[3] = &unk_1003E9F68;
    v67[4] = self;
    int v68 = (int)v13;
    sub_1002C11C4(lock, v67);
    if (((_DWORD)v13 + 42597) <= 1)
    {
      if ((-[ASDRepairOptions isBackground](self->_options, "isBackground") & 1) != 0)
      {
        uint64_t v17 = ASDLogHandleForCategory(28LL);
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          logKey = self->_logKey;
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = logKey;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[FP/%{public}@] Not showing family leave dialog for background repair",  buf,  0xCu);
        }
      }

      else
      {
        unsigned int v66 = v14;
        id v64 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  -[ApplicationProxy storeItemID](self->_application, "storeItemID")));
        uint64_t v34 = ASDErrorWithDescription(ASDErrorDomain, 541LL, @"Need to present dialog request");
        uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[FairPlayRepair delegate](self, "delegate"));
        v65 = (void *)v35;
        [v36 repair:self needsToReleaseBlockingCallerWithReason:v35];

        v37 = objc_alloc(&OBJC_CLASS___AMSDialogRequest);
        uint64_t v38 = ASDLocalizedString(@"REPAIR_FAIRPLAY_FAMILY_LEAVE_ALERT_TITLE");
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        uint64_t v40 = ASDLocalizedString(@"REPAIR_FAIRPLAY_FAMILY_LEAVE_ALERT_MESSAGE");
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v42 = -[AMSDialogRequest initWithTitle:message:](v37, "initWithTitle:message:", v39, v41);

        uint64_t v43 = ASDLocalizedString(@"CANCEL");
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogAction actionWithTitle:style:]( &OBJC_CLASS___AMSDialogAction,  "actionWithTitle:style:",  v44,  2LL));

        v75 = v45;
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v75, 1LL));
        -[AMSDialogRequest setButtonActions:](v42, "setButtonActions:", v46);

        sub_100321874(v42, @"fairPlayRepairFamilyLeave");
        sub_1001D7974(v45, @"cancel");
        if (sub_10027362C((uint64_t)&OBJC_CLASS___Restrictions))
        {
          uint64_t v47 = ASDLocalizedString(@"REPAIR_FAIRPLAY_FAMILY_LEAVE_APP_STORE");
          v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[AMSDialogAction actionWithTitle:](&OBJC_CLASS___AMSDialogAction, "actionWithTitle:", v48));

          -[AMSDialogRequest addButtonAction:](v42, "addButtonAction:", v49);
        }

        else
        {
          v49 = 0LL;
        }

        v50 = objc_alloc_init(&OBJC_CLASS___InteractiveRequestPresenter);
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&buf[16] = sub_1001933F0;
        *(void *)&buf[24] = &unk_1003E9F90;
        v72 = self;
        id v73 = v49;
        v18 = (os_log_s *)v64;
        v74 = v18;
        id v51 = v49;
        -[InteractiveRequestPresenter presentDialogRequest:resultHandler:]( v50,  "presentDialogRequest:resultHandler:",  v42,  buf);

        unsigned int v14 = v66;
      }
    }

    if (v14)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self->_application, "bundleID"));

      if (v52)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationProxy bundleID](self->_application, "bundleID"));
        v70 = v53;
        BOOL v33 = 1;
        id v54 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v70,  1LL));
        v55 = self->_lock;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&buf[16] = sub_1001929A0;
        *(void *)&buf[24] = &unk_1003E9DC0;
        v72 = self;
        id v56 = v54;
        id v73 = v56;
        sub_1002C11C4(v55, buf);
      }

      else
      {
        BOOL v33 = 1;
      }

      goto LABEL_24;
    }

- (void).cxx_destruct
{
}

@end