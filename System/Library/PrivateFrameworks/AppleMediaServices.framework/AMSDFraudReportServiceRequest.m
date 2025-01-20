@interface AMSDFraudReportServiceRequest
- (AMSDFraudReportServiceRequest)initWithNameSpace:(id)a3 reportedScore:(unsigned __int8)a4 blindedMessage:(id)a5 keyID:(id)a6 authenticationTokenType:(unint64_t)a7 shouldIncludeODIAssessment:(BOOL)a8;
- (BOOL)shouldIncludeODIAssessment;
- (NSString)blindedMessage;
- (NSString)keyID;
- (NSString)nameSpace;
- (unint64_t)authenticationTokenType;
- (unsigned)reportedScore;
@end

@implementation AMSDFraudReportServiceRequest

- (AMSDFraudReportServiceRequest)initWithNameSpace:(id)a3 reportedScore:(unsigned __int8)a4 blindedMessage:(id)a5 keyID:(id)a6 authenticationTokenType:(unint64_t)a7 shouldIncludeODIAssessment:(BOOL)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  if (v14 && v15)
  {
    v17 = v16;
    v29.receiver = self;
    v29.super_class = (Class)&OBJC_CLASS___AMSDFraudReportServiceRequest;
    v18 = -[AMSDFraudReportServiceRequest init](&v29, "init");
    if (v18)
    {
      v19 = (NSString *)[v14 copy];
      nameSpace = v18->_nameSpace;
      v18->_nameSpace = v19;

      v18->_reportedScore = a4;
      v21 = (NSString *)[v15 copy];
      blindedMessage = v18->_blindedMessage;
      v18->_blindedMessage = v21;

      v23 = (NSString *)[v17 copy];
      keyID = v18->_keyID;
      v18->_keyID = v23;

      v18->_authenticationTokenType = a7;
      v18->_shouldIncludeODIAssessment = a8;
    }

    return v18;
  }

  else
  {
    id v26 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"nameSpace, reportedScore, blindedMessage, keyID and grandSlamTokenIdentifier all must be nonnull",  0LL));
    objc_exception_throw(v26);
    return (AMSDFraudReportServiceRequest *)-[AMSDFraudReportServiceRequest nameSpace](v27, v28);
  }

- (NSString)nameSpace
{
  return self->_nameSpace;
}

- (unsigned)reportedScore
{
  return self->_reportedScore;
}

- (NSString)blindedMessage
{
  return self->_blindedMessage;
}

- (NSString)keyID
{
  return self->_keyID;
}

- (unint64_t)authenticationTokenType
{
  return self->_authenticationTokenType;
}

- (BOOL)shouldIncludeODIAssessment
{
  return self->_shouldIncludeODIAssessment;
}

- (void).cxx_destruct
{
}

@end