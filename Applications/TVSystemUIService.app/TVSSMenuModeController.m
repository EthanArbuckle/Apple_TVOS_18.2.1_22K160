@interface TVSSMenuModeController
+ (unint64_t)_modeFromState:(id)a3;
- (TVSObserverSet)observers;
- (TVSSMenuModeBannerContext)bannerContext;
- (TVSSMenuModeController)initWithMenuModeStateProvider:(id)a3;
- (TVSSMenuModeStateProvider)provider;
- (unint64_t)mode;
- (void)addControllerObserver:(id)a3;
- (void)dealloc;
- (void)menuModeStateProviderDidChange:(id)a3;
- (void)removeControllerObserver:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setProvider:(id)a3;
@end

@implementation TVSSMenuModeController

- (TVSSMenuModeController)initWithMenuModeStateProvider:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v10;
  v10 = 0LL;
  v8.receiver = v3;
  v8.super_class = (Class)&OBJC_CLASS___TVSSMenuModeController;
  v10 = -[TVSSMenuModeController init](&v8, "init");
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v10->_observers;
    v10->_observers = v4;

    objc_storeStrong((id *)&v10->_provider, location[0]);
    -[TVSSMenuModeStateProvider addProviderObserver:](v10->_provider, "addProviderObserver:", v10);
    sub_1000124D8(v10);
  }

  v7 = v10;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v10, 0LL);
  return v7;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSMenuModeStateProvider removeProviderObserver:](self->_provider, "removeProviderObserver:", self);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSMenuModeController;
  -[TVSSMenuModeController dealloc](&v2, "dealloc");
}

- (void)addControllerObserver:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = -[TVSSMenuModeController observers](v6, "observers");
  id v3 = -[TVSObserverSet addObserver:](v4, "addObserver:", location[0]);

  objc_storeStrong(location, 0LL);
}

- (void)removeControllerObserver:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSSMenuModeController observers](v5, "observers");
  -[TVSObserverSet removeObserver:](v3, "removeObserver:", location[0]);

  objc_storeStrong(location, 0LL);
}

- (void)menuModeStateProviderDidChange:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  sub_1000124D8(v4);
  objc_storeStrong(location, 0LL);
}

+ (unint64_t)_modeFromState:(id)a3
{
  id v5 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((sub_10001319C((uint64_t)v5, location[0]) & 1) != 0)
  {
    unint64_t v6 = 3LL;
  }

  else if (sub_1000132BC((uint64_t)v5, location[0]))
  {
    unint64_t v6 = 1LL;
  }

  else if ((sub_100013374((uint64_t)v5, location[0]) & 1) != 0)
  {
    unint64_t v6 = 2LL;
  }

  else if ((sub_10001349C((uint64_t)v5, location[0]) & 1) != 0)
  {
    unint64_t v6 = 5LL;
  }

  else if ((sub_1000136EC((uint64_t)v5, location[0]) & 1) != 0)
  {
    unint64_t v6 = 4LL;
  }

  else
  {
    unint64_t v6 = 0LL;
  }

  objc_storeStrong(location, 0LL);
  return v6;
}

- (TVSSMenuModeStateProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (TVSSMenuModeBannerContext)bannerContext
{
  return self->_bannerContext;
}

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

@end