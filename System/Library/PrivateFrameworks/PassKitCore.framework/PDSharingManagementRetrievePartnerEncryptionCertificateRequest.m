@interface PDSharingManagementRetrievePartnerEncryptionCertificateRequest
- (NSString)passSerialNumber;
- (id)urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setPassSerialNumber:(id)a3;
@end

@implementation PDSharingManagementRetrievePartnerEncryptionCertificateRequest

- (id)urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v21[0] = @"devices";
  v21[1] = a4;
  v21[2] = @"passes";
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingManagementRequest regionIdentifier](self, "regionIdentifier"));
  passSerialNumber = self->_passSerialNumber;
  v21[3] = v11;
  v21[4] = passSerialNumber;
  v21[5] = @"partnerEncryptionCertificate";
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 6LL));

  v14 = (void *)objc_claimAutoreleasedReturnValue( -[PDSharingManagementRetrievePartnerEncryptionCertificateRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:]( self,  "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:",  v10,  v13,  0LL,  v8));
  [v14 setHTTPMethod:@"POST"];
  [v14 setCachePolicy:0];
  v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

  id v17 = objc_msgSend((id)objc_opt_class(self, v16), "_HTTPBodyWithDictionary:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  [v14 setHTTPBody:v18];

  id v19 = [v14 copy];
  return v19;
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
}

@end