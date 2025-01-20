@interface MRDPauseOutputDevicesRequestReport
- (MRDPauseOutputDevicesRequestReport)initWithOutputDevices:(id)a3 requestID:(id)a4;
- (NSArray)outputDevices;
- (NSDate)startDate;
- (NSError)error;
- (NSMutableArray)operations;
- (NSString)requestID;
- (double)duration;
- (id)description;
- (int)appletvsEffected;
- (int)devicesForcedRemoved;
- (int)devicesPaused;
- (int)devicesRemoved;
- (int)endpointsForcedRemoved;
- (int)endpointsPaused;
- (int)endpointsRemoved;
- (int)homepodsEffected;
- (void)addOperation:(id)a3;
@end

@implementation MRDPauseOutputDevicesRequestReport

- (MRDPauseOutputDevicesRequestReport)initWithOutputDevices:(id)a3 requestID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MRDPauseOutputDevicesRequestReport;
  v9 = -[MRDPauseOutputDevicesRequestReport init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestID, a4);
    objc_storeStrong((id *)&v10->_outputDevices, a3);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    operations = v10->_operations;
    v10->_operations = v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    startDate = v10->_startDate;
    v10->_startDate = (NSDate *)v13;
  }

  return v10;
}

- (void)addOperation:(id)a3
{
  id v5 = a3;
  v4 = self->_operations;
  objc_sync_enter(v4);
  -[NSMutableArray addObject:](self->_operations, "addObject:", v5);
  objc_sync_exit(v4);
}

- (NSError)error
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray msv_firstWhere:](self->_operations, "msv_firstWhere:", &stru_10039D5C0));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 error]);

  return (NSError *)v3;
}

- (double)duration
{
  return -v2;
}

- (int)homepodsEffected
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  double v2 = self->_operations;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v3)
  {
    id v4 = v3;
    LODWORD(v5) = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)i), "pauseOperation", (void)v12));
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 relevantOutputDevices]);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "msv_filter:", &stru_10039D5E0));
        id v5 = (char *)[v10 count] + (int)v5;
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v4);
  }

  else
  {
    LODWORD(v5) = 0;
  }

  return (int)v5;
}

- (int)appletvsEffected
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  double v2 = self->_operations;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v3)
  {
    id v4 = v3;
    LODWORD(v5) = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)i), "pauseOperation", (void)v12));
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 relevantOutputDevices]);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "msv_filter:", &stru_10039D600));
        id v5 = (char *)[v10 count] + (int)v5;
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v4);
  }

  else
  {
    LODWORD(v5) = 0;
  }

  return (int)v5;
}

- (int)endpointsForcedRemoved
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  double v2 = self->_operations;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)i), "pauseOperation", (void)v11));
        id v9 = [v8 type];

        if (v9 == (id)3) {
          ++v5;
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v4);
  }

  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)devicesForcedRemoved
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  double v2 = self->_operations;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pauseOperation", (void)v14));
        id v10 = [v9 type];

        if (v10 == (id)3)
        {
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 pauseOperation]);
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 relevantOutputDevices]);
          v5 += [v12 count];
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v4);
  }

  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)endpointsRemoved
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  double v2 = self->_operations;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)i), "pauseOperation", (void)v11));
        id v9 = [v8 type];

        if (v9 == (id)2) {
          ++v5;
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v4);
  }

  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)devicesRemoved
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  double v2 = self->_operations;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pauseOperation", (void)v14));
        id v10 = [v9 type];

        if (v10 == (id)2)
        {
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 pauseOperation]);
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 relevantOutputDevices]);
          v5 += [v12 count];
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v4);
  }

  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)endpointsPaused
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  double v2 = self->_operations;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)i), "pauseOperation", (void)v11));
        id v9 = [v8 type];

        if (v9 == (id)1) {
          ++v5;
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v4);
  }

  else
  {
    int v5 = 0;
  }

  return v5;
}

- (int)devicesPaused
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  double v2 = self->_operations;
  id v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pauseOperation", (void)v14));
        id v10 = [v9 type];

        if (v10 == (id)1)
        {
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v8 pauseOperation]);
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 relevantOutputDevices]);
          v5 += [v12 count];
        }
      }

      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v2,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v4);
  }

  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)description
{
  id v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@ Report\n",  @"MRDPauseOutputDevicesRequest.pauseOutputDeviceUIDs");
  -[NSMutableString appendString:](v3, "appendString:", @"----------------------------------\n");
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Identifier: %@\n", self->_requestID);
  -[MRDPauseOutputDevicesRequestReport duration](self, "duration");
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"Duration: %lf seconds\n", v4);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"outputDevices = %@\n", self->_outputDevices);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  obj = self->_operations;
  id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
  if (v36)
  {
    uint64_t v35 = *(void *)v43;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v5;
        uint64_t v6 = *(void **)(*((void *)&v42 + 1) + 8 * v5);
        -[NSMutableString appendFormat:](v3, "appendFormat:", @"{\n");
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 pauseOperation]);
        unint64_t v8 = (unint64_t)[v7 type];
        id v9 = @"?";
        if (v8 <= 4) {
          id v9 = off_10039D620[v8];
        }
        -[NSMutableString appendFormat:](v3, "appendFormat:", @" Operation: %@\n", v9);

        id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 pauseOperation]);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 reason]);
        -[NSMutableString appendFormat:](v3, "appendFormat:", @" Reason: %@\n", v11);

        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 endpoint]);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 debugName]);
        -[NSMutableString appendFormat:](v3, "appendFormat:", @" Endpoint: %@\n", v13);

        [v6 duration];
        -[NSMutableString appendFormat:](v3, "appendFormat:", @" Duration: %lf\n", v14);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 pauseOperation]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 relevantOutputDevices]);
        id v17 = [v16 count];

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v6 pauseOperation]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v18 relevantOutputDeviceUIDs]);
          -[NSMutableString appendFormat:](v3, "appendFormat:", @" RelevantOuptutDevices: %@\n", v19);

          v20 = (void *)objc_claimAutoreleasedReturnValue([v6 pauseOperation]);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 devicesInGroup]);
          -[NSMutableString appendFormat:](v3, "appendFormat:", @" DevicesInGroup: %@\n", v21);
        }

        -[NSMutableString appendFormat:](v3, "appendFormat:", @" Events:\n");
        __int128 v40 = 0u;
        __int128 v41 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        v22 = (void *)objc_claimAutoreleasedReturnValue([v6 events]);
        id v23 = [v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v39;
          do
          {
            for (i = 0LL; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v39 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
              v28 = (void *)objc_claimAutoreleasedReturnValue([v27 error]);

              v29 = (void *)objc_claimAutoreleasedReturnValue([v27 name]);
              [v27 duration];
              uint64_t v31 = v30;
              if (v28)
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue([v27 error]);
                -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"    %@ : %lf seconds : %@\n",  v29,  v31,  v32);
              }

              else
              {
                -[NSMutableString appendFormat:](v3, "appendFormat:", @"    %@ : %lf seconds\n", v29, v30);
              }
            }

            id v24 = [v22 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }

          while (v24);
        }

        -[NSMutableString appendFormat:](v3, "appendFormat:", @"}\n");
        uint64_t v5 = v37 + 1;
      }

      while ((id)(v37 + 1) != v36);
      id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v42,  v47,  16LL);
    }

    while (v36);
  }

  -[NSMutableString appendString:](v3, "appendString:", @"----------------------------------\n");
  return v3;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (NSMutableArray)operations
{
  return self->_operations;
}

- (void).cxx_destruct
{
}

@end