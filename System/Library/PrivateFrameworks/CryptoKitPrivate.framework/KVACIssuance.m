@interface KVACIssuance
- (KVACIssuance)initWithIssuance:(id)a3;
- (NSData)issuanceData;
- (NSData)keyId;
@end

@implementation KVACIssuance

- (KVACIssuance)initWithIssuance:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___KVACIssuance;
  v5 = -[KVACIssuance init](&v11, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 keyId];
    keyId = v5->_keyId;
    v5->_keyId = (NSData *)v6;

    uint64_t v8 = [v4 issuanceData];
    issuanceData = v5->_issuanceData;
    v5->_issuanceData = (NSData *)v8;
  }

  return v5;
}

- (NSData)keyId
{
  return self->_keyId;
}

- (NSData)issuanceData
{
  return self->_issuanceData;
}

- (void).cxx_destruct
{
}

@end