@interface ADOnDemandAssetSubscriber
- (ADOnDemandAssetSubscriber)initWithPreferences:(id)a3 invalidationHandler:(id)a4;
- (void)_invalidate;
- (void)_setupIfNecessary;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
@end

@implementation ADOnDemandAssetSubscriber

- (ADOnDemandAssetSubscriber)initWithPreferences:(id)a3 invalidationHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADOnDemandAssetSubscriber;
  v9 = -[ADOnDemandAssetSubscriber init](&v17, "init");
  if (v9)
  {
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("ADOnDemandAssetSubscriber", v11);

    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    id v14 = objc_retainBlock(v8);
    id invalidationHandler = v9->_invalidationHandler;
    v9->_id invalidationHandler = v14;

    objc_storeStrong((id *)&v9->_preferences, a3);
    -[ADOnDemandAssetSubscriber _setupIfNecessary](v9, "_setupIfNecessary");
  }

  return v9;
}

- (void)_setupIfNecessary
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006941C;
  v4[3] = &unk_1004FAF58;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  objc_initWeak(&location, self);
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000692BC;
  block[3] = &unk_1004EEE78;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a5;
  id v15 = v10;
  id v16 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(queue, block);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

- (void)_invalidate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[ADRequestLifecycleObserver sharedObserver]( &OBJC_CLASS___ADRequestLifecycleObserver,  "sharedObserver"));
  [v3 removeListener:self];

  id invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    id v5 = self->_invalidationHandler;
    self->_id invalidationHandler = 0LL;
  }

- (void).cxx_destruct
{
}

@end