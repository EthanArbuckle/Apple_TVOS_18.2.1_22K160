@interface _ADCloudKitIntentsCapabilitiesStoreHelper
- (id)deletionCriterionForCKRecordIDs:(id)a3;
- (id)recordBuilder;
- (id)recordZoneName;
- (id)sqliteRecordsForCKRecords:(id)a3;
- (id)tableDescription;
- (void)createIndicesForTableInDatabase:(id)a3;
@end

@implementation _ADCloudKitIntentsCapabilitiesStoreHelper

- (id)tableDescription
{
  id v2 = objc_alloc(&OBJC_CLASS___SiriCoreSQLiteTableDescription);
  id v3 = [[SiriCoreSQLiteColumnDescription alloc] initWithName:@"app_id" type:@"TEXT" constraints:0];
  id v4 = objc_msgSend( [SiriCoreSQLiteColumnDescription alloc],  "initWithName:type:constraints:",  @"intent_name",  @"TEXT",  0,  v3);
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[SiriCoreSQLiteColumnDescription uniqueTextColumnWithName:]( &OBJC_CLASS___SiriCoreSQLiteColumnDescription,  "uniqueTextColumnWithName:",  @"device_id"));
  v9[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v9, 3LL));
  id v7 = [v2 initWithName:@"intents_capabilities" columns:v6 constraints:0];

  return v7;
}

- (void)createIndicesForTableInDatabase:(id)a3
{
  id v3 = a3;
  sub_10019878C(@"intents_capabilities", @"app_id", v3);
  sub_10019878C(@"intents_capabilities", @"intent_name", v3);
  sub_10019878C(@"intents_capabilities", @"device_id", v3);
}

- (id)recordZoneName
{
  id v2 = @"com.apple.assistant.device_capabilities";
  return @"com.apple.assistant.device_capabilities";
}

- (id)recordBuilder
{
  recordBuilder = self->_recordBuilder;
  if (!recordBuilder)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___ADCloudKitCapabilitiesRecordBuilder);
    v5 = self->_recordBuilder;
    self->_recordBuilder = (SiriCoreSQLiteRecordBuilder *)v4;

    recordBuilder = self->_recordBuilder;
  }

  return recordBuilder;
}

- (id)sqliteRecordsForCKRecords:(id)a3
{
  return 0LL;
}

- (id)deletionCriterionForCKRecordIDs:(id)a3
{
  return 0LL;
}

- (void).cxx_destruct
{
}

@end