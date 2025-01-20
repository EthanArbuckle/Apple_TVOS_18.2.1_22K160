@interface AMSCloudDataSavedRecordsResult
- (AMSCloudDataSavedRecordsResult)initWithSavedRecords:(id)a3 deletedRecords:(id)a4 error:(id)a5;
- (NSArray)deletedRecords;
- (NSArray)savedRecords;
- (NSError)error;
- (NSString)hashedDescription;
@end

@implementation AMSCloudDataSavedRecordsResult

- (AMSCloudDataSavedRecordsResult)initWithSavedRecords:(id)a3 deletedRecords:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AMSCloudDataSavedRecordsResult;
  v12 = -[AMSCloudDataSavedRecordsResult init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_savedRecords, a3);
    objc_storeStrong((id *)&v13->_deletedRecords, a4);
    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (NSString)hashedDescription
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p> {",  objc_opt_class(self),  self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudDataSavedRecordsResult savedRecords](self, "savedRecords"));
  uint64_t v6 = AMSHashIfNeeded(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 appendFormat:@"  savedRecords = %@,\n", v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudDataSavedRecordsResult deletedRecords](self, "deletedRecords"));
  uint64_t v9 = AMSHashIfNeeded(v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v4 appendFormat:@"  deletedRecords = %@,\n", v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[AMSCloudDataSavedRecordsResult error](self, "error"));
  uint64_t v12 = AMSHashIfNeeded(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v4 appendFormat:@"  error = %@,\n", v13];

  [v4 appendString:@"}"];
  return (NSString *)v4;
}

- (NSArray)savedRecords
{
  return self->_savedRecords;
}

- (NSArray)deletedRecords
{
  return self->_deletedRecords;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end