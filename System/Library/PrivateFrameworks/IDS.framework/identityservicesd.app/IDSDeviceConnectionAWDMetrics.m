@interface IDSDeviceConnectionAWDMetrics
+ (id)sharedInstance;
- (BOOL)_canReportMetric:(id)a3;
- (IDSDeviceConnectionAWDMetrics)init;
- (id)_currentMetrics;
- (id)awdMetricsForConnectionUUID:(id)a3;
- (void)_reportAndRemoveForConnectionUUID:(id)a3;
- (void)_setCreatedAt:(id)a3 forConnectionUUID:(id)a4;
- (void)reportAndRemoveForConnectionUUID:(id)a3;
- (void)setClientInitTime:(double)a3 forConnectionUUID:(id)a4;
- (void)setClientOpenSocketCompletionTime:(double)a3 forConnectionUUID:(id)a4;
- (void)setConnectionInitTime:(double)a3 forConnectionUUID:(id)a4;
- (void)setDaemonOpenSocketCompletionTime:(double)a3 forConnectionUUID:(id)a4;
- (void)setDaemonOpenSocketTime:(double)a3 forConnectionUUID:(id)a4;
- (void)setFirstPacketReceiveTime:(double)a3 forConnectionUUID:(id)a4;
- (void)setServiceName:(id)a3 forConnectionUUID:(id)a4;
- (void)setSuccess:(BOOL)a3 forConnectionUUID:(id)a4;
@end

@implementation IDSDeviceConnectionAWDMetrics

+ (id)sharedInstance
{
  if (qword_1009C0C40 != -1) {
    dispatch_once(&qword_1009C0C40, &stru_100902C78);
  }
  if (qword_1009C0C48 != -1) {
    dispatch_once(&qword_1009C0C48, &stru_100902C98);
  }
  if (qword_1009C0C50 != -1) {
    dispatch_once(&qword_1009C0C50, &stru_100902CB8);
  }
  return (id)qword_1009C0C58;
}

- (IDSDeviceConnectionAWDMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___IDSDeviceConnectionAWDMetrics;
  v2 = -[IDSDeviceConnectionAWDMetrics init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    metrics = v2->_metrics;
    v2->_metrics = v3;

    v2->_writeLock._os_unfair_lock_opaque = 0;
  }

  return v2;
}

- (id)awdMetricsForConnectionUUID:(id)a3
{
  id v4 = a3;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v4));
  if (!v6)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v7 = [v4 copy];
    [v6 setObject:v7 forKeyedSubscript:IDSDeviceConnectionAWDMetricsConnectionUUIDKey];

    v9 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", ids_monotonic_time(v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    [v6 setObject:v10 forKeyedSubscript:IDSDeviceConnectionAWDMetricsCreatedAtKey];

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_metrics, "setObject:forKeyedSubscript:", v6, v4);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v4));
  id v12 = [v11 mutableCopy];

  os_unfair_lock_unlock(p_writeLock);
  return v12;
}

- (void)_reportAndRemoveForConnectionUUID:(id)a3
{
  id v4 = a3;
  double v5 = ids_monotonic_time(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  os_unfair_lock_lock(&self->_writeLock);
  metrics = self->_metrics;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1003A6994;
  v16[3] = &unk_100902CE0;
  double v18 = v5;
  id v8 = v6;
  id v17 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](metrics, "enumerateKeysAndObjectsUsingBlock:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v4));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v4));
    [v8 addObject:v10];
  }

  else
  {
    uint64_t v11 = OSLogHandleForTransportCategory("IDSDeviceConnectionAWDMetrics");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Can't find AWD metrics for %@", buf, 0xCu);
    }

    uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
    if ((_DWORD)v14)
    {
      if (_IDSShouldLogTransport(v14))
      {
        _IDSLogTransport(@"IDSDeviceConnectionAWDMetrics", @"IDS", @"Can't find AWD metrics for %@");
        if (_IDSShouldLog(0LL, @"IDSDeviceConnectionAWDMetrics")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDeviceConnectionAWDMetrics",  @"Can't find AWD metrics for %@");
        }
      }
    }
  }

  os_unfair_lock_unlock(&self->_writeLock);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1003A6A14;
  v15[3] = &unk_1008F7970;
  v15[4] = self;
  [v8 enumerateObjectsUsingBlock:v15];
}

- (void)reportAndRemoveForConnectionUUID:(id)a3
{
}

- (void)setServiceName:(id)a3 forConnectionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v7));
  if (v9)
  {
    id v10 = [v6 copy];
    [v9 setObject:v10 forKeyedSubscript:IDSDeviceConnectionAWDMetricsServiceNameKey];

    os_unfair_lock_unlock(p_writeLock);
  }

  else
  {
    os_unfair_lock_unlock(p_writeLock);
    uint64_t v11 = OSLogHandleForTransportCategory("IDSDeviceConnectionAWDMetrics");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = IDSDeviceConnectionAWDMetricsServiceNameKey;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "There is no metric dictionary for %@, %@",  buf,  0x16u);
    }

    uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
    if ((_DWORD)v14)
    {
      if (_IDSShouldLogTransport(v14))
      {
        _IDSLogTransport( @"IDSDeviceConnectionAWDMetrics",  @"IDS",  @"There is no metric dictionary for %@, %@");
        if (_IDSShouldLog(0LL, @"IDSDeviceConnectionAWDMetrics")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDeviceConnectionAWDMetrics",  @"There is no metric dictionary for %@, %@");
        }
      }
    }
  }
}

- (void)setClientInitTime:(double)a3 forConnectionUUID:(id)a4
{
  id v6 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v6));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    [v8 setObject:v9 forKeyedSubscript:IDSDeviceConnectionAWDMetricsClientInitKey];

    os_unfair_lock_unlock(p_writeLock);
  }

  else
  {
    os_unfair_lock_unlock(p_writeLock);
    uint64_t v10 = OSLogHandleForTransportCategory("IDSDeviceConnectionAWDMetrics");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = IDSDeviceConnectionAWDMetricsClientInitKey;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "There is no metric dictionary for %@, %@",  buf,  0x16u);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13)
    {
      if (_IDSShouldLogTransport(v13))
      {
        _IDSLogTransport( @"IDSDeviceConnectionAWDMetrics",  @"IDS",  @"There is no metric dictionary for %@, %@");
        if (_IDSShouldLog(0LL, @"IDSDeviceConnectionAWDMetrics")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDeviceConnectionAWDMetrics",  @"There is no metric dictionary for %@, %@");
        }
      }
    }
  }
}

- (void)setConnectionInitTime:(double)a3 forConnectionUUID:(id)a4
{
  id v6 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v6));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    [v8 setObject:v9 forKeyedSubscript:IDSDeviceConnectionAWDMetricsConnectionInitKey];

    os_unfair_lock_unlock(p_writeLock);
  }

  else
  {
    os_unfair_lock_unlock(p_writeLock);
    uint64_t v10 = OSLogHandleForTransportCategory("IDSDeviceConnectionAWDMetrics");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = IDSDeviceConnectionAWDMetricsConnectionInitKey;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "There is no metric dictionary for %@, %@",  buf,  0x16u);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13)
    {
      if (_IDSShouldLogTransport(v13))
      {
        _IDSLogTransport( @"IDSDeviceConnectionAWDMetrics",  @"IDS",  @"There is no metric dictionary for %@, %@");
        if (_IDSShouldLog(0LL, @"IDSDeviceConnectionAWDMetrics")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDeviceConnectionAWDMetrics",  @"There is no metric dictionary for %@, %@");
        }
      }
    }
  }
}

- (void)setDaemonOpenSocketTime:(double)a3 forConnectionUUID:(id)a4
{
  id v6 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v6));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    [v8 setObject:v9 forKeyedSubscript:IDSDeviceConnectionAWDMetricsDaemonOpenSocketKey];
  }

  os_unfair_lock_unlock(p_writeLock);
  uint64_t v10 = OSLogHandleForTransportCategory("IDSDeviceConnectionAWDMetrics");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = IDSDeviceConnectionAWDMetricsDaemonOpenSocketKey;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "There is no metric dictionary for %@, %@",  buf,  0x16u);
  }

  uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
  if ((_DWORD)v13)
  {
    if (_IDSShouldLogTransport(v13))
    {
      _IDSLogTransport( @"IDSDeviceConnectionAWDMetrics",  @"IDS",  @"There is no metric dictionary for %@, %@");
      if (_IDSShouldLog(0LL, @"IDSDeviceConnectionAWDMetrics")) {
        _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDeviceConnectionAWDMetrics",  @"There is no metric dictionary for %@, %@");
      }
    }
  }
}

- (void)setFirstPacketReceiveTime:(double)a3 forConnectionUUID:(id)a4
{
  id v6 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v6));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    [v8 setObject:v9 forKeyedSubscript:IDSDeviceConnectionAWDMetricsFirstDataPacketReceiveKey];

    os_unfair_lock_unlock(p_writeLock);
  }

  else
  {
    os_unfair_lock_unlock(p_writeLock);
    uint64_t v10 = OSLogHandleForTransportCategory("IDSDeviceConnectionAWDMetrics");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = IDSDeviceConnectionAWDMetricsFirstDataPacketReceiveKey;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "There is no metric dictionary for %@, %@",  buf,  0x16u);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13)
    {
      if (_IDSShouldLogTransport(v13))
      {
        _IDSLogTransport( @"IDSDeviceConnectionAWDMetrics",  @"IDS",  @"There is no metric dictionary for %@, %@");
        if (_IDSShouldLog(0LL, @"IDSDeviceConnectionAWDMetrics")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDeviceConnectionAWDMetrics",  @"There is no metric dictionary for %@, %@");
        }
      }
    }
  }
}

- (void)setDaemonOpenSocketCompletionTime:(double)a3 forConnectionUUID:(id)a4
{
  id v6 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v6));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    [v8 setObject:v9 forKeyedSubscript:IDSDeviceConnectionAWDMetricsDaemonCompletionHandlerKey];

    os_unfair_lock_unlock(p_writeLock);
  }

  else
  {
    os_unfair_lock_unlock(p_writeLock);
    uint64_t v10 = OSLogHandleForTransportCategory("IDSDeviceConnectionAWDMetrics");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = IDSDeviceConnectionAWDMetricsDaemonCompletionHandlerKey;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "There is no metric dictionary for %@, %@",  buf,  0x16u);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13)
    {
      if (_IDSShouldLogTransport(v13))
      {
        _IDSLogTransport( @"IDSDeviceConnectionAWDMetrics",  @"IDS",  @"There is no metric dictionary for %@, %@");
        if (_IDSShouldLog(0LL, @"IDSDeviceConnectionAWDMetrics")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDeviceConnectionAWDMetrics",  @"There is no metric dictionary for %@, %@");
        }
      }
    }
  }
}

- (void)setClientOpenSocketCompletionTime:(double)a3 forConnectionUUID:(id)a4
{
  id v6 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v6));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
    [v8 setObject:v9 forKeyedSubscript:IDSDeviceConnectionAWDMetricsClientOpenSocketCompletionKey];

    os_unfair_lock_unlock(p_writeLock);
  }

  else
  {
    os_unfair_lock_unlock(p_writeLock);
    uint64_t v10 = OSLogHandleForTransportCategory("IDSDeviceConnectionAWDMetrics");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = IDSDeviceConnectionAWDMetricsClientOpenSocketCompletionKey;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "There is no metric dictionary for %@, %@",  buf,  0x16u);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13)
    {
      if (_IDSShouldLogTransport(v13))
      {
        _IDSLogTransport( @"IDSDeviceConnectionAWDMetrics",  @"IDS",  @"There is no metric dictionary for %@, %@");
        if (_IDSShouldLog(0LL, @"IDSDeviceConnectionAWDMetrics")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDeviceConnectionAWDMetrics",  @"There is no metric dictionary for %@, %@");
        }
      }
    }
  }
}

- (void)setSuccess:(BOOL)a3 forConnectionUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v6));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    [v8 setObject:v9 forKeyedSubscript:IDSDeviceConnectionAWDMetricsSuccessKey];

    os_unfair_lock_unlock(p_writeLock);
  }

  else
  {
    os_unfair_lock_unlock(p_writeLock);
    uint64_t v10 = OSLogHandleForTransportCategory("IDSDeviceConnectionAWDMetrics");
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = IDSDeviceConnectionAWDMetricsSuccessKey;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "There is no metric dictionary for %@, %@",  buf,  0x16u);
    }

    uint64_t v13 = os_log_shim_legacy_logging_enabled(v12);
    if ((_DWORD)v13)
    {
      if (_IDSShouldLogTransport(v13))
      {
        _IDSLogTransport( @"IDSDeviceConnectionAWDMetrics",  @"IDS",  @"There is no metric dictionary for %@, %@");
        if (_IDSShouldLog(0LL, @"IDSDeviceConnectionAWDMetrics")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDeviceConnectionAWDMetrics",  @"There is no metric dictionary for %@, %@");
        }
      }
    }
  }
}

- (void)_setCreatedAt:(id)a3 forConnectionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v7));
  if (v9)
  {
    id v10 = [v6 copy];
    [v9 setObject:v10 forKeyedSubscript:IDSDeviceConnectionAWDMetricsCreatedAtKey];

    os_unfair_lock_unlock(p_writeLock);
  }

  else
  {
    os_unfair_lock_unlock(p_writeLock);
    uint64_t v11 = OSLogHandleForTransportCategory("IDSDeviceConnectionAWDMetrics");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = IDSDeviceConnectionAWDMetricsCreatedAtKey;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "There is no metric dictionary for %@, %@",  buf,  0x16u);
    }

    uint64_t v14 = os_log_shim_legacy_logging_enabled(v13);
    if ((_DWORD)v14)
    {
      if (_IDSShouldLogTransport(v14))
      {
        _IDSLogTransport( @"IDSDeviceConnectionAWDMetrics",  @"IDS",  @"There is no metric dictionary for %@, %@");
        if (_IDSShouldLog(0LL, @"IDSDeviceConnectionAWDMetrics")) {
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSDeviceConnectionAWDMetrics",  @"There is no metric dictionary for %@, %@");
        }
      }
    }
  }
}

- (BOOL)_canReportMetric:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( [a3 objectForKeyedSubscript:IDSDeviceConnectionAWDMetricsClientOpenSocketCompletionKey]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)_currentMetrics
{
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  id v4 = -[NSMutableDictionary copy](self->_metrics, "copy");
  os_unfair_lock_unlock(p_writeLock);
  return v4;
}

- (void).cxx_destruct
{
}

@end