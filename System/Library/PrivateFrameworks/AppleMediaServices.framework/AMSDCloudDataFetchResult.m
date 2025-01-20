@interface AMSDCloudDataFetchResult
- (AMSDCloudDataFetchResult)initWithResults:(id)a3 failures:(id)a4;
- (NSDictionary)failures;
- (NSDictionary)results;
- (NSString)hashedDescription;
@end

@implementation AMSDCloudDataFetchResult

- (AMSDCloudDataFetchResult)initWithResults:(id)a3 failures:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AMSDCloudDataFetchResult;
  v9 = -[AMSDCloudDataFetchResult init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_failures, a4);
    objc_storeStrong((id *)&v10->_results, a3);
  }

  return v10;
}

- (NSString)hashedDescription
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p> {",  objc_opt_class(self, a2),  self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCloudDataFetchResult results](self, "results"));
  uint64_t v6 = AMSHashIfNeeded(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 appendFormat:@"  results = %@,\n", v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AMSDCloudDataFetchResult failures](self, "failures"));
  uint64_t v9 = AMSHashIfNeeded(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v4 appendFormat:@"  failures = %@,\n", v10];

  [v4 appendString:@"}"];
  return (NSString *)v4;
}

- (NSDictionary)failures
{
  return self->_failures;
}

- (NSDictionary)results
{
  return self->_results;
}

- (void).cxx_destruct
{
}

@end