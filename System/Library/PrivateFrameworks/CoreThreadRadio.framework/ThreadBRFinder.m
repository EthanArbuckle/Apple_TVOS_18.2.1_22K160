@interface ThreadBRFinder
- (BOOL)disPatchStartScanToMatchListOfPreferredNetworkEntries:(id)a3;
- (BOOL)dispatchStartScan:(id)a3 extendedPanIdToFind:(id)a4 borderAgentIdToFind:(id)a5;
- (BOOL)matchTheListWithServer:(id)a3;
- (BOOL)matchTheRecord:(id)a3;
- (NSArray)preferredList;
- (NSData)borderAgentIdToFind;
- (NSData)extendedPANIDToFind;
- (NSString)networkNameToFind;
- (OS_dispatch_queue)baFinderQueue;
- (OS_dispatch_semaphore)baFinderSemaphore;
- (THBorderAgentFinder)borderAgentFinder;
- (THPreferredThreadNetwork)preferredRecord;
- (id)dataFromHexString:(id)a3;
- (id)getAgentDescriptionForIndex:(unint64_t)a3;
- (id)getBorderAgentForIndex:(unint64_t)a3;
- (int64_t)findNWs;
- (void)agentChanged;
- (void)agentResolved:(id)a3;
- (void)clean;
- (void)clear;
- (void)setBaFinderQueue:(id)a3;
- (void)setBaFinderSemaphore:(id)a3;
- (void)setBorderAgentFinder:(id)a3;
- (void)setBorderAgentIdToFind:(id)a3;
- (void)setExtendedPANIDToFind:(id)a3;
- (void)setNetworkNameToFind:(id)a3;
- (void)setPreferredList:(id)a3;
- (void)setPreferredRecord:(id)a3;
- (void)startScan:(id)a3 queue:(id)a4 timeInSec:(unsigned __int8)a5;
- (void)stopScan;
@end

@implementation ThreadBRFinder

- (BOOL)disPatchStartScanToMatchListOfPreferredNetworkEntries:(id)a3
{
  id v5 = a3;
  v6 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
  baFinderSemaphore = self->_baFinderSemaphore;
  self->_baFinderSemaphore = v6;

  v8 = self->_baFinderSemaphore;
  if (v8)
  {
    objc_storeStrong((id *)&self->_preferredList, a3);
    preferredRecord = self->_preferredRecord;
    self->_preferredRecord = 0LL;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10019F0E4;
    block[3] = &unk_1002B3828;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    NSLog( @"%s:%d: Failed to create semaphore, unexpected scenario",  "-[ThreadBRFinder disPatchStartScanToMatchListOfPreferredNetworkEntries:]",  21LL);
  }

  return v8 != 0LL;
}

- (BOOL)dispatchStartScan:(id)a3 extendedPanIdToFind:(id)a4 borderAgentIdToFind:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
  baFinderSemaphore = self->_baFinderSemaphore;
  self->_baFinderSemaphore = v12;

  v14 = self->_baFinderSemaphore;
  if (v14)
  {
    preferredList = self->_preferredList;
    self->_preferredList = 0LL;

    preferredRecord = self->_preferredRecord;
    self->_preferredRecord = 0LL;

    objc_storeStrong((id *)&self->_extendedPANIDToFind, a4);
    objc_storeStrong((id *)&self->_networkNameToFind, a3);
    objc_storeStrong((id *)&self->_borderAgentIdToFind, a5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10019F284;
    block[3] = &unk_1002B3828;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

  else
  {
    NSLog( @"%s:%d: Failed to create semaphore, unexpected scenario",  "-[ThreadBRFinder dispatchStartScan:extendedPanIdToFind:borderAgentIdToFind:]",  46LL);
  }

  return v14 != 0LL;
}

- (void)startScan:(id)a3 queue:(id)a4 timeInSec:(unsigned __int8)a5
{
  unsigned int v5 = a5;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019F3A8;
  block[3] = &unk_1002B3828;
  block[4] = self;
  v7 = (dispatch_queue_s *)a4;
  id v8 = a3;
  dispatch_async(&_dispatch_main_q, block);
  NSLog(@"Starting dispatch After");
  dispatch_time_t v9 = dispatch_time(0LL, 1000000000LL * v5);
  dispatch_after(v9, v7, v8);
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
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10019F480;
  block[3] = &unk_1002B3828;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)clean
{
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
}

- (BOOL)matchTheListWithServer:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (!v4)
  {
    NSLog(@"Error:Empty Server");
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_81;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 addresses]);

  if (!v6)
  {
    id v19 = sub_1001768B4(1);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1001A0A6C();
    }

    goto LABEL_16;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 TXTRecordData]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNetService dictionaryFromTXTRecordData:]( &OBJC_CLASS___NSNetService,  "dictionaryFromTXTRecordData:",  v7));

  if (!v8)
  {
    id v21 = sub_1001768B4(1);
    dispatch_time_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001A0AD8();
    }
    v22 = 0LL;
    v17 = 0LL;
    v23 = 0LL;
    BOOL v18 = 0;
    goto LABEL_80;
  }

  dispatch_time_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"nn"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"xp"]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"sb"]);
  v12 = v11;
  if (!v9 || !v10 || !v11)
  {
    id v24 = sub_1001768B4(1);
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1001A0E3C();
    }

    v76 = 0LL;
    v77 = 0LL;
    v17 = 0LL;
    BOOL v18 = 0;
    goto LABEL_79;
  }

  unsigned int v82 = 0;
  v72 = v11;
  [v11 getBytes:&v82 length:4];
  unsigned int v13 = bswap32(v82);
  unsigned int v82 = v13;
  id v14 = sub_1001768B4(1);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if ((v13 & 0x10) == 0)
  {
    v74 = v15;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1001A0B4C();
    }
    v76 = 0LL;
    v77 = 0LL;
    v17 = 0LL;
    BOOL v18 = 0;
LABEL_11:
    v12 = v72;
    goto LABEL_78;
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v84 = "-[ThreadBRFinder matchTheListWithServer:]";
    __int16 v85 = 1024;
    int v86 = 234;
    __int16 v87 = 1024;
    LODWORD(v88) = v82;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "%s : %d: state bit map indicates thread n/w is UP :0x%x",  buf,  0x18u);
  }

  v12 = v72;
  v77 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v9, 4LL);
  if (!v77)
  {
    id v30 = sub_1001768B4(1);
    v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      sub_1001A0BCC();
    }
    v76 = 0LL;
    v77 = 0LL;
    goto LABEL_73;
  }

  id v73 = [v10 length];
  if (v73 == (id)16)
  {
    v69 = v8;
    v70 = v5;
    id v26 = sub_1001768B4(1);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    uint64_t v75 = (uint64_t)v10;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = [v10 length];
      *(_DWORD *)buf = 136315650;
      v84 = "-[ThreadBRFinder matchTheListWithServer:]";
      __int16 v85 = 1024;
      int v86 = 247;
      __int16 v87 = 2048;
      id v88 = v28;
      v29 = "%s:%d XpanID is of OLD format (string based) with length : %lu";
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, v29, buf, 0x1Cu);
      goto LABEL_36;
    }

    goto LABEL_36;
  }

  id v31 = [v10 length];
  id v32 = sub_1001768B4(1);
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  v27 = v33;
  if (v31 != (id)8)
  {
    v74 = v33;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_1001A0D98(v10, v74);
    }
    v76 = 0LL;
LABEL_73:
    v17 = 0LL;
    BOOL v18 = 0;
    goto LABEL_78;
  }

  v69 = v8;
  v70 = v5;
  uint64_t v75 = (uint64_t)v10;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    id v34 = [v10 length];
    *(_DWORD *)buf = 136315650;
    v84 = "-[ThreadBRFinder matchTheListWithServer:]";
    __int16 v85 = 1024;
    int v86 = 251;
    __int16 v87 = 2048;
    id v88 = v34;
    v29 = "%s:%d XpanID is of NEW format (binary based) with length : %lu";
    goto LABEL_35;
  }

- (BOOL)matchTheRecord:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 addresses]);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 TXTRecordData]);
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNetService dictionaryFromTXTRecordData:]( &OBJC_CLASS___NSNetService,  "dictionaryFromTXTRecordData:",  v7));

      if (!v8)
      {
        id v25 = sub_1001768B4(1);
        dispatch_time_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1001A0F1C();
        }
        LOBYTE(v16) = 0;
        goto LABEL_35;
      }

      dispatch_time_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"nn"]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"xp"]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"xa"]);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"sb"]);
      id v13 = sub_1001768B4(1);
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v71 = "-[ThreadBRFinder matchTheRecord:]";
        __int16 v72 = 1024;
        int v73 = 339;
        __int16 v74 = 2112;
        id v75 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s:%d BorderAgent MDNS Text Record Data : %@",  buf,  0x1Cu);
      }

      preferredList = self->_preferredList;
      if (preferredList && -[NSArray count](preferredList, "count"))
      {
        LOBYTE(v16) = -[ThreadBRFinder matchTheListWithServer:](self, "matchTheListWithServer:", v5);
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }

      p_networkNameToFind = (id *)&self->_networkNameToFind;
      if ((!self->_networkNameToFind || v9)
        && ((p_extendedPANIDToFind = (id *)&self->_extendedPANIDToFind, !self->_extendedPANIDToFind) || v10)
        && (!v11 ? (BOOL v21 = self->_borderAgentIdToFind == 0LL) : (BOOL v21 = 1), v21 && v12))
      {
        p_borderAgentIdToFind = &self->_borderAgentIdToFind;
        id v67 = [v10 length];
        if (v67 == (id)16)
        {
          id v22 = sub_1001768B4(1);
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            id v24 = [v10 length];
            *(_DWORD *)buf = 136315650;
            v71 = "-[ThreadBRFinder matchTheRecord:]";
            __int16 v72 = 1024;
            int v73 = 355;
            __int16 v74 = 2048;
            id v75 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s:%d BorderAgent ID and XpanID are of OLD format (string based) with length : %lu",  buf,  0x1Cu);
          }
        }

        else
        {
          id v63 = v12;
          id v29 = [v10 length];
          id v30 = sub_1001768B4(1);
          id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
          v23 = v31;
          if (v29 != (id)8)
          {
            v12 = v63;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              sub_1001A1498(v10, v11, v23);
            }
            goto LABEL_93;
          }

          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            id v32 = [v10 length];
            *(_DWORD *)buf = 136315650;
            v71 = "-[ThreadBRFinder matchTheRecord:]";
            __int16 v72 = 1024;
            int v73 = 359;
            __int16 v74 = 2048;
            id v75 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "%s:%d BorderAgent ID and XpanID are of NEW format (binary based) with length : %lu",  buf,  0x1Cu);
          }

          v12 = v63;
        }

        if (!*p_networkNameToFind)
        {
          v23 = 0LL;
          goto LABEL_47;
        }

        v33 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v9, 4LL);
        if (v33)
        {
          v23 = (os_log_s *)v33;
          if (([*p_networkNameToFind isEqualToString:v33] & 1) == 0)
          {
            id v34 = sub_1001768B4(1);
            v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              sub_1001A1424();
            }
            goto LABEL_92;
          }

- (void)agentResolved:(id)a3
{
  id v5 = a3;
  NSLog(@"Agent Resolved");
  if (v5)
  {
    if (self->_baFinderSemaphore)
    {
      if (-[ThreadBRFinder matchTheRecord:](self, "matchTheRecord:", v5))
      {
        id v4 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(-[ThreadBRFinder baFinderSemaphore](self, "baFinderSemaphore"));
        dispatch_semaphore_signal(v4);
      }
    }

    else
    {
      NSLog( @"%s:%d: Returning no semaphore initialized, Agent Resolved : %@",  "-[ThreadBRFinder agentResolved:]",  461LL,  v5);
    }
  }

  else
  {
    NSLog(@"Agent Resolved, server is nil");
  }
}

- (id)dataFromHexString:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 lowercaseString]);
  id v4 = objc_opt_new(&OBJC_CLASS___NSMutableData);
  __str[2] = 0;
  int v5 = [v3 length];
  if (v5 >= 2)
  {
    int v6 = 0;
    int v7 = v5 - 1;
    do
    {
      int v8 = v6 + 1;
      unsigned __int8 v9 = [v3 characterAtIndex:v6];
      if ((char)v9 >= 48 && v9 <= 0x66u && v9 - 58 >= 0x27)
      {
        __str[0] = v9;
        __str[1] = [v3 characterAtIndex:v8];
        char v12 = strtol(__str, 0LL, 16);
        -[NSMutableData appendBytes:length:](v4, "appendBytes:length:", &v12, 1LL);
        int v8 = v6 + 2;
      }

      int v6 = v8;
    }

    while (v8 < v7);
  }

  return v4;
}

- (THBorderAgentFinder)borderAgentFinder
{
  return (THBorderAgentFinder *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setBorderAgentFinder:(id)a3
{
}

- (NSString)networkNameToFind
{
  return self->_networkNameToFind;
}

- (void)setNetworkNameToFind:(id)a3
{
}

- (NSData)extendedPANIDToFind
{
  return self->_extendedPANIDToFind;
}

- (void)setExtendedPANIDToFind:(id)a3
{
}

- (NSData)borderAgentIdToFind
{
  return self->_borderAgentIdToFind;
}

- (void)setBorderAgentIdToFind:(id)a3
{
}

- (NSArray)preferredList
{
  return self->_preferredList;
}

- (void)setPreferredList:(id)a3
{
}

- (THPreferredThreadNetwork)preferredRecord
{
  return self->_preferredRecord;
}

- (void)setPreferredRecord:(id)a3
{
}

- (OS_dispatch_semaphore)baFinderSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setBaFinderSemaphore:(id)a3
{
}

- (OS_dispatch_queue)baFinderQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setBaFinderQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

  ;
}

@end