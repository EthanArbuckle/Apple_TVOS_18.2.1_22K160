@interface _HHDJobLauncher
- (OS_dispatch_queue)queue;
- (_HHDJobLauncher)initWithQueue:(id)a3;
- (id)serviceToActiveInstancesForServices:(id)a3;
- (int)createServiceInstanceWithName:(id)a3 instanceId:(id)a4;
- (void)removeServiceInstanceWithName:(id)a3 instanceId:(id)a4 callback:(id)a5;
@end

@implementation _HHDJobLauncher

- (_HHDJobLauncher)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____HHDJobLauncher;
  v6 = -[_HHDJobLauncher init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (int)createServiceInstanceWithName:(id)a3 instanceId:(id)a4
{
  id v5 = a3;
  [a4 getUUIDBytes:v9];
  id v6 = v5;
  id v7 = [v6 UTF8String];

  return launch_service_instance_create(v7, v9);
}

- (void)removeServiceInstanceWithName:(id)a3 instanceId:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [a4 getUUIDBytes:v13];
  id v10 = v9;
  id v11 = [v10 UTF8String];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_HHDJobLauncher queue](self, "queue"));
  launch_service_instance_remove(v11, v13, v12, v8);
}

- (id)serviceToActiveInstancesForServices:(id)a3
{
  id v3 = a3;
  v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  unsigned int v24 = 0;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v20 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v9 = (void *)launch_service_instance_copy_uuids([v8 UTF8String], &v24);
        size_t count = xpc_array_get_count(v9);
        if (v24 || (size_t v11 = count) == 0)
        {
          id v15 = sub_1000153D4();
          v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = xpc_strerror(v24);
            *(_DWORD *)buf = 138412802;
            v26 = &stru_100024E50;
            __int16 v27 = 2114;
            id v28 = v8;
            __int16 v29 = 2080;
            uint64_t v30 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%@No instances for service %{public}@ with error %s.",  buf,  0x20u);
          }
        }

        else
        {
          v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          size_t v13 = 0LL;
          do
          {
            v14 = -[NSUUID initWithUUIDBytes:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDBytes:",  xpc_array_get_uuid(v9, v13));
            if (v14) {
              -[os_log_s addObject:](v12, "addObject:", v14);
            }

            ++v13;
          }

          while (v11 != v13);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v12, v8);
        }
      }

      id v5 = [obj countByEnumeratingWithState:&v20 objects:v31 count:16];
    }

    while (v5);
  }

  return v18;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end