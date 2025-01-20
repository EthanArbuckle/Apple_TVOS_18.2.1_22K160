@interface LSDPluginManager
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSDictionary)pluginsByBundleIentifier;
- (NSXPCListener)listener;
- (void)endpointForServiceIdentifier:(id)a3 reply:(id)a4;
- (void)loadPluginsAtURL:(id)a3;
- (void)setListener:(id)a3;
- (void)setPluginsByBundleIentifier:(id)a3;
- (void)startPlugins;
@end

@implementation LSDPluginManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_29);
  }
  return (id)sharedInstance_sharedInstance_1;
}

void __34__LSDPluginManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___LSDPluginManager);
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;
}

- (void)loadPluginsAtURL:(id)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  context = (void *)MEMORY[0x186E2A59C]();
  [MEMORY[0x1896078A8] defaultManager];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v4;
  [v5 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:7 errorHandler:&__block_literal_global_4_0];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189603FC8] dictionary];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v35;
    v11 = @"lsdplugin";
    uint64_t v31 = *(void *)v35;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
        [v13 pathExtension];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        int v15 = [v14 isEqualToString:v11];

        if (!v15)
        {
          v20 = 0LL;
          v17 = 0LL;
          goto LABEL_22;
        }

        [MEMORY[0x1896077F8] bundleWithURL:v13];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (!v16)
        {
          v20 = 0LL;
          goto LABEL_22;
        }

        v18 = v7;
        v19 = v11;
        [v16 bundleIdentifier];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          id v22 = 0LL;
LABEL_16:
          _LSDefaultLog();
          v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v39 = v13;
            __int16 v40 = 2112;
            v41 = v20;
            __int16 v42 = 2112;
            id v43 = v22;
            _os_log_impl( &dword_183E58000,  v25,  OS_LOG_TYPE_DEFAULT,  "Failed to load plugin with URL: %@ bundle identifier %@ error: %@",  buf,  0x20u);
          }

LABEL_19:
          v11 = v19;
          v7 = v18;
          goto LABEL_20;
        }

        id v33 = 0LL;
        char v21 = [v17 loadAndReturnError:&v33];
        id v22 = v33;
        if ((v21 & 1) == 0) {
          goto LABEL_16;
        }
        v23 = (objc_class *)[v17 principalClass];
        id v24 = objc_alloc_init(v23);

        v11 = v19;
        if (!v24)
        {
          v7 = v18;
          goto LABEL_21;
        }

        v7 = v18;
        [v18 setObject:v24 forKey:v20];
        id v22 = v24;
LABEL_20:

LABEL_21:
        uint64_t v10 = v31;
LABEL_22:
        v26 = (NSDictionary *)[v7 copy];
        pluginsByBundleIentifier = self->_pluginsByBundleIentifier;
        self->_pluginsByBundleIentifier = v26;

        ++v12;
      }

      while (v9 != v12);
      uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
      uint64_t v9 = v28;
    }

    while (v28);
  }

  objc_autoreleasePoolPop(context);
}

uint64_t __37__LSDPluginManager_loadPluginsAtURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  _LSDefaultLog();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl( &dword_183E58000,  v6,  OS_LOG_TYPE_DEFAULT,  "Error enumerating URL: %@ error: %@",  (uint8_t *)&v8,  0x16u);
  }

  return 1LL;
}

- (void)startPlugins
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v3 = self->_pluginsByBundleIentifier;
  uint64_t v4 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        -[NSDictionary objectForKey:]( self->_pluginsByBundleIentifier,  "objectForKey:",  *(void *)(*((void *)&v12 + 1) + 8 * v7),  (void)v12);
        int v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 start];

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v5);
  }

  [(id)__LSDefaultsGetSharedInstance() serviceNameForConnectionType:4];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v10 = (NSXPCListener *)[objc_alloc(MEMORY[0x189607B50]) initWithMachServiceName:v9];
  listener = self->_listener;
  self->_listener = v10;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x189607B48];
  id v6 = a4;
  [v5 interfaceWithProtocol:&unk_18C685288];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setExportedInterface:v7];
  [v6 setExportedObject:self];
  [v6 resume];

  return 1;
}

- (void)endpointForServiceIdentifier:(id)a3 reply:(id)a4
{
  pluginsByBundleIentifier = self->_pluginsByBundleIentifier;
  id v6 = (void (**)(id, void *))a4;
  -[NSDictionary objectForKey:](pluginsByBundleIentifier, "objectForKey:", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 XPCListenerEndpoint];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);
}

- (NSDictionary)pluginsByBundleIentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPluginsByBundleIentifier:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end