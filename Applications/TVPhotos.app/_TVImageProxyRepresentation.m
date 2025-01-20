@interface _TVImageProxyRepresentation
- (CGImage)_originalImage;
- (_TVImageProxyRepresentation)initWithImageProxy:(id)a3;
- (id)_originalImageCacheKey;
- (void)dealloc;
- (void)loadImageWithCompletion:(id)a3;
@end

@implementation _TVImageProxyRepresentation

- (_TVImageProxyRepresentation)initWithImageProxy:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____TVImageProxyRepresentation;
  v6 = -[_TVImageProxyRepresentation init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imageProxy, a3);
    -[TVImageProxy setCacheOnLoad:](v7->_imageProxy, "setCacheOnLoad:", 1LL);
  }

  return v7;
}

- (void)dealloc
{
  originalImage = self->_originalImage;
  if (originalImage) {
    CGImageRelease(originalImage);
  }
  -[TVImageProxy cancel](self->_imageProxy, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____TVImageProxyRepresentation;
  -[_TVImageProxyRepresentation dealloc](&v4, "dealloc");
}

- (void)loadImageWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_originalImage)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000F238;
    block[3] = &unk_1000C95C8;
    block[4] = self;
    id v13 = v4;
    dispatch_async(v6, block);
  }

  else
  {
    objc_initWeak(&location, self);
    imageProxy = self->_imageProxy;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000F284;
    v8[3] = &unk_1000C9C78;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    -[TVImageProxy setCompletionHandler:](imageProxy, "setCompletionHandler:", v8);
    -[TVImageProxy load](self->_imageProxy, "load");

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (CGImage)_originalImage
{
  originalImage = self->_originalImage;
  if (originalImage) {
    return CGImageRetain(originalImage);
  }
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  uint64_t v18 = 0LL;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  imageProxy = self->_imageProxy;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  v11 = sub_10000F450;
  v12 = &unk_1000C9CA0;
  v14 = &v15;
  v7 = v5;
  id v13 = v7;
  -[TVImageProxy setCompletionHandler:](imageProxy, "setCompletionHandler:", &v9);
  -[TVImageProxy load](self->_imageProxy, "load", v9, v10, v11, v12);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  self->_originalImage = CGImageRetain((CGImageRef)v16[3]);
  v8 = (CGImage *)v16[3];

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (id)_originalImageCacheKey
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVImageProxy object](self->_imageProxy, "object"));
  if ((objc_opt_respondsToSelector(v2, "absoluteString") & 1) != 0) {
    v3 = (void *)objc_claimAutoreleasedReturnValue([v2 absoluteString]);
  }
  else {
    v3 = 0LL;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end