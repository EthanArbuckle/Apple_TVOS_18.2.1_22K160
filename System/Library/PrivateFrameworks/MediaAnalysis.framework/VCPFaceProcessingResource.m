@interface VCPFaceProcessingResource
+ (id)resourceWithResource:(id)a3 resourceURL:(id)a4 isBestResource:(BOOL)a5 requestDownload:(BOOL)a6 downloadStatus:(int)a7;
- (BOOL)isBestResource;
- (BOOL)requestDownload;
- (NSURL)resourceURL;
- (PHAssetResource)resource;
- (VCPFaceProcessingResource)initWithResource:(id)a3 resourceURL:(id)a4 isBestResource:(BOOL)a5 requestDownload:(BOOL)a6 downloadStatus:(int)a7;
- (int)downloadStatus;
@end

@implementation VCPFaceProcessingResource

- (VCPFaceProcessingResource)initWithResource:(id)a3 resourceURL:(id)a4 isBestResource:(BOOL)a5 requestDownload:(BOOL)a6 downloadStatus:(int)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___VCPFaceProcessingResource;
  v15 = -[VCPFaceProcessingResource init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_resource, a3);
    objc_storeStrong((id *)&v16->_resourceURL, a4);
    v16->_isBestResource = a5;
    v16->_requestDownload = a6;
    v16->_downloadStatus = a7;
  }

  return v16;
}

+ (id)resourceWithResource:(id)a3 resourceURL:(id)a4 isBestResource:(BOOL)a5 requestDownload:(BOOL)a6 downloadStatus:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = -[VCPFaceProcessingResource initWithResource:resourceURL:isBestResource:requestDownload:downloadStatus:]( objc_alloc(&OBJC_CLASS___VCPFaceProcessingResource),  "initWithResource:resourceURL:isBestResource:requestDownload:downloadStatus:",  v11,  v12,  v9,  v8,  v7);

  return v13;
}

- (PHAssetResource)resource
{
  return self->_resource;
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (BOOL)isBestResource
{
  return self->_isBestResource;
}

- (BOOL)requestDownload
{
  return self->_requestDownload;
}

- (int)downloadStatus
{
  return self->_downloadStatus;
}

- (void).cxx_destruct
{
}

@end