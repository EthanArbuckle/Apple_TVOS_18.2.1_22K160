@interface TVSSUser
- (BOOL)isCurrentUser;
- (BOOL)isSuggestedUser;
- (NSPersonNameComponents)personNameComponents;
- (NSString)contentTitle;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)formattedShortName;
- (NSString)identifier;
- (UIImage)contentImage;
- (UIImage)image;
- (id)_initWithUserProfile:(id)a3 userProfilePictureService:(id)a4;
- (id)_userProfileAccountInfoWithUserProfile:(id)a3;
- (id)_userProfilePictureObserver;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_updateWithUserImage:(id)a3;
- (void)_updateWithUserProfile:(id)a3;
- (void)_updateWithUserProfile:(id)a3 notifyObservers:(BOOL)a4;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation TVSSUser

- (NSString)contentTitle
{
  return -[TVSSUser formattedShortName](self, "formattedShortName", a2, self);
}

- (UIImage)contentImage
{
  return -[TVSSUser image](self, "image", a2, self);
}

- (id)_initWithUserProfile:(id)a3 userProfilePictureService:(id)a4
{
  id v61 = self;
  SEL v60 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v58 = 0LL;
  objc_storeStrong(&v58, a4);
  id v57 = location;
  id v56 = 0LL;
  Class v55 = NSClassFromString(@"PBSUserProfile");
  if (!v57)
  {
    id v54 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    id v53 = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v53;
      os_log_type_t v30 = type;
      v26 = NSStringFromSelector(v60);
      v27 = v26;
      id v51 = v27;
      aClass = (objc_class *)objc_opt_class(v61);
      v25 = NSStringFromClass(aClass);
      id v50 = v25;
      sub_10000583C( (uint64_t)v64,  (uint64_t)v27,  (uint64_t)v50,  (uint64_t)v61,  (uint64_t)@"TVSSUser.m",  48,  (uint64_t)v54);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v30,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v64,  0x3Au);

      objc_storeStrong(&v50, 0LL);
      objc_storeStrong(&v51, 0LL);
    }

    objc_storeStrong(&v53, 0LL);
    _bs_set_crash_log_message([v54 UTF8String]);
    __break(0);
    JUMPOUT(0x100086D14LL);
  }

  if (((objc_opt_isKindOfClass(v57, v55) ^ 1) & 1) != 0)
  {
    id v49 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSUserProfileClass]");
    id v48 = &_os_log_default;
    os_log_type_t v47 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_ERROR))
    {
      v24 = (os_log_s *)v48;
      v22 = NSStringFromSelector(v60);
      id v46 = v22;
      v23 = (objc_class *)objc_opt_class(v61);
      v21 = NSStringFromClass(v23);
      id v45 = v21;
      sub_10000583C( (uint64_t)v63,  (uint64_t)v46,  (uint64_t)v45,  (uint64_t)v61,  (uint64_t)@"TVSSUser.m",  48,  (uint64_t)v49);
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  v47,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v63,  0x3Au);

      objc_storeStrong(&v45, 0LL);
      objc_storeStrong(&v46, 0LL);
    }

    objc_storeStrong(&v48, 0LL);
    _bs_set_crash_log_message([v49 UTF8String]);
    __break(0);
    JUMPOUT(0x100086F44LL);
  }

  objc_storeStrong(&v56, 0LL);
  objc_storeStrong(&v57, 0LL);
  id v20 = [location identifier];
  BOOL v19 = [v20 length] == 0;

  if (v19)
  {
    id v44 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[[userProfile identifier] length] > 0");
    os_log_t oslog = &_os_log_default;
    os_log_type_t v42 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v17 = NSStringFromSelector(v60);
      id v41 = v17;
      v18 = (objc_class *)objc_opt_class(v61);
      v16 = NSStringFromClass(v18);
      id v40 = v16;
      sub_10000583C( (uint64_t)v62,  (uint64_t)v41,  (uint64_t)v40,  (uint64_t)v61,  (uint64_t)@"TVSSUser.m",  49,  (uint64_t)v44);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  v42,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v62,  0x3Au);

      objc_storeStrong(&v40, 0LL);
      objc_storeStrong(&v41, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v44 UTF8String]);
    __break(0);
    JUMPOUT(0x1000871CCLL);
  }

  id v4 = v61;
  id v61 = 0LL;
  v39.receiver = v4;
  v39.super_class = (Class)&OBJC_CLASS___TVSSUser;
  id v61 = -[TVSSUser init](&v39, "init");
  objc_storeStrong(&v61, v61);
  if (v61)
  {
    v15 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    v5 = (void *)*((void *)v61 + 1);
    *((void *)v61 + 1) = v15;

    id v6 = [location identifier];
    v7 = (void *)*((void *)v61 + 4);
    *((void *)v61 + 4) = v6;

    id v8 = [v58 profilePictureForUserWithIdentifier:*((void *)v61 + 4)];
    v9 = (void *)*((void *)v61 + 2);
    *((void *)v61 + 2) = v8;

    id v10 = [*((id *)v61 + 2) profileImage];
    v11 = (void *)*((void *)v61 + 7);
    *((void *)v61 + 7) = v10;

    objc_initWeak(&from, v61);
    v14 = (void *)*((void *)v61 + 2);
    v32 = _NSConcreteStackBlock;
    int v33 = -1073741824;
    int v34 = 0;
    v35 = sub_100087508;
    v36 = &unk_1001B9248;
    objc_copyWeak(&v37, &from);
    [v14 setImageUpdatedHandler:&v32];
    [v61 _updateWithUserProfile:location notifyObservers:0];
    objc_destroyWeak(&v37);
    objc_destroyWeak(&from);
  }

  id v13 = v61;
  objc_storeStrong(&v58, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v61, 0LL);
  return v13;
}

- (void)addObserver:(id)a3
{
  BOOL v19 = self;
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
      id v10 = NSStringFromSelector(v18);
      id v6 = v10;
      id v13 = v6;
      v3 = (objc_class *)objc_opt_class(v19);
      v9 = NSStringFromClass(v3);
      v12 = v9;
      sub_10000583C( (uint64_t)v20,  (uint64_t)v6,  (uint64_t)v12,  (uint64_t)v19,  (uint64_t)@"TVSSUser.m",  76,  (uint64_t)v16);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v20,  0x3Au);

      objc_storeStrong((id *)&v12, 0LL);
      objc_storeStrong((id *)&v13, 0LL);
    }

    objc_storeStrong(&v15, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v16, "UTF8String"));
    __break(0);
    JUMPOUT(0x100087754LL);
  }

  v5 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v5);

  v11 = objc_alloc_init(&OBJC_CLASS___TVSSUserObserverUserInfo);
  if ((objc_opt_respondsToSelector(location, "user:didChangeImage:") & 1) != 0) {
    -[TVSSUserObserverUserInfo setRespondsToDidChangeImage:](v11, "setRespondsToDidChangeImage:", 1LL);
  }
  if ((objc_opt_respondsToSelector(location, "user:didChangePersonNameComponents:") & 1) != 0) {
    -[TVSSUserObserverUserInfo setRespondsToDidChangePersonNameComponents:]( v11,  "setRespondsToDidChangePersonNameComponents:",  1LL);
  }
  if ((objc_opt_respondsToSelector(location, "user:didChangeCurrentUser:") & 1) != 0) {
    -[TVSSUserObserverUserInfo setRespondsToDidChangeCurrentUser:](v11, "setRespondsToDidChangeCurrentUser:", 1LL);
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
      v11 = v5;
      v3 = (objc_class *)objc_opt_class(v17);
      id v8 = NSStringFromClass(v3);
      id v10 = v8;
      sub_10000583C( (uint64_t)v18,  (uint64_t)v5,  (uint64_t)v10,  (uint64_t)v17,  (uint64_t)@"TVSSUser.m",  100,  (uint64_t)v14);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v18,  0x3Au);

      objc_storeStrong((id *)&v10, 0LL);
      objc_storeStrong((id *)&v11, 0LL);
    }

    objc_storeStrong(&v13, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v14, "UTF8String"));
    __break(0);
    JUMPOUT(0x100087A94LL);
  }

  id v4 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v4);

  -[TVSObserverSet removeObserver:](v17->_observers, "removeObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (void)_updateWithUserProfile:(id)a3
{
  id v44 = self;
  SEL v43 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v41 = location;
  id v40 = 0LL;
  Class v39 = NSClassFromString(@"PBSUserProfile");
  if (!v41)
  {
    id v38 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v21 = type;
      v23 = NSStringFromSelector(v43);
      BOOL v19 = v23;
      v35 = v19;
      v3 = (objc_class *)objc_opt_class(v44);
      v22 = NSStringFromClass(v3);
      int v34 = v22;
      sub_10000583C( (uint64_t)v47,  (uint64_t)v19,  (uint64_t)v34,  (uint64_t)v44,  (uint64_t)@"TVSSUser.m",  111,  (uint64_t)v38);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v21,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v47,  0x3Au);

      objc_storeStrong((id *)&v34, 0LL);
      objc_storeStrong((id *)&v35, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v38 UTF8String]);
    __break(0);
    JUMPOUT(0x100087D34LL);
  }

  if (((objc_opt_isKindOfClass(v41, v39) ^ 1) & 1) != 0)
  {
    id v33 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSUserProfileClass]");
    os_log_t v32 = &_os_log_default;
    os_log_type_t v31 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v15 = v32;
      os_log_type_t v16 = v31;
      SEL v18 = NSStringFromSelector(v43);
      char v14 = v18;
      os_log_type_t v30 = v14;
      id v4 = (objc_class *)objc_opt_class(v44);
      v17 = NSStringFromClass(v4);
      v29 = v17;
      sub_10000583C( (uint64_t)v46,  (uint64_t)v14,  (uint64_t)v29,  (uint64_t)v44,  (uint64_t)@"TVSSUser.m",  111,  (uint64_t)v33);
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  v16,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v46,  0x3Au);

      objc_storeStrong((id *)&v29, 0LL);
      objc_storeStrong((id *)&v30, 0LL);
    }

    objc_storeStrong((id *)&v32, 0LL);
    _bs_set_crash_log_message([v33 UTF8String]);
    __break(0);
    JUMPOUT(0x100087EECLL);
  }

  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(&v41, 0LL);
  id v12 = [location identifier];
  int v13 = BSEqualObjects(v12, v44->_identifier) ^ 1;

  if ((v13 & 1) != 0)
  {
    id v28 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"BSEqualObjects([userProfile identifier], _identifier)");
    os_log_t v27 = &_os_log_default;
    os_log_type_t v26 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v8 = v27;
      os_log_type_t v9 = v26;
      v11 = NSStringFromSelector(v43);
      v7 = v11;
      v25 = v7;
      v5 = (objc_class *)objc_opt_class(v44);
      id v10 = NSStringFromClass(v5);
      v24 = v10;
      sub_10000583C( (uint64_t)v45,  (uint64_t)v7,  (uint64_t)v24,  (uint64_t)v44,  (uint64_t)@"TVSSUser.m",  112,  (uint64_t)v28);
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  v9,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v45,  0x3Au);

      objc_storeStrong((id *)&v24, 0LL);
      objc_storeStrong((id *)&v25, 0LL);
    }

    objc_storeStrong((id *)&v27, 0LL);
    _bs_set_crash_log_message([v28 UTF8String]);
    __break(0);
    JUMPOUT(0x1000880F8LL);
  }

  id v6 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v6);

  -[TVSSUser _updateWithUserProfile:notifyObservers:](v44, "_updateWithUserProfile:notifyObservers:", location, 1LL);
  objc_storeStrong(&location, 0LL);
}

- (id)succinctDescription
{
  id v3 = -[TVSSUser succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  id v6 = self;
  v5[1] = (id)a2;
  v5[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  [v5[0] appendString:v6->_identifier withName:@"identifier"];
  [v5[0] appendString:v6->_formattedShortName withName:@"formattedShortName"];
  id v2 = [v5[0] appendBool:v6->_currentUser withName:@"currentUser"];
  id v4 = v5[0];
  objc_storeStrong(v5, 0LL);
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[TVSSUser descriptionBuilderWithMultilinePrefix:](v7, "descriptionBuilderWithMultilinePrefix:", location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  os_log_type_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = -[TVSSUser succinctDescriptionBuilder](v9, "succinctDescriptionBuilder");
  [v7 setActiveMultilinePrefix:location[0]];
  id v3 = [v7 appendObject:v9->_personNameComponents withName:@"personNameComponents"];
  id v4 = [v7 appendObject:v9->_image withName:@"image"];
  id v6 = v7;
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (NSString)description
{
  return (NSString *)-[TVSSUser succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSUser descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0LL, a2, self);
}

- (id)_userProfilePictureObserver
{
  return self->_userProfilePictureObserver;
}

- (id)_userProfileAccountInfoWithUserProfile:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc(&OBJC_CLASS___PBSUserProfileAccountInfo);
  id v5 = [v3 initWithUserProfile:location[0]];
  objc_storeStrong(location, 0LL);
  return v5;
}

- (void)_updateWithUserImage:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v12->_image != location[0])
  {
    objc_storeStrong((id *)&v12->_image, location[0]);
    observers = v12->_observers;
    id v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    id v7 = sub_100088630;
    id v8 = &unk_1001B9270;
    os_log_type_t v9 = v12;
    id v10 = location[0];
    -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", &v4);
    objc_storeStrong(&v10, 0LL);
    objc_storeStrong((id *)&v9, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_updateWithUserProfile:(id)a3 notifyObservers:(BOOL)a4
{
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v26 = a4;
  id v25 =  -[TVSSUser _userProfileAccountInfoWithUserProfile:]( v28,  "_userProfileAccountInfoWithUserProfile:",  location[0]);
  id v24 = [v25 personNameComponents];
  if ((BSEqualObjects(v28->_personNameComponents, v24) & 1) == 0)
  {
    objc_storeStrong((id *)&v28->_personNameComponents, v24);
    id v4 = (NSString *)[v25 formattedShortName];
    formattedShortName = v28->_formattedShortName;
    v28->_formattedShortName = v4;

    observers = v28->_observers;
    v17 = _NSConcreteStackBlock;
    int v18 = -1073741824;
    int v19 = 0;
    id v20 = sub_100088A70;
    os_log_type_t v21 = &unk_1001B9270;
    v22 = v28;
    id v23 = v24;
    -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", &v17);
    objc_storeStrong(&v23, 0LL);
    objc_storeStrong((id *)&v22, 0LL);
  }

  char v16 = [location[0] isSelected] & 1;
  if (v28->_currentUser != v16)
  {
    v28->_currentUser = v16 & 1;
    int v6 = v28->_observers;
    os_log_type_t v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = sub_100088B70;
    int v13 = &unk_1001B9298;
    char v14 = v28;
    char v15 = v16 & 1;
    -[TVSObserverSet enumerateObserversUsingBlock:](v6, "enumerateObserversUsingBlock:", &v9);
    objc_storeStrong((id *)&v14, 0LL);
  }

  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(location, 0LL);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSPersonNameComponents)personNameComponents
{
  return self->_personNameComponents;
}

- (NSString)formattedShortName
{
  return self->_formattedShortName;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isCurrentUser
{
  return self->_currentUser;
}

- (BOOL)isSuggestedUser
{
  return self->_suggestedUser;
}

- (void).cxx_destruct
{
}

@end