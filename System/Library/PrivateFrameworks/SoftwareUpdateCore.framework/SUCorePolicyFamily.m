@interface SUCorePolicyFamily
+ (id)_copyGestaltValueForKey:(__CFString *)a3;
+ (id)_getGenericDefaultAssetTypeForKind:(int)a3;
+ (id)_getIOSAssetTypeForKind:(int)a3;
+ (id)_getMacOSAssetTypeForKind:(int)a3;
+ (id)_getNERDBRAINAssetTypeForKind:(int)a3;
+ (id)_getNERDCAssetTypeForKind:(int)a3;
+ (id)_getNERDSUAssetTypeForKind:(int)a3;
+ (id)_getPlatformDefaultAssetTypeForKind:(int)a3;
+ (id)_getTVOSAssetTypeForKind:(int)a3;
+ (id)_getWatchOSAssetTypeForKind:(int)a3;
+ (id)getAssetTypeForKind:(int)a3 usingFamily:(int)a4;
+ (id)getNameForSUCorePolicyAssetFamily:(int)a3;
+ (id)getNameForSUCorePolicyAssetKind:(int)a3;
+ (int)getFamilyForBuildTarget;
+ (int)getFamilyUsingDeviceClass:(id)a3;
@end

@implementation SUCorePolicyFamily

+ (id)getAssetTypeForKind:(int)a3 usingFamily:(int)a4
{
  switch(a4)
  {
    case 1:
      v4 = +[SUCorePolicyFamily _getIOSAssetTypeForKind:]( &OBJC_CLASS___SUCorePolicyFamily,  "_getIOSAssetTypeForKind:",  *(void *)&a3);
      break;
    case 2:
      v4 = +[SUCorePolicyFamily _getTVOSAssetTypeForKind:]( &OBJC_CLASS___SUCorePolicyFamily,  "_getTVOSAssetTypeForKind:",  *(void *)&a3);
      break;
    case 3:
      v4 = +[SUCorePolicyFamily _getWatchOSAssetTypeForKind:]( &OBJC_CLASS___SUCorePolicyFamily,  "_getWatchOSAssetTypeForKind:",  *(void *)&a3);
      break;
    case 4:
      v4 = +[SUCorePolicyFamily _getNERDCAssetTypeForKind:]( &OBJC_CLASS___SUCorePolicyFamily,  "_getNERDCAssetTypeForKind:",  *(void *)&a3);
      break;
    case 5:
      v4 = +[SUCorePolicyFamily _getNERDSUAssetTypeForKind:]( &OBJC_CLASS___SUCorePolicyFamily,  "_getNERDSUAssetTypeForKind:",  *(void *)&a3);
      break;
    case 6:
      v4 = +[SUCorePolicyFamily _getNERDBRAINAssetTypeForKind:]( &OBJC_CLASS___SUCorePolicyFamily,  "_getNERDBRAINAssetTypeForKind:",  *(void *)&a3);
      break;
    case 7:
      v4 = +[SUCorePolicyFamily _getMacOSAssetTypeForKind:]( &OBJC_CLASS___SUCorePolicyFamily,  "_getMacOSAssetTypeForKind:",  *(void *)&a3);
      break;
    default:
      v4 = +[SUCorePolicyFamily _getPlatformDefaultAssetTypeForKind:]( &OBJC_CLASS___SUCorePolicyFamily,  "_getPlatformDefaultAssetTypeForKind:",  *(void *)&a3);
      break;
  }

  return v4;
}

+ (int)getFamilyUsingDeviceClass:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  if (([v3 isEqualToString:@"iPhone"] & 1) != 0
    || ([v3 isEqualToString:@"iPod"] & 1) != 0
    || ([v3 isEqualToString:@"iPad"] & 1) != 0
    || [v3 isEqualToString:@"AudioAccessory"])
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 oslog];
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v5,  OS_LOG_TYPE_DEFAULT,  "SUCorePolicyFamily:getFamilyUsingDeviceClass defaulting to iOS family",  buf,  2u);
    }

    int v6 = 1;
  }

  else if ([v3 isEqualToString:@"AppleTV"])
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v6 = 2;
      _os_log_impl( &dword_187A54000,  v5,  OS_LOG_TYPE_DEFAULT,  "SUCorePolicyFamily:getFamilyUsingDeviceClass defaulting to tvOS family",  buf,  2u);
    }

    else
    {
      int v6 = 2;
    }
  }

  else if ([v3 isEqualToString:@"Watch"])
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v5,  OS_LOG_TYPE_DEFAULT,  "SUCorePolicyFamily:getFamilyUsingDeviceClass defaulting to watchOS family",  buf,  2u);
    }

    int v6 = 3;
  }

  else
  {
    int v10 = [v3 isEqualToString:@"Mac"];
    [MEMORY[0x1896127A0] sharedLogger];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v12 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187A54000,  v5,  OS_LOG_TYPE_DEFAULT,  "SUCorePolicyFamily:getFamilyUsingDeviceClass defaulting to macOS family",  buf,  2u);
      }

      int v6 = 7;
    }

    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v3;
        _os_log_impl( &dword_187A54000,  v5,  OS_LOG_TYPE_DEFAULT,  "SUCorePolicyFamily:getFamilyUsingDeviceClass unknown device class %{public}@, returning default instead",  buf,  0xCu);
      }

      [MEMORY[0x189612778] sharedDiag];
      v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)[objc_alloc(NSString) initWithFormat:@"unknown device class (%@), returning default instead", v3];
      -[os_log_s trackAnomaly:forReason:withResult:withError:]( v5,  "trackAnomaly:forReason:withResult:withError:",  @"[POLICY] ASSET FAMILY",  v13,  8116LL,  0LL);

      int v6 = 0;
    }
  }

  return v6;
}

+ (int)getFamilyForBuildTarget
{
  return 2;
}

+ (id)getNameForSUCorePolicyAssetFamily:(int)a3
{
  if (a3 >= 8) {
    id v3 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"SUCORE_POLICY_FAMILY_UNKNOWN(%d)",  *(void *)&a3);
  }
  else {
    id v3 = off_18A0F0828[a3];
  }
  return v3;
}

+ (id)getNameForSUCorePolicyAssetKind:(int)a3
{
  if ((a3 - 1) >= 7) {
    id v3 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"SUCORE_POLICY_KIND_UNKNOWN(%d)",  *(void *)&a3);
  }
  else {
    id v3 = off_18A0F0868[a3 - 1];
  }
  return v3;
}

+ (id)_getIOSAssetTypeForKind:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  [MEMORY[0x189612778] sharedDiag];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"failed to determine iOS asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU",  v4);
  [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

  return @"com.apple.MobileAsset.SoftwareUpdate";
}

+ (id)_getTVOSAssetTypeForKind:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  [MEMORY[0x189612778] sharedDiag];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"failed to determine tvOS asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU",  v4);
  [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

  return @"com.apple.MobileAsset.SoftwareUpdate";
}

+ (id)_getWatchOSAssetTypeForKind:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  [MEMORY[0x189612778] sharedDiag];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"failed to determine watchOS asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU",  v4);
  [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

  return @"com.apple.MobileAsset.SoftwareUpdate";
}

+ (id)_getNERDCAssetTypeForKind:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  [MEMORY[0x189612778] sharedDiag];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"failed to determine NERDC asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU",  v4);
  [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

  return @"com.apple.MobileAsset.RecoveryOSUpdate";
}

+ (id)_getNERDSUAssetTypeForKind:(int)a3
{
  id v3 = @"com.apple.MobileAsset.RecoveryOSUpdate";
  switch(a3)
  {
    case 1:
      return (id)v3;
    case 2:
      [MEMORY[0x189612778] sharedDiag];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [objc_alloc(NSString) initWithFormat:@"no documentation asset type for NERDSU family, defaulting to NeRD SU asset type(%@)", @"com.apple.MobileAsset.RecoveryOSUpdate"];
      goto LABEL_6;
    case 3:
      [MEMORY[0x189612778] sharedDiag];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [objc_alloc(NSString) initWithFormat:@"no update brain asset type for NERDSU family, defaulting to NeRD SU asset type(%@)", @"com.apple.MobileAsset.RecoveryOSUpdate"];
LABEL_6:
      v9 = (void *)v8;
      [v7 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v8 withResult:8102 withError:0];

      break;
    case 4:
      id v3 = @"com.apple.MobileAsset.SFRSoftwareUpdate";
      break;
    case 5:
      id v3 = @"com.apple.MobileAsset.SoftwareUpdateConfiguration";
      break;
    case 6:
    case 7:
      id v3 = 0LL;
      break;
    default:
      uint64_t v4 = *(void *)&a3;
      [MEMORY[0x189612778] sharedDiag];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      int v6 = (void *)[objc_alloc(NSString) initWithFormat:@"failed to determine NERDSU asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU type(%@)", v4, @"com.apple.MobileAsset.RecoveryOSUpdate"];
      [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

      break;
  }

  return (id)v3;
}

+ (id)_getNERDBRAINAssetTypeForKind:(int)a3
{
  id v3 = @"com.apple.MobileAsset.RecoveryOSUpdateBrain";
  switch(a3)
  {
    case 1:
      return (id)v3;
    case 2:
      [MEMORY[0x189612778] sharedDiag];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [objc_alloc(NSString) initWithFormat:@"no documentation asset type for NERDBRAIN family, defaulting to NeRD update brain asset type(%@)", @"com.apple.MobileAsset.RecoveryOSUpdateBrain"];
      goto LABEL_6;
    case 3:
      [MEMORY[0x189612778] sharedDiag];
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [objc_alloc(NSString) initWithFormat:@"no update brain asset type for NERDBRAIN family (since brain handled as SU asset), defaulting to NeRD update brain asset type(%@)", @"com.apple.MobileAsset.RecoveryOSUpdateBrain"];
LABEL_6:
      v9 = (void *)v8;
      [v7 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v8 withResult:8102 withError:0];

      break;
    case 4:
      id v3 = @"com.apple.MobileAsset.SFRSoftwareUpdate";
      break;
    case 5:
      id v3 = @"com.apple.MobileAsset.SoftwareUpdateConfiguration";
      break;
    case 6:
    case 7:
      id v3 = 0LL;
      break;
    default:
      uint64_t v4 = *(void *)&a3;
      [MEMORY[0x189612778] sharedDiag];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      int v6 = (void *)[objc_alloc(NSString) initWithFormat:@"failed to determine NERDBRAIN asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU type(%@)", v4, @"com.apple.MobileAsset.RecoveryOSUpdateBrain"];
      [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

      break;
  }

  return (id)v3;
}

+ (id)_getMacOSAssetTypeForKind:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  [MEMORY[0x189612778] sharedDiag];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = @"com.apple.MobileAsset.MacSoftwareUpdate";
  int v6 = (void *)[objc_alloc(NSString) initWithFormat:@"failed to determine macOS asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU type(%@)", v4, @"com.apple.MobileAsset.MacSoftwareUpdate"];
  [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

  return (id)v3;
}

+ (id)_getPlatformDefaultAssetTypeForKind:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [MEMORY[0x189612770] sharedDevice];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 deviceClass];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = +[SUCorePolicyFamily getFamilyUsingDeviceClass:]( &OBJC_CLASS___SUCorePolicyFamily,  "getFamilyUsingDeviceClass:",  v5);

  switch((int)v6)
  {
    case 1:
      v7 = +[SUCorePolicyFamily _getIOSAssetTypeForKind:](&OBJC_CLASS___SUCorePolicyFamily, "_getIOSAssetTypeForKind:", v3);
      break;
    case 2:
      v7 = +[SUCorePolicyFamily _getTVOSAssetTypeForKind:](&OBJC_CLASS___SUCorePolicyFamily, "_getTVOSAssetTypeForKind:", v3);
      break;
    case 3:
      v7 = +[SUCorePolicyFamily _getWatchOSAssetTypeForKind:]( &OBJC_CLASS___SUCorePolicyFamily,  "_getWatchOSAssetTypeForKind:",  v3);
      break;
    case 7:
      v7 = +[SUCorePolicyFamily _getMacOSAssetTypeForKind:]( &OBJC_CLASS___SUCorePolicyFamily,  "_getMacOSAssetTypeForKind:",  v3);
      break;
    default:
      [MEMORY[0x189612778] sharedDiag];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"unknown family value (%d), defaulting to generic default family",  v6);
      [v8 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v9 withResult:8116 withError:0];
      v7 = +[SUCorePolicyFamily _getGenericDefaultAssetTypeForKind:]( &OBJC_CLASS___SUCorePolicyFamily,  "_getGenericDefaultAssetTypeForKind:",  v3);
      break;
  }

  return v7;
}

+ (id)_getGenericDefaultAssetTypeForKind:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  [MEMORY[0x189612778] sharedDiag];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"failed to determine generic default asset kind (%d), defaulting to SUCORE_POLICY_KIND_SU",  v4);
  [v5 trackAnomaly:@"[POLICY] ASSET FAMILY" forReason:v6 withResult:8102 withError:0];

  return @"com.apple.MobileAsset.SoftwareUpdate";
}

+ (id)_copyGestaltValueForKey:(__CFString *)a3
{
  return (id)MGCopyAnswer();
}

@end