@interface TVHSortContextMenuButton
- (TVHSortContextMenuButton)initWithFrame:(CGRect)a3;
- (TVHSortContextMenuButtonDataSource)dataSource;
- (TVHSortContextMenuButtonDelegate)delegate;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TVHSortContextMenuButton

- (TVHSortContextMenuButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHSortContextMenuButton;
  v3 = -[TVHButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TVHSortContextMenuButton setContextMenuInteractionEnabled:](v3, "setContextMenuInteractionEnabled:", 1LL);
    -[TVHSortContextMenuButton setShowsMenuAsPrimaryAction:](v4, "setShowsMenuAsPrimaryAction:", 1LL);
  }

  return v4;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSortContextMenuButton dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sortOptionsForSortContextMenuButton:self]);
  if ([v7 count])
  {
    id v8 = [v6 currentSortOptionIndexForSortContextMenuButton:self];
    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    objc_initWeak(&location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000211D0;
    v20[3] = &unk_1000FD7A0;
    objc_copyWeak(v22, &location);
    v22[1] = v8;
    v10 = v9;
    v21 = v10;
    [v7 enumerateObjectsUsingBlock:v20];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:@"SORT_BY_TITLE" value:0 table:0]);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100021338;
    v17[3] = &unk_1000FD7C8;
    id v13 = v12;
    id v18 = v13;
    v14 = v10;
    v19 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:]( &OBJC_CLASS___UIContextMenuConfiguration,  "configurationWithIdentifier:previewProvider:actionProvider:",  0LL,  0LL,  v17));

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

- (TVHSortContextMenuButtonDataSource)dataSource
{
  return (TVHSortContextMenuButtonDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (TVHSortContextMenuButtonDelegate)delegate
{
  return (TVHSortContextMenuButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end