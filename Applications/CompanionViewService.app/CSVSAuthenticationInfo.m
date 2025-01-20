@interface CSVSAuthenticationInfo
- (CPSDevice)device;
- (CSVSAuthenticationInfo)infoWithAccountDescription:(id)a3;
- (CSVSAuthenticationInfo)infoWithDevice:(id)a3;
- (CSVSAuthenticationInfo)infoWithError:(id)a3;
- (CSVSAuthenticationInfo)infoWithQRCodeImage:(id)a3 qrCodeTitle:(id)a4 qrCodeSubtitle:(id)a5 providerCode:(id)a6;
- (CSVSAuthenticationInfo)initWithAuthType:(int64_t)a3 accountDescription:(id)a4;
- (NSError)error;
- (NSString)accountDescription;
- (NSString)providerCode;
- (NSString)qrCodeSubtitle;
- (NSString)qrCodeTitle;
- (UIImage)qrCodeImage;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)authType;
- (int64_t)authenticationKind;
@end

@implementation CSVSAuthenticationInfo

- (CSVSAuthenticationInfo)initWithAuthType:(int64_t)a3 accountDescription:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CSVSAuthenticationInfo;
  v7 = -[CSVSAuthenticationInfo init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_authType = a3;
    v9 = (NSString *)[v6 copy];
    accountDescription = v8->_accountDescription;
    v8->_accountDescription = v9;
  }

  return v8;
}

- (CSVSAuthenticationInfo)infoWithAccountDescription:(id)a3
{
  id v4 = a3;
  v5 = -[CSVSAuthenticationInfo copy](self, "copy");
  id v6 = [v4 copy];

  v7 = (void *)v5[6];
  v5[6] = v6;

  return (CSVSAuthenticationInfo *)v5;
}

- (CSVSAuthenticationInfo)infoWithDevice:(id)a3
{
  id v4 = a3;
  v5 = -[CSVSAuthenticationInfo copy](self, "copy");
  id v6 = [v4 copy];

  v7 = (void *)v5[7];
  v5[7] = v6;

  return (CSVSAuthenticationInfo *)v5;
}

- (CSVSAuthenticationInfo)infoWithError:(id)a3
{
  id v4 = a3;
  v5 = -[CSVSAuthenticationInfo copy](self, "copy");
  id v6 = [v4 copy];

  v7 = (void *)v5[8];
  v5[8] = v6;

  return (CSVSAuthenticationInfo *)v5;
}

- (CSVSAuthenticationInfo)infoWithQRCodeImage:(id)a3 qrCodeTitle:(id)a4 qrCodeSubtitle:(id)a5 providerCode:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = -[CSVSAuthenticationInfo copy](self, "copy");
  v15 = (void *)v14[1];
  v14[1] = v10;
  id v16 = v10;

  v17 = (void *)v14[2];
  v14[2] = v11;
  id v18 = v11;

  v19 = (void *)v14[3];
  v14[3] = v12;
  id v20 = v12;

  v21 = (void *)v14[4];
  v14[4] = v13;

  return (CSVSAuthenticationInfo *)v14;
}

- (int64_t)authenticationKind
{
  unint64_t v2 = self->_authType - 1;
  if (v2 > 0xC) {
    return 3LL;
  }
  else {
    return qword_10001C918[v2];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(&OBJC_CLASS___CSVSAuthenticationInfo);
  v4->_authType = self->_authType;
  v5 = (NSString *)-[NSString copy](self->_accountDescription, "copy");
  accountDescription = v4->_accountDescription;
  v4->_accountDescription = v5;

  v7 = (CPSDevice *)-[CPSDevice copy](self->_device, "copy");
  device = v4->_device;
  v4->_device = v7;

  v9 = (NSError *)-[NSError copy](self->_error, "copy");
  error = v4->_error;
  v4->_error = v9;

  id v11 = (UIImage *)-[UIImage copy](self->_qrCodeImage, "copy");
  qrCodeImage = v4->_qrCodeImage;
  v4->_qrCodeImage = v11;

  id v13 = (NSString *)-[NSString copy](self->_qrCodeSubtitle, "copy");
  qrCodeSubtitle = v4->_qrCodeSubtitle;
  v4->_qrCodeSubtitle = v13;

  v15 = (NSString *)-[NSString copy](self->_qrCodeTitle, "copy");
  qrCodeTitle = v4->_qrCodeTitle;
  v4->_qrCodeTitle = v15;

  v17 = (NSString *)-[NSString copy](self->_providerCode, "copy");
  providerCode = v4->_providerCode;
  v4->_providerCode = v17;

  return v4;
}

- (UIImage)qrCodeImage
{
  return self->_qrCodeImage;
}

- (NSString)qrCodeTitle
{
  return self->_qrCodeTitle;
}

- (NSString)qrCodeSubtitle
{
  return self->_qrCodeSubtitle;
}

- (NSString)providerCode
{
  return self->_providerCode;
}

- (int64_t)authType
{
  return self->_authType;
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (CPSDevice)device
{
  return self->_device;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end