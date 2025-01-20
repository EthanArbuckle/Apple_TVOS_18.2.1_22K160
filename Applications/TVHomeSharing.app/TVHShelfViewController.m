@interface TVHShelfViewController
- (TVHCollectionView)collectionView;
- (TVHShelfView)shelfView;
- (TVHShelfViewController)initWithLayout:(id)a3;
- (TVHShelfViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIView)headerView;
- (id)preferredFocusEnvironments;
- (unint64_t)speedBumpEdges;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)loadView;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setShelfView:(id)a3;
- (void)setSpeedBumpEdges:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation TVHShelfViewController

- (TVHShelfViewController)initWithLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHShelfViewController;
  v5 = -[TVHShelfViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0LL, 0LL);
  v6 = v5;
  if (v5) {
    sub_10004CEC4(v5, v4);
  }

  return v6;
}

- (TVHShelfViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHShelfViewController;
  id v4 = -[TVHShelfViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___TVHShelfViewLayout);
    sub_10004CEC4(v4, v5);
  }

  return v4;
}

- (TVHCollectionView)collectionView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController shelfView](self, "shelfView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 collectionView]);

  return (TVHCollectionView *)v3;
}

- (UIView)headerView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController shelfView](self, "shelfView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 headerView]);

  return (UIView *)v3;
}

- (void)setHeaderView:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController shelfView](self, "shelfView"));
  [v5 setHeaderView:v4];
}

- (void)setSpeedBumpEdges:(unint64_t)a3
{
  self->_speedBumpEdges = a3;
  if (-[TVHShelfViewController isViewLoaded](self, "isViewLoaded"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController view](self, "view"));
    [v4 _setSpeedBumpEdges:self->_speedBumpEdges];

    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController shelfView](self, "shelfView", 0LL));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 collectionView]);
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v6 visibleCells]);

    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) _setSpeedBumpEdges:self->_speedBumpEdges];
          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }

      while (v9);
    }
  }

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController shelfView](self, "shelfView"));
  id v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

- (void)loadView
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController shelfView](self, "shelfView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v4 collectionView]);
  [v3 setDelegate:self];
  -[TVHShelfViewController setView:](self, "setView:", v4);
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVHShelfViewController;
  -[TVHShelfViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController view](self, "view"));
  objc_msgSend(v3, "_setSpeedBumpEdges:", -[TVHShelfViewController speedBumpEdges](self, "speedBumpEdges"));
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a4;
  objc_msgSend(v6, "_setSpeedBumpEdges:", -[TVHShelfViewController speedBumpEdges](self, "speedBumpEdges"));
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v6 = a5;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController shelfView](self, "shelfView"));
  [v7 updateHeaderViewFrameWithAnimationCoordinator:v6];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHShelfViewController shelfView](self, "shelfView", a3));
  [v3 updateHeaderViewFrameWithAnimationCoordinator:0];
}

- (unint64_t)speedBumpEdges
{
  return self->_speedBumpEdges;
}

- (TVHShelfView)shelfView
{
  return self->_shelfView;
}

- (void)setShelfView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end