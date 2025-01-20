@interface BKBootUIPresenter
+ (id)sharedInstance;
- (BKBootUIPresenter)initWithSystemAppSentinel:(id)a3 alternateSystemAppManager:(id)a4 firstBootDetector:(id)a5 bootUIOverlayVendor:(id)a6 renderOverlayManager:(id)a7;
- (BKDisplayRenderOverlay)overlay;
- (BKDisplayRenderOverlay)underlay;
- (BOOL)isShowingBootUI;
- (BOOL)sustainOverlayForReason:(id)a3;
- (NSString)description;
- (SWSystemActivityAssertion)systemActivityAssertion;
- (void)_queue_acquireActivityAssertionForReason:(id)a3 generation:(unint64_t)a4 continuation:(id)a5;
- (void)_queue_addOverlayForReason:(id)a3;
- (void)_queue_addUnderlay;
- (void)_queue_continueAddingOverlayForReason:(id)a3 generation:(unint64_t)a4;
- (void)_queue_removeOverlayWithAnimationSettings:(id)a3;
- (void)_queue_removeUnderlay;
- (void)_queue_setScreenOwnerPID:(int)a3;
- (void)_queue_updateOverlayForReason:(id)a3;
- (void)_sync;
- (void)dealloc;
- (void)dismissOverlayWithAnimationSettings:(id)a3 requstedByPID:(int)a4;
- (void)firstBootDetectorDidFinishFirstBoot:(id)a3;
- (void)setOverlay:(id)a3;
- (void)setSystemActivityAssertion:(id)a3;
- (void)setUnderlay:(id)a3;
- (void)systemShellChangedWithPrimary:(id)a3;
- (void)systemShellDidFinishLaunching:(id)a3;
- (void)unsustainOverlayForReason:(id)a3;
@end

@implementation BKBootUIPresenter

- (BKBootUIPresenter)initWithSystemAppSentinel:(id)a3 alternateSystemAppManager:(id)a4 firstBootDetector:(id)a5 bootUIOverlayVendor:(id)a6 renderOverlayManager:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___BKBootUIPresenter;
  v16 = -[BKBootUIPresenter init](&v39, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_systemAppSentinel, a3);
    objc_storeStrong((id *)&v17->_bootUIOverlayVendor, a6);
    objc_storeStrong((id *)&v17->_renderOverlayManager, a7);
    objc_storeStrong((id *)&v17->_firstBootDetector, a5);
    v19 = (objc_class *)objc_opt_class(v17, v18);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS(v21, 33LL);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)SerialWithQoS;

    v17->_screenOwnerPID = -1;
    -[BKFirstBootDetector addObserver:](v17->_firstBootDetector, "addObserver:", v17);
    uint64_t v24 = objc_claimAutoreleasedReturnValue( -[BKSystemShellSentinel addSystemShellObserver:reason:]( v17->_systemAppSentinel,  "addSystemShellObserver:reason:",  v17,  @"BootUIPresenter"));
    systemShellObserving = v17->_systemShellObserving;
    v17->_systemShellObserving = (BSInvalidatable *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "hideAppleLogoOnLaunch"));
    v28 = v17->_queue;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10007077C;
    v36[3] = &unk_1000B8030;
    id v37 = v26;
    v29 = v17;
    v38 = v29;
    id v30 = v26;
    id v31 = [v30 observeDefault:v27 onQueue:v28 withBlock:v36];

    v32 = (dispatch_queue_s *)v17->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000707C4;
    block[3] = &unk_1000B8058;
    v35 = v29;
    dispatch_sync(v32, block);
  }

  return v17;
}

- (void)dealloc
{
  if (self->_systemActivityAssertion)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Must dismiss overlay before releasing"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v6 = NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v9 = (objc_class *)objc_opt_class(self, v8);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138544642;
      v28 = v7;
      __int16 v29 = 2114;
      id v30 = v11;
      __int16 v31 = 2048;
      v32 = self;
      __int16 v33 = 2114;
      v34 = @"BKBootUIPresenter.m";
      __int16 v35 = 1024;
      int v36 = 105;
      __int16 v37 = 2114;
      v38 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v5 UTF8String]);
    __break(0);
    JUMPOUT(0x10006E624LL);
  }

  if (self->_overlay)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Must dismiss overlay before releasing"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v13 = NSStringFromSelector(a2);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v16 = (objc_class *)objc_opt_class(self, v15);
      v17 = NSStringFromClass(v16);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138544642;
      v28 = v14;
      __int16 v29 = 2114;
      id v30 = v18;
      __int16 v31 = 2048;
      v32 = self;
      __int16 v33 = 2114;
      v34 = @"BKBootUIPresenter.m";
      __int16 v35 = 1024;
      int v36 = 106;
      __int16 v37 = 2114;
      v38 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v12 UTF8String]);
    __break(0);
    JUMPOUT(0x10006E710LL);
  }

  if (self->_underlay)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Must dismiss underlay before releasing"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v20 = NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v23 = (objc_class *)objc_opt_class(self, v22);
      uint64_t v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138544642;
      v28 = v21;
      __int16 v29 = 2114;
      id v30 = v25;
      __int16 v31 = 2048;
      v32 = self;
      __int16 v33 = 2114;
      v34 = @"BKBootUIPresenter.m";
      __int16 v35 = 1024;
      int v36 = 107;
      __int16 v37 = 2114;
      v38 = v19;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
    JUMPOUT(0x10006E7FCLL);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___BKBootUIPresenter;
  -[BKBootUIPresenter dealloc](&v26, "dealloc");
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay succinctDescription](self->_overlay, "succinctDescription"));
  id v5 = [v3 appendObject:v4 withName:@"_overlay" skipIfNil:1];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay succinctDescription](self->_underlay, "succinctDescription"));
  id v7 = [v3 appendObject:v6 withName:@"_underlay" skipIfNil:1];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);
  return (NSString *)v8;
}

- (BOOL)isShowingBootUI
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100070760;
  v5[3] = &unk_1000B8080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)dismissOverlayWithAnimationSettings:(id)a3 requstedByPID:(int)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100070640;
  block[3] = &unk_1000B80A8;
  int v11 = a4;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (BOOL)sustainOverlayForReason:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100070524;
  block[3] = &unk_1000B80D0;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)unsustainOverlayForReason:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100070404;
  block[3] = &unk_1000B8030;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)firstBootDetectorDidFinishFirstBoot:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000702F0;
  v7[3] = &unk_1000B8030;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)systemShellDidFinishLaunching:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100070218;
  v7[3] = &unk_1000B8030;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)systemShellChangedWithPrimary:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100070140;
  v7[3] = &unk_1000B8030;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_sync
{
}

- (void)_queue_setScreenOwnerPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_screenOwnerPID = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKSystemShellSentinel systemShells](self->_systemAppSentinel, "systemShells"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if (objc_msgSend(v11, "pid", (void)v22) == (_DWORD)v3)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
          v17 = (NSString *)[v16 copy];
          screenOwnerBundleIdentifier = self->_screenOwnerBundleIdentifier;
          self->_screenOwnerBundleIdentifier = v17;

          uint64_t v15 = (NSString *)v6;
          goto LABEL_11;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v13 = BSBundleIDForPID(v3, v12);
  char v14 = (NSString *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v15 = self->_screenOwnerBundleIdentifier;
  self->_screenOwnerBundleIdentifier = v14;
LABEL_11:

  id v19 = sub_10003F0B0();
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = self->_screenOwnerBundleIdentifier;
    *(_DWORD *)buf = 67109378;
    int v27 = v3;
    __int16 v28 = 2114;
    __int16 v29 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "screen owner is now pid:%d (%{public}@)",  buf,  0x12u);
  }
}

- (void)_queue_updateOverlayForReason:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssert(self->_queue, v5);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[BKSystemShellSentinel systemShellState](self->_systemAppSentinel, "systemShellState"));
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = *(id *)(v6 + 16);
    if (*(_BYTE *)(v7 + 8))
    {
      id v9 = sub_10003F0B0();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)v63 = v8;
      uint64_t v11 = "updateOverlay: Waiting for alternate shells -- (%{public}@) is temporary screen owner";
      uint64_t v12 = v10;
      uint32_t v13 = 12;
      goto LABEL_5;
    }

    uint64_t v57 = v7;
    p_int screenOwnerPID = &self->_screenOwnerPID;
    if (self->_screenOwnerPID > 0)
    {
      uint64_t v15 = *(void **)(v57 + 24);
LABEL_8:
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      id v10 = v15;
      id v16 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v58,  v64,  16LL);
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v59;
        id v56 = v4;
        while (2)
        {
          for (i = 0LL; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v59 != v18) {
              objc_enumerationMutation(v10);
            }
            v20 = *(void **)(*((void *)&v58 + 1) + 8LL * (void)i);
            int v21 = *p_screenOwnerPID;
            if (v21 == [v20 pid])
            {
              id v30 = sub_10003F0B0();
              __int16 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                int v32 = *p_screenOwnerPID;
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v63 = v32;
                *(_WORD *)&v63[4] = 2114;
                *(void *)&v63[6] = v20;
                _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "updateOverlay: pid:%d still exists (%{public}@)",  buf,  0x12u);
              }

              id v33 = v20;
              id v8 = v33;
              id v4 = v56;
              goto LABEL_25;
            }

            screenOwnerBundleIdentifier = self->_screenOwnerBundleIdentifier;
            if (screenOwnerBundleIdentifier)
            {
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleIdentifier]);
              unsigned int v24 = -[NSString isEqual:](screenOwnerBundleIdentifier, "isEqual:", v23);

              if (v24)
              {
                id v25 = sub_10003F0B0();
                objc_super v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  *(void *)v63 = v20;
                  _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "updateOverlay: New instance of owner shell (%{public}@)",  buf,  0xCu);
                }

                id v27 = v20;
                self->_int screenOwnerPID = [v27 pid];
                __int16 v28 = (NSString *)objc_claimAutoreleasedReturnValue([v27 bundleIdentifier]);
                __int16 v29 = self->_screenOwnerBundleIdentifier;
                self->_screenOwnerBundleIdentifier = v28;

                id v8 = v27;
              }
            }
          }

          id v17 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v58,  v64,  16LL);
          id v4 = v56;
          if (v17) {
            continue;
          }
          break;
        }
      }

- (void)_queue_removeOverlayWithAnimationSettings:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssert(self->_queue, v5);
  if (self->_systemActivityAssertion)
  {
    id v6 = sub_10003F0B0();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "removeOverlayWithAnimationSettings: Removing the overlay",  v11,  2u);
    }

    overlay = self->_overlay;
    if (overlay)
    {
      -[BKDisplayRenderOverlayManager removeOverlay:withAnimationSettings:]( self->_renderOverlayManager,  "removeOverlay:withAnimationSettings:",  overlay,  v4);
      id v9 = self->_overlay;
      self->_overlay = 0LL;
    }

    -[SWSystemActivityAssertion invalidate](self->_systemActivityAssertion, "invalidate");
    systemActivityAssertion = self->_systemActivityAssertion;
    self->_systemActivityAssertion = 0LL;
  }
}

- (void)_queue_continueAddingOverlayForReason:(id)a3 generation:(unint64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  BSDispatchQueueAssert(self->_queue, v7);
  systemActivityAssertion = self->_systemActivityAssertion;
  id v9 = sub_10003F0B0();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = v10;
  if (systemActivityAssertion)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 67109378;
      int v17 = v4;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "addOverlay(%d-%{public}@): Adding the overlay",  (uint8_t *)&v16,  0x12u);
    }

    LODWORD(v12) = 1161523200;
    uint32_t v13 = (BKDisplayRenderOverlay *)objc_claimAutoreleasedReturnValue( -[BKBootUIOverlayVendor currentOverlayWithLevel:]( self->_bootUIOverlayVendor,  "currentOverlayWithLevel:",  v12));
    overlay = self->_overlay;
    self->_overlay = v13;

    -[BKDisplayRenderOverlay setAnimates:](self->_overlay, "setAnimates:", 1LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay descriptor](self->_overlay, "descriptor"));
    [v15 _setInterstitial:1];

    -[BKDisplayRenderOverlayManager applyOverlay:withAnimationSettings:]( self->_renderOverlayManager,  "applyOverlay:withAnimationSettings:",  self->_overlay,  0LL);
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 67109378;
      int v17 = v4;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "addOverlay(%d-%{public}@): canceled adding overlay",  (uint8_t *)&v16,  0x12u);
    }
  }
}

- (void)_queue_acquireActivityAssertionForReason:(id)a3 generation:(unint64_t)a4 continuation:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  BSDispatchQueueAssert(self->_queue, v11);
  double v12 = -[SWSystemActivityAssertion initWithIdentifier:]( objc_alloc(&OBJC_CLASS___SWSystemActivityAssertion),  "initWithIdentifier:",  @"BKBootUIPresenter");
  if (!v12)
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"nil activity assertion"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      __int128 v23 = NSStringFromSelector(a2);
      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      objc_super v26 = (objc_class *)objc_opt_class(self, v25);
      id v27 = NSStringFromClass(v26);
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138544642;
      *(void *)id v36 = v24;
      *(_WORD *)&v36[8] = 2114;
      *(void *)&v36[10] = v28;
      __int16 v37 = 2048;
      v38 = self;
      __int16 v39 = 2114;
      v40 = @"BKBootUIPresenter.m";
      __int16 v41 = 1024;
      int v42 = 339;
      __int16 v43 = 2114;
      v44 = v22;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v22 UTF8String]);
    __break(0);
    JUMPOUT(0x10006F8D8LL);
  }

  uint32_t v13 = v12;
  id v14 = sub_10003F0B0();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)id v36 = a4;
    *(_WORD *)&void v36[4] = 2114;
    *(void *)&v36[6] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "addOverlay(%d-%{public}@): waiting for activity assertion",  buf,  0x12u);
  }

  double v17 = BSContinuousMachTimeNow(v16);
  objc_storeStrong((id *)&self->_systemActivityAssertion, v13);
  systemActivityAssertion = self->_systemActivityAssertion;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10006FFD0;
  v29[3] = &unk_1000B8118;
  double v34 = v17;
  id v32 = v10;
  unint64_t v33 = a4;
  id v30 = v9;
  __int16 v31 = v13;
  id v19 = v13;
  id v20 = v10;
  id v21 = v9;
  -[SWSystemActivityAssertion acquireWithTimeout:handler:]( systemActivityAssertion,  "acquireWithTimeout:handler:",  v29,  16.0);
}

- (void)_queue_addOverlayForReason:(id)a3
{
  id v5 = a3;
  BSDispatchQueueAssert(self->_queue, v6);
  unint64_t addOverlayGeneration = self->_addOverlayGeneration;
  if (addOverlayGeneration + 1 > 1) {
    unint64_t v8 = addOverlayGeneration + 1;
  }
  else {
    unint64_t v8 = 1LL;
  }
  self->_unint64_t addOverlayGeneration = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
  unsigned int v10 = [v9 hideAppleLogoOnLaunch];

  if (v10)
  {
    id v11 = sub_10003F0B0();
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)objc_super v26 = v8;
      *(_WORD *)&v26[4] = 2114;
      *(void *)&v26[6] = v5;
      uint32_t v13 = "addOverlay(%d-%{public}@): Not showing the boot UI overlay because we were told to hide it";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x12u);
      goto LABEL_11;
    }

    goto LABEL_11;
  }

  if (self->_systemActivityAssertion)
  {
    id v14 = sub_10003F0B0();
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)objc_super v26 = v8;
      *(_WORD *)&v26[4] = 2114;
      *(void *)&v26[6] = v5;
      uint32_t v13 = "addOverlay(%d-%{public}@): Overlay pending or already in place";
      goto LABEL_10;
    }

- (void)_queue_addUnderlay
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults localDefaults](&OBJC_CLASS___BKSDefaults, "localDefaults"));
  unsigned int v4 = [v3 hideAppleLogoOnLaunch];

  if (v4)
  {
    id v5 = sub_10003F0B0();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "addUnderlay: Not showing the boot UI underlay because we were told to hide it",  buf,  2u);
    }
  }

  else
  {
    underlay = self->_underlay;
    id v8 = sub_10003F0B0();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (underlay)
    {
      if (v10)
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "addUnderlay: Underlay already in place",  v14,  2u);
      }
    }

    else
    {
      if (v10)
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "addUnderlay:  Adding the underlay", v15, 2u);
      }

      LODWORD(v11) = -1.0;
      double v12 = (BKDisplayRenderOverlay *)objc_claimAutoreleasedReturnValue( -[BKBootUIOverlayVendor currentOverlayWithLevel:]( self->_bootUIOverlayVendor,  "currentOverlayWithLevel:",  v11));
      uint32_t v13 = self->_underlay;
      self->_underlay = v12;

      -[BKDisplayRenderOverlayManager applyOverlay:withAnimationSettings:]( self->_renderOverlayManager,  "applyOverlay:withAnimationSettings:",  self->_underlay,  0LL);
    }
  }

- (void)_queue_removeUnderlay
{
  if (self->_underlay)
  {
    id v3 = sub_10003F0B0();
    unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "_queue_removeUnderlay: Removing the underlay",  v6,  2u);
    }

    -[BKDisplayRenderOverlayManager removeOverlay:withAnimationSettings:]( self->_renderOverlayManager,  "removeOverlay:withAnimationSettings:",  self->_underlay,  0LL);
    underlay = self->_underlay;
    self->_underlay = 0LL;
  }

- (SWSystemActivityAssertion)systemActivityAssertion
{
  return self->_systemActivityAssertion;
}

- (void)setSystemActivityAssertion:(id)a3
{
}

- (BKDisplayRenderOverlay)underlay
{
  return self->_underlay;
}

- (void)setUnderlay:(id)a3
{
}

- (BKDisplayRenderOverlay)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1000DC298 != -1) {
    dispatch_once(&qword_1000DC298, &stru_1000B8008);
  }
  return (id)qword_1000DC290;
}

@end