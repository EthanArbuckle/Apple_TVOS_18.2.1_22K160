@interface MICodeSigningVerifier
+ (BOOL)_validateBundleExecutable:(id)a3 againstStubAt:(id)a4 trustedHashes:(id)a5 sectionName:(id)a6 signingIdentifier:(id)a7 error:(id *)a8;
+ (BOOL)_validateStubSignature:(id)a3 withSigningID:(id)a4 error:(id *)a5;
+ (BOOL)validateWatchKitV1StubExecutableBundle:(id)a3 error:(id *)a4;
+ (BOOL)validateWatchKitV2StubExecutableBundle:(id)a3 error:(id *)a4;
+ (id)_validateSignatureAndCopyInfoForURL:(id)a3 withOptions:(id)a4 error:(id *)a5;
+ (id)codeSigningVerifierForBundle:(id)a3;
- (BOOL)_getMICodeSignerTypeFromMISInfoDict:(id)a3 codeSignerType:(unint64_t *)a4 profileType:(unint64_t *)a5 error:(id *)a6;
- (BOOL)allowAdhocSigning;
- (BOOL)logResourceVerificationErrors;
- (BOOL)performOnlineAuthorization;
- (BOOL)performValidationWithError:(id *)a3;
- (BOOL)skipProfileIDValidation;
- (BOOL)validateResources;
- (BOOL)validateUsingDetachedSignature;
- (BOOL)verifyTrustCachePresence;
- (MICodeSigningInfo)signingInfo;
- (MICodeSigningVerifier)initWithBundle:(id)a3;
- (MIExecutableBundle)bundle;
- (id)_loadSystemDetachedSignatureForBundleID:(id)a3 error:(id *)a4;
- (void)setAllowAdhocSigning:(BOOL)a3;
- (void)setLogResourceVerificationErrors:(BOOL)a3;
- (void)setPerformOnlineAuthorization:(BOOL)a3;
- (void)setSkipProfileIDValidation:(BOOL)a3;
- (void)setValidateResources:(BOOL)a3;
- (void)setValidateUsingDetachedSignature:(BOOL)a3;
- (void)setVerifyTrustCachePresence:(BOOL)a3;
@end

@implementation MICodeSigningVerifier

- (MICodeSigningVerifier)initWithBundle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MICodeSigningVerifier;
  v6 = -[MICodeSigningVerifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundle, a3);
    v7->_logResourceVerificationErrors = 1;
  }

  return v7;
}

+ (id)codeSigningVerifierForBundle:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBundle:v3];

  return v4;
}

+ (id)_validateSignatureAndCopyInfoForURL:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  v24[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = MIAssertHighResourceUsage();
  v10 = (void *)MEMORY[0x186E26FA4](v9);
  [v7 path];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = MISValidateSignatureAndCopyInfo();

  objc_autoreleasePoolPop(v10);
  MIClearResourceAssertion();
  if ((_DWORD)v12)
  {
    v23[0] = @"LegacyErrorString";
    v23[1] = @"LibMISErrorNumber";
    v24[0] = @"ApplicationVerificationFailed";
    [MEMORY[0x189607968] numberWithInt:v12];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v13;
    [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:2];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 path];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MIErrorStringForMISError(v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"+[MICodeSigningVerifier _validateSignatureAndCopyInfoForURL:withOptions:error:]",  79LL,  @"MIInstallerErrorDomain",  13LL,  0LL,  v14,  @"Failed to verify code signature of %@ : 0x%08x (%@)",  v16,  (uint64_t)v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v21[0] = @"LegacyErrorString";
    v21[1] = @"LibMISErrorNumber";
    v22[0] = @"ApplicationVerificationFailed";
    v22[1] = &unk_189D64E58;
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 path];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"+[MICodeSigningVerifier _validateSignatureAndCopyInfoForURL:withOptions:error:]",  84LL,  @"MIInstallerErrorDomain",  13LL,  0LL,  v13,  @"Failed to get info dictionary from MISValidateSignatureAndCopyInfo when verifying %@",  v19,  (uint64_t)v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (a5) {
    *a5 = v17;
  }

  return 0LL;
}

- (id)_loadSystemDetachedSignatureForBundleID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance");
  [v6 systemAppDetachedSignaturesDirectory];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 URLByAppendingPathComponent:v5 isDirectory:0];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v15 = 0LL;
  [MEMORY[0x189603F48] dataWithContentsOfURL:v8 options:3 error:&v15];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v15;
  if (!v9)
  {
    [v8 path];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError( (uint64_t)"-[MICodeSigningVerifier _loadSystemDetachedSignatureForBundleID:error:]",  109LL,  @"MIInstallerErrorDomain",  129LL,  v10,  0LL,  @"Could not load detached signature data for %@ from %@",  v11,  (uint64_t)v5);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v10 = v12;
      *a4 = v10;
    }

    else
    {
      id v10 = v12;
    }
  }

  return v9;
}

- (BOOL)_getMICodeSignerTypeFromMISInfoDict:(id)a3 codeSignerType:(unint64_t *)a4 profileType:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  [v10 objectForKeyedSubscript:*MEMORY[0x189615F88]];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v12 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v13 = v12;
  }
  else {
    id v13 = 0LL;
  }

  if (v13)
  {
    id v14 = v10;
    [v14 objectForKeyedSubscript:*MEMORY[0x189615FA8]];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    int v16 = MIBooleanValue(v15, 0LL);

    if (v16)
    {
      [v14 objectForKeyedSubscript:*MEMORY[0x189615FB0]];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      char v18 = MIBooleanValue(v17, 0LL);

      if ((v18 & 1) != 0)
      {
        unint64_t v19 = 2LL;
      }

      else
      {
        [v14 objectForKeyedSubscript:*MEMORY[0x189615FA0]];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        int v25 = MIBooleanValue(v24, 0LL);

        if (v25) {
          unint64_t v19 = 3LL;
        }
        else {
          unint64_t v19 = 4LL;
        }
      }
    }

    else
    {
      unint64_t v19 = 1LL;
    }

    uint64_t v26 = [v13 longValue];
    switch(v26)
    {
      case 0LL:
      case 1LL:
      case 2LL:
      case 4LL:
        if (!a4) {
          goto LABEL_18;
        }
        goto LABEL_17;
      case 3LL:
        if (v19 == 1)
        {
          v20 = -[MICodeSigningVerifier bundle](self, "bundle");
          [v20 identifier];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError( (uint64_t)"-[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:]",  245LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"kMISValidationInfoValidatedByProfile was not set for %@ but kMISValidationInfoSignerType was set to MISSignerTypeProfile",  v30,  (uint64_t)v29);
          id v22 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_9;
        }

        uint64_t v26 = 3LL;
        if (a4) {
LABEL_17:
        }
          *a4 = v26;
LABEL_18:
        id v22 = 0LL;
        if (a5) {
          *a5 = v19;
        }
        BOOL v23 = 1;
        break;
      case 5LL:
        _CreateAndLogError( (uint64_t)"-[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:]",  254LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"MISSignerType is MISSignerTypeLegacyVPN which is not supported by MI; returning MICodeSignerTypeUnknown",
          v27,
          v31);
        goto LABEL_23;
      case 6LL:
        uint64_t v26 = 5LL;
        if (!a4) {
          goto LABEL_18;
        }
        goto LABEL_17;
      default:
        _CreateAndLogError( (uint64_t)"-[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:]",  260LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"kMISValidationInfoSignerType was set to unknown value %ld",  v27,  v26);
LABEL_23:
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        if (!a6) {
          goto LABEL_24;
        }
        goto LABEL_10;
    }
  }

  else
  {
    v20 = -[MICodeSigningVerifier bundle](self, "bundle");
    _CreateAndLogError( (uint64_t)"-[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:]",  227LL,  @"MIInstallerErrorDomain",  4LL,  0LL,  0LL,  @"kMISValidationInfoSignerType is not set or is not a number for %@",  v21,  (uint64_t)v20);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    if (a6)
    {
LABEL_10:
      id v22 = v22;
      BOOL v23 = 0;
      *a6 = v22;
    }

    else
    {
LABEL_24:
      BOOL v23 = 0;
    }
  }

  return v23;
}

- (BOOL)performValidationWithError:(id *)a3
{
  v118[5] = *MEMORY[0x1895F89C0];
  uint64_t v105 = 0LL;
  uint64_t v106 = 0LL;
  uint64_t v4 = -[MICodeSigningVerifier validateResources](self, "validateResources") ^ 1;
  uint64_t v96 = +[MITestManager sharedInstance](&OBJC_CLASS___MITestManager, "sharedInstance");
  if (-[MICodeSigningVerifier verifyTrustCachePresence](self, "verifyTrustCachePresence")) {
    -[MICodeSigningVerifier setAllowAdhocSigning:](self, "setAllowAdhocSigning:", 1LL);
  }
  if (-[MICodeSigningVerifier validateResources](self, "validateResources")) {
    uint64_t v4 = -[MICodeSigningVerifier validateUsingDetachedSignature](self, "validateUsingDetachedSignature") | v4;
  }
  uint64_t v98 = *MEMORY[0x189616008];
  v117[0] = *MEMORY[0x189616008];
  [MEMORY[0x189607968] numberWithBool:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v5;
  uint64_t v92 = *MEMORY[0x189615FD0];
  v117[1] = *MEMORY[0x189615FD0];
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[MICodeSigningVerifier logResourceVerificationErrors](self, "logResourceVerificationErrors"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v6;
  uint64_t v89 = *MEMORY[0x189615FB8];
  v117[2] = *MEMORY[0x189615FB8];
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[MICodeSigningVerifier allowAdhocSigning](self, "allowAdhocSigning"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = *MEMORY[0x189615FC0];
  v118[2] = v7;
  v118[3] = MEMORY[0x189604A88];
  uint64_t v9 = *MEMORY[0x189615FD8];
  uint64_t v88 = v8;
  v117[3] = v8;
  v117[4] = v9;
  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[MICodeSigningVerifier performOnlineAuthorization](self, "performOnlineAuthorization"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v118[4] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v118 forKeys:v117 count:5];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = (void *)[v11 mutableCopy];

  if (-[MICodeSigningVerifier verifyTrustCachePresence](self, "verifyTrustCachePresence")) {
    [v12 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x189615FF0]];
  }
  if (-[MICodeSigningVerifier skipProfileIDValidation](self, "skipProfileIDValidation")) {
    [v12 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x189615FE8]];
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    -[MICodeSigningVerifier bundle](self, "bundle");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 bundleURL];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 path];
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v12;
    MOLogWrite();
  }

  -[MICodeSigningVerifier bundle](self, "bundle", v79, v86);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v16 = [v15 estimatedMemoryUsageToValidate];
  v17 = -[MICodeSigningVerifier bundle](self, "bundle");
  [v17 identifier];
  char v18 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v19 = MIReserveMemoryForValidation(v16, v18);

  v20 = (void *)objc_opt_class();
  -[MICodeSigningVerifier bundle](self, "bundle");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 bundleURL];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  id v104 = 0LL;
  [v20 _validateSignatureAndCopyInfoForURL:v22 withOptions:v12 error:&v104];
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
  id v24 = v104;

  MIReturnMemoryUsedForValidation(v19);
  if (!v23)
  {
    v99 = 0LL;
    id v45 = 0LL;
    v46 = 0LL;
    goto LABEL_44;
  }

  if (-[MICodeSigningVerifier validateResources](self, "validateResources")
    && -[MICodeSigningVerifier validateUsingDetachedSignature](self, "validateUsingDetachedSignature"))
  {
    -[MICodeSigningVerifier bundle](self, "bundle");
    int v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 identifier];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    id v103 = v24;
    -[MICodeSigningVerifier _loadSystemDetachedSignatureForBundleID:error:]( self,  "_loadSystemDetachedSignatureForBundleID:error:",  v26,  &v103);
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    id v28 = v103;

    if (!v27)
    {
      v99 = 0LL;
      id v45 = 0LL;
      id v93 = 0LL;
      v40 = 0LL;
      v57 = (void *)v96;
LABEL_72:
      v56 = a3;
      goto LABEL_73;
    }

    uint64_t v29 = MEMORY[0x189604A80];
    v116[0] = MEMORY[0x189604A80];
    v115[0] = v98;
    v115[1] = v92;
    objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[MICodeSigningVerifier logResourceVerificationErrors](self, "logResourceVerificationErrors"));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    v116[1] = v30;
    v116[2] = v29;
    v115[2] = v89;
    v115[3] = v9;
    uint64_t v31 = *MEMORY[0x189615FC8];
    v116[3] = v29;
    v116[4] = v27;
    v90 = v27;
    uint64_t v32 = *MEMORY[0x189616000];
    v115[4] = v31;
    v115[5] = v32;
    v115[6] = v88;
    v116[5] = MEMORY[0x189604A88];
    v116[6] = MEMORY[0x189604A88];
    uint64_t v33 = [MEMORY[0x189603F68] dictionaryWithObjects:v116 forKeys:v115 count:7];

    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      v34 = -[MICodeSigningVerifier bundle](self, "bundle");
      [v34 bundleURL];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 path];
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    v36 = (void *)objc_opt_class();
    v37 = -[MICodeSigningVerifier bundle](self, "bundle");
    [v37 bundleURL];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    id v102 = v28;
    [v36 _validateSignatureAndCopyInfoForURL:v38 withOptions:v33 error:&v102];
    v39 = (void *)v33;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    id v41 = v102;

    if (!v40)
    {
      v99 = 0LL;
      id v45 = 0LL;
      id v93 = 0LL;
      id v28 = v41;
      v56 = a3;
      v57 = (void *)v96;
      uint64_t v27 = v90;
LABEL_73:

      id v24 = v28;
      v46 = v93;
      if (!v56) {
        goto LABEL_74;
      }
      goto LABEL_45;
    }
  }

  else
  {
    id v41 = v24;
  }

  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x189615F90], v80);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v43 = v42;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v44 = v43;
  }
  else {
    id v44 = 0LL;
  }

  id v93 = v44;
  if (!v44 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v81 = -[MICodeSigningVerifier bundle](self, "bundle");
    MOLogWrite();
  }

  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x189615F58], v81);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v48 = v47;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v49 = v48;
  }
  else {
    id v49 = 0LL;
  }

  v99 = v49;
  if (!v49 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v82 = -[MICodeSigningVerifier bundle](self, "bundle");
    MOLogWrite();
  }

  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x189615F68], v82);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v51 = v50;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v45 = v51;
  }
  else {
    id v45 = 0LL;
  }
  v46 = v93;

  if (!v45 && gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    v83 = -[MICodeSigningVerifier bundle](self, "bundle");
    MOLogWrite();

    v46 = v93;
  }

  id v101 = v41;
  BOOL v52 = -[MICodeSigningVerifier _getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:]( self,  "_getMICodeSignerTypeFromMISInfoDict:codeSignerType:profileType:error:",  v23,  &v105,  &v106,  &v101,  v83);
  id v24 = v101;

  if (!v52)
  {
LABEL_44:
    v40 = 0LL;
    v56 = a3;
    v57 = (void *)v96;
    if (!a3)
    {
LABEL_74:
      BOOL v58 = 0;
      goto LABEL_75;
    }

+ (BOOL)validateWatchKitV1StubExecutableBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 bundleURL];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 URLByAppendingPathComponent:@"_WatchKitStub/WK"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (validateWatchKitV1StubExecutableBundle_error__onceToken != -1) {
    dispatch_once(&validateWatchKitV1StubExecutableBundle_error__onceToken, &__block_literal_global_7);
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    [v6 executableURL];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 path];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  char v10 = objc_msgSend( a1,  "_validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:",  v6,  v8,  validateWatchKitV1StubExecutableBundle_error__trustedHashes,  @"__watchkit",  @"com.apple.WK",  a4,  v12);

  return v10;
}

void __70__MICodeSigningVerifier_validateWatchKitV1StubExecutableBundle_error___block_invoke()
{
  v5[1] = *MEMORY[0x1895F89C0];
  v0 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBase64EncodedString:@"fApr4oevAMrl65iFf3wAhUqJIOk=" options:0];
  v1 = +[MISignatureAgnosticHasher packedNumberForCPUType:subtype:]( &OBJC_CLASS___MISignatureAgnosticHasher,  "packedNumberForCPUType:subtype:",  12LL,  12LL);
  uint64_t v4 = v1;
  v5[0] = v0;
  uint64_t v2 = [MEMORY[0x189603F68] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  id v3 = (void *)validateWatchKitV1StubExecutableBundle_error__trustedHashes;
  validateWatchKitV1StubExecutableBundle_error__trustedHashes = v2;
}

+ (BOOL)validateWatchKitV2StubExecutableBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [v6 bundleURL];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 URLByAppendingPathComponent:@"_WatchKitStub/WK"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (validateWatchKitV2StubExecutableBundle_error__onceToken != -1) {
    dispatch_once(&validateWatchKitV2StubExecutableBundle_error__onceToken, &__block_literal_global_61);
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    [v6 executableURL];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 path];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  char v10 = objc_msgSend( a1,  "_validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:",  v6,  v8,  validateWatchKitV2StubExecutableBundle_error__trustedHashes,  @"__watchkit",  @"com.apple.WK",  a4,  v12);

  return v10;
}

void __70__MICodeSigningVerifier_validateWatchKitV2StubExecutableBundle_error___block_invoke()
{
  v5[1] = *MEMORY[0x1895F89C0];
  v0 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBase64EncodedString:@"gMfFfUYLxpniCKUmtjSz0XLrXGs=" options:0];
  v1 = +[MISignatureAgnosticHasher packedNumberForCPUType:subtype:]( &OBJC_CLASS___MISignatureAgnosticHasher,  "packedNumberForCPUType:subtype:",  12LL,  12LL);
  uint64_t v4 = v1;
  v5[0] = v0;
  uint64_t v2 = [MEMORY[0x189603F68] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  id v3 = (void *)validateWatchKitV2StubExecutableBundle_error__trustedHashes;
  validateWatchKitV2StubExecutableBundle_error__trustedHashes = v2;
}

+ (BOOL)_validateBundleExecutable:(id)a3 againstStubAt:(id)a4 trustedHashes:(id)a5 sectionName:(id)a6 signingIdentifier:(id)a7 error:(id *)a8
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v63 = v17;
  if (!v14)
  {
    id v21 = 0LL;
    goto LABEL_14;
  }

  id v18 = v17;
  +[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager");
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  int v20 = [v19 itemExistsAtURL:v14];

  id v21 = 0LL;
  if (!v18 || !v20)
  {
LABEL_14:
    id v28 = objc_alloc(&OBJC_CLASS___MISignatureAgnosticHasher);
    [v13 executableURL];
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = -[MISignatureAgnosticHasher initWithExecutable:searchForSectionNamed:]( v28,  "initWithExecutable:searchForSectionNamed:",  v29,  0LL);

    id v60 = v16;
    if (v30)
    {
      id v69 = v21;
      BOOL v31 = -[MISignatureAgnosticHasher performHashWithError:](v30, "performHashWithError:", &v69);
      id v23 = v69;

      if (v31)
      {
        -[MISignatureAgnosticHasher hashes](v30, "hashes");
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v32;
        if (v32)
        {
          uint64_t v33 = v32;
          if ([v32 count])
          {
            id v58 = v14;
            v59 = v13;
            v34 = (void *)[v33 mutableCopy];
            __int128 v65 = 0u;
            __int128 v66 = 0u;
            __int128 v67 = 0u;
            __int128 v68 = 0u;
            id v15 = v15;
            uint64_t v35 = [v15 countByEnumeratingWithState:&v65 objects:v72 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v66;
              while (2)
              {
                for (uint64_t i = 0LL; i != v36; ++i)
                {
                  if (*(void *)v66 != v37) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v39 = *(void *)(*((void *)&v65 + 1) + 8 * i);
                  [v34 objectForKeyedSubscript:v39];
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v40)
                  {
                    [v15 objectForKeyedSubscript:v39];
                    id v41 = (void *)objc_claimAutoreleasedReturnValue();
                    if (![v41 isEqualToData:v40])
                    {
                      uint64_t v64 = 0LL;
                      +[MISignatureAgnosticHasher unpackPackedCpuTypeAndSubType:cputype:subtype:]( &OBJC_CLASS___MISignatureAgnosticHasher,  "unpackPackedCpuTypeAndSubType:cputype:subtype:",  v39,  (char *)&v64 + 4,  &v64);
                      id v13 = v59;
                      [v59 executableURL];
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      [v50 path];
                      id v51 = (void *)objc_claimAutoreleasedReturnValue();
                      uint64_t v43 = _CreateAndLogError( (uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionNa me:signingIdentifier:error:]",  572LL,  @"MIInstallerErrorDomain",  72LL,  0LL,  &unk_189D64C40,  @"Executable at %@ did not match stub hash for cputype %d cpusubtype %d: %@ != %@",  v52,  (uint64_t)v51);

                      id v23 = v41;
                      int v25 = v15;
                      goto LABEL_42;
                    }

                    [v34 removeObjectForKey:v39];
                  }
                }

                uint64_t v36 = [v15 countByEnumeratingWithState:&v65 objects:v72 count:16];
                if (v36) {
                  continue;
                }
                break;
              }
            }

            if (![v34 count])
            {
              BOOL v47 = 1;
              id v14 = v58;
              id v13 = v59;
              id v16 = v60;
              id v45 = v61;
              goto LABEL_39;
            }

            id v13 = v59;
            [v59 executableURL];
            int v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v25 path];
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError( (uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signing Identifier:error:]",  581LL,  @"MIInstallerErrorDomain",  72LL,  0LL,  &unk_189D64C68,  @"Did not validate all slice hashes on executable %@; unchecked hashes: %@",
              v42,
            uint64_t v43 = (uint64_t)v40);
LABEL_42:
            id v14 = v58;
LABEL_37:
            v46 = a8;

            id v23 = (id)v43;
            id v16 = v60;
            id v45 = v61;
            if (a8) {
              goto LABEL_38;
            }
            goto LABEL_34;
          }
        }

        [v13 executableURL];
        int v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v25 path];
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v43 = _CreateAndLogError( (uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]",  560LL,  @"MIInstallerErrorDomain",  72LL,  v23,  &unk_189D64C18,  @"Unable to get hashes for executable %@",  v48,  (uint64_t)v40);
LABEL_36:
        v34 = 0LL;
        goto LABEL_37;
      }

      id v21 = v23;
    }

    else
    {
      id v23 = v21;
    }

    [v13 executableURL];
    int v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 path];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v43 = _CreateAndLogError( (uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]",  554LL,  @"MIInstallerErrorDomain",  72LL,  v21,  &unk_189D64BF0,  @"Unable to compute hash for executable %@",  v44,  (uint64_t)v40);
    v61 = 0LL;
    goto LABEL_36;
  }

  id v71 = 0LL;
  int v22 = [a1 _validateStubSignature:v14 withSigningID:v18 error:&v71];
  id v23 = v71;
  if (v22)
  {
    id v24 = -[MISignatureAgnosticHasher initWithExecutable:searchForSectionNamed:]( objc_alloc(&OBJC_CLASS___MISignatureAgnosticHasher),  "initWithExecutable:searchForSectionNamed:",  v14,  v16);
    int v25 = v24;
    if (v24)
    {
      id v70 = v23;
      BOOL v26 = -[MISignatureAgnosticHasher performHashWithError:](v24, "performHashWithError:", &v70);
      id v21 = v70;

      if (v26)
      {
        if (v16 && ([v25 hasNamedSection] & 1) == 0)
        {
          uint64_t v54 = [v14 path];
          id v55 = v16;
          v40 = (void *)v54;
          id v60 = v55;
          uint64_t v43 = _CreateAndLogError( (uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingId entifier:error:]",  542LL,  @"MIInstallerErrorDomain",  72LL,  v21,  &unk_189D64BC8,  @"Stub %@ does not have required section %@",  v56,  v54);
          v61 = 0LL;
          v34 = 0LL;
          uint64_t v30 = 0LL;
          id v23 = v21;
          goto LABEL_37;
        }

        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          [v14 path];
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();
        }

        uint64_t v27 = objc_msgSend(v25, "hashes", v57);

        id v15 = (id)v27;
        goto LABEL_14;
      }

      id v60 = v16;
      id v23 = v21;
    }

    else
    {
      id v60 = v16;
    }

    [v14 path];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v43 = _CreateAndLogError( (uint64_t)"+[MICodeSigningVerifier _validateBundleExecutable:againstStubAt:trustedHashes:sectionName:signingIdentifier:error:]",  537LL,  @"MIInstallerErrorDomain",  72LL,  v23,  &unk_189D64BA0,  @"Unable to compute hash for stub %@",  v53,  (uint64_t)v40);
    v61 = 0LL;
    v34 = 0LL;
    uint64_t v30 = 0LL;
    goto LABEL_37;
  }

  id v45 = 0LL;
  v34 = 0LL;
  uint64_t v30 = 0LL;
  v46 = a8;
  if (a8)
  {
LABEL_38:
    id v23 = v23;
    BOOL v47 = 0;
    id *v46 = v23;
    goto LABEL_39;
  }

+ (BOOL)_validateStubSignature:(id)a3 withSigningID:(id)a4 error:(id *)a5
{
  v27[2] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *MEMORY[0x189616000];
  v26[0] = *MEMORY[0x189616008];
  v26[1] = v10;
  v27[0] = MEMORY[0x189604A88];
  v27[1] = MEMORY[0x189604A88];
  [MEMORY[0x189603F68] dictionaryWithObjects:v27 forKeys:v26 count:2];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v25 = 0LL;
  [a1 _validateSignatureAndCopyInfoForURL:v8 withOptions:v11 error:&v25];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v25;
  if (v12)
  {
    [v12 objectForKeyedSubscript:*MEMORY[0x189615FA8]];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = MIBooleanValue(v14, 0LL);

    if (v15)
    {
      [v8 path];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = _CreateAndLogError( (uint64_t)"+[MICodeSigningVerifier _validateStubSignature:withSigningID:error:]",  611LL,  @"MIInstallerErrorDomain",  72LL,  0LL,  &unk_189D64C90,  @"Executable stub at %@ not signed by Apple.",  v17,  (uint64_t)v16);
      id v19 = 0LL;
    }

    else
    {
      [v12 objectForKeyedSubscript:*MEMORY[0x189615F90]];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      id v22 = v21;
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        id v19 = v22;
      }
      else {
        id v19 = 0LL;
      }

      if ([v19 isEqualToString:v9])
      {
        BOOL v20 = 1;
        goto LABEL_14;
      }

      [v8 path];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError( (uint64_t)"+[MICodeSigningVerifier _validateStubSignature:withSigningID:error:]",  618LL,  @"MIInstallerErrorDomain",  72LL,  0LL,  &unk_189D64CB8,  @"Executable stub at %@ had unexpected signing identifier '%@'; expected %@.",
        v23,
      uint64_t v18 = (uint64_t)v16);
    }

    id v13 = (id)v18;
    if (a5) {
      goto LABEL_13;
    }
  }

  else
  {
    id v19 = 0LL;
    if (a5)
    {
LABEL_13:
      id v13 = v13;
      BOOL v20 = 0;
      *a5 = v13;
      goto LABEL_14;
    }
  }

  BOOL v20 = 0;
LABEL_14:

  return v20;
}

- (BOOL)allowAdhocSigning
{
  return self->_allowAdhocSigning;
}

- (void)setAllowAdhocSigning:(BOOL)a3
{
  self->_allowAdhocSigning = a3;
}

- (BOOL)logResourceVerificationErrors
{
  return self->_logResourceVerificationErrors;
}

- (void)setLogResourceVerificationErrors:(BOOL)a3
{
  self->_logResourceVerificationErrors = a3;
}

- (BOOL)validateResources
{
  return self->_validateResources;
}

- (void)setValidateResources:(BOOL)a3
{
  self->_validateResources = a3;
}

- (BOOL)performOnlineAuthorization
{
  return self->_performOnlineAuthorization;
}

- (void)setPerformOnlineAuthorization:(BOOL)a3
{
  self->_performOnlineAuthorization = a3;
}

- (BOOL)validateUsingDetachedSignature
{
  return self->_validateUsingDetachedSignature;
}

- (void)setValidateUsingDetachedSignature:(BOOL)a3
{
  self->_validateUsingDetachedSignature = a3;
}

- (BOOL)verifyTrustCachePresence
{
  return self->_verifyTrustCachePresence;
}

- (void)setVerifyTrustCachePresence:(BOOL)a3
{
  self->_verifyTrustCachePresence = a3;
}

- (BOOL)skipProfileIDValidation
{
  return self->_skipProfileIDValidation;
}

- (void)setSkipProfileIDValidation:(BOOL)a3
{
  self->_skipProfileIDValidation = a3;
}

- (MICodeSigningInfo)signingInfo
{
  return self->_signingInfo;
}

- (MIExecutableBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
}

@end