@interface NIServerVisionInternalSessionRequest
- (NIServerVisionInternalSessionRequest)initWithIdentifier:(id)a3 observer:(id)a4;
- (void)dealloc;
@end

@implementation NIServerVisionInternalSessionRequest

- (NIServerVisionInternalSessionRequest)initWithIdentifier:(id)a3 observer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn( "-[NIServerVisionInternalSessionRequest initWithIdentifier:observer:]",  "NIServerVisionInternalSession.mm",  222,  "identifier");
  }
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NIServerVisionInternalSessionRequest;
  v9 = -[NIServerVisionInternalSessionRequest init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeWeak((id *)&v10->_observer, v8);
  }

  return v10;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NIServerVisionInternalSessionRequest;
  -[NIServerVisionInternalSessionRequest dealloc](&v2, "dealloc");
}

- (void).cxx_destruct
{
}

@end