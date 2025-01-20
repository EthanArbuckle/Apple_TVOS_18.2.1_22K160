@interface MSDDefaultsManager
+ (id)sharedManager;
- (BOOL)clearObjectForDefault:(id)a3;
- (BOOL)isDeveloperProfileLoaded;
- (BOOL)profilesEverInstalled;
- (BOOL)removeObjectForDefault:(id)a3;
- (BOOL)setObject:(id)a3 forDefault:(id)a4;
- (BOOL)setObjectWithCustomClass:(id)a3 forDefault:(id)a4;
- (MSDDefaultsManager)init;
- (NSDictionary)dictionaryRepresentation;
- (NSUserDefaults)MSDDefaults;
- (NSUserDefaults)MSDDeveloperDefaults;
- (id)_decodeObject:(id)a3 forKey:(id)a4;
- (id)objectForDefault:(id)a3;
- (id)objectForDefaultWithCustomClass:(id)a3;
- (id)objectForKeyInDefaultDomain:(id)a3;
- (id)objectForKeyInDeveloperDomain:(id)a3;
- (unint64_t)developerProfilesCount;
- (void)clearDeveloperDefaults;
- (void)clearPrivateAndSharedLocalData;
- (void)setDeveloperProfilesCount:(unint64_t)a3;
- (void)setMSDDefaults:(id)a3;
- (void)setMSDDeveloperDefaults:(id)a3;
@end

@implementation MSDDefaultsManager

- (void)setDeveloperProfilesCount:(unint64_t)a3
{
}

- (unint64_t)developerProfilesCount
{
  return -[NSUserDefaults integerForKey:](self->_MSDDeveloperDefaults, "integerForKey:", @"developerProfileCount");
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000AAE0;
  block[3] = &unk_100060A90;
  block[4] = a1;
  if (qword_100070770 != -1) {
    dispatch_once(&qword_100070770, block);
  }
  return (id)qword_100070778;
}

- (MSDDefaultsManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MSDDefaultsManager;
  v2 = -[MSDDefaultsManager init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    v4 = -[NSUserDefaults initWithSuiteName:](v3, "initWithSuiteName:", kMediaSetupDeveloperUserDefaultsDomain);
    MSDDeveloperDefaults = v2->_MSDDeveloperDefaults;
    v2->_MSDDeveloperDefaults = v4;

    v6 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    v7 = -[NSUserDefaults initWithSuiteName:](v6, "initWithSuiteName:", kMediaSetupUserDefaultsDomain);
    MSDDefaults = v2->_MSDDefaults;
    v2->_MSDDefaults = v7;
  }

  return v2;
}

- (BOOL)setObjectWithCustomClass:(id)a3 forDefault:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v13 = 0LL;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v13));
    id v8 = v13;
    if (v8)
    {
      id v9 = sub_10003E9DC();
      objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000B4F0((uint64_t)v8, v10);
      }

      BOOL v11 = 0;
    }

    else
    {
      BOOL v11 = -[MSDDefaultsManager setObject:forDefault:](self, "setObject:forDefault:", v7, v6);
    }
  }

  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)setObject:(id)a3 forDefault:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unsigned int v8 = -[MSDDefaultsManager isDeveloperProfileLoaded](self, "isDeveloperProfileLoaded");
    uint64_t v9 = 1LL;
    if (v8) {
      uint64_t v9 = 2LL;
    }
    -[objc_class setObject:forKey:]((&self->super.isa)[v9], "setObject:forKey:", v6, v7);
  }

  else
  {
    id v10 = sub_10003E9DC();
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000B564();
    }
  }

  return v7 != 0LL;
}

- (BOOL)clearObjectForDefault:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[NSUserDefaults removeObjectForKey:](self->_MSDDeveloperDefaults, "removeObjectForKey:", v4);
    -[NSUserDefaults removeObjectForKey:](self->_MSDDefaults, "removeObjectForKey:", v4);
  }

  else
  {
    id v5 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000B590();
    }
  }

  return v4 != 0LL;
}

- (BOOL)removeObjectForDefault:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = -[MSDDefaultsManager isDeveloperProfileLoaded](self, "isDeveloperProfileLoaded");
    uint64_t v6 = 1LL;
    if (v5) {
      uint64_t v6 = 2LL;
    }
    -[objc_class removeObjectForKey:]((&self->super.isa)[v6], "removeObjectForKey:", v4);
  }

  else
  {
    id v7 = sub_10003E9DC();
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000B590();
    }
  }

  return v4 != 0LL;
}

- (id)objectForDefault:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (-[MSDDefaultsManager isDeveloperProfileLoaded](self, "isDeveloperProfileLoaded")) {
      MSDDeveloperDefaults = self->_MSDDeveloperDefaults;
    }
    else {
      MSDDeveloperDefaults = self->_MSDDefaults;
    }
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](MSDDeveloperDefaults, "objectForKey:", v4));
  }

  else
  {
    id v6 = sub_10003E9DC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000B5BC();
    }

    unsigned int v8 = 0LL;
  }

  return v8;
}

- (id)objectForKeyInDeveloperDomain:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_MSDDeveloperDefaults, "objectForKey:", v4));
  if (v5) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsManager _decodeObject:forKey:](self, "_decodeObject:forKey:", v5, v4));
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)objectForKeyInDefaultDomain:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](self->_MSDDefaults, "objectForKey:", v4));
  if (v5) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsManager _decodeObject:forKey:](self, "_decodeObject:forKey:", v5, v4));
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (id)objectForDefaultWithCustomClass:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsManager objectForDefault:](self, "objectForDefault:", v4));
  if (v5) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDefaultsManager _decodeObject:forKey:](self, "_decodeObject:forKey:", v5, v4));
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  unsigned int v3 = -[MSDDefaultsManager isDeveloperProfileLoaded](self, "isDeveloperProfileLoaded");
  uint64_t v4 = 1LL;
  if (v3) {
    uint64_t v4 = 2LL;
  }
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue( -[objc_class dictionaryRepresentation]( (&self->super.isa)[v4],  "dictionaryRepresentation"));
}

- (BOOL)profilesEverInstalled
{
  return -[NSUserDefaults BOOLForKey:](self->_MSDDeveloperDefaults, "BOOLForKey:", @"developerProfileLoaded");
}

- (BOOL)isDeveloperProfileLoaded
{
  unint64_t v3 = -[MSDDefaultsManager developerProfilesCount](self, "developerProfilesCount");
  if ((v3 != 0) != -[NSUserDefaults BOOLForKey:]( self->_MSDDeveloperDefaults,  "BOOLForKey:",  @"developerProfileLoaded")) {
    -[NSUserDefaults setBool:forKey:]( self->_MSDDeveloperDefaults,  "setBool:forKey:",  v3 != 0,  @"developerProfileLoaded");
  }
  return v3 != 0;
}

- (void)clearDeveloperDefaults
{
}

- (void)clearPrivateAndSharedLocalData
{
}

- (id)_decodeObject:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    uint64_t v27 = (uint64_t)v5;
    id v7 = a3;
    uint64_t v26 = objc_opt_class(&OBJC_CLASS___MediaService);
    uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___MSDDefaultsInfo);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___CKServerChangeToken);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___MSPublicDBInfo);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSData);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSMutableData);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___CKRecordZoneID);
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSNull);
    v17 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v26,  v25,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  objc_opt_class(&OBJC_CLASS___NSNumber),  0LL);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    id v28 = 0LL;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v18,  v7,  &v28));

    id v20 = v28;
    if (v20)
    {
      id v21 = sub_10003E9DC();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      id v6 = (void *)v27;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10000B5E8(v27, (uint64_t)v20, v22);
      }

      id v23 = 0LL;
    }

    else
    {
      id v23 = v19;
      id v6 = (void *)v27;
    }
  }

  else
  {
    id v23 = 0LL;
  }

  return v23;
}

- (NSUserDefaults)MSDDefaults
{
  return self->_MSDDefaults;
}

- (void)setMSDDefaults:(id)a3
{
}

- (NSUserDefaults)MSDDeveloperDefaults
{
  return self->_MSDDeveloperDefaults;
}

- (void)setMSDDeveloperDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end