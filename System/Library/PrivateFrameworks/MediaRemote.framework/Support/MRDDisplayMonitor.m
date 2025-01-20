@interface MRDDisplayMonitor
+ (MRDDisplayMonitor)sharedMonitor;
- (BOOL)ambientForegrounded;
- (BOOL)ambientVisible;
- (BOOL)controlCenterForegrounded;
- (BOOL)controlCenterVisible;
- (BOOL)displayOn;
- (BOOL)homeScreenForegrounded;
- (BOOL)homeScreenVisible;
- (BOOL)lockScreenForegrounded;
- (BOOL)lockScreenVisible;
- (BOOL)routePickerForegrounded;
- (BOOL)routePickerVisible;
- (BOOL)siriForegrounded;
- (BOOL)siriVisible;
- (MRDDisplayMonitor)init;
- (NSSet)presentedBundleIdentifiers;
- (NSString)primaryUIApplicationBundleIdentifier;
- (os_unfair_lock_s)lock;
- (void)dealloc;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)scheduleLayoutChangeForReason:(id)a3;
- (void)setAmbientForegrounded:(BOOL)a3;
- (void)setControlCenterForegrounded:(BOOL)a3;
- (void)setDisplayOn:(BOOL)a3;
- (void)setHomeScreenForegrounded:(BOOL)a3;
- (void)setLockScreenForegrounded:(BOOL)a3;
- (void)setPresentedBundleIdentifiers:(id)a3;
- (void)setPrimaryUIApplicationBundleIdentifier:(id)a3;
- (void)setRoutePickerForegrounded:(BOOL)a3;
- (void)setSiriForegrounded:(BOOL)a3;
@end

@implementation MRDDisplayMonitor

+ (MRDDisplayMonitor)sharedMonitor
{
  if (qword_1003FE0C0 != -1) {
    dispatch_once(&qword_1003FE0C0, &stru_1003A1D38);
  }
  return (MRDDisplayMonitor *)(id)qword_1003FE0C8;
}

- (MRDDisplayMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRDDisplayMonitor;
  v2 = -[MRDDisplayMonitor init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_time_t v4 = dispatch_time(0LL, 200000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10012B414;
    block[3] = &unk_100399250;
    v7 = v3;
    dispatch_after(v4, &_dispatch_main_q, block);
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRDDisplayMonitor;
  -[MRDDisplayMonitor dealloc](&v3, "dealloc");
}

- (BOOL)displayOn
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_displayOn;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setDisplayOn:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_displayOn != v3)
  {
    self->_displayOn = v3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10012B6C8;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
    v5 = objc_alloc(&OBJC_CLASS___NSString);
    if (self->_displayOn) {
      v6 = @"On";
    }
    else {
      v6 = @"Off";
    }
    v7 = -[NSString initWithFormat:](v5, "initWithFormat:", @"Display%@", v6);
    -[MRDDisplayMonitor scheduleLayoutChangeForReason:](self, "scheduleLayoutChangeForReason:", v7);
  }

- (BOOL)lockScreenForegrounded
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lockScreenForegrounded;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLockScreenForegrounded:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_lockScreenForegrounded != v3)
  {
    self->_lockScreenForegrounded = v3;
    v5 = objc_alloc(&OBJC_CLASS___NSString);
    if (self->_lockScreenForegrounded) {
      v6 = @"Fore";
    }
    else {
      v6 = @"Back";
    }
    v7 = -[NSString initWithFormat:](v5, "initWithFormat:", @"LockScreen%@grounded", v6);
    -[MRDDisplayMonitor scheduleLayoutChangeForReason:](self, "scheduleLayoutChangeForReason:", v7);
  }

- (BOOL)homeScreenForegrounded
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_homeScreenForegrounded;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHomeScreenForegrounded:(BOOL)a3
{
  self->_homeScreenForegrounded = a3;
}

- (BOOL)controlCenterForegrounded
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_controlCenterForegrounded;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setControlCenterForegrounded:(BOOL)a3
{
  self->_controlCenterForegrounded = a3;
}

- (BOOL)siriForegrounded
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_siriForegrounded;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSiriForegrounded:(BOOL)a3
{
  self->_siriForegrounded = a3;
}

- (BOOL)ambientForegrounded
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_ambientForegrounded;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAmbientForegrounded:(BOOL)a3
{
  self->_ambientForegrounded = a3;
}

- (BOOL)routePickerForegrounded
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_routePickerForegrounded;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setRoutePickerForegrounded:(BOOL)a3
{
  self->_routePickerForegrounded = a3;
}

- (NSSet)presentedBundleIdentifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  presentedBundleIdentifiers = self->_presentedBundleIdentifiers;
  if (presentedBundleIdentifiers) {
    v5 = presentedBundleIdentifiers;
  }
  else {
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  }
  v6 = v5;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)setPresentedBundleIdentifiers:(id)a3
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (([v6 isEqual:self->_presentedBundleIdentifiers] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_presentedBundleIdentifiers, a3);
    v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"PresentedBundleIdentifiersChanged");
    -[MRDDisplayMonitor scheduleLayoutChangeForReason:](self, "scheduleLayoutChangeForReason:", v5);
  }
}

- (NSString)primaryUIApplicationBundleIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dispatch_time_t v4 = self->_primaryBundleIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPrimaryUIApplicationBundleIdentifier:(id)a3
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (([v6 isEqual:self->_primaryBundleIdentifier] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_primaryBundleIdentifier, a3);
    v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"PrimaryUIApplicationBundleIdentifierChanged");
    -[MRDDisplayMonitor scheduleLayoutChangeForReason:](self, "scheduleLayoutChangeForReason:", v5);
  }
}

- (BOOL)lockScreenVisible
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_displayOn && self->_lockScreenForegrounded;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)homeScreenVisible
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_displayOn && self->_homeScreenForegrounded;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)controlCenterVisible
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_displayOn && self->_controlCenterForegrounded;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)siriVisible
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_displayOn && self->_siriForegrounded;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)ambientVisible
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_displayOn && self->_ambientForegrounded;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)routePickerVisible
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_displayOn && self->_routePickerForegrounded;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v45 = a3;
  id v7 = a4;
  id v44 = a5;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  v46 = v7;
  id obj = (id)objc_claimAutoreleasedReturnValue([v7 elements]);
  id v58 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v58)
  {
    v48 = 0LL;
    char v8 = 0;
    char v9 = 0;
    char v10 = 0;
    char v11 = 0;
    char v12 = 0;
    char v13 = 0;
    uint64_t v56 = *(void *)v61;
    uint64_t v53 = FBSDisplayLayoutElementControlCenterIdentifier;
    uint64_t v54 = FBSDisplayLayoutElementLockScreenIdentifier;
    uint64_t v51 = SBSDisplayLayoutElementHomeScreenIdentifier;
    uint64_t v52 = FBSDisplayLayoutElementSiriIdentifier;
    do
    {
      for (i = 0LL; i != v58; i = (char *)i + 1)
      {
        if (*(void *)v61 != v56) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);

        if (v16)
        {
          id v17 = [v15 layoutRole];
          id v18 = [v15 layoutRole];
          if (v17 == (id)1 && [v15 isUIApplicationElement])
          {
            uint64_t v19 = objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);

            v48 = (void *)v19;
          }

          if (v18 != (id)5)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
            [v49 addObject:v20];
          }
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
        unsigned __int8 v22 = [v21 isEqualToString:v54];

        v13 |= v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
        unsigned __int8 v24 = [v23 isEqualToString:v53];

        v11 |= v24;
        v25 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
        unsigned __int8 v26 = [v25 isEqualToString:v52];

        v10 |= v26;
        v27 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
        unsigned __int8 v28 = [v27 isEqualToString:v51];

        v12 |= v28;
        uint64_t v29 = objc_claimAutoreleasedReturnValue([v15 identifier]);
        unsigned __int8 v30 = [(id)v29 isEqualToString:@"SBAmbientTransientOverlayViewController"];

        v9 |= v30;
        v31 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
        LOBYTE(v29) = [v31 isEqualToString:@"com.apple.MusicUIService"];

        v8 |= v29;
      }

      id v58 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
    }

    while (v58);
  }

  else
  {
    v48 = 0LL;
    char v8 = 0;
    char v9 = 0;
    char v10 = 0;
    char v11 = 0;
    char v12 = 0;
    char v13 = 0;
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_displayOn)
  {
    int lockScreenForegrounded = self->_lockScreenForegrounded;
    int controlCenterForegrounded = self->_controlCenterForegrounded;
    int siriForegrounded = self->_siriForegrounded;
    int ambientForegrounded = self->_ambientForegrounded;
    int routePickerForegrounded = self->_routePickerForegrounded;
  }

  else
  {
    int ambientForegrounded = 0;
    int controlCenterForegrounded = 0;
    int lockScreenForegrounded = 0;
    int siriForegrounded = 0;
    int routePickerForegrounded = 0;
  }

  -[MRDDisplayMonitor setDisplayOn:](self, "setDisplayOn:", (uint64_t)[v46 displayBacklightLevel] > 0);
  id v34 = [v49 copy];
  -[MRDDisplayMonitor setPresentedBundleIdentifiers:](self, "setPresentedBundleIdentifiers:", v34);

  -[MRDDisplayMonitor setPrimaryUIApplicationBundleIdentifier:](self, "setPrimaryUIApplicationBundleIdentifier:", v48);
  -[MRDDisplayMonitor setControlCenterForegrounded:](self, "setControlCenterForegrounded:", v11 & 1);
  -[MRDDisplayMonitor setSiriForegrounded:](self, "setSiriForegrounded:", v10 & 1);
  -[MRDDisplayMonitor setLockScreenForegrounded:](self, "setLockScreenForegrounded:", v13 & 1);
  -[MRDDisplayMonitor setHomeScreenForegrounded:](self, "setHomeScreenForegrounded:", v12 & 1);
  -[MRDDisplayMonitor setAmbientForegrounded:](self, "setAmbientForegrounded:", v9 & 1);
  -[MRDDisplayMonitor setRoutePickerForegrounded:](self, "setRoutePickerForegrounded:", v8 & 1);
  int displayOn = self->_displayOn;
  if (self->_displayOn)
  {
    int v36 = self->_lockScreenForegrounded;
    int displayOn = self->_controlCenterForegrounded;
    int v37 = self->_siriForegrounded;
    int v38 = self->_ambientForegrounded;
    int v39 = self->_routePickerForegrounded;
  }

  else
  {
    int v38 = 0;
    int v36 = 0;
    int v37 = 0;
    int v39 = 0;
  }

  if (lockScreenForegrounded == v36)
  {
    if (controlCenterForegrounded == displayOn)
    {
      if (siriForegrounded == v37)
      {
        if (ambientForegrounded == v38)
        {
          if (routePickerForegrounded == v39) {
            goto LABEL_35;
          }
          v40 = @"RoutePicker%@Visible";
          int v36 = v39;
        }

        else
        {
          v40 = @"Ambient%@Visible";
          int v36 = v38;
        }
      }

      else
      {
        v40 = @"Siri%@Visible";
        int v36 = v37;
      }
    }

    else
    {
      v40 = @"ControlCenter%@Visible";
      int v36 = displayOn;
    }
  }

  else
  {
    v40 = @"LockScreen%@Visible";
  }

  v41 = objc_alloc(&OBJC_CLASS___NSString);
  v42 = @"Not";
  if (v36) {
    v42 = &stru_1003AE680;
  }
  v43 = -[NSString initWithFormat:](v41, "initWithFormat:", v40, v42);
  -[MRDDisplayMonitor scheduleLayoutChangeForReason:](self, "scheduleLayoutChangeForReason:", v43);

LABEL_35:
  os_unfair_lock_unlock(&self->_lock);
}

- (void)scheduleLayoutChangeForReason:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v6 = _MRLogForCategory(0LL, v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[MRDDisplayMonitor] Layout Changed %@",  buf,  0xCu);
  }

  if (!self->_layoutChangeScheduled)
  {
    self->_layoutChangeScheduled = 1;
    dispatch_time_t v8 = dispatch_time(0LL, 200000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10012C3D4;
    block[3] = &unk_100399250;
    void block[4] = self;
    dispatch_after(v8, &_dispatch_main_q, block);
  }
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
}

@end