@interface SFHMACOperation
- (SFDigestOperation)digestOperation;
- (SFHMACOperation)init;
- (SFHMACOperation)initWithCoder:(id)a3;
- (SFHMACOperation)initWithDigestOperation:(id)a3;
- (void)setDigestOperation:(id)a3;
@end

@implementation SFHMACOperation

- (SFHMACOperation)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SFHMACOperation initWithDigestOperation:](self, "initWithDigestOperation:", v3);

  return v4;
}

- (SFHMACOperation)initWithDigestOperation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SFHMACOperation;
  v6 = -[SFMessageAuthenticationCodeOperation init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)v6->_hmacOperationInternal + 1, a3);
  }

  return v7;
}

- (SFHMACOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFHMACOperation;
  return -[SFMessageAuthenticationCodeOperation initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (SFDigestOperation)digestOperation
{
  return (SFDigestOperation *)(id)[*((id *)self->_hmacOperationInternal + 1) copyWithZone:0];
}

- (void)setDigestOperation:(id)a3
{
  uint64_t v4 = [a3 copyWithZone:0];
  hmacOperationInternal = self->_hmacOperationInternal;
  v6 = (void *)hmacOperationInternal[1];
  hmacOperationInternal[1] = v4;
}

- (void).cxx_destruct
{
}

@end