@interface DIStackParams
- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 error:(id *)a5;
- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 numBlocks:(unint64_t)a5 error:(id *)a6;
- (BOOL)supportsPstack;
- (DIStackParams)initWithURL:(id)a3 error:(id *)a4;
@end

@implementation DIStackParams

- (DIStackParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DIStackParams;
  v7 = -[DIBaseParams initWithURL:error:](&v11, sel_initWithURL_error_, v6, a4);
  v8 = v7;
  if (v7 && !-[DIBaseParams openExistingImageWithFlags:error:](v7, "openExistingImageWithFlags:error:", 0LL, a4)) {
    v9 = 0LL;
  }
  else {
    v9 = v8;
  }

  return v9;
}

- (BOOL)supportsPstack
{
  return 0;
}

- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 error:(id *)a5
{
  return -[DIStackParams appendWithURL:isCache:numBlocks:error:]( self,  "appendWithURL:isCache:numBlocks:error:",  a3,  a4,  0LL,  a5);
}

- (BOOL)appendWithURL:(id)a3 isCache:(BOOL)a4 numBlocks:(unint64_t)a5 error:(id *)a6
{
  BOOL v8 = a4;
  v21[1] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  objc_super v11 = -[DIShadowNode initWithURL:isCache:](objc_alloc(&OBJC_CLASS___DIShadowNode), "initWithURL:isCache:", v10, v8);
  -[DIShadowNode setNumBlocks:](v11, "setNumBlocks:", a5);
  v12 = -[DIBaseParams shadowChain](self, "shadowChain");
  v21[0] = v11;
  [MEMORY[0x189603F18] arrayWithObjects:v21 count:1];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  char v14 = [v12 addShadowNodes:v13 error:a6];

  if ((v14 & 1) != 0)
  {
    v15 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
    if (-[DIClient2Controller_XPCHandler connectWithError:](v15, "connectWithError:", a6)
      && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:]( self,  "prepareImageWithXpcHandler:fileMode:error:",  v15,  3LL,  a6))
    {
      v16 = -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
      v17 = v16;
      if (v16)
      {
        [v16 createDiskImageWithCache:0 shadowValidation:0];

        if (v20) {
          (*(void (**)())(*(void *)v20 + 16LL))();
        }
      }

      else
      {
      }

      BOOL v18 = 1;
    }

    else
    {
      BOOL v18 = 0;
    }
  }

  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

@end