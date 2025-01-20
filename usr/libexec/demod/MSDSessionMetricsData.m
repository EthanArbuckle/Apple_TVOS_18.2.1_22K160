@interface MSDSessionMetricsData
- (MSDSessionMetricsData)initWithData:(id)a3;
- (void)saveToFile:(id)a3;
- (void)writeFileHeaders:(id)a3;
@end

@implementation MSDSessionMetricsData

- (MSDSessionMetricsData)initWithData:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Override %@ in a subclass",  v6));

  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  v7,  0LL));
  objc_exception_throw(v8);
  -[MSDSessionMetricsData saveToFile:](v9, v10, v11);
  return result;
}

- (void)saveToFile:(id)a3
{
  id v4 = a3;
  if (![v4 offsetInFile]) {
    -[MSDSessionMetricsData writeFileHeaders:](self, "writeFileHeaders:", v4);
  }
}

- (void)writeFileHeaders:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"DNSResolutionTime",  @"ConectionEstablishmentTime",  @"TCPConnectionTime",  @"SecureConnectionTime",  @"RequestTime",  @"ResponseTime",  @"RequestBytesSent",  @"ResponseBytesReceived",  0LL));
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      SEL v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"%@,",  *(void *)(*((void *)&v12 + 1) + 8LL * (void)v10));
        SEL v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }

  -[NSMutableString appendString:](v5, "appendString:", @"\n");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString dataUsingEncoding:](v5, "dataUsingEncoding:", 4LL));
  [v3 writeData:v11];
}

@end