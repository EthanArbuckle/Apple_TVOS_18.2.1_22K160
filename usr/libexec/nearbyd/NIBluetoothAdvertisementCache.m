@interface NIBluetoothAdvertisementCache
- (BOOL)isSampleInCache:(id)a3;
- (NIBluetoothAdvertisementCache)init;
- (NSArray)allSamples;
- (double)flushIntervalSeconds;
- (double)maximumSampleAgeSeconds;
- (id)cachedSamplesForIdentifier:(id)a3;
- (int64_t)maximumSampleCount;
- (void)addSample:(id)a3;
- (void)clear;
- (void)removeStaleSamples;
- (void)setFlushIntervalSeconds:(double)a3;
- (void)setMaximumSampleAgeSeconds:(double)a3;
- (void)setMaximumSampleCount:(int64_t)a3;
@end

@implementation NIBluetoothAdvertisementCache

- (NIBluetoothAdvertisementCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NIBluetoothAdvertisementCache;
  v2 = -[NIBluetoothAdvertisementCache init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    cache = v2->_cache;
    v2->_cache = v3;

    v2->_maximumSampleCount = 8LL;
    v2->_maximumSampleAgeSeconds = 1200.0;
    uint64_t v5 = mach_continuous_time();
    v2->_lastCacheFlushSeconds = TMConvertTicksToSeconds(v5);
    v2->_flushIntervalSeconds = 60.0;
  }

  return v2;
}

- (NSArray)allSamples
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  cache = self->_cache;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100179D08;
  v7[3] = &unk_1007B2A38;
  id v5 = v3;
  id v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cache, "enumerateKeysAndObjectsUsingBlock:", v7);

  return (NSArray *)v5;
}

- (void)addSample:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);

  if (v5)
  {
    cache = self->_cache;
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cache, "objectForKey:", v7));

    if (!v8)
    {
      v9 = self->_cache;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v11);
    }

    v12 = self->_cache;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v12, "objectForKey:", v13));

    [v14 addObject:v4];
    -[NIBluetoothAdvertisementCache removeStaleSamples](self, "removeStaleSamples");
  }

  else
  {
    v15 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_100394214(v15);
    }
  }
}

- (BOOL)isSampleInCache:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 identifier]);

  if (v5)
  {
    cache = self->_cache;
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](cache, "objectForKey:", v7));

    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v9 = v8;
    id v5 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v9);
          }
          v12 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
          unsigned int v13 = objc_msgSend(v4, "channel", (void)v21);
          if (v13 == [v12 channel])
          {
            [v4 rssi];
            double v15 = v14;
            [v12 rssi];
            if (v15 == v16)
            {
              [v4 machContinuousTimeSeconds];
              double v18 = v17;
              [v12 machContinuousTimeSeconds];
              if (vabdd_f64(v18, v19) < 0.001)
              {
                LOBYTE(v5) = 1;
                goto LABEL_14;
              }
            }
          }
        }

        id v5 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

- (void)removeStaleSamples
{
  uint64_t v3 = mach_continuous_time();
  double v4 = TMConvertTicksToSeconds(v3);
  if (v4 - self->_lastCacheFlushSeconds > self->_flushIntervalSeconds)
  {
    self->_lastCacheFlushSeconds = v4;
    double v5 = v4 - self->_maximumSampleAgeSeconds;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10017A27C;
    v24[3] = &unk_1007B2A58;
    *(double *)&v24[4] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v24));
    objc_super v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v8 = self->_cache;
    id v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v20,  v29,  16LL);
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
          double v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v13, (void)v20));
          [v14 filterUsingPredicate:v6];
          if (![v14 count]) {
            -[NSMutableArray addObject:](v7, "addObject:", v13);
          }
        }

        id v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v20,  v29,  16LL);
      }

      while (v10);
    }

    if (v7 && -[NSMutableArray count](v7, "count"))
    {
      -[NSMutableDictionary removeObjectsForKeys:](self->_cache, "removeObjectsForKeys:", v7);
      double v15 = (void *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
      {
        double v16 = v15;
        id v17 = -[NSMutableArray count](v7, "count");
        uint64_t v18 = mach_continuous_time();
        double v19 = TMConvertTicksToSeconds(v18);
        *(_DWORD *)buf = 134218240;
        id v26 = v17;
        __int16 v27 = 2048;
        double v28 = v19 - v4;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Purged %lu devices from Bluetooth advertisement cache in %f seconds.",  buf,  0x16u);
      }
    }
  }

- (id)cachedSamplesForIdentifier:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", a3));
  id v4 = [v3 copy];

  return v4;
}

- (void)clear
{
}

- (int64_t)maximumSampleCount
{
  return self->_maximumSampleCount;
}

- (void)setMaximumSampleCount:(int64_t)a3
{
  self->_maximumSampleCount = a3;
}

- (double)maximumSampleAgeSeconds
{
  return self->_maximumSampleAgeSeconds;
}

- (void)setMaximumSampleAgeSeconds:(double)a3
{
  self->_maximumSampleAgeSeconds = a3;
}

- (double)flushIntervalSeconds
{
  return self->_flushIntervalSeconds;
}

- (void)setFlushIntervalSeconds:(double)a3
{
  self->_flushIntervalSeconds = a3;
}

- (void).cxx_destruct
{
}

@end