@interface ThreadNetworkfinder
- (THBorderAgentFinder)borderAgentFinder;
- (id)getAgentDescriptionForIndex:(unint64_t)a3;
- (id)getBorderAgentForIndex:(unint64_t)a3;
- (int64_t)findNWs;
- (void)agentChanged;
- (void)agentResolved:(id)a3;
- (void)clear;
- (void)printServer:(id)a3;
- (void)setBorderAgentFinder:(id)a3;
- (void)startScan:(id)a3 queue:(id)a4 timeInSec:(unsigned __int8)a5;
- (void)stopScan;
@end

@implementation ThreadNetworkfinder

- (void)startScan:(id)a3 queue:(id)a4 timeInSec:(unsigned __int8)a5
{
  unsigned int v5 = a5;
  id v8 = a3;
  v9 = (dispatch_queue_s *)a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001C645C;
  block[3] = &unk_1002B5848;
  objc_copyWeak(&v15, &location);
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
  v10 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Starting dispatch After", v13, 2u);
  }

  dispatch_time_t v12 = dispatch_time(0LL, 1000000000LL * v5);
  dispatch_after(v12, v9, v8);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)stopScan
{
  borderAgentFinder = self->_borderAgentFinder;
  if (borderAgentFinder) {
    -[THBorderAgentFinder stop](borderAgentFinder, "stop");
  }
}

- (void)clear
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1001C657C;
  v2[3] = &unk_1002B5870;
  objc_copyWeak(&v3, &location);
  dispatch_async(&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (int64_t)findNWs
{
  int64_t result = (int64_t)self->_borderAgentFinder;
  if (result) {
    return (int64_t)[(id)result getNumberOfBorderAgents];
  }
  return result;
}

- (id)getBorderAgentForIndex:(unint64_t)a3
{
  borderAgentFinder = self->_borderAgentFinder;
  if (borderAgentFinder) {
    borderAgentFinder = (THBorderAgentFinder *)objc_claimAutoreleasedReturnValue( -[THBorderAgentFinder getBorderAgentAtIndex:]( borderAgentFinder,  "getBorderAgentAtIndex:",  a3));
  }
  return borderAgentFinder;
}

- (id)getAgentDescriptionForIndex:(unint64_t)a3
{
  borderAgentFinder = self->_borderAgentFinder;
  if (borderAgentFinder) {
    borderAgentFinder = (THBorderAgentFinder *)objc_claimAutoreleasedReturnValue( -[THBorderAgentFinder getAgentDescription:]( borderAgentFinder,  "getAgentDescription:",  a3));
  }
  return borderAgentFinder;
}

- (void)agentChanged
{
  v2 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Agent Changed", v4, 2u);
  }
}

- (void)printServer:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 addresses]);

  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 TXTRecordData]);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNetService dictionaryFromTXTRecordData:]( &OBJC_CLASS___NSNetService,  "dictionaryFromTXTRecordData:",  v5));

    if (!v6)
    {
      v17 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001C6F48();
      }
      goto LABEL_41;
    }

    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"nn"]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"xp"]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"xa"]);
    v10 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v31 = 136315650;
      v32 = "-[ThreadNetworkfinder printServer:]";
      __int16 v33 = 1024;
      int v34 = 104;
      __int16 v35 = 2112;
      v36 = (os_log_s *)v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s:%d BorderAgent MDNS Text Record Data : %@",  (uint8_t *)&v31,  0x1Cu);
    }

    if (!v7 || !v8 || !v9)
    {
      v18 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1001C7118();
      }
      goto LABEL_40;
    }

    if ([v8 length] == (id)16 && objc_msgSend(v9, "length") == (id)16)
    {
      dispatch_time_t v12 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = (os_log_s *)[v8 length];
        int v31 = 136315650;
        v32 = "-[ThreadNetworkfinder printServer:]";
        __int16 v33 = 1024;
        int v34 = 112;
        __int16 v35 = 2048;
        v36 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s:%d BorderAgent ID and XpanID are of OLD format (string based) with length : %lu",  (uint8_t *)&v31,  0x1Cu);
      }

      char v15 = 0;
    }

    else
    {
      if ([v8 length] != (id)8 || objc_msgSend(v9, "length") != (id)8)
      {
        v24 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1001C70A4((uint8_t *)&v31, (uint64_t)[v8 length], (uint64_t)objc_msgSend(v9, "length"), v19);
        }
        goto LABEL_40;
      }

      v20 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      char v15 = 1;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v21 = (os_log_s *)[v8 length];
        int v31 = 136315650;
        v32 = "-[ThreadNetworkfinder printServer:]";
        __int16 v33 = 1024;
        int v34 = 116;
        __int16 v35 = 2048;
        v36 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "%s:%d BorderAgent ID and XpanID are of NEW format (binary based) with length : %lu",  (uint8_t *)&v31,  0x1Cu);
      }
    }

    v19 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v7, 4LL);
    if (v19)
    {
      if ((v15 & 1) != 0)
      {
        v22 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
        v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v31 = 136316162;
          v32 = "-[ThreadNetworkfinder printServer:]";
          __int16 v33 = 1024;
          int v34 = 144;
          __int16 v35 = 2112;
          v36 = v19;
          __int16 v37 = 2112;
          v38 = (os_log_s *)v8;
          __int16 v39 = 2112;
          v40 = (NSString *)v9;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s:%d: mdns (network name:%@, xpanid:%@, baid : %@)",  (uint8_t *)&v31,  0x30u);
        }
      }

      else
      {
        v23 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v8, 4LL);
        v26 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v9, 4LL);
        v27 = v26;
        if (v23 && v26)
        {
          v28 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            int v31 = 136316162;
            v32 = "-[ThreadNetworkfinder printServer:]";
            __int16 v33 = 1024;
            int v34 = 140;
            __int16 v35 = 2112;
            v36 = v19;
            __int16 v37 = 2112;
            v38 = v23;
            __int16 v39 = 2112;
            v40 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%s:%d: network name str : %@, xpan id str : %@, baid str : %@",  (uint8_t *)&v31,  0x30u);
          }
        }

        else
        {
          v30 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_1001C7030();
          }
        }
      }
    }

    else
    {
      v25 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1001C6FBC();
      }
    }

LABEL_40:
LABEL_41:

    goto LABEL_42;
  }

  v16 = sub_1000160F4("com.apple.wpantund.tnm", "threadStart");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
    sub_1001C6EC0((uint64_t)v3, (os_log_s *)v6);
  }
LABEL_42:
}

- (void)agentResolved:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Agent Resolved ! Server : %@",  (uint8_t *)&v9,  0xCu);
  }

  if (v4)
  {
    -[ThreadNetworkfinder printServer:](self, "printServer:", v4);
  }

  else
  {
    v7 = sub_1000160F4("com.apple.wpantund.tnm", "commissioning");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001C718C(v8);
    }
  }
}

- (THBorderAgentFinder)borderAgentFinder
{
  return (THBorderAgentFinder *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setBorderAgentFinder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end