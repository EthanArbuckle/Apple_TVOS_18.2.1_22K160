@interface CMSDefaultsManager
+ (id)sharedInstance;
- (BOOL)removeDefaultForKey:(id)a3;
- (BOOL)setObject:(id)a3 forDefault:(id)a4;
- (BOOL)setObject:(id)a3 forDefault:(id)a4 requiresCoding:(BOOL)a5;
- (CMSDefaultsManager)init;
- (NSUserDefaults)CMSDefaults;
- (id)objectForDefault:(id)a3;
- (void)setCMSDefaults:(id)a3;
@end

@implementation CMSDefaultsManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000070E0;
  block[3] = &unk_10001C540;
  block[4] = a1;
  if (qword_100024438 != -1) {
    dispatch_once(&qword_100024438, block);
  }
  return (id)qword_100024430;
}

- (CMSDefaultsManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CMSDefaultsManager;
  v2 = -[CMSDefaultsManager init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    v4 = -[NSUserDefaults initWithSuiteName:](v3, "initWithSuiteName:", kCloudMediaServicesDefaultsDomain);
    CMSDefaults = v2->_CMSDefaults;
    v2->_CMSDefaults = v4;
  }

  return v2;
}

- (BOOL)setObject:(id)a3 forDefault:(id)a4
{
  if (a3) {
    BOOL v4 = a4 == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v5 = !v4;
  if (v4)
  {
    uint64_t v6 = _CMSQLoggingFacility(self);
    objc_super v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000F7D4();
    }
  }

  else
  {
    -[NSUserDefaults setObject:forKey:](self->_CMSDefaults, "setObject:forKey:");
  }

  return v5;
}

- (BOOL)setObject:(id)a3 forDefault:(id)a4 requiresCoding:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8 || !v9)
  {
    uint64_t v17 = _CMSQLoggingFacility(v9);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10000F7D4();
    }

    goto LABEL_12;
  }

  if (!a5)
  {
    -[CMSDefaultsManager setObject:forDefault:](self, "setObject:forDefault:", v8, v9);
LABEL_12:
    BOOL v14 = 0;
    goto LABEL_15;
  }

  id v20 = 0LL;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v8,  1LL,  &v20));
  id v12 = v20;
  v13 = v12;
  BOOL v14 = v12 == 0LL;
  if (v12)
  {
    uint64_t v15 = _CMSQLoggingFacility(v12);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10000F800((uint64_t)v13, v16);
    }
  }

  else
  {
    -[CMSDefaultsManager setObject:forDefault:](self, "setObject:forDefault:", v11, v10);
  }

LABEL_15:
  return v14;
}

- (id)objectForDefault:(id)a3
{
  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_CMSDefaults, "objectForKey:"));
  }

  else
  {
    uint64_t v4 = _CMSQLoggingFacility(self);
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000F874();
    }

    v3 = 0LL;
  }

  return v3;
}

- (BOOL)removeDefaultForKey:(id)a3
{
  if (a3)
  {
    -[NSUserDefaults removeObjectForKey:](self->_CMSDefaults, "removeObjectForKey:", a3);
  }

  else
  {
    uint64_t v4 = _CMSQLoggingFacility(self);
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000F8A0();
    }
  }

  return a3 != 0LL;
}

- (NSUserDefaults)CMSDefaults
{
  return self->_CMSDefaults;
}

- (void)setCMSDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end