@interface TKTokenKeyExchangeParameters
- (NSData)sharedInfo;
- (NSInteger)requestedSize;
- (TKTokenKeyExchangeParameters)initWithParameters:(id)a3;
@end

@implementation TKTokenKeyExchangeParameters

- (TKTokenKeyExchangeParameters)initWithParameters:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TKTokenKeyExchangeParameters;
  v5 = -[TKTokenKeyExchangeParameters init](&v11, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    [v4 objectForKeyedSubscript:*MEMORY[0x18960BD78]];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_requestedSize = [v7 integerValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x18960BD80]];
    sharedInfo = v6->_sharedInfo;
    v6->_sharedInfo = (NSData *)v8;
  }

  return v6;
}

- (NSInteger)requestedSize
{
  return self->_requestedSize;
}

- (NSData)sharedInfo
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end