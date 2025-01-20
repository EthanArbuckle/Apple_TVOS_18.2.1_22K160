@interface KVACPresentation
- (KVACPresentation)initWithCredential:(id)a3 tagPrefix:(id)a4 error:(id *)a5;
- (NSData)prefix;
- (NSData)presentationData;
- (NSData)serverKeyId;
- (NSData)tag;
@end

@implementation KVACPresentation

- (KVACPresentation)initWithCredential:(id)a3 tagPrefix:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___KVACPresentation;
  v10 = -[KVACPresentation init](&v22, sel_init);
  if (v10)
  {
    [v8 credential];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 makePresentationWithTagPrefix:v9 error:a5];
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      uint64_t v13 = [v12 serverKeyId];
      serverKeyId = v10->_serverKeyId;
      v10->_serverKeyId = (NSData *)v13;

      uint64_t v15 = [v12 tag];
      tag = v10->_tag;
      v10->_tag = (NSData *)v15;

      uint64_t v17 = [v12 prefix];
      prefix = v10->_prefix;
      v10->_prefix = (NSData *)v17;

      uint64_t v19 = [v12 presentationData];
      presentationData = v10->_presentationData;
      v10->_presentationData = (NSData *)v19;
    }

    else
    {
      [MEMORY[0x189607870] errorWithDomain:@"com.apple.cryptokit.KVAC.error" code:3 userInfo:0];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10;
}

- (NSData)serverKeyId
{
  return self->_serverKeyId;
}

- (NSData)tag
{
  return self->_tag;
}

- (NSData)prefix
{
  return self->_prefix;
}

- (NSData)presentationData
{
  return self->_presentationData;
}

- (void).cxx_destruct
{
}

@end