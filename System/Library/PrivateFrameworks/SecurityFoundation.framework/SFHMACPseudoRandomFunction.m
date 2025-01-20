@interface SFHMACPseudoRandomFunction
+ (BOOL)supportsSecureCoding;
- (SFDigestOperation)digestOperation;
- (SFHMACPseudoRandomFunction)init;
- (SFHMACPseudoRandomFunction)initWithCoder:(id)a3;
- (SFHMACPseudoRandomFunction)initWithDigestOperation:(id)a3;
- (id)generateBytesWithLength:(int64_t)a3 key:(id)a4 error:(id)a5;
- (void)setDigestOperation:(id)a3;
@end

@implementation SFHMACPseudoRandomFunction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFHMACPseudoRandomFunction)init
{
  v3 = objc_alloc_init(&OBJC_CLASS____SFSHA256DigestOperation);
  v4 = -[SFHMACPseudoRandomFunction initWithDigestOperation:](self, "initWithDigestOperation:", v3);

  return v4;
}

- (SFHMACPseudoRandomFunction)initWithDigestOperation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SFHMACPseudoRandomFunction;
  v6 = -[SFHMACPseudoRandomFunction init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)v6->_hmacPseudoRandomFunctionInternal + 1, a3);
  }

  return v7;
}

- (SFHMACPseudoRandomFunction)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SFHMACPseudoRandomFunction;
  return -[SFHMACPseudoRandomFunction init](&v4, sel_init, a3);
}

- (id)generateBytesWithLength:(int64_t)a3 key:(id)a4 error:(id)a5
{
  return 0LL;
}

- (SFDigestOperation)digestOperation
{
  return (SFDigestOperation *)(id)[*((id *)self->_hmacPseudoRandomFunctionInternal + 1) copyWithZone:0];
}

- (void)setDigestOperation:(id)a3
{
  uint64_t v4 = [a3 copyWithZone:0];
  hmacPseudoRandomFunctionInternal = self->_hmacPseudoRandomFunctionInternal;
  v6 = (void *)hmacPseudoRandomFunctionInternal[1];
  hmacPseudoRandomFunctionInternal[1] = v4;
}

- (void).cxx_destruct
{
}

@end