@interface TVHMediaLibraryPickerViewController
+ (id)_sortedMediaLibraries:(id)a3;
- (NSArray)mediaLibraries;
- (TVHMediaLibraryPickerViewController)initWithItemSize:(CGSize)a3;
- (TVHMediaLibraryPickerViewController)initWithListViewLayout:(id)a3;
- (TVHMediaLibraryPickerViewController)initWithMediaLibraries:(id)a3;
- (TVHMediaLibraryPickerViewControllerDelegate)mediaLibraryPickerDelegate;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UIImageView)imageView;
- (id)_cellForCollectionView:(id)a3 withIdentifier:(id)a4 atIndexPath:(id)a5;
- (id)_mediaLibraryForIndexPath:(id)a3;
- (void)_mediaLibrariesDidChange:(BOOL)a3;
- (void)_updateImageTintColor;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setDiffableDataSource:(id)a3;
- (void)setImageView:(id)a3;
- (void)setMediaLibraries:(id)a3;
- (void)setMediaLibraryPickerDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithMediaLibraries:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVHMediaLibraryPickerViewController

- (TVHMediaLibraryPickerViewController)initWithListViewLayout:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMediaLibraryPickerViewController)initWithItemSize:(CGSize)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMediaLibraryPickerViewController)initWithMediaLibraries:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVHMediaLibraryPickerViewController;
  v5 = -[TVHPreviewingListViewController initWithItemSize:](&v24, "initWithItemSize:", 894.0, 70.0);
  v6 = v5;
  if (v5)
  {
    id v7 = [(id)objc_opt_class(v5) _sortedMediaLibraries:v4];
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    mediaLibraries = v6->_mediaLibraries;
    v6->_mediaLibraries = (NSArray *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:weight:scale:",  4LL,  3LL,  420.0));
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"music.note.house.fill",  v10));
    v12 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v11);
    imageView = v6->_imageView;
    v6->_imageView = v12;

    -[TVHMediaLibraryPickerViewController _updateImageTintColor](v6, "_updateImageTintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v14 bounds];
    double v16 = v15;
    -[UIImageView frame](v6->_imageView, "frame");
    double v18 = v16 - v17 + -136.0;

    -[TVHPreviewingListViewController setPreviewViewMargin:](v6, "setPreviewViewMargin:", 136.0, 0.0, v18, 0.0);
    -[TVHPreviewingListViewController setPreviewView:](v6, "setPreviewView:", v6->_imageView);
    -[TVHPreviewingListViewController setListViewMargin:](v6, "setListViewMargin:", 0.0, 0.0, 0.0, 90.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"MEDIA_SERVER_PICKER_TITLE" value:0 table:0]);

    v21 = -[TVHSimpleHeaderView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVHSimpleHeaderView),  "initWithFrame:",  0.0,  0.0,  0.0,  168.0);
    -[TVHSimpleHeaderView setCentersLabel:](v21, "setCentersLabel:", 1LL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleHeaderView label](v21, "label"));
    [v22 setText:v20];

    -[TVHPreviewingListViewController setListHeaderView:](v6, "setListHeaderView:", v21);
  }

  return v6;
}

- (void)updateWithMediaLibraries:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class(self) _sortedMediaLibraries:v4];
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue(v5);

  mediaLibraries = self->_mediaLibraries;
  self->_mediaLibraries = v6;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVHMediaLibraryPickerViewController;
  -[TVHMediaLibraryPickerViewController viewDidLoad](&v12, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHPreviewingListViewController listView](self, "listView"));
  [v3 registerClass:objc_opt_class(TVHSimpleListViewCell) forCellWithReuseIdentifier:@"TVHMediaLibraryCellIdentifier"];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(&OBJC_CLASS___UICollectionViewDiffableDataSource);
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  uint64_t v8 = sub_100045288;
  v9 = &unk_1000FD018;
  objc_copyWeak(&v10, &location);
  id v5 = -[UICollectionViewDiffableDataSource initWithCollectionView:cellProvider:]( v4,  "initWithCollectionView:cellProvider:",  v3,  &v6);
  -[TVHMediaLibraryPickerViewController setDiffableDataSource:](self, "setDiffableDataSource:", v5, v6, v7, v8, v9);
  -[TVHMediaLibraryPickerViewController _mediaLibrariesDidChange:](self, "_mediaLibrariesDidChange:", 0LL);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryPickerViewController traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];

  id v7 = [v4 userInterfaceStyle];
  if (v7 != v6) {
    -[TVHMediaLibraryPickerViewController _updateImageTintColor](self, "_updateImageTintColor");
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaLibraryPickerViewController _mediaLibraryForIndexPath:]( self,  "_mediaLibraryForIndexPath:",  a4));
  if (v5)
  {
    id v6 = sub_10007A1C8();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 succinctDescription]);
      *(_DWORD *)buf = 141558274;
      uint64_t v18 = 1752392040LL;
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "User has selected media library: %{mask.hash}@",  buf,  0x16u);
    }

    if ([v5 isConnectable])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaLibraryPickerViewController mediaLibraryPickerDelegate]( self,  "mediaLibraryPickerDelegate"));
      [v9 mediaLibraryPickerViewController:self didPickMediaLibrary:v5];
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"UNSUPPORTED_ITUNES_VERSION_MESSAGE_FORMAT" value:0 table:0]);

      v11 = (void *)objc_claimAutoreleasedReturnValue([v5 title]);
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v11));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedStringForKey:@"OK_BUTTON_TITLE" value:0 table:0]);

      double v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v12,  1LL));
      double v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v14,  1LL,  0LL));
      [v15 addAction:v16];
      -[TVHMediaLibraryPickerViewController presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v15,  1LL,  0LL);
    }
  }
}

- (void)_mediaLibrariesDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSDiffableDataSourceSnapshot);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryPickerViewController mediaLibraries](self, "mediaLibraries"));
  id v10 = @"MediaLibraries";
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](v5, "appendSectionsWithIdentifiers:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bs_map:", &stru_1000FDFC0));
  -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:]( v5,  "appendItemsWithIdentifiers:intoSectionWithIdentifier:",  v8,  @"MediaLibraries");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryPickerViewController diffableDataSource](self, "diffableDataSource"));
  [v9 applySnapshot:v5 animatingDifferences:v3];
}

- (id)_cellForCollectionView:(id)a3 withIdentifier:(id)a4 atIndexPath:(id)a5
{
  id v7 = a5;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [a3 dequeueReusableCellWithReuseIdentifier:@"TVHMediaLibraryCellIdentifier" forIndexPath:v7]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaLibraryPickerViewController _mediaLibraryForIndexPath:]( self,  "_mediaLibraryForIndexPath:",  v7));

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 titleLabel]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 title]);
  [v10 setText:v11];

  return v8;
}

- (id)_mediaLibraryForIndexPath:(id)a3
{
  id v4 = [a3 row];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryPickerViewController mediaLibraries](self, "mediaLibraries"));
  if (v4 >= [v5 count]) {
    id v6 = 0LL;
  }
  else {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:v4]);
  }

  return v6;
}

- (void)_updateImageTintColor
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryPickerViewController traitCollection](self, "traitCollection"));
  id v4 = [v3 userInterfaceStyle];

  if ((unint64_t)v4 < 2)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
LABEL_6:
    id v7 = (id)v5;
    goto LABEL_7;
  }

  if (v4 == (id)2)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    goto LABEL_6;
  }

  id v7 = 0LL;
LABEL_7:
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaLibraryPickerViewController imageView](self, "imageView"));
  [v6 setTintColor:v7];
}

+ (id)_sortedMediaLibraries:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([a3 allObjects]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingComparator:&stru_1000FE000]);

  return v4;
}

- (TVHMediaLibraryPickerViewControllerDelegate)mediaLibraryPickerDelegate
{
  return (TVHMediaLibraryPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_mediaLibraryPickerDelegate);
}

- (void)setMediaLibraryPickerDelegate:(id)a3
{
}

- (NSArray)mediaLibraries
{
  return self->_mediaLibraries;
}

- (void)setMediaLibraries:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
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