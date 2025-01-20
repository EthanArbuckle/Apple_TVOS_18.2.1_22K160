@interface GKDelayedSetPhotoNetworkWriter
+ (id)writerWithTransport:(id)a3 forBagKey:(id)a4;
- (GKDataTransport)transport;
- (GKDelayedSetPhotoNetworkWriter)initWithTransport:(id)a3 forBagKey:(id)a4;
- (NSNumber)avatarType;
- (NSString)bagKey;
- (void)setAvatarType:(id)a3;
- (void)setBagKey:(id)a3;
- (void)setTransport:(id)a3;
- (void)uploadImageData:(id)a3 toURL:(id)a4 handler:(id)a5;
- (void)uploadProfileImageMetadata:(id)a3 fromUploadURL:(id)a4 handler:(id)a5;
- (void)writeResources:(id)a3 handler:(id)a4;
@end

@implementation GKDelayedSetPhotoNetworkWriter

+ (id)writerWithTransport:(id)a3 forBagKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[GKDelayedSetPhotoNetworkWriter initWithTransport:forBagKey:]( objc_alloc(&OBJC_CLASS___GKDelayedSetPhotoNetworkWriter),  "initWithTransport:forBagKey:",  v6,  v5);

  return v7;
}

- (GKDelayedSetPhotoNetworkWriter)initWithTransport:(id)a3 forBagKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___GKDelayedSetPhotoNetworkWriter;
  v8 = -[GKDelayedSetPhotoNetworkWriter init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[GKDelayedSetPhotoNetworkWriter setTransport:](v8, "setTransport:", v6);
    -[GKDelayedSetPhotoNetworkWriter setBagKey:](v9, "setBagKey:", v7);
  }

  return v9;
}

- (void)writeResources:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 _gkValuesForKeyPath:@"resourceID"]);
  id v9 = [v8 count];
  if ((unint64_t)v9 >= 2)
  {
    uint64_t v22 = objc_opt_class(self, v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKDelayedSetPhotoNetworkWriter bagKey](self, "bagKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is being asked to submit a delayed request for multiple players:%@. This is not currently supported. Bag key: %@",  v8,  v22,  v23));
    id v25 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v24,  0LL));

    objc_exception_throw(v25);
    sub_1000B01C0(v26, v27);
  }

  else
  {
    if (!os_log_GKGeneral) {
      id v11 = (id)GKOSLoggers(v9);
    }
    v12 = (os_log_s *)os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "GKDelayedSetPhotoNetworkWriter: starting avatar image upload process.",  buf,  2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKDelayedSetPhotoNetworkWriter.m",  57LL,  "-[GKDelayedSetPhotoNetworkWriter writeResources:handler:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v13));

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000B01C0;
    v32[3] = &unk_10026BEC8;
    id v33 = v8;
    id v34 = v6;
    v35 = self;
    id v15 = v14;
    id v36 = v15;
    id v16 = v6;
    id v17 = v8;
    [v15 perform:v32];
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000B049C;
    v28[3] = &unk_10026B1E8;
    v30 = self;
    id v31 = v7;
    id v29 = v15;
    id v20 = v7;
    id v21 = v15;
    [v21 notifyOnQueue:v19 block:v28];
  }

- (void)uploadImageData:(id)a3 toURL:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKDelayedSetPhotoNetworkWriter.m",  97LL,  "-[GKDelayedSetPhotoNetworkWriter uploadImageData:toURL:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v11));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1000B071C;
  v26[3] = &unk_10026B080;
  id v13 = v9;
  id v27 = v13;
  id v28 = v8;
  id v14 = v12;
  id v29 = v14;
  id v15 = v8;
  [v14 perform:v26];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000B0D2C;
  v21[3] = &unk_10026B0F8;
  id v22 = v14;
  v23 = self;
  id v24 = v13;
  id v25 = v10;
  id v18 = v10;
  id v19 = v13;
  id v20 = v14;
  [v20 notifyOnQueue:v17 block:v21];
}

- (void)uploadProfileImageMetadata:(id)a3 fromUploadURL:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKDelayedSetPhotoNetworkWriter.m",  163LL,  "-[GKDelayedSetPhotoNetworkWriter uploadProfileImageMetadata:fromUploadURL:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[GKDispatchGroup dispatchGroupWithName:]( &OBJC_CLASS___GKDispatchGroup,  "dispatchGroupWithName:",  v11));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000B0F60;
  v21[3] = &unk_10026BEC8;
  id v13 = v9;
  id v22 = v13;
  id v14 = v8;
  id v23 = v14;
  id v24 = self;
  id v15 = v12;
  id v25 = v15;
  [v15 perform:v21];
  if (v10)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000B1378;
    v18[3] = &unk_10026B030;
    id v20 = v10;
    id v19 = v15;
    [v19 notifyOnQueue:v17 block:v18];
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

- (NSNumber)avatarType
{
  return self->_avatarType;
}

- (void)setAvatarType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end