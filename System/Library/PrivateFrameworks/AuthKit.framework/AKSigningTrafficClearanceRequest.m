@interface AKSigningTrafficClearanceRequest
- (AKClient)client;
- (AKSigningTrafficClearanceRequest)initWithClient:(id)a3 signingBlock:(id)a4;
- (BOOL)shouldProvisionIfNeccessary;
- (NSDate)requestDate;
- (id)description;
- (id)signingBlock;
- (unsigned)requestQosClass;
- (void)setShouldProvisionIfNeccessary:(BOOL)a3;
@end

@implementation AKSigningTrafficClearanceRequest

- (AKSigningTrafficClearanceRequest)initWithClient:(id)a3 signingBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___AKSigningTrafficClearanceRequest;
  v9 = -[AKSigningTrafficClearanceRequest init](&v15, "init");
  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    requestDate = v9->_requestDate;
    v9->_requestDate = (NSDate *)v10;

    v9->_requestQosClass = qos_class_self();
    id v12 = objc_retainBlock(v8);
    id signingBlock = v9->_signingBlock;
    v9->_id signingBlock = v12;

    objc_storeStrong((id *)&v9->_client, a3);
  }

  return v9;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AKClient name](self->_client, "name"));
  requestDate = self->_requestDate;
  if (self->_shouldProvisionIfNeccessary) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_requestQosClass));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p : %@ : %@> provisioning desired: %@, request qos: %@",  v5,  self,  v6,  requestDate,  v8,  v9));

  return v10;
}

- (AKClient)client
{
  return self->_client;
}

- (unsigned)requestQosClass
{
  return self->_requestQosClass;
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (id)signingBlock
{
  return self->_signingBlock;
}

- (BOOL)shouldProvisionIfNeccessary
{
  return self->_shouldProvisionIfNeccessary;
}

- (void)setShouldProvisionIfNeccessary:(BOOL)a3
{
  self->_shouldProvisionIfNeccessary = a3;
}

- (void).cxx_destruct
{
}

@end