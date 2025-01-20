@interface FBSSceneIdentity
+ (id)_pb_defaultSceneIdentity;
+ (id)pb_CRDSceneIdentity;
+ (id)pb_TVWatchListSceneIdentity;
+ (id)pb_defaultKioskAppSceneIdentity;
+ (id)pb_identityForApplicationIdentifier:(id)a3 role:(id)a4;
+ (id)pb_idleScreenSceneIdentity;
+ (id)pb_kioskAppSceneIdentity;
+ (id)pb_uniqueIdentityForApplicationIdentifier:(id)a3 role:(id)a4;
- (BOOL)pb_isCRDSceneIdentity;
- (BOOL)pb_isDefaultKioskAppSceneIdentity;
- (BOOL)pb_isIdleScreenSceneIdentity;
- (BOOL)pb_isKioskAppSceneIdentity;
- (BOOL)pb_isTVWatchListSceneIdentity;
@end

@implementation FBSSceneIdentity

+ (id)pb_identityForApplicationIdentifier:(id)a3 role:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  id v10 = v8;
  Class v11 = NSClassFromString(@"NSString");
  if (!v10)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100273244();
    }
LABEL_17:
    _bs_set_crash_log_message([v17 UTF8String]);
    __break(0);
    JUMPOUT(0x100037570LL);
  }

  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100273244();
    }
    _bs_set_crash_log_message([v18 UTF8String]);
    __break(0);
    JUMPOUT(0x1000375CCLL);
  }

  id v12 = v9;
  Class v13 = NSClassFromString(@"NSString");
  if (!v12)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002732E0();
    }
    _bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
    JUMPOUT(0x100037628LL);
  }

  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002732E0();
    }
    goto LABEL_17;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v10, v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 identityForIdentifier:v14]);

  return v15;
}

+ (id)pb_uniqueIdentityForApplicationIdentifier:(id)a3 role:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  id v10 = v6;
  id v11 = v7;
  id v12 = v9;
  id v13 = v10;
  Class v14 = NSClassFromString(@"NSString");
  if (!v13)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100273244();
    }
LABEL_20:
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x10003782CLL);
  }

  if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100273244();
    }
    _bs_set_crash_log_message([v22 UTF8String]);
    __break(0);
    JUMPOUT(0x100037888LL);
  }

  id v15 = v11;
  Class v16 = NSClassFromString(@"NSString");
  if (!v15)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002732E0();
    }
    _bs_set_crash_log_message([v23 UTF8String]);
    __break(0);
    JUMPOUT(0x1000378E4LL);
  }

  if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:NSStringClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002732E0();
    }
    goto LABEL_20;
  }

  if (v12) {
    v17 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@-%@", v13, v15, v12);
  }
  else {
    v17 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v13, v15, v24);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue([a1 identityForIdentifier:v18]);
  return v19;
}

+ (id)pb_defaultKioskAppSceneIdentity
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000379BC;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004700B8 != -1) {
    dispatch_once(&qword_1004700B8, block);
  }
  return (id)qword_1004700B0;
}

- (BOOL)pb_isDefaultKioskAppSceneIdentity
{
  v2 = self;
  id v3 = objc_msgSend((id)objc_opt_class(self), "pb_defaultKioskAppSceneIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  LOBYTE(v2) = -[FBSSceneIdentity isEqual:](v2, "isEqual:", v4);

  return (char)v2;
}

+ (id)pb_kioskAppSceneIdentity
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 kioskAppBundleIdentifier]);

  if (v4) {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pb_identityForApplicationIdentifier:role:", v4, @"default"));
  }
  else {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pb_defaultKioskAppSceneIdentity"));
  }
  id v6 = (void *)v5;

  return v6;
}

- (BOOL)pb_isKioskAppSceneIdentity
{
  v2 = self;
  id v3 = objc_msgSend((id)objc_opt_class(self), "pb_kioskAppSceneIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  LOBYTE(v2) = -[FBSSceneIdentity isEqual:](v2, "isEqual:", v4);

  return (char)v2;
}

+ (id)pb_idleScreenSceneIdentity
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100037B88;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004700C8 != -1) {
    dispatch_once(&qword_1004700C8, block);
  }
  return (id)qword_1004700C0;
}

- (BOOL)pb_isIdleScreenSceneIdentity
{
  v2 = self;
  id v3 = objc_msgSend((id)objc_opt_class(self), "pb_idleScreenSceneIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  LOBYTE(v2) = -[FBSSceneIdentity isEqual:](v2, "isEqual:", v4);

  return (char)v2;
}

+ (id)pb_TVWatchListSceneIdentity
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100037C88;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004700D8 != -1) {
    dispatch_once(&qword_1004700D8, block);
  }
  return (id)qword_1004700D0;
}

- (BOOL)pb_isTVWatchListSceneIdentity
{
  v2 = self;
  id v3 = objc_msgSend((id)objc_opt_class(self), "pb_TVWatchListSceneIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  LOBYTE(v2) = -[FBSSceneIdentity isEqual:](v2, "isEqual:", v4);

  return (char)v2;
}

+ (id)pb_CRDSceneIdentity
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100037D88;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_1004700E8 != -1) {
    dispatch_once(&qword_1004700E8, block);
  }
  return (id)qword_1004700E0;
}

- (BOOL)pb_isCRDSceneIdentity
{
  v2 = self;
  id v3 = objc_msgSend((id)objc_opt_class(self), "pb_CRDSceneIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  LOBYTE(v2) = -[FBSSceneIdentity isEqual:](v2, "isEqual:", v4);

  return (char)v2;
}

+ (id)_pb_defaultSceneIdentity
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bundleIdentifier]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 identityForIdentifier:v4]);

  return v5;
}

@end