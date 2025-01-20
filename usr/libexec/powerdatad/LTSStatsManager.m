@interface LTSStatsManager
+ (id)sharedLTSStatsManager;
- (LTSStatsManager)init;
- (NSDictionary)prevStatsSinceBoot;
- (OS_dispatch_queue)queue;
- (__CFDictionary)subscribedChannels;
- (__IOReportSubscriptionCF)subscription;
- (id)getLifetimeStats;
- (id)getStatsSinceBoot;
- (int)updateLifetimeStatsForChannel:(__CFDictionary *)a3;
- (void)dealloc;
- (void)setPrevStatsSinceBoot:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSubscribedChannels:(__CFDictionary *)a3;
- (void)setSubscription:(__IOReportSubscriptionCF *)a3;
- (void)updateLifetimeStats;
- (void)updateLifetimeStatsGated;
@end

@implementation LTSStatsManager

+ (id)sharedLTSStatsManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009898;
  block[3] = &unk_1000106C0;
  block[4] = a1;
  if (qword_100014B48 != -1) {
    dispatch_once(&qword_100014B48, block);
  }
  return (id)qword_100014B40;
}

- (LTSStatsManager)init
{
  CFTypeRef cf = 0LL;
  os_log_t v3 = os_log_create("com.apple.powerdatad", "LTSStats");
  v4 = off_100014B00;
  off_100014B00 = v3;

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___LTSStatsManager;
  v5 = -[LTSStatsManager init](&v22, "init");
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000B37C();
    }
    CFMutableDictionaryRef v6 = 0LL;
    goto LABEL_22;
  }

  CFMutableDictionaryRef v6 = IOServiceNameMatching("RTBuddyIOReportingEndpoint");
  uint64_t v7 = IOReportCopyChannelsForDrivers(v6, 0LL, &cf);
  if (!v7)
  {
    v16 = (os_log_s *)off_100014B00;
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v25 = (const char *)cf;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "IOReportCopyChannelsForDrivers error: %{public}@",  buf,  0xCu);
    }

- (void)dealloc
{
  os_log_t v3 = (os_log_s *)off_100014B00;
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dealloc call\n", buf, 2u);
  }

  subscription = self->_subscription;
  if (subscription) {
    CFRelease(subscription);
  }
  subscribedChannels = self->_subscribedChannels;
  if (subscribedChannels) {
    CFRelease(subscribedChannels);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LTSStatsManager;
  -[LTSStatsManager dealloc](&v6, "dealloc");
}

- (id)getStatsSinceBoot
{
  CFTypeRef cf = 0LL;
  subscription = self->_subscription;
  if (subscription)
  {
    v4 = (void *)IOReportCreateSamples(subscription, self->_subscribedChannels, &cf);
    if (v4) {
      goto LABEL_3;
    }
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000B434();
    }
  }

  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000B408();
  }

  v4 = 0LL;
LABEL_3:
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

- (int)updateLifetimeStatsForChannel:(__CFDictionary *)a3
{
  uint64_t ChannelName = IOReportChannelGetChannelName(a3, a2);
  if (ChannelName)
  {
    uint64_t v5 = ChannelName;
    uint64_t ChannelID = IOReportChannelGetChannelID(a3);
    id v7 = -[LTSStatsStore initForChannel:](objc_alloc(&OBJC_CLASS___LTSStatsStore), "initForChannel:", v5);
    if (v7)
    {
      v8 = v7;
      uint64_t v29 = ChannelID;
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v7 getLifetimeStatsForVersion:ChannelID]);
      int Count = IOReportStateGetCount(a3);
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG)) {
        sub_10000B520();
      }
      v28 = (void *)v5;
      if (Count < 1)
      {
        dispatch_queue_t v12 = 0LL;
      }

      else
      {
        dispatch_queue_t v12 = 0LL;
        uint64_t v13 = 0LL;
        *(void *)&__int128 v11 = 138412546LL;
        __int128 v27 = v11;
        do
        {
          v14 = v12;
          uint64_t NameForIndex = IOReportStateGetNameForIndex(a3, v13);
          dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue(NameForIndex);

          uint64_t v16 = IOReportStateGetInTransitions(a3, v13);
          v17 = off_100014B00;
          if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG))
          {
            objc_super v22 = v17;
            v23 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v12]);
            *(_DWORD *)buf = 138412802;
            v31 = v12;
            __int16 v32 = 2048;
            uint64_t v33 = v16;
            __int16 v34 = 2112;
            v35 = v23;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "Incremented count for state %@ by %lld. Previous value: %@\n",  buf,  0x20u);
          }

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v12, v27));

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v12]);
            v16 += (uint64_t)[v19 unsignedLongValue];
          }

          else
          {
            uint32_t v20 = (os_log_s *)off_100014B00;
            if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v27;
              v31 = v12;
              __int16 v32 = 2048;
              uint64_t v33 = v16;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Added new state %@ to lifetime stats with count %lld",  buf,  0x16u);
            }
          }

          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v16));
          [v9 setObject:v21 forKeyedSubscript:v12];

          uint64_t v13 = (v13 + 1);
        }

        while (Count != (_DWORD)v13);
      }

      [v8 saveLifetimeStats:v9 forVersion:v29];
      v24 = (os_log_s *)off_100014B00;
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v31 = v28;
        __int16 v32 = 1024;
        LODWORD(v33) = Count;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "Updated Channel name: %{public}@ Num States: %d",  buf,  0x12u);
      }

      return 0;
    }

    else
    {
      int v25 = 16;
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
        sub_10000B4C0();
      }
    }
  }

  else
  {
    int v25 = 16;
    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000B494();
    }
  }

  return v25;
}

- (void)updateLifetimeStatsGated
{
  v13[4] = self;
  CFTypeRef cf = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000A258;
  v13[3] = &unk_100010728;
  os_log_t v3 = objc_retainBlock(v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LTSStatsManager getStatsSinceBoot](self, "getStatsSinceBoot"));
  if (v4)
  {
    prevStatsSinceBoot = self->_prevStatsSinceBoot;
    p_prevStatsSinceBoot = (id *)&self->_prevStatsSinceBoot;
    uint64_t v5 = prevStatsSinceBoot;
    if (!prevStatsSinceBoot)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[LTSStatsStore getPrevStatsSinceBoot](&OBJC_CLASS___LTSStatsStore, "getPrevStatsSinceBoot"));
      id v9 = *p_prevStatsSinceBoot;
      id *p_prevStatsSinceBoot = (id)v8;

      uint64_t v5 = *p_prevStatsSinceBoot;
      if (!*p_prevStatsSinceBoot)
      {
        id v10 = v4;
        __int128 v11 = (os_log_s *)off_100014B00;
        if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)dispatch_queue_t v12 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "No Previously saved stats since boot\n",  v12,  2u);
        }

        goto LABEL_5;
      }
    }

    id v10 = (id)IOReportCreateSamplesDelta(v5, v4, &cf);
    if (v10)
    {
LABEL_5:
      IOReportIterate(v10, v3);
      +[LTSStatsStore saveStatsSinceBoot:](&OBJC_CLASS___LTSStatsStore, "saveStatsSinceBoot:", v4);
      objc_storeStrong(p_prevStatsSinceBoot, v4);
      goto LABEL_6;
    }

    if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR)) {
      sub_10000B5AC();
    }
  }

  else if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_ERROR))
  {
    sub_10000B580();
  }

  id v10 = 0LL;
LABEL_6:
  if (cf) {
    CFRelease(cf);
  }
}

- (void)updateLifetimeStats
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A2BC;
  block[3] = &unk_100010750;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (id)getLifetimeStats
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10000A3A0;
  id v10 = sub_10000A3B0;
  id v11 = 0LL;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10000A3B8;
  v5[3] = &unk_100010778;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_DEBUG)) {
    sub_10000B60C();
  }
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSDictionary)prevStatsSinceBoot
{
  return self->_prevStatsSinceBoot;
}

- (void)setPrevStatsSinceBoot:(id)a3
{
}

- (__CFDictionary)subscribedChannels
{
  return self->_subscribedChannels;
}

- (void)setSubscribedChannels:(__CFDictionary *)a3
{
  self->_subscribedChannels = a3;
}

- (__IOReportSubscriptionCF)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(__IOReportSubscriptionCF *)a3
{
  self->_subscription = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end