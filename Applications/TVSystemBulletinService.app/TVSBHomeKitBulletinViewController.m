@interface TVSBHomeKitBulletinViewController
- (BOOL)homeFetched;
- (TVCSHomeManager)homeManager;
- (TVSBHomeKitBulletinViewController)init;
- (id)prepareCompletion;
- (void)bulletinServiceBeginUserInteraction;
- (void)bulletinServiceToggleSize;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareWithBulletin:(id)a3 completion:(id)a4;
- (void)setHomeFetched:(BOOL)a3;
- (void)setPrepareCompletion:(id)a3;
@end

@implementation TVSBHomeKitBulletinViewController

- (TVSBHomeKitBulletinViewController)init
{
  SEL v7 = a2;
  v8 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSBHomeKitBulletinViewController;
  v8 = -[TVSBHomeKitBulletinViewController init](&v6, "init");
  objc_storeStrong((id *)&v8, v8);
  if (v8)
  {
    v2 = +[TVCSHomeManager sharedInstance](&OBJC_CLASS___TVCSHomeManager, "sharedInstance");
    homeManager = v8->_homeManager;
    v8->_homeManager = v2;

    -[TVCSHomeManager reloadHomeConfiguration](v8->_homeManager, "reloadHomeConfiguration");
    -[TVCSHomeManager addObserver:forKeyPath:options:context:]( v8->_homeManager,  "addObserver:forKeyPath:options:context:",  v8,  @"localAccessory",  4LL,  off_100036218);
  }

  v5 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  return v5;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVCSHomeManager removeObserver:forKeyPath:context:]( self->_homeManager,  "removeObserver:forKeyPath:context:",  self,  @"localAccessory",  off_100036218);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSBHomeKitBulletinViewController;
  -[TVSBBulletinViewController dealloc](&v2, "dealloc");
}

- (void)bulletinServiceBeginUserInteraction
{
}

- (void)bulletinServiceToggleSize
{
}

- (void)prepareWithBulletin:(id)a3 completion:(id)a4
{
  SEL v7 = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  v5  = 0LL;
  objc_storeStrong(&v5, a4);
  if (-[TVSBHomeKitBulletinViewController homeFetched](v7, "homeFetched")) {
    (*((void (**)(void))v5 + 2))();
  }
  else {
    -[TVSBHomeKitBulletinViewController setPrepareCompletion:](v7, "setPrepareCompletion:", v5);
  }
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v18  = self;
  location[1]  = (id)a2;
  location[0]  = 0LL;
  objc_storeStrong(location, a3);
  v16  = 0LL;
  objc_storeStrong(&v16, a4);
  v15  = 0LL;
  objc_storeStrong(&v15, a5);
  v14  = a6;
  if (a6 == off_100036218)
  {
    id v7 = -[TVCSHomeManager localAccessory](v18->_homeManager, "localAccessory");
    v8  = [v7 home];
    v9  = 0;
    if (v8) {
      v9  = !v18->_homeFetched;
    }

    if (v9)
    {
      v18->_homeFetched  = 1;
      if (v18->_prepareCompletion)
      {
        (*((void (**)(void))v18->_prepareCompletion + 2))();
        prepareCompletion  = v18->_prepareCompletion;
        v18->_prepareCompletion  = 0LL;
      }
    }
  }

  else
  {
    v13.receiver  = v18;
    v13.super_class  = (Class)&OBJC_CLASS___TVSBHomeKitBulletinViewController;
    -[TVSBHomeKitBulletinViewController observeValueForKeyPath:ofObject:change:context:]( &v13,  "observeValueForKeyPath:ofObject:change:context:",  location[0],  v16,  v15,  v14);
  }

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)homeFetched
{
  return self->_homeFetched;
}

- (void)setHomeFetched:(BOOL)a3
{
  self->_homeFetched  = a3;
}

- (TVCSHomeManager)homeManager
{
  return self->_homeManager;
}

- (id)prepareCompletion
{
  return self->_prepareCompletion;
}

- (void)setPrepareCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end