@interface MADPhotosFaceCropGenerationEntry
- (MADPhotosFaceCropGenerationEntry)initWithAsset:(id)a3 andFace:(id)a4;
- (NSMutableSet)faces;
- (NSURL)downloadURL;
- (PHAsset)asset;
- (PHAssetResource)resource;
- (int)status;
- (void)setDownloadURL:(id)a3;
- (void)setResource:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation MADPhotosFaceCropGenerationEntry

- (MADPhotosFaceCropGenerationEntry)initWithAsset:(id)a3 andFace:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MADPhotosFaceCropGenerationEntry;
  v9 = -[MADPhotosFaceCropGenerationEntry init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v8));
    faces = v10->_faces;
    v10->_faces = (NSMutableSet *)v11;
  }

  return v10;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (NSMutableSet)faces
{
  return self->_faces;
}

- (PHAssetResource)resource
{
  return self->_resource;
}

- (void)setResource:(id)a3
{
}

- (NSURL)downloadURL
{
  return self->_downloadURL;
}

- (void)setDownloadURL:(id)a3
{
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
}

@end