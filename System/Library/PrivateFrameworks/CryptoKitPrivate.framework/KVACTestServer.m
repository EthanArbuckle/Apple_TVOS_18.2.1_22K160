@interface KVACTestServer
- (BOOL)verifyWithPresentationData:(id)a3 tokenChallenge:(id)a4;
- (KVACTestServer)init;
- (NSData)keyId;
- (_TtC16CryptoKitPrivate10KVACServer)server;
- (id)issueWithRequestData:(id)a3 error:(id *)a4;
@end

@implementation KVACTestServer

- (KVACTestServer)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___KVACTestServer;
  v2 = -[KVACTestServer init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS____TtC16CryptoKitPrivate10KVACServer);
    server = v2->_server;
    v2->_server = v3;

    uint64_t v5 = -[KVACServer keyId](v2->_server, "keyId");
    keyId = v2->_keyId;
    v2->_keyId = (NSData *)v5;
  }

  return v2;
}

- (id)issueWithRequestData:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[KVACIssuance initWithIssuance:](objc_alloc(&OBJC_CLASS___KVACIssuance), "initWithIssuance:", v5);
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:@"com.apple.cryptokit.KVAC.error" code:1 userInfo:0];
    v6 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)verifyWithPresentationData:(id)a3 tokenChallenge:(id)a4
{
  return -[KVACServer verifyWithPresentationData:tokenChallenge:]( self->_server,  "verifyWithPresentationData:tokenChallenge:",  a3,  a4);
}

- (NSData)keyId
{
  return self->_keyId;
}

- (_TtC16CryptoKitPrivate10KVACServer)server
{
  return self->_server;
}

- (void).cxx_destruct
{
}

@end