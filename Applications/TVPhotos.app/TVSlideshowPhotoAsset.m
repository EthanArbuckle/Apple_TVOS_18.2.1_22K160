@interface TVSlideshowPhotoAsset
- (PHAsset)photoAsset;
- (int)pendingRequestID;
- (void)setPendingRequestID:(int)a3;
- (void)setPhotoAsset:(id)a3;
@end

@implementation TVSlideshowPhotoAsset

- (PHAsset)photoAsset
{
  return self->_photoAsset;
}

- (void)setPhotoAsset:(id)a3
{
}

- (int)pendingRequestID
{
  return self->_pendingRequestID;
}

- (void)setPendingRequestID:(int)a3
{
  self->_pendingRequestID = a3;
}

- (void).cxx_destruct
{
}

@end