@interface TVSSRestrictionsController
- (BOOL)_areRestrictionsEnabled;
- (BOOL)contentIsSelected;
- (BOOL)restrictionsEnabled;
- (NSString)contentTitle;
- (NSUserDefaults)_restrictionsUserDefaults;
- (NSUserDefaults)restrictionsUserDefaults;
- (TVSSRestrictionsController)init;
- (TVSSRestrictionsController)initWithRestrictionsUserDefaults:(id)a3;
- (UIImage)contentImage;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation TVSSRestrictionsController

- (NSString)contentTitle
{
  v3 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  v4 =  -[NSBundle localizedStringForKey:value:table:]( v3,  "localizedStringForKey:value:table:",  @"TVSSRestrictionsTitle",  &stru_1001BDAC8,  0LL);

  return v4;
}

- (UIImage)contentImage
{
  return (UIImage *)+[UIImage systemImageNamed:]( &OBJC_CLASS___UIImage,  "systemImageNamed:",  @"figure.child.and.lock.fill",  a2,  self);
}

- (BOOL)contentIsSelected
{
  return -[TVSSRestrictionsController restrictionsEnabled](self, "restrictionsEnabled", a2, self);
}

- (TVSSRestrictionsController)init
{
  v6 = self;
  v5[1] = (id)a2;
  v5[0] = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.springboard");
  v2 = v6;
  v6 = 0LL;
  v6 = -[TVSSRestrictionsController initWithRestrictionsUserDefaults:](v2, "initWithRestrictionsUserDefaults:", v5[0]);
  v4 = v6;
  objc_storeStrong(v5, 0LL);
  objc_storeStrong((id *)&v6, 0LL);
  return v4;
}

- (TVSSRestrictionsController)initWithRestrictionsUserDefaults:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0LL;
  v8.receiver = v3;
  v8.super_class = (Class)&OBJC_CLASS___TVSSRestrictionsController;
  v7 = -[TVSSRestrictionsController init](&v8, "init");
  v10 = v7;
  objc_storeStrong((id *)&v10, v7);
  if (v7)
  {
    objc_storeStrong((id *)&v10->_restrictionsUserDefaults, location[0]);
    -[NSUserDefaults addObserver:forKeyPath:options:context:]( v10->_restrictionsUserDefaults,  "addObserver:forKeyPath:options:context:",  v10,  @"SBParentalControlsEnabled",  1LL,  off_1002200B8);
    unsigned __int8 v4 = -[TVSSRestrictionsController _areRestrictionsEnabled](v10, "_areRestrictionsEnabled");
    v10->_restrictionsEnabled = v4 & 1;
  }

  v6 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v6;
}

- (void)dealloc
{
  unsigned __int8 v4 = self;
  SEL v3 = a2;
  -[NSUserDefaults removeObserver:forKeyPath:context:]( self->_restrictionsUserDefaults,  "removeObserver:forKeyPath:context:",  self,  @"SBParentalControlsEnabled",  off_1002200B8);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSRestrictionsController;
  -[TVSSRestrictionsController dealloc](&v2, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v13 = 0LL;
  objc_storeStrong(&v13, a5);
  v12 = a6;
  v10 = &_dispatch_main_q;
  dispatch_assert_queue_V2(v10);

  if (a6 == off_1002200B8)
  {
    -[TVSSRestrictionsController willChangeValueForKey:](v16, "willChangeValueForKey:");
    unsigned __int8 v6 = -[TVSSRestrictionsController _areRestrictionsEnabled](v16, "_areRestrictionsEnabled");
    v16->_restrictionsEnabled = v6 & 1;
    -[TVSSRestrictionsController didChangeValueForKey:](v16, "didChangeValueForKey:", @"restrictionsEnabled");
  }

  else
  {
    v11.receiver = v16;
    v11.super_class = (Class)&OBJC_CLASS___TVSSRestrictionsController;
    -[TVSSRestrictionsController observeValueForKeyPath:ofObject:change:context:]( &v11,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v14,  v13,  v12);
  }

  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

- (NSUserDefaults)_restrictionsUserDefaults
{
  return self->_restrictionsUserDefaults;
}

- (BOOL)_areRestrictionsEnabled
{
  SEL v3 = +[TVCSRestrictionsDataProvider sharedInstance](&OBJC_CLASS___TVCSRestrictionsDataProvider, "sharedInstance");
  unsigned __int8 v4 = -[TVCSRestrictionsDataProvider areRestrictionsEnabled](v3, "areRestrictionsEnabled");

  return v4 & 1;
}

- (BOOL)restrictionsEnabled
{
  return self->_restrictionsEnabled;
}

- (NSUserDefaults)restrictionsUserDefaults
{
  return self->_restrictionsUserDefaults;
}

- (void).cxx_destruct
{
}

@end