@interface DABackupRestoreEvent
- (BOOL)successfulBackup;
- (DABackupRestoreEvent)initWithDate:(id)a3 eventSubType:(id)a4 successfulBackup:(BOOL)a5 eventCode:(int64_t)a6;
- (NSDate)date;
- (NSString)engine;
- (id)dictionary;
- (int64_t)backupRestoreEventCode;
- (void)setBackupRestoreEventCode:(int64_t)a3;
- (void)setDate:(id)a3;
- (void)setEngine:(id)a3;
- (void)setSuccessfulBackup:(BOOL)a3;
@end

@implementation DABackupRestoreEvent

- (DABackupRestoreEvent)initWithDate:(id)a3 eventSubType:(id)a4 successfulBackup:(BOOL)a5 eventCode:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___DABackupRestoreEvent;
  v13 = -[DABackupRestoreEvent init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_date, a3);
    v14->_backupRestoreEventCode = a6;
    v14->_successfulBackup = a5;
    if (([v12 isEqualToString:@"iTunesBackup"] & 1) != 0
      || [v12 isEqualToString:@"iTunesRestore"])
    {
      engine = v14->_engine;
      v16 = @"iTunes";
LABEL_8:
      v14->_engine = &v16->isa;

      goto LABEL_9;
    }

    if (([v12 isEqualToString:@"iCloudBackup"] & 1) != 0
      || [v12 isEqualToString:@"iCloudRestore"])
    {
      engine = v14->_engine;
      v16 = @"iCloud";
      goto LABEL_8;
    }
  }

- (id)dictionary
{
  v17[0] = @"date";
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](&OBJC_CLASS___DSDateFormatter, "sharedFormatter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 formatterWithType:0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreEvent date](self, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 stringFromDate:v5]);
  id v7 = stringOrNull(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v18[0] = v8;
  v17[1] = @"engine";
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreEvent engine](self, "engine"));
  id v10 = stringOrNull(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v18[1] = v11;
  v17[2] = @"code";
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[DABackupRestoreEvent backupRestoreEventCode](self, "backupRestoreEventCode")));
  id v13 = numberOrNull(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v18[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));

  return v15;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (int64_t)backupRestoreEventCode
{
  return self->_backupRestoreEventCode;
}

- (void)setBackupRestoreEventCode:(int64_t)a3
{
  self->_backupRestoreEventCode = a3;
}

- (BOOL)successfulBackup
{
  return self->_successfulBackup;
}

- (void)setSuccessfulBackup:(BOOL)a3
{
  self->_successfulBackup = a3;
}

- (void).cxx_destruct
{
}

@end