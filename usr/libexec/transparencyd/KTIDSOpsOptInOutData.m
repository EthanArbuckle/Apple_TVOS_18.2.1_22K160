@interface KTIDSOpsOptInOutData
- (NSData)publicAccountKey;
- (NSNumber)optInStatus;
- (NSString)ktApplication;
- (id)description;
- (void)setKtApplication:(id)a3;
- (void)setOptInStatus:(id)a3;
- (void)setPublicAccountKey:(id)a3;
@end

@implementation KTIDSOpsOptInOutData

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSOpsOptInOutData optInStatus](self, "optInStatus"));
  unsigned int v4 = [v3 BOOLValue];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSOpsOptInOutData publicAccountKey](self, "publicAccountKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<KTIDSOpsOptInOutData: %d publicKey: %@>",  v4,  v6));

  return v7;
}

- (NSData)publicAccountKey
{
  return self->_publicAccountKey;
}

- (void)setPublicAccountKey:(id)a3
{
}

- (NSNumber)optInStatus
{
  return self->_optInStatus;
}

- (void)setOptInStatus:(id)a3
{
}

- (NSString)ktApplication
{
  return self->_ktApplication;
}

- (void)setKtApplication:(id)a3
{
}

- (void).cxx_destruct
{
}

@end