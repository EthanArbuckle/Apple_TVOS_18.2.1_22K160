@interface DMUserVolumeMigrationTask
+ (id)createTaskIfAppropriateWithEnvironment:(id)a3;
+ (void)_migrateSharedAndPrimaryUserVolumeWithUserManager:(id)a3;
- (NSString)name;
- (NSString)telemetryIdentifier;
- (double)estimatedDurationTimeInterval;
- (id)workBlock;
- (void)setEstimatedDurationTimeInterval:(double)a3;
- (void)setName:(id)a3;
- (void)setTelemetryIdentifier:(id)a3;
- (void)setWorkBlock:(id)a3;
@end

@implementation DMUserVolumeMigrationTask

+ (id)createTaskIfAppropriateWithEnvironment:(id)a3
{
  id v3 = a3;
  if ([v3 deviceModeIsSharediPad]
    && ![v3 userSessionIsLoginWindow])
  {
    v4 = 0LL;
  }

  else
  {
    v4 = objc_alloc_init(&OBJC_CLASS___DMUserVolumeMigrationTask);
    -[DMUserVolumeMigrationTask setName:](v4, "setName:", @"User volume migration");
    -[DMUserVolumeMigrationTask setEstimatedDurationTimeInterval:](v4, "setEstimatedDurationTimeInterval:", 10.0);
    -[DMUserVolumeMigrationTask setTelemetryIdentifier:]( v4,  "setTelemetryIdentifier:",  @"com.apple.datamigrator.UserVolumeMigration");
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10000CBF8;
    v6[3] = &unk_100020AE0;
    id v7 = v3;
    -[DMUserVolumeMigrationTask setWorkBlock:](v4, "setWorkBlock:", v6);
  }

  return v4;
}

+ (void)_migrateSharedAndPrimaryUserVolumeWithUserManager:(id)a3
{
  id v4 = a3;
  _DMLogFunc(v3, 6LL);
  id v10 = 0LL;
  unsigned __int8 v5 = [v4 migrateSharedAndPrimaryUserVolumeWithError:&v10];
  id v6 = v10;
  id v7 = v6;
  if ((v5 & 1) != 0)
  {
    id v8 = v6;
  }

  else
  {
    do
    {
      _DMLogFunc(v3, 3LL);
      _DMLogFunc(v3, 6LL);
      id v10 = v7;
      unsigned int v9 = objc_msgSend(v4, "migrateSharedAndPrimaryUserVolumeWithError:", &v10, v7);
      id v8 = v10;

      id v7 = v8;
    }

    while (!v9);
  }

  _DMLogFunc(v3, 6LL);
}

- (id)workBlock
{
  return objc_getProperty(self, a2, 8LL, 1);
}

- (void)setWorkBlock:(id)a3
{
}

- (double)estimatedDurationTimeInterval
{
  return self->_estimatedDurationTimeInterval;
}

- (void)setEstimatedDurationTimeInterval:(double)a3
{
  self->_estimatedDurationTimeInterval = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)telemetryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setTelemetryIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end