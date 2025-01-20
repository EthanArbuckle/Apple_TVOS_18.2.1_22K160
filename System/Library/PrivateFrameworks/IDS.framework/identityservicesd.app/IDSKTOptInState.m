@interface IDSKTOptInState
- (BOOL)isEqual:(id)a3;
- (IDSKTOptInState)initWithTimeStamp:(id)a3 status:(unint64_t)a4 error:(id)a5;
- (NSDate)timestamp;
- (NSError)error;
- (id)description;
- (unint64_t)hash;
- (unint64_t)status;
@end

@implementation IDSKTOptInState

- (IDSKTOptInState)initWithTimeStamp:(id)a3 status:(unint64_t)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IDSKTOptInState;
  v11 = -[IDSKTOptInState init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timestamp, a3);
    v12->_status = a4;
    objc_storeStrong((id *)&v12->_error, a5);
  }

  return v12;
}

- (id)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInState timestamp](self, "timestamp"));
  unint64_t v5 = -[IDSKTOptInState status](self, "status");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInState error](self, "error"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p { timestamp: %@, status: %ld@, error: %@ }>",  v3,  self,  v4,  v5,  v6));

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInState timestamp](self, "timestamp"));
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = -[IDSKTOptInState status](self, "status") ^ v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInState error](self, "error"));
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 timestamp]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInState timestamp](self, "timestamp"));
    if ([v8 isEqualToDate:v9]
      && (id v10 = [v7 status], v10 == (id)-[IDSKTOptInState status](self, "status")))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSKTOptInState error](self, "error"));
      unsigned __int8 v13 = [v11 isEqual:v12];
    }

    else
    {
      unsigned __int8 v13 = 0;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8LL, 1);
}

- (unint64_t)status
{
  return self->_status;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

@end