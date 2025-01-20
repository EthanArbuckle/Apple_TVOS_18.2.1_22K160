@interface MCTVInstallProfileViewController
- (BOOL)_installComplete;
- (BOOL)_installInProgress;
- (MCProfile)originalProfile;
- (MCTVInstallProfileQuestionViewController)questionViewController;
- (MCTVInstallProfileViewController)initWithProfile:(id)a3 mode:(int)a4;
- (MCTVInstallProfileViewController)initWithProfileData:(id)a3;
- (MCTVInstallProfileViewControllerDelegate)delegate;
- (NSData)originalProfileData;
- (NSData)profileData;
- (OS_dispatch_source)waitForQuestionsTimer;
- (TVSStateMachine)stateMachine;
- (id)loadSettingGroups;
- (id)title;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_cancelInstallAfterPresentingWarnings;
- (void)_cancelPresentedViewController:(BOOL)a3;
- (void)_cancelWaitForMoreInput;
- (void)_continueInstallAfterPresentingWarnings;
- (void)_initializeStateMachine;
- (void)_installProfile;
- (void)_menuPressed;
- (void)_performReEnroll;
- (void)_presentErrorDialog:(id)a3;
- (void)_promptUserWithUserInput:(id)a3;
- (void)_respondWithPreflightResponse:(id)a3;
- (void)_sharedSetup:(id)a3 data:(id)a4;
- (void)_showRebootAlert:(id)a3;
- (void)_takeMeBack;
- (void)_waitForMoreInput;
- (void)dealloc;
- (void)profileConnection:(id)a3 didBeginInstallingNextProfile:(id)a4;
- (void)profileConnection:(id)a3 didFinishInstallationWithIdentifier:(id)a4 error:(id)a5;
- (void)profileConnection:(id)a3 didFinishPreflightWithError:(id)a4;
- (void)profileConnection:(id)a3 didRequestUserInput:(id)a4;
- (void)profileConnection:(id)a3 didShowUserWarnings:(id)a4;
- (void)profileConnection:(id)a3 didUpdateStatus:(id)a4;
- (void)questionController:(id)a3 didFinishWithResponses:(id)a4;
- (void)queueNextProfileData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOriginalProfile:(id)a3;
- (void)setOriginalProfileData:(id)a3;
- (void)setProfileData:(id)a3;
- (void)setQuestionViewController:(id)a3;
- (void)setWaitForQuestionsTimer:(id)a3;
- (void)viewDidLoad;
- (void)warningViewController:(id)a3 didAcceptWarnings:(BOOL)a4;
@end

@implementation MCTVInstallProfileViewController

- (MCTVInstallProfileViewController)initWithProfileData:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfile profileWithData:outError:](&OBJC_CLASS___MCProfile, "profileWithData:outError:", v4, 0LL));
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MCTVInstallProfileViewController;
  v6 = -[MCTVProfileViewController initWithProfile:mode:](&v9, "initWithProfile:mode:", v5, 1LL);
  v7 = v6;
  if (v6) {
    -[MCTVInstallProfileViewController _sharedSetup:data:](v6, "_sharedSetup:data:", v5, v4);
  }

  return v7;
}

- (MCTVInstallProfileViewController)initWithProfile:(id)a3 mode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MCTVInstallProfileViewController;
  v7 = -[MCTVProfileViewController initWithProfile:mode:](&v10, "initWithProfile:mode:", v6, v4);
  v8 = v7;
  if (v7) {
    -[MCTVInstallProfileViewController _sharedSetup:data:](v7, "_sharedSetup:data:", v6, 0LL);
  }

  return v8;
}

- (void)_sharedSetup:(id)a3 data:(id)a4
{
  id v6 = (MCProfile *)a3;
  v7 = (NSData *)a4;
  v8 = (NSData *)-[NSData copy](v7, "copy");
  profileData = self->_profileData;
  self->_profileData = v8;

  originalProfile = self->_originalProfile;
  self->_originalProfile = v6;
  v11 = v6;

  originalProfileData = self->_originalProfileData;
  self->_originalProfileData = v7;
  v13 = v7;

  -[MCTVInstallProfileViewController _initializeStateMachine](self, "_initializeStateMachine");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v14 setInteractionDelegate:self];

  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v15 addObserver:self selector:"_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCTVInstallProfileViewController;
  -[MCTVProfileViewController dealloc](&v4, "dealloc");
}

- (id)title
{
  return MCUILocalizedString(@"BLOB_INSTALL_TITLE");
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MCTVInstallProfileViewController;
  -[MCTVProfileViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_menuPressed");
  -[UITapGestureRecognizer setAllowedPressTypes:](v3, "setAllowedPressTypes:", &off_2AAA8);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController view](self, "view"));
  [v4 addGestureRecognizer:v3];
}

- (id)loadSettingGroups
{
  id v3 = MCUILocalizedString(@"INSTALL");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v4,  0LL,  0LL,  0LL,  self,  "_installProfile"));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_79B0;
  v13[3] = &unk_28810;
  objc_copyWeak(&v14, &location);
  [v5 setUpdateBlock:v13];
  v16 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v6));

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MCTVInstallProfileViewController;
  id v8 = -[MCTVProfileViewController loadSettingGroups](&v12, "loadSettingGroups");
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 arrayByAddingObject:v7]);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v10;
}

- (void)queueNextProfileData:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController stateMachine](self, "stateMachine"));
  v7 = @"ProfileData";
  id v8 = v4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

  [v5 postEvent:@"Start Install" withContext:0 userInfo:v6];
}

- (void)_showRebootAlert:(id)a3
{
  id v4 = a3;
  id v5 = MCUILocalizedString(@"REBOOT_SUGGESTED_TITLE");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = MCUILocalizedStringByDevice(@"REBOOT_SUGGESTED_TEXT");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v8,  1LL));
  id v10 = MCUILocalizedString(@"REBOOT");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_7D28;
  v24[3] = &unk_28858;
  id v12 = v4;
  id v25 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  0LL,  v24));
  [v9 addAction:v13];

  id v14 = MCUILocalizedString(@"NOTNOW");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  v21 = sub_7D8C;
  v22 = &unk_28858;
  id v23 = v12;
  id v16 = v12;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  1LL,  &v19));
  objc_msgSend(v9, "addAction:", v17, v19, v20, v21, v22);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController navigationController](self, "navigationController"));
  [v18 presentViewController:v9 animated:1 completion:0];
}

- (void)_installProfile
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController stateMachine](self, "stateMachine"));
  [v2 postEvent:@"Start Install"];
}

- (void)_takeMeBack
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 popProfileDataFromHeadOfInstallationQueue]);

  if (v5)
  {
    -[MCTVInstallProfileViewController queueNextProfileData:](self, "queueNextProfileData:", v5);
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController delegate](self, "delegate"));
    objc_msgSend( v4,  "installViewController:didFinishWithResult:",  self,  -[MCTVInstallProfileViewController _installComplete](self, "_installComplete"));
  }
}

- (void)_performReEnroll
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController stateMachine](self, "stateMachine"));
  [v2 postEvent:@"ReEnroll"];
}

- (void)_menuPressed
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController stateMachine](self, "stateMachine"));
  [v2 postEvent:@"Cancelled"];
}

- (void)profileConnection:(id)a3 didShowUserWarnings:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_7F48;
  v6[3] = &unk_28880;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  dispatch_async(&_dispatch_main_q, v6);
}

- (void)profileConnection:(id)a3 didRequestUserInput:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_8094;
  v6[3] = &unk_28880;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  dispatch_async(&_dispatch_main_q, v6);
}

- (void)profileConnection:(id)a3 didFinishPreflightWithError:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_81E0;
  v6[3] = &unk_28880;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  dispatch_async(&_dispatch_main_q, v6);
}

- (void)profileConnection:(id)a3 didFinishInstallationWithIdentifier:(id)a4 error:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_832C;
  v7[3] = &unk_28880;
  id v8 = a5;
  objc_super v9 = self;
  id v6 = v8;
  dispatch_async(&_dispatch_main_q, v7);
}

- (void)profileConnection:(id)a3 didUpdateStatus:(id)a4
{
}

- (void)profileConnection:(id)a3 didBeginInstallingNextProfile:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_8490;
  v6[3] = &unk_28880;
  id v7 = a4;
  id v8 = self;
  id v5 = v7;
  dispatch_async(&_dispatch_main_q, v6);
}

- (void)warningViewController:(id)a3 didAcceptWarnings:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController stateMachine](self, "stateMachine", a3));
  id v7 = v5;
  if (v4) {
    id v6 = @"Show Message Complete";
  }
  else {
    id v6 = @"Cancelled";
  }
  [v5 postEvent:v6];
}

- (void)questionController:(id)a3 didFinishWithResponses:(id)a4
{
  id v5 = a4;
  if ([v5 count])
  {
    objc_super v9 = @"UserInput";
    id v10 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController stateMachine](self, "stateMachine"));
    [v7 postEvent:@"Input Received" withContext:0 userInfo:v6];
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController stateMachine](self, "stateMachine"));
    [v8 postEvent:@"Cancelled"];
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  if (-[MCTVInstallProfileViewController _installInProgress](self, "_installInProgress", a3))
  {
    -[MCTVInstallProfileViewController _cancelPresentedViewController:](self, "_cancelPresentedViewController:", 0LL);
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController stateMachine](self, "stateMachine"));
    [v4 postEvent:@"Cancelled"];
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_871C;
  block[3] = &unk_288C8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_initializeStateMachine
{
  id v2 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  id v3 = (objc_class *)objc_opt_class(self);
  BOOL v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_8FB4;
  v46[3] = &unk_288F0;
  objc_copyWeak(&v47, &location);
  id v6 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v2,  "initWithName:initialState:mode:stateChangeHandler:",  v5,  @"Idle",  0LL,  v46);

  id v7 = MCTVLoggingFacility();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[TVSStateMachine setLogObject:](v6, "setLogObject:", v8);

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_8FE4;
  v44[3] = &unk_28918;
  objc_copyWeak(&v45, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v6,  "registerHandlerForEvent:onState:withBlock:",  @"Start Install",  @"Idle",  v44);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_905C;
  v42[3] = &unk_28918;
  objc_copyWeak(&v43, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v6,  "registerHandlerForEvent:onState:withBlock:",  @"Start Install",  @"Install Complete",  v42);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_911C;
  v40[3] = &unk_28918;
  objc_copyWeak(&v41, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v6,  "registerHandlerForEvent:onState:withBlock:",  @"ReEnroll",  @"Idle",  v40);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_91A4;
  v38[3] = &unk_28918;
  objc_copyWeak(&v39, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v6,  "registerHandlerForEvent:onState:withBlock:",  @"Show Warnings",  @"Started Install",  v38);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_9280;
  v36[3] = &unk_28918;
  objc_copyWeak(&v37, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v6,  "registerHandlerForEvent:onState:withBlock:",  @"Show Message Complete",  @"Showing Other Warnings",  v36);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_92BC;
  v34[3] = &unk_28918;
  objc_copyWeak(&v35, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v6,  "registerHandlerForEvent:onState:withBlock:",  @"Cancelled",  @"Showing Other Warnings",  v34);
  v54[0] = @"Waiting For Questions";
  v54[1] = @"Showing Questions";
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 2LL));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_92F8;
  v32[3] = &unk_28918;
  objc_copyWeak(&v33, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v6,  "registerHandlerForEvent:onStates:withBlock:",  @"Request Input",  v9,  v32);

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_936C;
  v30[3] = &unk_28918;
  objc_copyWeak(&v31, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v6,  "registerHandlerForEvent:onState:withBlock:",  @"Input Received",  @"Showing Questions",  v30);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_93F0;
  v28[3] = &unk_28918;
  objc_copyWeak(&v29, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v6,  "registerHandlerForEvent:onState:withBlock:",  @"Timeout Expired",  @"Showing Questions",  v28);
  v53 = @"Showing Questions";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v53, 1LL));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_9454;
  v26[3] = &unk_28918;
  objc_copyWeak(&v27, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v6,  "registerHandlerForEvent:onStates:withBlock:",  @"Preflight Complete",  v10,  v26);

  v52[0] = @"Waiting For Questions";
  v52[1] = @"Showing Questions";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 2LL));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_94C8;
  v24[3] = &unk_28918;
  objc_copyWeak(&v25, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v6,  "registerHandlerForEvent:onStates:withBlock:",  @"Cancelled",  v11,  v24);

  v51[0] = @"Waiting For Questions";
  v51[1] = @"Showing Questions";
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v51, 2LL));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_9520;
  v22[3] = &unk_28918;
  objc_copyWeak(&v23, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v6,  "registerHandlerForEvent:onStates:withBlock:",  @"Secondary Profile Received",  v12,  v22);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_959C;
  v20[3] = &unk_28918;
  objc_copyWeak(&v21, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v6,  "registerHandlerForEvent:onState:withBlock:",  @"Install Complete",  @"Started Install",  v20);
  v50[0] = @"Waiting For Questions";
  v50[1] = @"Showing Questions";
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v50, 2LL));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_9610;
  v18[3] = &unk_28918;
  objc_copyWeak(&v19, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v6,  "registerHandlerForEvent:onStates:withBlock:",  @"Install Complete",  v13,  v18);

  v49[0] = @"Idle";
  v49[1] = @"Install Complete";
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 2LL));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_9754;
  v16[3] = &unk_28918;
  objc_copyWeak(&v17, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v6,  "registerHandlerForEvent:onStates:withBlock:",  @"Cancelled",  v14,  v16);

  objc_storeStrong((id *)&self->_stateMachine, v6);
  -[TVSStateMachine setShouldAcceptEvents:](v6, "setShouldAcceptEvents:", 1LL);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
}

- (void)_continueInstallAfterPresentingWarnings
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v2 respondToWarningsContinueInstallation:1];
}

- (void)_cancelInstallAfterPresentingWarnings
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v2 respondToWarningsContinueInstallation:0];
}

- (void)_promptUserWithUserInput:(id)a3
{
  id v4 = a3;
  -[MCTVInstallProfileViewController _cancelWaitForMoreInput](self, "_cancelWaitForMoreInput");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController questionViewController](self, "questionViewController"));

  if (v5)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController questionViewController](self, "questionViewController"));
    [v8 updateWithUserInput:v4];
  }

  else
  {
    id v6 = -[MCTVInstallProfileQuestionViewController initWithUserInput:]( objc_alloc(&OBJC_CLASS___MCTVInstallProfileQuestionViewController),  "initWithUserInput:",  v4);

    questionViewController = self->_questionViewController;
    self->_questionViewController = v6;

    -[MCTVInstallProfileQuestionViewController setDelegate:](self->_questionViewController, "setDelegate:", self);
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController navigationController](self, "navigationController"));
    [v8 pushViewController:self->_questionViewController animated:1];
  }
}

- (void)_waitForMoreInput
{
  id v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
  waitForQuestionsTimer = self->_waitForQuestionsTimer;
  self->_waitForQuestionsTimer = v3;

  id v5 = self->_waitForQuestionsTimer;
  dispatch_time_t v6 = dispatch_time(0LL, 1000000000LL);
  dispatch_source_set_timer((dispatch_source_t)v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  objc_initWeak(&location, self);
  id v7 = self->_waitForQuestionsTimer;
  objc_super v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  v11 = sub_9A00;
  id v12 = &unk_28610;
  objc_copyWeak(&v13, &location);
  dispatch_source_set_event_handler((dispatch_source_t)v7, &v9);
  dispatch_resume((dispatch_object_t)self->_waitForQuestionsTimer);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MCTVInstallProfileViewController questionViewController]( self,  "questionViewController",  v9,  v10,  v11,  v12));
  [v8 waitForMoreInput];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_cancelWaitForMoreInput
{
  waitForQuestionsTimer = self->_waitForQuestionsTimer;
  if (waitForQuestionsTimer)
  {
    dispatch_source_cancel((dispatch_source_t)waitForQuestionsTimer);
    id v4 = self->_waitForQuestionsTimer;
    self->_waitForQuestionsTimer = 0LL;
  }

- (void)_respondWithPreflightResponse:(id)a3
{
}

- (void)_presentErrorDialog:(id)a3
{
  id v4 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v4 localizedDescription]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 localizedRecoverySuggestion]);

  dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v11,  v5,  1LL));
  id v7 = MCUILocalizedString(@"OK");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v8,  1LL,  0LL));
  [v6 addAction:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController navigationController](self, "navigationController"));
  [v10 presentViewController:v6 animated:1 completion:0];
}

- (BOOL)_installComplete
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController stateMachine](self, "stateMachine"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentState]);
  unsigned __int8 v4 = [v3 isEqualToString:@"Install Complete"];

  return v4;
}

- (BOOL)_installInProgress
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController stateMachine](self, "stateMachine"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentState]);

  else {
    unsigned int v4 = [v3 isEqualToString:@"Idle"] ^ 1;
  }

  return v4;
}

- (void)_cancelPresentedViewController:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MCTVInstallProfileViewController presentedViewController](self, "presentedViewController"));
  [v4 dismissViewControllerAnimated:v3 completion:0];
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
}

- (MCTVInstallProfileViewControllerDelegate)delegate
{
  return (MCTVInstallProfileViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSData)originalProfileData
{
  return self->_originalProfileData;
}

- (void)setOriginalProfileData:(id)a3
{
}

- (MCProfile)originalProfile
{
  return self->_originalProfile;
}

- (void)setOriginalProfile:(id)a3
{
}

- (MCTVInstallProfileQuestionViewController)questionViewController
{
  return self->_questionViewController;
}

- (void)setQuestionViewController:(id)a3
{
}

- (OS_dispatch_source)waitForQuestionsTimer
{
  return self->_waitForQuestionsTimer;
}

- (void)setWaitForQuestionsTimer:(id)a3
{
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void).cxx_destruct
{
}

@end