@interface MICodeSigningInfo
+ (BOOL)getValue:(id *)a3 forEntitlement:(id)a4 fromProcessWithAuditToken:(id *)a5 error:(id *)a6;
+ (id)signingIdentifierForAuditToken:(id *)a3 error:(id *)a4;
- (MICodeSigningInfo)initWithDictionaryRepresentation:(id)a3;
- (MICodeSigningInfo)initWithDictionaryRepresentation:(id)a3 fromSource:(unint64_t)a4;
- (MICodeSigningInfo)initWithSignerIdentity:(id)a3 signerOrganization:(id)a4 codeInfoIdentifier:(id)a5 teamIdentifier:(id)a6 signatureVersion:(id)a7 entitlements:(id)a8 signerType:(unint64_t)a9 profileType:(unint64_t)a10 signingInfoSource:(unint64_t)a11 launchWarningData:(id)a12;
- (NSData)launchWarningData;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)entitlements;
- (NSNumber)signatureVersion;
- (NSString)codeInfoIdentifier;
- (NSString)signerIdentity;
- (NSString)signerOrganization;
- (NSString)teamIdentifier;
- (id)initForTesting;
- (unint64_t)codeSignerType;
- (unint64_t)profileValidationType;
- (unint64_t)signingInfoSource;
@end

@implementation MICodeSigningInfo

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MICodeSigningInfo;
  return -[MICodeSigningInfo init](&v3, sel_init);
}

- (MICodeSigningInfo)initWithSignerIdentity:(id)a3 signerOrganization:(id)a4 codeInfoIdentifier:(id)a5 teamIdentifier:(id)a6 signatureVersion:(id)a7 entitlements:(id)a8 signerType:(unint64_t)a9 profileType:(unint64_t)a10 signingInfoSource:(unint64_t)a11 launchWarningData:(id)a12
{
  id v19 = a3;
  id v20 = a4;
  id v28 = a5;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  id v21 = a12;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___MICodeSigningInfo;
  v22 = -[MICodeSigningInfo init](&v29, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_signerIdentity, a3);
    objc_storeStrong((id *)&v23->_signerOrganization, a4);
    objc_storeStrong((id *)&v23->_codeInfoIdentifier, a5);
    objc_storeStrong((id *)&v23->_teamIdentifier, a6);
    objc_storeStrong((id *)&v23->_signatureVersion, a7);
    objc_storeStrong((id *)&v23->_entitlements, a8);
    v23->_profileValidationType = a10;
    v23->_signingInfoSource = a11;
    v23->_codeSignerType = a9;
    objc_storeStrong((id *)&v23->_launchWarningData, a12);
  }

  return v23;
}

- (MICodeSigningInfo)initWithDictionaryRepresentation:(id)a3
{
  return -[MICodeSigningInfo initWithDictionaryRepresentation:fromSource:]( self,  "initWithDictionaryRepresentation:fromSource:",  a3,  0LL);
}

- (MICodeSigningInfo)initWithDictionaryRepresentation:(id)a3 fromSource:(unint64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }

  if (!v8)
  {
LABEL_40:
    MOLogWrite();
LABEL_41:
    v35 = 0LL;
    goto LABEL_64;
  }

  [v7 objectForKeyedSubscript:@"SigningInfoSource"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v11 = v10;
  }
  else {
    id v11 = 0LL;
  }

  uint64_t v12 = [v11 unsignedIntegerValue];
  if (a4) {
    unint64_t v13 = a4;
  }
  else {
    unint64_t v13 = v12;
  }
  id v14 = v7;
  [v14 objectForKeyedSubscript:@"CodeSignerType"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v16 = v15;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v17 = v16;
  }
  else {
    id v17 = 0LL;
  }

  if (v17)
  {
    uint64_t v18 = [v17 unsignedIntegerValue];
  }

  else
  {
    [v14 objectForKeyedSubscript:@"AdHocSigned"];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = MIBooleanValue(v19, 0LL);

    [v14 objectForKeyedSubscript:@"ValidatedByProfile"];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    int v22 = MIBooleanValue(v21, 0LL);

    uint64_t v23 = 2LL;
    if (v22) {
      uint64_t v23 = 3LL;
    }
    if (v20) {
      uint64_t v18 = 1LL;
    }
    else {
      uint64_t v18 = v23;
    }
  }

  id v24 = v14;
  [v24 objectForKeyedSubscript:@"ProfileType"];
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v26 = v25;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v27 = v26;
  }
  else {
    id v27 = 0LL;
  }

  if (v27)
  {
    uint64_t v28 = [v27 unsignedIntegerValue];
  }

  else
  {
    [v24 objectForKeyedSubscript:@"ValidatedByProfile"];
    objc_super v29 = (void *)objc_claimAutoreleasedReturnValue();
    int v30 = MIBooleanValue(v29, 0LL);

    if (v30)
    {
      [v24 objectForKeyedSubscript:@"ValidatedByUPP"];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      char v32 = MIBooleanValue(v31, 0LL);

      if ((v32 & 1) != 0)
      {
        uint64_t v28 = 2LL;
      }

      else
      {
        [v24 objectForKeyedSubscript:@"ValidatedByFreeProfile"];
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        int v34 = MIBooleanValue(v33, 0LL);

        if (v34) {
          uint64_t v28 = 3LL;
        }
        else {
          uint64_t v28 = 4LL;
        }
      }
    }

    else
    {
      uint64_t v28 = 1LL;
    }
  }

  if (v18 == 3 && v28 == 1)
  {
    goto LABEL_40;
  }

  uint64_t v63 = v28;
  [v24 objectForKeyedSubscript:@"SignerIdentity"];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v37 = v36;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v62 = v37;
  }
  else {
    id v62 = 0LL;
  }
  v64 = v37;

  [v24 objectForKeyedSubscript:@"SignerOrganization"];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v39 = v38;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v60 = v39;
  }
  else {
    id v60 = 0LL;
  }
  v61 = v39;

  [v24 objectForKeyedSubscript:@"CodeInfoIdentifier"];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v41 = v40;
  v65 = self;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v58 = v41;
  }
  else {
    id v58 = 0LL;
  }
  v59 = v41;

  [v24 objectForKeyedSubscript:@"TeamIdentifier"];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v43 = v42;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v56 = v43;
  }
  else {
    id v56 = 0LL;
  }
  v57 = v43;

  [v24 objectForKeyedSubscript:@"SignatureVersion"];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v45 = v44;
  uint64_t v46 = v18;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v47 = v45;
  }
  else {
    id v47 = 0LL;
  }

  [v24 objectForKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v49 = v48;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v50 = v49;
  }
  else {
    id v50 = 0LL;
  }

  [v24 objectForKeyedSubscript:@"LaunchWarningData"];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v52 = v51;
  v55 = v45;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v53 = v52;
  }
  else {
    id v53 = 0LL;
  }

  v35 =  -[MICodeSigningInfo initWithSignerIdentity:signerOrganization:codeInfoIdentifier:teamIdentifier:signatureVersion:entitlements:signerType:profileType:signingInfoSource:launchWarningData:]( v65,  "initWithSignerIdentity:signerOrganization:codeInfoIdentifier:teamIdentifier:signatureVersion:entitlements:si gnerType:profileType:signingInfoSource:launchWarningData:",  v62,  v60,  v58,  v56,  v47,  v50,  v46,  v63,  v13,  v53);
  self = v35;

LABEL_64:
  return v35;
}

- (NSDictionary)dictionaryRepresentation
{
  objc_super v3 = (void *)objc_opt_new();
  v4 = -[MICodeSigningInfo entitlements](self, "entitlements");
  if (v4)
  {
    v5 = -[MICodeSigningInfo entitlements](self, "entitlements");
    [v3 setObject:v5 forKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
  }

  -[MICodeSigningInfo signerIdentity](self, "signerIdentity");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MICodeSigningInfo signerIdentity](self, "signerIdentity");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v7 forKeyedSubscript:@"SignerIdentity"];
  }

  -[MICodeSigningInfo signerOrganization](self, "signerOrganization");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[MICodeSigningInfo signerOrganization](self, "signerOrganization");
    [v3 setObject:v9 forKeyedSubscript:@"SignerOrganization"];
  }

  -[MICodeSigningInfo codeInfoIdentifier](self, "codeInfoIdentifier");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MICodeSigningInfo codeInfoIdentifier](self, "codeInfoIdentifier");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v11 forKeyedSubscript:@"CodeInfoIdentifier"];
  }

  -[MICodeSigningInfo teamIdentifier](self, "teamIdentifier");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MICodeSigningInfo teamIdentifier](self, "teamIdentifier");
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v13 forKeyedSubscript:@"TeamIdentifier"];
  }

  -[MICodeSigningInfo signatureVersion](self, "signatureVersion");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = -[MICodeSigningInfo signatureVersion](self, "signatureVersion");
    [v3 setObject:v15 forKeyedSubscript:@"SignatureVersion"];
  }

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[MICodeSigningInfo profileValidationType](self, "profileValidationType"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v16 forKeyedSubscript:@"ProfileType"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[MICodeSigningInfo codeSignerType](self, "codeSignerType"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v17 forKeyedSubscript:@"CodeSignerType"];

  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[MICodeSigningInfo signingInfoSource](self, "signingInfoSource"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v18 forKeyedSubscript:@"SigningInfoSource"];

  -[MICodeSigningInfo launchWarningData](self, "launchWarningData");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v19 forKeyedSubscript:@"LaunchWarningData"];

  int v20 = (void *)[v3 copy];
  return (NSDictionary *)v20;
}

+ (id)signingIdentifierForAuditToken:(id *)a3 error:(id *)a4
{
  CFErrorRef error = 0LL;
  id v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  __int128 v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v7;
  id v8 = SecTaskCreateWithAuditToken(v6, &token);
  if (!v8)
  {
    __int128 v17 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)token.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&token.val[4] = v17;
    uint64_t v18 = audit_token_to_pid(&token);
    _CreateAndLogError( (uint64_t)"+[MICodeSigningInfo signingIdentifierForAuditToken:error:]",  197LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to create SecTask from audit token for pid %d",  v19,  v18);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = 0LL;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  v9 = v8;
  CFStringRef v10 = SecTaskCopySigningIdentifier(v8, &error);
  id v11 = (__CFString *)v10;
  uint64_t v12 = error;
  if (error) {
    CFErrorRef error = 0LL;
  }
  if (!v10)
  {
    __int128 v13 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)token.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&token.val[4] = v13;
    uint64_t v14 = audit_token_to_pid(&token);
    uint64_t v16 = _CreateAndLogError( (uint64_t)"+[MICodeSigningInfo signingIdentifierForAuditToken:error:]",  209LL,  @"MIInstallerErrorDomain",  4LL,  v12,  0LL,  @"Failed to get signing identifier from SecTask for pid %d",  v15,  v14);

    uint64_t v12 = (void *)v16;
  }

  CFRelease(v9);
  if (a4)
  {
LABEL_9:
    if (!v11) {
      *a4 = v12;
    }
  }

+ (BOOL)getValue:(id *)a3 forEntitlement:(id)a4 fromProcessWithAuditToken:(id *)a5 error:(id *)a6
{
  v9 = (__CFString *)a4;
  CFErrorRef error = 0LL;
  CFStringRef v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  __int128 v11 = *(_OWORD *)&a5->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a5->var0;
  *(_OWORD *)&token.val[4] = v11;
  uint64_t v12 = SecTaskCreateWithAuditToken(v10, &token);
  if (v12)
  {
    __int128 v13 = v12;
    CFTypeRef v14 = SecTaskCopyValueForEntitlement(v12, v9, &error);
    uint64_t v15 = (void *)v14;
    uint64_t v16 = error;
    if (error && (CFErrorRef error = 0LL, !v14))
    {
      __int128 v21 = *(_OWORD *)&a5->var0[4];
      *(_OWORD *)token.val = *(_OWORD *)a5->var0;
      *(_OWORD *)&token.val[4] = v21;
      uint64_t v22 = audit_token_to_pid(&token);
      uint64_t v24 = _CreateAndLogError( (uint64_t)"+[MICodeSigningInfo getValue:forEntitlement:fromProcessWithAuditToken:error:]",  245LL,  @"MIInstallerErrorDomain",  4LL,  v16,  0LL,  @"Failed to get signing identifier from SecTask for pid %d",  v23,  v22);

      BOOL v17 = 0;
      uint64_t v15 = 0LL;
      uint64_t v16 = (void *)v24;
    }

    else
    {
      BOOL v17 = 1;
    }

    CFRelease(v13);
    if (!a6) {
      goto LABEL_11;
    }
  }

  else
  {
    __int128 v18 = *(_OWORD *)&a5->var0[4];
    *(_OWORD *)token.val = *(_OWORD *)a5->var0;
    *(_OWORD *)&token.val[4] = v18;
    uint64_t v19 = audit_token_to_pid(&token);
    _CreateAndLogError( (uint64_t)"+[MICodeSigningInfo getValue:forEntitlement:fromProcessWithAuditToken:error:]",  232LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"Failed to create SecTask from audit token for pid %d",  v20,  v19);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = 0LL;
    BOOL v17 = 0;
    if (!a6) {
      goto LABEL_11;
    }
  }

  if (!v17) {
    *a6 = v16;
  }
LABEL_11:
  char v25 = !v17;
  if (!a3) {
    char v25 = 1;
  }
  if ((v25 & 1) == 0) {
    *a3 = v15;
  }

  return v17;
}

- (NSString)signerIdentity
{
  return self->_signerIdentity;
}

- (NSString)signerOrganization
{
  return self->_signerOrganization;
}

- (NSString)codeInfoIdentifier
{
  return self->_codeInfoIdentifier;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSNumber)signatureVersion
{
  return self->_signatureVersion;
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (unint64_t)codeSignerType
{
  return self->_codeSignerType;
}

- (unint64_t)profileValidationType
{
  return self->_profileValidationType;
}

- (unint64_t)signingInfoSource
{
  return self->_signingInfoSource;
}

- (NSData)launchWarningData
{
  return self->_launchWarningData;
}

- (void).cxx_destruct
{
}

@end