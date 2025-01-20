@interface TVSSFilteringMenuItemProvider
- (TVSSFilteringMenuItemProvider)initWithIdentifier:(id)a3 provider:(id)a4;
- (TVSSMenuItemProvider)wrappedProvider;
- (id)itemsFilter;
- (void)_updateFilteredItemsFromWrappedProvider;
- (void)dealloc;
- (void)providerItemsDidChange:(id)a3;
- (void)setItems:(id)a3;
- (void)setItemsFilter:(id)a3;
@end

@implementation TVSSFilteringMenuItemProvider

- (TVSSFilteringMenuItemProvider)initWithIdentifier:(id)a3 provider:(id)a4
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  v4 = v13;
  v13 = 0LL;
  v10.receiver = v4;
  v10.super_class = (Class)&OBJC_CLASS___TVSSFilteringMenuItemProvider;
  v13 = -[TVSSMenuItemProvider initWithIdentifier:](&v10, "initWithIdentifier:", location[0]);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    objc_storeStrong((id *)&v13->_wrappedProvider, v11);
    -[TVSSMenuItemProvider addProviderObserver:](v13->_wrappedProvider, "addProviderObserver:", v13);
    v5 = objc_retainBlock(&stru_1001B59E0);
    id itemsFilter = v13->_itemsFilter;
    v13->_id itemsFilter = v5;
  }

  v8 = v13;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  return v8;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[TVSSMenuItemProvider removeProviderObserver:](self->_wrappedProvider, "removeProviderObserver:", self);
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSSFilteringMenuItemProvider;
  -[TVSSFilteringMenuItemProvider dealloc](&v2, "dealloc");
}

- (void)setItems:(id)a3
{
  v16 = self;
  SEL v15 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  v13 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Items should not be directly set on the filtering menu item provider.");
  os_log_t oslog = &_os_log_default;
  os_log_type_t type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    log = oslog;
    os_log_type_t v6 = type;
    v8 = NSStringFromSelector(v15);
    v4 = v8;
    objc_super v10 = v4;
    SEL v3 = (objc_class *)objc_opt_class(v16);
    v7 = NSStringFromClass(v3);
    v9 = v7;
    sub_10000583C( (uint64_t)v17,  (uint64_t)v4,  (uint64_t)v9,  (uint64_t)v16,  (uint64_t)@"TVSSFilteringMenuItemProvider.m",  47,  (uint64_t)v13);
    _os_log_error_impl( (void *)&_mh_execute_header,  log,  v6,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v17,  0x3Au);

    objc_storeStrong((id *)&v9, 0LL);
    objc_storeStrong((id *)&v10, 0LL);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  _bs_set_crash_log_message(-[NSString UTF8String](v13, "UTF8String"));
  __break(0);
}

- (void)setItemsFilter:(id)a3
{
  v18 = self;
  SEL v17 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  BSDispatchQueueAssertMain();
  if (!location)
  {
    SEL v15 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"itemsFilter");
    id v14 = &_os_log_default;
    char v13 = 16;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v14;
      os_log_type_t type = v13;
      objc_super v10 = NSStringFromSelector(v17);
      os_log_type_t v6 = v10;
      v12 = v6;
      SEL v3 = (objc_class *)objc_opt_class(v18);
      v9 = NSStringFromClass(v3);
      id v11 = v9;
      sub_10000583C( (uint64_t)v19,  (uint64_t)v6,  (uint64_t)v11,  (uint64_t)v18,  (uint64_t)@"TVSSFilteringMenuItemProvider.m",  53,  (uint64_t)v15);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v19,  0x3Au);

      objc_storeStrong((id *)&v11, 0LL);
      objc_storeStrong((id *)&v12, 0LL);
    }

    objc_storeStrong(&v14, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v15, "UTF8String"));
    __break(0);
    JUMPOUT(0x100005AC8LL);
  }

  id v4 = [location copy];
  id itemsFilter = v18->_itemsFilter;
  v18->_id itemsFilter = v4;

  -[TVSSFilteringMenuItemProvider _updateFilteredItemsFromWrappedProvider]( v18,  "_updateFilteredItemsFromWrappedProvider");
  objc_storeStrong(&location, 0LL);
}

- (void)providerItemsDidChange:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BSDispatchQueueAssertMain();
  -[TVSSFilteringMenuItemProvider _updateFilteredItemsFromWrappedProvider]( v4,  "_updateFilteredItemsFromWrappedProvider");
  objc_storeStrong(location, 0LL);
}

- (void)_updateFilteredItemsFromWrappedProvider
{
  v5 = self;
  v4[1] = (id)a2;
  v4[0] = -[TVSSMenuItemProvider items](self->_wrappedProvider, "items");
  id v3 = (id)(*((uint64_t (**)(void))v5->_itemsFilter + 2))();
  v2.receiver = v5;
  v2.super_class = (Class)&OBJC_CLASS___TVSSFilteringMenuItemProvider;
  -[TVSSMenuItemProvider setItems:](&v2, "setItems:", v3);
  objc_storeStrong(&v3, 0LL);
  objc_storeStrong(v4, 0LL);
}

- (id)itemsFilter
{
  return self->_itemsFilter;
}

- (TVSSMenuItemProvider)wrappedProvider
{
  return self->_wrappedProvider;
}

- (void).cxx_destruct
{
}

@end