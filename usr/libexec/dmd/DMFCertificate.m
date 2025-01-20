@interface DMFCertificate
- (id)initWithCertificateRef:(__SecCertificate *)a3 isIdentity:(BOOL)a4;
@end

@implementation DMFCertificate

- (id)initWithCertificateRef:(__SecCertificate *)a3 isIdentity:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (void *)SecCertificateCopyCommonNames(a3, a2);
  CFDataRef v8 = SecCertificateCopyData(a3);
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);
  }

  else
  {
    v9 = 0LL;
  }

  v10 = -[DMFCertificate initWithCommonName:data:isIdentity:](self, "initWithCommonName:data:isIdentity:", v9, v8, v4);

  return v10;
}

@end