@interface EscrowCertificateResponse
- (NSData)cert;
- (NSString)dsid;
- (id)description;
- (int64_t)clubID;
@end

@implementation EscrowCertificateResponse

- (NSData)cert
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"clubCert"]);

  if (v3) {
    v4 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v3,  0LL);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (NSString)dsid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LakituResponse responseDictionary](self, "responseDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"dsid"]);

  return (NSString *)v3;
}

- (id)description
{
  v4 = (const __CFData *)objc_claimAutoreleasedReturnValue(-[EscrowCertificateResponse cert](self, "cert"));
  if (v4 && (v5 = SecCertificateCreateWithData(0LL, v4)) != 0LL)
  {
    v6 = v5;
    CFDataRef v7 = SecCertificateCopySerialNumberData(v5, 0LL);
    v8 = (void *)SecCertificateCopySHA256Digest(v6);
    CFRelease(v6);
  }

  else
  {
    CFDataRef v7 = 0LL;
    v8 = 0LL;
  }

  v9 = (objc_class *)objc_opt_class(self, v3);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData debugDescription](v7, "debugDescription"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 debugDescription]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[EscrowCertificateResponse dsid](self, "dsid"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p>{serial = %@, digest = %@, dsid = %@}",  v11,  self,  v12,  v13,  v14));

  return v15;
}

- (int64_t)clubID
{
  return self->_clubID;
}

@end