@interface SATVActivator
+ (BOOL)_hasDeKOTAFlagInActivationRecord;
+ (BOOL)isBricked;
+ (BOOL)isDeviceActivated;
+ (BOOL)isDeviceFactoryActivated;
+ (id)_activationState;
+ (unint64_t)_successTypeForActivationState:(id)a3;
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (SATVActivator)init;
- (SATVActivatorDelegate)delegate;
- (TVSStateMachine)stateMachine;
- (UINavigationController)navigationController;
- (void)_activateDeviceWithResponse:(id)a3;
- (void)_activationDidFailWithreason:(int64_t)a3 error:(id)a4;
- (void)_activationStateChanged;
- (void)_activationSucceeded;
- (void)_checkActivationFailIfBricked:(BOOL)a3;
- (void)_cleanup;
- (void)_clearTicketAcceptedTimer;
- (void)_configureStateMachine;
- (void)_dismissRemoteUI;
- (void)_handleActivationFailureWithError:(id)a3 reason:(int64_t)a4;
- (void)_handleActivationResponse:(id)a3;
- (void)_loadCloudConfig;
- (void)_setTimeWithCompletion:(id)a3;
- (void)_startActivation;
- (void)_startRequest:(id)a3 completion:(id)a4;
- (void)_ticketAcceptedDidTimeout;
- (void)_tryActivateWithOptions:(id)a3 requestMutator:(id)a4;
- (void)dealloc;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)start;
@end

@implementation SATVActivator

+ (id)_activationState
{
  id v7 = 0LL;
  v2 = (void *)MAEGetActivationStateWithError(&v7);
  id v3 = v7;
  if (v3)
  {
    id v4 = sub_10002555C();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Error checking activation state: %@",  buf,  0xCu);
    }
  }

  return v2;
}

+ (BOOL)isDeviceActivated
{
  id v2 = a1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _activationState]);
  LOBYTE(v2) = [v2 _successTypeForActivationState:v3] != 0;

  return (char)v2;
}

+ (BOOL)isDeviceFactoryActivated
{
  id v2 = a1;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a1 _activationState]);
  LOBYTE(v2) = [v2 _successTypeForActivationState:v3] == (id)2;

  return (char)v2;
}

+ (BOOL)isBricked
{
  id v2 = (const __CFBoolean *)lockdown_copy_brickState(a1, a2);
  if (!v2) {
    return 1;
  }
  id v3 = v2;
  BOOL v4 = CFBooleanGetValue(v2) != 0;
  CFRelease(v3);
  return v4;
}

+ (unint64_t)_successTypeForActivationState:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:kMAActivationStateActivated])
  {
    else {
      unint64_t v5 = 1LL;
    }
  }

  else if ([v4 isEqualToString:kMAActivationStateFactoryActivated])
  {
    unint64_t v5 = 2LL;
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  return v5;
}

- (SATVActivator)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SATVActivator;
  id v2 = -[SATVActivator init](&v14, "init");
  if (v2)
  {
    id v3 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
    id v4 = (objc_class *)objc_opt_class(v2);
    unint64_t v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = -[TVSStateMachine initWithName:initialState:mode:]( v3,  "initWithName:initialState:mode:",  v6,  @"Idle",  0LL);
    stateMachine = v2->_stateMachine;
    v2->_stateMachine = v7;

    -[TVSStateMachine setCallsStateChangeHandlerSynchronously:]( v2->_stateMachine,  "setCallsStateChangeHandlerSynchronously:",  1LL);
    id v9 = v2->_stateMachine;
    id v10 = sub_10002555C();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[TVSStateMachine setLogObject:](v9, "setLogObject:", v11);

    -[SATVActivator _configureStateMachine](v2, "_configureStateMachine");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_100070000,  @"com.apple.mobile.lockdown.activation_state",  0LL,  CFNotificationSuspensionBehaviorCoalesce);
    -[TVSStateMachine setShouldAcceptEvents:](v2->_stateMachine, "setShouldAcceptEvents:", 1LL);
  }

  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[SATVActivator _cleanup](self, "_cleanup");
  -[RemoteUIController setDelegate:](self->_remoteUIController, "setDelegate:", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVActivator;
  -[SATVActivator dealloc](&v4, "dealloc");
}

- (void)start
{
  id v3 = sub_10002555C();
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[SATVActivator start]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", (uint8_t *)&v5, 0xCu);
  }

  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Start");
}

- (void)_configureStateMachine
{
  stateMachine = self->_stateMachine;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10007051C;
  v25[3] = &unk_1000CA3C0;
  objc_copyWeak(&v26, &location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( stateMachine,  "registerDefaultHandlerForEvent:withBlock:",  @"Failed",  v25);
  objc_super v4 = self->_stateMachine;
  v30[0] = @"Idle";
  v30[1] = @"Activated";
  v30[2] = @"Activation Failed";
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v30, 3LL));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_1000705DC;
  v23[3] = &unk_1000CA3C0;
  objc_copyWeak(&v24, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v4,  "registerHandlerForEvent:onStates:withBlock:",  @"Start",  v5,  v23);

  v6 = self->_stateMachine;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000708C0;
  v21[3] = &unk_1000CA3C0;
  objc_copyWeak(&v22, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v6,  "registerHandlerForEvent:onState:withBlock:",  @"Succeeded",  @"Setting System Time",  v21);
  id v7 = self->_stateMachine;
  v29[0] = @"Activating";
  v29[1] = @"Showing Remote UI";
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v29, 2LL));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000709EC;
  v19[3] = &unk_1000CB038;
  objc_copyWeak(&v20, &location);
  v19[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v7,  "registerHandlerForEvent:onStates:withBlock:",  @"Show Remote UI",  v8,  v19);

  id v9 = self->_stateMachine;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100070C00;
  v17[3] = &unk_1000CA3C0;
  objc_copyWeak(&v18, &location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v9,  "registerDefaultHandlerForEvent:withBlock:",  @"Attempt Activation",  v17);
  id v10 = self->_stateMachine;
  v28 = @"Activating";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100070D58;
  v15[3] = &unk_1000CA3C0;
  objc_copyWeak(&v16, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v10,  "registerHandlerForEvent:onStates:withBlock:",  @"Succeeded",  v11,  v15);

  v12 = self->_stateMachine;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100070E64;
  v13[3] = &unk_1000CA3C0;
  objc_copyWeak(&v14, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v12,  "registerHandlerForEvent:onState:withBlock:",  @"Succeeded",  @"Loading Cloud Config",  v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (void)_setTimeWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = sub_10002555C();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[SATVActivator _setTimeWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", buf, 0xCu);
  }

  if (qword_100109A48)
  {
    id v6 = sub_10002555C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = (const char *)qword_100109A48;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Activation failures: %ld",  buf,  0xCu);
    }

- (void)_startActivation
{
  id v3 = sub_10002555C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 136315138;
    v29 = "-[SATVActivator _startActivation]";
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: trace %s",  (uint8_t *)&v28,  0xCu);
  }

  CFPropertyListRef v5 = CFPreferencesCopyAppValue(@"ActivationURL", @"com.apple.purplebuddy");
  if (v5)
  {
    id v6 = v5;
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == CFStringGetTypeID()) {
      v8 = (char *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6));
    }
    else {
      v8 = 0LL;
    }
    CFRelease(v6);
  }

  else
  {
    v8 = 0LL;
  }

  CFPropertyListRef v9 = CFPreferencesCopyAppValue(@"ActivationSessionURL", @"com.apple.purplebuddy");
  if (v9)
  {
    uint64_t v10 = v9;
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 == CFStringGetTypeID()) {
      v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v10));
    }
    else {
      v12 = 0LL;
    }
    CFRelease(v10);
  }

  else
  {
    v12 = 0LL;
  }

  BOOL v13 = (const __CFBoolean *)CFPreferencesCopyAppValue( @"ActivationAllowAnyHTTPSCertificate",  @"com.apple.purplebuddy");
  if (v13)
  {
    CFBooleanRef v14 = v13;
    CFTypeID v15 = CFGetTypeID(v13);
    if (v15 == CFStringGetTypeID())
    {
      unint64_t v16 = (unint64_t)-[__CFBoolean BOOLValue](v14, "BOOLValue");
    }

    else
    {
      CFTypeID v17 = CFGetTypeID(v14);
      unint64_t v16 = v17 == CFBooleanGetTypeID() && v14 == kCFBooleanTrue;
    }

    CFRelease(v14);
  }

  else
  {
    unint64_t v16 = 0LL;
  }

  id v18 = sub_10002555C();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138412290;
    v29 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Got activation URL override: %@",  (uint8_t *)&v28,  0xCu);
  }

  id v20 = sub_10002555C();
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138412290;
    v29 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Got session URL override: %@",  (uint8_t *)&v28,  0xCu);
  }

  id v22 = sub_10002555C();
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 67109120;
    LODWORD(v29) = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Allow any HTTPS certificate = %d",  (uint8_t *)&v28,  8u);
  }

  -[SATVActivationEngine cancel](self->_engine, "cancel");
  id v24 = sub_10002555C();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v28) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Creating Activation Connection WiFi.",  (uint8_t *)&v28,  2u);
  }

  id v26 = (SATVActivationEngine *)objc_claimAutoreleasedReturnValue( +[SATVActivationEngine activationEngineWithOverrideActivationURL:sessionURL:]( &OBJC_CLASS___SATVActivationEngine,  "activationEngineWithOverrideActivationURL:sessionURL:",  v8,  v12));
  engine = self->_engine;
  self->_engine = v26;

  -[SATVActivationEngine setAllowAnyHTTPSCertificate:](self->_engine, "setAllowAnyHTTPSCertificate:", v16);
  -[SATVActivator _tryActivateWithOptions:requestMutator:](self, "_tryActivateWithOptions:requestMutator:", 0LL, 0LL);
}

- (void)_tryActivateWithOptions:(id)a3 requestMutator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10002555C();
  CFPropertyListRef v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v16 = "-[SATVActivator _tryActivateWithOptions:requestMutator:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  engine = self->_engine;
  if (engine)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000717FC;
    v13[3] = &unk_1000CB188;
    id v14 = v7;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100071894;
    v11[3] = &unk_1000CB1B0;
    objc_copyWeak(&v12, (id *)buf);
    v11[4] = self;
    -[SATVActivationEngine tryActivateWithOptions:requestMutator:completion:]( engine,  "tryActivateWithOptions:requestMutator:completion:",  v6,  v13,  v11);
    objc_destroyWeak(&v12);
  }

  objc_destroyWeak((id *)buf);
}

- (void)_startRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10002555C();
  CFPropertyListRef v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[SATVActivator _startRequest:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", buf, 0xCu);
  }

  if (sub_10002AF30())
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 URL]);
    CFTypeID v11 = (void *)objc_claimAutoreleasedReturnValue([v10 absoluteString]);
    unsigned int v12 = [v11 hasSuffix:@"/deviceActivation"];

    if (v12)
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionaryForKey:@"CustomActivationHeaders"]);

      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      id v15 = v14;
      id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v27;
        do
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
            v21 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v20]);
            [v6 setValue:v21 forHTTPHeaderField:v20];
          }

          id v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }

        while (v17);
      }
    }
  }

  engine = self->_engine;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100071C80;
  v24[3] = &unk_1000CB1D8;
  v24[4] = self;
  id v25 = v7;
  id v23 = v7;
  -[SATVActivationEngine makeRequest:completion:](engine, "makeRequest:completion:", v6, v24);
}

- (void)_activateDeviceWithResponse:(id)a3
{
  id v5 = a3;
  id v6 = sub_10002555C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34[0] = "-[SATVActivator _activateDeviceWithResponse:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", buf, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 headers]);
  if (!v8) {
    sub_1000799D0();
  }

  CFPropertyListRef v9 = (void *)objc_claimAutoreleasedReturnValue([v5 headers]);
  if (!v9)
  {
    id v10 = sub_10002555C();
    CFTypeID v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: No headers in activation response!",  buf,  2u);
    }
  }

  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v5 headers]);
  if (v12)
  {
    uint64_t v35 = kMAOptionsActivationResponseHeaders;
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v5 headers]);
    v36 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
  }

  else
  {
    id v14 = 0LL;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 data]);
  id v30 = 0LL;
  int v16 = MAEActivateDeviceWithError(v15, v14, &v30);
  id v17 = v30;

  id v18 = sub_10002555C();
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    char v20 = sub_10002AF30();
    v21 = v17;
    if ((v20 & 1) == 0)
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([v17 domain]);
      v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<Error domain: %@, code %ld>",  v3,  [v17 code]));
    }

    *(_DWORD *)buf = 67109378;
    LODWORD(v34[0]) = v16;
    WORD2(v34[0]) = 2114;
    *(void *)((char *)v34 + 6) = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: ticketAccepted = %d, error = %{public}@",  buf,  0x12u);
    if ((v20 & 1) == 0)
    {
    }
  }

  if (v16)
  {
    -[SATVActivator _clearTicketAcceptedTimer](self, "_clearTicketAcceptedTimer");
    id v22 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_ticketAcceptedDidTimeout",  0LL,  0LL,  20.0));
    ticketAcceptedTimer = self->_ticketAcceptedTimer;
    self->_ticketAcceptedTimer = v22;
  }

  else
  {
    id v24 = objc_alloc(&OBJC_CLASS___NSString);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v5 data]);
    ticketAcceptedTimer = -[NSString initWithData:encoding:](v24, "initWithData:encoding:", v25, 4LL);

    id v26 = sub_10002555C();
    __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34[0] = ticketAcceptedTimer;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Failed with response body: %@",  buf,  0xCu);
    }

    stateMachine = self->_stateMachine;
    v31 = @"REASON";
    v32 = &off_1000D0DF0;
    __int128 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    -[TVSStateMachine postEvent:withContext:userInfo:]( stateMachine,  "postEvent:withContext:userInfo:",  @"Failed",  0LL,  v29);
  }
}

- (void)_handleActivationResponse:(id)a3
{
  id v4 = a3;
  id v5 = sub_10002555C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SATVActivator _handleActivationResponse:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
  if (!v7) {
    sub_1000799F8();
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 headers]);
  CFPropertyListRef v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"Content-Type"]);

  id v10 = objc_alloc(&OBJC_CLASS___NSString);
  CFTypeID v11 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
  unsigned int v12 = -[NSString initWithData:encoding:](v10, "initWithData:encoding:", v11, 4LL);

  if (v9) {
    unsigned int v13 = [v9 containsString:@"application/x-buddyml"];
  }
  else {
    unsigned int v13 = -[NSString rangeOfString:](v12, "rangeOfString:", @"<xmlui") != (id)0x7FFFFFFFFFFFFFFFLL;
  }
  id v14 = sub_10002555C();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
    id v17 = (const char *)[v16 length];
    *(_DWORD *)buf = 134218242;
    v33 = v17;
    __int16 v34 = 2112;
    uint64_t v35 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: connectionDidFinishLoading response size = %ld, contentType = %@\n",  buf,  0x16u);
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v19 = [v18 BOOLForKey:@"LogFullActivationResponse"];

  if (v19)
  {
    id v20 = sub_10002555C();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = (const char *)v12;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Got Response: %@\n",  buf,  0xCu);
    }
  }

  id v22 = sub_10002555C();
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v24)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Buddy Activate: Render xmlui", buf, 2u);
    }

    stateMachine = self->_stateMachine;
    id v30 = @"RESPONSE";
    id v31 = v4;
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    __int128 v27 = @"Show Remote UI";
  }

  else
  {
    if (v24)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Buddy Activate: Non xmlui response", buf, 2u);
    }

    stateMachine = self->_stateMachine;
    __int128 v28 = @"RESPONSE";
    id v29 = v4;
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
    __int128 v27 = @"Attempt Activation";
  }

  -[TVSStateMachine postEvent:withContext:userInfo:](stateMachine, "postEvent:withContext:userInfo:", v27, 0LL, v26);
}

- (void)_handleActivationFailureWithError:(id)a3 reason:(int64_t)a4
{
  id v7 = (NSError *)a3;
  id v8 = sub_10002555C();
  CFPropertyListRef v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21[0] = "-[SATVActivator _handleActivationFailureWithError:reason:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", buf, 0xCu);
  }

  id v10 = sub_10002555C();
  CFTypeID v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v12 = sub_10002AF30();
    unsigned int v13 = v7;
    if ((v12 & 1) == 0)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v7, "domain"));
      unsigned int v13 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<Error domain: %@, code %ld>",  v4,  -[NSError code](v7, "code")));
    }

    *(_DWORD *)buf = 67109378;
    LODWORD(v21[0]) = a4;
    WORD2(v21[0]) = 2114;
    *(void *)((char *)v21 + 6) = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: activation failed: %d (%{public}@).",  buf,  0x12u);
    if ((v12 & 1) == 0)
    {
    }
  }

  -[RUIPage setLoading:](self->_loadingPage, "setLoading:", 0LL);
  loadingPage = self->_loadingPage;
  self->_loadingPage = 0LL;

  -[SATVActivator _cleanup](self, "_cleanup");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v16 = objc_opt_respondsToSelector(WeakRetained, "activator:didFailWithError:reason:");

  if ((v16 & 1) != 0)
  {
    if (!v7) {
      id v7 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.appletv.activation",  a4,  0LL);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000726E4;
    block[3] = &unk_1000CB0C8;
    block[4] = self;
    id v7 = v7;
    id v18 = v7;
    int64_t v19 = a4;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)_cleanup
{
  id v3 = sub_10002555C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SATVActivator _cleanup]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", (uint8_t *)&v5, 0xCu);
  }

  -[SATVActivationEngine cancel](self->_engine, "cancel");
}

- (void)_activationSucceeded
{
  id v3 = sub_10002555C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "-[SATVActivator _activationSucceeded]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", buf, 0xCu);
  }

  id v5 = sub_10002555C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Device activation succeeded.",  buf,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  unsigned __int8 v8 = [v7 isMDMConfiguration];

  if ([(id)objc_opt_class(self) _hasDeKOTAFlagInActivationRecord] && (v8 & 1) == 0)
  {
    id v9 = sub_10002555C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: MDM bit is off, DeKOTA bit is on. Setting up as demo device.",  buf,  2u);
    }

    CFTypeID v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKManagedDevice sharedInstance](&OBJC_CLASS___MSDKManagedDevice, "sharedInstance"));
    [v11 prepare];
  }

  char v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivator delegate](self, "delegate"));

  if (v12)
  {
    id v13 = [(id)objc_opt_class(self) _activationState];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v16 = objc_opt_respondsToSelector(WeakRetained, "activator:didSucceedWithType:");

    if ((v16 & 1) != 0)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100072A04;
      v17[3] = &unk_1000C9BA0;
      void v17[4] = self;
      id v18 = v14;
      dispatch_async(&_dispatch_main_q, v17);
    }
  }

- (void)_activationDidFailWithreason:(int64_t)a3 error:(id)a4
{
  id v6 = (NSError *)a4;
  id v7 = sub_10002555C();
  unsigned __int8 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16[0] = "-[SATVActivator _activationDidFailWithreason:error:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", buf, 0xCu);
  }

  id v9 = sub_10002555C();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v16[0]) = a3;
    WORD2(v16[0]) = 2112;
    *(void *)((char *)v16 + 6) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Device activation failed: %d (%@).",  buf,  0x12u);
  }

  ++qword_100109A48;
  CFTypeID v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivator delegate](self, "delegate"));

  if (v11)
  {
    if (!v6) {
      id v6 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.appletv.activation",  a3,  0LL);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100072C20;
    block[3] = &unk_1000CB0C8;
    block[4] = self;
    id v6 = v6;
    id v13 = v6;
    int64_t v14 = a3;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)_clearTicketAcceptedTimer
{
  id v3 = sub_10002555C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SATVActivator _clearTicketAcceptedTimer]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", (uint8_t *)&v6, 0xCu);
  }

  -[NSTimer invalidate](self->_ticketAcceptedTimer, "invalidate");
  ticketAcceptedTimer = self->_ticketAcceptedTimer;
  self->_ticketAcceptedTimer = 0LL;
}

- (void)_ticketAcceptedDidTimeout
{
  id v3 = sub_10002555C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    unsigned __int8 v8 = "-[SATVActivator _ticketAcceptedDidTimeout]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", (uint8_t *)&v7, 0xCu);
  }

  id v5 = sub_10002555C();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Ticket Accepted Timeout.",  (uint8_t *)&v7,  2u);
  }

  -[SATVActivator _clearTicketAcceptedTimer](self, "_clearTicketAcceptedTimer");
  -[SATVActivator _checkActivationFailIfBricked:](self, "_checkActivationFailIfBricked:", 1LL);
}

- (void)_activationStateChanged
{
  id v3 = sub_10002555C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[SATVActivator _activationStateChanged]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", buf, 0xCu);
  }

  id v5 = sub_10002555C();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Activation State Changed!",  buf,  2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100072F4C;
  block[3] = &unk_1000C9468;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_checkActivationFailIfBricked:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(id)objc_opt_class(self) isBricked];
  id v6 = sub_10002555C();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](self->_stateMachine, "currentState"));
    *(_DWORD *)buf = 138543618;
    int64_t v14 = v8;
    __int16 v15 = 1024;
    int v16 = v5 ^ 1;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Check Activation! State = %{public}@ Activated = %d",  buf,  0x12u);
  }

  -[SATVActivator _clearTicketAcceptedTimer](self, "_clearTicketAcceptedTimer");
  if ((v5 & 1) != 0)
  {
    if (v3)
    {
      stateMachine = self->_stateMachine;
      CFTypeID v11 = @"REASON";
      char v12 = &off_1000D0E08;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
      -[TVSStateMachine postEvent:withContext:userInfo:]( stateMachine,  "postEvent:withContext:userInfo:",  @"Failed",  0LL,  v10);
    }
  }

  else
  {
    -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Succeeded");
  }

- (void)_loadCloudConfig
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKCloudConfigUtility sharedUtility](&OBJC_CLASS___TVSKCloudConfigUtility, "sharedUtility"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100073128;
  v4[3] = &unk_1000CB200;
  v4[4] = self;
  [v3 retrieveCloudConfigurationDetailsCompletionBlock:v4];
}

- (void)_dismissRemoteUI
{
  id v3 = sub_10002555C();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    unsigned __int8 v8 = "-[SATVActivator _dismissRemoteUI]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", (uint8_t *)&v7, 0xCu);
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](self->_stateMachine, "currentState"));
  id v6 = @"Succeeded";
  if (([v5 isEqual:@"Activating"] & 1) == 0
    && ![v5 isEqual:@"Showing Remote UI"])
  {
    id v6 = @"Failed";
  }

  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", v6);
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10002555C();
  char v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 136315138;
    id v30 = "-[SATVActivator remoteUIController:shouldLoadRequest:redirectResponse:]";
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: trace %s",  (uint8_t *)&v29,  0xCu);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](self->_stateMachine, "currentState"));
  unsigned int v14 = [v13 isEqual:@"Activated"];

  if (v14)
  {
    id v15 = sub_10002555C();
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Ignoring xmlui because device is already activated",  (uint8_t *)&v29,  2u);
    }
  }

  else
  {
    -[SATVActivator _cleanup](self, "_cleanup");
    if (self->_loadingPage) {
      sub_100079A20();
    }
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_objectModels, "lastObject"));
    id v18 = (RUIPage *)objc_claimAutoreleasedReturnValue([v17 visiblePage]);
    loadingPage = self->_loadingPage;
    self->_loadingPage = v18;

    -[RUIPage setLoading:](self->_loadingPage, "setLoading:", 1LL);
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 HTTPMethod]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 lowercaseString]);
    unsigned int v22 = [v21 isEqualToString:@"post"];

    if (v22)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_objectModels, "lastObject"));
      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v23 postbackData]);

      if (v24)
      {
        [v9 setHTTPBody:v24];
        [v9 setHTTPMethod:@"POST"];
        [v9 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
      }
    }

    id v25 = sub_10002555C();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v27 = (char *)objc_claimAutoreleasedReturnValue([v9 URL]);
      int v29 = 138412290;
      id v30 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: RemoteUI hand off of request for URL %@",  (uint8_t *)&v29,  0xCu);
    }

    -[SATVActivator _startRequest:completion:](self, "_startRequest:completion:", v9, 0LL);
  }

  return 0;
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v7 = a4;
  id v8 = sub_10002555C();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315138;
    id v26 = "-[SATVActivator remoteUIController:didReceiveObjectModel:actionSignal:]";
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: trace %s",  (uint8_t *)&v25,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 clientInfo]);
  if (a5)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[RemoteUIController displayedPages](self->_remoteUIController, "displayedPages"));
    id v12 = [v11 count];

    unint64_t v13 = *a5;
    if (v12)
    {
      if (v13 != 1) {
        goto LABEL_19;
      }
      goto LABEL_13;
    }

    switch(v13)
    {
      case 1uLL:
LABEL_13:
        int v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"ack-received"]);
        unsigned int v17 = [v16 BOOLValue];

        if (v17)
        {
          uint64_t v18 = lockdown_connect();
          if (v18)
          {
            uint64_t v19 = v18;
            id v20 = sub_10002555C();
            v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v25) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Writing ActivationStateAcknowledged key.",  (uint8_t *)&v25,  2u);
            }

            lockdown_set_value(v19, 0LL, @"ActivationStateAcknowledged", kCFBooleanTrue);
            lockdown_disconnect(v19);
          }
        }

        -[SATVActivator _dismissRemoteUI](self, "_dismissRemoteUI");
        break;
      case 4uLL:
        id v23 = sub_10002555C();
        BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v25) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Server bug, got a pop with no pages",  (uint8_t *)&v25,  2u);
        }

        *a5 = 0LL;
        break;
      case 3uLL:
        id v14 = sub_10002555C();
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v25) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Server bug, got a replace with no pages",  (uint8_t *)&v25,  2u);
        }

        *a5 = 2LL;
        break;
    }
  }

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_10002555C();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    unint64_t v13 = "-[SATVActivator remoteUIController:willPresentObjectModel:modally:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: trace %s",  (uint8_t *)&v12,  0xCu);
  }

  if (v5) {
    sub_100079A48();
  }
  -[NSMutableArray addObject:](self->_objectModels, "addObject:", v9);
}

- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4
{
  BOOL v5 = (char *)a4;
  id v6 = sub_10002555C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    int v12 = "-[SATVActivator remoteUIController:didRemoveObjectModel:]";
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: trace %s",  (uint8_t *)&v11,  0xCu);
  }

  id v8 = -[NSMutableArray indexOfObject:](self->_objectModels, "indexOfObject:", v5);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = sub_10002555C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      int v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: RUI removed an object model that is not on our stack: %@",  (uint8_t *)&v11,  0xCu);
    }
  }

  else
  {
    -[NSMutableArray removeObjectAtIndex:](self->_objectModels, "removeObjectAtIndex:", v8);
  }
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4
{
  id v6 = (char *)a4;
  id v7 = sub_10002555C();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = "-[SATVActivator remoteUIController:didFinishLoadWithError:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Buddy Activate: trace %s", buf, 0xCu);
  }

  if (v6)
  {
    id v9 = sub_10002555C();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      char v11 = sub_10002AF30();
      int v12 = v6;
      if ((v11 & 1) == 0)
      {
        id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
        int v12 = (char *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<Error domain: %@, code %ld>",  v4,  [v6 code]));
      }

      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: RUILoader didFailWithError: %{public}@",  buf,  0xCu);
      if ((v11 & 1) == 0)
      {
      }
    }

    stateMachine = self->_stateMachine;
    id v15 = @"ERROR";
    int v16 = v6;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    -[TVSStateMachine postEvent:withContext:userInfo:]( stateMachine,  "postEvent:withContext:userInfo:",  @"Failed",  0LL,  v14);
  }
}

+ (BOOL)_hasDeKOTAFlagInActivationRecord
{
  id v18 = 0LL;
  uint64_t v2 = MAECopyActivationRecordWithError(&v18, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = v18;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"DeviceConfigurationFlags"]);
  id v6 = sub_10002555C();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Device Configuration Flags = %@",  buf,  0xCu);
  }

  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if (((objc_opt_isKindOfClass(v5, v8) & 1) != 0
     || (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v5, v9) & 1) != 0))
    && ((unint64_t)[v5 integerValue] & 6) != 0)
  {
    id v10 = sub_10002555C();
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Configuration flags specify demo mode",  buf,  2u);
    }

    BOOL v12 = 1;
  }

  else
  {
    BOOL v12 = 0;
  }

  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v14 = [v13 BOOLForKey:@"forceDeKOTABit"];

  if (v14)
  {
    id v15 = sub_10002555C();
    int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Forcing demo bit for DeKOTA", buf, 2u);
    }

    BOOL v12 = 1;
  }

  return v12;
}

- (SATVActivatorDelegate)delegate
{
  return (SATVActivatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (void).cxx_destruct
{
}

@end