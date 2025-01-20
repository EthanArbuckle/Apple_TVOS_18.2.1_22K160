@interface CLAuthorizationDatabase
+ (BOOL)keyPath:(id)a3 sharesAuthWithKeyPath:(id)a4;
+ (id)authorizationDatabaseWithFilename:(id)a3 withDataProtectionClass:(int)a4;
- (BOOL)BOOLForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(BOOL)a5;
- (BOOL)_CLCommonIsBundleSystemService:(id)a3;
- (BOOL)_isBundlePathReachable:(id)a3;
- (BOOL)_isValidAuthLimitedKeyPath:(id)a3;
- (BOOL)_removeDictionaryAtKeyPath:(id)a3 shouldLog:(BOOL)a4;
- (BOOL)dictionaryExistsAtKeyPath:(id)a3;
- (BOOL)expensivelyGetIdentifyingInformation:(client_identifying_information *)a3 forClient:(id)a4;
- (BOOL)hasValueForKey:(id)a3 atKeyPath:(id)a4;
- (BOOL)isBundlePathRegisteredSystemService:(id)a3;
- (BOOL)isKeyPathRegisteredSystemService:(id)a3;
- (BOOL)migrateDictionaryAtKeyPath:(id)a3 toKeyPath:(id)a4 forceMigrationOnAuthCollision:(BOOL)a5;
- (BOOL)removeDictionaryAtKeyPath:(id)a3;
- (BOOL)setupDictionary:(id)a3 atKeyPath:(id)a4;
- (CLAuthorizationDatabase)initWithFilename:(id)a3 withDataProtectionClass:(int)a4;
- (NSArray)_getDefaultDeniedSystemServices;
- (NSMutableDictionary)alternateIdentitiesMap;
- (NSMutableDictionary)systemServicesMap;
- (double)doubleForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(double)a5;
- (float)floatForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(float)a5;
- (float)migrationVersionNumber;
- (id)_ckpToAccessGivenKey:(id)a3 andInputKeyPath:(id)a4;
- (id)_dictionaryForKey:(id)a3 atKeyPath:(id)a4;
- (id)_valueForKey:(id)a3 atKeyPath:(id)a4;
- (id)allUsers;
- (id)arrayForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5;
- (id)dataForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5;
- (id)dictionaryForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5;
- (id)getStateSummary;
- (id)getUsersODUUIDs;
- (id)primaryKeyPathForAuthLimitedKeyPath:(id)a3;
- (id)readonlyStoreAtKeyPath:(id)a3;
- (id)registerClient:(id)a3 fromAuthSync:(BOOL)a4;
- (id)registerSubIdentity:(id)a3 withType:(char)a4 forAnchorKeyPath:(id)a5;
- (id)registeredKeyPathForClientIdentifier:(id)a3;
- (id)stringForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5;
- (int)intForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(int)a5;
- (int64_t)longForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(int64_t)a5;
- (signed)shortForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(signed __int16)a5;
- (unint64_t)clientCount;
- (void)_cacheAlternativeIdentities;
- (void)_cacheSystemServicesMap;
- (void)_deriveAndCacheSystemServicesMap;
- (void)_internalMigrationClearUnknownKeys;
- (void)_internalMigrationLegacyKeys;
- (void)_internalMigrationRegisterAllClients;
- (void)_setUpDefaultDeniedSystemServices;
- (void)_setValue:(id)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)_setupSystemServiceDictionaries;
- (void)cacheInfoPlistKeysForClient:(id)a3;
- (void)clear;
- (void)completeMigration;
- (void)iterateAllAnchorKeyPathsWithBlock:(id)a3;
- (void)iterateIdentitiesRelatedToKeyPath:(id)a3 withBlock:(id)a4;
- (void)performFullSystemServiceSetup;
- (void)removeUser:(id)a3;
- (void)removeValueForKey:(id)a3 atKeyPath:(id)a4;
- (void)setAlternateIdentitiesMap:(id)a3;
- (void)setArray:(id)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setBool:(BOOL)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setData:(id)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setDictionary:(id)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setDouble:(double)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setFloat:(float)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setInt:(int)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setInternalKeyMigrationComplete;
- (void)setLong:(int64_t)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setMigrationVersionNumber;
- (void)setShort:(signed __int16)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setString:(id)a3 forKey:(id)a4 atKeyPath:(id)a5;
- (void)setSystemServicesMap:(id)a3;
@end

@implementation CLAuthorizationDatabase

- (NSArray)_getDefaultDeniedSystemServices
{
  v1 = @"/System/Library/LocationBundles/AppGenius.bundle";
  return +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v1, 1LL);
}

+ (id)authorizationDatabaseWithFilename:(id)a3 withDataProtectionClass:(int)a4
{
  return [objc_alloc((Class)a1) initWithFilename:a3 withDataProtectionClass:*(void *)&a4];
}

- (CLAuthorizationDatabase)initWithFilename:(id)a3 withDataProtectionClass:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (qword_10199D2E8 != -1) {
    dispatch_once(&qword_10199D2E8, &stru_101879A88);
  }
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CLAuthorizationDatabase;
  v7 = -[CLPersistentDictionary initWithFilename:withDataProtectionClass:]( &v10,  "initWithFilename:withDataProtectionClass:",  a3,  v4);
  if (-[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](v7, "underlyingDictionary"),  "objectForKeyedSubscript:",  @"MigrationVersionNumber"))
  {
    -[CLAuthorizationDatabase _internalMigrationClearUnknownKeys](v7, "_internalMigrationClearUnknownKeys");
  }

  else
  {
    -[CLAuthorizationDatabase _internalMigrationLegacyKeys](v7, "_internalMigrationLegacyKeys");
    -[CLAuthorizationDatabase setInternalKeyMigrationComplete](v7, "setInternalKeyMigrationComplete");
    -[CLPersistentDictionary persist](v7, "persist");
  }

  -[CLAuthorizationDatabase migrationVersionNumber](v7, "migrationVersionNumber");
  if (v8 < 15.0) {
    -[CLAuthorizationDatabase _internalMigrationRegisterAllClients](v7, "_internalMigrationRegisterAllClients");
  }
  -[CLAuthorizationDatabase _cacheSystemServicesMap](v7, "_cacheSystemServicesMap");
  -[CLAuthorizationDatabase _cacheAlternativeIdentities](v7, "_cacheAlternativeIdentities");
  return v7;
}

+ (BOOL)keyPath:(id)a3 sharesAuthWithKeyPath:(id)a4
{
  id v4 = a4;
  id v5 = a3;
  if ([a3 isEqual:a4])
  {
    LOBYTE(v6) = 1;
    return v6;
  }

  unsigned int v7 = [v5 isAuthSharingSubIdentity];
  unsigned int v6 = [v4 isAuthSharingSubIdentity];
  if (v7 && v6)
  {
    id v5 = [v5 anchorKeyPath];
LABEL_10:
    id v4 = [v4 anchorKeyPath];
    goto LABEL_11;
  }

  if (!v7)
  {
    if (!v6) {
      return v6;
    }
    goto LABEL_10;
  }

  id v5 = [v5 anchorKeyPath];
LABEL_11:
  LOBYTE(v6) = [v5 isEqual:v4];
  return v6;
}

- (float)migrationVersionNumber
{
  return result;
}

- (void)setInternalKeyMigrationComplete
{
}

- (void)setMigrationVersionNumber
{
  LODWORD(v2) = 1097859072;
  -[NSMutableDictionary setObject:forKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "setObject:forKeyedSubscript:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v2),  @"MigrationVersionNumber");
}

- (void)completeMigration
{
}

- (void)clear
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101879AA8);
  }
  v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#AuthorizationDatabaseDroppingData Clearing entire database",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    v7[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  0LL,  "#AuthorizationDatabaseDroppingData Clearing entire database",  v7,  2);
    id v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAuthorizationDatabase clear]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CLAuthorizationDatabase;
  -[CLPersistentDictionary clear](&v6, "clear");
  -[CLAuthorizationDatabase setAlternateIdentitiesMap:]( self,  "setAlternateIdentitiesMap:",  +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[CLAuthorizationDatabase setSystemServicesMap:]( self,  "setSystemServicesMap:",  +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[CLAuthorizationDatabase setMigrationVersionNumber](self, "setMigrationVersionNumber");
  -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
  -[CLPersistentDictionary persist](self, "persist");
}

- (id)_ckpToAccessGivenKey:(id)a3 andInputKeyPath:(id)a4
{
  id v4 = a4;
  id v7 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  [a4 clientKey]);
  if ([v4 isAuthLimited])
  {
    if (-[CLAuthorizationDatabase _isValidAuthLimitedKeyPath:](self, "_isValidAuthLimitedKeyPath:", v4))
    {
      else {
        return -[NSMutableDictionary objectForKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"),  "objectForKeyedSubscript:",  [v4 nestedBundlePath]);
      }
    }

    return +[CLClientKeyPath nullClientKeyPath](&OBJC_CLASS___CLClientKeyPath, "nullClientKeyPath");
  }

  if (v7)
  {
    if ([v4 isAuthSharingSubIdentity]
      && [(id)qword_10199D2F8 containsObject:a3])
    {
      return +[CLClientKeyPath clientKeyPathWithClientKey:]( CLClientKeyPath,  "clientKeyPathWithClientKey:",  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  objc_msgSend(v4, "clientKey")),  "objectForKeyedSubscript:",  @"AnchorKeyPath"));
    }
  }

  else
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    v9 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 68289538;
      v10[1] = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2114;
      id v14 = a3;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Warning accessing unknown or null client in CLAuthorizationDatabase. No-op'ing, key :%{public, location:escape_only}@, keyPath:%{public, location:escape_only}@}",  (uint8_t *)v10,  0x26u);
    }

    return +[CLClientKeyPath nullClientKeyPath](&OBJC_CLASS___CLClientKeyPath, "nullClientKeyPath");
  }

  return v4;
}

- (BOOL)_isValidAuthLimitedKeyPath:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"),  "objectForKeyedSubscript:",  [a3 nestedBundlePath]);
  if (v5) {
    LOBYTE(v5) = -[CLAuthorizationDatabase dictionaryExistsAtKeyPath:]( self,  "dictionaryExistsAtKeyPath:",  [a3 limitingCKP]);
  }
  return (char)v5;
}

- (id)primaryKeyPathForAuthLimitedKeyPath:(id)a3
{
  if (!-[CLAuthorizationDatabase _isValidAuthLimitedKeyPath:](self, "_isValidAuthLimitedKeyPath:")) {
    return +[CLClientKeyPath nullClientKeyPath](&OBJC_CLASS___CLClientKeyPath, "nullClientKeyPath");
  }
  id result = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"),  "objectForKeyedSubscript:",  [a3 nestedBundlePath]);
  if (!result) {
    return +[CLClientKeyPath nullClientKeyPath](&OBJC_CLASS___CLClientKeyPath, "nullClientKeyPath");
  }
  return result;
}

- (BOOL)dictionaryExistsAtKeyPath:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  if (a3 && _os_feature_enabled_impl("CoreLocation", "cl_pula") && ![a3 userName])
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    float v8 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68290051;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      __int16 v15 = 2114;
      id v16 = [a3 userName];
      __int16 v17 = 2114;
      id v18 = a3;
      __int16 v19 = 2082;
      v20 = "assert";
      __int16 v21 = 2081;
      v22 = "(!keyPath || (!_os_feature_enabled_impl(CoreLocation, cl_pula) || keyPath.userName))";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula ena bled., userName:%{public, location:escape_only}@, ClientKeyPath:%{public, location:escape_only}@, ev ent:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x3Au);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101879AA8);
      }
    }

    v9 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      id v10 = [a3 userName];
      *(_DWORD *)buf = 68290051;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      __int16 v15 = 2114;
      id v16 = v10;
      __int16 v17 = 2114;
      id v18 = a3;
      __int16 v19 = 2082;
      v20 = "assert";
      __int16 v21 = 2081;
      v22 = "(!keyPath || (!_os_feature_enabled_impl(CoreLocation, cl_pula) || keyPath.userName))";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula enabled.",  "{msg%{public}.0s:#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula ena bled., userName:%{public, location:escape_only}@, ClientKeyPath:%{public, location:escape_only}@, ev ent:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x3Au);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101879AA8);
      }
    }

    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO)) {
      sub_1012680DC((uint64_t)[a3 userName], (uint64_t)a3, (uint64_t)buf);
    }
    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLAuthorizationDatabase.mm",  223,  "-[CLAuthorizationDatabase dictionaryExistsAtKeyPath:]");
    __break(1u);
  }

  id v6 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  [a3 clientKey]);

  return v6 != 0LL;
}

- (BOOL)setupDictionary:(id)a3 atKeyPath:(id)a4
{
  id v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  if (a4 && _os_feature_enabled_impl("CoreLocation", "cl_pula") && ![a4 userName])
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    __int16 v13 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68290051;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 2114;
      id v21 = [a4 userName];
      __int16 v22 = 2114;
      id v23 = a4;
      __int16 v24 = 2082;
      v25 = "assert";
      __int16 v26 = 2081;
      v27 = "(!keyPath || (!_os_feature_enabled_impl(CoreLocation, cl_pula) || keyPath.userName))";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula ena bled., userName:%{public, location:escape_only}@, ClientKeyPath:%{public, location:escape_only}@, ev ent:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x3Au);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101879AA8);
      }
    }

    id v14 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      id v15 = [a4 userName];
      *(_DWORD *)buf = 68290051;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 2114;
      id v21 = v15;
      __int16 v22 = 2114;
      id v23 = a4;
      __int16 v24 = 2082;
      v25 = "assert";
      __int16 v26 = 2081;
      v27 = "(!keyPath || (!_os_feature_enabled_impl(CoreLocation, cl_pula) || keyPath.userName))";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula enabled.",  "{msg%{public}.0s:#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula ena bled., userName:%{public, location:escape_only}@, ClientKeyPath:%{public, location:escape_only}@, ev ent:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  buf,  0x3Au);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101879AA8);
      }
    }

    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO)) {
      sub_1012680DC((uint64_t)[a4 userName], (uint64_t)a4, (uint64_t)buf);
    }
    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLAuthorizationDatabase.mm",  231,  "-[CLAuthorizationDatabase setupDictionary:atKeyPath:]");
    __break(1u);
  }

  if (![a4 isValidCKP]
    || ([a4 isAuthLimited] & 1) != 0
    || -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  [a4 clientKey]))
  {
    BOOL v8 = 0;
  }

  else
  {
    id v10 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  a3);
    if ([a4 subIdentityId])
    {
      id v11 = objc_msgSend(objc_msgSend(a4, "anchorKeyPath"), "clientKey");
      if (!-[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v11)) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "setObject:forKeyedSubscript:",  +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"),  v11);
      }
      id v12 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v11),  "objectForKeyedSubscript:",  @"SubIdentities");
      if (!v12)
      {
        objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v11),  "setObject:forKeyedSubscript:",  +[NSMutableArray array](NSMutableArray, "array"),  @"SubIdentities");
        id v12 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v11),  "objectForKeyedSubscript:",  @"SubIdentities");
      }

      objc_msgSend(v12, "addObject:", objc_msgSend(a4, "clientKey"));
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v10,  "setObject:forKeyedSubscript:",  v11,  @"AnchorKeyPath");
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "setObject:forKeyedSubscript:",  v10,  [a4 clientKey]);
    -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)removeDictionaryAtKeyPath:(id)a3
{
  return -[CLAuthorizationDatabase _removeDictionaryAtKeyPath:shouldLog:]( self,  "_removeDictionaryAtKeyPath:shouldLog:",  a3,  1LL);
}

- (BOOL)_removeDictionaryAtKeyPath:(id)a3 shouldLog:(BOOL)a4
{
  BOOL v4 = a4;
  v33 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  if (a3 && _os_feature_enabled_impl("CoreLocation", "cl_pula") && ![a3 userName])
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    v29 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      uint64_t buf = 68290051LL;
      __int16 v45 = 2082;
      v46 = "";
      __int16 v47 = 2114;
      id v48 = [a3 userName];
      __int16 v49 = 2114;
      id v50 = a3;
      __int16 v51 = 2082;
      v52 = "assert";
      __int16 v53 = 2081;
      v54 = "(!keyPath || (!_os_feature_enabled_impl(CoreLocation, cl_pula) || keyPath.userName))";
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula ena bled., userName:%{public, location:escape_only}@, ClientKeyPath:%{public, location:escape_only}@, ev ent:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  (uint8_t *)&buf,  0x3Au);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101879AA8);
      }
    }

    v30 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      id v31 = [a3 userName];
      uint64_t buf = 68290051LL;
      __int16 v45 = 2082;
      v46 = "";
      __int16 v47 = 2114;
      id v48 = v31;
      __int16 v49 = 2114;
      id v50 = a3;
      __int16 v51 = 2082;
      v52 = "assert";
      __int16 v53 = 2081;
      v54 = "(!keyPath || (!_os_feature_enabled_impl(CoreLocation, cl_pula) || keyPath.userName))";
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v30,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula enabled.",  "{msg%{public}.0s:#AuthorizationDatabase requires userName be present in the clientKeyPath with cl_pula ena bled., userName:%{public, location:escape_only}@, ClientKeyPath:%{public, location:escape_only}@, ev ent:%{public, location:escape_only}s, condition:%{private, location:escape_only}s}",  (uint8_t *)&buf,  0x3Au);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101879AA8);
      }
    }

    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_INFO)) {
      sub_1012680DC((uint64_t)[a3 userName], (uint64_t)a3, (uint64_t)&buf);
    }
    abort_report_np( "%s:%d: assertion failure in %s",  "/Library/Caches/com.apple.xbs/Sources/CoreLocation/Daemon/Core/ClientManagement/CLAuthorizationDatabase.mm",  270,  "-[CLAuthorizationDatabase _removeDictionaryAtKeyPath:shouldLog:]");
    __break(1u);
LABEL_61:
    dispatch_once(&qword_101934980, &stru_101879AA8);
LABEL_27:
    __int16 v18 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
    {
      uint64_t buf = 68289282LL;
      __int16 v45 = 2082;
      v46 = "";
      __int16 v47 = 2114;
      id v48 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Attempting to remove System Service from #AuthDatabase! Refusing removal., System Ser vice:%{public, location:escape_only}@}",  (uint8_t *)&buf,  0x1Cu);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101879AA8);
      }
    }

    __int16 v19 = (os_log_s *)qword_101934988;
    if (os_signpost_enabled((os_log_t)qword_101934988))
    {
      uint64_t buf = 68289282LL;
      __int16 v45 = 2082;
      v46 = "";
      __int16 v47 = 2114;
      id v48 = a3;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Attempting to remove System Service from #AuthDatabase! Refusing removal.",  "{msg%{public}.0s:Attempting to remove System Service from #AuthDatabase! Refusing removal., System Ser vice:%{public, location:escape_only}@}",  (uint8_t *)&buf,  0x1Cu);
    }

    goto LABEL_32;
  }

  id v7 = [a3 clientKey];
  if (!-[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v7))
  {
LABEL_32:
    BOOL v20 = 0;
    goto LABEL_49;
  }

  if ([a3 bundlePath])
  {
    unsigned int v8 = objc_msgSend( objc_msgSend(a3, "bundlePath"),  "isEqualToString:",  objc_msgSend(objc_msgSend(a3, "bundlePath"), "stringByResolvingSymlinksInPath")) ^ 1;
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    v9 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289538LL;
      __int16 v45 = 2082;
      v46 = "";
      __int16 v47 = 2114;
      id v48 = a3;
      __int16 v49 = 2114;
      id v50 = [a3 bundlePath];
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#AuthDatabase bundle path is a symlink, so it can be removed, keyPath:%{public, loc ation:escape_only}@, bundlePath:%{public, location:escape_only}@}",  (uint8_t *)&buf,  0x26u);
    }
  }

  else
  {
    unsigned int v8 = 0;
  }

  if (((!-[CLAuthorizationDatabase BOOLForKey:atKeyPath:defaultValue:]( self,  "BOOLForKey:atKeyPath:defaultValue:",  @"isSystemService",  a3,  0LL) | v8) & 1) == 0)
  {
    if (qword_101934980 == -1) {
      goto LABEL_27;
    }
    goto LABEL_61;
  }

  id v10 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v7),  "objectForKeyedSubscript:",  @"SubIdentities");
  id v11 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v7),  "objectForKeyedSubscript:",  @"AnchorKeyPath");
  id v32 = v7;
  if (v10)
  {
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v12 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v39;
      do
      {
        id v14 = 0LL;
        do
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v14);
          if (v4)
          {
            if (qword_101934980 != -1) {
              dispatch_once(&qword_101934980, &stru_101879AA8);
            }
            id v16 = (os_log_s *)qword_101934988;
            if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
            {
              id v17 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v15);
              uint64_t buf = 68289538LL;
              __int16 v45 = 2082;
              v46 = "";
              __int16 v47 = 2114;
              id v48 = v15;
              __int16 v49 = 2114;
              id v50 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#AuthorizationDatabaseDroppingData Removing dictionary for key, Key:%{publi c, location:escape_only}@, Dictionary:%{public, location:escape_only}@}",  (uint8_t *)&buf,  0x26u);
            }
          }

          -[NSMutableDictionary removeObjectForKey:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "removeObjectForKey:",  v15);
          id v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }

      while (v12);
    }
  }

  else
  {
    id v21 = v11;
    if (v11
      && objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v11),  "objectForKeyedSubscript:",  @"SubIdentities"))
    {
      objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v21),  "objectForKeyedSubscript:",  @"SubIdentities"),  "removeObject:",  v7);
    }
  }

  id v22 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v32),  "objectForKeyedSubscript:",  @"PluginBundleIds");
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v23 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v35;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v22);
        }
        -[NSMutableDictionary removeObjectForKey:]( -[CLAuthorizationDatabase alternateIdentitiesMap](self, "alternateIdentitiesMap"),  "removeObjectForKey:",  *(void *)(*((void *)&v34 + 1) + 8LL * (void)i));
      }

      id v23 = [v22 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }

    while (v23);
  }

  if (v4)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    __int16 v26 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v32);
      uint64_t buf = 68289538LL;
      __int16 v45 = 2082;
      v46 = "";
      __int16 v47 = 2114;
      id v48 = v32;
      __int16 v49 = 2114;
      id v50 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#AuthorizationDatabaseDroppingData Removing dictionary for key, Key:%{public, locat ion:escape_only}@, Dictionary:%{public, location:escape_only}@}",  (uint8_t *)&buf,  0x26u);
    }
  }

  -[NSMutableDictionary removeObjectForKey:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "removeObjectForKey:",  v32);
  -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
  BOOL v20 = 1;
LABEL_49:

  return v20;
}

- (unint64_t)clientCount
{
  return (unint64_t)-[NSMutableDictionary count]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "count")
       - 1;
}

- (BOOL)expensivelyGetIdentifyingInformation:(client_identifying_information *)a3 forClient:(id)a4
{
  if ([a4 executablePath])
  {
    char v6 = 0;
    goto LABEL_51;
  }

  v43 = 0LL;
  v44 = 0LL;
  if ([a4 bundleId])
  {
    id v7 = objc_msgSend( [LSApplicationExtensionRecord alloc],  "initWithBundleIdentifier:error:",  objc_msgSend(a4, "bundleId"),  &v44);
  }

  else
  {
    if (![a4 bundlePath])
    {
      unsigned int v8 = 0LL;
      goto LABEL_16;
    }

    id v7 = objc_msgSend( [LSApplicationExtensionRecord alloc],  "initWithURL:error:",  +[NSURL fileURLWithPath:isDirectory:]( NSURL,  "fileURLWithPath:isDirectory:",  objc_msgSend(a4, "bundlePath"),  1),  &v44);
  }

  unsigned int v8 = v7;
  if (v7)
  {
    id v9 = objc_msgSend(objc_msgSend(v7, "containingBundleRecord"), "bundleIdentifier");
    if (v9) {
      a3->id var0 = v9;
    }
    id v10 = objc_autoreleasePoolPush();
    id v11 = [v8 containingBundleRecord];
    objc_opt_class(&OBJC_CLASS___LSApplicationRecord);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0) {
      id v13 = v11;
    }
    else {
      id v13 = 0LL;
    }
    objc_autoreleasePoolPop(v10);
    char v14 = 1;
    if (v13) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }

- (void)cacheInfoPlistKeysForClient:(id)a3
{
  id v5 = (__CFBundle *)sub_100D96750( -[CLAuthorizationDatabase stringForKey:atKeyPath:defaultValue:]( self,  "stringForKey:atKeyPath:defaultValue:",  @"PlatformSpecificBundleId",  a3,  0LL),  -[CLAuthorizationDatabase stringForKey:atKeyPath:defaultValue:]( self,  "stringForKey:atKeyPath:defaultValue:",  @"BundleId",  a3,  0LL),  (const __CFString *)-[CLAuthorizationDatabase stringForKey:atKeyPath:defaultValue:]( self,  "stringForKey:atKeyPath:defaultValue:",  @"BundlePath",  a3,  0LL),  0LL);
  if (v5)
  {
    char v6 = v5;
    v8[0] = @"NSLocationRequireExplicitServiceSession";
    v8[1] = @"CLDisableAuthorizationRequests";
    id v7 = sub_100D96624( v5,  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
    if (objc_msgSend( objc_msgSend(v7, "objectForKeyedSubscript:", @"NSLocationDefaultAccuracyReduced"),  "BOOLValue")) {
      -[CLAuthorizationDatabase setBool:forKey:atKeyPath:]( self,  "setBool:forKey:atKeyPath:",  1LL,  @"DefaultAccuracyReduced",  a3);
    }
    if (objc_msgSend( objc_msgSend(v7, "objectForKeyedSubscript:", @"NSLocationRequireExplicitServiceSession"),  "BOOLValue")) {
      -[CLAuthorizationDatabase setBool:forKey:atKeyPath:]( self,  "setBool:forKey:atKeyPath:",  1LL,  @"ExplicitServiceSession",  a3);
    }
    if (objc_msgSend( objc_msgSend(v7, "objectForKeyedSubscript:", @"CLDisableAuthorizationRequests"),  "BOOLValue")) {
      -[CLAuthorizationDatabase setBool:forKey:atKeyPath:]( self,  "setBool:forKey:atKeyPath:",  1LL,  @"AuthRequestsDisabled",  a3);
    }
    CFRelease(v6);
  }

- (id)registerClient:(id)a3 fromAuthSync:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (![a3 isValidCKP] || objc_msgSend(v5, "subIdentityId"))
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    id v7 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#Warning #RegisterClientKeyPath passed in un-registerable client. Returning #nullCKP.",  (uint8_t *)&buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(&buf, 0x65CuLL);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101879AA8);
      }
      *(_WORD *)__int16 v50 = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  &buf,  1628LL,  &_mh_execute_header,  qword_101934988,  0LL,  "#Warning #RegisterClientKeyPath passed in un-registerable client. Returning #nullCKP.",  v50,  2);
      v43 = (uint64_t *)v42;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAuthorizationDatabase registerClient:fromAuthSync:]", "%s\n", v42);
      if (v43 != &buf) {
        free(v43);
      }
    }

    return +[CLClientKeyPath nullClientKeyPath](&OBJC_CLASS___CLClientKeyPath, "nullClientKeyPath");
  }

  if (-[CLAuthorizationDatabase isKeyPathRegisteredSystemService:](self, "isKeyPathRegisteredSystemService:", v5)) {
    return v5;
  }
  if (![v5 isAuthLimited])
  {
    id v19 = [v5 bundlePath];
    id v20 = [v5 executablePath];
    id v21 = v20;
    uint64_t buf = 0LL;
    memset(&buf_8[16], 0, 17);
    *(void *)buf_8 = v19;
    *(void *)&buf_8[8] = v20;
    if (v19)
    {
      unsigned __int8 v22 = -[CLAuthorizationDatabase _CLCommonIsBundleSystemService:](self, "_CLCommonIsBundleSystemService:", v19);
      if (!v21)
      {
        if ((v22 & 1) != 0)
        {
          int v44 = 1;
          goto LABEL_42;
        }

        -[CLAuthorizationDatabase expensivelyGetIdentifyingInformation:forClient:]( self,  "expensivelyGetIdentifyingInformation:forClient:",  &buf,  v5);
        if (-[CLAuthorizationDatabase _isBundlePathReachable:](self, "_isBundlePathReachable:", v19))
        {
LABEL_41:
          int v44 = 0;
LABEL_42:
          if ([v5 bundleId]
            && (id v27 = [v5 bundleId], (objc_msgSend(v27, "isEqual:", buf) & 1) == 0))
          {
            id v29 = [v5 userName];
            v28 = +[CLClientKeyPath clientKeyPathWithUserName:clientAnchor:anchorType:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithUserName:clientAnchor:anchorType:",  v29,  buf,  105LL);
          }

          else
          {
            v28 = (CLClientKeyPath *)[v5 anchorKeyPath];
          }

          v30 = v28;
          unsigned __int8 v31 = -[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", v28);
          -[CLAuthorizationDatabase setupDictionary:atKeyPath:]( self,  "setupDictionary:atKeyPath:",  &__NSDictionary0__struct,  v30);
          -[CLAuthorizationDatabase setString:forKey:atKeyPath:]( self,  "setString:forKey:atKeyPath:",  buf,  @"BundleId",  v30);
          -[CLAuthorizationDatabase setString:forKey:atKeyPath:]( self,  "setString:forKey:atKeyPath:",  *(void *)buf_8,  @"BundlePath",  v30);
          -[CLAuthorizationDatabase setString:forKey:atKeyPath:]( self,  "setString:forKey:atKeyPath:",  *(void *)&buf_8[8],  @"Executable",  v30);
          if (buf_8[32]) {
            -[CLAuthorizationDatabase setBool:forKey:atKeyPath:]( self,  "setBool:forKey:atKeyPath:",  1LL,  @"IsAppClip",  v30);
          }
          if (*(void *)&buf_8[24])
          {
            -[CLAuthorizationDatabase setArray:forKey:atKeyPath:]( self,  "setArray:forKey:atKeyPath:",  *(void *)&buf_8[24],  @"PluginBundleIds",  v30);
            __int128 v47 = 0u;
            __int128 v48 = 0u;
            __int128 v45 = 0u;
            __int128 v46 = 0u;
            id v32 = *(void **)&buf_8[24];
            id v33 = [*(id *)&buf_8[24] countByEnumeratingWithState:&v45 objects:v49 count:16];
            if (v33)
            {
              id v34 = v33;
              uint64_t v35 = *(void *)v46;
              do
              {
                for (i = 0LL; i != v34; i = (char *)i + 1)
                {
                  if (*(void *)v46 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( -[CLAuthorizationDatabase alternateIdentitiesMap](self, "alternateIdentitiesMap"),  "setObject:forKeyedSubscript:",  v30,  *(void *)(*((void *)&v45 + 1) + 8LL * (void)i));
                }

                id v34 = [v32 countByEnumeratingWithState:&v45 objects:v49 count:16];
              }

              while (v34);
            }
          }

          if ((v31 & 1) == 0) {
            -[CLAuthorizationDatabase setBool:forKey:atKeyPath:]( self,  "setBool:forKey:atKeyPath:",  1LL,  @"SuppressShowingInSettings",  v30);
          }
          if (v44)
          {
            if (qword_101934970 != -1) {
              dispatch_once(&qword_101934970, &stru_101879AC8);
            }
            uint64_t v37 = (os_log_s *)qword_101934978;
            if (os_log_type_enabled((os_log_t)qword_101934978, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)__int16 v50 = 68289538;
              int v51 = 0;
              __int16 v52 = 2082;
              id v53 = "";
              __int16 v54 = 2114;
              id v55 = v5;
              __int16 v56 = 2114;
              id v57 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:System Service connected and registering; We failed to find it while enumerating "
                "bundles., inputCKP:%{public, location:escape_only}@, registeredCKP:%{public, location:escape_only}@}",
                v50,
                0x26u);
              if (qword_101934970 != -1) {
                dispatch_once(&qword_101934970, &stru_101879AC8);
              }
            }

            __int128 v38 = (os_log_s *)qword_101934978;
            if (os_signpost_enabled((os_log_t)qword_101934978))
            {
              *(_DWORD *)__int16 v50 = 68289538;
              int v51 = 0;
              __int16 v52 = 2082;
              id v53 = "";
              __int16 v54 = 2114;
              id v55 = v5;
              __int16 v56 = 2114;
              id v57 = v30;
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v38,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "System Service connected and registering; We failed to find it while enumerating bundles.",
                "{msg%{public}.0s:System Service connected and registering; We failed to find it while enumerating "
                "bundles., inputCKP:%{public, location:escape_only}@, registeredCKP:%{public, location:escape_only}@}",
                v50,
                0x26u);
            }

            -[CLAuthorizationDatabase setBool:forKey:atKeyPath:]( self,  "setBool:forKey:atKeyPath:",  1LL,  @"isSystemService",  v30);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"),  "setObject:forKeyedSubscript:",  v30,  [v5 bundlePath]);
          }

          else
          {
            -[CLAuthorizationDatabase cacheInfoPlistKeysForClient:](self, "cacheInfoPlistKeysForClient:", v30);
          }

          -[CLAuthorizationDatabase removeValueForKey:atKeyPath:]( self,  "removeValueForKey:atKeyPath:",  @"TimeMissing",  v30);
          if (-[CLAuthorizationDatabase BOOLForKey:atKeyPath:defaultValue:]( self,  "BOOLForKey:atKeyPath:defaultValue:",  @"SyncedAuthForUninstalledApp",  v5,  0LL))
          {
            -[CLAuthorizationDatabase removeValueForKey:atKeyPath:]( self,  "removeValueForKey:atKeyPath:",  @"SyncedAuthForUninstalledApp",  v30);
          }

          return v30;
        }

        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101879AA8);
        }
        uint64_t v39 = qword_101934988;
        if (!os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT)) {
          return +[CLClientKeyPath nullClientKeyPath](&OBJC_CLASS___CLClientKeyPath, "nullClientKeyPath");
        }
        *(_DWORD *)__int16 v50 = 68289282;
        int v51 = 0;
        __int16 v52 = 2082;
        id v53 = "";
        __int16 v54 = 2114;
        id v55 = v19;
        id v15 = "{msg%{public}.0s:#Warning #RegisterClientKeyPath Registering a bundle path which is not known by lau"
              "nch services and is not reachable!, BundlePath:%{public, location:escape_only}@}";
        p_uint64_t buf = v50;
        id v17 = (os_log_s *)v39;
        goto LABEL_75;
      }
    }

    else if (!v20)
    {
      if (-[CLAuthorizationDatabase expensivelyGetIdentifyingInformation:forClient:]( self,  "expensivelyGetIdentifyingInformation:forClient:",  &buf,  v5))
      {
        goto LABEL_41;
      }

      if (-[CLAuthorizationDatabase BOOLForKey:atKeyPath:defaultValue:]( self,  "BOOLForKey:atKeyPath:defaultValue:",  @"SyncedAuthForUninstalledApp",  v5,  0LL))
      {
        return v5;
      }

      unsigned int v24 = -[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", v5);
      if (v4)
      {
        if (v24)
        {
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_101879AA8);
          }
          id v25 = (os_log_s *)qword_101934988;
          if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)__int16 v50 = 68289282;
            int v51 = 0;
            __int16 v52 = 2082;
            id v53 = "";
            __int16 v54 = 2114;
            id v55 = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#RegisterClientKeyPath uninstalled app registering from auth sync, but it already e xists, ClientKeyPath:%{public, location:escape_only}@}",  v50,  0x1Cu);
            if (qword_101934980 != -1) {
              dispatch_once(&qword_101934980, &stru_101879AA8);
            }
          }

          uint64_t v26 = (os_log_s *)qword_101934988;
          if (os_signpost_enabled((os_log_t)qword_101934988))
          {
            *(_DWORD *)__int16 v50 = 68289282;
            int v51 = 0;
            __int16 v52 = 2082;
            id v53 = "";
            __int16 v54 = 2114;
            id v55 = v5;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#RegisterClientKeyPath uninstalled app registering from auth sync, but it already exists",  "{msg%{public}.0s:#RegisterClientKeyPath uninstalled app registering from auth sync, but it already e xists, ClientKeyPath:%{public, location:escape_only}@}",  v50,  0x1Cu);
          }

          -[CLAuthorizationDatabase setBool:forKey:atKeyPath:]( self,  "setBool:forKey:atKeyPath:",  1LL,  @"SyncedAuthForUninstalledApp",  v5);
        }

        else
        {
          -[CLAuthorizationDatabase setupDictionary:atKeyPath:]( self,  "setupDictionary:atKeyPath:",  &__NSDictionary0__struct,  v5);
          -[CLAuthorizationDatabase setBool:forKey:atKeyPath:]( self,  "setBool:forKey:atKeyPath:",  1LL,  @"SyncedAuthForUninstalledApp",  v5);
          -[CLAuthorizationDatabase setString:forKey:atKeyPath:]( self,  "setString:forKey:atKeyPath:",  [v5 bundleId],  @"BundleId",  v5);
        }

        return v5;
      }

      if (v24)
      {
        if (qword_101934980 != -1) {
          dispatch_once(&qword_101934980, &stru_101879AA8);
        }
        __int128 v40 = (os_log_s *)qword_101934988;
        if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v50 = 68289538;
          int v51 = 0;
          __int16 v52 = 2082;
          id v53 = "";
          __int16 v54 = 2114;
          id v55 = v5;
          __int16 v56 = 2114;
          id v57 = -[CLAuthorizationDatabase readonlyStoreAtKeyPath:](self, "readonlyStoreAtKeyPath:", v5);
          _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "{\"msg%{public}.0s\":\"#Warning #RegisterClientKeyPath The client already exists but is not known by the sys tem; Setting as missing client\", \"ClientKeyPath\":%{public, location:escape_only}@, \"ExistingClientDict\""
            ":%{public, location:escape_only}@}",
            v50,
            0x26u);
        }

        -[CLAuthorizationDatabase setDouble:forKey:atKeyPath:]( self,  "setDouble:forKey:atKeyPath:",  @"TimeMissing",  v5,  CFAbsoluteTimeGetCurrent());
        return v5;
      }

      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101879AA8);
      }
      uint64_t v41 = qword_101934988;
      if (!os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT)) {
        return +[CLClientKeyPath nullClientKeyPath](&OBJC_CLASS___CLClientKeyPath, "nullClientKeyPath");
      }
      *(_DWORD *)__int16 v50 = 68289282;
      int v51 = 0;
      __int16 v52 = 2082;
      id v53 = "";
      __int16 v54 = 2114;
      id v55 = v5;
      id v15 = "{msg%{public}.0s:#Warning #RegisterClientKeyPath Attempting to register a client not known by the syst"
            "em. Deferring authorization & registration until they connect with an identity known by the system. Resolvin"
            "g to #nullCKP., ClientKeyPath:%{public, location:escape_only}@}";
      p_uint64_t buf = v50;
      id v17 = (os_log_s *)v41;
LABEL_75:
      uint32_t v18 = 28;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v15, p_buf, v18);
      return +[CLClientKeyPath nullClientKeyPath](&OBJC_CLASS___CLClientKeyPath, "nullClientKeyPath");
    }

    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    uint64_t v23 = qword_101934988;
    if (!os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT)) {
      return +[CLClientKeyPath nullClientKeyPath](&OBJC_CLASS___CLClientKeyPath, "nullClientKeyPath");
    }
    *(_DWORD *)__int16 v50 = 68289538;
    int v51 = 0;
    __int16 v52 = 2082;
    id v53 = "";
    __int16 v54 = 2114;
    id v55 = v5;
    __int16 v56 = 2114;
    id v57 = -[CLAuthorizationDatabase readonlyStoreAtKeyPath:](self, "readonlyStoreAtKeyPath:", v5);
    id v15 = "{msg%{public}.0s:#Warning #RegisterClientKeyPath Client is known by executable; they must be a daemon or"
          " system client that should be masquerading. Deferring authorization & registration until they connect with a v"
          "alid identity. Removing any existing client entry and returning #nullCKP., ClientKeyPath:%{public, locat"
          "ion:escape_only}@, ExistingClientDict:%{public, location:escape_only}@}";
    p_uint64_t buf = v50;
    id v17 = (os_log_s *)v23;
    uint32_t v18 = 38;
    goto LABEL_27;
  }

  id v9 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"),  "objectForKeyedSubscript:",  [v5 nestedBundlePath]);
  id v10 = [v5 limitingCKP];
  unsigned int v11 = -[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", v9);
  unsigned int v12 = -[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", v10);
  unsigned int v13 = v12;
  if (!v11 || (v12 & 1) == 0)
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    uint64_t v14 = qword_101934988;
    if (!os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT)) {
      return +[CLClientKeyPath nullClientKeyPath](&OBJC_CLASS___CLClientKeyPath, "nullClientKeyPath");
    }
    uint64_t buf = 68290050LL;
    *(_WORD *)buf_8 = 2082;
    *(void *)&buf_8[2] = "";
    *(_WORD *)&buf_8[10] = 2114;
    *(void *)&buf_8[12] = v9;
    *(_WORD *)&buf_8[20] = 1026;
    *(_DWORD *)&buf_8[22] = v11;
    *(_WORD *)&buf_8[26] = 2114;
    *(void *)&buf_8[28] = v10;
    __int16 v60 = 1026;
    unsigned int v61 = v13;
    id v15 = "{msg%{public}.0s:#Warning #RegisterClientKeyPath passed auth-limited keyPath with unregistered primary o"
          "r limiting keyPaths Returning #nullCKP.\", \"Primary\":%{public, location:escape_only}@, \"PrimaryRegistered\""
          ":%{public}hhd, Limiting:%{public, location:escape_only}@, LimitingRegistered:%{public}hhd}";
    p_uint64_t buf = (uint8_t *)&buf;
    id v17 = (os_log_s *)v14;
    uint32_t v18 = 50;
    goto LABEL_27;
  }

  return v5;
}

- (id)registerSubIdentity:(id)a3 withType:(char)a4 forAnchorKeyPath:(id)a5
{
  uint64_t v6 = a4;
  if ([a5 subIdentityId]
    || !-[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", a5))
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    id v10 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 68289282;
      v12[1] = 0;
      __int16 v13 = 2082;
      uint64_t v14 = "";
      __int16 v15 = 2114;
      id v16 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Warning #RegisterSubIdentity The passed anchor has a subIdentity or the anchor is not re gistered, Anchor:%{public, location:escape_only}@}",  (uint8_t *)v12,  0x1Cu);
    }

    return +[CLClientKeyPath nullClientKeyPath](&OBJC_CLASS___CLClientKeyPath, "nullClientKeyPath");
  }

  else
  {
    id v9 = [a5 clientKeyPathWithReplacementSubIdentityId:a3 subIdentityType:v6];
    -[CLAuthorizationDatabase setupDictionary:atKeyPath:]( self,  "setupDictionary:atKeyPath:",  &__NSDictionary0__struct,  v9);
  }

  return v9;
}

- (id)registeredKeyPathForClientIdentifier:(id)a3
{
  id v3 = a3;
  id v5 = [v3 clientAnchor];
  id v6 = [v3 subIdentityId];
  if (-[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", v3)) {
    return v3;
  }
  if ([v3 isAuthLimited])
  {
    if (!-[CLAuthorizationDatabase _isValidAuthLimitedKeyPath:](self, "_isValidAuthLimitedKeyPath:", v3))
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101879AA8);
      }
      id v7 = (os_log_s *)qword_101934988;
      if (!os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT)) {
        return +[CLClientKeyPath nullClientKeyPath]( &OBJC_CLASS___CLClientKeyPath,  "nullClientKeyPath",  v13,  *(_OWORD *)v14,  *(void *)&v14[16]);
      }
      uint64_t v13 = 68289282LL;
      *(_WORD *)uint64_t v14 = 2082;
      *(void *)&v14[2] = "";
      *(_WORD *)&v14[10] = 2114;
      *(void *)&v14[12] = v3;
      unsigned int v8 = "{msg%{public}.0s:#Warning #ClientResolution the passed value is an invalid auth-limited identity. Resol"
           "ving to #nullCKP, InputCKP:%{public, location:escape_only}@}";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, 0x1Cu);
      return +[CLClientKeyPath nullClientKeyPath]( &OBJC_CLASS___CLClientKeyPath,  "nullClientKeyPath",  v13,  *(_OWORD *)v14,  *(void *)&v14[16]);
    }

    return v3;
  }

  if (!-[NSMutableDictionary objectForKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"),  "objectForKeyedSubscript:",  v6)
    && !-[NSMutableDictionary objectForKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"),  "objectForKeyedSubscript:",  v5))
  {
    if (v6)
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101879AA8);
      }
      id v7 = (os_log_s *)qword_101934988;
      if (!os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT)) {
        return +[CLClientKeyPath nullClientKeyPath]( &OBJC_CLASS___CLClientKeyPath,  "nullClientKeyPath",  v13,  *(_OWORD *)v14,  *(void *)&v14[16]);
      }
      uint64_t v13 = 68289282LL;
      *(_WORD *)uint64_t v14 = 2082;
      *(void *)&v14[2] = "";
      *(_WORD *)&v14[10] = 2114;
      *(void *)&v14[12] = v3;
      unsigned int v8 = "{msg%{public}.0s:#Warning #ClientResolution the passed keyPath is an unregistered subIdentity. Resolvin"
           "g to #nullCKP, InputCKP:%{public, location:escape_only}@}";
      goto LABEL_9;
    }

    if (!-[NSMutableDictionary objectForKeyedSubscript:]( -[CLAuthorizationDatabase alternateIdentitiesMap](self, "alternateIdentitiesMap"),  "objectForKeyedSubscript:",  v5))
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101879AA8);
      }
      id v7 = (os_log_s *)qword_101934988;
      if (!os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT)) {
        return +[CLClientKeyPath nullClientKeyPath]( &OBJC_CLASS___CLClientKeyPath,  "nullClientKeyPath",  v13,  *(_OWORD *)v14,  *(void *)&v14[16]);
      }
      uint64_t v13 = 68289282LL;
      *(_WORD *)uint64_t v14 = 2082;
      *(void *)&v14[2] = "";
      *(_WORD *)&v14[10] = 2114;
      *(void *)&v14[12] = v3;
      unsigned int v8 = "{msg%{public}.0s:#Warning #ClientResolution the passed keyPath is not registered. Resolving to #nullCKP"
           ", InputCKP:%{public, location:escape_only}@}";
      goto LABEL_9;
    }

    unsigned int v11 = -[CLAuthorizationDatabase alternateIdentitiesMap](self, "alternateIdentitiesMap");
    goto LABEL_24;
  }

  id v10 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"),  "objectForKeyedSubscript:",  v6);
  unsigned int v11 = -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap");
  if (!v10)
  {
LABEL_24:
    id v12 = v5;
    return -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
  }

  id v12 = v6;
  return -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
}

- (BOOL)migrateDictionaryAtKeyPath:(id)a3 toKeyPath:(id)a4 forceMigrationOnAuthCollision:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  if (![a3 isValidCKP]
    || ![a4 isValidCKP]
    || [a3 subIdentityId]
    || [a4 subIdentityId])
  {
    goto LABEL_5;
  }

  id v12 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  [a3 clientKey]);
  if (v12)
  {
    id v13 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  [a4 clientKey]);
    if (![v13 objectForKeyedSubscript:@"Authorization"])
    {
LABEL_15:
      sub_100C52D64(v12, v13, (uint64_t)@"BundleId");
      sub_100C52D64(v12, v13, (uint64_t)@"BundlePath");
      sub_100C52D64(v12, v13, (uint64_t)@"Executable");
      sub_100C52D64(v12, v13, (uint64_t)@"PlatformSpecificBundleId");
      sub_100C52D64(v12, v13, (uint64_t)@"PluginBundleIds");
      sub_100C52D64(v12, v13, (uint64_t)@"IsAppClip");
      -[CLAuthorizationDatabase removeDictionaryAtKeyPath:](self, "removeDictionaryAtKeyPath:", a4);
      -[CLAuthorizationDatabase setupDictionary:atKeyPath:](self, "setupDictionary:atKeyPath:", v12, a4);
LABEL_17:
      -[CLAuthorizationDatabase removeDictionaryAtKeyPath:](self, "removeDictionaryAtKeyPath:", a3);
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101879AA8);
      }
      __int16 v15 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 68289538;
        int v22 = 0;
        __int16 v23 = 2082;
        unsigned int v24 = "";
        __int16 v25 = 2114;
        id v26 = a3;
        __int16 v27 = 2114;
        id v28 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Client migration successful, fromClient:%{public, location:escape_only}@, toCli ent:%{public, location:escape_only}@}",  (uint8_t *)&v21,  0x26u);
      }

      BOOL v10 = 1;
      goto LABEL_6;
    }

    if (v5)
    {
      if (qword_101934980 != -1) {
        dispatch_once(&qword_101934980, &stru_101879AA8);
      }
      uint64_t v14 = (os_log_s *)qword_101934988;
      if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 68290050;
        __int16 v23 = 2082;
        int v22 = 0;
        unsigned int v24 = "";
        __int16 v25 = 2114;
        id v26 = a4;
        __int16 v27 = 2114;
        id v28 = a3;
        __int16 v29 = 1026;
        unsigned int v30 = objc_msgSend( objc_msgSend(v12, "objectForKeyedSubscript:", @"Authorization"),  "intValue");
        __int16 v31 = 1026;
        unsigned int v32 = objc_msgSend( objc_msgSend(v13, "objectForKeyedSubscript:", @"Authorization"),  "intValue");
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#warning Migrating to client that already has auth. Mitigation requested - will keep th e authorization of the 'to' client, toClient:%{public, location:escape_only}@, fromClient:%{public, location:escape_only}@, RemovedAuth:%{public}d, KeptAuth:%{public}d}",  (uint8_t *)&v21,  0x32u);
      }

      objc_msgSend( v12,  "setObject:forKeyedSubscript:",  objc_msgSend(v13, "objectForKeyedSubscript:", @"Authorization"),  @"Authorization");
      goto LABEL_15;
    }

    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    uint64_t v16 = qword_101934988;
    BOOL v10 = 0;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 68289794;
      int v22 = 0;
      __int16 v23 = 2082;
      unsigned int v24 = "";
      __int16 v25 = 2114;
      id v26 = a3;
      __int16 v27 = 2114;
      id v28 = a4;
      __int16 v29 = 1026;
      unsigned int v30 = objc_msgSend( objc_msgSend(v13, "objectForKeyedSubscript:", @"Authorization"),  "intValue");
      id v17 = "{msg%{public}.0s:#warning Migrating to client that already has auth. Not migrating., fromClient:"
            "%{public, location:escape_only}@, toClient:%{public, location:escape_only}@, Auth:%{public}d}";
      uint32_t v18 = (os_log_s *)v16;
      uint32_t v19 = 44;
LABEL_30:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v21, v19);
LABEL_5:
      BOOL v10 = 0;
    }
  }

  else
  {
    if (v5) {
      goto LABEL_17;
    }
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    uint64_t v20 = qword_101934988;
    BOOL v10 = 0;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 68289538;
      int v22 = 0;
      __int16 v23 = 2082;
      unsigned int v24 = "";
      __int16 v25 = 2114;
      id v26 = a3;
      __int16 v27 = 2114;
      id v28 = a4;
      id v17 = "{msg%{public}.0s:fromClient not found, skipping migration, fromClient:%{public, location:escape_"
            "only}@, toClient:%{public, location:escape_only}@}";
      uint32_t v18 = (os_log_s *)v20;
      uint32_t v19 = 38;
      goto LABEL_30;
    }
  }

- (id)readonlyStoreAtKeyPath:(id)a3
{
  BOOL v5 = (NSMutableDictionary *)-[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  [a3 clientKey]);
  if (![a3 isAuthLimited]
    || !-[CLAuthorizationDatabase _isValidAuthLimitedKeyPath:](self, "_isValidAuthLimitedKeyPath:", a3))
  {
    if (!v5) {
      return +[CLKeyValueStore storeWithDictionary:]( &OBJC_CLASS___CLKeyValueStore,  "storeWithDictionary:",  qword_10199D300);
    }
    if ([a3 isAuthSharingSubIdentity])
    {
      id v20 = -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", @"AnchorKeyPath");
      BOOL v5 = +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v5);
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      int v21 = (void *)qword_10199D2F8;
      id v22 = [(id)qword_10199D2F8 countByEnumeratingWithState:&v26 objects:v38 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v27;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v27 != v24) {
              objc_enumerationMutation(v21);
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v20),  "objectForKeyedSubscript:",  *(void *)(*((void *)&v26 + 1) + 8 * (void)i)),  *(void *)(*((void *)&v26 + 1) + 8 * (void)i));
          }

          id v23 = [v21 countByEnumeratingWithState:&v26 objects:v38 count:16];
        }

        while (v23);
      }
    }

    return +[CLKeyValueStore storeWithDictionary:](&OBJC_CLASS___CLKeyValueStore, "storeWithDictionary:", v5);
  }

  id v6 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"),  "objectForKeyedSubscript:",  [a3 nestedBundlePath]);
  id v7 = [a3 limitingCKP];
  id result = 0LL;
  if (v6 && v7)
  {
    BOOL v5 = +[NSMutableDictionary dictionaryWithDictionary:]( NSMutableDictionary,  "dictionaryWithDictionary:",  -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  [v6 clientKey]));
    if ([v6 isAuthSharingSubIdentity])
    {
      id v9 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  objc_msgSend(v6, "clientKey")),  "objectForKeyedSubscript:",  @"AnchorKeyPath");
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      BOOL v10 = (void *)qword_10199D2F8;
      id v11 = [(id)qword_10199D2F8 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v35;
        do
        {
          for (j = 0LL; j != v12; j = (char *)j + 1)
          {
            if (*(void *)v35 != v13) {
              objc_enumerationMutation(v10);
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v9),  "objectForKeyedSubscript:",  *(void *)(*((void *)&v34 + 1) + 8 * (void)j)),  *(void *)(*((void *)&v34 + 1) + 8 * (void)j));
          }

          id v12 = [v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }

        while (v12);
      }
    }

    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int16 v15 = (void *)qword_10199D2F0;
    id v16 = [(id)qword_10199D2F0 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (k = 0LL; k != v17; k = (char *)k + 1)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v5,  "setObject:forKeyedSubscript:",  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  objc_msgSend(v7, "clientKey")),  "objectForKeyedSubscript:",  *(void *)(*((void *)&v30 + 1) + 8 * (void)k)),  *(void *)(*((void *)&v30 + 1) + 8 * (void)k));
        }

        id v17 = [v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }

      while (v17);
    }

    return +[CLKeyValueStore storeWithDictionary:](&OBJC_CLASS___CLKeyValueStore, "storeWithDictionary:", v5);
  }

  return result;
}

- (void)iterateAllAnchorKeyPathsWithBlock:(id)a3
{
  id v4 = -[NSMutableDictionary allKeys]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "allKeys");
  char v18 = 0;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        BOOL v10 = objc_autoreleasePoolPush();
        id v11 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v9);
        objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0
          && ![v11 objectForKeyedSubscript:@"AnchorKeyPath"]
          && ![v11 objectForKeyedSubscript:@"PrimaryKeyPath"]
          && ![v11 objectForKeyedSubscript:@"AuthLimitingKeyPath"])
        {
          (*((void (**)(id, CLClientKeyPath *, char *))a3 + 2))( a3,  +[CLClientKeyPath clientKeyPathWithClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithClientKey:",  v9),  &v18);
          if (v18)
          {
            objc_autoreleasePoolPop(v10);
            return;
          }
        }

        objc_autoreleasePoolPop(v10);
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (void)iterateIdentitiesRelatedToKeyPath:(id)a3 withBlock:(id)a4
{
  if ([a3 isAuthLimited])
  {
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    uint64_t v7 = (os_log_s *)qword_101934988;
    if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289282LL;
      __int16 v22 = 2082;
      id v23 = "";
      __int16 v24 = 2114;
      id v25 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Warning iterateIdentitiesRelatedToKeyPath passed auth limited keyPath, keyPath:%{p ublic, location:escape_only}@}",  (uint8_t *)&buf,  0x1Cu);
    }
  }

  else
  {
    id v8 = [a3 anchorKeyPath];
    if (-[CLAuthorizationDatabase dictionaryExistsAtKeyPath:](self, "dictionaryExistsAtKeyPath:", v8))
    {
      (*((void (**)(id, id))a4 + 2))(a4, v8);
      id v9 = -[CLAuthorizationDatabase arrayForKey:atKeyPath:defaultValue:]( self,  "arrayForKey:atKeyPath:defaultValue:",  @"SubIdentities",  v8,  0LL);
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          for (i = 0LL; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
            __int128 v15 = objc_autoreleasePoolPush();
            (*((void (**)(id, CLClientKeyPath *))a4 + 2))( a4,  +[CLClientKeyPath clientKeyPathWithClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithClientKey:",  v14));
            objc_autoreleasePoolPop(v15);
          }

          id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }

        while (v11);
      }
    }
  }

- (BOOL)hasValueForKey:(id)a3 atKeyPath:(id)a4
{
  return objc_msgSend( -[CLAuthorizationDatabase _dictionaryForKey:atKeyPath:](self, "_dictionaryForKey:atKeyPath:", a3, a4),  "objectForKeyedSubscript:",  a3) != 0;
}

- (BOOL)BOOLForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(BOOL)a5
{
  id v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  if ((objc_opt_respondsToSelector(v6, "BOOLValue") & 1) != 0) {
    return [v6 BOOLValue];
  }
  else {
    return a5;
  }
}

- (signed)shortForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(signed __int16)a5
{
  id v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  if ((objc_opt_respondsToSelector(v6, "shortValue") & 1) != 0) {
    return (unsigned __int16)[v6 shortValue];
  }
  else {
    return a5;
  }
}

- (int)intForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(int)a5
{
  id v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  else {
    return a5;
  }
}

- (int64_t)longForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(int64_t)a5
{
  id v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  if ((objc_opt_respondsToSelector(v6, "longValue") & 1) != 0) {
    return (int64_t)[v6 longValue];
  }
  else {
    return a5;
  }
}

- (float)floatForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(float)a5
{
  id v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  [v6 floatValue];
  return result;
}

- (double)doubleForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(double)a5
{
  id v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  [v6 doubleValue];
  return result;
}

- (id)stringForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5
{
  id v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    return +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v6);
  }
  if ((objc_opt_respondsToSelector(v6, "stringValue") & 1) != 0) {
    return [v6 stringValue];
  }
  return a5;
}

- (id)arrayForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5
{
  id v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    return v6;
  }
  else {
    return a5;
  }
}

- (id)dictionaryForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5
{
  id v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    return v6;
  }
  else {
    return a5;
  }
}

- (id)dataForKey:(id)a3 atKeyPath:(id)a4 defaultValue:(id)a5
{
  id v6 = -[CLAuthorizationDatabase _valueForKey:atKeyPath:](self, "_valueForKey:atKeyPath:", a3, a4);
  objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    return v6;
  }
  else {
    return a5;
  }
}

- (void)setBool:(BOOL)a3 forKey:(id)a4 atKeyPath:(id)a5
{
}

- (void)setShort:(signed __int16)a3 forKey:(id)a4 atKeyPath:(id)a5
{
}

- (void)setInt:(int)a3 forKey:(id)a4 atKeyPath:(id)a5
{
}

- (void)setLong:(int64_t)a3 forKey:(id)a4 atKeyPath:(id)a5
{
}

- (void)setFloat:(float)a3 forKey:(id)a4 atKeyPath:(id)a5
{
}

- (void)setDouble:(double)a3 forKey:(id)a4 atKeyPath:(id)a5
{
}

- (void)setString:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
}

- (void)setArray:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
}

- (void)setDictionary:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
}

- (void)setData:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
}

- (id)_valueForKey:(id)a3 atKeyPath:(id)a4
{
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v8 = -[CLAuthorizationDatabase _ckpToAccessGivenKey:andInputKeyPath:]( self,  "_ckpToAccessGivenKey:andInputKeyPath:",  a3,  a4);
  if ([v8 isValidCKP]) {
    id v9 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  [v8 clientKey]);
  }
  else {
    id v9 = (id)qword_10199D300;
  }
  id v10 = [v9 objectForKeyedSubscript:a3];

  return v10;
}

- (id)_dictionaryForKey:(id)a3 atKeyPath:(id)a4
{
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  id v8 = -[CLAuthorizationDatabase _ckpToAccessGivenKey:andInputKeyPath:]( self,  "_ckpToAccessGivenKey:andInputKeyPath:",  a3,  a4);
  if ([v8 isValidCKP]) {
    id v9 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  [v8 clientKey]);
  }
  else {
    id v9 = 0LL;
  }

  return v9;
}

- (void)_setValue:(id)a3 forKey:(id)a4 atKeyPath:(id)a5
{
  if (a3)
  {
    id v8 = -[CLAuthorizationDatabase _dictionaryForKey:atKeyPath:](self, "_dictionaryForKey:atKeyPath:", a4, a5);
    if (v8)
    {
      id v9 = v8;
      if ((objc_msgSend(a3, "isEqual:", objc_msgSend(v8, "objectForKeyedSubscript:", a4)) & 1) == 0)
      {
        [v9 setObject:a3 forKeyedSubscript:a4];
        -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
      }
    }
  }

- (void)removeValueForKey:(id)a3 atKeyPath:(id)a4
{
  id v6 = -[CLAuthorizationDatabase _dictionaryForKey:atKeyPath:](self, "_dictionaryForKey:atKeyPath:", a3, a4);
  if (v6)
  {
    [v6 removeObjectForKey:a3];
    -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
  }

- (id)getUsersODUUIDs
{
  return 0LL;
}

- (id)allUsers
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v4 = -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary");
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v19;
    *(void *)&__int128 v6 = 68289026LL;
    __int128 v17 = v6;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v9);
        id v11 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary", v17),  "objectForKeyedSubscript:",  v10);
        objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          uint64_t v13 = +[CLClientKeyPath clientKeyPathWithClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithClientKey:",  v10);
          if (-[CLClientKeyPath userName](v13, "userName"))
          {
          }

          else
          {
            if (qword_101934980 != -1) {
              dispatch_once(&qword_101934980, &stru_101879AA8);
            }
            uint64_t v14 = (os_log_s *)qword_101934988;
            if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t buf = v17;
              int v23 = 0;
              __int16 v24 = 2082;
              id v25 = "";
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "{msg%{public}.0s:#AuthorizationDatabase got a nil username while iterating through authorization d atabase, skipping}",  buf,  0x12u);
              if (qword_101934980 != -1) {
                dispatch_once(&qword_101934980, &stru_101879AA8);
              }
            }

            __int128 v15 = (os_log_s *)qword_101934988;
            if (os_signpost_enabled((os_log_t)qword_101934988))
            {
              *(_DWORD *)uint64_t buf = v17;
              int v23 = 0;
              __int16 v24 = 2082;
              id v25 = "";
              _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#AuthorizationDatabase got a nil username while iterating through authorization database, skipping",  "{msg%{public}.0s:#AuthorizationDatabase got a nil username while iterating through authorization d atabase, skipping}",  buf,  0x12u);
            }
          }
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v18,  v26,  16LL);
    }

    while (v7);
  }

  return v3;
}

- (void)removeUser:(id)a3
{
  if (_os_feature_enabled_impl("CoreLocation", "cl_pula"))
  {
    id v5 = -[NSMutableDictionary allKeys]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "allKeys");
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v29 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = *(void *)v18;
      *(void *)&__int128 v7 = 68289538LL;
      __int128 v16 = v7;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v10);
          id v12 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary", v16),  "objectForKeyedSubscript:",  v11);
          objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0
            && -[NSString isEqualToString:]( -[CLClientKeyPath userName]( +[CLClientKeyPath clientKeyPathWithClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithClientKey:",  v11),  "userName"),  "isEqualToString:",  a3))
          {
            if (qword_101934980 != -1) {
              dispatch_once(&qword_101934980, &stru_101879AA8);
            }
            uint64_t v14 = (os_log_s *)qword_101934988;
            if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v11);
              *(_DWORD *)uint64_t buf = v16;
              int v22 = 0;
              __int16 v23 = 2082;
              __int16 v24 = "";
              __int16 v25 = 2114;
              uint64_t v26 = v11;
              __int16 v27 = 2114;
              id v28 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#AuthorizationDatabaseDroppingData Removing dictionary for key, Key:%{publi c, location:escape_only}@, Dictionary:%{public, location:escape_only}@}",  buf,  0x26u);
            }

            -[NSMutableDictionary removeObjectForKey:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "removeObjectForKey:",  v11);
          }

          uint64_t v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v5 countByEnumeratingWithState:&v17 objects:v29 count:16];
      }

      while (v8);
    }

    -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
  }

- (BOOL)isBundlePathRegisteredSystemService:(id)a3
{
  return a3
      && -[NSMutableDictionary objectForKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"),  "objectForKeyedSubscript:",  a3) != 0LL;
}

- (BOOL)isKeyPathRegisteredSystemService:(id)a3
{
  id v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
  if (([a3 isValidCKP] & 1) != 0 && (id v6 = objc_msgSend(a3, "bundlePath")) != 0)
  {
    id v7 = [a3 subIdentityId];
    id v8 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"),  "objectForKeyedSubscript:",  v6);
    id v9 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"),  "objectForKeyedSubscript:",  v7);
    if (v7) {
      BOOL v10 = v9 == 0LL;
    }
    else {
      BOOL v10 = 0;
    }
    BOOL v12 = !v10 && v8 != 0LL;
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)performFullSystemServiceSetup
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101879AA8);
  }
  id v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#SetupSystemService #AuthorizationDatabase performing full setup of system services",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934980 != -1) {
      dispatch_once(&qword_101934980, &stru_101879AA8);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934988,  0LL,  "#SetupSystemService #AuthorizationDatabase performing full setup of system services",  v6,  2);
    id v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAuthorizationDatabase performFullSystemServiceSetup]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  -[CLAuthorizationDatabase _deriveAndCacheSystemServicesMap](self, "_deriveAndCacheSystemServicesMap");
  -[CLAuthorizationDatabase _setupSystemServiceDictionaries](self, "_setupSystemServiceDictionaries");
  -[CLAuthorizationDatabase _setUpDefaultDeniedSystemServices](self, "_setUpDefaultDeniedSystemServices");
}

- (void)_deriveAndCacheSystemServicesMap
{
}

- (void)_setUpDefaultDeniedSystemServices
{
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v3 = -[CLAuthorizationDatabase _getDefaultDeniedSystemServices](self, "_getDefaultDeniedSystemServices");
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v16;
    *(void *)&__int128 v5 = 68289282LL;
    __int128 v14 = v5;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v8);
        id v10 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap", v14),  "objectForKeyedSubscript:",  v9);
        if (v10)
        {
          id v11 = v10;
          if (!-[CLAuthorizationDatabase _valueForKey:atKeyPath:]( self,  "_valueForKey:atKeyPath:",  @"Authorization",  v10)) {
            -[CLAuthorizationDatabase setInt:forKey:atKeyPath:]( self,  "setInt:forKey:atKeyPath:",  1LL,  @"Authorization",  v11);
          }
        }

        else
        {
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_101879AA8);
          }
          BOOL v12 = (os_log_s *)qword_101934988;
          if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)uint64_t buf = v14;
            int v20 = 0;
            __int16 v21 = 2082;
            int v22 = "";
            __int16 v23 = 2114;
            uint64_t v24 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#AuthorizationDatabase #SystemServiceSetup default denied system service not in sys temServicesMap, BundlePath:%{public, location:escape_only}@}",  buf,  0x1Cu);
            if (qword_101934980 != -1) {
              dispatch_once(&qword_101934980, &stru_101879AA8);
            }
          }

          uint64_t v13 = (os_log_s *)qword_101934988;
          if (os_signpost_enabled((os_log_t)qword_101934988))
          {
            *(_DWORD *)uint64_t buf = v14;
            int v20 = 0;
            __int16 v21 = 2082;
            int v22 = "";
            __int16 v23 = 2114;
            uint64_t v24 = v9;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v13,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#AuthorizationDatabase #SystemServiceSetup default denied system service not in systemServicesMap",  "{msg%{public}.0s:#AuthorizationDatabase #SystemServiceSetup default denied system service not in sys temServicesMap, BundlePath:%{public, location:escape_only}@}",  buf,  0x1Cu);
          }
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }

    while (v6);
  }

- (void)_setupSystemServiceDictionaries
{
  id obj = -[NSMutableDictionary allKeys]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "allKeys");
  id v96 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v123 = 0u;
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  __int128 v126 = 0u;
  id v2 = [obj countByEnumeratingWithState:&v123 objects:v141 count:16];
  if (v2)
  {
    uint64_t v89 = *(void *)v124;
    do
    {
      id v3 = 0LL;
      do
      {
        if (*(void *)v124 != v89) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v123 + 1) + 8LL * (void)v3);
        __int128 v5 = objc_alloc_init(&OBJC_CLASS___NSAutoreleasePool);
        id v6 = +[CLClientKeyPath clientKeyPathWithClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithClientKey:",  v4);
        uint64_t v7 = -[CLClientKeyPath bundlePath](v6, "bundlePath");
        if (v7)
        {
          id v8 = -[CLClientKeyPath nestedBundlePath](v6, "nestedBundlePath");
          if (!v8)
          {
            -[CLAuthorizationDatabase migrationVersionNumber](self, "migrationVersionNumber");
            if (v9 >= (float)10)
            {
              id v8 = v7;
            }

            else
            {
              id v8 = v7;
              if (objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  -[CLClientKeyPath clientKey](v6, "clientKey")),  "objectForKeyedSubscript:",  @"SubIdentities"))
              {
                goto LABEL_27;
              }
            }
          }

          if (-[NSMutableDictionary objectForKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"),  "objectForKeyedSubscript:",  v8))
          {
            goto LABEL_22;
          }

          if (-[CLAuthorizationDatabase _valueForKey:atKeyPath:]( self,  "_valueForKey:atKeyPath:",  @"isSystemService",  v6))
          {
            if (-[CLAuthorizationDatabase _CLCommonIsBundleSystemService:](self, "_CLCommonIsBundleSystemService:", v8))
            {
              if (qword_101934980 != -1) {
                dispatch_once(&qword_101934980, &stru_101879AA8);
              }
              __int128 v16 = (os_log_s *)qword_101934988;
              if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)uint64_t buf = 68289282;
                int v132 = 0;
                __int16 v133 = 2082;
                v134 = "";
                __int16 v135 = 2114;
                v136 = (CLClientKeyPath *)v8;
                _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#SystemServiceSetup #AuthorizationDatabase has record of legitimate system serv ice not found in systemServicesMap, SystemService:%{public, location:escape_only}@}",  buf,  0x1Cu);
                if (qword_101934980 != -1) {
                  dispatch_once(&qword_101934980, &stru_101879AA8);
                }
              }

              __int128 v17 = (os_log_s *)qword_101934988;
              if (os_signpost_enabled((os_log_t)qword_101934988))
              {
                *(_DWORD *)uint64_t buf = 68289282;
                int v132 = 0;
                __int16 v133 = 2082;
                v134 = "";
                __int16 v135 = 2114;
                v136 = (CLClientKeyPath *)v8;
                _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v17,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#SystemServiceSetup #AuthorizationDatabase has record of legitimate system service not found in systemServicesMap",  "{msg%{public}.0s:#SystemServiceSetup #AuthorizationDatabase has record of legitimate system serv ice not found in systemServicesMap, SystemService:%{public, location:escape_only}@}",  buf,  0x1Cu);
              }

- (BOOL)_CLCommonIsBundleSystemService:(id)a3
{
  return sub_1002965E4((__CFString *)a3);
}

- (BOOL)_isBundlePathReachable:(id)a3
{
  return -[NSURL checkResourceIsReachableAndReturnError:]( +[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", a3, 1LL),  "checkResourceIsReachableAndReturnError:",  0LL);
}

- (void)_cacheSystemServicesMap
{
  id v3 = -[NSMutableDictionary allKeys]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "allKeys");
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v18;
    *(void *)&__int128 v5 = 68289282LL;
    __int128 v16 = v5;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v8);
        id v10 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary", v16),  "objectForKeyedSubscript:",  v9);
        objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          BOOL v12 = +[CLClientKeyPath clientKeyPathWithClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithClientKey:",  v9);
          if (-[CLAuthorizationDatabase BOOLForKey:atKeyPath:defaultValue:]( self,  "BOOLForKey:atKeyPath:defaultValue:",  @"isSystemService",  v12,  0LL))
          {
            id v13 = -[CLAuthorizationDatabase stringForKey:atKeyPath:defaultValue:]( self,  "stringForKey:atKeyPath:defaultValue:",  @"BundlePath",  v12,  0LL);
            if (v13)
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:]( -[CLAuthorizationDatabase systemServicesMap](self, "systemServicesMap"),  "setObject:forKeyedSubscript:",  v12,  v13);
            }

            else
            {
              if (qword_101934980 != -1) {
                dispatch_once(&qword_101934980, &stru_101879AA8);
              }
              id v14 = (os_log_s *)qword_101934988;
              if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)uint64_t buf = v16;
                int v22 = 0;
                __int16 v23 = 2082;
                id v24 = "";
                __int16 v25 = 2114;
                uint64_t v26 = v12;
                _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:#AuthorizationDatabase Clients known by anything other than bundle path CANNOT be cached as System Services! Removing isSystemService flag, Client:%{public, location:escape_only}@}",  buf,  0x1Cu);
                if (qword_101934980 != -1) {
                  dispatch_once(&qword_101934980, &stru_101879AA8);
                }
              }

              id v15 = (os_log_s *)qword_101934988;
              if (os_signpost_enabled((os_log_t)qword_101934988))
              {
                *(_DWORD *)uint64_t buf = v16;
                int v22 = 0;
                __int16 v23 = 2082;
                id v24 = "";
                __int16 v25 = 2114;
                uint64_t v26 = v12;
                _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "#AuthorizationDatabase Clients known by anything other than bundle path CANNOT be cached as System Ser vices! Removing isSystemService flag",  "{msg%{public}.0s:#AuthorizationDatabase Clients known by anything other than bundle path CANNOT be cached as System Services! Removing isSystemService flag, Client:%{public, location:escape_only}@}",  buf,  0x1Cu);
              }

              -[CLAuthorizationDatabase removeValueForKey:atKeyPath:]( self,  "removeValueForKey:atKeyPath:",  @"isSystemService",  v12);
            }
          }
        }

        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }

    while (v6);
  }

- (void)_cacheAlternativeIdentities
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = -[NSMutableDictionary allKeys]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "allKeys");
  id v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v24;
    __int128 v17 = @"PluginBundleIds";
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v6);
        id v8 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary", v17),  "objectForKeyedSubscript:",  v7);
        objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          id v10 = +[CLClientKeyPath clientKeyPathWithClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithClientKey:",  v7);
          uint64_t v11 = -[CLAuthorizationDatabase alternateIdentitiesMap](self, "alternateIdentitiesMap");
          id v12 = -[CLAuthorizationDatabase arrayForKey:atKeyPath:defaultValue:]( self,  "arrayForKey:atKeyPath:defaultValue:",  v17,  v10,  &__NSArray0__struct);
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v20;
            do
            {
              __int128 v16 = 0LL;
              do
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                -[NSMutableDictionary setObject:forKeyedSubscript:]( v11,  "setObject:forKeyedSubscript:",  v10,  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v16));
                __int128 v16 = (char *)v16 + 1;
              }

              while (v14 != v16);
              id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }

            while (v14);
          }
        }

        id v6 = (char *)v6 + 1;
      }

      while (v6 != v4);
      id v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v4);
  }

- (void)_internalMigrationLegacyKeys
{
  if (qword_101934980 != -1) {
    dispatch_once(&qword_101934980, &stru_101879AA8);
  }
  id v3 = (os_log_s *)qword_101934988;
  if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v42 = 2082;
    v43 = "";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:Starting #AuthDatabaseMigration_0}",  buf,  0x12u);
  }

  id v4 = -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary");
  id obj = -[NSMutableDictionary allKeys](v4, "allKeys");
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v5 = [obj countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v38;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)v7);
        objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
        {
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_101879AA8);
          }
          id v14 = (os_log_s *)qword_101934988;
          if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)uint64_t buf = 68289282;
            *(_DWORD *)&uint8_t buf[4] = 0;
            __int16 v42 = 2082;
            v43 = "";
            __int16 v44 = 2114;
            __int128 v45 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Top-level clients.plist key is not NSString. Removing key, key:%{public, loca tion:escape_only}@}",  buf,  0x1Cu);
            if (qword_101934980 != -1) {
              dispatch_once(&qword_101934980, &stru_101879AA8);
            }
          }

          uint64_t v15 = (os_log_s *)qword_101934988;
          if (os_signpost_enabled((os_log_t)qword_101934988))
          {
            *(_DWORD *)uint64_t buf = 68289282;
            *(_DWORD *)&uint8_t buf[4] = 0;
            __int16 v42 = 2082;
            v43 = "";
            __int16 v44 = 2114;
            __int128 v45 = v8;
            _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Top-level clients.plist key is not NSString. Removing key",  "{msg%{public}.0s:Top-level clients.plist key is not NSString. Removing key, key:%{public, loca tion:escape_only}@}",  buf,  0x1Cu);
          }

          goto LABEL_30;
        }

        if (sub_100297480(v8) || ([v8 isEqualToString:@"root"] & 1) != 0)
        {
LABEL_18:
          if (qword_101934980 != -1) {
            dispatch_once(&qword_101934980, &stru_101879AA8);
          }
          id v13 = (os_log_s *)qword_101934988;
          if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 68289282;
            *(_DWORD *)&uint8_t buf[4] = 0;
            __int16 v42 = 2082;
            v43 = "";
            __int16 v44 = 2114;
            __int128 v45 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#Warning Top-level clients.plist key is userified. Removing key, key:%{public , location:escape_only}@}",  buf,  0x1Cu);
          }

- (void)_internalMigrationClearUnknownKeys
{
  id v3 = -[NSMutableDictionary allKeys]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "allKeys");
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    __int128 v18 = @"SubIdentities";
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)v7);
        id v9 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary", v18),  "objectForKeyedSubscript:",  v8);
        objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          unsigned int v11 = +[CLClientKeyPath clientKeyPathWithClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithClientKey:",  v8);
          if (-[CLClientKeyPath isValidCKP](v11, "isValidCKP"))
          {
            if (!-[CLClientKeyPath isAuthLimited](v11, "isAuthLimited")) {
              goto LABEL_25;
            }
            if (qword_101934980 != -1) {
              dispatch_once(&qword_101934980, &stru_101879AA8);
            }
            unsigned int v12 = (os_log_s *)qword_101934988;
            if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
            {
              id v13 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v8);
              *(_DWORD *)uint64_t buf = 68289538;
              int v24 = 0;
              __int16 v25 = 2082;
              uint64_t v26 = "";
              __int16 v27 = 2114;
              uint64_t v28 = v8;
              __int16 v29 = 2114;
              id v30 = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#AuthDatabaseMigration found auth limited key. Removing from database, key: %{public, location:escape_only}@, value:%{public, location:escape_only}@}",  buf,  0x26u);
              if (qword_101934980 != -1) {
                dispatch_once(&qword_101934980, &stru_101879AA8);
              }
            }

            id v14 = (os_log_s *)qword_101934988;
            if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
            {
LABEL_23:
              id v17 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v8);
              *(_DWORD *)uint64_t buf = 68289538;
              int v24 = 0;
              __int16 v25 = 2082;
              uint64_t v26 = "";
              __int16 v27 = 2114;
              uint64_t v28 = v8;
              __int16 v29 = 2114;
              id v30 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#AuthorizationDatabaseDroppingData Removing dictionary for key, Key:%{publi c, location:escape_only}@, Dictionary:%{public, location:escape_only}@}",  buf,  0x26u);
            }
          }

          else
          {
            if (qword_101934980 != -1) {
              dispatch_once(&qword_101934980, &stru_101879AA8);
            }
            uint64_t v15 = (os_log_s *)qword_101934988;
            if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT))
            {
              id v16 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v8);
              *(_DWORD *)uint64_t buf = 68289538;
              int v24 = 0;
              __int16 v25 = 2082;
              uint64_t v26 = "";
              __int16 v27 = 2114;
              uint64_t v28 = v8;
              __int16 v29 = 2114;
              id v30 = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "{msg%{public}.0s:#AuthDatabaseMigration found key without anchor. Removing from database, key :%{public, location:escape_only}@, value:%{public, location:escape_only}@}",  buf,  0x26u);
            }

            objc_msgSend( objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v8),  "objectForKeyedSubscript:",  @"AnchorKeyPath")),  "objectForKeyedSubscript:",  v18),  "removeObject:",  v8);
            if (qword_101934980 != -1) {
              dispatch_once(&qword_101934980, &stru_101879AA8);
            }
            id v14 = (os_log_s *)qword_101934988;
            if (os_log_type_enabled((os_log_t)qword_101934988, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_23;
            }
          }

          -[NSMutableDictionary removeObjectForKey:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "removeObjectForKey:",  v8);
          -[CLPersistentDictionary markModifiedDirty](self, "markModifiedDirty");
        }

- (void)_internalMigrationRegisterAllClients
{
  id v3 = -[NSMutableDictionary allKeys]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "allKeys");
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v7);
        id v9 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v8);
        objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0
          && !objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v8),  "objectForKeyedSubscript:",  @"isSystemService"))
        {
          unsigned int v11 = +[CLClientKeyPath clientKeyPathWithClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithClientKey:",  v8);
          if (!-[CLClientKeyPath subIdentityId](v11, "subIdentityId")
            && (objc_msgSend( -[CLAuthorizationDatabase registerClient:fromAuthSync:]( self,  "registerClient:fromAuthSync:",  v11,  0),  "isValidCKP") & 1) == 0)
          {
            -[CLAuthorizationDatabase removeDictionaryAtKeyPath:](self, "removeDictionaryAtKeyPath:", v11);
          }
        }

        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v5);
  }

- (id)getStateSummary
{
  id v13 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id obj = -[NSMutableDictionary allKeys]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "allKeys");
  id v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v8 = -[NSMutableDictionary objectForKeyedSubscript:]( -[CLPersistentDictionary underlyingDictionary](self, "underlyingDictionary"),  "objectForKeyedSubscript:",  v7);
        objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          uint64_t v10 = +[CLClientKeyPath clientKeyPathWithClientKey:]( &OBJC_CLASS___CLClientKeyPath,  "clientKeyPathWithClientKey:",  v7);
          id v11 =  objc_msgSend( objc_msgSend( -[CLAuthorizationDatabase readonlyStoreAtKeyPath:](self, "readonlyStoreAtKeyPath:", v10),  "dictionary"),  "mutableCopy");
          if (![v11 objectForKeyedSubscript:@"IsAppClip"]) {
            [v11 setObject:&__kCFBooleanFalse forKeyedSubscript:@"IsAppClip"];
          }
          if (![v11 objectForKeyedSubscript:@"isSystemService"]) {
            [v11 setObject:&__kCFBooleanFalse forKeyedSubscript:@"isSystemService"];
          }
          if (![v11 objectForKeyedSubscript:@"isHarvestableSystemService"]) {
            [v11 setObject:&__kCFBooleanFalse forKeyedSubscript:@"isHarvestableSystemService"];
          }
          if (![v11 objectForKeyedSubscript:@"SuppressShowingInSettings"]) {
            [v11 setObject:&__kCFBooleanFalse forKeyedSubscript:@"SuppressShowingInSettings"];
          }
          if (![v11 objectForKeyedSubscript:@"Authorization"]) {
            [v11 setObject:&off_1018D43A0 forKeyedSubscript:@"Authorization"];
          }
          if (![v11 objectForKeyedSubscript:@"CorrectiveCompensationEnabled"]) {
            [v11 setObject:&off_1018D4340 forKeyedSubscript:@"CorrectiveCompensationEnabled"];
          }
          if (![v11 objectForKeyedSubscript:@"IncidentalUseMode"]) {
            [v11 setObject:&off_1018D43B8 forKeyedSubscript:@"IncidentalUseMode"];
          }
          if (![v11 objectForKeyedSubscript:@"LocationButtonUseMode"]) {
            [v11 setObject:&off_1018D4340 forKeyedSubscript:@"LocationButtonUseMode"];
          }
          if (![v11 objectForKeyedSubscript:@"InUseLevel"]) {
            [v11 setObject:&off_1018D4340 forKeyedSubscript:@"InUseLevel"];
          }
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, -[CLClientKeyPath clientKey](v10, "clientKey"));
        }
      }

      id v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v4);
  }

  return v13;
}

- (NSMutableDictionary)systemServicesMap
{
  return self->_systemServicesMap;
}

- (void)setSystemServicesMap:(id)a3
{
}

- (NSMutableDictionary)alternateIdentitiesMap
{
  return self->_alternateIdentitiesMap;
}

- (void)setAlternateIdentitiesMap:(id)a3
{
}

@end