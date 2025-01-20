@interface PBWindowManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)isShowingBaseUIOnly;
- (BOOL)isShowingWallpaperOnly;
- (BOOL)shouldForwardSystemAppEvent;
- (BSMutableIntegerMap)layoutLevelToPresentationElement;
- (BSMutableIntegerMap)layoutLevelToWindow;
- (NSMutableDictionary)identifierToDisplayElementAssertions;
- (NSMutableDictionary)identifierToDisplayTransitionAssertions;
- (PBDisplayLayoutElementHandle)pipDisplayLayoutElementHandle;
- (PBPresentationElementFocusCoordinator)focusCoordinator;
- (PBSceneLayoutDebugWindow)uiLayoutDebugWindow;
- (PBUIDebugWindow)uiDebugWindow;
- (PBWindowManager)init;
- (PBWorkspaceWindowSceneProviding)windowSceneProvider;
- (PLDisplayLayoutRepublisher)displayLayoutRepublisher;
- (UIWindow)activeWindow;
- (id)_displayLayoutElementForOverlayLevel:(int64_t)a3;
- (id)_displayLayoutElementForSceneLayoutElement:(id)a3;
- (id)_windowForLayoutLevel:(int64_t)a3 createIfNeeded:(BOOL)a4;
- (id)windowForLayoutLevel:(int64_t)a3;
- (int64_t)activeLayoutLevel;
- (void)_addDisplayLayoutElement:(id)a3;
- (void)_handleDisplayElementUpdate;
- (void)_removeDisplayLayoutElementWithIdentifier:(id)a3;
- (void)_setNeedsRemoteEventDeferringRuleComparisonForWindow:(id)a3 withReason:(id)a4;
- (void)_updateUIDebugWindow;
- (void)_updateUILayoutDebugWindow;
- (void)dealloc;
- (void)dismissSystemUIAtLevel:(int64_t)a3 animated:(BOOL)a4 transitionBlock:(id)a5;
- (void)displayLayoutElementHandle:(id)a3 didUpdateElement:(id)a4 withReason:(id)a5;
- (void)hideSystemUIAtLevel:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)invalidateSystemUIAtLevel:(int64_t)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareDebugWindows;
- (void)presentSceneLayoutWindow;
- (void)presentSystemUI:(id)a3 withContext:(id)a4 animated:(BOOL)a5 transitionBlock:(id)a6;
- (void)presentationElementFocusCoordinator:(id)a3 didUpdateToActiveLayoutLevel:(int64_t)a4 fromLevel:(int64_t)a5;
- (void)sceneLayoutViewController:(id)a3 didEndTransitionForTransitionElement:(id)a4 forReason:(id)a5;
- (void)sceneLayoutViewController:(id)a3 didRemoveTransitionElement:(id)a4;
- (void)sceneLayoutViewController:(id)a3 didStartTransitionForTransitionElement:(id)a4 forReason:(id)a5;
- (void)sceneLayoutViewControllerWillUpdateFocus:(id)a3 toTransitionElement:(id)a4 fromTransitionElement:(id)a5 forReason:(id)a6;
- (void)setActiveLayoutLevel:(int64_t)a3;
- (void)setIdentifierToDisplayElementAssertions:(id)a3;
- (void)setIdentifierToDisplayTransitionAssertions:(id)a3;
- (void)setLayoutLevelToPresentationElement:(id)a3;
- (void)setLayoutLevelToWindow:(id)a3;
- (void)unhideSystemUIAtLevel:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation PBWindowManager

+ (PBDependencyDescription)dependencyDescription
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10007D7F8;
  v3[3] = &unk_1003CFF78;
  v3[4] = a1;
  return  -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v3);
}

+ (id)sharedInstance
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10007D890;
  v3[3] = &unk_1003D32B0;
  v3[4] = a2;
  void v3[5] = a1;
  if (qword_1004702C0 != -1) {
    dispatch_once(&qword_1004702C0, v3);
  }
  return (id)qword_1004702B8;
}

- (PBWindowManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PBWindowManager;
  v3 = -[PBWindowManager init](&v19, "init");
  if (!v3) {
    return v3;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 mainWorkspace]);
  windowSceneProvider = v3->_windowSceneProvider;
  v3->_windowSceneProvider = (PBWorkspaceWindowSceneProviding *)v5;

  if (v3->_windowSceneProvider)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___BSMutableIntegerMap);
    layoutLevelToWindow = v3->_layoutLevelToWindow;
    v3->_layoutLevelToWindow = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___BSMutableIntegerMap);
    layoutLevelToPresentationElement = v3->_layoutLevelToPresentationElement;
    v3->_layoutLevelToPresentationElement = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    identifierToDisplayElementAssertions = v3->_identifierToDisplayElementAssertions;
    v3->_identifierToDisplayElementAssertions = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    identifierToDisplayTransitionAssertions = v3->_identifierToDisplayTransitionAssertions;
    v3->_identifierToDisplayTransitionAssertions = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___PBPresentationElementFocusCoordinator);
    focusCoordinator = v3->_focusCoordinator;
    v3->_focusCoordinator = v15;

    -[PBPresentationElementFocusCoordinator addObserver:](v3->_focusCoordinator, "addObserver:", v3);
    +[_UIEventDeferringManager setSystemShellBehaviorDelegate:]( &OBJC_CLASS____UIEventDeferringManager,  "setSystemShellBehaviorDelegate:",  v3->_focusCoordinator);
    return v3;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_windowSceneProvider != nil"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100277B50(a2, (uint64_t)v3, (uint64_t)v18);
  }
  result = (PBWindowManager *)_bs_set_crash_log_message([v18 UTF8String]);
  __break(0);
  return result;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v3 removeObserver:self forKeyPath:@"ShowUIDebug"];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v4 removeObserver:self forKeyPath:@"ShowExternalControlDebug"];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v5 removeObserver:self forKeyPath:@"ShowUILayoutDebug"];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBWindowManager;
  -[PBWindowManager dealloc](&v6, "dealloc");
}

- (BOOL)shouldForwardSystemAppEvent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[BSMutableIntegerMap objectForKey:]( self->_layoutLevelToPresentationElement,  "objectForKey:",  -[PBPresentationElementFocusCoordinator activeLayoutLevel]( self->_focusCoordinator,  "activeLayoutLevel")));
  unsigned __int8 v3 = [v2 shouldForwardHIDEvents];

  return v3;
}

- (UIWindow)activeWindow
{
  return (UIWindow *)(id)objc_claimAutoreleasedReturnValue( -[BSMutableIntegerMap objectForKey:]( self->_layoutLevelToWindow,  "objectForKey:",  -[PBPresentationElementFocusCoordinator activeLayoutLevel]( self->_focusCoordinator,  "activeLayoutLevel")));
}

- (void)setActiveLayoutLevel:(int64_t)a3
{
  if (self->_activeLayoutLevel != a3)
  {
    self->_activeLayoutLevel = a3;
    -[PBWindowManager _handleDisplayElementUpdate](self, "_handleDisplayElementUpdate");
  }

- (void)presentSceneLayoutWindow
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBSceneLayoutViewController sceneLayoutViewControllerForMainDisplay]( &OBJC_CLASS___PBSceneLayoutViewController,  "sceneLayoutViewControllerForMainDisplay"));
  [v3 setDisplayPublisherDelegate:self];
  v4 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayContext);
  -[PBMutableSystemOverlayContext setLayoutLevel:](v4, "setLayoutLevel:", 1LL);
  id v5 = -[PBMutableSystemOverlayContext copy](v4, "copy");
  -[PBWindowManager presentSystemUI:withContext:animated:transitionBlock:]( self,  "presentSystemUI:withContext:animated:transitionBlock:",  v3,  v5,  0LL,  0LL);
}

- (id)windowForLayoutLevel:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBWindowManager _windowForLayoutLevel:createIfNeeded:]( self,  "_windowForLayoutLevel:createIfNeeded:",  a3,  0LL));
}

- (BOOL)isShowingBaseUIOnly
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBWindowManager focusCoordinator](self, "focusCoordinator"));
  if ([v3 activeLayoutLevel])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBWindowManager focusCoordinator](self, "focusCoordinator"));
    BOOL v5 = [v4 activeLayoutLevel] == (id)1;
  }

  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)isShowingWallpaperOnly
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBWindowManager focusCoordinator](self, "focusCoordinator"));
  BOOL v3 = [v2 activeLayoutLevel] == 0;

  return v3;
}

- (void)presentationElementFocusCoordinator:(id)a3 didUpdateToActiveLayoutLevel:(int64_t)a4 fromLevel:(int64_t)a5
{
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_layoutLevelToWindow, "objectForKey:", a4));
  [v8 setNeedsFocusUpdate];
  [v8 makeKeyWindow];
  uint64_t v9 = sub_1001A3184(a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = sub_1001A3184(a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ActiveLayoutLevelChange(from: %@, to: %@)",  v10,  v12));

  -[PBWindowManager _setNeedsRemoteEventDeferringRuleComparisonForWindow:withReason:]( self,  "_setNeedsRemoteEventDeferringRuleComparisonForWindow:withReason:",  v8,  v13);
  -[PBWindowManager setActiveLayoutLevel:](self, "setActiveLayoutLevel:", a4);
}

- (void)sceneLayoutViewControllerWillUpdateFocus:(id)a3 toTransitionElement:(id)a4 fromTransitionElement:(id)a5 forReason:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[FBMainDisplayLayoutPublisher sharedInstance]( &OBJC_CLASS___FBMainDisplayLayoutPublisher,  "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 transitionAssertionWithReason:v9]);

  v14 = sub_10007DE90(v10, 0LL);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  -[PBWindowManager _removeDisplayLayoutElementWithIdentifier:](self, "_removeDisplayLayoutElementWithIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[PBWindowManager _displayLayoutElementForSceneLayoutElement:]( self,  "_displayLayoutElementForSceneLayoutElement:",  v11));

  -[PBWindowManager _addDisplayLayoutElement:](self, "_addDisplayLayoutElement:", v16);
  [v13 invalidate];
}

- (void)sceneLayoutViewController:(id)a3 didRemoveTransitionElement:(id)a4
{
  BOOL v5 = sub_10007DE90(a4, 0LL);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[PBWindowManager _removeDisplayLayoutElementWithIdentifier:](self, "_removeDisplayLayoutElementWithIdentifier:", v6);
}

- (void)sceneLayoutViewController:(id)a3 didStartTransitionForTransitionElement:(id)a4 forReason:(id)a5
{
  id v7 = a5;
  v8 = sub_10007DE90(a4, v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_identifierToDisplayTransitionAssertions,  "objectForKey:",  v9));
  if (v10)
  {
    id v11 = sub_100084950();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_100277C4C((uint64_t)v9, v12);
    }

    [v10 invalidate];
    -[NSMutableDictionary removeObjectForKey:]( self->_identifierToDisplayTransitionAssertions,  "removeObjectForKey:",  v9);
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[FBMainDisplayLayoutPublisher sharedInstance]( &OBJC_CLASS___FBMainDisplayLayoutPublisher,  "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 transitionAssertionWithReason:v7]);

    -[NSMutableDictionary setObject:forKey:]( self->_identifierToDisplayTransitionAssertions,  "setObject:forKey:",  v14,  v9);
  }
}

- (void)sceneLayoutViewController:(id)a3 didEndTransitionForTransitionElement:(id)a4 forReason:(id)a5
{
  objc_super v6 = sub_10007DE90(a4, a5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_identifierToDisplayTransitionAssertions,  "objectForKey:",  v7));
  id v9 = v8;
  if (v8)
  {
    [v8 invalidate];
    -[NSMutableDictionary removeObjectForKey:]( self->_identifierToDisplayTransitionAssertions,  "removeObjectForKey:",  v7);
  }
}

- (void)displayLayoutElementHandle:(id)a3 didUpdateElement:(id)a4 withReason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifierToDisplayElementAssertions, "objectForKey:", v11));
  if (v12)
  {
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[FBMainDisplayLayoutPublisher sharedInstance]( &OBJC_CLASS___FBMainDisplayLayoutPublisher,  "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 transitionAssertionWithReason:v10]);
    [v13 invalidate];
    -[NSMutableDictionary removeObjectForKey:](self->_identifierToDisplayElementAssertions, "removeObjectForKey:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v14 addElement:v9]);

    -[NSMutableDictionary setObject:forKey:](self->_identifierToDisplayElementAssertions, "setObject:forKey:", v16, v11);
    [v15 invalidate];
  }

  else
  {
    id v17 = sub_100084950();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100277CBC((uint64_t)v11, v18, v19, v20, v21, v22, v23, v24);
    }

    [v8 invalidate];
  }
}

- (void)presentSystemUI:(id)a3 withContext:(id)a4 animated:(BOOL)a5 transitionBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v11 layoutLevel];
  id v14 = sub_100084950();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Present UI at level: %lu", buf, 0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( -[PBWindowManager _windowForLayoutLevel:createIfNeeded:]( self,  "_windowForLayoutLevel:createIfNeeded:",  v13,  1LL));
  [v16 setHidden:0];
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_layoutLevelToPresentationElement, "objectForKey:", v13));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 sceneDeactivationManager]);
  [v19 addAndAcquireDeactivationAssertionsWithContext:v11];

  objc_initWeak((id *)buf, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10007E424;
  v21[3] = &unk_1003D3300;
  objc_copyWeak(v23, (id *)buf);
  v23[1] = v13;
  id v20 = v12;
  id v22 = v20;
  [v17 setContentViewController:v10 animated:v7 transitionBlock:v21];

  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);
}

- (void)dismissSystemUIAtLevel:(int64_t)a3 animated:(BOOL)a4 transitionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = sub_100084950();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v20 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Dismiss UI at level: %lu", buf, 0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_layoutLevelToPresentationElement, "objectForKey:", a3));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_layoutLevelToWindow, "objectForKey:", a3));
  objc_initWeak((id *)buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007E764;
  v15[3] = &unk_1003D3350;
  objc_copyWeak(v18, (id *)buf);
  v18[1] = (id)a3;
  id v13 = v12;
  id v16 = v13;
  id v14 = v8;
  id v17 = v14;
  [v11 setContentViewController:0 animated:v5 transitionBlock:v15];

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);
}

- (void)hideSystemUIAtLevel:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(void))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBWindowManager _windowForLayoutLevel:createIfNeeded:]( self,  "_windowForLayoutLevel:createIfNeeded:",  a3,  0LL));
  if (v9)
  {
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10007EBB8;
    v22[3] = &unk_1003D3378;
    objc_copyWeak(v24, &location);
    v24[1] = (id)a3;
    id v10 = v9;
    id v23 = v10;
    BOOL v25 = v5;
    id v11 = objc_retainBlock(v22);
    id v12 = v11;
    if (v5)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[FBMainDisplayLayoutPublisher sharedInstance]( &OBJC_CLASS___FBMainDisplayLayoutPublisher,  "sharedInstance"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 transitionAssertionWithReason:@"Hiding overlay transition"]);

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_10007ECF0;
      v20[3] = &unk_1003CFF08;
      id v21 = v10;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10007ED0C;
      v16[3] = &unk_1003D33A0;
      v18 = v12;
      id v15 = v14;
      id v17 = v15;
      uint64_t v19 = v8;
      +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0LL,  v20,  v16,  0.25,  0.0);
    }

    else
    {
      ((void (*)(void *, uint64_t))v11[2])(v11, 1LL);
      if (v8) {
        v8[2](v8);
      }
    }

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
}

- (void)unhideSystemUIAtLevel:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(void))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBWindowManager _windowForLayoutLevel:createIfNeeded:]( self,  "_windowForLayoutLevel:createIfNeeded:",  a3,  0LL));
  id v10 = v9;
  if (v9)
  {
    [v9 setHidden:0];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sceneDeactivationManager]);
    [v12 acquireDeactivationAssertionsAtLevel:a3];

    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBWindowManager _displayLayoutElementForOverlayLevel:]( self,  "_displayLayoutElementForOverlayLevel:",  a3));
    if (v5)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[FBMainDisplayLayoutPublisher sharedInstance]( &OBJC_CLASS___FBMainDisplayLayoutPublisher,  "sharedInstance"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 transitionAssertionWithReason:@"Unhiding overlay transition"]);

      objc_initWeak(&location, self);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_10007EF68;
      v22[3] = &unk_1003CFF08;
      id v23 = v10;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_10007EF84;
      v17[3] = &unk_1003D33C8;
      objc_copyWeak(&v21, &location);
      id v18 = v13;
      id v16 = v15;
      id v19 = v16;
      int64_t v20 = v8;
      +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  0LL,  v22,  v17,  0.25,  0.0);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }

    else
    {
      -[PBWindowManager _addDisplayLayoutElement:](self, "_addDisplayLayoutElement:", v13);
      if (v8) {
        v8[2](v8);
      }
    }
  }
}

- (void)invalidateSystemUIAtLevel:(int64_t)a3
{
  id v5 = sub_100084950();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    int64_t v19 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Invalidate UI at level: %lu",  (uint8_t *)&v18,  0xCu);
  }

  BOOL v7 = sub_10007E980(a3);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[PBWindowManager _removeDisplayLayoutElementWithIdentifier:](self, "_removeDisplayLayoutElementWithIdentifier:", v8);

  if ((unint64_t)a3 >= 3)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_layoutLevelToPresentationElement, "objectForKey:", a3));
    id v10 = v9;
    if (v9)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_layoutLevelToWindow, "objectForKey:", a3));
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      [v12 _cancelGestureRecognizersForView:v11];

      [v11 windowLevel];
      [v11 setHidden:v13 > UIWindowLevelNormal];
      -[PBPresentationElementFocusCoordinator _deregisterForFocusCoordination:]( self->_focusCoordinator,  "_deregisterForFocusCoordination:",  v10);
      -[BSMutableIntegerMap removeObjectForKey:](self->_layoutLevelToPresentationElement, "removeObjectForKey:", a3);
      -[BSMutableIntegerMap removeObjectForKey:](self->_layoutLevelToWindow, "removeObjectForKey:", a3);
      id v14 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayContext);
      -[PBMutableSystemOverlayContext setLayoutLevel:](v14, "setLayoutLevel:", a3);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 sceneDeactivationManager]);
      [v16 removeAndRelinquishDeactivationAssertionsAtLevel:a3];
    }

    else
    {
      id v17 = sub_100084950();
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 134217984;
        int64_t v19 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "No UI to invalidate at level: %lu",  (uint8_t *)&v18,  0xCu);
      }
    }
  }

- (id)_displayLayoutElementForSceneLayoutElement:(id)a3
{
  id v3 = a3;
  v4 = sub_10007DE90(v3, 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = -[PBSDisplayLayoutElement initWithIdentifier:]( objc_alloc(&OBJC_CLASS___PBSDisplayLayoutElement),  "initWithIdentifier:",  v5);
  -[PBSDisplayLayoutElement setLevel:](v6, "setLevel:", 1LL);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v7 bounds];
  -[PBSDisplayLayoutElement setReferenceFrame:](v6, "setReferenceFrame:");

  -[PBSDisplayLayoutElement setFillsDisplayBounds:](v6, "setFillsDisplayBounds:", 1LL);
  -[PBSDisplayLayoutElement setHasKeyboardFocus:](v6, "setHasKeyboardFocus:", 1LL);
  -[PBSDisplayLayoutElement setUIApplicationElement:](v6, "setUIApplicationElement:", 1LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 sceneHandle]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 clientProcessBundleIdentifier]);
  -[PBSDisplayLayoutElement setBundleIdentifier:](v6, "setBundleIdentifier:", v9);

  return v6;
}

- (id)_displayLayoutElementForOverlayLevel:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSDisplayLayoutElement elementForLayoutLevel:]( &OBJC_CLASS___PBSDisplayLayoutElement,  "elementForLayoutLevel:"));
  [v4 setLevel:a3];
  [v4 setHasKeyboardFocus:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v5 bounds];
  objc_msgSend(v4, "setReferenceFrame:");

  if (a3 == 11) {
    [v4 setBundleIdentifier:@"com.apple.siri"];
  }
  return v4;
}

- (void)_addDisplayLayoutElement:(id)a3
{
  id v4 = a3;
  if ((uint64_t)[v4 level] >= 1
    && (uint64_t)[v4 level] <= 23
    && ([v4 level] != (id)1 || objc_msgSend(v4, "isUIApplicationElement")))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    unsigned int v6 = [v5 isEqual:PBSDisplayLayoutElementPictureInPictureIdentifier];

    if (v6)
    {
      pipDisplayLayoutElementHandle = self->_pipDisplayLayoutElementHandle;
      if (pipDisplayLayoutElementHandle)
      {
        -[PBDisplayLayoutElementHandle setElement:](pipDisplayLayoutElementHandle, "setElement:", v4);
      }

      else
      {
        id v8 = -[PBDisplayLayoutElementHandle initWithElement:publisher:]( objc_alloc(&OBJC_CLASS___PBDisplayLayoutElementHandle),  "initWithElement:publisher:",  v4,  self);
        id v9 = self->_pipDisplayLayoutElementHandle;
        self->_pipDisplayLayoutElementHandle = v8;
      }
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_identifierToDisplayElementAssertions,  "objectForKey:",  v10));
    if (v11)
    {
      id v12 = sub_100084950();
      UIWindowLevel v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100277D20((uint64_t)v10, v13, v14, v15, v16, v17, v18, v19);
      }

      [v11 invalidate];
      -[NSMutableDictionary removeObjectForKey:]( self->_identifierToDisplayElementAssertions,  "removeObjectForKey:",  v10);
    }

    else
    {
      int64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[FBMainDisplayLayoutPublisher sharedInstance]( &OBJC_CLASS___FBMainDisplayLayoutPublisher,  "sharedInstance"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 addElement:v4]);

      -[NSMutableDictionary setObject:forKey:]( self->_identifierToDisplayElementAssertions,  "setObject:forKey:",  v21,  v10);
      -[PBWindowManager _handleDisplayElementUpdate](self, "_handleDisplayElementUpdate");
    }
  }
}

- (void)_removeDisplayLayoutElementWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:PBSDisplayLayoutElementPictureInPictureIdentifier])
  {
    -[PBDisplayLayoutElementHandle invalidate](self->_pipDisplayLayoutElementHandle, "invalidate");
    pipDisplayLayoutElementHandle = self->_pipDisplayLayoutElementHandle;
    self->_pipDisplayLayoutElementHandle = 0LL;
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifierToDisplayElementAssertions, "objectForKey:", v4));
  BOOL v7 = v6;
  if (v6)
  {
    [v6 invalidate];
    -[NSMutableDictionary removeObjectForKey:](self->_identifierToDisplayElementAssertions, "removeObjectForKey:", v4);
    -[PBWindowManager _handleDisplayElementUpdate](self, "_handleDisplayElementUpdate");
  }
}

- (void)_handleDisplayElementUpdate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[FBMainDisplayLayoutPublisher sharedInstance]( &OBJC_CLASS___FBMainDisplayLayoutPublisher,  "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentLayout]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10007F780;
  v19[3] = &unk_1003D33F0;
  v19[4] = self;
  id v5 = v3;
  id v20 = v5;
  unsigned int v6 = objc_retainBlock(v19);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "elements", 0));
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id activeLayoutLevel = (id)self->_activeLayoutLevel;
        id v14 = (id)self->_activeLayoutLevel;
      }

      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v9);
  }
}

- (id)_windowForLayoutLevel:(int64_t)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[BSMutableIntegerMap objectForKey:](self->_layoutLevelToWindow, "objectForKey:"));
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    double v9 = UIWindowLevelNormal;
    uint64_t v10 = @"overlay";
    switch(a3)
    {
      case 0LL:
      case 1LL:
      case 2LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBSceneLayoutWindow);
        id v12 = @"application";

        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  0LL);
        v61[0] = v13;
        id v14 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  2LL);
        v61[1] = v14;
        __int128 v15 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  1LL);
        v61[2] = v15;
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v61, 3LL));

        goto LABEL_12;
      case 3LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBNowPlayingWindow);
        double v9 = UISpringBoardLockScreenWindowLevel + -2.0;
        id v12 = @"application";

        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  3LL);
        v59 = v13;
        __int128 v18 = &v59;
        goto LABEL_11;
      case 4LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBRoutingWindow);
        double v9 = UISpringBoardLockScreenWindowLevel;
        id v12 = @"application";

        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  4LL);
        v58 = v13;
        uint64_t v17 = 1LL;
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v58, 1LL));
        goto LABEL_13;
      case 5LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBSplitViewWindow);
        id v12 = @"wallpaper";

        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  5LL);
        v57 = v13;
        __int128 v18 = &v57;
LABEL_11:
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 1LL));
LABEL_12:
        uint64_t v17 = 0LL;
        goto LABEL_13;
      case 6LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBScreenSaverWindow);
        id v12 = @"wallpaper";

        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  6LL);
        v56 = v13;
        uint64_t v17 = 1LL;
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v56, 1LL));
        double v9 = -1.79769313e308;
LABEL_13:
        uint64_t v10 = v12;
        goto LABEL_33;
      case 7LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBCRDInstructionsWindow);
        double v9 = UITextEffectsAboveStatusBarWindowLevel + -4.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  7LL);
        v55 = v13;
        uint64_t v19 = &v55;
        goto LABEL_28;
      case 8LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBAirPlayWindow);
        double v9 = UITextEffectsAboveStatusBarWindowLevel + -3.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  8LL);
        v54 = v13;
        uint64_t v19 = &v54;
        goto LABEL_28;
      case 9LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBHomeUIWindow);
        double v9 = UITextEffectsAboveStatusBarWindowLevel + -2.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  9LL);
        v48 = v13;
        uint64_t v19 = &v48;
        goto LABEL_28;
      case 10LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBPIPWindow);
        double v9 = UITextEffectsAboveStatusBarWindowLevel + -1.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  10LL);
        v60 = v13;
        uint64_t v19 = &v60;
        goto LABEL_28;
      case 11LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBSiriWindow);
        double v9 = UITextEffectsAboveStatusBarWindowLevel + 1.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  11LL);
        v53 = v13;
        uint64_t v19 = &v53;
        goto LABEL_28;
      case 12LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBControlCenterWindow);
        double v9 = UITextEffectsAboveStatusBarWindowLevel + 2.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  12LL);
        v50 = v13;
        uint64_t v19 = &v50;
        goto LABEL_28;
      case 13LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBDialogWindow);
        double v9 = UITextEffectsAboveStatusBarWindowLevel + 3.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  13LL);
        v52 = v13;
        uint64_t v19 = &v52;
        goto LABEL_28;
      case 14LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBRestrictionPINWindow);
        double v9 = UITextEffectsAboveStatusBarWindowLevel + 4.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  14LL);
        v51 = v13;
        uint64_t v17 = 1LL;
        id v20 = &v51;
        goto LABEL_32;
      case 15LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBBulletinWindow);
        double v9 = UIHUDWindowLevel;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  15LL);
        v49 = v13;
        uint64_t v19 = &v49;
        goto LABEL_28;
      case 16LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBVolumeHUDWindow);
        double v9 = UIHUDWindowLevel + 1.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  16LL);
        v47 = v13;
        uint64_t v19 = &v47;
        goto LABEL_28;
      case 17LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBCRDLoadingWindow);
        double v9 = UIHUDWindowLevel + 1.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  17LL);
        v46 = v13;
        uint64_t v17 = 1LL;
        id v20 = &v46;
        goto LABEL_32;
      case 18LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBBlackScreenRecoveryWindow);
        double v9 = UIHUDWindowLevel + 1.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  18LL);
        v45 = v13;
        uint64_t v17 = 1LL;
        id v20 = &v45;
        goto LABEL_32;
      case 19LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBEventMaskingWindow);
        double v9 = UIHUDWindowLevel + 8.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  19LL);
        v44 = v13;
        uint64_t v19 = &v44;
LABEL_28:
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 1LL));
        uint64_t v17 = 0LL;
        goto LABEL_33;
      case 20LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBSoftwareUpdateWindow);
        double v9 = UIHUDWindowLevel + 9.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  20LL);
        v43 = v13;
        uint64_t v17 = 1LL;
        id v20 = &v43;
        goto LABEL_32;
      case 21LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBCriticalAlertWindow);
        double v9 = UIHUDWindowLevel + 10.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  21LL);
        v42 = v13;
        uint64_t v17 = 1LL;
        id v20 = &v42;
        goto LABEL_32;
      case 22LL:
        id v11 = (objc_class *)objc_opt_class(&OBJC_CLASS___PBHotBlackWindow);
        double v9 = UIHUDWindowLevel + 13.0;
        UIWindowLevel v13 = -[PBPresentationElementViewController initWithLayoutLevel:]( objc_alloc(&OBJC_CLASS___PBPresentationElementViewController),  "initWithLayoutLevel:",  22LL);
        v41 = v13;
        uint64_t v17 = 1LL;
        id v20 = &v41;
LABEL_32:
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 1LL));
LABEL_33:

        break;
      default:
        __int128 v16 = 0LL;
        id v11 = 0LL;
        uint64_t v17 = 1LL;
        break;
    }

    id v21 = (void *)objc_claimAutoreleasedReturnValue( -[PBWorkspaceWindowSceneProviding windowSceneForLayoutGroup:]( self->_windowSceneProvider,  "windowSceneForLayoutGroup:",  v10));
    id v22 = objc_alloc(v11);
    id v23 = NSStringFromClass(v11);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    id v7 = [v22 initWithWindowScene:v21 name:v24];

    [v7 setWindowLevel:v9];
    [v7 setShouldOcclude:v17];
    BOOL v25 = (PBPresentationElementContainerViewController *)objc_claimAutoreleasedReturnValue([v16 firstObject]);
    v35 = v10;
    if ((unint64_t)[v16 count] >= 2)
    {
      v26 = -[PBPresentationElementContainerViewController initWithPresentationElementViewControllers:]( objc_alloc(&OBJC_CLASS___PBPresentationElementContainerViewController),  "initWithPresentationElementViewControllers:",  v16);

      BOOL v25 = v26;
    }

    [v7 setRootViewController:v25];
    [v7 setHidden:0];
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v27 = v16;
    id v28 = [v27 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v37 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
          -[PBPresentationElementFocusCoordinator _registerForFocusCoordination:]( self->_focusCoordinator,  "_registerForFocusCoordination:",  v32);
          id v33 = [v32 layoutLevel];
          -[BSMutableIntegerMap setObject:forKey:]( self->_layoutLevelToPresentationElement,  "setObject:forKey:",  v32,  v33);
          -[BSMutableIntegerMap setObject:forKey:](self->_layoutLevelToWindow, "setObject:forKey:", v7, v33);
        }

        id v29 = [v27 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }

      while (v29);
    }
  }

  return v7;
}

- (void)_setNeedsRemoteEventDeferringRuleComparisonForWindow:(id)a3 withReason:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 windowScene]);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _eventDeferringManager]);

  double v9 = (void *)objc_claimAutoreleasedReturnValue( +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment]( &OBJC_CLASS___BKSHIDEventDeferringEnvironment,  "keyboardFocusEnvironment"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v9));
  [v8 setNeedsRemoteEventDeferringRuleComparisonInEnvironments:v10 forBehaviorDelegate:self->_focusCoordinator withReason:v6];
}

- (void)prepareDebugWindows
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000803C4;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  if (qword_1004702C8 != -1) {
    dispatch_once(&qword_1004702C8, block);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &off_1003D3410 || a6 == &off_1003D3418)
  {
    -[PBWindowManager _updateUIDebugWindow](self, "_updateUIDebugWindow");
  }

  else if (a6 == &off_1003D3420)
  {
    -[PBWindowManager _updateUILayoutDebugWindow](self, "_updateUILayoutDebugWindow");
  }

  else
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___PBWindowManager;
    -[PBWindowManager observeValueForKeyPath:ofObject:change:context:]( &v13,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)_updateUIDebugWindow
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v4 = [v3 BOOLForKey:@"ShowUIDebug"];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v6 = [v5 BOOLForKey:@"ShowExternalControlDebug"];

  uiDebugWindow = self->_uiDebugWindow;
  int v8 = v4 | v6;
  if (uiDebugWindow || !v8)
  {
    if ((v8 & 1) == 0)
    {
      -[PBUIDebugWindow setHidden:](uiDebugWindow, "setHidden:", 1LL);
      objc_super v13 = self->_uiDebugWindow;
      self->_uiDebugWindow = 0LL;
    }
  }

  else
  {
    double v9 = objc_alloc(&OBJC_CLASS___PBUIDebugWindow);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PBWorkspaceWindowSceneProviding windowSceneForLayoutGroup:]( self->_windowSceneProvider,  "windowSceneForLayoutGroup:",  @"overlay"));
    id v11 = -[PBUIDebugWindow initWithWindowScene:](v9, "initWithWindowScene:", v10);
    id v12 = self->_uiDebugWindow;
    self->_uiDebugWindow = v11;

    -[PBUIDebugWindow setHidden:](self->_uiDebugWindow, "setHidden:", 0LL);
  }

- (void)_updateUILayoutDebugWindow
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v4 = [v3 BOOLForKey:@"ShowUILayoutDebug"];

  uiLayoutDebugWindow = self->_uiLayoutDebugWindow;
  if (uiLayoutDebugWindow) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    if ((v4 & 1) == 0)
    {
      self->_uiLayoutDebugWindow = 0LL;
    }
  }

  else
  {
    id v7 = objc_alloc(&OBJC_CLASS___PBSceneLayoutDebugWindow);
    int v8 = (void *)objc_claimAutoreleasedReturnValue( -[PBWorkspaceWindowSceneProviding windowSceneForLayoutGroup:]( self->_windowSceneProvider,  "windowSceneForLayoutGroup:",  @"overlay"));
    double v9 = -[PBSceneLayoutDebugWindow initWithWindowScene:](v7, "initWithWindowScene:", v8);
    id v10 = self->_uiLayoutDebugWindow;
    self->_uiLayoutDebugWindow = v9;

    -[PBSceneLayoutDebugWindow setHidden:](self->_uiLayoutDebugWindow, "setHidden:", 0LL);
  }

- (PBPresentationElementFocusCoordinator)focusCoordinator
{
  return self->_focusCoordinator;
}

- (int64_t)activeLayoutLevel
{
  return self->_activeLayoutLevel;
}

- (PBDisplayLayoutElementHandle)pipDisplayLayoutElementHandle
{
  return self->_pipDisplayLayoutElementHandle;
}

- (PBWorkspaceWindowSceneProviding)windowSceneProvider
{
  return self->_windowSceneProvider;
}

- (BSMutableIntegerMap)layoutLevelToWindow
{
  return self->_layoutLevelToWindow;
}

- (void)setLayoutLevelToWindow:(id)a3
{
}

- (BSMutableIntegerMap)layoutLevelToPresentationElement
{
  return self->_layoutLevelToPresentationElement;
}

- (void)setLayoutLevelToPresentationElement:(id)a3
{
}

- (NSMutableDictionary)identifierToDisplayElementAssertions
{
  return self->_identifierToDisplayElementAssertions;
}

- (void)setIdentifierToDisplayElementAssertions:(id)a3
{
}

- (NSMutableDictionary)identifierToDisplayTransitionAssertions
{
  return self->_identifierToDisplayTransitionAssertions;
}

- (void)setIdentifierToDisplayTransitionAssertions:(id)a3
{
}

- (PBUIDebugWindow)uiDebugWindow
{
  return self->_uiDebugWindow;
}

- (PBSceneLayoutDebugWindow)uiLayoutDebugWindow
{
  return self->_uiLayoutDebugWindow;
}

- (PLDisplayLayoutRepublisher)displayLayoutRepublisher
{
  return self->_displayLayoutRepublisher;
}

- (void).cxx_destruct
{
}

@end