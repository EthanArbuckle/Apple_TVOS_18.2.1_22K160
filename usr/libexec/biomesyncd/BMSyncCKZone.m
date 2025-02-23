@interface BMSyncCKZone
- (BMSyncCKZone)initWithFMResultSet:(id)a3;
- (NSDate)attemptedRecoveryDate;
- (NSString)zoneName;
- (NSString)zoneUUID;
- (int)recoveryState;
@end

@implementation BMSyncCKZone

- (BMSyncCKZone)initWithFMResultSet:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___BMSyncCKZone;
  v5 = -[BMSyncCKZone init](&v13, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 stringForColumn:@"zone_name"]);
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue([v4 stringForColumn:@"zone_uuid"]);
    zoneUUID = v5->_zoneUUID;
    v5->_zoneUUID = (NSString *)v8;

    v5->_recoveryState = [v4 intForColumn:@"recovery_state"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v4 dateForColumn:@"attempted_recovery_date"]);
    attemptedRecoveryDate = v5->_attemptedRecoveryDate;
    v5->_attemptedRecoveryDate = (NSDate *)v10;
  }

  return v5;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)zoneUUID
{
  return self->_zoneUUID;
}

- (int)recoveryState
{
  return self->_recoveryState;
}

- (NSDate)attemptedRecoveryDate
{
  return self->_attemptedRecoveryDate;
}

- (void).cxx_destruct
{
}

@end