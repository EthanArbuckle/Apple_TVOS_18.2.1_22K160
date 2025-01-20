@interface MCNewChaperonePayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (BOOL)isInstalled;
- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4;
@end

@implementation MCNewChaperonePayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  if (a6)
  {
    uint64_t v7 = MCInstallationErrorDomain;
    uint64_t v8 = MCErrorArray(@"ERROR_INVALID_SUPERVISION");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v7,  4024LL,  v9,  MCErrorTypeFatal,  0LL));
  }

  return 0;
}

- (BOOL)isInstalled
{
  return 1;
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
}

@end