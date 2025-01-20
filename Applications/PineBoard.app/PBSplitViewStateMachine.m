@interface PBSplitViewStateMachine
- (BOOL)isPresented;
- (OS_os_log)log;
- (PBSplitViewStateMachine)initWithTransitionHandler:(id)a3;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)hide;
- (void)presentWithApplication:(id)a3 completion:(id)a4;
- (void)setLog:(id)a3;
- (void)unhide;
@end

@implementation PBSplitViewStateMachine

- (PBSplitViewStateMachine)initWithTransitionHandler:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___PBSplitViewStateMachine;
  v5 = -[PBSplitViewStateMachine init](&v45, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_transitionHandler, v4);
    v7 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = -[TVSStateMachine initWithName:initialState:mode:]( v7,  "initWithName:initialState:mode:",  v10,  @"Ready",  0LL);
    machine = v6->_machine;
    v6->_machine = v11;

    objc_initWeak(&location, v6);
    v13 = v6->_machine;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_100181D18;
    v42[3] = &unk_1003D0990;
    objc_copyWeak(&v43, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v13,  "registerHandlerForEvent:onState:withBlock:",  @"Present",  @"Ready",  v42);
    v14 = v6->_machine;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100181EE0;
    v40[3] = &unk_1003D0990;
    objc_copyWeak(&v41, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v14,  "registerHandlerForEvent:onState:withBlock:",  @"Prepared",  @"Preparing",  v40);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v6->_machine,  "registerHandlerForEvent:onState:withBlock:",  @"Presented",  @"Presenting",  &stru_1003DA510);
    v15 = v6->_machine;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_100182140;
    v38[3] = &unk_1003D0990;
    objc_copyWeak(&v39, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v15,  "registerHandlerForEvent:onState:withBlock:",  @"Dismiss",  @"Presenting",  v38);
    v16 = v6->_machine;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_100182308;
    v36[3] = &unk_1003D0990;
    objc_copyWeak(&v37, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v16,  "registerHandlerForEvent:onState:withBlock:",  @"Dismiss",  @"Presented",  v36);
    v17 = v6->_machine;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100182430;
    v34[3] = &unk_1003D0990;
    objc_copyWeak(&v35, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v17,  "registerHandlerForEvent:onState:withBlock:",  @"Dismissed",  @"Dismissing",  v34);
    v18 = v6->_machine;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1001825F4;
    v32[3] = &unk_1003D0990;
    objc_copyWeak(&v33, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v18,  "registerHandlerForEvent:onState:withBlock:",  @"Hide",  @"Presented",  v32);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v6->_machine,  "registerHandlerForEvent:onState:withBlock:",  @"Hidden",  @"Hiding",  &stru_1003DA530);
    v19 = v6->_machine;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100182780;
    v30[3] = &unk_1003D0990;
    objc_copyWeak(&v31, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v19,  "registerHandlerForEvent:onState:withBlock:",  @"Unhide",  @"Hiding",  v30);
    v20 = v6->_machine;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100182900;
    v28[3] = &unk_1003D0990;
    objc_copyWeak(&v29, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v20,  "registerHandlerForEvent:onState:withBlock:",  @"Unhide",  @"Hidden",  v28);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v6->_machine,  "registerHandlerForEvent:onState:withBlock:",  @"Presented",  @"Unhiding",  &stru_1003DA550);
    v21 = v6->_machine;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100182A18;
    v26[3] = &unk_1003D0990;
    objc_copyWeak(&v27, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v21,  "registerHandlerForEvent:onState:withBlock:",  @"Hide",  @"Unhiding",  v26);
    v22 = v6->_machine;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100182B24;
    v24[3] = &unk_1003D0990;
    objc_copyWeak(&v25, &location);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v22,  "registerHandlerForEvent:onState:withBlock:",  @"Dismiss",  @"Hidden",  v24);
    -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v6->_machine,  "registerHandlerForEvent:onState:withBlock:",  @"Invalidated",  @"Invalidating",  &stru_1003DA570);
    -[TVSStateMachine setShouldAcceptEvents:](v6->_machine, "setShouldAcceptEvents:", 1LL);
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
    objc_destroyWeak(&location);
  }

  return v6;
}

- (OS_os_log)log
{
  return (OS_os_log *)(id)objc_claimAutoreleasedReturnValue(-[TVSStateMachine logObject](self->_machine, "logObject"));
}

- (void)setLog:(id)a3
{
}

- (BOOL)isPresented
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](self->_machine, "currentState"));
  unsigned __int8 v3 = [v2 isEqualToString:@"Presented"];

  return v3;
}

- (void)presentWithApplication:(id)a3 completion:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[_PBSplitViewStateMachineTransitionContext contextWithAnimated:completion:application:]( &OBJC_CLASS____PBSplitViewStateMachineTransitionContext,  "contextWithAnimated:completion:application:",  1LL,  a4,  a3));
  if (self) {
    -[TVSStateMachine postEvent:withContext:](self->_machine, "postEvent:withContext:", @"Present", v5);
  }
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[_PBSplitViewStateMachineTransitionContext contextWithAnimated:completion:application:]( &OBJC_CLASS____PBSplitViewStateMachineTransitionContext,  "contextWithAnimated:completion:application:",  a3,  a4,  0LL));
  if (self) {
    -[TVSStateMachine postEvent:withContext:](self->_machine, "postEvent:withContext:", @"Dismiss", v5);
  }
}

- (void)hide
{
  if (self) {
    -[TVSStateMachine postEvent:withContext:](self->_machine, "postEvent:withContext:", @"Hide", 0LL);
  }
}

- (void)unhide
{
  if (self) {
    -[TVSStateMachine postEvent:withContext:](self->_machine, "postEvent:withContext:", @"Unhide", 0LL);
  }
}

- (void).cxx_destruct
{
}

@end