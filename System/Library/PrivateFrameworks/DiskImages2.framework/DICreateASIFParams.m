@interface DICreateASIFParams
- (DICreateASIFParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5;
- (void)createDiskImageParamsXPC;
@end

@implementation DICreateASIFParams

- (DICreateASIFParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DICreateASIFParams;
  return -[DICreateParams initWithURL:numBlocks:error:](&v6, sel_initWithURL_numBlocks_error_, a3, a4, a5);
}

- (void)createDiskImageParamsXPC
{
  v3 = objc_alloc(&OBJC_CLASS___FileLocalXPC);
  v4 = -[DIBaseParams inputURL](self, "inputURL");
  v5 = -[FileLocalXPC initWithURL:fileOpenFlags:](v3, "initWithURL:fileOpenFlags:", v4, 514LL);

  __p = 0LL;
  objc_super v6 = -[DiskImageParamsASIF_XPC initWithBackendXPC:header:]( objc_alloc(&OBJC_CLASS___DiskImageParamsASIF_XPC),  "initWithBackendXPC:header:",  v5,  &__p);
  -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", v6);

  v7 = __p;
  __p = 0LL;
  if (v7) {
    operator delete(v7);
  }
}

@end