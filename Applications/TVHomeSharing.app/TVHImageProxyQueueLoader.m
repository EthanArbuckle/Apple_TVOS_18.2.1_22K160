@interface TVHImageProxyQueueLoader
- (BOOL)isPaused;
- (BOOL)isRandomized;
- (NSArray)imageProxies;
- (NSMutableArray)finishedImages;
- (NSMutableArray)loadingImageProxies;
- (NSMutableArray)pendingImageProxies;
- (TVHImageProxyQueueLoader)init;
- (id)_imageProxyToLoadNext;
- (id)popNextImage;
- (id)preloadCompletionHandler;
- (unint64_t)_currentQueueSize;
- (unint64_t)nextIndex;
- (unint64_t)preloadCount;
- (void)_checkForPreloadCompletion;
- (void)_fillQueue;
- (void)_imageProxyDidFail:(id)a3 withError:(id)a4;
- (void)_imageProxyDidLoad:(id)a3 withImage:(id)a4;
- (void)_loadPendingImages;
- (void)_loadPendingImagesIfPossible;
- (void)dealloc;
- (void)preloadImageCount:(int64_t)a3 withCompletionHandler:(id)a4;
- (void)setFinishedImages:(id)a3;
- (void)setImageProxies:(id)a3;
- (void)setLoadingImageProxies:(id)a3;
- (void)setNextIndex:(unint64_t)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPendingImageProxies:(id)a3;
- (void)setPreloadCompletionHandler:(id)a3;
- (void)setPreloadCount:(unint64_t)a3;
- (void)setRandomized:(BOOL)a3;
@end

@implementation TVHImageProxyQueueLoader

- (TVHImageProxyQueueLoader)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVHImageProxyQueueLoader;
  v2 = -[TVHImageProxyQueueLoader init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pendingImageProxies = v2->_pendingImageProxies;
    v2->_pendingImageProxies = (NSMutableArray *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    loadingImageProxies = v2->_loadingImageProxies;
    v2->_loadingImageProxies = (NSMutableArray *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    finishedImages = v2->_finishedImages;
    v2->_finishedImages = (NSMutableArray *)v7;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHImageProxyQueueLoader;
  -[TVHImageProxyQueueLoader dealloc](&v3, "dealloc");
}

- (void)setImageProxies:(id)a3
{
  if (self->_imageProxies != a3)
  {
    v4 = (NSArray *)[a3 copy];
    imageProxies = self->_imageProxies;
    self->_imageProxies = v4;

    -[NSMutableArray makeObjectsPerformSelector:](self->_loadingImageProxies, "makeObjectsPerformSelector:", "cancel");
    -[NSMutableArray removeAllObjects](self->_pendingImageProxies, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_loadingImageProxies, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_finishedImages, "removeAllObjects");
    self->_nextIndex = 0LL;
    -[TVHImageProxyQueueLoader _fillQueue](self, "_fillQueue");
  }

- (void)preloadImageCount:(int64_t)a3 withCompletionHandler:(id)a4
{
  self->_preloadCount = a3;
  id v5 = [a4 copy];
  id preloadCompletionHandler = self->_preloadCompletionHandler;
  self->_id preloadCompletionHandler = v5;

  -[TVHImageProxyQueueLoader _fillQueue](self, "_fillQueue");
  -[TVHImageProxyQueueLoader _checkForPreloadCompletion](self, "_checkForPreloadCompletion");
}

- (id)popNextImage
{
  if (-[NSMutableArray count](self->_finishedImages, "count"))
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_finishedImages, "objectAtIndex:", 0LL));
    -[NSMutableArray removeObjectAtIndex:](self->_finishedImages, "removeObjectAtIndex:", 0LL);
    -[TVHImageProxyQueueLoader _fillQueue](self, "_fillQueue");
  }

  else
  {
    objc_super v3 = 0LL;
  }

  return v3;
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[TVHImageProxyQueueLoader _loadPendingImagesIfPossible](self, "_loadPendingImagesIfPossible");
  }

- (unint64_t)_currentQueueSize
{
  objc_super v3 = (char *)-[NSMutableArray count](self->_pendingImageProxies, "count");
  v4 = &v3[(void)-[NSMutableArray count](self->_loadingImageProxies, "count")];
  return (unint64_t)-[NSMutableArray count](self->_finishedImages, "count") + (void)v4;
}

- (void)_fillQueue
{
  if (-[NSArray count](self->_imageProxies, "count"))
  {
    unint64_t v3 = -[TVHImageProxyQueueLoader _currentQueueSize](self, "_currentQueueSize");
    unint64_t preloadCount = self->_preloadCount;
    if (preloadCount <= 4) {
      unint64_t preloadCount = 4LL;
    }
    if (v3 < preloadCount)
    {
      do
      {
        id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHImageProxyQueueLoader _imageProxyToLoadNext](self, "_imageProxyToLoadNext"));
        -[NSMutableArray addObject:](self->_pendingImageProxies, "addObject:", v5);

        unint64_t v6 = -[TVHImageProxyQueueLoader _currentQueueSize](self, "_currentQueueSize");
        unint64_t v7 = self->_preloadCount;
        if (v7 <= 4) {
          unint64_t v7 = 4LL;
        }
      }

      while (v6 < v7);
    }

    -[TVHImageProxyQueueLoader _loadPendingImagesIfPossible](self, "_loadPendingImagesIfPossible");
  }

- (id)_imageProxyToLoadNext
{
  if (self->_randomized)
  {
    id v3 = -[NSArray objectAtIndex:]( self->_imageProxies,  "objectAtIndex:",  arc4random() % -[NSArray count](self->_imageProxies, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_imageProxies, "objectAtIndex:", self->_nextIndex));
    unint64_t v5 = self->_nextIndex + 1;
    self->_nextIndex = v5 % -[NSArray count](self->_imageProxies, "count");
  }

  return v4;
}

- (void)_loadPendingImagesIfPossible
{
  if (!-[TVHImageProxyQueueLoader isPaused](self, "isPaused")) {
    -[TVHImageProxyQueueLoader _loadPendingImages](self, "_loadPendingImages");
  }
}

- (void)_loadPendingImages
{
  if ((unint64_t)-[NSMutableArray count](self->_loadingImageProxies, "count") <= 1)
  {
    if (-[NSMutableArray count](self->_pendingImageProxies, "count"))
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_pendingImageProxies, "objectAtIndex:", 0LL));
      objc_initWeak(&location, self);
      objc_initWeak(&from, v3);
      v4 = _NSConcreteStackBlock;
      uint64_t v5 = 3221225472LL;
      unint64_t v6 = sub_1000870E0;
      unint64_t v7 = &unk_1000FE758;
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

  -[TVHImageProxyQueueLoader _checkForPreloadCompletion](self, "_checkForPreloadCompletion");
  -[TVHImageProxyQueueLoader _loadPendingImagesIfPossible](self, "_loadPendingImagesIfPossible");
}

- (void)_imageProxyDidFail:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_100079CF8();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10009CE44((uint64_t)v6, v9);
  }

  -[NSMutableArray removeObject:](self->_loadingImageProxies, "removeObject:", v7);
  id v10 = -[NSArray mutableCopy](self->_imageProxies, "mutableCopy");
  [v10 removeObject:v7];

  v11 = (NSArray *)[v10 copy];
  imageProxies = self->_imageProxies;
  self->_imageProxies = v11;

  self->_nextIndex %= -[NSArray count](self->_imageProxies, "count");
  -[TVHImageProxyQueueLoader _fillQueue](self, "_fillQueue");
  -[TVHImageProxyQueueLoader _checkForPreloadCompletion](self, "_checkForPreloadCompletion");
  -[TVHImageProxyQueueLoader _loadPendingImagesIfPossible](self, "_loadPendingImagesIfPossible");
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
      self->_unint64_t preloadCount = 0LL;
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

- (BOOL)isPaused
{
  return self->_paused;
}

- (unint64_t)preloadCount
{
  return self->_preloadCount;
}

- (void)setPreloadCount:(unint64_t)a3
{
  self->_unint64_t preloadCount = a3;
}

- (id)preloadCompletionHandler
{
  return self->_preloadCompletionHandler;
}

- (void)setPreloadCompletionHandler:(id)a3
{
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