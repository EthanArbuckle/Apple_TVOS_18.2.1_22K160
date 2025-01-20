@interface TVHMoviesByContributorViewController
+ (id)new;
- (BOOL)contentHasBeenDeleted;
- (CGSize)_imageSize;
- (NSString)contributor;
- (TVHKMediaEntitiesFetchContext)moviesFetchContext;
- (TVHMediaEntitiesDataSource)gridDataSource;
- (TVHMediaEntitiesGridViewController)gridViewController;
- (TVHMoviesByContributorViewController)init;
- (TVHMoviesByContributorViewController)initWithCoder:(id)a3;
- (TVHMoviesByContributorViewController)initWithContributor:(id)a3 moviesFetchContext:(id)a4 moviesInfoCenter:(id)a5;
- (TVHMoviesByContributorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHMoviesInfoCenter)moviesInfoCenter;
- (void)dealloc;
- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5;
- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4;
- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4;
- (void)moviesInfoCenterDidChange:(id)a3;
- (void)setContentHasBeenDeleted:(BOOL)a3;
- (void)setGridDataSource:(id)a3;
- (void)setGridViewController:(id)a3;
@end

@implementation TVHMoviesByContributorViewController

+ (id)new
{
  return 0LL;
}

- (TVHMoviesByContributorViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMoviesByContributorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHMoviesByContributorViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMoviesByContributorViewController)initWithContributor:(id)a3 moviesFetchContext:(id)a4 moviesInfoCenter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TVHMoviesByContributorViewController;
  v11 = -[TVHMoviesByContributorViewController initWithNibName:bundle:](&v28, "initWithNibName:bundle:", 0LL, 0LL);
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    contributor = v11->_contributor;
    v11->_contributor = v12;

    objc_storeStrong((id *)&v11->_moviesFetchContext, a4);
    objc_storeStrong((id *)&v11->_moviesInfoCenter, a5);
    -[TVHMoviesInfoCenter addObserver:](v11->_moviesInfoCenter, "addObserver:", v11);
    v14 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource),  "initWithFetchResultIdentifier:",  @"MoviesByContributorFetchResultIdentifier");
    gridDataSource = v11->_gridDataSource;
    v11->_gridDataSource = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue([v10 moviesByContributorTitle]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 objectForKey:v11->_contributor]);
    v18 = (void *)v17;
    v19 = &__NSArray0__struct;
    if (v17) {
      v19 = (void *)v17;
    }
    id v20 = v19;

    v21 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithIdentifier:mediaEntities:",  @"MoviesByContributorFetchResultIdentifier",  v20);
    v22 = v11->_gridDataSource;
    v29 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
    -[TVHMediaEntitiesDataSource updateWithMediaEntitiesDataSourceFetchResults:]( v22,  "updateWithMediaEntitiesDataSourceFetchResults:",  v23);

    -[TVHMoviesByContributorViewController _imageSize](v11, "_imageSize");
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[TVHMediaEntitiesGridViewLayout mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:]( &OBJC_CLASS___TVHMediaEntitiesGridViewLayout,  "mediaEntitiesGridViewLayoutWithImageSize:footerLayoutType:",  0LL));
    [v24 setMinimumInteritemSpacing:48.0];
    v25 = -[TVHMediaEntitiesGridViewController initWithDataSource:layout:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesGridViewController),  "initWithDataSource:layout:",  v11->_gridDataSource,  v24);
    gridViewController = v11->_gridViewController;
    v11->_gridViewController = v25;

    -[TVHMediaEntitiesGridViewController setDelegate:](v11->_gridViewController, "setDelegate:", v11);
    -[TVHMediaEntitiesGridViewController setHeaderTitle:](v11->_gridViewController, "setHeaderTitle:", v8);
    -[TVHMediaEntitiesGridViewController setCentersHeaderTitle:]( v11->_gridViewController,  "setCentersHeaderTitle:",  1LL);
    -[TVHMoviesByContributorViewController tvh_setFullViewChildViewController:]( v11,  "tvh_setFullViewChildViewController:",  v11->_gridViewController);
  }

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHMoviesByContributorViewController;
  -[TVHMoviesByContributorViewController dealloc](&v3, "dealloc");
}

- (void)mediaEntitiesGridViewController:(id)a3 configureLockup:(id)a4 forMediaEntity:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHMoviesByContributorViewController moviesInfoCenter](self, "moviesInfoCenter"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 mediaLibrary]);
  +[TVHPosterLockupConfigurator configurePosterLockup:withMediaEntity:mediaLibrary:]( &OBJC_CLASS___TVHPosterLockupConfigurator,  "configurePosterLockup:withMediaEntity:mediaLibrary:",  v8,  v7,  v9);
}

- (void)mediaEntitiesGridViewController:(id)a3 didSelectMediaEntity:(id)a4
{
  id v5 = a4;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVHMoviesByContributorViewController moviesFetchContext](self, "moviesFetchContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesByContributorViewController moviesInfoCenter](self, "moviesInfoCenter"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaLibrary]);
  id v8 = -[TVHMovieViewController initWithMovie:mediaLibrary:moviesFetchContext:moviesInfoCenter:]( objc_alloc(&OBJC_CLASS___TVHMovieViewController),  "initWithMovie:mediaLibrary:moviesFetchContext:moviesInfoCenter:",  v5,  v7,  v10,  v6);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesByContributorViewController navigationController](self, "navigationController"));
  [v9 pushViewController:v8 animated:1];
}

- (void)mediaEntitiesGridViewController:(id)a3 didPlayMediaEntity:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc(&OBJC_CLASS___TVHPlayerPlaylist);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesByContributorViewController moviesInfoCenter](self, "moviesInfoCenter"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaLibrary]);
  id v10 = -[TVHPlayerPlaylist initWithHomeSharingMediaItem:mediaLibrary:]( v6,  "initWithHomeSharingMediaItem:mediaLibrary:",  v5,  v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesByContributorViewController tvh_playbackManager](self, "tvh_playbackManager"));
  [v9 playPlaylist:v10];
}

- (void)moviesInfoCenterDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesByContributorViewController gridDataSource](self, "gridDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntities]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 moviesByContributorTitle]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesByContributorViewController contributor](self, "contributor"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v7 objectForKey:v8]);
  id v10 = (void *)v9;
  v11 = &__NSArray0__struct;
  if (v9) {
    v11 = (void *)v9;
  }
  id v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaLibraryUtilities changeSetFromCurrentMediaEntities:toLatestMediaEntities:]( &OBJC_CLASS___TVHKMediaLibraryUtilities,  "changeSetFromCurrentMediaEntities:toLatestMediaEntities:",  v6,  v12));
  v14 = -[TVHMediaEntitiesDataSourceFetchResult initWithIdentifier:mediaEntities:]( objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSourceFetchResult),  "initWithIdentifier:mediaEntities:",  @"MoviesByContributorFetchResultIdentifier",  v12);

  -[TVHMediaEntitiesDataSourceFetchResult setChangeSet:](v14, "setChangeSet:", v13);
  v18 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  [v5 updateWithMediaEntitiesDataSourceFetchResults:v15];

  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntities]);
  id v17 = [v16 count];

  if (!v17) {
    -[TVHMoviesByContributorViewController setContentHasBeenDeleted:](self, "setContentHasBeenDeleted:", 1LL);
  }
}

- (CGSize)_imageSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoviesByContributorViewController moviesInfoCenter](self, "moviesInfoCenter"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaLibrary]);
  unsigned int v4 = objc_msgSend(v3, "tvh_shouldDisplayWideMovieCoverArt");

  double v5 = 250.0;
  if (v4) {
    double v5 = 355.0;
  }
  double v6 = 375.0;
  if (v4) {
    double v6 = 200.0;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)contentHasBeenDeleted
{
  return self->_contentHasBeenDeleted;
}

- (void)setContentHasBeenDeleted:(BOOL)a3
{
  self->_contentHasBeenDeleted = a3;
}

- (NSString)contributor
{
  return self->_contributor;
}

- (TVHKMediaEntitiesFetchContext)moviesFetchContext
{
  return self->_moviesFetchContext;
}

- (TVHMoviesInfoCenter)moviesInfoCenter
{
  return self->_moviesInfoCenter;
}

- (TVHMediaEntitiesGridViewController)gridViewController
{
  return self->_gridViewController;
}

- (void)setGridViewController:(id)a3
{
}

- (TVHMediaEntitiesDataSource)gridDataSource
{
  return self->_gridDataSource;
}

- (void)setGridDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end