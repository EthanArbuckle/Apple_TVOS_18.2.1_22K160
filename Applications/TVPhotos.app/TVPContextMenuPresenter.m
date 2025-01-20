@interface TVPContextMenuPresenter
- (BOOL)isContextMenuPresented;
- (TVPContextMenuPresenter)initWithViewDelegate:(id)a3;
- (TVPContextMenuPresenterDelegate)delegate;
- (TVPContextMenuViewController)contextMenuViewController;
- (UIViewController)hostViewController;
- (void)_handleMenuPressed:(id)a3;
- (void)_handlePrimaryContextMenu:(id)a3;
- (void)_handleSecondaryContextMenu:(id)a3;
- (void)_presentContextMenuWithViewController:(id)a3;
- (void)setContextMenuViewController:(id)a3;
@end

@implementation TVPContextMenuPresenter

- (void)_handleMenuPressed:(id)a3
{
  if ([a3 state] == (id)3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuPresenter contextMenuViewController](self, "contextMenuViewController"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100036E0C;
    v5[3] = &unk_1000C9528;
    v5[4] = self;
    [v4 dismissContentAnimated:1 withCompletion:v5];
  }

- (void)_presentContextMenuWithViewController:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuPresenter hostViewController](self, "hostViewController"));
    v6 = -[TVPContextMenuViewController initWithViewController:presenter:]( objc_alloc(&OBJC_CLASS___TVPContextMenuViewController),  "initWithViewController:presenter:",  v4,  self);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 navigationController]);
    objc_msgSend(v7, "bs_addChildViewController:", v6);

    v8 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_handleMenuPressed:");
    -[UITapGestureRecognizer setAllowedPressTypes:](v8, "setAllowedPressTypes:", &off_1000D1C30);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuViewController view](v6, "view"));
    [v9 addGestureRecognizer:v8];

    -[TVPContextMenuPresenter setContextMenuViewController:](self, "setContextMenuViewController:", v6);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100037060;
    v14[3] = &unk_1000C9528;
    id v10 = v5;
    id v15 = v10;
    -[TVPContextMenuViewController presentContentAnimated:withCompletion:]( v6,  "presentContentAnimated:withCompletion:",  1LL,  v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuPresenter delegate](self, "delegate"));
    char v12 = objc_opt_respondsToSelector(v11, "contextMenuPresenterDidPresentContextMenu:");

    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuPresenter delegate](self, "delegate"));
      [v13 contextMenuPresenterDidPresentContextMenu:self];
    }
  }

- (void)_handlePrimaryContextMenu:(id)a3
{
  if ([a3 state] == (id)3
    && !-[TVPContextMenuPresenter isContextMenuPresented](self, "isContextMenuPresented"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuPresenter delegate](self, "delegate"));
    char v5 = objc_opt_respondsToSelector(v4, "primaryContextMenuViewController");

    if ((v5 & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuPresenter delegate](self, "delegate"));
      id v7 = (id)objc_claimAutoreleasedReturnValue([v6 primaryContextMenuViewController]);

      -[TVPContextMenuPresenter _presentContextMenuWithViewController:]( self,  "_presentContextMenuWithViewController:",  v7);
    }
  }

- (void)_handleSecondaryContextMenu:(id)a3
{
  if ([a3 state] == (id)3
    && !-[TVPContextMenuPresenter isContextMenuPresented](self, "isContextMenuPresented"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuPresenter delegate](self, "delegate"));
    char v5 = objc_opt_respondsToSelector(v4, "secondaryContextMenuViewController");

    if ((v5 & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuPresenter delegate](self, "delegate"));
      id v7 = (id)objc_claimAutoreleasedReturnValue([v6 secondaryContextMenuViewController]);

      -[TVPContextMenuPresenter _presentContextMenuWithViewController:]( self,  "_presentContextMenuWithViewController:",  v7);
    }
  }

- (TVPContextMenuPresenter)initWithViewDelegate:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___TVPContextMenuPresenter;
  v6 = -[TVPContextMenuPresenter init](&v19, "init");
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 hostViewController]);
    hostViewController = v7->_hostViewController;
    v7->_hostViewController = (UIViewController *)v8;

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAppSettings sharedInstance](&OBJC_CLASS___TVPAppSettings, "sharedInstance"));
    unsigned int v11 = [v10 enableInternalSettings];

    if (v11)
    {
      char v12 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  v7,  "_handlePrimaryContextMenu:");
      -[UITapGestureRecognizer setNumberOfTapsRequired:](v12, "setNumberOfTapsRequired:", 2LL);
      -[UITapGestureRecognizer setAllowedPressTypes:](v12, "setAllowedPressTypes:", &off_1000D1C48);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v7->_hostViewController, "view"));
      [v13 addGestureRecognizer:v12];
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TVPAppSettings sharedInstance](&OBJC_CLASS___TVPAppSettings, "sharedInstance"));
    unsigned int v15 = [v14 enableContentFiltering];

    if (v15)
    {
      v16 = -[UILongPressGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UILongPressGestureRecognizer),  "initWithTarget:action:",  v7,  "_handleSecondaryContextMenu:");
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v7->_hostViewController, "view"));
      [v17 addGestureRecognizer:v16];
    }
  }

  return v7;
}

- (BOOL)isContextMenuPresented
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPContextMenuPresenter contextMenuViewController](self, "contextMenuViewController"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (TVPContextMenuPresenterDelegate)delegate
{
  return self->_delegate;
}

- (UIViewController)hostViewController
{
  return self->_hostViewController;
}

- (TVPContextMenuViewController)contextMenuViewController
{
  return self->_contextMenuViewController;
}

- (void)setContextMenuViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end