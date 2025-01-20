@interface ATHMAwaitingActivation
+ (BOOL)verifyKeyCommitmentsData:(id)a3;
- (ATHMAwaitingActivation)initWithKeyCommitmentsData:(id)a3 error:(id *)a4;
- (NSData)requestData;
- (_TtC16CryptoKitPrivate10ATHMClient)client;
- (id)activateWithResponseData:(id)a3 error:(id *)a4;
@end

@implementation ATHMAwaitingActivation

- (ATHMAwaitingActivation)initWithKeyCommitmentsData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ATHMAwaitingActivation;
  v7 = -[ATHMAwaitingActivation init](&v14, sel_init);
  if (v7)
  {
    v8 = -[ATHMClient initWithKeyCommitmentsData:error:]( objc_alloc(&OBJC_CLASS____TtC16CryptoKitPrivate10ATHMClient),  "initWithKeyCommitmentsData:error:",  v6,  a4);
    client = v7->_client;
    v7->_client = v8;

    uint64_t v10 = -[ATHMClient request](v7->_client, "request");
    requestData = v7->_requestData;
    v7->_requestData = (NSData *)v10;

    v12 = v7;
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:@"com.apple.cryptokit.ATHM.error" code:0 userInfo:0];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)activateWithResponseData:(id)a3 error:(id *)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:@"com.apple.cryptokit.ATHM.error" code:2 userInfo:0];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (BOOL)verifyKeyCommitmentsData:(id)a3
{
  return +[ATHMKeyCommitments verifyWithKeyCommitmentsData:]( &OBJC_CLASS____TtC16CryptoKitPrivate18ATHMKeyCommitments,  "verifyWithKeyCommitmentsData:",  a3);
}

- (NSData)requestData
{
  return self->_requestData;
}

- (_TtC16CryptoKitPrivate10ATHMClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

@end