@interface TVSSSensorActivityController
+ (BOOL)_shouldExcludeAttribution:(id)a3;
+ (id)_activeActivityAttributionsFromDomianData:(id)a3;
+ (id)_filterExcludedAttributions:(id)a3;
+ (id)_recentActivityAttributionsFromDomianData:(id)a3;
- (NSOrderedSet)activeActivityAttributions;
- (NSOrderedSet)activeAndRecentActivityAttributions;
- (NSOrderedSet)activeLocationActivityAttributions;
- (NSOrderedSet)activeRecordingActivityAttributions;
- (NSOrderedSet)recentActivityAttributions;
- (TVSSSensorActivityController)init;
- (TVSSSensorActivityController)initWithDataAccessStatusDomain:(id)a3;
- (TVSSVideoMicAppInfo)activeCameraAppInfo;
- (TVSSVideoMicAppInfo)activeMicAppInfo;
- (id)activeAppInfoForSensorType:(unint64_t)a3;
- (void)_handleUpdatedActiveActivityAttributions:(id)a3 recentActivityAttributions:(id)a4;
- (void)_notifyObserversOfUpdate;
- (void)_systemStatusQueue_handleUpdatedDomainData:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation TVSSSensorActivityController

- (TVSSVideoMicAppInfo)activeCameraAppInfo
{
  return (TVSSVideoMicAppInfo *)-[TVSSSensorActivityController activeAppInfoForSensorType:]( self,  "activeAppInfoForSensorType:",  0LL,  a2,  self);
}

- (TVSSVideoMicAppInfo)activeMicAppInfo
{
  return (TVSSVideoMicAppInfo *)-[TVSSSensorActivityController activeAppInfoForSensorType:]( self,  "activeAppInfoForSensorType:",  1LL,  a2,  self);
}

- (id)activeAppInfoForSensorType:(unint64_t)a3
{
  v16 = self;
  SEL v15 = a2;
  unint64_t v14 = a3;
  memset(__b, 0, sizeof(__b));
  obj = -[TVSSSensorActivityController activeActivityAttributions](v16, "activeActivityAttributions");
  id v10 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v18,  16LL);
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
      id v13 = *(id *)(__b[1] + 8 * v7);
      id v3 = [v13 sensorType];
      if (v3 == (id)v14) {
        break;
      }
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v18,  16LL);
        if (!v8) {
          goto LABEL_9;
        }
      }
    }

    id v17 = v13;
    int v11 = 1;
  }

  else
  {
LABEL_9:
    int v11 = 0;
  }

  if (!v11) {
    id v17 = 0LL;
  }
  return v17;
}

- (TVSSSensorActivityController)init
{
  uint64_t v6 = self;
  v5[1] = (id)a2;
  v5[0] = objc_alloc_init(&OBJC_CLASS___STUIDataAccessStatusDomain);
  v2 = v6;
  uint64_t v6 = 0LL;
  uint64_t v6 = -[TVSSSensorActivityController initWithDataAccessStatusDomain:](v2, "initWithDataAccessStatusDomain:", v5[0]);
  v4 = v6;
  objc_storeStrong(v5, 0LL);
  objc_storeStrong((id *)&v6, 0LL);
  return v4;
}

- (TVSSSensorActivityController)initWithDataAccessStatusDomain:(id)a3
{
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = v25;
  v25 = 0LL;
  v23.receiver = v3;
  v23.super_class = (Class)&OBJC_CLASS___TVSSSensorActivityController;
  v25 = -[TVSSSensorActivityController init](&v23, "init");
  objc_storeStrong((id *)&v25, v25);
  if (v25)
  {
    objc_storeStrong((id *)&v25->_dataAccessDomain, location[0]);
    objc_initWeak(&v22, v25);
    dataAccessDomain = v25->_dataAccessDomain;
    v16 = _NSConcreteStackBlock;
    int v17 = -1073741824;
    int v18 = 0;
    v19 = sub_1001053E4;
    v20 = &unk_1001BB1C0;
    objc_copyWeak(&v21, &v22);
    -[STUIDataAccessStatusDomain observeDataWithBlock:](dataAccessDomain, "observeDataWithBlock:", &v16);
    int v11 = objc_alloc_init(&OBJC_CLASS___NSOrderedSet);
    activeActivityAttributions = v25->_activeActivityAttributions;
    v25->_activeActivityAttributions = v11;

    id v10 = objc_alloc_init(&OBJC_CLASS___NSOrderedSet);
    recentActivityAttributions = v25->_recentActivityAttributions;
    v25->_recentActivityAttributions = v10;

    id v15 = -[STUIDataAccessStatusDomain data](v25->_dataAccessDomain, "data");
    id v14 = [(id)objc_opt_class(v25) _activeActivityAttributionsFromDomianData:v15];
    id v13 = [(id)objc_opt_class(v25) _recentActivityAttributionsFromDomianData:v15];
    -[TVSSSensorActivityController _handleUpdatedActiveActivityAttributions:recentActivityAttributions:]( v25,  "_handleUpdatedActiveActivityAttributions:recentActivityAttributions:",  v14,  v13);
    v9 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v25->_observers;
    v25->_observers = v9;

    objc_storeStrong(&v13, 0LL);
    objc_storeStrong(&v14, 0LL);
    objc_storeStrong(&v15, 0LL);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v22);
  }

  id v8 = v25;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v25, 0LL);
  return v8;
}

- (void)addObserver:(id)a3
{
  int v17 = self;
  SEL v16 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    id v14 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
    id v13 = &_os_log_default;
    char v12 = 16;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v13;
      os_log_type_t type = v12;
      v9 = NSStringFromSelector(v16);
      uint64_t v5 = v9;
      int v11 = v5;
      id v3 = (objc_class *)objc_opt_class(v17);
      id v8 = NSStringFromClass(v3);
      id v10 = v8;
      sub_10000583C( (uint64_t)v18,  (uint64_t)v5,  (uint64_t)v10,  (uint64_t)v17,  (uint64_t)@"TVSSSensorActivityController.m",  63,  (uint64_t)v14);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v18,  0x3Au);

      objc_storeStrong((id *)&v10, 0LL);
      objc_storeStrong((id *)&v11, 0LL);
    }

    objc_storeStrong(&v13, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v14, "UTF8String"));
    __break(0);
    JUMPOUT(0x100105630LL);
  }

  id v4 = -[TVSObserverSet addObserver:](v17->_observers, "addObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (void)removeObserver:(id)a3
{
  SEL v16 = self;
  SEL v15 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    id v13 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"observer");
    id v12 = &_os_log_default;
    char v11 = 16;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v12;
      os_log_type_t type = v11;
      id v8 = NSStringFromSelector(v15);
      id v4 = v8;
      id v10 = v4;
      id v3 = (objc_class *)objc_opt_class(v16);
      uint64_t v7 = NSStringFromClass(v3);
      v9 = v7;
      sub_10000583C( (uint64_t)v17,  (uint64_t)v4,  (uint64_t)v9,  (uint64_t)v16,  (uint64_t)@"TVSSSensorActivityController.m",  70,  (uint64_t)v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v17,  0x3Au);

      objc_storeStrong((id *)&v9, 0LL);
      objc_storeStrong((id *)&v10, 0LL);
    }

    objc_storeStrong(&v12, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v13, "UTF8String"));
    __break(0);
    JUMPOUT(0x100105890LL);
  }

  -[TVSObserverSet removeObserver:](v16->_observers, "removeObserver:", location);
  objc_storeStrong(&location, 0LL);
}

- (NSOrderedSet)activeAndRecentActivityAttributions
{
  v28 = self;
  SEL v27 = a2;
  if (!self->_activeActivityAttributions)
  {
    v26 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_activeActivityAttributions != nil");
    id v25 = &_os_log_default;
    char v24 = 16;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v25;
      os_log_type_t type = v24;
      SEL v15 = NSStringFromSelector(v27);
      char v11 = v15;
      objc_super v23 = v11;
      v2 = (objc_class *)objc_opt_class(v28);
      id v14 = NSStringFromClass(v2);
      id v22 = v14;
      sub_10000583C( (uint64_t)v30,  (uint64_t)v11,  (uint64_t)v22,  (uint64_t)v28,  (uint64_t)@"TVSSSensorActivityController.m",  77,  (uint64_t)v26);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v30,  0x3Au);

      objc_storeStrong((id *)&v22, 0LL);
      objc_storeStrong((id *)&v23, 0LL);
    }

    objc_storeStrong(&v25, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v26, "UTF8String"));
    __break(0);
    JUMPOUT(0x100105AD8LL);
  }

  if (!v28->_recentActivityAttributions)
  {
    id v21 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_recentActivityAttributions != nil");
    id v20 = &_os_log_default;
    char v19 = 16;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = (os_log_s *)v20;
      os_log_type_t v8 = v19;
      id v10 = NSStringFromSelector(v27);
      uint64_t v6 = v10;
      int v18 = v6;
      id v3 = (objc_class *)objc_opt_class(v28);
      v9 = NSStringFromClass(v3);
      int v17 = v9;
      sub_10000583C( (uint64_t)v29,  (uint64_t)v6,  (uint64_t)v17,  (uint64_t)v28,  (uint64_t)@"TVSSSensorActivityController.m",  78,  (uint64_t)v21);
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  v8,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v29,  0x3Au);

      objc_storeStrong((id *)&v17, 0LL);
      objc_storeStrong((id *)&v18, 0LL);
    }

    objc_storeStrong(&v20, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v21, "UTF8String"));
    __break(0);
    JUMPOUT(0x100105C88LL);
  }

  id v16 = -[NSOrderedSet mutableCopy](v28->_activeActivityAttributions, "mutableCopy");
  [v16 unionOrderedSet:v28->_recentActivityAttributions];
  id v5 = [v16 copy];
  objc_storeStrong(&v16, 0LL);
  return (NSOrderedSet *)v5;
}

- (NSOrderedSet)activeRecordingActivityAttributions
{
  int v17 = self;
  SEL v16 = a2;
  if (!self->_activeActivityAttributions)
  {
    SEL v15 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_activeActivityAttributions != nil");
    id v14 = &_os_log_default;
    char v13 = 16;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v14;
      os_log_type_t type = v13;
      v9 = NSStringFromSelector(v16);
      id v5 = v9;
      id v12 = v5;
      v2 = (objc_class *)objc_opt_class(v17);
      os_log_type_t v8 = NSStringFromClass(v2);
      char v11 = v8;
      sub_10000583C( (uint64_t)v18,  (uint64_t)v5,  (uint64_t)v11,  (uint64_t)v17,  (uint64_t)@"TVSSSensorActivityController.m",  87,  (uint64_t)v15);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v18,  0x3Au);

      objc_storeStrong((id *)&v11, 0LL);
      objc_storeStrong((id *)&v12, 0LL);
    }

    objc_storeStrong(&v14, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v15, "UTF8String"));
    __break(0);
    JUMPOUT(0x100105EF4LL);
  }

  id v10 = -[NSOrderedSet bs_filter:](v17->_activeActivityAttributions, "bs_filter:", &stru_1001BB200);
  id v4 = v10;
  objc_storeStrong(&v10, 0LL);
  return (NSOrderedSet *)v4;
}

- (NSOrderedSet)activeLocationActivityAttributions
{
  int v17 = self;
  SEL v16 = a2;
  if (!self->_activeActivityAttributions)
  {
    SEL v15 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_activeActivityAttributions != nil");
    id v14 = &_os_log_default;
    char v13 = 16;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v14;
      os_log_type_t type = v13;
      v9 = NSStringFromSelector(v16);
      id v5 = v9;
      id v12 = v5;
      v2 = (objc_class *)objc_opt_class(v17);
      os_log_type_t v8 = NSStringFromClass(v2);
      char v11 = v8;
      sub_10000583C( (uint64_t)v18,  (uint64_t)v5,  (uint64_t)v11,  (uint64_t)v17,  (uint64_t)@"TVSSSensorActivityController.m",  98,  (uint64_t)v15);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v18,  0x3Au);

      objc_storeStrong((id *)&v11, 0LL);
      objc_storeStrong((id *)&v12, 0LL);
    }

    objc_storeStrong(&v14, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v15, "UTF8String"));
    __break(0);
    JUMPOUT(0x1001061E8LL);
  }

  id v10 = -[NSOrderedSet bs_filter:](v17->_activeActivityAttributions, "bs_filter:", &stru_1001BB220);
  id v4 = v10;
  objc_storeStrong(&v10, 0LL);
  return (NSOrderedSet *)v4;
}

- (void)_systemStatusQueue_handleUpdatedDomainData:(id)a3
{
  int v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = (void *)objc_opt_class(v18);
  id v16 = [v3 _activeActivityAttributionsFromDomianData:location[0]];
  id v4 = (void *)objc_opt_class(v18);
  id v15 = [v4 _recentActivityAttributionsFromDomianData:location[0]];
  objc_initWeak(&v14, v18);
  queue = &_dispatch_main_q;
  uint64_t v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_100106480;
  id v10 = &unk_1001B6298;
  objc_copyWeak(&v13, &v14);
  id v11 = v16;
  id v12 = v15;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v14);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

+ (id)_activeActivityAttributionsFromDomianData:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [location[0] activeAttributionData];
  id v8 = [v4 dataAccessAttributions];

  id v5 = objc_msgSend(v8, "bs_map:", &stru_1001BB260);
  int v7 = +[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:");

  uint64_t v6 = v7;
  objc_storeStrong((id *)&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

+ (id)_recentActivityAttributionsFromDomianData:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [location[0] recentAttributionData];
  id v8 = [v4 dataAccessAttributions];

  id v5 = objc_msgSend(v8, "bs_map:", &stru_1001BB280);
  int v7 = +[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:");

  uint64_t v6 = v7;
  objc_storeStrong((id *)&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (void)_handleUpdatedActiveActivityAttributions:(id)a3 recentActivityAttributions:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  if ((BSEqualObjects(v13->_activeActivityAttributions, location[0]) & 1) == 0
    || (BSEqualObjects(v13->_recentActivityAttributions, v11) & 1) == 0)
  {
    id v4 = (void *)objc_opt_class(v13);
    id v5 = (NSOrderedSet *)[v4 _filterExcludedAttributions:location[0]];
    activeActivityAttributions = v13->_activeActivityAttributions;
    v13->_activeActivityAttributions = v5;

    int v7 = (void *)objc_opt_class(v13);
    id v8 = (NSOrderedSet *)[v7 _filterExcludedAttributions:v11];
    recentActivityAttributions = v13->_recentActivityAttributions;
    v13->_recentActivityAttributions = v8;

    -[TVSSSensorActivityController _notifyObserversOfUpdate](v13, "_notifyObserversOfUpdate");
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_notifyObserversOfUpdate
{
  v8[2] = self;
  v8[1] = (id)a2;
  observers = self->_observers;
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  uint64_t v6 = sub_10010697C;
  int v7 = &unk_1001BB2A8;
  v8[0] = self;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:");
  objc_storeStrong(v8, 0LL);
}

+ (id)_filterExcludedAttributions:(id)a3
{
  id v12 = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_100106AD8;
  v9 = &unk_1001BB2C8;
  id v10 = v12;
  id v4 = objc_msgSend(location[0], "bs_filter:", &v5);
  objc_storeStrong(location, 0LL);
  return v4;
}

+ (BOOL)_shouldExcludeAttribution:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v9 = (dispatch_once_t *)&unk_100221DF8;
  id v8 = 0LL;
  objc_storeStrong(&v8, &stru_1001BB2E8);
  if (*v9 != -1) {
    dispatch_once(v9, v8);
  }
  objc_storeStrong(&v8, 0LL);
  id v5 = [location[0] bundleIdentifier];
  unsigned __int8 v4 = [(id)qword_100221E00 containsObject:v5];
  char v6 = v4 & 1;
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

- (NSOrderedSet)activeActivityAttributions
{
  return self->_activeActivityAttributions;
}

- (NSOrderedSet)recentActivityAttributions
{
  return self->_recentActivityAttributions;
}

- (void).cxx_destruct
{
}

@end