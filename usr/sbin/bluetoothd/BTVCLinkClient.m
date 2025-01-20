@interface BTVCLinkClient
+ (id)btvcLinkClient;
- (BTVCLinkClient)init;
- (id)addBTVCBonjourLinkDelegate:(id)a3;
- (void)btvcBonjourLink:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6;
- (void)btvcBonjourLink:(id)a3 didDeferAdvertisingType:(int64_t)a4;
- (void)btvcBonjourLink:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5;
- (void)btvcBonjourLink:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7;
- (void)btvcBonjourLink:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)btvcBonjourLink:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5;
- (void)btvcBonjourLink:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5;
- (void)btvcBonjourLink:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5;
- (void)btvcBonjourLink:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6;
- (void)btvcBonjourLink:(id)a3 didStartAdvertisingType:(int64_t)a4;
- (void)btvcBonjourLink:(id)a3 didStartScanningForType:(int64_t)a4;
- (void)btvcBonjourLink:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5;
- (void)btvcBonjourLinkDidUpdateState:(id)a3;
- (void)removeBTVCBonjourLinkDelegate:(id)a3;
@end

@implementation BTVCLinkClient

+ (id)btvcLinkClient
{
  if (qword_1008EF970 != -1) {
    dispatch_once(&qword_1008EF970, &stru_10088A158);
  }
  return (id)qword_1008EF978;
}

- (BTVCLinkClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BTVCLinkClient;
  v2 = -[BTVCLinkClient init](&v5, "init");
  if (v2)
  {
    v3 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[BTVCLinkClient init]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
  }

  return v2;
}

- (id)addBTVCBonjourLinkDelegate:(id)a3
{
  id v4 = a3;
  objc_super v5 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    v15 = "-[BTVCLinkClient addBTVCBonjourLinkDelegate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  v6 = self;
  objc_sync_enter(v6);
  if (!v6->_btvcBonjourLink)
  {
    v7 = -[BTVCBonjourLink initWithDelegate:queue:]( objc_alloc(&OBJC_CLASS___BTVCBonjourLink),  "initWithDelegate:queue:",  v6,  v6->_dispatchQueue);
    btvcBonjourLink = v6->_btvcBonjourLink;
    v6->_btvcBonjourLink = v7;
  }

  btvcBonjourLinkDelegates = v6->_btvcBonjourLinkDelegates;
  if (!btvcBonjourLinkDelegates)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v11 = v6->_btvcBonjourLinkDelegates;
    v6->_btvcBonjourLinkDelegates = v10;

    btvcBonjourLinkDelegates = v6->_btvcBonjourLinkDelegates;
  }

  -[NSMutableSet addObject:](btvcBonjourLinkDelegates, "addObject:", v4);
  v12 = v6->_btvcBonjourLink;
  objc_sync_exit(v6);

  return v12;
}

- (void)removeBTVCBonjourLinkDelegate:(id)a3
{
  id v4 = a3;
  objc_super v5 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    v10 = "-[BTVCLinkClient removeBTVCBonjourLinkDelegate:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v6 = self;
  objc_sync_enter(v6);
  -[NSMutableSet removeObject:](v6->_btvcBonjourLinkDelegates, "removeObject:", v4);
  if (!-[NSMutableSet count](v6->_btvcBonjourLinkDelegates, "count"))
  {
    v7 = (os_log_s *)qword_1008F7710;
    if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      v10 = "-[BTVCLinkClient removeBTVCBonjourLinkDelegate:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Invalidate BTVCBonjourLink",  (uint8_t *)&v9,  0xCu);
    }

    -[BTVCBonjourLink invalidate](v6->_btvcBonjourLink, "invalidate");
    btvcBonjourLink = v6->_btvcBonjourLink;
    v6->_btvcBonjourLink = 0LL;
  }

  objc_sync_exit(v6);
}

- (void)btvcBonjourLinkDidUpdateState:(id)a3
{
  id v5 = a3;
  v6 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[BTVCLinkClient btvcBonjourLinkDidUpdateState:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7 = self;
  objc_sync_enter(v7);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v7->_btvcBonjourLinkDelegates, "allObjects"));
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, a2) & 1) != 0)
        {
          v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 dispatchQueue]);
          if (v13 == (dispatch_queue_s *)v7->_dispatchQueue)
          {
            [v12 btvcBonjourLinkDidUpdateState:v5];
          }

          else
          {
            v14[0] = _NSConcreteStackBlock;
            v14[1] = 3221225472LL;
            v14[2] = sub_100261D60;
            v14[3] = &unk_10087FB90;
            v14[4] = v12;
            id v15 = v5;
            dispatch_async(v13, v14);
          }
        }

        else
        {
          v13 = 0LL;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)btvcBonjourLink:(id)a3 didStartAdvertisingType:(int64_t)a4
{
  id v15 = a3;
  v7 = (os_log_s *)qword_1008F7710;
  if (os_log_type_enabled((os_log_t)qword_1008F7710, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[BTVCLinkClient btvcBonjourLink:didStartAdvertisingType:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v8 = self;
  objc_sync_enter(v8);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v8->_btvcBonjourLinkDelegates, "allObjects"));
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v13, a2) & 1) != 0)
        {
          int v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 dispatchQueue]);
          if (v14 == (dispatch_queue_s *)v8->_dispatchQueue)
          {
            [v13 btvcBonjourLink:v15 didStartAdvertisingType:a4];
          }

          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100261FE8;
            block[3] = &unk_100880D48;
            block[4] = v13;
            id v17 = v15;
            int64_t v18 = a4;
            dispatch_async(v14, block);
          }
        }

        else
        {
          int v14 = 0LL;
        }
      }

      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)btvcBonjourLink:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5
{
  id v16 = a3;
  id v17 = a5;
  id v9 = self;
  objc_sync_enter(v9);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9->_btvcBonjourLinkDelegates, "allObjects"));
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        int v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v14, a2) & 1) != 0)
        {
          id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 dispatchQueue]);
          if (v15 == (dispatch_queue_s *)v9->_dispatchQueue)
          {
            [v14 btvcBonjourLink:v16 didStopAdvertisingType:a4 withError:v17];
          }

          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100262258;
            block[3] = &unk_10088A180;
            block[4] = v14;
            id v19 = v16;
            int64_t v21 = a4;
            id v20 = v17;
            dispatch_async(v15, block);
          }
        }

        else
        {
          id v15 = 0LL;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v11);
  }

  objc_sync_exit(v9);
}

- (void)btvcBonjourLink:(id)a3 didDeferAdvertisingType:(int64_t)a4
{
  id v14 = a3;
  v7 = self;
  objc_sync_enter(v7);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v7->_btvcBonjourLinkDelegates, "allObjects"));
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, a2) & 1) != 0)
        {
          v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 dispatchQueue]);
          if (v13 == (dispatch_queue_s *)v7->_dispatchQueue)
          {
            [v12 btvcBonjourLink:v14 didDeferAdvertisingType:a4];
          }

          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10026248C;
            block[3] = &unk_100880D48;
            block[4] = v12;
            id v16 = v14;
            int64_t v17 = a4;
            dispatch_async(v13, block);
          }
        }

        else
        {
          v13 = 0LL;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)btvcBonjourLink:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v16 = a3;
  id v17 = a5;
  id v9 = self;
  objc_sync_enter(v9);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9->_btvcBonjourLinkDelegates, "allObjects"));
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v14, a2) & 1) != 0)
        {
          id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 dispatchQueue]);
          if (v15 == (dispatch_queue_s *)v9->_dispatchQueue)
          {
            [v14 btvcBonjourLink:v16 didFailToStartAdvertisingOfType:a4 withError:v17];
          }

          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_1002626FC;
            block[3] = &unk_10088A180;
            block[4] = v14;
            id v19 = v16;
            int64_t v21 = a4;
            id v20 = v17;
            dispatch_async(v15, block);
          }
        }

        else
        {
          id v15 = 0LL;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v11);
  }

  objc_sync_exit(v9);
}

- (void)btvcBonjourLink:(id)a3 didStartScanningForType:(int64_t)a4
{
  id v14 = a3;
  v7 = self;
  objc_sync_enter(v7);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v7->_btvcBonjourLinkDelegates, "allObjects"));
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, a2) & 1) != 0)
        {
          v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 dispatchQueue]);
          if (v13 == (dispatch_queue_s *)v7->_dispatchQueue)
          {
            [v12 btvcBonjourLink:v14 didStartScanningForType:a4];
          }

          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100262930;
            block[3] = &unk_100880D48;
            block[4] = v12;
            id v16 = v14;
            int64_t v17 = a4;
            dispatch_async(v13, block);
          }
        }

        else
        {
          v13 = 0LL;
        }
      }

      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v9);
  }

  objc_sync_exit(v7);
}

- (void)btvcBonjourLink:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5
{
  id v16 = a3;
  id v17 = a5;
  id v9 = self;
  objc_sync_enter(v9);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9->_btvcBonjourLinkDelegates, "allObjects"));
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v14, a2) & 1) != 0)
        {
          id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 dispatchQueue]);
          if (v15 == (dispatch_queue_s *)v9->_dispatchQueue)
          {
            [v14 btvcBonjourLink:v16 didFailToStartScanningForType:a4 WithError:v17];
          }

          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100262BA0;
            block[3] = &unk_10088A180;
            block[4] = v14;
            id v19 = v16;
            int64_t v21 = a4;
            id v20 = v17;
            dispatch_async(v15, block);
          }
        }

        else
        {
          id v15 = 0LL;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v11);
  }

  objc_sync_exit(v9);
}

- (void)btvcBonjourLink:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7
{
  id v20 = a3;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  v13 = self;
  objc_sync_enter(v13);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  obj = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v13->_btvcBonjourLinkDelegates, "allObjects"));
  id v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v32;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v14);
        }
        __int128 v18 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v18, a2) & 1) != 0)
        {
          id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v18 dispatchQueue]);
          if (v19 == (dispatch_queue_s *)obj->_dispatchQueue)
          {
            [v18 btvcBonjourLink:v20 didDiscoverType:a4 withData:v21 fromPeer:v22 peerInfo:v23];
          }

          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100262E8C;
            block[3] = &unk_10088A1A8;
            block[4] = v18;
            id v26 = v20;
            int64_t v30 = a4;
            id v27 = v21;
            id v28 = v22;
            id v29 = v23;
            dispatch_async(v19, block);
          }
        }

        else
        {
          id v19 = 0LL;
        }
      }

      id v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v15);
  }

  objc_sync_exit(obj);
}

- (void)btvcBonjourLink:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5
{
  id v16 = a3;
  id v17 = a4;
  id v9 = self;
  objc_sync_enter(v9);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9->_btvcBonjourLinkDelegates, "allObjects"));
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v14, a2) & 1) != 0)
        {
          id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 dispatchQueue]);
          if (v15 == (dispatch_queue_s *)v9->_dispatchQueue)
          {
            [v14 btvcBonjourLink:v16 didLosePeer:v17 type:a5];
          }

          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_1002630FC;
            block[3] = &unk_10088A180;
            block[4] = v14;
            id v19 = v16;
            id v20 = v17;
            int64_t v21 = a5;
            dispatch_async(v15, block);
          }
        }

        else
        {
          id v15 = 0LL;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v11);
  }

  objc_sync_exit(v9);
}

- (void)btvcBonjourLink:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a6;
  id v11 = self;
  objc_sync_enter(v11);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v11->_btvcBonjourLinkDelegates, "allObjects"));
  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v16, a2) & 1) != 0)
        {
          id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 dispatchQueue]);
          if (v17 == (dispatch_queue_s *)v11->_dispatchQueue)
          {
            [v16 btvcBonjourLink:v18 didConnectToPeer:v19 transport:a5 error:v20];
          }

          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_1002633A8;
            block[3] = &unk_10088A1D0;
            block[4] = v16;
            id v22 = v18;
            id v23 = v19;
            int64_t v25 = a5;
            id v24 = v20;
            dispatch_async(v17, block);
          }
        }

        else
        {
          id v17 = 0LL;
        }
      }

      id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }

    while (v13);
  }

  objc_sync_exit(v11);
}

- (void)btvcBonjourLink:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v9 = self;
  objc_sync_enter(v9);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9->_btvcBonjourLinkDelegates, "allObjects"));
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v14, a2) & 1) != 0)
        {
          id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 dispatchQueue]);
          if (v15 == (dispatch_queue_s *)v9->_dispatchQueue)
          {
            [v14 btvcBonjourLink:v16 didDisconnectFromPeer:v17 error:v18];
          }

          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100263648;
            block[3] = &unk_10088A1F8;
            block[4] = v14;
            id v20 = v16;
            id v21 = v17;
            id v22 = v18;
            dispatch_async(v15, block);
          }
        }

        else
        {
          id v15 = 0LL;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v11);
  }

  objc_sync_exit(v9);
}

- (void)btvcBonjourLink:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v11 = self;
  objc_sync_enter(v11);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v11->_btvcBonjourLinkDelegates, "allObjects"));
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v16, a2) & 1) != 0)
        {
          id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 dispatchQueue]);
          if (v17 == (dispatch_queue_s *)v11->_dispatchQueue)
          {
            [v16 btvcBonjourLink:v18 didSendData:v19 toPeer:v20 error:v21];
          }

          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100263918;
            block[3] = &unk_10088A220;
            block[4] = v16;
            id v23 = v18;
            id v24 = v19;
            id v25 = v20;
            id v26 = v21;
            dispatch_async(v17, block);
          }
        }

        else
        {
          id v17 = 0LL;
        }
      }

      id v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }

    while (v13);
  }

  objc_sync_exit(v11);
}

- (void)btvcBonjourLink:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v9 = self;
  objc_sync_enter(v9);
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v9->_btvcBonjourLinkDelegates, "allObjects"));
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v14, a2) & 1) != 0)
        {
          id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 dispatchQueue]);
          if (v15 == (dispatch_queue_s *)v9->_dispatchQueue)
          {
            [v14 btvcBonjourLink:v16 didReceiveData:v17 fromPeer:v18];
          }

          else
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100263BB8;
            block[3] = &unk_10088A1F8;
            block[4] = v14;
            id v20 = v16;
            id v21 = v17;
            id v22 = v18;
            dispatch_async(v15, block);
          }
        }

        else
        {
          id v15 = 0LL;
        }
      }

      id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v11);
  }

  objc_sync_exit(v9);
}

- (void).cxx_destruct
{
}

@end