@interface MediaSocialPostResponse
+ (id)_unrecoverableErrors;
- (BOOL)_isUnrecoverable:(id)a3 statusCode:(int64_t)a4;
- (NSError)error;
- (NSString)activityIdentifier;
- (NSString)serviceErrorLabel;
- (NSString)serviceErrorMessage;
- (NSString)status;
- (NSURL)activityURL;
- (double)pollDuration;
- (double)pollingInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)postIdentifier;
- (int64_t)result;
- (int64_t)statusCode;
- (void)setActivityIdentifier:(id)a3;
- (void)setActivityURL:(id)a3;
- (void)setError:(id)a3;
- (void)setPollDuration:(double)a3;
- (void)setPollingInterval:(double)a3;
- (void)setPostIdentifier:(int64_t)a3;
- (void)setResult:(int64_t)a3;
- (void)setServiceErrorLabel:(id)a3;
- (void)setServiceErrorMessage:(id)a3;
- (void)setStatus:(id)a3;
- (void)setStatusCode:(int64_t)a3;
- (void)setValuesWithResponseDictionary:(id)a3;
@end

@implementation MediaSocialPostResponse

- (void)setValuesWithResponseDictionary:(id)a3
{
  id v22 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"id"]);
  if (!v4) {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"activityId"]);
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    -[MediaSocialPostResponse setActivityIdentifier:](self, "setActivityIdentifier:", v4);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"pollInterval"]);
  if ((objc_opt_respondsToSelector(v6, "doubleValue") & 1) != 0)
  {
    [v6 doubleValue];
    -[MediaSocialPostResponse setPollingInterval:](self, "setPollingInterval:");
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"pollDuration"]);
  if ((objc_opt_respondsToSelector(v7, "doubleValue") & 1) != 0)
  {
    [v7 doubleValue];
    -[MediaSocialPostResponse setPollDuration:](self, "setPollDuration:");
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"state"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    if (([v8 isEqualToString:@"pending"] & 1) != 0
      || ([v8 isEqualToString:@"processing"] & 1) != 0)
    {
      int v10 = 1;
      goto LABEL_16;
    }
  }

  int v10 = 0;
LABEL_16:
  v11 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"status"]);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
  char isKindOfClass = objc_opt_isKindOfClass(v11, v12);
  v14 = v22;
  if ((isKindOfClass & 1) != 0)
  {
    if (([v11 isEqualToString:@"success"] & 1) != 0
      || [v11 isEqualToString:@"published"])
    {
      if (v10) {
        uint64_t v15 = 3LL;
      }
      else {
        uint64_t v15 = 4LL;
      }
      -[MediaSocialPostResponse setResult:](self, "setResult:", v15);
    }

    else
    {
      -[MediaSocialPostResponse setStatus:](self, "setStatus:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"serviceErrorLabel"]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:@"serviceErrorMessage"]);
      if (v17) {
        -[MediaSocialPostResponse setServiceErrorMessage:](self, "setServiceErrorMessage:", v17);
      }
      if (-[MediaSocialPostResponse _isUnrecoverable:statusCode:]( self,  "_isUnrecoverable:statusCode:",  v16,  -[MediaSocialPostResponse statusCode](self, "statusCode")))
      {
        uint64_t v18 = 2LL;
      }

      else
      {
        uint64_t v18 = v17 != 0LL;
      }

      -[MediaSocialPostResponse setResult:](self, "setResult:", v18);
    }

    v14 = v22;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"url"]);
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
  {
    v21 = -[NSURL initWithString:](objc_alloc(&OBJC_CLASS___NSURL), "initWithString:", v19);
    -[MediaSocialPostResponse setActivityURL:](self, "setActivityURL:", v21);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  [v4 setActivityIdentifier:self->_activityIdentifier];
  [v4 setActivityURL:self->_activityURL];
  [v4 setError:self->_error];
  [v4 setPollingInterval:self->_pollingInterval];
  [v4 setPostIdentifier:self->_postIdentifier];
  [v4 setResult:self->_result];
  return v4;
}

- (BOOL)_isUnrecoverable:(id)a3 statusCode:(int64_t)a4
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MediaSocialPostResponse _unrecoverableErrors]( &OBJC_CLASS___MediaSocialPostResponse,  "_unrecoverableErrors"));
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)_unrecoverableErrors
{
  if (qword_1003A3468 != -1) {
    dispatch_once(&qword_1003A3468, &stru_10034EA08);
  }
  return (id)qword_1003A3460;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (NSURL)activityURL
{
  return self->_activityURL;
}

- (void)setActivityURL:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (double)pollDuration
{
  return self->_pollDuration;
}

- (void)setPollDuration:(double)a3
{
  self->_pollDuration = a3;
}

- (double)pollingInterval
{
  return self->_pollingInterval;
}

- (void)setPollingInterval:(double)a3
{
  self->_pollingInterval = a3;
}

- (int64_t)postIdentifier
{
  return self->_postIdentifier;
}

- (void)setPostIdentifier:(int64_t)a3
{
  self->_postIdentifier = a3;
}

- (int64_t)result
{
  return self->_result;
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (NSString)serviceErrorLabel
{
  return self->_serviceErrorLabel;
}

- (void)setServiceErrorLabel:(id)a3
{
}

- (NSString)serviceErrorMessage
{
  return self->_serviceErrorMessage;
}

- (void)setServiceErrorMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end