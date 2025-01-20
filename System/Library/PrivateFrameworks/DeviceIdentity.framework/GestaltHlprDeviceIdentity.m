@interface GestaltHlprDeviceIdentity
+ (id)getSharedInstance;
- (BOOL)getBoolAnswer:(__CFString *)a3;
- (id)copyAnswer:(__CFString *)a3;
- (id)copyDeviceIDInfo:(id *)a3;
- (id)copyDeviceInfo:(id *)a3;
- (id)copyRegulatoryImagesInfo:(id *)a3;
- (void)addAGestaltKey:(__CFString *)a3 toDictionary:(id)a4 required:(BOOL)a5 errors:(id)a6;
- (void)updateRecertInfo:(id)a3 errors:(id *)a4;
@end

@implementation GestaltHlprDeviceIdentity

+ (id)getSharedInstance
{
  if (getSharedInstance_once != -1) {
    dispatch_once(&getSharedInstance_once, &__block_literal_global_3);
  }
  return (id)getSharedInstance_sharedInstance;
}

void __46__GestaltHlprDeviceIdentity_getSharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)getSharedInstance_sharedInstance;
  getSharedInstance_sharedInstance = v0;
}

- (id)copyAnswer:(__CFString *)a3
{
  if (!a3) {
    return 0LL;
  }
  v4 = (void *)MGCopyAnswer();
  [@"com.apple.mobileactivationd" UTF8String];
  if (os_variant_allows_internal_security_policies() && is_virtual_machine())
  {
    if ((-[__CFString isEqualToString:](a3, "isEqualToString:", @"ProductType") & 1) != 0)
    {
      v5 = @"iPod5,1";
LABEL_9:

      return (id)v5;
    }

    if (-[__CFString isEqualToString:](a3, "isEqualToString:", @"DeviceClass"))
    {
      v5 = @"iPod";
      goto LABEL_9;
    }
  }

  return v4;
}

- (BOOL)getBoolAnswer:(__CFString *)a3
{
  id v3 = -[GestaltHlprDeviceIdentity copyAnswer:](self, "copyAnswer:", a3);
  isNSNumber(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = [v4 BOOLValue];
  return (char)v3;
}

- (void)addAGestaltKey:(__CFString *)a3 toDictionary:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  BOOL v7 = a5;
  id v17 = a4;
  id v10 = a6;
  id v11 = -[GestaltHlprDeviceIdentity copyAnswer:](self, "copyAnswer:", a3);
  v12 = v11;
  if (v11
    && ((isNSString(v11), (uint64_t v13 = objc_claimAutoreleasedReturnValue()) == 0)
     || (v14 = (void *)v13, uint64_t v15 = [v12 length], v14, v15)))
  {
    [v17 setObject:v12 forKeyedSubscript:a3];
  }

  else if (v7)
  {
    [NSString stringWithFormat:@"Failed to query required gestalt key: %@", a3];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 addObject:v16];
  }
}

- (id)copyDeviceIDInfo:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"SerialNumber",  v6,  1LL,  v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"UniqueDeviceID",  v6,  1LL,  v5);
  uint64_t v7 = [v5 count];
  if (a3 && v7) {
    *a3 = v5;
  }

  return v6;
}

- (id)copyDeviceInfo:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"DeviceClass",  v6,  1LL,  v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"ProductType",  v6,  1LL,  v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"BuildVersion",  v6,  1LL,  v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"ModelNumber",  v6,  0LL,  v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"ProductVersion",  v6,  1LL,  v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"RegionCode",  v6,  0LL,  v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"RegionInfo",  v6,  0LL,  v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"RegulatoryModelNumber",  v6,  0LL,  v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"ReleaseType",  v6,  0LL,  v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"UniqueChipID",  v6,  1LL,  v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"DeviceVariant",  v6,  0LL,  v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"SigningFuse",  v6,  0LL,  v5);
  id v7 = -[GestaltHlprDeviceIdentity copyAnswer:](self, "copyAnswer:", @"ProductName");
  if (v7)
  {
    [v6 setObject:v7 forKeyedSubscript:@"OSType"];
  }

  else
  {
    [NSString stringWithFormat:@"Failed to query required gestalt key: %@", @"ProductName"];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 addObject:v8];
  }

  uint64_t v9 = [v5 count];
  if (a3 && v9) {
    *a3 = v5;
  }

  return v6;
}

- (id)copyRegulatoryImagesInfo:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
  id v6 = objc_alloc_init(MEMORY[0x189603FC8]);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"DeviceVariant",  v6,  1LL,  v5);
  uint64_t v7 = [v5 count];
  if (a3 && v7) {
    *a3 = v5;
  }

  return v6;
}

- (void)updateRecertInfo:(id)a3 errors:(id *)a4
{
  id v10 = a3;
  id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v7 = v6;
  if (v10)
  {
    -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"SerialNumber",  v10,  0LL,  v6);
    -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"DeviceClass",  v10,  1LL,  v7);
    -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"ProductType",  v10,  1LL,  v7);
    -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"BuildVersion",  v10,  0LL,  v7);
    -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"UniqueDeviceID",  v10,  0LL,  v7);
    if (-[GestaltHlprDeviceIdentity getBoolAnswer:](self, "getBoolAnswer:", @"HasBaseband"))
    {
      -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"InternationalMobileEquipmentIdentity",  v10,  0LL,  v7);
      id v8 = -[GestaltHlprDeviceIdentity copyAnswer:](self, "copyAnswer:", @"xRyzf9zFE/ycr/wJPweZvQ");
      if (v8) {
        [v10 setObject:v8 forKeyedSubscript:@"InternationalMobileEquipmentIdentity2"];
      }
      -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:]( self,  "addAGestaltKey:toDictionary:required:errors:",  @"MobileEquipmentIdentifier",  v10,  0LL,  v7);
    }

    else
    {
      id v8 = 0LL;
    }

    uint64_t v9 = [v7 count];
    if (a4 && v9) {
      *a4 = v7;
    }
  }

  else
  {
    id v8 = 0LL;
  }
}

@end