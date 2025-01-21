@interface DNSHeuristics
+ (BOOL)clearNetworkAsFiltered:(id)a3;
+ (BOOL)countersExceedThreshold:(unint64_t)a3 burstCounter:(unint64_t)a4;
+ (BOOL)getNetworkFilteredFlag:(id)a3;
+ (BOOL)reportResolutionFailure:(id)a3 isTimeout:(BOOL)a4;
+ (BOOL)setNetworkAsFiltered:(id)a3;
+ (BOOL)setNetworkAsFiltered:(id)a3 filtered:(BOOL)a4;
+ (BOOL)setNetworkSettings:(id)a3 value:(id)a4;
+ (BOOL)updateHeuristicState:(BOOL)a3 isTimeout:(BOOL)a4;
+ (id)copyEmptyHeuristicState;
+ (id)copyNetworkSettings:(id)a3;
+ (unint64_t)currentTimeMs;
@end

@implementation DNSHeuristics

+ (id)copyNetworkSettings:(id)a3
{
  return [a3 DNSHeuristicsFailureStateInfo];
}

+ (BOOL)setNetworkSettings:(id)a3 value:(id)a4
{
  return 1;
}

+ (BOOL)getNetworkFilteredFlag:(id)a3
{
  return [a3 isDNSHeuristicsFilteredNetwork];
}

+ (BOOL)setNetworkAsFiltered:(id)a3
{
  return 1;
}

+ (BOOL)clearNetworkAsFiltered:(id)a3
{
  return 1;
}

+ (BOOL)setNetworkAsFiltered:(id)a3 filtered:(BOOL)a4
{
  if (a4) {
    return +[DNSHeuristics setNetworkAsFiltered:](&OBJC_CLASS___DNSHeuristics, "setNetworkAsFiltered:", a3);
  }
  else {
    return +[DNSHeuristics clearNetworkAsFiltered:](&OBJC_CLASS___DNSHeuristics, "clearNetworkAsFiltered:", a3);
  }
}

+ (BOOL)countersExceedThreshold:(unint64_t)a3 burstCounter:(unint64_t)a4
{
  return !a4 || a3 > 0xA;
}

+ (unint64_t)currentTimeMs
{
  v2 = [NSDate date];
  [v2 timeIntervalSince1970];
  unint64_t v4 = (unint64_t)(v3 * 1000.0);

  return v4;
}

+ (id)copyEmptyHeuristicState
{
  v7[0] = @"LastFailureTimestamp";
  v2 = [NSNumber numberWithUnsignedInteger:0LL];
  v8[0] = v2;
  v7[1] = @"LongCount";
  double v3 = [NSNumber numberWithUnsignedInteger:0LL];
  v8[1] = v3;
  v7[2] = @"BurstCount";
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 10LL));
  v8[2] = v4;
  v5 = [NSDictionary dictionaryWithObjects:forKeys:count:v8, v7, 3];

  return v5;
}

+ (BOOL)updateHeuristicState:(BOOL)a3 isTimeout:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v6 = (void *)objc_opt_new(&OBJC_CLASS___CWFInterface, a2);
  [v6 activate];
  uint64_t v53 = [v6 currentKnownNetworkProfile];
  id v7 = +[DNSHeuristics copyNetworkSettings:](&OBJC_CLASS___DNSHeuristics, "copyNetworkSettings:", v53);
  if (v7) {
    v8 = v7;
  }
  else {
    v8 = &__NSDictionary0__struct;
  }
  v9 = [v8 objectForKey:@"LastFailureTimestamp"];

  if (!v9)
  {
    id v10 = +[DNSHeuristics copyEmptyHeuristicState](&OBJC_CLASS___DNSHeuristics, "copyEmptyHeuristicState");

    v8 = v10;
  }

  unint64_t v11 = +[DNSHeuristics currentTimeMs](&OBJC_CLASS___DNSHeuristics, "currentTimeMs");
  v12 = [v8 objectForKeyedSubscript:@"LastFailureTimestamp"];
  id v13 = [v12 unsignedIntegerValue];

  v14 = (void *)[v8 objectForKeyedSubscript:@"LongCount"];
  v15 = (char *)[v14 unsignedIntegerValue];

  v16 = [v8 objectForKeyedSubscript:@"BurstCount"];
  id v17 = [v16 unsignedIntegerValue];

  v18 = (void *)v53;
  unsigned int v19 = +[DNSHeuristics getNetworkFilteredFlag:](&OBJC_CLASS___DNSHeuristics, "getNetworkFilteredFlag:", v53);
  if (!v5)
  {
    BOOL v25 = v4;
    if (v4 && (unint64_t v26 = v11 - (void)v13, v11 > (unint64_t)v13) && (unint64_t)v13 + 30000 > v11)
    {
      id v27 = _mdns_heuristics_log();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      LOBYTE(v28) = 1;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v57 = (const char *)v26;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Logging DoH timeout failure after only %llums, not incrementing failure counter",  buf,  0xCu);
      }

      v18 = (void *)v53;
    }

    else
    {
      v29 = v15 + 1;
      unint64_t v30 = (unint64_t)v17 + (v11 - (unint64_t)v13) / 0x1D4C0;
      if (v30 >= 0xA) {
        unint64_t v30 = 10LL;
      }
      BOOL v31 = v30 != 0;
      unint64_t v32 = v30 - 1;
      if (v31) {
        unint64_t v33 = v32;
      }
      else {
        unint64_t v33 = 0LL;
      }
      if ((v19 & 1) != 0)
      {
        id v34 = _mdns_heuristics_log();
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        uint64_t v36 = 1LL;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v37 = "";
          *(_DWORD *)buf = 136315650;
          if (v25) {
            v37 = "timeout ";
          }
          v57 = v37;
          __int16 v58 = 2048;
          v59 = v15 + 1;
          __int16 v60 = 2048;
          unint64_t v61 = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "Logging DoH %sfailure %llu (bucket %llu), keeping filtered state",  buf,  0x20u);
        }
      }

      else
      {
        unsigned int v41 = +[DNSHeuristics countersExceedThreshold:burstCounter:]( &OBJC_CLASS___DNSHeuristics,  "countersExceedThreshold:burstCounter:",  v15 + 1,  v33);
        id v42 = _mdns_heuristics_log();
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        v35 = v43;
        if (v41)
        {
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = "";
            *(_DWORD *)buf = 136315650;
            if (v25) {
              v44 = "timeout ";
            }
            v57 = v44;
            __int16 v58 = 2048;
            v59 = v29;
            __int16 v60 = 2048;
            unint64_t v61 = v33;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Logging DoH %sfailure %llu (bucket %llu), moving into filtered state",  buf,  0x20u);
          }

          uint64_t v36 = 1LL;
        }

        else
        {
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v47 = "";
            *(_DWORD *)buf = 136315650;
            if (v25) {
              v47 = "timeout ";
            }
            v57 = v47;
            __int16 v58 = 2048;
            v59 = v29;
            __int16 v60 = 2048;
            unint64_t v61 = v33;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "Logging DoH %sfailure %llu (bucket %llu), keeping unfiltered state",  buf,  0x20u);
          }

          uint64_t v36 = 0LL;
        }
      }

      v54[0] = @"LastFailureTimestamp";
      uint64_t v48 = [+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v11)];
      v55[0] = v48;
      v54[1] = @"LongCount";
      v49 = [NSNumber numberWithUnsignedInteger:v29];
      v55[1] = v49;
      v54[2] = @"BurstCount";
      v50 = [NSNumber numberWithUnsignedInteger:v33];
      v55[2] = v50;
      v21 = [NSDictionary dictionaryWithObjects:forKeys:count:v55, v54, 3];

      v18 = (void *)v53;
      LODWORD(v48) = +[DNSHeuristics setNetworkSettings:value:]( &OBJC_CLASS___DNSHeuristics,  "setNetworkSettings:value:",  v53,  v21);
      unsigned int v28 = v48 & +[DNSHeuristics setNetworkAsFiltered:filtered:]( &OBJC_CLASS___DNSHeuristics,  "setNetworkAsFiltered:filtered:",  v53,  v36);
      v51 = [NSSet setWithObjects:@"setWithObjects:",  &off_1001407E8,  &off_100140800,  0LL]);
      [v6 updateKnownNetworkProfile:v53 properties:v51 error:0];
    }

    goto LABEL_47;
  }

  if (v19)
  {
    if ((unint64_t)v13 + 86400000 >= v11)
    {
      id v38 = _mdns_heuristics_log();
      v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
      v21 = v39;
      unint64_t v40 = v11 - (void)v13;
      if (v11 > (unint64_t)v13)
      {
        LOBYTE(v28) = 1;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v57 = (const char *)v40;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Logging DoH success after %llums, keeping filtered state",  buf,  0xCu);
        }

        goto LABEL_47;
      }

      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v22 = "Logging DoH success, invalid last failure, clearing filtered state";
        v23 = v21;
        uint32_t v24 = 2;
        goto LABEL_39;
      }
    }

    else
    {
      id v20 = _mdns_heuristics_log();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v57 = (const char *)(v11 - (void)v13);
        v22 = "Logging DoH success after %llums, clearing filtered state";
        v23 = v21;
        uint32_t v24 = 12;
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }

    id v45 = +[DNSHeuristics copyEmptyHeuristicState](&OBJC_CLASS___DNSHeuristics, "copyEmptyHeuristicState");
    unsigned int v46 = +[DNSHeuristics setNetworkSettings:value:](&OBJC_CLASS___DNSHeuristics, "setNetworkSettings:value:", v53, v45);

    unsigned int v28 = v46 & +[DNSHeuristics setNetworkAsFiltered:filtered:]( &OBJC_CLASS___DNSHeuristics,  "setNetworkAsFiltered:filtered:",  v53,  0LL);
    v21 = [NSSet setWithObjects:@"setWithObjects:",  &off_1001407E8,  &off_100140800,  0LL];
    [v6 updateKnownNetworkProfile:v53 properties:v21 error:0];
LABEL_47:

    goto LABEL_48;
  }

  LOBYTE(v28) = 1;
LABEL_48:
  [v6 invalidate];

  return v28;
}

+ (BOOL)reportResolutionFailure:(id)a3 isTimeout:(BOOL)a4
{
  return +[DNSHeuristics updateHeuristicState:isTimeout:]( &OBJC_CLASS___DNSHeuristics,  "updateHeuristicState:isTimeout:",  0LL,  a4);
}

@end