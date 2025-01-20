@interface MRDTransactionServer
- (MRDTransactionServer)init;
- (NSMutableArray)transactions;
- (unint64_t)transactionRequestingMemorySize:(id)a3;
- (void)_sendContentItemTransaction:(id)a3 request:(id)a4 playerPath:(id)a5;
- (void)adjustMemory:(int64_t)a3;
- (void)collectDiagnostic:(id)a3;
- (void)handleContentItemTransaction:(id)a3 packets:(id)a4 group:(id)a5;
- (void)handlePlaybackQueueRequestTransaction:(id)a3 packets:(id)a4 group:(id)a5;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)sendContentItemTransaction:(id)a3 request:(id)a4 playerPath:(id)a5;
- (void)sendContentItemTransactionWithPlaybackQueue:(id)a3 request:(id)a4 playerPath:(id)a5;
- (void)transaction:(id)a3 didReceivePackets:(id)a4 receivedSize:(unint64_t)a5 requestedSize:(unint64_t)a6 queue:(id)a7 completion:(id)a8;
- (void)transactionDidEnd:(id)a3 bytesRemaining:(unint64_t)a4;
@end

@implementation MRDTransactionServer

- (MRDTransactionServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRDTransactionServer;
  v2 = -[MRDTransactionServer init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MediaRemote.transactionServer", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
    v2->_allowedMemory = (unint64_t)[v7 maxTransactionMemorySize];
    [v7 transactionWaitDurationOnXpcSend];
    v2->_transactionWaitDuration = v8;
  }

  return v2;
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v5, "MRXPC_TRANSACTION_NAME");
  if (uint64 > 0xA)
  {
    uint64_t v11 = _MRLogForCategory(0LL, v6);
    objc_super v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = uint64;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[MRTransactionServer] Unhandled transaction name: %ld",  buf,  0xCu);
    }
  }

  else
  {
    double v8 = -[MRTransaction initWithName:fromMessage:withDelegate:]( objc_alloc(&OBJC_CLASS___MRTransaction),  "initWithName:fromMessage:withDelegate:",  uint64,  v5,  self);
    queue = (dispatch_queue_s *)self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100068DA0;
    v12[3] = &unk_100398E60;
    v12[4] = self;
    v13 = v8;
    objc_super v10 = v8;
    dispatch_sync(queue, v12);
  }
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100068E6C;
  block[3] = &unk_100398E60;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)transactionDidEnd:(id)a3 bytesRemaining:(unint64_t)a4
{
  id v6 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100068F40;
  block[3] = &unk_100399030;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_sync(queue, block);
}

- (unint64_t)transactionRequestingMemorySize:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100069024;
  block[3] = &unk_10039C6E8;
  unint64_t v11 = self;
  v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
  unint64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)transaction:(id)a3 didReceivePackets:(id)a4 receivedSize:(unint64_t)a5 requestedSize:(unint64_t)a6 queue:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006925C;
  block[3] = &unk_1003991C0;
  void block[4] = self;
  void block[5] = a6;
  block[6] = a5;
  v18 = (dispatch_queue_s *)a7;
  dispatch_sync(queue, block);
  v19 = dispatch_group_create();
  v20 = (char *)[v14 name];
  if ((unint64_t)(v20 - 2) >= 6)
  {
    if (v20 == (char *)10)
    {
      -[MRDTransactionServer handlePlaybackQueueRequestTransaction:packets:group:]( self,  "handlePlaybackQueueRequestTransaction:packets:group:",  v14,  v15,  v19);
    }

    else
    {
      uint64_t v23 = _MRLogForCategory(0LL, v21);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[MRTransactionServer] Unhandled Transaction delegate callback",  buf,  2u);
      }
    }
  }

  else
  {
    -[MRDTransactionServer handleContentItemTransaction:packets:group:]( self,  "handleContentItemTransaction:packets:group:",  v14,  v15,  v19);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100069270;
  v25[3] = &unk_10039C710;
  id v26 = v16;
  unint64_t v27 = a5;
  v25[4] = self;
  id v22 = v16;
  dispatch_group_notify(v19, v18, v25);
}

- (void)adjustMemory:(int64_t)a3
{
  if (a3)
  {
    uint64_t v5 = _MRLogForCategory(0LL, a2);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1002B6148((uint64_t)self, a3, v6);
    }

    self->_usedMemory += a3;
  }

- (void)handlePlaybackQueueRequestTransaction:(id)a3 packets:(id)a4 group:(id)a5
{
  id v44 = a3;
  id v43 = a4;
  unint64_t v7 = (dispatch_group_s *)a5;
  uint64_t v9 = _MRLogForCategory(0LL, v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1002B61DC(v44, (uint64_t)v43);
  }

  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allClients]);

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v54 = 0u;
  __int128 v53 = 0u;
  id obj = v12;
  id v42 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v54;
    group = v7;
    while (2)
    {
      for (i = 0LL; i != v42; i = (char *)i + 1)
      {
        if (*(void *)v54 != v41) {
          objc_enumerationMutation(obj);
        }
        v40 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "playbackQueueRequests", group));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v44 playerPath]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 subscriptionControllerForPlayerPath:v15]);

        v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        id v18 = v43;
        id v19 = [v18 countByEnumeratingWithState:&v49 objects:v65 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v50;
          do
          {
            for (j = 0LL; j != v20; j = (char *)j + 1)
            {
              if (*(void *)v50 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)j);
              v24 = (void *)objc_claimAutoreleasedReturnValue([v23 key]);
              v25 = (void *)objc_claimAutoreleasedReturnValue([v24 identifier]);
            }

            id v20 = [v18 countByEnumeratingWithState:&v49 objects:v65 count:16];
          }

          while (v20);
        }

        if (-[NSMutableArray count](v17, "count"))
        {
          id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
          unint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUIDString]);

          uint64_t v29 = _MRLogForCategory(0LL, v28);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            uint64_t Description = MRTransactionNameGetDescription([v44 name]);
            v35 = (void *)objc_claimAutoreleasedReturnValue(Description);
            uint64_t Keys = MRTransactionPacketsGetKeys(v17);
            v37 = (void *)objc_claimAutoreleasedReturnValue(Keys);
            *(_DWORD *)buf = 138413058;
            v58 = v27;
            __int16 v59 = 2112;
            v60 = v35;
            __int16 v61 = 2112;
            v62 = v40;
            __int16 v63 = 2112;
            v64 = v37;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "[MRTransactionServer] %@ %@ sending client %@ subscribed packets %@",  buf,  0x2Au);
          }

          unint64_t v7 = group;
          if (group) {
            dispatch_group_enter(group);
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue([v40 connection]);
          v32 = (void *)objc_claimAutoreleasedReturnValue([v31 connection]);
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472LL;
          v45[2] = sub_1000697B0;
          v45[3] = &unk_10039C738;
          id v46 = v27;
          v47 = group;
          id v48 = v44;
          id v33 = v27;
          [v48 send:v17 toConnection:v32 completion:v45];

          goto LABEL_26;
        }
      }

      unint64_t v7 = group;
      id v42 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
      if (v42) {
        continue;
      }
      break;
    }
  }

- (void)handleContentItemTransaction:(id)a3 packets:(id)a4 group:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (dispatch_group_s *)a5;
  __int128 v52 = v8;
  id v10 = sub_100069DB4(v8);
  __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = _MRLogForCategory(0LL, v11);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1002B62EC(v7, v54);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MRDMediaRemoteServer server](&OBJC_CLASS___MRDMediaRemoteServer, "server"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allClients]);

  __int128 v80 = 0u;
  __int128 v81 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  id obj = v15;
  id v55 = [obj countByEnumeratingWithState:&v78 objects:v90 count:16];
  if (v55)
  {
    uint64_t v53 = *(void *)v79;
    *(void *)&__int128 v16 = 138412802LL;
    __int128 v48 = v16;
    group = v9;
    __int128 v51 = v7;
    do
    {
      for (i = 0LL; i != v55; i = (char *)i + 1)
      {
        if (*(void *)v79 != v53) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v78 + 1) + 8LL * (void)i);
        id v19 = -[MRPlaybackQueueRequest initFromTransactionName:]( [MRPlaybackQueueRequest alloc],  "initFromTransactionName:",  [v7 name]);
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 playbackQueueRequests]);
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v7 playerPath]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v20 subscriptionControllerForPlayerPath:v21]);

        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v54 count]));
        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472LL;
        v74[2] = sub_100069FC0;
        v74[3] = &unk_10039C760;
        id v24 = v19;
        id v75 = v24;
        id v25 = v22;
        id v76 = v25;
        id v26 = v23;
        id v77 = v26;
        [v54 enumerateKeysAndObjectsUsingBlock:v74];
        __int16 v63 = v26;
        if ([v26 count])
        {
          id v56 = v25;
          v57 = v18;
          id v58 = v24;
          __int16 v59 = i;
          __int16 v61 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          __int128 v70 = 0u;
          __int128 v71 = 0u;
          __int128 v72 = 0u;
          __int128 v73 = 0u;
          id v60 = v52;
          id v27 = [v60 countByEnumeratingWithState:&v70 objects:v89 count:16];
          if (v27)
          {
            id v28 = v27;
            uint64_t v62 = *(void *)v71;
            do
            {
              for (j = 0LL; j != v28; j = (char *)j + 1)
              {
                if (*(void *)v71 != v62) {
                  objc_enumerationMutation(v60);
                }
                v30 = *(void **)(*((void *)&v70 + 1) + 8LL * (void)j);
                __int128 v66 = 0u;
                __int128 v67 = 0u;
                __int128 v68 = 0u;
                __int128 v69 = 0u;
                id v31 = v63;
                id v32 = [v31 countByEnumeratingWithState:&v66 objects:v88 count:16];
                if (v32)
                {
                  id v33 = v32;
                  uint64_t v34 = *(void *)v67;
                  while (2)
                  {
                    for (k = 0LL; k != v33; k = (char *)k + 1)
                    {
                      if (*(void *)v67 != v34) {
                        objc_enumerationMutation(v31);
                      }
                      v36 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)k);
                      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "key", v48));
                      v38 = (void *)objc_claimAutoreleasedReturnValue([v37 identifier]);
                      LODWORD(v36) = [v36 isEqualToString:v38];

                      if ((_DWORD)v36)
                      {
                        -[NSMutableArray addObject:](v61, "addObject:", v30);
                        goto LABEL_24;
                      }
                    }

                    id v33 = [v31 countByEnumeratingWithState:&v66 objects:v88 count:16];
                    if (v33) {
                      continue;
                    }
                    break;
                  }
                }

- (void)sendContentItemTransactionWithPlaybackQueue:(id)a3 request:(id)a4 playerPath:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v13)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v13 contentItems]);
    id v11 = [v10 count];

    if (v11)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v13 contentItems]);
      if (v12) {
        -[MRDTransactionServer sendContentItemTransaction:request:playerPath:]( self,  "sendContentItemTransaction:request:playerPath:",  v12,  v8,  v9);
      }
    }
  }
}

- (void)sendContentItemTransaction:(id)a3 request:(id)a4 playerPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10006A224;
    v11[3] = &unk_100399880;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    dispatch_async(&_dispatch_main_q, v11);
  }
}

- (void)_sendContentItemTransaction:(id)a3 request:(id)a4 playerPath:(id)a5
{
  id v7 = a3;
  id v32 = a4;
  id v31 = a5;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id obj = v7;
  id v27 = [v7 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v34;
    uint64_t v29 = _kMRPlaybackQueueRequestIDUserInfoKey;
    id v8 = &MSVWeakLinkStringConstant_ptr;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v34 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v9;
        uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * v9);
        uint64_t AncestorIdentifier = MRContentItemGetAncestorIdentifier(v10);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(AncestorIdentifier);
        for (uint64_t i = 2LL; i != 9; ++i)
        {
          id v14 = [objc_alloc((Class)v8[174]) initFromTransactionName:i];
          id v15 = (void *)MRContentItemCreateFromRequest(v10, v14);
          if ((MRContentItemIsEmpty() & 1) == 0)
          {
            id v16 = objc_alloc_init(&OBJC_CLASS____MRTransactionKeyProtobuf);
            uint64_t v17 = objc_claimAutoreleasedReturnValue([v32 requestIdentifier]);
            id v18 = (void *)v17;
            if (v17)
            {
              uint64_t v38 = v29;
              uint64_t v39 = v17;
              id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
              id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v19,  1LL,  0LL));
            }

            else
            {
              id v20 = 0LL;
            }

            [v16 setIdentifier:v12];
            [v16 setUserData:v20];

            ExternalRepresentation = (void *)MRContentItemCreateExternalRepresentation(kCFAllocatorDefault, v15);
            id v22 = [[MRTransactionPacket alloc] initWithData:ExternalRepresentation forKey:v16];
            uint64_t v23 = -[MRTransaction initWithName:playerPath:]( objc_alloc(&OBJC_CLASS___MRTransaction),  "initWithName:playerPath:",  i,  v31);
            id v37 = v22;
            id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &v37,  1LL));
            -[MRDTransactionServer handleContentItemTransaction:packets:group:]( self,  "handleContentItemTransaction:packets:group:",  v23,  v24,  0LL);

            id v8 = &MSVWeakLinkStringConstant_ptr;
          }
        }

        uint64_t v9 = v28 + 1;
      }

      while ((id)(v28 + 1) != v27);
      id v27 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    }

    while (v27);
  }
}

- (NSMutableArray)transactions
{
  return self->_transactions;
}

- (void).cxx_destruct
{
}

  ;
}

@end