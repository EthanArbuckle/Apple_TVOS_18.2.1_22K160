@interface IDSLocalDeliveryQueue
- (IDSLocalDeliveryQueue)initWithIdentifier:(id)a3;
- (NSArray)messages;
- (NSDictionary)statistics;
- (id)nextSocketPairMessageNotOnServices:(id)a3;
- (id)statisticsForDataProtectionClass:(unsigned int)a3;
- (unint64_t)count;
- (unint64_t)countForDataMessageType:(int64_t)a3;
- (unint64_t)countForDataProtectionClass:(unsigned int)a3;
- (void)_addMessageToStatistics:(id)a3;
- (void)_addStatsFromDict:(id)a3 toAggregate:(id)a4;
- (void)_removeMessageFromStatistics:(id)a3;
- (void)clearStats;
- (void)dealloc;
- (void)dequeueMessage:(id)a3;
- (void)enqueueMessage:(id)a3;
- (void)pushMessage:(id)a3;
- (void)removeMessages:(id)a3;
@end

@implementation IDSLocalDeliveryQueue

- (IDSLocalDeliveryQueue)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___IDSLocalDeliveryQueue;
  v5 = -[IDSLocalDeliveryQueue init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = v6;

    v5->_statisticsLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSLocalDeliveryQueue;
  -[IDSLocalDeliveryQueue dealloc](&v3, "dealloc");
}

- (NSArray)messages
{
  return (NSArray *)self->_messages;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_messages, "count");
}

- (unint64_t)countForDataProtectionClass:(unsigned int)a3
{
  messages = self->_messages;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100303E60;
  v7[3] = &unk_1008FEB50;
  unsigned int v8 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](messages, "indexesOfObjectsPassingTest:", v7));
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (unint64_t)countForDataMessageType:(int64_t)a3
{
  messages = self->_messages;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100303F04;
  v7[3] = &unk_1008FEB70;
  void v7[4] = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray indexesOfObjectsPassingTest:](messages, "indexesOfObjectsPassingTest:", v7));
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (void)removeMessages:(id)a3
{
  if (a3) {
    -[NSMutableArray removeObjectsInArray:](self->_messages, "removeObjectsInArray:");
  }
}

- (void)pushMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!self->_messages)
    {
      id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      messages = self->_messages;
      self->_messages = v5;
    }

    if ((unint64_t)-[NSMutableArray count](self->_messages, "count") >> 4 > 0x270)
    {
      uint64_t v7 = OSLogHandleForIDSCategory("Warning");
      unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "We have exceeded the maximum queue size, dropping message %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v9))
      {
        _IDSWarnV(@"IDSFoundation", @"We have exceeded the maximum queue size, dropping message %@");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"We have exceeded the maximum queue size, dropping message %@");
        _IDSLogTransport( @"Warning",  @"IDS",  @"We have exceeded the maximum queue size, dropping message %@");
      }
    }

    else
    {
      -[NSMutableArray insertObject:atIndex:](self->_messages, "insertObject:atIndex:", v4, 0LL);
      -[IDSLocalDeliveryQueue _addMessageToStatistics:](self, "_addMessageToStatistics:", v4);
    }
  }
}

- (void)enqueueMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    messages = self->_messages;
    if (!messages)
    {
      v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      uint64_t v7 = self->_messages;
      self->_messages = v6;

      messages = self->_messages;
    }

    if ((unint64_t)-[NSMutableArray count](messages, "count") >> 4 > 0x270)
    {
      uint64_t v16 = OSLogHandleForIDSCategory("Warning");
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "We have exceeded the maximum queue size, dropping message %@",  buf,  0xCu);
      }

      if (os_log_shim_legacy_logging_enabled(v18))
      {
        _IDSWarnV(@"IDSFoundation", @"We have exceeded the maximum queue size, dropping message %@");
        _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"We have exceeded the maximum queue size, dropping message %@");
        _IDSLogTransport( @"Warning",  @"IDS",  @"We have exceeded the maximum queue size, dropping message %@");
      }
    }

    else
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v4 resourcePath]);

      if (v8)
      {
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        uint64_t v9 = self->_messages;
        id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
        if (v10)
        {
          uint64_t v11 = *(void *)v22;
          while (2)
          {
            v12 = 0LL;
            do
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v9);
              }
              v14 = (void *)objc_claimAutoreleasedReturnValue([v4 messageUUID]);
              unsigned __int8 v15 = [v13 isEqualToString:v14];

              if ((v15 & 1) != 0)
              {

                v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog localDeliveryQueue]( &OBJC_CLASS___IDSFoundationLog,  "localDeliveryQueue"));
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  v20 = (void *)objc_claimAutoreleasedReturnValue([v4 resourcePath]);
                  *(_DWORD *)buf = 138412546;
                  id v26 = v4;
                  __int16 v27 = 2112;
                  v28 = v20;
                  _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "File transfer for message %@ [%@] is already in local delivery queue. Dropping duplicate.",  buf,  0x16u);
                }

                goto LABEL_23;
              }

              v12 = (char *)v12 + 1;
            }

            while (v10 != v12);
            id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v21,  v29,  16LL);
            if (v10) {
              continue;
            }
            break;
          }
        }
      }

      -[NSMutableArray addObject:](self->_messages, "addObject:", v4);
      -[IDSLocalDeliveryQueue _addMessageToStatistics:](self, "_addMessageToStatistics:", v4);
    }
  }

- (void)dequeueMessage:(id)a3
{
  id v4 = a3;
  if (v4 && -[NSMutableArray containsObject:](self->_messages, "containsObject:", v4))
  {
    uint64_t v5 = OSLogHandleForIDSCategory("LocalDeliveryQueue");
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v7 = [v4 manualQueueRemoval];
      unsigned int v8 = @"NO";
      if (v7) {
        unsigned int v8 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v15 = v4;
      __int16 v16 = 2112;
      v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Force dequeuing message %@ (should be manual: %@)",  buf,  0x16u);
    }

    if (os_log_shim_legacy_logging_enabled(v9)
      && _IDSShouldLog(2LL, @"LocalDeliveryQueue"))
    {
      unsigned int v10 = [v4 manualQueueRemoval];
      uint64_t v11 = @"NO";
      if (v10) {
        uint64_t v11 = @"YES";
      }
      id v12 = v4;
      v13 = v11;
      _IDSLogV( 2LL,  @"IDSFoundation",  @"LocalDeliveryQueue",  @"Force dequeuing message %@ (should be manual: %@)");
    }

    -[IDSLocalDeliveryQueue _removeMessageFromStatistics:](self, "_removeMessageFromStatistics:", v4, v12, v13);
    -[NSMutableArray removeObject:](self->_messages, "removeObject:", v4);
  }
}

- (id)nextSocketPairMessageNotOnServices:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray count](self->_messages, "count"))
  {
    while (1)
    {
      uint64_t v26 = 0LL;
      __int16 v27 = &v26;
      uint64_t v28 = 0x2020000000LL;
      uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
      messages = self->_messages;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_100304928;
      v23[3] = &unk_1008FEC38;
      id v24 = v4;
      v25 = &v26;
      -[NSMutableArray enumerateObjectsUsingBlock:](messages, "enumerateObjectsUsingBlock:", v23);
      uint64_t v6 = v27[3];
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      {
        unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog localDeliveryQueue](&OBJC_CLASS___IDSFoundationLog, "localDeliveryQueue"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v31 = (os_log_s *)v4;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "* No pending messages not on %@", buf, 0xCu);
        }

        unsigned int v8 = 0LL;
      }

      else
      {
        unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_messages, "objectAtIndex:", v27[3]));
        unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s socketPairMessage](v7, "socketPairMessage"));
        if (!v8)
        {
          uint64_t v9 = OSLogHandleForIDSCategory("Warning");
          unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            id v11 = (id)objc_claimAutoreleasedReturnValue(-[os_log_s topic](v7, "topic"));
            id v12 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s command](v7, "command"));
            *(_DWORD *)buf = 138412802;
            v31 = v7;
            __int16 v32 = 2112;
            id v33 = v11;
            __int16 v34 = 2112;
            v35 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Couldn't construct a socketPairMessage for message %@ topic %@ command %@ - discarding",  buf,  0x20u);
          }

          if (os_log_shim_legacy_logging_enabled(v13))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s topic](v7, "topic"));
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s command](v7, "command"));
            _IDSWarnV( @"IDSFoundation",  @"Couldn't construct a socketPairMessage for message %@ topic %@ command %@ - discarding");

            id v15 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s topic](v7, "topic", v7, v14, v21));
            __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s command](v7, "command"));
            _IDSLogV( 0LL,  @"IDSFoundation",  @"Warning",  @"Couldn't construct a socketPairMessage for message %@ topic %@ command %@ - discarding");

            v19 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s topic](v7, "topic", v7, v15, v22));
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s command](v7, "command"));
            uint64_t v18 = v7;
            _IDSLogTransport( @"Warning",  @"IDS",  @"Couldn't construct a socketPairMessage for message %@ topic %@ command %@ - discarding");
          }

          -[NSMutableArray removeObjectAtIndex:](self->_messages, "removeObjectAtIndex:", v27[3], v18, v19, v20);
        }
      }

      _Block_object_dispose(&v26, 8);
      if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v8)
      {
        id v16 = v8;
        goto LABEL_17;
      }
    }

    id v16 = 0LL;
LABEL_17:
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

- (void)_addMessageToStatistics:(id)a3
{
  id v28 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v28 topic]);
  id v5 = [v28 dataProtectionClass];
  p_statisticsLock = &self->_statisticsLock;
  os_unfair_lock_lock(&self->_statisticsLock);
  statistics = self->_statistics;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
  uint64_t v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](statistics, "objectForKey:", v8));

  if (self->_statistics)
  {
    if (v9) {
      goto LABEL_3;
    }
  }

  else
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    uint64_t v18 = self->_statistics;
    self->_statistics = Mutable;

    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v19 = self->_statistics;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
  -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v9, v20);

LABEL_3:
  unsigned int v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9, "objectForKey:", v4));
  if (v10)
  {
    id v11 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( v10,  "objectForKey:",  @"localDeliveryQueueStatMessageCount"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11, "objectForKey:", @"localDeliveryQueueStatBytes"));
    id v14 = [v12 unsignedLongLongValue];
    id v15 = [v13 unsignedLongLongValue];

    uint64_t v16 = (uint64_t)v14 + 1;
  }

  else
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v15 = 0LL;
    uint64_t v16 = 1LL;
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v28 payload]);
  __int128 v22 = (char *)[v21 length];

  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v28 protobuf]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 data]);
  v25 = &v22[(unint64_t)[v24 length] + (void)v15];

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v16));
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v26, @"localDeliveryQueueStatMessageCount");

  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v25));
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v27, @"localDeliveryQueueStatBytes");

  -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v11, v4);
  os_unfair_lock_unlock(p_statisticsLock);
}

- (void)_removeMessageFromStatistics:(id)a3
{
  id v41 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v41 topic]);
  id v5 = [v41 dataProtectionClass];
  p_statisticsLock = &self->_statisticsLock;
  os_unfair_lock_lock(&self->_statisticsLock);
  statistics = self->_statistics;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v41 dataProtectionClass]));
  uint64_t v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](statistics, "objectForKey:", v8));

  if (self->_statistics)
  {
    if (v9) {
      goto LABEL_3;
    }
  }

  else
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    __int16 v32 = self->_statistics;
    self->_statistics = Mutable;

    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v33 = self->_statistics;
  __int16 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v5));
  -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v9, v34);

LABEL_3:
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9, "objectForKey:", v4));
  id v11 = v10;
  if (v10)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"localDeliveryQueueStatMessageCount"]);
    v37 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"localDeliveryQueueStatBytes"]);
    v36 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"localDeliveryQueueStatDeliveredMessageCount"]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"localDeliveryQueueStatDeliveredBytes"]);
    id v12 = (char *)[v38 unsignedLongLongValue];
    uint64_t v13 = [v37 unsignedLongLongValue];
    id v14 = (char *)[v36 unsignedLongLongValue];
    id v15 = (char *)[v35 unsignedLongLongValue];
    v39 = p_statisticsLock;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v41 payload]);
    v17 = (char *)[v16 length];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v41 protobuf]);
    v40 = v4;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 data]);
    v20 = &v17[(void)[v19 length]];

    __int128 v21 = v14 + 1;
    __int128 v22 = &v15[(void)v20];
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v12 - 1));
    [v11 setObject:v23 forKey:@"localDeliveryQueueStatMessageCount"];

    id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v13 - v20));
    [v11 setObject:v24 forKey:@"localDeliveryQueueStatBytes"];

    v25 = v21;
    p_statisticsLock = v39;
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v25));
    [v11 setObject:v26 forKey:@"localDeliveryQueueStatDeliveredMessageCount"];

    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v22));
    [v11 setObject:v27 forKey:@"localDeliveryQueueStatDeliveredBytes"];

    uint64_t v29 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", ids_monotonic_time(v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    [v11 setObject:v30 forKey:@"localDeliveryQueueStatsLastDeliveredTime"];

    id v4 = v40;
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v11, v40);
  }

  os_unfair_lock_unlock(p_statisticsLock);
}

- (void)_addStatsFromDict:(id)a3 toAggregate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v7 = [&off_1009488F8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(&off_1009488F8);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v11]);
        uint64_t v13 = (char *)[v12 unsignedLongLongValue];

        id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v11]);
        id v15 = &v13[(void)[v14 unsignedLongLongValue]];

        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v15));
        [v6 setObject:v16 forKey:v11];
      }

      id v8 = [&off_1009488F8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v8);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"localDeliveryQueueStatsLastDeliveredTime"]);
  [v17 doubleValue];
  double v19 = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"localDeliveryQueueStatsLastDeliveredTime"]);
  [v20 doubleValue];
  double v22 = v21;

  if (v19 > v22)
  {
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v19));
    [v6 setObject:v23 forKey:@"localDeliveryQueueStatsLastDeliveredTime"];
  }
}

- (NSDictionary)statistics
{
  __int128 v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  os_unfair_lock_lock(&self->_statisticsLock);
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_statistics, "allValues"));
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v35 + 1) + 8 * (void)i) allKeys]);
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v9));
        -[NSMutableSet unionSet:](v4, "unionSet:", v10);
      }

      id v6 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }

    while (v6);
  }

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v23 = v4;
  id v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v31,  v40,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (j = 0LL; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v23);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)j);
        id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v27 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        id v16 = obj;
        id v17 = [v16 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v28;
          do
          {
            for (k = 0LL; k != v18; k = (char *)k + 1)
            {
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v16);
              }
              -[IDSLocalDeliveryQueue _addStatsFromDict:toAggregate:](self, "_addStatsFromDict:toAggregate:", v21, v15);
            }

            id v18 = [v16 countByEnumeratingWithState:&v27 objects:v39 count:16];
          }

          while (v18);
        }

        -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v15, v14);
      }

      id v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v31,  v40,  16LL);
    }

    while (v12);
  }

  os_unfair_lock_unlock(&self->_statisticsLock);
  return (NSDictionary *)v25;
}

- (id)statisticsForDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_statisticsLock = &self->_statisticsLock;
  os_unfair_lock_lock(&self->_statisticsLock);
  statistics = self->_statistics;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](statistics, "objectForKey:", v7));
  id v9 = [v8 copy];

  os_unfair_lock_unlock(p_statisticsLock);
  return v9;
}

- (void)clearStats
{
  os_unfair_lock_t lock = &self->_statisticsLock;
  os_unfair_lock_lock(&self->_statisticsLock);
  double v4 = ids_monotonic_time(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_statistics, "allValues"));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = v5;
  id v17 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = v6;
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v23 + 1) + 8 * v6) allValues]);
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v22 = 0u;
        id v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v20;
          do
          {
            for (i = 0LL; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v20 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
              [v12 setObject:&off_100947980 forKey:@"localDeliveryQueueStatDeliveredMessageCount"];
              [v12 setObject:&off_100947980 forKey:@"localDeliveryQueueStatDeliveredBytes"];
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v4));
              [v12 setObject:v13 forKey:@"localDeliveryQueueStatsLastDeliveredTime"];
            }

            id v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }

          while (v9);
        }

        uint64_t v6 = v18 + 1;
      }

      while ((id)(v18 + 1) != v17);
      id v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }

    while (v17);
  }

  os_unfair_lock_unlock(lock);
}

- (void).cxx_destruct
{
}

@end