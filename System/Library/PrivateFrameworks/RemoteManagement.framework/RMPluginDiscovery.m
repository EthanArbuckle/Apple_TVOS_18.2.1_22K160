@interface RMPluginDiscovery
+ (id)_discoverJSONFilesInDirectory:(id)a3;
+ (id)_searchPaths;
+ (id)discoverPluginsWithType:(id)a3 checkValidURL:(id)a4;
+ (void)loadDynamicSchemasInPlugins;
@end

@implementation RMPluginDiscovery

+ (id)discoverPluginsWithType:(id)a3 checkValidURL:(id)a4
{
  id v39 = a3;
  v41 = (uint64_t (**)(id, void *))a4;
  v40 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([a1 _searchPaths]);
  id v37 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v49;
    v7 = @"xpc";
    v8 = &APSEnvironmentDevelopment_ptr;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v49 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v9;
        v10 = *(void **)(*((void *)&v48 + 1) + 8 * v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        v12 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 contentsOfDirectoryAtPath:v12 error:0]);

        __int128 v46 = 0u;
        __int128 v47 = 0u;
        __int128 v44 = 0u;
        __int128 v45 = 0u;
        id v43 = v13;
        id v14 = [v43 countByEnumeratingWithState:&v44 objects:v56 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v45;
          v42 = v10;
          do
          {
            for (i = 0LL; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v45 != v16) {
                objc_enumerationMutation(v43);
              }
              v18 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
              v19 = (void *)objc_claimAutoreleasedReturnValue([v18 pathExtension]);
              unsigned int v20 = [v19 isEqualToString:v7];

              if (v20)
              {
                v21 = v8[117];
                v22 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByDeletingPathExtension]);
                LODWORD(v21) = [v21 isAllowedXPCServiceName:v22];

                if ((_DWORD)v21)
                {
                  v23 = (void *)objc_claimAutoreleasedReturnValue([v10 URLByAppendingPathComponent:v18]);
                  if (-[NSMutableSet containsObject:](v6, "containsObject:", v18))
                  {
                    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog pluginDiscovery](&OBJC_CLASS___RMLog, "pluginDiscovery"));
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                    {
                      v31 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
                      *(_DWORD *)buf = 138543618;
                      id v53 = v39;
                      __int16 v54 = 2114;
                      v55 = v31;
                      _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Ignoring duplicate XPC service (%{public}@) plugin: %{public}@",  buf,  0x16u);
                    }
                  }

                  else
                  {
                    v25 = v7;
                    v26 = v8;
                    v27 = v6;
                    int v28 = v41[2](v41, v23);
                    v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog pluginDiscovery](&OBJC_CLASS___RMLog, "pluginDiscovery"));
                    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
                    if (v28)
                    {
                      if (v30)
                      {
                        v32 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
                        *(_DWORD *)buf = 138543618;
                        id v53 = v39;
                        __int16 v54 = 2114;
                        v55 = v32;
                        _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Found XPC service (%{public}@) plugin: %{public}@",  buf,  0x16u);
                      }

                      -[NSMutableArray addObject:](v40, "addObject:", v23);
                      v6 = v27;
                      -[NSMutableSet addObject:](v27, "addObject:", v18);
                    }

                    else
                    {
                      if (v30)
                      {
                        v33 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
                        *(_DWORD *)buf = 138543618;
                        id v53 = v39;
                        __int16 v54 = 2114;
                        v55 = v33;
                        _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Ignoring XPC service (%{public}@) plugin: %{public}@",  buf,  0x16u);
                      }

                      v6 = v27;
                    }

                    v8 = v26;
                    v7 = v25;
                    v10 = v42;
                  }
                }
              }
            }

            id v15 = [v43 countByEnumeratingWithState:&v44 objects:v56 count:16];
          }

          while (v15);
        }

        uint64_t v9 = v38 + 1;
      }

      while ((id)(v38 + 1) != v37);
      id v37 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
    }

    while (v37);
  }

  return v40;
}

+ (id)_searchPaths
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RMLocations xpcServiceDirectoryURL](&OBJC_CLASS___RMLocations, "xpcServiceDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v2));

  return v3;
}

+ (void)loadDynamicSchemasInPlugins
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100051404;
  v8[3] = &unk_1000BA5E0;
  v5 = v3;
  uint64_t v9 = v5;
  id v11 = a1;
  v6 = v4;
  v10 = v6;
  id v7 = [a1 discoverPluginsWithType:@"Schema" checkValidURL:v8];
  if (-[NSMutableArray count](v5, "count")) {
    +[RMModelConfigurationSchema loadDynamicSchemaFromFiles:]( &OBJC_CLASS___RMModelConfigurationSchema,  "loadDynamicSchemaFromFiles:",  v5);
  }
  if (-[NSMutableArray count](v6, "count")) {
    +[RMModelStatusSchema loadDynamicSchemaFromFiles:]( &OBJC_CLASS___RMModelStatusSchema,  "loadDynamicSchemaFromFiles:",  v6);
  }
}

+ (id)_discoverJSONFilesInDirectory:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 contentsOfDirectoryAtPath:v6 error:0]);

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 pathExtension]);
        unsigned int v15 = [v14 isEqualToString:@"json"];

        if (v15)
        {
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:v13]);
          -[NSMutableArray addObject:](v4, "addObject:", v16);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog pluginDiscovery](&OBJC_CLASS___RMLog, "pluginDiscovery"));
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            sub_100051778(v23, v16, &v24, v17);
          }
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }

    while (v10);
  }

  return v4;
}

@end