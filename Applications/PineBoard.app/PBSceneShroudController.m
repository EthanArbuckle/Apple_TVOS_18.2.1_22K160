@interface PBSceneShroudController
- (BSCompoundAssertion)sceneShroudAssertion;
- (BSCompoundAssertion)shroudGestureAssertion;
- (OS_dispatch_source)debounceSource;
- (PBSceneShroudController)init;
- (PBSystemGestureHandle)shroudGesture;
- (TVSObserverSet)agents;
- (id)_createContextProvider;
- (id)agentDidPresentShroud:(id)a3;
- (id)registerAgent:(id)a3 withClientProcessBundleIdentifier:(id)a4;
- (id)shroudApplicationsUsingPredicate:(id)a3 style:(int64_t)a4 completion:(id)a5;
- (id)shroudApplicationsWithBundleIDs:(id)a3 style:(int64_t)a4 completion:(id)a5;
- (void)_mainQueue_handleStateChange;
- (void)_mainQueue_updateAgent:(id)a3 withUserInfo:(id)a4 usingContext:(id)a5 animated:(BOOL)a6;
- (void)_mainQueue_updateShroudGestureWithState:(id)a3;
- (void)dealloc;
@end

@implementation PBSceneShroudController

- (PBSceneShroudController)init
{
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___PBSceneShroudController;
  v2 = -[PBSceneShroudController init](&v35, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    agents = v2->_agents;
    v2->_agents = v3;

    dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0LL, 0LL, &_dispatch_main_q);
    objc_storeStrong((id *)&v2->_debounceSource, v5);
    objc_initWeak(&location, v2);
    debounceSource = (dispatch_source_s *)v2->_debounceSource;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10010FC4C;
    handler[3] = &unk_1003D0890;
    objc_copyWeak(&v33, &location);
    dispatch_source_set_event_handler(debounceSource, handler);
    dispatch_activate(v5);
    v7 = (objc_class *)objc_opt_class(v2);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10010FC78;
    v30[3] = &unk_1003D7D40;
    v10 = v5;
    v31 = v10;
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[BSCompoundAssertion assertionWithIdentifier:stateDidChangeHandler:]( &OBJC_CLASS___BSCompoundAssertion,  "assertionWithIdentifier:stateDidChangeHandler:",  v9,  v30));
    sceneShroudAssertion = v2->_sceneShroudAssertion;
    v2->_sceneShroudAssertion = (BSCompoundAssertion *)v11;

    v13 = v2->_sceneShroudAssertion;
    id v14 = sub_1000F74EC();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[BSCompoundAssertion setLog:](v13, "setLog:", v15);

    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    v27 = sub_10010FC94;
    v28 = &unk_1003D1970;
    objc_copyWeak(&v29, &location);
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[BSCompoundAssertion assertionWithIdentifier:stateDidChangeHandler:]( &OBJC_CLASS___BSCompoundAssertion,  "assertionWithIdentifier:stateDidChangeHandler:",  @"Shroud Gesture Assertion",  &v25));
    shroudGestureAssertion = v2->_shroudGestureAssertion;
    v2->_shroudGestureAssertion = (BSCompoundAssertion *)v16;

    v18 = v2->_shroudGestureAssertion;
    id v19 = sub_1000F74EC();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[BSCompoundAssertion setLog:](v18, "setLog:", v20, v25, v26, v27, v28);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
    v22 = (PBSystemGestureHandle *)[v21 newHandleForSystemGesture:55 actionHandler:&stru_1003D7D60];
    shroudGesture = v2->_shroudGesture;
    v2->_shroudGesture = v22;

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSceneShroudController;
  -[PBSceneShroudController dealloc](&v3, "dealloc");
}

- (id)shroudApplicationsWithBundleIDs:(id)a3 style:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  Class v11 = NSClassFromString(@"NSSet");
  if (!v10)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100281D90();
    }
LABEL_9:
    _bs_set_crash_log_message([v17 UTF8String]);
    __break(0);
    JUMPOUT(0x10010FEC0LL);
  }

  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSSetClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100281D90();
    }
    goto LABEL_9;
  }

  id v12 = [v10 copy];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10010FF28;
  v18[3] = &unk_1003D5CB0;
  id v19 = v12;
  id v13 = v12;
  id v14 = objc_retainBlock(v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[PBSceneShroudController shroudApplicationsUsingPredicate:style:completion:]( self,  "shroudApplicationsUsingPredicate:style:completion:",  v14,  a4,  v9));

  return v15;
}

- (id)shroudApplicationsUsingPredicate:(id)a3 style:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = v9;
    Class v11 = _os_activity_create( (void *)&_mh_execute_header,  "scenes/shrouding/begin",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, &state);

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[_PBSceneShroudAssertionContext contextWithStyle:predicate:]( &OBJC_CLASS____PBSceneShroudAssertionContext,  "contextWithStyle:predicate:",  a4,  v8));
    [v12 setCompletionBlock:v10];
    sceneShroudAssertion = self->_sceneShroudAssertion;
    id v14 = sub_10010F95C(a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[BSCompoundAssertion acquireForReason:withContext:]( sceneShroudAssertion,  "acquireForReason:withContext:",  v15,  v12));

    os_activity_scope_leave(&state);
    return v16;
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"predicate != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100281E40();
    }
    id result = (id) _bs_set_crash_log_message([v18 UTF8String]);
    __break(0);
  }

  return result;
}

- (id)registerAgent:(id)a3 withClientProcessBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v8 = v7;
  Class v9 = NSClassFromString(@"NSString");
  if (!v8)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100281EEC();
    }
LABEL_9:
    _bs_set_crash_log_message([v17 UTF8String]);
    __break(0);
    JUMPOUT(0x100110254LL);
  }

  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100281FA0();
    }
    goto LABEL_9;
  }

  id v10 = _os_activity_create( (void *)&_mh_execute_header,  "scenes/shrouding/registerAgent",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v10, &state);

  Class v11 = -[_PBSceneShroudAgentUserInfo initWithBundleID:]( objc_alloc(&OBJC_CLASS____PBSceneShroudAgentUserInfo),  "initWithBundleID:",  v8);
  id v12 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue( -[PBSceneShroudController _createContextProvider]( self,  "_createContextProvider"));
  uint64_t v13 = ((uint64_t (**)(void, id))v12)[2](v12, v8);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[PBSceneShroudController _mainQueue_updateAgent:withUserInfo:usingContext:animated:]( self,  "_mainQueue_updateAgent:withUserInfo:usingContext:animated:",  v6,  v11,  v14,  0LL);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSObserverSet addObserver:userInfo:](self->_agents, "addObserver:userInfo:", v6, v11));

  os_activity_scope_leave(&state);
  return v15;
}

- (id)agentDidPresentShroud:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  if (!v4)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"agent != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100282054();
    }
LABEL_9:
    _bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
    JUMPOUT(0x1001103DCLL);
  }

  dispatch_source_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudController shroudGesture](self, "shroudGesture"));
  unsigned __int8 v6 = [v5 isValid];

  if ((v6 & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[[self shroudGesture] isValid]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002820FC();
    }
    goto LABEL_9;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudController shroudGestureAssertion](self, "shroudGestureAssertion"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 acquireForReason:@"present shroud"]);

  return v8;
}

- (void)_mainQueue_handleStateChange
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudController _createContextProvider](self, "_createContextProvider"));
  agents = self->_agents;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001105C4;
  v17[3] = &unk_1003D7DC8;
  id v5 = v3;
  v17[4] = self;
  id v18 = v5;
  -[TVSObserverSet enumerateObserversUsingBlock:](agents, "enumerateObserversUsingBlock:", v17);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion orderedContext](self->_sceneShroudAssertion, "orderedContext", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        Class v11 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        id v12 = (void (**)(void))objc_claimAutoreleasedReturnValue([v11 completionBlock]);
        if (v12)
        {
          [v11 setCompletionBlock:0];
          v12[2](v12);
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }

    while (v8);
  }
}

- (void)_mainQueue_updateAgent:(id)a3 withUserInfo:(id)a4 usingContext:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int128 v13 = v12;
  if (v12) {
    id v14 = [v12 style];
  }
  else {
    id v14 = 0LL;
  }
  if ([v11 style] == v14) {
    goto LABEL_9;
  }
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 presentationAssertion]);
  [v15 invalidate];

  [v11 setPresentationAssertion:0];
  if (!v14)
  {
LABEL_8:
    [v11 setStyle:v14];
LABEL_9:

    return;
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue([v10 shroudController:self requestsSceneShrouding:v14 animated:v6]);
  if (v16)
  {
    v17 = (void *)v16;
    [v11 setPresentationAssertion:v16];

    goto LABEL_8;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"presentationAssertion != nil"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1002821A4();
  }
  _bs_set_crash_log_message([v18 UTF8String]);
  __break(0);
}

- (void)_mainQueue_updateShroudGestureWithState:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudController shroudGesture](self, "shroudGesture"));
  unsigned __int8 v6 = [v5 isValid];

  if ((v6 & 1) != 0)
  {
    if ([v4 isActive])
    {
      id v7 = _os_activity_create( (void *)&_mh_execute_header,  "scenes/shrouding/gesture/acquire",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v7, &state);

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudController shroudGesture](self, "shroudGesture"));
      [v8 acquire];
    }

    else
    {
      uint64_t v9 = _os_activity_create( (void *)&_mh_execute_header,  "scenes/shrouding/gesture/relinquish",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v9, &state);

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneShroudController shroudGesture](self, "shroudGesture"));
      [v8 relinquish];
    }

    os_activity_scope_leave(&state);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[[self shroudGesture] isValid]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028224C();
    }
    _bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
  }

- (id)_createContextProvider
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSCompoundAssertion orderedContext](self->_sceneShroudAssertion, "orderedContext"));
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x3032000000LL;
  v13[3] = sub_100110A30;
  v13[4] = sub_100110A40;
  id v14 = 0LL;
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  uint64_t v9 = sub_100110A58;
  id v10 = &unk_1003D7E18;
  id v12 = v13;
  id v3 = v2;
  id v11 = v3;
  id v4 = objc_retainBlock(&v7);
  id v5 = objc_msgSend(v4, "copy", v7, v8, v9, v10);

  _Block_object_dispose(v13, 8);
  return v5;
}

- (TVSObserverSet)agents
{
  return self->_agents;
}

- (BSCompoundAssertion)sceneShroudAssertion
{
  return self->_sceneShroudAssertion;
}

- (BSCompoundAssertion)shroudGestureAssertion
{
  return self->_shroudGestureAssertion;
}

- (OS_dispatch_source)debounceSource
{
  return self->_debounceSource;
}

- (PBSystemGestureHandle)shroudGesture
{
  return self->_shroudGesture;
}

- (void).cxx_destruct
{
}

@end