@interface INAccountEventDetailsResponse
- (BOOL)showAlert;
- (INAccountEventDetailsResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)message;
- (NSString)title;
- (NSURL)alternateButtonURL;
- (NSURL)defaultButtonURL;
- (id)_parseURLFromAlertParameterWithName:(id)a3;
@end

@implementation INAccountEventDetailsResponse

- (INAccountEventDetailsResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___INAccountEventDetailsResponse;
  v8 = -[INAccountEventDetailsResponse initWithHTTPResponse:data:bodyIsPlist:]( &v26,  "initWithHTTPResponse:data:bodyIsPlist:",  a3,  v7,  0LL);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_responseData, a4);
    if (v7)
    {
      id v25 = 0LL;
      uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v25));
      id v12 = v25;
      responseParameters = v9->_responseParameters;
      v9->_responseParameters = (NSDictionary *)v11;

      if (v12)
      {
        uint64_t v15 = _INLogSystem(v14);
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1000158B0((uint64_t)v7, (uint64_t)v12, v16);
        }
      }

      uint64_t v17 = objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v9->_responseParameters,  "objectForKeyedSubscript:",  @"alert"));
      alertParameters = v9->_alertParameters;
      v9->_alertParameters = (NSDictionary *)v17;

      if (v9->_alertParameters) {
        goto LABEL_14;
      }
      uint64_t v20 = _INLogSystem(v19);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "No alert parameters in server response!",  v24,  2u);
      }
    }

    else
    {
      uint64_t v22 = _INLogSystem(v10);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100015870(v21);
      }
      id v12 = 0LL;
    }

LABEL_14:
  }

  return v9;
}

- (BOOL)showAlert
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_responseParameters, "objectForKey:", @"showMessage"));
  uint64_t v3 = _INLogSystem(v2);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100015970((uint64_t)v2, v4);
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5);
  if ((objc_opt_isKindOfClass(v2, v6) & 1) != 0)
  {
    unsigned __int8 v8 = [v2 isEqualToString:@"true"];
  }

  else
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v7);
    if ((objc_opt_isKindOfClass(v2, v9) & 1) == 0)
    {
      BOOL v10 = 0;
      goto LABEL_9;
    }

    unsigned __int8 v8 = [v2 BOOLValue];
  }

  BOOL v10 = v8;
LABEL_9:

  return v10;
}

- (NSString)title
{
  return (NSString *)-[NSDictionary objectForKey:](self->_alertParameters, "objectForKey:", @"title");
}

- (NSString)message
{
  return (NSString *)-[NSDictionary objectForKey:](self->_alertParameters, "objectForKey:", @"text");
}

- (NSString)defaultButtonTitle
{
  return (NSString *)-[NSDictionary objectForKey:](self->_alertParameters, "objectForKey:", @"okButtonTitle");
}

- (NSString)alternateButtonTitle
{
  return (NSString *)-[NSDictionary objectForKey:](self->_alertParameters, "objectForKey:", @"cancelButtonTitle");
}

- (NSURL)defaultButtonURL
{
  return (NSURL *)-[INAccountEventDetailsResponse _parseURLFromAlertParameterWithName:]( self,  "_parseURLFromAlertParameterWithName:",  @"okButtonURL");
}

- (NSURL)alternateButtonURL
{
  return (NSURL *)-[INAccountEventDetailsResponse _parseURLFromAlertParameterWithName:]( self,  "_parseURLFromAlertParameterWithName:",  @"cancelButtonURL");
}

- (id)_parseURLFromAlertParameterWithName:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_alertParameters, "objectForKey:", a3));
  if ([v3 length])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v3));
    if (!v4)
    {
      uint64_t v5 = _INLogSystem(0LL);
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000159E4((uint64_t)v3, v6);
      }
    }
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end