@interface CPLStoreMigrationAssistant_107137447
- (BOOL)performMigrationWithError:(id *)a3;
- (CPLEngineStore)store;
- (CPLStoreMigrationAssistant_107137447)initWithStore:(id)a3;
- (NSString)migrationDescription;
@end

@implementation CPLStoreMigrationAssistant_107137447

- (CPLStoreMigrationAssistant_107137447)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CPLStoreMigrationAssistant_107137447;
  v6 = -[CPLStoreMigrationAssistant_107137447 init](&v9, "init");
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
  if (!v7) {
    goto LABEL_17;
  }
  uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 sharingScopeForScope:v7]);
  if (!v8) {
    goto LABEL_17;
  }
  objc_super v9 = (void *)v8;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v5 initialSyncAnchorForScope:v7]);
  if (!v10)
  {

LABEL_17:
    id v24 = 0LL;
    unsigned __int8 v25 = 1;
    goto LABEL_18;
  }

  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v5 platformObject]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 creationDateForScope:v7]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v12 creationDateForScope:v9]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v15 doubleForKey:@"CPLRewindForSparseRecordsInterval"];
  double v17 = v16;

  v34 = v14;
  if (!v13 || !v14) {
    goto LABEL_12;
  }
  if (v17 <= 0.0) {
    double v17 = 86400.0;
  }
  [v14 timeIntervalSinceDate:v13];
  if (v18 < 0.0) {
    double v18 = -v18;
  }
  if (v18 >= v17)
  {
    id v24 = 0LL;
    unsigned __int8 v25 = 1;
  }

  else
  {
LABEL_12:
    v33 = v13;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 scopeChangeForScope:v7]);
    if (v19 && (uint64_t v20 = objc_opt_class(&OBJC_CLASS___CPLLibraryScopeChange), (objc_opt_isKindOfClass(v19, v20) & 1) != 0))
    {
      v32 = v12;
      v21 = (void *)objc_claimAutoreleasedReturnValue([v19 rewindAnchorsPerSharingScopes]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v22]);

      if (v23)
      {
        id v24 = 0LL;
        unsigned __int8 v25 = 1;
      }

      else
      {
        if (!_CPLSilentLogging)
        {
          id v27 = sub_100172E1C();
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "User has a Sharing scope likely present during initial download but Primary Scope does not know when it wa s created. Triggering an anchor reset sync",  buf,  2u);
          }
        }

        [v6 recordUpgradeEvent:@"Triggering anchor reset sync for shared library user to account for missing rewind anchors"];
        id v36 = 0LL;
        unsigned int v29 = [v5 resetSyncAnchorForScope:v7 error:&v36];
        id v30 = v36;
        id v24 = v30;
        if (v29)
        {
          id v35 = v30;
          unsigned __int8 v25 = [v5 setInitialSyncAnchor:0 forScope:v7 error:&v35];
          id v31 = v35;

          id v24 = v31;
        }

        else
        {
          unsigned __int8 v25 = 0;
        }
      }

      v12 = v32;
    }

    else
    {
      id v24 = 0LL;
      unsigned __int8 v25 = 1;
    }

    v13 = v33;
  }

  if (a3 && (v25 & 1) == 0)
  {
    id v24 = v24;
    unsigned __int8 v25 = 0;
    *a3 = v24;
  }

- (NSString)migrationDescription
{
  return (NSString *)@"Migration-107137447";
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

@end