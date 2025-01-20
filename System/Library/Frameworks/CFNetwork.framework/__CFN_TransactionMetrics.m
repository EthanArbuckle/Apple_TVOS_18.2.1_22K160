@interface __CFN_TransactionMetrics
+ (BOOL)supportsSecureCoding;
- (__CFN_ConnectionMetrics)_daemon_connectionMetrics;
- (__CFN_TransactionMetrics)initWithCoder:(id)a3;
- (id)legacyStaticMetrics;
- (int64_t)_daemon_requestBodyTransferSize;
- (int64_t)_daemon_requestHeaderSize;
- (int64_t)_daemon_responseBodyTransferSize;
- (int64_t)_daemon_responseHeaderSize;
- (void)encodeWithCoder:(id)a3;
- (void)end:(void *)a3 taskMetrics:;
- (void)linkWithConnection:(_BYTE *)a1;
- (void)requestBeginOnConnection:(double)a3 reusedAfterTime:;
- (void)requestBody:(uint64_t)a1;
- (void)responseHeaderEnd:(uint64_t)a1;
- (void)setTransferredRequest:(uint64_t)a1;
@end

@implementation __CFN_TransactionMetrics

- (void)end:(void *)a3 taskMetrics:
{
  v137[2] = *MEMORY[0x1895F89C0];
  v109 = a3;
  if (!a1) {
    goto LABEL_60;
  }
  self = (os_unfair_lock_s *)objc_getProperty((id)a1, v5, 88LL, 1);
  *(CFAbsoluteTime *)(a1 + 152) = CFAbsoluteTimeGetCurrent();
  *(void *)(a1 + 208) = a2;
  uint64_t v6 = *(void *)(a1 + 224);
  if ((v6 & 0x82) != 0)
  {
    uint64_t v7 = -[__CFN_ConnectionMetrics tcpInfo](self);
    v8 = *(void **)(a1 + 256);
    *(void *)(a1 + 256) = v7;

    uint64_t v6 = *(void *)(a1 + 224);
  }

  if ((v6 & 0x20) != 0)
  {
    uint64_t v9 = -[__CFN_ConnectionMetrics subflowCounts](self);
    v10 = *(void **)(a1 + 272);
    *(void *)(a1 + 272) = v9;
  }

  uint64_t v108 = a1;
  v137[0] = 0LL;
  v137[1] = 0LL;
  id v11 = v109[3];
  [v11 getUUIDBytes:v137];

  uint64_t v12 = 80LL;
  if (!*(void *)(v108 + 80)) {
    uint64_t v12 = 72LL;
  }
  id v107 = *(id *)(v108 + v12);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v14 = [v107 statusCode];
  }
  else {
    uint64_t v14 = -1LL;
  }
  if (*(_BYTE *)(v108 + 9))
  {
    id Property = self;
    if (self) {
      id Property = objc_getProperty(self, v13, 160LL, 1);
    }
    v16 = (os_log_s *)Property;
    uint32_t os_unfair_lock_opaque = self;
    connectionTimingFromMetrics(&v119, self);
    if (self) {
      uint32_t os_unfair_lock_opaque = self[8]._os_unfair_lock_opaque;
    }
    summaryLog();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = v14;
      id v20 = v109[4];
      if (self) {
        uint64_t v21 = *(void *)&self[18]._os_unfair_lock_opaque;
      }
      else {
        uint64_t v21 = 0LL;
      }
      double v22 = *(double *)(v108 + 144);
      double v23 = *(double *)(v108 + 152);
      v24 = endReasonString(a2);
      double v25 = *(double *)(v108 + 176);
      unsigned int v26 = ((v25 - v22) * 1000.0);
      double v27 = *(double *)(v108 + 184) - v25;
      double v28 = *(double *)(v108 + 192);
      unsigned int v29 = ((v28 - v22) * 1000.0);
      double v30 = *(double *)(v108 + 200) - v28;
      uint64_t v31 = *(void *)(v108 + 112) + *(void *)(v108 + 96);
      uint64_t v32 = *(void *)(v108 + 136) + *(void *)(v108 + 120);
      uint64_t v33 = *(void *)(v108 + 72);
      *(_DWORD *)buf = 68293890;
      *(_DWORD *)&buf[4] = 16;
      *(_WORD *)&buf[8] = 2098;
      *(void *)&buf[10] = v137;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v20;
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = v24;
      *(_WORD *)&buf[38] = 1024;
      LODWORD(v124) = ((v23 - v22) * 1000.0);
      WORD2(v124) = 2048;
      uint64_t v14 = v19;
      *(void *)((char *)&v124 + 6) = v19;
      HIWORD(v124) = 2048;
      uint64_t v125 = v21;
      __int16 v126 = 2114;
      *(void *)v127 = v16;
      *(_WORD *)&v127[8] = 1024;
      *(_DWORD *)v128 = *(_DWORD *)&v119._expensive;
      *(_WORD *)&v128[4] = 1024;
      *(_DWORD *)v129 = *(_DWORD *)&v119._isUnlistedTracker;
      *(_WORD *)&v129[4] = 1024;
      *(_DWORD *)v130 = *(_DWORD *)&v119._coalesced;
      *(_WORD *)&v130[4] = 1024;
      *(_DWORD *)v131 = os_unfair_lock_opaque == 2;
      *(_WORD *)&v131[4] = 1024;
      *(_DWORD *)&v131[6] = v26;
      *(_WORD *)&v131[10] = 1024;
      *(_DWORD *)&v131[12] = (v27 * 1000.0);
      *(_WORD *)&v131[16] = 1024;
      *(_DWORD *)&v131[18] = v29;
      *(_WORD *)&v131[22] = 1024;
      *(_DWORD *)&v131[24] = (v30 * 1000.0);
      *(_WORD *)&v131[28] = 2048;
      *(void *)&v131[30] = v31;
      *(_WORD *)&v131[38] = 2048;
      *(void *)&v131[40] = (uint64_t)((double)v31 / (v27 * 1024.0));
      *(_WORD *)v132 = 2048;
      *(void *)&v132[2] = v32;
      __int16 v133 = 2048;
      uint64_t v134 = (uint64_t)((double)v32 / (v30 * 1024.0));
      __int16 v135 = 1024;
      BOOL v136 = v33 != 0;
      _os_log_impl( &dword_18298D000,  v18,  OS_LOG_TYPE_DEFAULT,  "Task <%{public,uuid_t}.16P>.<%lu> summary for %{public}s {transaction_duration_ms=%u, response_status=%ld, conne ction=%llu, protocol=%{public}@, domain_lookup_duration_ms=%u, connect_duration_ms=%u, secure_connection_dur ation_ms=%u, private_relay=%{BOOL}d, request_start_ms=%u, request_duration_ms=%u, response_start_ms=%u, response _duration_ms=%u, request_bytes=%lld, request_throughput_kbps=%lld, response_bytes=%lld, response_throughput_kbps =%lld, cache_hit=%{BOOL}d}",  buf,  0xA8u);
    }

    goto LABEL_30;
  }

  if (self)
  {
    int v34 = BYTE2(self[5]._os_unfair_lock_opaque);
    summaryLog();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v35 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (v35)
      {
        id v36 = v109[4];
        v37 = endReasonString(a2);
        double v38 = *(double *)(v108 + 144);
        unsigned int v39 = ((*(double *)(v108 + 152) - v38) * 1000.0);
        unsigned int v40 = (*(double *)(v108 + 232) * 1000.0);
        double v41 = *(double *)(v108 + 176);
        unsigned int v42 = ((v41 - v38) * 1000.0);
        double v43 = *(double *)(v108 + 184) - v41;
        double v44 = *(double *)(v108 + 192);
        unsigned int v45 = ((v44 - v38) * 1000.0);
        uint64_t v46 = *(void *)&self[18]._os_unfair_lock_opaque;
        double v47 = *(double *)(v108 + 200) - v44;
        uint64_t v48 = *(void *)(v108 + 112) + *(void *)(v108 + 96);
        uint64_t v49 = *(void *)(v108 + 136) + *(void *)(v108 + 120);
        int v50 = BYTE1(self[5]._os_unfair_lock_opaque);
        uint64_t v51 = *(void *)(v108 + 72);
        *(_DWORD *)buf = 68293122;
        *(_DWORD *)&buf[4] = 16;
        *(_WORD *)&buf[8] = 2098;
        *(void *)&buf[10] = v137;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = v36;
        *(_WORD *)&buf[28] = 2082;
        *(void *)&buf[30] = v37;
        *(_WORD *)&buf[38] = 1024;
        LODWORD(v124) = v39;
        WORD2(v124) = 2048;
        *(void *)((char *)&v124 + 6) = v14;
        HIWORD(v124) = 2048;
        uint64_t v125 = v46;
        __int16 v126 = 1024;
        *(_DWORD *)v127 = v40;
        *(_WORD *)&v127[4] = 1024;
        *(_DWORD *)&v127[6] = v50;
        *(_WORD *)v128 = 1024;
        *(_DWORD *)&v128[2] = v42;
        *(_WORD *)v129 = 1024;
        *(_DWORD *)&v129[2] = (v43 * 1000.0);
        *(_WORD *)v130 = 1024;
        *(_DWORD *)&v130[2] = v45;
        *(_WORD *)v131 = 1024;
        *(_DWORD *)&v131[2] = (v47 * 1000.0);
        *(_WORD *)&v131[6] = 2048;
        *(void *)&v131[8] = v48;
        *(_WORD *)&v131[16] = 2048;
        *(void *)&v131[18] = (uint64_t)((double)v48 / (v43 * 1024.0));
        *(_WORD *)&v131[26] = 2048;
        *(void *)&v131[28] = v49;
        *(_WORD *)&v131[36] = 2048;
        *(void *)&v131[38] = (uint64_t)((double)v49 / (v47 * 1024.0));
        *(_WORD *)&v131[46] = 1024;
        *(_DWORD *)v132 = v51 != 0;
        v52 = "Task <%{public,uuid_t}.16P>.<%lu> summary for %{public}s {transaction_duration_ms=%u, response_status=%ld,"
              " connection=%llu, reused=1, reused_after_ms=%u, reused_after_sleep=%{BOOL}d, request_start_ms=%u, request_"
              "duration_ms=%u, response_start_ms=%u, response_duration_ms=%u, request_bytes=%lld, request_throughput_kbps"
              "=%lld, response_bytes=%lld, response_throughput_kbps=%lld, cache_hit=%{BOOL}d}";
        v53 = v16;
        uint32_t v54 = 146;
LABEL_29:
        _os_log_impl(&dword_18298D000, v53, OS_LOG_TYPE_DEFAULT, v52, buf, v54);
      }
    }

    else if (v35)
    {
      id v59 = v109[4];
      uint64_t v60 = *(void *)&self[18]._os_unfair_lock_opaque;
      double v61 = *(double *)(v108 + 144);
      double v62 = *(double *)(v108 + 152);
      v63 = endReasonString(a2);
      unsigned int v64 = (*(double *)(v108 + 232) * 1000.0);
      double v65 = *(double *)(v108 + 176);
      unsigned int v66 = ((v65 - v61) * 1000.0);
      double v67 = *(double *)(v108 + 184) - v65;
      double v68 = *(double *)(v108 + 192);
      unsigned int v69 = ((v68 - v61) * 1000.0);
      double v70 = *(double *)(v108 + 200) - v68;
      uint64_t v71 = *(void *)(v108 + 112) + *(void *)(v108 + 96);
      uint64_t v72 = *(void *)(v108 + 136) + *(void *)(v108 + 120);
      uint64_t v73 = *(void *)(v108 + 72);
      *(_DWORD *)buf = 68292866;
      *(_DWORD *)&buf[4] = 16;
      *(_WORD *)&buf[8] = 2098;
      *(void *)&buf[10] = v137;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v59;
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = v63;
      *(_WORD *)&buf[38] = 1024;
      LODWORD(v124) = ((v62 - v61) * 1000.0);
      WORD2(v124) = 2048;
      *(void *)((char *)&v124 + 6) = v14;
      HIWORD(v124) = 2048;
      uint64_t v125 = v60;
      __int16 v126 = 1024;
      *(_DWORD *)v127 = v64;
      *(_WORD *)&v127[4] = 1024;
      *(_DWORD *)&v127[6] = v66;
      *(_WORD *)v128 = 1024;
      *(_DWORD *)&v128[2] = (v67 * 1000.0);
      *(_WORD *)v129 = 1024;
      *(_DWORD *)&v129[2] = v69;
      *(_WORD *)v130 = 1024;
      *(_DWORD *)&v130[2] = (v70 * 1000.0);
      *(_WORD *)v131 = 2048;
      *(void *)&v131[2] = v71;
      *(_WORD *)&v131[10] = 2048;
      *(void *)&v131[12] = (uint64_t)((double)v71 / (v67 * 1024.0));
      *(_WORD *)&v131[20] = 2048;
      *(void *)&v131[22] = v72;
      *(_WORD *)&v131[30] = 2048;
      *(void *)&v131[32] = (uint64_t)((double)v72 / (v70 * 1024.0));
      *(_WORD *)&v131[40] = 1024;
      *(_DWORD *)&v131[42] = v73 != 0;
      v52 = "Task <%{public,uuid_t}.16P>.<%lu> summary for %{public}s {transaction_duration_ms=%u, response_status=%ld, c"
            "onnection=%llu, reused=1, reused_after_ms=%u, request_start_ms=%u, request_duration_ms=%u, response_start_ms"
            "=%u, response_duration_ms=%u, request_bytes=%lld, request_throughput_kbps=%lld, response_bytes=%lld, respons"
            "e_throughput_kbps=%lld, cache_hit=%{BOOL}d}";
      v53 = v16;
      uint32_t v54 = 140;
      goto LABEL_29;
    }
  }

  else
  {
    summaryLog();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v55 = v109[4];
      v56 = endReasonString(a2);
      unsigned int v57 = ((*(double *)(v108 + 152) - *(double *)(v108 + 144)) * 1000.0);
      BOOL v58 = *(void *)(v108 + 72) != 0LL;
      *(_DWORD *)buf = 68290306;
      *(_DWORD *)&buf[4] = 16;
      *(_WORD *)&buf[8] = 2098;
      *(void *)&buf[10] = v137;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v55;
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = v56;
      *(_WORD *)&buf[38] = 1024;
      LODWORD(v124) = v57;
      WORD2(v124) = 2048;
      *(void *)((char *)&v124 + 6) = v14;
      HIWORD(v124) = 1024;
      LODWORD(v125) = v58;
      v52 = "Task <%{public,uuid_t}.16P>.<%lu> summary for %{public}s {transaction_duration_ms=%u, response_status=%ld, c"
            "ache_hit=%{BOOL}d}";
      v53 = v16;
      uint32_t v54 = 60;
      goto LABEL_29;
    }
  }

- (void)linkWithConnection:(_BYTE *)a1
{
  self = a2;
  if (a1)
  {
    id Property = self;
    if (self)
    {
      if (self[23])
      {
LABEL_8:
        objc_setProperty_atomic(a1, v3, self, 88LL);
        goto LABEL_9;
      }

      a1[9] = 1;
      self[23] = 1;
      id Property = objc_getProperty(self, v3, 160LL, 1);
    }

    else
    {
      a1[9] = 1;
    }

    id v5 = Property;

    if (!v5 && self) {
      objc_setProperty_atomic_copy(self, v3, @"http/1.1", 160LL);
    }
    goto LABEL_8;
  }

- (void)setTransferredRequest:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)requestBody:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    v8 = v3;
    *(void *)(a1 + 104) += dispatch_data_get_size(v3);
    int v4 = *(_DWORD *)(a1 + 16);
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = v8;
    if (HARLoggingEnabled(v4) && HARBodySizeLimit)
    {
      uint64_t v7 = (dispatch_queue_s *)HARQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __logHARRequestBody_block_invoke;
      block[3] = &unk_189C1A270;
      id v10 = v5;
      id v11 = v6;
      dispatch_async(v7, block);
    }

    v3 = v8;
  }
}

- (void).cxx_destruct
{
}

- (void)responseHeaderEnd:(uint64_t)a1
{
  id v4 = a2;
  if (a1 && v4)
  {
    id v9 = v4;
    objc_storeStrong((id *)(a1 + 80), a2);
    *(void *)(a1 + 24) = *(void *)(a1 + 120);
    int v5 = *(_DWORD *)(a1 + 16);
    id v6 = *(id *)(a1 + 48);
    id v7 = v9;
    if (HARLoggingEnabled(v5))
    {
      if (HARBodySizeLimit)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || [v7 statusCode] != 304)
        {
          v8 = (dispatch_queue_s *)HARQueue;
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __clearCachedHARResponseBody_block_invoke;
          block[3] = &unk_189C1A548;
          id v11 = v6;
          dispatch_async(v8, block);
        }
      }
    }

    id v4 = v9;
  }
}

- (id)legacyStaticMetrics
{
  _30[1] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    [MEMORY[0x189603FC8] dictionaryWithCapacity:50];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (isIMRemoteURLConnectionAgentProcess(void)::isIMRemoteURLConnectionAgent)
    {
      [MEMORY[0x1896078F8] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:0];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 setObject:v3 forKeyedSubscript:@"_kCFNTimingDataInternalTransactionMetrics"];
    }

    [MEMORY[0x189607968] numberWithDouble:*(double *)(a1 + 144)];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v4 forKeyedSubscript:@"_kCFNTimingDataFetchStart"];
    [v2 setObject:v4 forKeyedSubscript:@"_kCFNTimingDataTimingDataInit"];

    [MEMORY[0x189607968] numberWithDouble:*(double *)(a1 + 176)];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v5 forKeyedSubscript:@"_kCFNTimingDataRequestStart"];

    [MEMORY[0x189607968] numberWithDouble:*(double *)(a1 + 184)];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v6 forKeyedSubscript:@"_kCFNTimingDataRequestEnd"];

    [MEMORY[0x189607968] numberWithDouble:*(double *)(a1 + 192)];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v7 forKeyedSubscript:@"_kCFNTimingDataResponseStart"];

    [MEMORY[0x189607968] numberWithDouble:*(double *)(a1 + 200)];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v8 forKeyedSubscript:@"_kCFNTimingDataResponseEnd"];

    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", *(_BYTE *)(a1 + 9) == 0, *(double *)(a1 + 176));
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v9 forKeyedSubscript:@"_kCFNTimingDataConnectionReused"];

    [MEMORY[0x189607968] numberWithLongLong:*(void *)(a1 + 96)];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v10 forKeyedSubscript:@"_kCFNTimingDataRequestHeaderSize"];

    [MEMORY[0x189607968] numberWithLongLong:*(void *)(a1 + 120)];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v11 forKeyedSubscript:@"_kCFNTimingDataResponseHeaderSize"];

    [MEMORY[0x189607968] numberWithLongLong:*(void *)(a1 + 136)];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v12 forKeyedSubscript:@"_kCFNTimingDataResponseBodyBytesReceived"];

    [MEMORY[0x189607968] numberWithLongLong:*(void *)(a1 + 128)];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v13 forKeyedSubscript:@"_kCFNTimingDataResponseBodyBytesDecoded"];

    [MEMORY[0x189607968] numberWithLongLong:*(void *)(a1 + 112) + *(void *)(a1 + 96)];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v14 forKeyedSubscript:@"_kCFNTimingDataTotalBytesSent"];

    [MEMORY[0x189607968] numberWithLongLong:*(void *)(a1 + 136) + *(void *)(a1 + 120)];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 setObject:v15 forKeyedSubscript:@"_kCFNTimingDataTotalBytesReceived"];

    unint64_t v17 = *(void *)(a1 + 216);
    if (v17 <= 5 && ((1LL << v17) & 0x2C) != 0) {
      [v2 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"_kCFNBackgroundMetricsIsDiscretionary"];
    }
    v18 = (id *)objc_getProperty((id)a1, v16, 88LL, 1);
    id v20 = v18;
    if (v18)
    {
      id v21 = objc_getProperty(v18, v19, 64LL, 1);
      [v21 UUIDString];
      double v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 setObject:v22 forKeyedSubscript:@"_kCFNTimingDataConnectionUUID"];

      if (*(_BYTE *)(a1 + 9))
      {
        connectionTimingFromMetrics((__CFN_ConnectionMetrics *)&v57, v20);
        double v23 = v57;
        [MEMORY[0x189607968] numberWithDouble:v57];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v2 setObject:v24 forKeyedSubscript:@"_kCFNTimingDataDomainLookupStart"];

        LODWORD(v25) = v59;
        [MEMORY[0x189607968] numberWithDouble:v23 + (double)v25 / 1000.0];
        unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v2 setObject:v26 forKeyedSubscript:@"_kCFNTimingDataDomainLookupEnd"];

        double v27 = v58;
        [MEMORY[0x189607968] numberWithDouble:v58];
        double v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v2 setObject:v28 forKeyedSubscript:@"_kCFNTimingDataConnectStart"];

        unsigned int v29 = v60;
        [MEMORY[0x189607968] numberWithDouble:v27 + (double)v60 / 1000.0];
        double v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v2 setObject:v30 forKeyedSubscript:@"_kCFNTimingDataConnectEnd"];

        if (v62)
        {
          [MEMORY[0x189607968] numberWithDouble:v27 + (double)(v29 - v61) / 1000.0];
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
          [v2 setObject:v31 forKeyedSubscript:@"_kCFNTimingDataSecureConnectionStart"];
        }
      }

      uint64_t v32 = (nw_endpoint *)v20[17];
      uint64_t v33 = v32;
      if (v32 && nw_endpoint_get_type(v32) == nw_endpoint_type_address)
      {
        -[nw_endpoint description](v33, "description");
        int v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v2 setObject:v34 forKeyedSubscript:@"_kCFNTimingDataLocalAddressAndPort"];
      }

      BOOL v35 = (nw_endpoint *)v20[18];
      id v36 = v35;
      if (v35 && nw_endpoint_get_type(v35) == nw_endpoint_type_address)
      {
        v37 = -[nw_endpoint description](v36, "description");
        [v2 setObject:v37 forKeyedSubscript:@"_kCFNTimingDataRemoteAddressAndPort"];
      }

      if ((*(_BYTE *)(a1 + 224) & 4) != 0)
      {
        unsigned int v39 = (nw_endpoint *)v20[18];
        unsigned int v40 = v39;
        if (v39 && nw_endpoint_get_type(v39) == nw_endpoint_type_address)
        {
          address = nw_endpoint_get_address(v40);
          [MEMORY[0x189603F48] dataWithBytes:address length:address->sa_len];
          unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue();
          [v2 setObject:v42 forKeyedSubscript:@"_kCFNTimingDataConnectionPeerAddress"];
        }

        id v43 = v20[19];
        [v2 setObject:v43 forKeyedSubscript:@"_kCFNTimingDataConnectionInterfaceIdentifier"];
      }

      id v44 = objc_getProperty(v20, v38, 160LL, 1);
      [v2 setObject:v44 forKeyedSubscript:@"_kCFNTimingDataNetworkProtocolName"];

      v63 = @"TFOSuccess";
      [MEMORY[0x189607968] numberWithBool:*((unsigned __int8 *)v20 + 19)];
      unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue();
      _30[0] = v45;
      [MEMORY[0x189603F68] dictionaryWithObjects:_30 forKeys:&v63 count:1];
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 setObject:v46 forKeyedSubscript:@"_kCFNTimingDataTCPFastOpenStats"];

      uint64_t v47 = *(void *)(a1 + 224);
      if ((v47 & 0x80) != 0)
      {
        id v48 = *(id *)(a1 + 248);
        [v2 setObject:v48 forKeyedSubscript:@"_kCFNTimingDataTCPInfoAtStart"];

        id v49 = *(id *)(a1 + 256);
        [v2 setObject:v49 forKeyedSubscript:@"_kCFNTimingDataTCPInfoAtStop"];

        uint64_t v47 = *(void *)(a1 + 224);
      }

      if ((v47 & 2) != 0)
      {
        id v50 = *(id *)(a1 + 248);
        +[__CFN_TransactionMetrics nstatCountsFromTCPInfo:]((uint64_t)&OBJC_CLASS_____CFN_TransactionMetrics, v50);
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();
        [v2 setObject:v51 forKeyedSubscript:@"_kCFNTimingDataConnectionStartTimeCounts"];

        id v52 = *(id *)(a1 + 256);
        v53 = +[__CFN_TransactionMetrics nstatCountsFromTCPInfo:]((uint64_t)&OBJC_CLASS_____CFN_TransactionMetrics, v52);
        [v2 setObject:v53 forKeyedSubscript:@"_kCFNTimingDataConnectionStopTimeCounts"];

        uint64_t v47 = *(void *)(a1 + 224);
      }

      if ((v47 & 0x20) != 0)
      {
        id v54 = *(id *)(a1 + 264);
        [v2 setObject:v54 forKeyedSubscript:@"_kCFNTimingDataSubflowCountsAtStart"];

        id v55 = *(id *)(a1 + 272);
        [v2 setObject:v55 forKeyedSubscript:@"_kCFNTimingDataSubflowCountsAtStop"];
      }
    }
  }

  else
  {
    v2 = 0LL;
  }

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_UUID forKey:@"UUID"];
  [v5 encodeObject:self->_request forKey:@"request"];
  [v5 encodeObject:self->_transferredRequest forKey:@"transferredRequest"];
  [v5 encodeObject:self->_cachedResponse forKey:@"cachedResponse"];
  [v5 encodeObject:self->_lastResponse forKey:@"lastResponse"];
  [v5 encodeObject:self->_connectionMetrics forKey:@"connectionMetrics"];
  [v5 encodeBool:self->_scheduledOriginLoad forKey:@"scheduledOriginLoad"];
  [v5 encodeBool:self->_firstOnConnection forKey:@"firstOnConnection"];
  [v5 encodeInt64:self->_requestHeaderSize forKey:@"requestHeaderSize"];
  [v5 encodeInt64:self->_requestBodySize forKey:@"requestBodySize"];
  [v5 encodeInt64:self->_requestBodyTransferSize forKey:@"requestBodyTransferSize"];
  [v5 encodeInt64:self->_responseHeaderSize forKey:@"responseHeaderSize"];
  [v5 encodeInt64:self->_responseBodySize forKey:@"responseBodySize"];
  [v5 encodeInt64:self->_responseBodyTransferSize forKey:@"responseBodyTransferSize"];
  [v5 encodeDouble:@"beginTime" forKey:self->_beginTime];
  [v5 encodeDouble:@"endTime" forKey:self->_endTime];
  [v5 encodeDouble:@"cacheLookupBeginTime" forKey:self->_cacheLookupBeginTime];
  [v5 encodeDouble:@"cacheLookupEndTime" forKey:self->_cacheLookupEndTime];
  [v5 encodeDouble:@"requestBeginTime" forKey:self->_requestBeginTime];
  [v5 encodeDouble:@"requestEndTime" forKey:self->_requestEndTime];
  [v5 encodeDouble:@"responseBeginTime" forKey:self->_responseBeginTime];
  [v5 encodeDouble:@"responseEndTime" forKey:self->_responseEndTime];
  [v5 encodeInteger:self->_endReason forKey:@"endReason"];
  [v5 encodeBool:self->_pushed forKey:@"pushed"];
  [v5 encodeInteger:self->_schedulingTier forKey:@"schedulingTier"];
  [v5 encodeBool:self->_APSRelayAttempted forKey:@"APSRelayAttempted"];
  [v5 encodeBool:self->_APSRelaySucceeded forKey:@"APSRelaySucceeded"];
  [v5 encodeInt64:self->_options forKey:@"options"];
  [v5 encodeDouble:@"reusedAfterTime" forKey:self->_reusedAfterTime];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_dataTransferReport)
  {
    id v4 = (void *)nw_data_transfer_report_copy_dictionary();
    [v5 encodeXPCObject:v4 forKey:@"dataTransferReport"];
  }
}

- (__CFN_TransactionMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS_____CFN_TransactionMetrics;
  id v5 = -[__CFN_TransactionMetrics init](&v31, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"request"];
    request = v5->_request;
    v5->_request = (NSURLRequest *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferredRequest"];
    transferredRequest = v5->_transferredRequest;
    v5->_transferredRequest = (NSURLRequest *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cachedResponse"];
    cachedResponse = v5->_cachedResponse;
    v5->_cachedResponse = (NSURLResponse *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastResponse"];
    lastResponse = v5->_lastResponse;
    v5->_lastResponse = (NSURLResponse *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectionMetrics"];
    connectionMetrics = v5->_connectionMetrics;
    v5->_connectionMetrics = (__CFN_ConnectionMetrics *)v16;

    v5->_scheduledOriginLoad = [v4 decodeBoolForKey:@"scheduledOriginLoad"];
    v5->_firstOnConnection = [v4 decodeBoolForKey:@"firstOnConnection"];
    v5->_requestHeaderSize = [v4 decodeInt64ForKey:@"requestHeaderSize"];
    v5->_requestBodySize = [v4 decodeInt64ForKey:@"requestBodySize"];
    v5->_requestBodyTransferSize = [v4 decodeInt64ForKey:@"requestBodyTransferSize"];
    v5->_responseHeaderSize = [v4 decodeInt64ForKey:@"responseHeaderSize"];
    v5->_responseBodySize = [v4 decodeInt64ForKey:@"responseBodySize"];
    v5->_responseBodyTransferSize = [v4 decodeInt64ForKey:@"responseBodyTransferSize"];
    [v4 decodeDoubleForKey:@"beginTime"];
    v5->_beginTime = v18;
    [v4 decodeDoubleForKey:@"endTime"];
    v5->_endTime = v19;
    [v4 decodeDoubleForKey:@"cacheLookupBeginTime"];
    v5->_cacheLookupBeginTime = v20;
    [v4 decodeDoubleForKey:@"cacheLookupEndTime"];
    v5->_cacheLookupEndTime = v21;
    [v4 decodeDoubleForKey:@"requestBeginTime"];
    v5->_requestBeginTime = v22;
    [v4 decodeDoubleForKey:@"requestEndTime"];
    v5->_requestEndTime = v23;
    [v4 decodeDoubleForKey:@"responseBeginTime"];
    v5->_responseBeginTime = v24;
    [v4 decodeDoubleForKey:@"responseEndTime"];
    v5->_responseEndTime = v25;
    v5->_endReason = [v4 decodeIntegerForKey:@"endReason"];
    v5->_pushed = [v4 decodeBoolForKey:@"pushed"];
    v5->_schedulingTier = [v4 decodeIntegerForKey:@"schedulingTier"];
    v5->_APSRelayAttempted = [v4 decodeBoolForKey:@"APSRelayAttempted"];
    v5->_APSRelaySucceeded = [v4 decodeBoolForKey:@"APSRelaySucceeded"];
    v5->_options = [v4 decodeInt64ForKey:@"options"];
    [v4 decodeDoubleForKey:@"_reusedAfterTime"];
    v5->_reusedAfterTime = v26;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      [v4 decodeXPCObjectOfType:MEMORY[0x1895F9250] forKey:@"dataTransferReport"];
      double v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        uint64_t v28 = nw_data_transfer_report_create_from_dictionary();
        dataTransferReport = v5->_dataTransferReport;
        v5->_dataTransferReport = (OS_nw_data_transfer_report *)v28;
      }
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__CFN_ConnectionMetrics)_daemon_connectionMetrics
{
  if (self) {
    self = (__CFN_TransactionMetrics *)objc_getProperty(self, a2, 88LL, 1);
  }
  return (__CFN_ConnectionMetrics *)self;
}

- (int64_t)_daemon_requestHeaderSize
{
  return self->_requestHeaderSize;
}

- (int64_t)_daemon_requestBodyTransferSize
{
  return self->_requestBodyTransferSize;
}

- (int64_t)_daemon_responseHeaderSize
{
  return self->_responseHeaderSize;
}

- (int64_t)_daemon_responseBodyTransferSize
{
  return self->_responseBodyTransferSize;
}

- (void)requestBeginOnConnection:(double)a3 reusedAfterTime:
{
  id v13 = a2;
  if (a1)
  {
    *(CFAbsoluteTime *)(a1 + 176) = CFAbsoluteTimeGetCurrent();
    *(double *)(a1 + 232) = a3;
    uint64_t v6 = *(void *)(a1 + 224);
    if ((v6 & 0x82) != 0)
    {
      id v7 = (os_unfair_lock_s *)objc_getProperty((id)a1, v5, 88LL, 1);
      uint64_t v8 = -[__CFN_ConnectionMetrics tcpInfo](v7);
      id v9 = *(void **)(a1 + 248);
      *(void *)(a1 + 248) = v8;

      uint64_t v6 = *(void *)(a1 + 224);
    }

    if ((v6 & 0x20) != 0)
    {
      uint64_t v10 = (os_unfair_lock_s *)objc_getProperty((id)a1, v5, 88LL, 1);
      uint64_t v11 = -[__CFN_ConnectionMetrics subflowCounts](v10);
      uint64_t v12 = *(void **)(a1 + 264);
      *(void *)(a1 + 264) = v11;
    }
  }
}

@end