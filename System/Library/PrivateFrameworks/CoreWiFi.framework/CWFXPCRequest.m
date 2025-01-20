@interface CWFXPCRequest
- (BOOL)didSendResponse;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isSubrequest;
- (CWFRequestParameters)requestParameters;
- (CWFXPCRequest)init;
- (NSDate)receivedAt;
- (NSDictionary)info;
- (NSUUID)UUID;
- (id)description;
- (id)response;
- (int64_t)type;
- (void)setDidSendResponse:(BOOL)a3;
- (void)setInfo:(id)a3;
- (void)setIsSubrequest:(BOOL)a3;
- (void)setReceivedAt:(id)a3;
- (void)setRequestParameters:(id)a3;
- (void)setResponse:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUUID:(id)a3;
@end

@implementation CWFXPCRequest

- (CWFXPCRequest)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CWFXPCRequest;
  v6 = -[NSBlockOperation init](&v10, sel_init);
  if (v6)
  {
    uint64_t v7 = objc_msgSend_UUID(MEMORY[0x189607AB8], v2, v3, v4, v5);
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;
  }

  return v6;
}

- (void)setResponse:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = sub_1864EEE8C;
  v8[3] = &unk_189E5C608;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  v6 = (void *)MEMORY[0x186E3B038](v8);
  id response = self->_response;
  self->_id response = v6;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)description
{
  v6 = (void *)NSString;
  sub_1864504C4(self->_type, a2, v2, v3, v4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(self->_requestParameters, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)@"[%@] %@", v14, v15, v7, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isExecuting
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CWFXPCRequest;
  if (-[NSOperation isExecuting](&v10, sel_isExecuting))
  {
    LOBYTE(v3) = 1;
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___CWFXPCRequest;
    unsigned int v3 = -[NSOperation isFinished](&v9, sel_isFinished);
    if (v3) {
      LOBYTE(v3) = objc_msgSend_didSendResponse(self, v4, v5, v6, v7) ^ 1;
    }
  }

  return v3;
}

- (BOOL)isFinished
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CWFXPCRequest;
  unsigned int v3 = -[NSOperation isFinished](&v9, sel_isFinished);
  if (v3) {
    LOBYTE(v3) = objc_msgSend_didSendResponse(self, v4, v5, v6, v7);
  }
  return v3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (CWFRequestParameters)requestParameters
{
  return self->_requestParameters;
}

- (void)setRequestParameters:(id)a3
{
}

- (NSDate)receivedAt
{
  return self->_receivedAt;
}

- (void)setReceivedAt:(id)a3
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (id)response
{
  return self->_response;
}

- (BOOL)isSubrequest
{
  return self->_isSubrequest;
}

- (void)setIsSubrequest:(BOOL)a3
{
  self->_isSubrequest = a3;
}

- (BOOL)didSendResponse
{
  return self->_didSendResponse;
}

- (void)setDidSendResponse:(BOOL)a3
{
  self->_didSendResponse = a3;
}

- (void).cxx_destruct
{
}

@end