@interface TVSSSuggestedUser
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
- (id)_initWithSuggestedUserProfile:(id)a3 userProfilePictureService:(id)a4;
- (id)_userProfilePictureObserver;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_updateWithSuggestedUserProfile:(id)a3;
- (void)_updateWithSuggestedUserProfile:(id)a3 notifyObservers:(BOOL)a4;
- (void)_updateWithUserImage:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation TVSSSuggestedUser

- (NSString)contentTitle
{
  return -[TVSSSuggestedUser formattedShortName](self, "formattedShortName", a2, self);
}

- (UIImage)contentImage
{
  return -[TVSSSuggestedUser image](self, "image", a2, self);
}

- (id)_initWithSuggestedUserProfile:(id)a3 userProfilePictureService:(id)a4
{
  id v63 = self;
  SEL v62 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v60 = 0LL;
  objc_storeStrong(&v60, a4);
  id v59 = location;
  id v58 = 0LL;
  Class v57 = NSClassFromString(@"PBSSuggestedUserProfile");
  if (!v59)
  {
    id v56 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    id v55 = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v55;
      os_log_type_t v32 = type;
      v28 = NSStringFromSelector(v62);
      v29 = v28;
      id v53 = v29;
      aClass = (objc_class *)objc_opt_class(v63);
      v27 = NSStringFromClass(aClass);
      id v52 = v27;
      sub_10000583C( (uint64_t)v66,  (uint64_t)v29,  (uint64_t)v52,  (uint64_t)v63,  (uint64_t)@"TVSSUser.m",  251,  (uint64_t)v56);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v32,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v66,  0x3Au);

      objc_storeStrong(&v52, 0LL);
      objc_storeStrong(&v53, 0LL);
    }

    objc_storeStrong(&v55, 0LL);
    _bs_set_crash_log_message([v56 UTF8String]);
    __break(0);
    JUMPOUT(0x100089050LL);
  }

  if (((objc_opt_isKindOfClass(v59, v57) ^ 1) & 1) != 0)
  {
    id v51 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSSuggestedUserProfileClass]");
    id v50 = &_os_log_default;
    os_log_type_t v49 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR))
    {
      v26 = (os_log_s *)v50;
      v24 = NSStringFromSelector(v62);
      id v48 = v24;
      v25 = (objc_class *)objc_opt_class(v63);
      v23 = NSStringFromClass(v25);
      id v47 = v23;
      sub_10000583C( (uint64_t)v65,  (uint64_t)v48,  (uint64_t)v47,  (uint64_t)v63,  (uint64_t)@"TVSSUser.m",  251,  (uint64_t)v51);
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  v49,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v65,  0x3Au);

      objc_storeStrong(&v47, 0LL);
      objc_storeStrong(&v48, 0LL);
    }

    objc_storeStrong(&v50, 0LL);
    _bs_set_crash_log_message([v51 UTF8String]);
    __break(0);
    JUMPOUT(0x100089280LL);
  }

  objc_storeStrong(&v58, 0LL);
  objc_storeStrong(&v59, 0LL);
  id v22 = [location identifier];
  BOOL v21 = [v22 length] == 0;

  if (v21)
  {
    id v46 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[[suggestedUserProfile identifier] length] > 0");
    os_log_t oslog = &_os_log_default;
    os_log_type_t v44 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v19 = NSStringFromSelector(v62);
      id v43 = v19;
      v20 = (objc_class *)objc_opt_class(v63);
      v18 = NSStringFromClass(v20);
      id v42 = v18;
      sub_10000583C( (uint64_t)v64,  (uint64_t)v43,  (uint64_t)v42,  (uint64_t)v63,  (uint64_t)@"TVSSUser.m",  252,  (uint64_t)v46);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  v44,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v64,  0x3Au);

      objc_storeStrong(&v42, 0LL);
      objc_storeStrong(&v43, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v46 UTF8String]);
    __break(0);
    JUMPOUT(0x100089508LL);
  }

  id v4 = v63;
  id v63 = 0LL;
  v41.receiver = v4;
  v41.super_class = (Class)&OBJC_CLASS___TVSSSuggestedUser;
  id v63 = -[TVSSSuggestedUser init](&v41, "init");
  objc_storeStrong(&v63, v63);
  if (v63)
  {
    *((_BYTE *)v63 + 24) = 0;
    *((_BYTE *)v63 + 25) = 1;
    v17 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    v5 = (void *)*((void *)v63 + 1);
    *((void *)v63 + 1) = v17;

    id v6 = [location identifier];
    v7 = (void *)*((void *)v63 + 4);
    *((void *)v63 + 4) = v6;

    id v16 = v60;
    id v15 = [location altDSID];
    id v8 = objc_msgSend(v16, "profilePictureForAccountWithAltDSID:");
    v9 = (void *)*((void *)v63 + 2);
    *((void *)v63 + 2) = v8;

    id v10 = [*((id *)v63 + 2) profileImage];
    v11 = (void *)*((void *)v63 + 7);
    *((void *)v63 + 7) = v10;

    objc_initWeak(&from, v63);
    v14 = (void *)*((void *)v63 + 2);
    v34 = _NSConcreteStackBlock;
    int v35 = -1073741824;
    int v36 = 0;
    v37 = sub_100089894;
    v38 = &unk_1001B9248;
    objc_copyWeak(&v39, &from);
    [v14 setImageUpdatedHandler:&v34];
    [v63 _updateWithSuggestedUserProfile:location notifyObservers:0];
    objc_destroyWeak(&v39);
    objc_destroyWeak(&from);
  }

  id v13 = v63;
  objc_storeStrong(&v60, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v63, 0LL);
  return v13;
}

- (void)addObserver:(id)a3
{
  v19 = self;
  SEL v18 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    id v16 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
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
      sub_10000583C( (uint64_t)v20,  (uint64_t)v6,  (uint64_t)v12,  (uint64_t)v19,  (uint64_t)@"TVSSUser.m",  282,  (uint64_t)v16);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v20,  0x3Au);

      objc_storeStrong((id *)&v12, 0LL);
      objc_storeStrong((id *)&v13, 0LL);
    }

    objc_storeStrong(&v15, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v16, "UTF8String"));
    __break(0);
    JUMPOUT(0x100089AE0LL);
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
      sub_10000583C( (uint64_t)v18,  (uint64_t)v5,  (uint64_t)v10,  (uint64_t)v17,  (uint64_t)@"TVSSUser.m",  302,  (uint64_t)v14);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v18,  0x3Au);

      objc_storeStrong((id *)&v10, 0LL);
      objc_storeStrong((id *)&v11, 0LL);
    }

    objc_storeStrong(&v13, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v14, "UTF8String"));
    __break(0);
    JUMPOUT(0x100089DF0LL);
  }

  id v4 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v4);

  -[TVSObserverSet removeObserver:](v17->_observers, "removeObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (void)_updateWithSuggestedUserProfile:(id)a3
{
  os_log_type_t v44 = self;
  SEL v43 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v41 = location;
  id v40 = 0LL;
  Class v39 = NSClassFromString(@"PBSSuggestedUserProfile");
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
      v19 = v23;
      int v35 = v19;
      v3 = (objc_class *)objc_opt_class(v44);
      id v22 = NSStringFromClass(v3);
      v34 = v22;
      sub_10000583C( (uint64_t)v47,  (uint64_t)v19,  (uint64_t)v34,  (uint64_t)v44,  (uint64_t)@"TVSSUser.m",  313,  (uint64_t)v38);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v21,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v47,  0x3Au);

      objc_storeStrong((id *)&v34, 0LL);
      objc_storeStrong((id *)&v35, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v38 UTF8String]);
    __break(0);
    JUMPOUT(0x10008A090LL);
  }

  if (((objc_opt_isKindOfClass(v41, v39) ^ 1) & 1) != 0)
  {
    id v33 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSSuggestedUserProfileClass]");
    os_log_t v32 = &_os_log_default;
    os_log_type_t v31 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v15 = v32;
      os_log_type_t v16 = v31;
      SEL v18 = NSStringFromSelector(v43);
      char v14 = v18;
      v30 = v14;
      id v4 = (objc_class *)objc_opt_class(v44);
      v17 = NSStringFromClass(v4);
      v29 = v17;
      sub_10000583C( (uint64_t)v46,  (uint64_t)v14,  (uint64_t)v29,  (uint64_t)v44,  (uint64_t)@"TVSSUser.m",  313,  (uint64_t)v33);
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  v16,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v46,  0x3Au);

      objc_storeStrong((id *)&v29, 0LL);
      objc_storeStrong((id *)&v30, 0LL);
    }

    objc_storeStrong((id *)&v32, 0LL);
    _bs_set_crash_log_message([v33 UTF8String]);
    __break(0);
    JUMPOUT(0x10008A248LL);
  }

  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(&v41, 0LL);
  id v12 = [location identifier];
  int v13 = BSEqualObjects(v12, v44->_identifier) ^ 1;

  if ((v13 & 1) != 0)
  {
    id v28 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"BSEqualObjects([suggestedUserProfile identifier], _identifier)");
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
      sub_10000583C( (uint64_t)v45,  (uint64_t)v7,  (uint64_t)v24,  (uint64_t)v44,  (uint64_t)@"TVSSUser.m",  314,  (uint64_t)v28);
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  v9,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v45,  0x3Au);

      objc_storeStrong((id *)&v24, 0LL);
      objc_storeStrong((id *)&v25, 0LL);
    }

    objc_storeStrong((id *)&v27, 0LL);
    _bs_set_crash_log_message([v28 UTF8String]);
    __break(0);
    JUMPOUT(0x10008A454LL);
  }

  id v6 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v6);

  -[TVSSSuggestedUser _updateWithSuggestedUserProfile:notifyObservers:]( v44,  "_updateWithSuggestedUserProfile:notifyObservers:",  location,  1LL);
  objc_storeStrong(&location, 0LL);
}

- (id)succinctDescription
{
  id v3 = -[TVSSSuggestedUser succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  id v2 = [v5[0] appendBool:v6->_suggestedUser withName:@"suggestedUser"];
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
  id v4 =  -[TVSSSuggestedUser descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
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
  id v7 = -[TVSSSuggestedUser succinctDescriptionBuilder](v9, "succinctDescriptionBuilder");
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
  return (NSString *)-[TVSSSuggestedUser succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSSuggestedUser descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (id)_userProfilePictureObserver
{
  return self->_userProfilePictureObserver;
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
    id v7 = sub_10008A91C;
    id v8 = &unk_1001B9270;
    os_log_type_t v9 = v12;
    id v10 = location[0];
    -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", &v4);
    objc_storeStrong(&v10, 0LL);
    objc_storeStrong((id *)&v9, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_updateWithSuggestedUserProfile:(id)a3 notifyObservers:(BOOL)a4
{
  SEL v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v16 = a4;
  id v15 = [location[0] nameComponents];
  if ((BSEqualObjects(v18->_personNameComponents, v15) & 1) == 0)
  {
    objc_storeStrong((id *)&v18->_personNameComponents, v15);
    id v4 = (NSString *)[location[0] shortName];
    formattedShortName = v18->_formattedShortName;
    v18->_formattedShortName = v4;

    observers = v18->_observers;
    id v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    v11 = sub_10008AB90;
    id v12 = &unk_1001B9270;
    int v13 = v18;
    id v14 = v15;
    -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", &v8);
    objc_storeStrong(&v14, 0LL);
    objc_storeStrong((id *)&v13, 0LL);
  }

  objc_storeStrong(&v15, 0LL);
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