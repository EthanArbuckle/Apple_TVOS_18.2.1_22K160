@interface MIAppIdentity
- (id)resolvePersonaUsingModuleSpecificLogicWithError:(id *)a3;
@end

@implementation MIAppIdentity

- (id)resolvePersonaUsingModuleSpecificLogicWithError:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppIdentity bundleID](self, "bundleID"));
  if ((+[ICLFeatureFlags appReferencesEnabled](&OBJC_CLASS___ICLFeatureFlags, "appReferencesEnabled") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](&OBJC_CLASS___MIAppReferenceManager, "defaultManager"));
    id v15 = 0LL;
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 personaUniqueStringsForAppWithBundleID:v4 error:&v15]);
    id v8 = v15;

    if (v7)
    {
      if ([v7 count] == (id)1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v7 anyObject]);
        if (!a3) {
          goto LABEL_13;
        }
      }

      else
      {
        id v12 = sub_1000130F4( (uint64_t)"-[MIAppIdentity(MIDaemonUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]",  44LL,  MIInstallerErrorDomain,  192LL,  0LL,  0LL,  @"Can't resolve the persona associated with the bundle %@ from the associated personas in app references: %@",  v9,  (uint64_t)v4);
        uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);

        v10 = 0LL;
        id v8 = (id)v13;
        if (!a3) {
          goto LABEL_13;
        }
      }
    }

    else
    {
      v10 = 0LL;
      if (!a3) {
        goto LABEL_13;
      }
    }
  }

  else
  {
    id v11 = sub_1000130C8( (uint64_t)"-[MIAppIdentity(MIDaemonUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]",  32LL,  MIInstallerErrorDomain,  161LL,  0LL,  0LL,  @"%s is not enabled",  v5,  (uint64_t)"-[MIAppIdentity(MIDaemonUtilities) resolvePersonaUsingModuleSpecificLogicWithError:]");
    id v8 = (id)objc_claimAutoreleasedReturnValue(v11);
    v10 = 0LL;
    v7 = 0LL;
    if (!a3) {
      goto LABEL_13;
    }
  }

  if (!v10) {
    *a3 = v8;
  }
LABEL_13:

  return v10;
}

@end