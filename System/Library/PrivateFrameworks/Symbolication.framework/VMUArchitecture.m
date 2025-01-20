@interface VMUArchitecture
+ (id)anyArchitecture;
+ (id)architectureWithCpuType:(int)a3 cpuSubtype:(int)a4;
+ (id)armArchitecture;
+ (id)currentArchitecture;
+ (id)i386Architecture;
+ (id)ppc32Architecture;
+ (id)ppc64Architecture;
+ (id)ppcArchitecture;
+ (id)x86_32Architecture;
+ (id)x86_64Architecture;
+ (void)initialize;
- (BOOL)is32Bit;
- (BOOL)is64Bit;
- (BOOL)isBigEndian;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToArchitecture:(id)a3;
- (BOOL)isLittleEndian;
- (BOOL)matchesArchitecture:(id)a3;
- (VMUArchitecture)initWithCoder:(id)a3;
- (VMUArchitecture)initWithCpuType:(int)a3 cpuSubtype:(int)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)cpuSubtype;
- (int)cpuType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VMUArchitecture

+ (void)initialize
{
  if (!currentArchitecture)
  {
    host_t v2 = MEMORY[0x186E32918](a1, a2);
    mach_msg_type_number_t host_info_outCnt = 12;
    if (!host_info(v2, 1, host_info_out, &host_info_outCnt))
    {
      v3 = objc_alloc(&OBJC_CLASS___VMUArchitecture);
      uint64_t v4 = -[VMUArchitecture initWithCpuType:cpuSubtype:]( v3,  "initWithCpuType:cpuSubtype:",  host_info_out[3],  host_info_out[4]);
      v5 = (void *)currentArchitecture;
      currentArchitecture = v4;
    }

    mach_port_deallocate(*MEMORY[0x1895FBBE0], v2);
    v6 = -[VMUArchitecture initWithCpuType:cpuSubtype:]( objc_alloc(&OBJC_CLASS___VMUArchitecture),  "initWithCpuType:cpuSubtype:",  18LL,  0LL);
    v7 = (void *)ppc32Architecture;
    ppc32Architecture = (uint64_t)v6;

    v8 = -[VMUArchitecture initWithCpuType:cpuSubtype:]( objc_alloc(&OBJC_CLASS___VMUArchitecture),  "initWithCpuType:cpuSubtype:",  16777234LL,  0LL);
    v9 = (void *)ppc64Architecture;
    ppc64Architecture = (uint64_t)v8;

    v10 = -[VMUArchitecture initWithCpuType:cpuSubtype:]( objc_alloc(&OBJC_CLASS___VMUArchitecture),  "initWithCpuType:cpuSubtype:",  7LL,  3LL);
    v11 = (void *)x86_32Architecture;
    x86_32Architecture = (uint64_t)v10;

    v12 = -[VMUArchitecture initWithCpuType:cpuSubtype:]( objc_alloc(&OBJC_CLASS___VMUArchitecture),  "initWithCpuType:cpuSubtype:",  16777223LL,  3LL);
    v13 = (void *)x86_64Architecture;
    x86_64Architecture = (uint64_t)v12;

    v14 = -[VMUArchitecture initWithCpuType:cpuSubtype:]( objc_alloc(&OBJC_CLASS___VMUArchitecture),  "initWithCpuType:cpuSubtype:",  12LL,  0LL);
    v15 = (void *)armArchitecture;
    armArchitecture = (uint64_t)v14;

    v16 = -[VMUArchitecture initWithCpuType:cpuSubtype:]( objc_alloc(&OBJC_CLASS___VMUArchitecture),  "initWithCpuType:cpuSubtype:",  0xFFFFFFFFLL,  0LL);
    v17 = (void *)anyArchitecture;
    anyArchitecture = (uint64_t)v16;
  }

+ (id)currentArchitecture
{
  return (id)currentArchitecture;
}

+ (id)anyArchitecture
{
  return (id)anyArchitecture;
}

+ (id)ppcArchitecture
{
  return (id)ppc32Architecture;
}

+ (id)ppc32Architecture
{
  return (id)ppc32Architecture;
}

+ (id)ppc64Architecture
{
  return (id)ppc64Architecture;
}

+ (id)i386Architecture
{
  return (id)x86_32Architecture;
}

+ (id)x86_32Architecture
{
  return (id)x86_32Architecture;
}

+ (id)x86_64Architecture
{
  return (id)x86_64Architecture;
}

+ (id)armArchitecture
{
  return (id)armArchitecture;
}

+ (id)architectureWithCpuType:(int)a3 cpuSubtype:(int)a4
{
  return  -[VMUArchitecture initWithCpuType:cpuSubtype:]( objc_alloc(&OBJC_CLASS___VMUArchitecture),  "initWithCpuType:cpuSubtype:",  *(void *)&a3,  *(void *)&a4);
}

- (VMUArchitecture)initWithCpuType:(int)a3 cpuSubtype:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___VMUArchitecture;
  result = -[VMUArchitecture init](&v7, sel_init);
  if (result)
  {
    result->_cpuType = a3;
    result->_cpuSubtype = a4;
  }

  return result;
}

- (VMUArchitecture)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VMUArchitecture;
  v5 = -[VMUArchitecture init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    [v4 decodeValueOfObjCType:"i" at:&v5->_cpuType size:4];
    [v4 decodeValueOfObjCType:"i" at:&v6->_cpuSubtype size:4];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  p_cpuType = &self->_cpuType;
  id v5 = a3;
  [v5 encodeValueOfObjCType:"i" at:p_cpuType];
  [v5 encodeValueOfObjCType:"i" at:&self->_cpuSubtype];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[VMUArchitecture initWithCpuType:cpuSubtype:]( +[VMUArchitecture allocWithZone:](&OBJC_CLASS___VMUArchitecture, "allocWithZone:", a3),  "initWithCpuType:cpuSubtype:",  self->_cpuType,  self->_cpuSubtype);
}

- (BOOL)isBigEndian
{
  return !-[VMUArchitecture isLittleEndian](self, "isLittleEndian");
}

- (BOOL)isLittleEndian
{
  uint64_t cpuType = self->_cpuType;
  int v3 = cpuType & 0xFFFFFF;
  if ((cpuType & 0xFFFFFF) == 7) {
    return 1;
  }
  if (v3 == 18) {
    return 0;
  }
  if (v3 == 12) {
    return 1;
  }
  id v5 = (void *)MEMORY[0x189603F70];
  [MEMORY[0x1896NSStringrmat:@"Cannot answer isLittleEndian for cpuType is %d cpuSubtype is %d", cpuType, self->_cpuSubtype];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 exceptionWithName:@"VMUArchitecture unhandled cpuType" reason:v6 userInfo:0];
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
  return -[VMUArchitecture is32Bit](v8, v9);
}

- (BOOL)is32Bit
{
  return !-[VMUArchitecture is64Bit](self, "is64Bit");
}

- (BOOL)is64Bit
{
  uint64_t cpuType = self->_cpuType;
  if ((cpuType & 0xFF000000) == 0) {
    return 0;
  }
  if ((cpuType & 0xFF000000) == 0x1000000) {
    return 1;
  }
  id v4 = (void *)MEMORY[0x189603F70];
  [MEMORY[0x1896NSStringrmat:@"Cannot answer is64Bit for cpuType is %d cpuSubtype is %d" , cpuType, self->_cpuSubtype];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 exceptionWithName:@"VMUArchitecture unhandled cpuType" reason:v5 userInfo:0];
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
  return -[VMUArchitecture isEqualToArchitecture:](v7, v8, v9);
}

- (BOOL)isEqualToArchitecture:(id)a3
{
  id v4 = a3;
  int cpuType = self->_cpuType;
  if (cpuType == [v4 cpuType])
  {
    int cpuSubtype = self->_cpuSubtype;
    BOOL v7 = cpuSubtype == [v4 cpuSubtype];
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    unsigned __int8 v5 = -[VMUArchitecture isEqualToArchitecture:](self, "isEqualToArchitecture:", v4);
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___VMUArchitecture;
    unsigned __int8 v5 = -[VMUArchitecture isEqual:](&v8, sel_isEqual_, v4);
  }

  BOOL v6 = v5;

  return v6;
}

- (unint64_t)hash
{
  return self->_cpuSubtype ^ self->_cpuType;
}

- (BOOL)matchesArchitecture:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  int cpuType = self->_cpuType;
  if (cpuType == [v5 cpuType])
  {
    int v7 = self->_cpuType & 0xFFFFFF;
    if (v7 == 18 || v7 == 12)
    {
      if ((self->_cpuSubtype & 0xFFFFFF) == 0 || ([v5 cpuSubtype] & 0xFFFFFF) == 0) {
        goto LABEL_14;
      }
    }

    else if (v7 == 7 && ((self->_cpuSubtype & 0xFFFFFF) == 3 || ([v5 cpuSubtype] & 0xFFFFFF) == 3))
    {
LABEL_14:
      BOOL v8 = 1;
      goto LABEL_15;
    }

    int cpuSubtype = self->_cpuSubtype;
    BOOL v8 = cpuSubtype == [v5 cpuSubtype];
  }

  else
  {
    BOOL v8 = 0;
  }

- (int)cpuType
{
  return self->_cpuType;
}

- (int)cpuSubtype
{
  return self->_cpuSubtype;
}

- (id)description
{
  int v3 = (void *)NSString;
  uint64_t cpuType = self->_cpuType;
  uint64_t cpuSubtype = self->_cpuSubtype;
  if (-[VMUArchitecture is32Bit](self, "is32Bit")) {
    BOOL v6 = @"32b";
  }
  else {
    BOOL v6 = @"64b";
  }
  BOOL v7 = -[VMUArchitecture isBigEndian](self, "isBigEndian");
  BOOL v8 = @"LittleEndian";
  if (v7) {
    BOOL v8 = @"BigEndian";
  }
  return (id)[v3 stringWithFormat:@"<VMUArchitecture: %p> 0x%x,0x%x %@ - %@", self, cpuType, cpuSubtype, v6, v8, 0];
}

@end