@interface _PBSceneLayoutManagementTransaction
- (BOOL)_animateDestinationViewInFront;
- (BOOL)_canBeInterrupted;
- (BOOL)_shouldFailForChildTransaction:(id)a3;
- (BOOL)isAnimated;
- (BOOL)isResigning;
- (BSTransaction)animationTransaction;
- (PBApplicationSceneViewController)fromViewController;
- (PBApplicationSceneViewController)toViewController;
- (PBOpenApplicationRequest)openAppRequest;
- (PBSceneLayoutViewController)sceneLayoutViewController;
- (_PBSceneLayoutManagementTransaction)initWithRequest:(id)a3 transitionType:(int64_t)a4;
- (void)_begin;
- (void)_didComplete;
@end

@implementation _PBSceneLayoutManagementTransaction

- (_PBSceneLayoutManagementTransaction)initWithRequest:(id)a3 transitionType:(int64_t)a4
{
  id v7 = a3;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS____PBSceneLayoutManagementTransaction;
  v8 = -[_PBSceneLayoutManagementTransaction init](&v42, "init");
  v9 = v8;
  if (v8)
  {
    p_openAppRequest = (id *)&v8->_openAppRequest;
    objc_storeStrong((id *)&v8->_openAppRequest, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue( +[PBSceneLayoutViewController sceneLayoutViewControllerForMainDisplay]( &OBJC_CLASS___PBSceneLayoutViewController,  "sceneLayoutViewControllerForMainDisplay"));
    sceneLayoutViewController = v9->_sceneLayoutViewController;
    v9->_sceneLayoutViewController = (PBSceneLayoutViewController *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue( -[PBSceneLayoutViewController sceneLayoutElements]( v9->_sceneLayoutViewController,  "sceneLayoutElements"));
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 lastObject]);
    fromViewController = v9->_fromViewController;
    v9->_fromViewController = (PBApplicationSceneViewController *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController identifier](v9->_fromViewController, "identifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([*p_openAppRequest toSceneIdentity]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 identifier]);
    unsigned int v19 = [v16 isEqualToString:v18];

    if (v19)
    {
      objc_storeStrong((id *)&v9->_toViewController, v9->_fromViewController);
      id v20 = sub_100083CA8();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController identifier](v9->_fromViewController, "identifier"));
        *(_DWORD *)buf = 136315394;
        v44 = "-[_PBSceneLayoutManagementTransaction initWithRequest:transitionType:]";
        __int16 v45 = 2112;
        v46 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s - will transition to existing top scene %@",  buf,  0x16u);
      }
    }

    else
    {
      v23 = objc_alloc(&OBJC_CLASS___PBSceneHandle);
      v24 = (void *)objc_claimAutoreleasedReturnValue([*p_openAppRequest toSceneIdentity]);
      v25 = (void *)objc_claimAutoreleasedReturnValue([*p_openAppRequest toAppInfo]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 bundleIdentifier]);
      v21 = -[PBSceneHandle initWithSceneIdentity:bundleIdentifier:]( v23,  "initWithSceneIdentity:bundleIdentifier:",  v24,  v26);

      v27 = -[PBApplicationSceneViewController initWithSceneHandle:layoutLevel:]( objc_alloc(&OBJC_CLASS___PBApplicationSceneViewController),  "initWithSceneHandle:layoutLevel:",  v21,  1LL);
      toViewController = v9->_toViewController;
      v9->_toViewController = v27;

      -[PBApplicationSceneViewController setPresentationMode:](v9->_toViewController, "setPresentationMode:", 3LL);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController identifier](v9->_fromViewController, "identifier"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController identifier](v9->_toViewController, "identifier"));
    unsigned __int8 v31 = [v29 isEqual:v30];

    if (a4 == 4) {
      char v32 = 1;
    }
    else {
      char v32 = [*p_openAppRequest shouldAnimatedLayout] & (v31 ^ 1);
    }
    v9->_animated = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[PBPictureInPictureManager sharedInstance]( &OBJC_CLASS___PBPictureInPictureManager,  "sharedInstance"));
    unsigned int v34 = [v33 isSwapping];

    if (v34) {
      v9->_animated = 0;
    }
    -[PBApplicationSceneViewController setPreferLaunchImageSnapshot:]( v9->_toViewController,  "setPreferLaunchImageSnapshot:",  [*p_openAppRequest hasPayloadURL]);
    if (v9->_animated)
    {
      switch(a4)
      {
        case 0LL:
          v36 = -[PBDefaultAppAnimationTransaction initWithSceneLayoutViewController:fromViewController:toViewController:isResigning:]( objc_alloc(&OBJC_CLASS___PBDefaultAppAnimationTransaction),  "initWithSceneLayoutViewController:fromViewController:toViewController:isResigning:",  v9->_sceneLayoutViewController,  v9->_fromViewController,  v9->_toViewController,  0LL);
          goto LABEL_22;
        case 1LL:
        case 5LL:
          char v35 = 1;
          v36 = -[PBDefaultAppAnimationTransaction initWithSceneLayoutViewController:fromViewController:toViewController:isResigning:]( objc_alloc(&OBJC_CLASS___PBDefaultAppAnimationTransaction),  "initWithSceneLayoutViewController:fromViewController:toViewController:isResigning:",  v9->_sceneLayoutViewController,  v9->_fromViewController,  v9->_toViewController,  1LL);
          goto LABEL_23;
        case 2LL:
          v37 = (void *)objc_claimAutoreleasedReturnValue([*p_openAppRequest toAppInfo]);
          if ([v37 isHidden])
          {
            BOOL v38 = 0LL;
          }

          else
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue([*p_openAppRequest fromSceneIdentity]);
            BOOL v38 = v39 != 0LL;
          }

          v36 = -[PBKioskAppAnimationTransaction initWithSceneLayoutViewController:fromViewController:toViewController:shouldPlaySound:isLaunchingFromKiosk:]( objc_alloc(&OBJC_CLASS___PBKioskAppAnimationTransaction),  "initWithSceneLayoutViewController:fromViewController:toViewController:shouldPlaySound:isLaunchingFromKiosk:",  v9->_sceneLayoutViewController,  v9->_fromViewController,  v9->_toViewController,  v38,  1LL);
          goto LABEL_22;
        case 3LL:
          char v35 = 1;
          v36 = -[PBKioskAppAnimationTransaction initWithSceneLayoutViewController:fromViewController:toViewController:shouldPlaySound:isLaunchingFromKiosk:]( objc_alloc(&OBJC_CLASS___PBKioskAppAnimationTransaction),  "initWithSceneLayoutViewController:fromViewController:toViewController:shouldPlaySound:isLaunchingFromKiosk:",  v9->_sceneLayoutViewController,  v9->_fromViewController,  v9->_toViewController,  1LL,  0LL);
          goto LABEL_23;
        case 4LL:
          v36 = -[PBAppSwitcherToAppAnimationTransaction initWithSceneLayoutViewController:fromViewController:toViewController:]( objc_alloc(&OBJC_CLASS___PBAppSwitcherToAppAnimationTransaction),  "initWithSceneLayoutViewController:fromViewController:toViewController:",  v9->_sceneLayoutViewController,  v9->_fromViewController,  v9->_toViewController);
LABEL_22:
          char v35 = 0;
LABEL_23:
          animationTransaction = v9->_animationTransaction;
          v9->_animationTransaction = (BSTransaction *)v36;

          break;
        default:
          char v35 = 0;
          break;
      }

      v9->_resigning = v35;
    }
  }

  return v9;
}

- (BOOL)_animateDestinationViewInFront
{
  animationTransaction = self->_animationTransaction;
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBKioskAppAnimationTransaction, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  LOBYTE(animationTransaction) = objc_opt_isKindOfClass(animationTransaction, v5);

  v8 = self->_animationTransaction;
  uint64_t v9 = objc_opt_self(&OBJC_CLASS___PBDefaultAppAnimationTransaction, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  LOBYTE(v8) = objc_opt_isKindOfClass(v8, v10);

  return (v8 & 1) != 0 && self->_resigning;
}

- (BOOL)_shouldFailForChildTransaction:(id)a3
{
  return 1;
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____PBSceneLayoutManagementTransaction;
  -[_PBSceneLayoutManagementTransaction _begin](&v18, "_begin");
  toViewController = self->_toViewController;
  if (self->_fromViewController != toViewController)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController sceneHandle](toViewController, "sceneHandle"));
    unsigned int v5 = [v4 isDefaultKioskAppScene];

    if (v5) {
      -[PBApplicationSceneViewController setAllowSnapshots:](self->_toViewController, "setAllowSnapshots:", 0LL);
    }
    -[PBApplicationSceneViewController setWallpaperEnabled:](self->_toViewController, "setWallpaperEnabled:", 1LL);
    fromViewController = self->_fromViewController;
    if (fromViewController)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController sceneHandle](fromViewController, "sceneHandle"));
      unsigned int v8 = [v7 isDefaultKioskAppScene];

      if (v8) {
        -[PBApplicationSceneViewController setAllowSnapshots:](self->_fromViewController, "setAllowSnapshots:", 0LL);
      }
      -[PBApplicationSceneViewController setWallpaperEnabled:](self->_fromViewController, "setWallpaperEnabled:", 1LL);
      unsigned int v9 = -[_PBSceneLayoutManagementTransaction _animateDestinationViewInFront](self, "_animateDestinationViewInFront");
      sceneLayoutViewController = self->_sceneLayoutViewController;
      uint64_t v11 = self->_toViewController;
      v12 = self->_fromViewController;
      if (v9) {
        -[PBSceneLayoutViewController _addSceneLayoutElement:aboveSceneLayoutElement:animated:]( sceneLayoutViewController,  "_addSceneLayoutElement:aboveSceneLayoutElement:animated:",  v11,  v12,  1LL);
      }
      else {
        -[PBSceneLayoutViewController _addSceneLayoutElement:belowSceneLayoutElement:animated:]( sceneLayoutViewController,  "_addSceneLayoutElement:belowSceneLayoutElement:animated:",  v11,  v12,  1LL);
      }
      -[PBSceneLayoutViewController _removeSceneLayoutElement:animated:]( self->_sceneLayoutViewController,  "_removeSceneLayoutElement:animated:",  self->_fromViewController,  1LL);
    }

    else
    {
      -[PBSceneLayoutViewController _addSceneLayoutElement:animated:]( self->_sceneLayoutViewController,  "_addSceneLayoutElement:animated:",  self->_toViewController,  1LL);
    }
  }

  if (self->_animationTransaction)
  {
    id v13 = sub_100083CA8();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class(self->_animationTransaction);
      v16 = NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 136315394;
      id v20 = "-[_PBSceneLayoutManagementTransaction _begin]";
      __int16 v21 = 2114;
      v22 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s - will run open app animation transaction of type: %{public}@",  buf,  0x16u);
    }

    -[_PBSceneLayoutManagementTransaction addChildTransaction:]( self,  "addChildTransaction:",  self->_animationTransaction);
  }

- (void)_didComplete
{
  fromViewController = self->_fromViewController;
  if (fromViewController != self->_toViewController)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController sceneHandle](fromViewController, "sceneHandle"));
    unsigned int v5 = [v4 isDefaultKioskAppScene];

    if (v5) {
      -[PBApplicationSceneViewController setAllowSnapshots:](self->_fromViewController, "setAllowSnapshots:", 1LL);
    }
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController sceneHandle](self->_toViewController, "sceneHandle"));
    unsigned int v7 = [v6 isDefaultKioskAppScene];

    if (v7) {
      -[PBApplicationSceneViewController setAllowSnapshots:](self->_toViewController, "setAllowSnapshots:", 1LL);
    }
    -[PBApplicationSceneViewController setWallpaperEnabled:](self->_toViewController, "setWallpaperEnabled:", 0LL);
    if ((-[_PBSceneLayoutManagementTransaction isFailed](self, "isFailed") & 1) != 0
      || -[_PBSceneLayoutManagementTransaction pb_isAborted](self, "pb_isAborted"))
    {
      if (self->_fromViewController) {
        -[PBSceneLayoutViewController _endAppearanceTransitionForSceneLayoutElement:]( self->_sceneLayoutViewController,  "_endAppearanceTransitionForSceneLayoutElement:");
      }
      p_sceneLayoutViewController = &self->_sceneLayoutViewController;
      -[PBSceneLayoutViewController _removeSceneLayoutElement:animated:]( self->_sceneLayoutViewController,  "_removeSceneLayoutElement:animated:",  self->_toViewController,  0LL);
    }

    else
    {
      if (self->_fromViewController) {
        -[PBSceneLayoutViewController _endAppearanceTransitionForSceneLayoutElement:]( self->_sceneLayoutViewController,  "_endAppearanceTransitionForSceneLayoutElement:");
      }
      p_sceneLayoutViewController = &self->_sceneLayoutViewController;
    }

    -[PBSceneLayoutViewController _endAppearanceTransitionForSceneLayoutElement:]( *p_sceneLayoutViewController,  "_endAppearanceTransitionForSceneLayoutElement:",  self->_toViewController);
  }

  id v9 = sub_100083CA8();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = (objc_class *)objc_opt_class(self->_animationTransaction);
    v12 = NSStringFromClass(v11);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 136315394;
    v16 = "-[_PBSceneLayoutManagementTransaction _didComplete]";
    __int16 v17 = 2114;
    objc_super v18 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s - did complete open app animation transaction of type: %{public}@",  buf,  0x16u);
  }

  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____PBSceneLayoutManagementTransaction;
  -[_PBSceneLayoutManagementTransaction _didComplete](&v14, "_didComplete");
}

- (PBOpenApplicationRequest)openAppRequest
{
  return self->_openAppRequest;
}

- (PBSceneLayoutViewController)sceneLayoutViewController
{
  return self->_sceneLayoutViewController;
}

- (PBApplicationSceneViewController)fromViewController
{
  return self->_fromViewController;
}

- (PBApplicationSceneViewController)toViewController
{
  return self->_toViewController;
}

- (BSTransaction)animationTransaction
{
  return self->_animationTransaction;
}

- (BOOL)isResigning
{
  return self->_resigning;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void).cxx_destruct
{
}

@end