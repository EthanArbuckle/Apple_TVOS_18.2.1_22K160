@interface MSDSessionEnrollmentTrustEvaluate
- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4;
@end

@implementation MSDSessionEnrollmentTrustEvaluate

- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSDSessionEnrollmentTrustEvaluate;
  if (-[MSDSessionBaseTrustEvaluate trustServer:isRedirect:](&v7, "trustServer:isRedirect:", a3, a4)
    || -[MSDSessionBaseTrustEvaluate isDone](self, "isDone")
    || (BOOL v5 = -[MSDSessionBaseTrustEvaluate saveHubCertificateIdentifer:applePKI:]( self,  "saveHubCertificateIdentifer:applePKI:",  -[MSDSessionBaseTrustEvaluate leafCertificate](self, "leafCertificate"),  -[MSDSessionBaseTrustEvaluate applePKI](self, "applePKI"))))
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

@end