@interface FAPushDetailResponse
- (BOOL)_BOOLeanValueOfObject:(id)a3;
- (BOOL)isSuccess;
- (BOOL)showDetailsOption;
- (BOOL)showMessage;
- (FAPushDetailResponse)initWithDictionary:(id)a3;
- (FAPushDetailResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSDictionary)eventDetails;
- (NSString)actionButtonLableText;
- (NSString)childFirstName;
- (NSString)childLastName;
- (NSString)inviteCode;
- (NSString)message;
- (NSString)organizerEmail;
- (NSString)organizerFirstName;
- (NSString)organizerLastName;
- (NSString)otherButtonLabelText;
- (NSString)pushTopic;
- (NSString)title;
- (NSURL)launchURLFromServer;
- (id)description;
- (void)setPushTopic:(id)a3;
@end

@implementation FAPushDetailResponse

- (FAPushDetailResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___FAPushDetailResponse;
  v8 = -[FAPushDetailResponse initWithHTTPResponse:data:bodyIsPlist:]( &v21,  "initWithHTTPResponse:data:bodyIsPlist:",  a3,  v7,  0LL);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_data, a4);
    if (v7)
    {
      id v20 = 0LL;
      uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v20));
      id v11 = v20;
      response = (os_log_s *)v9->_response;
      v9->_response = (NSDictionary *)v10;
    }

    else
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError fa_familyErrorWithCode:](&OBJC_CLASS___NSError, "fa_familyErrorWithCode:", -1016LL));
      uint64_t v14 = _FALogSystem(v11, v13);
      response = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(response, OS_LOG_TYPE_ERROR)) {
        sub_10002B1E4(response);
      }
    }

    if (v11)
    {
      uint64_t v17 = _FALogSystem(v15, v16);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10002B150(v11, v18);
      }
    }
  }

  return v9;
}

- (NSDictionary)eventDetails
{
  return self->_response;
}

- (BOOL)isSuccess
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_response, "objectForKeyedSubscript:", @"status"));
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 intValue] == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)showMessage
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_response,  "objectForKeyedSubscript:",  @"show-message"));
  LOBYTE(v2) = -[FAPushDetailResponse _BOOLeanValueOfObject:](v2, "_BOOLeanValueOfObject:", v3);

  return (char)v2;
}

- (BOOL)showDetailsOption
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_response,  "objectForKeyedSubscript:",  @"show-details-option"));
  LOBYTE(v2) = -[FAPushDetailResponse _BOOLeanValueOfObject:](v2, "_BOOLeanValueOfObject:", v3);

  return (char)v2;
}

- (NSString)title
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:]( self->_response,  "objectForKeyedSubscript:",  @"display-message-title");
}

- (NSString)message
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:]( self->_response,  "objectForKeyedSubscript:",  @"display-message");
}

- (NSString)inviteCode
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:]( self->_response,  "objectForKeyedSubscript:",  @"invite-code");
}

- (NSString)organizerFirstName
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:]( self->_response,  "objectForKeyedSubscript:",  @"organizer-first-name");
}

- (NSString)organizerLastName
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:]( self->_response,  "objectForKeyedSubscript:",  @"organizer-last-name");
}

- (NSString)childFirstName
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:]( self->_response,  "objectForKeyedSubscript:",  @"child-first-name");
}

- (NSString)childLastName
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:]( self->_response,  "objectForKeyedSubscript:",  @"child-last-name");
}

- (NSString)organizerEmail
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:]( self->_response,  "objectForKeyedSubscript:",  @"inviter-email");
}

- (NSString)actionButtonLableText
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:]( self->_response,  "objectForKeyedSubscript:",  @"action-button-label");
}

- (NSString)otherButtonLabelText
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:]( self->_response,  "objectForKeyedSubscript:",  @"other-button-label");
}

- (NSURL)launchURLFromServer
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_response,  "objectForKeyedSubscript:",  @"launchURL"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](&OBJC_CLASS___NSURLComponents, "componentsWithString:", v2));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 scheme]);
    unsigned int v5 = [&off_100044700 containsObject:v4];

    if (v5) {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v3 URL]);
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  return (NSURL *)v6;
}

- (id)description
{
  v3 = -[NSString initWithData:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithData:encoding:",  self->_data,  4LL);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"FAPushDetailResponse - status: (%lu), body: (%@)",  -[FAPushDetailResponse statusCode](self, "statusCode"),  v3));

  return v4;
}

- (BOOL)_BOOLeanValueOfObject:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    || (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    unsigned __int8 v6 = [v3 BOOLValue];
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (FAPushDetailResponse)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FAPushDetailResponse;
  unsigned __int8 v6 = -[FAPushDetailResponse init](&v9, "init");
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_response, a3);
  }

  return v7;
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
}

- (void).cxx_destruct
{
}

@end