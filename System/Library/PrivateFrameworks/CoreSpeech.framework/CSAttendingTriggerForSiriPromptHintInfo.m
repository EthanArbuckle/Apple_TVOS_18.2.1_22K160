@interface CSAttendingTriggerForSiriPromptHintInfo
- (CSAttendingTriggerForSiriPromptHintInfo)initWithOrigin:(unint64_t)a3 reason:(unint64_t)a4 rootRequestId:(id)a5;
- (NSString)rootRequestId;
- (id)_reasonString;
- (id)description;
- (unint64_t)reason;
@end

@implementation CSAttendingTriggerForSiriPromptHintInfo

- (CSAttendingTriggerForSiriPromptHintInfo)initWithOrigin:(unint64_t)a3 reason:(unint64_t)a4 rootRequestId:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSAttendingTriggerForSiriPromptHintInfo;
  v10 = -[CSAttendingHintInfo initWithOrigin:](&v13, "initWithOrigin:", a3);
  v11 = v10;
  if (v10)
  {
    v10->_reason = a4;
    objc_storeStrong((id *)&v10->_rootRequestId, a5);
  }

  return v11;
}

- (id)_reasonString
{
  if (self->_reason == 1) {
    return @"SiriPrompted";
  }
  else {
    return @"Unknown";
  }
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSAttendingTriggerForSiriPromptHintInfo;
  id v4 = -[CSAttendingHintInfo description](&v8, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 appendFormat:@"%@", v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttendingTriggerForSiriPromptHintInfo _reasonString](self, "_reasonString"));
  [v3 appendFormat:@"[reason: %@]", v6];

  [v3 appendFormat:@"[rootRequestId: %@]", self->_rootRequestId];
  return v3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSString)rootRequestId
{
  return self->_rootRequestId;
}

- (void).cxx_destruct
{
}

@end