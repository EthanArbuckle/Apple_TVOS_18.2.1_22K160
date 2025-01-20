@interface GTDeviceProperties
+ (BOOL)supportsSecureCoding;
+ (id)hardwareUUID;
+ (id)uniqueDeviceID;
- (BOOL)appleInternal;
- (BOOL)deviceSupportsLockdown;
- (BOOL)effectiveProductionStatusAp;
- (BOOL)isUIBuild;
- (BOOL)osInstallEnvironment;
- (BOOL)storeDemoMode;
- (GTDeviceProperties)initWithCoder:(id)a3;
- (GTDeviceProperties)initWithXPCObject:(id)a3;
- (NSString)buildVersion;
- (NSString)cpuArchitecture;
- (NSString)deviceClass;
- (NSString)hardwareModel;
- (NSString)mobileDeviceMinimumVersion;
- (NSString)osVersion;
- (NSString)productName;
- (NSString)productType;
- (NSString)reality;
- (NSString)releaseType;
- (NSString)uniqueDeviceID;
- (id)description;
- (id)initForEmbeddedSystem;
- (unint64_t)locationID;
- (unint64_t)remoteXPCVersionFlags;
- (void)encodeWithCoder:(id)a3;
- (void)setAppleInternal:(BOOL)a3;
- (void)setBuildVersion:(id)a3;
- (void)setCpuArchitecture:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceSupportsLockdown:(BOOL)a3;
- (void)setEffectiveProductionStatusAp:(BOOL)a3;
- (void)setHardwareModel:(id)a3;
- (void)setIsUIBuild:(BOOL)a3;
- (void)setLocationID:(unint64_t)a3;
- (void)setMobileDeviceMinimumVersion:(id)a3;
- (void)setOsInstallEnvironment:(BOOL)a3;
- (void)setOsVersion:(id)a3;
- (void)setProductName:(id)a3;
- (void)setProductType:(id)a3;
- (void)setReality:(id)a3;
- (void)setReleaseType:(id)a3;
- (void)setRemoteXPCVersionFlags:(unint64_t)a3;
- (void)setStoreDemoMode:(BOOL)a3;
- (void)setUniqueDeviceID:(id)a3;
@end

@implementation GTDeviceProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)hardwareUUID
{
  v5.tv_sec = 0LL;
  v5.tv_nsec = 0LL;
  int v2 = gethostuuid(v6, &v5);
  v3 = 0LL;
  if (!v2) {
    v3 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v6);
  }
  return v3;
}

+ (id)uniqueDeviceID
{
  return (id)MGCopyAnswer(@"ProvisioningUniqueDeviceID", 0LL);
}

- (GTDeviceProperties)initWithXPCObject:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)&OBJC_CLASS___GTDeviceProperties;
  timespec v5 = -[GTDeviceProperties init](&v51, "init");
  if (v5)
  {
    v5->_LocationID = xpc_dictionary_get_uint64(v4, "LocationID");
    string = xpc_dictionary_get_string(v4, "OSVersion");
    if (string) {
      v7 = string;
    }
    else {
      v7 = "";
    }
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
    OSVersion = v5->_OSVersion;
    v5->_OSVersion = (NSString *)v8;

    v10 = xpc_dictionary_get_string(v4, "BuildVersion");
    if (v10) {
      v11 = v10;
    }
    else {
      v11 = "";
    }
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11));
    BuildVersion = v5->_BuildVersion;
    v5->_BuildVersion = (NSString *)v12;

    v14 = xpc_dictionary_get_string(v4, "ProductType");
    if (v14) {
      v15 = v14;
    }
    else {
      v15 = "";
    }
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v15));
    ProductType = v5->_ProductType;
    v5->_ProductType = (NSString *)v16;

    v18 = xpc_dictionary_get_string(v4, "HWModel");
    if (v18) {
      v19 = v18;
    }
    else {
      v19 = "";
    }
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v19));
    HWModelStr = v5->_HWModelStr;
    v5->_HWModelStr = (NSString *)v20;

    v22 = xpc_dictionary_get_string(v4, "UniqueDeviceID");
    if (v22) {
      v23 = v22;
    }
    else {
      v23 = "";
    }
    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v23));
    UniqueDeviceID = v5->_UniqueDeviceID;
    v5->_UniqueDeviceID = (NSString *)v24;

    v26 = xpc_dictionary_get_string(v4, "Reality");
    if (v26) {
      v27 = v26;
    }
    else {
      v27 = "";
    }
    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v27));
    Reality = v5->_Reality;
    v5->_Reality = (NSString *)v28;

    v5->_RemoteXPCVersionFlags = xpc_dictionary_get_uint64(v4, "RemoteXPCVersionFlags");
    v30 = xpc_dictionary_get_string(v4, "CPUArchitecture");
    if (v30) {
      v31 = v30;
    }
    else {
      v31 = "";
    }
    uint64_t v32 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v31));
    CPUArchitecture = v5->_CPUArchitecture;
    v5->_CPUArchitecture = (NSString *)v32;

    v34 = xpc_dictionary_get_string(v4, "DeviceClass");
    if (v34) {
      v35 = v34;
    }
    else {
      v35 = "";
    }
    uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v35));
    DeviceClass = v5->_DeviceClass;
    v5->_DeviceClass = (NSString *)v36;

    v38 = xpc_dictionary_get_string(v4, "MobileDeviceMinimumVersion");
    if (v38) {
      v39 = v38;
    }
    else {
      v39 = "";
    }
    uint64_t v40 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v39));
    MobileDeviceMinimumVersion = v5->_MobileDeviceMinimumVersion;
    v5->_MobileDeviceMinimumVersion = (NSString *)v40;

    v42 = xpc_dictionary_get_string(v4, "ProductName");
    if (v42) {
      v43 = v42;
    }
    else {
      v43 = "";
    }
    uint64_t v44 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v43));
    ProductName = v5->_ProductName;
    v5->_ProductName = (NSString *)v44;

    v46 = xpc_dictionary_get_string(v4, "ReleaseType");
    if (v46) {
      v47 = v46;
    }
    else {
      v47 = "";
    }
    uint64_t v48 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v47));
    ReleaseType = v5->_ReleaseType;
    v5->_ReleaseType = (NSString *)v48;

    v5->_AppleInternal = xpc_dictionary_get_BOOL(v4, "AppleInternal");
    v5->_DeviceSupportsLockdown = xpc_dictionary_get_BOOL(v4, "DeviceSupportsLockdown");
    v5->_EffectiveProductionStatusAp = xpc_dictionary_get_BOOL(v4, "EffectiveProductionStatusAp");
    v5->_IsUIBuild = xpc_dictionary_get_BOOL(v4, "IsUIBuild");
    v5->_OSInstallEnvironment = xpc_dictionary_get_BOOL(v4, "OSInstallEnvironment");
    v5->_StoreDemoMode = xpc_dictionary_get_BOOL(v4, "StoreDemoMode");
  }

  return v5;
}

- (GTDeviceProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS___GTDeviceProperties;
  timespec v5 = -[GTDeviceProperties init](&v40, "init");
  if (v5)
  {
    v5->_LocationID = (unint64_t)[v4 decodeIntegerForKey:@"LocationID"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"BuildVersion"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    BuildVersion = v5->_BuildVersion;
    v5->_BuildVersion = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"HWModel"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    HWModelStr = v5->_HWModelStr;
    v5->_HWModelStr = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"OSVersion"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    OSVersion = v5->_OSVersion;
    v5->_OSVersion = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ProductType"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    ProductType = v5->_ProductType;
    v5->_ProductType = (NSString *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"UniqueDeviceID"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    UniqueDeviceID = v5->_UniqueDeviceID;
    v5->_UniqueDeviceID = (NSString *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"Reality"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    Reality = v5->_Reality;
    v5->_Reality = (NSString *)v22;

    v5->_RemoteXPCVersionFlags = (unint64_t)[v4 decodeIntegerForKey:@"RemoteXPCVersionFlags"];
    id v24 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"CPUArchitecture"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    CPUArchitecture = v5->_CPUArchitecture;
    v5->_CPUArchitecture = (NSString *)v25;

    id v27 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"DeviceClass"];
    uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
    DeviceClass = v5->_DeviceClass;
    v5->_DeviceClass = (NSString *)v28;

    id v30 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"MobileDeviceMinimumVersion"];
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
    MobileDeviceMinimumVersion = v5->_MobileDeviceMinimumVersion;
    v5->_MobileDeviceMinimumVersion = (NSString *)v31;

    id v33 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ProductName"];
    uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
    ProductName = v5->_ProductName;
    v5->_ProductName = (NSString *)v34;

    id v36 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"ReleaseType"];
    uint64_t v37 = objc_claimAutoreleasedReturnValue(v36);
    ReleaseType = v5->_ReleaseType;
    v5->_ReleaseType = (NSString *)v37;

    v5->_AppleInternal = [v4 decodeBoolForKey:@"AppleInternal"];
    v5->_DeviceSupportsLockdown = [v4 decodeBoolForKey:@"DeviceSupportsLockdown"];
    v5->_EffectiveProductionStatusAp = [v4 decodeBoolForKey:@"EffectiveProductionStatusAp"];
    v5->_IsUIBuild = [v4 decodeBoolForKey:@"IsUIBuild"];
    v5->_OSInstallEnvironment = [v4 decodeBoolForKey:@"OSInstallEnvironment"];
    v5->_StoreDemoMode = [v4 decodeBoolForKey:@"StoreDemoMode"];
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  self->_ProductName,  self->_UniqueDeviceID);
}

- (id)initForEmbeddedSystem
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___GTDeviceProperties;
  int v2 = -[GTDeviceProperties init](&v15, "init");
  if (v2)
  {
    id v3 = -[GTDeviceProperties setAppleInternal:](v2, "setAppleInternal:", os_variant_has_internal_content(0LL));
    id v4 = (const __CFDictionary *)_CFCopySystemVersionDictionary(v3);
    if (v4)
    {
      timespec v5 = v4;
      -[GTDeviceProperties setOsVersion:]( v2,  "setOsVersion:",  CFDictionaryGetValue(v4, _kCFSystemVersionProductVersionKey));
      -[GTDeviceProperties setBuildVersion:]( v2,  "setBuildVersion:",  CFDictionaryGetValue(v5, _kCFSystemVersionBuildVersionKey));
      -[GTDeviceProperties setProductName:]( v2,  "setProductName:",  CFDictionaryGetValue(v5, _kCFSystemVersionProductNameKey));
      -[GTDeviceProperties setReleaseType:](v2, "setReleaseType:", CFDictionaryGetValue(v5, @"ReleaseType"));
      CFRelease(v5);
    }

    *__error() = 0;
    size_t __size = 128LL;
    int v6 = sysctlbyname("kern.osversion", values, &__size, 0LL, 0LL);
    if (!v6 || *__error() == 12)
    {
      if (__size != 128 || *__error() != 12)
      {
        uint64_t v8 = 0LL;
        uint64_t v7 = values;
        if (v6) {
          goto LABEL_13;
        }
        goto LABEL_15;
      }

      if (!sysctlbyname("kern.osversion", 0LL, &__size, 0LL, 0LL))
      {
        if (__size >= 0x81)
        {
          uint64_t v7 = malloc(__size);
          uint64_t v8 = v7;
          if (!sysctlbyname("kern.osversion", v7, &__size, 0LL, 0LL)) {
            goto LABEL_15;
          }
LABEL_13:
          id v9 = 0LL;
          size_t __size = 0LL;
          goto LABEL_16;
        }

        uint64_t v8 = 0LL;
        uint64_t v7 = values;
LABEL_15:
        id v9 = strdup((const char *)v7);
LABEL_16:
        free(v8);
        if (__size)
        {
          if (!v9)
          {
LABEL_19:
            __int128 v19 = *(_OWORD *)off_100030C70;
            __int128 v20 = *(_OWORD *)off_100030C80;
            __int128 v21 = *(_OWORD *)off_100030C90;
            uint64_t v22 = @"re6Zb+zwFKJNlkQTUeT+/w";
            *(_OWORD *)values = *(_OWORD *)off_100030C50;
            __int128 v18 = *(_OWORD *)off_100030C60;
            CFArrayRef v11 = CFArrayCreate(0LL, (const void **)values, 11LL, &kCFTypeArrayCallBacks);
            id v12 = (const __CFDictionary *)MGCopyMultipleAnswers(v11, 0LL);
            CFRelease(v11);
            -[GTDeviceProperties setCpuArchitecture:]( v2,  "setCpuArchitecture:",  CFDictionaryGetValue(v12, @"k7QIBwZJJOVw+Sej/8h8VA"));
            -[GTDeviceProperties setCpuArchitecture:]( v2,  "setCpuArchitecture:",  CFDictionaryGetValue(v12, @"k7QIBwZJJOVw+Sej/8h8VA"));
            -[GTDeviceProperties setDeviceClass:]( v2,  "setDeviceClass:",  CFDictionaryGetValue(v12, @"+3Uf0Pm5F8Xy7Onyvko0vA"));
            -[GTDeviceProperties setDeviceSupportsLockdown:]( v2,  "setDeviceSupportsLockdown:",  MGGetBoolAnswer(@"7ZipyD32hkjOUTl66Q8REw"));
            -[GTDeviceProperties setEffectiveProductionStatusAp:]( v2,  "setEffectiveProductionStatusAp:",  MGGetBoolAnswer(@"AQiIpW0UeYQKnhy2da7AXg"));
            -[GTDeviceProperties setHardwareModel:]( v2,  "setHardwareModel:",  CFDictionaryGetValue(v12, @"/YYygAofPDbhrwToVsXdeA"));
            -[GTDeviceProperties setIsUIBuild:](v2, "setIsUIBuild:", MGGetBoolAnswer(@"I32sGclpgl5VujQRJxyhKQ"));
            -[GTDeviceProperties setMobileDeviceMinimumVersion:]( v2,  "setMobileDeviceMinimumVersion:",  CFDictionaryGetValue(v12, @"k+KTni1jrwErpcDMEnn3aw"));
            -[GTDeviceProperties setProductName:]( v2,  "setProductName:",  CFDictionaryGetValue(v12, @"ivIu8YTDnBSrYv/SN4G8Ag"));
            -[GTDeviceProperties setProductType:]( v2,  "setProductType:",  CFDictionaryGetValue(v12, @"h9jDsbgj7xIVeIQ8S3/X3Q"));
            -[GTDeviceProperties setReleaseType:]( v2,  "setReleaseType:",  CFDictionaryGetValue(v12, @"9UCjT7Qfi4xLVvPAKIzTCQ"));
            -[GTDeviceProperties setUniqueDeviceID:]( v2,  "setUniqueDeviceID:",  CFDictionaryGetValue(v12, @"re6Zb+zwFKJNlkQTUeT+/w"));
            CFRelease(v12);
            -[GTDeviceProperties setOsInstallEnvironment:]( v2,  "setOsInstallEnvironment:",  getenv("__OSINSTALL_ENVIRONMENT") != 0LL);
            uint64_t v13 = v2;
            goto LABEL_20;
          }

- (void)encodeWithCoder:(id)a3
{
  unint64_t LocationID = self->_LocationID;
  id v5 = a3;
  [v5 encodeInteger:LocationID forKey:@"LocationID"];
  [v5 encodeObject:self->_BuildVersion forKey:@"BuildVersion"];
  [v5 encodeObject:self->_HWModelStr forKey:@"HWModel"];
  [v5 encodeObject:self->_OSVersion forKey:@"OSVersion"];
  [v5 encodeObject:self->_ProductType forKey:@"ProductType"];
  [v5 encodeObject:self->_UniqueDeviceID forKey:@"UniqueDeviceID"];
  [v5 encodeObject:self->_Reality forKey:@"Reality"];
  [v5 encodeInteger:self->_RemoteXPCVersionFlags forKey:@"RemoteXPCVersionFlags"];
  [v5 encodeObject:self->_CPUArchitecture forKey:@"CPUArchitecture"];
  [v5 encodeObject:self->_DeviceClass forKey:@"DeviceClass"];
  [v5 encodeObject:self->_MobileDeviceMinimumVersion forKey:@"MobileDeviceMinimumVersion"];
  [v5 encodeObject:self->_ProductName forKey:@"ProductName"];
  [v5 encodeObject:self->_ReleaseType forKey:@"ReleaseType"];
  [v5 encodeBool:self->_AppleInternal forKey:@"AppleInternal"];
  [v5 encodeBool:self->_DeviceSupportsLockdown forKey:@"DeviceSupportsLockdown"];
  [v5 encodeBool:self->_EffectiveProductionStatusAp forKey:@"EffectiveProductionStatusAp"];
  [v5 encodeBool:self->_IsUIBuild forKey:@"IsUIBuild"];
  [v5 encodeBool:self->_OSInstallEnvironment forKey:@"OSInstallEnvironment"];
  [v5 encodeBool:self->_StoreDemoMode forKey:@"StoreDemoMode"];
}

- (unint64_t)locationID
{
  return self->_LocationID;
}

- (void)setLocationID:(unint64_t)a3
{
  self->_unint64_t LocationID = a3;
}

- (NSString)buildVersion
{
  return self->_BuildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)hardwareModel
{
  return self->_HWModelStr;
}

- (void)setHardwareModel:(id)a3
{
}

- (NSString)osVersion
{
  return self->_OSVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)productType
{
  return self->_ProductType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)uniqueDeviceID
{
  return self->_UniqueDeviceID;
}

- (void)setUniqueDeviceID:(id)a3
{
}

- (NSString)reality
{
  return self->_Reality;
}

- (void)setReality:(id)a3
{
}

- (unint64_t)remoteXPCVersionFlags
{
  return self->_RemoteXPCVersionFlags;
}

- (void)setRemoteXPCVersionFlags:(unint64_t)a3
{
  self->_RemoteXPCVersionFlags = a3;
}

- (NSString)cpuArchitecture
{
  return self->_CPUArchitecture;
}

- (void)setCpuArchitecture:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_DeviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)mobileDeviceMinimumVersion
{
  return self->_MobileDeviceMinimumVersion;
}

- (void)setMobileDeviceMinimumVersion:(id)a3
{
}

- (NSString)productName
{
  return self->_ProductName;
}

- (void)setProductName:(id)a3
{
}

- (NSString)releaseType
{
  return self->_ReleaseType;
}

- (void)setReleaseType:(id)a3
{
}

- (BOOL)appleInternal
{
  return self->_AppleInternal;
}

- (void)setAppleInternal:(BOOL)a3
{
  self->_AppleInternal = a3;
}

- (BOOL)deviceSupportsLockdown
{
  return self->_DeviceSupportsLockdown;
}

- (void)setDeviceSupportsLockdown:(BOOL)a3
{
  self->_DeviceSupportsLockdown = a3;
}

- (BOOL)effectiveProductionStatusAp
{
  return self->_EffectiveProductionStatusAp;
}

- (void)setEffectiveProductionStatusAp:(BOOL)a3
{
  self->_EffectiveProductionStatusAp = a3;
}

- (BOOL)isUIBuild
{
  return self->_IsUIBuild;
}

- (void)setIsUIBuild:(BOOL)a3
{
  self->_IsUIBuild = a3;
}

- (BOOL)osInstallEnvironment
{
  return self->_OSInstallEnvironment;
}

- (void)setOsInstallEnvironment:(BOOL)a3
{
  self->_OSInstallEnvironment = a3;
}

- (BOOL)storeDemoMode
{
  return self->_StoreDemoMode;
}

- (void)setStoreDemoMode:(BOOL)a3
{
  self->_StoreDemoMode = a3;
}

- (void).cxx_destruct
{
}

@end