@interface PersistentStore
- (BOOL)_loadStoreCoordinatorWithIntegrityCheck:(BOOL)a3 error:(id *)a4;
- (BOOL)loadStoreCoordinatorWithOptions:(id)a3 error:(id *)a4;
- (BOOL)performLightweightMigration:(id *)a3;
- (BOOL)resetStore:(id *)a3;
- (NSURL)databaseFileURL;
- (NSURL)modelFileURL;
- (PersistentStore)init;
- (PersistentStore)initWithConfiguration:(id)a3 error:(id *)a4;
- (PersistentStoreConfiguration)configuration;
- (id)_baseFilePath;
- (id)_newLegacyManagedObjectModel;
- (id)beginThreadContextSession;
- (id)managedObjectModel;
- (void)checkIntegrityWithInitializationBlock:(id)a3;
- (void)dealloc;
- (void)endThreadContextSession;
@end

@implementation PersistentStore

- (PersistentStore)init
{
  return -[PersistentStore initWithConfiguration:error:](self, "initWithConfiguration:error:", 0LL, 0LL);
}

- (PersistentStore)initWithConfiguration:(id)a3 error:(id *)a4
{
  if (!a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"PersistentStore.m",  35LL,  @"Must provide a configuration");
  }
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PersistentStore;
  v7 = -[PersistentStore init](&v10, "init");
  if (v7)
  {
    v7->_configuration = (PersistentStoreConfiguration *)[a3 copy];
    if (-[PersistentStore _loadStoreCoordinatorWithIntegrityCheck:error:]( v7,  "_loadStoreCoordinatorWithIntegrityCheck:error:",  0LL,  a4))
    {
      id v8 = (id)-[PersistentStoreConfiguration storeType](v7->_configuration, "storeType");
      v7->_threadContextKey = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"itunesstored.store-context.%d",  v8);
      v7->_threadCountKey = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"itunesstored.store-count.%d",  v8);
    }

    else
    {

      return 0LL;
    }
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PersistentStore;
  -[PersistentStore dealloc](&v3, "dealloc");
}

- (id)beginThreadContextSession
{
  objc_super v3 = -[NSThread threadDictionary]( +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  "threadDictionary");
  v4 = (NSManagedObjectContext *)-[NSMutableDictionary objectForKey:](v3, "objectForKey:", self->_threadContextKey);
  if (!v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___NSManagedObjectContext);
    v6 = -[NSManagedObjectContext initWithConcurrencyType:]( v5,  "initWithConcurrencyType:",  _NSBackgroundThreadConfinementConcurrencyType);
    v4 = v6;
    if (!v6) {
      return v4;
    }
    -[NSManagedObjectContext setPersistentStoreCoordinator:]( v6,  "setPersistentStoreCoordinator:",  self->_storeCoordinator);
    -[NSManagedObjectContext setUndoManager:](v4, "setUndoManager:", 0LL);
    -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v4, self->_threadContextKey);
  }

  id v7 = -[NSMutableDictionary objectForKey:](v3, "objectForKey:", self->_threadCountKey);
  id v8 = objc_alloc(&OBJC_CLASS___NSNumber);
  if (v7) {
    uint64_t v9 = (uint64_t)[v7 integerValue] + 1;
  }
  else {
    uint64_t v9 = 1LL;
  }
  objc_super v10 = -[NSNumber initWithInteger:](v8, "initWithInteger:", v9);
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v10, self->_threadCountKey);

  return v4;
}

- (void)checkIntegrityWithInitializationBlock:(id)a3
{
  id v5 = objc_msgSend( -[PersistentStore _baseFilePath](self, "_baseFilePath"),  "stringByAppendingPathComponent:",  -[PersistentStoreConfiguration integrityCookieFileName](self->_configuration, "integrityCookieFileName"));
  if (v5)
  {
    id v6 = v5;
    id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    objc_super v10 = (os_log_s *)[v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v25 = 138412546;
      uint64_t v26 = objc_opt_class(self);
      __int16 v27 = 2112;
      id v28 = v6;
      uint64_t v11 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  1LL,  "%@: Checking integrity with cookie: %@",  &v25,  22);
      if (v11)
      {
        v12 = (void *)v11;
        v13 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
        free(v12);
        v23 = v13;
        SSFileLog(v7, @"%@");
      }
    }

    v14 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    if (-[NSFileManager fileExistsAtPath:](v14, "fileExistsAtPath:", v6))
    {
      id v15 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v15) {
        id v15 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v16 = objc_msgSend(v15, "shouldLog", v23);
      else {
        LODWORD(v17) = v16;
      }
      v18 = (os_log_s *)[v15 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v17 = v17;
      }
      else {
        v17 &= 2u;
      }
      if ((_DWORD)v17)
      {
        uint64_t v19 = objc_opt_class(self);
        int v25 = 138412290;
        uint64_t v26 = v19;
        LODWORD(v24) = 12;
        uint64_t v20 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &_mh_execute_header,  v18,  0LL,  "%@: Found integrity cookie, reloading store coordinator",  &v25,  v24);
        if (v20)
        {
          v21 = (void *)v20;
          v22 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v20, 4LL);
          free(v21);
          v23 = v22;
          SSFileLog(v15, @"%@");
        }
      }

      self->_storeCoordinator = 0LL;
      -[PersistentStore _loadStoreCoordinatorWithIntegrityCheck:error:]( self,  "_loadStoreCoordinatorWithIntegrityCheck:error:",  1LL,  0LL);
    }

    -[NSFileManager createFileAtPath:contents:attributes:]( v14,  "createFileAtPath:contents:attributes:",  v6,  0LL,  0LL,  v23);
    (*((void (**)(id))a3 + 2))(a3);
    -[NSFileManager removeItemAtPath:error:](v14, "removeItemAtPath:error:", v6, 0LL);
  }

- (PersistentStoreConfiguration)configuration
{
  return (PersistentStoreConfiguration *)-[PersistentStoreConfiguration copy](self->_configuration, "copy");
}

- (NSURL)databaseFileURL
{
  result = (NSURL *)objc_msgSend( -[PersistentStore _baseFilePath](self, "_baseFilePath"),  "stringByAppendingPathComponent:",  -[PersistentStoreConfiguration databaseFileName](self->_configuration, "databaseFileName"));
  if (result) {
    return +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", result);
  }
  return result;
}

- (void)endThreadContextSession
{
  objc_super v3 = -[NSThread threadDictionary]( +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  "threadDictionary");
  uint64_t v4 = (uint64_t)objc_msgSend( -[NSMutableDictionary objectForKey:](v3, "objectForKey:", self->_threadCountKey),  "integerValue");
  if (v4 >= 1)
  {
    if (v4 == 1)
    {
      -[NSMutableDictionary removeObjectForKey:](v3, "removeObjectForKey:", self->_threadCountKey);
      -[NSMutableDictionary removeObjectForKey:](v3, "removeObjectForKey:", self->_threadContextKey);
    }

    else
    {
      id v5 = -[NSNumber initWithInteger:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInteger:", v4 - 1);
      -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v5, self->_threadCountKey);
    }
  }

- (NSURL)modelFileURL
{
  result = (NSURL *)objc_msgSend( objc_msgSend( -[NSArray objectAtIndex:]( -[NSProcessInfo arguments]( +[NSProcessInfo processInfo](NSProcessInfo, "processInfo"),  "arguments"),  "objectAtIndex:",  0),  "stringByDeletingLastPathComponent"),  "stringByAppendingPathComponent:",  -[PersistentStoreConfiguration modelFileName](self->_configuration, "modelFileName"));
  if (result) {
    return +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", result);
  }
  return result;
}

- (BOOL)performLightweightMigration:(id *)a3
{
  v43 = 0LL;
  id v5 = -[PersistentStore managedObjectModel](self, "managedObjectModel");
  id v6 = -[PersistentStore _newLegacyManagedObjectModel](self, "_newLegacyManagedObjectModel");
  if (!v6)
  {
    id v22 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v22) {
      id v22 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v23 = [v22 shouldLog];
    else {
      LODWORD(v24) = v23;
    }
    int v25 = (os_log_s *)[v22 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v24 = v24;
    }
    else {
      v24 &= 2u;
    }
    if ((_DWORD)v24)
    {
      int v44 = 138412290;
      uint64_t v45 = objc_opt_class(self);
      uint64_t v26 = _os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "%@: Could not load old model for migration",  &v44,  12);
LABEL_36:
      v21 = (void *)v26;
      if (!v26) {
        goto LABEL_61;
      }
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v26, 4LL);
      free(v21);
      SSFileLog(v22, @"%@");
    }

- (BOOL)resetStore:(id *)a3
{
  unsigned int v27 = 0LL;
  id v5 = -[PersistentStore databaseFileURL](self, "databaseFileURL");
  id v6 = v5;
  if (self->_storeCoordinator)
  {
    id v7 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    objc_super v10 = (os_log_s *)[v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if ((_DWORD)v9)
    {
      int v28 = 138412546;
      uint64_t v29 = objc_opt_class(self);
      __int16 v30 = 2112;
      p_isa = (NSString *)&v6->super.isa;
      uint64_t v11 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &_mh_execute_header,  v10,  0LL,  "%@: Destroy persistent store: %@",  &v28,  22);
      if (v11)
      {
        id v12 = (void *)v11;
        uint64_t v13 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v11, 4LL);
        free(v12);
        uint64_t v26 = v13;
        SSFileLog(v7, @"%@");
      }
    }

    unsigned __int8 v14 = -[NSPersistentStoreCoordinator destroyPersistentStoreAtURL:withType:options:error:]( self->_storeCoordinator,  "destroyPersistentStoreAtURL:withType:options:error:",  v6,  NSSQLiteStoreType,  0LL,  &v27,  v26);
    if (a3) {
LABEL_14:
    }
      *a3 = v27;
  }

  else
  {
    uint64_t v16 = -[NSURL path](v5, "path");
    uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
    v18 = -[NSString stringByAppendingPathExtension:](v16, "stringByAppendingPathExtension:", @"bad");
    id v19 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v19) {
      id v19 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v20 = [v19 shouldLog];
    else {
      LODWORD(v21) = v20;
    }
    id v22 = (os_log_s *)[v19 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v21 = v21;
    }
    else {
      v21 &= 2u;
    }
    if ((_DWORD)v21)
    {
      int v28 = 138412802;
      uint64_t v29 = objc_opt_class(self);
      __int16 v30 = 2112;
      p_isa = v16;
      __int16 v32 = 2112;
      v33 = v18;
      uint64_t v23 = _os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &_mh_execute_header,  v22,  0LL,  "%@: Moving %@ to %@",  &v28,  32);
      if (v23)
      {
        uint64_t v24 = (void *)v23;
        int v25 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v23, 4LL);
        free(v24);
        uint64_t v26 = v25;
        SSFileLog(v19, @"%@");
      }
    }

    -[NSFileManager removeItemAtPath:error:](v17, "removeItemAtPath:error:", v18, 0LL, v26);
    unsigned __int8 v14 = -[NSFileManager moveItemAtPath:toPath:error:](v17, "moveItemAtPath:toPath:error:", v16, v18, &v27);

    if (a3) {
      goto LABEL_14;
    }
  }

  return v14;
}

- (BOOL)loadStoreCoordinatorWithOptions:(id)a3 error:(id *)a4
{
  v52 = 0LL;
  id v7 = -[PersistentStore managedObjectModel](self, "managedObjectModel");
  if (!v7)
  {
    id v22 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v22) {
      id v22 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v23 = [v22 shouldLog];
    else {
      LODWORD(v24) = v23;
    }
    int v25 = (os_log_s *)[v22 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v24 = v24;
    }
    else {
      v24 &= 2u;
    }
    if (!(_DWORD)v24) {
      goto LABEL_44;
    }
    int v55 = 138412290;
    uint64_t v56 = objc_opt_class(self);
    uint64_t v26 = _os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &_mh_execute_header,  v25,  0LL,  "%@: Could not load model",  &v55,  12);
    if (!v26) {
      goto LABEL_44;
    }
    unsigned int v27 = (void *)v26;
    +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v26, 4LL);
    free(v27);
    id v28 = v22;
LABEL_43:
    SSFileLog(v28, @"%@");
LABEL_44:
    if (a4) {
      *a4 = v52;
    }
    return self->_storeCoordinator != 0LL;
  }

  id v8 = v7;
  uint64_t v9 = -[PersistentStore databaseFileURL](self, "databaseFileURL");
  unsigned __int8 v10 = +[NSFileManager ensureDirectoryExists:]( &OBJC_CLASS___NSFileManager,  "ensureDirectoryExists:",  -[NSString stringByDeletingLastPathComponent]( -[NSURL path](v9, "path"),  "stringByDeletingLastPathComponent"));
  id v11 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
  id v12 = v11;
  if ((v10 & 1) == 0)
  {
    if (!v11) {
      id v12 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v29 = [v12 shouldLog];
    else {
      LODWORD(v30) = v29;
    }
    id v31 = (os_log_s *)[v12 OSLogObject];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v30 = v30;
    }
    else {
      v30 &= 2u;
    }
    if (!(_DWORD)v30) {
      goto LABEL_44;
    }
    int v55 = 138412546;
    uint64_t v56 = objc_opt_class(self);
    __int16 v57 = 2112;
    v58 = v9;
    uint64_t v32 = _os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &_mh_execute_header,  v31,  0LL,  "%@: Could not create directory for file: %@",  &v55,  22);
    if (!v32) {
      goto LABEL_44;
    }
    v33 = (void *)v32;
    +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v32, 4LL);
    free(v33);
    id v28 = v12;
    goto LABEL_43;
  }

  if (!v11) {
    id v12 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
  }
  unsigned int v13 = [v12 shouldLog];
  else {
    LODWORD(v14) = v13;
  }
  uint64_t v15 = (os_log_s *)[v12 OSLogObject];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
    uint64_t v14 = v14;
  }
  else {
    v14 &= 2u;
  }
  if ((_DWORD)v14)
  {
    int v55 = 138412546;
    uint64_t v56 = objc_opt_class(self);
    __int16 v57 = 2112;
    v58 = v9;
    uint64_t v16 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  1LL,  "%@: Loading persistent store: %@",  &v55,  22);
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v16, 4LL);
      free(v17);
      SSFileLog(v12, @"%@");
    }
  }

  v18 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]( objc_alloc(&OBJC_CLASS___NSPersistentStoreCoordinator),  "initWithManagedObjectModel:",  v8);
  id v19 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  NSFileProtectionCompleteUntilFirstUserAuthentication,  NSPersistentStoreFileProtectionKey,  0LL);
  unsigned int v20 = v19;
  if (a3) {
    -[NSMutableDictionary addEntriesFromDictionary:](v19, "addEntriesFromDictionary:", a3);
  }
  id v21 = objc_msgSend( -[NSMutableDictionary objectForKeyedSubscript:]( v20,  "objectForKeyedSubscript:",  NSPersistentStoreFileProtectionKey),  "isEqualToString:",  NSFileProtectionNone);
  if ((v21 & 1) != 0 || MKBDeviceUnlockedSinceBoot(v21))
  {
    if (-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]( v18,  "addPersistentStoreWithType:configuration:URL:options:error:",  NSSQLiteStoreType,  0LL,  v9,  v20,  &v52))
    {
      goto LABEL_19;
    }

    id v35 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v35) {
      id v35 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v36 = [v35 shouldLog];
    else {
      LODWORD(v37) = v36;
    }
    uint64_t v38 = (os_log_s *)[v35 OSLogObject];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
      uint64_t v37 = v37;
    }
    else {
      v37 &= 2u;
    }
    if ((_DWORD)v37)
    {
      uint64_t v39 = objc_opt_class(self);
      int v55 = 138412290;
      uint64_t v56 = v39;
      LODWORD(v51) = 12;
      uint64_t v40 = _os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &_mh_execute_header,  v38,  1LL,  "%@: Detected incompatible model, attempting migration",  &v55,  v51);
      if (v40)
      {
        uint64_t v41 = (void *)v40;
        v42 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v40, 4LL);
        free(v41);
        v50 = v42;
        SSFileLog(v35, @"%@");
      }
    }

    if (-[PersistentStore performLightweightMigration:](self, "performLightweightMigration:", &v52, v50)
      && -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]( v18,  "addPersistentStoreWithType:configuration:URL:options:error:",  NSSQLiteStoreType,  0LL,  v9,  0LL,  &v52))
    {
LABEL_19:

      self->_storeCoordinator = v18;
    }

    else
    {
LABEL_62:
      id v43 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v43) {
        id v43 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v44 = [v43 shouldLog];
      else {
        LODWORD(v45) = v44;
      }
      __int16 v46 = (os_log_s *)[v43 OSLogObject];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v45 = v45;
      }
      else {
        v45 &= 2u;
      }
      if ((_DWORD)v45)
      {
        uint64_t v47 = objc_opt_class(self);
        int v55 = 138412546;
        uint64_t v56 = v47;
        __int16 v57 = 2112;
        v58 = v52;
        LODWORD(v51) = 22;
        uint64_t v48 = _os_log_send_and_compose_impl( v45,  0LL,  0LL,  0LL,  &_mh_execute_header,  v46,  0LL,  "%@: Could not add persistent store: %@",  &v55,  v51);
        if (v48)
        {
          v49 = (void *)v48;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v48, 4LL);
          free(v49);
          SSFileLog(v43, @"%@");
        }
      }
    }

    goto LABEL_44;
  }

  if (a4)
  {
    v53 = NSSQLiteErrorDomain;
    v54 = &off_10036D710;
    *a4 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  256LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
  }

  return 0;
}

- (id)managedObjectModel
{
  if (!self->_model)
  {
    id v3 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
    }
    unsigned int v4 = [v3 shouldLog];
    else {
      LODWORD(v5) = v4;
    }
    id v6 = (os_log_s *)[v3 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      uint64_t v5 = v5;
    }
    else {
      v5 &= 2u;
    }
    if ((_DWORD)v5)
    {
      int v22 = 138412546;
      uint64_t v23 = objc_opt_class(self);
      __int16 v24 = 2112;
      int v25 = -[PersistentStore modelFileURL](self, "modelFileURL");
      uint64_t v7 = _os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "%@: Loading model: %@",  &v22,  22);
      if (v7)
      {
        id v8 = (void *)v7;
        uint64_t v9 = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v7, 4LL);
        free(v8);
        unsigned int v20 = v9;
        SSFileLog(v3, @"%@");
      }
    }

    unsigned __int8 v10 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  -[PersistentStore modelFileURL](self, "modelFileURL"));
    self->_model = v10;
    if (!v10)
    {
      id v12 = +[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig");
      if (!v12) {
        id v12 = +[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig");
      }
      unsigned int v13 = objc_msgSend(v12, "shouldLog", v20);
      else {
        LODWORD(v14) = v13;
      }
      uint64_t v15 = (os_log_s *)[v12 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v14 = v14;
      }
      else {
        v14 &= 2u;
      }
      if ((_DWORD)v14)
      {
        uint64_t v16 = objc_opt_class(self);
        uint64_t v17 = -[PersistentStore modelFileURL](self, "modelFileURL");
        int v22 = 138412546;
        uint64_t v23 = v16;
        __int16 v24 = 2112;
        int v25 = v17;
        LODWORD(v21) = 22;
        uint64_t v18 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  0LL,  "%@: Could not load model: %@",  &v22,  v21);
        if (v18)
        {
          id v19 = (void *)v18;
          +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v18, 4LL);
          free(v19);
          SSFileLog(v12, @"%@");
        }
      }
    }
  }

  return self->_model;
}

- (id)_baseFilePath
{
  return objc_msgSend( objc_msgSend((id)CPSharedResourcesDirectory(self), "stringByAppendingPathComponent:", @"Library"),  "stringByAppendingPathComponent:",  @"com.apple.itunesstored");
}

- (BOOL)_loadStoreCoordinatorWithIntegrityCheck:(BOOL)a3 error:(id *)a4
{
  id v6 = 0LL;
  id v10 = 0LL;
  if (a3)
  {
    uint64_t v7 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  +[NSNull null](&OBJC_CLASS___NSNull, "null"),  @"integrity_check",  0LL);
    id v6 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  v7,  NSSQLitePragmasOption,  0LL);
  }

  if (-[PersistentStore loadStoreCoordinatorWithOptions:error:]( self,  "loadStoreCoordinatorWithOptions:error:",  v6,  &v10))
  {
    BOOL v8 = 1;
  }

  else if (ISErrorIsEqual(v10, NSCocoaErrorDomain, 256LL) {
         && objc_msgSend( objc_msgSend(objc_msgSend(v10, "userInfo"), "objectForKeyedSubscript:", NSSQLiteErrorDomain),  "intValue") == 23)
  }
  {
    BOOL v8 = 0;
  }

  else
  {
    -[PersistentStore resetStore:](self, "resetStore:", 0LL);
    BOOL v8 = -[PersistentStore loadStoreCoordinatorWithOptions:error:]( self,  "loadStoreCoordinatorWithOptions:error:",  v6,  &v10);
  }

  if (a4) {
    *a4 = v10;
  }
  return v8;
}

- (id)_newLegacyManagedObjectModel
{
  id v3 = -[NSDictionary objectForKey:]( +[NSPersistentStoreCoordinator metadataForPersistentStoreOfType:URL:options:error:]( &OBJC_CLASS___NSPersistentStoreCoordinator,  "metadataForPersistentStoreOfType:URL:options:error:",  NSSQLiteStoreType,  -[PersistentStore databaseFileURL](self, "databaseFileURL"),  0LL,  0LL),  "objectForKey:",  @"NSStoreModelVersionHashes");
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = -[PersistentStoreConfiguration legacyModelVersionIdentifiers]( self->_configuration,  "legacyModelVersionIdentifiers");
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  -[NSURL URLByAppendingPathExtension:]( -[NSURL URLByAppendingPathComponent:]( -[PersistentStore modelFileURL](self, "modelFileURL"),  "URLByAppendingPathComponent:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)v9)),  "URLByAppendingPathExtension:",  @"mom"));
          if (-[NSDictionary isEqualToDictionary:]( -[NSManagedObjectModel entityVersionHashesByName](v10, "entityVersionHashesByName"),  "isEqualToDictionary:",  v4))
          {
            id v11 = v10;

            if (v11) {
              return v11;
            }
          }

          else
          {
          }

          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
      }

      while (v7);
    }
  }

  return 0LL;
}

@end