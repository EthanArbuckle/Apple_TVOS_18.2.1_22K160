@interface KVACAwaitingActivation
- (KVACAwaitingActivation)initWithTokenChallenge:(id)a3 error:(id *)a4;
- (NSData)requestData;
- (_TtC16CryptoKitPrivate10KVACClient)client;
- (_TtC16CryptoKitPrivate18KVACRequestWrapper)request;
- (id)activateWithIssuanceData:(id)a3 error:(id *)a4;
@end

@implementation KVACAwaitingActivation

- (KVACAwaitingActivation)initWithTokenChallenge:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___KVACAwaitingActivation;
  v7 = -[KVACAwaitingActivation init](&v17, sel_init);
  if (v7)
  {
    v8 = -[KVACClient initWithTokenChallenge:error:]( objc_alloc(&OBJC_CLASS____TtC16CryptoKitPrivate10KVACClient),  "initWithTokenChallenge:error:",  v6,  a4);
    client = v7->_client;
    v7->_client = v8;

    -[KVACClient makeRequestAndReturnError:](v7->_client, "makeRequestAndReturnError:", a4);
    v10 = (_TtC16CryptoKitPrivate18KVACRequestWrapper *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      [MEMORY[0x189607870] errorWithDomain:@"com.apple.cryptokit.KVAC.error" code:0 userInfo:0];
      v15 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }

    request = v7->_request;
    v7->_request = v10;
    v12 = v10;

    uint64_t v13 = -[KVACRequestWrapper requestData](v12, "requestData");
    requestData = v7->_requestData;
    v7->_requestData = (NSData *)v13;
  }

  v15 = v7;
LABEL_6:

  return v15;
}

- (id)activateWithIssuanceData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[KVACCredential initWithIssuanceData:client:request:error:]( objc_alloc(&OBJC_CLASS___KVACCredential),  "initWithIssuanceData:client:request:error:",  v6,  self->_client,  self->_request,  a4);

  if (v7)
  {
    [@"Test tag prefix" dataUsingEncoding:4];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[KVACPresentation initWithCredential:tagPrefix:error:]( objc_alloc(&OBJC_CLASS___KVACPresentation),  "initWithCredential:tagPrefix:error:",  v7,  v8,  a4);
    if (!v9)
    {
      [MEMORY[0x189607870] errorWithDomain:@"com.apple.cryptokit.KVAC.error" code:2 userInfo:0];
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v10 = 0LL;
      goto LABEL_7;
    }
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:@"com.apple.cryptokit.KVAC.error" code:2 userInfo:0];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  v10 = v7;
LABEL_7:

  return v10;
}

- (NSData)requestData
{
  return self->_requestData;
}

- (_TtC16CryptoKitPrivate10KVACClient)client
{
  return self->_client;
}

- (_TtC16CryptoKitPrivate18KVACRequestWrapper)request
{
  return self->_request;
}

- (void).cxx_destruct
{
}

@end