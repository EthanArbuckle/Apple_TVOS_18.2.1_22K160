@interface TVSSMenuModeStateProvider
+ (id)_stateFromContributors:(id)a3;
- (BSInvalidatable)stateCaptureHandle;
- (NSArray)contributors;
- (TVSObserverSet)observers;
- (TVSSMenuModeState)state;
- (TVSSMenuModeStateProvider)initWithContributors:(id)a3;
- (id)stateDumpBuilder;
- (void)_notifyMenuModeStateProviderDidChange;
- (void)addProviderObserver:(id)a3;
- (void)dealloc;
- (void)removeProviderObserver:(id)a3;
- (void)setContributors:(id)a3;
- (void)setState:(id)a3;
- (void)stateContributorHasUpdate:(id)a3;
@end

@implementation TVSSMenuModeStateProvider

- (TVSSMenuModeStateProvider)initWithContributors:(id)a3
{
  id v36 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = v36;
  id v36 = 0LL;
  v34.receiver = v3;
  v34.super_class = (Class)&OBJC_CLASS___TVSSMenuModeStateProvider;
  id v36 = -[TVSSMenuModeStateProvider init](&v34, "init");
  objc_storeStrong(&v36, v36);
  if (v36)
  {
    v24 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    v4 = (void *)*((void *)v36 + 2);
    *((void *)v36 + 2) = v24;

    id v23 = [location[0] copy];
    v5 = (void *)*((void *)v36 + 3);
    *((void *)v36 + 3) = v23;

    memset(__b, 0, sizeof(__b));
    id v21 = location[0];
    id v22 = [v21 countByEnumeratingWithState:__b objects:v37 count:16];
    if (v22)
    {
      uint64_t v18 = *(void *)__b[2];
      uint64_t v19 = 0LL;
      id v20 = v22;
      while (1)
      {
        uint64_t v17 = v19;
        if (*(void *)__b[2] != v18) {
          objc_enumerationMutation(v21);
        }
        id v33 = *(id *)(__b[1] + 8 * v19);
        [v33 setContributorDelegate:v36];
        ++v19;
        if (v17 + 1 >= (unint64_t)v20)
        {
          uint64_t v19 = 0LL;
          id v20 = [v21 countByEnumeratingWithState:__b objects:v37 count:16];
          if (!v20) {
            break;
          }
        }
      }
    }

    v16 = (void *)objc_opt_class(v36);
    id v14 = [v16 _stateFromContributors:location[0]];
    id v15 = [v14 copy];
    v6 = (void *)*((void *)v36 + 1);
    *((void *)v36 + 1) = v15;

    objc_initWeak(&from, v36);
    v12 = &_dispatch_main_q;
    aClass = (objc_class *)objc_opt_class(v36);
    v11 = NSStringFromClass(aClass);
    v25 = _NSConcreteStackBlock;
    int v26 = -1073741824;
    int v27 = 0;
    v28 = sub_100011918;
    v29 = &unk_1001B6330;
    objc_copyWeak(&v30, &from);
    id v7 = (id)BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle(v12, v11, &v25);
    v8 = (void *)*((void *)v36 + 4);
    *((void *)v36 + 4) = v7;

    objc_destroyWeak(&v30);
    objc_destroyWeak(&from);
  }

  v10 = (TVSSMenuModeStateProvider *)v36;
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v36, 0LL);
  return v10;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSMenuModeStateProvider;
  -[TVSSMenuModeStateProvider dealloc](&v2, "dealloc");
}

- (void)setState:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((BSEqualObjects(v6->_state, location[0]) & 1) == 0)
  {
    SEL v3 = (TVSSMenuModeState *)[location[0] copy];
    state = v6->_state;
    v6->_state = v3;

    -[TVSSMenuModeStateProvider _notifyMenuModeStateProviderDidChange](v6, "_notifyMenuModeStateProviderDidChange");
  }

  objc_storeStrong(location, 0LL);
}

- (void)addProviderObserver:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = -[TVSSMenuModeStateProvider observers](v6, "observers");
  id v3 = -[TVSObserverSet addObserver:](v4, "addObserver:", location[0]);

  objc_storeStrong(location, 0LL);
}

- (void)removeProviderObserver:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSSMenuModeStateProvider observers](v5, "observers");
  -[TVSObserverSet removeObserver:](v3, "removeObserver:", location[0]);

  objc_storeStrong(location, 0LL);
}

- (void)stateContributorHasUpdate:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = (void *)objc_opt_class(v7);
  v4 = -[TVSSMenuModeStateProvider contributors](v7, "contributors");
  id v5 = objc_msgSend(v3, "_stateFromContributors:");

  -[TVSSMenuModeStateProvider setState:](v7, "setState:", v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_stateFromContributors:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v13 = objc_alloc_init(&OBJC_CLASS___TVSSMutableMenuModeState);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  id v10 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(__b[1] + 8 * v7);
      [v12 updateMenuModeState:v13];
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  id v4 = -[TVSSMutableMenuModeState copy](v13, "copy");
  objc_storeStrong((id *)&v13, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)_notifyMenuModeStateProviderDidChange
{
  v9 = self;
  v8[1] = (id)a2;
  objc_super v2 = -[TVSSMenuModeStateProvider observers](self, "observers");
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  uint64_t v6 = sub_100011EB0;
  uint64_t v7 = &unk_1001B6358;
  v8[0] = v9;
  -[TVSObserverSet enumerateObserversUsingBlock:](v2, "enumerateObserversUsingBlock:");

  objc_storeStrong(v8, 0LL);
}

- (id)stateDumpBuilder
{
  id v12 = self;
  v11[1] = (id)a2;
  v11[0] = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v5 = v11[0];
  uint64_t v6 = -[TVSSMenuModeStateProvider contributors](v12, "contributors");
  id v2 = objc_msgSend(v5, "appendArray:withKey:skipIfEmpty:");

  id v7 = v11[0];
  v9 = -[TVSSMenuModeStateProvider state](v12, "state");
  id v8 = -[TVSSMenuModeState copy](v9, "copy");
  id v3 = objc_msgSend(v7, "appendObject:withKey:");

  id v10 = v11[0];
  objc_storeStrong(v11, 0LL);
  return v10;
}

- (TVSSMenuModeState)state
{
  return self->_state;
}

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (NSArray)contributors
{
  return self->_contributors;
}

- (void)setContributors:(id)a3
{
}

- (BSInvalidatable)stateCaptureHandle
{
  return self->_stateCaptureHandle;
}

- (void).cxx_destruct
{
}

@end