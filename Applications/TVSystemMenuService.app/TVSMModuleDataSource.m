@interface TVSMModuleDataSource
- (BOOL)shouldEnableModuleWithInfo:(id)a3;
- (NSArray)availableModules;
- (NSMutableDictionary)modulesByInfo;
- (TVSMModuleDataSource)init;
- (TVSMModuleDataSource)initWithModuleType:(int64_t)a3;
- (TVSMModuleDataSource)initWithModuleType:(int64_t)a3 shouldUpdateAvailableModules:(BOOL)a4;
- (id)_moduleWithInfo:(id)a3;
- (id)sortedModuleInfos:(id)a3;
- (int64_t)type;
- (void)_updateAvailableModules;
- (void)setAvailableModules:(id)a3;
- (void)setModulesByInfo:(id)a3;
- (void)updateAvailableModules;
@end

@implementation TVSMModuleDataSource

- (TVSMModuleDataSource)init
{
  v4 = 0LL;
  v4 = -[TVSMModuleDataSource initWithModuleType:](self, "initWithModuleType:", -1LL);
  v3 = v4;
  objc_storeStrong((id *)&v4, 0LL);
  return v3;
}

- (TVSMModuleDataSource)initWithModuleType:(int64_t)a3
{
  v5 = 0LL;
  v5 = -[TVSMModuleDataSource initWithModuleType:shouldUpdateAvailableModules:]( self,  "initWithModuleType:shouldUpdateAvailableModules:",  a3,  1LL);
  v4 = v5;
  objc_storeStrong((id *)&v5, 0LL);
  return v4;
}

- (TVSMModuleDataSource)initWithModuleType:(int64_t)a3 shouldUpdateAvailableModules:(BOOL)a4
{
  SEL v12 = a2;
  int64_t v11 = a3;
  BOOL v10 = a4;
  v13 = 0LL;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSMModuleDataSource;
  v8 = -[TVSMModuleDataSource init](&v9, "init");
  v13 = v8;
  objc_storeStrong((id *)&v13, v8);
  if (v8)
  {
    v13->_type = v11;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    modulesByInfo = v13->_modulesByInfo;
    v13->_modulesByInfo = v4;

    objc_storeStrong((id *)&v13->_availableModules, &__NSArray0__struct);
    if (v10) {
      -[TVSMModuleDataSource _updateAvailableModules](v13, "_updateAvailableModules");
    }
  }

  v7 = v13;
  objc_storeStrong((id *)&v13, 0LL);
  return v7;
}

- (BOOL)shouldEnableModuleWithInfo:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
  return 1;
}

- (id)sortedModuleInfos:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = location[0];
  objc_storeStrong(location, 0LL);
  return v4;
}

- (void)updateAvailableModules
{
}

- (void)_updateAvailableModules
{
  ptr = self;
  log[1] = (os_log_t)a2;
  log[0] = (os_log_t)(id)data_source_log();
  char v49 = 1;
  v29 = (os_log_s *)(id)data_source_log();
  os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v29, ptr);

  os_signpost_id_t v48 = v30;
  if (v30 && v48 != -1LL && os_signpost_enabled(log[0]))
  {
    v26 = log[0];
    os_signpost_type_t type = v49;
    os_signpost_id_t spid = v48;
    sub_10000BF94(v47);
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  type,  spid,  "GetAvailableModules",  (const char *)&unk_100046F3F,  v47,  2u);
  }

  objc_storeStrong((id *)log, 0LL);
  id v46 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v45 = +[_TVSMModuleInfo allModuleInfos](&OBJC_CLASS____TVSMModuleInfo, "allModuleInfos");
  memset(__b, 0, sizeof(__b));
  id obj = v45;
  id v25 = [obj countByEnumeratingWithState:__b objects:v53 count:16];
  if (v25)
  {
    uint64_t v21 = *(void *)__b[2];
    uint64_t v22 = 0LL;
    id v23 = v25;
    while (1)
    {
      uint64_t v20 = v22;
      if (*(void *)__b[2] != v21) {
        objc_enumerationMutation(obj);
      }
      id v44 = *(id *)(__b[1] + 8 * v22);
      id v2 = [v44 type];
      if (v2 == *((id *)ptr + 1) && ([ptr shouldEnableModuleWithInfo:v44] & 1) != 0)
      {
        id v19 = [*((id *)ptr + 3) objectForKey:v44];
        char v40 = 0;
        if (v19)
        {
          id v3 = v19;
        }

        else
        {
          id v41 = [ptr _moduleWithInfo:v44];
          char v40 = 1;
          id v3 = v41;
        }

        id location = v3;
        if ((v40 & 1) != 0) {

        }
        if (location)
        {
          [v46 addObject:v44];
          [*((id *)ptr + 3) setObject:location forKey:v44];
          int v39 = 0;
        }

        else
        {
          int v39 = 3;
        }

        objc_storeStrong(&location, 0LL);
      }

      ++v22;
      if (v20 + 1 >= (unint64_t)v23)
      {
        uint64_t v22 = 0LL;
        id v23 = [obj countByEnumeratingWithState:__b objects:v53 count:16];
        if (!v23) {
          break;
        }
      }
    }
  }

  os_log_t v38 = (os_log_t)(id)data_source_log();
  char v37 = 2;
  v17 = (os_log_s *)(id)data_source_log();
  os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, ptr);

  os_signpost_id_t v36 = v18;
  if (v18 && v36 != -1LL && os_signpost_enabled(v38))
  {
    v14 = v38;
    os_signpost_type_t v15 = v37;
    os_signpost_id_t v16 = v36;
    sub_10000BF94(v35);
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v14,  v15,  v16,  "GetAvailableModules",  (const char *)&unk_100046F3F,  v35,  2u);
  }

  objc_storeStrong((id *)&v38, 0LL);
  id v34 = [ptr sortedModuleInfos:v46];
  v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  memset(v31, 0, sizeof(v31));
  id v12 = v34;
  id v13 = [v12 countByEnumeratingWithState:v31 objects:v52 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)v31[2];
    uint64_t v10 = 0LL;
    id v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)v31[2] != v9) {
        objc_enumerationMutation(v12);
      }
      uint64_t v32 = *(void *)(v31[1] + 8 * v10);
      v6 = v33;
      id v7 = [*((id *)ptr + 3) objectForKey:v32];
      -[NSMutableArray addObject:](v6, "addObject:");

      ++v10;
      if (v8 + 1 >= (unint64_t)v11)
      {
        uint64_t v10 = 0LL;
        id v11 = [v12 countByEnumeratingWithState:v31 objects:v52 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  id v4 = ptr;
  id v5 = -[NSMutableArray copy](v33, "copy");
  objc_msgSend(v4, "setAvailableModules:");

  objc_storeStrong((id *)&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong(&v46, 0LL);
}

- (id)_moduleWithInfo:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  char v10 = 1;
  id v7 = objc_alloc(&OBJC_CLASS___NSBundle);
  id v8 = [location[0] bundleURL];
  id v9 = -[NSBundle initWithURL:](v7, "initWithURL:");

  if ((v10 & 1) != 0)
  {
    id v3 = objc_alloc_init((Class)[v9 principalClass]);
    id v4 = v11;
    id v11 = v3;
  }

  id v6 = v11;
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)availableModules
{
  return self->_availableModules;
}

- (void)setAvailableModules:(id)a3
{
}

- (NSMutableDictionary)modulesByInfo
{
  return self->_modulesByInfo;
}

- (void)setModulesByInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end