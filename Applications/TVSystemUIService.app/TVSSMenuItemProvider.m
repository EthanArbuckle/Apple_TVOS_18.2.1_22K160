@interface TVSSMenuItemProvider
- (NSOrderedSet)items;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (TVSObserverSet)observers;
- (TVSSMenuItemProvider)init;
- (TVSSMenuItemProvider)initWithIdentifier:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_notifyItemsDidChange;
- (void)addProviderObserver:(id)a3;
- (void)dismissBannerWithPresentable:(id)a3;
- (void)presentBannerWithPresentable:(id)a3;
- (void)removeProviderObserver:(id)a3;
- (void)setItems:(id)a3;
@end

@implementation TVSSMenuItemProvider

- (TVSSMenuItemProvider)init
{
  v7 = self;
  v5 = +[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID");
  v4 = -[NSUUID UUIDString](v5, "UUIDString");
  v7 = 0LL;
  v7 = -[TVSSMenuItemProvider initWithIdentifier:](self, "initWithIdentifier:");
  v6 = v7;

  objc_storeStrong((id *)&v7, 0LL);
  return v6;
}

- (TVSSMenuItemProvider)initWithIdentifier:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v14;
  v14 = 0LL;
  v12.receiver = v3;
  v12.super_class = (Class)&OBJC_CLASS___TVSSMenuItemProvider;
  v14 = -[TVSSMenuItemProvider init](&v12, "init");
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    v4 = (NSString *)[location[0] copy];
    identifier = v14->_identifier;
    v14->_identifier = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSOrderedSet);
    items = v14->_items;
    v14->_items = v6;

    v8 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v14->_observers;
    v14->_observers = v8;
  }

  v11 = v14;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  return v11;
}

- (void)addProviderObserver:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v4 = -[TVSSMenuItemProvider observers](v6, "observers");
  id v3 = -[TVSObserverSet addObserver:](v4, "addObserver:", location[0]);

  objc_storeStrong(location, 0LL);
}

- (void)removeProviderObserver:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = -[TVSSMenuItemProvider observers](v5, "observers");
  -[TVSObserverSet removeObserver:](v3, "removeObserver:", location[0]);

  objc_storeStrong(location, 0LL);
}

- (void)setItems:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BSDispatchQueueAssertMain();
  if ((BSEqualObjects(v6->_items, location[0]) & 1) == 0)
  {
    id v3 = (NSOrderedSet *)[location[0] copy];
    items = v6->_items;
    v6->_items = v3;

    -[TVSSMenuItemProvider _notifyItemsDidChange](v6, "_notifyItemsDidChange");
  }

  objc_storeStrong(location, 0LL);
}

- (void)presentBannerWithPresentable:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = BaseMenuItemProviderLog();
  os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v11;
    os_log_type_t type = v10;
    v7 = -[TVSSMenuItemProvider identifier](v13, "identifier");
    id v3 = v7;
    v9 = v3;
    id v6 = [location[0] requesterIdentifier];
    id v8 = v6;
    sub_10002F860((uint64_t)v14, (uint64_t)v3, (uint64_t)v8);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Provider '%{public}@' requested to present banner from %{public}@}",  v14,  0x16u);

    objc_storeStrong(&v8, 0LL);
    objc_storeStrong((id *)&v9, 0LL);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)dismissBannerWithPresentable:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = BaseMenuItemProviderLog();
  os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v11;
    os_log_type_t type = v10;
    v7 = -[TVSSMenuItemProvider identifier](v13, "identifier");
    id v3 = v7;
    v9 = v3;
    id v6 = [location[0] requesterIdentifier];
    id v8 = v6;
    sub_10002F860((uint64_t)v14, (uint64_t)v3, (uint64_t)v8);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Provider '%{public}@' requested to dismiss banner from %{public}@}",  v14,  0x16u);

    objc_storeStrong(&v8, 0LL);
    objc_storeStrong((id *)&v9, 0LL);
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)succinctDescription
{
  id v3 = -[TVSSMenuItemProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  id v11 = self;
  v10[1] = (id)a2;
  v10[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v4 = v10[0];
  v5 = -[TVSSMenuItemProvider identifier](v11, "identifier");
  id v2 = objc_msgSend(v4, "appendObject:withName:");

  id v6 = v10[0];
  id v8 = -[TVSSMenuItemProvider items](v11, "items");
  v7 = -[NSOrderedSet array](v8, "array");
  objc_msgSend(v6, "appendArraySection:withName:skipIfEmpty:objectTransformer:");

  id v9 = v10[0];
  objc_storeStrong(v10, 0LL);
  return v9;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSMenuItemProvider descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  objc_super v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_type_t v10 = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", v12);
  -[BSDescriptionBuilder setActiveMultilinePrefix:](v10, "setActiveMultilinePrefix:", location[0]);
  id v4 = v10;
  id v5 = -[TVSSMenuItemProvider identifier](v12, "identifier");
  -[BSDescriptionBuilder appendString:withName:](v4, "appendString:withName:");

  id v6 = v10;
  id v8 = -[TVSSMenuItemProvider items](v12, "items");
  v7 = -[NSOrderedSet array](v8, "array");
  -[BSDescriptionBuilder appendArraySection:withName:skipIfEmpty:](v6, "appendArraySection:withName:skipIfEmpty:");

  id v9 = v10;
  objc_storeStrong((id *)&v10, 0LL);
  objc_storeStrong(location, 0LL);
  return v9;
}

- (NSString)description
{
  return (NSString *)-[TVSSMenuItemProvider succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSMenuItemProvider descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (void)_notifyItemsDidChange
{
  id v9 = self;
  v8[1] = (id)a2;
  id v2 = -[TVSSMenuItemProvider observers](self, "observers");
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_10006DB50;
  v7 = &unk_1001B8918;
  v8[0] = v9;
  -[TVSObserverSet enumerateObserversUsingBlock:](v2, "enumerateObserversUsingBlock:");

  objc_storeStrong(v8, 0LL);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSOrderedSet)items
{
  return self->_items;
}

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
}

@end