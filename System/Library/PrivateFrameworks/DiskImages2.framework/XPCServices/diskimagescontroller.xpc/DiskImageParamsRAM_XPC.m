@interface DiskImageParamsRAM_XPC
+ (BOOL)supportsSecureCoding;
- (DiskImageParamsRAM_XPC)initWithURL:(id)a3 error:(id *)a4;
- (NSString)ramSizeStr;
- (unique_ptr<DiskImage,)createSinkDiskImage;
- (void)setBlockSize:(unint64_t)a3;
@end

@implementation DiskImageParamsRAM_XPC

- (DiskImageParamsRAM_XPC)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 host]);

  if (v7
    && (v8 = (void *)objc_claimAutoreleasedReturnValue([v6 host]),
        unint64_t v9 = +[DIHelpers numBlocksWithSizeStr:blockSize:]( &OBJC_CLASS___DIHelpers,  "numBlocksWithSizeStr:blockSize:",  v8,  512LL),  v8,  v9))
  {
    v10 = -[RamXPC initWithSize:](objc_alloc(&OBJC_CLASS___RamXPC), "initWithSize:", v9 << 9);
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___DiskImageParamsRAM_XPC;
    v11 = -[DiskImageParamsXPC initWithBackendXPC:](&v16, "initWithBackendXPC:", v10);
    if (v11)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v6 host]);
      ramSizeStr = v11->_ramSizeStr;
      v11->_ramSizeStr = (NSString *)v12;
    }

    self = v11;

    v14 = self;
  }

  else
  {
    v14 = (DiskImageParamsRAM_XPC *)objc_claimAutoreleasedReturnValue( +[DIError nilWithPOSIXCode:description:error:]( &OBJC_CLASS___DIError,  "nilWithPOSIXCode:description:error:",  22LL,  @"Malformed ram URL, expected to be ram://<?? | ??b | ??k | ??m | ??g | ??t>",  a4));
  }

  return v14;
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  [v3 createRamBackend];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DiskImageParamsRAM_XPC;
  -[DiskImageParamsRaw_XPC createSinkDiskImage](&v5, "createSinkDiskImage");

  return v4;
}

- (void)setBlockSize:(unint64_t)a3
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsRAM_XPC ramSizeStr](self, "ramSizeStr"));
  unint64_t v6 = +[DIHelpers numBlocksWithSizeStr:blockSize:](&OBJC_CLASS___DIHelpers, "numBlocksWithSizeStr:blockSize:", v5, a3);

  v7 = -[RamXPC initWithSize:](objc_alloc(&OBJC_CLASS___RamXPC), "initWithSize:", v6 * a3);
  -[DiskImageParamsXPC setBackendXPC:](self, "setBackendXPC:", v7);

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DiskImageParamsRAM_XPC;
  -[DiskImageParamsXPC setBlockSize:](&v8, "setBlockSize:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)ramSizeStr
{
  return self->_ramSizeStr;
}

- (void).cxx_destruct
{
}

@end