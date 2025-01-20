@interface DABackupRestoreLogLine
- (BOOL)didSucceed;
- (NSString)eventSubType;
- (int64_t)backupCode;
- (int64_t)backupRestoreEventType;
@end

@implementation DABackupRestoreLogLine

- (NSString)eventSubType
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreLogLine fields](self, "fields"));
  id v4 = [v3 count];

  if ((unint64_t)v4 < 3)
  {
    v6 = 0LL;
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreLogLine fields](self, "fields"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:2]);
  }

  return (NSString *)v6;
}

- (int64_t)backupCode
{
  return (int)-[DABackupRestoreLogLine integerFromFieldAtIndex:](self, "integerFromFieldAtIndex:", 3LL);
}

- (BOOL)didSucceed
{
  return -[DABackupRestoreLogLine backupCode](self, "backupCode") == 0;
}

- (int64_t)backupRestoreEventType
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreLogLine eventSubType](self, "eventSubType"));
  if ([v3 isEqualToString:@"iCloudBackup"])
  {

    return 1000LL;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreLogLine eventSubType](self, "eventSubType"));
  unsigned int v5 = [v4 isEqualToString:@"iTunesBackup"];

  if (v5) {
    return 1000LL;
  }
  return 1001LL;
}

@end