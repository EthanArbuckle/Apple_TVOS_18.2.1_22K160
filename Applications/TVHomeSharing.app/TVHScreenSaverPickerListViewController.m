@interface TVHScreenSaverPickerListViewController
+ (id)_filteredMediaCategoryTypesWithMediaCategoryTypes:(id)a3;
- (TVHCollectionViewDiffableDataSource)diffableDataSource;
- (TVHMediaCategoriesDataSource)dataSource;
- (TVHScreenSaverPickerListViewController)initWithMediaLibrary:(id)a3;
- (TVHScreenSaverPickerListViewController)initWithMediaLibrary:(id)a3 listViewLayout:(id)a4;
- (TVHScreenSaverPickerListViewController)initWithMediaLibrary:(id)a3 mediaCategoryTypes:(id)a4;
- (id)mediaEntitiesListViewController:(id)a3 previewFetchDescriptorForIdentifier:(id)a4;
- (id)mediaEntitiesListViewController:(id)a3 previewFetchIdentifierForIndexPath:(id)a4;
- (void)_configureCell:(id)a3 withIdentifier:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setDiffableDataSource:(id)a3;
- (void)updateWithMediaCategoryTypes:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVHScreenSaverPickerListViewController

- (TVHScreenSaverPickerListViewController)initWithMediaLibrary:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHScreenSaverPickerListViewController)initWithMediaLibrary:(id)a3 listViewLayout:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHScreenSaverPickerListViewController)initWithMediaLibrary:(id)a3 mediaCategoryTypes:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TVHScreenSaverPickerListViewController;
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
  }

  return v8;
}

- (void)updateWithMediaCategoryTypes:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) _filteredMediaCategoryTypesWithMediaCategoryTypes:v4];
  id v7 = (id)objc_claimAutoreleasedReturnValue(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPickerListViewController dataSource](self, "dataSource"));
  [v6 setMediaCategoryTypes:v7];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHScreenSaverPickerListViewController;
  -[TVHScreenSaverPickerListViewController viewDidLoad](&v13, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController listView](self, "listView"));
  [v3 registerClass:objc_opt_class(TVHSimpleListViewCell) forCellWithReuseIdentifier:@"CellIdentifier"];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(&OBJC_CLASS___TVHCollectionViewDiffableDataSource);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPickerListViewController dataSource](self, "dataSource"));
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  id v9 = sub_10003DAA0;
  v10 = &unk_1000FCF88;
  objc_copyWeak(&v11, &location);
  id v6 = -[TVHCollectionViewDiffableDataSource initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:]( v4,  "initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:",  v3,  v5,  &stru_1000FDE58,  &v7);

  -[TVHScreenSaverPickerListViewController setDiffableDataSource:](self, "setDiffableDataSource:", v6, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPickerListViewController dataSource](self, "dataSource"));
  id v15 = (id)objc_claimAutoreleasedReturnValue([v6 mediaCategoryTypeAtIndexPath:v5]);

  id v7 = v15;
  if (v15)
  {
    id v8 = [v15 unsignedIntegerValue];
    if (v8 == (id)9)
    {
      id v9 = objc_alloc(&OBJC_CLASS___TVHPhotosMainViewController);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController mediaLibrary](self, "mediaLibrary"));
      id v11 = -[TVHPhotosMainViewController initWithMediaLibrary:showingInTabBar:]( v9,  "initWithMediaLibrary:showingInTabBar:",  v10,  0LL);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPickerListViewController navigationController](self, "navigationController"));
      [v12 pushViewController:v11 animated:1];
    }

    else
    {
      id v13 = v8;
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVHScreenSaverPickerListViewController tvh_mediaLibrariesEnviroment]( self,  "tvh_mediaLibrariesEnviroment"));
      id v11 = (TVHPhotosMainViewController *)objc_claimAutoreleasedReturnValue([v14 screenSaverPicker]);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController mediaLibrary](self, "mediaLibrary"));
      -[TVHPhotosMainViewController setScreenSaverWithMediaLibrary:mediaCategoryType:mediaEntityCollection:]( v11,  "setScreenSaverWithMediaLibrary:mediaCategoryType:mediaEntityCollection:",  v12,  v13,  0LL);
    }

    id v7 = v15;
  }
}

- (id)mediaEntitiesListViewController:(id)a3 previewFetchIdentifierForIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPickerListViewController dataSource](self, "dataSource"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mediaCategoryTypeAtIndexPath:v5]);

  return v7;
}

- (id)mediaEntitiesListViewController:(id)a3 previewFetchDescriptorForIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [v5 unsignedIntegerValue];
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest tvh_imageParadeFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "tvh_imageParadeFetchRequestWithMediaCategoryType:",  v6));
  [v7 setIdentifier:@"ScreenSaverParadeFetchRequestIdentifier"];
  id v8 = objc_alloc(&OBJC_CLASS___TVHMediaEntityPreviewFetchDescriptor);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController mediaLibrary](self, "mediaLibrary"));
  v10 = -[TVHMediaEntityPreviewFetchDescriptor initWithIdentifier:mediaLibrary:fetchRequest:]( v8,  "initWithIdentifier:mediaLibrary:fetchRequest:",  v5,  v9,  v7);

  uint64_t v11 = TVHKMediaCategoryTypeLogString(v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"screenSaverParade-%@",  v12));

  -[TVHMediaEntityPreviewFetchDescriptor setLogName:](v10, "setLogName:", v13);
  return v10;
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
        if (objc_msgSend(v10, "unsignedIntegerValue", (void)v13) != (id)2) {
          -[NSMutableOrderedSet addObject:](v4, "addObject:", v10);
        }
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
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHScreenSaverPickerListViewController dataSource](self, "dataSource"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaCategoryTypeStringForItemIdentifier:v6]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 titleLabel]);
  [v9 setText:v8];
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