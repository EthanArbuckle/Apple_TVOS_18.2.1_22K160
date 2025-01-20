@interface TVSSRestrictionsMenuItemProvider
- (BOOL)_areRestrictionsEnabled;
- (BOOL)shouldShowMenuItem;
- (TVSSRestrictionsController)restrictionsController;
- (TVSSRestrictionsMenuItemProvider)init;
- (TVSSRestrictionsMenuItemProvider)initWithRestrictionsController:(id)a3;
- (id)_restrictionsUserDefaults;
- (id)log;
- (id)newMenuItem;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation TVSSRestrictionsMenuItemProvider

- (TVSSRestrictionsMenuItemProvider)init
{
  v6 = self;
  v4 = objc_alloc_init(&OBJC_CLASS___TVSSRestrictionsController);
  v6 = 0LL;
  v6 = -[TVSSRestrictionsMenuItemProvider initWithRestrictionsController:](self, "initWithRestrictionsController:");
  v5 = v6;

  objc_storeStrong((id *)&v6, 0LL);
  return v5;
}

- (TVSSRestrictionsMenuItemProvider)initWithRestrictionsController:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0LL;
  v6.receiver = v3;
  v6.super_class = (Class)&OBJC_CLASS___TVSSRestrictionsMenuItemProvider;
  v8 = -[TVSSMenuItemProvider initWithIdentifier:]( &v6,  "initWithIdentifier:",  @"com.apple.TVSystemUIService.restrictions.provider");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v8->_restrictionsController, location[0]);
    -[TVSSRestrictionsController addObserver:forKeyPath:options:context:]( v8->_restrictionsController,  "addObserver:forKeyPath:options:context:",  v8,  @"restrictionsEnabled",  0LL,  off_10021EDD0);
    -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:](v8, "updateMenuItemWithReason:", @"Initial update");
  }

  v5 = v8;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSRestrictionsController removeObserver:forKeyPath:context:]( self->_restrictionsController,  "removeObserver:forKeyPath:context:",  self,  @"restrictionsEnabled",  off_10021EDD0);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSRestrictionsMenuItemProvider;
  -[TVSSRestrictionsMenuItemProvider dealloc](&v2, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  id v12 = 0LL;
  objc_storeStrong(&v12, a5);
  v11 = a6;
  v9 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v9);

  if (a6 == off_10021EDD0)
  {
    -[TVSSSimpleMenuItemProvider updateMenuItemWithReason:]( v15,  "updateMenuItemWithReason:",  @"Restrictions enabled state has changed");
  }

  else
  {
    v10.receiver = v15;
    v10.super_class = (Class)&OBJC_CLASS___TVSSRestrictionsMenuItemProvider;
    -[TVSSRestrictionsMenuItemProvider observeValueForKeyPath:ofObject:change:context:]( &v10,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v13,  v12,  v11);
  }

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)shouldShowMenuItem
{
  return -[TVSSRestrictionsMenuItemProvider _areRestrictionsEnabled](self, "_areRestrictionsEnabled", a2, self);
}

- (id)newMenuItem
{
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = -[TVSSMenuItem initWithIdentifier:]( objc_alloc(&OBJC_CLASS___TVSSMenuItem),  "initWithIdentifier:",  @"com.apple.TVSystemUIService.restrictions.item");
  SEL v3 = objc_alloc(&OBJC_CLASS___TVSSImageContent);
  id v4 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"figure.child.and.lock.fill");
  objc_super v6 = -[TVSSImageContent initWithImage:](v3, "initWithImage:");

  [v7[0] setVisualContent:v6];
  id v5 = v7[0];
  objc_storeStrong((id *)&v6, 0LL);
  objc_storeStrong(v7, 0LL);
  return v5;
}

- (id)log
{
  id v4 = (dispatch_once_t *)&unk_100221930;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1001B67B8);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100221928;
}

- (id)_restrictionsUserDefaults
{
  return -[TVSSRestrictionsController _restrictionsUserDefaults]( self->_restrictionsController,  "_restrictionsUserDefaults",  a2,  self);
}

- (BOOL)_areRestrictionsEnabled
{
  return -[TVSSRestrictionsController restrictionsEnabled]( self->_restrictionsController,  "restrictionsEnabled",  a2,  self);
}

- (TVSSRestrictionsController)restrictionsController
{
  return self->_restrictionsController;
}

- (void).cxx_destruct
{
}

@end