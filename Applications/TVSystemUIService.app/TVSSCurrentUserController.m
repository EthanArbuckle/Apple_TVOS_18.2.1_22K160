@interface TVSSCurrentUserController
- (TVSSCurrentUserController)initWithUserImageDiameter:(double)a3;
- (TVSSCurrentUserController)initWithUserProfileManager:(id)a3 profilePictureService:(id)a4;
- (TVSSUser)currentUser;
- (void)_fetchCurrentUserAndUpdateWithReason:(id)a3;
- (void)_fetchCurrentUserAndUpdateWithReason:(id)a3 userProfilesSnapshot:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)userProfileManagerDidUpdate:(id)a3;
@end

@implementation TVSSCurrentUserController

- (TVSSCurrentUserController)initWithUserImageDiameter:(double)a3
{
  v8 = self;
  v7[2] = (id)a2;
  v7[1] = *(id *)&a3;
  v7[0] = -[TVSUIUserProfilePictureService initWithProfilePictureDiameter:]( objc_alloc(&OBJC_CLASS___TVSUIUserProfilePictureService),  "initWithProfilePictureDiameter:",  a3);
  v4 = v8;
  v5 = +[PBSUserProfileManager sharedInstance](&OBJC_CLASS___PBSUserProfileManager, "sharedInstance");
  v8 = 0LL;
  v8 = -[TVSSCurrentUserController initWithUserProfileManager:profilePictureService:]( v4,  "initWithUserProfileManager:profilePictureService:");
  v6 = v8;

  objc_storeStrong(v7, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v6;
}

- (TVSSCurrentUserController)initWithUserProfileManager:(id)a3 profilePictureService:(id)a4
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  v4 = v13;
  v13 = 0LL;
  v10.receiver = v4;
  v10.super_class = (Class)&OBJC_CLASS___TVSSCurrentUserController;
  v13 = -[TVSSCurrentUserController init](&v10, "init");
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v13->_observers;
    v13->_observers = v5;

    objc_storeStrong((id *)&v13->_userProfileManager, location[0]);
    -[PBSUserProfileManager addObserver:](v13->_userProfileManager, "addObserver:", v13);
    objc_storeStrong((id *)&v13->_profilePictureService, v11);
    -[TVSSCurrentUserController _fetchCurrentUserAndUpdateWithReason:]( v13,  "_fetchCurrentUserAndUpdateWithReason:",  @"Initial Update");
  }

  v8 = v13;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  return v8;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[PBSUserProfileManager removeObserver:](self->_userProfileManager, "removeObserver:", self);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSCurrentUserController;
  -[TVSSCurrentUserController dealloc](&v2, "dealloc");
}

- (void)addObserver:(id)a3
{
  v19 = self;
  SEL v18 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    v16 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
    id v15 = &_os_log_default;
    char v14 = 16;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v15;
      os_log_type_t type = v14;
      objc_super v10 = NSStringFromSelector(v18);
      v6 = v10;
      v13 = v6;
      SEL v3 = (objc_class *)objc_opt_class(v19);
      v9 = NSStringFromClass(v3);
      v12 = v9;
      sub_10000583C( (uint64_t)v20,  (uint64_t)v6,  (uint64_t)v12,  (uint64_t)v19,  (uint64_t)@"TVSSCurrentUserController.m",  75,  (uint64_t)v16);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v20,  0x3Au);

      objc_storeStrong((id *)&v12, 0LL);
      objc_storeStrong((id *)&v13, 0LL);
    }

    objc_storeStrong(&v15, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v16, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000ABBF4LL);
  }

  v5 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v5);

  id v11 = objc_alloc_init(&OBJC_CLASS___TVSSCurrentUserControllerObserverUserInfo);
  if ((objc_opt_respondsToSelector(location, "currentUserControllerDidUpdate:") & 1) != 0) {
    -[TVSSCurrentUserControllerObserverUserInfo setRespondsToDidUpdate:](v11, "setRespondsToDidUpdate:", 1LL);
  }
  id v4 = -[TVSObserverSet addObserver:userInfo:](v19->_observers, "addObserver:userInfo:", location, v11);
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (void)removeObserver:(id)a3
{
  v17 = self;
  SEL v16 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    char v14 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
    id v13 = &_os_log_default;
    char v12 = 16;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v13;
      os_log_type_t type = v12;
      v9 = NSStringFromSelector(v16);
      v5 = v9;
      id v11 = v5;
      SEL v3 = (objc_class *)objc_opt_class(v17);
      v8 = NSStringFromClass(v3);
      objc_super v10 = v8;
      sub_10000583C( (uint64_t)v18,  (uint64_t)v5,  (uint64_t)v10,  (uint64_t)v17,  (uint64_t)@"TVSSCurrentUserController.m",  91,  (uint64_t)v14);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v18,  0x3Au);

      objc_storeStrong((id *)&v10, 0LL);
      objc_storeStrong((id *)&v11, 0LL);
    }

    objc_storeStrong(&v13, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v14, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000ABED4LL);
  }

  id v4 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v4);

  -[TVSObserverSet removeObserver:](v17->_observers, "removeObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (void)userProfileManagerDidUpdate:(id)a3
{
  char v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_initWeak(&v10, v12);
  queue = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_1000AC054;
  v8 = &unk_1001B75D0;
  objc_copyWeak(&v9, &v10);
  dispatch_async(queue, &v4);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v10);
  objc_storeStrong(location, 0LL);
}

- (void)_fetchCurrentUserAndUpdateWithReason:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = v7;
  id v3 = location[0];
  id v5 = -[PBSUserProfileManager userProfilesSnapshot](v7->_userProfileManager, "userProfilesSnapshot");
  -[TVSSCurrentUserController _fetchCurrentUserAndUpdateWithReason:userProfilesSnapshot:]( v4,  "_fetchCurrentUserAndUpdateWithReason:userProfilesSnapshot:",  v3);

  objc_storeStrong(location, 0LL);
}

- (void)_fetchCurrentUserAndUpdateWithReason:(id)a3 userProfilesSnapshot:(id)a4
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v27 = 0LL;
  objc_storeStrong(&v27, a4);
  id v26 = [v27 selectedUserProfile];
  id v25 = 0LL;
  id v24 = [v26 identifier];
  id v23 = -[TVSSUser identifier](v29->_currentUser, "identifier");
  id v22 = CurrentUserControllerLog();
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000AC5E0( (uint64_t)v33,  (uint64_t)"-[TVSSCurrentUserController _fetchCurrentUserAndUpdateWithReason:userProfilesSnapshot:]",  (uint64_t)location[0],  (uint64_t)v23,  (uint64_t)v24);
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  v21,  "%s: Processing user profile snapshot reason: %{public}@. currentUserIdentifier=%@, selectedUserProfileIdentifier=%@",  v33,  0x2Au);
  }

  objc_storeStrong(&v22, 0LL);
  if (v24)
  {
    if (v23 && ([v23 isEqualToString:v24] & 1) != 0)
    {
      os_log_t oslog = (os_log_t)CurrentUserControllerLog();
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_100025AE4( (uint64_t)v32,  (uint64_t)"-[TVSSCurrentUserController _fetchCurrentUserAndUpdateWithReason:userProfilesSnapshot:]",  (uint64_t)v29->_currentUser);
        _os_log_impl( (void *)&_mh_execute_header,  oslog,  v19,  "%s: Current user has not changed. Will update metadata. currentUser=%@",  v32,  0x16u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      -[TVSSUser _updateWithUserProfile:](v29->_currentUser, "_updateWithUserProfile:", v26);
      objc_storeStrong(&v25, v29->_currentUser);
    }

    if (!v25)
    {
      id v4 = objc_alloc(&OBJC_CLASS___TVSSUser);
      id v5 = -[TVSSUser _initWithUserProfile:userProfilePictureService:]( v4,  "_initWithUserProfile:userProfilePictureService:",  v26,  v29->_profilePictureService);
      id v6 = v25;
      id v25 = v5;

      os_log_t v18 = (os_log_t)CurrentUserControllerLog();
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        sub_100025AE4( (uint64_t)v31,  (uint64_t)"-[TVSSCurrentUserController _fetchCurrentUserAndUpdateWithReason:userProfilesSnapshot:]",  (uint64_t)v25);
        _os_log_impl( (void *)&_mh_execute_header,  v18,  v17,  "%s: A new user has signed in. newCurrentUser=%@",  v31,  0x16u);
      }

      objc_storeStrong((id *)&v18, 0LL);
    }
  }

  else
  {
    objc_storeStrong(&v25, 0LL);
  }

  if (v25 != v29->_currentUser)
  {
    objc_storeStrong((id *)&v29->_currentUser, v25);
    os_log_t v16 = (os_log_t)CurrentUserControllerLog();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      sub_100025AE4( (uint64_t)v30,  (uint64_t)"-[TVSSCurrentUserController _fetchCurrentUserAndUpdateWithReason:userProfilesSnapshot:]",  (uint64_t)v29->_currentUser);
      _os_log_impl( (void *)&_mh_execute_header,  v16,  v15,  "%s: Current user has changed. Will inform observers. currentUser=%@",  v30,  0x16u);
    }

    objc_storeStrong((id *)&v16, 0LL);
    observers = v29->_observers;
    id v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    char v12 = sub_1000AC664;
    id v13 = &unk_1001B9B30;
    char v14 = v29;
    -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", &v9);
    objc_storeStrong((id *)&v14, 0LL);
  }

  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSSUser)currentUser
{
  return self->_currentUser;
}

- (void).cxx_destruct
{
}

@end