@interface DICreateRAWParams
- (DICreateRAWParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5;
- (void)createDiskImageParamsXPC;
@end

@implementation DICreateRAWParams

- (DICreateRAWParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DICreateRAWParams;
  return -[DICreateParams initWithURL:numBlocks:error:](&v6, sel_initWithURL_numBlocks_error_, a3, a4, a5);
}

- (void)createDiskImageParamsXPC
{
  v3 = objc_alloc(&OBJC_CLASS___FileLocalXPC);
  v4 = -[DIBaseParams inputURL](self, "inputURL");
  objc_super v6 = -[FileLocalXPC initWithURL:fileOpenFlags:](v3, "initWithURL:fileOpenFlags:", v4, 514LL);

  v5 = -[DiskImageParamsXPC initWithBackendXPC:]( objc_alloc(&OBJC_CLASS___DiskImageParamsRaw_XPC),  "initWithBackendXPC:",  v6);
  -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", v5);
}

@end