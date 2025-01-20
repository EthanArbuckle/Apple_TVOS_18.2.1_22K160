@interface TVHContextMenuButtonLockup
- (TVHContextMenuButtonLockup)initWithButtonLayout:(id)a3;
- (TVHContextMenuButtonLockupDataSource)dataSource;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)setDataSource:(id)a3;
@end

@implementation TVHContextMenuButtonLockup

- (TVHContextMenuButtonLockup)initWithButtonLayout:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHContextMenuButtonLockup;
  v3 = -[TVHButtonLockup initWithButtonLayout:](&v6, "initWithButtonLayout:", a3);
  v4 = v3;
  if (v3)
  {
    -[TVHContextMenuButtonLockup setContextMenuInteractionEnabled:](v3, "setContextMenuInteractionEnabled:", 1LL);
    -[TVHContextMenuButtonLockup setShowsMenuAsPrimaryAction:](v4, "setShowsMenuAsPrimaryAction:", 1LL);
  }

  return v4;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContextMenuButtonLockup dataSource](self, "dataSource", a3, a4.x, a4.y));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 contextMenuActionsForContextMenuButtonLockup:self]);
  if ([v6 count])
  {
    if ((objc_opt_respondsToSelector(v5, "contextMenuTitleForContextMenuButtonLockup:") & 1) != 0) {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 contextMenuTitleForContextMenuButtonLockup:self]);
    }
    else {
      v7 = 0LL;
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100037E0C;
    v11[3] = &unk_1000FD7C8;
    id v12 = v7;
    id v13 = v6;
    id v9 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:]( &OBJC_CLASS___UIContextMenuConfiguration,  "configurationWithIdentifier:previewProvider:actionProvider:",  0LL,  0LL,  v11));
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (TVHContextMenuButtonLockupDataSource)dataSource
{
  return (TVHContextMenuButtonLockupDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end