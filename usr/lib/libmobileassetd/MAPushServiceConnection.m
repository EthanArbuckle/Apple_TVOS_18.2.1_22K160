@interface MAPushServiceConnection
- (APSConnection)connection;
- (MAPushServiceConnection)initWithDelegate:(id)a3;
- (MAPushServiceConnectionDelegate)delegate;
- (OS_dispatch_queue)pushServiceQueue;
- (OS_dispatch_queue)subscriptionRequestQueue;
- (id)_APSConnectionEnvironment;
- (id)_publicChannelForPushChannel:(id)a3;
- (id)subscribedChannels;
- (unint64_t)_subscribedChannelCount;
- (void)_subscribeToChannel:(id)a3;
- (void)_unsubscribeFromChannel:(id)a3;
- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)dealloc;
- (void)subscribeToChannel:(id)a3;
- (void)unsubscribeFromChannel:(id)a3;
@end

@implementation MAPushServiceConnection

- (MAPushServiceConnection)initWithDelegate:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MAPushServiceConnection;
  v6 = -[MAPushServiceConnection init](&v30, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mobileassetd.pushServiceQueue", v9);
    pushServiceQueue = v7->_pushServiceQueue;
    v7->_pushServiceQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v12);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.mobileassetd.subscriptionRequestQueue", v13);
    subscriptionRequestQueue = v7->_subscriptionRequestQueue;
    v7->_subscriptionRequestQueue = (OS_dispatch_queue *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection _APSConnectionEnvironment](v7, "_APSConnectionEnvironment"));
    v17 = objc_alloc(&OBJC_CLASS___APSConnection);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection pushServiceQueue](v7, "pushServiceQueue"));
    v19 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v17,  "initWithEnvironmentName:namedDelegatePort:queue:",  v16,  @"com.apple.aps.mobileassetd",  v18);
    connection = v7->_connection;
    v7->_connection = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection connection](v7, "connection"));
    if (v21)
    {
      v31 = @"com.apple.mobileassetd";
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection connection](v7, "connection"));
      [v27 _setOpportunisticTopics:v26];

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection connection](v7, "connection"));
      [v28 setDelegate:v7];
    }

    else
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAPushServiceConnection initWithDelegate:]",  @"Failed to create an APSConnection",  v22,  v23,  v24,  v25,  (uint64_t)v30.receiver);
    }
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection connection](self, "connection"));
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MAPushServiceConnection;
  -[MAPushServiceConnection dealloc](&v4, "dealloc");
}

- (id)_APSConnectionEnvironment
{
  id AppIntegerValue = _MAPreferencesGetAppIntegerValue(@"PushNotificationEnvironment", &v10);
  if ((unint64_t)AppIntegerValue >= 4)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushServiceConnection _APSConnectionEnvironment]",  @"Default to product cloud channel environment",  v3,  v4,  v5,  v6,  v9);
    v7 = (id *)&APSEnvironmentProduction;
  }

  else
  {
    v7 = (id *)*(&off_34F768 + (void)AppIntegerValue);
  }

  return *v7;
}

- (void)subscribeToChannel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection subscriptionRequestQueue](self, "subscriptionRequestQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __46__MAPushServiceConnection_subscribeToChannel___block_invoke;
  v7[3] = &unk_34DB98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __46__MAPushServiceConnection_subscribeToChannel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _subscribeToChannel:*(void *)(a1 + 40)];
}

- (void)_subscribeToChannel:(id)a3
{
  id v16 = a3;
  unint64_t v4 = -[MAPushServiceConnection _subscribedChannelCount](self, "_subscribedChannelCount");
  if (v4 < 0x64)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection _publicChannelForPushChannel:](self, "_publicChannelForPushChannel:", v16));
    dispatch_queue_t v14 = (void *)v9;
    if (v9)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushServiceConnection _subscribeToChannel:]",  @"Subscribing to channel %@",  v10,  v11,  v12,  v13,  v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection connection](self, "connection"));
      [v15 subscribeToChannel:v14 forTopic:@"com.apple.mobileassetd"];
    }

    else
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAPushServiceConnection _subscribeToChannel:]",  @"Could not subscribe to channel %@",  v10,  v11,  v12,  v13,  (uint64_t)v16);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAPushServiceConnection _subscribeToChannel:]",  @"New subscription denied since we reached the channel limit (%tu >= %tu)",  v5,  v6,  v7,  v8,  v4);
  }
}

- (void)unsubscribeFromChannel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection subscriptionRequestQueue](self, "subscriptionRequestQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __50__MAPushServiceConnection_unsubscribeFromChannel___block_invoke;
  v7[3] = &unk_34DB98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __50__MAPushServiceConnection_unsubscribeFromChannel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unsubscribeFromChannel:*(void *)(a1 + 40)];
}

- (void)_unsubscribeFromChannel:(id)a3
{
  id v4 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection _publicChannelForPushChannel:](self, "_publicChannelForPushChannel:", v4));
  if (v9)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushServiceConnection _unsubscribeFromChannel:]",  @"Unsubscribing from channel %@",  v5,  v6,  v7,  v8,  (uint64_t)v4);

    id v4 = (id)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection connection](self, "connection"));
    [v4 unsubscribeFromChannel:v9 forTopic:@"com.apple.mobileassetd"];
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAPushServiceConnection _unsubscribeFromChannel:]",  @"Could not unsubscribe from channel %@",  v5,  v6,  v7,  v8,  (uint64_t)v4);
  }
}

- (id)_publicChannelForPushChannel:(id)a3
{
  id v3 = a3;
  uint64_t v8 = v3;
  if (v3 && (id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 base64ChannelId]), v9, v9))
  {
    uint64_t v10 = objc_alloc(&OBJC_CLASS___NSData);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 base64ChannelId]);
    uint64_t v12 = -[NSData initWithBase64EncodedString:options:](v10, "initWithBase64EncodedString:options:", v11, 0LL);

    if (-[NSData length](v12, "length") > 0x10)
    {
      -[NSData length](v12, "length");
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAPushServiceConnection _publicChannelForPushChannel:]",  @"Received channel id %@ with length %tu > %tu",  v13,  v14,  v15,  v16,  (uint64_t)v8);
    }

    id v17 = objc_alloc(&OBJC_CLASS___PKPublicChannel);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v8 base64ChannelId]);
    id v19 = [v17 initWithChannelID:v18];
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAPushServiceConnection _publicChannelForPushChannel:]",  @"No available cloud channel",  v4,  v5,  v6,  v7,  v21);
    id v19 = 0LL;
  }

  return v19;
}

- (id)subscribedChannels
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection connection](self, "connection"));
  id v27 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 registeredChannelsForTopic:@"com.apple.mobileassetd" error:&v27]);
  id v4 = v27;

  if (v3)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    uint64_t v22 = v3;
    id v10 = v3;
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          uint64_t v16 = objc_autoreleasePoolPush();
          id v17 = objc_alloc(&OBJC_CLASS___MAPushChannel);
          v18 = (void *)objc_claimAutoreleasedReturnValue([v15 channelID]);
          id v19 = -[MAPushChannel initWithIdentifier:](v17, "initWithIdentifier:", v18);

          if (v19) {
            [v9 addObject:v19];
          }

          objc_autoreleasePoolPop(v16);
        }

        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }

      while (v12);
    }

    id v20 = [v9 copy];
    id v3 = v22;
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAPushServiceConnection subscribedChannels]",  @"Couldn't get registered channels: %@",  v5,  v6,  v7,  v8,  (uint64_t)v4);
    id v20 = 0LL;
  }

  return v20;
}

- (unint64_t)_subscribedChannelCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection subscribedChannels](self, "subscribedChannels"));
  id v3 = v2;
  if (v2) {
    id v4 = [v2 count];
  }
  else {
    id v4 = 0LL;
  }

  return (unint64_t)v4;
}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  id v5 = a4;
  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAPushServiceConnection connection:channelSubscriptionsFailedWithFailures:]",  @"Failed to subscribe to some channels: %@",  v6,  v7,  v8,  v9,  (uint64_t)v5);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection delegate](self, "delegate"));
  char v11 = objc_opt_respondsToSelector(v10, "channelSubscriptionsFailedWithReasons:");

  if ((v11 & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v13 = v5;
    id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v18 failureReason]));
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 channelID]);
          [v12 setObject:v19 forKeyedSubscript:v20];
        }

        id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v15);
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection delegate](self, "delegate"));
    id v22 = [v12 copy];
    [v21 channelSubscriptionsFailedWithReasons:v22];
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  id v22 = v5;
  if (v5)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    if (v10)
    {
      char v11 = -[MAPushNotification initWithUserInfo:]( objc_alloc(&OBJC_CLASS___MAPushNotification),  "initWithUserInfo:",  v10);
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAPushServiceConnection connection:didReceiveIncomingMessage:]",  @"Received notification with payload: %@",  v12,  v13,  v14,  v15,  (uint64_t)v10);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MAPushServiceConnection delegate](self, "delegate"));
      [v16 didReceivePushNotification:v11];
    }

    else
    {
      char v11 = (MAPushNotification *)objc_claimAutoreleasedReturnValue([v22 channelID]);
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAPushServiceConnection connection:didReceiveIncomingMessage:]",  @"message (%@) called without userInfo",  v17,  v18,  v19,  v20,  (uint64_t)v11);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAPushServiceConnection connection:didReceiveIncomingMessage:]",  @"-connection:didReceiveIncomingMessage: called without a message",  v6,  v7,  v8,  v9,  v21);
  }
}

- (OS_dispatch_queue)pushServiceQueue
{
  return self->_pushServiceQueue;
}

- (OS_dispatch_queue)subscriptionRequestQueue
{
  return self->_subscriptionRequestQueue;
}

- (MAPushServiceConnectionDelegate)delegate
{
  return self->_delegate;
}

- (APSConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end