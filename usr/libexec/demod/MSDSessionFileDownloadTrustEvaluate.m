@interface MSDSessionFileDownloadTrustEvaluate
- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4;
@end

@implementation MSDSessionFileDownloadTrustEvaluate

- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSDSessionFileDownloadTrustEvaluate;
  if (-[MSDSessionBaseTrustEvaluate trustServer:isRedirect:](&v6, "trustServer:isRedirect:", a3, a4)) {
    return 1;
  }
  else {
    return !-[MSDSessionBaseTrustEvaluate isDone](self, "isDone");
  }
}

@end