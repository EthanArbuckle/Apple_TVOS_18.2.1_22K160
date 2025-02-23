@interface RSABSSATokenReady
- (NSData)keyId;
- (NSData)signature;
- (NSData)tokenContent;
- (RSABSSATokenReady)initWithTokenContent:(id)a3 tokenSignature:(id)a4 keyId:(id)a5;
@end

@implementation RSABSSATokenReady

- (RSABSSATokenReady)initWithTokenContent:(id)a3 tokenSignature:(id)a4 keyId:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RSABSSATokenReady;
  v12 = -[RSABSSATokenReady init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keyId, a5);
    objc_storeStrong((id *)&v13->_signature, a4);
    objc_storeStrong((id *)&v13->_tokenContent, a3);
  }

  return v13;
}

- (NSData)tokenContent
{
  return self->_tokenContent;
}

- (NSData)keyId
{
  return self->_keyId;
}

- (NSData)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
}

@end