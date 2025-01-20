@interface MSDSessionTransactionData
- (MSDSessionTransactionData)initWithData:(id)a3;
- (NSMutableDictionary)data;
- (void)saveToFile:(id)a3;
- (void)setData:(id)a3;
@end

@implementation MSDSessionTransactionData

- (MSDSessionTransactionData)initWithData:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___MSDSessionTransactionData;
  v5 = -[MSDSessionTransactionData init](&v46, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[MSDSessionTransactionData setData:](v5, "setData:", v6);

    v7 = objc_alloc(&OBJC_CLASS___MSDSessionTimeIntervalDataPoint);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 domainLookupStartDate]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 domainLookupEndDate]);
    v45 = -[MSDSessionTimeIntervalDataPoint initWithStartTime:endTime:](v7, "initWithStartTime:endTime:", v8, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    [v10 setObject:v45 forKey:@"DNSResolutionTime"];

    v11 = objc_alloc(&OBJC_CLASS___MSDSessionTimeIntervalDataPoint);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 connectStartDate]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 connectEndDate]);
    v14 = -[MSDSessionTimeIntervalDataPoint initWithStartTime:endTime:](v11, "initWithStartTime:endTime:", v12, v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    [v15 setObject:v14 forKey:@"ConectionEstablishmentTime"];

    v16 = objc_alloc(&OBJC_CLASS___MSDSessionTimeIntervalDataPoint);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v4 connectStartDate]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v4 secureConnectionStartDate]);
    v19 = -[MSDSessionTimeIntervalDataPoint initWithStartTime:endTime:](v16, "initWithStartTime:endTime:", v17, v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    [v20 setObject:v19 forKey:@"TCPConnectionTime"];

    v21 = objc_alloc(&OBJC_CLASS___MSDSessionTimeIntervalDataPoint);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v4 secureConnectionStartDate]);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v4 secureConnectionEndDate]);
    v24 = -[MSDSessionTimeIntervalDataPoint initWithStartTime:endTime:](v21, "initWithStartTime:endTime:", v22, v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    [v25 setObject:v24 forKey:@"SecureConnectionTime"];

    v26 = objc_alloc(&OBJC_CLASS___MSDSessionTimeIntervalDataPoint);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v4 requestStartDate]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v4 requestEndDate]);
    v29 = -[MSDSessionTimeIntervalDataPoint initWithStartTime:endTime:](v26, "initWithStartTime:endTime:", v27, v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    [v30 setObject:v29 forKey:@"RequestTime"];

    v31 = objc_alloc(&OBJC_CLASS___MSDSessionTimeIntervalDataPoint);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v4 responseStartDate]);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v4 responseEndDate]);
    v34 = -[MSDSessionTimeIntervalDataPoint initWithStartTime:endTime:](v31, "initWithStartTime:endTime:", v32, v33);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    [v35 setObject:v34 forKey:@"ResponseTime"];

    v36 = (char *)[v4 countOfRequestHeaderBytesSent];
    v37 = &v36[(void)[v4 countOfRequestBodyBytesSent]];
    v38 = (char *)[v4 countOfResponseHeaderBytesReceived];
    v39 = &v38[(void)[v4 countOfResponseBodyBytesReceived]];
    v40 = -[MSDSessionCountDataPoint initWithCount:]( objc_alloc(&OBJC_CLASS___MSDSessionCountDataPoint),  "initWithCount:",  v37);
    v41 = -[MSDSessionCountDataPoint initWithCount:]( objc_alloc(&OBJC_CLASS___MSDSessionCountDataPoint),  "initWithCount:",  v39);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    [v42 setObject:v40 forKey:@"RequestBytesSent"];

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](v5, "data"));
    [v43 setObject:v41 forKey:@"ResponseBytesReceived"];
  }

  return v5;
}

- (void)saveToFile:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___MSDSessionTransactionData;
  id v16 = a3;
  -[MSDSessionMetricsData saveToFile:](&v21, "saveToFile:");
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"DNSResolutionTime",  @"ConectionEstablishmentTime",  @"TCPConnectionTime",  @"SecureConnectionTime",  @"RequestTime",  @"ResponseTime",  @"RequestBytesSent",  @"ResponseBytesReceived",  0LL));
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTransactionData data](self, "data"));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v11]);

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 print]);
          -[NSMutableString appendFormat:](v5, "appendFormat:", @"%@,", v14);
        }

        else
        {
          -[NSMutableString appendString:](v5, "appendString:", @" ,");
        }

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v8);
  }

  -[NSMutableString appendString:](v5, "appendString:", @"\n");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString dataUsingEncoding:](v5, "dataUsingEncoding:", 4LL));
  [v16 writeData:v15];
}

- (NSMutableDictionary)data
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end