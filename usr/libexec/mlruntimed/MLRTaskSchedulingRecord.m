@interface MLRTaskSchedulingRecord
- (BOOL)commitWithError:(id *)a3;
- (MLRTaskSchedulingRecord)initWithTaskID:(id)a3;
- (NSDate)lastCompletionDate;
- (NSString)recordID;
- (id)description;
- (int64_t)performCount;
- (void)setLastCompletionDate:(id)a3;
- (void)setPerformCount:(int64_t)a3;
@end

@implementation MLRTaskSchedulingRecord

- (MLRTaskSchedulingRecord)initWithTaskID:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___MLRTaskSchedulingRecord;
    v6 = -[MLRTaskSchedulingRecord init](&v13, "init");
    if (v6)
    {
      v7 = -[DESUserDefaultsStoreRecord initWithRecordID:]( objc_alloc(&OBJC_CLASS___DESUserDefaultsStoreRecord),  "initWithRecordID:",  v5);
      storeRecord = v6->_storeRecord;
      v6->_storeRecord = v7;

      objc_storeStrong((id *)&v6->_recordID, a3);
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[DESUserDefaultsStoreRecord lastCompletionDate](v6->_storeRecord, "lastCompletionDate"));
      lastCompletionDate = v6->_lastCompletionDate;
      v6->_lastCompletionDate = (NSDate *)v9;

      v6->_performCount = (int64_t)-[DESUserDefaultsStoreRecord performCount](v6->_storeRecord, "performCount");
    }

    self = v6;
    v11 = self;
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@(%@, %@, %ld)",  v5,  self->_recordID,  self->_lastCompletionDate,  self->_performCount));

  return v6;
}

- (BOOL)commitWithError:(id *)a3
{
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

- (int64_t)performCount
{
  return self->_performCount;
}

- (void)setPerformCount:(int64_t)a3
{
  self->_performCount = a3;
}

- (void).cxx_destruct
{
}

@end