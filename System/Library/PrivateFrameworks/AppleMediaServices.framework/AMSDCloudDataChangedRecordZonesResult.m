@interface AMSDCloudDataChangedRecordZonesResult
- (AMSDCloudDataChangeToken)changeToken;
- (AMSDCloudDataChangedRecordZonesResult)initWithChangedRecordZones:(id)a3 deletedRecordZones:(id)a4 changeToken:(id)a5;
- (NSArray)changedRecordZones;
- (NSArray)deletedRecordZones;
- (NSString)hashedDescription;
@end

@implementation AMSDCloudDataChangedRecordZonesResult

- (AMSDCloudDataChangedRecordZonesResult)initWithChangedRecordZones:(id)a3 deletedRecordZones:(id)a4 changeToken:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AMSDCloudDataChangedRecordZonesResult;
  v12 = -[AMSDCloudDataChangedRecordZonesResult init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_changedRecordZones, a3);
    objc_storeStrong((id *)&v13->_changeToken, a5);
    objc_storeStrong((id *)&v13->_deletedRecordZones, a4);
  }

  return v13;
}

- (NSString)hashedDescription
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p> {",  objc_opt_class(self, a2),  self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCloudDataChangedRecordZonesResult changedRecordZones](self, "changedRecordZones"));
  uint64_t v6 = AMSHashIfNeeded(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 appendFormat:@"  changedRecordZones = %@,\n", v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCloudDataChangedRecordZonesResult deletedRecordZones](self, "deletedRecordZones"));
  uint64_t v9 = AMSHashIfNeeded(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v4 appendFormat:@"  deletedRecordZones = %@,\n", v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCloudDataChangedRecordZonesResult changeToken](self, "changeToken"));
  uint64_t v12 = AMSHashIfNeeded(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v4 appendFormat:@"  changeToken = %@\n", v13];

  [v4 appendString:@"}"];
  return (NSString *)v4;
}

- (NSArray)changedRecordZones
{
  return self->_changedRecordZones;
}

- (NSArray)deletedRecordZones
{
  return self->_deletedRecordZones;
}

- (AMSDCloudDataChangeToken)changeToken
{
  return self->_changeToken;
}

- (void).cxx_destruct
{
}

@end