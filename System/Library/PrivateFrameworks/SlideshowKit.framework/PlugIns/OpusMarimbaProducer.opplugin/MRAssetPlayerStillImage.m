@interface MRAssetPlayerStillImage
- (MRAssetPlayerStillImage)initWithPath:(id)a3 size:(CGSize)a4 master:(id)a5 andOptions:(id)a6;
- (id)retainedByUserImageAtTime:(double)a3 displayLinkTimestamp:(double)a4;
- (void)dealloc;
- (void)loadForTime:(double)a3;
@end

@implementation MRAssetPlayerStillImage

- (MRAssetPlayerStillImage)initWithPath:(id)a3 size:(CGSize)a4 master:(id)a5 andOptions:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRAssetPlayerStillImage;
  v6 = -[MRAssetPlayer initWithPath:size:master:andOptions:]( &v8,  "initWithPath:size:master:andOptions:",  a3,  a5,  a6,  a4.width,  a4.height);
  if (v6) {
    v6->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
  }
  return v6;
}

- (void)dealloc
{
  self->super._image = 0LL;
  semaphore = (dispatch_object_s *)self->_semaphore;
  if (semaphore)
  {
    dispatch_release(semaphore);
    self->_semaphore = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRAssetPlayerStillImage;
  -[MRAssetPlayer dealloc](&v4, "dealloc");
}

- (id)retainedByUserImageAtTime:(double)a3 displayLinkTimestamp:(double)a4
{
  if (self->_isLoaded)
  {
    id v5 = -[MRImage retainByUser](self->super._image, "retainByUser", a3, a4);
    semaphore = (dispatch_object_s *)self->_semaphore;
    if (semaphore)
    {
      dispatch_release(semaphore);
      self->_semaphore = 0LL;
    }

    return v5;
  }

  objc_sync_enter(self);
  image = self->super._image;
  if ((image
     || self->super._thumbnailIsOK
     && (image = (MRImage *)objc_msgSend( -[MRAssetMaster thumbnailForFlagsMonochromatic:mipmap:powerOfTwo:]( self->super._master,  "thumbnailForFlagsMonochromatic:mipmap:powerOfTwo:",  self->super._isMonochromatic,  self->super._generatesMipmap,  self->super._usesPowerOfTwo),  "retainByUser"),  (self->super._image = image) != 0))
    && (self->_isLoaded || self->super._thumbnailIsOK))
  {
    id v5 = -[MRImage retainByUser](image, "retainByUser");
    objc_sync_exit(self);
    if (v5) {
      return v5;
    }
  }

  else
  {
    objc_sync_exit(self);
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  return -[MRImage retainByUser](self->super._image, "retainByUser");
}

- (void)loadForTime:(double)a3
{
  if (!self->_isLoaded)
  {
    objc_sync_enter(self);
    if (self->_isLoadingOrLoaded)
    {
      objc_sync_exit(self);
    }

    else
    {
      self->_isLoadingOrLoaded = 1;
      objc_sync_exit(self);
      Image = _GetImage( self->super._master,  self->super._isMonochromatic,  self->super._generatesMipmap,  self->super._usesPowerOfTwo,  0LL,  !self->super._thumbnailIsOK,  self->super._size.width,  self->super._size.height,  self->super._time);
      objc_sync_enter(self);
      id v5 = self->super._image;
      if (v5) {
        -[MRImage releaseByUser](v5, "releaseByUser");
      }
      self->super._image = (MRImage *)-[MRImage retainByUser](Image, "retainByUser");
      objc_sync_exit(self);
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
      self->_isLoaded = 1;
      delegate = self->super._delegate;
      if (delegate) {
        -[MRAssetPlayerDelegate imageIsAvailableFromAssetPlayer:](delegate, "imageIsAvailableFromAssetPlayer:", self);
      }
    }
  }

@end