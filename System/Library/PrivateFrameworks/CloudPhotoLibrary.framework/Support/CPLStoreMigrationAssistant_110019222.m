@interface CPLStoreMigrationAssistant_110019222
- (BOOL)performMigrationWithError:(id *)a3;
- (CPLEngineStore)store;
- (CPLStoreMigrationAssistant_110019222)initWithStore:(id)a3;
- (NSString)migrationDescription;
@end

@implementation CPLStoreMigrationAssistant_110019222

- (CPLStoreMigrationAssistant_110019222)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CPLStoreMigrationAssistant_110019222;
  v6 = -[CPLStoreMigrationAssistant_110019222 init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (BOOL)performMigrationWithError:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineStore scopes](self->_store, "scopes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineStore platformObject](self->_store, "platformObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 primaryScope]);
  if (v7
    && ([v5 valueForFlag:16 forScope:v7] & 1) == 0
    && (uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 sharingScopeForScope:v7])) != 0)
  {
    objc_super v9 = (void *)v8;
    if (!_CPLSilentLogging)
    {
      if (qword_1002A3B88 != -1) {
        dispatch_once(&qword_1002A3B88, &stru_100247C08);
      }
      v10 = (os_log_s *)qword_1002A3B90;
      if (os_log_type_enabled((os_log_t)qword_1002A3B90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Resetting sync anchors for all users of shared library",  buf,  2u);
      }
    }

    [v6 recordUpgradeEvent:@"Resetting sync anchor for shared library user"];
    store = self->_store;
    id v15 = 0LL;
    unsigned __int8 v12 = -[CPLEngineStore resetSyncAnchorWithCause:error:]( store,  "resetSyncAnchorWithCause:error:",  @"upgrading shared library user",  &v15);
    id v13 = v15;

    if (a3 && (v12 & 1) == 0)
    {
      id v13 = v13;
      unsigned __int8 v12 = 0;
      *a3 = v13;
    }
  }

  else
  {
    id v13 = 0LL;
    unsigned __int8 v12 = 1;
  }

  return v12;
}

- (NSString)migrationDescription
{
  return (NSString *)@"Migration-110019222";
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

@end