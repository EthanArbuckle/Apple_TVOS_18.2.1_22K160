@interface NSURLSessionTaskTransactionMetrics
+ (id)_dateIntervalFrom:(id)a3 to:(id)a4;
- (NSDateInterval)lib_connectInterval;
- (NSDateInterval)lib_domainLookupInterval;
- (NSDateInterval)lib_requestInterval;
- (NSDateInterval)lib_responseInterval;
- (NSDateInterval)lib_secureConnectionInterval;
@end

@implementation NSURLSessionTaskTransactionMetrics

- (NSDateInterval)lib_connectInterval
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionTaskTransactionMetrics connectStartDate](self, "connectStartDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionTaskTransactionMetrics connectEndDate](self, "connectEndDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionTaskTransactionMetrics _dateIntervalFrom:to:]( &OBJC_CLASS___NSURLSessionTaskTransactionMetrics,  "_dateIntervalFrom:to:",  v3,  v4));

  return (NSDateInterval *)v5;
}

- (NSDateInterval)lib_domainLookupInterval
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionTaskTransactionMetrics domainLookupStartDate](self, "domainLookupStartDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionTaskTransactionMetrics domainLookupEndDate](self, "domainLookupEndDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionTaskTransactionMetrics _dateIntervalFrom:to:]( &OBJC_CLASS___NSURLSessionTaskTransactionMetrics,  "_dateIntervalFrom:to:",  v3,  v4));

  return (NSDateInterval *)v5;
}

- (NSDateInterval)lib_requestInterval
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionTaskTransactionMetrics requestStartDate](self, "requestStartDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionTaskTransactionMetrics requestEndDate](self, "requestEndDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionTaskTransactionMetrics _dateIntervalFrom:to:]( &OBJC_CLASS___NSURLSessionTaskTransactionMetrics,  "_dateIntervalFrom:to:",  v3,  v4));

  return (NSDateInterval *)v5;
}

- (NSDateInterval)lib_responseInterval
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionTaskTransactionMetrics responseStartDate](self, "responseStartDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionTaskTransactionMetrics responseEndDate](self, "responseEndDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionTaskTransactionMetrics _dateIntervalFrom:to:]( &OBJC_CLASS___NSURLSessionTaskTransactionMetrics,  "_dateIntervalFrom:to:",  v3,  v4));

  return (NSDateInterval *)v5;
}

- (NSDateInterval)lib_secureConnectionInterval
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionTaskTransactionMetrics secureConnectionStartDate](self, "secureConnectionStartDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionTaskTransactionMetrics secureConnectionEndDate](self, "secureConnectionEndDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionTaskTransactionMetrics _dateIntervalFrom:to:]( &OBJC_CLASS___NSURLSessionTaskTransactionMetrics,  "_dateIntervalFrom:to:",  v3,  v4));

  return (NSDateInterval *)v5;
}

+ (id)_dateIntervalFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  v8 = 0LL;
  if (v5 && v6)
  {
    [v6 timeIntervalSinceDate:v5];
    if (v9 >= 2.22044605e-16) {
      v8 = -[NSDateInterval initWithStartDate:duration:]( objc_alloc(&OBJC_CLASS___NSDateInterval),  "initWithStartDate:duration:",  v5,  v9);
    }
    else {
      v8 = 0LL;
    }
  }

  return v8;
}

@end