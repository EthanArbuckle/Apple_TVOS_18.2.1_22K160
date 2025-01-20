@interface RBSIdentityAndRecordInfoProvider
+ (id)_providerWithIdentity:(id)a3 record:(id)a4;
- (id)_initWithIdentity:(id)a3 record:(id)a4;
- (id)fetchWrappedInfoWithError:(id *)a3;
@end

@implementation RBSIdentityAndRecordInfoProvider

- (id)_initWithIdentity:(id)a3 record:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 handleFailureInMethod:a2, self, @"RBSProcessIdentity.m", 42, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 handleFailureInMethod:a2, self, @"RBSProcessIdentity.m", 43, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];

LABEL_3:
  v10 = -[RBSIdentityAndRecordInfoProvider init](self, "init");
  if (v10)
  {
    uint64_t v11 = [v7 personaUniqueString];
    personaString = v10->_personaString;
    v10->_personaString = (NSString *)v11;

    uint64_t v13 = [v9 bundleIdentifier];
    bundleID = v10->_bundleID;
    v10->_bundleID = (NSString *)v13;

    uint64_t v15 = [v9 jobLabel];
    persistentJobLabel = v10->_persistentJobLabel;
    v10->_persistentJobLabel = (NSString *)v15;

    v10->_platform = [v9 platform];
  }

  return v10;
}

+ (id)_providerWithIdentity:(id)a3 record:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[RBSIdentityAndRecordInfoProvider _initWithIdentity:record:]( objc_alloc(&OBJC_CLASS___RBSIdentityAndRecordInfoProvider),  "_initWithIdentity:record:",  v6,  v5);

  return v7;
}

- (id)fetchWrappedInfoWithError:(id *)a3
{
  return +[RBSWrappedLSInfo infoWithBundleID:personaString:persistentJobLabel:platform:bundleInode:execInode:]( &OBJC_CLASS___RBSWrappedLSInfo,  "infoWithBundleID:personaString:persistentJobLabel:platform:bundleInode:execInode:",  self->_bundleID,  self->_personaString,  self->_persistentJobLabel,  self->_platform,  self->_bundleInode,  self->_execInode);
}

- (void).cxx_destruct
{
}

@end