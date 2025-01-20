@interface _TVSettingsImageLoaderQueue
- (BOOL)isRandomized;
- (BOOL)pauseImageLoad;
- (NSArray)imageProxies;
- (NSMutableArray)finishedImages;
- (NSMutableArray)loadingImageProxies;
- (NSMutableArray)pendingImageProxies;
- (_TVSettingsImageLoaderQueue)init;
- (id)_imageProxyToLoadNext;
- (id)popNextImage;
- (id)preloadCompletionHandler;
- (unint64_t)_currentQueueSize;
- (unint64_t)concurrentDownloadCount;
- (unint64_t)nextIndex;
- (unint64_t)preloadCount;
- (unint64_t)queueSize;
- (void)_checkForPreloadCompletion;
- (void)_fillQueue;
- (void)_imageProxyDidFail:(id)a3 withError:(id)a4;
- (void)_imageProxyDidLoad:(id)a3 withImage:(id)a4;
- (void)_loadPendingImages;
- (void)dealloc;
- (void)preloadImageCount:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)setConcurrentDownloadCount:(unint64_t)a3;
- (void)setFinishedImages:(id)a3;
- (void)setImageProxies:(id)a3;
- (void)setLoadingImageProxies:(id)a3;
- (void)setNextIndex:(unint64_t)a3;
- (void)setPauseImageLoad:(BOOL)a3;
- (void)setPendingImageProxies:(id)a3;
- (void)setPreloadCompletionHandler:(id)a3;
- (void)setPreloadCount:(unint64_t)a3;
- (void)setQueueSize:(unint64_t)a3;
- (void)setRandomized:(BOOL)a3;
@end

@implementation _TVSettingsImageLoaderQueue

- (_TVSettingsImageLoaderQueue)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____TVSettingsImageLoaderQueue;
  v2 = -[_TVSettingsImageLoaderQueue init](&v11, "init");
  v3 = (_TVSettingsImageLoaderQueue *)v2;
  if (v2)
  {
    v2[8] = 0;
    *(_OWORD *)(v2 + 40) = xmmword_100129CF0;
    *((void *)v2 + 7) = 0LL;
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pendingImageProxies = v3->_pendingImageProxies;
    v3->_pendingImageProxies = (NSMutableArray *)v4;

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    loadingImageProxies = v3->_loadingImageProxies;
    v3->_loadingImageProxies = (NSMutableArray *)v6;

    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    finishedImages = v3->_finishedImages;
    v3->_finishedImages = (NSMutableArray *)v8;
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____TVSettingsImageLoaderQueue;
  -[_TVSettingsImageLoaderQueue dealloc](&v3, "dealloc");
}

- (void)setImageProxies:(id)a3
{
  if (self->_imageProxies != a3)
  {
    uint64_t v4 = (NSArray *)[a3 copy];
    imageProxies = self->_imageProxies;
    self->_imageProxies = v4;

    -[NSMutableArray makeObjectsPerformSelector:](self->_loadingImageProxies, "makeObjectsPerformSelector:", "cancel");
    -[NSMutableArray removeAllObjects](self->_pendingImageProxies, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_loadingImageProxies, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_finishedImages, "removeAllObjects");
    self->_nextIndex = 0LL;
    -[_TVSettingsImageLoaderQueue _fillQueue](self, "_fillQueue");
  }

- (void)preloadImageCount:(int64_t)a3 withCompletionHandler:(id)a4
{
  self->_preloadCount = a3;
  id v5 = [a4 copy];
  id preloadCompletionHandler = self->_preloadCompletionHandler;
  self->_id preloadCompletionHandler = v5;

  -[_TVSettingsImageLoaderQueue _fillQueue](self, "_fillQueue");
  -[_TVSettingsImageLoaderQueue _checkForPreloadCompletion](self, "_checkForPreloadCompletion");
}

- (id)popNextImage
{
  if (-[NSMutableArray count](self->_finishedImages, "count"))
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_finishedImages, "objectAtIndex:", 0LL));
    -[NSMutableArray removeObjectAtIndex:](self->_finishedImages, "removeObjectAtIndex:", 0LL);
    -[_TVSettingsImageLoaderQueue _fillQueue](self, "_fillQueue");
  }

  else
  {
    objc_super v3 = 0LL;
  }

  return v3;
}

- (void)setPauseImageLoad:(BOOL)a3
{
  if (self->_pauseImageLoad != a3)
  {
    self->_pauseImageLoad = a3;
    if (!a3) {
      -[_TVSettingsImageLoaderQueue _loadPendingImages](self, "_loadPendingImages");
    }
  }

- (unint64_t)_currentQueueSize
{
  objc_super v3 = (char *)-[NSMutableArray count](self->_pendingImageProxies, "count");
  uint64_t v4 = &v3[(void)-[NSMutableArray count](self->_loadingImageProxies, "count")];
  return (unint64_t)-[NSMutableArray count](self->_finishedImages, "count") + (void)v4;
}

- (void)_fillQueue
{
  if (-[NSArray count](self->_imageProxies, "count"))
  {
    while (1)
    {
      unint64_t v3 = -[_TVSettingsImageLoaderQueue _currentQueueSize](self, "_currentQueueSize");
      unint64_t queueSize = self->_queueSize;
      if (queueSize <= self->_preloadCount) {
        unint64_t queueSize = self->_preloadCount;
      }
      if (v3 >= queueSize) {
        break;
      }
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TVSettingsImageLoaderQueue _imageProxyToLoadNext](self, "_imageProxyToLoadNext"));
      -[NSMutableArray addObject:](self->_pendingImageProxies, "addObject:", v5);
    }

    if (!-[_TVSettingsImageLoaderQueue pauseImageLoad](self, "pauseImageLoad")) {
      -[_TVSettingsImageLoaderQueue _loadPendingImages](self, "_loadPendingImages");
    }
  }

- (id)_imageProxyToLoadNext
{
  if (self->_randomized)
  {
    id v3 = -[NSArray objectAtIndex:]( self->_imageProxies,  "objectAtIndex:",  arc4random() % -[NSArray count](self->_imageProxies, "count"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_imageProxies, "objectAtIndex:", self->_nextIndex));
    unint64_t v5 = self->_nextIndex + 1;
    self->_nextIndex = v5 % -[NSArray count](self->_imageProxies, "count");
  }

  return v4;
}

- (void)_loadPendingImages
{
  if ((unint64_t)-[NSMutableArray count](self->_loadingImageProxies, "count") < self->_concurrentDownloadCount)
  {
    if (-[NSMutableArray count](self->_pendingImageProxies, "count"))
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_pendingImageProxies, "objectAtIndex:", 0LL));
      objc_initWeak(&location, self);
      objc_initWeak(&from, v3);
      uint64_t v4 = _NSConcreteStackBlock;
      uint64_t v5 = 3221225472LL;
      uint64_t v6 = sub_10000DDF8;
      v7 = &unk_10018E968;
      objc_copyWeak(&v8, &location);
      objc_copyWeak(&v9, &from);
      [v3 setCompletionHandler:&v4];
      objc_msgSend(v3, "load", v4, v5, v6, v7);
      -[NSMutableArray removeObjectAtIndex:](self->_pendingImageProxies, "removeObjectAtIndex:", 0LL);
      -[NSMutableArray addObject:](self->_loadingImageProxies, "addObject:", v3);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }

- (void)_imageProxyDidLoad:(id)a3 withImage:(id)a4
{
  loadingImageProxies = self->_loadingImageProxies;
  id v7 = a4;
  -[NSMutableArray removeObject:](loadingImageProxies, "removeObject:", a3);
  -[NSMutableArray addObject:](self->_finishedImages, "addObject:", v7);

  -[_TVSettingsImageLoaderQueue _checkForPreloadCompletion](self, "_checkForPreloadCompletion");
  if (!-[_TVSettingsImageLoaderQueue pauseImageLoad](self, "pauseImageLoad")) {
    -[_TVSettingsImageLoaderQueue _loadPendingImages](self, "_loadPendingImages");
  }
}

- (void)_imageProxyDidFail:(id)a3 withError:(id)a4
{
  loadingImageProxies = self->_loadingImageProxies;
  id v6 = a3;
  -[NSMutableArray removeObject:](loadingImageProxies, "removeObject:", v6);
  id v9 = -[NSArray mutableCopy](self->_imageProxies, "mutableCopy");
  [v9 removeObject:v6];

  id v7 = (NSArray *)[v9 copy];
  imageProxies = self->_imageProxies;
  self->_imageProxies = v7;

  self->_nextIndex %= -[NSArray count](self->_imageProxies, "count");
  -[_TVSettingsImageLoaderQueue _fillQueue](self, "_fillQueue");
  -[_TVSettingsImageLoaderQueue _checkForPreloadCompletion](self, "_checkForPreloadCompletion");
  if (!-[_TVSettingsImageLoaderQueue pauseImageLoad](self, "pauseImageLoad")) {
    -[_TVSettingsImageLoaderQueue _loadPendingImages](self, "_loadPendingImages");
  }
}

- (void)_checkForPreloadCompletion
{
  if ((unint64_t)-[NSMutableArray count](self->_finishedImages, "count") >= self->_preloadCount)
  {
    id preloadCompletionHandler = (void (**)(void))self->_preloadCompletionHandler;
    if (preloadCompletionHandler)
    {
      preloadCompletionHandler[2]();
      id v4 = self->_preloadCompletionHandler;
      self->_preloadCount = 0LL;
      self->_id preloadCompletionHandler = 0LL;
    }
  }

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (BOOL)isRandomized
{
  return self->_randomized;
}

- (void)setRandomized:(BOOL)a3
{
  self->_randomized = a3;
}

- (BOOL)pauseImageLoad
{
  return self->_pauseImageLoad;
}

- (unint64_t)preloadCount
{
  return self->_preloadCount;
}

- (void)setPreloadCount:(unint64_t)a3
{
  self->_preloadCount = a3;
}

- (id)preloadCompletionHandler
{
  return self->_preloadCompletionHandler;
}

- (void)setPreloadCompletionHandler:(id)a3
{
}

- (unint64_t)queueSize
{
  return self->_queueSize;
}

- (void)setQueueSize:(unint64_t)a3
{
  self->_unint64_t queueSize = a3;
}

- (unint64_t)concurrentDownloadCount
{
  return self->_concurrentDownloadCount;
}

- (void)setConcurrentDownloadCount:(unint64_t)a3
{
  self->_concurrentDownloadCount = a3;
}

- (unint64_t)nextIndex
{
  return self->_nextIndex;
}

- (void)setNextIndex:(unint64_t)a3
{
  self->_nextIndex = a3;
}

- (NSMutableArray)pendingImageProxies
{
  return self->_pendingImageProxies;
}

- (void)setPendingImageProxies:(id)a3
{
}

- (NSMutableArray)loadingImageProxies
{
  return self->_loadingImageProxies;
}

- (void)setLoadingImageProxies:(id)a3
{
}

- (NSMutableArray)finishedImages
{
  return self->_finishedImages;
}

- (void)setFinishedImages:(id)a3
{
}

- (void).cxx_destruct
{
}

@end