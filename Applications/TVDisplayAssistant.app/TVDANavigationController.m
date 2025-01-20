@interface TVDANavigationController
- (NSError)eARCMeasuremntError;
- (NSMutableArray)queuedMeasurements;
- (NSMutableArray)stepTracks;
- (NSMutableDictionary)takenWiFiQualityMeasurements;
- (PBSDisplayAssistantPresentationRequest)presentationRequest;
- (PBSDisplayMode)destinationDisplayMode;
- (PBSDisplayMode)sourceDisplayMode;
- (TVDAMeasurable)currentMeasurement;
- (TVDANavigationController)initWithPresentationRequest:(id)a3;
- (TVSStateMachine)stateMachine;
- (id)_nextStepAfterSerieCompletion;
- (id)currentTrack;
- (int)numVideoResetSeenInCableCheck;
- (int64_t)assistantKind;
- (int64_t)assistantSource;
- (int64_t)eARCStatus;
- (void)_attemptToRunMeasurement:(id)a3;
- (void)_dismissDisplayAssistant;
- (void)_enqueueMeasurement:(id)a3;
- (void)_executeNextQueuedMeasurerIfAny;
- (void)_goBackToPreviousStepForAction:(id)a3;
- (void)_handleMenuPress:(id)a3;
- (void)_initialiseStateMachine;
- (void)_measure:(id)a3;
- (void)_pushSpinnerViewController;
- (void)_pushViewControllerForStep:(id)a3;
- (void)_runAction:(id)a3;
- (void)_startFromFirstStep;
- (void)_updateInternalLabelIfNeededForViewController:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setCurrentMeasurement:(id)a3;
- (void)setEARCMeasuremntError:(id)a3;
- (void)setEARCStatus:(int64_t)a3;
- (void)setNumVideoResetSeenInCableCheck:(int)a3;
- (void)setPresentationRequest:(id)a3;
- (void)setQueuedMeasurements:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setStepTracks:(id)a3;
- (void)setTakenWiFiQualityMeasurements:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVDANavigationController

- (TVDANavigationController)initWithPresentationRequest:(id)a3
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v22;
  v22 = 0LL;
  v20.receiver = v3;
  v20.super_class = (Class)&OBJC_CLASS___TVDANavigationController;
  v22 = -[TVDANavigationController initWithNibName:bundle:](&v20, "initWithNibName:bundle:", 0LL);
  objc_storeStrong((id *)&v22, v22);
  if (v22)
  {
    v19 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
    -[PBSDisplayManager addObserver:forKeyPath:options:context:]( v19,  "addObserver:forKeyPath:options:context:",  v22,  @"currentDisplayMode",  1LL,  off_100031148);
    v4 = (PBSDisplayAssistantPresentationRequest *)[location[0] copy];
    presentationRequest = v22->_presentationRequest;
    v22->_presentationRequest = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    stepTracks = v22->_stepTracks;
    v22->_stepTracks = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    seenStepDisplayModePairs = v22->_seenStepDisplayModePairs;
    v22->_seenStepDisplayModePairs = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    takenWiFiQualityMeasurements = v22->_takenWiFiQualityMeasurements;
    v22->_takenWiFiQualityMeasurements = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    queuedMeasurements = v22->_queuedMeasurements;
    v22->_queuedMeasurements = v12;

    v14 = objc_alloc(&OBJC_CLASS___TVDADataReporter);
    v15 = -[TVDADataReporter initWithPresentationRequest:]( v14,  "initWithPresentationRequest:",  v22->_presentationRequest);
    reporter = v22->_reporter;
    v22->_reporter = v15;

    objc_storeStrong((id *)&v19, 0LL);
  }

  v18 = v22;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v22, 0LL);
  return v18;
}

- (void)dealloc
{
  v29 = self;
  SEL v28 = a2;
  memset(__b, 0, sizeof(__b));
  obj = v29->_stepTracks;
  id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v32,  16LL);
  if (v19)
  {
    uint64_t v15 = *(void *)__b[2];
    uint64_t v16 = 0LL;
    id v17 = v19;
    while (1)
    {
      uint64_t v14 = v16;
      if (*(void *)__b[2] != v15) {
        objc_enumerationMutation(obj);
      }
      id v27 = *(id *)(__b[1] + 8 * v16);
      memset(v24, 0, sizeof(v24));
      id v12 = [v27 steps];
      id v13 = [v12 countByEnumeratingWithState:v24 objects:v31 count:16];
      if (v13)
      {
        uint64_t v9 = *(void *)v24[2];
        uint64_t v10 = 0LL;
        id v11 = v13;
        while (1)
        {
          uint64_t v8 = v10;
          if (*(void *)v24[2] != v9) {
            objc_enumerationMutation(v12);
          }
          id v25 = *(id *)(v24[1] + 8 * v10);
          memset(v22, 0, sizeof(v22));
          id v6 = [v25 actions];
          id v7 = [v6 countByEnumeratingWithState:v22 objects:v30 count:16];
          if (v7)
          {
            uint64_t v3 = *(void *)v22[2];
            uint64_t v4 = 0LL;
            id v5 = v7;
            while (1)
            {
              uint64_t v2 = v4;
              if (*(void *)v22[2] != v3) {
                objc_enumerationMutation(v6);
              }
              id v23 = *(id *)(v22[1] + 8 * v4);
              [v23 stopTimer];
              ++v4;
              if (v2 + 1 >= (unint64_t)v5)
              {
                uint64_t v4 = 0LL;
                id v5 = [v6 countByEnumeratingWithState:v22 objects:v30 count:16];
                if (!v5) {
                  break;
                }
              }
            }
          }

          ++v10;
          if (v8 + 1 >= (unint64_t)v11)
          {
            uint64_t v10 = 0LL;
            id v11 = [v12 countByEnumeratingWithState:v24 objects:v31 count:16];
            if (!v11) {
              break;
            }
          }
        }
      }

      ++v16;
      if (v14 + 1 >= (unint64_t)v17)
      {
        uint64_t v16 = 0LL;
        id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v32,  16LL);
        if (!v17) {
          break;
        }
      }
    }
  }

  v21 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  -[PBSDisplayManager removeObserver:forKeyPath:context:]( v21,  "removeObserver:forKeyPath:context:",  v29,  @"currentDisplayMode",  off_100031148);
  objc_storeStrong((id *)&v21, 0LL);
  v20.receiver = v29;
  v20.super_class = (Class)&OBJC_CLASS___TVDANavigationController;
  -[TVDANavigationController dealloc](&v20, "dealloc");
}

- (PBSDisplayMode)sourceDisplayMode
{
  uint64_t v3 = -[TVDANavigationController presentationRequest](self, "presentationRequest");
  id v4 = -[PBSDisplayAssistantPresentationRequest sourceDisplayMode](v3, "sourceDisplayMode");

  return (PBSDisplayMode *)v4;
}

- (PBSDisplayMode)destinationDisplayMode
{
  uint64_t v3 = -[TVDANavigationController presentationRequest](self, "presentationRequest");
  id v4 = -[PBSDisplayAssistantPresentationRequest destinationDisplayMode](v3, "destinationDisplayMode");

  return (PBSDisplayMode *)v4;
}

- (int64_t)assistantKind
{
  uint64_t v3 = -[TVDANavigationController presentationRequest](self, "presentationRequest");
  id v4 = -[PBSDisplayAssistantPresentationRequest kind](v3, "kind");

  return (int64_t)v4;
}

- (int64_t)assistantSource
{
  uint64_t v3 = -[TVDANavigationController presentationRequest](self, "presentationRequest");
  id v4 = -[PBSDisplayAssistantPresentationRequest source](v3, "source");

  return (int64_t)v4;
}

- (id)currentTrack
{
  return -[NSMutableArray lastObject](self->_stepTracks, "lastObject", a2, self);
}

- (void)viewDidLoad
{
  id v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVDANavigationController;
  -[TVDANavigationController viewDidLoad](&v11, "viewDidLoad");
  -[TVDANavigationController setNavigationBarHidden:](v13, "setNavigationBarHidden:", 1LL);
  -[TVDANavigationController _initialiseStateMachine](v13, "_initialiseStateMachine");
  -[TVDANavigationController _startFromFirstStep](v13, "_startFromFirstStep");
  uint64_t v2 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
  id v10 = -[UITapGestureRecognizer initWithTarget:action:](v2, "initWithTarget:action:", v13, "_handleMenuPress:");
  [v10 setAllowedPressTypes:&off_10002B9C0];
  id v6 = -[TVDANavigationController view](v13, "view");
  [v6 addGestureRecognizer:v10];

  os_log_t oslog = (os_log_t)sub_10001A69C();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    os_log_type_t v4 = type;
    id v5 = -[TVDANavigationController presentationRequest](v13, "presentationRequest");
    id v7 = v5;
    sub_100009320((uint64_t)v14, (uint64_t)v7);
    _os_log_impl((void *)&_mh_execute_header, log, v4, "Presenting DA from request: %{public}@", v14, 0xCu);

    objc_storeStrong((id *)&v7, 0LL);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  objc_storeStrong(&v10, 0LL);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVDANavigationController;
  -[TVDANavigationController viewDidAppear:](&v8, "viewDidAppear:", a3);
  if (!-[NSMutableArray count](v11->_stepTracks, "count"))
  {
    os_log_t oslog = (os_log_t)sub_10001A69C();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v4 = type;
      sub_100002910(v5);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v4,  "Presenting Display Assistant with no steps. Dismissing...",  v5,  2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    -[TVDANavigationController _dismissDisplayAssistant](v11, "_dismissDisplayAssistant");
  }

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  SEL v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v8 = a4;
  v7.receiver = v10;
  v7.super_class = (Class)&OBJC_CLASS___TVDANavigationController;
  -[TVDANavigationController setViewControllers:animated:](&v7, "setViewControllers:animated:", location[0], a4);
  id v5 = v10;
  id v6 = [location[0] firstObject];
  -[TVDANavigationController _updateInternalLabelIfNeededForViewController:]( v5,  "_updateInternalLabelIfNeededForViewController:");

  objc_storeStrong(location, 0LL);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)&OBJC_CLASS___TVDANavigationController;
  -[TVDANavigationController pushViewController:animated:](&v5, "pushViewController:animated:", location[0], a4);
  -[TVDANavigationController _updateInternalLabelIfNeededForViewController:]( v8,  "_updateInternalLabelIfNeededForViewController:",  location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)_initialiseStateMachine
{
  v103 = self;
  location[1] = (id)a2;
  id v23 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  aClass = (objc_class *)objc_opt_class(v103);
  objc_super v20 = NSStringFromClass(aClass);
  v21 = -[TVSStateMachine initWithName:initialState:mode:](v23, "initWithName:initialState:mode:");
  stateMachine = v103->_stateMachine;
  v103->_stateMachine = v21;

  id v19 = v103->_stateMachine;
  id v18 = sub_10001A760();
  -[TVSStateMachine setLogObject:](v19, "setLogObject:");

  objc_initWeak(location, v103);
  id v17 = v103->_stateMachine;
  v96 = _NSConcreteStackBlock;
  int v97 = -1073741824;
  int v98 = 0;
  v99 = sub_10000A208;
  v100 = &unk_100028C88;
  objc_copyWeak(&v101, location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v17,  "registerDefaultHandlerForEvent:withBlock:",  @"KickOffTrackEvent",  &v96);
  uint64_t v16 = v103->_stateMachine;
  v90 = _NSConcreteStackBlock;
  int v91 = -1073741824;
  int v92 = 0;
  v93 = sub_10000A400;
  v94 = &unk_100028C88;
  objc_copyWeak(v95, location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v16,  "registerDefaultHandlerForEvent:withBlock:",  @"DismissAssistantEvent",  &v90);
  uint64_t v15 = v103->_stateMachine;
  v105[0] = @"BackgroundMeasuringState";
  v105[1] = @"ForegroundMeasuringState";
  uint64_t v14 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v105, 2LL);
  v84 = _NSConcreteStackBlock;
  int v85 = -1073741824;
  int v86 = 0;
  v87 = sub_10000A518;
  v88 = &unk_100028C88;
  objc_copyWeak(&v89, location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v15,  "registerHandlerForEvent:onStates:withBlock:",  @"DismissAssistantEvent",  v14,  &v84);

  id v13 = v103->_stateMachine;
  v78 = _NSConcreteStackBlock;
  int v79 = -1073741824;
  int v80 = 0;
  v81 = sub_10000A6E0;
  v82 = &unk_100028C88;
  objc_copyWeak(&v83, location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v13,  "registerDefaultHandlerForEvent:withBlock:",  @"ContinueToNextStepEvent",  &v78);
  SEL v12 = v103->_stateMachine;
  v72 = _NSConcreteStackBlock;
  int v73 = -1073741824;
  int v74 = 0;
  v75 = sub_10000A890;
  v76 = &unk_100028C88;
  objc_copyWeak(&v77, location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v12,  "registerDefaultHandlerForEvent:withBlock:",  @"GoToPreviousStepEvent",  &v72);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v103->_stateMachine,  "registerDefaultHandlerForEvent:withBlock:",  @"RestoreDefaultModeEvent",  &stru_100028CC8);
  objc_super v11 = v103->_stateMachine;
  v66 = _NSConcreteStackBlock;
  int v67 = -1073741824;
  int v68 = 0;
  v69 = sub_10000ADC4;
  v70 = &unk_100028C88;
  objc_copyWeak(&v71, location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v11,  "registerDefaultHandlerForEvent:withBlock:",  @"CompleteSeriesOfStepsEvent",  &v66);
  SEL v10 = v103->_stateMachine;
  v60 = _NSConcreteStackBlock;
  int v61 = -1073741824;
  int v62 = 0;
  v63 = sub_10000AF54;
  v64 = &unk_100028C88;
  objc_copyWeak(&v65, location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v10,  "registerDefaultHandlerForEvent:withBlock:",  @"ReceivedNextStepActionEvent",  &v60);
  BOOL v9 = v103->_stateMachine;
  v54 = _NSConcreteStackBlock;
  int v55 = -1073741824;
  int v56 = 0;
  v57 = sub_10000B0E8;
  v58 = &unk_100028C88;
  objc_copyWeak(&v59, location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v9,  "registerDefaultHandlerForEvent:withBlock:",  @"AttemptingToStartMeasuringEvent",  &v54);
  BOOL v8 = v103->_stateMachine;
  v104[0] = @"BackgroundMeasuringState";
  v104[1] = @"ForegroundMeasuringState";
  objc_super v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v104, 2LL);
  v48 = _NSConcreteStackBlock;
  int v49 = -1073741824;
  int v50 = 0;
  v51 = sub_10000B244;
  v52 = &unk_100028C88;
  objc_copyWeak(&v53, location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v8,  "registerHandlerForEvent:onStates:withBlock:",  @"AttemptingToStartMeasuringEvent",  v7,  &v48);

  BOOL v6 = v103->_stateMachine;
  v42 = _NSConcreteStackBlock;
  int v43 = -1073741824;
  int v44 = 0;
  v45 = sub_10000B3A0;
  v46 = &unk_100028C88;
  objc_copyWeak(&v47, location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v6,  "registerDefaultHandlerForEvent:withBlock:",  @"StartMeasuringEvent",  &v42);
  objc_super v5 = v103->_stateMachine;
  v36 = _NSConcreteStackBlock;
  int v37 = -1073741824;
  int v38 = 0;
  v39 = sub_10000B558;
  v40 = &unk_100028C88;
  objc_copyWeak(&v41, location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v5,  "registerDefaultHandlerForEvent:withBlock:",  @"StopMeasuringEvent",  &v36);
  os_log_type_t v4 = v103->_stateMachine;
  v30 = _NSConcreteStackBlock;
  int v31 = -1073741824;
  int v32 = 0;
  v33 = sub_10000B680;
  v34 = &unk_100028C88;
  objc_copyWeak(&v35, location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v4,  "registerDefaultHandlerForEvent:withBlock:",  @"ModeSwitchFailedEvent",  &v30);
  uint64_t v3 = v103->_stateMachine;
  v24 = _NSConcreteStackBlock;
  int v25 = -1073741824;
  int v26 = 0;
  id v27 = sub_10000BB30;
  SEL v28 = &unk_100028C88;
  objc_copyWeak(&v29, location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v3,  "registerDefaultHandlerForEvent:withBlock:",  @"TooManyVideoDropsEvent",  &v24);
  -[TVSStateMachine setShouldAcceptEvents:](v103->_stateMachine, "setShouldAcceptEvents:", 1LL);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&v53);
  objc_destroyWeak(&v59);
  objc_destroyWeak(&v65);
  objc_destroyWeak(&v71);
  objc_destroyWeak(&v77);
  objc_destroyWeak(&v83);
  objc_destroyWeak(&v89);
  objc_destroyWeak(v95);
  objc_destroyWeak(&v101);
  objc_destroyWeak(location);
}

- (void)_startFromFirstStep
{
  uint64_t v15 = self;
  v14[1] = (id)a2;
  v14[0] = 0LL;
  BOOL v9 = -[TVDANavigationController sourceDisplayMode](self, "sourceDisplayMode");
  BOOL v8 = -[TVDANavigationController destinationDisplayMode](v15, "destinationDisplayMode");
  id location = +[TVDAModeSwitch from:to:](&OBJC_CLASS___TVDAModeSwitch, "from:to:", v9);

  SEL v10 = -[TVDANavigationController presentationRequest](v15, "presentationRequest");
  unsigned __int8 v11 = -[PBSDisplayAssistantPresentationRequest shouldEnableEARC](v10, "shouldEnableEARC");

  [location setShouldEnableEARC:v11 & 1];
  unint64_t v12 = -[TVDANavigationController assistantKind](v15, "assistantKind");
  if (v12 <= 0xB) {
    __asm { BR              X8 }
  }

  stepTracks = v15->_stepTracks;
  objc_super v7 = -[TVDAStepTrack initWithSteps:](objc_alloc(&OBJC_CLASS___TVDAStepTrack), "initWithSteps:", v14[0]);
  -[NSMutableArray addObject:](stepTracks, "addObject:");

  if ([v14[0] count])
  {
    stateMachine = v15->_stateMachine;
    uint64_t v16 = @"MeasurerKey";
    id v5 = [v14[0] firstObject];
    id v4 = [v5 copy];
    id v17 = v4;
    uint64_t v3 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL);
    -[TVSStateMachine postEvent:withContext:userInfo:]( stateMachine,  "postEvent:withContext:userInfo:",  @"KickOffTrackEvent",  0LL);
  }

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v14, 0LL);
}

- (void)_executeNextQueuedMeasurerIfAny
{
  uint64_t v15 = self;
  v14[1] = (id)a2;
  v14[0] = -[NSMutableArray firstObject](self->_queuedMeasurements, "firstObject");
  id v13 = [v14[0] measurement];
  if (v13)
  {
    id v12 = sub_10001A69C();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)v12;
      os_log_type_t type = v11;
      id v8 = [v13 measurementTitle];
      id v10 = v8;
      sub_100009320((uint64_t)v18, (uint64_t)v10);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Dequeuing measure \"%{public}@\"", v18, 0xCu);

      objc_storeStrong(&v10, 0LL);
    }

    objc_storeStrong(&v12, 0LL);
    -[NSMutableArray removeObjectAtIndex:](v15->_queuedMeasurements, "removeObjectAtIndex:", 0LL);
    -[TVDANavigationController _attemptToRunMeasurement:](v15, "_attemptToRunMeasurement:", v14[0]);
  }

  else if (sub_10000C654(-[TVDANavigationController assistantKind](v15, "assistantKind")))
  {
    id v5 = -[TVDANavigationController currentTrack](v15, "currentTrack");
    id v9 = [v5 currentStep];

    if (v9)
    {
      id v4 = -[TVDANavigationController stateMachine](v15, "stateMachine");
      uint64_t v16 = @"MeasurerKey";
      id v3 = [v9 copy];
      id v17 = v3;
      uint64_t v2 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL);
      -[TVSStateMachine postEvent:withContext:userInfo:]( v4,  "postEvent:withContext:userInfo:",  @"ContinueToNextStepEvent",  0LL);
    }

    objc_storeStrong(&v9, 0LL);
  }

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(v14, 0LL);
}

- (void)_enqueueMeasurement:(id)a3
{
  os_log_type_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = [location[0] measurement];
  if (v9)
  {
    os_log_t oslog = (os_log_t)sub_10001A69C();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v4 = type;
      id v5 = [v9 measurementTitle];
      id v6 = v5;
      sub_100009320((uint64_t)v12, (uint64_t)v6);
      _os_log_impl((void *)&_mh_execute_header, log, v4, "Enqueuing measure \"%{public}@\"", v12, 0xCu);

      objc_storeStrong(&v6, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    -[NSMutableArray addObject:](v11->_queuedMeasurements, "addObject:", location[0]);
    -[TVDANavigationController _pushSpinnerViewController](v11, "_pushSpinnerViewController");
  }

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_attemptToRunMeasurement:(id)a3
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVDAStepAction);
  if ((objc_opt_isKindOfClass(v13, v3) & 1) != 0) {
    [location[0] forceRunHandlers];
  }
  id v4 = [location[0] measurement];
  BOOL v12 = v4 == 0LL;

  if (v12)
  {
    id v8 = location[0];
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___TVDAStepAction);
    if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
    {
      id v16 = sub_10001A69C();
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
      {
        log = (os_log_s *)v16;
        os_log_type_t type = v15;
        sub_100002910(v14);
        _os_log_impl((void *)&_mh_execute_header, log, type, "No measurement to take, running action", v14, 2u);
      }

      objc_storeStrong(&v16, 0LL);
      -[TVDANavigationController _runAction:](v18, "_runAction:", location[0]);
    }
  }

  else
  {
    stateMachine = v18->_stateMachine;
    id v19 = @"MeasurerKey";
    id v11 = [location[0] copy];
    id v20 = v11;
    id v10 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL);
    -[TVSStateMachine postEvent:withContext:userInfo:]( stateMachine,  "postEvent:withContext:userInfo:",  @"AttemptingToStartMeasuringEvent",  0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_measure:(id)a3
{
  int v31 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v29 = [location[0] measurement];
  if (v29)
  {
    stateMachine = v31->_stateMachine;
    int v32 = @"MeasurerKey";
    id v6 = [location[0] copy];
    id v33 = v6;
    id v4 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL);
    -[TVSStateMachine postEvent:withContext:userInfo:]( stateMachine,  "postEvent:withContext:userInfo:",  @"StartMeasuringEvent",  0LL);

    objc_initWeak(&from, v31);
    id v3 = v29;
    id v13 = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    id v16 = sub_10000CEAC;
    id v17 = &unk_100028D18;
    objc_copyWeak(&v20, &from);
    id v18 = v31;
    id v19 = location[0];
    [v3 measureWithCompletion:&v13];
    objc_storeStrong(&v19, 0LL);
    objc_storeStrong((id *)&v18, 0LL);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    int v22 = 0;
  }

  else
  {
    id v11 = location[0];
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___TVDAStepAction);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      id v28 = sub_10001A69C();
      os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
      {
        log = (os_log_s *)v28;
        os_log_type_t type = v27;
        sub_100002910(v26);
        _os_log_impl((void *)&_mh_execute_header, log, type, "No measurement to take, running action", v26, 2u);
      }

      objc_storeStrong(&v28, 0LL);
      -[TVDANavigationController _runAction:](v31, "_runAction:", location[0]);
    }

    else
    {
      id v25 = sub_10001A69C();
      os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v7 = (os_log_s *)v25;
        os_log_type_t v8 = v24;
        sub_100002910(v23);
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "No measurement to take", v23, 2u);
      }

      objc_storeStrong(&v25, 0LL);
    }

    int v22 = 1;
  }

  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_runAction:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = [location[0] flow];
  if ((unint64_t)v3 <= 6) {
    __asm { BR              X8 }
  }

  objc_storeStrong(location, 0LL);
}

- (id)_nextStepAfterSerieCompletion
{
  int v55 = self;
  v54[1] = (id)a2;
  uint64_t v48 = 0LL;
  int v49 = &v48;
  int v50 = 838860800;
  int v51 = 48;
  v52 = sub_10000E454;
  id v53 = sub_10000E4A8;
  v54[0] = 0LL;
  id v41 = _NSConcreteStackBlock;
  int v42 = -1073741824;
  int v43 = 0;
  int v44 = sub_10000E4D4;
  v45 = &unk_100028D40;
  v46[0] = self;
  v46[1] = &v48;
  id v47 = objc_retainBlock(&v41);
  v21 = -[TVDANavigationController takenWiFiQualityMeasurements](v55, "takenWiFiQualityMeasurements");
  BOOL v20 = -[NSMutableDictionary count](v21, "count") == 0LL;

  if (!v20)
  {
    id v18 = -[TVDANavigationController takenWiFiQualityMeasurements](v55, "takenWiFiQualityMeasurements");
    unint64_t v19 = +[TVDAWiFiQualityMeasurement resultFromMeasurements:]( &OBJC_CLASS___TVDAWiFiQualityMeasurement,  "resultFromMeasurements:");

    unint64_t v40 = v19;
    id location = sub_10001A69C();
    os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000E5BC((uint64_t)v56, v40);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v38,  "Result from measurements %{public}lu",  v56,  0xCu);
    }

    objc_storeStrong(&location, 0LL);
    if (v40 - 1 <= 3) {
      __asm { BR              X8 }
    }
  }

  if ((id)-[TVDANavigationController assistantKind](v55, "assistantKind") != (id)7)
  {
    if (!sub_10000E5F8(-[TVDANavigationController assistantKind](v55, "assistantKind"))) {
      goto LABEL_31;
    }
    id v29 = _NSConcreteStackBlock;
    int v30 = -1073741824;
    int v31 = 0;
    int v32 = sub_10000E63C;
    id v33 = &unk_100028D68;
    v34 = v55;
    id v35 = v47;
    id v36 = objc_retainBlock(&v29);
    id v28 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
    if (-[TVDANavigationController assistantKind](v55, "assistantKind"))
    {
    }

    else
    {
      if ([v28 lastCablePollStatus] != (id)1 && objc_msgSend(v28, "lastCablePollStatus") != (id)2)
      {
        int v14 = (void (**)(void))v47;
        id v13 =  +[TVDAStepsFactory makeInconclusiveCableWarningSteps]( &OBJC_CLASS___TVDAStepsFactory,  "makeInconclusiveCableWarningSteps");
        v14[2]();

LABEL_30:
        objc_storeStrong(&v28, 0LL);
        objc_storeStrong(&v36, 0LL);
        objc_storeStrong(&v35, 0LL);
        objc_storeStrong((id *)&v34, 0LL);
        goto LABEL_31;
      }

      if ([v28 lastCablePollStatus] != (id)2)
      {
        if (([v28 detectedPoorCableConnection] & 1) != 0
          && [v28 lastCablePollStatus] == (id)1)
        {
          os_log_t oslog = (os_log_t)sub_10001A69C();
          os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            id v11 = oslog;
            os_log_type_t v12 = v26;
            sub_100002910(v25);
            _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "CC: Good cable connection detected afer a bad cable, letting users know we will continue to monitor",  v25,  2u);
          }

          objc_storeStrong((id *)&oslog, 0LL);
          id v10 = (void (**)(void))v47;
          id v9 =  +[TVDAStepsFactory makeCableCautiousSuccessSteps]( &OBJC_CLASS___TVDAStepsFactory,  "makeCableCautiousSuccessSteps");
          v10[2]();
        }

        else if (!v49[5])
        {
          os_log_t v24 = (os_log_t)sub_10001A69C();
          os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_super v7 = v24;
            os_log_type_t v8 = v23;
            sub_100002910(v22);
            _os_log_impl((void *)&_mh_execute_header, v7, v8, "CC: Good cable connection detected", v22, 2u);
          }

          objc_storeStrong((id *)&v24, 0LL);
          id v6 = (void (**)(void))v47;
          id v5 = +[TVDAStepsFactory makeCableSuccessSteps](&OBJC_CLASS___TVDAStepsFactory, "makeCableSuccessSteps");
          v6[2]();

          [v28 removeCableCheckHistory];
        }

        goto LABEL_30;
      }
    }

    (*((void (**)(void))v36 + 2))();
    goto LABEL_30;
  }

  uint64_t v2 = -[TVDANavigationController eARCMeasuremntError](v55, "eARCMeasuremntError");
  BOOL v17 = v2 == 0LL;

  if (v17)
  {
    unint64_t v37 = -[TVDANavigationController eARCStatus](v55, "eARCStatus");
    -[TVDANavigationController setEARCStatus:](v55, "setEARCStatus:", 0LL);
    if (v37 <= 4) {
      __asm { BR              X8 }
    }
  }

  else
  {
    -[TVDANavigationController setEARCMeasuremntError:](v55, "setEARCMeasuremntError:", 0LL);
    id v16 = (void (**)(void))v47;
    id v15 = +[TVDAStepsFactory makeEARCErrorSteps](&OBJC_CLASS___TVDAStepsFactory, "makeEARCErrorSteps");
    v16[2]();
  }

- (void)_goBackToPreviousStepForAction:(id)a3
{
  uint64_t v48 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v39 = _NSConcreteStackBlock;
  int v40 = -1073741824;
  int v41 = 0;
  int v42 = sub_10000EE90;
  int v43 = &unk_100028D90;
  int v44 = v48;
  id v45 = location[0];
  id v46 = objc_retainBlock(&v39);
  id v3 = -[NSMutableArray count](v48->_seenStepDisplayModePairs, "count");
  char v36 = 0;
  BOOL v22 = 0;
  if ((unint64_t)v3 > 1)
  {
    id v37 = -[TVDANavigationController viewControllers](v48, "viewControllers");
    char v36 = 1;
    BOOL v22 = (unint64_t)[v37 count] > 1;
  }

  BOOL v38 = v22;
  if ((v36 & 1) != 0) {

  }
  if (v38)
  {
    id v34 = 0LL;
    id v20 = -[TVDANavigationController viewControllers](v48, "viewControllers");
    v21 = (char *)[v20 count] - 2;

    for (uint64_t i = (uint64_t)v21; i >= 0; --i)
    {
      id v17 = -[TVDANavigationController viewControllers](v48, "viewControllers");
      id v4 = [v17 objectAtIndexedSubscript:i];
      id v5 = v34;
      id v34 = v4;

      id v18 = (id)objc_opt_self(&OBJC_CLASS___TVDAStepAlertController);
      char isKindOfClass = objc_opt_isKindOfClass(v34, v18);

      if ((isKindOfClass & 1) != 0) {
        break;
      }
    }

    id v15 = (id)objc_opt_self(&OBJC_CLASS___TVDASpinnerViewController);
    char v16 = objc_opt_isKindOfClass(v34, v15);

    if ((v16 & 1) != 0)
    {
      (*((void (**)(void))v46 + 2))();
      int v35 = 1;
    }

    else
    {
      id v32 = -[TVDANavigationController currentTrack](v48, "currentTrack");
      if ([v32 currentStepIndex] != 0)
      {
        int v30 = (char *)-[NSMutableArray count](v48->_seenStepDisplayModePairs, "count");
        id v29 =  -[NSMutableArray objectAtIndexedSubscript:]( v48->_seenStepDisplayModePairs,  "objectAtIndexedSubscript:",  v30 - 2);
        id v28 = [v29 step];
        id v14 = [v32 steps];
        id v27 = objc_msgSend(v14, "objectAtIndex:", (char *)objc_msgSend( v32,  "currentStepIndex") - 1);

        if ([v28 isEqual:v27])
        {
          [v32 decrementCurrentIndexIfPossible];
          id v8 = [v29 displayMode];
          +[TVDADisplayUpdater updateDisplayWithMode:reason:error:]( &OBJC_CLASS___TVDADisplayUpdater,  "updateDisplayWithMode:reason:error:");

          -[NSMutableArray removeLastObject](v48->_seenStepDisplayModePairs, "removeLastObject");
          id v6 =  -[TVDANavigationController popToViewController:animated:]( v48,  "popToViewController:animated:",  v34,  1LL);
          if (![v32 currentStepIndex]) {
            -[TVDANavigationController setNumVideoResetSeenInCableCheck:](v48, "setNumVideoResetSeenInCableCheck:", 0LL);
          }
        }

        else
        {
          id v26 = sub_10001A69C();
          char v25 = 16;
          if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
          {
            log = (os_log_s *)v26;
            os_log_type_t type = v25;
            id v13 = [v28 debugDescription];
            id v9 = v13;
            id v24 = v9;
            id v12 = [v27 debugDescription];
            id v23 = v12;
            sub_1000024B4((uint64_t)v49, (uint64_t)v9, (uint64_t)v23);
            _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "Cannot go back to previous step, breadcrumb trail is wrong for %{public}@. We are expecting %{public}@",  v49,  0x16u);

            objc_storeStrong(&v23, 0LL);
            objc_storeStrong(&v24, 0LL);
          }

          objc_storeStrong(&v26, 0LL);
        }

        objc_storeStrong(&v27, 0LL);
        objc_storeStrong(&v28, 0LL);
        objc_storeStrong(&v29, 0LL);
      }

      else if (-[NSMutableArray count](v48->_stepTracks, "count"))
      {
        -[NSMutableArray removeLastObject](v48->_stepTracks, "removeLastObject");
        id v7 = -[TVDANavigationController popToViewController:animated:](v48, "popToViewController:animated:", v34, 1LL);
      }

      else
      {
        (*((void (**)(void))v46 + 2))();
      }

      objc_storeStrong(&v32, 0LL);
      int v35 = 0;
    }

    objc_storeStrong(&v34, 0LL);
  }

  else
  {
    (*((void (**)(void))v46 + 2))();
    int v35 = 1;
  }

  objc_storeStrong(&v46, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong((id *)&v44, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_pushSpinnerViewController
{
  id v6 = self;
  v5[1] = (id)a2;
  id v3 = -[TVDANavigationController topViewController](self, "topViewController");
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVDASpinnerViewController);
  BOOL v4 = (objc_opt_isKindOfClass(v3, v2) & 1) != 0;

  if (!v4)
  {
    v5[0] = objc_alloc_init(&OBJC_CLASS___TVDASpinnerViewController);
    -[TVDANavigationController pushViewController:animated:](v6, "pushViewController:animated:", v5[0], 1LL);
    objc_storeStrong(v5, 0LL);
  }

- (void)_pushViewControllerForStep:(id)a3
{
  int v43 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v43);
  id v25 = -[TVDANavigationController currentTrack](v43, "currentTrack");
  id v40 = [v25 currentStep];

  id v39 = 0LL;
  id v24 = location[0];
  id v22 = (id)objc_opt_self(&OBJC_CLASS___TVDAUserStep);
  char isKindOfClass = objc_opt_isKindOfClass(v24, v22);

  if ((isKindOfClass & 1) != 0)
  {
    seenStepDisplayModePairs = v43->_seenStepDisplayModePairs;
    id v20 = -[_TVDAStepDisplayModePair initWithStep:]( objc_alloc(&OBJC_CLASS____TVDAStepDisplayModePair),  "initWithStep:",  v40);
    -[NSMutableArray addObject:](seenStepDisplayModePairs, "addObject:", v20);

    unint64_t v19 = objc_alloc(&OBJC_CLASS___TVDAStepAlertController);
    id v18 = location[0];
    id v33 = _NSConcreteStackBlock;
    int v34 = -1073741824;
    int v35 = 0;
    char v36 = sub_10000F6D4;
    id v37 = &unk_100028DB8;
    objc_copyWeak(&v38, &from);
    id v17 = -[TVDAStepAlertController initWithStep:actionFlowHandler:](v19, "initWithStep:actionFlowHandler:", v18, &v33);
    id v3 = v39;
    id v39 = v17;

    objc_destroyWeak(&v38);
  }

  else
  {
    id v16 = location[0];
    id v14 = (id)objc_opt_self(&OBJC_CLASS___TVDALoadingStep);
    char v15 = objc_opt_isKindOfClass(v16, v14);

    if ((v15 & 1) != 0)
    {
      if (![location[0] menuBehavior])
      {
        id v13 = v43->_seenStepDisplayModePairs;
        id v12 = -[_TVDAStepDisplayModePair initWithStep:]( objc_alloc(&OBJC_CLASS____TVDAStepDisplayModePair),  "initWithStep:",  v40);
        -[NSMutableArray addObject:](v13, "addObject:", v12);
      }

      id v11 = objc_alloc(&OBJC_CLASS___TVDASpinnerViewController);
      id v10 = location[0];
      id v26 = _NSConcreteStackBlock;
      int v27 = -1073741824;
      int v28 = 0;
      id v29 = sub_10000F800;
      int v30 = &unk_100028DE0;
      objc_copyWeak(&v32, &from);
      id v31 = location[0];
      id v9 = -[TVDASpinnerViewController initWithLoadingStep:completion:]( v11,  "initWithLoadingStep:completion:",  v10,  &v26);
      id v4 = v39;
      id v39 = v9;

      objc_storeStrong(&v31, 0LL);
      objc_destroyWeak(&v32);
    }
  }

  id v8 = -[TVDANavigationController viewControllers](v43, "viewControllers");
  BOOL v7 = [v8 count] != 0;

  if (v7)
  {
    -[TVDANavigationController pushViewController:animated:](v43, "pushViewController:animated:", v39, 1LL);
  }

  else
  {
    id v6 = v43;
    id v44 = v39;
    id v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v44, 1LL);
    -[TVDANavigationController setViewControllers:animated:](v6, "setViewControllers:animated:");
  }

  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0LL);
}

- (void)_dismissDisplayAssistant
{
  id v3 = self;
  location[1] = (id)a2;
  location[0] = -[TVDANavigationController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(location[0], "navigationControllerDidComplete:") & 1) != 0) {
    [location[0] navigationControllerDidComplete:v3];
  }
  objc_storeStrong(location, 0LL);
}

- (void)_updateInternalLabelIfNeededForViewController:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] conformsToProtocol:&OBJC_PROTOCOL___TVDAInternalStepViewControllerDescribing])
  {
    id v9 = -[TVDANavigationController topViewController](v11, "topViewController");
    id v3 = objc_alloc(&OBJC_CLASS___NSString);
    id v6 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
    id v5 = -[PBSDisplayManager currentDisplayMode](v6, "currentDisplayMode");
    id v4 = [v5 localizedDisplayString];
    id v8 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"Current Mode: %@\nPlease file a radar on Apple TV | New Bugs if you believe that this assistant is:\n\t- alerting you of non-existing problems\n\t- not alerting you of existing problems",  v4);

    id v7 = [v9 internalDescriptionLabel];
    [v7 setText:v8];

    objc_storeStrong((id *)&v8, 0LL);
    objc_storeStrong(&v9, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_handleMenuPress:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  int v61 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v59 = 0LL;
  objc_storeStrong(&v59, a4);
  id v58 = 0LL;
  objc_storeStrong(&v58, a5);
  v57 = a6;
  if (a6 != off_100031148)
  {
    v40.receiver = v61;
    v40.super_class = (Class)&OBJC_CLASS___TVDANavigationController;
    -[TVDANavigationController observeValueForKeyPath:ofObject:change:context:]( &v40,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v59,  v58,  v57);
LABEL_35:
    int v54 = 0;
    goto LABEL_36;
  }

  id v56 = -[TVDANavigationController currentTrack](v61, "currentTrack");
  id v55 = [v58 objectForKey:NSKeyValueChangeNewKey];
  id v35 = (id)objc_opt_self(&OBJC_CLASS___PBSDisplayMode);
  char isKindOfClass = objc_opt_isKindOfClass(v55, v35);

  if ((isKindOfClass & 1) != 0)
  {
    id v32 = [v56 currentStepIndex];
    id v33 = [v56 steps];
    BOOL v34 = v32 < [v33 count];

    if (v34)
    {
      int v28 = v61;
      id v29 = -[TVDANavigationController topViewController](v61, "topViewController");
      -[TVDANavigationController _updateInternalLabelIfNeededForViewController:]( v28,  "_updateInternalLabelIfNeededForViewController:");

      id v53 = [v56 currentStep];
      id v30 = (id)objc_opt_self(&OBJC_CLASS___TVDAUserStep);
      unsigned __int8 v31 = 0;
      if ((objc_opt_isKindOfClass(v53, v30) & 1) != 0) {
        unsigned __int8 v31 = [v53 hasActionWithTimer];
      }

      if ((v31 & 1) != 0)
      {
        id v26 = -[TVDANavigationController destinationDisplayMode](v61, "destinationDisplayMode");
        unsigned __int8 v27 = -[PBSDisplayMode isEqual:](v26, "isEqual:", v55);

        if ((v27 & 1) != 0)
        {
          memset(__b, 0, sizeof(__b));
          id v17 = [v53 actions];
          id v18 = [v17 countByEnumeratingWithState:__b objects:v67 count:16];
          if (v18)
          {
            uint64_t v14 = *(void *)__b[2];
            uint64_t v15 = 0LL;
            id v16 = v18;
            while (1)
            {
              uint64_t v13 = v15;
              if (*(void *)__b[2] != v14) {
                objc_enumerationMutation(v17);
              }
              id v50 = *(id *)(__b[1] + 8 * v15);
              [v50 idleSecondsToTrigger];
              if (v6 >= 0.0) {
                [v50 resetTimer];
              }
              ++v15;
              if (v13 + 1 >= (unint64_t)v16)
              {
                uint64_t v15 = 0LL;
                id v16 = [v17 countByEnumeratingWithState:__b objects:v67 count:16];
                if (!v16) {
                  break;
                }
              }
            }
          }
        }

        else
        {
          unint64_t v19 = objc_alloc(&OBJC_CLASS___NSString);
          id v20 = -[TVDANavigationController destinationDisplayMode](v61, "destinationDisplayMode");
          v52 = -[NSString initWithFormat:]( v19,  "initWithFormat:",  @"Unexpected switch to mode %@ when trying %@",  v55,  v20);

          v21 = objc_alloc(&OBJC_CLASS___NSError);
          NSErrorUserInfoKey v70 = NSLocalizedFailureReasonErrorKey;
          id v71 = v52;
          id v22 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v71,  &v70,  1LL);
          int v51 = -[NSError initWithDomain:code:userInfo:]( v21,  "initWithDomain:code:userInfo:",  @"com.apple.TVDisplayAssistant.errors",  842002LL);

          id v25 = -[TVDANavigationController stateMachine](v61, "stateMachine");
          v68[0] = @"MeasurerKey";
          id v24 = [v53 copy];
          v69[0] = v24;
          v68[1] = @"ErrorKey";
          v69[1] = v51;
          id v23 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  2LL);
          -[TVSStateMachine postEvent:withContext:userInfo:]( v25,  "postEvent:withContext:userInfo:",  @"ModeSwitchFailedEvent");

          objc_storeStrong((id *)&v51, 0LL);
          objc_storeStrong((id *)&v52, 0LL);
        }
      }

      else
      {
        char v47 = 0;
        char v12 = 0;
        if (!-[TVDANavigationController assistantKind](v61, "assistantKind"))
        {
          id v48 = (id)objc_opt_self(&OBJC_CLASS___TVDALoadingStep);
          char v47 = 1;
          char v12 = objc_opt_isKindOfClass(v53, v48);
        }

        if ((v47 & 1) != 0) {

        }
        if ((v12 & 1) != 0)
        {
          id v46 = v53;
          int v45 = -[TVDANavigationController numVideoResetSeenInCableCheck](v61, "numVideoResetSeenInCableCheck");
          if (v45 < 2)
          {
            [v46 restart];
            -[TVDANavigationController setNumVideoResetSeenInCableCheck:]( v61,  "setNumVideoResetSeenInCableCheck:",  (v45 + 1));
            os_log_t oslog = (os_log_t)sub_10001A69C();
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              sub_100006858( (uint64_t)v62,  -[TVDANavigationController numVideoResetSeenInCableCheck](v61, "numVideoResetSeenInCableCheck"));
              _os_log_impl( (void *)&_mh_execute_header,  oslog,  type,  "Resetting Cable Check timer due to an unexpected video start. This is #%i",  v62,  8u);
            }

            objc_storeStrong((id *)&oslog, 0LL);
          }

          else
          {
            [v46 cancel];
            id v44 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Too many (%i) video start/stop events during Cable Check.",  v45);
            id v7 = objc_alloc(&OBJC_CLASS___NSError);
            NSErrorUserInfoKey v65 = NSLocalizedFailureReasonErrorKey;
            v66 = v44;
            id v8 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v66,  &v65,  1LL);
            int v43 = -[NSError initWithDomain:code:userInfo:]( v7,  "initWithDomain:code:userInfo:",  @"com.apple.TVDisplayAssistant.errors",  842003LL);

            id v11 = -[TVDANavigationController stateMachine](v61, "stateMachine");
            v63[0] = @"MeasurerKey";
            id v10 = [v53 copy];
            v64[0] = v10;
            v63[1] = @"ErrorKey";
            v64[1] = v43;
            id v9 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  2LL);
            -[TVSStateMachine postEvent:withContext:userInfo:]( v11,  "postEvent:withContext:userInfo:",  @"TooManyVideoDropsEvent");

            objc_storeStrong((id *)&v43, 0LL);
            objc_storeStrong((id *)&v44, 0LL);
          }

          objc_storeStrong(&v46, 0LL);
        }
      }

      objc_storeStrong(&v53, 0LL);
      int v54 = 0;
    }

    else
    {
      int v54 = 1;
    }
  }

  else
  {
    int v54 = 1;
  }

  objc_storeStrong(&v55, 0LL);
  objc_storeStrong(&v56, 0LL);
  if (!v54) {
    goto LABEL_35;
  }
LABEL_36:
  objc_storeStrong(&v58, 0LL);
  objc_storeStrong(&v59, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (NSMutableArray)stepTracks
{
  return self->_stepTracks;
}

- (void)setStepTracks:(id)a3
{
}

- (NSMutableArray)queuedMeasurements
{
  return self->_queuedMeasurements;
}

- (void)setQueuedMeasurements:(id)a3
{
}

- (TVDAMeasurable)currentMeasurement
{
  return self->_currentMeasurement;
}

- (void)setCurrentMeasurement:(id)a3
{
}

- (NSMutableDictionary)takenWiFiQualityMeasurements
{
  return self->_takenWiFiQualityMeasurements;
}

- (void)setTakenWiFiQualityMeasurements:(id)a3
{
}

- (NSError)eARCMeasuremntError
{
  return self->_eARCMeasuremntError;
}

- (void)setEARCMeasuremntError:(id)a3
{
}

- (int64_t)eARCStatus
{
  return self->_eARCStatus;
}

- (void)setEARCStatus:(int64_t)a3
{
  self->_eARCStatus = a3;
}

- (PBSDisplayAssistantPresentationRequest)presentationRequest
{
  return self->_presentationRequest;
}

- (void)setPresentationRequest:(id)a3
{
}

- (int)numVideoResetSeenInCableCheck
{
  return self->_numVideoResetSeenInCableCheck;
}

- (void)setNumVideoResetSeenInCableCheck:(int)a3
{
  self->_numVideoResetSeenInCableCheck = a3;
}

- (void).cxx_destruct
{
}

@end