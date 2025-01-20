@interface PBDisplayAssistantService
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)isMonitoring;
- (NSString)lastSeenDisplayID;
- (PBDisplayAssistantService)init;
- (PBDisplayManager)displayManager;
- (_PBPresentedAssistantContext)shownAssistantContext;
- (double)_cableAlertInterval;
- (void)_cleanupForDismissalWithError:(id)a3;
- (void)_dismissDisplayAssistantIfNeedWithError:(id)a3;
- (void)dealloc;
- (void)dialogManager:(id)a3 willDismissDialogWithContext:(id)a4 dismissalContext:(id)a5;
- (void)displayState:(id)a3 didChangeWithConnection:(int64_t)a4;
- (void)presentDisplayAssistantWithRequest:(id)a3 dismissCompletionHandler:(id)a4;
- (void)presentUpgradeAssistantIfNeeded;
- (void)setDisplayManager:(id)a3;
- (void)setIsMonitoring:(BOOL)a3;
- (void)setLastSeenDisplayID:(id)a3;
- (void)setShownAssistantContext:(id)a3;
- (void)startDisplayAssistantMonitoring;
@end

@implementation PBDisplayAssistantService

+ (PBDependencyDescription)dependencyDescription
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10015BF1C;
  v11[3] = &unk_1003CFF78;
  v11[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v11);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBDisplayManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v12[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBDialogManager, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v12, 2LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v9);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10015BFB4;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100471108 != -1) {
    dispatch_once(&qword_100471108, block);
  }
  return (id)qword_100471100;
}

- (PBDisplayAssistantService)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBDisplayAssistantService;
  v2 = -[PBDisplayAssistantService init](&v7, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10015C078;
    v5[3] = &unk_1003D0FA8;
    uint64_t v6 = v2;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v6,  v5);
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBDisplayAssistantService;
  -[PBDisplayAssistantService dealloc](&v4, "dealloc");
}

- (double)_cableAlertInterval
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService displayManager](self, "displayManager"));
  [v3 readCableAlertIntervalOverride];
  if (v4 <= 0.0)
  {
    double v7 = 36000.0;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService displayManager](self, "displayManager"));
    [v5 readCableAlertIntervalOverride];
    double v7 = v6;
  }

  return v7;
}

- (void)startDisplayAssistantMonitoring
{
}

- (void)_dismissDisplayAssistantIfNeedWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService shownAssistantContext](self, "shownAssistantContext"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dialogueContext]);

  if (v6)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayManager currentDisplayID](self->_displayManager, "currentDisplayID"));

    if (v7)
    {
      objc_initWeak(&location, self);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10015C364;
      v9[3] = &unk_1003D0418;
      objc_copyWeak(&v11, &location);
      id v10 = v4;
      [v8 dismissDialogWithContext:v6 options:0 completion:v9];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_cleanupForDismissalWithError:(id)a3
{
  id v4 = a3;
  id v5 = sub_100082A9C();
  double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService shownAssistantContext](self, "shownAssistantContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService displayManager](self, "displayManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentDisplayID]);
    int v17 = 138543618;
    v18 = v7;
    __int16 v19 = 2114;
    v20 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "DA service: dismissing DA for old conetxt: %{public}@, going to new display: %{public}@",  (uint8_t *)&v17,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService shownAssistantContext](self, "shownAssistantContext"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 presentationRequest]);
  id v12 = [v11 kind];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
  [v13 displayAssistantDidCompleteForKind:v14 fromUserInteraction:0];

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService shownAssistantContext](self, "shownAssistantContext"));
  v16 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([v15 dismissHandler]);

  -[PBDisplayAssistantService setShownAssistantContext:](self, "setShownAssistantContext:", 0LL);
  if (v16) {
    ((void (**)(void, id))v16)[2](v16, v4);
  }
}

- (void)presentUpgradeAssistantIfNeeded
{
  if ((sub_1001C9BFC() & 1) == 0 && (sub_1001C9D6C() & 1) == 0)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService displayManager](self, "displayManager"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentDisplayID]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService displayManager](self, "displayManager"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentDisplayID]);

    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService lastSeenDisplayID](self, "lastSeenDisplayID"));
    unsigned int v8 = [v7 isEqualToString:v4];
    char v9 = v8;
    int v10 = v8 ^ 1;

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService displayManager](self, "displayManager"));
    unsigned int v12 = [v11 didCompleteDisplayAssistantForCurrentDisplay] ^ 1;

    int v13 = PBSCanAttemptUpgradeWithDisplayAssistant(self->_displayManager);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    unsigned int v15 = [v14 isSupervised] ^ 1;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService shownAssistantContext](self, "shownAssistantContext"));
    if (v16)
    {
      unsigned int v36 = v15;
      int v17 = v13;
      unsigned int v18 = v12;
      __int16 v19 = v4;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService shownAssistantContext](self, "shownAssistantContext"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 presentationRequest]);
      id v22 = [v21 kind];

      if (v22 != (id)1)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService shownAssistantContext](self, "shownAssistantContext"));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 presentationRequest]);
        LODWORD(v22) = [v24 kind] == (id)2;
      }

      id v4 = v19;
      unsigned int v12 = v18;
      int v13 = v17;
      unsigned int v15 = v36;
    }

    else
    {
      LODWORD(v22) = 1;
    }

    unsigned int v25 = -[PBDisplayAssistantService isMonitoring](self, "isMonitoring");
    if (v6) {
      unsigned int v26 = v25;
    }
    else {
      unsigned int v26 = 0;
    }
    if ((v26 & v10 & v12 & v13 & v15) == 1 && (_DWORD)v22)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService shownAssistantContext](self, "shownAssistantContext"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 dialogueContext]);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService displayManager](self, "displayManager"));
      uint64_t v30 = PBSSpgradeAttemptRequestFromSource(2LL, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

      -[PBDisplayAssistantService presentDisplayAssistantWithRequest:dismissCompletionHandler:]( self,  "presentDisplayAssistantWithRequest:dismissCompletionHandler:",  v31,  0LL);
      if (v28)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[PBDialogManager sharedInstance](&OBJC_CLASS___PBDialogManager, "sharedInstance"));
        [v32 dismissDialogWithContext:v28 options:0 completion:0];
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService displayManager](self, "displayManager"));
      [v33 resetCableInfoHistory];
    }

    else if ((v9 & 1) != 0)
    {
      id v34 = sub_100082A9C();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67110400;
        BOOL v38 = v6 != 0LL;
        __int16 v39 = 1024;
        int v40 = 0;
        __int16 v41 = 1024;
        unsigned int v42 = v12;
        __int16 v43 = 1024;
        int v44 = v13;
        __int16 v45 = 1024;
        unsigned int v46 = v15;
        __int16 v47 = 1024;
        int v48 = (int)v22;
        _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "DA will not be presented - isDisplayPluggedIn: %d, sawNewDisplayID: %d, hasNotRunForCurrentDisplay: %d, hasVal idFlowToRun: %d, isNotSupervised: %d, isUpgradeOrHDRBuddy: %d",  buf,  0x26u);
      }
    }

    else
    {
      -[PBDisplayAssistantService _dismissDisplayAssistantIfNeedWithError:]( self,  "_dismissDisplayAssistantIfNeedWithError:",  0LL);
    }
  }

- (void)presentDisplayAssistantWithRequest:(id)a3 dismissCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void (**)(void, void))v7;
  if (v6)
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService displayManager](self, "displayManager"));
    int v10 = (NSError *)objc_claimAutoreleasedReturnValue([v9 currentDisplayID]);

    if (v10) {
      -[PBDisplayAssistantService setLastSeenDisplayID:](self, "setLastSeenDisplayID:", v10);
    }
    id v11 = -[_PBPresentedAssistantContext initWithDisplayID:]( objc_alloc(&OBJC_CLASS____PBPresentedAssistantContext),  "initWithDisplayID:",  v10);
    -[_PBPresentedAssistantContext setPresentationRequest:](v11, "setPresentationRequest:", v6);
    -[PBDisplayAssistantService setShownAssistantContext:](self, "setShownAssistantContext:", v11);
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10015CAD8;
    v15[3] = &unk_1003D9928;
    objc_copyWeak(&v18, &location);
    int v17 = v8;
    id v16 = v6;
    id v12 =  +[PBSimpleRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:]( &OBJC_CLASS___PBSimpleRemoteViewController,  "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:",  @"TVDAViewController",  @"com.apple.TVDisplayAssistant",  v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    goto LABEL_7;
  }

  if (v7)
  {
    int v13 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v20 = NSLocalizedFailureReasonErrorKey;
    v21 = @"Cannot present DA with an nil request";
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    int v10 = -[NSError initWithDomain:code:userInfo:]( v13,  "initWithDomain:code:userInfo:",  PBSDisplayManagerErrorDomain,  832000LL,  v14);

    ((void (**)(void, NSError *))v8)[2](v8, v10);
LABEL_7:
  }
}

- (void)displayState:(id)a3 didChangeWithConnection:(int64_t)a4
{
  id v5 = a3;
  -[PBDisplayAssistantService presentUpgradeAssistantIfNeeded](self, "presentUpgradeAssistantIfNeeded");
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 seenDisplayIDs]);

  id v7 = [v6 count];
  if (!v7)
  {
    -[PBDisplayAssistantService setLastSeenDisplayID:](self, "setLastSeenDisplayID:", 0LL);
    -[PBDisplayAssistantService setShownAssistantContext:](self, "setShownAssistantContext:", 0LL);
  }

- (void)dialogManager:(id)a3 willDismissDialogWithContext:(id)a4 dismissalContext:(id)a5
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBDisplayAssistantService shownAssistantContext](self, "shownAssistantContext"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 dialogueContext]);
  unsigned int v9 = [v6 isEqual:v8];

  if (v9) {
    -[PBDisplayAssistantService _cleanupForDismissalWithError:](self, "_cleanupForDismissalWithError:", 0LL);
  }
}

- (PBDisplayManager)displayManager
{
  return self->_displayManager;
}

- (void)setDisplayManager:(id)a3
{
}

- (_PBPresentedAssistantContext)shownAssistantContext
{
  return self->_shownAssistantContext;
}

- (void)setShownAssistantContext:(id)a3
{
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (void)setIsMonitoring:(BOOL)a3
{
  self->_isMonitoring = a3;
}

- (NSString)lastSeenDisplayID
{
  return self->_lastSeenDisplayID;
}

- (void)setLastSeenDisplayID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end