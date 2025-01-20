@interface PBAppSwitcherToAppAnimationTransaction
- ($D1BD78C04396328640866C86DE8AF7CF)context;
- (PBAppSwitcherToAppAnimationTransaction)initWithSceneLayoutViewController:(id)a3 fromViewController:(id)a4 toViewController:(id)a5;
- (_PBAppSwitcherLaunchAnimateTransaction)launchAppTransaction;
- (void)_begin;
@end

@implementation PBAppSwitcherToAppAnimationTransaction

- (PBAppSwitcherToAppAnimationTransaction)initWithSceneLayoutViewController:(id)a3 fromViewController:(id)a4 toViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PBAppSwitcherToAppAnimationTransaction;
  v12 = -[PBAppSwitcherToAppAnimationTransaction init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context.sceneLayoutViewController, a3);
    objc_storeStrong((id *)&v13->_context.fromViewController, a4);
    objc_storeStrong((id *)&v13->_context.toViewController, a5);
  }

  return v13;
}

- (void)_begin
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PBAppSwitcherToAppAnimationTransaction;
  -[PBAppSwitcherToAppAnimationTransaction _begin](&v18, "_begin");
  objc_initWeak(&location, self);
  id v3 = objc_alloc(&OBJC_CLASS___BSBlockTransaction);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001335BC;
  v15[3] = &unk_1003D24A8;
  objc_copyWeak(&v16, &location);
  id v4 = [v3 initWithBlock:v15];
  -[PBAppSwitcherToAppAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"PBAppSwitcherScrollAnimationMilestone");
  -[PBAppSwitcherToAppAnimationTransaction addChildTransaction:](self, "addChildTransaction:", v4);
  v5 = objc_alloc(&OBJC_CLASS____PBAppSwitcherLaunchAnimateTransaction);
  sub_1001336E4(v14, (id *)&self->_context.sceneLayoutViewController);
  if (v5)
  {
    v6 = -[_PBAppSwitcherLaunchAnimateTransaction initWithContext:](v5, "initWithContext:", v14);
  }

  else
  {

    v6 = 0LL;
  }

  launchAppTransaction = self->_launchAppTransaction;
  self->_launchAppTransaction = v6;

  v8 = self->_launchAppTransaction;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_10013375C;
  v12 = &unk_1003D1228;
  objc_copyWeak(&v13, &location);
  -[_PBAppSwitcherLaunchAnimateTransaction setCompletionBlock:](v8, "setCompletionBlock:", &v9);
  -[PBAppSwitcherToAppAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"PBAppSwitcherAppToAppAnimationMilestone",  v9,  v10,  v11,  v12);
  -[PBAppSwitcherToAppAnimationTransaction addChildTransaction:]( self,  "addChildTransaction:",  self->_launchAppTransaction);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- ($D1BD78C04396328640866C86DE8AF7CF)context
{
  return ($D1BD78C04396328640866C86DE8AF7CF *)sub_1001336E4(retstr, (id *)&self->_context.sceneLayoutViewController);
}

- (_PBAppSwitcherLaunchAnimateTransaction)launchAppTransaction
{
  return self->_launchAppTransaction;
}

- (void).cxx_destruct
{
}

@end