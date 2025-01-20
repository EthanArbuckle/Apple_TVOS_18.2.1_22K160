@interface DeviceTypeDeviceIdentity
+ (id)sharedInstance;
- (BOOL)device_supports_dcrt_oob;
- (BOOL)device_supports_eda_certificates;
- (BOOL)device_supports_mfi_certificates;
- (BOOL)has_baseband;
- (BOOL)has_internal_diagnostics;
- (BOOL)is_audio_accessory;
- (BOOL)is_dev_board;
- (BOOL)is_devfused_undemoted;
- (BOOL)is_fpga;
- (BOOL)is_internal_build;
- (BOOL)is_ipad;
- (BOOL)is_iphone;
- (BOOL)is_ipod;
- (BOOL)is_prodfused_demoted;
- (BOOL)runningInRAMDisk;
- (BOOL)should_hactivate;
- (DeviceTypeDeviceIdentity)init;
- (NSString)device_class;
- (NSString)hardware_model;
- (NSString)product_type;
- (NSString)soc_generation;
- (id)copyBootArgs;
- (id)copyBootSessionUUID;
- (id)copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(int)a5;
- (id)copyDeviceTreeProperty:(id)a3 key:(id)a4;
- (id)copyDeviceTreeString:(id)a3 key:(id)a4 defaultValue:(id)a5;
@end

@implementation DeviceTypeDeviceIdentity

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_0);
  }
  return (id)sharedInstance_device_type;
}

void __42__DeviceTypeDeviceIdentity_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___DeviceTypeDeviceIdentity);
  v1 = (void *)sharedInstance_device_type;
  sharedInstance_device_type = (uint64_t)v0;
}

- (DeviceTypeDeviceIdentity)init
{
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___DeviceTypeDeviceIdentity;
  v2 = -[DeviceTypeDeviceIdentity init](&v60, sel_init);
  if (v2)
  {
    [@"com.apple.mobileactivationd" UTF8String];
    v2->_is_internal_build = os_variant_allows_internal_security_policies();
    [@"com.apple.mobileactivationd" UTF8String];
    v2->_has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v3 = +[GestaltHlprDeviceIdentity getSharedInstance](&OBJC_CLASS___GestaltHlprDeviceIdentity, "getSharedInstance");
    v4 = (void *)[v3 copyAnswer:@"ProductType"];
    uint64_t v5 = isNSString(v4);
    product_type = v2->_product_type;
    v2->_product_type = (NSString *)v5;

    v7 = (void *)[v3 copyAnswer:@"HWModelStr"];
    uint64_t v8 = isNSString(v7);
    hardware_model = v2->_hardware_model;
    v2->_hardware_model = (NSString *)v8;

    v2->_is_ipod = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", @"iPod");
    v2->_is_ipad = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", @"iPad");
    v2->_is_iphone = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", @"iPhone");
    v2->_is_audio_accessory = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", @"AudioAccessory");
    v2->_is_dev_board = -[NSString hasSuffix:](v2->_hardware_model, "hasSuffix:", @"DEV");
    v10 = (void *)[v3 copyAnswer:@"DeviceClass"];
    uint64_t v11 = isNSString(v10);
    device_class = v2->_device_class;
    v2->_device_class = (NSString *)v11;

    v2->_has_baseband = [v3 getBoolAnswer:@"HasBaseband"];
    [@"IODeviceTree" stringByAppendingString:@":/arm-io"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = -[DeviceTypeDeviceIdentity copyDeviceTreeString:key:defaultValue:]( v2,  "copyDeviceTreeString:key:defaultValue:",  v13,  @"soc-generation",  0LL);
    uint64_t v15 = [v14 uppercaseString];
    soc_generation = v2->_soc_generation;
    v2->_soc_generation = (NSString *)v15;
    v17 = +[GestaltHlprDeviceIdentity getSharedInstance](&OBJC_CLASS___GestaltHlprDeviceIdentity, "getSharedInstance");
    v18 = (void *)[v17 copyAnswer:@"ChipID"];
    isNSNumber(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (([v19 isEqualToNumber:&unk_189FDD5C0] & 1) != 0
      || ([v19 isEqualToNumber:&unk_189FDD5D8] & 1) != 0
      || ([v19 isEqualToNumber:&unk_189FDD5F0] & 1) != 0)
    {
      LOBYTE(v20) = 0;
    }

    else
    {
      int v20 = [v19 isEqualToNumber:&unk_189FDD608] ^ 1;
    }

    v2->_device_supports_mfi_certificates = v20;
    if (([v19 isEqualToNumber:&unk_189FDD608] & 1) != 0
      || ([v19 isEqualToNumber:&unk_189FDD5D8] & 1) != 0)
    {
      LOBYTE(v21) = 0;
    }

    else
    {
      int v21 = [v19 isEqualToNumber:&unk_189FDD5F0] ^ 1;
    }

    v2->_device_supports_eda_certificates = v21;
    v2->_device_supports_dcrt_oob = [v3 getBoolAnswer:@"DeviceSupportsFairPlaySecureVideoPath"];
    [@"IODeviceTree" stringByAppendingString:@":/product"];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = -[DeviceTypeDeviceIdentity copyDeviceTreeInt:key:defaultValue:]( v2,  "copyDeviceTreeInt:key:defaultValue:",  v22,  @"allow-hactivation",  0LL);

    v24 = (void *)[v3 copyAnswer:@"CertificateProductionStatus"];
    isNSNumber(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)[v3 copyAnswer:@"EffectiveProductionStatusAp"];
    isNSNumber(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)[v3 copyAnswer:@"CertificateSecurityMode"];
    isNSNumber(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)[v3 copyAnswer:@"EffectiveSecurityModeSEP"];
    isNSNumber(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25 && v27 && v31 && v29)
    {
      if ([v25 isEqualToNumber:&unk_189FDD620]
        && [v27 isEqualToNumber:&unk_189FDD638]
        && [v29 isEqualToNumber:&unk_189FDD620]
        && [v31 isEqualToNumber:&unk_189FDD620])
      {
        v2->_should_hactivate = 1;
        v2->_is_prodfused_demoted = 1;
      }

      if ([v25 isEqualToNumber:&unk_189FDD638]
        && [v27 isEqualToNumber:&unk_189FDD638]
        && [v29 isEqualToNumber:&unk_189FDD620]
        && [v31 isEqualToNumber:&unk_189FDD620])
      {
        v2->_should_hactivate = 1;
        v2->_is_devfused_undemoted = 1;
      }
    }

    if (!v2->_should_hactivate) {
      v2->_should_hactivate = [v3 getBoolAnswer:@"ShouldHactivate"];
    }
    id v32 = -[DeviceTypeDeviceIdentity copyBootArgs](v2, "copyBootArgs");
    [MEMORY[0x189607810] whitespaceCharacterSet];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v32;
    [v32 componentsSeparatedByCharactersInSet:v33];
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSString containsString:](v2->_product_type, "containsString:", @"iFPGA"))
    {
      v2->_should_hactivate = 1;
      v2->_is_fpga = 1;
    }

    v56 = v29;
    if (v2->_is_dev_board) {
      v2->_should_hactivate = 1;
    }
    uint64_t v35 = isNSNumber(v23);
    if (v35)
    {
      v36 = (void *)v35;
      int v37 = [v23 BOOLValue];

      if (v37) {
        v2->_should_hactivate = 1;
      }
    }

    v58 = v27;
    v59 = v34;
    v57 = v23;
    [MEMORY[0x1896078A8] defaultManager];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    int v39 = [v38 fileExistsAtPath:@"/AppleInternal/Lockdown/.hactivateoff"];

    if (v39) {
      v2->_should_hactivate = 0;
    }
    v40 = v31;
    id v41 = objc_alloc(MEMORY[0x189604038]);
    [v41 persistentDomainForName:@"com.apple.mobileactivationd"];
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    [v42 objectForKeyedSubscript:@"DisableHactivation"];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v44 = isNSNumber(v43);
    if (v44)
    {
      v45 = (void *)v44;
      [v42 objectForKeyedSubscript:@"DisableHactivation"];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      int v47 = [v46 BOOLValue];

      if (v47) {
        v2->_should_hactivate = 0;
      }
    }

    else
    {
    }

    v48 = v59;
    if (is_virtual_machine())
    {
      [@"IODeviceTree" stringByAppendingString:@":/chosen"];
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      id v50 = -[DeviceTypeDeviceIdentity copyDeviceTreeInt:key:defaultValue:]( v2,  "copyDeviceTreeInt:key:defaultValue:",  v49,  @"enable-avp-fairplay",  0LL);

      uint64_t v51 = isNSNumber(v50);
      v31 = v40;
      if (v51)
      {
        v52 = (void *)v51;
        int v53 = [v50 BOOLValue];

        v27 = v58;
        if (v53) {
          v2->_should_hactivate = 0;
        }
        id v23 = v57;
        v48 = v59;
        goto LABEL_49;
      }
    }

    else
    {
      id v50 = 0LL;
      v31 = v40;
    }

    id v23 = v57;
    v27 = v58;
LABEL_49:

    v29 = v56;
LABEL_50:
  }

  return v2;
}

- (id)copyDeviceTreeProperty:(id)a3 key:(id)a4
{
  uint64_t v5 = (__CFString *)a4;
  v6 = v5;
  CFTypeRef CFProperty = 0LL;
  if (a3 && v5)
  {
    io_registry_entry_t v8 = IORegistryEntryFromPath( *MEMORY[0x1896086B0], (const char *)[a3 fileSystemRepresentation]);
    if (v8)
    {
      io_object_t v9 = v8;
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v8, v6, 0LL, 0);
      IOObjectRelease(v9);
    }

    else
    {
      CFTypeRef CFProperty = 0LL;
    }
  }

  return (id)CFProperty;
}

- (id)copyBootSessionUUID
{
  size_t __size = 0LL;
  v2 = 0LL;
  if (!sysctlbyname("kern.bootsessionuuid", 0LL, &__size, 0LL, 0LL))
  {
    v3 = malloc(__size);
    if (v3)
    {
      v4 = v3;
      v2 = 0LL;
      if (!sysctlbyname("kern.bootsessionuuid", v3, &__size, 0LL, 0LL)) {
        v2 = (void *)[objc_alloc(NSString) initWithUTF8String:v4];
      }
      free(v4);
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

- (id)copyBootArgs
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  bzero(v5, 0x400uLL);
  size_t v4 = 1024LL;
  int v2 = sysctlbyname("kern.bootargs", v5, &v4, 0LL, 0LL);
  id result = 0LL;
  if (!v2) {
    return (id)[objc_alloc(NSString) initWithUTF8String:v5];
  }
  return result;
}

- (id)copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  [MEMORY[0x189607968] numberWithInt:v5];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = 0LL;
  unsigned int v17 = v5;
  if (v8 && v9)
  {
    id v11 = -[DeviceTypeDeviceIdentity copyDeviceTreeProperty:key:](self, "copyDeviceTreeProperty:key:", v8, v9);
    isNSData(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
    }

    else
    {
      isNSNumber(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13) {
        goto LABEL_10;
      }
    }

    isNSData(v11);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if ([v11 length] == 4)
      {
        [v11 getBytes:&v17 length:4];
        uint64_t v15 = [MEMORY[0x189607968] numberWithInt:v17];

        v10 = (void *)v15;
      }
    }

    else
    {
      id v11 = v11;

      v10 = v11;
    }
  }

- (id)copyDeviceTreeString:(id)a3 key:(id)a4 defaultValue:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  id v10 = 0LL;
  if (!a3) {
    goto LABEL_6;
  }
  id v11 = v8;
  if (a4)
  {
    id v10 = -[DeviceTypeDeviceIdentity copyDeviceTreeProperty:key:](self, "copyDeviceTreeProperty:key:", a3, a4);
    uint64_t v12 = isNSData(v10);
    if (v12)
    {
      v13 = (void *)v12;
      uint64_t v14 = [v10 length];

      if (v14)
      {
        id v15 = objc_alloc(NSString);
        id v10 = v10;
        id v11 = (void *)objc_msgSend(v15, "initWithUTF8String:", objc_msgSend(v10, "bytes"));

        goto LABEL_7;
      }
    }

- (BOOL)runningInRAMDisk
{
  id v2 = -[DeviceTypeDeviceIdentity copyBootArgs](self, "copyBootArgs");
  if (v2
    && ([MEMORY[0x189607810] whitespaceCharacterSet],
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        [v2 componentsSeparatedByCharactersInSet:v3],
        size_t v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    char v5 = [v4 containsObject:@"-restore"];
  }

  else
  {
    char v5 = 0;
  }

  return v5;
}

- (NSString)product_type
{
  return self->_product_type;
}

- (NSString)device_class
{
  return self->_device_class;
}

- (NSString)hardware_model
{
  return self->_hardware_model;
}

- (NSString)soc_generation
{
  return self->_soc_generation;
}

- (BOOL)device_supports_dcrt_oob
{
  return self->_device_supports_dcrt_oob;
}

- (BOOL)device_supports_mfi_certificates
{
  return self->_device_supports_mfi_certificates;
}

- (BOOL)device_supports_eda_certificates
{
  return self->_device_supports_eda_certificates;
}

- (BOOL)is_prodfused_demoted
{
  return self->_is_prodfused_demoted;
}

- (BOOL)is_devfused_undemoted
{
  return self->_is_devfused_undemoted;
}

- (BOOL)is_dev_board
{
  return self->_is_dev_board;
}

- (BOOL)is_fpga
{
  return self->_is_fpga;
}

- (BOOL)is_ipod
{
  return self->_is_ipod;
}

- (BOOL)is_ipad
{
  return self->_is_ipad;
}

- (BOOL)is_iphone
{
  return self->_is_iphone;
}

- (BOOL)is_audio_accessory
{
  return self->_is_audio_accessory;
}

- (BOOL)has_baseband
{
  return self->_has_baseband;
}

- (BOOL)should_hactivate
{
  return self->_should_hactivate;
}

- (BOOL)is_internal_build
{
  return self->_is_internal_build;
}

- (BOOL)has_internal_diagnostics
{
  return self->_has_internal_diagnostics;
}

- (void).cxx_destruct
{
}

@end