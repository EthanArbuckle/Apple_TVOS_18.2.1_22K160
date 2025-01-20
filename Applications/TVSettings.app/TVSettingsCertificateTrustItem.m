@interface TVSettingsCertificateTrustItem
- (BOOL)isRestricted;
- (BOOL)isTrusted;
- (NSString)displayName;
- (__SecCertificate)cert;
- (void)setCert:(__SecCertificate *)a3;
- (void)setDisplayName:(id)a3;
- (void)setRestricted:(BOOL)a3;
- (void)setTrusted:(BOOL)a3;
@end

@implementation TVSettingsCertificateTrustItem

- (BOOL)isTrusted
{
  CFTypeRef cf = 0LL;
  uint64_t v3 = SecTrustStoreForDomain(2LL, a2);
  int v4 = SecTrustStoreCopyUsageConstraints(v3, -[TVSettingsCertificateTrustItem cert](self, "cert"), &cf);
  BOOL v5 = 0;
  if (!v4 && cf)
  {
    BOOL v5 = [(id)cf count] == 0;
    CFRelease(cf);
  }

  return v5;
}

- (void)setTrusted:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = SecTrustStoreForDomain(2LL, a2);
    SecTrustStoreSetTrustSettings(v4, -[TVSettingsCertificateTrustItem cert](self, "cert"), 0LL);
  }

  else
  {
    SecPolicyRef SSL = SecPolicyCreateSSL(1u, 0LL);
    if (SSL)
    {
      SecPolicyRef v6 = SSL;
      v14[0] = @"kSecTrustSettingsPolicy";
      v14[1] = @"kSecTrustSettingsResult";
      v15[0] = SSL;
      v15[1] = &off_1001ACE58;
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
      v16[0] = v7;
      v12 = @"kSecTrustSettingsResult";
      v13 = &off_1001ACE70;
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
      v16[1] = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v16, 2LL));

      uint64_t v11 = SecTrustStoreForDomain(2LL, v10);
      SecTrustStoreSetTrustSettings(v11, -[TVSettingsCertificateTrustItem cert](self, "cert"), v9);
      CFRelease(v6);
    }
  }

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (__SecCertificate)cert
{
  return self->_cert;
}

- (void)setCert:(__SecCertificate *)a3
{
  self->_cert = a3;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (void)setRestricted:(BOOL)a3
{
  self->_restricted = a3;
}

- (void).cxx_destruct
{
}

@end