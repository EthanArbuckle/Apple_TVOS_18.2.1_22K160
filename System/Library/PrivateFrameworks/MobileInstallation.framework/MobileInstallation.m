id _CreateErrorV(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v17) {
    v19 = [v17 mutableCopy];
  }
  else {
    v19 = objc_opt_new();
  }
  v20 = (void *)v19;
  if (v18)
  {
    v21 = (void *)[objc_alloc(NSString) initWithFormat:v18 arguments:a8];
    [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1896075E0]];
  }

  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:*MEMORY[0x189607798]];
  }
  [NSString stringWithUTF8String:a1];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setObject:v22 forKeyedSubscript:*MEMORY[0x189610038]];

  [MEMORY[0x189607968] numberWithInt:a2];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setObject:v23 forKeyedSubscript:*MEMORY[0x189610068]];

  [MEMORY[0x189607870] errorWithDomain:v15 code:a4 userInfo:v20];
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id _CreateError( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  return (id)objc_claimAutoreleasedReturnValue();
}

id _CreateAndLogError( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  return (id)objc_claimAutoreleasedReturnValue();
}

id _CreateAndLogErrorV( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a5;
  _CreateErrorV(a1, a2, a3, a4, v15, a6, a7, a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 userInfo];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = *MEMORY[0x1896075E0];
  [v17 objectForKeyedSubscript:*MEMORY[0x1896075E0]];
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      [v15 domain];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 code];
      [v15 userInfo];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 objectForKeyedSubscript:v18];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

  return v16;
}

BOOL _IsMalformedBundleError(void *a1)
{
  id v1 = a1;
  [v1 domain];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *MEMORY[0x189610040];
  if ([v2 isEqualToString:*MEMORY[0x189610040]] && objc_msgSend(v1, "code") == 12)
  {
    BOOL v4 = 1LL;
  }

  else
  {
    [v1 domain];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v5 isEqualToString:v3] && objc_msgSend(v1, "code") == 11)
    {
      BOOL v4 = 1LL;
    }

    else
    {
      [v1 domain];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      else {
        BOOL v4 = 0LL;
      }
    }
  }

  return v4;
}

__CFString *MICopyUnlocalizedDescriptionForContainerExtendedError()
{
  uint64_t v0 = container_error_copy_unlocalized_description();
  if (v0)
  {
    id v1 = (void *)v0;
    [NSString stringWithUTF8String:v0];
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    free(v1);
  }

  else
  {
    v2 = @"(container_error_copy_unlocalized_description returned NULL)";
  }

  return v2;
}

LABEL_10:
  v14 = v11 == 0LL;
  return v14;
}

  return v12;
}

  if (-[MIPlaceholderConstructor basicIOSPlaceholderForWatchOSLessThanSix]( self,  "basicIOSPlaceholderForWatchOSLessThanSix"))
  {
LABEL_11:
    v25 = 1;
    goto LABEL_22;
  }
  v31 = -[MIPlaceholderConstructor appExtensionPlaceholderConstructors](self, "appExtensionPlaceholderConstructors");
  v41 = v13;
  v32 = -[MIPlaceholderConstructor _materializeConstructors:intoBundle:error:]( self,  "_materializeConstructors:intoBundle:error:",  v31,  v6,  &v41);
  uint64_t v18 = v41;

  if (!v32) {
    goto LABEL_27;
  }
  if (!-[MIPlaceholderConstructor includeWatchAppPlaceholders](self, "includeWatchAppPlaceholders"))
  {
    v13 = v18;
LABEL_36:
    v35 = -[MIPlaceholderConstructor embeddedAppClipPlaceholderConstructors](self, "embeddedAppClipPlaceholderConstructors");
    v39 = v13;
    v36 = -[MIPlaceholderConstructor _materializeConstructors:intoBundle:error:]( self,  "_materializeConstructors:intoBundle:error:",  v35,  v6,  &v39);
    uint64_t v18 = v39;

    if (v36)
    {
      v25 = 1;
      v13 = v18;
      goto LABEL_22;
    }

    goto LABEL_27;
  }
  v33 = -[MIPlaceholderConstructor embeddedWatchAppPlaceholderConstructors](self, "embeddedWatchAppPlaceholderConstructors");
  v40 = v18;
  v34 = -[MIPlaceholderConstructor _materializeConstructors:intoBundle:error:]( self,  "_materializeConstructors:intoBundle:error:",  v33,  v6,  &v40);
  v13 = v40;

  if (v34) {
    goto LABEL_36;
  }
LABEL_15:
  v38 = 0LL;
  v26 = [v7 removeItemAtURL:v6 error:&v38];
  v27 = v38;
  if ((v26 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    [v6 path];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  if (a4)
  {
    v13 = v13;
    v25 = 0;
    *a4 = v13;
  }

  else
  {
    v25 = 0;
  }

void sub_18635EC94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

uint64_t immutable_open(int a1, char *a2, int a3, unsigned int a4)
{
  uint64_t v4 = open(a2, a3, a4);
  uint64_t v5 = v4;
  if ((v4 & 0x80000000) == 0)
  {
    if (fcntl(v4, 68, 1LL) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v6 = __error();
      v10 = strerror(*v6);
      MOLogWrite();
    }

    if (fcntl(v5, 48, 1LL, v10) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v7 = __error();
      v11 = strerror(*v7);
      MOLogWrite();
    }

    if (fcntl(v5, 76, 1LL, v11) < 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v8 = __error();
      strerror(*v8);
      MOLogWrite();
    }
  }

  return v5;
}

uint64_t bom_file_error_handler(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = BOMCopierUserData();
  if (v4)
  {
    *(_DWORD *)uint64_t v4 = a3;
    *(_BYTE *)(v4 + 4) = 1;
  }

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    strerror(a3);
    MOLogWrite();
  }

  return 2LL;
}

uint64_t bom_fatal_error_handler()
{
  uint64_t v0 = BOMCopierUserData();
  if (v0) {
    *(_BYTE *)(v0 + 4) = 1;
  }
  uint64_t result = gLogHandle;
  return result;
}

uint64_t bom_fatal_file_error_handler(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = BOMCopierUserData();
  if (result)
  {
    *(_DWORD *)uint64_t result = a3;
    *(_BYTE *)(result + 4) = 1;
  }

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    strerror(a3);
    return MOLogWrite();
  }

  return result;
}

uint64_t bom_copier_copy_file_finished_handler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = BOMCopierUserData();
  if (result) {
    *(void *)(result + 16) += a4;
  }
  return result;
}

unint64_t *bom_copier_copy_file_update_handler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (unint64_t *)BOMCopierUserData();
  if (result) {
    return (unint64_t *)(*(uint64_t (**)(unint64_t, double))(result[3] + 16))( result[3],  (double)(result[2] + a3) / (double)result[1] * 100.0);
  }
  return result;
}

void sub_18635F12C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18635F34C(_Unwind_Exception *a1)
{
}

LABEL_3:
      v7 = v5;
      v8 = 1LL;
LABEL_4:
      -[MIInstallOptions setInstallTargetType:](v7, "setInstallTargetType:", v8);
      goto LABEL_9;
    }

    -[MIInstallOptions setInstallTargetType:](v5, "setInstallTargetType:", 1LL);
    -[MIInstallOptions setSystemAppInstall:](v5, "setSystemAppInstall:", 1LL);
  }

LABEL_9:
  [v4 objectForKeyedSubscript:*MEMORY[0x189604E00]];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    v11 = v10;
  }
  else {
    v11 = 0LL;
  }

  if (v11) {
    -[MIInstallOptions setBundleIdentifier:](v5, "setBundleIdentifier:", v11);
  }
  [v4 objectForKeyedSubscript:@"IsUserInitiated"];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIInstallOptions setUserInitiated:](v5, "setUserInitiated:", MIBooleanValue(v12, 0LL));

  [v4 objectForKeyedSubscript:@"WaitForStorageDeletion"];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIInstallOptions setWaitForDeletion:](v5, "setWaitForDeletion:", MIBooleanValue(v13, 0LL));

  [v4 objectForKeyedSubscript:@"LSInstallType"];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v15 = v14;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    v16 = v15;
  }
  else {
    v16 = 0LL;
  }

  -[MIInstallOptions setLsInstallType:](v5, "setLsInstallType:", [v16 unsignedIntegerValue]);
  [v4 objectForKeyedSubscript:@"iTunesMetadata"];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  uint64_t v18 = v17;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    v19 = v18;
  }
  else {
    v19 = 0LL;
  }

  if (!v19)
  {
    v64 = v6;
    v21 = 0LL;
    goto LABEL_24;
  }

  v65 = 0LL;
  [MEMORY[0x1896100B8] metadataFromPlistData:v19 error:&v65];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v65;
  -[MIInstallOptions setITunesMetadata:](v5, "setITunesMetadata:", v20);
  v22 = -[MIInstallOptions iTunesMetadata](v5, "iTunesMetadata");
  if (v22)
  {
    v64 = v6;
LABEL_24:
    [v4 objectForKeyedSubscript:@"ApplicationSINF"];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v24 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v25 = v24;
    }
    else {
      v25 = 0LL;
    }

    -[MIInstallOptions setSinfData:](v5, "setSinfData:", v25);
    [v4 objectForKeyedSubscript:@"ApplicationSINFDataType"];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v27 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v28 = v27;
    }
    else {
      v28 = 0LL;
    }

    -[MIInstallOptions setSinfDataType:](v5, "setSinfDataType:", [v28 unsignedIntValue]);
    [v4 objectForKeyedSubscript:@"iTunesArtwork"];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v30 = v29;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v31 = v30;
    }
    else {
      v31 = 0LL;
    }

    -[MIInstallOptions setITunesArtworkData:](v5, "setITunesArtworkData:", v31);
    [v4 objectForKeyedSubscript:@"GeoJSON"];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v33 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v34 = v33;
    }
    else {
      v34 = 0LL;
    }

    -[MIInstallOptions setGeoJSONData:](v5, "setGeoJSONData:", v34);
    [v4 objectForKeyedSubscript:@"ProvisioningProfiles"];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v36 = v35;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v37 = v36;
    }
    else {
      v37 = 0LL;
    }

    -[MIInstallOptions setProvisioningProfiles:](v5, "setProvisioningProfiles:", v37);
    [v4 objectForKeyedSubscript:@"AlternateIconName"];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = v38;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v40 = v39;
    }
    else {
      v40 = 0LL;
    }

    -[MIInstallOptions setAlternateIconName:](v5, "setAlternateIconName:", v40);
    [v4 objectForKeyedSubscript:@"SkipWatchAppInstall"];
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIInstallOptions setSkipWatchAppInstall:](v5, "setSkipWatchAppInstall:", MIBooleanValue(v41, 0LL));

    if (-[MIInstallOptions skipWatchAppInstall](v5, "skipWatchAppInstall")) {
      -[MIInstallOptions setAutoInstallOverride:](v5, "setAutoInstallOverride:", 1LL);
    }
    [v4 objectForKeyedSubscript:@"AutoInstallWatchApp"];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = MIBooleanValue(v42, 0LL);

    if (v43) {
      -[MIInstallOptions setAutoInstallOverride:](v5, "setAutoInstallOverride:", 2LL);
    }
    [v4 objectForKeyedSubscript:@"AllowInstallLocalProvisioned"];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIInstallOptions setAllowLocalProvisioned:](v5, "setAllowLocalProvisioned:", MIBooleanValue(v44, 0LL));

    [v4 objectForKeyedSubscript:@"PerformAPFSClone"];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIInstallOptions setPerformAPFSClone:](v5, "setPerformAPFSClone:", MIBooleanValue(v45, 0LL));

    [v4 objectForKeyedSubscript:@"ProvisioningProfileInstallFailureIsFatal"];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIInstallOptions setProvisioningProfileInstallFailureIsFatal:]( v5,  "setProvisioningProfileInstallFailureIsFatal:",  MIBooleanValue(v46, 0LL));

    [v4 objectForKeyedSubscript:@"StashMode"];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = v47;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v49 = v48;
    }
    else {
      v49 = 0LL;
    }

    -[MIInstallOptions setStashMode:](v5, "setStashMode:", [v49 unsignedIntegerValue]);
    [v4 objectForKeyedSubscript:@"LinkedParentBundleID"];
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v51 = v50;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v52 = v51;
    }
    else {
      v52 = 0LL;
    }

    -[MIInstallOptions setLinkedParentBundleID:](v5, "setLinkedParentBundleID:", v52);
    [v4 objectForKeyedSubscript:@"PersonaUniqueStringForInstall"];
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = v53;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v55 = v54;
    }
    else {
      v55 = 0LL;
    }

    -[MIInstallOptions setPersonaUniqueString:](v5, "setPersonaUniqueString:", v55);
    [v4 objectForKeyedSubscript:@"PreservePlaceholderAsParallel"];
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIInstallOptions setPreservePlaceholderAsParallel:]( v5,  "setPreservePlaceholderAsParallel:",  MIBooleanValue(v56, 0LL));

    [v4 objectForKeyedSubscript:@"Intent"];
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = v57;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v59 = v58;
    }
    else {
      v59 = 0LL;
    }

    -[MIInstallOptions setInstallIntent:](v5, "setInstallIntent:", [v59 unsignedIntegerValue]);
    goto LABEL_59;
  }

  v60 = 0LL;
LABEL_60:

  return v60;
}

LABEL_20:
  v14 = -[MIInstallOptions sinfData](self, "sinfData");
  if (v14) {
    [v3 setObject:v14 forKeyedSubscript:@"ApplicationSINF"];
  }

  id v15 = -[MIInstallOptions sinfDataType](self, "sinfDataType");
  if ((_DWORD)v15)
  {
    [MEMORY[0x189607968] numberWithUnsignedInt:v15];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16) {
      [v3 setObject:v16 forKeyedSubscript:@"ApplicationSINFDataType"];
    }
  }
  v17 = -[MIInstallOptions iTunesArtworkData](self, "iTunesArtworkData");
  if (v17) {
    [v3 setObject:v17 forKeyedSubscript:@"iTunesArtwork"];
  }

  -[MIInstallOptions geoJSONData](self, "geoJSONData");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18) {
    [v3 setObject:v18 forKeyedSubscript:@"GeoJSON"];
  }
  v19 = -[MIInstallOptions provisioningProfiles](self, "provisioningProfiles");
  if (v19) {
    [v3 setObject:v19 forKeyedSubscript:@"ProvisioningProfiles"];
  }
  v20 = -[MIInstallOptions alternateIconName](self, "alternateIconName");
  if (v20) {
    [v3 setObject:v20 forKeyedSubscript:@"AlternateIconName"];
  }

  if (-[MIInstallOptions skipWatchAppInstall](self, "skipWatchAppInstall")
    || -[MIInstallOptions autoInstallOverride](self, "autoInstallOverride") == 1)
  {
    v21 = @"SkipWatchAppInstall";
  }

  else
  {
    if (-[MIInstallOptions autoInstallOverride](self, "autoInstallOverride") != 2) {
      goto LABEL_38;
    }
    v21 = @"AutoInstallWatchApp";
  }

  [v3 setObject:MEMORY[0x189604A88] forKeyedSubscript:v21];
LABEL_38:
  if (-[MIInstallOptions allowLocalProvisioned](self, "allowLocalProvisioned")) {
    [v3 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"AllowInstallLocalProvisioned"];
  }
  if (-[MIInstallOptions performAPFSClone](self, "performAPFSClone")) {
    [v3 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"PerformAPFSClone"];
  }
  if (-[MIInstallOptions provisioningProfileInstallFailureIsFatal](self, "provisioningProfileInstallFailureIsFatal")) {
    [v3 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"ProvisioningProfileInstallFailureIsFatal"];
  }
  v22 = -[MIInstallOptions stashMode](self, "stashMode");
  if (v22)
  {
    [MEMORY[0x189607968] numberWithUnsignedInteger:v22];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v23 forKeyedSubscript:@"StashMode"];
  }
  v24 = -[MIInstallOptions linkedParentBundleID](self, "linkedParentBundleID");
  if (v24) {
    [v3 setObject:v24 forKeyedSubscript:@"LinkedParentBundleID"];
  }
  v25 = -[MIInstallOptions personaUniqueString](self, "personaUniqueString");
  if (v25)
  {
    v26 = -[MIInstallOptions personaUniqueString](self, "personaUniqueString");
    [v3 setObject:v26 forKeyedSubscript:@"PersonaUniqueStringForInstall"];
  }

  if (-[MIInstallOptions preservePlaceholderAsParallel](self, "preservePlaceholderAsParallel")) {
    [v3 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"PreservePlaceholderAsParallel"];
  }
  v27 = -[MIInstallOptions installIntent](self, "installIntent");
  if (v27)
  {
    [MEMORY[0x189607968] numberWithUnsignedInteger:v27];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v28 forKeyedSubscript:@"Intent"];
  }

  if (-[MIInstallOptions installationRequestorAuditToken]( self, "installationRequestorAuditToken")
    && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    MOLogWrite();
  }

  v29 = (void *)[v3 copy];

LABEL_67:
  return (NSDictionary *)v29;
}

LABEL_116:
                                                      v11 = 0;
                                                      goto LABEL_117;
                                                    }
                                                  }

                                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                  {
                                                    goto LABEL_116;
                                                  }
                                                }

                                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                                {
                                                  goto LABEL_116;
                                                }
                                              }

                                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                              {
                                                goto LABEL_116;
                                              }
                                            }

                                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                            {
                                              goto LABEL_116;
                                            }
                                          }

                                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                          {
                                            goto LABEL_116;
                                          }
                                        }

                                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                        {
                                          goto LABEL_116;
                                        }
                                      }

                                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                      {
                                        goto LABEL_116;
                                      }
                                    }

                                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                    {
                                      goto LABEL_116;
                                    }
                                  }

                                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                  {
                                    goto LABEL_116;
                                  }
                                }

                                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                                {
                                  goto LABEL_116;
                                }
                              }

                              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                              {
                                goto LABEL_116;
                              }
                            }

                            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                            {
                              goto LABEL_116;
                            }
                          }

                          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                          {
                            goto LABEL_116;
                          }
                        }

                        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                        {
                          goto LABEL_116;
                        }
                      }

                      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                      {
                        goto LABEL_116;
                      }
                    }

                    else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                    {
                      goto LABEL_116;
                    }
                  }

                  else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                  {
                    goto LABEL_116;
                  }
                }

                else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
                {
                  goto LABEL_116;
                }
              }

              else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
              {
                goto LABEL_116;
              }
            }

            else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              goto LABEL_116;
            }
          }

          else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
            goto LABEL_116;
          }
        }

        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_116;
        }
      }

      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_116;
      }

      MOLogWrite();
      goto LABEL_116;
    }

    v11 = 0;
  }

LABEL_118:
  return v11;
}

uint64_t _ShouldContinueAfterIncrementingFreed(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1] + a2;
  a1[1] = v3;
  BOOL v4 = v2 < 0 || v3 < v2;
  uint64_t v5 = v4;
  if (v4)
  {
  }

  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
LABEL_15:
    MOLogWrite();
  }

  return v5;
}

uint64_t _PurgeDirectory(void *a1)
{
  id v1 = a1;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  [MEMORY[0x1896100A8] defaultManager];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = 0LL;
  char v3 = [v2 itemExistsAtURL:v1 error:&v16];
  id v4 = v16;
  uint64_t v5 = v4;
  if ((v3 & 1) == 0)
  {
    [v4 domain];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v11 isEqualToString:*MEMORY[0x189607688]])
    {
      uint64_t v12 = [v5 code];

      if (v12 == 2)
      {
        goto LABEL_15;
      }
    }

    else
    {
    }

LABEL_15:
    [v1 path];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

LABEL_16:
    uint64_t v10 = 0LL;
    goto LABEL_17;
  }

  v6 = removefile_state_alloc();
  removefile_state_set(v6, 3u, _RemovefileErrorCallback);
  id v7 = v1;
  [v7 fileSystemRepresentation];
  char v8 = TraverseDirectoryWithPostTraversal();
  id v9 = v5;

  if ((v8 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    [v7 path];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  removefile_state_free(v6);
  uint64_t v10 = v18[3];
  uint64_t v5 = v9;
LABEL_17:

  _Block_object_dispose(&v17, 8);
  return v10;
}

  return v14;
}

void sub_1863625A0(_Unwind_Exception *a1)
{
}

uint64_t _RemovefileErrorCallback(_removefile_state *a1)
{
  int dst = 0;
  removefile_state_get(a1, 5u, &dst);
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    strerror(dst);
    MOLogWrite();
  }

  return 0LL;
}

uint64_t _ProcessDataContainer(void *a1, void *a2, uint64_t *a3)
{
  id v5 = a1;
  [v5 rootURL];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 identifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    [v6 path];
    id v16 = v7;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = (uint64_t)a2;
    MOLogWrite();
  }

  [v6 URLByAppendingPathComponent:@"tmp" isDirectory:1];
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = _PurgeDirectory(v8);
  if (v9 >= 1 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
  {
    id v16 = a2;
    uint64_t v17 = v7;
    uint64_t v15 = v9;
    MOLogWrite();
  }

  int ShouldContinueAfterIncrementingFreed = _ShouldContinueAfterIncrementingFreed(a3, v9);

  if (ShouldContinueAfterIncrementingFreed)
  {
LABEL_11:
    objc_msgSend(v6, "MI_URLByAppendingPathComponents:lastIsDirectory:", &unk_189E46D28, 1, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = _PurgeDirectory(v11);
    uint64_t v13 = _ShouldContinueAfterIncrementingFreed(a3, v12);
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return v13;
}

uint64_t MIPurgeExpendableAppsAndDataForRestore(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  uint64_t v34 = a4;
  uint64_t v35 = 0LL;
  uint64_t v6 = gLogHandle;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    uint64_t v30 = a3;
    uint64_t v31 = a4;
    uint64_t v7 = 78LL;
    if (a2) {
      uint64_t v7 = 89LL;
    }
    v28 = a1;
    v29 = (void *)v7;
    uint64_t v6 = MOLogWrite();
  }

  char v8 = (void *)MEMORY[0x186E388C0](v6);
  [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:a1 isDirectory:1 relativeToURL:0];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  if (a2)
  {
    id v11 = v9;
    v32 = v10;
    uint64_t v12 = 0LL;
    unint64_t v13 = 0x189603000uLL;
    v33 = v8;
    do
    {
      v14 = (void *)qword_18637E428[v12];
      id v15 = v11;
      unint64_t v16 = v13;
      uint64_t v17 = (void *)objc_opt_new();
      v40[0] = MEMORY[0x1895F87A8];
      v40[1] = 3221225472LL;
      v40[2] = ___PurgeExpendableDataContainerContentForContainerClass_block_invoke;
      v40[3] = &unk_189E41998;
      id v18 = v17;
      id v41 = v18;
      MIEnumerateContainersOfClass(v15, (uint64_t)v14, v40);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        v28 = v14;
        v29 = v19;
        MOLogWrite();
      }

      if (objc_msgSend(v18, "count", v28, v29, v30, v31))
      {
        id v20 = (id)[v18 sortedArrayUsingComparator:&__block_literal_global];
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        id v21 = v18;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v37;
          while (2)
          {
            id v24 = v11;
            for (uint64_t i = 0LL; i != v22; ++i)
            {
              if (*(void *)v37 != v23) {
                objc_enumerationMutation(v21);
              }
              if (!_ProcessDataContainer(*(void **)(*((void *)&v36 + 1) + 8 * i), v14, &v34))
              {

                char v8 = v33;
                goto LABEL_29;
              }
            }

            uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v42 count:16];
            id v11 = v24;
            if (v22) {
              continue;
            }
            break;
          }
        }

        char v8 = v33;
      }

      else
      {
      }

      unint64_t v13 = v16;
      ++v12;
    }

    while (v12 != 3);
LABEL_29:

    uint64_t v10 = v32;
  }

  objc_autoreleasePoolPop(v8);
  uint64_t v26 = v35;
  return v26;
}

void sub_186362CF4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v9 = objc_begin_catch(exception_object);

      objc_end_catch();
      JUMPOUT(0x186362C70LL);
    }

    objc_begin_catch(exception_object);
    objc_exception_rethrow();
    __break(1u);
    JUMPOUT(0x186362D90LL);
  }

  _Unwind_Resume(exception_object);
}

void sub_186363038( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id MobileInstallationHelperServiceProtocolInterface()
{
  WeakRetained = objc_loadWeakRetained(&MobileInstallationHelperServiceProtocolInterface_weakInterface);
  if (!WeakRetained)
  {
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6924C8];
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&MobileInstallationHelperServiceProtocolInterface_weakInterface, WeakRetained);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&MobileInstallationHelperServiceProtocolInterface_lock);
  return WeakRetained;
}

void sub_186363508( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}
}

void sub_18636B48C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_18636B6AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_18636B8A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_18636BA84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_18636BC5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_18636BE2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_18636BF88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_18636C0F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t MobileInstallationInstallForInstallCoordinationWithError( void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  v29[1] = *MEMORY[0x1895F89C0];
  uint64_t v15 = (objc_class *)MEMORY[0x1896100A0];
  id v16 = a8;
  id v17 = a4;
  id v18 = a3;
  id v19 = a1;
  id v20 = objc_alloc(v15);
  [v18 bundleIdentifier];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = (void *)[v20 initWithBundleID:v21];

  id v27 = 0LL;
  uint64_t v23 = MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError( v19,  v22,  a2,  v18,  v17,  &v27,  a6,  a7,  v16,  0LL);

  id v24 = v27;
  if (a5 && (_DWORD)v23)
  {
    uint64_t v28 = *MEMORY[0x1896100D0];
    [MEMORY[0x189610078] bundleRecordArrayToInfoDictionaryArray:v24];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v25;
    [MEMORY[0x189603F68] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

uint64_t MobileInstallationInstallApplicationWithIdentityWithError( void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  return MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  0LL);
}

uint64_t MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError( void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v32 = a1;
  id v31 = a2;
  id v30 = a4;
  id v14 = a5;
  id v15 = a9;
  id v16 = a10;
  uint64_t v59 = 0LL;
  v60 = &v59;
  uint64_t v61 = 0x3032000000LL;
  v62 = __Block_byref_object_copy__0;
  v63 = __Block_byref_object_dispose__0;
  id v64 = 0LL;
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  v56 = __Block_byref_object_copy__0;
  v57 = __Block_byref_object_dispose__0;
  id v58 = 0LL;
  v51[0] = 0LL;
  v51[1] = v51;
  v51[2] = 0x2020000000LL;
  char v52 = 0;
  uint64_t v45 = 0LL;
  v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  v48 = __Block_byref_object_copy__0;
  v49 = __Block_byref_object_dispose__0;
  id v50 = 0LL;
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x2020000000LL;
  uint64_t v17 = MEMORY[0x1895F87A8];
  char v44 = 0;
  v37[0] = MEMORY[0x1895F87A8];
  v37[1] = 3221225472LL;
  v37[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke;
  v37[3] = &unk_189E41DF8;
  v40 = v51;
  id v18 = v15;
  id v39 = v18;
  id v19 = v14;
  id v38 = v19;
  id v20 = (void *)MEMORY[0x186E38A4C](v37);
  v34[0] = v17;
  v34[1] = 3221225472LL;
  v34[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_3;
  v34[3] = &unk_189E41DD0;
  id v21 = v16;
  id v36 = v21;
  id v22 = v19;
  id v35 = v22;
  uint64_t v23 = (void *)MEMORY[0x186E38A4C](v34);
  +[MIInstallerClient installerWithProgressBlock:releaseTerminationAssertionBlock:]( &OBJC_CLASS___MIInstallerClient,  "installerWithProgressBlock:releaseTerminationAssertionBlock:",  v20,  v23);
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v17;
  v33[1] = 3221225472LL;
  v33[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_5;
  v33[3] = &unk_189E41E48;
  v33[4] = &v45;
  v33[5] = &v53;
  v33[6] = &v59;
  v33[7] = &v41;
  [v24 installURL:v32 identity:v31 targetingDomain:a3 withOptions:v30 returningResultInfo:a6 != 0 completion:v33];

  if (*((_BYTE *)v42 + 24))
  {
    if (a6) {
      *a6 = (id) v60[5];
    }
  }

  else
  {
    if (a8)
    {
      *a8 = (id) v46[5];
    }

    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }

    _SendError(v20, (void *)v46[5]);
  }

  if (a7) {
    *a7 = (id) v54[5];
  }
  uint64_t v25 = *((unsigned __int8 *)v42 + 24);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  return v25;
}

void sub_18636C718( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, char a38, uint64_t a39, uint64_t a40, uint64_t a41, char a42)
{
}

void __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke( void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL))
  {
    id v8 = v3;
    [v3 objectForKeyedSubscript:@"Error"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5) {
      *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    }
    uint64_t v6 = (void (**)(void, void))a1[5];
    id v4 = v8;
    if (v6)
    {
      uint64_t v7 = (dispatch_queue_s *)a1[4];
      if (v7)
      {
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_2;
        block[3] = &unk_189E41DD0;
        id v11 = v6;
        id v10 = v8;
        dispatch_sync(v7, block);
      }

      else
      {
        ((void (**)(void, id))v6)[2](v6, v8);
      }

      id v4 = v8;
    }
  }
}

uint64_t __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void (***)(void))(a1 + 40);
  if (v2)
  {
    id v3 = *(dispatch_queue_s **)(a1 + 32);
    if (v3)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_4;
      block[3] = &unk_189E41E20;
      id v5 = v2;
      dispatch_sync(v3, block);
    }

    else
    {
      v2[2]();
    }
  }

uint64_t __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_4( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __MobileInstallationInstallApplicationWithIdentityAndAssertionBlockWithError_block_invoke_5( void *a1, char a2, void *a3, void *a4, void *a5)
{
  id v12 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8LL) + 40LL), a5);
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a4);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a3);
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = a2;
  }
}

void _SendError(void *a1, void *a2)
{
  id v15 = a1;
  id v3 = a2;
  [MEMORY[0x189603FC8] dictionaryWithCapacity:0];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    [v3 domain];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = v5;
    if (v5 != (void *)*MEMORY[0x189607460])
    {

LABEL_4:
      [v3 userInfo];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 objectForKeyedSubscript:@"LegacyErrorString"];
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      id v9 = v8;
      if (!v8)
      {
        id v9 = @"APIInternalError";
      }

      [v4 setObject:v9 forKeyedSubscript:@"Error"];
      [v3 userInfo];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 objectForKeyedSubscript:*MEMORY[0x189610050]];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11) {
        [v4 setObject:v11 forKeyedSubscript:@"ErrorDetail"];
      }

      goto LABEL_19;
    }

    if ([v3 code] == 4097)
    {
    }

    else
    {
      uint64_t v12 = [v3 code];

      if (v12 != 4099) {
        goto LABEL_4;
      }
    }

    [v4 setObject:@"ServiceConnectionInterrupted" forKeyedSubscript:@"Error"];
LABEL_19:
    [v3 userInfo];
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 objectForKeyedSubscript:*MEMORY[0x1896075E0]];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14) {
      [v4 setObject:v14 forKeyedSubscript:@"ErrorDescription"];
    }
    v15[2](v15, v4);

    goto LABEL_22;
  }

LABEL_22:
}

  return v25;
}

id MobileInstallationStageApplicationUpdateWithIdentityWithError( void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = __Block_byref_object_copy__0;
  uint64_t v26 = __Block_byref_object_dispose__0;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = __Block_byref_object_copy__0;
  id v20 = __Block_byref_object_dispose__0;
  id v21 = 0LL;
  uint64_t v12 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __MobileInstallationStageApplicationUpdateWithIdentityWithError_block_invoke;
  v15[3] = &unk_189E41E70;
  v15[4] = &v16;
  v15[5] = &v22;
  [v12 stageInstallURL:v9 identity:v10 targetingDomain:a3 withOptions:v11 completion:v15];

  if (!v17[5])
  {
    if (a5)
    {
      *a5 = (id) v23[5];
    }

    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }

  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void sub_18636CDA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationStageApplicationUpdateWithIdentityWithError_block_invoke( uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    uint64_t v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    uint64_t v7 = v10;
  }

  else
  {
    uint64_t v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v7 = v5;
  }

  id v8 = v7;
  id v9 = *v6;
  void *v6 = v8;
}

uint64_t MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v26 = a1;
  id v11 = a2;
  id v12 = a6;
  id v13 = a7;
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  v56 = __Block_byref_object_copy__0;
  v57 = __Block_byref_object_dispose__0;
  id v58 = 0LL;
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  id v50 = __Block_byref_object_copy__0;
  v51 = __Block_byref_object_dispose__0;
  id v52 = 0LL;
  v45[0] = 0LL;
  v45[1] = v45;
  v45[2] = 0x2020000000LL;
  char v46 = 0;
  uint64_t v39 = 0LL;
  v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  uint64_t v42 = __Block_byref_object_copy__0;
  uint64_t v43 = __Block_byref_object_dispose__0;
  id v44 = 0LL;
  uint64_t v35 = 0LL;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  uint64_t v14 = MEMORY[0x1895F87A8];
  char v38 = 0;
  v31[0] = MEMORY[0x1895F87A8];
  v31[1] = 3221225472LL;
  v31[2] = __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke;
  v31[3] = &unk_189E41DF8;
  uint64_t v34 = v45;
  id v15 = v12;
  id v33 = v15;
  id v16 = v11;
  id v32 = v16;
  uint64_t v17 = (void *)MEMORY[0x186E38A4C](v31);
  v28[0] = v14;
  v28[1] = 3221225472LL;
  v28[2] = __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_3;
  v28[3] = &unk_189E41DD0;
  id v18 = v13;
  id v30 = v18;
  id v19 = v16;
  id v29 = v19;
  id v20 = (void *)MEMORY[0x186E38A4C](v28);
  +[MIInstallerClient installerWithProgressBlock:releaseTerminationAssertionBlock:]( &OBJC_CLASS___MIInstallerClient,  "installerWithProgressBlock:releaseTerminationAssertionBlock:",  v17,  v20);
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  v27[1] = 3221225472LL;
  v27[2] = __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_5;
  v27[3] = &unk_189E41E48;
  v27[4] = &v39;
  v27[5] = &v47;
  v27[6] = &v53;
  v27[7] = &v35;
  [v21 finalizeStagedInstallForUUID:v26 returningResultInfo:a3 != 0 completion:v27];

  if (*((_BYTE *)v36 + 24))
  {
    if (a3) {
      *a3 = (id) v54[5];
    }
    if (a4) {
      *a4 = (id) v48[5];
    }
  }

  else
  {
    if (a5)
    {
      *a5 = (id) v40[5];
    }

    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }

    _SendError(v17, (void *)v40[5]);
  }

  uint64_t v22 = *((unsigned __int8 *)v36 + 24);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  return v22;
}

void sub_18636D178( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34, uint64_t a35, uint64_t a36, uint64_t a37, char a38)
{
}

void __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke( void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL))
  {
    id v8 = v3;
    [v3 objectForKeyedSubscript:@"Error"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5) {
      *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    }
    uint64_t v6 = (void (**)(void, void))a1[5];
    id v4 = v8;
    if (v6)
    {
      uint64_t v7 = (dispatch_queue_s *)a1[4];
      if (v7)
      {
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_2;
        block[3] = &unk_189E41DD0;
        id v11 = v6;
        id v10 = v8;
        dispatch_sync(v7, block);
      }

      else
      {
        ((void (**)(void, id))v6)[2](v6, v8);
      }

      id v4 = v8;
    }
  }
}

uint64_t __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void (***)(void))(a1 + 40);
  if (v2)
  {
    id v3 = *(dispatch_queue_s **)(a1 + 32);
    if (v3)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_4;
      block[3] = &unk_189E41E20;
      id v5 = v2;
      dispatch_sync(v3, block);
    }

    else
    {
      v2[2]();
    }
  }

uint64_t __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __MobileInstallationMakeStagedApplicationUpdateLiveForIdentityWithError_block_invoke_5( void *a1, char a2, void *a3, void *a4, void *a5)
{
  id v12 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8LL) + 40LL), a5);
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a4);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a3);
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = a2;
  }
}

uint64_t MobileInstallationCancelStagedUpdateForUUIDWithError(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0LL;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  id v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __MobileInstallationCancelStagedUpdateForUUIDWithError_block_invoke;
  v7[3] = &unk_189E41E98;
  v7[4] = &v8;
  v7[5] = &v12;
  [v4 cancelUpdateForStagedUUID:v3 completion:v7];

  if (!*((_BYTE *)v9 + 24))
  {
    if (a2)
    {
      *a2 = (id) v13[5];
    }

    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }

  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

void sub_18636D58C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationCancelStagedUpdateForUUIDWithError_block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    id v6 = v7;
  }
}

id MobileInstallationRegisterPlaceholderForReference(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  char v11 = __Block_byref_object_copy__0;
  uint64_t v12 = __Block_byref_object_dispose__0;
  id v13 = 0LL;
  id v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __MobileInstallationRegisterPlaceholderForReference_block_invoke;
  v7[3] = &unk_189E41EC0;
  v7[4] = &v14;
  v7[5] = &v8;
  [v4 registerPlaceholderForReference:v3 completion:v7];

  if (!v15[5])
  {
    if (a2)
    {
      *a2 = (id) v9[5];
    }

    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }

  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void sub_18636D78C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void __MobileInstallationRegisterPlaceholderForReference_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    id v7 = v10;
  }

  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v7 = v5;
  }

  id v8 = v7;
  uint64_t v9 = *v6;
  void *v6 = v8;
}

uint64_t MobileInstallationRevertForInstallCoordinationWithError( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  char v11 = (objc_class *)MEMORY[0x1896100A0];
  id v12 = a6;
  id v13 = a3;
  id v14 = a2;
  id v15 = a1;
  uint64_t v16 = (void *)[[v11 alloc] initWithBundleID:v15];

  uint64_t v17 = MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError(v16, v14, v13, a4, a5, v12, 0LL);
  return v17;
}

uint64_t MobileInstallationRevertApplicationWithIdentityWithError( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  return MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError(a1, a2, a3, a4, a5, a6, 0LL);
}

uint64_t MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v12 = a1;
  id v32 = a2;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v59[0] = 0LL;
  v59[1] = v59;
  v59[2] = 0x2020000000LL;
  char v60 = 0;
  v57[0] = 0LL;
  v57[1] = v57;
  v57[2] = 0x3032000000LL;
  v57[3] = __Block_byref_object_copy__0;
  v57[4] = __Block_byref_object_dispose__0;
  id v58 = 0LL;
  uint64_t v51 = 0LL;
  id v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  v54 = __Block_byref_object_copy__0;
  uint64_t v55 = __Block_byref_object_dispose__0;
  id v56 = 0LL;
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x2020000000LL;
  char v50 = 0;
  uint64_t v41 = 0LL;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  id v44 = __Block_byref_object_copy__0;
  uint64_t v45 = __Block_byref_object_dispose__0;
  uint64_t v16 = MEMORY[0x1895F87A8];
  id v46 = 0LL;
  v37[0] = MEMORY[0x1895F87A8];
  v37[1] = 3221225472LL;
  v37[2] = __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke;
  v37[3] = &unk_189E41DF8;
  v40 = v59;
  id v17 = v14;
  id v39 = v17;
  id v18 = v13;
  id v38 = v18;
  id v19 = (void *)MEMORY[0x186E38A4C](v37);
  v34[0] = v16;
  v34[1] = 3221225472LL;
  v34[2] = __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_3;
  v34[3] = &unk_189E41DD0;
  id v20 = v15;
  id v36 = v20;
  id v21 = v18;
  id v35 = v21;
  uint64_t v23 = (void *)MEMORY[0x186E38A4C](v34);
  if (v12)
  {
    uint64_t v24 = (void *)MEMORY[0x186E388C0]();
    +[MIInstallerClient installerWithProgressBlock:releaseTerminationAssertionBlock:]( &OBJC_CLASS___MIInstallerClient,  "installerWithProgressBlock:releaseTerminationAssertionBlock:",  v19,  v23);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v16;
    v33[1] = 3221225472LL;
    v33[2] = __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_5;
    v33[3] = &unk_189E41E48;
    v33[4] = &v41;
    v33[5] = v57;
    v33[6] = &v51;
    v33[7] = &v47;
    [v25 revertIdentity:v12 withOptions:v32 completion:v33];

    objc_autoreleasePoolPop(v24);
  }

  else
  {
    uint64_t v26 = _CreateAndLogError( (uint64_t)"MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError",  1709LL,  (void *)*MEMORY[0x189610040],  25LL,  0LL,  &unk_189E46D00,  @"Bundle ID supplied to revert was nil.",  v22,  v30);
    id v27 = (void *)v42[5];
    v42[5] = v26;
  }

  if (a4 && *((_BYTE *)v48 + 24))
  {
    *a4 = (id) v52[5];
  }

  else if (!*((_BYTE *)v48 + 24))
  {
    if (a5)
    {
      *a5 = (id) v42[5];
    }

    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }

    _SendError(v19, (void *)v42[5]);
  }

  uint64_t v28 = *((unsigned __int8 *)v48 + 24);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);

  return v28;
}

void sub_18636DC7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, char a40)
{
}

void __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke( void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL))
  {
    id v8 = v3;
    [v3 objectForKeyedSubscript:@"Error"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5) {
      *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    }
    id v6 = (void (**)(void, void))a1[5];
    id v4 = v8;
    if (v6)
    {
      id v7 = (dispatch_queue_s *)a1[4];
      if (v7)
      {
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_2;
        block[3] = &unk_189E41DD0;
        char v11 = v6;
        id v10 = v8;
        dispatch_sync(v7, block);
      }

      else
      {
        ((void (**)(void, id))v6)[2](v6, v8);
      }

      id v4 = v8;
    }
  }
}

uint64_t __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void (***)(void))(a1 + 40);
  if (v2)
  {
    id v3 = *(dispatch_queue_s **)(a1 + 32);
    if (v3)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_4;
      block[3] = &unk_189E41E20;
      id v5 = v2;
      dispatch_sync(v3, block);
    }

    else
    {
      v2[2]();
    }
  }

uint64_t __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_4( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __MobileInstallationRevertApplicationWithIdentityAndAssertionBlockWithError_block_invoke_5( void *a1, char a2, void *a3, void *a4, void *a5)
{
  id v12 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((a2 & 1) != 0)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a3);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a4);
    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 1;
  }

  else
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8LL) + 40LL), a5);
  }
}

id MobileInstallationUninstallForInstallCoordinationWithError( void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v5 = (void *)MEMORY[0x189610090];
  MobileInstallationICLRecordsUninstallForInstallCoordinationWithError(a1, a2, a3, a4, a5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 uninstallRecordArrayToDictionary:v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id MobileInstallationICLRecordsUninstallForInstallCoordinationWithError( void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  v41[0] = 0LL;
  v41[1] = v41;
  v41[2] = 0x2020000000LL;
  char v42 = 0;
  uint64_t v35 = 0LL;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  id v38 = __Block_byref_object_copy__0;
  id v39 = __Block_byref_object_dispose__0;
  id v40 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  id v32 = __Block_byref_object_copy__0;
  id v33 = __Block_byref_object_dispose__0;
  uint64_t v13 = MEMORY[0x1895F87A8];
  id v34 = 0LL;
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke;
  v25[3] = &unk_189E41DF8;
  uint64_t v28 = v41;
  id v14 = v12;
  id v27 = v14;
  id v15 = v11;
  id v26 = v15;
  uint64_t v16 = (void *)MEMORY[0x186E38A4C](v25);
  +[MIInstallerClient installerWithProgressBlock:](&OBJC_CLASS___MIInstallerClient, "installerWithProgressBlock:", v14);
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472LL;
  v21[2] = __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke_3;
  v21[3] = &unk_189E41EE8;
  uint64_t v23 = &v29;
  id v18 = v16;
  id v22 = v18;
  uint64_t v24 = &v35;
  [v17 uninstallIdentifiers:v9 withOptions:v10 completion:v21];

  if (!v36[5])
  {
    if (a4)
    {
      *a4 = (id) v30[5];
    }

    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }

  id v19 = (id)v36[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(v41, 8);
  return v19;
}

void sub_18636E1D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

void __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke( void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL))
  {
    id v8 = v3;
    [v3 objectForKeyedSubscript:@"Error"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5) {
      *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    }
    id v6 = (void (**)(void, void))a1[5];
    id v4 = v8;
    if (v6)
    {
      id v7 = (dispatch_queue_s *)a1[4];
      if (v7)
      {
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke_2;
        block[3] = &unk_189E41DD0;
        id v11 = v6;
        id v10 = v8;
        dispatch_sync(v7, block);
      }

      else
      {
        ((void (**)(void, id))v6)[2](v6, v8);
      }

      id v4 = v8;
    }
  }
}

uint64_t __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __MobileInstallationICLRecordsUninstallForInstallCoordinationWithError_block_invoke_3( uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
    _SendError(*(void **)(a1 + 32), v6);
  }

  else if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
  }
}

uint64_t MobileInstallationUninstallAppWithIdentity(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = __Block_byref_object_copy__0;
  id v15 = __Block_byref_object_dispose__0;
  id v16 = 0LL;
  id v7 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __MobileInstallationUninstallAppWithIdentity_block_invoke;
  v10[3] = &unk_189E41F10;
  v10[4] = &v11;
  v10[5] = &v17;
  [v7 uninstallIdentity:v5 withOptions:v6 completion:v10];

  if (!*((_BYTE *)v18 + 24))
  {
    if (a3)
    {
      *a3 = (id) v12[5];
    }

    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }

  uint64_t v8 = *((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void sub_18636E508( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void __MobileInstallationUninstallAppWithIdentity_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

id MIFinalizeReferenceForInstalledAppWithError(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0LL;
  id v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __MIFinalizeReferenceForInstalledAppWithError_block_invoke;
  v7[3] = &unk_189E41EC0;
  v7[4] = &v8;
  v7[5] = &v14;
  [v4 finalizeReference:v3 withCompletion:v7];

  if (!v9[5])
  {
    if (a2)
    {
      *a2 = (id) v15[5];
    }

    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void sub_18636E6F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void __MIFinalizeReferenceForInstalledAppWithError_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    id v7 = v10;
  }

  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v7 = v5;
  }

  id v8 = v7;
  uint64_t v9 = *v6;
  void *v6 = v8;
}

id MIAcquireReferenceForInstalledAppWithError(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  uint64_t v19 = 0LL;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = 0LL;
  uint64_t v9 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __MIAcquireReferenceForInstalledAppWithError_block_invoke;
  v12[3] = &unk_189E41F38;
  v12[4] = &v13;
  v12[5] = &v19;
  [v9 acquireReferenceforInstalledAppWithIdentity:v7 inDomain:a2 matchingInstallSessionID:v8 withCompletion:v12];

  if (!v14[5])
  {
    if (a4)
    {
      *a4 = (id) v20[5];
    }

    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void sub_18636E928( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MIAcquireReferenceForInstalledAppWithError_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    id v7 = v10;
  }

  else
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v7 = v5;
  }

  id v8 = v7;
  uint64_t v9 = *v6;
  void *v6 = v8;
}

uint64_t MIInvalidateReferenceForInstalledAppWithError(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  id v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __MIInvalidateReferenceForInstalledAppWithError_block_invoke;
  v7[3] = &unk_189E41F10;
  v7[4] = &v12;
  v7[5] = &v8;
  [v4 invalidateReference:v3 withCompletion:v7];

  if (!*((_BYTE *)v9 + 24))
  {
    if (a2)
    {
      *a2 = (id) v13[5];
    }

    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
    }
  }

  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

void sub_18636EB28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MIInvalidateReferenceForInstalledAppWithError_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

uint64_t MobileInstallationLookupUninstalled(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x186E388C0]();
  uint64_t v3 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  if (!a1)
  {
    id v4 = (void *)objc_opt_new();
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __MobileInstallationLookupUninstalled_block_invoke;
    v6[3] = &unk_189E41F60;
    v6[4] = &v7;
    [v4 lookupUninstalledWithOptions:0 completion:v6];

    uint64_t v3 = v8[3];
  }

  _Block_object_dispose(&v7, 8);
  objc_autoreleasePoolPop(v2);
  return v3;
}

void sub_18636EC74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __MobileInstallationLookupUninstalled_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5)
  {
  }

  else if (v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v6;
  }
}

uint64_t MobileInstallationClearUninstalled(const __CFArray *a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x186E388C0]();
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  int v12 = 0;
  if (a2)
  {
    uint64_t v5 = 0xFFFFFFFFLL;
  }

  else if (CFArrayGetCount(a1))
  {
    id v6 = (void *)objc_opt_new();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __MobileInstallationClearUninstalled_block_invoke;
    v8[3] = &unk_189E41D80;
    v8[4] = &v9;
    [v6 clearUninstalledIdentifiers:a1 withOptions:0 completion:v8];

    uint64_t v5 = *((unsigned int *)v10 + 6);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  _Block_object_dispose(&v9, 8);
  objc_autoreleasePoolPop(v4);
  return v5;
}

void sub_18636EE0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __MobileInstallationClearUninstalled_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v4 = v3;
      MOLogWrite();
      id v3 = v4;
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -1;
  }
}

uint64_t MobileInstallationLookupSystemAppState(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x186E388C0]();
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  id v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __MobileInstallationLookupSystemAppState_block_invoke;
  v6[3] = &unk_189E41F60;
  v6[4] = &v7;
  [v3 lookupSystemAppStateWithOptions:a1 completion:v6];

  uint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  objc_autoreleasePoolPop(v2);
  return v4;
}

void sub_18636EF58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __MobileInstallationLookupSystemAppState_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5)
  {
  }

  else if (v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v6;
  }
}

uint64_t MobileInstallationUpdateSystemAppState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x186E388C0]();
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 1;
  id v5 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __MobileInstallationUpdateSystemAppState_block_invoke;
  v8[3] = &unk_189E41D80;
  v8[4] = &v9;
  [v5 updateSystemAppStateForIdentifier:a1 appState:a2 completion:v8];

  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  objc_autoreleasePoolPop(v4);
  return v6;
}

void sub_18636F0D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __MobileInstallationUpdateSystemAppState_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      id v4 = v3;
      MOLogWrite();
      id v3 = v4;
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }
}

uint64_t MobileInstallationCopyInstalledDeveloperAppsForLaunchServices()
{
  return 0LL;
}

BOOL MobileInstallationRegisterContentsForDiskImageAtURL(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  id v4 = (void *)MEMORY[0x186E388C0]();
  id v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __MobileInstallationRegisterContentsForDiskImageAtURL_block_invoke;
  v9[3] = &unk_189E41F10;
  v9[4] = &v14;
  v9[5] = &v10;
  [v5 registerContentsForDiskImageAtURL:v3 completion:v9];

  objc_autoreleasePoolPop(v4);
  int v6 = *((unsigned __int8 *)v11 + 24);
  if (a2 && !*((_BYTE *)v11 + 24))
  {
    *a2 = (id) v15[5];
    int v6 = *((unsigned __int8 *)v11 + 24);
  }

  BOOL v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void sub_18636F2EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationRegisterContentsForDiskImageAtURL_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

BOOL MobileInstallationUnregisterContentsForDiskImageAtURL(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  id v4 = (void *)MEMORY[0x186E388C0]();
  id v5 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __MobileInstallationUnregisterContentsForDiskImageAtURL_block_invoke;
  v9[3] = &unk_189E41F10;
  v9[4] = &v14;
  v9[5] = &v10;
  [v5 unregisterContentsForDiskImageAtURL:v3 completion:v9];

  objc_autoreleasePoolPop(v4);
  int v6 = *((unsigned __int8 *)v11 + 24);
  if (a2 && !*((_BYTE *)v11 + 24))
  {
    *a2 = (id) v15[5];
    int v6 = *((unsigned __int8 *)v11 + 24);
  }

  BOOL v7 = v6 != 0;
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void sub_18636F4E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationUnregisterContentsForDiskImageAtURL_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

id MobileInstallationEnumerateAllInstalledItemDictionaries(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = __Block_byref_object_copy__0;
  char v13 = __Block_byref_object_dispose__0;
  id v14 = 0LL;
  +[MIInstallerClient installerWithAppDictionaryEnumerator:]( &OBJC_CLASS___MIInstallerClient,  "installerWithAppDictionaryEnumerator:",  v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __MobileInstallationEnumerateAllInstalledItemDictionaries_block_invoke;
  v8[3] = &unk_189E41D80;
  v8[4] = &v9;
  [v5 enumerateInstalledAppsWithOptions:v3 completion:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_18636F68C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __MobileInstallationEnumerateAllInstalledItemDictionaries_block_invoke(uint64_t a1, void *a2)
{
}

id MobileInstallationUpdatePlaceholderMetadata(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v9 = a1;
  id v10 = a4;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = __Block_byref_object_copy__0;
  id v19 = __Block_byref_object_dispose__0;
  id v20 = 0LL;
  uint64_t v11 = (void *)objc_opt_new();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __MobileInstallationUpdatePlaceholderMetadata_block_invoke;
  v14[3] = &unk_189E41D80;
  v14[4] = &v15;
  [v11 updatePlaceholderMetadataForApp:v9 installType:a2 failureReason:a3 underlyingError:v10 failureSource:a5 completion:v14];

  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void sub_18636F7C8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __MobileInstallationUpdatePlaceholderMetadata_block_invoke(uint64_t a1, void *a2)
{
}

id MobileInstallationCopyAppMetadata(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = __Block_byref_object_copy__0;
  id v19 = __Block_byref_object_dispose__0;
  id v20 = 0LL;
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = __Block_byref_object_copy__0;
  char v13 = __Block_byref_object_dispose__0;
  id v14 = 0LL;
  id v4 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __MobileInstallationCopyAppMetadata_block_invoke;
  v8[3] = &unk_189E41F88;
  v8[4] = &v9;
  void v8[5] = &v15;
  [v4 getAppMetadataForApp:v3 completion:v8];

  id v5 = (void *)v10[5];
  if (a2 && !v5)
  {
    *a2 = (id) v16[5];
    id v5 = (void *)v10[5];
  }

  id v6 = v5;
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void sub_18636F91C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationCopyAppMetadata_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id MobileInstallationCopyFrameworkInfoForLaunchServices(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = __Block_byref_object_copy__0;
  id v22 = __Block_byref_object_dispose__0;
  id v23 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0LL;
  uint64_t v7 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __MobileInstallationCopyFrameworkInfoForLaunchServices_block_invoke;
  v11[3] = &unk_189E41FB0;
  v11[4] = &v18;
  v11[5] = &v12;
  [v7 fetchInfoForFrameworkAtURL:v5 options:v6 completion:v11];

  uint64_t v8 = (void *)v19[5];
  if (a3 && !v8)
  {
    *a3 = (id) v13[5];
    uint64_t v8 = (void *)v19[5];
  }

  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void sub_18636FAF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationCopyFrameworkInfoForLaunchServices_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x189610078] bundleRecordArrayToInfoDictionaryArray:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

id MobileInstallationGetFrameworkBundleRecordsForLaunchServices(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  uint64_t v21 = __Block_byref_object_copy__0;
  id v22 = __Block_byref_object_dispose__0;
  id v23 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0LL;
  uint64_t v7 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __MobileInstallationGetFrameworkBundleRecordsForLaunchServices_block_invoke;
  v11[3] = &unk_189E41FB0;
  v11[4] = &v18;
  v11[5] = &v12;
  [v7 fetchInfoForFrameworkAtURL:v5 options:v6 completion:v11];

  uint64_t v8 = (void *)v19[5];
  if (a3 && !v8)
  {
    *a3 = (id) v13[5];
    uint64_t v8 = (void *)v19[5];
  }

  id v9 = v8;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void sub_18636FCC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationGetFrameworkBundleRecordsForLaunchServices_block_invoke( uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id MobileInstallationCopyContainerizedAppInfoForLaunchServices(void *a1, void *a2, void *a3)
{
  id v3 = (void *)MEMORY[0x189610078];
  MobileInstallationGetContainerizedAppBundleRecordsForLaunchServices(a1, a2, a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 bundleRecordArrayToInfoDictionaryArray:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id MobileInstallationGetContainerizedAppBundleRecordsForLaunchServices(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = __Block_byref_object_copy__0;
  id v23 = __Block_byref_object_dispose__0;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = __Block_byref_object_copy__0;
  id v17 = __Block_byref_object_dispose__0;
  id v18 = 0LL;
  uint64_t v7 = (void *)MEMORY[0x186E388C0]();
  uint64_t v8 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __MobileInstallationGetContainerizedAppBundleRecordsForLaunchServices_block_invoke;
  v12[3] = &unk_189E41FB0;
  v12[4] = &v13;
  v12[5] = &v19;
  [v8 fetchInfoForContainerizedAppWithBundleID:v5 options:v6 completion:v12];

  objc_autoreleasePoolPop(v7);
  uint64_t v9 = (void *)v20[5];
  if (a3 && !v9)
  {
    *a3 = (id) v14[5];
    uint64_t v9 = (void *)v20[5];
  }

  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void sub_18636FEF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationGetContainerizedAppBundleRecordsForLaunchServices_block_invoke( uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    uint64_t v8 = v5;
  }

  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v8 = v11;
  }

  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;
}

uint64_t MobileInstallationCopyAppInfoForLaunchServicesWithWrapperURL( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  if (a3) {
    *a3 = v9;
  }

  return 0LL;
}

uint64_t MobileInstallationUpdateSinfDataForInstallCoordinationWithWrapperURL( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  if (a4) {
    *a4 = v9;
  }

  return 0LL;
}

BOOL MobileInstallationUpdateiTunesMetadataForInstallCoordinationWithWrapperURL( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = v9;
  if (a4 && v9) {
    *a4 = v9;
  }

  return v10 == 0LL;
}

uint64_t MobileInstallationCopyDiskUsageForLaunchServices(void *a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x1895F89C0];
  id v4 = (void *)MEMORY[0x186E388C0]();
  if (!a2)
  {
    goto LABEL_12;
  }

  CFTypeID v5 = CFGetTypeID(a1);
  if (CFStringGetTypeID() != v5)
  {
    if (CFArrayGetTypeID() == v5)
    {
      id v6 = a1;
      goto LABEL_9;
    }

    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
LABEL_13:
      uint64_t v9 = 0LL;
      goto LABEL_14;
    }

LABEL_12:
    MOLogWrite();
    goto LABEL_13;
  }

  v11[0] = a1;
  [MEMORY[0x189603F18] arrayWithObjects:v11 count:1];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  uint64_t v7 = v6;
  [MEMORY[0x189610098] defaultWorkspace];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 diskUsageForLaunchServicesWithBundleIDs:v7 options:a2 withError:0];

LABEL_14:
  objc_autoreleasePoolPop(v4);
  return v9;
}

  if (!v12) {
    *a3 = v6;
  }
LABEL_14:

  return v12;
}

uint64_t MobileInstallationRegisterSafeHarbor(uint64_t a1, uint64_t a2, const char *a3)
{
  CFTypeID v5 = (void *)MEMORY[0x186E388C0]();
  [NSString stringWithFileSystemRepresentation:a3 length:strlen(a3)];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1896100A0]) initWithBundleID:a2];
    uint64_t v8 = (MobileInstallationRegisterSafeHarborForContainerClassWithIdentity(v6, v7, 2LL, 0LL, 0LL) - 1);
  }

  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  objc_autoreleasePoolPop(v5);
  return v8;
}

BOOL MobileInstallationRegisterSafeHarborForContainerClassWithIdentity( void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = __Block_byref_object_copy__0;
  id v24 = __Block_byref_object_dispose__0;
  id v25 = 0LL;
  uint64_t v13 = (void *)MEMORY[0x186E388C0]();
  if (v11)
  {
    uint64_t v14 = _CreateAndLogError( (uint64_t)"MobileInstallationRegisterSafeHarborForContainerClassWithIdentity",  2311LL,  (void *)*MEMORY[0x189610040],  25LL,  0LL,  0LL,  @"The options parameter is currently unused and must be nil",  v12,  v19[0]);
    uint64_t v15 = (void *)v21[5];
    v21[5] = v14;
  }

  else
  {
    uint64_t v15 = (void *)objc_opt_new();
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = (uint64_t)__MobileInstallationRegisterSafeHarborForContainerClassWithIdentity_block_invoke;
    v19[3] = (uint64_t)&unk_189E41F10;
    v19[4] = (uint64_t)&v20;
    v19[5] = (uint64_t)&v26;
    [v15 registerSafeHarborAtPath:v9 forIdentity:v10 ofType:a3 withOptions:0 completion:v19];
  }

  objc_autoreleasePoolPop(v13);
  int v16 = *((unsigned __int8 *)v27 + 24);
  if (a5 && !*((_BYTE *)v27 + 24))
  {
    *a5 = (id) v21[5];
    int v16 = *((unsigned __int8 *)v27 + 24);
  }

  BOOL v17 = v16 != 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v17;
}

void sub_186370500( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

BOOL MobileInstallationRegisterSafeHarborForContainerType(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = (void *)MEMORY[0x186E388C0]();
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1896100A0]) initWithBundleID:a2];
  uint64_t v8 = _ContainerTypeForMCMContainerType(a3);
  BOOL v9 = MobileInstallationRegisterSafeHarborForContainerClassWithIdentity(a1, v7, v8, 0LL, 0LL);

  objc_autoreleasePoolPop(v6);
  return v9;
}

uint64_t _ContainerTypeForMCMContainerType(uint64_t result)
{
  return result;
}

void __MobileInstallationRegisterSafeHarborForContainerClassWithIdentity_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

uint64_t MobileInstallationRemoveSafeHarbor(uint64_t a1, uint64_t a2)
{
  return (MobileInstallationRemoveSafeHarborForContainerType(a2, 2LL) - 1);
}

BOOL MobileInstallationRemoveSafeHarborForContainerType(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x186E388C0]();
  id v5 = (void *)[objc_alloc(MEMORY[0x1896100A0]) initWithBundleID:a1];
  uint64_t v6 = _ContainerTypeForMCMContainerType(a2);
  BOOL v7 = MobileInstallationRemoveSafeHarborForContainerClassWithIdentity(v5, v6, 0LL, 0LL);

  objc_autoreleasePoolPop(v4);
  return v7;
}

BOOL MobileInstallationRemoveSafeHarborForContainerClassWithIdentity( void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  id v22 = 0LL;
  uint64_t v10 = (void *)MEMORY[0x186E388C0]();
  if (v8)
  {
    uint64_t v11 = _CreateAndLogError( (uint64_t)"MobileInstallationRemoveSafeHarborForContainerClassWithIdentity",  2371LL,  (void *)*MEMORY[0x189610040],  25LL,  0LL,  0LL,  @"The options parameter is currently unused and must be nil",  v9,  v16[0]);
    uint64_t v12 = (void *)v18[5];
    v18[5] = v11;
  }

  else
  {
    uint64_t v12 = (void *)objc_opt_new();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = (uint64_t)__MobileInstallationRemoveSafeHarborForContainerClassWithIdentity_block_invoke;
    v16[3] = (uint64_t)&unk_189E41F10;
    v16[4] = (uint64_t)&v17;
    v16[5] = (uint64_t)&v23;
    [v12 removeSafeHarborForIdentity:v7 ofType:a2 withOptions:0 completion:v16];
  }

  objc_autoreleasePoolPop(v10);
  int v13 = *((unsigned __int8 *)v24 + 24);
  if (a4 && !*((_BYTE *)v24 + 24))
  {
    *a4 = (id) v18[5];
    int v13 = *((unsigned __int8 *)v24 + 24);
  }

  BOOL v14 = v13 != 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void sub_186370888( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __MobileInstallationRemoveSafeHarborForContainerClassWithIdentity_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

uint64_t MobileInstallationCopySafeHarbors()
{
  return MobileInstallationCopySafeHarborsForContainerType(2LL);
}

uint64_t MobileInstallationCopySafeHarborsForContainerType(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x186E388C0]();
  uint64_t v3 = _ContainerTypeForMCMContainerType(a1);
  [MEMORY[0x1896100B0] sharedInstance];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 primaryPersonaString];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MobileInstallationCopySafeHarborsForContainerClass(v3, v5, 0LL, 0LL);

  objc_autoreleasePoolPop(v2);
  return v6;
}

id MobileInstallationCopySafeHarborsForContainerClass(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  char v26 = __Block_byref_object_copy__0;
  id v27 = __Block_byref_object_dispose__0;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  id v22 = 0LL;
  uint64_t v10 = (void *)MEMORY[0x186E388C0]();
  if (v8)
  {
    uint64_t v11 = _CreateAndLogError( (uint64_t)"MobileInstallationCopySafeHarborsForContainerClass",  2425LL,  (void *)*MEMORY[0x189610040],  25LL,  0LL,  0LL,  @"The options parameter is currently unused and must be nil",  v9,  v16[0]);
  }

  else
  {
    if (v7)
    {
      uint64_t v12 = (void *)objc_opt_new();
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = (uint64_t)__MobileInstallationCopySafeHarborsForContainerClass_block_invoke;
      v16[3] = (uint64_t)&unk_189E41FD8;
      v16[4] = (uint64_t)&v17;
      v16[5] = (uint64_t)&v23;
      [v12 listSafeHarborsOfType:a1 forPersona:v7 withOptions:0 completion:v16];
      goto LABEL_6;
    }

    uint64_t v11 = _CreateAndLogError( (uint64_t)"MobileInstallationCopySafeHarborsForContainerClass",  2431LL,  (void *)*MEMORY[0x189610040],  25LL,  0LL,  0LL,  @"The persona parameter must be specified",  v9,  v16[0]);
  }

  uint64_t v12 = (void *)v18[5];
  v18[5] = v11;
LABEL_6:

  objc_autoreleasePoolPop(v10);
  int v13 = v24;
  if (a4 && !v24[5])
  {
    *a4 = (id) v18[5];
    int v13 = v24;
  }

  id v14 = (id)v13[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

void sub_186370BB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationCopySafeHarborsForContainerClass_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(void *)(v6 + 40))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      MOLogWrite();
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    }

    id v7 = (void **)(v6 + 40);
    uint64_t v8 = v5;
    goto LABEL_8;
  }

  if (v11)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v8 = v11;
LABEL_8:
    id v9 = v8;
    uint64_t v10 = *v7;
    void *v7 = v9;
  }
}

uint64_t MobileInstallationCheckCapabilitiesMatch(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x186E388C0]();
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  id v5 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __MobileInstallationCheckCapabilitiesMatch_block_invoke;
  v8[3] = &unk_189E41F60;
  v8[4] = &v9;
  [v5 checkCapabilities:a1 withOptions:a2 completion:v8];

  uint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  objc_autoreleasePoolPop(v4);
  return v6;
}

void sub_186370D68( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __MobileInstallationCheckCapabilitiesMatch_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5)
  {
  }

  else if (v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v6;
  }
}

id MobileInstallationUpdateSinfDataForInstallCoordination(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = __Block_byref_object_copy__0;
  char v26 = __Block_byref_object_dispose__0;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy__0;
  uint64_t v20 = __Block_byref_object_dispose__0;
  id v21 = 0LL;
  uint64_t v10 = (void *)MEMORY[0x186E388C0]();
  uint64_t v11 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __MobileInstallationUpdateSinfDataForInstallCoordination_block_invoke;
  v15[3] = &unk_189E42000;
  v15[4] = &v16;
  v15[5] = &v22;
  [v11 updateSinfForIXWithIdentifier:v7 withOptions:v8 sinfData:v9 completion:v15];

  objc_autoreleasePoolPop(v10);
  uint64_t v12 = (void *)v23[5];
  if (a4 && !v12)
  {
    *a4 = (id) v17[5];
    uint64_t v12 = (void *)v23[5];
  }

  id v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void sub_186370F84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationUpdateSinfDataForInstallCoordination_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    id v7 = v5;
    goto LABEL_8;
  }

  if (v10)
  {
    id v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v7 = v10;
LABEL_8:
    id v8 = v7;
    id v9 = *v6;
    void *v6 = v8;
  }
}

BOOL MobileInstallationUpdateiTunesMetadataForInstallCoordination(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = 0LL;
  id v7 = (void *)MEMORY[0x186E388C0]();
  id v8 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __MobileInstallationUpdateiTunesMetadataForInstallCoordination_block_invoke;
  v12[3] = &unk_189E41D80;
  v12[4] = &v13;
  [v8 updateiTunesMetadataForIXWithIdentifier:v5 metadata:v6 completion:v12];

  objc_autoreleasePoolPop(v7);
  id v9 = (void *)v14[5];
  if (a3 && v9)
  {
    *a3 = v9;
    id v9 = (void *)v14[5];
  }

  BOOL v10 = v9 == 0LL;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void sub_18637117C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __MobileInstallationUpdateiTunesMetadataForInstallCoordination_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t MobileInstallationAppLaunchEnabled()
{
  return 0LL;
}

uint64_t MobileInstallationSetAppLaunchState( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = v9;
  if (a4) {
    *a4 = v9;
  }

  return 0LL;
}

uint64_t MobileInstallationWatchKitInstallerSnapshotWKApp( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = v9;
  if (a4) {
    *a4 = v9;
  }

  return 0LL;
}

BOOL MobileInstallationSetSystemAppMigrationComplete(void *a1)
{
  uint64_t v9 = 0LL;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0LL;
  uint64_t v2 = (void *)MEMORY[0x186E388C0]();
  id v3 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __MobileInstallationSetSystemAppMigrationComplete_block_invoke;
  v8[3] = &unk_189E41D80;
  v8[4] = &v9;
  [v3 setSystemAppMigrationComplete:v8];

  objc_autoreleasePoolPop(v2);
  uint64_t v4 = v10;
  if (a1)
  {
    id v5 = (void *)v10[5];
    if (v5)
    {
      *a1 = v5;
      uint64_t v4 = v10;
    }
  }

  BOOL v6 = v4[5] == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_186371424( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __MobileInstallationSetSystemAppMigrationComplete_block_invoke(uint64_t a1, void *a2)
{
}

BOOL MobileInstallationWaitForSystemAppMigrationToComplete(void *a1)
{
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = 0LL;
  uint64_t v9 = 0LL;
  BOOL v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 1;
  uint64_t v2 = (void *)MEMORY[0x186E388C0]();
  char HasCompleted = MISystemAppMigrationHasCompleted();
  if ((HasCompleted & 1) == 0)
  {
    uint64_t v4 = (void *)objc_opt_new();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __MobileInstallationWaitForSystemAppMigrationToComplete_block_invoke;
    v8[3] = &unk_189E41F10;
    v8[4] = &v9;
    void v8[5] = &v13;
    [v4 waitForSystemAppMigratorToComplete:v8];
  }

  objc_autoreleasePoolPop(v2);
  if ((HasCompleted & 1) != 0)
  {
    BOOL v5 = 1LL;
  }

  else
  {
    if (a1)
    {
      BOOL v6 = (void *)v14[5];
      if (v6) {
        *a1 = v6;
      }
    }

    BOOL v5 = *((_BYTE *)v10 + 24) != 0;
  }

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v5;
}

void sub_186371588( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationWaitForSystemAppMigrationToComplete_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    id v4 = v5;
  }
}

void MobileInstallationWaitForSystemAppMigrationWithCompletion(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x186E388C0]();
  if (MISystemAppMigrationHasCompleted())
  {
    v1[2](v1, 0LL);
  }

  else
  {
    id v3 = (void *)objc_opt_new();
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __MobileInstallationWaitForSystemAppMigrationWithCompletion_block_invoke;
    v4[3] = &unk_189E42028;
    id v5 = v1;
    [v3 waitForSystemAppMigratorWithCompletion:v4];
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t __MobileInstallationWaitForSystemAppMigrationWithCompletion_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t MobileInstallationGetSystemAppMigrationStatus(_BYTE *a1, void *a2)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0LL;
  id v4 = (void *)MEMORY[0x186E388C0]();
  int HasCompleted = MISystemAppMigrationHasCompleted();
  char v6 = HasCompleted;
  if (HasCompleted)
  {
    *a1 = 1;
  }

  else
  {
    id v7 = (void *)objc_opt_new();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    void v11[2] = __MobileInstallationGetSystemAppMigrationStatus_block_invoke;
    v11[3] = &unk_189E42050;
    v11[4] = &v12;
    v11[5] = a1;
    [v7 systemAppMigratorHasCompleted:v11];
  }

  objc_autoreleasePoolPop(v4);
  if ((v6 & 1) != 0)
  {
    uint64_t v8 = 1LL;
  }

  else
  {
    uint64_t v8 = 1LL;
    if (a2)
    {
      uint64_t v9 = (void *)v13[5];
      if (v9)
      {
        uint64_t v8 = 0LL;
        *a2 = v9;
      }
    }
  }

  _Block_object_dispose(&v12, 8);

  return v8;
}

void sub_1863717EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __MobileInstallationGetSystemAppMigrationStatus_block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a3);
    id v6 = v7;
  }

  else
  {
    **(_BYTE **)(a1 + 40) = a2;
  }
}

uint64_t MobileInstallationGetInstalldPid()
{
  uint64_t v0 = (void *)MEMORY[0x186E388C0]();
  uint64_t v1 = (void *)objc_opt_new();
  uint64_t v2 = [v1 pidForTesting];

  objc_autoreleasePoolPop(v0);
  return v2;
}

void MobileInstallationKillInstalld()
{
  uint64_t v0 = (void *)MEMORY[0x186E388C0]();
  uint64_t v1 = (void *)objc_opt_new();
  [v1 dieForTesting];

  objc_autoreleasePoolPop(v0);
}

id MobileInstallationSimulateExceptionInDaemon()
{
  uint64_t v0 = (void *)MEMORY[0x186E388C0]();
  uint64_t v1 = (void *)objc_opt_new();
  [v1 raiseException];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v0);
  return v2;
}

uint64_t MobileInstallationGetHelperServicePid()
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  int v13 = -1;
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithServiceName:@"com.apple.MobileInstallationHelperService"];
  if (v0)
  {
    MobileInstallationHelperServiceProtocolInterface();
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
    [v0 setRemoteObjectInterface:v1];

    [v0 resume];
    uint64_t v2 = MEMORY[0x1895F87A8];
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __MobileInstallationGetHelperServicePid_block_invoke;
    v8[3] = &unk_189E42078;
    id v3 = v0;
    id v9 = v3;
    [v3 synchronousRemoteObjectProxyWithErrorHandler:v8];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v2;
    v7[1] = 3221225472LL;
    v7[2] = __MobileInstallationGetHelperServicePid_block_invoke_2;
    v7[3] = &unk_189E41D38;
    v7[4] = &v10;
    [v4 getPidForTestingWithCompletion:v7];

    [v3 invalidate];
    uint64_t v5 = *((unsigned int *)v11 + 6);
  }

  else
  {
    NSLog( @"Warning, couldn't initialize xpc connection to %@",  @"com.apple.MobileInstallationHelperService");
    uint64_t v5 = *((unsigned int *)v11 + 6);
  }

  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_186371A9C(_Unwind_Exception *a1)
{
}

void __MobileInstallationGetHelperServicePid_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 serviceName];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(@"Warning, couldn't get pid of %@ error: %@", v4, v3);
}

uint64_t __MobileInstallationGetHelperServicePid_block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

void MobileInstallationKillHelperService()
{
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithServiceName:@"com.apple.MobileInstallationHelperService"];
  if (v0)
  {
    MobileInstallationHelperServiceProtocolInterface();
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
    [v0 setRemoteObjectInterface:v1];

    [v0 resume];
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __MobileInstallationKillHelperService_block_invoke;
    v4[3] = &unk_189E42078;
    id v2 = v0;
    id v5 = v2;
    [v2 synchronousRemoteObjectProxyWithErrorHandler:v4];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 dieForTesting];

    [v2 invalidate];
  }

  else
  {
    NSLog( @"Warning, couldn't initialize xpc connection to %@",  @"com.apple.MobileInstallationHelperService");
  }
}

void __MobileInstallationKillHelperService_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 serviceName];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(@"Warning, couldn't kill %@ error: %@", v4, v3);
}

uint64_t MobileInstallationSetTestMode(void *a1)
{
  id v2 = (void *)MEMORY[0x186E388C0]();
  id v3 = (void *)objc_opt_new();
  id v7 = 0LL;
  uint64_t v4 = [v3 setTestMode:&v7];
  id v5 = v7;

  objc_autoreleasePoolPop(v2);
  if (a1 && (v4 & 1) == 0) {
    *a1 = v5;
  }

  return v4;
}

uint64_t MobileInstallationEndTestMode(void *a1)
{
  id v2 = (void *)MEMORY[0x186E388C0]();
  id v3 = (void *)objc_opt_new();
  id v7 = 0LL;
  uint64_t v4 = [v3 endTestMode:&v7];
  id v5 = v7;

  objc_autoreleasePoolPop(v2);
  if (a1 && (v4 & 1) == 0) {
    *a1 = v5;
  }

  return v4;
}

uint64_t MobileInstallationGetTestModeEnabled(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)MEMORY[0x186E388C0]();
  id v5 = (void *)objc_opt_new();
  id v9 = 0LL;
  uint64_t v6 = [v5 getTestModeEnabled:a1 outError:&v9];
  id v7 = v9;

  objc_autoreleasePoolPop(v4);
  if (a2 && (v6 & 1) == 0) {
    *a2 = v7;
  }

  return v6;
}

uint64_t MobileInstallationSetTestFlags(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)MEMORY[0x186E388C0]();
  id v5 = (void *)objc_opt_new();
  id v9 = 0LL;
  uint64_t v6 = [v5 setTestFlags:a1 withError:&v9];
  id v7 = v9;

  objc_autoreleasePoolPop(v4);
  if (a2 && (v6 & 1) == 0) {
    *a2 = v7;
  }

  return v6;
}

uint64_t MobileInstallationClearTestFlags(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)MEMORY[0x186E388C0]();
  id v5 = (void *)objc_opt_new();
  id v9 = 0LL;
  uint64_t v6 = [v5 clearTestFlags:a1 withError:&v9];
  id v7 = v9;

  objc_autoreleasePoolPop(v4);
  if (a2 && (v6 & 1) == 0) {
    *a2 = v7;
  }

  return v6;
}

uint64_t MobileInstallationSetEligibilityTestOverrides(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)MEMORY[0x186E388C0]();
  id v5 = (void *)objc_opt_new();
  id v9 = 0LL;
  uint64_t v6 = [v5 setEligibilityTestOverrides:v3 withError:&v9];
  id v7 = v9;

  objc_autoreleasePoolPop(v4);
  if (a2 && (v6 & 1) == 0) {
    *a2 = v7;
  }

  return v6;
}

BOOL MICreateSerializedPlaceholderForInstalledApplication(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v25 = 0LL;
  char v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0LL;
  [MEMORY[0x1896100A8] defaultManager];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  uint64_t v12 = [v10 deviceForURLOrFirstAvailableParent:v9 error:&obj];
  objc_storeStrong(v11, obj);

  if ((_DWORD)v12 != -1)
  {
    int v13 = (void *)objc_opt_new();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __MICreateSerializedPlaceholderForInstalledApplication_block_invoke;
    v17[3] = &unk_189E41F10;
    v17[4] = &v19;
    v17[5] = &v25;
    [v13 createSerializedPlaceholderForInstalledAppWithBundeID:v7 personaUniqueString:v8 atResultURL:v9 onDevice:v12 withCompletion:v17];
  }

  int v14 = *((unsigned __int8 *)v26 + 24);
  if (a4 && !*((_BYTE *)v26 + 24))
  {
    *a4 = (id) v20[5];
    int v14 = *((unsigned __int8 *)v26 + 24);
  }

  BOOL v15 = v14 != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void sub_186372188( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void __MICreateSerializedPlaceholderForInstalledApplication_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

BOOL MISetLaunchWarning(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  id v20 = 0LL;
  uint64_t v10 = (void *)objc_opt_new();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __MISetLaunchWarning_block_invoke;
  v14[3] = &unk_189E41F10;
  v14[4] = &v15;
  void v14[5] = &v21;
  [v10 setLaunchWarningForApp:v7 withUniqueInstallIdentifier:v8 warningData:v9 completion:v14];

  int v11 = *((unsigned __int8 *)v22 + 24);
  if (a4 && !*((_BYTE *)v22 + 24))
  {
    *a4 = (id) v16[5];
    int v11 = *((unsigned __int8 *)v22 + 24);
  }

  BOOL v12 = v11 != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void sub_186372364( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MISetLaunchWarning_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

id MIGetReferencesForBundleWithIdentifier(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  id v22 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0LL;
  uint64_t v6 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __MIGetReferencesForBundleWithIdentifier_block_invoke;
  v10[3] = &unk_189E41FD8;
  v10[4] = &v11;
  v10[5] = &v17;
  [v6 referencesForBundleWithIdentifier:v5 inDomain:a2 withCompletion:v10];

  id v7 = (void *)v18[5];
  if (a3 && !v7)
  {
    *a3 = (id) v12[5];
    id v7 = (void *)v18[5];
  }

  id v8 = v7;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void sub_18637251C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MIGetReferencesForBundleWithIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    uint64_t v8 = v5;
  }

  else
  {
    id v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v8 = v11;
  }

  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;
}

BOOL MobileInstallationSetPersonaForDataSeparatedApps(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy__0;
  id v20 = __Block_byref_object_dispose__0;
  id v21 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  id v7 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  void v11[2] = __MobileInstallationSetPersonaForDataSeparatedApps_block_invoke;
  v11[3] = &unk_189E41F10;
  v11[4] = &v16;
  v11[5] = &v12;
  [v7 setDataSeparatedAppsWithBundleIDs:v5 withPersona:v6 withCompletion:v11];

  int v8 = *((unsigned __int8 *)v13 + 24);
  if (a3 && !*((_BYTE *)v13 + 24))
  {
    *a3 = (id) v17[5];
    int v8 = *((unsigned __int8 *)v13 + 24);
  }

  BOOL v9 = v8 != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void sub_1863726F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationSetPersonaForDataSeparatedApps_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

BOOL MobileInstallationAddDataSeparatedAppsToPersona(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy__0;
  id v20 = __Block_byref_object_dispose__0;
  id v21 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  id v7 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  void v11[2] = __MobileInstallationAddDataSeparatedAppsToPersona_block_invoke;
  v11[3] = &unk_189E41F10;
  v11[4] = &v16;
  v11[5] = &v12;
  [v7 addDataSeparatedAppsWithBundleIDs:v5 toPersona:v6 withCompletion:v11];

  int v8 = *((unsigned __int8 *)v13 + 24);
  if (a3 && !*((_BYTE *)v13 + 24))
  {
    *a3 = (id) v17[5];
    int v8 = *((unsigned __int8 *)v13 + 24);
  }

  BOOL v9 = v8 != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void sub_1863728B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationAddDataSeparatedAppsToPersona_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

BOOL MobileInstallationRemoveDataSeparatedAppsFromPersona(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  uint64_t v19 = __Block_byref_object_copy__0;
  id v20 = __Block_byref_object_dispose__0;
  id v21 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  id v7 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  void v11[2] = __MobileInstallationRemoveDataSeparatedAppsFromPersona_block_invoke;
  v11[3] = &unk_189E41F10;
  v11[4] = &v16;
  v11[5] = &v12;
  [v7 removeDataSeparatedAppsWithBundleIDs:v5 fromPersona:v6 withCompletion:v11];

  int v8 = *((unsigned __int8 *)v13 + 24);
  if (a3 && !*((_BYTE *)v13 + 24))
  {
    *a3 = (id) v17[5];
    int v8 = *((unsigned __int8 *)v13 + 24);
  }

  BOOL v9 = v8 != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void sub_186372A74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __MobileInstallationRemoveDataSeparatedAppsFromPersona_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v4 = v5;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
}

id MobileInstallationLinkedBundleIDsForIdentity(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = __Block_byref_object_copy__0;
  id v21 = __Block_byref_object_dispose__0;
  id v22 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = __Block_byref_object_copy__0;
  char v15 = __Block_byref_object_dispose__0;
  id v16 = 0LL;
  [v3 bundleID];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (([v4 isEqualToString:@"com.apple.Playgrounds"] & 1) != 0
    || ([v4 isEqualToString:@"com.apple.mock.Playgrounds"] & 1) != 0)
  {
    id v5 = (void *)objc_opt_new();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __MobileInstallationLinkedBundleIDsForIdentity_block_invoke;
    v10[3] = &unk_189E420A0;
    v10[4] = &v17;
    v10[5] = &v11;
    [v5 linkedBundleIDsForAppIdentity:v3 withCompletion:v10];
  }

  else
  {
    uint64_t v6 = objc_opt_new();
    id v5 = (void *)v12[5];
    void v12[5] = v6;
  }

  id v7 = (void *)v12[5];
  if (a2 && !v7)
  {
    *a2 = (id) v18[5];
    id v7 = (void *)v12[5];
  }

  id v8 = v7;

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v8;
}

void sub_186372C74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __MobileInstallationLinkedBundleIDsForIdentity_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    id v8 = v5;
  }

  else
  {
    uint64_t v7 = (void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v8 = v11;
  }

  id v9 = v8;
  uint64_t v10 = *v7;
  void *v7 = v9;
}

uint64_t MIGetBooleanEntitlement(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1)
  {
    [a1 objectForKeyedSubscript:v5];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        a3 = [v6 BOOLValue];
      }

      else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        MOLogWrite();
      }
    }

    else
    {
      a3 = 0LL;
    }
  }

  else
  {
    a3 = 0LL;
  }

  return a3;
}

uint64_t MIGetFirstTrueBooleanEntitlement(void *a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = a2;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if ((MIGetBooleanEntitlement(v5, *(void **)(*((void *)&v13 + 1) + 8 * v10), a3) & 1) != 0)
        {
          uint64_t v11 = 1LL;
          goto LABEL_11;
        }

        ++v10;
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v11 = 0LL;
LABEL_11:

  return v11;
}

uint64_t MIHasUpgradeEnabledEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.mobileinstall.upgrade-enabled", 0LL);
}

uint64_t MIHasContainerRequiredEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.container-required", 1LL);
}

uint64_t MIHasNoContainerEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.no-container", 0LL);
}

uint64_t MIHasNoSandboxEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.no-sandbox", 0LL);
}

BOOL MIHasSeatbeltProfilesEntitlement(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v2 = v1 != 0LL;

  return v2;
}

uint64_t MIHasPlatformApplicationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"platform-application", 0LL);
}

uint64_t MIHasSystemContainerEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.security.system-container", 0LL);
}

uint64_t MIHasXPCServicesAllowedEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.mobileinstall.xpc-services-enabled", 0LL);
}

uint64_t MIHasSystemApplicationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.security.system-application", 0LL);
}

uint64_t MIHasWebKitPushBundleEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.private.webkit.pushbundle", 0LL);
}

uint64_t MIHasMarketplaceEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.marketplace.app-installation", 0LL);
}

id MICopyPlaceholderEntitlements(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603F68] dictionaryWithContentsOfURL:v1];
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t MIWritePlaceholderEntitlements(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [a1 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend(v5, "MI_writeToURL:format:options:error:", v6, 200, 268435457, a3);

  return v7;
}

id MICopyApplicationGroupEntitlement(void *a1)
{
  return _MICommonCopyGroupEntitlement(a1, @"com.apple.security.application-groups");
}

id _MICommonCopyGroupEntitlement(void *a1, void *a2)
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v3 = a2;
  [a1 objectForKeyedSubscript:v3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4) {
    goto LABEL_14;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if ((isKindOfClass & 1) == 0)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10[0] = v4;
      [MEMORY[0x189603F18] arrayWithObjects:v10 count:1];
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6) {
        goto LABEL_7;
      }
LABEL_15:
      uint64_t v8 = 0LL;
      goto LABEL_16;
    }

    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
LABEL_14:
      id v6 = 0LL;
      goto LABEL_15;
    }

LABEL_13:
    MOLogWrite();
    goto LABEL_14;
  }

  if ((MIArrayContainsOnlyClass(v4) & 1) == 0)
  {
    goto LABEL_13;
  }

  id v6 = v4;
LABEL_7:
  [MEMORY[0x189604010] setWithArray:v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 allObjects];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v8;
}

  return v11;
}

    uint64_t v11 = v11;
    *a4 = v11;
    goto LABEL_14;
  }

  uint64_t v10 = IFCaptureIconContent();
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  __int128 v13 = v12;
  if ((v10 & 1) != 0)
  {
    if (![v11 count] && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
    {
      [v9 path];
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

      if (!a4) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }

    goto LABEL_12;
  }

  if (!v12)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      [v9 path];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    __int128 v13 = 0LL;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    [v9 path];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
  }

  if (a5)
  {
    __int128 v13 = v13;
    __int128 v14 = 0;
    *a5 = v13;
  }

  else
  {
    __int128 v14 = 0;
  }

BOOL MIHasAnyApplicationGroupEntitlements(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v2 = v1 != 0LL;

  return v2;
}

id MICopySystemGroupEntitlement(void *a1)
{
  id v1 = a1;
  _MICommonCopyGroupEntitlement(v1, @"com.apple.security.system-groups");
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (!v2 || ![v2 count])
  {
    uint64_t v4 = _MICommonCopyGroupEntitlement(v1, @"com.apple.security.system-group-containers");

    id v3 = (void *)v4;
  }

  return v3;
}

BOOL MIHasAnySystemGroupEntitlements(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v2 = v1 != 0LL;

  return v2;
}

uint64_t MIHasOnDemandInstallCapableEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.on-demand-install-capable", 0LL);
}

id MICopyParentIdentifiersEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  else {
    id v4 = 0LL;
  }

  return v4;
}

id MICopyApplicationIdentifierEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id MICopyPreviousApplicationIdentifiersEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  MIArrayifyThing(v1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t MIHasBetaReportsActiveEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"beta-reports-active", 0LL);
}

id MICopyKeychainAccessGroupEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  else {
    id v4 = 0LL;
  }

  return v4;
}

uint64_t MIHasSwiftPlaygroundsAppEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.swift-playgrounds-app", 0LL);
}

id MICopyAppManagementDomainEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

uint64_t MIClassifyAppManagementDomainValue(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    if ([v1 hasPrefix:@"swift-playgrounds"])
    {
      uint64_t v3 = 2LL;
    }

    else if ([v2 isEqualToString:@"com.apple.WebKit.PushBundles"])
    {
      uint64_t v3 = 3LL;
    }

    else
    {
      uint64_t v3 = 0LL;
    }
  }

  else
  {
    uint64_t v3 = 1LL;
  }

  return v3;
}

uint64_t MIClassifyAppManagementDomainEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = MIClassifyAppManagementDomainValue(v1);

  return v2;
}

id MICopyNetworkExtensionEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  else {
    id v4 = 0LL;
  }

  return v4;
}

id MICopyAssociatedAppClipsEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  else {
    id v4 = 0LL;
  }

  return v4;
}

uint64_t MIHasDriverKitEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.driverkit", 0LL);
}

id MICopyDataProtectionClassEntitlement(void *a1)
{
  id v1 = a1;
  [v1 objectForKeyedSubscript:@"com.apple.developer.default-data-protection"];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0LL;
  }

  if (!v4)
  {
    [v1 objectForKeyedSubscript:@"data-protection-class"];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v6 = v5;
    id v4 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0LL;

    if (!v4)
    {
      [v1 objectForKeyedSubscript:@"DataProtectionClass"];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      id v8 = v7;
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        id v4 = v8;
      }
      else {
        id v4 = 0LL;
      }
    }
  }

  return v4;
}

id MICopyDataProtectionIfAvailableEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  if (v3)
  {
    id v4 = v2;
  }

  else
  {
    objc_opt_class();
    id v5 = v2;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0LL;
    }

    if (v6)
    {
      id v7 = v5;
      objc_opt_class();
      MIArrayFilteredToContainOnlyClass(v7);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v4 = 0LL;
    }
  }

  return v4;
}

uint64_t MIHasBrowserEngineHostEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.host", 0LL);
}

uint64_t MIHasEmbeddedBrowserEngineEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.embedded-web-browser-engine", 0LL);
}

uint64_t MIHasBrowserEngineRenderingEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.rendering", 0LL);
}

uint64_t MIHasBrowserEngineNetworkingEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.networking", 0LL);
}

uint64_t MIHasBrowserEngineContentEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser-engine.webcontent", 0LL);
}

id MICopyMemoryTransferAcceptEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id MICopyMemoryTransferSendEntitlement(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

uint64_t MIHasDefaultBrowserEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.web-browser", 0LL);
}

uint64_t MIHasBrowserAppInstallationEntitlement(void *a1)
{
  return MIGetBooleanEntitlement(a1, @"com.apple.developer.browser.app-installation", 0LL);
}

uint64_t MISystemAppMigrationHasCompleted()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 migrationPlistURL];
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = MIIsBuildUpgrade() ^ 1;

  return v2;
}

uint64_t MIBooleanValue(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

uint64_t MIArrayContainsOnlyClass(void *a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v6 = 0LL;
          goto LABEL_11;
        }

        ++v5;
      }

      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  uint64_t v6 = 1LL;
LABEL_11:

  return v6;
}

id MIArrayFilteredToContainOnlyClass(void *a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          objc_msgSend(v2, "addObject:", v8, (void)v11);
        }
        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  __int128 v9 = (void *)[v2 copy];
  return v9;
}

uint64_t MIDictionaryContainsOnlyClasses(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v9 = 0LL;
  __int128 v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 1;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __MIDictionaryContainsOnlyClasses_block_invoke;
  v8[3] = &unk_189E42108;
  void v8[4] = &v9;
  void v8[5] = a2;
  void v8[6] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_186374FA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void __MIDictionaryContainsOnlyClasses_block_invoke(void *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (a1[5] && (objc_opt_isKindOfClass() & 1) == 0 || a1[6] && (objc_opt_isKindOfClass() & 1) == 0)
  {
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

id MIStringifyObject(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v2 = v1;
    }

    else
    {
      [NSString stringWithFormat:@"%@", v1];
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v3 = v2;
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

id MIArrayifyThing(void *a1)
{
  v6[1] = *MEMORY[0x1895F89C0];
  id v1 = a1;
  if (!v1) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (MIArrayContainsOnlyClass(v1))
    {
      id v2 = v1;
LABEL_7:
      id v3 = v2;
      goto LABEL_12;
    }

    goto LABEL_11;
  }

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6[0] = v1;
    [MEMORY[0x189603F18] arrayWithObjects:v6 count:1];
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    id v3 = 0LL;
    goto LABEL_12;
  }

  [v1 allObjects];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    id v3 = 0LL;
  }

LABEL_12:
  return v3;
}

BOOL MICompareObjects(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  BOOL v6 = (v3 != 0) == (v4 != 0) && (!v3 || !v4 || [v3 isEqual:v4]);

  return v6;
}

LABEL_24:
  return v29;
}

id MIEnumerateContainersOfClass(void *a1, uint64_t a2, void *a3)
{
  v26[4] = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a3;
  [MEMORY[0x1896100A8] defaultManager];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v5;
  uint64_t v9 = v8;
  switch(a2)
  {
    case 1LL:
      __int128 v10 = &unk_189E46D40;
      goto LABEL_14;
    case 2LL:
      v26[0] = @"mobile";
      v26[1] = @"Containers";
      v26[2] = @"Data";
      v26[3] = @"Application";
      uint64_t v11 = (void *)MEMORY[0x189603F18];
      char v12 = v26;
      goto LABEL_12;
    case 4LL:
      v25[0] = @"mobile";
      v25[1] = @"Containers";
      v25[2] = @"Data";
      v25[3] = @"PluginKitPlugin";
      uint64_t v11 = (void *)MEMORY[0x189603F18];
      char v12 = v25;
      goto LABEL_12;
    case 7LL:
      v24[0] = @"mobile";
      v24[1] = @"Containers";
      v24[2] = @"Shared";
      v24[3] = @"AppGroup";
      uint64_t v11 = (void *)MEMORY[0x189603F18];
      char v12 = v24;
      goto LABEL_12;
    case 10LL:
      v23[0] = @"mobile";
      v23[1] = @"Containers";
      v23[2] = @"Data";
      v23[3] = @"InternalDaemon";
      uint64_t v11 = (void *)MEMORY[0x189603F18];
      char v12 = v23;
LABEL_12:
      [v11 arrayWithObjects:v12 count:4];
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "MI_URLByAppendingPathComponents:lastIsDirectory:", v14, 1);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    case 12LL:
      __int128 v10 = &unk_189E46D58;
      goto LABEL_14;
    case 13LL:
      __int128 v10 = &unk_189E46D70;
LABEL_14:
      objc_msgSend(v8, "MI_URLByAppendingPathComponents:lastIsDirectory:", v10, 1);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      if (!v15) {
        goto LABEL_18;
      }
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3221225472LL;
      v21[2] = __MIEnumerateContainersOfClass_block_invoke;
      v21[3] = &unk_189E42130;
      id v22 = v6;
      [v7 enumerateURLsForItemsInDirectoryAtURL:v15 ignoreSymlinks:1 withBlock:v21];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = v17;
      }

      else
      {
        uint64_t v18 = 0LL;
        id v17 = 0LL;
      }

      break;
    default:

LABEL_18:
      _CreateAndLogError( (uint64_t)"MIEnumerateContainersOfClass",  75LL,  (void *)*MEMORY[0x189610040],  4LL,  0LL,  0LL,  @"Failed to get the path to containers of class %llu in %@",  v13,  a2);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      __int128 v15 = 0LL;
      uint64_t v18 = 0LL;
      break;
  }

  id v19 = v17;

  return v19;
}

uint64_t __MIEnumerateContainersOfClass_block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = (void *)MEMORY[0x186E388C0]();
  if (a3 == 4)
  {
    [v5 URLByAppendingPathComponent:@".com.apple.mobile_container_manager.metadata.plist" isDirectory:0];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = 0LL;
    [MEMORY[0x189603F68] dictionaryWithContentsOfURL:v7 error:&v18];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v18;
    if (v8)
    {
      [v8 objectForKeyedSubscript:@"MCMMetadataIdentifier"];
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      id v11 = v10;
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        id v12 = v11;
      }
      else {
        id v12 = 0LL;
      }

      [v8 objectForKeyedSubscript:@"MCMMetadataInfo"];
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      id v15 = v14;
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        id v16 = v15;
      }
      else {
        id v16 = 0LL;
      }

      uint64_t v13 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
    }

    else
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        uint64_t v13 = 1LL;
        goto LABEL_15;
      }

      [v7 path];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
      uint64_t v13 = 1LL;
    }

LABEL_15:
    goto LABEL_16;
  }

  uint64_t v13 = 1LL;
LABEL_16:
  objc_autoreleasePoolPop(v6);

  return v13;
}

void _MILogTransactionStep( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = v16;
  switch(a2)
  {
    case 1LL:
      id v18 = "Start";
      if (!v16) {
        goto LABEL_15;
      }
      break;
    case 2LL:
      if (!v16)
      {
        id v19 = "Fail";
        if ((_DWORD)a3) {
          id v19 = "Success";
        }
        else {
          id v20 = off_189E42150[a1 - 1];
        }
        objc_msgSend(NSString, "stringWithFormat:", @"%s (%s) : %s", v19, "End", v20);
        goto LABEL_21;
      }

      break;
    case 3LL:
      id v18 = "Start (Asynch)";
      if (!v16) {
        goto LABEL_15;
      }
      break;
    default:
      id v18 = "Unknown Phase";
      if (!v16)
      {
LABEL_15:
        else {
          id v22 = off_189E42150[a1 - 1];
        }
        objc_msgSend(NSString, "stringWithFormat:", @"%s : %s", v18, v22, v24);
        uint64_t v21 = LABEL_21:;
        goto LABEL_22;
      }

      break;
  }

  uint64_t v21 = [objc_alloc(NSString) initWithFormat:v16 arguments:&a9];
LABEL_22:
  uint64_t v23 = (void *)v21;
  +[AITransactionLog logStep:byParty:phase:success:forBundleID:persona:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:persona:description:",  a1,  7LL,  a2,  a3,  v14,  v15,  v21);
}

LABEL_18:
  return v12;
}

  return v23;
}

LABEL_11:
  return (MIPlaceholderConstructor *)v3;
}

void sub_186376A4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

LABEL_7:
  return v13;
}

void sub_18637793C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

LABEL_4:
  char v26 = v11;
  id v12 = [v7 setData:v8 forExtendedAttributeNamed:@"com.apple.install_session_uuid" onURL:v6 error:&v26];
  uint64_t v13 = v26;

  if (v12)
  {
    uint64_t v25 = v13;
    LOBYTE(v12) = [v7 setData:v10 forExtendedAttributeNamed:@"com.apple.install_uuid" onURL:v6 error:&v25];
    id v11 = v25;
LABEL_16:

    uint64_t v13 = v11;
  }

  if (a4 && (v12 & 1) == 0) {
    *a4 = v13;
  }

  return v12;
}

id _UUIDData()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  MEMORY[0x186E38C8C](v1);
  [MEMORY[0x189603F48] dataWithBytes:v1 length:16];
  return (id)objc_claimAutoreleasedReturnValue();
}

LABEL_27:
    uint64_t v13 = v18;
    goto LABEL_15;
  }

id MobileInstallerDelegateProtocolInterface()
{
  WeakRetained = objc_loadWeakRetained(&MobileInstallerDelegateProtocolInterface_weakInterface);
  if (!WeakRetained)
  {
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C68F8A8];
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&MobileInstallerDelegateProtocolInterface_weakInterface, WeakRetained);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&MobileInstallerDelegateProtocolInterface_lock);
  return WeakRetained;
}

id MobileInstallerProtocolInterface()
{
  WeakRetained = objc_loadWeakRetained(&MobileInstallerProtocolInterface_weakInterface);
  if (!WeakRetained)
  {
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C692B40];
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    ICLKnownBundleRecordClasses();
    id v1 = (void *)objc_claimAutoreleasedReturnValue();
    [v1 setByAddingObject:objc_opt_class()];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();

    id v3 = (void *)MEMORY[0x189604010];
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained setClasses:v7 forSelector:sel_checkCapabilities_withOptions_completion_ argumentIndex:0 ofReply:0];

    id v8 = (void *)MEMORY[0x189604010];
    uint64_t v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    [WeakRetained setClasses:v10 forSelector:sel_uninstallIdentifiers_withOptions_completion_ argumentIndex:0 ofReply:1];

    [WeakRetained setClasses:v2 forSelector:sel_installURL_identity_targetingDomain_options_returningResultInfo_completion_ argumentIndex:1 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:sel_fetchInfoForContainerizedAppWithIdentity_inDomain_options_completion_ argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:sel_fetchInfoForFrameworkAtURL_options_completion_ argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:sel_cancelUpdateForStagedUUID_completion_ argumentIndex:0 ofReply:1];
    [WeakRetained setClasses:v2 forSelector:sel_finalizeStagedInstallForUUID_returningResultInfo_completion_ argumentIndex:1 ofReply:1];
    objc_storeWeak(&MobileInstallerProtocolInterface_weakInterface, WeakRetained);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&MobileInstallerProtocolInterface_lock);
  return WeakRetained;
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x18960D518]();
}

uint64_t BOMCopierCountFilesInArchive()
{
  return MEMORY[0x18960D520]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x18960D528]();
}

uint64_t BOMCopierNewWithSys()
{
  return MEMORY[0x18960D538]();
}

uint64_t BOMCopierSetCopyFileFinishedHandler()
{
  return MEMORY[0x18960D540]();
}

uint64_t BOMCopierSetCopyFileUpdateHandler()
{
  return MEMORY[0x18960D548]();
}

uint64_t BOMCopierSetFatalErrorHandler()
{
  return MEMORY[0x18960D550]();
}

uint64_t BOMCopierSetFatalFileErrorHandler()
{
  return MEMORY[0x18960D558]();
}

uint64_t BOMCopierSetFileErrorHandler()
{
  return MEMORY[0x18960D560]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x18960D568]();
}

uint64_t BOMCopierUserData()
{
  return MEMORY[0x18960D570]();
}

uint64_t BomSys_free()
{
  return MEMORY[0x18960D578]();
}

uint64_t BomSys_init()
{
  return MEMORY[0x18960D580]();
}

uint64_t BomSys_set_open()
{
  return MEMORY[0x18960D588]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

uint64_t ICLKnownBundleRecordClasses()
{
  return MEMORY[0x189610018]();
}

uint64_t IFCaptureIconContent()
{
  return MEMORY[0x189610008]();
}

uint64_t IFTopLevelAppBundlePlistKeys()
{
  return MEMORY[0x189610010]();
}

uint64_t MIAssertHighResourceUsage()
{
  return MEMORY[0x189610020]();
}

uint64_t MIClearResourceAssertion()
{
  return MEMORY[0x189610028]();
}

uint64_t MICopyCurrentBuildVersion()
{
  return MEMORY[0x189610030]();
}

uint64_t MIIsBuildUpgrade()
{
  return MEMORY[0x189610048]();
}

uint64_t MILoadInfoPlistWithError()
{
  return MEMORY[0x189610058]();
}

uint64_t MILoadRawInfoPlist()
{
  return MEMORY[0x189610060]();
}

uint64_t MOLogWrite()
{
  return MEMORY[0x189611778]();
}

void NSLog(NSString *format, ...)
{
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return MEMORY[0x18960B358](code, *(void *)&flags, information);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x18960B620](path, *(void *)&flags, staticCode);
}

uint64_t TraverseDirectoryWithPostTraversal()
{
  return MEMORY[0x1896100C8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1895FA788]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1895FB1E0](*(void *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1895FB1F0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1895FB468](*(void *)&a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1895FC250](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9A0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1895FC9A8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC9B0](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1895FC9C8](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA88](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1895FCA90](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1895FCD10](path, state, *(void *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1895FCD18]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1895FCD20](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x1895FCD28](state, *(void *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1895FCD30](state, *(void *)&key, value);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

void uuid_generate(uuid_t out)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

uint64_t objc_msgSend_MI_writeAtomicallyToURL_withMode_owner_group_protectionClass_withBarrier_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_MI_writeAtomicallyToURL_withMode_owner_group_protectionClass_withBarrier_error_);
}

uint64_t objc_msgSend__constructPlaceholdersForDirectory_itemsWithPathExtension_appendingToArray_bundleType_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__constructPlaceholdersForDirectory_itemsWithPathExtension_appendingToArray_bundleType_error_);
}

uint64_t objc_msgSend__countFilesAndBytesInArchiveAtURL_withBOMCopier_totalFiles_totalUncompressedBytes_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__countFilesAndBytesInArchiveAtURL_withBOMCopier_totalFiles_totalUncompressedBytes_error_);
}

uint64_t objc_msgSend_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_completion_);
}

uint64_t objc_msgSend_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_acquireReferenceforInstalledAppWithIdentity_inDomain_matchingInstallSessionID_withCompletion_);
}

uint64_t objc_msgSend_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_createSerializedPlaceholderForInstalledAppWithBundeID_personaUniqueString_atResultURL_onDevice_withCompletion_);
}

uint64_t objc_msgSend_createWrappedAppForInstalledBundleIdentifier_atTargetURL_installationRecords_onBehalfOf_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_createWrappedAppForInstalledBundleIdentifier_atTargetURL_installationRecords_onBehalfOf_error_);
}

uint64_t objc_msgSend_createWrappedAppForInstalledBundleIdentifier_inTargetDirectory_installationRecords_onBehalfOf_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_createWrappedAppForInstalledBundleIdentifier_inTargetDirectory_installationRecords_onBehalfOf_error_);
}

uint64_t objc_msgSend_fetchInfoForContainerizedAppWithIdentity_inDomain_options_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_fetchInfoForContainerizedAppWithIdentity_inDomain_options_completion_);
}

uint64_t objc_msgSend_installURL_identity_targetingDomain_options_returningResultInfo_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_installURL_identity_targetingDomain_options_returningResultInfo_completion_);
}

uint64_t objc_msgSend_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_installURL_identity_targetingDomain_withOptions_returningResultInfo_completion_);
}

uint64_t objc_msgSend_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_setLaunchWarningForApp_withUniqueInstallIdentifier_warningData_completion_);
}

uint64_t objc_msgSend_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_updatePlaceholderMetadataForApp_installType_failureReason_underlyingError_failureSource_completion_);
}

uint64_t objc_msgSend_updateWrappedAppAt_forInstalledBundleIdentifier_installationRecords_onBehalfOf_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_updateWrappedAppAt_forInstalledBundleIdentifier_installationRecords_onBehalfOf_error_);
}