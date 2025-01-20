@interface DeviceType
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
- (DeviceType)init;
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

@implementation DeviceType

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_4);
  }
  return (id)sharedInstance_device_type;
}

void __28__DeviceType_sharedInstance__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___DeviceType);
  v2 = (void *)sharedInstance_device_type;
  sharedInstance_device_type = (uint64_t)v1;
}

- (DeviceType)init
{
  v60.receiver = self;
  v60.super_class = (Class)&OBJC_CLASS___DeviceType;
  v2 = -[DeviceType init](&v60, "init");
  if (v2)
  {
    v2->_is_internal_build = os_variant_allows_internal_security_policies([@"com.apple.mobileactivationd" UTF8String]);
    v2->_has_internal_diagnostics = os_variant_has_internal_diagnostics([@"com.apple.mobileactivationd" UTF8String]);
    id v3 = +[GestaltHlpr getSharedInstance](&OBJC_CLASS___GestaltHlpr, "getSharedInstance");
    id v4 = [v3 copyAnswer:@"ProductType"];
    v5 = (NSString *)isNSString(v4);
    product_type = v2->_product_type;
    v2->_product_type = v5;

    id v7 = [v3 copyAnswer:@"HWModelStr"];
    v8 = (NSString *)isNSString(v7);
    hardware_model = v2->_hardware_model;
    v2->_hardware_model = v8;

    v2->_is_ipod = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", @"iPod");
    v2->_is_ipad = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", @"iPad");
    v2->_is_iphone = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", @"iPhone");
    v2->_is_audio_accessory = -[NSString hasPrefix:](v2->_product_type, "hasPrefix:", @"AudioAccessory");
    v2->_is_dev_board = -[NSString hasSuffix:](v2->_hardware_model, "hasSuffix:", @"DEV");
    id v10 = [v3 copyAnswer:@"DeviceClass"];
    v11 = (NSString *)isNSString(v10);
    device_class = v2->_device_class;
    v2->_device_class = v11;

    v2->_has_baseband = [v3 getBoolAnswer:@"HasBaseband"];
    id v13 = [@"IODeviceTree" stringByAppendingString:@":/arm-io"];
    id v14 = -[DeviceType copyDeviceTreeString:key:defaultValue:]( v2,  "copyDeviceTreeString:key:defaultValue:",  v13,  @"soc-generation",  0LL);
    v15 = (NSString *)[v14 uppercaseString];
    soc_generation = v2->_soc_generation;
    v2->_soc_generation = v15;

    id v17 = +[GestaltHlpr getSharedInstance](&OBJC_CLASS___GestaltHlpr, "getSharedInstance");
    id v18 = [v17 copyAnswer:@"ChipID"];
    id v19 = isNSNumber(v18);

    if (([v19 isEqualToNumber:&off_10026D488] & 1) != 0
      || ([v19 isEqualToNumber:&off_10026D4A0] & 1) != 0
      || ([v19 isEqualToNumber:&off_10026D4B8] & 1) != 0)
    {
      LOBYTE(v20) = 0;
    }

    else
    {
      unsigned int v20 = [v19 isEqualToNumber:&off_10026D4D0] ^ 1;
    }

    v2->_device_supports_mfi_certificates = v20;
    if (([v19 isEqualToNumber:&off_10026D4D0] & 1) != 0
      || ([v19 isEqualToNumber:&off_10026D4A0] & 1) != 0)
    {
      LOBYTE(v21) = 0;
    }

    else
    {
      unsigned int v21 = [v19 isEqualToNumber:&off_10026D4B8] ^ 1;
    }

    v2->_device_supports_eda_certificates = v21;
    v2->_device_supports_dcrt_oob = [v3 getBoolAnswer:@"DeviceSupportsFairPlaySecureVideoPath"];
    id v22 = [@"IODeviceTree" stringByAppendingString:@":/product"];
    id v23 = -[DeviceType copyDeviceTreeInt:key:defaultValue:]( v2,  "copyDeviceTreeInt:key:defaultValue:",  v22,  @"allow-hactivation",  0LL);

    id v24 = [v3 copyAnswer:@"CertificateProductionStatus"];
    id v25 = isNSNumber(v24);

    id v26 = [v3 copyAnswer:@"EffectiveProductionStatusAp"];
    id v27 = isNSNumber(v26);

    id v28 = [v3 copyAnswer:@"CertificateSecurityMode"];
    id v29 = isNSNumber(v28);

    id v30 = [v3 copyAnswer:@"EffectiveSecurityModeSEP"];
    id v31 = isNSNumber(v30);

    if (v25 && v27 && v31 && v29)
    {
      if ([v25 isEqualToNumber:&off_10026D4E8]
        && [v27 isEqualToNumber:&off_10026D500]
        && [v29 isEqualToNumber:&off_10026D4E8]
        && [v31 isEqualToNumber:&off_10026D4E8])
      {
        v2->_should_hactivate = 1;
        v2->_is_prodfused_demoted = 1;
      }

      if ([v25 isEqualToNumber:&off_10026D500]
        && [v27 isEqualToNumber:&off_10026D500]
        && [v29 isEqualToNumber:&off_10026D4E8]
        && [v31 isEqualToNumber:&off_10026D4E8])
      {
        v2->_should_hactivate = 1;
        v2->_is_devfused_undemoted = 1;
      }
    }

    if (!v2->_should_hactivate) {
      v2->_should_hactivate = [v3 getBoolAnswer:@"ShouldHactivate"];
    }
    id v32 = -[DeviceType copyBootArgs](v2, "copyBootArgs");
    v33 = +[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet");
    id v55 = v32;
    id v34 = [v32 componentsSeparatedByCharactersInSet:v33];

    if (-[NSString containsString:](v2->_product_type, "containsString:", @"iFPGA"))
    {
      v2->_should_hactivate = 1;
      v2->_is_fpga = 1;
    }

    id v56 = v29;
    if (v2->_is_dev_board) {
      v2->_should_hactivate = 1;
    }
    id v35 = isNSNumber(v23);
    if (v35)
    {
      v36 = v35;
      unsigned int v37 = [v23 BOOLValue];

      if (v37) {
        v2->_should_hactivate = 1;
      }
    }

    id v58 = v27;
    id v59 = v34;
    id v57 = v23;
    v38 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
    unsigned int v39 = -[NSFileManager fileExistsAtPath:](v38, "fileExistsAtPath:", @"/AppleInternal/Lockdown/.hactivateoff");

    if (v39) {
      v2->_should_hactivate = 0;
    }
    id v40 = v31;
    v41 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
    v42 =  -[NSUserDefaults persistentDomainForName:]( v41,  "persistentDomainForName:",  @"com.apple.mobileactivationd");

    id v43 = -[NSDictionary objectForKeyedSubscript:](v42, "objectForKeyedSubscript:", @"DisableHactivation");
    id v44 = isNSNumber(v43);
    if (v44)
    {
      v45 = v44;
      id v46 = -[NSDictionary objectForKeyedSubscript:](v42, "objectForKeyedSubscript:", @"DisableHactivation");
      unsigned int v47 = [v46 BOOLValue];

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
      id v49 = [@"IODeviceTree" stringByAppendingString:@":/chosen"];
      id v50 = -[DeviceType copyDeviceTreeInt:key:defaultValue:]( v2,  "copyDeviceTreeInt:key:defaultValue:",  v49,  @"enable-avp-fairplay",  0LL);

      id v51 = isNSNumber(v50);
      id v31 = v40;
      if (v51)
      {
        v52 = v51;
        unsigned int v53 = [v50 BOOLValue];

        id v27 = v58;
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
      id v31 = v40;
    }

    id v23 = v57;
    id v27 = v58;
LABEL_49:

    id v29 = v56;
LABEL_50:
  }

  return v2;
}

- (id)copyDeviceTreeProperty:(id)a3 key:(id)a4
{
  v5 = (__CFString *)a4;
  v6 = v5;
  CFTypeRef CFProperty = 0LL;
  if (a3 && v5)
  {
    io_registry_entry_t v8 = IORegistryEntryFromPath( kIOMasterPortDefault, (const char *)[a3 fileSystemRepresentation]);
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
    id v3 = malloc(__size);
    if (v3)
    {
      id v4 = v3;
      v2 = 0LL;
      if (!sysctlbyname("kern.bootsessionuuid", v3, &__size, 0LL, 0LL)) {
        v2 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v4);
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
  size_t v4 = 1024LL;
  int v2 = sysctlbyname("kern.bootargs", v5, &v4, 0LL, 0LL);
  id result = 0LL;
  if (!v2) {
    return -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", v5);
  }
  return result;
}

- (id)copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5);
  v11 = 0LL;
  unsigned int v17 = v5;
  if (v8 && v9)
  {
    v11 = -[DeviceType copyDeviceTreeProperty:key:](self, "copyDeviceTreeProperty:key:", v8, v9);
    id v12 = isNSData(v11);
    if (v12)
    {
    }

    else
    {
      id v13 = isNSNumber(v11);

      if (!v13) {
        goto LABEL_10;
      }
    }

    id v14 = isNSData(v11);

    if (v14)
    {
      if (-[NSNumber length](v11, "length") == (id)4)
      {
        -[NSNumber getBytes:length:](v11, "getBytes:length:", &v17, 4LL);
        v15 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v17);

        id v10 = v15;
      }
    }

    else
    {
      v11 = v11;

      id v10 = v11;
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
  v11 = (NSString *)v8;
  if (a4)
  {
    id v10 = -[DeviceType copyDeviceTreeProperty:key:](self, "copyDeviceTreeProperty:key:", a3, a4);
    id v12 = isNSData(v10);
    if (v12)
    {
      id v13 = v12;
      id v14 = [v10 length];

      if (v14)
      {
        v15 = objc_alloc(&OBJC_CLASS___NSString);
        id v10 = v10;
        v11 = -[NSString initWithUTF8String:](v15, "initWithUTF8String:", [v10 bytes]);

        goto LABEL_7;
      }
    }

- (BOOL)runningInRAMDisk
{
  id v2 = -[DeviceType copyBootArgs](self, "copyBootArgs");
  if (v2
    && (id v3 = +[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"),
        id v4 = [v2 componentsSeparatedByCharactersInSet:v3],
        v3,
        v4))
  {
    unsigned __int8 v5 = [v4 containsObject:@"-restore"];
  }

  else
  {
    unsigned __int8 v5 = 0;
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