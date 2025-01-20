@interface DataMigrationPlugin
+ (double)_minimumCalculatedTimeIntervalBeforeReboot;
+ (double)_minimumTimeIntervalBetweenWatchdogAndReboot;
- (BOOL)didRun;
- (BOOL)existsAndShouldRun;
- (BOOL)isConcurrent;
- (BOOL)isUserAgnostic;
- (BOOL)success;
- (DMPluginFileSystemRep)rep;
- (DataMigrationPlugin)initWithIdentifier:(id)a3 fileSystemRep:(id)a4 isUserAgnostic:(BOOL)a5;
- (NSString)identifier;
- (NSString)identifierOfDependency;
- (NSString)name;
- (double)appropriateTimeIntervalBeforeReboot;
- (double)pidReceiptTimeout;
- (double)runDuration;
- (double)timeIntervalBeforeReboot;
- (double)timeIntervalBeforeWatchdog;
- (float)timeEstimate;
- (id)_performOneMigrationWithParameters:(id)a3 watchdogCoordinator:(id)a4 needsRetry:(BOOL *)a5;
- (id)description;
- (id)performMigrationWithParameters:(id)a3 watchdogCoordinator:(id)a4 countOfAttempts:(unint64_t *)a5;
- (void)setIdentifierOfDependency:(id)a3;
- (void)setPidReceiptTimeout:(double)a3;
- (void)setTimeEstimate:(float)a3;
- (void)setTimeIntervalBeforeReboot:(double)a3;
- (void)setTimeIntervalBeforeWatchdog:(double)a3;
@end

@implementation DataMigrationPlugin

- (DataMigrationPlugin)initWithIdentifier:(id)a3 fileSystemRep:(id)a4 isUserAgnostic:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DataMigrationPlugin;
  v11 = -[DataMigrationPlugin init](&v17, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_rep, a4);
    rep = v12->_rep;
    if (rep)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[DMPluginFileSystemRep name](rep, "name"));
      name = v12->_name;
      v12->_name = (NSString *)v14;
    }

    else
    {
      name = v12->_name;
      v12->_name = (NSString *)@"<absent plugin>";
    }

    v12->_isUserAgnostic = a5;
    v12->_pidReceiptTimeout = 5.0;
  }

  return v12;
}

- (BOOL)existsAndShouldRun
{
  return self->_rep != 0LL;
}

- (double)appropriateTimeIntervalBeforeReboot
{
  if (v3 == 0.0)
  {
    -[DataMigrationPlugin timeIntervalBeforeWatchdog](self, "timeIntervalBeforeWatchdog");
    double v5 = 0.0;
    if (v6 <= 0.0) {
      return v5;
    }
    -[DataMigrationPlugin timeIntervalBeforeWatchdog](self, "timeIntervalBeforeWatchdog");
    double v8 = v7;
    +[DataMigrationPlugin _minimumTimeIntervalBetweenWatchdogAndReboot]( &OBJC_CLASS___DataMigrationPlugin,  "_minimumTimeIntervalBetweenWatchdogAndReboot");
    double v5 = v8 + v9;
    +[DataMigrationPlugin _minimumCalculatedTimeIntervalBeforeReboot]( &OBJC_CLASS___DataMigrationPlugin,  "_minimumCalculatedTimeIntervalBeforeReboot");
    if (v10 <= v5) {
      return v5;
    }
    else {
      +[DataMigrationPlugin _minimumCalculatedTimeIntervalBeforeReboot]( &OBJC_CLASS___DataMigrationPlugin,  "_minimumCalculatedTimeIntervalBeforeReboot");
    }
  }

  else
  {
    -[DataMigrationPlugin timeIntervalBeforeReboot](self, "timeIntervalBeforeReboot");
  }

  return result;
}

+ (double)_minimumCalculatedTimeIntervalBeforeReboot
{
  return 600.0;
}

+ (double)_minimumTimeIntervalBetweenWatchdogAndReboot
{
  return 60.0;
}

- (BOOL)isConcurrent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DataMigrationPlugin identifierOfDependency](self, "identifierOfDependency"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (id)description
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (-[NSString length](self->_name, "length")) {
    -[NSMutableArray addObject:](v3, "addObject:", self->_name);
  }
  if (-[DataMigrationPlugin isUserAgnostic](self, "isUserAgnostic")) {
    -[NSMutableArray addObject:](v3, "addObject:", @"user-agnostic");
  }
  if (-[DataMigrationPlugin isConcurrent](self, "isConcurrent"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataMigrationPlugin identifierOfDependency](self, "identifierOfDependency"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"concurrent after %@",  v4));
    -[NSMutableArray addObject:](v3, "addObject:", v5);
  }

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @", "));
  if ([v6 length])
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @" (%@)", v6));

    double v6 = (void *)v7;
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataMigrationPlugin identifier](self, "identifier"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v8, v6));

  return v9;
}

- (id)performMigrationWithParameters:(id)a3 watchdogCoordinator:(id)a4 countOfAttempts:(unint64_t *)a5
{
  id v9 = a3;
  id v10 = a4;
  *a5 = 1LL;
  char v22 = 0;
  uint64_t v11 = objc_claimAutoreleasedReturnValue( -[DataMigrationPlugin _performOneMigrationWithParameters:watchdogCoordinator:needsRetry:]( self,  "_performOneMigrationWithParameters:watchdogCoordinator:needsRetry:",  v9,  v10,  &v22));
  v12 = (void *)v11;
  if (v22) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    int v14 = 4;
    while (--v14 > 1)
    {
      _DMLogFunc(v5, 3LL);
      ++*a5;
      char v22 = 0;
      uint64_t v15 = objc_claimAutoreleasedReturnValue( -[DataMigrationPlugin _performOneMigrationWithParameters:watchdogCoordinator:needsRetry:]( self,  "_performOneMigrationWithParameters:watchdogCoordinator:needsRetry:",  v9,  v10,  &v22,  self));
      if (v22) {
        BOOL v16 = v15 == 0;
      }
      else {
        BOOL v16 = 0;
      }
      if (!v16)
      {
        v12 = (void *)v15;
        goto LABEL_14;
      }
    }

    rep = self->_rep;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v9 dispositionSupersetOfContext]);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ — Crashed",  self));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[DMIncident incidentWithKind:responsiblePluginRep:userDataDisposition:details:]( &OBJC_CLASS___DMIncident,  "incidentWithKind:responsiblePluginRep:userDataDisposition:details:",  2LL,  rep,  v18,  v19));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[DMDiagnostics sharedInstance](&OBJC_CLASS___DMDiagnostics, "sharedInstance"));
    [v20 captureDiagnosticsForIncident:v12 async:1];
  }

- (id)_performOneMigrationWithParameters:(id)a3 watchdogCoordinator:(id)a4 needsRetry:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  v30[0] = 0LL;
  v30[1] = v30;
  v30[2] = 0x2020000000LL;
  int v31 = 0;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_100012160;
  v28 = sub_100012170;
  id v29 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[DMEnvironment sharedInstance](&OBJC_CLASS___DMEnvironment, "sharedInstance"));
  uint64_t v11 = 0LL;
  if ([v10 shouldWatchdogPluginsAfterTimeout])
  {
    -[DataMigrationPlugin timeIntervalBeforeWatchdog](self, "timeIntervalBeforeWatchdog");
    uint64_t v11 = v12;
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100012178;
  v17[3] = &unk_100020E88;
  uint64_t v22 = v11;
  v20 = v30;
  v17[4] = self;
  v21 = &v24;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  v23 = a5;
  [v14 callRunEventBlock:v17 forPlugin:self];
  id v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v30, 8);

  return v15;
}

- (BOOL)isUserAgnostic
{
  return self->_isUserAgnostic;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (DMPluginFileSystemRep)rep
{
  return self->_rep;
}

- (float)timeEstimate
{
  return self->_timeEstimate;
}

- (void)setTimeEstimate:(float)a3
{
  self->_timeEstimate = a3;
}

- (double)timeIntervalBeforeWatchdog
{
  return self->_timeIntervalBeforeWatchdog;
}

- (void)setTimeIntervalBeforeWatchdog:(double)a3
{
  self->_timeIntervalBeforeWatchdog = a3;
}

- (double)timeIntervalBeforeReboot
{
  return self->_timeIntervalBeforeReboot;
}

- (void)setTimeIntervalBeforeReboot:(double)a3
{
  self->_timeIntervalBeforeReboot = a3;
}

- (NSString)identifierOfDependency
{
  return self->_identifierOfDependency;
}

- (void)setIdentifierOfDependency:(id)a3
{
}

- (BOOL)didRun
{
  return self->_didRun;
}

- (BOOL)success
{
  return self->_success;
}

- (double)runDuration
{
  return self->_runDuration;
}

- (double)pidReceiptTimeout
{
  return self->_pidReceiptTimeout;
}

- (void)setPidReceiptTimeout:(double)a3
{
  self->_pidReceiptTimeout = a3;
}

- (void).cxx_destruct
{
}

@end