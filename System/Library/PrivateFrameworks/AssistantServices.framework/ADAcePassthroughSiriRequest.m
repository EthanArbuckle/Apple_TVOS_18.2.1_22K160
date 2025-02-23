@interface ADAcePassthroughSiriRequest
+ (BOOL)supportsSecureCoding;
- (ADAcePassthroughSiriRequest)initWithClientBoundCommand:(id)a3;
- (ADAcePassthroughSiriRequest)initWithCoder:(id)a3;
- (id)_ad_preheatableServiceDomainForDomainSignalRequest;
- (id)clientBoundCommand;
- (id)createResponseWithReplyCommand:(id)a3;
- (void)_ad_handleAceDomainSignalRequestWithCompletionHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAcePassthroughSiriRequest

- (ADAcePassthroughSiriRequest)initWithClientBoundCommand:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADAcePassthroughSiriRequest;
  v6 = -[ADAcePassthroughSiriRequest init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientBoundCommand, a3);
  }

  return v7;
}

- (id)clientBoundCommand
{
  return self->_clientBoundCommand;
}

- (id)createResponseWithReplyCommand:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2, self, @"ADAcePassthroughSiriRequest.m", 42, @"Invalid parameter not satisfying: %@", @"replyCommand" object file lineNumber description];
  }

  v6 = -[ADAcePassthroughSiriResponse initWithRequest:replyCommand:]( objc_alloc(&OBJC_CLASS___ADAcePassthroughSiriResponse),  "initWithRequest:replyCommand:",  self,  v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADAcePassthroughSiriRequest;
  id v4 = a3;
  -[ADAcePassthroughSiriRequest encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_clientBoundCommand,  @"AcePassthroughSiriRequestClientBoundCommand",  v5.receiver,  v5.super_class);
}

- (ADAcePassthroughSiriRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ADAcePassthroughSiriRequest;
  objc_super v5 = -[ADAcePassthroughSiriRequest initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(AceObject) forKey:@"AcePassthroughSiriRequestClientBoundCommand"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    clientBoundCommand = v5->_clientBoundCommand;
    v5->_clientBoundCommand = (SABaseClientBoundCommand *)v7;
  }

  return v5;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_ad_preheatableServiceDomainForDomainSignalRequest
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADAcePassthroughSiriRequest clientBoundCommand](self, "clientBoundCommand"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_ad_preheatableDomain"));

  return v3;
}

- (void)_ad_handleAceDomainSignalRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADAcePassthroughSiriRequest clientBoundCommand](self, "clientBoundCommand"));
  objc_msgSend(v5, "_ad_handleAceDomainSignalRequest:completionHandler:", self, v4);
}

@end