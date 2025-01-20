@interface MRDPauseOutputDevicesRequestEndpointOperation
- (MRAVEndpoint)endpoint;
- (MRDPauseOutputDevicesRequestEndpointOperation)initWithEndpoint:(id)a3;
- (MRDPauseOutputDevicesRequestOperation)pauseOperation;
- (NSDate)startDate;
- (NSError)error;
- (NSMutableArray)events;
- (double)duration;
- (void)endEvent:(id)a3 withError:(id)a4;
- (void)setPauseOperation:(id)a3;
- (void)setStartDate:(id)a3;
- (void)startEvent:(id)a3;
@end

@implementation MRDPauseOutputDevicesRequestEndpointOperation

- (MRDPauseOutputDevicesRequestEndpointOperation)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MRDPauseOutputDevicesRequestEndpointOperation;
  v6 = -[MRDPauseOutputDevicesRequestEndpointOperation init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    events = v7->_events;
    v7->_events = v8;
  }

  return v7;
}

- (void)startEvent:(id)a3
{
  id v4 = a3;
  v6 = objc_alloc_init(&OBJC_CLASS___MRDPauseOutputDevicesRequestEndpointOperationEvent);
  -[MRDPauseOutputDevicesRequestEndpointOperationEvent setName:](v6, "setName:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  -[MRDPauseOutputDevicesRequestEndpointOperationEvent setStartDate:](v6, "setStartDate:", v5);

  -[NSMutableArray addObject:](self->_events, "addObject:", v6);
}

- (void)endEvent:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v8 = self->_events;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name", (void)v17));
        unsigned int v15 = [v14 isEqualToString:v6];

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          [v13 setEndDate:v16];

          if ((MRMediaRemoteErrorIsInformational(v7) & 1) == 0) {
            [v13 setError:v7];
          }
        }
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
    }

    while (v10);
  }
}

- (NSError)error
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray msv_firstWhere:](self->_events, "msv_firstWhere:", &stru_10039D4C0));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 error]);

  return (NSError *)v3;
}

- (double)duration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray msv_map:](self->_events, "msv_map:", &stru_10039D500));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray msv_map:](self->_events, "msv_map:", &stru_10039D520));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 sortedArrayUsingComparator:&stru_10039D560]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 sortedArrayUsingComparator:&stru_10039D580]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 lastObject]);

  [v6 timeIntervalSinceDate:v8];
  double v10 = -v9;

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (MRDPauseOutputDevicesRequestOperation)pauseOperation
{
  return self->_pauseOperation;
}

- (void)setPauseOperation:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (MRAVEndpoint)endpoint
{
  return self->_endpoint;
}

- (void).cxx_destruct
{
}

@end