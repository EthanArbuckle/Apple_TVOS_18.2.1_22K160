@interface ADAnalyticsEventRecordBuilder
- (id)build;
- (void)reset;
- (void)setValue:(id)a3 forColumnName:(id)a4;
@end

@implementation ADAnalyticsEventRecordBuilder

- (void)reset
{
  streamUIDValue = self->_streamUIDValue;
  self->_streamUIDValue = 0LL;

  deliveryStreamValue = self->_deliveryStreamValue;
  self->_deliveryStreamValue = 0LL;

  typeValue = self->_typeValue;
  self->_typeValue = 0LL;

  timestampValue = self->_timestampValue;
  self->_timestampValue = 0LL;

  contextDataValue = self->_contextDataValue;
  self->_contextDataValue = 0LL;

  contextDataTypeValue = self->_contextDataTypeValue;
  self->_contextDataTypeValue = 0LL;

  dateCreatedValue = self->_dateCreatedValue;
  self->_dateCreatedValue = 0LL;

  speechIdValue = self->_speechIdValue;
  self->_speechIdValue = 0LL;

  recordIdValue = self->_recordIdValue;
  self->_recordIdValue = 0LL;
}

- (void)setValue:(id)a3 forColumnName:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"stream_uid"])
  {
    uint64_t v8 = 1LL;
LABEL_19:
    objc_storeStrong((id *)&(&self->super.isa)[v8], a3);
    goto LABEL_20;
  }

  if ([v7 isEqualToString:@"delivery_stream"])
  {
    uint64_t v8 = 2LL;
    goto LABEL_19;
  }

  if ([v7 isEqualToString:@"type"])
  {
    uint64_t v8 = 3LL;
    goto LABEL_19;
  }

  if ([v7 isEqualToString:@"timestamp"])
  {
    uint64_t v8 = 4LL;
    goto LABEL_19;
  }

  if ([v7 isEqualToString:@"context_data"])
  {
    uint64_t v8 = 5LL;
    goto LABEL_19;
  }

  if ([v7 isEqualToString:@"context_data_type"])
  {
    uint64_t v8 = 6LL;
    goto LABEL_19;
  }

  if ([v7 isEqualToString:@"date_created"])
  {
    uint64_t v8 = 7LL;
    goto LABEL_19;
  }

  if ([v7 isEqualToString:@"assistant_id"])
  {
    uint64_t v8 = 8LL;
    goto LABEL_19;
  }

  if ([v7 isEqualToString:@"record_id"])
  {
    uint64_t v8 = 9LL;
    goto LABEL_19;
  }

- (id)build
{
  v21 = objc_alloc(&OBJC_CLASS___AFAnalyticsEvent);
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[SiriCoreSQLiteValue siriCoreSQLiteValue_toNumber]( self->_deliveryStreamValue,  "siriCoreSQLiteValue_toNumber"));
  id v4 = [v3 unsignedLongLongValue];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SiriCoreSQLiteValue siriCoreSQLiteValue_toNumber](self->_typeValue, "siriCoreSQLiteValue_toNumber"));
  id v6 = [v5 integerValue];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[SiriCoreSQLiteValue siriCoreSQLiteValue_toNumber]( self->_timestampValue,  "siriCoreSQLiteValue_toNumber"));
  id v8 = [v7 unsignedLongLongValue];
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SiriCoreSQLiteValue siriCoreSQLiteValue_toNumber]( self->_contextDataTypeValue,  "siriCoreSQLiteValue_toNumber"));
  id v10 = [v9 integerValue];
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[SiriCoreSQLiteValue siriCoreSQLiteValue_toData]( self->_contextDataValue,  "siriCoreSQLiteValue_toData"));
  v12 = -[AFAnalyticsEvent initWithDeliveryStream:type:timestamp:contextDataType:contextData:]( v21,  "initWithDeliveryStream:type:timestamp:contextDataType:contextData:",  v4,  v6,  v8,  v10,  v11);

  id v13 = objc_alloc(&OBJC_CLASS___AFAnalyticsEventRecord);
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[SiriCoreSQLiteValue siriCoreSQLiteValue_toString]( self->_streamUIDValue,  "siriCoreSQLiteValue_toString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[SiriCoreSQLiteValue siriCoreSQLiteValue_toNumber]( self->_dateCreatedValue,  "siriCoreSQLiteValue_toNumber"));
  [v15 doubleValue];
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSince1970:"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( -[SiriCoreSQLiteValue siriCoreSQLiteValue_toString]( self->_speechIdValue,  "siriCoreSQLiteValue_toString"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( -[SiriCoreSQLiteValue siriCoreSQLiteValue_toString]( self->_recordIdValue,  "siriCoreSQLiteValue_toString"));
  id v19 = [v13 initWithEvent:v12 streamUID:v14 dateCreated:v16 speechId:v17 recordId:v18];

  return v19;
}

- (void).cxx_destruct
{
}

@end