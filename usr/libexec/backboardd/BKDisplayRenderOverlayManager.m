@interface BKDisplayRenderOverlayManager
+ (id)sharedInstance;
- (BOOL)applyOverlay:(id)a3 withAnimationSettings:(id)a4;
- (BOOL)backlightLocked;
- (BOOL)freezeOverlay:(id)a3;
- (BOOL)isShowingNonBootUIOverlays;
- (BOOL)removeOverlay:(id)a3 withAnimationSettings:(id)a4;
- (NSMutableSet)activeOverlays;
- (NSMutableSet)overlaysDisablingUpdates;
- (id)_initWithPersistenceCoordinator:(id)a3 orientationManager:(id)a4 backlightManager:(id)a5 windowServer:(id)a6;
- (id)_updateWindowServerUpdatesForOverlays:(id)a3;
- (id)activeOverlayWithDescriptor:(id)a3;
- (id)description;
- (int64_t)lockedOrientation;
- (void)_lock_freezeOverlay:(id)a3;
- (void)_lock_setBacklightLocked:(BOOL)a3;
- (void)_lock_setLockedOrientation:(int64_t)a3;
- (void)_lock_setOverlaysDisablingUpdates:(id)a3;
- (void)_lock_updateStateForActiveOverlayChange;
- (void)prepareForRestart;
@end

@implementation BKDisplayRenderOverlayManager

- (id)_initWithPersistenceCoordinator:(id)a3 orientationManager:(id)a4 backlightManager:(id)a5 windowServer:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v61.receiver = self;
  v61.super_class = [BKDisplayRenderOverlayManager class];
  BKDisplayRenderOverlayManager *v15 = [[BKDisplayRenderOverlayManager alloc] init];
  v16 = v15;
  if (v15)
  {
    if (!v14)
    {
      v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@" @"windowServer"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v30 = NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        v33 = [v16 class];
        v34 = NSStringFromClass(v33);
        v35 = [v34 autorelease];
        *(_DWORD *)buf = 138544642;
        v64 = v31;
        __int16 v65 = 2114;
        v66 = v35;
        __int16 v67 = 2048;
        v68 = v16;
        __int16 v69 = 2114;
        v70 = @"BKDisplayRenderOverlayManager.m";
        __int16 v71 = 1024;
        int v72 = 55;
        __int16 v73 = 2114;
        v74 = v29;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v29 UTF8String]);
      __break(0);
      JUMPOUT(0x10006CE80LL);
    }

    if (!v13)
    {
      v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"backlightManager"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v37 = NSStringFromSelector(a2);
        v38 = [v37 autorelease];
        v40 = [v16 class];
        v41 = NSStringFromClass(v40);
        v42 = v41;
        *(_DWORD *)buf = 138544642;
        v64 = v38;
        __int16 v65 = 2114;
        v66 = v42;
        __int16 v67 = 2048;
        v68 = v16;
        __int16 v69 = 2114;
        v70 = @"BKDisplayRenderOverlayManager.m";
        __int16 v71 = 1024;
        int v72 = 56;
        __int16 v73 = 2114;
        v74 = v36;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v36 UTF8String]);
      __break(0);
      JUMPOUT(0x10006CF78LL);
    }

    if (!v12)
    {
      v43 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"orientationManager"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v44 = NSStringFromSelector(a2);
        v45 = v44;
        v47 = [v16 class];
        v48 = NSStringFromClass(v47);
        v49 = v48;
        *(_DWORD *)buf = 138544642;
        v64 = v45;
        __int16 v65 = 2114;
        v66 = v49;
        __int16 v67 = 2048;
        v68 = v16;
        __int16 v69 = 2114;
        v70 = @"BKDisplayRenderOverlayManager.m";
        __int16 v71 = 1024;
        int v72 = 57;
        __int16 v73 = 2114;
        v74 = v43;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v43 UTF8String]);
      __break(0);
      JUMPOUT(0x10006D070LL);
    }

    if (!v11)
    {
      NSString *v50 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"persistenceCoordinator"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v51 = NSStringFromSelector(a2);
        v52 = v51;
        v54 = [v16 class];
        v55 = NSStringFromClass(v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
        *(_DWORD *)buf = 138544642;
        v64 = v52;
        __int16 v65 = 2114;
        v66 = v56;
        __int16 v67 = 2048;
        v68 = v16;
        __int16 v69 = 2114;
        v70 = @"BKDisplayRenderOverlayManager.m";
        __int16 v71 = 1024;
        int v72 = 58;
        __int16 v73 = 2114;
        v74 = v50;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v50 UTF8String]);
      __break(0);
      JUMPOUT(0x10006D168LL);
    }

    [v15 setWindowServer:a6];
    v16->_orientationManager = a4;
    [v16 setBacklightManager:a5];
    NSMutableSet *v17 = [[NSMutableSet alloc] init];
    activeOverlays = v16->_activeOverlays;
    v16->_activeOverlays = v17;

    v16->_lock._os_unfair_lock_opaque = 0;
    v16->_lockedOrientation = 0LL;
    v16->_backlightLocked = 0;
    v19 = [v11 rebuildPersistentOverlays];
    v20 = [NSSet setWithArray:v19];

    uint64_t v21 = [BKDisplayRenderOverlayManager _updateWindowServerUpdatesForOverlays:v20];
    overlaysDisablingUpdates = v16->_overlaysDisablingUpdates;
    v16->_overlaysDisablingUpdates = (NSMutableSet *)v21;

    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    id v23 = v20;
    id v24 = [v23 countByEnumeratingWithState:v57 objects:v62 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v58;
      do
      {
        v27 = 0LL;
        do
        {
          if (*(void *)v58 != v26) {
            objc_enumerationMutation(v23);
          }
          [v16 applyOverlay:v57 withAnimationSettings:v27];
          v27 = (char *)v27 + 1;
        }

        while (v25 != v27);
        id v25 = [v23 countByEnumeratingWithState:v57 objects:v62 count:16];
      }

      while (v25);
    }
  }

  return v16;
}

- (id)description
{
  BSDescriptionBuilder *v3 = [BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_activeOverlays withName:@"activeOverlays"];
  v5 = [v3 build];

  return v5;
}

- (id)activeOverlayWithDescriptor:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v6 = self->_activeOverlays;
  [v6 countByEnumeratingWithState:v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = v14[i];
        id v11 = [v10 descriptor];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      [v6 countByEnumeratingWithState:v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (NSMutableSet)activeOverlays
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSMutableSet *v4 = [self->_activeOverlays copy];
  os_unfair_lock_unlock(p_lock);
  return (NSMutableSet *)v4;
}

- (BOOL)applyOverlay:(id)a3 withAnimationSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  unsigned int v8 = [v6 presentWithAnimationSettings:v7];

  if (v8)
  {
    [self->_activeOverlays addObject:v6];
    [_lock_updateStateForActiveOverlayChange];
  }

  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

- (BOOL)removeOverlay:(id)a3 withAnimationSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  BOOL v8 = [self->_activeOverlays containsObject:v6];
  if (v8)
  {
    [v6 dismissWithAnimationSettings:v7];
    [self->_activeOverlays removeObject:v6];
    [self->_overlaysDisablingUpdates removeObject:v6];
    v9 = [BKDisplayRenderOverlayManager _updateWindowServerUpdatesForOverlays:self->_overlaysDisablingUpdates];
    [self _lock_setOverlaysDisablingUpdates:v9];

    [_lock_updateStateForActiveOverlayChange];
  }

  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

- (BOOL)freezeOverlay:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  BOOL v5 = [self->_activeOverlays containsObject:v4];
  if (v5) {
    [self _lock_freezeOverlay:v4];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (void)prepareForRestart
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v4 = self->_activeOverlays;
  [v4 countByEnumeratingWithState:v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      unsigned int v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [self _lock_freezeOverlay:v9];
        unsigned int v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      [v4 countByEnumeratingWithState:v9 objects:v13 count:16];
    }

    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isShowingNonBootUIOverlays
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v4 = self->_activeOverlays;
  [v4 countByEnumeratingWithState:v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        unsigned int v8 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        if (objc_msgSend(v8, "type", (void)v10) != (id)2 && objc_msgSend(v8, "type") != (id)3)
        {
          LOBYTE(v5) = 1;
          goto LABEL_12;
        }
      }

      [v4 countByEnumeratingWithState:v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

- (void)_lock_setOverlaysDisablingUpdates:(id)a3
{
  uint64_t v7 = (NSMutableSet *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  overlaysDisablingUpdates = self->_overlaysDisablingUpdates;
  p_overlaysDisablingUpdates = &self->_overlaysDisablingUpdates;
  if (overlaysDisablingUpdates != v7) {
    objc_storeStrong((id *)p_overlaysDisablingUpdates, a3);
  }
}

- (void)_lock_freezeOverlay:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  unsigned __int8 v5 = [v4 isFrozen];
  id v6 = sub_10003F368();
  uint64_t v7 = [v6 autorelease];
  unsigned int v8 = v7;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543362;
      v19[0] = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Requested freezing of an already frozen overlay; ignoring freeze request for overlay:%{public}@",
        (uint8_t *)&v18,
        0xCu);
    }

- (void)_lock_updateStateForActiveOverlayChange
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v14 = self;
  v3 = self->_activeOverlays;
  [v3 countByEnumeratingWithState:v15 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    id v7 = 0LL;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        if (BSInterfaceOrientationIsValid([v10 interfaceOrientation]))
        {
          if (BSInterfaceOrientationIsValid(v7) && v7 != [v10 interfaceOrientation])
          {
            id v11 = sub_10003F368();
            os_log_s *v12 = [v11 autorelease];
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              __int128 v13 = (void *)[v10 succinctDescription];
              *(_DWORD *)buf = 138543362;
              v20 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Conflicting choices for orientation lock, choosing orientation for this overlay: %{public}@",  buf,  0xCu);
            }
          }

          id v7 = [v10 interfaceOrientation];
        }

        v6 |= [v10 lockBacklight];
      }

      [v3 countByEnumeratingWithState:v15 objects:v21 count:16];
    }

    while (v5);
  }

  else
  {
    LOBYTE(v6) = 0;
    id v7 = 0LL;
  }

  [v14 _lock_setLockedOrientation:v7];
  [v14 _lock_setBacklightLocked:v6 & 1];
}

- (void)_lock_setLockedOrientation:(int64_t)a3
{
  if (self->_lockedOrientation != a3)
  {
    self->_lockedOrientation = a3;
    int IsValid = BSInterfaceOrientationIsValid(a3);
    orientationManager = self->_orientationManager;
    uint64_t v7 = BSGetVersionedPID();
    if (IsValid) {
      sub_100066A38((uint64_t)orientationManager, 4LL, a3, v7);
    }
    else {
      sub_100067018((uint64_t)orientationManager, 4LL, v7);
    }
  }

- (void)_lock_setBacklightLocked:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_backlightLocked != v3)
  {
    self->_backlightLocked = v3;
    backlightManager = self->_backlightManager;
    uint64_t v7 = (objc_class *)[self class];
    uint64_t v8 = NSStringFromClass(v7);
    id v9 = v8;
    [backlightManager setBacklightLocked:v3 forReason:v9];
  }

- (id)_updateWindowServerUpdatesForOverlays:(id)a3
{
  id v4 = a3;
  NSMutableSet *v40 = [[NSMutableSet alloc] init];
  uint64_t v5 = (void *)[self->_windowServer displays];
  id v6 = [v5 mutableCopy];

  NSMutableArray *v7 = [[NSMutableArray alloc] init];
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v50;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(v8);
        }
        __int128 v13 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
        if ([v13 disablesDisplayUpdates])
        {
          windowServer = self->_windowServer;
          __int128 v15 = (void *)[v13 display];
          __int128 v16 = [windowServer displayWithDisplayId:[v15 displayId]];

          [v40 addObject:v13];
          [v6 removeObject:v16];
          [v7 addObject:v16];
        }
      }

      id v10 = [v8 countByEnumeratingWithState:v49 objects:v57 count:16];
    }

    while (v10);
  }

  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v17 = v7;
  [v17 countByEnumeratingWithState:v45 objects:v56 count:16];
  if (v18)
  {
    id v20 = v18;
    uint64_t v21 = *(void *)v46;
    *(void *)&__int128 v19 = 67109120LL;
    __int128 v38 = v19;
    do
    {
      for (j = 0LL; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(v17);
        }
        id v23 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
        if ((objc_msgSend(v23, "disablesUpdates", v38) & 1) == 0)
        {
          id v24 = sub_10003F368();
          os_log_s *v25 = v24;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v26 = [v23 displayId];
            *(_DWORD *)buf = v38;
            unsigned int v55 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Disabling framebuffer changes on display (%d) because we have overlays that require disabled updates.",  buf,  8u);
          }

          [v23 setDisablesUpdates:1];
        }
      }

      [v17 countByEnumeratingWithState:v45 objects:v56 count:16];
    }

    while (v20);
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id v27 = v6;
  id v28 = [v27 countByEnumeratingWithState:v41 objects:v53 count:16];
  if (v28)
  {
    id v30 = v28;
    uint64_t v31 = *(void *)v42;
    *(void *)&__int128 v29 = 67109120LL;
    __int128 v39 = v29;
    do
    {
      for (k = 0LL; k != v30; k = (char *)k + 1)
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(v27);
        }
        v33 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)k);
        if (objc_msgSend(v33, "disablesUpdates", v39))
        {
          id v34 = sub_10003F368();
          os_log_s *v35 = v34;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v36 = [v33 displayId];
            *(_DWORD *)buf = v39;
            unsigned int v55 = v36;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Enabling framebuffer changes on display (%d) because we have don't have any overlays that require disabled updates.",  buf,  8u);
          }

          [v33 setDisablesUpdates:0];
        }
      }

      id v30 = [v27 countByEnumeratingWithState:v41 objects:v53 count:16];
    }

    while (v30);
  }

  return v40;
}

- (NSMutableSet)overlaysDisablingUpdates
{
  return self->_overlaysDisablingUpdates;
}

- (BOOL)backlightLocked
{
  return self->_backlightLocked;
}

- (int64_t)lockedOrientation
{
  return self->_lockedOrientation;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1000DC288 != -1) {
    dispatch_once(&qword_1000DC288, &stru_1000B7FE8);
  }
  return (id)qword_1000DC280;
}

@end