@interface TVMusicPlaylistImageLoader
+ (id)_playlistImageWithImages:(id)a3 size:(CGSize)a4 upscaleAdjustment:(double)a5 cornerRadius:(double)a6;
+ (id)sharedInstance;
- (TVMusicPlaylistImageLoader)init;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)_executeRequest:(id)a3;
- (void)_processFirstRequest:(id)a3;
- (void)cancelLoad:(id)a3;
@end

@implementation TVMusicPlaylistImageLoader

+ (id)_playlistImageWithImages:(id)a3 size:(CGSize)a4 upscaleAdjustment:(double)a5 cornerRadius:(double)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  if ((unint64_t)[v10 count] >= 4)
  {
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    v18 = sub_10005637C;
    v19 = &unk_10026B1F0;
    double v21 = width + a5;
    double v22 = height + a5;
    double v23 = (width + a5) * 0.5;
    double v24 = (height + a5) * 0.5;
    double v25 = a6;
    uint64_t v26 = 0LL;
    uint64_t v27 = 0LL;
    double v28 = width + a5;
    double v29 = height + a5;
    id v20 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVGraphicsImageRenderer imageWithSize:alpha:cgContextActions:]( &OBJC_CLASS___TVGraphicsImageRenderer,  "imageWithSize:alpha:cgContextActions:",  a6 > 0.0,  &v16,  width + a5,  height + a5));
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[TVImage imageWithCGImageRef:preserveAlpha:]( TVImage,  "imageWithCGImageRef:preserveAlpha:",  objc_msgSend(v14, "CGImage", v16, v17, v18, v19),  a6 > 0.0));
    }

    else
    {
      v11 = 0LL;
    }
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

+ (id)sharedInstance
{
  if (qword_1002BE918 != -1) {
    dispatch_once(&qword_1002BE918, &stru_10026B210);
  }
  return (id)qword_1002BE910;
}

- (TVMusicPlaylistImageLoader)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicPlaylistImageLoader;
  v2 = -[TVMusicPlaylistImageLoader init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Playlist Loader", 0LL);
    serialProcessingQueue = v2->_serialProcessingQueue;
    v2->_serialProcessingQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingQueue = v2->_pendingQueue;
    v2->_pendingQueue = v5;

    v2->_maxConcurrentCount = 4LL;
  }

  return v2;
}

- (id)imageKeyForObject:(id)a3
{
  return [a3 identifier];
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v10 = a3;
  [v10 setCompletionHandler:a8];
  serialProcessingQueue = (dispatch_queue_s *)self->_serialProcessingQueue;
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  uint64_t v17 = sub_1000566A8;
  v18 = &unk_100268B30;
  id v19 = v10;
  id v20 = self;
  id v12 = v10;
  dispatch_async(serialProcessingQueue, &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier", v15, v16, v17, v18));

  return v13;
}

- (void)cancelLoad:(id)a3
{
  id v4 = a3;
  serialProcessingQueue = (dispatch_queue_s *)self->_serialProcessingQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100056780;
  v7[3] = &unk_100268B30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialProcessingQueue, v7);
}

- (void)_processFirstRequest:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
  if (v4)
  {
    -[TVMusicPlaylistImageLoader _executeRequest:](self, "_executeRequest:", v4);
    [v5 removeObject:v4];
  }
}

- (void)_executeRequest:(id)a3
{
  id v4 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000569F4;
  v10[3] = &unk_100268CF0;
  v10[4] = self;
  id v5 = objc_retainBlock(v10);
  if ([v4 isCancelled])
  {
    dispatch_async((dispatch_queue_t)self->_serialProcessingQueue, v5);
  }

  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100056A44;
    v6[3] = &unk_10026B238;
    id v7 = v4;
    id v8 = self;
    v9 = v5;
    [v7 loadImagesWithCompletionHandler:v6];
  }
}

- (void).cxx_destruct
{
}

@end