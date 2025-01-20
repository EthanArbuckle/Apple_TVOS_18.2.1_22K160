@interface ATHMTestServer
- (ATHMTestServer)initWithError:(id *)a3;
- (NSData)keyCommitmentsData;
- (_TtC16CryptoKitPrivate10ATHMServer)server;
- (id)readBitWithPresentationData:(id)a3 error:(id *)a4;
- (id)respondWithRequestData:(id)a3 b:(id)a4 error:(id *)a5;
@end

@implementation ATHMTestServer

- (ATHMTestServer)initWithError:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ATHMTestServer;
  v4 = -[ATHMTestServer init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS____TtC16CryptoKitPrivate10ATHMServer);
    server = v4->_server;
    v4->_server = v5;

    uint64_t v7 = -[ATHMServer exportKeyCommitmentsAndReturnError:](v4->_server, "exportKeyCommitmentsAndReturnError:", a3);
    keyCommitmentsData = v4->_keyCommitmentsData;
    v4->_keyCommitmentsData = (NSData *)v7;
  }

  return v4;
}

- (id)respondWithRequestData:(id)a3 b:(id)a4 error:(id *)a5
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:@"com.apple.cryptokit.ATHM.error" code:1 userInfo:0];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)readBitWithPresentationData:(id)a3 error:(id *)a4
{
  return -[ATHMServer readBitWithPresentationData:error:](self->_server, "readBitWithPresentationData:error:", a3, a4);
}

- (NSData)keyCommitmentsData
{
  return self->_keyCommitmentsData;
}

- (_TtC16CryptoKitPrivate10ATHMServer)server
{
  return self->_server;
}

- (void).cxx_destruct
{
}

@end