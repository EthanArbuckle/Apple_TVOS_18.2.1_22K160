@interface WiFiFindAndJoinRequest
- (BOOL)_canPerformRetry:(id)a3;
- (BOOL)_checkAndRequestChipResetIfNeeded;
- (BOOL)_runFindAndJoinOnInterface:(id)a3 outError:(id *)a4;
- (BOOL)runAsynchronouslyOnQueue:(id)a3 onInterface:(id)a4 withReply:(id)a5;
- (BOOL)runSynchronouslyOnQueue:(id)a3 onInterface:(id)a4 outError:(id *)a5;
- (CWFInterface)interface;
- (CWFScanResult)joinedNetwork;
- (NSDate)startedAt;
- (NSMutableArray)joinFailureList;
- (NSMutableArray)scanFailureList;
- (NSMutableSet)joinCandidates;
- (NSMutableSet)scannedChannels;
- (NSMutableSet)supported2GHzChannels;
- (NSMutableSet)supported5GHzChannels;
- (NSMutableSet)supported6GHzChannels;
- (NSString)networkName;
- (NSString)password;
- (OS_dispatch_semaphore)chipResetWaiter;
- (WiFiFindAndJoinRequest)initWithNetworkName:(id)a3;
- (double)timeout;
- (double)totalJoinTime;
- (double)totalScanTime;
- (id)_printSupportedChannels;
- (id)description;
- (unint64_t)channelBand;
- (unint64_t)channelNumber;
- (void)_chipResetDidComplete:(id)a3;
- (void)_populateSupportedChannels;
- (void)dealloc;
- (void)setChannelBand:(unint64_t)a3;
- (void)setChannelNumber:(unint64_t)a3;
- (void)setChipResetWaiter:(id)a3;
- (void)setInterface:(id)a3;
- (void)setJoinCandidates:(id)a3;
- (void)setJoinFailureList:(id)a3;
- (void)setJoinedNetwork:(id)a3;
- (void)setNetworkName:(id)a3;
- (void)setPassword:(id)a3;
- (void)setScanFailureList:(id)a3;
- (void)setScannedChannels:(id)a3;
- (void)setStartedAt:(id)a3;
- (void)setSupported2GHzChannels:(id)a3;
- (void)setSupported5GHzChannels:(id)a3;
- (void)setSupported6GHzChannels:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTotalJoinTime:(double)a3;
- (void)setTotalScanTime:(double)a3;
- (void)submitMetric;
@end

@implementation WiFiFindAndJoinRequest

- (WiFiFindAndJoinRequest)initWithNetworkName:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___WiFiFindAndJoinRequest;
  id v3 = a3;
  v4 = -[WiFiFindAndJoinRequest init](&v25, "init");
  -[WiFiFindAndJoinRequest setNetworkName:](v4, "setNetworkName:", v3, v25.receiver, v25.super_class);

  -[WiFiFindAndJoinRequest setChannelNumber:](v4, "setChannelNumber:", 0LL);
  -[WiFiFindAndJoinRequest setChannelBand:](v4, "setChannelBand:", 0LL);
  -[WiFiFindAndJoinRequest setStartedAt:](v4, "setStartedAt:", 0LL);
  -[WiFiFindAndJoinRequest setTotalScanTime:](v4, "setTotalScanTime:", 0.0);
  -[WiFiFindAndJoinRequest setTotalJoinTime:](v4, "setTotalJoinTime:", 0.0);
  -[WiFiFindAndJoinRequest setTimeout:](v4, "setTimeout:", 60.0);
  -[WiFiFindAndJoinRequest setChipResetWaiter:](v4, "setChipResetWaiter:", 0LL);
  v5 = [NSMutableArray array];
  -[WiFiFindAndJoinRequest setScanFailureList:](v4, "setScanFailureList:", v5);

  v6 = [NSMutableArray array];
  -[WiFiFindAndJoinRequest setJoinFailureList:](v4, "setJoinFailureList:", v6);

  v7 = [NSMutableSet set];
  -[WiFiFindAndJoinRequest setSupported2GHzChannels:](v4, "setSupported2GHzChannels:", v7);

  v8 = [NSMutableSet set];
  -[WiFiFindAndJoinRequest setSupported5GHzChannels:](v4, "setSupported5GHzChannels:", v8);

  v9 = [NSMutableSet set];
  -[WiFiFindAndJoinRequest setSupported6GHzChannels:](v4, "setSupported6GHzChannels:", v9);

  v10 = [NSMutableSet set];
  -[WiFiFindAndJoinRequest setScannedChannels:](v4, "setScannedChannels:", v10);

  v11 = [NSMutableSet set];
  -[WiFiFindAndJoinRequest setJoinCandidates:](v4, "setJoinCandidates:", v11);

  v12 = [NSNotificationCenter defaultCenter];
  [v12 addObserver:v4 selector:"_chipResetDidComplete:" name:@"WiFiChipResetCompleted" object:0];

  v13 = -[CWFInterface initWithServiceType:](objc_alloc(&OBJC_CLASS___CWFInterface), "initWithServiceType:", 1LL);
  -[WiFiFindAndJoinRequest setInterface:](v4, "setInterface:", v13);

  v14 = -[WiFiFindAndJoinRequest interface];
  if (v14)
  {
    v15 = [WiFiFindAndJoinRequest interface];
    -[WiFiFindAndJoinRequest activate](v15, "activate");
  }

  else
  {
    BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v17) {
      sub_100153C78(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    v15 = v4;
    v4 = 0LL;
  }

  return v4;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = [NSMutableString stringWithFormat:@"< %@:%p ", v5, self];

  v7 = -[WiFiFindAndJoinRequest networkName];
  [v6 appendFormat:@"SSID='%@' ", v7];

  [v6 appendFormat:@"Channel=%d ",-[self channelNumber]];
  objc_msgSend(v6, "appendFormat:", @"Band=%d ", -[WiFiFindAndJoinRequest channelBand](self, "channelBand"));
  -[WiFiFindAndJoinRequest timeout](self, "timeout");
  objc_msgSend(v6, "appendFormat:", @"Timeout=%d ", (int)v8);
  [v6 appendString:@">"];
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___WiFiFindAndJoinRequest;
  -[WiFiFindAndJoinRequest dealloc](&v3, "dealloc");
}

- (BOOL)_canPerformRetry:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 code] == (id)82)
  {
    BOOL v6 = 0;
  }

  else
  {
    v7 = -[WiFiFindAndJoinRequest startedAt];
    if (v7)
    {
      double v8 = [NSDate date];
      v9 = [self startedAt];
      [v8 timeIntervalSinceDate:v9];
      double v11 = v10;
      -[WiFiFindAndJoinRequest timeout](self, "timeout");
      char v13 = v11 > v12;
    }

    else
    {
      char v13 = 0;
    }

    v14 = -[WiFiFindAndJoinRequest scanFailureList];
    v15 = (char *)[v14 count];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinFailureList](self, "joinFailureList"));
    BOOL v17 = &v15[(void)[v16 count]];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100153CEC((uint64_t)v5, v13, (unint64_t)v17 < 0xB);
    }
    BOOL v6 = ((unint64_t)v17 < 0xB) & ~v13;
  }

  return v6;
}

- (BOOL)_checkAndRequestChipResetIfNeeded
{
  double v4 = v3;
  v5 = [NSDate date];
  BOOL v6 = -[WiFiFindAndJoinRequest startedAt](self, "startedAt");
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest chipResetWaiter](self, "chipResetWaiter"));
  if (v9 || (double v10 = v4 - v8, v10 < 0.0))
  {

    goto LABEL_10;
  }

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scanFailureList](self, "scanFailureList"));
  double v12 = (char *)[v11 count];
  char v13 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinFailureList](self, "joinFailureList"));
  v14 = &v12[(void)[v13 count]];

  if ((unint64_t)v14 < 3)
  {
LABEL_10:
    LOBYTE(v20) = 1;
    return v20;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100153E98(self, v10);
  }
  v15 = [NSNotificationCenter defaultCenter];
  [v15 postNotificationName:@"WiFiChipResetRequested" object:0 userInfo:0];

  dispatch_semaphore_t v16 = dispatch_semaphore_create(0LL);
  -[WiFiFindAndJoinRequest setChipResetWaiter:](self, "setChipResetWaiter:", v16);

  BOOL v17 = [self chipResetWaiter];
  dispatch_time_t v18 = dispatch_time(0LL, (uint64_t)(v10 * 1000000000.0));
  uint64_t v19 = dispatch_semaphore_wait(v17, v18);

  BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (!v19)
  {
    if (v20) {
      sub_100153DB0(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_10;
  }

  if (v20)
  {
    sub_100153E24(v20, v21, v22, v23, v24, v25, v26, v27);
    LOBYTE(v20) = 0;
  }

  return v20;
}

- (void)_chipResetDidComplete:(id)a3
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest chipResetWaiter](self, "chipResetWaiter", a3));

  if (v4)
  {
    v5 = (dispatch_semaphore_s *)[self chipResetWaiter];
    dispatch_semaphore_signal(v5);
  }

- (void)_populateSupportedChannels
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest interface](self, "interface"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 supportedChannelsWithCountryCode:0]);

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&__int128 v7 = 136315650LL;
    __int128 v17 = v7;
    do
    {
      double v10 = 0LL;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v10);
        if (objc_msgSend(v11, "width", v17, (void)v18) == 20)
        {
          if ([v11 band] == 1)
          {
            double v12 = [self supported2GHzChannels];
LABEL_13:
            char v13 = v12;
            [v12 addObject:v11];

            goto LABEL_14;
          }

          if ([v11 band] == 2)
          {
            double v12 = [self supported5GHzChannels];
            goto LABEL_13;
          }

          if ([v11 band] == 3)
          {
            double v12 = -[WiFiFindAndJoinRequest supported6GHzChannels](self, "supported6GHzChannels");
            goto LABEL_13;
          }

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            unsigned int v14 = [v11 band];
            unsigned int v15 = [v11 channel];
            *(_DWORD *)buf = v17;
            uint64_t v23 = "-[WiFiFindAndJoinRequest _populateSupportedChannels]";
            __int16 v24 = 1024;
            unsigned int v25 = v14;
            __int16 v26 = 1024;
            unsigned int v27 = v15;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s: unknown band %d for supported channel %d",  buf,  0x18u);
          }
        }

- (id)_printSupportedChannels
{
  double v3 = +[NSMutableString string];
  objc_msgSend(v3, "appendFormat:", @"6GHz:(");
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported6GHzChannels](self, "supported6GHzChannels"));
  id v5 = [v4 allObjects];
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"description"]);
  __int128 v7 = (void *)[v6 componentsJoinedByString:@","];
  [v3 appendFormat:@"%@, ", v7];

  [v3 appendFormat:@","]);
  objc_msgSend(v3, "appendFormat:", @"5GHz:(");
  id v8 = -[WiFiFindAndJoinRequest supported5GHzChannels];
  uint64_t v9 = (void *)[v8 allObjects];
  double v10 = (void *)[v9 valueForKey:@"description"];
  double v11 = [v10 componentsJoinedByString:@","];
  [v3 appendFormat:@"%@, ", v11];

  [v3 appendFormat:@","]);
  objc_msgSend(v3, "appendFormat:", @"2.4GHz:(");
  double v12 = -[WiFiFindAndJoinRequest supported2GHzChannels](self, "supported2GHzChannels");
  char v13 = (void *)[v12 allObjects];
  unsigned int v14 = (void *)[v13 valueForKey:@"description"];
  unsigned int v15 = (void *)[v14 componentsJoinedByString:@","];
  [v3 appendFormat:@"%@, ", v15];

  [v3 appendFormat:@""]);
  return v3;
}

- (BOOL)_runFindAndJoinOnInterface:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v8 = [NSMutableSet set];
  uint64_t v9 = (void *)[self networkName];

  v142 = v6;
  if (!v9)
  {
    BOOL v132 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v132) {
      sub_100153F88(v132, v133, v134, v135, v136, v137, v138, v139);
    }
    v149 = 0LL;
    v150 = 0LL;
    id v16 = 0LL;
    v143 = 0LL;
    v144 = 0LL;
    v74 = 0LL;
    goto LABEL_105;
  }

  -[WiFiFindAndJoinRequest _populateSupportedChannels](self, "_populateSupportedChannels");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = -[WiFiFindAndJoinRequest _printSupportedChannels];
    *(_DWORD *)buf = 136315650;
    v175 = "-[WiFiFindAndJoinRequest _runFindAndJoinOnInterface:outError:]";
    __int16 v176 = 2112;
    v177 = self;
    __int16 v178 = 2112;
    *(void *)v179 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: request %@, supported channels:%@",  buf,  0x20u);
  }

  if (!-[WiFiFindAndJoinRequest channelNumber](self, "channelNumber")) {
    goto LABEL_17;
  }
  if (!-[WiFiFindAndJoinRequest channelBand](self, "channelBand")
    && -[WiFiFindAndJoinRequest channelNumber](self, "channelNumber") <= 0xE)
  {
    -[WiFiFindAndJoinRequest setChannelBand:](self, "setChannelBand:", 2LL);
  }

  unint64_t v12 = -[WiFiFindAndJoinRequest channelBand](self, "channelBand");
  if (v12 == 2) {
    goto LABEL_15;
  }
  if (v12 == 6)
  {
    uint64_t v13 = 3LL;
    goto LABEL_16;
  }

  if (v12 != 5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100154174(self);
    }
LABEL_15:
    uint64_t v13 = 1LL;
    goto LABEL_16;
  }

  uint64_t v13 = 2LL;
LABEL_16:
  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue( +[CWFChannel channelWithNumber:band:width:]( &OBJC_CLASS___CWFChannel,  "channelWithNumber:band:width:",  -[WiFiFindAndJoinRequest channelNumber](self, "channelNumber"),  v13,  20LL));
  [v7 addObject:v14];

LABEL_17:
  v150 = 0LL;
  unsigned int v15 = 0LL;
  id v16 = 0LL;
  v143 = 0LL;
  v144 = 0LL;
  __int128 v17 = 0LL;
  *(void *)&__int128 v11 = 136315394LL;
  __int128 v140 = v11;
  v151 = v7;
  v141 = a4;
  while (2)
  {
    v149 = v15;
    for (i = v17; ; i = v148)
    {
      if (!objc_msgSend(v7, "count", v140))
      {
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported6GHzChannels](self, "supported6GHzChannels"));
        id v20 = [v19 count];

        if (v20)
        {
          v145 = i;
          __int128 v168 = 0u;
          __int128 v169 = 0u;
          __int128 v166 = 0u;
          __int128 v167 = 0u;
          __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported6GHzChannels](self, "supported6GHzChannels"));
          id v22 = [v21 countByEnumeratingWithState:&v166 objects:v185 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v167;
            do
            {
              for (j = 0LL; j != v23; j = (char *)j + 1)
              {
                if (*(void *)v167 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void *)(*((void *)&v166 + 1) + 8LL * (void)j);
                unsigned int v27 = [self scannedChannels];
                unsigned __int8 v28 = [v27 containsObject:v26];

                if ((v28 & 1) == 0) {
                  [v151 addObject:v26];
                }
              }

              id v23 = [v21 countByEnumeratingWithState:&v166 objects:v185 count:16];
            }

            while (v23);
          }

          __int128 v7 = v151;
          i = v145;
        }
      }

      if (![v7 count])
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported5GHzChannels](self, "supported5GHzChannels"));
        id v30 = [v29 count];

        if (v30)
        {
          v146 = i;
          __int128 v164 = 0u;
          __int128 v165 = 0u;
          __int128 v162 = 0u;
          __int128 v163 = 0u;
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported5GHzChannels](self, "supported5GHzChannels"));
          id v32 = [v31 countByEnumeratingWithState:&v162 objects:v184 count:16];
          if (v32)
          {
            id v33 = v32;
            uint64_t v34 = *(void *)v163;
            do
            {
              for (k = 0LL; k != v33; k = (char *)k + 1)
              {
                if (*(void *)v163 != v34) {
                  objc_enumerationMutation(v31);
                }
                uint64_t v36 = *(void *)(*((void *)&v162 + 1) + 8LL * (void)k);
                v37 = -[WiFiFindAndJoinRequest scannedChannels];
                unsigned __int8 v38 = [v37 containsObject:v36];

                if ((v38 & 1) == 0) {
                  [v151 addObject:v36];
                }
              }

              id v33 = [v31 countByEnumeratingWithState:&v162 objects:v184 count:16];
            }

            while (v33);
          }

          __int128 v7 = v151;
          i = v146;
        }
      }

      if (![v7 count])
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported2GHzChannels](self, "supported2GHzChannels"));
        id v40 = [v39 count];

        if (v40)
        {
          v147 = i;
          __int128 v161 = 0u;
          __int128 v159 = 0u;
          __int128 v160 = 0u;
          __int128 v158 = 0u;
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported2GHzChannels](self, "supported2GHzChannels"));
          id v42 = [v41 countByEnumeratingWithState:&v158 objects:v183 count:16];
          if (v42)
          {
            id v43 = v42;
            uint64_t v44 = *(void *)v159;
            do
            {
              for (m = 0LL; m != v43; m = (char *)m + 1)
              {
                if (*(void *)v159 != v44) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v46 = *(void *)(*((void *)&v158 + 1) + 8LL * (void)m);
                v47 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scannedChannels](self, "scannedChannels"));
                unsigned __int8 v48 = [v47 containsObject:v46];

                if ((v48 & 1) == 0) {
                  [v151 addObject:v46];
                }
              }

              id v43 = [v41 countByEnumeratingWithState:&v158 objects:v183 count:16];
            }

            while (v43);
          }

          __int128 v7 = v151;
          i = v147;
        }
      }

      id v49 = objc_alloc_init(&OBJC_CLASS___CWFScanParameters);

      v50 = [self networkName];
      [v49 setSSID:v50];

      [v49 setBSSType:3];
      [v49 setPHYMode:1];
      [v49 setNumberOfScans:1];
      [v49 setIncludeHiddenNetworks:1];
      if ([v7 count]) {
        v51 = v7;
      }
      else {
        v51 = 0LL;
      }
      [v49 setChannels:v51];
      if ([v7 count]) {
        uint64_t v52 = 110LL;
      }
      else {
        uint64_t v52 = 45LL;
      }
      [v49 setDwellTime:v52];
      [v49 setScanFlags:2592];
      [v49 setScanType:1];
      uint64_t v53 = [NSDate date];

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest interface](self, "interface"));
      id v157 = 0LL;
      v149 = v49;
      v55 = (void *)[v54 performScanWithParameters:v49 error:&v157];
      v56 = (WiFiFindAndJoinRequest *)v157;

      if (v56)
      {
        v57 = -[WiFiFindAndJoinRequest scanFailureList];
        [v57 addObject:v56];
LABEL_66:

        goto LABEL_67;
      }

      if (!v55 || ![v55 count])
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scanFailureList](self, "scanFailureList"));
        v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  2LL,  0LL));
        [v57 addObject:v58];

        goto LABEL_66;
      }

- (void)submitMetric
{
  if (&_AnalyticsSendEventLazy)
  {
    double v3 = [NSMutableDictionary dictionary];
    double v4 = [self joinedNetwork];
    if (v4) {
      id v5 = @"Success";
    }
    else {
      id v5 = @"Fail";
    }
    [v3 setObject:v5 forKeyedSubscript:@"Status"];

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest chipResetWaiter](self, "chipResetWaiter"));
    if (v6) {
      __int128 v7 = @"YES";
    }
    else {
      __int128 v7 = @"NO";
    }
    [v3 setObject:v7 forKeyedSubscript:@"DidPerformChipReset"];

    id v8 = [NSDate date];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest startedAt](self, "startedAt"));
    [v8 timeIntervalSinceDate:v9];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  (unint64_t)(v10 * 1000.0)));
    [v3 setObject:v11 forKeyedSubscript:@"CompletionTimeMillisecs"];

    -[WiFiFindAndJoinRequest totalScanTime](self, "totalScanTime");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  (unint64_t)(v12 * 1000.0)));
    [v3 setObject:v13 forKeyedSubscript:@"ScanTimeMillisecs"];

    -[WiFiFindAndJoinRequest totalJoinTime](self, "totalJoinTime");
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLong:",  (unint64_t)(v14 * 1000.0)));
    [v3 setObject:v15 forKeyedSubscript:@"JoinTimeMillisecs"];

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest supported2GHzChannels](self, "supported2GHzChannels"));
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v16 count]));
    [v3 setObject:v17 forKeyedSubscript:@"Supported2GHzChannelCount"];

    __int128 v18 = -[WiFiFindAndJoinRequest supported5GHzChannels];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v18 count]));
    [v3 setObject:v19 forKeyedSubscript:@"Supported5GHzChannelCount"];

    id v20 = -[WiFiFindAndJoinRequest supported6GHzChannels];
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v20 count]));
    [v3 setObject:v21 forKeyedSubscript:@"Supported6GHzChannelCount"];

    id v22 = -[WiFiFindAndJoinRequest scannedChannels];
    id v23 = [NSNumber numberWithUnsignedInteger:[v22 count]];
    [v3 setObject:v23 forKeyedSubscript:@"ScannedChannelCount"];

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scanFailureList](self, "scanFailureList"));
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v24 count]));
    [v3 setObject:v25 forKeyedSubscript:@"ScanFailureCount"];

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinFailureList](self, "joinFailureList"));
    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v26 count]));
    [v3 setObject:v27 forKeyedSubscript:@"JoinFailureCount"];

    unsigned __int8 v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[WiFiFindAndJoinRequest channelNumber](self, "channelNumber")));
    [v3 setObject:v28 forKeyedSubscript:@"RequestedChannel"];

    v29 = [NSNumber numberWithUnsignedInteger:[self channelBand]];
    [v3 setObject:v29 forKeyedSubscript:@"RequestedBand"];

    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinedNetwork](self, "joinedNetwork"));
    if (v30)
    {
      v31 = [self joinedNetwork];
      id v32 = [v31 channel];
      id v33 = [NSNumber numberWithUnsignedInteger:v32.channel];
      [v3 setObject:v33 forKeyedSubscript:@"JoinedChannel"];
    }

    else
    {
      [v3 setObject:0 forKeyedSubscript:@"JoinedChannel"];
    }

    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinedNetwork](self, "joinedNetwork"));
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest joinedNetwork](self, "joinedNetwork"));
      uint64_t v36 = (void *)[v35 channel];
      v37 = [NSNumber numberWithUnsignedInteger:([v36 band])];
      [v3 setObject:v37 forKeyedSubscript:@"JoinedBand"];
    }

    else
    {
      [v3 setObject:0 forKeyedSubscript:@"JoinedBand"];
    }

    unsigned __int8 v38 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiFindAndJoinRequest scanFailureList](self, "scanFailureList"));
    if ([v38 count])
    {
      v39 = -[WiFiFindAndJoinRequest scanFailureList];
      id v40 = [v39 valueForKey:@"description"];
      v41 = [v40 componentsJoinedByString:@","];
      [v3 setObject:v41 forKeyedSubscript:@"ScanFailures"];
    }

    else
    {
      [v3 setObject:0 forKeyedSubscript:@"ScanFailures"];
    }

    id v42 = [self joinFailureList];
    if ([v42 count])
    {
      id v43 = [self joinFailureList];
      uint64_t v44 = (void *)[v43 valueForKey:@"description"];
      v45 = [v44 componentsJoinedByString:@","];
      [v3 setObject:v45 forKeyedSubscript:@"JoinFailures"];
    }

    else
    {
      [v3 setObject:0 forKeyedSubscript:@"JoinFailures"];
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "-[WiFiFindAndJoinRequest submitMetric]";
      __int16 v51 = 2112;
      uint64_t v52 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
    }

    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472LL;
    v47[2] = sub_10006017C;
    v47[3] = &unk_1001E4100;
    id v48 = v3;
    id v46 = v3;
    AnalyticsSendEventLazy(@"com.apple.wifi.findandjoinnetwork", v47);
  }

- (BOOL)runSynchronouslyOnQueue:(id)a3 onInterface:(id)a4 outError:(id *)a5
{
  id v8 = (dispatch_queue_s *)a3;
  id v9 = a4;
  uint64_t v20 = 0LL;
  __int128 v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 0;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x3032000000LL;
  v18[3] = sub_1000602EC;
  v18[4] = sub_1000602FC;
  id v19 = 0LL;
  double v10 = [NSDate date];
  -[WiFiFindAndJoinRequest setStartedAt:](self, "setStartedAt:", v10);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100060304;
  block[3] = &unk_1001E4128;
  block[4] = self;
  id v14 = v9;
  unsigned int v15 = &v20;
  id v16 = v18;
  __int128 v17 = a5;
  id v11 = v9;
  dispatch_sync(v8, block);
  LOBYTE(self) = *((_BYTE *)v21 + 24);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return (char)self;
}

- (BOOL)runAsynchronouslyOnQueue:(id)a3 onInterface:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [NSDate date];
  -[WiFiFindAndJoinRequest setStartedAt:](self, "setStartedAt:", v11);

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000604A0;
  v18[3] = &unk_1001E4178;
  v18[4] = self;
  id v19 = v9;
  id v20 = v8;
  id v21 = v10;
  id v14 = v8;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(v13, v18);

  return 1;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  self->_password = (NSString *)a3;
}

- (unint64_t)channelNumber
{
  return self->_channelNumber;
}

- (void)setChannelNumber:(unint64_t)a3
{
  self->_channelNumber = a3;
}

- (unint64_t)channelBand
{
  return self->_channelBand;
}

- (void)setChannelBand:(unint64_t)a3
{
  self->_channelBand = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (CWFScanResult)joinedNetwork
{
  return self->_joinedNetwork;
}

- (void)setJoinedNetwork:(id)a3
{
}

- (NSDate)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(id)a3
{
}

- (NSMutableArray)scanFailureList
{
  return self->_scanFailureList;
}

- (void)setScanFailureList:(id)a3
{
}

- (NSMutableArray)joinFailureList
{
  return self->_joinFailureList;
}

- (void)setJoinFailureList:(id)a3
{
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (OS_dispatch_semaphore)chipResetWaiter
{
  return self->_chipResetWaiter;
}

- (void)setChipResetWaiter:(id)a3
{
}

- (NSMutableSet)supported6GHzChannels
{
  return self->_supported6GHzChannels;
}

- (void)setSupported6GHzChannels:(id)a3
{
}

- (NSMutableSet)supported5GHzChannels
{
  return self->_supported5GHzChannels;
}

- (void)setSupported5GHzChannels:(id)a3
{
}

- (NSMutableSet)supported2GHzChannels
{
  return self->_supported2GHzChannels;
}

- (void)setSupported2GHzChannels:(id)a3
{
}

- (NSMutableSet)scannedChannels
{
  return self->_scannedChannels;
}

- (void)setScannedChannels:(id)a3
{
}

- (NSMutableSet)joinCandidates
{
  return self->_joinCandidates;
}

- (void)setJoinCandidates:(id)a3
{
}

- (double)totalScanTime
{
  return self->_totalScanTime;
}

- (void)setTotalScanTime:(double)a3
{
  self->_totalScanTime = a3;
}

- (double)totalJoinTime
{
  return self->_totalJoinTime;
}

- (void)setTotalJoinTime:(double)a3
{
  self->_totalJoinTime = a3;
}

- (void).cxx_destruct
{
}

@end