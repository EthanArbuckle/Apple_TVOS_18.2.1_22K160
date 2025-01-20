@interface IDSPhoneUserCredential
- (IDSPhoneUserCredential)initWithSMSSignature:(id)a3;
- (NSString)smsSignature;
- (int64_t)realm;
@end

@implementation IDSPhoneUserCredential

- (IDSPhoneUserCredential)initWithSMSSignature:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___IDSPhoneUserCredential;
    v6 = -[IDSPhoneUserCredential init](&v10, "init");
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_smsSignature, a3);
    }
    self = v7;
    v8 = self;
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (int64_t)realm
{
  return 0LL;
}

- (NSString)smsSignature
{
  return self->_smsSignature;
}

- (void).cxx_destruct
{
}

@end