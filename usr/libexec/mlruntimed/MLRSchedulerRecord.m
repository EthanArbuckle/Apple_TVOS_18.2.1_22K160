@interface MLRSchedulerRecord
- (MLRSchedulerRecord)init;
- (id)description;
- (id)fetchAllPluginIDs;
- (int64_t)wakeUpPeriodInSeconds;
- (void)updateWakeUpPeriodInSeconds;
@end

@implementation MLRSchedulerRecord

- (MLRSchedulerRecord)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MLRSchedulerRecord;
  v2 = -[MLRSchedulerRecord init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_wakeUpPeriodInSeconds = 86400LL;
    if (allowCustomWakeUpPeriod(v2))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue( +[DESUserDefaultsStoreRecord schedulerWakeupPeriodInSeconds]( &OBJC_CLASS___DESUserDefaultsStoreRecord,  "schedulerWakeupPeriodInSeconds"));
      v5 = v4;
      if (v4) {
        v3->_wakeUpPeriodInSeconds = (uint64_t)fmax( (double)(unint64_t)[v4 unsignedIntegerValue],  1800.0);
      }
    }
  }

  return v3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(%lu)",  v5,  self->_wakeUpPeriodInSeconds));

  return v6;
}

- (id)fetchAllPluginIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DESBundleRegistry sharedInstance](&OBJC_CLASS___DESBundleRegistry, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allUnrestrictedBundleIds]);

  return v3;
}

- (void)updateWakeUpPeriodInSeconds
{
  if (allowCustomWakeUpPeriod(self))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MLRSchedulerRecord fetchAllPluginIDs](self, "fetchAllPluginIDs"));
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      id v5 = v4;
      unint64_t v6 = 0LL;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v3);
          }
          v9 = -[MLRPluginSchedulingRecord initWithPluginID:]( objc_alloc(&OBJC_CLASS___MLRPluginSchedulingRecord),  "initWithPluginID:",  *(void *)(*((void *)&v13 + 1) + 8LL * (void)i));
          unint64_t v6 = binaryGCD( v6,  (unint64_t)fmax( (double)-[MLRPluginSchedulingRecord periodInSeconds](v9, "periodInSeconds")
                                   / 1800.0,
                                     1.0));
        }

        id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v5);
      unint64_t v10 = (unint64_t)((double)v6 * 1800.0);
      if (v10) {
        BOOL v11 = v10 == 86400;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:"));
        +[DESUserDefaultsStoreRecord setSchedulerWakeupPeriodInSeconds:]( &OBJC_CLASS___DESUserDefaultsStoreRecord,  "setSchedulerWakeupPeriodInSeconds:",  v12);
      }
    }
  }

- (int64_t)wakeUpPeriodInSeconds
{
  return self->_wakeUpPeriodInSeconds;
}

@end