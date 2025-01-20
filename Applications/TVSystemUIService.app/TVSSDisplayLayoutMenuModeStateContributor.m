@interface TVSSDisplayLayoutMenuModeStateContributor
- (BOOL)pipActive;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (PBSDisplayLayoutElement)focusedApp;
- (PBSDisplayLayoutElement)keyboardFocusedElement;
- (TVSSDisplayLayoutMenuModeStateContributor)init;
- (TVSSMenuModeStateContributingDelegate)contributorDelegate;
- (void)_notifyStateContributorHasUpdate;
- (void)_queue_determineFocusedAppFromLayout:(id)a3;
- (void)dealloc;
- (void)setContributorDelegate:(id)a3;
- (void)setFocusedApp:(id)a3;
- (void)setKeyboardFocusedElement:(id)a3;
- (void)setLayoutMonitor:(id)a3;
- (void)setPipActive:(BOOL)a3;
- (void)updateMenuModeState:(id)a3;
@end

@implementation TVSSDisplayLayoutMenuModeStateContributor

- (TVSSDisplayLayoutMenuModeStateContributor)init
{
  SEL v16 = a2;
  v17 = 0LL;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVSSDisplayLayoutMenuModeStateContributor;
  v17 = -[TVSSDisplayLayoutMenuModeStateContributor init](&v15, "init");
  objc_storeStrong((id *)&v17, v17);
  if (v17)
  {
    objc_initWeak(&from, v17);
    id v13 =  +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor]( &OBJC_CLASS___FBSDisplayLayoutMonitorConfiguration,  "configurationForDefaultMainDisplayMonitor");
    [v13 setNeedsUserInteractivePriority:1];
    id v6 = v13;
    v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    v10 = sub_1000BCC8C;
    v11 = &unk_1001B9EB0;
    objc_copyWeak(&v12, &from);
    [v6 setTransitionHandler:&v7];
    v2 =  +[FBSDisplayLayoutMonitor monitorWithConfiguration:]( &OBJC_CLASS___FBSDisplayLayoutMonitor,  "monitorWithConfiguration:",  v13);
    layoutMonitor = v17->_layoutMonitor;
    v17->_layoutMonitor = v2;

    objc_destroyWeak(&v12);
    objc_storeStrong(&v13, 0LL);
    objc_destroyWeak(&from);
  }

  v5 = v17;
  objc_storeStrong((id *)&v17, 0LL);
  return v5;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[FBSDisplayLayoutMonitor invalidate](self->_layoutMonitor, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSDisplayLayoutMenuModeStateContributor;
  -[TVSSDisplayLayoutMenuModeStateContributor dealloc](&v2, "dealloc");
}

- (void)updateMenuModeState:(id)a3
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  v4 = -[TVSSDisplayLayoutMenuModeStateContributor focusedApp](v8, "focusedApp");
  objc_msgSend(v3, "setFocusedApp:");

  id v5 = location[0];
  id v6 = -[TVSSDisplayLayoutMenuModeStateContributor keyboardFocusedElement](v8, "keyboardFocusedElement");
  objc_msgSend(v5, "setKeyboardFocusedElement:");

  objc_msgSend(location[0], "setPipActive:", -[TVSSDisplayLayoutMenuModeStateContributor pipActive](v8, "pipActive"));
  objc_storeStrong(location, 0LL);
}

- (void)setFocusedApp:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BSDispatchQueueAssertMain();
  if ((BSEqualObjects(v4->_focusedApp, location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_focusedApp, location[0]);
    -[TVSSDisplayLayoutMenuModeStateContributor _notifyStateContributorHasUpdate]( v4,  "_notifyStateContributorHasUpdate");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setKeyboardFocusedElement:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BSDispatchQueueAssertMain();
  if ((BSEqualObjects(v4->_keyboardFocusedElement, location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_keyboardFocusedElement, location[0]);
    -[TVSSDisplayLayoutMenuModeStateContributor _notifyStateContributorHasUpdate]( v4,  "_notifyStateContributorHasUpdate");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setPipActive:(BOOL)a3
{
  BOOL v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_pipActive != v3)
  {
    self->_pipActive = v3;
    -[TVSSDisplayLayoutMenuModeStateContributor _notifyStateContributorHasUpdate]( self,  "_notifyStateContributorHasUpdate");
  }

- (void)_notifyStateContributorHasUpdate
{
  objc_super v2 = -[TVSSDisplayLayoutMenuModeStateContributor contributorDelegate](self, "contributorDelegate");
  -[TVSSMenuModeStateContributingDelegate stateContributorHasUpdate:](v2, "stateContributorHasUpdate:", self);
}

- (void)_queue_determineFocusedAppFromLayout:(id)a3
{
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v29 = 0LL;
  id v28 = 0LL;
  id v27 = 0LL;
  char v26 = 0;
  id v25 = [location[0] elements];
  memset(__b, 0, sizeof(__b));
  id obj = v25;
  id v13 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0LL;
    id v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v24 = *(id *)(__b[1] + 8 * v10);
      if (([v24 isUIApplicationElement] & 1) != 0
        && (double)(uint64_t)[v24 level] == 1.0)
      {
        objc_storeStrong(&v28, v24);
      }

      id v6 = [v24 identifier];
      unsigned __int8 v7 = [v6 isEqualToString:PBSDisplayLayoutElementPictureInPictureIdentifier];

      if ((v7 & 1) != 0)
      {
        char v26 = 1;
      }

      else
      {
        id v4 = [v24 identifier];
        unsigned __int8 v5 = [v4 isEqualToString:PBSDisplayLayoutElementAirPlayIdentifier];

        if ((v5 & 1) != 0) {
          objc_storeStrong(&v29, v24);
        }
      }

      ++v10;
      if (v8 + 1 >= (unint64_t)v11)
      {
        uint64_t v10 = 0LL;
        id v11 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  if (v29) {
    objc_storeStrong(&v28, v29);
  }
  queue = &_dispatch_main_q;
  v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  v17 = sub_1000BD45C;
  v18 = &unk_1001B9ED8;
  v19 = v31;
  id v20 = v28;
  id v21 = v27;
  char v22 = v26 & 1;
  dispatch_async(queue, &v14);

  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong((id *)&v19, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSSMenuModeStateContributingDelegate)contributorDelegate
{
  return (TVSSMenuModeStateContributingDelegate *)objc_loadWeakRetained((id *)&self->contributorDelegate);
}

- (void)setContributorDelegate:(id)a3
{
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)setLayoutMonitor:(id)a3
{
}

- (PBSDisplayLayoutElement)focusedApp
{
  return self->_focusedApp;
}

- (PBSDisplayLayoutElement)keyboardFocusedElement
{
  return self->_keyboardFocusedElement;
}

- (BOOL)pipActive
{
  return self->_pipActive;
}

- (void).cxx_destruct
{
}

@end