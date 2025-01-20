@interface PLMaintenanceTask
- (PLLibraryServicesManager)libraryServicesManager;
- (PLMaintenanceTask)initWithLibraryBundle:(id)a3;
- (PLPhotoLibrary)photoLibrary;
- (PLPhotoLibraryBundle)libraryBundle;
@end

@implementation PLMaintenanceTask

- (PLMaintenanceTask)initWithLibraryBundle:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PLMaintenanceTask;
  v6 = -[PLMaintenanceTask init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryBundle, a3);
    id v8 = objc_initWeak(&location, v7);

    v9 = objc_alloc(&OBJC_CLASS___PLLazyObject);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100004260;
    v13[3] = &unk_100020BC8;
    objc_copyWeak(&v14, &location);
    v10 = -[PLLazyObject initWithBlock:](v9, "initWithBlock:", v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    lazyPhotoLibrary = v7->_lazyPhotoLibrary;
    v7->_lazyPhotoLibrary = v10;
  }

  return v7;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PLMaintenanceTask libraryBundle](self, "libraryBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 libraryServicesManager]);

  return (PLLibraryServicesManager *)v3;
}

- (PLPhotoLibrary)photoLibrary
{
  return (PLPhotoLibrary *)-[PLLazyObject objectValue](self->_lazyPhotoLibrary, "objectValue");
}

- (PLPhotoLibraryBundle)libraryBundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end