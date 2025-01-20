@interface MSDSessionHubTrustEvaluate
- (BOOL)isHubCertificatePinnedTo:(__SecCertificate *)a3 applePKI:(BOOL)a4;
- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4;
@end

@implementation MSDSessionHubTrustEvaluate

- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSDSessionHubTrustEvaluate;
  if (-[MSDSessionBaseTrustEvaluate trustServer:isRedirect:](&v7, "trustServer:isRedirect:", a3, a4)
    || -[MSDSessionBaseTrustEvaluate isDone](self, "isDone")
    || (BOOL v5 = -[MSDSessionHubTrustEvaluate isHubCertificatePinnedTo:applePKI:]( self,  "isHubCertificatePinnedTo:applePKI:",  -[MSDSessionBaseTrustEvaluate leafCertificate](self, "leafCertificate"),  -[MSDSessionBaseTrustEvaluate applePKI](self, "applePKI"))))
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)isHubCertificatePinnedTo:(__SecCertificate *)a3 applePKI:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](&OBJC_CLASS___MSDTargetDevice, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 hubCertificateIdentifier]);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionBaseTrustEvaluate identifierFor:applePKI:](self, "identifierFor:applePKI:", a3, v4));
  if (v9) {
    unsigned __int8 v10 = [v8 isEqualToString:v9];
  }
  else {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

@end