@interface DYGTDeviceInfo
+ (BOOL)supportsSecureCoding;
- ($16123236EB3C150F368AB57B9BCDCA0E)mainScreenDescriptor;
- (DYGTDeviceInfo)initWithCoder:(id)a3;
- (DYGTGPUToolsVersionInfo)gputoolsVersionInfo;
- (NSArray)profiles;
- (NSString)build;
- (NSString)metalVersion;
- (NSString)name;
- (NSString)permanentIdentifier;
- (NSString)productType;
- (NSString)version;
- (int)platform;
- (unint64_t)runtimeIdentifier;
- (unsigned)nativePointerSize;
- (void)encodeWithCoder:(id)a3;
- (void)setBuild:(id)a3;
- (void)setGputoolsVersionInfo:(id)a3;
- (void)setMainScreenDescriptor:(id *)a3;
- (void)setMetalVersion:(id)a3;
- (void)setName:(id)a3;
- (void)setNativePointerSize:(unsigned int)a3;
- (void)setPermanentIdentifier:(id)a3;
- (void)setPlatform:(int)a3;
- (void)setProductType:(id)a3;
- (void)setProfiles:(id)a3;
- (void)setRuntimeIdentifier:(unint64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation DYGTDeviceInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYGTDeviceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___DYGTDeviceInfo;
  v5 = -[DYGTDeviceInfo init](&v34, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"permanentIdentifier"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    permanentIdentifier = v5->_permanentIdentifier;
    v5->_permanentIdentifier = (NSString *)v7;

    v5->_runtimeIdentifier = (unint64_t)[v4 decodeInt64ForKey:@"runtimeIdentifier"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"name"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    name = v5->_name;
    v5->_name = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"productType"];
    uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
    productType = v5->_productType;
    v5->_productType = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"version"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    version = v5->_version;
    v5->_version = (NSString *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"build"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    build = v5->_build;
    v5->_build = (NSString *)v19;

    v5->_int platform = [v4 decodeInt32ForKey:@"platform"];
    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"metalVersion"];
    uint64_t v22 = objc_claimAutoreleasedReturnValue(v21);
    metalVersion = v5->_metalVersion;
    v5->_metalVersion = (NSString *)v22;

    id v24 = [v4 decodeObjectOfClass:objc_opt_class(DYGTGPUToolsVersionInfo) forKey:@"gputoolsVersionInfo"];
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);
    gputoolsVersionInfo = v5->_gputoolsVersionInfo;
    v5->_gputoolsVersionInfo = (DYGTGPUToolsVersionInfo *)v25;

    v5->_mainScreenDescriptor.width = [v4 decodeInt32ForKey:@"mainScreenResolution.width"];
    v5->_mainScreenDescriptor.height = [v4 decodeInt32ForKey:@"mainScreenResolution.height"];
    v5->_mainScreenDescriptor.scale = [v4 decodeInt32ForKey:@"mainScreenResolution.scale"];
    [v4 decodeDoubleForKey:@"mainScreenDescriptor.orientation"];
    v5->_mainScreenDescriptor.orientation = v27;
    v5->_mainScreenDescriptor.type = [v4 decodeInt32ForKey:@"mainScreenDescriptor.type"];
    id v28 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class(DYGTMTLDeviceProfile) forKey:@"supportedGLProfileContextsInfo"];
    uint64_t v29 = objc_claimAutoreleasedReturnValue(v28);
    profiles = v5->_profiles;
    v5->_profiles = (NSArray *)v29;

    v5->_nativePointerSize = [v4 decodeInt32ForKey:@"nativePointerSize"];
    int platform = v5->_platform;
    if (platform == 7)
    {
      int v32 = 9;
      goto LABEL_6;
    }

    if (platform == 8)
    {
      int v32 = 10;
LABEL_6:
      v5->_int platform = v32;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  permanentIdentifier = self->_permanentIdentifier;
  id v5 = a3;
  [v5 encodeObject:permanentIdentifier forKey:@"identifier"];
  [v5 encodeInt64:self->_runtimeIdentifier forKey:@"runtimeIdentifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_productType forKey:@"productType"];
  [v5 encodeObject:self->_version forKey:@"version"];
  [v5 encodeObject:self->_build forKey:@"build"];
  [v5 encodeInt32:self->_platform forKey:@"platform"];
  [v5 encodeObject:self->_metalVersion forKey:@"metalVersion"];
  [v5 encodeObject:self->_gputoolsVersionInfo forKey:@"gputoolsVersionInfo"];
  [v5 encodeInt32:self->_mainScreenDescriptor.width forKey:@"mainScreenResolution.width"];
  [v5 encodeInt32:self->_mainScreenDescriptor.height forKey:@"mainScreenResolution.height"];
  [v5 encodeInt32:self->_mainScreenDescriptor.scale forKey:@"mainScreenResolution.scale"];
  [v5 encodeDouble:@"mainScreenDescriptor.orientation" forKey:self->_mainScreenDescriptor.orientation];
  [v5 encodeInt32:self->_mainScreenDescriptor.type forKey:@"mainScreenDescriptor.type"];
  [v5 encodeObject:self->_profiles forKey:@"supportedGLProfileContextsInfo"];
  [v5 encodeInt32:self->_nativePointerSize forKey:@"nativePointerSize"];
}

- (int)platform
{
  return self->_platform;
}

- (void)setPlatform:(int)a3
{
  self->_int platform = a3;
}

- (unint64_t)runtimeIdentifier
{
  return self->_runtimeIdentifier;
}

- (void)setRuntimeIdentifier:(unint64_t)a3
{
  self->_runtimeIdentifier = a3;
}

- (NSString)permanentIdentifier
{
  return self->_permanentIdentifier;
}

- (void)setPermanentIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (NSString)metalVersion
{
  return self->_metalVersion;
}

- (void)setMetalVersion:(id)a3
{
}

- (unsigned)nativePointerSize
{
  return self->_nativePointerSize;
}

- (void)setNativePointerSize:(unsigned int)a3
{
  self->_nativePointerSize = a3;
}

- (DYGTGPUToolsVersionInfo)gputoolsVersionInfo
{
  return self->_gputoolsVersionInfo;
}

- (void)setGputoolsVersionInfo:(id)a3
{
}

- ($16123236EB3C150F368AB57B9BCDCA0E)mainScreenDescriptor
{
  *($F47FE06625FC0D634ED89CCC9D0BEEDA *)retstr = *($F47FE06625FC0D634ED89CCC9D0BEEDA *)((char *)self + 88);
  return self;
}

- (void)setMainScreenDescriptor:(id *)a3
{
  __int128 v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_mainScreenDescriptor.scale = *(void *)&a3->var3;
  *(_OWORD *)&self->_mainScreenDescriptor.orientation = v3;
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void)setProfiles:(id)a3
{
}

- (void).cxx_destruct
{
}

@end