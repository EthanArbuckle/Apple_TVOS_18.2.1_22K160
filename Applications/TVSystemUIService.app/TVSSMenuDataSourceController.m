@interface TVSSMenuDataSourceController
- (NSArray)providers;
- (NSString)debugDescription;
- (NSString)description;
- (TVSObserverSet)observers;
- (TVSSMenuDataSource)dataSource;
- (TVSSMenuDataSourceController)initWithMode:(unint64_t)a3 providers:(id)a4;
- (id)_createNewDataSource;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)mode;
- (void)_notifyDataSourceDidChange;
- (void)_updateDataSource;
- (void)addControllerObserver:(id)a3;
- (void)dealloc;
- (void)providerItemsDidChange:(id)a3;
- (void)removeControllerObserver:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation TVSSMenuDataSourceController

- (TVSSMenuDataSourceController)initWithMode:(unint64_t)a3 providers:(id)a4
{
  v25 = self;
  SEL v24 = a2;
  unint64_t v23 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  v4 = v25;
  v25 = 0LL;
  v21.receiver = v4;
  v21.super_class = (Class)&OBJC_CLASS___TVSSMenuDataSourceController;
  v25 = -[TVSSMenuDataSourceController init](&v21, "init");
  objc_storeStrong((id *)&v25, v25);
  if (v25)
  {
    v25->_mode = v23;
    v5 = (NSArray *)[location copy];
    providers = v25->_providers;
    v25->_providers = v5;

    memset(__b, 0, sizeof(__b));
    obj = v25->_providers;
    id v18 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v26,  16LL);
    if (v18)
    {
      uint64_t v14 = *(void *)__b[2];
      uint64_t v15 = 0LL;
      id v16 = v18;
      while (1)
      {
        uint64_t v13 = v15;
        if (*(void *)__b[2] != v14) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(id *)(__b[1] + 8 * v15);
        [v20 addProviderObserver:v25];
        ++v15;
        if (v13 + 1 >= (unint64_t)v16)
        {
          uint64_t v15 = 0LL;
          id v16 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v26,  16LL);
          if (!v16) {
            break;
          }
        }
      }
    }

    v7 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v25->_observers;
    v25->_observers = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___TVSSMenuDataSource);
    dataSource = v25->_dataSource;
    v25->_dataSource = v9;

    -[TVSSMenuDataSourceController _updateDataSource](v25, "_updateDataSource");
  }

  v12 = v25;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v25, 0LL);
  return v12;
}

- (void)dealloc
{
  uint64_t v13 = self;
  SEL v12 = a2;
  memset(__b, 0, sizeof(__b));
  obj = -[TVSSMenuDataSourceController providers](v13, "providers");
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v14,  16LL);
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
      objc_msgSend(v11, "removeProviderObserver:", v13, v6);
      ++v5;
      id v6 = (id)v2;
      if (v3 + 1 >= v2)
      {
        uint64_t v5 = 0LL;
        id v6 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v14,  16LL);
        if (!v6) {
          break;
        }
      }
    }
  }

  v9.receiver = v13;
  v9.super_class = (Class)&OBJC_CLASS___TVSSMenuDataSourceController;
  -[TVSSMenuDataSourceController dealloc](&v9, "dealloc");
}

- (id)succinctDescription
{
  id v3 = -[TVSSMenuDataSourceController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  SEL v12 = self;
  v11[1] = (id)a2;
  v11[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v3 = v11[0];
  id v4 = TVSSMenuModeDescription(-[TVSSMenuDataSourceController mode](v12, "mode"));
  objc_msgSend(v3, "appendString:withName:");

  id v5 = v11[0];
  id v6 = -[TVSSMenuDataSourceController providers](v12, "providers");
  objc_msgSend(v5, "appendArraySection:withName:skipIfEmpty:objectTransformer:");

  id v7 = v11[0];
  objc_super v9 = -[TVSSMenuDataSourceController dataSource](v12, "dataSource");
  id v8 =  +[BSDescriptionBuilder succinctDescriptionForObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "succinctDescriptionForObject:");
  objc_msgSend(v7, "appendString:withName:");

  id v10 = v11[0];
  objc_storeStrong(v11, 0LL);
  return v10;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSMenuDataSourceController descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  SEL v12 = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", v14);
  -[BSDescriptionBuilder setActiveMultilinePrefix:](v12, "setActiveMultilinePrefix:", location[0]);
  id v5 = v12;
  id v6 = TVSSMenuModeDescription(-[TVSSMenuDataSourceController mode](v14, "mode"));
  -[BSDescriptionBuilder appendString:withName:](v5, "appendString:withName:");

  id v7 = v12;
  id v8 = -[TVSSMenuDataSourceController providers](v14, "providers");
  -[BSDescriptionBuilder appendArraySection:withName:skipIfEmpty:](v7, "appendArraySection:withName:skipIfEmpty:");

  objc_super v9 = v12;
  id v10 = -[TVSSMenuDataSourceController dataSource](v14, "dataSource");
  id v3 = -[BSDescriptionBuilder appendObject:withName:](v9, "appendObject:withName:");

  id v11 = v12;
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong(location, 0LL);
  return v11;
}

- (NSString)description
{
  return (NSString *)-[TVSSMenuDataSourceController succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSMenuDataSourceController descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (void)setDataSource:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BSDispatchQueueAssertMain();
  if ((BSEqualObjects(v4->_dataSource, location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_dataSource, location[0]);
    -[TVSSMenuDataSourceController _notifyDataSourceDidChange](v4, "_notifyDataSourceDidChange");
  }

  objc_storeStrong(location, 0LL);
}

- (void)addControllerObserver:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = -[TVSSMenuDataSourceController observers](v6, "observers");
  id v3 = -[TVSObserverSet addObserver:](v4, "addObserver:", location[0]);

  objc_storeStrong(location, 0LL);
}

- (void)removeControllerObserver:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSSMenuDataSourceController observers](v5, "observers");
  -[TVSObserverSet removeObserver:](v3, "removeObserver:", location[0]);

  objc_storeStrong(location, 0LL);
}

- (void)providerItemsDidChange:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSMenuDataSourceController _updateDataSource](v4, "_updateDataSource");
  objc_storeStrong(location, 0LL);
}

- (void)_updateDataSource
{
  id v3 = self;
  v2[1] = (id)a2;
  v2[0] = -[TVSSMenuDataSourceController _createNewDataSource](self, "_createNewDataSource");
  -[TVSSMenuDataSourceController setDataSource:](v3, "setDataSource:", v2[0]);
  objc_storeStrong(v2, 0LL);
}

- (void)_notifyDataSourceDidChange
{
  objc_super v9 = self;
  v8[1] = (id)a2;
  unint64_t v2 = -[TVSSMenuDataSourceController observers](self, "observers");
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_100077E60;
  id v7 = &unk_1001B8C58;
  v8[0] = v9;
  -[TVSObserverSet enumerateObserversUsingBlock:](v2, "enumerateObserversUsingBlock:");

  objc_storeStrong(v8, 0LL);
}

- (id)_createNewDataSource
{
  id v16 = self;
  v15[1] = (id)a2;
  v15[0] = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  memset(__b, 0, sizeof(__b));
  obj = -[TVSSMenuDataSourceController providers](v16, "providers");
  id v10 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v17,  16LL);
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
      id v14 = *(id *)(__b[1] + 8 * v7);
      id v12 = [v14 items];
      [v15[0] unionOrderedSet:v12];
      objc_storeStrong(&v12, 0LL);
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v17,  16LL);
        if (!v8) {
          break;
        }
      }
    }
  }

  unint64_t v2 = objc_alloc(&OBJC_CLASS___TVSSMenuDataSource);
  id v11 = -[TVSSMenuDataSource initWithItems:](v2, "initWithItems:", v15[0]);
  id v4 = v11;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(v15, 0LL);
  return v4;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSArray)providers
{
  return self->_providers;
}

- (TVSSMenuDataSource)dataSource
{
  return self->_dataSource;
}

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

@end