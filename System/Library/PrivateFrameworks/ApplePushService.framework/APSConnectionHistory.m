@interface APSConnectionHistory
- (APSConnectionHistory)init;
- (double)connectedTimeInPastOneDayOnInterface:(int64_t)a3;
- (double)highQualityThresholdConnectedTime;
- (double)lowQualityThresholdConnectedTime;
- (id)connectionHistoryOnInterface:(int64_t)a3;
- (int64_t)connectionQualityOnInterface:(int64_t)a3;
- (void)adjustQualityOfConnectionOnInterface:(int64_t)a3;
- (void)noteDisconnectOnInterface:(int64_t)a3;
- (void)noteNewConnectionOnInterface:(int64_t)a3;
- (void)setHighQualityThresholdConnectedTime:(double)a3;
- (void)setLowQualityThresholdConnectedTime:(double)a3;
@end

@implementation APSConnectionHistory

- (APSConnectionHistory)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___APSConnectionHistory;
  v2 = -[APSConnectionHistory init](&v9, "init");
  v3 = (APSConnectionHistory *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_1001027B0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v5 = v3->_connectionHistory[0];
    v3->_connectionHistory[0] = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = v3->_connectionHistory[1];
    v3->_connectionHistory[1] = v6;
  }

  return v3;
}

- (void)noteNewConnectionOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[APSPair pairWithFirst:second:](&OBJC_CLASS___APSPair, "pairWithFirst:second:", v7, 0LL));

    -[NSMutableArray addObject:](self->_connectionHistory[a3], "addObject:", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_10003CEE4(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)buf = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to note new connection  with invalid interface %@",  buf,  0x16u);
  }

- (void)noteDisconnectOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    connectionHistory = self->_connectionHistory;
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_connectionHistory[a3], "lastObject"));
    if (v8)
    {
      objc_super v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](connectionHistory[a3], "lastObject"));
      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 second]);

      if (!v11)
      {
        id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](connectionHistory[a3], "lastObject"));
        [v12 setSecond:v13];
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_10003CEE4(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)buf = 138412546;
    v15 = self;
    __int16 v16 = 2112;
    v17 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to note disconnect with invalid interface %@",  buf,  0x16u);
  }

- (int64_t)connectionQualityOnInterface:(int64_t)a3
{
  if (a3 < 2) {
    return self->_connectionQuality[a3];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_10003CEE4(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    int v8 = 138412546;
    objc_super v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to get connection quality with invalid interface %@",  (uint8_t *)&v8,  0x16u);
  }

  return 0LL;
}

- (void)adjustQualityOfConnectionOnInterface:(int64_t)a3
{
  if (a3 >= 2)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    id v5 = sub_10003CEE4(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    int v13 = 138412546;
    v14 = self;
    __int16 v15 = 2112;
    int64_t v16 = (int64_t)v6;
    v7 = "%@ asked to recalculate quality of connection with invalid interface %@";
    uint32_t v8 = 22;
    goto LABEL_11;
  }

  -[APSConnectionHistory connectedTimeInPastOneDayOnInterface:](self, "connectedTimeInPastOneDayOnInterface:", a3);
  if (v9 <= self->_highQualityThresholdConnectedTime)
  {
    connectionQuality = self->_connectionQuality;
    connectionQuality[a3] = v9 >= self->_lowQualityThresholdConnectedTime;
  }

  else
  {
    self->_connectionQuality[a3] = 2LL;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v11 = self->_connectionQuality[a3];
    id v12 = sub_10003CEE4(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v12);
    int v13 = 138412802;
    v14 = self;
    __int16 v15 = 2048;
    int64_t v16 = v11;
    __int16 v17 = 2112;
    v18 = v6;
    v7 = "%@ calculated current connection quality. {Quality:%lu, Interface: %@}";
    uint32_t v8 = 32;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, v8);
  }

- (double)connectedTimeInPastOneDayOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    uint64_t v25 = 0LL;
    uint64_t v14 = 0LL;
    __int16 v15 = &v14;
    uint64_t v16 = 0x2020000000LL;
    uint64_t v17 = -1LL;
    connectionHistory = self->_connectionHistory;
    double v9 = self->_connectionHistory[a3];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001B344;
    v13[3] = &unk_10011E460;
    v13[4] = &v14;
    v13[5] = buf;
    -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](v9, "enumerateObjectsWithOptions:usingBlock:", 2LL, v13);
    if ((v15[3] & 0x8000000000000000LL) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = v15[3];
        int64_t v11 = connectionHistory[a3];
        *(_DWORD *)v18 = 138412802;
        v19 = self;
        __int16 v20 = 2048;
        uint64_t v21 = v10;
        __int16 v22 = 2112;
        v23 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ removing connection history pair before index %lu, history %@",  v18,  0x20u);
      }

      -[NSMutableArray removeObjectsInRange:](connectionHistory[a3], "removeObjectsInRange:", 0LL, v15[3] + 1);
    }

    double v5 = *(double *)(*(void *)&buf[8] + 24LL);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(buf, 8);
  }

  else
  {
    double v5 = 0.0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = sub_10003CEE4(a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to get connected time in past one day with invalid interface %@",  buf,  0x16u);
    }
  }

  return v5;
}

- (id)connectionHistoryOnInterface:(int64_t)a3
{
  if (a3 < 2) {
    return self->_connectionHistory[a3];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = sub_10003CEE4(a3);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    int v8 = 138412546;
    double v9 = self;
    __int16 v10 = 2112;
    int64_t v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ asked to get connection history with invalid interface %@",  (uint8_t *)&v8,  0x16u);
  }

  return 0LL;
}

- (double)highQualityThresholdConnectedTime
{
  return self->_highQualityThresholdConnectedTime;
}

- (void)setHighQualityThresholdConnectedTime:(double)a3
{
  self->_highQualityThresholdConnectedTime = a3;
}

- (double)lowQualityThresholdConnectedTime
{
  return self->_lowQualityThresholdConnectedTime;
}

- (void)setLowQualityThresholdConnectedTime:(double)a3
{
  self->_lowQualityThresholdConnectedTime = a3;
}

- (void).cxx_destruct
{
  for (uint64_t i = 6LL; i != 4; --i)
    objc_storeStrong((id *)&(&self->super.isa)[i], 0LL);
}

@end