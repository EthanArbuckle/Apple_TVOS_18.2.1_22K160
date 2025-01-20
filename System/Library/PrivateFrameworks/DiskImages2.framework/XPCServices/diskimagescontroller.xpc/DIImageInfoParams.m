@interface DIImageInfoParams
+ (BOOL)supportsSecureCoding;
- (BOOL)extraInfo;
- (BOOL)openEncryption;
- (BOOL)retrieveWithError:(id *)a3;
- (DIImageInfoParams)initWithExistingParams:(id)a3 error:(id *)a4;
- (DIImageInfoParams)initWithURL:(id)a3 error:(id *)a4;
- (NSDictionary)imageInfo;
- (void)setExtraInfo:(BOOL)a3;
- (void)setImageInfo:(id)a3;
- (void)setOpenEncryption:(BOOL)a3;
@end

@implementation DIImageInfoParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIImageInfoParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___DIImageInfoParams;
  v7 = -[DIBaseParams initWithURL:error:](&v11, "initWithURL:error:", v6, a4);
  v8 = v7;
  if (v7
    && (v7->_extraInfo = 0,
        v7->_openEncryption = 1,
        !-[DIBaseParams openExistingImageWithFlags:error:](v7, "openExistingImageWithFlags:error:", 0LL, a4)))
  {
    v9 = 0LL;
  }

  else
  {
    v9 = v8;
  }

  return v9;
}

- (DIImageInfoParams)initWithExistingParams:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 inputURL]);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DIImageInfoParams;
  v8 = -[DIBaseParams initWithURL:error:](&v16, "initWithURL:error:", v7, a4);

  if (!v8) {
    goto LABEL_3;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v6 diskImageParamsXPC]);
  -[DIBaseParams setDiskImageParamsXPC:](v8, "setDiskImageParamsXPC:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](v8, "shadowChain"));
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v6 shadowChain]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 nodes]);
  unsigned __int8 v13 = [v10 addShadowNodes:v12 error:a4];

  if ((v13 & 1) == 0) {
    v14 = 0LL;
  }
  else {
LABEL_3:
  }
    v14 = v8;

  return v14;
}

- (BOOL)retrieveWithError:(id *)a3
{
  if (-[DIImageInfoParams openEncryption](self, "openEncryption"))
  {
    v5 = objc_alloc_init(&OBJC_CLASS___DIClient2Controller_XPCHandler);
    if (!-[DIClient2Controller_XPCHandler connectWithError:](v5, "connectWithError:", a3)
      || !-[DIBaseParams prepareImageWithXpcHandler:fileMode:error:]( self,  "prepareImageWithXpcHandler:fileMode:error:",  v5,  2LL,  a3))
    {

      return 0;
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  BOOL v7 = -[DIImageInfoParams extraInfo](self, "extraInfo");
  if (v6) {
    [v6 getImageInfoWithExtra:v7 error:a3];
  }
  else {
    v14 = 0LL;
  }

  BOOL v8 = v14 != 0LL;
  if (v14)
  {
    (*(void (**)(CFTypeRef *__return_ptr))(*(void *)((char *)v14 + *(void *)(*v14 - 96LL)) + 16LL))(&cf);
    v9 = (NSDictionary *)CFRetain(cf);
    imageInfo = self->_imageInfo;
    self->_imageInfo = v9;

    sub_10000D8A4(&cf);
    objc_super v11 = v14;
    v14 = 0LL;
    if (v11) {
      (*(void (**)(void *))(*v11 + 8LL))(v11);
    }
  }

  return v8;
}

- (NSDictionary)imageInfo
{
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
}

- (BOOL)extraInfo
{
  return self->_extraInfo;
}

- (void)setExtraInfo:(BOOL)a3
{
  self->_extraInfo = a3;
}

- (BOOL)openEncryption
{
  return self->_openEncryption;
}

- (void)setOpenEncryption:(BOOL)a3
{
  self->_openEncryption = a3;
}

- (void).cxx_destruct
{
}

@end