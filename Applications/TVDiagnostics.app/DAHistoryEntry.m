@interface DAHistoryEntry
+ (BOOL)supportsSecureCoding;
- (ASTSuiteResult)results;
- (BOOL)skipped;
- (DAHistoryEntry)init;
- (DAHistoryEntry)initWithCoder:(id)a3;
- (DAHistoryEntry)initWithTestSuiteName:(id)a3 date:(id)a4 skipped:(BOOL)a5;
- (DAHistoryEntry)initWithTestSuiteName:(id)a3 date:(id)a4 skipped:(BOOL)a5 results:(id)a6;
- (DAHistoryEntry)initWithTestSuiteName:(id)a3 skipped:(BOOL)a4;
- (DAHistoryEntry)initWithTestSuiteName:(id)a3 skipped:(BOOL)a4 results:(id)a5;
- (NSDate)date;
- (NSString)testSuiteName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAHistoryEntry

- (DAHistoryEntry)init
{
  return -[DAHistoryEntry initWithTestSuiteName:skipped:](self, "initWithTestSuiteName:skipped:", &stru_10002D180, 0LL);
}

- (DAHistoryEntry)initWithTestSuiteName:(id)a3 skipped:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v8 = -[DAHistoryEntry initWithTestSuiteName:date:skipped:](self, "initWithTestSuiteName:date:skipped:", v6, v7, v4);

  return v8;
}

- (DAHistoryEntry)initWithTestSuiteName:(id)a3 skipped:(BOOL)a4 results:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v11 = -[DAHistoryEntry initWithTestSuiteName:date:skipped:results:]( self,  "initWithTestSuiteName:date:skipped:results:",  v9,  v10,  v5,  v8);

  return v11;
}

- (DAHistoryEntry)initWithTestSuiteName:(id)a3 date:(id)a4 skipped:(BOOL)a5
{
  return -[DAHistoryEntry initWithTestSuiteName:date:skipped:results:]( self,  "initWithTestSuiteName:date:skipped:results:",  a3,  a4,  a5,  0LL);
}

- (DAHistoryEntry)initWithTestSuiteName:(id)a3 date:(id)a4 skipped:(BOOL)a5 results:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DAHistoryEntry;
  v14 = -[DAHistoryEntry init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_testSuiteName, a3);
    objc_storeStrong((id *)&v15->_date, a4);
    v15->_skipped = a5;
    objc_storeStrong((id *)&v15->_results, a6);
  }

  return v15;
}

- (DAHistoryEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[DAHistoryEntry init](self, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"testSuiteName"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    testSuiteName = v5->_testSuiteName;
    v5->_testSuiteName = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"date"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    date = v5->_date;
    v5->_date = (NSDate *)v10;

    v5->_skipped = [v4 decodeBoolForKey:@"skipped"];
    id v12 = [v4 decodeObjectOfClass:objc_opt_class(ASTSuiteResult) forKey:@"results"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    results = v5->_results;
    v5->_results = (ASTSuiteResult *)v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAHistoryEntry testSuiteName](self, "testSuiteName"));
  [v4 encodeObject:v5 forKey:@"testSuiteName"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAHistoryEntry date](self, "date"));
  [v4 encodeObject:v6 forKey:@"date"];

  objc_msgSend(v4, "encodeBool:forKey:", -[DAHistoryEntry skipped](self, "skipped"), @"skipped");
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[DAHistoryEntry results](self, "results"));
  [v4 encodeObject:v7 forKey:@"results"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(id)objc_opt_class(self) allocWithZone:a3];
  id v6 = -[NSString copyWithZone:](self->_testSuiteName, "copyWithZone:", a3);
  id v7 = -[NSDate copyWithZone:](self->_date, "copyWithZone:", a3);
  id v8 = [v5 initWithTestSuiteName:v6 date:v7 skipped:self->_skipped];

  return v8;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAHistoryEntry testSuiteName](self, "testSuiteName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DAHistoryEntry date](self, "date"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"testSuiteName: %@; date: %@; skipped: %d",
                   v3,
                   v4,
                   -[DAHistoryEntry skipped](self, "skipped")));

  return v5;
}

- (NSString)testSuiteName
{
  return self->_testSuiteName;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)skipped
{
  return self->_skipped;
}

- (ASTSuiteResult)results
{
  return self->_results;
}

- (void).cxx_destruct
{
}

@end