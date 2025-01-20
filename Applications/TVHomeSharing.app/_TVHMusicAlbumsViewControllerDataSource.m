@interface _TVHMusicAlbumsViewControllerDataSource
- (BOOL)showsPlaybackControls;
- (NSArray)sortOptions;
- (NSString)headerTitle;
- (NSString)noContentFoundErrorMessage;
- (TVHKMediaEntitiesFetchRequest)fetchRequest;
- (TVHMediaEntitiesDataSource)mediaEntitiesDataSource;
- (TVHSortOption)pendingSortOption;
- (_TVHMusicAlbumsViewControllerDataSource)initWithFetchRequest:(id)a3 initialSortOption:(id)a4;
- (void)processPendingSortOption;
- (void)setPendingSortOption:(id)a3;
@end

@implementation _TVHMusicAlbumsViewControllerDataSource

- (_TVHMusicAlbumsViewControllerDataSource)initWithFetchRequest:(id)a3 initialSortOption:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS____TVHMusicAlbumsViewControllerDataSource;
  v9 = -[_TVHMusicAlbumsViewControllerDataSource init](&v22, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fetchRequest, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption artistTitle](&OBJC_CLASS___TVHSortOption, "artistTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption title](&OBJC_CLASS___TVHSortOption, "title"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TVHSortOption recentlyAdded](&OBJC_CLASS___TVHSortOption, "recentlyAdded"));
    v23[0] = v11;
    v23[1] = v12;
    v23[2] = v13;
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 3LL));
    sortOptions = v10->_sortOptions;
    v10->_sortOptions = (NSArray *)v14;

    if (!v8 || !-[NSArray containsObject:](v10->_sortOptions, "containsObject:", v8))
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v10->_sortOptions, "firstObject"));

      id v8 = (id)v16;
    }

    v17 = objc_alloc(&OBJC_CLASS___TVHMediaEntitiesDataSource);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHKMediaEntitiesFetchRequest identifier](v10->_fetchRequest, "identifier"));
    v19 = -[TVHMediaEntitiesDataSource initWithFetchResultIdentifier:initialSortOption:]( v17,  "initWithFetchResultIdentifier:initialSortOption:",  v18,  v8);
    mediaEntitiesDataSource = v10->_mediaEntitiesDataSource;
    v10->_mediaEntitiesDataSource = v19;

    -[TVHMediaEntitiesDataSource setProvideIndexTitles:](v10->_mediaEntitiesDataSource, "setProvideIndexTitles:", 1LL);
  }

  return v10;
}

- (BOOL)showsPlaybackControls
{
  return 1;
}

- (NSString)headerTitle
{
  return 0LL;
}

- (NSString)noContentFoundErrorMessage
{
  return (NSString *)&stru_100100278;
}

- (void)processPendingSortOption
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[_TVHMusicAlbumsViewControllerDataSource pendingSortOption](self, "pendingSortOption"));
  if (v4)
  {
    -[_TVHMusicAlbumsViewControllerDataSource setPendingSortOption:](self, "setPendingSortOption:", 0LL);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TVHMusicAlbumsViewControllerDataSource mediaEntitiesDataSource](self, "mediaEntitiesDataSource"));
    [v3 setCurrentSortOption:v4];
  }
}

- (NSArray)sortOptions
{
  return self->_sortOptions;
}

- (TVHKMediaEntitiesFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (TVHMediaEntitiesDataSource)mediaEntitiesDataSource
{
  return self->_mediaEntitiesDataSource;
}

- (TVHSortOption)pendingSortOption
{
  return self->_pendingSortOption;
}

- (void)setPendingSortOption:(id)a3
{
}

- (void).cxx_destruct
{
}

@end