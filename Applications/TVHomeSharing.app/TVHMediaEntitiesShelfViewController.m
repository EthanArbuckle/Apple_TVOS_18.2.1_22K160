@interface TVHMediaEntitiesShelfViewController
+ (TVHMediaEntitiesShelfViewController)new;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4;
- (BOOL)showsVibrantHeaderTitle;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)lockupClass;
- (NSIndexPath)indexPathForPreferredFocusedMediaEntity;
- (TVHCollectionViewChangeSetDataSource)changeSetDataSource;
- (TVHMediaEntitiesDataSource)dataSource;
- (TVHMediaEntitiesShelfViewController)init;
- (TVHMediaEntitiesShelfViewController)initWithCoder:(id)a3;
- (TVHMediaEntitiesShelfViewController)initWithDataSource:(id)a3 layout:(id)a4;
- (TVHMediaEntitiesShelfViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVHMediaEntitiesShelfViewControllerDelegate)delegate;
- (TVHMediaEntitiesShelfViewLayout)mediaEntitiesShelfViewLayout;
- (UILabel)titleLabel;
- (id)_delegateTitle;
- (id)_lockupLayoutForMediaEntity:(id)a3;
- (id)_title;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (void)_configureCell:(id)a3 atIndexPath:(id)a4;
- (void)_delegateConfigureLockup:(id)a3 forMediaEntity:(id)a4;
- (void)_delegateDidFocusMediaEntity:(id)a3;
- (void)_delegateDidLongPressMediaEntity:(id)a3;
- (void)_delegateDidPlayMediaEntity:(id)a3;
- (void)_delegateDidSelectMediaEntity:(id)a3;
- (void)_updateTitleLabelIfNeeded;
- (void)collectionView:(id)a3 didLongPressItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didPlayItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)setChangeSetDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIndexPathForPreferredFocusedMediaEntity:(id)a3;
- (void)setLockupClass:(Class)a3;
- (void)setShowsVibrantHeaderTitle:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVHMediaEntitiesShelfViewController

+ (TVHMediaEntitiesShelfViewController)new
{
  return 0LL;
}

- (TVHMediaEntitiesShelfViewController)init
{
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v4);

  return 0LL;
}

- (TVHMediaEntitiesShelfViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v6);

  return 0LL;
}

- (TVHMediaEntitiesShelfViewController)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHMediaEntitiesShelfViewController)initWithDataSource:(id)a3 layout:(id)a4
{
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesShelfViewController;
  v8 = -[TVHShelfViewController initWithLayout:](&v18, "initWithLayout:", a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dataSource, a3);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___TVHPosterLockup);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    Class lockupClass = v9->_lockupClass;
    v9->_Class lockupClass = (Class)v11;

    v13 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = v13;

    v15 = v9->_titleLabel;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvh_fontFromTextStyle:fontWeight:]( &OBJC_CLASS___UIFont,  "tvh_fontFromTextStyle:fontWeight:",  8LL,  7LL));
    -[UILabel setFont:](v15, "setFont:", v16);

    -[UILabel setNumberOfLines:](v9->_titleLabel, "setNumberOfLines:", 1LL);
    -[UILabel setLineBreakMode:](v9->_titleLabel, "setLineBreakMode:", 4LL);
    -[UILabel setTextAlignment:](v9->_titleLabel, "setTextAlignment:", 4LL);
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector( v5,  "titleForMediaEntitiesShelfViewController:") & 1;
  if ((objc_opt_respondsToSelector(v5, "mediaEntitiesShelfViewController:configureLockup:forMediaEntity:") & 1) != 0) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
  if ((objc_opt_respondsToSelector(v5, "mediaEntitiesShelfViewController:didFocusMediaEntity:") & 1) != 0) {
    char v7 = 4;
  }
  else {
    char v7 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v7;
  if ((objc_opt_respondsToSelector(v5, "mediaEntitiesShelfViewController:didSelectMediaEntity:") & 1) != 0) {
    char v8 = 8;
  }
  else {
    char v8 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xF7 | v8;
  if ((objc_opt_respondsToSelector(v5, "mediaEntitiesShelfViewController:didLongPressMediaEntity:") & 1) != 0) {
    char v9 = 16;
  }
  else {
    char v9 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xEF | v9;
  char v10 = objc_opt_respondsToSelector(v5, "mediaEntitiesShelfViewController:didPlayMediaEntity:");

  if ((v10 & 1) != 0) {
    char v11 = 32;
  }
  else {
    char v11 = 0;
  }
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xDF | v11;
}

- (TVHMediaEntitiesShelfViewLayout)mediaEntitiesShelfViewLayout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController collectionView](self, "collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 collectionViewLayout]);

  return (TVHMediaEntitiesShelfViewLayout *)v3;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesShelfViewController;
  -[TVHShelfViewController viewDidLoad](&v19, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController collectionView](self, "collectionView"));
  [v3 registerClass:objc_opt_class(TVHLockupContainingCollectionViewCell) forCellWithReuseIdentifier:@"CellIdentifier"];
  [v3 setClipsToBounds:0];
  objc_initWeak(&location, self);
  v4 = objc_alloc(&OBJC_CLASS___TVHCollectionViewChangeSetDataSource);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController dataSource](self, "dataSource"));
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_10006DA64;
  v16 = &unk_1000FD750;
  objc_copyWeak(&v17, &location);
  char v6 = -[TVHCollectionViewChangeSetDataSource initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:]( v4,  "initWithCollectionView:contentProvider:cellReuseIdentifierProvider:cellConfigurator:",  v3,  v5,  &stru_1000FEE18,  &v13);

  -[TVHMediaEntitiesShelfViewController setChangeSetDataSource:]( self,  "setChangeSetDataSource:",  v6,  v13,  v14,  v15,  v16);
  char v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController titleLabel](self, "titleLabel"));
  if (-[TVHMediaEntitiesShelfViewController showsVibrantHeaderTitle](self, "showsVibrantHeaderTitle"))
  {
    [v7 setOpaque:0];
    [v7 setBackgroundColor:0];
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[TVHVibrantLabelView vibrantLabelViewWithLabel:]( &OBJC_CLASS___TVHVibrantLabelView,  "vibrantLabelViewWithLabel:",  v7));
  }

  else
  {
    char v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    char v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    char v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v9,  v10));
    [v7 setTextColor:v11];

    id v8 = v7;
  }

  v12 = v8;
  -[TVHMediaEntitiesShelfViewController _updateTitleLabelIfNeeded](self, "_updateTitleLabelIfNeeded");
  -[TVHShelfViewController setHeaderView:](self, "setHeaderView:", v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  char v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController dataSource](self, "dataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntityAtIndexPath:v6]);

  char v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesShelfViewController _lockupLayoutForMediaEntity:]( self,  "_lockupLayoutForMediaEntity:",  v8));
  char v10 = v9;
  if (v9)
  {
    [v9 lockupSize];
    double v12 = v11;
    double v14 = v13;
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesShelfViewController mediaEntitiesShelfViewLayout]( self,  "mediaEntitiesShelfViewLayout"));
    [v15 itemSize];
    double v12 = v16;
    double v14 = v17;
  }

  double v18 = v12;
  double v19 = v14;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController dataSource](self, "dataSource"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 mediaEntityAtIndexPath:v5]);

  char v7 = v8;
  if (v8)
  {
    -[TVHMediaEntitiesShelfViewController _delegateDidSelectMediaEntity:](self, "_delegateDidSelectMediaEntity:", v8);
    char v7 = v8;
  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesShelfViewController indexPathForPreferredFocusedMediaEntity]( self,  "indexPathForPreferredFocusedMediaEntity",  a3));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController dataSource](self, "dataSource"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mediaEntityAtIndexPath:v4]);

    if (!v6)
    {

      v4 = 0LL;
    }
  }

  return v4;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVHMediaEntitiesShelfViewController;
  id v8 = a4;
  -[TVHShelfViewController collectionView:didUpdateFocusInContext:withAnimationCoordinator:]( &v12,  "collectionView:didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v8,  a5);
  char v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextFocusedIndexPath", v12.receiver, v12.super_class));

  if (v9)
  {
    char v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController dataSource](self, "dataSource"));
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 mediaEntityAtIndexPath:v9]);

    if (v11) {
      -[TVHMediaEntitiesShelfViewController _delegateDidFocusMediaEntity:](self, "_delegateDidFocusMediaEntity:", v11);
    }
  }
}

- (void)collectionView:(id)a3 didPlayItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController dataSource](self, "dataSource"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 mediaEntityAtIndexPath:v5]);

  char v7 = v8;
  if (v8)
  {
    -[TVHMediaEntitiesShelfViewController _delegateDidPlayMediaEntity:](self, "_delegateDidPlayMediaEntity:", v8);
    char v7 = v8;
  }
}

- (BOOL)collectionView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4
{
  return (*(_BYTE *)&self->_delegateFlags >> 4) & 1;
}

- (void)collectionView:(id)a3 didLongPressItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController dataSource](self, "dataSource"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v6 mediaEntityAtIndexPath:v5]);

  char v7 = v8;
  if (v8)
  {
    -[TVHMediaEntitiesShelfViewController _delegateDidLongPressMediaEntity:]( self,  "_delegateDidLongPressMediaEntity:",  v8);
    char v7 = v8;
  }
}

- (id)_delegateTitle
{
  if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController delegate](self, "delegate"));
    v2 = (void *)objc_claimAutoreleasedReturnValue([v4 titleForMediaEntitiesShelfViewController:self]);
  }

  else
  {
    v2 = 0LL;
  }

  return v2;
}

- (void)_delegateConfigureLockup:(id)a3 forMediaEntity:(id)a4
{
  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController delegate](self, "delegate"));
    [v8 mediaEntitiesShelfViewController:self configureLockup:v7 forMediaEntity:v6];
  }

- (void)_delegateDidFocusMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController delegate](self, "delegate"));
    [v5 mediaEntitiesShelfViewController:self didFocusMediaEntity:v4];
  }

- (void)_delegateDidSelectMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController delegate](self, "delegate"));
    [v5 mediaEntitiesShelfViewController:self didSelectMediaEntity:v4];
  }

- (void)_delegateDidLongPressMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 0x10) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController delegate](self, "delegate"));
    [v5 mediaEntitiesShelfViewController:self didLongPressMediaEntity:v4];
  }

- (void)_delegateDidPlayMediaEntity:(id)a3
{
  if ((*(_BYTE *)&self->_delegateFlags & 0x20) != 0)
  {
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController delegate](self, "delegate"));
    [v5 mediaEntitiesShelfViewController:self didPlayMediaEntity:v4];
  }

- (void)_configureCell:(id)a3 atIndexPath:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController dataSource](self, "dataSource"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaEntityAtIndexPath:v6]);

  if (v8)
  {
    id v9 = v15;
    char v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lockup]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesShelfViewController _lockupLayoutForMediaEntity:]( self,  "_lockupLayoutForMediaEntity:",  v8));
    if (!v10
      || (objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v10 layout]),
          unsigned __int8 v13 = [v12 isEqual:v11],
          v12,
          (v13 & 1) == 0))
    {
      id v14 = objc_msgSend( objc_alloc(-[TVHMediaEntitiesShelfViewController lockupClass](self, "lockupClass")),  "initWithSimpleLayout:",  v11);

      [v9 setLockup:v14];
      char v10 = v14;
    }

    -[TVHMediaEntitiesShelfViewController _delegateConfigureLockup:forMediaEntity:]( self,  "_delegateConfigureLockup:forMediaEntity:",  v10,  v8);
  }
}

- (void)_updateTitleLabelIfNeeded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController titleLabel](self, "titleLabel"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 text]);

  if (!v4)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController _title](self, "_title"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController titleLabel](self, "titleLabel"));
    [v5 setText:v6];
  }

- (id)_title
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController _delegateTitle](self, "_delegateTitle"));
  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaEntitiesShelfViewController dataSource](self, "dataSource"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 itemCollectionDescriptors]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);
    v3 = (void *)objc_claimAutoreleasedReturnValue([v6 title]);
  }

  return v3;
}

- (id)_lockupLayoutForMediaEntity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVHMediaEntitiesShelfViewController mediaEntitiesShelfViewLayout]( self,  "mediaEntitiesShelfViewLayout"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lockupLayoutByMediaEntityType]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 type]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v7]);
  if (!v8) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 lockupLayout]);
  }

  return v8;
}

- (TVHMediaEntitiesDataSource)dataSource
{
  return self->_dataSource;
}

- (TVHMediaEntitiesShelfViewControllerDelegate)delegate
{
  return (TVHMediaEntitiesShelfViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (BOOL)showsVibrantHeaderTitle
{
  return self->_showsVibrantHeaderTitle;
}

- (void)setShowsVibrantHeaderTitle:(BOOL)a3
{
  self->_showsVibrantHeaderTitle = a3;
}

- (Class)lockupClass
{
  return self->_lockupClass;
}

- (void)setLockupClass:(Class)a3
{
}

- (NSIndexPath)indexPathForPreferredFocusedMediaEntity
{
  return self->_indexPathForPreferredFocusedMediaEntity;
}

- (void)setIndexPathForPreferredFocusedMediaEntity:(id)a3
{
}

- (TVHCollectionViewChangeSetDataSource)changeSetDataSource
{
  return self->_changeSetDataSource;
}

- (void)setChangeSetDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end