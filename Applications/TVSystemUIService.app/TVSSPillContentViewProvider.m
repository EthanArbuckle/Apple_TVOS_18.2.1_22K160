@interface TVSSPillContentViewProvider
- (TVSPPillContentContaining)bannerContentView;
- (TVSPPillContentContaining)contentView;
- (TVSSMenuDataSourceContentView)menuDataSourceContentView;
- (TVSSMenuDataSourceControllerOverlord)dataSourceControllerOverlord;
- (TVSSPillContentViewProvider)initWithDataSourceControllerOverlord:(id)a3;
- (TVSSPillContentViewProviderDelegate)delegate;
- (unint64_t)mode;
- (void)_notifyContentViewConfigurationWillChangeWithConfiguration:(id)a3;
- (void)_notifyContentViewDidChange;
- (void)_updateContentViewWithAnimator:(id)a3;
- (void)dealloc;
- (void)menuDataSourceControllerDidChange:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMenuDataSourceContentView:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setMode:(unint64_t)a3 animator:(id)a4;
@end

@implementation TVSSPillContentViewProvider

- (TVSSPillContentViewProvider)initWithDataSourceControllerOverlord:(id)a3
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v22;
  v22 = 0LL;
  v20.receiver = v3;
  v20.super_class = (Class)&OBJC_CLASS___TVSSPillContentViewProvider;
  v22 = -[TVSSPillContentViewProvider init](&v20, "init");
  objc_storeStrong((id *)&v22, v22);
  if (v22)
  {
    objc_storeStrong((id *)&v22->_dataSourceControllerOverlord, location[0]);
    memset(__b, 0, sizeof(__b));
    obj = -[TVSSMenuDataSourceControllerOverlord controllers](v22->_dataSourceControllerOverlord, "controllers");
    id v17 = -[NSSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v23,  16LL);
    if (v17)
    {
      uint64_t v13 = *(void *)__b[2];
      uint64_t v14 = 0LL;
      id v15 = v17;
      while (1)
      {
        uint64_t v12 = v14;
        if (*(void *)__b[2] != v13) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(id *)(__b[1] + 8 * v14);
        [v19 addControllerObserver:v22];
        ++v14;
        if (v12 + 1 >= (unint64_t)v15)
        {
          uint64_t v14 = 0LL;
          id v15 = -[NSSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v23,  16LL);
          if (!v15) {
            break;
          }
        }
      }
    }

    v8 = objc_alloc(&OBJC_CLASS___TVSSMenuDataSourceContentView);
    id v9 =  +[TVSPMenuBarContentViewConfiguration standardConfiguration]( &OBJC_CLASS___TVSPMenuBarContentViewConfiguration,  "standardConfiguration");
    v4 = -[TVSSMenuDataSourceContentView initWithConfiguration:](v8, "initWithConfiguration:");
    menuDataSourceContentView = v22->_menuDataSourceContentView;
    v22->_menuDataSourceContentView = v4;

    v10 = v22;
    id v11 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
    -[TVSSPillContentViewProvider _updateContentViewWithAnimator:](v10, "_updateContentViewWithAnimator:");
  }

  v7 = v22;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v22, 0LL);
  return v7;
}

- (void)dealloc
{
  uint64_t v13 = self;
  SEL v12 = a2;
  memset(__b, 0, sizeof(__b));
  obj = -[TVSSMenuDataSourceControllerOverlord controllers](v13->_dataSourceControllerOverlord, "controllers");
  id v8 = -[NSSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v14,  16LL);
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0LL;
    id v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v5);
      objc_msgSend(v11, "removeControllerObserver:", v13, v6);
      ++v5;
      id v6 = (id)v2;
      if (v3 + 1 >= v2)
      {
        uint64_t v5 = 0LL;
        id v6 = -[NSSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v14,  16LL);
        if (!v6) {
          break;
        }
      }
    }
  }

  v9.receiver = v13;
  v9.super_class = (Class)&OBJC_CLASS___TVSSPillContentViewProvider;
  -[TVSSPillContentViewProvider dealloc](&v9, "dealloc");
}

- (void)setMode:(unint64_t)a3
{
  id v5 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
  -[TVSSPillContentViewProvider setMode:animator:](self, "setMode:animator:", a3);
}

- (void)setMode:(unint64_t)a3 animator:(id)a4
{
  v7 = self;
  SEL v6 = a2;
  unint64_t v5 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  if (v7->_mode != v5)
  {
    v7->_mode = v5;
    -[TVSSPillContentViewProvider _updateContentViewWithAnimator:](v7, "_updateContentViewWithAnimator:", location);
  }

  objc_storeStrong(&location, 0LL);
}

- (void)setContentView:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v4->_contentView != location[0])
  {
    objc_storeStrong((id *)&v4->_contentView, location[0]);
    -[TVSSPillContentViewProvider _notifyContentViewDidChange](v4, "_notifyContentViewDidChange");
  }

  objc_storeStrong(location, 0LL);
}

- (void)menuDataSourceControllerDidChange:(id)a3
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v19 = 0LL;
  id v18 = -[TVSSPillContentViewProvider delegate](v21, "delegate");
  if ((objc_opt_respondsToSelector(v18, "pillContentViewWantsUpdateContext") & 1) != 0)
  {
    id v3 = [v18 pillContentViewWantsUpdateContext];
    id v4 = v19;
    id v19 = v3;
  }

  char v15 = 0;
  char v13 = 0;
  if (v19)
  {
    id v16 = +[TVSPAnimator defaultAnimator](&OBJC_CLASS___TVSPAnimator, "defaultAnimator");
    char v15 = 1;
    id v5 = v16;
  }

  else
  {
    id v14 = +[TVSPAnimator immediateAnimator](&OBJC_CLASS___TVSPAnimator, "immediateAnimator");
    char v13 = 1;
    id v5 = v14;
  }

  id v17 = v5;
  if ((v13 & 1) != 0) {

  }
  if ((v15 & 1) != 0) {
  if ((objc_opt_respondsToSelector(v18, "pillContentViewProviderWillUpdateCurrentContentView:") & 1) != 0)
  }
    [v18 pillContentViewProviderWillUpdateCurrentContentView:v21];
  -[TVSSPillContentViewProvider _updateContentViewWithAnimator:](v21, "_updateContentViewWithAnimator:", v17);
  if ((objc_opt_respondsToSelector(v18, "pillContentViewProviderDidUpdateCurrentContentView:") & 1) != 0) {
    [v18 pillContentViewProviderDidUpdateCurrentContentView:v21];
  }
  id v6 = v17;
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_100107618;
  id v11 = &unk_1001B5A60;
  id v12 = v19;
  [v6 addAnimation:&v7];
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateContentViewWithAnimator:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = -[TVSSPillContentViewProvider dataSourceControllerOverlord](v14, "dataSourceControllerOverlord");
  objc_initWeak(&v11, v14);
  id v3 = location[0];
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_10010782C;
  int v8 = &unk_1001B9428;
  objc_copyWeak(&v10, &v11);
  id v9 = v12;
  [v3 addAnimation:&v4];
  objc_storeStrong(&v9, 0LL);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v11);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_notifyContentViewConfigurationWillChangeWithConfiguration:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSSPillContentViewProvider delegate](v5, "delegate");
  if ((objc_opt_respondsToSelector(v3, "pillContentViewConfigurationWillChange:") & 1) != 0) {
    [v3 pillContentViewConfigurationWillChange:location[0]];
  }
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_notifyContentViewDidChange
{
  id v3 = self;
  location[1] = (id)a2;
  location[0] = -[TVSSPillContentViewProvider delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(location[0], "pillContentViewProviderDidChangeContentView:") & 1) != 0) {
    [location[0] pillContentViewProviderDidChangeContentView:v3];
  }
  objc_storeStrong(location, 0LL);
}

- (TVSSMenuDataSourceControllerOverlord)dataSourceControllerOverlord
{
  return self->_dataSourceControllerOverlord;
}

- (TVSSPillContentViewProviderDelegate)delegate
{
  return (TVSSPillContentViewProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (TVSPPillContentContaining)contentView
{
  return self->_contentView;
}

- (TVSPPillContentContaining)bannerContentView
{
  return self->_bannerContentView;
}

- (TVSSMenuDataSourceContentView)menuDataSourceContentView
{
  return self->_menuDataSourceContentView;
}

- (void)setMenuDataSourceContentView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end