@interface MCCertificateWrapperProfileHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
@end

@implementation MCCertificateWrapperProfileHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MCCertificateWrapperProfileHandler;
  BOOL v7 = -[MCConfigurationProfileHandler installWithInstaller:options:interactionClient:outError:]( &v20,  "installWithInstaller:options:interactionClient:outError:",  a3,  a4,  a5,  a6);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 payloads]);
    id v10 = [v9 count];

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 payloads]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:0]);

      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 type]);
      unsigned int v14 = [v13 isEqualToString:kMCCPPKCS12Type];

      if (v14)
      {
        v15 = (__SecCertificate *)[v12 copyCertificate];
        if (v15)
        {
          v16 = v15;
          v17 = (__CFString *)SecCertificateCopySubjectSummary(v15);
          [v8 setDisplayName:v17];
          v21 = v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v21,  1LL));
          [v8 setSignerCertificates:v18];

          CFRelease(v16);
        }
      }
    }
  }

  return v7;
}

@end