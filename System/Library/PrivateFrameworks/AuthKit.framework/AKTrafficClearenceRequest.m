@interface AKTrafficClearenceRequest
- (AKAuthenticatedServerRequest)context;
- (AKAuthenticationContext_Internal)authContext;
- (AKTrafficClearenceRequest)init;
- (NSDate)requestDate;
- (NSString)clientBundleID;
- (id)clearanceHandler;
- (id)description;
- (unsigned)requestQosClass;
- (void)setAuthContext:(id)a3;
- (void)setClearanceHandler:(id)a3;
- (void)setClientBundleID:(id)a3;
- (void)setContext:(id)a3;
- (void)setRequestDate:(id)a3;
@end

@implementation AKTrafficClearenceRequest

- (AKTrafficClearenceRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AKTrafficClearenceRequest;
  v2 = -[AKTrafficClearenceRequest init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    requestDate = v2->_requestDate;
    v2->_requestDate = (NSDate *)v3;

    v2->_requestQosClass = qos_class_self();
  }

  return v2;
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  context = self->_context;
  clientBundleID = self->_clientBundleID;
  requestDate = self->_requestDate;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_requestQosClass));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p : %@> context %@, requested by %@, qos: %@",  v5,  self,  requestDate,  context,  clientBundleID,  v9));

  return v10;
}

- (AKAuthenticatedServerRequest)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (AKAuthenticationContext_Internal)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (id)clearanceHandler
{
  return self->_clearanceHandler;
}

- (void)setClearanceHandler:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
}

- (unsigned)requestQosClass
{
  return self->_requestQosClass;
}

- (void).cxx_destruct
{
}

@end