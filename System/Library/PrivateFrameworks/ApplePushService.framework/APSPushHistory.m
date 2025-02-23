@interface APSPushHistory
- (APSPushHistory)initWithEnvironment:(id)a3;
- (BOOL)hasPayload:(id)a3 forTopic:(id)a4 tokens:(id)a5;
- (id)_keyForTopic:(id)a3 token:(id)a4;
- (id)timestampForTopic:(id)a3 token:(id)a4;
- (void)_pruneHistory;
- (void)receivedPushWithTopic:(id)a3 token:(id)a4 payload:(id)a5 timestamp:(id)a6;
@end

@implementation APSPushHistory

- (APSPushHistory)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___APSPushHistory;
  v6 = -[APSPushHistory init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_environment, a3);
  }

  return v7;
}

- (void)_pruneHistory
{
  id v3 = -[NSMutableDictionary count](self->_history, "count");
  if ((unint64_t)v3 >= 0x12D)
  {
    unint64_t v4 = (unint64_t)fmax((double)(unint64_t)v3 * 0.3, 5.0);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary keysSortedByValueUsingComparator:]( self->_history,  "keysSortedByValueUsingComparator:",  &stru_10011F400));
    id v6 = [v5 count];
    if (v4)
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        v8 = objc_autoreleasePoolPush();
        objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:i]);
        -[NSMutableDictionary removeObjectForKey:](self->_history, "removeObjectForKey:", v9);

        objc_autoreleasePoolPop(v8);
      }
    }

    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog pushHistory](&OBJC_CLASS___APSLog, "pushHistory"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = -[NSMutableDictionary count](self->_history, "count");
      int v13 = 138412802;
      v14 = self;
      __int16 v15 = 2048;
      id v16 = v6;
      __int16 v17 = 2048;
      id v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%@ _pruneHistory from %lu to %lu.",  (uint8_t *)&v13,  0x20u);
    }
  }

  if (!-[NSMutableDictionary count](self->_history, "count"))
  {
    history = self->_history;
    self->_history = 0LL;
  }

- (id)_keyForTopic:(id)a3 token:(id)a4
{
  id v5 = a3;
  id v6 = sub_100077DB0(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@,%@", v5, v7));

  return v8;
}

- (void)receivedPushWithTopic:(id)a3 token:(id)a4 payload:(id)a5 timestamp:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog pushHistory](&OBJC_CLASS___APSLog, "pushHistory"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138413314;
    v23 = self;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v11;
    __int16 v28 = 2112;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%@ receivedPushWithTopic %@ token %@ payload %@ timestamp %@",  (uint8_t *)&v22,  0x34u);
  }

  if ([v10 length])
  {
    if ([v11 length])
    {
      id v15 = [v12 length];
      if (v13)
      {
        if (v15)
        {
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSPushHistory _keyForTopic:token:](self, "_keyForTopic:token:", v10, v11));
          if (!self->_history)
          {
            __int16 v17 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  1LL);
            history = self->_history;
            self->_history = v17;
          }

          v19 = sub_100077C2C(v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v21 = -[APSPushRecord initWithToken:timestamp:payloadHash:]( objc_alloc(&OBJC_CLASS___APSPushRecord),  "initWithToken:timestamp:payloadHash:",  v11,  v13,  v20);
          -[NSMutableDictionary setObject:forKey:](self->_history, "setObject:forKey:", v21, v16);
          -[APSPushHistory _pruneHistory](self, "_pruneHistory");
        }
      }
    }
  }
}

- (id)timestampForTopic:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog pushHistory](&OBJC_CLASS___APSLog, "pushHistory"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%@ timestampForTopic? %@ token %@",  (uint8_t *)&v13,  0x20u);
  }

  if ([v6 length] && objc_msgSend(v7, "length"))
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSPushHistory _keyForTopic:token:](self, "_keyForTopic:token:", v6, v7));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_history, "objectForKey:", v9));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 timestamp]);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (BOOL)hasPayload:(id)a3 forTopic:(id)a4 tokens:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  id v12 = v10;
  int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog pushHistory](&OBJC_CLASS___APSLog, "pushHistory"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v39 = self;
    __int16 v40 = 2112;
    v41 = v11;
    __int16 v42 = 2112;
    id v43 = v9;
    __int16 v44 = 2112;
    id v45 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%@ hasPayload? %@ forTopic %@ tokens %@",  buf,  0x2Au);
  }

  if ([v11 length] && objc_msgSend(v9, "length") && objc_msgSend(v12, "count"))
  {
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v30 = v12;
    id obj = v12;
    id v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v14)
    {
      id v15 = v14;
      unsigned __int8 v16 = 0;
      uint64_t v17 = *(void *)v34;
      do
      {
        id v18 = 0LL;
        id v31 = v15;
        do
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue( -[APSPushHistory _keyForTopic:token:]( self,  "_keyForTopic:token:",  v9,  *(void *)(*((void *)&v33 + 1) + 8LL * (void)v18)));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_history, "objectForKey:", v19));
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 payloadHash]);

          if (v21)
          {
            int v22 = sub_100077C2C(v11);
            v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            if ((v16 & 1) != 0)
            {
              unsigned __int8 v16 = 1;
            }

            else
            {
              __int16 v24 = self;
              uint64_t v25 = v17;
              id v26 = v9;
              id v27 = v11;
              __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v20 payloadHash]);
              unsigned __int8 v16 = [v23 isEqualToData:v28];

              id v11 = v27;
              id v9 = v26;
              uint64_t v17 = v25;
              self = v24;
              id v15 = v31;
            }
          }

          id v18 = (char *)v18 + 1;
        }

        while (v15 != v18);
        id v15 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }

      while (v15);
    }

    else
    {
      unsigned __int8 v16 = 0;
    }

    id v12 = v30;
  }

  else
  {
    unsigned __int8 v16 = 0;
  }

  return v16 & 1;
}

- (void).cxx_destruct
{
}

@end