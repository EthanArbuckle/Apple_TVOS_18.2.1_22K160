@interface TVHPhotosMainListViewController
- (TVHCollectionViewDiffableDataSource)diffableDataSource;
- (TVHPhotosMainListViewController)initWithMediaLibrary:(id)a3;
- (TVHPhotosMainListViewController)initWithMediaLibrary:(id)a3 dataSource:(id)a4;
- (TVHPhotosMainListViewController)initWithMediaLibrary:(id)a3 listViewLayout:(id)a4;
- (TVHPhotosMainListViewDataSource)dataSource;
- (id)mediaEntitiesListViewController:(id)a3 previewFetchDescriptorForIdentifier:(id)a4;
- (id)mediaEntitiesListViewController:(id)a3 previewFetchIdentifierForIndexPath:(id)a4;
- (void)_configureCell:(id)a3 withIdentifier:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setDiffableDataSource:(id)a3;
- (void)updateWithPhotoPlaylistsFetchResponse:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVHPhotosMainListViewController

- (TVHPhotosMainListViewController)initWithMediaLibrary:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHPhotosMainListViewController)initWithMediaLibrary:(id)a3 listViewLayout:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHPhotosMainListViewController)initWithMediaLibrary:(id)a3 dataSource:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVHPhotosMainListViewController;
  v8 = -[TVHImageDeckListViewController initWithMediaLibrary:](&v11, "initWithMediaLibrary:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_dataSource, a4);
  }

  return v9;
}

- (void)updateWithPhotoPlaylistsFetchResponse:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainListViewController dataSource](self, "dataSource"));
  [v5 updateWithPhotoPlaylistsFetchResponse:v4];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVHPhotosMainListViewController;
  -[TVHPhotosMainListViewController viewDidLoad](&v13, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController listView](self, "listView"));
  [v3 registerClass:objc_opt_class(TVHSimpleListViewCell) forCellWithReuseIdentifier:@"PhotoItemCellIdentifier"];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(&OBJC_CLASS___TVHCollectionViewDiffableDataSource);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainListViewController dataSource](self, "dataSource"));
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = sub_100052600;
  v10 = &unk_1000FCF88;
  objc_copyWeak(&v11, &location);
  v6 = -[TVHCollectionViewDiffableDataSource initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:]( v4,  "initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:",  v3,  v5,  &stru_1000FE260,  &v7);

  -[TVHPhotosMainListViewController setDiffableDataSource:](self, "setDiffableDataSource:", v6, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainListViewController dataSource](self, "dataSource"));
  id v19 = (id)objc_claimAutoreleasedReturnValue([v6 photoMainItemAtIndexPath:v5]);

  switch((unint64_t)[v19 type])
  {
    case 0uLL:
      id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVHPhotosMainListViewController tvh_mediaLibrariesEnviroment]( self,  "tvh_mediaLibrariesEnviroment"));
      if ([v7 isConfiguringScreenSaverOnly])
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 screenSaverPicker]);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController mediaLibrary](self, "mediaLibrary"));
        [v8 setScreenSaverWithMediaLibrary:v9 mediaCategoryType:9 mediaEntityCollection:0];

        v10 = 0LL;
      }

      else
      {
        v17 = objc_alloc(&OBJC_CLASS___TVHPhotosItemsViewController);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController mediaLibrary](self, "mediaLibrary"));
        v10 = -[TVHPhotosItemsViewController initWithMediaLibrary:](v17, "initWithMediaLibrary:", v8);
      }

      goto LABEL_10;
    case 1uLL:
      v16 = objc_alloc(&OBJC_CLASS___TVHPhotosPlaylistsViewController);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController mediaLibrary](self, "mediaLibrary"));
      v12 = v16;
      objc_super v13 = v7;
      uint64_t v14 = 1LL;
      goto LABEL_7;
    case 2uLL:
      id v11 = objc_alloc(&OBJC_CLASS___TVHPhotosPlaylistsViewController);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController mediaLibrary](self, "mediaLibrary"));
      v12 = v11;
      objc_super v13 = v7;
      uint64_t v14 = 2LL;
      goto LABEL_7;
    case 3uLL:
      v15 = objc_alloc(&OBJC_CLASS___TVHPhotosPlaylistsViewController);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController mediaLibrary](self, "mediaLibrary"));
      v12 = v15;
      objc_super v13 = v7;
      uint64_t v14 = 0LL;
LABEL_7:
      v10 = -[TVHPhotosPlaylistsViewController initWithMediaLibrary:displayType:]( v12,  "initWithMediaLibrary:displayType:",  v13,  v14);
LABEL_10:

      if (v10)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainListViewController navigationController](self, "navigationController"));
        [v18 pushViewController:v10 animated:1];
      }

      break;
    default:
      break;
  }
}

- (id)mediaEntitiesListViewController:(id)a3 previewFetchIdentifierForIndexPath:(id)a4
{
  return @"PhotosPreviewFetch";
}

- (id)mediaEntitiesListViewController:(id)a3 previewFetchDescriptorForIdentifier:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVHKMediaEntitiesFetchRequest tvh_imageParadeFetchRequestWithMediaCategoryType:]( &OBJC_CLASS___TVHKMediaEntitiesFetchRequest,  "tvh_imageParadeFetchRequestWithMediaCategoryType:",  9LL,  a4));
  [v5 setIdentifier:@"PhotosPreviewFetch"];
  v6 = objc_alloc(&OBJC_CLASS___TVHMediaEntityPreviewFetchDescriptor);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesListViewController mediaLibrary](self, "mediaLibrary"));
  uint64_t v8 = -[TVHMediaEntityPreviewFetchDescriptor initWithIdentifier:mediaLibrary:fetchRequest:]( v6,  "initWithIdentifier:mediaLibrary:fetchRequest:",  @"PhotosPreviewFetch",  v7,  v5);

  v9 = (objc_class *)objc_opt_class(self);
  v10 = NSStringFromClass(v9);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[TVHMediaEntityPreviewFetchDescriptor setLogName:](v8, "setLogName:", v11);

  return v8;
}

- (void)_configureCell:(id)a3 withIdentifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPhotosMainListViewController dataSource](self, "dataSource"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 photoMainItemForIdentifier:v6]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v11 titleLabel]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);
  [v9 setText:v10];
}

- (TVHPhotosMainListViewDataSource)dataSource
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