@interface AMSDFraudReportBlindedTransaction
- (AMSDFraudReportBlindedTransaction)initWithTDMToken:(id)a3 pks:(id)a4 keyID:(id)a5;
- (NSData)pks;
- (NSString)blindedMessage;
- (NSString)keyID;
- (TDMToken)tdmToken;
@end

@implementation AMSDFraudReportBlindedTransaction

- (AMSDFraudReportBlindedTransaction)initWithTDMToken:(id)a3 pks:(id)a4 keyID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9 && v10)
  {
    v12 = v11;
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___AMSDFraudReportBlindedTransaction;
    v13 = -[AMSDFraudReportBlindedTransaction init](&v26, "init");
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_tdmToken, a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v9 blindedElement]);
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 base64EncodedStringWithOptions:0]);
      blindedMessage = v14->_blindedMessage;
      v14->_blindedMessage = (NSString *)v16;

      uint64_t v18 = objc_claimAutoreleasedReturnValue([v12 base64EncodedStringWithOptions:0]);
      keyID = v14->_keyID;
      v14->_keyID = (NSString *)v18;

      v20 = (NSData *)[v10 copy];
      pks = v14->_pks;
      v14->_pks = v20;
    }

    return v14;
  }

  else
  {
    id v23 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"tdmToken and pks must both be non-nil",  0LL));
    objc_exception_throw(v23);
    return (AMSDFraudReportBlindedTransaction *)-[AMSDFraudReportBlindedTransaction tdmToken](v24, v25);
  }

- (TDMToken)tdmToken
{
  return self->_tdmToken;
}

- (NSString)blindedMessage
{
  return self->_blindedMessage;
}

- (NSString)keyID
{
  return self->_keyID;
}

- (NSData)pks
{
  return self->_pks;
}

- (void).cxx_destruct
{
}

@end