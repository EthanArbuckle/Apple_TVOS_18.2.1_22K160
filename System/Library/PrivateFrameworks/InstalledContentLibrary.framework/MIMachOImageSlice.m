@interface MIMachOImageSlice
- (MIMachOImageSlice)initWithCPUType:(int)a3 cpuSubtype:(int)a4 platform:(unsigned int)a5 sdkVersion:(unsigned int)a6 minOSVersion:(unsigned int)a7;
- (id)description;
- (int)cpuSubtype;
- (int)cpuType;
- (unsigned)minOSVersion;
- (unsigned)platform;
- (unsigned)sdkVersion;
- (void)setCpuSubtype:(int)a3;
- (void)setCpuType:(int)a3;
- (void)setMinOSVersion:(unsigned int)a3;
- (void)setPlatform:(unsigned int)a3;
- (void)setSdkVersion:(unsigned int)a3;
@end

@implementation MIMachOImageSlice

- (MIMachOImageSlice)initWithCPUType:(int)a3 cpuSubtype:(int)a4 platform:(unsigned int)a5 sdkVersion:(unsigned int)a6 minOSVersion:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v11 = *(void *)&a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MIMachOImageSlice;
  v12 = -[MIMachOImageSlice init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[MIMachOImageSlice setCpuType:](v12, "setCpuType:", v11);
    -[MIMachOImageSlice setCpuSubtype:](v13, "setCpuSubtype:", v10);
    -[MIMachOImageSlice setPlatform:](v13, "setPlatform:", v9);
    -[MIMachOImageSlice setSdkVersion:](v13, "setSdkVersion:", v8);
    -[MIMachOImageSlice setMinOSVersion:](v13, "setMinOSVersion:", v7);
  }

  return v13;
}

- (id)description
{
  v3 = (void *)NSString;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MIMachOStringForPlatform(-[MIMachOImageSlice platform](self, "platform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ platform:%@ sdkVersion:%u minOSVersion:%u>", v5, v6, -[MIMachOImageSlice sdkVersion](self, "sdkVersion"), -[MIMachOImageSlice minOSVersion](self, "minOSVersion")];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)cpuType
{
  return self->_cpuType;
}

- (void)setCpuType:(int)a3
{
  self->_cpuType = a3;
}

- (int)cpuSubtype
{
  return self->_cpuSubtype;
}

- (void)setCpuSubtype:(int)a3
{
  self->_cpuSubtype = a3;
}

- (unsigned)platform
{
  return self->_platform;
}

- (void)setPlatform:(unsigned int)a3
{
  self->_platform = a3;
}

- (unsigned)sdkVersion
{
  return self->_sdkVersion;
}

- (void)setSdkVersion:(unsigned int)a3
{
  self->_sdkVersion = a3;
}

- (unsigned)minOSVersion
{
  return self->_minOSVersion;
}

- (void)setMinOSVersion:(unsigned int)a3
{
  self->_minOSVersion = a3;
}

@end