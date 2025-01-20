@interface DICreateUDSBParams
+ (BOOL)checkExistingFileWithURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5;
- (DICreateUDSBParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5;
- (unint64_t)sparseBundleBandSize;
- (void)createDiskImageParamsXPC;
- (void)setSparseBundleBandSize:(unint64_t)a3;
@end

@implementation DICreateUDSBParams

- (DICreateUDSBParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DICreateUDSBParams;
  result = -[DICreateParams initWithURL:numBlocks:error:](&v6, "initWithURL:numBlocks:error:", a3, a4, a5);
  if (result) {
    result->_sparseBundleBandSize = 0x4000000LL;
  }
  return result;
}

- (void)createDiskImageParamsXPC
{
  v3 = objc_alloc(&OBJC_CLASS___SparseBundleBackendXPC);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  objc_super v6 = -[SparseBundleBackendXPC initWithURL:fileOpenFlags:bandSize:]( v3,  "initWithURL:fileOpenFlags:bandSize:",  v4,  514LL,  -[DICreateUDSBParams sparseBundleBandSize](self, "sparseBundleBandSize"));

  v5 = -[DiskImageParamsXPC initWithBackendXPC:]( objc_alloc(&OBJC_CLASS___DiskImageParamsSparseBundle_XPC),  "initWithBackendXPC:",  v6);
  -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", v5);
}

+ (BOOL)checkExistingFileWithURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  if (a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:relativeToURL:",  @"Info.plist",  v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:relativeToURL:",  @"token",  v7));
    id v10 = v8;
    if (access((const char *)[v10 fileSystemRepresentation], 0)
      || access((const char *)[v9 fileSystemRepresentation], 0))
    {
      BOOL v11 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  17LL,  @"The requested URL is an existing non-sparsebundle folder",  a5);
    }

    else
    {
      BOOL v11 = 1;
    }
  }

  else
  {
    BOOL v11 = +[DIError failWithPOSIXCode:verboseInfo:error:]( &OBJC_CLASS___DIError,  "failWithPOSIXCode:verboseInfo:error:",  20LL,  @"The requested URL is an existing regular file",  a5);
  }

  return v11;
}

- (unint64_t)sparseBundleBandSize
{
  return self->_sparseBundleBandSize;
}

- (void)setSparseBundleBandSize:(unint64_t)a3
{
  self->_sparseBundleBandSize = a3;
}

@end