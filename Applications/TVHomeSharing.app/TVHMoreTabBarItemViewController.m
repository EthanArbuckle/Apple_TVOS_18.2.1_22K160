@interface TVHMoreTabBarItemViewController
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)_filteredMediaCategoryTypesWithMediaCategoryTypes:(id)a3;
- (NSSet)mediaCategoryTypes;
- (TVHCollectionViewDiffableDataSource)diffableDataSource;
- (TVHMediaCategoriesDataSource)dataSource;
- (TVHMoreTabBarItemViewController)initWithMediaLibrary:(id)a3;
- (TVHMoreTabBarItemViewController)initWithMediaLibrary:(id)a3 listViewLayout:(id)a4;
- (TVHMoreTabBarItemViewController)initWithMediaLibrary:(id)a3 mediaCategoryTypes:(id)a4;
- (id)mediaEntitiesListViewController:(id)a3 previewFetchDescriptorForIdentifier:(id)a4;
- (id)mediaEntitiesListViewController:(id)a3 previewFetchIdentifierForIndexPath:(id)a4;
- (unint64_t)selectedMediaCategoryType;
- (unint64_t)type;
- (void)_configureCell:(id)a3 withIdentifier:(id)a4;
- (void)_navigateToMediaCategoryType:(unint64_t)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setDiffableDataSource:(id)a3;
- (void)setSelectedMediaCategoryType:(unint64_t)a3;
- (void)updateWithMediaCategoryTypes:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVHMoreTabBarItemViewController

- (TVHMoreTabBarItemViewController)initWithMediaLibrary:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMoreTabBarItemViewController)initWithMediaLibrary:(id)a3 listViewLayout:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHMoreTabBarItemViewController)initWithMediaLibrary:(id)a3 mediaCategoryTypes:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHMoreTabBarItemViewController;
  v7 = -[TVHImageDeckListViewController initWithMediaLibrary:](&v14, "initWithMediaLibrary:", a3);
  v8 = v7;
  if (v7)
  {
    id v9 = [(id)objc_opt_class(v7) _filteredMediaCategoryTypesWithMediaCategoryTypes:v6];
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_alloc_init(&OBJC_CLASS___TVHMediaCategoriesDataSource);
    dataSource = v8->_dataSource;
    v8->_dataSource = v11;

    -[TVHMediaCategoriesDataSource setMediaCategoryTypes:](v8->_dataSource, "setMediaCategoryTypes:", v10);
    v8->_selectedMediaCategoryType = 0LL;
  }

  return v8;
}

- (void)updateWithMediaCategoryTypes:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) _filteredMediaCategoryTypesWithMediaCategoryTypes:v4];
  id v7 = (id)objc_claimAutoreleasedReturnValue(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoreTabBarItemViewController dataSource](self, "dataSource"));
  [v6 setMediaCategoryTypes:v7];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHMoreTabBarItemViewController;
  -[TVHMoreTabBarItemViewController viewDidLoad](&v13, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController listView](self, "listView"));
  [v3 registerClass:objc_opt_class(TVHSimpleListViewCell) forCellWithReuseIdentifier:@"CellIdentifier"];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(&OBJC_CLASS___TVHCollectionViewDiffableDataSource);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoreTabBarItemViewController dataSource](self, "dataSource"));
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_10004FA10;
  v10 = &unk_1000FCF88;
  objc_copyWeak(&v11, &location);
  id v6 = -[TVHCollectionViewDiffableDataSource initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:]( v4,  "initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:",  v3,  v5,  &stru_1000FE1B8,  &v7);

  -[TVHMoreTabBarItemViewController setDiffableDataSource:](self, "setDiffableDataSource:", v6, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (unint64_t)type
{
  return 4LL;
}

- (NSSet)mediaCategoryTypes
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoreTabBarItemViewController dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 mediaCategoryTypes]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 set]);

  return (NSSet *)v4;
}

- (unint64_t)selectedMediaCategoryType
{
  return self->_selectedMediaCategoryType;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoreTabBarItemViewController dataSource](self, "dataSource"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 mediaCategoryTypeAtIndexPath:v5]);

  id v7 = v8;
  if (v8)
  {
    -[TVHMoreTabBarItemViewController _navigateToMediaCategoryType:]( self,  "_navigateToMediaCategoryType:",  [v8 unsignedIntegerValue]);
    id v7 = v8;
  }
}

- (id)mediaEntitiesListViewController:(id)a3 previewFetchIdentifierForIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoreTabBarItemViewController dataSource](self, "dataSource"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaCategoryTypeAtIndexPath:v5]);

  -[TVHMoreTabBarItemViewController setSelectedMediaCategoryType:]( self,  "setSelectedMediaCategoryType:",  [v7 unsignedIntegerValue]);
  return v7;
}

- (id)mediaEntitiesListViewController:(id)a3 previewFetchDescriptorForIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [v5 unsignedIntegerValue];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest tvh_imageParadeFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "tvh_imageParadeFetchRequestWithMediaCategoryType:",  v6));
  [v7 setIdentifier:@"MoreParadeFetchRequestIdentifier"];
  id v8 = objc_alloc(&OBJC_CLASS___TVHMediaEntityPreviewFetchDescriptor);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController mediaLibrary](self, "mediaLibrary"));
  v10 = -[TVHMediaEntityPreviewFetchDescriptor initWithIdentifier:mediaLibrary:fetchRequest:]( v8,  "initWithIdentifier:mediaLibrary:fetchRequest:",  v5,  v9,  v7);

  uint64_t v11 = TVHKMediaCategoryTypeLogString(v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"moreParade-%@",  v12));

  -[TVHMediaEntityPreviewFetchDescriptor setLogName:](v10, "setLogName:", v13);
  return v10;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (qword_100157308 != -1) {
    dispatch_once(&qword_100157308, &stru_1000FE1D8);
  }
  if ([(id)qword_100157300 containsObject:v4])
  {
    unsigned __int8 v5 = 0;
  }

  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___TVHMoreTabBarItemViewController;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, "automaticallyNotifiesObserversForKey:", v4);
  }

  return v5;
}

- (void)setSelectedMediaCategoryType:(unint64_t)a3
{
  if (self->_selectedMediaCategoryType != a3)
  {
    -[TVHMoreTabBarItemViewController willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"selectedMediaCategoryType");
    self->_selectedMediaCategoryType = a3;
    -[TVHMoreTabBarItemViewController didChangeValueForKey:]( self,  "didChangeValueForKey:",  @"selectedMediaCategoryType");
  }

+ (id)_filteredMediaCategoryTypesWithMediaCategoryTypes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = -[NSMutableOrderedSet copy](v4, "copy");
  return v11;
}

- (void)_configureCell:(id)a3 withIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoreTabBarItemViewController dataSource](self, "dataSource"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaCategoryTypeStringForItemIdentifier:v6]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 titleLabel]);
  [v9 setText:v8];
}

- (void)_navigateToMediaCategoryType:(unint64_t)a3
{
  switch(a3)
  {
    case 5uLL:
      id v4 = &OBJC_CLASS___TVHHomeVideosMainViewController;
      goto LABEL_6;
    case 6uLL:
      id v4 = &OBJC_CLASS___TVHPodcastsMainViewController;
      goto LABEL_6;
    case 7uLL:
      id v4 = &OBJC_CLASS___TVHITunesUMainViewController;
      goto LABEL_6;
    case 8uLL:
      id v4 = &OBJC_CLASS___TVHAudiobooksMainViewController;
LABEL_6:
      id v5 = objc_alloc(v4);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController mediaLibrary](self, "mediaLibrary"));
      id v8 = [v5 initWithMediaLibrary:v6 showingInTabBar:0];

      if (v8)
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMoreTabBarItemViewController navigationController](self, "navigationController"));
        [v7 pushViewController:v8 animated:1];
      }

      break;
    default:
      return;
  }

- (TVHMediaCategoriesDataSource)dataSource
{
  return self->_dataSource;
}

- (TVHCollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end