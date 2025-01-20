@interface MCDomainsPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
@end

@implementation MCDomainsPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 restrictions]);
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesForFeature:withRestrictionsDictionary:",  MCFeatureCrossSiteTrackingPreventionRelaxedDomains,  v10));
  uint64_t v12 = objc_claimAutoreleasedReturnValue( +[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:]( &OBJC_CLASS___MCRestrictionManager,  "intersectedValuesForFeature:withRestrictionsDictionary:",  MCFeatureCrossSiteTrackingPreventionRelaxedApps,  v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:kMCInstallProfileOptionIsInstalledByMDM]);

  unsigned __int8 v14 = [v13 BOOLValue];
  v15 = 0LL;
  if (v11 | v12 && (v14 & 1) == 0) {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCInstaller notInstalledByMDMError](&OBJC_CLASS___MCInstaller, "notInstalledByMDMError"));
  }

  if (a6 && v15) {
    *a6 = v15;
  }

  return v15 == 0LL;
}

@end