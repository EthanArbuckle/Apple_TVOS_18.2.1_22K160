@interface AMSCloudDataChangedRecordsResult
- (AMSCloudDataChangedRecordsResult)initWithChangedRecords:(id)a3 deletedRecords:(id)a4 errors:(id)a5 changeTokens:(id)a6;
- (NSDictionary)changeTokens;
- (NSDictionary)changedRecords;
- (NSDictionary)deletedRecords;
- (NSDictionary)errors;
- (NSString)hashedDescription;
@end

@implementation AMSCloudDataChangedRecordsResult

- (AMSCloudDataChangedRecordsResult)initWithChangedRecords:(id)a3 deletedRecords:(id)a4 errors:(id)a5 changeTokens:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___AMSCloudDataChangedRecordsResult;
  v15 = -[AMSCloudDataChangedRecordsResult init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_changedRecords, a3);
    objc_storeStrong((id *)&v16->_changeTokens, a6);
    objc_storeStrong((id *)&v16->_deletedRecords, a4);
    objc_storeStrong((id *)&v16->_errors, a5);
  }

  return v16;
}

- (NSString)hashedDescription
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p> {",  objc_opt_class(self),  self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudDataChangedRecordsResult changedRecords](self, "changedRecords"));
  uint64_t v6 = AMSHashIfNeeded();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 appendFormat:@"  changedRecords = %@,\n", v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudDataChangedRecordsResult deletedRecords](self, "deletedRecords"));
  uint64_t v9 = AMSHashIfNeeded();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v4 appendFormat:@"  deletedRecords = %@,\n", v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudDataChangedRecordsResult errors](self, "errors"));
  uint64_t v12 = AMSHashIfNeeded();
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v4 appendFormat:@"  errors = %@,\n", v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudDataChangedRecordsResult changeTokens](self, "changeTokens"));
  uint64_t v15 = AMSHashIfNeeded();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v4 appendFormat:@"  changeTokens = %@\n", v16];

  [v4 appendString:@"}"];
  return (NSString *)v4;
}

- (NSDictionary)changedRecords
{
  return self->_changedRecords;
}

- (NSDictionary)changeTokens
{
  return self->_changeTokens;
}

- (NSDictionary)deletedRecords
{
  return self->_deletedRecords;
}

- (NSDictionary)errors
{
  return self->_errors;
}

- (void).cxx_destruct
{
}

@end