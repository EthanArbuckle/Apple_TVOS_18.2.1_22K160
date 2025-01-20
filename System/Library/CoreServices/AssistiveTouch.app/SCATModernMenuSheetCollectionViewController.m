@interface SCATModernMenuSheetCollectionViewController
- (BOOL)_canShowWhileLocked;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)collectionViewCellClass;
- (NSMutableArray)sortedMenuItems;
- (NSString)description;
- (SCATModernMenuFooterView)footerView;
- (SCATModernMenuSheet)menuSheet;
- (SCATModernMenuSheetCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (UIImage)defaultBackgroundImage;
- (UIImage)dimmedBackgroundImage;
- (UIImage)pressedBackgroundImage;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 menuItemForItemAtIndex:(unint64_t)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)visibleItemOffset;
- (void)adjustVisibleItemOffsetForPageBoundary;
- (void)reloadCollectionView;
- (void)setCollectionViewCellClass:(Class)a3;
- (void)setDefaultBackgroundImage:(id)a3;
- (void)setDimmedBackgroundImage:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setMenuSheet:(id)a3;
- (void)setPressedBackgroundImage:(id)a3;
- (void)setSortedMenuItems:(id)a3;
- (void)setVisibleItemOffset:(unint64_t)a3;
- (void)showMoreItemsButtonWasActivated;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SCATModernMenuSheetCollectionViewController

- (SCATModernMenuSheetCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATModernMenuSheetCollectionViewController;
  v4 = -[SCATModernMenuSheetCollectionViewController initWithCollectionViewLayout:]( &v6,  "initWithCollectionViewLayout:",  a3);
  if (v4) {
    v4->_collectionViewCellClass = (Class)objc_opt_class(&OBJC_CLASS___SCATMenuItemCell, v3);
  }
  return v4;
}

- (NSString)description
{
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController menuSheet](self, "menuSheet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@<%p>. sheet:%@",  v5,  self,  v6));

  return (NSString *)v7;
}

- (void)showMoreItemsButtonWasActivated
{
  Class v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController collectionView](self, "collectionView"));
  id v14 = (id)objc_claimAutoreleasedReturnValue([v3 collectionViewLayout]);

  v4 = (char *)[v14 maxVisibleItems];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController menuSheet](self, "menuSheet"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 menuItems]);
  v7 = (char *)[v6 count];

  unint64_t v8 = -[SCATModernMenuSheetCollectionViewController visibleItemOffset](self, "visibleItemOffset");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController menuSheet](self, "menuSheet"));
  v10 = (char *)[v9 numberOfItemsInFirstPage];

  if (v10) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  v12 = &v4[v8];
  if (v11) {
    v12 = v10;
  }
  if (v12 >= v7) {
    v13 = 0LL;
  }
  else {
    v13 = v12;
  }
  -[SCATModernMenuSheetCollectionViewController setVisibleItemOffset:](self, "setVisibleItemOffset:", v13);
  -[SCATModernMenuSheetCollectionViewController reloadCollectionView](self, "reloadCollectionView");
}

- (void)adjustVisibleItemOffsetForPageBoundary
{
  Class v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController collectionView](self, "collectionView"));
  id v17 = (id)objc_claimAutoreleasedReturnValue([v3 collectionViewLayout]);

  v4 = (char *)[v17 maxVisibleItems];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController menuSheet](self, "menuSheet"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 menuItems]);
  v7 = (char *)[v6 count];

  unint64_t v8 = -[SCATModernMenuSheetCollectionViewController visibleItemOffset](self, "visibleItemOffset");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController menuSheet](self, "menuSheet"));
  v10 = (char *)[v9 numberOfItemsInFirstPage];

  BOOL v11 = 0LL;
  while (v11 < v7)
  {
    id v12 = v11;
    if (v10) {
      BOOL v13 = v11 == 0LL;
    }
    else {
      BOOL v13 = 0;
    }
    BOOL v11 = &v4[(void)v11];
    if (v13) {
      BOOL v11 = v10;
    }
    unsigned int v14 = v8 - (_DWORD)v12;
    unsigned int v15 = v8 - (_DWORD)v11;
    if (v14 < v15 || v11 >= v7) {
      goto LABEL_20;
    }
  }

  id v12 = (id)v8;
LABEL_20:
  -[SCATModernMenuSheetCollectionViewController setVisibleItemOffset:](self, "setVisibleItemOffset:", v12);
}

- (void)reloadCollectionView
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController collectionView](self, "collectionView"));
  [v2 reloadData];
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SCATModernMenuSheetCollectionViewController;
  -[SCATModernMenuSheetCollectionViewController viewDidLoad](&v18, "viewDidLoad");
  Class v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController collectionView](self, "collectionView"));
  [v4 setBackgroundColor:v3];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController collectionView](self, "collectionView"));
  [v5 setClipsToBounds:0];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend( v6,  "registerClass:forCellWithReuseIdentifier:",  -[SCATModernMenuSheetCollectionViewController collectionViewCellClass](self, "collectionViewCellClass"),  @"SCATMenuItemCellID");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"SCATIcon_border_selected"));
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "resizableImageWithCapInsets:resizingMode:",  1,  UIEdgeInsetsZero.top,  left,  bottom,  right));
  -[SCATModernMenuSheetCollectionViewController setPressedBackgroundImage:](self, "setPressedBackgroundImage:", v11);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"SCATIcon_border"));
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "resizableImageWithCapInsets:resizingMode:",  1,  UIEdgeInsetsZero.top,  left,  bottom,  right));
  -[SCATModernMenuSheetCollectionViewController setDefaultBackgroundImage:](self, "setDefaultBackgroundImage:", v13);

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController defaultBackgroundImage](self, "defaultBackgroundImage"));
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(+[SCATStyleProvider sharedStyleProvider](&OBJC_CLASS___SCATStyleProvider, "sharedStyleProvider"));
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 menuKnockoutColor]);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 imageWithTintColor:v16 renderingMode:1]);
  -[SCATModernMenuSheetCollectionViewController setDimmedBackgroundImage:](self, "setDimmedBackgroundImage:", v17);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SCATModernMenuSheetCollectionViewController;
  -[SCATModernMenuSheetCollectionViewController viewWillAppear:](&v22, "viewWillAppear:");
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController collectionView](self, "collectionView", 0LL));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 visibleCells]);

  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v19;
    do
    {
      BOOL v11 = 0LL;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v11);
        objc_opt_class(&OBJC_CLASS___SCATMenuItemCell, v8);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          id v14 = v12;
          unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 menuItem]);
          [v15 resetActivation];

          v16 = (void *)objc_claimAutoreleasedReturnValue([v14 menuItem]);
          [v16 updateItem];

          [v14 update];
        }

        BOOL v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v9);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController menuSheet](self, "menuSheet"));
  [v17 sheetWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATModernMenuSheetCollectionViewController;
  -[SCATModernMenuSheetCollectionViewController viewWillDisappear:](&v6, "viewWillDisappear:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController menuSheet](self, "menuSheet"));
  [v5 sheetWillDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SCATModernMenuSheetCollectionViewController;
  -[SCATModernMenuSheetCollectionViewController viewDidLayoutSubviews](&v7, "viewDidLayoutSubviews");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController menuSheet](self, "menuSheet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 menu]);
  [v4 reloadFromCurrentSheet];

  double y = CGPointZero.y;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "setContentOffset:", CGPointZero.x, y);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1LL;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController collectionView](self, "collectionView", a3, a4));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionViewLayout]);
  objc_super v7 = (char *)[v6 maxVisibleItems];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController menuSheet](self, "menuSheet"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 menuItems]);
  uint64_t v10 = (char *)[v9 count];

  unint64_t v11 = -[SCATModernMenuSheetCollectionViewController visibleItemOffset](self, "visibleItemOffset");
  unint64_t v12 = v11;
  if (&v10[-v11] < v7) {
    objc_super v7 = &v10[-v11];
  }
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController menuSheet](self, "menuSheet"));
  id v14 = [v13 numberOfItemsInFirstPage];

  if (v14) {
    BOOL v15 = v12 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15) {
    return (int64_t)v14;
  }
  else {
    return (int64_t)v7;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 dequeueReusableCellWithReuseIdentifier:@"SCATMenuItemCellID" forIndexPath:v6]);
  id v9 = [v6 item];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuSheetCollectionViewController collectionView:menuItemForItemAtIndex:]( self,  "collectionView:menuItemForItemAtIndex:",  v7,  v9));
  [v10 resetActivation];
  [v8 setMenuItem:v10];
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController pressedBackgroundImage](self, "pressedBackgroundImage"));
  [v8 setPressedBackgroundImage:v11];

  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController defaultBackgroundImage](self, "defaultBackgroundImage"));
  [v8 setDefaultBackgroundImage:v12];

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController dimmedBackgroundImage](self, "dimmedBackgroundImage"));
  [v8 setDimmedBackgroundImage:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 title]);
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v8 titleLabel]);
  [v15 setText:v14];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController menuSheet](self, "menuSheet"));
  objc_msgSend(v8, "setShouldIncludeTextLabels:", objc_msgSend(v16, "shouldIncludeTextLabels"));

  objc_msgSend(v8, "setShouldUseActivityIndicator:", objc_msgSend(v10, "shouldUseActivityIndicator"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 image]);

  if (v17)
  {
    uint64_t v18 = objc_claimAutoreleasedReturnValue([v10 image]);
  }

  else
  {
    id v19 = sub_100093E24(v10);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(v19);
  }

  __int128 v20 = (void *)v18;
  [v8 setIconImage:v18];

  [v10 updateItem];
  [v8 update];

  return v8;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[SCATModernMenuSheetCollectionViewController collectionView:menuItemForItemAtIndex:]( self,  "collectionView:menuItemForItemAtIndex:",  v7,  [a5 item]));

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 title]);
  +[SCATMenuItemCell cellSizeForTitle:](&OBJC_CLASS___SCATMenuItemCell, "cellSizeForTitle:", v9);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)collectionView:(id)a3 menuItemForItemAtIndex:(unint64_t)a4
{
  v5 = (char *)-[SCATModernMenuSheetCollectionViewController visibleItemOffset](self, "visibleItemOffset", a3) + a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController menuSheet](self, "menuSheet"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController collectionViewLayout](self, "collectionViewLayout"));
  objc_msgSend(v6, "sortMenuItemsForNumberOfItemsPerRow:", objc_msgSend(v7, "maxItemsPerRow"));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATModernMenuSheetCollectionViewController menuSheet](self, "menuSheet"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 menuItems]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v5]);

  return v10;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SCATModernMenuSheet)menuSheet
{
  return (SCATModernMenuSheet *)objc_loadWeakRetained((id *)&self->_menuSheet);
}

- (void)setMenuSheet:(id)a3
{
}

- (unint64_t)visibleItemOffset
{
  return self->_visibleItemOffset;
}

- (void)setVisibleItemOffset:(unint64_t)a3
{
  self->_visibleItemOffset = a3;
}

- (Class)collectionViewCellClass
{
  return self->_collectionViewCellClass;
}

- (void)setCollectionViewCellClass:(Class)a3
{
  self->_collectionViewCellClass = a3;
}

- (SCATModernMenuFooterView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (UIImage)defaultBackgroundImage
{
  return self->_defaultBackgroundImage;
}

- (void)setDefaultBackgroundImage:(id)a3
{
}

- (UIImage)pressedBackgroundImage
{
  return self->_pressedBackgroundImage;
}

- (void)setPressedBackgroundImage:(id)a3
{
}

- (UIImage)dimmedBackgroundImage
{
  return self->_dimmedBackgroundImage;
}

- (void)setDimmedBackgroundImage:(id)a3
{
}

- (NSMutableArray)sortedMenuItems
{
  return self->_sortedMenuItems;
}

- (void)setSortedMenuItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end