@interface PBAttentionMonitor
+ (BOOL)_assertionIsHighPriority:(id)a3;
+ (BOOL)_focusedSceneHasHiliteModeEnabled;
+ (BOOL)_focusedSceneWantsIdleDisabled;
+ (BOOL)_hasOutstandingIdleAssertions;
+ (BOOL)_hasOutstandingIdleAssertionsThatPreventCRD;
+ (BOOL)_hasOutstandingIdleAssertionsThatPreventNowPlaying;
+ (BOOL)_hasOutstandingIdleAssertionsThatPreventScreenSaver;
+ (BOOL)_hasOutstandingIdleAssertionsThatPreventSleep;
+ (BOOL)_isRemainingActiveFor:(unint64_t)a3;
+ (BOOL)_isVideoPlaying;
+ (BOOL)powerManagerAllowSystemToSleep:(id)a3;
+ (id)_activeApplicationScene;
+ (id)_activeApplicationSceneHandle;
+ (id)acquireIdleTimerAssertionWithConfiguration:(id)a3 fromClient:(id)a4 forReason:(id)a5;
+ (id)afterIdleInterval:(double)a3 reason:(id)a4 queue:(id)a5 perform:(id)a6;
+ (id)afterIdleInterval:(double)a3 reason:(id)a4 queue:(id)a5 perform:(id)a6 invalidationHandler:(id)a7;
+ (id)makeIdleAction:(double)a3 reason:(id)a4 queue:(id)a5 perform:(id)a6 invalidationHandler:(id)a7;
+ (unint64_t)_countOutstandingHighPriorityIdleAssertions;
+ (void)__attentionRegained:(id)a3;
+ (void)__configureStateMachineTimeOffsets;
+ (void)__reactToSomethingChanged:(id)a3;
+ (void)__setupAttentionAwareness;
+ (void)__setupAttentionAwarenessForSleep;
+ (void)__whackAttentionAwareness;
+ (void)_noteATimeoutChanged:(id)a3;
+ (void)_noteConditionsMayHaveChanged:(id)a3;
+ (void)_temporarilySuppressWakeForHIDEvents;
+ (void)appTransitioner:(id)a3 willStartAnimationForAppTransition:(id)a4;
+ (void)initialize;
+ (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
+ (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5;
+ (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5;
+ (void)powerManagerDidSleepSystem:(id)a3 reason:(int64_t)a4;
+ (void)powerManagerDidWakeSystem:(id)a3 reason:(int64_t)a4;
+ (void)resetAttention:(id)a3;
+ (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5;
+ (void)sceneManager:(id)a3 didChangeHiliteStateForScene:(id)a4;
+ (void)sceneManager:(id)a3 didChangeIdleTimerStateForScene:(id)a4;
- (id)acquireIdleTimerAssertionWithConfiguration:(id)a3 fromClient:(id)a4 forReason:(id)a5;
- (void)appTransitioner:(id)a3 willStartAnimationForAppTransition:(id)a4;
- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5;
- (void)sceneManager:(id)a3 didChangeHiliteStateForScene:(id)a4;
- (void)sceneManager:(id)a3 didChangeIdleTimerStateForScene:(id)a4;
@end

@implementation PBAttentionMonitor

+ (void)initialize
{
  uint64_t v3 = objc_opt_self(&OBJC_CLASS___PBAttentionMonitor, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    id v5 = sub_100084338();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v60 = +[AWAttentionAwarenessConfiguration supportedEvents]( &OBJC_CLASS___AWAttentionAwarenessConfiguration,  "supportedEvents");
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Setting up AttentionAwareness; supported events mask: 0x%lx",
        buf,
        0xCu);
    }

    v7 = objc_opt_new(&OBJC_CLASS___BackgroundTasksNormalSM);
    v8 = (void *)qword_10046FEE8;
    qword_10046FEE8 = (uint64_t)v7;

    v9 = objc_opt_new(&OBJC_CLASS___BackgroundTasksIdleSM);
    v10 = (void *)qword_10046FEF0;
    qword_10046FEF0 = (uint64_t)v9;

    v11 = objc_opt_new(&OBJC_CLASS___BackgroundTasksLongIdleSM);
    v12 = (void *)qword_10046FEF8;
    qword_10046FEF8 = (uint64_t)v11;

    v13 = objc_opt_new(&OBJC_CLASS___PresenceDetectionSM);
    v14 = (void *)qword_10046FF00;
    qword_10046FF00 = (uint64_t)v13;

    v15 = objc_opt_new(&OBJC_CLASS___HiliteSM);
    v16 = (void *)qword_10046FF08;
    qword_10046FF08 = (uint64_t)v15;

    v17 = objc_opt_new(&OBJC_CLASS___NowPlayingSM);
    v18 = (void *)qword_10046FF10;
    qword_10046FF10 = (uint64_t)v17;

    v19 = objc_opt_new(&OBJC_CLASS___CRDSM);
    v20 = (void *)qword_10046FF18;
    qword_10046FF18 = (uint64_t)v19;

    v21 = objc_opt_new(&OBJC_CLASS___ScreenSaverSM);
    v22 = (void *)qword_10046FF20;
    qword_10046FF20 = (uint64_t)v21;

    v23 = objc_opt_new(&OBJC_CLASS___RemoteSleepSM);
    v24 = (void *)qword_10046FF28;
    qword_10046FF28 = (uint64_t)v23;

    v25 = objc_opt_new(&OBJC_CLASS___RemoteConnectedStandbySM);
    v26 = (void *)qword_10046FF30;
    qword_10046FF30 = (uint64_t)v25;

    v27 = objc_opt_new(&OBJC_CLASS___SleepSM);
    v28 = (void *)qword_10046FF38;
    qword_10046FF38 = (uint64_t)v27;

    +[PBAttentionMonitor __configureStateMachineTimeOffsets]( &OBJC_CLASS___PBAttentionMonitor,  "__configureStateMachineTimeOffsets");
    +[PBAttentionMonitor __setupAttentionAwareness](&OBJC_CLASS___PBAttentionMonitor, "__setupAttentionAwareness");
    dispatch_queue_t v29 = dispatch_queue_create("IdleTimerService", 0LL);
    id v30 = [[ITIdleTimerStateService alloc] initWithDispatchQueue:v29 delegate:a1];
    v31 = (void *)qword_10046FF60;
    qword_10046FF60 = (uint64_t)v30;

    v32 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v33 = (void *)qword_10046FF78;
    qword_10046FF78 = (uint64_t)v32;

    v34 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    v35 = (void *)qword_10046FF68;
    qword_10046FF68 = (uint64_t)v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[PBDisplayManager sharedInstance](&OBJC_CLASS___PBDisplayManager, "sharedInstance"));
    uint64_t v38 = objc_opt_self(&OBJC_CLASS___PBAttentionMonitor, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    [v36 addObserver:v39 forKeyPath:@"currentDisplayMode" options:5 context:&off_1003D0648];

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemAppSettings sharedInstance](&OBJC_CLASS___PBSystemAppSettings, "sharedInstance"));
    uint64_t v42 = objc_opt_self(&OBJC_CLASS___PBAttentionMonitor, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    [v40 addObserver:v43 forKeyPath:@"idleTimerAllowed" options:5 context:&off_1003D0650];

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    uint64_t v46 = objc_opt_self(&OBJC_CLASS___PBAttentionMonitor, v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    [v44 addObserver:v47 forKeyPath:@"EnforceProvisioningOnSystemApps" options:5 context:&off_1003D0658];

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    [v48 addObserver:a1];

    v49 = (void *)objc_claimAutoreleasedReturnValue( +[PBDefaultOpenAppTransitioner sharedInstance]( &OBJC_CLASS___PBDefaultOpenAppTransitioner,  "sharedInstance"));
    [v49 addObserver:a1];

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
    [v50 addObserver:a1];

    dispatch_source_t v51 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
    v52 = (void *)qword_10046FF70;
    qword_10046FF70 = (uint64_t)v51;

    v53 = (dispatch_source_s *)qword_10046FF70;
    dispatch_time_t v54 = dispatch_time(0LL, 10000000000LL);
    dispatch_source_set_timer(v53, v54, 0xDF8475800uLL, 0x3B9ACA00uLL);
    dispatch_source_set_event_handler((dispatch_source_t)qword_10046FF70, &stru_1003D0660);
    dispatch_activate((dispatch_object_t)qword_10046FF70);
    dispatch_queue_attr_t v55 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v56 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v55);
    v57 = dispatch_queue_create("com.apple.PineBoard.attentionMonitorIdleSleep", v56);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100014F74;
    block[3] = &unk_1003D0680;
    block[4] = a1;
    dispatch_async(v57, block);
  }

+ (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (a6 == &off_1003D0648)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100015100;
    block[3] = &unk_1003CFF08;
    id v19 = v12;
    dispatch_async(&_dispatch_main_q, block);
    v14 = v19;
LABEL_7:

    goto LABEL_9;
  }

  if (a6 == &off_1003D0650)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100015218;
    v16[3] = &unk_1003CFF08;
    id v17 = v12;
    dispatch_async(&_dispatch_main_q, v16);
    v14 = v17;
    goto LABEL_7;
  }

  if (a6 == &off_1003D0658)
  {
    dispatch_async(&_dispatch_main_q, &stru_1003D06A0);
  }

  else
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___PBAttentionMonitor;
    objc_msgSendSuper2(&v15, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

+ (void)__configureStateMachineTimeOffsets
{
  id v2 = sub_100084338();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v59 = "+[PBAttentionMonitor __configureStateMachineTimeOffsets]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 longIdleDelayInSeconds];
  double v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v7 remotePresenceDetectionDelayTimeoutInSeconds];
  double v57 = v8;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v9 hiliteModeTimeoutInSeconds];
  double v56 = v10;

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v11 musicNowPlayingTimeoutInSeconds];
  double v55 = v12;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v13 crdAppTimeoutInSeconds];
  double v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
  [v16 screenSaverActivationDelayInMinutes];
  double v18 = v17 * 60.0;

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v19 bluetoothRemoteSleepTimeoutInSeconds];
  double v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v22 sleepTimeoutInSeconds];
  double v24 = v23;

  if (v6 >= 60.0) {
    double v25 = v6;
  }
  else {
    double v25 = 60.0;
  }
  if (v6 >= 4040404040.0 || v6 <= 0.0) {
    double v25 = 0.0;
  }
  double v53 = v25;
  if (v15 >= 10.0) {
    double v27 = v15;
  }
  else {
    double v27 = 10.0;
  }
  if (v15 >= 4040404040.0 || v15 <= 0.0) {
    double v29 = 0.0;
  }
  else {
    double v29 = v27;
  }
  if (v18 >= 10.0) {
    double v30 = v18;
  }
  else {
    double v30 = 10.0;
  }
  if (v18 >= 4040404040.0 || v18 <= 0.0) {
    double v32 = 0.0;
  }
  else {
    double v32 = v30;
  }
  if (v24 >= 10.0) {
    double v33 = v24;
  }
  else {
    double v33 = 10.0;
  }
  if (v24 >= 4040404040.0 || v24 <= 0.0) {
    double v33 = 0.0;
  }
  if (v33 <= 0.0) {
    double v35 = 1.0e10;
  }
  else {
    double v35 = v33;
  }
  unsigned __int8 v36 = +[UIApplication isRunningInStoreDemoMode]( &OBJC_CLASS___UIApplication,  "isRunningInStoreDemoMode");
  if (v32 <= 0.0) {
    double v37 = v29;
  }
  else {
    double v37 = 0.0;
  }
  double v51 = v37;
  double v38 = 3600.0;
  if (((v32 <= 0.0) & v36) == 0) {
    double v38 = v32;
  }
  if (v35 <= v38) {
    double v39 = 0.0;
  }
  else {
    double v39 = v38;
  }
  if (v21 >= 60.0) {
    double v40 = v21;
  }
  else {
    double v40 = 60.0;
  }
  if (v21 >= 4040404040.0 || v21 <= 0.0) {
    double v40 = 0.0;
  }
  double v54 = v40;
  if (v55 >= 10.0) {
    double v42 = v55;
  }
  else {
    double v42 = 10.0;
  }
  if (v55 >= 4040404040.0 || v55 <= 0.0) {
    double v44 = 0.0;
  }
  else {
    double v44 = v42;
  }
  if (v56 >= 10.0) {
    double v45 = v56;
  }
  else {
    double v45 = 10.0;
  }
  if (v56 >= 4040404040.0 || v56 <= 0.0) {
    double v47 = 0.0;
  }
  else {
    double v47 = v45;
  }
  if (v57 >= 10.0) {
    double v48 = v57;
  }
  else {
    double v48 = 10.0;
  }
  if (v57 >= 4040404040.0 || v57 <= 0.0) {
    double v50 = 0.0;
  }
  else {
    double v50 = v48;
  }
  objc_msgSend((id)qword_10046FEE8, "setEnabledOffset:", 0.0, *(void *)&v51);
  [(id)qword_10046FEF0 setEnabledOffset:30.0];
  [(id)qword_10046FEF8 setEnabledOffset:v53];
  [(id)qword_10046FF00 setEnabledOffset:v50];
  [(id)qword_10046FF08 setEnabledOffset:v47];
  [(id)qword_10046FF10 setEnabledOffset:v44];
  [(id)qword_10046FF18 setEnabledOffset:v52];
  [(id)qword_10046FF20 setEnabledOffset:v39];
  [(id)qword_10046FF28 setEnabledOffset:v54];
  [(id)qword_10046FF30 setEnabledOffset:0.0];
  [(id)qword_10046FF38 setEnabledOffset:v35];
}

+ (void)__setupAttentionAwareness
{
  id v3 = sub_100084338();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v23 = "+[PBAttentionMonitor __setupAttentionAwareness]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_msgSend(a1, "__whackAttentionAwareness");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10001598C;
  v20[3] = &unk_1003D06C8;
  double v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  double v21 = v5;
  double v6 = objc_retainBlock(v20);
  ((void (*)(void *, uint64_t))v6[2])(v6, qword_10046FEE8);
  ((void (*)(void *, uint64_t))v6[2])(v6, qword_10046FEF0);
  ((void (*)(void *, uint64_t))v6[2])(v6, qword_10046FEF8);
  ((void (*)(void *, uint64_t))v6[2])(v6, qword_10046FF00);
  ((void (*)(void *, uint64_t))v6[2])(v6, qword_10046FF10);
  ((void (*)(void *, uint64_t))v6[2])(v6, qword_10046FF08);
  ((void (*)(void *, uint64_t))v6[2])(v6, qword_10046FF18);
  ((void (*)(void *, uint64_t))v6[2])(v6, qword_10046FF20);
  ((void (*)(void *, uint64_t))v6[2])(v6, qword_10046FF38);
  ((void (*)(void *, uint64_t))v6[2])(v6, qword_10046FF28);
  ((void (*)(void *, uint64_t))v6[2])(v6, qword_10046FF30);
  v7 = (void *)objc_opt_new(&OBJC_CLASS___AWAttentionAwarenessConfiguration);
  [v7 setIdentifier:@"com.apple.PineBoard.Awake"];
  [v7 setEventMask:1133];
  [v7 setAttentionLostTimeoutDictionary:v5];
  double v8 = objc_opt_new(&OBJC_CLASS___AWAttentionAwarenessClient);
  v9 = (void *)qword_10046FF58;
  qword_10046FF58 = (uint64_t)v8;

  id v19 = 0LL;
  unsigned __int8 v10 = [(id)qword_10046FF58 setConfiguration:v7 shouldReset:0 error:&v19];
  id v11 = v19;
  if ((v10 & 1) == 0)
  {
    id v12 = sub_100084338();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100270240();
    }
  }

  [(id)qword_10046FF58 setEventHandlerWithQueue:&_dispatch_main_q block:&stru_1003D0708];

  id v18 = 0LL;
  unsigned __int8 v14 = [(id)qword_10046FF58 resumeWithError:&v18];
  id v15 = v18;
  if ((v14 & 1) == 0)
  {
    id v16 = sub_100084338();
    double v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1002701E0();
    }
  }
}

+ (void)__setupAttentionAwarenessForSleep
{
  id v3 = sub_100084338();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v32 = "+[PBAttentionMonitor __setupAttentionAwarenessForSleep]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_msgSend(a1, "__whackAttentionAwareness");
  double v5 = (void *)objc_opt_new(&OBJC_CLASS___AWAttentionAwarenessConfiguration);
  [v5 setIdentifier:@"com.apple.PineBoard.Asleep"];
  [v5 setEventMask:101];
  [v5 setAttentionLostTimeout:0.01];
  double v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  v29[0] = &off_1003FD428;
  v29[1] = &off_1003FD458;
  v30[0] = &off_1003FD440;
  v30[1] = &off_1003FD470;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
  -[NSMutableSet addObject:](v6, "addObject:", v7);

  v27[0] = &off_1003FD428;
  v27[1] = &off_1003FD458;
  v28[0] = &off_1003FD488;
  v28[1] = &off_1003FD4A0;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL));
  -[NSMutableSet addObject:](v6, "addObject:", v8);

  v25[0] = &off_1003FD428;
  v25[1] = &off_1003FD458;
  v26[0] = &off_1003FD488;
  v26[1] = &off_1003FD4B8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL));
  -[NSMutableSet addObject:](v6, "addObject:", v9);

  v23[0] = &off_1003FD428;
  v23[1] = &off_1003FD458;
  v24[0] = &off_1003FD488;
  v24[1] = &off_1003FD4D0;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v24,  v23,  2LL));
  -[NSMutableSet addObject:](v6, "addObject:", v10);

  [v5 setAllowedHIDEventsForRemoteEvent:v6];
  id v11 = objc_opt_new(&OBJC_CLASS___AWAttentionAwarenessClient);
  id v12 = (void *)qword_10046FF58;
  qword_10046FF58 = (uint64_t)v11;

  id v22 = 0LL;
  unsigned __int8 v13 = [(id)qword_10046FF58 setConfiguration:v5 shouldReset:0 error:&v22];
  id v14 = v22;
  if ((v13 & 1) == 0)
  {
    id v15 = sub_100084338();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1002703B8();
    }
  }

  [(id)qword_10046FF58 setEventHandlerWithQueue:&_dispatch_main_q block:&stru_1003D0728];

  id v21 = 0LL;
  unsigned __int8 v17 = [(id)qword_10046FF58 resumeWithError:&v21];
  id v18 = v21;
  if ((v17 & 1) == 0)
  {
    id v19 = sub_100084338();
    double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100270358();
    }
  }
}

+ (void)__whackAttentionAwareness
{
  if (qword_10046FF58)
  {
    id v2 = sub_100084338();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "+[PBAttentionMonitor __whackAttentionAwareness]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    id v9 = 0LL;
    unsigned __int8 v4 = [(id)qword_10046FF58 invalidateWithError:&v9];
    id v5 = v9;
    if ((v4 & 1) == 0)
    {
      id v6 = sub_100084338();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1002704D0();
      }
    }

    double v8 = (void *)qword_10046FF58;
    qword_10046FF58 = 0LL;
  }

  [(id)qword_10046FEE8 automaticDisable];
  [(id)qword_10046FEF0 automaticDisable];
  [(id)qword_10046FEF8 automaticDisable];
  [(id)qword_10046FF00 automaticDisable];
  [(id)qword_10046FF08 automaticDisable];
  [(id)qword_10046FF10 automaticDisable];
  [(id)qword_10046FF18 automaticDisable];
  [(id)qword_10046FF20 automaticDisable];
  [(id)qword_10046FF28 automaticDisable];
  [(id)qword_10046FF30 automaticDisable];
  [(id)qword_10046FF38 automaticDisable];
}

+ (void)__reactToSomethingChanged:(id)a3
{
  id v3 = a3;
  id v4 = sub_100084338();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "+[PBAttentionMonitor __reactToSomethingChanged:]";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(id)qword_10046FF38 adjustStateAutomatically];
  [(id)qword_10046FF10 adjustStateAutomatically];
  [(id)qword_10046FF18 adjustStateAutomatically];
  [(id)qword_10046FF20 adjustStateAutomatically];
  [(id)qword_10046FF08 adjustStateAutomatically];
  [(id)qword_10046FF00 adjustStateAutomatically];
  [(id)qword_10046FF28 adjustStateAutomatically];
  [(id)qword_10046FEE8 adjustStateAutomatically];
  [(id)qword_10046FEF0 adjustStateAutomatically];
  [(id)qword_10046FEF8 adjustStateAutomatically];
  [(id)qword_10046FF30 adjustStateAutomatically];
}

+ (void)__attentionRegained:(id)a3
{
  id v3 = a3;
  id v4 = sub_100084338();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "+[PBAttentionMonitor __attentionRegained:]";
    __int16 v19 = 2114;
    id v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "** %s: %{public}@", buf, 0x16u);
  }

  unint64_t v6 = (unint64_t)+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState");
  [(id)qword_10046FEE8 automaticDisable];
  [(id)qword_10046FEF0 automaticDisable];
  [(id)qword_10046FEF8 automaticDisable];
  [(id)qword_10046FF00 automaticDisable];
  [(id)qword_10046FF08 automaticDisable];
  [(id)qword_10046FF10 automaticDisable];
  [(id)qword_10046FF18 automaticDisable];
  [(id)qword_10046FF20 automaticDisable];
  [(id)qword_10046FF28 automaticDisable];
  [(id)qword_10046FF30 automaticDisable];
  [(id)qword_10046FF38 automaticDisable];
  [(id)qword_10046FEE8 enterOffStateAutomatically];
  [(id)qword_10046FEF0 enterOffStateAutomatically];
  [(id)qword_10046FEF8 enterOffStateAutomatically];
  [(id)qword_10046FF00 enterOffStateAutomatically];
  [(id)qword_10046FF08 enterOffStateAutomatically];
  [(id)qword_10046FF28 enterOffStateAutomatically];
  [(id)qword_10046FF30 enterOffStateAutomatically];
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = (id)qword_10046FF78;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v11), "resetForAwake", (void)v12);
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }

  if (v6 > 8 || ((1LL << v6) & 0x1B0) == 0) {
    +[PBSSystemStatus _setSystemActive](&OBJC_CLASS___PBSSystemStatus, "_setSystemActive", (void)v12);
  }
}

+ (void)resetAttention:(id)a3
{
  id v3 = a3;
  id v4 = sub_100084338();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v13 = "+[PBAttentionMonitor resetAttention:]";
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %{public}@", buf, 0x16u);
  }

  if (+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") == (id)6)
  {
    id v6 = sub_100084338();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100270530();
    }
  }

  else
  {
    id v11 = 0LL;
    unsigned __int8 v8 = [(id)qword_10046FF58 resetAttentionLostTimeoutWithError:&v11];
    id v7 = (os_log_s *)v11;
    if ((v8 & 1) == 0)
    {
      id v9 = sub_100084338();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100270590();
      }
    }

    +[PBAttentionMonitor __attentionRegained:](&OBJC_CLASS___PBAttentionMonitor, "__attentionRegained:", v3);
  }
}

+ (BOOL)_hasOutstandingIdleAssertions
{
  return [(id)qword_10046FF68 count] != 0;
}

+ (BOOL)_hasOutstandingIdleAssertionsThatPreventNowPlaying
{
  return [a1 _hasOutstandingIdleAssertions];
}

+ (BOOL)_hasOutstandingIdleAssertionsThatPreventCRD
{
  return [a1 _hasOutstandingIdleAssertions];
}

+ (BOOL)_hasOutstandingIdleAssertionsThatPreventScreenSaver
{
  return [a1 _hasOutstandingIdleAssertions];
}

+ (BOOL)_hasOutstandingIdleAssertionsThatPreventSleep
{
  return [a1 _hasOutstandingIdleAssertions];
}

+ (BOOL)_assertionIsHighPriority:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 reason]);
  unsigned __int8 v4 = [v3 containsString:@"com.apple.coremedia"];

  return v4;
}

+ (unint64_t)_countOutstandingHighPriorityIdleAssertions
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v3 = (id)qword_10046FF68;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += objc_msgSend( a1,  "_assertionIsHighPriority:",  *(void *)(*((void *)&v10 + 1) + 8 * (void)i),  (void)v10);
      }

      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v5);
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  return v6;
}

+ (BOOL)_isVideoPlaying
{
  return [a1 _countOutstandingHighPriorityIdleAssertions] != 0;
}

+ (void)_noteATimeoutChanged:(id)a3
{
  id v3 = a3;
  id v4 = sub_100084338();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "+[PBAttentionMonitor _noteATimeoutChanged:]";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  +[PBAttentionMonitor __configureStateMachineTimeOffsets]( &OBJC_CLASS___PBAttentionMonitor,  "__configureStateMachineTimeOffsets");
  if ([(id)qword_10046FF38 isOff])
  {
    +[PBAttentionMonitor __setupAttentionAwareness](&OBJC_CLASS___PBAttentionMonitor, "__setupAttentionAwareness");
    +[PBAttentionMonitor __attentionRegained:](&OBJC_CLASS___PBAttentionMonitor, "__attentionRegained:", v3);
  }
}

+ (void)_noteConditionsMayHaveChanged:(id)a3
{
  id v3 = a3;
  id v4 = sub_100084338();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "+[PBAttentionMonitor _noteConditionsMayHaveChanged:]";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  +[PBAttentionMonitor __reactToSomethingChanged:](&OBJC_CLASS___PBAttentionMonitor, "__reactToSomethingChanged:", v3);
}

+ (void)_temporarilySuppressWakeForHIDEvents
{
  id v2 = sub_100084338();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "+[PBAttentionMonitor _temporarilySuppressWakeForHIDEvents]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(id)qword_10046FF38 _temporarilySuppressWakeForHIDEvents];
}

+ (BOOL)_isRemainingActiveFor:(unint64_t)a3
{
  if (a3 == 1) {
    return objc_msgSend((id)qword_10046FF68, "bs_containsObjectPassingTest:", &stru_1003D0768);
  }
  if (a3) {
    return 0;
  }
  return [(id)qword_10046FF68 count] != 0;
}

+ (BOOL)_focusedSceneWantsIdleDisabled
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _activeApplicationSceneHandle]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sceneIfExists]);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 clientSettings]);
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (BOOL)_focusedSceneHasHiliteModeEnabled
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _activeApplicationScene]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 clientSettings]);
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (id)_activeApplicationScene
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([a1 _activeApplicationSceneHandle]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sceneIfExists]);

  return v3;
}

+ (id)_activeApplicationSceneHandle
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  id v3 = [v2 activeLayoutLevel];

  if (v3 == (id)1)
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentApplicationSceneHandle]);
  }

  else
  {
    unsigned __int8 v5 = 0LL;
  }

  return v5;
}

+ (id)makeIdleAction:(double)a3 reason:(id)a4 queue:(id)a5 perform:(id)a6 invalidationHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v29 = 0LL;
  double v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  double v32 = sub_100016EA4;
  double v33 = sub_100016EB4;
  id v34 = 0LL;
  id v15 = objc_alloc(&OBJC_CLASS___PBIdleAction);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  void v26[2] = sub_100016ECC;
  v26[3] = &unk_1003D07B8;
  id v16 = v13;
  id v27 = v16;
  v28 = &v29;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  void v23[2] = sub_100016F6C;
  v23[3] = &unk_1003D07B8;
  id v17 = v14;
  id v24 = v17;
  double v25 = &v29;
  id v18 = -[PBIdleAction initWithInterval:reason:queue:perform:invalidationHandler:]( v15,  "initWithInterval:reason:queue:perform:invalidationHandler:",  v11,  v12,  v26,  v23,  a3);
  __int16 v19 = (void *)v30[5];
  v30[5] = (uint64_t)v18;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017010;
  block[3] = &unk_1003D0790;
  void block[4] = &v29;
  dispatch_async(&_dispatch_main_q, block);
  id v20 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v20;
}

+ (id)afterIdleInterval:(double)a3 reason:(id)a4 queue:(id)a5 perform:(id)a6 invalidationHandler:(id)a7
{
  return (id)objc_claimAutoreleasedReturnValue( [a1 makeIdleAction:a4 reason:a5 queue:a6 perform:a7 invalidationHandler:a3]);
}

+ (id)afterIdleInterval:(double)a3 reason:(id)a4 queue:(id)a5 perform:(id)a6
{
  return (id)objc_claimAutoreleasedReturnValue( [a1 makeIdleAction:a4 reason:a5 queue:a6 perform:0 invalidationHandler:a3]);
}

+ (BOOL)powerManagerAllowSystemToSleep:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBCriticalRemoteBatteryAlertManager sharedInstance]( &OBJC_CLASS___PBCriticalRemoteBatteryAlertManager,  "sharedInstance",  a3));
  char v4 = [v3 isPresenting] ^ 1;

  return v4;
}

+ (void)powerManager:(id)a3 willSleepSystemWithReason:(int64_t)a4 completion:(id)a5
{
  int v6 = (void (**)(void))a5;
  +[PBSSystemStatus _setSystemSleepStarting:]( &OBJC_CLASS___PBSSystemStatus,  "_setSystemSleepStarting:",  (a4 & 0xFFFFFFFFFFFFFFFBLL) != 1);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v7 = (id)qword_10046FF78;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v11), "resetForSleep", (void)v12);
        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v9);
  }

  +[PBAttentionMonitor __whackAttentionAwareness](&OBJC_CLASS___PBAttentionMonitor, "__whackAttentionAwareness");
  v6[2](v6);
}

+ (void)powerManagerDidSleepSystem:(id)a3 reason:(int64_t)a4
{
  char v4 = (dispatch_source_s *)qword_10046FF70;
  dispatch_time_t v5 = dispatch_time(0LL, 1000000000LL);
  dispatch_source_set_timer(v4, v5, 0x34630B8A000uLL, 0xDF8475800uLL);
}

+ (void)powerManager:(id)a3 willWakeSystemWithReason:(int64_t)a4 completion:(id)a5
{
  dispatch_time_t v5 = (void (**)(void))a5;
  +[PBSSystemStatus _setSystemSleepStopping](&OBJC_CLASS___PBSSystemStatus, "_setSystemSleepStopping");
  +[PBAttentionMonitor __whackAttentionAwareness](&OBJC_CLASS___PBAttentionMonitor, "__whackAttentionAwareness");
  int v6 = (dispatch_source_s *)qword_10046FF70;
  dispatch_time_t v7 = dispatch_time(0LL, 10000000000LL);
  dispatch_source_set_timer(v6, v7, 0xDF8475800uLL, 0x3B9ACA00uLL);
  v5[2](v5);
}

+ (void)powerManagerDidWakeSystem:(id)a3 reason:(int64_t)a4
{
}

- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5
{
  id v5 = sub_100084338();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_1002705F0(v6, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)sceneManager:(id)a3 didChangeIdleTimerStateForScene:(id)a4
{
  id v4 = sub_100084338();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_100270660(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)sceneManager:(id)a3 didChangeHiliteStateForScene:(id)a4
{
  id v4 = sub_100084338();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_1002706D0(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

+ (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5
{
}

+ (void)sceneManager:(id)a3 didChangeIdleTimerStateForScene:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _activeApplicationScene]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if ([v5 isEqual:v7])
  {
    unsigned int v8 = [(id)qword_10046FF38 isOff];

    if (v8) {
      +[PBAttentionMonitor resetAttention:]( &OBJC_CLASS___PBAttentionMonitor,  "resetAttention:",  @"didChangeIdleTimerStateForScene");
    }
  }

  else
  {
  }

+ (void)sceneManager:(id)a3 didChangeHiliteStateForScene:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 _activeApplicationScene]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
  if ([v5 isEqual:v7])
  {
    unsigned int v8 = [(id)qword_10046FF38 isOff];

    if (v8) {
      +[PBAttentionMonitor __reactToSomethingChanged:]( &OBJC_CLASS___PBAttentionMonitor,  "__reactToSomethingChanged:",  @"didChangeHiliteStateForScene");
    }
  }

  else
  {
  }

- (void)appTransitioner:(id)a3 willStartAnimationForAppTransition:(id)a4
{
  id v4 = sub_100084338();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_100270740(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

+ (void)appTransitioner:(id)a3 willStartAnimationForAppTransition:(id)a4
{
  id v4 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 openRequest]);
  unsigned int v6 = [v5 isForeground];

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 openRequest]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 toSceneIdentity]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PBProcess Manager launching app %@",  v8));
    +[PBAttentionMonitor resetAttention:](&OBJC_CLASS___PBAttentionMonitor, "resetAttention:", v9);
  }
}

- (id)acquireIdleTimerAssertionWithConfiguration:(id)a3 fromClient:(id)a4 forReason:(id)a5
{
  id v5 = sub_100084338();
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_1002707B0(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  return 0LL;
}

+ (id)acquireIdleTimerAssertionWithConfiguration:(id)a3 fromClient:(id)a4 forReason:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_100084338();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    else {
      uint64_t v12 = "NO";
    }
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    *(_DWORD *)buf = 136315906;
    double v32 = "+[PBAttentionMonitor acquireIdleTimerAssertionWithConfiguration:fromClient:forReason:]";
    __int16 v33 = 2080;
    id v34 = v12;
    __int16 v35 = 2114;
    unsigned __int8 v36 = v13;
    __int16 v37 = 2114;
    id v38 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: (disablesTimer: %s, client: %{public}@, reason: '%{public}@')",  buf,  0x2Au);
  }

  if (v8)
  {
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);

    if (v14) {
      goto LABEL_14;
    }
    id v15 = sub_100084338();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v32 = "+[PBAttentionMonitor acquireIdleTimerAssertionWithConfiguration:fromClient:forReason:]";
      id v17 = "%s: clientProcessHandle bundleIdentifier is nil";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
    }
  }

  else
  {
    id v18 = sub_100084338();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v32 = "+[PBAttentionMonitor acquireIdleTimerAssertionWithConfiguration:fromClient:forReason:]";
      id v17 = "%s: clientProcessHandle is nil";
      goto LABEL_12;
    }
  }

LABEL_14:
  if ([v7 disablesTimer])
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v8 bundleIdentifier]);
    id v20 = (void *)v19;
    id v21 = @"???";
    if (v19) {
      id v21 = (const __CFString *)v19;
    }
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"DisableIdleTimer(%@:%@)",  v21,  v9));

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100017B40;
    block[3] = &unk_1003CFEB8;
    id v29 = v22;
    double v23 =  -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:]( objc_alloc(&OBJC_CLASS___BSSimpleAssertion),  "initWithIdentifier:forReason:invalidationBlock:",  v22,  v9,  &stru_1003D07F8);
    double v30 = v23;
    id v24 = v22;
    dispatch_sync(&_dispatch_main_q, block);
    double v25 = v30;
    v26 = v23;
  }

  else
  {
    v26 = 0LL;
  }

  return v26;
}

@end