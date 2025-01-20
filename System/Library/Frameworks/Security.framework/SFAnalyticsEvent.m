@interface SFAnalyticsEvent
- (NSDictionary)record;
- (NSNumber)timestamp;
- (id)initFromRow:(id)a3;
@end

@implementation SFAnalyticsEvent

- (id)initFromRow:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SFAnalyticsEvent;
  v5 = -[SFAnalyticsEvent init](&v14, sel_init);
  if (v5)
  {
    uint64_t v6 = deserializedRecordFromRow(v4);
    record = v5->_record;
    v5->_record = (NSDictionary *)v6;

    if (!v5->_record)
    {
      v12 = 0LL;
      goto LABEL_6;
    }

    uint64_t v8 = [v4 indexForColumnName:@"timestamp"];
    v9 = (void *)MEMORY[0x189607968];
    [v4 doubleAtIndex:v8];
    uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v10;
  }

  v12 = v5;
LABEL_6:

  return v12;
}

- (NSDictionary)record
{
  return self->_record;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end