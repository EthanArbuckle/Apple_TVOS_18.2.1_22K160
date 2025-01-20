@interface TVMoviesAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (id)mediaType;
@end

@implementation TVMoviesAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVCKStoreRentalsService sharedService](&OBJC_CLASS___TVCKStoreRentalsService, "sharedService"));
  [v8 enableRentals];

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVCKStoreRentalsService sharedService](&OBJC_CLASS___TVCKStoreRentalsService, "sharedService"));
  [v9 loadStoreBumperConfigWithCompletionHandler:0];

  +[TVCKStoreMediaItem setDefaultDataType:](&OBJC_CLASS___TVCKStoreMediaItem, "setDefaultDataType:", TVCKDataTypeMovie);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVCKCloudDataClient cloudDataClient](&OBJC_CLASS___TVCKCloudDataClient, "cloudDataClient"));
  [v10 setMonitorsCheckedOutRentals:1];

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVMoviesAppDelegate;
  LOBYTE(self) = -[TVMoviesAppDelegate application:didFinishLaunchingWithOptions:]( &v12,  "application:didFinishLaunchingWithOptions:",  v7,  v6);

  return (char)self;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    objc_super v12 = -[NSURLComponents initWithURL:resolvingAgainstBaseURL:]( objc_alloc(&OBJC_CLASS___NSURLComponents),  "initWithURL:resolvingAgainstBaseURL:",  v10,  0LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents queryItems](v12, "queryItems"));
    [v13 enumerateObjectsUsingBlock:&stru_100004170];
  }

  if (+[TVCKStoreAppDelegate instancesRespondToSelector:]( &OBJC_CLASS___TVCKStoreAppDelegate,  "instancesRespondToSelector:",  a2))
  {
    v16.receiver = self;
    v16.super_class = (Class)&OBJC_CLASS___TVMoviesAppDelegate;
    BOOL v14 = -[TVMoviesAppDelegate application:openURL:options:](&v16, "application:openURL:options:", v9, v10, v11);
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)mediaType
{
  return TVCKStoreFrontMediaTypeMovies;
}

@end