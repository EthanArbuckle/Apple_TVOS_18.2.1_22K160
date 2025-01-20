@interface KTSetOptInResult
- (BOOL)success;
- (NSDate)optInDate;
- (NSError)error;
- (NSNumber)optInStatus;
- (NSString)uri;
- (id)description;
- (void)setError:(id)a3;
- (void)setOptInDate:(id)a3;
- (void)setOptInStatus:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setUri:(id)a3;
@end

@implementation KTSetOptInResult

- (id)description
{
  if (-[KTSetOptInResult success](self, "success")) {
    v3 = @"success";
  }
  else {
    v3 = @"fail";
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInResult uri](self, "uri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInResult optInStatus](self, "optInStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInResult optInDate](self, "optInDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSetOptInResult error](self, "error"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<KTSetOptInResult: %@ uri: %@ status: %@ date: %@ error: %@>",  v3,  v4,  v5,  v6,  v7));

  return v8;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
}

- (NSNumber)optInStatus
{
  return self->_optInStatus;
}

- (void)setOptInStatus:(id)a3
{
}

- (NSDate)optInDate
{
  return self->_optInDate;
}

- (void)setOptInDate:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end