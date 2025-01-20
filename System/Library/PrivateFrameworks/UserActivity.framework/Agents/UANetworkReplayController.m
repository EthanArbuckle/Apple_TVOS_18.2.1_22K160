@interface UANetworkReplayController
+ (BOOL)createConnection:(id)a3 host:(id)a4 port:(int64_t)a5;
- (BOOL)processCommand:(id)a3;
- (BOOL)sendResponse:(id)a3;
- (BOOL)terminate;
- (NSInputStream)inputStream;
- (NSMutableData)readBuffer;
- (NSMutableData)writeBuffer;
- (NSOutputStream)outputStream;
- (NSString)peerName;
- (NSUUID)peerUUID;
- (UANetworkReplayController)initWithManager:(id)a3 inputStream:(id)a4 outputStream:(id)a5 name:(id)a6;
- (UANetworkReplayController)initWithManager:(id)a3 service:(id)a4;
- (id)statusString;
- (void)setInputStream:(id)a3;
- (void)setOutputStream:(id)a3;
- (void)setPeerName:(id)a3;
- (void)setPeerUUID:(id)a3;
- (void)setReadBuffer:(id)a3;
- (void)setWriteBuffer:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation UANetworkReplayController

- (UANetworkReplayController)initWithManager:(id)a3 inputStream:(id)a4 outputStream:(id)a5 name:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (__CFString *)a6;
  if (v13) {
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"From %@",  v13));
  }
  else {
    v14 = @"From host";
  }
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___UANetworkReplayController;
  v15 = -[UAActivityReplay initWithManager:name:](&v22, "initWithManager:name:", v10, v14);
  if (v13) {

  }
  if (v15)
  {
    -[UANetworkReplayController setPeerName:](v15, "setPeerName:", v13);
    if (v13) {
      v16 = v13;
    }
    else {
      v16 = @"?";
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay pairedPeer](v15, "pairedPeer"));
    [v17 setName:v16];

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    -[UANetworkReplayController setReadBuffer:](v15, "setReadBuffer:", v18);

    -[UANetworkReplayController setInputStream:](v15, "setInputStream:", v11);
    -[UANetworkReplayController setOutputStream:](v15, "setOutputStream:", v12);
    [v11 setDelegate:v15];
    [v12 setDelegate:v15];
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v11 scheduleInRunLoop:v19 forMode:NSRunLoopCommonModes];

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v12 scheduleInRunLoop:v20 forMode:NSRunLoopCommonModes];

    [v11 open];
    [v12 open];
  }

  return v15;
}

- (UANetworkReplayController)initWithManager:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
  if (v8) {
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 name]);
  }
  else {
    v9 = @"Net";
  }
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___UANetworkReplayController;
  id v10 = -[UAActivityReplay initWithManager:name:](&v21, "initWithManager:name:", v6, v9);
  if (v8) {

  }
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    -[UANetworkReplayController setReadBuffer:](v10, "setReadBuffer:", v11);

    id v19 = 0LL;
    id v20 = 0LL;
    if ([v7 getInputStream:&v20 outputStream:&v19])
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 name]);
      id v13 = [v12 copy];
      -[UANetworkReplayController setPeerName:](v10, "setPeerName:", v13);

      -[UANetworkReplayController setInputStream:](v10, "setInputStream:", v20);
      -[UANetworkReplayController setOutputStream:](v10, "setOutputStream:", v19);
      [v20 setDelegate:v10];
      [v19 setDelegate:v10];
      id v14 = v20;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
      [v14 scheduleInRunLoop:v15 forMode:NSRunLoopCommonModes];

      id v16 = v19;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
      [v16 scheduleInRunLoop:v17 forMode:NSRunLoopCommonModes];

      [v20 open];
      [v19 open];
    }
  }

  return v10;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay queue](v7, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100059FCC;
  block[3] = &unk_1000BDEE8;
  id v12 = v7;
  unint64_t v13 = a4;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);

  objc_sync_exit(v7);
}

- (BOOL)processCommand:(id)a3
{
  v4 = (UANetworkReplayController *)a3;
  os_log_t v5 = sub_100039584(0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayController peerName](self, "peerName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayController peerUUID](self, "peerUUID"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    *(_DWORD *)buf = 138478339;
    v82 = v4;
    __int16 v83 = 2113;
    v84 = v7;
    __int16 v85 = 2114;
    v86 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "COMMAND: %{private}@, from %{private}@/%{public}@",  buf,  0x20u);
  }

  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay queue](self, "queue"));
  dispatch_assert_queue_V2(v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](&OBJC_CLASS___NSScanner, "scannerWithString:", v4));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  id v79 = 0LL;
  unsigned int v13 = [v11 scanUpToCharactersFromSet:v12 intoString:&v79];
  id v14 = v79;

  BOOL v15 = 0;
  if (v13 && v14)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 uppercaseString]);

    if (([v16 isEqual:@"HANDOFF"] & 1) != 0
      || [v16 isEqual:@"VERSION"])
    {
      double v78 = 0.0;
      v18 = 0LL;
      if ([v11 scanString:@"v" intoString:0])
      {
        v18 = 0LL;
        if ([v11 scanDouble:&v78])
        {
          double v17 = v78;
          if (v78 >= 53.0)
          {
            id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceCharacterSet",  v78));
            id v77 = 0LL;
            unsigned int v20 = [v11 scanUpToCharactersFromSet:v19 intoString:&v77];
            id v21 = v77;

            v18 = 0LL;
            if (v20) {
              v18 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v21);
            }
          }
        }
      }

      if (objc_msgSend(v16, "isEqual:", @"HANDOFF", v17))
      {
        os_log_t v22 = sub_100039584(0LL);
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = (UANetworkReplayController *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayController peerName](self, "peerName"));
          v25 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v18, "UUIDString"));
          v69 = v4;
          v71 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
          v67 = v11;
          v26 = (void *)objc_claimAutoreleasedReturnValue([v71 uuid]);
          v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUIDString]);
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](self, "uuid"));
          v29 = v16;
          v30 = (void *)objc_claimAutoreleasedReturnValue([v28 UUIDString]);
          *(_DWORD *)buf = 138478595;
          v82 = v24;
          __int16 v83 = 2114;
          v84 = v25;
          __int16 v85 = 2114;
          v86 = v27;
          __int16 v87 = 2114;
          v88 = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "NETWORK: Responding to peer %{private}@/%{public}@ with our UUID, %{public}@, to establish connection from c ontrollerUUID=%{public}@.",  buf,  0x2Au);

          id v16 = v29;
          id v11 = v67;

          v4 = v69;
        }

        v31 = v16;
        if (v18)
        {
          -[UANetworkReplayController setPeerUUID:](self, "setPeerUUID:", v18);
        }

        else
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
          -[UANetworkReplayController setPeerUUID:](self, "setPeerUUID:", v32);
        }

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
        v34 = (void *)objc_claimAutoreleasedReturnValue([v33 uuid]);
        v35 = (void *)objc_claimAutoreleasedReturnValue([v34 UUIDString]);
        v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"VERSION v%g %@\n",  0x4081380000000000LL,  v35));
        -[UANetworkReplayController sendResponse:](self, "sendResponse:", v36);

        id v16 = v31;
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
      v38 = (void *)objc_claimAutoreleasedReturnValue([v37 uuid]);
      unsigned int v39 = -[NSUUID isEqual:](v18, "isEqual:", v38);

      if (v39)
      {
        os_log_t v40 = sub_100039584(0LL);
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = (UANetworkReplayController *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v18, "UUIDString"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](self, "uuid"));
          v44 = v16;
          v45 = (NSUUID *)objc_claimAutoreleasedReturnValue([v43 UUIDString]);
          *(_DWORD *)buf = 138543618;
          v82 = v42;
          __int16 v83 = 2114;
          v84 = v45;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_INFO,  "NETWORK: Destroying replay handler object because the peer's UUID %{public}@ matched our own, controllerUUID=%{public}@.",  buf,  0x16u);

          id v16 = v44;
        }

        -[UANetworkReplayController terminate](self, "terminate");
      }

      else
      {
        if (!v18)
        {
LABEL_47:
          BOOL v15 = 1;
          goto LABEL_48;
        }

        v66 = v16;
        __int128 v75 = 0u;
        __int128 v76 = 0u;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler manager](self, "manager"));
        v47 = (void *)objc_claimAutoreleasedReturnValue([v46 handlers]);

        id v48 = [v47 countByEnumeratingWithState:&v73 objects:v80 count:16];
        if (v48)
        {
          id v49 = v48;
          v68 = v11;
          v70 = v4;
          uint64_t v50 = *(void *)v74;
          while (2)
          {
            for (i = 0LL; i != v49; i = (char *)i + 1)
            {
              if (*(void *)v74 != v50) {
                objc_enumerationMutation(v47);
              }
              v52 = *(void **)(*((void *)&v73 + 1) + 8LL * (void)i);
              uint64_t v53 = objc_opt_class(&OBJC_CLASS___UANetworkReplayController);
              if ((objc_opt_isKindOfClass(v52, v53) & 1) != 0)
              {
                v54 = v52;
                os_log_t v55 = sub_100039584(0LL);
                v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543618;
                  v82 = v54;
                  __int16 v83 = 2114;
                  v84 = v18;
                  _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEBUG,  "-- checking replayController %{public}@ against peerUUID=%{public}@",  buf,  0x16u);
                }

                if (v54 != self)
                {
                  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayController peerUUID](v54, "peerUUID"));
                  unsigned int v58 = -[NSUUID isEqual:](v18, "isEqual:", v57);

                  if (v58)
                  {
                    os_log_t v59 = sub_100039584(0LL);
                    v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                    {
                      v61 = (UANetworkReplayController *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayController peerName](v54, "peerName"));
                      v62 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v18, "UUIDString"));
                      v63 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](self, "uuid"));
                      v64 = (void *)objc_claimAutoreleasedReturnValue([v63 UUIDString]);
                      *(_DWORD *)buf = 138412802;
                      v82 = v61;
                      __int16 v83 = 2114;
                      v84 = v62;
                      __int16 v85 = 2114;
                      v86 = v64;
                      _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "NETWORK: Destroying network replay object to %@ because we already have a different connection t o that peerUUID %{public}@, controllerUUID=%{public}@",  buf,  0x20u);
                    }

                    -[UANetworkReplayController sendResponse:]( self,  "sendResponse:",  @"# Terminating connection because we seem to already have a connection to this peer.\nTERMINATE\n");
                    -[UANetworkReplayController terminate](self, "terminate");

                    v18 = 0LL;
                    goto LABEL_44;
                  }
                }
              }
            }

            id v49 = [v47 countByEnumeratingWithState:&v73 objects:v80 count:16];
            if (v49) {
              continue;
            }
            break;
          }

- (BOOL)sendResponse:(id)a3
{
  id v4 = a3;
  os_log_t v5 = (const char *)[v4 UTF8String];
  int64_t v6 = strlen(v5);
  os_log_t v7 = sub_100039584(0LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = sub_10005BF18(v4);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](self, "uuid"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayController peerName](self, "peerName"));
    int v24 = 138478339;
    v25 = v10;
    __int16 v26 = 2114;
    v27 = v12;
    __int16 v28 = 2113;
    v29 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "COMMANDRESPONSE: %{private}@ (controllerUUID=%{public}@ peerName=%{private}@)",  (uint8_t *)&v24,  0x20u);
  }

  id v14 = self;
  objc_sync_enter(v14);
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayController writeBuffer](v14, "writeBuffer"));
  if ([v15 length])
  {
    id v16 = 0LL;
  }

  else
  {
    double v17 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayController outputStream](v14, "outputStream"));
    id v16 = (char *)[v17 write:v5 maxLength:strlen(v5)];
  }

  BOOL v18 = v6 <= (uint64_t)v16;
  int64_t v19 = v6 - (void)v16;
  if (!v18)
  {
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayController writeBuffer](v14, "writeBuffer"));
    BOOL v21 = v20 == 0LL;

    if (v21)
    {
      os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithBytes:length:]( &OBJC_CLASS___NSMutableData,  "dataWithBytes:length:",  &v16[(void)v5],  v19));
      -[UANetworkReplayController setWriteBuffer:](v14, "setWriteBuffer:", v22);
    }

    else
    {
      os_log_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayController writeBuffer](v14, "writeBuffer"));
      [v22 appendBytes:&v16[(void)v5] length:v19];
    }
  }

  objc_sync_exit(v14);

  return 1;
}

- (id)statusString
{
  if (-[UACornerActionManagerHandler terminated](self, "terminated")) {
    v3 = @"TERMINATED";
  }
  else {
    v3 = &stru_1000BE738;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler name](self, "name"));
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayController peerName](self, "peerName"));
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[UANetworkReplayController peerUUID](self, "peerUUID"));
  os_log_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](self, "uuid"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NetworkReplay:%@%@ peer:%@/%@ %@",  v3,  v4,  v5,  v7,  v9));

  return v10;
}

- (BOOL)terminate
{
  os_log_t v3 = sub_100039584(0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[UACornerActionManagerHandler uuid](self, "uuid"));
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);
    *(_DWORD *)buf = 138543362;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "controllerUUID=%{public}@", buf, 0xCu);
  }

  -[UACornerActionManagerHandler suspend](self, "suspend");
  os_log_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[UAActivityReplay queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B6C8;
  block[3] = &unk_1000BCC58;
  void block[4] = self;
  dispatch_async(v7, block);

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UANetworkReplayController;
  return -[UAActivityReplay terminate](&v9, "terminate");
}

+ (BOOL)createConnection:(id)a3 host:(id)a4 port:(int64_t)a5
{
  id v15 = 0LL;
  id v16 = 0LL;
  id v7 = a4;
  id v8 = a3;
  +[NSStream getStreamsToHostWithName:port:inputStream:outputStream:]( &OBJC_CLASS___NSStream,  "getStreamsToHostWithName:port:inputStream:outputStream:",  v7,  a5,  &v16,  &v15);
  id v9 = v16;
  id v10 = v15;
  id v11 = objc_alloc(&OBJC_CLASS___UANetworkReplayController);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%ld", v7, a5));
  unsigned int v13 = -[UANetworkReplayController initWithManager:inputStream:outputStream:name:]( v11,  "initWithManager:inputStream:outputStream:name:",  v8,  v9,  v10,  v12);

  -[UANetworkReplayController setPeerName:](v13, "setPeerName:", v7);
  [v8 addHandler:v13];

  return 1;
}

- (NSInputStream)inputStream
{
  return (NSInputStream *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setInputStream:(id)a3
{
}

- (NSOutputStream)outputStream
{
  return (NSOutputStream *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setOutputStream:(id)a3
{
}

- (NSMutableData)readBuffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setReadBuffer:(id)a3
{
}

- (NSMutableData)writeBuffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setWriteBuffer:(id)a3
{
}

- (NSString)peerName
{
  return (NSString *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setPeerName:(id)a3
{
}

- (NSUUID)peerUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setPeerUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end