@interface MLRPluginSchedulingRecord
- (BOOL)commitWithError:(id *)a3;
- (MLRPluginSchedulingRecord)initWithPluginID:(id)a3;
- (NSDate)lastCompletionDate;
- (NSString)recordID;
- (id)description;
- (unint64_t)periodInSeconds;
- (void)setLastCompletionDate:(id)a3;
- (void)setPeriodInSeconds:(unint64_t)a3;
@end

@implementation MLRPluginSchedulingRecord

- (MLRPluginSchedulingRecord)initWithPluginID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___MLRPluginSchedulingRecord;
    v6 = -[MLRPluginSchedulingRecord init](&v15, "init");
    if (v6)
    {
      v7 = -[DESUserDefaultsStoreRecord initWithRecordID:]( objc_alloc(&OBJC_CLASS___DESUserDefaultsStoreRecord),  "initWithRecordID:",  v5);
      storeRecord = v6->_storeRecord;
      v6->_storeRecord = v7;

      objc_storeStrong((id *)&v6->_recordID, a3);
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[DESUserDefaultsStoreRecord lastCompletionDate](v6->_storeRecord, "lastCompletionDate"));
      lastCompletionDate = v6->_lastCompletionDate;
      v6->_lastCompletionDate = (NSDate *)v9;

      v6->_periodInSeconds = kDESDodMLPolicy_DefaultPeriod;
      if (allowCustomWakeUpPeriod())
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[DESUserDefaultsStoreRecord periodInSeconds](v6->_storeRecord, "periodInSeconds"));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[DESUserDefaultsStoreRecord periodInSeconds](v6->_storeRecord, "periodInSeconds"));
          v6->_periodInSeconds = (unint64_t)[v12 unsignedIntegerValue];
        }
      }
    }

    self = v6;
    v13 = self;
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(%@, %@, %lu)",  v5,  self->_recordID,  self->_lastCompletionDate,  self->_periodInSeconds));

  return v6;
}

- (BOOL)commitWithError:(id *)a3
{
  if (allowCustomWakeUpPeriod( -[DESUserDefaultsStoreRecord setLastCompletionDate:]( self->_storeRecord,  "setLastCompletionDate:",  self->_lastCompletionDate)))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DESUserDefaultsStoreRecord periodInSeconds](self->_storeRecord, "periodInSeconds"));
    if (v4) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = self->_periodInSeconds != kDESDodMLPolicy_DefaultPeriod;
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DESUserDefaultsStoreRecord periodInSeconds](self->_storeRecord, "periodInSeconds"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DESUserDefaultsStoreRecord periodInSeconds](self->_storeRecord, "periodInSeconds"));
      BOOL v8 = [v7 unsignedIntegerValue] != (id)self->_periodInSeconds;
    }

    else
    {
      BOOL v8 = 0;
    }

    if (v5 || v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  self->_periodInSeconds));
      -[DESUserDefaultsStoreRecord setPeriodInSeconds:](self->_storeRecord, "setPeriodInSeconds:", v9);
    }
  }

  return 1;
}

- (NSDate)lastCompletionDate
{
  return self->_lastCompletionDate;
}

- (void)setLastCompletionDate:(id)a3
{
}

- (NSString)recordID
{
  return self->_recordID;
}

- (unint64_t)periodInSeconds
{
  return self->_periodInSeconds;
}

- (void)setPeriodInSeconds:(unint64_t)a3
{
  self->_periodInSeconds = a3;
}

- (void).cxx_destruct
{
}

@end