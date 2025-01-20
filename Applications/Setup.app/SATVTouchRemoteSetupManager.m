@interface SATVTouchRemoteSetupManager
+ (SATVTouchRemoteSetupManager)sharedInstance;
- (BOOL)tapToSetupManager:(id)a3 shouldConnectToNetworkWithName:(id)a4;
- (BOOL)tapToSetupManager:(id)a3 shouldPresentPasswordSettingPromptForAccount:(id)a4;
- (SATVNetworkReachability)networkReachability;
- (SATVTapToSetupManager)tapToSetupManager;
- (SATVTapToSetupManagerDelegate)userInterfaceDelegate;
- (SATVTouchRemoteSetupManager)init;
- (TVSStateMachine)stateMachine;
- (id)activatorHookCompletion;
- (id)presentingControllerForTTSUManager:(id)a3;
- (unint64_t)retryCount;
- (void)_activate;
- (void)_cancelScheduledRetry;
- (void)_checkTarget:(id)a3 forSelector:(SEL)a4 performBlockOnMainThread:(id)a5;
- (void)_commitSetupModeToPineBoardUserDefaults;
- (void)_completeSilentActivationWithSuccessType:(unint64_t)a3 failureReason:(int64_t)a4 error:(id)a5;
- (void)_configureStateMachine;
- (void)_handleSilentActivationFailureWithReason:(int64_t)a3 error:(id)a4;
- (void)_handleSilentActivationSuccessWithSuccessType:(unint64_t)a3;
- (void)_notifyDelegateDidFailToStartSetupWithError:(id)a3;
- (void)_removeEntryFromPineBoardUserDefaults;
- (void)_retry;
- (void)_scheduleRetry;
- (void)_start;
- (void)_stop;
- (void)setActivatorHookCompletion:(id)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setTapToSetupManager:(id)a3;
- (void)setUserInterfaceDelegate:(id)a3;
- (void)start;
- (void)stop;
- (void)tapToSetupManager:(id)a3 didBeginConfigurationPhase:(int64_t)a4 withMetadata:(id)a5;
- (void)tapToSetupManager:(id)a3 didBeginSetupWithDeviceName:(id)a4 isNewFlow:(BOOL)a5;
- (void)tapToSetupManager:(id)a3 didFailSetupWithError:(id)a4;
- (void)tapToSetupManager:(id)a3 didFailToStartSetupWithError:(id)a4;
- (void)tapToSetupManager:(id)a3 didFinishAuthenticationForAccount:(unint64_t)a4 withResult:(BOOL)a5 error:(id)a6;
- (void)tapToSetupManager:(id)a3 didReceivePreAuthInfo:(id)a4;
- (void)tapToSetupManager:(id)a3 didReceiveSetupInfo:(id)a4;
- (void)tapToSetupManager:(id)a3 networkConnectionStateDidChange:(int64_t)a4;
- (void)tapToSetupManager:(id)a3 presentErrorAlert:(id)a4;
- (void)tapToSetupManager:(id)a3 readyToActivateWithCompletionHandler:(id)a4;
- (void)tapToSetupManager:(id)a3 willAttemptAuthenticationForAccount:(unint64_t)a4;
- (void)tapToSetupManagerDidFinishSetup:(id)a3 deviceInfo:(id)a4;
- (void)tapToSetupManagerDidPromptToBeginSetup:(id)a3;
@end

@implementation SATVTouchRemoteSetupManager

+ (SATVTouchRemoteSetupManager)sharedInstance
{
  if (qword_100109940 != -1) {
    dispatch_once(&qword_100109940, &stru_1000CA398);
  }
  return (SATVTouchRemoteSetupManager *)(id)qword_100109938;
}

- (SATVTouchRemoteSetupManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SATVTouchRemoteSetupManager;
  v2 = -[SATVTouchRemoteSetupManager init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SATVNetworkReachability);
    networkReachability = v2->_networkReachability;
    v2->_networkReachability = v3;

    v5 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
    v6 = (objc_class *)objc_opt_class(v2);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = -[TVSStateMachine initWithName:initialState:mode:]( v5,  "initWithName:initialState:mode:",  v8,  @"Stopped",  0LL);
    stateMachine = v2->_stateMachine;
    v2->_stateMachine = v9;

    -[SATVTouchRemoteSetupManager _configureStateMachine](v2, "_configureStateMachine");
  }

  return v2;
}

- (void)setUserInterfaceDelegate:(id)a3
{
  p_userInterfaceDelegate = &self->_userInterfaceDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_userInterfaceDelegate, v5);
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xFFFE | objc_opt_respondsToSelector(v5, "tapToSetupManager:shouldPresentPasswordSettingPromptForAccount:") & 1;
  if ((objc_opt_respondsToSelector(v5, "presentingControllerForTTSUManager:") & 1) != 0) {
    __int16 v6 = 2;
  }
  else {
    __int16 v6 = 0;
  }
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xFFFD | v6;
  if ((objc_opt_respondsToSelector(v5, "tapToSetupManagerDidPromptToBeginSetup:") & 1) != 0) {
    __int16 v7 = 4;
  }
  else {
    __int16 v7 = 0;
  }
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xFFFB | v7;
  if ((objc_opt_respondsToSelector(v5, "tapToSetupManager:didBeginSetupWithDeviceName:isNewFlow:") & 1) != 0) {
    __int16 v8 = 8;
  }
  else {
    __int16 v8 = 0;
  }
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xFFF7 | v8;
  if ((objc_opt_respondsToSelector(v5, "tapToSetupManager:didBeginConfigurationPhase:withMetadata:") & 1) != 0) {
    __int16 v9 = 16;
  }
  else {
    __int16 v9 = 0;
  }
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xFFEF | v9;
  if ((objc_opt_respondsToSelector(v5, "tapToSetupManager:shouldConnectToNetworkWithName:") & 1) != 0) {
    __int16 v10 = 32;
  }
  else {
    __int16 v10 = 0;
  }
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xFFDF | v10;
  if ((objc_opt_respondsToSelector(v5, "tapToSetupManager:networkConnectionStateDidChange:") & 1) != 0) {
    __int16 v11 = 64;
  }
  else {
    __int16 v11 = 0;
  }
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xFFBF | v11;
  if ((objc_opt_respondsToSelector(v5, "tapToSetupManager:willAttemptAuthenticationForAccount:") & 1) != 0) {
    __int16 v12 = 128;
  }
  else {
    __int16 v12 = 0;
  }
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xFF7F | v12;
  if ((objc_opt_respondsToSelector(v5, "tapToSetupManager:didFinishAuthenticationForAccount:withResult:error:") & 1) != 0) {
    __int16 v13 = 256;
  }
  else {
    __int16 v13 = 0;
  }
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xFEFF | v13;
  if ((objc_opt_respondsToSelector(v5, "tapToSetupManager:didReceiveSetupInfo:") & 1) != 0) {
    __int16 v14 = 512;
  }
  else {
    __int16 v14 = 0;
  }
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xFDFF | v14;
  if ((objc_opt_respondsToSelector(v5, "tapToSetupManagerDidFinishSetup:deviceInfo:") & 1) != 0) {
    __int16 v15 = 1024;
  }
  else {
    __int16 v15 = 0;
  }
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xFBFF | v15;
  if ((objc_opt_respondsToSelector(v5, "tapToSetupManager:didFailSetupWithError:") & 1) != 0) {
    __int16 v16 = 2048;
  }
  else {
    __int16 v16 = 0;
  }
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xF7FF | v16;
  if ((objc_opt_respondsToSelector(v5, "tapToSetupManager:didFailToStartSetupWithError:") & 1) != 0) {
    __int16 v17 = 4096;
  }
  else {
    __int16 v17 = 0;
  }
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xEFFF | v17;
  if ((objc_opt_respondsToSelector(v5, "tapToSetupManager:presentErrorAlert:") & 1) != 0) {
    __int16 v18 = 0x2000;
  }
  else {
    __int16 v18 = 0;
  }
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xDFFF | v18;
  char v19 = objc_opt_respondsToSelector(v5, "tapToSetupManager:didReceivePreAuthInfo:");

  if ((v19 & 1) != 0) {
    __int16 v20 = 0x4000;
  }
  else {
    __int16 v20 = 0;
  }
  *(_WORD *)&self->_userInterfaceDelegateFlags = *(_WORD *)&self->_userInterfaceDelegateFlags & 0xBFFF | v20;
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager stateMachine](self, "stateMachine"));
  [v3 postEvent:@"Start"];

  -[SATVTouchRemoteSetupManager _removeEntryFromPineBoardUserDefaults](self, "_removeEntryFromPineBoardUserDefaults");
}

- (void)stop
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager stateMachine](self, "stateMachine"));
  [v2 postEvent:@"Stop"];
}

- (void)_configureStateMachine
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager stateMachine](self, "stateMachine"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100040868;
  v18[3] = &unk_1000CA3C0;
  objc_copyWeak(&v19, &location);
  [v3 registerHandlerForEvent:@"Start" onState:@"Stopped" withBlock:v18];
  v21[0] = @"Starting";
  v21[1] = @"Started";
  v21[2] = @"WaitingToRetry";
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 3LL));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10004089C;
  v16[3] = &unk_1000CA3C0;
  objc_copyWeak(&v17, &location);
  [v3 registerHandlerForEvent:@"Stop" onStates:v4 withBlock:v16];

  [v3 registerHandlerForEvent:@"DidPromptToBeginSetup" onState:@"Starting" withBlock:&stru_1000CA400];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100040928;
  v14[3] = &unk_1000CA3C0;
  objc_copyWeak(&v15, &location);
  [v3 registerHandlerForEvent:@"DidFailToStartSetup" onState:@"Starting" withBlock:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100040AF8;
  v12[3] = &unk_1000CA3C0;
  objc_copyWeak(&v13, &location);
  [v3 registerDefaultHandlerForEvent:@"DidFailToStartSetup" withBlock:v12];
  __int16 v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  __int16 v9 = sub_100040C20;
  __int16 v10 = &unk_1000CA3C0;
  objc_copyWeak(&v11, &location);
  [v3 registerHandlerForEvent:@"Retry" onState:@"WaitingToRetry" withBlock:&v7];
  id v5 = sub_10002B074();
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setLogObject:", v6, v7, v8, v9, v10);

  [v3 setShouldAcceptEvents:1];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

- (BOOL)tapToSetupManager:(id)a3 shouldPresentPasswordSettingPromptForAccount:(id)a4
{
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 1) == 0) {
    return 1;
  }
  id v7 = a4;
  id v8 = a3;
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
  unsigned __int8 v10 = [v9 tapToSetupManager:v8 shouldPresentPasswordSettingPromptForAccount:v7];

  return v10;
}

- (id)presentingControllerForTTSUManager:(id)a3
{
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 2) != 0)
  {
    id v5 = a3;
    __int16 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue([v6 presentingControllerForTTSUManager:v5]);
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (void)tapToSetupManagerDidPromptToBeginSetup:(id)a3
{
  id v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager stateMachine](self, "stateMachine"));
  [v4 postEvent:@"DidPromptToBeginSetup"];

  -[SATVTouchRemoteSetupManager _commitSetupModeToPineBoardUserDefaults]( self,  "_commitSetupModeToPineBoardUserDefaults");
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 4) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
    [v5 tapToSetupManagerDidPromptToBeginSetup:v6];
  }
}

- (void)tapToSetupManager:(id)a3 didBeginSetupWithDeviceName:(id)a4 isNewFlow:(BOOL)a5
{
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 8) != 0)
  {
    BOOL v5 = a5;
    id v8 = a4;
    id v9 = a3;
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
    [v10 tapToSetupManager:v9 didBeginSetupWithDeviceName:v8 isNewFlow:v5];
  }

- (void)tapToSetupManager:(id)a3 didBeginConfigurationPhase:(int64_t)a4 withMetadata:(id)a5
{
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 0x10) != 0)
  {
    id v8 = a5;
    id v9 = a3;
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
    [v10 tapToSetupManager:v9 didBeginConfigurationPhase:a4 withMetadata:v8];
  }

- (BOOL)tapToSetupManager:(id)a3 shouldConnectToNetworkWithName:(id)a4
{
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 0x20) == 0) {
    return 0;
  }
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
  unsigned __int8 v10 = [v9 tapToSetupManager:v8 shouldConnectToNetworkWithName:v7];

  return v10;
}

- (void)tapToSetupManager:(id)a3 networkConnectionStateDidChange:(int64_t)a4
{
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 0x40) != 0)
  {
    id v6 = a3;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
    [v7 tapToSetupManager:v6 networkConnectionStateDidChange:a4];
  }

- (void)tapToSetupManager:(id)a3 willAttemptAuthenticationForAccount:(unint64_t)a4
{
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 0x80) != 0)
  {
    id v6 = a3;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
    [v7 tapToSetupManager:v6 willAttemptAuthenticationForAccount:a4];
  }

- (void)tapToSetupManager:(id)a3 didFinishAuthenticationForAccount:(unint64_t)a4 withResult:(BOOL)a5 error:(id)a6
{
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 0x100) != 0)
  {
    BOOL v6 = a5;
    id v10 = a6;
    id v11 = a3;
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
    [v12 tapToSetupManager:v11 didFinishAuthenticationForAccount:a4 withResult:v6 error:v10];
  }

- (void)tapToSetupManager:(id)a3 didReceiveSetupInfo:(id)a4
{
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 0x200) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
    [v8 tapToSetupManager:v7 didReceiveSetupInfo:v6];
  }

- (void)tapToSetupManagerDidFinishSetup:(id)a3 deviceInfo:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  -[SATVTouchRemoteSetupManager _removeEntryFromPineBoardUserDefaults](self, "_removeEntryFromPineBoardUserDefaults");
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 0x400) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
    [v7 tapToSetupManagerDidFinishSetup:v8 deviceInfo:v6];
  }
}

- (void)tapToSetupManager:(id)a3 didFailSetupWithError:(id)a4
{
  id v7 = a4;
  -[SATVTouchRemoteSetupManager _removeEntryFromPineBoardUserDefaults](self, "_removeEntryFromPineBoardUserDefaults");
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 0x800) != 0)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager tapToSetupManager](self, "tapToSetupManager"));
    [v5 tapToSetupManager:v6 didFailSetupWithError:v7];
  }
}

- (void)tapToSetupManager:(id)a3 didFailToStartSetupWithError:(id)a4
{
  id v5 = a4;
  -[SATVTouchRemoteSetupManager _removeEntryFromPineBoardUserDefaults](self, "_removeEntryFromPineBoardUserDefaults");
  if (v5)
  {
    id v8 = @"Error";
    id v9 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  }

  else
  {
    id v6 = 0LL;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager stateMachine](self, "stateMachine"));
  [v7 postEvent:@"DidFailToStartSetup" withContext:0 userInfo:v6];
}

- (void)tapToSetupManager:(id)a3 presentErrorAlert:(id)a4
{
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 0x2000) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
    [v8 tapToSetupManager:v7 presentErrorAlert:v6];
  }

- (void)tapToSetupManager:(id)a3 didReceivePreAuthInfo:(id)a4
{
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 0x4000) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
    [v8 tapToSetupManager:v7 didReceivePreAuthInfo:v6];
  }

- (void)_notifyDelegateDidFailToStartSetupWithError:(id)a3
{
  if ((*(_WORD *)&self->_userInterfaceDelegateFlags & 0x1000) != 0)
  {
    id v4 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager userInterfaceDelegate](self, "userInterfaceDelegate"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager tapToSetupManager](self, "tapToSetupManager"));
    [v6 tapToSetupManager:v5 didFailToStartSetupWithError:v4];
  }

- (void)_start
{
  v3 = objc_alloc_init(&OBJC_CLASS___SATVTapToSetupManager);
  tapToSetupManager = self->_tapToSetupManager;
  self->_tapToSetupManager = v3;

  -[SATVTapToSetupManager setUserInterfaceDelegate:](self->_tapToSetupManager, "setUserInterfaceDelegate:", self);
  -[SATVTapToSetupManager setActivatorHookDelegate:](self->_tapToSetupManager, "setActivatorHookDelegate:", self);
  -[SATVTapToSetupManager start](self->_tapToSetupManager, "start");
}

- (void)_stop
{
  tapToSetupManager = self->_tapToSetupManager;
  self->_tapToSetupManager = 0LL;
}

- (void)_scheduleRetry
{
  id v3 = sub_10002B074();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = 3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Scheduling retry in %d seconds",  (uint8_t *)v5,  8u);
  }

  -[SATVTouchRemoteSetupManager performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_retry",  0LL,  3.0);
}

- (void)_cancelScheduledRetry
{
  id v3 = sub_10002B074();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cancelling any scheduled retry", v5, 2u);
  }

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_retry",  0LL);
}

- (void)_retry
{
  id v3 = sub_10002B074();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting retry attempt", v6, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager stateMachine](self, "stateMachine"));
  [v5 postEvent:@"Retry"];
}

- (void)_activate
{
  id v2 = sub_10002B074();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SATVTouchRemoteSetupManager _activate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s: Beginning activation", buf, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[SATVActivationManager sharedInstance](&OBJC_CLASS___SATVActivationManager, "sharedInstance"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  _DWORD v5[2] = sub_100041888;
  v5[3] = &unk_1000CA198;
  objc_copyWeak(&v6, &location);
  [v4 requestSilentActivationWithCompletionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_checkTarget:(id)a3 forSelector:(SEL)a4 performBlockOnMainThread:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ((objc_opt_respondsToSelector(v7, a4) & 1) != 0) {
    id v9 = v7;
  }
  else {
    id v9 = 0LL;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000419B0;
  v12[3] = &unk_1000C9AC0;
  id v13 = v9;
  id v14 = v8;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(&_dispatch_main_q, v12);
}

- (void)_completeSilentActivationWithSuccessType:(unint64_t)a3 failureReason:(int64_t)a4 error:(id)a5
{
  if (a3) {
    -[SATVTouchRemoteSetupManager _handleSilentActivationSuccessWithSuccessType:]( self,  "_handleSilentActivationSuccessWithSuccessType:",  a3,  a4);
  }
  else {
    -[SATVTouchRemoteSetupManager _handleSilentActivationFailureWithReason:error:]( self,  "_handleSilentActivationFailureWithReason:error:",  a4,  a5);
  }
}

- (void)_handleSilentActivationSuccessWithSuccessType:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager activatorHookCompletion](self, "activatorHookCompletion", a3));

  if (v4)
  {
    id v5 = sub_10002B074();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[SATVTouchRemoteSetupManager _handleSilentActivationSuccessWithSuccessType:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager activatorHookCompletion](self, "activatorHookCompletion"));
    -[SATVTouchRemoteSetupManager setActivatorHookCompletion:](self, "setActivatorHookCompletion:", 0LL);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100041B1C;
    v10[3] = &unk_1000CA4A0;
    v10[4] = self;
    id v11 = v7;
    id v9 = v7;
    [v8 retrieveCloudConfigurationDetailsCompletionBlock:v10];
  }

- (void)_handleSilentActivationFailureWithReason:(int64_t)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTouchRemoteSetupManager activatorHookCompletion](self, "activatorHookCompletion"));

  if (v6)
  {
    id v7 = sub_10002B074();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v5 code];
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
      int v12 = 136315650;
      id v13 = "-[SATVTouchRemoteSetupManager _handleSilentActivationFailureWithReason:error:]";
      __int16 v14 = 2048;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s: errorCode: %lu, error: %@",  (uint8_t *)&v12,  0x20u);
    }

    id v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[SATVTouchRemoteSetupManager activatorHookCompletion]( self,  "activatorHookCompletion"));
    -[SATVTouchRemoteSetupManager setActivatorHookCompletion:](self, "setActivatorHookCompletion:", 0LL);
    v11[2](v11, 0LL, 0LL);
  }
}

- (void)_commitSetupModeToPineBoardUserDefaults
{
  id v2 = sub_10002AF94();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Setting TapToSetupMode to YES in UserDefaults",  v5,  2u);
  }

  id v4 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.PineBoard");
  -[NSUserDefaults setObject:forKey:](v4, "setObject:forKey:", &__kCFBooleanTrue, @"SATVIsTapToSetupModeKey");
  -[NSUserDefaults synchronize](v4, "synchronize");
}

- (void)_removeEntryFromPineBoardUserDefaults
{
  id v2 = sub_10002AF94();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Removing TapToSetupMode from PineBoard UserDefaults",  v5,  2u);
  }

  id v4 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.PineBoard");
  -[NSUserDefaults removeObjectForKey:](v4, "removeObjectForKey:", @"SATVIsTapToSetupModeKey");
}

- (void)tapToSetupManager:(id)a3 readyToActivateWithCompletionHandler:(id)a4
{
}

- (SATVTapToSetupManagerDelegate)userInterfaceDelegate
{
  return (SATVTapToSetupManagerDelegate *)objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (SATVNetworkReachability)networkReachability
{
  return self->_networkReachability;
}

- (SATVTapToSetupManager)tapToSetupManager
{
  return self->_tapToSetupManager;
}

- (void)setTapToSetupManager:(id)a3
{
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (id)activatorHookCompletion
{
  return self->_activatorHookCompletion;
}

- (void)setActivatorHookCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end