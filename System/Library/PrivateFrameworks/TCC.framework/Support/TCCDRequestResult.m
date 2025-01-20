@interface TCCDRequestResult
+ (void)populateReplyMessageToDeny:(id)a3 withError:(id)a4;
- (NSError)error;
- (NSString)servicePolicyActionDescription;
- (NSString)servicePolicyActionKeyName;
- (TCCDRequestResult)init;
- (id)description;
- (id)descriptionWithRespectToService:(id)a3;
- (int)doUpdateOfSubjectVerifierData;
- (int)lastReminderTime;
- (int)replyNoCacheAuthorization;
- (int)v1AuthorizationUpgrade;
- (int64_t)databaseAction;
- (int64_t)promptType;
- (int64_t)servicePolicyAction;
- (unint64_t)authorizationReason;
- (unint64_t)authorizationValue;
- (unint64_t)authorizationVersion;
- (unint64_t)previousAuthorization;
- (unint64_t)v1AuthorizationReason;
- (unint64_t)v1AuthorizationValue;
- (unsigned)databaseFlags;
- (void)denyAuthorizationWithErrorCode:(int64_t)a3 format:(id)a4;
- (void)populateReplyMessage:(id)a3;
- (void)setAuthorizationReason:(unint64_t)a3;
- (void)setAuthorizationValue:(unint64_t)a3;
- (void)setAuthorizationVersion:(unint64_t)a3;
- (void)setDatabaseAction:(int64_t)a3;
- (void)setDatabaseFlags:(unsigned int)a3;
- (void)setDoUpdateOfSubjectVerifierData:(int)a3;
- (void)setError:(id)a3;
- (void)setLastReminderTime:(int)a3;
- (void)setPreviousAuthorization:(unint64_t)a3;
- (void)setPromptType:(int64_t)a3;
- (void)setReplyNoCacheAuthorization:(int)a3;
- (void)setServicePolicyAction:(int64_t)a3;
- (void)setServicePolicyActionDescription:(id)a3;
- (void)setServicePolicyActionKeyName:(id)a3;
- (void)setV1AuthorizationReason:(unint64_t)a3;
- (void)setV1AuthorizationUpgrade:(int)a3;
- (void)setV1AuthorizationValue:(unint64_t)a3;
@end

@implementation TCCDRequestResult

+ (void)populateReplyMessageToDeny:(id)a3 withError:(id)a4
{
  id v5 = a4;
  xpc_object_t xdict = a3;
  xpc_dictionary_set_BOOL(xdict, "result", 0);
  xpc_dictionary_set_uint64(xdict, "auth_value", 0LL);
  xpc_dictionary_set_uint64(xdict, "auth_reason", 1uLL);
  id v6 = objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
  xpc_dictionary_set_string(xdict, "auth_error_string", (const char *)[v6 UTF8String]);

  id v7 = [v5 code];
  xpc_dictionary_set_uint64(xdict, "auth_error_code", (uint64_t)v7);
}

- (TCCDRequestResult)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TCCDRequestResult;
  v2 = -[TCCDRequestResult init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[TCCDRequestResult setAuthorizationVersion:](v2, "setAuthorizationVersion:", 1LL);
  }
  return v3;
}

- (void)denyAuthorizationWithErrorCode:(int64_t)a3 format:(id)a4
{
  id v6 = a4;
  -[TCCDRequestResult setAuthorizationValue:](self, "setAuthorizationValue:", 0LL);
  -[TCCDRequestResult setAuthorizationReason:](self, "setAuthorizationReason:", 1LL);
  -[TCCDRequestResult setDatabaseAction:](self, "setDatabaseAction:", 0LL);
  id v7 = +[TCCDServer newErrorWithCode:format:arguments:]( &OBJC_CLASS___TCCDServer,  "newErrorWithCode:format:arguments:",  a3,  v6,  &v11);

  -[TCCDRequestResult setError:](self, "setError:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 server]);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 logHandle]);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1000367A8(self, v10);
  }
}

- (id)descriptionWithRespectToService:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendString:](v5, "appendString:", @"ReqResult(");
  if (v4
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "authorizationRightStateForValue:reason:",  -[TCCDRequestResult authorizationValue](self, "authorizationValue"),  -[TCCDRequestResult authorizationReason](self, "authorizationReason")))) != 0)
  {
    id v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 description]);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"Auth Right: %@", v8);
  }

  else
  {
    -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"Auth Value: 0x%llx",  -[TCCDRequestResult authorizationValue](self, "authorizationValue"));
  }

  -[NSMutableString appendString:](v5, "appendString:", @", ");
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"promptType: %lu,",  -[TCCDRequestResult promptType](self, "promptType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestResult error](self, "error"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestResult error](self, "error"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"error: %@, ", v11);
  }

  -[NSMutableString appendString:](v5, "appendString:", @"DB Action:");
  if (-[TCCDRequestResult databaseAction](self, "databaseAction"))
  {
    if ((id)-[TCCDRequestResult databaseAction](self, "databaseAction") == (id)1)
    {
      v12 = @"Update";
    }

    else
    {
      if ((id)-[TCCDRequestResult databaseAction](self, "databaseAction") != (id)2) {
        goto LABEL_14;
      }
      v12 = @"Retry";
    }
  }

  else
  {
    v12 = @"None";
  }

  -[NSMutableString appendString:](v5, "appendString:", v12);
LABEL_14:
  if (-[TCCDRequestResult doUpdateOfSubjectVerifierData](self, "doUpdateOfSubjectVerifierData")) {
    -[NSMutableString appendString:](v5, "appendString:", @", UpdateVerifierData");
  }
  -[NSMutableString appendString:](v5, "appendString:", @""));
  id v13 = -[NSMutableString copy](v5, "copy");

  return v13;
}

- (id)description
{
  return -[TCCDRequestResult descriptionWithRespectToService:](self, "descriptionWithRespectToService:", 0LL);
}

- (void)populateReplyMessage:(id)a3
{
  xpc_object_t xdict = a3;
  BOOL v4 = (id)-[TCCDRequestResult authorizationValue](self, "authorizationValue") == (id)1;
  objc_super v5 = xdict;
  if (v4)
  {
    id v6 = "preflight_unknown";
LABEL_9:
    BOOL v7 = 1;
LABEL_10:
    xpc_dictionary_set_BOOL(v5, v6, v7);
    goto LABEL_11;
  }

  if (-[TCCDRequestResult authorizationValue](self, "authorizationValue"))
  {
    id v6 = "result";
LABEL_8:
    objc_super v5 = xdict;
    goto LABEL_9;
  }

  if ((id)-[TCCDRequestResult authorizationReason](self, "authorizationReason") == (id)7)
  {
    id v6 = "restricted";
    goto LABEL_8;
  }

  if ((id)-[TCCDRequestResult authorizationReason](self, "authorizationReason") != (id)8
    || (id)-[TCCDRequestResult servicePolicyAction](self, "servicePolicyAction") != (id)1)
  {
    id v6 = "result";
    objc_super v5 = xdict;
    BOOL v7 = 0;
    goto LABEL_10;
  }

  id v14 = objc_claimAutoreleasedReturnValue( -[TCCDRequestResult servicePolicyActionDescription]( self, "servicePolicyActionDescription"));
  xpc_dictionary_set_string(xdict, "abort", (const char *)[v14 UTF8String]);

  id v15 = objc_claimAutoreleasedReturnValue(-[TCCDRequestResult servicePolicyActionKeyName](self, "servicePolicyActionKeyName"));
  xpc_dictionary_set_string(xdict, "problem_key", (const char *)[v15 UTF8String]);

LABEL_11:
  if (-[TCCDRequestResult replyNoCacheAuthorization](self, "replyNoCacheAuthorization")) {
    xpc_dictionary_set_BOOL(xdict, "do_not_cache", 1);
  }
  xpc_dictionary_set_uint64(xdict, "auth_value", -[TCCDRequestResult authorizationValue](self, "authorizationValue"));
  xpc_dictionary_set_uint64(xdict, "auth_reason", -[TCCDRequestResult authorizationReason](self, "authorizationReason"));
  xpc_dictionary_set_uint64( xdict,  "auth_version",  -[TCCDRequestResult authorizationVersion](self, "authorizationVersion"));
  xpc_dictionary_set_uint64(xdict, "prompt_type", -[TCCDRequestResult promptType](self, "promptType"));
  if ((-[TCCDRequestResult databaseFlags](self, "databaseFlags") & 0x10) != 0) {
    xpc_dictionary_set_BOOL( xdict,  "has_prompted_for_allow",  (-[TCCDRequestResult databaseFlags](self, "databaseFlags") & 0x10) != 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestResult error](self, "error"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestResult error](self, "error"));
    id v10 = objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
    xpc_dictionary_set_string(xdict, "auth_error_string", (const char *)[v10 UTF8String]);

    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDRequestResult error](self, "error"));
    xpc_dictionary_set_uint64(xdict, "auth_error_code", (uint64_t)[v11 code]);

    if ((id)-[TCCDRequestResult authorizationReason](self, "authorizationReason") == (id)8
      && (id)-[TCCDRequestResult servicePolicyAction](self, "servicePolicyAction") == (id)1)
    {
      id v12 = objc_claimAutoreleasedReturnValue( -[TCCDRequestResult servicePolicyActionDescription]( self, "servicePolicyActionDescription"));
      xpc_dictionary_set_string(xdict, "auth_abort_description", (const char *)[v12 UTF8String]);

      id v13 = objc_claimAutoreleasedReturnValue( -[TCCDRequestResult servicePolicyActionKeyName]( self, "servicePolicyActionKeyName"));
      xpc_dictionary_set_string(xdict, "auth_abort_key", (const char *)[v13 UTF8String]);
    }
  }
}

- (unint64_t)authorizationValue
{
  return self->_authorizationValue;
}

- (void)setAuthorizationValue:(unint64_t)a3
{
  self->_authorizationValue = a3;
}

- (unint64_t)authorizationReason
{
  return self->_authorizationReason;
}

- (void)setAuthorizationReason:(unint64_t)a3
{
  self->_authorizationReason = a3;
}

- (unint64_t)authorizationVersion
{
  return self->_authorizationVersion;
}

- (void)setAuthorizationVersion:(unint64_t)a3
{
  self->_authorizationVersion = a3;
}

- (unint64_t)previousAuthorization
{
  return self->_previousAuthorization;
}

- (void)setPreviousAuthorization:(unint64_t)a3
{
  self->_previousAuthorization = a3;
}

- (int)v1AuthorizationUpgrade
{
  return self->_v1AuthorizationUpgrade;
}

- (void)setV1AuthorizationUpgrade:(int)a3
{
  self->_v1AuthorizationUpgrade = a3;
}

- (unint64_t)v1AuthorizationValue
{
  return self->_v1AuthorizationValue;
}

- (void)setV1AuthorizationValue:(unint64_t)a3
{
  self->_v1AuthorizationValue = a3;
}

- (unint64_t)v1AuthorizationReason
{
  return self->_v1AuthorizationReason;
}

- (void)setV1AuthorizationReason:(unint64_t)a3
{
  self->_v1AuthorizationReason = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int64_t)servicePolicyAction
{
  return self->_servicePolicyAction;
}

- (void)setServicePolicyAction:(int64_t)a3
{
  self->_servicePolicyAction = a3;
}

- (NSString)servicePolicyActionDescription
{
  return self->_servicePolicyActionDescription;
}

- (void)setServicePolicyActionDescription:(id)a3
{
}

- (NSString)servicePolicyActionKeyName
{
  return self->_servicePolicyActionKeyName;
}

- (void)setServicePolicyActionKeyName:(id)a3
{
}

- (int)replyNoCacheAuthorization
{
  return self->_replyNoCacheAuthorization;
}

- (void)setReplyNoCacheAuthorization:(int)a3
{
  self->_replyNoCacheAuthorization = a3;
}

- (int64_t)databaseAction
{
  return self->_databaseAction;
}

- (void)setDatabaseAction:(int64_t)a3
{
  self->_databaseAction = a3;
}

- (int)doUpdateOfSubjectVerifierData
{
  return self->_doUpdateOfSubjectVerifierData;
}

- (void)setDoUpdateOfSubjectVerifierData:(int)a3
{
  self->_doUpdateOfSubjectVerifierData = a3;
}

- (unsigned)databaseFlags
{
  return self->_databaseFlags;
}

- (void)setDatabaseFlags:(unsigned int)a3
{
  self->_databaseFlags = a3;
}

- (int)lastReminderTime
{
  return self->_lastReminderTime;
}

- (void)setLastReminderTime:(int)a3
{
  self->_lastReminderTime = a3;
}

- (int64_t)promptType
{
  return self->_promptType;
}

- (void)setPromptType:(int64_t)a3
{
  self->_promptType = a3;
}

- (void).cxx_destruct
{
}

@end