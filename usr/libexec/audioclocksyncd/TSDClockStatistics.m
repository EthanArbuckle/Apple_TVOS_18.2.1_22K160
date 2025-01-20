@interface TSDClockStatistics
- (TSDClockStatistics)initWithClockIdentifier:(unint64_t)a3;
- (unint64_t)clockIdentifier;
- (void)dealloc;
- (void)didBeginClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5;
- (void)didChangeClockMasterForClock:(id)a3;
- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4;
- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5;
- (void)didGetStatsOfLocalPortNumber:(unint64_t)a3 mean:(unint64_t)a4 median:(unint64_t)a5 stddev:(unint64_t)a6 min:(unint64_t)a7 max:(unint64_t)a8 numberOfSamples:(unsigned int)a9 forClock:(id)a10;
- (void)didProcessSync:(id)a3;
- (void)didResetClock:(id)a3;
- (void)finalizeClock;
- (void)logStatistics;
@end

@implementation TSDClockStatistics

- (TSDClockStatistics)initWithClockIdentifier:(unint64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TSDClockStatistics;
  v4 = -[TSDClockStatistics init](&v18, "init");
  v5 = v4;
  if (v4)
  {
    if (a3 == -1LL)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v20 = "clockIdentifier != TSNullClockIdentifier";
        __int16 v21 = 2048;
        uint64_t v22 = 0LL;
        __int16 v23 = 2048;
        uint64_t v24 = 0LL;
        __int16 v25 = 2080;
        v26 = &unk_100030E57;
        __int16 v27 = 2080;
        v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockStatistics.m";
        __int16 v29 = 1024;
        int v30 = 103;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
      }

      v7 = v5;
      v5 = 0LL;
    }

    else
    {
      v4->_clockIdentifier = a3;
      v4->_firstStatistics = 1;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[TSDClockManager sharedClockManager](&OBJC_CLASS___TSDClockManager, "sharedClockManager"));
      v7 = (TSDClockStatistics *)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "clockWithClockIdentifier:",  -[TSDClockStatistics clockIdentifier](v5, "clockIdentifier")));

      if (v7)
      {
        objc_storeStrong((id *)&v5->_clock, v7);
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        v9 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
        v12 = _NSConcreteStackBlock;
        uint64_t v13 = 3221225472LL;
        v14 = sub_100014974;
        v15 = &unk_10003C838;
        v16 = v7;
        unint64_t v17 = a3;
        v5->_stateDumpHandler = os_state_add_handler(v9, &v12);

        -[TSDKernelClock addClient:](v5->_clock, "addClient:", v5, v12, v13, v14, v15);
        v10 = v16;
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v20 = "clock != nil";
          __int16 v21 = 2048;
          uint64_t v22 = 0LL;
          __int16 v23 = 2048;
          uint64_t v24 = 0LL;
          __int16 v25 = 2080;
          v26 = &unk_100030E57;
          __int16 v27 = 2080;
          v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockStatistics.m";
          __int16 v29 = 1024;
          int v30 = 110;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n",  buf,  0x3Au);
        }

        v10 = v5;
        v5 = 0LL;
      }
    }
  }

  return v5;
}

- (void)logStatistics
{
  uint64_t v3 = mach_absolute_time();
  clock = self->_clock;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___TSDgPTPClock);
  if ((objc_opt_isKindOfClass(clock, v5) & 1) != 0)
  {
    v6 = self->_clock;
    id v7 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = -[TSDKernelClock clockIdentifier](self->_clock, "clockIdentifier");
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PTP Clock Statistics for 0x%016llx\n",  buf,  0xCu);
    }

    id v9 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = -[TSDKernelClock grandmasterIdentity](v6, "grandmasterIdentity");
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    Grandmaster Identity: 0x%016llx\n",  buf,  0xCu);
    }

    unsigned int v11 = -[TSDKernelClock lockState](v6, "lockState");
    if (v11 > 2) {
      v12 = @"Unknown";
    }
    else {
      v12 = off_10003C858[v11];
    }
    id v16 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = -[__CFString UTF8String](v12, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    Clock lock state: %s\n",  buf,  0xCu);
    }

    id v384 = 0LL;
    unsigned int v18 = -[TSDKernelClock getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:]( v6,  "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentit y:portNumber:withError:",  &v391,  &v390,  &v389,  &v387,  &v386,  &v385,  &v384);
    id v19 = v384;
    id v20 = &_os_log_default;
    BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v21)
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&uint8_t buf[4] = v391;
        *(_WORD *)&buf[12] = 2048;
        unint64_t v395 = v390;
        __int16 v396 = 2048;
        double v397 = (double)v391 / (double)v390;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    Mach Rate Ratio: %llu/%llu (%0.12f)\n",  buf,  0x20u);
      }

      id v22 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v389;
        *(_WORD *)&buf[12] = 2048;
        unint64_t v395 = v387;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    Mach Anchors: %llu, %llu\n",  buf,  0x16u);
      }

      id v23 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v386;
        *(_WORD *)&buf[12] = 1024;
        LODWORD(v395) = v385;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    Mach Sync Identity: 0x%016llx.%hu\n",  buf,  0x12u);
      }
    }

    else if (v21)
    {
      id v29 = objc_claimAutoreleasedReturnValue([v19 localizedDescription]);
      id v30 = [v29 UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v30;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    Mach Sync Info: failed to get rate ratio and anchors with error %s\n",  buf,  0xCu);
    }

    id v383 = v19;
    unsigned int v31 = -[TSDKernelClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:]( v6,  "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIde ntity:portNumber:withError:",  &v391,  &v390,  &v388,  &v387,  &v386,  &v385,  &v383);
    id v293 = v383;

    id v32 = &_os_log_default;
    BOOL v33 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    v295 = self;
    if (v31)
    {
      if (v33)
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&uint8_t buf[4] = v391;
        *(_WORD *)&buf[12] = 2048;
        unint64_t v395 = v390;
        __int16 v396 = 2048;
        double v397 = (double)v391 / (double)v390;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    TimeSync Rate Ratio: %llu/%llu (%0.12f)\n",  buf,  0x20u);
      }

      id v34 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v388;
        *(_WORD *)&buf[12] = 2048;
        unint64_t v395 = v387;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    TimeSync Anchors: %llu, %llu\n",  buf,  0x16u);
      }

      id v35 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v386;
        *(_WORD *)&buf[12] = 1024;
        LODWORD(v395) = v385;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    TimeSync Sync Identity: 0x%016llx.%hu\n",  buf,  0x12u);
      }
    }

    else if (v33)
    {
      id v42 = objc_claimAutoreleasedReturnValue([v293 localizedDescription]);
      id v43 = [v42 UTF8String];
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v43;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    TimeSync Sync Info: failed to get rate ratio and anchors with error %s\n",  buf,  0xCu);
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[TSDKernelClock ports](v6, "ports"));
    id obj = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v357 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    __int128 v379 = 0u;
    __int128 v380 = 0u;
    __int128 v381 = 0u;
    __int128 v382 = 0u;
    id v45 = v44;
    id v46 = [v45 countByEnumeratingWithState:&v379 objects:v393 count:16];
    id v342 = v45;
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v380;
      do
      {
        for (i = 0LL; i != v47; i = (char *)i + 1)
        {
          if (*(void *)v380 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = *(void **)(*((void *)&v379 + 1) + 8LL * (void)i);
          uint64_t v51 = objc_opt_class(&OBJC_CLASS___TSDgPTPFDPtPPort);
          if ((objc_opt_isKindOfClass(v50, v51) & 1) == 0)
          {
            uint64_t v52 = objc_opt_class(&OBJC_CLASS___TSDgPTPFDEtEPort);
            if ((objc_opt_isKindOfClass(v50, v52) & 1) == 0) {
              continue;
            }
          }

          v53 = (void *)objc_claimAutoreleasedReturnValue([v50 statistics]);
          if (v53)
          {
            v54 = v53;
            v55 = (void *)objc_claimAutoreleasedReturnValue([v53 portIdentifier]);
            [obj setObject:v54 forKeyedSubscript:v55];

            v56 = (void *)objc_claimAutoreleasedReturnValue([v54 portIdentifier]);
            [v357 setObject:v50 forKeyedSubscript:v56];

            id v45 = v342;
          }
        }

        id v47 = [v45 countByEnumeratingWithState:&v379 objects:v393 count:16];
      }

      while (v47);
    }

    v57 = v295;
    if (!v295->_firstStatistics)
    {
      v292 = v6;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[TSDClockManager sharedClockManager](&OBJC_CLASS___TSDClockManager, "sharedClockManager"));
      unint64_t v344 = (unint64_t)[v58 machAbsoluteTicksToNanoseconds:v3 - v295->_lastStatisticsTime];

      __int128 v377 = 0u;
      __int128 v378 = 0u;
      __int128 v375 = 0u;
      __int128 v376 = 0u;
      id v59 = obj;
      id v303 = [v59 countByEnumeratingWithState:&v375 objects:v392 count:16];
      if (!v303) {
        goto LABEL_479;
      }
      uint64_t v302 = *(void *)v376;
      id v294 = v59;
      while (1)
      {
        uint64_t v60 = 0LL;
        do
        {
          if (*(void *)v376 != v302) {
            objc_enumerationMutation(v59);
          }
          uint64_t v356 = v60;
          uint64_t v61 = *(void *)(*((void *)&v375 + 1) + 8 * v60);
          v62 = (void *)objc_claimAutoreleasedReturnValue([v357 objectForKeyedSubscript:v61]);
          v63 = (void *)objc_claimAutoreleasedReturnValue([v59 objectForKeyedSubscript:v61]);
          id v64 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "    Port:\n",  buf,  2u);
          }

          switch([v63 portType])
          {
            case 0u:
              id v65 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Unknown\n";
              break;
            case 1u:
              id v67 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Ethernet\n";
              break;
            case 2u:
              id v68 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Unicast Link Layer PtP\n";
              break;
            case 3u:
              id v69 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Unicast UDPv4 PtP\n";
              break;
            case 4u:
              id v70 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Unicast UDPv6 PtP\n";
              break;
            case 5u:
              id v71 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Unicast Link Layer EtE\n";
              break;
            case 6u:
              id v72 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Unicast UDPv4 EtE\n";
              break;
            case 7u:
              id v73 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Unicast UDPv6 EtE\n";
              break;
            case 8u:
              id v74 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v66 = "        Port Type: Local Clock\n";
              break;
            default:
              goto LABEL_88;
          }

          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v66, buf, 2u);
LABEL_87:

LABEL_88:
          id v75 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v76 = objc_claimAutoreleasedReturnValue([v62 interfaceName]);
            id v77 = [v76 UTF8String];
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = v77;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "        Interface: %s\n",  buf,  0xCu);
          }

          id v78 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v79 = objc_claimAutoreleasedReturnValue([v62 destinationAddressString]);
            id v80 = [v79 UTF8String];
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = v80;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "        Destination Address: %s\n",  buf,  0xCu);
          }

          id v81 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v82 = [v62 propagationDelay];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v82;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "        Propgation Delay: %u\n",  buf,  8u);
          }

          id v83 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v84 = [v62 minimumPropagationDelay];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v84;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "        Minimum Propagation Delay: %u\n",  buf,  8u);
          }

          id v85 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v86 = [v62 maximumPropagationDelay];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v86;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "        Maximum Propagation Delay: %u\n",  buf,  8u);
          }

          id v87 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v88 = [v62 minimumRawDelay];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v88;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "        Minimum Raw Delay: %u\n",  buf,  8u);
          }

          id v89 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v90 = [v62 maximumRawDelay];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v90;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "        Maximum Raw Delay: %u\n",  buf,  8u);
          }

          id v91 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v92 = [v62 portNumber];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v92;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "        Local Clock Port Number: %hu\n",  buf,  8u);
          }

          id v93 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            id v94 = [v62 remoteClockIdentity];
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v94;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "        Remote Clock Identity: 0x%016llx\n",  buf,  0xCu);
          }

          id v95 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v96 = [v62 remotePortNumber];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v96;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "        Remote Clock Port Number: %hu\n",  buf,  8u);
          }

          switch([v62 portRole])
          {
            case 0u:
              id v97 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_120;
              }
              *(_WORD *)buf = 0;
              v98 = "        Port Role: Unknown\n";
              break;
            case 1u:
              id v101 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_120;
              }
              *(_WORD *)buf = 0;
              v98 = "        Port Role: Disabled\n";
              break;
            case 2u:
              id v99 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_120;
              }
              *(_WORD *)buf = 0;
              v98 = "        Port Role: Passive\n";
              break;
            case 3u:
              id v102 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_120;
              }
              *(_WORD *)buf = 0;
              v98 = "        Port Role: Slave\n";
              break;
            case 4u:
              id v100 = &_os_log_default;
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_120;
              }
              *(_WORD *)buf = 0;
              v98 = "        Port Role: Master\n";
              break;
            default:
              goto LABEL_121;
          }

          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v98, buf, 2u);
LABEL_120:

LABEL_121:
          v103 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v57->_lastStatistics,  "objectForKeyedSubscript:",  v61));

          if (v103)
          {
            v104 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( v57->_lastStatistics,  "objectForKeyedSubscript:",  v61));
            unsigned int v105 = [v104 portRole];
            if (v105 != [v63 portRole])
            {
              id v106 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "        Port Role changed since last statistics log. Ignore expected counts.\n",  buf,  2u);
              }
            }

            if ([v63 portRole] == 3 || objc_msgSend(v63, "portRole") == 2)
            {
              unint64_t v107 = v344 / sub_100017C60((int)[v62 remoteSyncLogMeanInterval]);
              unint64_t v108 = v344 / sub_100017C60((int)[v62 remoteAnnounceLogMeanInterval]);
            }

            else
            {
              LODWORD(v108) = 0;
              LODWORD(v107) = 0;
            }

            v349 = v62;
            if ([v63 portRole] == 4)
            {
              unint64_t v361 = v344 / sub_100017C60((int)[v62 localSyncLogMeanInterval]);
              unint64_t v370 = v344 / sub_100017C60((int)[v62 localAnnounceLogMeanInterval]);
            }

            else
            {
              LODWORD(v370) = 0;
              LODWORD(v361) = 0;
            }

            unsigned int v347 = [v63 receivedSyncCounter];
            unsigned int v345 = [v104 receivedSyncCounter];
            unsigned int v109 = v347 - v345;
            unsigned int v110 = [v63 receivedFollowUpCounter];
            unsigned int v111 = [v104 receivedFollowUpCounter];
            unsigned int v306 = [v63 receivedAnnounceCounter];
            unsigned int v350 = [v104 receivedAnnounceCounter];
            unsigned int v305 = [v63 receivedSignalCounter];
            unsigned int v304 = [v104 receivedSignalCounter];
            unsigned int v308 = [v63 receivedPacketDiscardCounter];
            unsigned int v307 = [v104 receivedPacketDiscardCounter];
            unsigned int v310 = [v63 syncReceiptTimeoutCounter];
            unsigned int v309 = [v104 syncReceiptTimeoutCounter];
            unsigned int v312 = [v63 announceReceiptTimeoutCounter];
            unsigned int v311 = [v104 announceReceiptTimeoutCounter];
            unsigned int v314 = [v63 allowedLostResponsesExceededCounter];
            unsigned int v313 = [v104 allowedLostResponsesExceededCounter];
            unsigned int v353 = [v63 transmittedSyncCounter];
            unsigned int v358 = [v104 transmittedSyncCounter];
            unsigned int v316 = [v63 transmittedFollowUpCounter];
            unsigned int v315 = [v104 transmittedFollowUpCounter];
            unsigned int v367 = [v63 transmittedAnnounceCounter];
            unsigned int v364 = [v104 transmittedAnnounceCounter];
            unsigned int v318 = [v63 transmittedSignalCounter];
            unsigned int v317 = [v104 transmittedSignalCounter];
            unsigned int v320 = [v63 transmittedPacketDiscardCounter];
            unsigned int v319 = [v104 transmittedPacketDiscardCounter];
            unsigned int v322 = [v63 attemptedSyncCounter];
            unsigned int v321 = [v104 attemptedSyncCounter];
            unsigned int v327 = [v63 attemptedFollowUpCounter];
            unsigned int v324 = [v104 attemptedFollowUpCounter];
            unsigned int v333 = [v63 attemptedAnnounceCounter];
            unsigned int v330 = [v104 attemptedAnnounceCounter];
            unsigned int v339 = [v63 attemptedSignalCounter];
            unsigned int v336 = [v104 attemptedSignalCounter];
            unsigned int v299 = [v63 rawDelayExceededCounter];
            unsigned int v298 = [v104 rawDelayExceededCounter];
            unsigned int v301 = [v63 rawDelayMeasurementCounter];
            unsigned int v300 = [v104 rawDelayMeasurementCounter];
            unsigned int v112 = ((int)v107 + 9) / 0xAu;
            id v113 = &_os_log_default;
            BOOL v114 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v115 = v347 - v345 < v107 - v112 && v107 >= v112;
            if (v115 || v109 > v112 + v107)
            {
              if (v114)
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&uint8_t buf[4] = v347 - v345;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v107;
                LOWORD(v395) = 1024;
                *(_DWORD *)((char *)&v395 + 2) = ((int)v107 + 9) / 0xAu;
                v116 = "        Received Sync Counter: %u out of expected bounds (%u ± %u)\n";
                uint32_t v117 = 20;
LABEL_142:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v116,  buf,  v117);
              }
            }

            else if (v114)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v347 - v345;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v107;
              v116 = "        Received Sync Counter: %u expected %u\n";
              uint32_t v117 = 14;
              goto LABEL_142;
            }

            unsigned int v118 = v110 - v111;

            id v119 = &_os_log_default;
            BOOL v120 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v121 = v118 >= v109 - 1 || v347 == v345;
            unsigned int v296 = v347 - v345 + 1;
            unsigned int v297 = v109 - 1;
            if (v121 && v118 <= v109 + 1)
            {
              if (v120)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v118;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v347 - v345;
                v122 = "        Received FollowUp Counter: %u expected %u\n";
                goto LABEL_153;
              }
            }

            else if (v120)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v118;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v347 - v345;
              v122 = "        Received FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_153:
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v122,  buf,  0xEu);
            }

            unsigned int v123 = v306 - v350;

            unsigned int v124 = ((int)v108 + 9) / 0xAu;
            id v125 = &_os_log_default;
            BOOL v126 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v127 = v306 - v350 < v108 - v124 && v108 >= v124;
            if (v127 || v123 > v124 + v108)
            {
              if (v126)
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&uint8_t buf[4] = v306 - v350;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v108;
                LOWORD(v395) = 1024;
                *(_DWORD *)((char *)&v395 + 2) = ((int)v108 + 9) / 0xAu;
                v128 = "        Received Announce Counter: %u out of expected bounds (%u ± %u)\n";
                uint32_t v129 = 20;
LABEL_163:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v128,  buf,  v129);
              }
            }

            else if (v126)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v306 - v350;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v108;
              v128 = "        Received Announce Counter: %u expected %u\n";
              uint32_t v129 = 14;
              goto LABEL_163;
            }

            id v130 = &_os_log_default;
            BOOL v131 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v132 = v305 - v304 >= v123 - 1 || v306 == v350;
            if (v132 && v305 - v304 <= v123 + 1)
            {
              if (v131)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v305 - v304;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v306 - v350;
                v133 = "        Received Signal Counter: %u expected %u\n";
                goto LABEL_174;
              }
            }

            else if (v131)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v305 - v304;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v306 - v350;
              v133 = "        Received Signal Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_174:
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v133,  buf,  0xEu);
            }

            id v134 = &_os_log_default;
            BOOL v135 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v308 == v307)
            {
              unsigned int v136 = v353;
              unsigned int v137 = v314;
              if (v135)
              {
                *(void *)buf = 67109120LL;
                v138 = "        Received Packet Discard Counter: %u\n";
                goto LABEL_180;
              }
            }

            else
            {
              unsigned int v136 = v353;
              unsigned int v137 = v314;
              if (v135)
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v308 - v307;
                v138 = "        Received Packet Discard Counter: %u greater than 0\n";
LABEL_180:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v138,  buf,  8u);
              }
            }

            id v139 = &_os_log_default;
            BOOL v140 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v310 == v309)
            {
              if (v140)
              {
                *(void *)buf = 67109120LL;
                v141 = "        Received Sync Receipt Timeout Counter: %u\n";
                goto LABEL_186;
              }
            }

            else if (v140)
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v310 - v309;
              v141 = "        Received Sync Receipt Timeout Counter: %u greater than 0\n";
LABEL_186:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v141, buf, 8u);
            }

            id v142 = &_os_log_default;
            BOOL v143 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v312 == v311)
            {
              if (v143)
              {
                *(void *)buf = 67109120LL;
                v144 = "        Received Announce Receipt Timeout Counter: %u\n";
                goto LABEL_192;
              }
            }

            else if (v143)
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v312 - v311;
              v144 = "        Received Announce Receipt Timeout Counter: %u greater than 0\n";
LABEL_192:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v144, buf, 8u);
            }

            id v145 = &_os_log_default;
            BOOL v146 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v137 == v313)
            {
              if (v146)
              {
                *(void *)buf = 67109120LL;
                v147 = "        Received Allowed Lost Responses Exceeded Counter: %u\n";
                goto LABEL_198;
              }
            }

            else if (v146)
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v137 - v313;
              v147 = "        Received Allowed Lost Responses Exceeded Counter: %u greater than 0\n";
LABEL_198:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v147, buf, 8u);
            }

            unsigned int v148 = v136 - v358;

            unsigned int v149 = ((int)v361 + 9) / 0xAu;
            id v150 = &_os_log_default;
            BOOL v151 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v152 = v136 - v358 < v361 - v149 && v361 >= v149;
            if (v152 || v148 > v149 + v361)
            {
              if (v151)
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&uint8_t buf[4] = v136 - v358;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v361;
                LOWORD(v395) = 1024;
                *(_DWORD *)((char *)&v395 + 2) = ((int)v361 + 9) / 0xAu;
                v153 = "        Transmitted Sync Counter: %u out of expected bounds (%u ± %u)\n";
                uint32_t v154 = 20;
LABEL_208:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v153,  buf,  v154);
              }
            }

            else if (v151)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v136 - v358;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v361;
              v153 = "        Transmitted Sync Counter: %u expected %u\n";
              uint32_t v154 = 14;
              goto LABEL_208;
            }

            id v155 = &_os_log_default;
            BOOL v156 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v157 = v316 - v315 >= v148 - 1 || v136 == v358;
            if (v157 && v316 - v315 <= v148 + 1)
            {
              if (v156)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v316 - v315;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v136 - v358;
                v158 = "        Transmitted FollowUp Counter: %u expected %u\n";
                goto LABEL_219;
              }
            }

            else if (v156)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v316 - v315;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v136 - v358;
              v158 = "        Transmitted FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_219:
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v158,  buf,  0xEu);
            }

            unsigned int v159 = v367 - v364;

            BOOL v160 = v367 - v364 < (int)v370 - 1 && (_DWORD)v370 != 0;
            id v161 = &_os_log_default;
            BOOL v162 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v160 || v159 > (int)v370 + 1)
            {
              if (v162)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v367 - v364;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v370;
                v163 = "        Transmitted Announce Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_229:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v163,  buf,  0xEu);
              }
            }

            else if (v162)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v367 - v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v370;
              v163 = "        Transmitted Announce Counter: %u expected %u\n";
              goto LABEL_229;
            }

            id v164 = &_os_log_default;
            BOOL v165 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v166 = v318 - v317 >= v159 - 1 || v367 == v364;
            if (v166 && v318 - v317 <= v159 + 1)
            {
              if (v165)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v318 - v317;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v367 - v364;
                v167 = "        Transmitted Signal Counter: %u expected %u\n";
                goto LABEL_240;
              }
            }

            else if (v165)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v318 - v317;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v367 - v364;
              v167 = "        Transmitted Signal Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_240:
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v167,  buf,  0xEu);
            }

            id v168 = &_os_log_default;
            BOOL v169 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v320 == v319)
            {
              unsigned int v170 = v322;
              if (v169)
              {
                *(void *)buf = 67109120LL;
                v171 = "        Transmitted Packet Discard Counter: %u\n";
                goto LABEL_246;
              }
            }

            else
            {
              unsigned int v170 = v322;
              if (v169)
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v320 - v319;
                v171 = "        Transmitted Packet Discard Counter: %u greater than 0\n";
LABEL_246:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v171,  buf,  8u);
              }
            }

            unsigned int v172 = v170 - v321;

            id v173 = &_os_log_default;
            BOOL v174 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v175 = v172 < v361 - v149 && v361 >= v149;
            if (v175 || v172 > v149 + v361)
            {
              if (v174)
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&uint8_t buf[4] = v172;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v361;
                LOWORD(v395) = 1024;
                *(_DWORD *)((char *)&v395 + 2) = ((int)v361 + 9) / 0xAu;
                v176 = "        Attempted Sync Counter: %u out of expected bounds (%u ± %u)\n";
                uint32_t v177 = 20;
LABEL_256:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v176,  buf,  v177);
              }
            }

            else if (v174)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v172;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v361;
              v176 = "        Attempted Sync Counter: %u expected %u\n";
              uint32_t v177 = 14;
              goto LABEL_256;
            }

            id v178 = &_os_log_default;
            BOOL v179 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v180 = v327 - v324 >= v148 - 1 || v353 == v358;
            if (v180 && v327 - v324 <= v148 + 1)
            {
              if (v179)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v327 - v324;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v148;
                v181 = "        Attempted FollowUp Counter: %u expected %u\n";
                goto LABEL_267;
              }
            }

            else if (v179)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v327 - v324;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v148;
              v181 = "        Attempted FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_267:
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v181,  buf,  0xEu);
            }

            id v182 = &_os_log_default;
            BOOL v183 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v184 = v333 - v330 >= (int)v370 - 1 || (_DWORD)v370 == 0;
            if (v184 && v333 - v330 <= (int)v370 + 1)
            {
              if (v183)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v333 - v330;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v370;
                v185 = "        Attempted Announce Counter: %u expected %u\n";
                goto LABEL_278;
              }
            }

            else if (v183)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v333 - v330;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v370;
              v185 = "        Attempted Announce Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_278:
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v185,  buf,  0xEu);
            }

            id v186 = &_os_log_default;
            BOOL v187 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            BOOL v188 = v339 - v336 >= v159 - 1 || v367 == v364;
            if (v188 && v339 - v336 <= v159 + 1)
            {
              if (v187)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v339 - v336;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v367 - v364;
                v189 = "        Attempted Signal Counter: %u expected %u\n";
                goto LABEL_289;
              }
            }

            else if (v187)
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v339 - v336;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v367 - v364;
              v189 = "        Attempted Signal Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_289:
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v189,  buf,  0xEu);
            }

            id v190 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v299 - v298;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "        Raw Delay Exceeded Counter: %u\n",  buf,  8u);
            }

            id v191 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v301 - v300;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "        Raw Delay Measurements Counter: %u\n",  buf,  8u);
            }

            uint64_t v192 = objc_opt_class(&OBJC_CLASS___TSDgPTPFDPtPPort);
            if ((objc_opt_isKindOfClass(v62, v192) & 1) != 0)
            {
              unint64_t v351 = sub_100017C60((int)[v62 localPDelayLogMeanInterval]);
              unint64_t v193 = v344 / sub_100017C60((int)[v62 remotePDelayLogMeanInterval]);
              unsigned int v194 = [v63 receivedPDelayRequestCounter];
              unsigned int v195 = [v104 receivedPDelayRequestCounter];
              unsigned int v196 = v194 - v195;
              unsigned int v323 = [v63 transmittedPDelayResponseCounter];
              unsigned int v197 = [v104 transmittedPDelayResponseCounter];
              unsigned int v328 = [v63 transmittedPDelayResponseFollowUpCounter];
              unsigned int v325 = [v104 transmittedPDelayResponseFollowUpCounter];
              unsigned int v334 = [v63 attemptedPDelayResponseCounter];
              unsigned int v331 = [v104 attemptedPDelayResponseCounter];
              unsigned int v340 = [v63 attemptedPDelayResponseFollowUpCounter];
              unsigned int v337 = [v104 attemptedPDelayResponseFollowUpCounter];
              unsigned int v368 = [v63 transmittedPDelayRequestCounter];
              unsigned int v371 = [v104 transmittedPDelayRequestCounter];
              unsigned int v348 = [v63 attemptedPDelayRequestCounter];
              unsigned int v346 = [v104 attemptedPDelayRequestCounter];
              unsigned int v359 = [v63 receivedPDelayResponseCounter];
              unsigned int v354 = [v104 receivedPDelayResponseCounter];
              unsigned int v365 = [v63 receivedPDelayResponseFollowUpCounter];
              unsigned int v362 = [v104 receivedPDelayResponseFollowUpCounter];
              unsigned int v198 = ((int)v193 + 9) / 0xAu;
              id v199 = &_os_log_default;
              BOOL v200 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v201 = v194 - v195 < v193 - v198 && v193 >= v198;
              if (v201 || v196 > v198 + v193)
              {
                if (v200)
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)&uint8_t buf[4] = v194 - v195;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v193;
                  LOWORD(v395) = 1024;
                  *(_DWORD *)((char *)&v395 + 2) = ((int)v193 + 9) / 0xAu;
                  v202 = "        Received PDelay Request Counter: %u out of expected bounds (%u ± %u)\n";
                  uint32_t v203 = 20;
LABEL_318:
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v202,  buf,  v203);
                }
              }

              else if (v200)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v194 - v195;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v193;
                v202 = "        Received PDelay Request Counter: %u expected %u\n";
                uint32_t v203 = 14;
                goto LABEL_318;
              }

              unsigned int v216 = v323 - v197;

              unsigned int v217 = v196 - 1;
              id v218 = &_os_log_default;
              BOOL v219 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v220 = v323 - v197 >= v196 - 1 || v194 == v195;
              unsigned int v221 = v196 + 1;
              if (v220 && v216 <= v221)
              {
                if (v219)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&uint8_t buf[4] = v216;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v194 - v195;
                  v222 = "        Transmitted PDelay Response Counter: %u expected %u\n";
                  goto LABEL_329;
                }
              }

              else if (v219)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v216;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v194 - v195;
                v222 = "        Transmitted PDelay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_329:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v222,  buf,  0xEu);
              }

              id v223 = &_os_log_default;
              BOOL v224 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v225 = v328 - v325 >= v217 || v194 == v195;
              if (v225 && v328 - v325 <= v221)
              {
                if (v224)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&uint8_t buf[4] = v328 - v325;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v194 - v195;
                  v226 = "        Transmitted PDelay Response FollowUp Counter: %u expected %u\n";
                  goto LABEL_340;
                }
              }

              else if (v224)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v328 - v325;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v194 - v195;
                v226 = "        Transmitted PDelay Response FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_340:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v226,  buf,  0xEu);
              }

              id v227 = &_os_log_default;
              BOOL v228 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v229 = v334 - v331 >= v217 || v194 == v195;
              if (v229 && v334 - v331 <= v221)
              {
                if (v228)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&uint8_t buf[4] = v334 - v331;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v194 - v195;
                  v230 = "        Attempted PDelay Response Counter: %u expected %u\n";
                  goto LABEL_351;
                }
              }

              else if (v228)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v334 - v331;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v194 - v195;
                v230 = "        Attempted PDelay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_351:
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v230,  buf,  0xEu);
              }

              id v231 = &_os_log_default;
              BOOL v232 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v233 = v340 - v337 >= v217 || v194 == v195;
              if (v233 && v340 - v337 <= v221)
              {
                unsigned int v234 = v368;
                if (v232)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&uint8_t buf[4] = v340 - v337;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v196;
                  v235 = "        Attempted PDelay Response FollowUp Counter: %u expected %u\n";
                  goto LABEL_362;
                }
              }

              else
              {
                unsigned int v234 = v368;
                if (v232)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&uint8_t buf[4] = v340 - v337;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v196;
                  v235 = "        Attempted PDelay Response FollowUp Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_362:
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v235,  buf,  0xEu);
                }
              }

              unsigned int v236 = v234 - v371;
              unint64_t v237 = v344 / v351;

              unsigned int v238 = ((v344 / v351) + 9) / 0xA;
              unsigned int v239 = v344 / v351 - v238;
              id v240 = &_os_log_default;
              BOOL v241 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v242 = v234 - v371 < v239 && v237 >= v238;
              unsigned int v243 = v238 + v237;
              if (v242 || v236 > v243)
              {
                if (v241)
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)&uint8_t buf[4] = v234 - v371;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v344 / v351;
                  LOWORD(v395) = 1024;
                  *(_DWORD *)((char *)&v395 + 2) = (*(_DWORD *)&buf[10] + 9) / 0xAu;
                  v244 = "        Transmitted PDelay Request Counter: %u out of expected bounds (%u ± %u)\n";
                  uint32_t v245 = 20;
LABEL_372:
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v244,  buf,  v245);
                }
              }

              else if (v241)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v234 - v371;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v344 / v351;
                v244 = "        Transmitted PDelay Request Counter: %u expected %u\n";
                uint32_t v245 = 14;
                goto LABEL_372;
              }

              id v246 = &_os_log_default;
              BOOL v247 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v248 = v348 - v346 < v239 && v237 >= v238;
              if (v248 || v348 - v346 > v243)
              {
                if (v247)
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)&uint8_t buf[4] = v348 - v346;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v344 / v351;
                  LOWORD(v395) = 1024;
                  *(_DWORD *)((char *)&v395 + 2) = (*(_DWORD *)&buf[10] + 9) / 0xAu;
                  v249 = "        Attempted PDelay Request Counter: %u out of expected bounds (%u ± %u)\n";
                  uint32_t v250 = 20;
LABEL_382:
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v249,  buf,  v250);
                }
              }

              else if (v247)
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v348 - v346;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v344 / v351;
                v249 = "        Attempted PDelay Request Counter: %u expected %u\n";
                uint32_t v250 = 14;
                goto LABEL_382;
              }

              id v251 = &_os_log_default;
              BOOL v252 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v253 = v359 - v354 >= v236 - 1 || v234 == v371;
              unsigned int v254 = v236 + 1;
              if (v253 && v359 - v354 <= v254)
              {
                v62 = v349;
                if (v252)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&uint8_t buf[4] = v359 - v354;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v234 - v371;
                  v255 = "        Received PDelay Response Counter: %u expected %u\n";
                  goto LABEL_393;
                }
              }

              else
              {
                v62 = v349;
                if (v252)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&uint8_t buf[4] = v359 - v354;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v234 - v371;
                  v255 = "        Received PDelay Response Counter: %u out of expected bounds (%u ± 1)\n";
LABEL_393:
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v255,  buf,  0xEu);
                }
              }

              id v256 = &_os_log_default;
              BOOL v257 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              BOOL v258 = v365 - v362 >= v236 - 1 || v234 == v371;
              if (v258 && v365 - v362 <= v254)
              {
                if (v257)
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&uint8_t buf[4] = v365 - v362;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v234 - v371;
                  v259 = "        Received PDelay Response FollowUp Counter: %u expected %u\n";
                  goto LABEL_404;
                }

- (void)finalizeClock
{
  clock = self->_clock;
  self->_clock = 0LL;
}

- (void)didResetClock:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    unint64_t v5 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: reset clock\n",  (uint8_t *)&v4,  0xCu);
  }

- (void)didChangeClockMasterForClock:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    unint64_t v5 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: master clock changed\n",  (uint8_t *)&v4,  0xCu);
  }

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  id v6 = a4;
  else {
    id v7 = off_10003C858[a3];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218498;
    unint64_t v9 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
    __int16 v10 = 1024;
    int v11 = a3;
    __int16 v12 = 2080;
    id v13 = -[__CFString UTF8String](v7, "UTF8String");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: set lock state to %u (%s)\n",  (uint8_t *)&v8,  0x1Cu);
  }

  if (a3 == 2) {
    self->_hasSyncedSinceLocked = 0;
  }
}

- (void)didBeginClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  int v5 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218496;
    unint64_t v9 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: begin grandmaster change GMID 0x%016llx local port %hu\n",  (uint8_t *)&v8,  0x1Cu);
  }

- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  int v5 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218496;
    unint64_t v9 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: end grandmaster change GMID 0x%016llx local port %hu\n",  (uint8_t *)&v8,  0x1Cu);
  }

- (void)didProcessSync:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (!self->_hasSyncedSinceLocked)
  {
    id v21 = 0LL;
    unsigned int v6 = [v4 getMachAbsoluteRateRatioNumerator:&v28 denominator:&v27 machAnchor:&v26 andDomainAnchor:&v24 forGrandmasterIdentity :&v23 portNumber:&v22 withError:&v21];
    id v7 = v21;
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        unint64_t v9 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
        *(_DWORD *)buf = 134219520;
        unint64_t v30 = v9;
        __int16 v31 = 2048;
        id v32 = v28;
        __int16 v33 = 2048;
        uint64_t v34 = v27;
        __int16 v35 = 2048;
        uint64_t v36 = v26;
        __int16 v37 = 2048;
        uint64_t v38 = v24;
        __int16 v39 = 2048;
        uint64_t v40 = v23;
        __int16 v41 = 1024;
        int v42 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: First MachSync %llu,%llu,%llu,%llu,0x%016llx,%hu\n",  buf,  0x44u);
      }
    }

    else if (v8)
    {
      unint64_t v10 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
      id v11 = objc_claimAutoreleasedReturnValue([v7 localizedDescription]);
      id v12 = [v11 UTF8String];
      *(_DWORD *)buf = 134218242;
      unint64_t v30 = v10;
      __int16 v31 = 2080;
      id v32 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: failed to get mach rate ratio and anchors with error %s\n",  buf,  0x16u);
    }

    id v20 = v7;
    unsigned int v13 = [v5 getTimeSyncTimeRateRatioNumerator:&v28 denominator:&v27 timeSyncAnchor:&v25 andDomainAnchor:&v24 forGrandmasterIde ntity:&v23 portNumber:&v22 withError:&v20];
    id v14 = v20;

    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        unint64_t v16 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
        *(_DWORD *)buf = 134219520;
        unint64_t v30 = v16;
        __int16 v31 = 2048;
        id v32 = v28;
        __int16 v33 = 2048;
        uint64_t v34 = v27;
        __int16 v35 = 2048;
        uint64_t v36 = v25;
        __int16 v37 = 2048;
        uint64_t v38 = v24;
        __int16 v39 = 2048;
        uint64_t v40 = v23;
        __int16 v41 = 1024;
        int v42 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: First TimeSync %llu,%llu,%llu,%llu,0x%016llx,%hu\n",  buf,  0x44u);
      }
    }

    else if (v15)
    {
      unint64_t v17 = -[TSDClockStatistics clockIdentifier](self, "clockIdentifier");
      id v18 = objc_claimAutoreleasedReturnValue([v14 localizedDescription]);
      id v19 = [v18 UTF8String];
      *(_DWORD *)buf = 134218242;
      unint64_t v30 = v17;
      __int16 v31 = 2080;
      id v32 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "0x%016llx: failed to get timesync rate ratio and anchors with error %s\n",  buf,  0x16u);
    }

    self->_hasSyncedSinceLocked = 1;
  }
}

- (void)didGetStatsOfLocalPortNumber:(unint64_t)a3 mean:(unint64_t)a4 median:(unint64_t)a5 stddev:(unint64_t)a6 min:(unint64_t)a7 max:(unint64_t)a8 numberOfSamples:(unsigned int)a9 forClock:(id)a10
{
  id v14 = (void *)objc_claimAutoreleasedReturnValue([a10 portWithPortNumber:(unsigned __int16)a3]);
  unint64_t v15 = (unint64_t)[v14 remoteClockIdentity];
  unsigned __int8 v16 = BYTE5(v15);
  unint64_t v17 = v15 >> 40;
  v32[0] = @"LocalLinkType";
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v14 localLinkType]));
  v33[0] = v31;
  v32[1] = @"RemoteLinkType";
  unint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v14 remoteLinkType]));
  v33[1] = v30;
  v32[2] = @"LocalTimestampingMode";
  id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v14 localTimestampingMode]));
  v33[2] = v29;
  v32[3] = @"RemoteTimestampingMode";
  BOOL v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v14 remoteTimestampingMode]));
  v33[3] = v28;
  v32[4] = @"PortType";
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  [v14 portType]));
  v33[4] = v18;
  v32[5] = @"MinimumDelay";
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)a7 / 1000.0));
  v33[5] = v19;
  v32[6] = @"MaximumDelay";
  id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)a8 / 1000.0));
  v33[6] = v20;
  v32[7] = @"MeanDelay";
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)a4 / 1000.0));
  v33[7] = v21;
  v32[8] = @"MedianDelay";
  unsigned __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)a5 / 1000.0));
  v33[8] = v22;
  v32[9] = @"StandardDeviation";
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", (double)a6 / 1000.0));
  v33[9] = v23;
  v32[10] = @"NumberOfSamples";
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a9));
  v33[10] = v24;
  v32[11] = @"RemoteOUI";
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%02x-%02x-%02x",  WORD1(v17),  BYTE1(v17),  v16));
  v33[11] = v25;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  12LL));

  AnalyticsSendEvent(@"com.apple.TimeSync.ete-delay-stats", v26);
}

- (void)dealloc
{
  unint64_t stateDumpHandler = self->_stateDumpHandler;
  if (stateDumpHandler) {
    os_state_remove_handler(stateDumpHandler, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TSDClockStatistics;
  -[TSDClockStatistics dealloc](&v4, "dealloc");
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void).cxx_destruct
{
}

  ;
}

@end