@interface DMMigrationWatchdog
- (DMMigrationWatchdog)initWithMigrationPluginDescription:(id)a3 userDataDisposition:(id)a4 migrationStartTime:(double)a5;
- (DMTimer)timer;
- (unint64_t)nextSecondsBeforeNextStackshotAdditionForUnitTesting;
- (unint64_t)secondsBeforeNextStackshot;
- (unint64_t)stackshotTimerLeewaySeconds;
- (void)_takeStackshot;
- (void)cancel;
- (void)resume;
- (void)setNextSecondsBeforeNextStackshotAdditionForUnitTesting:(unint64_t)a3;
- (void)setSecondsBeforeNextStackshot:(unint64_t)a3;
- (void)setStackshotTimerLeewaySeconds:(unint64_t)a3;
- (void)setTimer:(id)a3;
@end

@implementation DMMigrationWatchdog

- (DMMigrationWatchdog)initWithMigrationPluginDescription:(id)a3 userDataDisposition:(id)a4 migrationStartTime:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DMMigrationWatchdog;
  v10 = -[DMMigrationWatchdog init](&v14, "init");
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    migrationPluginDescription = v10->_migrationPluginDescription;
    v10->_migrationPluginDescription = v11;

    objc_storeStrong((id *)&v10->_userDataDisposition, a4);
    v10->_migrationStartTime = a5;
    -[DMMigrationWatchdog setSecondsBeforeNextStackshot:](v10, "setSecondsBeforeNextStackshot:", 120LL);
    v10->_minutesSinceStarting = 0LL;
    -[DMMigrationWatchdog setNextSecondsBeforeNextStackshotAdditionForUnitTesting:]( v10,  "setNextSecondsBeforeNextStackshotAdditionForUnitTesting:",  0LL);
    -[DMMigrationWatchdog setStackshotTimerLeewaySeconds:](v10, "setStackshotTimerLeewaySeconds:", 10LL);
  }

  return v10;
}

- (void)resume
{
  if (objc_claimAutoreleasedReturnValue(-[DMMigrationWatchdog timer](self, "timer"))) {
    sub_100012BDC();
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000397C;
  v5[3] = &unk_1000206B8;
  v5[4] = self;
  v3 = -[DMTimer initWithSecondsBeforeFirstFire:secondsOfLeeway:fireBlock:]( objc_alloc(&OBJC_CLASS___DMTimer),  "initWithSecondsBeforeFirstFire:secondsOfLeeway:fireBlock:",  -[DMMigrationWatchdog secondsBeforeNextStackshot](self, "secondsBeforeNextStackshot"),  -[DMMigrationWatchdog stackshotTimerLeewaySeconds](self, "stackshotTimerLeewaySeconds"),  v5);
  -[DMMigrationWatchdog setTimer:](self, "setTimer:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMMigrationWatchdog timer](self, "timer"));
  [v4 resume];
}

- (void)cancel
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[DMMigrationWatchdog timer](self, "timer"));
  [v2 cancel];
}

- (void)_takeStackshot
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"PRECAUTIONARY stackshot - migration might be hung or deadlocked. Plugin: %@ (%llu minutes) (overall migration start %llu)",  self->_migrationPluginDescription,  self->_minutesSinceStarting,  (unint64_t)self->_migrationStartTime));
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[DMIncident incidentWithKind:responsiblePluginRep:userDataDisposition:details:]( &OBJC_CLASS___DMIncident,  "incidentWithKind:responsiblePluginRep:userDataDisposition:details:",  0LL,  0LL,  self->_userDataDisposition,  v6));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DMDiagnostics sharedInstance](&OBJC_CLASS___DMDiagnostics, "sharedInstance"));
  [v5 captureDiagnosticsForIncident:v4 async:1];
}

- (DMTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (unint64_t)secondsBeforeNextStackshot
{
  return self->_secondsBeforeNextStackshot;
}

- (void)setSecondsBeforeNextStackshot:(unint64_t)a3
{
  self->_secondsBeforeNextStackshot = a3;
}

- (unint64_t)nextSecondsBeforeNextStackshotAdditionForUnitTesting
{
  return self->_nextSecondsBeforeNextStackshotAdditionForUnitTesting;
}

- (void)setNextSecondsBeforeNextStackshotAdditionForUnitTesting:(unint64_t)a3
{
  self->_nextSecondsBeforeNextStackshotAdditionForUnitTesting = a3;
}

- (unint64_t)stackshotTimerLeewaySeconds
{
  return self->_stackshotTimerLeewaySeconds;
}

- (void)setStackshotTimerLeewaySeconds:(unint64_t)a3
{
  self->_stackshotTimerLeewaySeconds = a3;
}

- (void).cxx_destruct
{
}

@end