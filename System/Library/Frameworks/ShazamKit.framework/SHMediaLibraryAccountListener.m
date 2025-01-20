@interface SHMediaLibraryAccountListener
- (SHMediaLibraryAccountListener)init;
- (SHMediaLibraryInfoFetcher)libraryInfoFetcher;
- (id)notificationObserver;
- (void)dealloc;
- (void)listenForChanges;
- (void)setLibraryInfoFetcher:(id)a3;
- (void)setNotificationObserver:(id)a3;
- (void)stopListeningForChanges;
@end

@implementation SHMediaLibraryAccountListener

- (void)dealloc
{
  if (self->_notificationObserver)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 removeObserver:self->_notificationObserver];
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SHMediaLibraryAccountListener;
  -[SHMediaLibraryAccountListener dealloc](&v4, "dealloc");
}

- (SHMediaLibraryAccountListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SHMediaLibraryAccountListener;
  v2 = -[SHMediaLibraryAccountListener init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SHMediaLibraryInfoFetcher);
    libraryInfoFetcher = v2->_libraryInfoFetcher;
    v2->_libraryInfoFetcher = v3;
  }

  return v2;
}

- (void)listenForChanges
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryAccountListener notificationObserver](self, "notificationObserver"));

  if (v3) {
    -[SHMediaLibraryAccountListener stopListeningForChanges](self, "stopListeningForChanges");
  }
  objc_initWeak(&location, self);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_100028EF0;
  v10 = &unk_10006D870;
  objc_copyWeak(&v11, &location);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( [v4 addObserverForName:CKAccountChangedNotification object:0 queue:v5 usingBlock:&v7]);
  -[SHMediaLibraryAccountListener setNotificationObserver:](self, "setNotificationObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)stopListeningForChanges
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryAccountListener notificationObserver](self, "notificationObserver"));
  [v4 removeObserver:v3];
}

- (id)notificationObserver
{
  return self->_notificationObserver;
}

- (void)setNotificationObserver:(id)a3
{
}

- (SHMediaLibraryInfoFetcher)libraryInfoFetcher
{
  return self->_libraryInfoFetcher;
}

- (void)setLibraryInfoFetcher:(id)a3
{
}

- (void).cxx_destruct
{
}

@end