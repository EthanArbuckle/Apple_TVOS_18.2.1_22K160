@interface PDSharingManagementRetrievePartnerEncryptionCertificateResponse
- (NSArray)supportedEncryptionSchemes;
- (NSData)certificate;
- (PDSharingManagementRetrievePartnerEncryptionCertificateResponse)initWithData:(id)a3;
@end

@implementation PDSharingManagementRetrievePartnerEncryptionCertificateResponse

- (PDSharingManagementRetrievePartnerEncryptionCertificateResponse)initWithData:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___PDSharingManagementRetrievePartnerEncryptionCertificateResponse;
  v3 = -[PDSharingManagementRetrievePartnerEncryptionCertificateResponse initWithData:](&v26, "initWithData:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingManagementRetrievePartnerEncryptionCertificateResponse JSONObject](v3, "JSONObject"));
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      v8 = objc_alloc(&OBJC_CLASS___NSData);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v5 PKStringForKey:@"certificate"]);
      v10 = -[NSData initWithBase64EncodedString:options:](v8, "initWithBase64EncodedString:options:", v9, 0LL);
      certificate = v4->_certificate;
      v4->_certificate = v10;

      id v13 = objc_msgSend( v5,  "PKArrayContaining:forKey:",  objc_opt_class(NSString, v12),  @"supportedEncryptionSchemes");
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
      supportedEncryptionSchemes = v4->_supportedEncryptionSchemes;
      v4->_supportedEncryptionSchemes = (NSArray *)v14;

      if (v4->_certificate && v4->_supportedEncryptionSchemes) {
        goto LABEL_10;
      }
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (objc_class *)objc_opt_class(v5, v18);
        v20 = NSStringFromClass(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v23 = (void *)objc_opt_class(v4, v22);
        *(_DWORD *)buf = 138543618;
        v28 = v21;
        __int16 v29 = 2112;
        v30 = v23;
        id v24 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Malformed response: expected dictionary and received %{public}@ inside %@",  buf,  0x16u);
      }
    }

    v4 = 0LL;
LABEL_10:
  }

  return v4;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (NSArray)supportedEncryptionSchemes
{
  return self->_supportedEncryptionSchemes;
}

- (void).cxx_destruct
{
}

@end