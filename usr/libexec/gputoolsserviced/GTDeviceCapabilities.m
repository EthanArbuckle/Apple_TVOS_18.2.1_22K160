@interface GTDeviceCapabilities
- (id)daemonDeviceCapabilities;
- (id)deviceCompatibilityCapabilitiesWithHeapDescriptors:(id)a3;
- (id)inferiorEnvironment:(id)a3;
@end

@implementation GTDeviceCapabilities

- (id)daemonDeviceCapabilities
{
  return DaemonDeviceCapabilities(@"/");
}

- (id)deviceCompatibilityCapabilitiesWithHeapDescriptors:(id)a3
{
  id v3 = a3;
  apr_initialize();
  apr_pool_create_ex(&newpool, 0LL, 0LL, 0LL);
  uint64_t v43 = 0LL;
  uint64_t v44 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"heap-texture-info"]);
  v29 = v4;
  if (v4)
  {
    uint64_t v43 = sub_10001CC70(v4, (uint64_t)newpool, &v42);
    uint64_t v44 = v5;
  }

  else
  {
    char v42 = 0;
  }

  uint64_t v40 = 0LL;
  uint64_t v41 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"heap-acceleration-structure-info"]);
  v28 = v6;
  if (v6)
  {
    uint64_t v40 = sub_10001CA98(v6, (uint64_t)newpool, &v39);
    uint64_t v41 = v7;
  }

  else
  {
    char v39 = 0;
  }

  id v8 = MTLCreateSystemDefaultDevice();
  v30 = v3;
  v27 = v8;
  if (v8)
  {
    id v49 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v49,  1LL,  v8,  v28,  v29,  v3));
  }

  else
  {
    v9 = 0LL;
  }

  v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v32 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        apr_pool_create_ex(&p, 0LL, 0LL, 0LL);
        v14 = sub_10001D108(v13, (uint64_t)p);
        id v15 = sub_10001C8FC((const uint8_t *)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        uint64_t v17 = sub_10001E42C(&v43, (uint64_t)v14, v13);
        uint64_t v18 = sub_10001E74C((uint64_t)&v40, (uint64_t)v14, v13);
        v46[0] = @"device-name";
        v19 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
        v47[0] = v19;
        v47[1] = v16;
        v46[1] = @"capabilities-runtime";
        v46[2] = @"heap-texture-compatibility";
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v17));
        v47[2] = v20;
        v46[3] = @"heap-acceleration-structure-compatibility";
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v18));
        v47[3] = v21;
        v46[4] = @"heap-texture-info-decoded";
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v42 == 0));
        v47[4] = v22;
        v46[5] = @"heap-acceleration-structure-info-decoded";
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v39 == 0));
        v47[5] = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v47,  v46,  6LL));
        -[NSMutableArray addObject:](v33, "addObject:", v24);

        apr_pool_destroy(p);
      }

      id v11 = [obj countByEnumeratingWithState:&v35 objects:v48 count:16];
    }

    while (v11);
  }

  apr_pool_destroy(newpool);
  id v25 = -[NSMutableArray copy](v33, "copy");

  return v25;
}

- (id)inferiorEnvironment:(id)a3
{
  return DaemonCreateGuestAppTransport(a3);
}

@end