@interface ODRAssetDownloadRequest
- (ODRAssetDownloadRequest)init;
- (void)setExtractionProgress:(double)a3;
@end

@implementation ODRAssetDownloadRequest

- (ODRAssetDownloadRequest)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ODRAssetDownloadRequest;
  v2 = -[ODRAssetDownloadRequest init](&v16, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___AMSMutablePromise);
    completionPromise = v2->_completionPromise;
    v2->_completionPromise = v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", 1000LL));
    progress = v2->_progress;
    v2->_progress = (NSProgress *)v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSLock);
    lock = v2->_lock;
    v2->_lock = v7;

    v9 = -[LogKey initWithCode:](objc_alloc(&OBJC_CLASS____TtC9appstored6LogKey), "initWithCode:", @"ODR");
    logKey = v2->_logKey;
    v2->_logKey = v9;

    objc_initWeak(&location, v2);
    v11 = v2->_progress;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1002580C0;
    v13[3] = &unk_1003ECBA0;
    objc_copyWeak(&v14, &location);
    -[NSProgress setCancellationHandler:](v11, "setCancellationHandler:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)setExtractionProgress:(double)a3
{
}

- (void).cxx_destruct
{
}

@end