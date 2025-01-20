@interface TDMTestServer
- (BOOL)validateOutput:(id)a3 TID:(id)a4;
- (TDMTestServer)init;
- (_TtC16CryptoKitPrivate9TDMServer)tdmServer;
- (id)FSR;
- (id)evaluate:(id)a3 error:(id *)a4;
- (id)publicKey;
@end

@implementation TDMTestServer

- (id)publicKey
{
  return -[TDMServer publicKey](self->_tdmServer, "publicKey");
}

- (TDMTestServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TDMTestServer;
  v2 = -[TDMTestServer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS____TtC16CryptoKitPrivate9TDMServer);
    tdmServer = v2->_tdmServer;
    v2->_tdmServer = v3;
  }

  return v2;
}

- (id)evaluate:(id)a3 error:(id *)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(&OBJC_CLASS___TDMEvaluation);
    [v4 evaluatedElement];
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 proof];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TDMEvaluation initWithEvaluatedElement:proof:](v5, "initWithEvaluatedElement:proof:", v6, v7);
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)FSR
{
  return -[TDMServer info](self->_tdmServer, "info");
}

- (BOOL)validateOutput:(id)a3 TID:(id)a4
{
  tdmServer = self->_tdmServer;
  id v7 = a4;
  id v8 = a3;
  v9 = -[TDMTestServer FSR](self, "FSR");
  LOBYTE(tdmServer) = -[TDMServer verifyTokenWithOutput:TID:FSR:]( tdmServer,  "verifyTokenWithOutput:TID:FSR:",  v8,  v7,  v9);

  return (char)tdmServer;
}

- (_TtC16CryptoKitPrivate9TDMServer)tdmServer
{
  return self->_tdmServer;
}

- (void).cxx_destruct
{
}

@end