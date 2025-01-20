@interface PBRestrictionPINManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)dismiss;
- (BOOL)isPresenting;
- (BOOL)shouldRestoreConferenceRoomDisplay;
- (CPSAuthenticationSession)authenticationSession;
- (PBRestrictionPINManager)init;
- (PBSystemGestureHandle)dismissGesture;
- (void)_setupGesturesWithManager:(id)a3;
- (void)dealloc;
- (void)presentWithRequest:(id)a3 resultBlock:(id)a4;
- (void)setAuthenticationSession:(id)a3;
@end

@implementation PBRestrictionPINManager

+ (PBDependencyDescription)dependencyDescription
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002487C;
  v5[3] = &unk_1003CFF78;
  v5[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v5);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___PBSystemGestureManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v3);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100024914;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_10046FFD8 != -1) {
    dispatch_once(&qword_10046FFD8, block);
  }
  return (id)qword_10046FFD0;
}

- (PBRestrictionPINManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBRestrictionPINManager;
  v2 = -[PBRestrictionPINManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1000249D8;
    v5[3] = &unk_1003D0FA8;
    uint64_t v6 = v2;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v6,  v5);
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBRestrictionPINManager;
  -[PBRestrictionPINManager dealloc](&v3, "dealloc");
}

- (BOOL)isPresenting
{
  return self->_authenticationSession != 0LL;
}

- (void)presentWithRequest:(id)a3 resultBlock:(id)a4
{
  id v32 = a3;
  id v27 = a4;
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[PBConferenceRoomDisplayManager sharedInstance]( &OBJC_CLASS___PBConferenceRoomDisplayManager,  "sharedInstance"));
  unsigned int v30 = [v31 isPresenting];
  if (v30) {
    [v31 dismissCRDWaitingScreen];
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBUserProfileManager sharedInstance](&OBJC_CLASS___PBUserProfileManager, "sharedInstance"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userProfilesSnapshot]);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userProfiles]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bypassRestrictionsUsingCompanionDeviceUserSettingsDictionary]);

  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v11 = v28;
    id v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v39;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 identifier]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v16]);
          unsigned int v18 = [v17 BOOLValue];

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue([v15 iCloudAltDSID]);
            BOOL v20 = v19 == 0LL;

            if (!v20)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue([v15 iCloudAltDSID]);
              -[NSMutableArray addObject:](v10, "addObject:", v21);
            }
          }
        }

        id v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }

      while (v12);
    }
  }

  else
  {
    v10 = 0LL;
  }

  id v22 = objc_alloc_init(&OBJC_CLASS___CPSRestrictedAccessRequest);
  [v22 setApproversAppleAccountAltDSIDs:v10];
  if ([v32 requestType] == (id)1)
  {
    uint64_t v23 = 1LL;
  }

  else if ([v32 requestType] == (id)2)
  {
    unint64_t v26 = (unint64_t)[v32 restrictedSettingType];
    if (v26 >= 6) {
      uint64_t v23 = 2LL;
    }
    else {
      uint64_t v23 = qword_1002EC030[v26];
    }
  }

  else
  {
    if ([v32 requestType] != (id)3) {
      goto LABEL_19;
    }
    uint64_t v23 = 4LL;
  }

  [v22 setRestrictionType:v23];
LABEL_19:
  v24 = -[CPSAuthenticationSession initWithRequest:]( objc_alloc(&OBJC_CLASS___CPSAuthenticationSession),  "initWithRequest:",  v22);
  objc_initWeak(&location, self);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100024E58;
  v33[3] = &unk_1003D0FF8;
  objc_copyWeak(&v35, &location);
  id v25 = v27;
  id v34 = v25;
  char v36 = v30;
  -[CPSAuthenticationSession setSessionCompletionHandler:](v24, "setSessionCompletionHandler:", v33);
  objc_storeStrong((id *)&self->_authenticationSession, v24);
  -[CPSAuthenticationSession start](v24, "start");

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

- (BOOL)dismiss
{
  authenticationSession = self->_authenticationSession;
  if (authenticationSession)
  {
    -[CPSAuthenticationSession cancel](self->_authenticationSession, "cancel");
    v4 = self->_authenticationSession;
    self->_authenticationSession = 0LL;
  }

  return authenticationSession != 0LL;
}

- (void)_setupGesturesWithManager:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000250A8;
  v7[3] = &unk_1003D1020;
  objc_copyWeak(&v8, &location);
  v5 = (PBSystemGestureHandle *)[v4 newHandleForSystemGesture:39 actionHandler:v7];
  dismissGesture = self->_dismissGesture;
  self->_dismissGesture = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (BOOL)shouldRestoreConferenceRoomDisplay
{
  return self->_shouldRestoreConferenceRoomDisplay;
}

- (PBSystemGestureHandle)dismissGesture
{
  return self->_dismissGesture;
}

- (CPSAuthenticationSession)authenticationSession
{
  return self->_authenticationSession;
}

- (void)setAuthenticationSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end