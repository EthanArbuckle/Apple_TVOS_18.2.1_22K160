@interface GKDelayedRequestsNetworkWriter
+ (id)writerWithTransport:(id)a3 forBagKey:(id)a4;
- (GKDataTransport)transport;
- (GKDelayedRequestsNetworkWriter)initWithTransport:(id)a3 forBagKey:(id)a4;
- (NSString)bagKey;
- (void)setBagKey:(id)a3;
- (void)setTransport:(id)a3;
- (void)writeResources:(id)a3 handler:(id)a4;
@end

@implementation GKDelayedRequestsNetworkWriter

+ (id)writerWithTransport:(id)a3 forBagKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[GKDelayedRequestsNetworkWriter initWithTransport:forBagKey:]( objc_alloc(&OBJC_CLASS___GKDelayedRequestsNetworkWriter),  "initWithTransport:forBagKey:",  v6,  v5);

  return v7;
}

- (GKDelayedRequestsNetworkWriter)initWithTransport:(id)a3 forBagKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKDelayedRequestsNetworkWriter;
  v8 = -[GKDelayedRequestsNetworkWriter init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[GKDelayedRequestsNetworkWriter setTransport:](v8, "setTransport:", v6);
    -[GKDelayedRequestsNetworkWriter setBagKey:](v9, "setBagKey:", v7);
  }

  return v9;
}

- (void)writeResources:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 _gkValuesForKeyPath:@"resourceID"]);
  if ((unint64_t)[v8 count] >= 2)
  {
    v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is being asked to submit a delayed request for multiple players:%@. This is not currently supported. Bag key: %@",  v8,  objc_opt_class(self, v9),  self->_bagKey);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v19,  0LL));

    objc_exception_throw(v20);
  }

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue([v6 _gkResourceWithID:*(void *)(*((void *)&v24 + 1) + 8 * (void)v13)]);
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 representedItem]);

        bagKey = self->_bagKey;
        transport = self->_transport;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472LL;
        v22[2] = sub_1000B2EF8;
        v22[3] = &unk_10026BBE8;
        id v23 = v7;
        -[GKDataTransport postRequest:forBagKey:result:](transport, "postRequest:forBagKey:result:", v15, bagKey, v22);

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v11);
  }
}

- (NSString)bagKey
{
  return self->_bagKey;
}

- (void)setBagKey:(id)a3
{
}

- (GKDataTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
}

@end