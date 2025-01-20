@interface MTTVListenNowEpisodeListViewController
+ (Class)episodeCellClass;
+ (id)resultsController;
- (MTTVListenNowEpisodeListViewController)init;
- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5;
- (void)playEpisodeAtIndexPath:(id)a3;
@end

@implementation MTTVListenNowEpisodeListViewController

+ (Class)episodeCellClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___MTTVEpisodeCell, a2);
}

+ (id)resultsController
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForListenNow](&OBJC_CLASS___MTEpisode, "predicateForListenNow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForListenNow](&OBJC_CLASS___MTEpisode, "sortDescriptorsForListenNow"));
  v4 = objc_alloc(&OBJC_CLASS___MTCoreDataResultsController);
  v5 = -[MTCoreDataResultsController initWithEntityName:predicate:sortDescriptors:propertyKeys:]( v4,  "initWithEntityName:predicate:sortDescriptors:propertyKeys:",  kMTEpisodeEntityName,  v2,  v3,  0LL);
  v6 = objc_alloc(&OBJC_CLASS___MTCompositeResultsController);
  v10 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  v8 = -[MTCompositeResultsController initWithControllers:](v6, "initWithControllers:", v7);

  return v8;
}

- (MTTVListenNowEpisodeListViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MTTVListenNowEpisodeListViewController;
  v2 = -[MTTVEpisodeListViewController initWithCompositeFetchedResultsController:]( &v10,  "initWithCompositeFetchedResultsController:",  0LL);
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[MTTVListenNowEpisodeListViewController setRestorationIdentifier:](v3, "setRestorationIdentifier:", v6);

    -[MTTVListenNowEpisodeListViewController loadViewIfNeeded](v3, "loadViewIfNeeded");
    id v7 = [(id)objc_opt_class(v3) resultsController];
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[MTTVFetchedTableWithSectionsViewController setCompositeResultsController:]( v3,  "setCompositeResultsController:",  v8);
  }

  return v3;
}

- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVListenNowEpisodeListViewController;
  id v7 = a3;
  -[MTTVEpisodeListViewController configureCell:withObject:atIndexPath:]( &v8,  "configureCell:withObject:atIndexPath:",  v7,  a4,  a5);
  objc_msgSend(v7, "setShowsArtwork:", 1, v8.receiver, v8.super_class);
  [v7 setShowsPlayState:0];
}

- (void)playEpisodeAtIndexPath:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController objectAtIndexPath:](self, "objectAtIndexPath:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTPlaybackQueueFactory playEpisodeUuid:]( &OBJC_CLASS___MTPlaybackQueueFactory,  "playEpisodeUuid:",  v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
  [v5 playManifest:v4 reason:3];
}

@end